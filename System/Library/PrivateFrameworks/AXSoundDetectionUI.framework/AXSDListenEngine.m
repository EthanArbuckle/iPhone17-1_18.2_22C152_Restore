@interface AXSDListenEngine
+ (AXSDListenEngine)sharedInstance;
+ (BOOL)_stateIsNotListening:(int64_t)a3;
+ (id)_stringForState:(int64_t)a3;
- (AVAudioEngine)audioEngine;
- (AVAudioFormat)audioFormat;
- (AVAudioSession)audioSession;
- (AXSDListenEngine)init;
- (BOOL)_notListeningForAnyReason;
- (BOOL)_startListeningWithError:(id *)a3;
- (BOOL)_stopListeningAndTransitionToState:(int64_t)a3;
- (BOOL)containsListenDelegate:(id)a3;
- (BOOL)isListening;
- (BOOL)supportsVirtualAudioDevice;
- (id)audioEngineInputNode;
- (int64_t)state;
- (unint64_t)bufferSize;
- (void)_activateNotifications;
- (void)_carPlayIsConnectedDidChange:(id)a3;
- (void)_handleAudioSessionInterruption:(id)a3;
- (void)_handleBuffer:(id)a3 atTime:(id)a4;
- (void)_handleBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5;
- (void)_handleConfigurationChangeNotification:(id)a3;
- (void)_handleInterruptionRequestingState:(int64_t)a3;
- (void)_interruptCarPlay:(id)a3;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_micDisabledUpdated;
- (void)_notifyListeningStartedWithError:(id)a3;
- (void)_pipedInFileUpdated;
- (void)_restartSoundRecognitionIfNecesary;
- (void)_setState:(int64_t)a3;
- (void)_setupAudioInputWithError:(id *)a3 shouldInterrupt:(BOOL)a4;
- (void)_startIfPossibleAndNotify;
- (void)addListenDelegate:(id)a3;
- (void)audioEngineInputNode;
- (void)dealloc;
- (void)notifyListeningEncounteredError:(id)a3;
- (void)notifyListeningFinishedAudioFile:(id)a3;
- (void)notifyListeningReceivedAudioFile:(id)a3;
- (void)notifyListeningStartedWithError:(id)a3;
- (void)pipeInFile:(id)a3;
- (void)removeListenDelegate:(id)a3;
- (void)setAudioEngine:(id)a3;
- (void)setAudioSession:(id)a3;
@end

@implementation AXSDListenEngine

+ (AXSDListenEngine)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance___SharedEngine;
  return (AXSDListenEngine *)v2;
}

uint64_t __34__AXSDListenEngine_sharedInstance__block_invoke()
{
  sharedInstance___SharedEngine = objc_alloc_init(AXSDListenEngine);
  return MEMORY[0x270F9A758]();
}

- (AXSDListenEngine)init
{
  v15.receiver = self;
  v15.super_class = (Class)AXSDListenEngine;
  v2 = [(AXSDListenEngine *)&v15 init];
  v3 = v2;
  if (v2)
  {
    audioEngine = v2->_audioEngine;
    v2->_audioEngine = 0;

    audioSession = v3->_audioSession;
    v3->_audioSession = 0;

    uint64_t v6 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    delegates = v3->_delegates;
    v3->_delegates = (NSPointerArray *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.accessibility.axhalistenengine.delegatequeue", v8);
    delegateQueue = v3->_delegateQueue;
    v3->_delegateQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessibility.axhalistenengine.audio", v11);
    audioProcessingQueue = v3->_audioProcessingQueue;
    v3->_audioProcessingQueue = (OS_dispatch_queue *)v12;

    v3->_state = 0;
    [(AXSDListenEngine *)v3 _activateNotifications];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(AXSDListenEngine *)self audioEngineInputNode];
  [v3 removeTapOnBus:0];

  v4.receiver = self;
  v4.super_class = (Class)AXSDListenEngine;
  [(AXSDListenEngine *)&v4 dealloc];
}

- (BOOL)isListening
{
  return ![(AXSDListenEngine *)self _notListeningForAnyReason];
}

- (AVAudioFormat)audioFormat
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  audioProcessingQueue = self->_audioProcessingQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__AXSDListenEngine_audioFormat__block_invoke;
  v5[3] = &unk_2647F4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioProcessingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAudioFormat *)v3;
}

void __31__AXSDListenEngine_audioFormat__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) audioEngineInputNode];

  if (v2)
  {
    id v6 = [*(id *)(a1 + 32) audioEngineInputNode];
    uint64_t v3 = [v6 inputFormatForBus:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (unint64_t)bufferSize
{
  return 4410;
}

- (BOOL)supportsVirtualAudioDevice
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_10;
  }
  if (MGGetSInt32Answer() == 1)
  {
    if (MGGetBoolAnswer()) {
      int v2 = MGGetBoolAnswer();
    }
    else {
      int v2 = 0;
    }
    uint64_t v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      if (v2) {
        id v6 = "YES";
      }
      int v8 = 136315138;
      dispatch_queue_t v9 = v6;
      v5 = "iPhone supports VAD: %s";
LABEL_18:
      _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0xCu);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (MGGetSInt32Answer() != 3)
  {
LABEL_10:
    uint64_t v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "Device supports VAD: NO", (uint8_t *)&v8, 2u);
    }
    LOBYTE(v2) = 0;
    goto LABEL_19;
  }
  int v2 = MGGetBoolAnswer();
  uint64_t v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "NO";
    if (v2) {
      uint64_t v4 = "YES";
    }
    int v8 = 136315138;
    dispatch_queue_t v9 = v4;
    v5 = "iPad supports VAD: %s";
    goto LABEL_18;
  }
