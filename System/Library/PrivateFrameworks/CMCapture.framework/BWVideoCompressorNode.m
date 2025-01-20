@interface BWVideoCompressorNode
+ (BWVideoFormatRequirements)_formatRequirementsForCompressionSettings:(void *)a3 maxVideoFrameRate:(_DWORD *)a4 retainedBufferCountHint:(int)a5 maxLossyCompressionLevel:;
+ (void)initialize;
- (BOOL)compressionDimensionsFromInputEnabled;
- (BOOL)prioritizeEncodingSpeedOverQuality;
- (BWVideoCompressorNode)initWithCompressionSettings:(id)a3 overCaptureEnabled:(BOOL)a4 stereoVideoCompressionEnabled:(BOOL)a5 maxVideoFrameRate:(float)a6 delayedCompressorCleanupEnabled:(BOOL)a7 maxLossyCompressionLevel:(int)a8;
- (OpaqueVTCompressionSession)_compresessionSession;
- (VTSessionRef)_createEncoderSessionWithWidth:(int32_t)a3 height:(uint64_t)a4 inputPixelFormat:(int)a5 isHDResolution:(CMVideoCodecType)codecType videoCodec:(CFDictionaryRef)encoderSpecification encoderSpecification:(void *)a8 compressionProperties:(void *)a9 compressorNodeRef:;
- (__CFString)alternateCompressionSettingsKey;
- (float)stereoVideoBaseline;
- (id)compressionPropertiesOverrides;
- (id)nodeSubType;
- (id)nodeType;
- (int)pipelineTraceID;
- (int64_t)maximumAllowedInFlightCompressedBytes;
- (uint64_t)_copyCompressionSessionProperty:(int)a3 requireSupported:(int *)a4 error:;
- (uint64_t)_setCompressionSessionProperty:(const void *)a3 value:(int)a4 requireSupported:;
- (uint64_t)_setEncoderCompressionPropertiesWithCompressionSession:(void *)a3 compressionProperties:(uint64_t)a4 sourcePixelType:(int)a5 isHDResolution:(int)a6 videoCodec:;
- (uint64_t)_updatePowerPressureLevel;
- (uint64_t)_updateThermalPressureLevel;
- (uint64_t)_verifyDimensions:(uint64_t)result;
- (void)_HDRImageStatisticsDictFromSampleBuffer:(void *)a3 metadata:;
- (void)_addStereoCompressionPropertiesToCompressionSettings:(int)a3 videoOrientation:;
- (void)_cleanCompressor:(uint64_t)a1;
- (void)_createCompressionSession;
- (void)_prepareForVideoCompression;
- (void)_registerForThermalAndPowerNotifications;
- (void)_releaseCompressionSession;
- (void)_scaleBitrateByFactor:(void *)result;
- (void)_validateBFrameEncodingAbility;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)insertKeyFrame;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAlternateCompressionSettingsKey:(__CFString *)a3;
- (void)setCompressionDimensionsFromInputEnabled:(BOOL)a3;
- (void)setCompressionPropertiesOverrides:(id)a3;
- (void)setMaximumAllowedInFlightCompressedBytes:(int64_t)a3;
- (void)setPipelineTraceID:(int)a3;
- (void)setPrioritizeEncodingSpeedOverQuality:(BOOL)a3;
- (void)setReapCompressionSessionTimerDurationInSeconds:(double)a3;
- (void)setStereoVideoBaseline:(float)a3;
- (void)suspendResources;
@end

@implementation BWVideoCompressorNode

- (id)nodeType
{
  return @"Converter";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", [a3 width]);
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", [a3 height]);
  v7 = FigCaptureEncodedByteStreamFormatForPixelFormat([a3 pixelFormat]);
  if (v7)
  {
    v11[0] = v7;
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
  }
  [(BWNodeOutput *)self->super._output setFormatRequirements:v6];

  if (self->_compressionDimensionsFromInputEnabled)
  {
    compressionSettings = self->_compressionSettings;
    if (compressionSettings) {
      v9 = (NSDictionary *)[(NSDictionary *)compressionSettings mutableCopy];
    }
    else {
      v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v10 = v9;
    -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a3, "width")), @"AVVideoWidthKey");
    -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a3, "height")), @"AVVideoHeightKey");

    self->_compressionSettings = v10;
  }
  -[BWVideoCompressorNode _verifyDimensions:]((uint64_t)self, a3);
}

- (uint64_t)_verifyDimensions:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [a2 width];
    [a2 height];
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 96), "objectForKeyedSubscript:", @"AVVideoWidthKey"), "unsignedIntegerValue");
    v4 = (void *)[*(id *)(v3 + 96) objectForKeyedSubscript:@"AVVideoHeightKey"];
    return [v4 unsignedIntegerValue];
  }
  return result;
}

- (void)setPipelineTraceID:(int)a3
{
  self->_pipelineTraceID = a3;
}

- (void)setMaximumAllowedInFlightCompressedBytes:(int64_t)a3
{
  self->_maximumAllowedInFlightCompressedBytes = a3;
  if (a3 >= 0) {
    int64_t v3 = a3;
  }
  else {
    int64_t v3 = a3 + 1;
  }
  self->_inFlightCompressedBytesWarningThreshold = v3 >> 1;
}

+ (BWVideoFormatRequirements)_formatRequirementsForCompressionSettings:(void *)a3 maxVideoFrameRate:(_DWORD *)a4 retainedBufferCountHint:(int)a5 maxLossyCompressionLevel:
{
  self;
  if (a4)
  {
    *a4 = (int)(float)((float)((float)(a1 * 60.0) / 1000.0) + 3.0);
    if (a3)
    {
      *a4 += objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVVideoHEVCLookaheadFrames"), "intValue");
      int v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVVideoHEVCExtraRetainedBufferCount"), "intValue");
      *a4 += objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CVPixelBufferRecyclingSlop"), "intValue")+ v9;
    }
  }
  v10 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v10 setWidthAlignment:16];
  [(BWVideoFormatRequirements *)v10 setHeightAlignment:16];
  [(BWVideoFormatRequirements *)v10 setBytesPerRowAlignment:64];
  [(BWVideoFormatRequirements *)v10 setPlaneAlignment:64];
  [(BWVideoFormatRequirements *)v10 setSupportedCacheModes:&unk_1EFB03AE8];
  v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v11, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 1, a5));
  objc_msgSend(v11, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(1, 1, 1, 0));
  [v11 addObjectsFromArray:&unk_1EFB03B00];
  [(BWVideoFormatRequirements *)v10 setSupportedPixelFormats:v11];
  return v10;
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

