@interface AVHapticPlayer
+ (BOOL)isSupported;
+ (BOOL)supportsAudio;
+ (BOOL)supportsHaptics;
- (AVHapticClient)client;
- (AVHapticPlayer)initWithOptions:(id)a3 error:(id *)a4;
- (AVHapticPlayer)initWithSessionID:(unsigned int)a3 error:(id *)a4;
- (AVHapticPlayer)initWithSessionID:(unsigned int)a3 sessionIsShared:(BOOL)a4 error:(id *)a5;
- (BOOL)clearSequenceEvents:(unint64_t)a3 atTime:(double)a4;
- (BOOL)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5;
- (BOOL)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7;
- (BOOL)doInitWithOptions:(id)a3 error:(id *)a4;
- (BOOL)enableSequenceLooping:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5;
- (BOOL)finishWithCompletionHandler:(id)a3;
- (BOOL)loadAndPrepareHapticSequenceFromData:(id)a3 reply:(id)a4;
- (BOOL)loadAndPrepareHapticSequenceFromEvents:(id)a3 reply:(id)a4;
- (BOOL)loadAndPrepareHapticSequenceFromVibePattern:(id)a3 reply:(id)a4;
- (BOOL)loadHapticEvent:(id)a3 reply:(id)a4;
- (BOOL)pauseHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (BOOL)playHapticSequence:(unint64_t)a3 atTime:(double)a4 offset:(double)a5;
- (BOOL)prepareHapticSequence:(unint64_t)a3 error:(id *)a4;
- (BOOL)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (BOOL)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (BOOL)removeChannel:(id)a3 error:(id *)a4;
- (BOOL)resetHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (BOOL)resourcesAllocated;
- (BOOL)resumeHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (BOOL)seekHapticSequence:(unint64_t)a3 toTime:(double)a4;
- (BOOL)sendUnduckAudioCommand:(unint64_t)a3 atTime:(double)a4;
- (BOOL)setBehavior:(unint64_t)a3 error:(id *)a4;
- (BOOL)setNumberOfChannels:(unint64_t)a3 error:(id *)a4;
- (BOOL)setSequenceChannelParam:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 param:(unint64_t)a6 value:(float)a7 error:(id *)a8;
- (BOOL)setSequenceLoopLength:(unint64_t)a3 length:(float)a4 error:(id *)a5;
- (BOOL)setSequencePlaybackRate:(unint64_t)a3 rate:(float)a4 error:(id *)a5;
- (BOOL)stopHapticSequence:(unint64_t)a3 atTime:(double)a4;
- (NSArray)channels;
- (double)currentMediaTime;
- (double)hapticLatency;
- (id)addChannel:(id *)a3;
- (id)connectionErrorHandler;
- (id)createOptionsFromAudioSessionID:(unsigned int)a3 shared:(BOOL)a4 bypassAudioSession:(BOOL)a5;
- (id)stopRunningHandler;
- (unint64_t)behavior;
- (unint64_t)getBehavior;
- (void)allocateRenderResourcesWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deallocateRenderResources;
- (void)detachHapticSequence:(unint64_t)a3;
- (void)invalidateChannels;
- (void)prewarmWithCompletionHandler:(id)a3;
- (void)queryServerCapabilities:(id)a3 reply:(id)a4;
- (void)releaseChannels;
- (void)setBehavior:(unint64_t)a3;
- (void)setConnectionErrorHandler:(id)a3;
- (void)setStopRunningHandler:(id)a3;
- (void)startRunningWithCompletionHandler:(id)a3;
- (void)stopPrewarm;
- (void)stopRunning;
- (void)stopRunningWithCompletionHandler:(id)a3;
@end

@implementation AVHapticPlayer

uint64_t __33__AVHapticPlayer_supportsHaptics__block_invoke(PlatformUtilities_iOS *a1)
{
  uint64_t result = PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(a1);
  +[AVHapticPlayer supportsHaptics]::sHapticsSupported = result;
  return result;
}

+ (BOOL)supportsHaptics
{
  if (+[AVHapticPlayer supportsHaptics]::sCheckServer_Once != -1) {
    dispatch_once(&+[AVHapticPlayer supportsHaptics]::sCheckServer_Once, &__block_literal_global_3);
  }
  return +[AVHapticPlayer supportsHaptics]::sHapticsSupported;
}

- (void)queryServerCapabilities:(id)a3 reply:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(AVHapticPlayer *)self client];
    *(_DWORD *)buf = 136315906;
    v17 = "AVHapticPlayer.mm";
    __int16 v18 = 1024;
    int v19 = 322;
    __int16 v20 = 2080;
    v21 = "-[AVHapticPlayer queryServerCapabilities:reply:]";
    __int16 v22 = 2048;
    uint64_t v23 = [v11 clientID];
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx", buf, 0x26u);
  }
LABEL_8:
  client = self->_client;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__AVHapticPlayer_queryServerCapabilities_reply___block_invoke;
  v14[3] = &unk_1E622E898;
  v14[4] = self;
  id v13 = v7;
  id v15 = v13;
  [(AVHapticClient *)client queryServerCapabilities:v6 reply:v14];
}

- (BOOL)finishWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AVHapticPlayer *)v5 client];
    *(_DWORD *)buf = 136315906;
    v17 = "AVHapticPlayer.mm";
    __int16 v18 = 1024;
    int v19 = 750;
    __int16 v20 = 2080;
    v21 = "-[AVHapticPlayer finishWithCompletionHandler:]";
    __int16 v22 = 2048;
    uint64_t v23 = [v9 clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: finish with comp handler: clientID: 0x%lx", buf, 0x26u);
  }
LABEL_8:
  v10 = [(AVHapticPlayer *)v5 client];
  uint64_t v11 = [v10 clientID];

  if (v11 == -1)
  {
    id v15 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 751, "-[AVHapticPlayer finishWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v15);
    id v13 = v15;
    if (v4) {
      v4[2](v4, v13);
    }

    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = [(AVHapticClient *)v5->_client finish:v4];
  }
  objc_sync_exit(v5);

  return v11 != -1 && v12;
}

