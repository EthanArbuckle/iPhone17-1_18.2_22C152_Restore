@interface AVTSplashScreenViewController
- (AVPlayerViewController)playerViewController;
- (AVPlayerViewController)secondaryPlayerViewController;
- (AVQueuePlayer)queuePlayer;
- (AVQueuePlayer)secondaryQueuePlayer;
- (AVTSplashScreenConfiguration)configuration;
- (AVTSplashScreenViewController)initWithConfiguration:(id)a3;
- (AVTSplashScreenViewController)initWithDefaultConfiguration;
- (AVTSplashScreenViewControllerDelegate)delegate;
- (BOOL)isPlayingVideos;
- (NSLayoutConstraint)videoContentHeightConstraint;
- (NSLayoutConstraint)videoContentWidthConstraint;
- (OBBoldTrayButton)continueButton;
- (UIView)videoContentView;
- (double)desiredHeightForVideoContent;
- (void)detachVideoController;
- (void)didTapContinueButton:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConfiguration:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPlayingVideos:(BOOL)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setQueuePlayer:(id)a3;
- (void)setSecondaryPlayerViewController:(id)a3;
- (void)setSecondaryQueuePlayer:(id)a3;
- (void)setVideoContentHeightConstraint:(id)a3;
- (void)setVideoContentView:(id)a3;
- (void)setVideoContentWidthConstraint:(id)a3;
- (void)startPlayingVideos;
- (void)stopPlayingVideos;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AVTSplashScreenViewController

- (AVTSplashScreenViewController)initWithDefaultConfiguration
{
  v3 = objc_alloc_init(AVTSplashScreenConfiguration);
  v4 = AVTAvatarUIBundle();
  v5 = [v4 localizedStringForKey:@"MEMOJI_SPLASH_TITLE" value:&stru_26BF058D0 table:@"Localized"];
  [(AVTSplashScreenConfiguration *)v3 setTitleString:v5];

  LODWORD(v4) = AVTUIIsFacetrackingSupported();
  v6 = AVTAvatarUIBundle();
  v7 = v6;
  if (v4) {
    v8 = @"MEMOJI_SPLASH_SUBTITLE";
  }
  else {
    v8 = @"MEMOJI_SPLASH_SUBTITLE_NO_FACE_TRACKING";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_26BF058D0 table:@"Localized"];
  [(AVTSplashScreenConfiguration *)v3 setSubTitleString:v9];

  v10 = AVTAvatarUIBundle();
  v11 = [v10 localizedStringForKey:@"MEMOJI_SPLASH_CREATE_YOURS" value:&stru_26BF058D0 table:@"Localized"];
  [(AVTSplashScreenConfiguration *)v3 setButtonString:v11];

  v12 = AVTAvatarEditorSplashVideo();
  [(AVTSplashScreenConfiguration *)v3 setPrimaryPlayerItem:v12];

  v13 = [(AVTSplashScreenViewController *)self initWithConfiguration:v3];
  return v13;
}

- (AVTSplashScreenViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v6 = [v5 titleString];
  v7 = [v5 subTitleString];
  v10.receiver = self;
  v10.super_class = (Class)AVTSplashScreenViewController;
  v8 = [(AVTSplashScreenViewController *)&v10 initWithTitle:v6 detailText:v7 symbolName:0];

  if (v8) {
    objc_storeStrong((id *)&v8->_configuration, a3);
  }

  return v8;
}

