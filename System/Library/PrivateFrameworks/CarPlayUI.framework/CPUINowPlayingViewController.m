@interface CPUINowPlayingViewController
- (BOOL)_isCarScene:(id)a3;
- (BOOL)_showsButtonSelectionsForTouch;
- (CPUINowPlayingView)nowPlayingView;
- (CPUINowPlayingViewController)initWithBundleIdentifier:(id)a3 dataSource:(id)a4 delegate:(id)a5;
- (CPUINowPlayingViewControllerDataSource)dataSource;
- (CPUINowPlayingViewControllerDelegate)delegate;
- (CPUIPlayModeControlView)playModeControlView;
- (CPUISongDetailsView)songDetailsView;
- (CPUITransportControlView)transportControlView;
- (CRSUIStatusBarStyleAssertion)statusBarStyleAssertion;
- (MRNowPlayingAudioFormatController)audioFormatController;
- (NSArray)nowPlayingSizeConstraints;
- (NSOperationQueue)artworkOperationQueue;
- (NSString)bundleIdentifier;
- (NSString)forwardTransportButtonImageIdentifier;
- (NSString)playPauseTransportButtonImageIdentifier;
- (NSString)previousTransportButtonImageIdentifier;
- (NSTimer)uiTimer;
- (UIActivityIndicatorView)activityIndicator;
- (UIBarButtonItem)activityIndicatorBarButtonItem;
- (UIBarButtonItem)playbackQueueBarButtonItem;
- (UIBarButtonItem)rightTitleLabelBarButtonItem;
- (UIImage)finalArtworkImage;
- (UIImage)rawArtworkImage;
- (UIImageView)artworkView;
- (UILabel)rightTitleLabel;
- (UILongPressGestureRecognizer)fastForwardButtonLongPressRecognizer;
- (UILongPressGestureRecognizer)leftButtonLongPressRecognizer;
- (UILongPressGestureRecognizer)leftNudgeLongPressRecognizer;
- (UILongPressGestureRecognizer)rightNudgeLongPressRecognizer;
- (UIStackView)audioSessionRenderingModeView;
- (UITapGestureRecognizer)backPressRecognizer;
- (UITapGestureRecognizer)knobPressRecognizer;
- (UITapGestureRecognizer)leftNudgePressRecognizer;
- (UITapGestureRecognizer)rightNudgePressRecognizer;
- (UIVisualEffectView)artworkVisualEffectView;
- (id)_installedFullBackgroundArtworkViewBelowView:(id)a3;
- (id)_upNextBarButtonItem;
- (id)preferredFocusEnvironments;
- (void)_adjustRightTitleLabelToFit;
- (void)_albumArtistButtonTapped:(id)a3;
- (void)_attributionButtonTapped:(id)a3;
- (void)_backButtonTapped:(id)a3;
- (void)_deactivateStatusBarStyleOverrideIfNecessaryForScene:(id)a3;
- (void)_fastForwardButtonLongPress:(id)a3;
- (void)_fastForwardButtonTouchDown:(id)a3;
- (void)_fastForwardButtonTouchUp:(id)a3;
- (void)_initializeTransportControls;
- (void)_leftButtonLongPress:(id)a3;
- (void)_leftButtonTouchDown:(id)a3;
- (void)_leftButtonTouchUp:(id)a3;
- (void)_leftNudgePress:(id)a3;
- (void)_playPauseButtonTouchDown:(id)a3;
- (void)_playPauseButtonTouchUp:(id)a3;
- (void)_recalculateLayout:(BOOL)a3;
- (void)_reloadDataForcingLayout:(BOOL)a3 updateControls:(BOOL)a4;
- (void)_respondToHeldAction;
- (void)_rightNudgePress:(id)a3;
- (void)_sceneDidActivate:(id)a3;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_sendAction:(int64_t)a3 withState:(int64_t)a4;
- (void)_sendHeldAction;
- (void)_setNowPlayingNavBarActive:(BOOL)a3;
- (void)_setStatusBarOverrideActive:(BOOL)a3;
- (void)_updateArtworkIfNeeded:(id)a3 placeholder:(id)a4;
- (void)_updateAudioFormatContentInfo:(id)a3;
- (void)_updateButtonAXLabelsForButtons:(id)a3;
- (void)_updatePlayModesState;
- (void)_updatePlaybackRate;
- (void)_updateRepeatStateWithType:(int64_t)a3;
- (void)_updateShuffleAndRepeatButtons;
- (void)_updateShuffleStateWithType:(int64_t)a3;
- (void)_updateTransportControl:(id)a3 withDefaultImage:(id)a4 actionType:(int64_t)a5;
- (void)dealloc;
- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4;
- (void)playModeControlView:(id)a3 didSelectButton:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reloadData;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityIndicatorBarButtonItem:(id)a3;
- (void)setArtworkOperationQueue:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setArtworkVisualEffectView:(id)a3;
- (void)setAudioFormatController:(id)a3;
- (void)setAudioSessionRenderingModeView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFastForwardButtonLongPressRecognizer:(id)a3;
- (void)setFinalArtworkImage:(id)a3;
- (void)setForwardTransportButtonImageIdentifier:(id)a3;
- (void)setLeftButtonLongPressRecognizer:(id)a3;
- (void)setLeftNudgeLongPressRecognizer:(id)a3;
- (void)setLeftNudgePressRecognizer:(id)a3;
- (void)setNowPlayingSizeConstraints:(id)a3;
- (void)setNowPlayingView:(id)a3;
- (void)setPlayPauseTransportButtonImageIdentifier:(id)a3;
- (void)setPlaybackQueueBarButtonItem:(id)a3;
- (void)setPreviousTransportButtonImageIdentifier:(id)a3;
- (void)setRawArtworkImage:(id)a3;
- (void)setRightNudgeLongPressRecognizer:(id)a3;
- (void)setRightNudgePressRecognizer:(id)a3;
- (void)setRightTitle:(id)a3;
- (void)setRightTitleLabel:(id)a3;
- (void)setRightTitleLabelBarButtonItem:(id)a3;
- (void)setStatusBarStyleAssertion:(id)a3;
- (void)setUiTimer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)upNextButtonTapped:(id)a3;
- (void)updatePlayControls;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPUINowPlayingViewController

- (CPUINowPlayingViewController)initWithBundleIdentifier:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CPUINowPlayingViewController;
  v12 = [(CPUINowPlayingViewController *)&v30 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_dataSource, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a3);
    nowPlayingSizeConstraints = v13->_nowPlayingSizeConstraints;
    v13->_nowPlayingSizeConstraints = (NSArray *)MEMORY[0x263EFFA68];

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    artworkOperationQueue = v13->_artworkOperationQueue;
    v13->_artworkOperationQueue = v15;

    [(NSOperationQueue *)v13->_artworkOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v13->_artworkOperationQueue setName:@"Now Playing Artwork Queue"];
    [(NSOperationQueue *)v13->_artworkOperationQueue setQualityOfService:33];
    v17 = [CPUINowPlayingView alloc];
    uint64_t v18 = -[CPUINowPlayingView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    nowPlayingView = v13->_nowPlayingView;
    v13->_nowPlayingView = (CPUINowPlayingView *)v18;

    v20 = [(CPUINowPlayingView *)v13->_nowPlayingView songDetailsView];
    v21 = [v20 albumArtistLabelButton];
    [v21 addTarget:v13 action:sel__albumArtistButtonTapped_ forControlEvents:64];

    v22 = [(CPUINowPlayingView *)v13->_nowPlayingView songDetailsView];
    v23 = [v22 attributionButton];
    [v23 addTarget:v13 action:sel__attributionButtonTapped_ forControlEvents:64];

    v24 = [(CPUINowPlayingView *)v13->_nowPlayingView playModeControlView];
    [v24 setDelegate:v13];

    uint64_t v25 = [objc_alloc(MEMORY[0x263F31580]) initWithInterfaceStyle:2 colorVariant:-1];
    statusBarStyleAssertion = v13->_statusBarStyleAssertion;
    v13->_statusBarStyleAssertion = (CRSUIStatusBarStyleAssertion *)v25;

    v27 = (MRNowPlayingAudioFormatController *)objc_alloc_init(MEMORY[0x263F548E0]);
    audioFormatController = v13->_audioFormatController;
    v13->_audioFormatController = v27;

    [(MRNowPlayingAudioFormatController *)v13->_audioFormatController setDelegate:v13];
    [(CPUINowPlayingViewController *)v13 _updateAudioFormatContentInfo:0];
  }

  return v13;
}

- (void)dealloc
{
  [(CRSUIStatusBarStyleAssertion *)self->_statusBarStyleAssertion invalidate];
  statusBarStyleAssertion = self->_statusBarStyleAssertion;
  self->_statusBarStyleAssertion = 0;

  [(NSTimer *)self->_uiTimer invalidate];
  uiTimer = self->_uiTimer;
  self->_uiTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)CPUINowPlayingViewController;
  [(CPUINowPlayingViewController *)&v5 dealloc];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(CPUINowPlayingViewController *)self reloadData];
    objc_super v5 = obj;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CPUINowPlayingViewController *)self reloadData];
    objc_super v5 = obj;
  }
}

