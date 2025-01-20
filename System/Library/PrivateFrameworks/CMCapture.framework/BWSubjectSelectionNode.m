@interface BWSubjectSelectionNode
+ (void)initialize;
- (BWSubjectSelectionNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 deviceOrientationCorrectionEnabled:(BOOL)a7 portTypes:(id)a8 cameraHasDistortionCoefficients:(BOOL)a9 cameraHasCalibrationValidMaxRadius:(BOOL)a10 centerStageFramingMode:(int)a11 gazeSelectionEnabled:(BOOL)a12;
- (NSDictionary)videoCaptureInputsByPortType;
- (NSDictionary)videoCaptureOutputsByPortType;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_initSubjectSelectionSession;
- (void)_addInputAndOutputWithOutputDrivingInputIndex:(uint64_t)a3 mapToPortType:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didChangeCenterStageFramingMode:(int)a3;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWSubjectSelectionNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWSubjectSelectionNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 deviceOrientationCorrectionEnabled:(BOOL)a7 portTypes:(id)a8 cameraHasDistortionCoefficients:(BOOL)a9 cameraHasCalibrationValidMaxRadius:(BOOL)a10 centerStageFramingMode:(int)a11 gazeSelectionEnabled:(BOOL)a12
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)BWSubjectSelectionNode;
  v18 = [(BWNode *)&v29 init];
  if (v18)
  {
    v18->_videoCaptureInputsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18->_videoCaptureOutputsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18->_portTypes = (NSArray *)a8;
    v18->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    v18->_cameraInfoByPortType = (NSDictionary *)a4;
    if ((a5 - 3) < 0xFFFFFFFE) {
      return 0;
    }
    v18->_horizontalSensorBinningFactor = a5;
    if ((a6 - 3) < 0xFFFFFFFE)
    {
      return 0;
    }
    else
    {
      v18->_verticalSensorBinningFactor = a6;
      v18->_deviceOrientationCorrectionEnabled = a7;
      v18->_deviceOrientationMonitor = objc_alloc_init(BWDeviceOrientationMonitor);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v19 = [a8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = 0;
        uint64_t v22 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(a8);
            }
            -[BWSubjectSelectionNode _addInputAndOutputWithOutputDrivingInputIndex:mapToPortType:]((id *)&v18->super.super.isa, v21 + i, *(void *)(*((void *)&v25 + 1) + 8 * i));
          }
          uint64_t v20 = [a8 countByEnumeratingWithState:&v25 objects:v30 count:16];
          uint64_t v21 = (v21 + i);
        }
        while (v20);
      }
      v18->_minLuxLevelNeeded = 5;
      v18->_endOfDataInputsCount = 0;
      v18->_centerStageFramingMode = a11;
      v18->_cameraHasDistortionCoefficients = a9;
      v18->_cameraHasCalibrationValidMaxRadius = a10;
      v18->_gazeSelectionEnabled = a12;
    }
  }
  return v18;
}

- (void)_addInputAndOutputWithOutputDrivingInputIndex:(uint64_t)a3 mapToPortType:
{
  if (a1)
  {
    v6 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:a1];
    [(BWNodeInput *)v6 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v6 setPassthroughMode:1];
    [a1 addInput:v6];
    [a1[12] setObject:v6 forKeyedSubscript:a3];

    v7 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:a1];
    [(BWNodeOutput *)v7 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v7 setPassthroughMode:1];
    [(BWNodeOutput *)v7 setIndexOfInputWhichDrivesThisOutput:a2];
    [a1 addOutput:v7];
    [a1[13] setObject:v7 forKeyedSubscript:a3];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSubjectSelectionNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"SubjectSelection";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWSubjectSelectionNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  -[BWSubjectSelectionNode _initSubjectSelectionSession]((uint64_t)self);
  [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor start];
}

- (uint64_t)_initSubjectSelectionSession
{
  if (result)
  {
    uint64_t v1 = result;

    v2 = (void *)[objc_alloc(MEMORY[0x1E4F58FB0]) initWithCurrentProcessIsCameraCaptureDaemon:FigCaptureCurrentProcessIsCameracaptured() != 0];
    *(void *)(v1 + 144) = v2;
    [v2 setSingleSubjectSelection:*(_DWORD *)(v1 + 184) != 0];
    uint64_t v3 = *(unsigned __int8 *)(v1 + 188);
    v4 = *(void **)(v1 + 144);
    return [v4 setEnableGazeSelection:v3];
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(BWNode *)self outputs];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setFormat:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  v5 = (void *)[(NSMutableDictionary *)self->_videoCaptureOutputsByPortType objectForKeyedSubscript:BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)a5, self->_videoCaptureInputsByPortType)];
  [v5 makeConfiguredFormatLive];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "containsObject:", a3))atomic_fetch_add_explicit(&self->_endOfDataInputsCount, 1u, memory_order_relaxed); {
  os_unfair_lock_unlock(p_bufferServicingLock);
  }
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoCaptureOutputsByPortType, "objectForKeyedSubscript:", BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)a3, self->_videoCaptureInputsByPortType)), "markEndOfLiveOutput");
  uint64_t endOfDataInputsCount = self->_endOfDataInputsCount;
  if (objc_msgSend((id)-[NSMutableDictionary allValues](self->_videoCaptureInputsByPortType, "allValues"), "count") == endOfDataInputsCount)
  {
    [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor stop];
    self->_uint64_t endOfDataInputsCount = 0;
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_videoCaptureOutputsByPortType objectForKeyedSubscript:BWUtilitiesGetPortTypeForInputFromInputByPortTypes((uint64_t)a4, self->_videoCaptureInputsByPortType)];
  CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E4F530C0]);
  memset(&v47, 0, sizeof(v47));
  CMTimeMakeFromDictionary(&v47, Value);
  CFTypeRef v12 = CMGetAttachment(a3, @"OriginalCameraIntrinsicMatrix", 0);
  if (!v12)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
