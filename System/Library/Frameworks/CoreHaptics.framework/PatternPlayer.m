@interface PatternPlayer
- (BOOL)cancelAndReturnError:(id *)a3;
- (BOOL)isMuted;
- (BOOL)scheduleParameterCurve:(id)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)sendParameters:(id)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)startAtTime:(double)a3 error:(id *)a4;
- (BOOL)startAtTime:(double)a3 withImmediateParameters:(id)a4 error:(id *)a5;
- (BOOL)stopAtTime:(double)a3 error:(id *)a4;
- (PatternPlayer)init;
- (PatternPlayer)initWithPlayable:(id)a3 engine:(id)a4 privileged:(BOOL)a5 error:(id *)a6;
- (id)processImmediateParameters:(id)a3;
- (void)clearExternalResources:(id)a3;
- (void)dealloc;
- (void)doSetMute:(BOOL)a3;
- (void)releaseExternalResources:(id)a3 events:(id)a4;
- (void)setIsMuted:(BOOL)a3;
@end

@implementation PatternPlayer

- (PatternPlayer)initWithPlayable:(id)a3 engine:(id)a4 privileged:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PatternPlayer;
  v12 = [(PatternPlayer *)&v46 init];
  if (v12)
  {
    v13 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t spid = os_signpost_id_make_with_pointer(v13, v12);

    v14 = CALog::Scope::oslog((id *)kHAPIScope);
    v15 = v14;
    unint64_t v43 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PatternPlayer_initWithPlayable", " enableTelemetry=YES ", buf, 2u);
    }

    if (kHAPIScope)
    {
      v16 = *(id *)kHAPIScope;
      if (!v16) {
        goto LABEL_12;
      }
    }
    else
    {
      v16 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v48 = "CHHapticPatternPlayer.mm";
      __int16 v49 = 1024;
      int v50 = 88;
      __int16 v51 = 2080;
      v52 = "-[PatternPlayer initWithPlayable:engine:privileged:error:]";
      __int16 v53 = 2048;
      v54 = v12;
      _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: creating player %p", buf, 0x26u);
    }

LABEL_12:
    objc_storeWeak((id *)&v12->super._engine, v11);
    v12->super._muteState = 0;
    v12->super._previousAction = 0;
    v18 = [v10 resolveExternalResources:v11 error:a6];
    if (!v18)
    {

      v37 = CALog::Scope::oslog((id *)kHAPIScope);
      v38 = v37;
      if (v43 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PatternPlayer_initWithPlayable", (const char *)&unk_1BA96A542, buf, 2u);
      }
      goto LABEL_38;
    }
    v19 = [v10 parameters];
    v20 = [v10 parameterCurves];
    uint64_t v21 = +[CHHapticPattern eventListFromEvents:v18 parameters:v19 parameterCurves:v20 engine:v11 privileged:v7];
    events = v12->super._events;
    v12->super._events = (NSArray *)v21;

    if ([(NSArray *)v12->super._events count])
    {
      uint64_t v23 = [v10 patternID];
      patternID = v12->super._patternID;
      v12->super._patternID = (NSString *)v23;

      [v10 duration];
      v12->super._patternDuration = v25;
      id WeakRetained = objc_loadWeakRetained((id *)&v12->super._engine);
      v27 = [WeakRetained metrics];
      [v27 handleInitForPlayer:v12 events:v12->super._events isAdvanced:0 patternID:v12->super._patternID];

      v28 = [v10 parameterCurves];
      BOOL v29 = [v28 count] == 0;

      if (!v29)
      {
        id v30 = objc_loadWeakRetained((id *)&v12->super._engine);
        v31 = [v30 metrics];
        [v31 handleParamCurveEncountered];
      }
      uint64_t v32 = objc_msgSend(v11, "getAvailableChannel:", a6, v43);
      channel = v12->_channel;
      v12->_channel = (AVHapticPlayerChannel *)v32;

      if (!v12->_channel)
      {
        v34 = [(PatternPlayerBase *)v12 engine];
        [(PatternPlayer *)v12 releaseExternalResources:v34 events:v18];

        v12 = 0;
      }
      v35 = CALog::Scope::oslog((id *)kHAPIScope);
      v36 = v35;
      if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v36, OS_SIGNPOST_INTERVAL_END, spid, "PatternPlayer_initWithPlayable", (const char *)&unk_1BA96A542, buf, 2u);
      }

      goto LABEL_39;
    }
    if (kHAPIScope)
    {
      v39 = *(id *)kHAPIScope;
      if (!v39)
      {
LABEL_33:
        if (a6)
        {
          *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4821 userInfo:0];
        }

        v41 = CALog::Scope::oslog((id *)kHAPIScope);
        v38 = v41;
        if (v43 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BA902000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PatternPlayer_initWithPlayable", (const char *)&unk_1BA96A542, buf, 2u);
        }
LABEL_38:

        v12 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      v39 = MEMORY[0x1E4F14500];
      id v40 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "CHHapticPatternPlayer.mm";
      __int16 v49 = 1024;
      int v50 = 125;
      __int16 v51 = 2080;
      v52 = "-[PatternPlayer initWithPlayable:engine:privileged:error:]";
      _os_log_impl(&dword_1BA902000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: pattern contains no playable events", buf, 0x1Cu);
    }

    goto LABEL_33;
  }
