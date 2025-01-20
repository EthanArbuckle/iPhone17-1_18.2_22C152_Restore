@interface BWStillImageCoordinatorNode
+ ($07919FF52A1CF34B835B8E07CC3CE49A)worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:(SEL)a3 stillImageCaptureSettings:(id)a4 captureDevice:(id)a5;
+ (int)currentAllocatedShotBufferCapacity;
+ (int)maxShotBufferCapacity;
+ (int)numberOfUltraHighResBufferIncludedInShotBuffer;
+ (int)numberOfZoomBasedBufferIncludedInShotBuffer;
+ (void)initialize;
+ (void)setCurrentAllocatedShotBufferCapacity:(int)a3;
+ (void)setMaxShotBufferCapacity:(int)a3;
+ (void)setNumberOfUltraHighResBufferIncludedInShotBuffer:(int)a3;
+ (void)setNumberOfZoomBasedBufferIncludedInShotBuffer:(int)a3;
- (BOOL)_capturedAllFrames;
- (BOOL)_speedOverQualityCaptureEnabled;
- (BOOL)_waitUntilShotBufferHasEnoughFreeBuffersWithTimeout:(float)a3 freeBufferCountOut:;
- (BOOL)cinematicFramingWarpingRequired;
- (BOOL)fastCapturePrioritizationEnabled;
- (BOOL)responsiveShutterEnabled;
- (BWPhotoManifest)_resolvePhotoManifest;
- (BWStillImageCaptureStatusDelegate)stillImageCaptureStatusDelegate;
- (BWStillImageCoordinatorNode)initWithCaptureDevice:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5 highResStillImageDimensions:(id)a6;
- (BWStillImageProcessingSettings)_resolveProcessingSettings;
- (BWStillImageProcessingSupportProvider)stillImageProcessingSupportProvider;
- (BWStillImageSettings)_currentStillImageSettings;
- (id)_initWithCaptureDevice:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5 highResStillImageDimensions:(id)a6 allStateTransitionsHandler:(id)a7;
- (id)_stateMachine;
- (id)_stillImageDispatchQueue;
- (id)compressedShotBuffer;
- (id)inputForPortType:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)outputForPortType:(id)a3;
- (id)sensorRawInputForPortType:(id)a3;
- (id)sensorRawOutputForPortType:(id)a3;
- (int)_enqueueRequestWithSettings:(id)a3 serviceRequestsIfNecessary:(BOOL)a4;
- (int)beginStillImageMomentCaptureWithSettings:(id)a3;
- (int)cancelStillImageMomentCaptureWithSettingsID:(int64_t)a3;
- (int)captureStillImageNowWithSettings:(id)a3;
- (int)commitStillImageMomentCaptureWithSettings:(id)a3;
- (int)initiateStillImageCaptureNowWithSettings:(id)a3;
- (int)prepareStillImageCaptureNowWithSettings:(id)a3;
- (int)stillImageCapturePipeliningMode;
- (uint64_t)_beginInitiatingCapture;
- (uint64_t)_beginMomentCapture;
- (uint64_t)_beginResolvingCapture;
- (uint64_t)_cancelMomentCaptureIfNeeded;
- (uint64_t)_didResolveReferenceFrameBracketedCaptureSequenceNumber:(uint64_t)result;
- (uint64_t)_didSelectNewReferenceFrameWithPTS:(uint64_t)a3 transform:(uint64_t)a4 forSettings:;
- (uint64_t)_ensureDeviceOrientationMonitor;
- (uint64_t)_expectedFrameCountForCurrentRequest;
- (uint64_t)_expectedFrameCountForNextRequest;
- (uint64_t)_fireDelegateCallbackWithInfo:(uint64_t)result;
- (uint64_t)_maxShotBufferCapacityForCurrentRequestWithBufferCount:(int)a3 ultraHighResBufferCount:;
- (uint64_t)_receivedFrameOrErrorCountForCurrentRequest;
- (uint64_t)_setupProcessing;
- (uint64_t)_setupStateMachineWithAllStateTransitionsHandler:(uint64_t)result;
- (uint64_t)_ultraHighResBufferCountForCurrentSettings;
- (uint64_t)_updateResponsiveShutterEnabled;
- (uint64_t)_waitToMakePaceWithReferenceTime:(uint64_t)result;
- (uint64_t)_zoomBasedBufferCountForCurrentSettings;
- (unsigned)maxNumberOfBurstCapturesAllowedInFlight;
- (void)_attemptToCompleteRequest;
- (void)_beginCapture;
- (void)_beginPreparingCapture;
- (void)_beginUncommittedMomentCapture;
- (void)_cancelMomentCapture;
- (void)_commitMomentCapture;
- (void)_completeRequestWithStatus:(uint64_t)a1;
- (void)_configureCurrentCaptureRequestStateForFigCaptureStillImageSettings;
- (void)_didCaptureStillImage;
- (void)_didResolveStillImagePTS:(uint64_t)a3 isPreBracketedEV0:;
- (void)_fireDelegateCallbackWithFlag:(uint64_t)a1;
- (void)_flushStillImageRequestWithError:(uint64_t)a1;
- (void)_readyToRespondToRequest;
- (void)_renderSampleBuffer:(void *)a3 forInput:(int)a4 attemptToCompleteRequest:;
- (void)_serviceNextRequest;
- (void)_stoppedUsingBufferWithSensorRawHighResolutionFlavor:(uint64_t)a1;
- (void)_unpackNextRequest;
- (void)captureStream:(id)a3 didCapturePreBracketedEV0ImageWithPTS:(id *)a4;
- (void)captureStream:(id)a3 didCaptureReferenceFrameWithPTS:(id *)a4 referenceFrameBracketedCaptureSequenceNumber:(id)a5;
- (void)captureStream:(id)a3 stillImageCaptureError:(int)a4;
- (void)captureStreamDidCompleteStillImageCapture:(id)a3;
- (void)captureStreamWillBeginStillImageCapture:(id)a3;
- (void)captureStreamWillWaitForTimeMachineToFill:(id)a3;
- (void)clientReceivedPayloadForSettings:(id)a3 status:(int)a4 clientIsMidStillImageGraph:(BOOL)a5;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)node:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 forSettings:(id)a6;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setCinematicFramingWarpingRequired:(BOOL)a3;
- (void)setCompressedShotBuffer:(id)a3;
- (void)setFastCapturePrioritizationEnabled:(BOOL)a3;
- (void)setMaxNumberOfBurstCapturesAllowedInFlight:(unsigned int)a3;
- (void)setResponsiveShutterEnabled:(BOOL)a3;
- (void)setResponsiveShutterEnabledViaAPI:(BOOL)a3;
- (void)setStillImageCapturePipeliningMode:(int)a3;
- (void)setStillImageCaptureStatusDelegate:(id)a3;
- (void)setStillImageProcessingSupportProvider:(id)a3;
- (void)willStopGraph:(BOOL)a3;
@end

@implementation BWStillImageCoordinatorNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs", a3), "objectAtIndexedSubscript:", [a4 index]);
  uint64_t v6 = [a4 format];
  [v5 setFormat:v6];
}

+ ($07919FF52A1CF34B835B8E07CC3CE49A)worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:(SEL)a3 stillImageCaptureSettings:(id)a4 captureDevice:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    BOOL v10 = [a4 HDRMode] != 0;
    BOOL v11 = [a4 digitalFlashMode] != 0;
    uint64_t v12 = [a4 qualityPrioritization];
  }
  else
  {
    uint64_t v12 = 2;
    BOOL v11 = 1;
    BOOL v10 = 1;
  }
  int v13 = objc_msgSend(a6, "maxStillImageCaptureBufferCountForHDRMode:digitalFlashMode:qualityPrioritization:clientBracketCount:bravoConstituentImageDeliveryDeviceTypes:", v10, v11, v12, objc_msgSend(a4, "bracketedImageCount"), objc_msgSend(a4, "bravoConstituentImageDeliveryDeviceTypes"));
  *(void *)&retstr->var0 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var4 = 0;
  id v39 = a5;
  if (!a5)
  {
    if ([a6 softISPEnabled])
    {
      HIDWORD(v42) = 0;
      retstr->var0 = v13;
      retstr->var1 = v13;
      int v18 = v13;
      int v17 = v13;
      int v28 = v13;
      retstr->var3 = v13;
LABEL_25:
      id v27 = a2;
      goto LABEL_31;
    }
LABEL_26:
    int v18 = 0;
    id v27 = a2;
    goto LABEL_28;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)[a5 captureStreamSettings];
  uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v14)
  {
    if ([a6 softISPEnabled])
    {
      [a6 sensorRawStillImageOutputsEnabled];
      int v18 = 0;
      int v17 = 0;
      HIDWORD(v42) = 0;
      int v28 = 0;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  uint64_t v15 = v14;
  int v38 = v13;
  id v16 = a6;
  int v17 = 0;
  uint64_t v42 = 0;
  int v18 = 0;
  uint64_t v19 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      v21 = retstr;
      if (*(void *)v44 != v19) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      unint64_t v23 = [v22 expectedFrameCaptureCounts];
      int v25 = v24;
      unint64_t v26 = HIDWORD(v23);
      v18 += v23;
      v21->var0 = v18;
      if (objc_msgSend(v16, "isPortTypeUsingZoomBasedSourceSensorRaws:", objc_msgSend(v22, "portType")))
      {
        HIDWORD(v42) += v26;
        v21->var2 = HIDWORD(v42);
      }
      else
      {
        LODWORD(v42) = v42 + v26;
        v21->var1 = v42;
      }
      retstr = v21;
      v17 += v25;
      v21->var3 = v17;
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v15);
  a6 = v16;
  id v27 = a2;
  if ([v16 softISPEnabled])
  {
    if ([v16 sensorRawStillImageOutputsEnabled])
    {
      int v28 = v42;
      if (v18)
      {
        if (v18 <= 2) {
          int v18 = 2;
        }
        retstr->var0 = v18;
      }
    }
    else
    {
      int v28 = v42;
    }
    goto LABEL_31;
  }
  int v13 = v38;
LABEL_28:
  int v17 = 0;
  HIDWORD(v42) = 0;
  int v28 = 0;
  if (v13 > v18) {
    int v18 = v13;
  }
  retstr->var0 = v18;
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
LABEL_31:
  if ((int)[v27 maxShotBufferCapacity] >= 1)
  {
    int v29 = [v27 currentAllocatedShotBufferCapacity];
    id v30 = a6;
    if (v29 >= (int)[v27 maxShotBufferCapacity]) {
      int v31 = [v27 maxShotBufferCapacity];
    }
    else {
      int v31 = [v27 currentAllocatedShotBufferCapacity];
    }
    int v32 = v31;
    int v33 = [v27 numberOfZoomBasedBufferIncludedInShotBuffer];
    int v34 = [v27 numberOfUltraHighResBufferIncludedInShotBuffer];
    self;
    int v35 = sUltraHighResFrameCountExpansionFactor * v34;
    if ([v30 softISPEnabled])
    {
      if (v39)
      {
        if ([v30 sensorRawStillImageOutputsEnabled])
        {
          if (v28 > 0 || SHIDWORD(v42) > 0 || v17 >= 1)
          {
            int v28 = v32 - v33 - v35;
            retstr->var1 = v28;
            retstr->var2 = v33;
            retstr->var3 = v34;
          }
          if (v18 >= 1)
          {
            if (v32 - v35 <= 2) {
              int v18 = 2;
            }
            else {
              int v18 = v32 - v35;
            }
            retstr->var0 = v18;
          }
        }
      }
      else
      {
        int v28 = v32 - v35;
        retstr->var0 = v32 - v35;
        retstr->var1 = v32 - v35;
        *(void *)&retstr->var2 = 0;
        int v18 = v32 - v35;
      }
    }
    else
    {
      int v28 = 0;
      if (v32 - v35 <= 2) {
        int v18 = 2;
      }
      else {
        int v18 = v32 - v35;
      }
      retstr->var0 = v18;
      retstr->var1 = 0;
      *(void *)&retstr->var2 = 0;
    }
    a6 = v30;
  }
  result = ($07919FF52A1CF34B835B8E07CC3CE49A *)[a6 pearlInfraredCaptureStream];
  if (result)
  {
    if (v18 <= v28) {
      int v37 = v28;
    }
    else {
      int v37 = v18;
    }
    retstr->var4 = v37;
  }
  return result;
}

+ (int)maxShotBufferCapacity
{
  return sMaxShotBufferCapacity;
}

+ (int)currentAllocatedShotBufferCapacity
{
  return sCurrentAllocatedShotBufferCapacity;
}

+ (int)numberOfZoomBasedBufferIncludedInShotBuffer
{
  return sNumberOfZoomBasedBufferIncludedInShotBuffer;
}

+ (int)numberOfUltraHighResBufferIncludedInShotBuffer
{
  return sNumberOfUltraHighResBufferIncludedInShotBuffer;
}

- (id)nodeType
{
  return @"Coordinator";
}

- (uint64_t)_setupStateMachineWithAllStateTransitionsHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = [[FigStateMachine alloc] initWithLabel:@"BWStillImageCoordinator state machine" stateCount:17 initialState:1 owner:result];
    [(FigStateMachine *)v4 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v4 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v4 setLabel:@"InitiatedIdle" forState:2];
    [(FigStateMachine *)v4 setLabel:@"Ready" forState:4];
    [(FigStateMachine *)v4 setLabel:@"InitiatedReady" forState:8];
    [(FigStateMachine *)v4 setLabel:@"Preparing" forState:16];
    [(FigStateMachine *)v4 setLabel:@"InitiatedPreparing" forState:32];
    [(FigStateMachine *)v4 setLabel:@"Initiating" forState:64];
    [(FigStateMachine *)v4 setLabel:@"Resolving" forState:128];
    [(FigStateMachine *)v4 setLabel:@"InitiatedResolving" forState:256];
    [(FigStateMachine *)v4 setLabel:@"Capturing" forState:512];
    [(FigStateMachine *)v4 setLabel:@"Flushing" forState:1024];
    [(FigStateMachine *)v4 setLabel:@"BeginningMoment" forState:2048];
    [(FigStateMachine *)v4 setLabel:@"PostponingMoment" forState:4096];
    [(FigStateMachine *)v4 setLabel:@"CapturingUncommitedMoment" forState:0x2000];
    [(FigStateMachine *)v4 setLabel:@"CapturingCommittedMoment" forState:0x4000];
    [(FigStateMachine *)v4 setLabel:@"CancellingMomentWaitingForBuffers" forState:0x8000];
    [(FigStateMachine *)v4 setLabel:@"CancellingMoment" forState:0x10000];
    if (a2) {
      [(FigStateMachine *)v4 whenTransitioningToStates:0xFFFFFFFFLL callHandler:a2];
    }
    [(FigStateMachine *)v4 whenTransitioningToStates:3 callHandler:&__block_literal_global_49];
    [(FigStateMachine *)v4 whenTransitioningToStates:12 callHandler:&__block_literal_global_141];
    [(FigStateMachine *)v4 whenTransitioningToStates:48 callHandler:&__block_literal_global_143];
    [(FigStateMachine *)v4 whenTransitioningToState:64 callHandler:&__block_literal_global_145];
    [(FigStateMachine *)v4 whenTransitioningToStates:384 callHandler:&__block_literal_global_147];
    [(FigStateMachine *)v4 whenTransitioningToState:512 callHandler:&__block_literal_global_149_0];
    [(FigStateMachine *)v4 whenTransitioningToState:1024 callHandler:&__block_literal_global_151];
    [(FigStateMachine *)v4 whenTransitioningToState:2048 callHandler:&__block_literal_global_153];
    [(FigStateMachine *)v4 whenTransitioningToState:4096 callHandler:&__block_literal_global_155];
    [(FigStateMachine *)v4 whenTransitioningToState:0x2000 callHandler:&__block_literal_global_157];
    [(FigStateMachine *)v4 whenTransitioningToState:0x4000 callHandler:&__block_literal_global_159];
    [(FigStateMachine *)v4 whenTransitioningToState:0x8000 callHandler:&__block_literal_global_161];
    result = [(FigStateMachine *)v4 whenTransitioningToState:0x10000 callHandler:&__block_literal_global_163_0];
    *(void *)(v3 + 232) = v4;
  }
  return result;
}

- (int)stillImageCapturePipeliningMode
{
  return self->_stillImageCapturePipeliningMode;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (id)sensorRawOutputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToSensorRawOutput objectForKeyedSubscript:a3];
}

- (id)sensorRawInputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToSensorRawInput objectForKeyedSubscript:a3];
}

- (id)outputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToOutput objectForKeyedSubscript:a3];
}

- (id)inputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToInput objectForKeyedSubscript:a3];
}

- (void)setStillImageProcessingSupportProvider:(id)a3
{
  self->_stillImageProcessingSupportProvider = (BWStillImageProcessingSupportProvider *)a3;
}

- (void)setStillImageCaptureStatusDelegate:(id)a3
{
  self->_stillImageCaptureStatusDelegate = (BWStillImageCaptureStatusDelegate *)a3;
}

- (void)setStillImageCapturePipeliningMode:(int)a3
{
  self->_stillImageCapturePipeliningMode = a3;
  -[BWStillImageCoordinatorNode _updateResponsiveShutterEnabled]((uint64_t)self);
}