- (void)viewDidLoad
{
  v138[4] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
  [(AVTSplashScreenViewController *)self setVideoContentView:v3];

  v4 = [(AVTSplashScreenViewController *)self videoContentView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(AVTSplashScreenViewController *)self videoContentView];
  [(OBWelcomeFullCenterContentController *)self setCenteredContentView:v5];

  v135.receiver = self;
  v135.super_class = (Class)AVTSplashScreenViewController;
  [(OBWelcomeFullCenterContentController *)&v135 viewDidLoad];
  v6 = [MEMORY[0x263F5B8A0] boldButton];
  [(AVTSplashScreenViewController *)self setContinueButton:v6];

  v7 = [(AVTSplashScreenViewController *)self continueButton];
  v8 = [(AVTSplashScreenViewController *)self configuration];
  v9 = [v8 buttonString];
  [v7 setTitle:v9 forState:0];

  objc_super v10 = [(AVTSplashScreenViewController *)self continueButton];
  [v10 addTarget:self action:sel_didTapContinueButton_ forControlEvents:64];

  v11 = [(AVTSplashScreenViewController *)self buttonTray];
  v12 = [(AVTSplashScreenViewController *)self continueButton];
  [v11 addButton:v12];

  v13 = (void *)MEMORY[0x263EFA860];
  v14 = [(AVTSplashScreenViewController *)self configuration];
  v15 = [v14 primaryPlayerItem];
  v16 = [v13 playerWithPlayerItem:v15];
  [(AVTSplashScreenViewController *)self setQueuePlayer:v16];

  v17 = [(AVTSplashScreenViewController *)self queuePlayer];
  [v17 setPreventsDisplaySleepDuringVideoPlayback:0];

  v18 = [(AVTSplashScreenViewController *)self queuePlayer];
  [v18 setAllowsExternalPlayback:0];

  id v19 = objc_alloc_init(MEMORY[0x263EFA9C8]);
  [(AVTSplashScreenViewController *)self setPlayerViewController:v19];

  v20 = [(AVTSplashScreenViewController *)self playerViewController];
  v21 = [v20 view];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [MEMORY[0x263F1C550] clearColor];
  v23 = [(AVTSplashScreenViewController *)self playerViewController];
  v24 = [v23 view];
  [v24 setBackgroundColor:v22];

  v25 = [(AVTSplashScreenViewController *)self playerViewController];
  [v25 setShowsPlaybackControls:0];

  v26 = [(AVTSplashScreenViewController *)self playerViewController];
  [v26 setUpdatesNowPlayingInfoCenter:0];

  v27 = [(AVTSplashScreenViewController *)self queuePlayer];
  v28 = [(AVTSplashScreenViewController *)self playerViewController];
  [v28 setPlayer:v27];

  v29 = [(AVTSplashScreenViewController *)self playerViewController];
  [(AVTSplashScreenViewController *)self addChildViewController:v29];

  v30 = [(AVTSplashScreenViewController *)self videoContentView];
  v31 = [(AVTSplashScreenViewController *)self playerViewController];
  v32 = [v31 view];
  [v30 addSubview:v32];

  v33 = [(AVTSplashScreenViewController *)self configuration];
  v34 = [v33 secondaryPlayerItem];

  if (v34)
  {
    v35 = (void *)MEMORY[0x263EFA860];
    v36 = [(AVTSplashScreenViewController *)self configuration];
    v37 = [v36 secondaryPlayerItem];
    v38 = [v35 playerWithPlayerItem:v37];
    [(AVTSplashScreenViewController *)self setSecondaryQueuePlayer:v38];

    v39 = [(AVTSplashScreenViewController *)self secondaryQueuePlayer];
    [v39 setPreventsDisplaySleepDuringVideoPlayback:0];

    v40 = [(AVTSplashScreenViewController *)self secondaryQueuePlayer];
    [v40 setAllowsExternalPlayback:0];

    id v41 = objc_alloc_init(MEMORY[0x263EFA9C8]);
    [(AVTSplashScreenViewController *)self setSecondaryPlayerViewController:v41];

    v42 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    v43 = [v42 view];
    [v43 setTranslatesAutoresizingMaskIntoConstraints:0];

    v44 = [MEMORY[0x263F1C550] clearColor];
    v45 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    v46 = [v45 view];
    [v46 setBackgroundColor:v44];

    v47 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    [v47 setShowsPlaybackControls:0];

    v48 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    [v48 setUpdatesNowPlayingInfoCenter:0];

    v49 = [(AVTSplashScreenViewController *)self secondaryQueuePlayer];
    v50 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    [v50 setPlayer:v49];

    v51 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    [(AVTSplashScreenViewController *)self addChildViewController:v51];

    v52 = [(AVTSplashScreenViewController *)self videoContentView];
    v53 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    v54 = [v53 view];
    [v52 addSubview:v54];
  }
  v132 = [(AVTSplashScreenViewController *)self playerViewController];
  v130 = [v132 view];
  v126 = [v130 leadingAnchor];
  v128 = [(AVTSplashScreenViewController *)self videoContentView];
  v124 = [v128 leadingAnchor];
  v122 = [v126 constraintEqualToAnchor:v124 constant:40.0];
  v138[0] = v122;
  v120 = [(AVTSplashScreenViewController *)self playerViewController];
  v118 = [v120 view];
  v114 = [v118 trailingAnchor];
  v116 = [(AVTSplashScreenViewController *)self videoContentView];
  v112 = [v116 trailingAnchor];
  v110 = [v114 constraintEqualToAnchor:v112 constant:-40.0];
  v138[1] = v110;
  v108 = [(AVTSplashScreenViewController *)self playerViewController];
  v106 = [v108 view];
  v104 = [v106 topAnchor];
  v55 = [(AVTSplashScreenViewController *)self videoContentView];
  v56 = [v55 topAnchor];
  v57 = [v104 constraintEqualToAnchor:v56];
  v138[2] = v57;
  v58 = [(AVTSplashScreenViewController *)self playerViewController];
  v59 = [v58 view];
  v60 = [v59 heightAnchor];
  v61 = [(AVTSplashScreenViewController *)self videoContentView];
  v62 = [v61 widthAnchor];
  v63 = [v60 constraintEqualToAnchor:v62 multiplier:0.7];
  v138[3] = v63;
  v134 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:4];

  v64 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];

  v65 = [(AVTSplashScreenViewController *)self playerViewController];
  v66 = [v65 view];
  v67 = [v66 bottomAnchor];
  if (v64)
  {
    v113 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    v107 = [v113 view];
    uint64_t v117 = [v107 topAnchor];
    uint64_t v127 = [v67 constraintEqualToAnchor:v117];
    v137[0] = v127;
    v125 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    v123 = [v125 view];
    v119 = [v123 leadingAnchor];
    v121 = [(AVTSplashScreenViewController *)self videoContentView];
    v115 = [v121 leadingAnchor];
    v111 = [v119 constraintEqualToAnchor:v115];
    v137[1] = v111;
    v109 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    v105 = [v109 view];
    v102 = [v105 trailingAnchor];
    v103 = [(AVTSplashScreenViewController *)self videoContentView];
    v101 = [v103 trailingAnchor];
    v100 = [v102 constraintEqualToAnchor:v101];
    v137[2] = v100;
    v68 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    [v68 view];
    v69 = v129 = v67;
    v70 = [v69 heightAnchor];
    [(AVTSplashScreenViewController *)self videoContentView];
    v71 = v131 = v65;
    v72 = [v71 widthAnchor];
    v73 = [v70 constraintEqualToAnchor:v72 multiplier:0.265];
    v137[3] = v73;
    v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:4];
    v133 = [v134 arrayByAddingObjectsFromArray:v74];

    v75 = v107;
    v76 = v113;

    v65 = v131;
    v67 = v129;

    v77 = (void *)v117;
    v78 = (void *)v127;
  }
  else
  {
    v76 = [(AVTSplashScreenViewController *)self videoContentView];
    v75 = [v76 bottomAnchor];
    v77 = [v67 constraintEqualToAnchor:v75];
    v78 = v134;
    v133 = [v134 arrayByAddingObject:v77];
  }

  [(AVTSplashScreenViewController *)self desiredHeightForVideoContent];
  double v80 = v79;
  v81 = [(AVTSplashScreenViewController *)self viewIfLoaded];
  if (v81)
  {
    v82 = [(AVTSplashScreenViewController *)self view];
    [v82 bounds];
    double Width = CGRectGetWidth(v139);
    v84 = [(AVTSplashScreenViewController *)self view];
    [v84 layoutMargins];
    double v86 = v85;
    v87 = [(AVTSplashScreenViewController *)self view];
    [v87 layoutMargins];
    double v89 = Width - (v86 + v88);
  }
  else
  {
    double v89 = 300.0;
  }

  v90 = [(AVTSplashScreenViewController *)self videoContentView];
  v91 = [v90 widthAnchor];
  v92 = [v91 constraintEqualToConstant:v89];
  [(AVTSplashScreenViewController *)self setVideoContentWidthConstraint:v92];

  v93 = [(AVTSplashScreenViewController *)self videoContentView];
  v94 = [v93 heightAnchor];
  v95 = [v94 constraintEqualToConstant:v80];
  [(AVTSplashScreenViewController *)self setVideoContentHeightConstraint:v95];

  v96 = [(AVTSplashScreenViewController *)self videoContentWidthConstraint];
  v136[0] = v96;
  v97 = [(AVTSplashScreenViewController *)self videoContentHeightConstraint];
  v136[1] = v97;
  v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:2];
  v99 = [v133 arrayByAddingObjectsFromArray:v98];

  [MEMORY[0x263F08938] activateConstraints:v99];
}