LABEL_40:

  return v12;
}

- (BOOL)startAtTime:(double)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    BOOL v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v28 = 136316162;
    BOOL v29 = "CHHapticPatternPlayer.mm";
    __int16 v30 = 1024;
    int v31 = 199;
    __int16 v32 = 2080;
    v33 = "-[PatternPlayer startAtTime:error:]";
    __int16 v34 = 2048;
    v35 = self;
    __int16 v36 = 2048;
    double v37 = a3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting simple player %p at time %.3f", (uint8_t *)&v28, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 200, "-[PatternPlayer startAtTime:error:]", "time >= 0.0", -4840, a4);
    return 0;
  }
  v9 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  id v11 = CALog::Scope::oslog((id *)kHAPIScope);
  v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v28) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PatternPlayer_startAtTime", " enableTelemetry=YES ", (uint8_t *)&v28, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  char v15 = [WeakRetained checkEngineStateOnStart:a4];

  if ((v15 & 1) == 0)
  {
    uint64_t v23 = CALog::Scope::oslog((id *)kHAPIScope);
    v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v24, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_startAtTime", (const char *)&unk_1BA96A542, (uint8_t *)&v28, 2u);
    }

    return 0;
  }
  int muteState = self->super._muteState;
  if ((muteState - 1) <= 1)
  {
    BOOL v17 = muteState == 2;
    [(PatternPlayer *)self doSetMute:muteState == 2];
    self->super._int muteState = newStateFromOld(self->super._muteState, v17, 1);
  }
  if ((![(PatternPlayerBase *)self needsResetForAction:2]
     || [(AVHapticPlayerChannel *)self->_channel resetAtTime:a4 error:a3])
    && [(AVHapticPlayerChannel *)self->_channel sendEvents:self->super._events atTime:a4 error:a3])
  {
    id v18 = objc_loadWeakRetained((id *)&self->super._engine);
    char v19 = [v18 notifyPlayerStarted:self atTime:a3];

    id v20 = objc_loadWeakRetained((id *)&self->super._engine);
    uint64_t v21 = [v20 metrics];
    v22 = [(PatternPlayerBase *)self patternID];
    [v21 handleStartForPlayer:self time:0 isAdvanced:v22 patternID:a3];
  }
  else
  {
    char v19 = 0;
  }
  double v25 = CALog::Scope::oslog((id *)kHAPIScope);
  v26 = v25;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(v28) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v26, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_startAtTime", (const char *)&unk_1BA96A542, (uint8_t *)&v28, 2u);
  }

  return v19;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    v3 = *(id *)kHAPIScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "CHHapticPatternPlayer.mm";
    __int16 v10 = 1024;
    int v11 = 168;
    __int16 v12 = 2080;
    unint64_t v13 = "-[PatternPlayer dealloc]";
    __int16 v14 = 2048;
    char v15 = self;
    _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: destroying player %p", buf, 0x26u);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  [(PatternPlayer *)self clearExternalResources:WeakRetained];

  if (self->_channel)
  {
    id v6 = objc_loadWeakRetained((id *)&self->super._engine);
    [v6 releaseChannel:self->_channel];
  }
  v7.receiver = self;
  v7.super_class = (Class)PatternPlayer;
  [(PatternPlayer *)&v7 dealloc];
}

