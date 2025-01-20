@interface BWStereoDisparityProcessorController
+ (BOOL)usesCustomProcessingFlow;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BWStereoDisparityProcessorController)initWithConfiguration:(id)a3;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)prepare;
- (int)process;
- (int)processDisparityInferenceWithReferenceBuffer:(__CVBuffer *)a3 auxBuffer:(__CVBuffer *)a4 outputDisparityBuffer:(__CVBuffer *)a5;
- (uint64_t)_loadFSDNetForReferencePortType:(uint64_t)a3 auxiliaryPortType:;
- (uint64_t)_loadSetupAndPrepareDisparityProcessorWithConfiguration:(uint64_t)result;
- (unint64_t)type;
- (void)dealloc;
- (void)inputReceivedNewInputData:(id)a3;
- (void)reset;
@end

@implementation BWStereoDisparityProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWStereoDisparityProcessorController)initWithConfiguration:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BWStereoDisparityProcessorController;
  v4 = [(BWStillImageProcessorController *)&v14 initWithName:@"StereoDisparity" type:8 configuration:a3];
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count")
      || [a3 stillImageDepthDataType] != 2
      && [a3 stillImageDepthDataType] != 8)
    {
      goto LABEL_16;
    }
    if ([+[FigCaptureCameraParameters sharedInstance] disparityVersion] < 5)goto LABEL_13; {
    v5 = (void *)[a3 sensorConfigurationsByPortType];
    }
    uint64_t v6 = *MEMORY[0x1E4F52DE8];
    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F52DE8]];
    uint64_t v8 = *MEMORY[0x1E4F52DD8];
    if (v7 && [v5 objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]])
    {
      p_isa = (id *)&v4->super.super.isa;
      uint64_t v10 = v8;
      uint64_t v11 = v6;
    }
    else
    {
      if (![v5 objectForKeyedSubscript:v8]) {
        goto LABEL_15;
      }
      uint64_t v12 = *MEMORY[0x1E4F52DF0];
      if (![v5 objectForKeyedSubscript:*MEMORY[0x1E4F52DF0]]) {
        goto LABEL_15;
      }
      p_isa = (id *)&v4->super.super.isa;
      uint64_t v10 = v12;
      uint64_t v11 = v8;
    }
    if (!-[BWStereoDisparityProcessorController _loadFSDNetForReferencePortType:auxiliaryPortType:](p_isa, v10, v11))
    {
LABEL_13:
      if (!-[BWStereoDisparityProcessorController _loadSetupAndPrepareDisparityProcessorWithConfiguration:]((uint64_t)v4, a3))return v4; {
LABEL_16:
      }

      return 0;
    }
LABEL_15:
    FigDebugAssert3();
    goto LABEL_16;
  }
  return v4;
}

- (uint64_t)_loadFSDNetForReferencePortType:(uint64_t)a3 auxiliaryPortType:
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = (void *)[a1 configuration];
  if (![v6 inferenceScheduler] || !a2 || !a3)
  {
    FigDebugAssert3();
    return 4294954516;
  }

  a1[9] = 0;
  uint64_t v7 = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", [v6 inferenceScheduler], objc_msgSend(v6, "figThreadPriority"), 1);
  a1[8] = v7;
  if (!v7) {
    return 0;
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", a2);
  uint64_t v9 = -[FigCaptureCameraParameters fsdNetStereoImagesAlignmentForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "fsdNetStereoImagesAlignmentForPortType:sensorIDString:", [v8 portType], objc_msgSend(v8, "sensorIDString"));
  if (v9 == -1) {
    return 4294954516;
  }
  uint64_t v10 = objc_msgSend(a1[8], "addInferenceOfType:version:configuration:", 108, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, -[BWFastStereoDisparityConfiguration initWithInferenceType:fsdNetStereoImagesAlignment:disparityType:]([BWFastStereoDisparityConfiguration alloc], "initWithInferenceType:fsdNetStereoImagesAlignment:disparityType:", 108, v9, 2));
  if (v10)
  {
    uint64_t v22 = v10;
    FigDebugAssert3();
    return v22;
  }
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v11 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v11 setWidth:768];
  [(BWVideoFormatRequirements *)v11 setHeight:576];
  [(BWVideoFormatRequirements *)v11 setSupportedPixelFormats:&unk_1EFB03A70];
  [(BWVideoFormatRequirements *)v11 setBytesPerRowAlignment:64];
  v36[0] = v11;
  id v12 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1]);
  v13 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v13 setWidth:896];
  [(BWVideoFormatRequirements *)v13 setHeight:704];
  [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB03A88];
  [(BWVideoFormatRequirements *)v13 setBytesPerRowAlignment:64];
  v35 = v13;
  id v14 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1]);
  v15 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v15 setWidth:768];
  [(BWVideoFormatRequirements *)v15 setHeight:576];
  [(BWVideoFormatRequirements *)v15 setSupportedPixelFormats:&unk_1EFB03AA0];
  [(BWVideoFormatRequirements *)v15 setBytesPerRowAlignment:64];
  v34 = v15;
  v32[0] = 0x1EFA6A3C0;
  v32[1] = 0x1EFA6A3E0;
  v33[0] = v12;
  v33[1] = v14;
  v32[2] = 0x1EFA6A400;
  v33[2] = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1]);
  id v16 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  a1[13] = v16;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
