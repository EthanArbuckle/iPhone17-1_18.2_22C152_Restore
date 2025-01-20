@interface FigCaptureCameraSourcePipeline
+ (void)initialize;
- (BOOL)hardwareDepthFilteringEnabled;
- (BOOL)postColorProcessingThumbnailEnabled;
- (BOOL)preLTMThumbnailEnabled;
- (BOOL)requiresMasterClock;
- (BOOL)stillImageOutputDerivesFromVideoCaptureOutput;
- (BOOL)trueVideoCaptureEnabled;
- (BOOL)videoHDRImageStatisticsEnabled;
- (NSString)description;
- (double)trueVideoCaptureAdditionalZoomFactor;
- (id)_addDepthFromInfraredSynchronizer:(void *)a3 previewOutputsBySourceDeviceType:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(uint64_t)a6 sourceDeviceType:;
- (id)_buildPointCloudOutputNetworkWithPipelineConfiguration:(void *)a3 graph:;
- (id)_insertSmartStyleLearningNodeOnOutputsBySourceDeviceType:(void *)a3 ifAllowedByAdditionalPreviewConnectionConfigurations:(void *)a4 semanticMasksOutputsBySourceDeviceType:(uint64_t)a5 pipelineConfiguration:(void *)a6 graph:;
- (id)_insertSmartStyleMetadataSynchronizerNodeOnOutputsBySourceDeviceType:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:;
- (id)initWithConfiguration:(void *)a3 captureDevice:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 renderDelegate:(uint64_t)a7 ispFastSwitchEnabled:(int *)a8 error:;
- (uint64_t)_addCrossOverNodeToGraph:(int)a3 outputNetworkType:(void *)a4 inputs:(uint64_t)a5 mediaType:(uint64_t)a6 name:(_DWORD *)a7 outErr:;
- (uint64_t)_addFunnelNodeToGraph:(void *)a3 inputs:(uint64_t)a4 mediaType:(uint64_t)a5 name:(_DWORD *)a6 outErr:;
- (uint64_t)_addOverCaptureSourcePipelineToGraph:(void *)a3 upstreamVideoCaptureOutputsBySourceDeviceType:(unsigned int)a4 depthEnabled:(uint64_t)a5 depthFilterRenderingEnabled:(unsigned int)a6 preLTMThumbnailEnabled:(unsigned int)a7 postColorProcessingThumbnailEnabled:(int)a8 forPreview:(unsigned int)a9 maxLossyCompressionLevel:(int)a10 numberOfSecondaryFramesToSkip:(_DWORD *)a11 outErr:;
- (uint64_t)_buildDetectedObjectsOutputNetwork:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:;
- (uint64_t)_buildMultiStreamCameraSourcePipeline:(uint64_t)result graph:(uint64_t)a2 renderDelegate:(void *)a3 fastModeSwitch:(uint64_t)a4;
- (uint64_t)_buildPreviewOutputNetwork:(uint64_t)a3 videoCaptureOutputsBySourceDeviceType:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(int)a6 numberOfSecondaryFramesToSkip:;
- (uint64_t)_buildSemanticMasksOutputNetwork:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:;
- (uint64_t)_buildVideoCaptureOutputNetwork:(void *)a3 previewOutputsBySourceDeviceType:(void *)a4 stillImageOutputsByPortType:(void *)a5 lightSourceMaskOutputsBySourceDeviceType:(void *)a6 keypointDescriptorDataOutputsBySourceDeviceType:(uint64_t)a7 pipelineConfiguration:(void *)a8 graph:(uint64_t)a9 videoCaptureDimensions:(int)a10 numberOfSecondaryFramesToSkip:;
- (uint64_t)_connectCinematicFramingNode:(void *)a3 videoOutputsBySourceDeviceType:(void *)a4 sourceDeviceTypes:(void *)a5 portTypes:(void *)a6 graph:(void *)a7 cameraConfiguration:stillImageCaptureEnabled:stillImageOutputsByPortType:;
- (uint64_t)_connectSubjectSelectionNode:(void *)a3 videoOutputsBySourceDeviceType:(uint64_t)a4 sourceDeviceTypes:(void *)a5 portTypes:(void *)a6 graph:;
- (uint64_t)_getDeviceOrientationCorrectionEnabledForVideoCaptureConnectionConfigurations:(uint64_t)a1;
- (uint64_t)_insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:(void *)a3 connectionConfigurations:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(unsigned int)a6 outputNetworkType:(int)a7 numberOfSecondaryFramesToSkip:;
- (uint64_t)_insertFunnelOnMetadataOutputsBySourceDeviceType:(void *)a3 connectionConfigurations:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(unsigned int)a6 mediaType:(uint64_t)a7 metadataName:;
- (uint64_t)_insertPreLTMThumbnailOutputsBySourceDeviceType:(void *)a3 previewOutputsBySourceDeviceType:(void *)a4 videoCaptureOutputsBySourceDeviceType:(uint64_t)a5 pipelineConfiguration:(void *)a6 graph:;
- (uint64_t)_insertSubjectSelectionAndCinematicFramingNodesOnOutputsBySourceDeviceType:(uint64_t)a1 connectionConfigurations:(void *)a2 pipelineConfiguration:(void *)a3 cameraInfoByPortType:(uint64_t)a4 graph:(uint64_t)a5 stillImageCaptureEnabled:(void *)a6 stillImageOutputsByPortType:(unsigned int)a7;
- (uint64_t)_rerouteDetectedObjectsOutputsForSourcesWithCinematicFramingEnabled:(void *)a3 graph:;
- (uint64_t)_stereoVideoAddSlaveFrameSynchronizerNode:(uint64_t)a3 input1:(uint64_t)a4 input2:(uint64_t)a5 mediaType:(uint64_t)a6 name:(_DWORD *)a7 outErr:;
- (uint64_t)allocateSharedBufferPools;
- (uint64_t)captureDevice;
- (uint64_t)captureSource;
- (uint64_t)captureSourceDepthDataFormat;
- (uint64_t)captureSourceVideoFormat;
- (uint64_t)cinematicFramingCameraStatesProvider;
- (uint64_t)clock;
- (uint64_t)colorSpaceProperties;
- (uint64_t)depthOutput;
- (uint64_t)depthType;
- (uint64_t)detectedObjectsOutputForSourceDeviceType:(uint64_t)result;
- (uint64_t)eyeReliefStatusOutputForSourceDeviceType:(uint64_t)result;
- (uint64_t)firmwareStillImageDimensionsAfterOverscanCropping;
- (uint64_t)getSmartStyle;
- (uint64_t)hackRetainedBufferCountsForDualStreamSources;
- (uint64_t)isLightSourceMaskAndKeypointDescriptorDataOnVideoCaptureOutputsEnabledForSourceDeviceType:(uint64_t)result;
- (uint64_t)logCameraStreamingInformationToAggd:(uint64_t)a3 applicationID:;
- (uint64_t)maxFrameRateClientOverride;
- (uint64_t)motionAttachmentsSource;
- (uint64_t)newConfigurationRequiresStreamRestart:(unsigned char *)a3 tnrConfigurationChanged:(void *)a4 newFormatIndexByPortTypeOut:;
- (uint64_t)nextPointCloudOutput;
- (uint64_t)nextPreviewOutputForSourceDeviceType:(uint64_t)a1;
- (uint64_t)nextVideoCaptureOutputForSourceDeviceType:(char *)a3 sharesBuffersWithOtherConnections:;
- (uint64_t)nextVideoCaptureOutputForSourceDeviceType:(uint64_t)result;
- (uint64_t)preferredPreviewDimensions;
- (uint64_t)prepareForStillImageCaptureWithStillImageOutputRetainedBufferCountOverride:(unsigned int)a3 infraRedStillImageOutputRetainedBufferCountOverride:(uint64_t)a4 clientBracketCount:(uint64_t)a5 enableSushiRawAttachmentOption:;
- (uint64_t)previewOutputTransformForSourceDeviceType:(uint64_t)a1;
- (uint64_t)secureDetectedObjectsOutputForSourceDeviceType:(uint64_t)result;
- (uint64_t)semanticMasksOutputsBySourceDeviceType:(uint64_t)result;
- (uint64_t)semanticStyleSceneObserver;
- (uint64_t)setBlackenFramesForContinuityDisplayConnected:(uint64_t)result;
- (uint64_t)setCinematicFramingControlsWhileRunning:(float)a3 panningAngleX:(float)a4 panningAngleY:(float)a5 videoZoomFactor:(double)a6 manualFramingDefaultZoomFactor:;
- (uint64_t)setCinematicVideoFocusDetectionsProvider:(uint64_t)result;
- (uint64_t)setDisableTemporalNoiseReductionWhenStopping:(uint64_t)result;
- (uint64_t)setEmitsFramesWhileStopping:(uint64_t)result;
- (uint64_t)setKeepISPStreamingWhenStopping:(uint64_t)result;
- (uint64_t)setMasterClock:(uint64_t)result;
- (uint64_t)setPreviewShift:(double)a3 previewScaleFactor:(double)a4 forPortType:(float)a5 previewShiftAtBaseZoom:(double)a6;
- (uint64_t)setSmartStyle:(uint64_t)result;
- (uint64_t)setStreamsSuspendedBySourceDeviceType:(uint64_t)result;
- (uint64_t)setWhileRunningBackgroundBlurEnabled:(uint64_t)a3 studioLightingEnabled:(uint64_t)a4 reactionEffectsEnabled:(uint64_t)a5 backgroundReplacementEnabled:;
- (uint64_t)sourceFormatReferenceOutput;
- (uint64_t)sourceNodes;
- (uint64_t)startIncrementalPrefetchingOfSourcePoolsIfNecessary;
- (uint64_t)stillImageOutputColorInfo;
- (uint64_t)stillImageOutputVideoFormat;
- (uint64_t)stillImageOutputsByPortType;
- (uint64_t)stillImageSensorRawOutputsByPortType;
- (uint64_t)trackedFacesOutputForSourceDeviceType:(uint64_t)result;
- (uint64_t)usesFirmwareStillImageOutput;
- (uint64_t)videoCaptureDimensionsWithoutOverscan;
- (uint64_t)videoCaptureOutputTransformForSourceDeviceType:(uint64_t)a1;
- (uint64_t)videoOutputColorInfo;
- (uint64_t)visionDataOutputForSourceDeviceType:(uint64_t)result;
- (void)_insertFunnelOnPreviewOutputsBySourceDeviceType:(void *)a3 previewDerivedConnectionConfigurations:(void *)a4 graph:;
- (void)_updateNumberOfFaceTrackingConnectionConfigurations:(void *)result;
- (void)dealloc;
- (void)nondisruptiveSwitchingFormatIndicesByPortTypeForConfiguration:(uint64_t)a1;
- (void)portTypesWithGeometricDistortionCorrectionOnPreviewOutputsEnabled;
- (void)portTypesWithGeometricDistortionCorrectionOnStillImageOutputEnabled;
- (void)portTypesWithGeometricDistortionCorrectionOnVideoCaptureOutputsEnabled;
- (void)setFaceFilteringDelegate:(void *)result;
- (void)ultraHighResolutionSensorRawDimensionsByPortType;
- (void)visOverscanPredictor:(id)a3 allowsReducedOverscan:(BOOL)a4;
- (void)zoomBasedQSubSensorRawDimensionsByPortType;
@end

@implementation FigCaptureCameraSourcePipeline

- (id)_addDepthFromInfraredSynchronizer:(void *)a3 previewOutputsBySourceDeviceType:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(uint64_t)a6 sourceDeviceType:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v10 = result;
    v34 = 0;
    if (a4)
    {
      v11 = *(void **)(a4 + 192);
      v12 = *(void **)(a4 + 200);
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    int v32 = [v11 previewDepthFilterRenderingEnabled];
    uint64_t v13 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a6));
    uint64_t v14 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a6));
    if (v13 | v14)
    {
      uint64_t v15 = v14;
      v31 = v10;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v16 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v29 = a5;
        v30 = a2;
        uint64_t v18 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v12);
            }
            v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            v21 = (void *)[v20 sinkConfiguration];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v21 sinkType] == 11)
            {
              if (v20) {
                BOOL v23 = v15 == 0;
              }
              else {
                BOOL v23 = 1;
              }
              char v22 = v23;
              goto LABEL_21;
            }
          }
          uint64_t v17 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        char v22 = 1;
LABEL_21:
        a2 = v30;
        a5 = v29;
      }
      else
      {
        char v22 = 1;
      }
      if (((v13 != 0) & v22) != 0) {
        uint64_t v24 = v13;
      }
      else {
        uint64_t v24 = v15;
      }
      id v25 = [[BWDepthSynchronizerNode alloc] initForStreaming:1 separateDepthComponentsEnabled:0];
      [v25 setName:@"Source Depth Synchronizer"];
      v33.receiver = v31;
      v33.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v33, sel_addNode_error_, v25, &v34) & 1) != 0
        && (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v24, objc_msgSend(v25, "imageInput"), 0) & 1) != 0
        && (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v31[11], "depthOutput"), objc_msgSend(v25, "depthInput"), 0) & 1) != 0)
      {
        [v25 setDiscardsDegradedDepthBuffers:v32 ^ 1u];
        uint64_t v26 = [v25 output];
        uint64_t v27 = [NSNumber numberWithInt:a6];
        if (v24 == v15) {
          v28 = a3;
        }
        else {
          v28 = a2;
        }
        [v28 setObject:v26 forKeyedSubscript:v27];
      }
      else
      {
        FigDebugAssert3();
      }
    }
    result = v34;
    if (v34) {
      return (id *)[v34 code];
    }
  }
  return result;
}

- (uint64_t)setWhileRunningBackgroundBlurEnabled:(uint64_t)a3 studioLightingEnabled:(uint64_t)a4 reactionEffectsEnabled:(uint64_t)a5 backgroundReplacementEnabled:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unsigned int v8 = a2;
    uint64_t v9 = result;
    v10 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
    [*(id *)(result + 440) setBackgroundBlurEnabled:a2];
    [*(id *)(v9 + 440) setStudioLightingEnabled:a3];
    [*(id *)(v9 + 440) setReactionEffectsEnabled:a4];
    [*(id *)(v9 + 440) setBackgroundReplacementEnabled:a5];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = (id)[*(id *)(v9 + 144) allValues];
    result = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    uint64_t v35 = result;
    if (result)
    {
      uint64_t v34 = *(void *)v49;
      unsigned int v33 = (a4 | a5 | a3 | v8) ^ 1;
      uint64_t v11 = v8;
      if (a3) {
        uint64_t v11 = v8 | 2;
      }
      if (a4) {
        v11 |= 0x10uLL;
      }
      if (a5) {
        v11 |= 0x40uLL;
      }
      uint64_t v32 = v11;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v49 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v12;
          uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
          [v13 setEffectBypassed:v33];
          [v13 setActiveBlurEffect:v32];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v39 = (id)[*(id *)(v9 + v10[847]) captureStreams];
          uint64_t v14 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v45;
            uint64_t v37 = *(void *)v45;
            do
            {
              uint64_t v17 = 0;
              uint64_t v38 = v15;
              do
              {
                if (*(void *)v45 != v16) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v18 = *(void **)(*((void *)&v44 + 1) + 8 * v17);
                if (objc_msgSend((id)objc_msgSend(v18, "stream"), "streaming"))
                {
                  int v43 = 0;
                  long long v41 = 0u;
                  long long v42 = 0u;
                  LOBYTE(v41) = [v18 pixelFormatIsTenBit];
                  [v18 maximumSupportedFrameRate];
                  DWORD1(v41) = v19;
                  BYTE8(v41) = [v18 highlightRecoveryEnabled];
                  HIDWORD(v41) = [v18 sensorDimensions];
                  LODWORD(v42) = (unint64_t)[v18 sensorDimensions] >> 32;
                  DWORD1(v42) = [v18 videoCaptureDimensions];
                  DWORD2(v42) = (unint64_t)[v18 videoCaptureDimensions] >> 32;
                  BYTE12(v42) = [*(id *)(v9 + v10[847]) backgroundBlurEnabled];
                  BYTE13(v42) = [*(id *)(v9 + v10[847]) studioLightingEnabled];
                  BYTE14(v42) = [*(id *)(v9 + v10[847]) reactionEffectsEnabled];
                  HIBYTE(v42) = [*(id *)(v9 + v10[847]) backgroundReplacementEnabled];
                  LOBYTE(v43) = [*(id *)(v9 + v10[847]) cinematicFramingEnabled];
                  if (v18) {
                    [v18 clientAuditToken];
                  }
                  else {
                    memset(v40, 0, sizeof(v40));
                  }
                  int PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(v40);
                  v21 = (const void *)[*(id *)(v9 + v10[847]) applicationID];
                  int v22 = *(_DWORD *)(v9 + 44);
                  uint64_t v23 = [v18 portType];
                  uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
                  [v18 averageFrameRate];
                  float v26 = v25;
                  uint64_t v27 = v10;
                  char v28 = [v18 continuityCameraIsWired];
                  char v29 = [v18 isDeskCamActive];
                  char v30 = v28;
                  v10 = v27;
                  FigCaptureLogCameraStreamingPowerEvent(PIDFromAuditToken, v21, v22, 1, v23, v24, v30, v29, v26, &v41);
                  uint64_t v16 = v37;
                  uint64_t v15 = v38;
                }
                ++v17;
              }
              while (v15 != v17);
              uint64_t v15 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }
            while (v15);
          }
          uint64_t v12 = v36 + 1;
        }
        while (v36 + 1 != v35);
        result = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        uint64_t v35 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)setSmartStyle:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v3 = objc_msgSend(*(id *)(result + 536), "allValues", 0);
    result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setSmartStyle:a2];
        }
        while (v4 != v6);
        result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)setPreviewShift:(double)a3 previewScaleFactor:(double)a4 forPortType:(float)a5 previewShiftAtBaseZoom:(double)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = *(void **)(result + 56);
    result = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (result)
    {
      uint64_t v14 = result;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
          if (objc_msgSend((id)objc_msgSend(v17, "portType"), "isEqualToString:", a2))
          {
            *(float *)&double v18 = a5;
            return objc_msgSend(v17, "setPreviewShift:previewScaleFactor:previewShiftAtBaseZoom:", a3, a4, v18, a6, a7);
          }
          ++v16;
        }
        while (v14 != v16);
        result = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v14 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)captureDevice
{
  if (result) {
    return *(void *)(result + 440);
  }
  return result;
}

- (BOOL)stillImageOutputDerivesFromVideoCaptureOutput
{
  if (result) {
    return *(unsigned char *)(result + 472) != 0;
  }
  return result;
}

- (uint64_t)motionAttachmentsSource
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 64) configuration];
    return [v1 motionAttachmentsSource];
  }
  return result;
}

- (uint64_t)usesFirmwareStillImageOutput
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 64) configuration];
    return [v1 usesFirmwareStillImageOutput];
  }
  return result;
}

- (uint64_t)_addOverCaptureSourcePipelineToGraph:(void *)a3 upstreamVideoCaptureOutputsBySourceDeviceType:(unsigned int)a4 depthEnabled:(uint64_t)a5 depthFilterRenderingEnabled:(unsigned int)a6 preLTMThumbnailEnabled:(unsigned int)a7 postColorProcessingThumbnailEnabled:(int)a8 forPreview:(unsigned int)a9 maxLossyCompressionLevel:(int)a10 numberOfSecondaryFramesToSkip:(_DWORD *)a11 outErr:
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    char v11 = a8;
    uint64_t v15 = result;
    id v91 = 0;
    uint64_t v16 = @"Video Capture Synchronizer";
    if (a8) {
      uint64_t v16 = @"Preview Synchronizer";
    }
    v77 = v16;
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v18 = [&unk_1EFB034A0 countByEnumeratingWithState:&v87 objects:v94 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v88 != v20) {
            objc_enumerationMutation(&unk_1EFB034A0);
          }
          uint64_t v22 = [a3 objectForKeyedSubscript:*(void *)(*((void *)&v87 + 1) + 8 * i)];
          if (v22) {
            [v17 addObject:v22];
          }
        }
        uint64_t v19 = [&unk_1EFB034A0 countByEnumeratingWithState:&v87 objects:v94 count:16];
      }
      while (v19);
    }
    uint64_t v23 = a11;
    if ((unint64_t)[v17 count] <= 1)
    {
      uint64_t v74 = v75;
      LODWORD(v73) = 0;
      FigDebugAssert3();
      int v72 = FigSignalErrorAt();
      v65 = 0;
      if (v72)
      {
LABEL_47:
        *uint64_t v23 = v72;
        return (uint64_t)[(BWNode *)v65 output];
      }
LABEL_45:
      if (v91) {
        int v72 = [v91 code];
      }
      goto LABEL_47;
    }
    unsigned int v76 = a7;
    if (!a4 || (v11 & 1) != 0) {
      goto LABEL_28;
    }
    uint64_t v24 = *(void **)(v15 + 64);
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "overscanForShiftMitigation");
    double v26 = v25 + 1.0;
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "sensorOverscan");
    double v28 = v26 * (v27 + 1.0);
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "overscanForShiftMitigation");
    double v30 = v29 + 1.0;
    objc_msgSend((id)objc_msgSend(v24, "configuration"), "sensorOverscan");
    double v32 = v30 * (v31 + 1.0);
    unint64_t v33 = objc_msgSend((id)objc_msgSend(v24, "configuration"), "videoCaptureDimensions");
    unint64_t v34 = HIDWORD(v33);
    float v35 = v28 * (double)(int)v33;
    LODWORD(v36) = FigCaptureRoundFloatToMultipleOf(2, v35);
    float v37 = v32 * (double)(int)v34;
    LODWORD(v38) = FigCaptureRoundFloatToMultipleOf(2, v37);
    id v39 = objc_msgSend((id)objc_msgSend(v24, "videoCaptureOutput"), "formatRequirements");
    int v40 = [v39 width];
    int v41 = [v39 height];
    BOOL v42 = v36 == v40 && v38 == v41;
    if (v42 || ![v17 count])
    {
LABEL_28:
      if (*(unsigned char *)(v15 + 528))
      {
        uint64_t v93 = *MEMORY[0x1E4F52DF0];
        uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
      }
      else
      {
        uint64_t v64 = 0;
      }
      LODWORD(v73) = a10;
      v65 = -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabled:postColorProcessingThumbnailEnabled:numberOfSecondaryFramesToSkip:]([BWSlaveFrameSynchronizerNode alloc], "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabled:postColorProcessingThumbnailEnabled:numberOfSecondaryFramesToSkip:", a4, [v17 count], v64, 0, a6, v76, v73);
      [(BWNode *)v65 setName:v77];
      v85.receiver = (id)v15;
      v85.super_class = (Class)FigCaptureCameraSourcePipeline;
      if (objc_msgSendSuper2(&v85, sel_addNode_error_, v65, &v91))
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        uint64_t v66 = [v17 countByEnumeratingWithState:&v81 objects:v92 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          int v68 = 0;
          uint64_t v69 = *(void *)v82;
          while (2)
          {
            for (uint64_t j = 0; j != v67; ++j)
            {
              if (*(void *)v82 != v69) {
                objc_enumerationMutation(v17);
              }
              if (!objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v81 + 1) + 8 * j), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v65, "inputs"), "objectAtIndexedSubscript:", (v68 + j)), 0))
              {
                uint64_t v74 = v75;
                LODWORD(v73) = 0;
                goto LABEL_42;
              }
            }
            uint64_t v67 = [v17 countByEnumeratingWithState:&v81 objects:v92 count:16];
            v68 += j;
            if (v67) {
              continue;
            }
            break;
          }
        }

        v71 = v65;
        int v72 = 0;
        *(void *)(v15 + 120) = v71;
        goto LABEL_44;
      }
      uint64_t v74 = v75;
      LODWORD(v73) = 0;
LABEL_42:
      FigDebugAssert3();
    }
    else
    {
      unint64_t v43 = 0;
      uint64_t v44 = a9;
      uint64_t v36 = (int)v36;
      uint64_t v38 = (int)v38;
      unint64_t v45 = 0x1E5C1E000uLL;
      while (1)
      {
        uint64_t v80 = [v17 objectAtIndexedSubscript:v43];
        id v46 = objc_alloc_init(*(Class *)(v45 + 3384));
        v86.receiver = (id)v15;
        v86.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v86, sel_addNode_error_, v46, &v91) & 1) == 0)
        {
          uint64_t v74 = v75;
          LODWORD(v73) = 0;
          goto LABEL_51;
        }
        [v46 setOutputWidth:v36];
        [v46 setOutputHeight:v38];
        [v46 setUpdatesSampleBufferMetadataForIrisVIS:1];
        [v46 setMaxLossyCompressionLevel:v44];
        if ([&unk_1EFB034B8 containsObject:FigCaptureGetModelSpecificName()] && v43 == 1)
        {
          [v46 setCropMode:2];
          long long v47 = *(void **)(v15 + 72);
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "overscanForShiftMitigation");
          double v49 = v48 + 1.0;
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "sensorOverscan");
          double v51 = v49 * (v50 + 1.0);
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "overscanForShiftMitigation");
          double v53 = v52 + 1.0;
          objc_msgSend((id)objc_msgSend(v47, "configuration"), "sensorOverscan");
          double v55 = v53 * (v54 + 1.0);
          unint64_t v56 = objc_msgSend((id)objc_msgSend(v47, "configuration"), "videoCaptureDimensions");
          uint64_t v57 = v38;
          uint64_t v58 = v36;
          uint64_t v59 = v44;
          uint64_t v60 = v15;
          unint64_t v61 = HIDWORD(v56);
          float v62 = v51 * (double)(int)v56;
          LODWORD(v47) = FigCaptureRoundFloatToMultipleOf(2, v62);
          double v63 = (double)(int)v61;
          uint64_t v15 = v60;
          uint64_t v44 = v59;
          uint64_t v36 = v58;
          uint64_t v38 = v57;
          unint64_t v45 = 0x1E5C1E000;
          *(float *)&double v63 = v55 * v63;
          objc_msgSend(v46, "setValidOutputDimensions:", v47 | (unint64_t)(FigCaptureRoundFloatToMultipleOf(2, *(float *)&v63) << 32));
        }
        if ((objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", v80, objc_msgSend(v46, "input"), 0) & 1) == 0) {
          break;
        }
        objc_msgSend(v17, "setObject:atIndexedSubscript:", objc_msgSend(v46, "output"), v43++);
        if ([v17 count] <= v43) {
          goto LABEL_28;
        }
      }
      uint64_t v74 = v75;
      LODWORD(v73) = 0;
LABEL_51:
      FigDebugAssert3();
      v65 = 0;
    }
    int v72 = 0;
LABEL_44:
    uint64_t v23 = a11;
    goto LABEL_45;
  }
  return result;
}

- (void)portTypesWithGeometricDistortionCorrectionOnPreviewOutputsEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    v2 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = (void *)v1[7];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "configuration"), "geometricDistortionCorrectionOnPreviewOutputEnabled"))objc_msgSend(v2, "addObject:", objc_msgSend(v8, "portType")); {
        }
          }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    return (id)[v2 copy];
  }
  return result;
}

- (uint64_t)hackRetainedBufferCountsForDualStreamSources
{
  if (result)
  {
    v1 = (id *)result;
    switch(*(_DWORD *)(result + 44))
    {
      case 4:
        id v9 = *(id *)(result + 64);
        int v10 = objc_msgSend((id)objc_msgSend(*(id *)(result + 72), "previewOutput"), "retainedBufferCount");
        if (v10 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "previewOutput"), "retainedBufferCount")) {
          long long v11 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        }
        else {
          long long v11 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__telephotoSourceNode;
        }
        objc_msgSend((id)objc_msgSend(v1[9], "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v11), "previewOutput"), "retainedBufferCount"));
        int v12 = objc_msgSend((id)objc_msgSend(v1[9], "videoCaptureOutput"), "retainedBufferCount");
        if (v12 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "videoCaptureOutput"), "retainedBufferCount")) {
          uint64_t v13 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        }
        else {
          uint64_t v13 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__telephotoSourceNode;
        }
        objc_msgSend((id)objc_msgSend(v1[9], "videoCaptureOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v13), "videoCaptureOutput"), "retainedBufferCount"));
        objc_msgSend((id)objc_msgSend(v9, "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(v1[9], "previewOutput"), "retainedBufferCount"));
        uint64_t v7 = objc_msgSend((id)objc_msgSend(v1[9], "videoCaptureOutput"), "retainedBufferCount");
        goto LABEL_24;
      case 6:
      case 0xC:
        id v2 = *(id *)(result + 64);
        int v3 = objc_msgSend((id)objc_msgSend(*(id *)(result + 88), "previewOutput"), "retainedBufferCount");
        int v4 = objc_msgSend((id)objc_msgSend(v2, "previewOutput"), "retainedBufferCount");
        id v5 = v2;
        if (v3 > v4) {
          id v5 = v1[11];
        }
        objc_msgSend((id)objc_msgSend(v1[11], "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(v5, "previewOutput"), "retainedBufferCount"));
        int v6 = objc_msgSend((id)objc_msgSend(v1[11], "videoCaptureOutput"), "retainedBufferCount");
        if (v6 > (int)objc_msgSend((id)objc_msgSend(v2, "videoCaptureOutput"), "retainedBufferCount")) {
          id v2 = v1[11];
        }
        uint64_t v7 = objc_msgSend((id)objc_msgSend(v2, "videoCaptureOutput"), "retainedBufferCount");
        uint64_t v8 = 11;
        goto LABEL_23;
      case 8:
        result = [*(id *)(result + 440) stereoVideoCaptureEnabled];
        if (!result) {
          return result;
        }
        int v14 = objc_msgSend((id)objc_msgSend(v1[10], "previewOutput"), "retainedBufferCount");
        if (v14 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "previewOutput"), "retainedBufferCount")) {
          uint64_t v15 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        }
        else {
          uint64_t v15 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__superWideSourceNode;
        }
        objc_msgSend((id)objc_msgSend(v1[10], "previewOutput"), "setRetainedBufferCount:", objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v15), "previewOutput"), "retainedBufferCount"));
        int v16 = objc_msgSend((id)objc_msgSend(v1[10], "videoCaptureOutput"), "retainedBufferCount");
        if (v16 <= (int)objc_msgSend((id)objc_msgSend(v1[8], "videoCaptureOutput"), "retainedBufferCount")) {
          uint64_t v17 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        }
        else {
          uint64_t v17 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__superWideSourceNode;
        }
        uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)((char *)v1 + *v17), "videoCaptureOutput"), "retainedBufferCount");
        uint64_t v8 = 10;
LABEL_23:
        id v9 = v1[v8];
LABEL_24:
        uint64_t v18 = (void *)[v9 videoCaptureOutput];
        result = [v18 setRetainedBufferCount:v7];
        break;
      default:
        return result;
    }
  }
  return result;
}

- (uint64_t)sourceFormatReferenceOutput
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (uint64_t)captureSourceVideoFormat
{
  if (result) {
    return *(void *)(result + 456);
  }
  return result;
}

- (uint64_t)clock
{
  if (result) {
    return [*(id *)(result + 64) clock];
  }
  return result;
}

- (uint64_t)videoCaptureDimensionsWithoutOverscan
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 64) configuration];
    return [v1 videoCaptureDimensions];
  }
  return result;
}

- (uint64_t)depthType
{
  if (result) {
    return *(unsigned int *)(result + 492);
  }
  return result;
}

- (uint64_t)videoCaptureOutputTransformForSourceDeviceType:(uint64_t)a1
{
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2)), "count"))
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2)), "objectAtIndexedSubscript:", 0);
      if (v4)
      {
        id v5 = (void *)v4;
        while (1)
        {
          int v6 = (void *)[v5 formatRequirements];
          if ([v6 width])
          {
            if ([v6 height]) {
              break;
            }
          }
          id v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "node"), "input"), "connection"), "output");
          if (!v5) {
            goto LABEL_8;
          }
        }
      }
      else
      {
LABEL_8:
        int v6 = 0;
      }
    }
    else
    {
      int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "videoCaptureOutput"), "formatRequirements");
    }
    [v6 width];
    [v6 height];
  }
  return 0;
}

