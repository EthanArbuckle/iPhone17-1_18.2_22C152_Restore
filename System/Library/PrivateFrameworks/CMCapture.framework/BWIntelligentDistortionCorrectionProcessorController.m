@interface BWIntelligentDistortionCorrectionProcessorController
+ (id)captureTypesWithIDCSupportWithOptionalCaptureFlags;
+ (void)initialize;
- (BWIntelligentDistortionCorrectionProcessorController)initWithConfiguration:(id)a3;
- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4;
- (uint64_t)_applyExistingCorrectionToDepthPixelBuffer:(uint64_t)a3 primaryImageDimensions:;
- (uint64_t)_loadSetupAndPrepareProcessor;
- (uint64_t)_prepareProcessor:(uint64_t)a1;
- (uint64_t)_process;
- (uint64_t)_resetProcessor;
- (uint64_t)_serviceNextRequest;
- (uint64_t)_updateStateIfNeeded;
- (unint64_t)type;
- (void)_getAndAttachGDCInformationToDemosaicedRawSampleBuffer:(uint64_t)a1 inputDimensions:(const void *)a2 finalImageDimensions:(uint64_t)a3 settingsID:(uint64_t)a4;
- (void)cancelProcessing;
- (void)dealloc;
- (void)inputReceivedNewInputData:(id)a3;
@end

@implementation BWIntelligentDistortionCorrectionProcessorController

+ (id)captureTypesWithIDCSupportWithOptionalCaptureFlags
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1EFB02780;
  v3[1] = &unk_1EFB02798;
  v4[0] = &unk_1EFB02768;
  v4[1] = &unk_1EFB02768;
  v3[2] = &unk_1EFB027B0;
  v4[2] = &unk_1EFB02768;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
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

- (BWIntelligentDistortionCorrectionProcessorController)initWithConfiguration:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)BWIntelligentDistortionCorrectionProcessorController;
  v4 = [(BWIntelligentDistortionCorrectionProcessorController *)&v45 init];
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count")) {
      goto LABEL_27;
    }
    if ((int)[a3 horizontalSensorBinningFactor] > 1
      || (int)[a3 verticalSensorBinningFactor] >= 2)
    {
      int v5 = [a3 horizontalSensorBinningFactor];
      if (v5 != [a3 verticalSensorBinningFactor])
      {
LABEL_25:

        return 0;
      }
      v35 = v4;
      v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = (id)[a3 sensorConfigurationsByPortType];
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v38 = *(void *)v42;
        uint64_t v8 = *MEMORY[0x1E4F52D28];
        uint64_t v9 = *MEMORY[0x1E4F52D20];
        CGPoint v37 = (CGPoint)*MEMORY[0x1E4F1DAD8];
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v42 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v12 = objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
            id v13 = (id)objc_msgSend((id)objc_msgSend(v12, "cameraInfo"), "mutableCopy");
            objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", v8), "floatValue");
            *(float *)&double v15 = v14 * (float)(int)[a3 horizontalSensorBinningFactor];
            objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v15), v8);
            CGPoint point = v37;
            if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v13 objectForKeyedSubscript:v9], &point))
            {
              int v16 = [a3 horizontalSensorBinningFactor];
              point.x = point.x / (double)v16;
              int v17 = [a3 verticalSensorBinningFactor];
              point.y = point.y / (double)v17;
              CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(point);
              [v13 setObject:DictionaryRepresentation forKeyedSubscript:v9];
            }
            objc_msgSend(v39, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v11, objc_msgSend(v12, "sensorIDString"), objc_msgSend(v12, "sensorIDDictionary"), v13), v11);
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v7);
      }
      [a3 setSensorConfigurationsByPortType:v39];
      v4 = v35;
    }
    if ([a3 depthDataCorrectionEnabled])
    {
      uint64_t v19 = [a3 primaryFormat];
      if (!v19) {
        goto LABEL_27;
      }
      v20 = (void *)v19;
      uint64_t v21 = [a3 depthFormat];
      if (!v21) {
        goto LABEL_27;
      }
      v22 = (void *)v21;
      unint64_t v23 = [v20 width];
      BOOL v24 = v23 < [v20 height];
      unint64_t v25 = [v22 width];
      if (v24 == v25 >= [v22 height])
      {
        size_t v26 = [v22 height];
        uint64_t v27 = [v22 width];
      }
      else
      {
        size_t v26 = [v22 width];
        uint64_t v27 = [v22 height];
      }
      size_t v28 = v27;
      v48[0] = *MEMORY[0x1E4F24D70];
      v49[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v22, "pixelFormat"));
      v48[1] = *MEMORY[0x1E4F24E10];
      v49[1] = [NSNumber numberWithUnsignedLong:v26];
      v48[2] = *MEMORY[0x1E4F24D08];
      v49[2] = [NSNumber numberWithUnsignedLong:v28];
      v48[3] = *MEMORY[0x1E4F24D20];
      uint64_t v29 = *MEMORY[0x1E4F2F130];
      v46[0] = *MEMORY[0x1E4F2EFE8];
      v46[1] = v29;
      v47[0] = &unk_1EFB02768;
      v47[1] = MEMORY[0x1E4F1CC38];
      v49[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
      CFDictionaryRef v30 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];
      CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v26, v28, [v22 pixelFormat], v30, &v4->_intermediateDepthInputBuffer)|| CVPixelBufferCreate(v31, v26, v28, objc_msgSend(v22, "pixelFormat"), v30, &v4->_intermediateDepthOutputBuffer))
      {
LABEL_27:
        FigDebugAssert3();
        goto LABEL_25;
      }
    }
    v4->_configuration = (BWIntelligentDistortionCorrectionProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v32 = [[FigStateMachine alloc] initWithLabel:@"BWIntelligentDistortionCorrectionProcessorController state machine" stateCount:4 initialState:1 owner:v4];
    [(FigStateMachine *)v32 setPerformsAtomicStateTransitions:0];
    [(FigStateMachine *)v32 setLabel:@"Idle" forState:1];
    [(FigStateMachine *)v32 setLabel:@"Ready" forState:2];
    [(FigStateMachine *)v32 setLabel:@"WaitingForFrames" forState:4];
    [(FigStateMachine *)v32 setLabel:@"ProcessIntelligentDistortionCorrection" forState:8];
    [(FigStateMachine *)v32 whenTransitioningToStates:1 callHandler:&__block_literal_global_119];
    [(FigStateMachine *)v32 whenTransitioningToStates:2 callHandler:&__block_literal_global_503];
    [(FigStateMachine *)v32 whenTransitioningToState:4 callHandler:&__block_literal_global_505];
    [(FigStateMachine *)v32 whenTransitioningToState:8 callHandler:&__block_literal_global_507];
    v4->_stateMachine = v32;
    v4->_outputFormatDescriptionByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v33 = (void *)MEMORY[0x1A6272C70]();
    LODWORD(v32) = -[BWIntelligentDistortionCorrectionProcessorController _loadSetupAndPrepareProcessor]((uint64_t)v4);
    if (v32) {
      goto LABEL_25;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareProcessor
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = [*(id *)(result + 56) intelligentDistortionCorrectionVersion];
    uint64_t v3 = [*(id *)(v1 + 56) intelligentDistortionCorrectionVersion];
    v4 = (void *)[*(id *)(v1 + 56) sensorConfigurationsByPortType];
    uint64_t v5 = [*(id *)(v1 + 56) metalCommandQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__BWIntelligentDistortionCorrectionProcessorController__loadSetupAndPrepareProcessor__block_invoke;
    v17[3] = &unk_1E5C26228;
    v17[4] = v1;
    result = BWLoadCreateSetupAndPrepareMetalImageBufferProcessor(@"IntelligentDistortionCorrection", v2, @"Fig", @"IntelligentDistortionCorrection", v3, (uint64_t)&unk_1EFB70088, 1, v4, v5, 0, (uint64_t)v17, 0, (void *)(v1 + 72));
    if (!result)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v7 = (void *)[*(id *)(v1 + 56) sensorConfigurationsByPortType];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v11)), "sensorIDDictionary"), "objectForKeyedSubscript:", @"IntelligentDistortionCorrectionParameters"), "objectForKeyedSubscript:", @"CaptureConfiguration"), "objectForKeyedSubscript:", @"IDCMaxZoomScaleFactor"), *(void *)(*((void *)&v13 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v9);
      }
      result = [v6 count];
      if (result)
      {
        id v12 = v6;
        result = 0;
        *(void *)(v1 + 64) = v12;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  [(FigIntelligentDistortionCorrectionProcessor *)self->_processor finishProcessing];
  -[BWIntelligentDistortionCorrectionProcessorController _resetProcessor]((uint64_t)self);

  outputImageFormatDescription = self->_outputImageFormatDescription;
  if (outputImageFormatDescription) {
    CFRelease(outputImageFormatDescription);
  }

  CVPixelBufferRelease(self->_intermediateDepthInputBuffer);
  CVPixelBufferRelease(self->_intermediateDepthOutputBuffer);
  v4.receiver = self;
  v4.super_class = (Class)BWIntelligentDistortionCorrectionProcessorController;
  [(BWStillImageProcessorController *)&v4 dealloc];
}