LABEL_10:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v27 != v19) {
        objc_enumerationMutation(v16);
      }
      if (objc_msgSend(a1[8], "prepareForInputVideoFormat:attachedMediaKey:", objc_msgSend(a1[13], "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * v20)), *(void *)(*((void *)&v26 + 1) + 8 * v20)))return 0; {
      if (v18 == ++v20)
      }
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v18) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
  if ([a1[8] prepareForInferenceWithFormatProvider:a1]) {
    return 0;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v30[0] = v24;
  v30[1] = v25;
  uint64_t v22 = 0;
  a1[9] = (id)objc_msgSend(v21, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 2));
  return v22;
}

- (uint64_t)_loadSetupAndPrepareDisparityProcessorWithConfiguration:(uint64_t)result
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 56)) {
      return 0;
    }
    v4 = +[FigCaptureCameraParameters sharedInstance];
    result = [(FigCaptureCameraParameters *)v4 stereoDisparityParameters];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v7 = (void *)[a2 sensorConfigurationsByPortType];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v34 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(void *)(*((void *)&v33 + 1) + 8 * i)), "cameraInfo"), *(void *)(*((void *)&v33 + 1) + 8 * i));
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v9);
      }
      result = [v6 count];
      if (result)
      {
        uint64_t v12 = *MEMORY[0x1E4F53560];
        v37[0] = *MEMORY[0x1E4F535B0];
        v37[1] = v12;
        v38[0] = v5;
        v38[1] = v6;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
        if (!v13) {
          return 4294954510;
        }
        uint64_t v14 = v13;
        uint64_t v15 = [(FigCaptureCameraParameters *)v4 disparityVersion];
        if (!v15) {
          return 4294954516;
        }
        id v16 = BWLoadProcessorBundle(@"Disparity", v15);
        if (!v16) {
          return 4294954510;
        }
        uint64_t v17 = objc_msgSend(objc_alloc((Class)objc_msgSend(v16, "principalClass")), "initWithCommandQueue:", objc_msgSend(a2, "metalCommandQueue"));
        *(void *)(v2 + 56) = v17;
        if (!v17) {
          return 4294954510;
        }
        [v17 setOptions:v14];
        uint64_t v18 = (int)[a2 inputDimensions];
        uint64_t v19 = [a2 inputDimensions] >> 32;
        uint64_t v20 = (int)[a2 disparityOutputDimensions];
        uint64_t v21 = [a2 disparityOutputDimensions] >> 32;
        BOOL v22 = [a2 stillImageDepthDataType] == 8;
        v23 = *(void **)(v2 + 56);
        v25[0] = v18;
        v25[1] = v19;
        BOOL v26 = v22;
        memset(v27, 0, sizeof(v27));
        uint64_t v28 = v20;
        uint64_t v29 = v21;
        int v30 = 1067030938;
        uint64_t v31 = 0x1800000020;
        int v32 = 0;
        [v23 setDisparityConfig:v25];
        int v24 = [*(id *)(v2 + 56) prepareToProcess:0];
        result = 0;
        if (v24) {
          return 4294954510;
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  objc_msgSend((id)-[FigDisparityGenerator metalContext](self->_disparityProcessor, "metalContext"), "waitForIdle");
  [(BWStereoDisparityProcessorController *)self reset];

  refFormatDescription = self->_refFormatDescription;
  if (refFormatDescription) {
    CFRelease(refFormatDescription);
  }
  auxFormatDescription = self->_auxFormatDescription;
  if (auxFormatDescription) {
    CFRelease(auxFormatDescription);
  }
  disparityFormatDescription = self->_disparityFormatDescription;
  if (disparityFormatDescription) {
    CFRelease(disparityFormatDescription);
  }

  v6.receiver = self;
  v6.super_class = (Class)BWStereoDisparityProcessorController;
  [(BWStillImageProcessorController *)&v6 dealloc];
}

- (unint64_t)type
{
  return 8;
}

- (void)inputReceivedNewInputData:(id)a3
{
  [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
  [(BWStillImageProcessorController *)self currentRequestChanged];
}

- (int)processDisparityInferenceWithReferenceBuffer:(__CVBuffer *)a3 auxBuffer:(__CVBuffer *)a4 outputDisparityBuffer:(__CVBuffer *)a5
{
  CFTypeRef v17 = 0;
  CFTypeRef cf = 0;
  uint64_t v8 = [(BWStillImageProcessorController *)self currentRequest];
  uint64_t v9 = (opaqueCMSampleBuffer *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v8 input] referenceSbuf];
  CMSampleBufferGetPresentationTimeStamp(&v16, v9);
  int v10 = BWSampleBufferCreateFromPixelBuffer(a3, (uint64_t)&v16, (CFTypeRef *)&self->_refFormatDescription, (CMSampleBufferRef *)&cf);
  if (v10)
  {
    int v13 = v10;
  }
  else
  {
    CMSampleBufferGetPresentationTimeStamp(&v15, v9);
    int v11 = BWSampleBufferCreateFromPixelBuffer(a4, (uint64_t)&v15, (CFTypeRef *)&self->_auxFormatDescription, (CMSampleBufferRef *)&v17);
    if (v11
      || (BWSampleBufferSetAttachedMedia(v9, 0x1EFA6A3C0, (uint64_t)cf),
          BWSampleBufferSetAttachedMedia(v9, 0x1EFA6A3E0, (uint64_t)v17),
          [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v8 delegate] processorControllerWillProcessInferences:self], (int v11 = [(BWInferenceEngine *)self->_inferenceEngine performInferencesOnSampleBuffer:v9 attachingResultsToSampleBuffer:v9]) != 0))
    {
      int v13 = v11;
    }
    else
    {
      BWSampleBufferRemoveAttachedMedia(v9, 0x1EFA6A3C0);
      BWSampleBufferRemoveAttachedMedia(v9, 0x1EFA6A3E0);
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v9, 0x1EFA6A400);
      if (AttachedMedia)
      {
        CMSampleBufferGetImageBuffer(AttachedMedia);
        int v13 = CopyPixelBuffer();
        if (v13) {
          FigDebugAssert3();
        }
      }
      else
      {
        int v13 = 0;
      }
    }
  }
  BWSampleBufferRemoveAttachedMedia(v9, 0x1EFA6A400);
  BWSampleBufferRemoveAttachedMedia(v9, 0x1EFA6A3C0);
  BWSampleBufferRemoveAttachedMedia(v9, 0x1EFA6A3E0);
  if (cf) {
    CFRelease(cf);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v13;
}