- (void)setResponsiveShutterEnabledViaAPI:(BOOL)a3
{
  self->_responsiveShutterEnabledViaAPI = a3;
}

- (void)setResponsiveShutterEnabled:(BOOL)a3
{
  self->_responsiveShutterEnabled = a3;
  -[BWStillImageCoordinatorNode _updateResponsiveShutterEnabled]((uint64_t)self);
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
  -[BWStillImageCoordinatorNode _updateResponsiveShutterEnabled]((uint64_t)self);
}

- (void)setCompressedShotBuffer:(id)a3
{
  compressedShotBuffer = self->_compressedShotBuffer;
  if (compressedShotBuffer != a3)
  {

    self->_compressedShotBuffer = (BWCompressedShotBuffer *)a3;
    if (a3)
    {
      self->_extraUncompressedShotBufferCapacityForThermalSystemPressureLevelSerious = 1;
      self->_extraUncompressedShotBufferCapacityForThermalSystemPressureLevelCritical = 4;
    }
  }
}

- (void)setCinematicFramingWarpingRequired:(BOOL)a3
{
  self->_cinematicFramingWarpingRequired = a3;
}

- (BWStillImageCoordinatorNode)initWithCaptureDevice:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5 highResStillImageDimensions:(id)a6
{
  return (BWStillImageCoordinatorNode *)[(BWStillImageCoordinatorNode *)self _initWithCaptureDevice:a3 inputPortTypes:a4 sensorRawInputPortTypes:a5 highResStillImageDimensions:a6 allStateTransitionsHandler:0];
}

- (id)_initWithCaptureDevice:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5 highResStillImageDimensions:(id)a6 allStateTransitionsHandler:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v63.receiver = self;
  v63.super_class = (Class)BWStillImageCoordinatorNode;
  BOOL v11 = [(BWNode *)&v63 init];
  if (v11)
  {
    id v42 = a7;
    uint64_t v12 = (BWFigVideoCaptureDevice *)a3;
    v11->_captureDevice = v12;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    int v13 = [(BWFigVideoCaptureDevice *)v12 captureStreams];
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v60 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v59 + 1) + 8 * i) setStillImageCaptureDelegate:v11];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v15);
    }
    [(BWNode *)v11 setSupportsConcurrentLiveInputCallbacks:0];
    v11->_highResStillImageDimensions = (NSArray *)a6;
    v47 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v48 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v18 = [a4 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      int v20 = 0;
      uint64_t v21 = *(void *)v56;
      do
      {
        uint64_t v22 = 0;
        int v49 = v20;
        uint64_t v23 = v20;
        do
        {
          if (*(void *)v56 != v21) {
            objc_enumerationMutation(a4);
          }
          int v24 = *(void **)(*((void *)&v55 + 1) + 8 * v22);
          int v25 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v11 index:v23 + v22];
          unint64_t v26 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeInput *)v25 setFormatRequirements:v26];

          [(BWNodeInput *)v25 setPassthroughMode:1];
          [(BWNodeInput *)v25 setRetainedBufferCount:0];
          [(BWNode *)v11 addInput:v25];
          [v47 setObject:v25 forKeyedSubscript:v24];
          [(BWNodeInput *)v25 setName:BWPortTypeToDisplayString(v24, v27)];
          int v28 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v11];
          int v29 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeOutput *)v28 setFormatRequirements:v29];

          [(BWNodeOutput *)v28 setPassthroughMode:1];
          [(BWNodeOutput *)v28 setIndexOfInputWhichDrivesThisOutput:[(BWNodeInput *)v25 index]];
          [v48 setObject:v28 forKeyedSubscript:v24];
          [(BWNodeOutput *)v28 setName:BWPortTypeToDisplayString(v24, v30)];
          [(BWNode *)v11 addOutput:v28];

          ++v22;
        }
        while (v19 != v22);
        uint64_t v19 = [a4 countByEnumeratingWithState:&v55 objects:v65 count:16];
        int v20 = v23 + v22;
      }
      while (v19);
      int v31 = v22 + v49;
    }
    else
    {
      int v31 = 0;
    }
    long long v45 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v46 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v50 = [a5 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v50)
    {
      uint64_t v44 = *(void *)v52;
      do
      {
        uint64_t v32 = 0;
        uint64_t v33 = v31;
        do
        {
          if (*(void *)v52 != v44) {
            objc_enumerationMutation(a5);
          }
          int v34 = *(void **)(*((void *)&v51 + 1) + 8 * v32);
          int v35 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v11 index:v33 + v32];
          v36 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeInput *)v35 setFormatRequirements:v36];

          [(BWNodeInput *)v35 setPassthroughMode:1];
          [(BWNodeInput *)v35 setRetainedBufferCount:0];
          [(BWNode *)v11 addInput:v35];
          [v45 setObject:v35 forKeyedSubscript:v34];
          -[BWNodeInput setName:](v35, "setName:", [NSString stringWithFormat:@"%@:%@", BWPortTypeToDisplayString(v34, v37), @"SensorRaw", v42]);
          int v38 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v11];
          id v39 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeOutput *)v38 setFormatRequirements:v39];

          [(BWNodeOutput *)v38 setPassthroughMode:1];
          [(BWNodeOutput *)v38 setIndexOfInputWhichDrivesThisOutput:[(BWNodeInput *)v35 index]];
          [v46 setObject:v38 forKeyedSubscript:v34];
          -[BWNodeInput setName:](v35, "setName:", [NSString stringWithFormat:@"%@:%@", BWPortTypeToDisplayString(v34, v40), @"SensorRaw"]);
          [(BWNode *)v11 addOutput:v38];

          ++v32;
        }
        while (v50 != v32);
        int v31 = v33 + v32;
        uint64_t v50 = [a5 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v50);
    }
    v11->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11->_requestQueueLock._os_unfair_lock_opaque = 0;
    v11->_portTypeToInput = (NSDictionary *)[v47 copy];
    v11->_portTypeToOutput = (NSDictionary *)[v48 copy];
    v11->_portTypeToSensorRawInput = (NSDictionary *)[v45 copy];
    v11->_portTypeToSensorRawOutput = (NSDictionary *)[v46 copy];
    v11->_stillImageDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v11->_stillImageDispatchGroup = (OS_dispatch_group *)dispatch_group_create();
    v11->_stillImageGraphStopDispatchGroup = (OS_dispatch_group *)dispatch_group_create();
    v11->_receivedImagesOrErrorsForRequestByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11->_receivedUltraHighResImagesOrErrorsForRequestByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[BWStillImageCoordinatorNode _setupStateMachineWithAllStateTransitionsHandler:]((uint64_t)v11, (uint64_t)v42);
    v11->_maxNumberOfBurstCapturesAllowedInFlight = 2;
    v11->_bufferTrackingLock._os_unfair_lock_opaque = 0;
  }
  return v11;
}

- (uint64_t)_updateResponsiveShutterEnabled
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 392) || *(_DWORD *)(result + 168) != 2)
    {
      *(unsigned char *)(result + 420) = 0;
      *(unsigned char *)(result + 452) = 0;
      result = [(id)objc_opt_class() setMaxShotBufferCapacity:0];
      *(unsigned char *)(v1 + 480) = 0;
      uint64_t v4 = 388;
      int v5 = 1;
LABEL_14:
      *(_DWORD *)(v1 + v4) = v5;
      return result;
    }
    if ((int)llroundf((float)((float)((unint64_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "physicalMemory") >> 20)+ 537.0)* 0.00097656) <= 5)uint64_t v2 = 11; {
    else
    }
      uint64_t v2 = 18;
    if ([*(id *)(v1 + 104) softISPEnabled])
    {
      if ([*(id *)(v1 + 104) sensorRawStillImageOutputsEnabled])
      {
        if ([*(id *)(v1 + 104) depthDataDeliveryEnabled]) {
          uint64_t v2 = 27;
        }
        else {
          uint64_t v2 = 20;
        }
        int v3 = 4;
      }
      else
      {
        uint64_t v2 = 11;
        int v3 = 1;
      }
      *(_DWORD *)(v1 + 388) = v3;
    }
    *(unsigned char *)(v1 + 420) = 1;
    if (*(unsigned char *)(v1 + 420))
    {
      *(_DWORD *)(v1 + 424) = 0;
      *(_DWORD *)(v1 + 432) = 0;
      *(_DWORD *)(v1 + 436) = 0;
      int v6 = *(_DWORD *)(v1 + 388);
      objc_opt_class();
      self;
      sUltraHighResFrameCountExpansionFactor = v6;
      [(id)objc_opt_class() setCurrentAllocatedShotBufferCapacity:0];
      [(id)objc_opt_class() setMaxShotBufferCapacity:v2];
      *(_DWORD *)(v1 + 428) = v2;
      [(id)objc_opt_class() setNumberOfZoomBasedBufferIncludedInShotBuffer:0];
      result = [(id)objc_opt_class() setNumberOfUltraHighResBufferIncludedInShotBuffer:0];
    }
    else
    {
      [(id)objc_opt_class() setMaxShotBufferCapacity:0];
      *(_DWORD *)(v1 + 388) = 1;
      int v7 = *(_DWORD *)(v1 + 388);
      objc_opt_class();
      result = self;
      sUltraHighResFrameCountExpansionFactor = v7;
    }
    *(unsigned char *)(v1 + 452) = 1;
    if (*(unsigned char *)(v1 + 452)) {
      *(_DWORD *)(v1 + 456) = 1082130432;
    }
    *(unsigned char *)(v1 + 480) = *(unsigned char *)(v1 + 394);
    if (*(unsigned char *)(v1 + 480))
    {
      *(_DWORD *)(v1 + 484) = 2;
      if (*(unsigned char *)(v1 + 480))
      {
        *(_DWORD *)(v1 + 488) = 1040187392;
        uint64_t v4 = 492;
        int v5 = 1051931443;
        goto LABEL_14;
      }
    }
  }
  return result;
}

+ (void)setMaxShotBufferCapacity:(int)a3
{
  sMaxShotBufferCapacity = a3;
}

+ (void)setNumberOfZoomBasedBufferIncludedInShotBuffer:(int)a3
{
  sNumberOfZoomBasedBufferIncludedInShotBuffer = a3;
}

+ (void)setNumberOfUltraHighResBufferIncludedInShotBuffer:(int)a3
{
  sNumberOfUltraHighResBufferIncludedInShotBuffer = a3;
}

+ (void)setCurrentAllocatedShotBufferCapacity:(int)a3
{
  sCurrentAllocatedShotBufferCapacity = a3;
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(BWFigVideoCaptureDevice *)self->_captureDevice captureStreams];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) setStillImageCaptureDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_requestQueue count];
  shotBufferWaitGroup = self->_shotBufferWaitGroup;
  if (shotBufferWaitGroup)
  {
    dispatch_group_leave(shotBufferWaitGroup);
  }
  v9.receiver = self;
  v9.super_class = (Class)BWStillImageCoordinatorNode;
  [(BWNode *)&v9 dealloc];
}

- (id)nodeSubType
{
  return @"StillImageCoordinator";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_stillImageCapturePipeliningMode == 2 && !self->_responsiveShutterEnabledViaAPI)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v3 = [(BWNode *)self inputs];
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "resolvedAttachedMediaKeys"), "count"))
          {
            objc_super v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Attached media isn't supported when the pipeline mode is %@, resolvedAttachedMediaKeys %@ for input %@", BWPhotoEncoderStringFromEncodingScheme(self->_stillImageCapturePipeliningMode), objc_msgSend(v8, "resolvedAttachedMediaKeys"), v8), 0 reason userInfo];
            objc_exception_throw(v9);
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageCoordinatorNode;
  [(BWNode *)&v10 prepareForCurrentConfigurationToBecomeLive];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4))
  {
    if (dword_1EB4C5490)
    {
      int v22 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [(BWNode *)self outputs];
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) makeConfiguredFormatLive];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v10);
    }
    stillImageDispatchQueue = self->_stillImageDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_sync(stillImageDispatchQueue, block);
  }
  else if (dword_1EB4C5490)
  {
    uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 184) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
  if (v2 >= 1)
  {
    if (dword_1EB4C5490)
    {
      int v8 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 208);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke_52;
    block[3] = &unk_1E5C24430;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke_52(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 232) currentState];
  int v3 = *(void **)(*(void *)(a1 + 32) + 232);
  if (v2 == 1)
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t result = [v3 currentState];
    if (result != 2) {
      return result;
    }
    int v3 = *(void **)(*(void *)(a1 + 32) + 232);
    uint64_t v4 = 8;
  }
  return [v3 transitionToState:v4];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(BWNode *)self allInputsHaveReachedState:0];
  if (dword_1EB4C5490)
  {
    unsigned int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4)
  {
    stillImageDispatchQueue = self->_stillImageDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_async(stillImageDispatchQueue, block);
    if (dword_1EB4C5490)
    {
      unsigned int v15 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v8 = v15;
      if (os_log_type_enabled(v7, type)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        int v16 = 136315138;
        long long v17 = "-[BWStillImageCoordinatorNode didReachEndOfDataForInput:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    stillImageDispatchGroup = self->_stillImageDispatchGroup;
    uint64_t v11 = self->_stillImageDispatchQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke_60;
    v12[3] = &unk_1E5C24430;
    v12[4] = self;
    dispatch_group_notify(stillImageDispatchGroup, v11, v12);
  }
}

uint64_t __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 264))
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(v1 + 232) currentState];
    if (result != 1024)
    {
      int v3 = *(void **)(*(void *)(v2 + 32) + 232);
      return [v3 transitionToState:1024];
    }
  }
  return result;
}

uint64_t __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke_60(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) captureStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) setStillImageCaptureDelegate:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  *(void *)(*(void *)(a1 + 32) + 104) = 0;
  [*(id *)(*(void *)(a1 + 32) + 504) stop];

  *(void *)(*(void *)(a1 + 32) + 504) = 0;
  *(void *)(*(void *)(a1 + 32) + 400) = 0;
  if (dword_1EB4C5490)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v8 = objc_msgSend(*(id *)(a1 + 32), "outputs", v13, v14, 0);
  uint64_t result = [v8 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v12++) markEndOfLiveOutput];
      }
      while (v10 != v12);
      uint64_t result = [v8 countByEnumeratingWithState:&v15 objects:v25 count:16];
      uint64_t v10 = result;
    }
    while (result);
  }
  return result;
}

- (int)initiateStillImageCaptureNowWithSettings:(id)a3
{
  if (a3)
  {
    [a3 stillImageUserInitiatedRequestPTS];
    if (v6)
    {
      if ([a3 stillImageUserInitiatedRequestTime]) {
        return [(BWStillImageCoordinatorNode *)self _enqueueRequestWithSettings:a3 serviceRequestsIfNecessary:1];
      }
    }
  }
  FigDebugAssert3();
  return -12780;
}

- (int)captureStillImageNowWithSettings:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5490)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return -[BWStillImageCoordinatorNode _enqueueRequestWithSettings:serviceRequestsIfNecessary:](self, "_enqueueRequestWithSettings:serviceRequestsIfNecessary:", a3, 1, v7, v8);
}

- (int)prepareStillImageCaptureNowWithSettings:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5490)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return -[BWStillImageCoordinatorNode _enqueueRequestWithSettings:serviceRequestsIfNecessary:](self, "_enqueueRequestWithSettings:serviceRequestsIfNecessary:", a3, 1, v7, v8);
}

- (int)beginStillImageMomentCaptureWithSettings:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5490)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a3, "isBeginMomentCaptureSettings", v7, v8)) {
    return [(BWStillImageCoordinatorNode *)self _enqueueRequestWithSettings:a3 serviceRequestsIfNecessary:1];
  }
  FigDebugAssert3();
  return -12780;
}

- (int)cancelStillImageMomentCaptureWithSettingsID:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  if (dword_1EB4C5490)
  {
    int v13 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWFigVideoCaptureDevice zeroShutterLagCancelWaitingForTimeMachinesForSettingsID:](self->_captureDevice, "zeroShutterLagCancelWaitingForTimeMachinesForSettingsID:", a3, v9, v10);
  os_unfair_lock_lock(&self->_requestQueueLock);
  self->_momentCaptureLastCancelledSettingsID = a3;
  os_unfair_lock_unlock(&self->_requestQueueLock);
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke;
  block[3] = &unk_1E5C26FC0;
  block[4] = self;
  void block[5] = &v14;
  block[6] = a3;
  dispatch_sync(stillImageDispatchQueue, block);
  int v7 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1[4] + 264) isBeginMomentCaptureSettings]
    && [*(id *)(a1[4] + 264) settingsID] == a1[6])
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = *(NSObject **)(v2 + 216);
    uint64_t v4 = *(NSObject **)(v2 + 208);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke_2;
    block[3] = &unk_1E5C24430;
    block[4] = v2;
    dispatch_group_async(v3, v4, block);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 192));
    if ([*(id *)(a1[4] + 184) count])
    {
      uint64_t v5 = 0;
      while (objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 184), "objectAtIndexedSubscript:", v5), "settingsID") != a1[6])
      {
        if ([*(id *)(a1[4] + 184) count] <= (unint64_t)++v5) {
          goto LABEL_8;
        }
      }
      [*(id *)(a1[4] + 184) removeObjectAtIndex:v5];
      --*(_DWORD *)(a1[4] + 196);
      *(_DWORD *)(a1[4] + 196) &= ~(*(int *)(a1[4] + 196) >> 31);
      if (dword_1EB4C5490)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 192));
      char v6 = 1;
    }
    else
    {
LABEL_8:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 192));
      char v6 = 0;
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -12780;
    }
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void **)(v8 + 152);
    uint64_t v10 = a1[6];
    long long v14 = *MEMORY[0x1E4F1F9F8];
    uint64_t v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    objc_msgSend(v9, "stillImageCoordinator:didCancelMomentCaptureForSettingsID:streamingDisruptionEndPTS:", v8, v10, &v14, v11, v12);
    if (v6) {
      dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 216));
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 216));
}

