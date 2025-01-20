@interface BWMetadataDetectorGatingNode
+ (void)initialize;
- (BWMetadataDetectedResultsObserver)appClipCodeResultsObserver;
- (BWMetadataDetectedResultsObserver)mrcResultsObserver;
- (BWMetadataDetectedResultsObserver)textLocalizationResultsObserver;
- (BWMetadataDetectorGatingNode)initWithMRCEnabled:(BOOL)a3 appClipCodeEnabled:(BOOL)a4 textLocalizationEnabled:(BOOL)a5 lowPowerModeEnabled:(BOOL)a6 compressed8BitInputEnabled:(BOOL)a7;
- (BWMetadataDetectorGatingNode)initWithSceneClassifierVersion:(id)a3 mrcEnabled:(BOOL)a4 appClipCodeEnabled:(BOOL)a5 textLocalizationEnabled:(BOOL)a6 lowPowerModeEnabled:(BOOL)a7 compressed8BitInputEnabled:(BOOL)a8;
- (BWNodeOutput)appClipCodeOutput;
- (BWNodeOutput)mrcOutput;
- (BWNodeOutput)textLocalizationOutput;
- (CVPixelBufferRef)_createOutputPixelBufferFromSbuf:(unsigned char *)a3 appliedPrimaryCaptureRect:;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_anyOutputShouldApplySceneMotion;
- (uint64_t)_anyOutputShouldRunDetection;
- (uint64_t)_ensureOutputBufferPoolWithDimensions:(uint64_t)a1;
- (uint64_t)_ensureTransferSession;
- (uint64_t)_synchronizeOutputControllersWhenApplicable;
- (uint64_t)_updateInputRequirements:(uint64_t)result;
- (uint64_t)_updateOutputRequirementsIfNecessary;
- (void)_updateNodeOutputPassthroughMode:(void *)result;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)sceneDidChangeQRConfidence:(float)a3 appClipCodeConfidence:(float)a4 documentConfidence:(float)a5 textConfidence:(float)a6;
@end

@implementation BWMetadataDetectorGatingNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWMetadataDetectorGatingNode;
  [(BWFanOutNode *)&v7 didSelectFormat:a3 forInput:a4];
  if (self) {
    v6 = &unk_1EFB03680;
  }
  else {
    v6 = 0;
  }
  if (objc_msgSend(v6, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"))))
  {
    [(BWNodeInput *)self->super.super._input setPassthroughMode:1];
    -[BWMetadataDetectorGatingNode _updateNodeOutputPassthroughMode:](self, 1);
  }
  -[BWMetadataDetectorGatingNode _updateOutputRequirementsIfNecessary]((uint64_t)self);
}

- (uint64_t)_updateOutputRequirementsIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (id *)result;
    result = [*(id *)(result + 8) passthroughMode];
    if (!result)
    {
      result = [v1[1] videoFormat];
      if (result)
      {
        v2 = (void *)result;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v9 = 0u;
        long long v10 = 0u;
        id obj = (id)[v1 outputs];
        result = [obj countByEnumeratingWithState:&v9 objects:v14 count:16];
        if (result)
        {
          uint64_t v3 = result;
          uint64_t v4 = *(void *)v10;
          do
          {
            uint64_t v5 = 0;
            do
            {
              if (*(void *)v10 != v4) {
                objc_enumerationMutation(obj);
              }
              v6 = (void *)[*(id *)(*((void *)&v9 + 1) + 8 * v5) formatRequirements];
              v8[0] = MEMORY[0x1E4F143A8];
              v8[1] = 3221225472;
              v8[2] = __68__BWMetadataDetectorGatingNode__updateOutputRequirementsIfNecessary__block_invoke;
              v8[3] = &unk_1E5C28D08;
              v8[4] = v2;
              objc_msgSend(v6, "setSupportedPixelFormats:", objc_msgSend(&unk_1EFB03680, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v8)));
              objc_msgSend(v6, "setWidth:", objc_msgSend(v2, "width"));
              objc_msgSend(v6, "setHeight:", objc_msgSend(v2, "height"));
              uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "colorSpaceProperties"));
              objc_msgSend(v6, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v13, 1));
              ++v5;
            }
            while (v3 != v5);
            result = [obj countByEnumeratingWithState:&v9 objects:v14 count:16];
            uint64_t v3 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (id)nodeType
{
  return @"Demuxer";
}

- (BWMetadataDetectedResultsObserver)textLocalizationResultsObserver
{
  return (BWMetadataDetectedResultsObserver *)self->_textLocalizationOutputController;
}

- (BWNodeOutput)textLocalizationOutput
{
  return self->_textLocalizationOutput;
}

- (BWMetadataDetectedResultsObserver)mrcResultsObserver
{
  return (BWMetadataDetectedResultsObserver *)self->_mrcOutputController;
}

- (BWNodeOutput)mrcOutput
{
  return self->_mrcOutput;
}

- (BWMetadataDetectedResultsObserver)appClipCodeResultsObserver
{
  return (BWMetadataDetectedResultsObserver *)self->_appClipCodeOutputController;
}

- (BWNodeOutput)appClipCodeOutput
{
  return self->_appClipCodeOutput;
}

- (uint64_t)_anyOutputShouldApplySceneMotion
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    v1 = *(void **)(result + 184);
    result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v6;
      while (2)
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          if ([*(id *)(*((void *)&v5 + 1) + 8 * v4) shouldApplySceneMotion]) {
            return 1;
          }
          ++v4;
        }
        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        uint64_t v2 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (BWMetadataDetectorGatingNode)initWithSceneClassifierVersion:(id)a3 mrcEnabled:(BOOL)a4 appClipCodeEnabled:(BOOL)a5 textLocalizationEnabled:(BOOL)a6 lowPowerModeEnabled:(BOOL)a7 compressed8BitInputEnabled:(BOOL)a8
{
  unsigned int v8 = a8;
  long long v9 = [(BWMetadataDetectorGatingNode *)self initWithMRCEnabled:a4 appClipCodeEnabled:a5 textLocalizationEnabled:a6 lowPowerModeEnabled:a7 compressed8BitInputEnabled:a8];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_sceneLock._os_unfair_lock_opaque = 0;
    v9->_needsSynchronization = 0;
    mrcOutputController = v9->_mrcOutputController;
    if (mrcOutputController)
    {
      [(BWMetadataDetectorGatingOutputController *)mrcOutputController setUsesSceneClassifierToGateDetection:1];
      [(BWMetadataDetectorGatingOutputController *)v10->_mrcOutputController setLogger:[[FigCaptureLogSmartCameraGating alloc] initWithGateIdentifier:0]];
      BWSmartCameraSceneInitialize((uint64_t)&v10->_qrCodeScene, 1, 0, 2, (uint64_t)"QR", 0.06, 0.05, 0.75);
    }
    appClipCodeOutputController = v10->_appClipCodeOutputController;
    if (appClipCodeOutputController)
    {
      [(BWMetadataDetectorGatingOutputController *)appClipCodeOutputController setUsesSceneClassifierToGateDetection:1];
      [(BWMetadataDetectorGatingOutputController *)v10->_appClipCodeOutputController setLogger:[[FigCaptureLogSmartCameraGating alloc] initWithGateIdentifier:1]];
      BWSmartCameraSceneInitialize((uint64_t)&v10->_appClipCodeScene, 1, 0, 2, (uint64_t)"AppClipCode", 0.108, 0.05, 0.75);
    }
    textLocalizationOutputController = v10->_textLocalizationOutputController;
    if (textLocalizationOutputController)
    {
      [(BWMetadataDetectorGatingOutputController *)textLocalizationOutputController setUsesSceneClassifierToGateDetection:1];
      [(BWMetadataDetectorGatingOutputController *)v10->_textLocalizationOutputController setLogger:[[FigCaptureLogSmartCameraGating alloc] initWithGateIdentifier:2]];
      BWSmartCameraSceneInitialize((uint64_t)&v10->_textScene, 1, 0, 2, (uint64_t)"TextScene", 0.091, 0.05, 0.75);
    }
    -[BWMetadataDetectorGatingNode _updateInputRequirements:]((uint64_t)v10, v8);
  }
  return v10;
}