LABEL_24:
    FigDebugAssert3();
    goto LABEL_21;
  }
  long long v13 = (void *)v12;
  CFDictionaryRef v14 = (const __CFDictionary *)CMGetAttachment(a3, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0);
  if (!v14)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
    goto LABEL_24;
  }
  CFDictionaryRef v15 = v14;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  cameraInfoByPortType = self->_cameraInfoByPortType;
  int horizontalSensorBinningFactor = self->_horizontalSensorBinningFactor;
  int verticalSensorBinningFactor = self->_verticalSensorBinningFactor;
  char cameraHasDistortionCoefficients = self->_cameraHasDistortionCoefficients;
  char cameraHasCalibrationValidMaxRadius = self->_cameraHasCalibrationValidMaxRadius;
  float64x2_t v48 = *(float64x2_t *)&v47.value;
  CMTimeEpoch epoch = v47.epoch;
  id v24 = (id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadataIncludeMaxRadius(v10, (long long *)&v48, cameraInfoByPortType, horizontalSensorBinningFactor, verticalSensorBinningFactor, v13, v15, 0, 0, cameraHasDistortionCoefficients, cameraHasCalibrationValidMaxRadius);
  if (!v24)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = 0;
LABEL_27:
    FigDebugAssert3();
    goto LABEL_21;
  }
  id v25 = v24;
  if (objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue") >= self->_minLuxLevelNeeded)uint64_t v26 = -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC8]); {
  else
  }
    uint64_t v26 = 0;
  int v46 = 0;
  float32x2_t v45 = 0;
  float v27 = (float)Width / (float)Height;
  int v28 = 0;
  if ((objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53FA0]), "unsignedIntValue") & 1) == 0)
  {
    bzero(&v48, 0x14A0uLL);
    int v44 = 0;
    if (FigMotionGetMotionDataFromISP(v10, &v48, 0, 110, &v44, &v45, 0, 0, 0)) {
      BOOL v29 = 1;
    }
    else {
      BOOL v29 = v44 <= 0;
    }
    int v28 = !v29;
  }
  uint64_t v30 = FigCaptureSensorIDFromSampleBufferMetadata(v10, self->_cameraInfoByPortType);
  id v31 = objc_alloc(MEMORY[0x1E4F58F98]);
  BOOL v32 = self->_cameraHasDistortionCoefficients;
  BOOL v33 = self->_cameraHasCalibrationValidMaxRadius;
  float64x2_t v48 = *(float64x2_t *)&v47.value;
  CMTimeEpoch epoch = v47.epoch;
  BYTE1(v42) = v33;
  LOBYTE(v42) = v32;
  id v34 = (id)[v31 initWithDetectedObjectsInfo:v26 calibrationData:v25 timestamp:&v48 aspectRatio:v30 sensorID:0 filteredFaceIDs:0 filteredBodyIDs:COERCE_DOUBLE(__PAIR64__(HIDWORD(v47.value) calibrationDistortionCoefficientsSupported:LODWORD(v27))) calibrationValidMaxRadiusSupported:v42];
  if (v28)
  {
    LODWORD(v36) = v45.i32[1];
    LODWORD(v35) = v45.i32[0];
    LODWORD(v37) = v46;
    [v34 setGravityX:v35 y:v36 z:v37];
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  subjectSelectionSession = self->_subjectSelectionSession;
  float64x2_t v48 = *(float64x2_t *)&v47.value;
  CMTimeEpoch epoch = v47.epoch;
  int v41 = [(SubjectSelectionSession *)subjectSelectionSession processPixelBuffer:ImageBuffer timestamp:&v48 detectedObjects:v26 usedFaceIDs:v38 usedBodyIDs:v39];
  if (v41)
  {
    uint64_t v43 = v4;
    LODWORD(v42) = v41;
    goto LABEL_27;
  }
  if ([v38 count]) {
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52FC8], v38, 1u);
  }
  if ([v39 count]) {
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52FC0], v39, 1u);
  }
LABEL_21:
  objc_msgSend(v9, "emitSampleBuffer:", a3, v42, v43);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (NSDictionary)videoCaptureInputsByPortType
{
  return &self->_videoCaptureInputsByPortType->super;
}

- (NSDictionary)videoCaptureOutputsByPortType
{
  return &self->_videoCaptureOutputsByPortType->super;
}

- (void)didChangeCenterStageFramingMode:(int)a3
{
  self->_centerStageFramingMode = a3;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(SubjectSelectionSession *)self->_subjectSelectionSession setSingleSubjectSelection:self->_centerStageFramingMode != 0];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

@end