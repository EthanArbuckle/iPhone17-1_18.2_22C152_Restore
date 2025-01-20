@interface BWCinematicFramingNode
+ (void)initialize;
- ($1981ABD3383123DE67D3222CA4FC2B97)cinematicFramingControls;
- (BOOL)cinematicFramingControlsSuspended;
- (BOOL)isRegionOfInterestForCameraControlsFeedbackEnabled;
- (BWCinematicFramingNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 deviceOrientationCorrectionEnabled:(BOOL)a7 stillImageCaptureEnabled:(BOOL)a8 objectMetadataIdentifiers:(id)a9 maxLossyCompressionLevel:(int)a10 portTypes:(id)a11 cinematicFramingControls:(id *)a12 cameraHasDistortionCoefficients:(BOOL)a13 cameraHasCalibrationValidMaxRadius:(BOOL)a14 centerStageMetadataDeliveryEnabled:(BOOL)a15 pipelineType:(unint64_t)a16;
- (BWNodeOutput)detectionMetadataOutput;
- (BWNodeOutput)videoCaptureOutput;
- (CGRect)regionOfInterestForCameraControls;
- (NSDictionary)detectionMetadataInputsByPortType;
- (NSDictionary)videoCaptureInputsByPortType;
- (NSString)clientApplicationID;
- (double)_getDeviceToCameraSpaceTransform:(uint64_t)a1;
- (double)manualFramingVideoZoomFactor;
- (id)copyCameraStatesForPTS:(id *)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)regionOfInterestForCameraControlsChangedHandler;
- (uint64_t)_initVirtualCameraProcessor;
- (uint64_t)_reportCinematicFramingSessionCoreAnalyticsData;
- (uint64_t)_updateOutputRequirements;
- (uint64_t)_updateVCProcessorWithCinematicFramingControls;
- (unsigned)cinematicFramingControlMode;
- (void)_addMetadaInputsAndOutputsWithObjectMetadataIdentifiers:(uint64_t)a1;
- (void)_addVideoCaptureInputsAndOutput;
- (void)_saveCameraStatesForStillImageCaptureRequestsWithInputCamera:(void *)a3 outputCamera:(void *)a4 outputROI:(double)a5 pts:(double)a6;
- (void)_supportedOutputPixelFormats;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didChangeCenterStageFramingMode:(int)a3;
- (void)didChangeCenterStageMetadataDeliveryEnabled:(BOOL)a3;
- (void)didChangeCenterStageRectOfInterest:(CGRect)a3;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)panWithTranslation:(CGPoint)a3;
- (void)performOneShotFraming;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)resetFraming;
- (void)restrictCenterStageFieldOfViewToWide:(BOOL)a3;
- (void)setCinematicFramingControlMode:(unsigned int)a3;
- (void)setCinematicFramingControls:(id *)a3;
- (void)setCinematicFramingControlsSuspended:(BOOL)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setManualFramingVideoZoomFactor:(double)a3;
- (void)setRegionOfInterestForCameraControlsChangedHandler:(id)a3;
- (void)setRegionOfInterestForCameraControlsFeedbackEnabled:(BOOL)a3;
- (void)startPanningAtPoint:(CGPoint)a3;
@end

@implementation BWCinematicFramingNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWCinematicFramingNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 deviceOrientationCorrectionEnabled:(BOOL)a7 stillImageCaptureEnabled:(BOOL)a8 objectMetadataIdentifiers:(id)a9 maxLossyCompressionLevel:(int)a10 portTypes:(id)a11 cinematicFramingControls:(id *)a12 cameraHasDistortionCoefficients:(BOOL)a13 cameraHasCalibrationValidMaxRadius:(BOOL)a14 centerStageMetadataDeliveryEnabled:(BOOL)a15 pipelineType:(unint64_t)a16
{
  BOOL v16 = a8;
  v30.receiver = self;
  v30.super_class = (Class)BWCinematicFramingNode;
  v22 = [(BWNode *)&v30 init];
  uint64_t v23 = (uint64_t)v22;
  if (v22)
  {
    v22->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    v22->_cameraInfoByPortType = (NSDictionary *)a4;
    id v24 = a11;
    *(void *)(v23 + 448) = v24;
    objc_msgSend((id)v23, "setSupportsConcurrentLiveInputCallbacks:", (unint64_t)objc_msgSend(v24, "count") > 1);
    *(_DWORD *)(v23 + 136) = 0;
    if ((a5 - 3) >= 0xFFFFFFFE && (*(_DWORD *)(v23 + 140) = a5, (a6 - 3) >= 0xFFFFFFFE))
    {
      *(_DWORD *)(v23 + 144) = a6;
      *(_DWORD *)(v23 + 444) = a10;
      *(void *)(v23 + 408) = objc_alloc_init(BWDeviceOrientationMonitor);
      *(unsigned char *)(v23 + 441) = a7;
      *(void *)(v23 + 96) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a11, "count"));
      *(void *)(v23 + 512) = a16;
      -[BWCinematicFramingNode _addVideoCaptureInputsAndOutput](v23);
      *(unsigned char *)(v23 + 440) = v16;
      if (v16)
      {
        *(_DWORD *)(v23 + 316) = 0;
        *(void *)(v23 + 232) = 0;
        *(_OWORD *)(v23 + 200) = 0u;
        *(_OWORD *)(v23 + 216) = 0u;
        *(_OWORD *)(v23 + 168) = 0u;
        *(_OWORD *)(v23 + 184) = 0u;
        *(void *)(v23 + 304) = 0;
        *(_OWORD *)(v23 + 288) = 0u;
        *(_OWORD *)(v23 + 272) = 0u;
        *(_OWORD *)(v23 + 256) = 0u;
        *(_OWORD *)(v23 + 240) = 0u;
        *(_DWORD *)(v23 + 312) = 0;
      }
      if (a9)
      {
        *(void *)(v23 + 112) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a11, "count"));
        -[BWCinematicFramingNode _addMetadaInputsAndOutputsWithObjectMetadataIdentifiers:](v23, (uint64_t)a9);
      }
      *(_DWORD *)(v23 + 436) = 5;
      long long v26 = *(_OWORD *)&a12->var3.origin.y;
      long long v25 = *(_OWORD *)&a12->var3.size.height;
      long long v27 = *(_OWORD *)&a12->var9;
      *(_OWORD *)(v23 + 376) = *(_OWORD *)&a12->var6;
      *(_OWORD *)(v23 + 392) = v27;
      *(_OWORD *)(v23 + 344) = v26;
      *(_OWORD *)(v23 + 360) = v25;
      *(_OWORD *)(v23 + 328) = *(_OWORD *)&a12->var0;
      *(unsigned char *)(v23 + 466) = a13;
      *(unsigned char *)(v23 + 467) = a14;
      *(unsigned char *)(v23 + 520) = a15;
      -[BWCinematicFramingNode _updateOutputRequirements](v23);
      *(unsigned char *)(v23 + 469) = 0;
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(v23 + 472) = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(v23 + 488) = v28;
      *(void *)(v23 + 504) = 0;
    }
    else
    {
      return 0;
    }
  }
  return (BWCinematicFramingNode *)v23;
}

