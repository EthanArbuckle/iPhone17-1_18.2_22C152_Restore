@interface AKProximityAuthViewController
- (AKAppleLogoMicaView)appleLogoMicaView;
- (AKBringDeviceCloseMicaView)proximityMicaView;
- (AKProximityAuthViewController)initWithViewModel:(id)a3;
- (AKProximityMessageViewModel)viewModel;
- (AKProximityViewDelegate)delegate;
- (AVPlayer)videoPlayer;
- (AVPlayerViewController)videoViewController;
- (BOOL)_doesUserInterfaceStyleMatchMovieURL;
- (BOOL)_isDarkMode;
- (BOOL)_shouldShowCancelBarButton;
- (BOOL)_shouldShowVisualPairing;
- (BOOL)_started;
- (NSString)verificationCode;
- (OBTrayButton)primaryButton;
- (OBTrayButton)secondaryButton;
- (UILabel)pinCodeLabel;
- (UIView)logoContainerView;
- (VPPresenterView)visualPairingView;
- (id)_currentPairingMovieURL;
- (id)_maskBackgroundColor;
- (id)_pairingBackgroundColor;
- (id)_pairingMovieName;
- (id)_pairingMoviePlayerItem;
- (id)_pairingMovieURLAsset;
- (id)alternateButtonAction;
- (id)cancelAction;
- (id)deallocAction;
- (id)primaryButtonAction;
- (int64_t)retryAttempts;
- (unsigned)_pairingFlags;
- (void)_addCancelBarButton;
- (void)_addContentView;
- (void)_addHeaderView;
- (void)_addPlayer;
- (void)_addPrimaryButton;
- (void)_addPrivacyLinkController;
- (void)_addSecondaryButton;
- (void)_cancelBarButtonItemPressed:(id)a3;
- (void)_cleanupOldViews;
- (void)_configureViews;
- (void)_createPlayer;
- (void)_currentPairingMovieURL;
- (void)_primaryFallbackButtonSelected:(id)a3;
- (void)_secondaryFallbackButtonSelected:(id)a3;
- (void)_showBroadcastingContent;
- (void)_showPinCode;
- (void)_showVisualPairingContent;
- (void)_start;
- (void)_stop;
- (void)_stopPairingInterface;
- (void)_updatePlayerIfNeeded;
- (void)_videoReachedEnd:(id)a3;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAlternateButtonAction:(id)a3;
- (void)setAppleLogoMicaView:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setDeallocAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogoContainerView:(id)a3;
- (void)setPinCodeLabel:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setPrimaryButtonAction:(id)a3;
- (void)setProximityMicaView:(id)a3;
- (void)setRetryAttempts:(int64_t)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setVerificationCode:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setVideoViewController:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setVisualPairingView:(id)a3;
- (void)set_started:(BOOL)a3;
- (void)updateViewWithViewModel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AKProximityAuthViewController

- (AKProximityAuthViewController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 titleText];
  v6 = [v4 detailedText];
  v9.receiver = self;
  v9.super_class = (Class)AKProximityAuthViewController;
  v7 = [(AKProximityAuthViewController *)&v9 initWithTitle:v5 detailText:v6 icon:0];

  if (v7) {
    [(AKProximityAuthViewController *)v7 setViewModel:v4];
  }

  return v7;
}

- (void)updateViewWithViewModel:(id)a3
{
  id v12 = a3;
  proximityMicaView = self->_proximityMicaView;
  if (proximityMicaView) {
    [(AKBringDeviceCloseMicaView *)proximityMicaView setShouldshowDotCloud:1];
  }
  [(AKProximityAuthViewController *)self setViewModel:v12];
  v5 = [v12 detailedText];
  v6 = [(AKProximityAuthViewController *)self headerView];
  [v6 setDetailText:v5];

  v7 = [v12 titleText];
  v8 = [(AKProximityAuthViewController *)self headerView];
  [v8 setTitle:v7];

  objc_super v9 = [(AKProximityAuthViewController *)self buttonTray];
  [v9 removeAllButtons];

  [(AKProximityAuthViewController *)self _configureViews];
  if ([v12 type] == 1)
  {
    [(AKProximityAuthViewController *)self _start];
    v10 = self->_proximityMicaView;
    self->_proximityMicaView = 0;
  }
  else
  {
    [(AKProximityAuthViewController *)self _stop];
  }
  v11 = [(AKProximityAuthViewController *)self view];
  [v11 layoutIfNeeded];
}

