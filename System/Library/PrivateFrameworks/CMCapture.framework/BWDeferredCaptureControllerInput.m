@interface BWDeferredCaptureControllerInput
- (BOOL)skipInferences;
- (BWDeferredCaptureContainer)captureContainer;
- (BWDeferredCaptureControllerInput)initWithSettings:(id)a3 configuration:(id)a4 sourceNodePixelBufferAttributes:(id)a5;
- (BWDeferredPipelineParameters)pipelineParameters;
- (id)readyForProcessing;
- (int)compressionProfile;
- (void)_addDictionary:(id)a3 tag:(id)a4;
- (void)_addInference:(id)a3 inferenceAttachmentKey:(id)a4 portType:(id)a5;
- (void)_addInferenceBuffer:(__CVBuffer *)a3 metadata:(id)a4 inferenceAttachedMediaKey:(id)a5 portType:(id)a6;
- (void)_showDeferredCaptureTapToRadarPromptIfNecessaryForProcessingError:(uint64_t)a1;
- (void)addBuffer:(__CVBuffer *)a3 bufferType:(unint64_t)a4 captureFrameFlags:(unint64_t)a5 metadata:(id)a6 rawThumbnailsBuffer:(__CVBuffer *)a7 rawThumbnailsMetadata:(id)a8;
- (void)addDictionary:(id)a3 tag:(id)a4;
- (void)addPhotoDescriptor:(id)a3;
- (void)addSensorRawSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)canProcessEnhancedResolution:(BOOL)a3 skipInferences:(BOOL)a4;
- (void)dealloc;
- (void)depthDataGenerationFailed;
- (void)encounteredProcessingError:(int)a3;
- (void)proxyReadyWithFPNREnabled:(BOOL)a3;
@end

@implementation BWDeferredCaptureControllerInput

- (BWDeferredCaptureControllerInput)initWithSettings:(id)a3 configuration:(id)a4 sourceNodePixelBufferAttributes:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "masterPortType");
  v24.receiver = self;
  v24.super_class = (Class)BWDeferredCaptureControllerInput;
  v10 = [(BWStillImageProcessorControllerInput *)&v24 initWithSettings:a3 portType:v9];
  if (v10)
  {
    v10->_settings = (BWStillImageSettings *)a3;
    v10->_configuration = (BWDeferredCaptureControllerConfiguration *)a4;
    int v11 = 1;
    if (objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureType") != 12)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x80) != 0) {
        int v11 = 1;
      }
      else {
        int v11 = 2;
      }
    }
    v10->_compressionProfile = v11;
    int v23 = 0;
    v12 = -[BWDeferredCaptureContainerManager createCaptureContainerWithApplicationID:captureRequestIdentifier:err:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "createCaptureContainerWithApplicationID:captureRequestIdentifier:err:", objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "applicationID"), objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "captureRequestIdentifier"), &v23);
    v10->_captureContainer = v12;
    if (v12)
    {
      [+[BWDeferredCaptureContainerManager sharedInstance] addCaptureContainer:v10->_captureContainer];
      -[BWDeferredCaptureContainer commitCaptureSettings:settings:](v10->_captureContainer, "commitCaptureSettings:settings:", [a3 captureSettings], objc_msgSend(a3, "requestedSettings"));
      -[BWDeferredCaptureContainer commitDictionary:tag:](v10->_captureContainer, "commitDictionary:tag:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](v10->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v9), "cameraInfo"), objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagCameraInfoByPortTypePrefix, v9));
      if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v13 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "secondaryPortTypes");
        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v13);
              }
              -[BWDeferredCaptureContainer commitDictionary:tag:](v10->_captureContainer, "commitDictionary:tag:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](v10->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * i)), "cameraInfo"), objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagCameraInfoByPortTypePrefix, *(void *)(*((void *)&v19 + 1) + 8 * i)));
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
          }
          while (v15);
        }
      }
      [(BWDeferredCaptureContainer *)v10->_captureContainer commitDictionary:a5 tag:BWDeferredIntermediateTagSourceNodePixelBufferAttributes];
    }
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredCaptureControllerInput;
  [(BWStillImageProcessorControllerInput *)&v3 dealloc];
}