- (void)startRunningWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(AVHapticPlayer *)v5 client];
  id v7 = (void *)[v6 clientID];

  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v23 = "AVHapticPlayer.mm";
    __int16 v24 = 1024;
    int v25 = 663;
    __int16 v26 = 2080;
    v27 = "-[AVHapticPlayer startRunningWithCompletionHandler:]";
    __int16 v28 = 2048;
    v29 = v7;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: start running: clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v10 = [(AVHapticPlayer *)v5 client];
  BOOL v11 = [v10 clientID] == -1;

  if (!v11)
  {
    if (v5->_resourcesAllocated)
    {
      objc_initWeak((id *)buf, v5);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke;
      v19[3] = &unk_1E622E8E8;
      v20[1] = v7;
      objc_copyWeak(v20, (id *)buf);
      [(AVHapticClient *)v5->_client setAsyncStopCallback:v19];
      client = v5->_client;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke_73;
      v17[3] = &unk_1E622E270;
      id v18 = v4;
      [(AVHapticClient *)client startRunning:v17];

      objc_destroyWeak(v20);
      objc_destroyWeak((id *)buf);
      goto LABEL_24;
    }
    if (kAVHCScope)
    {
      v14 = *(id *)kAVHCScope;
      if (!v14)
      {
LABEL_21:
        v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4807 userInfo:0];
        if (v4) {
          (*((void (**)(id, void *))v4 + 2))(v4, v16);
        }

        goto LABEL_24;
      }
    }
    else
    {
      v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "AVHapticPlayer.mm";
      __int16 v24 = 1024;
      int v25 = 703;
      __int16 v26 = 2080;
      v27 = "-[AVHapticPlayer startRunningWithCompletionHandler:]";
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot start without allocating resources", buf, 0x1Cu);
    }

    goto LABEL_21;
  }
  id v21 = 0;
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 664, "-[AVHapticPlayer startRunningWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v21);
  id v13 = v21;
  if (v4) {
    (*((void (**)(id, id))v4 + 2))(v4, v13);
  }

LABEL_24:
  objc_sync_exit(v5);
}

- (void)setBehavior:(unint64_t)a3
{
  uint64_t v3 = 0;
  [(AVHapticPlayer *)self setBehavior:a3 error:&v3];
}

- (void)allocateRenderResourcesWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(AVHapticPlayer *)v5 client];
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "AVHapticPlayer.mm";
    __int16 v21 = 1024;
    int v22 = 509;
    __int16 v23 = 2080;
    __int16 v24 = "-[AVHapticPlayer allocateRenderResourcesWithCompletionHandler:]";
    __int16 v25 = 2048;
    uint64_t v26 = [v9 clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: allocating resources: clientID: 0x%lx", buf, 0x26u);
  }
LABEL_8:
  v10 = [(AVHapticPlayer *)v5 client];
  BOOL v11 = [v10 clientID] == -1;

  if (!v11)
  {
    if (!v5->_resourcesAllocated)
    {
      client = v5->_client;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__AVHapticPlayer_allocateRenderResourcesWithCompletionHandler___block_invoke;
      v16[3] = &unk_1E622E8C0;
      v16[4] = v5;
      id v17 = v4;
      [(AVHapticClient *)client allocateResources:v16];

      goto LABEL_23;
    }
    if (kAVHCScope)
    {
      BOOL v12 = *(id *)kAVHCScope;
      if (!v12)
      {
LABEL_21:
        if (v4) {
          (*((void (**)(id, void))v4 + 2))(v4, 0);
        }
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v12 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "AVHapticPlayer.mm";
      __int16 v21 = 1024;
      int v22 = 520;
      __int16 v23 = 2080;
      __int16 v24 = "-[AVHapticPlayer allocateRenderResourcesWithCompletionHandler:]";
      _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resources already allocated -- just call completion handler", buf, 0x1Cu);
    }

    goto LABEL_21;
  }
  id v18 = 0;
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 510, "-[AVHapticPlayer allocateRenderResourcesWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v18);
  id v13 = v18;
  if (v4) {
    (*((void (**)(id, id))v4 + 2))(v4, v13);
  }

LABEL_23:
  objc_sync_exit(v5);
}

- (BOOL)setBehavior:(unint64_t)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(AVHapticPlayer *)v6 client];
    *(_DWORD *)buf = 136316162;
    __int16 v20 = "AVHapticPlayer.mm";
    __int16 v21 = 1024;
    int v22 = 332;
    __int16 v23 = 2080;
    __int16 v24 = "-[AVHapticPlayer setBehavior:error:]";
    __int16 v25 = 2048;
    uint64_t v26 = [v10 clientID];
    __int16 v27 = 1024;
    int v28 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx behavior: %u", buf, 0x2Cu);
  }
LABEL_8:
  BOOL v11 = [(AVHapticPlayer *)v6 client];
  BOOL v12 = [v11 clientID] == -1;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 333, "-[AVHapticPlayer setBehavior:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    LOBYTE(v13) = 0;
  }
  else if (v6->_behavior == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    client = v6->_client;
    id v18 = 0;
    BOOL v13 = [(AVHapticClient *)client setPlayerBehavior:a3 error:&v18];
    id v15 = v18;
    v16 = v15;
    if (v13) {
      v6->_behavior = a3;
    }
    else {
      *a4 = v15;
    }
  }
  objc_sync_exit(v6);

  return v13;
}

- (AVHapticClient)client
{
  return (AVHapticClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStopRunningHandler:(id)a3
{
}

- (AVHapticPlayer)initWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
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
    id v15 = "AVHapticPlayer.mm";
    __int16 v16 = 1024;
    int v17 = 284;
    __int16 v18 = 2080;
    int v19 = "-[AVHapticPlayer initWithOptions:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: initWithOptions entered", buf, 0x1Cu);
  }

LABEL_8:
  v13.receiver = self;
  v13.super_class = (Class)AVHapticPlayer;
  id v9 = [(AVHapticPlayer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    if ([(AVHapticPlayer *)v9 doInitWithOptions:v6 error:a4]) {
      goto LABEL_18;
    }
  }
  else
  {
    if (kAVHCScope)
    {
      v10 = (AVHapticPlayer *)*(id *)kAVHCScope;
      if (!v10) {
        goto LABEL_18;
      }
    }
    else
    {
      v10 = (AVHapticPlayer *)MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "AVHapticPlayer.mm";
      __int16 v16 = 1024;
      int v17 = 292;
      __int16 v18 = 2080;
      int v19 = "-[AVHapticPlayer initWithOptions:error:]";
      _os_log_impl(&dword_1BA902000, &v10->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithOptions exited", buf, 0x1Cu);
    }
  }

  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)doInitWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id stopRunningHandler = self->_stopRunningHandler;
  self->_id stopRunningHandler = 0;

  self->_resourcesAllocated = 0;
  self->_behavior = 0;
  id v8 = [[AVHapticClient alloc] initWithOptions:v6 error:a4];
  client = self->_client;
  self->_client = v8;

  v10 = self->_client;
  if (v10)
  {
    [(AVHapticClient *)v10 setConnectionCallback:&__block_literal_global_63];
  }
  else
  {
    if (kAVHCScope)
    {
      id v11 = *(id *)kAVHCScope;
      if (!v11) {
        goto LABEL_10;
      }
    }
    else
    {
      id v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315650;
      id v15 = "AVHapticPlayer.mm";
      __int16 v16 = 1024;
      int v17 = 242;
      __int16 v18 = 2080;
      int v19 = "-[AVHapticPlayer doInitWithOptions:error:]";
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: exited with nil", (uint8_t *)&v14, 0x1Cu);
    }
  }
LABEL_10:

  return v10 != 0;
}

