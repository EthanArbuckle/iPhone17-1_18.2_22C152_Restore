@interface BWVideoOrientationMetadataNode
+ (void)initialize;
- (BOOL)physicalMirroringForMovieRecordingEnabled;
- (BWVideoOrientationMetadataNode)init;
- (BWVideoOrientationTimeMachine)videoOrientationTimeMachine;
- (OpaqueCMClock)masterClock;
- (id)nodeSubType;
- (id)nodeType;
- (int)sourceDeviceType;
- (int)sourcePosition;
- (uint64_t)_determineExifOrientation;
- (void)_emitBufferForNewStateIfRecording;
- (void)_emitValidatedVideoOrientationSampleBufferForBoxedFormatOutputAtTime:(uint64_t)a1;
- (void)_releaseCachedBBufs;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setMasterClock:(OpaqueCMClock *)a3;
- (void)setPhysicalMirroringForMovieRecordingEnabled:(BOOL)a3;
- (void)setSourceDeviceType:(int)a3;
- (void)setSourcePosition:(int)a3;
- (void)updateVideoMirrored:(BOOL)a3;
- (void)updateVideoOrientation:(int)a3;
@end

@implementation BWVideoOrientationMetadataNode

- (id)nodeType
{
  return @"Effect";
}

- (void)setSourcePosition:(int)a3
{
  if (self->_sourcePosition != a3) {
    self->_sourcePosition = a3;
  }
}

- (void)setSourceDeviceType:(int)a3
{
  if (self->_sourceDeviceType != a3) {
    self->_sourceDeviceType = a3;
  }
}

- (void)setPhysicalMirroringForMovieRecordingEnabled:(BOOL)a3
{
  self->_physicalMirroringForMovieRecordingEnabled = a3;
}

- (void)setMasterClock:(OpaqueCMClock *)a3
{
  masterClock = self->_masterClock;
  self->_masterClock = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (masterClock)
  {
    CFRelease(masterClock);
  }
}

- (BWVideoOrientationMetadataNode)init
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)BWVideoOrientationMetadataNode;
  v2 = [(BWNode *)&v15 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v3 setFormatRequirements:v4];

    [v2 addInput:v3];
    v5 = (const void *)*MEMORY[0x1E4F1F108];
    uint64_t v6 = *MEMORY[0x1E4F1F170];
    v7 = (const void *)*MEMORY[0x1E4F1F0F8];
    v18[0] = *MEMORY[0x1E4F1F108];
    v18[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1F030];
    v19[0] = v6;
    v19[1] = v8;
    v18[2] = *MEMORY[0x1E4F1F118];
    uint64_t v16 = *MEMORY[0x1E4F1F120];
    uint64_t v17 = *MEMORY[0x1E4F1CFC8];
    v19[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    CFDictionaryRef v9 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    CFArrayRef v10 = (const __CFArray *)[MEMORY[0x1E4F1CA48] arrayWithObject:v9];
    v11 = v2 + 128;
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v10, (CMMetadataFormatDescriptionRef *)v2 + 16))
    {

      return 0;
    }
    else
    {
      CFDictionaryGetValue(v9, v5);
      CFDictionaryGetValue(v9, v7);
      CFDictionaryGetValue(v9, (const void *)*MEMORY[0x1E4F1F100]);
      *((_DWORD *)v2 + 34) = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      v12 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v2];
      [(BWNodeOutput *)v12 setName:@"VideoOrientationMetadata"];
      [(BWNodeOutput *)v12 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:*v11]];
      [v2 addOutput:v12];

      *((void *)v2 + 28) = FigDispatchQueueCreateWithPriority();
      CMClockRef HostTimeClock = CMClockGetHostTimeClock();
      *((void *)v2 + 12) = CFRetain(HostTimeClock);
      *(_OWORD *)(v2 + 152) = 0u;
      *(_OWORD *)(v2 + 168) = 0u;
      *(_OWORD *)(v2 + 184) = 0u;
      *(_OWORD *)(v2 + 200) = 0u;
      *((_DWORD *)v2 + 28) = 0;
      v2[116] = 0;
      *((_DWORD *)v2 + 30) = 0;
      *((_DWORD *)v2 + 31) = 0;
      *((_DWORD *)v2 + 36) = 0;
      *((void *)v2 + 27) = [[BWVideoOrientationTimeMachine alloc] initWithCapacity:100 formatDescription:*v11 metadataLocalID:*((unsigned int *)v2 + 34)];
    }
  }
  return (BWVideoOrientationMetadataNode *)v2;
}