- (uint64_t)_insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:(void *)a3 connectionConfigurations:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(unsigned int)a6 outputNetworkType:(int)a7 numberOfSecondaryFramesToSkip:
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v57 = result;
  if (!result) {
    return result;
  }
  unsigned int v73 = 0;
  id v72 = 0;
  if (a4)
  {
    if (*(_DWORD *)(a4 + 28) == 3) {
      goto LABEL_89;
    }
    long long v11 = *(void **)(a4 + 184);
  }
  else
  {
    long long v11 = 0;
  }
  unsigned int v54 = [v11 sourceDeviceType];
  id v12 = (id)[FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(a3) mutableCopy];
  if (a4) {
    uint64_t v13 = *(void **)(a4 + 192);
  }
  else {
    uint64_t v13 = 0;
  }
  int v14 = objc_msgSend((id)objc_msgSend(v13, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled");
  if (a4) {
    BOOL v15 = *(unsigned char *)(a4 + 302) != 0;
  }
  else {
    BOOL v15 = 0;
  }
  *(unsigned char *)(v57 + 528) = 0;
  int v16 = [*(id *)(v57 + 440) isBravoVariant];
  int v17 = 0;
  BOOL v18 = 0;
  if (v16)
  {
    unint64_t v19 = [a2 count];
    uint64_t v20 = objc_msgSend((id)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(a3, v54), "count");
    int v17 = 0;
    BOOL v18 = 0;
    if (v19 >= 2)
    {
      if (v20)
      {
        if (a4) {
          float v21 = *(float *)(a4 + 148);
        }
        else {
          float v21 = 0.0;
        }
        BOOL v22 = v21 == 0.0 || a6 == 2;
        BOOL v18 = !v22;
        int v23 = v14 ^ 1;
        if (!v22) {
          int v23 = 1;
        }
        if ((v15 | v23)) {
          goto LABEL_29;
        }
        if (a6)
        {
          uint64_t v24 = v57;
          if (a6 != 1)
          {
LABEL_28:
            BOOL v18 = *(unsigned char *)(v24 + 528) != 0;
LABEL_29:
            int v17 = !v18;
            goto LABEL_30;
          }
          char v25 = *(unsigned char *)(v57 + 40);
        }
        else
        {
          char v25 = 1;
          uint64_t v24 = v57;
        }
        *(unsigned char *)(v24 + 528) = v25;
        goto LABEL_28;
      }
    }
  }
LABEL_30:
  if (!a4 || !*(unsigned char *)(a4 + 346))
  {
    if (!v17)
    {
      if (v18)
      {
        if (a4) {
          unsigned int v38 = *(_DWORD *)(a4 + 28) != 0;
        }
        else {
          unsigned int v38 = 0;
        }
        if (FigCapturePlatformSupportsUniversalLossyCompression()) {
          unsigned int v39 = csp_maxLossyCompressionLevelForConnectionConfigurations(a3, (unsigned int *)a4);
        }
        else {
          unsigned int v39 = 0;
        }
        if (a4)
        {
          [*(id *)(a4 + 192) previewDepthFilterRenderingEnabled];
          unsigned int v46 = *(unsigned char *)(a4 + 344) != 0;
          unsigned int v47 = *(unsigned char *)(a4 + 345) != 0;
        }
        else
        {
          [0 previewDepthFilterRenderingEnabled];
          unsigned int v46 = 0;
          unsigned int v47 = 0;
        }
        objc_msgSend(a2, "setObject:forKeyedSubscript:", -[FigCaptureCameraSourcePipeline _addOverCaptureSourcePipelineToGraph:upstreamVideoCaptureOutputsBySourceDeviceType:depthEnabled:depthFilterRenderingEnabled:preLTMThumbnailEnabled:postColorProcessingThumbnailEnabled:forPreview:maxLossyCompressionLevel:numberOfSecondaryFramesToSkip:outErr:](v57, a5, a2, v38, 0, v46, v47, a6 == 0, v39, a7, &v73), objc_msgSend(NSNumber, "numberWithInt:", v54));
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        float v48 = (void *)[a2 allKeys];
        uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v75 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v64 != v51) {
                objc_enumerationMutation(v48);
              }
              double v53 = *(void **)(*((void *)&v63 + 1) + 8 * i);
              if ([v53 intValue] != v54) {
                [a2 setObject:0 forKeyedSubscript:v53];
              }
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v63 objects:v75 count:16];
          }
          while (v50);
        }
      }
      else
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        int v40 = (void *)[a2 allKeys];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v74 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v60 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v59 + 1) + 8 * j);
              if (([v12 containsObject:v45] & 1) == 0) {
                [a2 setObject:0 forKeyedSubscript:v45];
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v59 objects:v74 count:16];
          }
          while (v42);
        }
      }
      goto LABEL_89;
    }
    float v29 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = (id)[a2 allKeys];
    uint64_t v30 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v69;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v69 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v68 + 1) + 8 * k);
          if ([v12 containsObject:v34])
          {
            float v35 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
            v67.receiver = (id)v57;
            v67.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v67, sel_addNode_error_, v35, &v72) & 1) == 0
              || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v34), -[BWNode input](v35, "input"), 0) & 1) == 0)
            {
              goto LABEL_88;
            }
            objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v35, "outputs"), "objectAtIndexedSubscript:", 0), v34);
            objc_msgSend(v29, "addObject:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v35, "outputs"), "objectAtIndexedSubscript:", 1));
          }
          else
          {
            objc_msgSend(v29, "addObject:", objc_msgSend(a2, "objectForKeyedSubscript:", v34));
            [a2 setObject:0 forKeyedSubscript:v34];
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v31);
    }
    if (a6 > 2) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = off_1E5C27F18[a6];
    }
    objc_msgSend(a2, "setObject:forKeyedSubscript:", -[FigCaptureCameraSourcePipeline _addCrossOverNodeToGraph:outputNetworkType:inputs:mediaType:name:outErr:](v57, a5, a6, v29, 1986618469, (uint64_t)v36, &v73), objc_msgSend(NSNumber, "numberWithInt:", v54));
    if (!v73) {
      goto LABEL_89;
    }
LABEL_88:
    FigDebugAssert3();
    goto LABEL_89;
  }
  if (!a6 || a6 == 2)
  {
    uint64_t v37 = [a2 objectForKeyedSubscript:&unk_1EFAFF990];
    objc_msgSend(a2, "setObject:forKeyedSubscript:", v37, objc_msgSend(NSNumber, "numberWithInt:", v54));
    goto LABEL_89;
  }
  if (a6 == 1)
  {
    if (![*(id *)(v57 + 440) isBravoVariant]) {
      goto LABEL_88;
    }
    if (![a2 objectForKey:&unk_1EFAFF990]) {
      goto LABEL_88;
    }
    if (![a2 objectForKey:&unk_1EFAFF9C0]) {
      goto LABEL_88;
    }
    if ([a2 count] != 2) {
      goto LABEL_88;
    }
    uint64_t v26 = [a2 objectForKey:&unk_1EFAFF9C0];
    uint64_t v27 = [a2 objectForKey:&unk_1EFAFF990];
    [a2 setObject:-[FigCaptureCameraSourcePipeline _stereoVideoAddSlaveFrameSynchronizerNode:input1:input2:mediaType:name:outErr:](v57, a5, v26, v27, v28, @"Back Wide S-Wide sync node", &v73), &unk_1EFAFF9F0 forKeyedSubscript];
    [a2 setObject:0 forKeyedSubscript:&unk_1EFAFF990];
    [a2 setObject:0 forKeyedSubscript:&unk_1EFAFF9C0];
    if (v73) {
      goto LABEL_88;
    }
  }
LABEL_89:
  result = v73;
  if (!v73)
  {
    if (v72) {
      return [v72 code];
    }
  }
  return result;
}

- (uint64_t)colorSpaceProperties
{
  if (result) {
    return [*(id *)(result + 64) colorSpaceProperties];
  }
  return result;
}

- (void)ultraHighResolutionSensorRawDimensionsByPortType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    id v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v3 = (void *)v1[7];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (FigCaptureVideoDimensionsAreValid([v8 ultraHighResSensorRawStillImageOutputDimensions])) {
            objc_msgSend(v2, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(objc_msgSend(v8, "ultraHighResSensorRawStillImageOutputDimensions")), objc_msgSend(v8, "portType"));
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    return (id)[v2 copy];
  }
  return result;
}

- (id)initWithConfiguration:(void *)a3 captureDevice:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 renderDelegate:(uint64_t)a7 ispFastSwitchEnabled:(int *)a8 error:
{
  id v8 = a1;
  if (!a1) {
    return v8;
  }
  id v33 = 0;
  if (a2) {
    BOOL v15 = *(void **)(a2 + 184);
  }
  else {
    BOOL v15 = 0;
  }
  uint64_t v16 = [v15 source];
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v19 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v18 + 48);
  if (v19)
  {
    int v20 = v19(v16, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], &v33);
    if (v20)
    {
      int v29 = v20;
    }
    else
    {
      if (a2) {
        float v21 = *(void **)(a2 + 184);
      }
      else {
        float v21 = 0;
      }
      v32.receiver = v8;
      v32.super_class = (Class)FigCaptureCameraSourcePipeline;
      id v8 = objc_msgSendSuper2(&v32, sel_initWithGraph_name_sourceID_, a4, a5, [v21 sourceID]);
      if (!v8)
      {
LABEL_24:

        return v8;
      }
      if (a2) {
        BOOL v22 = *(void **)(a2 + 184);
      }
      else {
        BOOL v22 = 0;
      }
      if (![v22 source])
      {
        int v29 = FigSignalErrorAt();
        goto LABEL_27;
      }
      *((void *)v8 + 7) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *((_DWORD *)v8 + 11) = objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", @"DeviceType"), "intValue");
      *((_DWORD *)v8 + 12) = objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", @"Position"), "intValue");
      *((void *)v8 + 55) = a3;
      if (a2) {
        int v23 = *(void **)(a2 + 184);
      }
      else {
        int v23 = 0;
      }
      CFTypeRef v24 = (CFTypeRef)[v23 source];
      if (v24) {
        CFTypeRef v24 = CFRetain(v24);
      }
      *((void *)v8 + 56) = v24;
      if (a2)
      {
        *((void *)v8 + 57) = (id)[*(id *)(a2 + 184) requiredFormat];
        char v25 = *(void **)(a2 + 184);
      }
      else
      {
        id v31 = (id)[0 requiredFormat];
        char v25 = 0;
        *((void *)v8 + 57) = v31;
      }
      *((void *)v8 + 58) = (id)[v25 depthDataFormat];
      *((void *)v8 + 60) = (id)[a4 memoryPool];
      if (a2)
      {
        *((unsigned char *)v8 + 488) = *(float *)(a2 + 148) != 0.0;
        *((unsigned char *)v8 + 497) = *(unsigned char *)(a2 + 266);
        uint64_t v26 = *(void **)(a2 + 184);
      }
      else
      {
        uint64_t v26 = 0;
        *((unsigned char *)v8 + 488) = 0;
        *((unsigned char *)v8 + 497) = 0;
      }
      [v26 maxFrameRateClientOverride];
      *((_DWORD *)v8 + 125) = (int)v27;
      *((void *)v8 + 67) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *((void *)v8 + 68) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v28 = -[FigCaptureCameraSourcePipeline _buildMultiStreamCameraSourcePipeline:graph:renderDelegate:fastModeSwitch:]((uint64_t)v8, a2, a4, a6);
      if (!v28) {
        goto LABEL_24;
      }
      int v29 = v28;
    }
  }
  else
  {
    int v29 = -12782;
  }
  FigDebugAssert3();
LABEL_27:

  if (a8) {
    *a8 = v29;
  }

  return 0;
}

- (void)zoomBasedQSubSensorRawDimensionsByPortType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    id v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v3 = (void *)v1[7];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (FigCaptureVideoDimensionsAreValid([v8 zoomBasedQSubSensorRawStillImageOutputDimensions])) {
            objc_msgSend(v2, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(objc_msgSend(v8, "zoomBasedQSubSensorRawStillImageOutputDimensions")), objc_msgSend(v8, "portType"));
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    return (id)[v2 copy];
  }
  return result;
}

- (uint64_t)allocateSharedBufferPools
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [a1[8] allocateOrReuseBufferPoolsFromSourceNode:0];
  if (v2)
  {
    uint64_t v5 = v2;
    goto LABEL_10;
  }
  uint64_t v3 = [a1[9] allocateOrReuseBufferPoolsFromSourceNode:a1[8]];
  if (v3)
  {
    uint64_t v5 = v3;
    goto LABEL_10;
  }
  uint64_t v4 = [a1[10] allocateOrReuseBufferPoolsFromSourceNode:a1[8]];
  if (v4)
  {
    uint64_t v5 = v4;
    goto LABEL_10;
  }
  uint64_t v5 = [a1[11] allocateOrReuseBufferPoolsFromSourceNode:0];
  if (v5) {
LABEL_10:
  }
    FigDebugAssert3();
  return v5;
}

- (uint64_t)_buildPreviewOutputNetwork:(uint64_t)a3 videoCaptureOutputsBySourceDeviceType:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(int)a6 numberOfSecondaryFramesToSkip:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a4)
  {
    uint64_t v10 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:]((uint64_t)a1, a2, 0, 0, a5, 0, a6);
    long long v12 = 0;
    if (!v10) {
      goto LABEL_8;
    }
LABEL_33:
    uint64_t v14 = v10;
    goto LABEL_34;
  }
  uint64_t v10 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:]((uint64_t)a1, a2, *(void **)(a4 + 200), a4, a5, 0, a6);
  if (v10) {
    goto LABEL_33;
  }
  if (*(unsigned char *)(a4 + 320))
  {
    if (*(_DWORD *)(a4 + 28) != 3)
    {
      long long v11 = -[FigCaptureCameraSourcePipeline _insertSmartStyleLearningNodeOnOutputsBySourceDeviceType:ifAllowedByAdditionalPreviewConnectionConfigurations:semanticMasksOutputsBySourceDeviceType:pipelineConfiguration:graph:](a1, a2, 0, a1[54], a4, a5);
      if (v11)
      {
        uint64_t v14 = (uint64_t)v11;
        goto LABEL_34;
      }
    }
  }
  long long v12 = *(void **)(a4 + 200);
LABEL_8:
  uint64_t v13 = -[FigCaptureCameraSourcePipeline _insertFunnelOnPreviewOutputsBySourceDeviceType:previewDerivedConnectionConfigurations:graph:](a1, a2, v12, a5);
  if (v13)
  {
    uint64_t v14 = (uint64_t)v13;
LABEL_34:
    FigDebugAssert3();
    return v14;
  }
  if (!objc_msgSend((id)objc_msgSend(a2, "allKeys"), "count")) {
    return 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = [a2 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v14) {
    return v14;
  }
  uint64_t v15 = *(void *)v30;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(a2);
      }
      uint64_t v17 = [a2 objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * v16)];
      uint64_t v18 = (void *)v17;
      if (a4)
      {
        unint64_t v19 = *(void **)(a4 + 184);
        if (!v17) {
          goto LABEL_22;
        }
      }
      else
      {
        unint64_t v19 = 0;
        if (!v17) {
          goto LABEL_22;
        }
      }
      [v19 requiredMinFrameRate];
      float v21 = v20;
      [v19 requiredMaxFrameRate];
      if (v21 == v22)
      {
        int v23 = BWGetMaximumDisplayFrequency();
        int v24 = objc_msgSend((id)objc_msgSend(v19, "requiredFormat"), "preferredPreviewMaxFrameRate");
        if (v24 >= 1)
        {
          int v26 = v24;
          if (v24 <= v23)
          {
            [v19 requiredMaxFrameRate];
            int v23 = (int)*(float *)&v25 / ((v26 + (int)*(float *)&v25 - 1) / v26);
          }
        }
        *(float *)&double v25 = (float)v23;
        [v18 setMaxSampleDataOutputRate:v25];
      }
LABEL_22:
      ++v16;
    }
    while (v14 != v16);
    uint64_t v27 = [a2 countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v14 = v27;
  }
  while (v27);
  return v14;
}

- (uint64_t)setBlackenFramesForContinuityDisplayConnected:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(result + 440), "captureStreams", 0);
    result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setBlackenFramesForContinuityDisplayConnected:a2];
        }
        while (v4 != v6);
        result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_buildMultiStreamCameraSourcePipeline:(uint64_t)result graph:(uint64_t)a2 renderDelegate:(void *)a3 fastModeSwitch:(uint64_t)a4
{
  uint64_t v641 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v6 = result;
  unsigned int v607 = 0;
  id v606 = 0;
  v465 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v464 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v468 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v451 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v454 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v456 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v455 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v458 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v452 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v453 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v439 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v457 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (a2)
  {
    v536 = *(void **)(a2 + 16);
    unsigned int v7 = *(_DWORD *)(a2 + 28);
    BOOL v500 = *(unsigned char *)(a2 + 117) != 0;
    long long v8 = *(void **)(a2 + 184);
    v541 = *(void **)(a2 + 192);
    v544 = *(void **)(a2 + 200);
    long long v9 = *(void **)(a2 + 216);
    v546 = *(void **)(a2 + 208);
    v532 = *(void **)(a2 + 224);
    long long v10 = *(void **)(a2 + 256);
  }
  else
  {
    v532 = 0;
    v546 = 0;
    v541 = 0;
    BOOL v500 = 0;
    v536 = 0;
    unsigned int v7 = 0;
    long long v8 = 0;
    v544 = 0;
    long long v9 = 0;
    long long v10 = 0;
  }
  uint64_t v548 = a2;
  if ([v10 count] && objc_msgSend(v10, "count"))
  {
    unint64_t v11 = 0;
    do
    {
      int v12 = objc_msgSend((id)objc_msgSend(v10, "firstObject"), "pointCloudOutputDisabled");
      if ((v12 & 1) == 0) {
        break;
      }
      ++v11;
    }
    while ([v10 count] > v11);
    unsigned int v476 = v12 ^ 1;
    a2 = v548;
    if (v548) {
      goto LABEL_10;
    }
  }
  else
  {
    unsigned int v476 = 0;
    if (a2)
    {
LABEL_10:
      uint64_t v13 = *(void **)(a2 + 256);
      goto LABEL_11;
    }
  }
  uint64_t v13 = 0;
LABEL_11:
  if ([v13 count])
  {
    unsigned int v14 = objc_msgSend((id)objc_msgSend(v13, "firstObject"), "supplementalPointCloudData");
    if ((unint64_t)[v13 count] >= 2)
    {
      unint64_t v15 = 1;
      do
      {
        if (v14 != objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v15), "supplementalPointCloudData"))objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Point cloud connection configs with the same source should have the same supplementalPointCloudData value", 0)); {
        ++v15;
        }
      }
      while ([v13 count] > v15);
      a2 = v548;
    }
    if (a2) {
      goto LABEL_18;
    }
  }
  else
  {
    unsigned int v14 = 0;
    if (a2)
    {
LABEL_18:
      uint64_t v16 = *(void **)(a2 + 256);
      goto LABEL_19;
    }
  }
  uint64_t v16 = 0;
LABEL_19:
  long long v632 = 0u;
  long long v633 = 0u;
  long long v634 = 0u;
  long long v635 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v632 objects:&v636 count:16];
  v542 = v9;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v633;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v633 != v19) {
          objc_enumerationMutation(v16);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v632 + 1) + 8 * i), "sinkConfiguration"), "sinkType") == 15)
        {
          int v437 = 1;
          goto LABEL_29;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v632 objects:&v636 count:16];
      if (v18) {
        continue;
      }
      break;
    }
    int v437 = 0;
LABEL_29:
    long long v9 = v542;
  }
  else
  {
    int v437 = 0;
  }
  int v21 = [v8 depthDataDeliveryEnabled];
  if (v7 == 3) {
    int v22 = 0;
  }
  else {
    int v22 = v21;
  }
  int v539 = v22;
  char v475 = [v541 previewDepthFilterRenderingEnabled];
  v550 = (void *)[v8 requiredFormat];
  unsigned __int8 v472 = objc_msgSend((id)objc_msgSend(v9, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization");
  int v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 440), "captureStream"), "stream"), "supportedProperties");
  uint64_t v559 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F54880]];
  int v24 = [v8 cinematicFramingEnabled];
  int v25 = [v8 manualCinematicFramingEnabled];
  int v26 = v25;
  v545 = a3;
  unsigned int v473 = v14;
  if (v24)
  {
    if (v548) {
      char v27 = v25;
    }
    else {
      char v27 = 1;
    }
    if ((v27 & 1) == 0) {
LABEL_41:
    }
      int v26 = 0;
  }
  else
  {
    if (v548) {
      char v35 = v25;
    }
    else {
      char v35 = 1;
    }
    if (v548) {
      int v26 = 1;
    }
    else {
      int v26 = v25;
    }
    if ((v35 & 1) == 0) {
      goto LABEL_41;
    }
  }
  int v28 = [v8 deskCamEnabled];
  unsigned int v29 = FigCaptureCinematicFramingNodeRequiredInGraph(v24, objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "isCinematicFramingProvidedBySource"), v26);
  int v570 = FigCaptureVideoEffectEnabledInGraph(@"backgroundblur", [v8 backgroundBlurEnabled], objc_msgSend(v8, "isBackgroundBlurSupported"), objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "isBackgroundBlurProvidedBySource"), v9 != 0, 0);
  int v564 = FigCaptureVideoEffectEnabledInGraph(@"studiolighting", [v8 studioLightingEnabled], objc_msgSend(v8, "isStudioLightingSupported"), objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "isStudioLightingProvidedBySource"), v9 != 0, 0);
  int v474 = FigCaptureVideoEffectEnabledInGraph(@"reactioneffects", [v8 reactionEffectsEnabled], objc_msgSend(v8, "reactionEffectsSupported"), objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "reactionEffectsProvidedBySource"), v9 != 0, 0);
  int v30 = FigCaptureVideoEffectEnabledInGraph(@"backgroundreplacement", [v8 backgroundReplacementEnabled], objc_msgSend(v8, "isBackgroundReplacementSupported"), objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "isBackgroundReplacementProvidedBySource"), v9 != 0, 0);
  int v556 = v28;
  unsigned int obj = v29;
  int v495 = v28 | v29;
  unint64_t v31 = csp_videoCaptureDimensionsFromConnectionConfigurations((void *)[v8 requiredFormat], v9, (uint64_t)v546, v544, (uint64_t)v532, v28 | v29);
  int shouldUseFESCompanionIndex = csp_shouldUseFESCompanionIndex(v8, v546, v31);
  unint64_t v543 = v31;
  unsigned __int8 shouldUseDepthCompanionIndex = csp_shouldUseDepthCompanionIndex(v8, v546, v31);
  unsigned __int8 v470 = [*(id *)(v6 + 440) hasFlash];
  if ((int)FigCapturePlatformIdentifier() > 10)
  {
    unsigned __int8 v469 = 0;
    uint64_t v32 = v548;
    if (!v548) {
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v32 = v548;
    if (v548) {
      id v33 = *(void **)(v548 + 192);
    }
    else {
      id v33 = 0;
    }
    if (objc_msgSend((id)objc_msgSend(v33, "sinkConfiguration"), "sinkType") == 1)
    {
      unsigned __int8 v469 = [v33 enabled];
      if (!v548)
      {
LABEL_47:
        BOOL v538 = 0;
        float v34 = 0.0;
        goto LABEL_58;
      }
    }
    else
    {
      unsigned __int8 v469 = 0;
      if (!v548) {
        goto LABEL_47;
      }
    }
  }
  float v34 = *(float *)(v32 + 148);
  BOOL v538 = v34 != 0.0;
LABEL_58:
  int v535 = csp_dockKitNodeEnabled(v32, [v545 isRunningForContinuityCapture]);
  int v36 = csp_willDecoupleWarperFromStreamProcessing(v536);
  uint64_t v549 = v6;
  unsigned int v540 = v7;
  id v568 = v8;
  if (v539)
  {
    uint64_t v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
    int v38 = [*(id *)(v6 + 440) isBravoVariant];
    int v39 = v38;
    int v531 = 0;
    BOOL v40 = v543 == 3840;
    if (v543 == 3840 && v38)
    {
      uint64_t v41 = *(void **)(v6 + 440);
      long long v632 = 0u;
      long long v633 = 0u;
      long long v634 = 0u;
      long long v635 = 0u;
      uint64_t v42 = (void *)[v41 captureStreams];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v632 objects:&v636 count:16];
      if (!v43) {
        goto LABEL_97;
      }
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v633;
      uint64_t v46 = *MEMORY[0x1E4F52DD8];
      uint64_t v47 = *MEMORY[0x1E4F52DE8];
LABEL_63:
      uint64_t v48 = 0;
      while (1)
      {
        if (*(void *)v633 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v49 = *(void **)(*((void *)&v632 + 1) + 8 * v48);
        if ([v41 bravoTelephotoCaptureStream])
        {
          if (objc_msgSend((id)objc_msgSend(v49, "portType"), "isEqualToString:", v46)) {
            break;
          }
        }
        if ([v41 bravoSuperWideCaptureStream]
          && (objc_msgSend((id)objc_msgSend(v49, "portType"), "isEqualToString:", v47) & 1) != 0)
        {
          break;
        }
        if (v44 == ++v48)
        {
          uint64_t v44 = [v42 countByEnumeratingWithState:&v632 objects:&v636 count:16];
          if (!v44) {
            goto LABEL_97;
          }
          goto LABEL_63;
        }
      }
      if (!v49)
      {
LABEL_97:
        unsigned int v607 = FigSignalErrorAt();
        goto LABEL_462;
      }
      long long v8 = v568;
      uint64_t v50 = BWUtilitiesUnderlyingDeviceTypeFromPortType((void *)[v49 portType], objc_msgSend(v568, "sourceDeviceType"));
      uint64_t v51 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v546);
      float v52 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v544);
      uint64_t v6 = v549;
      if (objc_msgSend(v51, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v50))) {
        int v53 = 1;
      }
      else {
        int v53 = objc_msgSend(v52, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v50));
      }
      uint64_t v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
      int v531 = v53 ^ 1;
      BOOL v40 = 1;
      int v39 = 1;
    }
  }
  else
  {
    int v39 = 0;
    int v531 = 0;
    BOOL v40 = v543 == 3840;
    uint64_t v37 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
  }
  unsigned int v54 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + v37[847]), "captureStream"), "supportedOutputs");
  if (([v54 containsObject:*MEMORY[0x1E4F55410]] ^ 1 | v36)) {
    int v55 = 1;
  }
  else {
    int v55 = v39 & (v531 ^ 1);
  }
  unint64_t v56 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + v37[847]), "captureStream"), "supportedOutputs");
  if ([v56 containsObject:*MEMORY[0x1E4F55420]])
  {
    int v57 = [v550 isSecondaryScalerUnavailable];
    if (v559) {
      int v58 = 0;
    }
    else {
      int v58 = v36;
    }
    int v59 = v57 | v58;
  }
  else
  {
    int v59 = 1;
  }
  int v537 = v59;
  if ((v539 & v40) == 1)
  {
    uint64_t v60 = [v546 count];
    int v61 = v537;
    if (v60) {
      int v61 = 1;
    }
    int v537 = v61;
  }
  long long v62 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + v37[847]), "captureStream"), "supportedOutputs");
  int v63 = [v62 containsObject:*MEMORY[0x1E4F553F8]];
  int v64 = [v8 geometricDistortionCorrectionEnabled];
  if ((int)FigCapturePlatformIdentifier() <= 9
    && v64
    && (([v536 containsObject:&unk_1EFAFF9A8] & 1) != 0
     || [v536 containsObject:&unk_1EFAFF9D8]))
  {
    goto LABEL_97;
  }
  if (v548)
  {
    HIDWORD(v463) = *(unsigned char *)(v548 + 138) != 0;
    int v467 = *(unsigned char *)(v548 + 137) != 0;
    HIDWORD(v477) = *(_DWORD *)(v548 + 160);
    LODWORD(v477) = *(_DWORD *)(v548 + 164);
    LODWORD(v463) = *(_DWORD *)(v548 + 168);
    unsigned int v462 = *(_DWORD *)(v548 + 172);
    if ([v550 sushiRawSupported]) {
      unsigned __int8 v461 = *(unsigned char *)(v548 + 264) == 0;
    }
    else {
      unsigned __int8 v461 = 0;
    }
    unsigned __int8 v460 = *(unsigned char *)(v548 + 176) != 0;
  }
  else
  {
    unsigned __int8 v461 = [v550 sushiRawSupported];
    uint64_t v463 = 0;
    uint64_t v477 = 0;
    int v467 = 0;
    unsigned int v462 = 0;
    unsigned __int8 v460 = 0;
  }
  if ((int)FigCapturePlatformIdentifier() < 7) {
    int v65 = 1;
  }
  else {
    int v65 = v55;
  }
  if ((v65 | v537)) {
    LOBYTE(v66) = 0;
  }
  else {
    int v66 = csp_gdcExpandsImageDimensions([v8 source]) ^ 1;
  }
  int v466 = v570 | v564 | v474 | v30;
  objc_super v67 = v550;
  *(unsigned char *)(v549 + 472) = csp_shouldCaptureStillsFromVideoStream(v8, v550, shouldUseFESCompanionIndex, v542 != 0);
  *(unsigned char *)(v549 + 40) = 0;
  if (!v544) {
    goto LABEL_129;
  }
  if (v542) {
    int v68 = [v550 capturesStillsFromVideoStream];
  }
  else {
    int v68 = 0;
  }
  if ([v546 count]) {
    int v68 = 1;
  }
  if (v64) {
    int v69 = [*(id *)(v549 + 440) isBravoVariant] & v531;
  }
  else {
    LOBYTE(v69) = 1;
  }
  char v70 = v66 | v69;
  if ((v537 ^ 1) + (v55 ^ 1u) + v63 <= 1) {
    char v70 = 0;
  }
  if (v68 && (v70 & 1) == 0)
  {
    *(unsigned char *)(v549 + 40) = 1;
LABEL_124:
    uint64_t v71 = v548;
    objc_super v67 = v550;
LABEL_130:
    id v72 = v568;
    goto LABEL_131;
  }
  if (![v546 count] && !*(unsigned char *)(v549 + 472)) {
    goto LABEL_124;
  }
  objc_super v67 = v550;
  if ((v556 | v55 & v537 | v538 | obj | v466) == 1)
  {
    *(unsigned char *)(v549 + 40) = 1;
    LOBYTE(v467) = v64;
LABEL_129:
    uint64_t v71 = v548;
    goto LABEL_130;
  }
  id v72 = v568;
  if (HIDWORD(v463) == v467)
  {
    if (([v536 containsObject:&unk_1EFAFFB28] ^ 1 | v64) == 1)
    {
      uint64_t v401 = [v550 previewDimensions];
      int v402 = HIDWORD(v543) * v543;
      int v403 = HIDWORD(v401) * v401;
      uint64_t v71 = v548;
      if (HIDWORD(v401) * (int)v401 <= HIDWORD(v543) * (int)v543 && (float)((float)v403 * 1.5385) >= (float)v402
        || v402 <= v403 && (float)((float)v402 * 1.5385) >= (float)v403)
      {
        *(unsigned char *)(v549 + 40) = 1;
      }
      else if ((int)v401 < (int)v543 && v537 | v55)
      {
        v404 = (void *)[v568 requiredFormat];
        if (shouldUseFESCompanionIndex) {
          int v405 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v404, "frontEndScalerCompanionFormats"), "firstObject"), "fesDimensions");
        }
        else {
          int v405 = [v404 nativeDimensions];
        }
        *(unsigned char *)(v549 + 40) = (float)((float)(int)v543 * 1.2) < (float)v405;
      }
      goto LABEL_131;
    }
  }
  else
  {
    *(unsigned char *)(v549 + 40) = 0;
  }
  uint64_t v71 = v548;
LABEL_131:
  if (v71)
  {
    *(unsigned char *)(v549 + 552) = csp_trueVideoCaptureEnabled(*(void **)(v71 + 208));
    if (*(unsigned char *)(v71 + 336) && !*(unsigned char *)(v549 + 552))
    {
      int v73 = dword_1EB4C5210;
      if (dword_1EB4C5210)
      {
        LODWORD(v631[0]) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        uint64_t v71 = v548;
        objc_super v67 = v550;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v73 = 0;
      }
    }
    else
    {
      int v73 = 8;
    }
    uint64_t v74 = *(void **)(v71 + 256);
  }
  else
  {
    char v420 = csp_trueVideoCaptureEnabled(0);
    uint64_t v74 = 0;
    *(unsigned char *)(v549 + 552) = v420;
    int v73 = 8;
  }
  int v431 = v73;
  unsigned int v75 = csp_projectorModeFromPointCloudDataConnectionConfigurations(v74);
  unsigned int v529 = csp_cinematicVideoEnabled(v71);
  if (FigCaptureVideoDimensionsAreValid([v67 sensorCropDimensions])) {
    uint64_t v76 = [v67 sensorCropDimensions];
  }
  else {
    uint64_t v76 = [v67 sensorDimensions];
  }
  float v77 = (float)((float)(int)v76 * (float)(int)objc_msgSend(v67, "horizontalSensorBinningFactor", v421, v425))
      / (float)SHIDWORD(v76);
  float v78 = (float)((float)(int)v543 / (float)SHIDWORD(v543))
      - (float)(v77 * (float)(int)[v67 verticalSensorBinningFactor]);
  if (v71) {
    uint64_t v79 = *(void *)(v71 + 208);
  }
  else {
    uint64_t v79 = 0;
  }
  id v80 = +[FigVideoCaptureConnectionConfiguration videoStabilizationMethods:v79 includeIris:1];
  unsigned int v81 = csp_stabilizationMethodWithMostOverscan(v80);
  if (v78 <= 0.01
    || ((objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "videoStabilizationAdaptiveOverscanSupported") ^ 1 | v529) & 1) != 0)
  {
    goto LABEL_143;
  }
  if (v548 && *(unsigned char *)(v548 + 24))
  {
    unsigned int v515 = 0;
    v533 = *(void **)(v549 + 440);
    goto LABEL_145;
  }
  if (([v72 cinematicFramingEnabled] & 1) != 0
    || ([v72 manualCinematicFramingEnabled] & 1) != 0
    || (v40 & ([v72 deskCamEnabled] ^ 1)) != 1
    || ([v80 containsObject:&unk_1EFAFFB28] & 1) != 0)
  {
LABEL_143:
    unsigned int v515 = 0;
  }
  else
  {
    unsigned int v515 = [v80 containsObject:&unk_1EFAFF9D8] ^ 1;
  }
  v533 = *(void **)(v549 + 440);
  if (v548)
  {
LABEL_145:
    uint64_t v82 = v548;
    LODWORD(v506) = *(_DWORD *)(v548 + 180);
    HIDWORD(v506) = *(unsigned char *)(v548 + 142) != 0;
    LODWORD(v508) = *(unsigned char *)(v548 + 152) != 0;
    HIDWORD(v508) = *(unsigned char *)(v548 + 153) != 0;
    BOOL v503 = *(unsigned char *)(v548 + 143) != 0;
    BOOL v485 = *(unsigned char *)(v548 + 159) != 0;
    long long v83 = *(void **)(v548 + 224);
    goto LABEL_146;
  }
  BOOL v485 = 0;
  uint64_t v508 = 0;
  uint64_t v506 = 0;
  BOOL v503 = 0;
  long long v83 = 0;
  uint64_t v82 = 0;
