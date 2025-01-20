@interface AVSecondScreenConnection
- (AVDisplayCriteria)preferredDisplayCriteria;
- (AVObservationController)observationController;
- (AVPlayer)debugInfoPlayer;
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (AVSecondScreen)connectedSecondScreen;
- (AVSecondScreenConnection)initWithPlayer:(id)a3 playerLayer:(id)a4;
- (AVSecondScreenDebugAssistant)debugAssistant;
- (AVSecondScreenViewController)secondScreenViewController;
- (BOOL)_allowsNonAirPlayExternalPlayback;
- (BOOL)_currentItemIsReadyToPlayVideoOrLoadingWhileActive;
- (BOOL)_determineIsReadyToConnect;
- (BOOL)isActive;
- (BOOL)isPlaying;
- (BOOL)isReady;
- (BOOL)isReadyToConnect;
- (BOOL)requiresTVOutScreen;
- (CGSize)maximumVideoResolution;
- (CGSize)videoDisplaySize;
- (UIView)contentView;
- (UIViewController)contentViewController;
- (double)videoDisplayScale;
- (void)_loadSecondScreenViewControllerIfNeeded;
- (void)_postNotification:(id)a3 oldValue:(id)a4 newValue:(id)a5;
- (void)_startObservingPlayer;
- (void)_updatePreferredDisplayCriteria;
- (void)_updatePreferredDisplayCriteriaFromPreparedAssetIfNeeded:(id)a3;
- (void)_updateReadyToConnect;
- (void)connectWithScreen:(id)a3 active:(BOOL)a4;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setConnectedSecondScreen:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDebugInfoPlayer:(id)a3;
- (void)setMaximumVideoResolution:(CGSize)a3;
- (void)setObservationController:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setPreferredDisplayCriteria:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)setReadyToConnect:(BOOL)a3;
- (void)setRequiresTVOutScreen:(BOOL)a3;
- (void)setSecondScreenViewController:(id)a3;
@end

@implementation AVSecondScreenConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondScreenViewController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_debugInfoPlayer, 0);
  objc_storeStrong((id *)&self->_preferredDisplayCriteria, 0);
  objc_destroyWeak((id *)&self->_connectedSecondScreen);
  objc_destroyWeak((id *)&self->_playerLayer);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_debugAssistant, 0);
}

- (void)setSecondScreenViewController:(id)a3
{
}

- (AVSecondScreenViewController)secondScreenViewController
{
  return self->_secondScreenViewController;
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setObservationController:(id)a3
{
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setMaximumVideoResolution:(CGSize)a3
{
  self->_maximumVideoResolution = a3;
}

- (CGSize)maximumVideoResolution
{
  double width = self->_maximumVideoResolution.width;
  double height = self->_maximumVideoResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDebugInfoPlayer:(id)a3
{
}

- (AVPlayer)debugInfoPlayer
{
  return self->_debugInfoPlayer;
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  return self->_preferredDisplayCriteria;
}

- (void)setRequiresTVOutScreen:(BOOL)a3
{
  self->_requiresTVOutScreen = a3;
}

- (BOOL)requiresTVOutScreen
{
  return self->_requiresTVOutScreen;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setConnectedSecondScreen:(id)a3
{
}

- (AVSecondScreen)connectedSecondScreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectedSecondScreen);

  return (AVSecondScreen *)WeakRetained;
}

- (BOOL)isReadyToConnect
{
  return self->_readyToConnect;
}

- (AVPlayerLayer)playerLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerLayer);

  return (AVPlayerLayer *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (BOOL)_currentItemIsReadyToPlayVideoOrLoadingWhileActive
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(AVSecondScreenConnection *)self player];
  v4 = [v3 currentItem];

  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = [v4 status];
  if (v5 == 2) {
    goto LABEL_6;
  }
  if (v5 == 1)
  {
    if (![(AVSecondScreenConnection *)self isActive])
    {
      if (([v4 hasVideo] & 1) == 0)
      {
LABEL_6:
        BOOL v6 = 0;
        goto LABEL_10;
      }
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 1;
    goto LABEL_10;
  }
  if ([(AVSecondScreenConnection *)self isActive]) {
    goto LABEL_8;
  }
LABEL_9:
  v7 = [(AVSecondScreenConnection *)self preferredDisplayCriteria];
  BOOL v6 = v7 != 0;

LABEL_10:
  v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "NO";
    int v11 = 136315650;
    v12 = "-[AVSecondScreenConnection _currentItemIsReadyToPlayVideoOrLoadingWhileActive]";
    v14 = "isReadyToPlayOrLoadingWhileActive";
    __int16 v13 = 2080;
    if (v6) {
      v9 = "YES";
    }
    __int16 v15 = 2080;
    v16 = v9;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v11, 0x20u);
  }

  return v6;
}

