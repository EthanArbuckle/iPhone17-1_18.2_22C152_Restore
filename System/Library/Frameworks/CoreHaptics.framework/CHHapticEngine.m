@interface CHHapticEngine
+ (BOOL)doUnregisterAudioResource:(unint64_t)a3 fromPattern:(BOOL)a4 player:(id)a5 error:(id *)a6;
+ (BOOL)resourceIsRegistered:(unint64_t)a3;
+ (BOOL)supports1stPartyHaptics;
+ (BOOL)supportsHapticServer;
+ (id)capabilitiesForHardware;
+ (unint64_t)doRegisterAudioResource:(id)a3 options:(id)a4 fromPattern:(BOOL)a5 player:(id)a6 error:(id *)a7;
+ (void)clearResourceMap;
+ (void)dispatchOnGlobal:(id)a3;
+ (void)initialize;
+ (void)lazyInitResourceMap;
- (AVAudioSession)avAudioSession;
- (AVHapticPlayer)player;
- (BOOL)activateAudioSessionOnStart;
- (BOOL)checkEngineRunning:(id *)a3;
- (BOOL)checkEngineStateOnStart:(id *)a3;
- (BOOL)doInit:(unsigned int)a3 sessionIsShared:(BOOL)a4 options:(id)a5 bypassAudioSession:(BOOL)a6 error:(id *)a7;
- (BOOL)doInitWithOptions:(id)a3 error:(id *)a4;
- (BOOL)doPlayPattern:(id)a3 error:(id *)a4;
- (BOOL)doReferenceAudioResourceByID:(unint64_t)a3;
- (BOOL)doStartEngineAndWait:(id *)a3;
- (BOOL)doStopEngineAndWait:(id *)a3;
- (BOOL)finishInit:(id *)a3;
- (BOOL)followAudioRoute;
- (BOOL)hasPublicAudioResourceID:(unint64_t)a3;
- (BOOL)highPriority;
- (BOOL)isAutoShutdownEnabled;
- (BOOL)isBehaviorSet:(unint64_t)a3;
- (BOOL)isMutedForAudio;
- (BOOL)isMutedForHaptics;
- (BOOL)isResourceLoopEnabled:(unint64_t)a3;
- (BOOL)muteHapticsWhileRecordingAudio;
- (BOOL)needsAudioPowerBudget;
- (BOOL)notifyPlayerStarted:(id)a3 atTime:(double)a4;
- (BOOL)playPatternFromData:(NSData *)data error:(NSError *)outError;
- (BOOL)playPatternFromURL:(NSURL *)fileURL error:(NSError *)outError;
- (BOOL)playsAudioOnly;
- (BOOL)playsHapticsOnly;
- (BOOL)resourceIsRegistered:(unint64_t)a3;
- (BOOL)running;
- (BOOL)sessionIsShared;
- (BOOL)setupEngineWithCategory:(id)a3 session:(id)a4 needsAudioPowerBudget:(BOOL)a5 error:(id *)a6;
- (BOOL)setupSystemSoundAudioSession:(id)a3 needsAudioPowerBudget:(BOOL)a4 error:(id *)a5;
- (BOOL)setupUnsharedAudioSession:(id)a3 isConstantVolume:(BOOL)a4 needsAudioPowerBudget:(BOOL)a5 error:(id *)a6;
- (BOOL)startAndReturnError:(NSError *)outError;
- (BOOL)unregisterAudioResource:(CHHapticAudioResourceID)resourceID error:(NSError *)outError;
- (CHHapticAudioResourceID)registerAudioResource:(NSURL *)resourceURL options:(NSDictionary *)options error:(NSError *)outError;
- (CHHapticEngine)init;
- (CHHapticEngine)initAndReturnError:(NSError *)error;
- (CHHapticEngine)initWithAudioSession:(AVAudioSession *)audioSession error:(NSError *)error;
- (CHHapticEngine)initWithAudioSession:(id)a3 sessionIsShared:(BOOL)a4 error:(id *)a5;
- (CHHapticEngine)initWithAudioSession:(id)a3 sessionIsShared:(BOOL)a4 options:(id)a5 error:(id *)a6;
- (CHHapticEngine)initWithAudioSessionID:(unsigned int)a3 error:(id *)a4;
- (CHHapticEngine)initWithAudioSessionID:(unsigned int)a3 options:(id)a4 error:(id *)a5;
- (CHHapticEngine)initWithOptions:(id)a3 error:(id *)a4;
- (CHHapticEngineResetHandler)resetHandler;
- (CHHapticEngineStoppedHandler)stoppedHandler;
- (CHMetrics)metrics;
- (HapticServerConfig)serverConfig;
- (NSArray)availableLocalities;
- (NSString)audioPowerUsage;
- (NSString)hapticPowerUsage;
- (NSString)locality;
- (NSString)priority;
- (NSString)usageCategory;
- (NSTimeInterval)currentTime;
- (OS_dispatch_source)timer;
- (__map_iterator<std::__tree_iterator<std::__value_type<unsigned)doFindPublicAudioResourceID:(unint64_t)a3;
- (double)autoShutdownTimeout;
- (double)getDurationForResource:(unint64_t)a3;
- (id).cxx_construct;
- (id)clientFinishedHandler;
- (id)createAdvancedPlayerWithPattern:(CHHapticPattern *)pattern error:(NSError *)outError;
- (id)createAdvancedPlayerWithRingtoneData:(id)a3 error:(id *)a4;
- (id)createAdvancedPlayerWithRingtonePattern:(id)a3 error:(id *)a4;
- (id)createAdvancedPlayerWithVibePatternDictionary:(id)a3 error:(id *)a4;
- (id)createHapticPlayerWithOptions:(id)a3;
- (id)createOptionsFromAudioSessionID:(unsigned int)a3 shared:(BOOL)a4 bypassAudioSession:(BOOL)a5;
- (id)createPlayerWithPattern:(CHHapticPattern *)pattern error:(NSError *)outError;
- (id)createPrivilegedPlayerWithPlayable:(id)a3 error:(id *)a4;
- (id)getAvailableChannel:(id *)a3;
- (id)getMetricsForPlayer:(id)a3;
- (id)getUsageCategory:(id)a3;
- (int64_t)getReporterIDFromAVAudioSession:(id)a3;
- (unint64_t)currentPlayerBehavior;
- (unint64_t)idForPublicAudioResourceURL:(id)a3 withOptions:(id)a4;
- (unsigned)audioSessionID;
- (unsigned)getSessionIDFromAVAudioSession:(id)a3;
- (void)addPublicAudioResourceID:(unint64_t)a3 withURL:(id)a4 options:(id)a5;
- (void)beginIdleTimer;
- (void)cancelIdleTimer;
- (void)connectAudioSession:(id)a3;
- (void)dealloc;
- (void)disconnectAudioSession:(id)a3;
- (void)dispatchOnLocal:(id)a3;
- (void)dispatchSyncOnLocal:(id)a3;
- (void)doStartWithCompletionHandler:(id)a3;
- (void)doStopWithCompletionHandler:(id)a3;
- (void)doUnregisterAllPublicAudioResources;
- (void)handleConnectionError;
- (void)handleFinish:(id)a3;
- (void)handleMediaServerDeath:(id)a3;
- (void)handleMediaServerRecovery:(id)a3;
- (void)notifyPlayerStopped:(id)a3 atTime:(double)a4;
- (void)notifyWhenPlayersFinished:(CHHapticEngineFinishedHandler)finishedHandler;
- (void)prewarmWithCompletionHandler:(id)a3;
- (void)reconfigureAudioSession;
- (void)releaseChannel:(id)a3;
- (void)removePublicAudioResourceID:(unint64_t)a3;
- (void)setActivateAudioSessionOnStart:(BOOL)a3;
- (void)setAutoShutdownEnabled:(BOOL)autoShutdownEnabled;
- (void)setAutoShutdownTimeout:(double)a3;
- (void)setClientFinishedHandler:(id)a3;
- (void)setCurrentPlayerBehavior:(unint64_t)a3;
- (void)setFollowAudioRoute:(BOOL)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setIsMutedForAudio:(BOOL)isMutedForAudio;
- (void)setIsMutedForHaptics:(BOOL)isMutedForHaptics;
- (void)setMetricsTestModeEnabled;
- (void)setMuteHapticsWhileRecordingAudio:(BOOL)a3;
- (void)setPlaysAudioOnly:(BOOL)playsAudioOnly;
- (void)setPlaysHapticsOnly:(BOOL)playsHapticsOnly;
- (void)setResetHandler:(CHHapticEngineResetHandler)resetHandler;
- (void)setRunning:(BOOL)a3;
- (void)setStoppedHandler:(CHHapticEngineStoppedHandler)stoppedHandler;
- (void)setTimer:(id)a3;
- (void)startIdleTimerWithHandler:(id)a3;
- (void)startWithCompletionHandler:(CHHapticCompletionHandler)completionHandler;
- (void)stopAndWait;
- (void)stopPrewarm;
- (void)stopWithCompletionHandler:(CHHapticCompletionHandler)completionHandler;
- (void)storeOptions:(id)a3;
- (void)toggleBehavior:(unint64_t)a3 set:(BOOL)a4;
- (void)updateAudioConfigurations:(id)a3 session:(id)a4;
- (void)updateEngineBehavior;
- (void)updateEngineBehaviorWithError:(id *)a3;
@end

@implementation CHHapticEngine

+ (BOOL)supportsHapticServer
{
  return +[AVHapticPlayer supportsHaptics];
}

+ (BOOL)supports1stPartyHaptics
{
  return +[CHHapticEngine supportsHapticServer];
}

+ (void)initialize
{
}

- (void)setStoppedHandler:(CHHapticEngineStoppedHandler)stoppedHandler
{
}

- (void)setResetHandler:(CHHapticEngineResetHandler)resetHandler
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

void __58__CHHapticEngine_CHHapticEngineInternal__dispatchOnLocal___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      v1 = *(id *)kHAPIScope;
      if (v1)
      {
        v2 = v1;
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        {
          int v3 = 136315650;
          v4 = "CHHapticEngine.mm";
          __int16 v5 = 1024;
          int v6 = 1913;
          __int16 v7 = 2080;
          v8 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchOnLocal:]_block_invoke";
          _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Block async dispatch complete>", (uint8_t *)&v3, 0x1Cu);
        }
      }
    }
  }
}

void __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) metrics];
  [v1 handleEngineStart];
}

void __45__CHHapticEngine_startWithCompletionHandler___block_invoke_217(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) running])
  {
    if (kHAPIScope)
    {
      v2 = *(id *)kHAPIScope;
      if (!v2) {
        goto LABEL_12;
      }
    }
    else
    {
      v2 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "CHHapticEngine.mm";
      __int16 v13 = 1024;
      int v14 = 1240;
      __int16 v15 = 2080;
      v16 = "-[CHHapticEngine startWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine already running", (uint8_t *)&v11, 0x1Cu);
    }

LABEL_12:
    if (!*(void *)(a1 + 40))
    {
LABEL_21:
      v8 = CALog::Scope::oslog((id *)kHAPIScope);
      uint64_t v9 = v8;
      os_signpost_id_t v10 = *(void *)(a1 + 48);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        LOWORD(v11) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v9, OS_SIGNPOST_INTERVAL_END, v10, "HapticEngine_startWithCompletionHandler", (const char *)&unk_1BA96A542, (uint8_t *)&v11, 2u);
      }

      return;
    }
    if (kHAPIScope)
    {
      int v6 = *(id *)kHAPIScope;
      if (!v6)
      {
LABEL_20:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_21;
      }
    }
    else
    {
      int v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "CHHapticEngine.mm";
      __int16 v13 = 1024;
      int v14 = 1242;
      __int16 v15 = 2080;
      v16 = "-[CHHapticEngine startWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Directly calling start completionHandler on internal queue", (uint8_t *)&v11, 0x1Cu);
    }

    goto LABEL_20;
  }
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  [v3 doStartWithCompletionHandler:v4];
}

- (BOOL)running
{
  return self->_running;
}

- (CHMetrics)metrics
{
  return self->_metrics;
}

- (void)doStartWithCompletionHandler:(id)a3
{
  v18[2] = *(id *)MEMORY[0x1E4F143B8];
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
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1185;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[CHHapticEngine doStartWithCompletionHandler:]";
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Starting underlying Haptic Player", buf, 0x1Cu);
  }

LABEL_8:
  [(CHHapticEngine *)self setRunning:1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  v18[0] = 0;
  id obj = 0;
  [(CHHapticEngine *)self updateEngineBehaviorWithError:&obj];
  objc_storeStrong(v18, obj);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E622E640;
  v13[4] = self;
  [(CHHapticEngine *)self dispatchOnLocal:v13];
  [(CHHapticEngine *)self reconfigureAudioSession];
  player = self->_player;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E622E780;
  objc_copyWeak(&v12, &location);
  int v11 = buf;
  id v8 = v4;
  id v10 = v8;
  [(AVHapticPlayer *)player startRunningWithCompletionHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (void)updateEngineBehaviorWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315906;
    uint64_t v9 = "CHHapticEngine.mm";
    __int16 v10 = 1024;
    int v11 = 861;
    __int16 v12 = 2080;
    __int16 v13 = "-[CHHapticEngine updateEngineBehaviorWithError:]";
    __int16 v14 = 1024;
    int v15 = [(CHHapticEngine *)self currentPlayerBehavior];
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Setting player's behavior to 0x%x", (uint8_t *)&v8, 0x22u);
  }

LABEL_8:
  [(AVHapticPlayer *)self->_player setBehavior:[(CHHapticEngine *)self currentPlayerBehavior] error:a3];
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void)startWithCompletionHandler:(CHHapticCompletionHandler)completionHandler
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CHHapticCompletionHandler v4 = completionHandler;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "CHHapticEngine.mm";
    __int16 v24 = 1024;
    int v25 = 1235;
    __int16 v26 = 2080;
    v27 = "-[CHHapticEngine startWithCompletionHandler:]";
    __int16 v28 = 2048;
    v29 = self;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p", buf, 0x26u);
  }

LABEL_8:
  if (self->_player)
  {
    id v7 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

    uint64_t v9 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_startWithCompletionHandler", " enableTelemetry=YES ", buf, 2u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__CHHapticEngine_startWithCompletionHandler___block_invoke_217;
    v15[3] = &unk_1E622E7A8;
    v15[4] = self;
    id v16 = v4;
    os_signpost_id_t v17 = v8;
    [(CHHapticEngine *)self dispatchOnLocal:v15];
    int v11 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_startWithCompletionHandler", (const char *)&unk_1BA96A542, buf, 2u);
    }
  }
  else
  {
    id v21 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1236, "-[CHHapticEngine startWithCompletionHandler:]", "_player != nil", -4810, &v21);
    id v13 = v21;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__CHHapticEngine_startWithCompletionHandler___block_invoke;
    id v18[3] = &unk_1E622DF50;
    id v19 = v13;
    id v20 = v4;
    id v14 = v13;
    [(CHHapticEngine *)self dispatchOnLocal:v18];
  }
}

- (void)dispatchOnLocal:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
          id v7 = (void *)MEMORY[0x1BA9F2D90](v4);
          *(_DWORD *)buf = 136315906;
          id v13 = "CHHapticEngine.mm";
          __int16 v14 = 1024;
          int v15 = 1909;
          __int16 v16 = 2080;
          os_signpost_id_t v17 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchOnLocal:]";
          __int16 v18 = 2048;
          id v19 = v7;
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Dispatching block %p async...>", buf, 0x26u);
        }
      }
    }
  }
  if (in_dispatch_sync == 1) {
    -[CHHapticEngine(CHHapticEngineInternal) dispatchOnLocal:]();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CHHapticEngine_CHHapticEngineInternal__dispatchOnLocal___block_invoke;
  block[3] = &unk_1E622E180;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)reconfigureAudioSession
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_usageCategory isEqualToString:@"SystemSound"])
  {
    int v3 = [(CHHapticEngine *)self avAudioSession];
    char v4 = [v3 setCategory:*MEMORY[0x1E4F4E800] withOptions:2 error:0];

    if ((v4 & 1) == 0)
    {
      if (kHAPIScope)
      {
        id v5 = *(id *)kHAPIScope;
        if (!v5) {
          return;
        }
      }
      else
      {
        id v5 = MEMORY[0x1E4F14500];
        id v6 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315650;
        os_signpost_id_t v8 = "CHHapticEngine.mm";
        __int16 v9 = 1024;
        int v10 = 1094;
        __int16 v11 = 2080;
        __int16 v12 = "-[CHHapticEngine reconfigureAudioSession]";
        _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot reconfigure audio session for system sound", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
}

- (void)updateEngineBehavior
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    id v3 = *(id *)kHAPIScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  id v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    int v7 = "CHHapticEngine.mm";
    __int16 v8 = 1024;
    int v9 = 855;
    __int16 v10 = 2080;
    __int16 v11 = "-[CHHapticEngine updateEngineBehavior]";
    __int16 v12 = 1024;
    int v13 = [(CHHapticEngine *)self currentPlayerBehavior];
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Setting player's behavior to 0x%x", (uint8_t *)&v6, 0x22u);
  }

LABEL_8:
  [(AVHapticPlayer *)self->_player setBehavior:[(CHHapticEngine *)self currentPlayerBehavior]];
}

- (unint64_t)currentPlayerBehavior
{
  return self->_currentPlayerBehavior;
}

- (void)setPlaysHapticsOnly:(BOOL)playsHapticsOnly
{
  BOOL v3 = playsHapticsOnly;
  id v7 = [(CHHapticEngine *)self serverConfig];
  if ([v7 supportsHapticPlayback])
  {
    id v5 = [(CHHapticEngine *)self serverConfig];
    int v6 = [v5 supportsAudioPlayback];

    if (v6)
    {
      [(CHHapticEngine *)self toggleBehavior:1 set:v3];
    }
  }
  else
  {
  }
}

- (BOOL)doInit:(unsigned int)a3 sessionIsShared:(BOOL)a4 options:(id)a5 bypassAudioSession:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  uint64_t v10 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  if (kHAPIScope)
  {
    int v13 = *(id *)kHAPIScope;
    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
    int v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v32 = 136316418;
    v33 = "CHHapticEngine.mm";
    __int16 v34 = 1024;
    int v35 = 939;
    __int16 v36 = 2080;
    v37 = "-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:]";
    __int16 v38 = 1024;
    int v39 = v10;
    __int16 v40 = 1024;
    BOOL v41 = v9;
    __int16 v42 = 2112;
    id v43 = v12;
    _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: sessionID: %u, isShared: %u options: '%@'", (uint8_t *)&v32, 0x32u);
  }

LABEL_8:
  if (v10 || v8)
  {
    __int16 v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    os_signpost_id_t v17 = (OS_dispatch_queue *)dispatch_queue_create("CHHapticEngineDispatchQueue", v16);
    dispatchQueue = self->_dispatchQueue;
    self->_dispatchQueue = v17;

    self->_audioSessionID = v10;
    self->_sessionIsShared = v9;
    id v19 = [(CHHapticEngine *)self createOptionsFromAudioSessionID:v10 shared:v9 bypassAudioSession:v8];
    uint64_t v20 = [(CHHapticEngine *)self createHapticPlayerWithOptions:v19];
    player = self->_player;
    self->_player = v20;

    self->_runTimeout = 120.0;
    if (!v12)
    {
      id v12 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    v22 = [[HapticServerConfig alloc] initWithHapticPlayer:self->_player withOptions:v12 error:a7];
    serverConfig = self->_serverConfig;
    self->_serverConfig = v22;

    if (!self->_serverConfig)
    {
      BOOL v30 = 0;
LABEL_29:

      goto LABEL_31;
    }
    self->_currentPlayerBehavior = 2;
    __int16 v24 = [(CHHapticEngine *)self serverConfig];
    char v25 = [v24 supportsHapticPlayback];

    if (v25)
    {
      __int16 v26 = [(CHHapticEngine *)self serverConfig];
      char v27 = [v26 supportsAudioPlayback];

      if (v27)
      {
LABEL_28:
        BOOL v30 = [(CHHapticEngine *)self finishInit:a7];
        goto LABEL_29;
      }
      unint64_t v28 = 1;
    }
    else
    {
      unint64_t v28 = self->_currentPlayerBehavior | 0x10;
    }
    self->_currentPlayerBehavior = v28;
    goto LABEL_28;
  }
  if (!kHAPIScope)
  {
    int v15 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
    goto LABEL_20;
  }
  int v15 = *(id *)kHAPIScope;
  if (v15)
  {
LABEL_20:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v32 = 136315906;
      v33 = "CHHapticEngine.mm";
      __int16 v34 = 1024;
      int v35 = 942;
      __int16 v36 = 2080;
      v37 = "-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:]";
      __int16 v38 = 1024;
      int v39 = 0;
      _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid audio session ID: %u", (uint8_t *)&v32, 0x22u);
    }
  }
  if (a7)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4815 userInfo:0];
    BOOL v30 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_31:

  return v30;
}

- (HapticServerConfig)serverConfig
{
  return (HapticServerConfig *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)finishInit:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = __Block_byref_object_copy__3;
  __int16 v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __29__CHHapticEngine_finishInit___block_invoke;
  v34[3] = &unk_1E622DF00;
  objc_copyWeak(&v35, &location);
  id v5 = [(CHHapticEngine *)self player];
  [v5 setConnectionErrorHandler:v34];

  int v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v44 = "CHHapticEngine.mm";
    __int16 v45 = 1024;
    int v46 = 654;
    __int16 v47 = 2080;
    v48 = "-[CHHapticEngine finishInit:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Allocating resources...", buf, 0x1Cu);
  }

LABEL_8:
  BOOL v9 = [(CHHapticEngine *)self player];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __29__CHHapticEngine_finishInit___block_invoke_181;
  v31[3] = &unk_1E622E690;
  v33 = &v36;
  uint64_t v10 = v6;
  int v32 = v10;
  [v9 allocateRenderResourcesWithCompletionHandler:v31];

  if (kHAPIScope)
  {
    __int16 v11 = *(id *)kHAPIScope;
    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v44 = "CHHapticEngine.mm";
    __int16 v45 = 1024;
    int v46 = 663;
    __int16 v47 = 2080;
    v48 = "-[CHHapticEngine finishInit:]";
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Waiting for server...", buf, 0x1Cu);
  }

LABEL_15:
  dispatch_time_t v13 = dispatch_time(0, 4000000000);
  if (!dispatch_group_wait(v10, v13)) {
    goto LABEL_24;
  }
  if (!kHAPIScope)
  {
    id v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    goto LABEL_20;
  }
  id v14 = *(id *)kHAPIScope;
  if (v14)
  {
LABEL_20:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v44 = "CHHapticEngine.mm";
      __int16 v45 = 1024;
      int v46 = 666;
      __int16 v47 = 2080;
      v48 = "-[CHHapticEngine finishInit:]";
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server timeout", buf, 0x1Cu);
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4810 userInfo:0];
  os_signpost_id_t v17 = (void *)v37[5];
  v37[5] = v16;