- (void)reloadData
{
}

- (void)playModeControlView:(id)a3 didSelectButton:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  id v7 = [v25 shuffleButton];
  if (v7 == v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 nowPlayingViewControllerToggleShuffle:self];
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v11 = [v25 repeatButton];
  if (v11 == v6)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 nowPlayingViewControllerToggleRepeat:self];
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v14 = [v25 moreButton];
  if (v14 == v6)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 nowPlayingViewControllerMore:self];
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v17 = [v25 addToLibraryButton];
  if (v17 == v6)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 nowPlayingViewControllerAddToLibrary:self];
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v20 = [v25 playbackRateButton];
  if (v20 == v6)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 nowPlayingViewControllerChangePlaybackRate:self];
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v23 = objc_loadWeakRetained((id *)&self->_delegate);
  char v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) == 0) {
    goto LABEL_24;
  }
  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  [v10 nowPlayingViewController:self didSelectButton:v6];
LABEL_23:

LABEL_24:
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPUINowPlayingViewController;
  [(CPUINowPlayingViewController *)&v7 viewWillAppear:a3];
  [(CPUINowPlayingViewController *)self _setNowPlayingNavBarActive:1];
  [(CPUINowPlayingViewController *)self _setStatusBarOverrideActive:1];
  v4 = [(CPUINowPlayingViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CPUINowPlayingViewController *)self delegate];
    [v6 nowPlayingViewControllerWillAppear:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPUINowPlayingViewController;
  [(CPUINowPlayingViewController *)&v4 viewWillDisappear:a3];
  [(CPUINowPlayingViewController *)self _setStatusBarOverrideActive:0];
  [(CPUINowPlayingViewController *)self _setNowPlayingNavBarActive:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPUINowPlayingViewController;
  [(CPUINowPlayingViewController *)&v5 viewDidDisappear:a3];
  [(CPUINowPlayingViewController *)self _setNowPlayingNavBarActive:0];
  objc_super v4 = [(CPUINowPlayingViewController *)self uiTimer];
  [v4 invalidate];

  [(CPUINowPlayingViewController *)self setUiTimer:0];
}

- (void)viewDidLoad
{
  v72[1] = *MEMORY[0x263EF8340];
  v70.receiver = self;
  v70.super_class = (Class)CPUINowPlayingViewController;
  [(CPUINowPlayingViewController *)&v70 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] tableBackgroundColor];
  objc_super v4 = [(CPUINowPlayingViewController *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = [(CPUINowPlayingViewController *)self view];
  [v5 setAccessibilityIdentifier:@"CPNowPlayingView"];

  id v6 = [(CPUINowPlayingViewController *)self _installedFullBackgroundArtworkViewBelowView:0];
  artworkView = self->_artworkView;
  self->_artworkView = v6;

  v69 = [MEMORY[0x263F824D8] effectWithStyle:10];
  v8 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x263F82E50]);
  artworkVisualEffectView = self->_artworkVisualEffectView;
  self->_artworkVisualEffectView = v8;

  v72[0] = v69;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:1];
  [(UIVisualEffectView *)self->_artworkVisualEffectView setBackgroundEffects:v10];

  [(UIVisualEffectView *)self->_artworkVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [(CPUINowPlayingViewController *)self view];
  [v11 addSubview:self->_artworkVisualEffectView];

  v61 = (void *)MEMORY[0x263F08938];
  v67 = [(UIVisualEffectView *)self->_artworkVisualEffectView topAnchor];
  v68 = [(CPUINowPlayingViewController *)self view];
  v66 = [v68 topAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v71[0] = v65;
  v63 = [(UIVisualEffectView *)self->_artworkVisualEffectView bottomAnchor];
  v64 = [(CPUINowPlayingViewController *)self view];
  v62 = [v64 bottomAnchor];
  v60 = [v63 constraintEqualToAnchor:v62];
  v71[1] = v60;
  id v12 = [(UIVisualEffectView *)self->_artworkVisualEffectView leadingAnchor];
  char v13 = [(CPUINowPlayingViewController *)self view];
  id v14 = [v13 leadingAnchor];
  id v15 = [v12 constraintEqualToAnchor:v14];
  v71[2] = v15;
  char v16 = [(UIVisualEffectView *)self->_artworkVisualEffectView trailingAnchor];
  id v17 = [(CPUINowPlayingViewController *)self view];
  id v18 = [v17 trailingAnchor];
  char v19 = [v16 constraintEqualToAnchor:v18];
  v71[3] = v19;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:4];
  [v61 activateConstraints:v20];

  id v21 = objc_alloc(MEMORY[0x263F828E0]);
  char v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CPUINowPlayingViewController *)self setRightTitleLabel:v22];

  id v23 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  char v24 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v24 setFont:v23];

  id v25 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v25 setLineBreakMode:4];

  v26 = [MEMORY[0x263F825C8] labelColor];
  v27 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v27 setTextColor:v26];

  v28 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v28 setTextAlignment:2];

  v29 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v29 setAlpha:0.0];

  [(CPUINowPlayingViewController *)self _adjustRightTitleLabelToFit];
  objc_super v30 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [(CPUINowPlayingViewController *)self setActivityIndicator:v30];

  v31 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:self->_activityIndicator];
  [(CPUINowPlayingViewController *)self setActivityIndicatorBarButtonItem:v31];

  id v32 = objc_alloc(MEMORY[0x263F824A8]);
  v33 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  v34 = (void *)[v32 initWithCustomView:v33];
  [(CPUINowPlayingViewController *)self setRightTitleLabelBarButtonItem:v34];

  v35 = [(CPUINowPlayingViewController *)self view];
  [v35 addSubview:self->_nowPlayingView];

  v36 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__leftNudgePress_];
  [(CPUINowPlayingViewController *)self setLeftNudgePressRecognizer:v36];

  v37 = [(CPUINowPlayingViewController *)self leftNudgePressRecognizer];
  [v37 setAllowedPressTypes:&unk_26DC1F220];

  nowPlayingView = self->_nowPlayingView;
  v39 = [(CPUINowPlayingViewController *)self leftNudgePressRecognizer];
  [(CPUINowPlayingView *)nowPlayingView addGestureRecognizer:v39];

  v40 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__rightNudgePress_];
  [(CPUINowPlayingViewController *)self setRightNudgePressRecognizer:v40];

  v41 = [(CPUINowPlayingViewController *)self rightNudgePressRecognizer];
  [v41 setAllowedPressTypes:&unk_26DC1F238];

  v42 = self->_nowPlayingView;
  v43 = [(CPUINowPlayingViewController *)self rightNudgePressRecognizer];
  [(CPUINowPlayingView *)v42 addGestureRecognizer:v43];

  v44 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__leftButtonLongPress_];
  [(CPUINowPlayingViewController *)self setLeftNudgeLongPressRecognizer:v44];

  v45 = [(CPUINowPlayingViewController *)self leftNudgeLongPressRecognizer];
  [v45 setAllowedPressTypes:&unk_26DC1F250];

  v46 = [(CPUINowPlayingViewController *)self leftNudgeLongPressRecognizer];
  v47 = [(CPUINowPlayingViewController *)self leftNudgePressRecognizer];
  [v46 requireGestureRecognizerToFail:v47];

  v48 = self->_nowPlayingView;
  v49 = [(CPUINowPlayingViewController *)self leftNudgeLongPressRecognizer];
  [(CPUINowPlayingView *)v48 addGestureRecognizer:v49];

  v50 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__fastForwardButtonLongPress_];
  [(CPUINowPlayingViewController *)self setRightNudgeLongPressRecognizer:v50];

  v51 = [(CPUINowPlayingViewController *)self rightNudgeLongPressRecognizer];
  [v51 setAllowedPressTypes:&unk_26DC1F268];

  v52 = [(CPUINowPlayingViewController *)self rightNudgeLongPressRecognizer];
  v53 = [(CPUINowPlayingViewController *)self rightNudgePressRecognizer];
  [v52 requireGestureRecognizerToFail:v53];

  v54 = self->_nowPlayingView;
  v55 = [(CPUINowPlayingViewController *)self rightNudgeLongPressRecognizer];
  [(CPUINowPlayingView *)v54 addGestureRecognizer:v55];

  [(CPUINowPlayingViewController *)self _initializeTransportControls];
  [(CPUINowPlayingViewController *)self setOverrideUserInterfaceStyle:2];
  v56 = [MEMORY[0x263F08A00] defaultCenter];
  [v56 addObserver:self selector:sel__sceneWillEnterForeground_ name:*MEMORY[0x263F83958] object:0];

  v57 = [MEMORY[0x263F08A00] defaultCenter];
  [v57 addObserver:self selector:sel__sceneDidActivate_ name:*MEMORY[0x263F83928] object:0];

  v58 = [MEMORY[0x263F08A00] defaultCenter];
  [v58 addObserver:self selector:sel__sceneWillDeactivate_ name:*MEMORY[0x263F83950] object:0];

  v59 = [MEMORY[0x263F08A00] defaultCenter];
  [v59 addObserver:self selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x263F83930] object:0];
}

