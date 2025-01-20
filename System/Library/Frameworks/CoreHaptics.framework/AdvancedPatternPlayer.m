@interface AdvancedPatternPlayer
- (AdvancedPatternPlayer)init;
- (AdvancedPatternPlayer)initWithPattern:(id)a3 engine:(id)a4 privileged:(BOOL)a5 error:(id *)a6;
- (AdvancedPatternPlayer)initWithRingtoneData:(id)a3 engine:(id)a4 error:(id *)a5;
- (AdvancedPatternPlayer)initWithVibePatternDictionary:(id)a3 engine:(id)a4 error:(id *)a5;
- (BOOL)activateChannelByIndex:(unint64_t)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)cancelAndReturnError:(id *)a3;
- (BOOL)doResumeAtTime:(double)a3 error:(id *)a4;
- (BOOL)doStartFromPausedAtTime:(double)a3 error:(id *)a4;
- (BOOL)doStartFromStoppedAtTime:(double)a3 error:(id *)a4;
- (BOOL)earlyUnduckAudioAtTime:(double)a3 error:(id *)a4;
- (BOOL)isMuted;
- (BOOL)loopEnabled;
- (BOOL)pauseAtTime:(double)a3 error:(id *)a4;
- (BOOL)paused;
- (BOOL)resumeAtTime:(double)a3 error:(id *)a4;
- (BOOL)running;
- (BOOL)scheduleParameterCurve:(id)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)seekToOffset:(double)a3 error:(id *)a4;
- (BOOL)sendParameters:(id)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)setVolume:(float)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)startAtTime:(double)a3 error:(id *)a4;
- (BOOL)stopAtTime:(double)a3 error:(id *)a4;
- (double)loopEnd;
- (double)patternDuration;
- (double)seekOffset;
- (float)playbackRate;
- (id)completionHandler;
- (void)clearExternalResources:(id)a3;
- (void)dealloc;
- (void)doSetMute:(BOOL)a3;
- (void)finishInit;
- (void)resetState;
- (void)setCompletionHandler:(id)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setLoopEnabled:(BOOL)a3;
- (void)setLoopEnd:(double)a3;
- (void)setPaused;
- (void)setPlaybackRate:(float)a3;
- (void)setRunning;
- (void)setSeekOffset:(double)a3;
@end

@implementation AdvancedPatternPlayer

- (void)resetState
{
  self->_state = 0;
}

- (void)setRunning
{
  self->_state = 2;
}

- (void)setPaused
{
  self->_state = 1;
}

- (void)finishInit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(AVHapticSequence *)self->_sequence eventBehavior];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  int v5 = [WeakRetained muteHapticsWhileRecordingAudio];

  uint64_t v6 = 4;
  if (v5) {
    uint64_t v6 = 0;
  }
  [(AVHapticSequence *)self->_sequence setEventBehavior:v6 | v3 & 0xFFFFFFFFFFFFFFFBLL];
  objc_initWeak(&location, self);
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v14 = 1024;
    int v15 = 62;
    __int16 v16 = 2080;
    v17 = "-[AdvancedPatternPlayer finishInit]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting default completion handler on underlying AVHapticSequence", buf, 0x1Cu);
  }

LABEL_10:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__AdvancedPatternPlayer_finishInit__block_invoke;
  v9[3] = &unk_1E622DF00;
  objc_copyWeak(&v10, &location);
  [(AVHapticSequence *)self->_sequence setCompletionHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__AdvancedPatternPlayer_finishInit__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315906;
    uint64_t v6 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v7 = 1024;
    int v8 = 65;
    __int16 v9 = 2080;
    id v10 = "-[AdvancedPatternPlayer finishInit]_block_invoke";
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Player %p default completion handler called", (uint8_t *)&v5, 0x26u);
  }

LABEL_8:
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    [v4 setSeekOffset:0.0];
    [v4 resetState];
    objc_sync_exit(v4);
  }
}

- (AdvancedPatternPlayer)init
{
  return 0;
}

- (AdvancedPatternPlayer)initWithPattern:(id)a3 engine:(id)a4 privileged:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v41.receiver = self;
  v41.super_class = (Class)AdvancedPatternPlayer;
  id v12 = [(AdvancedPatternPlayer *)&v41 init];
  if (!v12) {
    goto LABEL_28;
  }
  uint64_t v13 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t spid = os_signpost_id_make_with_pointer(v13, v12);

  __int16 v14 = CALog::Scope::oslog((id *)kHAPIScope);
  int v15 = v14;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AdvancedPatternPlayer_initWithPattern", " enableTelemetry=YES ", buf, 2u);
  }

  if (kHAPIScope)
  {
    __int16 v16 = *(id *)kHAPIScope;
    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
    __int16 v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v43 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v44 = 1024;
    int v45 = 87;
    __int16 v46 = 2080;
    v47 = "-[AdvancedPatternPlayer initWithPattern:engine:privileged:error:]";
    __int16 v48 = 2048;
    v49 = v12;
    _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player %p", buf, 0x26u);
  }

