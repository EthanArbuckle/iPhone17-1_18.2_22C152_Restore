@interface BWCoreMotionMetadataSourceNode
+ (int)extractBWCoreMotionMetadataFromBlockBuffer:(OpaqueCMBlockBuffer *)a3 intoNativeEndianSampleData:(BWCoreMotionMetadataSampleData *)a4;
+ (int)extractBWCoreMotionMetadataFromSampleBuffer:(opaqueCMSampleBuffer *)a3 intoNativeEndianSampleData:(BWCoreMotionMetadataSampleData *)a4;
+ (void)initialize;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (BWCoreMotionMetadataSourceNode)initWithBufferGenerationRate:(int)a3 samplesPerBuffer:(int)a4;
- (id)nodeSubType;
- (opaqueCMFormatDescription)formatDescription;
- (void)_emitMetadataSampleBuffer;
- (void)dealloc;
@end

@implementation BWCoreMotionMetadataSourceNode

+ (void)initialize
{
}

- (id)nodeSubType
{
  return @"CoreMotionMetadata";
}

- (BOOL)start:(id *)a3
{
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__BWCoreMotionMetadataSourceNode_start___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

uint64_t __40__BWCoreMotionMetadataSourceNode_start___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 112))
  {
    uint64_t v2 = result;
    memset(v6, 0, 28);
    if (*(int *)(v1 + 108) >= 1)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      do
      {
        v5 = (_OWORD *)(*(void *)(v1 + 120) + v3);
        _OWORD *v5 = 0u;
        v5[1] = 0u;
        v5[2] = *(_OWORD *)v6;
        *(_OWORD *)((char *)v5 + 44) = *(_OWORD *)&v6[12];
        ++v4;
        uint64_t v1 = *(void *)(result + 32);
        v3 += 60;
      }
      while (v4 < *(int *)(v1 + 108));
    }
    *(_DWORD *)(v1 + 128) = 0;
    objc_msgSend(*(id *)(*(void *)(result + 32) + 16), "makeConfiguredFormatLive", 0, 0, 0, 0, 0, 0, 0, *(void *)&v6[24]);
    *(unsigned char *)(*(void *)(v2 + 32) + 112) = 1;
    return [*(id *)(*(void *)(v2 + 32) + 96) setDeviceMotionCallback:cmmsn_deviceMotionCallback info:*(void *)(v2 + 32) interval:1 fsync:1.0 / (double)(*(_DWORD *)(*(void *)(v2 + 32) + 108) * *(_DWORD *)(*(void *)(v2 + 32) + 104))];
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  if (self->_running)
  {
    [(CMMotionManager *)self->_motionManager setDeviceMotionCallback:0 info:0 interval:0 fsync:0.0];
    emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__BWCoreMotionMetadataSourceNode_stop___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_async(emitSamplesDispatchQueue, block);
  }
  return 1;
}

uint64_t __39__BWCoreMotionMetadataSourceNode_stop___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 128))
  {
    -[BWCoreMotionMetadataSourceNode _emitMetadataSampleBuffer](v2);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = [*(id *)(v2 + 16) markEndOfLiveOutput];
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
  return result;
}

- (void)_emitMetadataSampleBuffer
{
  if (!a1) {
    return;
  }
  CMSampleBufferRef v18 = 0;
  CMBlockBufferRef blockBufferOut = 0;
  size_t v2 = 68 * *(int *)(a1 + 128);
  uint64_t v3 = (char *)malloc_type_malloc(v2, 0x6D304B65uLL);
  if (*(int *)(a1 + 128) < 1)
  {
    size_t v6 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    size_t v6 = 0;
    do
    {
      v7 = &v3[v6];
      *(_DWORD *)v7 = 1140850688;
      *((_DWORD *)v7 + 1) = *(_DWORD *)(a1 + 144);
      v8 = (_OWORD *)(*(void *)(a1 + 120) + v4);
      long long v10 = v8[1];
      long long v9 = v8[2];
      long long v11 = *(_OWORD *)((char *)v8 + 44);
      *(_OWORD *)(v7 + 8) = *v8;
      *(_OWORD *)(v7 + 52) = v11;
      *(_OWORD *)(v7 + 40) = v9;
      *(_OWORD *)(v7 + 24) = v10;
      v6 += 68;
      ++v5;
      v4 += 60;
    }
    while (v5 < *(int *)(a1 + 128));
  }
  *(_DWORD *)(a1 + 128) = 0;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, v2, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, v6, 0, &blockBufferOut))
  {
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    goto LABEL_10;
  }
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&v17.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&v17.decodeTimeStamp.value = v13;
  v17.decodeTimeStamp.epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&v17.duration.value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&v17.duration.epoch = v14;
  CMTimeMakeWithSeconds(&v17.presentationTimeStamp, *(Float64 *)(*(void *)(a1 + 120) + 8), 1000000000);
  size_t sampleSizeArray = CMBlockBufferGetDataLength(blockBufferOut);
  if (CMSampleBufferCreate(v12, blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 136), 1, 1, &v17, 1, &sampleSizeArray, &v18))
  {
    fig_log_get_emitter();
    goto LABEL_17;
  }
  v15 = (void *)[(id)a1 output];
  [v15 emitSampleBuffer:v18];