- (void)dealloc
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "AKProximityAuthViewController deallocated", buf, 2u);
  }

  id v4 = [(AKProximityAuthViewController *)self videoPlayer];
  [v4 removeObserver:self forKeyPath:@"status"];

  if (self->_deallocAction)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "AKProximityAuthViewController calling dealloc action", buf, 2u);
    }

    (*((void (**)(void))self->_deallocAction + 2))();
  }
  v6.receiver = self;
  v6.super_class = (Class)AKProximityAuthViewController;
  [(AKProximityAuthViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AKProximityAuthViewController;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  [(AKProximityAuthViewController *)self _configureViews];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  id v4 = [(AKProximityAuthViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(AKProximityAuthViewController *)self setEdgesForExtendedLayout:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKProximityAuthViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  if ([(AKProximityAuthViewController *)self _shouldShowVisualPairing]) {
    [(AKProximityAuthViewController *)self _start];
  }
}

- (void)viewDidLayoutSubviews
{
  if ([(AKProximityAuthViewController *)self _started])
  {
    [(AKProximityAuthViewController *)self _stop];
    [(AKProximityAuthViewController *)self _start];
  }
}

- (BOOL)_doesUserInterfaceStyleMatchMovieURL
{
  v3 = [(AKProximityAuthViewController *)self _currentPairingMovieURL];
  objc_super v4 = [v3 URLByDeletingPathExtension];
  objc_super v5 = [v4 lastPathComponent];

  objc_super v6 = [(AKProximityAuthViewController *)self _pairingMovieName];
  LOBYTE(v3) = [v5 isEqualToString:v6];

  return (char)v3;
}

- (BOOL)_shouldShowVisualPairing
{
  v2 = [(AKProximityAuthViewController *)self viewModel];
  BOOL v3 = [v2 type] == 1;

  return v3;
}

- (BOOL)_shouldShowCancelBarButton
{
  v2 = [(AKProximityAuthViewController *)self navigationController];
  char v3 = [v2 isModalInPresentation];

  return v3;
}

- (void)didBecomeActive:(id)a3
{
  if ([(AKProximityAuthViewController *)self _started])
  {
    [(AKProximityAuthViewController *)self _start];
  }
}

- (void)_createPlayer
{
  id v3 = objc_alloc(MEMORY[0x1E4F16608]);
  objc_super v4 = [(AKProximityAuthViewController *)self _pairingMoviePlayerItem];
  objc_super v5 = (void *)[v3 initWithPlayerItem:v4];
  [(AKProximityAuthViewController *)self setVideoPlayer:v5];

  objc_super v6 = [(AKProximityAuthViewController *)self videoPlayer];
  [v6 setMuted:1];

  v7 = [(AKProximityAuthViewController *)self videoPlayer];
  [v7 addObserver:self forKeyPath:@"status" options:0 context:0];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *MEMORY[0x1E4F16020];
  v10 = [(AKProximityAuthViewController *)self videoPlayer];
  v11 = [v10 currentItem];
  [v8 addObserver:self selector:sel__videoReachedEnd_ name:v9 object:v11];

  AVPlayerViewControllerClass = (objc_class *)AVKitLibraryCore();
  if (AVPlayerViewControllerClass) {
    AVPlayerViewControllerClass = (objc_class *)getAVPlayerViewControllerClass();
  }
  id v13 = objc_alloc_init(AVPlayerViewControllerClass);
  [(AKProximityAuthViewController *)self setVideoViewController:v13];

  v14 = [(AKProximityAuthViewController *)self videoViewController];
  v15 = [v14 view];
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, 300.0, 300.0);

  v16 = [(AKProximityAuthViewController *)self videoViewController];
  [v16 setUpdatesNowPlayingInfoCenter:0];

  v17 = [(AKProximityAuthViewController *)self videoPlayer];
  v18 = [(AKProximityAuthViewController *)self videoViewController];
  [v18 setPlayer:v17];

  v19 = [(AKProximityAuthViewController *)self videoViewController];
  [v19 setShowsPlaybackControls:0];

  v20 = [(AKProximityAuthViewController *)self videoViewController];
  [v20 setAllowsPictureInPicturePlayback:0];

  v21 = [(AKProximityAuthViewController *)self videoViewController];
  v22 = [v21 view];
  [v22 setContentMode:1];

  v23 = [(AKProximityAuthViewController *)self videoViewController];
  v24 = [v23 view];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  if ([(AKProximityAuthViewController *)self _isDarkMode]) {
    [(AKProximityAuthViewController *)self _pairingBackgroundColor];
  }
  else {
  id v27 = [MEMORY[0x1E4F428B8] clearColor];
  }
  v25 = [(AKProximityAuthViewController *)self videoViewController];
  v26 = [v25 view];
  [v26 setBackgroundColor:v27];
}

- (id)_pairingMoviePlayerItem
{
  v2 = (void *)MEMORY[0x1E4F16620];
  id v3 = [(AKProximityAuthViewController *)self _pairingMovieURLAsset];
  objc_super v4 = [v2 playerItemWithAsset:v3];

  return v4;
}

- (id)_pairingMovieURLAsset
{
  id v3 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/AuthKitUI.framework"];
  id v4 = objc_alloc(MEMORY[0x1E4F166C8]);
  objc_super v5 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v6 = [(AKProximityAuthViewController *)self _pairingMovieName];
  v7 = [v3 pathForResource:v6 ofType:@"mov"];
  v8 = [v5 fileURLWithPath:v7];
  uint64_t v9 = (void *)[v4 initWithURL:v8 options:0];

  return v9;
}

- (id)_pairingMovieName
{
  if ([(AKProximityAuthViewController *)self _isDarkMode]) {
    v2 = @"ProximityPairingLoopDark";
  }
  else {
    v2 = @"ProximityPairingLoop";
  }

  return v2;
}

- (void)_addPlayer
{
  id v5 = [(AKProximityAuthViewController *)self visualPairingView];
  id v3 = [(AKProximityAuthViewController *)self videoViewController];
  id v4 = [v3 view];
  [v5 addSubview:v4];
}

- (void)_updatePlayerIfNeeded
{
  if ([(AKProximityMessageViewModel *)self->_viewModel type] == 1
    && ![(AKProximityAuthViewController *)self _doesUserInterfaceStyleMatchMovieURL])
  {
    id v4 = [(AKProximityAuthViewController *)self videoPlayer];
    id v3 = [(AKProximityAuthViewController *)self _pairingMoviePlayerItem];
    [v4 replaceCurrentItemWithPlayerItem:v3];
  }
}

- (id)_currentPairingMovieURL
{
  v2 = [(AKProximityAuthViewController *)self videoPlayer];
  id v3 = [v2 currentItem];
  id v4 = [v3 asset];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 URL];
  }
  else
  {
    objc_super v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKProximityAuthViewController _currentPairingMovieURL](v6);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)_start
{
  if ([(AKProximityAuthViewController *)self _shouldShowVisualPairing])
  {
    [(AKProximityAuthViewController *)self set_started:1];
    id v3 = [(AKProximityAuthViewController *)self visualPairingView];
    [v3 start];

    id v4 = [(AKProximityAuthViewController *)self videoPlayer];
    [v4 play];
  }
}