- (BWVideoCompressorNode)initWithCompressionSettings:(id)a3 overCaptureEnabled:(BOOL)a4 stereoVideoCompressionEnabled:(BOOL)a5 maxVideoFrameRate:(float)a6 delayedCompressorCleanupEnabled:(BOOL)a7 maxLossyCompressionLevel:(int)a8
{
  BOOL v11 = a5;
  if (a5 && !VTIsStereoMVHEVCEncodeSupported()) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Stereo video compression requested on system that doesn't support it" userInfo:0]);
  }
  v30.receiver = self;
  v30.super_class = (Class)BWVideoCompressorNode;
  id v15 = [(BWNode *)&v30 init];
  if (v15)
  {
    v16 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v15];
    *((unsigned char *)v15 + 247) = a4;
    *((unsigned char *)v15 + 281) = v11;
    *((float *)v15 + 63) = a6;
    if (a3)
    {
      *((void *)v15 + 12) = [a3 copy];
      a6 = *((float *)v15 + 63);
    }
    unsigned int v29 = 0;
    [(BWNodeInput *)v16 setFormatRequirements:+[BWVideoCompressorNode _formatRequirementsForCompressionSettings:maxVideoFrameRate:retainedBufferCountHint:maxLossyCompressionLevel:](a6, (uint64_t)BWVideoCompressorNode, a3, &v29, a8)];
    [(BWNodeInput *)v16 setRetainedBufferCount:v29];
    *((unsigned char *)v15 + 113) = 0;
    *((_DWORD *)v15 + 29) = 81;
    v17 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v17 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v17 setPassthroughMode:0];
    [(BWNodeInput *)v16 setUnspecifiedAttachedMediaConfiguration:v17];
    [v15 addInput:v16];

    if (v11)
    {
      v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v18, "setFormatRequirements:", [*((id *)v15 + 1) formatRequirements]);
      -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v18, "setRetainedBufferCount:", [*((id *)v15 + 1) retainedBufferCount]);
      [*((id *)v15 + 1) setMediaConfiguration:v18 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
    }
    v19 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v15];
    v20 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v19 setFormatRequirements:v20];
    [(BWNodeOutput *)v19 setProvidesPixelBufferPool:0];

    [v15 addOutput:v19];
    *((void *)v15 + 18) = FigDispatchQueueCreateWithPriority();
    *((void *)v15 + 19) = FigDispatchQueueCreateWithPriority();
    *((unsigned char *)v15 + 176) = !v11;
    if (!v11)
    {
      *((void *)v15 + 21) = 0x4014000000000000;
      v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v15 + 19));
      *((void *)v15 + 20) = v21;
      dispatch_source_set_timer(v21, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      id v22 = +[FigWeakReference weakReferenceToObject:v15];
      v23 = *((void *)v15 + 20);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __177__BWVideoCompressorNode_initWithCompressionSettings_overCaptureEnabled_stereoVideoCompressionEnabled_maxVideoFrameRate_delayedCompressorCleanupEnabled_maxLossyCompressionLevel___block_invoke;
      handler[3] = &unk_1E5C24430;
      handler[4] = v22;
      dispatch_source_set_event_handler(v23, handler);
      dispatch_activate(*((dispatch_object_t *)v15 + 20));
    }
    *((void *)v15 + 26) = 0x405E000000000000;
    *((void *)v15 + 25) = FigDispatchQueueCreateWithPriority();
    *((void *)v15 + 34) = [[BWLimitedGMErrorLogger alloc] initWithName:@"Video Compressor" maxLoggingCount:40];
    *((unsigned char *)v15 + 246) = 1;
    *((unsigned char *)v15 + 320) = a7;
    v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", 0x1EFA73FA0, 0x1EFA73FC0, 0x1EFA73BE0, *MEMORY[0x1E4F55D38], *MEMORY[0x1E4F55D40], 0x1EFA73C80, *MEMORY[0x1E4F55CF0], 0x1EFA733C0, *MEMORY[0x1E4F55CE8], *MEMORY[0x1E4F55CC8], 0);
    v25 = v24;
    if (*((unsigned char *)v15 + 247)) {
      [v24 addObject:0x1EFA40A00];
    }
    *((void *)v15 + 41) = [v25 copy];
    uint64_t v26 = MEMORY[0x1E4F1F9F8];
    *((_OWORD *)v15 + 21) = *MEMORY[0x1E4F1F9F8];
    *((void *)v15 + 44) = *(void *)(v26 + 16);
  }
  return (BWVideoCompressorNode *)v15;
}

uint64_t __177__BWVideoCompressorNode_initWithCompressionSettings_overCaptureEnabled_stereoVideoCompressionEnabled_maxVideoFrameRate_delayedCompressorCleanupEnabled_maxLossyCompressionLevel___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) referencedObject];
  return [v1 _releaseCompressionSession];
}

- (void)dealloc
{
  reapCompressionSessionTimer = self->_reapCompressionSessionTimer;
  if (reapCompressionSessionTimer)
  {
    dispatch_source_cancel(reapCompressionSessionTimer);

    self->_reapCompressionSessionTimer = 0;
  }

  self->_compressionSessionStateQueue = 0;
  if (self->_compressionSession)
  {
    [(BWVideoCompressorNode *)self _releaseCompressionSession];
    self->_didPrepareToEncode = 0;
  }
  self->_encodedFirstVideoBuffer = 0;
  self->_emittedFirstVideoBuffer = 0;

  self->_compressionSettings = 0;
  self->_stereoTaggedCollections = 0;
  thumbnailSourcePixelBuffer = self->_thumbnailSourcePixelBuffer;
  if (thumbnailSourcePixelBuffer) {
    CFRelease(thumbnailSourcePixelBuffer);
  }

  self->_emitterQueue = 0;
  self->_thermalAndPowerNotificationQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)BWVideoCompressorNode;
  [(BWNode *)&v5 dealloc];
}

- (void)_cleanCompressor:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 120))
    {
      if (a2 && *(unsigned char *)(a1 + 177))
      {
        int64_t v3 = *(NSObject **)(a1 + 160);
        dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 168) * 1000000000.0));
        dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else
      {
        [(id)a1 _releaseCompressionSession];
      }
      *(unsigned char *)(a1 + 136) = 0;
    }
    *(unsigned char *)(a1 + 193) = 0;
    *(unsigned char *)(a1 + 194) = 0;
  }
}

- (id)nodeSubType
{
  return @"VideoCompressor";
}

- (void)_registerForThermalAndPowerNotifications
{
  if (a1)
  {
    v2 = (const char *)*MEMORY[0x1E4F14918];
    int64_t v3 = *(NSObject **)(a1 + 200);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke;
    handler[3] = &unk_1E5C25910;
    handler[4] = a1;
    notify_register_dispatch(v2, (int *)(a1 + 228), v3, handler);
    dispatch_time_t v4 = *(NSObject **)(a1 + 200);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_2;
    v7[3] = &unk_1E5C25910;
    v7[4] = a1;
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)(a1 + 236), v4, v7);
    objc_super v5 = *(NSObject **)(a1 + 200);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_3;
    block[3] = &unk_1E5C24430;
    block[4] = a1;
    dispatch_sync(v5, block);
  }
}

- (void)suspendResources
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoCompressorNode;
  [(BWNode *)&v3 suspendResources];
  -[BWVideoCompressorNode _cleanCompressor:]((uint64_t)self, 1);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (a4)
  {
    if (self->_compressionDimensionsFromInputEnabled)
    {
      compressionSettings = self->_compressionSettings;
      if (compressionSettings) {
        v10 = (NSDictionary *)[(NSDictionary *)compressionSettings mutableCopy];
      }
      else {
        v10 = (NSDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "init"), "alloc");
      }
      BOOL v11 = v10;
      -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a4, "width")), @"AVVideoWidthKey");
      -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a4, "height")), @"AVVideoHeightKey");

      self->_compressionSettings = v11;
    }
    -[BWVideoCompressorNode _verifyDimensions:]((uint64_t)self, a4);
    unint64_t v12 = [a4 width];
    unint64_t v13 = [a4 height];
    BOOL v14 = v12 >= 0x3C0 && v13 > 0x21B || v12 > 0x21B && v13 > 0x3BF;
    self->_sourceIsHDResolution = v14;
    self->_sourcePixelFormatType = [a4 pixelFormat];
  }
  v16.receiver = self;
  v16.super_class = (Class)BWVideoCompressorNode;
  [(BWNode *)&v16 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int thermalPressureNotificationToken = self->_thermalPressureNotificationToken;
  if (thermalPressureNotificationToken)
  {
    notify_cancel(thermalPressureNotificationToken);
    thermalAndPowerNotificationQueue = self->_thermalAndPowerNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_sync(thermalAndPowerNotificationQueue, block);
  }
  int powerPressureNotificationToken = self->_powerPressureNotificationToken;
  if (powerPressureNotificationToken)
  {
    notify_cancel(powerPressureNotificationToken);
    v7 = self->_thermalAndPowerNotificationQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_2;
    v13[3] = &unk_1E5C24430;
    v13[4] = self;
    dispatch_sync(v7, v13);
  }
  reapCompressionSessionTimer = self->_reapCompressionSessionTimer;
  if (reapCompressionSessionTimer) {
    dispatch_source_set_timer(reapCompressionSessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  compressionSessionStateQueue = self->_compressionSessionStateQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_3;
  v12[3] = &unk_1E5C24430;
  v12[4] = self;
  dispatch_sync(compressionSessionStateQueue, v12);
  [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
  emitterQueue = self->_emitterQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_4;
  v11[3] = &unk_1E5C24430;
  v11[4] = self;
  dispatch_async(emitterQueue, v11);
}

uint64_t __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 228) = 0;
  return result;
}

uint64_t __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 236) = 0;
  return result;
}

