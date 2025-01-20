@interface HPSSpatialProfileSingleStepSoundHapticManager
- (BOOL)isEnrollGuidancePlaying;
- (HPSSpatialProfileSingleStepSoundHapticManager)init;
- (id)createPlayerWithFileName:(id)a3;
- (void)pauseEnrollGuidancePlayer;
- (void)pauseProgressPlayer;
- (void)playEnrollGuidance:(int)a3;
- (void)playProgressPlayer:(int)a3;
- (void)readDynamicEnrollmentFeedback;
- (void)setEnrollGuidancePitch:(float)a3;
- (void)setProgressPlayerPitch:(float)a3;
- (void)setupPlayers;
- (void)start;
- (void)startEnrollLoop;
- (void)stop;
- (void)stopEnrollLoop;
- (void)triggerSoundHapticForEarCaptureState:(int)a3 completion:(id)a4;
- (void)triggerSoundHapticForEnrollmentState:(int)a3 completion:(id)a4;
- (void)updateEnrollLoopVolume:(double)a3;
@end

@implementation HPSSpatialProfileSingleStepSoundHapticManager

- (HPSSpatialProfileSingleStepSoundHapticManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)HPSSpatialProfileSingleStepSoundHapticManager;
  v2 = [(HPSSpatialProfileSingleStepSoundHapticManager *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1DF60]);
    v4 = [MEMORY[0x1E4F153E0] sharedInstance];
    uint64_t v5 = [v3 initWithAudioSession:v4 error:0];
    engine = v2->_engine;
    v2->_engine = (CHHapticEngine *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.HeadphoneSettings.soundHapticSerialQueue", 0);
    soundHapticSerialQueue = v2->_soundHapticSerialQueue;
    v2->_soundHapticSerialQueue = (OS_dispatch_queue *)v7;

    [(HPSSpatialProfileSingleStepSoundHapticManager *)v2 readDynamicEnrollmentFeedback];
  }
  return v2;
}

- (void)start
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Start Engine", buf, 2u);
  }

  [(HPSSpatialProfileSingleStepSoundHapticManager *)self setupPlayers];
  engine = self->_engine;
  id v7 = 0;
  [(CHHapticEngine *)engine startAndReturnError:&v7];
  id v5 = v7;
  if (v5)
  {
    v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager start]();
    }
  }
}

- (void)stop
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Stop Engine", v4, 2u);
  }

  [(CHHapticEngine *)self->_engine stopWithCompletionHandler:&__block_literal_global_0];
}