- (BWDeferredPipelineParameters)pipelineParameters
{
  return [(BWDeferredContainer *)self->_captureContainer pipelineParameters];
}

- (void)addPhotoDescriptor:(id)a3
{
  [(BWDeferredCaptureContainer *)self->_captureContainer commitPhotoDescriptor:a3];
  v4 = [(BWStillImageProcessorControllerInput *)self delegate];
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v4 inputReceivedIntermediate:self];
}

- (void)addBuffer:(__CVBuffer *)a3 bufferType:(unint64_t)a4 captureFrameFlags:(unint64_t)a5 metadata:(id)a6 rawThumbnailsBuffer:(__CVBuffer *)a7 rawThumbnailsMetadata:(id)a8
{
  uint64_t v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  if (a6)
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (a7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = 0;
    if (a8) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = 0;
  if (!a7) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  if (!a8) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
LABEL_8:
  uint64_t v16 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] portType];
  if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 4) != 0&& objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1)
  {
    [(BWDeferredPipelineParameters *)[(BWDeferredCaptureControllerInput *)self pipelineParameters] setQuadraProcessingSupportEnabled:1];
  }
  uint64_t v17 = [(BWDeferredCaptureContainer *)self->_captureContainer commitBuffer:a3 tag:v25 bufferType:a4 captureFrameFlags:a5 compressionProfile:self->_compressionProfile metadataTag:v13 rawThumbnailsBufferTag:v14 rawThumbnailsMetadataTag:v15 mainRawThumbnailBufferTag:0 mainRawThumbnailMetadataTag:0 sifrRawThumbnailBufferTag:0 sifrRawThumbnailMetadataTag:0 portType:v16];
  if (v17)
  {
    uint64_t v22 = v17;
  }
  else if (a6 {
         && (uint64_t v18 = [(BWDeferredCaptureContainer *)self->_captureContainer commitMetadata:a6 tag:v13 bufferTag:v25], v18))
  }
  {
    uint64_t v22 = v18;
  }
  else if (a7 {
         && (uint64_t v19 = [(BWDeferredCaptureContainer *)self->_captureContainer commitBuffer:a7 tag:v14 bufferType:37 captureFrameFlags:0 compressionProfile:self->_compressionProfile metadataTag:v15 portType:v16], v19))
  }
  {
    uint64_t v22 = v19;
  }
  else
  {
    if (!a8
      || (uint64_t v20 = [(BWDeferredCaptureContainer *)self->_captureContainer commitMetadata:a8 tag:v15 bufferTag:v25], !v20))
    {
      long long v21 = [(BWStillImageProcessorControllerInput *)self delegate];
      [(BWStillImageProcessorControllerInputUpdatesDelegate *)v21 inputReceivedIntermediate:self];
      return;
    }
    uint64_t v22 = v20;
  }
  FigDebugAssert3();
  [(BWDeferredCaptureControllerInput *)self encounteredProcessingError:v22];
}

