@interface BWVideoPlaybackSupportMetadataNode
+ (void)initialize;
- (BWNodeOutput)boxedMetadataOutput;
- (BWNodeOutput)passthruOutput;
- (BWVideoPlaybackSupportMetadataNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_emitPlaybackSupportBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:;
- (uint64_t)_emptyMetadataBlockBuffer;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWVideoPlaybackSupportMetadataNode

+ (void)initialize
{
}

- (BWVideoPlaybackSupportMetadataNode)init
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)BWVideoPlaybackSupportMetadataNode;
  v2 = [(BWNode *)&v17 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    if (!v3) {
      goto LABEL_10;
    }
    v4 = v3;
    v5 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v4 setFormatRequirements:v5];

    [(BWNodeInput *)v4 setPassthroughMode:1];
    [(BWNode *)v2 addInput:v4];

    uint64_t v6 = *MEMORY[0x1E4F1F108];
    uint64_t v7 = *MEMORY[0x1E4F1F160];
    uint64_t v8 = *MEMORY[0x1E4F1F0F8];
    v21[0] = *MEMORY[0x1E4F1F108];
    v21[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1F0A8];
    v22[0] = v7;
    v22[1] = v9;
    v21[2] = *MEMORY[0x1E4F1F118];
    uint64_t v19 = *MEMORY[0x1E4F1F120];
    uint64_t v20 = *MEMORY[0x1E4F1CFC8];
    v22[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v10 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v18 = v10;
    CFArrayRef v11 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v11, &v2->_boxedMetadataFormatDescription))
    {
      goto LABEL_10;
    }
    [v10 objectForKeyedSubscript:v6];
    [v10 objectForKeyedSubscript:v8];
    [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1F100]];
    v2->_localIDOfLuxMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
    v12 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v2];
    if (!v12) {
      goto LABEL_10;
    }
    v13 = v12;
    [(BWNodeOutput *)v12 setName:@"PlaybackSupportMetadataCameraPassThru"];
    [(BWNodeOutput *)v13 setPassthroughMode:1];
    [(BWNode *)v2 addOutput:v13];
    v2->_passthruOutput = v13;

    v14 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v2];
    if (v14)
    {
      v15 = v14;
      [(BWNodeOutput *)v14 setName:@"PlaybackSupportMetadata"];
      if (v2->_boxedMetadataFormatDescription) {
        [(BWNodeOutput *)v15 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:")];
      }
      [(BWNode *)v2 addOutput:v15];
      v2->_boxedMetadataOutput = v15;
    }
    else
    {
LABEL_10:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription) {
    CFRelease(boxedMetadataFormatDescription);
  }
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData) {
    CFRelease(emptyMetadataSampleData);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWVideoPlaybackSupportMetadataNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"VideoPlaybackSupportMetadata";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  [(BWNodeOutput *)self->_passthruOutput makeConfiguredFormatLive];
  boxedMetadataOutput = self->_boxedMetadataOutput;
  [(BWNodeOutput *)boxedMetadataOutput makeConfiguredFormatLive];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(BWNodeOutput *)self->_passthruOutput markEndOfLiveOutput];
  boxedMetadataOutput = self->_boxedMetadataOutput;
  [(BWNodeOutput *)boxedMetadataOutput markEndOfLiveOutput];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  memset(&v12, 0, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    CFTypeRef v6 = CMGetAttachment(a3, @"FileWriterAction", 0);
    if (v6)
    {
      uint64_t v7 = v6;
      if (CFEqual(v6, @"Start") || CFEqual(v7, @"Resume"))
      {
        self->_previousGeneratedMetadataBufferWasEmpty = 0;
        self->_prevSceneIlluminationValue = -1;
      }
    }
    CMSampleBufferRef sampleBufferOut = 0;
    if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, &sampleBufferOut))
    {
      CMTime v10 = v12;
      [(BWNodeOutput *)self->_boxedMetadataOutput emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67FA0 pts:&v10]];
    }
    else
    {
      [(BWNodeOutput *)self->_boxedMetadataOutput emitSampleBuffer:sampleBufferOut];
    }
    if (sampleBufferOut) {
      CFRelease(sampleBufferOut);
    }
  }
  else
  {
    uint64_t v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (!v8
      || (CMTime v10 = v12,
          (-[BWVideoPlaybackSupportMetadataNode _emitPlaybackSupportBoxedMetadataForSampleBuffer:metadata:time:]((uint64_t)self, v9, v8, (uint64_t)&v10) & 1) == 0))
    {
      CMTime v10 = v12;
      [(BWNodeOutput *)self->_boxedMetadataOutput emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67FA0 pts:&v10]];
    }
  }
  [(BWNodeOutput *)self->_passthruOutput emitSampleBuffer:a3];
}