- (void)_addVideoCaptureInputsAndOutput
{
  if (a1)
  {
    v2 = (void *)[MEMORY[0x1E4F1CA48] array];
    if ([*(id *)(a1 + 448) count])
    {
      unint64_t v3 = 0;
      do
      {
        v4 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:a1 index:v3];
        v5 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v5 setSupportedPixelFormats:FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB02E40, *(_DWORD *)(a1 + 444))];
        [(BWNodeInput *)v4 setFormatRequirements:v5];
        [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v4 primaryMediaConfiguration] setPassthroughMode:0];
        [(BWNodeInput *)v4 setDelayedBufferCount:[(BWNodeInput *)v4 delayedBufferCount] + 1];
        [(id)a1 addInput:v4];
        objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v4, objc_msgSend(*(id *)(a1 + 448), "objectAtIndexedSubscript:", v3));

        objc_msgSend(v2, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v3++));
      }
      while (v3 < [*(id *)(a1 + 448) count]);
    }
    v7 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:a1];
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", -[BWCinematicFramingNode _supportedOutputPixelFormats](a1));
    [(BWNodeOutput *)v7 setFormatRequirements:v6];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v7 primaryMediaConfiguration] setPassthroughMode:0];
    *(void *)(a1 + 104) = v7;
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v7 primaryMediaConfiguration] setIndexesOfInputsWhichDrivesThisOutput:v2];
    if (*(void *)(a1 + 512) == 1) {
      [(BWNodeOutput *)v7 setOwningNodeRetainedBufferCount:3];
    }
    [(id)a1 addOutput:v7];
  }
}

- (void)_addMetadaInputsAndOutputsWithObjectMetadataIdentifiers:(uint64_t)a1
{
  if (a1)
  {
    if ([*(id *)(a1 + 448) count])
    {
      unint64_t v4 = 0;
      do
      {
        v5 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1835365473, a1, [*(id *)(a1 + 96) count] + v4);
        [(id)a1 addInput:v5];
        objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v5, objc_msgSend(*(id *)(a1 + 448), "objectAtIndexedSubscript:", v4));

        ++v4;
      }
      while (v4 < [*(id *)(a1 + 448) count]);
    }
    v6 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:a1];
    [(BWNodeOutput *)v6 setFormat:+[BWMetadataObjectFormat formatWithMetadataIdentifiers:a2]];
    [(id)a1 addOutput:v6];
    *(void *)(a1 + 120) = v6;
  }
}

- (uint64_t)_updateOutputRequirements
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 96), "allValues"), "objectAtIndexedSubscript:", 0), "videoFormat"), "colorSpaceProperties");
    if (v2)
    {
      v6[0] = [NSNumber numberWithInt:v2];
      uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    else
    {
      uint64_t v3 = 0;
    }
    unint64_t v4 = -[BWCinematicFramingNode _supportedOutputPixelFormats](v1);
    v5 = (void *)[*(id *)(v1 + 104) formatRequirements];
    [v5 setWidth:*(int *)(v1 + 160)];
    [v5 setHeight:*(int *)(v1 + 164)];
    [v5 setSupportedColorSpaceProperties:v3];
    return [v5 setSupportedPixelFormats:v4];
  }
  return result;
}

