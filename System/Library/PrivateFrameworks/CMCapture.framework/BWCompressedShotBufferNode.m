@interface BWCompressedShotBufferNode
+ (void)initialize;
- (BOOL)_hasQueuedCompressedBuffers;
- (BOOL)compressionResourcesAllocated;
- (BOOL)hasUncompressedEquivalentFreeBufferCount:(int)a3;
- (BOOL)passthroughEnabled;
- (BWCompressedShotBufferNode)initWithNodeConfiguration:(id)a3 compressionInputDimensions:(id)a4;
- (BWNodeInput)sensorRawInput;
- (BWNodeOutput)sensorRawOutput;
- (BWPixelBufferPool)_setupDecompressionPool;
- (CMAttachmentBearerRef)_newCompressedSampleBufferFromUncompressedSampleBuffer:(CMAttachmentBearerRef)result;
- (CMSampleBufferRef)_newSampleBufferFromDecompressionPoolWithCopyOfSampleBuffer:(CMSampleBufferRef)result;
- (CMVideoFormatDescriptionRef)_copyCompressedFormatDescriptionForUncompressedSampleBuffer:(CMVideoFormatDescriptionRef)result;
- (id)freeBufferCountIncreasedHandler;
- (id)nodeSubType;
- (id)nodeType;
- (int)minimumUncompressedEquivalentCapacity;
- (int)uncompressedEquivalentCapacity;
- (uint64_t)_compressedByteCapacity;
- (uint64_t)_inUseCompressedBufferCount;
- (uint64_t)_inUseCompressedBytes;
- (uint64_t)_newCompressionSession;
- (uint64_t)_newDecompressedSampleBufferFromCompressedSampleBuffer:(uint64_t)a1;
- (uint64_t)_shouldPassthroughSampleBuffer:(uint64_t)a3 forInput:;
- (uint64_t)_updateCompressedByteCapacity;
- (void)_asyncOnDecompressionQueue:(uint64_t)a1;
- (void)_compressionOptionsWithCropRect:(CGFloat)a3;
- (void)_decompressionWork;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)flushAndWaitForUncompressedEquivalentFreeBufferCount:(int)a3;
- (void)flushAndWaitUntilThreshold:(int)a3;
- (void)getInUseCompressedBufferCount:(int *)a3 inUseCompressedBytes:(int64_t *)a4 maxInUseCompressedBytes:(int64_t *)a5 forUncompressedEquivalentFreeBufferCount:(int)a6;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setFreeBufferCountIncreasedHandler:(id)a3;
- (void)setUncompressedEquivalentCapacity:(int)a3;
@end

@implementation BWCompressedShotBufferNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
  [v5 setFormat:a3];
}

- (id)nodeType
{
  return @"Effect";
}

- (BWNodeOutput)sensorRawOutput
{
  return self->_sensorRawOutput;
}

- (BWNodeInput)sensorRawInput
{
  return self->_sensorRawInput;
}

- (BWCompressedShotBufferNode)initWithNodeConfiguration:(id)a3 compressionInputDimensions:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)BWCompressedShotBufferNode;
  v6 = [(BWNode *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_bufferTrackingLock._os_unfair_lock_opaque = 0;
    v6->_uncompressedEquivalentCapacity = 11;
    v6->_queuedCompressedSampleBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7->_passthroughEnabled = 1;
    v7->_compressWhenCompressedBuffersInUseEnabled = 1;
    v7->_compressionTiles = 2;
    v7->_compressedSurfacePoolEnabled = 0;
    if (FigCaptureVideoDimensionsAreValid(*(void *)&a4))
    {
      v7->_compressionInputDimensionsInit = ($470D365275581EF16070F5A11344F73E)a4;
      [a3 figThreadPriority];
      v7->_decompressionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      unsigned int v8 = [a3 depthDataType];
      if (v8 <= 9)
      {
        if (((1 << v8) & 0xF6) != 0)
        {
LABEL_5:

          return 0;
        }
        if (((1 << v8) & 0x209) != 0) {
          int v9 = 5;
        }
        else {
          int v9 = 7;
        }
        v7->_decompressionPoolCapacity = v9;
      }
      v10 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7 index:0];
      [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v10 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v10 primaryMediaConfiguration] setPassthroughMode:1];
      [(BWNode *)v7 addInput:v10];
      v11 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v11 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v11 primaryMediaConfiguration] setPassthroughMode:1];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v11 primaryMediaConfiguration] setIndexOfInputWhichDrivesThisOutput:[(BWNodeInput *)v10 index]];
      [(BWNode *)v7 addOutput:v11];
      v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7 index:1];
      v13 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB02C18];
      [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v12 primaryMediaConfiguration] setFormatRequirements:v13];
      [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v12 primaryMediaConfiguration] setPassthroughMode:1];
      [(BWNode *)v7 addInput:v12];
      v7->_sensorRawInput = v12;
      v14 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
      v15 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v15 setSupportedPixelFormats:&unk_1EFB02C18];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v14 primaryMediaConfiguration] setFormatRequirements:v15];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v14 primaryMediaConfiguration] setPassthroughMode:1];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v14 primaryMediaConfiguration] setIndexOfInputWhichDrivesThisOutput:[(BWNodeInput *)v12 index]];
      [(BWNode *)v7 addOutput:v14];
      v7->_sensorRawOutput = v14;
      return v7;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_5;
  }
  return v7;
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
  compressionSession = self->_compressionSession;
  if (compressionSession) {
    CFRelease(compressionSession);
  }

  decompressionFormatDescription = self->_decompressionFormatDescription;
  if (decompressionFormatDescription) {
    CFRelease(decompressionFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWCompressedShotBufferNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeSubType
{
  return @"CompressedShotBuffer";
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__BWCompressedShotBufferNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke;
  v5[3] = &unk_1E5C24458;
  v5[4] = self;
  v5[5] = a5;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v5);
}

uint64_t __86__BWCompressedShotBufferNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index"));
  return [v1 makeConfiguredFormatLive];
}

