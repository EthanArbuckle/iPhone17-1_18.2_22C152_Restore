@interface BWDepthConverterNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (BOOL)mirroringEnabled;
- (BOOL)providesUnfilteredDepthAsAttachedMedia;
- (BOOL)skipSmartStyleBuffer;
- (BOOL)stillGDRFilteringSupportEnabled;
- (BOOL)streamingGDRFilteringEnabled;
- (BOOL)streamingSMPFilteringEnabled;
- (BWDepthConverterNode)initWithStillImageNodeConfiguration:(id)a3 cameraInfoByPortType:(id)a4 sensorIDDictionary:(id)a5 rgbPersonSegmentationEnabled:(BOOL)a6 depthIsAlwaysHighQuality:(BOOL)a7 depthOriginatesFromNeuralNetwork:(BOOL)a8 backPressureDrivenPipelining:(BOOL)a9;
- (id)nodeSubType;
- (id)nodeType;
- (int)baseRotationDegrees;
- (int)horizontalSensorBinningFactor;
- (int)rotationDegrees;
- (int)verticalSensorBinningFactor;
- (uint64_t)_computeConversionParametersFromSampleBuffer:(uint64_t)a3 convertOptionsOut:;
- (uint64_t)_convertDepthDisparityToFloat_C:(__CVBuffer *)a3 dst:(uint64_t)a4 options:;
- (uint64_t)_convertDepthDisparityToFloat_NEON:(__CVBuffer *)a3 dst:(int *)a4 options:;
- (uint64_t)_depthMetadataDictionaryFromSampleBuffer:(int)a3 orientation:(unsigned int)a4 stillFilteringRequested:;
- (uint64_t)_generateAndAttachUnfilteredDepthToSampleBuffer:(__CVBuffer *)a3 depthOutputPixelBuffer:(opaqueCMSampleBuffer *)a4 depthOutputSampleBuffer:;
- (uint64_t)_loadAndConfigureDepthProcessorClass:(uint64_t)result;
- (uint64_t)_parseCameraInfo;
- (uint64_t)_resolveFilteringTypeWithStillFilteringRequested:(uint64_t)a1;
- (uint64_t)_updateOutputRequirements;
- (uint64_t)convertToFloatAndRotate:(uint64_t)a3 inputSampleBuffer:(__CVBuffer *)a4 outputPixelBuffer:;
- (uint64_t)filterDepthPixelBuffer:(__CVBuffer *)a3 outputDepthPixelBuffer:(CMSampleBufferRef)sbuf yuvImageSampleBuffer:(uint64_t)a5 depthSampleBuffer:(unsigned int)a6 filteringType:;
- (uint64_t)rotateAndScaleImagePixelBuffer:(uint64_t)a1 depthPixelBuffer:(__CVBuffer *)a2 to:(CVPixelBufferRef)pixelBuffer rotationAngle:(uint64_t)a4 flip:(int)a5;
- (unsigned)outputFormat;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setBaseRotationDegrees:(int)a3;
- (void)setHorizontalSensorBinningFactor:(int)a3;
- (void)setMirroringEnabled:(BOOL)a3;
- (void)setOutputDimensions:(id)a3;
- (void)setOutputFormat:(unsigned int)a3;
- (void)setProvidesUnfilteredDepthAsAttachedMedia:(BOOL)a3;
- (void)setRotationDegrees:(int)a3;
- (void)setSkipSmartStyleBuffer:(BOOL)a3;
- (void)setStillGDRFilteringSupportEnabled:(BOOL)a3;
- (void)setStreamingGDRFilteringEnabled:(BOOL)a3;
- (void)setStreamingSMPFilteringEnabled:(BOOL)a3;
- (void)setVerticalSensorBinningFactor:(int)a3;
@end

@implementation BWDepthConverterNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    output = self->super._output;
    [(BWNodeOutput *)output setFormat:a3];
  }
  else if ([a5 isEqualToString:@"Depth"])
  {
    self->_inputDepthDimensions.width = [a3 width];
    self->_inputDepthDimensions.height = [a3 height];
    if (self->_providesUnfilteredDepthAsAttachedMedia)
    {
      id v10 = [(BWNodeOutput *)self->super._output mediaConfigurationForAttachedMediaKey:@"Depth"];
      if (v10)
      {
        v11 = v10;
        v12 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v12, "setFormatRequirements:", [v11 formatRequirements]);
        [(BWNodeOutputMediaConfiguration *)v12 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v12 setProvidesPixelBufferPool:1];
        v13 = self->super._output;
        [(BWNodeOutput *)v13 setMediaConfiguration:v12 forAttachedMediaKey:0x1EFA74340];
      }
    }
  }
  else if (([a5 isEqualToString:0x1EFA744E0] & 1) == 0 {
         && ([a5 isEqualToString:0x1EFA74500] & 1) == 0)
  }
  {
    v14.receiver = self;
    v14.super_class = (Class)BWDepthConverterNode;
    [(BWNode *)&v14 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  cf[23] = *(CMAttachmentBearerRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v8 = &off_1E96B6000;
  target = (void *)BWSampleBufferGetAttachedMedia(a3, @"Depth");
  if (!target) {
    goto LABEL_10;
  }
  if (self && self->_stillGDRFilteringSupportEnabled)
  {
    v9 = (__CVBuffer *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
    id v10 = v9;
    if (!v9)
    {
      int v11 = -12780;
      goto LABEL_42;
    }
    if (([(__CVBuffer *)v9 captureFlags] & 0x800) == 0
      || (BWStillImageProcessingFlagsForSampleBuffer(a3) & 0x200000) != 0 && self->_skipSmartStyleBuffer)
    {
LABEL_10:
      id v10 = 0;
      int v11 = 0;
      goto LABEL_42;
    }
    v12 = (void *)CMGetAttachment(a3, @"StillImageSettings", 0);
    if (!v12)
    {
      int v11 = FigSignalErrorAt();
      id v10 = 0;
      goto LABEL_42;
    }
    BOOL v13 = ([v12 depthDataFiltered] & 1) != 0 || self->_depthOriginatesFromNeuralNetwork;
    if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542C0]), "BOOLValue"))
    {
      if (dword_1E96B6A08)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        id v10 = 0;
        int v11 = -16809;
        v8 = &off_1E96B6000;
      }
      else
      {
        id v10 = 0;
        int v11 = -16809;
      }
      goto LABEL_42;
    }
    uint64_t v34 = v4;
  }
  else
  {
    uint64_t v34 = v4;
    BOOL v13 = 0;
  }
  unsigned int v14 = -[BWDepthConverterNode _resolveFilteringTypeWithStillFilteringRequested:]((uint64_t)self, v13);
  uint64_t v15 = objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", @"Depth"), "livePixelBufferPool"), "newPixelBuffer");
  id v10 = (__CVBuffer *)v15;
  if (!v15)
  {
    int v11 = -12786;
    goto LABEL_42;
  }
  if (v14)
  {
    filteringInputBuffer = self->_filteringInputBuffer;
    if (self->_conversionAfterFilteringRequired) {
      filteringOutputBuffer = self->_filteringOutputBuffer;
    }
    else {
      filteringOutputBuffer = (__CVBuffer *)v15;
    }
  }
  else
  {
    filteringOutputBuffer = 0;
    filteringInputBuffer = (__CVBuffer *)v15;
  }
  if (self->_depthOriginatesFromNeuralNetwork)
  {
    filteringInputBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  }
  else
  {
    int v20 = -[BWDepthConverterNode convertToFloatAndRotate:inputSampleBuffer:outputPixelBuffer:]((uint64_t)self, (CMSampleBufferRef)target, v16, filteringInputBuffer);
    if (v20)
    {
      int v11 = v20;
      uint64_t v33 = v34;
      LODWORD(v32) = v20;
      goto LABEL_74;
    }
  }
  if (v14)
  {
    int v21 = -[BWDepthConverterNode filterDepthPixelBuffer:outputDepthPixelBuffer:yuvImageSampleBuffer:depthSampleBuffer:filteringType:]((uint64_t)self, filteringInputBuffer, filteringOutputBuffer, a3, v19, v14);
    if (v21)
    {
      int v11 = v21;
LABEL_75:
      v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      v8 = &off_1E96B6000;
      goto LABEL_42;
    }
    if (self->_conversionAfterFilteringRequired)
    {
      v22 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        kdebug_trace();
      }
      int v11 = FigDepthConvertBuffer(filteringOutputBuffer, v10);
      if (*v22 == 1) {
        kdebug_trace();
      }
      if (v11)
      {
        uint64_t v33 = v34;
        LODWORD(v32) = v11;
        goto LABEL_74;
      }
    }
  }
  int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v10, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)cf);
  if (CopyWithNewPixelBuffer)
  {
    int v11 = CopyWithNewPixelBuffer;
    uint64_t v33 = v34;
    LODWORD(v32) = CopyWithNewPixelBuffer;
LABEL_74:
    FigDebugAssert3();
    goto LABEL_75;
  }
  int v24 = FigDepthConvertRotationAndMirroringToExifOrientation(self->_rotationDegrees, self->_mirroringEnabled);
  v25 = (const void *)-[BWDepthConverterNode _depthMetadataDictionaryFromSampleBuffer:orientation:stillFilteringRequested:]((uint64_t)self, a3, v24, v13);
  if (self->_stillGDRFilteringSupportEnabled) {
    v26 = a3;
  }
  else {
    v26 = (opaqueCMSampleBuffer *)cf[0];
  }
  CMSetAttachment(v26, (CFStringRef)*MEMORY[0x1E4F55B40], v25, 1u);
  CMRemoveAttachment(cf[0], @"OriginalCameraIntrinsicMatrix");
  v8 = &off_1E96B6000;
  if (self->_providesUnfilteredDepthAsAttachedMedia) {
    -[BWDepthConverterNode _generateAndAttachUnfilteredDepthToSampleBuffer:depthOutputPixelBuffer:depthOutputSampleBuffer:]((uint64_t)self, a3, v10, (opaqueCMSampleBuffer *)cf[0]);
  }
  int v11 = 0;
  v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_42:
  if (*v7 == 1) {
    kdebug_trace();
  }
  if (v11) {
    BOOL v27 = 1;
  }
  else {
    BOOL v27 = cf[0] == 0;
  }
  int v28 = !v27;
  if (self->_stillGDRFilteringSupportEnabled && *((_DWORD *)v8 + 642) != 0)
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v28)
  {
    BWSampleBufferSetAttachedMedia(a3, @"Depth", (uint64_t)cf[0]);
  }
  else if (target)
  {
    BWSampleBufferRemoveAttachedMedia(a3, @"Depth");
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v10) {
    CFRelease(v10);
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v32, v33);
}