LABEL_19:

  return v2;
}

- (BOOL)containsListenDelegate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(NSPointerArray *)self->_delegates copy];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v5 pointerAtIndex:v6];

      BOOL v8 = v7 == v4;
      if (v8) {
        break;
      }
      ++v6;
    }
    while (v6 < [v5 count]);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)addListenDelegate:(id)a3
{
  id v4 = a3;
  v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDListenEngine addListenDelegate:]();
  }

  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__AXSDListenEngine_addListenDelegate___block_invoke;
  v8[3] = &unk_2647F4A58;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(delegateQueue, v8);
}

void __38__AXSDListenEngine_addListenDelegate___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x22A66F7B0]();
  if ([*(id *)(a1 + 32) containsListenDelegate:*(void *)(a1 + 40)])
  {
    uint64_t v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v4;
      _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "Object %@ is already a delegate of AXHAListenEngine", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    [*(id *)(*(void *)(a1 + 32) + 24) addPointer:*(void *)(a1 + 40)];
    unint64_t v6 = AXLogUltron();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_2();
      }

      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __38__AXSDListenEngine_addListenDelegate___block_invoke_21;
      v11[3] = &unk_2647F49E0;
      v11[4] = *(void *)(a1 + 32);
      BOOL v8 = MEMORY[0x263EF83A0];
      id v9 = v11;
    }
    else
    {
      if (v7) {
        __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_1();
      }

      uint64_t v10 = *(void *)(a1 + 32);
      BOOL v8 = *(NSObject **)(v10 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__AXSDListenEngine_addListenDelegate___block_invoke_20;
      block[3] = &unk_2647F49E0;
      block[4] = v10;
      id v9 = block;
    }
    dispatch_async(v8, v9);
  }
}

uint64_t __38__AXSDListenEngine_addListenDelegate___block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startIfPossibleAndNotify];
}

uint64_t __38__AXSDListenEngine_addListenDelegate___block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyListeningStartedWithError:0];
}

- (void)notifyListeningStartedWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDListenEngine notifyListeningStartedWithError:]((uint64_t)v4, v5);
  }

  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__AXSDListenEngine_notifyListeningStartedWithError___block_invoke;
  v8[3] = &unk_2647F4A58;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(delegateQueue, v8);
}

uint64_t __52__AXSDListenEngine_notifyListeningStartedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyListeningStartedWithError:*(void *)(a1 + 40)];
}

- (void)_notifyListeningStartedWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[(NSPointerArray *)self->_delegates copy];
  unint64_t v6 = (void *)MEMORY[0x22A66F7B0]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        dispatch_queue_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (v4)
        {
          [v12 listenEngineFailedToStartWithError:v4];
        }
        else
        {
          audioProcessingQueue = self->_audioProcessingQueue;
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __53__AXSDListenEngine__notifyListeningStartedWithError___block_invoke;
          v14[3] = &unk_2647F4A58;
          v14[4] = v12;
          v14[5] = self;
          dispatch_async(audioProcessingQueue, v14);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

void __53__AXSDListenEngine__notifyListeningStartedWithError___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) audioEngineInputNode];
  int v2 = [v3 inputFormatForBus:0];
  [v1 listenEngineDidStartWithInputFormat:v2];
}

- (void)notifyListeningEncounteredError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDListenEngine notifyListeningEncounteredError:]();
  }

  unint64_t v6 = (void *)[(NSPointerArray *)self->_delegates copy];
  delegateQueue = self->_delegateQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__AXSDListenEngine_notifyListeningEncounteredError___block_invoke;
  v10[3] = &unk_2647F4A58;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(delegateQueue, v10);
}

void __52__AXSDListenEngine_notifyListeningEncounteredError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x22A66F7B0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "listenEngineEncounteredError:", *(void *)(a1 + 40), (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)notifyListeningReceivedAudioFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDListenEngine notifyListeningReceivedAudioFile:]();
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_delegates;
  uint64_t v7 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "listenEngineReceivedAudioFile:", v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)notifyListeningFinishedAudioFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDListenEngine notifyListeningFinishedAudioFile:]();
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_delegates;
  uint64_t v7 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "listenEngineFinishedAudioFile:", v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)removeListenDelegate:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__AXSDListenEngine_removeListenDelegate___block_invoke;
  v7[3] = &unk_2647F4A58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

void __41__AXSDListenEngine_removeListenDelegate___block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x22A66F7B0]();
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 24) pointerAtIndex:v3];
      uint64_t v5 = *(void **)(a1 + 40);

      if (v4 == v5) {
        break;
      }
      if (++v3 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 24) count]) {
        goto LABEL_10;
      }
    }
    id v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __41__AXSDListenEngine_removeListenDelegate___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(a1 + 32) + 24) removePointerAtIndex:v3];
    [*(id *)(*(void *)(a1 + 32) + 24) compact];
    if (![*(id *)(*(void *)(a1 + 32) + 24) count])
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(NSObject **)(v7 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__AXSDListenEngine_removeListenDelegate___block_invoke_28;
      block[3] = &unk_2647F49E0;
      block[4] = v7;
      dispatch_async(v8, block);
    }
  }
LABEL_10:
}