- (void)dealloc
{
  [(VCProcessor *)self->_vcProcessor purgeResources];
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  if (self->_stillImageCaptureEnabled)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)BWCinematicFramingNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"CinematicFraming";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  BWUtilitiesWarnIfInputFormatsMismatch([(BWNode *)self inputs], self->super._input);
  v3.receiver = self;
  v3.super_class = (Class)BWCinematicFramingNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  -[BWCinematicFramingNode _initVirtualCameraProcessor]((uint64_t)self);
  [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor start];
}

- (uint64_t)_initVirtualCameraProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 320);
    if (v2) {

    }
    id v3 = objc_alloc_init(MEMORY[0x1E4F58FB8]);
    *(void *)(v1 + 320) = v3;
    [v3 setOutputDimensions:*(void *)(v1 + 160)];
    [*(id *)(v1 + 320) setCameraInfoByPortType:*(void *)(v1 + 152)];
    if ([*(id *)(v1 + 320) setup]
      || [*(id *)(v1 + 320) prewarm])
    {
      result = FigDebugAssert3();
      if (dword_1E96B6CA8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        return fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      [*(id *)(v1 + 320) setOrientationCorrectionEnabled:*(unsigned __int8 *)(v1 + 441)];
      return -[BWCinematicFramingNode _updateVCProcessorWithCinematicFramingControls](v1);
    }
  }
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  p_videoOutputFormatIsLive = &self->_videoOutputFormatIsLive;
  if (!self->_videoOutputFormatIsLive
    && (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "containsObject:", a5) & 1) != 0)
  {
    v9 = &OBJC_IVAR___BWCinematicFramingNode__videoCaptureOutput;
LABEL_7:
    [*(id *)((char *)&self->super.super.isa + *v9) makeConfiguredFormatLive];
    BOOL *p_videoOutputFormatIsLive = 1;
    goto LABEL_8;
  }
  p_videoOutputFormatIsLive = &self->_metadataOutputFormatIsLive;
  if (!self->_metadataOutputFormatIsLive
    && objc_msgSend((id)-[NSMutableDictionary allValues](self->_detectionMetadataInputsByPortType, "allValues"), "containsObject:", a5))
  {
    v9 = &OBJC_IVAR___BWCinematicFramingNode__detectionMetadataOutput;
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "containsObject:", a3))
  {
    uint64_t v6 = 0;
    uint64_t v7 = (int)(atomic_fetch_add_explicit(&self->_endOfDataVideoInputsCount, 1u, memory_order_relaxed) + 1);
  }
  else
  {
    uint64_t v7 = 0;
    if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_detectionMetadataInputsByPortType, "allValues"), "containsObject:", a3))uint64_t v6 = (int)(atomic_fetch_add_explicit(&self->_endOfDataMetadataInputsCount, 1u, memory_order_relaxed) + 1); {
    else
    }
      uint64_t v6 = 0;
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
  if (v7 == [(NSMutableDictionary *)self->_videoCaptureInputsByPortType count])
  {
    [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor stop];
    [(BWNodeOutput *)self->_videoCaptureOutput markEndOfLiveOutput];
    -[BWCinematicFramingNode _reportCinematicFramingSessionCoreAnalyticsData]((uint64_t)self);
    self->_endOfDataVideoInputsCount = 0;
  }
  if (v6 == [(NSMutableDictionary *)self->_detectionMetadataInputsByPortType count])
  {
    [(BWNodeOutput *)self->_detectionMetadataOutput markEndOfLiveOutput];
    self->_endOfDataMetadataInputsCount = 0;
  }
}

- (uint64_t)_reportCinematicFramingSessionCoreAnalyticsData
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_alloc_init(BWCinematicFramingSessionAnalyticsPayload);
    [(BWCinematicFramingSessionAnalyticsPayload *)v2 setCinematicFramingMaxPeopleDetected:*(unsigned int *)(v1 + 416)];
    id v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 320), "framingSession"), "roiHeatMapCounts");
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if ([v3 count])
    {
      unint64_t v5 = 0;
      do
      {
        objc_msgSend(v4, "appendString:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v5), "stringValue"));
        if (v5 != [v3 count] - 1) {
          [v4 appendString:@","];
        }
        ++v5;
      }
      while ([v3 count] > v5);
    }
    [(BWCinematicFramingSessionAnalyticsPayload *)v2 setCinematicFramingROIHeatMap:v4];
    [(BWCinematicFramingSessionAnalyticsPayload *)v2 setClientApplicationID:*(void *)(v1 + 424)];
    [(BWCinematicFramingSessionAnalyticsPayload *)v2 setCinematicFramingControlMode:*(unsigned int *)(v1 + 432)];
    uint64_t v6 = +[BWCoreAnalyticsReporter sharedInstance];
    return [(BWCoreAnalyticsReporter *)v6 sendEvent:v2];
  }
  return result;
}