- (id)nodeType
{
  return @"Effect";
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (BWDepthConverterNode)initWithStillImageNodeConfiguration:(id)a3 cameraInfoByPortType:(id)a4 sensorIDDictionary:(id)a5 rgbPersonSegmentationEnabled:(BOOL)a6 depthIsAlwaysHighQuality:(BOOL)a7 depthOriginatesFromNeuralNetwork:(BOOL)a8 backPressureDrivenPipelining:(BOOL)a9
{
  BOOL v11 = a6;
  v29.receiver = self;
  v29.super_class = (Class)BWDepthConverterNode;
  uint64_t v15 = [(BWNode *)&v29 init];
  if (v15)
  {
    v15->_stillImageNodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v15->_cameraInfoByPortType = (NSDictionary *)a4;
    v15->_sensorIDDictionary = (NSDictionary *)a5;
    v15->_depthIsAlwaysHighQuality = a7;
    v15->_depthOriginatesFromNeuralNetwork = a8;
    v15->_backPressureDrivenPipelining = a9;
    uint64_t v16 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v15];
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v17 setSupportedPixelFormats:FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB03C20, 3)];
    [(BWNodeInput *)v16 setFormatRequirements:v17];

    [(BWNodeInput *)v16 setPassthroughMode:1];
    v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
    uint64_t v19 = objc_alloc_init(BWVideoFormatRequirements);
    int v20 = v19;
    if (v15->_depthOriginatesFromNeuralNetwork) {
      int v21 = &unk_1EFB03C38;
    }
    else {
      int v21 = &unk_1EFB03C50;
    }
    [(BWVideoFormatRequirements *)v19 setSupportedPixelFormats:v21];
    [(BWNodeInputMediaConfiguration *)v18 setFormatRequirements:v20];
    [(BWNodeInputMediaConfiguration *)v18 setPassthroughMode:0];
    [(BWNodeInput *)v16 setMediaConfiguration:v18 forAttachedMediaKey:@"Depth"];
    if (v11)
    {
      v22 = objc_alloc_init(BWNodeInputMediaConfiguration);
      v23 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v23 setSupportedPixelFormats:&unk_1EFB03C68];
      [(BWNodeInputMediaConfiguration *)v22 setFormatRequirements:v23];
      [(BWNodeInputMediaConfiguration *)v22 setPassthroughMode:0];
      [(BWNodeInput *)v16 setMediaConfiguration:v22 forAttachedMediaKey:0x1EFA744E0];
    }
    [(BWNode *)v15 addInput:v16];

    int v24 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v15];
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v24 setFormatRequirements:v25];
    [(BWNodeOutput *)v24 setPassthroughMode:1];

    v26 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    BOOL v27 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v27 setSupportedPixelFormats:&unk_1EFB03C80];
    [(BWNodeOutputMediaConfiguration *)v26 setFormatRequirements:v27];
    [(BWNodeOutputMediaConfiguration *)v26 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v26 setPixelBufferPoolProvidesBackPressure:v15->_backPressureDrivenPipelining];
    [(BWNodeOutputMediaConfiguration *)v26 setPixelBufferPoolReportSlowBackPressureAllocations:v15->_backPressureDrivenPipelining];
    [(BWNodeOutput *)v24 setMediaConfiguration:v26 forAttachedMediaKey:@"Depth"];
    [(BWNode *)v15 addOutput:v24];

    v15->_forceCPath = 0;
  }
  return v15;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  if (self) {
    BOOL v3 = self->_streamingGDRFilteringEnabled
  }
      || self->_streamingSMPFilteringEnabled
      || self->_stillGDRFilteringSupportEnabled;
  else {
    BOOL v3 = 0;
  }
  if (-[BWDepthConverterNode _parseCameraInfo]((uint64_t)self)) {
    goto LABEL_62;
  }
  streamingFilteringScaledDepthInputBuffer = self->_streamingFilteringScaledDepthInputBuffer;
  if (streamingFilteringScaledDepthInputBuffer)
  {
    CFRelease(streamingFilteringScaledDepthInputBuffer);
    self->_streamingFilteringScaledDepthInputBuffer = 0;
  }
  streamingFilteringScaledDepthOutputBuffer = self->_streamingFilteringScaledDepthOutputBuffer;
  if (streamingFilteringScaledDepthOutputBuffer)
  {
    CFRelease(streamingFilteringScaledDepthOutputBuffer);
    self->_streamingFilteringScaledDepthOutputBuffer = 0;
  }
  filteringInputBuffer = self->_filteringInputBuffer;
  if (filteringInputBuffer)
  {
    CFRelease(filteringInputBuffer);
    self->_filteringInputBuffer = 0;
  }
  filteringOutputBuffer = self->_filteringOutputBuffer;
  if (filteringOutputBuffer)
  {
    CFRelease(filteringOutputBuffer);
    self->_filteringOutputBuffer = 0;
  }
  filteringScaledYUVBuffer = self->_filteringScaledYUVBuffer;
  if (filteringScaledYUVBuffer)
  {
    CFRelease(filteringScaledYUVBuffer);
    self->_filteringScaledYUVBuffer = 0;
  }
  if (!v3) {
    goto LABEL_66;
  }
  if (self->_streamingGDRFilteringEnabled || self->_streamingSMPFilteringEnabled)
  {
    uint64_t v9 = 1717856627;
    self->_depthProcessorClassName = (NSString *)@"FigStreamingDepthProcessorCPU";
    uint64_t width = self->_outputDimensions.width;
    uint64_t height = self->_outputDimensions.height;
    if (self->_streamingGDRFilteringEnabled)
    {
      int v12 = (int)width <= (int)height ? self->_outputDimensions.height : self->_outputDimensions.width;
      float v13 = 320.0 / (float)v12;
      if (v13 == 1.0)
      {
        uint64_t v15 = 1717856627;
      }
      else
      {
        uint64_t width = (int)(float)(v13 * (float)(int)width);
        uint64_t height = (int)(float)(v13 * (float)(int)height);
        if (BWCreateIOSurfaceBackedCVPixelBuffer(width, height, 1717856627, &self->_streamingFilteringScaledDepthInputBuffer, @"DepthConverter: Scaled Depth Input")|| (int v14 = BWCreateIOSurfaceBackedCVPixelBuffer(width, height, 1717856627, &self->_streamingFilteringScaledDepthOutputBuffer, @"DepthConverter: Scaled Depth Output"), v15 = 1717856627, v9 = 1717856627, v14))
        {
LABEL_62:
          FigDebugAssert3();
          return;
        }
      }
    }
    else
    {
      uint64_t v16 = FigDepthFormatIsDisparity(self->_outputFormat) ? 1717856627 : 1717855600;
      uint64_t v15 = FigDepthFormatIsDisparity(self->_outputFormat) ? 1717856627 : 1717855600;
      uint64_t v9 = v16;
      uint64_t height = height;
    }
    if (self->_streamingSMPFilteringEnabled)
    {
      uint64_t v17 = v9;
      if ([(BWNodeConnection *)[(BWNodeInput *)self->super._input connection] pipelineStage])
      {
        [(BWPipelineStage *)[(BWNodeConnection *)[(BWNodeInput *)self->super._input connection] pipelineStage] priority];
      }
      self->_depthProcessorWorkerQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      uint64_t v9 = v17;
    }
  }
  else
  {
    uint64_t v15 = 1751411059;
    v18 = self->_depthOriginatesFromNeuralNetwork
        ? @"FigStillDepthProcessorANE"
        : @"FigStillDepthProcessorGPU";
    uint64_t v9 = self->_depthOriginatesFromNeuralNetwork ? 1717855600 : 1751411059;
    self->_depthProcessorClassName = &v18->isa;
    uint64_t width = self->_outputDimensions.width;
    uint64_t height = self->_outputDimensions.height;
  }
  self->_conversionAfterFilteringRequired = self->_outputFormat != v15;
  if (BWCreateIOSurfaceBackedCVPixelBuffer(self->_outputDimensions.width, self->_outputDimensions.height, v9, &self->_filteringInputBuffer, @"DepthConverter: Filtering Input")|| self->_conversionAfterFilteringRequired&& BWCreateIOSurfaceBackedCVPixelBuffer(self->_outputDimensions.width, self->_outputDimensions.height, v15, &self->_filteringOutputBuffer, @"DepthConverter: Filtering Output"))
  {
    goto LABEL_62;
  }
  if (!self->_scaler && CMPhotoScaleAndRotateSessionCreate()) {
    goto LABEL_62;
  }
  uint64_t v19 = FigCapturePixelFormatIsFullRange([(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] pixelFormat])? 875704422: 875704438;
  if (BWCreateIOSurfaceBackedCVPixelBuffer(width, height, v19, &self->_filteringScaledYUVBuffer, @"DepthConverter: Scaled YUV"))goto LABEL_62; {
  if (self->_depthProcessor
  }
    || !-[BWDepthConverterNode _loadAndConfigureDepthProcessorClass:]((uint64_t)self, self->_depthProcessorClassName))
  {
LABEL_66:
    if (!self->_providesUnfilteredDepthAsAttachedMedia
      || !VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_unfilteredDepthTransferSession))
    {
      v20.receiver = self;
      v20.super_class = (Class)BWDepthConverterNode;
      [(BWNode *)&v20 prepareForCurrentConfigurationToBecomeLive];
    }
  }
}