void __53__HPSSpatialProfileSingleStepSoundHapticManager_stop__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)setupPlayers
{
  id v3 = [(HPSSpatialProfileSingleStepSoundHapticManager *)self createPlayerWithFileName:@"Spatial_Profile_Scan_Lock"];
  scanLockPlayer = self->_scanLockPlayer;
  self->_scanLockPlayer = v3;

  id v5 = [(HPSSpatialProfileSingleStepSoundHapticManager *)self createPlayerWithFileName:@"Spatial_Profile_Scan_In_Progress"];
  scanInProgressPlayer = self->_scanInProgressPlayer;
  self->_scanInProgressPlayer = v5;

  id v7 = [(HPSSpatialProfileSingleStepSoundHapticManager *)self createPlayerWithFileName:@"Spatial_Profile_Scan_Orient_User"];
  enrollGuidancePlayer = self->_enrollGuidancePlayer;
  self->_enrollGuidancePlayer = v7;

  v9 = [(HPSSpatialProfileSingleStepSoundHapticManager *)self createPlayerWithFileName:@"Spatial_Profile_Single_Step_First_Ear_Completed"];
  enrollmentHalfDonePlayer = self->_enrollmentHalfDonePlayer;
  self->_enrollmentHalfDonePlayer = v9;

  v11 = [(HPSSpatialProfileSingleStepSoundHapticManager *)self createPlayerWithFileName:@"Spatial_Profile_Single_Step_Second_Ear_Completed"];
  scanCompletedPlayer = self->_scanCompletedPlayer;
  self->_scanCompletedPlayer = v11;

  v13 = [(HPSSpatialProfileSingleStepSoundHapticManager *)self createPlayerWithFileName:@"Spatial_Profile_Scan_Error"];
  scanErrorPlayer = self->_scanErrorPlayer;
  self->_scanErrorPlayer = v13;

  v15 = [(HPSSpatialProfileSingleStepSoundHapticManager *)self createPlayerWithFileName:@"Spatial_Profile_Single_Step_Scan_Completed"];
  enrollmentCompletedPlayer = self->_enrollmentCompletedPlayer;
  self->_enrollmentCompletedPlayer = v15;

  v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v18 = [v17 URLForResource:@"tonal_loop" withExtension:@"wav"];

  NSLog(&cfstr_PathToPlay.isa, v18);
  id v24 = 0;
  v19 = (AVAudioPlayer *)[objc_alloc(MEMORY[0x1E4F153C0]) initWithContentsOfURL:v18 error:&v24];
  id v20 = v24;
  enrollLooplayer = self->_enrollLooplayer;
  self->_enrollLooplayer = v19;

  if (v20)
  {
    v22 = [v20 localizedDescription];
    NSLog(&cfstr_FailedWithReas.isa, v22);
  }
  else
  {
    [(AVAudioPlayer *)self->_enrollLooplayer setDelegate:self];
    [(AVAudioPlayer *)self->_enrollLooplayer setNumberOfLoops:-1];
    [(AVAudioPlayer *)self->_enrollLooplayer setCurrentTime:0.0];
    LODWORD(v23) = 1028443341;
    [(AVAudioPlayer *)self->_enrollLooplayer setVolume:v23];
  }
}

- (void)setEnrollGuidancePitch:(float)a3
{
  enrollGuidancePlayer = self->_enrollGuidancePlayer;
  if (enrollGuidancePlayer)
  {
    if (self->_dynamicEnrollmentFeedback) {
      -[CHHapticAdvancedPatternPlayer setPlaybackRate:](enrollGuidancePlayer, "setPlaybackRate:");
    }
  }
}

- (BOOL)isEnrollGuidancePlaying
{
  enrollGuidancePlayer = self->_enrollGuidancePlayer;
  if (enrollGuidancePlayer) {
    LOBYTE(enrollGuidancePlayer) = [(CHHapticAdvancedPatternPlayer *)enrollGuidancePlayer loopEnabled];
  }
  return (char)enrollGuidancePlayer;
}

- (void)pauseEnrollGuidancePlayer
{
  if (self->_dynamicEnrollmentFeedback)
  {
    enrollGuidancePlayer = self->_enrollGuidancePlayer;
    if (enrollGuidancePlayer)
    {
      id v6 = 0;
      [(CHHapticAdvancedPatternPlayer *)enrollGuidancePlayer stopAtTime:&v6 error:0.0];
      id v4 = v6;
      [(CHHapticAdvancedPatternPlayer *)self->_enrollGuidancePlayer setLoopEnabled:0];
      if (v4)
      {
        id v5 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer]();
        }
      }
    }
  }
}

- (void)playEnrollGuidance:(int)a3
{
  if (self->_dynamicEnrollmentFeedback && (a3 == 11 || a3 == 7))
  {
    enrollGuidancePlayer = self->_enrollGuidancePlayer;
    if (enrollGuidancePlayer)
    {
      if (([(CHHapticAdvancedPatternPlayer *)enrollGuidancePlayer loopEnabled] & 1) == 0)
      {
        [(CHHapticAdvancedPatternPlayer *)self->_enrollGuidancePlayer setLoopEnabled:1];
        LODWORD(v5) = 0.5;
        [(CHHapticAdvancedPatternPlayer *)self->_enrollGuidancePlayer setPlaybackRate:v5];
        id v6 = self->_enrollGuidancePlayer;
        id v10 = 0;
        [(CHHapticAdvancedPatternPlayer *)v6 startAtTime:&v10 error:0.0];
        id v7 = v10;
        if (v7)
        {
          v8 = v7;
          v9 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[HPSSpatialProfileSoundHapticManager playEnrollGuidance:]();
          }
        }
      }
    }
  }
}

