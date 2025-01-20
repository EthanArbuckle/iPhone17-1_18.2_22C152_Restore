@interface VCPVoiceDetectorV2
- (VCPVoiceDetectorV2)init;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (int)loadModel;
- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4;
- (int)setupWithAudioStream:(const AudioStreamBasicDescription *)a3;
- (void)dealloc;
@end

@implementation VCPVoiceDetectorV2

- (VCPVoiceDetectorV2)init
{
  v3.receiver = self;
  v3.super_class = (Class)VCPVoiceDetectorV2;
  result = [(VCPVoiceDetector *)&v3 init];
  if (result) {
    *(void *)&result->_voiceActivityNew = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3 = *(OpaqueAudioComponentInstance **)&self->_voiceActivityNew;
  if (v3) {
    AudioComponentInstanceDispose(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPVoiceDetectorV2;
  [(VCPVoiceDetectorV2 *)&v4 dealloc];
}

- (int)setupWithAudioStream:(const AudioStreamBasicDescription *)a3
{
  p_voiceActivityNew = &self->_voiceActivityNew;
  v5 = *(OpaqueAudioComponentInstance **)&self->_voiceActivityNew;
  if (v5)
  {
    int result = AudioUnitReset(v5, 0, 0);
    if (result) {
      return result;
    }
    return 0;
  }
  BYTE1(inDesc.componentFlags) = 0;
  HIWORD(inDesc.componentFlags) = 0;
  inDesc.componentFlagsMask = 0;
  strcpy((char *)&inDesc, "xfua2vpelppa");
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next) {
    return -23;
  }
  int result = AudioComponentInstanceNew(Next, (AudioComponentInstance *)p_voiceActivityNew);
  if (!result)
  {
    int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 8u, 1u, 0, a3, 0x28u);
    if (!result)
    {
      int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 8u, 2u, 0, a3, 0x28u);
      if (!result)
      {
        int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xEu, 2u, 0, &self->super._sampleBatchSize, 4u);
        if (!result)
        {
          int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA0Au, 0, 0, self->super._model, 8u);
          if (!result)
          {
            int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Bu, 0, 0, &kEDLStartWaitTimeSec, 4u);
            if (!result)
            {
              int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Cu, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kEDLInterspeechWaitTimeSec, 4u);
              if (!result)
              {
                int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Du, 0, 0, &kEDLSpeechStartAdjustSec, 4u);
                if (!result)
                {
                  int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Eu, 0, 0, &kEDLSpeechEndAdjustSec, 4u);
                  if (!result)
                  {
                    int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Au, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kSmoothingWindowLenSec, 4u);
                    if (!result)
                    {
                      int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA1Fu, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kEDLSpeechFraction, 4u);
                      if (!result)
                      {
                        int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA20u, 0, 0, &-[VCPVoiceDetectorV2 setupWithAudioStream:]::kEDLNonspeechFraction, 4u);
                        if (!result)
                        {
                          int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA16u, 0, 0, &kRealtimeOperationMode, 1u);
                          if (!result)
                          {
                            int result = AudioUnitSetProperty(*(AudioUnit *)p_voiceActivityNew, 0xFA19u, 0, 0, &kDecoderLatency, 4u);
                            if (!result)
                            {
                              p_musicDetections = &self->super._musicDetections;
                              int result = AudioUnitAddPropertyListener(*(AudioUnit *)p_voiceActivityNew, 0xFA21u, (AudioUnitPropertyListenerProc)SpeechStartListener, p_musicDetections);
                              if (!result)
                              {
                                int result = AudioUnitAddPropertyListener(*(AudioUnit *)p_voiceActivityNew, 0xFA22u, (AudioUnitPropertyListenerProc)SpeechEndListener, p_musicDetections);
                                if (!result)
                                {
                                  int result = AudioUnitInitialize(*(AudioUnit *)p_voiceActivityNew);
                                  if (!result) {
                                    return 0;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (int)loadModel
{
  if (self->super._model) {
    return 0;
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1C9E8];
  objc_super v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/Library/Audio/Tunings/Generic/AU/aufx-epv2-mediaanalysis-appl.plist"];
  v5 = [v3 dictionaryWithContentsOfURL:v4];
  model = self->super._model;
  self->super._model = v5;

  if (self->super._model) {
    return 0;
  }
  else {
    return -23;
  }
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  inInputBufferLists[1] = *(AudioBufferList **)MEMORY[0x1E4F143B8];
  AudioUnitRenderActionFlags ioActionFlags = 512;
  ioOutputBufferLists = a3;
  inInputBufferLists[0] = a3;
  int result = AudioUnitProcessMultiple(*(AudioUnit *)&self->_voiceActivityNew, &ioActionFlags, a4, self->super._sampleBatchSize, 1u, (const AudioBufferList **)inInputBufferLists, 1u, &ioOutputBufferLists);
  if (!result)
  {
    if (LOBYTE(self->super._musicDetections) == BYTE4(self->super._trackStart.epoch))
    {
      return 0;
    }
    else
    {
      UInt32 ioDataSize = 40;
      int result = AudioUnitGetProperty(*(AudioUnit *)&self->_voiceActivityNew, 8u, 2u, 0, outData, &ioDataSize);
      if (!result)
      {
        double v8 = 0.0;
        UInt32 ioDataSize = 8;
        int result = AudioUnitGetProperty(*(AudioUnit *)&self->_voiceActivityNew, 0xFA26u, 0, 0, &v8, &ioDataSize);
        if (!result)
        {
          memset(&v7, 0, sizeof(v7));
          CMTimeMake(&v7, (uint64_t)(v8 * outData[0]), (int)outData[0]);
          p_voiceActivity = &self->super._voiceActivity;
          if (LOBYTE(self->super._musicDetections))
          {
            *(_OWORD *)p_voiceActivity = *(_OWORD *)&v7.value;
            *(void *)&self->super._voiceStart.timescale = v7.epoch;
          }
          else
          {
            [(VCPVoiceDetector *)self addDetectionFromTime:p_voiceActivity toTime:&v7 result:self->super._voiceStart.epoch];
          }
          int result = 0;
          BYTE4(self->super._trackStart.epoch) = self->super._musicDetections;
        }
      }
    }
  }
  return result;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  if (BYTE4(self->super._trackStart.epoch)) {
    [(VCPVoiceDetector *)self addDetectionFromTime:&self->super._voiceActivity toTime:a3 result:self->super._voiceStart.epoch];
  }
  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int64_t epoch = self->super._voiceStart.epoch;
  if (epoch)
  {
    v5 = @"VoiceResults";
    v6[0] = epoch;
    objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

@end