- (void)_backButtonTapped:(id)a3
{
  id v4 = [(CPUINowPlayingViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)setRightTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v5 setText:v4];

  [(CPUINowPlayingViewController *)self _adjustRightTitleLabelToFit];
}

- (void)_adjustRightTitleLabelToFit
{
  id v3 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v3 sizeToFit];

  id v4 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;

  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  double Width = CGRectGetWidth(v24);
  id v14 = [(CPUINowPlayingViewController *)self view];
  [v14 frame];
  double v15 = CGRectGetWidth(v25) * 0.6;

  if (Width > v15) {
    double Width = v15;
  }
  char v16 = [(CPUINowPlayingViewController *)self rightTitleLabel];
  [v16 frame];
  v27.origin.x = v17;
  v27.origin.y = v18;
  v27.size.width = v19;
  v27.size.height = v20;
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = Width;
  v26.size.height = v12;
  BOOL v21 = CGRectEqualToRect(v26, v27);

  if (!v21)
  {
    id v22 = [(CPUINowPlayingViewController *)self rightTitleLabel];
    objc_msgSend(v22, "setFrame:", v6, v8, Width, v12);
  }
}

- (CPUITransportControlView)transportControlView
{
  v2 = [(CPUINowPlayingViewController *)self nowPlayingView];
  id v3 = [v2 transportControlView];

  return (CPUITransportControlView *)v3;
}

- (CPUIPlayModeControlView)playModeControlView
{
  v2 = [(CPUINowPlayingViewController *)self nowPlayingView];
  id v3 = [v2 playModeControlView];

  return (CPUIPlayModeControlView *)v3;
}

- (CPUISongDetailsView)songDetailsView
{
  v2 = [(CPUINowPlayingViewController *)self nowPlayingView];
  id v3 = [v2 songDetailsView];

  return (CPUISongDetailsView *)v3;
}

- (id)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(CPUINowPlayingViewController *)self transportControlView];
  id v3 = [v2 playPauseButton];

  if (v3)
  {
    v6[0] = v3;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (void)_setStatusBarOverrideActive:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__CPUINowPlayingViewController__setStatusBarOverrideActive___block_invoke;
  v3[3] = &unk_26482D348;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __60__CPUINowPlayingViewController__setStatusBarOverrideActive___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v2 = objc_msgSend(MEMORY[0x263F29BC8], "settingsWithDuration:timingFunction:", 0.35);
  id v3 = [*(id *)(a1 + 32) statusBarStyleAssertion];
  int v4 = [v3 isValid];

  int v5 = *(unsigned __int8 *)(a1 + 40);
  if (v5 != v4)
  {
    double v6 = [*(id *)(a1 + 32) statusBarStyleAssertion];
    double v7 = v6;
    if (v5) {
      [v6 acquireWithAnimationSettings:v2];
    }
    else {
      [v6 relinquishWithAnimationSettings:v2];
    }
  }
}

- (void)_setNowPlayingNavBarActive:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [(CPUINowPlayingViewController *)self navigationController];
  id v11 = [v4 navigationBar];

  if (v3)
  {
    [v11 setBarStyle:4];
    [v11 setOverrideUserInterfaceStyle:2];
    int v5 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    double v6 = [v11 layer];
    [v6 setCompositingFilter:v5];

    double v7 = [v11 layer];
    id v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    [v11 setBarStyle:0];
    [v11 setOverrideUserInterfaceStyle:0];
    CGFloat v10 = [v11 layer];
    [v10 setCompositingFilter:0];

    double v7 = [v11 layer];
    id v8 = v7;
    uint64_t v9 = 0;
  }
  [v7 setAllowsGroupBlending:v9];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPUINowPlayingViewController;
  [(CPUINowPlayingViewController *)&v4 traitCollectionDidChange:a3];
  [(CPUINowPlayingViewController *)self _reloadDataForcingLayout:1 updateControls:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CPUINowPlayingViewController;
  [(CPUINowPlayingViewController *)&v3 viewDidLayoutSubviews];
  [(CPUINowPlayingViewController *)self _recalculateLayout:0];
}

- (void)_recalculateLayout:(BOOL)a3
{
  BOOL v3 = a3;
  v75[4] = *MEMORY[0x263EF8340];
  int v5 = [(CPUINowPlayingViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 3)
  {
    double v7 = [(CPUINowPlayingViewController *)self delegate];
    uint64_t v8 = [v7 nowPlayingViewControllerCanShowAlbumArt:self];

    uint64_t v9 = [(CPUINowPlayingViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      CGFloat v10 = [(CPUINowPlayingViewController *)self delegate];
      uint64_t v11 = [v10 nowPlayingViewControllerIsRightHandDrive:self];
    }
    else
    {
      uint64_t v11 = 0;
    }

    double v12 = [(CPUINowPlayingViewController *)self nowPlayingView];
    char v13 = [(CPUINowPlayingViewController *)self dataSource];
    id v14 = [(CPUINowPlayingViewController *)self view];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    id v23 = [(CPUINowPlayingViewController *)self view];
    CGRect v24 = [v23 safeAreaLayoutGuide];
    [v24 layoutFrame];
    objc_msgSend(v12, "recalculateLayout:allowsAlbumArt:hasDataSource:viewArea:safeArea:rightHandDrive:", v3, v8, v13 != 0, v11, v16, v18, v20, v22, v25, v26, v27, v28);

    unint64_t v29 = 0x263F08000uLL;
    [MEMORY[0x263F08938] deactivateConstraints:self->_nowPlayingSizeConstraints];
    objc_super v30 = [(CPUINowPlayingViewController *)self nowPlayingView];
    v31 = [v30 nowPlayingLayout];
    [v31 maximumNowPlayingSize];
    double v33 = v32;
    double v35 = v34;

    if (v33 == *MEMORY[0x263F001B0] && v35 == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      v64 = [(CPUINowPlayingView *)self->_nowPlayingView topAnchor];
      v65 = [(CPUINowPlayingViewController *)self view];
      v73 = [v65 topAnchor];
      v72 = objc_msgSend(v64, "constraintEqualToAnchor:");
      v74[0] = v72;
      v36 = [(CPUINowPlayingView *)self->_nowPlayingView bottomAnchor];
      objc_super v70 = [(CPUINowPlayingViewController *)self view];
      [v70 bottomAnchor];
      v69 = v71 = v36;
      v68 = objc_msgSend(v36, "constraintEqualToAnchor:");
      v74[1] = v68;
      v37 = [(CPUINowPlayingView *)self->_nowPlayingView leadingAnchor];
      v66 = [(CPUINowPlayingViewController *)self view];
      v38 = [v66 safeAreaLayoutGuide];
      v39 = [v38 leadingAnchor];
      v67 = v37;
      v40 = [v37 constraintEqualToAnchor:v39];
      v74[2] = v40;
      v41 = [(CPUINowPlayingView *)self->_nowPlayingView trailingAnchor];
      v42 = [(CPUINowPlayingViewController *)self view];
      v43 = [v42 safeAreaLayoutGuide];
      v44 = [v43 trailingAnchor];
      v45 = [v41 constraintEqualToAnchor:v44];
      v74[3] = v45;
      v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:4];
      nowPlayingSizeConstraints = self->_nowPlayingSizeConstraints;
      self->_nowPlayingSizeConstraints = v46;

      v48 = v65;
      v49 = v64;

      unint64_t v29 = 0x263F08000;
    }
    else
    {
      v50 = [(CPUINowPlayingViewController *)self view];
      v51 = [v50 safeAreaLayoutGuide];
      [v51 layoutFrame];
      CGFloat v53 = v52;
      CGFloat v55 = v54;
      CGFloat v57 = v56;
      CGFloat v59 = v58;

      v49 = [(CPUINowPlayingView *)self->_nowPlayingView centerXAnchor];
      v48 = [(CPUINowPlayingViewController *)self view];
      v73 = [v48 safeAreaLayoutGuide];
      v72 = [v73 centerXAnchor];
      v71 = objc_msgSend(v49, "constraintEqualToAnchor:");
      v75[0] = v71;
      v60 = [(CPUINowPlayingView *)self->_nowPlayingView centerYAnchor];
      v69 = [(CPUINowPlayingViewController *)self view];
      v68 = [v69 safeAreaLayoutGuide];
      [v68 centerYAnchor];
      v67 = objc_super v70 = v60;
      v66 = objc_msgSend(v60, "constraintEqualToAnchor:");
      v75[1] = v66;
      v38 = [(CPUINowPlayingView *)self->_nowPlayingView widthAnchor];
      v76.origin.x = v53;
      v76.origin.y = v55;
      v76.size.width = v57;
      v76.size.height = v59;
      double Width = CGRectGetWidth(v76);
      if (Width >= v33) {
        double Width = v33;
      }
      v39 = [v38 constraintEqualToConstant:Width];
      v75[2] = v39;
      v40 = [(CPUINowPlayingView *)self->_nowPlayingView heightAnchor];
      v77.origin.x = v53;
      v77.origin.y = v55;
      v77.size.width = v57;
      v77.size.height = v59;
      double Height = CGRectGetHeight(v77);
      if (Height >= v35) {
        double Height = v35;
      }
      v41 = [v40 constraintEqualToConstant:Height];
      v75[3] = v41;
      v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:4];
      v42 = self->_nowPlayingSizeConstraints;
      self->_nowPlayingSizeConstraints = v63;
    }

    [*(id *)(v29 + 2360) activateConstraints:self->_nowPlayingSizeConstraints];
  }
}

