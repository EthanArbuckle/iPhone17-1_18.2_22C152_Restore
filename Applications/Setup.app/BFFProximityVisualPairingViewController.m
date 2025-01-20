@interface BFFProximityVisualPairingViewController
- (AVPlayer)videoPlayer;
- (AVPlayerViewController)videoViewController;
- (BOOL)_isLightMode;
- (BOOL)_isPlaying;
- (VPPresenterView)visualPairingView;
- (id)_createAVPlayerItem;
- (id)_maskContainerView;
- (int64_t)retryAttempts;
- (void)_addCloudPlayerView;
- (void)_addMaskViewIfNeeded;
- (void)_addVisualPairingCodeView;
- (void)_cleanUpAllNotifications;
- (void)_cleanUpAppLifecycleNotifications;
- (void)_cleanUpPlayerItemNotifications;
- (void)_cleanUpVideoPlayerNotificationsIfNeeded;
- (void)_createAndAttachAVPlayer;
- (void)_hidePairingCode;
- (void)_observeAppLifecycleNotifications;
- (void)_pausePlayer;
- (void)_performPairingDidSucceedAnimation:(id)a3;
- (void)_prepareForPresentation;
- (void)_resetPlayer;
- (void)_resumePlayer;
- (void)_setupAVPlayer;
- (void)_setupVideoPlayerObservationIfNeeded;
- (void)_setupViews;
- (void)_showPairingCode:(BOOL)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pairingDidComplete:(id)a3;
- (void)setPairingCode:(id)a3;
- (void)setRetryAttempts:(int64_t)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setVideoViewController:(id)a3;
- (void)setVisualPairingView:(id)a3;
- (void)start;
- (void)stop;
- (void)videoReachedEnd:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willResignActive:(id)a3;
@end

@implementation BFFProximityVisualPairingViewController

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(BFFProximityVisualPairingViewController *)self _cleanUpAllNotifications];
  v2.receiver = v4;
  v2.super_class = (Class)BFFProximityVisualPairingViewController;
  [(BFFProximityVisualPairingViewController *)&v2 dealloc];
}

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BFFProximityVisualPairingViewController;
  [(BFFProximityVisualPairingViewController *)&v3 viewDidLoad];
  [(BFFProximityVisualPairingViewController *)v5 _setupViews];
  [(BFFProximityVisualPairingViewController *)v5 _setupAVPlayer];
  id v2 = [(BFFProximityVisualPairingViewController *)v5 view];
  [v2 setClipsToBounds:0];

  if (![(BFFProximityVisualPairingViewController *)v5 _isPlaying])
  {
    [(BFFProximityVisualPairingViewController *)v5 _prepareForPresentation];
    [(BFFProximityVisualPairingViewController *)v5 _observeAppLifecycleNotifications];
    [(BFFProximityVisualPairingViewController *)v5 start];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  [(BFFProximityVisualPairingViewController *)self stop];
  [(BFFProximityVisualPairingViewController *)v6 _hidePairingCode];
  v3.receiver = v6;
  v3.super_class = (Class)BFFProximityVisualPairingViewController;
  [(BFFProximityVisualPairingViewController *)&v3 viewDidDisappear:v4];
}

- (void)viewDidLayoutSubviews
{
  id v2 = [(BFFProximityVisualPairingViewController *)self _maskContainerView];
  [v2 frame];
  double v10 = v3;
  double v9 = v4;
  double v12 = v5;
  double v11 = v6;
  id v7 = [(BFFProximityVisualPairingViewController *)self _maskContainerView];
  id v8 = [v7 maskView];
  [v8 setFrame:v9, v10, v11, v12];
}

- (void)setPairingCode:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  double v4 = [(BFFProximityVisualPairingViewController *)v6 visualPairingView];
  [(VPPresenterView *)v4 setVerificationCode:v3];

  objc_storeStrong(location, 0);
}

