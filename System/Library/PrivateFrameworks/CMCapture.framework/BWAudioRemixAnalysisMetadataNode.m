@interface BWAudioRemixAnalysisMetadataNode
+ (void)initialize;
- (BWAudioRemixAnalysisMetadataNode)init;
- (BWNodeOutput)metadataOutput;
- (id)nodeSubType;
- (id)nodeType;
- (void)_emitCopyOfMarkerBuffer:(void *)a3 onOutput:(int)a4 isStartMarkerBuffer:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWAudioRemixAnalysisMetadataNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWAudioRemixAnalysisMetadataNode)init
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)BWAudioRemixAnalysisMetadataNode;
  v2 = [(BWNode *)&v18 init];
  v3 = (BWAudioRemixAnalysisMetadataNode *)v2;
  if (v2)
  {
    v4 = v2 + 168;
    *((void *)v2 + 21) = 0;
    *((void *)v2 + 12) = 0;
    v2[104] = 0;
    *((void *)v2 + 14) = 0;
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    long long v6 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v2 + 120) = *MEMORY[0x1E4F1F9F8];
    uint64_t v7 = *(void *)(v5 + 16);
    *((void *)v2 + 17) = v7;
    *((_OWORD *)v2 + 9) = v6;
    *((void *)v2 + 20) = v7;
    v8 = [[BWNodeInput alloc] initWithMediaType:1936684398 node:v2];
    if (v8)
    {
      v9 = v8;
      [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v8 primaryMediaConfiguration] setPassthroughMode:1];
      [(BWNodeInput *)v9 setName:@"AudioRemixAnalysisPassthroughInput"];
      [(BWNode *)v3 addInput:v9];

      v10 = [[BWNodeOutput alloc] initWithMediaType:1936684398 node:v3];
      [(BWNodeOutput *)v10 setIndexOfInputWhichDrivesThisOutput:0];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v10 primaryMediaConfiguration] setPassthroughMode:1];
      [(BWNodeOutput *)v10 setName:@"AudioRemixAnalysisPassthroughOutput"];
      [(BWNode *)v3 addOutput:v10];

      v3->_metadataOutput = 0;
      uint64_t v11 = *MEMORY[0x1E4F1F0F8];
      v22[0] = *MEMORY[0x1E4F1F108];
      v22[1] = v11;
      uint64_t v12 = *MEMORY[0x1E4F1F020];
      v23[0] = @"mdta/com.apple.quicktime.cinematic-audio";
      v23[1] = v12;
      v22[2] = *MEMORY[0x1E4F1F118];
      uint64_t v20 = *MEMORY[0x1E4F1F120];
      uint64_t v21 = *MEMORY[0x1E4F1CFC8];
      v23[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
      CFArrayRef v13 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v13, &v3->_audioMetadataFormatDescription)|| (v14 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v3]) == 0)
      {
        FigDebugAssert3();
LABEL_10:

        return 0;
      }
      v15 = v14;
      [(BWNodeOutput *)v14 setName:@"AudioRemixAnalysisMetadataOutput"];
      [(BWNodeOutput *)v15 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:*v4]];
      [(BWNode *)v3 addOutput:v15];
      v3->_metadataOutput = v15;

      v16 = [[AudioRemixSessionManager alloc] initWithNodeMetadataOutput:v3->_metadataOutput];
      v3->_movieRemixSessionManager = v16;
      if (v16) {
        return v3;
      }
    }
    FigSignalErrorAt();
    goto LABEL_10;
  }
  return v3;
}