- (void)_asyncOnDecompressionQueue:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      v2 = *(NSObject **)(a1 + 200);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__BWCompressedShotBufferNode__asyncOnDecompressionQueue___block_invoke;
      block[3] = &unk_1E5C249F0;
      block[4] = a2;
      dispatch_async(v2, block);
    }
  }
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__BWCompressedShotBufferNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
  v4[3] = &unk_1E5C248A0;
  v4[4] = self;
  v4[5] = a4;
  v4[6] = a3;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __75__BWCompressedShotBufferNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index"));
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 emitStillImagePrewarmMessageWithSettings:v3];
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__BWCompressedShotBufferNode_handleNodeError_forInput___block_invoke;
  v4[3] = &unk_1E5C248A0;
  v4[4] = self;
  v4[5] = a4;
  v4[6] = a3;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __55__BWCompressedShotBufferNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index"));
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 emitNodeError:v3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  CFTypeRef v33 = CMGetAttachment(a3, @"StillSettings", 0);
  if (dword_1E96B69E8)
  {
    int v38 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[BWCompressedShotBufferNode _shouldPassthroughSampleBuffer:forInput:]((uint64_t)self, a3, (uint64_t)a4))
  {
    if (a3)
    {
      unsigned int v8 = (void *)CFRetain(a3);
      goto LABEL_6;
    }
LABEL_18:
    FigDebugAssert3();
    goto LABEL_42;
  }
  if (!self->_decompressionPool) {
    -[BWCompressedShotBufferNode _setupDecompressionPool]((BWPixelBufferPool *)self);
  }
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  p_compressionInputDimensions = &self->_compressionInputDimensions;
  if (!FigCaptureVideoDimensionsAreValid(*(void *)&self->_compressionInputDimensions))
  {
    uint64_t compressionInputDimensionsInit = (uint64_t)self->_compressionInputDimensionsInit;
    $470D365275581EF16070F5A11344F73E *p_compressionInputDimensions = ($470D365275581EF16070F5A11344F73E)compressionInputDimensionsInit;
    if (!FigCaptureVideoDimensionsAreValid(compressionInputDimensionsInit))
    {
      FormatDescription = CMSampleBufferGetFormatDescription(a3);
      $470D365275581EF16070F5A11344F73E *p_compressionInputDimensions = ($470D365275581EF16070F5A11344F73E)CMVideoFormatDescriptionGetDimensions(FormatDescription);
    }
    -[BWCompressedShotBufferNode _updateCompressedByteCapacity]((uint64_t)self);
  }
  int inUseUncompressedBufferCount = self->_inUseUncompressedBufferCount;
  if (inUseUncompressedBufferCount < self->_decompressionPoolCapacity && self->_inUseCompressedBufferCount <= 0)
  {
    decompressionPool = self->_decompressionPool;
    if (decompressionPool)
    {
      if (![(BWPixelBufferPool *)decompressionPool isPixelBufferAvailable]) {
        goto LABEL_16;
      }
      int inUseUncompressedBufferCount = self->_inUseUncompressedBufferCount;
    }
    self->_int inUseUncompressedBufferCount = inUseUncompressedBufferCount + 1;
    os_unfair_lock_unlock(&self->_bufferTrackingLock);
    unsigned int v8 = -[BWCompressedShotBufferNode _newSampleBufferFromDecompressionPoolWithCopyOfSampleBuffer:]((CMSampleBufferRef)self, a3);
LABEL_6:
    int v9 = v8;
    if (v8)
    {
      CFRetain(v8);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_2;
      v35[3] = &unk_1E5C249A0;
      v35[4] = self;
      v35[5] = a4;
      v35[6] = v9;
      v10 = v35;
LABEL_40:
      -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v10);
      CFRelease(v9);
      return;
    }
    goto LABEL_18;
  }