- (void)reset
{
  [(FigDisparityGenerator *)self->_disparityProcessor setShouldComputeDisparityWhenCalibrationFails:0];
  [(FigDisparityGenerator *)self->_disparityProcessor setEqualizeTeleGainToMatchReference:0];
  [(FigDisparityGenerator *)self->_disparityProcessor setReferenceSampleBuffer:0];
  [(FigDisparityGenerator *)self->_disparityProcessor setAuxiliarySampleBuffer:0];
  [(FigDisparityGenerator *)self->_disparityProcessor setOutputShiftmap:0];
  [(FigDisparityGenerator *)self->_disparityProcessor setDisparityInferenceProcessorDelegate:0];
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  disparityProcessor = self->_disparityProcessor;
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  -[FigDisparityGenerator setNormalizedReferenceCropRect:](disparityProcessor, "setNormalizedReferenceCropRect:", v3, v4, v6, v7);
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  double v6 = [(BWStillImageProcessorControllerRequest *)[BWStereoDisparityRequest alloc] initWithInput:a3 delegate:a4];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input];
  if (-[FigCaptureCameraParameters disparityVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "disparityVersion") < 5|| (objc_msgSend((id)-[BWStillImageProcessorControllerInput expectedPortTypes](v3, "expectedPortTypes"), "isEqualToSet:", self->_currentInferenceEnginePortTypes) & 1) != 0)
  {
    return 0;
  }
  uint64_t v5 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)v3 captureSettings] masterPortType];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)v3 captureSettings] portTypes];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if (![v11 isEqualToString:v5]) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    int v11 = 0;
  }
  int v4 = -[BWStereoDisparityProcessorController _loadFSDNetForReferencePortType:auxiliaryPortType:]((id *)&self->super.super.isa, v5, (uint64_t)v11);
  if (v4) {
    FigDebugAssert3();
  }
  return v4;
}