- (void)didChangeCenterStageRectOfInterest:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor setOutputROI:](self->_vcProcessor, "setOutputROI:", x, y, width, height);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didChangeCenterStageFramingMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  objc_msgSend((id)-[VCProcessor framingSession](self->_vcProcessor, "framingSession"), "setFramingStyle:", v3);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didChangeCenterStageMetadataDeliveryEnabled:(BOOL)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_centerStageMetadataDeliveryEnabled = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)restrictCenterStageFieldOfViewToWide:(BOOL)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_cinematicFramingControls.fieldOfViewRestrictedToWide = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- ($1981ABD3383123DE67D3222CA4FC2B97)cinematicFramingControls
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  long long v6 = *(_OWORD *)&self->_cinematicFramingControls.panningAngleX;
  *(_OWORD *)&retstr->var3.size.double height = *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.size.height;
  *(_OWORD *)&retstr->var6 = v6;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self->_cinematicFramingControls.defaultVirtualCameraRotationAngleX;
  long long v7 = *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_cinematicFramingControls.autoFramingEnabled;
  *(_OWORD *)&retstr->var3.origin.double y = v7;
  os_unfair_lock_unlock(p_bufferServicingLock);
  return result;
}

- (void)setCinematicFramingControls:(id *)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  *(_OWORD *)&self->_cinematicFramingControls.autoFramingEnabled = *(_OWORD *)&a3->var0;
  long long v6 = *(_OWORD *)&a3->var9;
  long long v8 = *(_OWORD *)&a3->var3.origin.y;
  long long v7 = *(_OWORD *)&a3->var3.size.height;
  *(_OWORD *)&self->_cinematicFramingControls.panningAngleX = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_cinematicFramingControls.defaultVirtualCameraRotationAngleX = v6;
  *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.origin.double y = v8;
  *(_OWORD *)&self->_cinematicFramingControls.outputFramingRectOfInterest.size.double height = v7;
  -[BWCinematicFramingNode _updateVCProcessorWithCinematicFramingControls]((uint64_t)self);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (uint64_t)_updateVCProcessorWithCinematicFramingControls
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 320) setAutoFramingEnabled:*(unsigned __int8 *)(result + 328)];
    [*(id *)(v1 + 320) setFisheyeEffectEnabled:*(unsigned __int8 *)(v1 + 329)];
    objc_msgSend(*(id *)(v1 + 320), "setOutputCameraDefaultRotation:", COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)(v1 + 392)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL)), (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)))));
    if (*(unsigned char *)(v1 + 328))
    {
      objc_msgSend(*(id *)(v1 + 320), "setOutputROI:", *(double *)(v1 + 336), *(double *)(v1 + 344), *(double *)(v1 + 352), *(double *)(v1 + 360));
      uint64_t v2 = *(unsigned int *)(v1 + 368);
      uint64_t v3 = (void *)[*(id *)(v1 + 320) framingSession];
      return [v3 setFramingStyle:v2];
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 320), "setOutputROI:", 0.0, 0.0, 1.0, 1.0);
      double v4 = *(double *)(v1 + 376);
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 320), "outputCamera"), "setRotation:", v4);
      LODWORD(v5) = *(_DWORD *)(v1 + 372);
      [*(id *)(v1 + 320) setVideoZoomFactor:v5];
      double v6 = *(double *)(v1 + 384);
      *(float *)&double v6 = v6;
      long long v7 = *(void **)(v1 + 320);
      return [v7 setManualFramingDefaultVideoZoomFactor:v6];
    }
  }
  return result;
}

- (BOOL)cinematicFramingControlsSuspended
{
  uint64_t v2 = self;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  LOBYTE(v2) = v2->_cinematicFramingControlsSuspended;
  os_unfair_lock_unlock(p_bufferServicingLock);
  return (char)v2;
}

- (void)setCinematicFramingControlsSuspended:(BOOL)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_cinematicFramingControlsSuspended = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BOOL)isRegionOfInterestForCameraControlsFeedbackEnabled
{
  return self->_regionOfInterestForCameraControlsEnabled;
}

- (void)setRegionOfInterestForCameraControlsFeedbackEnabled:(BOOL)a3
{
  self->_regionOfInterestForCameraControlsEnabled = a3;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor startRotatingFromPoint:](self->_vcProcessor, "startRotatingFromPoint:", x, y);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)panWithTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[VCProcessor continueRotatingToPoint:](self->_vcProcessor, "continueRotatingToPoint:", x, y);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)performOneShotFraming
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(VCProcessor *)self->_vcProcessor adjustToFrameCurrentScene];
  os_unfair_lock_unlock(p_bufferServicingLock);
  self->_oneShotFramingInFlight = 1;
}

- (void)resetFraming
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(VCProcessor *)self->_vcProcessor resetOutputCamera];
  os_unfair_lock_unlock(p_bufferServicingLock);
  self->_outputCameraResetInFlight = 1;
}

- (double)manualFramingVideoZoomFactor
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(VCProcessor *)self->_vcProcessor videoZoomFactor];
  double v5 = v4;
  os_unfair_lock_unlock(p_bufferServicingLock);
  return v5;
}