LABEL_12:
  objc_storeWeak((id *)&v12->super._engine, v11);
  v12->super._muteState = 0;
  v12->_state = 0;
  v12->_seekOffset = 0.0;
  v12->super._previousAction = 0;
  v40 = [v10 resolveExternalResources:v11 error:a6];
  if (!v40)
  {

    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4824 userInfo:0];
      id v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  uint64_t v18 = [v10 parameters];
  v19 = [v10 parameterCurves];
  uint64_t v20 = +[CHHapticPattern eventListFromEvents:v40 parameters:v18 parameterCurves:v19 engine:v11 privileged:v7];
  events = v12->super._events;
  v12->super._events = (NSArray *)v20;

  if (![(NSArray *)v12->super._events count])
  {

LABEL_20:
    id v12 = 0;
    goto LABEL_24;
  }
  v22 = [AVHapticSequence alloc];
  v23 = v12->super._events;
  v24 = [v11 player];
  uint64_t v25 = [(AVHapticSequence *)v22 initWithEvents:v23 player:v24 error:a6];
  sequence = v12->_sequence;
  v12->_sequence = (AVHapticSequence *)v25;

  if (!v12->_sequence)
  {
    id v34 = v12;
    id v12 = 0;
    goto LABEL_22;
  }
  uint64_t v27 = [v10 patternID];
  patternID = v12->super._patternID;
  v12->super._patternID = (NSString *)v27;

  [(AVHapticSequence *)v12->_sequence duration];
  v12->super._patternDuration = v29;
  id WeakRetained = objc_loadWeakRetained((id *)&v12->super._engine);
  v31 = [WeakRetained metrics];
  [v31 handleInitForPlayer:v12 events:v12->super._events isAdvanced:1 patternID:v12->super._patternID];

  v32 = [v10 parameterCurves];
  BOOL v33 = [v32 count] == 0;

  if (!v33)
  {
    id v34 = objc_loadWeakRetained((id *)&v12->super._engine);
    v35 = [v34 metrics];
    [v35 handleParamCurveEncountered];

LABEL_22:
  }
  [(AdvancedPatternPlayer *)v12 patternDuration];
  -[AdvancedPatternPlayer setLoopEnd:](v12, "setLoopEnd:");
  [(AdvancedPatternPlayer *)v12 finishInit];
LABEL_24:
  v36 = CALog::Scope::oslog((id *)kHAPIScope);
  v37 = v36;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v37, OS_SIGNPOST_INTERVAL_END, spid, "AdvancedPatternPlayer_initWithPattern", (const char *)&unk_1BA96A542, buf, 2u);
  }

LABEL_28:
  return v12;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    id v3 = *(id *)kHAPIScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    int v8 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v9 = 1024;
    int v10 = 134;
    __int16 v11 = 2080;
    id v12 = "-[AdvancedPatternPlayer dealloc]";
    __int16 v13 = 2048;
    __int16 v14 = self;
    _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Destroying advanced player %p", buf, 0x26u);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  [(AdvancedPatternPlayer *)self clearExternalResources:WeakRetained];

  v6.receiver = self;
  v6.super_class = (Class)AdvancedPatternPlayer;
  [(AdvancedPatternPlayer *)&v6 dealloc];
}

- (void)doSetMute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    int v5 = *(id *)kHAPIScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    int v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = "un";
    *(_DWORD *)int v10 = 136316162;
    *(void *)&v10[4] = "CHHapticAdvancedPatternPlayer.mm";
    *(_WORD *)&v10[12] = 1024;
    *(_DWORD *)&v10[14] = 140;
    *(void *)&v10[20] = "-[AdvancedPatternPlayer doSetMute:]";
    *(_WORD *)&v10[18] = 2080;
    if (v3) {
      BOOL v7 = "";
    }
    *(_WORD *)&v10[28] = 2048;
    *(void *)&v10[30] = self;
    __int16 v11 = 2080;
    id v12 = v7;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Advanced player %p: Sending %smute params", v10, 0x30u);
  }

LABEL_10:
  if (v3) {
    float v8 = 1.0;
  }
  else {
    float v8 = 0.0;
  }
  -[AVHapticSequence setParameter:value:channel:atTime:error:](self->_sequence, "setParameter:value:channel:atTime:error:", 1014, 0, 0, COERCE_DOUBLE((unint64_t)LODWORD(v8)), 0.0, *(_OWORD *)v10, *(_OWORD *)&v10[16]);
  *(float *)&double v9 = v8;
  [(AVHapticSequence *)self->_sequence setParameter:2014 value:0 channel:0 atTime:v9 error:0.0];
  [(AVHapticSequence *)self->_sequence setIsMuted:v3];
}