- (int)process
{
  v107[2] = *MEMORY[0x1E4F143B8];
  CMAttachmentBearerRef cf = 0;
  CMAttachmentBearerRef target = 0;
  CFTypeRef v104 = 0;
  double v3 = [(BWStillImageProcessorController *)self configuration];
  int v4 = [(BWStillImageProcessorController *)self currentRequest];
  v102 = [(BWStillImageProcessorControllerRequest *)v4 input];
  uint64_t v5 = (__CVBuffer *)[(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v4 delegate] processorController:self newOutputPixelBufferForProcessorInput:v102 type:2001];
  if (!v5)
  {
    FigDebugAssert3();
    uint64_t v22 = 4294954510;
    goto LABEL_72;
  }
  v101 = v4;
  if ([(BWStillImageProcessorControllerConfiguration *)v3 stillImageDepthDataType] == 2)
  {
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf], 0x1EFA74380);
    uint64_t v7 = BWSampleBufferGetAttachedMedia((const void *)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf], 0x1EFA74380);
  }
  else
  {
    if ([(BWStillImageProcessorControllerConfiguration *)v3 stillImageDepthDataType] != 8)goto LABEL_71; {
    v94 = v5;
    }
    *(void *)v99 = v3;
    CFStringRef v8 = (const __CFString *)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf];
    uint64_t v9 = (const void *)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf];
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53070];
    kedouble y = v8;
    int v11 = (void *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v12 = *MEMORY[0x1E4F54128];
    uint64_t v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    uint64_t v14 = *MEMORY[0x1E4F54370];
    uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F54370]];
    uint64_t v16 = *MEMORY[0x1E4F54378];
    [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F54378]];
    uint64_t v17 = *MEMORY[0x1E4F54358];
    uint64_t v18 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F54358]];
    uint64_t v19 = *MEMORY[0x1E4F54360];
    [v11 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F54360]];
    uint64_t v20 = (void *)CMGetAttachment(v9, v10, 0);
    uint64_t v21 = [v20 objectForKeyedSubscript:v12];
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", v14), v16);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", v17), v19);
    uint64_t v22 = 4294954516;
    if (!v13)
    {
      uint64_t v5 = v94;
      goto LABEL_69;
    }
    AttachedMedia = (void *)key;
    uint64_t v5 = v94;
    double v3 = *(BWStillImageProcessorControllerConfiguration **)v99;
    int v4 = v101;
    if (!v21) {
      goto LABEL_72;
    }
    v107[0] = v13;
    v107[1] = v21;
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v107, 2)), "isEqualToSet:", -[BWStillImageProcessorControllerInput expectedPortTypes](v102, "expectedPortTypes")))goto LABEL_72; {
    uint64_t v7 = (uint64_t)v9;
    }
  }
  uint64_t v22 = 4294954516;
  if (!AttachedMedia || !v7) {
    goto LABEL_72;
  }
  [(FigDisparityGenerator *)self->_disparityProcessor setShouldComputeDisparityWhenCalibrationFails:[(BWStillImageProcessorControllerConfiguration *)v3 shouldComputeDisparityWhenCalibrationFails]];
  [(FigDisparityGenerator *)self->_disparityProcessor setEqualizeTeleGainToMatchReference:[(BWStillImageProcessorControllerInput *)v102 equalizeTeleGainToMatchReference]];
  [(FigDisparityGenerator *)self->_disparityProcessor setReferenceSampleBuffer:AttachedMedia];
  [(FigDisparityGenerator *)self->_disparityProcessor setAuxiliarySampleBuffer:v7];
  [(FigDisparityGenerator *)self->_disparityProcessor setOutputShiftmap:v5];
  [(FigDisparityGenerator *)self->_disparityProcessor setDisparityInferenceProcessorDelegate:self];
  CFStringRef keya = (const __CFString *)*MEMORY[0x1E4F53070];
  CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  *(_OWORD *)v103 = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)&v103[16] = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  if (!CGRectIfPresent)
  {
    double v35 = 1.0;
    -[FigDisparityGenerator setNormalizedReferenceCropRect:](self->_disparityProcessor, "setNormalizedReferenceCropRect:", 0.0, 0.0, 1.0, 1.0);
    char v40 = 0;
    goto LABEL_20;
  }
  double v23 = (double)[(FigCaptureStillImageSettings *)[(BWStillImageSettings *)[(BWStillImageProcessorControllerInput *)v102 stillImageSettings] requestedSettings] outputWidth];
  double v24 = v23
      / (double)[(FigCaptureStillImageSettings *)[(BWStillImageSettings *)[(BWStillImageProcessorControllerInput *)v102 stillImageSettings] requestedSettings] outputHeight];
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
  int64_t v26 = psn_pixelBufferDimensions(ImageBuffer);
  if ([(BWStillImageProcessorControllerConfiguration *)v3 zoomingDisparityAllowed])
  {
    v108.origin.double x = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia((int)v26, v26 >> 32, *(CGFloat *)v103, *(CGFloat *)&v103[8], *(CGFloat *)&v103[16], *(CGFloat *)&v103[24], v24, 1.0);
    double x = v108.origin.x;
    double y = v108.origin.y;
    double width = v108.size.width;
    double height = v108.size.height;
    if (!CGRectIsNull(v108))
    {
      FigCaptureMetadataUtilitiesNormalizeCropRect(x, y, width, height);
      *(CGFloat *)v103 = v31;
      *(CGFloat *)&v103[8] = v32;
      *(CGFloat *)&v103[16] = v33;
      *(double *)&v103[24] = v34;
      double v35 = 1.0 / v34;
      if (1.0 / v34 <= 2.5)
      {
        char v40 = 0;
      }
      else
      {
        float v36 = v35 / 2.5;
        *(void *)v103 = FigCaptureMetadataUtilitiesScaleRect(v31, v32, v33, v34, v36);
        *(void *)&v103[8] = v37;
        *(void *)&v103[16] = v38;
        *(void *)&v103[24] = v39;
        char v40 = 1;
        double v35 = 2.5;
      }
      goto LABEL_19;
    }
    FigDebugAssert3();
LABEL_71:
    uint64_t v22 = 4294954516;
    goto LABEL_72;
  }
  int v41 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v26, v24);
  double MidX = CGRectGetMidX(*(CGRect *)v103);
  CGRectGetMidY(*(CGRect *)v103);
  double v43 = FigCaptureMetadataUtilitiesDenormalizedRectWithinBoundingDimensionsCenteredOnPoint(v26, v41, MidX);
  FigCaptureMetadataUtilitiesNormalizeCropRect(v43, v44, v45, v46);
  *(void *)v103 = v47;
  *(void *)&v103[8] = v48;
  *(void *)&v103[16] = v49;
  *(void *)&v103[24] = v50;
  char v40 = 1;
  double v35 = 1.0;
