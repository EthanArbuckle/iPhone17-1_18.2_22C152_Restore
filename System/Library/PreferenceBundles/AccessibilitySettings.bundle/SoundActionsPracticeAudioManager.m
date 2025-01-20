@interface SoundActionsPracticeAudioManager
+ (id)sharedInstance;
- (BOOL)_handleAccessibilityEvent:(id)a3;
- (BOOL)_handleSoundEvent:(int64_t)a3;
- (BOOL)isListening;
- (SoundActionsPracticeAudioManager)init;
- (void)_startAccessibilityEventProcessor;
- (void)_stopAccessibilityEventProcessor;
- (void)deregisterListener:(id)a3;
- (void)pause;
- (void)playURL:(id)a3;
- (void)playerDidEnd;
- (void)registerListener:(id)a3 forAudioLevelUpdates:(id)a4 forDetection:(id)a5 withBucketCount:(int)a6;
- (void)resume;
- (void)setIsListening:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation SoundActionsPracticeAudioManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___SharedManager;

  return v2;
}

void __50__SoundActionsPracticeAudioManager_sharedInstance__block_invoke(id a1)
{
  sharedInstance___SharedManager = objc_alloc_init(SoundActionsPracticeAudioManager);

  _objc_release_x1();
}

- (SoundActionsPracticeAudioManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SoundActionsPracticeAudioManager;
  v2 = [(SoundActionsPracticeAudioManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    [(SoundActionsPracticeAudioManager *)v2 setIsListening:0];
    v4 = (AVPlayer *)objc_alloc_init((Class)AVPlayer);
    player = v3->_player;
    v3->_player = v4;

    uint64_t v6 = objc_opt_new();
    detectionHandlers = v3->_detectionHandlers;
    v3->_detectionHandlers = (NSMutableDictionary *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.accessibility.sound_action_practice.update_listeners", 0);
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.accessibility.sound_action_practice.process_audio", 0);
    audioQueue = v3->_audioQueue;
    v3->_audioQueue = (OS_dispatch_queue *)v10;
  }
  return v3;
}

- (void)start
{
  if (![(SoundActionsPracticeAudioManager *)self isListening])
  {
    [(SoundActionsPracticeAudioManager *)self setIsListening:1];
    v3 = +[AXSDVoiceTriggerController sharedInstance];
    [v3 startListeningInPracticeSession];

    [(SoundActionsPracticeAudioManager *)self _startAccessibilityEventProcessor];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"playerDidEnd" name:AVPlayerItemDidPlayToEndTimeNotification object:0];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"playerDidEnd" name:AVPlayerItemFailedToPlayToEndTimeNotification object:0];
  }
}

- (void)resume
{
  id v2 = +[AXSDVoiceTriggerController sharedInstance];
  [v2 resumeListening];
}

- (void)stop
{
  if ([(SoundActionsPracticeAudioManager *)self isListening])
  {
    [(SoundActionsPracticeAudioManager *)self setIsListening:0];
    v3 = +[AXSDVoiceTriggerController sharedInstance];
    [v3 stopListening];

    [(SoundActionsPracticeAudioManager *)self _stopAccessibilityEventProcessor];
  }
}

- (void)pause
{
  id v2 = +[AXSDVoiceTriggerController sharedInstance];
  [v2 pauseListening];
}

- (void)_startAccessibilityEventProcessor
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Event process already started", v1, 2u);
}

id __69__SoundActionsPracticeAudioManager__startAccessibilityEventProcessor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _handleAccessibilityEvent:v3];

  return v5;
}

- (void)_stopAccessibilityEventProcessor
{
  [(AXEventProcessor *)self->_eventProcessor cleanup];
  [(AXEventProcessor *)self->_eventProcessor endHandlingHIDEventsForReason:@"Sound Actions Practic Event Handler"];
  eventProcessor = self->_eventProcessor;
  self->_eventProcessor = 0;
}