- (uint64_t)_resetProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 72) setProcessIntelligentDistortionCorrection:0];
    [*(id *)(v1 + 72) setProcessGeometricDistortionCorrection:0];
    [*(id *)(v1 + 72) setApplyZoom:1];
    [*(id *)(v1 + 72) setApplyStereoRectificationHomography:0];
    objc_msgSend(*(id *)(v1 + 72), "setStereoRectificationInverseHomography:", *MEMORY[0x1E4F14998], *(double *)(MEMORY[0x1E4F14998] + 16), *(double *)(MEMORY[0x1E4F14998] + 32));
    [*(id *)(v1 + 72) setUseBilinearInterpolation:0];
    [*(id *)(v1 + 72) setGdcForwardPolynomial:0];
    [*(id *)(v1 + 72) setGdcInversePolynomial:0];
    objc_msgSend(*(id *)(v1 + 72), "setOpticalCenterOffset:", 0.0, 0.0);
    [*(id *)(v1 + 72) setUsePrecomputedPolynomialsAndOpticalCenterOffset:0];
    [*(id *)(v1 + 72) setInputImage:0];
    [*(id *)(v1 + 72) setInputImageMetadataDictionary:0];
    [*(id *)(v1 + 72) setLowResSegmentationMask:0];
    [*(id *)(v1 + 72) setFaceObservations:0];
    [*(id *)(v1 + 72) setDeviceWasStationaryDuringCapture:0];
    objc_msgSend(*(id *)(v1 + 72), "setInputImageCropRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [*(id *)(v1 + 72) setOutputImage:0];
    [*(id *)(v1 + 72) setFinalImageDimensions:0];
    [*(id *)(v1 + 72) setReplicatePixelsOutsideOfFinalImageDimensions:0];
    unsigned int v2 = *(void **)(v1 + 72);
    return [v2 resetState];
  }
  return result;
}

- (unint64_t)type
{
  return 7;
}

- (void)inputReceivedNewInputData:(id)a3
{
  [(BWIntelligentDistortionCorrectionProcessorRequest *)self->_currentRequest input];
  -[BWIntelligentDistortionCorrectionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = *(void **)(result + 112);
    int v3 = [*(id *)(result + 96) currentState];
    if (v2)
    {
      if (v3 == 2)
      {
        uint64_t v4 = 4;
      }
      else if (v3 == 4)
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "input"), "receivedAllInputs") ? 8 : 4;
      }
      else
      {
        uint64_t v4 = 2;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
    result = [*(id *)(v1 + 96) currentState];
    if (v4 != result)
    {
      uint64_t v5 = *(void **)(v1 + 96);
      return [v5 transitionToState:v4];
    }
  }
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  uint64_t v5 = -[BWIntelligentDistortionCorrectionProcessorRequest initWithInput:delegate:]([BWIntelligentDistortionCorrectionProcessorRequest alloc], a3, a4);
  [(NSMutableArray *)self->_requestQueue addObject:v5];

  if ([(FigStateMachine *)self->_stateMachine currentState] == 1) {
    [(FigStateMachine *)self->_stateMachine transitionToState:2];
  }
  return 0;
}

- (void)cancelProcessing
{
  [(NSMutableArray *)self->_requestQueue removeAllObjects];
  [(BWIntelligentDistortionCorrectionProcessorRequest *)self->_currentRequest setErr:4294950490];
  -[BWIntelligentDistortionCorrectionProcessorController _serviceNextRequest]((uint64_t)self);
  -[BWIntelligentDistortionCorrectionProcessorController _resetProcessor]((uint64_t)self);
}