OpaqueVTCompressionSession *__51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_3(uint64_t a1)
{
  result = *(OpaqueVTCompressionSession **)(*(void *)(a1 + 32) + 120);
  if (result)
  {
    CMTime v4 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    result = (OpaqueVTCompressionSession *)VTCompressionSessionCompleteFrames(result, &v4);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      if (*(void *)(v3 + 120))
      {
        result = (OpaqueVTCompressionSession *)[(id)v3 _releaseCompressionSession];
        *(unsigned char *)(v3 + 136) = 0;
      }
      *(unsigned char *)(v3 + 193) = 0;
      *(unsigned char *)(v3 + 194) = 0;
    }
  }
  return result;
}

uint64_t __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) markEndOfLiveOutput];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  v6 = a3;
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F53070];
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  memset(&v130, 0, sizeof(v130));
  CMSampleBufferGetPresentationTimeStamp(&v130, v6);
  int v129 = 0;
  int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8])
  {
    CMSampleBufferGetPresentationTimeStamp(&time, v6);
    CMTimeGetSeconds(&time);
    FigCFDictionaryGetIntIfPresent();
    if (*v9 == 1)
    {
      [(BWVideoCompressorNode *)self pipelineTraceID];
      kdebug_trace();
    }
  }
  target = v6;
  if (!v6)
  {
    uint64_t v101 = v4;
    LODWORD(p_lhs) = 0;
    goto LABEL_168;
  }
  if (!a4)
  {
    uint64_t v101 = v4;
    LODWORD(p_lhs) = 0;
    goto LABEL_168;
  }
  CFTypeRef v10 = CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E4F1F288], 0);
  BOOL v11 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (v10 == (CFTypeRef)*MEMORY[0x1E4F1CFD0]) {
    self->_nextFrameEncodeAsKeyFrame = 1;
  }
  if (!CMSampleBufferGetDataBuffer(v6) && !CMSampleBufferGetImageBuffer(v6))
  {
    CFTypeRef v53 = CMGetAttachment(v6, @"FileWriterAction", 0);
    if ((byte_1EB4C50A0 & 0x20) != 0)
    {
      v54 = (void *)CMGetAttachment(v6, @"RecordingSettings", 0);
      if (v54) {
        [v54 settingsID];
      }
    }
    v55 = &OBJC_INSTANCE_METHODS_FigWeakReference;
    if (!v53) {
      goto LABEL_154;
    }
    int v56 = CFEqual(v53, @"Stop");
    int v57 = CFEqual(v53, @"Pause");
    int v58 = CFEqual(v53, @"Terminate");
    int v59 = CFEqual(v53, @"Flush");
    int v60 = CFEqual(v53, @"Start");
    int v61 = CFEqual(v53, @"StreamForcedOff");
    if (v56 | v59) {
      CMSetAttachment(v6, @"FramesDroppedDueToFormatWriterQueueFull", (CFTypeRef)[NSNumber numberWithInt:self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight], 1u);
    }
    v55 = &OBJC_INSTANCE_METHODS_FigWeakReference;
    if (v57 || v56 || v58 || v59 || v61)
    {
      compressionSession = self->_compressionSession;
      if (compressionSession)
      {
        CMTime completeUntilPresentationTimeStamp = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
        VTCompressionSessionCompleteFrames(compressionSession, &completeUntilPresentationTimeStamp);
      }
      if (v56 || v58 || v59)
      {
        compressionSessionStateQueue = self->_compressionSessionStateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke;
        block[3] = &unk_1E5C24430;
        block[4] = self;
        dispatch_sync(compressionSessionStateQueue, block);
      }
      [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
    }
    int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (v60)
    {
      v64 = (void *)CMGetAttachment(v6, @"RecordingVideoSettings", 0);
      id v65 = v64;
      if (self->_alternateCompressionSettingsKey) {
        id v65 = (id)objc_msgSend(v64, "objectForKeyedSubscript:");
      }
      if (v65 && ([v65 isEqualToDictionary:self->_compressionSettings] & 1) == 0)
      {
        if (self->_compressionDimensionsFromInputEnabled)
        {
          id v65 = (id)[v65 mutableCopy];
          objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[BWVideoFormat width](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "width")), @"AVVideoWidthKey");
          objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[BWVideoFormat height](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "height")), @"AVVideoHeightKey");
          v66 = v65;
        }
        else
        {
          v66 = 0;
        }

        self->_stereoTaggedCollections = 0;
        if (self->_stereoVideoCompressionEnabled)
        {
          v55 = &OBJC_INSTANCE_METHODS_FigWeakReference;
          if (self->_stereoVideoBaseline <= 0.0)
          {
            uint64_t v101 = v4;
            LODWORD(p_lhs) = 0;
            FigDebugAssert3();
            LOBYTE(v77) = 1;
            int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_169:
            uint64_t v79 = FigSignalErrorAt();
            CFDictionaryRef v78 = 0;
            CFDictionaryRef v86 = 0;
            if (!v79)
            {
LABEL_123:

              BWSampleBufferRemoveAllAttachedMedia(target);
              if (v77) {
                goto LABEL_157;
              }
              goto LABEL_124;
            }
LABEL_122:
            [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:v79, @"when rendering", p_lhs, v101 errorString];
            CFDictionaryRef v86 = v78;
            goto LABEL_123;
          }
          if (!v66)
          {
            id v65 = (id)[v65 mutableCopy];
            v66 = v65;
          }
          int v93 = objc_msgSend((id)CMGetAttachment(v6, @"RecordingSettings", 0), "videoOrientation");
          -[BWVideoCompressorNode _addStereoCompressionPropertiesToCompressionSettings:videoOrientation:]((uint64_t)self, v66, v93);
        }
        else
        {
          v55 = &OBJC_INSTANCE_METHODS_FigWeakReference;
        }

        self->_compressionSettings = (NSDictionary *)[v65 copy];
        [(BWVideoCompressorNode *)(uint64_t)self _verifyDimensions:[(BWNodeOutput *)self->super._output videoFormat]];
        int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      }
      v94 = (void *)CMGetAttachment(v6, @"RecordingSettings", 0);
      if ([v94 sendPreviewIOSurface]) {
        self->_attachThumbnailSourcePixelBuffer = 1;
      }
      if (([(__CFString *)self->_alternateCompressionSettingsKey isEqualToString:0x1EFA73200] & 1) != 0
        || ([(__CFString *)self->_alternateCompressionSettingsKey isEqualToString:0x1EFA73220] & 1) != 0
        || [(__CFString *)self->_alternateCompressionSettingsKey isEqualToString:0x1EFA73240])
      {
        char v95 = [v94 smartStyleReversibilitySupported] ^ 1;
      }
      else
      {
        char v95 = 0;
      }
      if (!self->_didPrepareToEncode && (v95 & 1) == 0) {
        -[BWVideoCompressorNode _prepareForVideoCompression]((uint64_t)self);
      }
      self->_nextFrameEncodeAsKeyFrame = 1;
    }
    if (v59) {
      self->_flushRequestReceived = 1;
    }
    if (v60 && self->_compressionSession)
    {
      uint64_t v96 = *MEMORY[0x1E4F44930];
      v91 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:]((uint64_t)self, (const __CFString *)*MEMORY[0x1E4F44930], 0, 0);
      uint64_t v97 = *MEMORY[0x1E4F44938];
      v92 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:]((uint64_t)self, (const __CFString *)*MEMORY[0x1E4F44938], 0, 0);
      v98 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      objc_msgSend(v98, "setObject:forKeyedSubscript:", (id)objc_msgSend(v91, "copy"), v96);
      objc_msgSend(v98, "setObject:forKeyedSubscript:", (id)objc_msgSend(v92, "copy"), v97);
      if ([v98 count]) {
        CMSetAttachment(v6, @"TemporalScalabilityProperties", (id)[v98 copy], 1u);
      }
      int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    }
    else
    {
LABEL_154:
      v92 = 0;
      v91 = 0;
    }
    CFRetain(v6);
    emitterQueue = self->_emitterQueue;
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = v55[80];
    v126[2] = __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_2;
    v126[3] = &unk_1E5C24F10;
    v126[4] = self;
    v126[5] = v6;
    dispatch_async(emitterQueue, v126);
    CFDictionaryRef v78 = 0;
    goto LABEL_156;
  }
  unint64_t v12 = self->_compressionSession;
  if (!self->_flushRequestReceived)
  {
    if (!v12)
    {
      uint64_t v101 = v4;
      LODWORD(p_lhs) = 0;
      goto LABEL_168;
    }
    goto LABEL_14;
  }
  if (v12)
  {
LABEL_14:
    if (!self->_didPrepareToEncode)
    {
      uint64_t v101 = v4;
      LODWORD(p_lhs) = 0;
      FigDebugAssert3();
      LOBYTE(v77) = 0;
      goto LABEL_169;
    }
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v6);
    if (!ImageBuffer)
    {
      uint64_t v101 = v4;
      LODWORD(p_lhs) = 0;
      goto LABEL_168;
    }
    CVImageBufferRef v14 = ImageBuffer;
    CFTypeRef v108 = v11;
    if (self->_stereoVideoCompressionEnabled)
    {
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v6, @"SynchronizedSlaveFrame");
      if (!AttachedMedia)
      {
        uint64_t v101 = v4;
        LODWORD(p_lhs) = 0;
        goto LABEL_168;
      }
      objc_super v16 = AttachedMedia;
      CVImageBufferRef v106 = CMSampleBufferGetImageBuffer(AttachedMedia);
      if (!v106)
      {
        uint64_t v101 = v4;
        LODWORD(p_lhs) = 0;
LABEL_168:
        FigDebugAssert3();
        LOBYTE(v77) = 0;
        goto LABEL_169;
      }
    }
    else
    {
      objc_super v16 = 0;
      CVImageBufferRef v106 = 0;
    }
    v104 = v16;
    if (self->_maximumAllowedInFlightCompressedBytes && self->_encodedFirstVideoBuffer)
    {
      int64_t v17 = +[BWBufferometer totalTrackedSizeInFlight];
      BOOL v18 = v17 > self->_inFlightCompressedBytesWarningThreshold;
      if (self->_inFlightCompressedBytesOverWarningThreshold != v18) {
        self->_inFlightCompressedBytesOverWarningThreshold = v18;
      }
      if (v17 > self->_maximumAllowedInFlightCompressedBytes)
      {
        ++self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight;
        LODWORD(rhs.value) = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        LOBYTE(v77) = 0;
        CFDictionaryRef v78 = 0;
        uint64_t v79 = 4294954510;
        goto LABEL_122;
      }
    }
    if (self->_attachThumbnailSourcePixelBuffer)
    {
      self->_attachThumbnailSourcePixelBuffer = 0;
      self->_thumbnailSourcePixelBuffer = (__CVBuffer *)CFRetain(v14);
    }
    CFDictionaryRef v20 = (const __CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFDictionaryRef v77 = v20;
    CFTypeRef v21 = v108;
    if (!v20)
    {
      uint64_t v101 = v4;
      LODWORD(p_lhs) = 0;
      FigDebugAssert3();
      goto LABEL_169;
    }
    if (self->_nextFrameEncodeAsKeyFrame)
    {
      self->_nextFrameEncodeAsKeyFrame = 0;
      [(__CFDictionary *)v20 setObject:v108 forKeyedSubscript:*MEMORY[0x1E4F44ED8]];
    }
    if (CMGetAttachment(v6, @"FinalFrameInSequence", 0) == v108) {
      [(__CFDictionary *)v77 setObject:v108 forKeyedSubscript:*MEMORY[0x1E4F44EB8]];
    }
    id v22 = (void *)CMGetAttachment(v6, v8, 0);
    CFDictionaryRef frameProperties = v77;
    CFStringRef key = v8;
    if (self->_propagateStabilizedFacesToAVE)
    {
      CFTypeRef v23 = CMGetAttachment(v6, @"DetectedFacesArrayHasBeenStabilized", 0);
      v24 = (void *)[v22 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
      v25 = (void *)v23;
      CFTypeRef v21 = v108;
      if ([v25 BOOLValue])
      {
        if ([v24 count])
        {
          v102 = v14;
          v103 = self;
          uint64_t v26 = (void *)[MEMORY[0x1E4F1CA48] array];
          memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
          CMSampleBufferGetPresentationTimeStamp(&completeUntilPresentationTimeStamp, v6);
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          obuint64_t j = v24;
          uint64_t v27 = [v24 countByEnumeratingWithState:&v121 objects:v136 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v122;
            uint64_t v30 = *MEMORY[0x1E4F53900];
            uint64_t v31 = *MEMORY[0x1E4F54348];
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v122 != v29) {
                  objc_enumerationMutation(obj);
                }
                v33 = *(void **)(*((void *)&v121 + 1) + 8 * i);
                id v34 = (id)[v33 mutableCopy];
                memset(&lhs, 0, sizeof(lhs));
                objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", v30), "longLongValue");
                int64_t v35 = FigHostTimeToNanoseconds();
                CMTimeMake(&v120, v35, 1000000000);
                CMTimeConvertScale(&lhs, &v120, completeUntilPresentationTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", lhs.value), v30);
                objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", v31), "longLongValue");
                int64_t v36 = FigHostTimeToNanoseconds();
                CMTimeMake(&v118, v36, 1000000000);
                CMTimeConvertScale(&rhs, &v118, completeUntilPresentationTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                CMTime lhs = rhs;
                objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", rhs.value), v31);
                [v26 addObject:v34];
              }
              uint64_t v28 = [obj countByEnumeratingWithState:&v121 objects:v136 count:16];
            }
            while (v28);
          }
          CFDictionaryRef v77 = frameProperties;
          [(__CFDictionary *)frameProperties setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F44F78]];
          CVImageBufferRef v14 = v102;
          self = v103;
          int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
          CFTypeRef v21 = v108;
        }
      }
    }
    v37 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v6, 0x1EFA74940);
    if (v37) {
      [(__CFDictionary *)v77 setObject:CMSampleBufferGetImageBuffer(v37) forKeyedSubscript:*MEMORY[0x1E4F44F30]];
    }
    if (self->_resetCodec) {
      [(__CFDictionary *)v77 setObject:v21 forKeyedSubscript:@"ResetRCState"];
    }
    v38 = -[BWVideoCompressorNode _HDRImageStatisticsDictFromSampleBuffer:metadata:]((uint64_t)self, (uint64_t)v6, v22);
    if (v38) {
      [(__CFDictionary *)v77 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F44EF0]];
    }
    CFDictionaryRef v39 = CVBufferCopyAttachments(v14, kCVAttachmentMode_ShouldPropagate);
    if (v39) {
      CFTypeRef v40 = CFAutorelease(v39);
    }
    else {
      CFTypeRef v40 = 0;
    }
    if (BWColorSpacePropertiesIsHDR(+[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:v40]))
    {
      CFTypeRef v41 = CVBufferCopyAttachment(v14, (CFStringRef)*MEMORY[0x1E4F249F0], 0);
      if (v41)
      {
        CFTypeRef v42 = CFAutorelease(v41);
        if (v42) {
          [(__CFDictionary *)v77 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F44DD0]];
        }
      }
    }
    CVImageBufferRef v43 = v14;
    CFAllocatorRef v44 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime completeUntilPresentationTimeStamp = v130;
    CFDictionaryRef v45 = CMTimeCopyAsDictionary(&completeUntilPresentationTimeStamp, v44);
    [v22 setObject:v45 forKeyedSubscript:@"VideoCompressorNodeAttachedPTS"];

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    smuggledSampleBufferAttachments = self->_smuggledSampleBufferAttachments;
    uint64_t v47 = [(NSArray *)smuggledSampleBufferAttachments countByEnumeratingWithState:&v114 objects:v135 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v115;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v115 != v49) {
            objc_enumerationMutation(smuggledSampleBufferAttachments);
          }
          objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(target, *(CFStringRef *)(*((void *)&v114 + 1) + 8 * j), 0), *(void *)(*((void *)&v114 + 1) + 8 * j));
        }
        uint64_t v48 = [(NSArray *)smuggledSampleBufferAttachments countByEnumeratingWithState:&v114 objects:v135 count:16];
      }
      while (v48);
    }
    v6 = target;
    CVImageBufferRef v51 = v43;
    if (self->_shouldAttachDebugSEI)
    {
      CMSetAttachment(v43, key, v22, 1u);
      if (self->_stereoVideoCompressionEnabled)
      {
        if (CMGetAttachment(v104, key, 0)) {
          uint64_t v52 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
        }
        else {
          uint64_t v52 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        v67 = (void *)v52;
        uint64_t v68 = *MEMORY[0x1E4F530C0];
        CFTypeRef v69 = CMGetAttachment(v104, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
        if (v69) {
          [v67 setObject:v69 forKeyedSubscript:v68];
        }
        CMSetAttachment(v106, key, v67, 1u);
        CVImageBufferRef v51 = v43;
      }
    }
    if (self->_bFrameEncodingAllowed) {
      -[BWVideoCompressorNode _validateBFrameEncodingAbility]((uint64_t)self);
    }
    memset(&v113, 0, sizeof(v113));
    CMSampleBufferGetDuration(&v113, target);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(v51, @"MirroredHorizontal", 0), @"MirroredHorizontal");
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(v51, @"MirroredVertical", 0), @"MirroredVertical");
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(v51, @"RotationDegrees", 0), 0x1EFA56D20);
    if (!self->_encodedFirstVideoBuffer)
    {
      self->_encodedFirstVideoBuffer = 1;
      if (dword_1EB4C50B0)
      {
        v70 = v9;
        LODWORD(rhs.value) = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int value = rhs.value;
        if (os_log_type_enabled(v71, type)) {
          unsigned int v73 = value;
        }
        else {
          unsigned int v73 = value & 0xFFFFFFFE;
        }
        if (v73)
        {
          v74 = [(BWNode *)self name];
          CMTime completeUntilPresentationTimeStamp = v130;
          Float64 Seconds = CMTimeGetSeconds(&completeUntilPresentationTimeStamp);
          int64_t maximumAllowedInFlightCompressedBytes = self->_maximumAllowedInFlightCompressedBytes;
          LODWORD(lhs.value) = 136315906;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[BWVideoCompressorNode renderSampleBuffer:forInput:]";
          LOWORD(lhs.flags) = 2112;
          *(void *)((char *)&lhs.flags + 2) = v74;
          HIWORD(lhs.epoch) = 2048;
          Float64 v132 = Seconds;
          __int16 v133 = 2048;
          int64_t v134 = maximumAllowedInFlightCompressedBytes;
          LODWORD(v101) = 42;
          p_CMTime lhs = &lhs;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v9 = v70;
        v6 = target;
        CVImageBufferRef v51 = v43;
      }
    }
    id v80 = v22;
    memset(&v112, 0, sizeof(v112));
    BWGetOriginalPresentationTimeStampFromBuffer(v6, (uint64_t)&v112);
    p_previousFrameOriginalPTS = &self->_previousFrameOriginalPTS;
    if (self->_previousFrameOriginalPTS.flags)
    {
      memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
      CMTime lhs = v112;
      *(_OWORD *)&rhs.unsigned int value = *(_OWORD *)&p_previousFrameOriginalPTS->value;
      rhs.epoch = self->_previousFrameOriginalPTS.epoch;
      CMTimeSubtract(&completeUntilPresentationTimeStamp, &lhs, &rhs);
      CMTime lhs = completeUntilPresentationTimeStamp;
      objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", CMTimeGetSeconds(&lhs)), *MEMORY[0x1E4F54140]);
    }
    *(_OWORD *)&p_previousFrameOriginalPTS->unsigned int value = *(_OWORD *)&v112.value;
    self->_previousFrameOriginalPTS.epoch = v112.epoch;
    if (self->_stereoVideoCompressionEnabled)
    {
      v82 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v51, v106, 0);
      rhs.unsigned int value = 0;
      uint64_t v79 = MEMORY[0x1A6270330](v44, self->_stereoTaggedCollections, v82, &rhs);
      if (v79 || !rhs.value)
      {

        [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:v79 errorString:@"could not create stereo tagged buffer group"];
        CFDictionaryRef v78 = frameProperties;
      }
      else
      {
        v83 = self->_compressionSession;
        CMTime completeUntilPresentationTimeStamp = v130;
        CMTime lhs = v113;
        CFDictionaryRef v78 = frameProperties;
        uint64_t v79 = VTCompressionSessionEncodeMultiImageFrame(v83, (CMTaggedBufferGroupRef)rhs.value, &completeUntilPresentationTimeStamp, &lhs, frameProperties, v22, 0);
        if (v79) {
      }
        }
      if (rhs.value) {
        CFRelease((CFTypeRef)rhs.value);
      }

      if (v79) {
        goto LABEL_121;
      }
    }
    else
    {
      v84 = self->_compressionSession;
      CMTime completeUntilPresentationTimeStamp = v130;
      CMTime lhs = v113;
      CFDictionaryRef v78 = frameProperties;
      uint64_t v85 = VTCompressionSessionEncodeFrame(v84, v51, &completeUntilPresentationTimeStamp, &lhs, frameProperties, v22, 0);
      if (v85)
      {
        uint64_t v79 = v85;

LABEL_121:
        LOBYTE(v77) = 0;
        goto LABEL_122;
      }
    }
    v91 = 0;
    v92 = 0;
    self->_resetCodec = 0;
