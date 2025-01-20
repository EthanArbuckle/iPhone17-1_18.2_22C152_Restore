@interface BWSubjectRelightingCalculator
+ (void)initialize;
- (BWSubjectRelightingCalculator)init;
- (BWSubjectRelightingInferences)_runInferencesOnSampleBuffer:(uint64_t)a3 stillImageRequestSettings:(uint64_t)a4 stillImageCaptureSettings:;
- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5;
- (double)_curveParameterForSampleBuffer:(uint64_t)a3 stillImageRequestSettings:(void *)a4 stillImageCaptureSettings:;
- (float)_runSubjectRelightingWithInferences:(void *)target sampleBuffer:(int)a4 stillImageCaptureType:(char)a5 stillImageCaptureFlags:;
- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4;
- (id)startCalculationWithJPEGSampleBuffer:(opaqueCMSampleBuffer *)a3 stillImageRequestSettings:(id)a4 stillImageCaptureSettings:(id)a5;
- (uint64_t)_setupInferenceControllerWithInputVideoFormat:(uint64_t)result;
- (uint64_t)_setupSubjectRelightingStage;
- (void)dealloc;
- (void)prepareForVideoFormatAsync:(id)a3;
@end

@implementation BWSubjectRelightingCalculator

- (uint64_t)_setupInferenceControllerWithInputVideoFormat:(uint64_t)result
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (result && !*(void *)(result + 40))
  {
    uint64_t v28 = result;
    v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obj = [+[FigCaptureCameraParameters sharedInstance] cameraTuningParameters];
    uint64_t v30 = [(NSDictionary *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v43;
      uint64_t v3 = MEMORY[0x1E4F1CC08];
      do
      {
        v4 = 0;
        do
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(obj);
          }
          v32 = v4;
          v5 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v4);
          if ([v5 containsString:@"PortType"])
          {
            id v6 = [(NSDictionary *)obj objectForKeyedSubscript:v5];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (v7)
            {
              uint64_t v8 = v7;
              uint64_t v9 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v8; ++i)
                {
                  if (*(void *)v39 != v9) {
                    objc_enumerationMutation(v6);
                  }
                  objc_msgSend(v2, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v5, *(void *)(*((void *)&v38 + 1) + 8 * i), objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v38 + 1) + 8 * i)), v3), v5);
                }
                uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v47 count:16];
              }
              while (v8);
            }
          }
          ++v4;
        }
        while (v32 + 1 != (char *)v30);
        uint64_t v30 = [(NSDictionary *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v30);
    }
    if (![v2 count]) {
      goto LABEL_31;
    }
    v11 = objc_alloc_init(BWInferenceEngineControllerConfiguration);
    [(BWStillImageProcessorControllerConfiguration *)v11 setSensorConfigurationsByPortType:v2];
    [(BWInferenceEngineControllerConfiguration *)v11 setInputFormat:a2];
    [(BWStillImageProcessorControllerConfiguration *)v11 setFigThreadPriority:14];
    [(BWStillImageProcessorControllerConfiguration *)v11 setInferenceScheduler:objc_alloc_init(BWInferenceScheduler)];
    v12 = (void *)[MEMORY[0x1E4F1CA48] array];
    [v12 addObject:@"PersonSemanticsSkin"];
    [v12 addObject:0x1EFA6A200];
    [v12 addObjectsFromArray:BWInferenceLowResPersonInstanceMaskKeys()];
    [(BWInferenceEngineControllerConfiguration *)v11 setEnabledInferenceMasks:v12];
    [(BWInferenceEngineControllerConfiguration *)v11 setEnabledVisionInferences:16];
    [(BWInferenceEngineControllerConfiguration *)v11 setPersonSemanticsVersion:[+[FigCaptureCameraParameters sharedInstance] personSemanticsVersion]];
    v13 = [[BWInferenceEngineController alloc] initWithConfiguration:v11 contextName:@"SubjectRelightingCalculator"];
    uint64_t v14 = v28;
    *(void *)(v28 + 40) = v13;
    if (v13)
    {
      v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v33 = (id)[*(id *)(v28 + 40) providedAttachedMediaKeys];
      uint64_t v16 = [v33 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
LABEL_22:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v33);
          }
          uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * v19);
          result = [*(id *)(v14 + 40) outputVideoFormatForAttachedMediaKey:v20];
          if (!result) {
            break;
          }
          uint64_t v21 = result;
          v22 = [BWPixelBufferPool alloc];
          uint64_t v23 = [NSString stringWithFormat:@"NRF %@ Output Pool", v20];
          v24 = +[BWMemoryPool sharedMemoryPool];
          v25 = v22;
          uint64_t v14 = v28;
          result = [(BWPixelBufferPool *)v25 initWithVideoFormat:v21 capacity:1 name:v23 memoryPool:v24];
          if (!result) {
            break;
          }
          v26 = (void *)result;
          [v15 setObject:result forKeyedSubscript:v20];

          if (v17 == ++v19)
          {
            uint64_t v17 = [v33 countByEnumeratingWithState:&v34 objects:v46 count:16];
            if (v17) {
              goto LABEL_22;
            }
            goto LABEL_29;
          }
        }
      }
      else
      {
LABEL_29:

        *(void *)(v14 + 48) = v15;
        return [*(id *)(v14 + 40) prepareWithPixelBufferPoolProvider:v14];
      }
    }
    else
    {
LABEL_31:
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

void __60__BWSubjectRelightingCalculator_prepareForVideoFormatAsync___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1A6272C70]();
  id v3 = *(id *)(a1 + 32);
  if ((unint64_t)[v3 width] >= 0x241)
  {
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v4 setWidth:576];
    -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (int)FigCaptureRoundFloatToMultipleOf(2, (float)(unint64_t)(576 * [*(id *)(a1 + 32) height])/ (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "width")));
    v7[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1]);
    id v6 = v4;
    id v3 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1]);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (!*(void *)(v5 + 32))
  {
    *(void *)(*(void *)(a1 + 40) + 32) = -[BWPhotoDecompressor initWithPoolSize:outputPixelFormat:outputLargestDimension:]([BWPhotoDecompressor alloc], "initWithPoolSize:outputPixelFormat:outputLargestDimension:", 1, [*(id *)(a1 + 32) pixelFormat], 576);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  -[BWSubjectRelightingCalculator _setupSubjectRelightingStage](v5);
  -[BWSubjectRelightingCalculator _setupInferenceControllerWithInputVideoFormat:](*(void *)(a1 + 40), (uint64_t)v3);
}