- (uint64_t)_parseCameraInfo
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = [*(id *)(result + 120) objectForKeyedSubscript:*MEMORY[0x1E4F52E00]];
  BOOL v3 = *(void **)(v1 + 120);
  if (v2)
  {
    uint64_t v4 = *MEMORY[0x1E4F52DF8];
    if ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F52DF8]]) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = *MEMORY[0x1E4F52E10];
    }
    v6 = (void *)[*(id *)(v1 + 120) objectForKeyedSubscript:v5];
    v7 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F52CE8]];
    *(_DWORD *)(v1 + 240) = 1;
    *(unsigned char *)(v1 + 489) = 1;
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F52D28]), "floatValue");
    *(_DWORD *)(v1 + 376) = v8;
    goto LABEL_15;
  }
  uint64_t v9 = *MEMORY[0x1E4F52DD8];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]]
    && (uint64_t v10 = *MEMORY[0x1E4F52DF0], [*(id *)(v1 + 120) objectForKeyedSubscript:*MEMORY[0x1E4F52DF0]]))
  {
    BOOL v11 = (void *)[*(id *)(v1 + 120) objectForKeyedSubscript:v10];
    v7 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F52CE8]];
    int v12 = *(void **)(v1 + 120);
    uint64_t v13 = v10;
  }
  else
  {
    if (![*(id *)(v1 + 120) objectForKeyedSubscript:v9]
      || ![*(id *)(v1 + 120) objectForKeyedSubscript:*MEMORY[0x1E4F52DE8]])
    {
      uint64_t v28 = *MEMORY[0x1E4F52DF8];
      if (![*(id *)(v1 + 120) objectForKeyedSubscript:*MEMORY[0x1E4F52DF8]]
        || [*(id *)(v1 + 120) count] != 1)
      {
        return 4294954514;
      }
      objc_super v29 = (void *)[*(id *)(v1 + 120) objectForKeyedSubscript:v28];
      v7 = (void *)[v29 objectForKeyedSubscript:*MEMORY[0x1E4F52CE8]];
      uint64_t v16 = *MEMORY[0x1E4F52D28];
      uint64_t v15 = v29;
      goto LABEL_14;
    }
    int v14 = (void *)[*(id *)(v1 + 120) objectForKeyedSubscript:v9];
    v7 = (void *)[v14 objectForKeyedSubscript:*MEMORY[0x1E4F52CE8]];
    int v12 = *(void **)(v1 + 120);
    uint64_t v13 = v9;
  }
  uint64_t v15 = (void *)[v12 objectForKeyedSubscript:v13];
  uint64_t v16 = *MEMORY[0x1E4F52D28];
LABEL_14:
  objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v16), "floatValue");
  *(_DWORD *)(v1 + 376) = v17;
  *(_DWORD *)(v1 + 240) = 0;
LABEL_15:
  *(_DWORD *)(v1 + 176) = 1065353216;
  *(_DWORD *)(v1 + 196) = 1065353216;
  *(_DWORD *)(v1 + 216) = 1065353216;
  if (*(unsigned char *)(v1 + 425)) {
    return 0;
  }
  if (v7)
  {
    v18 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F539D0]];
    if ([v18 length] != 64) {
      goto LABEL_29;
    }
    uint64_t v19 = (long long *)[v18 bytes];
    long long v20 = v19[3];
    long long v22 = *v19;
    long long v21 = v19[1];
    *(_OWORD *)(v1 + 280) = v19[2];
    *(_OWORD *)(v1 + 296) = v20;
    *(_OWORD *)(v1 + 248) = v22;
    *(_OWORD *)(v1 + 264) = v21;
    v23 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F539D8]];
    if ([v23 length] != 64)
    {
LABEL_29:
      FigDebugAssert3();
      return 0;
    }
    int v24 = (long long *)[v23 bytes];
    result = 0;
    long long v25 = v24[3];
    long long v27 = *v24;
    long long v26 = v24[1];
    *(_OWORD *)(v1 + 344) = v24[2];
    *(_OWORD *)(v1 + 360) = v25;
    *(_OWORD *)(v1 + 312) = v27;
    *(_OWORD *)(v1 + 328) = v26;
    *(unsigned char *)(v1 + 244) = 1;
  }
  else
  {
    return FigSignalErrorAt();
  }
  return result;
}