- (double)desiredHeightForVideoContent
{
  v3 = [(AVTSplashScreenViewController *)self playerViewController];
  v4 = [v3 view];
  id v5 = [v4 superview];

  if (!v5) {
    return 200.0;
  }
  v6 = [(AVTSplashScreenViewController *)self videoContentView];
  v7 = [v6 superview];

  [v7 bounds];
  double v8 = CGRectGetWidth(v11) * 0.7 + 0.0;
  v9 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];

  if (v9)
  {
    [v7 bounds];
    double v8 = v8 + CGRectGetWidth(v12) * 0.265;
  }

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTSplashScreenViewController;
  [(AVTSplashScreenViewController *)&v4 viewWillAppear:a3];
  [(AVTSplashScreenViewController *)self startPlayingVideos];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVTSplashScreenViewController *)self stopPlayingVideos];
  v5.receiver = self;
  v5.super_class = (Class)AVTSplashScreenViewController;
  [(AVTSplashScreenViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)AVTSplashScreenViewController;
  [(AVTSplashScreenViewController *)&v16 viewWillLayoutSubviews];
  [(AVTSplashScreenViewController *)self desiredHeightForVideoContent];
  double v4 = v3;
  objc_super v5 = [(AVTSplashScreenViewController *)self viewIfLoaded];
  if (v5)
  {
    v6 = [(AVTSplashScreenViewController *)self view];
    [v6 bounds];
    double Width = CGRectGetWidth(v17);
    double v8 = [(AVTSplashScreenViewController *)self view];
    [v8 layoutMargins];
    double v10 = v9;
    CGRect v11 = [(AVTSplashScreenViewController *)self view];
    [v11 layoutMargins];
    double v13 = Width - (v10 + v12);
  }
  else
  {
    double v13 = 300.0;
  }

  v14 = [(AVTSplashScreenViewController *)self videoContentWidthConstraint];
  [v14 setConstant:v13];

  v15 = [(AVTSplashScreenViewController *)self videoContentHeightConstraint];
  [v15 setConstant:v4];
}