- (void)addSensorRawSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v4 = &v36;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  if (!a3) {
    goto LABEL_36;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v7 = ImageBuffer;
  if (!ImageBuffer) {
    goto LABEL_35;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  if (!FigCapturePixelFormatIsVersatileRaw(PixelFormatType))
  {
    v27 = 0;
    uint64_t v26 = 0;

    goto LABEL_30;
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
  v29 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v29
    || (long long v21 = BWStillImageCaptureFrameFlagsForSampleBuffer(a3),
        uint64_t v25 = (void *)[v29 objectForKeyedSubscript:*MEMORY[0x1E4F54128]],
        char v10 = objc_msgSend(v25, "isEqualToString:", -[BWStillImageProcessorControllerInput portType](self, "portType")),
        !(v10 & 1 | ([(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureFlags] >> 38) & 1)))
  {
LABEL_35:
    v4 = v37;
LABEL_36:
    v27 = 0;
    uint64_t v26 = 0;
    *((_DWORD *)v4 + 6) = -12780;

    goto LABEL_30;
  }
  buffer = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530F0], 0);
  v28 = (void *)CVBufferCopyAttachment(buffer, v9, 0);
  int v23 = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53068], 0);
  v27 = (void *)CVBufferCopyAttachment(v23, v9, 0);
  int v11 = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53108], 0);
  uint64_t v26 = (void *)CVBufferCopyAttachment(v11, v9, 0);
  uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  if (buffer) {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  }
  else {
    uint64_t v13 = 0;
  }
  if (v28) {
    uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  }
  else {
    uint64_t v14 = 0;
  }
  if (v23) {
    uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  }
  else {
    uint64_t v15 = 0;
  }
  if (!v27)
  {
    uint64_t v16 = 0;
    if (v11) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v17 = 0;
    goto LABEL_20;
  }
  uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  if (!v11) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
LABEL_20:
  if (v26) {
    uint64_t v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  }
  else {
    uint64_t v18 = 0;
  }
  if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 4) != 0&& objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue") == 1)
  {
    [(BWDeferredPipelineParameters *)[(BWDeferredCaptureControllerInput *)self pipelineParameters] setQuadraProcessingSupportEnabled:1];
  }
  int v19 = [(BWDeferredCaptureContainer *)self->_captureContainer commitBuffer:v7 tag:v22 bufferType:1 captureFrameFlags:v21 compressionProfile:self->_compressionProfile metadataTag:v12 rawThumbnailsBufferTag:v13 rawThumbnailsMetadataTag:v14 mainRawThumbnailBufferTag:v15 mainRawThumbnailMetadataTag:v16 sifrRawThumbnailBufferTag:v17 sifrRawThumbnailMetadataTag:v18 portType:v25];
  *((_DWORD *)v37 + 6) = v19;
  if (v19
    || (int v20 = [(BWDeferredCaptureContainer *)self->_captureContainer commitMetadata:v29 tag:v12 bufferTag:v22], (*((_DWORD *)v37 + 6) = v20) != 0))
  {
    FigDebugAssert3();
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v31 = __61__BWDeferredCaptureControllerInput_addSensorRawSampleBuffer___block_invoke;
    v32 = &unk_1E5C2D430;
    v35 = &v36;
    v33 = self;
    v34 = v25;
    __61__BWDeferredCaptureControllerInput_addSensorRawSampleBuffer___block_invoke((uint64_t)v30, 37, (uint64_t)buffer, v13, (uint64_t)v28, v14);
    v31((uint64_t)v30, 37, (uint64_t)v23, v15, (uint64_t)v27, v16);
    v31((uint64_t)v30, 37, (uint64_t)v11, v17, (uint64_t)v26, v18);
  }

LABEL_30:
  if (*((_DWORD *)v37 + 6))
  {
    -[BWDeferredCaptureControllerInput encounteredProcessingError:](self, "encounteredProcessingError:");
  }
  else if (self)
  {
    [(BWStillImageProcessorControllerInputUpdatesDelegate *)[(BWStillImageProcessorControllerInput *)self delegate] inputReceivedIntermediate:self];
  }
  _Block_object_dispose(&v36, 8);
}

