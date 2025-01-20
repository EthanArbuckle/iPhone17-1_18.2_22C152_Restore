@interface BKUIPearlEnrollAudioManager
- (BKUIPearlAudioStateDelegate)stateDelegate;
- (BKUIPearlEnrollControllerPreloadedState)preloadedState;
- (CHHapticEngine)hapticsEngine;
- (id)createEngine;
- (id)hapticEventWithEventType:(unint64_t)a3 withDelay:(double)a4;
- (void)cleanupHaptics;
- (void)cleanupHapticsAndSound;
- (void)cleanupSound;
- (void)dealloc;
- (void)fadeCurrentSound:(double)a3 completion:(id)a4;
- (void)playHaptic:(unint64_t)a3 withDelay:(double)a4;
- (void)playHapticWithEvents:(id)a3;
- (void)setHapticsEngine:(id)a3;
- (void)setPreloadedState:(id)a3;
- (void)setStateDelegate:(id)a3;
- (void)setUpHaptics;
- (void)setupSound;
- (void)triggerSoundHapticForTransitionToState:(int)a3 fromState:(int)a4;
- (void)triggerSoundHapticForTransitionToSubstate:(int)a3 fromSubstate:(int)a4;
@end

@implementation BKUIPearlEnrollAudioManager

- (void)cleanupHapticsAndSound
{
  [(BKUIPearlEnrollAudioManager *)self cleanupSound];

  [(BKUIPearlEnrollAudioManager *)self cleanupHaptics];
}

- (void)setupSound
{
  v3 = [(BKUIPearlEnrollControllerPreloadedState *)self->_preloadedState acquireCachedAudioSession];
  audioSession = self->_audioSession;
  self->_audioSession = v3;

  v5 = self->_audioSession;
  if (!v5)
  {
    v6 = objc_alloc_init(BKUIPearlAudioSession);
    v7 = self->_audioSession;
    self->_audioSession = v6;

    v5 = self->_audioSession;
  }
  v8 = [(BKUIPearlAudioSession *)v5 audioEngine];
  int v9 = [v8 isRunning];

  if (v9)
  {
    v10 = self->_audioSession;
    [(BKUIPearlAudioSession *)v10 play];
  }
  else
  {
    v11 = _BKUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Unable to play sound, audio engine is not running!", v12, 2u);
    }
  }
}

- (void)cleanupSound
{
  v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up sound.", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__BKUIPearlEnrollAudioManager_cleanupSound__block_invoke;
  v4[3] = &unk_1E6EA20C0;
  v4[4] = self;
  [(BKUIPearlEnrollAudioManager *)self fadeCurrentSound:v4 completion:10.0];
}

void __43__BKUIPearlEnrollAudioManager_cleanupSound__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) stop];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) audioEngine];
  [v2 stop];

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Sound stopped!", v6, 2u);
  }
}

- (void)setUpHaptics
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v5 = [(BKUIPearlEnrollAudioManager *)self hapticsEngine];

    if (!v5)
    {
      id v6 = [(BKUIPearlEnrollAudioManager *)self createEngine];
      [(BKUIPearlEnrollAudioManager *)self setHapticsEngine:v6];
    }
  }
}

- (void)cleanupHaptics
{
  uint64_t v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up Haptics.", v5, 2u);
  }

  uint64_t v4 = [(BKUIPearlEnrollAudioManager *)self hapticsEngine];
  [v4 stopWithCompletionHandler:&__block_literal_global_11];
}

void __45__BKUIPearlEnrollAudioManager_cleanupHaptics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _BKUILoggingFacility();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = [v2 localizedDescription];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Unable to clean up Haptics %@.", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Haptics stopped!", (uint8_t *)&v6, 2u);
  }
}