- (void)pairingDidComplete:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BFFProximityVisualPairingViewController *)v4 _performPairingDidSucceedAnimation:location[0]];
  objc_storeStrong(location, 0);
}

- (void)start
{
  if ([(BFFProximityVisualPairingViewController *)self _isPlaying])
  {
    [(BFFProximityVisualPairingViewController *)self _showPairingCode:1];
  }
  else
  {
    id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
    char v15 = 0;
    char v13 = 0;
    BOOL v3 = 1;
    if (v2)
    {
      v16 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
      char v15 = 1;
      v14 = [(AVPlayer *)v16 error];
      char v13 = 1;
      BOOL v3 = v14 != 0;
    }
    if (v13) {

    }
    if (v15) {
    if (v3)
    }
      [(BFFProximityVisualPairingViewController *)self _createAndAttachAVPlayer];
    else {
      [(BFFProximityVisualPairingViewController *)self _setupVideoPlayerObservationIfNeeded];
    }
    double v4 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
    double v5 = [(AVPlayer *)v4 currentItem];
    char v11 = 0;
    char v9 = 0;
    char v7 = 0;
    BOOL v6 = 1;
    if (v5)
    {
      double v12 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
      char v11 = 1;
      double v10 = [(AVPlayer *)v12 currentItem];
      char v9 = 1;
      id v8 = [(AVPlayerItem *)v10 error];
      char v7 = 1;
      BOOL v6 = v8 != 0;
    }
    if (v7) {

    }
    if (v9) {
    if (v11)
    }

    if (v6) {
      [(BFFProximityVisualPairingViewController *)self _setupAVPlayer];
    }
    [(BFFProximityVisualPairingViewController *)self _resumePlayer];
  }
}

- (void)stop
{
  [(BFFProximityVisualPairingViewController *)self _cleanUpVideoPlayerNotificationsIfNeeded];
  [(BFFProximityVisualPairingViewController *)self _cleanUpPlayerItemNotifications];
  id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  [(AVPlayer *)v2 replaceCurrentItemWithPlayerItem:0];

  [(BFFProximityVisualPairingViewController *)self _pausePlayer];
}

- (void)_resumePlayer
{
  id v2 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [(VPPresenterView *)v2 start];

  BOOL v3 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  [(AVPlayer *)v3 play];
}

- (void)_pausePlayer
{
  id v2 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [(VPPresenterView *)v2 stop];

  BOOL v3 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  [(AVPlayer *)v3 pause];
}

- (void)_resetPlayer
{
  char v11 = self;
  location[1] = (id)a2;
  [(BFFProximityVisualPairingViewController *)self _hidePairingCode];
  [(BFFProximityVisualPairingViewController *)v11 stop];
  objc_initWeak(location, v11);
  dispatch_time_t v2 = dispatch_time(0, 250000000);
  BOOL v3 = &_dispatch_main_q;
  double v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_100172370;
  id v8 = &unk_1002B0CA8;
  objc_copyWeak(&v9, location);
  dispatch_after(v2, (dispatch_queue_t)v3, &v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

- (void)_prepareForPresentation
{
}

- (void)_showPairingCode:(BOOL)a3
{
  v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  BOOL v3 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [(VPPresenterView *)v3 alpha];
  double v5 = v4;

  if (v5 == 0.0)
  {
    int v6 = [(BFFProximityVisualPairingViewController *)v22 visualPairingView];
    CGAffineTransformMakeScale(&v19, 0.5, 0.5);
    [(VPPresenterView *)v6 setTransform:&v19];

    char v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_10017267C;
    v17 = &unk_1002B0D20;
    v18 = v22;
    +[UIView animateWithDuration:0x20000 delay:&v13 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.2 animations:0.8 completion:10.0];
    char v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    double v10 = sub_100172710;
    char v11 = &unk_1002B0D20;
    double v12 = v22;
    +[UIView animateWithDuration:24 delay:&v7 options:0 animations:2.85 completion:0.0];
    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong((id *)&v18, 0);
  }
}

- (void)_hidePairingCode
{
  dispatch_time_t v2 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [(VPPresenterView *)v2 setAlpha:0.0];
}

- (void)_performPairingDidSucceedAnimation:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(BFFProximityVisualPairingViewController *)v18 videoPlayer];
  LODWORD(v4) = 0.75;
  [(AVPlayer *)v3 setRate:v4];

  char v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  int v14 = sub_10017296C;
  int v15 = &unk_1002B0D20;
  v16 = v18;
  double v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_100172A60;
  int v9 = &unk_1002B2070;
  id v10 = location[0];
  +[UIView animateWithDuration:&v11 animations:&v5 completion:1.25];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)_maskContainerView
{
  return [(BFFProximityVisualPairingViewController *)self visualPairingView];
}