uint64_t __61__BWDeferredCaptureControllerInput_addSensorRawSampleBuffer___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = result;
  if (!a3)
  {
    if (!a5) {
      return result;
    }
    goto LABEL_6;
  }
  result = [*(id *)(*(void *)(result + 32) + 56) commitBuffer:a3 tag:a4 bufferType:a2 captureFrameFlags:0 compressionProfile:*(unsigned int *)(*(void *)(result + 32) + 64) metadataTag:a6 portType:*(void *)(result + 40)];
  *(_DWORD *)(*(void *)(*(void *)(v9 + 48) + 8) + 24) = result;
  if (a5 && !*(_DWORD *)(*(void *)(*(void *)(v9 + 48) + 8) + 24))
  {
LABEL_6:
    result = [*(id *)(*(void *)(v9 + 32) + 56) commitMetadata:a5 tag:a6 bufferTag:a4];
    *(_DWORD *)(*(void *)(*(void *)(v9 + 48) + 8) + 24) = result;
  }
  return result;
}

- (void)addDictionary:(id)a3 tag:(id)a4
{
  [(BWDeferredCaptureControllerInput *)self _addDictionary:a3 tag:a4];
  if (self)
  {
    v5 = [(BWStillImageProcessorControllerInput *)self delegate];
    [(BWStillImageProcessorControllerInputUpdatesDelegate *)v5 inputReceivedIntermediate:self];
  }
}

- (void)_addInferenceBuffer:(__CVBuffer *)a3 metadata:(id)a4 inferenceAttachedMediaKey:(id)a5 portType:(id)a6
{
  if (a3)
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (a4) {
      uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    }
    else {
      uint64_t v12 = 0;
    }
    [(BWDeferredCaptureContainer *)self->_captureContainer commitInferenceBuffer:a3 tag:v11 metadataTag:v12 inferenceAttachedMediaKey:a5 compressionProfile:self->_compressionProfile portType:a6];
    if (a4)
    {
      if ([(BWDeferredCaptureContainer *)self->_captureContainer commitMetadata:a4 tag:v12 bufferTag:v11])
      {
        FigDebugAssert3();
      }
    }
  }
}

- (void)_addInference:(id)a3 inferenceAttachmentKey:(id)a4 portType:(id)a5
{
  if (a3)
  {
    captureContainer = self->_captureContainer;
    uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    [(BWDeferredCaptureContainer *)captureContainer commitInference:a3 tag:v9 inferenceAttachmentKey:a4 portType:a5];
  }
}

- (void)_addDictionary:(id)a3 tag:(id)a4
{
  if (a3 && ![(BWDeferredContainer *)self->_captureContainer hasTag:a4])
  {
    captureContainer = self->_captureContainer;
    [(BWDeferredCaptureContainer *)captureContainer commitDictionary:a3 tag:a4];
  }
}

- (void)_showDeferredCaptureTapToRadarPromptIfNecessaryForProcessingError:(uint64_t)a1
{
  if (a1 && FigDebugIsInternalBuild() && a2 != -73439 && a2 != -17401)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPropertyListRef v6 = (id)CFPreferencesCopyValue(@"LastShownDeferredCaptureFailedTTRPromptDate", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    v7 = (const void *)[MEMORY[0x1E4F1C9C8] date];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "isDate:inSameDayAsDate:", v6, v7))
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v8 setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Deferred photo failed at capture time with error: %d", a2);
      char v10 = NSString;
      uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings"), "settingsID");
      uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "captureRequestIdentifier");
      uint64_t v13 = [v10 stringWithFormat:@"Deferred capture for captureID:%lld and captureRequestIdentifier: %@ failed with error: %d at %@", v11, v12, a2, objc_msgSend(v8, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"))];

      FigCapturePromptOpenTapToRadar(@"Photo capture for a deferred asset hit a problem, and a lower-quality final proxy photo has been delivered to your library. File a radar with a sysdiagnose?", v9, v13, 1, 2, 6, *(CFTimeInterval *)"");
      CFPreferencesSetValue(@"LastShownDeferredCaptureFailedTTRPromptDate", v7, @"com.apple.cameracapture.volatile", v4, v5);
    }
  }
}

