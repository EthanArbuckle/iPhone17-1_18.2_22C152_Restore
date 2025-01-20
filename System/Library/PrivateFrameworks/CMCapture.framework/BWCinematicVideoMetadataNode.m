@interface BWCinematicVideoMetadataNode
+ (void)initialize;
- (BWCinematicVideoMetadataNode)init;
- (BWNodeOutput)metadataOutput;
- (BWNodeOutput)passthruOutput;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_emptyMetadataBlockBuffer;
- (void)_emitCopyOfMarkerBuffer:(void *)a3 onOutput:;
- (void)_emitMetadataWithCinematographyMetadata:(uint64_t)a3 time:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWCinematicVideoMetadataNode

+ (void)initialize
{
}

- (BWCinematicVideoMetadataNode)init
{
  v43[3] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)BWCinematicVideoMetadataNode;
  v2 = [(BWNode *)&v21 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v3 setFormatRequirements:v4];

    [(BWNodeInput *)v3 setPassthroughMode:1];
    [(BWNode *)v2 addInput:v3];

    uint64_t v6 = *MEMORY[0x1E4F1F0F8];
    v41[0] = *MEMORY[0x1E4F1F108];
    uint64_t v5 = v41[0];
    v41[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1EFD0];
    v43[0] = @"mdta/com.apple.quicktime.aperture-float";
    v43[1] = v7;
    uint64_t v42 = *MEMORY[0x1E4F1F118];
    uint64_t v8 = v42;
    uint64_t v39 = *MEMORY[0x1E4F1F120];
    uint64_t v9 = v39;
    uint64_t v40 = *MEMORY[0x1E4F1CFC8];
    uint64_t v10 = v40;
    v43[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v20 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v41 count:3];
    v37[0] = v5;
    v37[1] = v6;
    v38[0] = @"mdta/com.apple.quicktime.disparity-float";
    v38[1] = v7;
    v37[2] = v8;
    uint64_t v35 = v9;
    uint64_t v36 = v10;
    v38[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v19 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
    v33[0] = v5;
    v33[1] = v6;
    uint64_t v11 = *MEMORY[0x1E4F1F020];
    v34[0] = @"mdta/com.apple.quicktime.cinematic-video.cinematography";
    v34[1] = v11;
    v33[2] = v8;
    uint64_t v31 = v9;
    uint64_t v32 = v10;
    v34[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v12 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    v29[0] = v5;
    v29[1] = v6;
    v30[0] = @"mdta/com.apple.quicktime.cinematic-video.rendering";
    v30[1] = v11;
    v29[2] = v8;
    uint64_t v27 = v9;
    uint64_t v28 = v10;
    v30[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v13 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
    v25[0] = v5;
    v25[1] = v6;
    v26[0] = @"mdta/com.apple.quicktime.cinematic-video.stabilization";
    v26[1] = v11;
    v25[2] = v8;
    uint64_t v23 = v9;
    uint64_t v24 = v10;
    v26[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v14 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    v22[0] = v20;
    v22[1] = v19;
    v22[2] = v12;
    v22[3] = v13;
    v22[4] = v14;
    CFArrayRef v15 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v15, &v2->_metadataFormatDescription))
    {

      return 0;
    }
    else
    {
      [v20 objectForKeyedSubscript:v5];
      [v20 objectForKeyedSubscript:v6];
      v2->_localIDForAperture_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      [v19 objectForKeyedSubscript:v5];
      [v19 objectForKeyedSubscript:v6];
      v2->_localIDForDisparity_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      [v12 objectForKeyedSubscript:v5];
      [v12 objectForKeyedSubscript:v6];
      v2->_localIDForCinematographyMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      [v13 objectForKeyedSubscript:v5];
      [v13 objectForKeyedSubscript:v6];
      v2->_localIDForRenderingMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      [v14 objectForKeyedSubscript:v5];
      [v14 objectForKeyedSubscript:v6];
      v2->_localIDForStabilizationMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      v16 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v2];
      [(BWNodeOutput *)v16 setName:@"PassThru"];
      [(BWNodeOutput *)v16 setPassthroughMode:1];
      [(BWNode *)v2 addOutput:v16];
      v2->_passthruOutput = v16;

      v17 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v2];
      [(BWNodeOutput *)v17 setName:@"CinematicVideoMetadata"];
      [(BWNodeOutput *)v17 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:v2->_metadataFormatDescription]];
      [(BWNode *)v2 addOutput:v17];
      v2->_metadataOutput = v17;
    }
  }
  return v2;
}