- (BWMetadataDetectorGatingNode)initWithMRCEnabled:(BOOL)a3 appClipCodeEnabled:(BOOL)a4 textLocalizationEnabled:(BOOL)a5 lowPowerModeEnabled:(BOOL)a6 compressed8BitInputEnabled:(BOOL)a7
{
  if (a3) {
    int v7 = 2;
  }
  else {
    int v7 = 1;
  }
  if (!a4) {
    int v7 = a3;
  }
  uint64_t v8 = (v7 + a5);
  if (!(v7 + a5)) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"No detectors enabled", 0, a6, a7));
  }
  unsigned int v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  unsigned int v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BWMetadataDetectorGatingNode;
  v14 = [(BWFanOutNode *)&v19 initWithFanOutCount:v8 mediaType:1986618469];
  if (v14)
  {
    v14->_sceneStabilityMonitor = objc_alloc_init(BWSceneStabilityMonitor);
    v14->_outputControllers = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    v14->_detectorsAvailableGroup = (OS_dispatch_group *)dispatch_group_create();
    if (v13)
    {
      v14->_mrcOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v14 outputs] objectAtIndexedSubscript:0];
      uint64_t v15 = [[BWMetadataDetectorGatingOutputController alloc] initWithOutput:v14->_mrcOutput name:@"MRC Output Controller" sceneStabilityMonitor:v14->_sceneStabilityMonitor detectorAvailableGroup:v14->_detectorsAvailableGroup];
      v14->_mrcOutputController = v15;
      [(BWMetadataDetectorGatingOutputController *)v15 setLowPowerModeEnabled:v10];
      unsigned int v13 = 1;
      [(BWMetadataDetectorGatingOutputController *)v14->_mrcOutputController setSceneMotionEstimatesSupported:1];
      [(BWMetadataDetectorGatingOutputController *)v14->_mrcOutputController setShouldEmitFirstBufferAfterSceneChange:1];
      [(BWMetadataDetectorGatingOutputController *)v14->_mrcOutputController setSynchronizeWithOtherControllers:1];
      [(NSMutableArray *)v14->_outputControllers addObject:v14->_mrcOutputController];
      if (!v12) {
        goto LABEL_13;
      }
    }
    else if (!v12)
    {
LABEL_13:
      if (v11)
      {
        v14->_textLocalizationOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v14 outputs] objectAtIndexedSubscript:v13];
        v17 = [[BWMetadataDetectorGatingOutputController alloc] initWithOutput:v14->_textLocalizationOutput name:@"Text Localization Output Controller" sceneStabilityMonitor:v14->_sceneStabilityMonitor detectorAvailableGroup:v14->_detectorsAvailableGroup];
        v14->_textLocalizationOutputController = v17;
        [(BWMetadataDetectorGatingOutputController *)v17 setLowPowerModeEnabled:v10];
        [(NSMutableArray *)v14->_outputControllers addObject:v14->_textLocalizationOutputController];
      }
      -[BWMetadataDetectorGatingNode _updateInputRequirements:]((uint64_t)v14, v9);
      [(BWNodeInput *)v14->super.super._input setPassthroughMode:0];
      -[BWMetadataDetectorGatingNode _updateNodeOutputPassthroughMode:](v14, 0);
      v14->_lowPowerModeEnabled = v10;
      v14->_needsSynchronization = 1;
      return v14;
    }
    v14->_appClipCodeOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v14 outputs] objectAtIndexedSubscript:v13];
    v16 = [[BWMetadataDetectorGatingOutputController alloc] initWithOutput:v14->_appClipCodeOutput name:@"AppClipCode Output Controller" sceneStabilityMonitor:v14->_sceneStabilityMonitor detectorAvailableGroup:v14->_detectorsAvailableGroup];
    v14->_appClipCodeOutputController = v16;
    [(BWMetadataDetectorGatingOutputController *)v16 setLowPowerModeEnabled:v10];
    [(BWMetadataDetectorGatingOutputController *)v14->_appClipCodeOutputController setSynchronizeWithOtherControllers:1];
    [(NSMutableArray *)v14->_outputControllers addObject:v14->_appClipCodeOutputController];
    ++v13;
    goto LABEL_13;
  }
  return v14;
}