LABEL_146:
  uint64_t v84 = *(void *)(v549 + 480);
  unsigned int v85 = objc_msgSend((id)objc_msgSend(v83, "depthDataSinkConfiguration"), "filteringEnabled");
  *(void *)&long long v636 = 0;
  unsigned int v522 = v81;
  unsigned int v520 = v85;
  uint64_t v504 = v84;
  if (v82) {
    objc_super v86 = *(void **)(v82 + 184);
  }
  else {
    objc_super v86 = 0;
  }
  uint64_t v87 = [v86 source];
  uint64_t v88 = *MEMORY[0x1E4F1CF80];
  uint64_t v89 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v89) {
    uint64_t v90 = v89;
  }
  else {
    uint64_t v90 = 0;
  }
  id v91 = *(void (**)(uint64_t, __CFString *, uint64_t, long long *))(v90 + 48);
  if (v91)
  {
    v91(v87, @"AttributesDictionary", v88, &v636);
    v92 = (void *)v636;
  }
  else
  {
    v92 = 0;
  }
  id v93 = v92;
  uint64_t v428 = v88;
  unsigned int v524 = v75;
  unsigned int v511 = objc_msgSend((id)objc_msgSend((id)v636, "objectForKeyedSubscript:", @"VideoZoomSmoothingSupported"), "BOOLValue");
  if (v548)
  {
    BOOL v518 = *(unsigned char *)(v548 + 155) != 0;
    uint64_t v491 = *(void *)(v548 + 312);
    int v94 = *(_DWORD *)(v548 + 304);
    int v95 = *(_DWORD *)(v548 + 32);
    BOOL v526 = *(unsigned char *)(v548 + 346) != 0;
    BOOL v489 = *(unsigned char *)(v548 + 156) != 0;
    BOOL v496 = *(unsigned char *)(v548 + 336) != 0;
    unsigned int v501 = *(_DWORD *)(v548 + 340);
    BOOL v493 = *(unsigned char *)(v548 + 300) != 0;
    BOOL v513 = *(unsigned char *)(v548 + 349) != 0;
    BOOL v498 = *(unsigned char *)(v548 + 350) != 0;
  }
  else
  {
    BOOL v513 = 0;
    unsigned int v501 = 0;
    BOOL v489 = 0;
    uint64_t v491 = 0;
    BOOL v518 = 0;
    BOOL v526 = 0;
    BOOL v496 = 0;
    BOOL v493 = 0;
    BOOL v498 = 0;
    int v95 = 0;
    int v94 = 0;
  }
  int v487 = *(unsigned __int8 *)(v549 + 552);
  unsigned int v620 = 0;
  v96 = (void *)[v72 requiredFormat];
  v565 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  *(_OWORD *)type = 0u;
  long long v617 = 0u;
  long long v618 = 0u;
  long long v619 = 0u;
  id obja = (id)[v533 captureStreams];
  id v571 = (id)[obja countByEnumeratingWithState:type objects:&v636 count:16];
  if (v571)
  {
    uint64_t v560 = *(void *)v617;
    v557 = v96;
    do
    {
      for (uint64_t j = 0; j != v571; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v617 != v560) {
          objc_enumerationMutation(obja);
        }
        v98 = *(void **)(*(void *)&type[8] + 8 * (void)j);
        uint64_t v99 = FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType([v72 source], v96, objc_msgSend(v98, "portType"), &v620);
        if (v620)
        {
          unsigned int v607 = v620;
LABEL_461:
          FigDebugAssert3();
          goto LABEL_462;
        }
        v100 = (const void *)v99;
        if (v99) {
          v101 = (void *)v99;
        }
        else {
          v101 = v96;
        }
        v102 = (void *)[MEMORY[0x1E4F1CA80] set];
        long long v612 = 0u;
        long long v613 = 0u;
        long long v614 = 0u;
        long long v615 = 0u;
        v103 = (void *)[v101 highResStillImageDimensions];
        uint64_t v104 = [v103 countByEnumeratingWithState:&v612 objects:&v632 count:16];
        if (v104)
        {
          uint64_t v105 = v104;
          uint64_t v106 = *(void *)v613;
          do
          {
            for (uint64_t k = 0; k != v105; ++k)
            {
              if (*(void *)v613 != v106) {
                objc_enumerationMutation(v103);
              }
              objc_msgSend(v102, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v612 + 1) + 8 * k), "flavor")));
            }
            uint64_t v105 = [v103 countByEnumeratingWithState:&v612 objects:&v632 count:16];
          }
          while (v105);
        }
        objc_msgSend(v565, "setObject:forKeyedSubscript:", objc_msgSend(v102, "allObjects"), objc_msgSend(v98, "portType"));
        if (v100) {
          CFRelease(v100);
        }
        id v72 = v568;
        v96 = v557;
      }
      id v571 = (id)[obja countByEnumeratingWithState:type objects:&v636 count:16];
    }
    while (v571);
  }
  unsigned int v108 = [v72 depthDataDeliveryEnabled];
  if (v540 == 3) {
    unsigned int v109 = 0;
  }
  else {
    unsigned int v109 = v108;
  }
  unsigned int v561 = v109;
  int v110 = v109 ^ 1;
  uint64_t v111 = [v96 isStereoFusionSupported] & v110;
  v112 = (const void *)[v72 source];
  int v113 = 0;
  if ((v110 & 1) == 0)
  {
    [v72 depthDataMaxFrameRate];
    int v113 = v114;
  }
  unsigned int v572 = objc_msgSend((id)objc_msgSend(v542, "irisSinkConfiguration"), "bravoConstituentPhotoDeliveryEnabled");
  v115 = v541;
  if ([v541 previewDepthFilterRenderingEnabled]) {
    uint64_t v116 = [v541 portraitAutoSuggestEnabled] ^ 1;
  }
  else {
    uint64_t v116 = 0;
  }
  [v533 setStillImageSupportedHighResolutionFlavorsByPortType:v565];
  [v533 setStereoFusionEnabled:v111];
  [v533 setBravoConstituentPhotoDeliveryEnabled:v572];
  [v533 setDepthDataDeliveryEnabled:v561];
  [v533 setShallowDepthOfFieldEffectEnabled:v116];
  v117 = v96;
  objc_msgSend(v533, "setWideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled:", objc_msgSend(v96, "isWideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled"));
  objc_msgSend(v533, "setPortraitAutoSuggestEnabled:", objc_msgSend(v541, "portraitAutoSuggestEnabled"));
  LODWORD(v118) = v95;
  [v533 setMaxContinuousZoomFactorForDepthDataDelivery:v118];
  objc_msgSend(v533, "setStillImageISPMultiBandNoiseReductionEnabled:", objc_msgSend(v96, "isStillImageISPMultiBandNoiseReductionSupported"));
  objc_msgSend(v533, "setFocusPixelsEnabled:", objc_msgSend(v96, "autoFocusSystem") == 2);
  objc_msgSend(v533, "setRedEyeReductionEnabled:", (int)objc_msgSend(v96, "redEyeReductionVersion") > 0);
  [v533 setStillImageFocusPixelDataCaptureWithDepthEnabled:HIDWORD(v477) != 0];
  [v533 setStillImageSashimiRawCaptureWithDepthEnabled:v477 != 0];
  [v96 maxVisibleSensorRect];
  objc_msgSend(v533, "setSensorRegionOfInterestForCameraControls:");
  objc_msgSend(v533, "setWideCaptureStreamAsStatsMasterPreferred:", objc_msgSend(v96, "isWideAsStatsMasterEnabled"));
  objc_msgSend(v533, "setSmartCameraEnabled:", objc_msgSend(v72, "smartCameraEnabled"));
  objc_msgSend(v533, "setFullBinSIFROnSecondaryCameraAllowed:", objc_msgSend(v96, "fullBinSIFROnSecondaryCameraAllowed"));
  [v533 setAttachesUprightExifOrientationMetadataToStreamingFrames:0];
  [v533 setStereoVideoCaptureEnabled:v526];
  objc_msgSend(v533, "setCinematicFramingSupported:", objc_msgSend(v72, "isCinematicFramingSupported"));
  objc_msgSend(v533, "setCinematicFramingEnabled:", objc_msgSend(v72, "cinematicFramingEnabled"));
  objc_msgSend(v533, "setManualCinematicFramingEnabled:", objc_msgSend(v72, "manualCinematicFramingEnabled"));
  if (([v533 manualCinematicFramingEnabled] & 1) != 0
    || [v533 isCMIOZoomStreamPropertySupported])
  {
    v119 = (void *)[v533 zoomCommandHandler];
    LODWORD(v120) = 1.0;
    [v119 setRequestedZoomFactor:v120];
  }
  objc_msgSend(v533, "setCinematicFramingControlMode:", objc_msgSend(v72, "cinematicFramingControlMode"));
  objc_msgSend(v533, "setBackgroundBlurSupported:", objc_msgSend(v72, "isBackgroundBlurSupported"));
  objc_msgSend(v533, "setBackgroundBlurEnabled:", objc_msgSend(v72, "backgroundBlurEnabled"));
  objc_msgSend(v533, "setStudioLightingSupported:", objc_msgSend(v72, "isStudioLightingSupported"));
  objc_msgSend(v533, "setStudioLightingEnabled:", objc_msgSend(v72, "studioLightingEnabled"));
  objc_msgSend(v533, "setReactionEffectsSupported:", objc_msgSend(v72, "reactionEffectsSupported"));
  objc_msgSend(v533, "setReactionEffectsEnabled:", objc_msgSend(v72, "reactionEffectsEnabled"));
  objc_msgSend(v533, "setBackgroundReplacementSupported:", objc_msgSend(v72, "isBackgroundReplacementSupported"));
  objc_msgSend(v533, "setBackgroundReplacementEnabled:", objc_msgSend(v72, "backgroundReplacementEnabled"));
  objc_msgSend(v533, "setFaceDrivenAEAFEnabledByDefault:", objc_msgSend(v72, "faceDrivenAEAFEnabledByDefault"));
  objc_msgSend(v533, "setPhotoFormat:", objc_msgSend(v96, "isPhotoFormat"));
  uint64_t v121 = v548;
  if ([v533 isBravoVariant]) {
    [v533 setMidFrameSynchronizationEnabled:v485];
  }
  if ([v72 nonDestructiveCropEnabled])
  {
    [v72 normalizedNonDestructiveCropSize];
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v642);
    uint64_t v123 = [v72 source];
    uint64_t v124 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v124) {
      uint64_t v125 = v124;
    }
    else {
      uint64_t v125 = 0;
    }
    v127 = *(void (**)(uint64_t, __CFString *, CFDictionaryRef))(v125 + 56);
    if (v127) {
      v127(v123, @"NonDestructiveCropSize", DictionaryRepresentation);
    }
    CFRelease(DictionaryRepresentation);
    uint64_t v121 = v548;
  }
  if (!v112) {
    goto LABEL_214;
  }
  if (([v72 hasSetVideoZoomFactorOnCaptureSource] & 1) == 0)
  {
    v128 = NSNumber;
    [v72 videoZoomFactor];
    unsigned int v129 = FigVideoCaptureSourceSetSessionProperty(v112, (uint64_t)v533, @"VideoZoomFactor", (const __CFDictionary *)objc_msgSend(v128, "numberWithFloat:"));
    unsigned int v620 = v129;
    if (v129)
    {
      uint64_t v426 = v447;
      LODWORD(v422) = v129;
      goto LABEL_679;
    }
    [v72 setHasSetVideoZoomFactorOnCaptureSource:1];
    uint64_t v121 = v548;
  }
  if ([v533 isBravoVariant])
  {
    unsigned int v130 = FigVideoCaptureSourceSetSessionProperty(v112, (uint64_t)v533, @"EligibleFallbackCaptureSourceDeviceTypes", (const __CFDictionary *)[v72 fallbackPrimaryConstituentDeviceTypes]);
    unsigned int v620 = v130;
    if (v130)
    {
      uint64_t v426 = v447;
      LODWORD(v422) = v130;
      goto LABEL_681;
    }
  }
  unsigned int v131 = FigVideoCaptureSourceSetSessionProperty(v112, (uint64_t)v533, @"ActiveFormat_FigCaptureSessionOnly", (const __CFDictionary *)v96);
  unsigned int v620 = v131;
  if (v131)
  {
    uint64_t v426 = v447;
    LODWORD(v422) = v131;
LABEL_681:
    FigDebugAssert3();
    v165 = v545;
    goto LABEL_257;
  }
  v132 = NSNumber;
  [v72 requiredMaxFrameRate];
  unsigned int v133 = FigVideoCaptureSourceSetSessionProperty(v112, (uint64_t)v533, @"ActiveMaxFrameRate_FigCaptureSessionOnly", (const __CFDictionary *)objc_msgSend(v132, "numberWithFloat:"));
  unsigned int v620 = v133;
  if (v133)
  {
    uint64_t v426 = v447;
    LODWORD(v422) = v133;
LABEL_679:
    FigDebugAssert3();
    v165 = v545;
    goto LABEL_256;
  }
  v134 = NSNumber;
  [v72 requiredMinFrameRate];
  unsigned int v135 = FigVideoCaptureSourceSetSessionProperty(v112, (uint64_t)v533, @"ActiveMinFrameRate_FigCaptureSessionOnly", (const __CFDictionary *)objc_msgSend(v134, "numberWithFloat:"));
  unsigned int v620 = v135;
  if (v135)
  {
    uint64_t v426 = v447;
    LODWORD(v422) = v135;
    goto LABEL_679;
  }
  LODWORD(v136) = v113;
  unsigned int v137 = FigVideoCaptureSourceSetSessionProperty(v112, (uint64_t)v533, @"ActiveDepthDataMaxFrameRate", (const __CFDictionary *)[NSNumber numberWithFloat:v136]);
  unsigned int v620 = v137;
  if (v137)
  {
    uint64_t v426 = v447;
    LODWORD(v422) = v137;
    goto LABEL_679;
  }
  unsigned int v138 = FigVideoCaptureSourceSetSessionProperty(v112, (uint64_t)v533, @"FaceDrivenAEAFMode", (const __CFDictionary *)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v72, "faceDrivenAEAFMode")));
  unsigned int v620 = v138;
  uint64_t v121 = v548;
  if (v138)
  {
    uint64_t v426 = v447;
    LODWORD(v422) = v138;
    goto LABEL_681;
  }
LABEL_214:
  [v533 setAutoImageControlMode:v506];
  [v533 setZeroShutterLagEnabled:HIDWORD(v506)];
  if (HIDWORD(v506)) {
    uint64_t v139 = 4;
  }
  else {
    uint64_t v139 = 1;
  }
  [v533 setZeroShutterLagTimeMachineBufferCapacity:v139];
  [v533 setMemoryPool:v504];
  [v533 setOverCaptureEnabled:v538];
  *(float *)&double v140 = v34;
  [v533 setOverCapturePercentage:v140];
  [v533 setAllocateResourcesCompatibleWithOverCapture:v508];
  unsigned int v141 = objc_msgSend((id)objc_msgSend(v542, "irisSinkConfiguration"), "digitalFlashCaptureEnabled");
  [v533 setDigitalFlashMetadataEnabled:HIDWORD(v508) | v141];
  if (v141) {
    uint64_t v142 = [v96 digitalFlashDetectedObjectTypes];
  }
  else {
    uint64_t v142 = 0;
  }
  [v533 setDigitalFlashDetectedObjectTypes:v142];
  objc_msgSend(v533, "setMomentCaptureVideoRecordingSupported:", objc_msgSend((id)objc_msgSend(v542, "irisSinkConfiguration"), "momentCaptureMovieRecordingEnabled"));
  int v143 = objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "variableFrameRateVideoCaptureFromFWSupported");
  unsigned int v144 = objc_msgSend((id)objc_msgSend(v72, "requiredFormat"), "isVariableFrameRateVideoCaptureSupported");
  int v145 = [v72 videoStabilizationStrength];
  int v146 = [v72 variableFrameRateVideoCaptureEnabled];
  if (v145 < 3) {
    int v147 = v146;
  }
  else {
    int v147 = 0;
  }
  uint64_t v148 = v147 & v144;
  [v533 setVariableFrameRateControlEnabled:v148 & (v143 ^ 1)];
  long long v611 = 0u;
  long long v610 = 0u;
  long long v609 = 0u;
  long long v608 = 0u;
  v149 = (void *)[v533 captureStreams];
  uint64_t v150 = [v149 countByEnumeratingWithState:&v608 objects:v631 count:16];
  if (v150)
  {
    uint64_t v151 = v150;
    uint64_t v152 = *(void *)v609;
    do
    {
      for (uint64_t m = 0; m != v151; ++m)
      {
        if (*(void *)v609 != v152) {
          objc_enumerationMutation(v149);
        }
        [*(id *)(*((void *)&v608 + 1) + 8 * m) setVariableFrameRateVideoEnabled:v148];
      }
      uint64_t v151 = [v149 countByEnumeratingWithState:&v608 objects:v631 count:16];
    }
    while (v151);
  }
  [v533 setCinematicVideoEnabled:v529];
  [v533 setDepthType:v540];
  [v533 setMaxOverscanVideoStabilizationMethod:v522];
  objc_msgSend(v533, "setVideoStabilizationStrength:", objc_msgSend(v72, "videoStabilizationStrength"));
  if (v522 == 5)
  {
    [v117 stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced];
    if (v154 == 0.0)
    {
      BOOL v156 = 0;
    }
    else
    {
      [v117 stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced];
      BOOL v156 = v155 < 28.0;
    }
    [v533 setVideoStabilizationModeUsesReducedOverscan:v156];
  }
  [v533 setAdaptiveOverscanEnabled:v515];
  [v533 setOptimizesZoomRampsForVISZoomSmoothing:v511];
  BOOL v157 = (int)[v117 temporalNoiseReductionMode] >= 1
      && [v72 imageControlMode] != 4;
  [v533 setTemporalNoiseReductionEnabled:v157];
  int v158 = [v533 cinematicVideoEnabled];
  if (v543 == 3840) {
    int v159 = v158;
  }
  else {
    int v159 = 0;
  }
  BOOL v160 = (int)FigCapturePlatformIdentifier() > 8;
  if (v157
    && (v160 & ~v159 & v561 & 1) == 0
    && ([v533 cinematicVideoEnabled] ^ 1 | v159) == 1)
  {
    objc_msgSend(v533, "setTemporalNoiseReductionBand0Disabled:", objc_msgSend(v117, "temporalNoiseReductionBand0Disabled"));
    uint64_t v161 = [v117 temporalNoiseReductionRawEnabled];
  }
  else
  {
    [v533 setTemporalNoiseReductionBand0Disabled:0];
    uint64_t v161 = 0;
  }
  [v533 setTemporalNoiseReductionRawEnabled:v161];
  [v533 setTemporalNoiseReductionStrengthHighEnabled:v513];
  objc_msgSend(v533, "setDepthFormatDimensions:", objc_msgSend((id)objc_msgSend(v72, "depthDataFormat"), "dimensions"));
  objc_msgSend(v533, "setDepthPixelFormat:", objc_msgSend((id)objc_msgSend(v72, "depthDataFormat"), "format"));
  [v533 setDepthFilteringEnabled:v520];
  [v533 setTimeOfFlightProjectorMode:v524];
  [v533 setAllocateResourcesCompatibleWithDepthDataDelivery:v518];
  int v162 = objc_msgSend((id)objc_msgSend(v541, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled");
  double v163 = 0.0;
  int v164 = 0;
  v165 = v545;
  if (!v162) {
    goto LABEL_249;
  }
  *(float *)&double v163 = FigVideoCaptureSourceUIBaseZoomFactor(objc_msgSend(v72, "source", 0.0), &v620);
  if (!v620)
  {
    int v164 = LODWORD(v163);
    LODWORD(v163) = v94;
LABEL_249:
    [v533 setZoomPIPMinimumUIZoomFactor:v163];
    LODWORD(v166) = v164;
    [v533 setUiBaseZoomFactor:v166];
    unsigned int v167 = objc_msgSend((id)objc_msgSend(v533, "captureStreams"), "count");
    if (((v503 && v489 || v518) & [v533 isBravoVariant]) != 0) {
      unsigned int v168 = 2;
    }
    else {
      unsigned int v168 = 1;
    }
    if (v572) {
      uint64_t v169 = v167;
    }
    else {
      uint64_t v169 = v168;
    }
    [v533 setNumberOfActiveTimeMachines:v169];
    [v533 setPreferredMasterPortType:v491];
    objc_msgSend(v533, "setStreamingSessionAnalyticsPixelFormat:", objc_msgSend(v117, "format"));
    objc_msgSend(v533, "setStreamingSessionAnalyticsVideoDimensions:", objc_msgSend(v117, "dimensions"));
    objc_msgSend(v533, "setStreamingSessionAnalyticsHighlightRecoveryEnabled:", objc_msgSend(v72, "highlightRecoveryEnabled"));
    [v533 setStreamingSessionAnalyticsClientIsVOIP:v493];
    [v533 setTrueVideoCaptureEnabled:v487 != 0];
    [v533 setRebuildingGraphForTrueVideoTransition:v496];
    [v533 setTargetFrameRateWhenNotRecording:v501];
    [v533 setFrameSkippingWhenNotRecordingEnabled:(int)v501 > 0];
    [v533 setStreamingSessionAnalyticsMixWithOthersEnabled:v498];
    goto LABEL_256;
  }
  uint64_t v426 = v447;
  LODWORD(v422) = v620;
  FigDebugAssert3();
LABEL_256:
  uint64_t v121 = v548;
LABEL_257:
  unsigned int v607 = v620;
  if (v620) {
    goto LABEL_461;
  }
  long long v605 = 0u;
  long long v604 = 0u;
  long long v603 = 0u;
  long long v602 = 0u;
  id v449 = (id)[*(id *)(v549 + 440) captureStreams];
  uint64_t v497 = [v449 countByEnumeratingWithState:&v602 objects:v630 count:16];
  if (!v497)
  {
    id v442 = 0;
    v440 = 0;
    goto LABEL_467;
  }
  id v442 = 0;
  v440 = 0;
  uint64_t v499 = *(void *)v603;
  uint64_t v459 = *MEMORY[0x1E4F52E00];
  uint64_t v450 = *MEMORY[0x1E4F52DD8];
  uint64_t v527 = *MEMORY[0x1E4F52DF0];
  uint64_t v441 = *MEMORY[0x1E4F52DE8];
  char v170 = v500;
  if (v532) {
    char v170 = 1;
  }
  char v427 = v170;
  uint64_t v530 = *MEMORY[0x1E4F538C8];
  uint64_t v494 = *MEMORY[0x1E4F538C0];
  uint64_t v436 = *MEMORY[0x1E4F538D8];
  uint64_t v444 = v121 + 68;
  uint64_t v430 = *MEMORY[0x1E4F53070];
  uint64_t v443 = v121 + 92;
  uint64_t v429 = *MEMORY[0x1E4F53DC8];
  v171 = &selRef__shouldEmitBuffer;
  uint64_t v446 = *MEMORY[0x1E4F538A8];
  uint64_t v445 = *MEMORY[0x1E4F538B8];
  uint64_t v435 = *MEMORY[0x1E4F538E0];
  uint64_t v434 = *MEMORY[0x1E4F538B0];
  uint64_t v433 = *MEMORY[0x1E4F538A0];
  uint64_t v432 = *MEMORY[0x1E4F538F0];
  while (2)
  {
    uint64_t v172 = 0;
    v448 = v171[164];
    do
    {
      if (*(void *)v603 != v499) {
        objc_enumerationMutation(v449);
      }
      id objb = *(id *)(*((void *)&v602 + 1) + 8 * v172);
      v173 = objc_msgSend(objb, "portType", v422, v426);
      int v174 = [v72 sourceDeviceType];
      if (v174 == 12 || v174 == 6) && ([v173 isEqualToString:v459])
      {
        id v442 = objb;
        goto LABEL_429;
      }
      uint64_t v502 = v172;
      v558 = v173;
      unsigned int v175 = BWUtilitiesUnderlyingDeviceTypeFromPortType(v173, [v72 sourceDeviceType]);
      int v176 = [v72 sourceDeviceType];
      if (v176 == 6 || v176 == 12 || [v72 sourceDeviceType] == 13) {
        unsigned int v175 = [v72 sourceDeviceType];
      }
      unsigned int v566 = v175;
      v177 = v542;
      if ([v72 sourceDeviceType] == 14) {
        unsigned int v566 = [v72 sourceDeviceType];
      }
      if ([v72 sourceDeviceType] - 17 <= 3) {
        unsigned int v566 = [v72 sourceDeviceType];
      }
      v178 = (void *)FigCaptureConnectionConfigurationsFilterWithBlock(v546, (uint64_t)&__block_literal_global_58);
      v179 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v178);
      v180 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v544);
      if (objc_msgSend(v179, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v566)))
      {
        BOOL v181 = 1;
        uint64_t v182 = v548;
      }
      else
      {
        int v183 = objc_msgSend(v180, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v566));
        if (v540 == 3) {
          BOOL v181 = 1;
        }
        else {
          BOOL v181 = v183;
        }
        uint64_t v182 = v548;
        if (v548 && !v181) {
          BOOL v181 = *(unsigned char *)(v548 + 346) != 0;
        }
      }
      int v185 = 0;
      if (objc_msgSend((id)objc_msgSend(v115, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled"))
      {
        int v186 = [v558 isEqualToString:v450];
        char v187 = v181 | v186;
        unint64_t v188 = 0x1E4F28000;
        if (v182)
        {
          if (v186)
          {
            char v187 = *(unsigned char *)(v182 + 302) == 0;
            if (!*(unsigned char *)(v182 + 302) && !v181 && !v538)
            {
              int v185 = *(_DWORD *)(v182 + 308);
              char v187 = 1;
            }
          }
        }
      }
      else
      {
        char v187 = v181;
        unint64_t v188 = 0x1E4F28000uLL;
      }
      unsigned __int8 v525 = v187;
      LODWORD(v184) = v185;
      [objb setStreamingFrameRateForZoomPIPOverlay:v184];
      int v189 = [v72 sourceDeviceType];
      v190 = *(void **)(v188 + 3936);
      *(void *)&long long v636 = MEMORY[0x1E4F143A8];
      *((void *)&v636 + 1) = 3221225472;
      v637 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v638 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      unsigned int v639 = v566;
      int v640 = v189;
      v523 = objc_msgSend(v544, "filteredArrayUsingPredicate:", objc_msgSend(v190, "predicateWithBlock:", &v636));
      int v191 = [v72 sourceDeviceType];
      if ([v542 underlyingDeviceType] != v566
        && [v542 underlyingDeviceType] != v191)
      {
        v177 = 0;
      }
      v534 = v177;
      int v192 = [v72 sourceDeviceType];
      v193 = *(void **)(v188 + 3936);
      *(void *)&long long v636 = MEMORY[0x1E4F143A8];
      *((void *)&v636 + 1) = 3221225472;
      v637 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v638 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      unsigned int v639 = v566;
      int v640 = v192;
      v521 = objc_msgSend(v546, "filteredArrayUsingPredicate:", objc_msgSend(v193, "predicateWithBlock:", &v636));
      if (v182)
      {
        v519 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(*(void **)(v182 + 232), v566);
        v194 = *(void **)(v182 + 240);
      }
      else
      {
        v519 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(0, v566);
        v194 = 0;
      }
      int v195 = [v72 sourceDeviceType];
      v196 = *(void **)(v188 + 3936);
      *(void *)&long long v636 = MEMORY[0x1E4F143A8];
      *((void *)&v636 + 1) = 3221225472;
      v637 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v638 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      unsigned int v639 = v566;
      int v640 = v195;
      id v573 = (id)objc_msgSend(v194, "filteredArrayUsingPredicate:", objc_msgSend(v196, "predicateWithBlock:", &v636));
      if (v182) {
        v197 = *(void **)(v182 + 248);
      }
      else {
        v197 = 0;
      }
      int v198 = [v72 sourceDeviceType];
      v199 = *(void **)(v188 + 3936);
      *(void *)&long long v636 = MEMORY[0x1E4F143A8];
      *((void *)&v636 + 1) = 3221225472;
      v637 = __csp_filterConnectionConfigurationsForSourceDeviceTypes_block_invoke;
      v638 = &__block_descriptor_40_e60_B24__0__FigCaptureConnectionConfiguration_8__NSDictionary_16l;
      unsigned int v639 = v566;
      int v640 = v198;
      v516 = objc_msgSend(v197, "filteredArrayUsingPredicate:", objc_msgSend(v199, "predicateWithBlock:", &v636));
      v200 = [[BWMultiStreamCameraSourceNode alloc] initWithCaptureDevice:*(void *)(v549 + 440) captureStream:objb];
      if (!v200) {
        goto LABEL_97;
      }
      v202 = v200;
      -[BWNode setName:](v200, "setName:", [NSString stringWithFormat:@"%@ Camera", BWPortTypeToDisplayString(v558, v201)]);
      v562 = v202;
      [*(id *)(v549 + 56) addObject:v202];
      if (![v558 isEqualToString:v527]
        || (v203 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__telephotoSourceNode,
            (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v549 + 440), "captureStreams"), "count") <= 1))
      {
        if (![v558 isEqualToString:v441]
          || (v203 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__superWideSourceNode,
              (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v549 + 440), "captureStreams"), "count") <= 1))
        {
          v203 = &OBJC_IVAR___FigCaptureCameraSourcePipeline__sourceNode;
        }
      }
      *(void *)(v549 + *v203) = v202;
      if ((v495 | v535))
      {
        char v204 = 1;
        char v205 = 1;
LABEL_307:
        v206 = v558;
        goto LABEL_315;
      }
      v206 = v558;
      if (v548 && *(unsigned char *)(v548 + 178))
      {
        char v205 = 0;
        char v204 = 1;
        goto LABEL_315;
      }
      if (v202 == *(BWMultiStreamCameraSourceNode **)(v549 + 64))
      {
        if (v539 && [*(id *)(v549 + 440) pearlInfraredCaptureStream])
        {
          BOOL v256 = 1;
          char v204 = v427;
          goto LABEL_444;
        }
        if (objc_msgSend((id)objc_msgSend(v177, "irisSinkConfiguration"), "depthDataDeliveryEnabled"))
        {
          uint64_t v257 = objc_msgSend((id)objc_msgSend(*(id *)(v549 + 440), "captureStreams"), "count");
          BOOL v256 = v257 == 1;
          char v258 = v539;
          if (v257 == 1) {
            char v258 = 0;
          }
          if ((v258 & 1) == 0)
          {
            char v204 = 0;
            goto LABEL_443;
          }
        }
        else if (!v539)
        {
          BOOL v256 = 0;
          char v204 = 0;
          goto LABEL_447;
        }
        BOOL v256 = 0;
        if ([*(id *)(v549 + 440) bravoSuperWideCaptureStream]) {
          char v204 = v427;
        }
        else {
          char v204 = 0;
        }
LABEL_443:
        if (v539)
        {
LABEL_444:
          if ([v72 sourceDeviceType] == 13) {
            char v204 = 1;
          }
        }
LABEL_447:
        if (objc_msgSend((id)objc_msgSend(v177, "irisSinkConfiguration"), "depthDataDeliveryEnabled")
          && objc_msgSend((id)objc_msgSend(v177, "irisSinkConfiguration"), "digitalFlashCaptureEnabled"))
        {
          BOOL v256 = 1;
        }
        char v259 = objc_msgSend((id)objc_msgSend(v177, "irisSinkConfiguration"), "stereoPhotoCaptureEnabled");
        if (v256) {
          char v205 = 1;
        }
        else {
          char v205 = v259;
        }
        goto LABEL_307;
      }
      char v205 = 0;
      if (v202 == *(BWMultiStreamCameraSourceNode **)(v549 + 72)) {
        char v204 = v427;
      }
      else {
        char v204 = 0;
      }