- (void)didTapContinueButton:(id)a3
{
  id v4 = [(AVTSplashScreenViewController *)self delegate];
  [v4 splashScreenViewControllerDidConfirm:self];
}

- (void)detachVideoController
{
  double v3 = [(AVTSplashScreenViewController *)self primaryVideoController];
  id v4 = [v3 player];
  [v4 removeObserver:self forKeyPath:@"status"];

  [(AVTSplashScreenViewController *)self setPlayerViewController:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"status"] && objc_msgSend(v8, "status") == 2)
  {
    [(AVTSplashScreenViewController *)self stopPlayingVideos];
    [(AVTSplashScreenViewController *)self startPlayingVideos];
  }
}

- (void)startPlayingVideos
{
  if (![(AVTSplashScreenViewController *)self isPlayingVideos])
  {
    double v3 = [(AVTSplashScreenViewController *)self playerViewController];
    id v4 = [v3 player];
    [v4 addObserver:self forKeyPath:@"status" options:1 context:0];

    objc_super v5 = [(AVTSplashScreenViewController *)self playerViewController];
    v6 = [v5 player];
    [v6 play];

    v7 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];

    if (v7)
    {
      id v8 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
      double v9 = [v8 player];
      [v9 addObserver:self forKeyPath:@"status" options:1 context:0];

      double v10 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
      CGRect v11 = [v10 player];
      [v11 play];
    }
    [(AVTSplashScreenViewController *)self setIsPlayingVideos:1];
  }
}

- (void)stopPlayingVideos
{
  if ([(AVTSplashScreenViewController *)self isPlayingVideos])
  {
    double v3 = [(AVTSplashScreenViewController *)self playerViewController];
    id v4 = [v3 player];
    [v4 removeObserver:self forKeyPath:@"status"];

    objc_super v5 = [(AVTSplashScreenViewController *)self playerViewController];
    v6 = [v5 player];
    [v6 pause];

    v7 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    id v8 = [v7 player];
    [v8 removeObserver:self forKeyPath:@"status"];

    double v9 = [(AVTSplashScreenViewController *)self secondaryPlayerViewController];
    double v10 = [v9 player];
    [v10 pause];

    [(AVTSplashScreenViewController *)self setIsPlayingVideos:0];
  }
}

- (AVTSplashScreenViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTSplashScreenViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (UIView)videoContentView
{
  return self->_videoContentView;
}

- (void)setVideoContentView:(id)a3
{
}

- (AVTSplashScreenConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)isPlayingVideos
{
  return self->_isPlayingVideos;
}

- (void)setIsPlayingVideos:(BOOL)a3
{
  self->_isPlayingVideos = a3;
}

- (AVQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (AVQueuePlayer)secondaryQueuePlayer
{
  return self->_secondaryQueuePlayer;
}

- (void)setSecondaryQueuePlayer:(id)a3
{
}

- (AVPlayerViewController)secondaryPlayerViewController
{
  return self->_secondaryPlayerViewController;
}

- (void)setSecondaryPlayerViewController:(id)a3
{
}

- (NSLayoutConstraint)videoContentWidthConstraint
{
  return self->_videoContentWidthConstraint;
}

- (void)setVideoContentWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)videoContentHeightConstraint
{
  return self->_videoContentHeightConstraint;
}

- (void)setVideoContentHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoContentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_videoContentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryPlayerViewController, 0);
  objc_storeStrong((id *)&self->_secondaryQueuePlayer, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_videoContentView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end