- (uint64_t)_updateOutputRequirements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    BOOL v3 = objc_alloc_init(BWVideoFormatRequirements);
    v4[0] = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v1 + 152)];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1]);
    [(BWVideoFormatRequirements *)v3 setWidth:*(int *)(v1 + 156)];
    [(BWVideoFormatRequirements *)v3 setHeight:*(int *)(v1 + 160)];
    [(BWNodeOutputMediaConfiguration *)v2 setFormatRequirements:v3];
    [(BWNodeOutputMediaConfiguration *)v2 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v2 setProvidesPixelBufferPool:1];
    [(BWNodeOutputMediaConfiguration *)v2 setPixelBufferPoolProvidesBackPressure:*(unsigned __int8 *)(v1 + 164)];
    [(BWNodeOutputMediaConfiguration *)v2 setPixelBufferPoolReportSlowBackPressureAllocations:*(unsigned __int8 *)(v1 + 164)];
    return [*(id *)(v1 + 16) setMediaConfiguration:v2 forAttachedMediaKey:@"Depth"];
  }
  return result;
}

- (void)setStreamingSMPFilteringEnabled:(BOOL)a3
{
  self->_streamingSMPFilteringEnabled = a3;
}

- (void)setStreamingGDRFilteringEnabled:(BOOL)a3
{
  self->_streamingGDRFilteringEnabled = a3;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setProvidesUnfilteredDepthAsAttachedMedia:(BOOL)a3
{
  self->_providesUnfilteredDepthAsAttachedMedia = a3;
}

- (void)setOutputFormat:(unsigned int)a3
{
  if (self->_outputFormat != a3)
  {
    self->_outputFormat = a3;
    -[BWDepthConverterNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setOutputDimensions:(id)a3
{
  if (self->_outputDimensions.width != a3.var0 || self->_outputDimensions.height != a3.var1)
  {
    self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    -[BWDepthConverterNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_mirroringEnabled = a3;
}

- (void)setBaseRotationDegrees:(int)a3
{
  self->_baseRotationDegrees = a3;
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
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  fixedPointScaledIntermediateBuffer = self->_fixedPointScaledIntermediateBuffer;
  if (fixedPointScaledIntermediateBuffer) {
    CFRelease(fixedPointScaledIntermediateBuffer);
  }
  fixedPointRotatedIntermediateBuffer = self->_fixedPointRotatedIntermediateBuffer;
  if (fixedPointRotatedIntermediateBuffer) {
    CFRelease(fixedPointRotatedIntermediateBuffer);
  }
  filteringInputBuffer = self->_filteringInputBuffer;
  if (filteringInputBuffer) {
    CFRelease(filteringInputBuffer);
  }
  filteringOutputBuffer = self->_filteringOutputBuffer;
  if (filteringOutputBuffer) {
    CFRelease(filteringOutputBuffer);
  }
  streamingFilteringScaledDepthInputBuffer = self->_streamingFilteringScaledDepthInputBuffer;
  if (streamingFilteringScaledDepthInputBuffer) {
    CFRelease(streamingFilteringScaledDepthInputBuffer);
  }
  streamingFilteringScaledDepthOutputBuffer = self->_streamingFilteringScaledDepthOutputBuffer;
  if (streamingFilteringScaledDepthOutputBuffer) {
    CFRelease(streamingFilteringScaledDepthOutputBuffer);
  }
  filteringScaledYUVBuffer = self->_filteringScaledYUVBuffer;
  if (filteringScaledYUVBuffer) {
    CFRelease(filteringScaledYUVBuffer);
  }
  unfilteredDepthFormatDescription = self->_unfilteredDepthFormatDescription;
  if (unfilteredDepthFormatDescription) {
    CFRelease(unfilteredDepthFormatDescription);
  }
  unfilteredDepthTransferSession = self->_unfilteredDepthTransferSession;
  if (unfilteredDepthTransferSession) {
    CFRelease(unfilteredDepthTransferSession);
  }
  scaler = self->_scaler;
  if (scaler)
  {
    CFRelease(scaler);
    self->_scaler = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)BWDepthConverterNode;
  [(BWNode *)&v14 dealloc];
}

- (id)nodeSubType
{
  return @"DepthConverter";
}

- (uint64_t)_loadAndConfigureDepthProcessorClass:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    size_t v13 = 0;
    size_t Height = 0;
    size_t BytesPerRow = 0;
    *(_DWORD *)(result + 520) = [+[FigCaptureCameraParameters sharedInstance] depthProcessorVersion];
    if (*(_DWORD *)(v3 + 520))
    {
      int v4 = [*(id *)(v3 + 544) pearlModuleType];
      uint64_t v5 = *(unsigned int *)(v3 + 520);
      if (v4 == 2 && (int)v5 < 2) {
        return 4294954516;
      }
      v7 = BWLoadProcessorBundle(@"DepthProcessor", v5);
      if (!v7) {
        return 4294954510;
      }
      int v8 = v7;
      uint64_t v9 = *(__CVBuffer **)(v3 + 456);
      if (v9 && *(void *)(v3 + 464))
      {
        size_t Width = CVPixelBufferGetWidth(v9);
        BOOL v11 = &OBJC_IVAR___BWDepthConverterNode__streamingFilteringScaledDepthInputBuffer;
      }
      else
      {
        BOOL v11 = &OBJC_IVAR___BWDepthConverterNode__filteringInputBuffer;
        size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v3 + 448));
      }
      size_t v13 = Width;
      size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v3 + *v11));
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(v3 + *v11));
      uint64_t v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "classNamed:", a2)), "initWithParameters:commandQueue:", &v13, objc_msgSend(*(id *)(v3 + 544), "metalCommandQueue"));
      *(void *)(v3 + 512) = v12;
      if (!v12) {
        return 4294954510;
      }
      if ([a2 isEqualToString:@"FigStillDepthProcessorGPU"]
        || [a2 isEqualToString:@"FigStillDepthProcessorANE"])
      {
        result = objc_msgSend(*(id *)(v3 + 512), "setTuningParameters:", objc_msgSend(*(id *)(v3 + 112), "objectForKeyedSubscript:", @"DepthProcessingParameters"));
        if (result) {
          return result;
        }
      }
      else if ([a2 isEqualToString:@"FigStreamingDepthProcessorCPU"])
      {
        [*(id *)(v3 + 512) setCameraInfoByPortType:*(void *)(v3 + 120)];
        if (*(int *)(v3 + 520) >= 2)
        {
          if (objc_opt_respondsToSelector()) {
            [*(id *)(v3 + 512) setStreamingGDRFilterEnabled:*(unsigned __int8 *)(v3 + 104)];
          }
          if (objc_opt_respondsToSelector()) {
            [*(id *)(v3 + 512) setStreamingSMPFilterEnabled:*(unsigned __int8 *)(v3 + 106)];
          }
          if (objc_opt_respondsToSelector()) {
            [*(id *)(v3 + 512) setWorkerQueue:*(void *)(v3 + 536)];
          }
        }
      }
      if (([*(id *)(v3 + 512) allocateResources] & 1) == 0) {
        return 4294954510;
      }
    }
    return 0;
  }
  return result;
}