- (void)_stop
{
  [(AKProximityAuthViewController *)self set_started:0];

  [(AKProximityAuthViewController *)self _stopPairingInterface];
}

- (void)_videoReachedEnd:(id)a3
{
  id v4 = [(AKProximityAuthViewController *)self videoPlayer];
  long long v6 = *MEMORY[0x1E4F1FA48];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v4 seekToTime:&v6];

  id v5 = [(AKProximityAuthViewController *)self videoPlayer];
  [v5 play];
}

- (void)_stopPairingInterface
{
  id v3 = [(AKProximityAuthViewController *)self visualPairingView];
  [v3 stop];

  id v4 = [(AKProximityAuthViewController *)self videoPlayer];
  [v4 pause];

  id v5 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v5 setCategory:*MEMORY[0x1E4F14F68] error:0];
}

- (BOOL)_isDarkMode
{
  v2 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == 2;

  return v3;
}

- (id)_pairingBackgroundColor
{
  return (id)[MEMORY[0x1E4F428B8] systemBackgroundColor];
}

- (id)_maskBackgroundColor
{
  return (id)[MEMORY[0x1E4F428B8] systemBackgroundColor];
}

- (unsigned)_pairingFlags
{
  return [(AKProximityAuthViewController *)self _isDarkMode];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(AKProximityAuthViewController *)self videoPlayer];
  if (v10 != v9 || ![v8 isEqualToString:@"status"]) {
    goto LABEL_7;
  }
  BOOL v11 = [(AKProximityAuthViewController *)self _started];

  if (v11) {
    goto LABEL_8;
  }
  id v10 = [(AKProximityAuthViewController *)self videoPlayer];
  if ([v10 status] != 2)
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v12 = [(AKProximityAuthViewController *)self retryAttempts];

  if (v12 <= 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__AKProximityAuthViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E648EF28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_8:
}