LABEL_24:
  if (a3) {
    *a3 = (id) v37[5];
  }
  uint64_t v18 = v37[5];
  if (!v18)
  {
    BOOL v19 = [(CHHapticEngine *)self sessionIsShared];
    if (v19)
    {
      if (kHAPIScope)
      {
        uint64_t v20 = *(id *)kHAPIScope;
        if (!v20) {
          goto LABEL_42;
        }
      }
      else
      {
        uint64_t v20 = MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v44 = "CHHapticEngine.mm";
        __int16 v45 = 1024;
        int v46 = 676;
        __int16 v47 = 2080;
        v48 = "-[CHHapticEngine finishInit:]";
        v22 = "%25s:%-5d %s: Default behavior is to follow audio route";
LABEL_40:
        _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_DEBUG, v22, buf, 0x1Cu);
      }
    }
    else
    {
      if (kHAPIScope)
      {
        uint64_t v20 = *(id *)kHAPIScope;
        if (!v20)
        {
LABEL_42:
          [(CHHapticEngine *)self setFollowAudioRoute:v19];
          [(CHHapticEngine *)self updateEngineBehavior];
          objc_storeWeak(&location, self);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __29__CHHapticEngine_finishInit___block_invoke_182;
          v29[3] = &unk_1E622E6B8;
          objc_copyWeak(&v30, &location);
          __int16 v24 = (void *)MEMORY[0x1BA9F2D90](v29);
          char v25 = [(CHHapticEngine *)self player];
          [v25 setStopRunningHandler:v24];

          if (kHAPIScope)
          {
            __int16 v26 = *(id *)kHAPIScope;
            if (!v26)
            {
LABEL_49:

              objc_destroyWeak(&v30);
              goto LABEL_50;
            }
          }
          else
          {
            __int16 v26 = MEMORY[0x1E4F14500];
            id v27 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v44 = "CHHapticEngine.mm";
            __int16 v45 = 1024;
            int v46 = 720;
            __int16 v47 = 2080;
            v48 = "-[CHHapticEngine finishInit:]";
            _os_log_impl(&dword_1BA902000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Finished initializing", buf, 0x1Cu);
          }

          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v20 = MEMORY[0x1E4F14500];
        id v23 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v44 = "CHHapticEngine.mm";
        __int16 v45 = 1024;
        int v46 = 681;
        __int16 v47 = 2080;
        v48 = "-[CHHapticEngine finishInit:]";
        v22 = "%25s:%-5d %s: Setting behavior to not follow audio route";
        goto LABEL_40;
      }
    }

    goto LABEL_42;
  }
LABEL_50:

  objc_destroyWeak(&v35);
  _Block_object_dispose(&v36, 8);

  objc_destroyWeak(&location);
  return v18 == 0;
}

- (AVHapticPlayer)player
{
  return self->_player;
}

- (void)setFollowAudioRoute:(BOOL)a3
{
}

- (BOOL)sessionIsShared
{
  return self->_sessionIsShared;
}

- (id)createOptionsFromAudioSessionID:(unsigned int)a3 shared:(BOOL)a4 bypassAudioSession:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  BOOL v9 = [NSNumber numberWithBool:v6];
  uint64_t v10 = [NSNumber numberWithBool:v5];
  __int16 v11 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"AudioSessionID", v9, @"AudioSessionIsShared", v10, @"BypassAudioSession", 0);

  return v11;
}

- (id)createHapticPlayerWithOptions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!kHAPIScope)
  {
    id v4 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
    goto LABEL_5;
  }
  id v4 = *(id *)kHAPIScope;
  if (v4)
  {
LABEL_5:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v23 = "CHHapticEngine.mm";
      __int16 v24 = 1024;
      int v25 = 618;
      __int16 v26 = 2080;
      id v27 = "-[CHHapticEngine createHapticPlayerWithOptions:]";
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating underlying Haptic Player", buf, 0x1Cu);
    }
  }
  unsigned int v7 = 0;
  id v8 = 0;
  BOOL v9 = 0;
  uint64_t v10 = MEMORY[0x1E4F14500];
  *(void *)&long long v5 = 136315906;
  long long v20 = v5;
  do
  {
    if (v7)
    {
      if (kHAPIScope)
      {
        __int16 v11 = *(id *)kHAPIScope;
        if (!v11) {
          goto LABEL_17;
        }
      }
      else
      {
        id v12 = v10;
        __int16 v11 = v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v20;
        id v23 = "CHHapticEngine.mm";
        __int16 v24 = 1024;
        int v25 = 623;
        __int16 v26 = 2080;
        id v27 = "-[CHHapticEngine createHapticPlayerWithOptions:]";
        __int16 v28 = 1024;
        LODWORD(v29) = v7;
        _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Attempt #%d...", buf, 0x22u);
      }
    }
LABEL_17:
    dispatch_time_t v13 = [AVHapticPlayer alloc];
    id v21 = v9;
    id v14 = [(AVHapticPlayer *)v13 initWithOptions:v3 error:&v21];
    id v15 = v21;

    if (v7 > 4) {
      break;
    }
    ++v7;
    id v8 = v14;
    BOOL v9 = v15;
  }
  while (v15);
  if (v15)
  {
    if (kHAPIScope)
    {
      uint64_t v16 = *(id *)kHAPIScope;
      if (!v16) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v16 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v20;
      id v23 = "CHHapticEngine.mm";
      __int16 v24 = 1024;
      int v25 = 627;
      __int16 v26 = 2080;
      id v27 = "-[CHHapticEngine createHapticPlayerWithOptions:]";
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server failure: %@", buf, 0x26u);
    }

LABEL_28:
    Haptic_RaiseException(&cfstr_Chhapticerrorc.isa, &cfstr_FailedToConnec.isa, objc_msgSend(v15, "code", v20));
  }
  os_signpost_id_t v17 = v14;

  return v17;
}

- (void)stopWithCompletionHandler:(CHHapticCompletionHandler)completionHandler
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CHHapticCompletionHandler v4 = completionHandler;
  if (kHAPIScope)
  {
    long long v5 = *(id *)kHAPIScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    long long v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "CHHapticEngine.mm";
    __int16 v25 = 1024;
    int v26 = 1364;
    __int16 v27 = 2080;
    __int16 v28 = "-[CHHapticEngine stopWithCompletionHandler:]";
    __int16 v29 = 2048;
    uint64_t v30 = self;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p", buf, 0x26u);
  }

LABEL_8:
  if (self->_player)
  {
    unsigned int v7 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

    BOOL v9 = CALog::Scope::oslog((id *)kHAPIScope);
    uint64_t v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_stopWithCompletionHandler", " enableTelemetry=YES ", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __44__CHHapticEngine_stopWithCompletionHandler___block_invoke_220;
    v16[3] = &unk_1E622E820;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v4;
    [(CHHapticEngine *)self dispatchOnLocal:v16];
    __int16 v11 = CALog::Scope::oslog((id *)kHAPIScope);
    id v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)id v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_stopWithCompletionHandler", (const char *)&unk_1BA96A542, v15, 2u);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v22 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1365, "-[CHHapticEngine stopWithCompletionHandler:]", "_player != nil", -4810, &v22);
    id v13 = v22;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__CHHapticEngine_stopWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E622DF50;
    id v20 = v13;
    id v21 = v4;
    id v14 = v13;
    [(CHHapticEngine *)self dispatchOnLocal:v19];
  }
}

- (void)prewarmWithCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  unsigned int v7 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HapticEngine_prewarmWithCompletionHandler", " enableTelemetry=YES ", buf, 2u);
  }

  *(void *)buf = 0;
  id v20 = buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  id v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  id obj = 0;
  [(CHHapticEngine *)self updateEngineBehaviorWithError:&obj];
  objc_storeStrong(&v24, obj);
  if (kHAPIScope)
  {
    BOOL v9 = *(id *)kHAPIScope;
    if (!v9) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v25 = 136315650;
    int v26 = "CHHapticEngine.mm";
    __int16 v27 = 1024;
    int v28 = 1158;
    __int16 v29 = 2080;
    uint64_t v30 = "-[CHHapticEngine prewarmWithCompletionHandler:]";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Prewarming the underlying Haptic Player", v25, 0x1Cu);
  }

LABEL_11:
  player = self->_player;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__CHHapticEngine_prewarmWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E622E730;
  id v17 = buf;
  id v12 = v4;
  id v16 = v12;
  [(AVHapticPlayer *)player prewarmWithCompletionHandler:v15];
  id v13 = CALog::Scope::oslog((id *)kHAPIScope);
  id v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int16 v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v14, OS_SIGNPOST_INTERVAL_END, v6, "HapticEngine_prewarmWithCompletionHandler", (const char *)&unk_1BA96A542, v25, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (CHHapticEngine)initWithAudioSession:(id)a3 sessionIsShared:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (setupHapticLogScopes(void)::once != -1) {
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  }
  id v12 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  id v14 = CALog::Scope::oslog((id *)kHAPIScope);
  id v15 = v14;
  os_signpost_id_t spid = v13;
  unint64_t v16 = v13 - 1;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "HapticEngine_initWithAudioSession", " enableTelemetry=YES ", buf, 2u);
  }

  v49.receiver = self;
  v49.super_class = (Class)CHHapticEngine;
  id v17 = [(CHHapticEngine *)&v49 init];
  if (!v17) {
    goto LABEL_68;
  }
  if (kHAPIScope)
  {
    id v18 = *(id *)kHAPIScope;
    if (!v18) {
      goto LABEL_16;
    }
  }
  else
  {
    id v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = "unshared";
    *(_DWORD *)buf = 136316418;
    v51 = "CHHapticEngine.mm";
    __int16 v52 = 1024;
    int v53 = 1457;
    v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
    __int16 v54 = 2080;
    if (v8) {
      id v20 = "shared";
    }
    __int16 v56 = 2048;
    v57 = v17;
    __int16 v58 = 2080;
    v59 = v20;
    __int16 v60 = 2048;
    id v61 = v10;
    _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with %s audio session %p", buf, 0x3Au);
  }

LABEL_16:
  if (v10 && v8)
  {
    if (kHAPIScope)
    {
      uint64_t v21 = *(id *)kHAPIScope;
      if (!v21) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v21 = MEMORY[0x1E4F14500];
      id v23 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "CHHapticEngine.mm";
      __int16 v52 = 1024;
      int v53 = 1461;
      __int16 v54 = 2080;
      v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
      _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Using passed-in shared audio session", buf, 0x1Cu);
    }
LABEL_34:

LABEL_35:
    id v24 = (AVAudioSession *)v10;
    uint64_t v25 = 0;
    int v26 = 0;
    p_super = &v17->_avAudioSession->super;
    v17->_avAudioSession = v24;
LABEL_36:

    goto LABEL_37;
  }
  if (v10 || !v8)
  {
    if (v10 && !v8)
    {
      if (kHAPIScope)
      {
        uint64_t v21 = *(id *)kHAPIScope;
        if (!v21) {
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v21 = MEMORY[0x1E4F14500];
        id v44 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v51 = "CHHapticEngine.mm";
        __int16 v52 = 1024;
        int v53 = 1472;
        __int16 v54 = 2080;
        v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
        _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Using passed-in auxiliary audio session with no UsageCategory", buf, 0x1Cu);
      }
      goto LABEL_34;
    }
    uint64_t v31 = [(CHHapticEngine *)v17 getUsageCategory:v11];
    p_usageCategory = &v17->_usageCategory;
    usageCategory = v17->_usageCategory;
    v17->_usageCategory = (NSString *)v31;

    if (!v31) {
      objc_storeStrong((id *)&v17->_usageCategory, @"UIFeedback");
    }
    __int16 v34 = (__CFString *)*p_usageCategory;
    if (*p_usageCategory == (NSString *)@"SystemSoundHapticsParser")
    {
      if (kHAPIScope)
      {
        p_super = *(id *)kHAPIScope;
        if (!p_super)
        {
          uint64_t v25 = 1;
          int v26 = 1;
LABEL_37:
          [(CHHapticEngine *)v17 storeOptions:v11];
          if (v26
            && ![(CHHapticEngine *)v17 setupEngineWithCategory:v17->_usageCategory session:v17->_avAudioSession needsAudioPowerBudget:[(CHHapticEngine *)v17 needsAudioPowerBudget] error:a6]|| ([(CHHapticEngine *)v17 connectAudioSession:v17->_avAudioSession], uint64_t v28 = [(CHHapticEngine *)v17 getSessionIDFromAVAudioSession:v17->_avAudioSession], ![(CHHapticEngine *)v17 doInit:v28 sessionIsShared:v8 options:v11 bypassAudioSession:v25 error:a6]))
          {
            metrics = v17;
            id v17 = 0;
LABEL_67:

LABEL_68:
            __int16 v42 = CALog::Scope::oslog((id *)kHAPIScope);
            int v39 = v42;
            if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BA902000, v39, OS_SIGNPOST_INTERVAL_END, spid, "HapticEngine_initWithAudioSession", (const char *)&unk_1BA96A542, buf, 2u);
            }
            goto LABEL_71;
          }
          if (v8)
          {
LABEL_66:
            id v41 = [[CHMetrics alloc] initWithEngine:v17 audioSessionID:v28 sessionIsShared:v17->_sessionIsShared isSPI:1];
            metrics = v17->_metrics;
            v17->_metrics = v41;
            goto LABEL_67;
          }
          if (kHAPIScope)
          {
            __int16 v29 = *(id *)kHAPIScope;
            if (!v29)
            {
LABEL_65:
              [(CHHapticEngine *)v17 setActivateAudioSessionOnStart:0];
              [(CHHapticEngine *)v17 updateEngineBehavior];
              goto LABEL_66;
            }
          }
          else
          {
            __int16 v29 = MEMORY[0x1E4F14500];
            id v40 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v51 = "CHHapticEngine.mm";
            __int16 v52 = 1024;
            int v53 = 1503;
            __int16 v54 = 2080;
            v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
            _os_log_impl(&dword_1BA902000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting behavior to not activate audio session (if haptics-only)", buf, 0x1Cu);
          }

          goto LABEL_65;
        }
      }
      else
      {
        p_super = MEMORY[0x1E4F14500];
        id v47 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v51 = "CHHapticEngine.mm";
        __int16 v52 = 1024;
        int v53 = 1481;
        __int16 v54 = 2080;
        v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
        __int16 v56 = 2112;
        v57 = v34;
        _os_log_impl(&dword_1BA902000, p_super, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Omitting audio session creation for usage category: %@", buf, 0x26u);
      }
      uint64_t v25 = 1;
      goto LABEL_88;
    }
    if (kHAPIScope)
    {
      id v35 = (AVFASoftLink *)*(id *)kHAPIScope;
      uint64_t v36 = v35;
      if (!v35)
      {
LABEL_83:
        uint64_t v46 = [AVFASoftLink::getAVAudioSession(v35) auxiliarySession];
        uint64_t v25 = 0;
        p_super = &v17->_avAudioSession->super;
        v17->_avAudioSession = (AVAudioSession *)v46;
LABEL_88:
        int v26 = 1;
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v36 = MEMORY[0x1E4F14500];
      id v45 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "CHHapticEngine.mm";
      __int16 v52 = 1024;
      int v53 = 1485;
      __int16 v54 = 2080;
      v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
      _os_log_impl(&dword_1BA902000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating internal unshared audio session", buf, 0x1Cu);
    }

    goto LABEL_83;
  }
  if (!kHAPIScope)
  {
    id v22 = MEMORY[0x1E4F14500];
    id v37 = MEMORY[0x1E4F14500];
    goto LABEL_52;
  }
  id v22 = *(id *)kHAPIScope;
  if (v22)
  {
LABEL_52:
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "CHHapticEngine.mm";
      __int16 v52 = 1024;
      int v53 = 1465;
      __int16 v54 = 2080;
      v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
      _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Shared audio session cannot be nil", buf, 0x1Cu);
    }
  }
  if (a6)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4815 userInfo:0];
  }

  uint64_t v38 = CALog::Scope::oslog((id *)kHAPIScope);
  int v39 = v38;
  if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v39, OS_SIGNPOST_INTERVAL_END, spid, "HapticEngine_initWithAudioSession", (const char *)&unk_1BA96A542, buf, 2u);
  }
  id v17 = 0;
LABEL_71:

  return v17;
}

- (void)toggleBehavior:(unint64_t)a3 set:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(CHHapticEngine *)self currentPlayerBehavior];
  if (v4) {
    unint64_t v8 = v7 | a3;
  }
  else {
    unint64_t v8 = v7 & ~a3;
  }

  [(CHHapticEngine *)self setCurrentPlayerBehavior:v8];
}

- (void)setCurrentPlayerBehavior:(unint64_t)a3
{
  self->_currentPlayerBehavior = a3;
}

- (BOOL)setupEngineWithCategory:(id)a3 session:(id)a4 needsAudioPowerBudget:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (([v10 isEqualToString:@"UIFeedback"] & 1) == 0
    && ([v10 isEqualToString:@"DefaultWithConstantVolume"] & 1) == 0
    && ([v10 isEqualToString:@"iOSKeyboard"] & 1) == 0)
  {
    if ([v10 isEqualToString:@"SystemSound"])
    {
      BOOL v13 = [(CHHapticEngine *)self setupSystemSoundAudioSession:v11 needsAudioPowerBudget:v7 error:a6];
      goto LABEL_6;
    }
    if ([v10 isEqualToString:@"SystemSoundHapticsParser"])
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (kHAPIScope)
    {
      unint64_t v16 = *(id *)kHAPIScope;
      if (!v16)
      {
LABEL_19:
        uint64_t v12 = 0;
        goto LABEL_5;
      }
    }
    else
    {
      unint64_t v16 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315650;
      id v19 = "CHHapticEngineUsageCategory.mm";
      __int16 v20 = 1024;
      int v21 = 165;
      __int16 v22 = 2080;
      id v23 = "-[CHHapticEngine(EngineUsageCategory) setupEngineWithCategory:session:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Using default usage category", (uint8_t *)&v18, 0x1Cu);
    }

    goto LABEL_19;
  }
  uint64_t v12 = 1;
LABEL_5:
  BOOL v13 = [(CHHapticEngine *)self setupUnsharedAudioSession:v11 isConstantVolume:v12 needsAudioPowerBudget:v7 error:a6];
LABEL_6:
  BOOL v14 = v13;
LABEL_7:

  return v14;
}

- (BOOL)setupUnsharedAudioSession:(id)a3 isConstantVolume:(BOOL)a4 needsAudioPowerBudget:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (kHAPIScope)
  {
    id v10 = *(id *)kHAPIScope;
    if (!v10) {
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = @"following ringer";
    *(_DWORD *)uint64_t v31 = 136315906;
    *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
    if (v8) {
      uint64_t v12 = @"with constant";
    }
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = 45;
    __int16 v32 = 2080;
    v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
    __int16 v34 = 2112;
    id v35 = v12;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting SS&H category %@ volume, disabling notifications and NowPlaying for this audio session", v31, 0x26u);
  }

LABEL_10:
  id v13 = (id)*MEMORY[0x1E4F4E828];
  if ([v9 setCategory:v13 error:a6])
  {
    BOOL v14 = (id)*MEMORY[0x1E4F4E8B0];
    if (v8)
    {
      id v15 = (id)*MEMORY[0x1E4F4E8C0];

      BOOL v14 = v15;
    }
    if ((objc_msgSend(v9, "setMode:error:", v14, a6, *(_OWORD *)v31) & 1) == 0)
    {
      if (kHAPIScope)
      {
        unint64_t v16 = *(id *)kHAPIScope;
        if (!v16) {
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v16 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v31 = 136315906;
        *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
        *(_WORD *)&v31[12] = 1024;
        *(_DWORD *)&v31[14] = 56;
        __int16 v32 = 2080;
        v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
        __int16 v34 = 2112;
        id v35 = v14;
        _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set mode %@ on audio session. Continue", v31, 0x26u);
      }
    }
LABEL_27:
    if ([v9 setAudioHardwareControlFlags:1179648 error:a6]) {
      goto LABEL_35;
    }
    if (kHAPIScope)
    {
      __int16 v20 = *(id *)kHAPIScope;
      if (!v20) {
        goto LABEL_35;
      }
    }
    else
    {
      __int16 v20 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v31 = 136315650;
      *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 61;
      __int16 v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio session with session flags. Continue", v31, 0x1Cu);
    }

LABEL_35:
    if ([v9 setPreferredIOBufferFrameSize:256 error:a6]) {
      goto LABEL_43;
    }
    if (kHAPIScope)
    {
      __int16 v22 = *(id *)kHAPIScope;
      if (!v22) {
        goto LABEL_43;
      }
    }
    else
    {
      __int16 v22 = MEMORY[0x1E4F14500];
      id v23 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v31 = 136315906;
      *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 64;
      __int16 v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      __int16 v34 = 1024;
      LODWORD(v35) = 256;
      _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio buffer frame size to %u. Using default buffer size", v31, 0x22u);
    }

LABEL_43:
    if ([v9 enableNotifications:0 error:a6])
    {
      if ([v9 setParticipatesInNowPlayingAppPolicy:0 error:a6])
      {
        if (!v7) {
          goto LABEL_53;
        }
        if (kHAPIScope)
        {
          if (*(unsigned char *)(kHAPIScope + 8))
          {
            uint64_t v24 = *(id *)kHAPIScope;
            if (v24)
            {
              uint64_t v25 = v24;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)uint64_t v31 = 136315650;
                *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
                *(_WORD *)&v31[12] = 1024;
                *(_DWORD *)&v31[14] = 77;
                __int16 v32 = 2080;
                v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
                _os_log_impl(&dword_1BA902000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting NeedsPowerBudgeting property on audio session", v31, 0x1Cu);
              }
            }
          }
        }
        if ([v9 setNeedsHighPowerBudgeting:1 error:a6])
        {
LABEL_53:
          LOBYTE(v17) = 1;
LABEL_69:

          goto LABEL_70;
        }
        if (kHAPIScope)
        {
          id v17 = *(id *)kHAPIScope;
          if (!v17) {
            goto LABEL_69;
          }
        }
        else
        {
          id v17 = MEMORY[0x1E4F14500];
          id v30 = MEMORY[0x1E4F14500];
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_67;
        }
        *(_DWORD *)uint64_t v31 = 136315650;
        *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
        *(_WORD *)&v31[12] = 1024;
        *(_DWORD *)&v31[14] = 79;
        __int16 v32 = 2080;
        v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
        __int16 v27 = "%25s:%-5d %s: Failed to set audio session NeedsPowerBudgeting";
      }
      else
      {
        if (kHAPIScope)
        {
          id v17 = *(id *)kHAPIScope;
          if (!v17) {
            goto LABEL_69;
          }
        }
        else
        {
          id v17 = MEMORY[0x1E4F14500];
          id v28 = MEMORY[0x1E4F14500];
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_67;
        }
        *(_DWORD *)uint64_t v31 = 136315650;
        *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
        *(_WORD *)&v31[12] = 1024;
        *(_DWORD *)&v31[14] = 72;
        __int16 v32 = 2080;
        v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
        __int16 v27 = "%25s:%-5d %s: Failed to disable audio session now-playing policy";
      }
    }
    else
    {
      if (kHAPIScope)
      {
        id v17 = *(id *)kHAPIScope;
        if (!v17) {
          goto LABEL_69;
        }
      }
      else
      {
        id v17 = MEMORY[0x1E4F14500];
        id v26 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      *(_DWORD *)uint64_t v31 = 136315650;
      *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 67;
      __int16 v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      __int16 v27 = "%25s:%-5d %s: Failed to disable audio session notifications";
    }
    _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_ERROR, v27, v31, 0x1Cu);
LABEL_67:

LABEL_68:
    LOBYTE(v17) = 0;
    goto LABEL_69;
  }
  if (!kHAPIScope)
  {
    BOOL v14 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
LABEL_21:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v31 = 136315650;
      *(void *)&void v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 48;
      __int16 v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set category on audio session", v31, 0x1Cu);
    }
    goto LABEL_68;
  }
  BOOL v14 = *(id *)kHAPIScope;
  if (v14) {
    goto LABEL_21;
  }
  LOBYTE(v17) = 0;