- (BWVideoOrientationTimeMachine)videoOrientationTimeMachine
{
  return self->_videoOrientationTimeMachine;
}

+ (void)initialize
{
}

- (void)dealloc
{
  clock = self->_clock;
  if (clock) {
    CFRelease(clock);
  }
  masterClock = self->_masterClock;
  if (masterClock) {
    CFRelease(masterClock);
  }
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription) {
    CFRelease(boxedMetadataFormatDescription);
  }
  -[BWVideoOrientationMetadataNode _releaseCachedBBufs]((uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)BWVideoOrientationMetadataNode;
  [(BWNode *)&v6 dealloc];
}

- (void)_releaseCachedBBufs
{
  if (a1)
  {
    for (uint64_t i = 0; i != 64; i += 8)
    {
      v3 = *(const void **)(a1 + 152 + i);
      if (v3)
      {
        CFRelease(v3);
        *(void *)(a1 + 152 + i) = 0;
      }
    }
  }
}

- (void)updateVideoOrientation:(int)a3
{
  if ((a3 - 5) <= 0xFFFFFFFB)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__BWVideoOrientationMetadataNode_updateVideoOrientation___block_invoke;
    block[3] = &unk_1E5C262A0;
    block[4] = self;
    int v5 = a3;
    dispatch_async(emitSamplesDispatchQueue, block);
  }
}

void __57__BWVideoOrientationMetadataNode_updateVideoOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 112) != v2)
  {
    *(_DWORD *)(v1 + 112) = v2;
    -[BWVideoOrientationMetadataNode _determineExifOrientation](*(void *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 32);
    -[BWVideoOrientationMetadataNode _emitBufferForNewStateIfRecording](v4);
  }
}

- (uint64_t)_determineExifOrientation
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(_DWORD *)(result + 112);
    if (v2)
    {
      int v3 = *(_DWORD *)(result + 120);
      if (v3)
      {
        int v4 = *(unsigned __int8 *)(result + 116);
        BOOL v5 = v3 == 2;
        BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(*(_DWORD *)(result + 124));
        int v7 = *(unsigned __int8 *)(v1 + 142);
        objc_msgSend((id)objc_msgSend((id)v1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
        result = FigCaptureMetadataUtilitiesExifOrientationFromOrientationAndCameraPosition(v2, v4, v5, IsExtensionDeviceType, v7);
        *(_DWORD *)(v1 + 144) = result;
      }
    }
  }
  return result;
}

- (void)_emitBufferForNewStateIfRecording
{
  if (a1 && *(unsigned char *)(a1 + 143))
  {
    memset(&v4, 0, sizeof(v4));
    CMClockGetTime(&time, *(CMClockRef *)(a1 + 96));
    CMSyncConvertTime(&v4, &time, *(CMClockOrTimebaseRef *)(a1 + 96), *(CMClockOrTimebaseRef *)(a1 + 104));
    if (v4.flags)
    {
      CMTime v2 = v4;
      -[BWVideoOrientationMetadataNode _emitValidatedVideoOrientationSampleBufferForBoxedFormatOutputAtTime:](a1, (long long *)&v2.value);
    }
  }
}

- (void)updateVideoMirrored:(BOOL)a3
{
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__BWVideoOrientationMetadataNode_updateVideoMirrored___block_invoke;
  v4[3] = &unk_1E5C24B78;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(emitSamplesDispatchQueue, v4);
}

void __54__BWVideoOrientationMetadataNode_updateVideoMirrored___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 116) != v2)
  {
    *(unsigned char *)(v1 + 116) = v2;
    -[BWVideoOrientationMetadataNode _determineExifOrientation](*(void *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 32);
    -[BWVideoOrientationMetadataNode _emitBufferForNewStateIfRecording](v4);
  }
}