uint64_t __80__AKProximityAuthViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 retryAttempts] + 1;

  return [v1 setRetryAttempts:v2];
}

- (void)_cancelBarButtonItemPressed:(id)a3
{
  cancelAction = (void (**)(void))self->_cancelAction;
  if (cancelAction) {
    cancelAction[2]();
  }
}

- (void)_primaryFallbackButtonSelected:(id)a3
{
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AKProximityAuthViewController _primaryFallbackButtonSelected:](v4);
  }

  primaryButtonAction = (void (**)(void))self->_primaryButtonAction;
  if (primaryButtonAction) {
    primaryButtonAction[2]();
  }
}

- (void)_secondaryFallbackButtonSelected:(id)a3
{
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AKProximityAuthViewController _secondaryFallbackButtonSelected:](v4);
  }

  alternateButtonAction = (void (**)(void))self->_alternateButtonAction;
  if (alternateButtonAction) {
    alternateButtonAction[2]();
  }
}

- (void)_configureViews
{
  [(AKProximityAuthViewController *)self _cleanupOldViews];
  [(AKProximityAuthViewController *)self _addHeaderView];
  [(AKProximityAuthViewController *)self _addContentView];
  [(AKProximityAuthViewController *)self _addPrivacyLinkController];
  [(AKProximityAuthViewController *)self _addPrimaryButton];
  [(AKProximityAuthViewController *)self _addSecondaryButton];
  if ([(AKProximityAuthViewController *)self _shouldShowCancelBarButton])
  {
    [(AKProximityAuthViewController *)self _addCancelBarButton];
  }
}

- (void)_addCancelBarButton
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:24 target:self action:sel__cancelBarButtonItemPressed_];
  BOOL v3 = [(OBBaseWelcomeController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)_cleanupOldViews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_primaryButton)
  {
    BOOL v3 = [(AKProximityAuthViewController *)self buttonTray];
    [v3 removeButton:self->_primaryButton];

    primaryButton = self->_primaryButton;
    self->_primaryButton = 0;
  }
  if (self->_secondaryButton)
  {
    id v5 = [(AKProximityAuthViewController *)self buttonTray];
    [v5 removeButton:self->_secondaryButton];

    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = 0;
  }
  uint64_t v7 = [(AKProximityAuthViewController *)self contentView];

  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(AKProximityAuthViewController *)self contentView];
    id v9 = [v8 subviews];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) removeFromSuperview];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_addPrimaryButton
{
  BOOL v3 = [(AKProximityAuthViewController *)self viewModel];
  id v4 = [v3 primaryButtonTitle];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F83A80] boldButton];
    primaryButton = self->_primaryButton;
    self->_primaryButton = v5;

    uint64_t v7 = self->_primaryButton;
    id v8 = [(AKProximityAuthViewController *)self viewModel];
    id v9 = [v8 primaryButtonTitle];
    [(OBTrayButton *)v7 setTitle:v9 forState:0];

    uint64_t v10 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
    [(OBTrayButton *)self->_primaryButton setConfiguration:v10];

    [(OBTrayButton *)self->_primaryButton addTarget:self action:sel__primaryFallbackButtonSelected_ forControlEvents:64];
    id v11 = [(AKProximityAuthViewController *)self buttonTray];
    [v11 addButton:self->_primaryButton];
  }
}