- (void)clearExternalResources:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      v5 = *(id *)kHAPIScope;
      if (v5)
      {
        id v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          unint64_t v13 = "CHHapticPatternPlayer.mm";
          __int16 v14 = 1024;
          int v15 = 185;
          __int16 v16 = 2080;
          BOOL v17 = "-[PatternPlayer clearExternalResources:]";
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Clearing any externally-registered audio resources", buf, 0x1Cu);
        }
      }
    }
  }
  for (unint64_t i = 0; i < [(NSArray *)self->super._events count]; ++i)
  {
    id v8 = [(NSArray *)self->super._events objectAtIndexedSubscript:i];
    if (+[CHHapticEngine resourceIsRegistered:](CHHapticEngine, "resourceIsRegistered:", [v8 eventType]))
    {
      uint64_t v9 = [v8 eventType];
      __int16 v10 = [v4 player];
      uint64_t v11 = 0;
      +[CHHapticEngine doUnregisterAudioResource:v9 fromPattern:1 player:v10 error:&v11];
    }
  }
}

- (void).cxx_destruct
{
}

- (PatternPlayer)init
{
  return 0;
}

- (void)releaseExternalResources:(id)a3 events:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      objc_super v7 = *(id *)kHAPIScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v16 = "CHHapticPatternPlayer.mm";
          __int16 v17 = 1024;
          int v18 = 37;
          __int16 v19 = 2080;
          id v20 = "-[PatternPlayer releaseExternalResources:events:]";
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Clearing any externally-registered audio resources", buf, 0x1Cu);
        }
      }
    }
  }
  for (unint64_t i = 0; i < [v6 count]; ++i)
  {
    __int16 v10 = [v6 objectAtIndexedSubscript:i];
    if (+[CHHapticEngine resourceIsRegistered:](CHHapticEngine, "resourceIsRegistered:", [v10 audioResID]))
    {
      uint64_t v11 = [v10 audioResID];
      __int16 v12 = [v5 player];
      id v14 = 0;
      +[CHHapticEngine doUnregisterAudioResource:v11 fromPattern:1 player:v12 error:&v14];
      id v13 = v14;
    }
  }
}

- (id)processImmediateParameters:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PatternPlayer_processImmediateParameters___block_invoke;
    v7[3] = &unk_1E622DEB0;
    id v5 = v4;
    id v8 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __44__PatternPlayer_processImmediateParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:CHHapticEventParameterIDAudioVolume])
  {
    objc_super v7 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:1000];
    [v7 setObject:v6 forKey:v8];
LABEL_13:

    goto LABEL_14;
  }
  if ([v5 isEqualToString:CHHapticEventParameterIDAudioPitch])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:1001];
    [v9 setObject:v6 forKey:v8];
    goto LABEL_13;
  }
  if ([v5 isEqualToString:CHHapticEventParameterIDAudioBrightness])
  {
    __int16 v10 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:1013];
    [v10 setObject:v6 forKey:v8];
    goto LABEL_13;
  }
  if ([v5 isEqualToString:CHHapticEventParameterIDAudioPan])
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:1015];
    [v11 setObject:v6 forKey:v8];
    goto LABEL_13;
  }
  if ([v5 isEqualToString:CHHapticEventParameterIDHapticIntensity])
  {
    __int16 v12 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:2000];
    [v12 setObject:v6 forKey:v8];
    goto LABEL_13;
  }
  if ([v5 isEqualToString:CHHapticEventParameterIDHapticSharpness])
  {
    id v14 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:2001];
    [v14 setObject:v6 forKey:v8];
    goto LABEL_13;
  }
  int v15 = CALog::LogObjIfEnabled((CALog *)3, kHAPIScope, v13);
  __int16 v16 = v15;
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315906;
    int v18 = "CHHapticPatternPlayer.mm";
    __int16 v19 = 1024;
    int v20 = 74;
    __int16 v21 = 2080;
    v22 = "-[PatternPlayer processImmediateParameters:]_block_invoke";
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: EventParameter %@ does not support ImmediateParameter modulation. Ignore", (uint8_t *)&v17, 0x26u);
  }

LABEL_14:
}