LABEL_19:
  -[FigDisparityGenerator setNormalizedReferenceCropRect:](self->_disparityProcessor, "setNormalizedReferenceCropRect:");
LABEL_20:
  unsigned int v51 = [(FigDisparityGenerator *)self->_disparityProcessor process];
  unsigned int v52 = v51;
  if (dword_1EB4C5590)
  {
    unsigned int v96 = v51;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    unsigned int v52 = v96;
  }
  unsigned int v54 = v52 & 0xFFFFFFFE;
  if (v52
    && (v54 != 2
     || ![(BWStillImageProcessorControllerConfiguration *)v3 shouldComputeDisparityWhenCalibrationFails]))
  {
    CFTypeRef v57 = (CFTypeRef)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf];
    if (v57) {
      CFTypeRef v57 = CFRetain(v57);
    }
    CMAttachmentBearerRef target = v57;
    CFTypeRef v58 = (CFTypeRef)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf];
    if (v58) {
      CFTypeRef v58 = CFRetain(v58);
    }
    CMAttachmentBearerRef cf = v58;
    goto LABEL_51;
  }
  objc_msgSend((id)-[FigDisparityGenerator metalContext](self->_disparityProcessor, "metalContext", v90, v91), "waitForSchedule");
  v55 = (void *)[(FigDisparityGenerator *)self->_disparityProcessor shiftMapMetadata];
  v100 = v55;
  if (v55) {
    id v56 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v55, (CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf], 1, v54 == 2);
  }
  else {
    id v56 = 0;
  }
  uint64_t CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf], (CMSampleBufferRef *)&target);
  if (CopyIncludingMetadata
    || (uint64_t CopyIncludingMetadata = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v5, (CFTypeRef *)&self->_disparityFormatDescription, (CMSampleBufferRef *)&v104), CopyIncludingMetadata))
  {
    uint64_t v22 = CopyIncludingMetadata;
LABEL_69:
    int v4 = v101;
    goto LABEL_72;
  }
  id v60 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(v104);
  if (CGRectIfPresent)
  {
    v61 = v60;
    unsigned int v62 = v52;
    if (v56) {
      FigCaptureMetadataUtilitiesUpdateDepthDataMetadataForStillImageCropAndScale(v56, *(double *)v103, *(double *)&v103[8], *(double *)&v103[16], *(double *)&v103[24], v35);
    }
    uint64_t v63 = [(BWStillImageProcessorControllerConfiguration *)v3 inputDimensions];
    FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)v103, *(double *)&v103[8], *(double *)&v103[16], *(double *)&v103[24]);
    CGFloat v65 = v64;
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    uint64_t v72 = [(BWStillImageProcessorControllerConfiguration *)v3 disparityOutputDimensions];
    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v61, v63, v72, v65, v67, v69, v71, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    unsigned int v52 = v62;
    if ((v40 & 1) == 0) {
      FigCaptureMetadataUtilitiesPreventFurtherCropping(v61, v73);
    }
  }
  BWSampleBufferSetAttachedMedia(target, @"Depth", (uint64_t)v104);
  if ([(FigDisparityGenerator *)self->_disparityProcessor disparityDiagnosticMetadata]) {
    objc_msgSend((id)CMGetAttachment(target, keya, 0), "setObject:forKeyedSubscript:", -[FigDisparityGenerator disparityDiagnosticMetadata](self->_disparityProcessor, "disparityDiagnosticMetadata"), @"Disparity");
  }
  if (v56)
  {
    if (([(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)v102 captureSettings] captureFlags] & 0x4000000000) != 0&& v54 != 2)
    {
      CMSampleBufferRef sbuf = (CMSampleBufferRef)[MEMORY[0x1E4F1CA60] dictionary];
      id v97 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v100, (CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf], 1, 0);
      id v74 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v100, (CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf], 0, 0);
      v75 = (void *)CMGetAttachment((CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf], keya, 0);
      v76 = v5;
      CFTypeRef v77 = CMGetAttachment((CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf], keya, 0);
      uint64_t v78 = *MEMORY[0x1E4F530C0];
      objc_msgSend(v97, "setObject:forKeyedSubscript:", objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x1E4F530C0]), *MEMORY[0x1E4F530C0]);
      v79 = (void *)v77;
      uint64_t v5 = v76;
      objc_msgSend(v74, "setObject:forKeyedSubscript:", objc_msgSend(v79, "objectForKeyedSubscript:", v78), v78);
      [(opaqueCMSampleBuffer *)sbuf setObject:v97 forKeyedSubscript:@"Primary"];
      [(opaqueCMSampleBuffer *)sbuf setObject:v74 forKeyedSubscript:@"Secondary"];
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55B90], sbuf, 1u);
    }
    CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55B40], v56, 1u);
  }
  int v4 = v101;
  if (![(BWStillImageProcessorControllerInput *)v102 emitAuxiliaryInput]) {
    goto LABEL_51;
  }
  uint64_t v80 = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf], (CMSampleBufferRef *)&cf);
  if (!v80)
  {
    id v81 = sdpc_depthMetadataAttachmentDictionaryFromStereoDisparityMetadata(v100, (CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf], 0, v54 == 2);
    if (v81) {
      CMSetAttachment(cf, (CFStringRef)*MEMORY[0x1E4F55B40], v81, 1u);
    }
LABEL_51:
    v82 = +[BWAggdDataReporter sharedInstance];
    if (v52 > 3) {
      uint64_t v83 = 4294949886;
    }
    else {
      uint64_t v83 = dword_1A5F0C720[v52];
    }
    [(BWAggdDataReporter *)v82 reportSDOFSampleBufferProcessorProcessingStatus:v83];
LABEL_55:
    uint64_t v22 = 0;
    goto LABEL_56;
  }
  uint64_t v22 = v80;
