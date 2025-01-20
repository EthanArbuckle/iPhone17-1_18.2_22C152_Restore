@interface ToneGenerator
- (AVAudioEngine)audioEngine;
- (AVAudioMixerNode)mixer;
- (AVAudioPCMBuffer)buffer;
- (AVAudioPlayerNode)player;
- (BOOL)hapticEngineStarted;
- (BOOL)useHapticFeedback;
- (BOOL)useSoundFeedback;
- (CHHapticEngine)hapticEngine;
- (NSTimer)timer;
- (NSURL)audioFileURL;
- (ToneGenerator)init;
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
- (id)configureHapticPlayerWithVolume:(float)a3 duration:(double)a4 error:(id *)a5;
- (unint64_t)detectionType;
- (void)configurePlayerWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7;
- (void)pause;
- (void)playHapticsWithVolume:(float)a3 pulseDuration:(double)a4;
- (void)playOnePulse;
- (void)playSoundWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7;
- (void)setAudioEngine:(id)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setDetectionType:(unint64_t)a3;
- (void)setHapticEngine:(id)a3;
- (void)setHapticEngineStarted:(BOOL)a3;
- (void)setLeftBalance:(float)a3;
- (void)setMixer:(id)a3;
- (void)setPitchFactor:(float)a3;
- (void)setPlayer:(id)a3;
- (void)setPulseDuration:(double)a3;
- (void)setPulseFrequency:(double)a3;
- (void)setRightBalance:(float)a3;
- (void)setTimer:(id)a3;
- (void)setUseHapticFeedback:(BOOL)a3;
- (void)setUseSoundFeedback:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)startPulse;
- (void)stopPulse;
@end

@implementation ToneGenerator

- (double)maxPulseFrequency
{
  return 5.0;
}

- (double)minPulseFrequency
{
  return 1.0;
}

- (float)minPitchFactor
{
  return 1.0;
}

- (float)maxPitchFactor
{
  return 1.34;
}

- (BOOL)useSoundFeedback
{
  return self->_useSoundFeedback;
}

- (void)setUseSoundFeedback:(BOOL)a3
{
  if (self->_useSoundFeedback != a3)
  {
    if (a3)
    {
      soundQueue = self->_soundQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__ToneGenerator_setUseSoundFeedback___block_invoke;
      block[3] = &unk_264C602D8;
      block[4] = self;
      dispatch_async(soundQueue, block);
      self->_useSoundFeedback = 1;
    }
    else
    {
      [(AVAudioEngine *)self->_audioEngine stop];
      self->_useSoundFeedback = 0;
    }
  }
}

void __37__ToneGenerator_setUseSoundFeedback___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v8 = 0;
  uint64_t v3 = [v2 configureAudioEngineWithError:&v8];
  id v4 = v8;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v3;

  if (v4)
  {
    v7 = MAGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __37__ToneGenerator_setUseSoundFeedback___block_invoke_cold_1();
    }
  }
}

- (BOOL)useHapticFeedback
{
  return self->_useHapticFeedback;
}