- (BOOL)_allowsNonAirPlayExternalPlayback
{
  v3 = [(AVSecondScreenConnection *)self player];
  BOOL v4 = v3 == 0;

  uint64_t v5 = [(AVSecondScreenConnection *)self player];
  BOOL v6 = v5;
  if (v5)
  {
    if ([v5 allowsExternalPlayback]
      && [v6 usesExternalPlaybackWhileExternalScreenIsActive])
    {
      if ([v6 isExternalPlaybackActive]) {
        BOOL v4 = [v6 externalPlaybackType] != 1;
      }
      else {
        BOOL v4 = 1;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_determineIsReadyToConnect
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(AVSecondScreenConnection *)self player];
  if (!v3)
  {
    BOOL v6 = [(AVSecondScreenConnection *)self contentView];
    if (v6)
    {
      BOOL v5 = 1;
      goto LABEL_10;
    }
  }
  BOOL v4 = [(AVSecondScreenConnection *)self player];
  BOOL v5 = v4
    && [(AVSecondScreenConnection *)self _allowsNonAirPlayExternalPlayback]
    && [(AVSecondScreenConnection *)self _currentItemIsReadyToPlayVideoOrLoadingWhileActive];

  if (!v3)
  {
    BOOL v6 = 0;
LABEL_10:
  }
  v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    int v10 = 136315650;
    int v11 = "-[AVSecondScreenConnection _determineIsReadyToConnect]";
    __int16 v13 = "readyToConnect";
    __int16 v12 = 2080;
    if (v5) {
      v8 = "YES";
    }
    __int16 v14 = 2080;
    __int16 v15 = v8;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v10, 0x20u);
  }

  return v5;
}

- (void)_updateReadyToConnect
{
  BOOL v3 = [(AVSecondScreenConnection *)self _determineIsReadyToConnect];

  [(AVSecondScreenConnection *)self setReadyToConnect:v3];
}

- (void)_updatePreferredDisplayCriteriaFromPreparedAssetIfNeeded:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(AVSecondScreenConnection *)self player];

  BOOL v5 = v11;
  if (v4)
  {
    if ([v11 statusOfValueForKey:@"preferredDisplayCriteria" error:0] != 2
      || ([v11 preferredDisplayCriteria], (BOOL v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F16500]) initWithRefreshRate:0 videoDynamicRange:0.0];
    }
    v7 = [(AVSecondScreenConnection *)self player];
    v8 = [v7 currentItem];
    v9 = [v8 asset];
    int v10 = [v11 isEqual:v9];

    if (v10) {
      [(AVSecondScreenConnection *)self setPreferredDisplayCriteria:v6];
    }

    BOOL v5 = v11;
  }
}

- (void)_updatePreferredDisplayCriteria
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVSecondScreenConnection *)self player];
  BOOL v4 = [v3 currentItem];
  BOOL v5 = [v4 asset];

  if (v5)
  {
    v9[0] = @"availableVideoDynamicRanges";
    v9[1] = @"preferredDisplayCriteria";
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke;
    v7[3] = &unk_1E5FC3D18;
    v7[4] = self;
    id v8 = v5;
    [v8 loadValuesAsynchronouslyForKeys:v6 completionHandler:v7];
  }
  else
  {
    [(AVSecondScreenConnection *)self setPreferredDisplayCriteria:0];
  }
}

void __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _updatePreferredDisplayCriteriaFromPreparedAssetIfNeeded:v3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke_2;
    v5[3] = &unk_1E5FC3D18;
    BOOL v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __59__AVSecondScreenConnection__updatePreferredDisplayCriteria__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreferredDisplayCriteriaFromPreparedAssetIfNeeded:*(void *)(a1 + 40)];
}

- (void)_startObservingPlayer
{
  v16[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVSecondScreenConnection *)self player];

  if (v3)
  {
    BOOL v4 = [[AVObservationController alloc] initWithOwner:self];
    observationController = self->_observationController;
    self->_observationController = v4;

    v16[0] = @"allowsExternalPlayback";
    v16[1] = @"externalPlaybackActive";
    v16[2] = @"airPlayVideoActive";
    v16[3] = @"currentItem.status";
    v16[4] = @"currentItem.hasVideo";
    v16[5] = @"usesExternalPlaybackWhileExternalScreenIsActive";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
    v7 = [(AVSecondScreenConnection *)self observationController];
    id v8 = [(AVSecondScreenConnection *)self player];
    id v9 = (id)[v7 startObserving:v8 keyPaths:v6 observationHandler:&__block_literal_global_19214];

    int v10 = [(AVSecondScreenConnection *)self observationController];
    id v11 = [(AVSecondScreenConnection *)self player];
    id v12 = (id)[v10 startObserving:v11 keyPath:@"timeControlStatus" observationHandler:&__block_literal_global_45_19216];

    __int16 v13 = [(AVSecondScreenConnection *)self observationController];
    __int16 v14 = [(AVSecondScreenConnection *)self player];
    id v15 = (id)[v13 startObserving:v14 keyPath:@"currentItem.asset" observationHandler:&__block_literal_global_50_19218];

    [(AVSecondScreenConnection *)self _updatePreferredDisplayCriteria];
  }
}