- (BOOL)_showsButtonSelectionsForTouch
{
  v2 = [(CPUINowPlayingViewController *)self view];
  BOOL v3 = [v2 window];
  objc_super v4 = [v3 screen];

  if (v4) {
    int v5 = [v4 supportsFocus] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)updatePlayControls
{
  BOOL v3 = [(CPUINowPlayingView *)self->_nowPlayingView transportControlView];
  objc_super v4 = [(CPUINowPlayingView *)self->_nowPlayingView progressView];
  int v5 = [v3 leftButton];
  uint64_t v6 = [v3 defaultLeftButtonImage];
  [(CPUINowPlayingViewController *)self _updateTransportControl:v5 withDefaultImage:v6 actionType:0];

  double v7 = [v3 playPauseButton];
  [(CPUINowPlayingViewController *)self _updateTransportControl:v7 withDefaultImage:0 actionType:2];

  uint64_t v8 = [v3 fastForwardButton];
  uint64_t v9 = [v3 defaultFastForwardButtonImage];
  [(CPUINowPlayingViewController *)self _updateTransportControl:v8 withDefaultImage:v9 actionType:1];

  CGFloat v10 = [(CPUINowPlayingViewController *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v10 progressBarArtworkImageForNowPlayingViewController:self],
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v12 = (void *)v11;
    [v4 setHidden:1];
    char v13 = [(CPUINowPlayingView *)self->_nowPlayingView progressImageView];
    [v13 setHidden:0];

    id v14 = [(CPUINowPlayingView *)self->_nowPlayingView progressImageView];
    [v14 setImage:v12];
  }
  else
  {
    double v15 = [(CPUINowPlayingView *)self->_nowPlayingView progressImageView];
    [v15 setHidden:1];

    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    if (v10) {
      [v10 durationSnapshotForNowPlayingViewController:self];
    }
    v18[0] = v20;
    v18[1] = v21;
    v18[2] = v22;
    uint64_t v19 = v23;
    [v4 setDurationSnapshot:v18];
    if (objc_opt_respondsToSelector())
    {
      double v12 = [v10 progressBarLocalizedDurationStringForNowPlayingViewController:self];
    }
    else
    {
      double v12 = 0;
    }
    [v4 updateLocalizedDurationString:v12];
    BOOL v17 = *((double *)&v21 + 1) == 0.0 && v23 == 0;
    objc_msgSend(v4, "setHidden:", v17, *((double *)&v21 + 1));
  }

  objc_msgSend(v3, "setProgressActive:", objc_msgSend(v10, "nowPlayingViewControllerIsPlaying:", self));
  [(CPUINowPlayingViewController *)self _updatePlayModesState];
}

- (void)_updatePlayModesState
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && (id v6 = objc_loadWeakRetained((id *)p_delegate),
        int v7 = [v6 nowPlayingViewControllerCanShuffle:self],
        v6,
        v7))
  {
    id v8 = objc_loadWeakRetained((id *)&self->_dataSource);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_dataSource);
      uint64_t v11 = [v10 shuffleTypeForNowPlayingViewController:self];

      [(CPUINowPlayingViewController *)self _updateShuffleStateWithType:v11];
    }
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  id v13 = objc_loadWeakRetained((id *)p_delegate);
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0
    && (id v15 = objc_loadWeakRetained((id *)p_delegate),
        int v16 = [v15 nowPlayingViewControllerCanRepeat:self],
        v15,
        v16))
  {
    id v17 = objc_loadWeakRetained((id *)&self->_dataSource);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_dataSource);
      uint64_t v20 = [v19 repeatTypeForNowPlayingViewController:self];

      [(CPUINowPlayingViewController *)self _updateRepeatStateWithType:v20];
    }
    int v21 = 1;
  }
  else
  {
    int v21 = 0;
  }
  id v22 = objc_loadWeakRetained((id *)p_delegate);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = objc_loadWeakRetained((id *)p_delegate);
    int v25 = [v24 nowPlayingViewControllerCanShowMore:self];
  }
  else
  {
    int v25 = 0;
  }
  id v26 = objc_loadWeakRetained((id *)p_delegate);
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    id v28 = objc_loadWeakRetained((id *)p_delegate);
    int v29 = [v28 nowPlayingViewControllerCanShowAddToLibrary:self];
  }
  else
  {
    int v29 = 0;
  }
  id v30 = objc_loadWeakRetained((id *)p_delegate);
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    id v32 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v33 = [v32 nowPlayingViewControllerIsFuseSubscriber:self];
  }
  else
  {
    uint64_t v33 = 0;
  }
  id v34 = objc_loadWeakRetained((id *)p_delegate);
  char v35 = objc_opt_respondsToSelector();

  if (v35)
  {
    id v36 = objc_loadWeakRetained((id *)p_delegate);
    int v37 = [v36 nowPlayingViewControllerCanShowChangePlaybackRate:self];

    [(CPUINowPlayingViewController *)self _updatePlaybackRate];
  }
  else
  {
    int v37 = 0;
  }
  v38 = [(CPUINowPlayingView *)self->_nowPlayingView playModeControlView];
  v39 = [v38 shuffleButton];
  [v39 setHidden:v12 ^ 1u];

  v40 = [v38 repeatButton];
  [v40 setHidden:v21 ^ 1u];

  v41 = [v38 moreButton];
  [v41 setHidden:v25 ^ 1u];

  v42 = [v38 addToLibraryButton];
  [v42 setHidden:v29 ^ 1u];

  [v38 setFuseSubscriberLayout:v33];
  v43 = [v38 playbackRateButton];
  [v43 setHidden:v37 ^ 1u];

  v44 = CarPlayUIGeneralLogging();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45[0] = 67110144;
    v45[1] = v12;
    __int16 v46 = 1024;
    int v47 = v21;
    __int16 v48 = 1024;
    int v49 = v25;
    __int16 v50 = 1024;
    int v51 = v29;
    __int16 v52 = 1024;
    int v53 = v37;
    _os_log_impl(&dword_227AC2000, v44, OS_LOG_TYPE_DEFAULT, "Shuffle: %d Repeat: %d Show CTA: %d Bookmark: %d Change Playback Rate: %d", (uint8_t *)v45, 0x20u);
  }

  [v38 layoutSubviews];
}

- (void)_updateRepeatStateWithType:(int64_t)a3
{
  char v5 = [(CPUINowPlayingViewController *)self nowPlayingView];
  id v6 = [v5 playModeControlView];
  id v7 = [v6 repeatButton];

  [v7 setRepeatType:a3];
  if ((((a3 == 0) ^ [v7 isSelected]) & 1) == 0) {
    [(CPUINowPlayingViewController *)self _updateShuffleAndRepeatButtons];
  }
}

- (void)_updateShuffleStateWithType:(int64_t)a3
{
  char v5 = [(CPUINowPlayingViewController *)self nowPlayingView];
  id v6 = [v5 playModeControlView];
  id v7 = [v6 shuffleButton];

  if ((((a3 == 0) ^ [v7 isSelected]) & 1) == 0) {
    [(CPUINowPlayingViewController *)self _updateShuffleAndRepeatButtons];
  }
}

- (void)_updateShuffleAndRepeatButtons
{
  BOOL v3 = [(CPUINowPlayingViewController *)self nowPlayingView];
  objc_super v4 = [v3 playModeControlView];
  char v5 = [v4 shuffleButton];

  id v6 = [(CPUINowPlayingViewController *)self nowPlayingView];
  id v7 = [v6 playModeControlView];
  id v8 = [v7 repeatButton];

  char v9 = [(CPUINowPlayingViewController *)self uiTimer];

  if (v9)
  {
    id v10 = [(CPUINowPlayingViewController *)self uiTimer];
    [v10 invalidate];

    uint64_t v11 = CarPlayUIGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_227AC2000, v11, OS_LOG_TYPE_DEFAULT, "UI Timer invalidated", (uint8_t *)buf, 2u);
    }
  }
  int v12 = CarPlayUIGeneralLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_227AC2000, v12, OS_LOG_TYPE_DEFAULT, "UI Timer created", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v13 = (void *)MEMORY[0x263EFFA20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__CPUINowPlayingViewController__updateShuffleAndRepeatButtons__block_invoke;
  v17[3] = &unk_26482D5F8;
  objc_copyWeak(&v20, buf);
  id v14 = v5;
  id v18 = v14;
  id v15 = v8;
  id v19 = v15;
  int v16 = [v13 scheduledTimerWithTimeInterval:0 repeats:v17 block:0.1];
  [(CPUINowPlayingViewController *)self setUiTimer:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
}

void __62__CPUINowPlayingViewController__updateShuffleAndRepeatButtons__block_invoke(id *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && [v3 isValid])
  {
    char v5 = CarPlayUIGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_227AC2000, v5, OS_LOG_TYPE_DEFAULT, "UI Timer executed", (uint8_t *)&v12, 2u);
    }

    id v6 = [WeakRetained dataSource];
    uint64_t v7 = [v6 shuffleTypeForNowPlayingViewController:WeakRetained];

    if ((v7 != 0) != [a1[4] isSelected])
    {
      id v8 = CarPlayUIGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 67109120;
        BOOL v13 = v7 != 0;
        _os_log_impl(&dword_227AC2000, v8, OS_LOG_TYPE_DEFAULT, "UI Timer set shuffle selected: %i", (uint8_t *)&v12, 8u);
      }

      [a1[4] setSelected:v7 != 0];
    }
    char v9 = [WeakRetained dataSource];
    uint64_t v10 = [v9 repeatTypeForNowPlayingViewController:WeakRetained];

    if ((v10 != 0) != [a1[5] isSelected])
    {
      uint64_t v11 = CarPlayUIGeneralLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 67109120;
        BOOL v13 = v10 != 0;
        _os_log_impl(&dword_227AC2000, v11, OS_LOG_TYPE_DEFAULT, "UI Timer set repeat selected: %i", (uint8_t *)&v12, 8u);
      }

      [a1[5] setSelected:v10 != 0];
    }
  }
}

