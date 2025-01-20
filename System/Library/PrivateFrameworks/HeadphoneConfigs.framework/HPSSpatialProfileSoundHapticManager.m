@interface HPSSpatialProfileSoundHapticManager
- (BOOL)isEnrollGuidancePlaying;
- (HPSSpatialProfileSoundHapticManager)init;
- (id)initPlayerWithFileName:(id)a3;
- (void)pauseEnrollGuidancePlayer;
- (void)pauseProgressPlayer;
- (void)playEnrollGuidance:(int)a3;
- (void)playProgressPlayer:(int)a3;
- (void)readDynamicEnrollmentFeedback;
- (void)setEnrollGuidancePitch:(float)a3;
- (void)setProgressPlayerPitch:(float)a3;
- (void)setupPlayers;
- (void)start;
- (void)stop;
- (void)triggerSoundHapticForEarCaptureState:(int)a3 completion:(id)a4;
- (void)triggerSoundHapticForEnrollmentState:(int)a3 completion:(id)a4;
@end

@implementation HPSSpatialProfileSoundHapticManager

- (HPSSpatialProfileSoundHapticManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)HPSSpatialProfileSoundHapticManager;
  v2 = [(HPSSpatialProfileSoundHapticManager *)&v10 init];
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

    [(HPSSpatialProfileSoundHapticManager *)v2 readDynamicEnrollmentFeedback];
  }
  return v2;
}

- (void)start
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Engine Error: %@", v2, v3, v4, v5, v6);
}

- (void)stop
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Stop Engine", v4, 2u);
  }

  [(CHHapticEngine *)self->_engine stopWithCompletionHandler:&__block_literal_global];
}

void __43__HPSSpatialProfileSoundHapticManager_stop__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)setupPlayers
{
  uint64_t v2 = self;
  uint64_t v3 = [(HPSSpatialProfileSoundHapticManager *)v2 initPlayerWithFileName:@"Spatial_Profile_Scan_Lock"];
  scanLockPlayer = v2->_scanLockPlayer;
  v2->_scanLockPlayer = (CHHapticAdvancedPatternPlayer *)v3;

  uint64_t v5 = v2;
  uint64_t v6 = [(HPSSpatialProfileSoundHapticManager *)v5 initPlayerWithFileName:@"Spatial_Profile_Scan_In_Progress"];
  scanInProgressPlayer = v5->_scanInProgressPlayer;
  v5->_scanInProgressPlayer = (CHHapticAdvancedPatternPlayer *)v6;

  v8 = v5;
  uint64_t v9 = [(HPSSpatialProfileSoundHapticManager *)v8 initPlayerWithFileName:@"Spatial_Profile_Scan_Orient_User"];
  enrollGuidancePlayer = v8->_enrollGuidancePlayer;
  v8->_enrollGuidancePlayer = (CHHapticAdvancedPatternPlayer *)v9;

  v11 = v8;
  uint64_t v12 = [(HPSSpatialProfileSoundHapticManager *)v11 initPlayerWithFileName:@"Spatial_Profile_Scan_First_Tick"];
  scanFirstTickPlayer = v11->_scanFirstTickPlayer;
  v11->_scanFirstTickPlayer = (CHHapticAdvancedPatternPlayer *)v12;

  v14 = v11;
  uint64_t v15 = [(HPSSpatialProfileSoundHapticManager *)v14 initPlayerWithFileName:@"Spatial_Profile_Scan_Second_Tick"];
  scanSecondTickPlayer = v14->_scanSecondTickPlayer;
  v14->_scanSecondTickPlayer = (CHHapticAdvancedPatternPlayer *)v15;

  v17 = v14;
  uint64_t v18 = [(HPSSpatialProfileSoundHapticManager *)v17 initPlayerWithFileName:@"Spatial_Profile_Scan_Completed"];
  scanCompletedPlayer = v17->_scanCompletedPlayer;
  v17->_scanCompletedPlayer = (CHHapticAdvancedPatternPlayer *)v18;

  v20 = v17;
  uint64_t v21 = [(HPSSpatialProfileSoundHapticManager *)v20 initPlayerWithFileName:@"Spatial_Profile_Scan_Error"];
  scanErrorPlayer = v20->_scanErrorPlayer;
  v20->_scanErrorPlayer = (CHHapticAdvancedPatternPlayer *)v21;

  v23 = v20;
  v23->_enrollmentCompletedPlayer = (CHHapticAdvancedPatternPlayer *)[(HPSSpatialProfileSoundHapticManager *)v23 initPlayerWithFileName:@"Spatial_Profile_Enrollment_Completed"];

  MEMORY[0x1F41817F8]();
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
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Stop Scan In Progress Player Error: %@", v2, v3, v4, v5, v6);
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
        uint8_t v6 = self->_enrollGuidancePlayer;
        id v10 = 0;
        [(CHHapticAdvancedPatternPlayer *)v6 startAtTime:&v10 error:0.0];
        id v7 = v10;
        if (v7)
        {
          v8 = v7;
          uint64_t v9 = sharedBluetoothSettingsLogComponent();
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
      uint64_t v4 = v3;
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
        uint64_t v9 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[HPSSpatialProfileSoundHapticManager playEnrollGuidance:]();
        }
      }
    }
  }
}

