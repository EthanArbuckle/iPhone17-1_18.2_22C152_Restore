@interface AXCameraHapticEngine
+ (id)_stringForHapticEngineStoppedReason:(int64_t)a3;
- (AXCameraHapticEngine)init;
- (BOOL)_supportsAudio;
- (BOOL)_supportsHaptics;
- (CHHapticEngine)_engine;
- (CHHapticPatternPlayer)_levelPlayer;
- (CHHapticPatternPlayer)_screenEdgePlayer;
- (CHHapticPatternPlayer)_unlevelPlayer;
- (double)_lastScreenEdgeTimestamp;
- (double)screenEdgeFeedbackCooldownTime;
- (unint64_t)_levelAudioResourceID;
- (unint64_t)_registerAudioWithResourceWithName:(id)a3;
- (unint64_t)_unlevelAudioResourceID;
- (void)_createLevelPlayerIfNeeded;
- (void)_createScreenEdgePlayerIfNeeded;
- (void)_createUnlevelPlayerIfNeeded;
- (void)_performHapticForPlayer:(id)a3;
- (void)_releasePlayers;
- (void)_unregisterAudioResource:(unint64_t)a3;
- (void)dealloc;
- (void)init;
- (void)performLevelFeedback;
- (void)performSubjectHitScreenEdgeFeedback;
- (void)performUnlevelFeedback;
- (void)setScreenEdgeFeedbackCooldownTime:(double)a3;
- (void)set_lastScreenEdgeTimestamp:(double)a3;
- (void)set_levelAudioResourceID:(unint64_t)a3;
- (void)set_levelPlayer:(id)a3;
- (void)set_screenEdgePlayer:(id)a3;
- (void)set_unlevelAudioResourceID:(unint64_t)a3;
- (void)set_unlevelPlayer:(id)a3;
@end

@implementation AXCameraHapticEngine

- (AXCameraHapticEngine)init
{
  v19.receiver = self;
  v19.super_class = (Class)AXCameraHapticEngine;
  v2 = [(AXCameraHapticEngine *)&v19 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F00588] capabilitiesForHardware];
    if ([v3 supportsHaptics] & 1) != 0 || (objc_msgSend(v3, "supportsAudio"))
    {
      v4 = [MEMORY[0x263EF93E0] sharedInstance];
      id v18 = 0;
      [v4 setPrefersNoDucking:1 error:&v18];
      id v5 = v18;

      if (v5)
      {
        v6 = AXMediaLogHaptics();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[AXCameraHapticEngine init]();
        }
      }
      id v7 = objc_alloc(MEMORY[0x263F00588]);
      v8 = [MEMORY[0x263EF93E0] sharedInstance];
      id v17 = 0;
      v9 = (void *)[v7 initWithAudioSession:v8 error:&v17];
      v10 = v17;

      if (!v9 || v10)
      {
        v12 = AXMediaLogHaptics();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[AXCameraHapticEngine init]();
        }

        v11 = 0;
      }
      else
      {
        v2->__supportsHaptics = [v3 supportsHaptics];
        v2->__supportsAudio = [v3 supportsAudio];
        objc_storeStrong((id *)&v2->__engine, v9);
        [(AXCameraHapticEngine *)v2 _createLevelPlayerIfNeeded];
        [(AXCameraHapticEngine *)v2 _createUnlevelPlayerIfNeeded];
        [(AXCameraHapticEngine *)v2 _createScreenEdgePlayerIfNeeded];
        [(CHHapticEngine *)v2->__engine setMuteHapticsWhileRecordingAudio:0];
        objc_initWeak(location, v2);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __28__AXCameraHapticEngine_init__block_invoke;
        v14[3] = &unk_26509F978;
        objc_copyWeak(&v15, location);
        [(CHHapticEngine *)v2->__engine setResetHandler:v14];
        [(CHHapticEngine *)v2->__engine setAutoShutdownEnabled:1];
        [v9 setStoppedHandler:&__block_literal_global];
        v11 = v2;
        objc_destroyWeak(&v15);
        objc_destroyWeak(location);
      }
    }
    else
    {
      v10 = AXMediaLogHaptics();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_24019A000, v10, OS_LOG_TYPE_DEFAULT, "Haptics and audio not supported", (uint8_t *)location, 2u);
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __28__AXCameraHapticEngine_init__block_invoke(uint64_t a1)
{
  v2 = AXMediaLogHaptics();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24019A000, v2, OS_LOG_TYPE_DEFAULT, "CHHapticEngine reset received", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _releasePlayers];
}

