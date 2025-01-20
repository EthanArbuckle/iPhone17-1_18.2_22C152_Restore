@interface BWInferenceEngineController
+ (BOOL)usesCustomProcessingFlow;
+ (__CVBuffer)inferenceMaskFromSbuf:(opaqueCMSampleBuffer *)a3 attachedMediaKey:(id)a4;
+ (id)faceObservationsFromSbuf:(opaqueCMSampleBuffer *)a3;
+ (id)lowResPersonInstanceBoundingBoxesFromSbuf:(opaqueCMSampleBuffer *)a3;
+ (id)lowResPersonInstanceConfidencesFromSbuf:(opaqueCMSampleBuffer *)a3;
+ (id)lowResPersonInstanceMasksFromSbuf:(opaqueCMSampleBuffer *)a3;
+ (id)skinToneClassificationsFromSbuf:(opaqueCMSampleBuffer *)a3;
+ (id)smartCameraClassificationsFromSbuf:(opaqueCMSampleBuffer *)a3;
+ (opaqueCMSampleBuffer)inferenceMaskSbufFromSbuf:(opaqueCMSampleBuffer *)a3 attachedMediaKey:(id)a4;
- (BOOL)inferenceEnginePrepared;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BWInferenceEngineController)initWithConfiguration:(id)a3 contextName:(id)a4;
- (NSArray)providedAttachedMediaKeys;
- (OpaqueVTPixelTransferSession)_ensurePixelTransferSessionForAttachedMediaKey:(id)a3;
- (id)_suppressedInferenceTypesForInput:(id)a3;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)_unzoomAndBlackenBordersOnAttachedMediaSampleBuffer:(opaqueCMSampleBuffer *)a3 inputSbuf:(opaqueCMSampleBuffer *)a4 attachedMediaKey:(id)a5 finalCropRect:(CGRect)a6;
- (int)prepare;
- (int)prepareWithPixelBufferPoolProvider:(id)a3;
- (int)process;
- (void)dealloc;
- (void)inputReceivedNewData:(id)a3;
- (void)reset;
@end

@implementation BWInferenceEngineController

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return [a3 isEqualToString:@"PrimaryFormat"];
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  if (![a3 isEqualToString:@"PrimaryFormat"]) {
    return 0;
  }
  LODWORD(v6) = 0;
  v4 = [[BWInferenceVideoFormat alloc] initWithUnderlyingFormat:self->_inputFormat isDeviceOriented:0 videoContentMode:0 includesInvalidContent:0 cropDescriptor:0 histogramRequest:0 rotationDegrees:v6];
  return v4;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return [(NSDictionary *)self->_inferenceOutputFormatByAttachedMediaKey objectForKeyedSubscript:a3];
}

- (NSArray)providedAttachedMediaKeys
{
  return [(NSDictionary *)self->_inferenceOutputFormatByAttachedMediaKey allKeys];
}

- (int)prepareWithPixelBufferPoolProvider:(id)a3
{
  int v5 = [(BWInferenceEngine *)self->_inferenceEngine enableIntermediateBufferSharingWithNetworksLoadedFromPath:@"/System/Library/Frameworks/Vision.framework/"];
  if (v5)
  {
    int v6 = v5;
    goto LABEL_6;
  }
  int v6 = [(BWInferenceEngine *)self->_inferenceEngine prepareForInferenceWithFormatProvider:self pixelBufferPoolProvider:a3];
  if (v6)
  {
LABEL_6:
    FigDebugAssert3();
    return v6;
  }
  self->_inferenceEnginePrepared = 1;
  return v6;
}

