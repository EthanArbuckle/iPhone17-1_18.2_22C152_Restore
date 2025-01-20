@interface AXMSoundComponent
+ (BOOL)isSupported;
- (AVAudioSession)audioSession;
- (AXMSoundComponent)init;
- (BOOL)_startEngineIfNeeded:(id *)a3;
- (BOOL)canHandleRequest:(id)a3;
- (id)_scheduleActiveSound:(id)a3;
- (id)configChangedObserverToken;
- (void)_scheduleOneShotSound:(id)a3 completion:(id)a4;
- (void)_stopActiveSound:(id)a3;
- (void)dealloc;
- (void)handleRequest:(id)a3 completion:(id)a4;
- (void)setAudioSession:(id)a3;
- (void)setConfigChangedObserverToken:(id)a3;
- (void)transitionToState:(int64_t)a3 completion:(id)a4;
@end

@implementation AXMSoundComponent

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)[(AVAudioEngine *)self->_engine audioSession];
}

- (void)setAudioSession:(id)a3
{
}

- (AXMSoundComponent)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXMSoundComponent;
  v2 = [(AXMOutputComponent *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = [v3 addObserverForName:*MEMORY[0x1E4F14F58] object:0 queue:0 usingBlock:&__block_literal_global_33];
    id configChangedObserverToken = v2->_configChangedObserverToken;
    v2->_id configChangedObserverToken = (id)v4;

    v6 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x1E4F15380]);
    engine = v2->_engine;
    v2->_engine = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    activeSounds = v2->_activeSounds;
    v2->_activeSounds = (NSMutableArray *)v8;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_configChangedObserverToken];

  v4.receiver = self;
  v4.super_class = (Class)AXMSoundComponent;
  [(AXMSoundComponent *)&v4 dealloc];
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)transitionToState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(AXMOutputComponent *)self componentState];
  if (a3 != 2 || v7)
  {
    objc_super v11 = AXMediaLogHaptics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXMSoundComponent transitionToState:completion:](self, a3, v11);
    }

    v19.receiver = self;
    v19.super_class = (Class)AXMSoundComponent;
    [(AXMOutputComponent *)&v19 transitionToState:a3 completion:v6];
  }
  else
  {
    id v22 = 0;
    BOOL v8 = [(AXMSoundComponent *)self _startEngineIfNeeded:&v22];
    id v9 = v22;
    v10 = v9;
    if (!v8 || v9)
    {
      v12 = AXMediaLogHaptics();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXMSoundComponent transitionToState:completion:]((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
      }

      v21.receiver = self;
      v21.super_class = (Class)AXMSoundComponent;
      [(AXMOutputComponent *)&v21 transitionToState:1 completion:v6];
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)AXMSoundComponent;
      [(AXMOutputComponent *)&v20 transitionToState:2 completion:v6];
    }
  }
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 oneShotSoundActions];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 activeSoundActions];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (void)handleRequest:(id)a3 completion:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v32 = a4;
  v33 = v5;
  group = dispatch_group_create();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = [v5 oneShotSoundActions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x1E4F15390]);
        uint64_t v13 = [v11 soundFileURL];
        id v45 = 0;
        uint64_t v14 = (void *)[v12 initForReading:v13 error:&v45];
        id v15 = v45;

        if (v15)
        {
          uint64_t v16 = AXMediaLogSounds();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v52 = v5;
            __int16 v53 = 2112;
            id v54 = v15;
            _os_log_error_impl(&dword_1B57D5000, v16, OS_LOG_TYPE_ERROR, "Could not handle audio request: %@. Error:%@", buf, 0x16u);
          }
        }
        else
        {
          dispatch_group_enter(group);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __46__AXMSoundComponent_handleRequest_completion___block_invoke;
          v43[3] = &unk_1E6117090;
          v44 = group;
          [(AXMSoundComponent *)self _scheduleOneShotSound:v14 completion:v43];
          uint64_t v16 = v44;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v8);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v17 = [v5 activeSoundActions];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        id v23 = objc_alloc(MEMORY[0x1E4F15390]);
        v24 = [v22 soundFileURL];
        id v38 = 0;
        v25 = (void *)[v23 initForReading:v24 error:&v38];
        id v26 = v38;

        if (v26)
        {
          v27 = AXMediaLogSounds();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v52 = v33;
            __int16 v53 = 2112;
            id v54 = v26;
            _os_log_error_impl(&dword_1B57D5000, v27, OS_LOG_TYPE_ERROR, "Could not handle audio request: %@. Error:%@", buf, 0x16u);
          }
        }
        else
        {
          v27 = [(AXMSoundComponent *)self _scheduleActiveSound:v25];
          if (v27)
          {
            v28 = objc_alloc_init(AXMActiveSoundOutputActionHandleImpl);
            [(AXMActiveSoundOutputActionHandleImpl *)v28 setActiveSound:v27];
            [(AXMActiveSoundOutputActionHandleImpl *)v28 setSoundComponent:self];
            v29 = [v22 handle];
            [v29 setHandleProvider:v28];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v19);
  }

  v30 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AXMSoundComponent_handleRequest_completion___block_invoke_67;
  block[3] = &unk_1E6117410;
  id v37 = v32;
  id v31 = v32;
  dispatch_group_notify(group, v30, block);
}