- (OpaqueCMClock)masterClock
{
  masterClock = self->_masterClock;
  if (masterClock)
  {
    CFRetain(self->_masterClock);
    CFAutorelease(masterClock);
  }
  return masterClock;
}

- (int)sourcePosition
{
  return self->_sourcePosition;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (BOOL)physicalMirroringForMovieRecordingEnabled
{
  return self->_physicalMirroringForMovieRecordingEnabled;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  if (!self->_masterClock)
  {
    int v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3B8];
    uint64_t v4 = @"Cannot become active because masterClock was never set";
    goto LABEL_6;
  }
  if (!self->_sourcePosition)
  {
    int v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3B8];
    uint64_t v4 = @"Cannot become active because a valid sourcePosition was never set";
LABEL_6:
    objc_exception_throw((id)[v2 exceptionWithName:v3 reason:v4 userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWVideoOrientationMetadataNode;
  [(BWNode *)&v5 prepareForCurrentConfigurationToBecomeLive];
}

- (id)nodeSubType
{
  return @"VideoOrientationMetadata";
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if ([(BWNodeOutput *)self->super._output consumer])
  {
    emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__BWVideoOrientationMetadataNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_async(emitSamplesDispatchQueue, block);
  }
}

uint64_t __90__BWVideoOrientationMetadataNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) makeConfiguredFormatLive];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BWVideoOrientationMetadataNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(emitSamplesDispatchQueue, block);
}

uint64_t __60__BWVideoOrientationMetadataNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 143) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 16) markEndOfLiveOutput];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4 = a3;
  CMSampleBufferRef sampleBufferOut = 0;
  if (!BWSampleBufferIsMarkerBuffer(a3)) {
    return;
  }
  if (qtmfsn_bufferSpecifiesFileWriterAction(v4, @"Start"))
  {
    objc_super v6 = (void *)CMGetAttachment(v4, @"RecordingSettings", 0);
    if (!v6)
    {
      unsigned __int8 v10 = 0;
      int recordVideoOrientationAndMirroringChanges = 0;
      char v9 = 0;
      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int recordVideoOrientationAndMirroringChanges = [v6 recordVideoOrientationAndMirroringChanges];
      self->_int recordVideoOrientationAndMirroringChanges = recordVideoOrientationAndMirroringChanges;
      self->_flipMetadataHorizontally = 0;
      if (self->_physicalMirroringForMovieRecordingEnabled)
      {
        if (![v6 isIrisRecording] || (int v8 = objc_msgSend(v6, "isIrisMovieRecording")) != 0) {
          LOBYTE(v8) = [v6 videoMirrored];
        }
        self->_flipMetadataHorizontally = v8;
      }
      if (!self->_recordVideoOrientationAndMirroringChanges
        && !CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, &sampleBufferOut))
      {
        unsigned __int8 v10 = 1;
        CMSetAttachment(sampleBufferOut, @"FileWriterStartActionModifier_NoDataWillBeProvidedForThisRecording", (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
        char v9 = 0;
        uint64_t v4 = sampleBufferOut;
        goto LABEL_23;
      }
      char v9 = 0;
      goto LABEL_15;
    }
    unsigned __int8 v10 = 0;
LABEL_22:
    int recordVideoOrientationAndMirroringChanges = 0;
    char v9 = 0;
    objc_super v6 = 0;
    goto LABEL_23;
  }
  if (!qtmfsn_bufferSpecifiesFileWriterAction(v4, @"Resume"))
  {
    if ((qtmfsn_bufferSpecifiesFileWriterAction(v4, @"Stop") & 1) != 0
      || (qtmfsn_bufferSpecifiesFileWriterAction(v4, @"Flush") & 1) != 0
      || qtmfsn_bufferSpecifiesFileWriterAction(v4, @"Terminate"))
    {
      CMGetAttachment(v4, @"FileWriterAction", 0);
      int recordVideoOrientationAndMirroringChanges = 0;
      objc_super v6 = 0;
      unsigned __int8 v10 = 1;
      char v9 = 1;
      goto LABEL_23;
    }
    unsigned __int8 v10 = qtmfsn_bufferSpecifiesFileWriterAction(v4, @"Pause");
    goto LABEL_22;
  }
  char v9 = 0;
  objc_super v6 = 0;
  int recordVideoOrientationAndMirroringChanges = self->_recordVideoOrientationAndMirroringChanges;
LABEL_15:
  unsigned __int8 v10 = 1;
LABEL_23:
  CFRetain(v4);
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke;
  block[3] = &unk_1E5C283F0;
  block[4] = self;
  void block[5] = v4;
  unsigned __int8 v17 = v10;
  char v18 = recordVideoOrientationAndMirroringChanges;
  char v19 = v9;
  dispatch_async(emitSamplesDispatchQueue, block);
  if (recordVideoOrientationAndMirroringChanges)
  {
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetPresentationTimeStamp(&v15, v4);
    v12 = self->_emitSamplesDispatchQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke_2;
    v13[3] = &unk_1E5C26E48;
    v13[4] = v6;
    v13[5] = self;
    CMTime v14 = v15;
    dispatch_async(v12, v13);
  }
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
}