- (void)setConnectionErrorHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x1BA9F2D90](a3, a2);
  id connectionErrorHandler = self->_connectionErrorHandler;
  self->_id connectionErrorHandler = v4;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVHapticPlayer_setConnectionErrorHandler___block_invoke;
  v6[3] = &unk_1E622DF00;
  objc_copyWeak(&v7, &location);
  [(AVHapticClient *)self->_client setConnectionCallback:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)prewarmWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AVHapticPlayer *)v5 client];
    *(_DWORD *)buf = 136315906;
    __int16 v18 = "AVHapticPlayer.mm";
    __int16 v19 = 1024;
    int v20 = 639;
    __int16 v21 = 2080;
    int v22 = "-[AVHapticPlayer prewarmWithCompletionHandler:]";
    __int16 v23 = 2048;
    uint64_t v24 = [v9 clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: prewarm: clientID: 0x%lx", buf, 0x26u);
  }
LABEL_8:
  v10 = [(AVHapticPlayer *)v5 client];
  BOOL v11 = [v10 clientID] == -1;

  if (v11)
  {
    id v16 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 640, "-[AVHapticPlayer prewarmWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v16);
    objc_super v13 = (void (**)(id, id))v16;
    if (v4) {
      v4[2](v4, v13);
    }
  }
  else
  {
    client = v5->_client;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__AVHapticPlayer_prewarmWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E622E270;
    id v15 = v4;
    [(AVHapticClient *)client prewarm:v14];
    objc_super v13 = v15;
  }

  objc_sync_exit(v5);
}

- (BOOL)removeChannel:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = [(AVHapticPlayer *)v7 client];
    int v16 = 136316674;
    int v17 = "AVHapticPlayer.mm";
    __int16 v18 = 1024;
    int v19 = 443;
    __int16 v20 = 2080;
    __int16 v21 = "-[AVHapticPlayer removeChannel:error:]";
    __int16 v22 = 2048;
    __int16 v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = [v11 clientID];
    __int16 v26 = 2048;
    id v27 = v6;
    __int16 v28 = 1024;
    int v29 = [v6 chanID];
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: player %p, clientID: 0x%lx channel %p (ID %u)", (uint8_t *)&v16, 0x40u);
  }
LABEL_8:
  if ([(NSMutableArray *)v7->_channelArray indexOfObject:v6] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)v7->_channelArray removeObject:v6];
    BOOL v13 = -[AVHapticClient removeAssignedChannelID:error:](v7->_client, "removeAssignedChannelID:error:", [v6 chanID], a4);
    [v6 invalidate];
    objc_sync_exit(v7);

    goto LABEL_20;
  }
  objc_sync_exit(v7);

  if (!kAVHCScope)
  {
    id v12 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
    goto LABEL_14;
  }
  id v12 = *(id *)kAVHCScope;
  if (v12)
  {
LABEL_14:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      int v17 = "AVHapticPlayer.mm";
      __int16 v18 = 1024;
      int v19 = 451;
      __int16 v20 = 2080;
      __int16 v21 = "-[AVHapticPlayer removeChannel:error:]";
      _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Channel not found on player", (uint8_t *)&v16, 0x1Cu);
    }
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4804 userInfo:0];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_20:

  return v13;
}

void __47__AVHapticPlayer_prewarmWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      id v4 = *(id *)kAVHCScope;
      if (v4)
      {
        v5 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          int v7 = 136315906;
          id v8 = "AVHapticPlayer.mm";
          __int16 v9 = 1024;
          int v10 = 642;
          __int16 v11 = 2080;
          id v12 = "-[AVHapticPlayer prewarmWithCompletionHandler:]_block_invoke";
          __int16 v13 = 2112;
          id v14 = v3;
          _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: reply block for _client prewarm: replyError: %@", (uint8_t *)&v7, 0x26u);
        }
      }
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __48__AVHapticPlayer_queryServerCapabilities_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (kAVHCScope)
    {
      id v7 = *(id *)kAVHCScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    __int16 v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = [*(id *)(a1 + 32) client];
      int v11 = 136315906;
      id v12 = "AVHapticPlayer.mm";
      __int16 v13 = 1024;
      int v14 = 324;
      __int16 v15 = 2080;
      int v16 = "-[AVHapticPlayer queryServerCapabilities:reply:]_block_invoke";
      __int16 v17 = 2048;
      uint64_t v18 = [v10 clientID];
      _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: clientID: 0x%lx: call failed", (uint8_t *)&v11, 0x26u);
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__AVHapticPlayer_allocateRenderResourcesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      uint64_t v4 = *(id *)kAVHCScope;
      if (v4)
      {
        id v5 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          int v7 = 136315906;
          id v8 = "AVHapticPlayer.mm";
          __int16 v9 = 1024;
          int v10 = 695;
          __int16 v11 = 2080;
          id v12 = "-[AVHapticPlayer startRunningWithCompletionHandler:]_block_invoke";
          __int16 v13 = 2112;
          id v14 = v3;
          _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: reply block for _client startRunning: replyError: %@", (uint8_t *)&v7, 0x26u);
        }
      }
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __51__AVHapticPlayer_stopRunningWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVHCScope)
  {
    if (*(unsigned char *)(kAVHCScope + 8))
    {
      uint64_t v4 = *(id *)kAVHCScope;
      if (v4)
      {
        id v5 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          int v7 = 136315906;
          id v8 = "AVHapticPlayer.mm";
          __int16 v9 = 1024;
          int v10 = 731;
          __int16 v11 = 2080;
          id v12 = "-[AVHapticPlayer stopRunningWithCompletionHandler:]_block_invoke";
          __int16 v13 = 2112;
          id v14 = v3;
          _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: reply block for _client stopRunning: replyError: %@", (uint8_t *)&v7, 0x26u);
        }
      }
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)stopRunningWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, id))a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(AVHapticPlayer *)v5 client];
  uint64_t v7 = [v6 clientID];

  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "AVHapticPlayer.mm";
    __int16 v21 = 1024;
    int v22 = 727;
    __int16 v23 = 2080;
    __int16 v24 = "-[AVHapticPlayer stopRunningWithCompletionHandler:]";
    __int16 v25 = 2048;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop running: clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  int v10 = [(AVHapticPlayer *)v5 client];
  BOOL v11 = [v10 clientID] == -1;

  if (v11)
  {
    id v18 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 728, "-[AVHapticPlayer stopRunningWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v18);
    __int16 v13 = (void (**)(id, id))v18;
    if (v4) {
      v4[2](v4, v13);
    }
    goto LABEL_13;
  }
  if ([(AVHapticClient *)v5->_client running])
  {
    client = v5->_client;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__AVHapticPlayer_stopRunningWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E622E270;
    __int16 v17 = v4;
    [(AVHapticClient *)client stopRunning:v16];
    __int16 v13 = v17;
LABEL_13:

    goto LABEL_23;
  }
  if (!kAVHCScope)
  {
    id v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    goto LABEL_18;
  }
  id v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_18:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "AVHapticPlayer.mm";
      __int16 v21 = 1024;
      int v22 = 738;
      __int16 v23 = 2080;
      __int16 v24 = "-[AVHapticPlayer stopRunningWithCompletionHandler:]";
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client was not running - calling completion handler immediately", buf, 0x1Cu);
    }
  }
  if (v4) {
    v4[2](v4, 0);
  }