- (unsigned)outputFormat
{
  return self->_outputFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (uint64_t)_computeConversionParametersFromSampleBuffer:(uint64_t)a3 convertOptionsOut:
{
  if (!a1) {
    return 0;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
  if (Width && Height && BytesPerRow && *(_DWORD *)(a1 + 156) && *(_DWORD *)(a1 + 160) != 0)
  {
    BOOL v11 = (void *)CMGetAttachment(sbuf, @"DepthPixelBufferType", 0);
    Attributes = (void *)CVPixelBufferGetAttributes();
    *(_DWORD *)(a3 + 12) = objc_msgSend((id)objc_msgSend(Attributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F24CF8]), "shortValue");
    if ([v11 isEqualToString:*MEMORY[0x1E4F537C8]])
    {
      char FixedPointFractionalBits = CVPixelBufferGetFixedPointFractionalBits();
      char v14 = 1;
      float v15 = (float)(1.0 / (float)(1 << FixedPointFractionalBits)) * 0.001;
      *(_DWORD *)(a3 + 4) = 0;
    }
    else
    {
      uint64_t v16 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F52FE8], 0);
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D8]), "floatValue");
      *(_DWORD *)(a3 + 4) = v17;
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D0]), "floatValue");
      char v14 = 0;
    }
    *(float *)(a3 + 8) = v15;
    *(unsigned char *)(a3 + 16) = v14;
    int v18 = FigCaptureNormalizeAngle(*(_DWORD *)(a1 + 380)+ objc_msgSend((id)objc_msgSend(Attributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E00]), "intValue")- *(_DWORD *)(a1 + 384));
    if (v18) {
      int v19 = 360 - v18;
    }
    else {
      int v19 = 0;
    }
    *(_DWORD *)a3 = FigDepthConvertRotationAndMirroringToExifOrientation(v19, *(unsigned __int8 *)(a1 + 388));
    return 0;
  }
  return FigSignalErrorAt();
}

- (uint64_t)_depthMetadataDictionaryFromSampleBuffer:(int)a3 orientation:(unsigned int)a4 stillFilteringRequested:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F53070];
  CFDictionaryRef v9 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CMSampleBufferGetPresentationTimeStamp(&time, (CMSampleBufferRef)target);
  double Seconds = CMTimeGetSeconds(&time);
  if (*(unsigned char *)(v7 + 105)) {
    unsigned int v11 = a4;
  }
  else {
    unsigned int v11 = 0;
  }
  if (*(unsigned char *)(v7 + 489))
  {
    if ([+[FigCaptureCameraParameters sharedInstance] portraitTapToRefocusPrevented])
    {
      int v12 = 21002;
    }
    else
    {
      int v12 = 20002;
    }
    uint64_t v13 = v12 | (FigDepthDataGetCurrentMajorVersion() << 16);
    uint64_t v14 = 1;
  }
  else
  {
    if (*(unsigned char *)(v7 + 425)) {
      int v15 = 40001;
    }
    else {
      int v15 = 10001;
    }
    uint64_t v13 = v15 | (FigDepthDataGetCurrentMajorVersion() << 16);
    uint64_t v14 = *(unsigned __int8 *)(v7 + 425);
  }
  char v16 = v11 ^ 1;
  if (*(unsigned char *)(v7 + 424)) {
    char v16 = 1;
  }
  if ((v16 & 1) == 0) {
    uint64_t v14 = [*(id *)(v7 + 512) figDepthQuality];
  }
  CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
  CFDictionaryRef v17 = (const __CFDictionary *)CMGetAttachment(target, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0);
  if (!v17) {
    goto LABEL_45;
  }
  CFDictionaryRef v18 = v17;
  if (!CGSizeMakeWithDictionaryRepresentation(v17, &size)) {
    goto LABEL_45;
  }
  CGPoint v47 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  if (*(unsigned char *)(v7 + 244))
  {
    if (FigMotionComputeDistortionCenter(v9, (int)size.width, (int)size.height, *(_DWORD *)(v7 + 392), *(_DWORD *)(v7 + 396), (float64x2_t *)&v47, 1.0 / *(float *)(v7 + 376), 1.0))
    {
LABEL_45:
      FigDebugAssert3();
      return 0;
    }
    int v19 = (void *)[(__CFDictionary *)v9 objectForKeyedSubscript:*MEMORY[0x1E4F53E00]];
    LODWORD(v20) = 1.0;
    if (v19) {
      objc_msgSend(v19, "floatValue", v20);
    }
    uint64_t v21 = 0;
    uint64_t v22 = v7 + 248;
    uint64_t v23 = v7 + 312;
    float32x4_t v24 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v20, 0);
    do
    {
      *(float32x4_t *)&v51[v21] = vmlaq_f32(*(float32x4_t *)(v22 + v21 + 32), v24, *(float32x4_t *)(v23 + v21 + 32));
      *(float32x4_t *)&v50[v21] = vmlaq_f32(*(float32x4_t *)(v22 + v21), v24, *(float32x4_t *)(v23 + v21));
      v21 += 16;
    }
    while (v21 != 32);
  }
  CFTypeRef v25 = CMGetAttachment(target, @"OriginalCameraIntrinsicMatrix", 0);
  if (!v25) {
    goto LABEL_45;
  }
  CFTypeRef v26 = v25;
  int v44 = a3;
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, @"Depth");
  uint64_t v28 = (void *)CMGetAttachment(AttachedMedia, v8, 0);
  uint64_t v29 = *MEMORY[0x1E4F55870];
  if ([v28 objectForKeyedSubscript:*MEMORY[0x1E4F55870]])
  {
    uint64_t v30 = 1;
  }
  else if (*(unsigned char *)(v7 + 104))
  {
    uint64_t v30 = 1;
  }
  else
  {
    uint64_t v30 = v11;
  }
  v31 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v32 = [NSNumber numberWithInt:v14];
  [v31 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F558A8]];
  objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v30), v29);
  uint64_t v33 = [NSNumber numberWithInt:*(unsigned int *)(v7 + 240)];
  [v31 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F55860]];
  *(float *)&double v34 = *(float *)(v7 + 376) * 0.001;
  uint64_t v35 = [NSNumber numberWithFloat:v34];
  [v31 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F558A0]];
  [v31 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F55878]];
  [v31 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F55880]];
  uint64_t v36 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 + 176 length:64];
  [v31 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F55868]];
  if (*(unsigned char *)(v7 + 244))
  {
    [v31 setObject:CGPointCreateDictionaryRepresentation(v47) forKeyedSubscript:*MEMORY[0x1E4F55890]];
    uint64_t v37 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v51 length:32];
    [v31 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F55898]];
    uint64_t v38 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v50 length:32];
    [v31 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F55888]];
  }
  uint64_t v39 = [NSNumber numberWithInt:v13];
  [v31 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F558B0]];
  if (FigDepthRotateMetadataDictionary(v31, v44))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
  if (v11)
  {
    uint64_t v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(v7 + 512), "disparityQualityIsHigh"));
    [v31 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F558C0]];
    v41 = NSNumber;
    [*(id *)(v7 + 512) disparityQualityScore];
    uint64_t v42 = objc_msgSend(v41, "numberWithFloat:");
    [v31 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F558B8]];
  }
  long long v45 = *MEMORY[0x1E4F1DB20];
  long long v46 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v43 = *MEMORY[0x1E4F53240];
  if (FigCFDictionaryGetCGRectIfPresent())
  {
    FigCaptureMetadataUtilitiesUpdateDepthDataMetadataForStillImageCropAndScale(v31, *(double *)&v45, *((double *)&v45 + 1), *(double *)&v46, *((double *)&v46 + 1), 1.0);
    [v28 removeObjectForKey:v43];
  }
  return [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v31];
}

