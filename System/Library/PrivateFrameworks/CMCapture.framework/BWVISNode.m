@interface BWVISNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)outputDepthDimensions;
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (BOOL)firstFrameProcessed;
- (BOOL)flipHorizontalExcludingIris;
- (BOOL)frameRateConversionEnabled;
- (BOOL)generatesDroppedSampleMarkerBuffers;
- (BOOL)lowResImageUsedByVideoEncoderEnabled;
- (BOOL)personSegmentationRenderingEnabled;
- (BOOL)smartStyleRenderingEnabled;
- (BOOL)smartStyleReversibilityEnabled;
- (BOOL)sphereVideoEnabled;
- (BOOL)stabilizeDepthAttachments;
- (BOOL)videoGreenGhostMitigationEnabled;
- (BOOL)videoSTFEnabled;
- (BWFigCaptureISPProcessingSession)ispProcessingSession;
- (BWVISNode)initWithSensorIDDict:(id)a3 stabilizationMethod:(int)a4 stabilizationType:(int)a5 ispProcessingSession:(id)a6 maxSupportedFrameRate:(float)a7 activeMaxFrameRate:(float)a8 gpuPriority:(int)a9 metalSubmissionAndCompletionQueuePriority:(unsigned int)a10 motionAttachmentsSource:(int)a11 fillExtendedRowsOfOutputBuffer:(BOOL)a12 overCaptureEnabled:(BOOL)a13 stereoMode:(int)a14 videoStabilizationOverscanOverride:(float)a15 videoStabilizationStrength:(int)a16 zoomSmoothingEnabled:(BOOL)a17 applyFrameCropOffset:(BOOL)a18 motionMetadataPreloadingEnabled:(BOOL)a19 visExecutionMode:(int)a20 livePhotoCleanOutputRect:(CGRect)a21 cameraInfoByPortType:(id)a22 cvisExtendedLookAheadDuration:(float)a23 distortionCorrectionEnabledPortTypes:(id)a24 distortionCompensationEnabledPortTypes:(id)a25 minDistanceForBravoParallaxShift:(float)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(BOOL)a27 attachStabilizedOutputCameraTrajectory:(BOOL)a28;
- (OS_dispatch_semaphore)emitSampleBufferSemaphore;
- (double)_droppedSamplePTSFromSampleBuffer:(uint64_t)a3@<X8>;
- (double)_flushBuffers;
- (double)_tallyAndEmitDroppedSample:(uint64_t)a1;
- (id)_updateSupportedPixelFormats;
- (id)cameraExtrinsicMatrix;
- (id)irisStillImageMovieMetadataCache;
- (id)nodeSubType;
- (id)nodeType;
- (id)processingSemaphore;
- (int)cinematicLookAheadFrameCount;
- (int)maxLossyCompressionLevel;
- (int)outputColorSpaceProperties;
- (int)pipelineTraceID;
- (uint64_t)_attachHarvestedStabilizationMetadataToCinematographyFrame:(os_unfair_lock_s *)a1;
- (uint64_t)_cinematographyFrameForSampleBuffer:(uint64_t)a1;
- (uint64_t)_collectAttachedMediaForReprocessingFrom:(uint64_t)a3 offlineKey:(uint64_t)a4 offlineKeyData:(void *)a5 to:;
- (uint64_t)_collectMetadataForReprocessingFrom:(void *)a3 to:;
- (uint64_t)_findBestMotionTensorsInRingBufferWithKey:(CMTime *)a3 pts:;
- (uint64_t)_harvestMetadataFromSampleBuffer:(os_unfair_lock_s *)a1;
- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsData;
- (uint64_t)_setupVISProcessorController;
- (uint64_t)_stabilizeCinematographyMetadataInCinematographyFrame:(uint64_t)a1;
- (uint64_t)_stabilizeMetadataForSampleBuffer:(uint64_t)a1;
- (uint64_t)_tranformRectanglesInMetadata:(long long *)a3 pts:;
- (uint64_t)_updateInputRequirements;
- (void)_addMotionTensorsToRingBuffer:(uint64_t)a3 pts:;
- (void)_addVISDigitalZoomToMetadata:(const void *)a3 sampleBuffer:(int)a4 forReprocessing:;
- (void)_handleIrisKeyFrameCachingForSampleBuffer:(uint64_t)a1;
- (void)_releaseResources;
- (void)_tallyAndEmitSampleBuffer:(uint64_t)a1;
- (void)_tallyCompressedIOSurfaceStatsForSBuf:(uint64_t)a1;
- (void)_updateOutputRequirements;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setCameraExtrinsicMatrix:(id)a3;
- (void)setEmitSampleBufferSemaphore:(id)a3;
- (void)setFirstFrameProcessed:(BOOL)a3;
- (void)setFlipHorizontalExcludingIris:(BOOL)a3;
- (void)setFrameRateConversionEnabled:(BOOL)a3;
- (void)setGeneratesDroppedSampleMarkerBuffers:(BOOL)a3;
- (void)setIrisStillImageMovieMetadataCache:(id)a3;
- (void)setLowResImageUsedByVideoEncoderEnabled:(BOOL)a3;
- (void)setMaxLossyCompressionLevel:(int)a3;
- (void)setOutputColorSpaceProperties:(int)a3;
- (void)setOutputDepthDimensions:(id)a3;
- (void)setOutputDimensions:(id)a3;
- (void)setPersonSegmentationRenderingEnabled:(BOOL)a3;
- (void)setPipelineTraceID:(int)a3;
- (void)setProcessingSemaphore:(id)a3;
- (void)setSmartStyleRenderingEnabled:(BOOL)a3;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
- (void)setSphereVideoEnabled:(BOOL)a3;
- (void)setStabilizeDepthAttachments:(BOOL)a3;
- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3;
- (void)setVideoSTFEnabled:(BOOL)a3;
- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
@end

@implementation BWVISNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v52[4] = *MEMORY[0x1E4F143B8];
  v8 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    if (self->_visExecutionMode == 4)
    {
      output = self->super._output;
      [(BWNodeOutput *)output setFormat:a3];
    }
    else
    {
      if (self->_onlyGeneratingTransforms) {
        [(BWNodeOutput *)self->super._output setFormat:a3];
      }
      -[BWVISNode _updateOutputRequirements]((uint64_t)self);
    }
    return;
  }
  if (self->_personSegmentationRenderingEnabled
    && (([a5 isEqualToString:0x1EFA74460] & 1) != 0
     || self->_personSegmentationRenderingEnabled && ([a5 isEqualToString:0x1EFA744A0] & 1) != 0)
    || self->_stabilizeDepthAttachments && ([a5 isEqualToString:@"Depth"] & 1) != 0
    || self->_videoGreenGhostMitigationEnabled
    && self->_lightSourceMaskAndKeypointDescriptorDataEnabled
    && (([a5 isEqualToString:0x1EFA68B80] & 1) != 0
     || ([a5 isEqualToString:0x1EFA68BA0] & 1) != 0))
  {
    return;
  }
  if (!self->_smartStyleRenderingEnabled || ![v8 containsObject:a5])
  {
    v44.receiver = self;
    v44.super_class = (Class)BWVISNode;
    [(BWNode *)&v44 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
    return;
  }
  v52[0] = 0x1EFA74700;
  v52[1] = @"HumanSkinsMask";
  v52[2] = @"HumanFullBodiesMask";
  v52[3] = 0x1EFA748E0;
  v10 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
  if ([a5 isEqual:0x1EFA74840])
  {
    v11 = [BWPixelBufferPool alloc];
    uint64_t v12 = [(BWNodeOutput *)self->super._output retainedBufferCount];
    uint64_t v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v11, "initWithVideoFormat:capacity:name:memoryPool:", a3, v12, [NSString stringWithFormat:@"VIS %@ Intermediate Pool", 0x1EFA74840], -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
    if (v13)
    {
      v14 = (void *)v13;
      [(NSMutableDictionary *)self->_intermediatePixelBufferPools setObject:v13 forKeyedSubscript:0x1EFA74840];

      if (!self->_smartStyleReversibilityEnabled) {
        return;
      }
      v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      if (v15)
      {
        v16 = v15;
        uint64_t v17 = self->_smartStyleReversibilityUses4x3Spotlights ? 3 : 2;
        v18 = (void *)[MEMORY[0x1E4F55F18] configurationForUseCase:v17];
        uint64_t v19 = [v18 outputCoefficientsF16];
        [MEMORY[0x1E4F55F28] coefficientPixelBufferSizeForConfiguration:v18 float16:v19];
        double v21 = v20;
        double v23 = v22;
        v24 = objc_alloc_init(BWVideoFormatRequirements);
        if (v24)
        {
          v25 = v24;
          if (v19) {
            uint64_t v26 = 1278226536;
          }
          else {
            uint64_t v26 = 1278226534;
          }
          uint64_t v51 = [NSNumber numberWithUnsignedInt:v26];
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1]);
          [(BWVideoFormatRequirements *)v25 setWidth:(unint64_t)v21];
          [(BWVideoFormatRequirements *)v25 setHeight:(unint64_t)v23];
          [(BWVideoFormatRequirements *)v25 setWidthAlignment:16];
          [(BWVideoFormatRequirements *)v25 setHeightAlignment:16];
          [(BWNodeOutputMediaConfiguration *)v16 setFormatRequirements:v25];
          [(BWNodeOutputMediaConfiguration *)v16 setPassthroughMode:0];
          [(BWNodeOutputMediaConfiguration *)v16 setProvidesPixelBufferPool:1];
          v27 = self->super._output;
          id v28 = @"SmartStyleStreamingReverseLearnedCoefficients";
          v29 = v16;
          goto LABEL_56;
        }
      }
    }
LABEL_59:
    fig_log_get_emitter();
LABEL_58:
    FigDebugAssert3();
    return;
  }
  if (![a5 isEqual:0x1EFA748A0])
  {
    if (!self->_smartStyleReversibilityEnabled || ![v10 containsObject:a5]) {
      return;
    }
    v39 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    if (v39)
    {
      v40 = v39;
      if ([a5 isEqual:0x1EFA748E0])
      {
        v41 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v41 setSupportedPixelFormats:&unk_1EFB03B30];
        -[BWVideoFormatRequirements setWidth:](v41, "setWidth:", [a3 width]);
        -[BWVideoFormatRequirements setHeight:](v41, "setHeight:", [a3 height]);
        [(BWVideoFormatRequirements *)v41 setWidthAlignment:16];
        [(BWVideoFormatRequirements *)v41 setHeightAlignment:16];
        [(BWVideoFormatRequirements *)v41 setSupportedColorSpaceProperties:&unk_1EFB03B48];
        [(BWVideoFormatRequirements *)v41 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
      }
      else
      {
        v41 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [a3 pixelBufferAttributes]);
      }
      if (v41)
      {
        [(BWNodeOutputMediaConfiguration *)v40 setFormatRequirements:v41];
        [(BWNodeOutputMediaConfiguration *)v40 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v40 setProvidesPixelBufferPool:1];
        v27 = self->super._output;
        v29 = v40;
        id v28 = a5;
LABEL_56:
        [(BWNodeOutput *)v27 setMediaConfiguration:v29 forAttachedMediaKey:v28];
        return;
      }
    }
    goto LABEL_59;
  }
  if (self->_smartStyleReversibilityEnabled)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v49[0] = 0x1EFA748A0;
    v49[1] = 0x1EFA748C0;
    id obj = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          v35 = [BWPixelBufferPool alloc];
          uint64_t v36 = [(BWNodeOutput *)self->super._output retainedBufferCount];
          uint64_t v37 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v35, "initWithVideoFormat:capacity:name:memoryPool:", a3, v36, [NSString stringWithFormat:@"VIS %@ Intermediate Pool", v34], -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
          if (!v37)
          {
            fig_log_get_emitter();
            goto LABEL_58;
          }
          v38 = (void *)v37;
          [(NSMutableDictionary *)self->_intermediatePixelBufferPools setObject:v37 forKeyedSubscript:v34];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }
  }
}