- (void)setUseHapticFeedback:(BOOL)a3
{
  if (self->_useHapticFeedback != a3)
  {
    if (a3)
    {
      if (!self->_hapticEngineStarted)
      {
        id v4 = [MEMORY[0x263F00588] capabilitiesForHardware];
        int v5 = [v4 supportsHaptics];

        if (v5)
        {
          hapticQueue = self->_hapticQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke;
          block[3] = &unk_264C602D8;
          block[4] = self;
          dispatch_async(hapticQueue, block);
        }
      }
    }
    else if (self->_hapticEngineStarted)
    {
      objc_initWeak(&location, self);
      hapticEngine = self->_hapticEngine;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke_6;
      v8[3] = &unk_264C60350;
      objc_copyWeak(&v9, &location);
      [(CHHapticEngine *)hapticEngine stopWithCompletionHandler:v8];
      self->_useHapticFeedback = 0;
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F00588]);
  uint64_t v3 = [MEMORY[0x263EF93E0] sharedInstance];
  id v19 = 0;
  uint64_t v4 = [v2 initWithAudioSession:v3 error:&v19];
  id v5 = v19;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v4;

  if (v5)
  {
    id v8 = MAGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_2();
    }
LABEL_7:

    return;
  }
  id v9 = *(void **)(*(void *)(a1 + 32) + 120);
  id v18 = 0;
  [v9 startAndReturnError:&v18];
  id v10 = v18;
  if (v10)
  {
    id v5 = v10;
    id v8 = MAGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v11 = *(void **)(*(void *)(a1 + 32) + 120);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke_3;
  v15[3] = &unk_264C60300;
  objc_copyWeak(&v16, &location);
  [v11 setResetHandler:v15];
  v12 = *(void **)(*(void *)(a1 + 32) + 120);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke_4;
  v13[3] = &unk_264C60328;
  objc_copyWeak(&v14, &location);
  [v12 setStoppedHandler:v13];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained hapticEngine];
  id v9 = 0;
  [v3 startAndReturnError:&v9];
  id v4 = v9;

  if (v4)
  {
    id v5 = MAGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_3_cold_1();
    }

    id v6 = objc_loadWeakRetained(v1);
    [v6 setUseHapticFeedback:0];

    id v7 = objc_loadWeakRetained(v1);
    [v7 setHapticEngineStarted:0];
  }
  else
  {
    id v8 = objc_loadWeakRetained(v1);
    [v8 setHapticEngineStarted:1];

    id v7 = objc_loadWeakRetained(v1);
    [v7 setUseHapticFeedback:1];
  }
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHapticEngineStarted:0];

  id v5 = objc_loadWeakRetained(v3);
  [v5 setUseHapticFeedback:0];

  switch(a2)
  {
    case -1:
      id v6 = MAGLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_5();
      }
      break;
    case 1:
      id v6 = MAGLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_2();
      }
      break;
    case 2:
      id v6 = MAGLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_3();
      }
      break;
    case 3:
      id v6 = MAGLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_4();
      }
      break;
    default:
      id v6 = MAGLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_1();
      }
      break;
  }
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = WeakRetained;
  if (v3)
  {
    int v7 = [WeakRetained hapticEngineStarted];

    if (v7)
    {
      id v8 = objc_loadWeakRetained(v4);
      [v8 setUseHapticFeedback:1];
    }
    id v9 = MAGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_6_cold_1();
    }
  }
  else
  {
    [WeakRetained setHapticEngineStarted:0];
  }
}

- (ToneGenerator)init
{
  v20.receiver = self;
  v20.super_class = (Class)ToneGenerator;
  id v2 = [(ToneGenerator *)&v20 init];
  id v3 = (ToneGenerator *)v2;
  if (v2)
  {
    v2[8] = 0;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v2 + 36) = _Q0;
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 URLForResource:@"ax_distance_midHigh" withExtension:@"aiff"];
    audioFileURL = v3->_audioFileURL;
    v3->_audioFileURL = (NSURL *)v10;

    audioEngine = v3->_audioEngine;
    v3->_audioEngine = 0;

    v3->_useHapticFeedback = 0;
    v3->_hapticEngineStarted = 0;
    v3->_detectionType = 0;
    timer = v3->_timer;
    v3->_timer = 0;

    dispatch_queue_t v14 = dispatch_queue_create("Haptic Queue", 0);
    hapticQueue = v3->_hapticQueue;
    v3->_hapticQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("Sound Queue", 0);
    soundQueue = v3->_soundQueue;
    v3->_soundQueue = (OS_dispatch_queue *)v16;

    id v18 = v3;
  }

  return v3;
}