- (uint64_t)_serviceNextRequest
{
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = (void *)[*(id *)(result + 112) delegate];
    id v3 = (id)[*(id *)(v1 + 112) input];
    uint64_t v4 = [*(id *)(v1 + 112) err];

    *(void *)(v1 + 112) = 0;
    [v2 processorController:v1 didFinishProcessingInput:v3 err:v4];

    id v5 = (id)[*(id *)(v1 + 104) firstObject];
    *(void *)(v1 + 112) = v5;
    if (v5)
    {
      [*(id *)(v1 + 104) removeObjectAtIndex:0];
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "input"), "setDelegate:", v1);
    }
    return -[BWIntelligentDistortionCorrectionProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (uint64_t)_process
{
  uint64_t v402 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  id v3 = (void *)[*(id *)(result + 112) input];
  rect2 = (void *)[v3 settings];
  CMAttachmentBearerRef target = 0;
  v355 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id obj = (id)[MEMORY[0x1E4F1CA60] dictionary];
  v317 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v316 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = (opaqueCMSampleBuffer *)[v3 image];
  id v5 = v4;
  if (!v4)
  {
    v288 = 0;
    v284 = 0;
    unsigned int v150 = -10000;
    unsigned int v282 = 0;
    int v283 = 0x7FFFFFFF;
    uint64_t v48 = 4294954516;
LABEL_204:
    int rect2a = 0x7FFFFFFF;
    unsigned int v115 = 0x7FFFFFFF;
LABEL_183:
    CMSetAttachment(v5, @"IntelligentDistortionCorrectionMakernoteEntry", (CFTypeRef)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v282, v277, v280), 1u);
    if (v115 == 0x7FFFFFFF) {
      uint64_t v252 = v150;
    }
    else {
      uint64_t v252 = v115;
    }
    CMSetAttachment(v5, @"IntelligentDistortionCorrectionStatusCode", (CFTypeRef)[NSNumber numberWithInt:v252], 1u);
    if (rect2a != 0x7FFFFFFF) {
      CMSetAttachment(v5, @"IntelligentDistortionCorrectionGainMapProcessingStatusCode", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:"), 1u);
    }
    if (v283 != 0x7FFFFFFF) {
      CMSetAttachment(v5, @"IntelligentDistortionCorrectionCorrectionType", (CFTypeRef)objc_msgSend(NSNumber, "numberWithUnsignedInt:"), 1u);
    }
    goto LABEL_190;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(v4);
  if (!ImageBuffer)
  {
    uint64_t v48 = 0;
    v288 = 0;
    v284 = 0;
    unsigned int v150 = -10000;
    unsigned int v282 = 0;
    int v283 = 0x7FFFFFFF;
    goto LABEL_204;
  }
  v328 = ImageBuffer;
  unint64_t v7 = psn_pixelBufferDimensions(ImageBuffer);
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v8, "addObject:");
  char v309 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "stillImageSettings"), "captureSettings"), "captureFlags");
  if ((v309 & 4) != 0) {
    [v8 addObject:0x1EFA745E0];
  }
  if ([*(id *)(v2 + 56) depthDataCorrectionEnabled])
  {
    [v8 addObject:@"Depth"];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "providedInferenceAttachedMediaByMode"), "objectForKeyedSubscript:", &unk_1EFB027C8);
    if (v9) {
      [v8 addObjectsFromArray:v9];
    }
  }
  objc_msgSend(v8, "addObject:");
  uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "providedInferenceAttachedMediaByMode"), "objectForKeyedSubscript:", &unk_1EFB027E0);
  if (v10) {
    [v8 addObjectsFromArray:v10];
  }
  uint64_t v354 = v7;
  if ([rect2 constantColorEnabled]) {
    [v8 addObject:0x1EFA74920];
  }
  v338 = v3;
  v339 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:newInferencesForProcessorInput:", v2, v3);
  long long v374 = 0u;
  long long v375 = 0u;
  long long v376 = 0u;
  long long v377 = 0u;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v374 objects:v401 count:16];
  v345 = (opaqueCMSampleBuffer *)v5;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v375;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v375 != v13) {
          objc_enumerationMutation(v8);
        }
        long long v15 = *(void **)(*((void *)&v374 + 1) + 8 * i);
        uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(v5, (uint64_t)v15);
        if (AttachedMedia)
        {
          int v17 = (opaqueCMSampleBuffer *)AttachedMedia;
          [v355 setObject:AttachedMedia forKeyedSubscript:v15];
LABEL_30:
          [obj setObject:CMSampleBufferGetImageBuffer(v17) forKeyedSubscript:v15];
          continue;
        }
        uint64_t v18 = [v339 inferenceBufferForAttachedMediaKey:v15];
        if (v18)
        {
          uint64_t v19 = (__CVBuffer *)v18;
          v20 = v8;
          uint64_t v21 = [v339 metadataForAttachedMediaKey:v15];
          cf[0] = 0;
          CFTypeRef v22 = (CFTypeRef)[*(id *)(v2 + 88) objectForKeyedSubscript:v15];
          if (v22) {
            CFTypeRef v22 = CFRetain(v22);
          }
          cf[0] = v22;
          uint64_t v23 = BWMetadataAttachmentKeyForAttachedMediaKey(v15);
          uint64_t v24 = objc_msgSend((id)objc_msgSend(v339, "inferenceAttachedMediaMetadata"), "objectForKeyedSubscript:", v15);
          unint64_t v25 = 0;
          if (v23 && v24)
          {
            uint64_t v399 = v23;
            uint64_t v400 = v24;
            unint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v400, &v399, 1, 0);
          }
          id v5 = v345;
          BWSampleBufferSetAttachedMediaFromPixelBuffer(v345, (uint64_t)v15, v19, cf, v21, v25, 1);
          [*(id *)(v2 + 88) setObject:cf[0] forKeyedSubscript:v15];
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          uint64_t v8 = v20;
        }
        int v17 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v5, (uint64_t)v15);
        [v355 setObject:v17 forKeyedSubscript:v15];
        if (v17) {
          goto LABEL_30;
        }
      }
      uint64_t v12 = [v8 countByEnumeratingWithState:&v374 objects:v401 count:16];
    }
    while (v12);
  }
  kedouble y = (const __CFString *)*MEMORY[0x1E4F53070];
  CFTypeRef v26 = CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v287 = objc_msgSend((id)objc_msgSend(rect2, "bravoConstituentImageDeliveryDeviceTypes"), "count");
  if (v287)
  {
    CGFloat v27 = 1.0;
    double FinalCropRect = 0.0;
    CGFloat v29 = 0.0;
    CGFloat v30 = 1.0;
  }
  else
  {
    double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
    CGFloat v29 = v31;
    CGFloat v27 = v32;
    CGFloat v30 = v33;
  }
  id v3 = v338;
  v299 = (void *)v26;
  double ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
  double v313 = v35;
  double v297 = v37;
  double v298 = v36;
  unsigned int v285 = [v338 processGeometricDistortionCorrection];
  int v38 = [v338 processIntelligentDistortionCorrection];
  unsigned int v332 = [*(id *)(v2 + 56) depthDataCorrectionEnabled];
  uint64_t v39 = [v339 inferenceBufferForAttachedMediaKey:0x1EFA6A200];
  v326 = (void *)[v339 inferenceForAttachmentKey:0x1EFA6A0A0];
  uint64_t v330 = v39;
  if (!v38)
  {
    BOOL v324 = 0;
LABEL_49:
    v46 = v299;
    v47 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
    goto LABEL_50;
  }
  if (!v39)
  {
    unsigned int v373 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v326)
  {
    unsigned int v373 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(*(id *)(v2 + 64), "objectForKeyedSubscript:", objc_msgSend(v338, "portType", v277, v280)), "floatValue");
  float v43 = v42;
  if (v42 <= 1.0)
  {
    BOOL v324 = 1;
    goto LABEL_49;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v338, "captureSettings"), "metadata"), "totalZoomFactor");
  BOOL v324 = v44 < v43;
  if (v44 < v43) {
    int v45 = 1;
  }
  else {
    int v45 = v285;
  }
  v46 = v299;
  v47 = &OBJC_IVAR___BWVideoOrientationMetadataNode__localIDOfOrientationMetadata;
  if (v45 == 1)
  {
LABEL_50:
    __int16 v49 = objc_msgSend((id)objc_msgSend(v338, "captureSettings"), "sceneFlags");
    uint64_t v281 = *MEMORY[0x1E4F53328];
    if (objc_msgSend((id)objc_msgSend(v46, "objectForKeyedSubscript:"), "intValue")) {
      char v50 = v285;
    }
    else {
      char v50 = 0;
    }
    if (v50)
    {
      unsigned int v282 = 0;
      v288 = 0;
      v52 = 0;
    }
    else
    {
      if ([v338 imageBufferType] == 38) {
        uint64_t v51 = 38;
      }
      else {
        uint64_t v51 = 1;
      }
      v52 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v2, v338, v51);
      if (!v52)
      {
        unsigned int v282 = 0;
        v288 = 0;
        unsigned int v150 = -10001;
LABEL_214:
        int v283 = 0x7FFFFFFF;
        int rect2a = 0x7FFFFFFF;
        unsigned int v115 = 0x7FFFFFFF;
        goto LABEL_215;
      }
      if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v5, v52, (CFTypeRef *)(v2 + 80), (CMSampleBufferRef *)&target))
      {
        v288 = (void *)[v299 mutableCopy];
        CMSetAttachment(target, key, v288, 1u);
        psn_pixelBufferDimensions(v52);
        uint64_t v53 = [v338 imageBufferType];
        v54 = *(void **)(v2 + v47[870]);
        v284 = v52;
        __int16 v321 = v49;
        if (v53 == 38)
        {
          unint64_t v55 = [v54 stereoPhotoOutputDimensions];
          unint64_t v56 = HIDWORD(v55);
        }
        else
        {
          if ([v54 intelligentDistortionCorrectionAppliesFinalDimensions])
          {
            LODWORD(v55) = [rect2 outputWidth];
            uint64_t v57 = [rect2 outputHeight];
            if (CVPixelBufferGetWidth(v52) < (int)v55 || CVPixelBufferGetHeight(v52) < (int)v57)
            {
LABEL_212:
              unsigned int v282 = 0;
              goto LABEL_213;
            }
            uint64_t v340 = v57;
LABEL_67:
            double v62 = (double)[rect2 outputWidth];
            double v63 = v62 / (double)[rect2 outputHeight];
            double v311 = ValidBufferRect;
            if (FigCaptureVideoDimensionsAreValid([*(id *)(v2 + v47[870]) geometricDistortionCorrectionExpandedImageDimensions]))
            {
              int v64 = [*(id *)(v2 + v47[870]) geometricDistortionCorrectionExpandedImageDimensions];
              int v65 = (unint64_t)[*(id *)(v2 + v47[870]) geometricDistortionCorrectionExpandedImageDimensions] >> 32;
              FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect([*(id *)(v2 + v47[870]) geometricDistortionCorrectionExpandedImageDimensions], (unint64_t)objc_msgSend(*(id *)(v2 + v47[870]), "geometricDistortionCorrectionExpandedImageDimensions") >> 32, FinalCropRect, v29, v27, v30, v63);
              double x = v403.origin.x;
              double y = v403.origin.y;
              double width = v403.size.width;
              double height = v403.size.height;
              if (CGRectIsNull(v403))
              {
                uint64_t v280 = v1;
                LODWORD(v277) = 0;
                FigDebugAssert3();
                unsigned int v150 = -10000;
                unsigned int v282 = 0;
                int v283 = 0x7FFFFFFF;
                int rect2a = 0x7FFFFFFF;
                unsigned int v115 = 0x7FFFFFFF;
                goto LABEL_210;
              }
              int v70 = v354 - v64;
              if ((int)v354 < v64) {
                ++v70;
              }
              double v71 = (double)(v70 >> 1);
              int v72 = HIDWORD(v354) - v65;
              if (SHIDWORD(v354) < v65) {
                ++v72;
              }
              double v73 = x + v71;
              double v74 = y + (double)(v72 >> 1);
              if (!v285
                || ([*(id *)(v2 + 56) geometricDistortionCorrectionInputCropOffset],
                    v76 == *MEMORY[0x1E4F1DAD8])
                && v75 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
              {
                double v77 = width;
              }
              else
              {
                [*(id *)(v2 + 56) geometricDistortionCorrectionInputCropOffset];
                double v254 = v73 + v253;
                [*(id *)(v2 + 56) geometricDistortionCorrectionInputCropOffset];
                double rect2b = v74 + v255;
                double v352 = width;
                FigCaptureMetadataUtilitiesNormalizeCropRect(v254, v74 + v255, width, height);
                double v260 = FigCaptureMetadataUtilitiesNormalizedRectEnforcedWithinValidRegionAfterGDC(objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", objc_msgSend(v338, "portType")), "cameraInfo"), v299, v354, v256, v257, v258, v259);
                FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v354, v354 >> 32, v260, v261, v262, v263, v63);
                CGFloat v264 = v412.origin.x;
                CGFloat v265 = v412.origin.y;
                CGFloat v266 = v412.size.width;
                CGFloat v267 = v412.size.height;
                if (!CGRectIsNull(v412))
                {
                  v413.origin.double x = v264;
                  v413.origin.double y = v265;
                  v413.size.double width = v266;
                  v413.size.double height = v267;
                  double v73 = v254;
                  v417.origin.double x = v254;
                  v417.origin.double y = rect2b;
                  double v74 = rect2b;
                  double v77 = v352;
                  v417.size.double width = v352;
                  v417.size.double height = height;
                  uint64_t v79 = v340;
                  if (!CGRectEqualToRect(v413, v417))
                  {
                    double height = v267;
                    double v77 = v266;
                    double v74 = v265;
                    double v73 = v264;
                  }
                  goto LABEL_80;
                }
                double v73 = v254;
                double v74 = rect2b;
                double v77 = v352;
              }
LABEL_79:
              uint64_t v79 = v340;
LABEL_80:
              id v348 = v8;
              long long v370 = 0u;
              long long v371 = 0u;
              long long v368 = 0u;
              long long v369 = 0u;
              uint64_t v80 = [obj countByEnumeratingWithState:&v368 objects:v397 count:16];
              int v334 = v55;
              uint64_t v341 = v79;
              if (v80)
              {
                uint64_t v81 = v80;
                uint64_t v82 = *(void *)v369;
                int rect2a = 0x7FFFFFFF;
                double v83 = v74;
                do
                {
                  for (uint64_t j = 0; j != v81; ++j)
                  {
                    if (*(void *)v369 != v82) {
                      objc_enumerationMutation(obj);
                    }
                    v85 = *(void **)(*((void *)&v368 + 1) + 8 * j);
                    if (([v85 isEqualToString:@"Depth"] & 1) == 0)
                    {
                      cf[0] = 0;
                      uint64_t v86 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:attachedMediaKey:", v2, v338, BWStillImageBufferTypeForAttachedMediaKey(v85), v85);
                      if (v86)
                      {
                        v87 = (__CVBuffer *)v86;
                        *(void *)v380 = 0;
                        CFTypeRef v88 = (CFTypeRef)[*(id *)(v2 + 88) objectForKeyedSubscript:v85];
                        if (v88) {
                          CFTypeRef v88 = CFRetain(v88);
                        }
                        *(void *)v380 = v88;
                        if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)[v355 objectForKeyedSubscript:v85], v87, (CFTypeRef *)v380, (CMSampleBufferRef *)cf))
                        {
                          BWCMSampleBufferCopyReattachAndReturnMutableMetadata(cf[0]);
                          [*(id *)(v2 + 88) setObject:*(void *)v380 forKeyedSubscript:v85];
                          [v317 setObject:cf[0] forKeyedSubscript:v85];
                          [v316 setObject:v87 forKeyedSubscript:v85];
                          if (cf[0]) {
                            CFRelease(cf[0]);
                          }
                        }
                        CVPixelBufferRelease(v87);
                        if (*(void *)v380) {
                          CFRelease(*(CFTypeRef *)v380);
                        }
                      }
                      if (!cf[0])
                      {
                        if ([v85 isEqualToString:0x1EFA4EB60]) {
                          int v89 = -10001;
                        }
                        else {
                          int v89 = rect2a;
                        }
                        int rect2a = v89;
                      }
                    }
                  }
                  uint64_t v81 = [obj countByEnumeratingWithState:&v368 objects:v397 count:16];
                }
                while (v81);
              }
              else
              {
                int rect2a = 0x7FFFFFFF;
                double v83 = v74;
              }
              uint64_t v353 = v2;
              v90 = (void *)[MEMORY[0x1E4F28E78] string];
              long long v364 = 0u;
              long long v365 = 0u;
              long long v366 = 0u;
              long long v367 = 0u;
              uint64_t v91 = [v348 countByEnumeratingWithState:&v364 objects:v396 count:16];
              if (v91)
              {
                uint64_t v92 = v91;
                uint64_t v93 = *(void *)v365;
                do
                {
                  for (uint64_t k = 0; k != v92; ++k)
                  {
                    if (*(void *)v365 != v93) {
                      objc_enumerationMutation(v348);
                    }
                    [v90 appendFormat:@"%@:%d,", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v364 + 1) + 8 * k), "stringByReplacingOccurrencesOfString:withString:", @"PersonSemantics", &stru_1EFA403E0), "stringByReplacingOccurrencesOfString:withString:", @"LowResPerson", &stru_1EFA403E0), "lowercaseString"), objc_msgSend(obj, "objectForKeyedSubscript:", *(void *)(*((void *)&v364 + 1) + 8 * k)) != 0];
                  }
                  uint64_t v92 = [v348 countByEnumeratingWithState:&v364 objects:v396 count:16];
                }
                while (v92);
              }
              unint64_t v322 = v321 & 0x2000;
              uint64_t v2 = v353;
              uint64_t v95 = v354;
              id v5 = v345;
              if (dword_1EB4C5650)
              {
                unsigned int v373 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v96 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v97 = v373;
                if (os_log_type_enabled(v96, type)) {
                  unsigned int v98 = v97;
                }
                else {
                  unsigned int v98 = v97 & 0xFFFFFFFE;
                }
                if (v98)
                {
                  int v99 = [v338 applyZoom];
                  uint64_t v100 = [v326 count];
                  v101 = BWStringFromCGRect(v73, v83, v77, height);
                  v102 = BWStringFromCGRect(v311, v313, v298, v297);
                  *(_DWORD *)v380 = 136318722;
                  *(void *)&v380[4] = "-[BWIntelligentDistortionCorrectionProcessorController _process]";
                  __int16 v381 = 1026;
                  *(_DWORD *)v382 = v285;
                  *(_WORD *)&v382[4] = 1026;
                  *(_DWORD *)&v382[6] = v324;
                  *(_WORD *)v383 = 1026;
                  *(_DWORD *)&v383[2] = v99;
                  *(_WORD *)v384 = 1026;
                  *(_DWORD *)&v384[2] = 1;
                  *(_WORD *)v385 = 1026;
                  *(_DWORD *)&v385[2] = v330 != 0;
                  uint64_t v2 = v353;
                  uint64_t v95 = v354;
                  *(_WORD *)v386 = 2114;
                  *(void *)&v386[2] = v90;
                  LOWORD(v387) = 2050;
                  *(void *)((char *)&v387 + 2) = v100;
                  WORD5(v387) = 1026;
                  HIDWORD(v387) = v322 >> 13;
                  *(_WORD *)v388 = 2114;
                  *(void *)&v388[2] = v101;
                  __int16 v389 = 2114;
                  *(void *)v390 = v102;
                  *(_WORD *)&v390[8] = 1026;
                  *(_DWORD *)v391 = 1;
                  *(_WORD *)&v391[4] = 1026;
                  *(_DWORD *)&v391[6] = v334;
                  __int16 v392 = 1026;
                  id v5 = v345;
                  int v393 = v341;
                  __int16 v394 = 1026;
                  unsigned int v395 = v332;
                  LODWORD(v280) = 112;
                  v277 = v380;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              id v3 = v338;
              v52 = v284;
              if (objc_msgSend(v338, "applyZoom", v277, v280))
              {
                double v305 = 0.0;
                double v103 = v77;
                double v104 = height;
                double v303 = 0.0;
                double v306 = 0.5;
                double v307 = 0.5;
                uint64_t v105 = v330;
                unsigned int v106 = v334;
                uint64_t v107 = v341;
              }
              else
              {
                v405.origin.double x = v73;
                v405.origin.double y = v83;
                v405.size.double width = v77;
                v405.size.double height = height;
                CGFloat MidX = CGRectGetMidX(v405);
                v406.origin.double y = v83;
                double v109 = MidX;
                v406.origin.double x = v73;
                v406.size.double width = v77;
                double v318 = height;
                v406.size.double height = height;
                double MidY = CGRectGetMidY(v406);
                double v307 = 0.5;
                v407.origin.double x = v109 - (double)v334 * 0.5;
                v407.origin.double y = MidY - (double)(int)v341 * 0.5;
                v407.size.double width = (double)v334;
                v407.size.double height = (double)(int)v341;
                v415.origin.double x = v311;
                v415.origin.double y = v313;
                v415.size.double height = v297;
                v415.size.double width = v298;
                CGRectIntersection(v407, v415);
                FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
                double v103 = v408.size.width;
                double v111 = v408.origin.y;
                v416.origin.double x = v109 - (double)v334 * 0.5;
                v416.origin.double y = MidY - (double)(int)v341 * 0.5;
                v416.size.double width = (double)v334;
                double v104 = v408.size.height;
                v416.size.double height = (double)(int)v341;
                double v73 = v408.origin.x;
                BOOL v112 = CGRectEqualToRect(v408, v416);
                double v113 = 0.5;
                uint64_t v105 = v330;
                if (!v112) {
                  double v307 = FigCaptureTransformPointToCoordinateSpaceOfRect(v109, MidY, v73, v111, v103);
                }
                unsigned int v106 = (int)v103;
                double v303 = v104 / v318;
                uint64_t v107 = (int)v104;
                double height = v104;
                double v305 = v103 / v77;
                double v306 = v113;
                double v77 = v103;
                double v83 = v111;
              }
              [*(id *)(v353 + 72) setProcessIntelligentDistortionCorrection:v324];
              [*(id *)(v353 + 72) setProcessGeometricDistortionCorrection:v285];
              [*(id *)(v353 + 72) setApplyZoom:1];
              objc_msgSend(*(id *)(v353 + 72), "setApplyStereoRectificationHomography:", objc_msgSend(v338, "applyStereoRectificationHomography"));
              [v338 stereoRectificationInverseHomography];
              objc_msgSend(*(id *)(v353 + 72), "setStereoRectificationInverseHomography:");
              objc_msgSend(*(id *)(v353 + 72), "setUseBilinearInterpolation:", objc_msgSend(v338, "useBilinearInterpolation"));
              objc_msgSend(*(id *)(v353 + 72), "setGdcForwardPolynomial:", objc_msgSend(v338, "geometricDistortionCorrectionForwardPolynomial"));
              objc_msgSend(*(id *)(v353 + 72), "setGdcInversePolynomial:", objc_msgSend(v338, "geometricDistortionCorrectionInversePolynomial"));
              [v338 geometricDistortionCorrectionOpticalCenterOffset];
              objc_msgSend(*(id *)(v353 + 72), "setOpticalCenterOffset:");
              objc_msgSend(*(id *)(v353 + 72), "setUsePrecomputedPolynomialsAndOpticalCenterOffset:", objc_msgSend(v338, "geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset"));
              [*(id *)(v353 + 72) setInputImage:v328];
              [*(id *)(v353 + 72) setInputImageMetadataDictionary:v299];
              [*(id *)(v353 + 72) setLowResSegmentationMask:v105];
              [*(id *)(v353 + 72) setFaceObservations:v326];
              [*(id *)(v353 + 72) setDeviceWasStationaryDuringCapture:v322 != 0];
              objc_msgSend(*(id *)(v353 + 72), "setInputImageCropRect:", v73, v83, v103, v104);
              [*(id *)(v353 + 72) setOutputImage:v284];
              int v335 = v106;
              int v342 = v107;
              uint64_t v114 = v106 | (unint64_t)(v107 << 32);
              [*(id *)(v353 + 72) setFinalImageDimensions:v114];
              [*(id *)(v353 + 72) setReplicatePixelsOutsideOfFinalImageDimensions:v332];
              unsigned int v115 = [*(id *)(v353 + 72) process];
              [*(id *)(v353 + 72) outputValidBufferRect];
              double v331 = v117;
              double v333 = v116;
              double v329 = v118;
              double v120 = v119;
              unsigned int v282 = [*(id *)(v353 + 72) makernoteEntry];
              int v283 = [*(id *)(v353 + 72) correctionType];
              double v349 = v77;
              if (dword_1EB4C5650)
              {
                unsigned int v373 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v121 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v122 = v373;
                if (os_log_type_enabled(v121, type)) {
                  unsigned int v123 = v122;
                }
                else {
                  unsigned int v123 = v122 & 0xFFFFFFFE;
                }
                if (v123)
                {
                  uint64_t v124 = objc_msgSend((id)objc_msgSend(v338, "captureSettings"), "settingsID");
                  int v125 = [v338 applyZoom];
                  uint64_t v126 = [v326 count];
                  v127 = BWStringFromCGRect(v73, v83, v103, v104);
                  v409.origin.double x = v333;
                  v409.origin.double y = v329;
                  v409.size.double width = v120;
                  v409.size.double height = v331;
                  if (CGRectIsNull(v409))
                  {
                    v128 = &stru_1EFA403E0;
                  }
                  else
                  {
                    v129 = NSString;
                    v278 = BWStringFromCGRect(v333, v329, v120, v331);
                    v130 = v129;
                    uint64_t v95 = v354;
                    v128 = (__CFString *)[v130 stringWithFormat:@"outputROI:%@", v278];
                  }
                  *(_DWORD *)v380 = 136318466;
                  *(void *)&v380[4] = "-[BWIntelligentDistortionCorrectionProcessorController _process]";
                  __int16 v381 = 2048;
                  *(void *)v382 = v124;
                  *(_WORD *)&v382[8] = 1024;
                  *(_DWORD *)v383 = v324;
                  *(_WORD *)&v383[4] = 1024;
                  *(_DWORD *)v384 = v285;
                  *(_WORD *)&v384[4] = 1024;
                  *(_DWORD *)v385 = v125;
                  *(_WORD *)&v385[4] = 2048;
                  *(void *)v386 = v126;
                  *(_WORD *)&v386[8] = 1024;
                  LODWORD(v387) = v322 >> 13;
                  WORD2(v387) = 2112;
                  *(void *)((char *)&v387 + 6) = v127;
                  HIWORD(v387) = 1024;
                  *(_DWORD *)v388 = v335;
                  *(_WORD *)&v388[4] = 1024;
                  *(_DWORD *)&v388[6] = v342;
                  __int16 v389 = 1024;
                  *(_DWORD *)v390 = v115;
                  *(_WORD *)&v390[4] = 1024;
                  *(_DWORD *)&v390[6] = v282;
                  *(_WORD *)v391 = 2112;
                  *(void *)&v391[2] = v128;
                  __int16 v392 = 1024;
                  int v393 = v283;
                  LODWORD(v280) = 106;
                  v277 = v380;
                  _os_log_send_and_compose_impl();
                  uint64_t v2 = v353;
                  id v3 = v338;
                  id v5 = v345;
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v52 = v284;
              }
              if (v115)
              {
                unsigned int v150 = -10000;
LABEL_215:
                v284 = v52;

                uint64_t v48 = 0;
                goto LABEL_183;
              }
              double v131 = height;
              CGFloat v132 = v83;
              CGFloat v133 = v103;
              double v134 = v103;
              CGFloat v135 = v104;
              double v286 = (double)(int)v95;
              FigCaptureMetadataUtilitiesNormalizeCropRect(v73, v83, v134, v104);
              double v319 = v137;
              double v320 = v136;
              double v323 = v139;
              double v325 = v138;
              v410.origin.double y = v329;
              v410.size.double width = v120;
              v410.origin.double x = v333;
              v410.size.double height = v331;
              if (CGRectIsNull(v410))
              {
                char v140 = v309;
                double v327 = v120;
                goto LABEL_146;
              }
              FigCaptureMetadataUtilitiesRoundRectToMultipleOf();
              double v331 = v142;
              double v333 = v143;
              double v145 = v144;
              double v327 = v144;
              double v329 = v141;
              if (v287)
              {
                double v146 = v141;
                double v147 = v142;
                unint64_t v148 = psn_pixelBufferDimensions(v284);
                FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v288, v95, v148, v73, v132, v133, v135, v333, v146, v145, v147);
LABEL_145:
                char v140 = v309;
LABEL_146:
                int v152 = objc_msgSend((id)objc_msgSend(v3, "processingSettings", v277, v280), "provideDemosaicedRaw");
                if ((v140 & 4) == 0 && (v152 & v285) != 0)
                {
                  CMAttachmentBearerRef v153 = target;
                  objc_msgSend((id)objc_msgSend(v3, "settings"), "settingsID");
                  -[BWIntelligentDistortionCorrectionProcessorController _getAndAttachGDCInformationToDemosaicedRawSampleBuffer:inputDimensions:finalImageDimensions:settingsID:](v353, v153, v95, v114);
                }
                BWSampleBufferRemoveAttachedMedia(target, 0x1EFA4EB60);
                if ([*(id *)(v353 + 72) globalTransformIsValid])
                {
                  if (CMGetAttachment(target, @"StillImageProcessingHomography", 0)) {
                    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"BWIntelligentDistortionCorrectionProcessorController does not support merging StillImageProcessingHomography -- this support must be implemented!" userInfo:0]);
                  }
                  [*(id *)(v353 + 72) globalTransform];
                  v157 = (const void *)BWRowMajorArrayFrom3x3Matrix(v154, v155, v156);
                  CMSetAttachment(target, @"StillImageProcessingHomography", v157, 1u);
                }
                long long v362 = 0u;
                long long v363 = 0u;
                long long v360 = 0u;
                long long v361 = 0u;
                uint64_t v158 = [obj countByEnumeratingWithState:&v360 objects:v379 count:16];
                if (v158)
                {
                  uint64_t v159 = v158;
                  double v295 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
                  double v296 = *MEMORY[0x1E4F1DB20];
                  double v293 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
                  double v294 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
                  uint64_t v160 = *(void *)v361;
                  float v161 = v327 / v349;
                  float v304 = v161;
                  float v162 = v331 / v131;
                  float v302 = v162;
                  float v163 = v298 / v286;
                  float v164 = v297 / (double)SHIDWORD(v354);
                  float v291 = v164;
                  float v292 = v163;
                  float v165 = v311;
                  float v166 = v313;
                  float v289 = v166;
                  float v290 = v165;
                  do
                  {
                    for (uint64_t m = 0; m != v159; ++m)
                    {
                      if (*(void *)v361 != v160) {
                        objc_enumerationMutation(obj);
                      }
                      v168 = *(void **)(*((void *)&v360 + 1) + 8 * m);
                      int v169 = [v168 isEqualToString:@"Depth"];
                      v170 = (__CVBuffer *)[obj objectForKeyedSubscript:v168];
                      v171 = v170;
                      if (v169)
                      {
                        unint64_t v172 = psn_pixelBufferDimensions(v170);
                        if (-[BWIntelligentDistortionCorrectionProcessorController _applyExistingCorrectionToDepthPixelBuffer:primaryImageDimensions:](v353, v171, v354))
                        {
                          BWSampleBufferRemoveAttachedMedia(target, (uint64_t)v168);
                        }
                        else if ([*(id *)(v353 + 72) zoomWasApplied])
                        {
                          v411.size.double height = v331;
                          v411.origin.double x = v333;
                          v411.size.double width = v327;
                          v411.origin.double y = v329;
                          if (!CGRectIsNull(v411) && !v287)
                          {
                            v233 = (const void *)BWSampleBufferGetAttachedMedia(target, @"Depth");
                            v234 = (void *)CMGetAttachment(v233, key, 0);
                            FigCaptureMetadataUtilitiesDenormalizeCropRect(v320, v319, v325, v323);
                            CGFloat v236 = v235;
                            CGFloat v238 = v237;
                            CGFloat v347 = v240;
                            id v351 = v239;
                            FigCaptureMetadataUtilitiesNormalizeCropRect(v333, v329, v327, v331);
                            FigCaptureMetadataUtilitiesDenormalizeCropRect(v241, v242, v243, v244);
                            double v246 = v245;
                            double v248 = v247;
                            double v344 = v249;
                            double v337 = v250;
                            FigCFDictionarySetCGRect();
                            FigCFDictionarySetCGRect();
                            FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v234, v172, v172, v236, v238, *(CGFloat *)&v351, v347, v246, v248, v344, v337);
                            FigCFDictionarySetCGRect();
                          }
                        }
                      }
                      else
                      {
                        uint64_t v173 = v159;
                        uint64_t v174 = v160;
                        v175 = (__CVBuffer *)[v316 objectForKeyedSubscript:v168];
                        v336 = (const void *)[v317 objectForKeyedSubscript:v168];
                        v176 = (void *)CMGetAttachment(v336, key, 0);
                        unint64_t v177 = psn_pixelBufferDimensions(v171);
                        FigCaptureMetadataUtilitiesDenormalizeCropRect(v320, v319, v325, v323);
                        CGFloat v179 = v178;
                        CGFloat v315 = v180;
                        double v346 = v182;
                        id v350 = v181;
                        unint64_t v183 = psn_pixelBufferDimensions(v175);
                        FigCaptureMetadataUtilitiesNormalizeCropRect(v333, v329, v327, v331);
                        FigCaptureMetadataUtilitiesDenormalizeCropRect(v184, v185, v186, v187);
                        double v189 = v188;
                        double v191 = v190;
                        double v193 = v192;
                        double v343 = v194;
                        int v195 = [v168 isEqualToString:0x1EFA74720];
                        int v196 = v195 | [v168 isEqualToString:0x1EFA74920];
                        if (v196 == 1)
                        {
                          double v312 = (double)SHIDWORD(v183);
                          double v314 = (double)(int)v183;
                          double v199 = FigCaptureMetadataUtilitiesGetFinalCropRect();
                          FigCaptureMetadataUtilitiesDenormalizeCropRect(v199, v200, v201, v202);
                          double v301 = v203;
                          double v205 = v204;
                          double v207 = v206;
                          double v209 = v208;
                          double v310 = 0.0;
                          double v210 = v193;
                          double TotalSensorCropRect = FigCaptureMetadataUtilitiesGetTotalSensorCropRect();
                          double v300 = v212;
                          double v214 = v213;
                          double v215 = v179;
                          double v217 = v216;
                          double v218 = FigCaptureMetadataUtilitiesGetTotalSensorCropRect();
                          double v219 = v209;
                          *(float *)&double v220 = v220 / v214;
                          *(float *)&double v221 = v221 / v217;
                          float v222 = v298 / v214;
                          double v198 = v297 / v217;
                          CGFloat v179 = v215;
                          *(float *)&double v198 = v198;
                          double v223 = v218 - TotalSensorCropRect;
                          double v193 = v210;
                          *(float *)&double v223 = v223 * v222;
                          double v197 = *(float *)&v198;
                          *(float *)&double v224 = (v224 - v300) * *(float *)&v198;
                          *(float *)&double v197 = v292 * *(float *)&v220;
                          *(float *)&double v198 = v291 * *(float *)&v221;
                          double v225 = v301;
                          *(float *)&double v226 = v290 + *(float *)&v223;
                          *(float *)&double v227 = v289 + *(float *)&v224;
                          double v191 = 0.0;
                          double v228 = v343;
                        }
                        else
                        {
                          double v226 = 0.0;
                          LODWORD(v197) = 1.0;
                          double v314 = v193;
                          double v228 = v343;
                          double v310 = v189;
                          double v312 = v343;
                          LODWORD(v198) = 1.0;
                          double v205 = v295;
                          double v225 = v296;
                          double v227 = 0.0;
                          double v219 = v293;
                          double v207 = v294;
                        }
                        float v229 = v193 / *(double *)&v350;
                        float v230 = v228 / v346;
                        *(float *)&uint64_t v279 = v229 / v304;
                        *((float *)&v279 + 1) = v230 / v302;
                        int v231 = objc_msgSend(*(id *)(v353 + 72), "applyExistingCorrectionToSecondaryAsset:inputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputPixelBuffer:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:", v171, v354, v175, v225, v205, v207, v219, v197, v198, v226, v227, v279);
                        uint64_t v160 = v174;
                        uint64_t v159 = v173;
                        if (!v231)
                        {
                          if ([v338 applyZoom])
                          {
                            FigCFDictionarySetCGRect();
                            FigCFDictionarySetCGRect();
                            FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v176, v177, v183, v179, v315, *(CGFloat *)&v350, v346, v310, v191, v314, v312);
                          }
                          else
                          {
                            FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata(v288, v176);
                          }
                          if (v196) {
                            FigCaptureMetadataUtilitiesPreventFurtherCropping(v176, v232);
                          }
                          BWSampleBufferSetAttachedMedia(target, (uint64_t)v168, (uint64_t)v336);
                        }
                        if ([v168 isEqualToString:0x1EFA4EB60]) {
                          int v251 = v231;
                        }
                        else {
                          int v251 = rect2a;
                        }
                        int rect2a = v251;
                        id v3 = v338;
                      }
                    }
                    uint64_t v159 = [obj countByEnumeratingWithState:&v360 objects:v379 count:16];
                  }
                  while (v159);
                }
                if (v285)
                {
                  [v288 setObject:&unk_1EFB027C8 forKeyedSubscript:v281];
                  [v288 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F533E8]];
                }

                uint64_t v48 = 0;
                unsigned int v115 = 0;
                unsigned int v150 = -10000;
                id v5 = (void *)target;
                uint64_t v2 = v353;
                goto LABEL_183;
              }
              if (![*(id *)(v353 + 72) zoomWasApplied]) {
                goto LABEL_145;
              }
              uint64_t v149 = v114;
              unsigned int v115 = 0;
              unsigned int v150 = -10000;
              if (v333 == 0.0 && v329 == 0.0)
              {
                unsigned int v115 = 0;
                if (v145 == (double)v335 && v331 == (double)v342)
                {
                  if (objc_msgSend(v3, "applyZoom", (double)v342, v331))
                  {
                    FigCFDictionarySetCGRect();
                    FigCFDictionarySetCGRect();
                    unint64_t v151 = psn_pixelBufferDimensions(v284);
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v288, v95, v151, v73, v83, v133, v135, v333, v329, v145, v331);
                  }
                  else
                  {
                    unint64_t v268 = psn_pixelBufferDimensions(v284);
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v288, v95, v268, v73, v83, v133, v135, v333, v329, v145, v331);
                    FigCaptureMetadataUtilitiesNormalizeCropRect(v333, v329, v145, v331);
                    double v270 = v269;
                    double v272 = v271;
                    double v275 = FigCaptureTransformNormalizedPointFromCoordinateSpaceOfNormalizedRect(v307, v306, v273, v274, v269);
                    v414.size.double width = v270 / v305;
                    v414.size.double height = v272 / v303;
                    v414.origin.double x = v275 - v270 / v305 * 0.5;
                    v414.origin.double y = v276 - v272 / v303 * 0.5;
                    v418.origin.double x = 0.0;
                    v418.origin.double y = 0.0;
                    v418.size.double width = 1.0;
                    v418.size.double height = 1.0;
                    CGRectIntersection(v414, v418);
                    FigCFDictionarySetCGRect();
                  }
                  char v140 = v309;
                  uint64_t v114 = v149;
                  goto LABEL_146;
                }
              }