- (void)_addSecondaryButton
{
  BOOL v3 = [(AKProximityAuthViewController *)self viewModel];
  id v4 = [v3 secondaryButtonTitle];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F83AB8] linkButton];
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v5;

    uint64_t v7 = self->_secondaryButton;
    id v8 = [(AKProximityAuthViewController *)self viewModel];
    id v9 = [v8 secondaryButtonTitle];
    [(OBTrayButton *)v7 setTitle:v9 forState:0];

    [(OBTrayButton *)self->_secondaryButton addTarget:self action:sel__secondaryFallbackButtonSelected_ forControlEvents:64];
    id v11 = [(AKProximityAuthViewController *)self buttonTray];
    [v11 addButton:self->_secondaryButton];
  }
  else
  {
    uint64_t v10 = self->_secondaryButton;
    self->_secondaryButton = 0;

    id v11 = [(AKProximityAuthViewController *)self buttonTray];
    [v11 removeButton:self->_secondaryButton];
  }
}

- (void)_addHeaderView
{
  v42[8] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AKProximityAuthViewController *)self headerView];
  [v3 layoutIfNeeded];

  id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  logoContainerView = self->_logoContainerView;
  self->_logoContainerView = v4;

  -[UIView setFrame:](self->_logoContainerView, "setFrame:", 0.0, 50.0, 373.0, 373.0);
  [(UIView *)self->_logoContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v6 = objc_alloc_init(AKAppleLogoMicaView);
  appleLogoMicaView = self->_appleLogoMicaView;
  self->_appleLogoMicaView = v6;

  [(AKAppleLogoMicaView *)self->_appleLogoMicaView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_logoContainerView addSubview:self->_appleLogoMicaView];
  id v8 = [(AKProximityAuthViewController *)self headerView];
  id v9 = [v8 animationView];
  [v9 addSubview:self->_logoContainerView];

  uint64_t v10 = [(AKProximityAuthViewController *)self headerView];
  id v11 = [v10 animationView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v12 = [(AKProximityAuthViewController *)self headerView];
  uint64_t v13 = [v12 animationView];
  [v13 setClipsToBounds:1];

  v30 = (void *)MEMORY[0x1E4F28DC8];
  v40 = [(UIView *)self->_logoContainerView centerXAnchor];
  v41 = [(AKProximityAuthViewController *)self headerView];
  v39 = [v41 animationView];
  v38 = [v39 centerXAnchor];
  v37 = [v40 constraintEqualToAnchor:v38];
  v42[0] = v37;
  v35 = [(UIView *)self->_logoContainerView centerYAnchor];
  v36 = [(AKProximityAuthViewController *)self headerView];
  v34 = [v36 animationView];
  v33 = [v34 centerYAnchor];
  v32 = [v35 constraintEqualToAnchor:v33];
  v42[1] = v32;
  v31 = [(UIView *)self->_logoContainerView heightAnchor];
  v29 = [v31 constraintEqualToConstant:373.0];
  v42[2] = v29;
  v28 = [(UIView *)self->_logoContainerView widthAnchor];
  id v27 = [v28 constraintEqualToConstant:373.0];
  v42[3] = v27;
  v26 = [(AKAppleLogoMicaView *)self->_appleLogoMicaView topAnchor];
  v25 = [(UIView *)self->_logoContainerView topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v42[4] = v24;
  long long v14 = [(AKAppleLogoMicaView *)self->_appleLogoMicaView bottomAnchor];
  long long v15 = [(UIView *)self->_logoContainerView bottomAnchor];
  long long v16 = [v14 constraintEqualToAnchor:v15];
  v42[5] = v16;
  long long v17 = [(AKAppleLogoMicaView *)self->_appleLogoMicaView leadingAnchor];
  v18 = [(UIView *)self->_logoContainerView leadingAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18];
  v42[6] = v19;
  v20 = [(AKAppleLogoMicaView *)self->_appleLogoMicaView trailingAnchor];
  v21 = [(UIView *)self->_logoContainerView trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v42[7] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
  [v30 activateConstraints:v23];
}

- (void)_addContentView
{
  unint64_t v3 = [(AKProximityMessageViewModel *)self->_viewModel type];
  switch(v3)
  {
    case 2uLL:
      [(AKProximityAuthViewController *)self _showPinCode];
      break;
    case 1uLL:
      [(AKProximityAuthViewController *)self _showVisualPairingContent];
      break;
    case 0uLL:
      [(AKProximityAuthViewController *)self _showBroadcastingContent];
      break;
  }
  if ([(AKProximityAuthViewController *)self _shouldShowVisualPairing])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AKProximityAuthViewController__addContentView__block_invoke;
    block[3] = &unk_1E648EF28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v4 = [(AKProximityAuthViewController *)self contentView];
    [v4 layoutIfNeeded];
  }
}

uint64_t __48__AKProximityAuthViewController__addContentView__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__AKProximityAuthViewController__addContentView__block_invoke_2;
  v2[3] = &unk_1E648EF28;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0.2];
}