- (void)startPulse
{
  if (!self->_timer)
  {
    objc_initWeak(&location, self);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__0;
    v16[4] = __Block_byref_object_dispose__0;
    id v17 = [MEMORY[0x263EFF910] date];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0x3FC3333333333333;
    id v3 = objc_alloc(MEMORY[0x263EFFA20]);
    id v4 = [MEMORY[0x263EFF910] date];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __27__ToneGenerator_startPulse__block_invoke;
    v11 = &unk_264C60378;
    objc_copyWeak(&v14, &location);
    v12 = v16;
    v13 = v15;
    id v5 = (NSTimer *)[v3 initWithFireDate:v4 interval:1 repeats:&v8 block:0.001];
    timer = self->_timer;
    self->_timer = v5;

    int v7 = objc_msgSend(MEMORY[0x263EFF9F0], "currentRunLoop", v8, v9, v10, v11);
    [v7 addTimer:self->_timer forMode:*MEMORY[0x263EFF478]];

    objc_destroyWeak(&v14);
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v16, 8);

    objc_destroyWeak(&location);
  }
}

void __27__ToneGenerator_startPulse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v18 = WeakRetained;
    [WeakRetained volume];
    if (v3 <= 0.0)
    {
      [v18 pause];
      uint64_t v14 = [MEMORY[0x263EFF910] date];
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      dispatch_queue_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      [v18 maxPulseFrequency];
      uint64_t v9 = a1 + 40;
      double v13 = 1.0 / v17;
    }
    else
    {
      [v18 minPulseFrequency];
      double v5 = v4;
      [v18 pulseFrequency];
      double v7 = v6;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
      uint64_t v9 = a1 + 40;
      id WeakRetained = v18;
      if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > -v8) {
        goto LABEL_11;
      }
      if (v5 < v7) {
        double v5 = v7;
      }
      uint64_t v10 = [MEMORY[0x263EFF910] date];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      [v18 playOnePulse];
      double v13 = 0.0769230769;
      if (v5 <= 13.0) {
        double v13 = 1.0 / v5;
      }
    }
    *(double *)(*(void *)(*(void *)v9 + 8) + 24) = v13;
    id WeakRetained = v18;
  }
LABEL_11:
}

- (void)stopPulse
{
  timer = self->_timer;
  if (timer)
  {
    [(NSTimer *)timer invalidate];
    double v4 = self->_timer;
    self->_timer = 0;

    [(ToneGenerator *)self pause];
  }
}

- (id)configureAudioEngineWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EF9360]);
  double v6 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x263EF93C8]);
  player = self->_player;
  self->_player = v6;

  double v8 = [v5 mainMixerNode];
  mixer = self->_mixer;
  self->_mixer = v8;

  [v5 attachNode:self->_player];
  uint64_t v11 = self->_player;
  uint64_t v10 = self->_mixer;
  v12 = [(AVAudioPlayerNode *)v11 outputFormatForBus:0];
  [v5 connect:v11 to:v10 format:v12];

  int v13 = [v5 startAndReturnError:a3];
  id v14 = 0;
  if (v13) {
    id v14 = v5;
  }

  return v14;
}