- (BWInferenceEngineController)initWithConfiguration:(id)a3 contextName:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  int v6 = (NSString *)a4;
  self->_contextName = v6;
  v63.receiver = self;
  v63.super_class = (Class)BWInferenceEngineController;
  id v48 = a3;
  v47 = -[BWStillImageProcessorController initWithName:type:configuration:](&v63, sel_initWithName_type_configuration_, [NSString stringWithFormat:@"%@:%@", @"InferenceEngineController", v6], 3, a3);
  if (!v47)
  {
    FigDebugAssert3();
    goto LABEL_42;
  }
  if (![a3 inferenceScheduler]) {
    goto LABEL_42;
  }
  unsigned int v46 = [a3 figThreadPriority];
  v7 = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", [a3 inferenceScheduler], v46, 1);
  v47->_inferenceEngine = v7;
  if (!v7) {
    goto LABEL_42;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count")) {
    goto LABEL_42;
  }
  v8 = (BWVideoFormat *)(id)[a3 inputFormat];
  v47->_inputFormat = v8;
  if (!v8) {
    goto LABEL_42;
  }
  char v9 = [a3 producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom];
  v47->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom = v9;
  v47->_appliesFinalCropRect = v9;
  if ([a3 enabledVisionInferences])
  {
    v10 = [[BWFaceSegmentsWithLandmarksInferenceConfiguration alloc] initWithInferenceType:802];
    [(BWInferenceConfiguration *)v10 setPriority:v46];
    [(BWFaceSegmentsWithLandmarksInferenceConfiguration *)v10 setIncludesInvalidContent:0];
    [(BWLandmarksInferenceConfiguration *)v10 setAlwaysExecuteForRedEyeReduction:1];
    [(BWFaceSegmentsWithLandmarksInferenceConfiguration *)v10 setDetectFacesInFullSizeInput:1];
    [(BWLandmarksInferenceConfiguration *)v10 setDetectLandmarksInFullSizeInput:1];
    if (([a3 enabledVisionInferences] & 0x10) != 0)
    {
      [(BWLandmarksInferenceConfiguration *)v10 setMaximumNumberOfFaces:4];
      [(BWLandmarksInferenceConfiguration *)v10 setClampToLargestMaximumNumberOfFaces:1];
      [(BWLandmarksInferenceConfiguration *)v10 setConsiderISPRectsIfVisionFails:1];
    }
    else
    {
      [(BWLandmarksInferenceConfiguration *)v10 setMaximumNumberOfFaces:3];
      [(BWFaceSegmentsWithLandmarksInferenceConfiguration *)v10 setSkipSkinToneClassification:1];
    }
    -[BWFaceSegmentsWithLandmarksInferenceConfiguration setSkipFaceLandmarkDetection:](v10, "setSkipFaceLandmarkDetection:", ([a3 enabledVisionInferences] & 2) == 0);
    -[BWFaceSegmentsWithLandmarksInferenceConfiguration setSkipFoodAndDrinkDetection:](v10, "setSkipFoodAndDrinkDetection:", ([a3 enabledVisionInferences] & 8) == 0);
    -[BWVisionInferenceConfiguration setSuppressTimeOutFailure:](v10, "setSuppressTimeOutFailure:", [a3 suppressVisionTimeOutFailure]);
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3052000000;
    v62[3] = __Block_byref_object_copy__5;
    v62[4] = __Block_byref_object_dispose__5;
    v62[5] = v47;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __65__BWInferenceEngineController_initWithConfiguration_contextName___block_invoke;
    v61[3] = &unk_1E5C24EA0;
    v61[4] = v62;
    [(BWVisionInferenceConfiguration *)v10 setShouldPreventRequestForSampleBuffer:v61];
    int v11 = [(BWInferenceEngine *)v47->_inferenceEngine addInferenceOfType:802 version:[(BWLandmarksInferenceConfiguration *)v10 landmarksInferenceVersion] & 0xFFFFFFFFFFFFLL configuration:v10];
    _Block_object_dispose(v62, 8);
    if (v11) {
      goto LABEL_42;
    }
  }
  if (objc_msgSend((id)objc_msgSend(a3, "enabledInferenceMasks"), "count"))
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v12 = (void *)[a3 enabledInferenceMasks];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v66 count:16];
    unsigned int v14 = 0;
    uint64_t v15 = 0;
    if (v13)
    {
      uint64_t v16 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v58 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v19 = +[BWMattingV2InferenceConfiguration mattingOutputTypeForAttachedMediaKey:v18];
          if (v19)
          {
            id v20 = +[BWMattingV2InferenceConfiguration inputAttachedMediaKeyForMattingOutputType:v19];
            unsigned int v21 = +[BWPersonSemanticsConfiguration personSemanticForAttachedMediaKey:v20];
            v14 |= v19;
            if (objc_msgSend((id)objc_msgSend(v48, "enabledInferenceMasks"), "containsObject:", v20)) {
              v14 |= +[BWMattingV2InferenceConfiguration mattingOutputTypeForAttachedMediaKey:](BWMattingV2InferenceConfiguration, "mattingOutputTypeForAttachedMediaKey:", [v20 stringByAppendingString:@"Clone"]);
            }
          }
          else
          {
            unsigned int v21 = +[BWPersonSemanticsConfiguration personSemanticForAttachedMediaKey:v18];
          }
          uint64_t v15 = v21 | v15;
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v13);
    }
    uint64_t v22 = [v48 personSemanticsVersion];
    uint64_t Major = BWInferenceVersionMakeMajor(0);
    if (v15)
    {
      uint64_t v24 = BWInferenceVersionMakeMajor(3);
      if ((v15 & 0x40) != 0) {
        uint64_t v24 = BWInferenceVersionMakeMajor(4);
      }
      if ((v15 & 0x80) == 0 || !v22)
      {
LABEL_30:
        if ((_WORD)v24)
        {
          v25 = [(BWInferenceConfiguration *)[BWPersonSemanticsConfiguration alloc] initWithInferenceType:104];
          [(BWPersonSemanticsConfiguration *)v25 setEnabledSemantics:v15];
          [(BWInferenceConfiguration *)v25 setPriority:v46];
          [(BWPersonSemanticsConfiguration *)v25 setAppliesFinalCropRect:v47->_appliesFinalCropRect];
          if (![(BWInferenceEngine *)v47->_inferenceEngine addInferenceOfType:104 version:v24 & 0xFFFFFFFFFFFFLL configuration:v25])
          {
            uint64_t v26 = [v48 mattingOutputValidContentDetectionEnabled] ? v14 | 0x100 : v14;
            if (!v26) {
              goto LABEL_40;
            }
            v27 = [(BWInferenceConfiguration *)[BWMattingV2InferenceConfiguration alloc] initWithInferenceType:201];
            -[BWMattingV2InferenceConfiguration setSensorConfigurationsByPortType:](v27, "setSensorConfigurationsByPortType:", [v48 sensorConfigurationsByPortType]);
            [(BWMattingV2InferenceConfiguration *)v27 setEnabledMattes:v26];
            uint64_t v28 = [v48 fastMattingEnabled] ? 1 : 2;
            [(BWMattingV2InferenceConfiguration *)v27 setTuningConfiguration:v28];
            [(BWInferenceConfiguration *)v27 setPriority:v46];
            LODWORD(v29) = 1.0;
            [(BWMattingV2InferenceConfiguration *)v27 setMainImageDownscalingFactor:v29];
            [(BWMattingV2InferenceConfiguration *)v27 setDepthDataDeliveryEnabled:0];
            -[BWMattingV2InferenceConfiguration setMetalCommandQueue:](v27, "setMetalCommandQueue:", [v48 metalCommandQueue]);
            [(BWMattingV2InferenceConfiguration *)v27 setSubmitWithoutSynchronization:0];
            [(BWMattingV2InferenceConfiguration *)v27 setAppliesFinalCropRect:v47->_appliesFinalCropRect];
            if (![(BWInferenceEngine *)v47->_inferenceEngine addInferenceOfType:201 version:BWInferenceVersionMakeMajor(2) & 0xFFFFFFFFFFFFLL configuration:v27])goto LABEL_40; {
          }
            }
        }
LABEL_42:

        return 0;
      }
      uint64_t Major = BWInferenceVersionMakeMajor(v22);
    }
    uint64_t v24 = Major;
    goto LABEL_30;
  }