- (uint64_t)_updateInputRequirements
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "formatRequirements"), "setSupportedPixelFormats:", *(void *)(result + 128));
    unsigned int v22 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "primaryMediaConfiguration"), "delayedBufferCount");
    double v2 = BWSmartStyleLearningMaxFrameRate();
    double v3 = *(double *)(v1 + 232);
    v4 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
    double v20 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(0, 1);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
    uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      unsigned int v21 = vcvtpd_s64_f64(v2 / v3 * (double)(int)v22);
      uint64_t v18 = v1;
      do
      {
        uint64_t v8 = 0;
        uint64_t v19 = v6;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
          if ((!*(unsigned char *)(v1 + 688)
             || ([v4 containsObject:*(void *)(*((void *)&v24 + 1) + 8 * v8)] & 1) == 0)
            && (!*(unsigned char *)(v1 + 689) || ![v20 containsObject:v9]))
          {
            goto LABEL_21;
          }
          v10 = objc_alloc_init(BWNodeInputMediaConfiguration);
          [(BWNodeInputMediaConfiguration *)v10 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
          [(BWNodeInputMediaConfiguration *)v10 setPassthroughMode:0];
          if ([(id)BWAttachedMediaKeysAvailableOnSmartStyleLearnedFramesOnly() containsObject:v9])uint64_t v11 = v21; {
          else
          }
            uint64_t v11 = v22;
          [(BWNodeInputMediaConfiguration *)v10 setDelayedBufferCount:v11];
          if ([v9 isEqual:0x1EFA74840])
          {
            unsigned int v12 = [(BWNodeInputMediaConfiguration *)v10 delayedBufferCount];
            if (v12 <= [*(id *)(v1 + 104) cinematicLookAheadFrameCount] + 1) {
              uint64_t v13 = [*(id *)(v1 + 104) cinematicLookAheadFrameCount] + 1;
            }
            else {
              uint64_t v13 = [(BWNodeInputMediaConfiguration *)v10 delayedBufferCount];
            }
            [(BWNodeInputMediaConfiguration *)v10 setDelayedBufferCount:v13];
            uint64_t v1 = v18;
            uint64_t v6 = v19;
          }
          if ([v9 isEqual:0x1EFA68BE0] && !*(unsigned char *)(v1 + 172)) {
LABEL_21:
          }
            v10 = 0;
          [*(id *)(v1 + 8) setMediaConfiguration:v10 forAttachedMediaKey:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }
    if (*(unsigned char *)(v1 + 704))
    {
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v14 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v14 setPassthroughMode:0];
      [(BWNodeInputMediaConfiguration *)v14 setDelayedBufferCount:v22];
      [*(id *)(v1 + 8) setMediaConfiguration:v14 forAttachedMediaKey:0x1EFA74460];
      v15 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v15 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v15 setPassthroughMode:0];
      [(BWNodeInputMediaConfiguration *)v15 setDelayedBufferCount:v22];
    }
    else
    {
      [*(id *)(v1 + 8) setMediaConfiguration:0 forAttachedMediaKey:0x1EFA74460];
      v15 = 0;
    }
    [*(id *)(v1 + 8) setMediaConfiguration:v15 forAttachedMediaKey:0x1EFA744A0];
    if (*(unsigned char *)(v1 + 173) && *(unsigned char *)(v1 + 175))
    {
      v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:0];
      [(BWNodeInputMediaConfiguration *)v16 setDelayedBufferCount:v22];
      [*(id *)(v1 + 8) setMediaConfiguration:v16 forAttachedMediaKey:0x1EFA68B80];
      uint64_t v17 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v17 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v17 setPassthroughMode:0];
      [(BWNodeInputMediaConfiguration *)v17 setDelayedBufferCount:v22];
    }
    else
    {
      [*(id *)(v1 + 8) setMediaConfiguration:0 forAttachedMediaKey:0x1EFA68B80];
      uint64_t v17 = 0;
    }
    return [*(id *)(v1 + 8) setMediaConfiguration:v17 forAttachedMediaKey:0x1EFA68BA0];
  }
  return result;
}

BOOL __38__BWVISNode__updateOutputRequirements__block_invoke(unsigned __int8 *a1, void *a2)
{
  int v3 = [a2 intValue];
  return a1[32] == FigCapturePixelFormatIsTenBit(v3)
      && a1[33] == FigCapturePixelFormatIs422(v3)
      && a1[34] == FigCapturePixelFormatIsFullRange(v3);
}

- (void)_updateOutputRequirements
{
  v35[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v2 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
    uint64_t v3 = *(unsigned int *)(a1 + 600);
    if (v3
      || (uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "colorSpaceProperties"), v3))
    {
      v35[0] = [NSNumber numberWithInt:v3];
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    }
    else
    {
      uint64_t v4 = 0;
    }
    [(BWVideoFormatRequirements *)v2 setSupportedColorSpaceProperties:v4];
    if (*(_DWORD *)(a1 + 180) != 4)
    {
      uint64_t v5 = (void *)[*(id *)(a1 + 8) videoFormat];
      uint64_t v6 = v5;
      if (*(_DWORD *)(a1 + 148) && *(_DWORD *)(a1 + 152))
      {
        -[BWVideoFormatRequirements setWidth:](v2, "setWidth:");
        uint64_t v7 = *(int *)(a1 + 152);
      }
      else
      {
        -[BWVideoFormatRequirements setWidth:](v2, "setWidth:", [v5 width]);
        uint64_t v7 = [v6 height];
      }
      [(BWVideoFormatRequirements *)v2 setHeight:v7];
      if (v6)
      {
        char IsFullRange = FigCapturePixelFormatIsFullRange([v6 pixelFormat]);
        char IsTenBit = FigCapturePixelFormatIsTenBit([v6 pixelFormat]);
        char v10 = FigCapturePixelFormatIs422([v6 pixelFormat]);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __38__BWVISNode__updateOutputRequirements__block_invoke;
        v30[3] = &__block_descriptor_35_e35_B24__0__NSNumber_8__NSDictionary_16l;
        char v31 = IsTenBit;
        char v32 = v10;
        char v33 = IsFullRange;
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 136), "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v30));
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 136);
      }
      [(BWVideoFormatRequirements *)v2 setSupportedPixelFormats:v11];
      unint64_t v12 = 0x1E5C1E000uLL;
      if (*(unsigned char *)(a1 + 665))
      {
        uint64_t v13 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v14 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v14 setSupportedPixelFormats:&unk_1EFB03B90];
        [(BWVideoFormatRequirements *)v14 setWidth:*(int *)(a1 + 668)];
        [(BWVideoFormatRequirements *)v14 setHeight:*(int *)(a1 + 672)];
        [(BWNodeOutputMediaConfiguration *)v13 setFormatRequirements:v14];
        [(BWNodeOutputMediaConfiguration *)v13 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v13 setProvidesPixelBufferPool:1];
      }
      else
      {
        uint64_t v13 = 0;
      }
      [*(id *)(a1 + 16) setMediaConfiguration:v13 forAttachedMediaKey:@"Depth"];
      if (*(unsigned char *)(a1 + 689))
      {
        long long v25 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v15 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v15 setSupportedPixelFormats:&unk_1EFB03BA8];
        v16 = objc_opt_new();
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v17 = [(BWVideoFormatRequirements *)v2 supportedColorSpaceProperties];
        uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              if ([*(id *)(*((void *)&v26 + 1) + 8 * i) intValue] == 3) {
                unsigned int v22 = &unk_1EFB008F0;
              }
              else {
                unsigned int v22 = &unk_1EFB00908;
              }
              [v16 addObject:v22];
            }
            uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v19);
        }
        [(BWVideoFormatRequirements *)v15 setWidth:[(BWVideoFormatRequirements *)v2 width]];
        [(BWVideoFormatRequirements *)v15 setHeight:[(BWVideoFormatRequirements *)v2 height]];
        [(BWVideoFormatRequirements *)v15 setWidthAlignment:[(BWVideoFormatRequirements *)v2 widthAlignment]];
        [(BWVideoFormatRequirements *)v15 setHeightAlignment:[(BWVideoFormatRequirements *)v2 heightAlignment]];
        [(BWVideoFormatRequirements *)v15 setSupportedColorSpaceProperties:v16];
        [(BWVideoFormatRequirements *)v15 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
        [(BWNodeOutputMediaConfiguration *)v25 setFormatRequirements:v15];
        [(BWNodeOutputMediaConfiguration *)v25 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v25 setProvidesPixelBufferPool:1];
        [*(id *)(a1 + 16) setMediaConfiguration:v25 forAttachedMediaKey:0x1EFA74900];

        unint64_t v12 = 0x1E5C1E000;
      }
      else
      {
        [*(id *)(a1 + 16) setMediaConfiguration:0 forAttachedMediaKey:0x1EFA74900];
      }
      if (*(unsigned char *)(a1 + 692))
      {
        id v23 = objc_alloc_init(*(Class *)(v12 + 3184));
        long long v24 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v24 setSupportedPixelFormats:&unk_1EFB03BC0];
        [(BWVideoFormatRequirements *)v24 setWidth:[(BWVideoFormatRequirements *)v2 width] >> 2];
        [(BWVideoFormatRequirements *)v24 setHeight:[(BWVideoFormatRequirements *)v2 height] >> 2];
        [v23 setFormatRequirements:v24];
        [v23 setPassthroughMode:0];
        [v23 setProvidesPixelBufferPool:1];
        [*(id *)(a1 + 16) setMediaConfiguration:v23 forAttachedMediaKey:0x1EFA74940];
      }
    }
    if (*(unsigned char *)(a1 + 161))
    {

      *(void *)(a1 + 200) = v2;
      double v2 = objc_alloc_init(BWVideoFormatRequirements);
    }
    [*(id *)(a1 + 16) setFormatRequirements:v2];
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (void)setVideoSTFEnabled:(BOOL)a3
{
  if (!a3
    || ((int stabilizationType = self->_stabilizationType, stabilizationType != 4)
      ? (BOOL v4 = stabilizationType == 2)
      : (BOOL v4 = 1),
        v4))
  {
    self->_videoSTFEnabled = a3;
  }
}

- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3
{
  if (!a3
    || ((int stabilizationType = self->_stabilizationType, stabilizationType != 4)
      ? (BOOL v4 = stabilizationType == 2)
      : (BOOL v4 = 1),
        v4))
  {
    if (self->_videoGreenGhostMitigationEnabled != a3)
    {
      self->_videoGreenGhostMitigationEnabled = a3;
      -[BWVISNode _updateInputRequirements]((uint64_t)self);
    }
  }
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  self->_sphereVideoEnabled = a3;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  if (self->_smartStyleReversibilityEnabled != a3)
  {
    self->_smartStyleReversibilityEnabled = a3;
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  if (self->_smartStyleRenderingEnabled != a3)
  {
    self->_smartStyleRenderingEnabled = a3;
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
  }
}

- (void)setPipelineTraceID:(int)a3
{
  self->_pipelineTraceID = a3;
}

- (void)setPersonSegmentationRenderingEnabled:(BOOL)a3
{
  if (self->_personSegmentationRenderingEnabled != a3)
  {
    self->_personSegmentationRenderingEnabled = a3;
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
  }
}

- (void)setOutputDimensions:(id)a3
{
  if (self->_outputDimensions.width != a3.var0 || self->_outputDimensions.height != a3.var1)
  {
    self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    self->_maxLossyCompressionLevel = a3;
    -[BWVISNode _updateSupportedPixelFormats]((id *)&self->super.super.isa);
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (id)_updateSupportedPixelFormats
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*((_DWORD *)result + 25) - 3) > 1)
    {
      uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
      [v3 addObjectsFromArray:&unk_1EFB03B78];
      if (*((_DWORD *)v1 + 25) == 2) {
        objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 1, *((_DWORD *)v1 + 36)));
      }

      v1[16] = (id)[v3 copy];
      result = (id *)[v3 copy];
      goto LABEL_16;
    }
    if (FigCapturePlatformSupportsUniversalCompression()) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = FigCapturePlatformSupportsHTPC16x8Compression() != 0;
    }
    BOOL v4 = FigCapturePlatformSupportsUniversalLossyCompression() != 0;
    BOOL v5 = *((_DWORD *)v1 + 25) == 4;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __41__BWVISNode__updateSupportedPixelFormats__block_invoke;
    v15 = &unk_1E5C298A8;
    char v6 = v5;
    BOOL v17 = v2;
    char v18 = v6;
    BOOL v19 = v4;
    v16 = v1;
    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:&v12];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v1[13], "ispProcessingSession", v12, v13, v14, v15), "getProperty:error:", @"InputPixelBufferAttributes", 0);
    v9 = (void *)MEMORY[0x1E4F24D70];
    if (v8)
    {
      char v10 = (void *)v8;

      v1[16] = (id)objc_msgSend((id)visn_pixelFormatsArrayFromPixelFormatTypeValue(objc_msgSend(v10, "objectForKeyedSubscript:", *v9)), "filteredArrayUsingPredicate:", v7);
    }
    result = (id *)objc_msgSend((id)objc_msgSend(v1[13], "ispProcessingSession"), "getProperty:error:", @"OutputPixelBufferAttributes", 0);
    if (result)
    {
      uint64_t v11 = result;

      result = (id *)(id)objc_msgSend((id)visn_pixelFormatsArrayFromPixelFormatTypeValue(objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"PrimaryScaler"), "objectForKeyedSubscript:", *v9)), "filteredArrayUsingPredicate:", v7);
LABEL_16:
      v1[17] = result;
    }
  }
  return result;
}