LABEL_315:
      char v514 = v204;
      char v512 = v205;
      if ([*(id *)(v549 + 440) bravoTelephotoCaptureStream]
        && ([v206 isEqualToString:v527] & 1) != 0)
      {
        unsigned int v207 = v540;
        unsigned int v208 = v540;
        goto LABEL_324;
      }
      if ([*(id *)(v549 + 440) bravoSuperWideCaptureStream])
      {
        int v209 = [v206 isEqualToString:v450];
        if (v209) {
          unsigned int v208 = v540;
        }
        else {
          unsigned int v208 = 0;
        }
        if (v209)
        {
          unsigned int v207 = v540;
LABEL_324:
          if (v540 - 1 < 2) {
            goto LABEL_330;
          }
        }
      }
      else
      {
        unsigned int v208 = 0;
      }
      if ([*(id *)(v549 + 440) isBravoVariant])
      {
        unsigned int v510 = v208;
        uint64_t v507 = 0;
        unsigned __int8 v509 = 0;
        unsigned __int8 v505 = 0;
        float v210 = -1.0;
        float v211 = 0.0;
        goto LABEL_336;
      }
      unsigned int v207 = v208;
LABEL_330:
      float v210 = -1.0;
      float v211 = 0.0;
      if (!v548)
      {
        uint64_t v507 = 0;
        unsigned __int8 v509 = 0;
        goto LABEL_334;
      }
      unsigned __int8 v509 = *(unsigned char *)(v548 + 177) != 0;
      if (!*(unsigned char *)(v548 + 118))
      {
        uint64_t v507 = 0;
LABEL_334:
        unsigned __int8 v505 = 0;
        goto LABEL_335;
      }
      HIDWORD(v507) = *(_DWORD *)(v548 + 120);
      float v211 = *(float *)(v548 + 124);
      LOBYTE(v507) = *(unsigned char *)(v548 + 128) != 0;
      float v210 = *(float *)(v548 + 132);
      unsigned __int8 v505 = 1;
LABEL_335:
      unsigned int v510 = v207;
LABEL_336:
      v212 = (void *)[MEMORY[0x1E4F1CA80] set];
      long long v598 = 0u;
      long long v599 = 0u;
      long long v600 = 0u;
      long long v601 = 0u;
      uint64_t v213 = [v573 countByEnumeratingWithState:&v598 objects:v629 count:16];
      if (v213)
      {
        uint64_t v214 = v213;
        char v215 = 0;
        char v216 = 0;
        uint64_t v217 = *(void *)v599;
LABEL_338:
        uint64_t v218 = 0;
        while (1)
        {
          if (*(void *)v599 != v217) {
            objc_enumerationMutation(v573);
          }
          v219 = *(void **)(*((void *)&v598 + 1) + 8 * v218);
          FigCaptureAddDetectedObjectTypesFromMetadataIdentifiersToSet((void *)[v219 metadataIdentifiers], v212);
          char v220 = [v219 attentionDetectionEnabled];
          char v221 = FigCaptureMetadataObjectConfigurationRequiresEyeReliefStatus(v219);
          if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v219)) {
            FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v219, "sourceConfiguration"), "source"), &v607);
          }
          if (v607) {
            goto LABEL_461;
          }
          v215 |= v220;
          v216 |= v221;
          if (v214 == ++v218)
          {
            uint64_t v214 = [v573 countByEnumeratingWithState:&v598 objects:v629 count:16];
            if (v214) {
              goto LABEL_338;
            }
            goto LABEL_348;
          }
        }
      }
      char v215 = 0;
      char v216 = 0;
LABEL_348:
      long long v597 = 0u;
      long long v596 = 0u;
      long long v595 = 0u;
      long long v594 = 0u;
      uint64_t v222 = [v516 countByEnumeratingWithState:&v594 objects:v628 count:16];
      if (v222)
      {
        uint64_t v223 = v222;
        uint64_t v224 = *(void *)v595;
        do
        {
          for (uint64_t n = 0; n != v223; ++n)
          {
            if (*(void *)v595 != v224) {
              objc_enumerationMutation(v516);
            }
            CFArrayRef Identifiers = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)[*(id *)(*((void *)&v594 + 1) + 8 * n) formatDescription]);
            FigCaptureAddDetectedObjectTypesFromMetadataIdentifiersToSet(Identifiers, v212);
          }
          uint64_t v223 = [v516 countByEnumeratingWithState:&v594 objects:v628 count:16];
        }
        while (v223);
      }
      v227 = (void *)[v550 digitalFlashDetectedObjectTypes];
      if ([v227 count]
        && objc_msgSend((id)objc_msgSend(v534, "irisSinkConfiguration"), "digitalFlashCaptureEnabled"))
      {
        [v212 addObjectsFromArray:v227];
      }
      uint64_t v228 = v548;
      if (v535)
      {
        v627[0] = v530;
        v627[1] = v494;
        objc_msgSend(v212, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v627, 2));
      }
      if (v495)
      {
        v626[0] = v530;
        v626[1] = v494;
        objc_msgSend(v212, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v626, 2));
      }
      if (v466)
      {
        [v212 addObject:v530];
        if ([v545 isRunningForContinuityCapture]) {
          [v212 addObject:v494];
        }
        if (v474 && (!v548 || *(_DWORD *)(v548 + 296) != 4)) {
          [v212 addObject:v436];
        }
      }
      v229 = objc_msgSend(FigCaptureConnectionConfigurationWithSinkType(v546, 6), "videoDataSinkConfiguration");
      if (v229)
      {
        v230 = v229;
        if ([v229 requestedBufferAttachmentsTrie])
        {
          v625[0] = v430;
          v625[1] = v429;
          uint64_t v231 = [MEMORY[0x1E4F1C978] arrayWithObjects:v625 count:2];
          v232 = (void *)[v230 requestedBufferAttachmentsTrie];
          uint64_t v233 = v231;
          uint64_t v228 = v548;
          v234 = (void *)[v232 getSubTrie:v233];
          if (v234)
          {
            v235 = v234;
            if (([v234 isComplete] & 1) == 0)
            {
              if (objc_msgSend((id)objc_msgSend(v235, "children"), "count")) {
                objc_msgSend(v212, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v235, "children"), "allKeys"));
              }
            }
          }
        }
      }
      if (v228)
      {
        [objb setContinuityCameraIsWired:*(unsigned __int8 *)(v228 + 294)];
        uint64_t v236 = *(unsigned int *)(v228 + 296);
      }
      else
      {
        [objb setContinuityCameraIsWired:0];
        uint64_t v236 = 0;
      }
      [objb setContinuityCameraClientDeviceClass:v236];
      int v237 = csp_cinematicVideoEnabled(v228);
      if ([v541 portraitAutoSuggestEnabled])
      {
        [v212 addObject:v530];
        [v212 addObject:v446];
        [v212 addObject:v445];
        if (!v237) {
          goto LABEL_379;
        }
      }
      else if (!v237)
      {
LABEL_379:
        if (v228) {
          goto LABEL_380;
        }
        goto LABEL_390;
      }
      v624[0] = v530;
      v624[1] = v436;
      v624[2] = v494;
      v624[3] = v435;
      v624[4] = v434;
      v624[5] = v433;
      v624[6] = v446;
      v624[7] = v445;
      v624[8] = v432;
      objc_msgSend(v212, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v624, 9));
      if (v228)
      {
LABEL_380:
        char v238 = *(unsigned char *)(v228 + 136);
        v239 = v562;
        if (v238)
        {
          int v240 = objc_msgSend((id)objc_msgSend(v568, "requiredFormat"), "stillImageGDCSourceMode");
          char v238 = 1;
          if (v240)
          {
            if (v240 != 3)
            {
              char v238 = v539;
              if (v240 != 2) {
                char v238 = 0;
              }
            }
          }
        }
        goto LABEL_385;
      }
LABEL_390:
      char v238 = 0;
      v239 = v562;
LABEL_385:
      unsigned __int8 objc = v238;
      unsigned __int8 v488 = v538
          && [v568 sourceDeviceType] == 9
          && v239 == *(BWMultiStreamCameraSourceNode **)(v549 + 72);
      id v574 = *(id *)(v549 + 440);
      int v486 = *(unsigned __int8 *)(v549 + 40);
      if (v228)
      {
        unsigned __int8 v517 = *(unsigned char *)(v228 + 24) != 0;
        unsigned int v492 = *(_DWORD *)(v228 + 8);
        char v490 = *(unsigned char *)(v228 + 116) != 0;
        long long v592 = *(_OWORD *)v444;
        uint64_t v593 = *(void *)(v444 + 16);
        long long v590 = *(_OWORD *)v443;
        uint64_t v591 = *(void *)(v443 + 16);
      }
      else
      {
        unsigned __int8 v517 = 0;
        unsigned int v492 = 0;
        char v490 = 0;
        long long v592 = 0uLL;
        uint64_t v593 = 0;
        uint64_t v591 = 0;
        long long v590 = 0uLL;
      }
      objc_msgSend((id)objc_msgSend(v532, "depthDataSinkConfiguration"), "filteringEnabled");
      if (v228)
      {
        unsigned __int8 v484 = *(float *)(v228 + 32) > 0.0;
        BYTE4(v483) = *(unsigned char *)(v228 + 142) != 0;
        LOBYTE(v483) = *(unsigned char *)(v228 + 143) != 0;
        float v241 = *(float *)(v228 + 268);
        BYTE4(v482) = *(unsigned char *)(v228 + 266) != 0;
        LOBYTE(v482) = *(unsigned char *)(v228 + 144) != 0;
        BYTE4(v481) = *(unsigned char *)(v228 + 146) != 0;
        LOBYTE(v481) = *(unsigned char *)(v228 + 154) != 0;
        BYTE4(v480) = *(unsigned char *)(v228 + 147) != 0;
        LOBYTE(v480) = *(unsigned char *)(v228 + 139) != 0;
        unsigned __int8 v479 = *(unsigned char *)(v228 + 140) != 0;
        unint64_t v478 = *(void *)(v228 + 352);
        csp_portraitPhotoModeEnabled(v228);
        [v545 isRunningForContinuityCapture];
      }
      else
      {
        csp_portraitPhotoModeEnabled(0);
        [v545 isRunningForContinuityCapture];
        unint64_t v478 = 0;
        uint64_t v480 = 0;
        uint64_t v481 = 0;
        uint64_t v482 = 0;
        uint64_t v483 = 0;
        unsigned __int8 v484 = 0;
        unsigned __int8 v479 = 0;
        float v241 = 0.0;
      }
      id v72 = v568;
      unsigned int v607 = csp_configureMultiStreamCameraNode(v562, v568, v574, v523, v534, v521, v476, v473, v211, v210, v241, v486 != 0, v500, v536, v517, v492, v472, v470, v490,
               shouldUseFESCompanionIndex,
               shouldUseDepthCompanionIndex,
               v537,
               v469,
               &v592,
               &v590,
               v510,
               v475,
               v539,
               v484,
               v514,
               v512,
               BYTE4(v483),
               v483,
               HIDWORD(v477),
               v477,
               v463,
               v462,
               v461,
               v460,
               v519,
               v509,
               v505,
               HIDWORD(v507),
               v507,
               0,
               v538,
               v525,
               v212,
               v215 & 1,
               v216 & 1,
               BYTE4(v482),
               v482,
               SBYTE4(v481),
               v481,
               SBYTE4(v480),
               objc,
               v467,
               BYTE4(v463),
               v480,
               v479,
               v488,
               v543,
               v478);
      if (v607) {
        goto LABEL_461;
      }
      v589.receiver = (id)v549;
      v589.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v589, v448, v562, &v606) & 1) == 0) {
        goto LABEL_461;
      }
      uint64_t v242 = csp_stabilizationMethodWithMostOverscan([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v562 configuration] videoStabilizationMethods]);
      v165 = v545;
      if ((int)v242 <= (int)objc_msgSend((id)objc_msgSend(v545, "memoryAnalyticsPayload"), "maxVideoStabilizationMethod"))uint64_t v242 = objc_msgSend((id)objc_msgSend(v545, "memoryAnalyticsPayload"), "maxVideoStabilizationMethod"); {
      objc_msgSend((id)objc_msgSend(v545, "memoryAnalyticsPayload"), "setMaxVideoStabilizationMethod:", v242);
      }
      int v243 = [v568 videoStabilizationStrength];
      int v244 = objc_msgSend((id)objc_msgSend(v545, "memoryAnalyticsPayload"), "videoStabilizationStrength");
      v245 = v568;
      uint64_t v121 = v548;
      v115 = v541;
      uint64_t v172 = v502;
      if (v243 <= v244) {
        v245 = (void *)[v545 memoryAnalyticsPayload];
      }
      objc_msgSend((id)objc_msgSend(v545, "memoryAnalyticsPayload"), "setVideoStabilizationStrength:", objc_msgSend(v245, "videoStabilizationStrength"));
      if (v531) {
        unsigned int v566 = [v568 sourceDeviceType];
      }
      v246 = v562;
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v562 configuration] previewOutputEnabled])
      {
        uint64_t v247 = [(BWMultiStreamCameraSourceNode *)v562 previewOutput];
        v246 = v562;
        objc_msgSend(v465, "setObject:forKeyedSubscript:", v247, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] videoCaptureOutputEnabled])
      {
        uint64_t v248 = [(BWMultiStreamCameraSourceNode *)v246 videoCaptureOutput];
        v246 = v562;
        objc_msgSend(v464, "setObject:forKeyedSubscript:", v248, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] detectedObjectsOutputEnabled])
      {
        uint64_t v249 = [(BWMultiStreamCameraSourceNode *)v246 detectedObjectsOutput];
        v246 = v562;
        objc_msgSend(v454, "setObject:forKeyedSubscript:", v249, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] stillImageOutputEnabled])
      {
        objc_msgSend(v468, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode stillImageOutput](v246, "stillImageOutput"), v558);
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] sensorRawStillImageOutputEnabled])
      {
        objc_msgSend(v451, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode stillImageSensorRawOutput](v246, "stillImageSensorRawOutput"), v558);
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] depthOutputEnabled])
      {
        v440 = [(BWMultiStreamCameraSourceNode *)v246 depthOutput];
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] lightSourceMaskOutputEnabled])
      {
        uint64_t v250 = [(BWMultiStreamCameraSourceNode *)v246 lightSourceMaskOutput];
        v246 = v562;
        objc_msgSend(v456, "setObject:forKeyedSubscript:", v250, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] keypointDescriptorDataOutputEnabled])
      {
        uint64_t v251 = [(BWMultiStreamCameraSourceNode *)v246 keypointDescriptorDataOutput];
        v246 = v562;
        objc_msgSend(v455, "setObject:forKeyedSubscript:", v251, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] semanticMasksOutputEnabled])
      {
        uint64_t v252 = [(BWMultiStreamCameraSourceNode *)v246 semanticMasksOutput];
        v246 = v562;
        objc_msgSend(v458, "setObject:forKeyedSubscript:", v252, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWSecureMetadataOutputConfiguration *)[(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] secureMetadataOutputConfiguration] objectDetectionEnabled])
      {
        uint64_t v253 = [(BWMultiStreamCameraSourceNode *)v246 secureDetectedObjectsOutput];
        v246 = v562;
        objc_msgSend(v452, "setObject:forKeyedSubscript:", v253, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWSecureMetadataOutputConfiguration *)[(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] secureMetadataOutputConfiguration] eyeReliefStatusDetectionEnabled])
      {
        uint64_t v254 = [(BWMultiStreamCameraSourceNode *)v246 eyeReliefStatusOutput];
        v246 = v562;
        objc_msgSend(v453, "setObject:forKeyedSubscript:", v254, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v246 configuration] preLTMThumbnailOutputEnabled])
      {
        uint64_t v255 = [(BWMultiStreamCameraSourceNode *)v246 preLTMThumbnailOutput];
        v246 = v562;
        objc_msgSend(v457, "setObject:forKeyedSubscript:", v255, objc_msgSend(NSNumber, "numberWithInt:", v566));
      }
      *(unsigned char *)(v549 + 496) |= [(BWMultiStreamCameraSourceNode *)v246 hardwareDepthFilteringEnabled];
LABEL_429:
      ++v172;
    }
    while (v172 != v497);
    uint64_t v260 = [v449 countByEnumeratingWithState:&v602 objects:v630 count:16];
    uint64_t v497 = v260;
    v171 = &selRef__shouldEmitBuffer;
    if (v260) {
      continue;
    }
    break;
  }
LABEL_467:
  if (!v121 || *(_DWORD *)(v121 + 28) != 3 && !*(unsigned char *)(v121 + 346))
  {
    objc_msgSend(*(id *)(v549 + 72), "updateFormatRequirementsFromSourceNode:", *(void *)(v549 + 64), v422, v426);
    [*(id *)(v549 + 80) updateFormatRequirementsFromSourceNode:*(void *)(v549 + 64)];
    if (*(void *)(v549 + 72))
    {
      objc_msgSend(*(id *)(v549 + 64), "updateFormatRequirementsFromSourceNode:");
      [*(id *)(v549 + 80) updateFormatRequirementsFromSourceNode:*(void *)(v549 + 72)];
    }
    if (*(void *)(v549 + 80))
    {
      objc_msgSend(*(id *)(v549 + 72), "updateFormatRequirementsFromSourceNode:");
      [*(id *)(v549 + 64) updateFormatRequirementsFromSourceNode:*(void *)(v549 + 80)];
    }
  }
  if (!v442)
  {
LABEL_492:
    v276 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
    goto LABEL_501;
  }
  [*(id *)(v549 + 64) setName:@"RGB Camera"];
  v261 = [[BWMultiStreamCameraSourceNode alloc] initWithCaptureDevice:*(void *)(v549 + 440) captureStream:v442];
  if (!v261) {
    goto LABEL_97;
  }
  v262 = v261;
  [(BWNode *)v261 setName:@"Infrared Camera"];
  [*(id *)(v549 + 56) addObject:v262];
  LODWORD(v636) = 0;
  uint64_t v263 = [v72 source];
  uint64_t v264 = *MEMORY[0x1E4F52E00];
  v265 = (const void *)FigVideoCaptureSourceCopyUnderlyingCaptureSourceForPortType(v263, *MEMORY[0x1E4F52E00], &v636);
  if (v636)
  {
    FigDebugAssert3();
    v268 = 0;
    v267 = 0;
  }
  else
  {
    uint64_t v266 = FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(v263, (void *)[v72 requiredFormat], v264, &v636);
    v267 = (void *)v266;
    if (v636 || !v266)
    {
      FigDebugAssert3();
      v268 = 0;
    }
    else
    {
      v268 = [[FigCaptureSourceConfiguration alloc] initWithSource:v265];
      [(FigCaptureSourceConfiguration *)v268 setRequiredFormat:v267];
      [v72 maxFrameRateClientOverride];
      -[FigCaptureSourceConfiguration setMaxFrameRateClientOverride:](v268, "setMaxFrameRateClientOverride:");
      [v72 requiredMinFrameRate];
      -[FigCaptureSourceConfiguration setRequiredMinFrameRate:](v268, "setRequiredMinFrameRate:");
      [v72 requiredMaxFrameRate];
      -[FigCaptureSourceConfiguration setRequiredMaxFrameRate:](v268, "setRequiredMaxFrameRate:");
      -[FigCaptureSourceConfiguration setDepthDataFormat:](v268, "setDepthDataFormat:", [v72 depthDataFormat]);
      -[FigCaptureSourceConfiguration setDepthDataDeliveryEnabled:](v268, "setDepthDataDeliveryEnabled:", [v72 depthDataDeliveryEnabled]);
    }
  }
  if (v265) {
    CFRelease(v265);
  }

  if (!v268) {
    goto LABEL_97;
  }
  unint64_t v269 = [(FigCaptureSourceVideoFormat *)[(FigCaptureSourceConfiguration *)v268 requiredFormat] nativeDimensions];
  v270 = *(void **)(v549 + 440);
  objc_msgSend((id)objc_msgSend(v532, "depthDataSinkConfiguration"), "filteringEnabled");
  if (v548)
  {
    unsigned __int8 v271 = *(float *)(v548 + 32) > 0.0;
    unsigned __int8 v272 = *(unsigned char *)(v548 + 142) != 0;
    unsigned __int8 v273 = *(unsigned char *)(v548 + 143) != 0;
    unsigned __int8 v274 = *(unsigned char *)(v548 + 64) != 0;
    unint64_t v275 = *(void *)(v548 + 352);
  }
  else
  {
    unint64_t v275 = 0;
    unsigned __int8 v273 = 0;
    unsigned __int8 v271 = 0;
    unsigned __int8 v272 = 0;
    unsigned __int8 v274 = 0;
  }
  long long v636 = *MEMORY[0x1E4F1F9F8];
  v637 = *(BOOL (**)(uint64_t, void *))(MEMORY[0x1E4F1F9F8] + 16);
  unsigned int v607 = csp_configureMultiStreamCameraNode(v262, v268, v270, 0, v542, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E4F1F9F8],
           &v636,
           v540,
           v475,
           v539,
           v271,
           0,
           1,
           v272,
           v273,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v274,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v269,
           v275);

  if (v607) {
    goto LABEL_461;
  }
  *(unsigned char *)(v549 + 496) |= [(BWMultiStreamCameraSourceNode *)v262 hardwareDepthFilteringEnabled];
  v588.receiver = (id)v549;
  v588.super_class = (Class)FigCaptureCameraSourcePipeline;
  if ((objc_msgSendSuper2(&v588, sel_addNode_error_, v262, &v606) & 1) == 0) {
    goto LABEL_461;
  }
  *(void *)(v549 + 88) = v262;
  if ([(BWMultiStreamCameraSourceNodeConfiguration *)[(BWMultiStreamCameraSourceNode *)v262 configuration] stillImageOutputEnabled])
  {
    objc_msgSend(v468, "setObject:forKeyedSubscript:", -[BWMultiStreamCameraSourceNode stillImageOutput](v262, "stillImageOutput"), v264);
  }
  if (v548 && *(unsigned char *)(v548 + 292))
  {
    v440 = [(BWMultiStreamCameraSourceNode *)v262 depthOutput];
    goto LABEL_492;
  }
  unsigned int v607 = -[FigCaptureCameraSourcePipeline _addDepthFromInfraredSynchronizer:previewOutputsBySourceDeviceType:pipelineConfiguration:graph:sourceDeviceType:]((id *)v549, v464, v465, v548, v165, [v72 sourceDeviceType]);
  v276 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
  if (v607) {
    goto LABEL_461;
  }
LABEL_501:
  uint64_t v277 = objc_msgSend(v72, "source", v422);
  id v569 = *(id *)(v549 + 56);
  v278 = *(void **)(v549 + v276[847]);
  v631[0] = 0;
  uint64_t v279 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v279) {
    uint64_t v280 = v279;
  }
  else {
    uint64_t v280 = 0;
  }
  v281 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t, id *))(v280 + 48);
  if (!v281)
  {
    int v282 = -12782;
    *(_DWORD *)type = -12782;
LABEL_547:
    uint64_t v426 = v447;
    LODWORD(v423) = v282;
LABEL_548:
    FigDebugAssert3();
    goto LABEL_549;
  }
  v547 = v278;
  int v282 = v281(v277, @"AttributesDictionary", v428, v631);
  *(_DWORD *)type = v282;
  if (v282) {
    goto LABEL_547;
  }
  v567 = (void *)[v631[0] objectForKeyedSubscript:0x1EFA6BAC0];
  if (!v567 || (id objd = (id)[v631[0] objectForKeyedSubscript:0x1EFA6BB20]) == 0)
  {
LABEL_549:

    uint64_t v332 = v549;
    goto LABEL_550;
  }
  v563 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v569, "count"));
  id v575 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v569, "count"));
  long long v632 = 0u;
  long long v633 = 0u;
  long long v634 = 0u;
  long long v635 = 0u;
  uint64_t v283 = [v569 countByEnumeratingWithState:&v632 objects:&v636 count:16];
  if (v283)
  {
    uint64_t v284 = v283;
    uint64_t v285 = *(void *)v633;
    while (2)
    {
      for (iuint64_t i = 0; ii != v284; ++ii)
      {
        if (*(void *)v633 != v285) {
          objc_enumerationMutation(v569);
        }
        v287 = *(void **)(*((void *)&v632 + 1) + 8 * ii);
        uint64_t v288 = [v287 portType];
        if (objc_msgSend((id)objc_msgSend(v287, "configuration"), "geometricDistortionCorrectionSupported"))
        {
          uint64_t v289 = objc_msgSend((id)objc_msgSend(v567, "objectForKeyedSubscript:", v288), "objectForKeyedSubscript:", 0x1EFA6BB00);
          if (!v289) {
            goto LABEL_549;
          }
          v290 = (void *)v289;
          v291 = NSNumber;
          [v287 geometricDistortionCorrectionStrengthOnStreamingOutputs];
          objc_msgSend(v563, "setObject:forKeyedSubscript:", objc_msgSend(v290, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v291, "numberWithLong:", llroundf(v292 * 100.0)), "stringValue")), v288);
        }
        v293 = (void *)FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(v277, v550, v288, type);
        if (*(_DWORD *)type)
        {
          uint64_t v426 = v447;
          LODWORD(v423) = *(_DWORD *)type;
          goto LABEL_548;
        }
        v294 = v293;
        if (!v293)
        {
          uint64_t v426 = v447;
          LODWORD(v423) = 0;
          FigDebugAssert3();
          *(_DWORD *)type = -12780;
          goto LABEL_549;
        }
        int v295 = [v293 sensorCropDimensions];
        if (!v295) {
          int v295 = [v294 sensorDimensions];
        }
        int v296 = [v294 horizontalSensorBinningFactor];
        objc_msgSend((id)objc_msgSend(v287, "configuration"), "sensorOverscan");
        double v298 = v297;
        objc_msgSend((id)objc_msgSend(v287, "configuration"), "visOverscan");
        double v300 = v299;
        v301 = (void *)[v287 configuration];
        if (v298 <= v300) {
          [v301 visOverscan];
        }
        else {
          [v301 sensorOverscan];
        }
        float v303 = v302;
        float v304 = (float)(v296 * v295) / (float)(v303 + 1.0);
        objc_msgSend((id)objc_msgSend(v287, "configuration"), "additionalVISOverscanReservedInZoom");
        *(float *)&double v306 = v304 / (float)(v305 + 1.0);
        objc_msgSend(v575, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v306), v288);
      }
      uint64_t v284 = [v569 countByEnumeratingWithState:&v632 objects:&v636 count:16];
      if (v284) {
        continue;
      }
      break;
    }
  }
  v307 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:objd];
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v547, "captureStreamsByFocalLength"), "count") >= 2)
  {
    unint64_t v308 = 1;
    do
    {
      uint64_t v309 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v547, "captureStreamsByFocalLength"), "objectAtIndexedSubscript:", v308), "portType");
      uint64_t v310 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v547, "captureStreamsByFocalLength"), "objectAtIndexedSubscript:", v308 - 1), "portType");
      v311 = (void *)[v567 objectForKeyedSubscript:v309];
      v312 = (void *)[v567 objectForKeyedSubscript:v310];
      LODWORD(v311) = objc_msgSend((id)objc_msgSend(v311, "objectForKeyedSubscript:", 0x1EFA6BAE0), "intValue");
      float v313 = (float)(int)objc_msgSend((id)objc_msgSend(v312, "objectForKeyedSubscript:", 0x1EFA6BAE0), "intValue");
      objc_msgSend((id)objc_msgSend(v575, "objectForKeyedSubscript:", v310), "floatValue");
      float v315 = v313 / v314;
      objc_msgSend((id)objc_msgSend(v575, "objectForKeyedSubscript:", v309), "floatValue");
      float v317 = (float)(int)v311 / v316;
      objc_msgSend((id)objc_msgSend(v563, "objectForKeyedSubscript:", v310), "floatValue");
      if (v318 == 0.0) {
        float v319 = 1.0;
      }
      else {
        float v319 = v318;
      }
      objc_msgSend((id)objc_msgSend(v563, "objectForKeyedSubscript:", v309), "floatValue");
      if (v320 == 0.0) {
        float v320 = 1.0;
      }
      float v321 = v315 * v319;
      float v322 = v317 * v320;
      objc_msgSend((id)objc_msgSend(objd, "objectForKeyedSubscript:", v309), "floatValue");
      float v324 = v323;
      objc_msgSend((id)objc_msgSend(objd, "objectForKeyedSubscript:", v310), "floatValue");
      float v326 = (float)(v322 / v321) * (float)(v324 / v325);
      objc_msgSend((id)objc_msgSend(v307, "objectForKeyedSubscript:", v310), "floatValue");
      float v328 = v327 * v326;
      if (([v547 overCaptureEnabled] & 1) == 0
        && (int)[v547 maxOverscanVideoStabilizationMethod] <= 0)
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v547, "captureStreamsByFocalLength"), "objectAtIndexedSubscript:", v308 - 1), "nondisruptiveSwitchingZoomFactors"), "lastObject"), "floatValue");
        float v331 = v330;
        if (BWWiderNonDisruptiveSwitchingFormatZoomFactorAndNarrowerBaseZoomFactorShouldBeCombined(v330, v328)) {
          float v328 = v331;
        }
      }
      *(float *)&double v329 = v328;
      objc_msgSend(v307, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v329), v309);
      ++v308;
    }
    while (objc_msgSend((id)objc_msgSend(v547, "captureStreamsByFocalLength"), "count") > v308);
  }

  uint64_t v332 = v549;
  if (v307)
  {
    [*(id *)(v549 + 440) setBaseZoomFactorsByPortType:v307];
    long long v587 = 0u;
    long long v586 = 0u;
    long long v585 = 0u;
    long long v584 = 0u;
    v333 = *(void **)(v549 + 56);
    uint64_t v334 = [v333 countByEnumeratingWithState:&v584 objects:v623 count:16];
    if (v334)
    {
      uint64_t v335 = v334;
      uint64_t v336 = *(void *)v585;
      do
      {
        for (juint64_t j = 0; jj != v335; ++jj)
        {
          if (*(void *)v585 != v336) {
            objc_enumerationMutation(v333);
          }
          [*(id *)(*((void *)&v584 + 1) + 8 * jj) updateZoomFactorsToNondisruptiveSwitchingFormatIndexMapping];
        }
        uint64_t v335 = [v333 countByEnumeratingWithState:&v584 objects:v623 count:16];
      }
      while (v335);
    }
  }
LABEL_550:
  if (v548)
  {
    v338 = *(void **)(v332 + 56);
    v339 = v550;
    if (*(unsigned char *)(v548 + 24))
    {
      unint64_t v340 = objc_msgSend((id)objc_msgSend(v550, "actionCameraCompanionFormat"), "sensorDimensions");
      v341 = (void *)[v550 actionCameraCompanionFormat];
      v342 = v545;
      goto LABEL_555;
    }
    v342 = v545;
  }
  else
  {
    v338 = *(void **)(v332 + 56);
    v342 = v545;
    v339 = v550;
  }
  unint64_t v340 = objc_msgSend(v339, "sensorDimensions", v423, v426);
  v341 = v339;