- (void)_setupViews
{
}

- (void)_addVisualPairingCodeView
{
  id v2 = objc_alloc_init((Class)VPPresenterView);
  -[BFFProximityVisualPairingViewController setVisualPairingView:](self, "setVisualPairingView:", v2, a2);

  BOOL v3 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [(VPPresenterView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = +[UIColor _systemBackgroundColor];
  double v5 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [(VPPresenterView *)v5 setBackgroundColor:v4];

  id v6 = [(BFFProximityVisualPairingViewController *)self view];
  int v7 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [v6 addSubview:v7];

  int v8 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  id v9 = [(BFFProximityVisualPairingViewController *)self view];
  [(VPPresenterView *)v8 pinToEdges:v9];
}

- (void)_addMaskViewIfNeeded
{
  id v9 = self;
  location[1] = (id)a2;
  id v2 = [(BFFProximityVisualPairingViewController *)self _maskContainerView];
  id v3 = [v2 maskView];

  if (!v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    double v5 = +[UIImage imageNamed:@"ProximityPairingMask"];
    location[0] = [v4 initWithImage:v5];

    [location[0] setContentMode:1];
    id v6 = [(BFFProximityVisualPairingViewController *)v9 _maskContainerView];
    [v6 setMaskView:location[0]];

    id v7 = [(BFFProximityVisualPairingViewController *)v9 view];
    [v7 setNeedsLayout];

    objc_storeStrong(location, 0);
  }
}

- (void)_addCloudPlayerView
{
  id v2 = objc_alloc_init((Class)AVPlayerViewController);
  -[BFFProximityVisualPairingViewController setVideoViewController:](self, "setVideoViewController:", v2, a2);

  id v3 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  id v4 = [(AVPlayerViewController *)v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  [(AVPlayerViewController *)v5 setUpdatesNowPlayingInfoCenter:0];

  id v6 = +[UIColor _systemBackgroundColor];
  id v7 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  id v8 = [(AVPlayerViewController *)v7 view];
  [v8 setBackgroundColor:v6];

  id v9 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  [(AVPlayerViewController *)v9 setShowsPlaybackControls:0];

  id v10 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  [(AVPlayerViewController *)v10 setAllowsPictureInPicturePlayback:0];

  char v11 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  id v12 = [(AVPlayerViewController *)v11 view];
  [v12 setContentMode:1];

  [(BFFProximityVisualPairingViewController *)self _createAndAttachAVPlayer];
  int v13 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  int v14 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  id v15 = [(AVPlayerViewController *)v14 view];
  [(VPPresenterView *)v13 addSubview:v15];

  v16 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  id v17 = [(AVPlayerViewController *)v16 view];
  v18 = [(BFFProximityVisualPairingViewController *)self visualPairingView];
  [v17 pinToEdges:v18];
}

- (void)_createAndAttachAVPlayer
{
  id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];

  if (v2)
  {
    [(BFFProximityVisualPairingViewController *)self _cleanUpVideoPlayerNotificationsIfNeeded];
    [(BFFProximityVisualPairingViewController *)self setVideoPlayer:0];
  }
  id v3 = [objc_alloc((Class)AVPlayer) initWithPlayerItem:0];
  [(BFFProximityVisualPairingViewController *)self setVideoPlayer:v3];

  id v4 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  [(AVPlayer *)v4 setMuted:1];

  [(BFFProximityVisualPairingViewController *)self _setupVideoPlayerObservationIfNeeded];
  double v5 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  id v6 = [(BFFProximityVisualPairingViewController *)self videoViewController];
  [(AVPlayerViewController *)v6 setPlayer:v5];
}

- (void)_setupAVPlayer
{
  [(BFFProximityVisualPairingViewController *)self _cleanUpPlayerItemNotifications];
  id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  id v3 = [(BFFProximityVisualPairingViewController *)self _createAVPlayerItem];
  [(AVPlayer *)v2 replaceCurrentItemWithPlayerItem:v3];
}

- (id)_createAVPlayerItem
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = +[SASUIProximityCloudPlayerItem configuredPlayerForLightMode:[(BFFProximityVisualPairingViewController *)self _isLightMode]];
  [location[0] addObserver:v6 forKeyPath:@"status" options:0 context:0];
  id v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 addObserver:v6 selector:"videoReachedEnd:" name:AVPlayerItemDidPlayToEndTimeNotification object:location[0]];

  id v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (BOOL)_isPlaying
{
  id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  char v24 = 0;
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  BOOL v3 = 0;
  if (v2)
  {
    v25 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
    char v24 = 1;
    v23 = [(AVPlayer *)v25 error];
    char v22 = 1;
    BOOL v3 = 0;
    if (!v23)
    {
      SEL v21 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
      char v20 = 1;
      CGAffineTransform v19 = [(AVPlayer *)v21 currentItem];
      char v18 = 1;
      BOOL v3 = 0;
      if (v19)
      {
        id v17 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
        char v16 = 1;
        id v15 = [(AVPlayer *)v17 currentItem];
        char v14 = 1;
        int v13 = [(AVPlayerItem *)v15 error];
        char v12 = 1;
        BOOL v3 = 0;
        if (!v13)
        {
          char v11 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
          char v10 = 1;
          id v9 = [(AVPlayer *)v11 currentItem];
          char v8 = 1;
          id v4 = [(AVPlayerItem *)v9 status];
          BOOL v3 = 0;
          if (v4 == (id)1)
          {
            id v7 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
            char v6 = 1;
            BOOL v3 = [(AVPlayer *)v7 timeControlStatus] != AVPlayerTimeControlStatusPaused;
          }
        }
      }
    }
  }
  BOOL v27 = v3;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {
  if (v14)
  }

  if (v16) {
  if (v18)
  }

  if (v20) {
  if (v22)
  }

  if (v24) {
  return v27;
  }
}

- (BOOL)_isLightMode
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = [objc_alloc((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
  char v3 = 1;
  if (_AXSInvertColorsEnabled() || [location[0] modeValue] == (id)2) {
    char v3 = 0;
  }
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v130 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v128 = 0;
  objc_storeStrong(&v128, a4);
  id v127 = 0;
  objc_storeStrong(&v127, a5);
  v126[1] = a6;
  id v9 = (AVPlayerItem *)v128;
  char v10 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
  char v11 = [(AVPlayer *)v10 currentItem];
  BOOL v12 = v9 == v11;
  unsigned __int8 v13 = 0;
  if (v12) {
    unsigned __int8 v13 = [location[0] isEqualToString:@"status"];
  }

  if (v13)
  {
    char v14 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
    v126[0] = [(AVPlayer *)v14 currentItem];

    id v15 = [v126[0] error];
    BOOL v16 = 0;
    if (v15) {
      BOOL v16 = [v126[0] status] == (id)2;
    }

    if (v16)
    {
      if ([(BFFProximityVisualPairingViewController *)v130 retryAttempts] >= 3)
      {
        id v105 = (id)_BYLoggingFacility();
        os_log_type_t v104 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v105, OS_LOG_TYPE_ERROR))
        {
          char v102 = 0;
          char v100 = 0;
          char v98 = 0;
          char v96 = 0;
          char v94 = 0;
          char v92 = 0;
          if (_BYIsInternalInstall())
          {
            CGAffineTransform v19 = (NSString *)[v126[0] error];
            v103 = v19;
            char v102 = 1;
          }
          else
          {
            id v101 = [v126[0] error];
            char v100 = 1;
            if (v101)
            {
              id v99 = [v126[0] error];
              char v98 = 1;
              id v97 = [v99 domain];
              char v96 = 1;
              id v95 = [v126[0] error];
              char v94 = 1;
              CGAffineTransform v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v97, [v95 code]);
              v93 = v19;
              char v92 = 1;
            }
            else
            {
              CGAffineTransform v19 = 0;
            }
          }
          sub_10004BB7C((uint64_t)v133, (uint64_t)v19);
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v105, v104, "Abort proximity animation. Player Item error: %{public}@", v133, 0xCu);
          if (v92) {

          }
          if (v94) {
          if (v96)
          }

          if (v98) {
          if (v100)
          }

          if (v102) {
        }
          }
        objc_storeStrong(&v105, 0);
      }
      else
      {
        id v125 = (id)_BYLoggingFacility();
        os_log_type_t v124 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v125, OS_LOG_TYPE_ERROR))
        {
          char v122 = 0;
          char v120 = 0;
          char v118 = 0;
          char v116 = 0;
          char v114 = 0;
          char v112 = 0;
          if (_BYIsInternalInstall())
          {
            id v17 = (NSString *)[v126[0] error];
            v123 = v17;
            char v122 = 1;
          }
          else
          {
            id v121 = [v126[0] error];
            char v120 = 1;
            if (v121)
            {
              id v119 = [v126[0] error];
              char v118 = 1;
              id v117 = [v119 domain];
              char v116 = 1;
              id v115 = [v126[0] error];
              char v114 = 1;
              id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v117, [v115 code]);
              v113 = v17;
              char v112 = 1;
            }
            else
            {
              id v17 = 0;
            }
          }
          sub_10004BB7C((uint64_t)buf, (uint64_t)v17);
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v125, v124, "PlayerItem failed to play proximity animation. Error: %{public}@", buf, 0xCu);
          if (v112) {

          }
          if (v114) {
          if (v116)
          }

          if (v118) {
          if (v120)
          }

          if (v122) {
        }
          }
        objc_storeStrong(&v125, 0);
        char v18 = &_dispatch_main_q;
        block = _NSConcreteStackBlock;
        int v107 = -1073741824;
        int v108 = 0;
        v109 = sub_100174470;
        v110 = &unk_1002B0D20;
        v111 = v130;
        dispatch_async((dispatch_queue_t)v18, &block);

        objc_storeStrong((id *)&v111, 0);
      }
    }
    else if ([v126[0] status] == (id)1)
    {
      id v91 = (id)_BYLoggingFacility();
      os_log_type_t v90 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_DEFAULT))
      {
        char v20 = v91;
        os_log_type_t v21 = v90;
        sub_10004B24C(v89);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Playing proximity animation", v89, 2u);
      }
      objc_storeStrong(&v91, 0);
      char v22 = &_dispatch_main_q;
      v83 = _NSConcreteStackBlock;
      int v84 = -1073741824;
      int v85 = 0;
      v86 = sub_1001744C0;
      v87 = &unk_1002B0D20;
      v88 = v130;
      dispatch_async((dispatch_queue_t)v22, &v83);

      objc_storeStrong((id *)&v88, 0);
    }
    objc_storeStrong(v126, 0);
  }
  else
  {
    v23 = (AVPlayer *)v128;
    char v24 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
    BOOL v12 = v23 == v24;
    unsigned __int8 v25 = 0;
    if (v12) {
      unsigned __int8 v25 = [location[0] isEqualToString:@"status"];
    }

    if (v25)
    {
      v26 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
      BOOL v27 = [(AVPlayer *)v26 error];
      char v81 = 0;
      BOOL v28 = 1;
      if (!v27)
      {
        v82 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
        char v81 = 1;
        BOOL v28 = (id)[(AVPlayer *)v82 status] == (id)2;
      }
      if (v81) {

      }
      if (v28)
      {
        if ([(BFFProximityVisualPairingViewController *)v130 retryAttempts] >= 3)
        {
          id v52 = (id)_BYLoggingFacility();
          if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR))
          {
            char v50 = 0;
            char v48 = 0;
            char v46 = 0;
            char v44 = 0;
            char v42 = 0;
            char v40 = 0;
            char v38 = 0;
            char v36 = 0;
            char v34 = 0;
            char v32 = 0;
            if (_BYIsInternalInstall())
            {
              v51 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
              char v50 = 1;
              v31 = [(AVPlayer *)v51 error];
              v49 = v31;
              char v48 = 1;
            }
            else
            {
              v47 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
              char v46 = 1;
              v45 = [(AVPlayer *)v47 error];
              char v44 = 1;
              if (v45)
              {
                v43 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
                char v42 = 1;
                v41 = [(AVPlayer *)v43 error];
                char v40 = 1;
                v39 = [(NSError *)v41 domain];
                char v38 = 1;
                v37 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
                char v36 = 1;
                v35 = [(AVPlayer *)v37 error];
                char v34 = 1;
                v31 = +[NSString stringWithFormat:@"<Error domain: %@, code %ld>", v39, [(NSError *)v35 code]];
                v33 = v31;
                char v32 = 1;
              }
              else
              {
                v31 = 0;
              }
            }
            sub_10004BB7C((uint64_t)v131, (uint64_t)v31);
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v52, OS_LOG_TYPE_ERROR, "Abort proximity animation. Video player error: %{public}@", v131, 0xCu);
            if (v32) {

            }
            if (v34) {
            if (v36)
            }

            if (v38) {
            if (v40)
            }

            if (v42) {
            if (v44)
            }

            if (v46) {
            if (v48)
            }

            if (v50) {
          }
            }
          objc_storeStrong(&v52, 0);
        }
        else
        {
          id v80 = (id)_BYLoggingFacility();
          os_log_type_t v79 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR))
          {
            char v77 = 0;
            char v75 = 0;
            char v73 = 0;
            char v71 = 0;
            char v69 = 0;
            char v67 = 0;
            char v65 = 0;
            char v63 = 0;
            char v61 = 0;
            char v59 = 0;
            if (_BYIsInternalInstall())
            {
              v78 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
              char v77 = 1;
              v29 = [(AVPlayer *)v78 error];
              v76 = v29;
              char v75 = 1;
            }
            else
            {
              v74 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
              char v73 = 1;
              v72 = [(AVPlayer *)v74 error];
              char v71 = 1;
              if (v72)
              {
                v70 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
                char v69 = 1;
                v68 = [(AVPlayer *)v70 error];
                char v67 = 1;
                v66 = [(NSError *)v68 domain];
                char v65 = 1;
                v64 = [(BFFProximityVisualPairingViewController *)v130 videoPlayer];
                char v63 = 1;
                v62 = [(AVPlayer *)v64 error];
                char v61 = 1;
                v29 = +[NSString stringWithFormat:@"<Error domain: %@, code %ld>", v66, [(NSError *)v62 code]];
                v60 = v29;
                char v59 = 1;
              }
              else
              {
                v29 = 0;
              }
            }
            sub_10004BB7C((uint64_t)v132, (uint64_t)v29);
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v80, v79, "VideoPlayer failed to play proximity animation. Error: %{public}@", v132, 0xCu);
            if (v59) {

            }
            if (v61) {
            if (v63)
            }

            if (v65) {
            if (v67)
            }

            if (v69) {
            if (v71)
            }

            if (v73) {
            if (v75)
            }

            if (v77) {
          }
            }
          objc_storeStrong(&v80, 0);
          v30 = &_dispatch_main_q;
          v53 = _NSConcreteStackBlock;
          int v54 = -1073741824;
          int v55 = 0;
          v56 = sub_10017450C;
          v57 = &unk_1002B0D20;
          v58 = v130;
          dispatch_async((dispatch_queue_t)v30, &v53);

          objc_storeStrong((id *)&v58, 0);
        }
      }
    }
  }
  objc_storeStrong(&v127, 0);
  objc_storeStrong(&v128, 0);
  objc_storeStrong(location, 0);
}