LABEL_156:

    BWSampleBufferRemoveAllAttachedMedia(v6);
    goto LABEL_157;
  }
  BWSampleBufferRemoveAllAttachedMedia(v6);
LABEL_124:
  if (self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight <= 0) {
    v87 = (uint64_t *)BWDroppedSampleReasonVideoCompressionFailure;
  }
  else {
    v87 = &BWDroppedSampleReasonVideoCompressionFormatWriterQueueFull;
  }
  uint64_t v88 = *v87;
  CMTime completeUntilPresentationTimeStamp = v130;
  id v89 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", v88, &completeUntilPresentationTimeStamp, p_lhs);
  v90 = self->_emitterQueue;
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_67;
  v111[3] = &unk_1E5C24458;
  v111[4] = self;
  v111[5] = v89;
  dispatch_async(v90, v111);
LABEL_157:
  if (*v9 == 1)
  {
    [(BWVideoCompressorNode *)self pipelineTraceID];
    kdebug_trace();
  }
}

void __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
}

- (void)_addStereoCompressionPropertiesToCompressionSettings:(int)a3 videoOrientation:
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a2 objectForKeyedSubscript:@"AVVideoCompressionPropertiesKey"]) {
      id v6 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"AVVideoCompressionPropertiesKey"), "mutableCopy");
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v7 = v6;
    [a2 setObject:v6 forKeyedSubscript:@"AVVideoCompressionPropertiesKey"];
    BOOL v11 = a3 == 4;
    BOOL v8 = a3 == 4;
    uint64_t v9 = !v11;
    CMTag tags = CMTagMakeWithSInt64Value(kCMTagCategory_VideoLayerID, 0);
    CMTag v21 = CMTagMakeWithSInt64Value(kCMTagCategory_VideoLayerID, 1);
    CMTagCollectionRef v19 = 0;
    CMTagCollectionRef newCollectionOut = 0;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (!CMTagCollectionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &tags, 1, &newCollectionOut))
    {
      BOOL v11 = CMTagCollectionCreate(v10, &v21, 1, &v19) || newCollectionOut == 0;
      if (!v11 && v19 != 0)
      {
        v24[0] = newCollectionOut;
        v24[1] = v19;
        *(void *)(a1 + 288) = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
        uint64_t v13 = (float)(*(float *)(a1 + 368) * 1000.0);
        [v7 setObject:&unk_1EFB03B18 forKeyedSubscript:*MEMORY[0x1E4F449A0]];
        [v7 setObject:&unk_1EFB03B18 forKeyedSubscript:*MEMORY[0x1E4F449A8]];
        v23[0] = [NSNumber numberWithInt:v9];
        v23[1] = [NSNumber numberWithInt:v8];
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F44998]];
        uint64_t v15 = *MEMORY[0x1E4F1CFD0];
        [v7 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F44950]];
        [v7 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F44958]];
        [v7 setObject:*MEMORY[0x1E4F21690] forKeyedSubscript:*MEMORY[0x1E4F44AA8]];
        uint64_t v16 = [NSNumber numberWithUnsignedInt:v13];
        [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F44B20]];
        uint64_t v17 = [NSNumber numberWithInt:200];
        [v7 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F44968]];
        uint64_t v18 = [NSNumber numberWithUnsignedInt:63400];
        [v7 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F44970]];
      }
    }

    if (newCollectionOut) {
      CFRelease(newCollectionOut);
    }
    if (v19) {
      CFRelease(v19);
    }
  }
}

