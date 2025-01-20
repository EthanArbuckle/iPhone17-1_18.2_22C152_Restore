@interface BWStillImageCameraCalibrationDataNode
+ (void)initialize;
- (BOOL)propagatesDetectedObjects;
- (BWStillImageCameraCalibrationDataNode)initWithSensorConfigurationsByPortType:(id)a3;
- (id)baseZoomFactorsByPortType;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_clearCaptureRequestState;
- (uint64_t)_computeCameraCalibrationDataBetweenReferenceSampleBuffer:(opaqueCMSampleBuffer *)a3 auxiliarySampleBuffer:;
- (uint64_t)_loadAndConfigureCalibrationBundle;
- (uint64_t)_propagateDetectedObjects;
- (uint64_t)_receivedExpectedInputsForCaptureRequest;
- (uint64_t)_resolveProcessingMode;
- (uint64_t)processorOptions;
- (void)_sensorConfigurationWithPortraitTuningParameters;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setBaseZoomFactorsByPortType:(id)a3;
- (void)setPropagatesDetectedObjects:(BOOL)a3;
@end

@implementation BWStillImageCameraCalibrationDataNode

+ (void)initialize
{
}

- (BWStillImageCameraCalibrationDataNode)initWithSensorConfigurationsByPortType:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageCameraCalibrationDataNode;
  v4 = [(BWNode *)&v8 init];
  if (v4)
  {
    v4->_sensorConfigurationsByPortType = (NSDictionary *)a3;
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeInput *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v5 setPassthroughMode:1];
    -[BWNodeInput setRetainedBufferCount:](v5, "setRetainedBufferCount:", [a3 count] - 1);
    [(BWNode *)v4 addInput:v5];

    v6 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeOutput *)v6 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v6 setPassthroughMode:1];
    [(BWNode *)v4 addOutput:v6];

    v4->_inputSbufsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)dealloc
{
  if (self) {
    objc_msgSend((id)-[FigCalibration metalContext](self->_calibrationProcessor, "metalContext"), "waitForIdle");
  }

  -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCameraCalibrationDataNode;
  [(BWNode *)&v3 dealloc];
}

