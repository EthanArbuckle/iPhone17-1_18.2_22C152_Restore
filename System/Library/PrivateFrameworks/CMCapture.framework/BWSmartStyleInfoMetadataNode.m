@interface BWSmartStyleInfoMetadataNode
+ (void)initialize;
- (BWNodeOutput)boxedMetadataOutput;
- (BWNodeOutput)passthruOutput;
- (BWSmartStyleInfoMetadataNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_emptyMetadataBlockBuffer;
- (void)_emitSmartStyleInfoBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWSmartStyleInfoMetadataNode

+ (void)initialize
{
}

- (BWSmartStyleInfoMetadataNode)init
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)BWSmartStyleInfoMetadataNode;
  v2 = [(BWNode *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_smartStyleReversibilityUses4x3Spotlights = 1;
    v4 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    if (!v4) {
      goto LABEL_10;
    }
    v5 = v4;
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v5 setFormatRequirements:v6];

    [(BWNodeInput *)v5 setPassthroughMode:1];
    [(BWNode *)v3 addInput:v5];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = *MEMORY[0x1E4F1F108];
    uint64_t v9 = *MEMORY[0x1E4F1F0F8];
    v20[0] = *MEMORY[0x1E4F1F108];
    v20[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1F020];
    v21[0] = @"mdta/com.apple.quicktime.smartstyle-info";
    v21[1] = v10;
    v20[2] = *MEMORY[0x1E4F1F118];
    uint64_t v18 = *MEMORY[0x1E4F1F120];
    uint64_t v19 = *MEMORY[0x1E4F1CFC8];
    v21[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v11 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    [v7 addObject:v11];
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, (CFArrayRef)v7, &v3->_boxedMetadataFormatDescription))
    {
      goto LABEL_10;
    }
    [v11 objectForKeyedSubscript:v8];
    [v11 objectForKeyedSubscript:v9];
    v3->_localIDForSmartStyleInfoPlistMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
    v12 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v3];
    if (!v12) {
      goto LABEL_10;
    }
    v13 = v12;
    [(BWNodeOutput *)v12 setName:@"SmartStyleCameraPassThru"];
    [(BWNodeOutput *)v13 setPassthroughMode:1];
    [(BWNode *)v3 addOutput:v13];
    v3->_passthruOutput = v13;

    v14 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v3];
    if (v14)
    {
      v15 = v14;
      [(BWNodeOutput *)v14 setName:@"SmartStyleInfoMetadata"];
      if (v3->_boxedMetadataFormatDescription) {
        [(BWNodeOutput *)v15 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:")];
      }
      [(BWNode *)v3 addOutput:v15];
      v3->_boxedMetadataOutput = v15;
    }
    else
    {
LABEL_10:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v3;
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
  v5.super_class = (Class)BWSmartStyleInfoMetadataNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"SmartStyleInfoMetadata";
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
      id v7 = v6;
      if (CFEqual(v6, @"Start") || CFEqual(v7, @"Resume"))
      {
        self->_previousGeneratedMetadataBufferWasEmpty = 0;
        uint64_t v8 = (void *)CMGetAttachment(a3, @"RecordingSettings", 0);
        if (v8) {
          self->_currentRecordingSupportsReversibility = [v8 smartStyleReversibilitySupported];
        }
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
  else if (self->_currentRecordingSupportsReversibility)
  {
    uint64_t v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (v9)
    {
      CMTime v10 = v12;
      -[BWSmartStyleInfoMetadataNode _emitSmartStyleInfoBoxedMetadataForSampleBuffer:metadata:time:]((uint64_t)self, a3, v9, (uint64_t)&v10);
    }
  }
  else
  {
    CMTime v10 = v12;
    [(BWNodeOutput *)self->_boxedMetadataOutput emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA68160 pts:&v10]];
  }
  [(BWNodeOutput *)self->_passthruOutput emitSampleBuffer:a3];
}

- (void)_emitSmartStyleInfoBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:
{
  if (!a1) {
    return;
  }
  CMSampleBufferRef v37 = 0;
  CMBlockBufferRef v38 = 0;
  if ((*(unsigned char *)(a4 + 12) & 1) == 0)
  {
    CFDataRef Data = 0;
    goto LABEL_28;
  }
  int v9 = *(unsigned __int8 *)(a1 + 121);
  if (![a3 count]
    || (int v10 = *(unsigned __int8 *)(a1 + 140),
        error.duration.value = 0,
        char ShouldBeBypassed = BWSmartStyleRenderingShouldBeBypassed(a2),
        ImageBuffer = 0,
        (ShouldBeBypassed & 1) == 0)
    && ((AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA74860)) == 0
     || (ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0)
    || (v14 = BWSmartStyleInfoDictionary(a3, a3, ImageBuffer, 0, 0, 0, v10 != 0), ![v14 count]))
  {
    CFDataRef Data = 0;
LABEL_17:
    if (v9)
    {
      size_t sampleSizeArray = 0;
      goto LABEL_28;
    }
    v25 = (const void *)-[BWSmartStyleInfoMetadataNode _emptyMetadataBlockBuffer](a1);
    if (!v25)
    {
      CMBlockBufferRef v38 = 0;
      goto LABEL_28;
    }
    v23 = (OpaqueCMBlockBuffer *)CFRetain(v25);
    CMBlockBufferRef v38 = v23;
    if (!v23) {
      goto LABEL_28;
    }
    char v24 = 1;
    goto LABEL_22;
  }
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&error);
  if (error.duration.value) {
    CFRelease((CFTypeRef)error.duration.value);
  }
  if (!Data) {
    goto LABEL_17;
  }
  CFIndex Length = CFDataGetLength(Data);
  if (!Length) {
    goto LABEL_17;
  }
  CFIndex v18 = Length;
  size_t v19 = Length + 8;
  v20 = (UInt8 *)malloc_type_malloc(Length + 8, 0x902CAB6BuLL);
  if (!v20)
  {
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(blockBufferOut) = 0;
LABEL_38:
    FigDebugAssert3();
    goto LABEL_28;
  }
  v21 = v20;
  *(_DWORD *)v20 = bswap32(v19);
  *((_DWORD *)v20 + 1) = *(_DWORD *)(a1 + 136);
  v39.location = 0;
  v39.length = v18;
  CFDataGetBytes(Data, v39, v20 + 8);
  OSStatus v22 = CMBlockBufferCreateWithMemoryBlock(v15, v21, v19, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, v19, 0, &v38);
  if (v22)
  {
    OSStatus v32 = v22;
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(blockBufferOut) = v32;
    goto LABEL_38;
  }
  v23 = v38;
  size_t sampleSizeArray = 0;
  if (!v38) {
    goto LABEL_28;
  }
  char v24 = 0;
LABEL_22:
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&error.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&error.decodeTimeStamp.value = v26;
  CMTimeEpoch v27 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&error.duration.value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&error.duration.epoch = v28;
  *(_OWORD *)&error.presentationTimeStamp.value = *(_OWORD *)a4;
  CMTimeEpoch v29 = *(void *)(a4 + 16);
  error.decodeTimeStamp.epoch = v27;
  error.presentationTimeStamp.epoch = v29;
  size_t sampleSizeArray = CMBlockBufferGetDataLength(v23);
  OSStatus v30 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v38, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 112), 1, 1, &error, 1, &sampleSizeArray, &v37);
  if (v30)
  {
    OSStatus v31 = v30;
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(blockBufferOut) = v31;
    FigDebugAssert3();
  }
  if (v37)
  {
    objc_msgSend(*(id *)(a1 + 104), "emitSampleBuffer:");
    *(unsigned char *)(a1 + 121) = v24;
    if (!Data) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_OWORD *)&error.duration.value = *(_OWORD *)a4;
  error.duration.epoch = *(void *)(a4 + 16);
  objc_msgSend(*(id *)(a1 + 104), "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1EFA67FA0, &error, blockBufferOut, v34));
  if (Data) {
LABEL_29:
  }
    CFRelease(Data);
LABEL_30:
  if (v38) {
    CFRelease(v38);
  }
  if (v37) {
    CFRelease(v37);
  }
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