- (void)_prepareForVideoCompression
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 160);
    if (v2) {
      dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    uint64_t v3 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__BWVideoCompressorNode__prepareForVideoCompression__block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = a1;
    dispatch_sync(v3, block);
  }
}

- (uint64_t)_copyCompressionSessionProperty:(int)a3 requireSupported:(int *)a4 error:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t propertyValueOut = 0;
    if (*(void *)(result + 120) && (id v6 = *(void **)(result + 128)) != 0 && a2)
    {
      if ([v6 objectForKeyedSubscript:a2])
      {
        int v9 = VTSessionCopyProperty(*(VTSessionRef *)(v5 + 120), a2, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], &propertyValueOut);
        if (!a4) {
          return propertyValueOut;
        }
      }
      else
      {
        if (a3) {
          int v9 = -12787;
        }
        else {
          int v9 = 0;
        }
        if (!a4) {
          return propertyValueOut;
        }
      }
    }
    else
    {
      FigDebugAssert3();
      int v9 = FigSignalErrorAt();
      if (!a4) {
        return propertyValueOut;
      }
    }
    *a4 = v9;
    return propertyValueOut;
  }
  return result;
}

void __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) emitSampleBuffer:*(void *)(a1 + 40)];
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

- (void)_HDRImageStatisticsDictFromSampleBuffer:(void *)a3 metadata:
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  if (a2)
  {
    if (a3)
    {
      uint64_t v4 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F53F28]];
      uint64_t v3 = v4;
      if (v4)
      {
        uint64_t v5 = *MEMORY[0x1E4F53A28];
        uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F53A28]];
        v7 = (void *)MEMORY[0x1E4F53A20];
        BOOL v8 = (void *)MEMORY[0x1E4F24B60];
        int v9 = (void *)MEMORY[0x1E4F53A18];
        CFAllocatorRef v10 = (void *)MEMORY[0x1E4F24B58];
        BOOL v11 = (void *)MEMORY[0x1E4F53A08];
        unint64_t v12 = (void *)MEMORY[0x1E4F24B50];
        uint64_t v13 = (void *)MEMORY[0x1E4F24B48];
        if (v6)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", *v7), *v8);
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", *v9), *v10);
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", *v11), *v12);
          uint64_t v15 = (void *)MEMORY[0x1E4F24BF8];
          [(id)v14 setObject:*MEMORY[0x1E4F24BF8] forKeyedSubscript:*v13];
          uint64_t v16 = (void *)[v3 objectForKeyedSubscript:v5];
          uint64_t v17 = (void *)MEMORY[0x1E4F539F8];
          uint64_t v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F539F8]];
          CMTagCollectionRef v19 = (void *)MEMORY[0x1E4F44FA8];
          [(id)v14 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F44FA8]];
          CFDictionaryRef v20 = (void *)[v3 objectForKeyedSubscript:v5];
          CMTag v21 = (void *)MEMORY[0x1E4F53A00];
          uint64_t v22 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F53A00]];
          CFTypeRef v23 = (void *)MEMORY[0x1E4F44FB0];
          [(id)v14 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F44FB0]];
        }
        else
        {
          uint64_t v15 = (void *)MEMORY[0x1E4F24BF8];
          uint64_t v17 = (void *)MEMORY[0x1E4F539F8];
          CMTagCollectionRef v19 = (void *)MEMORY[0x1E4F44FA8];
          CMTag v21 = (void *)MEMORY[0x1E4F53A00];
          CFTypeRef v23 = (void *)MEMORY[0x1E4F44FB0];
          uint64_t v14 = 0;
        }
        uint64_t v24 = *MEMORY[0x1E4F53A10];
        if ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F53A10]])
        {
          uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v26 = (void *)[v3 objectForKeyedSubscript:v24];
          uint64_t v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F53A20]];
          [(id)v25 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F24B60]];
          uint64_t v28 = (void *)[v3 objectForKeyedSubscript:v24];
          uint64_t v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F53A18]];
          [(id)v25 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F24B58]];
          uint64_t v30 = (void *)[v3 objectForKeyedSubscript:v24];
          uint64_t v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F53A08]];
          [(id)v25 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F24B50]];
          [(id)v25 setObject:*v15 forKeyedSubscript:*MEMORY[0x1E4F24B48]];
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v24), "objectForKeyedSubscript:", *v17), *v19);
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v24), "objectForKeyedSubscript:", *v21), *v23);
        }
        else
        {
          uint64_t v25 = 0;
        }
        if (v14 | v25)
        {
          uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F24B40]];
          [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F24B38]];
          return v3;
        }
        return 0;
      }
    }
  }
  return v3;
}