- (void)playOnePulse
{
  *(float *)&double v4 = self->_rightBalance;
  *(float *)&double v2 = self->_pitchFactor;
  *(float *)&double v5 = self->_volume;
  *(float *)&double v3 = self->_leftBalance;
  [(ToneGenerator *)self playSoundWithPitchFactor:0 leftBalance:v2 rightBalance:v3 volume:v4 loop:v5];
  *(float *)&double v7 = self->_volume;
  double pulseDuration = self->_pulseDuration;
  [(ToneGenerator *)self playHapticsWithVolume:v7 pulseDuration:pulseDuration];
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
    v12 = [(AVAudioMixerNode *)self->_mixer outputFormatForBus:0];
    [v12 sampleRate];
    double v14 = v13;

    id v15 = objc_alloc(MEMORY[0x263EF9380]);
    audioFileURL = self->_audioFileURL;
    id v55 = 0;
    double v17 = (void *)[v15 initForReading:audioFileURL error:&v55];
    id v18 = v55;
    if (v18)
    {
      id v19 = v18;
      objc_super v20 = MAGLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:]();
      }
    }
    else
    {
      uint64_t v21 = [v17 length];
      id v22 = objc_alloc(MEMORY[0x263EF93B0]);
      v23 = [v17 processingFormat];
      objc_super v20 = [v22 initWithPCMFormat:v23 frameCapacity:v21];

      [v20 setFrameLength:v21];
      id v54 = 0;
      [v17 readIntoBuffer:v20 error:&v54];
      id v19 = v54;
      if (v19)
      {
        v24 = MAGLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[ToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:]();
        }
      }
      else
      {
        float v25 = v14;
        float v26 = (float)v21 / a3;
        uint64_t v27 = v26;
        self->_double pulseDuration = (float)((float)v26 / v25);
        id v28 = objc_alloc(MEMORY[0x263EF93B0]);
        v29 = [v17 processingFormat];
        v30 = (AVAudioPCMBuffer *)[v28 initWithPCMFormat:v29 frameCapacity:v27];
        buffer = self->_buffer;
        self->_buffer = v30;

        [(AVAudioPCMBuffer *)self->_buffer setFrameLength:v27];
        v32 = [(AVAudioMixerNode *)self->_mixer outputFormatForBus:0];
        unsigned int v33 = [v32 channelCount];

        if (v33)
        {
          uint64_t v34 = [v20 floatChannelData];
          v35 = [(AVAudioPCMBuffer *)self->_buffer floatChannelData];
          v36 = (float *)malloc_type_malloc(4 * v33, 0x100004052888210uLL);
          if (v33 == 1)
          {
            if (a4 >= a5) {
              float v37 = a4;
            }
            else {
              float v37 = a5;
            }
            float *v36 = v37 * a6;
          }
          else
          {
            uint64_t v38 = (v33 + 1) & 0x1FFFFFFFELL;
            uint64x2_t v39 = (uint64x2_t)vdupq_n_s64((unint64_t)v33 - 1);
            int64x2_t v40 = (int64x2_t)xmmword_23594FCD0;
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
          uint64_t v45 = (v21 - 1);
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
        }
      }
    }
  }
}

- (void)playSoundWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7
{
  objc_initWeak(&location, self);
  hapticQueue = self->_hapticQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__ToneGenerator_playSoundWithPitchFactor_leftBalance_rightBalance_volume_loop___block_invoke;
  block[3] = &unk_264C603A0;
  objc_copyWeak(&v15, &location);
  float v16 = a3;
  float v17 = a4;
  float v18 = a5;
  float v19 = a6;
  BOOL v20 = a7;
  dispatch_async(hapticQueue, block);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __79__ToneGenerator_playSoundWithPitchFactor_leftBalance_rightBalance_volume_loop___block_invoke(uint64_t a1)
{
  double v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained useSoundFeedback];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    LODWORD(v6) = *(_DWORD *)(a1 + 40);
    LODWORD(v7) = *(_DWORD *)(a1 + 44);
    LODWORD(v8) = *(_DWORD *)(a1 + 48);
    LODWORD(v9) = *(_DWORD *)(a1 + 52);
    [v5 configurePlayerWithPitchFactor:*(unsigned __int8 *)(a1 + 56) leftBalance:v6 rightBalance:v7 volume:v8 loop:v9];

    id v10 = objc_loadWeakRetained(v2);
    uint64_t v11 = [v10 buffer];

    if (v11)
    {
      id v12 = objc_loadWeakRetained(v2);
      double v13 = [v12 audioEngine];
      char v14 = [v13 isRunning];

      if (v14)
      {
        if (*(unsigned char *)(a1 + 56)) {
          uint64_t v15 = 5;
        }
        else {
          uint64_t v15 = 4;
        }
        id v16 = objc_loadWeakRetained(v2);
        float v17 = [v16 player];
        id v18 = objc_loadWeakRetained(v2);
        float v19 = [v18 buffer];
        [v17 scheduleBuffer:v19 atTime:0 options:v15 completionHandler:&__block_literal_global_1];

        id v26 = objc_loadWeakRetained(v2);
        BOOL v20 = [v26 player];
        [v20 play];
      }
      else
      {
        id v21 = objc_loadWeakRetained(v2);
        id v27 = 0;
        id v22 = [v21 configureAudioEngineWithError:&v27];
        id v23 = v27;
        id v24 = objc_loadWeakRetained(v2);
        [v24 setAudioEngine:v22];

        if (v23)
        {
          float v25 = MAGLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            __37__ToneGenerator_setUseSoundFeedback___block_invoke_cold_1();
          }
        }
      }
    }
  }
}