- (void)doSetMute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v5 = *(id *)kHAPIScope;
      if (v5)
      {
        id v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          objc_super v7 = "un";
          *(_DWORD *)__int16 v10 = 136315906;
          *(void *)&v10[4] = "CHHapticPatternPlayer.mm";
          *(_WORD *)&v10[12] = 1024;
          *(_DWORD *)&v10[14] = 177;
          *(void *)&v10[20] = "-[PatternPlayer doSetMute:]";
          *(_WORD *)&v10[18] = 2080;
          if (v3) {
            objc_super v7 = "";
          }
          *(_WORD *)&v10[28] = 2080;
          *(void *)&v10[30] = v7;
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending %smute params", v10, 0x26u);
        }
      }
    }
  }
  if (v3) {
    float v8 = 1.0;
  }
  else {
    float v8 = 0.0;
  }
  -[AVHapticPlayerChannel setParameter:value:atTime:error:](self->_channel, "setParameter:value:atTime:error:", 1014, 0, COERCE_DOUBLE((unint64_t)LODWORD(v8)), 0.0, *(_OWORD *)v10, *(_OWORD *)&v10[16]);
  *(float *)&double v9 = v8;
  [(AVHapticPlayerChannel *)self->_channel setParameter:2014 value:0 atTime:v9 error:0.0];
}

- (BOOL)stopAtTime:(double)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    objc_super v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    objc_super v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v25 = 136316162;
    v26 = "CHHapticPatternPlayer.mm";
    __int16 v27 = 1024;
    int v28 = 230;
    __int16 v29 = 2080;
    __int16 v30 = "-[PatternPlayer stopAtTime:error:]";
    __int16 v31 = 2048;
    __int16 v32 = self;
    __int16 v33 = 2048;
    double v34 = a3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Stopping simple player %p at time %.3f", (uint8_t *)&v25, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 231, "-[PatternPlayer stopAtTime:error:]", "time >= 0.0", -4840, a4);
LABEL_24:
    LOBYTE(v16) = 0;
    return v16;
  }
  double v9 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  uint64_t v11 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PatternPlayer_stopAtTime", " enableTelemetry=YES ", (uint8_t *)&v25, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  char v15 = [WeakRetained checkEngineRunning:a4];

  if ((v15 & 1) == 0)
  {
    v22 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v23 = v22;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v23, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_stopAtTime", (const char *)&unk_1BA96A542, (uint8_t *)&v25, 2u);
    }

    goto LABEL_24;
  }
  BOOL v16 = [(AVHapticPlayerChannel *)self->_channel clearEvents:a4 error:a3];
  if (v16)
  {
    id v17 = objc_loadWeakRetained((id *)&self->super._engine);
    [v17 notifyPlayerStopped:self atTime:a3];

    id v18 = objc_loadWeakRetained((id *)&self->super._engine);
    __int16 v19 = [v18 metrics];
    [v19 handleActionForPlayer:self action:3 time:0 isAdvanced:a3];
  }
  int v20 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v21 = v20;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v21, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_stopAtTime", (const char *)&unk_1BA96A542, (uint8_t *)&v25, 2u);
  }

  return v16;
}

- (BOOL)sendParameters:(id)a3 atTime:(double)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      double v9 = *(id *)kHAPIScope;
      if (v9)
      {
        os_signpost_id_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v21 = 136316162;
          v22 = "CHHapticPatternPlayer.mm";
          __int16 v23 = 1024;
          int v24 = 248;
          __int16 v25 = 2080;
          v26 = "-[PatternPlayer sendParameters:atTime:error:]";
          __int16 v27 = 2048;
          int v28 = self;
          __int16 v29 = 2048;
          double v30 = a4;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending simple player %p parameters at time %.3f", (uint8_t *)&v21, 0x30u);
        }
      }
    }
  }
  if (a4 >= 0.0)
  {
    __int16 v12 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

    id v14 = CALog::Scope::oslog((id *)kHAPIScope);
    char v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PatternPlayer_sendParameters", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    if ([(PatternPlayerBase *)self needsResetForAction:1]
      && ![(AVHapticPlayerChannel *)self->_channel resetAtTime:a5 error:a4])
    {
      BOOL v11 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
      id v17 = +[CHHapticPattern eventListFromEvents:0 parameters:v8 parameterCurves:0 engine:WeakRetained privileged:0];

      BOOL v11 = [(AVHapticPlayerChannel *)self->_channel sendEvents:v17 atTime:a5 error:a4];
    }
    id v18 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v19 = v18;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v19, OS_SIGNPOST_INTERVAL_END, v13, "PatternPlayer_sendParameters", (const char *)&unk_1BA96A542, (uint8_t *)&v21, 2u);
    }
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 249, "-[PatternPlayer sendParameters:atTime:error:]", "time >= 0.0", -4840, a5);
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)cancelAndReturnError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    id v5 = *(id *)kHAPIScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315906;
    __int16 v23 = "CHHapticPatternPlayer.mm";
    __int16 v24 = 1024;
    int v25 = 271;
    __int16 v26 = 2080;
    __int16 v27 = "-[PatternPlayer cancelAndReturnError:]";
    __int16 v28 = 2048;
    __int16 v29 = self;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Cancelling events on simple player %p immediately", (uint8_t *)&v22, 0x26u);
  }