- (void)videoReachedEnd:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = [(BFFProximityVisualPairingViewController *)v7 videoPlayer];
  memcpy(v5, &kCMTimeZero, sizeof(v5));
  [(AVPlayer *)v3 seekToTime:v5];

  id v4 = [(BFFProximityVisualPairingViewController *)v7 videoPlayer];
  [(AVPlayer *)v4 play];

  objc_storeStrong(location, 0);
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BFFProximityVisualPairingViewController *)v4 _resumePlayer];
  objc_storeStrong(location, 0);
}

- (void)willResignActive:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BFFProximityVisualPairingViewController *)v4 _pausePlayer];
  objc_storeStrong(location, 0);
}

- (void)_observeAppLifecycleNotifications
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 addObserver:self selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

  char v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 addObserver:self selector:"willResignActive:" name:UIApplicationWillResignActiveNotification object:0];
}

- (void)_setupVideoPlayerObservationIfNeeded
{
  double v5 = self;
  location[1] = (id)a2;
  id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  location[0] = +[NSString stringWithFormat:@"%@", [(AVPlayer *)v2 observationInfo]];

  if ([location[0] rangeOfString:@"status"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    char v3 = [(BFFProximityVisualPairingViewController *)v5 videoPlayer];
    [(AVPlayer *)v3 addObserver:v5 forKeyPath:@"status" options:0 context:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_cleanUpAllNotifications
{
}

- (void)_cleanUpAppLifecycleNotifications
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  char v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];
}

- (void)_cleanUpVideoPlayerNotificationsIfNeeded
{
  id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];

  if (v2)
  {
    char v3 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
    [(AVPlayer *)v3 removeObserver:self forKeyPath:@"status"];
  }
}

- (void)_cleanUpPlayerItemNotifications
{
  id v2 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
  char v3 = [(AVPlayer *)v2 currentItem];

  if (v3)
  {
    id v4 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
    double v5 = [(AVPlayer *)v4 currentItem];
    [(AVPlayerItem *)v5 removeObserver:self forKeyPath:@"status"];

    char v6 = +[NSNotificationCenter defaultCenter];
    id v7 = [(BFFProximityVisualPairingViewController *)self videoPlayer];
    char v8 = [(AVPlayer *)v7 currentItem];
    [(NSNotificationCenter *)v6 removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:v8];
  }
}

- (VPPresenterView)visualPairingView
{
  return (VPPresenterView *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVisualPairingView:(id)a3
{
}

- (AVPlayer)videoPlayer
{
  return (AVPlayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVideoPlayer:(id)a3
{
}

- (AVPlayerViewController)videoViewController
{
  return (AVPlayerViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVideoViewController:(id)a3
{
}

- (int64_t)retryAttempts
{
  return self->_retryAttempts;
}

- (void)setRetryAttempts:(int64_t)a3
{
  self->_retryAttempts = a3;
}

- (void).cxx_destruct
{
}

@end