uint64_t __41__AXSDListenEngine_removeListenDelegate___block_invoke_28(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListeningAndTransitionToState:0];
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(AXSDListenEngine *)(uint64_t)self _setState:v5];
  }

  self->_state = a3;
}

+ (id)_stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return @"StartingUp";
  }
  else {
    return off_2647F4C70[a3];
  }
}

- (void)_handleBuffer:(id)a3 atTime:(id)a4
{
}

- (void)_handleBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke;
  block[3] = &unk_2647F4BD8;
  block[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v18 = v9;
  BOOL v19 = a5;
  id v12 = v9;
  dispatch_async(delegateQueue, block);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_3;
  v14[3] = &unk_2647F49E0;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

unint64_t __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (result)
  {
    unint64_t v3 = 0;
    id v4 = MEMORY[0x263EF83A0];
    do
    {
      objc_initWeak(&location, (id)[*(id *)(*(void *)(a1 + 32) + 24) pointerAtIndex:v3]);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_2;
      block[3] = &unk_2647F4BB0;
      objc_copyWeak(&v8, &location);
      id v6 = *(id *)(a1 + 40);
      id v7 = *(id *)(a1 + 48);
      char v9 = *(unsigned char *)(a1 + 56);
      dispatch_async(v4, block);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
      ++v3;
      unint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
    }
    while (v3 < result);
  }
  return result;
}

void __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_2(uint64_t a1)
{
  int v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v4 = objc_opt_respondsToSelector();

  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = v5;
  if (v4) {
    [v5 receivedBuffer:v6 atTime:v7 isFile:*(unsigned __int8 *)(a1 + 56)];
  }
  else {
    [v5 receivedBuffer:v6 atTime:v7];
  }
}

void __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_3(uint64_t a1)
{
  id v2 = +[AXSDAudioLevelsHelper sharedInstance];
  [v2 updateListenersWithBuffer:*(void *)(a1 + 32)];
}

- (id)audioEngineInputNode
{
  audioEngine = self->_audioEngine;
  if (audioEngine)
  {
    unint64_t v3 = [(AVAudioEngine *)audioEngine inputNode];
  }
  else
  {
    char v4 = AXLogUltron();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXSDListenEngine audioEngineInputNode]();
    }

    unint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)_startListeningWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    id v5 = [MEMORY[0x263F21DA0] sharedInstance];
    int v6 = [v5 micDisabled];

    if (v6)
    {
      [(AXSDListenEngine *)self _setState:6];
      return 1;
    }
  }
  uint64_t v7 = AXLogUltron();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine will start listening", buf, 2u);
  }

  int64_t state = self->_state;
  if ((state & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (state == 4)
    {
      char v9 = AXLogUltron();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _startListeningWithError:]();
      }
    }
    return 1;
  }
  if (!self->_audioEngine)
  {
    id v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      audioEngine = self->_audioEngine;
      *(_DWORD *)buf = 138412290;
      v47 = audioEngine;
      _os_log_impl(&dword_226F20000, v11, OS_LOG_TYPE_INFO, "Setting up a new audio engine: %@", buf, 0xCu);
    }

    id v13 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x263EF9360]);
    long long v14 = self->_audioEngine;
    self->_audioEngine = v13;
  }
  if (!self->_audioSession)
  {
    id v15 = AXLogUltron();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      audioSession = self->_audioSession;
      *(_DWORD *)buf = 138412290;
      v47 = audioSession;
      _os_log_impl(&dword_226F20000, v15, OS_LOG_TYPE_INFO, "Getting a new audio session: %@", buf, 0xCu);
    }

    id v17 = [MEMORY[0x263EF93E0] sharedInstance];
    id v18 = self->_audioSession;
    self->_audioSession = v17;
  }
  if (![(AXSDListenEngine *)self supportsVirtualAudioDevice])
  {
    BOOL v19 = [MEMORY[0x263F544E0] sharedAVSystemController];
    uint64_t v20 = [v19 attributeForKey:*MEMORY[0x263F54358]];
    int v21 = [v20 BOOLValue];

    if (v21)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"Ultron.CarPlay", @"_startListeningWithError called while CarPlay running - going into paused state and will resume when CarPlay disconnects");
        BOOL v10 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        return v10;
      }
      return 0;
    }
  }
  [(AXSDListenEngine *)self _setState:4];
  v22 = [MEMORY[0x263F544E0] sharedAVSystemController];
  v23 = [v22 attributeForKey:*MEMORY[0x263F543B8]];
  uint64_t v24 = [v23 BOOLValue];

  if (v24)
  {
    v25 = AXLogUltron();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226F20000, v25, OS_LOG_TYPE_DEFAULT, "Something is NOW PLAYING; SR must interrupt to startup.",
        buf,
        2u);
    }
  }
  [(AXSDListenEngine *)self _setupAudioInputWithError:a3 shouldInterrupt:v24];
  if (a3)
  {
    if (*a3)
    {
      v26 = AXLogUltron();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        [(AXSDListenEngine *)v24 _startListeningWithError:v26];
      }
LABEL_61:

      return 0;
    }
    [(AVAudioSession *)self->_audioSession setParticipatesInVolumePolicy:0 error:a3];
    if (*a3)
    {
      v34 = AXLogUltron();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _startListeningWithError:].cold.7();
      }

      *a3 = 0;
    }
    [(AVAudioSession *)self->_audioSession setEligibleForBTSmartRoutingConsideration:0 error:a3];
    if (*a3)
    {
      v35 = AXLogUltron();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _startListeningWithError:].cold.6();
      }

      *a3 = 0;
    }
    [(AVAudioSession *)self->_audioSession setActive:1 error:a3];
    if (*a3)
    {
      v26 = AXLogUltron();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _startListeningWithError:].cold.5();
      }
      goto LABEL_61;
    }
  }
  else
  {
    [(AVAudioSession *)self->_audioSession setParticipatesInVolumePolicy:0 error:0];
    [(AVAudioSession *)self->_audioSession setEligibleForBTSmartRoutingConsideration:0 error:0];
    [(AVAudioSession *)self->_audioSession setActive:1 error:0];
  }
  if (v24)
  {
    v27 = AXLogUltron();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226F20000, v27, OS_LOG_TYPE_DEFAULT, "Reconfiguring audio session to be mixable.", buf, 2u);
    }

    [(AXSDListenEngine *)self _setupAudioInputWithError:a3 shouldInterrupt:0];
    if (a3)
    {
      if (*a3)
      {
        v26 = AXLogUltron();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[AXSDListenEngine _startListeningWithError:].cold.4();
        }
        goto LABEL_61;
      }
    }
  }
  v28 = [(AVAudioEngine *)self->_audioEngine attachedNodes];
  BOOL v29 = [v28 count] == 0;

  if (!v29)
  {
    v30 = [(AXSDListenEngine *)self audioEngineInputNode];
    [v30 removeTapOnBus:0];
  }
  [(AXSDListenEngine *)self audioEngineInputNode];

  v31 = [(AXSDListenEngine *)self audioEngine];
  [v31 prepare];

  v32 = [(AXSDListenEngine *)self audioEngine];
  int v33 = [v32 startAndReturnError:a3];

  if (!v33 || a3 && *a3)
  {
    v26 = AXLogUltron();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[AXSDListenEngine _startListeningWithError:]();
    }
    goto LABEL_61;
  }
  v37 = [(AXSDListenEngine *)self audioEngineInputNode];
  v38 = [v37 inputFormatForBus:0];

  if ([v38 channelCount] && (objc_msgSend(v38, "sampleRate"), v39 != 0.0))
  {
    objc_initWeak((id *)buf, self);
    v41 = [(AXSDListenEngine *)self audioEngineInputNode];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __45__AXSDListenEngine__startListeningWithError___block_invoke;
    v44[3] = &unk_2647F4C00;
    objc_copyWeak(&v45, (id *)buf);
    [v41 installTapOnBus:0 bufferSize:4410 format:v38 block:v44];

    [(AXSDListenEngine *)self _setState:5];
    v42 = AXLogUltron();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_226F20000, v42, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine did start listening", v43, 2u);
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
    BOOL v10 = 1;
  }
  else
  {
    v40 = AXLogUltron();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[AXSDListenEngine _startListeningWithError:]();
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"com.apple.accessibility.ultron", @"Invalid input format: %@", v38);
      BOOL v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