void __28__AXCameraHapticEngine_init__block_invoke_300(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = +[AXCameraHapticEngine _stringForHapticEngineStoppedReason:a2];
  v3 = AXMediaLogHaptics();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_24019A000, v3, OS_LOG_TYPE_DEFAULT, "CHHapticEngine stopped for reason %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dealloc
{
  [(AXCameraHapticEngine *)self _unregisterAudioResource:[(AXCameraHapticEngine *)self _levelAudioResourceID]];
  [(AXCameraHapticEngine *)self _unregisterAudioResource:[(AXCameraHapticEngine *)self _unlevelAudioResourceID]];
  v3.receiver = self;
  v3.super_class = (Class)AXCameraHapticEngine;
  [(AXCameraHapticEngine *)&v3 dealloc];
}

+ (id)_stringForHapticEngineStoppedReason:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return @"Unexpected enum";
  }
  else {
    return off_26509F9E0[a3 + 1];
  }
}

- (void)_releasePlayers
{
  [(AXCameraHapticEngine *)self set_levelPlayer:0];
  [(AXCameraHapticEngine *)self set_unlevelPlayer:0];

  [(AXCameraHapticEngine *)self set_screenEdgePlayer:0];
}

- (void)_createLevelPlayerIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24019A000, v0, v1, "Error creating player: %@", v2, v3, v4, v5, v6);
}