- (void)dealloc
{
  metadataFormatDescription = self->_metadataFormatDescription;
  if (metadataFormatDescription) {
    CFRelease(metadataFormatDescription);
  }
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData) {
    CFRelease(emptyMetadataSampleData);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWCinematicVideoMetadataNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"CinematicVideoMetadata";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  [(BWNodeOutput *)self->_passthruOutput makeConfiguredFormatLive];
  metadataOutput = self->_metadataOutput;
  [(BWNodeOutput *)metadataOutput makeConfiguredFormatLive];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(BWNodeOutput *)self->_passthruOutput markEndOfLiveOutput];
  metadataOutput = self->_metadataOutput;
  [(BWNodeOutput *)metadataOutput markEndOfLiveOutput];
}

- (void)_emitCopyOfMarkerBuffer:(void *)a3 onOutput:
{
  if (a1)
  {
    if (a3)
    {
      CMSampleBufferRef sampleBufferOut = 0;
      memset(&v5, 0, sizeof(v5));
      CMSampleBufferGetPresentationTimeStamp(&v5, sbuf);
      if (!CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], sbuf, &sampleBufferOut))
      {
        [a3 emitSampleBuffer:sampleBufferOut];
        if (sampleBufferOut) {
          CFRelease(sampleBufferOut);
        }
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(&v20, 0, sizeof(v20));
  CMSampleBufferGetPresentationTimeStamp(&v20, a3);
  uint64_t v6 = (void *)CMGetAttachment(a3, @"CinematicVideoMetadata", 0);
  if (v6)
  {
    uint64_t v7 = v6;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = (void *)[v12 objectForKeyedSubscript:0x1EFA73360];
          memset(&v15, 0, sizeof(v15));
          CMTimeMakeFromDictionary(&v15, (CFDictionaryRef)[v13 objectForKeyedSubscript:0x1EFA4F900]);
          CMTime v14 = v15;
          -[BWCinematicVideoMetadataNode _emitMetadataWithCinematographyMetadata:time:]((uint64_t)self, v12, (uint64_t)&v14);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }
  }
  if (BWSampleBufferIsMarkerBuffer(a3)) {
    -[BWCinematicVideoMetadataNode _emitCopyOfMarkerBuffer:onOutput:]((uint64_t)self, a3, self->_metadataOutput);
  }
  if (!CMGetAttachment(a3, @"RefinedCinematographyStreamEndMarker", 0)) {
    [(BWNodeOutput *)self->_passthruOutput emitSampleBuffer:a3];
  }
}