uint64_t __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 232) currentState] == 0x2000) {
    uint64_t v2 = 0x8000;
  }
  else {
    uint64_t v2 = 0x10000;
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 232);
  return [v3 transitionToState:v2];
}

- (int)commitStillImageMomentCaptureWithSettings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  if (dword_1EB4C5490)
  {
    int v12 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock(&self->_requestQueueLock);
  int64_t v6 = [a3 settingsID];
  self->_momentCaptureLastComittedSettingsID = v6;
  if (self->_momentCaptureUnfiredWillBeginCaptureBeforeResolvingSettingsCallbackSettingsID == v6)
  {
    self->_momentCaptureUnfiredWillBeginCaptureBeforeResolvingSettingsCallbackSettingsID = 0;
    os_unfair_lock_unlock(&self->_requestQueueLock);
    if (v6 >= 1) {
      [(BWStillImageCaptureStatusDelegate *)self->_stillImageCaptureStatusDelegate stillImageCoordinator:self willBeginCaptureBeforeResolvingSettingsForID:v6];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_requestQueueLock);
  }
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke;
  block[3] = &unk_1E5C25120;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v13;
  dispatch_sync(stillImageDispatchQueue, block);
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 264) isBeginMomentCaptureSettings]
    && (uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 264) settingsID],
        v2 == [*(id *)(a1 + 40) settingsID]))
  {
    objc_msgSend(*(id *)(a1 + 40), "setStillImageUserInitiatedRequestTime:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "stillImageUserInitiatedRequestTime"));
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 264);
    if (v3)
    {
      [v3 stillImageUserInitiatedRequestPTS];
    }
    else
    {
      long long v35 = 0uLL;
      uint64_t v36 = 0;
    }
    int v7 = *(void **)(a1 + 40);
    long long v33 = v35;
    uint64_t v34 = v36;
    [v7 setStillImageUserInitiatedRequestPTS:&v33];
    [*(id *)(*(void *)(a1 + 32) + 264) stillImageCaptureAbsoluteStartTime];
    objc_msgSend(*(id *)(a1 + 40), "setStillImageCaptureAbsoluteStartTime:");
    objc_msgSend(*(id *)(a1 + 40), "setStillImageCaptureStartTime:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "stillImageCaptureStartTime"));
    if ([*(id *)(*(void *)(a1 + 32) + 264) stillImageRequestTime] >= 1) {
      objc_msgSend(*(id *)(a1 + 40), "setStillImageRequestTime:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "stillImageRequestTime"));
    }
    objc_msgSend(*(id *)(a1 + 40), "setResolutionFlavor:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "resolutionFlavor"));
    objc_msgSend(*(id *)(a1 + 40), "setBypassUpscaling:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "bypassUpscaling"));
    int v8 = [*(id *)(a1 + 40) outputWidth];
    unsigned int v9 = [*(id *)(a1 + 40) outputHeight] * v8;
    int v10 = [*(id *)(*(void *)(a1 + 32) + 264) outputWidth];
    int v11 = [*(id *)(*(void *)(a1 + 32) + 264) outputHeight];
    uint64_t v12 = *(void *)(a1 + 32);
    if (v9 >= v11 * v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "setOutputWidth:", objc_msgSend(*(id *)(v12 + 264), "outputWidth"));
      objc_msgSend(*(id *)(a1 + 40), "setOutputHeight:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "outputHeight"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyWidth:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "deferredPhotoProxyWidth"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyHeight:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "deferredPhotoProxyHeight"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalWidth:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "deferredPhotoFinalWidth"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalHeight:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "deferredPhotoFinalHeight"));
      unsigned int v14 = [*(id *)(a1 + 40) rawThumbnailWidth];
      if (v14 > [*(id *)(a1 + 40) outputWidth]
        || (unsigned int v15 = [*(id *)(a1 + 40) rawThumbnailHeight],
            v15 > [*(id *)(a1 + 40) outputHeight]))
      {
        objc_msgSend(*(id *)(a1 + 40), "setRawThumbnailWidth:", objc_msgSend(*(id *)(a1 + 40), "outputWidth"));
        objc_msgSend(*(id *)(a1 + 40), "setRawThumbnailHeight:", objc_msgSend(*(id *)(a1 + 40), "outputHeight"));
      }
    }
    else
    {
      uint64_t v13 = *(void **)(v12 + 272);
      if (v13 && [v13 deliverDeferredPhotoProxyImage])
      {
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyWidth:", objc_msgSend(*(id *)(a1 + 40), "outputWidth"));
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyHeight:", objc_msgSend(*(id *)(a1 + 40), "outputHeight"));
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalWidth:", objc_msgSend(*(id *)(a1 + 40), "outputWidth"));
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalHeight:", objc_msgSend(*(id *)(a1 + 40), "outputHeight"));
      }
    }
    if (*(void *)(*(void *)(a1 + 32) + 272)
      && [*(id *)(a1 + 40) depthDataDeliveryEnabled]
      && ([*(id *)(*(void *)(a1 + 32) + 272) captureFlags] & 0x800) == 0)
    {
      [*(id *)(a1 + 40) setDepthDataDeliveryEnabled:0];
    }

    *(void *)(*(void *)(a1 + 32) + 264) = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 32);
    if (*(void *)(v16 + 272))
    {

      *(void *)(*(void *)(a1 + 32) + 280) = 0;
      *(void *)(*(void *)(a1 + 32) + 280) = -[BWStillImageCoordinatorNode _resolveProcessingSettings](*(BWStillImageProcessingSettings **)(a1 + 32));
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 280), "photoManifest"), "photoDescriptors"), "count"))
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -12780;
        uint64_t v25 = *(void *)(a1 + 32);
        long long v21 = *(NSObject **)(v25 + 216);
        long long v22 = *(NSObject **)(v25 + 208);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_2;
        v32[3] = &unk_1E5C24430;
        v32[4] = v25;
        long long v23 = v32;
        goto LABEL_36;
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 256) = [*(id *)(*(void *)(a1 + 32) + 280) expectedClientImageCount];
      uint64_t v16 = *(void *)(a1 + 32);
    }
    if ([*(id *)(v16 + 232) currentState] != 128)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(NSObject **)(v17 + 216);
      long long v19 = *(NSObject **)(v17 + 208);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_3;
      block[3] = &unk_1E5C24430;
      block[4] = v17;
      dispatch_group_async(v18, v19, block);
    }
    uint64_t v20 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v20 + 420))
    {
      long long v21 = *(NSObject **)(v20 + 216);
      long long v22 = *(NSObject **)(v20 + 208);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_4;
      v30[3] = &unk_1E5C24430;
      v30[4] = v20;
      long long v23 = v30;
LABEL_36:
      dispatch_group_async(v21, v22, v23);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
    if ([*(id *)(*(void *)(a1 + 32) + 184) count])
    {
      uint64_t v4 = 0;
      while (1)
      {
        uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 184) objectAtIndexedSubscript:v4];
        uint64_t v6 = [v5 settingsID];
        if (v6 == [*(id *)(a1 + 40) settingsID]) {
          break;
        }
        if ([*(id *)(*(void *)(a1 + 32) + 184) count] <= (unint64_t)++v4) {
          goto LABEL_9;
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "setStillImageUserInitiatedRequestTime:", objc_msgSend(v5, "stillImageUserInitiatedRequestTime"));
      if (v5)
      {
        [v5 stillImageUserInitiatedRequestPTS];
      }
      else
      {
        long long v28 = 0uLL;
        uint64_t v29 = 0;
      }
      long long v24 = *(void **)(a1 + 40);
      long long v26 = v28;
      uint64_t v27 = v29;
      [v24 setStillImageUserInitiatedRequestPTS:&v26];
      [*(id *)(*(void *)(a1 + 32) + 184) replaceObjectAtIndex:v4 withObject:*(void *)(a1 + 40)];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
    }
    else
    {
LABEL_9:
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -12780;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 216));
}

- (BWStillImageProcessingSettings)_resolveProcessingSettings
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    p_isa = (id *)&result->super.isa;
    uint64_t v2 = -[BWStillImageCoordinatorNode _resolvePhotoManifest]((BWPhotoManifest *)result);
    if ([p_isa[33] autoIntelligentDistortionCorrectionEnabled]
      && p_isa[20]
      && (long long v12 = 0u,
          long long v13 = 0u,
          long long v10 = 0u,
          long long v11 = 0u,
          uint64_t v3 = (void *)[p_isa[34] captureStreamSettings],
          (uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16]) != 0))
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      unsigned int v9 = v2;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(p_isa[20], "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend(p_isa[34], "captureType"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "captureFlags"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "portType")))
          {
            uint64_t v8 = 1;
            uint64_t v2 = v9;
            return [[BWStillImageProcessingSettings alloc] initWithPhotoManifest:v2 processIntelligentDistortionCorrection:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v8 = 0;
        uint64_t v2 = v9;
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    return [[BWStillImageProcessingSettings alloc] initWithPhotoManifest:v2 processIntelligentDistortionCorrection:v8];
  }
  return result;
}

uint64_t __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 232) currentState] == 0x2000) {
    uint64_t v2 = 0x8000;
  }
  else {
    uint64_t v2 = 0x10000;
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 232);
  return [v3 transitionToState:v2];
}

uint64_t __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 232) currentState] == 4096) {
    uint64_t v2 = 512;
  }
  else {
    uint64_t v2 = 0x4000;
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 232);
  return [v3 transitionToState:v2];
}

void __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 232) currentState] == 0x4000)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    -[BWStillImageCoordinatorNode _attemptToCompleteRequest](v2);
  }
}

- (void)_attemptToCompleteRequest
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v28 = v1;
      LODWORD(v26) = 0;
      FigDebugAssert3();
    }
    if (*(void *)(a1 + 272)
      && ([*(id *)(a1 + 264) isBeginMomentCaptureSettings] & 1) == 0
      && !*(unsigned char *)(a1 + 292))
    {
      uint64_t v3 = *(void **)(a1 + 272);
      int v4 = [*(id *)(a1 + 264) isOutputFormatCompressed];
      int v5 = [v3 captureType];
      if (v4 && v5 != 11)
      {
        int v7 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
        if (v7 <= (int)-[BWStillImageCoordinatorNode _receivedFrameOrErrorCountForCurrentRequest](a1))
        {
          if (*(unsigned char *)(a1 + 420))
          {
            int v8 = -[BWStillImageCoordinatorNode _expectedFrameCountForNextRequest](a1);
            int v9 = v8;
            if (v8 >= (int)[(id)objc_opt_class() maxShotBufferCapacity]) {
              int v9 = [(id)objc_opt_class() maxShotBufferCapacity];
            }
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
            int v10 = [(id)objc_opt_class() maxShotBufferCapacity];
            int v11 = *(_DWORD *)(a1 + 376);
            if (v10 <= v11)
            {
              int v13 = 0;
            }
            else
            {
              int v12 = [(id)objc_opt_class() maxShotBufferCapacity];
              int v11 = *(_DWORD *)(a1 + 376);
              int v13 = v12 - v11;
            }
            int v16 = *(_DWORD *)(a1 + 424);
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
            if (v13 < v9)
            {
              if (dword_1EB4C5490)
              {
                LODWORD(v34) = 0;
                type[0] = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (*MEMORY[0x1E4F1EBA8] == 1) {
                kdebug_trace();
              }
              return;
            }
            uint64_t v18 = (_DWORD *)MEMORY[0x1E4F1EBA8];
            if (*MEMORY[0x1E4F1EBA8] == 1) {
              kdebug_trace();
            }
            if (*(void *)(a1 + 400))
            {
              BOOL v20 = ([*(id *)(a1 + 272) captureFlags] & 2) == 0;
              if ((objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled", v26, v28) & v20) != 0)
              {
                int v19 = (v16 - v11) & ~((v16 - v11) >> 31);
                uint64_t v21 = (v8 - v19) & ~((v8 - v19) >> 31);
              }
              else
              {
                uint64_t v21 = 0;
              }
              int v22 = [*(id *)(a1 + 400) hasUncompressedEquivalentFreeBufferCount:v21];
              uint64_t v23 = [*(id *)(a1 + 400) freeBufferCountIncreasedHandler];
              if (!v22)
              {
                if (!v23)
                {
                  int v35 = 0;
                  *(void *)os_log_type_t type = 0;
                  uint64_t v34 = 0;
                  [*(id *)(a1 + 400) getInUseCompressedBufferCount:&v35 inUseCompressedBytes:&v34 maxInUseCompressedBytes:type forUncompressedEquivalentFreeBufferCount:v21];
                  if (dword_1EB4C5490)
                  {
                    int v32 = 0;
                    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
                    uint64_t v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  if (*v18 == 1) {
                    kdebug_trace();
                  }
                  v30[0] = MEMORY[0x1E4F143A8];
                  v30[1] = 3221225472;
                  v30[2] = __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke;
                  v30[3] = &unk_1E5C24430;
                  v30[4] = a1;
                  objc_msgSend(*(id *)(a1 + 400), "setFreeBufferCountIncreasedHandler:", v30, v27, v29);
                }
                return;
              }
              if (v23)
              {
                [*(id *)(a1 + 400) setFreeBufferCountIncreasedHandler:0];
                int v35 = 0;
                *(void *)os_log_type_t type = 0;
                uint64_t v34 = 0;
                [*(id *)(a1 + 400) getInUseCompressedBufferCount:&v35 inUseCompressedBytes:&v34 maxInUseCompressedBytes:type forUncompressedEquivalentFreeBufferCount:v21];
                if (*v18 == 1) {
                  kdebug_trace();
                }
                if (dword_1EB4C5490)
                {
                  long long v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
              }
            }
            -[BWStillImageCoordinatorNode _waitToMakePaceWithReferenceTime:](a1);
            -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, 0);
            return;
          }
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
          int v14 = *(_DWORD *)(a1 + 376);
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
          if (v14 <= 0)
          {
            -[BWStillImageCoordinatorNode _waitToMakePaceWithReferenceTime:](a1);
            -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, 0);
          }
          else if (dword_1EB4C5490)
          {
            uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0)) {
    return;
  }
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  int v7 = [(BWFigVideoCaptureDevice *)self->_captureDevice sensorRawHighResolutionFlavorForDimensions:BWPixelBufferDimensionsFromSampleBuffer(a3)];
  if (dword_1EB4C5490)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_stillImageCapturePipeliningMode == 2)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (ImageBuffer)
    {
      os_unfair_lock_lock(&self->_bufferTrackingLock);
      if (v7 == 2)
      {
        self->_inUseBufferCount += self->_ultraHighResFrameCountExpansionFactor;
        int v10 = &OBJC_IVAR___BWStillImageCoordinatorNode__inUseUltraHighResBufferCount;
      }
      else
      {
        ++self->_inUseBufferCount;
        if (v7 != 1)
        {
LABEL_11:
          if (*MEMORY[0x1E4F1EBA8] == 1)
          {
            [(id)objc_opt_class() maxShotBufferCapacity];
            kdebug_trace();
          }
          os_unfair_lock_unlock(&self->_bufferTrackingLock);
          id v11 = +[FigWeakReference weakReferenceToObject:self];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke;
          v15[3] = &unk_1E5C262A0;
          v15[4] = v11;
          int v16 = v7;
          +[BWIOSurfaceTracking trackPixelBuffer:ImageBuffer surfaceUseCountIsZeroHandler:v15];
          goto LABEL_14;
        }
        int v10 = &OBJC_IVAR___BWStillImageCoordinatorNode__inUseZoomBasedBufferCount;
      }
      ++*(_DWORD *)((char *)&self->super.super.isa + *v10);
      goto LABEL_11;
    }
  }
LABEL_14:
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_2;
  block[3] = &unk_1E5C27010;
  int v14 = v7;
  void block[5] = a4;
  block[6] = &v23;
  void block[7] = &v19;
  block[8] = a3;
  block[4] = self;
  dispatch_sync(stillImageDispatchQueue, block);
  if (*((unsigned char *)v20 + 24)) {
    -[BWStillImageCoordinatorNode _renderSampleBuffer:forInput:attemptToCompleteRequest:]((uint64_t)self, a3, a4, *((unsigned __int8 *)v24 + 24));
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v19, 8);
}

void __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) referencedObject];
  int v3 = *(_DWORD *)(a1 + 40);
  -[BWStillImageCoordinatorNode _stoppedUsingBufferWithSensorRawHighResolutionFlavor:](v2, v3);
}