- (void)setProgressPlayerPitch:(float)a3
{
  scanInProgressPlayer = self->_scanInProgressPlayer;
  if (scanInProgressPlayer) {
    -[CHHapticAdvancedPatternPlayer setPlaybackRate:](scanInProgressPlayer, "setPlaybackRate:");
  }
}

- (void)pauseProgressPlayer
{
  scanInProgressPlayer = self->_scanInProgressPlayer;
  if (scanInProgressPlayer)
  {
    id v6 = 0;
    [(CHHapticAdvancedPatternPlayer *)scanInProgressPlayer stopAtTime:&v6 error:0.0];
    id v3 = v6;
    if (v3)
    {
      id v4 = v3;
      double v5 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer]();
      }
    }
  }
}

- (void)playProgressPlayer:(int)a3
{
  if (a3 == 11 || a3 == 7)
  {
    scanInProgressPlayer = self->_scanInProgressPlayer;
    if (scanInProgressPlayer)
    {
      [(CHHapticAdvancedPatternPlayer *)scanInProgressPlayer setLoopEnabled:1];
      LODWORD(v5) = 1.0;
      [(CHHapticAdvancedPatternPlayer *)self->_scanInProgressPlayer setPlaybackRate:v5];
      id v6 = self->_scanInProgressPlayer;
      id v10 = 0;
      [(CHHapticAdvancedPatternPlayer *)v6 startAtTime:&v10 error:0.0];
      id v7 = v10;
      if (v7)
      {
        v8 = v7;
        v9 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[HPSSpatialProfileSoundHapticManager playEnrollGuidance:]();
        }
      }
    }
  }
}

- (id)createPlayerWithFileName:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  id v7 = [v6 URLForResource:v5 withExtension:@"ahap"];

  id v17 = 0;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1DF90]) initWithContentsOfURL:v7 error:&v17];
  id v9 = v17;
  if (v9)
  {
    id v10 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:]();
    }
  }
  engine = self->_engine;
  id v16 = 0;
  v12 = [(CHHapticEngine *)engine createAdvancedPlayerWithPattern:v8 error:&v16];
  id v13 = v16;
  if (v13)
  {
    v14 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:]();
    }
  }

  return v12;
}

- (void)triggerSoundHapticForEnrollmentState:(int)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  dispatch_group_t v7 = dispatch_group_create();
  v8 = [MEMORY[0x1E4F153E0] sharedInstance];
  uint64_t v9 = *MEMORY[0x1E4F14F98];
  id v41 = 0;
  [v8 setCategory:v9 error:&v41];
  id v10 = v41;

  if (v10)
  {
    v11 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEnrollmentState:completion:]();
    }
  }
  switch(a3)
  {
    case 3:
      v12 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEnrollmentState:completion:](v12);
      }

      soundHapticSerialQueue = self->_soundHapticSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_63;
      block[3] = &unk_1E6EA82C8;
      block[4] = self;
      v25 = v7;
      v26 = v6;
      dispatch_async(soundHapticSerialQueue, block);

      v14 = v25;
      goto LABEL_27;
    case 6:
      scanInProgressPlayer = self->_scanInProgressPlayer;
      id v40 = v10;
      [(CHHapticAdvancedPatternPlayer *)scanInProgressPlayer stopAtTime:&v40 error:0.0];
      id v16 = v40;

      if (v16)
      {
        id v17 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer]();
        }
      }
      if (v6) {
        v6[2](v6);
      }
      id v10 = v16;
      break;
    case 7:
      v18 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Start", buf, 2u);
      }

      v19 = self->_soundHapticSerialQueue;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke;
      v34[3] = &unk_1E6EA82A0;
      v35 = v7;
      v36 = self;
      int v38 = 7;
      v37 = v6;
      dispatch_async(v19, v34);

      v14 = v35;
      goto LABEL_27;
    case 8:
      id v20 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
      }

      v21 = self->_soundHapticSerialQueue;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_51;
      v31[3] = &unk_1E6EA82C8;
      v31[4] = self;
      v32 = v7;
      v33 = v6;
      dispatch_async(v21, v31);

      v14 = v32;
      goto LABEL_27;
    case 12:
      v22 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Enrollment Completed", buf, 2u);
      }

      double v23 = self->_soundHapticSerialQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_57;
      v27[3] = &unk_1E6EA82C8;
      v28 = v7;
      v29 = self;
      v30 = v6;
      dispatch_async(v23, v27);

      v14 = v28;