LABEL_23:
  objc_sync_exit(v5);
}

- (double)currentMediaTime
{
  return (double)mach_absolute_time() * 0.0000000416666667;
}

- (id)addChannel:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v41 = self;
  objc_sync_enter(v41);
  if (kAVHCScope)
  {
    id v4 = *(id *)kAVHCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  uint64_t v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(AVHapticPlayer *)v41 client];
    *(_DWORD *)buf = 136316162;
    v53 = "AVHapticPlayer.mm";
    __int16 v54 = 1024;
    int v55 = 399;
    __int16 v56 = 2080;
    v57 = "-[AVHapticPlayer addChannel:]";
    __int16 v58 = 2048;
    *(void *)v59 = v41;
    *(_WORD *)&v59[8] = 2048;
    uint64_t v60 = [v7 clientID];
    _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: player %p, clientID: 0x%lx", buf, 0x30u);
  }
LABEL_8:
  id v8 = [(AVHapticPlayer *)v41 client];
  BOOL v9 = [v8 clientID] == -1;

  if (v9)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 401, "-[AVHapticPlayer addChannel:]", "clientID invalid", -4812, a3);
    goto LABEL_13;
  }
  p_channelArray = (id *)&v41->_channelArray;
  if (![(AVHapticClient *)v41->_client requestAssignedChannels:[(NSMutableArray *)v41->_channelArray count] + 1 error:a3])
  {
LABEL_13:
    __int16 v13 = 0;
    goto LABEL_56;
  }
  BOOL v11 = [(AVHapticClient *)v41->_client channelKeys];
  id location = (id *)&v41->_channelArray;
  if (*p_channelArray) {
    id v12 = *p_channelArray;
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v14 = v12;
  uint64_t v15 = [v12 count];
  uint64_t v39 = [v11 count];
  if (kAVHCScope)
  {
    int v16 = *(id *)kAVHCScope;
    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
    int v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v53 = "AVHapticPlayer.mm";
    int v55 = 410;
    __int16 v56 = 2080;
    __int16 v54 = 1024;
    v57 = "-[AVHapticPlayer addChannel:]";
    __int16 v58 = 1024;
    *(_DWORD *)v59 = v15;
    *(_WORD *)&v59[4] = 1024;
    *(_DWORD *)&v59[6] = v39;
    _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Total channels was %u, now %u", buf, 0x28u);
  }

LABEL_22:
  if (v39 != v15 + 1) {
    -[AVHapticPlayer addChannel:]();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v11;
  uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v47;
    while (1)
    {
      uint64_t v20 = 0;
LABEL_26:
      if (*(void *)v47 != v19) {
        objc_enumerationMutation(obj);
      }
      __int16 v21 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      int v22 = v14;
      id v23 = v14;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (!v24) {
        break;
      }
      uint64_t v25 = *(void *)v43;
LABEL_30:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = [*(id *)(*((void *)&v42 + 1) + 8 * v26) chanID];
        if (v27 == [v21 unsignedIntegerValue]) {
          break;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v24) {
            goto LABEL_30;
          }
          goto LABEL_40;
        }
      }

      id v14 = v22;
      if (++v20 != v18) {
        goto LABEL_26;
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (!v18) {
        goto LABEL_48;
      }
    }
LABEL_40:

    id v14 = v22;
    __int16 v28 = [[AVHapticPlayerChannel alloc] initWithChannelID:v21 client:v41->_client];
    if (kAVHCScope)
    {
      id v29 = *(id *)kAVHCScope;
      if (!v29)
      {
LABEL_47:
        [v23 addObject:v28];

        goto LABEL_48;
      }
    }
    else
    {
      id v29 = (id)MEMORY[0x1E4F14500];
      id v30 = MEMORY[0x1E4F14500];
    }
    v31 = v29;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      int v32 = [v21 unsignedIntegerValue];
      *(_DWORD *)buf = 136316162;
      v53 = "AVHapticPlayer.mm";
      __int16 v54 = 1024;
      int v55 = 426;
      __int16 v56 = 2080;
      v57 = "-[AVHapticPlayer addChannel:]";
      __int16 v58 = 2048;
      *(void *)v59 = v28;
      *(_WORD *)&v59[8] = 1024;
      LODWORD(v60) = v32;
      _os_log_impl(&dword_1BA902000, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding new AVHapticPlayerChannel %p to end of array with channel ID %u", buf, 0x2Cu);
    }

    goto LABEL_47;
  }
