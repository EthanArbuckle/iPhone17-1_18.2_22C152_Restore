@interface BWAudioSplitNode
+ (void)initialize;
- (BWAudioSplitNode)initWithInputChannelLayoutTag:(unsigned int)a3 output1ChannelLayoutTag:(unsigned int)a4 output2ChannelLayoutTag:(unsigned int)a5;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_createSplitAndInterleaveFromSampleBuffer:(const opaqueCMFormatDescription *)a3 outputFormat1:(CMSampleBufferRef *)a4 outputBuffer1:(const opaqueCMFormatDescription *)a5 outputFormat2:(CMSampleBufferRef *)a6 outputBuffer2:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWAudioSplitNode

+ (void)initialize
{
}

- (BWAudioSplitNode)initWithInputChannelLayoutTag:(unsigned int)a3 output1ChannelLayoutTag:(unsigned int)a4 output2ChannelLayoutTag:(unsigned int)a5
{
  v15.receiver = self;
  v15.super_class = (Class)BWAudioSplitNode;
  v8 = [(BWNode *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_splitAtIndex = (unsigned __int16)a4;
    v8->_inputNumberOfChannels = (unsigned __int16)a3;
    v8->_inputChannelLayoutTag = a3;
    v8->_output1ChannelLayoutTag = a4;
    v8->_output2ChannelLayoutTag = a5;
    if (v8->_inputNumberOfChannels == (unsigned __int16)a5 + (unsigned __int16)a4
      && (v10 = [[BWNodeInput alloc] initWithMediaType:1936684398 node:v8]) != 0)
    {
      v11 = v10;
      [(BWNode *)v9 addInput:v10];
      v9->_input = v11;

      v12 = [[BWNodeOutput alloc] initWithMediaType:1936684398 node:v9];
      [(BWNodeOutput *)v12 setIndexOfInputWhichDrivesThisOutput:0];
      [(BWNode *)v9 addOutput:v12];
      v9->_output1 = v12;

      v13 = [[BWNodeOutput alloc] initWithMediaType:1936684398 node:v9];
      [(BWNodeOutput *)v13 setIndexOfInputWhichDrivesThisOutput:0];
      [(BWNode *)v9 addOutput:v13];
      v9->_output2 = v13;

      [(BWNode *)v9 setSupportsLiveReconfiguration:0];
    }
    else if (FigSignalErrorAt())
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWAudioSplitNode;
  [(BWNode *)&v2 dealloc];
}

- (id)nodeType
{
  return @"Demuxer";
}

- (id)nodeSubType
{
  return @"AudioSplitNode";
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_input)
  {
    [(BWNodeOutput *)self->_output1 makeConfiguredFormatLive];
    output2 = self->_output2;
    [(BWNodeOutput *)output2 makeConfiguredFormatLive];
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v24[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t splitAtIndex = self->_splitAtIndex;
    unsigned int v10 = self->_inputNumberOfChannels - splitAtIndex;
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    uint64_t v18 = 0;
    int v20 = 0;
    unsigned int output1ChannelLayoutTag = self->_output1ChannelLayoutTag;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &output1ChannelLayoutTag, 32, a5);
    v24[0] = &unk_1EFAFF030;
    v23[0] = 0x1EFA48D60;
    v23[1] = 0x1EFA48DA0;
    v24[1] = [NSNumber numberWithUnsignedInt:splitAtIndex];
    v24[2] = MEMORY[0x1E4F1CC28];
    v23[2] = 0x1EFA48E20;
    v23[3] = 0x1EFA48E00;
    v23[4] = 0x1EFA48EE0;
    v24[3] = MEMORY[0x1E4F1CC38];
    v24[4] = v8;
    -[BWNodeOutput setFormat:](self->_output1, "setFormat:", +[BWAudioFormat formatForAVAudioSettings:inputFormat:](BWAudioFormat, "formatForAVAudioSettings:inputFormat:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5], a3));
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    int v15 = 0;
    uint64_t v14 = 0;
    unsigned int output2ChannelLayoutTag = self->_output2ChannelLayoutTag;
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&output2ChannelLayoutTag length:32];
    v22[0] = &unk_1EFAFF030;
    v21[0] = 0x1EFA48D60;
    v21[1] = 0x1EFA48DA0;
    v22[1] = [NSNumber numberWithUnsignedInt:v10];
    v22[2] = MEMORY[0x1E4F1CC28];
    v21[2] = 0x1EFA48E20;
    v21[3] = 0x1EFA48E00;
    v21[4] = 0x1EFA48EE0;
    v22[3] = MEMORY[0x1E4F1CC38];
    v22[4] = v9;
    -[BWNodeOutput setFormat:](self->_output2, "setFormat:", +[BWAudioFormat formatForAVAudioSettings:inputFormat:](BWAudioFormat, "formatForAVAudioSettings:inputFormat:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5], a3));
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_createSplitAndInterleaveFromSampleBuffer:(const opaqueCMFormatDescription *)a3 outputFormat1:(CMSampleBufferRef *)a4 outputBuffer1:(const opaqueCMFormatDescription *)a5 outputFormat2:(CMSampleBufferRef *)a6 outputBuffer2:
{
  if (!a1) {
    return 0;
  }
  CMBlockBufferRef v55 = 0;
  CMBlockBufferRef blockBufferOut = 0;
  size_t sampleSizeArray = 0;
  CMBlockBufferRef v54 = 0;
  size_t v52 = 0;
  memset(&timingInfoOut, 0, sizeof(timingInfoOut));
  if (!sbuf || !a3 || !a4 || !a5 || !a6)
  {
    fig_log_get_emitter();
LABEL_42:
    FigDebugAssert3();
    uint64_t v41 = 0;
    goto LABEL_43;
  }
  uint64_t SampleTimingInfo = CMSampleBufferGetSampleTimingInfo(sbuf, 0, &timingInfoOut);
  if (SampleTimingInfo)
  {
    uint64_t v41 = SampleTimingInfo;
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_43:
    v22 = 0;
    goto LABEL_31;
  }
  uint64_t v12 = CMSampleBufferGetFormatDescription(sbuf);
  if (!v12) {
    goto LABEL_41;
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v12);
  if (!StreamBasicDescription) {
    goto LABEL_41;
  }
  size_t mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
  uint64_t mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
  v16 = CMAudioFormatDescriptionGetStreamBasicDescription(a3);
  if (!v16
    || (v47 = a4,
        size_t v17 = v16->mBytesPerFrame,
        uint64_t v18 = v16->mChannelsPerFrame,
        (uint64_t v19 = CMAudioFormatDescriptionGetStreamBasicDescription(a5)) == 0)
    || (v46 = a3, uint64_t v20 = v19->mChannelsPerFrame, v20 + v18 != mChannelsPerFrame))
  {
LABEL_41:
    fig_log_get_emitter();
    goto LABEL_42;
  }
  v45 = a6;
  size_t v21 = v19->mBytesPerFrame;
  v22 = (AudioBufferList *)malloc_type_malloc((16 * mChannelsPerFrame) | 8, 0xA126E253uLL);
  if (!v22) {
    goto LABEL_46;
  }
  uint64_t AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(sbuf, 0, v22, (16 * mChannelsPerFrame) | 8, 0, 0, 1u, &blockBufferOut);
  if (AudioBufferListWithRetainedBlockBuffer)
  {
LABEL_47:
    uint64_t v41 = AudioBufferListWithRetainedBlockBuffer;
    fig_log_get_emitter();
LABEL_52:
    FigDebugAssert3();
    goto LABEL_31;
  }
  if (v22->mNumberBuffers != mChannelsPerFrame)
  {
LABEL_46:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v41 = 0;
    goto LABEL_31;
  }
  CMItemCount NumSamples = CMSampleBufferGetNumSamples(sbuf);
  size_t v52 = v21;
  size_t sampleSizeArray = v17;
  CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t AudioBufferListWithRetainedBlockBuffer = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, NumSamples * v17, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, NumSamples * v17, 1u, &v55);
  if (AudioBufferListWithRetainedBlockBuffer) {
    goto LABEL_47;
  }
  uint64_t AudioBufferListWithRetainedBlockBuffer = CMBlockBufferCreateWithMemoryBlock(v25, 0, NumSamples * v21, v25, 0, 0, NumSamples * v21, 1u, &v54);
  if (AudioBufferListWithRetainedBlockBuffer) {
    goto LABEL_47;
  }
  v49 = 0;
  dataPointerOut = 0;
  uint64_t DataPointer = CMBlockBufferGetDataPointer(v55, 0, 0, 0, &dataPointerOut);
  if (DataPointer)
  {
    uint64_t v41 = DataPointer;
    fig_log_get_emitter();
    goto LABEL_52;
  }
  uint64_t v27 = CMBlockBufferGetDataPointer(v54, 0, 0, 0, &v49);
  if (v27)
  {
    uint64_t v41 = v27;
    fig_log_get_emitter();
    goto LABEL_52;
  }
  formatDescription = a5;
  CFAllocatorRef allocator = v25;
  v48 = v22;
  if (NumSamples)
  {
    uint64_t v28 = 0;
    p_mData = &v22->mBuffers[0].mData;
    uint64_t v30 = (uint64_t)&v22->mBuffers[v18].mData;
    do
    {
      size_t v31 = v28 * mBytesPerFrame;
      if (v18)
      {
        v32 = dataPointerOut;
        v33 = p_mData;
        uint64_t v34 = v18;
        do
        {
          v35 = (char *)*v33;
          v33 += 2;
          memcpy(v32, &v35[v31], mBytesPerFrame);
          v32 = &dataPointerOut[mBytesPerFrame];
          dataPointerOut += mBytesPerFrame;
          --v34;
        }
        while (v34);
      }
      if (v20)
      {
        v36 = v49;
        v37 = (uint64_t *)v30;
        uint64_t v38 = v20;
        do
        {
          uint64_t v39 = *v37;
          v37 += 2;
          memcpy(v36, (const void *)(v39 + v31), mBytesPerFrame);
          v36 = &v49[mBytesPerFrame];
          v49 += mBytesPerFrame;
          --v38;
        }
        while (v38);
      }
      ++v28;
    }
    while (v28 != NumSamples);
  }
  uint64_t v40 = CMSampleBufferCreate(allocator, v55, 1u, 0, 0, v46, NumSamples, 1, &timingInfoOut, 1, &sampleSizeArray, v47);
  if (v40)
  {
    uint64_t v41 = v40;
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = v48;
    goto LABEL_31;
  }
  uint64_t v41 = CMSampleBufferCreate(allocator, v54, 1u, 0, 0, formatDescription, NumSamples, 1, &timingInfoOut, 1, &v52, v45);
  v22 = v48;
  if (v41)
  {
    fig_log_get_emitter();
    goto LABEL_52;
  }
LABEL_31:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (v55) {
    CFRelease(v55);
  }
  if (v54) {
    CFRelease(v54);
  }
  free(v22);
  return v41;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v5 = 0;
  CFTypeRef cf = 0;
  if (-[BWAudioSplitNode _createSplitAndInterleaveFromSampleBuffer:outputFormat1:outputBuffer1:outputFormat2:outputBuffer2:]((uint64_t)self, a3, [(BWFormat *)[(BWNodeOutput *)self->_output1 format] formatDescription], (CMSampleBufferRef *)&cf, [(BWFormat *)[(BWNodeOutput *)self->_output2 format] formatDescription], (CMSampleBufferRef *)&v5))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    [(BWNodeOutput *)self->_output1 emitSampleBuffer:cf];
    [(BWNodeOutput *)self->_output2 emitSampleBuffer:v5];
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  [(BWNodeOutput *)self->_output1 markEndOfLiveOutput];
  output2 = self->_output2;
  [(BWNodeOutput *)output2 markEndOfLiveOutput];
}

@end