LABEL_40:
  if ([v48 smartCameraClassificationsEnabled]
    && -[BWInferenceEngine addInferenceOfType:version:configuration:](v47->_inferenceEngine, "addInferenceOfType:version:configuration:", 101, BWInferenceSmartCameraCurrentVersion() & 0xFFFFFFFFFFFFLL, -[BWInferenceConfiguration initWithInferenceType:]([BWInferenceConfiguration alloc], "initWithInferenceType:", 101))|| -[BWInferenceEngine prepareForInputVideoFormat:attachedMediaKey:](v47->_inferenceEngine, "prepareForInputVideoFormat:attachedMediaKey:", [v48 inputFormat], @"PrimaryFormat"))
  {
    goto LABEL_42;
  }
  v31 = [(BWInferenceEngine *)v47->_inferenceEngine providedVideoRequirementsByAttachedMediaKey];
  v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v33 = [(NSDictionary *)v31 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v54 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        uint64_t v37 = objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v36), "videoFormat"), "underlyingVideoFormat");
        if (v37) {
          [v32 setObject:v37 forKeyedSubscript:v36];
        }
      }
      uint64_t v33 = [(NSDictionary *)v31 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v33);
  }
  uint64_t v38 = [v32 count];
  if (v38 != [(NSDictionary *)v31 count]) {
    goto LABEL_42;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v39 = (void *)[v48 enabledInferenceMasks];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v49 objects:v64 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v50;
LABEL_57:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v50 != v41) {
        objc_enumerationMutation(v39);
      }
      v43 = *(void **)(*((void *)&v49 + 1) + 8 * v42);
      BOOL v44 = [(NSDictionary *)v31 objectForKeyedSubscript:v43] == 0;
      if (!-[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", [v43 stringByAppendingString:@"Clone"])&& v44)
      {
        goto LABEL_42;
      }
      if (v40 == ++v42)
      {
        uint64_t v40 = [v39 countByEnumeratingWithState:&v49 objects:v64 count:16];
        if (v40) {
          goto LABEL_57;
        }
        break;
      }
    }
  }
  v47->_inferenceOutputFormatByAttachedMediaKey = (NSDictionary *)v32;
  if (v47->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom)
  {
    v47->_pixelTransferSessionByMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v47->_outputFormatDescriptionByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v47;
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

BOOL __65__BWInferenceEngineController_initWithConfiguration_contextName___block_invoke(uint64_t a1)
{
  char v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "currentRequest"), "input"), "enabledVisionInferences");
  BOOL v2 = (v1 & 4) == 0;
  BOOL v3 = (v1 & 0x17) == 0;
  getVNDetectFaceRectanglesRequestClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  BOOL v3 = (v1 & 2) == 0;
  getVNDetectFaceLandmarksRequestClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  getVNGenerateFaceSegmentsRequestClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getVNClassifyFaceAttributesRequestClass();
    objc_opt_class();
    BOOL v2 = (v1 & 0x10) == 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      getVNRecognizeFoodAndDrinkRequestClass();
      objc_opt_class();
      return objc_opt_isKindOfClass() & ((v1 & 8) == 0);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngineController;
  [(BWStillImageProcessorController *)&v3 dealloc];
}