- (uint64_t)_setupSubjectRelightingStage
{
  if (result)
  {
    uint64_t v1 = result;
    result = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
    if (!*(void *)(v1 + 64) && !*(void *)(v1 + 56))
    {
      v2 = BWLoadProcessorBundle(@"NRF", result);
      if (v2)
      {
        id v3 = v2;
        result = [v2 classNamed:@"SubjectRelightingStage"];
        if (result)
        {
          v4 = (objc_class *)result;
          result = [objc_alloc(MEMORY[0x1E4F55F60]) initWithbundle:v3 andOptionalCommandQueue:0];
          *(void *)(v1 + 64) = result;
          if (result)
          {
            result = [[v4 alloc] initWithMetalContext:*(void *)(v1 + 64)];
            *(void *)(v1 + 56) = result;
          }
        }
      }
      else
      {
        fig_log_get_emitter();
        return FigDebugAssert3();
      }
    }
  }
  return result;
}

- (void)prepareForVideoFormatAsync:(id)a3
{
  self->_startedPrepare = 1;
  prepareQueue = self->_prepareQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__BWSubjectRelightingCalculator_prepareForVideoFormatAsync___block_invoke;
  v4[3] = &unk_1E5C24458;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(prepareQueue, v4);
}

- (BWSubjectRelightingCalculator)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWSubjectRelightingCalculator;
  v2 = [(BWSubjectRelightingCalculator *)&v5 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v2->_prepareQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.subject-relighting-calculator-prepare", v3);
    v2->_calculationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v2;
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  return -[NSDictionary objectForKeyedSubscript:](self->_inferenceOutputPoolsByAttachedMediaKey, "objectForKeyedSubscript:", a3, a4);
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSubjectRelightingCalculator;
  [(BWSubjectRelightingCalculator *)&v3 dealloc];
}

- (id)startCalculationWithJPEGSampleBuffer:(opaqueCMSampleBuffer *)a3 stillImageRequestSettings:(id)a4 stillImageCaptureSettings:(id)a5
{
  v10 = objc_alloc_init(BWSubjectRelightingCalculatorResult);
  if (!self->_startedPrepare)
  {
    fig_log_get_emitter();
    uint64_t v18 = v5;
    LODWORD(v17) = 0;
LABEL_12:
    FigDebugAssert3();
    goto LABEL_13;
  }
  if (!BWSampleBufferHasDetectedFaces(a3, 0, 0, 0, 1, 0))
  {
LABEL_13:
    LODWORD(v11) = -1.0;
    -[BWSubjectRelightingCalculatorResult _completeWithRelightingRequired:curveParameter:](v10, "_completeWithRelightingRequired:curveParameter:", 0, v11, v17, v18);
    return v10;
  }
  if (!self->_waitedForPrepare)
  {
    prepareQueue = self->_prepareQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_sync(prepareQueue, block);
  }
  v13 = [(BWPhotoDecompressor *)self->_jpegDecompressor newUncompressedSampleBufferFromSampleBuffer:a3];
  if (!v13)
  {
    fig_log_get_emitter();
    uint64_t v18 = v5;
    LODWORD(v17) = 0;
    goto LABEL_12;
  }
  uint64_t v14 = v13;
  CMSampleBufferRef sampleBufferOut = 0;
  BWCMSampleBufferCreateCopyIncludingMetadata(v13, &sampleBufferOut);
  CFRelease(v14);
  if (!sampleBufferOut)
  {
    fig_log_get_emitter();
    uint64_t v18 = v5;
    LODWORD(v17) = 0;
    goto LABEL_12;
  }
  calculationQueue = self->_calculationQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke_2;
  v19[3] = &unk_1E5C26200;
  v19[7] = v10;
  v19[8] = sampleBufferOut;
  v19[4] = self;
  v19[5] = a4;
  v19[6] = a5;
  dispatch_async(calculationQueue, v19);
  return v10;
}