- (void)setLowResImageUsedByVideoEncoderEnabled:(BOOL)a3
{
  if (self->_lowResImageUsedByVideoEncoderEnabled != a3)
  {
    self->_lowResImageUsedByVideoEncoderEnabled = a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setFrameRateConversionEnabled:(BOOL)a3
{
  self->_frameRateConversionEnabled = a3;
}

- (void)setFlipHorizontalExcludingIris:(BOOL)a3
{
  self->_flipHorizontalExcludingIris = a3;
}

- (void)setEmitSampleBufferSemaphore:(id)a3
{
  emitSampleBufferSemaphore = self->_emitSampleBufferSemaphore;
  if (emitSampleBufferSemaphore != a3)
  {

    self->_emitSampleBufferSemaphore = (OS_dispatch_semaphore *)a3;
  }
}

- (void)setIrisStillImageMovieMetadataCache:(id)a3
{
  self->_irisStillImageMovieMetadataCache = (BWIrisStillImageMovieMetadataCache *)a3;
}

- (void)setGeneratesDroppedSampleMarkerBuffers:(BOOL)a3
{
  self->_generatesDroppedSampleMarkerBuffers = a3;
}

- (int)cinematicLookAheadFrameCount
{
  return self->_cinematicLookAheadFrameCount;
}

- (BWVISNode)initWithSensorIDDict:(id)a3 stabilizationMethod:(int)a4 stabilizationType:(int)a5 ispProcessingSession:(id)a6 maxSupportedFrameRate:(float)a7 activeMaxFrameRate:(float)a8 gpuPriority:(int)a9 metalSubmissionAndCompletionQueuePriority:(unsigned int)a10 motionAttachmentsSource:(int)a11 fillExtendedRowsOfOutputBuffer:(BOOL)a12 overCaptureEnabled:(BOOL)a13 stereoMode:(int)a14 videoStabilizationOverscanOverride:(float)a15 videoStabilizationStrength:(int)a16 zoomSmoothingEnabled:(BOOL)a17 applyFrameCropOffset:(BOOL)a18 motionMetadataPreloadingEnabled:(BOOL)a19 visExecutionMode:(int)a20 livePhotoCleanOutputRect:(CGRect)a21 cameraInfoByPortType:(id)a22 cvisExtendedLookAheadDuration:(float)a23 distortionCorrectionEnabledPortTypes:(id)a24 distortionCompensationEnabledPortTypes:(id)a25 minDistanceForBravoParallaxShift:(float)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(BOOL)a27 attachStabilizedOutputCameraTrajectory:(BOOL)a28
{
  long long v28 = self;
  if (!a3) {
    goto LABEL_89;
  }
  uint64_t v30 = *(void *)&a9;
  double height = a21.size.height;
  double width = a21.size.width;
  double y = a21.origin.y;
  double x = a21.origin.x;
  id v42 = a3;
  if (a5 != 2 && ((a5 - 5) < 0xFFFFFFFE || !a6 || a20 == 3 || self->_onlyGeneratingTransforms)) {
    goto LABEL_89;
  }
  v80.receiver = self;
  v80.super_class = (Class)BWVISNode;
  long long v28 = [(BWNode *)&v80 init];
  if (!v28) {
    return v28;
  }
  id v79 = a6;
  v81.origin.double x = x;
  v81.origin.double y = y;
  v81.size.double width = width;
  v81.size.double height = height;
  BOOL v43 = !CGRectIsEmpty(v81) && (a4 == 3 || a4 == 5);
  v82.origin.double x = x;
  v82.origin.double y = y;
  v82.size.double width = width;
  v82.size.double height = height;
  LODWORD(v78) = CGRectIsEmpty(v82);
  HIDWORD(v78) = v43;
  v28->_stabilizationMethod = a4;
  v28->_int stabilizationType = a5;
  v28->_fillExtendedRowsOfOutputBuffer = a12;
  v28->_int visExecutionMode = a20;
  if (a23 == 0.0) {
    a23 = 0.5;
  }
  v28->_usingExtendedCVISLivePhotoStabilization = v43;
  v28->_cinematicLookAheadFrameCount = 0;
  long long v45 = (_OWORD *)MEMORY[0x1E4F1F9F8];
  v28->_lastEmittedPTS.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *(_OWORD *)&v28->_lastEmittedPTS.value = *v45;
  v28->_onlyGeneratingTransforms = (v28->_visExecutionMode < 6u) & (0x26u >> v28->_visExecutionMode);
  int visExecutionMode = v28->_visExecutionMode;
  BOOL v47 = visExecutionMode == 3 || visExecutionMode == 0;
  BOOL v48 = v47;
  v28->_stabilizeMetadata = v48;
  v28->_pipelineTraceID = 81;
  v28->_videoStabilizationOverscanOverride = a15;
  v28->_gpuPrioritdouble y = v30;
  v28->_lightSourceMaskAndKeypointDescriptorDataEnabled = a27;
  v28->_lowLightGreenGhostMitigationEnabled = 1;
  v28->_uint64_t stereoMode = a14;
  v28->_smartStyleReversibilityUses4x3Spotlights = 1;
  float v49 = fmaxf(a8, 30.0);
  v28->_maxFrameRate = v49;
  v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v28->_intermediatePixelBufferPools = v50;
  if (!v50) {
    goto LABEL_89;
  }
  LODWORD(v30) = vcvtps_s32_f32(v49 * a23);
  int v51 = v28->_visExecutionMode;
  if (v51 != 4)
  {
    uint64_t v54 = 0;
    int v76 = v43 | v78;
    unsigned int v77 = 1;
    if (a4 > 5)
    {
      uint64_t stereoMode = 0;
    }
    else
    {
      int v55 = 1 << a4;
      uint64_t stereoMode = 0;
      if ((v55 & 0x2C) != 0)
      {
        uint64_t v54 = 0;
        uint64_t stereoMode = 4;
        unsigned int v77 = 1;
        if (v51 != 2 && v51 != 5)
        {
          if (v51 == 3)
          {
            uint64_t v54 = 0;
            uint64_t stereoMode = 5;
LABEL_42:
            int v57 = 1;
            goto LABEL_43;
          }
          if (v78)
          {
            if (a19)
            {
              uint64_t v54 = 0;
              v28->_cinematicLookAheadFrameCount = v30;
              uint64_t stereoMode = 2;
              goto LABEL_42;
            }
            uint64_t stereoMode = v28->_stereoMode;
            if (stereoMode == 1)
            {
              uint64_t v54 = 3;
            }
            else
            {
              if (stereoMode == 2)
              {
                uint64_t v54 = 0;
                uint64_t stereoMode = 4;
                goto LABEL_42;
              }
              uint64_t v54 = 0;
              uint64_t stereoMode = 1;
            }
          }
          else
          {
            uint64_t v54 = 0;
            uint64_t stereoMode = 3;
          }
          int v57 = v30 + 1;
LABEL_43:
          unsigned int v77 = v57;
        }
      }
    }
    if (a5 == 2 && a7 >= 120.0)
    {
      id v42 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v42];
      uint64_t v58 = [NSNumber numberWithInt:0];
      [v42 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4F535D0]];
    }
    if (![a24 count] && !objc_msgSend(a25, "count") || a5 == 4 || a5 == 2)
    {
      v59 = objc_alloc_init(BWVISProcessorControllerConfiguration);
      v28->_processorControllerConfiguration = v59;
      if (v59)
      {
        [(BWVISProcessorControllerConfiguration *)v59 setSensorIDDict:v42];
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setSmoothingMethod:stereoMode];
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setMotionBlurShimmerMitigationMethod:v54];
        *(float *)&double v60 = a23;
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setCinematicLookAheadTime:v60];
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setCinematicLookAheadFrameCount:v30];
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setUseISPMotionData:(a11 - 1) < 2];
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setSphereCorrectionEnabled:a11 == 2];
        *(float *)&double v61 = a26;
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setMinDistanceForBravoParallaxShift:v61];
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setIspProcessingSession:a6];
        [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setMetalSubmissionAndCompletionQueuePriority:a10];
        if ([a24 count]) {
          [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setDistortionCorrectionEnabledPortTypes:a24];
        }
        if ([a25 count]) {
          [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setDistortionCompensationEnabledPortTypes:a25];
        }
        if (stereoMode == 2 || !a19)
        {
          if ((v43 | v78 ^ 1) != 1) {
            goto LABEL_61;
          }
          if (((stereoMode != 3) & ~v76) == 0)
          {
            -[BWVISProcessorControllerConfiguration setLivePhotoCleanOutputRect:](v28->_processorControllerConfiguration, "setLivePhotoCleanOutputRect:", x, y, width, height);
            [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setBlurBorderPixels:1];
LABEL_61:
            [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setAttachStabilizedOutputCameraTrajectory:a28];
            if (a13)
            {
              int v62 = v28->_visExecutionMode;
              if ((v62 & 0xFFFFFFFE) == 2)
              {
LABEL_65:
                if (v62 == 3)
                {
                  BOOL v63 = 1;
                }
                else
                {
                  [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setAttachStabilizedTrajectoryHomography:1];
                  BOOL v63 = v28->_visExecutionMode > 2u;
                }
                if ((v76 & v63 & 1) == 0) {
                  [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setAttachEstimatedMotionVector:1];
                }
                if (v28->_onlyGeneratingTransforms) {
                  [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setOnlyGenerateTransformsParameters:1];
                }
                [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setEnableRollingShutterCorrectionOnly:v28->_visExecutionMode == 5];
                BOOL v65 = stereoMode == 4 && v28->_visExecutionMode == 5;
                v28->_overrideFinalCropRect = v65;
                -[BWVISProcessorControllerConfiguration setDisableTransformLimitsForPredeterminedTrajectory:](v28->_processorControllerConfiguration, "setDisableTransformLimitsForPredeterminedTrajectory:");
                if ((stereoMode - 1) <= 3)
                {
                  -[BWVISProcessorControllerConfiguration setUseCameraGeometry:](v28->_processorControllerConfiguration, "setUseCameraGeometry:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters videoStabilizationParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "videoStabilizationParameters"), "objectForKeyedSubscript:", @"UseCameraGeometry"), "BOOLValue"));
                  processorControllerConfiguration = v28->_processorControllerConfiguration;
                  int v67 = v28->_stereoMode;
                  unsigned int v68 = [(BWVISProcessorControllerConfiguration *)processorControllerConfiguration useCameraGeometry];
                  if (v67) {
                    uint64_t v69 = 1;
                  }
                  else {
                    uint64_t v69 = v68;
                  }
                  [(BWVISProcessorControllerConfiguration *)processorControllerConfiguration setUseCameraGeometry:v69];
                }
                [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setCameraInfoByPortType:a22];
                [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setVideoStabilizationStrength:a16];
                v28->_zoomSmoothingEnabled = a17;
                [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setZoomSmoothingEnabled:a17];
                [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setApplyFrameCropOffset:a18];
                id v53 = a6;
                uint64_t v52 = v77;
                goto LABEL_84;
              }
              [(BWVISProcessorControllerConfiguration *)v28->_processorControllerConfiguration setAttachStabilizedOutputCameraTrajectory:1];
            }
            int v62 = v28->_visExecutionMode;
            goto LABEL_65;
          }
        }
      }
    }
LABEL_89:

    return 0;
  }
  v28->_cinematicLookAheadFrameCount = v30;
  v28->_offlineCameraInfoByPortType = (NSDictionary *)a22;
  uint64_t v52 = 1;
  id v53 = v79;
LABEL_84:
  BOOL v70 = v28->_onlyGeneratingTransforms || v28->_visExecutionMode == 4;
  -[BWVISNode _updateSupportedPixelFormats]((id *)&v28->super.super.isa);
  v71 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v28];
  v72 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWNodeInput *)v71 setFormatRequirements:v72];
  [(BWNodeInput *)v71 setDelayedBufferCount:v52];
  [(BWNodeInput *)v71 setPassthroughMode:v70];

  [(BWNode *)v28 addInput:v71];
  -[BWVISNode _updateInputRequirements]((uint64_t)v28);
  v73 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v28];
  v74 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWNodeOutput *)v73 setFormatRequirements:v74];
  [(BWNodeOutput *)v73 setPassthroughMode:v70];
  [(BWNodeOutput *)v73 setOwningNodeRetainedBufferCount:1];

  [(BWNode *)v28 addOutput:v73];
  -[BWVISNode _updateOutputRequirements]((uint64_t)v28);

  v28->_limitedGMErrorLogger = [[BWLimitedGMErrorLogger alloc] initWithName:@"VIS" maxLoggingCount:10];
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[0].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[0].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[1].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[1].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[2].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[2].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[3].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[3].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[4].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[4].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[5].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[5].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[6].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[6].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[7].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[7].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[8].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[8].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[9].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[9].framePTS.timescale = 0u;
  v28->_frameMotionTensorsRingBuffeLock._os_unfair_lock_opaque = 0;
  v28->_processingSemaphore = 0;
  v28->_ispProcessingSession = (BWFigCaptureISPProcessingSession *)v53;
  return v28;
}

+ (void)initialize
{
}