- (void)triggerSoundHapticForTransitionToState:(int)a3 fromState:(int)a4
{
  if (a3 == 2)
  {
    double v5 = 0.0;
LABEL_3:
    -[BKUIPearlEnrollAudioManager fadeCurrentSound:completion:](self, "fadeCurrentSound:completion:", 0, *(void *)&a4, v5);
    return;
  }
  if ((a3 | 2) == 7 && (a4 - 3) <= 1)
  {
    int v6 = [(BKUIPearlAudioSession *)self->_audioSession audioEngine];
    v7 = [v6 mainMixerNode];
    LODWORD(v8) = 1.0;
    [v7 setOutputVolume:v8];

    audioSession = self->_audioSession;
    v10 = [(BKUIPearlAudioSession *)audioSession lockSoundBuffer];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke;
    v24[3] = &unk_1E6EA20C0;
    v24[4] = self;
    [(BKUIPearlAudioSession *)audioSession scheduleBuffer:v10 completionHandler:v24];

    double v11 = 413.0;
LABEL_16:
    [(BKUIPearlEnrollAudioManager *)self playHaptic:20310 withDelay:v11];
    return;
  }
  if (a3 == 6 && a4 == 5)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_2;
    v23[3] = &unk_1E6EA20C0;
    v23[4] = self;
    double v12 = 10.0;
    v13 = v23;
LABEL_12:
    [(BKUIPearlEnrollAudioManager *)self fadeCurrentSound:v13 completion:v12];
    return;
  }
  if (a3 == 7 && a4 == 6)
  {
    dispatch_time_t v14 = dispatch_time(0, 483000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_3;
    block[3] = &unk_1E6EA20C0;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x1E4F14428], block);
    double v11 = 483.0;
    goto LABEL_16;
  }
  if (a3 == 8 && a4 == 7)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_4;
    v21[3] = &unk_1E6EA20C0;
    v21[4] = self;
    double v12 = 10.0;
    v13 = v21;
    goto LABEL_12;
  }
  if (a3 == 9)
  {
LABEL_22:
    double v5 = 10.0;
    goto LABEL_3;
  }
  BOOL v15 = a3 == 5 || a3 == 7;
  if (!v15 || a4 != 9)
  {
    if (a3 != 3 || (a4 | 2) != 7) {
      return;
    }
    goto LABEL_22;
  }
  v16 = [(BKUIPearlAudioSession *)self->_audioSession audioEngine];
  v17 = [v16 mainMixerNode];
  LODWORD(v18) = 1.0;
  [v17 setOutputVolume:v18];

  v19 = self->_audioSession;
  id v20 = [(BKUIPearlAudioSession *)v19 scanSoundBuffer];
  [(BKUIPearlAudioSession *)v19 scheduleBuffer:v20 atTime:0 options:3 completionHandler:0];
}

uint64_t __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 scanSoundBuffer];
  [v2 scheduleBuffer:v3 atTime:0 options:3 completionHandler:0];

  BOOL v4 = *(void **)(a1 + 32);

  return [v4 playHaptic:20310 withDelay:0.0];
}

uint64_t __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) audioEngine];
  uint64_t v3 = [v2 mainMixerNode];
  LODWORD(v4) = 1.0;
  [v3 setOutputVolume:v4];

  double v5 = *(void **)(*(void *)(a1 + 32) + 8);
  int v6 = [v5 endSoundBuffer];
  [v5 scheduleBuffer:v6 atTime:0 options:2 completionHandler:0];

  v7 = *(void **)(a1 + 32);

  return [v7 playHaptic:20310 withDelay:135.0];
}

void __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateDelegate];
  int v3 = [v2 state];

  if (v3 == 7)
  {
    double v4 = *(void **)(*(void *)(a1 + 32) + 8);
    id v5 = [v4 scanSoundBuffer];
    [v4 scheduleBuffer:v5 atTime:0 options:3 completionHandler:0];
  }
}

uint64_t __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) audioEngine];
  int v3 = [v2 mainMixerNode];
  LODWORD(v4) = 1.0;
  [v3 setOutputVolume:v4];

  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  int v6 = [v5 completeSoundBuffer];
  [v5 scheduleBuffer:v6 atTime:0 options:2 completionHandler:0];

  v7 = *(void **)(a1 + 32);

  return [v7 playHaptic:20310 withDelay:131.0];
}

- (void)triggerSoundHapticForTransitionToSubstate:(int)a3 fromSubstate:(int)a4
{
  if (a4)
  {
    if (a3 == 11 || !a3)
    {
      id v5 = [(BKUIPearlEnrollAudioManager *)self stateDelegate];
      if ([v5 state] == 5)
      {
      }
      else
      {
        int v6 = [(BKUIPearlEnrollAudioManager *)self stateDelegate];
        int v7 = [v6 state];

        if (v7 != 7) {
          return;
        }
      }
      audioSession = self->_audioSession;
      int v9 = [(BKUIPearlAudioSession *)audioSession scanSoundBuffer];
      [(BKUIPearlAudioSession *)audioSession scheduleBuffer:v9 atTime:0 options:3 completionHandler:0];

      [(BKUIPearlEnrollAudioManager *)self playHaptic:20310 withDelay:0.0];
    }
  }
  else if (a3 <= 9 && ((1 << a3) & 0x396) != 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToSubstate_fromSubstate___block_invoke;
    v10[3] = &unk_1E6EA20C0;
    v10[4] = self;
    [(BKUIPearlEnrollAudioManager *)self fadeCurrentSound:v10 completion:10.0];
  }
}