LABEL_8:
  objc_super v7 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  double v9 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PatternPlayer_cancelAndReturnError", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  char v13 = [WeakRetained checkEngineRunning:a3];

  if (v13)
  {
    BOOL v14 = [(AVHapticPlayerChannel *)self->_channel clearEvents:a3 error:0.0];
    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->super._engine);
      [v15 notifyPlayerStopped:self atTime:0.0];

      id v16 = objc_loadWeakRetained((id *)&self->super._engine);
      id v17 = [v16 metrics];
      [v17 handleActionForPlayer:self action:3 time:0 isAdvanced:0.0];
    }
    id v18 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v19 = v18;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v19, OS_SIGNPOST_INTERVAL_END, v8, "PatternPlayer_cancelAndReturnError", (const char *)&unk_1BA96A542, (uint8_t *)&v22, 2u);
    }
  }
  else
  {
    int v20 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v19 = v20;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v19, OS_SIGNPOST_INTERVAL_END, v8, "PatternPlayer_cancelAndReturnError", (const char *)&unk_1BA96A542, (uint8_t *)&v22, 2u);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (BOOL)scheduleParameterCurve:(id)a3 atTime:(double)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      double v9 = *(id *)kHAPIScope;
      if (v9)
      {
        os_signpost_id_t v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v30 = "CHHapticPatternPlayer.mm";
          __int16 v31 = 1024;
          int v32 = 288;
          __int16 v33 = 2080;
          double v34 = "-[PatternPlayer scheduleParameterCurve:atTime:error:]";
          __int16 v35 = 2048;
          __int16 v36 = self;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending player %p a parameter curve", buf, 0x26u);
        }
      }
    }
  }
  if (a4 >= 0.0)
  {
    __int16 v12 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

    BOOL v14 = CALog::Scope::oslog((id *)kHAPIScope);
    id v15 = v14;
    unint64_t v16 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PatternPlayer_scheduleParameterCurve", " enableTelemetry=YES ", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
    char v18 = [WeakRetained checkEngineRunning:a5];

    if (v18)
    {
      if ([(PatternPlayerBase *)self needsResetForAction:1]
        && ![(AVHapticPlayerChannel *)self->_channel resetAtTime:a5 error:a4])
      {
        BOOL v11 = 0;
      }
      else
      {
        [v8 relativeTime];
        double v20 = v19;
        [v8 setRelativeTime:0.0];
        id v28 = v8;
        int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        id v22 = objc_loadWeakRetained((id *)&self->super._engine);
        __int16 v23 = +[CHHapticPattern eventListFromEvents:0 parameters:0 parameterCurves:v21 engine:v22 privileged:0];

        BOOL v11 = [(AVHapticPlayerChannel *)self->_channel sendEvents:v23 atTime:a5 error:a4];
        [v8 setRelativeTime:v20];
      }
      __int16 v26 = CALog::Scope::oslog((id *)kHAPIScope);
      int v25 = v26;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v25, OS_SIGNPOST_INTERVAL_END, v13, "PatternPlayer_scheduleParameterCurve", (const char *)&unk_1BA96A542, buf, 2u);
      }
    }
    else
    {
      __int16 v24 = CALog::Scope::oslog((id *)kHAPIScope);
      int v25 = v24;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v25, OS_SIGNPOST_INTERVAL_END, v13, "PatternPlayer_scheduleParameterCurve", (const char *)&unk_1BA96A542, buf, 2u);
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 289, "-[PatternPlayer scheduleParameterCurve:atTime:error:]", "time >= 0.0", -4840, a5);
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)startAtTime:(double)a3 withImmediateParameters:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (kHAPIScope)
  {
    double v9 = *(id *)kHAPIScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    double v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v30 = 136316162;
    __int16 v31 = "CHHapticPatternPlayer.mm";
    __int16 v32 = 1024;
    int v33 = 317;
    __int16 v34 = 2080;
    __int16 v35 = "-[PatternPlayer startAtTime:withImmediateParameters:error:]";
    __int16 v36 = 2048;
    uint64_t v37 = self;
    __int16 v38 = 2048;
    double v39 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting simple player extended %p at time %.3f", (uint8_t *)&v30, 0x30u);
  }