- (uint64_t)_clearCaptureRequestState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;

    *(void *)(v1 + 128) = 0;
    *(void *)(v1 + 120) = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v2 = objc_msgSend(*(id *)(v1 + 144), "allValues", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(v1 + 16) emitSampleBuffer:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
    result = [*(id *)(v1 + 144) removeAllObjects];
    *(_DWORD *)(v1 + 136) = 0;
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCameraCalibrationDataNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (-[BWStillImageCameraCalibrationDataNode _loadAndConfigureCalibrationBundle]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureCalibrationBundle
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v16 = 0;
    uint64_t v2 = -[BWStillImageCameraCalibrationDataNode processorOptions](result);
    if (v2
      && (uint64_t v3 = v2,
          uint64_t v4 = [NSString stringWithFormat:@"%@/%@V%d.bundle", @"/System/Library/VideoProcessors", @"Calibration", 1], (v5 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", v4)) != 0))
    {
      uint64_t v6 = v5;
      if (![v5 loadAndReturnError:&v16]) {
        return 4294954510;
      }
      id v7 = objc_alloc_init((Class)[v6 principalClass]);
      *(void *)(v1 + 152) = v7;
      if (v7)
      {
        [v7 setOptions:v3];
        uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
        uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
        long long v10 = *(void **)(v1 + 152);
        v12[0] = v8;
        v12[1] = v9;
        int v13 = 1067030938;
        uint64_t v14 = 0x1800000020;
        int v15 = 0;
        [v10 setCalibrationConfig:v12];
        int v11 = [*(id *)(v1 + 152) prepareToProcess:0];
        result = 0;
        if (!v11) {
          return result;
        }
        return FigSignalErrorAt();
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"CameraCalibrationData";
}

- (void)setPropagatesDetectedObjects:(BOOL)a3
{
  self->_propagatesDetectedObjects = a3;
}

- (BOOL)propagatesDetectedObjects
{
  return self->_propagatesDetectedObjects;
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{
  self->_baseZoomFactorsByPortType = (NSDictionary *)a3;
}

- (id)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_25;
  }
  uint64_t v6 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = (void *)CMGetAttachment(a3, @"StillImageSettings", 0);
  if (!v8) {
    goto LABEL_25;
  }
  if (![v8 cameraCalibrationDataDeliveryEnabled]) {
    goto LABEL_25;
  }
  CFTypeRef v9 = CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  if (!v9) {
    goto LABEL_25;
  }
  long long v10 = (void *)v9;
  captureSettings = self->_captureSettings;
  if (!captureSettings
    || (uint64_t v12 = [(BWStillImageCaptureSettings *)captureSettings settingsID],
        v12 != [v10 settingsID]))
  {
    -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
    self->_captureSettings = (BWStillImageCaptureSettings *)v10;
    -[BWStillImageCameraCalibrationDataNode _resolveProcessingMode]((uint64_t)self);
  }
  if ([(NSMutableDictionary *)self->_inputSbufsByPortType objectForKeyedSubscript:v7]) {
    goto LABEL_25;
  }
  [(NSMutableDictionary *)self->_inputSbufsByPortType setObject:a3 forKeyedSubscript:v7];
  if (-[BWStillImageCameraCalibrationDataNode _receivedExpectedInputsForCaptureRequest]((uint64_t)self))
  {
    int processingMode = self->_processingMode;
    uint64_t v14 = (void *)MEMORY[0x1E4F52DD8];
    if ((processingMode | 2) == 3)
    {
      int v15 = (opaqueCMSampleBuffer *)[(NSMutableDictionary *)self->_inputSbufsByPortType objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]];
      -[BWStillImageCameraCalibrationDataNode _computeCameraCalibrationDataBetweenReferenceSampleBuffer:auxiliarySampleBuffer:]((uint64_t)self, v15, (opaqueCMSampleBuffer *)[(NSMutableDictionary *)self->_inputSbufsByPortType objectForKeyedSubscript:*MEMORY[0x1E4F52DE8]]);
      int processingMode = self->_processingMode;
    }
    if ((processingMode & 0xFFFFFFFE) == 2) {
      -[BWStillImageCameraCalibrationDataNode _computeCameraCalibrationDataBetweenReferenceSampleBuffer:auxiliarySampleBuffer:]((uint64_t)self, (opaqueCMSampleBuffer *)[(NSMutableDictionary *)self->_inputSbufsByPortType objectForKeyedSubscript:*MEMORY[0x1E4F52DF0]], (opaqueCMSampleBuffer *)[(NSMutableDictionary *)self->_inputSbufsByPortType objectForKeyedSubscript:*v14]);
    }
    if (self->_propagatesDetectedObjects) {
      -[BWStillImageCameraCalibrationDataNode _propagateDetectedObjects]((uint64_t)self);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v16 = (void *)[(NSMutableDictionary *)self->_inputSbufsByPortType allValues];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [(BWNodeOutput *)self->super._output emitSampleBuffer:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }
    [(NSMutableDictionary *)self->_inputSbufsByPortType removeAllObjects];
LABEL_25:
    int v21 = 1;
    goto LABEL_27;
  }
  int v21 = 0;
LABEL_27:
  if (self->_processingMode)
  {
    if (!v21) {
      return;
    }
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, a4);
    if (!v21) {
      return;
    }
  }
  -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
}

- (uint64_t)_resolveProcessingMode
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(v1 + 128), "captureStreamSettings", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "portType"));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
    *(void *)(v1 + 120) = v2;
    int v8 = [v2 containsObject:*MEMORY[0x1E4F52DE8]];
    uint64_t v9 = *MEMORY[0x1E4F52DD8];
    if (v8) {
      int v10 = [v2 containsObject:*MEMORY[0x1E4F52DD8]];
    }
    else {
      int v10 = 0;
    }
    result = [v2 containsObject:v9];
    if (result)
    {
      result = [v2 containsObject:*MEMORY[0x1E4F52DF0]];
      if ((result & v10) != 0) {
        int v11 = 3;
      }
      else {
        int v11 = 1;
      }
      if (result) {
        int v12 = 2;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
      int v11 = 1;
    }
    if (!v10) {
      int v11 = v12;
    }
    *(_DWORD *)(v1 + 136) = v11;
  }
  return result;
}

- (uint64_t)_receivedExpectedInputsForCaptureRequest
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(*(id *)(result + 144), "allKeys"));
    uint64_t v3 = *(void *)(v1 + 120);
    return [v2 isEqualToSet:v3];
  }
  return result;
}

- (uint64_t)_computeCameraCalibrationDataBetweenReferenceSampleBuffer:(opaqueCMSampleBuffer *)a3 auxiliarySampleBuffer:
{
  if (result)
  {
    uint64_t v5 = result;
    [*(id *)(result + 152) setReferenceSampleBuffer:a2];
    [*(id *)(v5 + 152) setAuxiliarySampleBuffer:a3];
    unsigned int v6 = [*(id *)(v5 + 152) process];
    if (v6 <= 3 && v6 != 1)
    {
      int v8 = (void *)[*(id *)(v5 + 152) calibrationMetadata];
      if (v8)
      {
        uint64_t v9 = v8;
        int v10 = sicn_cameraCalibrationDataMetadataAttachmentDictionaryFromCalibrationMetadata(v8, a2, 1);
        CMSetAttachment(a2, @"CameraCalibrationDataMetadata", v10, 1u);
        int v11 = sicn_cameraCalibrationDataMetadataAttachmentDictionaryFromCalibrationMetadata(v9, a3, 0);
        CMSetAttachment(a3, @"CameraCalibrationDataMetadata", v11, 1u);
      }
    }
    [*(id *)(v5 + 152) setReferenceSampleBuffer:0];
    int v12 = *(void **)(v5 + 152);
    return [v12 setAuxiliarySampleBuffer:0];
  }
  return result;
}

