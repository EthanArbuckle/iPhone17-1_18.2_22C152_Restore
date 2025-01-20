@interface VCPVoiceDetector
+ (id)detector;
- (NSMutableArray)voiceDetections;
- (VCPVoiceDetector)init;
- (id)audioFormatRequirements;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (int)loadModel;
- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4;
- (int)setupWithAudioStream:(const AudioStreamBasicDescription *)a3;
- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4;
- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 result:(id)a5;
- (void)setVoiceDetections:(id)a3;
@end

@implementation VCPVoiceDetector

+ (id)detector
{
  v2 = objc_alloc_init(VCPVoiceDetectorV2);
  return v2;
}

- (VCPVoiceDetector)init
{
  v11.receiver = self;
  v11.super_class = (Class)VCPVoiceDetector;
  v2 = [(VCPVoiceDetector *)&v11 init];
  v3 = (VCPVoiceDetector *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1BC280ED0;
    *(_OWORD *)(v2 + 24) = xmmword_1BC280EE0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    epoch = (void *)v3->_voiceStart.epoch;
    v3->_voiceStart.epoch = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    voiceDetections = v3->_voiceDetections;
    v3->_voiceDetections = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    utteranceDetections = v3->_utteranceDetections;
    v3->_utteranceDetections = (NSMutableArray *)v8;

    v3->_sampleBatchSize = 320;
  }
  return v3;
}

- (id)audioFormatRequirements
{
  v8[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F15270];
  v7[0] = *MEMORY[0x1E4F151E0];
  v7[1] = v2;
  v8[0] = &unk_1F15EB388;
  v8[1] = &unk_1F15EABE8;
  uint64_t v3 = *MEMORY[0x1E4F151F0];
  v7[2] = *MEMORY[0x1E4F15228];
  v7[3] = v3;
  v8[2] = &unk_1F15EB3A0;
  v8[3] = &unk_1F15EB3B8;
  uint64_t v4 = *MEMORY[0x1E4F15208];
  v7[4] = *MEMORY[0x1E4F151F8];
  v7[5] = v4;
  v8[4] = MEMORY[0x1E4F1CC28];
  v8[5] = MEMORY[0x1E4F1CC38];
  v7[6] = *MEMORY[0x1E4F15218];
  v8[6] = MEMORY[0x1E4F1CC38];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  return v5;
}

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 result:(id)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    memset(&v16, 0, sizeof(v16));
    CMTime lhs = *(CMTime *)(&self->_sampleBatchSize + 1);
    CMTime rhs = (CMTime)*a3;
    CMTimeAdd(&start, &lhs, &rhs);
    CMTime lhs = *(CMTime *)(&self->_sampleBatchSize + 1);
    CMTime rhs = (CMTime)*a4;
    CMTimeAdd(&end, &lhs, &rhs);
    CMTimeRangeFromTimeToTime(&v16, &start, &end);
    if ((v16.start.flags & 1) != 0
      && (v16.duration.flags & 1) != 0
      && !v16.duration.epoch
      && (v16.duration.value & 0x8000000000000000) == 0)
    {
      CMTimeRange v13 = v16;
      CFDictionaryRef v9 = CMTimeRangeCopyAsDictionary(&v13, 0);
      v19[0] = @"start";
      v10 = -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v20[0] = v10;
      v19[1] = @"duration";
      objc_super v11 = -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v20[1] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      [v8 addObject:v12];
    }
  }
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4
{
  self->_sampleBatchSize = a4;
  int result = [(VCPVoiceDetector *)self loadModel];
  if (!result)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
    if (StreamBasicDescription)
    {
      p_mSampleRate = &StreamBasicDescription->mSampleRate;
      CMSampleBufferGetPresentationTimeStamp(&v10, a3);
      *(CMTime *)(&self->_sampleBatchSize + 1) = v10;
      self->_audioStream.mSampleRate = *p_mSampleRate;
      int result = [(VCPVoiceDetector *)self setupWithAudioStream:p_mSampleRate];
      if (!result) {
        BYTE4(self->_trackStart.epoch) = 0;
      }
    }
    else
    {
      return -50;
    }
  }
  return result;
}

- (int)loadModel
{
  return -4;
}

- (int)setupWithAudioStream:(const AudioStreamBasicDescription *)a3
{
  return -4;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  return -4;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  return -4;
}

- (id)results
{
  return 0;
}

- (NSMutableArray)voiceDetections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVoiceDetections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceDetections, 0);
  objc_storeStrong((id *)&self->_voiceDetections, 0);
  objc_storeStrong((id *)&self->_voiceStart.epoch, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end