uint64_t __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 25) = 1;
  return result;
}

void __122__BWSubjectRelightingCalculator_startCalculationWithJPEGSampleBuffer_stillImageRequestSettings_stillImageCaptureSettings___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6272C70]();
  double v3 = -[BWSubjectRelightingCalculator _curveParameterForSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:](*(void *)(a1 + 32), *(void **)(a1 + 64), *(void *)(a1 + 40), *(void **)(a1 + 48));
  float v4 = *(float *)&v3;
  uint64_t v5 = *(const void **)(a1 + 64);
  if (v5) {
    CFRelease(v5);
  }
  *(float *)&double v3 = v4;
  [*(id *)(a1 + 56) _completeWithRelightingRequired:v4 >= 0.0 curveParameter:v3];
}

- (double)_curveParameterForSampleBuffer:(uint64_t)a3 stillImageRequestSettings:(void *)a4 stillImageCaptureSettings:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v7 = -[BWSubjectRelightingCalculator _runInferencesOnSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:](a1, a2, a3, (uint64_t)a4);
  int v8 = [a4 captureType];
  char v9 = [a4 captureFlags];
  *(float *)&double result = -[BWSubjectRelightingCalculator _runSubjectRelightingWithInferences:sampleBuffer:stillImageCaptureType:stillImageCaptureFlags:](a1, v7, a2, v8, v9);
  return result;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5
{
  return 0;
}

- (BWSubjectRelightingInferences)_runInferencesOnSampleBuffer:(uint64_t)a3 stillImageRequestSettings:(uint64_t)a4 stillImageCaptureSettings:
{
  if (!a1) {
    return 0;
  }
  int v8 = objc_alloc_init(BWSubjectRelightingInferences);
  char v9 = *(void **)(a1 + 40);
  v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  if (!a2 || (uint64_t v12 = v11, !CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v13 = 0;
LABEL_10:
    int v8 = 0;
    goto LABEL_11;
  }
  v13 = [[BWInferenceEngineControllerInput alloc] initWithSettings:[[BWStillImageSettings alloc] initWithRequestedSettings:a3 captureSettings:a4 processingSettings:[[BWStillImageProcessingSettings alloc] initWithPhotoManifest:objc_alloc_init(BWPhotoManifest) processIntelligentDistortionCorrection:0]] portType:v12];
  CFTypeRef v14 = CMGetAttachment(a2, @"UprightExifOrientation", 0);
  if (v14) {
    v15 = (void *)v14;
  }
  else {
    v15 = &unk_1EFAFED90;
  }
  [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F53248]];
  [(BWInferenceEngineControllerInput *)v13 addInferenceImage:a2];
  uint64_t v16 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v16 addObject:@"PersonSemanticsSkin"];
  [v16 addObject:0x1EFA6A200];
  [v16 addObjectsFromArray:BWInferenceLowResPersonInstanceMaskKeys()];
  [(BWInferenceEngineControllerInput *)v13 setEnabledInferenceMasks:v16];
  [(BWInferenceEngineControllerInput *)v13 setEnabledVisionInferences:16];
  if ([v9 enqueueInputForProcessing:v13 delegate:a1])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_10;
  }
  -[BWSubjectRelightingInferences setSkinMask:](v8, "setSkinMask:", [(id)objc_opt_class() inferenceMaskFromSbuf:a2 attachedMediaKey:@"PersonSemanticsSkin"]);
  -[BWSubjectRelightingInferences setPersonMask:](v8, "setPersonMask:", [(id)objc_opt_class() inferenceMaskFromSbuf:a2 attachedMediaKey:0x1EFA6A200]);
  -[BWSubjectRelightingInferences setLowResPersonInstanceMasks:](v8, "setLowResPersonInstanceMasks:", [(id)objc_opt_class() lowResPersonInstanceMasksFromSbuf:a2]);
  -[BWSubjectRelightingInferences setLowResPersonInstanceConfidences:](v8, "setLowResPersonInstanceConfidences:", [(id)objc_opt_class() lowResPersonInstanceConfidencesFromSbuf:a2]);
  -[BWSubjectRelightingInferences setLowResPersonInstanceBoundingBoxes:](v8, "setLowResPersonInstanceBoundingBoxes:", [(id)objc_opt_class() lowResPersonInstanceBoundingBoxesFromSbuf:a2]);
  -[BWSubjectRelightingInferences setSkinToneClassificationsForFaces:](v8, "setSkinToneClassificationsForFaces:", [(id)objc_opt_class() skinToneClassificationsFromSbuf:a2]);