LABEL_48:

  objc_storeStrong(location, v14);
  __int16 v13 = [*location objectAtIndex:v39 - 1];
  if (!kAVHCScope)
  {
    id v33 = (id)MEMORY[0x1E4F14500];
    id v34 = MEMORY[0x1E4F14500];
    goto LABEL_52;
  }
  id v33 = *(id *)kAVHCScope;
  if (v33)
  {
LABEL_52:
    v35 = v33;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      int v36 = [v13 chanID];
      *(_DWORD *)buf = 136316162;
      v53 = "AVHapticPlayer.mm";
      __int16 v54 = 1024;
      int v55 = 432;
      __int16 v56 = 2080;
      v57 = "-[AVHapticPlayer addChannel:]";
      __int16 v58 = 2048;
      *(void *)v59 = v13;
      *(_WORD *)&v59[8] = 1024;
      LODWORD(v60) = v36;
      _os_log_impl(&dword_1BA902000, v35, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Returning channel %p (ID %u)", buf, 0x2Cu);
    }
  }
LABEL_56:
  objc_sync_exit(v41);

  return v13;
}

+ (BOOL)supportsAudio
{
  return 1;
}

+ (BOOL)isSupported
{
  if (+[AVHapticPlayer supportsHaptics]) {
    return 1;
  }

  return +[AVHapticPlayer supportsAudio];
}

- (id)createOptionsFromAudioSessionID:(unsigned int)a3 shared:(BOOL)a4 bypassAudioSession:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  BOOL v9 = [NSNumber numberWithBool:v6];
  int v10 = [NSNumber numberWithBool:v5];
  BOOL v11 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"AudioSessionID", v9, @"AudioSessionIsShared", v10, @"BypassAudioSession", 0);

  return v11;
}

void __42__AVHapticPlayer_doInitWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (kAVHCScope)
  {
    id v3 = *(id *)kAVHCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    BOOL v6 = "AVHapticPlayer.mm";
    __int16 v7 = 1024;
    int v8 = 246;
    __int16 v9 = 2080;
    int v10 = "-[AVHapticPlayer doInitWithOptions:error:]_block_invoke";
    _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Connection error", (uint8_t *)&v5, 0x1Cu);
  }

LABEL_8:
}

- (AVHapticPlayer)initWithSessionID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    __int16 v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v16 = "AVHapticPlayer.mm";
    __int16 v17 = 1024;
    int v18 = 252;
    __int16 v19 = 2080;
    uint64_t v20 = "-[AVHapticPlayer initWithSessionID:error:]";
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: initWithSessionID entered", buf, 0x1Cu);
  }

LABEL_8:
  v14.receiver = self;
  v14.super_class = (Class)AVHapticPlayer;
  __int16 v9 = [(AVHapticPlayer *)&v14 init];
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(AVHapticPlayer *)v9 createOptionsFromAudioSessionID:v5 shared:0 bypassAudioSession:0];
    if ([(AVHapticPlayer *)v10 doInitWithOptions:v11 error:a4])
    {
LABEL_18:

      return v10;
    }

LABEL_17:
    int v10 = 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    uint64_t v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
LABEL_15:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v16 = "AVHapticPlayer.mm";
      __int16 v17 = 1024;
      int v18 = 261;
      __int16 v19 = 2080;
      uint64_t v20 = "-[AVHapticPlayer initWithSessionID:error:]";
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithSessionID exited", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  uint64_t v11 = *(id *)kAVHCScope;
  if (v11) {
    goto LABEL_15;
  }
  return 0;
}

- (AVHapticPlayer)initWithSessionID:(unsigned int)a3 sessionIsShared:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    __int16 v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v18 = "AVHapticPlayer.mm";
    __int16 v19 = 1024;
    int v20 = 268;
    __int16 v21 = 2080;
    int v22 = "-[AVHapticPlayer initWithSessionID:sessionIsShared:error:]";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: initWithInternalSessionID entered", buf, 0x1Cu);
  }

LABEL_8:
  v16.receiver = self;
  v16.super_class = (Class)AVHapticPlayer;
  uint64_t v11 = [(AVHapticPlayer *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    __int16 v13 = [(AVHapticPlayer *)v11 createOptionsFromAudioSessionID:v7 shared:v6 bypassAudioSession:0];
    if ([(AVHapticPlayer *)v12 doInitWithOptions:v13 error:a5])
    {
LABEL_18:

      return v12;
    }

LABEL_17:
    id v12 = 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    __int16 v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
LABEL_15:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v18 = "AVHapticPlayer.mm";
      __int16 v19 = 1024;
      int v20 = 277;
      __int16 v21 = 2080;
      int v22 = "-[AVHapticPlayer initWithSessionID:sessionIsShared:error:]";
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithSessionID exited", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  __int16 v13 = *(id *)kAVHCScope;
  if (v13) {
    goto LABEL_15;
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v3 = *(id *)kAVHCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    objc_super v16 = "AVHapticPlayer.mm";
    __int16 v17 = 1024;
    int v18 = 299;
    __int16 v19 = 2080;
    int v20 = "-[AVHapticPlayer dealloc]";
    __int16 v21 = 2048;
    int v22 = self;
    _os_log_impl(&dword_1BA902000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc entered for player %p", buf, 0x26u);
  }

LABEL_8:
  [(AVHapticPlayer *)self releaseChannels];
  uint64_t v5 = [(AVHapticPlayer *)self client];
  objc_sync_enter(v5);
  BOOL v6 = [(AVHapticPlayer *)self client];
  BOOL v7 = [v6 clientID] == -1;

  if (!v7)
  {
    id v8 = [(AVHapticPlayer *)self client];
    [v8 stopRunning];
  }
  objc_sync_exit(v5);

  if (self->_resourcesAllocated)
  {
    self->_resourcesAllocated = 0;
    __int16 v9 = [(AVHapticPlayer *)self client];
    BOOL v10 = [v9 clientID] == -1;

    if (!v10) {
      [(AVHapticClient *)self->_client releaseResources];
    }
    [(AVHapticPlayer *)self invalidateChannels];
  }
  [(AVHapticClient *)self->_client disconnect];
  client = self->_client;
  self->_client = 0;

  if (kAVHCScope)
  {
    id v12 = *(id *)kAVHCScope;
    if (!v12) {
      goto LABEL_21;
    }
  }
  else
  {
    id v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v16 = "AVHapticPlayer.mm";
    __int16 v17 = 1024;
    int v18 = 317;
    __int16 v19 = 2080;
    int v20 = "-[AVHapticPlayer dealloc]";
    _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc exited", buf, 0x1Cu);
  }

LABEL_21:
  v14.receiver = self;
  v14.super_class = (Class)AVHapticPlayer;
  [(AVHapticPlayer *)&v14 dealloc];
}

- (unint64_t)getBehavior
{
  return self->_behavior;
}

- (BOOL)setNumberOfChannels:(unint64_t)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  __int16 v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = [(AVHapticPlayer *)v6 client];
    *(_DWORD *)buf = 136316162;
    v35 = "AVHapticPlayer.mm";
    __int16 v36 = 1024;
    int v37 = 370;
    __int16 v38 = 2080;
    uint64_t v39 = "-[AVHapticPlayer setNumberOfChannels:error:]";
    __int16 v40 = 2048;
    uint64_t v41 = [v10 clientID];
    __int16 v42 = 1024;
    int v43 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: clientID: 0x%lx numberOfChannels: %u", buf, 0x2Cu);
  }
LABEL_8:
  uint64_t v11 = [(AVHapticPlayer *)v6 client];
  BOOL v12 = [v11 clientID] == -1;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 371, "-[AVHapticPlayer setNumberOfChannels:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    objc_sync_exit(v6);
    BOOL v14 = 0;
    id v15 = v6;
    goto LABEL_31;
  }
  if (![(AVHapticClient *)v6->_client running])
  {
    [(AVHapticClient *)v6->_client clearAssignedChannels];
    client = v6->_client;
    id v32 = 0;
    BOOL v17 = [(AVHapticClient *)client requestAssignedChannels:a3 error:&v32];
    id v15 = v32;
    if (v17)
    {
      uint64_t v27 = [(AVHapticClient *)v6->_client channelKeys];
      int v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v19 = v27;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = [[AVHapticPlayerChannel alloc] initWithChannelID:*(void *)(*((void *)&v28 + 1) + 8 * i) client:v6->_client];
            [(NSMutableArray *)v18 addObject:v23];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v20);
      }

      [(AVHapticPlayer *)v6 releaseChannels];
      channelArray = v6->_channelArray;
      v6->_channelArray = v18;
    }
    goto LABEL_28;
  }
  if (!kAVHCScope)
  {
    id v13 = MEMORY[0x1E4F14500];
    id v25 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  id v13 = *(id *)kAVHCScope;
  if (v13)
  {
LABEL_24:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "AVHapticPlayer.mm";
      __int16 v36 = 1024;
      int v37 = 386;
      __int16 v38 = 2080;
      uint64_t v39 = "-[AVHapticPlayer setNumberOfChannels:error:]";
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Can't set channel count while player is running", buf, 0x1Cu);
    }
  }
  id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4806 userInfo:0];