- (void)clearExternalResources:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      int v5 = *(id *)kHAPIScope;
      if (v5)
      {
        id v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v13 = "CHHapticAdvancedPatternPlayer.mm";
          __int16 v14 = 1024;
          int v15 = 149;
          __int16 v16 = 2080;
          id v17 = "-[AdvancedPatternPlayer clearExternalResources:]";
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Clearing any externally-registered audio resources", buf, 0x1Cu);
        }
      }
    }
  }
  for (unint64_t i = 0; i < [(NSArray *)self->super._events count]; ++i)
  {
    float v8 = [(NSArray *)self->super._events objectAtIndexedSubscript:i];
    if (+[CHHapticEngine resourceIsRegistered:](CHHapticEngine, "resourceIsRegistered:", [v8 eventType]))
    {
      uint64_t v9 = [v8 eventType];
      int v10 = [v4 player];
      uint64_t v11 = 0;
      +[CHHapticEngine doUnregisterAudioResource:v9 fromPattern:1 player:v10 error:&v11];
    }
  }
}

- (BOOL)doStartFromStoppedAtTime:(double)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(PatternPlayerBase *)self engine];
  char v8 = [v7 checkEngineStateOnStart:a4];

  if ((v8 & 1) == 0) {
    return 0;
  }
  int muteState = self->super._muteState;
  if ((muteState - 1) <= 1)
  {
    BOOL v10 = muteState == 2;
    [(AdvancedPatternPlayer *)self doSetMute:muteState == 2];
    self->super._int muteState = newStateFromOld(self->super._muteState, v10, 1);
  }
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v11 = *(id *)kHAPIScope;
      if (v11)
      {
        id v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          [(AdvancedPatternPlayer *)self seekOffset];
          int v22 = 136315906;
          v23 = "CHHapticAdvancedPatternPlayer.mm";
          __int16 v24 = 1024;
          int v25 = 172;
          __int16 v26 = 2080;
          uint64_t v27 = "-[AdvancedPatternPlayer doStartFromStoppedAtTime:error:]";
          __int16 v28 = 2048;
          uint64_t v29 = v13;
          _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Starting sequence with offset %.3f", (uint8_t *)&v22, 0x26u);
        }
      }
    }
  }
  sequence = self->_sequence;
  [(AdvancedPatternPlayer *)self seekOffset];
  if (![(AVHapticSequence *)sequence playAtTime:a4 offset:a3 error:v15]) {
    return 0;
  }
  [(AdvancedPatternPlayer *)self setRunning];
  self->_seekOffset = 0.0;
  __int16 v16 = [(PatternPlayerBase *)self engine];
  char v17 = [v16 notifyPlayerStarted:self atTime:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  v19 = [WeakRetained metrics];
  uint64_t v20 = [(PatternPlayerBase *)self patternID];
  [v19 handleStartForPlayer:self time:1 isAdvanced:v20 patternID:a3];

  return v17;
}

- (BOOL)doStartFromPausedAtTime:(double)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v7 = *(id *)kHAPIScope;
      if (v7)
      {
        char v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          [(AdvancedPatternPlayer *)self seekOffset];
          int v16 = 136315906;
          char v17 = "CHHapticAdvancedPatternPlayer.mm";
          __int16 v18 = 1024;
          int v19 = 185;
          __int16 v20 = 2080;
          v21 = "-[AdvancedPatternPlayer doStartFromPausedAtTime:error:]";
          __int16 v22 = 2048;
          uint64_t v23 = v9;
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Restarting paused sequence with offset %.3f", (uint8_t *)&v16, 0x26u);
        }
      }
    }
  }
  if (![(AdvancedPatternPlayer *)self paused]) {
    -[AdvancedPatternPlayer doStartFromPausedAtTime:error:]();
  }
  sequence = self->_sequence;
  [(AdvancedPatternPlayer *)self seekOffset];
  BOOL v12 = [(AVHapticSequence *)sequence playAtTime:a4 offset:a3 error:v11];
  if (v12)
  {
    [(AdvancedPatternPlayer *)self setRunning];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
    __int16 v14 = [WeakRetained metrics];
    [v14 handleActionForPlayer:self action:2 time:1 isAdvanced:a3];
  }
  return v12;
}

- (BOOL)doResumeAtTime:(double)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(AdvancedPatternPlayer *)self paused]) {
    -[AdvancedPatternPlayer doResumeAtTime:error:]();
  }
  [(AdvancedPatternPlayer *)self seekOffset];
  if (v7 == 0.0) {
    goto LABEL_10;
  }
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v8 = *(id *)kHAPIScope;
      if (v8)
      {
        uint64_t v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          [(AdvancedPatternPlayer *)self seekOffset];
          int v16 = 136315906;
          char v17 = "CHHapticAdvancedPatternPlayer.mm";
          __int16 v18 = 1024;
          int v19 = 200;
          __int16 v20 = 2080;
          v21 = "-[AdvancedPatternPlayer doResumeAtTime:error:]";
          __int16 v22 = 2048;
          uint64_t v23 = v10;
          _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resuming paused sequence with offset %.3f", (uint8_t *)&v16, 0x26u);
        }
      }
    }
  }
  sequence = self->_sequence;
  [(AdvancedPatternPlayer *)self seekOffset];
  BOOL v12 = -[AVHapticSequence seekToTime:error:](sequence, "seekToTime:error:", a4);
  if (v12)
  {
LABEL_10:
    BOOL v12 = [(AVHapticSequence *)self->_sequence resumeAtTime:a4 error:a3];
    if (v12)
    {
      [(AdvancedPatternPlayer *)self setRunning];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
      __int16 v14 = [WeakRetained metrics];
      [v14 handleActionForPlayer:self action:2 time:1 isAdvanced:a3];

      LOBYTE(v12) = 1;
    }
  }
  return v12;
}