- (void)_validateBFrameEncodingAbility
{
  if (!a1 || !*(unsigned char *)(a1 + 244)) {
    return;
  }
  FigMemoryBarrier();
  int v2 = *(_DWORD *)(a1 + 232);
  int v3 = *(_DWORD *)(a1 + 240);
  double v4 = *(double *)(a1 + 216);
  if (v4 != 0.0)
  {
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    if (v4 > CMTimeGetSeconds(&time))
    {
      int v6 = 30;
      goto LABEL_8;
    }
    *(void *)(a1 + 216) = 0;
  }
  int v6 = 20;
LABEL_8:
  BOOL v8 = v2 < v6 && v3 < v6;
  *(unsigned char *)(a1 + 245) = v8;
  if (!*(unsigned char *)(a1 + 245))
  {
    if (-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](a1, (const __CFString *)*MEMORY[0x1E4F447D0], MEMORY[0x1E4F1CC28], 1))FigDebugAssert3(); {
    if (*(_DWORD *)(a1 + 224))
    }
    {
      if (-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](a1, (const __CFString *)*MEMORY[0x1E4F44810], (const void *)objc_msgSend(NSNumber, "numberWithInt:"), 1))FigDebugAssert3(); {
    }
      }
  }
}

void __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_67(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) emitDroppedSample:*(void *)(a1 + 40)];
  int v2 = *(void **)(a1 + 40);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  emitterQueue = self->_emitterQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__BWVideoCompressorNode_handleDroppedSample_forInput___block_invoke;
  v5[3] = &unk_1E5C24458;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(emitterQueue, v5);
}

uint64_t __54__BWVideoCompressorNode_handleDroppedSample_forInput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) emitDroppedSample:*(void *)(a1 + 40)];
}

- (void)insertKeyFrame
{
  self->_nextFrameEncodeAsKeyFrame = 1;
  __dmb(0xBu);
}

void *__52__BWVideoCompressorNode__prepareForVideoCompression__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 120))
  {
    if (*(unsigned char *)(v2 + 177))
    {
      int v3 = [*(id *)(v2 + 96) isEqualToDictionary:*(void *)(v2 + 104)];
      double v4 = *(unsigned char **)(a1 + 32);
      if (v3)
      {
        v4[136] = 1;
        *(unsigned char *)(*(void *)(a1 + 32) + 250) = 0;
        *(unsigned char *)(*(void *)(a1 + 32) + 178) = 1;
      }
      else
      {
        [v4 _releaseCompressionSession];
      }
    }
    else
    {
      [*(id *)(v2 + 272) logErrorNumber:0xFFFFFFFFLL, @"unexpectedly already have un-re-usable compression session, will continue to use" errorString];
    }
  }
  result = *(void **)(a1 + 32);
  if (!result[15])
  {
    return -[BWVideoCompressorNode _createCompressionSession](result);
  }
  return result;
}