- (void)inputReceivedNewData:(id)a3
{
  if ([(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] == a3)
  {
    [(BWStillImageProcessorController *)self currentRequestChanged];
  }
}

- (BOOL)inferenceEnginePrepared
{
  return self->_inferenceEnginePrepared;
}

+ (__CVBuffer)inferenceMaskFromSbuf:(opaqueCMSampleBuffer *)a3 attachedMediaKey:(id)a4
{
  result = (__CVBuffer *)[a1 inferenceMaskSbufFromSbuf:a3 attachedMediaKey:a4];
  if (result)
  {
    return CMSampleBufferGetImageBuffer(result);
  }
  return result;
}

+ (opaqueCMSampleBuffer)inferenceMaskSbufFromSbuf:(opaqueCMSampleBuffer *)a3 attachedMediaKey:(id)a4
{
  result = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)a4);
  if (!result)
  {
    uint64_t v7 = [a4 stringByAppendingString:@"Clone"];
    return (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, v7);
  }
  return result;
}

+ (id)lowResPersonInstanceMasksFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return BWInferenceGetLowResPersonInstanceMasksFromSampleBuffer(a3);
}

+ (id)lowResPersonInstanceConfidencesFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return (id)BWInferenceGetAttachedInference(a3, 104, 0x1EFA6A380);
}

+ (id)lowResPersonInstanceBoundingBoxesFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return (id)BWInferenceGetAttachedInference(a3, 104, 0x1EFA6A3A0);
}

+ (id)smartCameraClassificationsFromSbuf:(opaqueCMSampleBuffer *)a3
{
  AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(a3, 101);
  return (id)[AttachedInferenceResult inferences];
}

+ (id)skinToneClassificationsFromSbuf:(opaqueCMSampleBuffer *)a3
{
  return (id)BWInferenceGetAttachedInference(a3, 802, 0x1EFA6A1A0);
}