LABEL_70:

  return (char)v17;
}

- (id)getUsageCategory:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    long long v5 = [v3 valueForKey:@"UsageCategory"];
  }
  else
  {
    long long v5 = 0;
  }

  return v5;
}

- (void)setActivateAudioSessionOnStart:(BOOL)a3
{
}

- (void)storeOptions:(id)a3
{
  id v16 = a3;
  BOOL v4 = [v16 valueForKey:@"Priority"];

  if (v4)
  {
    long long v5 = [v16 valueForKey:@"Priority"];
    priority = self->_priority;
    self->_priority = v5;
  }
  else
  {
    priority = self->_priority;
    self->_priority = (NSString *)@"LowPriority";
  }

  BOOL v7 = [v16 valueForKey:@"HapticPowerUsage"];

  if (v7)
  {
    BOOL v8 = [v16 valueForKey:@"HapticPowerUsage"];
    hapticPowerUsage = self->_hapticPowerUsage;
    self->_hapticPowerUsage = v8;
  }
  else
  {
    hapticPowerUsage = self->_hapticPowerUsage;
    self->_hapticPowerUsage = (NSString *)@"LowPower";
  }

  id v10 = [v16 valueForKey:@"AudioPowerUsage"];

  if (v10)
  {
    id v11 = [v16 valueForKey:@"AudioPowerUsage"];
    audioPowerUsage = self->_audioPowerUsage;
    self->_audioPowerUsage = v11;
  }
  else
  {
    audioPowerUsage = self->_audioPowerUsage;
    self->_audioPowerUsage = (NSString *)@"LowPower";
  }

  if (!self->_usageCategory)
  {
    id v13 = [v16 valueForKey:@"UsageCategory"];

    if (v13)
    {
      BOOL v14 = [v16 valueForKey:@"UsageCategory"];
      usageCategory = self->_usageCategory;
      self->_usageCategory = v14;
    }
  }
}

- (BOOL)needsAudioPowerBudget
{
  return [(NSString *)self->_audioPowerUsage isEqualToString:@"HighPower"];
}

- (unsigned)getSessionIDFromAVAudioSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (AVFASoftLink *)a3;
  BOOL v4 = v3;
  if (v3)
  {
    AVFASoftLink::getAVAudioSession(v3);
    LODWORD(v5) = [(AVFASoftLink *)v4 opaqueSessionID];
  }
  else
  {
    if (kHAPIScope)
    {
      long long v5 = *(id *)kHAPIScope;
      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      long long v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315650;
      id v9 = "CHHapticEngine.mm";
      __int16 v10 = 1024;
      int v11 = 595;
      __int16 v12 = 2080;
      id v13 = "-[CHHapticEngine getSessionIDFromAVAudioSession:]";
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No audio session used. Returning 0", (uint8_t *)&v8, 0x1Cu);
    }

    LODWORD(v5) = 0;
  }
LABEL_10:

  return v5;
}

- (void)connectAudioSession:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v5 = AVFASoftLink::getAVAudioSessionMediaServicesWereLostNotification(v4);
    [(AVFASoftLink *)v4 addObserver:self selector:sel_handleMediaServerDeath_ name:v5 object:v8];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v7 = AVFASoftLink::getAVAudioSessionMediaServicesWereResetNotification(v6);
    [(AVFASoftLink *)v6 addObserver:self selector:sel_handleMediaServerRecovery_ name:v7 object:v8];
  }
}

void __47__CHHapticEngine_prewarmWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = v3;
  long long v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    id v6 = v5;

    BOOL v4 = v6;
  }
  else if (!v3)
  {
    goto LABEL_11;
  }
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = [v4 localizedDescription];
    int v13 = 136315906;
    uint64_t v14 = "CHHapticEngine.mm";
    __int16 v15 = 1024;
    int v16 = 1165;
    __int16 v17 = 2080;
    id v18 = "-[CHHapticEngine prewarmWithCompletionHandler:]_block_invoke";
    __int16 v19 = 2112;
    __int16 v20 = v10;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player prewarm failed: %@", (uint8_t *)&v13, 0x26u);
  }
LABEL_11:
  if (*(void *)(a1 + 32))
  {
    if (kHAPIScope)
    {
      int v11 = *(id *)kHAPIScope;
      if (!v11)
      {
LABEL_19:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_20;
      }
    }
    else
    {
      int v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      uint64_t v14 = "CHHapticEngine.mm";
      __int16 v15 = 1024;
      int v16 = 1168;
      __int16 v17 = 2080;
      id v18 = "-[CHHapticEngine prewarmWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling prewarm completion handler", (uint8_t *)&v13, 0x1Cu);
    }

    goto LABEL_19;
  }
LABEL_20:
}

void __29__CHHapticEngine_finishInit___block_invoke_181(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    if (kHAPIScope)
    {
      id v5 = *(id *)kHAPIScope;
      if (!v5)
      {
LABEL_9:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        goto LABEL_10;
      }
    }
    else
    {
      id v5 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v4 localizedDescription];
      int v11 = 136315906;
      id v12 = "CHHapticEngine.mm";
      __int16 v13 = 1024;
      int v14 = 657;
      __int16 v15 = 2080;
      int v16 = "-[CHHapticEngine finishInit:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Resource allocation failure: %@", (uint8_t *)&v11, 0x26u);
    }
    goto LABEL_9;
  }
LABEL_10:
  if (kHAPIScope)
  {
    id v9 = *(id *)kHAPIScope;
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    id v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 660;
    __int16 v15 = 2080;
    int v16 = "-[CHHapticEngine finishInit:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Releasing lock", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_17:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isAutoShutdownEnabled]) {
    [WeakRetained cancelIdleTimer];
  }
}

void __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v20 = "CHHapticEngine.mm";
    __int16 v21 = 1024;
    int v22 = 1195;
    __int16 v23 = 2080;
    uint64_t v24 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: In underlying AVHapticPlayer's completion handler block", buf, 0x1Cu);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    id v8 = v7;

    id v3 = v8;
  }
  if (WeakRetained)
  {
    objc_initWeak((id *)buf, WeakRetained);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_213;
    v15[3] = &unk_1E622E758;
    objc_copyWeak(&v18, (id *)buf);
    id v16 = v3;
    id v17 = *(id *)(a1 + 32);
    id v9 = v3;
    [WeakRetained dispatchOnLocal:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_214;
    v12[3] = &unk_1E622DF50;
    id v10 = *(id *)(a1 + 32);
    id v13 = v3;
    id v14 = v10;
    id v11 = v3;
    +[CHHapticEngine dispatchOnGlobal:v12];
  }
}

void __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_213(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    if (kHAPIScope)
    {
      id v4 = *(id *)kHAPIScope;
      if (!v4)
      {
LABEL_11:
        [v3 setRunning:0];
        id v8 = [v3 metrics];
        [v8 handleEngineStop];

        goto LABEL_12;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    id v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) localizedDescription];
      int v11 = 136315906;
      id v12 = "CHHapticEngine.mm";
      __int16 v13 = 1024;
      int v14 = 1206;
      __int16 v15 = 2080;
      id v16 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player start failed: %@", (uint8_t *)&v11, 0x26u);
    }
    goto LABEL_11;
  }
  if ([WeakRetained isAutoShutdownEnabled]) {
    [v3 beginIdleTimer];
  }
LABEL_12:
  if (*(void *)(a1 + 40))
  {
    if (kHAPIScope)
    {
      id v9 = *(id *)kHAPIScope;
      if (!v9)
      {
LABEL_20:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_21;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      id v12 = "CHHapticEngine.mm";
      __int16 v13 = 1024;
      int v14 = 1216;
      __int16 v15 = 2080;
      id v16 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling start completion handler on internal queue", (uint8_t *)&v11, 0x1Cu);
    }

    goto LABEL_20;
  }
LABEL_21:
}

void __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_218(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isAutoShutdownEnabled]) {
    [WeakRetained cancelIdleTimer];
  }
  if (WeakRetained)
  {
    id v3 = [WeakRetained metrics];
    [v3 handleEngineStop];
  }
  if (*(void *)(a1 + 40))
  {
    if (kHAPIScope)
    {
      id v4 = *(id *)kHAPIScope;
      if (!v4)
      {
LABEL_13:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_14;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      id v7 = "CHHapticEngine.mm";
      __int16 v8 = 1024;
      int v9 = 1345;
      __int16 v10 = 2080;
      int v11 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling stop completion handler on internal queue", (uint8_t *)&v6, 0x1Cu);
    }

    goto LABEL_13;
  }
LABEL_14:
}

void __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "CHHapticEngine.mm";
    __int16 v20 = 1024;
    int v21 = 1331;
    __int16 v22 = 2080;
    __int16 v23 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: In underlying AVHapticPlayer's completion handler block for doStopWithCompletionHandler", buf, 0x1Cu);
  }

LABEL_8:
  if (!v3) {
    goto LABEL_16;
  }
  if (kHAPIScope)
  {
    id v6 = *(id *)kHAPIScope;
    if (!v6) {
      goto LABEL_16;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  __int16 v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = [v3 localizedDescription];
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "CHHapticEngine.mm";
    __int16 v20 = 1024;
    int v21 = 1332;
    __int16 v22 = 2080;
    __int16 v23 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Lower-level player stop failed: %@", buf, 0x26u);
  }
LABEL_16:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_initWeak((id *)buf, WeakRetained);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_218;
    v14[3] = &unk_1E622E7F8;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = *(id *)(a1 + 32);
    id v15 = v3;
    [WeakRetained dispatchOnLocal:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_219;
    v11[3] = &unk_1E622DF50;
    id v13 = *(id *)(a1 + 32);
    id v12 = v3;
    +[CHHapticEngine dispatchOnGlobal:v11];
  }
}

void __44__CHHapticEngine_stopWithCompletionHandler___block_invoke_220(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (![WeakRetained running])
  {
    if (kHAPIScope)
    {
      id v3 = *(id *)kHAPIScope;
      if (!v3) {
        goto LABEL_10;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      __int16 v8 = "CHHapticEngine.mm";
      __int16 v9 = 1024;
      int v10 = 1374;
      __int16 v11 = 2080;
      id v12 = "-[CHHapticEngine stopWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine not running", (uint8_t *)&v7, 0x1Cu);
    }

LABEL_10:
    if (!*(void *)(a1 + 32)) {
      goto LABEL_19;
    }
    if (kHAPIScope)
    {
      id v5 = *(id *)kHAPIScope;
      if (!v5)
      {
LABEL_18:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_19;
      }
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      __int16 v8 = "CHHapticEngine.mm";
      __int16 v9 = 1024;
      int v10 = 1376;
      __int16 v11 = 2080;
      id v12 = "-[CHHapticEngine stopWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Directly calling stop completionHandler on internal queue", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_18;
  }
  [WeakRetained doStopWithCompletionHandler:*(void *)(a1 + 32)];
LABEL_19:
}

void __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    int v10 = "CHHapticEngine.mm";
    __int16 v11 = 1024;
    int v12 = 1393;
    __int16 v13 = 2080;
    int v14 = "-[CHHapticEngine notifyWhenPlayersFinished:]_block_invoke_2";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of AV finishWithCompletionHandler block>", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleFinish:v3];
  if (kHAPIScope)
  {
    int v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    int v10 = "CHHapticEngine.mm";
    __int16 v11 = 1024;
    int v12 = 1396;
    __int16 v13 = 2080;
    int v14 = "-[CHHapticEngine notifyWhenPlayersFinished:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Bottom of AV finishWithCompletionHandler block>", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_15:
}

uint64_t __41__CHHapticEngine_capabilitiesForHardware__block_invoke()
{
  +[CHHapticEngine capabilitiesForHardware]::sDefaultHardwareCapabilities = [[CHDefaultHapticDeviceCapability alloc] initPrivate];

  return MEMORY[0x1F41817F8]();
}

void __31__CHHapticEngine_handleFinish___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 40))
  {
    if (kHAPIScope)
    {
      id v3 = *(id *)kHAPIScope;
      if (!v3) {
        goto LABEL_12;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = "CHHapticEngine.mm";
      __int16 v20 = 1024;
      int v21 = 794;
      __int16 v22 = 2080;
      __int16 v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling client's finishedHandler on internal queue", buf, 0x1Cu);
    }

LABEL_12:
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v6 == 1)
    {
      if (kHAPIScope)
      {
        int v7 = *(id *)kHAPIScope;
        if (!v7) {
          goto LABEL_24;
        }
      }
      else
      {
        int v7 = MEMORY[0x1E4F14500];
        id v9 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "CHHapticEngine.mm";
        __int16 v20 = 1024;
        int v21 = 796;
        __int16 v22 = 2080;
        __int16 v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
        _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client requested engine stop-on-finish", buf, 0x1Cu);
      }
    }
LABEL_24:
    [WeakRetained setClientFinishedHandler:0];
    if (v6 == 1 && [*(id *)(a1 + 32) code] != -4805)
    {
      if (WeakRetained)
      {
        objc_initWeak((id *)buf, WeakRetained);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __31__CHHapticEngine_handleFinish___block_invoke_187;
        v15[3] = &unk_1E622DF78;
        objc_copyWeak(&v17, (id *)buf);
        id v16 = *(id *)(a1 + 48);
        [WeakRetained doStopWithCompletionHandler:v15];

        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __31__CHHapticEngine_handleFinish___block_invoke_190;
        v13[3] = &unk_1E622E180;
        id v14 = *(id *)(a1 + 48);
        +[CHHapticEngine dispatchOnGlobal:v13];
      }
      goto LABEL_35;
    }
    goto LABEL_26;
  }
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_26;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "CHHapticEngine.mm";
    __int16 v20 = 1024;
    int v21 = 802;
    __int16 v22 = 2080;
    __int16 v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client finishedHandler is nil", buf, 0x1Cu);
  }

LABEL_26:
  if (!kHAPIScope)
  {
    int v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    goto LABEL_30;
  }
  int v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_30:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = "CHHapticEngine.mm";
      __int16 v20 = 1024;
      int v21 = 843;
      __int16 v22 = 2080;
      __int16 v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Requested not to stop-on-finish", buf, 0x1Cu);
    }
  }
  if ([WeakRetained isAutoShutdownEnabled]) {
    [WeakRetained beginIdleTimer];
  }
LABEL_35:
  int v12 = [WeakRetained metrics];
  [WeakRetained currentTime];
  objc_msgSend(v12, "handleFinishedForPlayersAtTime:");
}

- (void)releaseChannel:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  player = self->_player;
  id v8 = 0;
  BOOL v4 = [(AVHapticPlayer *)player removeChannel:a3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    if (kHAPIScope)
    {
      uint64_t v6 = *(id *)kHAPIScope;
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v10 = "CHHapticEngine.mm";
      __int16 v11 = 1024;
      int v12 = 1990;
      __int16 v13 = 2080;
      id v14 = "-[CHHapticEngine(CHHapticEngineInternal) releaseChannel:]";
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: This channel was not registered", buf, 0x1Cu);
    }
  }
LABEL_9:
}

- (BOOL)notifyPlayerStarted:(id)a3 atTime:(double)a4
{
  BOOL v4 = self;
  objc_sync_enter(v4);
  objc_initWeak(&location, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke;
  v10[3] = &unk_1E622E360;
  objc_copyWeak(&v11, &location);
  [(CHHapticEngine *)v4 dispatchOnLocal:v10];
  id v5 = [(CHHapticEngine *)v4 player];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke_2;
  v8[3] = &unk_1E622DF00;
  objc_copyWeak(&v9, &location);
  char v6 = [v5 finishWithCompletionHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  objc_sync_exit(v4);

  return v6;
}

- (id)getAvailableChannel:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVHapticPlayer *)self->_player addChannel:a3];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_10;
  }
  if (kHAPIScope)
  {
    char v6 = *(id *)kHAPIScope;
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    char v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    int v10 = "CHHapticEngine.mm";
    __int16 v11 = 1024;
    int v12 = 1979;
    __int16 v13 = 2080;
    id v14 = "-[CHHapticEngine(CHHapticEngineInternal) getAvailableChannel:]";
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to add an additional player channel", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_10:

  return v4;
}

- (BOOL)checkEngineStateOnStart:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CHHapticEngine *)self isAutoShutdownEnabled]
    && ![(CHHapticEngine *)self running])
  {
    if (kHAPIScope)
    {
      char v6 = *(id *)kHAPIScope;
      if (!v6) {
        return [(CHHapticEngine *)self doStartEngineAndWait:a3];
      }
    }
    else
    {
      char v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315650;
      int v9 = "CHHapticEngine.mm";
      __int16 v10 = 1024;
      int v11 = 1931;
      __int16 v12 = 2080;
      __int16 v13 = "-[CHHapticEngine(CHHapticEngineInternal) checkEngineStateOnStart:]";
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: AutoShutdown on and engine stopped - auto start", (uint8_t *)&v8, 0x1Cu);
    }

    return [(CHHapticEngine *)self doStartEngineAndWait:a3];
  }
  if ([(CHHapticEngine *)self running]) {
    return 1;
  }
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1935, "-[CHHapticEngine(CHHapticEngineInternal) checkEngineStateOnStart:]", "self.running", -4805, a3);
  return 0;
}

- (CHHapticEngineStoppedHandler)stoppedHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setClientFinishedHandler:(id)a3
{
}

- (void)notifyWhenPlayersFinished:(CHHapticEngineFinishedHandler)finishedHandler
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CHHapticEngineFinishedHandler v4 = finishedHandler;
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
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (void *)MEMORY[0x1BA9F2D90](v4);
    *(_DWORD *)buf = 136316162;
    uint64_t v19 = "CHHapticEngine.mm";
    __int16 v20 = 1024;
    int v21 = 1386;
    __int16 v22 = 2080;
    __int16 v23 = "-[CHHapticEngine notifyWhenPlayersFinished:]";
    __int16 v24 = 2048;
    uint64_t v25 = self;
    __int16 v26 = 2048;
    __int16 v27 = v8;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p with finishedHandler %p", buf, 0x30u);
  }
LABEL_8:
  if (self->_player)
  {
    int v9 = self;
    objc_sync_enter(v9);
    [(CHHapticEngine *)v9 setClientFinishedHandler:v4];
    objc_initWeak((id *)buf, v9);
    __int16 v10 = [(CHHapticEngine *)v9 player];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke_2;
    v12[3] = &unk_1E622DF00;
    objc_copyWeak(&v13, (id *)buf);
    [v10 finishWithCompletionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    objc_sync_exit(v9);
  }
  else
  {
    id v17 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1387, "-[CHHapticEngine notifyWhenPlayersFinished:]", "_player != nil", -4810, &v17);
    id v11 = v17;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke;
    v14[3] = &unk_1E622DF50;
    id v15 = v11;
    id v16 = v4;
    int v9 = (CHHapticEngine *)v11;
    [(CHHapticEngine *)self dispatchOnLocal:v14];
  }
}

- (BOOL)isAutoShutdownEnabled
{
  return self->_autoShutdownEnabled;
}

- (void)handleFinish:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
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
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    int v21 = "CHHapticEngine.mm";
    __int16 v22 = 1024;
    int v23 = 786;
    __int16 v24 = 2080;
    uint64_t v25 = "-[CHHapticEngine handleFinish:]";
    __int16 v26 = 2048;
    __int16 v27 = self;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Called on engine %p with error %@", buf, 0x30u);
  }

LABEL_8:
  objc_initWeak(&location, self);
  id v7 = [(CHHapticEngine *)self clientFinishedHandler];
  int v8 = [(CHHapticEngine *)self stoppedHandler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31__CHHapticEngine_handleFinish___block_invoke;
  v14[3] = &unk_1E622E708;
  objc_copyWeak(&v18, &location);
  id v9 = v7;
  id v16 = v9;
  id v10 = v4;
  id v15 = v10;
  id v11 = v8;
  id v17 = v11;
  [(CHHapticEngine *)self dispatchOnLocal:v14];
  if (kHAPIScope)
  {
    __int16 v12 = *(id *)kHAPIScope;
    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    int v21 = "CHHapticEngine.mm";
    __int16 v22 = 1024;
    int v23 = 850;
    __int16 v24 = 2080;
    uint64_t v25 = "-[CHHapticEngine handleFinish:]";
    _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done handling finish", buf, 0x1Cu);
  }

LABEL_15:
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)doStopWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CHHapticEngine *)self setRunning:0];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "CHHapticEngine.mm";
    __int16 v14 = 1024;
    int v15 = 1328;
    __int16 v16 = 2080;
    id v17 = "-[CHHapticEngine doStopWithCompletionHandler:]";
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping underlying Haptic Player", buf, 0x1Cu);
  }

LABEL_8:
  objc_initWeak((id *)buf, self);
  player = self->_player;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E622DF78;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  [(AVHapticPlayer *)player stopRunningWithCompletionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (NSTimeInterval)currentTime
{
  [(AVHapticPlayer *)self->_player currentMediaTime];
  return result;
}

- (id)createPrivilegedPlayerWithPlayable:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1572;
    __int16 v15 = 2080;
    __int16 v16 = "-[CHHapticEngine createPrivilegedPlayerWithPlayable:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating privileged player from Playable", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    id v9 = [[PatternPlayer alloc] initWithPlayable:v6 engine:self privileged:1 error:a4];
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1573, "-[CHHapticEngine createPrivilegedPlayerWithPlayable:error:]", "_player != nil", -4810, a4);
    id v9 = 0;
  }

  return v9;
}

- (id)clientFinishedHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

+ (BOOL)resourceIsRegistered:(unint64_t)a3
{
  id v4 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  if (_sResourceEntries)
  {
    uint64_t v5 = _sResourceEntries + 8;
    id v6 = *(void **)(_sResourceEntries + 8);
    if (!v6) {
      goto LABEL_13;
    }
    uint64_t v7 = _sResourceEntries + 8;
    do
    {
      unint64_t v8 = v6[4];
      BOOL v9 = v8 >= a3;
      if (v8 >= a3) {
        id v10 = v6;
      }
      else {
        id v10 = v6 + 1;
      }
      if (v9) {
        uint64_t v7 = (uint64_t)v6;
      }
      id v6 = (void *)*v10;
    }
    while (*v10);
    if (v7 == v5 || *(void *)(v7 + 32) > a3) {
LABEL_13:
    }
      uint64_t v7 = _sResourceEntries + 8;
    BOOL v11 = v7 != v5;
  }
  else
  {
    BOOL v11 = 0;
  }
  std::mutex::unlock(v4);
  return v11;
}

+ (id)capabilitiesForHardware
{
  if (+[CHHapticEngine capabilitiesForHardware]::onceToken != -1) {
    dispatch_once(&+[CHHapticEngine capabilitiesForHardware]::onceToken, &__block_literal_global_208);
  }
  v2 = (void *)+[CHHapticEngine capabilitiesForHardware]::sDefaultHardwareCapabilities;

  return v2;
}

- (BOOL)setupSystemSoundAudioSession:(id)a3 needsAudioPowerBudget:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (kHAPIScope)
  {
    unint64_t v8 = *(id *)kHAPIScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v31 = 136315650;
    __int16 v32 = "CHHapticEngineUsageCategory.mm";
    __int16 v33 = 1024;
    int v34 = 92;
    __int16 v35 = 2080;
    uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting for System Sound, disabling notifications and NowPlaying for this audio session", (uint8_t *)&v31, 0x1Cu);
  }

