@interface VKToneGenerator
- (AVAudioEngine)audioEngine;
- (AVAudioMixerNode)mixer;
- (AVAudioPCMBuffer)buffer;
- (AVAudioPlayerNode)player;
- (BOOL)shouldPlayHapticPulse;
- (BOOL)usesSoundFeedback;
- (NSTimer)timer;
- (NSURL)audioFileURL;
- (VKToneGenerator)initWithHapticEngineDelegate:(id)a3;
- (VKWalkAssistHapticEngineDelegate)hapticEngineDelegate;
- (double)maxPulseFrequency;
- (double)minPulseFrequency;
- (double)pulseDuration;
- (double)pulseFrequency;
- (float)leftBalance;
- (float)maxPitchFactor;
- (float)minPitchFactor;
- (float)pitchFactor;
- (float)rightBalance;
- (float)volume;
- (id)configureAudioEngineWithError:(id *)a3;
- (void)configurePlayerWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7;
- (void)pause;
- (void)playOnePulse;
- (void)playSoundWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7;
- (void)setAudioEngine:(id)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setHapticEngineDelegate:(id)a3;
- (void)setLeftBalance:(float)a3;
- (void)setMixer:(id)a3;
- (void)setPitchFactor:(float)a3;
- (void)setPlayer:(id)a3;
- (void)setPulseDuration:(double)a3;
- (void)setPulseFrequency:(double)a3;
- (void)setRightBalance:(float)a3;
- (void)setShouldPlayHapticPulse:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)setUsesSoundFeedback:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)startPulse;
- (void)stopPulse;
@end

@implementation VKToneGenerator

- (double)maxPulseFrequency
{
  return 2.5;
}

- (double)minPulseFrequency
{
  return 0.5;
}

- (float)minPitchFactor
{
  return 1.0;
}

- (float)maxPitchFactor
{
  return 1.34;
}

- (BOOL)usesSoundFeedback
{
  return self->_usesSoundFeedback && UIAccessibilityIsVoiceOverRunning();
}

- (void)setUsesSoundFeedback:(BOOL)a3
{
  if (self->_usesSoundFeedback != a3)
  {
    if (a3)
    {
      id v8 = 0;
      v4 = [(VKToneGenerator *)self configureAudioEngineWithError:&v8];
      id v5 = v8;
      audioEngine = self->_audioEngine;
      self->_audioEngine = v4;

      if (v5)
      {
        v7 = AXLogCommon();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[VKToneGenerator setUsesSoundFeedback:]();
        }
      }
      else
      {
        self->_usesSoundFeedback = 1;
      }
    }
    else
    {
      [(AVAudioEngine *)self->_audioEngine stop];
      self->_usesSoundFeedback = 0;
    }
  }
}

- (VKToneGenerator)initWithHapticEngineDelegate:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VKToneGenerator;
  id v5 = [(VKToneGenerator *)&v19 init];
  v6 = (VKToneGenerator *)v5;
  if (v5)
  {
    v5[8] = 0;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v5 + 12) = _Q0;
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 URLForResource:@"3beacon" withExtension:@"aiff"];
    audioFileURL = v6->_audioFileURL;
    v6->_audioFileURL = (NSURL *)v13;

    audioEngine = v6->_audioEngine;
    v6->_audioEngine = 0;

    timer = v6->_timer;
    v6->_timer = 0;

    objc_storeWeak((id *)&v6->_hapticEngineDelegate, v4);
    v17 = v6;
  }
  return v6;
}

- (void)startPulse
{
  if (!UIAccessibilityIsVoiceOverRunning()) {
    [(VKToneGenerator *)self stopPulse];
  }
  if (!self->_timer)
  {
    objc_initWeak(&location, self);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy_;
    v16[4] = __Block_byref_object_dispose_;
    id v17 = [MEMORY[0x263EFF910] date];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0x3FC3333333333333;
    id v3 = objc_alloc(MEMORY[0x263EFFA20]);
    id v4 = [MEMORY[0x263EFF910] date];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __29__VKToneGenerator_startPulse__block_invoke;
    v11 = &unk_2651628A8;
    objc_copyWeak(&v14, &location);
    v12 = v16;
    uint64_t v13 = v15;
    id v5 = (NSTimer *)[v3 initWithFireDate:v4 interval:1 repeats:&v8 block:0.001];
    timer = self->_timer;
    self->_timer = v5;

    v7 = objc_msgSend(MEMORY[0x263EFF9F0], "currentRunLoop", v8, v9, v10, v11);
    [v7 addTimer:self->_timer forMode:*MEMORY[0x263EFF478]];

    objc_destroyWeak(&v14);
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v16, 8);

    objc_destroyWeak(&location);
  }
}