void __48__AKProximityAuthViewController__addContentView__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) visualPairingView];
  v1 = [v3 layer];
  LODWORD(v2) = 1.0;
  [v1 setOpacity:v2];
}

- (void)_showBroadcastingContent
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(AKBringDeviceCloseMicaView);
  proximityMicaView = self->_proximityMicaView;
  self->_proximityMicaView = v3;

  [(AKBringDeviceCloseMicaView *)self->_proximityMicaView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(AKProximityAuthViewController *)self contentView];
  [v5 addSubview:self->_proximityMicaView];

  long long v17 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [(AKBringDeviceCloseMicaView *)self->_proximityMicaView heightAnchor];
  v22 = [v23 constraintEqualToConstant:250.0];
  v24[0] = v22;
  v21 = [(AKBringDeviceCloseMicaView *)self->_proximityMicaView widthAnchor];
  v20 = [v21 constraintEqualToConstant:300.0];
  v24[1] = v20;
  v18 = [(AKBringDeviceCloseMicaView *)self->_proximityMicaView centerXAnchor];
  uint64_t v19 = [(AKProximityAuthViewController *)self contentView];
  long long v16 = [v19 centerXAnchor];
  long long v6 = [v18 constraintEqualToAnchor:v16];
  v24[2] = v6;
  uint64_t v7 = [(AKBringDeviceCloseMicaView *)self->_proximityMicaView topAnchor];
  id v8 = [(AKProximityAuthViewController *)self contentView];
  id v9 = [v8 topAnchor];
  uint64_t v10 = [v7 constraintEqualToAnchor:v9];
  v24[3] = v10;
  id v11 = [(AKBringDeviceCloseMicaView *)self->_proximityMicaView bottomAnchor];
  uint64_t v12 = [(AKProximityAuthViewController *)self contentView];
  uint64_t v13 = [v12 bottomAnchor];
  long long v14 = [v11 constraintEqualToAnchor:v13 constant:-30.0];
  v24[4] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
  [v17 activateConstraints:v15];
}