- (BOOL)startAtTime:(double)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    double v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    double v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v19 = 136316162;
    __int16 v20 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v21 = 1024;
    int v22 = 218;
    __int16 v23 = 2080;
    uint64_t v24 = "-[AdvancedPatternPlayer startAtTime:error:]";
    __int16 v25 = 2048;
    __int16 v26 = self;
    __int16 v27 = 2048;
    double v28 = a3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting player %p at time %.3f", (uint8_t *)&v19, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 219, "-[AdvancedPatternPlayer startAtTime:error:]", "time >= 0.0", -4840, a4);
    return 0;
  }
  if (!self->_sequence)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 220, "-[AdvancedPatternPlayer startAtTime:error:]", "_sequence != nil", -4812, a4);
    return 0;
  }
  uint64_t v9 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  double v11 = CALog::Scope::oslog((id *)kHAPIScope);
  BOOL v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AdvancedPatternPlayer_startAtTime", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  uint64_t v13 = self;
  objc_sync_enter(v13);
  if ([(PatternPlayerBase *)v13 needsResetForAction:2]
    && ![(AVHapticSequence *)self->_sequence resetAtTime:a4 error:a3])
  {
    BOOL v15 = 0;
  }
  else
  {
    if ([(AdvancedPatternPlayer *)v13 paused]) {
      BOOL v14 = [(AdvancedPatternPlayer *)v13 doStartFromPausedAtTime:a4 error:a3];
    }
    else {
      BOOL v14 = [(AdvancedPatternPlayer *)v13 doStartFromStoppedAtTime:a4 error:a3];
    }
    BOOL v15 = v14;
  }
  objc_sync_exit(v13);

  int v16 = CALog::Scope::oslog((id *)kHAPIScope);
  char v17 = v16;
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v16))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v17, OS_SIGNPOST_INTERVAL_END, v10, "AdvancedPatternPlayer_startAtTime", (const char *)&unk_1BA96A542, (uint8_t *)&v19, 2u);
  }

  return v15;
}

- (BOOL)stopAtTime:(double)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    double v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    double v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v26 = 136316162;
    __int16 v27 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v28 = 1024;
    int v29 = 238;
    __int16 v30 = 2080;
    v31 = "-[AdvancedPatternPlayer stopAtTime:error:]";
    __int16 v32 = 2048;
    BOOL v33 = self;
    __int16 v34 = 2048;
    double v35 = a3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Stopping player %p at time %.3f", (uint8_t *)&v26, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 239, "-[AdvancedPatternPlayer stopAtTime:error:]", "time >= 0.0", -4840, a4);
LABEL_26:
    LOBYTE(v17) = 0;
    return v17;
  }
  if (!self->_sequence)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 240, "-[AdvancedPatternPlayer stopAtTime:error:]", "_sequence != nil", -4812, a4);
    goto LABEL_26;
  }
  uint64_t v9 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  double v11 = CALog::Scope::oslog((id *)kHAPIScope);
  BOOL v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AdvancedPatternPlayer_stopAtTime", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
  }

  BOOL v14 = self;
  objc_sync_enter(v14);
  id WeakRetained = objc_loadWeakRetained((id *)&v14->super._engine);
  char v16 = [WeakRetained checkEngineRunning:a4];

  if ((v16 & 1) == 0)
  {
    __int16 v23 = CALog::Scope::oslog((id *)kHAPIScope);
    uint64_t v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v24, OS_SIGNPOST_INTERVAL_END, v10, "AdvancedPatternPlayer_stopAtTime", (const char *)&unk_1BA96A542, (uint8_t *)&v26, 2u);
    }

    objc_sync_exit(v14);
    goto LABEL_26;
  }
  BOOL v17 = [(AVHapticSequence *)self->_sequence stopAtTime:a4 error:a3];
  if (v17)
  {
    __int16 v18 = [(PatternPlayerBase *)v14 engine];
    [v18 notifyPlayerStopped:v14 atTime:a3];

    [(AdvancedPatternPlayer *)v14 resetState];
    id v19 = objc_loadWeakRetained((id *)&v14->super._engine);
    __int16 v20 = [v19 metrics];
    [v20 handleActionForPlayer:v14 action:3 time:1 isAdvanced:a3];
  }
  objc_sync_exit(v14);

  __int16 v21 = CALog::Scope::oslog((id *)kHAPIScope);
  int v22 = v21;
  if (v13 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v22, OS_SIGNPOST_INTERVAL_END, v10, "AdvancedPatternPlayer_stopAtTime", (const char *)&unk_1BA96A542, (uint8_t *)&v26, 2u);
  }

  return v17;
}

