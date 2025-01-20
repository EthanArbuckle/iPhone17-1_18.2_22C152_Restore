@interface AXMHapticComponent
+ (BOOL)isSupported;
- (AXMHapticComponent)init;
- (BOOL)canHandleRequest:(id)a3;
- (BOOL)isAutoShutdownEnabled;
- (BOOL)usesHapticsOnly;
- (CHHapticPatternPlayer)_levelPlayer;
- (double)autoShutdownTimeout;
- (void)handleRequest:(id)a3 completion:(id)a4;
- (void)setAutoShutdownEnabled:(BOOL)a3;
- (void)setAutoShutdownTimeout:(double)a3;
- (void)setUsesHapticsOnly:(BOOL)a3;
- (void)set_levelPlayer:(id)a3;
- (void)transitionToState:(int64_t)a3 completion:(id)a4;
@end

@implementation AXMHapticComponent

- (AXMHapticComponent)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXMHapticComponent;
  v2 = [(AXMOutputComponent *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("AXMHapticComponent", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x1E4F1DF60] capabilitiesForHardware];
  char v3 = [v2 supportsHaptics];

  return v3;
}

- (double)autoShutdownTimeout
{
  return self->_autoShutdownTimeout;
}

- (void)setAutoShutdownTimeout:(double)a3
{
  self->_autoShutdownTimeout = a3;
  if (a3 >= 0.0) {
    [(CHHapticEngine *)self->_engine setAutoShutdownTimeout:"setAutoShutdownTimeout:"];
  }
}

- (BOOL)usesHapticsOnly
{
  return self->_usesHapticsOnly;
}

- (void)setUsesHapticsOnly:(BOOL)a3
{
  self->_usesHapticsOnly = a3;
  -[CHHapticEngine setPlaysHapticsOnly:](self->_engine, "setPlaysHapticsOnly:");
}

- (void)transitionToState:(int64_t)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [(AXMOutputComponent *)self componentState];
  if (a3 != 2 || v7)
  {
    v19 = AXMediaLogHaptics();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AXMSoundComponent transitionToState:completion:](self, a3, v19);
    }

    v21.receiver = self;
    v21.super_class = (Class)AXMHapticComponent;
    [(AXMOutputComponent *)&v21 transitionToState:a3 completion:v6];
  }
  else
  {
    id v24 = 0;
    v8 = (CHHapticEngine *)[objc_alloc(MEMORY[0x1E4F1DF60]) initWithAudioSession:0 sessionIsShared:0 error:&v24];
    id v9 = v24;
    engine = self->_engine;
    self->_engine = v8;

    [(CHHapticEngine *)self->_engine setAutoShutdownEnabled:[(AXMHapticComponent *)self isAutoShutdownEnabled]];
    if (self->_autoShutdownTimeout >= 0.0) {
      [(CHHapticEngine *)self->_engine setAutoShutdownTimeout:"setAutoShutdownTimeout:"];
    }
    [(CHHapticEngine *)self->_engine setPlaysHapticsOnly:self->_usesHapticsOnly];
    v11 = [MEMORY[0x1E4F1DF60] capabilitiesForHardware];
    self->_supportsHaptics = [v11 supportsHaptics];
    self->_supportsAudio = [v11 supportsAudio];
    v12 = AXMediaLogHaptics();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_engine;
      id v20 = v9;
      v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CHHapticEngine isAutoShutdownEnabled](v13, "isAutoShutdownEnabled"));
      v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "supportsHaptics"));
      v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "supportsAudio"));
      v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CHHapticEngine playsHapticsOnly](self->_engine, "playsHapticsOnly"));
      *(_DWORD *)buf = 138413314;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      __int16 v29 = 2112;
      v30 = v15;
      __int16 v31 = 2112;
      v32 = v16;
      __int16 v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1B57D5000, v12, OS_LOG_TYPE_DEFAULT, "Creating haptic engine %@. Auto-shutdown enabled: %@. Supports haptics: %@. Supports audio: %@. Plays Haptics Only: %@", buf, 0x34u);

      id v9 = v20;
    }

    if (v9)
    {
      v18 = AXMediaLogHaptics();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AXMHapticComponent transitionToState:completion:]();
      }

      v23.receiver = self;
      v23.super_class = (Class)AXMHapticComponent;
      [(AXMOutputComponent *)&v23 transitionToState:1 completion:v6];
    }
    else
    {
      [(CHHapticEngine *)self->_engine setStoppedHandler:&__block_literal_global_34];
      [(CHHapticEngine *)self->_engine setResetHandler:&__block_literal_global_36_0];
      v22.receiver = self;
      v22.super_class = (Class)AXMHapticComponent;
      [(AXMOutputComponent *)&v22 transitionToState:2 completion:v6];
    }
  }
}

void __51__AXMHapticComponent_transitionToState_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = AXMediaLogHaptics();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1B57D5000, v3, OS_LOG_TYPE_INFO, "Haptic engine stopped. reason: %ld", (uint8_t *)&v4, 0xCu);
  }
}

void __51__AXMHapticComponent_transitionToState_completion___block_invoke_33()
{
  v0 = AXMediaLogHaptics();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_INFO, "Haptic engine reset", v1, 2u);
  }
}