LABEL_28:
  objc_sync_exit(v6);

  if (a4) {
    *a4 = v15;
  }
  BOOL v14 = v15 == 0;
LABEL_31:

  return v14;
}

- (NSArray)channels
{
  if (self->_channelArray)
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else
  {
    id v2 = 0;
  }

  return (NSArray *)v2;
}

- (double)hapticLatency
{
  [(AVHapticClient *)self->_client hapticLatency];
  return result;
}

void __44__AVHapticPlayer_setConnectionErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained connectionErrorHandler];

    if (v5)
    {
      BOOL v6 = [v4 connectionErrorHandler];
      ((void (**)(void, id))v6)[2](v6, v7);
    }
  }
}

- (id)connectionErrorHandler
{
  id v2 = (void *)MEMORY[0x1BA9F2D90](self->_connectionErrorHandler, a2);

  return v2;
}

- (void)invalidateChannels
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = v2->_channelArray;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invalidate", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)releaseChannels
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2->_channelArray;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "invalidate", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  channelArray = v2->_channelArray;
  v2->_channelArray = 0;

  objc_sync_exit(v2);
}

- (void)deallocateRenderResources
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (kAVHCScope)
  {
    id v3 = *(id *)kAVHCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  uint64_t v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(AVHapticPlayer *)v2 client];
    int v9 = 136315906;
    long long v10 = "AVHapticPlayer.mm";
    __int16 v11 = 1024;
    int v12 = 531;
    __int16 v13 = 2080;
    BOOL v14 = "-[AVHapticPlayer deallocateRenderResources]";
    __int16 v15 = 2048;
    uint64_t v16 = [v6 clientID];
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: deallocating resources: clientID: 0x%lx", (uint8_t *)&v9, 0x26u);
  }
LABEL_8:
  if (v2->_resourcesAllocated)
  {
    v2->_resourcesAllocated = 0;
    [(AVHapticClient *)v2->_client releaseResources];
    [(AVHapticPlayer *)v2 invalidateChannels];
  }
  else
  {
    if (kAVHCScope)
    {
      long long v7 = *(id *)kAVHCScope;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      long long v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315650;
      long long v10 = "AVHapticPlayer.mm";
      __int16 v11 = 1024;
      int v12 = 538;
      __int16 v13 = 2080;
      BOOL v14 = "-[AVHapticPlayer deallocateRenderResources]";
      _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resources already deallocated -- noop", (uint8_t *)&v9, 0x1Cu);
    }
  }
LABEL_17:
  objc_sync_exit(v2);
}

- (BOOL)loadHapticEvent:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kAVHCScope)
  {
    id v8 = *(id *)kAVHCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  long long v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [(AVHapticPlayer *)self client];
    int v14 = 136315906;
    __int16 v15 = "AVHapticPlayer.mm";
    __int16 v16 = 1024;
    int v17 = 545;
    __int16 v18 = 2080;
    id v19 = "-[AVHapticPlayer loadHapticEvent:reply:]";
    __int16 v20 = 2048;
    uint64_t v21 = [v11 clientID];
    _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: loading haptic event: clientID: 0x%lx", (uint8_t *)&v14, 0x26u);
  }
LABEL_8:
  BOOL v12 = [(AVHapticClient *)self->_client loadHapticEvent:v6 reply:v7];

  return v12;
}

- (BOOL)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (kAVHCScope)
  {
    id v16 = *(id *)kAVHCScope;
    if (!v16) {
      goto LABEL_8;
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  __int16 v18 = v16;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [(AVHapticPlayer *)self client];
    int v22 = 136316162;
    uint64_t v23 = "AVHapticPlayer.mm";
    __int16 v24 = 1024;
    int v25 = 551;
    __int16 v26 = 2080;
    uint64_t v27 = "-[AVHapticPlayer createCustomAudioEvent:format:frames:options:reply:]";
    __int16 v28 = 2048;
    uint64_t v29 = [v19 clientID];
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: creating custom audio event: clientID: 0x%lx, frameCount: %lu", (uint8_t *)&v22, 0x30u);
  }
LABEL_8:
  BOOL v20 = [(AVHapticClient *)self->_client createCustomAudioEvent:v12 format:v13 frames:a5 options:v14 reply:v15];

  return v20;
}