void __45__AXSDListenEngine__startListeningWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleBuffer:v6 atTime:v5];
}

- (BOOL)_notListeningForAnyReason
{
  return +[AXSDListenEngine _stateIsNotListening:self->_state];
}

+ (BOOL)_stateIsNotListening:(int64_t)a3
{
  return (unint64_t)(a3 - 7) < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_stopListeningAndTransitionToState:(int64_t)a3
{
  id v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine will stop listening.", buf, 2u);
  }

  if (!+[AXSDListenEngine _stateIsNotListening:a3])
  {
    id v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXSDListenEngine _stopListeningAndTransitionToState:]();
    }

    a3 = 1;
  }
  if ([(AXSDListenEngine *)self _notListeningForAnyReason])
  {
    [(AXSDListenEngine *)self _setState:a3];
    uint64_t v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine was already stopped", v20, 2u);
    }
  }
  else
  {
    if (self->_audioEngine)
    {
      id v8 = [(AXSDListenEngine *)self audioEngineInputNode];
      [v8 removeTapOnBus:0];

      char v9 = [(AXSDListenEngine *)self audioEngine];
      [v9 stop];

      audioEngine = self->_audioEngine;
      self->_audioEngine = 0;
    }
    audioSession = self->_audioSession;
    id v19 = 0;
    BOOL v12 = [(AVAudioSession *)audioSession setActive:0 withOptions:1 error:&v19];
    id v13 = v19;
    uint64_t v7 = v13;
    if (!v12 || v13)
    {
      long long v14 = AXLogUltron();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _stopListeningAndTransitionToState:]();
      }
    }
    id v15 = self->_audioSession;
    self->_audioSession = 0;

    [(AXSDListenEngine *)self _setState:a3];
    long long v16 = AXLogUltron();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_226F20000, v16, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine did stop listening", v18, 2u);
    }
  }
  return 1;
}

