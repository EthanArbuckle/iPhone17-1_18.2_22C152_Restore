@interface BWMultiStreamCameraSourceNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)firmwareStillImageDimensionsAfterOverscanCropping;
- ($2825F4736939C4A6D3AD43837233062D)ultraHighResSensorRawStillImageOutputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)zoomBasedQSubSensorRawStillImageOutputDimensions;
- (BOOL)_serviceZoomForPTS:(uint64_t)a3 synchronizedStreamsCaptureID:;
- (BOOL)emitsFramesWhileStopping;
- (BOOL)hardwareDepthFilteringEnabled;
- (BOOL)keepISPStreamingWhenStopping;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (BWDetectedFacesFilterDelegate)detectedFacesFilterDelegate;
- (BWFigVideoCaptureStream)captureStream;
- (BWMultiStreamCameraSourceNode)initWithCaptureDevice:(id)a3 captureStream:(id)a4;
- (BWMultiStreamCameraSourceNodeConfiguration)configuration;
- (BWNodeOutput)depthOutput;
- (BWNodeOutput)detectedObjectsOutput;
- (BWNodeOutput)eyeReliefStatusOutput;
- (BWNodeOutput)keypointDescriptorDataOutput;
- (BWNodeOutput)lightSourceMaskOutput;
- (BWNodeOutput)pointCloudOutput;
- (BWNodeOutput)preLTMThumbnailOutput;
- (BWNodeOutput)previewOutput;
- (BWNodeOutput)secureDetectedObjectsOutput;
- (BWNodeOutput)semanticMasksOutput;
- (BWNodeOutput)stillImageOutput;
- (BWNodeOutput)stillImageSensorRawOutput;
- (BWNodeOutput)trackedFacesOutput;
- (BWNodeOutput)videoCaptureOutput;
- (BWPixelBufferPool)_allocateOrReuseBufferPoolsFromSourceNodeOutput:(uint64_t)a3 forAttachedMedia:(void *)a4 onNodeOutput:(void *)a5 outputConfiguration:(char)a6 shareBufferPools:;
- (BWPointCloudFormatRequirements)_videoFormatRequirementsForKeypointDescriptorDataOutput;
- (BWPointCloudFormatRequirements)_videoFormatRequirementsForPointCloudOutput;
- (BWStats)_tallyCompressedIOSurfaceStatsForRawForSBuf:(BWStats *)result;
- (BWVideoFormatRequirements)_videoFormatRequirementsForDepthOutput;
- (BWVideoFormatRequirements)_videoFormatRequirementsForLightSourceMaskOutput;
- (BWVideoFormatRequirements)_videoFormatRequirementsForOutputID:(void *)a3 configuration:;
- (BWVideoFormatRequirements)_videoFormatRequirementsForPostColorProcessingThumbnailOutput;
- (BWVideoFormatRequirements)_videoFormatRequirementsForPreLTMThumbnailOutput;
- (BWVideoFormatRequirements)_videoFormatRequirementsForSemanticMaskType:(uint64_t)a1;
- (CMAttachmentBearerRef)_createFocusPixelDataSampleBufferFromVideoSampleBuffer:(CMAttachmentBearerRef)result;
- (CMSampleBufferRef)_createDepthDataSampleBufferFromVideoSampleBuffer:(CMSampleBufferRef)result;
- (NSString)portType;
- (OpaqueCMClock)clock;
- (double)_applyNondisruptiveSwitchingZoomFactorAndSensorCenterOffsetToPreviewShift:(double)a3 forSampleBuffer:(double)a4 outputIndex:;
- (double)_bravoShiftMitigationCropOffset:(float)a3 totalZoom:(double)a4 totalConfiguredOverscan:(double)a5 totalAvailableOverscan:(double)a6;
- (double)_maxISPZoomFactorForOutputConfiguration:(uint64_t)a1;
- (double)_overscanWithFOVSacrifice;
- (double)_totalAvailableOverscan;
- (double)_updateZoomForOutputIndex:(opaqueCMSampleBuffer *)a3 sampleBuffer:(float)a4 additionalScaleFactor:;
- (float)_ispAppliedZoomFactorFromSampleBufferMetadataDictionary:(int)a3 outputIndex:;
- (float)geometricDistortionCorrectionStrengthOnStreamingOutputs;
- (id)_colorInfoDictionaryForStreamOutputID:(id *)result;
- (id)_outputConfigurationForStreamingOutputID:(void *)a3 nodeOutput:;
- (id)_outputConfigurationsForAllOutputs;
- (id)_supportedPixelFormatsForOutputID:(id *)result;
- (id)_verifyColorSpacePropertiesForAllOutputs;
- (id)colorInfoForNonColorManagedDevicesForOutputID:(id *)result;
- (id)colorInfoForOutput:(id)a3;
- (id)nodeSubType;
- (int)allocateOrReuseBufferPoolsFromSourceNode:(id)a3;
- (int)colorSpaceProperties;
- (int)configure:(id)a3;
- (int)prepareForStillImageCaptureWithFirmwareStillImageOutputRetainedBufferCountOverride:(int)a3 clientBracketCount:(int)a4 enableSushiRawAttachmentOption:(BOOL)a5;
- (int)secureMetadataOutputConfigurationDidChange:(id)a3;
- (uint64_t)_bringStreamUpToDate;
- (uint64_t)_bytesPerOutputBufferForOutputConfiguration:(void *)a3 outputID:;
- (uint64_t)_colorSpacePropertiesForOuputID:(uint64_t)result;
- (uint64_t)_computeRetainedBufferCountForOutputStorage:(uint64_t)result;
- (uint64_t)_createAndStartFrameCounterForOutputIndexIfNecessary:(uint64_t)result;
- (uint64_t)_finalPreviewOutputDimensions;
- (uint64_t)_firmwareStillImageOutputRetainedBufferCountForClientBracketCount:(uint64_t)result;
- (uint64_t)_flushOutRemainingBuffers;
- (uint64_t)_isVideoCaptureOutputSupportedByOutputID:(uint64_t)result;
- (uint64_t)_markPrimaryStreamingOutput;
- (uint64_t)_preferIntermediateTapOverSecondaryScalerForPreviewOutputBasedOnBandwidth;
- (uint64_t)_preferPrimaryScalerOverIntermediateTapForVideoOutputBasedOnBandwidth;
- (uint64_t)_prependPreservedMotionDataToSampleBuffer:(uint64_t)result;
- (uint64_t)_preserveMotionDataForSoonToBeDroppedSampleBuffer:(uint64_t)result;
- (uint64_t)_primaryScalerIsAvailable;
- (uint64_t)_registerForStreamNotifications;
- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsData:(uint64_t)result;
- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsDataForRaw;
- (uint64_t)_retrieveCameraCharacterizationDataForCameraIntrinsicMatrixDelivery;
- (uint64_t)_scalerChainingEnabled;
- (uint64_t)_scalingRequiredForOutput:(uint64_t)result;
- (uint64_t)_secondaryScalerIsAvailable;
- (uint64_t)_secondaryScalerSupportsVideoCaptureDimensions;
- (uint64_t)_setStreamOutputsEnabled:(int)a3 streamingOutputs:(int)a4 onDemandStillOutputs:;
- (uint64_t)_shouldEnableStillImageOutput;
- (uint64_t)_shouldEnableStreamCaptureOutputForNodeOutput:(uint64_t)result;
- (uint64_t)_stillImageColorSpaceProperties;
- (uint64_t)_ultraHighResolutionNondisruptiveStreamingFormatIndex;
- (uint64_t)_unregisterFromStreamNotifications;
- (uint64_t)_unregisterStreamOutputHandlers;
- (uint64_t)_updateActiveNondisruptiveSwitchingFormatIndices;
- (uint64_t)_updateBaseZoomFactorAfterGDCFromOutputConfigurations:(uint64_t)result;
- (uint64_t)_updateColorSpaceProperties;
- (uint64_t)_updateDepthConfiguration;
- (uint64_t)_updateDepthSettings;
- (uint64_t)_updateDolbyVisionMetadataOutputEnabledConfiguration;
- (uint64_t)_updateDutyCycleMetadataCacheForActiveFormatIndex:(uint64_t)result;
- (uint64_t)_updateFormatIndex;
- (uint64_t)_updateGDCStrengthAndBaseZoomFactorAfterGDC;
- (uint64_t)_updateGDCStrengthForOutputConfigurations:(void *)a3 updatedOutputConfigurations:;
- (uint64_t)_updateMetadataConfigurations;
- (uint64_t)_updateObjectDetectionMetadataRegistration;
- (uint64_t)_updateOutputConfigurations;
- (uint64_t)_updateOutputIDMappingsForOnDemandStills;
- (uint64_t)_updateOutputIDMappingsForStreamingOutputs;
- (uint64_t)_updateOutputIDs;
- (uint64_t)_updateOutputRequirements;
- (uint64_t)_updateOutputStorageWithSecureMetadataOutputConfiguration:(char)a3 propagateToNodeOutputs:;
- (uint64_t)_updateOutputsStorage;
- (uint64_t)_updateOverscanReservedInISPZoom;
- (uint64_t)_updateStreamOutputConfigurationsWithPowerOptimizedVISOverscanEnabled:(uint64_t)result;
- (uint64_t)_updateStreamingOutputStorageForOutputID:(int)a3 isVideoCaptureOutput:(uint64_t)a4 nodeOutput:;
- (uint64_t)_updateVideoCaptureOutputFlags;
- (uint64_t)_verifyColorSpacePropertiesForOutputID:(void *)a3 matchVideoOutputsColorInfo:;
- (uint64_t)_videoCaptureOutputDimensionsValidForDepth;
- (unint64_t)_calculatePreviewDimensionsForShiftMitigation;
- (unint64_t)_calculateVideoCaptureDimensions;
- (unint64_t)_calculateVideoCaptureDimensionsWithVISOverscan:(double)a3;
- (unint64_t)_calculateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping:(void *)a3 nondisruptiveSwitchingFormatIndicesByZoomfactorSIFRNonBinnedOut:(int)a4 ultraHighResolutionNondisruptiveStreamingFormatIndex:;
- (unint64_t)_outputDimensionsForOutputID:(void *)a3 outputConfiguration:;
- (unint64_t)_updateBufferPoolSharingProperties;
- (unint64_t)_updateNondisruptiveSwitchingZoomFactors:(unint64_t)result;
- (unint64_t)infraredProjectorUptimeInUsForHighPowerSparse;
- (unint64_t)infraredProjectorUptimeInUsForLowPowerSparse;
- (unint64_t)videoCaptureDimensionsForColorspace;
- (void)_HDRImageStatisticsDictFromMetadata:(uint64_t)a1;
- (void)_addCaptureStreamAttachmentsToSampleBuffer:(uint64_t)a1;
- (void)_addDolbyVisionMetadataToPreviewPixelBufferForSampleBuffer:(uint64_t)a3 nodeOutput:;
- (void)_addMetadataUsedByVideoEncoderToPixelBufferForSampleBuffer:(uint64_t)a3 nodeOutput:;
- (void)_asynchronouslyPreallocateBufferPools;
- (void)_attachCameraIntrinsicMatrixToSampleBuffer:(int)a3 scaledToVideoBuffer:(int)a4 addToMetadataDictInTotalSensorCoords:;
- (void)_markEndOfLiveOnAllOutputs;
- (void)_nodeOutputsMadeLiveByStreamOutputIndex:(uint64_t)a1;
- (void)_outputConfigurationForStillImageOutputID:(uint64_t)a1;
- (void)_outputConfigurationForStreamingOutputID:(void *)a3 nodeOutput:(double)a4 visOverscan:(double)a5;
- (void)_outputConfigurationsFilterCropRectAndDimensionsOfStreamingOutputs:(uint64_t)a1;
- (void)_outputConfigurationsForAllOutputsWithVISOverscan:(double)a3;
- (void)_prefetchPixelBufferForOutputStorage:(int)a3 numberOfBuffersToFetch:(int)a4 lastEmittedSurfaceID:;
- (void)_propagatePixelBufferAttachment:(void *)a3 sampleBuffer:(uint64_t)a4 attachedMediaKey:(const __CFString *)a5 removeAttachmentKey:(int)a6 resetValidBufferRect:;
- (void)_propagatePixelBufferAttachmentFromSampleBuffer:(CFStringRef)key attachmentKey:(uint64_t)a4 usingAttachedMediaKey:(int)a5 resetValidBufferRect:;
- (void)_reflectStillSampleBufferOnStreamingOutputs:(int)a3 captureType:;
- (void)_registerStreamOutputHandlers;
- (void)_setPreviewShift:(double)a3 previewScaleFactor:(float)a4 previewShiftAtBaseZoom:(double)a5 ispAppliedZoomFactorForCaptureStream:(double)a6;
- (void)_stopAndReleaseFrameCounterForOutputIndexIfNecessary:(uint64_t)a1;
- (void)_tallyCompressedIOSurfaceStatsForSBuf:(uint64_t)a3 outputStorage:;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forOutput:(id)a4;
- (void)makeOutputsLiveIfNeeded;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)requestedZoomFactorChanged:(float)a3;
- (void)setDetectedFacesFilterDelegate:(id)a3;
- (void)setEmitsFramesWhileStopping:(BOOL)a3;
- (void)setKeepISPStreamingWhenStopping:(BOOL)a3;
- (void)setPowerOptimizedVISOverscanEnabled:(BOOL)a3;
- (void)setPreviewShift:(CGPoint)a3 previewScaleFactor:(float)a4 previewShiftAtBaseZoom:(CGPoint)a5;
- (void)startIncrementalPrefetchingOfSourcePoolsIfNecessary;
- (void)updateFormatRequirementsFromSourceNode:(id)a3;
- (void)updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping;
@end

@implementation BWMultiStreamCameraSourceNode

- (BWNodeOutput)depthOutput
{
  return self->_depthOutput;
}

- (BWMultiStreamCameraSourceNode)initWithCaptureDevice:(id)a3 captureStream:(id)a4
{
  v48[5] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)BWMultiStreamCameraSourceNode;
  v6 = [(BWNode *)&v46 init];
  if (v6)
  {
    *((void *)v6 + 12) = a3;
    *((void *)v6 + 13) = a4;
    *((void *)v6 + 14) = (id)[a4 stream];
    *((void *)v6 + 23) = (id)[*((id *)v6 + 13) portType];
    *((_DWORD *)v6 + 48) = [*((id *)v6 + 13) deviceType];
    v6[160] = [*((id *)v6 + 23) isEqualToString:*MEMORY[0x1E4F52E00]];
    if (*((void *)v6 + 12) && *((void *)v6 + 14) && (v7 = (void *)*((void *)v6 + 13)) != 0)
    {
      id v42 = a3;
      *((void *)v6 + 15) = (id)[v7 supportedFormats];
      *((_DWORD *)v6 + 2700) = -1;
      *((_DWORD *)v6 + 44) = BWActiveDeviceTypeFromPortType(*((void **)v6 + 23));
      *((_DWORD *)v6 + 45) = BWCaptureDevicePositionFromPortType(*((void **)v6 + 23));
      -[BWMultiStreamCameraSourceNode _registerStreamOutputHandlers]((uint64_t)v6);
      if (objc_msgSend((id)objc_msgSend(*((id *)v6 + 14), "supportedProperties"), "objectForKeyedSubscript:", @"DeferAdditionOfAttachments")&& !objc_msgSend(*((id *)v6 + 14), "setProperty:value:", @"DeferAdditionOfAttachments", MEMORY[0x1E4F1CC38]))
      {
        v6[140] = 1;
        v8 = [[BWDeferredMetadataCache alloc] initWithCaptureStream:*((void *)v6 + 14) atomicTransactions:0];
        *((void *)v6 + 18) = v8;
        [(BWDeferredMetadataCache *)v8 setNumberOfExpectedSampleBuffersForEachPTS:2];
      }
      *((_DWORD *)v6 + 80) = -1;
      v9 = objc_msgSend((id)objc_msgSend(*((id *)v6 + 13), "stream"), "supportedProperties");
      v6[128] = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F54880]] != 0;
      *((void *)v6 + 19) = dispatch_queue_create("com.apple.bwgraph.source-node-pool-preallocation", 0);
      *((_DWORD *)v6 + 33) = 1065353216;
      [*((id *)v6 + 13) pixelSize];
      if (v10 > 0.0) {
        *((float *)v6 + 33) = 1.0 / v10;
      }
      *((_DWORD *)v6 + 34) = 1065353216;
      objc_msgSend((id)objc_msgSend(*((id *)v6 + 12), "bravoTelephotoCaptureStream"), "pixelSize");
      if (v11 > 0.0) {
        *((float *)v6 + 34) = 1.0 / v11;
      }
      -[BWMultiStreamCameraSourceNode _updateBufferPoolSharingProperties]((unint64_t)v6);
      v6[10680] = [*((id *)v6 + 13) usePinholeCameraFocalLengthInIntrinsicMatrixCalculation];
      v12 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v12 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v12 setName:@"Preview"];
      [(BWNodeOutput *)v12 setDropsSampleBuffersWithUnexpectedPTS:1];
      [v6 addOutput:v12];
      *((void *)v6 + 25) = v12;

      v13 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v13 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v13 setName:@"VideoCapture"];
      [(BWNodeOutput *)v13 setDropsSampleBuffersWithUnexpectedPTS:1];
      [v6 addOutput:v13];
      *((void *)v6 + 26) = v13;

      v14 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v14 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v14 setName:@"StillImage"];
      [(BWNodeOutput *)v14 setDropsSampleBuffersWithUnexpectedPTS:0];
      [v6 addOutput:v14];
      *((void *)v6 + 27) = v14;

      v15 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v15 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v15 setName:@"StillImageSensorRaw"];
      [(BWNodeOutput *)v15 setDropsSampleBuffersWithUnexpectedPTS:0];
      [v6 addOutput:v15];
      *((void *)v6 + 28) = v15;

      v16 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v6];
      [(BWNodeOutput *)v16 setName:@"DetectedObjects"];
      [(BWNodeOutput *)v16 setDropsSampleBuffersWithUnexpectedPTS:1];
      uint64_t v17 = *MEMORY[0x1E4F1F138];
      uint64_t v18 = *MEMORY[0x1E4F1F140];
      v48[0] = *MEMORY[0x1E4F1F138];
      v48[1] = v18;
      uint64_t v19 = *MEMORY[0x1E4F1F128];
      uint64_t v20 = *MEMORY[0x1E4F1F130];
      v48[2] = *MEMORY[0x1E4F1F128];
      v48[3] = v20;
      v48[4] = *MEMORY[0x1E4F1F148];
      -[BWNodeOutput setFormat:](v16, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:5]));
      [v6 addOutput:v16];
      *((void *)v6 + 29) = v16;

      *((void *)v6 + 1361) = [[BWDetectedFacesRingBuffer alloc] initWithDepth:3];
      v21 = (void *)[*((id *)v6 + 14) supportedProperties];
      if ([v21 objectForKeyedSubscript:*MEMORY[0x1E4F54B18]]) {
        *((void *)v6 + 1362) = [[BWDetectedObjectsInfoRingBuffer alloc] initWithRingBufferDepth:3];
      }
      [*((id *)v6 + 14) setPropertyIfSupported:*MEMORY[0x1E4F54918] value:&unk_1EFB00DB8];
      v22 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v6];
      [(BWNodeOutput *)v22 setName:@"SecureDetectedObjects"];
      [(BWNodeOutput *)v22 setDropsSampleBuffersWithUnexpectedPTS:1];
      v47[0] = v17;
      v47[1] = v18;
      v47[2] = v19;
      v47[3] = v20;
      -[BWNodeOutput setFormat:](v22, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4]));
      [v6 addOutput:v22];
      *((void *)v6 + 30) = v22;

      v23 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v23 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v23 setName:@"Depth"];
      [(BWNodeOutput *)v23 setDropsSampleBuffersWithUnexpectedPTS:1];
      [v6 addOutput:v23];
      *((void *)v6 + 31) = v23;

      v24 = [[BWNodeOutput alloc] initWithMediaType:1885564004 node:v6];
      [(BWNodeOutput *)v24 setProvidesDataBufferPool:0];
      [(BWNodeOutput *)v24 setName:@"PointCloud"];
      [(BWNodeOutput *)v24 setDropsSampleBuffersWithUnexpectedPTS:1];
      [v6 addOutput:v24];
      *((void *)v6 + 32) = v24;

      v25 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v25 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v25 setName:@"LightSourceMask"];
      [(BWNodeOutput *)v25 setDropsSampleBuffersWithUnexpectedPTS:1];
      [v6 addOutput:v25];
      *((void *)v6 + 33) = v25;

      v26 = [[BWNodeOutput alloc] initWithMediaType:1885564004 node:v6];
      [(BWNodeOutput *)v26 setProvidesDataBufferPool:0];
      [(BWNodeOutput *)v26 setName:@"KeypointDescriptorData"];
      [(BWNodeOutput *)v26 setDropsSampleBuffersWithUnexpectedPTS:1];
      [v6 addOutput:v26];
      *((void *)v6 + 34) = v26;

      v27 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v27 setName:@"SemanticMasks"];
      [(BWNodeOutput *)v27 setDropsSampleBuffersWithUnexpectedPTS:0];
      [v6 addOutput:v27];
      *((void *)v6 + 35) = v27;

      v28 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v6];
      [(BWNodeOutput *)v28 setName:@"EyeReliefStatus"];
      [(BWNodeOutput *)v28 setDropsSampleBuffersWithUnexpectedPTS:1];
      [(BWNodeOutput *)v28 setFormat:+[BWMetadataObjectFormat formatWithMetadataIdentifiers:0]];
      [v6 addOutput:v28];
      *((void *)v6 + 36) = v28;

      v29 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
      [(BWNodeOutput *)v29 setProvidesPixelBufferPool:0];
      [(BWNodeOutput *)v29 setName:@"PreLTMThumbnail"];
      [(BWNodeOutput *)v29 setDropsSampleBuffersWithUnexpectedPTS:1];
      [v6 addOutput:v29];
      *((void *)v6 + 38) = v29;

      v30 = FigDispatchQueueCreateWithPriority();
      dispatch_queue_set_specific(v30, @"BWFigCaptureStreamSetPropertySetPropertyAsyncQueue", (void *)[v42 streamSetPropertyAsyncQueue], 0);
      CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      uint64_t v32 = 20;
      v33 = v6;
      do
      {
        *((void *)v33 + 52) = v30;
        CMSimpleQueueCreate(v31, 30, (CMSimpleQueueRef *)v33 + 51);
        FigSimpleQueueSetQueueIsFullErrorLoggingEnabled();
        v33 += 512;
        --v32;
      }
      while (v32);
      *((void *)v6 + 53) = multiStreamCameraSourceNode_primaryScalerServiceQueueCallback;
      *((void *)v6 + 117) = multiStreamCameraSourceNode_secondaryScalerServiceQueueCallback;
      *((void *)v6 + 181) = multiStreamCameraSourceNode_intermediateTapServiceQueueCallback;
      *((void *)v6 + 565) = multiStreamCameraSourceNode_rawServiceQueueCallback;
      *((void *)v6 + 245) = multiStreamCameraSourceNode_stillImageServiceQueueCallback;
      *((void *)v6 + 309) = multiStreamCameraSourceNode_stillImageIntermediateTapServiceQueueCallback;
      *((void *)v6 + 373) = multiStreamCameraSourceNode_stillImageRawServiceQueueCallback;
      *((void *)v6 + 437) = multiStreamCameraSourceNode_depthServiceQueueCallback;
      *((void *)v6 + 501) = multiStreamCameraSourceNode_pointCloudServiceQueueCallback;
      *((void *)v6 + 629) = multiStreamCameraSourceNode_lightSourceMaskServiceQueueCallback;
      *((void *)v6 + 693) = multiStreamCameraSourceNode_keypointDescriptorDataServiceQueueCallback;
      *((void *)v6 + 757) = multiStreamCameraSourceNode_semanticMasksServiceQueueCallback;
      *((void *)v6 + 821) = multiStreamCameraSourceNode_secureDetectedObjectsServiceQueueCallback;
      *((void *)v6 + 885) = multiStreamCameraSourceNode_secureEyeReliefStatusServiceQueueCallback;
      *((void *)v6 + 1205) = multiStreamCameraSourceNode_preLTMThumbnailServiceQueueCallback;

      CGPoint v43 = (CGPoint)*MEMORY[0x1E4F1DAD8];
      *(_OWORD *)(v6 + 10968) = *MEMORY[0x1E4F1DAD8];
      *((_DWORD *)v6 + 2746) = 1065353216;
      *((_DWORD *)v6 + 2747) = 0;
      v6[379] = 0;
      v6[11065] = 1;
      v6[11066] = 1;
      *((void *)v6 + 1390) = 0x3FD3333333333333;
      v6[11128] = 1;
      v6[11129] = 0;
      v6[11130] = 1;
      if ([*((id *)v6 + 23) isEqualToString:*MEMORY[0x1E4F52DE8]])
      {
        if ([*((id *)v6 + 12) isBravoVariant])
        {
          CFDictionaryRef v34 = (const __CFDictionary *)[*((id *)v6 + 14) getPropertyIfSupported:*MEMORY[0x1E4F54B20] error:0];
          uint64_t v35 = [*((id *)v6 + 14) getPropertyIfSupported:*MEMORY[0x1E4F54B28] error:0];
          if (v34)
          {
            CFDictionaryRef v36 = (const __CFDictionary *)v35;
            if (v35)
            {
              CGPoint v44 = v43;
              CGPoint point = v43;
              CGPointMakeWithDictionaryRepresentation(v34, &point);
              CGPointMakeWithDictionaryRepresentation(v36, &v44);
              double x = point.x;
              double y = point.y;
              double v40 = v44.x;
              double v39 = v44.y;
              if (point.x != v44.x || point.y != v44.y)
              {
                v6[11042] = 1;
                *((double *)v6 + 1381) = v40 - x;
                *((double *)v6 + 1382) = v39 - y;
              }
            }
          }
        }
      }
      *((_DWORD *)v6 + 2783) = 1065353216;
      v6[10881] = 1;
    }
    else
    {

      return 0;
    }
  }
  return (BWMultiStreamCameraSourceNode *)v6;
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputEnabled]&& (self->_videoCaptureOutput == a4 || self->_stillImageOutput == a4))
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "pixelFormat");
    outputsStorage = self->_outputsStorage;
    for (uint64_t i = 0x7FFFFFFFFFFFECLL; i * 512; ++i)
    {
      if ((outputsStorage[i + 20].flags & 3) != 0)
      {
        nodeOutput = outputsStorage[i + 20].nodeOutput;
        if (nodeOutput == a4)
        {
          float v11 = [(BWNodeOutput *)self->_stillImageOutput formatRequirements];
          v12[0] = [NSNumber numberWithUnsignedInt:v6];
          -[BWFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1]);
          return;
        }
        if (nodeOutput) {
          BOOL v10 = self->_stillImageOutput == a4;
        }
        else {
          BOOL v10 = 0;
        }
        if (v10 && ![(BWNodeOutput *)nodeOutput videoFormat]) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Internal inconsistency, still image output's format was resolved before its driving streaming output's format was resolved"), 0 reason userInfo]);
        }
      }
    }
  }
}

- (unint64_t)_updateBufferPoolSharingProperties
{
  if (result)
  {
    unint64_t v1 = result;
    if (![*(id *)(result + 96) isBravoVariant]
      || (uint64_t v2 = *(void *)(v1 + 104), v2 == [*(id *)(v1 + 96) captureStream]))
    {
      char v4 = 0;
      char v3 = 0;
    }
    else
    {
      if ([*(id *)(v1 + 312) streamingRequiredWhenConfiguredAsSlave]) {
        char v3 = 0;
      }
      else {
        char v3 = [*(id *)(v1 + 312) visionDataRequiredWhenConfiguredAsSlave] ^ 1;
      }
      char v4 = 1;
    }
    *(unsigned char *)(v1 + 376) = v3;
    result = [*(id *)(v1 + 96) overCaptureEnabled];
    if (result)
    {
      char v5 = *(unsigned char *)(v1 + 376);
      if (v5)
      {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "captureStreams"), "indexOfObject:", *(void *)(v1 + 104));
        char v5 = result > 1;
      }
      *(unsigned char *)(v1 + 376) = v5;
    }
    *(unsigned char *)(v1 + 377) = v4;
    *(unsigned char *)(v1 + 378) = v4;
  }
  return result;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPreviewShift:(CGPoint)a3 previewScaleFactor:(float)a4 previewShiftAtBaseZoom:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v8 = a3.y;
  double v9 = a3.x;
  if ([(BWFigVideoCaptureDevice *)self->_captureDevice overCaptureEnabled])
  {
    -[BWMultiStreamCameraSourceNode _setPreviewShift:previewScaleFactor:previewShiftAtBaseZoom:ispAppliedZoomFactorForCaptureStream:]((uint64_t)self, v9, v8, a4, x, y, 1.0);
  }
}

- (void)_setPreviewShift:(double)a3 previewScaleFactor:(float)a4 previewShiftAtBaseZoom:(double)a5 ispAppliedZoomFactorForCaptureStream:(double)a6
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 10988));
    *(double *)(a1 + 10968) = a2;
    *(double *)(a1 + 10976) = a3;
    *(float *)(a1 + 10984) = a4;
    double v14 = (float)(a4 / a7);
    double v15 = a2 * v14;
    double v16 = a3 * v14;
    if (([*(id *)(a1 + 96) overCaptureEnabled] & 1) != 0
      || ![*(id *)(a1 + 96) parallaxMitigationBasedOnZoomFactorEnabled]
      || ([*(id *)(a1 + 104) previewShift], vabdd_f64(v17, v15) > 0.01)
      || ([*(id *)(a1 + 104) previewShift], vabdd_f64(v18, v16) > 0.01))
    {
      objc_msgSend(*(id *)(a1 + 104), "setPreviewShift:", v15, v16);
      objc_msgSend(*(id *)(a1 + 104), "setPreviewShiftAtBaseZoom:", a5, a6);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 10988));
  }
}

- (void)_registerStreamOutputHandlers
{
  if (a1)
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3052000000;
    v34[3] = __Block_byref_object_copy__31;
    v34[4] = __Block_byref_object_dispose__31;
    v34[5] = a1;
    uint64_t v2 = *(void **)(a1 + 112);
    uint64_t v3 = *MEMORY[0x1E4F55410];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke;
    v33[3] = &unk_1E5C29BB8;
    v33[4] = v34;
    mscsn_setStreamOutputBufferHandler(v2, v3, v33, 0);
    char v4 = *(void **)(a1 + 112);
    uint64_t v5 = *MEMORY[0x1E4F55420];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_2;
    v32[3] = &unk_1E5C29BB8;
    v32[4] = v34;
    mscsn_setStreamOutputBufferHandler(v4, v5, v32, 0);
    *(unsigned char *)(a1 + 11136) = 1;
    uint64_t v6 = *(void **)(a1 + 112);
    uint64_t v7 = *MEMORY[0x1E4F553F8];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_3;
    v31[3] = &unk_1E5C29BB8;
    v31[4] = v34;
    mscsn_setStreamOutputBufferHandler(v6, v7, v31, 0);
    double v8 = *(void **)(a1 + 112);
    uint64_t v9 = *MEMORY[0x1E4F55418];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_4;
    v30[3] = &unk_1E5C29BB8;
    v30[4] = v34;
    mscsn_setStreamOutputBufferHandler(v8, v9, v30, 0);
    BOOL v10 = *(void **)(a1 + 112);
    uint64_t v11 = *MEMORY[0x1E4F55428];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_5;
    v29[3] = &unk_1E5C29BB8;
    v29[4] = v34;
    mscsn_setStreamOutputBufferHandler(v10, v11, v29, 0);
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "getPropertyIfSupported:error:", @"CompressedStillImageCaptureSupported", 0), "BOOLValue"))
    {
      v12 = *(void **)(a1 + 112);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_6;
      v28[3] = &unk_1E5C29BE0;
      v28[4] = v34;
      mscsn_setStreamOutputBlockBufferHandler(v12, v11, v28);
    }
    v13 = *(void **)(a1 + 112);
    uint64_t v14 = *MEMORY[0x1E4F55430];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_7;
    v27[3] = &unk_1E5C29BB8;
    v27[4] = v34;
    mscsn_setStreamOutputBufferHandler(v13, v14, v27, 0);
    double v15 = *(void **)(a1 + 112);
    uint64_t v16 = *MEMORY[0x1E4F55440];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_8;
    v26[3] = &unk_1E5C29BB8;
    v26[4] = v34;
    mscsn_setStreamOutputBufferHandler(v15, v16, v26, 0);
    double v17 = *(void **)(a1 + 112);
    uint64_t v18 = *MEMORY[0x1E4F553F0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_9;
    v25[3] = &unk_1E5C29BB8;
    v25[4] = v34;
    mscsn_setStreamOutputBufferHandler(v17, v18, v25, 0);
    uint64_t v19 = *(void **)(a1 + 112);
    uint64_t v20 = *MEMORY[0x1E4F55408];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_10;
    v24[3] = &unk_1E5C29BB8;
    v24[4] = v34;
    mscsn_setStreamOutputBufferHandler(v19, v20, 0, v24);
    v21 = *(void **)(a1 + 112);
    uint64_t v22 = *MEMORY[0x1E4F55400];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_11;
    v23[3] = &unk_1E5C29C08;
    v23[4] = v34;
    mscsn_setStreamOutputDictionaryHandler(v21, v22, v23);
    _Block_object_dispose(v34, 8);
  }
}

- (BWPointCloudFormatRequirements)_videoFormatRequirementsForPointCloudOutput
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (void *)[a1[14] getProperty:*MEMORY[0x1E4F54CB8] error:0];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F55408];
  char v4 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F55408]];
  uint64_t v5 = objc_alloc_init(BWPointCloudFormatRequirements);
  -[BWPointCloudFormatRequirements setSupportedDataFormats:](v5, "setSupportedDataFormats:", -[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:](a1, v3));
  -[BWPointCloudFormatRequirements setDataBufferSize:](v5, "setDataBufferSize:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55358]), "intValue"));
  -[BWPointCloudFormatRequirements setMaxPoints:](v5, "setMaxPoints:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55380]), "unsignedLongLongValue"));
  return v5;
}

- (id)_supportedPixelFormatsForOutputID:(id *)result
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    char v4 = (void *)[result[15] objectAtIndexedSubscript:*((int *)result + 80)];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55318]), "objectForKeyedSubscript:", a2);
    uint64_t v6 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F55498]];
    uint64_t v7 = [v3[39] clientVideoFormat];
    int IsFullRange = FigCapturePixelFormatIsFullRange(v7);
    int IsTenBit = FigCapturePixelFormatIsTenBit(v7);
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v3[39] previewOutputEnabled]) {
      char v10 = [v3[39] videoCaptureOutputEnabled];
    }
    else {
      char v10 = 0;
    }
    int v11 = HIDWORD(v3[64 * (uint64_t)(int)mscsn_streamOutputIndexForOutputID(a2) + 48]);
    if (FigCapturePlatformSupportsUniversalCompression()) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = FigCapturePlatformSupportsHTPC16x8Compression() != 0;
    }
    BOOL v33 = v12;
    BOOL v35 = FigCapturePlatformSupportsUniversalLossyCompression() != 0;
    if (([a2 isEqualToString:*MEMORY[0x1E4F55428]] & 1) != 0
      || [a2 isEqualToString:*MEMORY[0x1E4F55430]])
    {
      int IsTenBit = [v3[39] stillImageOutputRequires10BitPixelFormat];
      int v13 = [v3[39] stillImageMaxLossyCompressionLevel];
      int v14 = 0;
      int IsFullRange = 1;
    }
    else
    {
      if ([a2 isEqualToString:v3[1346]]) {
        int v14 = FigCapturePixelFormatIs422(v7);
      }
      else {
        int v14 = 0;
      }
      if (([v3[39] faceTrackingEnabled] & 1) != 0
        || objc_msgSend((id)objc_msgSend(v3[39], "visionDataConfiguration"), "count"))
      {
        BOOL v33 = 0;
        BOOL v35 = 0;
      }
      int v13 = 3;
    }
    if ([a2 isEqualToString:*MEMORY[0x1E4F55440]])
    {
      if (!*((unsigned char *)v3 + 160))
      {
        uint64_t v15 = [v3[12] sensorRawPixelFormat];
        if (!objc_msgSend(v6, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v15)))return (id *)v34; {
        uint64_t v16 = NSNumber;
        }
        uint64_t v17 = v15;
LABEL_25:
        uint64_t v18 = [v16 numberWithUnsignedInt:v17];
LABEL_29:
        [v34 addObject:v18];
        return (id *)v34;
      }
LABEL_28:
      uint64_t v18 = [v6 firstObject];
      goto LABEL_29;
    }
    if ([a2 isEqualToString:*MEMORY[0x1E4F55408]])
    {
      if (!objc_msgSend(v6, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7)))return (id *)v34; {
      uint64_t v16 = NSNumber;
      }
      uint64_t v17 = v7;
      goto LABEL_25;
    }
    if ([a2 isEqualToString:*MEMORY[0x1E4F55418]])
    {
      if (!*((unsigned char *)v3 + 160)) {
        return (id *)v34;
      }
      goto LABEL_28;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v19 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v19) {
      return (id *)v34;
    }
    uint64_t v20 = v19;
    BOOL v21 = (v11 & 3) == 0;
    uint64_t v22 = *(void *)v37;
    if (v21) {
      char v23 = v10;
    }
    else {
      char v23 = 0;
    }
    char v32 = v23 & v33;
LABEL_37:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v37 != v22) {
        objc_enumerationMutation(v6);
      }
      v25 = *(void **)(*((void *)&v36 + 1) + 8 * v24);
      int v26 = [v25 intValue];
      if (!v26) {
        goto LABEL_58;
      }
      int v27 = v26;
      if (IsFullRange != FigCapturePixelFormatIsFullRange(v26)
        || IsTenBit != FigCapturePixelFormatIsTenBit(v27)
        || v14 != FigCapturePixelFormatIs422(v27))
      {
        goto LABEL_58;
      }
      int CompressionType = FigCapturePixelFormatGetCompressionType(v27);
      if (!CompressionType) {
        break;
      }
      if (CompressionType == 2)
      {
        if (v32) {
          break;
        }
      }
      else if (v33)
      {
        break;
      }
LABEL_58:
      if (v20 == ++v24)
      {
        uint64_t v20 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (!v20) {
          return (id *)v34;
        }
        goto LABEL_37;
      }
    }
    int LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel(v27);
    if (LossyCompressionLevel) {
      int v30 = v35;
    }
    else {
      int v30 = 1;
    }
    if (v30 == 1 && LossyCompressionLevel <= v13) {
      [v34 addObject:v25];
    }
    goto LABEL_58;
  }
  return result;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForOutputID:(void *)a3 configuration:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = objc_alloc_init(BWVideoFormatRequirements);
  if (([a2 isEqualToString:*MEMORY[0x1E4F55438]] & 1) == 0
    && ([a2 isEqualToString:*MEMORY[0x1E4F553F0]] & 1) == 0
    && ([a2 isEqualToString:*MEMORY[0x1E4F55408]] & 1) == 0
    && ([a2 isEqualToString:*MEMORY[0x1E4F55400]] & 1) == 0)
  {
    uint64_t v7 = (int)mscsn_streamOutputIndexForOutputID(a2);
    int64_t v8 = -[BWMultiStreamCameraSourceNode _outputDimensionsForOutputID:outputConfiguration:]((uint64_t)a1, a2, a3);
    [(BWVideoFormatRequirements *)v6 setWidth:(int)v8];
    [(BWVideoFormatRequirements *)v6 setHeight:v8 >> 32];
    uint64_t v9 = (uint64_t)&a1[64 * v7 + 48];
    [(BWVideoFormatRequirements *)v6 setBytesPerRowAlignment:*(int *)(v9 + 108)];
    [(BWVideoFormatRequirements *)v6 setPlaneAlignment:*(int *)(v9 + 112)];
    [(BWVideoFormatRequirements *)v6 setHeightAlignment:16];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", -[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:](a1, a2));
  }
  return v6;
}

- (void)updateFormatRequirementsFromSourceNode:(id)a3
{
  if (a3)
  {
    if (FigCapturePlatformSupportsHTPC16x8Compression()) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = FigCapturePlatformSupportsUniversalCompression() != 0;
    }
    BOOL v23 = v5;
    p_enabled = &self->_outputsStorage[0].enabled;
    uint64_t v7 = -20;
    do
    {
      if (*p_enabled)
      {
        int64_t v8 = *(BWNodeOutput **)(p_enabled + 7);
        uint64_t v9 = [(BWNodeOutput *)v8 formatRequirements];
        if (v8 == self->_previewOutput)
        {
          char v10 = (void *)[a3 previewOutput];
          goto LABEL_13;
        }
        if (v8 == self->_videoCaptureOutput)
        {
          char v10 = (void *)[a3 videoCaptureOutput];
          goto LABEL_13;
        }
        if (v8 == self->_stillImageOutput)
        {
          char v10 = (void *)[a3 stillImageOutput];
LABEL_13:
          int v11 = (void *)[v10 formatRequirements];
          if (v11)
          {
            BOOL v12 = v11;
            unint64_t v13 = [v11 width];
            if (v13 >= [(BWFormatRequirements *)v9 width]
              || (unint64_t v14 = [v12 height], v14 > -[BWFormatRequirements height](v9, "height")))
            {
              uint64_t v15 = [(BWFormatRequirements *)v9 height];
              uint64_t v16 = [(BWFormatRequirements *)v9 width];
              uint64_t v17 = [v12 height];
              uint64_t v18 = [v12 width];
              [(BWFormatRequirements *)v9 setHeight:v17];
              [(BWFormatRequirements *)v9 setWidth:v18];
              if (v7 == -17) {
                char v19 = ![(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration geometricDistortionCorrectionOnStillImageOutputEnabled];
              }
              else {
                char v19 = 0;
              }
              if (v23)
              {
                unint64_t v20 = (unint64_t)(v18 - v16) >> 1;
                BOOL v21 = (void *)[(BWFormatRequirements *)v9 supportedPixelFormats];
                v24[0] = MEMORY[0x1E4F143A8];
                v24[1] = 3221225472;
                v24[2] = __72__BWMultiStreamCameraSourceNode_updateFormatRequirementsFromSourceNode___block_invoke;
                v24[3] = &__block_descriptor_49_e35_B24__0__NSNumber_8__NSDictionary_16l;
                v24[4] = v20;
                void v24[5] = (unint64_t)(v17 - v15) >> 1;
                char v25 = v19;
                -[BWFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", objc_msgSend(v21, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v24)));
              }
            }
          }
        }
      }
      p_enabled += 512;
    }
    while (!__CFADD__(v7++, 1));
  }
}

- (BWNodeOutput)videoCaptureOutput
{
  return self->_videoCaptureOutput;
}

- (BWNodeOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (uint64_t)_updateOutputConfigurations
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = -[BWMultiStreamCameraSourceNode _outputConfigurationsForAllOutputs]((id *)a1);
  if (v2)
  {
    uint64_t v3 = v2;
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", *MEMORY[0x1E4F54880], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "primaryScalerDecoupled")));
      if (v4)
      {
        uint64_t v5 = v4;
LABEL_38:
        FigDebugAssert3();
        return v5;
      }
    }
    else
    {
      uint64_t v6 = (void *)[*(id *)(a1 + 112) supportedProperties];
      uint64_t v7 = *MEMORY[0x1E4F54878];
      if ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F54878]])
      {
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", v7, objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "primaryScalerDecoupled")));
        if (v8)
        {
          uint64_t v5 = v8;
          goto LABEL_38;
        }
      }
    }
    uint64_t v35 = a1;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v9 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      uint64_t v12 = *MEMORY[0x1E4F55400];
      uint64_t v34 = *MEMORY[0x1E4F55388];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v3);
          }
          unint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (([v14 isEqualToString:v12] & 1) == 0)
          {
            int v15 = mscsn_streamOutputIndexForOutputID(v14);
            uint64_t v16 = (void *)[v3 objectForKeyedSubscript:v14];
            uint64_t v17 = v35 + 384;
            uint64_t v18 = v15;
            uint64_t v19 = v35 + 384 + ((uint64_t)v15 << 9);
            *(void *)(v19 + 128) = -[BWMultiStreamCameraSourceNode _outputDimensionsForOutputID:outputConfiguration:](v35, v14, v16);
            FigCFDictionaryGetCGRectIfPresent();
            uint64_t v22 = *(void **)(v19 + 176);
            BOOL v21 = (void *)(v19 + 176);
            unint64_t v20 = v22;
            if (v22)
            {

              void *v21 = 0;
            }
            int v23 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v34), "intValue");
            if (v23)
            {
              int v24 = v23;
              int CompressionType = FigCapturePixelFormatGetCompressionType(v23);
              uint64_t v26 = v17 + (v18 << 9);
              *(_DWORD *)(v26 + 184) = CompressionType;
              if ((CompressionType - 1) <= 1)
              {
                void *v21 = objc_alloc_init(BWStats);
                *(void *)(v26 + 192) = 0;
                *(void *)(v26 + 200) = 0;
              }
              *(_OWORD *)(v26 + 304) = 0u;
              *(_OWORD *)(v26 + 320) = 0u;
              *(_OWORD *)(v26 + 272) = 0u;
              *(_OWORD *)(v26 + 288) = 0u;
              *(_OWORD *)(v26 + 240) = 0u;
              *(_OWORD *)(v26 + 256) = 0u;
              *(_OWORD *)(v26 + 208) = 0u;
              *(_OWORD *)(v26 + 224) = 0u;
              *(_OWORD *)(v26 + 336) = 0u;
              *(_OWORD *)(v26 + 352) = 0u;
              *(_OWORD *)(v26 + 368) = 0u;
              *(_OWORD *)(v26 + 384) = 0u;
              *(_OWORD *)(v26 + 400) = 0u;
              *(_OWORD *)(v26 + 416) = 0u;
              *(_OWORD *)(v26 + 432) = 0u;
              *(_OWORD *)(v26 + 448) = 0u;
              *(_DWORD *)(v26 + 464) = 0;
              uint64_t v27 = MEMORY[0x1E4F1F9F8];
              *(_OWORD *)(v26 + 468) = *MEMORY[0x1E4F1F9F8];
              *(void *)(v26 + 484) = *(void *)(v27 + 16);
              *(unsigned char *)(v26 + 492) = FigCapturePixelFormatIsTenBit(v24);
              *(unsigned char *)(v26 + 493) = FigCapturePixelFormatIs420(v24);
              *(unsigned char *)(v26 + 494) = FigCapturePixelFormatGetLossyCompressionLevel(v24) != 0;
            }
            else
            {
              *(_DWORD *)(v17 + (v18 << 9) + 184) = 0;
            }
          }
        }
        uint64_t v10 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v10);
    }
    if ([*(id *)(v35 + 96) adaptiveOverscanEnabled])
    {

      *(void *)(v35 + 10712) = -[BWMultiStreamCameraSourceNode _outputConfigurationsFilterCropRectAndDimensionsOfStreamingOutputs:](v35, v3);
      *(void *)(v35 + 10720) = 0;
    }
    uint64_t v28 = [*(id *)(v35 + 112) setProperty:*MEMORY[0x1E4F54CB8] value:v3];
    if (v28)
    {
      uint64_t v5 = v28;
      goto LABEL_38;
    }
    if ([*(id *)(v35 + 312) previewOutputEnabled])
    {
      v29 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewOutput;
      int v30 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewStreamOutputID;
    }
    else
    {
      if (![*(id *)(v35 + 312) videoCaptureOutputEnabled]) {
        goto LABEL_32;
      }
      v29 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureOutput;
      int v30 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
    }
    CFAllocatorRef v31 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v35, *(void **)(v35 + *v30), *(void **)(v35 + *v29));
    if (v31)
    {
      double v32 = -[BWMultiStreamCameraSourceNode _maxISPZoomFactorForOutputConfiguration:](v35, v31);
      uint64_t v5 = 0;
      *(_DWORD *)(v35 + 11132) = LODWORD(v32);
      return v5;
    }
LABEL_32:
    uint64_t v5 = 0;
    *(_DWORD *)(v35 + 11132) = 1065353216;
    return v5;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (unint64_t)_outputDimensionsForOutputID:(void *)a3 outputConfiguration:
{
  if (a1)
  {
    unsigned int width = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "unsignedIntValue");
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "unsignedIntValue");
    uint64_t v8 = v7;
    if (width) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      CFDictionaryRef v10 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F55350]];
      CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      v17.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      v17.size = v11;
      BOOL v12 = CGRectMakeWithDictionaryRepresentation(v10, &v17);
      uint64_t v8 = v12 ? (int)v17.size.height : v8;
      if (v12) {
        unsigned int width = (int)v17.size.width;
      }
    }
    if (width) {
      BOOL v13 = v8 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      unint64_t v14 = (void *)[*(id *)(a1 + 120) objectAtIndexedSubscript:*(int *)(a1 + 320)];
      int v15 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F55318]), "objectForKeyedSubscript:", a2);
      unsigned int width = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F55480]), "unsignedIntValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F55470]), "unsignedIntValue");
    }
    if ([a2 isEqualToString:*MEMORY[0x1E4F55440]])
    {
      if (*(unsigned char *)(a1 + 160)) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 0;
      }
      if (!*(unsigned char *)(a1 + 160)) {
        unsigned int width = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    unsigned int width = 0;
  }
  return width | (unint64_t)(v8 << 32);
}

- (id)_outputConfigurationsForAllOutputs
{
  if (result)
  {
    unint64_t v1 = result;
    [result[39] visOverscan];
    return (id *)[(BWMultiStreamCameraSourceNode *)v1 _outputConfigurationsForAllOutputsWithVISOverscan:v3];
  }
  return result;
}

- (id)_outputConfigurationForStreamingOutputID:(void *)a3 nodeOutput:
{
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    [result[39] visOverscan];
    return (id *)[(BWMultiStreamCameraSourceNode *)v5 _outputConfigurationForStreamingOutputID:a3 nodeOutput:v6 visOverscan:v7];
  }
  return result;
}

- (double)_maxISPZoomFactorForOutputConfiguration:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (a2)
  {
    int v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue");
    uint64_t v5 = (void *)[*(id *)(a1 + 120) objectAtIndexedSubscript:*(int *)(a1 + 320)];
    int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55300]), "intValue");
    objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F552F8]), "intValue");
    if (FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 312) sensorCropDimensions])) {
      int v6 = [*(id *)(a1 + 312) sensorCropDimensions];
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "nondisruptiveSwitchingZoomFactors"), "lastObject"), "floatValue");
    if (*(float *)&result == 0.0) {
      [*(id *)(a1 + 104) baseZoomFactor];
    }
    *(float *)&double result = (float)((float)v6 / (float)v4) * *(float *)&result;
  }
  else
  {
    FigDebugAssert3();
    LODWORD(result) = 1.0;
  }
  return result;
}

- (BOOL)hardwareDepthFilteringEnabled
{
  return self->_hardwareDepthFilteringSupported
      && [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration hardwareDepthFilteringPreferred];
}

- (double)_updateZoomForOutputIndex:(opaqueCMSampleBuffer *)a3 sampleBuffer:(float)a4 additionalScaleFactor:
{
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  unint64_t v8 = BWPixelBufferDimensionsFromSampleBuffer(a3);
  BOOL v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  float64_t ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
  double v12 = v11;
  double v14 = v13;
  v261.double x = ValidBufferRect;
  v261.double y = v15;
  CGFloat v262 = v11;
  CGFloat v263 = v13;
  FigCaptureMetadataUtilitiesNormalizeCropRect(ValidBufferRect, v15, v11, v13);
  double v17 = v16;
  double v19 = v18;
  double v247 = v20;
  double rect1 = v21;
  uint64_t v22 = (double *)MEMORY[0x1E4F1DB28];
  uint64_t v257 = a2;
  uint64_t v258 = a1 + 384;
  uint64_t v23 = a1 + 384 + ((uint64_t)a2 << 9);
  uint64_t v246 = *(void *)(a1 + 208);
  uint64_t v249 = *(void *)(a1 + 200);
  uint64_t v251 = *(void *)(v23 + 16);
  int v259 = a2;
  float v244 = a4;
  if ((*(unsigned char *)(v23 + 4) & 4) != 0)
  {
    char v25 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F542D8]];
    if (v25) {
      uint64_t v26 = [v25 intValue];
    }
    else {
      uint64_t v26 = 0xFFFFFFFFLL;
    }
    CMSampleBufferGetPresentationTimeStamp(&v260, a3);
    BOOL v24 = -[BWMultiStreamCameraSourceNode _serviceZoomForPTS:synchronizedStreamsCaptureID:](a1, (long long *)&v260.value, v26);
    a2 = v259;
  }
  else
  {
    BOOL v24 = 0;
  }
  double v28 = *v22;
  double v27 = v22[1];
  if (!v9) {
    return *v22;
  }
  CGFloat v228 = v22[3];
  CGFloat v229 = v22[2];
  double v29 = 1.0;
  double v30 = 1.0;
  if ((*(unsigned char *)(v23 + 4) & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 312), "visOverscan", 1.0, 1.0);
    double v33 = v32;
    if (*(_DWORD *)v23 == 2)
    {
      double v255 = v31;
      if ([*(id *)(a1 + 312) includeOverscanInStillImageFinalCropRect])
      {
        uint64_t v34 = (double *)MEMORY[0x1E4F1DB30];
      }
      else
      {
        char v38 = [*(id *)(a1 + 312) stillImageGeometricDistortionCorrectionExpansionCoversOverscan];
        uint64_t v34 = (double *)MEMORY[0x1E4F1DB30];
        if ((v38 & 1) == 0)
        {
          double v37 = *(double *)(a1 + 10864);
          double v36 = *(double *)(a1 + 10872);
          double v39 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          BOOL v40 = v37 == *MEMORY[0x1E4F1DB30];
          if (v36 != v39) {
            BOOL v40 = 0;
          }
          if (a2 != 5 || v40)
          {
            double v37 = *(double *)(a1 + 10824);
            BOOL v41 = v37 == *MEMORY[0x1E4F1DB30];
            BOOL v42 = *(double *)(a1 + 10832) == v39;
            double v36 = v41 && v42 ? v33 : *(double *)(a1 + 10832);
            if (v41 && v42) {
              double v37 = v255;
            }
          }
          goto LABEL_29;
        }
      }
    }
    else
    {
      if (v251 != v249)
      {
        double v36 = v32;
        double v37 = v31;
LABEL_29:
        double v29 = v37 + 1.0;
        double v30 = v36 + 1.0;
        goto LABEL_30;
      }
      uint64_t v34 = (double *)(a1 + 10744);
    }
    double v37 = *v34;
    double v36 = v34[1];
    goto LABEL_29;
  }
LABEL_30:
  double v241 = v30;
  double v253 = v29;
  double v233 = v17;
  double v234 = v19;
  v243 = a3;
  [*(id *)(a1 + 312) additionalVISOverscanReservedInZoom];
  float v239 = v43;
  [*(id *)(a1 + 312) additionalVISOverscanReservedInZoom];
  float v237 = v44;
  float v45 = -[BWMultiStreamCameraSourceNode _ispAppliedZoomFactorFromSampleBufferMetadataDictionary:outputIndex:](a1, v9, a2);
  uint64_t v46 = v258 + (v257 << 9);
  int v48 = *(_DWORD *)(v46 + 128);
  int v47 = *(_DWORD *)(v46 + 132);
  CGFloat v230 = v27;
  CGFloat v231 = v28;
  if (v48 < 1 || v48 >= (int)v8)
  {
    BOOL v50 = v47 > 0 && v47 < SHIDWORD(v8);
    IsD9double x = BWDeviceModelIsD9x();
    BOOL v236 = a2 == 5;
    if (a2 != 5 || (IsD9x & 1) == 0)
    {
      double v58 = 1.0;
      double v256 = 1.0;
      if (!v50) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
  }
  else
  {
    int v49 = BWDeviceModelIsD9x();
    BOOL v236 = a2 == 5;
    if (a2 != 5 || !v49)
    {
LABEL_55:
      double v256 = (double)v48 / (double)(int)v8;
      double v58 = (double)v47 / (double)SHIDWORD(v8);
      goto LABEL_56;
    }
    LOBYTE(v50) = 1;
  }
  int v53 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168]), "intValue");
  int v54 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), "intValue");
  BOOL v56 = (HIDWORD(v8) - 3201) < 0xAEF && v53 < (int)v8;
  int v57 = v56 && v54 < SHIDWORD(v8);
  if (v57)
  {
    int v47 = v54;
    int v48 = v53;
  }
  if (v57) {
    goto LABEL_55;
  }
  double v58 = 1.0;
  double v256 = 1.0;
  if (v50) {
    goto LABEL_55;
  }
LABEL_56:
  double v232 = (double)(int)v8;
  if (*(_DWORD *)v23 == 1)
  {
    if ([*(id *)(a1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled]) {
      int v59 = 1;
    }
    else {
      int v59 = [*(id *)(a1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled];
    }
  }
  else
  {
    int v59 = 0;
  }
  float v60 = 1.0;
  if ([*(id *)(a1 + 104) hasFocus] && !v259 && v59)
  {
    if ([*(id *)(a1 + 96) adaptiveOverscanEnabled])
    {
      uint64_t v61 = *MEMORY[0x1E4F55410];
      v62 = (void *)[*(id *)(a1 + 10720) objectForKeyedSubscript:*MEMORY[0x1E4F55410]];
      objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "floatValue");
      float v64 = v63;
      v65 = (void *)[*(id *)(a1 + 10720) objectForKeyedSubscript:v61];
      objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "floatValue");
      double v66 = v58;
      float v68 = v67;
      float v69 = v64 / v67;
      int v70 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168]), "intValue");
      int v71 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), "intValue");
      long long v72 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      float64x2_t v264 = *(float64x2_t *)MEMORY[0x1E4F1DB20];
      long long v265 = v72;
      int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
      double v75 = *((double *)&v265 + 1);
      double v74 = *(double *)&v265;
      if (!CGRectIfPresent)
      {
        double v75 = (double)v71;
        double v74 = (double)v70;
      }
      float v76 = v74 / v75;
      int v77 = (int)v68;
      double v58 = v66;
      if (vabds_f32((float)v48 / (float)v47, v76) > vabds_f32(v69, v76))
      {
        int v47 = v77;
        int v48 = (int)v64;
      }
    }
    double v78 = (double)v48 / v12;
    if (v78 <= (double)v47 / v14) {
      double v78 = (double)v47 / v14;
    }
    float v60 = v78;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "nondisruptiveSwitchingZoomFactors"), "count"))
    {
      if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 2)
      {
        [*(id *)(a1 + 104) baseZoomFactor];
        if ((float)(v60 / v79) > 1.2)
        {
          [*(id *)(a1 + 104) baseZoomFactorAfterGDC];
          float v60 = v80;
        }
      }
    }
    [*(id *)(a1 + 104) baseZoomFactorAfterGDC];
    if (*(float *)&v81 != v60)
    {
      *(float *)&double v81 = v60;
      [*(id *)(a1 + 104) setBaseZoomFactorAfterGDC:v81];
      [*(id *)(a1 + 96) updateFudgedZoomRanges];
    }
  }
  int v82 = [*(id *)(a1 + 96) overCaptureEnabled];
  v83 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F542E0]];
  int v84 = [v83 BOOLValue];
  v223 = v83;
  if (v83) {
    int v85 = v84;
  }
  else {
    int v85 = 1;
  }
  if ((v24 & (v82 ^ 1)) == 1 && v85)
  {
    v86 = (void *)[*(id *)(a1 + 96) zoomCommandHandler];
    *(float *)&double v87 = v45;
    [v86 updateAppliedZoomFactorForDelayedISPAppliedZoomFactor:v87];
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "appliedZoomFactor");
  float v89 = v88;
  v90 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  uint64_t v91 = *(void *)(a1 + 104);
  v92 = v243;
  if (v91 == [*(id *)(a1 + 96) bravoTelephotoCaptureStream]
    && [*(id *)(a1 + 96) bravoStreamSelectionConfiguration] == 3)
  {
    [*(id *)(a1 + 104) baseZoomFactor];
    if (v89 <= v93)
    {
      [*(id *)(a1 + 104) baseZoomFactor];
      float v89 = v94;
    }
  }
  if ((([*(id *)(a1 + 96) isBravoVariant] ^ 1 | v82) & 1) == 0
    && (![*(id *)(a1 + 96) depthDataDeliveryEnabled]
     || [*(id *)(a1 + 96) parallaxMitigationBasedOnZoomFactorEnabled]))
  {
    [*(id *)(a1 + 96) updateSphereShiftStateWithSampleBuffer:v243];
  }
  double v95 = 1.0;
  double v96 = v237 + 1.0;
  float v97 = 1.0;
  if (v60 > 1.0) {
    int v98 = v82;
  }
  else {
    int v98 = 0;
  }
  if (v98 == 1)
  {
    *(float *)&double v95 = v60;
    CMSetAttachment(v243, @"ZoomFactorLowerBoundAfterGDCAndFocus", (CFTypeRef)[NSNumber numberWithFloat:v95], 1u);
  }
  double v99 = v253 * (v239 + 1.0);
  double v254 = v241 * v96;
  uint64_t v100 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "rampTuning"));
  [v9 setObject:v100 forKeyedSubscript:*MEMORY[0x1E4F53550]];
  int v101 = [*(id *)(a1 + 96) optimizesZoomRampsForVISZoomSmoothing];
  BOOL v103 = v251 == v246 || v251 == v249;
  float v227 = v89;
  float v104 = v89 / v45;
  if (!v101) {
    goto LABEL_113;
  }
  int v105 = v259;
  if (!v103) {
    goto LABEL_114;
  }
  double v106 = v241 * v96;
  if (v99 < v254) {
    double v106 = v99;
  }
  float v107 = v106;
  float v108 = 1.0 / v107;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "earlySwitchOverScaleFactorForZoomIn");
  float v110 = v109;
  v111 = (void *)[*(id *)(a1 + 96) zoomCommandHandler];
  if (v110 == 1.0)
  {
    [v111 allowableMinimumDigitalZoomFactorDuringZoomOut];
    v113 = *(void **)(a1 + 96);
    if (v114 == 1.0)
    {
      float v97 = 1.0;
      if ([v113 isBravoVariant])
      {
        if ([*(id *)(a1 + 184) isEqualToString:*MEMORY[0x1E4F52DE8]])
        {
          if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1)
          {
            objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "baseZoomFactor");
            float v153 = v152;
            uint64_t v154 = *MEMORY[0x1E4F540F0];
            objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
            float v156 = v153 / v155;
            float v97 = 1.0;
            if (v156 < 1.0)
            {
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "baseZoomFactor");
              float v158 = v157;
              objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v154), "floatValue");
              float v97 = v158 / v159;
            }
          }
        }
      }
      goto LABEL_111;
    }
    objc_msgSend((id)objc_msgSend(v113, "zoomCommandHandler"), "allowableMinimumDigitalZoomFactorDuringZoomOut");
  }
  else
  {
    [v111 earlySwitchOverScaleFactorForZoomIn];
  }
  float v97 = v112;
LABEL_111:
  if (v97 <= v108) {
    float v97 = v108;
  }
LABEL_113:
  int v105 = v259;
LABEL_114:
  if (v104 <= v97) {
    float v115 = v97;
  }
  else {
    float v115 = v104;
  }
  float v116 = v244;
  float v240 = 1.0;
  if (v244 <= 0.0) {
    float v116 = 1.0;
  }
  double v245 = v99;
  double v117 = (float)(v116 * v115);
  double v118 = fmin(1.0 / v99 / v117, 1.0);
  double v119 = fmin(1.0 / v254 / v117, 1.0);
  double v121 = *MEMORY[0x1E4F1DAD8];
  double v120 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  BOOL v122 = v118 < 1.0 || v119 < 1.0;
  double v224 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v225 = *MEMORY[0x1E4F1DAD8];
  if (v122)
  {
    double v35 = (1.0 - v118) * 0.5;
    double v132 = (1.0 - v119) * 0.5;
    if ((v82 & 1) != 0 || [*(id *)(a1 + 96) parallaxMitigationBasedOnZoomFactorEnabled])
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 10988));
      double v123 = *(double *)(a1 + 10968);
      double v124 = *(double *)(a1 + 10976);
      double v221 = v58;
      float v125 = *(float *)(a1 + 10984);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 10988));
      double v238 = -[BWMultiStreamCameraSourceNode _applyNondisruptiveSwitchingZoomFactorAndSensorCenterOffsetToPreviewShift:forSampleBuffer:outputIndex:](a1, v243, v123, v124);
      double v226 = v126;
      float v240 = v125;
      float v127 = v125;
      double v58 = v221;
      double v35 = mscsn_applyPreviewShiftToCropRect(v35, (1.0 - v119) * 0.5, v118, v119, v238, v126, v127);
      double v132 = v128;
      double v242 = v129;
      double v131 = v130;
    }
    else
    {
      double v238 = v121;
      double v226 = v120;
      double v131 = v119;
      double v242 = v118;
    }
  }
  else
  {
    double v238 = *MEMORY[0x1E4F1DAD8];
    double v226 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v131 = v228;
    double v242 = v229;
    double v132 = v230;
    double v35 = v231;
  }
  double v133 = v256 * v118;
  double v134 = v58 * v119;
  if (v256 * v118 > v247 || v134 > rect1)
  {
    float v136 = v133 / v134;
    FigCaptureMetadataUtilitiesRectWithAspectRatioInsideDimensions(v247, rect1, v136);
    double v133 = v137;
    double v134 = v138;
  }
  if (v133 >= 1.0 && v134 >= 1.0) {
    goto LABEL_217;
  }
  CGFloat v218 = v132;
  if ([*(id *)(a1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled]) {
    int v141 = 1;
  }
  else {
    int v141 = [*(id *)(a1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled];
  }
  double v142 = v233 + (v247 - v133) * 0.5;
  HIDWORD(v143) = HIDWORD(v234);
  double v140 = (rect1 - v134) * 0.5;
  double v144 = v234 + v140;
  BOOL v145 = v236;
  float v220 = v45;
  double v222 = v35;
  CGFloat v219 = v131;
  if ((v236 & v141) == 1)
  {
    if (*(unsigned char *)(a1 + 11065))
    {
      v268.origin.double x = FigCaptureMetadataUtilitiesNormalizedRectEnforcedWithinValidRegionAfterGDC(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "cameraInfoByPortType"), "objectForKeyedSubscript:", *(void *)(a1 + 184)), v9, v8, v142, v144, v133, v134);
      double x = v268.origin.x;
      double y = v268.origin.y;
      CGFloat width = v268.size.width;
      CGFloat height = v268.size.height;
      v273.origin.double x = v233 + (v247 - v133) * 0.5;
      v273.origin.double y = v144;
      v273.size.CGFloat width = v133;
      v273.size.CGFloat height = v134;
      if (!CGRectEqualToRect(v268, v273))
      {
        if (!dword_1EB4C56D0) {
          goto LABEL_161;
        }
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v92 = v243;
LABEL_160:
        v90 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
        int v105 = v259;
LABEL_161:
        BOOL v145 = v236;
LABEL_162:
        if (CMGetAttachment(v92, (CFStringRef)*MEMORY[0x1E4F53188], 0))
        {
          v160 = NSNumber;
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "zoomCommandHandler"), "appliedZoomFactorWithoutFudge");
          v161 = v160;
          int v105 = v259;
          uint64_t v162 = objc_msgSend(v161, "numberWithFloat:");
          [v9 setObject:v162 forKeyedSubscript:*MEMORY[0x1E4F531E8]];
        }
        double v142 = x;
        double v144 = y;
        double v134 = height;
        double v133 = width;
        if (!v145) {
          goto LABEL_174;
        }
        goto LABEL_165;
      }
    }
    else if (dword_1EB4C56D0)
    {
      v151 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT);
      v92 = v243;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      double x = v233 + (v247 - v133) * 0.5;
      double y = v234 + v140;
      CGFloat height = v134;
      CGFloat width = v133;
      goto LABEL_160;
    }
    double x = v233 + (v247 - v133) * 0.5;
    double y = v144;
    CGFloat height = v134;
    CGFloat width = v133;
    goto LABEL_161;
  }
  if (v105 == 5)
  {
    double x = v233 + (v247 - v133) * 0.5;
    double y = v234 + v140;
    CGFloat height = v134;
    CGFloat width = v133;
    goto LABEL_162;
  }
  double x = v233 + (v247 - v133) * 0.5;
  double y = v234 + v140;
  CGFloat height = v134;
  CGFloat width = v133;
  if (v105 == 3) {
    goto LABEL_162;
  }
  if (v236)
  {
LABEL_165:
    int v163 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168], v216, v217), "intValue");
    if (FigCaptureVideoDimensionsAreValid(v163 | (unint64_t)(objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), "intValue") << 32)))
    {
      if (FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 312) sensorCropDimensions])
        && v245 == 1.0
        && v254 == 1.0)
      {
        double v164 = (float)((float)(int)objc_msgSend(*(id *)(a1 + 312), "sensorCropDimensions", 1.0, v254) / (float)v163);
        [*(id *)(a1 + 312) sensorCropDimensions];
        double v142 = FigCaptureMetadataUtilitiesScaleRect2D(v142, v144, v133, v134, v164);
        double v144 = v165;
        double v133 = v166;
        double v134 = v167;
      }
      [*(id *)(a1 + 312) sensorCenterOffset];
      if (v169 != v225 || (HIDWORD(v143) = HIDWORD(v224), v168 != v224))
      {
        if (*(double *)(a1 + 10864) != *MEMORY[0x1E4F1DB30]
          || (double v143 = *(double *)(a1 + 10872), v143 != *(double *)(MEMORY[0x1E4F1DB30] + 8)))
        {
          [*(id *)(a1 + 312) sensorCenterOffset];
          double v204 = FigCaptureMetadataUtilitiesNormalizePoint(v202, v203, (double)v163);
          CGFloat v206 = v205;
          v270.origin.double x = v142;
          v270.origin.double y = v144;
          v270.size.CGFloat width = v133;
          v270.size.CGFloat height = v134;
          CGRect v271 = CGRectOffset(v270, v204, v206);
          CGFloat v207 = v271.origin.x;
          CGFloat v208 = v271.origin.y;
          CGFloat v209 = v271.size.width;
          CGFloat v210 = v271.size.height;
          v271.origin.double x = v233;
          v271.origin.double y = v234;
          v271.size.CGFloat width = v247;
          v271.size.CGFloat height = rect1;
          v275.origin.double x = v207;
          v275.origin.double y = v208;
          v275.size.CGFloat width = v209;
          v275.size.CGFloat height = v210;
          if (CGRectContainsRect(v271, v275))
          {
            double v133 = v209;
            double v134 = v210;
            double v144 = v208;
            double v142 = v207;
          }
        }
      }
    }
  }
LABEL_174:
  if (v82)
  {
    float v45 = v220;
    if ([*(id *)(a1 + 312) applyPreviewShiftToStillImage])
    {
      if (v105 == 5 || v105 == 3)
      {
        double v170 = mscsn_applyPreviewShiftToCropRect(v142, v144, v133, v134, v238, v226, v240);
        double v172 = v171;
        double v133 = v173;
        double v134 = v174;
        [*(id *)(a1 + 312) sensorOverscan];
        double v177 = v176 / (v176 + 1.0);
        double v178 = v175 / (v175 + 1.0) * 0.5;
        double v179 = 1.0 - v178;
        if (1.0 - v178 >= v170) {
          double v179 = v170;
        }
        if (v178 <= v179) {
          double v142 = v179;
        }
        else {
          double v142 = v178;
        }
        double v180 = v177 * 0.5;
        double v181 = 1.0 - v177 * 0.5;
        if (v181 >= v172) {
          double v181 = v172;
        }
        if (v180 <= v181) {
          double v144 = v181;
        }
        else {
          double v144 = v180;
        }
      }
      else if (v238 != v225 || v226 != v224)
      {
        v267.double x = v238 * v240;
        v267.double y = v226 * v240;
        CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v267);
        [v9 setObject:DictionaryRepresentation forKeyedSubscript:@"PreviewShiftForIrisStillImageMovieMetadataCache"];
        CMSetAttachment(v92, @"PreviewShift", DictionaryRepresentation, 1u);
      }
    }
  }
  else
  {
    *(float *)&double v143 = v227;
    float v45 = v220;
    if (v227 <= 1.0
      || (objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor", v143), *(float *)&v143 <= 1.0))
    {
      if (objc_msgSend(*(id *)(a1 + 96), "stereoVideoCaptureEnabled", v143, v216)
        && [v223 BOOLValue])
      {
        float64x2_t v264 = 0uLL;
        if (BWStereoUtilitiesComputeCenterShiftForPrimaryStream(*(void *)(a1 + 184), *MEMORY[0x1E4F52DE8], (void *)[*(id *)(a1 + 96) cameraInfoByPortType], v92, (float64x2_t *)&v261, &v264))
        {
          v90 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
        }
        else
        {
          double v250 = v233 + v247;
          double v252 = FigCaptureMetadataUtilitiesNormalizePoint(v264.f64[0], v264.f64[1], v232);
          double v212 = v233 + v247 - v133;
          if (v212 >= v142 + v252) {
            double v212 = v142 + v252;
          }
          if (v233 <= v212) {
            double v142 = v212;
          }
          else {
            double v142 = v233;
          }
          double v213 = v234 + rect1 - v134;
          double v214 = v144 + v211;
          if (v213 >= v214) {
            double v213 = v214;
          }
          if (v234 <= v213) {
            double v144 = v213;
          }
          else {
            double v144 = v234;
          }
          v272.origin.double x = v222;
          v272.size.CGFloat height = v219;
          v272.origin.double y = v218;
          v272.size.CGFloat width = v242;
          v276.origin.double y = v230;
          v276.origin.double x = v231;
          v276.size.CGFloat height = v228;
          v276.size.CGFloat width = v229;
          if (CGRectEqualToRect(v272, v276))
          {
            float v45 = v220;
            v90 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
          }
          else
          {
            double v215 = v250 - v242;
            if (v250 - v242 >= v222 + v252) {
              double v215 = v222 + v252;
            }
            if (v233 > v215) {
              double v215 = v233;
            }
            double v222 = v215;
            float v45 = v220;
            v90 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
          }
        }
      }
    }
    else
    {
      if (v251 == v249 || ([*(id *)(a1 + 312) previewOutputEnabled] & 1) == 0 && v251 == v246)
      {
        double v238 = -[BWMultiStreamCameraSourceNode _bravoShiftMitigationCropOffset:totalZoom:totalConfiguredOverscan:totalAvailableOverscan:](a1, v92, v227, v245, v254, v247 / v133, rect1 / v134);
        double v226 = v182;
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
        if (v183 == 0.0) {
          float v184 = 1.0;
        }
        else {
          float v184 = v183;
        }
        objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor", v216);
        -[BWMultiStreamCameraSourceNode _setPreviewShift:previewScaleFactor:previewShiftAtBaseZoom:ispAppliedZoomFactorForCaptureStream:](a1, v238 / v184, v226 / v184, 1.0, v225, v224, v220 / (float)(v184 * v185));
      }
      double v186 = 1.0 - v133;
      if (1.0 - v133 >= v142 + v238) {
        double v186 = v142 + v238;
      }
      if (v186 >= 0.0) {
        double v142 = v186;
      }
      else {
        double v142 = 0.0;
      }
      double v187 = 1.0 - v134;
      if (1.0 - v134 >= v144 + v226) {
        double v187 = v144 + v226;
      }
      if (v187 >= 0.0) {
        double v144 = v187;
      }
      else {
        double v144 = 0.0;
      }
    }
  }
  FigCaptureMetadataUtilitiesDenormalizeCropRect(v142, v144, v133, v134);
  v274.origin.double x = v189;
  v274.origin.double y = v190;
  v274.size.CGFloat width = v191;
  v274.size.CGFloat height = v192;
  v269.origin = v261;
  v269.size.CGFloat width = v262;
  v269.size.CGFloat height = v263;
  if (!CGRectContainsRect(v269, v274))
  {
    uint64_t v217 = v235;
    LODWORD(v216) = 0;
    FigDebugAssert3();
  }
  FigCFDictionarySetCGRect();
  FigCFDictionarySetCGRect();
  double v35 = v222;
LABEL_217:
  if (v82)
  {
    [*(id *)(a1 + v90[412]) baseZoomFactorAfterGDC];
    float v194 = v193 / v45;
    if (v194 <= 1.0) {
      float v194 = 1.0;
    }
    double v195 = v194;
    double v196 = v254;
    if (v245 > v254) {
      double v196 = v245;
    }
    float v197 = v196;
    double v198 = 1.0 / v197 / v195;
    if (v198 >= 1.0) {
      double v198 = 1.0;
    }
    *(float *)&double v198 = v198;
    CMSetAttachment(v92, @"FinalCropRectScaleFactorAtBaseZoom", (CFTypeRef)objc_msgSend(NSNumber, "numberWithFloat:", v198, v216, v217), 1u);
  }
  float v199 = v256 / v245;
  double v200 = v199 / v133;
  *(float *)&double v200 = v200;
  *(float *)&double v200 = v45 * *(float *)&v200;
  CMSetAttachment(v92, @"TotalZoomFactor", (CFTypeRef)objc_msgSend(NSNumber, "numberWithFloat:", v200, v216), 1u);
  *(float *)(v258 + (v257 << 9) + 168) = v45;
  return v35;
}

- (BOOL)_serviceZoomForPTS:(uint64_t)a3 synchronizedStreamsCaptureID:
{
  if (a1)
  {
    int v6 = [*(id *)(a1 + 96) overCaptureEnabled];
    double v7 = *(void **)(a1 + 96);
    if (v6)
    {
      unint64_t v8 = (void *)[v7 zoomCommandHandler];
      long long v23 = *a2;
      uint64_t v24 = *((void *)a2 + 2);
      objc_msgSend(v8, "updateZoomModelAndAppliedZoomFactorForNextFrameWithPTS:captureID:delayedISPAppliedZoomFactor:", &v23, a3, COERCE_DOUBLE(__PAIR64__(DWORD1(v23), 1.0)));
    }
    else
    {
      if ([v7 depthType] == 3
        && ![*(id *)(a1 + 184) isEqualToString:*MEMORY[0x1E4F52DD8]])
      {
        return a1 != 0;
      }
      CFDictionaryRef v10 = (void *)[*(id *)(a1 + 96) zoomCommandHandler];
      long long v23 = *a2;
      uint64_t v24 = *((void *)a2 + 2);
      [v10 updateZoomModelForNextFrameWithPTS:&v23 captureID:a3];
    }
    float v11 = v9;
    if (v9 >= 1.0)
    {
      double v12 = *(float *)(a1 + 10704);
      [*(id *)(a1 + 104) baseZoomFactorAfterGDC];
      float v14 = v13;
      [*(id *)(a1 + 104) baseZoomFactor];
      if ((float)(v14 / v15) + -1.0 >= v12)
      {
        [*(id *)(a1 + 104) baseZoomFactorAfterGDC];
        float v18 = v17;
        [*(id *)(a1 + 104) baseZoomFactor];
        float v16 = (float)(v18 / v19) + -1.0;
      }
      else
      {
        float v16 = *(float *)(a1 + 10704);
      }
      double v20 = 1.0;
      double v21 = v11 / (v16 + 1.0);
      if (v21 <= 1.0) {
        double v21 = 1.0;
      }
      *(float *)&double v21 = v21;
      *(float *)&double v20 = v11;
      [*(id *)(a1 + 96) setISPZoomFactor:v21 totalZoomFactor:v20];
    }
  }
  return a1 != 0;
}

- (float)_ispAppliedZoomFactorFromSampleBufferMetadataDictionary:(int)a3 outputIndex:
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 104) baseZoomFactor];
  float v6 = v5;
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
  unint64_t v8 = (void *)MEMORY[0x1E4F541F8];
  float v9 = (uint64_t *)MEMORY[0x1E4F541E8];
  CFDictionaryRef v10 = (uint64_t *)MEMORY[0x1E4F541D8];
  float v11 = (void *)MEMORY[0x1E4F541D0];
  double v12 = (uint64_t *)MEMORY[0x1E4F53FD8];
  float v13 = v6 * fmaxf(v7, 1.0);
  float v14 = (uint64_t *)MEMORY[0x1E4F53FC8];
  float v15 = (uint64_t *)MEMORY[0x1E4F53FC0];
  switch(a3)
  {
    case 2:
      uint64_t v16 = *MEMORY[0x1E4F53FE8];
      if (![a2 objectForKeyedSubscript:*MEMORY[0x1E4F53FE8]]) {
        uint64_t v16 = *MEMORY[0x1E4F54380];
      }
      if (!v16) {
        goto LABEL_23;
      }
      goto LABEL_12;
    case 1:
      uint64_t v16 = *MEMORY[0x1E4F541F8];
      if (!*MEMORY[0x1E4F541F8])
      {
LABEL_23:
        if (a3 == 2)
        {
          uint64_t v29 = *v12;
          if ([a2 objectForKeyedSubscript:*v12])
          {
            uint64_t v30 = [a2 objectForKeyedSubscript:v29];
            [a2 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F54358]];
            [a2 setObject:0 forKeyedSubscript:v29];
          }
          uint64_t v31 = *v14;
          if ([a2 objectForKeyedSubscript:*v14])
          {
            uint64_t v32 = [a2 objectForKeyedSubscript:v31];
            [a2 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F53EE8]];
            [a2 setObject:0 forKeyedSubscript:v31];
          }
          uint64_t v33 = *v15;
          if ([a2 objectForKeyedSubscript:*v15])
          {
            uint64_t v34 = [a2 objectForKeyedSubscript:v33];
            [a2 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F53E98]];
            [a2 setObject:0 forKeyedSubscript:v33];
          }
        }
        break;
      }
LABEL_12:
      float v17 = v9;
      float v18 = v10;
      float v19 = v11;
      double v20 = (void *)[a2 objectForKeyedSubscript:v16];
      double v21 = v20;
      if (v20)
      {
        [v20 floatValue];
        float v13 = v13 * v22;
      }
      if (v16 == *v8)
      {
        [a2 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F54380]];
        [a2 setObject:0 forKeyedSubscript:v16];
        uint64_t v23 = *v17;
        if ([a2 objectForKeyedSubscript:*v17])
        {
          uint64_t v24 = [a2 objectForKeyedSubscript:v23];
          [a2 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F54358]];
          [a2 setObject:0 forKeyedSubscript:v23];
        }
        uint64_t v25 = *v18;
        float v11 = v19;
        if ([a2 objectForKeyedSubscript:*v18])
        {
          uint64_t v26 = [a2 objectForKeyedSubscript:v25];
          [a2 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F53EE8]];
          [a2 setObject:0 forKeyedSubscript:v25];
        }
        uint64_t v27 = *v19;
        if ([a2 objectForKeyedSubscript:*v19])
        {
          uint64_t v28 = [a2 objectForKeyedSubscript:v27];
          [a2 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F53E98]];
          [a2 setObject:0 forKeyedSubscript:v27];
        }
      }
      else
      {
        float v11 = v19;
      }
      CFDictionaryRef v10 = v18;
      float v9 = v17;
      float v15 = (uint64_t *)MEMORY[0x1E4F53FC0];
      goto LABEL_23;
    case 0:
      uint64_t v16 = *MEMORY[0x1E4F54380];
      if (!*MEMORY[0x1E4F54380]) {
        goto LABEL_23;
      }
      goto LABEL_12;
  }
  if (*v8) {
    objc_msgSend(a2, "setObject:forKeyedSubscript:", 0);
  }
  [a2 setObject:0 forKeyedSubscript:*v9];
  [a2 setObject:0 forKeyedSubscript:*v10];
  [a2 setObject:0 forKeyedSubscript:*v11];
  [a2 setObject:0 forKeyedSubscript:*v12];
  [a2 setObject:0 forKeyedSubscript:*v14];
  [a2 setObject:0 forKeyedSubscript:*v15];
  [a2 removeObjectForKey:*MEMORY[0x1E4F54310]];
  [a2 removeObjectForKey:*MEMORY[0x1E4F54308]];
  return v13;
}

- (double)_applyNondisruptiveSwitchingZoomFactorAndSensorCenterOffsetToPreviewShift:(double)a3 forSampleBuffer:(double)a4 outputIndex:
{
  if (!a1) {
    return 0.0;
  }
  double v4 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (a3 != *MEMORY[0x1E4F1DAD8] || a4 != v6)
  {
    CFTypeRef v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v10)
    {
      float v11 = (void *)v10;
      double v12 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(target);
      [*(id *)(a1 + 312) sensorCenterOffset];
      if (v14 != v5 || v13 != v6)
      {
        int RawSensorDimensions = FigCaptureMetadataUtilitiesGetRawSensorDimensions(v11);
        [*(id *)(a1 + 312) sensorCenterOffset];
        double v12 = v12 - FigCaptureMetadataUtilitiesNormalizePoint(v17, v18, (double)RawSensorDimensions);
      }
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F0]), "floatValue");
      if (v19 == 0.0) {
        float v19 = 1.0;
      }
      return v12 + v4 * v19;
    }
    else
    {
      FigDebugAssert3();
    }
  }
  return v4;
}

- (uint64_t)_updateColorSpaceProperties
{
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = -[BWMultiStreamCameraSourceNode videoCaptureDimensionsForColorspace](result);
    id v3 = (id)[*(id *)(v1 + 112) getPropertyIfSupported:*MEMORY[0x1E4F54BF8] error:0];
    if ((int)FigCapturePlatformIdentifier() <= 7)
    {
      id v3 = (id)[v3 mutableCopy];
      [v3 removeObject:&unk_1EFB00E78];
    }
    double result = +[BWVideoFormat colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:supportedColorSpaces:](BWVideoFormat, "colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:supportedColorSpaces:", [*(id *)(v1 + 96) supportsWideColor], objc_msgSend(*(id *)(v1 + 312), "colorSpace"), objc_msgSend(*(id *)(v1 + 312), "clientVideoFormat"), v2, objc_msgSend(*(id *)(v1 + 312), "clientVideoFormat"), v3);
    *(_DWORD *)(v1 + 328) = result;
  }
  return result;
}

- (unint64_t)videoCaptureDimensionsForColorspace
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 312) preferredPreviewDimensions];
    unint64_t v3 = [*(id *)(a1 + 312) videoCaptureDimensions];
    int v4 = v3;
    unint64_t v5 = HIDWORD(v3);
    if (([*(id *)(a1 + 312) videoCaptureOutputEnabled] & 1) == 0
      && [*(id *)(a1 + 312) previewOutputEnabled])
    {
      if ((int)v2 < 960)
      {
        if ((int)v2 < v4 && SHIDWORD(v2) < (int)v5)
        {
          unint64_t v8 = -[BWMultiStreamCameraSourceNode _finalPreviewOutputDimensions](a1);
          if ((int)v2 < (int)v8 && SHIDWORD(v2) < SHIDWORD(v8))
          {
            unint64_t v5 = HIDWORD(v8);
            int v4 = v8;
          }
        }
      }
      else
      {
        unint64_t v6 = -[BWMultiStreamCameraSourceNode _finalPreviewOutputDimensions](a1);
        int v4 = v6;
        unint64_t v5 = HIDWORD(v6);
      }
      float v9 = (void *)[*(id *)(a1 + 112) supportedProperties];
      if (![v9 objectForKeyedSubscript:*MEMORY[0x1E4F54D10]])
      {
        unint64_t v10 = -[BWMultiStreamCameraSourceNode _finalPreviewOutputDimensions](a1);
        int v4 = v10;
        unint64_t v5 = HIDWORD(v10);
      }
    }
  }
  else
  {
    LODWORD(v5) = 0;
    int v4 = 0;
  }
  return v4 | ((unint64_t)v5 << 32);
}

- (uint64_t)_bringStreamUpToDate
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 104), "setLowLightVideoEnabled:", objc_msgSend(*(id *)(a1 + 312), "lowLightVideoEnabled"));
    [*(id *)(a1 + 312) maximumSupportedFrameRate];
    objc_msgSend(*(id *)(a1 + 104), "setMaximumSupportedFrameRate:");
    [*(id *)(a1 + 312) minimumSupportedFrameRate];
    objc_msgSend(*(id *)(a1 + 104), "setMinimumSupportedFrameRate:");
    [*(id *)(a1 + 312) minFrameRate];
    if ((v2 > 0.0
       || ([*(id *)(a1 + 312) minFrameRate], v5 == 0.0)
       && [*(id *)(a1 + 312) pointCloudOutputEnabled]
       && [*(id *)(a1 + 312) pointCloudOutputIsSupplementalPointCloudData])
      && ([*(id *)(a1 + 312) maxFrameRate], v3 > 0.0))
    {
      [*(id *)(a1 + 312) minFrameRate];
      objc_msgSend(*(id *)(a1 + 104), "setMinimumFrameRate:");
      [*(id *)(a1 + 312) maxFrameRate];
    }
    else
    {
      [*(id *)(a1 + 104) maximumSupportedFrameRate];
      float v7 = v6;
      [*(id *)(a1 + 104) minimumSupportedFrameRate];
      float v9 = v8;
      [*(id *)(a1 + 104) minimumFrameRate];
      BOOL v10 = v7 < *(float *)&v11;
      *(float *)&double v11 = v7;
      if (!v10) {
        objc_msgSend(*(id *)(a1 + 104), "minimumFrameRate", v11);
      }
      BOOL v12 = v9 <= *(float *)&v11;
      *(float *)&double v11 = v9;
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 104), "minimumFrameRate", v11);
        BOOL v10 = v7 < *(float *)&v11;
        *(float *)&double v11 = v7;
        if (!v10) {
          objc_msgSend(*(id *)(a1 + 104), "minimumFrameRate", v11);
        }
      }
      [*(id *)(a1 + 104) setMinimumFrameRate:v11];
      [*(id *)(a1 + 104) maximumFrameRate];
      BOOL v10 = v7 < *(float *)&v4;
      *(float *)&double v4 = v7;
      if (!v10) {
        objc_msgSend(*(id *)(a1 + 104), "maximumFrameRate", v4);
      }
      if (v9 > *(float *)&v4 || ([*(id *)(a1 + 104) maximumFrameRate], float v9 = v7, v7 < *(float *)&v4))
      {
LABEL_20:
        *(float *)&double v4 = v9;
        [*(id *)(a1 + 104) setMaximumFrameRate:v4];
        [*(id *)(a1 + 312) fastSwitchingMainFormatMaxFrameRate];
        if (v13 == 0.0) {
          [*(id *)(a1 + 312) maximumSupportedFrameRate];
        }
        objc_msgSend(*(id *)(a1 + 104), "setMaximumFrameRateForSensorRawOutputBufferPoolRequirements:");
        if ([*(id *)(a1 + 104) synchronizedStreamsEnabled])
        {
          objc_msgSend(*(id *)(a1 + 104), "setStreamingRequiredWhenConfiguredAsSlave:", objc_msgSend(*(id *)(a1 + 312), "streamingRequiredWhenConfiguredAsSlave"));
          objc_msgSend(*(id *)(a1 + 104), "setVisionDataRequiredWhenConfiguredAsSlave:", objc_msgSend(*(id *)(a1 + 312), "visionDataRequiredWhenConfiguredAsSlave"));
        }
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54830], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "chromaNoiseReductionEnabled")));
        [*(id *)(a1 + 312) aeMaxGain];
        if (v14 > 0.0)
        {
          float v15 = *(void **)(a1 + 112);
          uint64_t v16 = *MEMORY[0x1E4F54730];
          double v17 = NSNumber;
          [*(id *)(a1 + 312) aeMaxGain];
          LODWORD(v19) = vcvts_n_s32_f32(v18, 8uLL);
          objc_msgSend(v15, "setProperty:value:", v16, objc_msgSend(v17, "numberWithInt:", v19));
          [*(id *)(a1 + 312) aeMaxGain];
          objc_msgSend(*(id *)(a1 + 104), "setAeMaxGain:");
        }
        double v20 = *(void **)(a1 + 312);
        if (v20)
        {
          [v20 maxExposureDurationFrameworkOverride];
        }
        else
        {
          long long v53 = 0uLL;
          uint64_t v54 = 0;
        }
        double v21 = *(void **)(a1 + 104);
        long long v51 = v53;
        uint64_t v52 = v54;
        [v21 setMaxExposureDurationFrameworkOverride:&v51];
        float v22 = *(void **)(a1 + 312);
        if (v22)
        {
          [v22 maxExposureDurationClientOverride];
        }
        else
        {
          long long v49 = 0uLL;
          uint64_t v50 = 0;
        }
        uint64_t v23 = *(void **)(a1 + 104);
        long long v47 = v49;
        uint64_t v48 = v50;
        [v23 setMaxExposureDurationClientOverride:&v47];
        uint64_t CaptureStreamColorSpace = BWColorSpacePropertiesGetCaptureStreamColorSpace(*(_DWORD *)(a1 + 328));
        uint64_t v25 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "stream"), "supportedProperties");
        uint64_t v26 = *MEMORY[0x1E4F54850];
        if ([v25 objectForKeyedSubscript:*MEMORY[0x1E4F54850]]) {
          objc_msgSend(*(id *)(a1 + 112), "setProperty:value:", v26, objc_msgSend(NSNumber, "numberWithInt:", CaptureStreamColorSpace));
        }
        uint64_t v27 = (void *)[*(id *)(a1 + 112) supportedProperties];
        uint64_t v28 = *MEMORY[0x1E4F54D10];
        if ([v27 objectForKeyedSubscript:*MEMORY[0x1E4F54D10]] && !*(unsigned char *)(a1 + 160))
        {
          YCbCrMatridouble x = BWColorSpacePropertiesGetYCbCrMatrix(*(_DWORD *)(a1 + 328));
          if (YCbCrMatrix == *MEMORY[0x1E4F24C30]) {
            uint64_t v30 = *MEMORY[0x1E4F24C48];
          }
          else {
            uint64_t v30 = YCbCrMatrix;
          }
          [*(id *)(a1 + 112) setProperty:v28 value:v30];
        }
        uint64_t v31 = 1;
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54838], objc_msgSend(NSNumber, "numberWithBool:", 1));
        objc_msgSend(*(id *)(a1 + 104), "setKeypointDetectionEnabled:", objc_msgSend(*(id *)(a1 + 312), "keypointDetectionEnabled"));
        objc_msgSend(*(id *)(a1 + 104), "setStillImageKeypointDetectionEnabled:", objc_msgSend(*(id *)(a1 + 312), "stillImageKeypointDetectionEnabled"));
        objc_msgSend(*(id *)(a1 + 104), "setMultiBandNoiseReductionMode:", objc_msgSend(*(id *)(a1 + 312), "ispMultiBandNoiseReductionMode"));
        if (([*(id *)(a1 + 312) ltmLookUpTableMetadataEnabledForStills] & 1) == 0) {
          uint64_t v31 = [*(id *)(a1 + 312) ltmLookUpTableMetadataEnabledForStreaming];
        }
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F549F8], objc_msgSend(NSNumber, "numberWithBool:", v31));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54898], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "ltmLookUpTableMetadataEnabledForStreaming")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54A08], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "ltmThumbnailMetadataEnabledForStreaming")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F548A0], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "ltmThumbnailMetadataEnabledForStreaming")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54A00], objc_msgSend(NSNumber, "numberWithInt:", 0));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54A70], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "lumaHistogramMetadataEnabled")));
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F548A8], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "lumaHistogramMetadataEnabled")));
        uint64_t v32 = [*(id *)(a1 + 312) stillImageLocalHistogramClippingDataMetadataEnabled];
        objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54A30], objc_msgSend(NSNumber, "numberWithBool:", v32));
        uint64_t v33 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54868], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "contentAwareEnhancementEnabled")));
        if (v33)
        {
          uint64_t v45 = v33;
        }
        else
        {
          uint64_t v34 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54860], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "contentAwareAWBEnabled")));
          if (v34)
          {
            uint64_t v45 = v34;
          }
          else
          {
            uint64_t v35 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54AF8], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "multiIlluminantWhiteBalanceEnabled")));
            if (v35)
            {
              uint64_t v45 = v35;
            }
            else
            {
              uint64_t v36 = [*(id *)(a1 + 312) colorPostProcessingSkyEnhancementEnabled];
              uint64_t v37 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54840], objc_msgSend(NSNumber, "numberWithInt:", v36));
              if (v37)
              {
                uint64_t v45 = v37;
              }
              else
              {
                if ((int)[*(id *)(a1 + 96) videoStabilizationStrength] <= 2) {
                  char v38 = 0;
                }
                else {
                  char v38 = &unk_1EFB04F88;
                }
                uint64_t v39 = [*(id *)(a1 + 112) setPropertyIfSupported:*MEMORY[0x1E4F54A20] value:v38];
                if (v39)
                {
                  uint64_t v45 = v39;
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 104), "setFocusBlurMapEnabled:", objc_msgSend(*(id *)(a1 + 312), "focusBlurMapEnabled"));
                  -[BWMultiStreamCameraSourceNode _updateMetadataConfigurations](a1);
                  -[BWMultiStreamCameraSourceNode _updateObjectDetectionMetadataRegistration](a1);
                  -[BWMultiStreamCameraSourceNode _updateDepthConfiguration](a1);
                  uint64_t updated = -[BWMultiStreamCameraSourceNode _updateOutputConfigurations](a1);
                  if (updated)
                  {
                    uint64_t v45 = updated;
                  }
                  else
                  {
                    -[BWMultiStreamCameraSourceNode _updateOverscanReservedInISPZoom](a1);
                    BOOL v41 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForAllOutputs]((id *)a1);
                    if (!v41)
                    {
                      int v42 = FigCapturePixelFormatIs422([*(id *)(a1 + 312) clientVideoFormat]);
                      float v43 = *(void **)(a1 + 112);
                      uint64_t v44 = *MEMORY[0x1E4F54BE0];
                      if (v42) {
                        [v43 setProperty:v44 value:&unk_1EFB00DB8];
                      }
                      else {
                        [v43 setPropertyIfSupported:v44 value:&unk_1EFB00E00];
                      }
                      objc_msgSend(*(id *)(a1 + 104), "setMainToSIFRFrameRateRatio:", objc_msgSend(*(id *)(a1 + 312), "mainToSIFRFrameRateRatio"));
                      objc_msgSend(*(id *)(a1 + 104), "setHighlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream:", objc_msgSend(*(id *)(a1 + 312), "highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream"));
                      objc_msgSend(*(id *)(a1 + 104), "setHighlightRecoveryEnabledWhenConfiguredAsSlave:", objc_msgSend(*(id *)(a1 + 312), "highlightRecoveryEnabledWhenConfiguredAsSlave"));
                      objc_msgSend(*(id *)(a1 + 104), "setVideoHDRImageStatisticsEnabled:", objc_msgSend(*(id *)(a1 + 312), "videoHDRImageStatisticsEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setVideoHDRFusionEnabled:", objc_msgSend(*(id *)(a1 + 312), "videoHDRFusionEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setPixelFormatIsTenBit:", FigCapturePixelFormatIsTenBit(objc_msgSend(*(id *)(a1 + 312), "clientVideoFormat")));
                      objc_msgSend(*(id *)(a1 + 104), "setColorSpaceIsAppleLog:", objc_msgSend(*(id *)(a1 + 312), "colorSpace") == 3);
                      objc_msgSend(*(id *)(a1 + 104), "setVideoCaptureDimensions:", objc_msgSend(*(id *)(a1 + 312), "videoCaptureDimensions"));
                      objc_msgSend(*(id *)(a1 + 104), "setBackgroundBlurEnabled:", objc_msgSend(*(id *)(a1 + 312), "backgroundBlurEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setStudioLightingEnabled:", objc_msgSend(*(id *)(a1 + 312), "studioLightingEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setReactionEffectsEnabled:", objc_msgSend(*(id *)(a1 + 312), "reactionEffectsEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setBackgroundReplacementEnabled:", objc_msgSend(*(id *)(a1 + 312), "backgroundReplacementEnabled"));
                      objc_msgSend(*(id *)(a1 + 104), "setCinematicFramingEnabled:", objc_msgSend(*(id *)(a1 + 312), "cinematicFramingEnabled"));
                      return 0;
                    }
                    uint64_t v45 = (uint64_t)v41;
                  }
                }
              }
            }
          }
        }
        FigDebugAssert3();
        return v45;
      }
      [*(id *)(a1 + 104) maximumFrameRate];
    }
    float v9 = *(float *)&v4;
    goto LABEL_20;
  }
  return 0;
}

- (uint64_t)_stillImageColorSpaceProperties
{
  if (result)
  {
    uint64_t v1 = result;
    if ((FigCapturePixelFormatIsFullRange([*(id *)(result + 312) clientVideoFormat]) & 1) != 0
      || ![*(id *)(v1 + 312) usesFirmwareStillImageOutput])
    {
      goto LABEL_17;
    }
    int v2 = *(_DWORD *)(v1 + 328);
    if ((v2 - 5) < 3) {
      return 7;
    }
    if (v2)
    {
      return 1;
    }
    else
    {
LABEL_17:
      if ([*(id *)(v1 + 312) usesFirmwareStillImageOutput]
        && [*(id *)(v1 + 312) stillImageOutputRequires10BitPixelFormat])
      {
        unsigned int CaptureStreamColorSpace = BWColorSpacePropertiesGetCaptureStreamColorSpace(*(_DWORD *)(v1 + 328));
        if (BWColorSpaceIsWide(CaptureStreamColorSpace)) {
          return 3;
        }
        else {
          return 1;
        }
      }
      else
      {
        return *(unsigned int *)(v1 + 328);
      }
    }
  }
  return result;
}

- (uint64_t)_updateDepthConfiguration
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "stream"), "supportedProperties");
  uint64_t v3 = *MEMORY[0x1E4F548B0];
  if (![v2 objectForKeyedSubscript:*MEMORY[0x1E4F548B0]]) {
    return 0;
  }
  int v4 = [*(id *)(a1 + 312) depthType];
  unint64_t v5 = [*(id *)(a1 + 312) depthDimensions];
  unsigned int v6 = v4 - 1;
  if ((v4 - 1) <= 1)
  {
    unint64_t v7 = v5;
    unint64_t v8 = HIDWORD(v5);
    float v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    v42[0] = *(void *)(a1 + 344);
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F537F0]];
    if ([*(id *)(a1 + 312) depthOutputEnabled])
    {
      double v11 = (void *)[*(id *)(a1 + 248) videoFormat];
    }
    else
    {
      if ([*(id *)(a1 + 312) videoCaptureOutputEnabled]) {
        uint64_t v12 = 208;
      }
      else {
        uint64_t v12 = 200;
      }
      double v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + v12), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "resolvedVideoFormat");
    }
    uint64_t v13 = [v11 pixelFormat];
    uint64_t v14 = [NSNumber numberWithUnsignedInt:v13];
    [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F53808]];
    if (!*(unsigned char *)(a1 + 160) || [*(id *)(a1 + 96) captureStream] == *(void *)(a1 + 104))
    {
      uint64_t v24 = [NSNumber numberWithInt:v7];
      [v9 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F53810]];
      uint64_t v22 = [NSNumber numberWithInt:v8];
      uint64_t v23 = (void *)MEMORY[0x1E4F53800];
    }
    else
    {
      uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "portType");
      [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F537E8]];
      uint64_t v16 = [NSNumber numberWithInt:v8];
      [v9 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F53810]];
      uint64_t v17 = [NSNumber numberWithInt:v7];
      [v9 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F53800]];
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionEnabled"));
      [v9 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F53818]];
      if (![*(id *)(a1 + 312) RGBIRStereoFusionEnabled]) {
        goto LABEL_22;
      }
      if (*(unsigned char *)(a1 + 354))
      {
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionMinDepthThresholdMM"));
        [v9 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F53838]];
      }
      if (*(unsigned char *)(a1 + 355))
      {
        uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionMaxDepthThresholdMM"));
        [v9 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F53830]];
      }
      if (!*(unsigned char *)(a1 + 356)) {
        goto LABEL_22;
      }
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionFixedDepthThresholdMM"));
      [v9 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F53820]];
      uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 312), "RGBIRStereoFusionFixedDepthValueMM"));
      uint64_t v23 = (void *)MEMORY[0x1E4F53828];
    }
    [v9 setObject:v22 forKeyedSubscript:*v23];
LABEL_22:
    if (*(unsigned char *)(a1 + 352))
    {
      uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "hardwareDepthFilteringPreferred"));
      [v9 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F537F8]];
    }
    if (*(unsigned char *)(a1 + 353))
    {
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "strictDepthModePreferred"));
      [v9 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F53840]];
    }
    goto LABEL_26;
  }
  float v9 = 0;
LABEL_26:
  [*(id *)(a1 + 112) setProperty:v3 value:v9];
  if (*(unsigned char *)(a1 + 160))
  {
    if (v6 > 1)
    {
      uint64_t v34 = *MEMORY[0x1E4F53A30];
      uint64_t v35 = &unk_1EFB00DB8;
      uint64_t v28 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v29 = &v35;
      uint64_t v30 = &v34;
      uint64_t v31 = 1;
    }
    else
    {
      uint64_t v27 = *MEMORY[0x1E4F53A38];
      uint64_t v36 = *MEMORY[0x1E4F53A30];
      uint64_t v37 = v27;
      uint64_t v39 = &unk_1EFB00E18;
      BOOL v40 = &unk_1EFB00DB8;
      uint64_t v38 = *MEMORY[0x1E4F53A40];
      BOOL v41 = &unk_1EFB00E00;
      uint64_t v28 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v29 = &v39;
      uint64_t v30 = &v36;
      uint64_t v31 = 3;
    }
    uint64_t v32 = objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31, v34, v35, v36, v37, v38, v39, v40, v41);
    [*(id *)(a1 + 112) setProperty:*MEMORY[0x1E4F549C8] value:v32];
    objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54BF0], objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "isAutoFocusAssistSourceNode")));
  }
  return 0;
}

- (uint64_t)_updateObjectDetectionMetadataRegistration
{
  if (result)
  {
    uint64_t v1 = result;
    objc_msgSend(*(id *)(result + 104), "setObjectDetectionStartupDeferred:", objc_msgSend(*(id *)(result + 312), "objectDetectionStartupDeferred"));
    if (([*(id *)(v1 + 312) detectedFacesOnVideoCaptureOutputEnabled] & 1) != 0
      || ([*(id *)(v1 + 312) detectedFacesOnPreviewOutputEnabled] & 1) != 0)
    {
      uint64_t v2 = 1;
    }
    else
    {
      uint64_t v2 = [*(id *)(v1 + 312) detectedObjectsOutputEnabled];
    }
    [*(id *)(v1 + 104) setFaceDetectionEnabled:v2];
    objc_msgSend(*(id *)(v1 + 104), "setFaceDetectionConfiguration:", objc_msgSend(*(id *)(v1 + 312), "detectedFacesOutputConfiguration"));
    objc_msgSend(*(id *)(v1 + 104), "setDetectedObjectTypes:", objc_msgSend(*(id *)(v1 + 312), "enabledDetectedObjectTypes"));
    uint64_t v3 = [*(id *)(v1 + 312) eyeDetectionRequired];
    int v4 = *(void **)(v1 + 104);
    return [v4 setEyeDetectionRequired:v3];
  }
  return result;
}

- (uint64_t)_updateMetadataConfigurations
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    int v2 = [*(id *)(result + 312) motionAttachmentsSource];
    BOOL v3 = v2 == 2 || [v1[39] motionAttachmentsSource] == 1;
    int v4 = (void *)[v1[14] supportedProperties];
    uint64_t v5 = *MEMORY[0x1E4F549B0];
    if ([v4 objectForKeyedSubscript:*MEMORY[0x1E4F549B0]]) {
      objc_msgSend(v1[14], "setProperty:value:", v5, objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v1[39], "ispAPSDataEnabled")));
    }
    else {
      [v1[39] ispAPSDataEnabled];
    }
    unsigned int v6 = (void *)[v1[14] supportedProperties];
    uint64_t v7 = *MEMORY[0x1E4F549B8];
    if ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F549B8]])
    {
      objc_msgSend(v1[14], "setProperty:value:", v7, objc_msgSend(NSNumber, "numberWithBool:", v2 == 2));
    }
    else if (v2 == 2)
    {
      [v1[12] captureStream];
    }
    unint64_t v8 = objc_msgSend((id)objc_msgSend(v1[13], "stream"), "supportedProperties");
    double result = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F549C0]];
    if (result)
    {
      id v9 = v1[13];
      return [v9 setMotionDataDeliveryEnabled:v3];
    }
  }
  return result;
}

- (void)_attachCameraIntrinsicMatrixToSampleBuffer:(int)a3 scaledToVideoBuffer:(int)a4 addToMetadataDictInTotalSensorCoords:
{
  if (!a1) {
    return;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  id v9 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  float v47 = 1.0;
  unsigned int v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
  if (v10 <= 1) {
    int v11 = 1;
  }
  else {
    int v11 = v10;
  }
  int v12 = [*(id *)(a1 + 312) horizontalSensorBinningFactor] * v11;
  uint64_t v13 = [*(id *)(a1 + 312) verticalSensorBinningFactor] * v11;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  int8x16_t v45 = *(int8x16_t *)MEMORY[0x1E4F1DB28];
  long long v46 = v14;
  int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  int v40 = a3;
  int v41 = a4;
  int v39 = CGRectIfPresent;
  if (a3)
  {
    int Width = CVPixelBufferGetWidth(ImageBuffer);
    size_t Height = CVPixelBufferGetHeight(ImageBuffer);
    int v18 = Height;
    FigMotionComputeLensPositionScalingFactor((const __CFDictionary *)v9, Width, Height, v12, v13, &v47);
    *(float *)&double v19 = v47;
    uint64_t v20 = [NSNumber numberWithFloat:v19];
    [v9 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F541C8]];
  }
  else
  {
    if (!CGRectIfPresent) {
      goto LABEL_31;
    }
    int Width = (int)(*(double *)&v46 * (double)v12);
    int v18 = (int)(*((double *)&v46 + 1) * (double)(int)v13);
  }
  int v21 = [*(id *)(a1 + 104) hasFocus];
  int v22 = [*(id *)(a1 + 104) hasSphere];
  float v44 = 0.0;
  if (!*(unsigned char *)(a1 + 10680)
    || (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54118]), "floatValue"),
        float v44 = (float)(v23 * *(float *)(a1 + 132)) * v47,
        v44 == 0.0))
  {
    if ((v21 | v22) == 1)
    {
      LODWORD(v48) = 0;
      if (FigMotionGetGravityZ((const __CFDictionary *)v9, (float *)&v48)
        || FigMotionCalculateAdjustedLensPosition((const __CFDictionary *)v9, a1 + 10624, &v44, *(float *)&v48, v47))
      {
        goto LABEL_31;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F54130]), "floatValue");
      float v44 = (float)((float)(v24 * 1000.0) * *(float *)(a1 + 132)) * v47;
      if (v44 == 0.0)
      {
        int v38 = FigMotionCalculateAdjustedLensPosition((const __CFDictionary *)v9, a1 + 10624, &v44, 0.0, v47);
        *(float *)&double v25 = v44;
        if (v44 == 0.0
          && (uint64_t v26 = *MEMORY[0x1E4F53EA0], objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EA0], v25)))
        {
          objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v26), "floatValue");
          float v44 = (float)((float)(v27 * 1000.0) * *(float *)(a1 + 132)) * v47;
          if (v44 <= 0.0 && v38 != 0) {
            goto LABEL_31;
          }
        }
        else if (v38)
        {
          goto LABEL_31;
        }
      }
    }
  }
  CMSampleBufferGetPresentationTimeStamp(&time, sbuf);
  CMTimeGetSeconds(&time);
  float64x2_t v42 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  if (FigMotionComputePrincipalPoint((const __CFDictionary *)v9, Width, v18, v12, v13, v22, &v42, *(float *)(a1 + 132), v47))
  {
LABEL_31:
    FigDebugAssert3();
    return;
  }
  *(float32x2_t *)&v29.f64[0] = vcvt_f32_f64(v42);
  LODWORD(v30) = 0;
  *((float *)&v30 + 1) = v44;
  long long v48 = LODWORD(v44);
  long long v49 = v30;
  *(void *)&v29.f64[1] = __PAIR64__(HIDWORD(v42.f64[1]), 1.0);
  float64x2_t v50 = v29;
  id v31 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v48 length:48];
  if (v40)
  {
    CMSetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F1F218], v31, 1u);
  }
  else
  {
    CMSetAttachment(sbuf, @"OriginalCameraIntrinsicMatrix", v31, 1u);
    v51.CGFloat width = (double)Width;
    v51.CGFloat height = (double)v18;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v51);
    CMSetAttachment(sbuf, @"OriginalCameraIntrinsicMatrixReferenceDimensions", DictionaryRepresentation, 1u);
  }
  if (v41)
  {
    int32x2_t v33 = vdup_n_s32(v39 == 0);
    v34.i64[0] = v33.u32[0];
    v34.i64[1] = v33.u32[1];
    float64x2_t v35 = vaddq_f64(v42, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v34, 0x3FuLL)), (int8x16_t)vdupq_n_s64(0x8000000000000000), v45));
    *(float32x2_t *)&v35.f64[0] = vcvt_f32_f64(v35);
    LODWORD(v36) = 0;
    *((float *)&v36 + 1) = v44;
    long long v48 = LODWORD(v44);
    long long v49 = v36;
    LODWORD(v35.f64[1]) = 1.0;
    float64x2_t v50 = v35;
    id v37 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v48 length:48];
    [v9 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F53540]];
  }
}

BOOL __72__BWMultiStreamCameraSourceNode_updateFormatRequirementsFromSourceNode___block_invoke(uint64_t a1, void *a2)
{
  if (!((unint64_t)FigCapturePixelFormatTileAlignment([a2 intValue]) >> 32)) {
    return 1;
  }
  if (*(void *)(a1 + 32)) {
    return 0;
  }
  if (!*(void *)(a1 + 40)) {
    return 1;
  }
  return *(unsigned char *)(a1 + 48) != 0;
}

- (BWMultiStreamCameraSourceNodeConfiguration)configuration
{
  return self->_configuration;
}

- (BWNodeOutput)previewOutput
{
  return self->_previewOutput;
}

- (uint64_t)_firmwareStillImageOutputRetainedBufferCountForClientBracketCount:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    double result = [*(id *)(result + 312) stillImageOutputEnabled];
    if (result)
    {
      double result = [*(id *)(v3 + 312) usesFirmwareStillImageOutput];
      if (result)
      {
        unsigned int v4 = *(_DWORD *)(v3 + 10800);
        if (v4 == -1)
        {
          int v5 = [*(id *)(v3 + 216) retainedBufferCount];
          double result = (a2 + 1);
          if (v5 > (int)result)
          {
            unsigned int v6 = *(void **)(v3 + 216);
            return [v6 retainedBufferCount];
          }
        }
        else if ((int)v4 <= a2 + 1)
        {
          return (a2 + 1);
        }
        else
        {
          return v4;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_updateOutputRequirements
{
  v116[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  uint64_t v2 = [*(id *)(a1 + 312) secureMetadataOutputConfiguration];
  objc_msgSend(*(id *)(v1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F548F0], objc_msgSend(NSNumber, "numberWithBool:", v2 != 0));
  uint64_t updated = -[BWMultiStreamCameraSourceNode _updateFormatIndex](v1);
  if (updated)
  {
    uint64_t v85 = updated;
LABEL_138:
    FigDebugAssert3();
    return v85;
  }
  uint64_t v4 = -[BWMultiStreamCameraSourceNode _updateActiveNondisruptiveSwitchingFormatIndices](v1);
  if (v4)
  {
    uint64_t v85 = v4;
    goto LABEL_138;
  }
  uint64_t v5 = -[BWMultiStreamCameraSourceNode _updateOutputIDs](v1);
  if (v5)
  {
    uint64_t v85 = v5;
    goto LABEL_138;
  }
  if ([*(id *)(v1 + 312) previewOutputEnabled]
    && [*(id *)(v1 + 312) videoCaptureOutputEnabled]
    && [*(id *)(v1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled]
    && [*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled]
    && (-[BWMultiStreamCameraSourceNode _scalerChainingEnabled](v1) & 1) == 0)
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Cannot have two streaming outputs AND GDC enabled without scaler chaining.", 0 reason userInfo]);
  }
  -[BWMultiStreamCameraSourceNode _updateOutputsStorage](v1);
  -[BWMultiStreamCameraSourceNode _updateVideoCaptureOutputFlags](v1);
  -[BWMultiStreamCameraSourceNode _updateColorSpaceProperties](v1);
  if ([*(id *)(v1 + 312) depthType] - 1 > 1)
  {
    unsigned int v6 = 0;
  }
  else if ([*(id *)(v1 + 312) depthOutputEnabled])
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = @"Depth";
  }
  if ([*(id *)(v1 + 312) previewOutputEnabled])
  {
    uint64_t v7 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v1, *(void **)(v1 + 10736), *(void **)(v1 + 200));
    unint64_t v8 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v1, *(void **)(v1 + 10736), v7);
    [(BWVideoFormatRequirements *)v8 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
    [(BWVideoFormatRequirements *)v8 setPrewireBuffers:0];
    v116[0] = [NSNumber numberWithInt:*(unsigned int *)(v1 + 328)];
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v8, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:1]);
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 200), "primaryMediaConfiguration"), "setFormatRequirements:", v8);
    [*(id *)(v1 + 200) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@(%@)", objc_msgSend(*(id *)(v1 + 200), "name"), *(void *)(v1 + 10736))];
    if (v6)
    {
      id v9 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v9, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v1));
      [*(id *)(v1 + 200) setMediaConfiguration:v9 forAttachedMediaKey:v6];
    }
    if ([*(id *)(v1 + 312) preLTMThumbnailOnPreviewOutputEnabled])
    {
      unsigned int v10 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v10, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPreLTMThumbnailOutput](v1));
      [*(id *)(v1 + 200) setMediaConfiguration:v10 forAttachedMediaKey:0x1EFA68BE0];
    }
    if ([*(id *)(v1 + 312) postColorProcessingThumbnailOnPreviewOutputEnabled])
    {
      int v11 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v11, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPostColorProcessingThumbnailOutput](v1));
      [*(id *)(v1 + 200) setMediaConfiguration:v11 forAttachedMediaKey:0x1EFA74960];
    }
    *(void *)(v1 + 10760) = -[BWMultiStreamCameraSourceNode _colorInfoDictionaryForStreamOutputID:]((id *)v1, *(void **)(v1 + 10736));
  }
  else
  {
    [*(id *)(v1 + 200) setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  }
  if ([*(id *)(v1 + 312) videoCaptureOutputEnabled])
  {
    int v12 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v1, *(void **)(v1 + 10768), *(void **)(v1 + 208));
    uint64_t v13 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v1, *(void **)(v1 + 10768), v12);
    [(BWVideoFormatRequirements *)v13 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
    [(BWVideoFormatRequirements *)v13 setPrewireBuffers:0];
    uint64_t v115 = [NSNumber numberWithInt:*(unsigned int *)(v1 + 328)];
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v13, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1]);
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 208), "primaryMediaConfiguration"), "setFormatRequirements:", v13);
    [*(id *)(v1 + 208) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@(%@)", objc_msgSend(*(id *)(v1 + 208), "name"), *(void *)(v1 + 10768))];
    if (v6)
    {
      long long v14 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v1));
      [*(id *)(v1 + 208) setMediaConfiguration:v14 forAttachedMediaKey:v6];
    }
    if ([*(id *)(v1 + 312) visionDataConfiguration])
    {
      uint64_t v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      uint64_t v16 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v16 setWidth:128];
      [(BWVideoFormatRequirements *)v16 setHeight:128];
      [(BWVideoFormatRequirements *)v16 setSupportedPixelFormats:&unk_1EFB03E60];
      [(BWVideoFormatRequirements *)v16 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
      [(BWNodeOutputMediaConfiguration *)v15 setFormatRequirements:v16];
      [*(id *)(v1 + 208) setMediaConfiguration:v15 forAttachedMediaKey:0x1EFA60460];
    }
    if ([*(id *)(v1 + 312) preLTMThumbnailOnVideoCaptureOutputEnabled])
    {
      uint64_t v17 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPreLTMThumbnailOutput](v1));
      [*(id *)(v1 + 208) setMediaConfiguration:v17 forAttachedMediaKey:0x1EFA68BE0];
    }
    if ([*(id *)(v1 + 312) postColorProcessingThumbnailOnVideoCaptureOutputEnabled])
    {
      int v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v18, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPostColorProcessingThumbnailOutput](v1));
      [*(id *)(v1 + 208) setMediaConfiguration:v18 forAttachedMediaKey:0x1EFA74960];
    }
    *(void *)(v1 + 10784) = -[BWMultiStreamCameraSourceNode _colorInfoDictionaryForStreamOutputID:]((id *)v1, *(void **)(v1 + 10768));
  }
  else
  {
    [*(id *)(v1 + 208) setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  }
  char v19 = [*(id *)(v1 + 312) stillImageOutputEnabled];
  uint64_t v20 = (uint64_t *)MEMORY[0x1E4F55318];
  uint64_t v90 = v1;
  if ((v19 & 1) != 0 || [*(id *)(v1 + 312) forceFirmwareStillImageOutputEnabled])
  {
    int v21 = *(void **)(v1 + 10792);
    if (!v21) {
      int v21 = *(void **)(v1 + 10768);
    }
    float v88 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", *(int *)(v1 + 320)), "objectForKeyedSubscript:", *v20), "objectForKeyedSubscript:", v21);
    if (([*(id *)(v1 + 312) usesFirmwareStillImageOutput] & 1) != 0
      || [*(id *)(v1 + 312) forceFirmwareStillImageOutputEnabled])
    {
      int v22 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStillImageOutputID:](v1, v21);
    }
    else
    {
      int v23 = [*(id *)(v1 + 312) videoCaptureOutputEnabled];
      float v24 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__stillImageOutput;
      if (v23) {
        float v24 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureOutput;
      }
      int v22 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:]((id *)v1, v21, *(void **)(v1 + *v24));
    }
    double v25 = v22;
    uint64_t v26 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v1, v21, v22);
    if ([*(id *)(v1 + 312) usesFirmwareStillImageOutput]) {
      [(BWVideoFormatRequirements *)v26 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
    }
    uint64_t v114 = [NSNumber numberWithInt:-[BWMultiStreamCameraSourceNode _stillImageColorSpaceProperties](v1)];
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v26, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1]);
    [(BWVideoFormatRequirements *)v26 setPrewireBuffers:0];
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 216), "primaryMediaConfiguration"), "setFormatRequirements:", v26);
    [*(id *)(v1 + 216) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@(%@)", objc_msgSend(*(id *)(v1 + 216), "name"), v21)];
    if ([*(id *)(v1 + 312) depthType] - 1 <= 1
      && ([*(id *)(v1 + 312) discardsDepthDataForStillImages] & 1) == 0)
    {
      float v27 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v27, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v1));
      [*(id *)(v1 + 216) setMediaConfiguration:v27 forAttachedMediaKey:@"Depth"];
    }
    if ([*(id *)(v1 + 312) stillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount])
    {
      uint64_t v28 = *(unsigned int *)(v1 + 384 + ((uint64_t)(int)mscsn_streamOutputIndexForOutputID(v21) << 9) + 116);
      if (v28)
      {
        float64x2_t v29 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        unint64_t v30 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v30 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
        -[BWVideoFormatRequirements setWidth:](v30, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v30, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue"));
        uint64_t v113 = [NSNumber numberWithUnsignedInt:v28];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v30, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1]);
        [(BWNodeOutputMediaConfiguration *)v29 setFormatRequirements:v30];
        [(BWNodeOutputMediaConfiguration *)v29 setProvidesPixelBufferPool:0];
        [*(id *)(v1 + 216) setMediaConfiguration:v29 forAttachedMediaKey:0x1EFA74360];
      }
    }
    if ([*(id *)(v1 + 312) stillImageOutputSashimiRawAttachmentOptionRetainedBufferCount])
    {
      uint64_t v31 = *(unsigned int *)(v1 + 384 + ((uint64_t)(int)mscsn_streamOutputIndexForOutputID(v21) << 9) + 120);
      if (v31)
      {
        uint64_t v32 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        int32x2_t v33 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v33 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
        -[BWVideoFormatRequirements setWidth:](v33, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v33, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue"));
        uint64_t v112 = [NSNumber numberWithUnsignedInt:v31];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1]);
        [(BWNodeOutputMediaConfiguration *)v32 setFormatRequirements:v33];
        [(BWNodeOutputMediaConfiguration *)v32 setProvidesPixelBufferPool:0];
        [*(id *)(v1 + 216) setMediaConfiguration:v32 forAttachedMediaKey:0x1EFA74380];
      }
    }
    if ([*(id *)(v1 + 312) stillImageOutputSushiRawAttachmentOptionSupportEnabled])
    {
      uint64_t v34 = *(unsigned int *)(v1 + 384 + ((uint64_t)(int)mscsn_streamOutputIndexForOutputID(v21) << 9) + 124);
      if (v34)
      {
        float64x2_t v35 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        unint64_t v36 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v36 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
        -[BWVideoFormatRequirements setWidth:](v36, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue"));
        -[BWVideoFormatRequirements setHeight:](v36, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue"));
        uint64_t v111 = [NSNumber numberWithUnsignedInt:v34];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v36, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1]);
        [(BWNodeOutputMediaConfiguration *)v35 setFormatRequirements:v36];
        [(BWNodeOutputMediaConfiguration *)v35 setProvidesPixelBufferPool:0];
        [*(id *)(v1 + 216) setMediaConfiguration:v35 forAttachedMediaKey:0x1EFA743A0];
      }
    }
    if ([*(id *)(v1 + 312) stillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount]&& objc_msgSend((id)objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E4F550B8]), "BOOLValue"))
    {
      id v37 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      int v38 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v38 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
      [(BWVideoFormatRequirements *)v38 setWidth:1];
      [(BWVideoFormatRequirements *)v38 setHeight:1];
      [(BWVideoFormatRequirements *)v38 setSupportedPixelFormats:&unk_1EFB03E78];
      [(BWNodeOutputMediaConfiguration *)v37 setFormatRequirements:v38];
      [(BWNodeOutputMediaConfiguration *)v37 setProvidesPixelBufferPool:0];
      [*(id *)(v1 + 216) setMediaConfiguration:v37 forAttachedMediaKey:0x1EFA743C0];
    }
    *(void *)(v1 + 10848) = -[BWMultiStreamCameraSourceNode _colorInfoDictionaryForStreamOutputID:]((id *)v1, v21);
    uint64_t v20 = (uint64_t *)MEMORY[0x1E4F55318];
  }
  else
  {
    [*(id *)(v1 + 216) setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  }
  if ([*(id *)(v1 + 312) sensorRawStillImageOutputEnabled])
  {
    int v39 = *(void **)(v1 + 10856);
    if (!v39) {
      return 4294954516;
    }
    int v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(*(id *)(v1 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"));
    objc_msgSend(v40, "addObjectsFromArray:", objc_msgSend(*(id *)(v1 + 312), "activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices"));
    objc_msgSend(v40, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(v1 + 320)));
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v103 objects:v110 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v104;
      uint64_t v44 = *v20;
LABEL_68:
      uint64_t v45 = 0;
      while (1)
      {
        if (*(void *)v104 != v43) {
          objc_enumerationMutation(v40);
        }
        if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v90 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((void *)&v103 + 1) + 8 * v45), "intValue")), "objectForKeyedSubscript:", v44), "allKeys"), "containsObject:", v39))return 4294954516; {
        if (v42 == ++v45)
        }
        {
          uint64_t v42 = [v40 countByEnumeratingWithState:&v103 objects:v110 count:16];
          if (v42) {
            goto LABEL_68;
          }
          break;
        }
      }
    }
    long long v46 = -[BWMultiStreamCameraSourceNode _outputConfigurationForStillImageOutputID:](v90, v39);
    float v47 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)v90, v39, v46);
    [(BWVideoFormatRequirements *)v47 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedDisplayAccess]];
    [(BWVideoFormatRequirements *)v47 setSupportedColorSpaceProperties:0];
    [(BWVideoFormatRequirements *)v47 setPrewireBuffers:0];
    objc_msgSend((id)objc_msgSend(*(id *)(v90 + 224), "primaryMediaConfiguration"), "setFormatRequirements:", v47);
    [*(id *)(v90 + 224) setProvidesPixelBufferPool:0];
    uint64_t v1 = v90;
    [*(id *)(v90 + 224) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@(%@)", objc_msgSend(*(id *)(v90 + 224), "name"), v39)];
  }
  else
  {
    [*(id *)(v1 + 224) setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v48 = (void *)[*(id *)(v1 + 312) activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v99 objects:v109 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    unsigned int v51 = 0;
    LODWORD(v52) = 0;
    uint64_t v53 = *(void *)v100;
    uint64_t v54 = *MEMORY[0x1E4F55300];
    uint64_t v55 = *MEMORY[0x1E4F552F8];
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v100 != v53) {
          objc_enumerationMutation(v48);
        }
        int v57 = objc_msgSend(*(id *)(v90 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * i), "intValue"));
        int v58 = objc_msgSend((id)objc_msgSend(v57, "objectForKeyedSubscript:", v54), "intValue");
        int v59 = objc_msgSend((id)objc_msgSend(v57, "objectForKeyedSubscript:", v55), "intValue");
        if ((int)v51 <= v58) {
          unsigned int v51 = v58;
        }
        if ((int)v52 <= v59) {
          uint64_t v52 = v59;
        }
        else {
          uint64_t v52 = v52;
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v50);
  }
  else
  {
    unsigned int v51 = 0;
    uint64_t v52 = 0;
  }
  uint64_t v60 = v90;
  if (FigCaptureVideoDimensionsAreValid(v51 | (unint64_t)(v52 << 32)))
  {
    *(_DWORD *)(v90 + 10816) = v51;
    *(_DWORD *)(v90 + 10820) = v52;
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v61 = (void *)[*(id *)(v90 + 312) activeStreamingNondisruptiveSwitchingFormatIndices];
  uint64_t v62 = [v61 countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    unsigned int v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = *(void *)v96;
    uint64_t v67 = *MEMORY[0x1E4F552C8];
    uint64_t v89 = *MEMORY[0x1E4F55300];
    uint64_t v87 = *MEMORY[0x1E4F552F8];
    do
    {
      for (uint64_t j = 0; j != v63; ++j)
      {
        if (*(void *)v96 != v66) {
          objc_enumerationMutation(v61);
        }
        float v69 = *(void **)(*((void *)&v95 + 1) + 8 * j);
        int v70 = [v69 intValue];
        if (v70 != -[BWMultiStreamCameraSourceNode _ultraHighResolutionNondisruptiveStreamingFormatIndex](v90))
        {
          int v71 = objc_msgSend(*(id *)(v90 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(v69, "intValue"));
          long long v72 = (void *)[v71 objectForKeyedSubscript:v67];
          if (v72)
          {
            if ([v72 intValue] == 1)
            {
              int v73 = objc_msgSend((id)objc_msgSend(v71, "objectForKeyedSubscript:", v89), "intValue");
              int v74 = objc_msgSend((id)objc_msgSend(v71, "objectForKeyedSubscript:", v87), "intValue");
              if ((int)v64 <= v73) {
                unsigned int v64 = v73;
              }
              if ((int)v65 <= v74) {
                uint64_t v65 = v74;
              }
              else {
                uint64_t v65 = v65;
              }
            }
          }
        }
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v95 objects:v108 count:16];
    }
    while (v63);
  }
  else
  {
    unsigned int v64 = 0;
    uint64_t v65 = 0;
  }
  if (FigCaptureVideoDimensionsAreValid(v64 | (unint64_t)(v65 << 32)))
  {
    *(_DWORD *)(v90 + 11140) = v64;
    *(_DWORD *)(v90 + 11144) = v65;
  }
  if ([*(id *)(v90 + 312) depthOutputEnabled])
  {
    double v75 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForDepthOutput](v90);
    [(BWVideoFormatRequirements *)v75 setPrewireBuffers:0];
  }
  else
  {
    double v75 = objc_alloc_init(BWVideoFormatRequirements);
  }
  [*(id *)(v90 + 248) setFormatRequirements:v75];
  if ([*(id *)(v90 + 312) pointCloudOutputEnabled]) {
    float v76 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPointCloudOutput]((id *)v90);
  }
  else {
    float v76 = objc_alloc_init(BWPointCloudFormatRequirements);
  }
  [*(id *)(v90 + 256) setFormatRequirements:v76];
  if ([*(id *)(v90 + 312) lightSourceMaskOutputEnabled])
  {
    [*(id *)(v90 + 264) setFormatRequirements:-[BWMultiStreamCameraSourceNode _videoFormatRequirementsForLightSourceMaskOutput](v90)];
    uint64_t v60 = v90;
    if (![*(id *)(v90 + 264) formatRequirements]) {
      return 4294954516;
    }
  }
  if ([*(id *)(v60 + 312) keypointDescriptorDataOutputEnabled])
  {
    [*(id *)(v90 + 272) setFormatRequirements:-[BWMultiStreamCameraSourceNode _videoFormatRequirementsForKeypointDescriptorDataOutput](v60)];
    uint64_t v60 = v90;
    if (![*(id *)(v90 + 272) formatRequirements]) {
      return 4294954516;
    }
  }
  if ([*(id *)(v60 + 312) semanticMasksOutputEnabled])
  {
    int v77 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v77 setWidth:1];
    [(BWVideoFormatRequirements *)v77 setHeight:1];
    [(BWVideoFormatRequirements *)v77 setSupportedPixelFormats:&unk_1EFB03E90];
    [*(id *)(v90 + 280) setFormatRequirements:v77];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    double v78 = (void *)[*(id *)(v90 + 312) enabledSemanticMaskTypes];
    uint64_t v79 = [v78 countByEnumeratingWithState:&v91 objects:v107 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v92;
LABEL_124:
      uint64_t v82 = 0;
      while (1)
      {
        if (*(void *)v92 != v81) {
          objc_enumerationMutation(v78);
        }
        v83 = *(void **)(*((void *)&v91 + 1) + 8 * v82);
        int v84 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v84, "setFormatRequirements:", -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForSemanticMaskType:](v90, v83));
        if (![(BWNodeOutputMediaConfiguration *)v84 formatRequirements]) {
          return 4294954516;
        }
        [(BWNodeOutputMediaConfiguration *)v84 setProvidesPixelBufferPool:0];
        [*(id *)(v90 + 280) setMediaConfiguration:v84 forAttachedMediaKey:v83];
        if (v80 == ++v82)
        {
          uint64_t v80 = [v78 countByEnumeratingWithState:&v91 objects:v107 count:16];
          if (v80) {
            goto LABEL_124;
          }
          break;
        }
      }
    }
  }
  if ([*(id *)(v90 + 312) preLTMThumbnailOutputEnabled])
  {
    [*(id *)(v90 + 304) setFormatRequirements:-[BWMultiStreamCameraSourceNode _videoFormatRequirementsForPreLTMThumbnailOutput](v90)];
    if (![*(id *)(v90 + 304) formatRequirements]) {
      return 4294954516;
    }
  }
  return 0;
}

- (void)_outputConfigurationForStillImageOutputID:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v80 = (void *)[*(id *)(a1 + 120) objectAtIndexedSubscript:*(int *)(a1 + 320)];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v80, "objectForKeyedSubscript:", *MEMORY[0x1E4F55318]), "objectForKeyedSubscript:", a2);
  double v6 = -[BWMultiStreamCameraSourceNode _totalAvailableOverscan](a1);
  double v8 = v7;
  double v10 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v11 = v7 == v9 && v6 == *MEMORY[0x1E4F1DB30];
  if (![*(id *)(a1 + 312) includeOverscanOnStillImageOutput])
  {
    double v9 = v8;
    double v10 = v6;
  }
  int v12 = (void *)*MEMORY[0x1E4F55428];
  if (([a2 isEqualToString:*MEMORY[0x1E4F55428]] & 1) == 0
    && ([a2 isEqualToString:*MEMORY[0x1E4F55430]] & 1) == 0
    && ![a2 isEqualToString:*MEMORY[0x1E4F55440]])
  {
    [a2 isEqualToString:*MEMORY[0x1E4F55438]];
    return v4;
  }
  uint64_t v79 = (void *)v5;
  int v78 = mscsn_streamOutputIndexForOutputID(a2);
  int v13 = [*(id *)(a1 + 312) horizontalSensorBinningFactor];
  int v14 = [*(id *)(a1 + 312) verticalSensorBinningFactor];
  int v15 = [*(id *)(a1 + 312) fesBinningFactorHorizontal];
  unint64_t v16 = [*(id *)(a1 + 312) cropAspectRatio];
  if (([*(id *)(a1 + 312) cinematicFramingEnabled] & 1) != 0
    || [*(id *)(a1 + 312) manualCinematicFramingEnabled])
  {
    unint64_t v76 = 0;
    LODWORD(v16) = 0;
  }
  else
  {
    unint64_t v76 = HIDWORD(v16);
  }
  uint64_t v77 = [*(id *)(a1 + 312) sensorCropDimensions];
  if ([*(id *)(a1 + 312) geometricDistortionCorrectionOnStillImageOutputEnabled]
    && FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 312) postGDCCropDimensions]))
  {
    uint64_t v77 = [*(id *)(a1 + 312) postGDCCropDimensions];
  }
  float v17 = (float)v13;
  if ([*(id *)(a1 + 312) stillImageOutputEnabled])
  {
    uint64_t v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "videoFormat"), "pixelFormat");
LABEL_21:
    uint64_t v19 = v18;
    goto LABEL_23;
  }
  if ([*(id *)(a1 + 312) forceFirmwareStillImageOutputEnabled])
  {
    uint64_t v18 = objc_msgSend((id)objc_msgSend(-[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:]((id *)a1, a2), "firstObject"), "intValue");
    goto LABEL_21;
  }
  uint64_t v19 = 0;
LABEL_23:
  float v20 = (float)v15;
  float v21 = v17 / (float)v14;
  if ([a2 isEqualToString:v12])
  {
    [*(id *)(a1 + 312) sensorCenterOffset];
    double v23 = v22;
    double v25 = v24;
    int v26 = [*(id *)(a1 + 312) roundingOfStillImageDimensionsToMultipleOfFourEnabled];
    unsigned __int8 v27 = [*(id *)(a1 + 312) geometricDistortionCorrectionOnStillImageOutputEnabled];
    uint64_t v28 = a2;
    float64x2_t v29 = v80;
    mscsn_setScalerCropAndOutputDimensionsInConfiguration(v4, v28, v80, v77, v16 | (v76 << 32), 0, v26, 0, v10, v9, v23, v25, v21, (float)v15, v27);
    if (!v11 && [*(id *)(a1 + 312) includeOverscanOnStillImageOutput])
    {
      int v30 = v78;
      if (([*(id *)(a1 + 312) includeOverscanInStillImageFinalCropRect] & 1) == 0)
      {
        *(double *)(a1 + 10824) = v6;
        *(double *)(a1 + 10832) = v8;
        int v31 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue");
        int v32 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue");
        *(_DWORD *)(a1 + 10808) = 2 * llroundf((float)(int)((double)v31 / (v6 + 1.0)) * 0.5);
        *(_DWORD *)(a1 + 10812) = 2 * llroundf((float)(int)((double)v32 / (v8 + 1.0)) * 0.5);
      }
      goto LABEL_40;
    }
  }
  else
  {
    if (![a2 isEqualToString:*MEMORY[0x1E4F55430]])
    {
      int v30 = v78;
      if ([a2 isEqualToString:*MEMORY[0x1E4F55440]])
      {
        float64x2_t v29 = v80;
        if (!*(unsigned char *)(a1 + 160))
        {
          uint64_t v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "videoFormat"), "pixelFormat");
          if (([*(id *)(a1 + 312) includeOverscanInStillImageFinalCropRect] & 1) == 0)
          {
            int v35 = objc_msgSend((id)objc_msgSend(v80, "objectForKeyedSubscript:", *MEMORY[0x1E4F55300]), "intValue");
            int v36 = objc_msgSend((id)objc_msgSend(v80, "objectForKeyedSubscript:", *MEMORY[0x1E4F552F8]), "intValue");
            uint64_t v81 = 0;
            int v37 = [*(id *)(a1 + 312) roundingOfStillImageDimensionsToMultipleOfFourEnabled];
            int v38 = [*(id *)(a1 + 312) geometricDistortionCorrectionOnStillImageOutputEnabled];
            int v39 = v37;
            float64x2_t v29 = v80;
            mscsn_calculateScalerCropAndOutputDimensions(v12, v80, v77, v16 | (v76 << 32), 0, v39, 0, v38, v6, v8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v21, v20, 0, &v81);
            v40.i64[0] = v35;
            v40.i64[1] = v36;
            float64x2_t v41 = vcvtq_f64_s64(v40);
            v40.i64[0] = (int)v81;
            v40.i64[1] = SHIDWORD(v81);
            __asm { FMOV            V1.2D, #-1.0 }
            *(float64x2_t *)(a1 + 10864) = vaddq_f64(vdivq_f64(v41, vcvtq_f64_s64(v40)), _Q1);
          }
        }
      }
      else
      {
        float64x2_t v29 = v80;
      }
      goto LABEL_40;
    }
    int v33 = objc_msgSend((id)objc_msgSend(v79, "objectForKeyedSubscript:", *MEMORY[0x1E4F55480]), "intValue");
    int v34 = objc_msgSend((id)objc_msgSend(v79, "objectForKeyedSubscript:", *MEMORY[0x1E4F55470]), "intValue");
    float64x2_t v29 = v80;
    if (v11 || ([*(id *)(a1 + 312) includeOverscanInStillImageFinalCropRect] & 1) != 0)
    {
      *(_DWORD *)(a1 + 10808) = v33;
      *(_DWORD *)(a1 + 10812) = v34;
    }
    else
    {
      uint64_t v81 = 0;
      [*(id *)(a1 + 312) sensorCenterOffset];
      double v48 = v47;
      double v50 = v49;
      int v51 = [*(id *)(a1 + 312) roundingOfStillImageDimensionsToMultipleOfFourEnabled];
      int v52 = [*(id *)(a1 + 312) geometricDistortionCorrectionOnStillImageOutputEnabled];
      int v53 = v51;
      float64x2_t v29 = v80;
      mscsn_calculateScalerCropAndOutputDimensions(v12, v80, v77, v16 | (v76 << 32), 0, v53, 0, v52, v6, v8, v48, v50, v21, v20, 0, &v81);
      v54.i64[0] = v33;
      v54.i64[1] = v34;
      float64x2_t v55 = vcvtq_f64_s64(v54);
      v54.i64[0] = (int)v81;
      v54.i64[1] = SHIDWORD(v81);
      __asm { FMOV            V1.2D, #-1.0 }
      *(float64x2_t *)(a1 + 10824) = vaddq_f64(vdivq_f64(v55, vcvtq_f64_s64(v54)), _Q1);
      *(void *)(a1 + 10808) = v81;
    }
  }
  int v30 = v78;
LABEL_40:
  uint64_t v57 = [NSNumber numberWithUnsignedInt:v19];
  [v4 setObject:v57 forKeyedSubscript:*MEMORY[0x1E4F55388]];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55098]];
  uint64_t v58 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 312), "firmwareTimeMachineBufferCapacity"));
  [v4 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4F550A0]];
  if ([*(id *)(a1 + 312) usesFIFOFirmwareTimeMachine]) {
    int v59 = &unk_1EFB00DB8;
  }
  else {
    int v59 = &unk_1EFB00E00;
  }
  [v4 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F55090]];
  if (objc_msgSend((id)objc_msgSend(v79, "objectForKeyedSubscript:", *MEMORY[0x1E4F550C8]), "intValue"))
  {
    uint64_t v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 10840)];
    [v4 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F55088]];
  }
  uint64_t v61 = v30;
  if (objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E4F552D8]), "BOOLValue"))
  {
    if ((([*(id *)(a1 + 96) softISPEnabled] & 1) != 0
       || [*(id *)(a1 + 312) configureForSoftISPSupport])
      && ([*(id *)(a1 + 312) sensorRawStillImageOutputEnabled] & 1) == 0)
    {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55070]];
    }
    uint64_t v62 = [*(id *)(a1 + 312) firmwareTimeMachineSIFREnabled];
    if ((int)[*(id *)(a1 + 312) maximumNumberOfBracketedSIFRFrames] < 1) {
      uint64_t v63 = 0;
    }
    else {
      uint64_t v63 = [*(id *)(a1 + 312) maximumNumberOfBracketedSIFRFrames];
    }
    uint64_t v64 = [NSNumber numberWithBool:v62];
    [v4 setObject:v64 forKeyedSubscript:*MEMORY[0x1E4F550A8]];
    uint64_t v65 = [NSNumber numberWithInt:v63];
    [v4 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F55068]];
  }
  uint64_t v66 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 96), "redEyeReductionEnabled"));
  [v4 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F55078]];
  uint64_t v67 = a1 + 384 + (v61 << 9);
  if (*(_DWORD *)(v67 + 116))
  {
    int v68 = [*(id *)(a1 + 312) stillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount];
    uint64_t v69 = *MEMORY[0x1E4F55328];
    if ((objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55328]), "BOOLValue") & 1) == 0) {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v68 != 0), v69);
    }
  }
  if (*(_DWORD *)(v67 + 120))
  {
    uint64_t v70 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 312), "stillImageOutputSashimiRawAttachmentOptionRetainedBufferCount"));
    [v4 setObject:v70 forKeyedSubscript:*MEMORY[0x1E4F55080]];
  }
  if (objc_msgSend((id)objc_msgSend(v79, "objectForKeyedSubscript:", *MEMORY[0x1E4F550B8]), "BOOLValue"))
  {
    uint64_t v71 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 312), "stillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount"));
    [v4 setObject:v71 forKeyedSubscript:*MEMORY[0x1E4F55060]];
  }
  long long v72 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "stream"), "supportedProperties");
  if ([v72 objectForKeyedSubscript:*MEMORY[0x1E4F54D10]] && !*(unsigned char *)(a1 + 160))
  {
    int v73 = -[BWMultiStreamCameraSourceNode _stillImageColorSpaceProperties](a1);
    [v4 setObject:BWColorSpacePropertiesGetYCbCrMatrix(v73) forKeyedSubscript:*MEMORY[0x1E4F550B0]];
  }
  if (objc_msgSend((id)objc_msgSend(v79, "objectForKeyedSubscript:", *MEMORY[0x1E4F554B8]), "BOOLValue"))
  {
    uint64_t v74 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 312), "geometricDistortionCorrectionOnStillImageOutputEnabled"));
    [v4 setObject:v74 forKeyedSubscript:*MEMORY[0x1E4F554A8]];
  }
  return v4;
}

- (id)_colorInfoDictionaryForStreamOutputID:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = -[BWMultiStreamCameraSourceNode _colorSpacePropertiesForOuputID:]((uint64_t)result, a2);
    if (v4)
    {
      return (id *)+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:v4];
    }
    else
    {
      return -[BWMultiStreamCameraSourceNode colorInfoForNonColorManagedDevicesForOutputID:](v3, a2);
    }
  }
  return result;
}

- (uint64_t)_updateVideoCaptureOutputFlags
{
  if (result)
  {
    uint64_t v1 = result;
    double result = [*(id *)(result + 312) stillImageOutputEnabled];
    if (result)
    {
      double result = [*(id *)(v1 + 312) usesFirmwareStillImageOutput];
      if ((result & 1) == 0)
      {
        double result = mscsn_streamOutputIndexForOutputID(*(void **)(v1 + 10768));
        *(_DWORD *)(v1 + 384 + ((unint64_t)result << 9) + 4) |= 1u;
      }
    }
  }
  return result;
}

- (uint64_t)_updateOutputsStorage
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 312) visOverscan];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v5 == *MEMORY[0x1E4F1DB30] && v2 == v3)
  {
    [*(id *)(a1 + 312) sensorOverscan];
    BOOL v7 = v8 != v4;
    if (v9 != v3) {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  BOOL v36 = v7;
  uint64_t v42 = (void *)[*(id *)(a1 + 112) getProperty:*MEMORY[0x1E4F54CB8] error:0];
  double v10 = (void *)[*(id *)(a1 + 120) objectAtIndexedSubscript:*(int *)(a1 + 320)];
  BOOL v11 = (void *)[v10 objectForKeyedSubscript:*MEMORY[0x1E4F55318]];
  uint64_t v12 = *MEMORY[0x1E4F55400];
  int v37 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F55400]];
  int v13 = 0;
  uint64_t v41 = *MEMORY[0x1E4F55338];
  uint64_t v39 = *MEMORY[0x1E4F550C0];
  uint64_t v40 = *MEMORY[0x1E4F55348];
  uint64_t v38 = *MEMORY[0x1E4F550C8];
  uint64_t v14 = -10240;
  uint64_t v15 = 9;
  long long v44 = *MEMORY[0x1E4F1F9F8];
  uint64_t v43 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  do
  {
    unint64_t v16 = (void *)mscsn_streamOutputIDForOutputIndex(v13);
    uint64_t v45 = (void *)[v11 objectForKeyedSubscript:v16];
    *(unsigned char *)(a1 + 384 + v15) = 0;
    *(void *)(a1 + v14 + 10640) = 0;
    *(void *)(a1 + v14 + 10624) = 0;
    *(_OWORD *)(a1 + v14 + 10680) = v44;
    *(void *)(a1 + v14 + 10696) = v43;
    if (([v16 isEqualToString:v12] & 1) == 0)
    {
      float v17 = (_DWORD *)(a1 + v14 + 384);
      v17[2587] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v16), "objectForKeyedSubscript:", v41), "intValue");
      v17[2588] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v16), "objectForKeyedSubscript:", v40), "intValue");
      v17[2589] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "captureStream"), "sensorInterfaceRawPixelFormat");
      v17[2590] = objc_msgSend((id)objc_msgSend(v45, "objectForKeyedSubscript:", v39), "intValue");
      v17[2591] = objc_msgSend((id)objc_msgSend(v45, "objectForKeyedSubscript:", v38), "intValue");
    }
    uint64_t v18 = (_DWORD *)(a1 + v14 + 384);
    v18[2602] = 1065353216;
    v18[2685] = -1;
    v18[2686] = 0;
    ++v13;
    v15 += 512;
    v14 += 512;
  }
  while (v14);
  if (*(void *)(a1 + 10768))
  {
    uint64_t v50 = 0;
    -[BWMultiStreamCameraSourceNode _shouldEnableStreamCaptureOutputForNodeOutput:](a1, &v50);
    -[BWMultiStreamCameraSourceNode _updateStreamingOutputStorageForOutputID:isVideoCaptureOutput:nodeOutput:](a1, *(void **)(a1 + 10768), 1, v50);
  }
  uint64_t v19 = *(void **)(a1 + 10736);
  if (v19) {
    -[BWMultiStreamCameraSourceNode _updateStreamingOutputStorageForOutputID:isVideoCaptureOutput:nodeOutput:](a1, v19, 0, *(void *)(a1 + 200));
  }
  float v20 = *(void **)(a1 + 10792);
  if (v20)
  {
    int v21 = mscsn_streamOutputIndexForOutputID(v20);
    uint64_t v22 = a1 + 384 + ((uint64_t)v21 << 9);
    *(unsigned char *)(v22 + 9) = 1;
    if ([*(id *)(a1 + 312) stillImageOutputEnabled]) {
      *(void *)(v22 + 16) = *(void *)(a1 + 216);
    }
    *(_DWORD *)uint64_t v22 = 2;
    int v24 = *(_DWORD *)(v22 + 4);
    double v23 = (int *)(v22 + 4);
    int v25 = v24 | 1;
    int *v23 = v24 | 1;
    if (v36)
    {
      if (v21 != 4)
      {
        if (![*(id *)(a1 + 312) includeOverscanOnStillImageOutput]) {
          goto LABEL_25;
        }
        int v25 = *v23;
      }
      int *v23 = v25 | 8;
    }
  }
LABEL_25:
  int v26 = *(void **)(a1 + 10856);
  if (v26)
  {
    if (!*(unsigned char *)(a1 + 160))
    {
      uint64_t v27 = a1 + 384 + ((uint64_t)(int)mscsn_streamOutputIndexForOutputID(v26) << 9);
      *(unsigned char *)(v27 + 9) = 1;
      *(void *)(v27 + 16) = *(void *)(a1 + 224);
      *(_DWORD *)uint64_t v27 = 2;
      int v29 = *(_DWORD *)(v27 + 4);
      uint64_t v28 = (int *)(v27 + 4);
      int *v28 = v29 | 1;
      if (([*(id *)(a1 + 312) includeOverscanInStillImageFinalCropRect] & 1) == 0) {
        *v28 |= 8u;
      }
    }
  }
  if ([*(id *)(a1 + 312) depthOutputEnabled])
  {
    *(unsigned char *)(a1 + 3465) = 1;
    *(void *)(a1 + 3472) = *(void *)(a1 + 248);
    *(_DWORD *)(a1 + 3456) = 1;
  }
  if ([*(id *)(a1 + 312) pointCloudOutputEnabled])
  {
    *(unsigned char *)(a1 + 3977) = 1;
    *(void *)(a1 + 3984) = *(void *)(a1 + 256);
    *(_DWORD *)(a1 + 3968) = 1;
  }
  if ([*(id *)(a1 + 312) lightSourceMaskOutputEnabled])
  {
    if (![v37 objectForKeyedSubscript:*MEMORY[0x1E4F53B60]]) {
      goto LABEL_55;
    }
    *(unsigned char *)(a1 + 5001) = 1;
    *(void *)(a1 + 5008) = *(void *)(a1 + 264);
    *(_DWORD *)(a1 + 4992) = 1;
  }
  if ([*(id *)(a1 + 312) keypointDescriptorDataOutputEnabled])
  {
    if (![v37 objectForKeyedSubscript:*MEMORY[0x1E4F53B58]]) {
      goto LABEL_55;
    }
    *(unsigned char *)(a1 + 5513) = 1;
    *(void *)(a1 + 5520) = *(void *)(a1 + 272);
    *(_DWORD *)(a1 + 5504) = 1;
  }
  if ([*(id *)(a1 + 312) semanticMasksOutputEnabled])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    int v30 = (void *)[*(id *)(a1 + 312) enabledSemanticMaskTypes];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
LABEL_42:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        if (![v37 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * v34)]) {
          goto LABEL_55;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v32) {
            goto LABEL_42;
          }
          break;
        }
      }
    }
    *(unsigned char *)(a1 + 6025) = 1;
    *(void *)(a1 + 6032) = *(void *)(a1 + 280);
    *(_DWORD *)(a1 + 6016) = 1;
  }
  if ([*(id *)(a1 + 312) secureMetadataOutputConfiguration]) {
    -[BWMultiStreamCameraSourceNode _updateOutputStorageWithSecureMetadataOutputConfiguration:propagateToNodeOutputs:](a1, (void *)[*(id *)(a1 + 312) secureMetadataOutputConfiguration], 0);
  }
  if ([*(id *)(a1 + 312) preLTMThumbnailOutputEnabled])
  {
    if ([v37 objectForKeyedSubscript:*MEMORY[0x1E4F53B70]])
    {
      *(unsigned char *)(a1 + 9609) = 1;
      *(void *)(a1 + 9616) = *(void *)(a1 + 304);
      *(_DWORD *)(a1 + 9600) = 1;
      return 0;
    }
LABEL_55:
    FigDebugAssert3();
  }
  return 0;
}

- (uint64_t)_updateOutputIDs
{
  if (!a1) {
    return 0;
  }
  uint64_t updated = -[BWMultiStreamCameraSourceNode _updateOutputIDMappingsForStreamingOutputs](a1);
  if (updated) {
    FigDebugAssert3();
  }
  else {
    -[BWMultiStreamCameraSourceNode _updateOutputIDMappingsForOnDemandStills](a1);
  }
  return updated;
}

- (uint64_t)_updateStreamingOutputStorageForOutputID:(int)a3 isVideoCaptureOutput:(uint64_t)a4 nodeOutput:
{
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  uint64_t v8 = (int)mscsn_streamOutputIndexForOutputID(a2);
  uint64_t v9 = v7 + 384 + (v8 << 9);
  double result = [*(id *)(v7 + 312) visOverscan];
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  *(unsigned char *)(v9 + 9) = 1;
  *(void *)(v9 + 16) = a4;
  *(_DWORD *)uint64_t v9 = 1;
  if (v13 == v11 && v10 == v12) {
    return result;
  }
  uint64_t v15 = (void *)[*(id *)(v7 + 120) objectAtIndexedSubscript:*(int *)(v7 + 320)];
  unint64_t v16 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F55318]];
  double result = [a2 isEqualToString:*MEMORY[0x1E4F55418]];
  if ((result & 1) == 0)
  {
    uint64_t v18 = *MEMORY[0x1E4F553F8];
    if ([a2 isEqualToString:*MEMORY[0x1E4F553F8]])
    {
      [v16 objectForKeyedSubscript:v18];
      uint64_t v19 = (CGRect *)MEMORY[0x1E4F1DB20];
      v21.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v21.size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      FigCFDictionaryGetCGRectIfPresent();
      double result = CGRectEqualToRect(v21, *v19);
      if (a3)
      {
        char v17 = result ^ 1;
        goto LABEL_14;
      }
      if (result)
      {
LABEL_20:
        *(_DWORD *)(v7 + 384 + (v8 << 9) + 4) |= 8u;
        return result;
      }
    }
    else if (a3)
    {
      char v17 = 1;
      goto LABEL_14;
    }
    double result = objc_msgSend(*(id *)(v7 + 312), "overscanForShiftMitigation", *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size);
    if (v20 != 0.0) {
      goto LABEL_20;
    }
    double result = [*(id *)(v7 + 312) includeOverscanOnPreviewOutput];
    if (result) {
      goto LABEL_20;
    }
    return result;
  }
  if (!a3) {
    goto LABEL_20;
  }
  char v17 = 0;
LABEL_14:
  double result = objc_msgSend(*(id *)(v7 + 312), "videoStabilizationEnabled", *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size);
  if (!result || (v17 & 1) == 0) {
    goto LABEL_20;
  }
  return result;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForDepthOutput
{
  if (!a1) {
    return 0;
  }
  double v2 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWMultiStreamCameraSourceNode _updateDepthConfiguration](a1);
  double v3 = (void *)[*(id *)(a1 + 112) getProperty:*MEMORY[0x1E4F548B8] error:0];
  if (v3)
  {
    double v4 = (void *)[v3 objectForKeyedSubscript:*(void *)(a1 + 344)];
    int v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53850]), "intValue");
    LODWORD(v4) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53848]), "intValue");
    [(BWVideoFormatRequirements *)v2 setWidth:v5];
    [(BWVideoFormatRequirements *)v2 setHeight:(int)v4];
    [(BWVideoFormatRequirements *)v2 setSupportedPixelFormats:*(void *)(a1 + 360)];
    [(BWVideoFormatRequirements *)v2 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
  }
  else
  {
    FigDebugAssert3();
  }
  return v2;
}

- (uint64_t)_updateGDCStrengthAndBaseZoomFactorAfterGDC
{
  if (!a1) {
    return 0;
  }
  [a1[39] visOverscan];
  double v4 = [(BWMultiStreamCameraSourceNode *)a1 _outputConfigurationsForAllOutputsWithVISOverscan:v3];
  if (v4)
  {
    uint64_t v8 = 0;
    uint64_t v5 = -[BWMultiStreamCameraSourceNode _updateGDCStrengthForOutputConfigurations:updatedOutputConfigurations:]((uint64_t)a1, v4, &v8);
    if (v5)
    {
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v6 = -[BWMultiStreamCameraSourceNode _updateBaseZoomFactorAfterGDCFromOutputConfigurations:]((uint64_t)a1, v8);
      if (!v6) {
        return v6;
      }
    }
    FigDebugAssert3();
    return v6;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (uint64_t)_updateOverscanReservedInISPZoom
{
  if (result)
  {
    uint64_t v1 = result;
    double result = [*(id *)(result + 312) overscanForShiftMitigation];
    if (v2 > 0.0)
    {
      float v3 = v2;
      [*(id *)(v1 + 312) visOverscan];
      [*(id *)(v1 + 312) visOverscan];
      [*(id *)(v1 + 312) visOverscan];
      [*(id *)(v1 + 312) visOverscan];
      if (v4 >= v3)
      {
        [*(id *)(v1 + 312) visOverscan];
        float v3 = v5;
      }
      double result = [*(id *)(v1 + 312) additionalVISOverscanReservedInZoom];
      if (v6 != 0.0)
      {
        double result = [*(id *)(v1 + 312) additionalVISOverscanWhenRecording];
        float v3 = v3 * (float)(v7 + 1.0);
      }
      if (*(float *)(v1 + 10704) != v3) {
        *(float *)(v1 + 10704) = v3;
      }
    }
  }
  return result;
}

- (double)_totalAvailableOverscan
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 312) visOverscan];
  double v3 = v2;
  [*(id *)(a1 + 312) sensorOverscan];
  double v4 = *(void **)(a1 + 312);
  if (v3 <= v5) {
    [v4 sensorOverscan];
  }
  else {
    [v4 visOverscan];
  }
  double v7 = v6;
  [*(id *)(a1 + 312) visOverscan];
  double v9 = v8;
  [*(id *)(a1 + 312) sensorOverscan];
  double v10 = *(void **)(a1 + 312);
  if (v9 <= v11) {
    [v10 sensorOverscan];
  }
  else {
    [v10 visOverscan];
  }
  return v7;
}

- (void)_outputConfigurationForStreamingOutputID:(void *)a3 nodeOutput:(double)a4 visOverscan:(double)a5
{
  if (!a1) {
    return 0;
  }
  if ([a2 isEqualToString:*MEMORY[0x1E4F55400]])
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
  double v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v66 = (void *)[*(id *)(a1 + 120) objectAtIndexedSubscript:*(int *)(a1 + 320)];
  double v11 = (void *)[v66 objectForKeyedSubscript:*MEMORY[0x1E4F55318]];
  double v12 = (void *)[v11 objectForKeyedSubscript:a2];
  if ([a2 isEqualToString:*MEMORY[0x1E4F55418]])
  {
    BOOL v67 = 0;
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F553F8];
    if ([a2 isEqualToString:*MEMORY[0x1E4F553F8]])
    {
      [v11 objectForKeyedSubscript:v13];
      uint64_t v14 = (CGRect *)MEMORY[0x1E4F1DB20];
      CGRect v68 = *(CGRect *)*(void *)&MEMORY[0x1E4F1DB20];
      FigCFDictionaryGetCGRectIfPresent();
      BOOL v15 = !CGRectEqualToRect(v68, *v14);
    }
    else
    {
      BOOL v15 = 1;
    }
    BOOL v67 = v15;
  }
  unint64_t v16 = [*(id *)(a1 + 312) cropAspectRatio];
  int v62 = [*(id *)(a1 + 312) horizontalSensorBinningFactor];
  int v61 = [*(id *)(a1 + 312) verticalSensorBinningFactor];
  int v60 = [*(id *)(a1 + 312) fesBinningFactorHorizontal];
  char v17 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  if (*(void **)(a1 + 200) == a3
    && ([*(id *)(a1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled] & 1) != 0)
  {
    uint64_t v18 = 1;
  }
  else if (*(void **)(a1 + 208) == a3)
  {
    uint64_t v18 = [*(id *)(a1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled];
  }
  else
  {
    uint64_t v18 = 0;
  }
  unint64_t v64 = HIDWORD(v16);
  uint64_t v65 = [*(id *)(a1 + 312) sensorCropDimensions];
  if (FigCaptureVideoDimensionsAreValid(v65))
  {
    if ((int)objc_msgSend((id)objc_msgSend(v66, "objectForKeyedSubscript:", *MEMORY[0x1E4F552B0]), "intValue") >= 1)
    {
      char v17 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
      if ((int)objc_msgSend((id)objc_msgSend(v66, "objectForKeyedSubscript:", *MEMORY[0x1E4F552A8]), "intValue") < 1) {
        goto LABEL_24;
      }
      uint64_t v19 = [*(id *)(a1 + 312) cropDimensionsWhenFESIsEnabled];
      goto LABEL_22;
    }
    char v17 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  }
  else if (v18 && FigCaptureVideoDimensionsAreValid([*(id *)(a1 + 312) postGDCCropDimensions]))
  {
    uint64_t v19 = [*(id *)(a1 + 312) postGDCCropDimensions];
LABEL_22:
    uint64_t v65 = v19;
  }
LABEL_24:
  if (*(void **)(a1 + 200) == a3)
  {
    [*(id *)(a1 + 312) maxFrameRate];
    if (v20 <= (float)(int)[*(id *)(a1 + 312) preferredPreviewMaxFrameRate]) {
      unsigned int v56 = 0;
    }
    else {
      unsigned int v56 = [*(id *)(a1 + 312) preferredPreviewMaxFrameRate];
    }
    unsigned int v59 = [*(id *)(a1 + 312) faceTrackingEnabled];
    unsigned int v58 = [*(id *)(a1 + 312) streamingForegroundSegmentationEnabled];
    unint64_t v21 = -[BWMultiStreamCameraSourceNode _calculatePreviewDimensionsForShiftMitigation](a1);
    if (v67 && ![*(id *)(a1 + 312) includeOverscanOnPreviewOutput])
    {
      [*(id *)(a1 + 312) overscanForShiftMitigation];
      if (v50 <= 0.0)
      {
        double v22 = -[BWMultiStreamCameraSourceNode _totalAvailableOverscan](a1);
        double v23 = v55;
        uint64_t v57 = 0;
        unsigned int v63 = 0;
      }
      else
      {
        [*(id *)(a1 + 312) sensorOverscan];
        double v22 = v51;
        [*(id *)(a1 + 312) sensorOverscan];
        double v23 = v52;
        double v53 = -[BWMultiStreamCameraSourceNode _overscanWithFOVSacrifice](a1);
        uint64_t v57 = 0;
        unsigned int v63 = 0;
        if (v53 >= v54) {
          double v53 = v54;
        }
        *(double *)(a1 + 10744) = v53;
        *(double *)(a1 + 10752) = v53;
      }
    }
    else
    {
      double v22 = *MEMORY[0x1E4F1DB30];
      double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      uint64_t v57 = 0;
      unsigned int v63 = 0;
      *(double *)(a1 + 10744) = -[BWMultiStreamCameraSourceNode _totalAvailableOverscan](a1);
      *(void *)(a1 + 10752) = v24;
    }
  }
  else
  {
    if (*(void **)(a1 + v17[430]) == a3)
    {
      if ([*(id *)(a1 + 96) portraitAutoSuggestEnabled]) {
        unsigned int v59 = [*(id *)(a1 + 312) faceTrackingEnabled];
      }
      else {
        unsigned int v59 = 0;
      }
      unsigned int v63 = [*(id *)(a1 + 312) videoStabilizationEnabled];
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 312), "videoStabilizationMethods"), "count") && !v63
        || ([*(id *)(a1 + 312) cinematicFramingEnabled] & 1) != 0
        || ([*(id *)(a1 + 312) deskCamEnabled] & 1) != 0
        || [*(id *)(a1 + 312) manualCinematicFramingEnabled])
      {
        LODWORD(v64) = 0;
        LODWORD(v16) = 0;
      }
    }
    else
    {
      unsigned int v59 = 0;
      unsigned int v63 = 0;
    }
    unint64_t v21 = [(BWMultiStreamCameraSourceNode *)a1 _calculateVideoCaptureDimensionsWithVISOverscan:a5];
    uint64_t v57 = [*(id *)(a1 + 312) visionDataConfiguration];
    [*(id *)(a1 + 312) sensorOverscan];
    double v26 = a4 + 1.0;
    double v27 = (v25 + 1.0) / (a4 + 1.0) + -1.0;
    double v23 = 0.0;
    double v22 = 0.0;
    if (v27 >= 0.0)
    {
      [*(id *)(a1 + 312) sensorOverscan];
      double v22 = (v28 + 1.0) / v26 + -1.0;
    }
    [*(id *)(a1 + 312) sensorOverscan];
    double v30 = a5 + 1.0;
    if ((v29 + 1.0) / v30 + -1.0 >= 0.0)
    {
      [*(id *)(a1 + 312) sensorOverscan];
      unsigned int v58 = 0;
      unsigned int v56 = 0;
      double v23 = (v31 + 1.0) / v30 + -1.0;
    }
    else
    {
      unsigned int v58 = 0;
      unsigned int v56 = 0;
    }
  }
  uint64_t v32 = objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "pixelFormat");
  if (!a3)
  {
    if ((*(unsigned char *)(a1 + 384 + ((uint64_t)(int)mscsn_streamOutputIndexForOutputID(a2) << 9) + 4) & 3) != 0)
    {
      uint64_t v32 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "videoFormat"), "pixelFormat");
    }
    else
    {
      uint64_t v33 = -[BWMultiStreamCameraSourceNode _supportedPixelFormatsForOutputID:]((id *)a1, a2);
      uint64_t v32 = FigCapturePixelFormatWithLeastAverageBandwidth(v33);
    }
  }
  uint64_t v34 = v32;
  if (v67)
  {
    if ([a2 isEqualToString:*MEMORY[0x1E4F553F8]]
      && ((int v35 = FigCapturePlatformIdentifier(), v35 < 8)
       || v35 == 8 && (int)FigCapturePlatformChipRevisionIdentifier() <= 15))
    {
      uint64_t v36 = FigCapturePixelFormatTileAlignment(v34);
    }
    else
    {
      uint64_t v36 = 0;
    }
    [*(id *)(a1 + 312) sensorCenterOffset];
    mscsn_setScalerCropAndOutputDimensionsInConfiguration(v10, a2, v66, v65, v16 | ((unint64_t)v64 << 32), v21, [*(id *)(a1 + 312) roundingOfStillImageDimensionsToMultipleOfFourEnabled], v36, v22, v23, v37, v38, (float)v62 / (float)v61, (float)v60, v18);
  }
  uint64_t v39 = [NSNumber numberWithUnsignedInt:v34];
  [v10 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F55388]];
  if ([*(id *)(a1 + 312) primaryScalerDecoupled]) {
    BOOL v40 = *(unsigned char *)(a1 + 128) == 0;
  }
  else {
    BOOL v40 = 0;
  }
  int v41 = FigCapturePlatformIdentifier();
  uint64_t v42 = (void *)MEMORY[0x1E4F55420];
  if (v41 >= 7)
  {
    if (([a2 isEqualToString:*MEMORY[0x1E4F55420]] & 1) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  if (((v40 | [a2 isEqualToString:*MEMORY[0x1E4F553F8]] ^ 1) & 1) == 0)
  {
LABEL_66:
    uint64_t v43 = [NSNumber numberWithInt:v56];
    [v10 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F55378]];
  }
LABEL_67:
  if ([a2 isEqualToString:*MEMORY[0x1E4F55410]])
  {
    uint64_t v44 = [NSNumber numberWithBool:v63];
    [v10 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F554B0]];
  }
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F554B8]), "BOOLValue"))
  {
    uint64_t v45 = [NSNumber numberWithBool:v18];
    [v10 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F554A8]];
  }
  if ([a2 isEqualToString:*v42] && (int)FigCapturePlatformIdentifier() >= 7) {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[BWMultiStreamCameraSourceNode _scalerChainingEnabled](a1)), *MEMORY[0x1E4F553A0]);
  }
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F55450]), "BOOLValue"))
  {
    uint64_t v46 = [NSNumber numberWithBool:v59];
    [v10 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F55360]];
  }
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F554A0]), "BOOLValue"))
  {
    if (v57) {
      uint64_t v47 = v57;
    }
    else {
      uint64_t v47 = MEMORY[0x1E4F1CC08];
    }
    [v10 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F553B0]];
  }
  if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F55490]), "BOOLValue"))
  {
    uint64_t v48 = [NSNumber numberWithBool:v58];
    [v10 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F553A8]];
  }
  return v10;
}

- (unint64_t)_calculateVideoCaptureDimensionsWithVISOverscan:(double)a3
{
  if (!a1) {
    return 0;
  }
  char v6 = [*(id *)(a1 + 312) videoCaptureDimensionsIncludeVISOverscan];
  unint64_t v7 = [*(id *)(a1 + 312) videoCaptureDimensions];
  if (v6) {
    return v7;
  }
  [*(id *)(a1 + 312) additionalVISOverscanWhenRecording];
  BOOL v9 = v8 <= 0.0;
  double v10 = (float)(v8 + 1.0);
  double v11 = (a2 + 1.0) * v10 + -1.0;
  double v12 = (a3 + 1.0) * v10 + -1.0;
  if (v9) {
    double v13 = a2;
  }
  else {
    double v13 = v11;
  }
  if (v9) {
    double v14 = a3;
  }
  else {
    double v14 = v12;
  }
  double v15 = *MEMORY[0x1E4F1DB30];
  double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v17 = v14 == v16 && v13 == *MEMORY[0x1E4F1DB30];
  objc_msgSend(*(id *)(a1 + 312), "overscanForShiftMitigation", v12);
  float v19 = v18;
  if (([*(id *)(a1 + 312) videoStabilizationEnabled] & 1) != 0 || v17)
  {
    int v30 = [*(id *)(a1 + 312) videoStabilizationEnabled];
    if (v19 == 0.0) {
      int v31 = 1;
    }
    else {
      int v31 = v30;
    }
    double v29 = v19;
    if (v31) {
      double v14 = v16;
    }
    else {
      double v14 = v19;
    }
    if (v31) {
      double v29 = v15;
    }
  }
  else
  {
    [*(id *)(a1 + 312) sensorOverscan];
    double v44 = v13 + 1.0;
    double v21 = 0.0;
    if ((v13 + 1.0) / (v20 + 1.0) + -1.0 >= 0.0)
    {
      [*(id *)(a1 + 312) sensorOverscan];
      double v21 = v44 / (v22 + 1.0) + -1.0;
    }
    double v23 = v14 + 1.0;
    [*(id *)(a1 + 312) sensorOverscan];
    double v25 = 0.0;
    if ((v14 + 1.0) / (v24 + 1.0) + -1.0 >= 0.0)
    {
      [*(id *)(a1 + 312) sensorOverscan];
      double v25 = v23 / (v26 + 1.0) + -1.0;
    }
    if (v19 == 0.0 || (float v27 = v21, v19 <= v27) && (v28 = v25, v19 <= v28))
    {
      double v29 = v13;
      goto LABEL_30;
    }
    double v35 = (float)(v19 + 1.0);
    double v36 = v35 / (v21 + 1.0) + -1.0;
    double v37 = v35 / (v25 + 1.0) + -1.0;
    if (v36 >= 0.0) {
      double v38 = v36 + 1.0;
    }
    else {
      double v38 = 1.0;
    }
    double v29 = v44 * v38 + -1.0;
    if (v37 >= 0.0) {
      double v39 = v37 + 1.0;
    }
    else {
      double v39 = 1.0;
    }
    double v40 = v23 * v39 + -1.0;
    if (v13 == v14) {
      goto LABEL_50;
    }
    double v41 = (v29 + 1.0) / v44 * v23 + -1.0;
    float v42 = v41;
    double v43 = v42;
    if (v41 >= 0.0) {
      double v14 = v43;
    }
    else {
      double v14 = 0.0;
    }
    if (v14 <= v40)
    {
      double v29 = (v40 + 1.0) / v23 * v44 + -1.0;
      if (v29 < 0.0) {
        double v29 = 0.0;
      }
LABEL_50:
      double v14 = v40;
    }
  }
LABEL_30:
  if (v29 == v15 && v14 == v16) {
    return v7;
  }
  double v33 = v29 + 1.0;
  return mscsn_scaleDimensionsWithAlignment(v7, 2, v33, v14 + 1.0);
}

- (uint64_t)_scalerChainingEnabled
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    double result = [*(id *)(result + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled];
    if (result)
    {
      double result = [v1[39] geometricDistortionCorrectionOnPreviewOutputEnabled];
      if (result)
      {
        if ((int)FigCapturePlatformIdentifier() < 7) {
          return 0;
        }
        [v1[39] visOverscan];
        unint64_t v4 = [(BWMultiStreamCameraSourceNode *)(uint64_t)v1 _calculateVideoCaptureDimensionsWithVISOverscan:v3];
        int v5 = v4;
        unint64_t v6 = HIDWORD(v4);
        unint64_t v7 = -[BWMultiStreamCameraSourceNode _calculatePreviewDimensionsForShiftMitigation]((uint64_t)v1);
        int v8 = v7;
        unint64_t v9 = HIDWORD(v7);
        BOOL v10 = v5 < (int)v7 || (int)v6 < SHIDWORD(v7);
        if (!v10
          && [v1[1342] isEqualToString:*MEMORY[0x1E4F55420]]
          && ([v1[1346] isEqualToString:*MEMORY[0x1E4F55410]] & 1) != 0)
        {
          return 1;
        }
        if (v5 < v8 && (int)v6 < (int)v9)
        {
          double result = [v1[1342] isEqualToString:*MEMORY[0x1E4F55410]];
          if (result)
          {
            id v12 = v1[1346];
            uint64_t v13 = *MEMORY[0x1E4F55420];
            return [v12 isEqualToString:v13];
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_updateGDCStrengthForOutputConfigurations:(void *)a3 updatedOutputConfigurations:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    unint64_t v6 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
    if (([*(id *)(result + 312) geometricDistortionCorrectionOnStillImageOutputEnabled] & 1) != 0
      || ([*(id *)(v5 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled] & 1) != 0
      || (double result = [*(id *)(v5 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled], result))
    {
      if (a2)
      {
        double v43 = a3;
        double v55 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        unint64_t v7 = (void *)[*(id *)(v5 + 120) objectAtIndexedSubscript:*(int *)(v5 + 320)];
        int v8 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F55318]];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        uint64_t v9 = [a2 countByEnumeratingWithState:&v62 objects:v69 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v63;
          uint64_t v56 = *MEMORY[0x1E4F554B8];
          uint64_t v54 = *MEMORY[0x1E4F554A8];
          uint64_t v49 = *MEMORY[0x1E4F55350];
          uint64_t v47 = *MEMORY[0x1E4F55470];
          uint64_t v48 = *MEMORY[0x1E4F55480];
          uint64_t v45 = *MEMORY[0x1E4F55478];
          uint64_t v46 = *MEMORY[0x1E4F55488];
          uint64_t v44 = *MEMORY[0x1E4F55428];
          uint64_t v53 = *MEMORY[0x1E4F55410];
          uint64_t v52 = *MEMORY[0x1E4F55368];
          uint64_t v50 = *(void *)v63;
          do
          {
            uint64_t v12 = 0;
            uint64_t v51 = v10;
            do
            {
              if (*(void *)v63 != v11) {
                objc_enumerationMutation(a2);
              }
              uint64_t v13 = *(void **)(*((void *)&v62 + 1) + 8 * v12);
              double v14 = (void *)[a2 objectForKeyedSubscript:v13];
              double v15 = (void *)[v8 objectForKeyedSubscript:v13];
              if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v56), "BOOLValue"))
              {
                float v16 = 0.0;
                if (objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v54), "BOOLValue"))
                {
                  BOOL v17 = a2;
                  float v18 = v8;
                  float v19 = v6;
                  uint64_t v20 = v5;
                  CFDictionaryRef v21 = (const __CFDictionary *)[v14 objectForKeyedSubscript:v49];
                  CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
                  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
                  rect.size = v22;
                  CGRectMakeWithDictionaryRepresentation(v21, &rect);
                  double width = rect.size.width;
                  double height = rect.size.height;
                  int v25 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v48), "intValue");
                  uint64_t v26 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v47), "intValue");
                  int v27 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v46), "intValue");
                  int v28 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v45), "intValue");
                  if (v27 <= v25 && v28 <= (int)v26)
                  {
                    uint64_t v26 = (int)height;
                    int v25 = (int)width;
                  }
                  uint64_t v5 = v20;
                  unint64_t v6 = v19;
                  float v16 = BWGetGeometricDistortionCorrectionStrengthFromDimensions(v25 | (unint64_t)(v26 << 32), [*(id *)(v5 + v19[459]) maximumGeometricDistortionCorrectionEnabled]);
                  [v13 isEqualToString:v44];
                  int v8 = v18;
                  a2 = v17;
                  uint64_t v11 = v50;
                  uint64_t v10 = v51;
                }
                if (v16 >= 0.0) {
                  float v29 = v16;
                }
                else {
                  float v29 = 0.0;
                }
                if (v29 > 1.0) {
                  float v29 = 1.0;
                }
                if (v16 < 0.0 || v16 > 1.0) {
                  float v16 = v29;
                }
                if ([v13 isEqualToString:v53]) {
                  *(float *)(v5 + 10776) = v16;
                }
                uint64_t v67 = v52;
                *(float *)&double v31 = v16;
                uint64_t v68 = [NSNumber numberWithFloat:v31];
                objc_msgSend(v55, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1), v13);
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [a2 countByEnumeratingWithState:&v62 objects:v69 count:16];
          }
          while (v10);
        }
        double result = [*(id *)(v5 + 112) setProperty:*MEMORY[0x1E4F54CB8] value:v55];
        if (!result)
        {
          if (v43)
          {
            uint64_t v32 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a2];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            uint64_t v33 = [v55 countByEnumeratingWithState:&v57 objects:v66 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v58 != v35) {
                    objc_enumerationMutation(v55);
                  }
                  objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", *(void *)(*((void *)&v57 + 1) + 8 * i)), "addEntriesFromDictionary:", objc_msgSend(v55, "objectForKeyedSubscript:", *(void *)(*((void *)&v57 + 1) + 8 * i)));
                }
                uint64_t v34 = [v55 countByEnumeratingWithState:&v57 objects:v66 count:16];
              }
              while (v34);
            }
            *double v43 = v32;
          }
          double result = [*(id *)(v5 + v6[459]) reflectsStillsOnStreamingOutputs];
          if (result)
          {
            double v37 = (void *)[v55 objectForKeyedSubscript:*MEMORY[0x1E4F55410]];
            double v38 = (void *)[v55 objectForKeyedSubscript:*MEMORY[0x1E4F55428]];
            uint64_t v39 = *MEMORY[0x1E4F55368];
            objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E4F55368]), "floatValue");
            float v41 = v40;
            objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", v39), "floatValue");
            if (vabds_f32(v42, v41) > 0.00001) {
              [*(id *)(v5 + v6[459]) setReflectsStillsOnStreamingOutputs:0];
            }
            return 0;
          }
        }
      }
      else
      {
        FigDebugAssert3();
        return FigSignalErrorAt();
      }
    }
  }
  return result;
}

- (unint64_t)_calculatePreviewDimensionsForShiftMitigation
{
  if (!a1) {
    return 0;
  }
  unint64_t v2 = [*(id *)(a1 + 312) preferredPreviewDimensions];
  [*(id *)(a1 + 312) overscanForShiftMitigation];
  if (v3 == 0.0) {
    return v2;
  }
  double v4 = (float)(v3 + 1.0);
  return mscsn_scaleDimensionsWithAlignment(v2, 2, v4, v4);
}

- (int)configure:(id)a3
{
  self->_configuration = (BWMultiStreamCameraSourceNodeConfiguration *)a3;
  -[BWMultiStreamCameraSourceNode _updateBufferPoolSharingProperties]((unint64_t)self);
  -[BWMultiStreamCameraSourceNode _updateDepthSettings]((uint64_t)self);
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration depthType] - 1 < 2
    || ([a3 originalCameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled] & 1) != 0
    || ([a3 originalCameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled] & 1) != 0
    || ([a3 originalCameraIntrinsicMatrixDeliveryOnDepthOutputEnabled] & 1) != 0
    || ([a3 originalCameraIntrinsicMatrixDeliveryOnStillImageOutputEnabled] & 1) != 0
    || ([a3 cameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled] & 1) != 0
    || [a3 cameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled])
  {
    -[BWMultiStreamCameraSourceNode _retrieveCameraCharacterizationDataForCameraIntrinsicMatrixDelivery]((uint64_t)self);
  }
  self->_firmwareStillImageOutputRetainedBufferCountOverride = [a3 firmwareStillImageOutputRetainedBufferCountOverride];
  self->_stillImageOutputSushiRawAttachmentOptionEnabled = [a3 stillImageOutputSushiRawAttachmentOptionEnabled];
  int updated = -[BWMultiStreamCameraSourceNode _updateOutputRequirements]((uint64_t)self);
  if (updated)
  {
    int v7 = updated;
LABEL_22:
    FigDebugAssert3();
    return v7;
  }
  [(BWMultiStreamCameraSourceNode *)self updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping];
  int v6 = -[BWMultiStreamCameraSourceNode _updateGDCStrengthAndBaseZoomFactorAfterGDC]((id *)&self->super.super.super.isa);
  if (v6)
  {
    int v7 = v6;
    goto LABEL_22;
  }
  -[BWMultiStreamCameraSourceNode _updateDolbyVisionMetadataOutputEnabledConfiguration]((uint64_t)self);
  if ([(BWFigVideoCaptureDevice *)self->_captureDevice adaptiveOverscanEnabled]
    && !self->_streamConfigurationQueue)
  {
    self->_streamConfigurationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  if (self->_bravoShiftRestrictedToHighestNondisruptiveZoomRange) {
    return 0;
  }
  [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration visOverscan];
  int v7 = 0;
  BOOL v9 = v8 == *MEMORY[0x1E4F1DB30];
  if (v10 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    BOOL v9 = 0;
  }
  self->_bravoShiftRestrictedToHighestNondisruptiveZoomRange = v9;
  return v7;
}

- (uint64_t)_updateDolbyVisionMetadataOutputEnabledConfiguration
{
  if (a1)
  {
    int v2 = [*(id *)(a1 + 312) dolbyVisionMetadataOnPreviewOutputEnabled];
    float v3 = (void *)MEMORY[0x1E4F24A90];
    double v4 = (void *)MEMORY[0x1E4F24AC0];
    if (v2
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "colorInfoForOutput:", *(void *)(a1 + 200)), "objectForKeyedSubscript:", *MEMORY[0x1E4F24A90]), "isEqualToString:", *MEMORY[0x1E4F24AC0]))
    {
      [*(id *)(a1 + 312) setDolbyVisionMetadataOnPreviewOutputEnabled:0];
    }
    if ([*(id *)(a1 + 312) dolbyVisionMetadataOnVideoCaptureOutputEnabled]
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "colorInfoForOutput:", *(void *)(a1 + 208)), "objectForKeyedSubscript:", *v3), "isEqualToString:", *v4))
    {
      [*(id *)(a1 + 312) setDolbyVisionMetadataOnVideoCaptureOutputEnabled:0];
    }
  }
  return 0;
}

- (uint64_t)_updateDepthSettings
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  *(void *)(result + 344) = 0;
  int v2 = [*(id *)(result + 312) depthType];
  if (v2 == 1)
  {
    float v3 = (void *)MEMORY[0x1E4F537E0];
    goto LABEL_6;
  }
  if (v2 == 2)
  {
    float v3 = (void *)MEMORY[0x1E4F537C8];
LABEL_6:
    *(void *)(v1 + 344) = *v3;
  }
  double result = [*(id *)(v1 + 312) depthType];
  if ((result - 1) <= 1)
  {
    uint64_t v4 = [*(id *)(v1 + 312) depthDimensions];
    uint64_t v5 = (void *)[*(id *)(v1 + 112) getProperty:*MEMORY[0x1E4F548C0] error:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = v5;
    double result = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v23;
      uint64_t v8 = *MEMORY[0x1E4F53850];
      uint64_t v9 = *MEMORY[0x1E4F53848];
      uint64_t v20 = v1;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
          int v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v8, v20), "intValue");
          int v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v9), "intValue");
          BOOL v15 = v12 == v4 && v13 == HIDWORD(v4);
          if (v12 == HIDWORD(v4) && v13 == v4)
          {
            int v17 = *(unsigned __int8 *)(v20 + 160);
            if (*(unsigned char *)(v20 + 160)) {
              int v17 = [*(id *)(v20 + 96) captureStream] != *(void *)(v20 + 104);
            }
          }
          else
          {
            int v17 = 0;
          }
          if ((v15 | v17) == 1)
          {
            int v18 = [*(id *)(v20 + 312) hardwareDepthFilteringPreferred];
            if (v18) {
              LOBYTE(v18) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53858]), "BOOLValue");
            }
            *(unsigned char *)(v20 + 352) = v18;
            int v19 = [*(id *)(v20 + 312) strictDepthModePreferred];
            if (v19) {
              LOBYTE(v19) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53880]), "BOOLValue");
            }
            *(unsigned char *)(v20 + 353) = v19;
            *(unsigned char *)(v20 + 354) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53878]), "BOOLValue");
            *(unsigned char *)(v20 + 355) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53870]), "BOOLValue");
            *(unsigned char *)(v20 + 356) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53868]), "BOOLValue");
            double result = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F53860]];
            *(void *)(v20 + 360) = result;
            return result;
          }
          ++v10;
        }
        while (v6 != v10);
        double result = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        uint64_t v6 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_retrieveCameraCharacterizationDataForCameraIntrinsicMatrixDelivery
{
  if (result)
  {
    uint64_t v1 = result;
    double result = [*(id *)(result + 184) isEqualToString:*MEMORY[0x1E4F52E00]];
    if ((result & 1) == 0)
    {
      CFDictionaryRef v2 = (const __CFDictionary *)[*(id *)(v1 + 104) moduleInfo];
      CFDictionaryRef v3 = (const __CFDictionary *)[*(id *)(v1 + 104) sensorIDDictionary];
      [*(id *)(v1 + 104) pixelSize];
      uint64_t v5 = *(void *)(v1 + 184);
      return FigMotionGetCameraCharacterizationData(v2, v3, v4, v5, v1 + 10624);
    }
  }
  return result;
}

- (void)updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v3 = -[BWMultiStreamCameraSourceNode _ultraHighResolutionNondisruptiveStreamingFormatIndex]((uint64_t)self);
  -[BWMultiStreamCameraSourceNode _calculateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping:nondisruptiveSwitchingFormatIndicesByZoomfactorSIFRNonBinnedOut:ultraHighResolutionNondisruptiveStreamingFormatIndex:]((unint64_t)self, &v7, &v6, v3);
  float v4 = [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration quadraSubPixelSwitchingParameters];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = [+[FigCaptureCameraParameters sharedInstance] quadraSubPixelSwitchingParametersForPortType:self->_portType sensorIDString:[(BWFigVideoCaptureStream *)self->_captureStream sensorIDString]];
  }
  -[BWFigVideoCaptureDevice setNondisruptiveSwitchingFormatIndicesByZoomFactorSIFRBinned:nondisruptiveSwitchingFormatIndicesByZoomFactorSIFRNonBinned:ultraHighResolutionNondisruptiveStreamingFormatIndex:mainFormatSIFRBinningFactor:forPortType:quadraSubPixelSwitchingParameters:](self->_captureDevice, "setNondisruptiveSwitchingFormatIndicesByZoomFactorSIFRBinned:nondisruptiveSwitchingFormatIndicesByZoomFactorSIFRNonBinned:ultraHighResolutionNondisruptiveStreamingFormatIndex:mainFormatSIFRBinningFactor:forPortType:quadraSubPixelSwitchingParameters:", v7, v6, v3, self->_mainFormatSIFRBinningFactor, self->_portType, v5, v6, v7);
}

- (uint64_t)_ultraHighResolutionNondisruptiveStreamingFormatIndex
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (objc_msgSend((id)objc_msgSend(*(id *)(result + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count"))
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      CFDictionaryRef v2 = objc_msgSend(*(id *)(v1 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices", 0);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v12;
        uint64_t v6 = *MEMORY[0x1E4F55300];
        uint64_t v7 = *MEMORY[0x1E4F552F8];
        while (2)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v12 != v5) {
              objc_enumerationMutation(v2);
            }
            uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            uint64_t v10 = objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
            if (FigCaptureSourceSensorRawHighResolutionFlavorFromDimensions(objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v6), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v7), "intValue") << 32)) == 2) {
              return [v9 intValue];
            }
          }
          uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (unint64_t)_calculateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping:(void *)a3 nondisruptiveSwitchingFormatIndicesByZoomfactorSIFRNonBinnedOut:(int)a4 ultraHighResolutionNondisruptiveStreamingFormatIndex:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v6 = result;
    double result = objc_msgSend((id)objc_msgSend(*(id *)(result + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count");
    if (result)
    {
      double v37 = a2;
      double v38 = a3;
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(*(id *)(v6 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"));
      objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(v6 + 320)));
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v53;
        float v11 = 0.0;
        long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
        long long v43 = *MEMORY[0x1E4F1DB28];
        float v12 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v53 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(v6 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "intValue"));
            long long v50 = v43;
            long long v51 = v41;
            if (FigCFDictionaryGetCGRectIfPresent() && *(double *)&v51 > v12)
            {
              float v12 = *(double *)&v51;
              float v11 = *((double *)&v51 + 1);
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v9);
      }
      else
      {
        float v11 = 0.0;
        float v12 = 0.0;
      }
      long long v14 = (void *)[*(id *)(v6 + 120) objectAtIndexedSubscript:*(int *)(v6 + 320)];
      uint64_t v42 = *MEMORY[0x1E4F552D8];
      int v15 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:"), "BOOLValue");
      uint64_t v16 = (uint64_t *)MEMORY[0x1E4F552D0];
      if (v15) {
        *(_DWORD *)(v6 + 324) = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F552D0]), "intValue");
      }
      if (objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v42), "BOOLValue")
        && [*(id *)(v6 + 312) sifrBinningFactorOverrideForNondisruptiveSwitching])
      {
        *(_DWORD *)(v6 + 324) = [*(id *)(v6 + 312) sifrBinningFactorOverrideForNondisruptiveSwitching];
      }
      int v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(v6 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count"));
      uint64_t v44 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(v6 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"), "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      int v18 = (void *)[*(id *)(v6 + 312) activeStreamingNondisruptiveSwitchingFormatIndices];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v47;
        uint64_t v39 = *v16;
        double v22 = v12;
        double v23 = v11;
        uint64_t v40 = *MEMORY[0x1E4F552E0];
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v47 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v25 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            if ([v25 intValue] != a4)
            {
              uint64_t v26 = objc_msgSend(*(id *)(v6 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
              if (objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v42), "BOOLValue")) {
                int v27 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v39), "intValue");
              }
              else {
                int v27 = 0;
              }
              [*(id *)(v6 + 104) baseZoomFactor];
              float v29 = v28;
              long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
              long long v50 = *MEMORY[0x1E4F1DB28];
              long long v51 = v30;
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                double v32 = v22 / *(double *)&v51;
                double v33 = v23 / *((double *)&v51 + 1);
                if (objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v40), "BOOLValue")) {
                  double v31 = v33;
                }
                else {
                  double v31 = v32;
                }
                float v34 = v31;
                float v29 = v29 * v34;
              }
              *(float *)&double v31 = v29;
              uint64_t v35 = [NSNumber numberWithFloat:v31];
              if (v27 == 2) {
                double v36 = v17;
              }
              else {
                double v36 = v44;
              }
              [v36 setObject:v25 forKeyedSubscript:v35];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v20);
      }
      -[BWMultiStreamCameraSourceNode _updateNondisruptiveSwitchingZoomFactors:](v6, v17);
      double result = -[BWMultiStreamCameraSourceNode _updateNondisruptiveSwitchingZoomFactors:](v6, v44);
      if (v37)
      {
        double result = [v17 count];
        if (result) {
          *double v37 = v17;
        }
      }
      if (v38)
      {
        double result = [v44 count];
        if (result) {
          *double v38 = v44;
        }
      }
    }
  }
  return result;
}

- (unint64_t)_updateNondisruptiveSwitchingZoomFactors:(unint64_t)result
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v3 = result;
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
    double result = [v4 count];
    if (result)
    {
      if ([v4 count] != 1
        || (objc_msgSend((id)objc_msgSend(v4, "firstObject"), "floatValue"),
            float v6 = v5,
            double result = [*(id *)(v3 + 104) baseZoomFactor],
            v6 != v7))
      {
        uint64_t v8 = BWFilterNonDisruptiveSwitchingFormatZoomFactors(v4);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v9 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v4);
              }
              uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              if (([v8 containsObject:v13] & 1) == 0) {
                [a2 removeObjectForKey:v13];
              }
            }
            uint64_t v10 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }
        if (([*(id *)(v3 + 96) overCaptureEnabled] & 1) != 0
          || (double result = [*(id *)(v3 + 96) maxOverscanVideoStabilizationMethod], (int)result >= 1))
        {
          objc_msgSend((id)objc_msgSend(v8, "lastObject"), "floatValue");
          float v15 = v14;
          uint64_t v16 = (void *)[*(id *)(v3 + 96) captureStreamsByFocalLength];
          unint64_t v17 = [v16 indexOfObject:*(void *)(v3 + 104)] + 1;
          double result = [v16 count];
          if (v17 < result)
          {
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", v17), "baseZoomFactorAfterGDC");
            float v19 = v18;
            double result = BWWiderNonDisruptiveSwitchingFormatZoomFactorAndNarrowerBaseZoomFactorShouldBeCombined(v15, v18);
            if (result)
            {
              *(float *)&double v20 = v15;
              uint64_t v21 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v20));
              *(float *)&double v22 = v19;
              objc_msgSend(a2, "setObject:forKeyedSubscript:", v21, objc_msgSend(NSNumber, "numberWithFloat:", v22));
              *(float *)&double v23 = v15;
              return objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithFloat:", v23));
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)requestedZoomFactorChanged:(float)a3
{
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration deferStreamingOutputsEnable])
  {
    [(BWFigVideoCaptureStream *)[(BWFigVideoCaptureDevice *)self->_captureDevice captureStream] baseZoomFactor];
    if (v5 != a3
      && !-[BWMultiStreamCameraSourceNode _setStreamOutputsEnabled:streamingOutputs:onDemandStillOutputs:]((uint64_t)self, 1u, 1, 0))
    {
      captureDevice = self->_captureDevice;
      portType = self->_portType;
      [(BWFigVideoCaptureDevice *)captureDevice setZoomFactorChangedDelegate:0 forPortType:portType];
    }
  }
}

- (OpaqueCMClock)clock
{
  return [(BWFigVideoCaptureDevice *)self->_captureDevice clock];
}

- (uint64_t)_registerForStreamNotifications
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 112) registerForNotification:*MEMORY[0x1E4F54418] listener:result callback:mscsn_handleStreamDroppedSampleNotification];
    [*(id *)(v1 + 112) registerForNotification:@"Discontinuity" listener:v1 callback:mscsn_handleStreamDroppedSampleNotification];
    double result = [*(id *)(v1 + 312) depthOutputEnabled];
    if (result)
    {
      CFDictionaryRef v2 = *(void **)(v1 + 112);
      uint64_t v3 = *MEMORY[0x1E4F54428];
      return [v2 registerForNotification:v3 listener:v1 callback:mscsn_handlePoolReadyNotification];
    }
  }
  return result;
}

- (uint64_t)_updateOutputIDMappingsForOnDemandStills
{
  if (result)
  {
    uint64_t v1 = result;
    if ((-[BWMultiStreamCameraSourceNode _shouldEnableStillImageOutput](result) & 1) != 0
      || (double result = [*(id *)(v1 + 312) sensorRawStillImageOutputEnabled], result))
    {
      CFDictionaryRef v2 = (uint64_t *)MEMORY[0x1E4F55440];
      uint64_t v3 = (uint64_t *)MEMORY[0x1E4F55440];
      if (!*(unsigned char *)(v1 + 160))
      {
        if ([*(id *)(v1 + 312) primaryScalerDecoupled] && !*(unsigned char *)(v1 + 128)) {
          uint64_t v3 = (uint64_t *)MEMORY[0x1E4F55430];
        }
        else {
          uint64_t v3 = (uint64_t *)MEMORY[0x1E4F55428];
        }
      }
      uint64_t v4 = *v3;
      double result = [*(id *)(v1 + 312) sensorRawStillImageOutputEnabled];
      if (result)
      {
        if (*(unsigned char *)(v1 + 160)) {
          uint64_t v5 = 0;
        }
        else {
          uint64_t v5 = *v2;
        }
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    uint64_t v5 = 0;
LABEL_15:
    *(void *)(v1 + 10792) = v4;
    *(void *)(v1 + 10856) = v5;
  }
  return result;
}

- (id)_verifyColorSpacePropertiesForAllOutputs
{
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v7 = 0;
    uint64_t v2 = [result[14] getProperty:*MEMORY[0x1E4F54CD0] error:&v7];
    if (v7) {
      goto LABEL_15;
    }
    uint64_t v3 = (void *)v2;
    if ([v1[39] previewOutputEnabled])
    {
      unsigned int v7 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForOutputID:matchVideoOutputsColorInfo:]((uint64_t)v1, v1[1342], v3);
      if (v7) {
        goto LABEL_15;
      }
    }
    if ([v1[39] videoCaptureOutputEnabled])
    {
      unsigned int v7 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForOutputID:matchVideoOutputsColorInfo:]((uint64_t)v1, v1[1346], v3);
      if (v7) {
        goto LABEL_15;
      }
    }
    if ([v1[39] stillImageOutputEnabled])
    {
      int v4 = [v1[39] usesFirmwareStillImageOutput];
      uint64_t v5 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__stillImageStreamOutputID;
      if (!v4) {
        uint64_t v5 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
      }
      if (v7
        || (float v6 = *(id *)((char *)v1 + *v5), ([v6 isEqualToString:*MEMORY[0x1E4F55438]] & 1) == 0)
        && (unsigned int v7 = -[BWMultiStreamCameraSourceNode _verifyColorSpacePropertiesForOutputID:matchVideoOutputsColorInfo:]((uint64_t)v1, v6, v3)) != 0)
      {
LABEL_15:
        FigDebugAssert3();
      }
    }
    return (id *)v7;
  }
  return result;
}

- (void)_outputConfigurationsForAllOutputsWithVISOverscan:(double)a3
{
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    float v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (a2 != *MEMORY[0x1E4F1DB30] || a3 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      [*(id *)(v5 + 312) videoStabilizationEnabled];
    }
    if ([*(id *)(v5 + 312) previewOutputEnabled]) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v5, *(void **)(v5 + 10736), *(void **)(v5 + 200), a2, a3), *(void *)(v5 + 10736));
    }
    double v32 = 0;
    if (-[BWMultiStreamCameraSourceNode _shouldEnableStreamCaptureOutputForNodeOutput:](v5, &v32)) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v5, *(void **)(v5 + 10768), v32, a2, a3), *(void *)(v5 + 10768));
    }
    if (-[BWMultiStreamCameraSourceNode _shouldEnableStillImageOutput](v5))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode _outputConfigurationForStillImageOutputID:](v5, *(void **)(v5 + 10792)), *(void *)(v5 + 10792));
      if ([*(id *)(v5 + 312) sensorRawStillImageOutputEnabled])
      {
        uint64_t v8 = (void *)[*(id *)(v5 + 120) objectAtIndexedSubscript:*(int *)(v5 + 320)];
        uint64_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F552D8]), "BOOLValue"))objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F55070]); {
        [v6 setObject:v9 forKeyedSubscript:*(void *)(v5 + 10856)];
        }
      }
    }
    if ([*(id *)(v5 + 312) depthOutputEnabled])
    {
      uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v11 = [NSNumber numberWithInt:16];
      [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F55390]];
      [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F553F0]];
    }
    if ([*(id *)(v5 + 312) pointCloudOutputEnabled])
    {
      float v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(v5 + 312), "clientVideoFormat"));
      [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F55388]];
      [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F55408]];
    }
    uint64_t v14 = *MEMORY[0x1E4F55420];
    float v15 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F55420]];
    if (!objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F553A0]), "BOOLValue"))return v6; {
    uint64_t v16 = MEMORY[0x1E4F1DB28];
    }
    double v17 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v21 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F55410]];
    uint64_t v22 = [v6 objectForKeyedSubscript:v14];
    double v23 = (uint64_t *)MEMORY[0x1E4F55350];
    if (v21)
    {
      long long v24 = (void *)v22;
      if (v22)
      {
        CGSize v25 = *(CGSize *)(v16 + 16);
        rect.origin = *(CGPoint *)v16;
        rect.size = v25;
        v33.origin = rect.origin;
        v33.size = v25;
        int v26 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue");
        int v27 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue");
        uint64_t v28 = *v23;
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v21 objectForKeyedSubscript:*v23], &rect);
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v24 objectForKeyedSubscript:v28], &v33);
        double v29 = (v33.origin.x - rect.origin.x) * ((double)v26 / rect.size.width);
        if (v29 < 0.0) {
          double v29 = 0.0;
        }
        double v30 = (v33.origin.y - rect.origin.y) * ((double)v27 / rect.size.height);
        if (v30 < 0.0) {
          double v30 = 0.0;
        }
        double v17 = (double)(int)(2 * llroundf((float)(int)v29 * 0.5));
        double v18 = (double)(int)(2 * llroundf((float)(int)v30 * 0.5));
        double v19 = (double)(int)(4 * llroundf((float)(int)((double)v26 + v29 * -2.0) * 0.25));
        double v20 = (double)(int)(2 * llroundf((float)(int)((double)v27 + v30 * -2.0) * 0.5));
      }
    }
    if (v19 != 0.0 && v20 != 0.0)
    {
      v35.origin.double x = v17;
      v35.origin.double y = v18;
      v35.size.double width = v19;
      v35.size.double height = v20;
      objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v14), "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v35), *v23);
      return v6;
    }
    int v31 = FigSignalErrorAt();
    double result = 0;
    if (!v31) {
      return v6;
    }
  }
  return result;
}

- (uint64_t)_shouldEnableStreamCaptureOutputForNodeOutput:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (([*(id *)(result + 312) previewOutputEnabled] & 1) != 0
      || ([*(id *)(v3 + 312) videoCaptureOutputEnabled] & 1) != 0
      || ([*(id *)(v3 + 312) depthOutputEnabled] & 1) != 0)
    {
      char v4 = 1;
    }
    else
    {
      char v4 = [*(id *)(v3 + 312) pointCloudOutputEnabled];
    }
    if ([*(id *)(v3 + 312) videoCaptureOutputEnabled])
    {
      uint64_t v5 = 208;
LABEL_8:
      uint64_t v6 = *(void *)(v3 + v5);
      goto LABEL_9;
    }
    if ([*(id *)(v3 + 312) stillImageOutputEnabled]
      && ([*(id *)(v3 + 312) usesFirmwareStillImageOutput] & 1) == 0)
    {
      uint64_t v5 = 216;
      goto LABEL_8;
    }
    if (v4)
    {
      double result = 0;
    }
    else
    {
      if ([*(id *)(v3 + 312) stillImageOutputEnabled]
        && ([*(id *)(v3 + 312) usesFirmwareStillImageOutput] & 1) != 0)
      {
        uint64_t v6 = 0;
LABEL_9:
        double result = 1;
        if (!a2) {
          return result;
        }
        goto LABEL_10;
      }
      double result = [*(id *)(v3 + 312) detectedObjectsOutputEnabled];
    }
    uint64_t v6 = 0;
    if (a2) {
LABEL_10:
    }
      *a2 = v6;
  }
  return result;
}

- (uint64_t)_shouldEnableStillImageOutput
{
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 312) stillImageOutputEnabled]
      && ([*(id *)(v1 + 312) usesFirmwareStillImageOutput] & 1) != 0)
    {
      return 1;
    }
    else
    {
      uint64_t v2 = *(void **)(v1 + 312);
      return [v2 forceFirmwareStillImageOutputEnabled];
    }
  }
  return result;
}

- (uint64_t)_verifyColorSpacePropertiesForOutputID:(void *)a3 matchVideoOutputsColorInfo:
{
  if (result)
  {
    uint64_t v5 = -[BWMultiStreamCameraSourceNode _colorSpacePropertiesForOuputID:](result, a2);
    uint64_t v6 = [a3 objectForKeyedSubscript:a2];
    if (v5)
    {
      if (objc_msgSend(+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", v5), "isEqualToDictionary:", v6))return 0; {
      else
      }
        return 4294954516;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_colorSpacePropertiesForOuputID:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (([a2 isEqualToString:*MEMORY[0x1E4F55410]] & 1) != 0
      || ([a2 isEqualToString:*MEMORY[0x1E4F55420]] & 1) != 0
      || ([a2 isEqualToString:*MEMORY[0x1E4F553F8]] & 1) != 0
      || [a2 isEqualToString:*MEMORY[0x1E4F55438]])
    {
      return *(unsigned int *)(v3 + 328);
    }
    else if (([a2 isEqualToString:*MEMORY[0x1E4F55428]] & 1) != 0 {
           || (double result = [a2 isEqualToString:*MEMORY[0x1E4F55430]], result))
    }
    {
      return -[BWMultiStreamCameraSourceNode _stillImageColorSpaceProperties](v3);
    }
  }
  return result;
}

- (uint64_t)_updateFormatIndex
{
  if (!a1) {
    return 0;
  }
  unsigned int v2 = [*(id *)(a1 + 312) formatIndex];
  if ([*(id *)(a1 + 120) count] <= (unint64_t)v2)
  {
    FigDebugAssert3();
    return 4294954516;
  }
  else
  {
    *(_DWORD *)(a1 + 320) = [*(id *)(a1 + 312) formatIndex];
    objc_msgSend(*(id *)(a1 + 104), "setFastSwitchingMainFormatIndex:", objc_msgSend(*(id *)(a1 + 312), "fastSwitchingMainFormatIndex"));
    uint64_t v3 = [*(id *)(a1 + 104) setActiveFormatIndex:*(unsigned int *)(a1 + 320)];
    if (v3) {
      FigDebugAssert3();
    }
    else {
      -[BWMultiStreamCameraSourceNode _updateDutyCycleMetadataCacheForActiveFormatIndex:](a1, *(int *)(a1 + 320));
    }
  }
  return v3;
}

- (uint64_t)_updateDutyCycleMetadataCacheForActiveFormatIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    double result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 120), "objectAtIndexedSubscript:", a2), "objectForKeyedSubscript:", @"VideoMaxFrameRate"), "intValue");
    if ((int)result > 60
      || (double result = [*(id *)(v2 + 312) graphContainsMultipleVideoSources], (result & 1) != 0))
    {
      if (*(void *)(v2 + 10696)) {
        return result;
      }
      double result = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    else
    {

      double result = 0;
    }
    *(void *)(v2 + 10696) = result;
  }
  return result;
}

- (uint64_t)_primaryScalerIsAvailable
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[*(id *)(result + 104) supportedOutputs];
    int v3 = [v2 containsObject:*MEMORY[0x1E4F55410]];
    if ([*(id *)(v1 + 312) depthType] - 1 <= 1
      && [*(id *)(v1 + 312) secondaryScalerIsNotAvailable]
      && [*(id *)(v1 + 312) previewOutputEnabled])
    {
      int v4 = [*(id *)(v1 + 312) videoCaptureOutputEnabled];
    }
    else
    {
      int v4 = 0;
    }
    if (*(unsigned char *)(v1 + 128)
      && [*(id *)(v1 + 96) depthDataDeliveryEnabled]
      && (([*(id *)(v1 + 96) isBravoVariant] ^ 1 | v4) & 1) == 0
      && ([*(id *)(v1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled] & 1) == 0)
    {
      int v5 = [*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled];
      if (v3) {
        return v5 & ~[*(id *)(v1 + 312) primaryScalerDecoupled];
      }
    }
    else
    {
      int v5 = 1;
      if (v3) {
        return v5 & ~[*(id *)(v1 + 312) primaryScalerDecoupled];
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)_updateOutputIDMappingsForStreamingOutputs
{
  if (!result) {
    return result;
  }
  unint64_t v1 = result;
  int v2 = [*(id *)(result + 312) previewOutputEnabled];
  int v3 = -[BWMultiStreamCameraSourceNode _shouldEnableStreamCaptureOutputForNodeOutput:](v1, 0);
  int v4 = -[BWMultiStreamCameraSourceNode _primaryScalerIsAvailable](v1);
  int v5 = -[BWMultiStreamCameraSourceNode _secondaryScalerIsAvailable](v1);
  uint64_t v6 = (void *)[*(id *)(v1 + 104) supportedOutputs];
  unsigned int v7 = (void *)*MEMORY[0x1E4F553F8];
  int v8 = [v6 containsObject:*MEMORY[0x1E4F553F8]];
  if (v4)
  {
    int v9 = -[BWMultiStreamCameraSourceNode _isVideoCaptureOutputSupportedByOutputID:](v1, (void *)*MEMORY[0x1E4F55410]);
    if (!v5) {
      goto LABEL_4;
    }
  }
  else
  {
    int v9 = 0;
    if (!v5)
    {
LABEL_4:
      int v10 = 0;
      if (!v8) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  int v10 = -[BWMultiStreamCameraSourceNode _isVideoCaptureOutputSupportedByOutputID:](v1, (void *)*MEMORY[0x1E4F55420]);
  if (!v8)
  {
LABEL_5:
    int v31 = 0;
    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_9:
  int v31 = -[BWMultiStreamCameraSourceNode _isVideoCaptureOutputSupportedByOutputID:](v1, v7);
  if (!v10)
  {
LABEL_12:
    LODWORD(v29) = 0;
    goto LABEL_13;
  }
LABEL_10:
  if (![*(id *)(v1 + 312) primaryScalerDeprioritized]) {
    goto LABEL_12;
  }
  LODWORD(v29) = [*(id *)(v1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled] ^ 1;
LABEL_13:
  int v30 = v9;
  if (v31
    && [*(id *)(v1 + 312) primaryScalerDeprioritized]
    && ([*(id *)(v1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled] & 1) == 0)
  {
    if (-[BWMultiStreamCameraSourceNode _scalingRequiredForOutput:](v1, *(void **)(v1 + 208))) {
      int v11 = FigCapturePixelFormatIs422([*(id *)(v1 + 312) clientVideoFormat]);
    }
    else {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  HIDWORD(v29) = v10;
  if (v5 && [*(id *)(v1 + 312) primaryScalerDeprioritized])
  {
    int v12 = [*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled] ^ 1;
    if (!v8) {
      goto LABEL_24;
    }
  }
  else
  {
    int v12 = 0;
    if (!v8)
    {
LABEL_24:
      char v13 = 0;
      goto LABEL_25;
    }
  }
  if (!objc_msgSend(*(id *)(v1 + 312), "primaryScalerDeprioritized", v29)
    || ([*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled] & 1) != 0)
  {
    goto LABEL_24;
  }
  char v13 = -[BWMultiStreamCameraSourceNode _scalingRequiredForOutput:](v1, *(void **)(v1 + 200)) ^ 1;
LABEL_25:
  int v14 = v2 & v3;
  if (*(unsigned char *)(v1 + 160))
  {
    if (v14) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Cannot enable two streaming outputs on the IR camera.", 0 reason userInfo]);
    }
    float v15 = (void *)*MEMORY[0x1E4F55418];
    if (v3) {
      uint64_t v16 = (void *)*MEMORY[0x1E4F55418];
    }
    else {
      uint64_t v16 = 0;
    }
    if (v2)
    {
      unsigned int v7 = 0;
    }
    else
    {
      float v15 = 0;
      unsigned int v7 = v16;
    }
    goto LABEL_33;
  }
  if (!v14)
  {
    if (v2)
    {
      if (v12)
      {
LABEL_46:
        unsigned int v7 = 0;
        goto LABEL_47;
      }
      if ((v13 & 1) == 0)
      {
        if (v4)
        {
          unsigned int v7 = 0;
LABEL_94:
          double v23 = (void **)MEMORY[0x1E4F55410];
          goto LABEL_95;
        }
        if (v5) {
          goto LABEL_46;
        }
        if ((v8 & 1) == 0) {
          return 4294954516;
        }
      }
      float v15 = v7;
LABEL_77:
      unsigned int v7 = 0;
LABEL_33:
      double result = 0;
      *(void *)(v1 + 10736) = v15;
      *(void *)(v1 + 10768) = v7;
      return result;
    }
    if (!v3)
    {
LABEL_76:
      float v15 = 0;
      goto LABEL_77;
    }
    if (v29)
    {
LABEL_53:
      float v15 = 0;
      long long v24 = (void **)MEMORY[0x1E4F55420];
LABEL_90:
      unsigned int v7 = *v24;
      goto LABEL_33;
    }
    if ((v11 & 1) == 0)
    {
      if (v30)
      {
        float v15 = 0;
        long long v24 = (void **)MEMORY[0x1E4F55410];
        goto LABEL_90;
      }
      if (HIDWORD(v29)) {
        goto LABEL_53;
      }
      if (!v31) {
        return 4294954516;
      }
    }
    float v15 = 0;
    goto LABEL_33;
  }
  if (((v4 | v5) & 1) == 0) {
    goto LABEL_114;
  }
  if ((v4 & v5) == 1)
  {
    if ([*(id *)(v1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled]
      && [*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled])
    {
      unint64_t v17 = -[BWMultiStreamCameraSourceNode _calculateVideoCaptureDimensions](v1);
      int v18 = v17;
      unint64_t v19 = HIDWORD(v17);
      unint64_t v20 = -[BWMultiStreamCameraSourceNode _calculatePreviewDimensionsForShiftMitigation](v1);
      if (v18 >= (int)v20 && (int)v19 >= SHIDWORD(v20) && v30 == 1)
      {
        uint64_t v21 = (void **)MEMORY[0x1E4F55410];
        uint64_t v22 = (void **)MEMORY[0x1E4F55420];
LABEL_108:
        unsigned int v7 = *v21;
        float v15 = *v22;
        goto LABEL_33;
      }
      BOOL v27 = v18 < (int)v20 && (int)v19 < SHIDWORD(v20);
      int v28 = HIDWORD(v29);
      if (!v27) {
        int v28 = 0;
      }
      if (v28 == 1)
      {
        uint64_t v21 = (void **)MEMORY[0x1E4F55420];
        uint64_t v22 = (void **)MEMORY[0x1E4F55410];
        goto LABEL_108;
      }
      return 4294954516;
    }
    if (v11)
    {
      double v23 = (void **)MEMORY[0x1E4F55420];
      if (!v12) {
        double v23 = (void **)MEMORY[0x1E4F55410];
      }
      goto LABEL_95;
    }
    if (v30)
    {
      CGSize v25 = (void *)*MEMORY[0x1E4F55410];
      if ([*(id *)(v1 + 312) optimizeBandwidthForPreviewOutput])
      {
        int v26 = -[BWMultiStreamCameraSourceNode _preferIntermediateTapOverSecondaryScalerForPreviewOutputBasedOnBandwidth](v1);
        float v15 = (void *)*MEMORY[0x1E4F55420];
        if (v26) {
          float v15 = v7;
        }
      }
      else
      {
        float v15 = (void *)*MEMORY[0x1E4F55420];
      }
      unsigned int v7 = v25;
      goto LABEL_33;
    }
    if (HIDWORD(v29))
    {
      unsigned int v7 = (void *)*MEMORY[0x1E4F55420];
      goto LABEL_94;
    }
LABEL_93:
    if (!v31) {
      return 4294954516;
    }
    goto LABEL_94;
  }
  if (v4)
  {
    if (![*(id *)(v1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled]
      || ![*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled])
    {
      if ((v31 & v30) == 1)
      {
        if ((-[BWMultiStreamCameraSourceNode _scalingRequiredForOutput:](v1, *(void **)(v1 + 208)) & 1) == 0
          && !-[BWMultiStreamCameraSourceNode _preferPrimaryScalerOverIntermediateTapForVideoOutputBasedOnBandwidth](v1)
          || objc_msgSend(*(id *)(v1 + 312), "depthType", v29) - 1 <= 1
          && !-[BWMultiStreamCameraSourceNode _videoCaptureOutputDimensionsValidForDepth](v1))
        {
          goto LABEL_94;
        }
      }
      else if (!v30)
      {
        goto LABEL_93;
      }
      long long v24 = (void **)MEMORY[0x1E4F55410];
      goto LABEL_89;
    }
    goto LABEL_114;
  }
  if (!v5) {
    goto LABEL_76;
  }
  if (([*(id *)(v1 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled] & 1) == 0
    && ![*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled])
  {
    if (!v31)
    {
      if (!HIDWORD(v29)) {
        return 4294954516;
      }
      long long v24 = (void **)MEMORY[0x1E4F55420];
LABEL_89:
      float v15 = v7;
      goto LABEL_90;
    }
LABEL_47:
    double v23 = (void **)MEMORY[0x1E4F55420];
LABEL_95:
    float v15 = *v23;
    goto LABEL_33;
  }
LABEL_114:
  return FigSignalErrorAt();
}

- (uint64_t)_isVideoCaptureOutputSupportedByOutputID:(uint64_t)result
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  int v4 = (void *)[*(id *)(result + 120) objectAtIndexedSubscript:*(int *)(result + 320)];
  if (!v4) {
    goto LABEL_32;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55318]), "objectForKeyedSubscript:", a2);
  if (!v5) {
    goto LABEL_32;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = *MEMORY[0x1E4F55410];
  if (([a2 isEqualToString:*MEMORY[0x1E4F55410]] & 1) == 0
    && [*(id *)(v3 + 312) visionDataConfiguration]
    || ([a2 isEqualToString:v7] & 1) == 0
    && ([*(id *)(v3 + 312) videoStabilizationEnabled] & 1) != 0)
  {
    return 0;
  }
  uint64_t v8 = *MEMORY[0x1E4F55420];
  if ([a2 isEqualToString:*MEMORY[0x1E4F55420]])
  {
    double result = -[BWMultiStreamCameraSourceNode _secondaryScalerSupportsVideoCaptureDimensions](v3);
    if (!result) {
      return result;
    }
  }
  int v9 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F554B8]), "BOOLValue");
  int v10 = [a2 isEqualToString:v8]
      ? -[BWMultiStreamCameraSourceNode _scalerChainingEnabled](v3)
      : 0;
  if ([*(id *)(v3 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled]
    && !(v10 | v9))
  {
    return 0;
  }
  if ([a2 isEqualToString:v7])
  {
    if ([*(id *)(v3 + 312) previewOutputEnabled])
    {
      if ([*(id *)(v3 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled])
      {
        double result = [*(id *)(v3 + 312) geometricDistortionCorrectionOnVideoCaptureOutputEnabled];
        if (!result) {
          return result;
        }
      }
    }
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F55498]];
  if (!v11)
  {
LABEL_32:
    FigDebugAssert3();
    return 0;
  }
  int v12 = (void *)v11;
  int v13 = [*(id *)(v3 + 312) clientVideoFormat];
  int IsFullRange = FigCapturePixelFormatIsFullRange(v13);
  int IsTenBit = FigCapturePixelFormatIsTenBit(v13);
  int v16 = FigCapturePixelFormatIs422(v13);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double result = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (result)
  {
    uint64_t v17 = result;
    uint64_t v18 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v12);
        }
        int v20 = [*(id *)(*((void *)&v21 + 1) + 8 * i) intValue];
        if (IsFullRange == FigCapturePixelFormatIsFullRange(v20)
          && IsTenBit == FigCapturePixelFormatIsTenBit(v20)
          && v16 == FigCapturePixelFormatIs422(v20))
        {
          return 1;
        }
      }
      uint64_t v17 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      double result = 0;
      if (v17) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (uint64_t)_secondaryScalerIsAvailable
{
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 312) secondaryScalerIsNotAvailable])
    {
      return 0;
    }
    else
    {
      int v2 = (void *)[*(id *)(v1 + 104) supportedOutputs];
      double result = [v2 containsObject:*MEMORY[0x1E4F55420]];
      if (result) {
        return ![*(id *)(v1 + 312) primaryScalerDecoupled] || *(unsigned char *)(v1 + 128) != 0;
      }
    }
  }
  return result;
}

- (uint64_t)_secondaryScalerSupportsVideoCaptureDimensions
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = (void *)[*(id *)(result + 120) objectAtIndexedSubscript:*(int *)(result + 320)];
    if (v2)
    {
      uint64_t v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F55318]];
      double result = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F55420]];
      if (result)
      {
        int v4 = (void *)result;
        [*(id *)(v1 + 312) visOverscan];
        unint64_t v7 = [(BWMultiStreamCameraSourceNode *)v1 _calculateVideoCaptureDimensionsWithVISOverscan:v6];
        objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55460]), "floatValue");
        if (v8 == 0.0)
        {
          return (int)v7 < 2305;
        }
        else
        {
          float v9 = v8;
          int v10 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F55480]];
          uint64_t v11 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F55470]];
          LODWORD(v10) = FigCaptureRoundFloatToMultipleOf(2, v9 * (float)[v10 integerValue]);
          int v12 = FigCaptureRoundFloatToMultipleOf(2, v9 * (float)[v11 integerValue]);
          return (int)v10 >= (int)v7 && v12 >= SHIDWORD(v7);
        }
      }
    }
    else
    {
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (CMSampleBufferRef)_createDepthDataSampleBufferFromVideoSampleBuffer:(CMSampleBufferRef)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    CMSampleBufferRef v11 = 0;
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F52FE8];
    double v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F52FE8], 0);
    if (v5)
    {
      double v6 = v5;
      unint64_t v7 = (__CVBuffer *)[v5 objectForKeyedSubscript:*(void *)(v3 + 344)];
      if (v7)
      {
        if (BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v7, (CFTypeRef *)(v3 + 336), &v11))
        {
          FigDebugAssert3();
        }
        else
        {
          if ((unint64_t)[v6 count] >= 2)
          {
            float v8 = (void *)[v6 mutableCopy];
            [v8 setObject:0 forKeyedSubscript:*(void *)(v3 + 344)];
            CMSetAttachment(v11, v4, (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8], 1u);
          }
          CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
          CFTypeRef v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          CMSetAttachment(v11, v9, (CFTypeRef)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10], 1u);
        }
      }
    }
    CMRemoveAttachment(target, v4);
    return v11;
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)ultraHighResSensorRawStillImageOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_ultraHighResSensorRawStillImageOutputDimensions;
}

void __70__BWMultiStreamCameraSourceNode__asynchronouslyPreallocateBufferPools__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(a1 + 48) + 495) = [*(id *)(a1 + 32) prefetch:(*(_DWORD *)(*(void *)(a1 + 48) + 92) + 2) lastEmittedSurfaceID:0] ^ 1;
    int v2 = *(void **)(a1 + 40);
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 preallocate];
  }
}

- (id)nodeSubType
{
  return @"FigCaptureDevice";
}

- (BWFigVideoCaptureStream)captureStream
{
  return self->_captureStream;
}

- (BOOL)start:(id *)a3
{
  self->_discardOutputSampleBuffers = 0;
  self->_stopStreamConfigurationUpdates = 0;
  if (self->_resolvedFormatIndex == -1)
  {
LABEL_28:
    [(BWMultiStreamCameraSourceNode *)self makeOutputsLiveIfNeeded];
    return 1;
  }
  self->_infraredProjectorUptimeInUsForLowPowerSparse = 0;
  self->_infraredProjectorUptimeInUsForHighPowerSparse = 0;
  self->_previousInfraredCaptureID = 0;
  self->_rawCompressionEnabled = 1;
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration deferStreamingOutputsEnable])
  {
    [(BWFigVideoCaptureDevice *)self->_captureDevice setZoomFactorChangedDelegate:self forPortType:self->_portType];
  }
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputEnabled])
  {
    if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputEnabled])
    {
      BOOL v6 = [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration usesFirmwareStillImageOutput];
      BOOL v7 = v6;
      p_captureStream = &self->_captureStream;
      [(BWFigVideoCaptureStream *)self->_captureStream setTimeMachineEnabled:!v6];
      if (!v7)
      {
        v28[0] = 0;
        v28[1] = v28;
        v28[2] = 0x3052000000;
        v28[3] = __Block_byref_object_copy__31;
        v28[4] = __Block_byref_object_dispose__31;
        void v28[5] = self;
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x4010000000;
        v25[3] = "";
        CGSize size = self->_outputsStorage[3].cropRect.size;
        CGPoint origin = self->_outputsStorage[3].cropRect.origin;
        CGSize v27 = size;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __39__BWMultiStreamCameraSourceNode_start___block_invoke;
        v24[3] = &unk_1E5C29B48;
        void v24[5] = v28;
        void v24[6] = v25;
        v24[4] = self;
        [(BWFigVideoCaptureStream *)*p_captureStream setStillImageBufferTimeMachineHandler:v24];
        _Block_object_dispose(v25, 8);
        _Block_object_dispose(v28, 8);
      }
    }
    else
    {
      p_captureStream = &self->_captureStream;
      [(BWFigVideoCaptureStream *)self->_captureStream setTimeMachineEnabled:0];
    }
    [(BWFigVideoCaptureStream *)*p_captureStream setUsesStillFusionReferenceFramePTSForDidCaptureCallback:[(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration livePhotoCaptureEnabled]];
  }
  if ([(BWFigVideoCaptureDevice *)self->_captureDevice smartCameraEnabled]) {
    CFTypeRef v10 = [(BWDetectedFacesRingBuffer *)self->_detectedFacesRingBuffer faceDetector];
  }
  else {
    CFTypeRef v10 = 0;
  }
  [(BWFigVideoCaptureStream *)self->_captureStream setFaceDetector:v10];
  if ([(BWFigVideoCaptureDevice *)self->_captureDevice smartCameraEnabled]) {
    CMSampleBufferRef v11 = [(BWDetectedObjectsInfoRingBuffer *)self->_detectedObjectsInfoRingBuffer objectDetector];
  }
  else {
    CMSampleBufferRef v11 = 0;
  }
  [(BWFigVideoCaptureStream *)self->_captureStream setObjectDetector:v11];
  -[BWMultiStreamCameraSourceNode _registerForStreamNotifications]((uint64_t)self);
  -[BWMultiStreamCameraSourceNode _asynchronouslyPreallocateBufferPools]((uint64_t)self);
  [(BWFigVideoCaptureStream *)self->_captureStream sourceNodeWillStartStreaming];
  int v12 = -[BWMultiStreamCameraSourceNode _setStreamOutputsEnabled:streamingOutputs:onDemandStillOutputs:]((uint64_t)self, 1u, [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration deferStreamingOutputsEnable] ^ 1, 1);
  if (v12)
  {
    int v20 = v12;
    uint64_t v23 = v3;
    LODWORD(v22) = v12;
  }
  else
  {
    if ([(BWFigCaptureStream *)[(BWFigVideoCaptureStream *)self->_captureStream stream] streaming]
      || [(BWFigVideoCaptureStream *)self->_captureStream suspended]
      || (int v13 = [(BWFigVideoCaptureStream *)self->_captureStream start]) == 0)
    {
      [(BWFigVideoCaptureStream *)self->_captureStream sourceNodeDidStartStreaming];
      int v14 = [(BWFigVideoCaptureDevice *)self->_captureDevice masterCaptureStream];
      BOOL v15 = [(BWFigVideoCaptureDevice *)self->_captureDevice isBravoVariant];
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration pointCloudOutputEnabled])
      {
        BOOL v16 = [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration pointCloudOutputIsSupplementalPointCloudData];
      }
      else
      {
        BOOL v16 = 0;
      }
      captureStream = self->_captureStream;
      BOOL v18 = captureStream != v14 && v15;
      if (!v18 && ![(BWFigVideoCaptureStream *)captureStream suspended] && !v16) {
        return 1;
      }
      goto LABEL_28;
    }
    int v20 = v13;
    uint64_t v23 = v3;
    LODWORD(v22) = v13;
  }
  FigDebugAssert3();
  [(BWMultiStreamCameraSourceNode *)self makeOutputsLiveIfNeeded];
  [(BWFigVideoCaptureStream *)self->_captureStream sourceNodeFailedToStartStreaming];
  if (!a3) {
    return 0;
  }
  long long v21 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:0];
  BOOL result = 0;
  *a3 = v21;
  return result;
}

- (void)_asynchronouslyPreallocateBufferPools
{
  if (a1)
  {
    uint64_t v2 = 20;
    uint64_t v3 = a1;
    do
    {
      if (*(_DWORD *)(v3 + 384) == 1 && *(unsigned char *)(v3 + 393) && !*(unsigned char *)(v3 + 488))
      {
        CFStringRef v4 = *(void **)(v3 + 400);
        if (v4) {
          double v5 = (void *)[v4 preparedPixelBufferPool];
        }
        else {
          double v5 = *(void **)(v3 + 480);
        }
        int v7 = *(_DWORD *)(v3 + 512);
        int v6 = *(_DWORD *)(v3 + 516);
        [*(id *)(a1 + 312) maxFrameRate];
        float v9 = v8;
        unint64_t v10 = [v5 capacity];
        [*(id *)(a1 + 312) maxFrameRate];
        uint64_t v12 = 0;
        char v13 = 0;
        if (v7 >= 3840 && v6 >= 2160)
        {
          if (v9 < 60.0) {
            float v14 = 1.5;
          }
          else {
            float v14 = 1.0;
          }
          if ((float)(v14 * v11) <= (float)v10)
          {
            uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 400), "memoryPool"), "newFlushAssertion:", objc_msgSend(v5, "name"));
            char v13 = 1;
          }
          else
          {
            char v13 = 0;
            uint64_t v12 = 0;
          }
        }
        BOOL v15 = *(NSObject **)(a1 + 152);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __70__BWMultiStreamCameraSourceNode__asynchronouslyPreallocateBufferPools__block_invoke;
        block[3] = &unk_1E5C28418;
        char v17 = v13;
        block[5] = v12;
        block[6] = v3 + 384;
        block[4] = v5;
        dispatch_async(v15, block);
      }
      v3 += 512;
      --v2;
    }
    while (v2);
  }
}

- (void)makeOutputsLiveIfNeeded
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  p_enabled = &self->_outputsStorage[0].enabled;
  uint64_t v5 = 20;
  do
  {
    if (*p_enabled && *(void *)(p_enabled + 7)) {
      objc_msgSend(v3, "addObject:");
    }
    p_enabled += 512;
    --v5;
  }
  while (v5);
  uint64_t v6 = 0;
  p_bufferServicingQueue = &self->_outputsStorage[0].bufferServicingQueue;
  do
  {
    if (*((unsigned char *)p_bufferServicingQueue - 23))
    {
      float v8 = *p_bufferServicingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__BWMultiStreamCameraSourceNode_makeOutputsLiveIfNeeded__block_invoke;
      block[3] = &unk_1E5C26F78;
      int v10 = v6;
      block[4] = self;
      block[5] = v3;
      dispatch_async(v8, block);
    }
    p_bufferServicingQueue += 64;
    ++v6;
  }
  while (v6 != 20);
}

- (void)_addCaptureStreamAttachmentsToSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    [v3 setObject:*(void *)(a1 + 184) forKeyedSubscript:*MEMORY[0x1E4F54128]];
    uint64_t v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 192)];
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F53DE0]];
    if (*(unsigned char *)(a1 + 11042))
    {
      uint64_t v5 = *MEMORY[0x1E4F54108];
      CFDictionaryRef v6 = (const __CFDictionary *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F54108]];
      if (v6)
      {
        float64x2_t v10 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
        CGPointMakeWithDictionaryRepresentation(v6, (CGPoint *)&v10);
        CGPoint v7 = (CGPoint)vaddq_f64(*(float64x2_t *)(a1 + 11048), v10);
        float64x2_t v10 = (float64x2_t)v7;
        CGFloat y = v7.y;
        CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v7);
        [v3 setObject:DictionaryRepresentation forKeyedSubscript:v5];
      }
    }
  }
}

- (void)_addMetadataUsedByVideoEncoderToPixelBufferForSampleBuffer:(uint64_t)a3 nodeOutput:
{
  if (a1)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    if (*(void *)(a1 + 208) == a3
      && ([*(id *)(a1 + 312) videoEncoderMetadataOnVideoCaptureOutputEnabled] & 1) != 0)
    {
      CGPoint v7 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureOutputColorInfo;
    }
    else
    {
      if (*(void *)(a1 + 200) != a3
        || ![*(id *)(a1 + 312) videoEncoderMetadataOnPreviewOutputEnabled])
      {
        return;
      }
      CGPoint v7 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewOutputColorInfo;
    }
    FigCaptureMetadataUtilitiesAddSampleBufferMetadataUsedByVideoEncoderToPixelBuffer(sbuf);
    CFDictionaryRef v8 = *(const __CFDictionary **)(a1 + *v7);
    CVBufferSetAttachments(ImageBuffer, v8, kCVAttachmentMode_ShouldPropagate);
  }
}

- (void)_addDolbyVisionMetadataToPreviewPixelBufferForSampleBuffer:(uint64_t)a3 nodeOutput:
{
  if (a1)
  {
    CFTypeRef v16 = 0;
    if (*(void *)(a1 + 11088))
    {
      if (*(void *)(a1 + 208) == a3
        && ([*(id *)(a1 + 312) dolbyVisionMetadataOnVideoCaptureOutputEnabled] & 1) != 0
        || *(void *)(a1 + 200) == a3
        && [*(id *)(a1 + 312) dolbyVisionMetadataOnPreviewOutputEnabled])
      {
        CFDictionaryRef v6 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
        objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DA0]), "floatValue");
        if (v8 != (float)*(unsigned int *)(a1 + 11080))
        {
          *(_DWORD *)(a1 + 11080) = v8;
          VTHDRMetadataGenerationSessionSetFramesPerSecond();
        }
        memset(&v15, 0, sizeof(v15));
        CMSampleBufferGetPresentationTimeStamp(&v15, (CMSampleBufferRef)a2);
        memset(&v14, 0, sizeof(v14));
        CMTimeMake(&rhs, 4, *(_DWORD *)(a1 + 11080));
        CMTime lhs = *(CMTime *)(a1 + 11096);
        CMTimeAdd(&v14, &lhs, &rhs);
        if (v14.flags)
        {
          CMTime lhs = v15;
          CMTime v11 = v14;
          CMTimeCompare(&lhs, &v11);
        }
        *(CMTime *)(a1 + 11096) = v15;
        -[BWMultiStreamCameraSourceNode _HDRImageStatisticsDictFromMetadata:](a1, v6);
        CVPixelBufferGetWidth(ImageBuffer);
        CVPixelBufferGetHeight(ImageBuffer);
        DataFromStatisticsDictionarCGFloat y = VTHDRMetadataGenerationSessionCreateDataFromStatisticsDictionary();
        CFTypeRef v10 = v16;
        if (!DataFromStatisticsDictionary && v16)
        {
          CVBufferSetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E4F24AF0], v16, kCVAttachmentMode_ShouldPropagate);
          CFTypeRef v10 = v16;
        }
        if (v10) {
          CFRelease(v10);
        }
      }
    }
  }
}

- (BWStats)_tallyCompressedIOSurfaceStatsForRawForSBuf:(BWStats *)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    BOOL result = (BWStats *)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F54150]), "intValue");
    if (result)
    {
      unsigned int v4 = result;
      long long v8 = *MEMORY[0x1E4F1DB28];
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      FigCFDictionaryGetCGRectIfPresent();
      BOOL result = (BWStats *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F541B0], v8);
      unsigned int v5 = (*((double *)&v9 + 1)
                        * (double)(llroundf((float)(int)*(double *)&v9 * 0.0078125) << 7)
                        * 10.0
                        * 0.125) << (result != 0);
      float v6 = (float)v4 / (float)v5;
      if (!*(void *)&v2[114]._max)
      {
        BOOL result = objc_alloc_init(BWStats);
        *(void *)&v2[114]._madouble x = result;
        v2[114]._sumX = 0.0;
        v2[114]._sumXX = 0.0;
        LODWORD(v2[114]._samples) = *((double *)&v9 + 1);
      }
      if (v6 > 0.0 && v6 <= 1.0)
      {
        BOOL result = (BWStats *)[*(id *)&v2[114]._max addDataPoint:v6];
        *(void *)&v2[114]._sumX += v4;
        *(void *)&v2[114]._sumXX += v5;
      }
    }
    else
    {
      BYTE4(v2[114]._samples) = 0;
    }
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v6.receiver = self;
  v6.super_class = (Class)BWMultiStreamCameraSourceNode;
  [(BWNode *)&v6 prepareForCurrentConfigurationToBecomeLive];
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration reflectsStillsOnStreamingOutputs]&& !self->_motionDataPreserver)
  {
    self->_motionDataPreserver = [[BWMotionDataPreserver alloc] initWithName:[(BWNode *)self description]];
  }
  BOOL v3 = [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration videoHDRImageStatisticsEnabled];
  hdrMetadataSession = self->_hdrMetadataSession;
  if (v3)
  {
    if (!hdrMetadataSession) {
      VTHDRMetadataGenerationSessionCreate();
    }
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_lastFramePTS.value = *MEMORY[0x1E4F1F9F8];
    self->_lastFramePTS.epoch = *(void *)(v5 + 16);
  }
  else if (hdrMetadataSession)
  {
    CFRelease(hdrMetadataSession);
    self->_hdrMetadataSession = 0;
  }
}

- (uint64_t)_prependPreservedMotionDataToSampleBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    BOOL result = [*(id *)(result + 312) reflectsStillsOnStreamingOutputs];
    if (result)
    {
      if (![*(id *)(v3 + 104) synchronizedStreamsEnabled]
        || (BOOL result = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"), result))
      {
        unsigned int v4 = *(void **)(v3 + 10688);
        return [v4 prependPreservedMotionDataToSampleBuffer:a2];
      }
    }
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)zoomBasedQSubSensorRawStillImageOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_zoomBasedQSubSensorRawStillImageOutputDimensions;
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_11(uint64_t a1, void *a2, CMTime *a3)
{
  v43[6] = *MEMORY[0x1E4F143B8];
  memset(&v39, 0, sizeof(v39));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v39, UpTimeNanoseconds, 1000000000);
  uint64_t v29 = *MEMORY[0x1E4F53B58];
  uint64_t v7 = *MEMORY[0x1E4F53B58];
  uint64_t v30 = *MEMORY[0x1E4F53B60];
  v43[0] = *MEMORY[0x1E4F53B60];
  v43[1] = v7;
  uint64_t v27 = *MEMORY[0x1E4F53B80];
  uint64_t v8 = *MEMORY[0x1E4F53B80];
  uint64_t v28 = *MEMORY[0x1E4F53B78];
  v43[2] = *MEMORY[0x1E4F53B78];
  v43[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F53B70];
  v43[4] = *MEMORY[0x1E4F53B90];
  v43[5] = v9;
  uint64_t v26 = v9;
  CFTypeRef v10 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:6];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v11 = [a2 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(a2);
        }
        CMTime v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v10 containsObject:v15])
        {
          if ([v15 isEqualToString:v30])
          {
            unsigned int v16 = 9;
          }
          else if ([v15 isEqualToString:v29])
          {
            unsigned int v16 = 10;
          }
          else if ([v15 isEqualToString:v28])
          {
            unsigned int v16 = 12;
          }
          else if ([v15 isEqualToString:v27])
          {
            unsigned int v16 = 13;
          }
          else
          {
            if (([v15 isEqualToString:v26] & 1) == 0) {
              objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Internal inconsistency, unknown metadata output key: %@", v15), 0 reason userInfo]);
            }
            unsigned int v16 = 18;
          }
          if (*MEMORY[0x1E4F1EBA8] == 1)
          {
            CMTime time = *a3;
            CMTimeGetSeconds(&time);
            CMTime time = v39;
            CMTimeGetSeconds(&time);
            kdebug_trace();
          }
          char v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          BOOL v18 = (void *)[a2 objectForKeyedSubscript:v15];
          CMTime time = *a3;
          multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v17, v16, v18, (UInt8 *)&time);
        }
        else
        {
          objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 312), "enabledSemanticMaskTypes"), "containsObject:", v15);
        }
      }
      uint64_t v12 = [a2 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v12);
  }
  unint64_t v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v20 = (void *)[*(id *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 312) enabledSemanticMaskTypes];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", *(void *)(*((void *)&v31 + 1) + 8 * j)), *(void *)(*((void *)&v31 + 1) + 8 * j));
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v22);
  }
  if ([v19 count])
  {
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      CMTime time = *a3;
      CMTimeGetSeconds(&time);
      CMTime time = v39;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    CGSize v25 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    CMTime time = *a3;
    multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v25, 0xBu, v19, (UInt8 *)&time);
  }
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  memset(&v9, 0, sizeof(v9));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = *a3;
    CMTimeGetSeconds(&time);
    CMTime time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 0, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_2(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  memset(&v9, 0, sizeof(v9));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = *a3;
    CMTimeGetSeconds(&time);
    CMTime time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 1u, a2, (UInt8 *)&time);
}

uint64_t __56__BWMultiStreamCameraSourceNode_makeOutputsLiveIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = -[BWMultiStreamCameraSourceNode _nodeOutputsMadeLiveByStreamOutputIndex:](*(void *)(a1 + 32), *(_DWORD *)(a1 + 48));
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((v7 == *(void **)(*(void *)(a1 + 32) + 384 + ((uint64_t)*(int *)(a1 + 48) << 9) + 16)
           || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10) & 1) == 0)&& !objc_msgSend(v7, "liveFormat", (void)v10))
        {
          [v7 makeConfiguredFormatLive];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  uint64_t result = *(void *)(a1 + 32);
  uint64_t v9 = *(int *)(a1 + 48);
  if (!*(unsigned char *)(result + 384 + (v9 << 9) + 8))
  {
    -[BWMultiStreamCameraSourceNode _createAndStartFrameCounterForOutputIndexIfNecessary:](result, v9);
    uint64_t result = *(void *)(a1 + 32);
    uint64_t v9 = *(int *)(a1 + 48);
  }
  *(unsigned char *)(result + 384 + (v9 << 9) + 8) = 1;
  return result;
}

- (void)_nodeOutputsMadeLiveByStreamOutputIndex:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = a1 + 384;
  uint64_t v4 = a2;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_super v6 = v5;
  uint64_t v7 = v3 + (v4 << 9);
  if (*(void *)(v7 + 16)) {
    objc_msgSend(v5, "addObject:");
  }
  if ((*(unsigned char *)(v7 + 4) & 4) != 0)
  {
    if ([*(id *)(a1 + 312) detectedObjectsOutputEnabled]) {
      [v6 addObject:*(void *)(a1 + 232)];
    }
    if ([*(id *)(a1 + 312) stillImageOutputEnabled]) {
      [v6 addObject:*(void *)(a1 + 216)];
    }
    if ([*(id *)(a1 + 312) sensorRawStillImageOutputEnabled]) {
      [v6 addObject:*(void *)(a1 + 224)];
    }
  }
  return v6;
}

- (uint64_t)_createAndStartFrameCounterForOutputIndexIfNecessary:(uint64_t)result
{
  if (result)
  {
    if (*(_DWORD *)(result + 384 + ((uint64_t)a2 << 9)) == 1)
    {
      uint64_t v2 = result + 384 + ((uint64_t)a2 << 9);
      uint64_t v4 = *(void *)(v2 + 80);
      uint64_t v3 = (FigCaptureFrameCounter **)(v2 + 80);
      if (!v4)
      {
        uint64_t v5 = -[FigCaptureFrameCounter initWithTitle:]([FigCaptureFrameCounter alloc], "initWithTitle:", [NSString stringWithFormat:@"%@ (%@)", result, mscsn_streamOutputIDForOutputIndex(a2)]);
        *uint64_t v3 = v5;
        return [(FigCaptureFrameCounter *)v5 start];
      }
    }
  }
  return result;
}

- (uint64_t)_setStreamOutputsEnabled:(int)a3 streamingOutputs:(int)a4 onDemandStillOutputs:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = a1;
  long long v47 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v43 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v4 + 312), "secureMetadataOutputConfiguration"), "copy");
  uint64_t v5 = 0;
  objc_super v6 = 0;
  uint64_t v7 = *MEMORY[0x1E4F55400];
  uint64_t v44 = *MEMORY[0x1E4F53B10];
  uint64_t v42 = *MEMORY[0x1E4F53B00];
  uint64_t v8 = *MEMORY[0x1E4F53B40];
  uint64_t v52 = *MEMORY[0x1E4F53B50];
  uint64_t v51 = *MEMORY[0x1E4F53B48];
  uint64_t v50 = *MEMORY[0x1E4F53B88];
  uint64_t v40 = *MEMORY[0x1E4F53AE0];
  uint64_t v39 = *MEMORY[0x1E4F53AF0];
  uint64_t v9 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  unint64_t v10 = 0x1E4F28000uLL;
  long long v11 = (void *)MEMORY[0x1E4F53AB0];
  uint64_t v41 = *MEMORY[0x1E4F55400];
  do
  {
    uint64_t v12 = v4 + v9[444];
    if (!*(unsigned char *)(v12 + (v5 << 9) + 9)) {
      goto LABEL_50;
    }
    int v13 = *(_DWORD *)(v12 + (v5 << 9));
    if (v13 == 2)
    {
      if (!a4) {
        goto LABEL_50;
      }
    }
    else if (v13 == 1)
    {
      if (!a3) {
        goto LABEL_50;
      }
      *(unsigned char *)(v4 + 11041) = a2;
    }
    CMTime v14 = (void *)mscsn_streamOutputIDForOutputIndex(v5);
    if (![v14 isEqualToString:v7])
    {
      uint64_t v18 = *(void *)(v4 + v9[444] + (v5 << 9) + 16);
      if (v18 == *(void *)(v4 + 200))
      {
        if ([*(id *)(v4 + 312) preLTMThumbnailOnPreviewOutputEnabled])
        {
LABEL_19:
          if (!v6) {
            objc_super v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 3792), "numberWithBool:", a2), v44);
LABEL_22:
          uint64_t v19 = *(void *)(v4 + v9[444] + (v5 << 9) + 16);
          if (v19 == *(void *)(v4 + 200))
          {
            if ([*(id *)(v4 + 312) postColorProcessingThumbnailOnPreviewOutputEnabled]) {
              goto LABEL_27;
            }
            uint64_t v19 = *(void *)(v4 + v9[444] + (v5 << 9) + 16);
          }
          if (v19 != *(void *)(v4 + 208)
            || ![*(id *)(v4 + 312) postColorProcessingThumbnailOnVideoCaptureOutputEnabled])
          {
LABEL_30:
            objc_msgSend(v47, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 3792), "numberWithBool:", a2), v14);
            goto LABEL_50;
          }
LABEL_27:
          if (!v6) {
            objc_super v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 3792), "numberWithBool:", a2), v42);
          goto LABEL_30;
        }
        uint64_t v18 = *(void *)(v4 + v9[444] + (v5 << 9) + 16);
      }
      if (v18 != *(void *)(v4 + 208)
        || ![*(id *)(v4 + 312) preLTMThumbnailOnVideoCaptureOutputEnabled])
      {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    uint64_t v48 = v5;
    if (!v6) {
      objc_super v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    }
    switch((int)v5)
    {
      case 9:
        uint64_t v15 = [*(id *)(v10 + 3792) numberWithBool:a2];
        unsigned int v16 = v6;
        uint64_t v17 = v39;
        goto LABEL_49;
      case 10:
        uint64_t v15 = [*(id *)(v10 + 3792) numberWithBool:a2];
        unsigned int v16 = v6;
        uint64_t v17 = v40;
        goto LABEL_49;
      case 11:
        unint64_t v20 = v10;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v21 = (void *)[*(id *)(v4 + 312) enabledSemanticMaskTypes];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v38 = v4;
          uint64_t v24 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v54 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              char v27 = objc_msgSend(v26, "isEqualToString:", v8, v38);
              uint64_t v28 = v11;
              if ((v27 & 1) == 0)
              {
                char v29 = [v26 isEqualToString:v52];
                uint64_t v28 = (void *)MEMORY[0x1E4F53AD0];
                if ((v29 & 1) == 0)
                {
                  char v30 = [v26 isEqualToString:v51];
                  uint64_t v28 = (void *)MEMORY[0x1E4F53AC0];
                  if ((v30 & 1) == 0)
                  {
                    int v31 = [v26 isEqualToString:v50];
                    uint64_t v28 = (void *)MEMORY[0x1E4F53B38];
                    if (!v31) {
                      continue;
                    }
                  }
                }
              }
              if (*v28) {
                objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v20 + 3792), "numberWithBool:", a2), *v28);
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v61 count:16];
          }
          while (v23);
          uint64_t v4 = v38;
          uint64_t v7 = v41;
          unint64_t v10 = v20;
          uint64_t v5 = v48;
          uint64_t v9 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
        }
        else
        {
          uint64_t v5 = v48;
        }
        break;
      case 12:
        [v43 setObjectDetectionEnabled:a2];
        break;
      case 13:
        [v43 setEyeReliefStatusDetectionEnabled:a2];
        break;
      case 18:
        uint64_t v15 = [*(id *)(v10 + 3792) numberWithBool:a2];
        unsigned int v16 = v6;
        uint64_t v17 = v44;
LABEL_49:
        [v16 setObject:v15 forKeyedSubscript:v17];
        break;
      default:
        break;
    }
LABEL_50:
    ++v5;
  }
  while (v5 != 20);
  if (!v43)
  {
    if (![v6 count]) {
      goto LABEL_61;
    }
    goto LABEL_58;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(v4 + 104), "secureMetadataOutputConfigurator"), "setConfigurationForPrimaryClient:", v43);
  uint64_t v7 = v41;
  objc_msgSend((id)objc_msgSend(*(id *)(v4 + 104), "secureMetadataOutputConfigurator"), "setDelegate:", v4);
  if ([v6 count])
  {
LABEL_58:
    if (a2)
    {
      long long v32 = *(void **)(v4 + 112);
      uint64_t v33 = *MEMORY[0x1E4F54CB8];
      uint64_t v59 = v41;
      long long v60 = v6;
      uint64_t v7 = v41;
      objc_msgSend(v32, "setProperty:value:", v33, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    }
    goto LABEL_60;
  }
  if (([v43 isEmpty] & 1) == 0)
  {
LABEL_60:
    objc_msgSend(v47, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 3792), "numberWithBool:", a2), v7);
    *(unsigned char *)(v4 + 10880) = a2;
  }
LABEL_61:
  uint64_t v34 = [*(id *)(v4 + 112) setProperty:*MEMORY[0x1E4F54CD8] value:v47];
  if (v6 && (a2 & 1) == 0)
  {
    long long v35 = *(void **)(v4 + 112);
    uint64_t v36 = *MEMORY[0x1E4F54CB8];
    uint64_t v57 = v7;
    uint64_t v58 = v6;
    objc_msgSend(v35, "setProperty:value:", v36, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  }
  return v34;
}

- (int)allocateOrReuseBufferPoolsFromSourceNode:(id)a3
{
  uint64_t v3 = self;
  v171[1] = *MEMORY[0x1E4F143B8];
  -[BWMultiStreamCameraSourceNode _markPrimaryStreamingOutput]((uint64_t)self);
  int v153 = -[BWMultiStreamCameraSourceNode _bringStreamUpToDate]((uint64_t)v3);
  if (v153) {
    goto LABEL_119;
  }
  double v130 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = *MEMORY[0x1E4F54CB8];
  id v140 = [(BWFigCaptureStream *)v3->_stream getProperty:*MEMORY[0x1E4F54CB8] error:&v153];
  if (v153) {
    goto LABEL_119;
  }
  outputsStorage = v3->_outputsStorage;
  int v153 = [(BWMemoryPool *)[(BWNodeOutput *)v3->_outputsStorage[0].nodeOutput memoryPool] enableForCaptureStream:v3->_stream];
  if (v153) {
    goto LABEL_119;
  }
  uint64_t v117 = v4;
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration usesFirmwareStillImageOutput])
  {
    v3->_currentFirmwareStillImageOutputRetainedBufferCount = -[BWMultiStreamCameraSourceNode _firmwareStillImageOutputRetainedBufferCountForClientBracketCount:]((uint64_t)v3, 0);
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v137 = *MEMORY[0x1E4F55388];
  uint64_t v138 = *MEMORY[0x1E4F55340];
  uint64_t v139 = *MEMORY[0x1E4F55330];
  uint64_t v126 = *MEMORY[0x1E4F53AD8];
  uint64_t v120 = *MEMORY[0x1E4F53B58];
  uint64_t v125 = *MEMORY[0x1E4F53AE8];
  uint64_t v119 = *MEMORY[0x1E4F53B60];
  uint64_t v118 = *MEMORY[0x1E4F24D70];
  uint64_t v116 = *MEMORY[0x1E4F55390];
  uint64_t v123 = *MEMORY[0x1E4F53B08];
  uint64_t v124 = *MEMORY[0x1E4F55400];
  uint64_t v121 = *MEMORY[0x1E4F53AA0];
  uint64_t v122 = *MEMORY[0x1E4F53AF8];
  do
  {
    uint64_t v8 = &outputsStorage[v6];
    p_internalPixelBufferPool = &v8->internalPixelBufferPool;
    internalPixelBufferPool = v8->internalPixelBufferPool;
    if (internalPixelBufferPool)
    {

      *p_internalPixelBufferPool = 0;
    }
    uint64_t v129 = v6;
    if (v8->enabled)
    {
      long long v11 = (void *)mscsn_streamOutputIDForOutputIndex(v6);
      [(BWMultiStreamCameraSourceNode *)(uint64_t)v3 _computeRetainedBufferCountForOutputStorage:(uint64_t)&outputsStorage[v6]];
      int v141 = v11;
      switch((int)v6)
      {
        case 5:
          if (!v3->_isInfraredSourceNode) {
            break;
          }
          goto LABEL_18;
        case 6:
          break;
        case 7:
          v147 = v7;
          uint64_t v12 = &outputsStorage[v6];
          uint64_t retainedBufferCount = v12->retainedBufferCount;
          nodeOutput = v12->nodeOutput;
          int v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v140, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v138), "intValue");
          uint64_t v16 = [(BWNodeOutput *)nodeOutput pointCloudFormat];
          uint64_t v17 = [BWDataBufferPool alloc];
          uint64_t v19 = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:](v17, "initWithFormat:capacity:name:clientProvidesPool:", v16, retainedBufferCount + v15, [NSString stringWithFormat:@"%@_%@_BufferPool", BWPortTypeToDisplayString(v3->_portType, v18), v11], 0);
          if (!v19) {
            goto LABEL_119;
          }
          unint64_t v20 = v19;
          v12->bufferPoolOwnedByAnotherNode = 0;
          v12->streamRetainedBufferCount = v15;
          uint64_t v170 = v139;
          v171[0] = [(BWDataBufferPool *)v19 cvDataBufferPool];
          objc_msgSend(v130, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v171, &v170, 1), v11);
          if (nodeOutput) {
            [(BWNodeOutput *)nodeOutput setNodePreparedDataBufferPool:v20];
          }

          uint64_t v7 = v147;
          break;
        case 9:
          char v27 = &outputsStorage[v6];
          uint64_t v28 = v27->retainedBufferCount;
          char v29 = v27->nodeOutput;
          char v30 = objc_msgSend((id)objc_msgSend(v140, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v125);
          int v31 = objc_msgSend((id)objc_msgSend(v30, "objectForKeyedSubscript:", v138), "intValue");
          LODWORD(v30) = objc_msgSend((id)objc_msgSend(v30, "objectForKeyedSubscript:", v137), "intValue");
          long long v32 = [(BWNodeOutput *)v29 videoFormat];
          if (v30 != [(BWVideoFormat *)v32 pixelFormat]) {
            goto LABEL_119;
          }
          uint64_t v33 = [BWPixelBufferPool alloc];
          uint64_t v35 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v33, "initWithVideoFormat:capacity:name:memoryPool:", v32, v28 + v31, [NSString stringWithFormat:@"%@_%@_BufferPool", BWPortTypeToDisplayString(v3->_portType, v34), v119], -[BWNodeOutput memoryPool](v29, "memoryPool"));
          if (!v35) {
            goto LABEL_119;
          }
          uint64_t v36 = (void *)v35;
          long long v37 = &outputsStorage[v129];
          v37->streamRetainedBufferCount = v31;
          v37->bufferPoolOwnedByAnotherNode = 0;
          if (!v7)
          {
            uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            [v130 setObject:v7 forKeyedSubscript:v11];
          }
          uint64_t v168 = v139;
          uint64_t v169 = [v36 cvPixelBufferPool];
          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1), v125);
          [(BWNodeOutput *)v29 setNodePreparedPixelBufferPool:v36];

          break;
        case 10:
          uint64_t v38 = &outputsStorage[v6];
          int v39 = v38->retainedBufferCount;
          if ([(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration lightSourceMaskOutputEnabled])
          {
            int v39 = outputsStorage[9].retainedBufferCount;
          }
          uint64_t v40 = v38->nodeOutput;
          int v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v140, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v126), "objectForKeyedSubscript:", v138), "intValue");
          uint64_t v42 = [(BWNodeOutput *)v40 pointCloudFormat];
          id v43 = [BWDataBufferPool alloc];
          uint64_t v45 = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:](v43, "initWithFormat:capacity:name:clientProvidesPool:", v42, v41 + v39, [NSString stringWithFormat:@"%@_%@_BufferPool", BWPortTypeToDisplayString(v3->_portType, v44), v120], 0);
          if (!v45) {
            goto LABEL_119;
          }
          long long v46 = (void *)v45;
          long long v47 = &outputsStorage[v129];
          v47->streamRetainedBufferCount = v41;
          v47->bufferPoolOwnedByAnotherNode = 0;
          if (!v7)
          {
            uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            [v130 setObject:v7 forKeyedSubscript:v11];
          }
          uint64_t v166 = v139;
          uint64_t v167 = [v46 cvDataBufferPool];
          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1), v126);
          [(BWNodeOutput *)v40 setNodePreparedDataBufferPool:v46];

          break;
        case 11:
          uint64_t v48 = &outputsStorage[v6];
          uint64_t v135 = v48->retainedBufferCount;
          long long v49 = v48->nodeOutput;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          obuint64_t j = [(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration enabledSemanticMaskTypes];
          uint64_t v145 = [(NSSet *)obj countByEnumeratingWithState:&v149 objects:v165 count:16];
          if (!v145) {
            break;
          }
          p_streamRetainedBufferCount = &v48->streamRetainedBufferCount;
          uint64_t v134 = *(void *)v150;
          p_bufferPoolOwnedByAnotherNode = &v48->bufferPoolOwnedByAnotherNode;
          double v143 = v3;
          double v128 = outputsStorage;
          do
          {
            for (uint64_t i = 0; i != v145; ++i)
            {
              if (*(void *)v150 != v134) {
                objc_enumerationMutation(obj);
              }
              uint64_t v51 = *(void **)(*((void *)&v149 + 1) + 8 * i);
              uint64_t v52 = mscsn_semanticMaskOutputConfigurationKeyForSemanticMaskType(v51);
              if (!v52) {
                goto LABEL_119;
              }
              uint64_t v53 = v52;
              long long v54 = objc_msgSend((id)objc_msgSend(v140, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v52);
              int v55 = objc_msgSend((id)objc_msgSend(v54, "objectForKeyedSubscript:", v138), "intValue");
              int v56 = objc_msgSend((id)objc_msgSend(v54, "objectForKeyedSubscript:", v137), "intValue");
              id v57 = [(BWNodeOutput *)v49 mediaPropertiesForAttachedMediaKey:v51];
              uint64_t v58 = (void *)[v57 resolvedVideoFormat];
              if (v56 != [v58 pixelFormat]) {
                goto LABEL_119;
              }
              uint64_t v59 = [BWPixelBufferPool alloc];
              uint64_t v61 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v59, "initWithVideoFormat:capacity:name:memoryPool:", v58, v135 + v55, [NSString stringWithFormat:@"%@_%@_BufferPool", BWPortTypeToDisplayString(v143->_portType, v60), v51], -[BWNodeOutput memoryPool](v49, "memoryPool"));
              if (!v61) {
                goto LABEL_119;
              }
              uint64_t v62 = (void *)v61;
              int *p_streamRetainedBufferCount = v55;
              BOOL *p_bufferPoolOwnedByAnotherNode = 0;
              long long v11 = v141;
              if (!v7)
              {
                uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                [v130 setObject:v7 forKeyedSubscript:v141];
              }
              uint64_t v163 = v139;
              uint64_t v164 = [v62 cvPixelBufferPool];
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1), v53);
              [v57 setNodePreparedPixelBufferPool:v62];
            }
            uint64_t v3 = v143;
            outputsStorage = v128;
            uint64_t v145 = [(NSSet *)obj countByEnumeratingWithState:&v149 objects:v165 count:16];
          }
          while (v145);
          break;
        default:
          if ((v6 & 0x7FFFFFFE) == 0xC) {
            break;
          }
LABEL_18:
          uint64_t v21 = &outputsStorage[v6];
          unsigned int v142 = v21->retainedBufferCount;
          uint64_t v22 = v21->nodeOutput;
          uint64_t v23 = mscsn_metadataOutputKeyForOutputIndex(v6);
          uint64_t v24 = (void *)[v140 objectForKeyedSubscript:v11];
          uint64_t v146 = v23;
          if (v23) {
            uint64_t v24 = (void *)[v24 objectForKeyedSubscript:mscsn_metadataOutputConfigurationKeyForOutputIndex(v6)];
          }
          if (v8->type == 1)
          {
            int v25 = objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", v138), "intValue");
LABEL_22:
            double v144 = v22;
            if (!a3) {
              goto LABEL_63;
            }
            if (!v3->_shareStreamingBufferPools) {
              goto LABEL_26;
            }
            if (v22 == v3->_previewOutput)
            {
              uint64_t v26 = (void *)[a3 previewOutput];
            }
            else if (v22 == v3->_videoCaptureOutput)
            {
              uint64_t v26 = (void *)[a3 videoCaptureOutput];
            }
            else
            {
LABEL_26:
              if (v22 != v3->_stillImageOutput)
              {
                if (v3->_sharePreLTMThumbnailBufferPools && v22 == v3->_preLTMThumbnailOutput)
                {
                  uint64_t v26 = (void *)[a3 preLTMThumbnailOutput];
                  goto LABEL_61;
                }
LABEL_63:
                uint64_t v67 = [(BWNodeOutput *)v22 videoFormat];
                if (!v67)
                {
                  uint64_t v162 = -[BWMultiStreamCameraSourceNode _videoFormatRequirementsForOutputID:configuration:]((id *)&v3->super.super.super.isa, v11, v24);
                  uint64_t v67 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v162 count:1]);
                }
                float v136 = v24;
                v148 = v7;
                if (v22 == v3->_videoCaptureOutput)
                {
                  uint64_t v68 = v142;
                  if ([(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration videoStabilizationTypeISPMeshEnabled])
                  {
                    [(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration maxFrameRate];
                    if (v69 < 120.0) {
                      float v70 = 250.0;
                    }
                    else {
                      float v70 = 125.0;
                    }
                    [(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration maxFrameRate];
                    uint64_t v68 = v142 + llroundf((float)(v71 * v70) / 1000.0);
                  }
                }
                else
                {
                  uint64_t v68 = v142;
                }
                uint64_t v65 = v68;
                int v72 = v25;
                int v73 = v68 + v25;
                uint64_t v74 = [BWPixelBufferPool alloc];
                double v75 = NSString;
                uint64_t v77 = BWPortTypeToDisplayString(v3->_portType, v76);
                int v78 = (void *)v146;
                if (!v146) {
                  int v78 = v11;
                }
                uint64_t v79 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v74, "initWithVideoFormat:capacity:name:memoryPool:", v67, v73, [v75 stringWithFormat:@"%@_%@_BufferPool", v77, v78], -[BWNodeOutput memoryPool](v144, "memoryPool"));
                if (!v79) {
                  goto LABEL_119;
                }
                long long v64 = (BWPixelBufferPool *)v79;
                char v66 = 0;
                uint64_t v7 = v148;
                uint64_t v24 = v136;
                int v25 = v72;
LABEL_76:
                uint64_t v80 = &outputsStorage[v129];
                v80->streamRetainedBufferCount = v25;
                v80->bufferPoolOwnedByAnotherNode = v66;
                unsigned int v81 = objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", v137), "intValue");
                uint64_t v82 = (void *)[(__CFDictionary *)CVPixelBufferPoolGetPixelBufferAttributes([(BWPixelBufferPool *)v64 cvPixelBufferPool]) objectForKeyedSubscript:v118];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  unsigned int v83 = objc_msgSend((id)objc_msgSend(v82, "firstObject"), "intValue");
                }
                else {
                  unsigned int v83 = [v82 unsignedIntValue];
                }
                if (v81 != v83)
                {
                  long long v105 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v106 = *MEMORY[0x1E4F1C3B8];
                  uint64_t v107 = [NSString stringWithFormat:@"Internal inconsistency, output pixel format (%c%c%c%c) doesn't match the pixelBufferPool's pixel format (%c%c%c%c)", HIBYTE(v81), BYTE2(v81), BYTE1(v81), v81, HIBYTE(v83), BYTE2(v83), BYTE1(v83), v83];
LABEL_132:
                  objc_exception_throw((id)[v105 exceptionWithName:v106 reason:v107 userInfo:0]);
                }
                if (v146)
                {
                  int v84 = v144;
                  if (!v7)
                  {
                    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                    [v130 setObject:v7 forKeyedSubscript:v11];
                  }
                  uint64_t v160 = v139;
                  uint64_t v161 = [(BWPixelBufferPool *)v64 cvPixelBufferPool];
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1), mscsn_metadataOutputConfigurationKeyForOutputIndex(v129));
                  if (!v144)
                  {
LABEL_87:
                    *p_internalPixelBufferPool = v64;
                    goto LABEL_89;
                  }
                }
                else
                {
                  v158[0] = v139;
                  uint64_t v85 = [(BWPixelBufferPool *)v64 cvPixelBufferPool];
                  v158[1] = v116;
                  v159[0] = v85;
                  v159[1] = [NSNumber numberWithInt:v65];
                  objc_msgSend(v130, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v159, v158, 2), v11);
                  int v84 = v144;
                  if (!v144) {
                    goto LABEL_87;
                  }
                }
                if ([(BWNodeOutput *)v84 providesPixelBufferPool]) {
                  goto LABEL_87;
                }
                [(BWNodeOutput *)v84 setNodePreparedPixelBufferPool:v64];

LABEL_89:
                BOOL v86 = [(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration preLTMThumbnailOnPreviewOutputEnabled];
                BOOL v87 = v86;
                if (v84 == v3->_previewOutput && v86
                  || v84 == v3->_videoCaptureOutput
                  && [(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration preLTMThumbnailOnVideoCaptureOutputEnabled])
                {
                  float v88 = objc_msgSend((id)objc_msgSend(v140, "objectForKeyedSubscript:", v124), "objectForKeyedSubscript:", v123);
                  if (v87) {
                    uint64_t v89 = (void *)[a3 previewOutput];
                  }
                  else {
                    uint64_t v89 = (void *)[a3 videoCaptureOutput];
                  }
                  uint64_t v90 = -[BWMultiStreamCameraSourceNode _allocateOrReuseBufferPoolsFromSourceNodeOutput:forAttachedMedia:onNodeOutput:outputConfiguration:shareBufferPools:]((BWPixelBufferPool *)v3, v89, 0x1EFA68BE0, v84, v88, v3->_sharePreLTMThumbnailBufferPools);
                  if (!v90) {
                    goto LABEL_119;
                  }
                  long long v91 = v90;
                  if (!v7)
                  {
                    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                    [v130 setObject:v7 forKeyedSubscript:v124];
                  }
                  long long v92 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
                  if (v87) {
                    long long v92 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewStreamOutputID;
                  }
                  uint64_t v93 = *(uint64_t *)((char *)&v3->super.super.super.isa + *v92);
                  v156[0] = v139;
                  uint64_t v94 = [(BWPixelBufferPool *)v91 cvPixelBufferPool];
                  v156[1] = v121;
                  v157[0] = v94;
                  v157[1] = v93;
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v157, v156, 2), v123);
                }
                BOOL v95 = [(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration postColorProcessingThumbnailOnPreviewOutputEnabled];
                BOOL v96 = v95;
                if (v84 == v3->_previewOutput && v95
                  || v84 == v3->_videoCaptureOutput
                  && [(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration postColorProcessingThumbnailOnVideoCaptureOutputEnabled])
                {
                  long long v97 = objc_msgSend((id)objc_msgSend(v140, "objectForKeyedSubscript:", v124), "objectForKeyedSubscript:", v122);
                  if (v96) {
                    long long v98 = (void *)[a3 previewOutput];
                  }
                  else {
                    long long v98 = (void *)[a3 videoCaptureOutput];
                  }
                  long long v99 = -[BWMultiStreamCameraSourceNode _allocateOrReuseBufferPoolsFromSourceNodeOutput:forAttachedMedia:onNodeOutput:outputConfiguration:shareBufferPools:]((BWPixelBufferPool *)v3, v98, 0x1EFA74960, v84, v97, v3->_sharePostColorProcessingThumbnailBufferPools);
                  if (!v99) {
                    goto LABEL_119;
                  }
                  long long v100 = v99;
                  if (!v7)
                  {
                    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                    [v130 setObject:v7 forKeyedSubscript:v124];
                  }
                  long long v101 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__videoCaptureStreamOutputID;
                  if (v96) {
                    long long v101 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__previewStreamOutputID;
                  }
                  uint64_t v102 = *(uint64_t *)((char *)&v3->super.super.super.isa + *v101);
                  v154[0] = v139;
                  uint64_t v103 = [(BWPixelBufferPool *)v100 cvPixelBufferPool];
                  v154[1] = v121;
                  v155[0] = v103;
                  v155[1] = v102;
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v155, v154, 2), v122);
                }
                break;
              }
              uint64_t v26 = (void *)[a3 stillImageOutput];
            }
LABEL_61:
            long long v63 = (BWPixelBufferPool *)(id)[v26 preparedPixelBufferPool];
            if (!v63) {
              goto LABEL_63;
            }
            long long v64 = v63;
            uint64_t v65 = v142;
            [(BWPixelBufferPool *)v63 setCapacity:[(BWPixelBufferPool *)v63 capacity] + v25];
            char v66 = 1;
            goto LABEL_76;
          }
          int v25 = 0;
          if (v8->type != 2 || v22) {
            goto LABEL_22;
          }
          if (![(BWMultiStreamCameraSourceNodeConfiguration *)v3->_configuration forceFirmwareStillImageOutputEnabled])
          {
            long long v105 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v106 = *MEMORY[0x1E4F1C3B8];
            uint64_t v107 = [NSString stringWithFormat:@"Internal inconsistency, the stream's still image output is enabled but the node's stillImageOutput is not enabled.", v108, v109, v110, v111, v112, v113, v114, v115];
            goto LABEL_132;
          }
          break;
      }
    }
    uint64_t v6 = v129 + 1;
  }
  while (v129 != 19);
  int v153 = [(BWFigCaptureStream *)v3->_stream setProperty:v117 value:v130];
  if (v153) {
LABEL_119:
  }
    FigDebugAssert3();
  return v153;
}

- (uint64_t)_computeRetainedBufferCountForOutputStorage:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = *(void *)(a2 + 16);
    if (result)
    {
      if (*(_DWORD *)a2 == 2)
      {
        int v4 = *(_DWORD *)(v3 + 10804);
      }
      else if (*(_DWORD *)a2 == 1)
      {
        int v4 = [(id)result retainedBufferCount];
        uint64_t result = [*(id *)(v3 + 312) maxFrameRate];
        if (v5 > 120.0) {
          ++v4;
        }
        if ((*(unsigned char *)(a2 + 4) & 3) != 0)
        {
          if (v4 <= (int)[*(id *)(v3 + 104) timeMachineCapacity]) {
            int v4 = [*(id *)(v3 + 104) timeMachineCapacity];
          }
          uint64_t result = [*(id *)(v3 + 216) retainedBufferCount];
          v4 += result;
        }
      }
      else
      {
        int v4 = 0;
      }
    }
    else
    {
      int v4 = 1;
    }
    *(_DWORD *)(a2 + 88) = v4;
  }
  return result;
}

- (uint64_t)_markPrimaryStreamingOutput
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 10768);
    if (v2)
    {
      if (!*(void *)(result + 10736)) {
        goto LABEL_30;
      }
      int v3 = objc_msgSend((id)objc_msgSend(*(id *)(result + 208), "videoFormat"), "pixelFormat");
      [*(id *)(v1 + 312) maxFrameRate];
      float v5 = v4;
      int v6 = [*(id *)(v1 + 312) preferredPreviewMaxFrameRate];
      int CompressionType = FigCapturePixelFormatGetCompressionType(v3);
      if (!CompressionType) {
        goto LABEL_30;
      }
      if (CompressionType != 2 && v5 > (float)v6) {
        goto LABEL_30;
      }
    }
    uint64_t v2 = *(void **)(v1 + 10736);
    if (v2) {
      goto LABEL_30;
    }
    uint64_t result = [*(id *)(v1 + 312) depthOutputEnabled];
    if (result)
    {
      uint64_t v9 = (void **)MEMORY[0x1E4F553F0];
    }
    else
    {
      uint64_t result = [*(id *)(v1 + 312) pointCloudOutputEnabled];
      if (result)
      {
        uint64_t v9 = (void **)MEMORY[0x1E4F55408];
      }
      else
      {
        uint64_t result = [*(id *)(v1 + 312) secureMetadataOutputConfiguration];
        if (!result) {
          return result;
        }
        uint64_t v9 = (void **)MEMORY[0x1E4F55400];
      }
    }
    uint64_t v2 = *v9;
    if (*v9)
    {
LABEL_30:
      if ([v2 isEqualToString:*MEMORY[0x1E4F55400]])
      {
        uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 312), "secureMetadataOutputConfiguration"), "objectDetectionEnabled");
        if (result)
        {
          uint64_t v10 = 6144;
        }
        else
        {
          uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 312), "secureMetadataOutputConfiguration"), "eyeReliefStatusDetectionEnabled");
          if (!result) {
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"Metadata output is enabled, but no secure metadata features are enabled.", 0 reason userInfo]);
          }
          uint64_t v10 = 6656;
        }
        uint64_t v11 = v1 + v10 + 384;
      }
      else
      {
        uint64_t result = mscsn_streamOutputIndexForOutputID(v2);
        uint64_t v11 = v1 + 384 + ((uint64_t)(int)result << 9);
      }
      *(_DWORD *)(v11 + 4) |= 4u;
    }
  }
  return result;
}

- (BWNodeOutput)detectedObjectsOutput
{
  return self->_detectedObjectsOutput;
}

- (BWNodeOutput)stillImageSensorRawOutput
{
  return self->_stillImageSensorRawOutput;
}

- (BWNodeOutput)pointCloudOutput
{
  return self->_pointCloudOutput;
}

- (float)geometricDistortionCorrectionStrengthOnStreamingOutputs
{
  return self->_geometricDistortionCorrectionStrengthOnStreamingOutputs;
}

- (uint64_t)_updateBaseZoomFactorAfterGDCFromOutputConfigurations:(uint64_t)result
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    unsigned int v40 = 0;
    float v4 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
    if ([*(id *)(result + 312) geometricDistortionCorrectionSupported])
    {
      if (!a2)
      {
        FigDebugAssert3();
        int v25 = 0;
        unsigned int v40 = FigSignalErrorAt();
        goto LABEL_41;
      }
      float v5 = (void *)*MEMORY[0x1E4F55410];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v6 = [a2 countByEnumeratingWithState:&v36 objects:v44 count:16];
      uint64_t v8 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
      uint64_t v34 = v5;
      if (!v6)
      {
        int v25 = 0;
        float v19 = 0.0;
        goto LABEL_27;
      }
      uint64_t v9 = v6;
      uint64_t v10 = *(void *)v37;
      uint64_t v11 = *MEMORY[0x1E4F554A8];
      uint64_t v12 = *MEMORY[0x1E4F55368];
      float v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(a2);
          }
          int v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v16 = (void *)[a2 objectForKeyedSubscript:v15];
          int v17 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v11), "BOOLValue");
          float v18 = 0.0;
          if (v17) {
            objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v12, 0.0), "floatValue");
          }
          if (v18 > v13)
          {
            float v13 = v18;
            float v5 = v15;
          }
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v9);
      float v19 = 0.0;
      if (v13 == 0.0)
      {
        int v25 = 0;
        float v4 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
        uint64_t v8 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
        goto LABEL_27;
      }
      uint64_t v20 = *MEMORY[0x1E4F55370];
      v43[0] = *MEMORY[0x1E4F553C0];
      v43[1] = v20;
      v43[2] = *MEMORY[0x1E4F55350];
      v43[3] = v11;
      uint64_t v21 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
      uint64_t v22 = (void *)[a2 objectForKeyedSubscript:v5];
      uint64_t v23 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      BWAddEntriesWithKeysFromDictionaryToDictionary(v22, v21, v23);
      int v41 = v5;
      uint64_t v42 = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      unsigned int v40 = [*(id *)(v3 + 112) setProperty:*MEMORY[0x1E4F54CB8] value:v24];
      if (!v40)
      {
        uint64_t v8 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
        if ([*(id *)(v3 + 104) hasFocus])
        {
          int v25 = 0;
        }
        else
        {
          int v25 = (void *)[*(id *)(v3 + 112) copyProperty:*MEMORY[0x1E4F54CC0] error:&v40];
          if (v40) {
            goto LABEL_41;
          }
          v35.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB20];
          v35.CGSize size = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
          FigCFDictionaryGetCGRectIfPresent();
          if (CGRectIsNull(v35)) {
            goto LABEL_41;
          }
          objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", v20), "floatValue");
          double v7 = v26 / v35.size.height;
          if (v7 <= 1.0) {
            double v7 = 1.0;
          }
          float v19 = v7;
        }
        float v4 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
LABEL_27:
        if (*(void *)(v3 + 10768)
          && objc_msgSend((id)objc_msgSend(*(id *)(v3 + v4[459]), "videoStabilizationMethods"), "count")
          && ([*(id *)(v3 + v4[459]) livePhotoCaptureEnabled] & 1) == 0)
        {
          char v27 = *(void **)(v3 + 10768);
          if ([v27 isEqualToString:*MEMORY[0x1E4F55420]]
            && -[BWMultiStreamCameraSourceNode _scalerChainingEnabled](v3))
          {
            char v27 = v34;
          }
          uint64_t v28 = (void *)[a2 objectForKeyedSubscript:v27];
          objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E4F55368]), "floatValue");
          if (*(float *)&v7 < 1.0)
          {
            [*(id *)(v3 + v4[459]) visOverscan];
            double v29 = 1.0;
            double v7 = 1.2 / (v30 + 1.0);
            if (v7 >= 1.0)
            {
              [*(id *)(v3 + v4[459]) visOverscan];
              double v7 = v31 + 1.0;
              double v29 = 1.2 / v7;
            }
            if (v29 >= v19)
            {
              [*(id *)(v3 + v4[459]) visOverscan];
              double v7 = 1.2 / (v32 + 1.0);
              float v19 = 1.0;
              if (v7 < 1.0) {
                goto LABEL_40;
              }
              [*(id *)(v3 + v4[459]) visOverscan];
              double v7 = 1.2 / (v33 + 1.0);
              float v19 = v7;
            }
          }
        }
        if (v19 == 0.0)
        {
LABEL_41:

          return v40;
        }
LABEL_40:
        *(float *)&double v7 = v19;
        [*(id *)(v3 + v8[412]) setBaseZoomFactorAfterGDC:v7];
        goto LABEL_41;
      }
    }
    int v25 = 0;
    goto LABEL_41;
  }
  return result;
}

- (uint64_t)_updateActiveNondisruptiveSwitchingFormatIndices
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(*(id *)(a1 + 312), "activeStreamingNondisruptiveSwitchingFormatIndices"));
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 312), "fastSwitchingNondisruptiveFormatIndices"));
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v2];
  objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 312), "activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices"));
  if (![v3 count]) {
    return 0;
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F547A0], objc_msgSend(v3, "allObjects"));
  if (v4)
  {
    uint64_t v5 = v4;
    goto LABEL_8;
  }
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 112), "setPropertyIfSupported:value:", *MEMORY[0x1E4F54798], objc_msgSend(v2, "allObjects"));
  if (v5) {
LABEL_8:
  }
    FigDebugAssert3();
  return v5;
}

- (id)colorInfoForOutput:(id)a3
{
  if (self->_videoCaptureOutput == a3)
  {
    if (![(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration videoCaptureOutputEnabled])goto LABEL_12; {
    uint64_t v5 = 10784;
    }
  }
  else
  {
    if (self->_previewOutput != a3)
    {
      if (self->_stillImageOutput != a3) {
        return 0;
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputEnabled])
      {
        uint64_t v5 = 10848;
        return *(Class *)((char *)&self->super.super.super.isa + v5);
      }
LABEL_12:
      FigDebugAssert3();
      return 0;
    }
    if (![(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration previewOutputEnabled])goto LABEL_12; {
    uint64_t v5 = 10760;
    }
  }
  return *(Class *)((char *)&self->super.super.super.isa + v5);
}

- (void)setDetectedFacesFilterDelegate:(id)a3
{
  self->_detectedFacesFilterDelegate = (BWDetectedFacesFilterDelegate *)a3;
}

- (int)colorSpaceProperties
{
  return self->_colorSpaceProperties;
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
  stream = self->_stream;
  if (stream) {
    CFRelease(stream);
  }

  p_internalPixelBufferPool = &self->_outputsStorage[0].internalPixelBufferPool;
  uint64_t v5 = 0x1FFFFFFFFFFFFB00;
  do
  {

    uint64_t v6 = p_internalPixelBufferPool[v5 + 1271];
    if (v6) {
      CFRelease(v6);
    }
    double v7 = p_internalPixelBufferPool[v5 + 1274];
    if (v7) {
      CFRelease(v7);
    }

    v5 += 64;
  }
  while (v5 * 8);

  p_pixelFormatint IsTenBit = &self->_outputsStorage[0].pixelFormatIsTenBit;
  uint64_t v9 = 20;
  do
  {
    *(_WORD *)(p_pixelFormatIsTenBit - 1) = 0;
    p_pixelFormatIsTenBit += 512;
    --v9;
  }
  while (v9);
  dispatch_sync((dispatch_queue_t)self->_preAllocationQueue, &__block_literal_global_86);

  stillReflectionTransferSession = self->_stillReflectionTransferSession;
  if (stillReflectionTransferSession) {
    CFRelease(stillReflectionTransferSession);
  }
  stillReflectionFormatDescription = self->_stillReflectionFormatDescription;
  if (stillReflectionFormatDescription) {
    CFRelease(stillReflectionFormatDescription);
  }
  stillReflectionSecondaryTransferSession = self->_stillReflectionSecondaryTransferSession;
  if (stillReflectionSecondaryTransferSession) {
    CFRelease(stillReflectionSecondaryTransferSession);
  }
  stillReflectionSecondaryFormatDescription = self->_stillReflectionSecondaryFormatDescription;
  if (stillReflectionSecondaryFormatDescription) {
    CFRelease(stillReflectionSecondaryFormatDescription);
  }
  depthOutputFormatDescription = self->_depthOutputFormatDescription;
  if (depthOutputFormatDescription) {
    CFRelease(depthOutputFormatDescription);
  }
  focusPixelDataFormatDescription = self->_focusPixelDataFormatDescription;
  if (focusPixelDataFormatDescription) {
    CFRelease(focusPixelDataFormatDescription);
  }

  visionDataFormatDescription = self->_visionDataFormatDescription;
  if (visionDataFormatDescription) {
    CFRelease(visionDataFormatDescription);
  }
  hdrMetadataSession = self->_hdrMetadataSession;
  if (hdrMetadataSession) {
    CFRelease(hdrMetadataSession);
  }

  streamConfigurationQueue = self->_streamConfigurationQueue;
  if (streamConfigurationQueue)
  {
    dispatch_sync(streamConfigurationQueue, &__block_literal_global_891);
  }
  v19.receiver = self;
  v19.super_class = (Class)BWMultiStreamCameraSourceNode;
  [(BWNode *)&v19 dealloc];
}

- (int)prepareForStillImageCaptureWithFirmwareStillImageOutputRetainedBufferCountOverride:(int)a3 clientBracketCount:(int)a4 enableSushiRawAttachmentOption:(BOOL)a5
{
  BOOL v5 = a5;
  v21[1] = *MEMORY[0x1E4F143B8];
  if (![(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputEnabled]|| ![(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration usesFirmwareStillImageOutput])
  {
    if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputEnabled])
    {
      [(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration usesFirmwareStillImageOutput];
    }
    return 0;
  }
  self->_firmwareStillImageOutputRetainedBufferCountOverride = a3;
  uint64_t v9 = -[BWMultiStreamCameraSourceNode _firmwareStillImageOutputRetainedBufferCountForClientBracketCount:]((uint64_t)self, a4);
  int currentFirmwareStillImageOutputRetainedBufferCount = self->_currentFirmwareStillImageOutputRetainedBufferCount;
  BOOL stillImageOutputSushiRawAttachmentOptionEnabled = self->_stillImageOutputSushiRawAttachmentOptionEnabled;
  if (v9 == currentFirmwareStillImageOutputRetainedBufferCount
    && stillImageOutputSushiRawAttachmentOptionEnabled == v5)
  {
    return 0;
  }
  uint64_t v13 = v9;
  if (![(BWFigVideoCaptureStream *)self->_captureStream started]) {
    return 0;
  }
  CMTime v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (v13 != currentFirmwareStillImageOutputRetainedBufferCount)
  {
    uint64_t v15 = [NSNumber numberWithInt:v13];
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F55390]];
  }
  if (stillImageOutputSushiRawAttachmentOptionEnabled != v5)
  {
    if (v5
      && ![(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputSushiRawAttachmentOptionSupportEnabled])
    {
      return -12780;
    }
    uint64_t v16 = [NSNumber numberWithBool:v5];
    [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F55088]];
  }
  stillImageStreamOutputID = self->_stillImageStreamOutputID;
  v21[0] = v14;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&stillImageStreamOutputID count:1];
  int v18 = [(BWFigCaptureStream *)self->_stream setProperty:*MEMORY[0x1E4F54CB8] value:v17];
  if (v18)
  {
    FigDebugAssert3();
  }
  else
  {
    self->_int currentFirmwareStillImageOutputRetainedBufferCount = v13;
    self->_BOOL stillImageOutputSushiRawAttachmentOptionEnabled = v5;
  }
  return v18;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForPreLTMThumbnailOutput
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v9 = 0;
  uint64_t v2 = (void *)[*(id *)(a1 + 112) getProperty:*MEMORY[0x1E4F54CB8] error:&v9];
  if (v9
    || (uint64_t v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F55400]],
        (uint64_t v4 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F53B08]]) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  BOOL v5 = v4;
  uint64_t v6 = (_DWORD *)(a1 + 384);
  v6[2331] = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55338]), "intValue");
  v6[2332] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55348]), "intValue");
  v6[2336] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue");
  v6[2337] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue");
  v6[2327] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55340]), "intValue");
  double v7 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v7 setWidth:(int)v6[2336]];
  [(BWVideoFormatRequirements *)v7 setHeight:(int)v6[2337]];
  [(BWVideoFormatRequirements *)v7 setBytesPerRowAlignment:(int)v6[2331]];
  [(BWVideoFormatRequirements *)v7 setPlaneAlignment:(int)v6[2332]];
  [(BWVideoFormatRequirements *)v7 setHeightAlignment:1];
  v10[0] = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F55388]];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1]);
  return v7;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForPostColorProcessingThumbnailOutput
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v7 = 0;
  uint64_t v1 = (void *)[*(id *)(a1 + 112) getProperty:*MEMORY[0x1E4F54CB8] error:&v7];
  if (v7
    || (uint64_t v2 = (void *)[v1 objectForKeyedSubscript:*MEMORY[0x1E4F55400]],
        (uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F53AF8]]) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  uint64_t v4 = (void *)v3;
  BOOL v5 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v5, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue"));
  -[BWVideoFormatRequirements setHeight:](v5, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue"));
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v5, "setBytesPerRowAlignment:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55338]), "intValue"));
  -[BWVideoFormatRequirements setPlaneAlignment:](v5, "setPlaneAlignment:", (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55348]), "intValue"));
  [(BWVideoFormatRequirements *)v5 setHeightAlignment:1];
  v8[0] = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F55388]];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
  return v5;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForLightSourceMaskOutput
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v9 = 0;
  uint64_t v2 = (void *)[*(id *)(a1 + 112) getProperty:*MEMORY[0x1E4F54CB8] error:&v9];
  if (v9
    || (uint64_t v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F55400]],
        (uint64_t v4 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F53AE8]]) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  BOOL v5 = v4;
  uint64_t v6 = (_DWORD *)(a1 + 384);
  v6[1179] = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55338]), "intValue");
  v6[1180] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55348]), "intValue");
  v6[1184] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue");
  v6[1185] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue");
  v6[1175] = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55340]), "intValue");
  int v7 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v7 setWidth:(int)v6[1184]];
  [(BWVideoFormatRequirements *)v7 setHeight:(int)v6[1185]];
  [(BWVideoFormatRequirements *)v7 setBytesPerRowAlignment:(int)v6[1179]];
  [(BWVideoFormatRequirements *)v7 setPlaneAlignment:(int)v6[1180]];
  [(BWVideoFormatRequirements *)v7 setHeightAlignment:1];
  v10[0] = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F55388]];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1]);
  return v7;
}

- (BWPointCloudFormatRequirements)_videoFormatRequirementsForKeypointDescriptorDataOutput
{
  if (!a1) {
    return 0;
  }
  int v8 = 0;
  uint64_t v2 = (void *)[*(id *)(a1 + 112) getProperty:*MEMORY[0x1E4F54CB8] error:&v8];
  if (v8
    || (uint64_t v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F55400]],
        (uint64_t v4 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F53AD8]]) == 0))
  {
    FigDebugAssert3();
    return 0;
  }
  BOOL v5 = v4;
  *(_DWORD *)(a1 + 5596) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55340]), "intValue");
  uint64_t v6 = objc_alloc_init(BWPointCloudFormatRequirements);
  -[BWPointCloudFormatRequirements setDataBufferSize:](v6, "setDataBufferSize:", (int)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55358]), "intValue"));
  [(BWPointCloudFormatRequirements *)v6 setSupportedDataFormats:&unk_1EFB03EA8];
  return v6;
}

- (BWVideoFormatRequirements)_videoFormatRequirementsForSemanticMaskType:(uint64_t)a1
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v10 = 0;
  uint64_t v3 = [*(id *)(a1 + 112) getProperty:*MEMORY[0x1E4F54CB8] error:&v10];
  if (v10
    || (uint64_t v4 = (void *)v3, (v5 = mscsn_semanticMaskOutputConfigurationKeyForSemanticMaskType(a2)) == 0)
    || (uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F55400]), "objectForKeyedSubscript:", v5)) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  int v7 = (void *)v6;
  int v8 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue"));
  -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue"));
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v8, "setBytesPerRowAlignment:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F55338]), "intValue"));
  -[BWVideoFormatRequirements setPlaneAlignment:](v8, "setPlaneAlignment:", (int)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F55348]), "intValue"));
  [(BWVideoFormatRequirements *)v8 setHeightAlignment:1];
  v11[0] = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F55388]];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
  return v8;
}

- (id)colorInfoForNonColorManagedDevicesForOutputID:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = -[BWMultiStreamCameraSourceNode videoCaptureDimensionsForColorspace]((uint64_t)result);
    if (([a2 isEqualToString:*MEMORY[0x1E4F55428]] & 1) != 0
      || [a2 isEqualToString:*MEMORY[0x1E4F55430]])
    {
      return (id *)+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:1];
    }
    else
    {
      uint64_t v5 = [v3[39] colorSpace];
      uint64_t v6 = [v3[39] clientVideoFormat];
      uint64_t v7 = [v3[39] clientVideoFormat];
      return (id *)+[BWVideoFormat colorInfoWithSourceColorSpace:v5 sourcePixelFormat:v6 sourceDimensions:v4 requestedPixelFormat:v7];
    }
  }
  return result;
}

- (void)_stopAndReleaseFrameCounterForOutputIndexIfNecessary:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = a1 + 384 + ((uint64_t)a2 << 9);
    [*(id *)(v2 + 80) stop];

    *(void *)(v2 + 80) = 0;
  }
}

__n128 __39__BWMultiStreamCameraSourceNode_start___block_invoke(void *a1, opaqueCMSampleBuffer *a2)
{
  uint64_t v4 = a1[6];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 10888), "transferFacesToSampleBuffer:totalSensorCropRect:", a2, *(double *)(*(void *)(v4 + 8) + 32), *(double *)(*(void *)(v4 + 8) + 40), *(double *)(*(void *)(v4 + 8) + 48), *(double *)(*(void *)(v4 + 8) + 56));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 10896), "transferObjectsToSampleBuffer:totalSensorCropRect:", a2, *(double *)(*(void *)(a1[6] + 8) + 32), *(double *)(*(void *)(a1[6] + 8) + 40), *(double *)(*(void *)(a1[6] + 8) + 48), *(double *)(*(void *)(a1[6] + 8) + 56));
  uint64_t v5 = a1[4];
  if (*(_DWORD *)(v5 + 2104) && !*(unsigned char *)(v5 + 2414)) {
    -[BWMultiStreamCameraSourceNode _tallyCompressedIOSurfaceStatsForSBuf:outputStorage:](v5, a2, v5 + 1920);
  }
  [*(id *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 216) emitSampleBuffer:a2];
  uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 40) + 384;
  CMSampleBufferGetPresentationTimeStamp(&v8, a2);
  __n128 result = *(__n128 *)&v8.value;
  *(void *)(v6 + 1608) = v8.epoch;
  *(__n128 *)(v6 + 1592) = result;
  return result;
}

- (void)_tallyCompressedIOSurfaceStatsForSBuf:(uint64_t)a3 outputStorage:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(_DWORD *)(a3 + 184) == 4 && *(unsigned char *)(a3 + 493))
    {
      memset(&v13, 0, sizeof(v13));
      CMSampleBufferGetPresentationTimeStamp(&v13, sbuf);
      uint64_t v5 = (_OWORD *)(a3 + 468);
      if ((*(_DWORD *)(a3 + 480) & 0x1D) == 1)
      {
        *(CMTime *)CMTime time = v13;
        double Seconds = CMTimeGetSeconds((CMTime *)time);
        *(_OWORD *)CMTime time = *v5;
        *(void *)&time[16] = *(void *)(a3 + 484);
        if (Seconds - CMTimeGetSeconds((CMTime *)time) > 1.0)
        {
          *uint64_t v5 = *(_OWORD *)&v13.value;
          *(void *)(a3 + 484) = v13.epoch;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          memset(v14, 0, sizeof(v14));
          memset(time, 0, sizeof(time));
          if (!BWSampleBufferComputeIOSurfaceCompressionHistogram(sbuf))
          {
            unint64_t v7 = 0;
            ++*(_DWORD *)(a3 + 464);
            do
            {
              CMTime v8 = (int64x2_t *)(a3 + v7);
              int64x2_t v9 = (int64x2_t)v14[v7 / 0x10];
              v8[13] = vaddq_s64(*(int64x2_t *)(a3 + v7 + 208), *(int64x2_t *)&time[v7]);
              v8[21] = vaddq_s64(*(int64x2_t *)(a3 + v7 + 336), v9);
              v7 += 16;
            }
            while (v7 != 128);
          }
        }
      }
      else
      {
        *uint64_t v5 = *(_OWORD *)&v13.value;
        *(void *)(a3 + 484) = v13.epoch;
      }
    }
    else if (*(void *)(a3 + 176))
    {
      *(void *)CMTime time = 0;
      *(void *)&v14[0] = 0;
      float v10 = BWSampleBufferComputeIOSurfaceCompressionRatio(sbuf, (unint64_t *)time, (unint64_t *)v14);
      if (v10 > 0.0 && v10 <= 1.0)
      {
        [*(id *)(a3 + 176) addDataPoint:v10];
        uint64_t v12 = *(void *)(a3 + 200) + *(void *)&v14[0];
        *(void *)(a3 + 192) += *(void *)time;
        *(void *)(a3 + 200) = v12;
      }
    }
  }
}

- (BOOL)stop:(id *)a3
{
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration deferStreamingOutputsEnable])
  {
    [(BWFigVideoCaptureDevice *)self->_captureDevice setZoomFactorChangedDelegate:0 forPortType:self->_portType];
  }
  if (!self->_emitsFramesWhileStopping) {
    -[BWMultiStreamCameraSourceNode _markEndOfLiveOnAllOutputs]((uint64_t)self);
  }
  self->_stopStreamConfigurationUpdates = 1;
  streamConfigurationQueue = self->_streamConfigurationQueue;
  if (streamConfigurationQueue) {
    dispatch_sync(streamConfigurationQueue, &__block_literal_global_934);
  }
  LODWORD(v5) = 2.0;
  if (!self->_emitsFramesWhileStopping) {
    *(float *)&double v5 = 0.0;
  }
  -[BWFigCaptureStream setPropertyIfSupported:value:](self->_stream, "setPropertyIfSupported:value:", *MEMORY[0x1E4F54818], [NSNumber numberWithFloat:v5]);
  [(BWFigVideoCaptureStream *)self->_captureStream sourceNodeWillStopStreaming];
  if ([(BWFigCaptureStream *)[(BWFigVideoCaptureStream *)self->_captureStream stream] streaming]
    && ![(BWFigVideoCaptureStream *)self->_captureStream suspended])
  {
    if (self->_keepISPStreamingWhenStopping) {
      int v8 = -[BWMultiStreamCameraSourceNode _setStreamOutputsEnabled:streamingOutputs:onDemandStillOutputs:]((uint64_t)self, 0, self->_streamingOutputsEnabled, 1);
    }
    else {
      int v8 = [(BWFigVideoCaptureStream *)self->_captureStream stop];
    }
    int v7 = v8;
  }
  else
  {
    int v7 = 0;
  }
  -[BWMultiStreamCameraSourceNode _flushOutRemainingBuffers]((uint64_t)self);
  if (self->_emitsFramesWhileStopping) {
    -[BWMultiStreamCameraSourceNode _markEndOfLiveOnAllOutputs]((uint64_t)self);
  }
  outputsStorage = self->_outputsStorage;
  uint64_t v10 = 393;
  uint64_t v11 = 20;
  do
  {
    *((unsigned char *)&self->super.super.super.isa + v10) = 0;
    v10 += 512;
    --v11;
  }
  while (v11);
  [(BWFigVideoCaptureStream *)self->_captureStream sourceNodeDidStopStreaming:self->_keepISPStreamingWhenStopping];
  -[BWMultiStreamCameraSourceNode _unregisterStreamOutputHandlers]((uint64_t)self);
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration stillImageOutputEnabled]&& ![(BWMultiStreamCameraSourceNodeConfiguration *)self->_configuration usesFirmwareStillImageOutput])
  {
    [(BWFigVideoCaptureStream *)self->_captureStream setStillImageBufferTimeMachineHandler:0];
  }
  -[BWMultiStreamCameraSourceNode _unregisterFromStreamNotifications]((uint64_t)self);
  uint64_t v12 = 20;
  do
  {
    if (outputsStorage->pixelBufferCompressionType) {
      [(BWMultiStreamCameraSourceNode *)(uint64_t)self _reportIOSurfaceCompressionCoreAnalyticsData:(uint64_t)outputsStorage];
    }
    ioSurfaceCompressionRatioStats = outputsStorage->ioSurfaceCompressionRatioStats;
    if (ioSurfaceCompressionRatioStats)
    {

      outputsStorage->ioSurfaceCompressionRatioStats = 0;
      outputsStorage->totalCompressedDataSize = 0;
      outputsStorage->totalUncompressedDataSize = 0;
    }
    ++outputsStorage;
    --v12;
  }
  while (v12);
  ioSurfaceCompressionRatioStatsForRaw = self->_ioSurfaceCompressionRatioStatsForRaw;
  if (ioSurfaceCompressionRatioStatsForRaw)
  {
    if ([(BWStats *)ioSurfaceCompressionRatioStatsForRaw numberOfSamples]) {
      -[BWMultiStreamCameraSourceNode _reportIOSurfaceCompressionCoreAnalyticsDataForRaw]((uint64_t)self);
    }

    self->_ioSurfaceCompressionRatioStatsForRaw = 0;
    self->_totalCompressedDataSizeForRaw = 0;
    self->_totalUncompressedDataSizeForRaw = 0;
  }
  if (a3 && v7) {
    *a3 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
  }
  return v7 == 0;
}

- (void)_markEndOfLiveOnAllOutputs
{
  if (a1)
  {
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = 20;
    uint64_t v4 = a1;
    do
    {
      if (*(unsigned char *)(v4 + 393) && *(void *)(v4 + 400)) {
        objc_msgSend(v2, "addObject:");
      }
      v4 += 512;
      --v3;
    }
    while (v3);
    uint64_t v5 = a1;
    do
    {
      if (*(unsigned char *)(v5 + 393))
      {
        uint64_t v6 = *(NSObject **)(v5 + 416);
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __59__BWMultiStreamCameraSourceNode__markEndOfLiveOnAllOutputs__block_invoke;
        v7[3] = &unk_1E5C24C40;
        v7[5] = v2;
        v7[6] = v5 + 384;
        int v8 = v3;
        v7[4] = a1;
        dispatch_async(v6, v7);
      }
      ++v3;
      v5 += 512;
    }
    while (v3 != 20);
  }
}

- (uint64_t)_flushOutRemainingBuffers
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    uint64_t v2 = 0;
    uint64_t v3 = MEMORY[0x1E4F143A8];
    uint64_t v4 = result + 32;
    do
    {
      uint64_t v5 = *(NSObject **)(v4 + 384);
      v6[0] = v3;
      v6[1] = 3221225472;
      v6[2] = __58__BWMultiStreamCameraSourceNode__flushOutRemainingBuffers__block_invoke;
      v6[3] = &unk_1E5C262A0;
      v6[4] = v1;
      int v7 = v2;
      dispatch_sync(v5, v6);
      ++v2;
      v4 += 512;
    }
    while (v2 != 20);
    [v1[18] flush];
    [v1[1337] removeAllObjects];
    [v1[1361] flush];
    return [v1[1362] flush];
  }
  return result;
}

- (uint64_t)_unregisterStreamOutputHandlers
{
  if (result)
  {
    uint64_t v1 = result;
    mscsn_setStreamOutputBufferHandler(*(void **)(result + 112), *MEMORY[0x1E4F55410], 0, 0);
    if (*(unsigned char *)(v1 + 11136))
    {
      mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F55420], 0, 0);
      *(unsigned char *)(v1 + 11136) = 0;
    }
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F553F8], 0, 0);
    uint64_t v2 = *MEMORY[0x1E4F55428];
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F55428], 0, 0);
    if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "getPropertyIfSupported:error:", @"CompressedStillImageCaptureSupported", 0), "BOOLValue"))mscsn_setStreamOutputBlockBufferHandler(*(void **)(v1 + 112), v2, 0); {
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F55430], 0, 0);
    }
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F55438], 0, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F55440], 0, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F553F0], 0, 0);
    mscsn_setStreamOutputBufferHandler(*(void **)(v1 + 112), *MEMORY[0x1E4F55408], 0, 0);
    uint64_t v3 = *(void **)(v1 + 112);
    uint64_t v4 = *MEMORY[0x1E4F55400];
    return mscsn_setStreamOutputDictionaryHandler(v3, v4, 0);
  }
  return result;
}

- (uint64_t)_unregisterFromStreamNotifications
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 112) unregisterForNotification:*MEMORY[0x1E4F54418] listener:result];
    [*(id *)(v1 + 112) unregisterForNotification:@"Discontinuity" listener:v1];
    __n128 result = [*(id *)(v1 + 312) depthOutputEnabled];
    if (result)
    {
      uint64_t v2 = *(void **)(v1 + 112);
      uint64_t v3 = *MEMORY[0x1E4F54428];
      return [v2 unregisterForNotification:v3 listener:v1];
    }
  }
  return result;
}

- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsData:(uint64_t)result
{
  if (result)
  {
    if (*(_DWORD *)(a2 + 464))
    {
      uint64_t v3 = result;
      uint64_t v4 = objc_alloc_init(BWIOSurfaceCompressionHistogramAnalyticsPayload);
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setPortType:*(void *)(v3 + 184)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setBufferHeight:*(unsigned int *)(a2 + 132)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setNodeType:1];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setPixelFormatIsTenBit:*(unsigned __int8 *)(a2 + 492)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setNumberOfSamples:*(unsigned int *)(a2 + 464)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setLumaCompressionHistogram:a2 + 208];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setChromaCompressionHistogram:a2 + 336];
    }
    else
    {
      __n128 result = [*(id *)(a2 + 176) numberOfSamples];
      if (!result) {
        return result;
      }
      uint64_t v4 = objc_alloc_init(BWIOSurfaceCompressionStatisticsAnalyticsPayload);
      [*(id *)(a2 + 176) average];
      *(float *)&double v5 = v5;
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setAverageRatio:v5];
      [*(id *)(a2 + 176) min];
      *(float *)&double v6 = v6;
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setMinRatio:v6];
      [*(id *)(a2 + 176) max];
      *(float *)&double v7 = v7;
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setMaxRatio:v7];
      [*(id *)(a2 + 176) standardDeviation];
      *(float *)&double v8 = v8;
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setStandardDeviation:v8];
      -[BWIOSurfaceCompressionHistogramAnalyticsPayload setNumberOfSamples:](v4, "setNumberOfSamples:", [*(id *)(a2 + 176) numberOfSamples]);
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setCompressionType:*(unsigned int *)(a2 + 184)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setBufferHeight:*(unsigned int *)(a2 + 132)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setTotalCompressedSize:*(void *)(a2 + 192)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setTotalUncompressedSize:*(void *)(a2 + 200)];
      [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)v4 setNodeType:1];
    }
    int64x2_t v9 = +[BWCoreAnalyticsReporter sharedInstance];
    return [(BWCoreAnalyticsReporter *)v9 sendEvent:v4];
  }
  return result;
}

- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsDataForRaw
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_alloc_init(BWIOSurfaceCompressionStatisticsAnalyticsPayload);
    [*(id *)(v1 + 11000) average];
    *(float *)&double v3 = v3;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setAverageRatio:v3];
    [*(id *)(v1 + 11000) min];
    *(float *)&double v4 = v4;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setMinRatio:v4];
    [*(id *)(v1 + 11000) max];
    *(float *)&double v5 = v5;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setMaxRatio:v5];
    [*(id *)(v1 + 11000) standardDeviation];
    *(float *)&double v6 = v6;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setStandardDeviation:v6];
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setNumberOfSamples:](v2, "setNumberOfSamples:", [*(id *)(v1 + 11000) numberOfSamples]);
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setCompressionType:3];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setBufferHeight:*(unsigned int *)(v1 + 11024)];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setTotalCompressedSize:*(void *)(v1 + 11008)];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setTotalUncompressedSize:*(void *)(v1 + 11016)];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setNodeType:1];
    double v7 = +[BWCoreAnalyticsReporter sharedInstance];
    return [(BWCoreAnalyticsReporter *)v7 sendEvent:v2];
  }
  return result;
}

- (int)secureMetadataOutputConfigurationDidChange:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F55400];
  if (!self->_updateMetadataOutputWithoutDisabling)
  {
    stream = self->_stream;
    uint64_t v7 = *MEMORY[0x1E4F54CD8];
    uint64_t v26 = *MEMORY[0x1E4F55400];
    v27[0] = MEMORY[0x1E4F1CC28];
    int v8 = -[BWFigCaptureStream setProperty:value:](stream, "setProperty:value:", v7, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1]);
    if (v8)
    {
      int v10 = v8;
      goto LABEL_17;
    }
  }
  uint64_t v24 = v5;
  uint64_t v25 = [a3 metadataOutputConfigurationDictionary];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  int v10 = [(BWFigCaptureStream *)self->_stream setProperty:*MEMORY[0x1E4F54CB8] value:v9];
  if (dword_1EB4C56D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v10) {
    goto LABEL_17;
  }
  if (!self->_updateMetadataOutputWithoutDisabling)
  {
    if (!self->_metadataOutputInUseByPrimaryClient && ([a3 isEmpty] & 1) != 0) {
      return 0;
    }
    uint64_t v12 = self->_stream;
    uint64_t v13 = *MEMORY[0x1E4F54CD8];
    uint64_t v20 = v5;
    uint64_t v21 = MEMORY[0x1E4F1CC38];
    int v10 = -[BWFigCaptureStream setProperty:value:](v12, "setProperty:value:", v13, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1, v18, v19));
    if (!v10) {
      return v10;
    }
LABEL_17:
    FigDebugAssert3();
    return v10;
  }
  if (!self->_metadataOutputInUseByPrimaryClient)
  {
    int v14 = [a3 isEmpty];
    uint64_t v15 = self->_stream;
    uint64_t v16 = *MEMORY[0x1E4F54CD8];
    uint64_t v22 = v5;
    uint64_t v23 = [NSNumber numberWithBool:v14 ^ 1u];
    int v10 = -[BWFigCaptureStream setProperty:value:](v15, "setProperty:value:", v16, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1]);
    if (!v10) {
      return v10;
    }
    goto LABEL_17;
  }
  return 0;
}

- (unint64_t)_calculateVideoCaptureDimensions
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 312) visOverscan];
    return [(BWMultiStreamCameraSourceNode *)v1 _calculateVideoCaptureDimensionsWithVISOverscan:v3];
  }
  return result;
}

- (uint64_t)_scalingRequiredForOutput:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  double v4 = (void *)[*(id *)(result + 120) objectAtIndexedSubscript:*(int *)(result + 320)];
  BOOL v5 = (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F552B0]), "intValue") >= 1
    && (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F552A8]), "intValue") > 0;
  if ([*(id *)(v3 + 96) temporalNoiseReductionEnabled]
    && (v5 & [*(id *)(v3 + 96) temporalNoiseReductionRawEnabled] & 1) != 0)
  {
    return 1;
  }
  double v6 = (void *)*MEMORY[0x1E4F55410];
  [*(id *)(v3 + 312) visOverscan];
  uint64_t v9 = [(BWMultiStreamCameraSourceNode *)v3 _outputConfigurationForStreamingOutputID:a2 nodeOutput:v7 visOverscan:v8];
  CFDictionaryRef v10 = (const __CFDictionary *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F55350]];
  CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  rect.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  rect.CGSize size = v11;
  if (!CGRectMakeWithDictionaryRepresentation(v10, &rect))
  {
    FigDebugAssert3();
    return 1;
  }
  int v12 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue");
  int v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F55370]), "intValue");
  return v12 != (int)rect.size.width || v13 != (int)rect.size.height;
}

- (uint64_t)_videoCaptureOutputDimensionsValidForDepth
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = (void *)*MEMORY[0x1E4F55410];
    uint64_t v3 = *(void **)(result + 208);
    [*(id *)(result + 312) visOverscan];
    int v6 = objc_msgSend((id)objc_msgSend(-[BWMultiStreamCameraSourceNode _outputConfigurationForStreamingOutputID:nodeOutput:visOverscan:](v1, v2, v3, v4, v5), "objectForKeyedSubscript:", *MEMORY[0x1E4F553C0]), "intValue");
    double v7 = (void *)[*(id *)(v1 + 120) objectAtIndexedSubscript:*(int *)(v1 + 320)];
    double v8 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F55318]];
    uint64_t v9 = (void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F55420]];
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F55460]), "floatValue");
    if (v10 == 0.0) {
      float v10 = 0.25;
    }
    return (float)(v10 * (float)v6) <= 640.0;
  }
  return result;
}

- (uint64_t)_bytesPerOutputBufferForOutputConfiguration:(void *)a3 outputID:
{
  if (result)
  {
    uint64_t v5 = result;
    int v6 = (void *)[*(id *)(result + 120) objectAtIndexedSubscript:*(int *)(result + 320)];
    double v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F55318]), "objectForKeyedSubscript:", a3);
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F55498]];
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v8];
    [v9 removeObject:&unk_1EFB00DE8];
    unint64_t v10 = -[BWMultiStreamCameraSourceNode _outputDimensionsForOutputID:outputConfiguration:](v5, a3, a2);
    LODWORD(a2) = v10;
    unint64_t v11 = HIDWORD(v10);
    uint64_t v12 = FigCapturePixelFormatWithLeastAverageBandwidth(v9);
    return (int)(float)(FigCapturePixelFormatGetAverageBandwidthInBytesPerPixel(v12)
                                    * (float)((int)v11 * (int)a2));
  }
  return result;
}

- (uint64_t)_preferPrimaryScalerOverIntermediateTapForVideoOutputBasedOnBandwidth
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = (void *)*MEMORY[0x1E4F55410];
    uint64_t v3 = *(void **)(result + 208);
    [*(id *)(result + 312) visOverscan];
    int v6 = [(BWMultiStreamCameraSourceNode *)v1 _outputConfigurationForStreamingOutputID:v3 nodeOutput:v4 visOverscan:v5];
    double v7 = (void *)*MEMORY[0x1E4F553F8];
    uint64_t v8 = *(void **)(v1 + 208);
    [*(id *)(v1 + 312) visOverscan];
    unint64_t v11 = [(BWMultiStreamCameraSourceNode *)v1 _outputConfigurationForStreamingOutputID:v8 nodeOutput:v9 visOverscan:v10];
    uint64_t v12 = *(void **)(v1 + 200);
    [*(id *)(v1 + 312) visOverscan];
    uint64_t v15 = [(BWMultiStreamCameraSourceNode *)v1 _outputConfigurationForStreamingOutputID:v12 nodeOutput:v13 visOverscan:v14];
    uint64_t v16 = *(void **)(v1 + 200);
    [*(id *)(v1 + 312) visOverscan];
    uint64_t v19 = [(BWMultiStreamCameraSourceNode *)v1 _outputConfigurationForStreamingOutputID:v16 nodeOutput:v17 visOverscan:v18];
    int v20 = [*(id *)(v1 + 312) preferredPreviewMaxFrameRate];
    float v21 = 1.0;
    if (v20)
    {
      float v22 = (float)v20;
      [*(id *)(v1 + 312) maxFrameRate];
      if (v23 > v22)
      {
        [*(id *)(v1 + 312) maxFrameRate];
        float v21 = v22 / v24;
      }
    }
    int v25 = -[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v11, v7);
    int v26 = -[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v15, v2);
    int v27 = (int)(float)(v21
                     * (float)(int)-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v19, v7));
    return (int)(-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v6, v2) + v27) < v26 + v25;
  }
  return result;
}

- (uint64_t)_preferIntermediateTapOverSecondaryScalerForPreviewOutputBasedOnBandwidth
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = (void *)*MEMORY[0x1E4F55420];
    uint64_t v3 = *(void **)(result + 200);
    [*(id *)(result + 312) visOverscan];
    int v6 = [(BWMultiStreamCameraSourceNode *)v1 _outputConfigurationForStreamingOutputID:v3 nodeOutput:v4 visOverscan:v5];
    double v7 = (void *)*MEMORY[0x1E4F553F8];
    uint64_t v8 = *(void **)(v1 + 200);
    [*(id *)(v1 + 312) visOverscan];
    unint64_t v11 = [(BWMultiStreamCameraSourceNode *)v1 _outputConfigurationForStreamingOutputID:v8 nodeOutput:v9 visOverscan:v10];
    uint64_t v12 = *MEMORY[0x1E4F55378];
    int v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F55378]), "intValue");
    int v14 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v12), "intValue");
    float v15 = 1.0;
    float v16 = 1.0;
    if (v13 >= 1)
    {
      [*(id *)(v1 + 312) maxFrameRate];
      float v16 = (float)v13 / v17;
    }
    if (v14 >= 1)
    {
      [*(id *)(v1 + 312) maxFrameRate];
      float v15 = (float)v14 / v18;
    }
    int v19 = (int)(float)(v15
                     * (float)(int)-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v6, v2));
    return (int)(float)(v16
                      * (float)(int)-[BWMultiStreamCameraSourceNode _bytesPerOutputBufferForOutputConfiguration:outputID:](v1, v11, v7)) <= v19;
  }
  return result;
}

- (uint64_t)_updateOutputStorageWithSecureMetadataOutputConfiguration:(char)a3 propagateToNodeOutputs:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    int v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    int v7 = [a2 objectDetectionEnabled];
    if (*(unsigned __int8 *)(v5 + 6537) != v7)
    {
      *(unsigned char *)(v5 + 6537) = v7;
      if (v7)
      {
        *(void *)(v5 + 6544) = *(void *)(v5 + 240);
        *(_DWORD *)(v5 + 6528) = 1;
      }
      [v6 addObject:&unk_1EFB00E30];
    }
    if (*(unsigned __int8 *)(v5 + 7049) != [a2 eyeReliefStatusDetectionEnabled])
    {
      int v8 = [a2 eyeReliefStatusDetectionEnabled];
      *(unsigned char *)(v5 + 7049) = v8;
      if (v8)
      {
        *(void *)(v5 + 7056) = *(void *)(v5 + 288);
        *(_DWORD *)(v5 + 7040) = 1;
      }
      [v6 addObject:&unk_1EFB00E48];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __n128 result = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (result)
    {
      uint64_t v9 = result;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          int v12 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) intValue];
          int v13 = *(NSObject **)(v5 + 384 + ((uint64_t)v12 << 9) + 32);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __114__BWMultiStreamCameraSourceNode__updateOutputStorageWithSecureMetadataOutputConfiguration_propagateToNodeOutputs___block_invoke;
          block[3] = &unk_1E5C29B70;
          block[4] = v5;
          block[5] = v5 + 384 + ((uint64_t)v12 << 9);
          char v16 = a3;
          int v15 = v12;
          dispatch_sync(v13, block);
          ++v11;
        }
        while (v9 != v11);
        __n128 result = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __114__BWMultiStreamCameraSourceNode__updateOutputStorageWithSecureMetadataOutputConfiguration_propagateToNodeOutputs___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v3 = *(void **)(v2 + 16);
  if (*(unsigned char *)(v2 + 9))
  {
    *(unsigned char *)(*(void *)(result + 32) + 11040) = 0;
    if (*(unsigned char *)(result + 52))
    {
      __n128 result = [v3 liveFormat];
      if (!result) {
        __n128 result = [v3 makeConfiguredFormatLive];
      }
      uint64_t v4 = *(void *)(v1 + 40);
      if (!*(unsigned char *)(v4 + 8))
      {
        __n128 result = -[BWMultiStreamCameraSourceNode _createAndStartFrameCounterForOutputIndexIfNecessary:](*(void *)(v1 + 32), *(_DWORD *)(v1 + 48));
        uint64_t v4 = *(void *)(v1 + 40);
      }
      *(unsigned char *)(v4 + 8) = 1;
    }
  }
  else
  {
    *(unsigned char *)(v2 + 8) = 0;
    -[BWMultiStreamCameraSourceNode _stopAndReleaseFrameCounterForOutputIndexIfNecessary:](*(void *)(result + 32), *(_DWORD *)(result + 48));
    __n128 result = [v3 liveFormat];
    if (result) {
      __n128 result = [v3 markEndOfLiveOutput];
    }
    uint64_t v5 = *(void *)(v1 + 40);
    *(void *)(v5 + 16) = 0;
    *(_DWORD *)uint64_t v5 = 0;
  }
  return result;
}

- (double)_overscanWithFOVSacrifice
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 312) visOverscan];
  double v3 = v2 + 1.0;
  [*(id *)(a1 + 312) sensorOverscan];
  double v5 = 0.0;
  if (v3 / (v4 + 1.0) + -1.0 >= 0.0)
  {
    [*(id *)(a1 + 312) visOverscan];
    double v7 = v6 + 1.0;
    [*(id *)(a1 + 312) sensorOverscan];
    double v5 = v7 / (v8 + 1.0) + -1.0;
  }
  [*(id *)(a1 + 312) visOverscan];
  double v10 = v9 + 1.0;
  [*(id *)(a1 + 312) sensorOverscan];
  if (v10 / (v11 + 1.0) + -1.0 >= 0.0)
  {
    [*(id *)(a1 + 312) visOverscan];
    [*(id *)(a1 + 312) sensorOverscan];
  }
  return v5;
}

- (void)_outputConfigurationsFilterCropRectAndDimensionsOfStreamingOutputs:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  char v16 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v17 = *(void *)v19;
    uint64_t v5 = *MEMORY[0x1E4F55410];
    uint64_t v15 = *MEMORY[0x1E4F55420];
    uint64_t v14 = *MEMORY[0x1E4F553F8];
    uint64_t v6 = *MEMORY[0x1E4F55350];
    uint64_t v7 = *MEMORY[0x1E4F553C0];
    uint64_t v8 = *MEMORY[0x1E4F55370];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(a2);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", v5, v14) & 1) != 0
          || ([v10 isEqualToString:v15] & 1) != 0
          || [v10 isEqualToString:v14])
        {
          double v11 = (void *)[a2 objectForKeyedSubscript:v10];
          int v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", v6), v6);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", v7), v7);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", v8), v8);
          [v16 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v4 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  return v16;
}

- (uint64_t)_finalPreviewOutputDimensions
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v15 = 0;
    double v2 = (void *)[*(id *)(result + 120) objectAtIndexedSubscript:*(int *)(result + 320)];
    float v3 = (float)(int)[*(id *)(v1 + 312) horizontalSensorBinningFactor];
    float v4 = v3 / (float)(int)[*(id *)(v1 + 312) verticalSensorBinningFactor];
    float v5 = (float)(int)[*(id *)(v1 + 312) fesBinningFactorHorizontal];
    uint64_t v14 = 0;
    uint64_t v6 = *(void **)(v1 + 10736);
    [*(id *)(v1 + 312) sensorCenterOffset];
    double v8 = v7;
    double v10 = v9;
    unint64_t v11 = [*(id *)(v1 + 312) preferredPreviewDimensions];
    int v12 = [*(id *)(v1 + 312) roundingOfStillImageDimensionsToMultipleOfFourEnabled];
    int v13 = [*(id *)(v1 + 312) geometricDistortionCorrectionOnPreviewOutputEnabled];
    mscsn_calculateScalerCropAndOutputDimensions(v6, v2, 0, 0, v11, v12, 0, v13, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v8, v10, v4, v5, &v14, &v15);
    return v15;
  }
  return result;
}

- (uint64_t)_updateStreamOutputConfigurationsWithPowerOptimizedVISOverscanEnabled:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 208)
      && ([*(id *)(result + 96) adaptiveOverscanEnabled] & 1) != 0
      && (float v4 = *(void **)(v2 + 10712)) != 0)
    {
      if (*(unsigned __int8 *)(v2 + 10708) == a2)
      {
        return 0;
      }
      else
      {
        if (a2)
        {
          float v4 = *(void **)(v2 + 10720);
          if (!v4)
          {
            [*(id *)(v2 + 312) visOverscan];
            double v6 = v5;
            [*(id *)(v2 + 312) visOverscan];
            double v8 = [(BWMultiStreamCameraSourceNode *)(void *)v2 _outputConfigurationsForAllOutputsWithVISOverscan:v7];
            float v4 = -[BWMultiStreamCameraSourceNode _outputConfigurationsFilterCropRectAndDimensionsOfStreamingOutputs:](v2, v8);
            *(void *)(v2 + 10720) = v4;
          }
        }
        __n128 result = [*(id *)(v2 + 112) setProperty:*MEMORY[0x1E4F54CB8] value:v4];
        *(unsigned char *)(v2 + 10708) = a2;
      }
    }
    else
    {
      FigDebugAssert3();
      return 4294954516;
    }
  }
  return result;
}

- (void)setPowerOptimizedVISOverscanEnabled:(BOOL)a3
{
  if (!self->_stopStreamConfigurationUpdates)
  {
    streamConfigurationQueue = self->_streamConfigurationQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __69__BWMultiStreamCameraSourceNode_setPowerOptimizedVISOverscanEnabled___block_invoke;
    v4[3] = &unk_1E5C24B78;
    v4[4] = self;
    BOOL v5 = a3;
    dispatch_async(streamConfigurationQueue, v4);
  }
}

uint64_t __69__BWMultiStreamCameraSourceNode_setPowerOptimizedVISOverscanEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 10728)) {
    return -[BWMultiStreamCameraSourceNode _updateStreamOutputConfigurationsWithPowerOptimizedVISOverscanEnabled:](result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (BWPixelBufferPool)_allocateOrReuseBufferPoolsFromSourceNodeOutput:(uint64_t)a3 forAttachedMedia:(void *)a4 onNodeOutput:(void *)a5 outputConfiguration:(char)a6 shareBufferPools:
{
  if (!result) {
    return result;
  }
  p_isa = (void **)&result->super.isa;
  int v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55340]), "intValue");
  if (a6)
  {
    int v13 = (BWPixelBufferPool *)(id)objc_msgSend((id)objc_msgSend(a2, "mediaPropertiesForAttachedMediaKey:", a3), "preparedPixelBufferPool");
    uint64_t v14 = (void *)[a4 mediaPropertiesForAttachedMediaKey:a3];
    if (v13)
    {
      [(BWPixelBufferPool *)v13 setCapacity:[(BWPixelBufferPool *)v13 capacity] + v12];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v14 = (void *)[a4 mediaPropertiesForAttachedMediaKey:a3];
  }
  int v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F55388]), "intValue");
  char v16 = (void *)[v14 resolvedVideoFormat];
  if (v15 != [v16 pixelFormat])
  {
    FigDebugAssert3();
    int v13 = 0;
    goto LABEL_9;
  }
  int v17 = [v14 resolvedRetainedBufferCount] + v12;
  long long v18 = [BWPixelBufferPool alloc];
  int v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v18, "initWithVideoFormat:capacity:name:memoryPool:", v16, v17, [NSString stringWithFormat:@"%@_%@_BufferPool", BWPortTypeToDisplayString(p_isa[23], v19), a3], objc_msgSend(a4, "memoryPool"));
  if (!v13)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
LABEL_8:
  [v14 setNodePreparedPixelBufferPool:v13];
LABEL_9:
  return v13;
}

- (void)_prefetchPixelBufferForOutputStorage:(int)a3 numberOfBuffersToFetch:(int)a4 lastEmittedSurfaceID:
{
  if (a1 && *(unsigned char *)(a2 + 9) && !*(unsigned char *)(a2 + 104))
  {
    double v8 = *(void **)(a2 + 16);
    if (v8)
    {
      uint64_t v9 = [v8 livePixelBufferPool];
      if (!v9) {
        return;
      }
    }
    else
    {
      uint64_t v9 = *(void *)(a2 + 96);
      if (!v9) {
        return;
      }
    }
    double v10 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__BWMultiStreamCameraSourceNode__prefetchPixelBufferForOutputStorage_numberOfBuffersToFetch_lastEmittedSurfaceID___block_invoke;
    block[3] = &unk_1E5C264A0;
    block[4] = v9;
    block[5] = a2;
    int v12 = a3;
    int v13 = a4;
    dispatch_async(v10, block);
  }
}

uint64_t __114__BWMultiStreamCameraSourceNode__prefetchPixelBufferForOutputStorage_numberOfBuffersToFetch_lastEmittedSurfaceID___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 40) + 496))
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 32) prefetch:*(unsigned int *)(v1 + 48) lastEmittedSurfaceID:*(unsigned int *)(v1 + 52)];
    if (result) {
      *(_WORD *)(*(void *)(v1 + 40) + 495) = 0;
    }
  }
  return result;
}

- (void)startIncrementalPrefetchingOfSourcePoolsIfNecessary
{
  p_pixelFormatint IsTenBit = &self->_outputsStorage[0].pixelFormatIsTenBit;
  uint64_t v3 = 20;
  do
  {
    *p_pixelFormatint IsTenBit = *(p_pixelFormatIsTenBit - 1);
    p_pixelFormatIsTenBit += 512;
    --v3;
  }
  while (v3);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_3(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  memset(&v9, 0, sizeof(v9));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = *a3;
    CMTimeGetSeconds(&time);
    CMTime time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  double v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 2u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_4(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  memset(&v9, 0, sizeof(v9));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = *a3;
    CMTimeGetSeconds(&time);
    CMTime time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  double v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 8u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_5(uint64_t a1, void *a2, CMTime *a3)
{
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime v7 = *a3;
    CMTimeGetSeconds(&v7);
    kdebug_trace();
  }
  double v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime v7 = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v6, 3u, a2, (UInt8 *)&v7);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_6(uint64_t a1, void *a2, CMTime *a3)
{
  memset(&v8, 0, sizeof(v8));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v8, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = *a3;
    CMTimeGetSeconds(&time);
    CMTime time = v8;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CMTime v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 3u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_7(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime v8 = *a3;
    CMTimeGetSeconds(&v8);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  CMTime v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime v8 = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 4u, a2, (UInt8 *)&v8);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_8(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime v8 = *a3;
    CMTimeGetSeconds(&v8);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  CMTime v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime v8 = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 5u, a2, (UInt8 *)&v8);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_9(uint64_t a1, __CVBuffer *a2, CMTime *a3)
{
  memset(&v9, 0, sizeof(v9));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v9, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = *a3;
    CMTimeGetSeconds(&time);
    CMTime time = v9;
    CMTimeGetSeconds(&time);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  CMTime v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v8, 6u, a2, (UInt8 *)&time);
}

void __62__BWMultiStreamCameraSourceNode__registerStreamOutputHandlers__block_invoke_10(uint64_t a1, void *a2, CMTime *a3)
{
  memset(&v8, 0, sizeof(v8));
  int64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  CMTimeMake(&v8, UpTimeNanoseconds, 1000000000);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    CMTime time = *a3;
    CMTimeGetSeconds(&time);
    CMTime time = v8;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CMTime v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CMTime time = *a3;
  multiStreamCameraSourceNode_sendBufferToBufferServicingThread(v7, 7u, a2, (UInt8 *)&time);
}

- (void)_reflectStillSampleBufferOnStreamingOutputs:(int)a3 captureType:
{
  if (!a1) {
    return;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
  uint64_t v6 = 0;
  uint64_t v7 = 384;
  uint64_t v8 = a1 + 384;
  CMTime v9 = (unsigned char *)(a1 + 388);
  while (!v9[5] || (*v9 & 4) == 0)
  {
    ++v6;
    v9 += 512;
    if (v6 == 20)
    {
      uint64_t v6 = 0;
      break;
    }
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int v12 = *(void **)(v8 + (v6 << 9) + 16);
  long long v46 = v12;
  while (!*(unsigned char *)(a1 + v7 + 9) || *(_DWORD *)(a1 + v7) != 1 || (*(unsigned char *)(a1 + v7 + 4) & 4) != 0)
  {
    ++v11;
    v10 += 512;
    v7 += 512;
    if (v11 == 3)
    {
      LODWORD(v11) = -1;
LABEL_13:
      target = 0;
      int v13 = 0;
      uint64_t v14 = v8 + (v6 << 9);
      uint64_t v15 = *(void *)(v14 + 128);
      float v16 = *(float *)(v14 + 168);
      float v17 = 1.0;
      char v43 = 1;
      int v18 = 1;
      uint64_t v19 = v15;
      goto LABEL_14;
    }
  }
  if ((v11 & 0x80000000) != 0) {
    goto LABEL_13;
  }
  uint64_t v24 = a1 + v7;
  int v25 = *(void **)(v24 + 16);
  uint64_t v26 = v8 + (v6 << 9);
  uint64_t v15 = *(void *)(v26 + 128);
  uint64_t v19 = *(void *)(v24 + 128);
  float v16 = *(float *)(v26 + 168);
  float v17 = *(float *)(v24 + 168);
  if (v25)
  {
    uint64_t v27 = [v12 liveFormat];
    uint64_t v28 = [v25 liveFormat];
    uint64_t v44 = (void *)v27;
    double v29 = (void *)v27;
    double v30 = (void *)v28;
    target = v25;
    unint64_t v31 = [v29 width];
    if (v31 >= [v30 width] || (unint64_t v32 = objc_msgSend(v44, "height"), v32 >= objc_msgSend(v30, "height")))
    {
      char v43 = 0;
      int v18 = 1;
      int v12 = v46;
      int v13 = target;
    }
    else
    {
      char v43 = 0;
      int v18 = 0;
      uint64_t v33 = a1 + 384 + v10;
      uint64_t v15 = *(void *)(v33 + 128);
      uint64_t v34 = a1 + 384 + (v6 << 9);
      uint64_t v19 = *(void *)(v34 + 128);
      float v16 = *(float *)(v33 + 168);
      float v17 = *(float *)(v34 + 168);
      int v12 = target;
      int v13 = v46;
    }
  }
  else
  {
    target = 0;
    int v13 = 0;
    char v43 = 1;
    int v18 = 1;
  }
LABEL_14:
  ScaledAndZoomedSampleBufferFromSampleBuffer = (opaqueCMSampleBuffer *)mscsn_createScaledAndZoomedSampleBufferFromSampleBuffer(sbuf, ImageBuffer, a3, (void *)[v12 livePixelBufferPool], v15, (VTPixelTransferSessionRef *)(a1 + 10912), (CFTypeRef *)(a1 + 10920), *(double *)(a1 + 10824), *(double *)(a1 + 10832), v16);
  if (!ScaledAndZoomedSampleBufferFromSampleBuffer)
  {
    FigDebugAssert3();
    return;
  }
  long long v21 = ScaledAndZoomedSampleBufferFromSampleBuffer;
  if (!v13)
  {
    uint64_t v23 = 0;
LABEL_26:
    int v38 = v18;
    if (v18) {
      long long v39 = v21;
    }
    else {
      long long v39 = v23;
    }
    unsigned int v40 = (const void *)*MEMORY[0x1E4F1CFD0];
    CMSetAttachment(v39, @"IsHarvestedStillFrame", (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
    -[BWMultiStreamCameraSourceNode _addMetadataUsedByVideoEncoderToPixelBufferForSampleBuffer:nodeOutput:](a1, v39, (uint64_t)v46);
    mscsn_removeNonpropagatedAttachmentsFromReflectedStreamingFrame(v39);
    [v46 emitSampleBuffer:v39];
    CMSampleBufferGetPresentationTimeStamp(&v47, v39);
    *(CMTime *)(a1 + 384 + (v6 << 9) + 56) = v47;
    if ((v43 & 1) == 0)
    {
      if (v38) {
        int v41 = v23;
      }
      else {
        int v41 = v21;
      }
      CMSetAttachment(target, @"IsHarvestedStillFrame", v40, 1u);
      -[BWMultiStreamCameraSourceNode _addMetadataUsedByVideoEncoderToPixelBufferForSampleBuffer:nodeOutput:](a1, v41, (uint64_t)target);
      mscsn_removeNonpropagatedAttachmentsFromReflectedStreamingFrame(v41);
      [target emitSampleBuffer:v41];
      CMSampleBufferGetPresentationTimeStamp(&v47, v41);
      *(CMTime *)(a1 + 384 + ((uint64_t)(int)v11 << 9) + 56) = v47;
    }
    CFRelease(v21);
    if (v23) {
      CFRelease(v23);
    }
    return;
  }
  if (v13 == *(void **)(a1 + 200)) {
    uint64_t v22 = (double *)MEMORY[0x1E4F1DB30];
  }
  else {
    uint64_t v22 = (double *)(a1 + 10824);
  }
  double v36 = *v22;
  double v35 = v22[1];
  long long v37 = CMSampleBufferGetImageBuffer(ScaledAndZoomedSampleBufferFromSampleBuffer);
  uint64_t v23 = (opaqueCMSampleBuffer *)mscsn_createScaledAndZoomedSampleBufferFromSampleBuffer(v21, v37, a3, (void *)[v13 livePixelBufferPool], v19, (VTPixelTransferSessionRef *)(a1 + 10928), (CFTypeRef *)(a1 + 10936), v36, v35, v17);
  if (v23) {
    goto LABEL_26;
  }
  FigDebugAssert3();
  CFRelease(v21);
}

- (uint64_t)_preserveMotionDataForSoonToBeDroppedSampleBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [*(id *)(result + 312) reflectsStillsOnStreamingOutputs];
    if (result)
    {
      if (![*(id *)(v3 + 104) synchronizedStreamsEnabled]
        || (uint64_t result = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"), result))
      {
        float v4 = *(void **)(v3 + 10688);
        return [v4 preserveMotionDataForSoonToBeDroppedSampleBuffer:a2];
      }
    }
  }
  return result;
}

- (CMAttachmentBearerRef)_createFocusPixelDataSampleBufferFromVideoSampleBuffer:(CMAttachmentBearerRef)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    CMAttachmentBearerRef targeta = 0;
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F53038];
    BOOL v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53038], 0);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *MEMORY[0x1E4F539A0];
      uint64_t v8 = (__CVBuffer *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F539A0]];
      if (!v8
        || BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v8, (CFTypeRef *)(v3 + 368), (CMSampleBufferRef *)&targeta))
      {
        FigDebugAssert3();
      }
      else
      {
        CMRemoveAttachment(targeta, v4);
        CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
        CFTypeRef v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        CMSetAttachment(targeta, v9, (CFTypeRef)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10], 1u);
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v6];
        [v11 setObject:0 forKeyedSubscript:v7];
        CMSetAttachment(targeta, v4, v11, 1u);
      }
    }
    CMRemoveAttachment(target, v4);
    return targeta;
  }
  return result;
}

- (void)_propagatePixelBufferAttachmentFromSampleBuffer:(CFStringRef)key attachmentKey:(uint64_t)a4 usingAttachedMediaKey:(int)a5 resetValidBufferRect:
{
  if (a1)
  {
    CFStringRef v9 = (__CVBuffer *)CMGetAttachment(target, key, 0);
    if (v9) {
      -[BWMultiStreamCameraSourceNode _propagatePixelBufferAttachment:sampleBuffer:attachedMediaKey:removeAttachmentKey:resetValidBufferRect:](a1, v9, target, (uint64_t)key, key, a5);
    }
    CMRemoveAttachment(target, key);
  }
}

- (void)_propagatePixelBufferAttachment:(void *)a3 sampleBuffer:(uint64_t)a4 attachedMediaKey:(const __CFString *)a5 removeAttachmentKey:(int)a6 resetValidBufferRect:
{
  if (a1)
  {
    CFTypeRef cf = 0;
    CMAttachmentBearerRef target = 0;
    if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)a3, a2, &cf, (CMSampleBufferRef *)&target))
    {
      if (a5) {
        CMRemoveAttachment(target, a5);
      }
      id v10 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target);
      if (a6)
      {
        uint64_t v11 = v10;
        uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F54358]];
        [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F54370]];
      }
      BWSampleBufferSetAttachedMedia(a3, a4, (uint64_t)target);
    }
    if (target) {
      CFRelease(target);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (a5) {
      CMRemoveAttachment(a3, a5);
    }
  }
}

const void *__58__BWMultiStreamCameraSourceNode__flushOutRemainingBuffers__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 384;
  for (uint64_t i = *(int *)(a1 + 40); ; uint64_t i = *(int *)(a1 + 40))
  {
    uint64_t result = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v2 + (i << 9) + 24));
    if (!result) {
      break;
    }
    CFRelease(result);
    uint64_t v2 = *(void *)(a1 + 32) + 384;
  }
  return result;
}

uint64_t __59__BWMultiStreamCameraSourceNode__markEndOfLiveOnAllOutputs__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 11040) = 1;
  *(unsigned char *)(*(void *)(a1 + 48) + 8) = 0;
  -[BWMultiStreamCameraSourceNode _stopAndReleaseFrameCounterForOutputIndexIfNecessary:](*(void *)(a1 + 32), *(_DWORD *)(a1 + 56));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = -[BWMultiStreamCameraSourceNode _nodeOutputsMadeLiveByStreamOutputIndex:](*(void *)(a1 + 32), *(_DWORD *)(a1 + 56));
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (v7 == *(void **)(*(void *)(a1 + 48) + 16)
          || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8) & 1) == 0)
        {
          if (objc_msgSend(v7, "liveFormat", (void)v8)) {
            [v7 markEndOfLiveOutput];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (double)_bravoShiftMitigationCropOffset:(float)a3 totalZoom:(double)a4 totalConfiguredOverscan:(double)a5 totalAvailableOverscan:(double)a6
{
  if (!a1) {
    return 0.0;
  }
  float64x2_t v163 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  id v162 = 0;
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [*(id *)(a1 + 96) parallaxMitigationStrengthAndTargetCaptureStream:&v162];
  float v16 = v15;
  if (([*(id *)(a1 + 96) parallaxMitigationBasedOnZoomFactorEnabled] & 1) != 0 || v16 != 0.0)
  {
    float v17 = (void *)[*(id *)(a1 + 96) captureStreamsByFocalLength];
    uint64_t v18 = [v17 indexOfObject:*(void *)(a1 + 104)];
    if ([v17 indexOfObject:v162] == v18 + 1)
    {
      CFDictionaryRef v19 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
      size_t Width = CVPixelBufferGetWidth(ImageBuffer);
      size_t Height = CVPixelBufferGetHeight(ImageBuffer);
      v23.i64[0] = Width;
      v23.i64[1] = Height;
      uint64x2_t v150 = v23;
      CMSampleBufferGetPresentationTimeStamp(&time, (CMSampleBufferRef)a2);
      double Seconds = CMTimeGetSeconds(&time);
      float64x2_t v160 = 0uLL;
      [*(id *)(a1 + 104) opticalCenterOffsetInPhysicalSensorDimensions];
      v160.f64[0] = v25;
      v160.f64[1] = v26;
      [v162 opticalCenterOffsetInPhysicalSensorDimensions];
      v159.f64[0] = v27;
      v159.f64[1] = v28;
      int v29 = [*(id *)(a1 + 312) horizontalSensorBinningFactor];
      int v30 = [*(id *)(a1 + 312) verticalSensorBinningFactor];
      if (v160.f64[0] == v13 && v160.f64[1] == v14)
      {
        uint64_t v141 = v7;
        LODWORD(v139) = 0;
        FigDebugAssert3();
      }
      float64x2_t v31 = vcvtq_f64_u64(v150);
      if (v159.f64[0] == v13 && v159.f64[1] == v14)
      {
        uint64_t v141 = v7;
        LODWORD(v139) = 0;
        float64x2_t v152 = v31;
        FigDebugAssert3();
        float64x2_t v31 = v152;
      }
      float32x2_t v151 = vcvt_f32_f64(v31);
      memset(v158, 0, 512);
      unint64_t v32 = *(void **)(a1 + 96);
      if (v32) {
        [v32 sphereShiftState];
      }
      else {
        bzero(v158, 0x280uLL);
      }
      int v157 = 7;
      float64x2_t v153 = 0u;
      float64x2_t v154 = 0u;
      long long v155 = 0u;
      float64x2_t v156 = 0u;
      uint64_t v33 = (const void *)objc_msgSend(v162, "portType", v139, v141);
      float v34 = v151.f32[1];
      LODWORD(v140) = v30;
      if (FigMotionComputeWideToNarrowShift(v19, 0, v33, &v160, &v159, (int)v151.f32[0], (int)v151.f32[1], v29, Seconds, 0.0, 1.0, v140, &v157, (uint64_t)v158, v163.f64, &v153))goto LABEL_79; {
      if ([*(id *)(a1 + 96) parallaxMitigationBasedOnZoomFactorEnabled])
      }
      {
        double v145 = a7;
        float v146 = v16;
        float v36 = 1.0;
        float v37 = *(float *)(a1 + 11132);
        float v38 = *(float *)(a1 + 10704) + 1.0;
        LODWORD(v35) = 1.0;
        if (*(unsigned char *)(a1 + 11130))
        {
          objc_msgSend(*(id *)(a1 + 312), "bravoShiftMitigationMaxZoomFactor", v35);
          *(float *)&double v35 = *(float *)&v35 / v37;
        }
        if (*(float *)&v35 >= 1.0) {
          float v36 = *(float *)&v35;
        }
        double v39 = (a4 + -1.0) * (1.0 - *(double *)(a1 + 11120));
        double v144 = v38 + -1.0;
        double v142 = v36;
        double v40 = v36 * (a4 + -1.0 + 1.0 + v144) + -1.0;
        float v41 = v38 * v37;
        [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
        float v147 = v38 * v37;
        if ((float)(v38 * v37) >= v42)
        {
          [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
          float v147 = v43;
        }
        uint64_t v44 = *(void **)(a1 + 104);
        double v45 = v39 / v40;
        if (*(unsigned char *)(a1 + 11128))
        {
          float v143 = v41;
          double v46 = v39 / v40;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "nondisruptiveSwitchingZoomFactors"), "lastObject"), "floatValue");
          float v48 = v47;
          if (v47 == 0.0)
          {
            [*(id *)(a1 + 104) baseZoomFactor];
            float v48 = v49;
          }
          float v50 = a3 - v48;
          [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
          if ((float)((float)(a3 - v48) / (float)(v51 - v48)) > 1.0
            || ([*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor],
                float v53 = 0.0,
                (float)(v50 / (float)(v52 - v48)) >= 0.0))
          {
            [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
            float v53 = 1.0;
            if ((float)(v50 / (float)(v54 - v48)) <= 1.0)
            {
              [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
              float v53 = v50 / (float)(v55 - v48);
            }
          }
          float v56 = v50 / (float)(v147 - v48);
          if (v36 < v56) {
            float v56 = v36;
          }
          float v57 = v56 >= 0.0 ? v56 : 0.0;
          double v58 = a6;
          double v59 = 1.0;
          double v45 = v46;
          float v41 = v143;
        }
        else
        {
          double v58 = a6;
          [v44 baseZoomFactor];
          float v80 = a3 - v79;
          [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
          float v82 = v81;
          [*(id *)(a1 + 104) baseZoomFactor];
          if ((float)(v80 / (float)(v82 - v83)) > 1.0
            || ([*(id *)(a1 + 104) baseZoomFactor],
                float v85 = a3 - v84,
                [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor],
                float v87 = v86,
                [*(id *)(a1 + 104) baseZoomFactor],
                float v53 = 0.0,
                (float)(v85 / (float)(v87 - v88)) >= 0.0))
          {
            [*(id *)(a1 + 104) baseZoomFactor];
            float v90 = a3 - v89;
            [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
            float v92 = v91;
            [*(id *)(a1 + 104) baseZoomFactor];
            float v53 = 1.0;
            if ((float)(v90 / (float)(v92 - v93)) <= 1.0)
            {
              [*(id *)(a1 + 104) baseZoomFactor];
              float v95 = a3 - v94;
              [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
              float v97 = v96;
              [*(id *)(a1 + 104) baseZoomFactor];
              float v53 = v95 / (float)(v97 - v98);
            }
          }
          [*(id *)(a1 + 104) baseZoomFactor];
          float v100 = a3 - v99;
          [*(id *)(a1 + 104) baseZoomFactor];
          _NF = v36 < (float)(v100 / (float)(v147 - *(float *)&v102));
          *(float *)&double v102 = v36;
          if (!_NF)
          {
            objc_msgSend(*(id *)(a1 + 104), "baseZoomFactor", v102);
            float v104 = a3 - v103;
            [*(id *)(a1 + 104) baseZoomFactor];
            *(float *)&double v102 = v104 / (float)(v147 - *(float *)&v102);
          }
          float v57 = 0.0;
          if (*(float *)&v102 >= 0.0)
          {
            [*(id *)(a1 + 104) baseZoomFactor];
            float v106 = a3 - v105;
            [*(id *)(a1 + 104) baseZoomFactor];
            if (v36 >= (float)(v106 / (float)(v147 - v107)))
            {
              [*(id *)(a1 + 104) baseZoomFactor];
              float v109 = a3 - v108;
              [*(id *)(a1 + 104) baseZoomFactor];
              float v57 = v109 / (float)(v147 - v110);
            }
            else
            {
              float v57 = v36;
            }
          }
          double v59 = 1.0;
        }
        double v111 = v59 - v45;
        float64x2_t v112 = vcvtq_f64_f32(v151);
        float64x2_t v113 = vdivq_f64(vaddq_f64(v156, v154), v112);
        if (*(unsigned char *)(a1 + 11129))
        {
          if (v41 >= a3)
          {
            double v129 = v57;
            double v114 = (a4 + v144 + -1.0) * v129 + 1.0;
            double v115 = (a5 + v144 + -1.0) * v129 + 1.0;
          }
          else
          {
            double v114 = v58;
            double v115 = v145;
          }
        }
        else if (*(unsigned char *)(a1 + 11130))
        {
          double v116 = a4 + v144 + -1.0;
          v117.f64[0] = -v116;
          v118.f64[0] = v116 * v142 * v111;
          double v119 = a5 + v144 + -1.0;
          v117.f64[1] = -v119;
          float64x2_t v120 = vmulq_n_f64(vmulq_n_f64(v117, v142), v111);
          __asm { FMOV            V7.2D, #0.5 }
          float64x2_t v125 = vmulq_f64(v120, _Q7);
          v118.f64[1] = v119 * v142 * v111;
          float64x2_t v126 = vmulq_f64(v118, _Q7);
          float64x2_t v127 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v113, v126), (int8x16_t)v126, (int8x16_t)v113);
          float64x2_t v113 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v125, v127), (int8x16_t)v125, (int8x16_t)v127);
          double v128 = v57;
          double v114 = v116 * v128 + 1.0;
          double v115 = v119 * v128 + 1.0;
        }
        else
        {
          double v115 = a5;
          double v114 = a4;
        }
        double v130 = v111 * (v114 + -1.0);
        double v131 = v111 * (v115 + -1.0);
        double v72 = v130 >= v58 + -1.0 ? v58 + -1.0 : v130;
        double v74 = v131 >= v145 + -1.0 ? v145 + -1.0 : v131;
        float64x2_t v132 = vmulq_n_f64(vmulq_f64(v113, v112), v53);
        float64x2_t v163 = vmlaq_n_f64(v132, vmulq_n_f64(vsubq_f64(v163, v132), v146), v53);
        float v34 = v151.f32[1];
      }
      else
      {
        [*(id *)(a1 + 104) baseZoomFactor];
        float v61 = a3 - v60;
        [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
        float v63 = v62;
        [*(id *)(a1 + 104) baseZoomFactor];
        float v65 = v61 / (float)(v63 - v64);
        float v66 = 1.0;
        if (v65 <= 1.0)
        {
          [*(id *)(a1 + 104) baseZoomFactor];
          float v68 = a3 - v67;
          [*(id *)(a1 + 312) bravoShiftMitigationMaxZoomFactor];
          float v70 = v69;
          [*(id *)(a1 + 104) baseZoomFactor];
          float v66 = v68 / (float)(v70 - v71);
        }
        float64x2_t v163 = vmulq_n_f64(v163, (float)(v16 * v66));
        double v72 = -[BWMultiStreamCameraSourceNode _overscanWithFOVSacrifice](a1);
        double v74 = v73;
        [*(id *)(a1 + 312) overscanForShiftMitigation];
        if (v72 <= v75)
        {
          [*(id *)(a1 + 312) overscanForShiftMitigation];
          double v72 = v76;
        }
        [*(id *)(a1 + 312) overscanForShiftMitigation];
        if (v74 <= v77)
        {
          [*(id *)(a1 + 312) overscanForShiftMitigation];
          double v74 = v78;
        }
      }
      double v133 = v163.f64[0] / v151.f32[0];
      double v134 = v163.f64[1] / v34;
      v163.f64[0] = v133;
      v163.f64[1] = v134;
      double v135 = v72 * 0.5;
      if (v72 * 0.5 >= v133) {
        double v135 = v133;
      }
      if (v72 * -0.5 <= v135) {
        double v13 = v135;
      }
      else {
        double v13 = v72 * -0.5;
      }
      double v136 = v74 * 0.5;
      if (v74 * 0.5 >= v134) {
        double v136 = v134;
      }
      double v137 = v74 * -0.5 <= v136 ? v136 : v74 * -0.5;
      if (v13 != v133 || v137 != v134) {
LABEL_79:
      }
        FigDebugAssert3();
    }
  }
  return v13;
}

- (void)_HDRImageStatisticsDictFromMetadata:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F53F28]];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = *MEMORY[0x1E4F53A28];
    uint64_t v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F53A28]];
    uint64_t v6 = (void *)MEMORY[0x1E4F53A20];
    uint64_t v7 = (void *)MEMORY[0x1E4F24B60];
    long long v8 = (void *)MEMORY[0x1E4F53A18];
    long long v9 = (void *)MEMORY[0x1E4F24B58];
    long long v10 = (void *)MEMORY[0x1E4F53A08];
    long long v11 = (void *)MEMORY[0x1E4F24B50];
    uint64_t v12 = (void *)MEMORY[0x1E4F24B48];
    if (v5)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "objectForKeyedSubscript:", *v6), *v7);
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "objectForKeyedSubscript:", *v8), *v9);
      objc_msgSend((id)v13, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "objectForKeyedSubscript:", *v10), *v11);
      double v14 = (void *)MEMORY[0x1E4F24BF8];
      [(id)v13 setObject:*MEMORY[0x1E4F24BF8] forKeyedSubscript:*v12];
      float v15 = (void *)[v3 objectForKeyedSubscript:v4];
      float v16 = (void *)MEMORY[0x1E4F539F8];
      uint64_t v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F539F8]];
      uint64_t v18 = (void *)MEMORY[0x1E4F44FA8];
      [(id)v13 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F44FA8]];
      CFDictionaryRef v19 = (void *)[v3 objectForKeyedSubscript:v4];
      long long v20 = (void *)MEMORY[0x1E4F53A00];
      uint64_t v21 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F53A00]];
      uint64_t v22 = (void *)MEMORY[0x1E4F44FB0];
      [(id)v13 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F44FB0]];
    }
    else
    {
      double v14 = (void *)MEMORY[0x1E4F24BF8];
      float v16 = (void *)MEMORY[0x1E4F539F8];
      uint64_t v18 = (void *)MEMORY[0x1E4F44FA8];
      long long v20 = (void *)MEMORY[0x1E4F53A00];
      uint64_t v22 = (void *)MEMORY[0x1E4F44FB0];
      uint64_t v13 = 0;
    }
    uint64_t v23 = *MEMORY[0x1E4F53A10];
    if ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F53A10]])
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
      float64_t v25 = (void *)[v3 objectForKeyedSubscript:v23];
      uint64_t v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F53A20]];
      [(id)v24 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F24B60]];
      float64_t v27 = (void *)[v3 objectForKeyedSubscript:v23];
      uint64_t v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F53A18]];
      [(id)v24 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F24B58]];
      int v29 = (void *)[v3 objectForKeyedSubscript:v23];
      uint64_t v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F53A08]];
      [(id)v24 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F24B50]];
      [(id)v24 setObject:*v14 forKeyedSubscript:*MEMORY[0x1E4F24B48]];
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v23), "objectForKeyedSubscript:", *v16), *v18);
      objc_msgSend((id)v24, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v23), "objectForKeyedSubscript:", *v20), *v22);
    }
    else
    {
      uint64_t v24 = 0;
    }
    if (v13 | v24)
    {
      uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F24B40]];
      [v3 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F24B38]];
      return v3;
    }
    return 0;
  }
  return v3;
}

- (unint64_t)infraredProjectorUptimeInUsForLowPowerSparse
{
  return self->_infraredProjectorUptimeInUsForLowPowerSparse;
}

- (unint64_t)infraredProjectorUptimeInUsForHighPowerSparse
{
  return self->_infraredProjectorUptimeInUsForHighPowerSparse;
}

- ($2825F4736939C4A6D3AD43837233062D)firmwareStillImageDimensionsAfterOverscanCropping
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_firmwareStillImageDimensionsAfterOverscanCropping;
}

- (BWNodeOutput)secureDetectedObjectsOutput
{
  return self->_secureDetectedObjectsOutput;
}

- (BWNodeOutput)lightSourceMaskOutput
{
  return self->_lightSourceMaskOutput;
}

- (BWNodeOutput)keypointDescriptorDataOutput
{
  return self->_keypointDescriptorDataOutput;
}

- (BWNodeOutput)semanticMasksOutput
{
  return self->_semanticMasksOutput;
}

- (BWNodeOutput)eyeReliefStatusOutput
{
  return self->_eyeReliefStatusOutput;
}

- (BWNodeOutput)trackedFacesOutput
{
  return self->_trackedFacesOutput;
}

- (BWNodeOutput)preLTMThumbnailOutput
{
  return self->_preLTMThumbnailOutput;
}

- (BOOL)keepISPStreamingWhenStopping
{
  return self->_keepISPStreamingWhenStopping;
}

- (void)setKeepISPStreamingWhenStopping:(BOOL)a3
{
  self->_keepISPStreamingWhenStopping = a3;
}

- (BOOL)emitsFramesWhileStopping
{
  return self->_emitsFramesWhileStopping;
}

- (void)setEmitsFramesWhileStopping:(BOOL)a3
{
  self->_emitsFramesWhileStopping = a3;
}

- (BWDetectedFacesFilterDelegate)detectedFacesFilterDelegate
{
  return self->_detectedFacesFilterDelegate;
}

@end