- (void)_createUnlevelPlayerIfNeeded
{
  v65[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXCameraHapticEngine *)self _unlevelPlayer];

  if (!v3)
  {
    [(AXCameraHapticEngine *)self set_unlevelAudioResourceID:[(AXCameraHapticEngine *)self _registerAudioWithResourceWithName:@"outLevel.aif"]];
    if ([(AXCameraHapticEngine *)self _supportsHaptics])
    {
      id v4 = objc_alloc(MEMORY[0x263F00590]);
      uint64_t v5 = *MEMORY[0x263F00528];
      id v6 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v7) = 0.75;
      v8 = (void *)[v6 initWithParameterID:*MEMORY[0x263F00508] value:v7];
      v65[0] = v8;
      id v9 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v10) = 1.0;
      v11 = (void *)[v9 initWithParameterID:*MEMORY[0x263F00518] value:v10];
      v65[1] = v11;
      id v12 = objc_alloc(MEMORY[0x263F00598]);
      v13 = (void *)MEMORY[0x263F00500];
      v14 = (void *)[v12 initWithParameterID:*MEMORY[0x263F00500] value:0.0];
      v65[2] = v14;
      id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:3];
      uint64_t v58 = [v4 initWithEventType:v5 parameters:v15 relativeTime:0.0];

      id v16 = objc_alloc(MEMORY[0x263F00590]);
      id v17 = (uint64_t *)MEMORY[0x263F00528];
      uint64_t v18 = *MEMORY[0x263F00528];
      id v19 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v20) = 0.75;
      v21 = (void *)[v19 initWithParameterID:*MEMORY[0x263F00508] value:v20];
      v64[0] = v21;
      id v22 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v23) = 1.0;
      v24 = (void *)[v22 initWithParameterID:*MEMORY[0x263F00518] value:v23];
      v64[1] = v24;
      v25 = (void *)[objc_alloc(MEMORY[0x263F00598]) initWithParameterID:*v13 value:0.0];
      v64[2] = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:3];
      uint64_t v27 = [v16 initWithEventType:v18 parameters:v26 relativeTime:0.075];

      id v28 = objc_alloc(MEMORY[0x263F00590]);
      uint64_t v57 = *v17;
      id v29 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v30) = 0.75;
      v31 = (void *)[v29 initWithParameterID:*MEMORY[0x263F00508] value:v30];
      v63[0] = v31;
      id v32 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v33) = 1.0;
      v34 = (void *)[v32 initWithParameterID:*MEMORY[0x263F00518] value:v33];
      v63[1] = v34;
      id v35 = objc_alloc(MEMORY[0x263F00598]);
      v36 = (void *)[v35 initWithParameterID:*MEMORY[0x263F00500] value:0.0];
      v63[2] = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
      v38 = (void *)[v28 initWithEventType:v57 parameters:v37 relativeTime:0.15];

      v39 = (void *)v58;
    }
    else
    {
      v38 = 0;
      uint64_t v27 = 0;
      v39 = 0;
    }
    if ([(AXCameraHapticEngine *)self _unlevelAudioResourceID])
    {
      id v40 = objc_alloc(MEMORY[0x263F00590]);
      unint64_t v41 = [(AXCameraHapticEngine *)self _unlevelAudioResourceID];
      id v42 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v43) = 0.75;
      v44 = (void *)[v42 initWithParameterID:*MEMORY[0x263F004F8] value:v43];
      v62 = v44;
      v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
      v46 = (void *)[v40 initWithAudioResourceID:v41 parameters:v45 relativeTime:0.0];
    }
    else
    {
      v46 = 0;
    }
    id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
    v48 = v47;
    if (v39) {
      [v47 addObject:v39];
    }
    if (v27) {
      [v48 addObject:v27];
    }
    v59 = (void *)v27;
    if (v38) {
      [v48 addObject:v38];
    }
    v49 = v39;
    if (v46) {
      [v48 addObject:v46];
    }
    id v50 = objc_alloc(MEMORY[0x263F005A8]);
    id v61 = 0;
    v51 = (void *)[v50 initWithEvents:v48 parameters:MEMORY[0x263EFFA68] error:&v61];
    id v52 = v61;
    v53 = [(AXCameraHapticEngine *)self _engine];
    id v60 = v52;
    v54 = [v53 createPrivilegedPlayerWithPlayable:v51 error:&v60];
    id v55 = v60;

    if (!v54 || v55)
    {
      v56 = AXMediaLogHaptics();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        -[AXCameraHapticEngine _createLevelPlayerIfNeeded]();
      }
    }
    else
    {
      [(AXCameraHapticEngine *)self set_unlevelPlayer:v54];
    }
  }
}

- (void)_createScreenEdgePlayerIfNeeded
{
  v27[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXCameraHapticEngine *)self _screenEdgePlayer];

  if (!v3)
  {
    if ([(AXCameraHapticEngine *)self _supportsHaptics])
    {
      id v4 = objc_alloc(MEMORY[0x263F00590]);
      uint64_t v5 = *MEMORY[0x263F00528];
      id v6 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v7) = 1.0;
      v8 = (void *)[v6 initWithParameterID:*MEMORY[0x263F00508] value:v7];
      v27[0] = v8;
      id v9 = objc_alloc(MEMORY[0x263F00598]);
      LODWORD(v10) = 1.0;
      v11 = (void *)[v9 initWithParameterID:*MEMORY[0x263F00518] value:v10];
      v27[1] = v11;
      id v12 = objc_alloc(MEMORY[0x263F00598]);
      v13 = (void *)[v12 initWithParameterID:*MEMORY[0x263F00500] value:0.0];
      v27[2] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
      id v15 = (void *)[v4 initWithEventType:v5 parameters:v14 relativeTime:0.0];

      id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v17 = v16;
      if (v15)
      {
        [v16 addObject:v15];
      }
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v18 = objc_alloc(MEMORY[0x263F005A8]);
    id v26 = 0;
    id v19 = (void *)[v18 initWithEvents:v17 parameters:MEMORY[0x263EFFA68] error:&v26];
    id v20 = v26;
    v21 = [(AXCameraHapticEngine *)self _engine];
    id v25 = v20;
    id v22 = [v21 createPrivilegedPlayerWithPlayable:v19 error:&v25];
    id v23 = v25;

    if (!v22 || v23)
    {
      v24 = AXMediaLogHaptics();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[AXCameraHapticEngine _createLevelPlayerIfNeeded]();
      }
    }
    else
    {
      [(AXCameraHapticEngine *)self set_screenEdgePlayer:v22];
    }
  }
}