- (void)encounteredProcessingError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[BWDeferredCaptureControllerInput _showDeferredCaptureTapToRadarPromptIfNecessaryForProcessingError:]((uint64_t)self, *(uint64_t *)&a3);
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  [+[BWDeferredCaptureContainerManager sharedInstance] abortContainer:[(FigCaptureStillImageSettings *)[(BWStillImageSettings *)self->_settings requestedSettings] captureRequestIdentifier] error:v3];
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)[(BWStillImageProcessorControllerInput *)self delegate] input:self encounteredProcessingError:v3];
}

- (void)proxyReadyWithFPNREnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v14[20] = *MEMORY[0x1E4F143B8];
  self->_proxyBufferReady = 1;
  if (![(BWDeferredContainer *)self->_captureContainer hasTag:BWDeferredIntermediateTagModuleCalibrationByPortType])
  {
    CFStringRef v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", -[BWStillImageProcessorControllerInput portType](self, "portType")), "moduleCalibration");
    if (v5)
    {
      CFPropertyListRef v6 = v5;
      v7 = (void *)[v5 copy];
      objc_msgSend((id)objc_msgSend(v7, "blacklevelShadingCorrectionThumbnails"), "setEncodingOptions:", 1);
      if (v3)
      {
        if (objc_msgSend((id)objc_msgSend(v6, "shadingFPNCorrectionImage"), "pixelBufferFileSystemLocation")
          && objc_msgSend((id)objc_msgSend(v6, "shadingFPNCorrectionImage"), "metadataFileSystemLocation"))
        {
          objc_msgSend((id)objc_msgSend(v7, "shadingFPNCorrectionImage"), "setEncodingOptions:", 4);
        }
        else
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        [v7 setShadingFPNCorrectionImage:0];
      }
      uint64_t v13 = [(BWStillImageProcessorControllerInput *)self portType];
      v14[0] = v7;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      [(BWDeferredCaptureContainer *)self->_captureContainer commitDictionary:v10 tag:BWDeferredIntermediateTagModuleCalibrationByPortType];
    }
    else if (v3)
    {
      id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)[(BWStillImageProcessorControllerInput *)self delegate] inputReceivedIntermediate:self];
}

- (void)depthDataGenerationFailed
{
  self->_depthDataGenerationFailed = 1;
  BOOL v3 = [(BWStillImageProcessorControllerInput *)self delegate];
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v3 inputReceivedIntermediate:self];
}

- (void)canProcessEnhancedResolution:(BOOL)a3 skipInferences:(BOOL)a4
{
  BOOL v5 = a3;
  [(BWDeferredPipelineParameters *)[(BWDeferredCaptureControllerInput *)self pipelineParameters] setCanProcessEnhancedResolution:a3];
  self->_skipInferences = a4;
  self->_canProcessEnhancedResolution = (NSNumber *)[objc_alloc(NSNumber) initWithBool:v5];
  v7 = [(BWStillImageProcessorControllerInput *)self delegate];
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v7 inputReceivedIntermediate:self];
}