uint64_t __49__AVSecondScreenConnection__startObservingPlayer__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _updatePreferredDisplayCriteria];
}

void __49__AVSecondScreenConnection__startObservingPlayer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 player];
  objc_msgSend(v2, "setPlaying:", objc_msgSend(v3, "timeControlStatus") == 2);
}

uint64_t __49__AVSecondScreenConnection__startObservingPlayer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateReadyToConnect];
}

- (void)_postNotification:(id)a3 oldValue:(id)a4 newValue:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ -> %@", (uint8_t *)&v13, 0x20u);
  }

  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:v8 object:self];
}

- (void)_loadSecondScreenViewControllerIfNeeded
{
  id v3 = [(AVSecondScreenConnection *)self secondScreenViewController];

  if (!v3)
  {
    BOOL v4 = objc_alloc_init(AVSecondScreenViewController);
    [(AVSecondScreenConnection *)self setSecondScreenViewController:v4];

    id v6 = [(AVSecondScreenConnection *)self secondScreenViewController];
    BOOL v5 = [(AVSecondScreenConnection *)self connectedSecondScreen];
    [v5 sceneBounds];
    objc_msgSend(v6, "setInitialScreenBoundsHint:");
  }
}

- (double)videoDisplayScale
{
  if (![(AVSecondScreenConnection *)self isActive]) {
    return 0.0;
  }
  id v3 = [(AVSecondScreenConnection *)self secondScreenViewController];
  BOOL v4 = [v3 traitCollection];
  [v4 displayScale];
  double v6 = v5;

  return v6;
}

- (CGSize)videoDisplaySize
{
  if ([(AVSecondScreenConnection *)self isActive])
  {
    id v3 = [(AVSecondScreenConnection *)self secondScreenViewController];
    [v3 videoDisplaySize];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)connectWithScreen:(id)a3 active:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    -[AVSecondScreenConnection setConnectedSecondScreen:](self, "setConnectedSecondScreen:");
    [(AVSecondScreenConnection *)self setActive:v5];
  }
  else
  {
    -[AVSecondScreenConnection setActive:](self, "setActive:", 0, a4);
    [(AVSecondScreenConnection *)self setConnectedSecondScreen:0];
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    BOOL v3 = a3;
    self->_playing = a3;
    id v6 = [NSNumber numberWithInt:!a3];
    BOOL v5 = [NSNumber numberWithBool:v3];
    [(AVSecondScreenConnection *)self _postNotification:@"AVSecondScreenConnectionPlayingDidChangeNotification" oldValue:v6 newValue:v5];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    BOOL v5 = [NSNumber numberWithInt:!a3];
    id v6 = [NSNumber numberWithBool:v3];
    [(AVSecondScreenConnection *)self _postNotification:@"AVSecondScreenConnectionActiveDidChangeNotification" oldValue:v5 newValue:v6];

    [(AVSecondScreenConnection *)self _updateReadyToConnect];
    if ([(AVSecondScreenConnection *)self isActive])
    {
      [(AVSecondScreenConnection *)self _loadSecondScreenViewControllerIfNeeded];
      double v7 = [(AVSecondScreenConnection *)self secondScreenViewController];
      double v8 = [(AVSecondScreenConnection *)self contentView];
      [v7 setContentView:v8];

      double v9 = [(AVSecondScreenConnection *)self secondScreenViewController];
      id v10 = [(AVSecondScreenConnection *)self playerLayer];
      [v9 setSourcePlayerLayer:v10];

      id v11 = [(AVSecondScreenConnection *)self debugAssistant];
      id v12 = [(AVSecondScreenConnection *)self secondScreenViewController];
      [v11 setSecondScreenViewController:v12];

      id v17 = [(AVSecondScreenConnection *)self secondScreenViewController];
      [v17 setPlayingOnSecondScreen:1];
    }
    else
    {
      int v13 = [(AVSecondScreenConnection *)self debugAssistant];
      [v13 setSecondScreenViewController:0];

      id v14 = [(AVSecondScreenConnection *)self secondScreenViewController];
      [v14 setPlayingOnSecondScreen:0];

      __int16 v15 = [(AVSecondScreenConnection *)self secondScreenViewController];
      [v15 setSourcePlayerLayer:0];

      id v16 = [(AVSecondScreenConnection *)self secondScreenViewController];
      [v16 setContentView:0];

      [(AVSecondScreenConnection *)self setSecondScreenViewController:0];
    }
  }
}