- (uint64_t)_propagateDetectedObjects
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    id v27 = (id)[MEMORY[0x1E4F1CA48] array];
    long long v25 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)[*(id *)(v1 + 144) allValues];
    result = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = 0;
      long long v24 = 0;
      uint64_t v4 = *(void *)v33;
      CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v6 = *MEMORY[0x1E4F54128];
      uint64_t v7 = *MEMORY[0x1E4F542E0];
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v33 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(const void **)(*((void *)&v32 + 1) + 8 * v8);
          uint64_t v10 = objc_msgSend((id)CMGetAttachment(v9, v5, 0), "objectForKeyedSubscript:", v6);
          if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v9, v5, 0), "objectForKeyedSubscript:", v7), "BOOLValue"))
          {
            uint64_t v3 = (void *)[*(id *)(v1 + 112) objectForKeyedSubscript:v10];
            long long v24 = v9;
          }
          else
          {
            [v27 addObject:v9];
            objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(v1 + 112), "objectForKeyedSubscript:", v10));
          }
          ++v8;
        }
        while (v2 != v8);
        result = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
        uint64_t v2 = result;
      }
      while (result);
      int v11 = v24;
      if (v24)
      {
        if (v3)
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          result = [v27 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (result)
          {
            uint64_t v12 = result;
            int v13 = 0;
            uint64_t v14 = *(void *)v29;
            do
            {
              uint64_t v15 = 0;
              uint64_t v16 = v13;
              do
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v17 = *(const void **)(*((void *)&v28 + 1) + 8 * v15);
                objc_msgSend(v3, "floatValue", v24);
                float v19 = v18;
                objc_msgSend((id)objc_msgSend(v25, "objectAtIndexedSubscript:", v16 + v15), "floatValue");
                if (v19 >= v20)
                {
                  v36[0] = v3;
                  v36[1] = [v25 objectAtIndexedSubscript:v16 + v15];
                  int v21 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
                  long long v22 = v17;
                  long long v23 = v11;
                }
                else
                {
                  v37[0] = v3;
                  v37[1] = [v25 objectAtIndexedSubscript:v16 + v15];
                  int v21 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
                  long long v22 = v11;
                  long long v23 = v17;
                }
                BWProcessWiderAndNarrowerFOVBuffersForFacePropagation(v22, v23, v21);
                ++v15;
              }
              while (v12 != v15);
              result = [v27 countByEnumeratingWithState:&v28 objects:v38 count:16];
              uint64_t v12 = result;
              int v13 = v16 + v15;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
  output = self->super._output;
  [(BWNodeOutput *)output emitNodeError:a3];
}

- (uint64_t)processorOptions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [+[FigCaptureCameraParameters sharedInstance] stereoDisparityParameters];
    if (v2
      || (uint64_t v3 = -[BWStillImageCameraCalibrationDataNode _sensorConfigurationWithPortraitTuningParameters](v1)) != 0
      && (uint64_t v2 = (NSDictionary *)objc_msgSend((id)objc_msgSend(v3, "sensorIDDictionary"), "objectForKeyedSubscript:", @"DisparityParameters")) != 0)
    {
      uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      CFStringRef v5 = (void *)[*(id *)(v1 + 96) allValues];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "cameraInfo"), objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "portType"));
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
        }
        while (v7);
      }
      if ([v4 count])
      {
        uint64_t v10 = *MEMORY[0x1E4F53560];
        v15[0] = *MEMORY[0x1E4F535B0];
        v15[1] = v10;
        v16[0] = v2;
        v16[1] = v4;
        return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (void)_sensorConfigurationWithPortraitTuningParameters
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = +[FigCaptureCameraParameters sharedInstance];
  if ([(FigCaptureCameraParameters *)v2 stereoDisparityParameters]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 96), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_5:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if (-[FigCaptureCameraParameters disparityVersionForPortType:sensorIDString:](v2, "disparityVersionForPortType:sensorIDString:", [v8 portType], objc_msgSend(v8, "sensorIDString")))
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_5;
      }
      return 0;
    }
  }
}

@end