- (void)_stoppedUsingBufferWithSensorRawHighResolutionFlavor:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
    if (a2 == 2)
    {
      --*(_DWORD *)(a1 + 384);
      *(_DWORD *)(a1 + 376) -= *(_DWORD *)(a1 + 388);
    }
    else
    {
      --*(_DWORD *)(a1 + 376);
      if (a2 == 1) {
        --*(_DWORD *)(a1 + 380);
      }
    }
    int v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      kdebug_trace();
      if (*v4 == 1)
      {
        [(id)objc_opt_class() maxShotBufferCapacity];
        kdebug_trace();
      }
    }
    if (*(unsigned char *)(a1 + 420))
    {
      if (*(void *)(a1 + 440))
      {
        if ((int)[(id)objc_opt_class() maxShotBufferCapacity] <= *(_DWORD *)(a1 + 376)) {
          int v5 = 0;
        }
        else {
          int v5 = [(id)objc_opt_class() maxShotBufferCapacity] - *(_DWORD *)(a1 + 376);
        }
        if (v5 >= *(_DWORD *)(a1 + 448))
        {
          if (dword_1EB4C5490)
          {
            int v12 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 440));

          *(void *)(a1 + 440) = 0;
        }
        else if (dword_1EB4C5490)
        {
          int v12 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
    }
    else
    {
      int v6 = *(_DWORD *)(a1 + 376);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
      if (v6) {
        return;
      }
    }
    int v9 = *(NSObject **)(a1 + 208);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__BWStillImageCoordinatorNode__stoppedUsingBufferWithSensorRawHighResolutionFlavor___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = a1;
    dispatch_async(v9, block);
  }
}

void __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
  int v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "objectForKeyedSubscript:", v2), "intValue");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v3 + 1)), v2);
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    int v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "objectForKeyedSubscript:", v2), "intValue");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v4 + 1)), v2);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 304);
  BOOL v7 = -[BWStillImageCoordinatorNode _capturedAllFrames](v5);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    int v9 = *(_DWORD *)(v8 + 256);
    BOOL v10 = v9 < 1 || *(_DWORD *)(v8 + 260) >= v9;
  }
  else
  {
    BOOL v10 = 0;
  }
  if (*(unsigned char *)(v8 + 420))
  {
    if (v6) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v7;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  char v13 = v7 && v10;
  if (*(unsigned char *)(v12 + 24)) {
    char v13 = 1;
  }
  *(unsigned char *)(v12 + 24) = v13;
  if (!v6)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = 292;
    goto LABEL_20;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  int v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 304), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index"));
  if (dword_1EB4C5490)
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v14, "addObject:", *(void *)(a1 + 64), v26, v27);
  -[BWStillImageCoordinatorNode _cancelMomentCaptureIfNeeded](*(void *)(a1 + 32));
  uint64_t v16 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v16 + 292))
  {
    uint64_t v17 = 293;
LABEL_20:
    if (*(unsigned char *)(v16 + v17))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      if (dword_1EB4C5490)
      {
        int v33 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v19 = *(const void **)(a1 + 64);
      if (v19)
      {
        CFRetain(v19);
        uint64_t v20 = *(void *)(a1 + 64);
      }
      else
      {
        uint64_t v20 = 0;
      }
      uint64_t v21 = *(void *)(a1 + 48);
      long long v22 = *(_OWORD *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 32);
      long long v24 = *(NSObject **)(v23 + 216);
      uint64_t v25 = *(NSObject **)(v23 + 208);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_75;
      block[3] = &unk_1E5C26FE8;
      uint64_t v30 = v21;
      uint64_t v31 = v20;
      long long v29 = v22;
      dispatch_group_async(v24, v25, block);
      uint64_t v16 = *(void *)(a1 + 32);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(v16 + 216));
}

- (BOOL)_capturedAllFrames
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](result);
    return v2 <= (int)-[BWStillImageCoordinatorNode _receivedFrameOrErrorCountForCurrentRequest](v1);
  }
  return result;
}

- (uint64_t)_cancelMomentCaptureIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v15 = v1;
      LODWORD(v14) = 0;
      FigDebugAssert3();
    }
    uint64_t result = objc_msgSend(*(id *)(v2 + 232), "currentState", v14, v15);
    if (result == 0x8000)
    {
      CMTimeValue value = *MEMORY[0x1E4F1F9F8];
      CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
      CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
      CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = (id)[*(id *)(v2 + 272) captureStreamSettings];
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v21;
LABEL_7:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
          BOOL v10 = objc_msgSend(*(id *)(v2 + 112), "objectForKeyedSubscript:", objc_msgSend(v9, "portType"));
          uint64_t v11 = objc_msgSend(*(id *)(v2 + 128), "objectForKeyedSubscript:", objc_msgSend(v9, "portType"));
          if (((v11 != 0) & ([v9 captureFlags] >> 2)) != 0) {
            BOOL v10 = (void *)v11;
          }
          unint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 304), "objectAtIndexedSubscript:", objc_msgSend(v10, "index")), "count");
          uint64_t result = [v9 expectedFrameCaptureCount];
          if (v12 < (int)result) {
            break;
          }
          char v13 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 304), "objectAtIndexedSubscript:", objc_msgSend(v10, "index")), "lastObject");
          if (v13)
          {
            memset(&v19, 0, sizeof(v19));
            CMSampleBufferGetPresentationTimeStamp(&v19, v13);
            if ((flags & 1) == 0
              || (time1.CMTimeValue value = value,
                  time1.CMTimeScale timescale = timescale,
                  time1.CMTimeFlags flags = flags,
                  time1.CMTimeEpoch epoch = epoch,
                  CMTime time2 = v19,
                  CMTimeCompare(&time1, &time2) < 0))
            {
              CMTimeValue value = v19.value;
              CMTimeFlags flags = v19.flags;
              CMTimeScale timescale = v19.timescale;
              CMTimeEpoch epoch = v19.epoch;
            }
          }
          if (v6 == ++v8)
          {
            uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v6) {
              goto LABEL_7;
            }
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        *(void *)(v2 + 344) = value;
        *(_DWORD *)(v2 + 352) = timescale;
        *(_DWORD *)(v2 + 356) = flags;
        *(void *)(v2 + 360) = epoch;
        return [*(id *)(v2 + 232) transitionToState:0x10000];
      }
    }
  }
  return result;
}

void __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_75(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 292) = 0;
    BOOL v2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  -[BWStillImageCoordinatorNode _renderSampleBuffer:forInput:attemptToCompleteRequest:](*(void *)(a1 + 32), *(CMAttachmentBearerRef *)(a1 + 56), *(void **)(a1 + 40), v2);
  int v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)_renderSampleBuffer:(void *)a3 forInput:(int)a4 attemptToCompleteRequest:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 368))
    {
      uint64_t v6 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
      uint64_t v7 = (void *)[*(id *)(a1 + 272) captureStreamSettingsForPortType:v6];
      uint64_t v20 = 0;
      long long v21 = &v20;
      uint64_t v22 = 0x2020000000;
      uint64_t v8 = *(NSObject **)(a1 + 208);
      int v23 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke;
      block[3] = &unk_1E5C27038;
      void block[5] = v6;
      block[6] = &v20;
      void block[4] = a1;
      dispatch_sync(v8, block);
      LODWORD(v6) = *((_DWORD *)v21 + 6);
      if (v6 == [v7 expectedFrameCaptureCount]) {
        -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, 0xFFFFBE5C);
      }
      _Block_object_dispose(&v20, 8);
    }
    else
    {
      uint64_t v11 = -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)a1);
      objc_msgSend((id)objc_msgSend((id)a1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
      BWStillImageCoordinatorAddAttachmentsToSampleBuffer(target, v11);
      if (a4)
      {
        unint64_t v12 = *(NSObject **)(a1 + 216);
        char v13 = *(NSObject **)(a1 + 208);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke_2;
        v18[3] = &unk_1E5C24430;
        v18[4] = a1;
        dispatch_group_async(v12, v13, v18);
      }
      CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      [*(id *)(a1 + 264) videoStabilizationOverscanCropMultiplier];
      FigCaptureMetadataUtilitiesRefineFinalCropRects(v14);
      if (dword_1EB4C5490)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "outputs", v16, v17), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
    }
  }
}

uint64_t __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 240), "objectForKeyedSubscript:", a1[5]), "intValue");
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_flushStillImageRequestWithError:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (dword_1EB4C5490)
    {
      int v23 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v13 = v2;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = (id)objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", v12, v13);
    uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v17)
    {
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v7 = [v6 portType];
          int v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 240), "objectForKeyedSubscript:", v7), "intValue");
          int v9 = [v6 expectedFrameCaptureCount];
          if ([v6 adaptiveBracketingParameters]) {
            int v9 = [v6 currentExpectedAdaptiveBracketedFrameCaptureCount];
          }
          int v10 = v9 - v8;
          if (!v10)
          {
            if (*(_DWORD *)(a1 + 260) == *(_DWORD *)(a1 + 256)) {
              continue;
            }
            int v10 = [v6 expectedFrameCaptureCount];
          }
          if (v10 >= 1)
          {
            id v11 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, a1, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)a1), 0);
            do
            {
              if ([v6 isYUVCapture]) {
                objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "objectForKeyedSubscript:", v7), "index")), "emitNodeError:", v11);
              }
              if ([v6 isSensorRawCapture]) {
                objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", v7), "index")), "emitNodeError:", v11);
              }
              --v10;
            }
            while (v10);
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v17);
    }
    -[BWStillImageCoordinatorNode _didCaptureStillImage](a1);
    -[BWStillImageCoordinatorNode _readyToRespondToRequest](a1);
    if (!*(void *)(a1 + 272)) {
      -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, a2);
    }
  }
}

- (BWStillImageSettings)_currentStillImageSettings
{
  if (result)
  {
    uint64_t v1 = [[BWStillImageSettings alloc] initWithRequestedSettings:result[8]._requestedSettings captureSettings:result[8]._captureSettings processingSettings:result[8]._processingSettings];
    return v1;
  }
  return result;
}

void __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke_2(uint64_t a1)
{
}

- (uint64_t)_ensureDeviceOrientationMonitor
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 504))
    {
      uint64_t v2 = objc_alloc_init(BWDeviceOrientationMonitor);
      *(void *)(v1 + 504) = v2;
      return [(BWDeviceOrientationMonitor *)v2 start];
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  long long v19 = __Block_byref_object_copy__19;
  long long v20 = __Block_byref_object_dispose__19;
  uint64_t v21 = 0;
  if (self->_currentRequestedStillImageCaptureSettings)
  {
    portTypeToInput = self->_portTypeToInput;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke;
    v15[3] = &unk_1E5C27060;
    v15[4] = a4;
    void v15[5] = &v16;
    [(NSDictionary *)portTypeToInput enumerateKeysAndObjectsUsingBlock:v15];
    id v8 = [(BWStillImageCaptureSettings *)self->_currentResolvedStillImageCaptureSettings captureStreamSettingsForPortType:v17[5]];
    int v9 = [v8 expectedFrameCaptureCount];
    stillImageDispatchQueue = self->_stillImageDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke_2;
    block[3] = &unk_1E5C27088;
    block[6] = &v16;
    void block[7] = &v22;
    int v14 = v9;
    void block[4] = self;
    void block[5] = v8;
    dispatch_sync(stillImageDispatchQueue, block);
    if ([(BWFigVideoCaptureDevice *)self->_captureDevice quadraHighResStillImageCaptureEnabled])
    {
      if ([(BWStillImageCaptureSettings *)self->_currentResolvedStillImageCaptureSettings captureType] != 8)
      {
        self->_receivedQuadraHighResError = 1;
        if (*((_DWORD *)v23 + 6) == v9) {
          -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:]((uint64_t)self, 0xFFFFBE5C);
        }
      }
    }
    if ([(id)v17[5] isEqualToString:*MEMORY[0x1E4F52E00]])
    {
      id v11 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
      id v12 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", [a3 errorCode], self, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)self), objc_msgSend(a3, "metadata"));
      [v11 emitNodeError:v12];
    }
  }
  else
  {
    FigDebugAssert3();
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

uint64_t __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v8 = [*(id *)(a1 + 32) index];
  uint64_t result = [a3 index];
  if (v8 == result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "objectForKeyedSubscript:", *(void *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 40)), "intValue")+ 1;
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(_DWORD *)(a1 + 64))
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "expectedUltraHighResFrameCaptureCount"));
    int v4 = *(void **)(*(void *)(a1 + 32) + 248);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    return [v4 setObject:v3 forKeyedSubscript:v5];
  }
  return result;
}

- (void)clientReceivedPayloadForSettings:(id)a3 status:(int)a4 clientIsMidStillImageGraph:(BOOL)a5
{
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__BWStillImageCoordinatorNode_clientReceivedPayloadForSettings_status_clientIsMidStillImageGraph___block_invoke;
  block[3] = &unk_1E5C260F8;
  BOOL v8 = a5;
  void block[4] = self;
  void block[5] = a3;
  int v7 = a4;
  dispatch_async(stillImageDispatchQueue, block);
}

void __98__BWStillImageCoordinatorNode_clientReceivedPayloadForSettings_status_clientIsMidStillImageGraph___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 32) + 168) == 1)
  {
    if (!*(unsigned char *)(a1 + 52))
    {
      if ([*(id *)(a1 + 40) burstQualityCaptureEnabled])
      {
        uint64_t v2 = *(void *)(a1 + 32);
        int v3 = *(_DWORD *)(v2 + 172);
        if (v3) {
          *(_DWORD *)(v2 + 172) = v3 - 1;
        }
      }
    }
  }
  else if (*(unsigned char *)(a1 + 52))
  {
    return;
  }
  uint64_t v4 = [*(id *)(a1 + 40) settingsID];
  if (v4 == [*(id *)(*(void *)(a1 + 32) + 264) settingsID])
  {
    BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 272) captureType] && *(unsigned char *)(a1 + 52) == 0;
    BOOL v6 = v5;
    if (*(unsigned char *)(a1 + 52)
      && [*(id *)(*(void *)(a1 + 32) + 264) burstQualityCaptureEnabled]
      && (int v7 = *(os_unfair_lock_s **)(a1 + 32), v7[43]._os_unfair_lock_opaque < v7[44]._os_unfair_lock_opaque)
      && (os_unfair_lock_lock(v7 + 48),
          BOOL v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 184) firstObject],
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192)),
          v8))
    {
      if (([v8 burstQualityCaptureEnabled] & 1) == 0) {
        return;
      }
    }
    else if (!v6)
    {
      return;
    }
    int v9 = [*(id *)(a1 + 40) outputFormat];
    int v10 = [*(id *)(a1 + 40) isBeginMomentCaptureSettings];
    if (v9) {
      int v11 = 0;
    }
    else {
      int v11 = v10;
    }
    if (v9 || v11) {
      ++*(_DWORD *)(*(void *)(a1 + 32) + 260);
    }
    if ([*(id *)(a1 + 40) rawOutputFormat]) {
      ++*(_DWORD *)(*(void *)(a1 + 32) + 260);
    }
    if (-[BWStillImageCoordinatorNode _capturedAllFrames](*(void *)(a1 + 32)) || *(_DWORD *)(a1 + 48))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12)
      {
        int v13 = *(_DWORD *)(v12 + 256);
        if (v13 < 1 || *(_DWORD *)(v12 + 260) >= v13)
        {
          int v14 = *(_DWORD *)(a1 + 48);
          if (!v14)
          {
            if (*(_DWORD *)(v12 + 168) == 2)
            {
              uint64_t v15 = *(void **)(v12 + 272);
              int v16 = [*(id *)(v12 + 264) isOutputFormatCompressed];
              int v17 = [v15 captureType];
              if (v16 && v17 != 11) {
                return;
              }
              uint64_t v12 = *(void *)(a1 + 32);
              int v14 = *(_DWORD *)(a1 + 48);
            }
            else
            {
              int v14 = 0;
            }
          }
          -[BWStillImageCoordinatorNode _completeRequestWithStatus:](v12, v14);
        }
      }
    }
  }
}

- (void)_completeRequestWithStatus:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  uint64_t v4 = *(void *)(a1 + 264);
  if (v4)
  {
    if ([*(id *)(a1 + 264) isUserInitiatedRequestSettings])
    {
      BOOL v5 = a2 == 0;
    }
    else
    {
      if (![*(id *)(a1 + 264) isClientInitiatedPrepareSettings])
      {
        char v6 = 0;
LABEL_14:
        if (!a2 && [*(id *)(a1 + 272) captureType] && *(int *)(a1 + 256) >= 1)
        {
          *(void *)(a1 + 472) = mach_absolute_time();
          FigHostTimeToNanoseconds();
          if (dword_1EB4C5490)
          {
            int v18 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          *(void *)(a1 + 464) = 0;
        }
        if (dword_1EB4C5490)
        {
          int v18 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWStillImageCoordinatorNode _readyToRespondToRequest](a1);
        goto LABEL_22;
      }
      BOOL v5 = [*(id *)(a1 + 232) currentState] == 32;
    }
    char v6 = v5;
    goto LABEL_14;
  }
  char v6 = 0;
LABEL_22:
  BOOL v8 = (int *)MEMORY[0x1E4F1EBA8];
  int v9 = *MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    kdebug_trace();
    int v9 = *v8;
  }
  if (v9)
  {
    int v10 = fig_log_handle();
    if (os_signpost_enabled(v10))
    {
      int v11 = [*(id *)(a1 + 264) settingsID];
      *(_DWORD *)buf = 67240192;
      int v20 = v11;
      _os_signpost_emit_with_name_impl(&dword_1A5887000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StillCaptureRequest", " enableTelemetry=YES N1=%{public,signpost.telemetry:number1}d", buf, 8u);
    }
  }

  *(void *)(a1 + 264) = 0;
  *(void *)(a1 + 272) = 0;

  *(void *)(a1 + 280) = 0;
  [*(id *)(a1 + 240) removeAllObjects];
  [*(id *)(a1 + 248) removeAllObjects];
  *(_DWORD *)(a1 + 260) = 0;
  *(_DWORD *)(a1 + 256) = 0;
  *(_DWORD *)(a1 + 288) = 0;
  *(unsigned char *)(a1 + 368) = 0;
  *(unsigned char *)(a1 + 292) = 0;
  *(unsigned char *)(a1 + 293) = 0;

  *(void *)(a1 + 296) = 0;
  *(void *)(a1 + 304) = 0;
  *(_DWORD *)(a1 + 312) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
  *(void *)(a1 + 320) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  uint64_t v12 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(a1 + 344) = *MEMORY[0x1E4F1F9F8];
  *(void *)(a1 + 360) = *(void *)(v12 + 16);
  if (v4) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 216));
  }
  int v13 = *(NSObject **)(a1 + 208);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BWStillImageCoordinatorNode__completeRequestWithStatus___block_invoke;
  block[3] = &unk_1E5C24B78;
  void block[4] = a1;
  char v16 = v6;
  dispatch_async(v13, block);
}