LABEL_8:
  if (([v7 setCategory:*MEMORY[0x1E4F4E800] withOptions:2 error:a5] & 1) == 0)
  {
    if (kHAPIScope)
    {
      BOOL v11 = *(id *)kHAPIScope;
      if (!v11) {
        goto LABEL_73;
      }
    }
    else
    {
      BOOL v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    int v31 = 136315650;
    __int16 v32 = "CHHapticEngineUsageCategory.mm";
    __int16 v33 = 1024;
    int v34 = 96;
    __int16 v35 = 2080;
    uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    __int16 v13 = "%25s:%-5d %s: Failed to set category on audio session";
    goto LABEL_42;
  }
  if (([v7 setAudioHardwareControlFlags:18 error:a5] & 1) == 0)
  {
    if (kHAPIScope)
    {
      id v10 = *(id *)kHAPIScope;
      if (!v10) {
        goto LABEL_23;
      }
    }
    else
    {
      id v10 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136315650;
      __int16 v32 = "CHHapticEngineUsageCategory.mm";
      __int16 v33 = 1024;
      int v34 = 101;
      __int16 v35 = 2080;
      uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio session with session flags. Continue", (uint8_t *)&v31, 0x1Cu);
    }
  }
LABEL_23:
  if ([v7 setPreferredIOBufferFrameSize:512 error:a5]) {
    goto LABEL_31;
  }
  if (kHAPIScope)
  {
    __int16 v15 = *(id *)kHAPIScope;
    if (!v15) {
      goto LABEL_31;
    }
  }
  else
  {
    __int16 v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v31 = 136315906;
    __int16 v32 = "CHHapticEngineUsageCategory.mm";
    __int16 v33 = 1024;
    int v34 = 104;
    __int16 v35 = 2080;
    uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    __int16 v37 = 1024;
    int v38 = 512;
    _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio buffer frame size to %u", (uint8_t *)&v31, 0x22u);
  }

LABEL_31:
  if (([v7 enableNotifications:0 error:a5] & 1) == 0)
  {
    if (kHAPIScope)
    {
      BOOL v11 = *(id *)kHAPIScope;
      if (!v11) {
        goto LABEL_73;
      }
    }
    else
    {
      BOOL v11 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    int v31 = 136315650;
    __int16 v32 = "CHHapticEngineUsageCategory.mm";
    __int16 v33 = 1024;
    int v34 = 108;
    __int16 v35 = 2080;
    uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    __int16 v13 = "%25s:%-5d %s: Failed to disable audio session notifications";
    goto LABEL_42;
  }
  if (([v7 setPrefersNoDucking:1 error:a5] & 1) == 0)
  {
    if (kHAPIScope)
    {
      uint64_t v17 = *(id *)kHAPIScope;
      if (!v17) {
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136315650;
      __int16 v32 = "CHHapticEngineUsageCategory.mm";
      __int16 v33 = 1024;
      int v34 = 112;
      __int16 v35 = 2080;
      uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set not to be ducked by others", (uint8_t *)&v31, 0x1Cu);
    }
  }
LABEL_48:
  if ([v7 setParticipatesInNowPlayingAppPolicy:0 error:a5]) {
    goto LABEL_56;
  }
  if (kHAPIScope)
  {
    int v21 = *(id *)kHAPIScope;
    if (!v21) {
      goto LABEL_56;
    }
  }
  else
  {
    int v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v31 = 136315650;
    __int16 v32 = "CHHapticEngineUsageCategory.mm";
    __int16 v33 = 1024;
    int v34 = 115;
    __int16 v35 = 2080;
    uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to disable audio session now-playing policy", (uint8_t *)&v31, 0x1Cu);
  }

LABEL_56:
  LODWORD(v20) = 1036831949;
  int v23 = [NSNumber numberWithFloat:v20];
  char v24 = [v7 setDuckToLevelScalar:v23 error:a5];

  if ((v24 & 1) == 0)
  {
    if (kHAPIScope)
    {
      uint64_t v25 = *(id *)kHAPIScope;
      if (!v25) {
        goto LABEL_64;
      }
    }
    else
    {
      uint64_t v25 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136315650;
      __int16 v32 = "CHHapticEngineUsageCategory.mm";
      __int16 v33 = 1024;
      int v34 = 118;
      __int16 v35 = 2080;
      uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1BA902000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set duck level", (uint8_t *)&v31, 0x1Cu);
    }
  }
LABEL_64:
  if (!v6) {
    goto LABEL_72;
  }
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      __int16 v27 = *(id *)kHAPIScope;
      if (v27)
      {
        __int16 v28 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          int v31 = 136315650;
          __int16 v32 = "CHHapticEngineUsageCategory.mm";
          __int16 v33 = 1024;
          int v34 = 121;
          __int16 v35 = 2080;
          uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
          _os_log_impl(&dword_1BA902000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting NeedsPowerBudgeting property on audio session", (uint8_t *)&v31, 0x1Cu);
        }
      }
    }
  }
  if ([v7 setNeedsHighPowerBudgeting:1 error:a5])
  {
LABEL_72:
    LOBYTE(v11) = 1;
    goto LABEL_73;
  }
  if (kHAPIScope)
  {
    BOOL v11 = *(id *)kHAPIScope;
    if (!v11) {
      goto LABEL_73;
    }
  }
  else
  {
    BOOL v11 = MEMORY[0x1E4F14500];
    id v30 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v31 = 136315650;
    __int16 v32 = "CHHapticEngineUsageCategory.mm";
    __int16 v33 = 1024;
    int v34 = 123;
    __int16 v35 = 2080;
    uint64_t v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    __int16 v13 = "%25s:%-5d %s: Failed to set audio session NeedsPowerBudgeting";
LABEL_42:
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v31, 0x1Cu);
  }
LABEL_43:

  LOBYTE(v11) = 0;
LABEL_73:

  return (char)v11;
}

- (void)updateAudioConfigurations:(id)a3 session:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || ![v6 isEqualToString:@"iOSKeyboard"]) {
    goto LABEL_10;
  }
  if ([(CHHapticEngine *)self playsAudioOnly]
    || [(CHHapticEngine *)self playsHapticsOnly])
  {
    if ([(CHHapticEngine *)self playsAudioOnly])
    {
      id v14 = 0;
      char v8 = [v7 setPreferredIOBufferFrameSize:1024 error:&v14];
      id v9 = v14;
      if ((v8 & 1) == 0)
      {
        if (kHAPIScope)
        {
          id v10 = *(id *)kHAPIScope;
          if (!v10) {
            goto LABEL_11;
          }
        }
        else
        {
          id v10 = MEMORY[0x1E4F14500];
          id v12 = MEMORY[0x1E4F14500];
        }
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = "CHHapticEngineUsageCategory.mm";
        __int16 v18 = 1024;
        int v19 = 183;
        __int16 v20 = 2080;
        int v21 = "-[CHHapticEngine(EngineUsageCategory) updateAudioConfigurations:session:]";
        __int16 v22 = 1024;
        int v23 = 1024;
        __int16 v24 = 2112;
        id v25 = v9;
        goto LABEL_22;
      }
      goto LABEL_11;
    }
LABEL_10:
    id v9 = 0;
    goto LABEL_11;
  }
  id v15 = 0;
  char v11 = [v7 setPreferredIOBufferFrameSize:256 error:&v15];
  id v9 = v15;
  if ((v11 & 1) == 0)
  {
    if (kHAPIScope)
    {
      id v10 = *(id *)kHAPIScope;
      if (!v10) {
        goto LABEL_11;
      }
    }
    else
    {
      id v10 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "CHHapticEngineUsageCategory.mm";
    __int16 v18 = 1024;
    int v19 = 177;
    __int16 v20 = 2080;
    int v21 = "-[CHHapticEngine(EngineUsageCategory) updateAudioConfigurations:session:]";
    __int16 v22 = 1024;
    int v23 = 256;
    __int16 v24 = 2112;
    id v25 = v9;
LABEL_22:
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio buffer frame size to %u. Error: %@", buf, 0x2Cu);
LABEL_23:
  }
LABEL_11:
}

+ (void)lazyInitResourceMap
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  if (!_sResourceEntries)
  {
    if (kHAPIScope)
    {
      id v3 = *(id *)kHAPIScope;
      if (!v3) {
        goto LABEL_9;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315650;
      id v6 = "CHHapticEngine.mm";
      __int16 v7 = 1024;
      int v8 = 299;
      __int16 v9 = 2080;
      id v10 = "+[CHHapticEngine lazyInitResourceMap]";
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Creating resource map on first use", (uint8_t *)&v5, 0x1Cu);
    }

LABEL_9:
    operator new();
  }
  std::mutex::unlock(v2);
}

+ (void)clearResourceMap
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  if (_sResourceEntries)
  {
    if (kHAPIScope)
    {
      id v3 = *(id *)kHAPIScope;
      if (!v3)
      {
LABEL_9:
        int v5 = (void *)_sResourceEntries;
        id v6 = (void *)(_sResourceEntries + 8);
        std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(_sResourceEntries, *(void **)(_sResourceEntries + 8));
        *int v5 = v6;
        v5[2] = 0;
        *id v6 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      int v8 = "CHHapticEngine.mm";
      __int16 v9 = 1024;
      int v10 = 308;
      __int16 v11 = 2080;
      id v12 = "+[CHHapticEngine clearResourceMap]";
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Clearing resource map", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  std::mutex::unlock(v2);
}

- (BOOL)isBehaviorSet:(unint64_t)a3
{
  return ([(CHHapticEngine *)self currentPlayerBehavior] & a3) != 0;
}

- (BOOL)playsHapticsOnly
{
  return [(CHHapticEngine *)self isBehaviorSet:1];
}

- (BOOL)playsAudioOnly
{
  return [(CHHapticEngine *)self isBehaviorSet:16];
}

- (void)setPlaysAudioOnly:(BOOL)playsAudioOnly
{
  BOOL v3 = playsAudioOnly;
  id v8 = [(CHHapticEngine *)self serverConfig];
  if ([v8 supportsHapticPlayback])
  {
    int v5 = [(CHHapticEngine *)self serverConfig];
    int v6 = [v5 supportsAudioPlayback];

    if (!v6) {
      return;
    }
    [(CHHapticEngine *)self toggleBehavior:16 set:v3];
    id v8 = [(CHHapticEngine *)self usageCategory];
    int v7 = [(CHHapticEngine *)self avAudioSession];
    [(CHHapticEngine *)self updateAudioConfigurations:v8 session:v7];
  }
}

- (BOOL)muteHapticsWhileRecordingAudio
{
  return ![(CHHapticEngine *)self isBehaviorSet:512];
}

- (void)setMuteHapticsWhileRecordingAudio:(BOOL)a3
{
  [(CHHapticEngine *)self toggleBehavior:512 set:!a3];

  [(CHHapticEngine *)self updateEngineBehavior];
}

- (BOOL)isMutedForAudio
{
  return [(CHHapticEngine *)self isBehaviorSet:32];
}

- (void)setIsMutedForAudio:(BOOL)isMutedForAudio
{
  [(CHHapticEngine *)self toggleBehavior:32 set:isMutedForAudio];

  [(CHHapticEngine *)self updateEngineBehavior];
}

- (BOOL)isMutedForHaptics
{
  return [(CHHapticEngine *)self isBehaviorSet:64];
}

- (void)setIsMutedForHaptics:(BOOL)isMutedForHaptics
{
  [(CHHapticEngine *)self toggleBehavior:64 set:isMutedForHaptics];

  [(CHHapticEngine *)self updateEngineBehavior];
}

- (void)setAutoShutdownEnabled:(BOOL)autoShutdownEnabled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_autoShutdownEnabled != autoShutdownEnabled)
  {
    BOOL v3 = autoShutdownEnabled;
    self->_autoShutdownEnabled = autoShutdownEnabled;
    id v4 = self;
    objc_sync_enter(v4);
    if (v3)
    {
      if ([(CHHapticEngine *)v4 running])
      {
        if (kHAPIScope)
        {
          int v5 = *(id *)kHAPIScope;
          if (!v5)
          {
LABEL_19:
            objc_initWeak((id *)buf, v4);
            __int16 v9 = [(CHHapticEngine *)v4 player];
            v11[0] = MEMORY[0x1E4F143A8];
            v11[1] = 3221225472;
            v11[2] = __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke;
            v11[3] = &unk_1E622DF00;
            objc_copyWeak(&v12, (id *)buf);
            [v9 finishWithCompletionHandler:v11];

            objc_destroyWeak(&v12);
            objc_destroyWeak((id *)buf);
            goto LABEL_20;
          }
        }
        else
        {
          int v5 = MEMORY[0x1E4F14500];
          id v8 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          id v14 = "CHHapticEngine.mm";
          __int16 v15 = 1024;
          int v16 = 416;
          __int16 v17 = 2080;
          __int16 v18 = "-[CHHapticEngine setAutoShutdownEnabled:]";
          _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: auto-shutdown being enabled while running - wait for any existing players", buf, 0x1Cu);
        }

        goto LABEL_19;
      }
LABEL_20:
      objc_sync_exit(v4);

      return;
    }
    if (kHAPIScope)
    {
      int v6 = *(id *)kHAPIScope;
      if (!v6)
      {
LABEL_14:
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke_160;
        v10[3] = &unk_1E622E640;
        void v10[4] = v4;
        [(CHHapticEngine *)v4 dispatchOnLocal:v10];
        goto LABEL_20;
      }
    }
    else
    {
      int v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v14 = "CHHapticEngine.mm";
      __int16 v15 = 1024;
      int v16 = 428;
      __int16 v17 = 2080;
      __int16 v18 = "-[CHHapticEngine setAutoShutdownEnabled:]";
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: auto-shutdown being disabled", buf, 0x1Cu);
    }

    goto LABEL_14;
  }
}

void __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    id v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 419;
    __int16 v15 = 2080;
    int v16 = "-[CHHapticEngine setAutoShutdownEnabled:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (!v3) {
    goto LABEL_16;
  }
  if (kHAPIScope)
  {
    int v6 = *(id *)kHAPIScope;
    if (!v6) {
      goto LABEL_16;
    }
  }
  else
  {
    int v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315906;
    id v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 420;
    __int16 v15 = 2080;
    int v16 = "-[CHHapticEngine setAutoShutdownEnabled:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: finishWithCompletionHandler callback returned error: %@", (uint8_t *)&v11, 0x26u);
  }

LABEL_16:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleFinish:v3];
  if (kHAPIScope)
  {
    __int16 v9 = *(id *)kHAPIScope;
    if (!v9) {
      goto LABEL_23;
    }
  }
  else
  {
    __int16 v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    id v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 423;
    __int16 v15 = 2080;
    int v16 = "-[CHHapticEngine setAutoShutdownEnabled:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Bottom of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_23:
}

uint64_t __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke_160(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelIdleTimer];
}

- (BOOL)followAudioRoute
{
  return [(CHHapticEngine *)self isBehaviorSet:2];
}

- (BOOL)highPriority
{
  return [(CHHapticEngine *)self isBehaviorSet:128];
}

- (void)setHighPriority:(BOOL)a3
{
}

- (NSArray)availableLocalities
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:@"CHHapticLocalityEngineDefault"];
}

- (NSString)locality
{
  v2 = [(CHHapticEngine *)self serverConfig];
  id v3 = [v2 currentLocality];

  return (NSString *)v3;
}

- (double)autoShutdownTimeout
{
  return self->_runTimeout;
}

- (void)setAutoShutdownTimeout:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0.0)
  {
    self->_runTimeout = a3;
    return;
  }
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      return;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315906;
    id v7 = "CHHapticEngine.mm";
    __int16 v8 = 1024;
    int v9 = 478;
    __int16 v10 = 2080;
    int v11 = "-[CHHapticEngine setAutoShutdownTimeout:]";
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid shutdown timeout (%f) being ignored", (uint8_t *)&v6, 0x26u);
  }
}

- (void)handleMediaServerDeath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 500;
    __int16 v15 = 2080;
    int v16 = "-[CHHapticEngine handleMediaServerDeath:]";
    __int16 v17 = 2048;
    id v18 = self;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine %p was notified of server death", (uint8_t *)&v11, 0x26u);
  }

LABEL_8:
  +[CHHapticEngine clearResourceMap];
  id v7 = self;
  objc_sync_enter(v7);
  if (kHAPIScope)
  {
    __int16 v8 = *(id *)kHAPIScope;
    if (!v8) {
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 503;
    __int16 v15 = 2080;
    int v16 = "-[CHHapticEngine handleMediaServerDeath:]";
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Clearing public audio resources", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_15:
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy((uint64_t)&v7->_publicAudioResources, (void *)v7->_publicAudioResources.__tree_.__pair1_.__value_.__left_);
  v7->_publicAudioResources.__tree_.__begin_node_ = &v7->_publicAudioResources.__tree_.__pair1_;
  v7->_publicAudioResources.__tree_.__pair3_.__value_ = 0;
  v7->_publicAudioResources.__tree_.__pair1_.__value_.__left_ = 0;
  objc_sync_exit(v7);

  player = v7->_player;
  v7->_player = 0;
}

- (void)handleMediaServerRecovery:(id)a3
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__CHHapticEngine_handleMediaServerRecovery___block_invoke;
  v4[3] = &unk_1E622E668;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  +[CHHapticEngine dispatchOnGlobal:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__CHHapticEngine_handleMediaServerRecovery___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));

  id v4 = CALog::Scope::oslog((id *)kHAPIScope);
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "HapticEngine_handleMediaServerRecovery", " enableTelemetry=YES ", buf, 2u);
  }

  if (kHAPIScope)
  {
    id v6 = *(id *)kHAPIScope;
    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  __int16 v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    id v40 = "CHHapticEngine.mm";
    __int16 v41 = 1024;
    int v42 = 515;
    __int16 v43 = 2080;
    id v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
    __int16 v45 = 2048;
    id v46 = WeakRetained;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Attempting to reconnect engine %p to server", buf, 0x26u);
  }
LABEL_11:
  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = v10;
  if (v10)
  {
    if ([v10 isAutoShutdownEnabled]) {
      [v11 cancelIdleTimer];
    }
    __int16 v12 = [v11 avAudioSession];
    *((_DWORD *)v11 + 6) = [v11 getSessionIDFromAVAudioSession:v12];

    if (([v11 sessionIsShared] & 1) == 0)
    {
      __int16 v13 = [v11 usageCategory];
      BOOL v14 = v13 == 0;

      if (!v14)
      {
        __int16 v15 = [v11 usageCategory];
        int v16 = [v11 avAudioSession];
        id v38 = 0;
        char v17 = objc_msgSend(v11, "setupEngineWithCategory:session:needsAudioPowerBudget:error:", v15, v16, objc_msgSend(v11, "needsAudioPowerBudget"), &v38);
        id v18 = v38;

        if ((v17 & 1) == 0) {
          Haptic_RaiseException(&cfstr_Chhapticerrorc.isa, &cfstr_FailedToSetUpA.isa, [v18 code]);
        }
LABEL_32:
        if (!*((_DWORD *)v11 + 6)) {
          Haptic_RaiseException(&cfstr_Chhapticerrorc.isa, &cfstr_FailedToSetUpA_0.isa, -4815);
        }
        __int16 v22 = objc_msgSend(*(id *)(a1 + 32), "createOptionsFromAudioSessionID:shared:bypassAudioSession:", objc_msgSend(v11, "audioSessionID"), objc_msgSend(v11, "sessionIsShared"), 0);
        uint64_t v23 = [v11 createHapticPlayerWithOptions:v22];
        __int16 v24 = (void *)*((void *)v11 + 7);
        *((void *)v11 + 7) = v23;

        __int16 v37 = v18;
        int v25 = [v11 finishInit:&v37];
        uint64_t v26 = v37;

        __int16 v27 = v26;
        if (!v25) {
          goto LABEL_52;
        }
        __int16 v28 = [v11 resetHandler];
        BOOL v29 = v28 == 0;

        if (v29)
        {
LABEL_44:
          if (kHAPIScope)
          {
            __int16 v33 = *(id *)kHAPIScope;
            if (!v33)
            {
LABEL_51:
              __int16 v35 = [v11 metrics];
              [v35 handleServerRecovery];

LABEL_52:
              uint64_t v36 = CALog::Scope::oslog((id *)kHAPIScope);
              uint64_t v19 = v36;
              if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1BA902000, v19, OS_SIGNPOST_INTERVAL_END, v3, "HapticEngine_handleMediaServerRecovery", (const char *)&unk_1BA96A542, buf, 2u);
              }
              goto LABEL_55;
            }
          }
          else
          {
            __int16 v33 = MEMORY[0x1E4F14500];
            id v34 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            id v40 = "CHHapticEngine.mm";
            __int16 v41 = 1024;
            int v42 = 549;
            __int16 v43 = 2080;
            id v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
            __int16 v45 = 2048;
            id v46 = v11;
            _os_log_impl(&dword_1BA902000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done with reconnect for engine %p", buf, 0x26u);
          }

          goto LABEL_51;
        }
        if (kHAPIScope)
        {
          id v30 = *(id *)kHAPIScope;
          if (!v30)
          {
LABEL_43:
            __int16 v32 = [v11 resetHandler];
            v32[2]();

            goto LABEL_44;
          }
        }
        else
        {
          id v30 = MEMORY[0x1E4F14500];
          id v31 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v40 = "CHHapticEngine.mm";
          __int16 v41 = 1024;
          int v42 = 546;
          __int16 v43 = 2080;
          id v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
          _os_log_impl(&dword_1BA902000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling engine-reset handler on default queue", buf, 0x1Cu);
        }

        goto LABEL_43;
      }
      if (kHAPIScope)
      {
        id v18 = *(id *)kHAPIScope;
        if (!v18) {
          goto LABEL_32;
        }
      }
      else
      {
        id v18 = MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v40 = "CHHapticEngine.mm";
        __int16 v41 = 1024;
        int v42 = 535;
        __int16 v43 = 2080;
        id v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
        _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine had external passed-in auxiliary session. Caller should reconfigure session", buf, 0x1Cu);
      }
    }
    id v18 = 0;
    goto LABEL_32;
  }
  if (kHAPIScope)
  {
    uint64_t v19 = *(id *)kHAPIScope;
    if (!v19) {
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v40 = "CHHapticEngine.mm";
    __int16 v41 = 1024;
    int v42 = 518;
    __int16 v43 = 2080;
    id v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine already destroyed - noop", buf, 0x1Cu);
  }
LABEL_55:

LABEL_56:
}

- (void)disconnectAudioSession:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = AVFASoftLink::getAVAudioSessionMediaServicesWereResetNotification(v4);
    [(AVFASoftLink *)v4 removeObserver:self name:v5 object:v8];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = AVFASoftLink::getAVAudioSessionMediaServicesWereLostNotification(v6);
    [(AVFASoftLink *)v6 removeObserver:self name:v7 object:v8];
  }
}

- (int64_t)getReporterIDFromAVAudioSession:(id)a3
{
  os_signpost_id_t v3 = (AVFASoftLink *)a3;
  AVFASoftLink::getAVAudioSession(v3);
  int64_t v4 = [(AVFASoftLink *)v3 reporterID];

  return v4;
}

- (void)handleConnectionError
{
  player = self->_player;
  self->_player = 0;

  [(CHHapticEngine *)self setRunning:0];
}

