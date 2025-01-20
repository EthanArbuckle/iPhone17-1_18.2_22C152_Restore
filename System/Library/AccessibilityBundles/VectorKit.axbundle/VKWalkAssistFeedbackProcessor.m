@interface VKWalkAssistFeedbackProcessor
+ (id)fourPitchesThresholdArray;
- (BOOL)isFacingLocation;
- (BOOL)shouldPlayAudio;
- (VKToneGenerator)toneGenerator;
- (VKWalkAssistFeedbackProcessor)initWithToneGenerator:(id)a3;
- (double)maxProximityThreshold;
- (double)minProximityThreshold;
- (int)_mmFromMeters:(int)a3;
- (int64_t)pitchMode;
- (void)_updateProximityThresholdsIfNeededForDistance:(int)a3;
- (void)_voiceOverStatusChanged;
- (void)dealloc;
- (void)processPulseFeedbackForDistance:(int)a3 shouldProcessHapticPulse:(BOOL)a4;
- (void)setIsFacingLocation:(BOOL)a3;
- (void)setMaxProximityThreshold:(double)a3;
- (void)setMinProximityThreshold:(double)a3;
- (void)setPitchMode:(int64_t)a3;
- (void)setShouldPlayAudio:(BOOL)a3;
- (void)setToneGenerator:(id)a3;
- (void)stopProcessing;
@end

@implementation VKWalkAssistFeedbackProcessor

+ (id)fourPitchesThresholdArray
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = [NSNumber numberWithDouble:15.0];
  v3 = [NSNumber numberWithDouble:20.0];
  v4 = [NSNumber numberWithDouble:25.0];
  v5 = [NSNumber numberWithDouble:30.0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

- (VKWalkAssistFeedbackProcessor)initWithToneGenerator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKWalkAssistFeedbackProcessor;
  v6 = [(VKWalkAssistFeedbackProcessor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_minProximityThreshold = 0.0;
    v6->_maxProximityThreshold = 0.0;
    objc_storeStrong((id *)&v6->_toneGenerator, a3);
    [(VKToneGenerator *)v7->_toneGenerator setUsesSoundFeedback:1];
    v7->_pitchMode = 2;
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__voiceOverStatusChanged name:*MEMORY[0x263F1CF90] object:0];

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  toneGenerator = self->_toneGenerator;
  self->_toneGenerator = 0;

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)VKWalkAssistFeedbackProcessor;
  [(VKWalkAssistFeedbackProcessor *)&v5 dealloc];
}

- (void)setPitchMode:(int64_t)a3
{
  self->_pitchMode = a3;
}

- (void)setShouldPlayAudio:(BOOL)a3
{
  self->_shouldPlayAudio = a3;
  if (!a3) {
    [(VKToneGenerator *)self->_toneGenerator stopPulse];
  }
}

- (void)stopProcessing
{
  self->_shouldPlayAudio = 0;
  [(VKToneGenerator *)self->_toneGenerator stopPulse];
}

- (void)processPulseFeedbackForDistance:(int)a3 shouldProcessHapticPulse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  -[VKWalkAssistFeedbackProcessor _updateProximityThresholdsIfNeededForDistance:](self, "_updateProximityThresholdsIfNeededForDistance:");
  uint64_t v7 = [(VKWalkAssistFeedbackProcessor *)self _mmFromMeters:v5];
  id v24 = [(VKWalkAssistFeedbackProcessor *)self toneGenerator];
  v8 = [VKPulseFrequencyGenerator alloc];
  [v24 minPulseFrequency];
  double v10 = v9;
  [v24 maxPulseFrequency];
  v12 = [(VKPulseFrequencyGenerator *)v8 initWithMinPulseFrequency:(int)self->_minProximityThreshold maxPulseFrequency:(int)self->_maxProximityThreshold minDepth:v10 maxDepth:v11];
  [v24 setShouldPlayHapticPulse:v4];
  [(VKPulseFrequencyGenerator *)v12 frequencyForDepth:v7];
  objc_msgSend(v24, "setPulseFrequency:");
  v13 = objc_alloc_init(VKVolumeGenerator);
  [(VKVolumeGenerator *)v13 volumeForDepth:v7 minDistanceThreshold:(int)self->_minProximityThreshold maxDistanceThreshold:(int)self->_maxProximityThreshold];
  objc_msgSend(v24, "setVolume:");
  int64_t pitchMode = self->_pitchMode;
  if (pitchMode)
  {
    if (pitchMode == 1)
    {
      v17 = [[VKPitchGenerator alloc] initWithTwoPitchesThreshold:&unk_26F825288];
      goto LABEL_9;
    }
    if (pitchMode != 2)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v15 = [VKPitchGenerator alloc];
    v16 = +[VKWalkAssistFeedbackProcessor fourPitchesThresholdArray];
    v17 = [(VKPitchGenerator *)v15 initWithFourPitchesThresholdArray:v16];
  }
  else
  {
    v18 = NSNumber;
    [v24 maxPitchFactor];
    v16 = objc_msgSend(v18, "numberWithFloat:");
    v19 = NSNumber;
    [v24 maxPitchFactor];
    v20 = objc_msgSend(v19, "numberWithFloat:");
    v21 = [NSNumber numberWithInt:(int)self->_minProximityThreshold];
    v22 = [NSNumber numberWithInt:(int)self->_maxProximityThreshold];
    v17 = [[VKPitchGenerator alloc] initWithMinPitch:v16 maxPitch:v20 minDepth:v21 maxDepth:v22];
  }