- (void)_updatePlaybackRate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(CPUINowPlayingViewController *)self nowPlayingView];
  objc_super v4 = [v3 playModeControlView];
  char v5 = [v4 playbackRateButton];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = [v8 nowPlayingViewControllerGetPlaybackRate:self];

    uint64_t v10 = CPUIFormattedPlaybackRateString(v9);
    [v5 setTitle:v10 forState:0];
    uint64_t v11 = CPUIAccessiblePlaybackRateString(v9);
    id v15 = v11;
    int v12 = CPUILocalizedStringForKey(@"ACCESSIBLE_PLAYBACK_SPEED");
    int v16 = v12;
    BOOL v13 = CPUILocalizedStringForKey(@"ACCESSIBLE_PLAYBACK_RATE");
    id v17 = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:3];
    objc_msgSend(v5, "setAccessibilityUserInputLabels:", v14, v15, v16);
  }
}

- (void)_sendAction:(int64_t)a3 withState:(int64_t)a4
{
  id v7 = [(CPUINowPlayingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 nowPlayingViewController:self didSendAction:a3 state:a4];
  }
}

- (void)_playPauseButtonTouchDown:(id)a3
{
  id v4 = a3;
  if ([(CPUINowPlayingViewController *)self _showsButtonSelectionsForTouch]) {
    [v4 setSelected:1];
  }
}

- (void)_playPauseButtonTouchUp:(id)a3
{
  id v4 = a3;
  if ([(CPUINowPlayingViewController *)self _showsButtonSelectionsForTouch]) {
    [v4 setSelected:0];
  }
  [(CPUINowPlayingViewController *)self _sendAction:2 withState:2];
}

- (void)_respondToHeldAction
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  int64_t heldAction = self->_heldAction;
  [(CPUINowPlayingViewController *)self _sendAction:heldAction withState:1];
}

- (void)_sendHeldAction
{
  self->_int64_t heldAction = -1;
}

- (void)_leftButtonTouchDown:(id)a3
{
  id v4 = a3;
  if ([(CPUINowPlayingViewController *)self _showsButtonSelectionsForTouch]) {
    [v4 setSelected:1];
  }
  self->_int64_t heldAction = 0;
  [(CPUINowPlayingViewController *)self performSelector:sel__respondToHeldAction withObject:0 afterDelay:0.5];
}

- (void)_leftButtonTouchUp:(id)a3
{
  id v4 = a3;
  if ([(CPUINowPlayingViewController *)self _showsButtonSelectionsForTouch]) {
    [v4 setSelected:0];
  }
  [(CPUINowPlayingViewController *)self _sendHeldAction];
}

- (void)_leftButtonLongPress:(id)a3
{
  if ([a3 state] == 1)
  {
    uint64_t v4 = 1;
  }
  else
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__respondToHeldAction object:0];
    uint64_t v4 = 2;
  }
  [(CPUINowPlayingViewController *)self _sendAction:0 withState:v4];
}

- (void)_leftNudgePress:(id)a3
{
}

- (void)_fastForwardButtonTouchDown:(id)a3
{
  id v4 = a3;
  if ([(CPUINowPlayingViewController *)self _showsButtonSelectionsForTouch]) {
    [v4 setSelected:1];
  }
  self->_int64_t heldAction = 1;
  [(CPUINowPlayingViewController *)self performSelector:sel__respondToHeldAction withObject:0 afterDelay:0.5];
}

- (void)_fastForwardButtonTouchUp:(id)a3
{
  id v4 = a3;
  if ([(CPUINowPlayingViewController *)self _showsButtonSelectionsForTouch]) {
    [v4 setSelected:0];
  }
  [(CPUINowPlayingViewController *)self _sendHeldAction];
}

- (void)_rightNudgePress:(id)a3
{
}

- (void)_fastForwardButtonLongPress:(id)a3
{
  if ([a3 state] == 1)
  {
    uint64_t v4 = 1;
  }
  else
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__respondToHeldAction object:0];
    uint64_t v4 = 2;
  }
  [(CPUINowPlayingViewController *)self _sendAction:1 withState:v4];
}

- (void)_albumArtistButtonTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 nowPlayingViewControllerAlbumArtistButtonTapped:self];
  }
}

- (void)_attributionButtonTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 nowPlayingViewControllerAttributionButtonTapped:self];
  }
}

- (void)upNextButtonTapped:(id)a3
{
  uint64_t v4 = [(CPUINowPlayingViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CPUINowPlayingViewController *)self delegate];
    [v6 nowPlayingViewControllerUpNextButtonTapped:self];
  }
}

- (void)_initializeTransportControls
{
  id v17 = [(CPUINowPlayingView *)self->_nowPlayingView transportControlView];
  id v3 = [v17 playPauseButton];
  [v3 addTarget:self action:sel__playPauseButtonTouchDown_ forControlEvents:1];

  uint64_t v4 = [v17 playPauseButton];
  [v4 addTarget:self action:sel__playPauseButtonTouchUp_ forControlEvents:448];

  char v5 = [v17 leftButton];
  [v5 addTarget:self action:sel__leftButtonTouchDown_ forControlEvents:1];

  id v6 = [v17 leftButton];
  [v6 addTarget:self action:sel__leftButtonTouchUp_ forControlEvents:448];

  id v7 = [v17 fastForwardButton];
  [v7 addTarget:self action:sel__fastForwardButtonTouchDown_ forControlEvents:1];

  id v8 = [v17 fastForwardButton];
  [v8 addTarget:self action:sel__fastForwardButtonTouchUp_ forControlEvents:448];

  char v9 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__leftButtonLongPress_];
  [(CPUINowPlayingViewController *)self setLeftButtonLongPressRecognizer:v9];

  uint64_t v10 = [(CPUINowPlayingViewController *)self leftButtonLongPressRecognizer];
  [v10 setAllowedPressTypes:&unk_26DC1F280];

  uint64_t v11 = [v17 leftButton];
  int v12 = [(CPUINowPlayingViewController *)self leftButtonLongPressRecognizer];
  [v11 addGestureRecognizer:v12];

  BOOL v13 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__fastForwardButtonLongPress_];
  [(CPUINowPlayingViewController *)self setFastForwardButtonLongPressRecognizer:v13];

  uint64_t v14 = [(CPUINowPlayingViewController *)self fastForwardButtonLongPressRecognizer];
  [v14 setAllowedPressTypes:&unk_26DC1F298];

  id v15 = [v17 fastForwardButton];
  int v16 = [(CPUINowPlayingViewController *)self fastForwardButtonLongPressRecognizer];
  [v15 addGestureRecognizer:v16];
}

- (void)_updateTransportControl:(id)a3 withDefaultImage:(id)a4 actionType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v23 = 0;
  uint64_t v10 = [(CPUINowPlayingViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if ((unint64_t)a5 > 2) {
      id v11 = 0;
    }
    else {
      id v11 = *(id *)((char *)&self->super.super.super.isa + *off_26482D6A8[a5]);
    }
    id v22 = 0;
    int v14 = [v10 nowPlayingViewController:self shouldDisplayButton:a5 withImage:&v22 existingIdentifier:v11 tinted:&v23];
    id v13 = v22;
    uint64_t v12 = v14 ^ 1u;
  }
  else
  {
    uint64_t v12 = 0;
    id v11 = 0;
    id v13 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v10 nowPlayingViewController:self buttonShouldBeActive:a5])
  {
    uint64_t v16 = 0;
    double v15 = 0.3;
  }
  else
  {
    double v15 = 1.0;
    uint64_t v16 = 1;
  }
  [v8 setAlpha:v15];
  [v8 setHidden:v12];
  if (v13)
  {
    uint64_t v17 = 0;
LABEL_15:
    id v19 = [v13 imageWithRenderingMode:v17];

    [v8 setImage:v19 forState:0];
    id v20 = [MEMORY[0x263F825C8] whiteColor];
    int v21 = [v19 imageWithTintColor:v20];
    [v8 setImage:v21 forState:1];

    goto LABEL_16;
  }
  id v18 = v9;
  if (v18)
  {
    id v13 = v18;
    uint64_t v17 = 2;
    goto LABEL_15;
  }