+ (id)faceObservationsFromSbuf:(opaqueCMSampleBuffer *)a3
{
  AttachedInference = (void *)BWInferenceGetAttachedInference(a3, 802, 0x1EFA6A0A0);
  if ([AttachedInference count]) {
    return AttachedInference;
  }
  return (id)BWInferenceGetAttachedInference(a3, 802, @"VisionFaceDetectionObservations");
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (void)reset
{
  [(NSMutableDictionary *)self->_pixelTransferSessionByMediaKey removeAllObjects];
  outputFormatDescriptionByAttachedMediaKey = self->_outputFormatDescriptionByAttachedMediaKey;
  [(NSMutableDictionary *)outputFormatDescriptionByAttachedMediaKey removeAllObjects];
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  int v6 = [(BWStillImageProcessorControllerRequest *)[BWInferenceEngineControllerRequest alloc] initWithInput:a3 delegate:a4];
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
  return 0;
}

- (int)process
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = [(BWStillImageProcessorController *)self currentRequest];
  int v5 = [(BWStillImageProcessorControllerRequest *)v4 input];
  inferenceEngine = self->_inferenceEngine;
  if (inferenceEngine
    && [(BWInferenceEngine *)inferenceEngine isConfiguredForInference]
    && self->_inferenceEnginePrepared
    && (int v7 = (opaqueCMSampleBuffer *)[(BWStillImageProcessorControllerInput *)v5 inferenceImage]) != 0
    && (v8 = v7,
        ImageBuffer = CMSampleBufferGetImageBuffer(v7),
        (IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer)) != 0))
  {
    int v11 = IOSurface;
    if (objc_msgSend((id)-[BWStillImageProcessorControllerInput enabledInferenceMasks](v5, "enabledInferenceMasks"), "count")|| (-[BWStillImageProcessorControllerInput smartCameraClassificationsEnabled](v5, "smartCameraClassificationsEnabled") & 1) != 0|| -[BWStillImageProcessorControllerInput enabledVisionInferences](v5, "enabledVisionInferences"))
    {
      IOSurfaceLock(v11, 5u, 0);
      IOSurfaceUnlock(v11, 5u, 0);
      id v12 = [(BWInferenceEngineController *)self _suppressedInferenceTypesForInput:v5];
      uint64_t v13 = (void *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
      double v18 = v17;
      double v19 = v14;
      double v20 = v15;
      if (v14 >= v15) {
        double v21 = v15;
      }
      else {
        double v21 = v14;
      }
      float v22 = 1.0 / v21;
      BOOL v24 = v22 > 1.25 && self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom;
      if (self->_appliesFinalCropRect && !v24) {
        [v13 removeObjectForKey:*MEMORY[0x1E4F53260]];
      }
      uint64_t v25 = [(BWInferenceEngine *)self->_inferenceEngine performInferencesOnSampleBuffer:v8 attachingResultsToSampleBuffer:v8 skippingInferencesWithTypes:v12];
      if (v25)
      {
        uint64_t v37 = v25;
        goto LABEL_42;
      }
      appliesdouble FinalCropRect = self->_appliesFinalCropRect;
      char v27 = !self->_appliesFinalCropRect || v24;
      if ((v27 & 1) == 0)
      {
        FigCFDictionarySetCGRect();
        appliesdouble FinalCropRect = self->_appliesFinalCropRect;
      }
      if (appliesFinalCropRect && self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom)
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        inferenceOutputFormatByAttachedMediaKey = self->_inferenceOutputFormatByAttachedMediaKey;
        uint64_t v29 = [(NSDictionary *)inferenceOutputFormatByAttachedMediaKey countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v41 != v31) {
                objc_enumerationMutation(inferenceOutputFormatByAttachedMediaKey);
              }
              uint64_t v33 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v8, v33);
              if (AttachedMedia)
              {
                if (v24)
                {
                  uint64_t v35 = -[BWInferenceEngineController _unzoomAndBlackenBordersOnAttachedMediaSampleBuffer:inputSbuf:attachedMediaKey:finalCropRect:](self, "_unzoomAndBlackenBordersOnAttachedMediaSampleBuffer:inputSbuf:attachedMediaKey:finalCropRect:", AttachedMedia, v8, v33, FinalCropRect, v18, v19, v20);
                  if (v35)
                  {
                    uint64_t v37 = v35;
                    uint64_t v39 = v2;
                    LODWORD(v38) = v35;
                    FigDebugAssert3();
                    goto LABEL_42;
                  }
                }
                else
                {
                  BWPropagateZoomInformationToAttachedMediaSampleBuffer(v8, AttachedMedia);
                }
              }
            }
            uint64_t v30 = [(NSDictionary *)inferenceOutputFormatByAttachedMediaKey countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v30);
        }
      }
    }
    uint64_t v37 = 0;
  }
  else
  {
    uint64_t v37 = 4294954516;
  }