- (void)_showVisualPairingContent
{
  v55[5] = *MEMORY[0x1E4F143B8];
  VPPresenterViewClass = (objc_class *)VisualPairingLibraryCore();
  if (VPPresenterViewClass) {
    VPPresenterViewClass = (objc_class *)getVPPresenterViewClass();
  }
  id v4 = objc_msgSend([VPPresenterViewClass alloc], "initWithFrame:", 0.0, 0.0, 300.0, 300.0);
  [(AKProximityAuthViewController *)self setVisualPairingView:v4];

  verificationCode = self->_verificationCode;
  long long v6 = [(AKProximityAuthViewController *)self visualPairingView];
  [v6 setVerificationCode:verificationCode];

  uint64_t v7 = [(AKProximityAuthViewController *)self visualPairingView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(AKProximityAuthViewController *)self _pairingBackgroundColor];
  uint64_t v9 = [v8 CGColor];
  uint64_t v10 = [(AKProximityAuthViewController *)self visualPairingView];
  id v11 = [v10 layer];
  [v11 setBackgroundColor:v9];

  uint64_t v12 = [(AKProximityAuthViewController *)self _pairingFlags];
  uint64_t v13 = [(AKProximityAuthViewController *)self visualPairingView];
  [v13 setFlags:v12];

  v54 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/AuthKitUI.framework"];
  long long v14 = (void *)MEMORY[0x1E4F42A80];
  long long v15 = [v54 pathForResource:@"ProximityPairingMask" ofType:@".png"];
  v53 = [v14 imageWithContentsOfFile:v15];

  long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v53];
  [v16 setContentMode:1];
  v52 = v16;
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v18 = [v17 CGColor];
  uint64_t v19 = [(AKProximityAuthViewController *)self contentView];
  v20 = [v19 layer];
  [v20 setBackgroundColor:v18];

  v21 = [(AKProximityAuthViewController *)self visualPairingView];
  [v21 setMaskView:v16];

  [(AKProximityAuthViewController *)self _createPlayer];
  [(AKProximityAuthViewController *)self setRetryAttempts:0];
  [(AKProximityAuthViewController *)self _addPlayer];
  v22 = [(AKProximityAuthViewController *)self visualPairingView];
  v23 = [v22 layer];
  LODWORD(v24) = 1008981770;
  [v23 setOpacity:v24];

  v25 = [(AKProximityAuthViewController *)self contentView];
  v26 = [(AKProximityAuthViewController *)self visualPairingView];
  [v25 addSubview:v26];

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v51 = [(AKProximityAuthViewController *)self visualPairingView];
  v49 = [v51 topAnchor];
  v50 = [(AKProximityAuthViewController *)self contentView];
  v48 = [v50 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:20.0];
  v55[0] = v47;
  v46 = [(AKProximityAuthViewController *)self visualPairingView];
  v44 = [v46 bottomAnchor];
  v45 = [(AKProximityAuthViewController *)self contentView];
  v43 = [v45 bottomAnchor];
  v41 = [v44 constraintEqualToAnchor:v43 constant:-30.0];
  v55[1] = v41;
  v40 = [(AKProximityAuthViewController *)self visualPairingView];
  v39 = [v40 heightAnchor];
  v38 = [v39 constraintEqualToConstant:300.0];
  v55[2] = v38;
  id v27 = [(AKProximityAuthViewController *)self visualPairingView];
  v28 = [v27 widthAnchor];
  v29 = [v28 constraintEqualToConstant:300.0];
  v55[3] = v29;
  v30 = [(AKProximityAuthViewController *)self visualPairingView];
  v31 = [v30 centerXAnchor];
  v32 = [(AKProximityAuthViewController *)self contentView];
  v33 = [v32 centerXAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  v55[4] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
  [v42 activateConstraints:v35];

  v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v36 addObserver:self selector:sel_didBecomeActive_ name:*MEMORY[0x1E4F43648] object:0];

  v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v37 addObserver:self selector:sel_willResignActive_ name:*MEMORY[0x1E4F43710] object:0];
}