void __29__CHHapticEngine_finishInit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = [v3 localizedDescription];
    int v14 = 136315906;
    __int16 v15 = "CHHapticEngine.mm";
    __int16 v16 = 1024;
    int v17 = 646;
    __int16 v18 = 2080;
    uint64_t v19 = "-[CHHapticEngine finishInit:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server connection broke with error '%@'", (uint8_t *)&v14, 0x26u);
  }
LABEL_8:
  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained handleConnectionError];

  id v10 = objc_loadWeakRetained(v8);
  id v11 = [v10 serverConfig];
  LODWORD(v8) = [v11 usingInternalHaptics];

  if (v8)
  {
    if (kHAPIScope)
    {
      __int16 v12 = *(id *)kHAPIScope;
      if (!v12) {
        goto LABEL_16;
      }
    }
    else
    {
      __int16 v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      __int16 v15 = "CHHapticEngine.mm";
      __int16 v16 = 1024;
      int v17 = 649;
      __int16 v18 = 2080;
      uint64_t v19 = "-[CHHapticEngine finishInit:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Waiting to reconnect", (uint8_t *)&v14, 0x1Cu);
    }
  }
LABEL_16:
}

void __29__CHHapticEngine_finishInit___block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v11 = "CHHapticEngine.mm";
    __int16 v12 = 1024;
    int v13 = 688;
    __int16 v14 = 2080;
    __int16 v15 = "-[CHHapticEngine finishInit:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = (int)a2;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: In player's stopRunningHandler block.  Stopped reason: %d", buf, 0x22u);
  }

LABEL_8:
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__CHHapticEngine_finishInit___block_invoke_183;
  v8[3] = &unk_1E622E158;
  objc_copyWeak(v9, v6);
  v9[1] = a2;
  [WeakRetained dispatchOnLocal:v8];

  objc_destroyWeak(v9);
}

void __29__CHHapticEngine_finishInit___block_invoke_183(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained isAutoShutdownEnabled];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 cancelIdleTimer];
  }
  id v6 = objc_loadWeakRetained(v2);
  id v7 = v6;
  if (v6)
  {
    [v6 setRunning:0];
    id v8 = [v7 stoppedHandler];

    if (v8)
    {
      unint64_t v9 = *(void *)(a1 + 40) + 2;
      if (v9 >= 6) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = qword_1BA95A498[v9];
      }
      if (kHAPIScope)
      {
        id v11 = *(id *)kHAPIScope;
        if (!v11)
        {
LABEL_15:
          int v13 = [v7 stoppedHandler];
          v13[2](v13, v10);

          goto LABEL_16;
        }
      }
      else
      {
        id v11 = MEMORY[0x1E4F14500];
        id v12 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        __int16 v15 = "CHHapticEngine.mm";
        __int16 v16 = 1024;
        int v17 = 713;
        __int16 v18 = 2080;
        uint64_t v19 = "-[CHHapticEngine finishInit:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = v10;
        _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling engine-stopped handler with reason %d", (uint8_t *)&v14, 0x22u);
      }

      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)startIdleTimerWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHPWRScope)
  {
    id v5 = *(id *)kHPWRScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    [(CHHapticEngine *)self autoShutdownTimeout];
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "CHHapticEngine.mm";
    __int16 v21 = 1024;
    int v22 = 742;
    __int16 v23 = 2080;
    __int16 v24 = "-[CHHapticEngine startIdleTimerWithHandler:]";
    __int16 v25 = 2048;
    uint64_t v26 = v8;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating idle timer for %.3f seconds", buf, 0x26u);
  }

LABEL_8:
  [(CHHapticEngine *)self autoShutdownTimeout];
  double v10 = v9;
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__CHHapticEngine_startIdleTimerWithHandler___block_invoke;
  handler[3] = &unk_1E622E180;
  id v18 = v4;
  id v12 = v4;
  int v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, dispatchQueue);
  if (v13)
  {
    float v14 = v10;
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(float)(v14 * 1000000000.0));
    dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(v13);
  }
  timer = self->_timer;
  self->_timer = (OS_dispatch_source *)v13;
}

uint64_t __44__CHHapticEngine_startIdleTimerWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (kHPWRScope)
  {
    v2 = *(id *)kHPWRScope;
    if (!v2) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "CHHapticEngine.mm";
    __int16 v7 = 1024;
    int v8 = 744;
    __int16 v9 = 2080;
    double v10 = "-[CHHapticEngine startIdleTimerWithHandler:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling idle timeout handler on internal queue", (uint8_t *)&v5, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginIdleTimer
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke;
  v3[3] = &unk_1E622E360;
  objc_copyWeak(&v4, &location);
  [(CHHapticEngine *)self dispatchOnLocal:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __32__CHHapticEngine_beginIdleTimer__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kHPWRScope)
  {
    v2 = *(id *)kHPWRScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    double v10 = "CHHapticEngine.mm";
    __int16 v11 = 1024;
    int v12 = 753;
    __int16 v13 = 2080;
    float v14 = "-[CHHapticEngine beginIdleTimer]_block_invoke";
    _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Starting idle timer (on async dispatch)", buf, 0x1Cu);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_initWeak((id *)buf, WeakRetained);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke_185;
  v6[3] = &unk_1E622E6E0;
  objc_copyWeak(&v8, (id *)buf);
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  [v5 startIdleTimerWithHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __32__CHHapticEngine_beginIdleTimer__block_invoke_185(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHPWRScope)
  {
    id v4 = *(id *)kHPWRScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "CHHapticEngine.mm";
    __int16 v12 = 1024;
    int v13 = 757;
    __int16 v14 = 2080;
    uint64_t v15 = "-[CHHapticEngine beginIdleTimer]_block_invoke";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping engine in response to timeout", buf, 0x1Cu);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke_186;
  v7[3] = &unk_1E622E6E0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  [WeakRetained stopWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
}

void __32__CHHapticEngine_beginIdleTimer__block_invoke_186(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) stoppedHandler];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke_2;
    v5[3] = &unk_1E622E180;
    id v6 = v3;
    id v4 = v3;
    [WeakRetained dispatchOnLocal:v5];
  }
}

uint64_t __32__CHHapticEngine_beginIdleTimer__block_invoke_2(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (kHPWRScope)
    {
      v2 = *(id *)kHPWRScope;
      if (!v2) {
        return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
      }
    }
    else
    {
      v2 = MEMORY[0x1E4F14500];
      id v3 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      id v5 = "CHHapticEngine.mm";
      __int16 v6 = 1024;
      int v7 = 765;
      __int16 v8 = 2080;
      id v9 = "-[CHHapticEngine beginIdleTimer]_block_invoke_2";
      _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling client's engine-stopped handler on internal queue", (uint8_t *)&v4, 0x1Cu);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)cancelIdleTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(CHHapticEngine *)self timer];

  if (v3)
  {
    if (kHPWRScope)
    {
      int v4 = *(id *)kHPWRScope;
      if (!v4)
      {
LABEL_9:
        __int16 v6 = [(CHHapticEngine *)self timer];
        dispatch_source_cancel(v6);

        [(CHHapticEngine *)self setTimer:0];
        return;
      }
    }
    else
    {
      int v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315650;
      __int16 v8 = "CHHapticEngine.mm";
      __int16 v9 = 1024;
      int v10 = 778;
      __int16 v11 = 2080;
      __int16 v12 = "-[CHHapticEngine cancelIdleTimer]";
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Cancelling idle timer", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_9;
  }
}

void __31__CHHapticEngine_handleFinish___block_invoke_187(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    int v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    int v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "CHHapticEngine.mm";
    __int16 v16 = 1024;
    int v17 = 809;
    __int16 v18 = 2080;
    uint64_t v19 = "-[CHHapticEngine handleFinish:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of doStopWithCompletionHandler block>", buf, 0x1Cu);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __31__CHHapticEngine_handleFinish___block_invoke_188;
    v12[3] = &unk_1E622E180;
    int v7 = &v13;
    id v13 = *(id *)(a1 + 32);
    [WeakRetained dispatchOnLocal:v12];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__CHHapticEngine_handleFinish___block_invoke_189;
    v10[3] = &unk_1E622E180;
    int v7 = &v11;
    id v11 = *(id *)(a1 + 32);
    +[CHHapticEngine dispatchOnGlobal:v10];
  }

  if (kHAPIScope)
  {
    __int16 v8 = *(id *)kHAPIScope;
    if (!v8) {
      goto LABEL_18;
    }
  }
  else
  {
    __int16 v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "CHHapticEngine.mm";
    __int16 v16 = 1024;
    int v17 = 829;
    __int16 v18 = 2080;
    uint64_t v19 = "-[CHHapticEngine handleFinish:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Bottom of doStopWithCompletionHandler block>", buf, 0x1Cu);
  }

LABEL_18:
}

uint64_t __31__CHHapticEngine_handleFinish___block_invoke_188(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (kHAPIScope)
    {
      v2 = *(id *)kHAPIScope;
      if (!v2) {
        return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
      }
    }
    else
    {
      v2 = MEMORY[0x1E4F14500];
      id v3 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      id v5 = "CHHapticEngine.mm";
      __int16 v6 = 1024;
      int v7 = 814;
      __int16 v8 = 2080;
      id v9 = "-[CHHapticEngine handleFinish:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling engine-stopped handler on internal queue", (uint8_t *)&v4, 0x1Cu);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __31__CHHapticEngine_handleFinish___block_invoke_189(uint64_t result)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (kHAPIScope)
    {
      id v2 = *(id *)kHAPIScope;
      if (!v2) {
        return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
      }
    }
    else
    {
      id v2 = (id)MEMORY[0x1E4F14500];
      id v3 = MEMORY[0x1E4F14500];
    }
    int v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)MEMORY[0x1BA9F2D90](*(void *)(v1 + 32));
      int v6 = 136315906;
      int v7 = "CHHapticEngine.mm";
      __int16 v8 = 1024;
      int v9 = 824;
      __int16 v10 = 2080;
      id v11 = "-[CHHapticEngine handleFinish:]_block_invoke";
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied stopped handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v6, 0x26u);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __31__CHHapticEngine_handleFinish___block_invoke_190(uint64_t result)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (kHAPIScope)
    {
      id v2 = *(id *)kHAPIScope;
      if (!v2) {
        return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
      }
    }
    else
    {
      id v2 = (id)MEMORY[0x1E4F14500];
      id v3 = MEMORY[0x1E4F14500];
    }
    int v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)MEMORY[0x1BA9F2D90](*(void *)(v1 + 32));
      int v6 = 136315906;
      int v7 = "CHHapticEngine.mm";
      __int16 v8 = 1024;
      int v9 = 836;
      __int16 v10 = 2080;
      id v11 = "-[CHHapticEngine handleFinish:]_block_invoke";
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied stopped handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v6, 0x26u);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)stopAndWait
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if ([(CHHapticEngine *)v2 running])
  {
    if (kHAPIScope)
    {
      id v3 = *(id *)kHAPIScope;
      if (!v3)
      {
LABEL_12:
        int v7 = [(CHHapticEngine *)v2 stoppedHandler];
        id v13 = 0;
        [(CHHapticEngine *)v2 doStopEngineAndWait:&v13];
        int v4 = v13;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __29__CHHapticEngine_stopAndWait__block_invoke;
        v11[3] = &unk_1E622E180;
        id v8 = v7;
        id v12 = v8;
        [(CHHapticEngine *)v2 dispatchOnLocal:v11];

        goto LABEL_16;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      player = v2->_player;
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = "CHHapticEngine.mm";
      __int16 v16 = 1024;
      int v17 = 869;
      __int16 v18 = 2080;
      uint64_t v19 = "-[CHHapticEngine stopAndWait]";
      __int16 v20 = 2048;
      __int16 v21 = player;
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Synchronously stopping the underlying player %p", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kHAPIScope)
  {
    int v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_17;
    }
  }
  else
  {
    int v4 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __int16 v10 = v2->_player;
    *(_DWORD *)buf = 136315906;
    uint64_t v15 = "CHHapticEngine.mm";
    __int16 v16 = 1024;
    int v17 = 881;
    __int16 v18 = 2080;
    uint64_t v19 = "-[CHHapticEngine stopAndWait]";
    __int16 v20 = 2048;
    __int16 v21 = v10;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Underlying player %p not running", buf, 0x26u);
  }
LABEL_16:

LABEL_17:
  objc_sync_exit(v2);
}

uint64_t __29__CHHapticEngine_stopAndWait__block_invoke(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (kHAPIScope)
    {
      id v2 = *(id *)kHAPIScope;
      if (!v2) {
        return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
      }
    }
    else
    {
      id v2 = MEMORY[0x1E4F14500];
      id v3 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315650;
      id v5 = "CHHapticEngine.mm";
      __int16 v6 = 1024;
      int v7 = 875;
      __int16 v8 = 2080;
      id v9 = "-[CHHapticEngine stopAndWait]_block_invoke";
      _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling stop completion handler on internal queue", (uint8_t *)&v4, 0x1Cu);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
    uint64_t v14 = "CHHapticEngine.mm";
    __int16 v15 = 1024;
    int v16 = 888;
    __int16 v17 = 2080;
    __int16 v18 = "-[CHHapticEngine dealloc]";
    __int16 v19 = 2048;
    __int16 v20 = self;
    _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: synchronously stopping and destroying engine %p", buf, 0x26u);
  }

LABEL_8:
  [(CHHapticEngine *)self stopAndWait];
  id v5 = [(CHHapticEngine *)self avAudioSession];
  [(CHHapticEngine *)self disconnectAudioSession:v5];

  [(CHHapticEngine *)self doUnregisterAllPublicAudioResources];
  player = self->_player;
  self->_player = 0;

  avAudioSession = self->_avAudioSession;
  self->_avAudioSession = 0;

  id stoppedHandler = self->_stoppedHandler;
  self->_id stoppedHandler = 0;

  metrics = self->_metrics;
  self->_metrics = 0;

  if (kHAPIScope)
  {
    uint64_t v10 = *(id *)kHAPIScope;
    if (!v10) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "CHHapticEngine.mm";
    __int16 v15 = 1024;
    int v16 = 896;
    __int16 v17 = 2080;
    __int16 v18 = "-[CHHapticEngine dealloc]";
    __int16 v19 = 2048;
    __int16 v20 = self;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: done destroying engine %p", buf, 0x26u);
  }

LABEL_15:
  v12.receiver = self;
  v12.super_class = (Class)CHHapticEngine;
  [(CHHapticEngine *)&v12 dealloc];
}

- (CHHapticEngine)init
{
  return 0;
}

- (CHHapticEngine)initAndReturnError:(NSError *)error
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (setupHapticLogScopes(void)::once != -1) {
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  }
  id v5 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  int v7 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HapticEngine_initAndReturnError", " enableTelemetry=YES ", buf, 2u);
  }

  v21.receiver = self;
  v21.super_class = (Class)CHHapticEngine;
  id v9 = [(CHHapticEngine *)&v21 init];
  if (!v9) {
    goto LABEL_21;
  }
  if (kHAPIScope)
  {
    uint64_t v10 = *(id *)kHAPIScope;
    if (!v10) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "CHHapticEngine.mm";
    __int16 v24 = 1024;
    int v25 = 1005;
    __int16 v26 = 2080;
    uint64_t v27 = "-[CHHapticEngine initAndReturnError:]";
    __int16 v28 = 2048;
    BOOL v29 = v9;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with legacy initializer", buf, 0x26u);
  }

LABEL_14:
  objc_super v12 = +[CHHapticEngine capabilitiesForHardware];
  uint64_t v13 = [v12 supportsHaptics];
  if (v13 & 1) != 0 || (uint64_t v13 = [v12 supportsAudio], (v13))
  {
    uint64_t v14 = [AVFASoftLink::getAVAudioSession((AVFASoftLink *)v13) auxiliarySession];
    avAudioSession = v9->_avAudioSession;
    v9->_avAudioSession = (AVAudioSession *)v14;

    objc_storeStrong((id *)&v9->_usageCategory, @"Default");
    if ([(CHHapticEngine *)v9 setupEngineWithCategory:v9->_usageCategory session:v9->_avAudioSession needsAudioPowerBudget:[(CHHapticEngine *)v9 needsAudioPowerBudget] error:error]&& ([(CHHapticEngine *)v9 connectAudioSession:v9->_avAudioSession], uint64_t v16 = [(CHHapticEngine *)v9 getSessionIDFromAVAudioSession:v9->_avAudioSession], [(CHHapticEngine *)v9 doInit:v16 sessionIsShared:0 options:0 bypassAudioSession:0 error:error]))
    {
      __int16 v17 = [[CHMetrics alloc] initWithEngine:v9 audioSessionID:v16 sessionIsShared:v9->_sessionIsShared isSPI:0];
      metrics = v9->_metrics;
      v9->_metrics = v17;
    }
    else
    {
      metrics = v9;
      id v9 = 0;
    }

LABEL_21:
    __int16 v19 = CALog::Scope::oslog((id *)kHAPIScope);
    objc_super v12 = v19;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_END, v6, "HapticEngine_initAndReturnError", (const char *)&unk_1BA96A542, buf, 2u);
    }
    goto LABEL_27;
  }
  if (error)
  {
    *error = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  }

  id v9 = 0;
LABEL_27:

  return v9;
}

- (CHHapticEngine)initWithAudioSession:(AVAudioSession *)audioSession error:(NSError *)error
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v7 = audioSession;
  if (setupHapticLogScopes(void)::once != -1) {
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  }
  __int16 v8 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);

  uint64_t v10 = CALog::Scope::oslog((id *)kHAPIScope);
  id v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HapticEngine_initWithAudioSession", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v13 = +[CHHapticEngine capabilitiesForHardware];
  if ([v13 supportsHaptics] & 1) != 0 || (objc_msgSend(v13, "supportsAudio"))
  {
    v33.receiver = self;
    v33.super_class = (Class)CHHapticEngine;
    uint64_t v14 = [(CHHapticEngine *)&v33 init];
    if (!v14)
    {
      uint64_t v16 = 0;
      goto LABEL_38;
    }
    if (v7)
    {
      if (kHAPIScope)
      {
        __int16 v15 = *(id *)kHAPIScope;
        if (!v15)
        {
LABEL_27:
          objc_storeStrong((id *)&v14->_avAudioSession, audioSession);
          goto LABEL_33;
        }
      }
      else
      {
        __int16 v15 = MEMORY[0x1E4F14500];
        id v22 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v35 = "CHHapticEngine.mm";
        __int16 v36 = 1024;
        int v37 = 1054;
        __int16 v38 = 2080;
        uint64_t v39 = "-[CHHapticEngine initWithAudioSession:error:]";
        __int16 v40 = 2048;
        __int16 v41 = v14;
        __int16 v42 = 2048;
        __int16 v43 = v7;
        _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with audio session %p", buf, 0x30u);
      }

      goto LABEL_27;
    }
    if (kHAPIScope)
    {
      __int16 v20 = (AVFASoftLink *)*(id *)kHAPIScope;
      objc_super v21 = v20;
      if (!v20) {
        goto LABEL_32;
      }
    }
    else
    {
      objc_super v21 = MEMORY[0x1E4F14500];
      id v23 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v35 = "CHHapticEngine.mm";
      __int16 v36 = 1024;
      int v37 = 1059;
      __int16 v38 = 2080;
      uint64_t v39 = "-[CHHapticEngine initWithAudioSession:error:]";
      __int16 v40 = 2048;
      __int16 v41 = v14;
      _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with internal audio session", buf, 0x26u);
    }

LABEL_32:
    uint64_t v24 = [AVFASoftLink::getAVAudioSession(v20) auxiliarySession];
    avAudioSession = v14->_avAudioSession;
    v14->_avAudioSession = (AVAudioSession *)v24;

    objc_storeStrong((id *)&v14->_usageCategory, @"DefaultWithConstantVolume");
    if (![(CHHapticEngine *)v14 setupEngineWithCategory:v14->_usageCategory session:v14->_avAudioSession needsAudioPowerBudget:[(CHHapticEngine *)v14 needsAudioPowerBudget] error:error])
    {
      uint64_t v16 = 0;
LABEL_37:

LABEL_38:
      uint64_t v30 = CALog::Scope::oslog((id *)kHAPIScope);
      id v31 = v30;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v31, OS_SIGNPOST_INTERVAL_END, v9, "HapticEngine_initWithAudioSession", (const char *)&unk_1BA96A542, buf, 2u);
      }

      self = v16;
      __int16 v19 = self;
      goto LABEL_42;
    }
LABEL_33:
    [(CHHapticEngine *)v14 connectAudioSession:v14->_avAudioSession];
    uint64_t v26 = [(CHHapticEngine *)v14 getSessionIDFromAVAudioSession:v14->_avAudioSession];
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Default", @"Locality", 0);
    if ([(CHHapticEngine *)v14 doInit:v26 sessionIsShared:v7 != 0 options:v27 bypassAudioSession:0 error:error])
    {
      __int16 v28 = [[CHMetrics alloc] initWithEngine:v14 audioSessionID:v26 sessionIsShared:v14->_sessionIsShared isSPI:0];
      metrics = v14->_metrics;
      v14->_metrics = v28;
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = 0;
      metrics = v14;
    }

    uint64_t v14 = (CHHapticEngine *)v27;
    goto LABEL_37;
  }
  if (error)
  {
    *error = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  }
  __int16 v17 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v18 = v17;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v18, OS_SIGNPOST_INTERVAL_END, v9, "HapticEngine_initWithAudioSession", (const char *)&unk_1BA96A542, buf, 2u);
  }

  __int16 v19 = 0;
LABEL_42:

  return v19;
}

- (BOOL)doInitWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHAPIScope)
  {
    int v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v25 = 136315906;
    uint64_t v26 = "CHHapticEngine.mm";
    __int16 v27 = 1024;
    int v28 = 1105;
    __int16 v29 = 2080;
    uint64_t v30 = "-[CHHapticEngine doInitWithOptions:error:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: options: '%@'", (uint8_t *)&v25, 0x26u);
  }

LABEL_8:
  os_signpost_id_t v9 = (OS_dispatch_queue *)dispatch_queue_create("CHHapticEngineDispatchQueue", 0);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v9;

  self->_audioSessionID = 0;
  self->_sessionIsShared = 0;
  id v11 = [(CHHapticEngine *)self createHapticPlayerWithOptions:v6];
  player = self->_player;
  self->_player = v11;

  self->_runTimeout = 120.0;
  uint64_t v13 = [[HapticServerConfig alloc] initWithHapticPlayer:self->_player withOptions:v6 error:a4];
  serverConfig = self->_serverConfig;
  self->_serverConfig = v13;

  if (!self->_serverConfig)
  {
    BOOL v23 = 0;
    goto LABEL_16;
  }
  self->_currentPlayerBehavior = 2;
  __int16 v15 = [(CHHapticEngine *)self serverConfig];
  char v16 = [v15 supportsHapticPlayback];

  if ((v16 & 1) == 0)
  {
    unint64_t v19 = self->_currentPlayerBehavior | 0x10;
    goto LABEL_13;
  }
  __int16 v17 = [(CHHapticEngine *)self serverConfig];
  char v18 = [v17 supportsAudioPlayback];

  if ((v18 & 1) == 0)
  {
    unint64_t v19 = 1;
LABEL_13:
    self->_currentPlayerBehavior = v19;
  }
  priority = self->_priority;
  self->_priority = (NSString *)@"LowPriority";

  hapticPowerUsage = self->_hapticPowerUsage;
  self->_hapticPowerUsage = (NSString *)@"HighPower";

  audioPowerUsage = self->_audioPowerUsage;
  self->_audioPowerUsage = (NSString *)@"HighPower";

  BOOL v23 = [(CHHapticEngine *)self finishInit:a4];