- (void)_activateNotifications
{
  v20[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_INFO, "Activating Notifications", (uint8_t *)buf, 2u);
  }

  char v4 = [MEMORY[0x263F544E0] sharedAVSystemController];
  id v5 = (uint64_t *)MEMORY[0x263F54360];
  v20[0] = *MEMORY[0x263F54360];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  [v4 setAttribute:v6 forKey:*MEMORY[0x263F544A0] error:0];

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = *v5;
  char v9 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v7 addObserver:self selector:sel__carPlayIsConnectedDidChange_ name:v8 object:v9];

  BOOL v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel__handleAudioSessionInterruption_ name:*MEMORY[0x263EF90A0] object:self->_audioSession];

  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel__handleConfigurationChangeNotification_ name:*MEMORY[0x263EF9020] object:self->_audioEngine];

  BOOL v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__mediaServicesWereReset_ name:*MEMORY[0x263EF90F8] object:self->_audioSession];

  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    objc_initWeak(buf, self);
    id v13 = [MEMORY[0x263F21DA0] sharedInstance];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __42__AXSDListenEngine__activateNotifications__block_invoke;
    v17[3] = &unk_2647F47F8;
    objc_copyWeak(&v18, buf);
    [v13 registerUpdateBlock:v17 forRetrieveSelector:sel_micDisabled withListener:self];

    long long v14 = [MEMORY[0x263F21DA0] sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __42__AXSDListenEngine__activateNotifications__block_invoke_2;
    v15[3] = &unk_2647F47F8;
    objc_copyWeak(&v16, buf);
    [v14 registerUpdateBlock:v15 forRetrieveSelector:sel_pipedInFile withListener:self];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

void __42__AXSDListenEngine__activateNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _micDisabledUpdated];
}

void __42__AXSDListenEngine__activateNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pipedInFileUpdated];
}

- (void)_micDisabledUpdated
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    unint64_t v3 = [MEMORY[0x263F21DA0] sharedInstance];
    int v4 = [v3 micDisabled];
    id v5 = @"enabled";
    if (v4) {
      id v5 = @"disabled";
    }
    id v6 = v5;

    uint64_t v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_DEFAULT, "AUTOMATION: Mic: %@", buf, 0xCu);
    }

    uint64_t v8 = [MEMORY[0x263F21DA0] sharedInstance];
    int v9 = [v8 micDisabled];

    if (v9)
    {
      if (![(AXSDListenEngine *)self isListening])
      {
LABEL_11:

        return;
      }
      audioProcessingQueue = self->_audioProcessingQueue;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __39__AXSDListenEngine__micDisabledUpdated__block_invoke;
      v13[3] = &unk_2647F49E0;
      v13[4] = self;
      id v11 = v13;
    }
    else
    {
      audioProcessingQueue = self->_audioProcessingQueue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __39__AXSDListenEngine__micDisabledUpdated__block_invoke_2;
      v12[3] = &unk_2647F49E0;
      v12[4] = self;
      id v11 = v12;
    }
    dispatch_async(audioProcessingQueue, v11);
    goto LABEL_11;
  }
}

uint64_t __39__AXSDListenEngine__micDisabledUpdated__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopListeningAndTransitionToState:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 _startListeningWithError:0];
}

uint64_t __39__AXSDListenEngine__micDisabledUpdated__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopListeningAndTransitionToState:1];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (result)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 _startIfPossibleAndNotify];
  }
  return result;
}

- (void)_pipedInFileUpdated
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F21DA0] sharedInstance];
  unint64_t v3 = [v2 pipedInFile];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_226F20000, a1, OS_LOG_TYPE_ERROR, "Not processing piped in file: (%@)", v4, 0xCu);
}

- (void)pipeInFile:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [NSURL URLWithString:v4];
  id v24 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v5 error:&v24];
  id v7 = v24;
  uint64_t v8 = AXLogUltron();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_226F20000, v8, OS_LOG_TYPE_DEFAULT, "Processing file: %@", buf, 0xCu);
  }

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    [(AXSDListenEngine *)self notifyListeningReceivedAudioFile:v6];
    uint64_t v11 = [v6 framePosition];
    if (v11 >= [v6 length])
    {
LABEL_19:
      v22 = AXLogUltron();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v6;
        _os_log_impl(&dword_226F20000, v22, OS_LOG_TYPE_DEFAULT, "Finished processing: %@", buf, 0xCu);
      }

      [(AXSDListenEngine *)self notifyListeningFinishedAudioFile:v6];
      CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x263EFFE88], 1.0, 0);
      id v7 = 0;
    }
    else
    {
      while (1)
      {
        BOOL v12 = (void *)MEMORY[0x263EF9430];
        uint64_t v13 = [v6 framePosition];
        long long v14 = [v6 processingFormat];
        [v14 sampleRate];
        id v15 = objc_msgSend(v12, "timeWithSampleTime:atRate:", v13);

        id v16 = objc_alloc(MEMORY[0x263EF93B0]);
        id v17 = [v6 processingFormat];
        id v18 = (void *)[v16 initWithPCMFormat:v17 frameCapacity:4410];

        id v23 = 0;
        [v6 readIntoBuffer:v18 error:&v23];
        id v19 = v23;
        if (v19) {
          break;
        }
        if (![v18 frameLength])
        {

          goto LABEL_19;
        }
        [(AXSDListenEngine *)self _handleBuffer:v18 atTime:v15 isFile:1];

        uint64_t v20 = [v6 framePosition];
        if (v20 >= [v6 length]) {
          goto LABEL_19;
        }
      }
      id v7 = v19;
      int v21 = AXLogUltron();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine pipeInFile:]();
      }

      [(AXSDListenEngine *)self notifyListeningEncounteredError:v7];
    }
  }
  else
  {
    BOOL v10 = AXLogUltron();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = v4;
      __int16 v27 = 2112;
      v28 = v5;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_error_impl(&dword_226F20000, v10, OS_LOG_TYPE_ERROR, "AUTOMATION: Unable to open file: %@\n%@\n%@", buf, 0x20u);
    }

    [(AXSDListenEngine *)self notifyListeningEncounteredError:v7];
  }
}