LABEL_27:

      break;
    default:
      if (v6) {
        v6[2](v6);
      }
      break;
  }
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2;
  v15[3] = &unk_1E6EA8250;
  id v16 = *(id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 16) setCompletionHandler:v15];
  v2 = *(void **)(*(void *)(a1 + 40) + 16);
  id v14 = 0;
  [v2 startAtTime:&v14 error:0.0];
  id v3 = v14;
  if (v3)
  {
    id v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_cold_2();
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 24) setLoopEnabled:1];
  LODWORD(v5) = 1.0;
  [*(id *)(*(void *)(a1 + 40) + 24) setPlaybackRate:v5];
  id v6 = *(void **)(*(void *)(a1 + 40) + 24);
  id v13 = v3;
  [v6 startAtTime:&v13 error:0.0];
  id v7 = v13;

  v8 = *(unsigned char **)(a1 + 40);
  if (v8[72]) {
    [v8 playEnrollGuidance:*(unsigned int *)(a1 + 56)];
  }
  if (v7)
  {
    uint64_t v9 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager playEnrollGuidance:]();
    }
  }
  id v10 = *(NSObject **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_49;
  v11[3] = &unk_1E6EA8278;
  id v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v11);
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_8.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_49(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_51(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72))
  {
    [(id)v2 pauseEnrollGuidancePlayer];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v3 = *(void **)(v2 + 24);
  id v15 = 0;
  [v3 stopAtTime:&v15 error:0.0];
  id v4 = v15;
  if (v4)
  {
    double v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer]();
    }
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_52;
  v13[3] = &unk_1E6EA8250;
  id v14 = *(id *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 48) setCompletionHandler:v13];
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  id v12 = v4;
  [v6 startAtTime:&v12 error:0.0];
  id v7 = v12;

  if (v7)
  {
    v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41_cold_1();
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_56;
  v10[3] = &unk_1E6EA8278;
  uint64_t v9 = *(NSObject **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], v10);
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_52(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_9.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_56(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_57(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_58;
  v9[3] = &unk_1E6EA8250;
  id v10 = *(id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 64) setCompletionHandler:v9];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 64);
  id v8 = 0;
  [v2 startAtTime:&v8 error:0.0];
  id v3 = v8;
  if (v3)
  {
    id v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_47_cold_1();
    }
  }
  double v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_62;
  block[3] = &unk_1E6EA8278;
  id v7 = *(id *)(a1 + 48);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_58(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_10.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_62(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_63(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v14 = 0;
  [v2 stopAtTime:&v14 error:0.0];
  id v3 = v14;
  if (v3)
  {
    id v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer]();
    }
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_64;
  v12[3] = &unk_1E6EA8250;
  id v13 = *(id *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 56) setCompletionHandler:v12];
  double v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v11 = v3;
  [v5 startAtTime:&v11 error:0.0];
  id v6 = v11;

  if (v6)
  {
    id v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_53_cold_1();
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_68;
  v9[3] = &unk_1E6EA8278;
  id v8 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], v9);
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_64(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_11.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_68(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)triggerSoundHapticForEarCaptureState:(int)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_group_t v7 = dispatch_group_create();
  id v8 = sharedBluetoothSettingsLogComponent();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
    }

    soundHapticSerialQueue = self->_soundHapticSerialQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_70;
    v17[3] = &unk_1E6EA82C8;
    v17[4] = self;
    dispatch_group_t v18 = v7;
    id v19 = v6;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(soundHapticSerialQueue, v17);

    dispatch_group_t v13 = v18;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
    }

    id v14 = self->_soundHapticSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke;
    block[3] = &unk_1E6EA82C8;
    dispatch_group_t v21 = v7;
    v22 = self;
    id v23 = v6;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v14, block);

    dispatch_group_t v13 = v21;
  }
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_2;
  v9[3] = &unk_1E6EA8250;
  id v10 = *(id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 40) setCompletionHandler:v9];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 40);
  id v8 = 0;
  [v2 startAtTime:&v8 error:0.0];
  id v3 = v8;
  if (v3)
  {
    id v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41_cold_1();
    }
  }
  double v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_69;
  block[3] = &unk_1E6EA8278;
  id v7 = *(id *)(a1 + 48);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_9.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_69(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72))
  {
    [(id)v2 pauseEnrollGuidancePlayer];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v3 = *(void **)(v2 + 24);
  id v15 = 0;
  [v3 stopAtTime:&v15 error:0.0];
  id v4 = v15;
  if (v4)
  {
    double v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer]();
    }
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_71;
  v13[3] = &unk_1E6EA8250;
  id v14 = *(id *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 48) setCompletionHandler:v13];
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  id v12 = v4;
  [v6 startAtTime:&v12 error:0.0];
  id v7 = v12;

  if (v7)
  {
    id v8 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41_cold_1();
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_72;
  v10[3] = &unk_1E6EA8278;
  BOOL v9 = *(NSObject **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], v10);
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_71(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_9.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_72(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)readDynamicEnrollmentFeedback
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DynamicEnrollmentFeedback", @"com.apple.BTServer", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  self->_dynamicEnrollmentFeedback = v5;
}