void __29__VKToneGenerator_startPulse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v22 = WeakRetained;
    [WeakRetained volume];
    if (v3 <= 0.0)
    {
      [v22 pause];
      uint64_t v8 = [MEMORY[0x263EFF910] date];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      [v22 maxPulseFrequency];
      double v12 = v11;
      uint64_t v13 = a1 + 40;
LABEL_14:
      id WeakRetained = v22;
      *(double *)(*(void *)(*(void *)v13 + 8) + 24) = 1.0 / v12;
      goto LABEL_15;
    }
    [v22 minPulseFrequency];
    double v5 = v4;
    [v22 pulseFrequency];
    if (v5 <= v6) {
      [v22 pulseFrequency];
    }
    else {
      [v22 minPulseFrequency];
    }
    double v12 = 13.0;
    if (v7 <= 13.0)
    {
      [v22 minPulseFrequency];
      double v15 = v14;
      [v22 pulseFrequency];
      if (v15 <= v16) {
        [v22 pulseFrequency];
      }
      else {
        [v22 minPulseFrequency];
      }
      double v12 = v17;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
    uint64_t v13 = a1 + 40;
    id WeakRetained = v22;
    if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= -v18)
    {
      uint64_t v19 = [MEMORY[0x263EFF910] date];
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
      v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      [v22 playOnePulse];
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)stopPulse
{
  timer = self->_timer;
  if (timer)
  {
    [(NSTimer *)timer invalidate];
    double v4 = self->_timer;
    self->_timer = 0;

    [(VKToneGenerator *)self pause];
  }
}

- (id)configureAudioEngineWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EF9360]);
  double v6 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x263EF93C8]);
  player = self->_player;
  self->_player = v6;

  uint64_t v8 = [v5 mainMixerNode];
  mixer = self->_mixer;
  self->_mixer = v8;

  [v5 attachNode:self->_player];
  if ([v5 startAndReturnError:a3]) {
    id v10 = v5;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)playOnePulse
{
  *(float *)&double v4 = self->_rightBalance;
  *(float *)&double v2 = self->_pitchFactor;
  *(float *)&double v5 = self->_volume;
  *(float *)&double v3 = self->_leftBalance;
  [(VKToneGenerator *)self playSoundWithPitchFactor:0 leftBalance:v2 rightBalance:v3 volume:v4 loop:v5];
  if (self->_shouldPlayHapticPulse)
  {
    id v8 = [(VKToneGenerator *)self hapticEngineDelegate];
    *(float *)&double v7 = self->_volume;
    [v8 playSingleHapticPulseWithIntensity:v7 duration:self->_pulseDuration];
  }
}

- (void)pause
{
  if (![(AVAudioEngine *)self->_audioEngine isRunning]) {
    [(AVAudioEngine *)self->_audioEngine startAndReturnError:0];
  }
  player = self->_player;

  [(AVAudioPlayerNode *)player pause];
}

- (void)configurePlayerWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7
{
  if (self->_audioFileURL)
  {
    id v12 = objc_alloc(MEMORY[0x263EF9380]);
    audioFileURL = self->_audioFileURL;
    id v55 = 0;
    double v14 = (void *)[v12 initForReading:audioFileURL error:&v55];
    id v15 = v55;
    if (v15)
    {
      id v16 = v15;
      double v17 = AXLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:]();
      }
      goto LABEL_35;
    }
    double v17 = [v14 processingFormat];
    [(AVAudioEngine *)self->_audioEngine connect:self->_player to:self->_mixer format:v17];
    [v17 sampleRate];
    double v19 = v18;
    uint64_t v20 = [v14 length];
    id v21 = objc_alloc(MEMORY[0x263EF93B0]);
    id v22 = [v14 processingFormat];
    v23 = (void *)[v21 initWithPCMFormat:v22 frameCapacity:v20];

    [v23 setFrameLength:v20];
    id v54 = 0;
    [v14 readIntoBuffer:v23 error:&v54];
    id v16 = v54;
    if (v16)
    {
      v24 = AXLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:]();
      }
    }
    else
    {
      float v25 = v19;
      float v26 = (float)v20 / a3;
      uint64_t v27 = v26;
      self->_pulseDuration = (float)((float)v26 / v25);
      id v28 = objc_alloc(MEMORY[0x263EF93B0]);
      v29 = [v14 processingFormat];
      v30 = (AVAudioPCMBuffer *)[v28 initWithPCMFormat:v29 frameCapacity:v27];
      buffer = self->_buffer;
      self->_buffer = v30;

      [(AVAudioPCMBuffer *)self->_buffer setFrameLength:v27];
      unsigned int v32 = [v17 channelCount];
      if (v32)
      {
        unsigned int v33 = v32;
        uint64_t v34 = [v23 floatChannelData];
        v35 = [(AVAudioPCMBuffer *)self->_buffer floatChannelData];
        v36 = (float *)malloc_type_malloc(4 * v33, 0x100004052888210uLL);
        if (v33 == 1)
        {
          if (a4 <= a5) {
            float v37 = a5;
          }
          else {
            float v37 = a4;
          }
          float *v36 = v37 * a6;
        }
        else
        {
          uint64_t v38 = (v33 + 1) & 0x1FFFFFFFELL;
          uint64x2_t v39 = (uint64x2_t)vdupq_n_s64((unint64_t)v33 - 1);
          int64x2_t v40 = (int64x2_t)xmmword_2426CBB90;
          v41 = v36 + 1;
          int64x2_t v42 = vdupq_n_s64(2uLL);
          do
          {
            int32x2_t v43 = vmovn_s64((int64x2_t)vcgeq_u64(v39, (uint64x2_t)v40));
            if (v43.i8[0]) {
              *(v41 - 1) = a4 * a6;
            }
            if (v43.i8[4]) {
              float *v41 = a5 * a6;
            }
            int64x2_t v40 = vaddq_s64(v40, v42);
            v41 += 2;
            v38 -= 2;
          }
          while (v38);
        }
        uint64_t v44 = 0;
        uint64_t v45 = (v20 - 1);
        if (v33 <= 1) {
          uint64_t v46 = 1;
        }
        else {
          uint64_t v46 = v33;
        }
        do
        {
          if (v27)
          {
            uint64_t v47 = 0;
            float v48 = v36[v44];
            uint64_t v49 = *(void *)(v34 + 8 * v44);
            v50 = v35[v44];
            do
            {
              float v51 = (float)(int)v47 * a3;
              if (v51 >= (float)v45)
              {
                float v53 = *(float *)(v49 + 4 * v45);
              }
              else
              {
                signed int v52 = vcvtms_s32_f32(v51);
                float v53 = *(float *)(v49 + 4 * v52)
                    + (float)((float)(*(float *)(v49 + 4 * (int)vcvtps_s32_f32(v51)) - *(float *)(v49 + 4 * v52))
                            * (float)(v51 - (float)(int)floorf(v51)));
              }
              v50[v47++] = v48 * v53;
            }
            while (v27 != v47);
          }
          ++v44;
        }
        while (v44 != v46);
        free(v36);
        goto LABEL_34;
      }
      v24 = AXLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:](v24);
      }
    }