- (void)willStopGraph:(BOOL)a3
{
  uint64_t v13 = 0;
  int v14 = (float *)&v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  int v12 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__BWStillImageCoordinatorNode_willStopGraph___block_invoke;
  block[3] = &unk_1E5C270B0;
  void block[4] = self;
  void block[5] = v11;
  BOOL v9 = a3;
  void block[6] = v10;
  void block[7] = &v13;
  dispatch_sync(stillImageDispatchQueue, block);
  float v5 = v14[6];
  if (v5 > 0.0)
  {
    stillImageGraphStopDispatchGroup = self->_stillImageGraphStopDispatchGroup;
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(float)(v5 * 1000000000.0));
    dispatch_group_wait(stillImageGraphStopDispatchGroup, v7);
  }
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __45__BWStillImageCoordinatorNode_willStopGraph___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 272) captureType];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 272) settingsID];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 232) currentState];
  if (result == 1) {
    return result;
  }
  if (*(unsigned char *)(a1 + 64))
  {
LABEL_14:
    int v3 = 0;
    goto LABEL_15;
  }
  int v3 = 0;
  if ((int)result < 0x4000)
  {
    if (result != 512 && result != 0x2000) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  if (result == 0x8000 || result == 0x4000)
  {
LABEL_9:
    int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v4 != 2 && v4 != 11)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      BOOL v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 272) captureStreamSettings];
      uint64_t result = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (result)
      {
        uint64_t v9 = result;
        int v3 = 0;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v8);
            }
            int v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
            int v13 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "objectForKeyedSubscript:", objc_msgSend(v12, "portType")), "intValue");
            int v14 = [v12 expectedFrameCaptureCount] - v13;
            if (v14 > v3) {
              int v3 = v14;
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t result = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          uint64_t v9 = result;
        }
        while (result);
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (float)v3;
  if (*(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= 0.0)
  {
    if (dword_1EB4C5490)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "transitionToState:", 1024, v15, v16);
  }
  else if (dword_1EB4C5490)
  {
    char v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (id)compressedShotBuffer
{
  return self->_compressedShotBuffer;
}

- (void)setMaxNumberOfBurstCapturesAllowedInFlight:(unsigned int)a3
{
  self->_maxNumberOfBurstCapturesAllowedInFlight = a3;
}

- (unsigned)maxNumberOfBurstCapturesAllowedInFlight
{
  return self->_maxNumberOfBurstCapturesAllowedInFlight;
}

- (void)captureStreamWillWaitForTimeMachineToFill:(id)a3
{
  if (!_FigIsCurrentDispatchQueue()) {
    FigDebugAssert3();
  }
  if (self->_currentResolvedStillImageCaptureSettings)
  {
    os_unfair_lock_lock(&self->_requestQueueLock);
    if ([(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings isBeginMomentCaptureSettings]&& (int64_t momentCaptureLastComittedSettingsID = self->_momentCaptureLastComittedSettingsID, momentCaptureLastComittedSettingsID < [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings settingsID]))
    {
      self->_momentCaptureUnfiredWillBeginCaptureBeforeResolvingSettingsCallbackSettingsID = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings settingsID];
      os_unfair_lock_unlock(&self->_requestQueueLock);
    }
    else
    {
      os_unfair_lock_unlock(&self->_requestQueueLock);
      stillImageCaptureStatusDelegate = self->_stillImageCaptureStatusDelegate;
      int64_t v6 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings settingsID];
      [(BWStillImageCaptureStatusDelegate *)stillImageCaptureStatusDelegate stillImageCoordinator:self willBeginCaptureBeforeResolvingSettingsForID:v6];
    }
  }
}

- (void)captureStreamWillBeginStillImageCapture:(id)a3
{
  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__BWStillImageCoordinatorNode_captureStreamWillBeginStillImageCapture___block_invoke;
  block[3] = &unk_1E5C24430;
  void block[4] = self;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, block);
}

void __71__BWStillImageCoordinatorNode_captureStreamWillBeginStillImageCapture___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 272)) {
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](v1, 4);
  }
}

- (void)_fireDelegateCallbackWithFlag:(uint64_t)a1
{
  if (a1)
  {
    int v3 = [[BWStillImageCaptureDelegateCallbackInfo alloc] initWithFlag:a2];
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithInfo:](a1, v3);
  }
}

- (void)captureStream:(id)a3 didCaptureReferenceFrameWithPTS:(id *)a4 referenceFrameBracketedCaptureSequenceNumber:(id)a5
{
  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__BWStillImageCoordinatorNode_captureStream_didCaptureReferenceFrameWithPTS_referenceFrameBracketedCaptureSequenceNumber___block_invoke;
  block[3] = &unk_1E5C26E48;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  void block[4] = self;
  void block[5] = a5;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, block);
}

uint64_t __122__BWStillImageCoordinatorNode_captureStream_didCaptureReferenceFrameWithPTS_referenceFrameBracketedCaptureSequenceNumber___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 272))
  {
    long long v5 = *(_OWORD *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 64);
    -[BWStillImageCoordinatorNode _didResolveStillImagePTS:isPreBracketedEV0:](result, &v5, 0);
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(a1 + 40);
    return -[BWStillImageCoordinatorNode _didResolveReferenceFrameBracketedCaptureSequenceNumber:](v3, v4);
  }
  return result;
}

- (void)_didResolveStillImagePTS:(uint64_t)a3 isPreBracketedEV0:
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (a3) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 16;
    }
    dispatch_time_t v7 = [BWStillImageCaptureDelegateCallbackInfo alloc];
    long long v9 = *a2;
    uint64_t v10 = *((void *)a2 + 2);
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(BWStillImageCaptureDelegateCallbackInfo *)v7 initWithFlag:v6 pts:&v9 isPreBracketFrame:a3];
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithInfo:](a1, v8);
  }
}

- (uint64_t)_didResolveReferenceFrameBracketedCaptureSequenceNumber:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = (void *)result;
      uint64_t result = [*(id *)(result + 272) expectReferenceFrameBracketedCaptureSequenceNumber];
      if (result)
      {
        long long v10 = 0u;
        long long v11 = 0u;
        long long v8 = 0u;
        long long v9 = 0u;
        int v4 = objc_msgSend(v3, "outputs", 0);
        uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (result)
        {
          uint64_t v5 = result;
          uint64_t v6 = *(void *)v9;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v9 != v6) {
                objc_enumerationMutation(v4);
              }
              objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", objc_msgSend(a2, "intValue"));
            }
            while (v5 != v7);
            uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
            uint64_t v5 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (void)captureStream:(id)a3 didCapturePreBracketedEV0ImageWithPTS:(id *)a4
{
  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__BWStillImageCoordinatorNode_captureStream_didCapturePreBracketedEV0ImageWithPTS___block_invoke;
  v6[3] = &unk_1E5C24C18;
  v6[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v6);
}

void __83__BWStillImageCoordinatorNode_captureStream_didCapturePreBracketedEV0ImageWithPTS___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 272))
  {
    long long v3 = *(_OWORD *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 56);
    -[BWStillImageCoordinatorNode _didResolveStillImagePTS:isPreBracketedEV0:](v2, &v3, 1);
  }
}

- (void)captureStreamDidCompleteStillImageCapture:(id)a3
{
  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__BWStillImageCoordinatorNode_captureStreamDidCompleteStillImageCapture___block_invoke;
  v5[3] = &unk_1E5C24458;
  v5[4] = self;
  v5[5] = a3;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v5);
}

void __73__BWStillImageCoordinatorNode_captureStreamDidCompleteStillImageCapture___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 272))
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 224));
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "portType"), "isEqualToString:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "masterPortType")))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      -[BWStillImageCoordinatorNode _didCaptureStillImage](v3);
    }
  }
}

- (void)_didCaptureStillImage
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](a1, 32);
  }
}

- (void)captureStream:(id)a3 stillImageCaptureError:(int)a4
{
  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__BWStillImageCoordinatorNode_captureStream_stillImageCaptureError___block_invoke;
  v6[3] = &unk_1E5C262A0;
  v6[4] = self;
  int v7 = a4;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v6);
}

void __68__BWStillImageCoordinatorNode_captureStream_stillImageCaptureError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 272))
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 224));
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](*(void *)(a1 + 32), 4);
    if ([*(id *)(*(void *)(a1 + 32) + 232) currentState] == 0x2000)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 312) = *(_DWORD *)(a1 + 40);
    }
    else
    {
      uint64_t v3 = *(void *)(a1 + 32);
      unsigned int v4 = *(_DWORD *)(a1 + 40);
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](v3, v4);
    }
  }
}

- (void)node:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 forSettings:(id)a6
{
  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__BWStillImageCoordinatorNode_node_didSelectNewReferenceFrameWithPTS_transform_forSettings___block_invoke;
  v8[3] = &unk_1E5C270D8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  v8[4] = self;
  v8[5] = a5;
  v8[6] = a6;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v8);
}

uint64_t __92__BWStillImageCoordinatorNode_node_didSelectNewReferenceFrameWithPTS_transform_forSettings___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  return -[BWStillImageCoordinatorNode _didSelectNewReferenceFrameWithPTS:transform:forSettings:](v2, &v5, v1, v3);
}

- (uint64_t)_didSelectNewReferenceFrameWithPTS:(uint64_t)a3 transform:(uint64_t)a4 forSettings:
{
  if (result)
  {
    uint64_t v8 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v11 = v4;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *(void **)(v8 + 152);
    long long v12 = *a2;
    uint64_t v13 = *((void *)a2 + 2);
    return objc_msgSend(v9, "stillImageCoordinator:didSelectNewReferenceFrameWithPTS:transform:forSettings:", v8, &v12, a3, a4, v10, v11);
  }
  return result;
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)_serviceNextRequest
{
  if (!a1) {
    return;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v14 = v1;
    LODWORD(v13) = 0;
    FigDebugAssert3();
  }
  objc_msgSend((id)a1, "_unpackNextRequest", v13, v14);
  int v3 = [*(id *)(a1 + 232) currentState];
  uint64_t v4 = *(void **)(a1 + 264);
  if (!v4)
  {
    FigDebugAssert3();
LABEL_11:
    unsigned int v6 = 0;
LABEL_19:
    if (v3 == 4) {
      unsigned int v10 = 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (*(void *)(a1 + 264)) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = v10;
    }
    long long v12 = *(void **)(a1 + 232);
    [v12 transitionToState:v11];
    return;
  }
  if ([v4 isClientInitiatedPrepareSettings])
  {
    BOOL v5 = v3 == 4;
    unsigned int v6 = 32;
    int v7 = 16;
    goto LABEL_17;
  }
  int v8 = *(unsigned __int8 *)(a1 + 96);
  int v9 = [*(id *)(a1 + 264) isUserInitiatedRequestSettings];
  if (v8)
  {
    if (!v9)
    {
      BOOL v5 = v3 == 4;
      unsigned int v6 = 256;
      int v7 = 128;
LABEL_17:
      if (v5) {
        unsigned int v6 = v7;
      }
      goto LABEL_19;
    }
    if (v3 != 8)
    {
      unsigned int v6 = 64;
      goto LABEL_19;
    }
    [*(id *)(a1 + 104) cancelPrepareToCaptureStillImageNow];
    -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, -12780);
    goto LABEL_11;
  }
  if (!v9)
  {
    [(id)a1 _configureCurrentCaptureRequestStateForFigCaptureStillImageSettings];
    unsigned int v6 = 1024;
    goto LABEL_19;
  }
  -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, -16800);
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_3(uint64_t a1, BWStillImageSettings *a2)
{
}

- (void)_beginPreparingCapture
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    -[BWStillImageProcessingSettings stillImageCoordinator:willPrepareStillImageCaptureWithSettings:clientInitiated:](a1[4]._processingSettings, "stillImageCoordinator:willPrepareStillImageCaptureWithSettings:clientInitiated:", a1, -[BWStillImageCoordinatorNode _currentStillImageSettings](a1), 1);
    -[BWStillImageCoordinatorNode _completeRequestWithStatus:]((uint64_t)a1, 0);
  }
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _beginInitiatingCapture](a2);
}

- (uint64_t)_beginInitiatingCapture
{
  if (result)
  {
    uint64_t v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v6 = v1;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
    long long v10 = 0uLL;
    uint64_t v11 = 0;
    int v3 = *(void **)(v2 + 264);
    if (v3) {
      [v3 stillImageUserInitiatedRequestPTS];
    }
    uint64_t v4 = *(void **)(v2 + 104);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke;
    v7[3] = &unk_1E5C24C18;
    v7[4] = v2;
    long long v8 = v10;
    uint64_t v9 = v11;
    return objc_msgSend(v4, "prepareToCaptureStillImageNow:", v7, v5, v6);
  }
  return result;
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _beginResolvingCapture](a2);
}

- (uint64_t)_beginResolvingCapture
{
  if (result)
  {
    uint64_t v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v8 = v1;
      LODWORD(v7) = 0;
      FigDebugAssert3();
    }
    [*(id *)(v2 + 264) setStillImageCaptureStartTime:mach_absolute_time()];
    *(void *)(v2 + 464) = [*(id *)(v2 + 264) stillImageCaptureStartTime];
    int v3 = (int *)MEMORY[0x1E4F1EBA8];
    int v4 = *MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [*(id *)(v2 + 264) settingsID];
      kdebug_trace();
      int v4 = *v3;
    }
    if (v4)
    {
      uint64_t v5 = fig_log_handle();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A5887000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StillCaptureRequest", (const char *)&unk_1A5F8B35A, buf, 2u);
      }
    }
    if (objc_msgSend(*(id *)(v2 + 232), "currentState", v7, v8) == 256)
    {
      [(id)v2 _configureCurrentCaptureRequestStateForFigCaptureStillImageSettings];
      return [*(id *)(v2 + 232) transitionToState:512];
    }
    else
    {
      uint64_t v6 = *(void **)(v2 + 104);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke;
      v9[3] = &unk_1E5C24430;
      v9[4] = v2;
      return [v6 prepareToCaptureStillImageNow:v9];
    }
  }
  return result;
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
}

- (void)_beginCapture
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v13 = v1;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](a1, 2);
    if (*(unsigned char *)(a1 + 420))
    {
      signed int v14 = 0;
      if (-[BWStillImageCoordinatorNode _waitUntilShotBufferHasEnoughFreeBuffersWithTimeout:freeBufferCountOut:](a1, &v14, 3.0))
      {
        if (*(void *)(a1 + 400))
        {
          signed int v3 = v14;
          unsigned int v4 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1) - v3;
          BOOL v5 = ([*(id *)(a1 + 272) captureFlags] & 2) == 0;
          if ((objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled", v12, v13) & v5) != 0) {
            uint64_t v6 = 0;
          }
          else {
            uint64_t v6 = v4;
          }
          [*(id *)(a1 + 400) flushAndWaitForUncompressedEquivalentFreeBufferCount:v6];
        }
      }
    }
    if ((*(unsigned char *)(a1 + 288) & 0x40) == 0)
    {
      [*(id *)(a1 + 152) stillImageCoordinator:a1 willPrepareStillImageCaptureWithSettings:-[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)a1) clientInitiated:0];
      *(_DWORD *)(a1 + 288) |= 0x40u;
    }
    int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 272), "portTypes", v12), "count");
    int v8 = v7;
    if (v7 >= 1)
    {
      int v9 = v7;
      do
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 224));
        --v9;
      }
      while (v9);
    }
    unsigned int v10 = [*(id *)(a1 + 104) captureStillImageNowWithSettings:*(void *)(a1 + 264) captureSettings:*(void *)(a1 + 272)];
    if (v10)
    {
      unsigned int v11 = v10;
      FigDebugAssert3();
      if (v8 >= 1)
      {
        do
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 224));
          --v8;
        }
        while (v8);
      }
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, v11);
    }
    else if ([*(id *)(a1 + 232) currentState] == 512 {
           || [*(id *)(a1 + 232) currentState] == 0x2000 && *(unsigned char *)(a1 + 293))
    }
    {
      -[BWStillImageCoordinatorNode _setupProcessing](a1);
    }
  }
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _beginMomentCapture](a2);
}