- (void)_createCompressionSession
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    if (result[15])
    {
      return (void *)FigSignalErrorAt();
    }
    else
    {
      uint64_t v2 = (void *)result[12];
      if (v2)
      {
        id v3 = (id)[v2 objectForKeyedSubscript:@"AVVideoCodecKey"];
        *(void *)(v1 + 296) = v3;
        if (v3) {
          CMVideoCodecType v4 = BWOSTypeForString(v3);
        }
        else {
          CMVideoCodecType v4 = 0;
        }
        uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", @"AVVideoWidthKey"), "unsignedIntegerValue");
        uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", @"AVVideoHeightKey"), "unsignedIntegerValue");
        CFDictionaryRef v7 = (const __CFDictionary *)[*(id *)(v1 + 96) objectForKeyedSubscript:@"AVVideoEncoderSpecificationKey"];
        result = (void *)[*(id *)(v1 + 96) objectForKeyedSubscript:@"AVVideoCompressionPropertiesKey"];
        BOOL v8 = result;
        if (*(void *)(v1 + 360))
        {
          if (result) {
            int v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:result];
          }
          else {
            int v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          }
          BOOL v8 = v9;
          result = (void *)[v9 setValuesForKeysWithDictionary:*(void *)(v1 + 360)];
        }
        if (v5) {
          BOOL v10 = v6 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10 && v4 != 0)
        {
          *(void *)(v1 + 120) = -[BWVideoCompressorNode _createEncoderSessionWithWidth:height:inputPixelFormat:isHDResolution:videoCodec:encoderSpecification:compressionProperties:compressorNodeRef:]((VTSessionRef)v1, v5, v6, *(unsigned int *)(v1 + 140), *(unsigned __int8 *)(v1 + 137), v4, v7, v8, (void *)v1);
          *(unsigned char *)(v1 + 245) = 0;
          *(unsigned char *)(v1 + 244) = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"AllowFrameReordering"), "BOOLValue");
          if (*(unsigned char *)(v1 + 244))
          {
            unint64_t v12 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:](v1, (const __CFString *)*MEMORY[0x1E4F447D0], 0, 0);
            *(unsigned char *)(v1 + 244) = [v12 BOOLValue];
          }
          *(_DWORD *)(v1 + 224) = 0;
          if (*(unsigned char *)(v1 + 244))
          {
            uint64_t v13 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:](v1, (const __CFString *)*MEMORY[0x1E4F44810], 0, 0);
            [v13 floatValue];
            *(_DWORD *)(v1 + 224) = (int)(v14 * 1.15);

            if (*(double *)(v1 + 208) == 0.0)
            {
              double v16 = 0.0;
            }
            else
            {
              HostTimeClock = CMClockGetHostTimeClock();
              CMClockGetTime(&time, HostTimeClock);
              double v16 = CMTimeGetSeconds(&time) + *(double *)(v1 + 208);
            }
            *(double *)(v1 + 216) = v16;
            -[BWVideoCompressorNode _validateBFrameEncodingAbility](v1);
          }
          *(unsigned char *)(v1 + 248) = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"DebugMetadataSEI"), "BOOLValue");
          if (*(unsigned char *)(v1 + 248) && dword_1EB4C50B0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          *(unsigned char *)(v1 + 249) = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"PassSerializedDepthImageBuffers", v23, v24), "BOOLValue");
          VTCompressionSessionPrepareToEncodeFrames(*(VTCompressionSessionRef *)(v1 + 120));
          *(unsigned char *)(v1 + 136) = 1;
          *(unsigned char *)(v1 + 250) = 0;
          result = (void *)[*(id *)(v1 + 96) copy];
          *(void *)(v1 + 104) = result;
          char v18 = *(unsigned char *)(v1 + 176);
          if (v18)
          {
            result = (void *)[*(id *)(v1 + 296) isEqualToString:@"hvc1"];
            if (result) {
              char v18 = *(unsigned char *)(v1 + 320) != 0;
            }
            else {
              char v18 = 0;
            }
          }
          *(unsigned char *)(v1 + 177) = v18;
          if (*(unsigned char *)(v1 + 113))
          {
            result = (void *)-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](v1, (const __CFString *)*MEMORY[0x1E4F44A90], MEMORY[0x1E4F1CC38], 1);
            double v19 = 1.1;
            if (!*(unsigned char *)(v1 + 113)) {
              double v19 = 1.0;
            }
            BOOL v20 = *(unsigned __int8 *)(v1 + 247) == 0;
          }
          else
          {
            if (!*(unsigned char *)(v1 + 247)) {
              return result;
            }
            BOOL v20 = 0;
            double v19 = 1.0;
          }
          if (!v20) {
            double v19 = v19 + 0.2;
          }
          if (v19 > 1.0) {
            return -[BWVideoCompressorNode _scaleBitrateByFactor:]((void *)v1, v19);
          }
        }
      }
      else
      {
        FigDebugAssert3();
        result = (void *)FigSignalErrorAt();
        if (result)
        {
          CMTag v21 = result;
          uint64_t v22 = *(void **)(v1 + 272);
          return (void *)[v22 logErrorNumber:v21 errorString:@"preparing"];
        }
      }
    }
  }
  return result;
}

- (void)setPrioritizeEncodingSpeedOverQuality:(BOOL)a3
{
  self->_prioritizeEncodingSpeedOverQuality = a3;
}

- (BOOL)prioritizeEncodingSpeedOverQuality
{
  return self->_prioritizeEncodingSpeedOverQuality;
}

- (int)pipelineTraceID
{
  return self->_pipelineTraceID;
}

- (void)setCompressionDimensionsFromInputEnabled:(BOOL)a3
{
  self->_compressionDimensionsFromInputEnabled = a3;
}

- (BOOL)compressionDimensionsFromInputEnabled
{
  return self->_compressionDimensionsFromInputEnabled;
}

- (void)setStereoVideoBaseline:(float)a3
{
  self->_stereoVideoBaseline = a3;
}

- (float)stereoVideoBaseline
{
  return self->_stereoVideoBaseline;
}

- (void)setAlternateCompressionSettingsKey:(__CFString *)a3
{
  self->_alternateCompressionSettingsKey = a3;
}

- (__CFString)alternateCompressionSettingsKey
{
  return self->_alternateCompressionSettingsKey;
}

- (int64_t)maximumAllowedInFlightCompressedBytes
{
  return self->_maximumAllowedInFlightCompressedBytes;
}

- (void)setCompressionPropertiesOverrides:(id)a3
{
  self->_compressionPropertiesOverrides = (NSDictionary *)a3;
}

- (id)compressionPropertiesOverrides
{
  return self->_compressionPropertiesOverrides;
}

- (OpaqueVTCompressionSession)_compresessionSession
{
  return self->_compressionSession;
}

- (void)_releaseCompressionSession
{
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    if (self->_maximumAllowedInFlightCompressedBytes)
    {
      self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight = 0;
      self->_inFlightCompressedBytesOverWarningThreshold = 0;
    }
    VTCompressionSessionInvalidate(compressionSession);
    CFRelease(self->_compressionSession);
    self->_compressionSession = 0;

    self->_compressionSessionSupportedProperties = 0;
    self->_compressionSessionCanBeReused = 0;

    self->_compressionSettingsPreparedFor = 0;
    self->_codecNameString = 0;
  }
}

- (VTSessionRef)_createEncoderSessionWithWidth:(int32_t)a3 height:(uint64_t)a4 inputPixelFormat:(int)a5 isHDResolution:(CMVideoCodecType)codecType videoCodec:(CFDictionaryRef)encoderSpecification encoderSpecification:(void *)a8 compressionProperties:(void *)a9 compressorNodeRef:
{
  if (result)
  {
    uint64_t v14 = (uint64_t)result;
    VTSessionRef session = 0;
    uint64_t v15 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, a3, codecType, encoderSpecification, 0, 0, (VTCompressionOutputCallback)vcn_encoderCallback, a9, (VTCompressionSessionRef *)&session);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v20 = v9;
      LODWORD(outputCallbackRefCon) = v15;
    }
    else
    {
      uint64_t v16 = VTSessionCopySupportedPropertyDictionary(session, (CFDictionaryRef *)(v14 + 128));
      if (v16)
      {
        uint64_t v18 = v16;
        uint64_t v20 = v9;
        LODWORD(outputCallbackRefCon) = v16;
      }
      else
      {
        uint64_t v17 = -[BWVideoCompressorNode _setEncoderCompressionPropertiesWithCompressionSession:compressionProperties:sourcePixelType:isHDResolution:videoCodec:](v14, session, a8, a4, a5, codecType);
        if (!v17) {
          return session;
        }
        uint64_t v18 = v17;
        uint64_t v20 = v9;
        LODWORD(outputCallbackRefCon) = v17;
      }
    }
    FigDebugAssert3();
    objc_msgSend(*(id *)(v14 + 272), "logErrorNumber:errorString:", v18, @"creating compression session", outputCallbackRefCon, v20);
    return session;
  }
  return result;
}