- (BOOL)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (kAVHCScope)
  {
    id v10 = *(id *)kAVHCScope;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  id v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(AVHapticPlayer *)self client];
    int v16 = 136316162;
    id v17 = "AVHapticPlayer.mm";
    __int16 v18 = 1024;
    int v19 = 557;
    __int16 v20 = 2080;
    uint64_t v21 = "-[AVHapticPlayer copyCustomAudioEvent:options:reply:]";
    __int16 v22 = 2048;
    uint64_t v23 = [v13 clientID];
    __int16 v24 = 1024;
    int v25 = a3;
    _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: copying custom audio event: clientID: 0x%lx, eventID: %u", (uint8_t *)&v16, 0x2Cu);
  }
LABEL_8:
  BOOL v14 = [(AVHapticClient *)self->_client copyCustomAudioEvent:a3 options:v8 reply:v9];

  return v14;
}

- (BOOL)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticPlayer *)self client];
    int v13 = 136315906;
    BOOL v14 = "AVHapticPlayer.mm";
    __int16 v15 = 1024;
    int v16 = 563;
    __int16 v17 = 2080;
    __int16 v18 = "-[AVHapticPlayer referenceCustomAudioEvent:reply:]";
    __int16 v19 = 2048;
    uint64_t v20 = [v10 clientID];
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: referencing custom audio event: clientID: 0x%lx", (uint8_t *)&v13, 0x26u);
  }
LABEL_8:
  BOOL v11 = [(AVHapticClient *)self->_client referenceCustomAudioEvent:a3 reply:v6];

  return v11;
}

- (BOOL)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticPlayer *)self client];
    int v13 = 136315906;
    BOOL v14 = "AVHapticPlayer.mm";
    __int16 v15 = 1024;
    int v16 = 569;
    __int16 v17 = 2080;
    __int16 v18 = "-[AVHapticPlayer releaseCustomAudioEvent:reply:]";
    __int16 v19 = 2048;
    uint64_t v20 = [v10 clientID];
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: releasing custom audio event: clientID: 0x%lx", (uint8_t *)&v13, 0x26u);
  }
LABEL_8:
  BOOL v11 = [(AVHapticClient *)self->_client releaseCustomAudioEvent:a3 reply:v6];

  return v11;
}

- (BOOL)loadAndPrepareHapticSequenceFromData:(id)a3 reply:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  BOOL v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(AVHapticPlayer *)v8 client];
    int v15 = 136315906;
    int v16 = "AVHapticPlayer.mm";
    __int16 v17 = 1024;
    int v18 = 577;
    __int16 v19 = 2080;
    uint64_t v20 = "-[AVHapticPlayer loadAndPrepareHapticSequenceFromData:reply:]";
    __int16 v21 = 2048;
    uint64_t v22 = [v12 clientID];
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loading haptic sequence from NSData: clientID: 0x%lx", (uint8_t *)&v15, 0x26u);
  }
LABEL_8:
  BOOL v13 = [(AVHapticClient *)v8->_client loadAndPrepareHapticSequenceFromData:v6 reply:v7];
  objc_sync_exit(v8);

  return v13;
}

- (BOOL)loadAndPrepareHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  BOOL v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(AVHapticPlayer *)v8 client];
    int v15 = 136315906;
    int v16 = "AVHapticPlayer.mm";
    __int16 v17 = 1024;
    int v18 = 587;
    __int16 v19 = 2080;
    uint64_t v20 = "-[AVHapticPlayer loadAndPrepareHapticSequenceFromEvents:reply:]";
    __int16 v21 = 2048;
    uint64_t v22 = [v12 clientID];
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loading and preparing haptic sequence from NSArray: clientID: 0x%lx", (uint8_t *)&v15, 0x26u);
  }
LABEL_8:
  BOOL v13 = [(AVHapticClient *)v8->_client loadAndPrepareHapticSequenceFromEvents:v6 reply:v7];
  objc_sync_exit(v8);

  return v13;
}

- (BOOL)loadAndPrepareHapticSequenceFromVibePattern:(id)a3 reply:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  BOOL v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(AVHapticPlayer *)v8 client];
    int v15 = 136315906;
    int v16 = "AVHapticPlayer.mm";
    __int16 v17 = 1024;
    int v18 = 597;
    __int16 v19 = 2080;
    uint64_t v20 = "-[AVHapticPlayer loadAndPrepareHapticSequenceFromVibePattern:reply:]";
    __int16 v21 = 2048;
    uint64_t v22 = [v12 clientID];
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loading and preparing haptic pattern: clientID: 0x%lx", (uint8_t *)&v15, 0x26u);
  }
LABEL_8:
  BOOL v13 = [(AVHapticClient *)v8->_client loadAndPrepareHapticSequenceFromVibePattern:v6 reply:v7];
  objc_sync_exit(v8);

  return v13;
}

- (BOOL)prepareHapticSequence:(unint64_t)a3 error:(id *)a4
{
  int v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v6 = *(id *)kAVHCScope;
    if (!v6) {
      return 1;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [(AVHapticPlayer *)self client];
    int v11 = 136316162;
    id v12 = "AVHapticPlayer.mm";
    __int16 v13 = 1024;
    int v14 = 606;
    __int16 v15 = 2080;
    int v16 = "-[AVHapticPlayer prepareHapticSequence:error:]";
    __int16 v17 = 1024;
    int v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = [v9 clientID];
    _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: sequence %u already prepared for clientID: 0x%lx - NOOP", (uint8_t *)&v11, 0x2Cu);
  }
  return 1;
}

- (BOOL)enableSequenceLooping:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      return [(AVHapticClient *)self->_client enableSequenceLooping:a3 enable:v6 error:a5];
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    __int16 v13 = "AVHapticPlayer.mm";
    __int16 v14 = 1024;
    int v15 = 620;
    __int16 v16 = 2080;
    __int16 v17 = "-[AVHapticPlayer enableSequenceLooping:enable:error:]";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: enable sequence looping: entered", (uint8_t *)&v12, 0x1Cu);
  }

  return [(AVHapticClient *)self->_client enableSequenceLooping:a3 enable:v6 error:a5];
}