- (void)setManualFramingVideoZoomFactor:(double)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_cinematicFramingControlsSuspended)
  {
    if (dword_1E96B6CA8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    *(float *)&double v6 = a3;
    [(VCProcessor *)self->_vcProcessor setVideoZoomFactor:v6];
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)setRegionOfInterestForCameraControlsChangedHandler:(id)a3
{
  self->_regionOfInterestForCameraControlsChangedHandler = (id)[a3 copy];
}

- (id)regionOfInterestForCameraControlsChangedHandler
{
  return self->_regionOfInterestForCameraControlsChangedHandler;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  double v5 = (os_unfair_lock_s *)MEMORY[0x1F4188790](self, a2, a3, a4);
  long long v7 = v6;
  v9 = v8;
  uint64_t v10 = (uint64_t)v5;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  v11 = v5 + 34;
  os_unfair_lock_lock(v5 + 34);
  CFTypeRef cf = 0;
  int v12 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 96), "allValues"), "containsObject:", v7);
  int v13 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 112), "allValues"), "containsObject:", v7);
  int v14 = v13;
  if ((v12 & 1) == 0 && !v13)
  {
    int CopyWithNewPixelBuffer = 0;
    CFDictionaryRef v18 = 0;
    goto LABEL_67;
  }
  v15 = (void *)CMGetAttachment(v9, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (v12)
  {
    float v4 = *(void **)(v10 + 104);
    PortTypeForInputFromInputByPortTypes = (void *)BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)v7, *(void **)(v10 + 96));
    if ((unint64_t)[*(id *)(v10 + 96) count] >= 2)
    {
      BOOL v16 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F542E0]];
      if (v16)
      {
        if (([v16 BOOLValue] & 1) == 0) {
          goto LABEL_7;
        }
      }
    }
  }
  else
  {
    if (!v14)
    {
      int CopyWithNewPixelBuffer = 0;
      CFDictionaryRef v18 = 0;
      float v4 = 0;
      goto LABEL_67;
    }
    PortTypeForInputFromInputByPortTypes = 0;
    float v4 = *(void **)(v10 + 120);
  }
  if (!v4)
  {
LABEL_7:
    int CopyWithNewPixelBuffer = 0;
    CFDictionaryRef v18 = 0;
    goto LABEL_67;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v15, (const void *)*MEMORY[0x1E4F530C0]);
  memset(&v112, 0, sizeof(v112));
  CMTimeMakeFromDictionary(&v112, Value);
  if ((v12 & 1) == 0)
  {
    CFDictionaryRef v18 = 0;
    objc_super v30 = 0;
    goto LABEL_60;
  }
  CFTypeRef v20 = CMGetAttachment(v9, @"OriginalCameraIntrinsicMatrix", 0);
  if (!v20)
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  v21 = (void *)v20;
  CFDictionaryRef v18 = (const __CFDictionary *)CMGetAttachment(v9, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0);
  if (v18)
  {
    v106 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v10, "output"), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
    if (v106)
    {
      int v102 = v14;
      v104 = v4;
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v9);
      size_t Width = CVPixelBufferGetWidth(ImageBuffer);
      size_t Height = CVPixelBufferGetHeight(ImageBuffer);
      long long v25 = *(void **)(v10 + 152);
      int v26 = *(_DWORD *)(v10 + 140);
      int v27 = *(_DWORD *)(v10 + 144);
      char v28 = *(unsigned char *)(v10 + 466);
      char v29 = *(unsigned char *)(v10 + 467);
      float64x2_t v114 = *(float64x2_t *)&v112.value;
      *(void *)&long long v115 = v112.epoch;
      CFDictionaryRef v18 = (const __CFDictionary *)(id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadataIncludeMaxRadius(v15, (long long *)&v114, v25, v26, v27, v21, v18, 0, 0, v28, v29);
      if (v18)
      {
        if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue") >= *(_DWORD *)(v10 + 436))uint64_t v103 = objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC8]); {
        else
        }
          uint64_t v103 = 0;
        int v111 = 0;
        float32x2_t v110 = 0;
        int v31 = 0;
        if ((objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53FA0]), "unsignedIntValue") & 1) == 0)
        {
          bzero(&v114, 0x14A0uLL);
          int v109 = 0;
          if (FigMotionGetMotionDataFromISP((CFDictionaryRef)v15, &v114, 0, 110, &v109, &v110, 0, 0, 0))BOOL v32 = 1; {
          else
          }
            BOOL v32 = v109 <= 0;
          int v31 = !v32;
        }
        CMAttachmentBearerRef target = v9;
        float v33 = (float)Width / (float)Height;
        v34 = v11;
        if (*(unsigned char *)(v10 + 328))
        {
          CFTypeRef v35 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F52FC8], 0);
          CFTypeRef v36 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F52FC0], 0);
        }
        else
        {
          CFTypeRef v36 = 0;
          CFTypeRef v35 = 0;
        }
        uint64_t v37 = FigCaptureSensorIDFromSampleBufferMetadata(v15, *(void **)(v10 + 152));
        id v38 = objc_alloc(MEMORY[0x1E4F58F98]);
        char v39 = *(unsigned char *)(v10 + 466);
        char v40 = *(unsigned char *)(v10 + 467);
        float64x2_t v114 = *(float64x2_t *)&v112.value;
        *(void *)&long long v115 = v112.epoch;
        BYTE1(v101) = v40;
        LOBYTE(v101) = v39;
        CFDictionaryRef v41 = (const __CFDictionary *)[v38 initWithDetectedObjectsInfo:v103 calibrationData:v18 timestamp:&v114 aspectRatio:v37 sensorID:v35 filteredFaceIDs:v36 filteredBodyIDs:COERCE_DOUBLE(__PAIR64__(HIDWORD(v112.value) calibrationDistortionCoefficientsSupported:LODWORD(v33))) calibrationValidMaxRadiusSupported:v101];
        CFDictionaryRef v18 = v41;
        if (v41)
        {
          v11 = v34;
          if (v31)
          {
            LODWORD(v43) = v110.i32[1];
            LODWORD(v42) = v110.i32[0];
            LODWORD(v44) = v111;
            [(__CFDictionary *)v41 setGravityX:v42 y:v43 z:v44];
          }
          -[__CFDictionary setDeviceToCameraSpaceTransform:](v18, "setDeviceToCameraSpaceTransform:", -[BWCinematicFramingNode _getDeviceToCameraSpaceTransform:](v10, v15));
          [(__CFDictionary *)v18 setPortType:PortTypeForInputFromInputByPortTypes];
          -[__CFDictionary setCameraOrientation:](v18, "setCameraOrientation:", [*(id *)(v10 + 408) mostRecentPortraitLandscapeOrientation]);
          v45 = (void *)[*(id *)(v10 + 152) objectForKeyedSubscript:PortTypeForInputFromInputByPortTypes];
          objc_msgSend((id)objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E4F52C88]), "floatValue");
          -[__CFDictionary setAdditionalInputCameraRotation:](v18, "setAdditionalInputCameraRotation:");
          BOOL v46 = BWCaptureDevicePositionFromPortType(PortTypeForInputFromInputByPortTypes) == 2;
          char IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0]), "integerValue"));
          [(__CFDictionary *)v18 setFrontCameraHas180DegreesRotation:FigCaptureCameraRequires180DegreesRotation(v46, IsExtensionDeviceType)];
          CFStringRef v48 = (const __CFString *)*MEMORY[0x1E4F54370];
          v49 = (const void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F54370]];
          v9 = (void *)target;
          if (v49) {
            CVBufferSetAttachment(ImageBuffer, v48, v49, kCVAttachmentMode_ShouldPropagate);
          }
          [*(id *)(v10 + 320) setInputPixelBuffer:ImageBuffer];
          [*(id *)(v10 + 320) setInputMetadata:v18];
          objc_super v30 = v106;
          [*(id *)(v10 + 320) setOutputPixelBuffer:v106];
          int v50 = [*(id *)(v10 + 320) process];
          if (v50)
          {
            int CopyWithNewPixelBuffer = v50;
          }
          else
          {
            int v51 = [*(id *)(v10 + 320) finishProcessing];
            if (!v51)
            {
              if (*(void *)(v10 + 512) == 1)
              {
                if (*(unsigned char *)(v10 + 469) && *(void *)(v10 + 504))
                {
                  objc_msgSend(MEMORY[0x1E4F58FB8], "warpCGRect:fromCamera:toCamera:", objc_msgSend(*(id *)(v10 + 320), "outputCamera"), objc_msgSend(*(id *)(v10 + 320), "inputCamera"), 0.0, 0.0, 1.0, 1.0);
                  double v53 = v52;
                  double v55 = v54;
                  double v57 = v56;
                  double v59 = v58 * (double)(unint64_t)objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "width");
                  double v60 = v53 * (double)(unint64_t)objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "height");
                  double v61 = v55 * (double)(unint64_t)objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "width");
                  unint64_t v62 = objc_msgSend((id)objc_msgSend(v7, "videoFormat"), "height");
                  *(double *)(v10 + 472) = v59;
                  *(double *)(v10 + 480) = v60;
                  *(double *)(v10 + 488) = v61;
                  *(double *)(v10 + 496) = v57 * (double)v62;
                  (*(void (**)(void))(*(void *)(v10 + 504) + 16))();
                }
                CFDictionaryRef v63 = CVBufferCopyAttachments(ImageBuffer, kCVAttachmentMode_ShouldPropagate);
                if (v63)
                {
                  CFDictionaryRef v64 = (const __CFDictionary *)CFAutorelease(v63);
                  if (v64)
                  {
                    CFDictionaryRef v65 = v64;
                    v66 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v64];
                    CGColorSpaceRef ColorSpaceFromAttachments = CVImageBufferCreateColorSpaceFromAttachments(v65);
                    [v66 setObject:ColorSpaceFromAttachments forKeyedSubscript:*MEMORY[0x1E4F24A00]];

                    CVBufferSetAttachments(v106, (CFDictionaryRef)v66, kCVAttachmentMode_ShouldPropagate);
                  }
                }
              }
              CFStringRef v68 = (const __CFString *)*MEMORY[0x1E4F52FD0];
              v69 = NSNumber;
              objc_msgSend((id)objc_msgSend(*(id *)(v10 + 320), "outputCamera"), "focalLength");
              CMSetAttachment(target, v68, (CFTypeRef)objc_msgSend(v69, "numberWithFloat:"), 1u);
              if (!*(unsigned char *)(v10 + 520)) {
                goto LABEL_48;
              }
              CFStringRef v70 = (const __CFString *)*MEMORY[0x1E4F52FB8];
              v71 = NSNumber;
              objc_msgSend((id)objc_msgSend(*(id *)(v10 + 320), "outputCamera"), "stereographicFisheyeStrength");
              CMSetAttachment(target, v70, (CFTypeRef)objc_msgSend(v71, "numberWithFloat:"), 1u);
              long long v116 = 0u;
              long long v117 = 0u;
              float64x2_t v114 = 0u;
              long long v115 = 0u;
              [*(id *)(v10 + 320) getPhysicalCameraToVirtualCameraTransform];
              LODWORD(v114.f64[1]) = v72;
              DWORD2(v115) = v73;
              v114.f64[0] = v74;
              *(void *)&long long v115 = v75;
              DWORD2(v116) = v76;
              DWORD2(v117) = v77;
              *(void *)&long long v116 = v78;
              *(void *)&long long v117 = v79;
              v80 = (const void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v114 length:64];
              CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F52FB0], v80, 1u);
              if (*(unsigned char *)(v10 + 520))
              {
                CFStringRef v81 = (const __CFString *)*MEMORY[0x1E4F1F218];
              }
              else
              {
LABEL_48:
                CFStringRef v81 = (const __CFString *)*MEMORY[0x1E4F1F218];
                if (!CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F1F218], 0))
                {
LABEL_50:
                  objc_super v30 = v106;
                  if (!*(unsigned char *)(v10 + 328))
                  {
                    CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E4F52FC8]);
                    CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E4F52FC0]);
                  }
                  unsigned int v88 = objc_msgSend((id)-[__CFDictionary faceDetections](v18, "faceDetections"), "count");
                  unsigned int v89 = objc_msgSend((id)-[__CFDictionary bodyDetections](v18, "bodyDetections"), "count");
                  if (v89 <= v88) {
                    unsigned int v90 = v88;
                  }
                  else {
                    unsigned int v90 = v89;
                  }
                  int v14 = v102;
                  if (v90 > *(_DWORD *)(v10 + 416)) {
                    *(_DWORD *)(v10 + 416) = v90;
                  }
                  if (*(unsigned char *)(v10 + 440))
                  {
                    v91 = (void *)[*(id *)(v10 + 320) inputCamera];
                    v92 = (void *)[*(id *)(v10 + 320) outputCamera];
                    [*(id *)(v10 + 320) outputROI];
                    float64x2_t v114 = *(float64x2_t *)&v112.value;
                    *(void *)&long long v115 = v112.epoch;
                    -[BWCinematicFramingNode _saveCameraStatesForStillImageCaptureRequestsWithInputCamera:outputCamera:outputROI:pts:]((os_unfair_lock_s *)v10, v91, v92, &v114, v93, v94, v95, v96);
                  }
                  float v4 = v104;