- (BOOL)sendParameters:(id)a3 atTime:(double)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 < 0.0)
  {
    int v9 = -4840;
    os_signpost_id_t v10 = "time >= 0.0";
    uint64_t v11 = 261;
LABEL_27:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", v11, "-[AdvancedPatternPlayer sendParameters:atTime:error:]", v10, v9, a5);
    BOOL v36 = 0;
    goto LABEL_37;
  }
  if (!self->_sequence)
  {
    int v9 = -4812;
    os_signpost_id_t v10 = "_sequence != nil";
    uint64_t v11 = 262;
    goto LABEL_27;
  }
  BOOL v12 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  BOOL v14 = CALog::Scope::oslog((id *)kHAPIScope);
  BOOL v15 = v14;
  os_signpost_id_t spid = v13;
  unint64_t v42 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AdvancedPatternPlayer_sendParameters", " enableTelemetry=YES ", buf, 2u);
  }

  char v16 = [(PatternPlayerBase *)self engine];
  [v16 currentTime];
  BOOL v18 = v17 > a4;

  if (v18)
  {
    id v19 = [(PatternPlayerBase *)self engine];
    [v19 currentTime];
    a4 = v20;
  }
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      __int16 v21 = *(id *)kHAPIScope;
      if (v21)
      {
        int v22 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          v49 = "CHHapticAdvancedPatternPlayer.mm";
          __int16 v50 = 1024;
          int v51 = 267;
          __int16 v52 = 2080;
          v53 = "-[AdvancedPatternPlayer sendParameters:atTime:error:]";
          __int16 v54 = 2048;
          v55 = self;
          __int16 v56 = 2048;
          double v57 = a4;
          _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending player %p parameters at time %.3f", buf, 0x30u);
        }
      }
    }
  }
  if ([(PatternPlayerBase *)self needsResetForAction:1]
    && ![(AVHapticSequence *)self->_sequence resetAtTime:a5 error:a4])
  {
    BOOL v36 = 0;
  }
  else
  {
    __int16 v23 = [(PatternPlayerBase *)self engine];
    uint64_t v24 = +[CHHapticPattern eventListFromEvents:0 parameters:v8 parameterCurves:0 engine:v23 privileged:0];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v26)
    {
      id v40 = v8;
      uint64_t v27 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(v25);
          }
          int v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          sequence = self->_sequence;
          uint64_t v31 = [v29 paramType];
          [v29 value];
          int v33 = v32;
          [v29 time];
          double v35 = a4 + v34;
          LODWORD(v34) = v33;
          if (![(AVHapticSequence *)sequence setParameter:v31 value:0 channel:a5 atTime:v34 error:v35])
          {
            BOOL v36 = 0;
            goto LABEL_29;
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v26) {
          continue;
        }
        break;
      }
      BOOL v36 = 1;
LABEL_29:
      id v8 = v40;
    }
    else
    {
      BOOL v36 = 1;
    }
  }
  v37 = CALog::Scope::oslog((id *)kHAPIScope);
  v38 = v37;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v38, OS_SIGNPOST_INTERVAL_END, spid, "AdvancedPatternPlayer_sendParameters", (const char *)&unk_1BA96A542, buf, 2u);
  }

LABEL_37:
  return v36;
}

- (BOOL)scheduleParameterCurve:(id)a3 atTime:(double)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (kHAPIScope)
  {
    id v8 = *(id *)kHAPIScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315650;
    BOOL v12 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v13 = 1024;
    int v14 = 292;
    __int16 v15 = 2080;
    char v16 = "-[AdvancedPatternPlayer scheduleParameterCurve:atTime:error:]";
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Parameter curves are not yet supported on CHHapticAdvancedPlayers", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (a4 >= 0.0)
  {
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
    }
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 293, "-[AdvancedPatternPlayer scheduleParameterCurve:atTime:error:]", "time >= 0.0", -4840, a5);
  }

  return 0;
}

- (BOOL)pauseAtTime:(double)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->super._engine);
  char v8 = [WeakRetained checkEngineRunning:a4];

  if ((v8 & 1) == 0) {
    goto LABEL_18;
  }
  if (![(AdvancedPatternPlayer *)v6 paused])
  {
    if (kHAPIScope)
    {
      os_signpost_id_t v10 = *(id *)kHAPIScope;
      if (!v10) {
        goto LABEL_11;
      }
    }
    else
    {
      os_signpost_id_t v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136316162;
      id v19 = "CHHapticAdvancedPatternPlayer.mm";
      __int16 v20 = 1024;
      int v21 = 306;
      __int16 v22 = 2080;
      __int16 v23 = "-[AdvancedPatternPlayer pauseAtTime:error:]";
      __int16 v24 = 2048;
      id v25 = v6;
      __int16 v26 = 2048;
      double v27 = a3;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pausing player %p at time %.3f", (uint8_t *)&v18, 0x30u);
    }

LABEL_11:
    if (a3 >= 0.0)
    {
      if (v6->_sequence)
      {
        id v15 = objc_loadWeakRetained((id *)&v6->super._engine);
        char v16 = [v15 metrics];
        [v16 handleActionForPlayer:v6 action:1 time:1 isAdvanced:a3];

        if ([(AVHapticSequence *)v6->_sequence pauseAtTime:a4 error:a3])
        {
          [(AdvancedPatternPlayer *)v6 setPaused];
          goto LABEL_3;
        }
LABEL_18:
        BOOL v9 = 0;
        goto LABEL_19;
      }
      int v12 = -4812;
      __int16 v13 = "_sequence != nil";
      uint64_t v14 = 308;
    }
    else
    {
      int v12 = -4840;
      __int16 v13 = "time >= 0.0";
      uint64_t v14 = 307;
    }
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", v14, "-[AdvancedPatternPlayer pauseAtTime:error:]", v13, v12, a4);
    goto LABEL_18;
  }