- (unint64_t)_registerAudioWithResourceWithName:(id)a3
{
  id v4 = a3;
  if ([(AXCameraHapticEngine *)self _supportsAudio])
  {
    uint64_t v5 = [v4 stringByDeletingPathExtension];
    id v6 = [v4 pathExtension];
    double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 URLForResource:v5 withExtension:v6];
    if (v8)
    {
      id v9 = [(AXCameraHapticEngine *)self _engine];
      id v14 = 0;
      unint64_t v10 = [v9 registerAudioResource:v8 options:MEMORY[0x263EFFA78] error:&v14];
      v11 = v14;

      if (v10 && !v11) {
        goto LABEL_12;
      }
      id v12 = AXMediaLogHaptics();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXCameraHapticEngine _registerAudioWithResourceWithName:]();
      }
    }
    else
    {
      v11 = AXMediaLogHaptics();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AXCameraHapticEngine _registerAudioWithResourceWithName:]();
      }
    }
    unint64_t v10 = 0;
LABEL_12:

    goto LABEL_13;
  }
  unint64_t v10 = 0;
LABEL_13:

  return v10;
}

- (void)_unregisterAudioResource:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [(AXCameraHapticEngine *)self _engine];
    id v8 = 0;
    int v5 = [v4 unregisterAudioResource:a3 error:&v8];
    id v6 = v8;

    if (!v5 || v6)
    {
      double v7 = AXMediaLogHaptics();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[AXCameraHapticEngine _unregisterAudioResource:]();
      }
    }
  }
}

- (void)_performHapticForPlayer:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = AXMediaLogHaptics();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_24019A000, v6, OS_LOG_TYPE_INFO, "Playing haptic/sound for: %@", buf, 0xCu);
    }

    double v7 = [(AXCameraHapticEngine *)self _engine];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke;
    v8[3] = &unk_26509F9C0;
    id v9 = v4;
    [v7 startWithCompletionHandler:v8];

    id v6 = v9;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24019A000, v6, OS_LOG_TYPE_DEFAULT, "Trying to play haptic with nil player", buf, 2u);
  }
}

void __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = AXMediaLogHaptics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_2();
    }
  }
  else
  {
    int v5 = *(void **)(a1 + 32);
    id v10 = 0;
    int v6 = [v5 startAtTime:&v10 error:0.0];
    double v7 = v10;
    id v4 = v7;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      id v9 = AXMediaLogHaptics();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_1();
      }
    }
  }
}

- (void)performLevelFeedback
{
  [(AXCameraHapticEngine *)self _createLevelPlayerIfNeeded];
  id v3 = [(AXCameraHapticEngine *)self _levelPlayer];
  [(AXCameraHapticEngine *)self _performHapticForPlayer:v3];
}

- (void)performUnlevelFeedback
{
  [(AXCameraHapticEngine *)self _createUnlevelPlayerIfNeeded];
  id v3 = [(AXCameraHapticEngine *)self _unlevelPlayer];
  [(AXCameraHapticEngine *)self _performHapticForPlayer:v3];
}