- (uint64_t)convertToFloatAndRotate:(uint64_t)a3 inputSampleBuffer:(__CVBuffer *)a4 outputPixelBuffer:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v19[0] = 0;
  v19[1] = 0;
  int v20 = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  uint64_t v9 = -[BWDepthConverterNode _computeConversionParametersFromSampleBuffer:convertOptionsOut:](a1, sbuf, (uint64_t)v19);
  if (v9)
  {
    uint64_t v17 = v9;
  }
  else
  {
    if (*(unsigned char *)(a1 + 128)
      || (unsigned __int8 Width = CVPixelBufferGetWidth(ImageBuffer),
          unsigned __int8 Height = CVPixelBufferGetHeight(ImageBuffer),
          char BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer),
          char v13 = CVPixelBufferGetWidth(a4),
          char v14 = CVPixelBufferGetHeight(a4),
          char v15 = CVPixelBufferGetBytesPerRow(a4),
          ((Width | Height) & 7) != 0)
      || (v13 & 7) != 0
      || (v14 & 7) != 0
      || (BytesPerRow & 0xF) != 0
      || (v15 & 0xF) != 0)
    {
      uint64_t v16 = -[BWDepthConverterNode _convertDepthDisparityToFloat_C:dst:options:](a1, ImageBuffer, a4, (uint64_t)v19);
    }
    else
    {
      uint64_t v16 = -[BWDepthConverterNode _convertDepthDisparityToFloat_NEON:dst:options:](a1, ImageBuffer, a4, (int *)v19);
    }
    uint64_t v17 = v16;
    if (!v16) {
      goto LABEL_14;
    }
  }
  FigDebugAssert3();
LABEL_14:
  if (*v7 == 1) {
    kdebug_trace();
  }
  return v17;
}

- (uint64_t)_convertDepthDisparityToFloat_NEON:(__CVBuffer *)a3 dst:(int *)a4 options:
{
  if (!a1) {
    return 0;
  }
  v6 = pixelBuffer;
  OSType v8 = CVPixelBufferGetPixelFormatType(pixelBuffer);
  size_t Width = CVPixelBufferGetWidth(v6);
  size_t Height = CVPixelBufferGetHeight(v6);
  size_t v11 = CVPixelBufferGetWidth(a3);
  size_t v12 = CVPixelBufferGetHeight(a3);
  size_t v14 = v12;
  int v15 = *a4;
  BOOL v16 = Width == v11 && Height == v12;
  int v17 = !v16;
  if (v15 != 1 || v17)
  {
    OSType pixelFormatType = v8;
    if ((v15 - 5) > 3)
    {
      size_t v19 = v12;
      size_t v18 = v11;
      if (!v17)
      {
LABEL_22:
        if (v15 == 1) {
          goto LABEL_30;
        }
LABEL_23:
        uint64_t v22 = *(__CVBuffer **)(a1 + 440);
        if (v22
          && CVPixelBufferGetWidth(v22) == v11
          && CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 440)) == v14
          && CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 440)) == pixelFormatType
          || (CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 440)),
              *(void *)(a1 + 440) = 0,
              uint64_t v23 = CVPixelBufferCreate(0, v11, v14, pixelFormatType, 0, (CVPixelBufferRef *)(a1 + 440)),
              !v23))
        {
          uint64_t v24 = FigDepthRotateBuffer(v6, *(__CVBuffer **)(a1 + 440), v15);
          if (!v24)
          {
            v6 = *(__CVBuffer **)(a1 + 440);
            goto LABEL_30;
          }
          uint64_t v25 = v24;
        }
        else
        {
          uint64_t v25 = v23;
        }
LABEL_36:
        FigDebugAssert3();
        return v25;
      }
    }
    else
    {
      size_t v18 = v12;
      BOOL v16 = Width == v12;
      size_t v19 = v11;
      if (v16)
      {
        size_t v19 = v11;
        size_t v18 = v12;
        if (Height == v11) {
          goto LABEL_23;
        }
      }
    }
    int v20 = *(__CVBuffer **)(a1 + 432);
    if (!v20
      || CVPixelBufferGetWidth(v20) != v18
      || CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 432)) != v19
      || CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 432)) != pixelFormatType)
    {
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 432));
      *(void *)(a1 + 432) = 0;
      uint64_t v21 = CVPixelBufferCreate(0, v18, v19, pixelFormatType, 0, (CVPixelBufferRef *)(a1 + 432));
      if (v21)
      {
        uint64_t v25 = v21;
        goto LABEL_36;
      }
    }
    FigDepthScaleBuffer(v6, *(__CVBuffer **)(a1 + 432));
    v6 = *(__CVBuffer **)(a1 + 432);
    goto LABEL_22;
  }
LABEL_30:
  uint64_t v25 = dcn_convertU16toFloatForImage_NEON(v6, a3, (uint64_t)a4, v13);
  if (v25) {
    goto LABEL_36;
  }
  return v25;
}

- (uint64_t)_convertDepthDisparityToFloat_C:(__CVBuffer *)a3 dst:(uint64_t)a4 options:
{
  if (!a1) {
    return 0;
  }
  v6 = pixelBuffer;
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(v6);
  size_t v10 = CVPixelBufferGetWidth(a3);
  size_t v11 = CVPixelBufferGetHeight(a3);
  unsigned int v12 = *(_DWORD *)a4 - 5;
  if (v12 >= 4) {
    size_t v13 = v10;
  }
  else {
    size_t v13 = v11;
  }
  size_t v59 = v11;
  size_t v60 = v10;
  if (v12 >= 4) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v10;
  }
  BOOL v15 = Width == v13 && Height == v14;
  if (!v15)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v6);
    int v17 = *(__CVBuffer **)(a1 + 432);
    if (!v17
      || CVPixelBufferGetWidth(v17) != v13
      || CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 432)) != v14
      || CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 432)) != PixelFormatType)
    {
      size_t v18 = *(const void **)(a1 + 432);
      if (v18)
      {
        CFRelease(v18);
        *(void *)(a1 + 432) = 0;
      }
      uint64_t v19 = CVPixelBufferCreate(0, v13, v14, PixelFormatType, 0, (CVPixelBufferRef *)(a1 + 432));
      if (v19)
      {
        uint64_t v50 = v19;
        goto LABEL_63;
      }
    }
    FigDepthScaleBuffer(v6, *(__CVBuffer **)(a1 + 432));
    v6 = *(__CVBuffer **)(a1 + 432);
  }
  uint64_t v20 = CVPixelBufferLockBaseAddress(v6, 1uLL);
  if (v20)
  {
    uint64_t v50 = v20;
LABEL_63:
    FigDebugAssert3();
    return v50;
  }
  uint64_t v21 = CVPixelBufferLockBaseAddress(a3, 0);
  if (v21)
  {
    uint64_t v50 = v21;
    FigDebugAssert3();
    v51 = v6;
    CVPixelBufferLockFlags v52 = 1;
  }
  else
  {
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v6);
    if (BaseAddress && (v23 = BaseAddress, (uint64_t v24 = (char *)CVPixelBufferGetBaseAddress(a3)) != 0))
    {
      uint64_t v25 = v24;
      size_t v57 = CVPixelBufferGetWidth(v6);
      size_t v26 = CVPixelBufferGetHeight(v6);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v6);
      int v61 = CVPixelBufferGetBytesPerRow(a3);
      OSType v28 = CVPixelBufferGetPixelFormatType(a3);
      uint64_t v29 = FigDepthBytesPerPixelForDepthFormat(v28);
      int v30 = *(_DWORD *)(a4 + 12);
      BOOL v31 = FigDepthFormatIsDepth(v28) && *(unsigned char *)(a4 + 16) == 0;
      uint64_t v32 = 0;
      float v34 = *(float *)(a4 + 4);
      float v33 = *(float *)(a4 + 8);
      int v35 = *(_DWORD *)a4;
      LODWORD(v36) = BytesPerRow;
      switch(*(_DWORD *)a4)
      {
        case 1:
          uint64_t v32 = 0;
          uint64_t v37 = 0;
          LODWORD(v36) = BytesPerRow;
          LODWORD(BytesPerRow) = 2;
          goto LABEL_38;
        case 2:
          goto LABEL_34;
        case 3:
        case 4:
          uint64_t v37 = 0;
          uint64_t v36 = -(uint64_t)BytesPerRow;
          uint64_t v32 = (v26 - 1) * BytesPerRow + 2 * v57 - 2;
          LODWORD(BytesPerRow) = -2;
          LODWORD(v38) = v29;
          BOOL v15 = v35 == 4;
          int v35 = -2;
          if (!v15) {
            goto LABEL_39;
          }
          goto LABEL_34;
        case 5:
        case 6:
          uint64_t v37 = 0;
          uint64_t v32 = (v26 - 1) * BytesPerRow;
          LODWORD(v36) = 2;
          size_t BytesPerRow = -(uint64_t)BytesPerRow;
          LODWORD(v38) = v29;
          BOOL v15 = v35 == 5;
          int v35 = BytesPerRow;
          if (!v15) {
            goto LABEL_39;
          }
          goto LABEL_34;
        case 7:
        case 8:
          uint64_t v32 = 2 * v57 - 2;
          LODWORD(v36) = -2;
          if (v35 == 7)
          {
            int v35 = BytesPerRow;
LABEL_34:
            uint64_t v38 = -v29;
            uint64_t v37 = (int)v29 * (v60 - 1);
            LODWORD(BytesPerRow) = v35;
          }
          else
          {
            uint64_t v37 = 0;
LABEL_38:
            LODWORD(v38) = v29;
          }
LABEL_39:
          if (v59)
          {
            v54 = a3;
            v55 = v6;
            uint64_t v39 = 0;
            uint64_t v40 = &v25[v37];
            v41 = &v23[v32];
            uint64_t v42 = (int)v38;
            uint64_t v56 = v61;
            uint64_t v58 = (int)v36;
            do
            {
              uint64_t v62 = v39;
              if (v60)
              {
                uint64_t v43 = 0;
                uint64_t v44 = 0;
                size_t v45 = v60;
                do
                {
                  unsigned int v46 = *(unsigned __int16 *)&v41[v43];
                  if (v46 == (unsigned __int16)v30)
                  {
                    if (v29 == 2) {
                      *(_WORD *)&v40[v44] = 0x7FFF;
                    }
                    else {
                      *(_DWORD *)&v40[v44] = 2143289344;
                    }
                  }
                  else
                  {
                    float v47 = fmaxf(v34 + (float)((float)v46 * v33), 0.0);
                    if (v31 && v47 != 0.0) {
                      float v47 = 1.0 / v47;
                    }
                    if (v29 == 2)
                    {
                      BOOL v48 = v31;
                      __int16 v49 = FigFloat32ConvertToFloat16();
                      BOOL v31 = v48;
                      *(_WORD *)&v40[v44] = v49;
                    }
                    else
                    {
                      *(float *)&v40[v44] = v47;
                    }
                  }
                  v44 += v42;
                  v43 += (int)BytesPerRow;
                  --v45;
                }
                while (v45);
              }
              v41 += v58;
              v40 += v56;
              uint64_t v39 = v62 + 1;
            }
            while (v62 + 1 != v59);
            uint64_t v50 = 0;
            a3 = v54;
            v6 = v55;
          }
          else
          {
            uint64_t v50 = 0;
          }
          break;
        default:
          LODWORD(v36) = 0;
          LODWORD(BytesPerRow) = 0;
          LODWORD(v38) = v29;
          uint64_t v37 = 0;
          goto LABEL_39;
      }
    }
    else
    {
      uint64_t v50 = FigSignalErrorAt();
    }
    CVPixelBufferUnlockBaseAddress(v6, 1uLL);
    v51 = a3;
    CVPixelBufferLockFlags v52 = 0;
  }
  CVPixelBufferUnlockBaseAddress(v51, v52);
  return v50;
}