void __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && !*(unsigned char *)(a1 + 49))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 143) = 0;
    if (*(unsigned char *)(a1 + 50))
    {
      -[BWVideoOrientationMetadataNode _releaseCachedBBufs](*(void *)(a1 + 32));
      *(_DWORD *)(*(void *)(a1 + 32) + 112) = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 144) = 0;
    }
  }
}

void __62__BWVideoOrientationMetadataNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  if ((int)[*(id *)(a1 + 32) videoOrientation] < 1
    || (int)[*(id *)(a1 + 32) videoOrientation] > 4)
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 112) = 1;
    *(unsigned char *)(*(void *)(a1 + 40) + 116) = 0;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 112) = [*(id *)(a1 + 32) videoOrientation];
    *(unsigned char *)(*(void *)(a1 + 40) + 116) = [*(id *)(a1 + 32) videoMirrored];
  }
  -[BWVideoOrientationMetadataNode _determineExifOrientation](*(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  -[BWVideoOrientationMetadataNode _emitValidatedVideoOrientationSampleBufferForBoxedFormatOutputAtTime:](v2, &v3);
  *(unsigned char *)(*(void *)(a1 + 40) + 143) = 1;
}

- (void)_emitValidatedVideoOrientationSampleBufferForBoxedFormatOutputAtTime:(uint64_t)a1
{
  if (a1)
  {
    if (*((unsigned char *)a2 + 12))
    {
      int v4 = *(_DWORD *)(a1 + 144);
      if ((v4 - 9) >= 0xFFFFFFF8)
      {
        uint64_t v5 = (v4 - 1);
        objc_super v6 = *(OpaqueCMBlockBuffer **)(a1 + 152 + 8 * v5);
        uint64_t v7 = (__int16)v4;
        if (!v6)
        {
          BoxedVideoOrientationBlockBuffer = (OpaqueCMBlockBuffer *)FigCaptureMetadataUtilitiesCreateBoxedVideoOrientationBlockBuffer();
          if (!BoxedVideoOrientationBlockBuffer) {
            return;
          }
          objc_super v6 = BoxedVideoOrientationBlockBuffer;
          *(void *)(a1 + 152 + 8 * v5) = BoxedVideoOrientationBlockBuffer;
        }
        char v9 = *(const opaqueCMFormatDescription **)(a1 + 128);
        long long v14 = *a2;
        uint64_t v15 = *((void *)a2 + 2);
        CMSampleBufferRef VideoOrientationSampleBuffer = FigCaptureMetadataUtilitiesCreateVideoOrientationSampleBuffer((uint64_t)&v14, v6, v7, v9);
        if (VideoOrientationSampleBuffer)
        {
          CMSampleBufferRef v11 = VideoOrientationSampleBuffer;
          v12 = *(void **)(a1 + 216);
          uint64_t v13 = *(__int16 *)(a1 + 144);
          long long v14 = *a2;
          uint64_t v15 = *((void *)a2 + 2);
          [v12 addItemToCacheWithPTS:&v14 exifOrientation:v13];
          [*(id *)(a1 + 16) emitSampleBuffer:v11];
          CFRelease(v11);
        }
      }
    }
  }
}

@end