LABEL_72:
  CMAttachmentBearerRef v87 = target;
  if (!target)
  {
    CMAttachmentBearerRef v87 = (CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)v102 referenceSbuf];
    if (v87) {
      CMAttachmentBearerRef v87 = CFRetain(v87);
    }
  }
  CMAttachmentBearerRef target = v87;
  CMAttachmentBearerRef v88 = cf;
  if (!cf)
  {
    v89 = (const void *)[(BWStillImageProcessorControllerInput *)v102 auxiliarySbuf];
    if (v89) {
      CMAttachmentBearerRef v88 = CFRetain(v89);
    }
    else {
      CMAttachmentBearerRef v88 = 0;
    }
    CMAttachmentBearerRef v87 = target;
  }
  CMAttachmentBearerRef cf = v88;
  if (v87 && (v88 || ([(BWStillImageProcessorControllerInput *)v102 emitAuxiliaryInput] & 1) == 0)) {
    goto LABEL_55;
  }
LABEL_56:
  CMSetAttachment(target, @"NonProcessedReferenceFrame", MEMORY[0x1E4F1CC38], 1u);
  v84 = [(BWStillImageProcessorControllerRequest *)v4 delegate];
  [(BWStillImageProcessorControllerDelegate *)v84 processorController:self didFinishProcessingSampleBuffer:target type:20 processorInput:v102 err:v22];
  if ([(BWStillImageProcessorControllerInput *)v102 emitAuxiliaryInput])
  {
    CMSetAttachment(cf, @"NonProcessedReferenceFrame", MEMORY[0x1E4F1CC38], 1u);
    v85 = [(BWStillImageProcessorControllerRequest *)v4 delegate];
    [(BWStillImageProcessorControllerDelegate *)v85 processorController:self didFinishProcessingSampleBuffer:cf type:20 processorInput:v102 err:v22];
  }
  if (target) {
    CFRelease(target);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v104) {
    CFRelease(v104);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v22;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return [(NSDictionary *)self->_videoFormatByAttachedMediaKey objectForKeyedSubscript:a3];
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return [(NSDictionary *)self->_videoFormatByAttachedMediaKey objectForKeyedSubscript:a3];
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

@end