@interface BWCameraInfoMetadataNode
+ (void)initialize;
- (BWNodeOutput)boxedMetadataOutput;
- (BWNodeOutput)passthruOutput;
- (CMMetadataFormatDescriptionRef)_initForMotionMetadataSource:(void *)a1 generateLivePhotosMetadata:(uint64_t)a2 generateDebugMetadata:(int)a3;
- (id)initForLivePhotosMetadata:(BOOL)a3 generateDebugMetadata:(BOOL)a4;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_emptyMetadataBlockBuffer;
- (void)_emitLivePhotosAndDebugBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWCameraInfoMetadataNode

- (id)nodeType
{
  return @"Effect";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  -[BWNodeOutput setFormat:](self->_passthruOutput, "setFormat:", a3, a4);
  if (!self->_generateLivePhotosMetadata) {
    return;
  }
  $470D365275581EF16070F5A11344F73E Dimensions = ($470D365275581EF16070F5A11344F73E)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[a3 formatDescription]);
  CMMetadataFormatDescriptionRef v18 = 0;
  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  v7 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  uint64_t v8 = *MEMORY[0x1E4F1F108];
  [v7 setObject:@"mdta/com.apple.quicktime.live-photo-info" forKeyedSubscript:*MEMORY[0x1E4F1F108]];
  uint64_t v9 = *MEMORY[0x1E4F1F0F8];
  [v7 setObject:@"com.apple.quicktime.com.apple.quicktime.live-photo-info" forKeyedSubscript:*MEMORY[0x1E4F1F0F8]];
  uint64_t v20 = *MEMORY[0x1E4F1F120];
  v21[0] = *MEMORY[0x1E4F1CFC8];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1F118]];
  v11 = FigLivePhotoMetadataCopySetupDataAddingDimensions((const __CFData *)sLivePhotoMetadataSoftwareVersionSetupDataWithAtomHeader, *(void *)&Dimensions);
  if (v11)
  {
    v12 = v11;
    [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1F110]];
    CFRelease(v12);
  }
  CFArrayRef v13 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObject:v7];
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v13, &formatDescriptionOut))
  {
    fig_log_get_emitter();
    goto LABEL_17;
  }
  basicBoxedMetadataFormatDescription = self->_basicBoxedMetadataFormatDescription;
  if (basicBoxedMetadataFormatDescription)
  {
    OSStatus v16 = CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(v14, basicBoxedMetadataFormatDescription, formatDescriptionOut, &v18);
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
    if (!v16) {
      goto LABEL_11;
    }
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    return;
  }
  CMMetadataFormatDescriptionRef v18 = formatDescriptionOut;
  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
LABEL_11:
  [v7 objectForKeyedSubscript:v8];
  [v7 objectForKeyedSubscript:v9];
  self->_localIDForLivePhotosMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription) {
    CFRelease(boxedMetadataFormatDescription);
  }
  self->_boxedMetadataFormatDescription = v18;
  self->_video$470D365275581EF16070F5A11344F73E Dimensions = Dimensions;
  [(BWNodeOutput *)self->_boxedMetadataOutput setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:self->_boxedMetadataFormatDescription]];
}

- (id)initForLivePhotosMetadata:(BOOL)a3 generateDebugMetadata:(BOOL)a4
{
  return -[BWCameraInfoMetadataNode _initForMotionMetadataSource:generateLivePhotosMetadata:generateDebugMetadata:](self, (uint64_t)a2, a3);
}

- (BWNodeOutput)boxedMetadataOutput
{
  return self->_boxedMetadataOutput;
}

- (CMMetadataFormatDescriptionRef)_initForMotionMetadataSource:(void *)a1 generateLivePhotosMetadata:(uint64_t)a2 generateDebugMetadata:(int)a3
{
  if (!a1) {
    return 0;
  }
  v11.receiver = a1;
  v11.super_class = (Class)BWCameraInfoMetadataNode;
  v4 = (CMMetadataFormatDescriptionRef *)objc_msgSendSuper2(&v11, sel_init);
  if (v4)
  {
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v5 setFormatRequirements:v6];

    [(BWNodeInput *)v5 setPassthroughMode:1];
    [(CMMetadataFormatDescriptionRef *)v4 addInput:v5];

    *((_DWORD *)v4 + 38) = 0;
    *((_DWORD *)v4 + 39) = 0;
    CFArrayRef v7 = (const __CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3)
    {
      MEMORY[0x1A62711C0](&_initForMotionMetadataSource_generateLivePhotosMetadata_generateDebugMetadata__s_cimn_registerLivePhotosMetadata_once, cimn_registerLivePhotosMetadata_once);
      *((unsigned char *)v4 + 96) = 1;
    }
    if ([(__CFArray *)v7 count])
    {
      if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v7, v4 + 14))
      {

        return 0;
      }
      v4[13] = (CMMetadataFormatDescriptionRef)CFRetain(v4[14]);
    }
    uint64_t v8 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeOutput *)v8 setName:@"CameraPassThru"];
    [(BWNodeOutput *)v8 setPassthroughMode:1];
    [(CMMetadataFormatDescriptionRef *)v4 addOutput:v8];
    v4[17] = (CMMetadataFormatDescriptionRef)v8;

    uint64_t v9 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v4];
    [(BWNodeOutput *)v9 setName:@"CameraInfoMetadata"];
    if (v4[13]) {
      [(BWNodeOutput *)v9 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:")];
    }
    [(CMMetadataFormatDescriptionRef *)v4 addOutput:v9];
    v4[18] = (CMMetadataFormatDescriptionRef)v9;
  }
  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  basicBoxedMetadataFormatDescription = self->_basicBoxedMetadataFormatDescription;
  if (basicBoxedMetadataFormatDescription) {
    CFRelease(basicBoxedMetadataFormatDescription);
  }
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription) {
    CFRelease(boxedMetadataFormatDescription);
  }
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData) {
    CFRelease(emptyMetadataSampleData);
  }
  v6.receiver = self;
  v6.super_class = (Class)BWCameraInfoMetadataNode;
  [(BWNode *)&v6 dealloc];
}