LABEL_16:
  uint64_t inUseCompressedBufferCount = self->_inUseCompressedBufferCount;
  int width = p_compressionInputDimensions->width;
  if ((int)inUseCompressedBufferCount <= 0)
  {
    int64_t inUseCompressedBytes = self->_inUseCompressedBytes;
    LODWORD(v17) = self->_compressionInputDimensions.height * width;
    float v20 = 2.0;
  }
  else
  {
    uint64_t v17 = self->_compressionInputDimensions.height * (uint64_t)width;
    float v18 = (float)(v17 * inUseCompressedBufferCount);
    int64_t inUseCompressedBytes = self->_inUseCompressedBytes;
    float v20 = v18 / (float)inUseCompressedBytes;
  }
  uint64_t v21 = (uint64_t)(float)((float)(int)v17 / v20);
  int64_t v22 = inUseCompressedBytes + v21;
  int64_t compressedByteCapacity = self->_compressedByteCapacity;
  os_unfair_lock_unlock(&self->_bufferTrackingLock);
  if (v22 >= compressedByteCapacity)
  {
    mach_absolute_time();
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      -[BWCompressedShotBufferNode _inUseCompressedBufferCount]((os_unfair_lock_s *)self);
      -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
      -[BWCompressedShotBufferNode _compressedByteCapacity]((uint64_t)self);
      kdebug_trace();
    }
    if (dword_1E96B69E8)
    {
      int v38 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    while (1)
    {
      uint64_t v26 = -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self) + v21;
      if (v26 <= -[BWCompressedShotBufferNode _compressedByteCapacity]((uint64_t)self)) {
        break;
      }
      usleep(0x2710u);
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    mach_absolute_time();
    FigHostTimeToNanoseconds();
    if (dword_1E96B69E8)
    {
      int v38 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  mach_absolute_time();
  CMAttachmentBearerRef v28 = -[BWCompressedShotBufferNode _newCompressedSampleBufferFromUncompressedSampleBuffer:](self, a3);
  if (!v28) {
    goto LABEL_18;
  }
  int v9 = (void *)v28;
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  DataBuffer = CMSampleBufferGetDataBuffer((CMSampleBufferRef)v9);
  int64_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
  if (DataLength > 0)
  {
    int64_t v31 = DataLength;
    os_unfair_lock_lock(&self->_bufferTrackingLock);
    [(NSMutableArray *)self->_queuedCompressedSampleBuffers addObject:v9];
    ++self->_inUseCompressedBufferCount;
    self->_inUseCompressedBytes += v31;
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    os_unfair_lock_unlock(&self->_bufferTrackingLock);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke;
    v36[3] = &unk_1E5C24430;
    v36[4] = self;
    v10 = v36;
    goto LABEL_40;
  }
  CFRelease(v9);
LABEL_42:
  CFTypeRef v32 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_3;
  v34[3] = &unk_1E5C249C8;
  v34[4] = self;
  v34[5] = v33;
  v34[6] = v32;
  v34[7] = a4;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v34);
}

- (uint64_t)_shouldPassthroughSampleBuffer:(uint64_t)a3 forInput:
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 96) != a3) {
      return 1;
    }
    objc_super v5 = (void *)CMGetAttachment(target, @"StillSettings", 0);
    v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "resolutionFlavor") == 2) {
      return 1;
    }
    if (objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "resolutionFlavor") != 1
      || (result = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue"),
          result != 1))
    {
      BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)target);
      FigCaptureMetadataUtilitiesGetValidBufferRect();
      if (v8 <= (double)*(int *)(v3 + 192) && v7 <= (double)*(int *)(v3 + 196))
      {
        if ((objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 2) != 0) {
          return 0;
        }
        if (!*(unsigned char *)(v3 + 160)) {
          return 0;
        }
        __int16 v9 = objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags");
        if (*(unsigned char *)(v3 + 161))
        {
          __int16 v10 = v9;
          if (-[BWCompressedShotBufferNode _hasQueuedCompressedBuffers]((os_unfair_lock_s *)v3)
            || (v10 & 0x800) != 0 && ([(id)v3 compressionResourcesAllocated] & 1) != 0)
          {
            return 0;
          }
        }
      }
      return 1;
    }
  }
  return result;
}