LABEL_555:
  unint64_t v343 = objc_msgSend(v341, "sensorCropDimensions", v423);
  BOOL v344 = FigCaptureVideoDimensionsAreValid(v343);
  double v346 = *MEMORY[0x1E4F1DB30];
  double v345 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v632 = 0u;
  long long v633 = 0u;
  long long v634 = 0u;
  long long v635 = 0u;
  uint64_t v347 = [v338 countByEnumeratingWithState:&v632 objects:&v636 count:16];
  if (v347)
  {
    uint64_t v348 = v347;
    unint64_t v349 = HIDWORD(v343);
    if (v344)
    {
      int v350 = v343;
    }
    else
    {
      LODWORD(v349) = HIDWORD(v340);
      int v350 = v340;
    }
    uint64_t v351 = *(void *)v633;
    double v352 = (double)v350;
    double v353 = (double)(int)v349;
    do
    {
      for (kuint64_t k = 0; kk != v348; ++kk)
      {
        if (*(void *)v633 != v351) {
          objc_enumerationMutation(v338);
        }
        v355 = *(void **)(*((void *)&v632 + 1) + 8 * kk);
        objc_msgSend((id)objc_msgSend(v355, "configuration"), "visOverscan");
        double v357 = v356;
        double v359 = v358;
        objc_msgSend((id)objc_msgSend(v355, "configuration"), "sensorOverscan");
        BOOL v362 = v357 > v360;
        if (v359 > v361) {
          BOOL v362 = 1;
        }
        if (v362)
        {
          double v360 = v357;
          double v361 = v359;
        }
        double v363 = v352 / (v360 + 1.0);
        double v364 = v353 / (v361 + 1.0);
        if (v346 <= v363) {
          double v346 = v363;
        }
        if (v345 <= v364) {
          double v345 = v364;
        }
      }
      uint64_t v348 = [v338 countByEnumeratingWithState:&v632 objects:&v636 count:16];
    }
    while (v348);
  }
  uint64_t v365 = (int)v346;
  unint64_t v366 = (int)v345;
  uint64_t v367 = [v550 sourceCropAspectRatio];
  if ((int)v367 < 1)
  {
    uint64_t v368 = v549;
    unsigned int v369 = v540;
    v370 = v465;
  }
  else
  {
    uint64_t v368 = v549;
    unsigned int v369 = v540;
    v370 = v465;
    if (SHIDWORD(v367) >= 1)
    {
      unint64_t v371 = FigCaptureFitAspectInsideDimensions(v365 | (v366 << 32), 0x200000002, (float)(int)v367 / (float)SHIDWORD(v367));
      unint64_t v366 = HIDWORD(v371);
      LODWORD(v365) = v371;
    }
  }
  double v372 = 0.0;
  if ((int)v340 <= (int)v365 && SHIDWORD(v340) <= (int)v366)
  {
    unint64_t v366 = HIDWORD(v340);
    LODWORD(v365) = v340;
    double v374 = 0.0;
  }
  else
  {
    double v374 = (double)(((int)v340 - (int)v365) / 2);
    int v375 = HIDWORD(v340) - v366;
    if (SHIDWORD(v340) < (int)v366) {
      ++v375;
    }
    double v372 = (double)(v375 >> 1);
  }
  v376 = v464;
  objc_msgSend(*(id *)(v368 + 440), "setRegionOfInterestWithoutOverscan:", v374, v372, (double)(int)v365, (double)(int)v366);
  uint64_t v377 = v548;
  if (v548)
  {
    [*(id *)(v368 + 440) setLumaHistogramsEnabled:*(unsigned __int8 *)(v548 + 293)];
    if (*(unsigned char *)(v548 + 145) || *(unsigned char *)(v548 + 154))
    {
      [*(id *)(v368 + 440) setSensorRawPoolEnabled:1];
      long long v583 = 0u;
      long long v582 = 0u;
      long long v581 = 0u;
      long long v580 = 0u;
      v379 = *(void **)(v368 + 56);
      uint64_t v380 = [v379 countByEnumeratingWithState:&v580 objects:v622 count:16];
      if (v380)
      {
        uint64_t v381 = v380;
        unsigned int v382 = 0;
        unint64_t v383 = 0;
        uint64_t v384 = *(void *)v581;
        do
        {
          for (muint64_t m = 0; mm != v381; ++mm)
          {
            if (*(void *)v581 != v384) {
              objc_enumerationMutation(v379);
            }
            v386 = *(void **)(*((void *)&v580 + 1) + 8 * mm);
            BOOL v387 = FigCaptureVideoDimensionsAreValid(v382 | (v383 << 32));
            unint64_t v388 = [v386 ultraHighResSensorRawStillImageOutputDimensions];
            uint64_t v389 = v388;
            unint64_t v390 = HIDWORD(v388);
            if (v387)
            {
              if (FigCaptureVideoDimensionsAreValid(v388))
              {
                BOOL v391 = FigCaptureVideoDimensionsAreEqual(v382 | (v383 << 32), v389);
                if ((int)v382 <= (int)v389) {
                  unsigned int v392 = v389;
                }
                else {
                  unsigned int v392 = v382;
                }
                if ((int)v383 <= (int)v390) {
                  unsigned int v393 = v390;
                }
                else {
                  unsigned int v393 = v383;
                }
                if (v391)
                {
                  unint64_t v383 = v383;
                }
                else
                {
                  unsigned int v382 = v392;
                  unint64_t v383 = v393;
                }
              }
            }
            else
            {
              unsigned int v382 = v388;
              unint64_t v383 = HIDWORD(v388);
            }
          }
          uint64_t v381 = [v379 countByEnumeratingWithState:&v580 objects:v622 count:16];
        }
        while (v381);
      }
      else
      {
        unsigned int v382 = 0;
        unint64_t v383 = 0;
      }
      uint64_t v368 = v549;
      [*(id *)(v549 + 440) setUltraHighResSensorRawPoolDimensions:v382 | (v383 << 32)];
      v342 = v545;
      uint64_t v377 = v548;
      unsigned int v369 = v540;
      v370 = v465;
      v376 = v464;
    }
  }
  else
  {
    [*(id *)(v368 + 440) setLumaHistogramsEnabled:0];
  }
  -[FigCaptureCameraSourcePipeline _insertPreLTMThumbnailOutputsBySourceDeviceType:previewOutputsBySourceDeviceType:videoCaptureOutputsBySourceDeviceType:pipelineConfiguration:graph:]((id *)v368, v457, v370, v376, v378, v342);
  unsigned int v607 = 0;
  unsigned int v607 = -[FigCaptureCameraSourcePipeline _buildSemanticMasksOutputNetwork:pipelineConfiguration:graph:](v368, v458, v377, v342);
  if (v607) {
    goto LABEL_461;
  }
  unsigned int v607 = -[FigCaptureCameraSourcePipeline _buildVideoCaptureOutputNetwork:previewOutputsBySourceDeviceType:stillImageOutputsByPortType:lightSourceMaskOutputsBySourceDeviceType:keypointDescriptorDataOutputsBySourceDeviceType:pipelineConfiguration:graph:videoCaptureDimensions:numberOfSecondaryFramesToSkip:](v368, v376, v370, v468, v456, v455, v377, v342, v424, v431);
  if (v607) {
    goto LABEL_461;
  }
  unsigned int v607 = -[FigCaptureCameraSourcePipeline _buildPreviewOutputNetwork:videoCaptureOutputsBySourceDeviceType:pipelineConfiguration:graph:numberOfSecondaryFramesToSkip:]((id *)v368, v370, v394, v377, v342, v431);
  if (v607) {
    goto LABEL_461;
  }
  unsigned int v607 = -[FigCaptureCameraSourcePipeline _buildDetectedObjectsOutputNetwork:pipelineConfiguration:graph:](v368, v454, v377, v342);
  if (v607) {
    goto LABEL_461;
  }
  if (v500)
  {
    if (v377) {
      v395 = *(void **)(v377 + 240);
    }
    else {
      v395 = 0;
    }
    -[FigCaptureCameraSourcePipeline _updateNumberOfFaceTrackingConnectionConfigurations:]((void *)v368, v395);
  }
  *(void *)(v368 + 384) = [v452 copy];
  *(void *)(v368 + 392) = [v453 copy];
  *(void *)(v368 + 400) = [v439 copy];
  unsigned int v607 = -[FigCaptureCameraSourcePipeline _buildPointCloudOutputNetworkWithPipelineConfiguration:graph:]((id *)v368, v377, v342);
  if (v607) {
    goto LABEL_461;
  }
  *(void *)(v368 + 416) = v440;
  [*(id *)(v368 + 64) setRenderDelegate:a4];
  int v396 = objc_msgSend((id)objc_msgSend(*(id *)(v368 + 64), "configuration"), "videoCaptureOutputEnabled");
  v397 = *(void **)(v368 + 64);
  if (v396)
  {
    v398 = (void *)[v397 videoCaptureOutput];
    goto LABEL_648;
  }
  if (objc_msgSend((id)objc_msgSend(v397, "configuration"), "previewOutputEnabled"))
  {
    v398 = (void *)[*(id *)(v368 + 64) previewOutput];
    goto LABEL_648;
  }
  uint64_t v399 = [v468 count];
  v400 = *(void **)(v368 + 64);
  if (v399)
  {
    v398 = (void *)[v400 stillImageOutput];
    goto LABEL_648;
  }
  int v406 = objc_msgSend((id)objc_msgSend(v400, "configuration"), "detectedObjectsOutputEnabled");
  v407 = *(void **)(v368 + 64);
  if (v406)
  {
    v398 = (void *)[v407 detectedObjectsOutput];
    goto LABEL_648;
  }
  int v408 = objc_msgSend((id)objc_msgSend(v407, "configuration"), "pointCloudOutputEnabled");
  v409 = *(void **)(v368 + 64);
  if (v408)
  {
    v398 = (void *)[v409 pointCloudOutput];
    goto LABEL_648;
  }
  int v410 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v409, "configuration"), "secureMetadataOutputConfiguration"), "objectDetectionEnabled");
  v411 = *(void **)(v368 + 64);
  if (v410)
  {
    v398 = (void *)[v411 secureDetectedObjectsOutput];
    goto LABEL_648;
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v411, "configuration"), "secureMetadataOutputConfiguration"), "eyeReliefStatusDetectionEnabled"))
  {
    v398 = (void *)[*(id *)(v368 + 64) eyeReliefStatusOutput];
LABEL_648:
    *(void *)(v368 + 104) = v398;
  }
  *(void *)(v368 + 160) = v468;
  *(void *)(v368 + 168) = v451;
  *(_DWORD *)(v368 + 492) = v369;
  if (v377)
  {
    *(unsigned char *)(v368 + 553) = *(unsigned char *)(v377 + 344);
    *(unsigned char *)(v368 + 554) = *(unsigned char *)(v377 + 345);
    int v412 = v476 ^ 1;
    if (!*(unsigned char *)(v377 + 265)) {
      int v412 = 1;
    }
    if (((v437 | v412) & 1) == 0)
    {
      long long v579 = 0u;
      long long v578 = 0u;
      long long v577 = 0u;
      long long v576 = 0u;
      v413 = *(void **)(v368 + 56);
      uint64_t v414 = [v413 countByEnumeratingWithState:&v576 objects:v621 count:16];
      if (v414)
      {
        uint64_t v415 = v414;
        uint64_t v416 = *(void *)v577;
        uint64_t v417 = *MEMORY[0x1E4F52DE0];
        do
        {
          for (nuint64_t n = 0; nn != v415; ++nn)
          {
            if (*(void *)v577 != v416) {
              objc_enumerationMutation(v413);
            }
            v419 = *(void **)(*((void *)&v576 + 1) + 8 * nn);
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v419, "captureStream"), "portType"), "isEqualToString:", v417))objc_msgSend(v342, "enableDeferredStartForSourceNode:mustStartAfterNonDeferred:", v419, 1); {
          }
            }
          uint64_t v415 = [v413 countByEnumeratingWithState:&v576 objects:v621 count:16];
        }
        while (v415);
      }
    }
  }
  else
  {
    *(unsigned char *)(v368 + 553) = 0;
    *(unsigned char *)(v368 + 554) = 0;
  }
LABEL_462:
  result = v607;
  if (!v607)
  {
    if (v606) {
      return [v606 code];
    }
  }
  return result;
}

- (uint64_t)_insertPreLTMThumbnailOutputsBySourceDeviceType:(void *)a3 previewOutputsBySourceDeviceType:(void *)a4 videoCaptureOutputsBySourceDeviceType:(uint64_t)a5 pipelineConfiguration:(void *)a6 graph:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1 && [a2 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    if (![a3 count]) {
      a3 = a4;
    }
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    id obj = (id)[a3 allKeys];
    uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      uint64_t v23 = *MEMORY[0x1E4F54000];
      uint64_t v20 = *MEMORY[0x1E4F542E8];
      uint64_t v22 = *MEMORY[0x1E4F53B70];
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ([a2 objectForKeyedSubscript:v15])
          {
            uint64_t v16 = (void *)[MEMORY[0x1E4F1CA48] array];
            [v16 addObject:v23];
            if ([a1[55] isBravoVariant]) {
              [v16 addObject:v20];
            }
            uint64_t v17 = [BWMetadataSynchronizerNode alloc];
            uint64_t v29 = v22;
            uint64_t v18 = -[BWMetadataSynchronizerNode initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:](v17, "initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1], 0, 0, 0, v16);
            v24.receiver = a1;
            v24.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v24, sel_addNode_error_, v18, 0) & 1) == 0
              || (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a3, "objectForKeyedSubscript:", v15), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v18, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v15), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v18, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
            {
              FigDebugAssert3();
              return 0;
            }
            objc_msgSend(a3, "setObject:forKeyedSubscript:", -[BWNode output](v18, "output"), v15);
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  return 0;
}

- (id)_buildPointCloudOutputNetworkWithPipelineConfiguration:(void *)a3 graph:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v11 = 0;
    if (a2)
    {
      if (![*(id *)(a2 + 256) count]) {
        goto LABEL_10;
      }
      uint64_t v6 = *(void **)(a2 + 256);
    }
    else
    {
      uint64_t v10 = [0 count];
      uint64_t v6 = 0;
      if (!v10) {
        return 0;
      }
    }
    uint64_t v7 = [v6 count];
    long long v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ((int)v7 < 2)
    {
      objc_msgSend(v8, "addObject:", objc_msgSend(v5[8], "pointCloudOutput"));
    }
    else
    {
      long long v9 = [[BWFanOutNode alloc] initWithFanOutCount:v7 mediaType:1885564004];
      [v5 addNode:v9 error:&v11];
      if (v11)
      {
        FigDebugAssert3();
LABEL_10:
        result = v11;
        if (v11) {
          return (id *)[v11 code];
        }
        return result;
      }
      objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend(v5[8], "pointCloudOutput"), -[BWNode input](v9, "input"), 0);
      objc_msgSend(v8, "addObjectsFromArray:", -[BWNode outputs](v9, "outputs"));
    }
    v5[45] = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v8];
    goto LABEL_10;
  }
  return result;
}

- (void)_updateNumberOfFaceTrackingConnectionConfigurations:(void *)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(a2);
          }
          long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v9))
          {
            uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "sourceConfiguration"), "sourceDeviceType");
            int v11 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v10)), "intValue");
            uint64_t v12 = [NSNumber numberWithInt:(v11 + 1)];
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, objc_msgSend(NSNumber, "numberWithInt:", v10));
          }
        }
        uint64_t v6 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    result = v4;
    v3[23] = result;
  }
  return result;
}

- (uint64_t)captureSource
{
  if (result) {
    return *(void *)(result + 448);
  }
  return result;
}

- (uint64_t)stillImageSensorRawOutputsByPortType
{
  if (result) {
    return *(void *)(result + 168);
  }
  return result;
}

- (uint64_t)stillImageOutputsByPortType
{
  if (result) {
    return *(void *)(result + 160);
  }
  return result;
}

- (uint64_t)stillImageOutputColorInfo
{
  if (result)
  {
    v1 = *(void **)(result + 64);
    uint64_t v2 = [v1 stillImageOutput];
    return [v1 colorInfoForOutput:v2];
  }
  return result;
}

- (void)portTypesWithGeometricDistortionCorrectionOnStillImageOutputEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = (void *)v1[7];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "configuration"), "geometricDistortionCorrectionOnStillImageOutputEnabled"))objc_msgSend(v2, "addObject:", objc_msgSend(v8, "portType")); {
        }
          }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    return (id)[v2 copy];
  }
  return result;
}

- (uint64_t)nextPointCloudOutput
{
  if (result)
  {
    v1 = *(void **)(result + 360);
    ++*(_DWORD *)(result + 368);
    return objc_msgSend(v1, "objectAtIndexedSubscript:");
  }
  return result;
}

- (void)setFaceFilteringDelegate:(void *)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = (void *)result[9];
  if (v4)
  {
    if (v3[8]) {
      [v4 setDetectedFacesFilterDelegate:a2];
    }
LABEL_7:
    result = (void *)v3[8];
    if (!result || !v3[10]) {
      return result;
    }
    goto LABEL_9;
  }
  if (v3[10]) {
    goto LABEL_7;
  }
  result = (void *)v3[8];
LABEL_9:
  return (void *)[result setDetectedFacesFilterDelegate:a2];
}

- (uint64_t)_addCrossOverNodeToGraph:(int)a3 outputNetworkType:(void *)a4 inputs:(uint64_t)a5 mediaType:(uint64_t)a6 name:(_DWORD *)a7 outErr:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v13 = (void *)result;
    id v29 = 0;
    uint64_t v14 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", a5, [a4 count]);
    [(BWNode *)v14 setName:a6];
    v28.receiver = v13;
    v28.super_class = (Class)FigCaptureCameraSourcePipeline;
    if (objc_msgSendSuper2(&v28, sel_addNode_error_, v14, &v29))
    {
      if (a3 == 2) {
        long long v15 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.detectedObjects" priority:14];
      }
      else {
        long long v15 = 0;
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v16 = [a4 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        int v18 = 0;
        uint64_t v19 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(a4);
            }
            if ((objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v24 + 1) + 8 * i), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v14, "inputs"), "objectAtIndexedSubscript:", (v18 + i)), v15) & 1) == 0)
            {
              uint64_t v23 = v7;
              LODWORD(v22) = 0;
              goto LABEL_16;
            }
          }
          uint64_t v17 = [a4 countByEnumeratingWithState:&v24 objects:v30 count:16];
          v18 += i;
          if (v17) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v23 = v7;
      LODWORD(v22) = 0;
LABEL_16:
      FigDebugAssert3();
    }
    int v21 = (int)v29;
    if (v29) {
      int v21 = [v29 code];
    }
    *a7 = v21;
    return (uint64_t)[(BWNode *)v14 output];
  }
  return result;
}

- (void)portTypesWithGeometricDistortionCorrectionOnVideoCaptureOutputsEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = (void *)v1[7];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "configuration"), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled"))objc_msgSend(v2, "addObject:", objc_msgSend(v8, "portType")); {
        }
          }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    return (id)[v2 copy];
  }
  return result;
}

- (uint64_t)_buildSemanticMasksOutputNetwork:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:
{
  if (!a1) {
    return 0;
  }
  if (a3)
  {
    long long v8 = *(void **)(a3 + 200);
    if (!v8) {
      long long v8 = *(void **)(a3 + 208);
    }
  }
  else
  {
    long long v8 = 0;
  }
  uint64_t v9 = -[FigCaptureCameraSourcePipeline _insertFunnelOnMetadataOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:mediaType:metadataName:]((id *)a1, a2, v8, a3, a4, 0x76696465u, @"SemanticMasks");
  if (v9) {
    FigDebugAssert3();
  }
  else {
    *(void *)(a1 + 432) = [a2 copy];
  }
  return v9;
}

- (uint64_t)_buildVideoCaptureOutputNetwork:(void *)a3 previewOutputsBySourceDeviceType:(void *)a4 stillImageOutputsByPortType:(void *)a5 lightSourceMaskOutputsBySourceDeviceType:(void *)a6 keypointDescriptorDataOutputsBySourceDeviceType:(uint64_t)a7 pipelineConfiguration:(void *)a8 graph:(uint64_t)a9 videoCaptureDimensions:(int)a10 numberOfSecondaryFramesToSkip:
{
  uint64_t v299 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v12 = result;
  unsigned int v283 = 0;
  id v282 = 0;
  if (a7)
  {
    long long v13 = *(void **)(a7 + 184);
    uint64_t v14 = *(void *)(a7 + 208);
    v201 = *(void **)(a7 + 224);
  }
  else
  {
    uint64_t v14 = 0;
    long long v13 = 0;
    v201 = 0;
  }
  long long v15 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  if (v14) {
    [v15 addObjectsFromArray:v14];
  }
  if (*(unsigned char *)(v12 + 40))
  {
    if (a7) {
      uint64_t v17 = *(void *)(a7 + 200);
    }
    else {
      uint64_t v17 = 0;
    }
    int v18 = v15;
  }
  else
  {
    if (a7) {
      uint64_t v17 = *(void *)(a7 + 200);
    }
    else {
      uint64_t v17 = 0;
    }
    int v18 = (void *)v16;
  }
  [v18 addObjectsFromArray:v17];
  uint64_t v19 = a7;
  if (*(unsigned char *)(v12 + 472))
  {
    if (a7) {
      uint64_t v20 = *(void *)(a7 + 216);
    }
    else {
      uint64_t v20 = 0;
    }
    [v15 addObject:v20];
    uint64_t v19 = a7;
  }
  uint64_t v228 = a8;
  v197 = a3;
  char v205 = (void *)v16;
  unsigned int v208 = v13;
  if (v19)
  {
    if (*(unsigned char *)(v19 + 346) && *(unsigned char *)(v12 + 40))
    {
      int v21 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
      [(BWNode *)v21 setName:@"Video Preview/Capture Splitter"];
      uint64_t v22 = [a2 objectForKeyedSubscript:&unk_1EFAFF990];
      v281.receiver = (id)v12;
      v281.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v281, sel_addNode_error_, v21, &v282) & 1) == 0
        || (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v22, -[BWNode input](v21, "input"), 0) & 1) == 0)
      {
        goto LABEL_312;
      }
      id v23 = [(NSArray *)[(BWNode *)v21 outputs] objectAtIndexedSubscript:0];
      [v23 setName:@"Preview"];
      [a3 setObject:v23 forKeyedSubscript:&unk_1EFAFF990];
      objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v21, "outputs"), "objectAtIndexedSubscript:", 1), &unk_1EFAFF990);
      uint64_t v19 = a7;
    }
    if (![*(id *)(v19 + 232) count])
    {
      long long v25 = 0;
      long long v279 = 0u;
      long long v280 = 0u;
      long long v277 = 0u;
      long long v278 = 0u;
LABEL_28:
      long long v26 = *(void **)(v19 + 232);
      goto LABEL_29;
    }
    long long v24 = *(void **)(v19 + 232);