LABEL_60:
                  int v97 = *(unsigned __int8 *)(v10 + 328);
                  if (v14)
                  {
                    FigCaptureCinematicFramingUpdateSampleBufferMetadata(*(void **)(v10 + 320), v9, v97 == 0);
                    int CopyWithNewPixelBuffer = 0;
                    CFTypeRef v98 = v9;
                  }
                  else
                  {
                    int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v9, v30, (CFTypeRef *)(v10 + 128), (CMSampleBufferRef *)&cf);
                    if (!cf) {
                      goto LABEL_65;
                    }
                    v99 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v9);
                    CVBufferPropagateAttachments(v99, v30);
                    FigCaptureCinematicFramingUpdateSampleBufferMetadata(*(void **)(v10 + 320), cf, v97 == 0);
                    CFTypeRef v98 = cf;
                  }
                  [v4 emitSampleBuffer:v98];
LABEL_65:
                  if (!v30) {
                    goto LABEL_67;
                  }
                  goto LABEL_66;
                }
              }
              long long v115 = 0u;
              long long v116 = 0u;
              float64x2_t v114 = 0u;
              objc_msgSend((id)objc_msgSend(*(id *)(v10 + 320), "outputCamera"), "intrinsicMatrix");
              LODWORD(v114.f64[1]) = v82;
              DWORD2(v115) = v83;
              v114.f64[0] = v84;
              *(void *)&long long v115 = v85;
              DWORD2(v116) = v86;
              *(void *)&long long v116 = v87;
              CMSetAttachment(target, v81, (CFTypeRef)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v114 length:48], 1u);
              goto LABEL_50;
            }
            int CopyWithNewPixelBuffer = v51;
          }
          FigDebugAssert3();
          float v4 = v104;