- (uint64_t)_resolveFilteringTypeWithStillFilteringRequested:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 105))
  {
    if (*(unsigned char *)(a1 + 425)) {
      uint64_t v2 = 6;
    }
    else {
      uint64_t v2 = 0;
    }
    if (*(unsigned char *)(a1 + 425)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = a2 == 0;
    }
    if (!v3)
    {
      if (*(int *)(a1 + 520) <= 1) {
        return 4;
      }
      else {
        return 5;
      }
    }
  }
  else if (*(unsigned char *)(a1 + 104))
  {
    if (*(unsigned char *)(a1 + 106)) {
      return 3;
    }
    else {
      return 1;
    }
  }
  else
  {
    return 2 * (*(unsigned char *)(a1 + 106) != 0);
  }
  return v2;
}

- (uint64_t)filterDepthPixelBuffer:(__CVBuffer *)a3 outputDepthPixelBuffer:(CMSampleBufferRef)sbuf yuvImageSampleBuffer:(uint64_t)a5 depthSampleBuffer:(unsigned int)a6 filteringType:
{
  if (!a1) {
    return 0;
  }
  CMSampleBufferRef v8 = sbuf;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  CFTypeRef v12 = CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!a6) {
    return 4294954516;
  }
  size_t v13 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  unsigned int v52 = a6 - 4;
  if (a6 - 4 > 2)
  {
    uint64_t v19 = 0;
  }
  else
  {
    size_t v14 = (void *)v12;
    AttachedInference = (void *)BWInferenceGetAttachedInference(v8, 801, 0x1EFA6A0A0);
    if ([AttachedInference count]) {
      BOOL v16 = AttachedInference;
    }
    else {
      BOOL v16 = 0;
    }
    [*(id *)(a1 + 512) setFaceLandmarksArray:v16];
    uint64_t v17 = *MEMORY[0x1E4F53248];
    uint64_t v18 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v18, v17, CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F55BE8], 0), *MEMORY[0x1E4F55BE8], 0);
    if ((a6 & 0xFFFFFFFE) == 4)
    {
      uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(v8, 0x1EFA744E0);
      if (a6 == 5)
      {
        uint64_t v21 = BWSampleBufferGetAttachedMedia(v8, 0x1EFA6A200);
        id LowResPersonInstanceMasksFromSampleBuffer = BWInferenceGetLowResPersonInstanceMasksFromSampleBuffer(v8);
        uint64_t v50 = BWInferenceGetAttachedInference(v8, 104, 0x1EFA6A380);
      }
      else
      {
        uint64_t v50 = 0;
        id LowResPersonInstanceMasksFromSampleBuffer = 0;
        uint64_t v21 = 0;
      }
      if (AttachedMedia | v21)
      {
        if (AttachedMedia) {
          CVImageBufferRef v45 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
        }
        else {
          CVImageBufferRef v45 = 0;
        }
        CVImageBufferRef v49 = v45;
        if (v21)
        {
          CVImageBufferRef v48 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v21);
          goto LABEL_12;
        }
      }
      else
      {
        if (![LowResPersonInstanceMasksFromSampleBuffer count])
        {
          uint64_t v47 = v6;
          LODWORD(v46) = 0;
          FigDebugAssert3();
          uint64_t v23 = 4294954516;
          goto LABEL_50;
        }
        CVImageBufferRef v49 = 0;
      }
      CVImageBufferRef v48 = 0;
      goto LABEL_12;
    }
  }
  CVImageBufferRef v48 = 0;
  CVImageBufferRef v49 = 0;
  uint64_t v50 = 0;
  id LowResPersonInstanceMasksFromSampleBuffer = 0;