- (void)dealloc
{
  -[BWVISNode _releaseResources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWVISNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {

    *(void *)(a1 + 752) = 0;
    *(void *)(a1 + 112) = 0;

    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 128) = 0;

    *(void *)(a1 + 136) = 0;
    *(void *)(a1 + 208) = 0;

    *(void *)(a1 + 184) = 0;
    *(void *)(a1 + 200) = 0;

    *(void *)(a1 + 240) = 0;
    if (*(void *)(a1 + 256)) {
      [*(id *)(a1 + 264) logErrorNumber:0xFFFFFFFFLL, objc_msgSend(NSString, "stringWithFormat:", @"unprocessed still frame settings ID %@", *(void *)(a1 + 256)) errorString];
    }

    *(void *)(a1 + 248) = 0;
    *(void *)(a1 + 256) = 0;

    *(void *)(a1 + 264) = 0;
    *(void *)(a1 + 608) = 0;

    *(void *)(a1 + 680) = 0;
    BOOL v2 = *(const void **)(a1 + 696);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 696) = 0;
    }

    *(void *)(a1 + 712) = 0;
    *(void *)(a1 + 720) = 0;

    uint64_t v3 = 0;
    *(void *)(a1 + 728) = 0;
    do
    {

      *(void *)(a1 + 272 + v3) = 0;
      v3 += 32;
    }
    while (v3 != 320);
    *(_OWORD *)(a1 + 560) = 0u;
    *(_OWORD *)(a1 + 576) = 0u;
    *(_OWORD *)(a1 + 528) = 0u;
    *(_OWORD *)(a1 + 544) = 0u;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    BOOL v4 = *(NSObject **)(a1 + 744);
    if (v4)
    {
      dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 744));

      *(void *)(a1 + 744) = 0;
    }
  }
}

- (double)_flushBuffers
{
  if (a1)
  {
    if (*(void *)(a1 + 112))
    {
      *(unsigned char *)(a1 + 120) = 1;
      [*(id *)(a1 + 112) finishPendingProcessing];
      *(unsigned char *)(a1 + 120) = 0;
    }
    [*(id *)(a1 + 264) resetCurrentLoggingCounter];
    for (uint64_t i = 0; i != 320; i += 32)

    double result = 0.0;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
    *(_OWORD *)(a1 + 528) = 0u;
    *(_OWORD *)(a1 + 544) = 0u;
    *(_OWORD *)(a1 + 560) = 0u;
    *(_OWORD *)(a1 + 576) = 0u;
  }
  return result;
}

- (id)nodeSubType
{
  return @"VideoStabilizer";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  BOOL v2 = self;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (self->_smartStyleRenderingEnabled)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:");
    BOOL v4 = v3;
    if (v2->_smartStyleReversibilityEnabled)
    {
      [v3 addObject:0x1EFA74700];
      [v4 addObject:@"HumanSkinsMask"];
      [v4 addObject:@"HumanFullBodiesMask"];
      [v4 addObject:0x1EFA74860];
      [v4 addObject:0x1EFA748E0];
      [v4 addObject:0x1EFA74900];
    }
    int v52 = objc_msgSend(-[BWNodeInput mediaConfigurationForAttachedMediaKey:](v2->super._input, "mediaConfigurationForAttachedMediaKey:", @"PrimaryFormat"), "delayedBufferCount");
    uint64_t v5 = 16;
    id v6 = [(BWNodeOutput *)v2->super._output mediaPropertiesForAttachedMediaKey:@"PrimaryFormat"];
    id v7 = [(BWNodeOutput *)v2->super._output mediaConfigurationForAttachedMediaKey:@"PrimaryFormat"];
    int v8 = [v6 resolvedRetainedBufferCount];
    if (v8 <= (int)[v7 owningNodeRetainedBufferCount]) {
      int v9 = [v7 owningNodeRetainedBufferCount];
    }
    else {
      int v9 = [v6 resolvedRetainedBufferCount];
    }
    int v53 = v9;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v10 = [v4 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unsigned int v12 = 0;
      uint64_t v13 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v64 != v13) {
            objc_enumerationMutation(v4);
          }
          uint64_t v15 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          v16 = (void *)[*(id *)((char *)&v2->super.super.isa + v5) mediaPropertiesForAttachedMediaKey:v15];
          uint64_t v17 = [*(id *)((char *)&v2->super.super.isa + v5) mediaConfigurationForAttachedMediaKey:v15];
          if (v16) {
            BOOL v18 = v17 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            BOOL v19 = (void *)v17;
            uint64_t v20 = v5;
            uint64_t v21 = v11;
            uint64_t v22 = v13;
            id v23 = v2;
            int v24 = v12;
            long long v25 = v4;
            int v26 = [v16 resolvedRetainedBufferCount];
            if (v26 <= (int)[v19 owningNodeRetainedBufferCount]) {
              int v27 = [v19 owningNodeRetainedBufferCount];
            }
            else {
              int v27 = [v16 resolvedRetainedBufferCount];
            }
            int v28 = v27;
            int v29 = v53;
            BOOL v4 = v25;
            if (v27 < v53)
            {
              objc_msgSend(v19, "setOwningNodeRetainedBufferCount:");
              int v29 = v53;
            }
            if (v28 <= v29) {
              int v30 = v29;
            }
            else {
              int v30 = v28;
            }
            if (v24 <= v30) {
              unsigned int v12 = v30;
            }
            else {
              unsigned int v12 = v24;
            }
            BOOL v2 = v23;
            uint64_t v13 = v22;
            uint64_t v11 = v21;
            uint64_t v5 = v20;
          }
        }
        uint64_t v11 = [v4 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v11);
    }
    else
    {
      unsigned int v12 = 0;
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v69 = 0x1EFA74840;
    char v31 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v60;
      if (v52 <= 3) {
        uint64_t v35 = 3;
      }
      else {
        uint64_t v35 = v52;
      }
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v60 != v34) {
            objc_enumerationMutation(v31);
          }
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v2->_intermediatePixelBufferPools, "objectForKeyedSubscript:", *(void *)(*((void *)&v59 + 1) + 8 * j)), "setCapacity:", v35);
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v33);
    }
    if (v2->_smartStyleReversibilityEnabled)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v67[0] = 0x1EFA748A0;
      v67[1] = 0x1EFA748C0;
      uint64_t v37 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v55 objects:v68 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v56;
        uint64_t v41 = v12;
        do
        {
          for (uint64_t k = 0; k != v39; ++k)
          {
            if (*(void *)v56 != v40) {
              objc_enumerationMutation(v37);
            }
            objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v2->_intermediatePixelBufferPools, "objectForKeyedSubscript:", *(void *)(*((void *)&v55 + 1) + 8 * k)), "setCapacity:", v41);
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v55 objects:v68 count:16];
        }
        while (v39);
      }
    }
  }
  if (v2->_lowResImageUsedByVideoEncoderEnabled && v2->_stabilizationType == 4)
  {
    id v43 = [(BWNodeOutput *)v2->super._output mediaPropertiesForAttachedMediaKey:@"PrimaryFormat"];
    id v44 = [(BWNodeOutput *)v2->super._output mediaConfigurationForAttachedMediaKey:@"PrimaryFormat"];
    int v45 = [v43 resolvedRetainedBufferCount];
    uint64_t v46 = v45 <= (int)[v44 owningNodeRetainedBufferCount]
        ? [v44 owningNodeRetainedBufferCount]
        : [v43 resolvedRetainedBufferCount];
    uint64_t v47 = v46;
    id v48 = [(BWNodeOutput *)v2->super._output mediaPropertiesForAttachedMediaKey:0x1EFA74940];
    id v49 = [(BWNodeOutput *)v2->super._output mediaConfigurationForAttachedMediaKey:0x1EFA74940];
    int v50 = [v48 resolvedRetainedBufferCount];
    int v51 = v50 <= (int)[v49 owningNodeRetainedBufferCount]
        ? [v49 owningNodeRetainedBufferCount]
        : [v48 resolvedRetainedBufferCount];
    if (v51 < (int)v47) {
      [v49 setOwningNodeRetainedBufferCount:v47];
    }
  }
  v54.receiver = v2;
  v54.super_class = (Class)BWVISNode;
  [(BWNode *)&v54 prepareForCurrentConfigurationToBecomeLive];
  if (v2->_stabilizationType == 2 && v2->_outputColorSpaceProperties == 6) {
    [(BWVISProcessorControllerConfiguration *)v2->_processorControllerConfiguration setP3ToBT2020ConversionEnabled:1];
  }
  if (!v2->_processorController && v2->_visExecutionMode != 4)
  {
    if (-[BWVISNode _setupVISProcessorController]((uint64_t)v2))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (uint64_t)_setupVISProcessorController
{
  v47[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v2 = *(_DWORD *)(a1 + 100);
  if (v2 == 4)
  {
    int CompressionType = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat"));
    if (FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat")))BOOL v10 = CompressionType == 0; {
    else
    }
      BOOL v10 = 1;
    if (v10) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  else if (v2 == 3)
  {
    int v3 = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat"));
    int v4 = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat"));
    if (v4 == 4 || v4 == 2 || v3 == 4 || v3 == 2) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  [*(id *)(a1 + 104) setTransformPlatform:v8];
  if (*(unsigned char *)(a1 + 176))
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelBufferAttributes");
    if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F24CD0]), "BOOLValue"))objc_msgSend(*(id *)(a1 + 104), "setExtendedOutputRowsToFill:", ((*(_DWORD *)(a1 + 152) + 15) & 0xFFFFFFF0) - *(_DWORD *)(a1 + 152)); {
  }
    }
  if (*(unsigned char *)(a1 + 161))
  {
    v47[0] = *(void *)(a1 + 200);
    id v12 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1]);
  }
  else
  {
    id v12 = (id)[*(id *)(a1 + 16) videoFormat];
  }
  uint64_t v13 = v12;
  [*(id *)(a1 + 104) setEmitSampleBufferSemaphore:*(void *)(a1 + 208)];
  [*(id *)(a1 + 104) setGpuPriority:*(unsigned int *)(a1 + 156)];
  [*(id *)(a1 + 104) setSphereVideoEnabled:*(unsigned __int8 *)(a1 + 160)];
  [*(id *)(a1 + 104) setFrameRateConversionEnabled:*(unsigned __int8 *)(a1 + 664)];
  objc_msgSend(*(id *)(a1 + 104), "setInputPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelBufferAttributes"));
  objc_msgSend(*(id *)(a1 + 104), "setOutputPixelBufferAttributes:", objc_msgSend(v13, "pixelBufferAttributes"));
  objc_msgSend(*(id *)(a1 + 104), "setOutputPixelBufferPool:", objc_msgSend(*(id *)(a1 + 16), "preparedPixelBufferPool"));
  if (*(unsigned char *)(a1 + 665)) {
    objc_msgSend(*(id *)(a1 + 104), "setOutputDepthPixelBufferPool:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "preparedPixelBufferPool"));
  }
  [*(id *)(a1 + 104) setSmartStyleRenderingEnabled:*(unsigned __int8 *)(a1 + 688)];
  [*(id *)(a1 + 104) setSmartStyleReversibilityEnabled:*(unsigned __int8 *)(a1 + 689)];
  objc_msgSend(*(id *)(a1 + 104), "setSmartStyleMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  v14 = &OBJC_IVAR___FigCaptureIrisSinkConfiguration__intelligentDistortionCorrectionEnabled;
  if (*(unsigned char *)(a1 + 688) || *(unsigned char *)(a1 + 689))
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (!v15) {
      goto LABEL_66;
    }
    v16 = v15;
    if (*(unsigned char *)(a1 + 688))
    {
      uint64_t v46 = 0x1EFA74840;
      uint64_t v17 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v40 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", *(void *)(*((void *)&v39 + 1) + 8 * i)), "preparedPixelBufferPool"), *(void *)(*((void *)&v39 + 1) + 8 * i));
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v19);
      }
    }
    if (*(unsigned char *)(a1 + 689))
    {
      v44[0] = 0x1EFA74700;
      v44[1] = @"HumanSkinsMask";
      v44[2] = @"HumanFullBodiesMask";
      v44[3] = 0x1EFA74860;
      v44[4] = 0x1EFA748E0;
      v44[5] = 0x1EFA74900;
      uint64_t v22 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v36 != v25) {
              objc_enumerationMutation(v22);
            }
            objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", *(void *)(*((void *)&v35 + 1) + 8 * j)), "preparedPixelBufferPool"), *(void *)(*((void *)&v35 + 1) + 8 * j));
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v24);
      }
    }
    [v16 addEntriesFromDictionary:*(void *)(a1 + 680)];
    [*(id *)(a1 + 104) setOutputAttachmentsPixelBufferPools:v16];

    v14 = &OBJC_IVAR___FigCaptureIrisSinkConfiguration__intelligentDistortionCorrectionEnabled;
  }
  if (*(unsigned char *)(a1 + 692))
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (!v27) {
      goto LABEL_66;
    }
    int v28 = v27;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1EFA74940), "preparedPixelBufferPool"), 0x1EFA74940);
    objc_msgSend(v28, "addEntriesFromDictionary:", objc_msgSend(*(id *)(a1 + 104), "outputAttachmentsPixelBufferPools"));
    [*(id *)(a1 + 104) setOutputAttachmentsPixelBufferPools:v28];
  }
  if (*(unsigned char *)(a1 + 172)) {
    objc_msgSend(*(id *)(a1 + 104), "setVideoSTFParameters:", -[FigCaptureCameraParameters videoStabilizationSTFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "videoStabilizationSTFParameters"));
  }
  if (*(unsigned char *)(a1 + 173))
  {
    int v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[FigCaptureCameraParameters commonVideoGreenGhostMitigationParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonVideoGreenGhostMitigationParameters"));
    if (v29)
    {
      int v30 = v29;
      if (!*(unsigned char *)(a1 + 174)) {
        [v29 setObject:0 forKeyedSubscript:@"LowLightMitigationParameters"];
      }
      [*(id *)(a1 + 104) setVideoGreenGhostMitigationParameters:v30];

      goto LABEL_61;
    }
LABEL_66:
    uint64_t v32 = 4294954510;
    goto LABEL_64;
  }
LABEL_61:
  [*(id *)(a1 + 104) setCameraExtrinsicMatrix:*(void *)(a1 + 728)];
  char v31 = objc_alloc_init(BWVISProcessorController);
  *(void *)(a1 + v14[916]) = v31;
  if (!v31) {
    goto LABEL_66;
  }
  [(BWVISProcessorController *)v31 setConfiguration:*(void *)(a1 + 104)];
  uint64_t v32 = [*(id *)(a1 + v14[916]) prepareToProcess];
  uint64_t v33 = *(void **)(a1 + v14[916]);
  if (!v33)
  {
    uint64_t v32 = 4294954516;
    goto LABEL_64;
  }
  [v33 setDelegate:a1];
  if (v32)
  {
LABEL_64:
    [*(id *)(a1 + 264) logErrorNumber:v32 errorString:@"Setup VIS Processor"];

    *(void *)(a1 + v14[916]) = 0;
  }
  return v32;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BWVISNode;
  [(BWNode *)&v10 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType([(BWFormat *)[(BWNodeOutput *)self->super._output format] formatDescription]);
  int CompressionType = FigCapturePixelFormatGetCompressionType(MediaSubType);
  if (CompressionType)
  {
    int v8 = CompressionType;
    ioSurfaceCompressionRatioStats = self->_ioSurfaceCompressionRatioStats;
    if (ioSurfaceCompressionRatioStats) {

    }
    self->_ioSurfaceCompressionRatioStats = objc_alloc_init(BWStats);
    self->_totalCompressedDataSize = 0;
    self->_totalUncompressedDataSize = 0;
    self->_pixelBufferint CompressionType = v8;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  double v5 = -[BWVISNode _flushBuffers]((uint64_t)self);
  ioSurfaceCompressionRatioStats = self->_ioSurfaceCompressionRatioStats;
  if (ioSurfaceCompressionRatioStats)
  {
    if ([(BWStats *)ioSurfaceCompressionRatioStats numberOfSamples]) {
      -[BWVISNode _reportIOSurfaceCompressionCoreAnalyticsData]((uint64_t)self);
    }

    self->_ioSurfaceCompressionRatioStats = 0;
  }
  -[BWVISNode _releaseResources]((uint64_t)self);
  v7.receiver = self;
  v7.super_class = (Class)BWVISNode;
  [(BWNode *)&v7 didReachEndOfDataForInput:a3];
}

- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsData
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = objc_alloc_init(BWIOSurfaceCompressionStatisticsAnalyticsPayload);
    [*(id *)(v1 + 608) average];
    *(float *)&double v3 = v3;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setAverageRatio:v3];
    [*(id *)(v1 + 608) min];
    *(float *)&double v4 = v4;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setMinRatio:v4];
    [*(id *)(v1 + 608) max];
    *(float *)&double v5 = v5;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setMaxRatio:v5];
    [*(id *)(v1 + 608) standardDeviation];
    *(float *)&double v6 = v6;
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setStandardDeviation:v6];
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setNumberOfSamples:](v2, "setNumberOfSamples:", [*(id *)(v1 + 608) numberOfSamples]);
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setCompressionType:*(unsigned int *)(v1 + 616)];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setBufferHeight:*(unsigned int *)(v1 + 152)];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setTotalCompressedSize:*(void *)(v1 + 624)];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setTotalUncompressedSize:*(void *)(v1 + 632)];
    [(BWIOSurfaceCompressionStatisticsAnalyticsPayload *)v2 setNodeType:2];
    objc_super v7 = +[BWCoreAnalyticsReporter sharedInstance];
    return [(BWCoreAnalyticsReporter *)v7 sendEvent:v2];
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  memset(&v40, 0, sizeof(v40));
  CMSampleBufferGetPresentationTimeStamp(&v40, a3);
  CMTime time = v40;
  CMTimeGetSeconds(&time);
  objc_super v7 = (__CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int v38 = 0;
  int v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8])
  {
    FigCFDictionaryGetIntIfPresent();
    if (*v8 == 1)
    {
      [(BWVISNode *)self pipelineTraceID];
      kdebug_trace();
    }
  }
  [(BWNode *)self name];
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    int v9 = (void *)CMGetAttachment(a3, @"FileWriterAction", 0);
    CFTypeRef v10 = CMGetAttachment(a3, @"AttachedMediaSwapPlaceholderSampleBuffer", 0);
    CFTypeRef v11 = CMGetAttachment(a3, @"RecordingSettings", 0);
    if (v9 && (CFTypeID v13 = CFGetTypeID(v9), v13 == CFStringGetTypeID()))
    {
      if (!CFEqual(v9, @"Stop")
        && !CFEqual(v9, @"Pause")
        && !CFEqual(v9, @"Flush")
        && !CFEqual(v9, @"Terminate")
        && !CFEqual(v9, @"StreamForcedOff")
        && v10 != (CFTypeRef)*MEMORY[0x1E4F1CFD0])
      {
        int v14 = 0;
        goto LABEL_20;
      }
    }
    else if (v10 != (CFTypeRef)*MEMORY[0x1E4F1CFD0])
    {
      int v14 = 0;
      if (v9) {
        goto LABEL_20;
      }
      goto LABEL_23;
    }
    int v14 = 1;
    if (v9)
    {
LABEL_20:
      if (CFEqual(v9, @"Start")) {
        int v9 = (void *)v11;
      }
      else {
        int v9 = 0;
      }
    }