- (uint64_t)_beginMomentCapture
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v14 = v1;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    int v3 = objc_msgSend(*(id *)(v2 + 272), "captureType", v12, v14);
    uint64_t v4 = [*(id *)(v2 + 272) captureFlags];
    if (v3 == 1) {
      BOOL v5 = (v4 & 0x100000000) == 0
    }
        || objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 272), "captureStreamSettingsForPortType:", objc_msgSend(*(id *)(v2 + 272), "masterPortType")), "unifiedBracketedCaptureParams"), "count") != 0;
    else {
      BOOL v5 = (v4 & 0x2000) == 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 192));
    uint64_t v6 = [*(id *)(v2 + 264) settingsID];
    uint64_t v7 = *(void *)(v2 + 328);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 192));
    if (v6 == v7 && dword_1EB4C5490 != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v6 == v7 || v5) {
      uint64_t v11 = 4096;
    }
    else {
      uint64_t v11 = 0x2000;
    }
    return objc_msgSend(*(id *)(v2 + 232), "transitionToState:", v11, v13, v15);
  }
  return result;
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_10(uint64_t a1, uint64_t a2)
{
}

- (void)_beginUncommittedMomentCapture
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v5 = v1;
      LODWORD(v4) = 0;
      FigDebugAssert3();
    }
    *(unsigned char *)(a1 + 292) = 1;
    *(unsigned char *)(a1 + 293) = objc_msgSend(*(id *)(a1 + 160), "processingOnBeginMomentSupportedForCaptureSettings:", *(void *)(a1 + 272), v4, v5);

    *(void *)(a1 + 296) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(a1 + 304) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count"))
    {
      unint64_t v3 = 0;
      do
        objc_msgSend(*(id *)(a1 + 304), "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), v3++);
      while (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count") > v3);
    }
    -[BWStillImageCoordinatorNode _beginCapture](a1);
  }
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_11(uint64_t a1, uint64_t a2)
{
}

- (void)_commitMomentCapture
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v18 = v1;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
    unint64_t v3 = *(void **)(a1 + 296);
    *(void *)(a1 + 296) = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v16, v18);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          -[BWStillImageCoordinatorNode _fireDelegateCallbackWithInfo:](a1, *(void **)(*((void *)&v21 + 1) + 8 * i));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v5);
    }

    unsigned int v8 = *(_DWORD *)(a1 + 312);
    if (v8)
    {
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, v8);
    }
    else
    {
      -[BWStillImageCoordinatorNode _setupProcessing](a1);
      int v9 = *(void **)(a1 + 304);
      *(void *)(a1 + 304) = 0;
      if (!*(unsigned char *)(a1 + 293) && [v9 count])
      {
        unint64_t v10 = 0;
        long long v20 = v9;
        do
        {
          uint64_t v11 = (void *)[v9 objectAtIndexedSubscript:v10];
          if ([v11 count])
          {
            unint64_t v12 = 0;
            do
            {
              uint64_t v13 = (const void *)[v11 objectAtIndexedSubscript:v12];
              if (dword_1EB4C5490)
              {
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              -[BWStillImageCoordinatorNode _renderSampleBuffer:forInput:attemptToCompleteRequest:](a1, v13, objc_msgSend((id)objc_msgSend((id)a1, "inputs", v17, v19), "objectAtIndexedSubscript:", v10), 0);
              ++v12;
            }
            while ([v11 count] > v12);
          }
          ++v10;
          int v9 = v20;
        }
        while ([v20 count] > v10);
      }

      if (*(unsigned char *)(a1 + 420))
      {
        int v15 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
        if (v15 <= (int)-[BWStillImageCoordinatorNode _receivedFrameOrErrorCountForCurrentRequest](a1))
        {
          *(unsigned char *)(a1 + 292) = 0;
          -[BWStillImageCoordinatorNode _attemptToCompleteRequest](a1);
        }
      }
    }
  }
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _cancelMomentCaptureIfNeeded](a2);
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_13(uint64_t a1, uint64_t a2)
{
}

- (void)_cancelMomentCapture
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v6 = v1;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
    if (*(unsigned char *)(a1 + 293))
    {
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, 0xFFFFBE5A);
      *(unsigned char *)(a1 + 293) = 0;
    }
    objc_msgSend(*(id *)(a1 + 104), "cancelPrepareToCaptureStillImageNow", v5, v6);
    unint64_t v3 = *(void **)(a1 + 152);
    uint64_t v4 = [*(id *)(a1 + 264) settingsID];
    long long v7 = *(_OWORD *)(a1 + 344);
    uint64_t v8 = *(void *)(a1 + 360);
    [v3 stillImageCoordinator:a1 didCancelMomentCaptureForSettingsID:v4 streamingDisruptionEndPTS:&v7];
    -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, 0);
  }
}

- (int)_enqueueRequestWithSettings:(id)a3 serviceRequestsIfNecessary:(BOOL)a4
{
  if (!a3)
  {
    FigDebugAssert3();
    return -12780;
  }
  int v7 = [a3 isUserInitiatedRequestSettings];
  int v8 = [a3 isClientInitiatedPrepareSettings];
  os_unfair_lock_lock(&self->_requestQueueLock);
  if (!v8)
  {
    if (v7)
    {
LABEL_9:
      [(NSMutableArray *)self->_requestQueue addObject:a3];
      goto LABEL_10;
    }
    if (self->_captureRequestCount <= 9)
    {
      [(NSMutableArray *)self->_requestQueue addObject:a3];
      ++self->_captureRequestCount;
      goto LABEL_10;
    }
LABEL_12:
    os_unfair_lock_unlock(&self->_requestQueueLock);
    int v10 = -12773;
    FigDebugAssert3();
    return v10;
  }
  if (self->_prepareRequestCount > 9)
  {
    if (v7) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  [(NSMutableArray *)self->_requestQueue addObject:a3];
  ++self->_prepareRequestCount;
LABEL_10:
  os_unfair_lock_unlock(&self->_requestQueueLock);
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__BWStillImageCoordinatorNode__enqueueRequestWithSettings_serviceRequestsIfNecessary___block_invoke;
  block[3] = &unk_1E5C24B78;
  BOOL v13 = a4;
  void block[4] = self;
  dispatch_async(stillImageDispatchQueue, block);
  return 0;
}

uint64_t __86__BWStillImageCoordinatorNode__enqueueRequestWithSettings_serviceRequestsIfNecessary___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 32);
    if (*(unsigned char *)(v2 + 96))
    {
      int v3 = [*(id *)(v2 + 232) currentState];
      uint64_t v4 = *(void **)(*(void *)(v1 + 32) + 232);
      if (v3 == 1)
      {
        uint64_t v5 = 4;
      }
      else
      {
        uint64_t result = [v4 currentState];
        if (result != 2) {
          return result;
        }
        uint64_t v4 = *(void **)(*(void *)(v1 + 32) + 232);
        uint64_t v5 = 8;
      }
      return [v4 transitionToState:v5];
    }
    else if (dword_1EB4C5490)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (void)_unpackNextRequest
{
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v12 = v2;
    LODWORD(v11) = 0;
    FigDebugAssert3();
  }
  os_unfair_lock_lock(&self->_requestQueueLock);
  [(NSMutableArray *)self->_requestQueue count];
  uint64_t v4 = (FigCaptureStillImageSettings *)(id)[(NSMutableArray *)self->_requestQueue firstObject];
  if (v4) {
    [(NSMutableArray *)self->_requestQueue removeObjectAtIndex:0];
  }
  BOOL v5 = [(FigCaptureStillImageSettings *)v4 isUserInitiatedRequestSettings];
  BOOL v6 = [(FigCaptureStillImageSettings *)v4 isClientInitiatedPrepareSettings];
  if (v6 || !v5)
  {
    if (v6) {
      int v7 = 200;
    }
    else {
      int v7 = 196;
    }
    int v8 = *(_DWORD *)((char *)&self->super.super.isa + v7);
    BOOL v9 = __OFSUB__(v8, 1);
    int v10 = v8 - 1;
    if ((v10 < 0) ^ v9 | (v10 == 0)) {
      int v10 = 0;
    }
    *(_DWORD *)((char *)&self->super.super.isa + v7) = v10;
  }
  os_unfair_lock_unlock(&self->_requestQueueLock);
  self->_currentRequestedStillImageCaptureSettings = v4;
}

uint64_t __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 104);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_2;
  v6[3] = &unk_1E5C25910;
  v6[4] = v1;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 initiateCaptureStillImageNowWithPTS:&v4 completionHandler:v6];
}

void __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(NSObject **)(v2 + 208);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_3;
  v4[3] = &unk_1E5C262A0;
  int v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

void __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_3(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 104) cancelPrepareToCaptureStillImageNow];
    int v2 = *(_DWORD *)(a1 + 40);
  }
  else
  {
    int v2 = 0;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  -[BWStillImageCoordinatorNode _completeRequestWithStatus:](v3, v2);
}

void __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(NSObject **)(v1 + 208);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke_2;
  block[3] = &unk_1E5C24430;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 232) currentState];
  if (result == 128)
  {
    [*(id *)(a1 + 32) _configureCurrentCaptureRequestStateForFigCaptureStillImageSettings];
    if ([*(id *)(*(void *)(a1 + 32) + 264) isBeginMomentCaptureSettings]) {
      uint64_t v3 = 2048;
    }
    else {
      uint64_t v3 = 512;
    }
    long long v4 = *(void **)(*(void *)(a1 + 32) + 232);
    return [v4 transitionToState:v3];
  }
  return result;
}

- (BOOL)_speedOverQualityCaptureEnabled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v17 = v1;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  if (objc_msgSend(*(id *)(a1 + 104), "unifiedBracketingMode", v15, v17) == 2) {
    return [*(id *)(a1 + 264) qualityPrioritization] == 2;
  }
  if (!*(unsigned char *)(a1 + 480)) {
    return 0;
  }
  mach_absolute_time();
  float v4 = (float)(FigHostTimeToNanoseconds() / 1000) / 1000000.0;
  float v5 = *(float *)(a1 + 488);
  if (v5 <= *(float *)(a1 + 492)) {
    float v6 = *(float *)(a1 + 492);
  }
  else {
    float v6 = *(float *)(a1 + 488);
  }
  int v7 = *(_DWORD *)(a1 + 496);
  if (v7 || v4 > v5)
  {
    if (v7 < 1 || v4 > v6)
    {
      if (v7 >= 1)
      {
        if (dword_1EB4C5490)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *(_DWORD *)(a1 + 496) = 0;
      }
      goto LABEL_23;
    }
    *(_DWORD *)(a1 + 496) = v7 + 1;
    if (dword_1EB4C5490) {
      goto LABEL_13;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 496) = 2;
    if (dword_1EB4C5490)
    {
LABEL_13:
      int v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
LABEL_23:
  int v10 = *(void **)(a1 + 264);
  char v11 = objc_msgSend(v10, "burstQualityCaptureEnabled", v16, v18);
  char v12 = BWCIFilterArrayContainsPortraitFilters((void *)[v10 processedImageFilters]);
  uint64_t v3 = 0;
  if (*(_DWORD *)(a1 + 496) > *(_DWORD *)(a1 + 484) && (v11 & 1) == 0 && (v12 & 1) == 0)
  {
    if (dword_1EB4C5490)
    {
      BOOL v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      uint64_t v3 = 1;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      return 1;
    }
  }
  return v3;
}

- (void)_configureCurrentCaptureRequestStateForFigCaptureStillImageSettings
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v56 = v2;
    LODWORD(v53) = 0;
    FigDebugAssert3();
  }
  if ([(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings isClientInitiatedPrepareSettings]|| [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings isUserInitiatedRequestSettings])
  {
    float v4 = &OBJC_IVAR___BWStillImageCoordinatorNode__clientExpectedImagesOrErrorsForRequest;
    goto LABEL_63;
  }
  self->_currentResolvedStillImageCaptureSettings = (BWStillImageCaptureSettings *)-[BWFigVideoCaptureDevice stillImageCaptureSettingsWithSettings:speedOverQualityCaptureEnabled:processingSupportProvider:](self->_captureDevice, "stillImageCaptureSettingsWithSettings:speedOverQualityCaptureEnabled:processingSupportProvider:", self->_currentRequestedStillImageCaptureSettings, -[BWStillImageCoordinatorNode _speedOverQualityCaptureEnabled]((uint64_t)self), self->_stillImageProcessingSupportProvider);
  self->_currentResolvedStillImageProcessingSettings = -[BWStillImageCoordinatorNode _resolveProcessingSettings]((BWStillImageProcessingSettings *)self);
  [(BWStillImageCaptureSettings *)self->_currentResolvedStillImageCaptureSettings setStillImageRequestTime:[(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings stillImageRequestTime]];
  objc_msgSend(-[BWStillImageCaptureSettings metadata](self->_currentResolvedStillImageCaptureSettings, "metadata"), "setFastCapturePrioritizationEnabled:", self->_fastCapturePrioritizationEnabled);
  if (dword_1EB4C5490)
  {
    unsigned int v72 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  float v6 = [(BWStillImageCaptureSettings *)self->_currentResolvedStillImageCaptureSettings captureStreamSettings];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v68 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_receivedImagesOrErrorsForRequestByPortType, "setObject:forKeyedSubscript:", &unk_1EFAFF540, [v11 portType]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_receivedUltraHighResImagesOrErrorsForRequestByPortType, "setObject:forKeyedSubscript:", &unk_1EFAFF540, [v11 portType]);
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v8);
  }
  self->_clientExpectedImagesOrErrorsForRequest = [(NSArray *)[(BWPhotoManifest *)[(BWStillImageProcessingSettings *)self->_currentResolvedStillImageProcessingSettings photoManifest] photoDescriptors] count];
  if (self->_stillImageCapturePipeliningMode == 1
    && [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings burstQualityCaptureEnabled])
  {
    ++self->_numberOfBurstCapturesInFlight;
  }
  unint64_t v12 = [(BWStillImageCaptureSettings *)self->_currentResolvedStillImageCaptureSettings deliverDeferredPhotoProxyImage];
  unint64_t v13 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings outputWidth];
  unint64_t v14 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings outputHeight];
  unint64_t v63 = v14;
  if (v12) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = 0;
  }
  if (v12) {
    unint64_t v16 = v13;
  }
  else {
    unint64_t v16 = 0;
  }
  uint64_t v17 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings resolutionFlavor];
  if (!v17)
  {
    unsigned int v65 = 0;
    goto LABEL_87;
  }
  uint64_t v18 = v17;
  unsigned int v65 = v17;
  if (![(NSArray *)self->_highResStillImageDimensions count])
  {
LABEL_87:
    BOOL v62 = 0;
    BOOL v29 = 0;
    int64_t v30 = v15;
LABEL_89:
    unint64_t v12 = v16;
    goto LABEL_50;
  }
  id v19 = +[FigCaptureSourceFormatDimensions identifyDimensionsFromFlavor:v18 availableHighResStillImageDimensions:self->_highResStillImageDimensions];
  if (!v19)
  {
    BOOL v62 = 0;
    BOOL v29 = 0;
    int64_t v30 = v15;
    unint64_t v16 = v16;
    goto LABEL_89;
  }
  long long v20 = v19;
  unint64_t v21 = [(BWStillImageCaptureSettings *)self->_currentResolvedStillImageCaptureSettings captureFlags];
  unint64_t v22 = v21;
  BOOL v24 = (v21 & 0x100000000) == 0 && v18 == 2;
  BOOL v26 = (v21 & 0x200000000) == 0 && v18 == 1;
  BOOL v27 = v24;
  BOOL v62 = v26;
  if (v24 || v26)
  {
    id v28 = +[FigCaptureSourceFormatDimensions identifyDimensionsFromFlavor:0 availableHighResStillImageDimensions:self->_highResStillImageDimensions];
    if (!v28)
    {
      unsigned int v65 = 0;
      int64_t v30 = v15;
      unint64_t v16 = v16;
      unint64_t v12 = v16;
      goto LABEL_49;
    }
    long long v20 = v28;
    unint64_t v13 = [v28 dimensions];
    unsigned int v65 = 0;
    unint64_t v63 = HIDWORD(v13);
  }
  if ((v22 & 0x200000000) != 0) {
    objc_msgSend(+[FigCaptureSourceFormatDimensions identifyDimensionsFromFlavor:availableHighResStillImageDimensions:](FigCaptureSourceFormatDimensions, "identifyDimensionsFromFlavor:availableHighResStillImageDimensions:", 0, self->_highResStillImageDimensions), "dimensions");
  }
  if (!v12)
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    int64_t v30 = 0;
LABEL_49:
    BOOL v29 = v27;
LABEL_50:
    unint64_t v31 = v63;
    goto LABEL_52;
  }
  BOOL v29 = v27;
  if (FigCaptureVideoDimensionsAreValid([v20 deferredPhotoProxyDimensions]))
  {
    unint64_t v12 = [v20 deferredPhotoProxyDimensions];
    unint64_t v15 = HIDWORD(v12);
    unint64_t v16 = v13;
    int64_t v30 = v63;
    unint64_t v31 = HIDWORD(v12);
    unint64_t v13 = v12;
  }
  else
  {
    unint64_t v31 = v63;
    unint64_t v15 = v63;
    unint64_t v16 = v13;
    int64_t v30 = v63;
    unint64_t v12 = v13;
  }