- (void)dealloc
{
  audioMetadataFormatDescription = self->_audioMetadataFormatDescription;
  if (audioMetadataFormatDescription) {
    CFRelease(audioMetadataFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWAudioRemixAnalysisMetadataNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"AudioRemixAnalysisMetadata";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
  [(BWNodeOutput *)self->_metadataOutput makeConfiguredFormatLive];
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)[a4 audioFormatDescription]);
  movieRemixSessionManager = self->_movieRemixSessionManager;
  if (movieRemixSessionManager)
  {
    double mSampleRate = StreamBasicDescription->mSampleRate;
    [(AudioRemixSessionManager *)movieRemixSessionManager sampleRate];
    if (mSampleRate != v10
      || (UInt32 mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame,
          mChannelsPerFrame != [(AudioRemixSessionManager *)self->_movieRemixSessionManager channelCount]))
    {
      [(AudioRemixSessionManager *)self->_movieRemixSessionManager setFormatSampleRate:StreamBasicDescription->mChannelsPerFrame andChannelCount:StreamBasicDescription->mSampleRate];
      uint64_t v12 = self->_movieRemixSessionManager;
      [(AudioRemixSessionManager *)v12 startNewSessionBlocking];
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  p_currentPTS = &self->_currentPTS;
  if (self->_currentPTS.flags)
  {
    movieRemixSessionManager = self->_movieRemixSessionManager;
    long long v11 = *(_OWORD *)&self->_startRecordingPTS.value;
    int64_t epoch = self->_startRecordingPTS.epoch;
    long long v9 = *(_OWORD *)&p_currentPTS->value;
    int64_t v10 = p_currentPTS->epoch;
    [(AudioRemixSessionManager *)movieRemixSessionManager finishAndGetResultsBlockingWithStartingPTS:&v11 andEndingPTS:&v9];
    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    long long v7 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_startRecordingPTS.value = *MEMORY[0x1E4F1F9F8];
    int64_t v8 = *(void *)(v6 + 16);
    self->_startRecordingPTS.int64_t epoch = v8;
    *(_OWORD *)&p_currentPTS->value = v7;
    p_currentPTS->int64_t epoch = v8;
  }
  [(AudioRemixSessionManager *)self->_movieRemixSessionManager abortSessionIfNeeded];
  [(AudioRemixSessionManager *)self->_movieRemixSessionManager setFormatSampleRate:0 andChannelCount:0.0];
  [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
  [(BWNodeOutput *)self->_metadataOutput markEndOfLiveOutput];
}

- (void)_emitCopyOfMarkerBuffer:(void *)a3 onOutput:(int)a4 isStartMarkerBuffer:
{
  if (a1 && a3)
  {
    CMSampleBufferRef sampleBufferOut = 0;
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, sbuf);
    if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], sbuf, &sampleBufferOut))
    {
      if (*(void **)(a1 + 112) == a3) {
        int64_t v8 = &BWDroppedSampleReasonCinematicVideoMetadataFailure;
      }
      else {
        int64_t v8 = (uint64_t *)BWDroppedSampleReasonCinematicAudioMetadataFailure;
      }
      uint64_t v9 = *v8;
      CMTime v10 = v11;
      objc_msgSend(a3, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", v9, &v10));
    }
    else
    {
      if (a4 && *(void **)(a1 + 112) == a3) {
        CMSetAttachment(sampleBufferOut, @"TrackFormatDescription", *(CFTypeRef *)(a1 + 168), 1u);
      }
      [a3 emitSampleBuffer:sampleBufferOut];
      if (sampleBufferOut) {
        CFRelease(sampleBufferOut);
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, a3);
  self->_currentPTS = ($95D729B680665BEAEFA1D6FCA8238556)v29;
  if (!BWSampleBufferIsMarkerBuffer(a3))
  {
    if (!self->_shouldSendData
      || ![(AudioRemixSessionManager *)self->_movieRemixSessionManager sessionReady])
    {
      goto LABEL_15;
    }
    if (a3)
    {
      FormatDescription = CMSampleBufferGetFormatDescription(a3);
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
      if (!FormatDescription)
      {
        int v16 = FigSignalErrorAt();
        v17 = 0;
        uint64_t v12 = 0;
        goto LABEL_12;
      }
      uint64_t v12 = (AudioStreamBasicDescription *)StreamBasicDescription;
      if (StreamBasicDescription)
      {
        CFArrayRef v13 = (void *)[objc_alloc(MEMORY[0x1E4F15350]) initWithLayoutTag:StreamBasicDescription->mChannelsPerFrame | 0x930000];
        uint64_t v12 = (AudioStreamBasicDescription *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:v12 channelLayout:v13];

        CMItemCount NumSamples = CMSampleBufferGetNumSamples(a3);
        FormatDescription = (const opaqueCMFormatDescription *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v12 frameCapacity:NumSamples];
        [(opaqueCMFormatDescription *)FormatDescription setFrameLength:NumSamples];
        OSStatus v15 = CMSampleBufferCopyPCMDataIntoAudioBufferList(a3, 0, NumSamples, (AudioBufferList *)[(opaqueCMFormatDescription *)FormatDescription mutableAudioBufferList]);
        int v16 = v15;
        if (v15)
        {
          uint64_t v25 = v4;
          LODWORD(v24) = v15;
          FigDebugAssert3();
          v17 = 0;
        }
        else
        {
          v17 = FormatDescription;
        }
        goto LABEL_12;
      }
      int v16 = FigSignalErrorAt();
      v17 = 0;
    }
    else
    {
      int v16 = FigSignalErrorAt();
      v17 = 0;
      uint64_t v12 = 0;
    }
    FormatDescription = 0;
LABEL_12:

    if (v16)
    {
      uint64_t v25 = v4;
      LODWORD(v24) = v16;
      FigDebugAssert3();
    }
    else if (v17)
    {
      [(AudioRemixSessionManager *)self->_movieRemixSessionManager submitAudioBuffer:v17];
    }
    else
    {
      FigSignalErrorAt();
    }
    goto LABEL_15;
  }
  CFTypeRef v7 = CMGetAttachment(a3, @"FileWriterAction", 0);
  int v8 = CFEqual(v7, @"Start");
  int v9 = CFEqual(v7, @"Stop");
  if (v7)
  {
    if (v8)
    {
      self->_startRecordingPTS = ($95D729B680665BEAEFA1D6FCA8238556)v29;
LABEL_17:
      BOOL v19 = 1;
LABEL_18:
      self->_shouldSendData = v19;
      goto LABEL_19;
    }
    int v18 = v9;
    if (CFEqual(v7, @"Resume")) {
      goto LABEL_17;
    }
    if (!v18)
    {
      if (!CFEqual(v7, @"Terminate") && !CFEqual(v7, @"Pause")) {
        goto LABEL_19;
      }
      BOOL v19 = 0;
      goto LABEL_18;
    }
    self->_shouldSendData = 0;
    CMTime v26 = v29;
    movieRemixSessionManager = self->_movieRemixSessionManager;
    long long v27 = *(_OWORD *)&self->_startRecordingPTS.value;
    int64_t epoch = self->_startRecordingPTS.epoch;
    [(AudioRemixSessionManager *)movieRemixSessionManager finishAndGetResultsBlockingWithStartingPTS:&v27 andEndingPTS:&v26];
    uint64_t v21 = MEMORY[0x1E4F1F9F8];
    long long v22 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_startRecordingPTS.value = *MEMORY[0x1E4F1F9F8];
    int64_t v23 = *(void *)(v21 + 16);
    self->_startRecordingPTS.int64_t epoch = v23;
    *(_OWORD *)&self->_currentPTS.value = v22;
    self->_currentPTS.int64_t epoch = v23;
    if (![(AudioRemixSessionManager *)self->_movieRemixSessionManager startNewSessionBlocking])goto LABEL_19; {
LABEL_15:
    }
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v24, v25);
    return;
  }
LABEL_19:
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
  -[BWAudioRemixAnalysisMetadataNode _emitCopyOfMarkerBuffer:onOutput:isStartMarkerBuffer:]((uint64_t)self, a3, self->_metadataOutput, v8 != 0);
}

- (BWNodeOutput)metadataOutput
{
  return self->_metadataOutput;
}

@end