LABEL_8:
  if (a3 >= 0.0)
  {
    BOOL v11 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);

    os_signpost_id_t v13 = CALog::Scope::oslog((id *)kHAPIScope);
    BOOL v14 = v13;
    unint64_t v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v30) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PatternPlayer_startAtTime_withImmediateParameters", " enableTelemetry=YES ", (uint8_t *)&v30, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
    char v17 = [WeakRetained checkEngineStateOnStart:a5];

    if (v17)
    {
      int muteState = self->super._muteState;
      if ((muteState - 1) <= 1)
      {
        [(PatternPlayer *)self doSetMute:muteState == 2];
        self->super._int muteState = newStateFromOld(self->super._muteState, muteState == 2, 1);
      }
      if ([(PatternPlayerBase *)self needsResetForAction:2]
        && ![(AVHapticPlayerChannel *)self->_channel resetAtTime:a5 error:a3])
      {
        LOBYTE(a5) = 0;
      }
      else
      {
        channel = self->_channel;
        events = self->super._events;
        int v21 = [(PatternPlayer *)self processImmediateParameters:v8];
        LODWORD(a5) = [(AVHapticPlayerChannel *)channel sendEvents:events withImmediateParameters:v21 atTime:a5 error:a3];

        if (a5)
        {
          id v22 = objc_loadWeakRetained((id *)&self->super._engine);
          LOBYTE(a5) = [v22 notifyPlayerStarted:self atTime:a3];

          id v23 = objc_loadWeakRetained((id *)&self->super._engine);
          __int16 v24 = [v23 metrics];
          int v25 = [(PatternPlayerBase *)self patternID];
          [v24 handleStartForPlayer:self time:0 isAdvanced:v25 patternID:a3];
        }
      }
      id v28 = CALog::Scope::oslog((id *)kHAPIScope);
      __int16 v27 = v28;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        LOWORD(v30) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v27, OS_SIGNPOST_INTERVAL_END, v12, "PatternPlayer_startAtTime_withImmediateParameters", (const char *)&unk_1BA96A542, (uint8_t *)&v30, 2u);
      }
    }
    else
    {
      __int16 v26 = CALog::Scope::oslog((id *)kHAPIScope);
      __int16 v27 = v26;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(v30) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v27, OS_SIGNPOST_INTERVAL_END, v12, "PatternPlayer_startAtTime_withImmediateParameters", (const char *)&unk_1BA96A542, (uint8_t *)&v30, 2u);
      }
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 318, "-[PatternPlayer startAtTime:withImmediateParameters:error:]", "time >= 0.0", -4840, a5);
    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)isMuted
{
  return (self->super._muteState & 0xFFFFFFFE) == 2;
}

- (void)setIsMuted:(BOOL)a3
{
  BOOL v3 = a3;
  int muteState = self->super._muteState;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  int v7 = newStateFromOld(muteState, v3, [WeakRetained running]);

  BOOL v8 = v7 == 0;
  self->super._int muteState = v7;
  BOOL v9 = muteState == 3 || v7 != 3;
  if (muteState != 3) {
    BOOL v8 = 0;
  }
  if (!v9 || v8)
  {
    [(PatternPlayer *)self doSetMute:v3];
  }
}

@end