LABEL_34:
LABEL_35:
  }
}

- (void)playSoundWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7
{
  if (self->_usesSoundFeedback)
  {
    BOOL v7 = a7;
    -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:](self, "configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:");
    if (self->_buffer)
    {
      if ([(AVAudioEngine *)self->_audioEngine isRunning])
      {
        if (v7) {
          uint64_t v9 = 5;
        }
        else {
          uint64_t v9 = 4;
        }
        [(AVAudioPlayerNode *)self->_player scheduleBuffer:self->_buffer atTime:0 options:v9 completionHandler:&__block_literal_global_0];
        player = self->_player;
        [(AVAudioPlayerNode *)player play];
      }
      else
      {
        id v15 = 0;
        double v11 = [(VKToneGenerator *)self configureAudioEngineWithError:&v15];
        id v12 = v15;
        audioEngine = self->_audioEngine;
        self->_audioEngine = v11;

        if (v12)
        {
          double v14 = AXLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            -[VKToneGenerator setUsesSoundFeedback:]();
          }
        }
      }
    }
  }
}

- (double)pulseFrequency
{
  return self->_pulseFrequency;
}

- (void)setPulseFrequency:(double)a3
{
  self->_pulseFrequency = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)leftBalance
{
  return self->_leftBalance;
}

- (void)setLeftBalance:(float)a3
{
  self->_leftBalance = a3;
}

- (float)rightBalance
{
  return self->_rightBalance;
}

- (void)setRightBalance:(float)a3
{
  self->_rightBalance = a3;
}

- (float)pitchFactor
{
  return self->_pitchFactor;
}

- (void)setPitchFactor:(float)a3
{
  self->_pitchFactor = a3;
}

- (BOOL)shouldPlayHapticPulse
{
  return self->_shouldPlayHapticPulse;
}

- (void)setShouldPlayHapticPulse:(BOOL)a3
{
  self->_shouldPlayHapticPulse = a3;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVAudioMixerNode)mixer
{
  return self->_mixer;
}

- (void)setMixer:(id)a3
{
}

- (AVAudioPCMBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (VKWalkAssistHapticEngineDelegate)hapticEngineDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapticEngineDelegate);

  return (VKWalkAssistHapticEngineDelegate *)WeakRetained;
}

- (void)setHapticEngineDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hapticEngineDelegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);

  objc_storeStrong((id *)&self->_audioFileURL, 0);
}

- (void)setUsesSoundFeedback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot start AVAudioEngine: %@", v2, v3, v4, v5, v6);
}

- (void)configurePlayerWithPitchFactor:(os_log_t)log leftBalance:rightBalance:volume:loop:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_2426A3000, log, OS_LOG_TYPE_FAULT, "Channel count equal to zero", v1, 2u);
}

- (void)configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot read audio file into buffer: %@", v2, v3, v4, v5, v6);
}

- (void)configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot read audio file: %@", v2, v3, v4, v5, v6);
}

@end