- (void)_setupAudioInputWithError:(id *)a3 shouldInterrupt:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a4) {
    uint64_t v7 = 40;
  }
  else {
    uint64_t v7 = 41;
  }
  if ([MEMORY[0x263F472B0] currentProcessIsAXUIServer])
  {
    uint64_t v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_226F20000, v8, OS_LOG_TYPE_INFO, "Disabling microphone usage indicator for AXSDListenEngine", (uint8_t *)&v19, 2u);
    }

    [(AVAudioSession *)self->_audioSession setPrefersNoMicrophoneUsageIndicator:1 error:a3];
    if (a3 && *a3)
    {
      BOOL v9 = AXLogUltron();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.9();
      }

      *a3 = 0;
    }
  }
  [(AVAudioSession *)self->_audioSession setMXSessionProperty:*MEMORY[0x263F54670] value:MEMORY[0x263EFFA88] error:a3];
  if (a3 && *a3)
  {
    BOOL v10 = AXLogUltron();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.8();
    }

    *a3 = 0;
  }
  BOOL v11 = [(AXSDListenEngine *)self supportsVirtualAudioDevice];
  BOOL v12 = AXLogUltron();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_226F20000, v12, OS_LOG_TYPE_DEFAULT, "Using legacy Default Audio Session.", (uint8_t *)&v19, 2u);
    }

    [(AVAudioSession *)self->_audioSession setCategory:*MEMORY[0x263EF9050] mode:*MEMORY[0x263EF9108] options:v7 error:a3];
    if (a3)
    {
      if (*a3)
      {
        long long v14 = AXLogUltron();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_54;
        }
        goto LABEL_23;
      }
      if (a4) {
        return;
      }
      [(AVAudioSession *)self->_audioSession setAudioHardwareControlFlags:2 error:a3];
      if (*a3)
      {
        long long v14 = AXLogUltron();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.6();
        }
        goto LABEL_54;
      }
      [(AVAudioSession *)self->_audioSession preferDecoupledIO:1 error:a3];
      if (*a3)
      {
        long long v14 = AXLogUltron();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.5();
        }
        goto LABEL_54;
      }
      [(AVAudioSession *)self->_audioSession setAllowHapticsAndSystemSoundsDuringRecording:1 error:a3];
      if (*a3)
      {
        long long v14 = AXLogUltron();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_54;
        }
LABEL_53:
        -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:]();
        goto LABEL_54;
      }
      [(AVAudioSession *)self->_audioSession setParticipatesInVolumePolicy:0 error:a3];
      if (*a3)
      {
        long long v14 = AXLogUltron();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_54;
        }
        goto LABEL_53;
      }
    }
    else
    {
      if (a4) {
        return;
      }
      [(AVAudioSession *)self->_audioSession setAudioHardwareControlFlags:2 error:0];
      [(AVAudioSession *)self->_audioSession preferDecoupledIO:1 error:0];
      [(AVAudioSession *)self->_audioSession setAllowHapticsAndSystemSoundsDuringRecording:1 error:0];
      [(AVAudioSession *)self->_audioSession setParticipatesInVolumePolicy:0 error:0];
    }
    long long v14 = AXLogUltron();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_54;
    }
    id v18 = NSNumber;
    [(AVAudioSession *)self->_audioSession preferredInputSampleRate];
    id v16 = objc_msgSend(v18, "numberWithDouble:");
    int v19 = 138412290;
    uint64_t v20 = v16;
    id v17 = "Successfully initialized audio session for listen: Preferred rate: %@";
    goto LABEL_37;
  }
  if (v13)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_226F20000, v12, OS_LOG_TYPE_DEFAULT, "Using Sound Recognition Mode for Audio Session.", (uint8_t *)&v19, 2u);
  }

  [(AVAudioSession *)self->_audioSession setCategory:*MEMORY[0x263EF9050] mode:*MEMORY[0x263EF9140] options:v7 error:a3];
  if (!a3)
  {
    [(AVAudioSession *)self->_audioSession setAllowHapticsAndSystemSoundsDuringRecording:1 error:0];
LABEL_31:
    long long v14 = AXLogUltron();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_54;
    }
    id v15 = NSNumber;
    [(AVAudioSession *)self->_audioSession preferredInputSampleRate];
    id v16 = objc_msgSend(v15, "numberWithDouble:");
    int v19 = 138412290;
    uint64_t v20 = v16;
    id v17 = "Successfully initialized audio session for listen with Sound Recognition Mode: Preferred rate: %@";
LABEL_37:
    _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);

    goto LABEL_54;
  }
  if (!*a3)
  {
    [(AVAudioSession *)self->_audioSession setAllowHapticsAndSystemSoundsDuringRecording:1 error:a3];
    if (*a3)
    {
      long long v14 = AXLogUltron();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:]();
      }
      goto LABEL_54;
    }
    goto LABEL_31;
  }
  long long v14 = AXLogUltron();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
LABEL_23:
  }
    -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:]();
LABEL_54:
}

- (void)_startIfPossibleAndNotify
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error starting Sound Recognition: %@", v2, v3, v4, v5, v6);
}

uint64_t __45__AXSDListenEngine__startIfPossibleAndNotify__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyListeningStartedWithError:*(void *)(a1 + 40)];
}

