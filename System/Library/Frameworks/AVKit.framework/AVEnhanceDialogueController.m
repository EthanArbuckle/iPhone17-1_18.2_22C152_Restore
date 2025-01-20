@interface AVEnhanceDialogueController
+ (id)queue;
- (AVEnhanceDialogueController)init;
- (AVObservationController)observationController;
- (AVPlayerController)playerController;
- (BOOL)currentContentSupported;
- (BOOL)enabled;
- (BOOL)isCurrentAudioRouteSupported;
- (NSArray)availableLevels;
- (NSString)cachedAudioSessionMode;
- (int64_t)currentLevel;
- (void)_updateActuallyEnabledStateIfNeeded;
- (void)_updateCurrentAudioRouteSupported;
- (void)dealloc;
- (void)setCachedAudioSessionMode:(id)a3;
- (void)setCurrentAudioRouteSupported:(BOOL)a3;
- (void)setCurrentLevel:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setObservationController:(id)a3;
- (void)setPlayerController:(id)a3;
@end

@implementation AVEnhanceDialogueController

void __49__AVEnhanceDialogueController__startObservations__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __36__AVEnhanceDialogueController_queue__block_invoke()
{
  queue_queue = (uint64_t)dispatch_queue_create("com.apple.AVKit.EnhanceDialogue", 0);

  return MEMORY[0x1F41817F8]();
}

- (AVEnhanceDialogueController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVEnhanceDialogueController;
  v2 = [(AVEnhanceDialogueController *)&v6 init];
  if (v2)
  {
    v3 = [[AVObservationController alloc] initWithOwner:v2];
    observationController = v2->_observationController;
    v2->_observationController = v3;

    [(AVEnhanceDialogueController *)v2 setCurrentAudioRouteSupported:0];
    [(AVEnhanceDialogueController *)v2 setCachedAudioSessionMode:*MEMORY[0x1E4F15050]];
  }
  return v2;
}

- (void)setCachedAudioSessionMode:(id)a3
{
}

void __60__AVEnhanceDialogueController__updateCachedAudioSessionMode__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Current audio session mode: %@", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained setCachedAudioSessionMode:*(void *)(a1 + 32)];
  }
}

void __60__AVEnhanceDialogueController__updateCachedAudioSessionMode__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = [MEMORY[0x1E4F153E0] sharedInstance];
    uint64_t v4 = [v3 mode];

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__AVEnhanceDialogueController__updateCachedAudioSessionMode__block_invoke_2;
    v5[3] = &unk_1E5FC4180;
    objc_copyWeak(&v6, v1);
    v5[4] = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVEnhanceDialogueController _updateActuallyEnabledStateIfNeeded](self);
    -[AVEnhanceDialogueController _updateCurrentAudioRouteSupported](self);
  }
}

void __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = +[AVKitGlobalSettings shared];
    int v4 = [v3 enhanceDialogueEnabled];

    if (v4)
    {
      id v30 = 0;
      int v5 = [MEMORY[0x1E4F15340] currentRouteSupportsEnhanceDialogue:&v30];
      id v6 = v30;
      if (v6)
      {
        uint64_t v7 = _AVLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v18 = [v6 localizedDescription];
          uint64_t v19 = [v18 cStringUsingEncoding:4];
          *(_DWORD *)buf = 136315138;
          uint64_t v33 = v19;
          _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Unable to check audio route for Enhance Dialogue support: %s", buf, 0xCu);
        }
      }
      if (v5)
      {
        v8 = [WeakRetained playerController];
        v9 = [v8 player];
        v10 = [v9 audioSession];
        v11 = [v10 routingContextUID];
        v12 = [MEMORY[0x1E4F165D0] outputContextForID:v11];
        v13 = v12;
        if (v12)
        {
          v22 = v10;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v14 = [v12 outputDevices];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v15)
          {
            v20 = v9;
            v21 = v8;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v14);
                }
                if ([*(id *)(*((void *)&v26 + 1) + 8 * i) deviceType])
                {
                  LODWORD(v15) = 1;
                  goto LABEL_20;
                }
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
              if (v15) {
                continue;
              }
              break;
            }
LABEL_20:
            v9 = v20;
            v8 = v21;
          }

          v10 = v22;
        }
        else
        {
          LODWORD(v15) = 0;
        }
      }
      else
      {
        LODWORD(v15) = 0;
      }

      if (v15) {
        LOBYTE(v4) = v5;
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke_42;
    block[3] = &unk_1E5FC46C0;
    objc_copyWeak(&v24, v1);
    char v25 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v24);
  }
}