LABEL_210:
              v52 = v284;
              goto LABEL_215;
            }
            FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v354, v354 >> 32, FinalCropRect, v29, v27, v30, v63);
            double v73 = v404.origin.x;
            CGFloat v78 = v404.origin.y;
            double v77 = v404.size.width;
            double height = v404.size.height;
            if (!CGRectIsNull(v404))
            {
              double v74 = v78;
              goto LABEL_79;
            }
            uint64_t v280 = v1;
            LODWORD(v277) = 0;
            FigDebugAssert3();
            goto LABEL_212;
          }
          unsigned int v58 = CVPixelBufferGetWidth(v52);
          unint64_t v59 = v58 | ((unint64_t)CVPixelBufferGetHeight(v52) << 32);
          FigCaptureMakeRectWithAspectRatioInsideDimensions(v59, 1, (float)[rect2 outputWidth]/ (float)objc_msgSend(rect2, "outputHeight"));
          LODWORD(v55) = (int)v60;
          unint64_t v56 = (int)v61;
        }
        uint64_t v340 = v56;
        goto LABEL_67;
      }
      unsigned int v282 = 0;
      v288 = 0;
    }
LABEL_213:
    unsigned int v150 = -10000;
    goto LABEL_214;
  }

  uint64_t v48 = 0;
  v288 = 0;
  v284 = 0;