- (BOOL)_handleAccessibilityEvent:(id)a3
{
  id v4 = a3;
  id v5 = AXLogSoundActions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SoundActionsPracticeAudioManager _handleAccessibilityEvent:]((uint64_t)v4, v5);
  }

  uint64_t v6 = [v4 accessibilityData];
  if ([v6 page] != (char *)&dword_0 + 3) {
    goto LABEL_9;
  }
  if ((char *)[v6 usage] - 1 > (unsigned char *)&dword_C + 1)
  {
    dispatch_queue_t v8 = AXLogSoundActions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SoundActionsPracticeAudioManager _handleAccessibilityEvent:]((uint64_t)v6, v8);
    }

LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  BOOL v7 = -[SoundActionsPracticeAudioManager _handleSoundEvent:](self, "_handleSoundEvent:", [v6 usage]);
LABEL_10:

  return v7;
}

- (BOOL)_handleSoundEvent:(int64_t)a3
{
  handlerQueue = self->_handlerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __54__SoundActionsPracticeAudioManager__handleSoundEvent___block_invoke;
  v5[3] = &unk_208ED8;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async((dispatch_queue_t)handlerQueue, v5);
  return 1;
}

void __54__SoundActionsPracticeAudioManager__handleSoundEvent___block_invoke(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v6), v9, v10, v11, v12);
        dispatch_queue_t v8 = v7;
        if (v7)
        {
          v9 = _NSConcreteStackBlock;
          uint64_t v10 = 3221225472;
          v11 = __54__SoundActionsPracticeAudioManager__handleSoundEvent___block_invoke_2;
          v12 = &unk_208EB0;
          id v13 = v7;
          AXPerformBlockOnMainThread();
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t __54__SoundActionsPracticeAudioManager__handleSoundEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)playURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AVAudioSession sharedInstance];
  id v9 = 0;
  [v5 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:0 error:&v9];
  id v6 = v9;

  if (v6)
  {
    BOOL v7 = AXLogSoundActions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SoundActionsPracticeAudioManager playURL:]((uint64_t)v6, v7);
    }
  }
  [(SoundActionsPracticeAudioManager *)self _handleSoundEvent:-1];
  [(SoundActionsPracticeAudioManager *)self pause];
  dispatch_queue_t v8 = +[AVPlayerItem playerItemWithURL:v4];

  [(AVPlayer *)self->_player replaceCurrentItemWithPlayerItem:v8];
  [(AVPlayer *)self->_player play];
}

- (void)playerDidEnd
{
  [(SoundActionsPracticeAudioManager *)self resume];

  [(SoundActionsPracticeAudioManager *)self _handleSoundEvent:-2];
}

- (void)registerListener:(id)a3 forAudioLevelUpdates:(id)a4 forDetection:(id)a5 withBucketCount:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = AXLogSoundActions();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v10;
    _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "Register audio listener: %@", buf, 0xCu);
  }

  long long v14 = +[AXSDAudioLevelsHelper sharedInstance];
  [v14 registerListener:self forAudioLevelUpdates:v12 withBucketCount:v6];

  long long v15 = +[NSNumber numberWithUnsignedLongLong:v10];
  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __103__SoundActionsPracticeAudioManager_registerListener_forAudioLevelUpdates_forDetection_withBucketCount___block_invoke;
  block[3] = &unk_208F00;
  id v20 = v15;
  id v21 = v11;
  block[4] = self;
  id v17 = v15;
  id v18 = v11;
  dispatch_async((dispatch_queue_t)handlerQueue, block);
}

void __103__SoundActionsPracticeAudioManager_registerListener_forAudioLevelUpdates_forDetection_withBucketCount___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = [*(id *)(a1 + 48) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

- (void)deregisterListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogSoundActions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "Deregister audio listener: %@", buf, 0xCu);
  }

  uint64_t v6 = +[AXSDAudioLevelsHelper sharedInstance];
  [v6 deregisterListener:v4];

  BOOL v7 = +[NSNumber numberWithUnsignedLongLong:v4];
  handlerQueue = self->_handlerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __55__SoundActionsPracticeAudioManager_deregisterListener___block_invoke;
  v10[3] = &unk_208948;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)handlerQueue, v10);
}

id __55__SoundActionsPracticeAudioManager_deregisterListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_detectionHandlers, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

- (void)_handleAccessibilityEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Received unknown Vocie Trigger event: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleAccessibilityEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Received event: %@", (uint8_t *)&v2, 0xCu);
}

- (void)playURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to configure audio session: %@", (uint8_t *)&v2, 0xCu);
}

@end