LABEL_3:
  BOOL v9 = 1;
LABEL_19:
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)resumeAtTime:(double)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->super._engine);
  char v8 = [WeakRetained checkEngineRunning:a4];

  if ((v8 & 1) == 0) {
    goto LABEL_17;
  }
  if (![(AdvancedPatternPlayer *)v6 paused])
  {
    char v10 = 1;
    goto LABEL_18;
  }
  if (!kHAPIScope)
  {
    BOOL v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    goto LABEL_8;
  }
  BOOL v9 = *(id *)kHAPIScope;
  if (v9)
  {
LABEL_8:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136316162;
      uint64_t v17 = "CHHapticAdvancedPatternPlayer.mm";
      __int16 v18 = 1024;
      int v19 = 328;
      __int16 v20 = 2080;
      int v21 = "-[AdvancedPatternPlayer resumeAtTime:error:]";
      __int16 v22 = 2048;
      __int16 v23 = v6;
      __int16 v24 = 2048;
      double v25 = a3;
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resuming player %p at time %.3f", (uint8_t *)&v16, 0x30u);
    }
  }
  if (a3 < 0.0)
  {
    int v12 = -4840;
    __int16 v13 = "time >= 0.0";
    uint64_t v14 = 329;
LABEL_16:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", v14, "-[AdvancedPatternPlayer resumeAtTime:error:]", v13, v12, a4);
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  if (!v6->_sequence)
  {
    int v12 = -4812;
    __int16 v13 = "_sequence != nil";
    uint64_t v14 = 330;
    goto LABEL_16;
  }
  char v10 = [(AdvancedPatternPlayer *)v6 doResumeAtTime:a4 error:a3];
LABEL_18:
  objc_sync_exit(v6);

  return v10;
}

- (BOOL)seekToOffset:(double)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if ([(AdvancedPatternPlayer *)v6 running] && ![(AdvancedPatternPlayer *)v6 paused])
  {
    if (kHAPIScope)
    {
      char v10 = *(id *)kHAPIScope;
      if (!v10)
      {
LABEL_18:
        char v9 = [(AVHapticSequence *)v6->_sequence seekToTime:a4 error:a3];
        a3 = 0.0;
        goto LABEL_19;
      }
    }
    else
    {
      char v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136316162;
      uint64_t v14 = "CHHapticAdvancedPatternPlayer.mm";
      __int16 v15 = 1024;
      int v16 = 347;
      __int16 v17 = 2080;
      __int16 v18 = "-[AdvancedPatternPlayer seekToOffset:error:]";
      __int16 v19 = 2048;
      __int16 v20 = v6;
      __int16 v21 = 2048;
      double v22 = a3;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Seeking on player %p to offset %.2f", (uint8_t *)&v13, 0x30u);
    }

    goto LABEL_18;
  }
  if (!kHAPIScope)
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  id v7 = *(id *)kHAPIScope;
  if (v7)
  {
LABEL_7:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136316162;
      uint64_t v14 = "CHHapticAdvancedPatternPlayer.mm";
      __int16 v15 = 1024;
      int v16 = 343;
      __int16 v17 = 2080;
      __int16 v18 = "-[AdvancedPatternPlayer seekToOffset:error:]";
      __int16 v19 = 2048;
      __int16 v20 = v6;
      __int16 v21 = 2048;
      double v22 = a3;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Caching player %p offset %.2f for later start/resume", (uint8_t *)&v13, 0x30u);
    }
  }
  char v9 = 1;
LABEL_19:
  v6->_seekOffset = a3;
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)cancelAndReturnError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    int v5 = *(id *)kHAPIScope;
    if (!v5) {
      return [(AVHapticSequence *)self->_sequence cancelAndReturnError:a3];
    }
  }
  else
  {
    int v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315906;
    char v9 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v10 = 1024;
    int v11 = 357;
    __int16 v12 = 2080;
    int v13 = "-[AdvancedPatternPlayer cancelAndReturnError:]";
    __int16 v14 = 2048;
    __int16 v15 = self;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Cancelling commands for player %p immediately", (uint8_t *)&v8, 0x26u);
  }

  return [(AVHapticSequence *)self->_sequence cancelAndReturnError:a3];
}