- (BWPixelBufferPool)_setupDecompressionPool
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    if (!*(void *)&result[1]._providesBackPressure)
    {
      v2 = objc_msgSend((id)objc_msgSend(*(id *)&result->_providesBackPressure, "primaryMediaProperties"), "resolvedFormat");
      uint64_t v3 = objc_alloc_init(BWVideoFormatRequirements);
      v8[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
      [(BWVideoFormatRequirements *)v3 setWidth:SLODWORD(v1[1]._prefetchedSurfaceIDs)];
      [(BWVideoFormatRequirements *)v3 setHeight:SHIDWORD(v1[1]._prefetchedSurfaceIDs)];
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v3, "setBytesPerRowAlignment:", [v2 bytesPerRowAlignment]);
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "cacheMode"));
      -[BWVideoFormatRequirements setSupportedCacheModes:](v3, "setSupportedCacheModes:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1]);
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "colorSpaceProperties"));
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v3, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1]);
      objc_super v5 = v3;
      LOBYTE(v4) = 1;
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:1]), SLODWORD(v1[1]._backPressureSemaphore), @"BWCompressedShotBuffer Decompression", 0, +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), 1, v4);
      *(void *)&v1[1]._providesBackPressure = result;
    }
  }
  return result;
}

- (uint64_t)_updateCompressedByteCapacity
{
  if (result)
  {
    uint64_t v1 = result;
    result = FigCaptureVideoDimensionsAreValid(*(void *)(result + 184));
    if (result)
    {
      LODWORD(v2) = *(_DWORD *)(v1 + 124) - *(_DWORD *)(v1 + 224);
      if ((int)v2 <= 1) {
        uint64_t v2 = 1;
      }
      else {
        uint64_t v2 = v2;
      }
      *(void *)(v1 + 136) = *(int *)(v1 + 188) * (uint64_t)*(int *)(v1 + 184) * v2;
    }
  }
  return result;
}

- (uint64_t)_inUseCompressedBufferCount
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_lock(a1 + 28);
  uint64_t os_unfair_lock_opaque = a1[30]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(a1 + 28);
  return os_unfair_lock_opaque;
}

- (uint64_t)_inUseCompressedBytes
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  uint64_t v2 = *(void *)(a1 + 128);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  return v2;
}

- (uint64_t)_compressedByteCapacity
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  uint64_t v2 = *(void *)(a1 + 136);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  return v2;
}