- (void)startEnrollLoop
{
  if (![(AVAudioPlayer *)self->_enrollLooplayer isPlaying])
  {
    soundHapticSerialQueue = self->_soundHapticSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__HPSSpatialProfileSingleStepSoundHapticManager_startEnrollLoop__block_invoke;
    block[3] = &unk_1E6EA82F0;
    void block[4] = self;
    dispatch_async(soundHapticSerialQueue, block);
  }
}

uint64_t __64__HPSSpatialProfileSingleStepSoundHapticManager_startEnrollLoop__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) play];
}

- (void)stopEnrollLoop
{
  soundHapticSerialQueue = self->_soundHapticSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HPSSpatialProfileSingleStepSoundHapticManager_stopEnrollLoop__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(soundHapticSerialQueue, block);
}

uint64_t __63__HPSSpatialProfileSingleStepSoundHapticManager_stopEnrollLoop__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) stop];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 88);

  return [v2 setVolume:0.0];
}

- (void)updateEnrollLoopVolume:(double)a3
{
  soundHapticSerialQueue = self->_soundHapticSerialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HPSSpatialProfileSingleStepSoundHapticManager_updateEnrollLoopVolume___block_invoke;
  v4[3] = &unk_1E6EA8318;
  v4[4] = self;
  *(double *)&v4[5] = a3 * 0.7 + 0.05;
  dispatch_async(soundHapticSerialQueue, v4);
}

uint64_t __72__HPSSpatialProfileSingleStepSoundHapticManager_updateEnrollLoopVolume___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(*(void *)(a1 + 32) + 88) setVolume:v1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollLooplayer, 0);
  objc_storeStrong((id *)&self->_soundHapticSerialQueue, 0);
  objc_storeStrong((id *)&self->_enrollmentCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_scanErrorPlayer, 0);
  objc_storeStrong((id *)&self->_scanCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_enrollmentHalfDonePlayer, 0);
  objc_storeStrong((id *)&self->_enrollGuidancePlayer, 0);
  objc_storeStrong((id *)&self->_scanInProgressPlayer, 0);
  objc_storeStrong((id *)&self->_scanLockPlayer, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

@end