LABEL_9:
  v23 = [(VKPitchGenerator *)v17 fileForDepthInUnit:(double)(int)v5];
  [v24 setAudioFileURL:v23];

  [(VKPitchGenerator *)v17 pitchForDepth:v7];
  objc_msgSend(v24, "setPitchFactor:");
  if ([v24 usesSoundFeedback] && self->_shouldPlayAudio) {
    [v24 startPulse];
  }
  else {
    [v24 stopPulse];
  }
}

- (void)_updateProximityThresholdsIfNeededForDistance:(int)a3
{
  int v4 = [(VKWalkAssistFeedbackProcessor *)self _mmFromMeters:*(void *)&a3];
  if (self->_minProximityThreshold == 0.0) {
    self->_minProximityThreshold = (double)[(VKWalkAssistFeedbackProcessor *)self _mmFromMeters:(int)8.0];
  }
  double v5 = (double)v4;
  if (self->_maxProximityThreshold < (double)v4)
  {
    self->_double maxProximityThreshold = v5;
    unint64_t pitchMode = self->_pitchMode;
    if (pitchMode >= 2)
    {
      if (pitchMode == 2)
      {
        double v9 = +[VKWalkAssistFeedbackProcessor fourPitchesThresholdArray];
        id v14 = [v9 lastObject];

        double v10 = v14;
        if (v14)
        {
          double maxProximityThreshold = self->_maxProximityThreshold;
          [v14 doubleValue];
          double v10 = v14;
          if (maxProximityThreshold < v12)
          {
            [v14 doubleValue];
            double v10 = v14;
            self->_double maxProximityThreshold = v13;
          }
        }
      }
    }
    else
    {
      [&unk_26F825288 doubleValue];
      if (v7 > v5)
      {
        [&unk_26F825288 doubleValue];
        self->_double maxProximityThreshold = v8;
      }
    }
  }
}

- (void)_voiceOverStatusChanged
{
  if (UIAccessibilityIsVoiceOverRunning() && self->_shouldPlayAudio)
  {
    id v3 = [(VKWalkAssistFeedbackProcessor *)self toneGenerator];
    [v3 startPulse];
  }
  else
  {
    id v3 = [(VKWalkAssistFeedbackProcessor *)self toneGenerator];
    [v3 stopPulse];
  }
}

- (int)_mmFromMeters:(int)a3
{
  return 1000 * a3;
}

- (int64_t)pitchMode
{
  return self->_pitchMode;
}

- (BOOL)shouldPlayAudio
{
  return self->_shouldPlayAudio;
}

- (VKToneGenerator)toneGenerator
{
  return self->_toneGenerator;
}

- (void)setToneGenerator:(id)a3
{
}

- (double)minProximityThreshold
{
  return self->_minProximityThreshold;
}

- (void)setMinProximityThreshold:(double)a3
{
  self->_minProximityThreshold = a3;
}

- (double)maxProximityThreshold
{
  return self->_maxProximityThreshold;
}

- (void)setMaxProximityThreshold:(double)a3
{
  self->_double maxProximityThreshold = a3;
}

- (BOOL)isFacingLocation
{
  return self->_isFacingLocation;
}

- (void)setIsFacingLocation:(BOOL)a3
{
  self->_isFacingLocation = a3;
}

- (void).cxx_destruct
{
}

@end