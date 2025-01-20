@interface VKWalkAssistHapticEngine
- (BOOL)hapticEngineStarted;
- (BOOL)usesHapticFeedback;
- (CHHapticEngine)hapticEngine;
- (VKWalkAssistHapticEngine)init;
- (id)enterPattern;
- (id)exitPattern;
- (id)singlePulsePatternWithIntensity:(float)a3 duration:(double)a4;
- (void)_playHapticFromHapticPattern:(id)a3;
- (void)playEnterHaptic;
- (void)playExitHaptic;
- (void)playSingleHapticPulseWithIntensity:(float)a3 duration:(double)a4;
- (void)setHapticEngine:(id)a3;
- (void)setHapticEngineStarted:(BOOL)a3;
- (void)setUsesHapticFeedback:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation VKWalkAssistHapticEngine

- (VKWalkAssistHapticEngine)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKWalkAssistHapticEngine;
  v2 = [(VKWalkAssistHapticEngine *)&v8 init];
  if (v2
    && ([MEMORY[0x263F00588] capabilitiesForHardware],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 supportsHaptics],
        v3,
        v4))
  {
    hapticEngine = v2->_hapticEngine;
    v2->_hapticEngine = 0;

    *(_WORD *)&v2->_hapticEngineStarted = 0;
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)start
{
}

- (void)stop
{
}

- (void)playEnterHaptic
{
  id v3 = [(VKWalkAssistHapticEngine *)self enterPattern];
  [(VKWalkAssistHapticEngine *)self _playHapticFromHapticPattern:v3];
}

- (void)playExitHaptic
{
  id v3 = [(VKWalkAssistHapticEngine *)self exitPattern];
  [(VKWalkAssistHapticEngine *)self _playHapticFromHapticPattern:v3];
}

- (void)playSingleHapticPulseWithIntensity:(float)a3 duration:(double)a4
{
  -[VKWalkAssistHapticEngine singlePulsePatternWithIntensity:duration:](self, "singlePulsePatternWithIntensity:duration:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VKWalkAssistHapticEngine *)self _playHapticFromHapticPattern:v5];
}

- (void)setUsesHapticFeedback:(BOOL)a3
{
  if (self->_usesHapticFeedback != a3)
  {
    if (!a3)
    {
      if (!self->_hapticEngineStarted) {
        return;
      }
      objc_initWeak(&location, self);
      hapticEngine = self->_hapticEngine;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_271;
      v16[3] = &unk_265162920;
      v11 = &v17;
      objc_copyWeak(&v17, &location);
      [(CHHapticEngine *)hapticEngine stopWithCompletionHandler:v16];
      self->_usesHapticFeedback = 0;
      goto LABEL_10;
    }
    if (!self->_hapticEngineStarted)
    {
      int v4 = [MEMORY[0x263F00588] capabilitiesForHardware];
      int v5 = [v4 supportsHaptics];

      if (v5)
      {
        id v24 = 0;
        v6 = (CHHapticEngine *)[objc_alloc(MEMORY[0x263F00588]) initAndReturnError:&v24];
        id v7 = v24;
        objc_super v8 = self->_hapticEngine;
        self->_hapticEngine = v6;

        if (v7)
        {
          v9 = AXLogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            -[VKWalkAssistHapticEngine setUsesHapticFeedback:]();
          }
LABEL_15:

          return;
        }
        v12 = self->_hapticEngine;
        id v23 = 0;
        [(CHHapticEngine *)v12 startAndReturnError:&v23];
        id v13 = v23;
        if (v13)
        {
          id v7 = v13;
          v9 = AXLogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            -[VKWalkAssistHapticEngine setUsesHapticFeedback:]();
          }
          goto LABEL_15;
        }
        objc_initWeak(&location, self);
        v14 = self->_hapticEngine;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke;
        v20[3] = &unk_2651628D0;
        v11 = &v21;
        objc_copyWeak(&v21, &location);
        [(CHHapticEngine *)v14 setResetHandler:v20];
        v15 = self->_hapticEngine;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_269;
        v18[3] = &unk_2651628F8;
        objc_copyWeak(&v19, &location);
        [(CHHapticEngine *)v15 setStoppedHandler:v18];
        *(_WORD *)&self->_hapticEngineStarted = 257;
        objc_destroyWeak(&v19);
LABEL_10:
        objc_destroyWeak(v11);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained hapticEngine];
  id v9 = 0;
  [v3 startAndReturnError:&v9];
  id v4 = v9;

  if (v4)
  {
    int v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2426A3000, v5, OS_LOG_TYPE_DEFAULT, "Cannot restart CHHapticEngine: %@", buf, 0xCu);
    }

    id v6 = objc_loadWeakRetained(v1);
    [v6 setUsesHapticFeedback:0];

    id v7 = objc_loadWeakRetained(v1);
    [v7 setHapticEngineStarted:0];
  }
  else
  {
    id v8 = objc_loadWeakRetained(v1);
    [v8 setHapticEngineStarted:1];

    id v7 = objc_loadWeakRetained(v1);
    [v7 setUsesHapticFeedback:1];
  }
}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_269(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHapticEngineStarted:0];

  id v5 = objc_loadWeakRetained(v3);
  [v5 setUsesHapticFeedback:0];

  switch(a2)
  {
    case -1:
      id v6 = AXLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        id v7 = "CHHapticEngine stopped: System Error";
        id v8 = (uint8_t *)&v10;
        goto LABEL_12;
      }
      break;
    case 1:
      id v6 = AXLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        id v7 = "CHHapticEngine stopped: Audio Session Interrupt";
        id v8 = (uint8_t *)&v13;
        goto LABEL_12;
      }
      break;
    case 2:
      id v6 = AXLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        id v7 = "CHHapticEngine stopped: Application Suspended";
        id v8 = (uint8_t *)&v12;
        goto LABEL_12;
      }
      break;
    case 3:
      id v6 = AXLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        id v7 = "CHHapticEngine stopped: Idle Timeout";
        id v8 = (uint8_t *)&v11;
        goto LABEL_12;
      }
      break;
    default:
      id v6 = AXLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        id v7 = "CHHapticEngine stopped: Unknown reason";
        id v8 = (uint8_t *)&v9;