void __86__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToSubstate_fromSubstate___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) audioEngine];
  int v3 = [v2 mainMixerNode];
  LODWORD(v4) = 1.0;
  [v3 setOutputVolume:v4];

  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  int v6 = [v5 failSoundBuffer];
  [v5 scheduleBuffer:v6 atTime:0 options:2 completionHandler:0];

  int v7 = *(void **)(a1 + 32);
  double v8 = [v7 hapticEventWithEventType:26454 withDelay:12.0];
  int v9 = objc_msgSend(*(id *)(a1 + 32), "hapticEventWithEventType:withDelay:", 20310, 134.0, v8);
  v12[1] = v9;
  v10 = [*(id *)(a1 + 32) hapticEventWithEventType:20311 withDelay:239.0];
  v12[2] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  [v7 playHapticWithEvents:v11];
}

- (void)playHaptic:(unint64_t)a3 withDelay:(double)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(BKUIPearlEnrollAudioManager *)self hapticEventWithEventType:a3 withDelay:a4];
  v7[0] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(BKUIPearlEnrollAudioManager *)self playHapticWithEvents:v6];
}

- (id)hapticEventWithEventType:(unint64_t)a3 withDelay:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v7 = [(BKUIPearlEnrollAudioManager *)self hapticsEngine];

  if (!v7)
  {
    double v8 = [(BKUIPearlEnrollAudioManager *)self createEngine];
    [(BKUIPearlEnrollAudioManager *)self setHapticsEngine:v8];
  }
  double v9 = 0.598999977;
  if ((uint64_t)a3 > 20310)
  {
    switch(a3)
    {
      case 0x4F57uLL:
        goto LABEL_12;
      case 0x6756uLL:
        double v9 = 1.0;
        break;
      case 0x6757uLL:
        break;
      default:
        goto LABEL_11;
    }
    double v10 = 0.779999971;
  }
  else
  {
    switch(a3)
    {
      case 0x2B57uLL:
        double v10 = 0.0500000007;
        break;
      case 0x4357uLL:
        double v10 = 0.319999993;
        break;
      case 0x4F56uLL:
        double v9 = 1.0;
LABEL_12:
        double v10 = 0.409999996;
        break;
      default:
LABEL_11:
        -[BKUIPearlEnrollAudioManager hapticEventWithEventType:withDelay:]();
    }
  }
  double v11 = _BKUILoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v25 = v9;
    __int16 v26 = 2048;
    double v27 = v10;
    _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Created Haptic event with intensity %f sharpness %f", buf, 0x16u);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F1DF78]);
  *(float *)&double v13 = v9;
  dispatch_time_t v14 = (void *)[v12 initWithParameterID:*MEMORY[0x1E4F1DEE8] value:v13];
  id v15 = objc_alloc(MEMORY[0x1E4F1DF78]);
  *(float *)&double v16 = v10;
  v17 = (void *)[v15 initWithParameterID:*MEMORY[0x1E4F1DEF0] value:v16];
  id v18 = objc_alloc(MEMORY[0x1E4F1DF70]);
  uint64_t v19 = *MEMORY[0x1E4F1DF08];
  v23[0] = v14;
  v23[1] = v17;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v21 = (void *)[v18 initWithEventType:v19 parameters:v20 relativeTime:a4 / 1000.0];

  return v21;
}