- (void)_updateActuallyEnabledStateIfNeeded
{
  if (a1)
  {
    int v2 = [a1 enabled];
    v3 = [a1 playerController];
    int v4 = [v3 hasEnabledAudio];

    int v5 = [a1 cachedAudioSessionMode];
    id v6 = (void *)*MEMORY[0x1E4F15060];

    uint64_t v7 = [a1 playerController];
    [v7 rate];
    double v9 = v8;

    BOOL v11 = v9 > 0.0 && v5 == v6;
    if (!v4) {
      BOOL v11 = 0;
    }
    if (v2) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
    v13 = +[AVEnhanceDialogueOptInManager sharedInstance];
    int v14 = [v13 isEnhanceDialogueControllerOptedIn:a1];

    if (!v12 || (v14 & 1) != 0)
    {
      if ((v12 | v14 ^ 1)) {
        return;
      }
      id v15 = +[AVEnhanceDialogueOptInManager sharedInstance];
      [v15 optOutEnhanceDialogueController:a1];
    }
    else
    {
      id v15 = +[AVEnhanceDialogueOptInManager sharedInstance];
      [v15 optInEnhanceDialogueController:a1];
    }
  }
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (NSString)cachedAudioSessionMode
{
  return self->_cachedAudioSessionMode;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setPlayerController:(id)a3
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  int v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    BOOL v12 = v5;
    [(AVObservationController *)self->_observationController stopAllObservation];
    objc_storeStrong((id *)&self->_playerController, a3);
    *(void *)buf = @"playerController.currentAssetIfReady";
    uint64_t v15 = @"playerController.rate";
    uint64_t v16 = (void (*)(uint64_t))@"cachedAudioSessionMode";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];
    uint64_t v7 = [(AVEnhanceDialogueController *)self observationController];
    id v8 = (id)[v7 startObserving:self keyPaths:v6 includeInitialValue:1 observationHandler:&__block_literal_global_30];
    [v7 startObservingNotificationForName:*MEMORY[0x1E4F15F08] object:0 notificationCenter:0 observationHandler:&__block_literal_global_33];
    [v7 startObservingNotificationForName:*MEMORY[0x1E4F15F10] object:0 notificationCenter:0 observationHandler:&__block_literal_global_35];
    id v9 = (id)[v7 startObserving:self keyPath:@"mode" includeInitialValue:0 observationHandler:&__block_literal_global_40];

    -[AVEnhanceDialogueController _updateActuallyEnabledStateIfNeeded](self);
    -[AVEnhanceDialogueController _updateCurrentAudioRouteSupported](self);
    v10 = _AVLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "Checking current audio session mode.", buf, 2u);
    }

    objc_initWeak(&location, self);
    BOOL v11 = +[AVEnhanceDialogueController queue];
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __60__AVEnhanceDialogueController__updateCachedAudioSessionMode__block_invoke;
    v17 = &unk_1E5FC44F8;
    objc_copyWeak(v18, &location);
    dispatch_async(v11, buf);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
    int v5 = v12;
  }
}

- (void)_updateCurrentAudioRouteSupported
{
  if (a1)
  {
    int v2 = _AVLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "Checking Enhance Dialogue support for current audio route.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, a1);
    v3 = +[AVEnhanceDialogueController queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v5, buf);
    dispatch_async(v3, block);

    objc_destroyWeak(&v5);
    objc_destroyWeak(buf);
  }
}

+ (id)queue
{
  if (queue_onceToken != -1) {
    dispatch_once(&queue_onceToken, &__block_literal_global_18997);
  }
  int v2 = (void *)queue_queue;

  return v2;
}

void __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke_42(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        int v4 = @"YES";
      }
      else {
        int v4 = @"NO";
      }
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Enhance Dialogue support for current audio route: %@", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained setCurrentAudioRouteSupported:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)setCurrentAudioRouteSupported:(BOOL)a3
{
  self->_currentAudioRouteSupported = a3;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAudioSessionMode, 0);
  objc_storeStrong((id *)&self->_observationController, 0);

  objc_storeStrong((id *)&self->_playerController, 0);
}

- (BOOL)isCurrentAudioRouteSupported
{
  return self->_currentAudioRouteSupported;
}

- (void)setObservationController:(id)a3
{
}

- (NSArray)availableLevels
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = +[AVKitGlobalSettings shared];
  if ([v4 enhanceDialogueEnabled])
  {
    BOOL v5 = [(AVEnhanceDialogueController *)self isCurrentAudioRouteSupported];

    if (v5)
    {
      if (_AXSExtendedVoiceIsolationMediaModesEnabled()) {
        [v3 addObject:&unk_1F094A130];
      }
      [v3 addObject:&unk_1F094A148];
      [v3 addObject:&unk_1F094A160];
      [v3 addObject:&unk_1F094A178];
    }
  }
  else
  {
  }
  id v6 = (void *)[v3 copy];

  return (NSArray *)v6;
}