LABEL_23:
    if (v14) {
      double v12 = -[BWVISNode _flushBuffers]((uint64_t)self);
    }
    if (self->_usingExtendedCVISLivePhotoStabilization && v9)
    {
      uint64_t v15 = objc_msgSend(v9, "isIrisMovieRecording", v12);
      self->_stabilizeForLongPressVideo = v15;
      [(BWVISProcessorController *)self->_processorController setLongPressModeEnabled:v15];
    }
    if (self->_flipHorizontalExcludingIris && v9)
    {
      if (objc_msgSend(v9, "isIrisRecording", v12)
        && ![v9 isIrisMovieRecording])
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = [v9 videoMirrored];
      }
      [(BWVISProcessorController *)self->_processorController setFlipHorizontalOrientationEnabled:v16];
      self->_liveFlipHorizontal = v16;
    }
    if (self->_personSegmentationRenderingEnabled && v9)
    {

      self->_foregroundColorCube = (NSData *)(id)[v9 personSegmentationForegroundColorCube];
      self->_backgroundColorCube = (NSData *)(id)[v9 personSegmentationBackgroundColorCube];
    }
    if (self->_videoSTFEnabled && v9) {
      objc_msgSend(v9, "setVideoSTFEnabled:", 1, v12);
    }
    if (self->_smartStyleReversibilityEnabled && v9)
    {
      self->_stabilizeForSmartStyleReversibilitdouble y = objc_msgSend(v9, "smartStyleReversibilitySupported", v12);
      -[BWVISProcessorController setSmartStyleReversibilityProcessingEnabled:](self->_processorController, "setSmartStyleReversibilityProcessingEnabled:", [v9 smartStyleReversibilitySupported]);
    }
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v12);
    if ((v40.flags & 0x1D) == 1) {
      self->_lastEmittedPTS = ($95D729B680665BEAEFA1D6FCA8238556)v40;
    }
    goto LABEL_72;
  }
  if (self->_visExecutionMode == 4)
  {
    -[BWVISNode _tallyAndEmitSampleBuffer:]((uint64_t)self, a3);
    goto LABEL_72;
  }
  if (!self->_processorController)
  {
    fig_log_get_emitter();
    uint64_t v33 = v4;
    LODWORD(v32) = 0;
    goto LABEL_76;
  }
  -[BWVISNode _handleIrisKeyFrameCachingForSampleBuffer:]((uint64_t)self, a3);
  -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:]((uint64_t)self, v7, a3, 0);
  if (self->_visExecutionMode == 1)
  {
    Value = (void *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E4F55710]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v18 = [Value countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(Value);
          }
          -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:]((uint64_t)self, *(__CFDictionary **)(*((void *)&v34 + 1) + 8 * i), a3, 0);
        }
        uint64_t v19 = [Value countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v19);
    }
    uint64_t v22 = (__CFDictionary *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E4F55708]);
    if (v22) {
      -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:]((uint64_t)self, v22, a3, 0);
    }
  }
  if (self->_stabilizeDepthAttachments)
  {
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, @"Depth");
    if (AttachedMedia) {
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55CA0], AttachedMedia, 0);
    }
  }
  if (self->_personSegmentationRenderingEnabled)
  {
    if (!self->_foregroundColorCube || !self->_backgroundColorCube) {
      goto LABEL_65;
    }
    uint64_t v24 = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74460);
    if (v24)
    {
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53178], v24, 0);
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53170], self->_foregroundColorCube, 0);
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53168], self->_backgroundColorCube, 0);
LABEL_65:
      BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA74460);
      BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA744A0);
      goto LABEL_66;
    }
    fig_log_get_emitter();
    uint64_t v33 = v4;
    LODWORD(v32) = 0;
LABEL_76:
    FigDebugAssert3();
    uint64_t v30 = 4294954516;
LABEL_78:
    [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:v30, @"when rendering", v32, v33 errorString];
    CMTime time = v40;
    id v31 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA67EE0 pts:&time];
    -[BWVISNode _tallyAndEmitDroppedSample:]((uint64_t)self, v31);

    goto LABEL_72;
  }
LABEL_66:
  CFTypeRef v25 = CMGetAttachment(a3, @"SubjectRelightingResult", 0);
  if (v25)
  {
    int v26 = (void *)v25;
    mach_absolute_time();
    [v26 waitForResult];
    if ([v26 relightingRequired])
    {
      CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F53180];
      int v28 = NSNumber;
      [v26 curveParameter];
      CMSetAttachment(a3, v27, (CFTypeRef)objc_msgSend(v28, "numberWithFloat:"), 1u);
    }
  }
  uint64_t v29 = [(BWVISProcessorController *)self->_processorController enqueueBufferForProcessing:a3];
  if (v29)
  {
    uint64_t v30 = v29;
    fig_log_get_emitter();
    uint64_t v33 = v4;
    LODWORD(v32) = v30;
    FigDebugAssert3();
    goto LABEL_78;
  }
  if (self->_smartStyleRenderingEnabled) {
    CMSetAttachment(a3, @"FiltersApplied", MEMORY[0x1E4F1CC38], 1u);
  }
LABEL_72:
  if (*v8 == 1)
  {
    [(BWVISNode *)self pipelineTraceID];
    kdebug_trace();
  }
}