LABEL_190:
  objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v2, v5, objc_msgSend(v3, "imageBufferType"), v3, v48);
  -[BWIntelligentDistortionCorrectionProcessorController _resetProcessor](v2);
  if (v284) {
    CFRelease(v284);
  }
  if (target) {
    CFRelease(target);
  }

  [v355 removeAllObjects];
  [obj removeAllObjects];
  [v317 removeAllObjects];
  [v316 removeAllObjects];
  return -[BWIntelligentDistortionCorrectionProcessorController _updateStateIfNeeded](v2);
}

- (void)_getAndAttachGDCInformationToDemosaicedRawSampleBuffer:(uint64_t)a1 inputDimensions:(const void *)a2 finalImageDimensions:(uint64_t)a3 settingsID:(uint64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA745E0);
    if (AttachedMedia)
    {
      uint64_t v9 = AttachedMedia;
      CFTypeRef v10 = CMGetAttachment(AttachedMedia, @"RawDNGDictionary", 0);
      if (!v10) {
        goto LABEL_28;
      }
      uint64_t v11 = (void *)v10;
      double v43 = 0.0;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      if ([*(id *)(a1 + 72) getAdjustedGDCInformation:&v39]) {
        goto LABEL_28;
      }
      LODWORD(v12) = v41;
      v48[0] = [NSNumber numberWithFloat:v12];
      LODWORD(v13) = DWORD1(v41);
      v48[1] = [NSNumber numberWithFloat:v13];
      LODWORD(v14) = DWORD2(v41);
      v48[2] = [NSNumber numberWithFloat:v14];
      LODWORD(v15) = HIDWORD(v41);
      v48[3] = [NSNumber numberWithFloat:v15];
      long long v16 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
      unint64_t v17 = BWPixelBufferDimensionsFromSampleBuffer(v9);
      uint64_t v18 = (void *)BWCreateDNGDictionaryWithZoomedGDCParameters(v11, v16, v17, *(CGFloat *)&v39, *((CGFloat *)&v39 + 1), *(CGFloat *)&v40, *((CGFloat *)&v40 + 1), *((double *)&v42 + 1), v43);
      if (!v18)
      {
LABEL_28:
        BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA745E0);
        return;
      }
      uint64_t v19 = v18;
      CMSetAttachment(v9, @"RawDNGDictionary", v18, 1u);
      if (a3 == v17)
      {
        int v20 = llround(vabdd_f64((double)(int)a4, *(double *)&v40));
        signed int v21 = llround(vabdd_f64((double)SHIDWORD(a4), *((double *)&v40 + 1)));
        BOOL v22 = v20 <= 4 && v21 <= 4;
        int v38 = v19;
        if (v22)
        {
          v51.origin.double x = *(double *)&v39 - (double)(v20 / 2);
          v51.origin.double y = *((double *)&v39 + 1) - (double)(v21 / 2);
          v52.origin.double x = 0.0;
          v52.origin.double y = 0.0;
          v52.size.double width = (double)(int)a3;
          v52.size.double height = (double)SHIDWORD(a3);
          v51.size.double width = (double)(int)a4;
          v51.size.double height = (double)SHIDWORD(a4);
          *(CGRect *)&double v23 = CGRectIntersection(v51, v52);
        }
        else
        {
          FigCaptureMetadataUtilitiesRoundRectToMultipleOf();
        }
        FigCaptureMetadataUtilitiesNormalizeCropRect(v23, v24, v25, v26);
        CGFloat v27 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:0x1EFA745E0];
        size_t v28 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "providedInferenceAttachedMediaByMode"), "objectForKeyedSubscript:", &unk_1EFB027F8);
        if ([v28 count]) {
          [v27 addObjectsFromArray:v28];
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v45;
          CFStringRef v32 = (const __CFString *)*MEMORY[0x1E4F53070];
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v45 != v31) {
                objc_enumerationMutation(v27);
              }
              uint64_t v34 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              double v35 = (const void *)BWSampleBufferGetAttachedMedia(a2, v34);
              if (v35)
              {
                double v36 = v35;
                double v37 = objc_msgSend((id)CMGetAttachment(v35, v32, 0), "mutableCopy");
                CMSetAttachment(v36, v32, v37, 1u);

                if (FigCFDictionarySetCGRect()) {
                  BWSampleBufferRemoveAttachedMedia(a2, v34);
                }
              }
            }
            uint64_t v30 = [v27 countByEnumeratingWithState:&v44 objects:v49 count:16];
          }
          while (v30);
        }
        uint64_t v19 = v38;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
}