- (void)_updateNodeOutputPassthroughMode:(void *)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v3 = objc_msgSend(result, "outputs", 0);
    result = (void *)[v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        long long v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setPassthroughMode:a2];
          long long v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        result = (void *)[v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_updateInputRequirements:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (id *)result;
    uint64_t v4 = (void *)[*(id *)(result + 8) formatRequirements];
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    [v5 addObjectsFromArray:&unk_1EFB03680];
    if (([v3[20] usesSceneClassifierToGateDetection] & 1) != 0
      || ([v3[21] usesSceneClassifierToGateDetection] & 1) != 0)
    {
      int v6 = 1;
    }
    else
    {
      int v6 = [v3[22] usesSceneClassifierToGateDetection];
    }
    objc_msgSend(v5, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(1, 0, 1, 1, 0, v6, 1, 1));
    objc_msgSend(v5, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, 3, 1, 1, 0, v6 | a2, 1, 1));
    [v5 addObjectsFromArray:&unk_1EFB03698];
    return [v4 setSupportedPixelFormats:v5];
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)BWMetadataDetectorGatingNode;
  [(BWNode *)&v16 prepareForCurrentConfigurationToBecomeLive];
  uint64_t v3 = [(BWVideoFormat *)[(BWNodeInput *)self->super.super._input videoFormat] pixelFormat];
  if (self) {
    uint64_t v4 = &unk_1EFB03680;
  }
  else {
    uint64_t v4 = 0;
  }
  if (!objc_msgSend(v4, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3))|| -[BWVideoFormat cacheMode](-[BWNodeInput videoFormat](self->super.super._input, "videoFormat"), "cacheMode") == 1792)
  {
    -[BWMetadataDetectorGatingNode _ensureTransferSession]((uint64_t)self);
  }
  if (self->_mrcOutputController)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (self->_lowPowerModeEnabled)
    {
      int v6 = 5;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 10.0));
        --v6;
      }
      while (v6);
      int v7 = 5;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 7.5));
        --v7;
      }
      while (v7);
      uint64_t v8 = 5;
    }
    else
    {
      int v9 = 15;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 15.0));
        --v9;
      }
      while (v9);
      LODWORD(v8) = 15;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 7.5));
        uint64_t v8 = (v8 - 1);
      }
      while (v8);
    }
    objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 5.0));
    [(BWMetadataDetectorGatingOutputController *)self->_mrcOutputController enableDetectionFrameRateControllingWithRamp:v5 startIndex:v8];
  }
  if (self->_appClipCodeOutputController)
  {
    long long v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    int v11 = 5;
    if (+[BWInferenceEngine isNeuralEngineSupported])
    {
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 10.0));
        --v11;
      }
      while (v11);
      int v12 = 5;
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 7.5));
        --v12;
      }
      while (v12);
      double v13 = 5.0;
    }
    else
    {
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 10.0));
        --v11;
      }
      while (v11);
      int v14 = 5;
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", 2.0));
        --v14;
      }
      while (v14);
      double v13 = 1.0;
    }
    objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v13));
    [(BWMetadataDetectorGatingOutputController *)self->_appClipCodeOutputController enableDetectionFrameRateControllingWithRamp:v10 startIndex:5];
  }
  textLocalizationOutputController = self->_textLocalizationOutputController;
  if (textLocalizationOutputController)
  {
    v17[0] = [NSNumber numberWithDouble:5.5];
    -[BWMetadataDetectorGatingOutputController enableDetectionFrameRateControllingWithRamp:startIndex:](textLocalizationOutputController, "enableDetectionFrameRateControllingWithRamp:startIndex:", [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1], 0);
  }
}

- (uint64_t)_ensureTransferSession
{
  if (!a1 || *(void *)(a1 + 216)) {
    return 0;
  }
  uint64_t v1 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)(a1 + 216));
  if (v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v1;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (self->_needsSynchronization) {
    -[BWMetadataDetectorGatingNode _synchronizeOutputControllersWhenApplicable]((uint64_t)self);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  outputControllers = self->_outputControllers;
  uint64_t v7 = [(NSMutableArray *)outputControllers countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(outputControllers);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) prepareToEmitBuffer:a3];
      }
      uint64_t v8 = [(NSMutableArray *)outputControllers countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }
  unsigned __int8 v35 = 0;
  CVPixelBufferRef v11 = -[BWMetadataDetectorGatingNode _createOutputPixelBufferFromSbuf:appliedPrimaryCaptureRect:]((uint64_t)self, a3, &v35);
  if (v11)
  {
    int v12 = v11;
    long long v33 = 0uLL;
    uint64_t v34 = 0;
    BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&v33);
    CFTypeRef v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    sceneStabilityMonitor = self->_sceneStabilityMonitor;
    uint64_t ShouldApplyScene = -[BWMetadataDetectorGatingNode _anyOutputShouldApplySceneMotion]((uint64_t)self);
    long long v31 = v33;
    uint64_t v32 = v34;
    [(BWSceneStabilityMonitor *)sceneStabilityMonitor calculateStabilityWithPixelBuffer:v12 pts:&v31 metadataDictionary:v13 forceSceneMotion:ShouldApplyScene];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    objc_super v16 = self->_outputControllers;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      int v20 = v35;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v22 = *(BWMetadataDetectorGatingOutputController **)(*((void *)&v27 + 1) + 8 * j);
          if ([(BWMetadataDetectorGatingOutputController *)v22 shouldEmitBuffer])
          {
            if (v22 == self->_textLocalizationOutputController)
            {
              CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
              v24 = v22;
              v26 = a3;
              BOOL v23 = 0;
            }
            else
            {
              BOOL v23 = v20 != 0;
              v24 = v22;
              CVImageBufferRef ImageBuffer = v12;
              v26 = a3;
            }
            [(BWMetadataDetectorGatingOutputController *)v24 emitPixelBuffer:ImageBuffer inputSampleBuffer:v26 appliedPrimaryCaptureRect:v23];
          }
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v40 count:16];
      }
      while (v18);
    }
    CFRelease(v12);
  }
}