- (void)_tallyAndEmitSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    int v4 = CMGetAttachment(target, @"SampleDataToBeDropped", 0) != (CFTypeRef)*MEMORY[0x1E4F1CFD0]
      || *(unsigned char *)(a1 + 196) == 0;
    double v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    double v6 = v5;
    if (*(_DWORD *)(a1 + 180) == 4)
    {
      if (v5) {
        -[BWVISNode _collectMetadataForReprocessingFrom:to:](a1, target, v5);
      }
    }
    else if (*(void *)(a1 + 608))
    {
      -[BWVISNode _tallyCompressedIOSurfaceStatsForSBuf:](a1, (opaqueCMSampleBuffer *)target);
    }
    if (((*(_DWORD *)(a1 + 180) != 4) & ~v4) != 0)
    {
      if (CMGetAttachment(target, @"SampleDataToBeDroppedEmitSampleBufferSemaphores", 0))
      {
        CFTypeRef v11 = +[BWNodeInput newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:target];
        if (v11)
        {
          double v12 = v11;
          [*(id *)(a1 + 16) emitSampleBuffer:v11];
          CMSampleBufferGetPresentationTimeStamp(&v15, v12);
          *(CMTime *)(a1 + 640) = v15;
          CFRelease(v12);
        }
      }
    }
    else
    {
      if (*(void *)(a1 + 240))
      {
        objc_super v7 = (void *)[*(id *)(a1 + 16) videoFormat];
        unsigned int v8 = [v7 width];
        uint64_t v9 = [v7 height];
        if (*(unsigned char *)(a1 + 161) || *(_DWORD *)(a1 + 180) == 4)
        {
          unsigned int v8 = *(_DWORD *)(a1 + 148);
          uint64_t v10 = *(unsigned int *)(a1 + 152);
        }
        else
        {
          uint64_t v10 = v9;
        }
        [*(id *)(a1 + 240) cacheStillImageTransformDataFromMetadata:v6 transformReferenceDimensions:v8 | (unint64_t)(v10 << 32)];
      }
      if (*(unsigned char *)(a1 + 162))
      {
        if ((objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DA8]), "BOOLValue") & 1) == 0) {
          BWDetectedFacesConvertSampleBufferFacesFromSensorToBufferCoordinateSpace(target);
        }
        if ((objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DC8]), "BOOLValue") & 1) == 0) {
          BWDetectedObjectsConvertSampleBufferDetectedObjectsFromSensorToBufferCoordinateSpace(target);
        }
        -[BWVISNode _harvestMetadataFromSampleBuffer:]((os_unfair_lock_s *)a1, target);
        -[BWVISNode _stabilizeMetadataForSampleBuffer:](a1, target);
        CFTypeID v13 = (void *)-[BWVISNode _cinematographyFrameForSampleBuffer:](a1, target);
        -[BWVISNode _attachHarvestedStabilizationMetadataToCinematographyFrame:]((os_unfair_lock_s *)a1, v13);
        -[BWVISNode _stabilizeCinematographyMetadataInCinematographyFrame:](a1, v13);
      }
      if (*(unsigned char *)(a1 + 164))
      {
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
        if (ImageBuffer) {
          CMSetAttachment(ImageBuffer, @"MirroredHorizontal", MEMORY[0x1E4F1CC38], 1u);
        }
      }
      [*(id *)(a1 + 16) emitSampleBuffer:target];
      CMSampleBufferGetPresentationTimeStamp(&v15, (CMSampleBufferRef)target);
      *(CMTime *)(a1 + 640) = v15;
    }
    ++*(_DWORD *)(a1 + 220);
  }
}

- (void)_handleIrisKeyFrameCachingForSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    if (CMGetAttachment(target, @"SampleDataToBeDropped", 0) == (CFTypeRef)*MEMORY[0x1E4F1CFD0])
    {
      double v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v6 = *MEMORY[0x1E4F55D10];
      uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F55D10]];
      uint64_t v8 = *MEMORY[0x1E4F52DC0];
      uint64_t v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F52DC0]];
      if (v7 | v9)
      {
        uint64_t v10 = (void *)v9;
        CFTypeRef v11 = *(void **)(a1 + 248);
        if (v11 || *(void *)(a1 + 256))
        {

          *(void *)(a1 + 248) = 0;
          *(void *)(a1 + 256) = 0;
        }
        *(void *)(a1 + 248) = (id)v7;
        *(void *)(a1 + 256) = v10;
        [v5 setObject:0 forKeyedSubscript:v6];
        [v5 setObject:0 forKeyedSubscript:v8];
        visn_setSynchronizedSlaveFrameLivePhotoKeyFrameMetadata(0, 0, target);
      }
    }
    else if (*(void *)(a1 + 248) || *(void *)(a1 + 256))
    {
      int v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      [v4 setObject:*(void *)(a1 + 248) forKeyedSubscript:*MEMORY[0x1E4F55D10]];
      [v4 setObject:*(void *)(a1 + 256) forKeyedSubscript:*MEMORY[0x1E4F52DC0]];
      visn_setSynchronizedSlaveFrameLivePhotoKeyFrameMetadata(*(void *)(a1 + 248), *(void *)(a1 + 256), target);

      *(void *)(a1 + 248) = 0;
      *(void *)(a1 + 256) = 0;
    }
  }
}

- (void)_addVISDigitalZoomToMetadata:(const void *)a3 sampleBuffer:(int)a4 forReprocessing:
{
  if (!a1) {
    return;
  }
  uint64_t v8 = (void *)[*(id *)(a1 + 8) videoFormat];
  int v9 = [v8 width];
  int v10 = [v8 height];
  CFTypeRef v11 = (void *)[*(id *)(a1 + 16) videoFormat];
  int v12 = [v11 width];
  int v13 = [v11 height];
  int v14 = v13;
  double v31 = 0.0;
  double v32 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  long long v33 = _Q0;
  if (*(unsigned char *)(a1 + 161)) {
    _ZF = 0;
  }
  else {
    _ZF = a4 == 0;
  }
  if (!_ZF && *(_DWORD *)(a1 + 148))
  {
    int v20 = *(_DWORD *)(a1 + 152);
    int v14 = v20 ? *(_DWORD *)(a1 + 152) : v13;
    if (v20) {
      int v12 = *(_DWORD *)(a1 + 148);
    }
  }
  if (*(unsigned char *)(a1 + 737))
  {
    long long v33 = _Q0;
  }
  else
  {
    if (FigCFDictionaryGetCGRectIfPresent()) {
      BOOL v25 = 1;
    }
    else {
      BOOL v25 = a4 == 0;
    }
    if (!v25 && CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)) {
      FigCFDictionaryGetCGRectIfPresent();
    }
    if (*(unsigned char *)(a1 + 177) && !*(unsigned char *)(a1 + 178))
    {
      double v31 = FigCaptureMetadataUtilitiesScaleRect(0.0, 0.0, *(CGFloat *)&v33, *((CGFloat *)&v33 + 1), (float)(*(float *)(a1 + 192) + 1.0));
      double v32 = v26;
      *(void *)&long long v33 = v27;
      *((void *)&v33 + 1) = v28;
      FigCFDictionarySetCGRect();
    }
  }
  double v21 = *(double *)&v33 * (double)v9;
  double v22 = *((double *)&v33 + 1) * (double)v10;
  double v23 = ((double)v12 / v21 + (double)v14 / v22) * 0.5;
  float v24 = v23;
  if (*(_DWORD *)(a1 + 740) == 2 && FigCFDictionaryGetFloatIfPresent())
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!a3) {
      goto LABEL_32;
    }
LABEL_18:
    if ((*(_DWORD *)(a1 + 100) - 3) <= 1 && v24 > 2.25)
    {
      *(float *)&double v23 = v24 / 2.25;
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55CD0], (CFTypeRef)[NSNumber numberWithFloat:v23], 1u);
      if (a4) {
        FigCFDictionarySetCGFloat();
      }
    }
    goto LABEL_32;
  }
  if (a3) {
    goto LABEL_18;
  }
LABEL_32:
  FigCFDictionarySetCGFloat();
  v34.double x = v31 - ((double)v9 - v21) * 0.5 / (double)v9;
  v34.double y = v32 - ((double)v10 - v22) * 0.5 / (double)v10;
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v34);
  CFDictionarySetValue(a2, (const void *)*MEMORY[0x1E4F55D08], DictionaryRepresentation);
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  if ((*(unsigned char *)(a1 + 736) || a4) && !CFDictionaryGetValue(a2, @"TotalZoomFactor"))
  {
    CFTypeRef v30 = CMGetAttachment(a3, @"TotalZoomFactor", 0);
    if (v30) {
      CFDictionarySetValue(a2, (const void *)*MEMORY[0x1E4F55D20], v30);
    }
  }
}

- (double)_tallyAndEmitDroppedSample:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 16) emitDroppedSample:a2];
    if (a2)
    {
      [a2 pts];
    }
    else
    {
      long long v5 = 0uLL;
      uint64_t v6 = 0;
    }
    double result = *(double *)&v5;
    *(_OWORD *)(a1 + 640) = v5;
    *(void *)(a1 + 656) = v6;
    ++*(_DWORD *)(a1 + 220);
  }
  return result;
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

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (BOOL)sphereVideoEnabled
{
  return self->_sphereVideoEnabled;
}

- (BOOL)flipHorizontalExcludingIris
{
  return self->_flipHorizontalExcludingIris;
}

- (BOOL)frameRateConversionEnabled
{
  return self->_frameRateConversionEnabled;
}

- (int)pipelineTraceID
{
  return self->_pipelineTraceID;
}

- (BOOL)generatesDroppedSampleMarkerBuffers
{
  return self->_generatesDroppedSampleMarkerBuffers;
}

- (OS_dispatch_semaphore)emitSampleBufferSemaphore
{
  return self->_emitSampleBufferSemaphore;
}

- (id)irisStillImageMovieMetadataCache
{
  return self->_irisStillImageMovieMetadataCache;
}

- (void)setStabilizeDepthAttachments:(BOOL)a3
{
  if (!a3)
  {
    uint64_t v6 = 0;
    p_input = &self->super._input;
    goto LABEL_9;
  }
  int visExecutionMode = self->_visExecutionMode;
  if (visExecutionMode == 3 || visExecutionMode == 0)
  {
    self->_stabilizeDepthAttachments = a3;
    uint64_t v6 = objc_alloc_init(BWNodeInputMediaConfiguration);
    uint64_t v7 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v7 setSupportedPixelFormats:&unk_1EFB03B60];
    [(BWNodeInputMediaConfiguration *)v6 setFormatRequirements:v7];
    [(BWNodeInputMediaConfiguration *)v6 setPassthroughMode:0];
    p_input = &self->super._input;
    [(BWNodeInputMediaConfiguration *)v6 setDelayedBufferCount:[(BWNodeInputMediaConfiguration *)[(BWNodeInput *)self->super._input primaryMediaConfiguration] delayedBufferCount]];
LABEL_9:
    [(BWNodeInput *)*p_input setMediaConfiguration:v6 forAttachedMediaKey:@"Depth"];
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (BOOL)stabilizeDepthAttachments
{
  return self->_stabilizeDepthAttachments;
}

- (void)setOutputDepthDimensions:(id)a3
{
  if (self->_outputDepthDimensions.width != a3.var0 || self->_outputDepthDimensions.height != a3.var1)
  {
    self->_outputDepthDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- ($2825F4736939C4A6D3AD43837233062D)outputDepthDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDepthDimensions;
}

- (BOOL)personSegmentationRenderingEnabled
{
  return self->_personSegmentationRenderingEnabled;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (BOOL)lowResImageUsedByVideoEncoderEnabled
{
  return self->_lowResImageUsedByVideoEncoderEnabled;
}

- (void)setCameraExtrinsicMatrix:(id)a3
{
  self->_cameraExtrinsicMatridouble x = (NSData *)a3;
}

- (id)cameraExtrinsicMatrix
{
  return self->_cameraExtrinsicMatrix;
}

- (void)setProcessingSemaphore:(id)a3
{
  processingSemaphore = self->_processingSemaphore;
  if (processingSemaphore != a3)
  {

    self->_processingSemaphore = (OS_dispatch_semaphore *)a3;
  }
}

- (id)processingSemaphore
{
  return self->_processingSemaphore;
}

BOOL __41__BWVISNode__updateSupportedPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 intValue];
  int CompressionType = FigCapturePixelFormatGetCompressionType(v3);
  if (!CompressionType) {
    goto LABEL_11;
  }
  if (!*(unsigned char *)(a1 + 40)) {
    return 0;
  }
  if (CompressionType != 4)
  {
LABEL_11:
    if (*(unsigned char *)(a1 + 41)) {
      return 0;
    }
  }
  int LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel(v3);
  if (!LossyCompressionLevel || *(unsigned char *)(a1 + 42)) {
    return LossyCompressionLevel <= *(_DWORD *)(*(void *)(a1 + 32) + 144);
  }
  return 0;
}

- (void)setOutputColorSpaceProperties:(int)a3
{
  if (self->_outputColorSpaceProperties != a3)
  {
    self->_outputColorSpaceProperties = a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (int)outputColorSpaceProperties
{
  return self->_outputColorSpaceProperties;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (BOOL)videoSTFEnabled
{
  return self->_videoSTFEnabled;
}

- (BOOL)videoGreenGhostMitigationEnabled
{
  return self->_videoGreenGhostMitigationEnabled;
}

- (uint64_t)_collectMetadataForReprocessingFrom:(void *)a3 to:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    double result = 4294954516;
    if (target)
    {
      if (a3)
      {
        CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
        CFTypeRef v7 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          [a3 setObject:*(void *)(v4 + 184) forKeyedSubscript:*MEMORY[0x1E4F53560]];
          -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:](v4, (__CFDictionary *)a3, target, 1);
          uint64_t v9 = *MEMORY[0x1E4F55710];
          if ([v8 objectForKeyedSubscript:*MEMORY[0x1E4F55710]])
          {
            int v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", objc_msgSend(v8, "objectForKeyedSubscript:", v9));
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v40;
              do
              {
                uint64_t v14 = 0;
                do
                {
                  if (*(void *)v40 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:](v4, *(__CFDictionary **)(*((void *)&v39 + 1) + 8 * v14++), target, 1);
                }
                while (v12 != v14);
                uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
              }
              while (v12);
            }
            [a3 setObject:v10 forKeyedSubscript:v9];
          }
          uint64_t v15 = *MEMORY[0x1E4F55708];
          if ([v8 objectForKeyedSubscript:*MEMORY[0x1E4F55708]])
          {
            uint64_t v16 = (__CFDictionary *)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v8, "objectForKeyedSubscript:", v15));
            if (v16)
            {
              uint64_t v17 = v16;
              -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:](v4, v16, target, 1);
              [a3 setObject:v17 forKeyedSubscript:v15];
            }
          }
          uint64_t v18 = (opaqueCMSampleBuffer *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53178], 0);
          if (v18) {
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v18, *MEMORY[0x1E4F530A8], *MEMORY[0x1E4F530B0], a3);
          }
          AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, @"Depth");
          if (AttachedMedia) {
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, AttachedMedia, *MEMORY[0x1E4F53078], *MEMORY[0x1E4F53080], a3);
          }
          int v20 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1EFA74960);
          if (v20) {
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v20, *MEMORY[0x1E4F53088], *MEMORY[0x1E4F53090], a3);
          }
          double v21 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1EFA68BE0);
          if (v21) {
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v21, *MEMORY[0x1E4F53098], *MEMORY[0x1E4F530A0], a3);
          }
          double v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1EFA68B80);
          if (v22) {
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v22, *MEMORY[0x1E4F556D0], *MEMORY[0x1E4F556D8], a3);
          }
          double v23 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1EFA68BA0);
          if (v23)
          {
            float v24 = v23;
            CFTypeRef v25 = CMGetAttachment(v23, v6, 0);
            if (BWSampleBufferGetCVDataBuffer(v24))
            {
              uint64_t IOSurface = CVDataBufferGetIOSurface();
              if (v25)
              {
                uint64_t v27 = (__IOSurface *)IOSurface;
                if (IOSurface)
                {
                  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  [v28 setObject:v25 forKeyedSubscript:v6];
                  IOSurfaceLock(v27, 1u, 0);
                  BaseAddress = IOSurfaceGetBaseAddress(v27);
                  CFTypeRef v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:BaseAddress length:CVDataBufferGetDataSize() freeWhenDone:0];
                  uint64_t v31 = [v30 compressedDataUsingAlgorithm:1 error:0];
                  [v28 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F53B58]];

                  IOSurfaceUnlock(v27, 1u, 0);
                  [a3 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F556C8]];
                }
              }
            }
          }
          uint64_t v32 = *MEMORY[0x1E4F53180];
          CFTypeRef v33 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53180], 0);
          if (v33) {
            [a3 setObject:v33 forKeyedSubscript:v32];
          }
          uint64_t v34 = *MEMORY[0x1E4F53170];
          CFTypeRef v35 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53170], 0);
          if (v35) {
            [a3 setObject:v35 forKeyedSubscript:v34];
          }
          uint64_t v36 = *MEMORY[0x1E4F53168];
          CFTypeRef v37 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53168], 0);
          if (v37) {
            [a3 setObject:v37 forKeyedSubscript:v36];
          }
          uint64_t v38 = *MEMORY[0x1E4F55CC0];
          double result = (uint64_t)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55CC0], 0);
          if (result)
          {
            [a3 setObject:result forKeyedSubscript:v38];
            return 0;
          }
        }
        else
        {
          return 4294954516;
        }
      }
    }
  }
  return result;
}

