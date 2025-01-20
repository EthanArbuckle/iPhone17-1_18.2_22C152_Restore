@interface BWRefinedCinematographyNode
+ (void)initialize;
- (BWNodeInput)audioInput;
- (BWNodeInput)videoInput;
- (BWNodeOutput)audioOutput;
- (BWNodeOutput)videoOutput;
- (BWRefinedCinematographyNode)initWithAudioEnabled:(BOOL)a3;
- (id)nodeSubType;
- (id)nodeType;
- (void)_attachRefinedFramesToSbuf:(uint64_t)a1;
- (void)_flush;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWRefinedCinematographyNode

+ (void)initialize
{
}

- (BWRefinedCinematographyNode)initWithAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BWRefinedCinematographyNode;
  v4 = [(BWNode *)&v13 init];
  v5 = (BWRefinedCinematographyNode *)v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    long long v7 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v4 + 136) = *MEMORY[0x1E4F1F9F8];
    uint64_t v8 = *(void *)(v6 + 16);
    *((void *)v4 + 19) = v8;
    *((_OWORD *)v4 + 7) = v7;
    *((void *)v4 + 16) = v8;
    *((void *)v4 + 20) = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeInput *)v5->_videoInput setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v5->_videoInput setPassthroughMode:1];
    [(BWNode *)v5 addInput:v5->_videoInput];
    v9 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v5];
    v5->_videoOutput = v9;
    [(BWNodeOutput *)v9 setName:@"PassThru"];
    [(BWNodeOutput *)v5->_videoOutput setPassthroughMode:1];
    [(BWNode *)v5 addOutput:v5->_videoOutput];
    if (v3)
    {
      v10 = [[BWNodeInput alloc] initWithMediaType:1936684398 node:v5];
      v5->_audioInput = v10;
      [(BWNode *)v5 addInput:v10];
      v11 = [[BWNodeOutput alloc] initWithMediaType:1936684398 node:v5];
      v5->_audioOutput = v11;
      [(BWNode *)v5 addOutput:v11];
    }
    v5->_refinementSession = (PTCinematographyRefinement *)[objc_alloc((Class)getPTCinematographyRefinementClass()) initWithOptions:0];
  }
  return v5;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = atomic_fetch_add_explicit(&self->_numEODMessagesReceived, 1u, memory_order_relaxed) + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == v4)
  {
    -[BWRefinedCinematographyNode _flush]((uint64_t)self);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(BWNode *)self outputs];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) markEndOfLiveOutput];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    self->_numEODMessagesReceived = 0;
  }
}