- (uint64_t)_anyOutputShouldRunDetection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    uint64_t v1 = *(void **)(result + 184);
    result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v6;
      while (2)
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          if ([*(id *)(*((void *)&v5 + 1) + 8 * v4) shouldRunDetection]) {
            return 1;
          }
          ++v4;
        }
        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        uint64_t v2 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (CVPixelBufferRef)_createOutputPixelBufferFromSbuf:(unsigned char *)a3 appliedPrimaryCaptureRect:
{
  if (!a1) {
    return 0;
  }
  *a3 = 0;
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v6;
  CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
  CGRectMakeWithDictionaryRepresentation(v7, &rect);
  if ([*(id *)(a1 + 168) shouldRunDetection]
    && !CGRectIsNull(rect)
    && -[BWMetadataDetectorGatingNode _ensureTransferSession](a1))
  {
    goto LABEL_26;
  }
  if ((-[BWMetadataDetectorGatingNode _anyOutputShouldRunDetection](a1) & 1) == 0
    && !-[BWMetadataDetectorGatingNode _anyOutputShouldApplySceneMotion](a1)
    || !*(void *)(a1 + 216))
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    return CVPixelBufferRetain(ImageBuffer);
  }
  long long v8 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  int Width = CVPixelBufferGetWidth(v8);
  size_t Height = CVPixelBufferGetHeight(v8);
  if (!CGRectIsNull(rect))
  {
    double v11 = (double)Width;
    double v12 = (double)(int)Height;
    FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    rect.origin.x = v13;
    rect.origin.y = v14;
    double v17 = round(v16 * 0.5);
    double v18 = v17 + v17;
    if (v18 < (double)Width) {
      double v11 = v18;
    }
    double v19 = round(v15 * 0.5);
    double v20 = v19 + v19;
    if (v20 < v12) {
      double v12 = v20;
    }
    rect.size.width = v11;
    rect.size.height = v12;
    double v21 = v11;
    double v22 = v12;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&v13);
    OSStatus v24 = VTSessionSetProperty(*(VTSessionRef *)(a1 + 216), (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
    if (v24) {
      goto LABEL_26;
    }
    int Width = (int)v11;
    size_t Height = (int)v12;
  }
  if (-[BWMetadataDetectorGatingNode _ensureOutputBufferPoolWithDimensions:](a1, Width | (Height << 32)))
  {
LABEL_26:
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = 0;
    goto LABEL_27;
  }
  v25 = (__CVBuffer *)[*(id *)(a1 + 224) newPixelBuffer];
  if (!v25)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v25;
  }
  if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 216), v8, v25))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_27:
    CVPixelBufferRelease(v25);
    return 0;
  }
  *a3 = 1;
  return v25;
}

+ (void)initialize
{
}