- (CMAttachmentBearerRef)_newCompressedSampleBufferFromUncompressedSampleBuffer:(CMAttachmentBearerRef)result
{
  v54[4] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  CMAttachmentBearerRef destination = 0;
  CMAttachmentBearerRef v52 = 0;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  objc_super v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ImageBuffer && (uint64_t v6 = (__CVBuffer *)CFRetain(ImageBuffer)) != 0)
  {
    uint64_t v7 = v6;
    if (*v5 == 1)
    {
      IOSurface = CVPixelBufferGetIOSurface(v6);
      IOSurfaceGetID(IOSurface);
      kdebug_trace();
    }
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
    uint64_t v10 = PixelFormatType;
    if (PixelFormatType == 1651925816 || PixelFormatType == 1652056888)
    {
      memset(&timingInfoOut, 0, sizeof(timingInfoOut));
      if (!CMSampleBufferGetSampleTimingInfo(sbuf, 0, &timingInfoOut))
      {
        if (*(void *)(v3 + 168)
          || (uint64_t v11 = -[BWCompressedShotBufferNode _newCompressionSession](v3), (*(void *)(v3 + 168) = v11) != 0))
        {
          uint64_t v12 = *MEMORY[0x1E4F56058];
          v54[0] = &unk_1EFAFDE90;
          uint64_t v13 = *MEMORY[0x1E4F56048];
          v53[0] = v12;
          v53[1] = v13;
          uint64_t v14 = [NSNumber numberWithUnsignedInt:2];
          uint64_t v15 = *MEMORY[0x1E4F56068];
          v54[1] = v14;
          v54[2] = &unk_1EFAFDE90;
          uint64_t v16 = *MEMORY[0x1E4F56050];
          v53[2] = v15;
          v53[3] = v16;
          v54[3] = MEMORY[0x1E4F1CC38];
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];
          if (!CMPhotoCompressionSessionOpenEmptyContainer())
          {
            CGFloat v17 = *MEMORY[0x1E4F1DB20];
            CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            CGFloat v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
            unint64_t v21 = psn_pixelBufferDimensions(v7);
            unint64_t v22 = [*(id *)(v3 + 216) dimensions];
            unint64_t v23 = HIDWORD(v22);
            if ((int)v21 <= (int)v22 && SHIDWORD(v21) <= SHIDWORD(v22)) {
              goto LABEL_25;
            }
            CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
            double ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
            double v28 = (double)(int)v22;
            double v29 = (double)SHIDWORD(v22);
            if (v26 > (double)(int)v22 || v27 > v29) {
              goto LABEL_25;
            }
            double v31 = v27;
            double v48 = v25;
            double v49 = ValidBufferRect;
            float v32 = v26;
            int v33 = v22;
            if ((int)FigCaptureRoundFloatToMultipleOf(8, v32) < (int)v22)
            {
              int v33 = FigCaptureRoundFloatToMultipleOf(8, v32);
              double v28 = (double)v33;
            }
            float v34 = v31;
            if ((int)FigCaptureCeilFloatToMultipleOf(8, v34) < SHIDWORD(v22))
            {
              LODWORD(v23) = FigCaptureCeilFloatToMultipleOf(8, v34);
              double v29 = (double)(int)v23;
            }
            if (((v33 | v23) & 7) == 0 || !(v33 & 0xF | v23 & 3))
            {
              CGFloat v18 = v48;
              CGFloat v17 = v49;
              CGFloat v20 = v28;
              CGFloat v19 = v29;
LABEL_25:
              v35 = v7;
LABEL_26:
              -[BWCompressedShotBufferNode _compressionOptionsWithCropRect:](v3, v17, v18, v20, v19);
              if (!CMPhotoCompressionSessionAddImage()) {
                CMPhotoCompressionSessionCloseContainerAndCopyBacking();
              }
              goto LABEL_31;
            }
            unsigned int __n = v33;
            mach_absolute_time();
            uint64_t v36 = objc_msgSend(+[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:](BWOnDemandPixelBufferAllocator, "onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:", v21, v10, @"Uncompressed shot buffer copy", +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool")), "newPixelBuffer");
            if (v36)
            {
              v35 = (__CVBuffer *)v36;
              CFStringRef v37 = (const __CFString *)*MEMORY[0x1E4F24E08];
              CFTypeRef v38 = CVBufferCopyAttachment(v7, (CFStringRef)*MEMORY[0x1E4F24E08], 0);
              if (v38)
              {
                uint64_t v39 = v38;
                CVBufferSetAttachment(v35, v37, v38, kCVAttachmentMode_ShouldPropagate);
                CFRelease(v39);
              }
              CVPixelBufferLockBaseAddress(v7, 1uLL);
              CVPixelBufferLockBaseAddress(v35, 0);
              size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v7);
              size_t v41 = CVPixelBufferGetBytesPerRow(v35);
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(v7);
              v43 = (char *)CVPixelBufferGetBaseAddress(v35);
              if (v23)
              {
                v44 = v43;
                uint64_t v45 = v23;
                v46 = &BaseAddress[(unint64_t)v49 + BytesPerRow * (unint64_t)v48];
                do
                {
                  memcpy(v44, v46, __n);
                  v46 += BytesPerRow;
                  v44 += v41;
                  --v45;
                }
                while (v45);
              }
              CVPixelBufferUnlockBaseAddress(v7, 1uLL);
              CVPixelBufferUnlockBaseAddress(v35, 0);
              mach_absolute_time();
              FigHostTimeToNanoseconds();
              CFRetain(v35);
              CFRelease(v7);
              objc_super v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
              goto LABEL_26;
            }
          }
        }
      }
    }
    else
    {
      FigDebugAssert3();
    }
    v35 = v7;
  }
  else
  {
    FigDebugAssert3();
    v35 = 0;
  }
LABEL_31:
  if (*v5 == 1) {
    kdebug_trace();
  }
  if (destination) {
    CFRelease(destination);
  }
  if (v35) {
    CFRelease(v35);
  }
  return v52;
}

void __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
}

- (void)_decompressionWork
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    uint64_t v2 = (opaqueCMSampleBuffer *)(id)[*(id *)(a1 + 144) firstObject];
    if (v2)
    {
      uint64_t v3 = v2;
      [*(id *)(a1 + 144) removeObjectAtIndex:0];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
      DataBuffer = CMSampleBufferGetDataBuffer(v3);
      size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
      uint64_t v6 = (const void *)-[BWCompressedShotBufferNode _newDecompressedSampleBufferFromCompressedSampleBuffer:](a1, (uint64_t)v3);
      if (v6)
      {
        uint64_t v7 = v6;
        CMGetAttachment(v6, @"StillSettings", 0);
        [*(id *)(a1 + 104) emitSampleBuffer:v7];
        CFRelease(v7);
      }
      else
      {
        CFTypeRef v8 = CMGetAttachment(v3, @"StillSettings", 0);
        id v9 = +[BWNodeError newError:4294954516 sourceNode:a1 stillImageSettings:v8 metadata:CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
        [*(id *)(a1 + 104) emitNodeError:v9];
      }
      CFRelease(v3);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
      --*(_DWORD *)(a1 + 120);
      uint64_t v10 = *(void *)(a1 + 128);
      *(void *)(a1 + 128) = v10 - DataLength;
      if (!*(_DWORD *)(a1 + 120))
      {
        if (v10 != DataLength) {
          FigDebugAssert3();
        }
        *(_DWORD *)(a1 + 116) = 0;
      }
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        kdebug_trace();
      }
      uint64_t v11 = (void (**)(void))*(id *)(a1 + 152);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
      if (v11)
      {
        v11[2](v11);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    }
  }
}