- (void)_flush
{
  if (a1)
  {
    CMSampleBufferRef v15 = 0;
    if (*(unsigned char *)(a1 + 104))
    {
      [*(id *)(a1 + 96) stopRecording];
      *(unsigned char *)(a1 + 104) = 0;
      long long v2 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v2;
      CMTimeEpoch v3 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
      *(_OWORD *)&sampleTimingArray.duration.epoch = v4;
      CMTimeEpoch v5 = *(void *)(a1 + 152);
      sampleTimingArray.decodeTimeStamp.epoch = v3;
      sampleTimingArray.presentationTimeStamp.epoch = v5;
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)(a1 + 136);
      CMTime lhs = *(CMTime *)(a1 + 112);
      CMTime rhs = *(CMTime *)(a1 + 136);
      CMTimeSubtract(&sampleTimingArray.duration, &lhs, &rhs);
      OSStatus v6 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v15);
      CMSampleBufferRef v7 = v15;
      if (!v6)
      {
        CMSetAttachment(v15, @"RefinedCinematographyStreamEndMarker", MEMORY[0x1E4F1CC38], 1u);
        -[BWRefinedCinematographyNode _attachRefinedFramesToSbuf:](a1, v15);
        CMSampleBufferRef v8 = v15;
        CMSetAttachment(v15, @"CinematicAudioDialogueLevel", &unk_1EFB04EC8, 1u);
        CMSetAttachment(v8, @"CinematicAudioAmbienceLevel", &unk_1EFB04EC8, 1u);
        [*(id *)(a1 + 16) emitSampleBuffer:v15];
        CMSampleBufferRef v7 = v15;
      }
    }
    else
    {
      CMSampleBufferRef v7 = 0;
    }
    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    long long v10 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(a1 + 136) = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(v9 + 16);
    *(void *)(a1 + 152) = v11;
    *(_OWORD *)(a1 + 112) = v10;
    *(void *)(a1 + 128) = v11;
    if (v7) {
      CFRelease(v7);
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWRefinedCinematographyNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"CinematographyMetadataProducer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  if (self->_videoInput == a4) {
    long long v4 = &OBJC_IVAR___BWRefinedCinematographyNode__videoOutput;
  }
  else {
    long long v4 = &OBJC_IVAR___BWRefinedCinematographyNode__audioOutput;
  }
  [*(id *)((char *)&self->super.super.isa + *v4) setFormat:a3];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_videoInput == a5) {
    CMTimeEpoch v5 = &OBJC_IVAR___BWRefinedCinematographyNode__videoOutput;
  }
  else {
    CMTimeEpoch v5 = &OBJC_IVAR___BWRefinedCinematographyNode__audioOutput;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "makeConfiguredFormatLive", a3, a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  CMSampleBufferRef v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (self->_videoInput == a4)
  {
    if (BWSampleBufferIsMarkerBuffer(a3))
    {
      CFTypeRef v9 = CMGetAttachment(a3, @"FileWriterAction", 0);
      if (v9)
      {
        long long v10 = v9;
        CFTypeID v11 = CFGetTypeID(v9);
        if (v11 == CFStringGetTypeID())
        {
          if (CFEqual(v10, @"Stop")
            || CFEqual(v10, @"Pause")
            || CFEqual(v10, @"Flush")
            || CFEqual(v10, @"Terminate")
            || CFEqual(v10, @"StreamForcedOff"))
          {
            -[BWRefinedCinematographyNode _flush]((uint64_t)self);
          }
          else if (CFEqual(v10, @"Start"))
          {
            [(PTCinematographyRefinement *)self->_refinementSession startRecording];
            self->_isRefinementSessionActive = 1;
          }
        }
      }
    }
    else
    {
      long long v12 = (void *)CMGetAttachment(a3, @"CinematicVideoCinematographyMetadata", 0);
      if (v12)
      {
        uint64_t v13 = [v12 objectForKeyedSubscript:0x1EFA732E0];
        refinementSession = self->_refinementSession;
        v16[0] = v13;
        -[PTCinematographyRefinement addFrames:](refinementSession, "addFrames:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1]);
      }
      -[BWRefinedCinematographyNode _attachRefinedFramesToSbuf:]((uint64_t)self, a3);
    }
    if (*v7 == 1) {
      kdebug_trace();
    }
    CMSampleBufferRef v8 = &OBJC_IVAR___BWRefinedCinematographyNode__videoOutput;
  }
  else
  {
    if ((self->_firstAudioPTS.flags & 1) == 0)
    {
      CMSampleBufferGetPresentationTimeStamp(&v15, a3);
      self->_firstAudioPTS = ($95D729B680665BEAEFA1D6FCA8238556)v15;
    }
    CMSampleBufferGetPresentationTimeStamp(&v15, a3);
    self->_lastAudioPTS = ($95D729B680665BEAEFA1D6FCA8238556)v15;
    CMSampleBufferRef v8 = &OBJC_IVAR___BWRefinedCinematographyNode__audioOutput;
  }
  [*(id *)((char *)&self->super.super.isa + *v8) emitSampleBuffer:a3];
}

- (void)_attachRefinedFramesToSbuf:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_super v3 = (void *)[*(id *)(a1 + 96) refinedFrames];
    if ([v3 count])
    {
      CMAttachmentBearerRef target = a2;
      value = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (!v4) {
        goto LABEL_20;
      }
      uint64_t v5 = v4;
      uint64_t v19 = *(void *)v23;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      id obj = v3;
      while (1)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(obj);
          }
          CMSampleBufferRef v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (v7) {
            [*(id *)(*((void *)&v22 + 1) + 8 * i) time];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          CFDictionaryRef v8 = CMTimeCopyAsDictionary(&time, allocator);
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v26[0] = 0x1EFA73280;
          long long v10 = NSNumber;
          [v7 aperture];
          v27[0] = objc_msgSend(v10, "numberWithFloat:");
          v26[1] = 0x1EFA732C0;
          CFTypeID v11 = NSNumber;
          [v7 focusDistance];
          v27[1] = objc_msgSend(v11, "numberWithFloat:");
          v27[2] = v8;
          v26[2] = 0x1EFA4F900;
          v26[3] = 0x1EFA732E0;
          v27[3] = v7;
          objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 4), 0x1EFA73360);
          id AssociatedObject = objc_getAssociatedObject(v7, @"CinematicVideoTimedRenderingMetadata");
          uint64_t v13 = objc_opt_class();
          getPTTimedRenderingMetadataVersion1Class();
          if (v13 == objc_opt_class())
          {
            [v7 focusDistance];
            objc_msgSend(AssociatedObject, "setFocusDistance:");
            [v7 aperture];
            objc_msgSend(AssociatedObject, "setAperture:");
          }
          else
          {
            uint64_t v14 = objc_opt_class();
            getPTTimedRenderingMetadataVersion2Class();
            if (v14 != objc_opt_class()) {
              goto LABEL_16;
            }
            [v7 focusDistance];
            objc_msgSend(AssociatedObject, "setFocusDisparity:");
            [v7 aperture];
            objc_msgSend(AssociatedObject, "setFNumber:");
          }
          [v9 setObject:AssociatedObject forKeyedSubscript:0x1EFA73380];
LABEL_16:
          id v15 = objc_getAssociatedObject(v7, @"CinematicVideoTimedStabilizationMetadata");
          if (v15) {
            [v9 setObject:v15 forKeyedSubscript:0x1EFA733A0];
          }
          [value addObject:v9];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (!v5)
        {
LABEL_20:
          CMSetAttachment(target, @"CinematicVideoMetadata", value, 1u);

          return;
        }
      }
    }
  }
}

- (BWNodeInput)videoInput
{
  return self->_videoInput;
}

- (BWNodeInput)audioInput
{
  return self->_audioInput;
}

- (BWNodeOutput)videoOutput
{
  return self->_videoOutput;
}

- (BWNodeOutput)audioOutput
{
  return self->_audioOutput;
}

@end