LABEL_25:
    long long v25 = (char *)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
    long long v277 = 0u;
    long long v278 = 0u;
    long long v279 = 0u;
    long long v280 = 0u;
    if (!v19)
    {
      long long v26 = 0;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v183 = [0 count];
  long long v24 = 0;
  if (v183) {
    goto LABEL_25;
  }
  long long v25 = 0;
  long long v26 = 0;
  long long v279 = 0u;
  long long v280 = 0u;
  long long v277 = 0u;
  long long v278 = 0u;
LABEL_29:
  uint64_t v27 = [v26 countByEnumeratingWithState:&v277 objects:v298 count:16];
  uint64_t v230 = v12;
  v225 = v15;
  if (v27)
  {
    uint64_t v28 = v27;
    id v221 = *(id *)v278;
    char v215 = v25;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(id *)v278 != v221) {
          objc_enumerationMutation(v26);
        }
        int v30 = *(void **)(*((void *)&v277 + 1) + 8 * v29);
        [v15 removeObject:v30];
        uint64_t v31 = [v30 underlyingDeviceType];
        uint64_t v32 = objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v31));
        if (a7) {
          id v33 = *(void **)(a7 + 208);
        }
        else {
          id v33 = 0;
        }
        uint64_t v34 = objc_msgSend((id)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v33, v31), "count");
        if (v34)
        {
          v297[0] = @"PrimaryFormat";
          v297[1] = 0x1EFA60460;
          char v35 = (void *)MEMORY[0x1E4F1C978];
          int v36 = v297;
          uint64_t v37 = 2;
        }
        else
        {
          uint64_t v296 = 0x1EFA60460;
          char v35 = (void *)MEMORY[0x1E4F1C978];
          int v36 = &v296;
          uint64_t v37 = 1;
        }
        uint64_t v38 = [v35 arrayWithObjects:v36 count:v37];
        id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (a7)
        {
          if (*(unsigned char *)(a7 + 320))
          {
            BOOL v40 = *(void **)(v230 + 536);
            uint64_t v41 = [NSNumber numberWithInt:v31];
            uint64_t v42 = v40;
            uint64_t v12 = v230;
            if ([v42 objectForKey:v41]) {
              objc_msgSend(v39, "addObjectsFromArray:", BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, *(unsigned __int8 *)(a7 + 321)));
            }
          }
        }
        uint64_t v43 = [[BWAttachedMediaSplitNode alloc] initWithAttachedMediaKeys:v38 attachedMediaToPropagateToPrimaryOutput:v39];
        [(BWNode *)v43 setName:@"Vision Data Splitter"];
        v276.receiver = (id)v12;
        v276.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v276, sel_addNode_error_, v43, &v282) & 1) == 0
          || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v32, -[BWNode input](v43, "input"), 0) & 1) == 0)
        {
          goto LABEL_312;
        }
        if (v34)
        {
          uint64_t v34 = [(NSArray *)[(BWNode *)v43 outputs] objectAtIndexedSubscript:0];
          uint64_t v44 = 1;
        }
        else
        {
          uint64_t v44 = 0;
        }
        objc_msgSend(a2, "setObject:forKeyedSubscript:", v34, objc_msgSend(NSNumber, "numberWithInt:", v31));
        uint64_t v45 = [(NSArray *)[(BWNode *)v43 outputs] objectAtIndexedSubscript:v44];
        long long v25 = v215;
        objc_msgSend(v215, "setObject:forKeyedSubscript:", v45, objc_msgSend(NSNumber, "numberWithInt:", v31));
        ++v29;
        long long v15 = v225;
      }
      while (v28 != v29);
      uint64_t v46 = [v26 countByEnumeratingWithState:&v277 objects:v298 count:16];
      uint64_t v28 = v46;
    }
    while (v46);
  }
  uint64_t v47 = [v25 count];
  if (v47) {
    uint64_t v47 = [v25 copy];
  }
  *(void *)(v12 + 408) = v47;
  uint64_t v48 = a7;
  unsigned int v283 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:](v12, a2, v15, a7, v228, 1u, a10);
  if (v283) {
    goto LABEL_312;
  }
  if (a7)
  {
    uint64_t v49 = v197;
    if (*(unsigned char *)(a7 + 320) && *(_DWORD *)(a7 + 28) != 3)
    {
      unsigned int v283 = -[FigCaptureCameraSourcePipeline _insertSmartStyleLearningNodeOnOutputsBySourceDeviceType:ifAllowedByAdditionalPreviewConnectionConfigurations:semanticMasksOutputsBySourceDeviceType:pipelineConfiguration:graph:]((id *)v12, a2, v205, *(void **)(v12 + 432), a7, v228);
      if (v283) {
        goto LABEL_312;
      }
      int v50 = 1;
      uint64_t v48 = a7;
    }
    else
    {
      int v50 = 0;
    }
  }
  else
  {
    int v50 = 0;
    uint64_t v49 = v197;
  }
  uint64_t v195 = *MEMORY[0x1E4F53B60];
  unsigned int v283 = -[FigCaptureCameraSourcePipeline _insertFunnelOnMetadataOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:mediaType:metadataName:]((id *)v12, a5, v15, v48, v228, 0x76696465u, *MEMORY[0x1E4F53B60]);
  if (v283) {
    goto LABEL_312;
  }
  uint64_t v194 = *MEMORY[0x1E4F53B58];
  unsigned int v283 = -[FigCaptureCameraSourcePipeline _insertFunnelOnMetadataOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:mediaType:metadataName:]((id *)v12, a6, v15, v48, v228, 0x76696465u, *MEMORY[0x1E4F53B58]);
  if (v283) {
    goto LABEL_312;
  }
  if (v48) {
    uint64_t v51 = *(void *)(v48 + 216);
  }
  else {
    uint64_t v51 = 0;
  }
  unsigned __int8 v275 = 0;
  int v52 = FigCaptureVideoEffectEnabledInGraph(@"backgroundblur", [v208 backgroundBlurEnabled], objc_msgSend(v208, "isBackgroundBlurSupported"), objc_msgSend((id)objc_msgSend(v208, "requiredFormat"), "isBackgroundBlurProvidedBySource"), v51 != 0, &v275);
  unsigned __int8 v274 = 0;
  int v216 = FigCaptureVideoEffectEnabledInGraph(@"studiolighting", [v208 studioLightingEnabled], objc_msgSend(v208, "isStudioLightingSupported"), objc_msgSend((id)objc_msgSend(v208, "requiredFormat"), "isStudioLightingProvidedBySource"), v51 != 0, &v274);
  unsigned __int8 v273 = 0;
  int v206 = FigCaptureVideoEffectEnabledInGraph(@"reactioneffects", [v208 reactionEffectsEnabled], objc_msgSend(v208, "reactionEffectsSupported"), objc_msgSend((id)objc_msgSend(v208, "requiredFormat"), "reactionEffectsProvidedBySource"), v51 != 0, &v273);
  unsigned __int8 v272 = 0;
  int obj = FigCaptureVideoEffectEnabledInGraph(@"backgroundreplacement", [v208 backgroundReplacementEnabled], objc_msgSend(v208, "isBackgroundReplacementSupported"), objc_msgSend((id)objc_msgSend(v208, "requiredFormat"), "isBackgroundReplacementProvidedBySource"), v51 != 0, &v272);
  int v53 = a2;
  if ([*(id *)(v12 + 440) adaptiveOverscanEnabled])
  {
    if ([a2 count] == 1)
    {
      uint64_t v54 = objc_msgSend((id)objc_msgSend(a2, "allKeys"), "firstObject");
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = [a2 objectForKeyedSubscript:v54];
        int v57 = -[BWVISOverscanPredictionNode initWithCameraInfoByPortType:delegate:]([BWVISOverscanPredictionNode alloc], "initWithCameraInfoByPortType:delegate:", [*(id *)(v12 + 440) cameraInfoByPortType], v12);
        [(BWNode *)v57 setName:@"Overscan prediction"];
        v271.receiver = (id)v12;
        v271.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v271, sel_addNode_error_, v57, &v282) & 1) == 0
          || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v56, -[BWNode input](v57, "input"), 0) & 1) == 0)
        {
          goto LABEL_312;
        }
        uint64_t v58 = [(BWNode *)v57 output];
        int v53 = a2;
        [a2 setObject:v58 forKeyedSubscript:v55];
      }
    }
  }
  uint64_t v204 = v51;
  int v192 = v50;
  if ([v53 count]) {
    int v59 = v53;
  }
  else {
    int v59 = v49;
  }
  id v222 = v59;
  if (csp_dockKitNodeEnabled(a7, [v228 isRunningForContinuityCapture]))
  {
    uint64_t v60 = csp_cinematicVideoEnabled(a7);
    int v61 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v208, "requiredFormat"), "AVCaptureSessionPresets"), "containsObject:", @"AVCaptureSessionPresetPhoto");
    int v62 = csp_portraitPhotoModeEnabled(a7);
    int v63 = FigCaptureClientApplicationIDIsCameraOrDerivative((void *)[*(id *)(v12 + 440) applicationID]);
    long long v267 = 0u;
    long long v268 = 0u;
    long long v269 = 0u;
    long long v270 = 0u;
    id v218 = (id)[v222 allKeys];
    uint64_t v64 = [v218 countByEnumeratingWithState:&v267 objects:v295 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v268;
      uint64_t v67 = (v60 | v63 & (v61 | v62)) ^ 1;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          if (*(void *)v268 != v66) {
            objc_enumerationMutation(v218);
          }
          uint64_t v69 = *(void *)(*((void *)&v267 + 1) + 8 * i);
          uint64_t v70 = [v222 objectForKeyedSubscript:v69];
          uint64_t v71 = -[BWDockKitNode initWithIsRunningForContinuityCapture:cinematicVideoEnabled:]([BWDockKitNode alloc], "initWithIsRunningForContinuityCapture:cinematicVideoEnabled:", [v228 isRunningForContinuityCapture], v60);
          v266.receiver = (id)v230;
          v266.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v266, sel_addNode_error_, v71, &v282) & 1) == 0
            || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v70, -[BWNode input](v71, "input"), 0) & 1) == 0)
          {
            goto LABEL_312;
          }
          objc_msgSend(v222, "setObject:forKeyedSubscript:", -[BWNode output](v71, "output"), v69);
          [(BWDockKitNode *)v71 setCustomInferenceEnabled:v67];
          -[BWDockKitNode setClientApplicationID:](v71, "setClientApplicationID:", [*(id *)(v230 + 440) applicationID]);
          *(void *)(v230 + 96) = v71;
        }
        uint64_t v12 = v230;
        uint64_t v65 = [v218 countByEnumeratingWithState:&v267 objects:v295 count:16];
      }
      while (v65);
    }
  }
  int v72 = v52 | v216;
  int v73 = v208;
  if ((objc_msgSend((id)objc_msgSend(v208, "requiredFormat"), "isCinematicFramingProvidedBySource") & 1) == 0
    && (([v208 cinematicFramingEnabled] & 1) != 0
     || [v208 manualCinematicFramingEnabled]))
  {
    unsigned int v75 = v225;
    int v193 = [v208 deskCamEnabled];
    if (v193)
    {
      uint64_t v78 = [a2 objectForKeyedSubscript:&unk_1EFAFF9C0];
      uint64_t v76 = v228;
      if (!v78) {
        goto LABEL_312;
      }
      uint64_t v79 = v78;
      id v80 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
      [(BWNode *)v80 setName:@"Cinematic Framing/DeskCam Splitter"];
      v265.receiver = (id)v12;
      v265.super_class = (Class)FigCaptureCameraSourcePipeline;
      if ((objc_msgSendSuper2(&v265, sel_addNode_error_, v80, &v282) & 1) == 0
        || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v79, -[BWNode input](v80, "input"), 0) & 1) == 0)
      {
        goto LABEL_312;
      }
      objc_msgSend(v222, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v80, "outputs"), "objectAtIndexedSubscript:", 0), &unk_1EFAFF9C0);
    }
    else
    {
      id v80 = 0;
      uint64_t v76 = v228;
    }
    uint64_t v81 = [*(id *)(v12 + 440) cameraInfoByPortType];
    v190 = v80;
    char v82 = v193 ^ 1;
    if (v80) {
      char v82 = 1;
    }
    if ((v82 & 1) == 0) {
      goto LABEL_312;
    }
    uint64_t v74 = v81;
    *(void *)(v12 + 136) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v222, "count"));
    int v77 = obj;
    unsigned int v83 = v204 ? (v72 | obj) ^ 1 : 0;
    unsigned int v283 = -[FigCaptureCameraSourcePipeline _insertSubjectSelectionAndCinematicFramingNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:cameraInfoByPortType:graph:stillImageCaptureEnabled:stillImageOutputsByPortType:](v12, v222, v225, a7, v74, v76, v83);
    if (v283) {
      goto LABEL_312;
    }
  }
  else
  {
    uint64_t v74 = [*(id *)(v12 + 440) cameraInfoByPortType];
    v190 = 0;
    int v193 = 0;
    unsigned int v75 = v225;
    uint64_t v76 = v228;
    int v77 = obj;
  }
  uint64_t v191 = v74;
  if (v72 | v206 | v77)
  {
    *(void *)(v12 + 144) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v222, "count"));
    long long v261 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    long long v264 = 0u;
    id v200 = (id)[v222 allKeys];
    uint64_t v207 = [v200 countByEnumeratingWithState:&v261 objects:v294 count:16];
    if (v207)
    {
      uint64_t v202 = *(void *)v262;
      do
      {
        uint64_t v84 = 0;
        do
        {
          if (*(void *)v262 != v202) {
            objc_enumerationMutation(v200);
          }
          unsigned int v85 = *(void **)(*((void *)&v261 + 1) + 8 * (void)v84);
          uint64_t v86 = objc_msgSend(v222, "objectForKeyedSubscript:", v85, v184, v187);
          uint64_t v87 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v75, [v85 intValue]);
          id obja = v84;
          uint64_t v213 = v86;
          uint64_t v217 = (char *)v85;
          if (FigCapturePlatformSupportsUniversalLossyCompression()) {
            unsigned int v219 = csp_maxLossyCompressionLevelForConnectionConfigurations(v87, (unsigned int *)a7);
          }
          else {
            unsigned int v219 = 0;
          }
          int v88 = -[FigCaptureCameraSourcePipeline _getDeviceOrientationCorrectionEnabledForVideoCaptureConnectionConfigurations:](v12, v87);
          uint64_t v89 = [v73 backgroundBlurEnabled];
          if ([v73 studioLightingEnabled]) {
            v89 |= 2uLL;
          }
          if ([v73 reactionEffectsEnabled]) {
            v89 |= 0x10uLL;
          }
          if ([v73 backgroundReplacementEnabled]) {
            uint64_t v90 = v89 | 0x40;
          }
          else {
            uint64_t v90 = v89;
          }
          int v91 = v275;
          uint64_t v92 = v90 | v275;
          int v93 = v274;
          if (v274) {
            v92 |= 2uLL;
          }
          int v94 = v273;
          if (v273) {
            v92 |= 0x10uLL;
          }
          int v95 = v272;
          if (v272) {
            uint64_t v96 = v92 | 0x40;
          }
          else {
            uint64_t v96 = v92;
          }
          uint64_t v97 = v90;
          if (v204) {
            BOOL v98 = v90 == 16;
          }
          else {
            BOOL v98 = 1;
          }
          uint64_t v99 = !v98;
          BOOL v100 = (([v228 isRunningForContinuityCapture] & 1) != 0 || BWDeviceIsiPad())
              && (int)FigCapturePlatformIdentifier() > 6;
          v101 = [BWBackgroundBlurNode alloc];
          if (v88)
          {
            if ([v208 cinematicFramingEnabled]) {
              LOBYTE(v88) = 1;
            }
            else {
              LOBYTE(v88) = [v208 manualCinematicFramingEnabled];
            }
          }
          HIDWORD(v185) = [v217 intValue];
          LOBYTE(v185) = v88;
          v102 = -[BWBackgroundBlurNode initWithStillImageCaptureEnabled:maxLossyCompressionLevel:fastSwitchEnabled:availableEffects:activeEffect:isHighQualitySupported:upstreamDeviceOrientationCorrectionEnabled:deviceType:](v101, "initWithStillImageCaptureEnabled:maxLossyCompressionLevel:fastSwitchEnabled:availableEffects:activeEffect:isHighQualitySupported:upstreamDeviceOrientationCorrectionEnabled:deviceType:", v99, v219, (v93 | v91 | v94 | v95) != 0, v96, v97, v100, v185);
          uint64_t v12 = v230;
          [*(id *)(v230 + 440) setPortraitEffectPropertiesDelegate:v102];
          -[BWBackgroundBlurNode setClientApplicationID:](v102, "setClientApplicationID:", [*(id *)(v230 + 440) applicationID]);
          -[BWBackgroundBlurNode setContinuityCameraClientDeviceClass:](v102, "setContinuityCameraClientDeviceClass:", objc_msgSend((id)objc_msgSend(*(id *)(v230 + 440), "captureStream"), "continuityCameraClientDeviceClass"));
          v260.receiver = (id)v230;
          v260.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v260, sel_addNode_error_, v102, &v282) & 1) == 0
            || ![(BWBackgroundBlurNode *)v102 videoInput]
            || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v213, -[BWBackgroundBlurNode videoInput](v102, "videoInput"), 0) & 1) == 0|| !-[BWBackgroundBlurNode videoOutput](v102, "videoOutput"))
          {
            goto LABEL_312;
          }
          [*(id *)(v230 + 144) setObject:v102 forKeyedSubscript:v217];
          objc_msgSend(v222, "setObject:forKeyedSubscript:", -[BWBackgroundBlurNode videoOutput](v102, "videoOutput"), v217);
          uint64_t v76 = v228;
          if (v99)
          {
            if (![(BWBackgroundBlurNode *)v102 stillImageInput]
              || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(v230 + 440), "captureStream"), "portType")), -[BWBackgroundBlurNode stillImageInput](v102, "stillImageInput"), 0) & 1) == 0|| !-[BWBackgroundBlurNode stillImageOutput](v102, "stillImageOutput"))
            {
              goto LABEL_312;
            }
            objc_msgSend(a4, "setObject:forKeyedSubscript:", -[BWBackgroundBlurNode stillImageOutput](v102, "stillImageOutput"), objc_msgSend((id)objc_msgSend(*(id *)(v230 + 440), "captureStream"), "portType"));
          }
          [(BWBackgroundBlurNode *)v102 setEffectBypassed:v97 == 0];
          int v73 = v208;
          if (dword_1EB4C5210)
          {
            int v259 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          uint64_t v84 = obja + 1;
          unsigned int v75 = v225;
        }
        while ((char *)v207 != obja + 1);
        uint64_t v207 = [v200 countByEnumeratingWithState:&v261 objects:v294 count:16];
      }
      while (v207);
    }
  }
  uint64_t v104 = a2;
  if (objc_msgSend(v73, "deskCamEnabled", v184, v187))
  {
    if (v193) {
      uint64_t v105 = 7;
    }
    else {
      uint64_t v105 = 14;
    }
    uint64_t v106 = objc_msgSend(v222, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v105));
    v107 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v75, v105);
    if (FigCapturePlatformSupportsUniversalLossyCompression()) {
      int v108 = csp_maxLossyCompressionLevelForConnectionConfigurations(v107, (unsigned int *)a7);
    }
    else {
      int v108 = 0;
    }
    v293[0] = 0;
    uint64_t v109 = [v73 source];
    uint64_t v110 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v110) {
      uint64_t v111 = v110;
    }
    else {
      uint64_t v111 = 0;
    }
    v112 = *(void (**)(uint64_t, __CFString *, void, id *))(v111 + 48);
    if (v112) {
      v112(v109, @"OverheadCameraMode", *MEMORY[0x1E4F1CF80], v293);
    }
    id v113 = v293[0];
    LODWORD(v189) = [v293[0] intValue];
    LODWORD(v186) = v108;
    int v114 = -[BWDeskCamNode initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portType:overheadCameraMode:captureDevice:]([BWDeskCamNode alloc], "initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portType:overheadCameraMode:captureDevice:", [v73 deskCamOutputDimensions], v191, objc_msgSend((id)objc_msgSend(v73, "requiredFormat"), "horizontalSensorBinningFactor"), objc_msgSend((id)objc_msgSend(v73, "requiredFormat"), "verticalSensorBinningFactor"), v204 != 0, 0, v186, *MEMORY[0x1E4F52DE8], v189, *(void *)(v230 + 440));
    *(void *)(v230 + 520) = v114;
    -[BWDeskCamNode setClientApplicationID:](v114, "setClientApplicationID:", [*(id *)(v230 + 440) applicationID]);
    v257.receiver = (id)v230;
    v257.super_class = (Class)FigCaptureCameraSourcePipeline;
    if ((objc_msgSendSuper2(&v257, sel_addNode_error_, v114, &v282) & 1) == 0) {
      goto LABEL_312;
    }
    uint64_t v104 = a2;
    if (![(BWDeskCamNode *)v114 videoCaptureInput]) {
      goto LABEL_312;
    }
    if (v193)
    {
      if ((objc_msgSend(v76, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v190, "outputs"), "objectAtIndexedSubscript:", 1), -[BWDeskCamNode videoCaptureInput](v114, "videoCaptureInput"), 0) & 1) == 0)goto LABEL_312; {
    }
      }
    else if ((objc_msgSend(v76, "connectOutput:toInput:pipelineStage:", v106, -[BWDeskCamNode videoCaptureInput](v114, "videoCaptureInput"), 0) & 1) == 0)
    {
      goto LABEL_312;
    }
    if (![(BWDeskCamNode *)v114 videoCaptureOutput]) {
      goto LABEL_312;
    }
    objc_msgSend(v222, "setObject:forKeyedSubscript:", -[BWDeskCamNode videoCaptureOutput](v114, "videoCaptureOutput"), &unk_1EFAFFA38);
  }
  if (a7)
  {
    if (*(unsigned char *)(a7 + 157))
    {
      *(void *)(v230 + 112) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v104, "count"));
      long long v253 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      long long v256 = 0u;
      v115 = (void *)[v104 allKeys];
      uint64_t v116 = [v115 countByEnumeratingWithState:&v253 objects:v292 count:16];
      if (v116)
      {
        uint64_t v117 = v116;
        uint64_t v118 = *(void *)v254;
        do
        {
          for (uint64_t j = 0; j != v117; ++j)
          {
            if (*(void *)v254 != v118) {
              objc_enumerationMutation(v115);
            }
            uint64_t v120 = *(void *)(*((void *)&v253 + 1) + 8 * j);
            uint64_t v121 = [v104 objectForKeyedSubscript:v120];
            v122 = [[BWSynchronizerNode alloc] initWithMediaType:1986618469];
            v252.receiver = (id)v230;
            v252.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v252, sel_addNode_error_, v122, &v282) & 1) == 0) {
              goto LABEL_312;
            }
            [*(id *)(v230 + 112) addObject:v122];
            -[BWSynchronizerNode setSourceClock:](v122, "setSourceClock:", [*(id *)(v230 + 64) clock]);
            if ((objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v121, -[BWNode input](v122, "input"), 0) & 1) == 0) {
              goto LABEL_312;
            }
            uint64_t v104 = a2;
            objc_msgSend(a2, "setObject:forKeyedSubscript:", -[BWNode output](v122, "output"), v120);
          }
          uint64_t v117 = [v115 countByEnumeratingWithState:&v253 objects:v292 count:16];
        }
        while (v117);
      }
    }
    if (*(unsigned char *)(a7 + 158))
    {
      long long v250 = 0u;
      long long v251 = 0u;
      long long v248 = 0u;
      long long v249 = 0u;
      id v223 = (id)[v104 allKeys];
      uint64_t v123 = [v223 countByEnumeratingWithState:&v248 objects:v291 count:16];
      if (v123)
      {
        uint64_t v124 = v123;
        uint64_t v226 = *(void *)v249;
        do
        {
          for (uint64_t k = 0; k != v124; ++k)
          {
            if (*(void *)v249 != v226) {
              objc_enumerationMutation(v223);
            }
            uint64_t v126 = *(void *)(*((void *)&v248 + 1) + 8 * k);
            uint64_t v127 = [v104 objectForKeyedSubscript:v126];
            v128 = *(void **)(a7 + 200);
            VideoDataConfigurationFromConfigurations = csp_getVideoDataConfigurationFromConfigurations(*(void **)(a7 + 208));
            if (!VideoDataConfigurationFromConfigurations) {
              VideoDataConfigurationFromConfigurations = csp_getVideoDataConfigurationFromConfigurations(v128);
            }
            unsigned int v130 = FigCaptureCreateAndConfigureDepthConverterNode(v201, VideoDataConfigurationFromConfigurations, 0, (void *)[v208 requiredFormat], objc_msgSend(*(id *)(v230 + 440), "cameraInfoByPortType"), objc_msgSend(*(id *)(v230 + 440), "depthDataBaseRotation"), *(unsigned __int8 *)(v230 + 496), 0, &v283);
            if (v283) {
              goto LABEL_312;
            }
            unsigned int v131 = v130;
            v132 = v130;
            if (!v131)
            {
LABEL_311:
              FigDebugAssert3();
              unsigned int v283 = -12780;
              goto LABEL_313;
            }
            v247.receiver = (id)v230;
            v247.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v247, sel_addNode_error_, v131, &v282) & 1) == 0
              || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v127, -[BWNode input](v131, "input"), 0) & 1) == 0)
            {
              goto LABEL_312;
            }
            uint64_t v104 = a2;
            objc_msgSend(a2, "setObject:forKeyedSubscript:", -[BWNode output](v131, "output"), v126);
          }
          uint64_t v124 = [v223 countByEnumeratingWithState:&v248 objects:v291 count:16];
        }
        while (v124);
      }
    }
    unsigned int v133 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (*(_DWORD *)(a7 + 28) == 3)
    {
      uint64_t v290 = [v104 objectForKeyedSubscript:&unk_1EFAFF9C0];
      objc_msgSend(v133, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v290, 1), &unk_1EFAFF9C0);
      objc_msgSend(v104, "setObject:forKeyedSubscript:", objc_msgSend(v104, "objectForKeyedSubscript:", &unk_1EFAFF990), &unk_1EFAFF9F0);
    }
  }
  else
  {
    unsigned int v133 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  }
  v134 = (void *)v230;
  if (v192)
  {
    unsigned int v283 = -[FigCaptureCameraSourcePipeline _insertSmartStyleMetadataSynchronizerNodeOnOutputsBySourceDeviceType:pipelineConfiguration:graph:]((id *)v230, a2, a7, v228);
    if (v283)
    {
LABEL_312:
      FigDebugAssert3();
      goto LABEL_313;
    }
  }
  long long v245 = 0u;
  long long v246 = 0u;
  long long v243 = 0u;
  long long v244 = 0u;
  uint64_t v209 = [a2 countByEnumeratingWithState:&v243 objects:v289 count:16];
  if (!v209) {
    goto LABEL_298;
  }
  uint64_t v214 = *(void *)v244;
  id v224 = v133;
  while (2)
  {
    unsigned int v135 = 0;
    do
    {
      if (*(void *)v244 != v214) {
        objc_enumerationMutation(a2);
      }
      double v136 = *(void **)(*((void *)&v243 + 1) + 8 * (void)v135);
      uint64_t v137 = [v136 intValue];
      uint64_t v138 = [a2 objectForKeyedSubscript:v136];
      if (a7) {
        uint64_t v139 = *(void **)(a7 + 208);
      }
      else {
        uint64_t v139 = 0;
      }
      double v140 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(v139, v137);
      int v141 = [v140 count];
      char v220 = v135;
      if (a7) {
        uint64_t v142 = *(void **)(a7 + 200);
      }
      else {
        uint64_t v142 = 0;
      }
      int v143 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v142);
      unsigned int v144 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v144, "setObject:forKeyedSubscript:", objc_msgSend(a5, "objectForKeyedSubscript:", v136), v195);
      objc_msgSend(v144, "setObject:forKeyedSubscript:", objc_msgSend(a6, "objectForKeyedSubscript:", v136), v194);
      v227 = v136;
      if (*(unsigned char *)(v230 + 40)
        && objc_msgSend(v143, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v137))&& (csp_cinematicVideoEnabled(a7) & 1) == 0)
      {
        uint64_t v146 = a7;
        if (a7)
        {
          uint64_t v145 = *(unsigned char *)(a7 + 346) == 0;
          if (!*(unsigned char *)(a7 + 346)) {
            ++v141;
          }
LABEL_215:
          int v147 = *(void **)(v146 + 232);
          goto LABEL_216;
        }
        int v147 = 0;
        ++v141;
        uint64_t v145 = 1;
      }
      else
      {
        uint64_t v145 = 0;
        uint64_t v146 = a7;
        if (a7) {
          goto LABEL_215;
        }
        int v147 = 0;
      }
LABEL_216:
      uint64_t v148 = v146;
      int v149 = objc_msgSend(FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v147), "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v137));
      if (v148) {
        uint64_t v150 = *(void **)(v148 + 248);
      }
      else {
        uint64_t v150 = 0;
      }
      uint64_t v151 = (v141 - v149);
      uint64_t v152 = v227;
      if (objc_msgSend(FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(v150), "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v137)))uint64_t v151 = v151- (FigCaptureConnectionConfigurationWithSinkTypeAndMediaType(v140, 4, 1986618469) != 0); {
      unsigned int v153 = v151 - 1;
      }
      v134 = (void *)v230;
      if (v151 == 1)
      {
        if (v145)
        {
          unsigned int v133 = v224;
          if ([v197 objectForKeyedSubscript:v227])
          {
            uint64_t v188 = v196;
            LODWORD(v186) = 0;
            FigDebugAssert3();
          }
          objc_msgSend(v197, "setObject:forKeyedSubscript:", v138, v227, v186, v188);
          unsigned int v153 = 0;
        }
        else
        {
          uint64_t v288 = v138;
          unsigned int v133 = v224;
          objc_msgSend(v224, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v288, 1), v227);
          unsigned int v153 = [v144 count] != 0;
        }
      }
      else
      {
        if ((int)v151 < 2)
        {
          unsigned int v153 = 0;
        }
        else
        {
          uint64_t v154 = v151;
          unsigned int v133 = v224;
          if ([v144 count])
          {
            if (!v145)
            {
              uint64_t v287 = v138;
              objc_msgSend(v224, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v287, 1), v227);
              unsigned int v153 = v154;
              goto LABEL_255;
            }
            uint64_t v154 = 2;
          }
          else
          {
            unsigned int v153 = 0;
          }
          int v155 = v154;
          BOOL v156 = [[BWFanOutNode alloc] initWithFanOutCount:v154 mediaType:1986618469];
          BOOL v157 = v156;
          if (v145) {
            int v158 = @"Video Preview/Capture Splitter";
          }
          else {
            int v158 = @"Video Capture Splitter";
          }
          [(BWNode *)v156 setName:v158];
          v242.receiver = (id)v230;
          v242.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v242, sel_addNode_error_, v157, &v282) & 1) == 0
            || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", v138, -[BWNode input](v157, "input"), 0) & 1) == 0)
          {
            goto LABEL_312;
          }
          if (v145)
          {
            id v159 = [(NSArray *)[(BWNode *)v157 outputs] objectAtIndexedSubscript:0];
            [v159 setName:@"Preview"];
            [v197 setObject:v159 forKeyedSubscript:v227];
            uint64_t v145 = 1;
          }
          objc_msgSend(v224, "setObject:forKeyedSubscript:", -[NSArray subarrayWithRange:](-[BWNode outputs](v157, "outputs"), "subarrayWithRange:", v145, (v155 - v145)), v227);
          if (*(unsigned char *)(v230 + 528))
          {
            if (a7 && *(unsigned char *)(a7 + 320))
            {
              if (*(unsigned char *)(a7 + 321)) {
                int v160 = objc_msgSend((id)objc_msgSend(*(id *)(a7 + 216), "irisSinkConfiguration"), "irisMovieCaptureEnabled");
              }
              else {
                int v160 = 0;
              }
              uint64_t v161 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, v160);
              do
              {
                [(BWFanOutNode *)v157 setAllowedAttachedMediaKeys:v161 forOutputIndex:v145];
                uint64_t v145 = (v145 + 1);
              }
              while ((int)v145 < v155);
            }
            else
            {
              do
              {
                [(BWFanOutNode *)v157 setDiscardsAttachedMedia:1 forOutputIndex:v145];
                uint64_t v145 = (v145 + 1);
              }
              while ((int)v145 < v155);
            }
          }
        }
        unsigned int v133 = v224;
      }
LABEL_255:
      if ([v144 count])
      {
        unsigned int objb = v153;
        int v162 = 0;
        if (v137 <= 9 && ((1 << v137) & 0x310) != 0)
        {
          int v162 = (void *)[MEMORY[0x1E4F1CA48] array];
          long long v238 = 0u;
          long long v239 = 0u;
          long long v240 = 0u;
          long long v241 = 0u;
          double v163 = *(void **)(v230 + 56);
          uint64_t v164 = [v163 countByEnumeratingWithState:&v238 objects:v286 count:16];
          if (v164)
          {
            uint64_t v165 = v164;
            uint64_t v166 = *(void *)v239;
            do
            {
              for (uint64_t m = 0; m != v165; ++m)
              {
                if (*(void *)v239 != v166) {
                  objc_enumerationMutation(v163);
                }
                unsigned int v168 = *(void **)(*((void *)&v238 + 1) + 8 * m);
                uint64_t v169 = (void *)BWUnderlyingDeviceTypesForCompositeDeviceType(v137);
                if (objc_msgSend(v169, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", BWUtilitiesUnderlyingDeviceTypeFromPortType(objc_msgSend(v168, "portType"), v137)))&& ((objc_msgSend((id)objc_msgSend(v168, "configuration"), "lightSourceMaskOutputEnabled") & 1) != 0|| objc_msgSend((id)objc_msgSend(v168, "configuration"), "keypointDescriptorDataOutputEnabled")))
                {
                  objc_msgSend(v162, "addObject:", objc_msgSend(v168, "portType"));
                }
              }
              uint64_t v165 = [v163 countByEnumeratingWithState:&v238 objects:v286 count:16];
            }
            while (v165);
          }
          v134 = (void *)v230;
          unsigned int v133 = v224;
          uint64_t v152 = v227;
          if (![v162 count]) {
            goto LABEL_311;
          }
        }
        char v170 = -[BWMetadataSynchronizerNode initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:]([BWMetadataSynchronizerNode alloc], "initWithMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:", [v144 allKeys], 0, 0, v162, 0);
        -[BWNode setName:](v170, "setName:", [NSString stringWithFormat:@"%@ Metadata Synchronizer", objc_msgSend(v134, "name")]);
        v237.receiver = v134;
        v237.super_class = (Class)FigCaptureCameraSourcePipeline;
        if ((objc_msgSendSuper2(&v237, sel_addNode_error_, v170, &v282) & 1) == 0
          || (objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", objc_msgSend((id)objc_msgSend(v133, "objectForKeyedSubscript:", v152), "objectAtIndexedSubscript:", 0), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v170, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0)
        {
          goto LABEL_312;
        }
        long long v235 = 0u;
        long long v236 = 0u;
        long long v233 = 0u;
        long long v234 = 0u;
        uint64_t v171 = [v144 countByEnumeratingWithState:&v233 objects:v285 count:16];
        if (v171)
        {
          uint64_t v172 = v171;
          uint64_t v173 = *(void *)v234;
          int v174 = 1;
LABEL_274:
          uint64_t v175 = 0;
          uint64_t v176 = v174;
          while (1)
          {
            if (*(void *)v234 != v173) {
              objc_enumerationMutation(v144);
            }
            if (!objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", objc_msgSend(v144, "objectForKeyedSubscript:", *(void *)(*((void *)&v233 + 1) + 8 * v175)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v170, "inputs"), "objectAtIndexedSubscript:", v176 + v175), 0))goto LABEL_312; {
            if (v172 == ++v175)
            }
            {
              uint64_t v172 = [v144 countByEnumeratingWithState:&v233 objects:v285 count:16];
              int v174 = v176 + v175;
              if (v172) {
                goto LABEL_274;
              }
              break;
            }
          }
        }
        if (objb == 1)
        {
          uint64_t v284 = [(BWNode *)v170 output];
          uint64_t v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v284 count:1];
          v134 = (void *)v230;
          v178 = v227;
        }
        else
        {
          v179 = [[BWFanOutNode alloc] initWithFanOutCount:objb mediaType:1986618469];
          [(BWNode *)v179 setName:@"Video Capture Splitter"];
          v134 = (void *)v230;
          v232.receiver = (id)v230;
          v232.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v232, sel_addNode_error_, v179, &v282) & 1) == 0) {
            goto LABEL_312;
          }
          v178 = v227;
          if ((objc_msgSend(v228, "connectOutput:toInput:pipelineStage:", -[BWNode output](v170, "output"), -[BWNode input](v179, "input"), 0) & 1) == 0)goto LABEL_312; {
          uint64_t v177 = [(BWNode *)v179 outputs];
          }
        }
        [v133 setObject:v177 forKeyedSubscript:v178];
        if ([a5 objectForKeyedSubscript:v178] && objc_msgSend(a6, "objectForKeyedSubscript:", v178))
        {
          id v180 = (id)v134[53];
          if (!v180)
          {
            id v180 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v134[53] = v180;
          }
          [v180 addObject:v178];
        }
      }
      unsigned int v135 = v220 + 1;
    }
    while (v220 + 1 != (char *)v209);
    uint64_t v181 = [a2 countByEnumeratingWithState:&v243 objects:v289 count:16];
    uint64_t v209 = v181;
    if (v181) {
      continue;
    }
    break;
  }
LABEL_298:
  uint64_t v182 = [v133 count];
  if (v182) {
    uint64_t v182 = [v133 copy];
  }
  v134[22] = v182;
LABEL_313:
  result = v283;
  if (!v283)
  {
    if (v282) {
      return [v282 code];
    }
  }
  return result;
}

- (uint64_t)_insertFunnelOnMetadataOutputsBySourceDeviceType:(void *)a3 connectionConfigurations:(uint64_t)a4 pipelineConfiguration:(void *)a5 graph:(unsigned int)a6 mediaType:(uint64_t)a7 metadataName:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unsigned int v62 = 0;
  id v61 = 0;
  if (![a2 count])
  {
LABEL_45:
    if (v61) {
      return [v61 code];
    }
    return 0;
  }
  if (a4) {
    long long v11 = *(void **)(a4 + 184);
  }
  else {
    long long v11 = 0;
  }
  uint64_t v12 = [v11 sourceDeviceType];
  id v13 = (id)[FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(a3) mutableCopy];
  if (![a1[55] isBravoVariant])
  {
LABEL_36:
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    char v35 = (void *)[a2 allKeys];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          if (([v13 containsObject:v40] & 1) == 0) {
            [a2 setObject:0 forKeyedSubscript:v40];
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v63 count:16];
      }
      while (v37);
    }
    goto LABEL_45;
  }
  unint64_t v14 = [a2 count];
  uint64_t v15 = objc_msgSend((id)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(a3, v12), "count");
  if (v14 < 2 || !v15)
  {
    if (v15)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obja = (id)[a2 allKeys];
      uint64_t v24 = [obja countByEnumeratingWithState:&v52 objects:v64 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v53;
        while (2)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v53 != v26) {
              objc_enumerationMutation(obja);
            }
            uint64_t v28 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            if ([v13 containsObject:v28])
            {
              uint64_t v29 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:a6];
              v51.receiver = a1;
              v51.super_class = (Class)FigCaptureCameraSourcePipeline;
              if ((objc_msgSendSuper2(&v51, sel_addNode_error_, v29, &v61) & 1) == 0
                || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v28), -[BWNode input](v29, "input"), 0) & 1) == 0)
              {
LABEL_49:
                FigDebugAssert3();
                goto LABEL_45;
              }
              objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v29, "outputs"), "objectAtIndexedSubscript:", 0), v28);
              uint64_t v30 = [(NSArray *)[(BWNode *)v29 outputs] objectAtIndexedSubscript:1];
              uint64_t v31 = [NSNumber numberWithInt:v12];
              uint64_t v32 = a2;
              uint64_t v33 = v30;
            }
            else
            {
              uint64_t v34 = [a2 objectForKeyedSubscript:v28];
              objc_msgSend(a2, "setObject:forKeyedSubscript:", v34, objc_msgSend(NSNumber, "numberWithInt:", v12));
              uint64_t v32 = a2;
              uint64_t v33 = 0;
              uint64_t v31 = v28;
            }
            [v32 setObject:v33 forKeyedSubscript:v31];
          }
          uint64_t v25 = [obja countByEnumeratingWithState:&v52 objects:v64 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
      goto LABEL_45;
    }
    goto LABEL_36;
  }
  uint64_t v16 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = (id)[a2 allKeys];
  uint64_t v17 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v57 + 1) + 8 * k);
        if ([v13 containsObject:v21])
        {
          uint64_t v22 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:a6];
          v56.receiver = a1;
          v56.super_class = (Class)FigCaptureCameraSourcePipeline;
          if ((objc_msgSendSuper2(&v56, sel_addNode_error_, v22, &v61) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v21), -[BWNode input](v22, "input"), 0) & 1) == 0)
          {
            goto LABEL_49;
          }
          objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v22, "outputs"), "objectAtIndexedSubscript:", 0), v21);
          objc_msgSend(v16, "addObject:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v22, "outputs"), "objectAtIndexedSubscript:", 1));
        }
        else
        {
          objc_msgSend(v16, "addObject:", objc_msgSend(a2, "objectForKeyedSubscript:", v21));
          [a2 setObject:0 forKeyedSubscript:v21];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v18);
  }
  [a2 setObject:-[FigCaptureCameraSourcePipeline _addFunnelNodeToGraph:inputs:mediaType:name:outErr:]((uint64_t)a1, a5, v16, a6, objc_msgSend(NSString, "stringWithFormat:", @"%@ Metadata Funnel", a7), &v62), objc_msgSend(NSNumber, "numberWithInt:", v12) forKeyedSubscript];
  uint64_t v23 = v62;
  if (!v62) {
    goto LABEL_45;
  }
  FigDebugAssert3();
  return v23;
}

- (uint64_t)_getDeviceOrientationCorrectionEnabledForVideoCaptureConnectionConfigurations:(uint64_t)a1
{
  uint64_t result = 0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      uint64_t result = [a2 count];
      if (result)
      {
        long long v11 = 0u;
        long long v12 = 0u;
        long long v9 = 0u;
        long long v10 = 0u;
        uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (result)
        {
          uint64_t v5 = result;
          uint64_t v6 = *(void *)v10;
          while (2)
          {
            for (uint64_t i = 0; i != v5; ++i)
            {
              if (*(void *)v10 != v6) {
                objc_enumerationMutation(a2);
              }
              long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ([v8 deviceOrientationCorrectionEnabled] & 1) != 0)
              {
                return 1;
              }
            }
            uint64_t v5 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
            uint64_t result = 0;
            if (v5) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_buildDetectedObjectsOutputNetwork:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ((csp_cinematicVideoEnabled(a3) & 1) == 0)
  {
    long long v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    if (a3) {
      long long v9 = *(void **)(a3 + 240);
    }
    else {
      long long v9 = 0;
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ((FigCaptureMetadataObjectConfigurationRequiresObjectDetection(v14) & 1) != 0
            || FigCaptureMetadataObjectConfigurationRequiresEyeReliefStatus(v14))
          {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
    if (a3) {
      uint64_t v15 = *(void *)(a3 + 248);
    }
    else {
      uint64_t v15 = 0;
    }
    [v8 addObjectsFromArray:v15];
    uint64_t v16 = -[FigCaptureCameraSourcePipeline _insertCrossOverAndOverCaptureNodesOnOutputsBySourceDeviceType:connectionConfigurations:pipelineConfiguration:graph:outputNetworkType:numberOfSecondaryFramesToSkip:](a1, a2, v8, a3, a4, 2u, 0);
    if (v16)
    {
      uint64_t v17 = v16;
      FigDebugAssert3();
      return v17;
    }
    a2 = (id)[a2 mutableCopy];
    -[FigCaptureCameraSourcePipeline _rerouteDetectedObjectsOutputsForSourcesWithCinematicFramingEnabled:graph:](a1, a2, a4);
  }
  uint64_t v17 = 0;
  *(void *)(a1 + 376) = [a2 copy];
  return v17;
}

- (uint64_t)_rerouteDetectedObjectsOutputsForSourcesWithCinematicFramingEnabled:(void *)a3 graph:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)[*(id *)(a1 + 136) allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
          if (objc_msgSend(a2, "objectForKeyedSubscript:", v10, v15, v16))
          {
            uint64_t v11 = (void *)[*(id *)(a1 + 136) objectForKeyedSubscript:v10];
            uint64_t PortTypeForUnderlyingDeviceType = BWUtilitiesGetPortTypeForUnderlyingDeviceType([v10 intValue], objc_msgSend((id)objc_msgSend(v11, "detectionMetadataInputsByPortType"), "allKeys"));
            if (objc_msgSend((id)objc_msgSend(v11, "detectionMetadataInputsByPortType"), "objectForKeyedSubscript:", PortTypeForUnderlyingDeviceType))
            {
              if (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v10), objc_msgSend((id)objc_msgSend(v11, "detectionMetadataInputsByPortType"), "objectForKeyedSubscript:", PortTypeForUnderlyingDeviceType), 0))
              {
                if ([v11 detectionMetadataOutput])
                {
                  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(v11, "detectionMetadataOutput"), v10);
                  goto LABEL_12;
                }
                uint64_t v16 = v17;
                LODWORD(v15) = 0;
              }
              else
              {
                uint64_t v16 = v17;
                LODWORD(v15) = 0;
              }
            }
            else
            {
              uint64_t v16 = v17;
              LODWORD(v15) = 0;
            }
            FigDebugAssert3();
          }
LABEL_12:
          ++v9;
        }
        while (v7 != v9);
        uint64_t v13 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v7 = v13;
      }
      while (v13);
    }
  }
  return 0;
}