- (void)_showPinCode
{
  v43[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AKProximityAuthViewController *)self setPinCodeLabel:v4];

  id v5 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v5 setNumberOfLines:0];

  long long v6 = [MEMORY[0x1E4F428B8] labelColor];
  uint64_t v7 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v7 setTextColor:v6];

  id v8 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  uint64_t v9 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v9 setBackgroundColor:v8];

  uint64_t v10 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438E0]];
  id v11 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v11 setFont:v10];

  uint64_t v12 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v12 setTextAlignment:1];

  uint64_t v13 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  verificationCode = self->_verificationCode;
  long long v15 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v15 setText:verificationCode];

  long long v16 = [(AKProximityAuthViewController *)self pinCodeLabel];
  LODWORD(v17) = 1148846080;
  [v16 setContentHuggingPriority:1 forAxis:v17];

  uint64_t v18 = [(AKProximityAuthViewController *)self contentView];
  uint64_t v19 = [(AKProximityAuthViewController *)self pinCodeLabel];
  [v18 addSubview:v19];

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v42 = [(AKProximityAuthViewController *)self pinCodeLabel];
  v41 = [v42 heightAnchor];
  v40 = [v41 constraintEqualToConstant:250.0];
  v43[0] = v40;
  v39 = [(AKProximityAuthViewController *)self pinCodeLabel];
  v38 = [v39 widthAnchor];
  v37 = [v38 constraintEqualToConstant:300.0];
  v43[1] = v37;
  v36 = [(AKProximityAuthViewController *)self pinCodeLabel];
  v34 = [v36 centerXAnchor];
  v35 = [(AKProximityAuthViewController *)self contentView];
  v32 = [v35 centerXAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v43[2] = v31;
  v30 = [(AKProximityAuthViewController *)self pinCodeLabel];
  v20 = [v30 topAnchor];
  v21 = [(AKProximityAuthViewController *)self contentView];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v43[3] = v23;
  double v24 = [(AKProximityAuthViewController *)self pinCodeLabel];
  v25 = [v24 bottomAnchor];
  v26 = [(AKProximityAuthViewController *)self contentView];
  id v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:-30.0];
  v43[4] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:5];
  [v33 activateConstraints:v29];
}

- (void)_addPrivacyLinkController
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(AKProximityAuthViewController *)self viewModel];
  uint64_t v4 = [v3 type];

  id v5 = [(AKProximityAuthViewController *)self buttonTray];
  id v7 = v5;
  if (v4)
  {
    [v5 setPrivacyLinkController:0];
  }
  else
  {
    v8[0] = @"com.apple.onboarding.appleid";
    long long v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v7 setPrivacyLinkForBundles:v6];
  }
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (id)primaryButtonAction
{
  return self->_primaryButtonAction;
}

- (void)setPrimaryButtonAction:(id)a3
{
}

- (id)alternateButtonAction
{
  return self->_alternateButtonAction;
}

- (void)setAlternateButtonAction:(id)a3
{
}

- (id)deallocAction
{
  return self->_deallocAction;
}

- (void)setDeallocAction:(id)a3
{
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (AKProximityViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKProximityViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBTrayButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (AKProximityMessageViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (VPPresenterView)visualPairingView
{
  return self->_visualPairingView;
}

- (void)setVisualPairingView:(id)a3
{
}

- (UILabel)pinCodeLabel
{
  return self->_pinCodeLabel;
}

- (void)setPinCodeLabel:(id)a3
{
}

- (AVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
}

- (AVPlayerViewController)videoViewController
{
  return self->_videoViewController;
}

- (void)setVideoViewController:(id)a3
{
}

- (AKBringDeviceCloseMicaView)proximityMicaView
{
  return self->_proximityMicaView;
}

- (void)setProximityMicaView:(id)a3
{
}

- (AKAppleLogoMicaView)appleLogoMicaView
{
  return self->_appleLogoMicaView;
}

- (void)setAppleLogoMicaView:(id)a3
{
}

- (UIView)logoContainerView
{
  return self->_logoContainerView;
}

- (void)setLogoContainerView:(id)a3
{
}

- (BOOL)_started
{
  return self->__started;
}

- (void)set_started:(BOOL)a3
{
  self->__started = a3;
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
  objc_storeStrong((id *)&self->_logoContainerView, 0);
  objc_storeStrong((id *)&self->_appleLogoMicaView, 0);
  objc_storeStrong((id *)&self->_proximityMicaView, 0);
  objc_storeStrong((id *)&self->_videoViewController, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_pinCodeLabel, 0);
  objc_storeStrong((id *)&self->_visualPairingView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong(&self->_deallocAction, 0);
  objc_storeStrong(&self->_alternateButtonAction, 0);
  objc_storeStrong(&self->_primaryButtonAction, 0);

  objc_storeStrong(&self->_cancelAction, 0);
}

- (void)_currentPairingMovieURL
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Pairing movie player does not contain a URL asset.", v1, 2u);
}

- (void)_primaryFallbackButtonSelected:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "User selected the primary fallback for prox auth...", v1, 2u);
}

- (void)_secondaryFallbackButtonSelected:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "User selected the secondary fallback for prox auth...", v1, 2u);
}

@end