LABEL_12:
        _os_log_impl(&dword_2426A3000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
      break;
  }
}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_271(uint64_t a1, void *a2)
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
      [v8 setUsesHapticFeedback:1];
    }
    __int16 v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_271_cold_1();
    }
  }
  else
  {
    [WeakRetained setHapticEngineStarted:0];
  }
}

- (id)enterPattern
{
  v18[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F00598]);
  LODWORD(v3) = 1.0;
  id v4 = (void *)[v2 initWithParameterID:*MEMORY[0x263F00508] value:v3];
  id v5 = objc_alloc(MEMORY[0x263F00598]);
  LODWORD(v6) = 1.0;
  int v7 = (void *)[v5 initWithParameterID:*MEMORY[0x263F00510] value:v6];
  id v8 = objc_alloc(MEMORY[0x263F00590]);
  uint64_t v9 = *MEMORY[0x263F00528];
  v18[0] = v4;
  v18[1] = v7;
  __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  __int16 v11 = (void *)[v8 initWithEventType:v9 parameters:v10 relativeTime:0.0];

  id v12 = objc_alloc(MEMORY[0x263F005A8]);
  id v17 = v11;
  __int16 v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  uint64_t v16 = 0;
  v14 = (void *)[v12 initWithEvents:v13 parameters:MEMORY[0x263EFFA68] error:&v16];

  return v14;
}