- (void)setReadyToConnect:(BOOL)a3
{
  if (self->_readyToConnect != a3)
  {
    BOOL v3 = a3;
    self->_readyToConnect = a3;
    id v6 = [NSNumber numberWithInt:!a3];
    BOOL v5 = [NSNumber numberWithBool:v3];
    [(AVSecondScreenConnection *)self _postNotification:@"AVSecondScreenConnectionReadyDidChangeNotification" oldValue:v6 newValue:v5];
  }
}

- (void)setPreferredDisplayCriteria:(id)a3
{
  id v10 = (AVDisplayCriteria *)a3;
  uint64_t v4 = [(AVDisplayCriteria *)self->_preferredDisplayCriteria isEqual:v10];
  BOOL v5 = v10;
  if ((v4 & 1) == 0)
  {
    preferredDisplayCriteria = self->_preferredDisplayCriteria;
    if (preferredDisplayCriteria != v10)
    {
      double v7 = v10;
      double v8 = self->_preferredDisplayCriteria;
      self->_preferredDisplayCriteria = v7;
      double v9 = preferredDisplayCriteria;

      [(AVSecondScreenConnection *)self _postNotification:@"AVSecondScreenConnectionPreferredDisplayCriteriaDidChangeNotification" oldValue:v9 newValue:v7];
      uint64_t v4 = [(AVSecondScreenConnection *)self _updateReadyToConnect];
      BOOL v5 = v10;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setPlayerLayer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerLayer);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_playerLayer);
    objc_storeWeak((id *)&self->_playerLayer, v4);
    double v7 = [(AVSecondScreenConnection *)self secondScreenViewController];
    [v7 setSourcePlayerLayer:v4];

    double v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      id v10 = "-[AVSecondScreenConnection setPlayerLayer:]";
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ -> %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (AVSecondScreenDebugAssistant)debugAssistant
{
  if (!self->_debugAssistant)
  {
    if (AVSecondScreenDebugHUDEnabled_onceToken != -1) {
      dispatch_once(&AVSecondScreenDebugHUDEnabled_onceToken, &__block_literal_global_131);
    }
    if (AVSecondScreenDebugHUDEnabled__Enabled)
    {
      BOOL v3 = objc_alloc_init(AVSecondScreenDebugAssistant);
      debugAssistant = self->_debugAssistant;
      self->_debugAssistant = v3;

      BOOL v5 = [(AVSecondScreenConnection *)self player];

      if (v5)
      {
        id v6 = self->_debugAssistant;
        uint64_t v7 = [(AVSecondScreenConnection *)self player];
      }
      else
      {
        double v8 = [(AVSecondScreenConnection *)self debugInfoPlayer];

        if (!v8)
        {
LABEL_10:
          id v10 = self->_debugAssistant;
          __int16 v11 = [(AVSecondScreenConnection *)self secondScreenViewController];
          [(AVSecondScreenDebugAssistant *)v10 setSecondScreenViewController:v11];

          goto LABEL_11;
        }
        id v6 = self->_debugAssistant;
        uint64_t v7 = [(AVSecondScreenConnection *)self debugInfoPlayer];
      }
      int v9 = (void *)v7;
      [(AVSecondScreenDebugAssistant *)v6 setPlayer:v7];

      goto LABEL_10;
    }
  }
LABEL_11:
  id v12 = self->_debugAssistant;

  return v12;
}

- (UIViewController)contentViewController
{
  [(AVSecondScreenConnection *)self _loadSecondScreenViewControllerIfNeeded];

  return (UIViewController *)[(AVSecondScreenConnection *)self secondScreenViewController];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(AVObservationController *)self->_observationController stopAllObservation];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[AVSecondScreenConnection dealloc]";
    __int16 v7 = 1024;
    int v8 = 77;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSecondScreenConnection;
  [(AVSecondScreenConnection *)&v4 dealloc];
}

- (AVSecondScreenConnection)initWithPlayer:(id)a3 playerLayer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(AVSecondScreenConnection *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_player, a3);
    objc_storeWeak((id *)&v10->_playerLayer, v8);
    v10->_requiresTVOutScreen = 1;
    v10->_readyToConnect = [(AVSecondScreenConnection *)v10 _determineIsReadyToConnect];
    __int16 v11 = [(AVSecondScreenConnection *)v10 player];
    v10->_playing = [v11 timeControlStatus] == 2;
  }
  return v10;
}

@end