- (CMSampleBufferRef)_newSampleBufferFromDecompressionPoolWithCopyOfSampleBuffer:(CMSampleBufferRef)result
{
  if (result)
  {
    CMSampleBufferRef v3 = result;
    mach_absolute_time();
    CMSampleBufferRef v30 = 0;
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    uint64_t v5 = [*((id *)v3 + 27) newPixelBuffer];
    uint64_t v6 = (__CVBuffer *)v5;
    if (!ImageBuffer) {
      goto LABEL_43;
    }
    if (!v5)
    {
      FigDebugAssert3();
      return v30;
    }
    CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
    OSType v8 = CVPixelBufferGetPixelFormatType(v6);
    if (PixelFormatType != 1651925816 && PixelFormatType != 1652056888) {
      goto LABEL_31;
    }
    if (v8 != 1651925816 && v8 != 1652056888) {
      goto LABEL_31;
    }
    unint64_t v10 = psn_pixelBufferDimensions(ImageBuffer);
    unint64_t v11 = psn_pixelBufferDimensions(v6);
    double ValidBufferRect = *MEMORY[0x1E4F1DB20];
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (!FigCaptureVideoDimensionsAreEqual(v10, v11) && ((int)v10 > (int)v11 || SHIDWORD(v10) > SHIDWORD(v11)))
    {
      double ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
      double v13 = v19;
      if (v17 > (double)(int)v11 || v18 > (double)SHIDWORD(v11))
      {
LABEL_31:
        FigDebugAssert3();
LABEL_38:
        CFRelease(v6);
        return v30;
      }
      double v14 = v17;
      double v15 = v18;
    }
    unint64_t v28 = v11;
    uint64_t v29 = v10;
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
    size_t v22 = CVPixelBufferGetBytesPerRow(v6);
    CVPixelBufferLockBaseAddress(ImageBuffer, 1uLL);
    CVPixelBufferLockBaseAddress(v6, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(ImageBuffer);
    v24 = (char *)CVPixelBufferGetBaseAddress(v6);
    if (BytesPerRow == v22)
    {
      v31.origin.x = ValidBufferRect;
      v31.origin.y = v13;
      v31.size.int width = v14;
      v31.size.height = v15;
      if (CGRectIsNull(v31))
      {
        memcpy(v24, BaseAddress, BytesPerRow * (v29 >> 32));
        goto LABEL_34;
      }
    }
    if (BytesPerRow >= v22) {
      size_t v25 = v22;
    }
    else {
      size_t v25 = BytesPerRow;
    }
    v32.origin.x = ValidBufferRect;
    v32.origin.y = v13;
    v32.size.int width = v14;
    v32.size.height = v15;
    if (CGRectIsNull(v32))
    {
      uint64_t v26 = v29 >> 32;
      if (!(v29 >> 32)) {
        goto LABEL_34;
      }
    }
    else
    {
      BaseAddress += (unint64_t)ValidBufferRect + BytesPerRow * (unint64_t)v13;
      uint64_t v26 = (unint64_t)v15;
      size_t v25 = (unint64_t)v14;
      if (!(unint64_t)v15) {
        goto LABEL_34;
      }
    }
    do
    {
      memcpy(v24, BaseAddress, v25);
      BaseAddress += BytesPerRow;
      v24 += v22;
      --v26;
    }
    while (v26);
LABEL_34:
    CVPixelBufferUnlockBaseAddress(ImageBuffer, 1uLL);
    CVPixelBufferUnlockBaseAddress(v6, 0);
    CVBufferPropagateAttachments(ImageBuffer, v6);
    if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, v6, (CFTypeRef *)v3 + 29, &v30))
    {
      v33.origin.x = ValidBufferRect;
      v33.origin.y = v13;
      v33.size.int width = v14;
      v33.size.height = v15;
      if (!CGRectIsNull(v33))
      {
        id v27 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(v30);
        FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v27, v29, v28, ValidBufferRect, v13, v14, v15, 0.0, 0.0, v14, v15);
        FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v27, v29, v28);
      }
      if (!v6) {
        return v30;
      }
      goto LABEL_38;
    }
LABEL_43:
    FigDebugAssert3();
    if (!v6) {
      return v30;
    }
    goto LABEL_38;
  }
  return result;
}

void __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index")), "emitSampleBuffer:", *(void *)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_3(uint64_t a1)
{
  id v2 = +[BWNodeError newError:4294954516 sourceNode:*(void *)(a1 + 32) stillImageSettings:*(void *)(a1 + 40) metadata:*(void *)(a1 + 48)];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 56), "index")), "emitNodeError:", v2);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__BWCompressedShotBufferNode_didReachEndOfDataForInput___block_invoke;
    v4[3] = &unk_1E5C24430;
    v4[4] = self;
    -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v4);
  }
}