- (id)configureHapticPlayerWithVolume:(float)a3 duration:(double)a4 error:(id *)a5
{
  v131[1] = *MEMORY[0x263EF8340];
  uint64_t v130 = *MEMORY[0x263F00560];
  uint64_t v127 = *MEMORY[0x263F00530];
  uint64_t v8 = *MEMORY[0x263F00528];
  uint64_t v9 = *MEMORY[0x263F00568];
  v125[0] = *MEMORY[0x263F00548];
  v125[1] = v9;
  v126[0] = v8;
  v126[1] = &unk_26E8DF990;
  v125[2] = *MEMORY[0x263F00538];
  id v10 = [NSNumber numberWithDouble:a4];
  v126[2] = v10;
  v125[3] = *MEMORY[0x263F00540];
  uint64_t v11 = *MEMORY[0x263F00550];
  v123[0] = *MEMORY[0x263F00508];
  uint64_t v12 = *MEMORY[0x263F00558];
  v122[0] = v11;
  v122[1] = v12;
  *(float *)&double v13 = a3;
  char v14 = [NSNumber numberWithFloat:v13];
  v123[1] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
  v124 = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v124 count:1];
  v126[3] = v16;
  float v17 = [NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:4];
  v128 = v17;
  id v18 = [NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
  v129 = v18;
  float v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v129 count:1];
  v131[0] = v19;
  v78 = [NSDictionary dictionaryWithObjects:v131 forKeys:&v130 count:1];

  unint64_t detectionType = self->_detectionType;
  id v21 = (void *)MEMORY[0x263F00510];
  v77 = self;
  if (detectionType == 1)
  {
    uint64_t v120 = *MEMORY[0x263F00560];
    uint64_t v117 = *MEMORY[0x263F00530];
    uint64_t v22 = *MEMORY[0x263F00528];
    uint64_t v23 = *MEMORY[0x263F00568];
    v115[0] = *MEMORY[0x263F00548];
    v115[1] = v23;
    v116[0] = v22;
    v116[1] = &unk_26E8DF990;
    v115[2] = *MEMORY[0x263F00538];
    v74 = [NSNumber numberWithDouble:a4];
    v116[2] = v74;
    v115[3] = *MEMORY[0x263F00540];
    uint64_t v24 = *MEMORY[0x263F00550];
    v113[0] = *MEMORY[0x263F00508];
    uint64_t v25 = *MEMORY[0x263F00558];
    v112[0] = v24;
    v112[1] = v25;
    *(float *)&double v26 = a3;
    id v27 = [NSNumber numberWithFloat:v26];
    v113[1] = v27;
    id v28 = [NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:2];
    v114 = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
    v115[4] = *v21;
    v116[3] = v29;
    v116[4] = &unk_26E8DF9A0;
    v30 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:5];
    v118 = v30;
    v31 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
    v119 = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v119 count:1];
    v121 = v32;
    uint64_t v33 = [NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];

    unint64_t detectionType = v77->_detectionType;
    uint64_t v34 = (void *)v33;
  }
  else
  {
    uint64_t v34 = v78;
  }
  if (detectionType == 2)
  {
    uint64_t v110 = *MEMORY[0x263F00560];
    uint64_t v107 = *MEMORY[0x263F00530];
    uint64_t v35 = *MEMORY[0x263F00528];
    uint64_t v36 = *MEMORY[0x263F00568];
    v105[0] = *MEMORY[0x263F00548];
    v105[1] = v36;
    v106[0] = v35;
    v106[1] = &unk_26E8DF990;
    v105[2] = *MEMORY[0x263F00538];
    v75 = [NSNumber numberWithDouble:a4];
    v106[2] = v75;
    v105[3] = *MEMORY[0x263F00540];
    uint64_t v37 = *MEMORY[0x263F00550];
    v103[0] = *MEMORY[0x263F00508];
    uint64_t v38 = *MEMORY[0x263F00558];
    v102[0] = v37;
    v102[1] = v38;
    *(float *)&double v39 = a3;
    [NSNumber numberWithFloat:v39];
    int64x2_t v40 = v79 = v34;
    v103[1] = v40;
    v41 = [NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:2];
    v104 = v41;
    int64x2_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v104 count:1];
    v105[4] = *MEMORY[0x263F00510];
    v106[3] = v42;
    v106[4] = &unk_26E8DF9B0;
    int32x2_t v43 = [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:5];
    v108 = v43;
    uint64_t v44 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    v109 = v44;
    uint64_t v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v109 count:1];
    v111 = v45;
    uint64_t v34 = [NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];

    uint64_t v46 = v77;
    unint64_t detectionType = v77->_detectionType;
  }
  else
  {
    uint64_t v46 = v77;
  }
  if (detectionType == 3)
  {
    uint64_t v100 = *MEMORY[0x263F00560];
    uint64_t v97 = *MEMORY[0x263F00530];
    uint64_t v47 = *MEMORY[0x263F00528];
    uint64_t v48 = *MEMORY[0x263F00568];
    v95[0] = *MEMORY[0x263F00548];
    v95[1] = v48;
    v96[0] = v47;
    v96[1] = &unk_26E8DF990;
    v95[2] = *MEMORY[0x263F00538];
    [NSNumber numberWithDouble:a4];
    uint64_t v49 = v80 = v34;
    v96[2] = v49;
    v95[3] = *MEMORY[0x263F00540];
    uint64_t v50 = *MEMORY[0x263F00550];
    v93[0] = *MEMORY[0x263F00508];
    uint64_t v51 = *MEMORY[0x263F00558];
    v92[0] = v50;
    v92[1] = v51;
    *(float *)&double v52 = a3;
    float v53 = [NSNumber numberWithFloat:v52];
    v93[1] = v53;
    id v54 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
    v94 = v54;
    id v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
    v95[4] = *MEMORY[0x263F00510];
    v96[3] = v55;
    v96[4] = &unk_26E8DF9C0;
    v56 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:5];
    v98 = v56;
    v57 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    v99 = v57;
    v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v99 count:1];
    v101 = v58;
    uint64_t v34 = [NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];

    uint64_t v46 = v77;
    unint64_t detectionType = v77->_detectionType;
  }
  if (detectionType == 4)
  {
    uint64_t v90 = *MEMORY[0x263F00560];
    uint64_t v87 = *MEMORY[0x263F00530];
    uint64_t v59 = *MEMORY[0x263F00528];
    uint64_t v60 = *MEMORY[0x263F00568];
    v85[0] = *MEMORY[0x263F00548];
    v85[1] = v60;
    v86[0] = v59;
    v86[1] = &unk_26E8DF990;
    v85[2] = *MEMORY[0x263F00538];
    [NSNumber numberWithDouble:a4];
    v61 = v81 = v34;
    v86[2] = v61;
    v85[3] = *MEMORY[0x263F00540];
    uint64_t v62 = *MEMORY[0x263F00550];
    v83[0] = *MEMORY[0x263F00508];
    uint64_t v63 = *MEMORY[0x263F00558];
    v82[0] = v62;
    v82[1] = v63;
    *(float *)&double v64 = a3;
    v65 = [NSNumber numberWithFloat:v64];
    v83[1] = v65;
    v66 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
    v84 = v66;
    v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
    v85[4] = *MEMORY[0x263F00510];
    v86[3] = v67;
    v86[4] = &unk_26E8DF9D0;
    v68 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:5];
    v88 = v68;
    v69 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    v89 = v69;
    v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
    v91 = v70;
    uint64_t v34 = [NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];

    uint64_t v46 = v77;
  }
  v71 = (void *)[objc_alloc(MEMORY[0x263F005A8]) initWithDictionary:v34 error:a5];
  if (v71)
  {
    v72 = [(CHHapticEngine *)v46->_hapticEngine createPlayerWithPattern:v71 error:a5];
  }
  else
  {
    v72 = 0;
  }

  return v72;
}