LABEL_16:

  return v23;
}

- (CHHapticEngine)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (setupHapticLogScopes(void)::once != -1) {
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  }
  int v7 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  os_signpost_id_t v9 = CALog::Scope::oslog((id *)kHAPIScope);
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_initWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)CHHapticEngine;
  id v11 = [(CHHapticEngine *)&v16 init];
  unint64_t v12 = v11;
  if (v11 && ![(CHHapticEngine *)v11 doInitWithOptions:v6 error:a4])
  {

    unint64_t v12 = 0;
  }
  uint64_t v13 = CALog::Scope::oslog((id *)kHAPIScope);
  uint64_t v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v14, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_initWithOptions", (const char *)&unk_1BA96A542, buf, 2u);
  }

  return v12;
}

- (void)stopPrewarm
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  id v5 = CALog::Scope::oslog((id *)kHAPIScope);
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HapticEngine_stopPrewarm", " enableTelemetry=YES ", (uint8_t *)&v11, 2u);
  }

  if (kHAPIScope)
  {
    int v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    unint64_t v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1178;
    __int16 v15 = 2080;
    objc_super v16 = "-[CHHapticEngine stopPrewarm]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping prewarm on the underlying Haptic Player", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_11:
  [(AVHapticPlayer *)self->_player stopPrewarm];
  os_signpost_id_t v9 = CALog::Scope::oslog((id *)kHAPIScope);
  uint64_t v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_END, v4, "HapticEngine_stopPrewarm", (const char *)&unk_1BA96A542, (uint8_t *)&v11, 2u);
  }
}

uint64_t __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_214(uint64_t result)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (kHAPIScope)
    {
      id v2 = *(id *)kHAPIScope;
      if (!v2) {
        return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
      }
    }
    else
    {
      id v2 = (id)MEMORY[0x1E4F14500];
      id v3 = MEMORY[0x1E4F14500];
    }
    os_signpost_id_t v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)MEMORY[0x1BA9F2D90](*(void *)(v1 + 40));
      int v6 = 136315906;
      int v7 = "CHHapticEngine.mm";
      __int16 v8 = 1024;
      int v9 = 1225;
      __int16 v10 = 2080;
      int v11 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke";
      __int16 v12 = 2048;
      __int16 v13 = v5;
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied completion handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v6, 0x26u);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __45__CHHapticEngine_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)doStartEngineAndWait:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  int v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__CHHapticEngine_doStartEngineAndWait___block_invoke;
  id v18[3] = &unk_1E622E7D0;
  void v18[4] = self;
  __int16 v20 = &v21;
  int v6 = v5;
  unint64_t v19 = v6;
  [(CHHapticEngine *)self dispatchOnLocal:v18];
  if (kHAPIScope)
  {
    int v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    int v28 = "CHHapticEngine.mm";
    __int16 v29 = 1024;
    int v30 = 1272;
    __int16 v31 = 2080;
    id v32 = "-[CHHapticEngine doStartEngineAndWait:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Waiting for startup...", buf, 0x1Cu);
  }

LABEL_8:
  dispatch_time_t v9 = dispatch_time(0, 4000000000);
  if (!dispatch_group_wait(v6, v9)) {
    goto LABEL_17;
  }
  if (!kHAPIScope)
  {
    __int16 v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    goto LABEL_13;
  }
  __int16 v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_13:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v28 = "CHHapticEngine.mm";
      __int16 v29 = 1024;
      int v30 = 1275;
      __int16 v31 = 2080;
      id v32 = "-[CHHapticEngine doStartEngineAndWait:]";
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Startup timeout", buf, 0x1Cu);
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4808 userInfo:0];
  __int16 v13 = (void *)v22[5];
  v22[5] = v12;

LABEL_17:
  if (a3) {
    *a3 = (id) v22[5];
  }
  if (kHAPIScope)
  {
    uint64_t v14 = *(id *)kHAPIScope;
    if (!v14) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    int v28 = "CHHapticEngine.mm";
    __int16 v29 = 1024;
    int v30 = 1281;
    __int16 v31 = 2080;
    id v32 = "-[CHHapticEngine doStartEngineAndWait:]";
    _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Startup complete", buf, 0x1Cu);
  }

LABEL_26:
  BOOL v16 = v22[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __39__CHHapticEngine_doStartEngineAndWait___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) running] & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__CHHapticEngine_doStartEngineAndWait___block_invoke_2;
    v7[3] = &unk_1E622E690;
    long long v6 = *(_OWORD *)(a1 + 40);
    id v4 = (id)v6;
    long long v8 = v6;
    [v3 doStartWithCompletionHandler:v7];

    return;
  }
  if (!kHAPIScope)
  {
    id v2 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
    goto LABEL_7;
  }
  id v2 = *(id *)kHAPIScope;
  if (v2)
  {
LABEL_7:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v10 = "CHHapticEngine.mm";
      __int16 v11 = 1024;
      int v12 = 1267;
      __int16 v13 = 2080;
      uint64_t v14 = "-[CHHapticEngine doStartEngineAndWait:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine already running", buf, 0x1Cu);
    }
  }
  [*(id *)(a1 + 32) reconfigureAudioSession];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __39__CHHapticEngine_doStartEngineAndWait___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)startAndReturnError:(NSError *)outError
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315906;
    BOOL v16 = "CHHapticEngine.mm";
    __int16 v17 = 1024;
    int v18 = 1287;
    __int16 v19 = 2080;
    __int16 v20 = "-[CHHapticEngine startAndReturnError:]";
    __int16 v21 = 2048;
    id v22 = self;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p", (uint8_t *)&v15, 0x26u);
  }

LABEL_8:
  if (self->_player)
  {
    int v7 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

    dispatch_time_t v9 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_startAndReturnError", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
    }

    BOOL v11 = [(CHHapticEngine *)self doStartEngineAndWait:outError];
    int v12 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v13, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_startAndReturnError", (const char *)&unk_1BA96A542, (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1288, "-[CHHapticEngine startAndReturnError:]", "_player != nil", -4810, outError);
    return 0;
  }
  return v11;
}

- (BOOL)doStopEngineAndWait:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(CHHapticEngine *)self setRunning:0];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1298;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "-[CHHapticEngine doStopEngineAndWait:]";
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Synchronously stopping underlying Haptic Player", buf, 0x1Cu);
  }

LABEL_8:
  int v7 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__3;
  id v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  dispatch_group_enter(v7);
  player = self->_player;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __38__CHHapticEngine_doStopEngineAndWait___block_invoke;
  uint64_t v24 = &unk_1E622E690;
  id v26 = buf;
  dispatch_time_t v9 = v7;
  int v25 = v9;
  [(AVHapticPlayer *)player stopRunningWithCompletionHandler:&v21];
  if (kHAPIScope)
  {
    __int16 v10 = *(id *)kHAPIScope;
    if (!v10) {
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int16 v27 = 136315650;
    int v28 = "CHHapticEngine.mm";
    __int16 v29 = 1024;
    int v30 = 1310;
    __int16 v31 = 2080;
    id v32 = "-[CHHapticEngine doStopEngineAndWait:]";
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Waiting for player stop...", v27, 0x1Cu);
  }

LABEL_15:
  dispatch_time_t v12 = dispatch_time(0, 4000000000);
  if (dispatch_group_wait(v9, v12))
  {
    if (kHAPIScope)
    {
      __int16 v13 = *(id *)kHAPIScope;
      if (!v13) {
        goto LABEL_30;
      }
    }
    else
    {
      __int16 v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v27 = 136315650;
      int v28 = "CHHapticEngine.mm";
      __int16 v29 = 1024;
      int v30 = 1313;
      __int16 v31 = 2080;
      id v32 = "-[CHHapticEngine doStopEngineAndWait:]";
      int v15 = "%25s:%-5d %s: WARNING: timed out waiting for underlying player to stop";
      BOOL v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_28:
      _os_log_impl(&dword_1BA902000, v16, v17, v15, v27, 0x1Cu);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (!kHAPIScope)
  {
    __int16 v13 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
LABEL_26:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int16 v27 = 136315650;
      int v28 = "CHHapticEngine.mm";
      __int16 v29 = 1024;
      int v30 = 1316;
      __int16 v31 = 2080;
      id v32 = "-[CHHapticEngine doStopEngineAndWait:]";
      int v15 = "%25s:%-5d %s: Done waiting for underlying player stop";
      BOOL v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
      goto LABEL_28;
    }
LABEL_29:

    goto LABEL_30;
  }
  __int16 v13 = *(id *)kHAPIScope;
  if (v13) {
    goto LABEL_26;
  }
LABEL_30:
  if ([(CHHapticEngine *)self isAutoShutdownEnabled]) {
    [(CHHapticEngine *)self cancelIdleTimer];
  }
  *a3 = *(id *)(*(void *)&buf[8] + 40);
  BOOL v19 = *(void *)(*(void *)&buf[8] + 40) == 0;

  _Block_object_dispose(buf, 8);
  return v19;
}

void __38__CHHapticEngine_doStopEngineAndWait___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    id v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    id v14 = "CHHapticEngine.mm";
    __int16 v15 = 1024;
    int v16 = 1303;
    __int16 v17 = 2080;
    id v18 = "-[CHHapticEngine doStopEngineAndWait:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: In underlying AVHapticPlayer's completion handler block for doStopEngineAndWait", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_8:
  if (v3)
  {
    if (kHAPIScope)
    {
      id v6 = *(id *)kHAPIScope;
      if (!v6) {
        goto LABEL_16;
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    os_signpost_id_t v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v9 = [v3 localizedDescription];
      int v13 = 136315906;
      id v14 = "CHHapticEngine.mm";
      __int16 v15 = 1024;
      int v16 = 1305;
      __int16 v17 = 2080;
      id v18 = "-[CHHapticEngine doStopEngineAndWait:]_block_invoke";
      __int16 v19 = 2112;
      __int16 v20 = v9;
      _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player stop failed: %@", (uint8_t *)&v13, 0x26u);
    }
  }
LABEL_16:
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v3;
  id v12 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_219(uint64_t result)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (kHAPIScope)
    {
      id v2 = *(id *)kHAPIScope;
      if (!v2) {
        return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
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
      id v5 = (void *)MEMORY[0x1BA9F2D90](*(void *)(v1 + 40));
      int v6 = 136315906;
      id v7 = "CHHapticEngine.mm";
      __int16 v8 = 1024;
      int v9 = 1354;
      __int16 v10 = 2080;
      id v11 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
      __int16 v12 = 2048;
      int v13 = v5;
      _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied completion handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v6, 0x26u);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __44__CHHapticEngine_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (CHHapticEngine)initWithAudioSessionID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (setupHapticLogScopes(void)::once != -1) {
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  }
  id v7 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  int v9 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_initWithAudioSessionID", " enableTelemetry=YES ", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)CHHapticEngine;
  id v11 = [(CHHapticEngine *)&v19 init];
  if (v11)
  {
    if (kHAPIScope)
    {
      __int16 v12 = *(id *)kHAPIScope;
      if (!v12)
      {
LABEL_14:
        if ([(CHHapticEngine *)v11 doInit:v5 sessionIsShared:1 options:0 bypassAudioSession:0 error:a4])
        {
          uint64_t v14 = [[CHMetrics alloc] initWithEngine:v11 audioSessionID:v5 sessionIsShared:v11->_sessionIsShared isSPI:1];
          metrics = v11->_metrics;
          v11->_metrics = v14;
        }
        else
        {
          metrics = v11;
          id v11 = 0;
        }

        goto LABEL_18;
      }
    }
    else
    {
      __int16 v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "CHHapticEngine.mm";
      __int16 v22 = 1024;
      int v23 = 1411;
      __int16 v24 = 2080;
      int v25 = "-[CHHapticEngine initWithAudioSessionID:error:]";
      __int16 v26 = 2048;
      __int16 v27 = v11;
      __int16 v28 = 1024;
      int v29 = v5;
      _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating engine %p with shared audio session ID %u", buf, 0x2Cu);
    }

    goto LABEL_14;
  }
LABEL_18:
  int v16 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v17, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_initWithAudioSessionID", (const char *)&unk_1BA96A542, buf, 2u);
  }

  return v11;
}

- (CHHapticEngine)initWithAudioSessionID:(unsigned int)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (setupHapticLogScopes(void)::once != -1) {
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  }
  int v9 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  id v11 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HapticEngine_initWithAudioSessionID_options", " enableTelemetry=YES ", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)CHHapticEngine;
  id v13 = [(CHHapticEngine *)&v24 init];
  uint64_t v14 = v13;
  if (v13)
  {
    [(CHHapticEngine *)v13 storeOptions:v8];
    if (kHAPIScope)
    {
      __int16 v15 = *(id *)kHAPIScope;
      if (!v15) {
        goto LABEL_14;
      }
    }
    else
    {
      __int16 v15 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v26 = "CHHapticEngine.mm";
      __int16 v27 = 1024;
      int v28 = 1432;
      __int16 v29 = 2080;
      uint64_t v30 = "-[CHHapticEngine initWithAudioSessionID:options:error:]";
      __int16 v31 = 2048;
      id v32 = v14;
      __int16 v33 = 1024;
      int v34 = v6;
      _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating engine %p with shared audio session ID %u", buf, 0x2Cu);
    }

LABEL_14:
    if (![(CHHapticEngine *)v14 doInit:v6 sessionIsShared:1 options:v8 bypassAudioSession:0 error:a5])
    {
      metrics = v14;
      uint64_t v14 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (kHAPIScope)
    {
      __int16 v17 = *(id *)kHAPIScope;
      if (!v17)
      {
LABEL_23:
        [(CHHapticEngine *)v14 setActivateAudioSessionOnStart:0];
        [(CHHapticEngine *)v14 updateEngineBehavior];
        __int16 v20 = [[CHMetrics alloc] initWithEngine:v14 audioSessionID:v6 sessionIsShared:v14->_sessionIsShared isSPI:1];
        metrics = v14->_metrics;
        v14->_metrics = v20;
        goto LABEL_24;
      }
    }
    else
    {
      __int16 v17 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "CHHapticEngine.mm";
      __int16 v27 = 1024;
      int v28 = 1437;
      __int16 v29 = 2080;
      uint64_t v30 = "-[CHHapticEngine initWithAudioSessionID:options:error:]";
      _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting behavior to not activate audio session (if haptics-only)", buf, 0x1Cu);
    }

    goto LABEL_23;
  }
LABEL_25:
  uint64_t v21 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v22, OS_SIGNPOST_INTERVAL_END, v10, "HapticEngine_initWithAudioSessionID_options", (const char *)&unk_1BA96A542, buf, 2u);
  }

  return v14;
}

- (CHHapticEngine)initWithAudioSession:(id)a3 sessionIsShared:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Default", @"Locality", 0);
  os_signpost_id_t v10 = [(CHHapticEngine *)self initWithAudioSession:v8 sessionIsShared:v6 options:v9 error:a5];

  return v10;
}

- (id)createPlayerWithPattern:(CHHapticPattern *)pattern error:(NSError *)outError
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v6 = pattern;
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1530;
    __int16 v15 = 2080;
    id v16 = "-[CHHapticEngine createPlayerWithPattern:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating player from pattern", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    int v9 = [[PatternPlayer alloc] initWithPlayable:v6 engine:self privileged:0 error:outError];
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1531, "-[CHHapticEngine createPlayerWithPattern:error:]", "_player != nil", -4810, outError);
    int v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithPattern:(CHHapticPattern *)pattern error:(NSError *)outError
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v6 = pattern;
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1537;
    __int16 v15 = 2080;
    id v16 = "-[CHHapticEngine createAdvancedPlayerWithPattern:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from pattern", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    int v9 = [[AdvancedPatternPlayer alloc] initWithPattern:v6 engine:self privileged:0 error:outError];
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1538, "-[CHHapticEngine createAdvancedPlayerWithPattern:error:]", "_player != nil", -4810, outError);
    int v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithRingtoneData:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1546;
    __int16 v15 = 2080;
    id v16 = "-[CHHapticEngine createAdvancedPlayerWithRingtoneData:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from ringtone data", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    int v9 = [[AdvancedPatternPlayer alloc] initWithRingtoneData:v6 engine:self error:a4];
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1547, "-[CHHapticEngine createAdvancedPlayerWithRingtoneData:error:]", "_player != nil", -4810, a4);
    int v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithVibePatternDictionary:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1555;
    __int16 v15 = 2080;
    id v16 = "-[CHHapticEngine createAdvancedPlayerWithVibePatternDictionary:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from vibe pattern dictionary", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    int v9 = [[AdvancedPatternPlayer alloc] initWithVibePatternDictionary:v6 engine:self error:a4];
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1556, "-[CHHapticEngine createAdvancedPlayerWithVibePatternDictionary:error:]", "_player != nil", -4810, a4);
    int v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithRingtonePattern:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1563;
    __int16 v15 = 2080;
    id v16 = "-[CHHapticEngine createAdvancedPlayerWithRingtonePattern:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from ringtone pattern", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    int v9 = [[AdvancedPatternPlayer alloc] initWithPattern:v6 engine:self privileged:1 error:a4];
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1564, "-[CHHapticEngine createAdvancedPlayerWithRingtonePattern:error:]", "_player != nil", -4810, a4);
    int v9 = 0;
  }

  return v9;
}

- (BOOL)resourceIsRegistered:(unint64_t)a3
{
  return +[CHHapticEngine resourceIsRegistered:a3];
}

- (double)getDurationForResource:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  uint64_t v5 = *(void **)(_sResourceEntries + 8);
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = (void *)(_sResourceEntries + 8);
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      int v9 = v5;
    }
    else {
      int v9 = v5 + 1;
    }
    if (v8) {
      id v6 = v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 == (void *)(_sResourceEntries + 8) || v6[4] > a3)
  {
LABEL_12:
    if (kHAPIScope)
    {
      os_signpost_id_t v10 = *(id *)kHAPIScope;
      if (!v10)
      {
LABEL_19:
        double v12 = 0.0;
        goto LABEL_20;
      }
    }
    else
    {
      os_signpost_id_t v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      uint64_t v17 = "CHHapticEngine.mm";
      __int16 v18 = 1024;
      int v19 = 1587;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CHHapticEngine getDurationForResource:]";
      __int16 v22 = 1024;
      int v23 = a3;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot find resource referenced by ID %u. Returning 0.0", (uint8_t *)&v16, 0x22u);
    }

    goto LABEL_19;
  }
  uint64_t v15 = v6[5];
  int v14 = (std::__shared_weak_count *)v6[6];
  if (v14)
  {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    double v12 = (double)*(unint64_t *)(v15 + 16) / *(double *)(v15 + 24);
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  else
  {
    double v12 = (double)*(unint64_t *)(v15 + 16) / *(double *)(v15 + 24);
  }
LABEL_20:
  std::mutex::unlock(v4);
  return v12;
}

- (BOOL)isResourceLoopEnabled:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  uint64_t v5 = *(void **)(_sResourceEntries + 8);
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = _sResourceEntries + 8;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      int v9 = v5;
    }
    else {
      int v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = (uint64_t)v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != _sResourceEntries + 8 && *(void *)(v6 + 32) <= a3)
  {
    double v12 = [*(id *)(v6 + 56) objectForKeyedSubscript:CHHapticAudioResourceKeyLoopEnabled];
    __int16 v13 = v12;
    if (v12) {
      LOBYTE(v10) = [v12 BOOLValue];
    }
    else {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
LABEL_12:
    if (kHAPIScope)
    {
      os_signpost_id_t v10 = *(id *)kHAPIScope;
      if (!v10) {
        goto LABEL_23;
      }
    }
    else
    {
      os_signpost_id_t v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315906;
      int v16 = "CHHapticEngine.mm";
      __int16 v17 = 1024;
      int v18 = 1599;
      __int16 v19 = 2080;
      __int16 v20 = "-[CHHapticEngine isResourceLoopEnabled:]";
      __int16 v21 = 1024;
      int v22 = a3;
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot find resource referenced by ID %u. Returning FALSE", (uint8_t *)&v15, 0x22u);
    }

    LOBYTE(v10) = 0;
  }
LABEL_23:
  std::mutex::unlock(v4);
  return (char)v10;
}

- (id)getMetricsForPlayer:(id)a3
{
  id v3 = [(CHMetrics *)self->_metrics getMetricsForPlayer:a3];

  return v3;
}

- (void)setMetricsTestModeEnabled
{
}

- (__map_iterator<std::__tree_iterator<std::__value_type<unsigned)doFindPublicAudioResourceID:(unint64_t)a3
{
  left = self->_publicAudioResources.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  id v4 = left;
  if (!left) {
    return (__map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>>)p_pair1;
  }
  v6.var0.var0 = p_pair1;
  do
  {
    unint64_t v7 = v4[4];
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      int v9 = v4;
    }
    else {
      int v9 = v4 + 1;
    }
    if (v8) {
      v6.var0.var0 = v4;
    }
    id v4 = (void *)*v9;
  }
  while (*v9);
  if (v6.var0.var0 == p_pair1 || *((void *)v6.var0.var0 + 4) > a3) {
    return (__map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>>)p_pair1;
  }
  return v6;
}

- (void)addPublicAudioResourceID:(unint64_t)a3 withURL:(id)a4 options:(id)a5
{
  int v6 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (kHAPIScope)
  {
    os_signpost_id_t v10 = *(id *)kHAPIScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    os_signpost_id_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1640;
    __int16 v17 = 2080;
    int v18 = "-[CHHapticEngine addPublicAudioResourceID:withURL:options:]";
    __int16 v19 = 2048;
    __int16 v20 = self;
    __int16 v21 = 1024;
    int v22 = v6;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine %p adding resID %u to public resource list", buf, 0x2Cu);
  }

LABEL_8:
  if (&self->_publicAudioResources.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)[(CHHapticEngine *)self doFindPublicAudioResourceID:v15]) {
    -[CHHapticEngine addPublicAudioResourceID:withURL:options:]();
  }
  p_publicAudioResources = (uint64_t **)&self->_publicAudioResources;
  id v13 = v8;
  *(void *)buf = v13;
  id v14 = v9;
  *(void *)&uint8_t buf[8] = v14;
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<NSURL * {__strong},NSDictionary * {__strong}>>(p_publicAudioResources, &v15, &v15, (long long *)buf);
}

- (BOOL)hasPublicAudioResourceID:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5.var0.var0 = (void *)-[CHHapticEngine doFindPublicAudioResourceID:](self, "doFindPublicAudioResourceID:");
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  if (kHAPIScope)
  {
    unint64_t v7 = *(id *)kHAPIScope;
    if (!v7) {
      return p_pair1 != v5.var0.var0;
    }
  }
  else
  {
    unint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = "did not find";
    int v11 = 136316418;
    double v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1649;
    int v16 = "-[CHHapticEngine hasPublicAudioResourceID:]";
    __int16 v15 = 2080;
    if (p_pair1 != v5.var0.var0) {
      id v9 = "found";
    }
    __int16 v17 = 2048;
    int v18 = self;
    __int16 v19 = 2080;
    __int16 v20 = v9;
    __int16 v21 = 1024;
    int v22 = v3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine %p %s resID %u", (uint8_t *)&v11, 0x36u);
  }

  return p_pair1 != v5.var0.var0;
}