- (uint64_t)_setCompressionSessionProperty:(const void *)a3 value:(int)a4 requireSupported:
{
  if (result)
  {
    uint64_t v4 = result;
    if (*(void *)(result + 120) && (uint64_t v5 = *(void **)(result + 128)) != 0 && a2)
    {
      if ([v5 objectForKeyedSubscript:a2])
      {
        uint64_t v9 = *(const void **)(v4 + 120);
        return VTSessionSetProperty(v9, a2, a3);
      }
      else if (a4)
      {
        return 4294954509;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  return result;
}

- (void)_scaleBitrateByFactor:(void *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F44810];
    result = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:]((uint64_t)result, (const __CFString *)*MEMORY[0x1E4F44810], 0, 0);
    if (result)
    {
      uint64_t v5 = result;
      [result doubleValue];
      uint64_t v7 = (int)(v6 * a2);

      result = (void *)-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](v3, v4, (const void *)[NSNumber numberWithInt:v7], 1);
    }
    int v8 = *(_DWORD *)(v3 + 224);
    if (v8 >= 1) {
      *(_DWORD *)(v3 + 224) = (int)((double)v8 * a2);
    }
  }
  return result;
}

uint64_t __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke(uint64_t a1)
{
  return -[BWVideoCompressorNode _updateThermalPressureLevel](*(void *)(a1 + 32));
}

- (uint64_t)_updateThermalPressureLevel
{
  if (result)
  {
    uint64_t v1 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    result = *(unsigned int *)(v1 + 228);
    if (result)
    {
      uint64_t state64 = 0;
      result = notify_get_state(result, &state64);
      if (*(_DWORD *)(v1 + 232) != state64)
      {
        *(_DWORD *)(v1 + 232) = state64;
        return FigMemoryBarrier();
      }
    }
  }
  return result;
}

uint64_t __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_2(uint64_t a1)
{
  return -[BWVideoCompressorNode _updatePowerPressureLevel](*(void *)(a1 + 32));
}

- (uint64_t)_updatePowerPressureLevel
{
  if (result)
  {
    uint64_t v1 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    result = *(unsigned int *)(v1 + 236);
    if (result)
    {
      uint64_t state64 = 0;
      result = notify_get_state(result, &state64);
      if (*(_DWORD *)(v1 + 240) != state64)
      {
        *(_DWORD *)(v1 + 240) = state64;
        return FigMemoryBarrier();
      }
    }
  }
  return result;
}

uint64_t __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_3(uint64_t a1)
{
  -[BWVideoCompressorNode _updateThermalPressureLevel](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  return -[BWVideoCompressorNode _updatePowerPressureLevel](v2);
}

- (uint64_t)_setEncoderCompressionPropertiesWithCompressionSession:(void *)a3 compressionProperties:(uint64_t)a4 sourcePixelType:(int)a5 isHDResolution:(int)a6 videoCodec:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  BOOL v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = [a3 count];
  unint64_t v12 = (uint64_t *)MEMORY[0x1E4F44BB0];
  if (v11)
  {
    int v46 = a6;
    int v47 = a5;
    unsigned int v48 = a4;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v13 = (void *)[a3 allKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          double v19 = *(void **)(a1 + 128);
          uint64_t v20 = [a3 objectForKeyedSubscript:v18];
          if ([v19 objectForKeyedSubscript:v18]) {
            [v10 setObject:v20 forKeyedSubscript:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v15);
    }
    uint64_t v21 = *MEMORY[0x1E4F44868];
    uint64_t v22 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F44868]];
    BOOL v23 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F44B58]] != 0;
    unint64_t v12 = (uint64_t *)MEMORY[0x1E4F44BB0];
    BOOL v24 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F44BB0]] != 0;
    if (v22)
    {
      a5 = v47;
      a4 = v48;
      a6 = v46;
      goto LABEL_18;
    }
    a5 = v47;
    a4 = v48;
    a6 = v46;
  }
  else
  {
    BOOL v24 = 0;
    BOOL v23 = 0;
    uint64_t v21 = *MEMORY[0x1E4F44868];
  }
  if ([*(id *)(a1 + 128) objectForKeyedSubscript:v21]) {
    [v10 setObject:*MEMORY[0x1E4F24AB0] forKeyedSubscript:v21];
  }
LABEL_18:
  if (v23) {
    goto LABEL_31;
  }
  if (a6 <= 1634743415)
  {
    if (a6 == 1634742376 || a6 == 1634742888) {
      goto LABEL_31;
    }
    unsigned __int16 v25 = 13416;
  }
  else
  {
    if ((a6 - 1634755432) <= 0xB && ((1 << (a6 - 104)) & 0x8C1) != 0
      || (a6 - 1634759272) <= 6 && ((1 << (a6 - 104)) & 0x51) != 0)
    {
      goto LABEL_31;
    }
    unsigned __int16 v25 = 13432;
  }
  if (a6 != (v25 | 0x61700000))
  {
    uint64_t v26 = *MEMORY[0x1E4F44B58];
    if ([*(id *)(a1 + 128) objectForKeyedSubscript:*MEMORY[0x1E4F44B58]]) {
      [v10 setObject:*MEMORY[0x1E4F24BE0] forKeyedSubscript:v26];
    }
  }
LABEL_31:
  if (!v24)
  {
    int IsFullRange = FigCapturePixelFormatIsFullRange(a4);
    uint64_t v28 = *v12;
    if ([*(id *)(a1 + 128) objectForKeyedSubscript:*v12])
    {
      if (a5) {
        int v29 = IsFullRange;
      }
      else {
        int v29 = 1;
      }
      if (v29) {
        uint64_t v30 = *MEMORY[0x1E4F24C40];
      }
      else {
        uint64_t v30 = *MEMORY[0x1E4F24C48];
      }
      [v10 setObject:v30 forKeyedSubscript:v28];
    }
  }
  uint64_t v31 = *MEMORY[0x1E4F44900];
  if ([*(id *)(a1 + 128) objectForKeyedSubscript:*MEMORY[0x1E4F44900]]) {
    [v10 setObject:&unk_1EFB007D0 forKeyedSubscript:v31];
  }
  v32 = (uint64_t *)MEMORY[0x1E4F44980];
  if (a4)
  {
    v33 = *(void **)(a1 + 128);
    uint64_t v34 = *MEMORY[0x1E4F44980];
    uint64_t v35 = [NSNumber numberWithUnsignedInt:a4];
    if ([v33 objectForKeyedSubscript:v34]) {
      [v10 setObject:v35 forKeyedSubscript:v34];
    }
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  int64_t v36 = (void *)[v10 allKeys];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (!v37) {
    return 0;
  }
  uint64_t v38 = v37;
  uint64_t v39 = 0;
  uint64_t v40 = *(void *)v53;
  uint64_t v49 = *v32;
  do
  {
    for (uint64_t j = 0; j != v38; ++j)
    {
      if (*(void *)v53 != v40) {
        objc_enumerationMutation(v36);
      }
      CFTypeRef v42 = *(__CFString **)(*((void *)&v52 + 1) + 8 * j);
      uint64_t v43 = VTSessionSetProperty(a2, v42, (CFTypeRef)[v10 objectForKeyedSubscript:v42]);
      if (v43)
      {
        uint64_t v44 = v43;
        if (v43 != -12900 || ([(__CFString *)v42 isEqualToString:v49] & 1) == 0)
        {
          [*(id *)(a1 + 272) logErrorNumber:v44, objc_msgSend(NSString, "stringWithFormat:", @"Failed to set encoder session property %@ with %@", v42, objc_msgSend(v10, "objectForKeyedSubscript:", v42)) errorString];
          uint64_t v39 = v44;
        }
      }
    }
    uint64_t v38 = [v36 countByEnumeratingWithState:&v52 objects:v60 count:16];
  }
  while (v38);
  return v39;
}

- (void)setReapCompressionSessionTimerDurationInSeconds:(double)a3
{
  self->_reapCompressionSessionTimerDurationInFloat64 Seconds = a3;
}

@end