LABEL_52:
  if ([(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings deviceOrientationCorrectionEnabled])
  {
    unint64_t v64 = v13;
    uint64_t v32 = v65;
    if (self->_cinematicFramingWarpingRequired
      || (-[BWStillImageCoordinatorNode _ensureDeviceOrientationMonitor]((uint64_t)self),
          (unsigned int v61 = [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor mostRecentPortraitLandscapeOrientation]) == 0))
    {
      int64_t v33 = v30;
      unint64_t v34 = v15;
      unint64_t v35 = v16;
      unint64_t v16 = v33;
    }
    else
    {
      if (dword_1EB4C5490)
      {
        unsigned int v72 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v39 = v72;
        BOOL v40 = os_log_type_enabled(v38, type);
        unsigned int v41 = v39 & 0xFFFFFFFE;
        if (v40) {
          unsigned int v41 = v39;
        }
        if (v41)
        {
          int v42 = v30;
          int64_t v30 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings settingsID];
          int v43 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings outputOrientation];
          int v74 = 136315906;
          v75 = "-[BWStillImageCoordinatorNode _configureCurrentCaptureRequestStateForFigCaptureStillImageSettings]";
          __int16 v76 = 2048;
          int64_t v77 = v30;
          LODWORD(v30) = v42;
          __int16 v78 = 1024;
          int v79 = v43;
          __int16 v80 = 1024;
          unsigned int v81 = v61;
          LODWORD(v58) = 34;
          long long v55 = &v74;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      unsigned int v59 = v30;
      -[FigCaptureStillImageSettings setOutputOrientation:](self->_currentRequestedStillImageCaptureSettings, "setOutputOrientation:", v61, v55, v58);
      int v60 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings outputMirroring];
      uint64_t v44 = objc_msgSend(-[NSArray firstObject](-[BWStillImageCaptureSettings captureStreamSettings](self->_currentResolvedStillImageCaptureSettings, "captureStreamSettings"), "firstObject"), "portType");
      if ([v44 isEqual:*MEMORY[0x1E4F52DF8]]) {
        int v45 = 1;
      }
      else {
        int v45 = [v44 isEqual:*MEMORY[0x1E4F52E10]];
      }
      int v46 = [(BWFigVideoCaptureDevice *)self->_captureDevice isExternalVariant];
      [(BWGraph *)[(BWNode *)self graph] clientExpectsCameraMountedInLandscapeOrientation];
      int v47 = FigCaptureRotationDegreesFromOrientation(v61, v45, v46, v60);
      if (v47 == 270 || v47 == 90)
      {
        if (dword_1EB4C5490)
        {
          unint64_t v66 = v15;
          unsigned int v72 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v49 = v72;
          if (os_log_type_enabled(v48, type)) {
            unsigned int v50 = v49;
          }
          else {
            unsigned int v50 = v49 & 0xFFFFFFFE;
          }
          if (v50)
          {
            int64_t v51 = [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings settingsID];
            int v74 = 136316930;
            v75 = "-[BWStillImageCoordinatorNode _configureCurrentCaptureRequestStateForFigCaptureStillImageSettings]";
            __int16 v76 = 2048;
            int64_t v77 = v51;
            __int16 v78 = 1024;
            int v79 = v31;
            __int16 v80 = 1024;
            unsigned int v81 = v64;
            __int16 v82 = 1024;
            int v83 = v15;
            __int16 v84 = 1024;
            int v85 = v12;
            __int16 v86 = 1024;
            unint64_t v52 = v59;
            unsigned int v87 = v59;
            __int16 v88 = 1024;
            int v89 = v16;
            LODWORD(v58) = 58;
            long long v55 = &v74;
            _os_log_send_and_compose_impl();
          }
          else
          {
            unint64_t v52 = v59;
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          unint64_t v34 = v12;
          unint64_t v35 = v52;
          unint64_t v36 = v64;
          unint64_t v15 = v66;
        }
        else
        {
          unint64_t v34 = v12;
          unint64_t v35 = v59;
          unint64_t v36 = v64;
        }
        goto LABEL_57;
      }
      unint64_t v34 = v15;
      unint64_t v35 = v16;
      unint64_t v16 = v59;
    }
    unint64_t v15 = v12;
    unint64_t v36 = v31;
    unint64_t v31 = v64;
  }
  else
  {
    int64_t v37 = v30;
    unint64_t v34 = v15;
    unint64_t v35 = v16;
    unint64_t v16 = v37;
    unint64_t v15 = v12;
    unint64_t v36 = v31;
    unint64_t v31 = v13;
    uint64_t v32 = v65;
  }
LABEL_57:
  -[FigCaptureStillImageSettings setOutputWidth:](self->_currentRequestedStillImageCaptureSettings, "setOutputWidth:", v31, v55, v58);
  [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setOutputHeight:v36];
  if ([(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings rawThumbnailWidth] > v31|| [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings rawThumbnailHeight] > v36)
  {
    [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setRawThumbnailWidth:v31];
    [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setRawThumbnailHeight:v36];
  }
  [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setResolutionFlavor:v32];
  [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setDeferredPhotoProxyWidth:v15];
  [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setDeferredPhotoProxyHeight:v34];
  [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setDeferredPhotoFinalWidth:v35];
  [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setDeferredPhotoFinalHeight:v16];
  if (v29 || v62)
  {
    BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(self->_currentRequestedStillImageCaptureSettings, 0.0);
    [(FigCaptureStillImageSettings *)self->_currentRequestedStillImageCaptureSettings setBypassUpscaling:0];
  }
  float v4 = &OBJC_IVAR___BWStillImageCoordinatorNode__firedDelegateCallbackFlags;
LABEL_63:
  *(_DWORD *)((char *)&self->super.super.isa + *v4) = 0;
}

- (uint64_t)_setupProcessing
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = (BWStillImageSettings *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v14 = v1;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    if (dword_1EB4C5490)
    {
      int v21 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ([(NSArray *)[(BWPhotoManifest *)[(BWStillImageProcessingSettings *)v2[8]._processingSettings photoManifest] photoDescriptors] count])
    {
      unint64_t v4 = 0;
      do
      {
        if (dword_1EB4C5490)
        {
          int v21 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          float v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v4;
      }
      while ([(NSArray *)[(BWPhotoManifest *)[(BWStillImageProcessingSettings *)v2[8]._processingSettings photoManifest] photoDescriptors] count] > v4);
    }
    float v6 = -[BWStillImageCoordinatorNode _currentStillImageSettings](v2);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)v6 captureSettings] captureStreamSettings];
    uint64_t result = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (result)
    {
      uint64_t v8 = result;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          char v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
          if ([v11 isYUVCapture]) {
            objc_msgSend((id)objc_msgSend((id)-[BWStillImageSettings outputs](v2, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)-[BWStillImageCaptureSettings objectForKeyedSubscript:](v2[3]._captureSettings, "objectForKeyedSubscript:", objc_msgSend(v11, "portType")), "index")), "emitStillImagePrewarmMessageWithSettings:", v6);
          }
          if ([v11 isSensorRawCapture]) {
            objc_msgSend((id)objc_msgSend((id)-[BWStillImageSettings outputs](v2, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)-[objc_class objectForKeyedSubscript:](v2[4].super.isa, "objectForKeyedSubscript:", objc_msgSend(v11, "portType")), "index")), "emitStillImagePrewarmMessageWithSettings:", v6);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t result = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
        uint64_t v8 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BWPhotoManifest)_resolvePhotoManifest
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = (BWStillImageSettings *)result;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v55 = v1;
    LODWORD(v54) = 0;
    FigDebugAssert3();
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v54, v55);
  unint64_t v4 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
  int v5 = [(BWStillImageCaptureSettings *)v2[8]._captureSettings captureType];
  unsigned int v6 = [(BWStillImageCaptureSettings *)v2[8]._captureSettings captureFlags];
  uint64_t v7 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
  if ([(FigCaptureStillImageSettings *)v2[8]._requestedSettings outputFormat])
  {
    int v8 = 1;
    if ((v6 & 0x800) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    int v8 = [(FigCaptureStillImageSettings *)v2[8]._requestedSettings isBeginMomentCaptureSettings];
    if ((v6 & 0x800) == 0)
    {
LABEL_12:
      int v9 = 0;
      goto LABEL_13;
    }
  }
  if (![(FigCaptureStillImageSettings *)v2[8]._requestedSettings depthDataDeliveryEnabled]) {
    goto LABEL_12;
  }
  if ([(FigCaptureStillImageSettings *)v2[8]._requestedSettings depthDataFiltered]) {
    int v9 = 32;
  }
  else {
    int v9 = 16;
  }
LABEL_13:
  int v10 = 0;
  int v11 = v5 - 1;
  uint64_t v57 = v2;
  uint64_t v12 = v9 | (v6 >> 5) & 0x200;
  switch(v11)
  {
    case 0:
    case 1:
      if ([(FigCaptureStillImageSettings *)v2[8]._requestedSettings constantColorEnabled]) {
        uint64_t v12 = v12 | 0x80000;
      }
      else {
        uint64_t v12 = v12;
      }
      unsigned int v15 = [(NSArray *)[(FigCaptureStillImageSettings *)v2[8]._requestedSettings bravoConstituentImageDeliveryDeviceTypes] count];
      if (v15 <= 1) {
        int v10 = 1;
      }
      else {
        int v10 = v15;
      }
      if ([(FigCaptureStillImageSettings *)v2[8]._requestedSettings constantColorEnabled]
        && [(FigCaptureStillImageSettings *)v2[8]._requestedSettings constantColorFallbackPhotoDeliveryEnabled])
      {
        int v10 = 2;
        goto LABEL_54;
      }
      if (v10 >= 1)
      {
LABEL_54:
        int v22 = v10;
        int v56 = v10;
        do
        {
          if ((v6 & 0x100) != 0) {
            objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12 | 0x10000));
          }
          if (FigCapturePixelFormatIsBayerRaw(-[FigCaptureStillImageSettings rawOutputFormat](v2[8]._requestedSettings, "rawOutputFormat")))objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12 | 0x80)); {
          if (v8)
          }
            objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
          --v22;
        }
        while (v22);
        goto LABEL_81;
      }
LABEL_82:
      if (objc_msgSend((id)objc_msgSend(*(id *)((char *)&v2->super.isa + v7[184]), "originalImageFilters"), "count")) {
        BOOL v24 = v10 < 1;
      }
      else {
        BOOL v24 = 1;
      }
      if (!v24)
      {
        uint64_t v25 = 0;
        do
        {
          int v26 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v25), "unsignedIntValue");
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v25++, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v26 | 4u));
        }
        while (v10 != v25);
      }
      if ([v3 count])
      {
        unint64_t v27 = 0;
        do
        {
          unsigned int v28 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v27), "unsignedIntValue");
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            BOOL v29 = *(Class *)((char *)&v2->super.isa + v7[184]);
          }
          else {
            BOOL v29 = 0;
          }
          int64_t v30 = -[BWStillImageCoordinatorNode _currentStillImageSettings](v2);
          if (BWIsSmartStyleCapture(v30)) {
            int v31 = ([v29 smartStyle] != 0) << 21;
          }
          else {
            int v31 = 0;
          }
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v27++, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v31 | v28));
        }
        while ([v3 count] > v27);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)((char *)&v2->super.isa + v7[184]), "processedImageFilters"), "count"))
      {
        int v32 = BWCIFilterArrayContainsPortraitFilters((void *)[*(id *)((char *)&v2->super.isa + v7[184]) processedImageFilters]);
        BOOL v33 = BWCIFilterArrayOnlyContainsPortraitFilters((void *)[*(id *)((char *)&v2->super.isa + v7[184]) processedImageFilters]);
        int v34 = v32 & (v6 >> 11);
        unint64_t v35 = -[BWStillImageCoordinatorNode _currentStillImageSettings](v57);
        int v36 = BWIsSmartStyleAllowedForAdjustedImage(v35);
        if ((v34 & 1) != 0 || !v33)
        {
          if ([v3 count])
          {
            unint64_t v39 = 0;
            if (v36) {
              int v40 = 0x200000;
            }
            else {
              int v40 = 0;
            }
            if (v34) {
              int v41 = 72;
            }
            else {
              int v41 = 8;
            }
            int v42 = v41 | v40;
            do
            {
              unsigned int v43 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v39), "unsignedIntValue");
              objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v42 | v43), v39 + 1);
              v39 += 2;
            }
            while ([v3 count] > v39);
          }
        }
        else if ((v6 & 0x800) != 0 && [v3 count])
        {
          unint64_t v37 = 0;
          do
          {
            int v38 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v37), "unsignedIntValue");
            objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v37++, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v38 | 0x1000000u));
          }
          while ([v3 count] > v37);
        }
      }
      if (-[BWStillImageCaptureSettings deliverDeferredPhotoProxyImage](v57[8]._captureSettings, "deliverDeferredPhotoProxyImage")&& [v3 count])
      {
        unint64_t v44 = 0;
        do
        {
          int v45 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v44), "unsignedIntValue");
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v44++, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v45 | 0x1000u));
        }
        while ([v3 count] > v44);
      }
      int v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v47 = [v3 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v59 != v49) {
              objc_enumerationMutation(v3);
            }
            int64_t v51 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            unint64_t v52 = [BWPhotoDescriptor alloc];
            uint64_t v53 = -[BWPhotoDescriptor initWithPhotoIdentifier:processingFlags:](v52, "initWithPhotoIdentifier:processingFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), objc_msgSend(v51, "unsignedLongValue"));
            [v46 addObject:v53];
          }
          uint64_t v48 = [v3 countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v48);
      }
      uint64_t result = [[BWPhotoManifest alloc] initWithDescriptors:v46 captureRequestIdentifier:[(FigCaptureStillImageSettings *)v57[8]._requestedSettings captureRequestIdentifier]];
      break;
    case 2:
      if ([(BWStillImageCaptureSettings *)v2[8]._captureSettings deliverOriginalImage]) {
        int v10 = 2;
      }
      else {
        int v10 = 1;
      }
      if ([(BWStillImageCaptureSettings *)v2[8]._captureSettings deliverOriginalImage]) {
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12 | 1));
      }
      uint64_t v12 = v12 | 2;
      goto LABEL_69;
    case 3:
    case 4:
    case 7:
      unsigned int v13 = [(NSArray *)[(FigCaptureStillImageSettings *)v2[8]._requestedSettings bravoConstituentImageDeliveryDeviceTypes] count];
      if (v13 <= 1) {
        int v10 = 1;
      }
      else {
        int v10 = v13;
      }
      if (v10 >= 1)
      {
        int v14 = v10;
        do
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
          --v14;
        }
        while (v14);
      }
      goto LABEL_82;
    case 5:
    case 10:
      if ((v6 & 0x100) != 0) {
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12 | 0x10000));
      }
      int v10 = 1;
      if ((v8 & 1) == 0) {
        goto LABEL_82;
      }
LABEL_69:
      objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
      goto LABEL_82;
    case 6:
      int v10 = [(FigCaptureStillImageSettings *)v2[8]._requestedSettings bracketImageCount];
      if ([(NSArray *)[(FigCaptureStillImageSettings *)v2[8]._requestedSettings bravoConstituentImageDeliveryDeviceTypes] count])
      {
        v10 *= [(NSArray *)[(FigCaptureStillImageSettings *)v2[8]._requestedSettings bravoConstituentImageDeliveryDeviceTypes] count];
      }
      if (v10 < 1) {
        goto LABEL_82;
      }
      int v23 = v10;
      int v56 = v10;
      do
      {
        if ((v6 & 0x100) != 0) {
          objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12 | 0x10000));
        }
        if (FigCapturePixelFormatIsBayerRaw(-[FigCaptureStillImageSettings rawOutputFormat](v2[8]._requestedSettings, "rawOutputFormat")))objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12 | 0x80)); {
        if (v8)
        }
          objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
        --v23;
      }
      while (v23);
      goto LABEL_81;
    case 9:
    case 11:
      unsigned int v16 = [(NSArray *)[(FigCaptureStillImageSettings *)v2[8]._requestedSettings bravoConstituentImageDeliveryDeviceTypes] count];
      if (v16 <= 1) {
        int v10 = 1;
      }
      else {
        int v10 = v16;
      }
      if (v10 < 1) {
        goto LABEL_82;
      }
      int v17 = v10;
      int v56 = v10;
      do
      {
        if ((v6 & 0x100) != 0)
        {
          if (([*(id *)((char *)&v2->super.isa + v4[185]) captureFlags] & 0x100000) != 0) {
            int v18 = 65538;
          }
          else {
            int v18 = 0x10000;
          }
          objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v18 | v12));
        }
        if (v8)
        {
          unsigned int v19 = [*(id *)((char *)&v2->super.isa + v4[185]) captureFlags];
          objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", (v19 >> 19) & 2 | v12));
        }
        if ([*(id *)((char *)&v2->super.isa + v4[185]) deliverOriginalImage])
        {
          __int16 v20 = [*(id *)((char *)&v2->super.isa + v4[185]) captureFlags];
          uint64_t v21 = [NSNumber numberWithUnsignedInt:v12 | 1];
          if ((v20 & 0x2000) != 0) {
            [v3 addObject:v21];
          }
          else {
            [v3 insertObject:v21 atIndex:0];
          }
          unint64_t v4 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
        }
        --v17;
      }
      while (v17);
      uint64_t v7 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