- (void)_emitMetadataWithCinematographyMetadata:(uint64_t)a3 time:
{
  if (!a1) {
    return;
  }
  CMBlockBufferRef v46 = 0;
  CMSampleBufferRef v47 = 0;
  int v7 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v8 = (void *)[a2 objectForKeyedSubscript:0x1EFA73360];
  if (v8 && (uint64_t v9 = v8, [v8 objectForKeyedSubscript:0x1EFA732E0]))
  {
    uint64_t v42 = v3;
    sampleTimingArray.duration.value = 0;
    uint64_t v10 = [v9 objectForKeyedSubscript:0x1EFA732E0];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [(id)getPTSerializationClass() writeObject:v10 toData:v11 options:0 error:&sampleTimingArray];
    int v12 = [v11 length];
    v13 = (void *)[a2 objectForKeyedSubscript:0x1EFA73380];
    if (v13)
    {
      CMTime v14 = v13;
      CMTime v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v13, "sizeOfSerializedObjectWithOptions:", 0));
      [v14 writeToData:v15 withOptions:0];
      int v16 = v12 + [v15 length] + 16;
    }
    else
    {
      CMTime v15 = 0;
      int v16 = v12 + 8;
    }
    objc_super v21 = (void *)[a2 objectForKeyedSubscript:0x1EFA733A0];
    uint64_t v43 = a3;
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v21, "sizeOfSerializedObjectWithOptions:", 0));
      [v22 writeToData:v23 withOptions:0];
      v16 += [v23 length] + 8;
    }
    else
    {
      uint64_t v23 = 0;
    }
    size_t v24 = (v16 + 24);
    long long v17 = malloc_type_malloc(v24, 0x611D96CuLL);
    _DWORD *v17 = bswap32([v11 length] + 8);
    v17[1] = *(_DWORD *)(a1 + 144);
    memcpy(v17 + 2, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
    uint64_t v25 = [v11 length];
    uint64_t v26 = v25 + 8;

    if (v15)
    {
      *(_DWORD *)((char *)v17 + v26) = bswap32([v15 length] + 8);
      *(_DWORD *)((char *)v17 + v25 + 12) = *(_DWORD *)(a1 + 148);
      memcpy((char *)v17 + v26 + 8, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
      uint64_t v26 = v25 + [v15 length] + 16;
    }
    a3 = v43;
    if (v23)
    {
      int v27 = [v23 length];
      uint64_t v28 = (_DWORD *)((char *)v17 + v26);
      *uint64_t v28 = bswap32(v27 + 8);
      v28[1] = *(_DWORD *)(a1 + 152);
      memcpy((char *)v17 + v26 + 8, (const void *)[v23 bytes], objc_msgSend(v23, "length"));
      v26 += [v23 length] + 8;
    }
    v29 = (_DWORD *)((char *)v17 + v26);
    _DWORD *v29 = 201326592;
    v29[1] = *(_DWORD *)(a1 + 136);
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1EFA73280), "floatValue");
    v29[2] = bswap32(v30);
    void v29[3] = 201326592;
    v29[4] = *(_DWORD *)(a1 + 140);
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1EFA732C0), "floatValue");
    v29[5] = bswap32(v31);
    OSStatus v32 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v17, v24, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, v24, 0, &v46);
    if (v32)
    {
      OSStatus v38 = v32;
      fig_log_get_emitter();
      uint64_t v41 = v3;
      LODWORD(blockBufferOut) = v38;
      FigDebugAssert3();
      goto LABEL_28;
    }
    long long v19 = v46;
    size_t sampleSizeArray = 0;
    if (!v46) {
      goto LABEL_26;
    }
    char v20 = 0;
  }
  else
  {
    if (v7)
    {
      long long v17 = 0;
      size_t sampleSizeArray = 0;
LABEL_28:
      *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a3;
      sampleTimingArray.duration.epoch = *(void *)(a3 + 16);
      objc_msgSend(*(id *)(a1 + 128), "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1EFA68020, &sampleTimingArray, blockBufferOut, v41));
      goto LABEL_29;
    }
    long long v18 = (const void *)-[BWCinematicVideoMetadataNode _emptyMetadataBlockBuffer](a1);
    if (!v18)
    {
      long long v17 = 0;
      CMBlockBufferRef v46 = 0;
      goto LABEL_28;
    }
    uint64_t v42 = v3;
    long long v19 = (OpaqueCMBlockBuffer *)CFRetain(v18);
    CMBlockBufferRef v46 = v19;
    if (!v19)
    {
LABEL_26:
      long long v17 = 0;
      goto LABEL_28;
    }
    char v20 = 1;
  }
  long long v33 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v33;
  CMTimeEpoch v34 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&sampleTimingArray.duration.epoch = v35;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a3;
  CMTimeEpoch v36 = *(void *)(a3 + 16);
  sampleTimingArray.decodeTimeStamp.epoch = v34;
  sampleTimingArray.presentationTimeStamp.epoch = v36;
  size_t sampleSizeArray = CMBlockBufferGetDataLength(v19);
  OSStatus v37 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v46, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 96), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v47);
  if (v37)
  {
    OSStatus v39 = v37;
    fig_log_get_emitter();
    uint64_t v41 = v42;
    LODWORD(blockBufferOut) = v39;
    FigDebugAssert3();
  }
  if (!v47) {
    goto LABEL_26;
  }
  objc_msgSend(*(id *)(a1 + 128), "emitSampleBuffer:");
  long long v17 = 0;
  *(unsigned char *)(a1 + 104) = v20;
LABEL_29:
  if (v46) {
    CFRelease(v46);
  }
  if (v47) {
    CFRelease(v47);
  }
  free(v17);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitDroppedSample:](self->_passthruOutput, "emitDroppedSample:", a3, a4);
  metadataOutput = self->_metadataOutput;
  [(BWNodeOutput *)metadataOutput emitDroppedSample:a3];
}

- (uint64_t)_emptyMetadataBlockBuffer
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 112))
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 8uLL, 1u, (CMBlockBufferRef *)(result + 112)))
      {
        fig_log_get_emitter();
      }
      else
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(*(CMBlockBufferRef *)(v1 + 112), 0, 0, 0, &dataPointerOut))
        {
          *(void *)dataPointerOut = 0x8000000;
          return *(void *)(v1 + 112);
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    return *(void *)(v1 + 112);
  }
  return result;
}

- (BWNodeOutput)passthruOutput
{
  return self->_passthruOutput;
}

- (BWNodeOutput)metadataOutput
{
  return self->_metadataOutput;
}

@end