- (void)setCurrentLevel:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = +[AVKitGlobalSettings shared];
  int v5 = [v4 enhanceDialogueEnabled];

  if (v5)
  {
    if (a3 == 3)
    {
      if (!_AXSExtendedVoiceIsolationMediaModesEnabled())
      {
        id v6 = _AVLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "Attempting to set Enhance Dialogue to FullIsolation when Extended Voice Isolation is disabled.", buf, 2u);
        }
      }
      self;
      a3 = 3;
    }
    else
    {
      self;
      if ((unint64_t)a3 >= 4)
      {
        uint64_t v7 = _AVLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          int64_t v15 = a3;
          _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Unknown AVEnhanceDialogueLevel: %ld", buf, 0xCu);
        }

        a3 = 0;
      }
    }
    id v13 = 0;
    char v8 = [MEMORY[0x1E4F15340] setEnhanceDialogueLevel:a3 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0)
    {
      v10 = _AVLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v9 localizedDescription];
        uint64_t v12 = [v11 cStringUsingEncoding:4];
        *(_DWORD *)buf = 136315138;
        int64_t v15 = v12;
        _os_log_error_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_ERROR, "Unable to set Enhance Dialogue level: %s", buf, 0xCu);
      }
    }
  }
}

- (int64_t)currentLevel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v15 = 0;
  v3 = +[AVKitGlobalSettings shared];
  if (![v3 enhanceDialogueEnabled]
    || ![(AVEnhanceDialogueController *)self isCurrentAudioRouteSupported])
  {

    goto LABEL_18;
  }
  BOOL v4 = [(AVEnhanceDialogueController *)self currentContentSupported];

  if (!v4)
  {
LABEL_18:
    self;
    return 0;
  }
  id v14 = 0;
  char v5 = [MEMORY[0x1E4F15340] getEnhanceDialogueLevel:&v15 error:&v14];
  id v6 = v14;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v6 localizedDescription];
      uint64_t v13 = [v12 cStringUsingEncoding:4];
      *(_DWORD *)buf = 136315138;
      unint64_t v17 = v13;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Unable to get Enhance Dialogue level: %s", buf, 0xCu);
    }
  }
  if (v15 == 3 && !_AXSExtendedVoiceIsolationMediaModesEnabled())
  {
    char v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "Enhance Dialogue level was reported to be FullyIsolate but Extended Voice Isolation is disabled.", buf, 2u);
    }
  }
  unint64_t v9 = v15;
  self;
  if (v9 >= 4)
  {
    v10 = _AVLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = v9;
      _os_log_error_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_ERROR, "Unknown AVAudioApplicationEnhanceDialogueLevel: %ld", buf, 0xCu);
    }

    return 0;
  }
  return v9;
}

- (BOOL)currentContentSupported
{
  v3 = +[AVKitGlobalSettings shared];
  int v4 = [v3 enhanceDialogueEnabled];

  if (!v4) {
    return 0;
  }
  char v5 = [(AVEnhanceDialogueController *)self playerController];
  char v6 = [v5 hasEnabledAudio];

  uint64_t v7 = [(AVEnhanceDialogueController *)self cachedAudioSessionMode];
  char v8 = (void *)*MEMORY[0x1E4F15060];

  if (v7 == v8) {
    return v6;
  }
  else {
    return 0;
  }
}

void __49__AVEnhanceDialogueController__startObservations__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = [a4 value];
  [v5 setCachedAudioSessionMode:v6];
}

void __49__AVEnhanceDialogueController__startObservations__block_invoke_3(uint64_t a1, void *a2)
{
}

void __49__AVEnhanceDialogueController__startObservations__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)dealloc
{
  v3 = [(AVEnhanceDialogueController *)self observationController];
  [v3 stopAllObservation];

  int v4 = +[AVEnhanceDialogueOptInManager sharedInstance];
  int v5 = [v4 isEnhanceDialogueControllerOptedIn:self];

  if (v5)
  {
    id v6 = +[AVEnhanceDialogueOptInManager sharedInstance];
    [v6 optOutEnhanceDialogueController:self];
  }
  v7.receiver = self;
  v7.super_class = (Class)AVEnhanceDialogueController;
  [(AVEnhanceDialogueController *)&v7 dealloc];
}

@end