- (id)readyForProcessing
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_msgSend((id)objc_msgSend(result, "captureStreamSettings"), "captureFlags");
    int v3 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "captureType");
    CFStringRef v4 = (void *)[v1 captureStreamSettings];
    if (v3 == 12 && (v2 & 4) != 0)
    {
      int v5 = [v4 expectedEVZeroFrameCount];
      int v43 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "expectedLongFrameCount");
      unint64_t v42 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "captureFlags");
      if ((v2 & 0x200000000) != 0)
      {
        id v26 = v1[9];
        if (v26)
        {
          int v44 = 0;
          v5 -= [v26 BOOLValue] ^ 1;
        }
        else
        {
          int v44 = 1;
        }
      }
      else
      {
        int v44 = 0;
      }
      int v27 = objc_msgSend((id)objc_msgSend(v1, "captureSettings"), "captureFlags");
      int v28 = objc_msgSend((id)objc_msgSend(v1, "pipelineParameters"), "depthDataType");
      __int16 v29 = objc_msgSend((id)objc_msgSend(v1, "captureSettings"), "captureFlags");
      BOOL v30 = 1;
      int v45 = v5;
      int v41 = v27;
      if ((v29 & 0x800) != 0 && v28 != 9) {
        BOOL v30 = *((unsigned char *)v1 + 69) != 0;
      }
      BOOL v40 = v30;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v31 = (void *)[v1[7] intermediates];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v47 = 0;
        int v34 = 0;
        int v46 = 0;
        int v49 = 0;
        uint64_t v35 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v59 != v35) {
              objc_enumerationMutation(v31);
            }
            v37 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            if ([v37 isMemberOfClass:objc_opt_class()])
            {
              char v38 = [v37 captureFrameFlags];
              if (objc_msgSend((id)objc_msgSend(v1, "portType"), "isEqualToString:", objc_msgSend(v37, "portType")))
              {
                if ((v38 & 2) != 0)
                {
                  ++v49;
                }
                else if ((v38 & 8) != 0)
                {
                  ++HIDWORD(v47);
                }
                else if ((v38 & 4) != 0)
                {
                  int v46 = 1;
                }
                else
                {
                  LODWORD(v47) = ([v37 bufferType] == 2001) | v47;
                }
              }
              else if ((v38 & 0x14) != 0)
              {
                ++v34;
              }
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v33);
      }
      else
      {
        uint64_t v47 = 0;
        int v34 = 0;
        int v46 = 0;
        int v49 = 0;
      }
      if (v49 == v45)
      {
        if (v34 == ((v42 >> 38) & 1)) {
          int v16 = (v46 | ((*(void *)&v41 & 0x100000) == 0)) & (HIDWORD(v47) == v43) & (v40 | v47);
        }
        else {
          int v16 = 0;
        }
      }
      else
      {
        int v16 = 0;
      }
      int v17 = v44;
    }
    else if ([v4 captureType] == 12)
    {
      CFPropertyListRef v6 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:&unk_1EFB04958];
      v7 = v6;
      if ((v2 & 0x400000) != 0) {
        [v6 addObject:&unk_1EFB01F88];
      }
      id v8 = (void *)[MEMORY[0x1E4F1CA80] set];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v48 = v1;
      uint64_t v9 = (void *)[v1[7] intermediates];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v55 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            if ([v14 isMemberOfClass:objc_opt_class()])
            {
              uint64_t v15 = [v14 bufferType];
              [v14 captureFrameFlags];
              if ((objc_msgSend(v7, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v15)) & 1) == 0)objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v15)); {
              objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v15));
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v63 count:16];
        }
        while (v11);
      }
      int v16 = [v7 isEqualToSet:v8];
      int v17 = 0;
      v1 = v48;
    }
    else if ((v2 & 0x84) == 0x84)
    {
      int v18 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "expectedEVZeroFrameCount");
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      int v19 = (void *)[v1[7] intermediates];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        int v22 = 0;
        uint64_t v23 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v51 != v23) {
              objc_enumerationMutation(v19);
            }
            uint64_t v25 = *(void **)(*((void *)&v50 + 1) + 8 * k);
            if ([v25 isMemberOfClass:objc_opt_class()]) {
              v22 += ([v25 captureFrameFlags] >> 1) & 1;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v50 objects:v62 count:16];
        }
        while (v21);
      }
      else
      {
        int v22 = 0;
      }
      int v17 = 0;
      int v16 = v22 == v18;
    }
    else
    {
      int v17 = 0;
      int v16 = 0;
    }
    unsigned int v39 = v16 & (v17 ^ 1);
    if (*((unsigned char *)v1 + 68)) {
      return (id *)v39;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BWDeferredCaptureContainer)captureContainer
{
  return self->_captureContainer;
}

- (int)compressionProfile
{
  return self->_compressionProfile;
}

- (BOOL)skipInferences
{
  return self->_skipInferences;
}

@end