- (double)patternDuration
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(AdvancedPatternPlayer *)v2 paused];
  objc_sync_exit(v2);

  double v4 = 1800.0;
  if (!v3 && ![(AVHapticSequence *)v2->_sequence loopingEnabled])
  {
    double patternDuration = v2->super._patternDuration;
    [(AVHapticSequence *)v2->_sequence playbackRate];
    return patternDuration / v6;
  }
  return v4;
}

- (BOOL)running
{
  return self->_state == 2;
}

- (BOOL)paused
{
  return self->_state == 1;
}

- (BOOL)loopEnabled
{
  return [(AVHapticSequence *)self->_sequence loopingEnabled];
}

- (void)setLoopEnabled:(BOOL)a3
{
}

- (double)loopEnd
{
  return self->_loopEnd;
}

- (void)setLoopEnd:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    *(float *)&a3 = a3;
    if ([(AVHapticSequence *)self->_sequence setLoopLength:0 error:a3]) {
      self->_loopEnd = v3;
    }
  }
}

- (float)playbackRate
{
  [(AVHapticSequence *)self->_sequence playbackRate];
  return result;
}

- (void)setPlaybackRate:(float)a3
{
  if (a3 > 0.0) {
    -[AVHapticSequence setPlaybackRate:](self->_sequence, "setPlaybackRate:");
  }
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
    [(AdvancedPatternPlayer *)self doSetMute:v3];
  }
}

- (void)setCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHAPIScope)
  {
    id v5 = *(id *)kHAPIScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  int v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = (void *)MEMORY[0x1BA9F2D90](v4);
    *(_DWORD *)buf = 136315906;
    __int16 v17 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v18 = 1024;
    int v19 = 444;
    __int16 v20 = 2080;
    __int16 v21 = "-[AdvancedPatternPlayer setCompletionHandler:]";
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Wrapping client's completion handler block %p in our block and setting on underlying AVHapticSequence", buf, 0x26u);
  }
LABEL_8:
  BOOL v9 = (void *)MEMORY[0x1BA9F2D90](v4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v9;

  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke;
  v13[3] = &unk_1E622DF78;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v4;
  sequence = self->_sequence;
  id v12 = v4;
  [(AVHapticSequence *)sequence setCompletionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained engine];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E622DF28;
    id v7 = v5;
    id v15 = v7;
    id v17 = *(id *)(a1 + 32);
    id v16 = v3;
    [v6 dispatchOnLocal:v14];

    id v8 = v7;
    objc_sync_enter(v8);
    [v8 resetState];
    BOOL v9 = &v15;
    __int16 v10 = &v17;
    objc_sync_exit(v8);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_13;
    v11[3] = &unk_1E622DF50;
    id v13 = *(id *)(a1 + 32);
    id v12 = v3;
    +[CHHapticEngine dispatchOnGlobal:v11];
    BOOL v9 = &v13;
    __int16 v10 = &v12;
  }
}

void __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    id v2 = *(id *)kHAPIScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  id v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)MEMORY[0x1BA9F2D90](*(void *)(a1 + 48));
    int v9 = 136316162;
    __int16 v10 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v11 = 1024;
    int v12 = 452;
    __int16 v13 = 2080;
    id v14 = "-[AdvancedPatternPlayer setCompletionHandler:]_block_invoke_2";
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    __int16 v17 = 2048;
    __int16 v18 = v6;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Player %p client-supplied completion handler called - calling captured block %p on internal queue", (uint8_t *)&v9, 0x30u);
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v7 = [*(id *)(a1 + 32) engine];
  id v8 = [v7 metrics];
  [v8 handleActionForPlayer:*(void *)(a1 + 32) action:3 time:1 isAdvanced:0.0];
}

uint64_t __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    id v2 = *(id *)kHAPIScope;
    if (!v2) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  id v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)MEMORY[0x1BA9F2D90](*(void *)(a1 + 40));
    int v7 = 136315906;
    id v8 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v9 = 1024;
    int v10 = 463;
    __int16 v11 = 2080;
    int v12 = "-[AdvancedPatternPlayer setCompletionHandler:]_block_invoke";
    __int16 v13 = 2048;
    id v14 = v5;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied completion handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v7, 0x26u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)completionHandler
{
  id v2 = (void *)MEMORY[0x1BA9F2D90](self->_completionHandler, a2);

  return v2;
}