- (void)_handleAudioSessionInterruption:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session received Audio Interruption: %@", buf, 0xCu);
  }

  uint8_t v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x263EF90C8]];
  uint64_t v8 = [v7 unsignedIntegerValue];

  BOOL v9 = [v6 objectForKey:*MEMORY[0x263EF90A8]];
  [v9 unsignedIntegerValue];

  audioProcessingQueue = self->_audioProcessingQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__AXSDListenEngine__handleAudioSessionInterruption___block_invoke;
  v11[3] = &unk_2647F4C28;
  v11[4] = self;
  void v11[5] = v8;
  dispatch_async(audioProcessingQueue, v11);
}

uint64_t __52__AXSDListenEngine__handleAudioSessionInterruption___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    if (v2 != 1) {
      return result;
    }
    uint64_t v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = 2;
      _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "Audio Session interruption started", buf, 2u);
    }
    else
    {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_226F20000, v3, OS_LOG_TYPE_DEFAULT, "Audio Session interruption ended", v5, 2u);
    }
    uint64_t v4 = 5;
  }

  return [*(id *)(v1 + 32) _handleInterruptionRequestingState:v4];
}

- (void)_handleInterruptionRequestingState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    unint64_t v4 = state & 0xFFFFFFFFFFFFFFFELL;
    if (a3 == 2 && v4 == 4)
    {
      [(AXSDListenEngine *)self _stopListeningAndTransitionToState:2];
    }
    else if (a3 == 5 && v4 == 2)
    {
      [(AXSDListenEngine *)self _startIfPossibleAndNotify];
    }
    else
    {
      uint64_t v5 = AXLogUltron();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[AXSDListenEngine _handleInterruptionRequestingState:]();
      }
    }
  }
}

- (void)_carPlayIsConnectedDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "CarPlay is Connected Changed: %@", (uint8_t *)&v7, 0xCu);
  }

  if (![(AXSDListenEngine *)self supportsVirtualAudioDevice])
  {
    uint8_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_226F20000, v6, OS_LOG_TYPE_DEFAULT, "CarPlay is not supported on this device. Interrupting audio session.", (uint8_t *)&v7, 2u);
    }

    [(AXSDListenEngine *)self _interruptCarPlay:v4];
  }
}

- (void)_interruptCarPlay:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F54368]];
  char v6 = [v5 BOOLValue];

  audioProcessingQueue = self->_audioProcessingQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__AXSDListenEngine__interruptCarPlay___block_invoke;
  v8[3] = &unk_2647F4C50;
  char v9 = v6;
  v8[4] = self;
  dispatch_async(audioProcessingQueue, v8);
}

void __38__AXSDListenEngine__interruptCarPlay___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[4];
  if (v2)
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      [v3 _handleInterruptionRequestingState:2];
      return;
    }
    goto LABEL_10;
  }
  if (v4 != 2)
  {
LABEL_10:
    char v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = *(unsigned __int8 *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 67109376;
      int v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      _os_log_impl(&dword_226F20000, v9, OS_LOG_TYPE_INFO, "CarPlay changed state connected:%i, but nothing to do b/c SR in state: %ld", buf, 0x12u);
    }

    return;
  }
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "CarPlay disconnected - waiting for it to become an unpickable route to restart.", buf, 2u);
  }

  [*(id *)(a1 + 32) _setState:3];
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__AXSDListenEngine__interruptCarPlay___block_invoke_103;
  block[3] = &unk_2647F49E0;
  void block[4] = v7;
  dispatch_after(v6, v8, block);
}

void __38__AXSDListenEngine__interruptCarPlay___block_invoke_103(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[4] == 3)
  {
    [v1 _handleInterruptionRequestingState:5];
  }
  else
  {
    int v2 = AXLogUltron();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_226F20000, v2, OS_LOG_TYPE_DEFAULT, "CarPlay disconnect waiting period over, but no longer in AXHAListenEngineNotListening_CarPlayWaitingOnDisconnect state - doing nothing.", v3, 2u);
    }
  }
}

- (void)_handleConfigurationChangeNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "Audio Config Changed: %@", buf, 0xCu);
  }

  if (self->_state == 2)
  {
    dispatch_time_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "AXSDListenEngine state is currently in an interrupt state, so can't handle configuration change";
LABEL_9:
      _os_log_impl(&dword_226F20000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    if (![(AXSDListenEngine *)self supportsVirtualAudioDevice])
    {
      audioProcessingQueue = self->_audioProcessingQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__AXSDListenEngine__handleConfigurationChangeNotification___block_invoke;
      block[3] = &unk_2647F49E0;
      void block[4] = self;
      dispatch_async(audioProcessingQueue, block);
      goto LABEL_12;
    }
    dispatch_time_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Using new Sound Recognition VAD. Ignoring...";
      goto LABEL_9;
    }
  }

LABEL_12:
}

uint64_t __59__AXSDListenEngine__handleConfigurationChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartSoundRecognitionIfNecesary];
}

- (void)_mediaServicesWereReset:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_DEFAULT, "Media reset: %@", buf, 0xCu);
  }

  audioProcessingQueue = self->_audioProcessingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__AXSDListenEngine__mediaServicesWereReset___block_invoke;
  block[3] = &unk_2647F49E0;
  void block[4] = self;
  dispatch_async(audioProcessingQueue, block);
}

uint64_t __44__AXSDListenEngine__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_226F20000, v2, OS_LOG_TYPE_INFO, "Destroying current audio engine: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  dispatch_time_t v6 = AXLogUltron();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 48);
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_226F20000, v6, OS_LOG_TYPE_INFO, "Destroying current audio session: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = 0;

  [*(id *)(a1 + 32) _setState:2];
  return [*(id *)(a1 + 32) _restartSoundRecognitionIfNecesary];
}