- (BOOL)setSequenceLoopLength:(unint64_t)a3 length:(float)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    __int16 v14 = "AVHapticPlayer.mm";
    __int16 v15 = 1024;
    int v16 = 626;
    __int16 v17 = 2080;
    uint64_t v18 = "-[AVHapticPlayer setSequenceLoopLength:length:error:]";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: set sequence loop length: entered", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_8:
  *(float *)&double v10 = a4;
  return [(AVHapticClient *)self->_client setSequenceLoopLength:a3 length:a5 error:v10];
}

- (BOOL)setSequencePlaybackRate:(unint64_t)a3 rate:(float)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    __int16 v14 = "AVHapticPlayer.mm";
    __int16 v15 = 1024;
    int v16 = 632;
    __int16 v17 = 2080;
    uint64_t v18 = "-[AVHapticPlayer setSequencePlaybackRate:rate:error:]";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: set sequence playback rate: entered", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_8:
  *(float *)&double v10 = a4;
  return [(AVHapticClient *)self->_client setSequencePlaybackRate:a3 rate:a5 error:v10];
}

- (void)stopPrewarm
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (kAVHCScope)
  {
    id v3 = *(id *)kAVHCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  uint64_t v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(AVHapticPlayer *)v2 client];
    *(_DWORD *)buf = 136315906;
    id v11 = "AVHapticPlayer.mm";
    __int16 v12 = 1024;
    int v13 = 653;
    __int16 v14 = 2080;
    __int16 v15 = "-[AVHapticPlayer stopPrewarm]";
    __int16 v16 = 2048;
    uint64_t v17 = [v6 clientID];
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop prewarm: clientID: 0x%lx", buf, 0x26u);
  }
LABEL_8:
  id v7 = [(AVHapticPlayer *)v2 client];
  BOOL v8 = [v7 clientID] == -1;

  if (v8)
  {
    uint64_t v9 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 654, "-[AVHapticPlayer stopPrewarm]", "self.client.clientID != kInvalidClientID", -4812, &v9);
  }
  else
  {
    [(AVHapticClient *)v2->_client stopPrewarm];
  }
  objc_sync_exit(v2);
}

void __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v4 = *(id *)kAVHCScope;
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
    uint64_t v6 = *(void *)(a1 + 40);
    int v10 = 136316162;
    id v11 = "AVHapticPlayer.mm";
    __int16 v12 = 1024;
    int v13 = 669;
    __int16 v14 = 2080;
    __int16 v15 = "-[AVHapticPlayer startRunningWithCompletionHandler:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 1024;
    int v19 = a2;
    _os_log_impl(&dword_1BA902000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%lx asynchronously stopped for reason %d", (uint8_t *)&v10, 0x2Cu);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v8 = [WeakRetained stopRunningHandler];

  if (v8)
  {
    if ((unint64_t)(a2 + 1) >= 5) {
      uint64_t v9 = -2;
    }
    else {
      uint64_t v9 = qword_1BA95A4E0[a2 + 1];
    }
    v8[2](v8, v9);
  }
}

- (void)stopRunning
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (kAVHCScope)
  {
    id v3 = *(id *)kAVHCScope;
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
    uint64_t v6 = [(AVHapticPlayer *)v2 client];
    *(_DWORD *)buf = 136315906;
    id v11 = "AVHapticPlayer.mm";
    __int16 v12 = 1024;
    int v13 = 715;
    __int16 v14 = 2080;
    __int16 v15 = "-[AVHapticPlayer stopRunning]";
    __int16 v16 = 2048;
    uint64_t v17 = [v6 clientID];
    _os_log_impl(&dword_1BA902000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop running: clientID: 0x%lx", buf, 0x26u);
  }
LABEL_8:
  id v7 = [(AVHapticPlayer *)v2 client];
  BOOL v8 = [v7 clientID] == -1;

  if (v8)
  {
    uint64_t v9 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 716, "-[AVHapticPlayer stopRunning]", "self.client.clientID != kInvalidClientID", -4812, &v9);
  }
  else if (v2->_resourcesAllocated)
  {
    [(AVHapticClient *)v2->_client stopRunning];
  }
  objc_sync_exit(v2);
}

- (BOOL)playHapticSequence:(unint64_t)a3 atTime:(double)a4 offset:(double)a5
{
  return [(AVHapticClient *)self->_client startHapticSequence:a3 atTime:a4 withOffset:a5];
}

- (BOOL)stopHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return [(AVHapticClient *)self->_client stopHapticSequence:a3 atTime:a4];
}

- (BOOL)pauseHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return [(AVHapticClient *)self->_client pauseHapticSequence:a3 atTime:a4];
}

- (BOOL)resumeHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return [(AVHapticClient *)self->_client resumeHapticSequence:a3 atTime:a4];
}

- (BOOL)seekHapticSequence:(unint64_t)a3 toTime:(double)a4
{
  return [(AVHapticClient *)self->_client seekHapticSequence:a3 toTime:a4];
}

- (BOOL)resetHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return [(AVHapticClient *)self->_client resetHapticSequence:a3 atTime:a4];
}

- (BOOL)sendUnduckAudioCommand:(unint64_t)a3 atTime:(double)a4
{
  return [(AVHapticClient *)self->_client sendUnduckAudioCommand:a3 atTime:a4];
}

- (BOOL)setSequenceChannelParam:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 param:(unint64_t)a6 value:(float)a7 error:(id *)a8
{
  return [(AVHapticClient *)self->_client setSequenceChannelParameter:a6 atTime:a3 value:a5 sequenceID:a8 channel:a4];
}

- (BOOL)clearSequenceEvents:(unint64_t)a3 atTime:(double)a4
{
  return [(AVHapticClient *)self->_client clearSequenceEvents:a3 atTime:a4];
}

- (void)detachHapticSequence:(unint64_t)a3
{
}

- (id)stopRunningHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)resourcesAllocated
{
  return self->_resourcesAllocated;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopRunningHandler, 0);
  objc_storeStrong(&self->_connectionErrorHandler, 0);
  objc_storeStrong((id *)&self->_channelArray, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)addChannel:.cold.1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v0 = 136315394;
    v1 = "AVHapticPlayer.mm";
    __int16 v2 = 1024;
    int v3 = 411;
    _os_log_impl(&dword_1BA902000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(newChannelCount == oldChannelCount + 1) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
  AudioConverterPrepare();
}

@end