- (id)initPlayerWithFileName:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B50];
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
  uint64_t v12 = [(CHHapticEngine *)engine createAdvancedPlayerWithPattern:v8 error:&v16];
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
    case 2:
      scanInProgressPlayer = self->_scanInProgressPlayer;
      id v40 = v10;
      [(CHHapticAdvancedPatternPlayer *)scanInProgressPlayer stopAtTime:&v40 error:0.0];
      id v20 = v40;

      if (v20)
      {
        uint64_t v21 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer]();
        }
      }
      if (v6) {
        v6[2](v6);
      }
      id v10 = v20;
      break;
    case 3:
    case 7:
    case 11:
      uint64_t v12 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Start", buf, 2u);
      }

      soundHapticSerialQueue = self->_soundHapticSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke;
      block[3] = &unk_1E6EA82A0;
      v35 = v7;
      v36 = self;
      int v38 = a3;
      v37 = v6;
      dispatch_async(soundHapticSerialQueue, block);

      v14 = v35;
      goto LABEL_27;
    case 4:
    case 8:
    case 12:
      uint64_t v15 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
      }

      id v16 = self->_soundHapticSerialQueue;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41;
      v31[3] = &unk_1E6EA82C8;
      v31[4] = self;
      v32 = v7;
      v33 = v6;
      dispatch_async(v16, v31);

      v14 = v32;
      goto LABEL_27;
    case 16:
      v22 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Enrollment Completed", buf, 2u);
      }

      v23 = self->_soundHapticSerialQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_47;
      v27[3] = &unk_1E6EA82C8;
      v28 = v7;
      v29 = self;
      v30 = v6;
      dispatch_async(v23, v27);

      v14 = v28;
      goto LABEL_27;
    case 17:
    case 18:
    case 19:
      id v17 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEnrollmentState:completion:](v17);
      }

      uint64_t v18 = self->_soundHapticSerialQueue;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_53;
      v24[3] = &unk_1E6EA82C8;
      v24[4] = self;
      v25 = v7;
      v26 = v6;
      dispatch_async(v18, v24);

      v14 = v25;