LABEL_42:
  [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v4 delegate] processorController:self didFinishProcessingSampleBuffer:[(BWStillImageProcessorControllerInput *)v5 inferenceImage] type:16 processorInput:v5 err:v37];
  return v37;
}

- (int)_unzoomAndBlackenBordersOnAttachedMediaSampleBuffer:(opaqueCMSampleBuffer *)a3 inputSbuf:(opaqueCMSampleBuffer *)a4 attachedMediaKey:(id)a5 finalCropRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  CFTypeRef cf = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer) {
    return -12780;
  }
  double v14 = ImageBuffer;
  psn_pixelBufferDimensions(ImageBuffer);
  uint64_t v15 = [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] delegate] processorController:self newOutputPixelBufferForProcessorInput:[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] type:[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input] inferenceInputBufferType] attachedMediaKey:a5];
  if (v15)
  {
    uint64_t v16 = (__CVBuffer *)v15;
    FigCaptureMetadataUtilitiesDenormalizeCropRect(x, y, width, height);
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v25);
    double v18 = [(BWInferenceEngineController *)self _ensurePixelTransferSessionForAttachedMediaKey:a5];
    if (v18)
    {
      double v19 = v18;
      OSStatus v20 = VTSessionSetProperty(v18, (CFStringRef)*MEMORY[0x1E4F450F0], DictionaryRepresentation);
      if (v20 || (OSStatus v20 = VTPixelTransferSessionTransferImage(v19, v14, v16)) != 0)
      {
        int v22 = v20;
      }
      else
      {
        CFTypeRef v21 = (CFTypeRef)[(NSMutableDictionary *)self->_outputFormatDescriptionByAttachedMediaKey objectForKeyedSubscript:a5];
        if (v21) {
          CFTypeRef v21 = CFRetain(v21);
        }
        CFTypeRef cf = v21;
        BWSampleBufferSetAttachedMediaFromPixelBuffer(a4, (uint64_t)a5, v16, &cf, 0, 0, 1);
        [(NSMutableDictionary *)self->_outputFormatDescriptionByAttachedMediaKey setObject:cf forKeyedSubscript:a5];
        int v22 = 0;
      }
    }
    else
    {
      int v22 = -12783;
    }
    CFRelease(v16);
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  else
  {
    int v22 = -12786;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v22;
}

- (OpaqueVTPixelTransferSession)_ensurePixelTransferSessionForAttachedMediaKey:(id)a3
{
  int v5 = (OpaqueVTPixelTransferSession *)-[NSMutableDictionary objectForKeyedSubscript:](self->_pixelTransferSessionByMediaKey, "objectForKeyedSubscript:");
  VTPixelTransferSessionRef pixelTransferSessionOut = v5;
  if (!v5)
  {
    OSStatus v6 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &pixelTransferSessionOut);
    int v5 = pixelTransferSessionOut;
    if (!v6)
    {
      [(NSMutableDictionary *)self->_pixelTransferSessionByMediaKey setObject:pixelTransferSessionOut forKeyedSubscript:a3];
      if (pixelTransferSessionOut)
      {
        CFRelease(pixelTransferSessionOut);
        return pixelTransferSessionOut;
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)_suppressedInferenceTypesForInput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = objc_msgSend(a3, "enabledInferenceMasks", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      if (+[BWMattingV2InferenceConfiguration mattingOutputTypeForAttachedMediaKey:v11])
      {
        break;
      }
      v8 |= +[BWPersonSemanticsConfiguration personSemanticForAttachedMediaKey:v11] != 0;
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        if (v8) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    [v4 addObject:&unk_1EFAFE1A8];
LABEL_11:
    [v4 addObject:&unk_1EFAFE1C0];
  }
  if (([a3 smartCameraClassificationsEnabled] & 1) == 0) {
    [v4 addObject:&unk_1EFAFE1D8];
  }
  if (![a3 enabledVisionInferences]) {
    [v4 addObject:&unk_1EFAFE1F0];
  }
  if ([v4 containsObject:&unk_1EFAFE1C0]
    && ([v4 containsObject:&unk_1EFAFE1A8] & 1) == 0)
  {
    [v4 removeObject:&unk_1EFAFE1C0];
  }
  [v4 count];
  return v4;
}

@end