LABEL_81:
      int v10 = v56;
      goto LABEL_82;
    default:
      goto LABEL_82;
  }
  return result;
}

- (uint64_t)_fireDelegateCallbackWithInfo:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      int v4 = *(_DWORD *)(result + 288);
      uint64_t result = [a2 flag];
      if ((result & v4) == 0)
      {
        int v5 = *(void **)(v3 + 296);
        if (v5)
        {
          return [v5 addObject:a2];
        }
        else
        {
          int v6 = [a2 flag];
          if (v6 > 15)
          {
            if (v6 > 63)
            {
              if (v6 == 64)
              {
                [*(id *)(v3 + 152) stillImageCoordinator:v3 willPrepareStillImageCaptureWithSettings:-[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3) clientInitiated:0];
              }
              else if (v6 == 128)
              {
                [*(id *)(v3 + 152) stillImageCoordinator:v3 readyToRespondToRequestAfterRequestWithSettings:-[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3)];
              }
            }
            else if (v6 == 16)
            {
LABEL_18:
              uint64_t v7 = *(void **)(v3 + 152);
              [a2 pts];
              objc_msgSend(v7, "stillImageCoordinator:didResolveStillImagePTS:forSettings:isPreBracketedEV0:", v3, v8, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3), objc_msgSend(a2, "isPreBracketFrame"));
            }
            else if (v6 == 32)
            {
              [*(id *)(v3 + 152) stillImageCoordinator:v3 didCapturePhotoForSettings:-[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3)];
            }
          }
          else
          {
            switch(v6)
            {
              case 1:
                objc_msgSend(*(id *)(v3 + 152), "stillImageCoordinator:willBeginCaptureBeforeResolvingSettingsForID:", v3, objc_msgSend(*(id *)(v3 + 264), "settingsID"));
                break;
              case 2:
                [*(id *)(v3 + 152) stillImageCoordinator:v3 willBeginCaptureForSettings:-[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3)];
                break;
              case 4:
                [*(id *)(v3 + 152) stillImageCoordinator:v3 willCapturePhotoForSettings:-[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3) error:0];
                break;
              case 8:
                goto LABEL_18;
              default:
                break;
            }
          }
          uint64_t result = [a2 flag];
          *(_DWORD *)(v3 + 288) |= result;
        }
      }
    }
  }
  return result;
}

- (BOOL)_waitUntilShotBufferHasEnoughFreeBuffersWithTimeout:(float)a3 freeBufferCountOut:
{
  if (!result) {
    return result;
  }
  uint64_t v6 = result;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v38 = v3;
    LODWORD(v36) = 0;
    FigDebugAssert3();
  }
  if (!*(unsigned char *)(v6 + 420)) {
    return 0;
  }
  signed int v7 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](v6);
  int v8 = -[BWStillImageCoordinatorNode _zoomBasedBufferCountForCurrentSettings](v6);
  int v42 = -[BWStillImageCoordinatorNode _ultraHighResBufferCountForCurrentSettings](v6);
  uint64_t v9 = -[BWStillImageCoordinatorNode _maxShotBufferCapacityForCurrentRequestWithBufferCount:ultraHighResBufferCount:](v6, v7, v42);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 372));
  if (*(void *)(v6 + 400) && v9 != [(id)objc_opt_class() maxShotBufferCapacity])
  {
    if (dword_1EB4C5490)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    BOOL v40 = (int)v9 < (int)[(id)objc_opt_class() maxShotBufferCapacity];
    [(id)objc_opt_class() setMaxShotBufferCapacity:v9];
  }
  else
  {
    BOOL v40 = 0;
  }
  int v11 = *(_DWORD *)(v6 + 376);
  signed int v12 = (v9 - v11) & ~(((int)v9 - v11) >> 31);
  if (v11 + v7 >= (int)[(id)objc_opt_class() maxShotBufferCapacity]) {
    int v41 = [(id)objc_opt_class() maxShotBufferCapacity];
  }
  else {
    int v41 = *(_DWORD *)(v6 + 376) + v7;
  }
  signed int v43 = v12;
  BOOL v44 = v12 >= v7;
  if (v12 < v7)
  {
    if (!*(void *)(v6 + 440))
    {
      int v14 = a2;
      if (dword_1EB4C5490)
      {
        unsigned int v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(void *)(v6 + 440) = dispatch_group_create();
      *(_DWORD *)(v6 + 448) = v7;
      dispatch_group_enter(*(dispatch_group_t *)(v6 + 440));
      unsigned int v16 = *(id *)(v6 + 440);
      goto LABEL_23;
    }
  }
  else if (!dword_1EB4C5490)
  {
    int v14 = a2;
    goto LABEL_22;
  }
  unsigned int v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  int v14 = a2;
  os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_22:
  unsigned int v16 = 0;
LABEL_23:
  int v17 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 372));
  if (*(void *)(v6 + 400))
  {
    char v18 = [*(id *)(v6 + 272) captureFlags];
    if (![*(id *)(v6 + 400) passthroughEnabled] || (int v19 = v41, (v18 & 2) != 0)) {
      int v19 = [(id)objc_opt_class() maxShotBufferCapacity];
    }
    int v20 = *(_DWORD *)(v6 + 428) - v19;
    if (v20 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v20;
    }
    if (objc_msgSend(*(id *)(v6 + 400), "uncompressedEquivalentCapacity", v36, v38) != v21)
    {
      if (dword_1EB4C5490)
      {
        int v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v17 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
      }
      objc_msgSend(*(id *)(v6 + 400), "setUncompressedEquivalentCapacity:", v21, v37, v39);
    }
  }
  if (v16)
  {
    int v23 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    BOOL v24 = v14;
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    dispatch_time_t v25 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
    intptr_t v26 = dispatch_group_wait(v16, v25);
    BOOL v44 = v26 == 0;
    int v27 = v8;
    if (*v23 == 1) {
      kdebug_trace();
    }
    if (v26)
    {
      unsigned int v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v17 = &OBJC_IVAR___BWUBProcessorController__requestQueue;
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 372));
      if (*(NSObject **)(v6 + 440) == v16)
      {
        dispatch_group_leave(v16);

        *(void *)(v6 + 440) = 0;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 372));
    }
  }
  else
  {
    BOOL v24 = v14;
    int v27 = v8;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + v17[183]));
  int v29 = *(_DWORD *)(v6 + 376) + v7;
  if (v29 >= (int)[(id)objc_opt_class() maxShotBufferCapacity]) {
    uint64_t v30 = [(id)objc_opt_class() maxShotBufferCapacity];
  }
  else {
    uint64_t v30 = (*(_DWORD *)(v6 + 376) + v7);
  }
  uint64_t v31 = (*(_DWORD *)(v6 + 380) + v27);
  uint64_t v32 = (*(_DWORD *)(v6 + 384) + v42);
  mach_absolute_time();
  uint64_t v33 = FigHostTimeToNanoseconds();
  char v34 = [*(id *)(v6 + 272) captureFlags];
  if (([*(id *)(v6 + 400) passthroughEnabled] && (v34 & 2) == 0
     || !*(_DWORD *)(v6 + 496) && !*(_DWORD *)(v6 + 376) && (float)((float)(v33 / 1000) / 1000000.0) > 2.0)
    && v30 != *(_DWORD *)(v6 + 424))
  {
    goto LABEL_59;
  }
  if ((int)v30 > *(_DWORD *)(v6 + 424) || v31 != *(_DWORD *)(v6 + 432)) {
    goto LABEL_59;
  }
  int v35 = v40;
  if (v32 != *(_DWORD *)(v6 + 436)) {
    int v35 = 1;
  }
  if (v35 == 1)
  {
LABEL_59:
    *(_DWORD *)(v6 + 424) = v30;
    *(_DWORD *)(v6 + 432) = v31;
    *(_DWORD *)(v6 + 436) = v32;
    [(id)objc_opt_class() setCurrentAllocatedShotBufferCapacity:v30];
    [(id)objc_opt_class() setNumberOfZoomBasedBufferIncludedInShotBuffer:v31];
    [(id)objc_opt_class() setNumberOfUltraHighResBufferIncludedInShotBuffer:v32];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + v17[183]));
  if (v24) {
    *BOOL v24 = v43;
  }
  return v44;
}

- (uint64_t)_expectedFrameCountForCurrentRequest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  LODWORD(v5) = 0;
  uint64_t v6 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v2);
      }
      int v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      int v9 = [v8 expectedFrameCaptureCount] + v5;
      int v10 = [v8 expectedUltraHighResFrameCaptureCount];
      uint64_t v5 = (v9 - v10 + *(_DWORD *)(a1 + 388) * v10);
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v4);
  return v5;
}

- (void)_readyToRespondToRequest
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](a1, 128);
  }
}

- (uint64_t)_receivedFrameOrErrorCountForCurrentRequest
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v2 = (void *)[*(id *)(result + 272) captureStreamSettings];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = 0;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v2);
          }
          v5 += objc_msgSend((id)objc_msgSend(*(id *)(v1 + 240), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "portType")), "intValue");
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
    }
    else
    {
      int v5 = 0;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v8 = objc_msgSend(*(id *)(v1 + 272), "captureStreamSettings", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += objc_msgSend((id)objc_msgSend(*(id *)(v1 + 248), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * j), "portType")), "intValue");
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      int v11 = 0;
    }
    return (v5 - v11 + *(_DWORD *)(v1 + 388) * v11);
  }
  return result;
}

- (uint64_t)_expectedFrameCountForNextRequest
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v16 = v1;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  uint64_t v3 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
  if (*(unsigned char *)(a1 + 480))
  {
    if (*(_DWORD *)(a1 + 496) == *(_DWORD *)(a1 + 484) && *(int *)(a1 + 196) >= 1)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v4 = *(void **)(a1 + 184);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v18 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            char v10 = objc_msgSend(v9, "isUserInitiatedRequestSettings", v15, v16);
            char v11 = [v9 isClientInitiatedPrepareSettings];
            if ((v10 & 1) == 0 && (v11 & 1) == 0)
            {
              char v12 = [v9 burstQualityCaptureEnabled];
              char v13 = BWCIFilterArrayContainsPortraitFilters((void *)[v9 processedImageFilters]);
              if ((v12 & 1) == 0 && (v13 & 1) == 0)
              {
                if ([v9 depthDataDeliveryEnabled]) {
                  uint64_t v3 = 6;
                }
                else {
                  uint64_t v3 = 3;
                }
              }
              goto LABEL_22;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_22:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  return v3;
}

void __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 208);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke_2;
  block[3] = &unk_1E5C24430;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke_2(uint64_t a1)
{
  return -[BWStillImageCoordinatorNode _attemptToCompleteRequest](*(void *)(a1 + 32));
}

- (uint64_t)_waitToMakePaceWithReferenceTime:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 452))
    {
      uint64_t result = [*(id *)(result + 272) captureType];
      if (result != 1)
      {
        uint64_t v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        if (*MEMORY[0x1E4F1EBA8] == 1) {
          kdebug_trace();
        }
        mach_absolute_time();
        uint64_t result = FigHostTimeToNanoseconds();
        float v3 = (float)(result / 1000) / 1000000.0;
        float v4 = 1.0 / *(float *)(v1 + 456);
        if (v3 < v4)
        {
          float v5 = v4 - v3;
          if (v5 > 0.0) {
            uint64_t result = usleep((float)(v5 * 1000000.0));
          }
        }
        if (*v2 == 1)
        {
          return kdebug_trace();
        }
      }
    }
  }
  return result;
}

uint64_t __58__BWStillImageCoordinatorNode__completeRequestWithStatus___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 184) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
  if (*(unsigned char *)(a1 + 40)) {
    unsigned int v3 = 8;
  }
  else {
    unsigned int v3 = 4;
  }
  if (*(unsigned char *)(a1 + 40)) {
    unsigned int v4 = 2;
  }
  else {
    unsigned int v4 = 1;
  }
  if (v2) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 232);
  return [v6 transitionToState:v5];
}

void __84__BWStillImageCoordinatorNode__stoppedUsingBufferWithSensorRawHighResolutionFlavor___block_invoke(uint64_t a1)
{
}

- (uint64_t)_zoomBasedBufferCountForCurrentSettings
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      if (objc_msgSend(*(id *)(a1 + 104), "isPortTypeUsingZoomBasedSourceSensorRaws:", objc_msgSend(v8, "portType")))
      {
        int v9 = [v8 expectedFrameCaptureCount];
        uint64_t v5 = v9 + v5 - [v8 expectedUltraHighResFrameCaptureCount];
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v4);
  return v5;
}

- (uint64_t)_ultraHighResBufferCountForCurrentSettings
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  LODWORD(v4) = 0;
  uint64_t v5 = *(void *)v9;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v1);
      }
      uint64_t v4 = [*(id *)(*((void *)&v8 + 1) + 8 * i) expectedUltraHighResFrameCaptureCount]
         + v4;
    }
    uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  }
  while (v3);
  return v4;
}

- (uint64_t)_maxShotBufferCapacityForCurrentRequestWithBufferCount:(int)a3 ultraHighResBufferCount:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = [(id)objc_opt_class() maxShotBufferCapacity];
  if (!*(void *)(a1 + 400)) {
    return v6;
  }
  char v7 = [*(id *)(a1 + 272) captureFlags];
  int v8 = [*(id *)(a1 + 272) captureType];
  int v9 = [*(id *)(a1 + 400) minimumUncompressedEquivalentCapacity];
  if ([*(id *)(a1 + 400) passthroughEnabled])
  {
    if ((v7 & 2) != 0)
    {
      int v10 = *(_DWORD *)(a1 + 384);
      int v11 = *(_DWORD *)(a1 + 388) * v10;
      if (v10 >= 1) {
        int v12 = v11 + 1;
      }
      else {
        int v12 = 1;
      }
      int v13 = (*(_DWORD *)(a1 + 376) - v11) & ~((*(_DWORD *)(a1 + 376) - v11) >> 31);
      int v14 = *(_DWORD *)(a1 + 416);
      if (v14 == -1)
      {
        *(_DWORD *)(a1 + 416) = v13;
        int v14 = *(_DWORD *)(a1 + 416);
      }
      BOOL v15 = v13 < v14;
      if (v13 < v14) {
        int v14 = v13;
      }
      int v16 = v14 + v12;
      if (v15) {
        *(_DWORD *)(a1 + 416) = v13;
      }
    }
    else
    {
      if (![*(id *)(a1 + 400) compressionResourcesAllocated]) {
        int v9 = 0;
      }
      if (v8 == 11) {
        unsigned int v17 = 0;
      }
      else {
        unsigned int v17 = a2;
      }
      int v16 = *(_DWORD *)(a1 + 376) + v17;
      if ((*(_DWORD *)(a1 + 416) & 0x80000000) == 0) {
        *(_DWORD *)(a1 + 416) = -1;
      }
    }
  }
  else
  {
    int v16 = 0;
    if ((v7 & 2) == 0 && v8 != 11)
    {
      if (a3 < 1) {
        int v16 = 1;
      }
      else {
        int v16 = *(_DWORD *)(a1 + 388) * a3;
      }
    }
    int v18 = *(_DWORD *)(a1 + 384);
    if (v18 >= 1) {
      v16 += *(_DWORD *)(a1 + 388) * v18;
    }
  }
  if (*(_DWORD *)(a1 + 428) - v9 <= 1) {
    int v19 = 1;
  }
  else {
    int v19 = *(_DWORD *)(a1 + 428) - v9;
  }
  unsigned int v20 = v16 + a2;
  if ((int)(v16 + a2) >= v19) {
    unsigned int v20 = v19;
  }
  if (v16) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = a2;
  }
  if (([*(id *)(a1 + 400) passthroughEnabled] & 1) == 0
    && [*(id *)(a1 + 272) captureType] != 11)
  {
    int v22 = [*(id *)(a1 + 104) thermalSystemPressureLevel];
    if (v22 == 2)
    {
      int v23 = &OBJC_IVAR___BWStillImageCoordinatorNode__extraUncompressedShotBufferCapacityForThermalSystemPressureLevelSerious;
    }
    else
    {
      if (v22 < 3) {
        return v21;
      }
      int v23 = &OBJC_IVAR___BWStillImageCoordinatorNode__extraUncompressedShotBufferCapacityForThermalSystemPressureLevelCritical;
    }
    int v24 = *(_DWORD *)(a1 + *v23);
    unsigned int v25 = v24 + v21;
    if (v24 + (int)v21 >= v19) {
      unsigned int v25 = v19;
    }
    if (v24 <= 0) {
      return v21;
    }
    else {
      return v25;
    }
  }
  return v21;
}

- (id)_stillImageDispatchQueue
{
  return self->_stillImageDispatchQueue;
}

- (id)_stateMachine
{
  return self->_stateMachine;
}

- (BWStillImageCaptureStatusDelegate)stillImageCaptureStatusDelegate
{
  return self->_stillImageCaptureStatusDelegate;
}

- (BWStillImageProcessingSupportProvider)stillImageProcessingSupportProvider
{
  return self->_stillImageProcessingSupportProvider;
}

- (BOOL)cinematicFramingWarpingRequired
{
  return self->_cinematicFramingWarpingRequired;
}

@end