- (void)dealloc
{
  transferSession = self->_transferSession;
  if (transferSession) {
    CFRelease(transferSession);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWMetadataDetectorGatingNode;
  [(BWFanOutNode *)&v4 dealloc];
}

- (id)nodeSubType
{
  return @"MetadataDetectorGating";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  transferSession = self->_transferSession;
  if (transferSession)
  {
    CFRelease(transferSession);
    self->_transferSession = 0;
  }

  self->_outputBufferPool = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWMetadataDetectorGatingNode;
  [(BWFanOutNode *)&v6 didReachEndOfDataForInput:a3];
}

- (uint64_t)_synchronizeOutputControllersWhenApplicable
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v4 = *(void **)(v1 + 184);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v5) {
    goto LABEL_23;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if ([v10 synchronizeWithOtherControllers])
      {
        if ([v10 forceSynchronizedControllersToRunDetectionImmediately])
        {
          char v7 = 1;
          double v11 = v3;
LABEL_10:
          [v11 addObject:v10];
          continue;
        }
        if (([v10 usesSceneClassifierToGateDetection] & 1) == 0)
        {
          uint64_t v12 = [v10 lastDetectedCodesCount];
          double v11 = v2;
          if (!v12) {
            goto LABEL_10;
          }
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
  }
  while (v6);
  if (v7)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = [v2 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      long long v22 = *MEMORY[0x1E4F1F9F8];
      uint64_t v16 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v2);
          }
          double v18 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          long long v27 = v22;
          uint64_t v28 = v16;
          objc_msgSend(v18, "setLastDetectionPTS:", &v27, v22);
        }
        uint64_t v14 = [v2 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v14);
    }
  }
LABEL_23:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  result = [v3 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v21++) setForceSynchronizedControllersToRunDetectionImmediately:0];
      }
      while (v19 != v21);
      result = [v3 countByEnumeratingWithState:&v23 objects:v37 count:16];
      uint64_t v19 = result;
    }
    while (result);
  }
  return result;
}

- (void)sceneDidChangeQRConfidence:(float)a3 appClipCodeConfidence:(float)a4 documentConfidence:(float)a5 textConfidence:(float)a6
{
  if ([(BWMetadataDetectorGatingOutputController *)self->_mrcOutputController usesSceneClassifierToGateDetection]|| [(BWMetadataDetectorGatingOutputController *)self->_appClipCodeOutputController usesSceneClassifierToGateDetection]|| [(BWMetadataDetectorGatingOutputController *)self->_textLocalizationOutputController usesSceneClassifierToGateDetection])
  {
    os_unfair_lock_lock(&self->_sceneLock);
    BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_qrCodeScene, a3);
    BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_appClipCodeScene, a4);
    BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_textScene, a6);
    BOOL confident = self->_qrCodeScene.confident;
    BOOL v11 = self->_appClipCodeScene.confident;
    BOOL v12 = self->_textScene.confident;
    os_unfair_lock_unlock(&self->_sceneLock);
    [(BWMetadataDetectorGatingOutputController *)self->_mrcOutputController setSmartCameraSceneConfident:confident];
    [(BWMetadataDetectorGatingOutputController *)self->_appClipCodeOutputController setSmartCameraSceneConfident:v11];
    textLocalizationOutputController = self->_textLocalizationOutputController;
    [(BWMetadataDetectorGatingOutputController *)textLocalizationOutputController setSmartCameraSceneConfident:v12];
  }
}

uint64_t __68__BWMetadataDetectorGatingNode__updateOutputRequirementsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  int IsFullRange = FigCapturePixelFormatIsFullRange([*(id *)(a1 + 32) pixelFormat]);
  return IsFullRange ^ FigCapturePixelFormatIsFullRange([a2 intValue]) ^ 1;
}

- (uint64_t)_ensureOutputBufferPoolWithDimensions:(uint64_t)a1
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v4 = HIDWORD(a2);
  if (*(void *)(a1 + 232) == a2) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x1A6272C70]();
  char v7 = (__CFString *)[(id)a1 name];
  uint64_t v8 = objc_alloc_init(BWVideoFormatRequirements);
  if (FigCapturePixelFormatIsFullRange(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat"))) {
    uint64_t v9 = 875704422;
  }
  else {
    uint64_t v9 = 875704438;
  }
  [(BWVideoFormatRequirements *)v8 setWidth:(int)a2];
  [(BWVideoFormatRequirements *)v8 setHeight:a2 >> 32];
  v16[0] = [NSNumber numberWithUnsignedInt:v9];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1]);
  uint64_t v15 = v8;
  id v10 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1]);
  if (v10)
  {
    id v11 = v10;
    if (!v7) {
      char v7 = @"MRC PixelTransfer";
    }

    if (*(unsigned char *)(a1 + 192)) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    uint64_t v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v11, v12, v7, [*(id *)(a1 + 16) memoryPool]);
    uint64_t v5 = 0;
    *(void *)(a1 + 224) = v13;
    *(_DWORD *)(a1 + 232) = a2;
    *(_DWORD *)(a1 + 236) = v4;
  }
  else
  {
    uint64_t v5 = FigSignalErrorAt();
  }
  return v5;
}

@end