- (void)playHapticsWithVolume:(float)a3 pulseDuration:(double)a4
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  id v7 = objc_initWeak(&location, self);
  id v13 = [(ToneGenerator *)self hapticEngine];

  hapticQueue = self->_hapticQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke;
  block[3] = &unk_264C603C8;
  objc_copyWeak(v10, &location);
  void block[4] = v12;
  float v11 = a3;
  v10[1] = *(id *)&a4;
  dispatch_async(hapticQueue, block);
  objc_destroyWeak(v10);
  _Block_object_dispose(v12, 8);

  objc_destroyWeak(&location);
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke(uint64_t a1)
{
  double v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained useHapticFeedback];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    char v6 = [v5 hapticEngineStarted];

    if ((v6 & 1) == 0)
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v17 = 0;
      [v7 startAndReturnError:&v17];
      id v8 = v17;
      if (v8)
      {
        id v9 = v8;
        id v10 = MAGLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_3();
        }
LABEL_12:

        return;
      }
      id v11 = objc_loadWeakRetained(v2);
      [v11 setHapticEngineStarted:1];
    }
    id v12 = objc_loadWeakRetained(v2);
    LODWORD(v13) = *(_DWORD *)(a1 + 56);
    double v14 = *(double *)(a1 + 48);
    id v16 = 0;
    id v10 = [v12 configureHapticPlayerWithVolume:&v16 duration:v13 error:v14];
    id v9 = v16;

    if (v9)
    {
      uint64_t v15 = MAGLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_2();
      }
    }
    else
    {
      [v10 startAtTime:0 error:0.0];
    }
    goto LABEL_12;
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

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(unint64_t)a3
{
  self->_unint64_t detectionType = a3;
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
  self->_double pulseDuration = a3;
}