LABEL_11:

  return v8;
}

- (float)_runSubjectRelightingWithInferences:(void *)target sampleBuffer:(int)a4 stillImageCaptureType:(char)a5 stillImageCaptureFlags:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v11 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  if (!ImageBuffer) {
    goto LABEL_29;
  }
  v13 = ImageBuffer;
  double Width = (double)CVPixelBufferGetWidth(ImageBuffer);
  double Height = (double)CVPixelBufferGetHeight(v13);
  FigCFDictionaryGetCGRectIfPresent();
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E38]), "floatValue");
  int v15 = v14;
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E68]), "floatValue");
  int v17 = v16;
  uint64_t v18 = (void *)CMGetAttachment(target, @"UprightExifOrientation", 0);
  int v19 = [v18 intValue];
  int v20 = v18 ? v19 : 1;
  uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "sensorIDDictionaryForPortType:sensorIDString:", objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), +[FigCaptureCameraParameters sensorIDStringFromMetadata:](FigCaptureCameraParameters, "sensorIDStringFromMetadata:", v11)), "objectForKeyedSubscript:", @"NRFParameters"), "objectForKeyedSubscript:", @"NRFParameters"), "objectForKeyedSubscript:", @"ToneMapping");
  uint64_t v22 = *MEMORY[0x1E4F54148];
  switch(a4)
  {
    case 10:
      uint64_t v23 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue") == 1
          ? @"DefaultUBModeQuadraParameters"
          : @"DefaultUBModeParameters";
      break;
    case 11:
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue");
      fig_log_get_emitter();
      uint64_t v44 = v5;
      LODWORD(v43) = 0;
      goto LABEL_14;
    case 12:
      objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue");
      uint64_t v23 = @"DefaultUBModeParameters";
      break;
    default:
      int v25 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v22), "intValue");
      v26 = @"SingleImageParametersForLearnedNR";
      if ((a5 & 0x80) == 0) {
        v26 = @"SingleImageParameters";
      }
      v27 = @"SingleImageQuadraParameters";
      if (a5 < 0) {
        v27 = @"SingleImageParametersForQuadraLearnedNR";
      }
      uint64_t v23 = v25 == 1 ? v27 : v26;
      break;
  }
  uint64_t v28 = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", v23), "objectForKeyedSubscript:", @"SRLv2");
  if (!v28)
  {
LABEL_29:
    fig_log_get_emitter();
    uint64_t v44 = v5;
    LODWORD(v43) = 0;
    goto LABEL_14;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void **)(a1 + 56);
  uint64_t v31 = [a2 skinMask];
  uint64_t v32 = [a2 personMask];
  uint64_t v33 = [a2 lowResPersonInstanceMasks];
  uint64_t v34 = [a2 lowResPersonInstanceConfidences];
  uint64_t v35 = [a2 skinToneClassificationsForFaces];
  LODWORD(v43) = v20;
  LODWORD(v36) = v15;
  LODWORD(v37) = v17;
  int v38 = objc_msgSend(v30, "runSRLForLivePhotosWithInputBuffer:skinMask:personMask:instanceMasks:instanceMaskConfidences:skinToneClassification:validROI:expBias:faceExpRatio:exifOrientation:srlV2Plist:", v13, v31, v32, v33, v34, v35, 0.0, 0.0, Width, Height, v36, v37, v43, v29);
  if (!v38)
  {
    int v39 = [*(id *)(a1 + 56) mitigationNeeded];
    [*(id *)(a1 + 56) curveParameter];
    if (v39) {
      float v24 = v40;
    }
    else {
      float v24 = -1.0;
    }
    goto LABEL_27;
  }
  int v42 = v38;
  fig_log_get_emitter();
  uint64_t v44 = v5;
  LODWORD(v43) = v42;
LABEL_14:
  FigDebugAssert3();
  float v24 = -1.0;
LABEL_27:
  objc_msgSend(*(id *)(a1 + 56), "reset", v43, v44);
  return v24;
}

@end