- (void)_restartSoundRecognitionIfNecesary
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXSDListenEngine *)self _notListeningForAnyReason];
  if (self->_state == 2)
  {
    uint64_t v4 = [MEMORY[0x263F21DA0] sharedInstance];
    int v5 = [v4 soundDetectionEnabled];
  }
  else
  {
    int v5 = 0;
  }
  dispatch_time_t v6 = AXLogUltron();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = !v3;
    __int16 v8 = 1024;
    int v9 = v5;
    _os_log_impl(&dword_226F20000, v6, OS_LOG_TYPE_DEFAULT, "Restarting SR if necessary. wasListening = %i, shouldRestartAnyway: %i", (uint8_t *)v7, 0xEu);
  }

  if (!v3) {
    [(AXSDListenEngine *)self _stopListeningAndTransitionToState:1];
  }
  if (v5) {
    [(AXSDListenEngine *)self _startIfPossibleAndNotify];
  }
}

- (AVAudioEngine)audioEngine
{
  return (AVAudioEngine *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAudioEngine:(id)a3
{
}

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAudioSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_audioProcessingQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)addListenDelegate:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "Listen Engine: Add Listen Delegate", v2, v3, v4, v5, v6);
}

void __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "First delegate added to Listen Engine - starting up", v2, v3, v4, v5, v6);
}

void __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "Delegate added to Listen Engine - already running", v2, v3, v4, v5, v6);
}

- (void)notifyListeningStartedWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 == 0;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "Listen Engine: Notify Listening Started; success: %d",
    (uint8_t *)v2,
    8u);
}

- (void)notifyListeningEncounteredError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_226F20000, v0, v1, "Listen Engine: Notify Listening Encountered Error: %@", v2, v3, v4, v5, v6);
}

- (void)notifyListeningReceivedAudioFile:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_226F20000, v0, v1, "Listen Engine: Notify Listening Received Audio File: %@", v2, v3, v4, v5, v6);
}

- (void)notifyListeningFinishedAudioFile:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_226F20000, v0, v1, "Listen Engine: Notify Listening Finished Audio File: %@", v2, v3, v4, v5, v6);
}

void __41__AXSDListenEngine_removeListenDelegate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_226F20000, v0, v1, "Listen Engine: Remove Listen Delegate: %@", v2, v3, v4, v5, v6);
}

- (void)_setState:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[AXSDListenEngine _stringForState:*(void *)(a1 + 32)];
  uint8_t v6 = +[AXSDListenEngine _stringForState:a2];
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_226F20000, a3, OS_LOG_TYPE_DEBUG, "State transitioning from %@ to %@", (uint8_t *)&v7, 0x16u);
}

- (void)audioEngineInputNode
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Input node err: %@", v2, v3, v4, v5, v6);
}

- (void)_startListeningWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_226F20000, v0, OS_LOG_TYPE_ERROR, "_startListeningWithError called during startup - should be impossible if we're on our serial queue!", v1, 2u);
}

- (void)_startListeningWithError:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Invalid input format. %@", v2, v3, v4, v5, v6);
}

- (void)_startListeningWithError:.cold.3()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error starting audio engine: %@", v2, v3, v4, v5, v6);
}

- (void)_startListeningWithError:.cold.4()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Failed to set up audio session after interruption. %@", v2, v3, v4, v5, v6);
}

- (void)_startListeningWithError:.cold.5()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error activating audio session: %@", v2, v3, v4, v5, v6);
}

- (void)_startListeningWithError:.cold.6()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error removing participation BT smart routing: %@", v2, v3, v4, v5, v6);
}

- (void)_startListeningWithError:.cold.7()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error removing participation from volume button: %@", v2, v3, v4, v5, v6);
}

- (void)_startListeningWithError:(os_log_t)log .cold.8(char a1, uint64_t *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  v4[0] = 67109378;
  v4[1] = a1 & 1;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_226F20000, log, OS_LOG_TYPE_ERROR, "Failed to set up audio session (with interruption: %i). %@", (uint8_t *)v4, 0x12u);
}

- (void)_stopListeningAndTransitionToState:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error deactivating audio session: %@", v2, v3, v4, v5, v6);
}

- (void)_stopListeningAndTransitionToState:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Invalid state transition in Stop Listening: %ld - transitioning to AXHAListenEngineNotListening_ErrorState", v2, v3, v4, v5, v6);
}

- (void)pipeInFile:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "AUTOMATION: Unable to read file to buffer: %@", v2, v3, v4, v5, v6);
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error allowing system sounds and haptics while recording: %@", v2, v3, v4, v5, v6);
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.2()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error setting category, mode and options: %@", v2, v3, v4, v5, v6);
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.3()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error setting allowHapticsAndSystemSoundsDuringRecording: %@", v2, v3, v4, v5, v6);
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.5()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error setting decoupleIO: %@", v2, v3, v4, v5, v6);
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.6()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error setting HW control flags %@", v2, v3, v4, v5, v6);
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.8()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error setting kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl: %@", v2, v3, v4, v5, v6);
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.9()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Error setting Mic Indicator Control to Opt Out %@", v2, v3, v4, v5, v6);
}

- (void)_handleInterruptionRequestingState:.cold.1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_226F20000, v1, OS_LOG_TYPE_ERROR, "Invalid interruption state transition from %ld to %ld.", v2, 0x16u);
}

@end