- (id)exitPattern
{
  v32[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F00598]);
  double v3 = (void *)MEMORY[0x263F00508];
  LODWORD(v4) = 1058642330;
  v28 = (void *)[v2 initWithParameterID:*MEMORY[0x263F00508] value:v4];
  id v5 = objc_alloc(MEMORY[0x263F00598]);
  double v6 = (void *)MEMORY[0x263F00510];
  LODWORD(v7) = 1050253722;
  id v8 = (void *)[v5 initWithParameterID:*MEMORY[0x263F00510] value:v7];
  id v9 = objc_alloc(MEMORY[0x263F00590]);
  __int16 v10 = (uint64_t *)MEMORY[0x263F00528];
  uint64_t v11 = *MEMORY[0x263F00528];
  v32[0] = v28;
  v32[1] = v8;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  __int16 v13 = (void *)[v9 initWithEventType:v11 parameters:v12 relativeTime:0.0];

  id v14 = objc_alloc(MEMORY[0x263F00598]);
  LODWORD(v15) = 1050253722;
  uint64_t v16 = (void *)[v14 initWithParameterID:*v3 value:v15];
  id v17 = objc_alloc(MEMORY[0x263F00598]);
  LODWORD(v18) = 1050253722;
  id v19 = (void *)[v17 initWithParameterID:*v6 value:v18];
  id v20 = objc_alloc(MEMORY[0x263F00590]);
  uint64_t v21 = *v10;
  v31[0] = v16;
  v31[1] = v19;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  id v23 = (void *)[v20 initWithEventType:v21 parameters:v22 relativeTime:0.125];

  id v24 = objc_alloc(MEMORY[0x263F005A8]);
  v30[0] = v13;
  v30[1] = v23;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  uint64_t v29 = 0;
  v26 = (void *)[v24 initWithEvents:v25 parameters:MEMORY[0x263EFFA68] error:&v29];

  return v26;
}

- (id)singlePulsePatternWithIntensity:(float)a3 duration:(double)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = objc_alloc(MEMORY[0x263F00598]);
  *(float *)&double v7 = a3;
  id v8 = (void *)[v6 initWithParameterID:*MEMORY[0x263F00508] value:v7];
  id v9 = objc_alloc(MEMORY[0x263F00590]);
  uint64_t v10 = *MEMORY[0x263F00528];
  v19[0] = v8;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v12 = (void *)[v9 initWithEventType:v10 parameters:v11 relativeTime:0.0 duration:a4];

  id v13 = objc_alloc(MEMORY[0x263F005A8]);
  double v18 = v12;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  uint64_t v17 = 0;
  double v15 = (void *)[v13 initWithEvents:v14 parameters:MEMORY[0x263EFFA68] error:&v17];

  return v15;
}

- (void)_playHapticFromHapticPattern:(id)a3
{
  v12[4] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && self->_usesHapticFeedback)
  {
    if (!self->_hapticEngineStarted)
    {
      hapticEngine = self->_hapticEngine;
      v12[0] = 0;
      [(CHHapticEngine *)hapticEngine startAndReturnError:v12];
      id v10 = v12[0];
      if (v10)
      {
        id v7 = v10;
        id v6 = AXLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          -[VKWalkAssistHapticEngine _playHapticFromHapticPattern:]();
        }
        goto LABEL_12;
      }
      self->_hapticEngineStarted = 1;
    }
    id v5 = self->_hapticEngine;
    id v11 = 0;
    id v6 = [(CHHapticEngine *)v5 createAdvancedPlayerWithPattern:v4 error:&v11];
    id v7 = v11;
    if (v7)
    {
      id v8 = AXLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[VKWalkAssistHapticEngine _playHapticFromHapticPattern:]();
      }
    }
    else
    {
      [v6 startAtTime:0 error:0.0];
    }
LABEL_12:
  }
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

- (BOOL)usesHapticFeedback
{
  return self->_usesHapticFeedback;
}

- (void).cxx_destruct
{
}

- (void)setUsesHapticFeedback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot start CHHapticEngine: %@", v2, v3, v4, v5, v6);
}

- (void)setUsesHapticFeedback:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot initialize CHHapticEngine: %@", v2, v3, v4, v5, v6);
}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_271_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot stop CHHapticEngine: %@", v2, v3, v4, v5, v6);
}

- (void)_playHapticFromHapticPattern:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot configure haptic player: %@", v2, v3, v4, v5, v6);
}

- (void)_playHapticFromHapticPattern:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2426A3000, v0, v1, "Cannot restart haptic engine: %@", v2, v3, v4, v5, v6);
}

@end