- (unint64_t)idForPublicAudioResourceURL:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)self->_publicAudioResources.__tree_.__begin_node_;
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  if (begin_node != &self->_publicAudioResources.__tree_.__pair1_)
  {
    do
    {
      unint64_t left = (unint64_t)begin_node[4].__value_.__left_;
      id v11 = begin_node[5].__value_.__left_;
      id v12 = begin_node[6].__value_.__left_;
      __int16 v13 = [v11 absoluteString];
      int v14 = [v6 absoluteString];
      if ([v13 isEqualToString:v14])
      {
        char v15 = [v12 isEqualToDictionary:v7];

        if (v15) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      int v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v16)
      {
        do
        {
          __int16 v17 = v16;
          int v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)v16->__value_.__left_;
        }
        while (v16);
      }
      else
      {
        do
        {
          __int16 v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v18 = v17->__value_.__left_ == begin_node;
          begin_node = v17;
        }
        while (!v18);
      }
      begin_node = v17;
    }
    while (v17 != p_pair1);
  }
  unint64_t left = 0;
LABEL_13:

  return left;
}

- (void)removePublicAudioResourceID:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kHAPIScope)
  {
    __map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>> v5 = *(id *)kHAPIScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    __map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>> v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136316162;
    id v9 = "CHHapticEngine.mm";
    __int16 v10 = 1024;
    int v11 = 1665;
    __int16 v12 = 2080;
    __int16 v13 = "-[CHHapticEngine removePublicAudioResourceID:]";
    __int16 v14 = 2048;
    char v15 = self;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine %p removing resID %u from public resource list", (uint8_t *)&v8, 0x2Cu);
  }

LABEL_8:
  id v7 = [(CHHapticEngine *)self doFindPublicAudioResourceID:a3];
  if (&self->_publicAudioResources.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)v7) {
    -[CHHapticEngine removePublicAudioResourceID:]();
  }
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::erase((uint64_t **)&self->_publicAudioResources, (uint64_t)v7);
}

- (CHHapticAudioResourceID)registerAudioResource:(NSURL *)resourceURL options:(NSDictionary *)options error:(NSError *)outError
{
  int v8 = resourceURL;
  id v9 = options;
  __int16 v10 = [(CHHapticEngine *)self player];

  if (v10)
  {
    int v11 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);

    __int16 v13 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "HapticEngine_registerAudioResource", " enableTelemetry=YES ", buf, 2u);
    }

    char v15 = self;
    objc_sync_enter(v15);
    __int16 v16 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    if (v9) {
      __int16 v16 = v9;
    }
    int v17 = v16;

    CHHapticAudioResourceID v18 = [(CHHapticEngine *)v15 idForPublicAudioResourceURL:v8 withOptions:v17];
    if (!v18)
    {
      __int16 v19 = [(CHHapticEngine *)v15 player];
      id v25 = 0;
      CHHapticAudioResourceID v18 = +[CHHapticEngine doRegisterAudioResource:v8 options:v17 fromPattern:0 player:v19 error:&v25];
      id v20 = v25;

      if (!v20 && v18) {
        [(CHHapticEngine *)v15 addPublicAudioResourceID:v18 withURL:v8 options:v17];
      }
      if (outError) {
        *outError = (NSError *)v20;
      }
    }
    objc_sync_exit(v15);

    __int16 v21 = CALog::Scope::oslog((id *)kHAPIScope);
    int v22 = v21;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v22, OS_SIGNPOST_INTERVAL_END, v12, "HapticEngine_registerAudioResource", (const char *)&unk_1BA96A542, v24, 2u);
    }
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1683, "-[CHHapticEngine registerAudioResource:options:error:]", "self.player != nil", -4810, outError);
    CHHapticAudioResourceID v18 = 0;
    int v17 = v9;
  }

  return v18;
}

- (BOOL)unregisterAudioResource:(CHHapticAudioResourceID)resourceID error:(NSError *)outError
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = [(CHHapticEngine *)self player];

  if (!v7)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1708, "-[CHHapticEngine unregisterAudioResource:error:]", "self.player != nil", -4810, outError);
    return 0;
  }
  int v8 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);

  __int16 v10 = CALog::Scope::oslog((id *)kHAPIScope);
  int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HapticEngine_unregisterAudioResource", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  os_signpost_id_t v12 = self;
  objc_sync_enter(v12);
  if ([(CHHapticEngine *)v12 hasPublicAudioResourceID:resourceID])
  {
    __int16 v13 = [(CHHapticEngine *)v12 player];
    BOOL v14 = +[CHHapticEngine doUnregisterAudioResource:resourceID fromPattern:0 player:v13 error:outError];

    if (v14)
    {
      [(CHHapticEngine *)v12 removePublicAudioResourceID:resourceID];
      BOOL v15 = 1;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (kHAPIScope)
  {
    __int16 v16 = *(id *)kHAPIScope;
    if (!v16) {
      goto LABEL_16;
    }
  }
  else
  {
    __int16 v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315906;
    int v22 = "CHHapticEngine.mm";
    __int16 v23 = 1024;
    int v24 = 1719;
    __int16 v25 = 2080;
    __int16 v26 = "-[CHHapticEngine unregisterAudioResource:error:]";
    __int16 v27 = 1024;
    int v28 = resourceID;
    _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: audio resource ID %u not registered on this CHHapticEngine", (uint8_t *)&v21, 0x22u);
  }

LABEL_16:
  if (outError)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4824 userInfo:0];
    BOOL v15 = 0;
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_18:
  BOOL v15 = 0;
LABEL_19:
  objc_sync_exit(v12);

  CHHapticAudioResourceID v18 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v19 = v18;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v19, OS_SIGNPOST_INTERVAL_END, v9, "HapticEngine_unregisterAudioResource", (const char *)&unk_1BA96A542, (uint8_t *)&v21, 2u);
  }

  return v15;
}

- (void)doUnregisterAllPublicAudioResources
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_publicAudioResources.__tree_.__pair3_.__value_)
  {
    if (kHAPIScope)
    {
      int v3 = *(id *)kHAPIScope;
      if (!v3) {
        goto LABEL_9;
      }
    }
    else
    {
      int v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "CHHapticEngine.mm";
      __int16 v17 = 1024;
      int v18 = 1729;
      __int16 v19 = 2080;
      id v20 = "-[CHHapticEngine doUnregisterAllPublicAudioResources]";
      _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Attempting to remove all remaining public audio resources for this engine", buf, 0x1Cu);
    }
  }
LABEL_9:
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)self->_publicAudioResources.__tree_.__begin_node_;
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  if (begin_node != &self->_publicAudioResources.__tree_.__pair1_)
  {
    do
    {
      unint64_t left = begin_node[4].__value_.__left_;
      id v8 = begin_node[5].__value_.__left_;
      id v9 = begin_node[6].__value_.__left_;
      __int16 v10 = [(CHHapticEngine *)self player];
      uint64_t v14 = 0;
      +[CHHapticEngine doUnregisterAudioResource:left fromPattern:0 player:v10 error:&v14];

      int v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v11)
      {
        do
        {
          os_signpost_id_t v12 = v11;
          int v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)v11->__value_.__left_;
        }
        while (v11);
      }
      else
      {
        do
        {
          os_signpost_id_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v13 = v12->__value_.__left_ == begin_node;
          begin_node = v12;
        }
        while (!v13);
      }
      begin_node = v12;
    }
    while (v12 != p_pair1);
  }
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy((uint64_t)&self->_publicAudioResources, (void *)self->_publicAudioResources.__tree_.__pair1_.__value_.__left_);
  self->_publicAudioResources.__tree_.__pair1_.__value_.__left_ = 0;
  self->_publicAudioResources.__tree_.__pair3_.__value_ = 0;
  self->_publicAudioResources.__tree_.__begin_node_ = p_pair1;
}

- (BOOL)playPatternFromURL:(NSURL *)fileURL error:(NSError *)outError
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = fileURL;
  if (!self->_player)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1740, "-[CHHapticEngine playPatternFromURL:error:]", "_player != nil", -4810, outError);
    BOOL v15 = 0;
    goto LABEL_43;
  }
  id v7 = CALog::Scope::oslog((id *)kHAPIScope);
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  id v9 = CALog::Scope::oslog((id *)kHAPIScope);
  __int16 v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_playPatternFromURL", " enableTelemetry=YES ", buf, 2u);
  }

  if (v6)
  {
    if ([(NSURL *)v6 isFileURL])
    {
      int v11 = [(NSURL *)v6 path];
      os_signpost_id_t v12 = [v11 pathExtension];
      int v13 = [v12 isEqualToString:@"plist"];

      if (v13)
      {
        if (kHAPIScope)
        {
          uint64_t v14 = *(id *)kHAPIScope;
          if (!v14)
          {
LABEL_32:
            id v33 = 0;
            int v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v6 error:&v33];
            id v25 = v33;
            id v32 = v25;
            uint64_t v21 = [[CHHapticPattern alloc] initWithDictionary:v24 error:&v32];
            id v20 = v32;

            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v14 = MEMORY[0x1E4F14500];
          id v23 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v35 = "CHHapticEngine.mm";
          __int16 v36 = 1024;
          int v37 = 1747;
          __int16 v38 = 2080;
          uint64_t v39 = "-[CHHapticEngine playPatternFromURL:error:]";
          _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating haptic pattern from plist...", buf, 0x1Cu);
        }

        goto LABEL_32;
      }
    }
    if (kHAPIScope)
    {
      __int16 v16 = *(id *)kHAPIScope;
      if (!v16)
      {
LABEL_22:
        id v31 = 0;
        __int16 v19 = [[CHHapticPattern alloc] initWithContentsOfURL:v6 error:&v31];
        id v20 = v31;
        uint64_t v21 = v19;
LABEL_33:
        if (v21)
        {
          id v30 = v20;
          BOOL v15 = [(CHHapticEngine *)self doPlayPattern:v21 error:&v30];
          id v26 = v30;

          id v20 = v26;
        }
        else
        {
          BOOL v15 = 0;
        }

        goto LABEL_37;
      }
    }
    else
    {
      __int16 v16 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = "CHHapticEngine.mm";
      __int16 v36 = 1024;
      int v37 = 1752;
      __int16 v38 = 2080;
      uint64_t v39 = "-[CHHapticEngine playPatternFromURL:error:]";
      _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating haptic pattern from JSON or AHAP...", buf, 0x1Cu);
    }

    goto LABEL_22;
  }
  if (!kHAPIScope)
  {
    __int16 v17 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  __int16 v17 = *(id *)kHAPIScope;
  if (v17)
  {
LABEL_24:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = "CHHapticEngine.mm";
      __int16 v36 = 1024;
      int v37 = 1763;
      __int16 v38 = 2080;
      uint64_t v39 = "-[CHHapticEngine playPatternFromURL:error:]";
      _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming fileURL cannot be nil", buf, 0x1Cu);
    }
  }
  id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-50 userInfo:0];
  BOOL v15 = 0;
LABEL_37:
  if (outError) {
    *outError = (NSError *)v20;
  }
  __int16 v27 = CALog::Scope::oslog((id *)kHAPIScope);
  int v28 = v27;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA902000, v28, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_playPatternFromURL", (const char *)&unk_1BA96A542, buf, 2u);
  }

LABEL_43:
  return v15;
}

- (BOOL)playPatternFromData:(NSData *)data error:(NSError *)outError
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = data;
  if (self->_player)
  {
    id v7 = CALog::Scope::oslog((id *)kHAPIScope);
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

    id v9 = CALog::Scope::oslog((id *)kHAPIScope);
    __int16 v10 = v9;
    unint64_t v11 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA902000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_playPatternFromData", " enableTelemetry=YES ", buf, 2u);
    }

    if (v6)
    {
      id v29 = 0;
      os_signpost_id_t v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v29];
      id v13 = v29;
      if (v12) {
        goto LABEL_9;
      }
      id v28 = 0;
      os_signpost_id_t v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v28];
      id v14 = v28;

      if (v12)
      {
        id v13 = v14;
LABEL_9:
        id v27 = v13;
        BOOL v15 = [[CHHapticPattern alloc] initWithDictionary:v12 error:&v27];
        id v14 = v27;

        if (v15)
        {
          id v26 = v14;
          BOOL v16 = [(CHHapticEngine *)self doPlayPattern:v15 error:&v26];
          id v17 = v26;

          id v14 = v17;
        }
        else
        {
          BOOL v16 = 0;
        }

        if (!outError) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      if (kHAPIScope)
      {
        id v22 = *(id *)kHAPIScope;
        if (!v22)
        {
LABEL_34:
          if (outError)
          {
            *outError = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4814 userInfo:0];
          }
          int v24 = CALog::Scope::oslog((id *)kHAPIScope);
          uint64_t v21 = v24;
          if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BA902000, v21, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_playPatternFromData", (const char *)&unk_1BA96A542, buf, 2u);
          }
          BOOL v16 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        id v22 = MEMORY[0x1E4F14500];
        id v23 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v31 = "CHHapticEngine.mm";
        __int16 v32 = 1024;
        int v33 = 1788;
        __int16 v34 = 2080;
        uint64_t v35 = "-[CHHapticEngine playPatternFromData:error:]";
        _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming NSData is invalid", buf, 0x1Cu);
      }

      goto LABEL_34;
    }
    if (kHAPIScope)
    {
      id v18 = *(id *)kHAPIScope;
      if (!v18) {
        goto LABEL_22;
      }
    }
    else
    {
      id v18 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v31 = "CHHapticEngine.mm";
      __int16 v32 = 1024;
      int v33 = 1803;
      __int16 v34 = 2080;
      uint64_t v35 = "-[CHHapticEngine playPatternFromData:error:]";
      _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming NSData cannot be nil", buf, 0x1Cu);
    }

LABEL_22:
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-50 userInfo:0];
    BOOL v16 = 0;
    if (!outError)
    {
LABEL_24:
      id v20 = CALog::Scope::oslog((id *)kHAPIScope);
      uint64_t v21 = v20;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BA902000, v21, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_playPatternFromData", (const char *)&unk_1BA96A542, buf, 2u);
      }
LABEL_40:

      goto LABEL_41;
    }
LABEL_23:
    *outError = (NSError *)v14;
    goto LABEL_24;
  }
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1775, "-[CHHapticEngine playPatternFromData:error:]", "_player != nil", -4810, outError);
  BOOL v16 = 0;
LABEL_41:

  return v16;
}

- (BOOL)doPlayPattern:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kHAPIScope)
  {
    id v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1816;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "-[CHHapticEngine doPlayPattern:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Creating Pattern Player", buf, 0x1Cu);
  }

LABEL_8:
  id v9 = [(CHHapticEngine *)self createPlayerWithPattern:v6 error:a4];
  if (!v9)
  {
    BOOL v11 = 0;
    goto LABEL_26;
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__3;
  uint64_t v39 = __Block_byref_object_dispose__3;
  id v40 = 0;
  if (!kHAPIScope)
  {
    __int16 v10 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_14;
  }
  __int16 v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_14:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v32 = 136315650;
      int v33 = "CHHapticEngine.mm";
      __int16 v34 = 1024;
      int v35 = 1826;
      __int16 v36 = 2080;
      int v37 = "-[CHHapticEngine doPlayPattern:error:]";
      _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting CHHapticEngine...", v32, 0x1Cu);
    }
  }
  id v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  objc_initWeak((id *)v32, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __38__CHHapticEngine_doPlayPattern_error___block_invoke;
  v22[3] = &unk_1E622E870;
  id v25 = buf;
  id v14 = v13;
  id v23 = v14;
  objc_copyWeak(&v27, (id *)v32);
  id v26 = &v28;
  id v24 = v9;
  [(CHHapticEngine *)self startWithCompletionHandler:v22];
  dispatch_time_t v15 = dispatch_time(0, 4000000000);
  intptr_t v16 = dispatch_group_wait(v14, v15);
  id v18 = (id *)(*(void *)&buf[8] + 40);
  id v17 = *(void **)(*(void *)&buf[8] + 40);
  if (a4 && v17)
  {
    BOOL v11 = 0;
    *a4 = v17;
  }
  else
  {
    if (v16)
    {
      id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4808 userInfo:0];
      id v20 = v19;
      objc_storeStrong(v18, v19);
      *((unsigned char *)v29 + 24) = 0;
    }
    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }
    BOOL v11 = *((unsigned char *)v29 + 24) != 0;
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)v32);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v28, 8);
LABEL_26:

  return v11;
}

void __38__CHHapticEngine_doPlayPattern_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    if (kHAPIScope)
    {
      __map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>> v5 = *(id *)kHAPIScope;
      if (!v5)
      {
LABEL_10:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        goto LABEL_11;
      }
    }
    else
    {
      __map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>> v5 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315906;
      *(void *)&location[4] = "CHHapticEngine.mm";
      __int16 v17 = 1024;
      int v18 = 1833;
      __int16 v19 = 2080;
      id v20 = "-[CHHapticEngine doPlayPattern:error:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot start haptic engine: error %@", location, 0x26u);
    }

    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_initWeak((id *)location, WeakRetained);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CHHapticEngine_doPlayPattern_error___block_invoke_235;
  v10[3] = &unk_1E622E848;
  objc_copyWeak(&v15, (id *)location);
  uint64_t v13 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v7;
  uint64_t v14 = v8;
  id v12 = *(id *)(a1 + 32);
  [WeakRetained dispatchOnLocal:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);

LABEL_11:
}

void __38__CHHapticEngine_doPlayPattern_error___block_invoke_235(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained currentTime];
    double v5 = v4;
    if (kHAPIScope)
    {
      id v6 = *(id *)kHAPIScope;
      if (!v6)
      {
LABEL_9:
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        id obj = *(id *)(v9 + 40);
        char v10 = [v8 startAtTime:&obj error:v5];
        objc_storeStrong((id *)(v9 + 40), obj);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
        goto LABEL_10;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "CHHapticEngine.mm";
      __int16 v14 = 1024;
      int v15 = 1845;
      __int16 v16 = 2080;
      __int16 v17 = "-[CHHapticEngine doPlayPattern:error:]_block_invoke";
      _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting Pattern Player...", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (CHHapticEngineResetHandler)resetHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (AVAudioSession)avAudioSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSString)usageCategory
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimer:(id)a3
{
}

- (NSString)priority
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)hapticPowerUsage
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)audioPowerUsage
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_usageCategory, 0);
  objc_storeStrong((id *)&self->_audioPowerUsage, 0);
  objc_storeStrong((id *)&self->_hapticPowerUsage, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong(&self->_clientFinishedHandler, 0);
  objc_storeStrong(&self->_resetHandler, 0);
  objc_storeStrong(&self->_stoppedHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy((uint64_t)&self->_publicAudioResources, (void *)self->_publicAudioResources.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_avAudioSession, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

+ (void)dispatchOnGlobal:(id)a3
{
  id v3 = a3;
  double v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CHHapticEngine_CHHapticEngineInternal__dispatchOnGlobal___block_invoke;
  block[3] = &unk_1E622E180;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __59__CHHapticEngine_CHHapticEngineInternal__dispatchOnGlobal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)activateAudioSessionOnStart
{
  return ![(CHHapticEngine *)self isBehaviorSet:4];
}

- (void)dispatchSyncOnLocal:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
          id v7 = (void *)MEMORY[0x1BA9F2D90](v4);
          *(_DWORD *)buf = 136315906;
          uint64_t v13 = "CHHapticEngine.mm";
          __int16 v14 = 1024;
          int v15 = 1919;
          __int16 v16 = 2080;
          __int16 v17 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchSyncOnLocal:]";
          __int16 v18 = 2048;
          __int16 v19 = v7;
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Dispatching block %p sync...>", buf, 0x26u);
        }
      }
    }
  }
  in_dispatch_sync = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CHHapticEngine_CHHapticEngineInternal__dispatchSyncOnLocal___block_invoke;
  block[3] = &unk_1E622E180;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(dispatchQueue, block);
  in_dispatch_sync = 0;
}

void __62__CHHapticEngine_CHHapticEngineInternal__dispatchSyncOnLocal___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      uint64_t v1 = *(id *)kHAPIScope;
      if (v1)
      {
        id v2 = v1;
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        {
          int v3 = 136315650;
          id v4 = "CHHapticEngine.mm";
          __int16 v5 = 1024;
          int v6 = 1923;
          __int16 v7 = 2080;
          uint64_t v8 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchSyncOnLocal:]_block_invoke";
          _os_log_impl(&dword_1BA902000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Block sync dispatch complete>", (uint8_t *)&v3, 0x1Cu);
        }
      }
    }
  }
}

- (BOOL)checkEngineRunning:(id *)a3
{
  BOOL v4 = [(CHHapticEngine *)self running];
  if (!v4) {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1942, "-[CHHapticEngine(CHHapticEngineInternal) checkEngineRunning:]", "self.running", -4805, a3);
  }
  return v4;
}

void __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kHAPIScope)
  {
    BOOL v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    id v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1958;
    __int16 v15 = 2080;
    __int16 v16 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStarted:atTime:]_block_invoke_2";
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!v3) {
    goto LABEL_16;
  }
  if (kHAPIScope)
  {
    __int16 v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_16;
    }
  }
  else
  {
    __int16 v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315906;
    id v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1960;
    __int16 v15 = 2080;
    __int16 v16 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStarted:atTime:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: finishWithCompletionHandler callback returned error: %@", (uint8_t *)&v11, 0x26u);
  }

LABEL_16:
  if (WeakRetained) {
    [WeakRetained handleFinish:v3];
  }
  if (kHAPIScope)
  {
    uint64_t v9 = *(id *)kHAPIScope;
    if (!v9) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    id v12 = "CHHapticEngine.mm";
    __int16 v13 = 1024;
    int v14 = 1964;
    __int16 v15 = 2080;
    __int16 v16 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStarted:atTime:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Bottom of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_25:
}

- (void)notifyPlayerStopped:(id)a3 atTime:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (kHAPIScope)
  {
    int v6 = *(id *)kHAPIScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    int v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136316162;
    uint64_t v9 = "CHHapticEngine.mm";
    __int16 v10 = 1024;
    int v11 = 1972;
    __int16 v12 = 2080;
    __int16 v13 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStopped:atTime:]";
    __int16 v14 = 2048;
    id v15 = v5;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: player %p notified engine it will be stopping at time %.3f", (uint8_t *)&v8, 0x30u);
  }

LABEL_8:
}

- (BOOL)doReferenceAudioResourceByID:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  +[CHHapticEngine lazyInitResourceMap];
  if (kHAPIScope)
  {
    BOOL v4 = *(id *)kHAPIScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315906;
    uint64_t v18 = "CHHapticEngine.mm";
    __int16 v19 = 1024;
    int v20 = 1997;
    __int16 v21 = 2080;
    id v22 = "-[CHHapticEngine(CHHapticEngineInternal) doReferenceAudioResourceByID:]";
    __int16 v23 = 1024;
    int v24 = a3;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding reference to audio resource ID %u from pattern", (uint8_t *)&v17, 0x22u);
  }