LABEL_10:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (v18) {
    CFRelease(v18);
  }
}

+ (int)extractBWCoreMotionMetadataFromBlockBuffer:(OpaqueCMBlockBuffer *)a3 intoNativeEndianSampleData:(BWCoreMotionMetadataSampleData *)a4
{
  if (a4 && a3)
  {
    size_t lengthAtOffsetOut = 0;
    dataPointerOut = 0;
    OSStatus DataPointer = CMBlockBufferGetDataPointer(a3, 0, &lengthAtOffsetOut, 0, &dataPointerOut);
    if (DataPointer)
    {
      int v6 = DataPointer;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else if (lengthAtOffsetOut <= 0x43)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    else
    {
      int v6 = 0;
      long long v7 = *(_OWORD *)(dataPointerOut + 24);
      long long v8 = *(_OWORD *)(dataPointerOut + 40);
      long long v9 = *(_OWORD *)(dataPointerOut + 8);
      *(_OWORD *)((char *)&a4->var6 + 4) = *(_OWORD *)(dataPointerOut + 52);
      *(_OWORD *)&a4->var3 = v7;
      *(_OWORD *)&a4->var5 = v8;
      *(_OWORD *)&a4->var0 = v9;
      a4->var1 = 0;
      if ((a4->var0 & 0x2000000) != 0)
      {
        int v6 = 0;
        *(void *)&a4->var6 = bswap64(*(void *)&a4->var6);
        LODWORD(a4->var9) = bswap32(LODWORD(a4->var9));
        *(int8x16_t *)&a4->var2 = vrev64q_s8(*(int8x16_t *)&a4->var2);
        *(int8x16_t *)&a4->var4 = vrev64q_s8(*(int8x16_t *)&a4->var4);
        *(int8x8_t *)&a4->var7 = vrev32_s8(*(int8x8_t *)&a4->var7);
      }
    }
    return v6;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

+ (int)extractBWCoreMotionMetadataFromSampleBuffer:(opaqueCMSampleBuffer *)a3 intoNativeEndianSampleData:(BWCoreMotionMetadataSampleData *)a4
{
  CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer(a3);
  return +[BWCoreMotionMetadataSourceNode extractBWCoreMotionMetadataFromBlockBuffer:DataBuffer intoNativeEndianSampleData:a4];
}

- (BWCoreMotionMetadataSourceNode)initWithBufferGenerationRate:(int)a3 samplesPerBuffer:(int)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    CMSampleTimingInfo v17 = @"Need a non-zero buffer generation rate";
    goto LABEL_13;
  }
  if (!a4)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    CMSampleTimingInfo v17 = @"Need a non-zero samplesPerBuffer";
LABEL_13:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v17 userInfo:0]);
  }
  v18.receiver = self;
  v18.super_class = (Class)BWCoreMotionMetadataSourceNode;
  int v6 = [(BWNode *)&v18 init];
  if (v6)
  {
    long long v7 = (CMMotionManager *)[objc_alloc(MEMORY[0x1E4F22230]) initUsing6AxisSensorFusion];
    v6->_motionManager = v7;
    if (![(CMMotionManager *)v7 isDeviceMotionAvailable]) {
      goto LABEL_7;
    }
    if (![(CMMotionManager *)v6->_motionManager isAccelerometerAvailable]) {
      goto LABEL_7;
    }
    uint64_t v8 = *MEMORY[0x1E4F217C8];
    uint64_t v9 = *MEMORY[0x1E4F1F0F8];
    v19[0] = *MEMORY[0x1E4F1F108];
    v19[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1F020];
    v20[0] = v8;
    v20[1] = v10;
    v21[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    CFArrayRef v11 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v11, &v6->_boxedMetadataFormatDescription))
    {
      goto LABEL_7;
    }
    unsigned int LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
    v6->_localIDOfCoreMotionMetadata_BE = bswap32(LocalIDForMetadataIdentifyingFactors);
    if (LocalIDForMetadataIdentifyingFactors)
    {
      v6->_sampleDataForBuffer = (BWCoreMotionMetadataSampleData *)malloc_type_malloc(60 * a4, 0x1000040C2DCA394uLL);
      v6->_emitSamplesDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      long long v14 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v6];
      [(BWNodeOutput *)v14 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:v6->_boxedMetadataFormatDescription]];
      [(BWNode *)v6 addOutput:v14];

      v6->_bufferGenerationRate = a3;
      v6->_samplesPerBuffer = a4;
    }
    else
    {
LABEL_7:

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription) {
    CFRelease(boxedMetadataFormatDescription);
  }
  free(self->_sampleDataForBuffer);

  v4.receiver = self;
  v4.super_class = (Class)BWCoreMotionMetadataSourceNode;
  [(BWNode *)&v4 dealloc];
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

@end