uint64_t __56__BWCompressedShotBufferNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 208) flush];

  *(void *)(*(void *)(a1 + 32) + 208) = 0;
  *(void *)(*(void *)(a1 + 32) + 216) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 168))
  {
    CMPhotoCompressionSessionReleaseHardwareResources();
    CMPhotoCompressionSessionFlushCachedBuffers();
    uint64_t v2 = *(void *)(a1 + 32);
    CMSampleBufferRef v3 = *(const void **)(v2 + 168);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(*(void *)(a1 + 32) + 168) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 112));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void (***)(void))(v4 + 152);
  *(void *)(v4 + 152) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  if (v5)
  {
    v5[2](v5);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "outputs", 0);
  uint64_t result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) markEndOfLiveOutput];
      }
      while (v8 != v10);
      uint64_t result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v8 = result;
    }
    while (result);
  }
  return result;
}

- (void)setUncompressedEquivalentCapacity:(int)a3
{
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  if (self->_uncompressedEquivalentCapacity != a3)
  {
    self->_uncompressedEquivalentCapacity = a3;
    -[BWCompressedShotBufferNode _updateCompressedByteCapacity]((uint64_t)self);
  }
  os_unfair_lock_unlock(p_bufferTrackingLock);
}

- (int)uncompressedEquivalentCapacity
{
  uint64_t v2 = self;
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  LODWORD(v2) = v2->_uncompressedEquivalentCapacity;
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return (int)v2;
}

- (int)minimumUncompressedEquivalentCapacity
{
  return self->_decompressionPoolCapacity + 1;
}

- (BOOL)compressionResourcesAllocated
{
  uint64_t v2 = self;
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  LOBYTE(v2) = FigCaptureVideoDimensionsAreValid(*(void *)&v2->_compressionInputDimensions);
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return (char)v2;
}

- (void)flushAndWaitUntilThreshold:(int)a3
{
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  uint64_t v6 = (int)(float)((float)((float)(100.0 - (float)a3) / 100.0)
                                * (float)(self->_compressedByteCapacity
                                        / (self->_compressionInputDimensions.height
                                         * (uint64_t)self->_compressionInputDimensions.width)));
  os_unfair_lock_unlock(p_bufferTrackingLock);
  [(BWCompressedShotBufferNode *)self flushAndWaitForUncompressedEquivalentFreeBufferCount:v6];
}

- (void)flushAndWaitForUncompressedEquivalentFreeBufferCount:(int)a3
{
  mach_absolute_time();
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  int64_t v5 = self->_compressedByteCapacity
     - self->_compressionInputDimensions.height * (uint64_t)self->_compressionInputDimensions.width * a3;
  os_unfair_lock_unlock(&self->_bufferTrackingLock);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    -[BWCompressedShotBufferNode _inUseCompressedBufferCount]((os_unfair_lock_s *)self);
    -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
    kdebug_trace();
  }
  uint64_t v10 = -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
  if (v10 > v5)
  {
    char v6 = 0;
    do
    {
      if ((v6 & 1) == 0 && dword_1E96B69E8)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      usleep(0x2710u);
      uint64_t v8 = -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
      char v6 = 1;
    }
    while (v8 > v5);
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (v10 <= v5)
  {
    if (!dword_1E96B69E8) {
      return;
    }
  }
  else
  {
    mach_absolute_time();
    FigHostTimeToNanoseconds();
    if (!dword_1E96B69E8) {
      return;
    }
  }
  uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (BOOL)hasUncompressedEquivalentFreeBufferCount:(int)a3
{
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  uint64_t v6 = self->_compressedByteCapacity
     - self->_compressionInputDimensions.height * (uint64_t)self->_compressionInputDimensions.width * a3;
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self) <= v6;
}

- (void)setFreeBufferCountIncreasedHandler:(id)a3
{
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  int inUseCompressedBufferCount = self->_inUseCompressedBufferCount;

  self->_freeBufferCountIncreasedHandler = (id)[a3 copy];
  os_unfair_lock_unlock(p_bufferTrackingLock);
  if (a3 && !inUseCompressedBufferCount)
  {
    uint64_t v7 = (void (*)(id))*((void *)a3 + 2);
    v7(a3);
  }
}

- (id)freeBufferCountIncreasedHandler
{
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  id v4 = self->_freeBufferCountIncreasedHandler;
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return v4;
}