LABEL_12:
  uint64_t v22 = *(__CVBuffer **)(a1 + 456);
  if (v22 && (v54 = *(__CVBuffer **)(a1 + 464)) != 0)
  {
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      kdebug_trace();
      uint64_t v22 = *(__CVBuffer **)(a1 + 456);
      v54 = *(__CVBuffer **)(a1 + 464);
    }
    uint64_t v23 = FigDepthScaleBuffer(a2, v22);
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    if (v23)
    {
      uint64_t v47 = v6;
      LODWORD(v46) = v23;
      FigDebugAssert3();
LABEL_69:
      unsigned int v41 = a6 - 4;
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v22 = a2;
    v54 = a3;
  }
  if (a6 - 3 < 4 || a6 == 1)
  {
    int v24 = objc_msgSend((id)CMGetAttachment(ImageBuffer, @"RotationDegrees", 0), "intValue");
    int v25 = objc_msgSend((id)CMGetAttachment(ImageBuffer, @"MirroredVertical", 0), "BOOLValue");
    int v26 = objc_msgSend((id)CMGetAttachment(ImageBuffer, @"MirroredHorizontal", 0), "BOOLValue");
    long long v27 = ImageBuffer;
    OSType v28 = v8;
    uint64_t v29 = v19;
    int v30 = v26;
    int v31 = (int)FigCaptureNormalizeAngle(v24 - *(_DWORD *)(a1 + 384)) % 180;
    int v32 = v31 ? 0 : v25;
    int v33 = v31 == 90 ? v30 : 0;
    uint64_t v19 = v29;
    CMSampleBufferRef v8 = v28;
    int v34 = v32 | v33 ? v24 + 180 : v24;
    int v35 = FigCaptureNormalizeAngle(*(_DWORD *)(a1 + 384) - v34);
    uint64_t v36 = -[BWDepthConverterNode rotateAndScaleImagePixelBuffer:depthPixelBuffer:to:rotationAngle:flip:](a1, v27, v22, *(void *)(a1 + 472), v35);
    if (v36)
    {
      uint64_t v23 = v36;
      uint64_t v47 = v6;
      LODWORD(v46) = v36;
      FigDebugAssert3();
      size_t v13 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
      goto LABEL_69;
    }
  }
  uint64_t v37 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  size_t v13 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  if (a6 < 4 || a6 == 6)
  {
    uint64_t v38 = v54;
    int v39 = [*(id *)(a1 + 512) processDepthBuffer:v22 yuvBuffer:*(void *)(a1 + 472) parametersDictionary:v19 outputDisparityBuffer:v54];
  }
  else
  {
    uint64_t v43 = *(void **)(a1 + 512);
    uint64_t v44 = *(void *)(a1 + 472);
    if (a6 == 5)
    {
      uint64_t v38 = v54;
      int v39 = [v43 processDepthBuffer:v22 yuvBuffer:v44 personSegmentationMaskBuffer:v48 instanceSegmentationMaskBufferArray:LowResPersonInstanceMasksFromSampleBuffer instanceSegmentationConfidences:v50 parametersDictionary:v19 outputDisparityBuffer:v54];
    }
    else
    {
      uint64_t v38 = v54;
      int v39 = [v43 processDepthBuffer:v22 yuvBuffer:v44 rgbSegmentationMaskBuffer:v49 parametersDictionary:v19 outputDisparityBuffer:v54];
    }
  }
  int v40 = v39;
  unsigned int v41 = v52;
  if (*v37 == 1) {
    kdebug_trace();
  }
  if (v40)
  {
    uint64_t v23 = 4294954516;
  }
  else if (*(void *)(a1 + 456) && *(void *)(a1 + 464))
  {
    if (*v37 == 1) {
      kdebug_trace();
    }
    uint64_t v23 = FigDepthScaleBuffer(v38, a3);
    if (*v37 == 1) {
      kdebug_trace();
    }
    if (v23)
    {
      uint64_t v47 = v6;
      LODWORD(v46) = v23;
      FigDebugAssert3();
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
LABEL_49:
  if (v41 <= 2)
  {
LABEL_50:
    objc_msgSend(*(id *)(a1 + v13[104]), "setFaceLandmarksArray:", 0, v46, v47);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1EFA744E0);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1EFA74500);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1EFA6A200);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1EFA6A2E0);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1EFA6A300);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1EFA6A320);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1EFA6A340);
  }
  return v23;
}

- (uint64_t)_generateAndAttachUnfilteredDepthToSampleBuffer:(__CVBuffer *)a3 depthOutputPixelBuffer:(opaqueCMSampleBuffer *)a4 depthOutputSampleBuffer:
{
  if (!a1) {
    return 0;
  }
  CFTypeRef cf = 0;
  CMSampleBufferRef v8 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1EFA74340), "livePixelBufferPool"), "newPixelBuffer");
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  if (*(unsigned char *)(a1 + 105) || *(unsigned char *)(a1 + 104) || *(unsigned char *)(a1 + 106))
  {
    if (*(unsigned char *)(a1 + 488))
    {
      uint64_t v10 = FigDepthConvertBuffer(*(__CVBuffer **)(a1 + 448), v8);
      if (v10)
      {
        uint64_t CopyWithNewPixelBuffer = v10;
        goto LABEL_14;
      }
LABEL_12:
      uint64_t CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a4, v9, (CFTypeRef *)(a1 + 408), (CMSampleBufferRef *)&cf);
      if (!CopyWithNewPixelBuffer) {
        BWSampleBufferSetAttachedMedia(a2, 0x1EFA74340, (uint64_t)cf);
      }
      goto LABEL_14;
    }
    CFTypeRef v12 = *(OpaqueVTPixelTransferSession **)(a1 + 416);
    if (v12)
    {
      a3 = *(__CVBuffer **)(a1 + 448);
      goto LABEL_11;
    }
LABEL_18:
    uint64_t CopyWithNewPixelBuffer = 4294954510;
    goto LABEL_14;
  }
  CFTypeRef v12 = *(OpaqueVTPixelTransferSession **)(a1 + 416);
  if (!v12) {
    goto LABEL_18;
  }
LABEL_11:
  uint64_t CopyWithNewPixelBuffer = VTPixelTransferSessionTransferImage(v12, a3, v9);
  if (!CopyWithNewPixelBuffer) {
    goto LABEL_12;
  }
LABEL_14:
  CFRelease(v9);
  if (cf) {
    CFRelease(cf);
  }
  return CopyWithNewPixelBuffer;
}

- (uint64_t)rotateAndScaleImagePixelBuffer:(uint64_t)a1 depthPixelBuffer:(__CVBuffer *)a2 to:(CVPixelBufferRef)pixelBuffer rotationAngle:(uint64_t)a4 flip:(int)a5
{
  if (!a1) {
    return 0;
  }
  uint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!a2 || !pixelBuffer || !a4)
  {
    FigDebugAssert3();
    uint64_t v11 = FigSignalErrorAt();
    goto LABEL_9;
  }
  CVPixelBufferGetWidth(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  HIDWORD(v10) = -1527099483 * FigCaptureNormalizeAngle(-a5) + 47721858;
  LODWORD(v10) = HIDWORD(v10);
  if ((v10 >> 1) <= 0x2D82D82 || (FigDebugAssert3(), uint64_t v14 = FigSignalErrorAt(), !v14))
  {
    CVPixelBufferGetPixelFormatType(a2);
    uint64_t v11 = CMPhotoScaleAndRotateSessionTransformForMaxSideLength();
LABEL_9:
    uint64_t v12 = v11;
    goto LABEL_10;
  }
  uint64_t v12 = v14;
  FigDebugAssert3();
LABEL_10:
  if (*v9 == 1) {
    kdebug_trace();
  }
  return v12;
}

- (BOOL)streamingGDRFilteringEnabled
{
  return self->_streamingGDRFilteringEnabled;
}

- (BOOL)stillGDRFilteringSupportEnabled
{
  return self->_stillGDRFilteringSupportEnabled;
}

- (void)setStillGDRFilteringSupportEnabled:(BOOL)a3
{
  self->_stillGDRFilteringSupportEnabled = a3;
}

- (BOOL)streamingSMPFilteringEnabled
{
  return self->_streamingSMPFilteringEnabled;
}

- (int)baseRotationDegrees
{
  return self->_baseRotationDegrees;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (BOOL)mirroringEnabled
{
  return self->_mirroringEnabled;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (BOOL)providesUnfilteredDepthAsAttachedMedia
{
  return self->_providesUnfilteredDepthAsAttachedMedia;
}

- (BOOL)skipSmartStyleBuffer
{
  return self->_skipSmartStyleBuffer;
}

- (void)setSkipSmartStyleBuffer:(BOOL)a3
{
  self->_skipSmartStyleBuffer = a3;
}

@end