- (uint64_t)_emitPlaybackSupportBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:
{
  if (!a1) {
    return 0;
  }
  CMSampleBufferRef v20 = 0;
  CMBlockBufferRef blockBufferOut = 0;
  int v6 = *(unsigned __int8 *)(a1 + 136);
  unsigned int v7 = FigCaptureSceneIlluminationValueFromLuxLevel((void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F54068]], *(_DWORD *)(a1 + 140));
  unsigned int v8 = v7;
  if (v7 != -1)
  {
    *(_DWORD *)(a1 + 140) = v7;
    CMTime v10 = malloc_type_malloc(0xCuLL, 0xFB8DA2DDuLL);
    _DWORD *v10 = 201326592;
    v10[1] = *(_DWORD *)(a1 + 120);
    v10[2] = bswap32(v8);
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, 0xCuLL, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, 0xCuLL, 0, &blockBufferOut))
    {
      fig_log_get_emitter();
      goto LABEL_16;
    }
    CFArrayRef v11 = blockBufferOut;
    size_t sampleSizeArray = 0;
    if (!blockBufferOut)
    {
LABEL_12:
      uint64_t v9 = 0;
      goto LABEL_20;
    }
LABEL_7:
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v12;
    CMTimeEpoch v13 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v14;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a4;
    CMTimeEpoch v15 = *(void *)(a4 + 16);
    sampleTimingArray.decodeTimeStamp.epoch = v13;
    sampleTimingArray.presentationTimeStamp.epoch = v15;
    size_t sampleSizeArray = CMBlockBufferGetDataLength(v11);
    if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 112), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v20))
    {
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 104), "emitSampleBuffer:");
        *(unsigned char *)(a1 + 136) = v8 == -1;
        uint64_t v9 = 1;
        goto LABEL_18;
      }
LABEL_17:
      uint64_t v9 = 0;
LABEL_18:
      if (blockBufferOut) {
        CFRelease(blockBufferOut);
      }
      goto LABEL_20;
    }
    fig_log_get_emitter();
LABEL_16:
    FigDebugAssert3();
    goto LABEL_17;
  }
  if (v6)
  {
    uint64_t v9 = 0;
    size_t sampleSizeArray = 0;
    goto LABEL_18;
  }
  v16 = (const void *)-[BWVideoPlaybackSupportMetadataNode _emptyMetadataBlockBuffer](a1);
  if (v16)
  {
    CFArrayRef v11 = (OpaqueCMBlockBuffer *)CFRetain(v16);
    CMBlockBufferRef blockBufferOut = v11;
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v9 = 0;
  CMBlockBufferRef blockBufferOut = 0;
LABEL_20:
  if (v20) {
    CFRelease(v20);
  }
  return v9;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitDroppedSample:](self->_passthruOutput, "emitDroppedSample:", a3, a4);
  boxedMetadataOutput = self->_boxedMetadataOutput;
  [(BWNodeOutput *)boxedMetadataOutput emitDroppedSample:a3];
}

- (uint64_t)_emptyMetadataBlockBuffer
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 128))
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 8uLL, 1u, (CMBlockBufferRef *)(result + 128)))
      {
        fig_log_get_emitter();
      }
      else
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(*(CMBlockBufferRef *)(v1 + 128), 0, 0, 0, &dataPointerOut))
        {
          *(void *)dataPointerOut = 0x8000000;
          return *(void *)(v1 + 128);
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    return *(void *)(v1 + 128);
  }
  return result;
}

- (BWNodeOutput)passthruOutput
{
  return self->_passthruOutput;
}

- (BWNodeOutput)boxedMetadataOutput
{
  return self->_boxedMetadataOutput;
}

@end