- (BOOL)canHandleRequest:(id)a3
{
  char v3 = [a3 hapticActions];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)handleRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AXMHapticComponent_handleRequest_completion___block_invoke;
  block[3] = &unk_1E6118E18;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke(uint64_t a1)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) hapticActions];
  char v3 = [v2 firstObject];
  BOOL v4 = [v3 hapticFileURL];

  uint64_t v5 = [*(id *)(a1 + 32) hapticActions];
  id v6 = [v5 firstObject];
  [v6 hapticIntensity];
  double v8 = v7;

  id v9 = [v4 pathExtension];
  id v10 = [v9 lowercaseString];
  if ([v10 isEqualToString:@"ahap"])
  {

LABEL_6:
    goto LABEL_7;
  }
  v11 = [v4 pathExtension];
  id v12 = [v11 lowercaseString];
  char v13 = [v12 isEqualToString:@"json"];

  if ((v13 & 1) == 0)
  {
    id v9 = AXMediaLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_7(v9);
    }
    goto LABEL_6;
  }
LABEL_7:
  id v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
  id v43 = 0;
  v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v14 options:0 error:&v43];
  id v16 = v43;
  if (!v16 && v15)
  {
    id v42 = 0;
    v17 = [objc_alloc(MEMORY[0x1E4F1DF90]) initWithDictionary:v15 error:&v42];
    id v16 = v42;
    if (v16 || !v17)
    {
      id v20 = AXMediaLogHaptics();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_1();
      }
      goto LABEL_18;
    }
    v18 = *(void **)(*(void *)(a1 + 40) + 24);
    id v41 = 0;
    [v18 startAndReturnError:&v41];
    id v19 = v41;
    if (v19)
    {
      id v16 = v19;
      id v20 = AXMediaLogHaptics();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_5();
      }
    }
    else
    {
      objc_super v22 = *(void **)(*(void *)(a1 + 40) + 24);
      id v40 = 0;
      uint64_t v23 = [v22 createPlayerWithPattern:v17 error:&v40];
      id v16 = v40;
      uint64_t v24 = *(void *)(a1 + 40);
      v25 = *(void **)(v24 + 32);
      *(void *)(v24 + 32) = v23;

      if (v16)
      {
        id v20 = AXMediaLogHaptics();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_4();
        }
      }
      else
      {
        id v26 = objc_alloc(MEMORY[0x1E4F1DF50]);
        *(float *)&double v27 = v8;
        id v20 = [v26 initWithParameterID:*MEMORY[0x1E4F1DEA0] value:v27 relativeTime:0.0];
        v28 = *(void **)(*(void *)(a1 + 40) + 32);
        v50[0] = v20;
        __int16 v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
        id v39 = 0;
        [v28 sendParameters:v29 atTime:&v39 error:0.0];
        id v16 = v39;

        v30 = AXMediaLogHaptics();
        __int16 v31 = v30;
        if (v16)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_3();
          }
        }
        else
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = *(void *)(a1 + 40);
            uint64_t v33 = *(void *)(v32 + 24);
            uint64_t v34 = *(void *)(v32 + 32);
            *(_DWORD *)buf = 138412802;
            uint64_t v45 = v33;
            __int16 v46 = 2112;
            uint64_t v47 = v34;
            __int16 v48 = 2048;
            double v49 = v8;
            _os_log_impl(&dword_1B57D5000, v31, OS_LOG_TYPE_INFO, "Requesting haptic. Engine: %@. Player: %@. Intensity: %.2f", buf, 0x20u);
          }

          uint64_t v35 = *(void **)(*(void *)(a1 + 40) + 32);
          id v38 = 0;
          [v35 startAtTime:&v38 error:0.0];
          id v16 = v38;
          if (!v16) {
            goto LABEL_18;
          }
          __int16 v31 = AXMediaLogHaptics();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_2();
          }
        }
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  v17 = AXMediaLogHaptics();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_6();
  }
LABEL_19:

  objc_super v21 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AXMHapticComponent_handleRequest_completion___block_invoke_48;
  block[3] = &unk_1E6117410;
  id v37 = *(id *)(a1 + 48);
  dispatch_async(v21, block);
}

uint64_t __47__AXMHapticComponent_handleRequest_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isAutoShutdownEnabled
{
  return self->_autoShutdownEnabled;
}

- (void)setAutoShutdownEnabled:(BOOL)a3
{
  self->_autoShutdownEnabled = a3;
}

- (CHHapticPatternPlayer)_levelPlayer
{
  return self->__levelPlayer;
}

- (void)set_levelPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__levelPlayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_engine, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)transitionToState:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Error creating haptic engine: %@", v2, v3, v4, v5, v6);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to create haptic pattern: %@", v2, v3, v4, v5, v6);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to play haptic: %@", v2, v3, v4, v5, v6);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to set intensity of haptic: %@", v2, v3, v4, v5, v6);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to create haptic player: %@", v2, v3, v4, v5, v6);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to start haptic engine: %@", v2, v3, v4, v5, v6);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to load haptic pattern dictionary: %@", v2, v3, v4, v5, v6);
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_7(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "Unexpected file format for haptic file", v1, 2u);
}

@end