- (void)playHapticWithEvents:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v4 = (objc_class *)MEMORY[0x1E4F1DF90];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v20 = 0;
  int v7 = (void *)[v6 initWithEvents:v5 parameters:MEMORY[0x1E4F1CBF0] error:&v20];

  double v8 = v20;
  if (!v8)
  {
    double v10 = [(BKUIPearlEnrollAudioManager *)self hapticsEngine];
    id v19 = 0;
    [v10 startAndReturnError:&v19];
    double v9 = v19;

    if (v9)
    {
      double v11 = _BKUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Unable to start Haptic Engine %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    id v12 = [(BKUIPearlEnrollAudioManager *)self hapticsEngine];
    id v18 = 0;
    double v11 = [v12 createPlayerWithPattern:v7 error:&v18];
    double v13 = v18;

    if (v13)
    {
      dispatch_time_t v14 = _BKUILoggingFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        id v15 = "Unable to create CHHapticPatternPlayer error: %@";
LABEL_13:
        _os_log_impl(&dword_1E4B6C000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else
    {
      id v17 = 0;
      [v11 startAtTime:&v17 error:0.0];
      double v16 = v17;
      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      double v13 = v16;
      dispatch_time_t v14 = _BKUILoggingFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        id v15 = "Unable to create start HapticsPlayer error: %@";
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  double v9 = _BKUILoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_1E4B6C000, v9, OS_LOG_TYPE_DEFAULT, "Unable to create CHHapticPattern error: %@", buf, 0xCu);
  }
LABEL_16:
}

- (id)createEngine
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1DF60] capabilitiesForHardware];
  if ([v2 supportsHaptics] & 1) != 0 || (objc_msgSend(v2, "supportsAudio"))
  {
    id v9 = 0;
    int v3 = [objc_alloc(MEMORY[0x1E4F1DF60]) initAndReturnError:&v9];
    double v4 = v9;
    [v3 setMuteHapticsWhileRecordingAudio:0];
    [v3 setAutoShutdownEnabled:1];
    id v5 = _BKUILoggingFacility();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v3 || v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        double v11 = v4;
        _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Could not create CHHapticEngine: %@", buf, 0xCu);
      }

      int v7 = 0;
    }
    else
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        double v11 = v3;
        _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Created CHHapticEngine %@", buf, 0xCu);
      }

      int v7 = v3;
    }
  }
  else
  {
    double v4 = _BKUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Haptics and audio not supported", buf, 2u);
    }
    int v7 = 0;
  }

  return v7;
}

- (void)fadeCurrentSound:(double)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  int v7 = dispatch_get_global_queue(2, 0);
  double v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);

  dispatch_source_set_timer(v8, 0, 0xF4240uLL, 0);
  CFTimeInterval v9 = CACurrentMediaTime();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__BKUIPearlEnrollAudioManager_fadeCurrentSound_completion___block_invoke;
  v12[3] = &unk_1E6EA3190;
  *(double *)&v15[1] = v9 * 1000.0;
  objc_copyWeak(v15, &location);
  v15[2] = *(id *)&a3;
  double v13 = v8;
  id v14 = v6;
  id v10 = v6;
  double v11 = v8;
  dispatch_source_set_event_handler(v11, v12);
  dispatch_resume(v11);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __59__BKUIPearlEnrollAudioManager_fadeCurrentSound_completion___block_invoke(uint64_t a1)
{
  double v2 = -(*(double *)(a1 + 56) - CACurrentMediaTime() * 1000.0);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  double v4 = fmax(fmin(v2 / *(double *)(a1 + 64), 1.0), 0.0);
  CFTimeInterval v9 = WeakRetained;
  id v5 = [WeakRetained[1] audioEngine];
  id v6 = [v5 mainMixerNode];
  *(float *)&double v2 = 1.0 - v4;
  LODWORD(v7) = LODWORD(v2);
  [v6 setOutputVolume:v7];

  if (v4 >= 1.0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
  }
}

- (void)dealloc
{
  [(BKUIPearlEnrollAudioManager *)self cleanupHaptics];
  [(BKUIPearlAudioSession *)self->_audioSession stop];
  int v3 = [(BKUIPearlAudioSession *)self->_audioSession audioEngine];
  [v3 stop];

  double v4 = [(BKUIPearlAudioSession *)self->_audioSession audioEngine];
  [v4 reset];

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollAudioManager;
  [(BKUIPearlEnrollAudioManager *)&v5 dealloc];
}

- (BKUIPearlEnrollControllerPreloadedState)preloadedState
{
  return self->_preloadedState;
}

- (void)setPreloadedState:(id)a3
{
}

- (BKUIPearlAudioStateDelegate)stateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateDelegate);

  return (BKUIPearlAudioStateDelegate *)WeakRetained;
}

- (void)setStateDelegate:(id)a3
{
}

- (CHHapticEngine)hapticsEngine
{
  return self->_hapticsEngine;
}

- (void)setHapticsEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticsEngine, 0);
  objc_destroyWeak((id *)&self->_stateDelegate);
  objc_storeStrong((id *)&self->_preloadedState, 0);

  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (void)hapticEventWithEventType:withDelay:.cold.1()
{
}

@end