LABEL_16:
  [v8 setSelected:v23];
  [v8 setEnabled:v16];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectsPassingTest:_nonCapturedPressType];
  if ([v7 count])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    [(CPUINowPlayingViewController *)&v8 pressesBegan:v7 withEvent:v6];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectsPassingTest:_nonCapturedPressType];
  if ([v7 count])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    [(CPUINowPlayingViewController *)&v8 pressesChanged:v7 withEvent:v6];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectsPassingTest:_nonCapturedPressType];
  if ([v7 count])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    [(CPUINowPlayingViewController *)&v8 pressesEnded:v7 withEvent:v6];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectsPassingTest:_nonCapturedPressType];
  if ([v7 count])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    [(CPUINowPlayingViewController *)&v8 pressesCancelled:v7 withEvent:v6];
  }
}

- (id)_installedFullBackgroundArtworkViewBelowView:(id)a3
{
  v28[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F82828]);
  [v5 setClipsToBounds:1];
  [v5 setContentMode:2];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(CPUINowPlayingViewController *)self view];
  id v7 = v6;
  char v27 = v4;
  if (v4) {
    [v6 insertSubview:v5 belowSubview:v4];
  }
  else {
    [v6 addSubview:v5];
  }

  id v19 = (void *)MEMORY[0x263F08938];
  int v25 = [v5 topAnchor];
  id v26 = [(CPUINowPlayingViewController *)self view];
  id v24 = [v26 topAnchor];
  unsigned __int8 v23 = [v25 constraintEqualToAnchor:v24];
  v28[0] = v23;
  int v21 = [v5 bottomAnchor];
  id v22 = [(CPUINowPlayingViewController *)self view];
  id v20 = [v22 bottomAnchor];
  id v18 = [v21 constraintEqualToAnchor:v20];
  v28[1] = v18;
  objc_super v8 = [v5 leadingAnchor];
  id v9 = [(CPUINowPlayingViewController *)self view];
  uint64_t v10 = [v9 leadingAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v28[2] = v11;
  uint64_t v12 = [v5 trailingAnchor];
  id v13 = [(CPUINowPlayingViewController *)self view];
  int v14 = [v13 trailingAnchor];
  double v15 = [v12 constraintEqualToAnchor:v14];
  v28[3] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  [v19 activateConstraints:v16];

  return v5;
}

- (void)_updateArtworkIfNeeded:(id)a3 placeholder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CPUINowPlayingViewController *)self rawArtworkImage];
  id v9 = [(CPUINowPlayingViewController *)self finalArtworkImage];
  uint64_t v10 = [(CPUINowPlayingViewController *)self nowPlayingView];
  id v11 = [v10 artworkViewBrick];

  [v11 setPlaceholderImage:v7];
  if (v6)
  {
    uint64_t v12 = [(CPUINowPlayingViewController *)self artworkOperationQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke;
    v14[3] = &unk_26482D668;
    id v15 = v8;
    id v16 = v6;
    uint64_t v17 = self;
    id v18 = v11;
    [v12 addOperationWithBlock:v14];
  }
  else
  {
    id v13 = [(CPUINowPlayingViewController *)self artworkView];
    [v13 setImage:0];

    [v11 setImage:0];
    [(CPUINowPlayingViewController *)self setFinalArtworkImage:0];
    [(CPUINowPlayingViewController *)self setRawArtworkImage:0];
  }
}

void __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 40) roundingCornersIfSquared];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_2;
    v5[3] = &unk_26482D668;
    id v3 = *(void **)(a1 + 56);
    v5[4] = *(void *)(a1 + 48);
    id v6 = v3;
    id v7 = v2;
    id v8 = *(id *)(a1 + 40);
    id v4 = v2;
    dispatch_sync(MEMORY[0x263EF83A0], v5);
  }
}

void __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) finalArtworkImage];

  [*(id *)(a1 + 40) setImage:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setRawArtworkImage:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setFinalArtworkImage:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 32) artworkView];
  id v4 = v3;
  if (v2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 artworkView];
    id v7 = [v5 _installedFullBackgroundArtworkViewBelowView:v6];

    [v7 setImage:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) setArtworkView:v7];
  }
  else
  {
    [v3 setAlpha:0.0];

    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = [*(id *)(a1 + 32) artworkView];
    [v9 setImage:v8];

    id v7 = [*(id *)(a1 + 32) artworkView];
    id v4 = 0;
  }
  uint64_t v10 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_3;
  v15[3] = &unk_26482D558;
  id v16 = v4;
  id v17 = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_4;
  v13[3] = &unk_26482D640;
  id v14 = v16;
  id v11 = v16;
  id v12 = v7;
  [v10 animateWithDuration:2 delay:v15 options:v13 animations:1.5 completion:0.0];
}

uint64_t __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    double v3 = 0.0;
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    double v3 = 1.0;
  }
  return [v2 setAlpha:v3];
}

void *__67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_4(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result removeFromSuperview];
  }
  return result;
}

- (id)_upNextBarButtonItem
{
  v27[3] = *MEMORY[0x263EF8340];
  double v3 = objc_opt_new();
  id v4 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  uint64_t v5 = [v3 titleLabel];
  [(id)v5 setFont:v4];

  id v6 = [(CPUINowPlayingViewController *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(CPUINowPlayingViewController *)self delegate];
    uint64_t v8 = [v7 titleForUpNextInNowPlayingViewController:self];
    id v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (![v10 length])
  {
    uint64_t v11 = CPUILocalizedStringForKey(@"PLAYBACK_QUEUE_TITLE");

    uint64_t v10 = (void *)v11;
  }
  id v12 = CPUILocalizedStringForKey(@"PLAYBACK_QUEUE_TITLE");
  int v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    [v3 setTitle:0 forState:0];
    id v14 = [MEMORY[0x263F827E8] systemImageNamed:@"list.bullet"];
    [v3 setImage:v14 forState:0];

    id v15 = CPUILocalizedStringForKey(@"LIST");
    v27[0] = v15;
    id v16 = CPUILocalizedStringForKey(@"QUEUE");
    v27[1] = v16;
    id v17 = CPUILocalizedStringForKey(@"PLAYBACK_QUEUE_TITLE");
    v27[2] = v17;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    [v3 setAccessibilityUserInputLabels:v18];
  }
  else
  {
    [v3 setImage:0 forState:0];
    [v3 setTitle:v10 forState:0];
    id v26 = v10;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    [v3 setAccessibilityUserInputLabels:v15];
  }

  [v3 addTarget:self action:sel_upNextButtonTapped_ forControlEvents:64];
  [v3 sizeToFit];
  [v3 frame];
  double x = v29.origin.x;
  double y = v29.origin.y;
  double height = v29.size.height;
  double Width = CGRectGetWidth(v29);
  if (v13) {
    double v23 = height + 6.0;
  }
  else {
    double v23 = height;
  }
  objc_msgSend(v3, "setFrame:", x, y, Width + 16.0, v23);
  id v24 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v3];

  return v24;
}