LABEL_66:
          CFRelease(v30);
          goto LABEL_67;
        }
        FigDebugAssert3();
        int CopyWithNewPixelBuffer = -12783;
        v11 = v34;
        v9 = (void *)target;
      }
      else
      {
        FigDebugAssert3();
        int CopyWithNewPixelBuffer = -12784;
      }
      float v4 = v104;
      objc_super v30 = v106;
      goto LABEL_66;
    }
    CFDictionaryRef v18 = 0;
    int CopyWithNewPixelBuffer = -12786;
  }
  else
  {
    FigDebugAssert3();
    int CopyWithNewPixelBuffer = 0;
  }
LABEL_67:
  if (cf) {
    CFRelease(cf);
  }

  if (CopyWithNewPixelBuffer)
  {
    CMSampleBufferGetPresentationTimeStamp(&v108, (CMSampleBufferRef)v9);
    id v100 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA68080 pts:&v108];
    [v4 emitDroppedSample:v100];
  }
  os_unfair_lock_unlock(v11);
}

- (double)_getDeviceToCameraSpaceTransform:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *MEMORY[0x1E4F54128];
    float v4 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    if ([v4 isEqualToString:*MEMORY[0x1E4F52DF8]])
    {
      int v5 = 1;
    }
    else
    {
      double v6 = (void *)[a2 objectForKeyedSubscript:v3];
      int v5 = [v6 isEqualToString:*MEMORY[0x1E4F52E10]];
    }
    char IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0]), "integerValue"));
    if (v5)
    {
      int v8 = FigCaptureCameraRequires180DegreesRotation(1, IsExtensionDeviceType);
      v9 = (long long *)&_PromotedConst;
      if (!v8) {
        v9 = (long long *)&_PromotedConst_232;
      }
    }
    else
    {
      v9 = &_PromotedConst_233;
    }
    long long v10 = *v9;
  }
  else
  {
    *(void *)&long long v10 = 0;
  }
  return *(double *)&v10;
}