- (uint64_t)_applyExistingCorrectionToDepthPixelBuffer:(uint64_t)a3 primaryImageDimensions:
{
  if (!a1) {
    return 0;
  }
  int v6 = [*(id *)(a1 + 56) baseDepthRotationDegrees];
  int v7 = FigDepthConvertRotationAndMirroringToExifOrientation(360 - v6, 0);
  uint64_t v8 = FigDepthRotateBuffer(a2, *(__CVBuffer **)(a1 + 120), v7);
  if (v8)
  {
    uint64_t v9 = v8;
    goto LABEL_8;
  }
  uint64_t v9 = [*(id *)(a1 + 72) applyExistingCorrectionToSecondaryAsset:*(void *)(a1 + 120) outputPixelBuffer:*(void *)(a1 + 128) primaryImageDimensions:a3];
  if (v9)
  {
LABEL_8:
    FigDebugAssert3();
    return v9;
  }
  int v10 = FigDepthConvertRotationAndMirroringToExifOrientation(v6, 0);
  uint64_t v11 = FigDepthRotateBuffer(*(__CVBuffer **)(a1 + 128), a2, v10);
  if (v11)
  {
    uint64_t v13 = v11;
    FigDebugAssert3();
    return v13;
  }
  return v9;
}

uint64_t __85__BWIntelligentDistortionCorrectionProcessorController__loadSetupAndPrepareProcessor__block_invoke(uint64_t a1, void *a2)
{
  return -[BWIntelligentDistortionCorrectionProcessorController _prepareProcessor:](*(void *)(a1 + 32), a2);
}