- (void)_reloadDataForcingLayout:(BOOL)a3 updateControls:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v55 = a3;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = CarPlayUIGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CGFloat v59 = self;
    _os_log_impl(&dword_227AC2000, v6, OS_LOG_TYPE_DEFAULT, "Reloading now playing view controller %@", buf, 0xCu);
  }

  id v7 = [(CPUINowPlayingViewController *)self dataSource];
  uint64_t v8 = [(CPUINowPlayingViewController *)self delegate];
  id v9 = [v7 titleForNowPlayingController:self];
  CPUIFilteredString(v9);
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [v7 artistTextForNowPlayingController:self];
  uint64_t v12 = CPUIFilteredString(v11);

  int v13 = [v7 albumTextForNowPlayingController:self];
  CPUIFilteredString(v13);
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v15 = [(CPUINowPlayingView *)self->_nowPlayingView songDetailsView];
  id v16 = v15;
  if (v10) {
    id v17 = v10;
  }
  else {
    id v17 = &stru_26DC16290;
  }
  [v15 setTrackTitle:v17];
  if (v14) {
    id v18 = v14;
  }
  else {
    id v18 = &stru_26DC16290;
  }
  [v16 setAlbumTitle:v18];
  double v56 = (void *)v12;
  if (v12) {
    id v19 = (__CFString *)v12;
  }
  else {
    id v19 = &stru_26DC16290;
  }
  [v16 setArtistName:v19];
  if (objc_opt_respondsToSelector())
  {
    id v20 = [v7 attributionTitleForNowPlayingViewController:self];
    [v16 setAttributionName:v20];
  }
  if (objc_opt_respondsToSelector())
  {
    int v21 = [v7 attributionArtworkForNowPlayingViewController:self];
    [v16 setAttributionArtwork:v21];
  }
  if (objc_opt_respondsToSelector())
  {
    id v22 = [v16 titleView];
    objc_msgSend(v22, "setShouldUseMusicExplicitGlyph:", objc_msgSend(v8, "nowPlayingViewControllerShouldUseMusicExplicitGlyph:", self));
  }
  uint64_t v23 = [v7 nowPlayingViewControllerIsShowingExplicitTrack:self];
  id v24 = [v16 titleView];
  [v24 setExplicitTrack:v23];

  if ([(__CFString *)v14 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v25 = [v8 nowPlayingViewControllerCanShowAlbumLink:self];
    id v26 = [v16 albumArtistLabelButton];
    [v26 setEnabled:v25];
  }
  CGFloat v57 = [v7 backgroundArtForNowPlayingController:self];
  if (objc_opt_respondsToSelector()) {
    uint64_t v27 = [v7 placeholderTypeForNowPlayingViewController:self];
  }
  else {
    uint64_t v27 = 0;
  }
  id v28 = [(CPUINowPlayingViewController *)self traitCollection];
  uint64_t v29 = CPUIImageForPlaceholderTypeWithTraitCollection(v27, v28);

  int v53 = (void *)v29;
  [(CPUINowPlayingViewController *)self _updateArtworkIfNeeded:v57 placeholder:v29];
  id v30 = [(CPUINowPlayingView *)self->_nowPlayingView playModeControlView];
  if (objc_opt_respondsToSelector())
  {
    char v31 = [v8 customPlaybackControlButtonsForNowPlayingViewController:self];
  }
  else
  {
    char v31 = 0;
  }
  uint64_t v54 = v14;
  if (![v31 count])
  {
    uint64_t v32 = [v30 defaultPlayModeButtons];

    char v31 = (void *)v32;
  }
  [(CPUINowPlayingViewController *)self _updateButtonAXLabelsForButtons:v31];
  __int16 v52 = v30;
  [v30 setMediaButtons:v31];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8 nowPlayingViewControllerShouldHideBackButton:self] & 1) != 0)
  {
    uint64_t v33 = [(CPUINowPlayingViewController *)self navigationItem];
    [v33 setLeftBarButtonItem:0];
LABEL_34:

    goto LABEL_35;
  }
  id v34 = [(CPUINowPlayingViewController *)self navigationItem];
  char v35 = [v34 leftBarButtonItem];

  if (!v35)
  {
    uint64_t v33 = objc_opt_new();
    [v33 addTarget:self action:sel__backButtonTapped_ forControlEvents:64];
    id v36 = [(CPUINowPlayingViewController *)self navigationItem];
    [v36 setHidesBackButton:1];

    int v37 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v33];
    v38 = [(CPUINowPlayingViewController *)self navigationItem];
    [v38 setLeftBarButtonItem:v37];

    v39 = [(CPUINowPlayingViewController *)self navigationItem];
    v40 = [v39 leftBarButtonItem];
    [v40 setAccessibilityIdentifier:@"CPNowPlayingBackButton"];

    goto LABEL_34;
  }
LABEL_35:
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v8 nowPlayingViewControllerShouldOverrideRightBarButtons:self] & 1) == 0)
  {
    if ([v8 nowPlayingViewControllerCanShowUpNext:self])
    {
      v41 = [(CPUINowPlayingViewController *)self _upNextBarButtonItem];
      [(CPUINowPlayingViewController *)self setPlaybackQueueBarButtonItem:v41];
      if (!v41) {
        goto LABEL_46;
      }
    }
    else
    {
      v41 = [(CPUINowPlayingViewController *)self rightTitleLabelBarButtonItem];
      if (!v41) {
        goto LABEL_46;
      }
    }
    __int16 v50 = v10;
    BOOL v51 = v4;
    v42 = [MEMORY[0x263EFF980] arrayWithObject:v41];
    v43 = [(CPUINowPlayingViewController *)self activityIndicatorBarButtonItem];

    if (v43)
    {
      v44 = [(CPUINowPlayingViewController *)self activityIndicatorBarButtonItem];
      [v42 addObject:v44];
    }
    v45 = [(CPUINowPlayingViewController *)self navigationItem];
    __int16 v46 = [v45 rightBarButtonItems];
    char v47 = [v46 isEqualToArray:v42];

    if ((v47 & 1) == 0)
    {
      __int16 v48 = [(CPUINowPlayingViewController *)self navigationItem];
      [v48 setRightBarButtonItems:v42];
    }
    BOOL v4 = v51;
    uint64_t v10 = v50;
  }
LABEL_46:
  [(CPUINowPlayingViewController *)self _recalculateLayout:v55];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v7 badgeAnnotationViewForNowPlayingViewController:self],
        (int v49 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v49 = [(CPUINowPlayingViewController *)self audioSessionRenderingModeView];
  }
  [(CPUINowPlayingView *)self->_nowPlayingView setBadgeAnnotationView:v49];
  if (v4) {
    [(CPUINowPlayingViewController *)self updatePlayControls];
  }
}

- (void)_sceneWillEnterForeground:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(CPUINowPlayingViewController *)self _isCarScene:v4];

  if (v5)
  {
    [(CPUINowPlayingViewController *)self _setStatusBarOverrideActive:1];
  }
}

- (void)_sceneDidActivate:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(CPUINowPlayingViewController *)self _isCarScene:v4];

  if (v5)
  {
    [(CPUINowPlayingViewController *)self _setStatusBarOverrideActive:1];
  }
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 object];
  BOOL v5 = [(CPUINowPlayingViewController *)self _isCarScene:v4];

  if (v5)
  {
    id v6 = [v7 object];
    [(CPUINowPlayingViewController *)self _deactivateStatusBarStyleOverrideIfNecessaryForScene:v6];
  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(CPUINowPlayingViewController *)self _isCarScene:v4];

  if (v5)
  {
    [(CPUINowPlayingViewController *)self _setStatusBarOverrideActive:0];
  }
}

- (BOOL)_isCarScene:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass())
  {
    if (!v5)
    {
      uint64_t v12 = 0;
      BOOL v11 = 0;
      goto LABEL_9;
    }
    id v6 = [v5 traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 != 3)
    {
      BOOL v11 = 0;
      uint64_t v12 = v5;
      goto LABEL_9;
    }
    uint64_t v8 = [(CPUINowPlayingViewController *)self view];
    id v9 = [v8 window];
    id v10 = [v9 windowScene];
    BOOL v11 = v10 == v5;

    uint64_t v12 = v5;
  }
  else
  {
    uint64_t v12 = 0;
    BOOL v11 = 0;
    uint64_t v8 = v5;
  }

LABEL_9:
  return v11;
}

- (void)_deactivateStatusBarStyleOverrideIfNecessaryForScene:(id)a3
{
  id v4 = [a3 _FBSScene];
  id v5 = [v4 settings];

  if ([v5 deactivationReasons] != 16) {
    [(CPUINowPlayingViewController *)self _setStatusBarOverrideActive:0];
  }
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __96__CPUINowPlayingViewController_nowPlayingAudioFormatController_didChangeAudioFormatContentInfo___block_invoke;
  v7[3] = &unk_26482D558;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __96__CPUINowPlayingViewController_nowPlayingAudioFormatController_didChangeAudioFormatContentInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAudioFormatContentInfo:*(void *)(a1 + 40)];
}

- (void)_updateAudioFormatContentInfo:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(MRNowPlayingAudioFormatController *)self->_audioFormatController audioFormatContentInfo];
  }
  if ([v4 renderingMode] == 3)
  {
    uint64_t v5 = CPUILocalizedStringForKey(@"SPATIAL_AUDIO");
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [(CPUINowPlayingViewController *)self traitCollection];
  id v7 = v4;
  id v8 = v6;
  uint64_t v9 = 0;
  switch([v7 renderingMode])
  {
    case 1:
    case 2:
      goto LABEL_16;
    case 3:
      id v10 = [MEMORY[0x263F827E8] _systemImageNamed:@"person.spatialaudio.fill"];
      BOOL v11 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:1 scale:10.0];
      uint64_t v12 = [v10 imageWithConfiguration:v11];

      goto LABEL_14;
    case 4:
      int v13 = @"DolbyAudio";
      goto LABEL_13;
    case 5:
      int v13 = @"DolbyAtmos";
LABEL_13:
      uint64_t v12 = CPUIImageNamedWithTraitCollection(v13, v8);
LABEL_14:
      uint64_t v9 = [v12 imageWithRenderingMode:2];
      break;
    default:
      uint64_t v12 = CarPlayUIGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CPUINowPlayingViewController _updateAudioFormatContentInfo:](v7, v12);
      }
      uint64_t v9 = 0;
      break;
  }