- (void)_saveCameraStatesForStillImageCaptureRequestsWithInputCamera:(void *)a3 outputCamera:(void *)a4 outputROI:(double)a5 pts:(double)a6
{
  if (a1)
  {
    os_unfair_lock_lock(a1 + 79);
    uint64_t v16 = (uint64_t)&a1[18 * a1[78]._os_unfair_lock_opaque + 42];
    v17 = *(void **)(v16 + 8);
    if (*(void *)v16) {

    }
    if (v17) {
    uint64_t v18 = objc_msgSend(a2, "copy", *a4, a4[1], a4[2]);
    }
    uint64_t v19 = [a3 copy];
    uint64_t v20 = (uint64_t)&a1[18 * a1[78]._os_unfair_lock_opaque + 42];
    *(void *)uint64_t v20 = v18;
    *(void *)(v20 + 8) = v19;
    *(void *)(v20 + 32) = v22;
    *(_OWORD *)(v20 + 16) = v21;
    *(double *)(v20 + 40) = a5;
    *(double *)(v20 + 48) = a6;
    *(double *)(v20 + 56) = a7;
    *(double *)(v20 + 64) = a8;
    a1[78]._os_unfair_lock_opaque = (a1[78]._os_unfair_lock_opaque & 1) == 0;
    os_unfair_lock_unlock(a1 + 79);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
}

- (id)copyCameraStatesForPTS:(id *)a3
{
  p_stillCaptureQueueLock = &self->_stillCaptureQueueLock;
  os_unfair_lock_lock(&self->_stillCaptureQueueLock);
  uint64_t v6 = 0;
  long long v7 = 0;
  int v8 = 0;
  int64_t var0 = a3->var0;
  double v10 = 0.0;
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  char v12 = 1;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  while (1)
  {
    char v16 = v12;
    v17 = &self->_stillCaptureQueue[v6];
    inputCamera = v17->inputCamera;
    outputCamera = v17->outputCamera;
    int64_t value = v17->pts.value;
    CGFloat x = v17->outputROI.origin.x;
    CGFloat y = v17->outputROI.origin.y;
    CGFloat width = v17->outputROI.size.width;
    CGFloat height = v17->outputROI.size.height;
    uint64_t v25 = var0 - value;
    if (var0 == value) {
      break;
    }
    if (v25 < 0) {
      uint64_t v25 = value - var0;
    }
    if (v11 > v25)
    {
      int v8 = inputCamera;
      long long v7 = outputCamera;
      double v15 = x;
      double v14 = y;
      double v13 = width;
      double v10 = height;
      unint64_t v11 = v25;
    }
    char v12 = 0;
    uint64_t v6 = 1;
    if ((v16 & 1) == 0) {
      goto LABEL_10;
    }
  }
  int v8 = inputCamera;
  long long v7 = outputCamera;
  double v15 = x;
  double v14 = y;
  double v13 = width;
  double v10 = height;
LABEL_10:
  if (v8) {
    BOOL v26 = v7 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  if (v26) {
    return 0;
  }
  int v27 = -[VirtualCameraWarpingStates initWithInputCamera:outputCamera:outputROI:]([VirtualCameraWarpingStates alloc], v8, v7, v15, v14, v13, v10);
  os_unfair_lock_unlock(p_stillCaptureQueueLock);
  return v27;
}

- (void)_supportedOutputPixelFormats
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB02E40, *(_DWORD *)(a1 + 444)));
  int v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "allValues"), "objectAtIndexedSubscript:", 0), "videoFormat"), "pixelFormat");
  if (v3)
  {
    char IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __54__BWCinematicFramingNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    char v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v6));
  }
  return v2;
}

BOOL __54__BWCinematicFramingNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange([a2 intValue]);
}

- (NSDictionary)videoCaptureInputsByPortType
{
  return &self->_videoCaptureInputsByPortType->super;
}

- (BWNodeOutput)videoCaptureOutput
{
  return self->_videoCaptureOutput;
}

- (NSDictionary)detectionMetadataInputsByPortType
{
  return &self->_detectionMetadataInputsByPortType->super;
}

- (BWNodeOutput)detectionMetadataOutput
{
  return self->_detectionMetadataOutput;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (unsigned)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (void)setCinematicFramingControlMode:(unsigned int)a3
{
  self->_cinematicFramingControlMode = a3;
}

- (CGRect)regionOfInterestForCameraControls
{
  double x = self->_regionOfInterestForCameraControls.origin.x;
  double y = self->_regionOfInterestForCameraControls.origin.y;
  double width = self->_regionOfInterestForCameraControls.size.width;
  double height = self->_regionOfInterestForCameraControls.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end