LABEL_8:
  int v6 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  id v7 = *(void **)_sResourceEntries;
  if (*(void *)_sResourceEntries != _sResourceEntries + 8)
  {
    while (v7[4] != a3)
    {
      int v8 = (void *)v7[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = v8;
          int v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (void *)v7[2];
          BOOL v10 = *v9 == (void)v7;
          id v7 = v9;
        }
        while (!v10);
      }
      id v7 = v9;
      if (v9 == (void *)(_sResourceEntries + 8)) {
        goto LABEL_16;
      }
    }
    ++*((_DWORD *)v7 + 16);
    if (kHAPIScope)
    {
      int v11 = *(id *)kHAPIScope;
      if (!v11)
      {
        BOOL v12 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      int v11 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    BOOL v12 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = *((_DWORD *)v7 + 16);
      int v17 = 136315906;
      uint64_t v18 = "CHHapticEngine.mm";
      __int16 v19 = 1024;
      int v20 = 2002;
      __int16 v21 = 2080;
      id v22 = "-[CHHapticEngine(CHHapticEngineInternal) doReferenceAudioResourceByID:]";
      __int16 v23 = 1024;
      int v24 = v16;
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s:    found it - reference count now %u", (uint8_t *)&v17, 0x22u);
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_16:
  if (!kHAPIScope)
  {
    int v11 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  int v11 = *(id *)kHAPIScope;
  if (v11)
  {
LABEL_23:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315906;
      uint64_t v18 = "CHHapticEngine.mm";
      __int16 v19 = 1024;
      int v20 = 2006;
      __int16 v21 = 2080;
      id v22 = "-[CHHapticEngine(CHHapticEngineInternal) doReferenceAudioResourceByID:]";
      __int16 v23 = 1024;
      int v24 = a3;
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Resource ID %u not previously registered!", (uint8_t *)&v17, 0x22u);
    }
    BOOL v12 = 0;
    goto LABEL_26;
  }
  BOOL v12 = 0;
LABEL_27:
  std::mutex::unlock(v6);
  return v12;
}

+ (unint64_t)doRegisterAudioResource:(id)a3 options:(id)a4 fromPattern:(BOOL)a5 player:(id)a6 error:(id *)a7
{
  BOOL v77 = a5;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (NSURL *)a3;
  v94 = v9;
  id v81 = a4;
  id v79 = a6;
  +[CHHapticEngine lazyInitResourceMap];
  if (kHAPIScope)
  {
    BOOL v10 = *(id *)kHAPIScope;
    if (!v10) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = "Public";
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
    if (v77) {
      BOOL v12 = "Pattern";
    }
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2014;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v12;
    *(_WORD *)&buf[38] = 2112;
    *(void *)&buf[40] = v9;
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Registering %s audio resource '%@'", buf, 0x30u);
  }

LABEL_10:
  uint64_t v13 = _sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  v78 = (std::mutex *)v13;
  __int16 v14 = *(void **)_sResourceEntries;
  uint64_t v82 = _sResourceEntries + 8;
  if (*(void *)_sResourceEntries != _sResourceEntries + 8)
  {
    id v15 = 0;
    while (1)
    {
      int v16 = (id *)v14[5];
      int v17 = (std::__shared_weak_count *)v14[6];
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v18 = (id)v14[7];
      if (kHAPIScope)
      {
        id v19 = *(id *)kHAPIScope;
        if (!v19) {
          goto LABEL_21;
        }
      }
      else
      {
        int v20 = (void *)MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
        id v19 = v20;
      }
      id v22 = v19;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        id v23 = *v16;
        int v24 = [v23 absoluteString];
        uint64_t v25 = v14[4];
        int v26 = *((_DWORD *)v14 + 16);
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2022;
        *(_WORD *)&unsigned char buf[18] = 2080;
        *(void *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v24;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = v25;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = v26;
        _os_log_impl(&dword_1BA902000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: -- Entry list has '%@' with ID %u, and count %u", buf, 0x32u);
      }
LABEL_21:
      id v27 = *v16;
      uint64_t v28 = [v27 absoluteString];
      id v29 = [(NSURL *)v94 absoluteString];
      int v30 = [v28 isEqualToString:v29];

      if (!v30) {
        goto LABEL_87;
      }
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      }
      if (![v81 isEqualToDictionary:v18])
      {
        if (kHAPIScope)
        {
          __int16 v32 = *(id *)kHAPIScope;
          if (!v32) {
            goto LABEL_45;
          }
        }
        else
        {
          __int16 v32 = MEMORY[0x1E4F14500];
          id v36 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = v14[4];
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2047;
          *(_WORD *)&unsigned char buf[18] = 2080;
          *(void *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v37;
          _os_log_impl(&dword_1BA902000, v32, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Resource already registered but request uses options - copy existing ID (%u) as new ID", buf, 0x22u);
        }

LABEL_45:
        *(void *)&long long v88 = 0;
        *((void *)&v88 + 1) = &v88;
        long long v89 = 0x2020000000uLL;
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy__3;
        *(void *)&unsigned char buf[32] = __Block_byref_object_dispose__3;
        *(void *)&buf[40] = 0;
        uint64_t v38 = v14[4];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_461;
        v92[3] = &unk_1E622E2C0;
        v92[4] = &v88;
        v92[5] = buf;
        [v79 copyCustomAudioEvent:v38 options:v81 reply:v92];
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          if (kHAPIScope)
          {
            uint64_t v39 = *(id *)kHAPIScope;
            if (!v39) {
              goto LABEL_56;
            }
          }
          else
          {
            uint64_t v39 = MEMORY[0x1E4F14500];
            id v41 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v96 = 136315650;
            *(void *)&v96[4] = "CHHapticEngine.mm";
            *(_WORD *)&v96[12] = 1024;
            *(_DWORD *)&v96[14] = 2073;
            *(_WORD *)&v96[18] = 2080;
            *(void *)&v96[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
            _os_log_impl(&dword_1BA902000, v39, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Returning ID 0 due to error", v96, 0x1Cu);
          }

LABEL_56:
          BOOL v10 = 0;
          if (a7) {
            *a7 = *(id *)(*(void *)&buf[8] + 40);
          }
LABEL_85:
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v88, 8);
          goto LABEL_86;
        }
        if (kHAPIScope)
        {
          id v40 = *(id *)kHAPIScope;
          if (!v40)
          {
LABEL_79:
            v50 = (uint64_t **)_sResourceEntries;
            uint64_t v51 = *((void *)&v88 + 1);
            *(void *)v96 = v16;
            *(void *)&v96[8] = v17;
            if (v17) {
              atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            __int16 v52 = (unint64_t *)(v51 + 24);
            *(void *)&v96[16] = v81;
            *(_DWORD *)&v96[24] = 1;
            std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>(v50, v52, v52, (uint64_t)v96);
            char v54 = v53;

            if (*(void *)&v96[8]) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v96[8]);
            }
            if ((v54 & 1) == 0) {
              +[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]();
            }
            BOOL v10 = *(NSObject **)(*((void *)&v88 + 1) + 24);
            goto LABEL_85;
          }
        }
        else
        {
          id v40 = MEMORY[0x1E4F14500];
          id v48 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          uint64_t v49 = *(void *)(*((void *)&v88 + 1) + 24);
          *(_DWORD *)v96 = 136316162;
          *(void *)&v96[4] = "CHHapticEngine.mm";
          *(_WORD *)&v96[12] = 1024;
          *(_DWORD *)&v96[14] = 2060;
          *(_WORD *)&v96[18] = 2080;
          *(void *)&v96[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
          *(_WORD *)&v96[28] = 1024;
          *(_DWORD *)&v96[30] = v49;
          *(_WORD *)&v96[34] = 2112;
          *(void *)&v96[36] = v94;
          _os_log_impl(&dword_1BA902000, v40, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Returning ID %u for copied resource '%@'", v96, 0x2Cu);
        }

        goto LABEL_79;
      }
      if (kHAPIScope)
      {
        char v31 = *(id *)kHAPIScope;
        if (!v31) {
          goto LABEL_37;
        }
      }
      else
      {
        char v31 = MEMORY[0x1E4F14500];
        id v33 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = v14[4];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2027;
        *(_WORD *)&unsigned char buf[18] = 2080;
        *(void *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v34;
        _os_log_impl(&dword_1BA902000, v31, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Resource already registered and request uses matching options - referencing existing ID (%u)", buf, 0x22u);
      }

LABEL_37:
      BOOL v10 = v14[4];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__3;
      *(void *)&unsigned char buf[32] = __Block_byref_object_dispose__3;
      *(void *)&buf[40] = 0;
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke;
      v93[3] = &unk_1E622E2E8;
      v93[4] = buf;
      if ([v79 referenceCustomAudioEvent:v10 reply:v93]) {
        goto LABEL_63;
      }
      if (kHAPIScope)
      {
        id v35 = *(id *)kHAPIScope;
        if (!v35) {
          goto LABEL_63;
        }
      }
      else
      {
        __int16 v42 = (void *)MEMORY[0x1E4F14500];
        id v43 = MEMORY[0x1E4F14500];
        id v35 = v42;
      }
      uint64_t v44 = v35;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        __int16 v45 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
        *(_DWORD *)v96 = 136316162;
        *(void *)&v96[4] = "CHHapticEngine.mm";
        *(_WORD *)&v96[12] = 1024;
        *(_DWORD *)&v96[14] = 2031;
        *(_WORD *)&v96[18] = 2080;
        *(void *)&v96[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
        *(_WORD *)&v96[28] = 1024;
        *(_DWORD *)&v96[30] = v10;
        *(_WORD *)&v96[34] = 2112;
        *(void *)&v96[36] = v45;
        _os_log_impl(&dword_1BA902000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: unable to reference server-side audio resource with ID %u: %@", v96, 0x2Cu);
      }
LABEL_63:
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        if (kHAPIScope)
        {
          id v46 = *(id *)kHAPIScope;
          if (!v46)
          {
LABEL_72:
            BOOL v10 = 0;
            if (a7) {
              *a7 = *(id *)(*(void *)&buf[8] + 40);
            }
            goto LABEL_74;
          }
        }
        else
        {
          id v46 = MEMORY[0x1E4F14500];
          id v47 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v96 = 136315650;
          *(void *)&v96[4] = "CHHapticEngine.mm";
          *(_WORD *)&v96[12] = 1024;
          *(_DWORD *)&v96[14] = 2033;
          *(_WORD *)&v96[18] = 2080;
          *(void *)&v96[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
          _os_log_impl(&dword_1BA902000, v46, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Returning ID 0 due to error", v96, 0x1Cu);
        }

        goto LABEL_72;
      }
      ++*((_DWORD *)v14 + 16);
LABEL_74:
      _Block_object_dispose(buf, 8);

LABEL_86:
      id v15 = v17;
LABEL_87:

      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
      if (v30)
      {
        v59 = v15;
        goto LABEL_134;
      }
      v55 = (void *)v14[1];
      if (v55)
      {
        do
        {
          __int16 v56 = v55;
          v55 = (void *)*v55;
        }
        while (v55);
      }
      else
      {
        do
        {
          __int16 v56 = (void *)v14[2];
          BOOL v57 = *v56 == (void)v14;
          __int16 v14 = v56;
        }
        while (!v57);
      }
      __int16 v14 = v56;
      if (v56 == (void *)v82) {
        goto LABEL_98;
      }
    }
  }
  id v15 = 0;
LABEL_98:
  if (kHAPIScope)
  {
    __int16 v58 = *(id *)kHAPIScope;
    if (!v58) {
      goto LABEL_106;
    }
  }
  else
  {
    __int16 v58 = MEMORY[0x1E4F14500];
    id v60 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2083;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
    _os_log_impl(&dword_1BA902000, v58, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resource not already registered - creating new entry", buf, 0x1Cu);
  }

LABEL_106:
  std::allocate_shared[abi:ne180100]<AudioResource,std::allocator<AudioResource>,NSURL * {__strong}&,void>(&v94, buf);
  uint64_t v61 = *(void *)buf;
  v59 = *(std::__shared_weak_count **)&buf[8];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = 0;
  if (v15)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  int v62 = AudioResource::verifyAudioFile((ExtAudioFileRef *)v61, 0);
  if (!_Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 2087, "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]", "resource->verifyAudioFile(false)", v62, a7)|| (v91 = 0, int v63 = AudioResource::readAndAllocateRawBuffer((AudioResource *)v61, &v91), !_Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 2094, "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]", "status", v63, a7)))
  {
    BOOL v10 = 0;
    goto LABEL_134;
  }
  v64 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v91 length:(4 * *(_DWORD *)(v61 + 16) * *(_DWORD *)(v61 + 52)) freeWhenDone:0];
  uint64_t v90 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  int v65 = *(_DWORD *)(v61 + 52);
  *(void *)&long long v88 = *(void *)(v61 + 24);
  *((void *)&v88 + 1) = 0x96C70636DLL;
  LODWORD(v89) = 4 * v65;
  DWORD1(v89) = 1;
  DWORD2(v89) = 4 * v65;
  HIDWORD(v89) = v65;
  LODWORD(v90) = 32;
  v66 = (void *)[objc_alloc((Class)AVFASoftLink::getAVAudioFormat(v64)) initWithStreamDescription:&v88 channelLayout:0];
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v87 = 0;
  *(void *)v96 = 0;
  *(void *)&v96[8] = v96;
  *(void *)&v96[16] = 0x3032000000;
  *(void *)&v96[24] = __Block_byref_object_copy__3;
  *(void *)&v96[32] = __Block_byref_object_dispose__3;
  *(void *)&v96[40] = 0;
  uint64_t v67 = *(unsigned int *)(v61 + 16);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_466;
  v83[3] = &unk_1E622E2C0;
  v83[4] = &v84;
  v83[5] = v96;
  [v79 createCustomAudioEvent:v64 format:v66 frames:v67 options:v81 reply:v83];
  if (a7) {
    *a7 = *(id *)(*(void *)&v96[8] + 40);
  }
  if (v91) {
    MEMORY[0x1BA9F2830](v91, 0x1000C8077774924);
  }
  BOOL v10 = v85[3];
  if (v10 && !*a7)
  {
    if (kHAPIScope)
    {
      v68 = *(id *)kHAPIScope;
      if (!v68)
      {
LABEL_127:
        v72 = (uint64_t **)_sResourceEntries;
        v73 = (unint64_t *)(v85 + 3);
        *(void *)buf = v61;
        *(void *)&uint8_t buf[8] = v59;
        if (v59) {
          atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        *(void *)&uint8_t buf[16] = v81;
        *(_DWORD *)&buf[24] = 1;
        std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>(v72, v73, v73, (uint64_t)buf);
        char v75 = v74;

        if (*(void *)&buf[8]) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
        }
        if ((v75 & 1) == 0) {
          +[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]();
        }
        BOOL v10 = v85[3];
        goto LABEL_133;
      }
    }
    else
    {
      v68 = MEMORY[0x1E4F14500];
      id v69 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      v70 = "Public";
      uint64_t v71 = v85[3];
      if (v77) {
        v70 = "Pattern";
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "CHHapticEngine.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2120;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v71;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = v70;
      *(_WORD *)&buf[44] = 2112;
      *(void *)&buf[46] = v94;
      _os_log_impl(&dword_1BA902000, v68, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding new ID %u for %s resource '%@'", buf, 0x36u);
    }

    goto LABEL_127;
  }
LABEL_133:
  _Block_object_dispose(v96, 8);

  _Block_object_dispose(&v84, 8);
LABEL_134:
  if (v59) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v59);
  }
  std::mutex::unlock(v78);

  return (unint64_t)v10;
}

void __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke(uint64_t a1, void *a2)
{
}

void __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_461(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v6)
  {
    if (kHAPIScope)
    {
      id v7 = *(id *)kHAPIScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    uint64_t v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = [v6 localizedDescription];
      int v11 = 136315906;
      BOOL v12 = "CHHapticEngine.mm";
      __int16 v13 = 1024;
      int v14 = 2056;
      __int16 v15 = 2080;
      int v16 = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server failed to copy custom audio event: %@", (uint8_t *)&v11, 0x26u);
    }
  }
LABEL_9:
}

void __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_466(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v6)
  {
    if (kHAPIScope)
    {
      id v7 = *(id *)kHAPIScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    uint64_t v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = [v6 localizedDescription];
      int v11 = 136315906;
      BOOL v12 = "CHHapticEngine.mm";
      __int16 v13 = 1024;
      int v14 = 2112;
      __int16 v15 = 2080;
      int v16 = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server failed to create custom audio event: %@", (uint8_t *)&v11, 0x26u);
    }
  }
LABEL_9:
}

+ (BOOL)doUnregisterAudioResource:(unint64_t)a3 fromPattern:(BOOL)a4 player:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v38 = a5;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__3;
  uint64_t v44 = __Block_byref_object_dispose__3;
  id v45 = 0;
  if (kHAPIScope)
  {
    uint64_t v9 = *(id *)kHAPIScope;
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = "public-loaded";
    *(_DWORD *)buf = 136316162;
    id v47 = "CHHapticEngine.mm";
    int v49 = 2137;
    uint64_t v51 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
    __int16 v48 = 1024;
    __int16 v50 = 2080;
    if (v7) {
      int v11 = "pattern-loaded";
    }
    __int16 v52 = 2080;
    *(void *)char v53 = v11;
    *(_WORD *)&v53[8] = 1024;
    *(_DWORD *)&v53[10] = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Attempting to remove %s ID %u", buf, 0x2Cu);
  }

LABEL_10:
  BOOL v12 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  id v13 = *(id *)_sResourceEntries;
  if (*(void *)_sResourceEntries != _sResourceEntries + 8)
  {
    while (*((void *)v13 + 4) != a3)
    {
      int v14 = (void *)*((void *)v13 + 1);
      if (v14)
      {
        do
        {
          __int16 v15 = v14;
          int v14 = (void *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          __int16 v15 = (void *)*((void *)v13 + 2);
          BOOL v16 = *v15 == (void)v13;
          id v13 = v15;
        }
        while (!v16);
      }
      id v13 = v15;
      if (v15 == (void *)(_sResourceEntries + 8)) {
        goto LABEL_18;
      }
    }
    uint64_t v19 = (id *)*((void *)v13 + 5);
    id v18 = (std::__shared_weak_count *)*((void *)v13 + 6);
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (kHAPIScope)
    {
      id v20 = *(id *)kHAPIScope;
      if (!v20) {
        goto LABEL_37;
      }
    }
    else
    {
      id v20 = (id)MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    id v23 = v20;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = *v19;
      uint64_t v25 = [v24 absoluteString];
      uint64_t v26 = *((void *)v13 + 4);
      int v27 = *((_DWORD *)v13 + 16);
      *(_DWORD *)buf = 136316418;
      id v47 = "CHHapticEngine.mm";
      __int16 v48 = 1024;
      int v49 = 2144;
      __int16 v50 = 2080;
      uint64_t v51 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
      __int16 v52 = 2112;
      *(void *)char v53 = v25;
      *(_WORD *)&v53[8] = 1024;
      *(_DWORD *)&v53[10] = v26;
      __int16 v54 = 1024;
      int v55 = v27;
      _os_log_impl(&dword_1BA902000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: -- Entry list has '%@' with ID %u, and count %u", buf, 0x32u);
    }
LABEL_37:
    int v28 = *((_DWORD *)v13 + 16);
    *((_DWORD *)v13 + 16) = v28 - 1;
    BOOL v29 = v28 != 1;
    if (v28 != 1)
    {
      if (kHAPIScope)
      {
        id v13 = *(id *)kHAPIScope;
        if (!v13)
        {
          LOBYTE(v13) = 1;
          goto LABEL_63;
        }
      }
      else
      {
        id v13 = (id)MEMORY[0x1E4F14500];
        id v31 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v47 = "CHHapticEngine.mm";
        __int16 v48 = 1024;
        int v49 = 2154;
        __int16 v50 = 2080;
        uint64_t v51 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
        _os_log_impl(&dword_1BA902000, (os_log_t)v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s:    found it and decrementing refcount", buf, 0x1Cu);
      }
      goto LABEL_62;
    }
    if (kHAPIScope)
    {
      int v30 = *(id *)kHAPIScope;
      if (!v30) {
        goto LABEL_51;
      }
    }
    else
    {
      int v30 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v47 = "CHHapticEngine.mm";
      __int16 v48 = 1024;
      int v49 = 2146;
      __int16 v50 = 2080;
      uint64_t v51 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
      _os_log_impl(&dword_1BA902000, v30, OS_LOG_TYPE_INFO, "%25s:%-5d %s:    found it and refcount is at zero - erasing and releasing on server", buf, 0x1Cu);
    }

LABEL_51:
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer((uint64_t **)_sResourceEntries, (uint64_t *)v13);
    std::__destroy_at[abi:ne180100]<std::pair<unsigned long const,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,0>((uint64_t)v13 + 32);
    operator delete(v13);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __93__CHHapticEngine_CHHapticEngineInternal__doUnregisterAudioResource_fromPattern_player_error___block_invoke;
    v39[3] = &unk_1E622E2E8;
    v39[4] = &v40;
    char v33 = [v38 releaseCustomAudioEvent:a3 reply:v39];
    LOBYTE(v13) = v33;
    if (v38) {
      char v34 = v33;
    }
    else {
      char v34 = 1;
    }
    if ((v34 & 1) == 0)
    {
      if (kHAPIScope)
      {
        id v13 = *(id *)kHAPIScope;
        if (!v13) {
          goto LABEL_63;
        }
      }
      else
      {
        id v13 = (id)MEMORY[0x1E4F14500];
        id v35 = MEMORY[0x1E4F14500];
      }
      id v13 = v13;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        id v36 = [(id)v41[5] localizedDescription];
        *(_DWORD *)buf = 136316162;
        id v47 = "CHHapticEngine.mm";
        __int16 v48 = 1024;
        int v49 = 2150;
        __int16 v50 = 2080;
        uint64_t v51 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
        __int16 v52 = 1024;
        *(_DWORD *)char v53 = a3;
        *(_WORD *)&v53[4] = 2112;
        *(void *)&v53[6] = v36;
        _os_log_impl(&dword_1BA902000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: unable to release server-side audio resource with ID %u: %@", buf, 0x2Cu);
      }
LABEL_62:

      LOBYTE(v13) = v29;
    }
LABEL_63:
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if (a6) {
      goto LABEL_66;
    }
    goto LABEL_67;
  }
LABEL_18:
  if (!kHAPIScope)
  {
    __int16 v17 = MEMORY[0x1E4F14500];
    id v21 = MEMORY[0x1E4F14500];
    goto LABEL_27;
  }
  __int16 v17 = *(id *)kHAPIScope;
  if (v17)
  {
LABEL_27:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v47 = "CHHapticEngine.mm";
      __int16 v48 = 1024;
      int v49 = 2165;
      __int16 v50 = 2080;
      uint64_t v51 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
      __int16 v52 = 1024;
      *(_DWORD *)char v53 = a3;
      _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: could not find audio resource with ID %u", buf, 0x22u);
    }
  }
  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4824 userInfo:0];
    LOBYTE(v13) = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_66:
    *a6 = (id) v41[5];
    goto LABEL_67;
  }
  LOBYTE(v13) = 0;
LABEL_67:
  std::mutex::unlock(v12);
  _Block_object_dispose(&v40, 8);

  return (char)v13;
}

void __93__CHHapticEngine_CHHapticEngineInternal__doUnregisterAudioResource_fromPattern_player_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)addPublicAudioResourceID:withURL:options:.cold.1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_0(&dword_1BA902000, MEMORY[0x1E4F14500], v0, "%25s:%-5d ASSERTION FAILURE [([self doFindPublicAudioResourceID:resourceID] == std::end(_publicAudioResources)) != 0 is false]: ", v1, v2, v3, v4, 2u);
  }
  __break(1u);
}

- (void)removePublicAudioResourceID:.cold.1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_0(&dword_1BA902000, MEMORY[0x1E4F14500], v0, "%25s:%-5d ASSERTION FAILURE [(result != std::end(_publicAudioResources)) != 0 is false]: ", v1, v2, v3, v4, 2u);
  }
  __break(1u);
}

@end