- (CHHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
}

- (BOOL)hapticEngineStarted
{
  return self->_hapticEngineStarted;
}

- (void)setHapticEngineStarted:(BOOL)a3
{
  self->_hapticEngineStarted = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_soundQueue, 0);
  objc_storeStrong((id *)&self->_hapticQueue, 0);
}

void __37__ToneGenerator_setUseSoundFeedback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot start AVAudioEngine: %@", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot start CHHapticEngine: %@", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot initialize CHHapticEngine: %@", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot restart CHHapticEngine: %@", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235640000, v0, v1, "CHHapticEngine stopped: Unknown reason", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235640000, v0, v1, "CHHapticEngine stopped: Audio Session Interrupt", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235640000, v0, v1, "CHHapticEngine stopped: Application Suspended", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235640000, v0, v1, "CHHapticEngine stopped: Idle Timeout", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235640000, v0, v1, "CHHapticEngine stopped: System Error", v2, v3, v4, v5, v6);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot stop CHHapticEngine: %@", v2, v3, v4, v5, v6);
}

- (void)configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot read audio file into buffer: %@", v2, v3, v4, v5, v6);
}

- (void)configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot read audio file: %@", v2, v3, v4, v5, v6);
}

void __79__ToneGenerator_playSoundWithPitchFactor_leftBalance_rightBalance_volume_loop___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Could not play player with error: %@", v2, v3, v4, v5, v6);
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot start haptic player: %@", v2, v3, v4, v5, v6);
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot configure haptic player: %@", v2, v3, v4, v5, v6);
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235640000, v0, v1, "Cannot restart haptic engine: %@", v2, v3, v4, v5, v6);
}

@end