- (void)getInUseCompressedBufferCount:(int *)a3 inUseCompressedBytes:(int64_t *)a4 maxInUseCompressedBytes:(int64_t *)a5 forUncompressedEquivalentFreeBufferCount:(int)a6
{
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  if (a3) {
    *a3 = self->_inUseCompressedBufferCount;
  }
  if (a4) {
    *a4 = self->_inUseCompressedBytes;
  }
  if (a5) {
    *a5 = self->_compressedByteCapacity
  }
        - self->_compressionInputDimensions.height * (uint64_t)self->_compressionInputDimensions.width * a6;
  os_unfair_lock_unlock(p_bufferTrackingLock);
}

- (BOOL)passthroughEnabled
{
  return self->_passthroughEnabled;
}

void __57__BWCompressedShotBufferNode__asyncOnDecompressionQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)_newCompressionSession
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (*(unsigned char *)(result + 180))
    {
      BOOL v1 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
      uint64_t v8 = *MEMORY[0x1E4F563A8];
      v7[0] = &unk_1EFAFDE90;
      uint64_t v2 = *MEMORY[0x1E4F56378];
      v6[0] = *MEMORY[0x1E4F56380];
      v6[1] = v2;
      v7[1] = [NSNumber numberWithBool:v1];
      v6[2] = *MEMORY[0x1E4F56370];
      v7[2] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
      v9[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      if (CMPhotoSurfacePoolCreate()) {
        return 0;
      }
      uint64_t v3 = *MEMORY[0x1E4F561B8];
      v4[0] = *MEMORY[0x1E4F561C0];
      v4[1] = v3;
      v5[0] = MEMORY[0x1E4F1CC38];
      v5[1] = 0;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
    }
    CMPhotoCompressionSessionCreate();
    return 0;
  }
  return result;
}

- (void)_compressionOptionsWithCropRect:(CGFloat)a3
{
  if (!a1) {
    return 0;
  }
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:&unk_1EFAFDEA8 forKeyedSubscript:*MEMORY[0x1E4F560B8]];
  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56080]];
  uint64_t v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 176)];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F56180]];
  if (*(unsigned char *)(a1 + 180))
  {
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56188]];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F56128]];
  }
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.int width = a4;
  v15.size.height = a5;
  if (!CGRectIsNull(v15))
  {
    v16.origin.x = a2;
    v16.origin.y = a3;
    v16.size.int width = a4;
    v16.size.height = a5;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v16);
    [v10 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F56170]];
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  return v10;
}

- (CMVideoFormatDescriptionRef)_copyCompressedFormatDescriptionForUncompressedSampleBuffer:(CMVideoFormatDescriptionRef)result
{
  v20[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(FormatDescription);
    if (Extensions)
    {
      uint64_t v5 = *MEMORY[0x1E4F24BC8];
      v20[0] = *MEMORY[0x1E4F24C18];
      v20[1] = v5;
      v20[2] = *MEMORY[0x1E4F24A90];
      uint64_t v6 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(v7, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](Extensions, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * v11)), *(void *)(*((void *)&v15 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
      if ([v7 count]) {
        CFDictionaryRef Extensions = (CFDictionaryRef)v7;
      }
      else {
        CFDictionaryRef Extensions = 0;
      }
    }
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    uint64_t v12 = CMSampleBufferGetFormatDescription(sbuf);
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v12);
    CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x736C696Du, Dimensions.width, Dimensions.height, Extensions, &formatDescriptionOut);
    return formatDescriptionOut;
  }
  return result;
}

- (BOOL)_hasQueuedCompressedBuffers
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_lock(a1 + 28);
  BOOL v2 = (signed int)a1[30]._os_unfair_lock_opaque > 0;
  os_unfair_lock_unlock(a1 + 28);
  return v2;
}

- (uint64_t)_newDecompressedSampleBufferFromCompressedSampleBuffer:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*(void *)(a1 + 216))
  {
    mach_absolute_time();
    if (*v4 == 1) {
      kdebug_trace();
    }
    int v5 = [*(id *)(a1 + 216) waitForAvailablePixelBuffer];
    if (*v4 == 1) {
      kdebug_trace();
    }
    if (dword_1E96B69E8) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
    if (v6 == 1)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  mach_absolute_time();
  if (*v4 == 1) {
    kdebug_trace();
  }
  uint64_t v8 = *(BWPhotoDecompressor **)(a1 + 208);
  if (!v8)
  {
    if (!*(void *)(a1 + 216)
      || (uint64_t v8 = [[BWPhotoDecompressor alloc] initWithOutputPixelBufferPool:*(void *)(a1 + 216)], (*(void *)(a1 + 208) = v8) == 0))
    {
      FigDebugAssert3();
      return 0;
    }
  }
  uint64_t v9 = -[BWPhotoDecompressor newUncompressedSampleBufferFromSampleBuffer:](v8, "newUncompressedSampleBufferFromSampleBuffer:", a2, v11, v12);
  if (*v4 == 1) {
    kdebug_trace();
  }
  return v9;
}

@end