- (uint64_t)setMasterClock:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v3 = *(void **)(result + 112);
    uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setMasterClock:a2];
        }
        while (v4 != v6);
        uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)nextVideoCaptureOutputForSourceDeviceType:(char *)a3 sharesBuffersWithOtherConnections:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    unint64_t v6 = *(int *)(result + 192 + 4 * (int)a2);
    *(_DWORD *)(result + 192 + 4 * (int)a2) = v6 + 1;
    unint64_t v7 = 0x1E4F28000uLL;
    uint64_t result = objc_msgSend(*(id *)(result + 176), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2));
    if (result)
    {
      if (objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2)), "count") <= v6)return 0; {
      if (!a3)
      }
        return objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", objc_msgSend(*(id *)(v7 + 3792), "numberWithInt:", a2)), "objectAtIndexedSubscript:", v6);
      long long v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithInt:", a2));
      if (*(_DWORD *)(v5 + 44) != a2) {
        objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithInt:"));
      }
      switch(a2)
      {
        case 4:
          long long v9 = &unk_1EFB033C8;
          break;
        case 9:
          long long v9 = &unk_1EFB033F8;
          break;
        case 8:
          long long v9 = &unk_1EFB033E0;
          break;
        default:
LABEL_14:
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v18 = a3;
            unint64_t v19 = v6;
            unint64_t v12 = 0;
            uint64_t v13 = *(void *)v21;
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v21 != v13) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
                unint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", v15, v18, v19), "count")+ v12;
                unint64_t v12 = v16
                    + (int)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 184), "objectForKeyedSubscript:", v15), "intValue");
                if (v12 > 1)
                {
                  char v17 = 1;
                  goto LABEL_24;
                }
              }
              uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
              if (v11) {
                continue;
              }
              break;
            }
            char v17 = 0;
LABEL_24:
            a3 = v18;
            unint64_t v6 = v19;
            unint64_t v7 = 0x1E4F28000;
          }
          else
          {
            char v17 = 0;
          }
          *a3 = v17;
          return objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "objectForKeyedSubscript:", objc_msgSend(*(id *)(v7 + 3792), "numberWithInt:", a2)), "objectAtIndexedSubscript:", v6);
      }
      [v8 addObjectsFromArray:v9];
      goto LABEL_14;
    }
  }
  return result;
}

- (uint64_t)eyeReliefStatusOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 392);
    uint64_t v3 = [NSNumber numberWithInt:a2];
    return [v2 objectForKeyedSubscript:v3];
  }
  return result;
}

- (uint64_t)detectedObjectsOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 376);
    uint64_t v3 = [NSNumber numberWithInt:a2];
    return [v2 objectForKeyedSubscript:v3];
  }
  return result;
}

- (BOOL)videoHDRImageStatisticsEnabled
{
  if (result) {
    return *(unsigned char *)(result + 497) != 0;
  }
  return result;
}

- (BOOL)trueVideoCaptureEnabled
{
  if (result) {
    return *(unsigned char *)(result + 552) != 0;
  }
  return result;
}

- (double)trueVideoCaptureAdditionalZoomFactor
{
  if (a1) {
    return dbl_1A5F0C410[*(_DWORD *)(a1 + 48) == 2];
  }
  else {
    return 0.0;
  }
}

- (uint64_t)trackedFacesOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 400);
    uint64_t v3 = [NSNumber numberWithInt:a2];
    return [v2 objectForKeyedSubscript:v3];
  }
  return result;
}

- (uint64_t)setCinematicVideoFocusDetectionsProvider:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 96) setCinematicVideoFocusDetectionsProvider:a2];
  }
  return result;
}

- (uint64_t)nextVideoCaptureOutputForSourceDeviceType:(uint64_t)result
{
  if (result) {
    return -[FigCaptureCameraSourcePipeline nextVideoCaptureOutputForSourceDeviceType:sharesBuffersWithOtherConnections:](result, a2, 0);
  }
  return result;
}

- (uint64_t)isLightSourceMaskAndKeypointDescriptorDataOnVideoCaptureOutputsEnabledForSourceDeviceType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 424);
    uint64_t v3 = [NSNumber numberWithInt:a2];
    return [v2 containsObject:v3];
  }
  return result;
}

- (BOOL)hardwareDepthFilteringEnabled
{
  if (result) {
    return *(unsigned char *)(result + 496) != 0;
  }
  return result;
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
  captureSource = self->_captureSource;
  if (captureSource) {
    CFRelease(captureSource);
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureCameraSourcePipeline;
  [(FigCaptureSourcePipeline *)&v4 dealloc];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p> captureDevice:%@ captureSource:%@", NSStringFromClass(v4), self, self->_captureDevice, self->_captureSource];
}

- (uint64_t)videoOutputColorInfo
{
  if (result)
  {
    v1 = *(void **)(result + 64);
    uint64_t v2 = [v1 videoCaptureOutput];
    return [v1 colorInfoForOutput:v2];
  }
  return result;
}

- (uint64_t)secureDetectedObjectsOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 384);
    uint64_t v3 = [NSNumber numberWithInt:a2];
    return [v2 objectForKeyedSubscript:v3];
  }
  return result;
}

- (uint64_t)visionDataOutputForSourceDeviceType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 408);
    uint64_t v3 = [NSNumber numberWithInt:a2];
    return [v2 objectForKeyedSubscript:v3];
  }
  return result;
}

- (uint64_t)depthOutput
{
  if (result) {
    return *(void *)(result + 416);
  }
  return result;
}

- (uint64_t)semanticMasksOutputsBySourceDeviceType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void **)(result + 432);
    uint64_t v3 = [NSNumber numberWithInt:a2];
    return [v2 objectForKeyedSubscript:v3];
  }
  return result;
}

- (uint64_t)preferredPreviewDimensions
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 64) configuration];
    return [v1 preferredPreviewDimensions];
  }
  return result;
}

- (uint64_t)previewOutputTransformForSourceDeviceType:(uint64_t)a1
{
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2)), "count"))
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2)), "objectAtIndexedSubscript:", 0);
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        while (1)
        {
          unint64_t v6 = (void *)[v5 formatRequirements];
          if ([v6 width])
          {
            if ([v6 height]) {
              break;
            }
          }
          uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "node"), "input"), "connection"), "output");
          if (!v5) {
            goto LABEL_8;
          }
        }
      }
      else
      {
LABEL_8:
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "previewOutput"), "formatRequirements");
    }
    [v6 width];
    [v6 height];
  }
  return 0;
}

- (uint64_t)firmwareStillImageDimensionsAfterOverscanCropping
{
  if (result) {
    return [*(id *)(result + 64) firmwareStillImageDimensionsAfterOverscanCropping];
  }
  return result;
}

- (uint64_t)stillImageOutputVideoFormat
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 64) stillImageOutput];
    return [v1 videoFormat];
  }
  return result;
}

- (uint64_t)nextPreviewOutputForSourceDeviceType:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  unint64_t v4 = *(int *)(a1 + 276 + 4 * (int)a2);
  *(_DWORD *)(a1 + 276 + 4 * (int)a2) = v4 + 1;
  if (!objc_msgSend(*(id *)(a1 + 152), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2))|| objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2)), "count") <= v4)
  {
    FigDebugAssert3();
    return 0;
  }
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 152), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2));
  return [v5 objectAtIndexedSubscript:v4];
}

- (uint64_t)getSmartStyle
{
  if (result)
  {
    v1 = objc_msgSend((id)objc_msgSend(*(id *)(result + 536), "allValues"), "firstObject");
    return [v1 smartStyle];
  }
  return result;
}

- (uint64_t)semanticStyleSceneObserver
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 536) allValues];
    return [v1 firstObject];
  }
  return result;
}

- (uint64_t)logCameraStreamingInformationToAggd:(uint64_t)a3 applicationID:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    unint64_t v6 = +[BWAggdDataReporter sharedInstance];
    if (a2 >= 1) {
      [(BWAggdDataReporter *)v6 reportCameraStreamingTimeInMilliseconds:llroundf((float)(FigHostTimeToNanoseconds() / 1000) / 1000.0) deviceType:*(unsigned int *)(v5 + 44) devicePosition:*(unsigned int *)(v5 + 48)];
    }
    if (*(_DWORD *)(v5 + 44) == 6)
    {
      unint64_t v7 = *(void **)(v5 + 88);
      unint64_t v8 = [v7 infraredProjectorUptimeInUsForLowPowerSparse];
      if (v8 >= 0x3E8) {
        [(BWAggdDataReporter *)v6 reportPearlInfraredProjectorUptime:v8 / 0x3E8 current:1 pattern:0 applicationID:a3];
      }
      unint64_t v9 = [v7 infraredProjectorUptimeInUsForHighPowerSparse];
      if (v9 >= 0x3E8) {
        [(BWAggdDataReporter *)v6 reportPearlInfraredProjectorUptime:v9 / 0x3E8 current:2 pattern:0 applicationID:a3];
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = *(void **)(v5 + 56);
    uint64_t result = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (result)
    {
      uint64_t v11 = result;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
          uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "captureStream"), "autoFocusPositionSensorMode");
          if (v15) {
            -[BWAggdDataReporter reportAutoFocusPositionSensorMode:portType:](v6, "reportAutoFocusPositionSensorMode:portType:", v15, [v14 portType]);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t result = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)startIncrementalPrefetchingOfSourcePoolsIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    v1 = *(void **)(result + 56);
    uint64_t result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v6;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          [*(id *)(*((void *)&v5 + 1) + 8 * v4++) startIncrementalPrefetchingOfSourcePoolsIfNecessary];
        }
        while (v2 != v4);
        uint64_t result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        uint64_t v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)prepareForStillImageCaptureWithStillImageOutputRetainedBufferCountOverride:(unsigned int)a3 infraRedStillImageOutputRetainedBufferCountOverride:(uint64_t)a4 clientBracketCount:(uint64_t)a5 enableSushiRawAttachmentOption:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v9 = *(void **)(a1 + 56);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      uint64_t v13 = *MEMORY[0x1E4F52E00];
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v15, "portType"), "isEqualToString:", v13)) {
            uint64_t v16 = a3;
          }
          else {
            uint64_t v16 = a2;
          }
          uint64_t v17 = [v15 prepareForStillImageCaptureWithFirmwareStillImageOutputRetainedBufferCountOverride:v16 clientBracketCount:a4 enableSushiRawAttachmentOption:a5];
          if (v17)
          {
            uint64_t v18 = v17;
            FigDebugAssert3();
            return v18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  return 0;
}

- (uint64_t)newConfigurationRequiresStreamRestart:(unsigned char *)a3 tnrConfigurationChanged:(void *)a4 newFormatIndexByPortTypeOut:
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    long long v8 = *(void **)(a2 + 184);
    unint64_t v9 = *(void **)(a2 + 208);
    v103 = *(void **)(a2 + 216);
    int v101 = *(_DWORD *)(a2 + 8);
    BOOL v10 = *(unsigned char *)(a2 + 143) != 0;
  }
  else
  {
    int v101 = 0;
    v103 = 0;
    long long v8 = 0;
    unint64_t v9 = 0;
    BOOL v10 = 0;
  }
  if (!objc_msgSend((id)objc_msgSend((id)a1, "sourceID"), "isEqual:", objc_msgSend(v8, "sourceID"))
    || (int)FigCapturePlatformIdentifier() < 4
    || [v8 sourceDeviceType] == 16
    || [v8 sourceDeviceType] == 15
    || [v8 sourceDeviceType] == 10 && (int)FigCapturePlatformIdentifier() < 10)
  {
    return 1;
  }
  id v110 = 0;
  uint64_t v13 = [v8 source];
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v15 + 48);
  if (v16)
  {
    int v109 = v16(v13, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], &v110);
    if (v109)
    {
      int v17 = 0;
    }
    else
    {
      int v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", @"DepthDataDeliveryConfigurations"), "objectForKeyedSubscript:", @"FastModeSwitchingSupported"), "BOOLValue");
    }
  }
  else
  {
    int v17 = 0;
    int v109 = -12782;
  }
  if ([*(id *)(a1 + 440) depthDataDeliveryEnabled])
  {
    if (!v17) {
      return 1;
    }
  }
  else if ((([v8 depthDataDeliveryEnabled] ^ 1 | v17) & 1) == 0)
  {
    return 1;
  }
  char v99 = [v8 bravoShiftMitigationEnabled];
  char v18 = [v8 cinematicFramingEnabled];
  char v19 = [v8 deskCamEnabled];
  int v20 = 1;
  if ((v18 & 1) == 0 && (v19 & 1) == 0) {
    int v20 = [v8 manualCinematicFramingEnabled];
  }
  long long v21 = (void *)[v8 requiredFormat];
  if (a2)
  {
    long long v22 = *(void **)(a2 + 200);
    uint64_t v23 = *(void *)(a2 + 224);
  }
  else
  {
    long long v22 = 0;
    uint64_t v23 = 0;
  }
  unint64_t v24 = csp_videoCaptureDimensionsFromConnectionConfigurations(v21, v103, (uint64_t)v9, v22, v23, v20);
  int shouldUseFESCompanionIndex = csp_shouldUseFESCompanionIndex(v8, v9, v24);
  int shouldUseDepthCompanionIndex = csp_shouldUseDepthCompanionIndex(v8, v9, v24);
  uint64_t v86 = a3;
  if (a2) {
    BOOL v25 = *(unsigned char *)(a2 + 24) != 0;
  }
  else {
    BOOL v25 = 0;
  }
  int shouldUseActionCameraCompanionIndex = csp_shouldUseActionCameraCompanionIndex(v8, (uint64_t)v9, v25);
  shouldCaptureStillsFromVideoStreauint64_t m = csp_shouldCaptureStillsFromVideoStream(v8, (void *)[v8 requiredFormat], shouldUseFESCompanionIndex, v103 != 0);
  if (v103) {
    int v27 = shouldCaptureStillsFromVideoStream;
  }
  else {
    int v27 = 1;
  }
  if ((v10 | v27 ^ 1) == 1)
  {
    if (v10) {
      int v28 = 4;
    }
    else {
      int v28 = 1;
    }
    int v92 = v28;
    if (a2) {
      int v104 = *(unsigned char *)(a2 + 144) != 0;
    }
    else {
      int v104 = 0;
    }
  }
  else
  {
    int v104 = 0;
    int v92 = 0;
  }
  int v29 = objc_msgSend((id)objc_msgSend(v103, "irisSinkConfiguration"), "bravoConstituentPhotoDeliveryEnabled");
  if (v29 != [*(id *)(a1 + 440) bravoConstituentPhotoDeliveryEnabled]) {
    return 1;
  }
  int v30 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 440), "captureStreams"), "count");
  int v31 = [*(id *)(a1 + 440) isBravoVariant];
  unsigned int v85 = a4;
  if (a2)
  {
    BOOL v32 = *(unsigned char *)(a2 + 155) != 0;
    BOOL v33 = *(unsigned char *)(a2 + 156) != 0;
  }
  else
  {
    BOOL v32 = 0;
    BOOL v33 = 0;
  }
  uint64_t v11 = 1;
  if ((v31 & (v32 || v10 && v33)) != 0) {
    int v34 = 2;
  }
  else {
    int v34 = 1;
  }
  if (v29) {
    int v35 = v30;
  }
  else {
    int v35 = v34;
  }
  uint64_t v36 = a1;
  if ([*(id *)(a1 + 440) numberOfActiveTimeMachines] == v35)
  {
    uint64_t v37 = a2 ? *(void **)(a2 + 216) : 0;
    int v38 = objc_msgSend((id)objc_msgSend(v37, "irisSinkConfiguration"), "ultraHighResolutionZeroShutterLagSupportEnabled");
    if (v38 == [*(id *)(a1 + 440) ultraHighResolutionZeroShutterLagSupportEnabled])
    {
      if (a2) {
        int v93 = *(unsigned char *)(a2 + 144) != 0;
      }
      else {
        int v93 = 0;
      }
      if (objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "isVideoHDRFusionSupported")) {
        BWColorSpaceIsHDR([v8 colorSpace]);
      }
      if (a2) {
        float v39 = *(float *)(a2 + 148);
      }
      else {
        float v39 = 0.0;
      }
      if ([*(id *)(a1 + 440) overCaptureEnabled])
      {
        if (v39 == 0.0 && (!a2 || !*(unsigned char *)(a2 + 152))) {
          return v11;
        }
      }
      else
      {
        int v40 = [*(id *)(a1 + 440) allocateResourcesCompatibleWithOverCapture];
        if (v39 == 0.0)
        {
          if (a2)
          {
            if ((v40 ^ (*(unsigned char *)(a2 + 152) != 0))) {
              return v11;
            }
          }
          else if (v40)
          {
            return v11;
          }
        }
        else if ((v40 & 1) == 0)
        {
          return v11;
        }
      }
      if ([*(id *)(a1 + 440) digitalFlashEnabled]) {
        int v41 = 1;
      }
      else {
        int v41 = [*(id *)(a1 + 440) digitalFlashMetadataEnabled];
      }
      if (a2 && *(unsigned char *)(a2 + 153))
      {
        if ((v41 & 1) == 0) {
          return v11;
        }
      }
      else if (v41 != objc_msgSend((id)objc_msgSend(v103, "irisSinkConfiguration"), "digitalFlashCaptureEnabled"))
      {
        return v11;
      }
      int v42 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "configuration"), "faceTrackingEnabled");
      if (a2)
      {
        if ((v42 ^ (*(unsigned char *)(a2 + 118) != 0))) {
          return v11;
        }
        int v43 = [*(id *)(a1 + 440) timeOfFlightProjectorMode];
        uint64_t v44 = *(void **)(a2 + 256);
      }
      else
      {
        if (v42) {
          return v11;
        }
        uint64_t v36 = a1;
        int v43 = [*(id *)(a1 + 440) timeOfFlightProjectorMode];
        uint64_t v44 = 0;
      }
      if (v43 != csp_projectorModeFromPointCloudDataConnectionConfigurations(v44)) {
        return v11;
      }
      int v45 = [*(id *)(v36 + 440) temporalNoiseReductionBand0Disabled];
      int v46 = objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "temporalNoiseReductionBand0Disabled");
      uint64_t v47 = v36;
      int v48 = v46;
      int v49 = [*(id *)(v47 + 440) temporalNoiseReductionRawEnabled];
      int v50 = v49 ^ objc_msgSend((id)objc_msgSend(v8, "requiredFormat"), "temporalNoiseReductionRawEnabled");
      int v51 = v45 ^ v48;
      if (a2)
      {
        int v96 = *(unsigned char *)(a2 + 146) != 0;
        if (*(unsigned char *)(a2 + 146)) {
          int v52 = v27;
        }
        else {
          int v52 = 0;
        }
        if (v52 == 1) {
          int v96 = *(unsigned char *)(a2 + 154) != 0;
        }
      }
      else
      {
        int v96 = 0;
      }
      long long v53 = v86;
      int v54 = v50 | v51;
      int v88 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id obj = *(id *)(a1 + 56);
      uint64_t v95 = [obj countByEnumeratingWithState:&v105 objects:v111 count:16];
      if (v95)
      {
        int v89 = v54;
        uint64_t v94 = *(void *)v106;
        uint64_t v87 = *MEMORY[0x1E4F55310];
        char v55 = v104;
        if (v92) {
          char v55 = 1;
        }
        char v90 = v55;
LABEL_91:
        uint64_t v56 = 0;
        while (1)
        {
          if (*(void *)v106 != v94) {
            objc_enumerationMutation(obj);
          }
          long long v57 = *(void **)(*((void *)&v105 + 1) + 8 * v56);
          uint64_t v58 = FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType([v8 source], objc_msgSend(v8, "requiredFormat"), objc_msgSend(v57, "portType"), &v109);
          if (v109) {
            break;
          }
          long long v59 = (void *)v58;
          if (!v58) {
            break;
          }
          long long v60 = objc_msgSend((id)objc_msgSend(v57, "captureStream"), "supportedFormats");
          if (a2)
          {
            int shouldUseFullBinSIFRCompanionIndex = csp_shouldUseFullBinSIFRCompanionIndex(v59, v60, v103, v104, *(unsigned __int8 *)(a2 + 154));
            BOOL v62 = *(unsigned char *)(a2 + 159) != 0;
            BOOL v63 = *(unsigned char *)(a2 + 346) != 0;
          }
          else
          {
            int shouldUseFullBinSIFRCompanionIndex = csp_shouldUseFullBinSIFRCompanionIndex(v59, v60, v103, v104, 0);
            BOOL v62 = 0;
            BOOL v63 = 0;
          }
          char v64 = [v8 sensorHDREnabled];
          unsigned __int8 v65 = [v8 highlightRecoveryEnabled];
          [v8 geometricDistortionCorrectionEnabled];
          if (a2) {
            float v66 = *(float *)(a2 + 32);
          }
          else {
            float v66 = 0.0;
          }
          uint64_t v67 = csp_formatIndex(v59, shouldUseFESCompanionIndex, shouldUseDepthCompanionIndex, 0, shouldUseActionCameraCompanionIndex, shouldUseFullBinSIFRCompanionIndex, v62, v63, v99, v64, v65, v66 > 0.0, 0, 0, 0, 0, 0, 0);
          if (objc_msgSend((id)objc_msgSend(v57, "captureStream"), "isNondisruptiveFastSwitchingSupported")&& objc_msgSend(v59, "isFastSwitchingConfigurationRequired")&& objc_msgSend((id)objc_msgSend(v57, "configuration"), "fastSwitchingNondisruptiveFormatIndices"))
          {
            if (v67 != objc_msgSend((id)objc_msgSend(v57, "configuration"), "formatIndex"))
            {
              int v68 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "captureStream"), "supportedFormats"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend(v57, "configuration"), "formatIndex"));
              uint64_t v69 = (void *)[v68 objectForKeyedSubscript:v87];
              if (!objc_msgSend(v69, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v67)))return 1; {
              BOOL v70 = csp_formatUsesFES(v68);
              }
              if (v70 != csp_formatUsesFES(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "captureStream"), "supportedFormats"), "objectAtIndexedSubscript:", (int)v67)))return 1; {
              int v71 = v89;
              }
              if ((v89 & 1) == 0) {
                int v71 = 1;
              }
              int v89 = v71;
              objc_msgSend(v88, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v67), objc_msgSend(v57, "portType"));
            }
          }
          else
          {
            objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "captureStream"), "maximumSupportedFrameRate");
            float v73 = v72;
            [v8 maxFrameRateClientOverride];
            if (v73 != v74
              || v67 != objc_msgSend((id)objc_msgSend(v57, "configuration"), "formatIndex"))
            {
              return 1;
            }
          }

          if (v101 != objc_msgSend((id)objc_msgSend(v57, "configuration"), "motionAttachmentsSource")
            || v96 != objc_msgSend((id)objc_msgSend(v57, "configuration"), "sensorRawStillImageOutputEnabled"))
          {
            return 1;
          }
          if (objc_msgSend((id)objc_msgSend(v57, "configuration"), "stillImageOutputEnabled")
            && (objc_msgSend((id)objc_msgSend(v57, "configuration"), "usesFirmwareStillImageOutput") & 1) != 0
            || objc_msgSend((id)objc_msgSend(v57, "configuration"), "forceFirmwareStillImageOutputEnabled"))
          {
            if (v92 != objc_msgSend((id)objc_msgSend(v57, "configuration"), "firmwareTimeMachineBufferCapacity"))return 1; {
            uint64_t v11 = 1;
            }
            if (v104 != objc_msgSend((id)objc_msgSend(v57, "configuration"), "firmwareTimeMachineSIFREnabled"))return v11; {
          }
            }
          else
          {
            if (v90) {
              return 1;
            }
            LODWORD(v11) = 0;
          }
          if (objc_msgSend((id)objc_msgSend(v57, "configuration"), "videoHDRFusionEnabled")) {
            return 1;
          }
          int v75 = v11
              ? objc_msgSend((id)objc_msgSend(v57, "configuration"), "maximumNumberOfBracketedSIFRFrames")
              : 0;
          if (v75 != v93 || (objc_msgSend((id)objc_msgSend(v57, "captureStream"), "suspended") & 1) != 0) {
            return 1;
          }
          int v76 = objc_msgSend((id)objc_msgSend(v57, "configuration"), "stillImageLocalHistogramClippingDataMetadataEnabled");
          if (a2)
          {
            if ((v76 ^ (*(unsigned char *)(a2 + 140) != 0))) {
              return 1;
            }
          }
          else if (v76)
          {
            return 1;
          }
          int v77 = objc_msgSend((id)objc_msgSend(v57, "configuration"), "ltmThumbnailMetadataEnabledForStreaming");
          if (a2)
          {
            if ((v77 ^ (*(unsigned char *)(a2 + 272) != 0))) {
              return 1;
            }
          }
          else if (v77)
          {
            return 1;
          }
          if (csp_gdcExpandsImageDimensions([v8 source]))
          {
            int v78 = objc_msgSend((id)objc_msgSend(v57, "configuration"), "geometricDistortionCorrectionOnPreviewOutputEnabled");
            if (a2)
            {
              if ((v78 ^ (*(unsigned char *)(a2 + 138) != 0))) {
                return 1;
              }
            }
            else if (v78)
            {
              return 1;
            }
            int v79 = objc_msgSend((id)objc_msgSend(v57, "configuration"), "geometricDistortionCorrectionOnVideoCaptureOutputEnabled");
            if (a2)
            {
              if ((v79 ^ (*(unsigned char *)(a2 + 137) != 0))) {
                return 1;
              }
            }
            else if (v79)
            {
              return 1;
            }
            int v80 = objc_msgSend((id)objc_msgSend(v57, "configuration"), "geometricDistortionCorrectionOnStillImageOutputEnabled");
            if (a2)
            {
              if ((v80 ^ (*(unsigned char *)(a2 + 136) != 0))) {
                return 1;
              }
            }
            else if (v80)
            {
              return 1;
            }
          }
          if (objc_msgSend((id)objc_msgSend(v57, "configuration"), "secureMetadataOutputConfiguration")) {
            return 1;
          }
          if (v95 == ++v56)
          {
            uint64_t v81 = [obj countByEnumeratingWithState:&v105 objects:v111 count:16];
            uint64_t v95 = v81;
            if (!v81)
            {
              LOBYTE(v54) = v89 & 1;
              long long v53 = v86;
              goto LABEL_155;
            }
            goto LABEL_91;
          }
        }
        FigDebugAssert3();
        return 1;
      }
LABEL_155:
      if (!v53)
      {
        uint64_t v84 = v4;
        LODWORD(v83) = 0;
        FigDebugAssert3();
      }
      *long long v53 = v54;
      uint64_t v11 = 0;
      if (objc_msgSend(v88, "count", v83, v84)) {
        char v82 = v88;
      }
      else {
        char v82 = 0;
      }
      *unsigned int v85 = v82;
    }
  }
  return v11;
}

- (void)nondisruptiveSwitchingFormatIndicesByPortTypeForConfiguration:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v40 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (a2) {
    uint64_t v4 = *(void **)(a2 + 184);
  }
  else {
    uint64_t v4 = 0;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = *(id *)(a1 + 56);
  uint64_t v38 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v38)
  {
    uint64_t v35 = *(void *)v50;
    uint64_t v5 = *MEMORY[0x1E4F552D8];
    uint64_t v42 = *MEMORY[0x1E4F552D0];
    long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v34 = *MEMORY[0x1E4F1DB28];
    uint64_t v36 = v4;
    uint64_t v37 = a2;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(obj);
        }
        long long v7 = *(void **)(*((void *)&v49 + 1) + 8 * v6);
        int v8 = objc_msgSend((id)objc_msgSend(v7, "configuration"), "formatIndex");
        int v41 = v7;
        unint64_t v9 = objc_msgSend((id)objc_msgSend(v7, "captureStream"), "supportedFormats");
        uint64_t v39 = v6;
        if (a2 && *(unsigned char *)(a2 + 142)) {
          int v10 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 216), "irisSinkConfiguration"), "ultraHighResolutionZeroShutterLagSupportEnabled");
        }
        else {
          int v10 = 0;
        }
        uint64_t v11 = csp_activeStreamingNondisruptiveSwitchingFormatIndices(v8, v9, objc_msgSend((id)objc_msgSend(v4, "requiredFormat"), "configureForNonDisruptiveFullBinSIFRSwitching"), v10);
        long long v47 = v34;
        long long v48 = v33;
        uint64_t v12 = (void *)[v9 objectAtIndexedSubscript:v8];
        int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
        double v14 = *(double *)&v48;
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v5), "BOOLValue")) {
          int v15 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v42), "intValue");
        }
        else {
          int v15 = 0;
        }
        int v16 = objc_msgSend((id)objc_msgSend(v4, "requiredFormat"), "sifrBinningFactorOverrideForNondisruptiveSwitching");
        if (v16 <= 0 || v15 <= 0) {
          int v18 = v15;
        }
        else {
          int v18 = v16;
        }
        BOOL v19 = csp_formatUsesFES(v12);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v20 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v44;
          if (CGRectIfPresent) {
            double v23 = (double)(int)v14;
          }
          else {
            double v23 = 0.0;
          }
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v44 != v22) {
                objc_enumerationMutation(v11);
              }
              BOOL v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              uint64_t v26 = objc_msgSend(v9, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
              int v27 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v5), "BOOLValue");
              if (v27) {
                int v27 = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", v42), "intValue");
              }
              if (v18 == v27 && v19 == csp_formatUsesFES(v26))
              {
                int v29 = FigCFDictionaryGetCGRectIfPresent();
                double v28 = *(double *)&v48;
                if (v29) {
                  BOOL v30 = *(double *)&v48 == v23;
                }
                else {
                  BOOL v30 = 0;
                }
                if (v30) {
                  objc_msgSend(v40, "setObject:forKeyedSubscript:", v25, objc_msgSend(v41, "portType", *(double *)&v48));
                }
              }
            }
            uint64_t v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16, v28);
          }
          while (v21);
        }
        uint64_t v6 = v39 + 1;
        uint64_t v4 = v36;
        a2 = v37;
      }
      while (v39 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v38);
  }
  return v40;
}

- (uint64_t)setKeepISPStreamingWhenStopping:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v3 = *(void **)(result + 56);
    uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setKeepISPStreamingWhenStopping:a2];
        }
        while (v4 != v6);
        uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)setDisableTemporalNoiseReductionWhenStopping:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 440) setDisableTemporalNoiseReductionWhenStopping:a2];
  }
  return result;
}

- (uint64_t)setEmitsFramesWhileStopping:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = *(void **)(result + 56);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) setEmitsFramesWhileStopping:a2];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    return [*(id *)(v3 + 120) setEmitsUnsynchronizedFramesWhileStopping:a2];
  }
  return result;
}

- (uint64_t)setCinematicFramingControlsWhileRunning:(float)a3 panningAngleX:(float)a4 panningAngleY:(float)a5 videoZoomFactor:(double)a6 manualFramingDefaultZoomFactor:
{
  unint64_t v38 = __PAIR64__(LODWORD(a4), LODWORD(a3));
  if (!result) {
    return result;
  }
  int v7 = a2;
  uint64_t v8 = result;
  [*(id *)(result + 440) setCinematicFramingEnabled:a2];
  uint64_t result = [*(id *)(v8 + 456) isCinematicFramingProvidedBySource];
  if (result) {
    return result;
  }
  [*(id *)(v8 + 440) setManualCinematicFramingEnabled:v7 ^ 1u];
  objc_msgSend((id)objc_msgSend(*(id *)(v8 + 440), "manualCinematicFramingDelegate"), "setCinematicFramingControlsSuspended:", 1);
  uint64_t v9 = *(void *)(v8 + 448);
  *(float *)&double v10 = a5;
  uint64_t v11 = [NSNumber numberWithFloat:v10];
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void (**)(uint64_t, __CFString *, uint64_t))(v13 + 56);
  if (v14) {
    v14(v9, @"VideoZoomFactor", v11);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(v8 + 440), "manualCinematicFramingDelegate", v38), "setCinematicFramingControlsSuspended:", 0);
  uint64_t CenterStageFramingMode = csp_getCenterStageFramingMode(*(void *)(v8 + 448));
  objc_msgSend((id)objc_msgSend(*(id *)(v8 + 440), "subjectSelectionDelegate"), "didChangeCenterStageFramingMode:", CenterStageFramingMode);
  char CinematicFramingFieldOfViewRestrictedToWide = csp_getCinematicFramingFieldOfViewRestrictedToWide(*(void *)(v8 + 448));
  csp_getCenterStageRectOfInterest(*(void *)(v8 + 448));
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  id v25 = +[FigCaptureCameraParameters cinematicFramingVirtualCameraConfigurationForPortType:sensorIDString:](FigCaptureCameraParameters, "cinematicFramingVirtualCameraConfigurationForPortType:sensorIDString:", objc_msgSend((id)objc_msgSend(*(id *)(v8 + 440), "captureStream"), "portType"), objc_msgSend((id)objc_msgSend(*(id *)(v8 + 440), "captureStream"), "sensorIDString"));
  uint64_t v26 = (void *)[v25 objectForKeyedSubscript:@"DefaultVirtualCameraRotationAngleX"];
  int v27 = (void *)[v25 objectForKeyedSubscript:@"DefaultVirtualCameraRotationAngleY"];
  double v28 = (void *)[v25 objectForKeyedSubscript:@"DefaultVirtualCameraRotationAngleZ"];
  int v29 = 0;
  int v30 = 0;
  if (v26)
  {
    [v26 floatValue];
    int v30 = v31;
  }
  if (v27)
  {
    [v27 floatValue];
    int v29 = v32;
  }
  if (!v28)
  {
    int v34 = 0;
    if (!v25) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  [v28 floatValue];
  int v34 = v33;
  if (v25)
  {
LABEL_14:
    objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", @"ManualFramingDefaultZoomFactor"), "floatValue");
    a6 = v35;
  }
LABEL_15:
  if (v7)
  {
    char v58 = 0;
    int v57 = 0;
    uint64_t v36 = (void *)[*(id *)(v8 + 440) manualCinematicFramingDelegate];
    v56[0] = v7;
    v56[1] = 1;
    v56[2] = CinematicFramingFieldOfViewRestrictedToWide;
    uint64_t v59 = v18;
    uint64_t v60 = v20;
    uint64_t v61 = v22;
    uint64_t v62 = v24;
    int v63 = CenterStageFramingMode;
    float v64 = a5;
    uint64_t v65 = v39;
    double v66 = a6;
    int v67 = v30;
    int v68 = v29;
    int v69 = v34;
    int v70 = 0;
    uint64_t v37 = v56;
  }
  else
  {
    char v43 = 0;
    int v42 = 0;
    uint64_t v36 = (void *)[*(id *)(v8 + 440) centerStageDelegate];
    v41[0] = 0;
    v41[1] = 1;
    v41[2] = CinematicFramingFieldOfViewRestrictedToWide;
    uint64_t v44 = v18;
    uint64_t v45 = v20;
    uint64_t v46 = v22;
    uint64_t v47 = v24;
    int v48 = CenterStageFramingMode;
    float v49 = a5;
    uint64_t v50 = v39;
    double v51 = a6;
    int v52 = v30;
    int v53 = v29;
    int v54 = v34;
    int v55 = 0;
    uint64_t v37 = v41;
  }
  return [v36 setCinematicFramingControls:v37];
}