LABEL_16:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = [(UIStackView *)self->_audioSessionRenderingModeView arrangedSubviews];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [(UIStackView *)self->_audioSessionRenderingModeView removeArrangedSubview:v19];
        [v19 removeFromSuperview];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v16);
  }

  audioSessionRenderingModeView = self->_audioSessionRenderingModeView;
  if (!(v5 | v9))
  {
    self->_audioSessionRenderingModeView = 0;
    goto LABEL_33;
  }
  int v21 = (double *)MEMORY[0x263F001A8];
  if (!audioSessionRenderingModeView)
  {
    id v22 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x263F82BF8]), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v23 = self->_audioSessionRenderingModeView;
    self->_audioSessionRenderingModeView = v22;

    [(UIStackView *)self->_audioSessionRenderingModeView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v24 = [(UIStackView *)self->_audioSessionRenderingModeView layer];
    [v24 setAllowsGroupBlending:0];

    [(UIStackView *)self->_audioSessionRenderingModeView setAxis:0];
    [(UIStackView *)self->_audioSessionRenderingModeView setDistribution:2];
    [(UIStackView *)self->_audioSessionRenderingModeView setAlignment:3];
    [(UIStackView *)self->_audioSessionRenderingModeView setAlpha:0.400000006];
  }
  uint64_t v25 = (void *)MEMORY[0x263F15D58];
  if (v9)
  {
    id v26 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v9];
    uint64_t v27 = [MEMORY[0x263F825C8] whiteColor];
    [v26 setTintColor:v27];

    [v26 setContentMode:1];
    id v28 = v25;
    uint64_t v29 = [MEMORY[0x263F157C8] filterWithType:*v25];
    id v30 = [v26 layer];
    [v30 setCompositingFilter:v29];

    [(UIStackView *)self->_audioSessionRenderingModeView addArrangedSubview:v26];
    if (v5) {
      [(UIStackView *)self->_audioSessionRenderingModeView setCustomSpacing:v26 afterView:3.0];
    }

    uint64_t v25 = v28;
  }
  if (v5)
  {
    audioSessionRenderingModeView = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", *v21, v21[1], v21[2], v21[3]);
    [(UIStackView *)audioSessionRenderingModeView setText:v5];
    char v31 = [MEMORY[0x263F157C8] filterWithType:*v25];
    uint64_t v32 = [(UIStackView *)audioSessionRenderingModeView layer];
    [v32 setCompositingFilter:v31];

    uint64_t v33 = [MEMORY[0x263F81708] systemFontOfSize:10.0 weight:*MEMORY[0x263F81838]];
    [(UIStackView *)audioSessionRenderingModeView setFont:v33];

    id v34 = [MEMORY[0x263F825C8] whiteColor];
    [(UIStackView *)audioSessionRenderingModeView setTextColor:v34];

    [(UIStackView *)self->_audioSessionRenderingModeView addArrangedSubview:audioSessionRenderingModeView];
LABEL_33:
  }
  [(CPUINowPlayingViewController *)self reloadData];
}

- (void)_updateButtonAXLabelsForButtons:(id)a3
{
}

void __64__CPUINowPlayingViewController__updateButtonAXLabelsForButtons___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v11 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [v11 accessibilityUserInputLabels];

  if (v5)
  {
    id v6 = [v11 accessibilityUserInputLabels];
    [v4 addObjectsFromArray:v6];
  }
  id v7 = [v11 accessibilityLabel];

  if (v7)
  {
    id v8 = [v11 accessibilityLabel];
    [v4 addObject:v8];
  }
  if (a3 <= 4)
  {
    uint64_t v9 = CPUILocalizedStringForKey(off_26482D6C0[a3]);
    [v4 addObject:v9];
  }
  id v10 = (void *)[v4 copy];
  [v11 setAccessibilityUserInputLabels:v10];
}

- (CPUINowPlayingViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (CPUINowPlayingViewControllerDataSource *)WeakRetained;
}

- (CPUINowPlayingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPUINowPlayingViewControllerDelegate *)WeakRetained;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CPUINowPlayingView)nowPlayingView
{
  return self->_nowPlayingView;
}

- (void)setNowPlayingView:(id)a3
{
}

- (CRSUIStatusBarStyleAssertion)statusBarStyleAssertion
{
  return self->_statusBarStyleAssertion;
}

- (void)setStatusBarStyleAssertion:(id)a3
{
}

- (NSOperationQueue)artworkOperationQueue
{
  return self->_artworkOperationQueue;
}

- (void)setArtworkOperationQueue:(id)a3
{
}

- (UIVisualEffectView)artworkVisualEffectView
{
  return self->_artworkVisualEffectView;
}

- (void)setArtworkVisualEffectView:(id)a3
{
}

- (UIImage)rawArtworkImage
{
  return self->_rawArtworkImage;
}

- (void)setRawArtworkImage:(id)a3
{
}

- (UIImage)finalArtworkImage
{
  return self->_finalArtworkImage;
}

- (void)setFinalArtworkImage:(id)a3
{
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (NSTimer)uiTimer
{
  return self->_uiTimer;
}

- (void)setUiTimer:(id)a3
{
}

- (UILabel)rightTitleLabel
{
  return self->_rightTitleLabel;
}

- (void)setRightTitleLabel:(id)a3
{
}

- (UIBarButtonItem)rightTitleLabelBarButtonItem
{
  return self->_rightTitleLabelBarButtonItem;
}

- (void)setRightTitleLabelBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)playbackQueueBarButtonItem
{
  return self->_playbackQueueBarButtonItem;
}

- (void)setPlaybackQueueBarButtonItem:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIBarButtonItem)activityIndicatorBarButtonItem
{
  return self->_activityIndicatorBarButtonItem;
}

- (void)setActivityIndicatorBarButtonItem:(id)a3
{
}

- (UITapGestureRecognizer)knobPressRecognizer
{
  return self->_knobPressRecognizer;
}

- (UITapGestureRecognizer)backPressRecognizer
{
  return self->_backPressRecognizer;
}

- (UITapGestureRecognizer)leftNudgePressRecognizer
{
  return self->_leftNudgePressRecognizer;
}

- (void)setLeftNudgePressRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)rightNudgePressRecognizer
{
  return self->_rightNudgePressRecognizer;
}

- (void)setRightNudgePressRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)leftNudgeLongPressRecognizer
{
  return self->_leftNudgeLongPressRecognizer;
}

- (void)setLeftNudgeLongPressRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)rightNudgeLongPressRecognizer
{
  return self->_rightNudgeLongPressRecognizer;
}

- (void)setRightNudgeLongPressRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)leftButtonLongPressRecognizer
{
  return self->_leftButtonLongPressRecognizer;
}

- (void)setLeftButtonLongPressRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)fastForwardButtonLongPressRecognizer
{
  return self->_fastForwardButtonLongPressRecognizer;
}

- (void)setFastForwardButtonLongPressRecognizer:(id)a3
{
}

- (NSString)previousTransportButtonImageIdentifier
{
  return self->_previousTransportButtonImageIdentifier;
}

- (void)setPreviousTransportButtonImageIdentifier:(id)a3
{
}

- (NSString)forwardTransportButtonImageIdentifier
{
  return self->_forwardTransportButtonImageIdentifier;
}

- (void)setForwardTransportButtonImageIdentifier:(id)a3
{
}

- (NSString)playPauseTransportButtonImageIdentifier
{
  return self->_playPauseTransportButtonImageIdentifier;
}

- (void)setPlayPauseTransportButtonImageIdentifier:(id)a3
{
}

- (NSArray)nowPlayingSizeConstraints
{
  return self->_nowPlayingSizeConstraints;
}

- (void)setNowPlayingSizeConstraints:(id)a3
{
}

- (UIStackView)audioSessionRenderingModeView
{
  return self->_audioSessionRenderingModeView;
}

- (void)setAudioSessionRenderingModeView:(id)a3
{
}

- (MRNowPlayingAudioFormatController)audioFormatController
{
  return self->_audioFormatController;
}

- (void)setAudioFormatController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFormatController, 0);
  objc_storeStrong((id *)&self->_audioSessionRenderingModeView, 0);
  objc_storeStrong((id *)&self->_nowPlayingSizeConstraints, 0);
  objc_storeStrong((id *)&self->_playPauseTransportButtonImageIdentifier, 0);
  objc_storeStrong((id *)&self->_forwardTransportButtonImageIdentifier, 0);
  objc_storeStrong((id *)&self->_previousTransportButtonImageIdentifier, 0);
  objc_storeStrong((id *)&self->_fastForwardButtonLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftButtonLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_rightNudgeLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftNudgeLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_rightNudgePressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftNudgePressRecognizer, 0);
  objc_storeStrong((id *)&self->_backPressRecognizer, 0);
  objc_storeStrong((id *)&self->_knobPressRecognizer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_playbackQueueBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabel, 0);
  objc_storeStrong((id *)&self->_uiTimer, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_finalArtworkImage, 0);
  objc_storeStrong((id *)&self->_rawArtworkImage, 0);
  objc_storeStrong((id *)&self->_artworkVisualEffectView, 0);
  objc_storeStrong((id *)&self->_artworkOperationQueue, 0);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_nowPlayingView, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)_updateAudioFormatContentInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "renderingMode"));
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_227AC2000, a2, OS_LOG_TYPE_DEBUG, "No available CPUI badge for rendering mode %{public}@", (uint8_t *)&v4, 0xCu);
}

@end