- (uint64_t)_prepareProcessor:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v14 = 0;
  uint64_t v4 = [*(id *)(a1 + 56) processorConfig];
  unint64_t v5 = (unint64_t)[*(id *)(a1 + 56) processorConfig] >> 32;
  [*(id *)(a1 + 56) processorConfig];
  uint64_t v7 = v6;
  [*(id *)(a1 + 56) processorConfig];
  if ([a2 determineWorkingBufferRequirements:&v14 maximumInputImageWidth:v4 maximumInputImageHeight:v5 maximumSegmentationMaskWidth:v7 maximumSegmentationMaskHeight:HIDWORD(v8)])goto LABEL_11; {
  if ((unint64_t)(v14 - 209715200) < 0xFFFFFFFFF3800001)
  }
  {
    uint64_t v11 = 0;
    uint64_t v12 = 4294954516;
    goto LABEL_8;
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F55F60] metalDevice];
  if (!v9)
  {
LABEL_11:
    uint64_t v11 = 0;
LABEL_12:
    uint64_t v12 = 4294954510;
    goto LABEL_8;
  }
  int v10 = (void *)[v9 newBufferWithLength:v14 options:0];
  uint64_t v11 = v10;
  if (!v10)
  {
    FigDebugAssert3();
    uint64_t v12 = FigSignalErrorAt();
    goto LABEL_8;
  }
  if (objc_msgSend(a2, "setSharedMetalBuffer:offset:size:", v10, 0, objc_msgSend(v10, "allocatedSize"))) {
    goto LABEL_12;
  }
  uint64_t v12 = 0;
LABEL_8:

  return v12;
}

@end