- (void)performSubjectHitScreenEdgeFeedback
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  [(AXCameraHapticEngine *)self _lastScreenEdgeTimestamp];
  double v5 = Current - v4;
  [(AXCameraHapticEngine *)self screenEdgeFeedbackCooldownTime];
  if (v6 > 0.0 && v5 < v6)
  {
    double v9 = v6;
    id v10 = AXMediaLogHaptics();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      double v12 = v5;
      __int16 v13 = 2048;
      double v14 = v9;
      _os_log_impl(&dword_24019A000, v10, OS_LOG_TYPE_DEFAULT, "Suppressing screen edge feedback %.3f seconds after previous feedback (cooldown time is %.3f)", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [(AXCameraHapticEngine *)self _createScreenEdgePlayerIfNeeded];
    BOOL v8 = [(AXCameraHapticEngine *)self _screenEdgePlayer];
    [(AXCameraHapticEngine *)self _performHapticForPlayer:v8];

    [(AXCameraHapticEngine *)self set_lastScreenEdgeTimestamp:Current];
  }
}

- (double)screenEdgeFeedbackCooldownTime
{
  return self->_screenEdgeFeedbackCooldownTime;
}

- (void)setScreenEdgeFeedbackCooldownTime:(double)a3
{
  self->_screenEdgeFeedbackCooldownTime = a3;
}

- (BOOL)_supportsHaptics
{
  return self->__supportsHaptics;
}

- (BOOL)_supportsAudio
{
  return self->__supportsAudio;
}

- (CHHapticEngine)_engine
{
  return self->__engine;
}

- (CHHapticPatternPlayer)_levelPlayer
{
  return self->__levelPlayer;
}

- (void)set_levelPlayer:(id)a3
{
}

- (CHHapticPatternPlayer)_unlevelPlayer
{
  return self->__unlevelPlayer;
}

- (void)set_unlevelPlayer:(id)a3
{
}

- (CHHapticPatternPlayer)_screenEdgePlayer
{
  return self->__screenEdgePlayer;
}

- (void)set_screenEdgePlayer:(id)a3
{
}

- (unint64_t)_levelAudioResourceID
{
  return self->__levelAudioResourceID;
}

- (void)set_levelAudioResourceID:(unint64_t)a3
{
  self->__levelAudioResourceID = a3;
}

- (unint64_t)_unlevelAudioResourceID
{
  return self->__unlevelAudioResourceID;
}

- (void)set_unlevelAudioResourceID:(unint64_t)a3
{
  self->__unlevelAudioResourceID = a3;
}

- (double)_lastScreenEdgeTimestamp
{
  return self->__lastScreenEdgeTimestamp;
}

- (void)set_lastScreenEdgeTimestamp:(double)a3
{
  self->__lastScreenEdgeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__screenEdgePlayer, 0);
  objc_storeStrong((id *)&self->__unlevelPlayer, 0);
  objc_storeStrong((id *)&self->__levelPlayer, 0);

  objc_storeStrong((id *)&self->__engine, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24019A000, v0, v1, "Could not set prefers no ducking: %@", v2, v3, v4, v5, v6);
}

- (void)_registerAudioWithResourceWithName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24019A000, v0, v1, "Error finding audio resource %@", v2, v3, v4, v5, v6);
}

- (void)_registerAudioWithResourceWithName:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_24019A000, v1, OS_LOG_TYPE_ERROR, "Error registering audio resource %@: %@", v2, 0x16u);
}

- (void)_unregisterAudioResource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24019A000, v0, v1, "Error unregistering audio resource: %@", v2, v3, v4, v5, v6);
}

void __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24019A000, v0, v1, "Error playing haptic: %@", v2, v3, v4, v5, v6);
}

void __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24019A000, v0, v1, "Error starting engine: %@", v2, v3, v4, v5, v6);
}

@end