- (id)nodeSubType
{
  return @"CameraInfoMetadata";
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
  memset(&v11, 0, sizeof(v11));
  CMSampleBufferGetPresentationTimeStamp(&v11, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    CFTypeRef v6 = CMGetAttachment(a3, @"FileWriterAction", 0);
    if (v6)
    {
      CFArrayRef v7 = v6;
      if (CFEqual(v6, @"Start") || CFEqual(v7, @"Resume")) {
        self->_previousGeneratedMetadataBufferWasEmpty = 0;
      }
    }
    CMSampleBufferRef sampleBufferOut = 0;
    if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, &sampleBufferOut))
    {
      CMTime v9 = v11;
      [(BWNodeOutput *)self->_boxedMetadataOutput emitDroppedSample:+[BWDroppedSample newDroppedSampleWithReason:0x1EFA67FA0 pts:&v9]];
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
    if (v8 && self->_generateLivePhotosMetadata)
    {
      CMTime v9 = v11;
      -[BWCameraInfoMetadataNode _emitLivePhotosAndDebugBoxedMetadataForSampleBuffer:metadata:time:]((uint64_t)self, a3, v8, (uint64_t)&v9);
    }
  }
  [(BWNodeOutput *)self->_passthruOutput emitSampleBuffer:a3];
}

- (void)_emitLivePhotosAndDebugBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:
{
  if (!a1) {
    return;
  }
  uint64_t v51 = 0;
  v52[0] = 0;
  CMBlockBufferRef v49 = 0;
  uint64_t v50 = 0;
  CMSampleBufferRef v48 = 0;
  int v7 = *(unsigned __int8 *)(a1 + 120);
  BOOL v8 = *(unsigned char *)(a1 + 120) != 0;
  if ((*(unsigned char *)(a4 + 12) & 1) == 0)
  {
    v22 = 0;
    CFDictionaryRef CorrectedDetectedObjects = 0;
    CFDictionaryRef v20 = 0;
    CFDictionaryRef v19 = 0;
    id v18 = 0;
    goto LABEL_34;
  }
  if (![a3 count] || !*(unsigned char *)(a1 + 96))
  {
    id v18 = 0;
    CFDictionaryRef v19 = 0;
    CFDictionaryRef v20 = 0;
    CFDictionaryRef CorrectedDetectedObjects = 0;
    v22 = 0;
    if (!v7) {
      goto LABEL_23;
    }
    goto LABEL_10;
  }
  sampleTimingArray.duration.value = 0;
  *(void *)&sampleTimingArray.duration.timescale = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&sampleTimingArray.duration.epoch = _Q0;
  FigCFDictionaryGetCGRectIfPresent();
  OSStatus v16 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
  signed int v17 = [v16 count];
  if (v17 < 1)
  {
    id v45 = 0;
  }
  else if (*(double *)&sampleTimingArray.duration.epoch == 1.0 {
         && *(double *)&sampleTimingArray.presentationTimeStamp.value == 1.0)
  }
  {
    id v45 = v16;
  }
  else
  {
    id v45 = BWCreateCorrectedFacesArray(v16, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
    signed int v17 = [v45 count];
  }
  v23 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
  id v18 = v23;
  v44 = a2;
  if (v23)
  {
    if ([v23 count])
    {
      CFDictionaryRef CorrectedDetectedObjects = (const __CFDictionary *)cimn_createCorrectedDetectedObjects((void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F538C0]], (_DWORD *)&v51 + 1, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      CFDictionaryRef v20 = (const __CFDictionary *)cimn_createCorrectedDetectedObjects((void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F538A0]], &v51, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      CFDictionaryRef v19 = (const __CFDictionary *)cimn_createCorrectedDetectedObjects((void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F538B0]], (_DWORD *)&v50 + 1, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      id v18 = cimn_createCorrectedDetectedObjects((void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F538E8]], &v50, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      unsigned int v25 = v51;
      unsigned int v24 = HIDWORD(v51);
      unsigned int v27 = v50;
      unsigned int v26 = HIDWORD(v50);
    }
    else
    {
      unsigned int v27 = 0;
      unsigned int v26 = 0;
      unsigned int v25 = 0;
      unsigned int v24 = 0;
      CFDictionaryRef CorrectedDetectedObjects = 0;
      CFDictionaryRef v20 = 0;
      CFDictionaryRef v19 = 0;
      id v18 = 0;
    }
  }
  else
  {
    unsigned int v27 = 0;
    unsigned int v26 = 0;
    unsigned int v25 = 0;
    unsigned int v24 = 0;
    CFDictionaryRef CorrectedDetectedObjects = 0;
    CFDictionaryRef v20 = 0;
    CFDictionaryRef v19 = 0;
  }
  FigLivePhotoMetadataComputeSerializationSizeV3(3u, v17, v24, v25, v26, v27, v52);
  if (v52[0])
  {
    size_t v28 = v52[0] + 8;
    v29 = (unsigned int *)malloc_type_malloc(v52[0] + 8, 0xB9949744uLL);
    v30 = v29;
    size_t v31 = v52[0];
    if (!v52[0]
      || (unsigned int *v29 = bswap32(LODWORD(v52[0]) + 8),
          v29[1] = *(_DWORD *)(a1 + 160),
          *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a4,
          sampleTimingArray.duration.epoch = *(void *)(a4 + 16),
          !FigLivePhotoMetadataSerializeIntoBufferV3(v44, (CGPoint *)&sampleTimingArray, (const __CFDictionary *)a3, (const __CFArray *)v45, CorrectedDetectedObjects, v20, v19, (const __CFDictionary *)v18, 3u, v31, v29 + 2)))
    {
      OSStatus v34 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v30, v28, (CFAllocatorRef)*MEMORY[0x1E4F1CF90], 0, 0, v28, 0, &v49);
      if (v34)
      {
        OSStatus v41 = v34;
        fig_log_get_emitter();
        uint64_t v43 = v4;
        LODWORD(blockBufferOut) = v41;
        FigDebugAssert3();
        v22 = v45;
LABEL_39:
        *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a4;
        sampleTimingArray.duration.epoch = *(void *)(a4 + 16);
        objc_msgSend(*(id *)(a1 + 144), "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1EFA67FA0, &sampleTimingArray, blockBufferOut, v43));
        goto LABEL_40;
      }
      BOOL v8 = 0;
      v22 = v45;
LABEL_28:
      v33 = v49;
      size_t sampleSizeArray = 0;
      if (v49) {
        goto LABEL_29;
      }
LABEL_34:
      BOOL v40 = 0;
      goto LABEL_35;
    }
    free(v30);
    v52[0] = 0;
  }
  v22 = v45;
  if (v7)
  {
LABEL_10:
    BOOL v8 = 1;
    goto LABEL_28;
  }
LABEL_23:
  v32 = (const void *)-[BWCameraInfoMetadataNode _emptyMetadataBlockBuffer](a1);
  if (!v32)
  {
    BOOL v8 = 0;
    BOOL v40 = 0;
    CMBlockBufferRef v49 = 0;
    goto LABEL_35;
  }
  v33 = (OpaqueCMBlockBuffer *)CFRetain(v32);
  CMBlockBufferRef v49 = v33;
  if (!v33)
  {
    BOOL v8 = 0;
    goto LABEL_34;
  }
  BOOL v8 = 1;
LABEL_29:
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v35;
  CMTimeEpoch v36 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v37 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
  *(_OWORD *)&sampleTimingArray.duration.epoch = v37;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a4;
  CMTimeEpoch v38 = *(void *)(a4 + 16);
  sampleTimingArray.decodeTimeStamp.epoch = v36;
  sampleTimingArray.presentationTimeStamp.epoch = v38;
  size_t sampleSizeArray = CMBlockBufferGetDataLength(v33);
  OSStatus v39 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v49, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 104), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v48);
  if (v39)
  {
    fig_log_get_emitter();
    uint64_t v43 = v4;
    LODWORD(blockBufferOut) = v39;
    FigDebugAssert3();
  }
  BOOL v40 = v39 != 0;
LABEL_35:
  if (v40 || !v48) {
    goto LABEL_39;
  }
  objc_msgSend(*(id *)(a1 + 144), "emitSampleBuffer:");
  *(unsigned char *)(a1 + 120) = v8;
LABEL_40:

  if (v49) {
    CFRelease(v49);
  }
  if (v48) {
    CFRelease(v48);
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

@end