LABEL_27:

      break;
    default:
      if (v6) {
        v6[2](v6);
      }
      break;
  }
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2;
  v15[3] = &unk_1E6EA8250;
  id v16 = *(id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 16) setCompletionHandler:v15];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 16);
  id v14 = 0;
  [v2 startAtTime:&v14 error:0.0];
  id v3 = v14;
  if (v3)
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
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
  if (v8[80]) {
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
  v11[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_39;
  v11[3] = &unk_1E6EA8278;
  id v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v11);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_8.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 80))
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
  v13[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_42;
  v13[3] = &unk_1E6EA8250;
  id v14 = *(id *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 56) setCompletionHandler:v13];
  id v6 = *(void **)(*(void *)(a1 + 32) + 56);
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
  v10[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_46;
  v10[3] = &unk_1E6EA8278;
  uint64_t v9 = *(NSObject **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], v10);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_42(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_9.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_47(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_48;
  v9[3] = &unk_1E6EA8250;
  id v10 = *(id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 72) setCompletionHandler:v9];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 72);
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
  block[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_52;
  block[3] = &unk_1E6EA8278;
  id v7 = *(id *)(a1 + 48);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_48(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_10.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_52(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_53(uint64_t a1)
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
  v12[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_54;
  v12[3] = &unk_1E6EA8250;
  id v13 = *(id *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 64) setCompletionHandler:v12];
  double v5 = *(void **)(*(void *)(a1 + 32) + 64);
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
  v9[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_58;
  v9[3] = &unk_1E6EA8278;
  id v8 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], v9);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_54(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_11.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_58(uint64_t a1)
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
  id v7 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v7 setCategory:*MEMORY[0x1E4F14F98] error:0];

  dispatch_group_t v8 = dispatch_group_create();
  soundHapticSerialQueue = self->_soundHapticSerialQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke;
  v12[3] = &unk_1E6EA82A0;
  int v16 = a3;
  dispatch_group_t v13 = v8;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(soundHapticSerialQueue, v12);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 1)
  {
    id v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Ear Progress Second", buf, 2u);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_64;
    v18[3] = &unk_1E6EA8250;
    id v4 = &v19;
    id v19 = *(id *)(a1 + 32);
    [*(id *)(*(void *)(a1 + 40) + 48) setCompletionHandler:v18];
    dispatch_group_t v13 = *(void **)(*(void *)(a1 + 40) + 48);
    id v17 = 0;
    [v13 startAtTime:&v17 error:0.0];
    id v6 = v17;
    if (v6)
    {
      id v14 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_2();
      }
    }
    dispatch_group_t v8 = *(NSObject **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_68;
    v15[3] = &unk_1E6EA8278;
    uint64_t v9 = &v16;
    id v16 = *(id *)(a1 + 48);
    id v10 = MEMORY[0x1E4F14428];
    id v11 = v15;
  }
  else
  {
    if (v2) {
      return;
    }
    id v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Ear Progress First", buf, 2u);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_59;
    v23[3] = &unk_1E6EA8250;
    id v4 = &v24;
    id v24 = *(id *)(a1 + 32);
    [*(id *)(*(void *)(a1 + 40) + 40) setCompletionHandler:v23];
    double v5 = *(void **)(*(void *)(a1 + 40) + 40);
    id v22 = 0;
    [v5 startAtTime:&v22 error:0.0];
    id v6 = v22;
    if (v6)
    {
      id v7 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_1();
      }
    }
    dispatch_group_t v8 = *(NSObject **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_63;
    v20[3] = &unk_1E6EA8278;
    uint64_t v9 = &v21;
    id v21 = *(id *)(a1 + 48);
    id v10 = MEMORY[0x1E4F14428];
    id v11 = v20;
  }
  dispatch_group_notify(v8, v10, v11);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_59(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_12.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_63(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_64(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_SpatialProfile_13.isa, a2);
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_68(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundHapticSerialQueue, 0);
  objc_storeStrong((id *)&self->_enrollmentCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_scanErrorPlayer, 0);
  objc_storeStrong((id *)&self->_scanCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_scanSecondTickPlayer, 0);
  objc_storeStrong((id *)&self->_scanFirstTickPlayer, 0);
  objc_storeStrong((id *)&self->_enrollGuidancePlayer, 0);
  objc_storeStrong((id *)&self->_scanInProgressPlayer, 0);
  objc_storeStrong((id *)&self->_scanLockPlayer, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)playEnrollGuidance:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan In Progress Player Error: %@", v2, v3, v4, v5, v6);
}

- (void)initPlayerWithFileName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Create Pattern Player Error: %@", v2, v3, v4, v5, v6);
}

- (void)initPlayerWithFileName:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Create Pattern Error: %@", v2, v3, v4, v5, v6);
}

- (void)triggerSoundHapticForEnrollmentState:(os_log_t)log completion:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E4BFE000, log, OS_LOG_TYPE_ERROR, "Spatial Profile: Sound & Haptics: Scan Error", v1, 2u);
}

- (void)triggerSoundHapticForEnrollmentState:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Set Category Error: %@", v2, v3, v4, v5, v6);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Lock Player Error: %@", v2, v3, v4, v5, v6);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Completed Player Error: %@", v2, v3, v4, v5, v6);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Enrollment Completed Player Error: %@", v2, v3, v4, v5, v6);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Error Player Error: %@", v2, v3, v4, v5, v6);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan First Tick Player Error: %@", v2, v3, v4, v5, v6);
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Second Tick Player Error: %@", v2, v3, v4, v5, v6);
}

@end