- (AdvancedPatternPlayer)initWithRingtoneData:(id)a3 engine:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AdvancedPatternPlayer;
  int v10 = [(AdvancedPatternPlayer *)&v26 init];
  if (v10)
  {
    __int16 v11 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v10);

    __int16 v13 = CALog::Scope::oslog((id *)kHAPIScope);
    id v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)double v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AdvancedPatternPlayer_initWithRingtoneData", " enableTelemetry=YES ", v25, 2u);
    }

    objc_storeWeak((id *)&v10->super._engine, v9);
    events = v10->super._events;
    v10->super._events = 0;

    uint64_t v16 = [AVHapticSequence alloc];
    __int16 v17 = [v9 player];
    uint64_t v18 = [(AVHapticSequence *)v16 initWithData:v8 player:v17 error:a5];
    sequence = v10->_sequence;
    v10->_sequence = (AVHapticSequence *)v18;

    __int16 v20 = v10->_sequence;
    if (v20)
    {
      [(AVHapticSequence *)v20 duration];
      v10->super._double patternDuration = v21;
      [(AdvancedPatternPlayer *)v10 finishInit];
    }
    else
    {

      int v10 = 0;
    }
    __int16 v22 = CALog::Scope::oslog((id *)kHAPIScope);
    uint64_t v23 = v22;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)double v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v23, OS_SIGNPOST_INTERVAL_END, v12, "AdvancedPatternPlayer_initWithRingtoneData", (const char *)&unk_1BA96A542, v25, 2u);
    }
  }
  return v10;
}

- (AdvancedPatternPlayer)initWithVibePatternDictionary:(id)a3 engine:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AdvancedPatternPlayer;
  int v10 = [(AdvancedPatternPlayer *)&v26 init];
  if (v10)
  {
    __int16 v11 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v10);

    __int16 v13 = CALog::Scope::oslog((id *)kHAPIScope);
    id v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)double v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AdvancedPatternPlayer_initWithVibePatternDictionary", " enableTelemetry=YES ", v25, 2u);
    }

    objc_storeWeak((id *)&v10->super._engine, v9);
    events = v10->super._events;
    v10->super._events = 0;

    v10->_state = 0;
    v10->_seekOffset = 0.0;
    v10->super._previousAction = 0;
    uint64_t v16 = [AVHapticSequence alloc];
    __int16 v17 = [v9 player];
    uint64_t v18 = [(AVHapticSequence *)v16 initWithDictionary:v8 player:v17 error:a5];
    sequence = v10->_sequence;
    v10->_sequence = (AVHapticSequence *)v18;

    __int16 v20 = v10->_sequence;
    if (v20)
    {
      [(AVHapticSequence *)v20 duration];
      v10->super._double patternDuration = v21;
      [(AdvancedPatternPlayer *)v10 finishInit];
    }
    else
    {

      int v10 = 0;
    }
    __int16 v22 = CALog::Scope::oslog((id *)kHAPIScope);
    uint64_t v23 = v22;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)double v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v23, OS_SIGNPOST_INTERVAL_END, v12, "AdvancedPatternPlayer_initWithVibePatternDictionary", (const char *)&unk_1BA96A542, v25, 2u);
    }
  }
  return v10;
}

- (BOOL)activateChannelByIndex:(unint64_t)a3 atTime:(double)a4 error:(id *)a5
{
  if (a4 >= 0.0)
  {
    sequence = self->_sequence;
    return -[AVHapticSequence activateChannelByIndex:atTime:error:](sequence, "activateChannelByIndex:atTime:error:", a3);
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 526, "-[AdvancedPatternPlayer activateChannelByIndex:atTime:error:]", "time >= 0.0", -4840, a5);
    return 0;
  }
}

- (BOOL)setVolume:(float)a3 atTime:(double)a4 error:(id *)a5
{
  if (a4 >= 0.0)
  {
    sequence = self->_sequence;
    return -[AVHapticSequence setVolume:atTime:error:](sequence, "setVolume:atTime:error:");
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 532, "-[AdvancedPatternPlayer setVolume:atTime:error:]", "time >= 0.0", -4840, a5);
    return 0;
  }
}

- (BOOL)earlyUnduckAudioAtTime:(double)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 538, "-[AdvancedPatternPlayer earlyUnduckAudioAtTime:error:]", "time >= 0.0", -4840, a4);
    return 0;
  }
  if (!kHAPIScope)
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  id v8 = *(id *)kHAPIScope;
  if (v8)
  {
LABEL_7:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136316162;
      __int16 v11 = "CHHapticAdvancedPatternPlayer.mm";
      __int16 v12 = 1024;
      int v13 = 539;
      __int16 v14 = 2080;
      uint64_t v15 = "-[AdvancedPatternPlayer earlyUnduckAudioAtTime:error:]";
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting player %p to early unduck audio at time %.3f", (uint8_t *)&v10, 0x30u);
    }
  }
  return [(AVHapticSequence *)self->_sequence earlyUnduckAudioAtTime:a4 error:a3];
}

- (double)seekOffset
{
  return self->_seekOffset;
}

- (void)setSeekOffset:(double)a3
{
  self->_seekOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_sequence, 0);
}

- (void)doStartFromPausedAtTime:error:.cold.1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v0 = 136315394;
    v1 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v2 = 1024;
    int v3 = 186;
    _os_log_impl(&dword_1BA902000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(self.paused) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
}

- (void)doResumeAtTime:error:.cold.1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v0 = 136315394;
    v1 = "CHHapticAdvancedPatternPlayer.mm";
    __int16 v2 = 1024;
    int v3 = 198;
    _os_log_impl(&dword_1BA902000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(self.paused) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
}

@end