void __46__AXMSoundComponent_handleRequest_completion___block_invoke(uint64_t a1)
{
}

uint64_t __46__AXMSoundComponent_handleRequest_completion___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_scheduleActiveSound:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AXMActiveSound);
  [(AXMActiveSound *)v5 connectToEngine:self->_engine];
  id v17 = 0;
  BOOL v6 = [(AXMActiveSound *)v5 beginPlayback:v4 withError:&v17];

  id v7 = v17;
  if (v6)
  {
    [(NSMutableArray *)self->_activeSounds addObject:v5];
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v9 = AXMediaLogSounds();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXMSoundComponent _scheduleActiveSound:]((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
    }

    [(AXMActiveSound *)v5 disconnectFromEngine:self->_engine];
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_scheduleOneShotSound:(id)a3 completion:(id)a4
{
  id v6 = a4;
  oneShotSoundPlayer = self->_oneShotSoundPlayer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__AXMSoundComponent__scheduleOneShotSound_completion___block_invoke;
  v9[3] = &unk_1E6117410;
  id v10 = v6;
  id v8 = v6;
  [(AVAudioPlayerNode *)oneShotSoundPlayer scheduleFile:a3 atTime:0 completionHandler:v9];
  [(AVAudioPlayerNode *)self->_oneShotSoundPlayer play];
}

uint64_t __54__AXMSoundComponent__scheduleOneShotSound_completion___block_invoke(uint64_t a1)
{
  v2 = AXMediaLogSounds();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B57D5000, v2, OS_LOG_TYPE_INFO, "One-shot sound player did finish playing sound", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_startEngineIfNeeded:(id *)a3
{
  if (!self->_oneShotSoundPlayer)
  {
    id v5 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E4F153D0]);
    oneShotSoundPlayer = self->_oneShotSoundPlayer;
    self->_oneShotSoundPlayer = v5;

    [(AVAudioEngine *)self->_engine attachNode:self->_oneShotSoundPlayer];
    id v7 = [(AVAudioEngine *)self->_engine mainMixerNode];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initStandardFormatWithSampleRate:2 channels:44100.0];
    -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_oneShotSoundPlayer, v7, 0, [v7 nextAvailableInputBus], v8);
  }
  if ([(AVAudioEngine *)self->_engine isRunning])
  {
    id v9 = 0;
    char v10 = 1;
  }
  else
  {
    engine = self->_engine;
    id v20 = 0;
    char v10 = [(AVAudioEngine *)engine startAndReturnError:&v20];
    id v9 = v20;
    if (v9)
    {
      uint64_t v12 = AXMediaLogSounds();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXMSoundComponent _startEngineIfNeeded:]((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  if (a3) {
    *a3 = v9;
  }

  return v10;
}

- (void)_stopActiveSound:(id)a3
{
  if (a3)
  {
    engine = self->_engine;
    id v5 = a3;
    [v5 disconnectFromEngine:engine];
    [(NSMutableArray *)self->_activeSounds removeObject:v5];
  }
}

- (id)configChangedObserverToken
{
  return self->_configChangedObserverToken;
}

- (void)setConfigChangedObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configChangedObserverToken, 0);
  objc_storeStrong((id *)&self->_activeSounds, 0);
  objc_storeStrong((id *)&self->_oneShotSoundPlayer, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)transitionToState:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transitionToState:(NSObject *)a3 completion:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "componentState"));
  id v6 = [NSNumber numberWithInteger:a2];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  char v10 = v6;
  _os_log_error_impl(&dword_1B57D5000, a3, OS_LOG_TYPE_ERROR, "Unexpected state change. from %@. to %@", (uint8_t *)&v7, 0x16u);
}

- (void)_scheduleActiveSound:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_startEngineIfNeeded:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end