- (void)_tallyCompressedIOSurfaceStatsForSBuf:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    float v3 = BWSampleBufferComputeIOSurfaceCompressionRatio(a2, &v6, &v5);
    if (v3 > 0.0 && v3 <= 1.0)
    {
      [*(id *)(a1 + 608) addDataPoint:v3];
      *(void *)(a1 + 624) += v6;
      *(void *)(a1 + 632) += v5;
    }
  }
}

- (uint64_t)_harvestMetadataFromSampleBuffer:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    if (target)
    {
      CFTypeRef v4 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (v4)
      {
        unint64_t v5 = (void *)v4;
        memset(&v15, 0, sizeof(v15));
        CMSampleBufferGetPresentationTimeStamp(&v15, (CMSampleBufferRef)target);
        unint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
        uint64_t v7 = *MEMORY[0x1E4F55C98];
        uint64_t v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55C98], 0);
        if (v8) {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", (id)objc_msgSend(v8, "copy"), v7);
        }
        uint64_t v9 = *MEMORY[0x1E4F55CE8];
        int v10 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55CE8], 0);
        if (v10) {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", (id)objc_msgSend(v10, "copy"), v9);
        }
        uint64_t v11 = *MEMORY[0x1E4F55CB0];
        uint64_t v12 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F55CB0]];
        if (v12) {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", (id)objc_msgSend(v12, "copy"), v11);
        }
        CMTime v14 = v15;
        -[BWVISNode _addMotionTensorsToRingBuffer:pts:](a1, v6, (uint64_t)&v14);
      }
    }
  }
  return 0;
}

- (uint64_t)_stabilizeMetadataForSampleBuffer:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (target)
    {
      CFTypeRef v4 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (v4)
      {
        unint64_t v5 = (void *)v4;
        memset(&v30, 0, sizeof(v30));
        CMSampleBufferGetPresentationTimeStamp(&v30, (CMSampleBufferRef)target);
        unint64_t v6 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
        uint64_t v7 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
        uint64_t v8 = [v6 count];
        uint64_t v9 = (uint64_t *)MEMORY[0x1E4F54348];
        if (v8)
        {
          memset(&v29, 0, sizeof(v29));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54348]), "longLongValue");
          int64_t v10 = FigHostTimeToNanoseconds();
          CMTimeMake(&time, v10, 1000000000);
          CMTimeConvertScale(&v29, &time, v30.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          CMTime v27 = v29;
          -[BWVISNode _tranformRectanglesInMetadata:pts:](a1, v6, (long long *)&v27.value);
          CMSetAttachment(target, @"DetectedFacesArrayHasBeenStabilized", (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
        }
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v11 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          uint64_t v14 = *MEMORY[0x1E4F538F8];
          uint64_t v15 = *v9;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v7);
              }
              uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v18 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v17), "objectForKeyedSubscript:", v14);
              if ([v18 count])
              {
                memset(&v29, 0, sizeof(v29));
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v17), "objectForKeyedSubscript:", v15), "longLongValue");
                int64_t v19 = FigHostTimeToNanoseconds();
                CMTimeMake(&v22, v19, 1000000000);
                CMTimeConvertScale(&v29, &v22, v30.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                CMTime v21 = v29;
                -[BWVISNode _tranformRectanglesInMetadata:pts:](a1, v18, (long long *)&v21.value);
              }
            }
            uint64_t v12 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_cinematographyFrameForSampleBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!target) {
    return 0;
  }
  int v2 = (void *)CMGetAttachment(target, @"CinematicVideoCinematographyMetadata", 0);
  if (!v2) {
    return 0;
  }
  return [v2 objectForKeyedSubscript:0x1EFA732E0];
}

- (uint64_t)_attachHarvestedStabilizationMetadataToCinematographyFrame:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    if (a2)
    {
      memset(&v15[1], 0, sizeof(CMTime));
      [a2 time];
      v15[0] = v15[1];
      int v4 = -[BWVISNode _findBestMotionTensorsInRingBufferWithKey:pts:](a1, 0, v15);
      if ((v4 & 0x80000000) == 0)
      {
        int v5 = v4;
        unint64_t v6 = (void *)[*(id *)&a1[8 * v4 + 68]._os_unfair_lock_opaque objectForKeyedSubscript:*MEMORY[0x1E4F55CE8]];
        if ([v6 length] == 36)
        {
          uint64_t v7 = (void *)[*(id *)&a1[8 * v5 + 68]._os_unfair_lock_opaque objectForKeyedSubscript:*MEMORY[0x1E4F55CB0]];
          if ([v7 length] == 8)
          {
            uint64_t v8 = [v6 bytes];
            uint64_t v9 = 0;
            long long v12 = 0u;
            long long v13 = 0u;
            long long v14 = 0u;
            do
            {
              *((_DWORD *)&v12 + 4 * (v9 % 3u) + v9 / 3u) = *(_DWORD *)(v8 + 4 * v9);
              ++v9;
            }
            while (v9 != 9);
            int64_t v10 = (void *)[objc_alloc((Class)getPTTimedStabilizationMetadataVersion1Class()) initWithMinorVersion:1];
            objc_msgSend(v10, "setStabilizationHomography:", *(double *)&v12, *(double *)&v13, *(double *)&v14);
            objc_msgSend(v10, "setEstimatedMotionBlur:", *(double *)objc_msgSend(v7, "bytes"));
            objc_setAssociatedObject(a2, @"CinematicVideoTimedStabilizationMetadata", v10, (void *)1);
          }
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_stabilizeCinematographyMetadataInCinematographyFrame:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      memset(&v30[32], 0, 24);
      [a2 time];
      uint64_t v4 = *MEMORY[0x1E4F55C98];
      *(CMTime *)CMTime v30 = *(CMTime *)&v30[32];
      unsigned int v5 = -[BWVISNode _findBestMotionTensorsInRingBufferWithKey:pts:]((os_unfair_lock_s *)a1, v4, (CMTime *)v30);
      if ((v5 & 0x80000000) == 0)
      {
        unint64_t v6 = (void *)[*(id *)(a1 + 272 + 32 * v5) objectForKeyedSubscript:v4];
        if ([v6 length] == 36)
        {
          uint64_t v7 = [v6 bytes];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = (void *)[*(id *)(a1 + 8) videoFormat];
            unsigned int v10 = [v9 width];
            unsigned int v11 = [v9 height];
            long long v12 = (void *)[*(id *)(a1 + 16) videoFormat];
            int v13 = [v12 width];
            [v12 height];
            long long v14 = objc_msgSend((id)objc_msgSend(a2, "detections"), "allValues");
            if ([v14 count])
            {
              long long v28 = 0u;
              long long v29 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v27;
                unint64_t v18 = v10 | ((unint64_t)v11 << 32);
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v27 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    int v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                    [v20 rect];
                    objc_msgSend(v20, "setRect:", visn_transformRectangle(v8, v18, v13, v21, v22, v23, v24));
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
                }
                while (v16);
              }
            }
          }
        }
      }
    }
  }
  return 0;
}

- (double)_droppedSamplePTSFromSampleBuffer:(uint64_t)a3@<X8>
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  if (a2)
  {
    if (sbuf)
    {
      CMSampleBufferGetPresentationTimeStamp((CMTime *)a3, sbuf);
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4F1F9F8];
      long long v5 = *MEMORY[0x1E4F1F9F8];
      *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
      *(void *)(a3 + 16) = *(void *)(v6 + 16);
    }
    if ((*(unsigned char *)(a3 + 12) & 1) == 0)
    {
      if ((*(unsigned char *)(a2 + 652) & 1) == 0)
      {
        CMTimeMake(&v13, 1, 1000);
        *(CMTime *)(a2 + 640) = v13;
      }
      uint64_t v7 = (CMTime *)(a2 + 640);
      int32_t timescale = v7->timescale;
      if (timescale <= 999) {
        int64_t v9 = 1;
      }
      else {
        int64_t v9 = timescale / 0x3E8u;
      }
      CMTimeMake(&rhs, v9, timescale);
      CMTime v11 = *v7;
      CMTimeAdd(&v13, &v11, &rhs);
      *(void *)&long long v5 = v13.value;
      *(CMTime *)a3 = v13;
    }
  }
  return *(double *)&v5;
}

- (uint64_t)_collectAttachedMediaForReprocessingFrom:(uint64_t)a3 offlineKey:(uint64_t)a4 offlineKeyData:(void *)a5 to:
{
  if (!a1) {
    return 0;
  }
  long long v5 = target;
  if (!target)
  {
    int64_t v19 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = *MEMORY[0x1E4F53070];
  CFTypeRef v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v5);
  if (!ImageBuffer)
  {
    int64_t v19 = 0;
    long long v5 = 0;
    goto LABEL_12;
  }
  long long v12 = ImageBuffer;
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
  uint64_t Attributes = CVPixelBufferGetAttributes();
  uint64_t v16 = (opaqueCMSampleBuffer *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v5 = v16;
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int64_t v19 = 0;
LABEL_17:
    uint64_t v21 = 4294954510;
    goto LABEL_13;
  }
  [(opaqueCMSampleBuffer *)v16 setObject:Attributes forKeyedSubscript:*MEMORY[0x1E4F55D30]];
  if (v10) {
    [(opaqueCMSampleBuffer *)v5 setObject:v10 forKeyedSubscript:v9];
  }
  uint64_t v17 = [NSNumber numberWithUnsignedLong:BytesPerRow];
  [(opaqueCMSampleBuffer *)v5 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F24CC8]];
  CVPixelBufferLockBaseAddress(v12, 1uLL);
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:CVPixelBufferGetBaseAddress(v12) length:BytesPerRow * Height freeWhenDone:0];
  int64_t v19 = v18;
  if (!v18 || (uint64_t v20 = [v18 compressedDataUsingAlgorithm:1 error:0]) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  [(opaqueCMSampleBuffer *)v5 setObject:v20 forKeyedSubscript:a4];
  CVPixelBufferUnlockBaseAddress(v12, 1uLL);
  [a5 setObject:v5 forKeyedSubscript:a3];
LABEL_12:
  uint64_t v21 = 0;
LABEL_13:

  return v21;
}

- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a4)
  {
    processingSemaphore = self->_processingSemaphore;
    if (processingSemaphore)
    {
      dispatch_semaphore_wait(processingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_processingSemaphore);
    }
  }
  limitedGMErrorLogger = self->_limitedGMErrorLogger;
  [(BWLimitedGMErrorLogger *)limitedGMErrorLogger logErrorNumber:v4 errorString:@"VIS Processor pre image stabilization callback, generating drop"];
}

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  v55[2] = *MEMORY[0x1E4F143B8];
  if (a4) {
    goto LABEL_51;
  }
  uint64_t v8 = (__CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (self->_frameRateConversionEnabled)
  {
    if (!a3) {
      return;
    }
    uint64_t v9 = (void *)CMGetAttachment(a3, @"VariableFrameRateInfo", 0);
    if (!v9)
    {
      BOOL v16 = v8 != 0;
      goto LABEL_13;
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1EFA739E0), "intValue");
    v54[0] = 0x1EFA73A20;
    v54[1] = 0x1EFA73A40;
    v55[0] = [NSNumber numberWithInt:v10];
    v55[1] = [NSNumber numberWithBool:self->_frameRateConversionEnabled];
    CMTime v11 = (void *)MEMORY[0x1E4F1C9E8];
    long long v12 = v55;
    CMTime v13 = v54;
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v52 = 0x1EFA73A40;
    uint64_t v53 = [NSNumber numberWithBool:0];
    CMTime v11 = (void *)MEMORY[0x1E4F1C9E8];
    long long v12 = &v53;
    CMTime v13 = &v52;
    uint64_t v14 = 1;
  }
  uint64_t v15 = (const void *)[v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];
  BOOL v16 = v8 != 0;
  if (v8) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17) {
    CFDictionarySetValue(v8, @"VariableFrameRateStats", v15);
  }
  if (a3)
  {
LABEL_13:
    CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F1F288];
    CFTypeRef v19 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F288], 0);
    if (v19 == (CFTypeRef)*MEMORY[0x1E4F1CFD0])
    {
      uint64_t v20 = v19;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v21 = objc_msgSend((id)CMGetAttachment(a3, @"AttachedMedia", 0), "allKeys");
      uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v48 != v24) {
              objc_enumerationMutation(v21);
            }
            AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, *(void *)(*((void *)&v47 + 1) + 8 * i));
            CMSetAttachment(AttachedMedia, v18, v20, 1u);
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v23);
      }
    }
    if (self->_stabilizeDepthAttachments)
    {
      CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F55CA0];
      CFTypeRef v28 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55CA0], 0);
      if (v28)
      {
        BWSampleBufferSetAttachedMedia(a3, @"Depth", (uint64_t)v28);
        CMRemoveAttachment(a3, v27);
      }
    }
    if (!v16) {
      goto LABEL_32;
    }
    if ((self->_stabilizationType - 3) > 1)
    {
      if (self->_onlyGeneratingTransforms) {
        goto LABEL_32;
      }
    }
    else
    {
      CFStringRef v29 = (const __CFString *)*MEMORY[0x1E4F55CD0];
      CMTime v30 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55CD0], 0);
      [v30 floatValue];
      float v32 = v31;
      if (v30) {
        CMRemoveAttachment(a3, v29);
      }
      if (v32 > 1.0)
      {
        FigCFDictionarySetCGRect();
        goto LABEL_32;
      }
    }
    CFDictionaryRemoveValue(v8, (const void *)*MEMORY[0x1E4F53260]);
LABEL_32:
    if (!self->_lowResImageUsedByVideoEncoderEnabled) {
      goto LABEL_38;
    }
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFStringRef v34 = (const __CFString *)*MEMORY[0x1E4F53060];
    CFTypeRef v35 = (__CVBuffer *)CMGetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E4F53060], 0);
    if (!v35) {
      goto LABEL_38;
    }
    uint64_t v36 = v35;
    if (v16 && CFDictionaryContainsKey(v8, (const void *)*MEMORY[0x1E4F53260])
      || (uint64_t v37 = BWSampleBufferSetAttachedMediaFromPixelBuffer(a3, 0x1EFA74940, v36, (CFTypeRef *)&self->_lowResImageUsedByVideoEncoderFormatDescription, [MEMORY[0x1E4F1CA60] dictionary], 0, 0), !v37))
    {
      CMRemoveAttachment(ImageBuffer, v34);
LABEL_38:
      CFStringRef v38 = (const __CFString *)*MEMORY[0x1E4F55CC8];
      CFTypeRef v39 = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55CC8], 0);
      if (v39)
      {
        long long v40 = (void *)v39;
        int v41 = [(BWVISProcessorControllerConfiguration *)self->_processorControllerConfiguration videoStabilizationStrength];
        if (v41 == 3)
        {
          long long v42 = @"action";
        }
        else if (v41 == 4)
        {
          long long v42 = @"actionUltra";
        }
        else if (self->_stereoMode)
        {
          long long v42 = @"stereo";
        }
        else
        {
          long long v42 = @"video";
        }
        [v40 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F55758]];
        CMSetAttachment(a3, v38, v40, 1u);
      }
      -[BWVISNode _tallyAndEmitSampleBuffer:]((uint64_t)self, a3);
      return;
    }
    uint64_t v5 = v37;
    fig_log_get_emitter();
    uint64_t v45 = v4;
    LODWORD(v44) = v5;
    FigDebugAssert3();
LABEL_51:
    [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:v5, @"VIS Processor ready callback, generating drop", v44, v45 errorString];
    id v43 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1EFA67EE0, v46, [(BWVISNode *)a3 _droppedSamplePTSFromSampleBuffer:(uint64_t)v46]);
    -[BWVISNode _tallyAndEmitDroppedSample:]((uint64_t)self, v43);
  }
}

- (void)_addMotionTensorsToRingBuffer:(uint64_t)a3 pts:
{
  if (a1)
  {
    os_unfair_lock_lock(a1 + 149);
    uint64_t v6 = (uint64_t)&a1[8 * a1[148]._os_unfair_lock_opaque + 68];
    uint64_t v7 = *(void **)v6;
    uint64_t v8 = *(void *)(a3 + 16);
    *(_OWORD *)(v6 + 8) = *(_OWORD *)a3;
    *(void *)(v6 + 24) = v8;
    *(void *)&a1[8 * a1[148]._os_unfair_lock_opaque + 68]._os_unfair_lock_opaque = a2;

    a1[148]._os_unfair_lock_opaque = (a1[148]._os_unfair_lock_opaque + 1) % 0xA;
    os_unfair_lock_unlock(a1 + 149);
  }
}

- (uint64_t)_findBestMotionTensorsInRingBufferWithKey:(CMTime *)a3 pts:
{
  if (!a1) {
    return 0;
  }
  CMTime v15 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  os_unfair_lock_lock(a1 + 149);
  uint64_t v6 = 0xFFFFFFFFLL;
  for (int i = 9; i != -1; --i)
  {
    uint64_t v8 = i + a1[148]._os_unfair_lock_opaque - 10 * ((a1[148]._os_unfair_lock_opaque + i) / 0xA);
    uint64_t v9 = *(void **)&a1[8 * v8 + 68]._os_unfair_lock_opaque;
    if (v9 && (!a2 || [v9 objectForKeyedSubscript:a2]))
    {
      memset(&v14, 0, sizeof(v14));
      CMTime lhs = *(CMTime *)&a1[8 * v8 + 70]._os_unfair_lock_opaque;
      CMTime v11 = *a3;
      CMTimeSubtract(&time, &lhs, &v11);
      CMTimeAbsoluteValue(&v14, &time);
      CMTime lhs = v14;
      CMTime v11 = v15;
      if (CMTimeCompare(&lhs, &v11) > 0) {
        break;
      }
      CMTime v15 = v14;
      uint64_t v6 = v8;
    }
  }
  os_unfair_lock_unlock(a1 + 149);
  return v6;
}

- (uint64_t)_tranformRectanglesInMetadata:(long long *)a3 pts:
{
  id obj = a2;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a2 count])
    {
      uint64_t v4 = (void *)[*(id *)(a1 + 8) videoFormat];
      int v5 = [v4 width];
      int v6 = [v4 height];
      uint64_t v7 = (void *)[*(id *)(a1 + 16) videoFormat];
      int v43 = [v7 width];
      [v7 height];
      uint64_t v8 = *MEMORY[0x1E4F55C98];
      long long v45 = *a3;
      *(void *)&long long v46 = *((void *)a3 + 2);
      unsigned int v9 = -[BWVISNode _findBestMotionTensorsInRingBufferWithKey:pts:]((os_unfair_lock_s *)a1, v8, (CMTime *)&v45);
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v10 = (void *)[*(id *)(a1 + 272 + 32 * v9) objectForKeyedSubscript:v8];
        if ([v10 length] == 36)
        {
          uint64_t v42 = [v10 bytes];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v44 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v44)
          {
            unint64_t v40 = v5 | ((unint64_t)v6 << 32);
            uint64_t v41 = *(void *)v48;
            uint64_t v11 = *MEMORY[0x1E4F53CB0];
            double v12 = (double)v5;
            double v13 = (double)v6;
            uint64_t v14 = *MEMORY[0x1E4F53CB8];
            long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
            long long v39 = *MEMORY[0x1E4F1DB20];
            uint64_t v15 = *MEMORY[0x1E4F53CA8];
            do
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v48 != v41) {
                  objc_enumerationMutation(obj);
                }
                BOOL v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                long long v45 = v39;
                long long v46 = v38;
                FigCFDictionaryGetCGRectIfPresent();
                visn_transformRectangle(v42, v40, v43, *(double *)&v45, *((double *)&v45 + 1), *(double *)&v46, *((double *)&v46 + 1));
                FigCFDictionarySetCGRect();
                if ([v17 objectForKeyedSubscript:v11])
                {
                  int v18 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", v11), "intValue");
                  double v19 = (*(double *)&v45 + *(double *)&v46 * 0.5) * v12;
                  double v20 = (*((double *)&v45 + 1) + *((double *)&v46 + 1) * 0.5) * v13;
                  v54[0] = v19;
                  v54[1] = v20;
                  __double2 v21 = __sincos_stret((float)((float)v18 + -90.0) / 180.0 * 3.14159265);
                  uint64_t v22 = 0;
                  void v54[2] = v19 + v21.__cosval * 10.0;
                  v54[3] = v20 + v21.__sinval * 10.0;
                  char v23 = 1;
                  do
                  {
                    uint64_t v24 = 0;
                    char v25 = v23;
                    long long v26 = &v54[2 * v22];
                    double v27 = *v26;
                    double v28 = v26[1];
                    CFStringRef v29 = (float *)(v42 + 8);
                    do
                    {
                      double v30 = v28 * *(v29 - 1) + *(v29 - 2) * v27;
                      float v31 = *v29;
                      v29 += 3;
                      *(float *)&double v30 = v30 + v31;
                      v51.i32[v24++] = LODWORD(v30);
                    }
                    while (v24 != 3);
                    char v23 = 0;
                    float v32 = (const float *)&v52;
                    float32x2_t v33 = vld1_dup_f32(v32);
                    *(float64x2_t *)&v53[2 * v22] = vcvtq_f64_f32(vdiv_f32(v51, v33));
                    uint64_t v22 = 1;
                  }
                  while ((v25 & 1) != 0);
                  float v34 = atan2(v53[3] - v53[1], v53[2] - v53[0]) * 180.0 / 3.14159265;
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", FigCaptureNormalizeAngle(llroundf(v34 + 90.0))), v11);
                }
                if (objc_msgSend(v17, "objectForKeyedSubscript:", v14, obj) && *(unsigned char *)(a1 + 164)) {
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", FigCaptureNormalizeAngle(llroundf(-(float)(int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", v14), "intValue")))), v14);
                }
                if ([v17 objectForKeyedSubscript:v15]) {
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", FigCaptureNormalizeAngle((int)(float)(int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", v14), "intValue"))), v15);
                }
              }
              uint64_t v44 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
            }
            while (v44);
          }
        }
      }
    }
  }
  return 0;
}

- (BOOL)firstFrameProcessed
{
  return self->_firstFrameProcessed;
}

- (void)setFirstFrameProcessed:(BOOL)a3
{
  self->_firstFrameProcessed = a3;
}

- (BWFigCaptureISPProcessingSession)ispProcessingSession
{
  return self->_ispProcessingSession;
}

@end