- (uint64_t)setStreamsSuspendedBySourceDeviceType:(uint64_t)result
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = *(id *)(result + 56);
    uint64_t result = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    uint64_t v26 = result;
    if (result)
    {
      uint64_t v24 = *MEMORY[0x1E4F52DD8];
      uint64_t v25 = *(void *)v32;
      uint64_t v20 = *MEMORY[0x1E4F52DF0];
      uint64_t v22 = v3;
      uint64_t v23 = *MEMORY[0x1E4F52DE8];
      uint64_t v18 = *MEMORY[0x1E4F52E10];
      uint64_t v19 = *MEMORY[0x1E4F52DF8];
      uint64_t v17 = *MEMORY[0x1E4F52E00];
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v31 + 1) + 8 * v4);
          uint64_t v6 = objc_msgSend(v5, "portType", v17);
          int v7 = &unk_1EFB03410;
          if (([v6 isEqualToString:v24] & 1) != 0
            || (int v7 = &unk_1EFB03428, ([v6 isEqualToString:v20] & 1) != 0)
            || (int v7 = &unk_1EFB03440, ([v6 isEqualToString:v23] & 1) != 0)
            || (int v7 = &unk_1EFB03458, ([v6 isEqualToString:v19] & 1) != 0)
            || (int v7 = &unk_1EFB03470, ([v6 isEqualToString:v18] & 1) != 0)
            || (int v7 = &unk_1EFB03488, [v6 isEqualToString:v17]))
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v28;
              int v11 = 1;
              do
              {
                for (uint64_t i = 0; i != v9; ++i)
                {
                  if (*(void *)v28 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  uint64_t v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) intValue];
                  if (objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v13)))
                  {
                    v11 &= objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v13)), "BOOLValue");
                  }
                }
                uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
              }
              while (v9);
            }
            else
            {
              LOBYTE(v11) = 1;
            }
            uint64_t v14 = (void *)[v5 captureStream];
            if ([v14 suspendingSupported]) {
              [v14 setSuspended:v11 & 1];
            }
            uint64_t v15 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1EFAFFA38), "BOOLValue");
            if (((objc_msgSend((id)objc_msgSend(*(id *)(v22 + 440), "applicationID"), "isEqualToString:", 0x1EFA55C00) & 1) != 0|| objc_msgSend((id)objc_msgSend(*(id *)(v22 + 440), "applicationID"), "isEqualToString:", 0x1EFA558C0))&& objc_msgSend((id)objc_msgSend(v5, "portType"), "isEqualToString:", v23)&& *(void *)(v22 + 520))
            {
              [v14 setDeskCamActive:v15 ^ 1];
            }
            int v16 = *(void **)(v22 + 520);
            if (v16)
            {
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "input"), "connection"), "output"), "setDiscardsSampleData:", v15);
              [*(id *)(v22 + 440) setDeskCamActive:v15 ^ 1];
              if ([a2 objectForKeyedSubscript:&unk_1EFAFF9C0]) {
                objc_msgSend(*(id *)(v22 + 440), "setUltraWideActive:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1EFAFF9C0), "BOOLValue") ^ 1);
              }
            }
          }
          ++v4;
        }
        while (v4 != v26);
        uint64_t result = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
        uint64_t v26 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BOOL)requiresMasterClock
{
  if (result) {
    return [*(id *)(result + 112) count] != 0;
  }
  return result;
}

BOOL __108__FigCaptureCameraSourcePipeline__buildMultiStreamCameraSourcePipeline_graph_renderDelegate_fastModeSwitch___block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaType] != 1986622318;
}

- (uint64_t)_stereoVideoAddSlaveFrameSynchronizerNode:(uint64_t)a3 input1:(uint64_t)a4 input2:(uint64_t)a5 mediaType:(uint64_t)a6 name:(_DWORD *)a7 outErr:
{
  if (result)
  {
    uint64_t v12 = (void *)result;
    id v17 = 0;
    BYTE12(v16) = 0;
    *(void *)((char *)&v16 + 4) = 1;
    LOBYTE(v16) = 1;
    uint64_t v13 = -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:]([BWSlaveFrameSynchronizerNode alloc], "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:", 0, 2, 0, 0, 0, 0, v16);
    uint64_t v14 = v13;
    if (!a3
      || !a4
      || (-[BWNode setName:](v13, "setName:", a6), ([v12 addNode:v14 error:&v17] & 1) == 0)
      || (objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", a3, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v14, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| (objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", a4, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v14, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
    {
      FigDebugAssert3();
    }
    if (v17)
    {
      int v15 = [v17 code];
      uint64_t result = 0;
      *a7 = v15;
    }
    else
    {
      return (uint64_t)[(BWNode *)v14 output];
    }
  }
  return result;
}

- (uint64_t)_addFunnelNodeToGraph:(void *)a3 inputs:(uint64_t)a4 mediaType:(uint64_t)a5 name:(_DWORD *)a6 outErr:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v10 = (void *)result;
    id v26 = 0;
    int v11 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", [a3 count], a4);
    [(BWNode *)v11 setName:a5];
    v25.receiver = v10;
    v25.super_class = (Class)FigCaptureCameraSourcePipeline;
    if (objc_msgSendSuper2(&v25, sel_addNode_error_, v11, &v26))
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        int v14 = 0;
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(a3);
            }
            if ((objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v21 + 1) + 8 * i), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v11, "inputs"), "objectAtIndexedSubscript:", (v14 + i)), 0) & 1) == 0)
            {
              uint64_t v19 = v6;
              LODWORD(v18) = 0;
              goto LABEL_13;
            }
          }
          uint64_t v13 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
          v14 += i;
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v19 = v6;
      LODWORD(v18) = 0;
LABEL_13:
      FigDebugAssert3();
    }
    int v17 = (int)v26;
    if (v26) {
      int v17 = [v26 code];
    }
    *a6 = v17;
    return (uint64_t)[(BWNode *)v11 output];
  }
  return result;
}

- (uint64_t)_connectSubjectSelectionNode:(void *)a3 videoOutputsBySourceDeviceType:(uint64_t)a4 sourceDeviceTypes:(void *)a5 portTypes:(void *)a6 graph:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v30.receiver = (id)result;
    v30.super_class = (Class)FigCaptureCameraSourcePipeline;
    id v31 = 0;
    if (objc_msgSendSuper2(&v30, sel_addNode_error_, a2, &v31))
    {
      if (!objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "allValues")) {
        return 4294954514;
      }
      uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "count");
      if (v10 != objc_msgSend((id)objc_msgSend(a3, "allKeys"), "count")) {
        return 4294954514;
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      int v11 = (void *)[a3 allKeys];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            if (!objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * i)), objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForUnderlyingDeviceType(objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "intValue"), a5)), 0))return 4294954516; {
          }
            }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      if (!objc_msgSend((id)objc_msgSend(a2, "videoCaptureOutputsByPortType"), "allValues")) {
        return 4294954514;
      }
      uint64_t v16 = objc_msgSend((id)objc_msgSend(a2, "videoCaptureOutputsByPortType"), "count");
      if (v16 != objc_msgSend((id)objc_msgSend(a3, "allKeys"), "count")) {
        return 4294954514;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      int v17 = (void *)[a3 allKeys];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a2, "videoCaptureOutputsByPortType"), "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForUnderlyingDeviceType(objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "intValue"), a5)), *(void *)(*((void *)&v22 + 1) + 8 * j));
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v32 count:16];
        }
        while (v19);
      }
    }
    else
    {
      FigDebugAssert3();
    }
    uint64_t result = (uint64_t)v31;
    if (v31) {
      return [v31 code];
    }
  }
  return result;
}

- (uint64_t)_connectCinematicFramingNode:(void *)a3 videoOutputsBySourceDeviceType:(void *)a4 sourceDeviceTypes:(void *)a5 portTypes:(void *)a6 graph:(void *)a7 cameraConfiguration:stillImageCaptureEnabled:stillImageOutputsByPortType:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v12 = result;
    v28.receiver = (id)result;
    v28.super_class = (Class)FigCaptureCameraSourcePipeline;
    id v29 = 0;
    if (objc_msgSendSuper2(&v28, sel_addNode_error_, a2, &v29))
    {
      if (!objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "allValues")) {
        return 4294954514;
      }
      uint64_t v13 = objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "count");
      if (v13 != objc_msgSend((id)objc_msgSend(a3, "allKeys"), "count")) {
        return 4294954514;
      }
      uint64_t v20 = v12;
      long long v21 = a7;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id obj = (id)[a3 allKeys];
      uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (!objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a3, "objectForKeyedSubscript:", v18), objc_msgSend((id)objc_msgSend(a2, "videoCaptureInputsByPortType"), "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForUnderlyingDeviceType(objc_msgSend(v18, "intValue"), a5)), 0))return 4294954516; {
            if ((unint64_t)[a4 count] >= 2)
            }
              [a3 setObject:0 forKeyedSubscript:v18];
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
      if ([a2 videoCaptureOutput])
      {
        uint64_t v19 = [a2 videoCaptureOutput];
        objc_msgSend(a3, "setObject:forKeyedSubscript:", v19, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "sourceDeviceType")));
        objc_msgSend(a2, "setClientApplicationID:", objc_msgSend(*(id *)(v20 + 440), "applicationID"));
        objc_msgSend(a2, "setCinematicFramingControlMode:", objc_msgSend(v21, "cinematicFramingControlMode"));
        objc_msgSend(*(id *)(v20 + 136), "setObject:forKeyedSubscript:", a2, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "sourceDeviceType")));
      }
    }
    else
    {
      FigDebugAssert3();
    }
    uint64_t result = (uint64_t)v29;
    if (v29) {
      return [v29 code];
    }
  }
  return result;
}

- (uint64_t)_insertSubjectSelectionAndCinematicFramingNodesOnOutputsBySourceDeviceType:(uint64_t)a1 connectionConfigurations:(void *)a2 pipelineConfiguration:(void *)a3 cameraInfoByPortType:(uint64_t)a4 graph:(uint64_t)a5 stillImageCaptureEnabled:(void *)a6 stillImageOutputsByPortType:(unsigned int)a7
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v7 = a4;
    if (a4) {
      uint64_t v9 = *(void **)(a4 + 184);
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    int v11 = *(void **)(a1 + 56);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v120 objects:v129 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v121 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v120 + 1) + 8 * i), "portType"));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v120 objects:v129 count:16];
      }
      while (v13);
    }
    uint64_t v16 = [v10 count];
    if (v16 != objc_msgSend((id)objc_msgSend(a2, "allKeys"), "count")) {
      return 4294954510;
    }
    int v17 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType(a3, [v9 sourceDeviceType]);
    unsigned int v93 = -[FigCaptureCameraSourcePipeline _getDeviceOrientationCorrectionEnabledForVideoCaptureConnectionConfigurations:](a1, v17);
    if (FigCapturePlatformSupportsUniversalLossyCompression()) {
      int v85 = csp_maxLossyCompressionLevelForConnectionConfigurations(v17, (unsigned int *)v7);
    }
    else {
      int v85 = 0;
    }
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 240);
    }
    uint64_t v18 = [(id)v7 countByEnumeratingWithState:&v116 objects:v128 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v117;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v117 != v20) {
            objc_enumerationMutation((id)v7);
          }
          long long v22 = *(void **)(*((void *)&v116 + 1) + 8 * j);
          int v23 = objc_msgSend((id)objc_msgSend(v22, "sourceConfiguration"), "sourceDeviceType");
          if (v23 == [v9 sourceDeviceType])
          {
            uint64_t v84 = [v22 metadataIdentifiers];
            goto LABEL_27;
          }
        }
        uint64_t v19 = [(id)v7 countByEnumeratingWithState:&v116 objects:v128 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    uint64_t v84 = 0;
LABEL_27:
    int CenterStageFramingMode = csp_getCenterStageFramingMode([v9 source]);
    uint64_t v24 = a1;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 440), "captureStreams"), "count") != 1)
    {
      FigDebugAssert3();
      return 4294954516;
    }
    uint64_t v91 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 440), "captureStream"), "geometricDistortionCoefficients");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 440), "captureStream"), "calibrationValidRadiusForFullFieldOfView"), "floatValue");
    if (v25 <= 0.0) {
      char v90 = BWDeviceIsiPad();
    }
    else {
      char v90 = 1;
    }
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id obj = (id)[a2 allKeys];
    uint64_t v26 = [obj countByEnumeratingWithState:&v112 objects:v127 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v113;
      while (2)
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v113 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v126 = *(void *)(*((void *)&v112 + 1) + 8 * k);
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
          objc_super v30 = [BWSubjectSelectionNode alloc];
          uint64_t v31 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "cinematicFramingOutputDimensions");
          uint64_t v32 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "horizontalSensorBinningFactor");
          uint64_t v33 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "verticalSensorBinningFactor");
          LOBYTE(v77) = [v9 gazeSelectionEnabled];
          HIDWORD(v76) = CenterStageFramingMode;
          BYTE1(v76) = v90;
          LOBYTE(v76) = v91 != 0;
          uint64_t v34 = -[BWSubjectSelectionNode initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:portTypes:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageFramingMode:gazeSelectionEnabled:](v30, "initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:portTypes:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageFramingMode:gazeSelectionEnabled:", v31, a5, v32, v33, v93, v10, v76, v77);
          if (!v34)
          {
            FigDebugAssert3();
            return 0;
          }
          uint64_t v36 = v34;
          uint64_t v24 = a1;
          uint64_t v37 = -[FigCaptureCameraSourcePipeline _connectSubjectSelectionNode:videoOutputsBySourceDeviceType:sourceDeviceTypes:portTypes:graph:](a1, v34, a2, v35, v10, a6);
          if (v37)
          {
            uint64_t v74 = v37;
LABEL_75:
            FigDebugAssert3();
            return v74;
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v112 objects:v127 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v36 = 0;
    }
    [*(id *)(v24 + 440) setSubjectSelectionDelegate:v36];
    char CinematicFramingFieldOfViewRestrictedToWide = csp_getCinematicFramingFieldOfViewRestrictedToWide([v9 source]);
    id v111 = 0;
    uint64_t v38 = [v9 source];
    uint64_t v39 = *MEMORY[0x1E4F1CF80];
    uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v40) {
      uint64_t v41 = v40;
    }
    else {
      uint64_t v41 = 0;
    }
    int v42 = *(void (**)(uint64_t, __CFString *, uint64_t, id *))(v41 + 48);
    if (v42)
    {
      v42(v38, @"VideoZoomFactor", v39, &v111);
      id v43 = v111;
    }
    else
    {
      id v43 = 0;
    }
    [v43 floatValue];
    int v45 = v44;

    char v110 = 0;
    int v109 = 0;
    csp_getCenterStageRectOfInterest([v9 source]);
    uint64_t v47 = v46;
    float v49 = v48;
    double v51 = v50;
    int v53 = v52;
    char v82 = [v9 cinematicFramingEnabled];
    [v9 manualFramingPanningAngleX];
    int v55 = v54;
    [v9 manualFramingPanningAngleY];
    int v57 = v56;
    [v9 manualFramingDefaultZoomFactor];
    double v59 = v58;
    LODWORD(v58) = 1.0;
    [*(id *)(v24 + 440) setZoomFactor:v58];
    uint64_t v60 = [v9 source];
    cf[0] = 0;
    uint64_t v61 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v61) {
      uint64_t v62 = v61;
    }
    else {
      uint64_t v62 = 0;
    }
    int v63 = *(void (**)(uint64_t, __CFString *, uint64_t, CFTypeRef *))(v62 + 48);
    if (v63)
    {
      v63(v60, @"CenterStageMetadataDeliveryEnabled", v39, cf);
      float v64 = (void *)cf[0];
    }
    else
    {
      float v64 = 0;
    }
    char v81 = [v64 BOOLValue];
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v79 = (id)[a2 allKeys];
    id obja = (id)[v79 countByEnumeratingWithState:&v105 objects:v125 count:16];
    if (obja)
    {
      uint64_t v80 = *(void *)v106;
LABEL_58:
      uint64_t v65 = 0;
      while (1)
      {
        if (*(void *)v106 != v80) {
          objc_enumerationMutation(v79);
        }
        uint64_t v124 = *(void *)(*((void *)&v105 + 1) + 8 * v65);
        double v66 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
        int v67 = [BWCinematicFramingNode alloc];
        uint64_t v68 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "cinematicFramingOutputDimensions");
        uint64_t v69 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "horizontalSensorBinningFactor");
        uint64_t v70 = objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "verticalSensorBinningFactor");
        LOBYTE(cf[0]) = v82;
        BYTE1(cf[0]) = 1;
        BYTE2(cf[0]) = CinematicFramingFieldOfViewRestrictedToWide;
        *(_DWORD *)((char *)cf + 3) = v109;
        HIBYTE(cf[0]) = v110;
        cf[1] = v47;
        cf[2] = v49;
        cf[3] = v51;
        cf[4] = v53;
        int v98 = CenterStageFramingMode;
        int v99 = v45;
        int v100 = v55;
        int v101 = v57;
        double v102 = v59;
        uint64_t v103 = 0;
        uint64_t v104 = 0;
        BYTE2(v78) = v81;
        BYTE1(v78) = v90;
        LOBYTE(v78) = v91 != 0;
        LODWORD(v77) = v85;
        int v71 = -[BWCinematicFramingNode initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portTypes:cinematicFramingControls:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageMetadataDeliveryEnabled:pipelineType:](v67, "initWithOutputDimensions:cameraInfoByPortType:horizontalSensorBinningFactor:verticalSensorBinningFactor:deviceOrientationCorrectionEnabled:stillImageCaptureEnabled:objectMetadataIdentifiers:maxLossyCompressionLevel:portTypes:cinematicFramingControls:cameraHasDistortionCoefficients:cameraHasCalibrationValidMaxRadius:centerStageMetadataDeliveryEnabled:pipelineType:", v68, a5, v69, v70, v93, a7, v84, v77, v10, cf, v78, 0);
        if (!v71) {
          return 4294954510;
        }
        float v72 = v71;
        uint64_t v24 = a1;
        [*(id *)(a1 + 440) setManualCinematicFramingDelegate:v71];
        if (a7) {
          *(void *)(a1 + 512) = v72;
        }
        uint64_t v73 = -[FigCaptureCameraSourcePipeline _connectCinematicFramingNode:videoOutputsBySourceDeviceType:sourceDeviceTypes:portTypes:graph:cameraConfiguration:stillImageCaptureEnabled:stillImageOutputsByPortType:](a1, v72, a2, v66, v10, a6, v9);
        if (v73)
        {
          uint64_t v74 = v73;
          goto LABEL_75;
        }
        if (obja == (id)++v65)
        {
          id obja = (id)[v79 countByEnumeratingWithState:&v105 objects:v125 count:16];
          if (obja) {
            goto LABEL_58;
          }
          goto LABEL_69;
        }
      }
    }
    float v72 = 0;
LABEL_69:
    [*(id *)(v24 + 440) setCenterStageDelegate:v72];
  }
  return 0;
}

- (id)_insertSmartStyleLearningNodeOnOutputsBySourceDeviceType:(void *)a3 ifAllowedByAdditionalPreviewConnectionConfigurations:(void *)a4 semanticMasksOutputsBySourceDeviceType:(uint64_t)a5 pipelineConfiguration:(void *)a6 graph:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v9 = result;
    double v51 = 0;
    int v42 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (a5) {
      id v10 = *(void **)(a5 + 184);
    }
    else {
      id v10 = 0;
    }
    if ([v10 cinematicFramingEnabled])
    {
      uint64_t v11 = 2;
    }
    else
    {
      int v12 = [v10 manualCinematicFramingEnabled];
      uint64_t v11 = 2;
      if (!v12) {
        uint64_t v11 = 3;
      }
    }
    uint64_t v41 = v11;
    if (a5)
    {
      if (*(unsigned char *)(a5 + 321))
      {
        unsigned int v43 = objc_msgSend((id)objc_msgSend(*(id *)(a5 + 216), "irisSinkConfiguration"), "irisMovieCaptureEnabled");
        if (*(unsigned char *)(a5 + 321))
        {
          uint64_t v13 = *(void **)(a5 + 200);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v57 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v53;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v53 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v18, "sinkConfiguration"), "sinkType") == 14
                  && objc_msgSend((id)objc_msgSend(v18, "sinkConfiguration"), "subType") == 3)
                {
                  int v19 = 1;
                  goto LABEL_23;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v52 objects:v57 count:16];
              if (v15) {
                continue;
              }
              break;
            }
            int v19 = 0;
LABEL_23:
            v43 |= v19;
          }
        }
      }
      else
      {
        unsigned int v43 = 0;
      }
      BOOL v20 = (*(_DWORD *)(a5 + 180) - 4) < 0xFFFFFFFD;
    }
    else
    {
      unsigned int v43 = 0;
      BOOL v20 = 1;
    }
    BOOL v40 = v20;
    id v21 = (id)[FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations(a3) copy];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v22 = [a2 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v48;
      uint64_t v37 = a5;
      uint64_t v38 = *(void *)v48;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(a2);
          }
          uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * v25);
          uint64_t v27 = [v9[67] objectForKeyedSubscript:v26];
          if (([v21 containsObject:v26] & 1) == 0 && !v27)
          {
            uint64_t v28 = [BWSmartStyleLearningNode alloc];
            if (a5 && *(unsigned char *)(a5 + 264)) {
              uint64_t v29 = objc_msgSend((id)objc_msgSend(*(id *)(a5 + 184), "requiredFormat"), "isPhotoFormat");
            }
            else {
              uint64_t v29 = 0;
            }
            objc_super v30 = [(BWSmartStyleLearningNode *)v28 initWithOutputs:v41 masksRefinerEnabled:v29 propagateMasks:v43];
            if (!v30) {
              goto LABEL_55;
            }
            uint64_t v31 = v30;
            [(BWNode *)v30 setName:@"Source SmartStyle Learning"];
            if (a5)
            {
              [(BWSmartStyleLearningNode *)v31 setDisableWaitForCoefficientsOnFirstFrame:*(unsigned __int8 *)(a5 + 336)];
              [(BWSmartStyleLearningNode *)v31 setSubjectRelightingEnabled:v40];
              -[BWSmartStyleLearningNode setCameraInfoByPortType:](v31, "setCameraInfoByPortType:", [v9[55] cameraInfoByPortType]);
              uint64_t v32 = *(void *)(a5 + 328);
            }
            else
            {
              [(BWSmartStyleLearningNode *)v31 setDisableWaitForCoefficientsOnFirstFrame:0];
              [(BWSmartStyleLearningNode *)v31 setSubjectRelightingEnabled:v40];
              -[BWSmartStyleLearningNode setCameraInfoByPortType:](v31, "setCameraInfoByPortType:", [v9[55] cameraInfoByPortType]);
              uint64_t v32 = 0;
            }
            [(BWSmartStyleLearningNode *)v31 setSmartStyle:v32];
            v46.receiver = v9;
            v46.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v46, sel_addNode_error_, v31, &v51) & 1) == 0
              || (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v26), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v31, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| (uint64_t v33 = objc_msgSend(a4, "objectForKeyedSubscript:", v26)) != 0&& (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", v33, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v31, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
            {
LABEL_54:
              FigDebugAssert3();
              goto LABEL_55;
            }
            [v42 setObject:v31 forKeyedSubscript:v26];
            if ([v9[68] objectForKeyedSubscript:v26])
            {
              uint64_t v34 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
              [(BWNode *)v34 setName:@"SmartStyle Preview/Capture FanOut"];
              v45.receiver = v9;
              v45.super_class = (Class)FigCaptureCameraSourcePipeline;
              if ((objc_msgSendSuper2(&v45, sel_addNode_error_, v34, &v51) & 1) == 0) {
                goto LABEL_54;
              }
              if ((objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", -[BWNode output](v31, "output"), -[BWNode input](v34, "input"), 0) & 1) == 0)goto LABEL_54; {
              objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v34, "outputs"), "objectAtIndexedSubscript:", 0), v26);
              }
              char v35 = objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v34, "outputs"), "objectAtIndexedSubscript:", 1), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9[68], "objectForKeyedSubscript:", v26), "inputs"), "objectAtIndexedSubscript:", 1), 0);
              a5 = v37;
              uint64_t v24 = v38;
              if ((v35 & 1) == 0) {
                goto LABEL_54;
              }
            }
            else
            {
              objc_msgSend(a2, "setObject:forKeyedSubscript:", -[BWNode output](v31, "output"), v26);
              uint64_t v24 = v38;
            }
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v36 = [a2 countByEnumeratingWithState:&v47 objects:v56 count:16];
        uint64_t v23 = v36;
      }
      while (v36);
    }
    [v9[67] addEntriesFromDictionary:v42];
LABEL_55:
    uint64_t result = v51;
    if (v51) {
      return (id *)[v51 code];
    }
  }
  return result;
}

- (id)_insertSmartStyleMetadataSynchronizerNodeOnOutputsBySourceDeviceType:(uint64_t)a3 pipelineConfiguration:(void *)a4 graph:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v33 = 0;
    uint64_t v26 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (a3 && *(unsigned char *)(a3 + 321)) {
      int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a3 + 216), "irisSinkConfiguration"), "irisMovieCaptureEnabled");
    }
    else {
      int v7 = 0;
    }
    uint64_t v25 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, v7);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      uint64_t v22 = *MEMORY[0x1E4F534C8];
      uint64_t v23 = *MEMORY[0x1E4F53158];
      uint64_t v20 = *MEMORY[0x1E4F53518];
      uint64_t v21 = *MEMORY[0x1E4F53500];
      uint64_t v19 = *MEMORY[0x1E4F53520];
      uint64_t v18 = *MEMORY[0x1E4F534F0];
      uint64_t v17 = *MEMORY[0x1E4F534D8];
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v27 = v9;
        do
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
          if (![v6[67] objectForKeyedSubscript:v12])
          {
            uint64_t v13 = [BWMetadataSynchronizerNode alloc];
            uint64_t v36 = v25;
            uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
            uint64_t v35 = v23;
            uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
            v34[0] = v22;
            v34[1] = v21;
            v34[2] = v20;
            v34[3] = v19;
            v34[4] = v18;
            v34[5] = v17;
            uint64_t v16 = -[BWMetadataSynchronizerNode initWithArraysOfMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:](v13, "initWithArraysOfMetadataInputs:propagateSampleBufferAttachmentKeys:propagateSampleBufferMetadataDictKeys:syncMetadataForPortTypes:syncOnlyIfMetadataEnabledForKeys:", v14, v15, [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6], 0, 0);
            [(BWNode *)v16 setName:@"SmartStyle AttachedMedia Synchronizer"];
            [v26 setObject:v16 forKeyedSubscript:v12];
            v28.receiver = v6;
            v28.super_class = (Class)FigCaptureCameraSourcePipeline;
            if ((objc_msgSendSuper2(&v28, sel_addNode_error_, v16, &v33) & 1) == 0
              || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", objc_msgSend(a2, "objectForKeyedSubscript:", v12), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v16, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0)
            {
              FigDebugAssert3();
              goto LABEL_18;
            }
            objc_msgSend(a2, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v16, "outputs"), "objectAtIndexedSubscript:", 0), v12);
            uint64_t v9 = v27;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [a2 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    [v6[68] addEntriesFromDictionary:v26];
LABEL_18:
    uint64_t result = v33;
    if (v33) {
      return (id *)[v33 code];
    }
  }
  return result;
}

- (void)_insertFunnelOnPreviewOutputsBySourceDeviceType:(void *)a3 previewDerivedConnectionConfigurations:(void *)a4 graph:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = result;
  if (result)
  {
    uint64_t v4 = a2;
    BOOL v40 = 0;
    uint64_t result = (void *)[a2 count];
    if (result)
    {
      uint64_t v25 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = (id)[v4 allKeys];
      uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
      if (v26)
      {
        uint64_t v23 = v4;
        uint64_t v24 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_super v28 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v29 = (void *)[MEMORY[0x1E4F1CA48] array];
            int v7 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            uint64_t v8 = [a3 countByEnumeratingWithState:&v32 objects:v42 count:16];
            if (!v8) {
              goto LABEL_27;
            }
            uint64_t v9 = v8;
            uint64_t v27 = i;
            int v10 = 0;
            int v11 = 0;
            int v12 = 0;
            uint64_t v13 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v33 != v13) {
                  objc_enumerationMutation(a3);
                }
                uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                if (objc_msgSend(v6, "isEqualToNumber:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "underlyingDeviceType"))))
                {
                  if ([v15 videoDataSinkConfiguration])
                  {
                    [v7 setObject:v15 atIndexedSubscript:v12++];
                  }
                  else if (objc_msgSend((id)objc_msgSend(v15, "sinkConfiguration"), "sinkType") == 14)
                  {
                    [v29 setObject:v15 atIndexedSubscript:v11++];
                  }
                  else
                  {
                    [v28 setObject:v15 atIndexedSubscript:v10++];
                  }
                }
              }
              uint64_t v9 = [a3 countByEnumeratingWithState:&v32 objects:v42 count:16];
            }
            while (v9);
            int v16 = v11 + v10;
            uint64_t v4 = v23;
            uint64_t i = v27;
            if (v12 > 1 || v12 == 1 && v16 >= 1)
            {
              uint64_t v17 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v28];
              [v17 addObjectsFromArray:v7];
              [v17 addObjectsFromArray:v29];
              uint64_t v18 = [[BWFanOutNode alloc] initWithFanOutCount:(v12 + v16) mediaType:1986618469];
              [(BWNode *)v18 setName:@"Preview Output Splitter"];
              FigCaptureNameSplitterNodeOutputsCorrespondingToConnections([(BWNode *)v18 outputs], v17);
              v31.receiver = v21;
              v31.super_class = (Class)FigCaptureCameraSourcePipeline;
              if ((objc_msgSendSuper2(&v31, sel_addNode_error_, v18, &v40) & 1) == 0
                || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", objc_msgSend(v23, "objectForKeyedSubscript:", v6), -[BWNode input](v18, "input"), 0) & 1) == 0)
              {
                FigDebugAssert3();
                goto LABEL_32;
              }
              uint64_t v19 = [(BWNode *)v18 outputs];
            }
            else
            {
LABEL_27:
              uint64_t v41 = [v4 objectForKeyedSubscript:v6];
              uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
            }
            [v25 setObject:v19 forKeyedSubscript:v6];
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }
      v21[19] = [v25 copy];
LABEL_32:
      uint64_t result = v40;
      if (v40) {
        return (void *)[v40 code];
      }
    }
  }
  return result;
}

- (void)visOverscanPredictor:(id)a3 allowsReducedOverscan:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_powerOptimizedVISOverscanEnabled != a4)
  {
    BOOL v4 = a4;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    sourceNodes = self->_sourceNodes;
    uint64_t v7 = [(NSMutableArray *)sourceNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(sourceNodes);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setPowerOptimizedVISOverscanEnabled:v4];
        }
        uint64_t v8 = [(NSMutableArray *)sourceNodes countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
    self->_powerOptimizedVISOverscanEnabled = v4;
  }
}

- (uint64_t)captureSourceDepthDataFormat
{
  if (result) {
    return *(void *)(result + 464);
  }
  return result;
}

- (uint64_t)maxFrameRateClientOverride
{
  if (result) {
    return *(unsigned int *)(result + 500);
  }
  return result;
}

- (uint64_t)sourceNodes
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (BOOL)preLTMThumbnailEnabled
{
  if (result) {
    return *(unsigned char *)(result + 553) != 0;
  }
  return result;
}

- (BOOL)postColorProcessingThumbnailEnabled
{
  if (result) {
    return *(unsigned char *)(result + 554) != 0;
  }
  return result;
}

- (uint64_t)cinematicFramingCameraStatesProvider
{
  if (result) {
    return *(void *)(result + 512);
  }
  return result;
}

@end