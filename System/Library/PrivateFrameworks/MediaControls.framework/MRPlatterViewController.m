@interface MRPlatterViewController
+ (MRPlatterViewController)coverSheetPlatterViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)_canToggleRoutingPicker;
- (BOOL)_isExpanded;
- (BOOL)_shouldUseViewServiceToPresentTVRemote;
- (BOOL)allowsNowPlayingAppLaunch;
- (BOOL)failedToLoadArtwork;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isDeviceUnlocked;
- (BOOL)isListeningForResponse;
- (BOOL)isOnScreen;
- (BOOL)isSelected;
- (BOOL)isTransitioning;
- (BOOL)lockScreenPresentsOverrideRoutePicker;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldDisplayPlatter;
- (BOOL)shouldEnableSyncingForSlider:(id)a3;
- (BOOL)shouldShowTVRemoteButton;
- (BOOL)slider:(id)a3 shouldCancelSnapWithTouch:(id)a4;
- (BOOL)slider:(id)a3 syncStateWillChangeFromState:(int64_t)a4 toState:(int64_t)a5;
- (CGSize)lastKnownSize;
- (FBSDisplayLayoutMonitor)displayMonitor;
- (MPAVEndpointRoute)route;
- (MPAVRoutingViewController)routingViewController;
- (MPArtworkCatalog)artworkCatalog;
- (MPMediaControls)mediaControls;
- (MPVolumeGroupSliderCoordinator)groupSliderCoordinator;
- (MRMediaControlsVideoPickerFooterView)videoPickerFooterView;
- (MRMediaControlsVideoPickerHeaderView)videoPickerHeaderView;
- (MRPlatterViewController)initWithActiveRouteType:(int64_t)a3;
- (MRPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MRPlatterViewController)initWithRouteUID:(id)a3;
- (MRPlatterViewController)initWithStyle:(int64_t)a3;
- (MRPlatterViewControllerDelegate)delegate;
- (MSVTimer)artworkTimer;
- (MediaControlsEndpointController)endpointController;
- (MediaControlsHeaderView)nowPlayingHeaderView;
- (MediaControlsLanguageOptionsViewController)languageOptionsViewController;
- (MediaControlsParentContainerView)parentContainerView;
- (MediaControlsRoutingCornerView)routingCornerView;
- (MediaControlsTransitioningDelegate)transitioningDelegate;
- (MediaControlsVolumeContainerView)volumeContainerView;
- (NSArray)displayElements;
- (NSArray)requiredVisualStyleCategories;
- (NSMutableArray)secondaryStringComponents;
- (NSString)description;
- (NSString)explicitString;
- (NSString)label;
- (NSString)placeholderDeviceIdentifier;
- (NSString)placeholderString;
- (NSString)routeName;
- (NSString)routeUID;
- (SFShareAudioViewController)shareAudioViewController;
- (UIEdgeInsets)contentInsetsForRoutingViewController:(id)a3;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)effectiveFooterView;
- (UIView)effectiveHeaderView;
- (double)_continuousCornerRadius;
- (id)_route;
- (id)_stateDumpObject;
- (id)_tvAirplayIdentifier;
- (id)_tvMediaRemoteIdentifier;
- (id)routingCornerViewTappedBlock;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)failedArtworkRetryCount;
- (int64_t)lockScreenInternalRoutePickerOverrideWithDefaultStyle:(int64_t)a3;
- (int64_t)selectedMode;
- (int64_t)style;
- (uint64_t)_showShareAudioViewController;
- (unint64_t)supportedModes;
- (void)_dismissShareAudioViewController;
- (void)_platterViewControllerReceivedInteraction:(id)a3;
- (void)_presentRoutingViewControllerFromCoverSheet;
- (void)_prewarmTVRemoteIfNeeded;
- (void)_routingCornerViewReceivedTap:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setRoutingPickerVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_showPlaceholderArtwork;
- (void)_showShareAudioViewController;
- (void)_updateConfiguration;
- (void)_updateControlCenterMetadata:(id)a3 sectionMetadata:(id)a4;
- (void)_updateHeaderUI;
- (void)_updateOnScreenForStyle:(int64_t)a3;
- (void)_updatePlaceholderArtwork;
- (void)_updateRouteNameLabel;
- (void)_updateRoutingCornerView;
- (void)_updateRoutingIndicators;
- (void)_updateSecondaryStringFormat;
- (void)_updateStyle;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)endpointController:(id)a3 didLoadNewResponse:(id)a4;
- (void)endpointControllerDidUpdateRoutingAvailability:(id)a3;
- (void)endpointControllerRouteDidUpdate:(id)a3;
- (void)footerViewButtonPressed:(id)a3;
- (void)headerViewButtonPressed:(id)a3;
- (void)headerViewLaunchNowPlayingAppButtonPressed:(id)a3;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)loadView;
- (void)presentRatingActionSheet:(id)a3 sourceView:(id)a4;
- (void)presentTVRemote;
- (void)routingViewController:(id)a3 didPickRoute:(id)a4;
- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4;
- (void)routingViewController:(id)a3 willDisplayCell:(id)a4;
- (void)routingViewController:(id)a3 willDisplayHeaderView:(id)a4;
- (void)setAllowsNowPlayingAppLaunch:(BOOL)a3;
- (void)setArtworkCatalog:(id)a3;
- (void)setArtworkTimer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayElements:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setEndpointController:(id)a3;
- (void)setExplicitString:(id)a3;
- (void)setFailedToLoadArtwork:(BOOL)a3;
- (void)setGroupSliderCoordinator:(id)a3;
- (void)setIsListeningForResponse:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLanguageOptionsViewController:(id)a3;
- (void)setLastKnownSize:(CGSize)a3;
- (void)setMediaControls:(id)a3;
- (void)setNowPlayingHeaderView:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setParentContainerView:(id)a3;
- (void)setPlaceholderDeviceIdentifier:(id)a3;
- (void)setPlaceholderString:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRoutingCornerView:(id)a3;
- (void)setRoutingCornerViewTappedBlock:(id)a3;
- (void)setRoutingViewController:(id)a3;
- (void)setSecondaryStringComponents:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedMode:(int64_t)a3;
- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setShareAudioViewController:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupportedModes:(unint64_t)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setTransitioningDelegate:(id)a3;
- (void)setVideoPickerFooterView:(id)a3;
- (void)setVideoPickerHeaderView:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)setVolumeContainerView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToSize:(CGSize)a3 withCoordinator:(id)a4;
@end

@implementation MRPlatterViewController

- (MRPlatterViewController)initWithStyle:(int64_t)a3
{
  v50.receiver = self;
  v50.super_class = (Class)MRPlatterViewController;
  v4 = [(MRPlatterViewController *)&v50 initWithNibName:0 bundle:0];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v9, v8);
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v10;

    v12 = -[MediaControlsRoutingCornerView initWithFrame:]([MediaControlsRoutingCornerView alloc], "initWithFrame:", v7, v6, v9, v8);
    routingCornerView = v4->_routingCornerView;
    v4->_routingCornerView = v12;

    v14 = -[MediaControlsParentContainerView initWithFrame:]([MediaControlsParentContainerView alloc], "initWithFrame:", v7, v6, v9, v8);
    parentContainerView = v4->_parentContainerView;
    v4->_parentContainerView = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    secondaryStringComponents = v4->_secondaryStringComponents;
    v4->_secondaryStringComponents = v16;

    v18 = objc_alloc_init(MediaControlsTransitioningDelegate);
    transitioningDelegate = v4->_transitioningDelegate;
    v4->_transitioningDelegate = v18;

    v4->_unint64_t style = a3;
    explicitString = v4->_explicitString;
    v4->_explicitString = (NSString *)&stru_1F06524E0;

    if (a3 == 3)
    {
      v21 = -[MediaControlsVolumeSlider initWithFrame:style:]([MediaControlsVolumeSlider alloc], "initWithFrame:style:", 0, v7, v6, v9, v8);
    }
    else
    {
      v21 = -[MediaControlsMasterVolumeSlider initWithFrame:]([MediaControlsMasterVolumeSlider alloc], "initWithFrame:", v7, v6, v9, v8);
      [(MediaControlsMasterVolumeSlider *)v21 setDelegate:v4];
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F31A88]) initWithMasterVolumeSlider:v21 individualVolumeSliders:0];
    groupSliderCoordinator = v4->_groupSliderCoordinator;
    v4->_groupSliderCoordinator = (MPVolumeGroupSliderCoordinator *)v22;

    unint64_t style = v4->_style;
    if (style >= 5)
    {
      if (style != 5) {
        goto LABEL_8;
      }
      v43 = -[MRMediaControlsVideoPickerFooterView initWithFrame:]([MRMediaControlsVideoPickerFooterView alloc], "initWithFrame:", v7, v6, v9, v8);
      videoPickerFooterView = v4->_videoPickerFooterView;
      v4->_videoPickerFooterView = v43;

      v27 = -[MRMediaControlsVideoPickerHeaderView initWithFrame:]([MRMediaControlsVideoPickerHeaderView alloc], "initWithFrame:", v7, v6, v9, v8);
      uint64_t v28 = 1080;
    }
    else
    {
      v25 = -[MediaControlsHeaderView initWithFrame:]([MediaControlsHeaderView alloc], "initWithFrame:", v7, v6, v9, v8);
      nowPlayingHeaderView = v4->_nowPlayingHeaderView;
      v4->_nowPlayingHeaderView = v25;

      v27 = -[MediaControlsVolumeContainerView initWithFrame:slider:]([MediaControlsVolumeContainerView alloc], "initWithFrame:slider:", v21, v7, v6, v9, v8);
      uint64_t v28 = 1104;
    }
    v29 = *(Class *)((char *)&v4->super.super.super.isa + v28);
    *(Class *)((char *)&v4->super.super.super.isa + v28) = (Class)v27;

LABEL_8:
    v30 = [(MediaControlsHeaderView *)v4->_nowPlayingHeaderView routingButton];
    [v30 addTarget:v4 action:sel_headerViewButtonPressed_ forControlEvents:64];

    v31 = [(MediaControlsHeaderView *)v4->_nowPlayingHeaderView launchNowPlayingAppButton];
    [v31 addTarget:v4 action:sel_headerViewLaunchNowPlayingAppButtonPressed_ forControlEvents:64];

    [(MRMediaControlsVideoPickerFooterView *)v4->_videoPickerFooterView addTarget:v4 action:sel_footerViewButtonPressed_ forControlEvents:64];
    BOOL v32 = v4->_style == 3;
    v33 = [(MediaControlsHeaderView *)v4->_nowPlayingHeaderView routingButton];
    [v33 setUserInterfaceStyleSwitchingEnabled:v32];

    v34 = [(MRPlatterViewController *)v4 parentContainerView];
    v35 = [v34 transportStackView];
    [v35 setActionsDelegate:v4];

    v36 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    v37 = [v36 localizedStringForKey:@"MEDIA_CONTROLS_PLATTER_PLACEHOLDER" value:&stru_1F06524E0 table:@"MediaControls"];
    [(MRPlatterViewController *)v4 setPlaceholderString:v37];

    v38 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    objc_initWeak(&location, v4);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __41__MRPlatterViewController_initWithStyle___block_invoke;
    v47[3] = &unk_1E5F0F950;
    objc_copyWeak(&v48, &location);
    [v38 setTransitionHandler:v47];
    uint64_t v39 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v38];
    displayMonitor = v4->_displayMonitor;
    v4->_displayMonitor = (FBSDisplayLayoutMonitor *)v39;

    v41 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), v4];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __41__MRPlatterViewController_initWithStyle___block_invoke_2;
    v45[3] = &unk_1E5F0DE78;
    objc_copyWeak(&v46, &location);
    v4->_stateHandle = MCLogAddStateHandlerWithName(v41, v45);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __41__MRPlatterViewController_initWithStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained layoutMonitor:v6 didUpdateDisplayLayout:v5 withContext:0];
}

id __41__MRPlatterViewController_initWithStyle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v4 = [WeakRetained _stateDumpObject];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (MRPlatterViewController)coverSheetPlatterViewController
{
  v2 = objc_alloc_init(MRUCoverSheetViewController);

  return (MRPlatterViewController *)v2;
}

- (MRPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v4 = -[MRPlatterViewController initWithStyle:](self, "initWithStyle:", 0, a4);
  id v5 = v4;
  if (v4)
  {
    [(MRPlatterViewController *)v4 setAllowsNowPlayingAppLaunch:1];
    CCUIExpandedModuleContinuousCornerRadius();
    -[MRPlatterViewController _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
  }
  return v5;
}

- (MRPlatterViewController)initWithRouteUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRPlatterViewController *)self initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = [[MediaControlsStandaloneEndpointController alloc] initWithRouteUID:v4];
    [(MRPlatterViewController *)v5 setEndpointController:v6];

    double v7 = [(MRPlatterViewController *)v5 endpointController];
    [v7 setAllowsAutomaticResponseLoading:1];
  }
  return v5;
}

- (MRPlatterViewController)initWithActiveRouteType:(int64_t)a3
{
  id v4 = [(MRPlatterViewController *)self initWithNibName:0 bundle:0];
  if (v4)
  {
    id v5 = [[MediaControlsActiveEndpointController alloc] initWithActiveEndpointType:a3 == 1];
    [(MRPlatterViewController *)v4 setEndpointController:v5];

    id v6 = [(MRPlatterViewController *)v4 endpointController];
    [v6 setAllowsAutomaticResponseLoading:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(MRPlatterViewController *)self endpointController];
  id v4 = [v3 proxyDelegate];
  [v4 endObserving];

  id v5 = [(MRPlatterViewController *)self displayMonitor];
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)MRPlatterViewController;
  [(MRPlatterViewController *)&v6 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRPlatterViewController *)self endpointController];
  objc_super v6 = [v5 route];
  double v7 = [v3 stringWithFormat:@"<%@: %p route: %@", v4, self, v6];

  return (NSString *)v7;
}

- (NSString)routeName
{
  v3 = [(MRPlatterViewController *)self nowPlayingHeaderView];

  if (v3)
  {
    uint64_t v4 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    id v5 = [v4 routeLabel];
    objc_super v6 = [v5 text];
  }
  else
  {
    objc_super v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAllowsNowPlayingAppLaunch:(BOOL)a3
{
  if (self->_allowsNowPlayingAppLaunch != a3)
  {
    self->_allowsNowPlayingAppLaunch = a3;
    [(MRPlatterViewController *)self _updateStyle];
  }
}

- (BOOL)shouldDisplayPlatter
{
  v2 = [(MRPlatterViewController *)self endpointController];
  v3 = [v2 route];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeviceUnlocked
{
  return ![(NSArray *)self->_displayElements containsObject:*MEMORY[0x1E4F625B0]];
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(MRPlatterViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)MRPlatterViewController;
  [(MRPlatterViewController *)&v20 viewDidLoad];
  id v3 = [(MRPlatterViewController *)self view];
  BOOL v4 = [MEMORY[0x1E4FB1618] labelColor];
  [v3 setTintColor:v4];

  id v5 = [(MRPlatterViewController *)self view];
  [v5 setAutoresizingMask:0];

  objc_super v6 = [(MRPlatterViewController *)self backgroundView];

  if (v6)
  {
    double v7 = [(MRPlatterViewController *)self view];
    [v7 addSubview:self->_backgroundView];
  }
  double v8 = [(MRPlatterViewController *)self view];
  [v8 addSubview:self->_contentView];

  [(UIView *)self->_contentView addSubview:self->_parentContainerView];
  contentView = self->_contentView;
  uint64_t v10 = [(MRPlatterViewController *)self effectiveFooterView];
  [(UIView *)contentView addSubview:v10];

  v11 = self->_contentView;
  v12 = [(MRPlatterViewController *)self effectiveHeaderView];
  [(UIView *)v11 addSubview:v12];

  [(UIView *)self->_contentView addSubview:self->_routingCornerView];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__routingCornerViewReceivedTap_];
  [v13 setCancelsTouchesInView:0];
  v14 = [(MRPlatterViewController *)self routingCornerView];
  [v14 addGestureRecognizer:v13];

  if ([(MRPlatterViewController *)self style] == 3)
  {
    v15 = [[MediaControlsInteractionRecognizer alloc] initWithTarget:self action:sel__platterViewControllerReceivedInteraction_];
    [(MediaControlsInteractionRecognizer *)v15 setCancelsTouchesInView:0];
    v16 = [(MRPlatterViewController *)self view];
    [v16 addGestureRecognizer:v15];

    [(MediaControlsInteractionRecognizer *)v15 setDelegate:self];
  }
  [(MRPlatterViewController *)self _updateStyle];
  routingViewController = self->_routingViewController;
  if (routingViewController)
  {
    v18 = [(MPAVRoutingViewController *)routingViewController view];
    v19 = [(MRPlatterViewController *)self parentContainerView];
    [v19 setRoutingView:v18];
  }
}

- (void)viewDidLayoutSubviews
{
  v115.receiver = self;
  v115.super_class = (Class)MRPlatterViewController;
  [(MRPlatterViewController *)&v115 viewDidLayoutSubviews];
  id v3 = [(MRPlatterViewController *)self traitCollection];
  [v3 displayScale];

  BOOL v4 = [(MRPlatterViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[UIView setFrame:](self->_backgroundView, "setFrame:", v6, v8, v10, v12);
  -[UIView setFrame:](self->_contentView, "setFrame:", v6, v8, v10, v12);
  v13 = [(SFShareAudioViewController *)self->_shareAudioViewController view];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  UIRoundToScale();
  UIRoundToScale();
  double v111 = v14;
  UIRectInset();
  UIRectInset();
  UIRectIntegralWithScale();
  v15 = [(MRPlatterViewController *)self view];
  [v15 bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(MRPlatterViewController *)self routingCornerView];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  v25 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v26 = [v25 userInterfaceLayoutDirection];

  if (v26 == 1)
  {
    CGAffineTransformMakeScale(&v114, -1.0, 1.0);
    v27 = [(MRPlatterViewController *)self routingCornerView];
    uint64_t v28 = v27;
    CGAffineTransform v113 = v114;
    v29 = &v113;
  }
  else
  {
    v27 = [(MRPlatterViewController *)self routingCornerView];
    uint64_t v28 = v27;
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v112[0] = *MEMORY[0x1E4F1DAB8];
    v112[1] = v30;
    v112[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v29 = (CGAffineTransform *)v112;
  }
  [v27 setTransform:v29];

  switch(self->_style)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      UIRectInset();
      double v32 = v31;
      double v34 = v33;
      if (self->_style == 3)
      {
        UIRectInset();
        double v32 = v35;
        double v34 = v36;
      }
      v37 = [(MRPlatterViewController *)self effectiveHeaderView];
      objc_msgSend(v37, "sizeThatFits:", v32, v34);

      UIRectIntegralWithScale();
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      id v46 = [(MRPlatterViewController *)self effectiveHeaderView];
      objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

      int64_t style = self->_style;
      if (style != 3 && style != 5) {
        [(MRPlatterViewController *)self supportedModes];
      }
      UIRectInset();
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      double v53 = v52;
      double v55 = v54;
      v56 = [(MRPlatterViewController *)self effectiveFooterView];
      objc_msgSend(v56, "sizeThatFits:", v53, v55);

      v116.origin.x = v49;
      v116.origin.y = v51;
      v116.size.double width = v53;
      v116.size.double height = v55;
      CGRectGetMinX(v116);
      v117.origin.x = v49;
      v117.origin.y = v51;
      v117.size.double width = v53;
      v117.size.double height = v55;
      CGRectGetMaxY(v117);
      v118.origin.x = v49;
      v118.origin.y = v51;
      v118.size.double width = v53;
      v118.size.double height = v55;
      CGRectGetWidth(v118);
      UIRectInset();
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      v65 = [(MRPlatterViewController *)self effectiveFooterView];
      objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

      UIRectInset();
      UIRectIntegralWithScale();
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      v74 = [(MRPlatterViewController *)self parentContainerView];
      v75 = v74;
      double v76 = v67;
      double v77 = v69;
      double v78 = v71;
      double v79 = v73;
      goto LABEL_12;
    case 1:
      double v94 = (v12 + v111 * -2.0) / 3.0;
      v95 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28C8]];
      v96 = [(MRPlatterViewController *)self traitCollection];
      [v95 scaledValueForValue:v96 compatibleWithTraitCollection:20.0];
      double v98 = v97 * -0.5;

      v99 = [(MRPlatterViewController *)self effectiveHeaderView];
      objc_msgSend(v99, "sizeThatFits:", v10, v12);
      double v101 = v100;

      v102 = [(MRPlatterViewController *)self effectiveHeaderView];
      objc_msgSend(v102, "setFrame:", 0.0, v94 + 25.0 + v98, v10, v101);

      v103 = [(MRPlatterViewController *)self parentContainerView];
      objc_msgSend(v103, "setFrame:", 0.0, v111 + v94 * 2.0, v10, 50.0);

      v121.origin.x = v6;
      v121.origin.y = v8;
      v121.size.double width = v10;
      v121.size.double height = v12;
      CGRect v122 = CGRectInset(v121, 13.0, 0.0);
      double width = v122.size.width;
      double height = v122.size.height;
      v106 = [(MRPlatterViewController *)self effectiveFooterView];
      objc_msgSend(v106, "sizeThatFits:", width, height);
      double v108 = v107;

      v75 = [(MRPlatterViewController *)self view];
      [v75 bounds];
      CGFloat v109 = CGRectGetMaxY(v123) - v108;
      v110 = [(MRPlatterViewController *)self effectiveFooterView];
      objc_msgSend(v110, "setFrame:", 0.0, v109, width, v108);

      goto LABEL_13;
    case 2:
      v80 = [(MRPlatterViewController *)self effectiveHeaderView];
      objc_msgSend(v80, "sizeThatFits:", v10, v12);

      UIRectCenteredIntegralRect();
      double v82 = v81;
      double v84 = v83;
      double v86 = v85;
      double v88 = v87;
      v89 = [(MRPlatterViewController *)self effectiveHeaderView];
      objc_msgSend(v89, "setFrame:", v82, v84, v86, v88);

      v119.origin.x = v6;
      v119.origin.y = v8;
      v119.size.double width = v10;
      v119.size.double height = v12;
      double MidY = CGRectGetMidY(v119);
      v91 = [(MRPlatterViewController *)self parentContainerView];
      objc_msgSend(v91, "setFrame:", v6, MidY, v10, 50.0);

      v120.origin.y = v8 + 0.0;
      v120.origin.x = v6 + 24.0;
      v120.size.double width = v10 - (24.0 + 24.0);
      v120.size.double height = v12;
      CGFloat MaxY = CGRectGetMaxY(v120);
      v74 = [(MRPlatterViewController *)self effectiveFooterView];
      v75 = v74;
      double v76 = v6 + 24.0;
      double v77 = MaxY;
      double v78 = v10 - (24.0 + 24.0);
      double v79 = 50.0;
LABEL_12:
      objc_msgSend(v74, "setFrame:", v76, v77, v78, v79);
LABEL_13:

      break;
    default:
      break;
  }
  v93 = [(MRPlatterViewController *)self view];
  [v93 sendSubviewToBack:self->_backgroundView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(MRPlatterViewController *)self setOnScreen:1];
  [(MPAVRoutingViewController *)self->_routingViewController beginAppearanceTransition:1 animated:v3];
  [(MRPlatterViewController *)self _updateHeaderUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRPlatterViewController;
  [(MRPlatterViewController *)&v4 viewDidAppear:a3];
  [(MPAVRoutingViewController *)self->_routingViewController endAppearanceTransition];
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  [(MRPlatterViewController *)self _updateHeaderUI];
  if (!a3) {
    [(MRPlatterViewController *)self setOnScreen:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  [(MPAVRoutingViewController *)self->_routingViewController beginAppearanceTransition:0 animated:v3];
  objc_super v5 = [(MRPlatterViewController *)self languageOptionsViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRPlatterViewController;
  [(MRPlatterViewController *)&v4 viewDidDisappear:a3];
  [(MRPlatterViewController *)self setOnScreen:0];
  [(MPAVRoutingViewController *)self->_routingViewController endAppearanceTransition];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setBackgroundView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    double v14 = v5;
    double v8 = backgroundView;
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(UIView *)*p_backgroundView _setContinuousCornerRadius:self->__continuousCornerRadius];
    if (objc_opt_respondsToSelector())
    {
      double v9 = [(UIView *)*p_backgroundView visualStylingProviderForCategory:1];
      [(MRPlatterViewController *)self setVisualStylingProvider:v9 forCategory:1];
    }
    if ([(MRPlatterViewController *)self isViewLoaded])
    {
      if (v14)
      {
        double v10 = [(MRPlatterViewController *)self view];
        [v10 insertSubview:v14 atIndex:0];

        double v11 = [(MRPlatterViewController *)self view];
        [v11 setNeedsLayout];
      }
      else
      {
        double v12 = [(UIView *)v8 superview];
        v13 = [(MRPlatterViewController *)self view];

        if (v12 == v13) {
          [(UIView *)v8 removeFromSuperview];
        }
      }
    }

    objc_super v5 = v14;
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if (self->__continuousCornerRadius != a3)
  {
    self->__continuousCornerRadius = a3;
    id v4 = [(MRPlatterViewController *)self backgroundView];
    [v4 _setContinuousCornerRadius:self->__continuousCornerRadius];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_int64_t style = a3;
    [(MRPlatterViewController *)self _updateSecondaryStringFormat];
    [(MRPlatterViewController *)self _updateStyle];
    if (self->_style)
    {
      if (([(MRPlatterViewController *)self supportedModes] & 2) != 0
        && ([(MRPlatterViewController *)self supportedModes] & 1) != 0)
      {
        [(MRPlatterViewController *)self _setRoutingPickerVisible:0 animated:0];
      }
    }
  }
}

- (void)setEndpointController:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (MediaControlsEndpointController *)a3;
  p_endpointController = &self->_endpointController;
  double v7 = [(MediaControlsEndpointController *)self->_endpointController delegate];

  if (v7 == self) {
    [(MediaControlsEndpointController *)*p_endpointController setDelegate:0];
  }
  [(MediaControlsEndpointController *)v5 setDelegate:self];
  double v8 = [(MRPlatterViewController *)self label];
  [(MediaControlsEndpointController *)v5 setLabel:v8];

  double v9 = MCLogCategoryRouting();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    double v17 = self;
    __int16 v18 = 2114;
    double v19 = v5;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ changing to endpoint controller: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  if (*p_endpointController != v5)
  {
    objc_storeStrong((id *)&self->_endpointController, a3);
    double v10 = [(MRPlatterViewController *)self volumeContainerView];
    double v11 = [v10 volumeSlider];

    if (v11)
    {
      double v12 = [(MediaControlsEndpointController *)v5 route];

      if (v12)
      {
        v13 = [(MediaControlsEndpointController *)v5 route];
        double v14 = [(MRPlatterViewController *)self volumeContainerView];
        v15 = [v14 volumeSlider];
        [v15 setGroupRoute:v13];
      }
      else
      {
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:0 outputDeviceRoute:0];
        double v14 = [(MRPlatterViewController *)self volumeContainerView];
        v15 = [v14 volumeSlider];
        [v15 setVolumeDataSource:v13];
      }
    }
    [(MRPlatterViewController *)self _updateHeaderUI];
  }
}

- (void)setLabel:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_label, "isEqual:") & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    label = self->_label;
    self->_label = v4;

    [(MediaControlsEndpointController *)self->_endpointController setLabel:v6];
  }
}

- (void)setPlaceholderString:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_placeholderString != v6)
  {
    objc_storeStrong((id *)&self->_placeholderString, a3);
    objc_super v5 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    [v5 setPlaceholderString:v6];
  }
}

- (UIView)effectiveFooterView
{
  unint64_t style = self->_style;
  if (style >= 5)
  {
    if (style == 5)
    {
      BOOL v3 = [(MRPlatterViewController *)self videoPickerFooterView];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = [(MRPlatterViewController *)self volumeContainerView];
  }

  return (UIView *)v3;
}

- (UIView)effectiveHeaderView
{
  unint64_t style = self->_style;
  if (style >= 5)
  {
    if (style == 5)
    {
      BOOL v3 = [(MRPlatterViewController *)self videoPickerHeaderView];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  }

  return (UIView *)v3;
}

- (id)_route
{
  v2 = [(MRPlatterViewController *)self endpointController];
  BOOL v3 = [v2 route];

  return v3;
}

- (void)_updateStyle
{
  int64_t style = self->_style;
  id v4 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v4 setStyle:style];

  int64_t v5 = self->_style;
  id v6 = [(MRPlatterViewController *)self parentContainerView];
  [v6 setStyle:v5];

  int64_t v7 = self->_style;
  double v8 = [(MRPlatterViewController *)self volumeContainerView];
  [v8 setStyle:v7];

  if ((unint64_t)(self->_style - 1) > 1)
  {
    uint64_t v13 = [(MRPlatterViewController *)self allowsNowPlayingAppLaunch] ^ 1;
    double v9 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    double v10 = [v9 launchNowPlayingAppButton];
    double v11 = v10;
    uint64_t v12 = v13;
  }
  else
  {
    double v9 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    double v10 = [v9 launchNowPlayingAppButton];
    double v11 = v10;
    uint64_t v12 = 1;
  }
  [v10 setHidden:v12];

  switch(self->_style)
  {
    case 0:
    case 3:
    case 4:
      double v14 = [(MRPlatterViewController *)self routingCornerView];
      double v15 = 0.0;
      [v14 setAlpha:0.0];

      int v16 = [(MRPlatterViewController *)self parentContainerView];
      [v16 setAlpha:1.0];

      double v17 = [(MRPlatterViewController *)self effectiveFooterView];
      [v17 setAlpha:1.0];

      BOOL v18 = [(MRPlatterViewController *)self _canToggleRoutingPicker];
      double v19 = [(MRPlatterViewController *)self parentContainerView];
      uint64_t v20 = [v19 topDividerView];
      double v21 = v20;
      if (!v18) {
        goto LABEL_14;
      }
      [v20 setAlpha:1.0];

      if ([(MRPlatterViewController *)self selectedMode] == 1) {
        double v15 = 1.0;
      }
      double v22 = [(MRPlatterViewController *)self parentContainerView];
      double v23 = [v22 bottomDividerView];
      v24 = v23;
      double v25 = v15;
      goto LABEL_15;
    case 1:
      uint64_t v26 = [(MRPlatterViewController *)self routingCornerView];
      [v26 setAlpha:1.0];

      v27 = [(MRPlatterViewController *)self parentContainerView];
      uint64_t v28 = v27;
      double v29 = 1.0;
      goto LABEL_13;
    case 2:
      double v35 = [(MRPlatterViewController *)self routingCornerView];
      [v35 setAlpha:0.0];

      v27 = [(MRPlatterViewController *)self parentContainerView];
      uint64_t v28 = v27;
      double v29 = 0.0;
LABEL_13:
      [v27 setAlpha:v29];

      double v36 = [(MRPlatterViewController *)self effectiveFooterView];
      [v36 setAlpha:0.0];

      double v19 = [(MRPlatterViewController *)self parentContainerView];
      uint64_t v20 = [v19 topDividerView];
      double v21 = v20;
LABEL_14:
      [v20 setAlpha:0.0];

      double v22 = [(MRPlatterViewController *)self parentContainerView];
      double v23 = [v22 bottomDividerView];
      v24 = v23;
      double v25 = 0.0;
      goto LABEL_15;
    case 5:
      long long v30 = [(MRPlatterViewController *)self routingCornerView];
      [v30 setAlpha:0.0];

      double v31 = [(MRPlatterViewController *)self parentContainerView];
      [v31 setAlpha:1.0];

      double v32 = [(MRPlatterViewController *)self effectiveFooterView];
      [v32 setAlpha:1.0];

      double v33 = [(MRPlatterViewController *)self parentContainerView];
      double v34 = [v33 topDividerView];
      [v34 setAlpha:1.0];

      double v22 = [(MRPlatterViewController *)self parentContainerView];
      double v23 = [v22 bottomDividerView];
      v24 = v23;
      double v25 = 1.0;
LABEL_15:
      [v23 setAlpha:v25];

      break;
    default:
      break;
  }
  [(MRPlatterViewController *)self _updateOnScreenForStyle:self->_style];
  if ((unint64_t)(self->_style - 1) <= 1) {
    [(MRPlatterViewController *)self _dismissShareAudioViewController];
  }
  id v37 = [(MRPlatterViewController *)self view];
  [v37 setNeedsLayout];
}

- (id)_tvMediaRemoteIdentifier
{
  v2 = [(MRPlatterViewController *)self _route];
  if ((([v2 isAppleTVRoute] & 1) != 0
     || [v2 containsDeviceWithSubtype:18])
    && ([v2 endpoint], MRAVEndpointGetExternalDevice()))
  {
    BOOL v3 = (void *)MRExternalDeviceCopyUniqueIdentifier();
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_tvAirplayIdentifier
{
  v2 = [(MRPlatterViewController *)self _route];
  id v3 = [v2 endpointWrapper];
  [v3 unwrappedValue];
  id v4 = (void *)MRAVEndpointCopyOutputDevices();

  [v4 firstObject];
  if (([v2 isAppleTVRoute] & 1) != 0
    || [v2 isTVRoute] && MRAVOutputDeviceIsAddedToHomeKit())
  {
    uint64_t v5 = [v2 groupLeaderAirplayIdentifier];
LABEL_3:
    id v6 = (void *)v5;
    goto LABEL_11;
  }
  if ([v2 isDeviceRoute] && objc_msgSend(v2, "isAirPlayingToDevice"))
  {
    uint64_t v7 = [v4 count];
    if (MRAVOutputDeviceGetSubtype() == 13) {
      int v8 = MRAVOutputDeviceSupportsRapport();
    }
    else {
      int v8 = 0;
    }
    if (MRAVOutputDeviceGetSubtype() == 11) {
      int IsAddedToHomeKit = MRAVOutputDeviceIsAddedToHomeKit();
    }
    else {
      int IsAddedToHomeKit = 0;
    }
    id v6 = 0;
    if (v7 != 1 || !(v8 | IsAddedToHomeKit)) {
      goto LABEL_11;
    }
    uint64_t v5 = MRAVOutputDeviceCopyUniqueIdentifier();
    goto LABEL_3;
  }
  id v6 = 0;
LABEL_11:

  return v6;
}

- (void)_prewarmTVRemoteIfNeeded
{
  if ([(MRPlatterViewController *)self shouldShowTVRemoteButton]
    && [(MRPlatterViewController *)self _shouldUseViewServiceToPresentTVRemote])
  {
    id v3 = [MEMORY[0x1E4FAA430] sharedInstance];
    [v3 prewarm];
  }
}

- (BOOL)_shouldUseViewServiceToPresentTVRemote
{
  id v3 = [(MRPlatterViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 shouldPresentUsingViewServicePlatterViewController:self] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v5 userInterfaceIdiom]) {
      LOBYTE(v4) = 0;
    }
    else {
      int v4 = CCUIIsPortrait() ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)_isExpanded
{
  return ![(MRPlatterViewController *)self style]
      || [(MRPlatterViewController *)self style] == 3
      || [(MRPlatterViewController *)self style] == 4;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return 0;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F069F2F0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  if (self->_visualStylingProvider != v6)
  {
    BOOL v18 = v6;
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [(MediaControlsHeaderView *)self->_nowPlayingHeaderView setVisualStylingProvider:*p_visualStylingProvider];
    int v8 = *p_visualStylingProvider;
    double v9 = [(MediaControlsParentContainerView *)self->_parentContainerView timeControl];
    [v9 setVisualStylingProvider:v8];

    double v10 = *p_visualStylingProvider;
    double v11 = [(MediaControlsParentContainerView *)self->_parentContainerView transportStackView];
    [v11 setVisualStylingProvider:v10];

    uint64_t v12 = *p_visualStylingProvider;
    uint64_t v13 = [(MediaControlsParentContainerView *)self->_parentContainerView topDividerView];
    [v13 setVisualStylingProvider:v12];

    double v14 = *p_visualStylingProvider;
    double v15 = [(MediaControlsParentContainerView *)self->_parentContainerView bottomDividerView];
    [v15 setVisualStylingProvider:v14];

    [(MediaControlsVolumeContainerView *)self->_volumeContainerView setVisualStylingProvider:*p_visualStylingProvider];
    [(MRMediaControlsVideoPickerHeaderView *)self->_videoPickerHeaderView setVisualStylingProvider:*p_visualStylingProvider];
    [(MRMediaControlsVideoPickerFooterView *)self->_videoPickerFooterView setVisualStylingProvider:*p_visualStylingProvider];
    int v16 = [(MRPlatterViewController *)self routingViewController];
    double v17 = [v16 _tableView];
    [v17 reloadData];

    id v6 = v18;
  }
}

- (SFShareAudioViewController)shareAudioViewController
{
  shareAudioViewController = self->_shareAudioViewController;
  if (!shareAudioViewController)
  {
    int v4 = [MEMORY[0x1E4F9F760] instantiateViewController];
    [v4 setFlags:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__MRPlatterViewController_shareAudioViewController__block_invoke;
    v8[3] = &unk_1E5F0DCC0;
    v8[4] = self;
    [v4 setCompletion:v8];
    uint64_t v5 = self->_shareAudioViewController;
    self->_shareAudioViewController = (SFShareAudioViewController *)v4;
    id v6 = v4;

    shareAudioViewController = self->_shareAudioViewController;
  }

  return shareAudioViewController;
}

void __51__MRPlatterViewController_shareAudioViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [v5 mediaRouteIdentifier];
    int v9 = 138412546;
    double v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEBUG, "ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _dismissShareAudioViewController];
}

- (void)_showShareAudioViewController
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MRPlatterViewController__showShareAudioViewController__block_invoke;
  v5[3] = &unk_1E5F0F9A0;
  v5[4] = self;
  v2 = v5;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v3 = (void (*)(void *))getSBSRequestPasscodeUnlockAlertUISymbolLoc_ptr;
  double v10 = getSBSRequestPasscodeUnlockAlertUISymbolLoc_ptr;
  if (!getSBSRequestPasscodeUnlockAlertUISymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getSBSRequestPasscodeUnlockAlertUISymbolLoc_block_invoke;
    v6[3] = &unk_1E5F0FAA8;
    v6[4] = &v7;
    __getSBSRequestPasscodeUnlockAlertUISymbolLoc_block_invoke((uint64_t)v6);
    id v3 = (void (*)(void *))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
  {
    int v4 = (_Unwind_Exception *)-[MRPlatterViewController _showShareAudioViewController]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v4);
  }
  v3(v2);
}

void __56__MRPlatterViewController__showShareAudioViewController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) shareAudioViewController];
    int v4 = [*(id *)(a1 + 32) view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [v3 view];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    double v14 = [v3 view];
    [v14 setAlpha:0.0];

    double v15 = *(double *)(*(void *)(a1 + 32) + 1048);
    int v16 = [v3 view];
    [v16 _setContinuousCornerRadius:v15];

    double v17 = [v3 view];
    [v17 setClipsToBounds:1];

    [*(id *)(a1 + 32) addChildViewController:v3];
    BOOL v18 = [*(id *)(a1 + 32) view];
    double v19 = [v3 view];
    [v18 addSubview:v19];

    [v3 beginAppearanceTransition:1 animated:1];
    uint64_t v20 = (void *)MEMORY[0x1E4FB1EB0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __56__MRPlatterViewController__showShareAudioViewController__block_invoke_2;
    v27[3] = &unk_1E5F0D8E8;
    id v21 = v3;
    uint64_t v22 = *(void *)(a1 + 32);
    id v28 = v21;
    uint64_t v29 = v22;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__MRPlatterViewController__showShareAudioViewController__block_invoke_3;
    v24[3] = &unk_1E5F0F978;
    id v25 = v21;
    uint64_t v26 = v22;
    id v23 = v21;
    [v20 animateWithDuration:v27 animations:v24 completion:0.25];
  }
}

uint64_t __56__MRPlatterViewController__showShareAudioViewController__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  id v3 = *(void **)(*(void *)(a1 + 40) + 1000);

  return [v3 setAlpha:0.0];
}

uint64_t __56__MRPlatterViewController__showShareAudioViewController__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) endAppearanceTransition];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 didMoveToParentViewController:v3];
}

- (void)_dismissShareAudioViewController
{
  shareAudioViewController = self->_shareAudioViewController;
  if (shareAudioViewController)
  {
    int v4 = shareAudioViewController;
    double v5 = self->_shareAudioViewController;
    self->_shareAudioViewController = 0;

    [(SFShareAudioViewController *)v4 willMoveToParentViewController:0];
    [(SFShareAudioViewController *)v4 beginAppearanceTransition:0 animated:1];
    double v6 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke;
    v10[3] = &unk_1E5F0D8E8;
    double v11 = v4;
    double v12 = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke_2;
    v8[3] = &unk_1E5F0EE58;
    double v9 = v11;
    double v7 = v11;
    [v6 animateWithDuration:v10 animations:v8 completion:0.25];
  }
}

uint64_t __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 1000);

  return [v3 setAlpha:1.0];
}

uint64_t __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endAppearanceTransition];
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 removeFromParentViewController];
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_transitioning = a3;
  double v5 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v5 setTransitioning:v3];

  int64_t style = self->_style;
  if (style == 2)
  {
    BOOL v9 = !self->_transitioning;
    double v10 = [(MRPlatterViewController *)self routingCornerView];
    [v10 setHidden:v9];

    BOOL v11 = !self->_transitioning;
    double v12 = [(MRPlatterViewController *)self parentContainerView];
    [v12 setHidden:v11];
  }
  else
  {
    if (style != 1)
    {
      BOOL v16 = !self->_transitioning;
      double v17 = [(MRPlatterViewController *)self routingCornerView];
      [v17 setHidden:v16];

      BOOL v18 = [(MRPlatterViewController *)self parentContainerView];
      [v18 setHidden:0];

      double v14 = [(MRPlatterViewController *)self effectiveFooterView];
      id v19 = v14;
      BOOL v15 = 0;
      goto LABEL_8;
    }
    double v7 = [(MRPlatterViewController *)self routingCornerView];
    [v7 setHidden:0];

    double v8 = [(MRPlatterViewController *)self parentContainerView];
    [v8 setHidden:0];
  }
  BOOL v13 = !self->_transitioning;
  double v14 = [(MRPlatterViewController *)self effectiveFooterView];
  id v19 = v14;
  BOOL v15 = v13;
LABEL_8:
  [v14 setHidden:v15];
}

- (void)setDisplayElements:(id)a3
{
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_displayElements, "isEqualToArray:"))
  {
    int v4 = (NSArray *)[v8 copy];
    displayElements = self->_displayElements;
    self->_displayElements = v4;

    BOOL v6 = [(MRPlatterViewController *)self isDeviceUnlocked];
    double v7 = [(MRPlatterViewController *)self endpointController];
    [v7 setDeviceUnlocked:v6];
  }
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    BOOL v3 = a3;
    self->_onScreen = a3;
    double v5 = [(MRPlatterViewController *)self endpointController];
    [v5 setOnScreen:v3];

    BOOL v6 = [(MRPlatterViewController *)self endpointController];
    id v7 = [v6 proxyDelegate];

    if (v3) {
      [v7 beginObserving];
    }
    else {
      [v7 endObserving];
    }
    [(MRPlatterViewController *)self _updateOnScreenForStyle:self->_style];
  }
}

- (void)_updateOnScreenForStyle:(int64_t)a3
{
  uint64_t v4 = ((unint64_t)a3 < 5) & (0x19u >> a3) & [(MRPlatterViewController *)self isOnScreen];
  double v5 = [(MRPlatterViewController *)self volumeContainerView];
  [v5 setOnScreen:v4];

  BOOL v6 = [(MRPlatterViewController *)self isOnScreen];
  id v7 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v7 setMarqueeEnabled:v6];
}

- (void)setSupportedModes:(unint64_t)a3
{
  if (self->_supportedModes != a3)
  {
    self->_supportedModes = a3;
    unint64_t v4 = [(MRPlatterViewController *)self supportedModes];
    unint64_t v5 = v4 & (1 << [(MRPlatterViewController *)self selectedMode]);
    if (v5 != 1 << [(MRPlatterViewController *)self selectedMode])
    {
      uint64_t v6 = 0;
      char v7 = 1;
      while (1)
      {
        char v8 = v7;
        if (([(MRPlatterViewController *)self supportedModes] & (1 << v6)) != 0) {
          break;
        }
        char v7 = 0;
        uint64_t v6 = 1;
        if ((v8 & 1) == 0) {
          goto LABEL_8;
        }
      }
      [(MRPlatterViewController *)self setSelectedMode:v6];
    }
LABEL_8:
    [(MRPlatterViewController *)self _updateConfiguration];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3) {
    self->_selected = a3;
  }
}

- (void)setSelectedMode:(int64_t)a3
{
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (((1 << a3) & ~[(MRPlatterViewController *)self supportedModes]) == 0)
  {
    char v7 = [(MRPlatterViewController *)self parentContainerView];
    [v7 setSelectedMode:(int)a3 animated:v4];

    if (self->_selectedMode != a3)
    {
      self->_selectedMode = a3;
      [(MRPlatterViewController *)self _updateConfiguration];
      id v8 = [(MRPlatterViewController *)self view];
      [v8 setNeedsLayout];
    }
  }
}

- (void)_updateConfiguration
{
  if (([(MRPlatterViewController *)self supportedModes] & 2) != 0
    && ([(MRPlatterViewController *)self supportedModes] & 1) != 0)
  {
    int64_t selectedMode = self->_selectedMode;
    if (selectedMode == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2 * (selectedMode == 0);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v5 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v5 setButtonType:v3];
}

- (void)endpointController:(id)a3 didLoadNewResponse:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = MCLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v6 tracklist];
    double v10 = [v9 playingItem];
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "[MRPlatterViewController] didLoadNewResponse %@. PlayingItem: %@.", (uint8_t *)&v19, 0x16u);
  }
  BOOL v11 = [v7 representedBundleID];

  double v12 = [(MPAVRoutingViewController *)self->_routingViewController _routingController];
  [v12 setRepresentedBundleID:v11];

  BOOL v13 = [(MRPlatterViewController *)self endpointController];
  double v14 = [v13 response];
  BOOL v15 = [v14 tracklist];
  BOOL v16 = [v15 playingItem];
  double v17 = [v16 languageOptionGroups];

  if ([v17 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_languageOptionsViewController);
    [WeakRetained setLanguageOptionGroups:v17];
  }
  [(MRPlatterViewController *)self _updateHeaderUI];
}

- (void)endpointControllerDidUpdateRoutingAvailability:(id)a3
{
  [(MRPlatterViewController *)self _updateRoutingCornerView];
  [(MRPlatterViewController *)self _updateRoutingIndicators];

  [(MRPlatterViewController *)self _updateRouteNameLabel];
}

- (void)endpointControllerRouteDidUpdate:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(MRPlatterViewController *)self volumeContainerView];
  id v5 = [v4 volumeSlider];

  if (v5)
  {
    id v6 = [v12 route];
    id v7 = [(MRPlatterViewController *)self volumeContainerView];
    id v8 = [v7 volumeSlider];
    [v8 setGroupRoute:v6];
  }
  [(MRPlatterViewController *)self _updateRouteNameLabel];
  BOOL v9 = [(MRPlatterViewController *)self parentContainerView];
  double v10 = [v9 transportStackView];
  [v10 updateOnRouteChange];

  [(MRPlatterViewController *)self _prewarmTVRemoteIfNeeded];
  BOOL v11 = [(MRPlatterViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "platterViewController:shouldDisplayPlatterDidChange:", self, -[MRPlatterViewController shouldDisplayPlatter](self, "shouldDisplayPlatter"));
  }
}

- (void)_updateHeaderUI
{
  if (![(MRPlatterViewController *)self isOnScreen]) {
    return;
  }
  uint64_t v3 = [(MRPlatterViewController *)self endpointController];
  id v52 = [v3 response];

  BOOL v4 = [(MRPlatterViewController *)self parentContainerView];
  id v5 = [v4 containerView];
  [v5 setResponse:v52];

  if (!v52) {
    goto LABEL_13;
  }
  BOOL v6 = [(MediaControlsEndpointController *)self->_endpointController isDeviceSystemRoute];
  id v7 = [v52 tracklist];
  id v8 = [v7 playingItemIndexPath];

  if (!v6 || v8 != 0)
  {
    if (v8)
    {
      double v10 = [v52 tracklist];
      BOOL v11 = [v10 items];
      id v12 = [v11 firstSection];
      BOOL v13 = [v12 metadataObject];

      double v14 = [v52 tracklist];
      BOOL v15 = [v14 items];
      BOOL v16 = [v52 tracklist];
      double v17 = [v16 playingItemIndexPath];
      BOOL v18 = [v15 itemAtIndexPath:v17];

      uint64_t v19 = [v18 explicitBadge];
      id v20 = (void *)v19;
      if (v19) {
        __int16 v21 = (__CFString *)v19;
      }
      else {
        __int16 v21 = @"🅴";
      }
      uint64_t v22 = [@" " stringByAppendingString:v21];
      [(MRPlatterViewController *)self setExplicitString:v22];

      uint64_t v23 = [v18 metadataObject];
      [(MRPlatterViewController *)self _updateControlCenterMetadata:v23 sectionMetadata:v13];

      goto LABEL_40;
    }
LABEL_13:
    v24 = [(MRPlatterViewController *)self endpointController];
    id v25 = [v24 configuration];

    uint64_t v26 = [(MRPlatterViewController *)self endpointController];
    uint64_t v27 = [v26 state];

    if (v27 == 2 || v27 == 1)
    {
      double v32 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
      double v33 = v32;
      double v34 = @"ROUTE_CONNECTING_TITLE";
    }
    else if (v27 == -1)
    {
      if (!v25 || self->_style == 3)
      {
        BOOL v13 = &stru_1F06524E0;
LABEL_30:
        double v42 = [(MRPlatterViewController *)self endpointController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v44 = [(MRPlatterViewController *)self endpointController];
          int v45 = [v44 isEndpointDiscovered] ^ 1;
        }
        else
        {
          int v45 = 0;
        }
        id v46 = [(MRPlatterViewController *)self nowPlayingHeaderView];
        [v46 setPrimaryString:v13];

        if (v45)
        {
          id v46 = [(MRPlatterViewController *)self placeholderString];
          BOOL v47 = v46 != 0;
        }
        else
        {
          BOOL v47 = 0;
        }
        double v48 = [(MRPlatterViewController *)self nowPlayingHeaderView];
        [v48 setShowPlaceholderString:v47];

        if (v45) {
        double v40 = [(MRPlatterViewController *)self nowPlayingHeaderView];
        }
        double v41 = v40;
        goto LABEL_39;
      }
      double v32 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
      double v33 = v32;
      double v34 = @"ROUTE_NOT_CONNECTED_TITLE";
    }
    else
    {
      double v32 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
      double v33 = v32;
      double v34 = @"MEDIA_CONTROLS_EMPTY_STATE_TITLE";
    }
    BOOL v13 = [v32 localizedStringForKey:v34 value:&stru_1F06524E0 table:@"MediaControls"];

    goto LABEL_30;
  }
  id v28 = [(MRPlatterViewController *)self endpointController];
  uint64_t v29 = [v28 representedBundleID];
  long long v30 = v29;
  if (v29) {
    double v31 = v29;
  }
  else {
    double v31 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  }
  BOOL v13 = v31;

  double v35 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v13];
  uint64_t v36 = [v35 localizedName];
  id v37 = (void *)v36;
  if (v36) {
    double v38 = (__CFString *)v36;
  }
  else {
    double v38 = &stru_1F06524E0;
  }
  double v39 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v39 setPrimaryString:v38];

  double v40 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  double v41 = v40;
LABEL_39:
  [v40 setSecondaryString:&stru_1F06524E0];

  CGFloat v49 = [(MRPlatterViewController *)self secondaryStringComponents];
  [v49 removeAllObjects];

  [(MRPlatterViewController *)self _updateSecondaryStringFormat];
  [(MRPlatterViewController *)self setArtworkCatalog:0];
  double v50 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  CGFloat v51 = [v50 artworkView];
  [v51 clearArtworkCatalogs];

  [(MRPlatterViewController *)self _updatePlaceholderArtwork];
LABEL_40:

  [(MRPlatterViewController *)self _updateRouteNameLabel];
  [(MRPlatterViewController *)self _updateRoutingCornerView];
  [(MRPlatterViewController *)self _updateRoutingIndicators];
}

- (void)_updateControlCenterMetadata:(id)a3 sectionMetadata:(id)a4
{
  id v36 = a4;
  id v8 = [a3 song];
  if ([v36 type] == 13)
  {
    BOOL v9 = [v36 radioStation];
  }
  else
  {
    BOOL v9 = 0;
  }
  double v10 = (void *)[v8 isExplicitSong];
  BOOL v11 = [v8 title];
  if (v10)
  {
    double v10 = [(MRPlatterViewController *)self explicitString];
    BOOL v4 = [v11 stringByAppendingString:v10];

    BOOL v11 = v4;
  }
  id v12 = v11;
  if (!v11)
  {
    BOOL v13 = (void *)MEMORY[0x1E4F223B8];
    double v10 = [(MRPlatterViewController *)self endpointController];
    BOOL v4 = [v10 bundleID];
    id v5 = [v13 applicationProxyForIdentifier:v4];
    id v12 = [v5 localizedName];
  }
  double v14 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v14 setPrimaryString:v12];

  if (!v11)
  {
  }
  BOOL v15 = [(MRPlatterViewController *)self secondaryStringComponents];
  [v15 removeAllObjects];

  if ([v8 shouldShowComposer])
  {
    BOOL v16 = [v8 composer];
    double v17 = [v16 name];

    if ([v17 length])
    {
      id v18 = [NSString alloc];
      uint64_t v19 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
      id v20 = [v19 localizedStringForKey:@"COMPOSED_BY_TITLE_%@" value:&stru_1F06524E0 table:@"MediaControls"];
      __int16 v21 = objc_msgSend(v18, "initWithFormat:", v20, v17);

      uint64_t v22 = [(MRPlatterViewController *)self secondaryStringComponents];
      [v22 addObject:v21];
    }
  }
  uint64_t v23 = [v8 artist];
  v24 = [v23 name];

  if ([v24 length])
  {
    id v25 = [(MRPlatterViewController *)self secondaryStringComponents];
    [v25 addObject:v24];
  }
  uint64_t v26 = [v8 album];
  uint64_t v27 = [v26 title];

  if ([v27 length])
  {
    id v28 = [(MRPlatterViewController *)self secondaryStringComponents];
    [v28 addObject:v27];
  }
  uint64_t v29 = [v9 attributionLabel];
  if ([v29 length])
  {
    long long v30 = [(MRPlatterViewController *)self secondaryStringComponents];
    [v30 addObject:v29];
  }
  double v31 = [(MRPlatterViewController *)self secondaryStringComponents];
  double v32 = [v31 componentsJoinedByString:@" — "];
  double v33 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v33 setSecondaryString:v32];

  double v34 = [v8 artworkCatalog];
  [(MRPlatterViewController *)self setArtworkCatalog:v34];

  [(MRPlatterViewController *)self _updateSecondaryStringFormat];
  double v35 = [(MRPlatterViewController *)self view];
  [v35 setNeedsLayout];
}

- (void)_updateRouteNameLabel
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MediaControlsEndpointController *)self->_endpointController route];
  BOOL v4 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  id v5 = [v4 routeLabel];
  [v5 setRoute:v3];

  BOOL v6 = [(MRPlatterViewController *)self endpointController];
  id v7 = [v6 response];
  id v8 = [v7 playerPath];
  BOOL v9 = [v8 bundleID];
  if ([v9 isEqualToString:@"com.apple.duetexpertd"])
  {
    int v10 = 1;
  }
  else
  {
    BOOL v11 = [(MRPlatterViewController *)self endpointController];
    id v12 = [v11 response];
    BOOL v13 = [v12 playerPath];
    double v14 = [v13 bundleID];
    int v10 = [v14 isEqualToString:@"duetexpertd"];
  }
  BOOL v15 = [(MRPlatterViewController *)self endpointController];
  BOOL v16 = [v15 response];
  double v17 = [v16 playerPath];
  id v18 = [v17 playerID];
  unsigned int v19 = [v18 isEqualToString:@"MagicalMomentsPlayer"];

  if (v19)
  {
    id v20 = MCLogCategoryDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = [(MRPlatterViewController *)self endpointController];
      uint64_t v22 = [v21 response];
      uint64_t v23 = [v22 playerPath];
      v24 = [v23 bundleID];
      int v29 = 138412290;
      long long v30 = v24;
      _os_log_impl(&dword_1AE7DF000, v20, OS_LOG_TYPE_DEFAULT, "MRPlatterViewController displaying MagicalMomentsPlayer suggestion for bundleID=%@", (uint8_t *)&v29, 0xCu);
    }
  }
  uint64_t v25 = v10 & v19;
  uint64_t v26 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  uint64_t v27 = [v26 routeLabel];
  [v27 setDisplayAsSiriSuggestion:v25];

  id v28 = [(MRPlatterViewController *)self view];
  [v28 setNeedsLayout];
}

- (void)setArtworkCatalog:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_artworkCatalog = (id *)&self->_artworkCatalog;
  artworkCatalog = self->_artworkCatalog;
  if (!v5)
  {
    id *p_artworkCatalog = 0;

    BOOL v11 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    id v12 = [v11 artworkView];
    [v12 setImage:0];

    [(MRPlatterViewController *)self _updatePlaceholderArtwork];
    BOOL v13 = [(MRPlatterViewController *)self effectiveHeaderView];
    [v13 setNeedsLayout];

    goto LABEL_14;
  }
  if (![(MPArtworkCatalog *)artworkCatalog isArtworkVisuallyIdenticalToCatalog:v5])
  {
    self->_int64_t failedArtworkRetryCount = 0;
LABEL_13:
    self->_failedToLoadArtwork = 0;
    objc_storeStrong((id *)&self->_artworkCatalog, a3);
    objc_msgSend(*p_artworkCatalog, "setFittingSize:", 60.0, 60.0);
    BOOL v16 = [(MRPlatterViewController *)self traitCollection];
    [v16 displayScale];
    objc_msgSend(*p_artworkCatalog, "setDestinationScale:");

    objc_initWeak((id *)buf, self);
    double v17 = (void *)MEMORY[0x1E4F77A30];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __45__MRPlatterViewController_setArtworkCatalog___block_invoke;
    v25[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v26, (id *)buf);
    id v18 = [v17 timerWithInterval:0 repeats:v25 block:1.0];
    artworkTimer = self->_artworkTimer;
    self->_artworkTimer = v18;

    [*p_artworkCatalog setCacheIdentifier:@"MediaControlsHeaderView" forRequestingContext:self];
    id v20 = *p_artworkCatalog;
    __int16 v21 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    uint64_t v22 = [v21 artworkView];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __45__MRPlatterViewController_setArtworkCatalog___block_invoke_133;
    v23[3] = &unk_1E5F0F9C8;
    objc_copyWeak(&v24, (id *)buf);
    [v20 setDestination:v22 configurationBlock:v23];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  if (!self->_failedToLoadArtwork) {
    goto LABEL_14;
  }
  int64_t failedArtworkRetryCount = self->_failedArtworkRetryCount;
  if (failedArtworkRetryCount < 3)
  {
    self->_int64_t failedArtworkRetryCount = failedArtworkRetryCount + 1;
    double v14 = MCLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int64_t v15 = self->_failedArtworkRetryCount;
      *(_DWORD *)buf = 134217984;
      int64_t v28 = v15;
      _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_ERROR, "MRPlatterViewController _failedToLoadArtwork=YES retryAttempt=%ld, retrying", buf, 0xCu);
    }

    goto LABEL_13;
  }
  BOOL v9 = MCLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int64_t v10 = self->_failedArtworkRetryCount;
    *(_DWORD *)buf = 134217984;
    int64_t v28 = v10;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_ERROR, "MRPlatterViewController _failedToLoadArtwork=YES retryAttemptsExhausted=%ld, leaving failed", buf, 0xCu);
  }

LABEL_14:
}

void __45__MRPlatterViewController_setArtworkCatalog___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = MCLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [WeakRetained artworkCatalog];
    int v4 = 134218240;
    id v5 = WeakRetained;
    __int16 v6 = 2048;
    id v7 = v3;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEBUG, "MRPlatterViewController: %p timeout while waiting for artworkCatalog=%p", (uint8_t *)&v4, 0x16u);
  }
  [WeakRetained _showPlaceholderArtwork];
}

void __45__MRPlatterViewController_setArtworkCatalog___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setArtworkTimer:0];
  if (v6
    && ([WeakRetained artworkCatalog],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    BOOL v9 = [WeakRetained nowPlayingHeaderView];
    int64_t v10 = [v9 placeholderArtworkView];
    [v10 setImage:0];

    [v5 setImage:v6];
    BOOL v11 = [WeakRetained effectiveHeaderView];
    [v11 setNeedsLayout];
  }
  else
  {
    id v12 = MCLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = [WeakRetained artworkCatalog];
      int v14 = 134218240;
      id v15 = v6;
      __int16 v16 = 2048;
      double v17 = v13;
      _os_log_impl(&dword_1AE7DF000, v12, OS_LOG_TYPE_ERROR, "MRPlatterViewController _failedToLoadArtwork image=%p artworkCatalog=%p", (uint8_t *)&v14, 0x16u);
    }
    [WeakRetained setFailedToLoadArtwork:1];
    [WeakRetained _showPlaceholderArtwork];
  }
  [WeakRetained _updateStyle];
}

- (void)_showPlaceholderArtwork
{
  uint64_t v3 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  int v4 = [v3 artworkView];
  [v4 setImage:0];

  [(MRPlatterViewController *)self _updatePlaceholderArtwork];
}

- (void)_updatePlaceholderArtwork
{
  uint64_t v3 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  int v4 = [v3 artworkView];
  id v5 = [v4 image];

  if (v5) {
    return;
  }
  id v6 = [(MRPlatterViewController *)self endpointController];
  id v7 = [v6 representedBundleID];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  }
  id v35 = v9;

  int64_t v10 = [(MRPlatterViewController *)self endpointController];
  uint64_t v11 = [v10 playerPath];
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = (void *)v11;
  uint64_t v13 = [(MRPlatterViewController *)self _route];
  if (!v13)
  {

LABEL_12:
LABEL_13:
    uint64_t v23 = [(MRPlatterViewController *)self _route];

    id v24 = [(MRPlatterViewController *)self placeholderDeviceIdentifier];

    uint64_t v25 = (void *)MEMORY[0x1E4F31850];
    if (!v24 || v23)
    {
      id v26 = [(MRPlatterViewController *)self _route];
      uint64_t v27 = [v25 _iconImageForRoute:v26];
    }
    else
    {
      id v26 = [(MRPlatterViewController *)self placeholderDeviceIdentifier];
      uint64_t v27 = [v25 _iconImageForIdentifier:v26];
    }
    int64_t v28 = (void *)v27;

    goto LABEL_18;
  }
  int v14 = (void *)v13;
  BOOL v15 = [(MediaControlsEndpointController *)self->_endpointController isDeviceSystemRoute];

  if (!v15) {
    goto LABEL_13;
  }
  __int16 v16 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v35];
  double v17 = [v16 localizedName];

  if (v17)
  {
    uint64_t v18 = [(MRPlatterViewController *)self traitCollection];
    [v18 displayScale];
    if (v19 == 0.0)
    {
      id v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v20 scale];
      double v22 = v21;
    }
    else
    {
      double v22 = v19;
    }

    int64_t v28 = [MEMORY[0x1E4FB1818] _applicationIconImageForBundleIdentifier:v35 format:0 scale:v22];
    uint64_t v29 = 0;
    goto LABEL_19;
  }
  int64_t v28 = [MEMORY[0x1E4F31850] _currentDeviceRoutingIconImage];
LABEL_18:
  uint64_t v29 = 1;
LABEL_19:
  long long v30 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  uint64_t v31 = [v30 placeholderArtworkView];
  [v31 setImage:v28];

  double v32 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v32 setScalePlaceholderImage:v29];

  double v33 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v33 updateArtworkStyle];

  double v34 = [(MRPlatterViewController *)self effectiveHeaderView];
  [v34 setNeedsLayout];
}

- (void)_updateSecondaryStringFormat
{
  int64_t style = self->_style;
  int v4 = [(MRPlatterViewController *)self secondaryStringComponents];
  id v7 = v4;
  if (style == 1) {
    [v4 firstObject];
  }
  else {
  id v5 = [v4 componentsJoinedByString:@" — "];
  }
  id v6 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v6 setSecondaryString:v5];
}

- (void)footerViewButtonPressed:(id)a3
{
  uint64_t v4 = [(MRPlatterViewController *)self delegate];
  if (self->_style == 5)
  {
    id v6 = (void *)v4;
    if (objc_opt_respondsToSelector())
    {
      id v5 = [(MPAVRoutingViewController *)self->_routingViewController _routingController];
      [v5 unpickTVRoutes];

      [v6 dismissPlatterViewController:self completion:0];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)headerViewButtonPressed:(id)a3
{
  if ([(MRPlatterViewController *)self selectedMode] != 1
    || ([(MRPlatterViewController *)self supportedModes] & 1) != 0)
  {
    if ([(MRPlatterViewController *)self style] == 3)
    {
      [(MRPlatterViewController *)self _presentRoutingViewControllerFromCoverSheet];
    }
    else if ([(MRPlatterViewController *)self _canToggleRoutingPicker])
    {
      BOOL v4 = [(MRPlatterViewController *)self selectedMode] == 0;
      [(MRPlatterViewController *)self _setRoutingPickerVisible:v4 animated:1];
    }
  }
  else
  {
    id v5 = [(MRPlatterViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 dismissPlatterViewController:self completion:0];
    }
  }
}

- (BOOL)_canToggleRoutingPicker
{
  if (self->_style != 3 && ([(MRPlatterViewController *)self supportedModes] & 2) != 0) {
    return [(MRPlatterViewController *)self supportedModes] & 1;
  }
  else {
    return 0;
  }
}

- (void)_setRoutingPickerVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MRPlatterViewController *)self delegate];
  double v8 = 0.0;
  if (v4)
  {
    double v8 = 0.25;
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v7, "platterViewController:willToggleRoutingPicker:", self, -[MRPlatterViewController selectedMode](self, "selectedMode") != 1);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__MRPlatterViewController__setRoutingPickerVisible_animated___block_invoke;
  v9[3] = &unk_1E5F0F588;
  BOOL v10 = a3;
  v9[4] = self;
  BOOL v11 = v4;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:v8];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "platterViewController:didToggleRoutingPicker:", self, -[MRPlatterViewController selectedMode](self, "selectedMode") == 1);
  }
}

uint64_t __61__MRPlatterViewController__setRoutingPickerVisible_animated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  BOOL v4 = *(unsigned char *)(a1 + 41) != 0;
  if (v2)
  {
    [v3 setSelectedMode:1 animated:v4];
    +[MediaControlsAnalytics postAnalyticKind:5];
  }
  else
  {
    [v3 setSelectedMode:0 animated:v4];
  }
  id v5 = *(void **)(a1 + 32);

  return [v5 _updateStyle];
}

- (void)_presentRoutingViewControllerFromCoverSheet
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F31910]);
  BOOL v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundleIdentifier];
  [v3 setPresentingAppBundleID:v5];

  if (MRAVOutputContextGetSharedAudioPresentationContext()) {
    id v6 = (void *)MRAVOutputContextCopyUniqueIdentifier();
  }
  else {
    id v6 = 0;
  }
  [v3 setRoutingContextUID:v6];
  if (MSVDeviceOSIsInternalInstall()
    && [(MRPlatterViewController *)self lockScreenPresentsOverrideRoutePicker])
  {
    int64_t v7 = [(MRPlatterViewController *)self lockScreenInternalRoutePickerOverrideWithDefaultStyle:2];
  }
  else
  {
    int64_t v7 = 2;
  }
  [v3 setStyle:v7];
  [v3 setShouldPreventAutorotation:1];
  [v3 setAllowsNowPlayingApplicationLaunch:1];
  double v8 = (MPMediaControls *)[objc_alloc(MEMORY[0x1E4F31908]) initWithConfiguration:v3];
  mediaControls = self->_mediaControls;
  self->_mediaControls = v8;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__MRPlatterViewController__presentRoutingViewControllerFromCoverSheet__block_invoke;
  v10[3] = &unk_1E5F0D7F8;
  void v10[4] = self;
  [(MPMediaControls *)self->_mediaControls setDismissHandler:v10];
  [(MPMediaControls *)self->_mediaControls present];
}

void __70__MRPlatterViewController__presentRoutingViewControllerFromCoverSheet__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 1160);
  *(void *)(v1 + 1160) = 0;
}

- (void)headerViewLaunchNowPlayingAppButtonPressed:(id)a3
{
  BOOL v4 = [(MRPlatterViewController *)self delegate];
  id v5 = [(MRPlatterViewController *)self endpointController];
  id v6 = [v5 configuration];
  if ([v6 allowsNowPlayingApplicationLaunch])
  {

LABEL_4:
    if (objc_opt_respondsToSelector())
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __70__MRPlatterViewController_headerViewLaunchNowPlayingAppButtonPressed___block_invoke;
      v11[3] = &unk_1E5F0D7F8;
      v11[4] = self;
      double v8 = v11;
      id v9 = v4;
      BOOL v10 = self;
LABEL_9:
      [v9 dismissPlatterViewController:v10 completion:v8];
      goto LABEL_10;
    }
    [(MediaControlsEndpointController *)self->_endpointController launchNowPlayingApp];
    goto LABEL_10;
  }
  BOOL v7 = [(MRPlatterViewController *)self allowsNowPlayingAppLaunch];

  if (v7) {
    goto LABEL_4;
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = v4;
    BOOL v10 = self;
    double v8 = 0;
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __70__MRPlatterViewController_headerViewLaunchNowPlayingAppButtonPressed___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1240) launchNowPlayingApp];
}

- (void)willTransitionToSize:(CGSize)a3 withCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  unint64_t style = self->_style;
  if (style <= 4 && style != 3 && (self->_lastKnownSize.width != width || self->_lastKnownSize.height != height))
  {
    self->_lastKnownSize.double width = width;
    self->_lastKnownSize.double height = height;
    BOOL v11 = [(MRPlatterViewController *)self view];
    [v11 setClipsToBounds:1];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke;
    v13[3] = &unk_1E5F0F9F0;
    *(double *)&v13[5] = width;
    *(double *)&v13[6] = height;
    v13[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke_2;
    v12[3] = &unk_1E5F0D7F8;
    v12[4] = self;
    [v7 animateAlongsideTransition:v13 completion:v12];
  }
}

void __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke(uint64_t a1)
{
  if (*(double *)(a1 + 40) <= 200.0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = 1;
  }
  else
  {
    double v2 = *(double *)(a1 + 48);
    id v3 = *(void **)(a1 + 32);
    if (v2 <= 108.0) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  [v3 setStyle:v4];
  [*(id *)(a1 + 32) setTransitioning:1];
  id v5 = [*(id *)(a1 + 32) view];
  [v5 setNeedsLayout];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 layoutIfNeeded];
}

void __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitioning:0];
  double v2 = [*(id *)(a1 + 32) nowPlayingHeaderView];
  [v2 clearOverrideSize];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 setClipsToBounds:0];
}

- (void)presentRatingActionSheet:(id)a3 sourceView:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 likeCommand];
  uint64_t v8 = [v7 value];

  id v9 = [v5 dislikeCommand];
  uint64_t v10 = [v9 value];

  BOOL v11 = [v5 wishlistCommand];
  unsigned int v74 = [v11 value];

  id v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_35];
  int v14 = [v12 view];
  [v14 setTintColor:v13];

  BOOL v15 = [v5 likeCommand];

  if (v15)
  {
    unsigned int v73 = v10;
    id v16 = v6;
    double v17 = [v5 likeCommand];
    uint64_t v18 = [v17 localizedTitle];
    double v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      double v21 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
      id v20 = [v21 localizedStringForKey:@"LIKE_TRACK_DEFAULT_TITLE" value:&stru_1F06524E0 table:@"MediaControls"];
    }
    double v22 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v23 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    id v24 = [v22 imageNamed:@"CC-Action-Star" inBundle:v23];

    uint64_t v25 = (void *)MEMORY[0x1E4FB1410];
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_2;
    v88[3] = &unk_1E5F0FA38;
    id v89 = v5;
    char v90 = v8;
    id v26 = [v25 _actionWithTitle:v20 image:v24 style:0 handler:v88 shouldDismissHandler:&__block_literal_global_160];
    [v26 _setChecked:v8];
    [v12 addAction:v26];

    id v6 = v16;
    uint64_t v10 = v73;
  }
  uint64_t v27 = [v5 dislikeCommand];

  if (v27)
  {
    int64_t v28 = [v5 dislikeCommand];
    uint64_t v29 = [v28 localizedTitle];
    long long v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      double v32 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
      id v31 = [v32 localizedStringForKey:@"DISLIKE_TRACK_DEFAULT_TITLE" value:&stru_1F06524E0 table:@"MediaControls"];
    }
    double v33 = (void *)MEMORY[0x1E4FB1818];
    double v34 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    id v35 = [v33 imageNamed:@"CC-Action-X" inBundle:v34];

    id v36 = (void *)MEMORY[0x1E4FB1410];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_4;
    v85[3] = &unk_1E5F0FA38;
    id v86 = v5;
    char v87 = v10;
    id v37 = [v36 _actionWithTitle:v31 image:v35 style:0 handler:v85 shouldDismissHandler:&__block_literal_global_168];
    [v37 _setChecked:v10];
    [v12 addAction:v37];
  }
  double v38 = [v5 wishlistCommand];

  if (v38)
  {
    double v39 = [v5 likeCommand];
    if (v39)
    {
    }
    else
    {
      double v40 = [v5 dislikeCommand];

      if (!v40)
      {
LABEL_16:
        double v41 = [v5 wishlistCommand];
        double v42 = [v41 localizedTitle];
        double v43 = v42;
        if (v42)
        {
          id v44 = v42;
        }
        else
        {
          int v45 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
          id v44 = [v45 localizedStringForKey:@"BOOKMARK_TRACK_DEFAULT_TITLE" value:&stru_1F06524E0 table:@"MediaControls"];
        }
        id v46 = (void *)MEMORY[0x1E4FB1818];
        BOOL v47 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
        double v48 = [v46 imageNamed:@"CC-Action-Plus" inBundle:v47];

        CGFloat v49 = (void *)MEMORY[0x1E4FB1410];
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_6;
        v82[3] = &unk_1E5F0FA38;
        id v83 = v5;
        char v84 = v74;
        double v50 = [v49 _actionWithTitle:v44 image:v48 style:0 handler:v82 shouldDismissHandler:&__block_literal_global_176];
        [v50 _setChecked:v74];
        [v12 addAction:v50];

        goto LABEL_20;
      }
    }
    [v12 _addSectionDelimiter];
    goto LABEL_16;
  }
LABEL_20:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  CGFloat v51 = [v12 actions];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v79 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        double v57 = [MEMORY[0x1E4FB1618] labelColor];
        [v56 _setTitleTextColor:v57];

        [v56 _setTitleTextAlignment:4];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v78 objects:v91 count:16];
    }
    while (v53);
  }

  double v58 = (void *)MEMORY[0x1E4FB1410];
  double v59 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
  double v60 = [v59 localizedStringForKey:@"CANCEL" value:&stru_1F06524E0 table:@"MediaControls"];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_8;
  v76[3] = &unk_1E5F0FA80;
  id v77 = v12;
  id v61 = v12;
  double v62 = [v58 actionWithTitle:v60 style:1 handler:v76];

  [v61 addAction:v62];
  double v63 = [v61 popoverPresentationController];
  [v63 setSourceView:v6];

  [v6 bounds];
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  double v71 = v70;
  double v72 = [v61 popoverPresentationController];
  objc_msgSend(v72, "setSourceRect:", v65, v67, v69, v71);

  [(MRPlatterViewController *)self presentViewController:v61 animated:1 completion:0];
}

id __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 userInterfaceStyle];
  uint64_t v4 = [v2 accessibilityContrast];

  if (v3 == 2)
  {
    double v5 = 0.980392157;
    if (v4 == 1)
    {
      double v6 = 0.345098039;
      double v7 = 0.415686275;
    }
    else
    {
      double v6 = 0.176470588;
      double v7 = 0.282352941;
    }
  }
  else if (v4 == 1)
  {
    double v5 = 0.839215686;
    double v7 = 0.0901960784;
    double v6 = 0.0;
  }
  else
  {
    double v5 = 0.980392157;
    double v6 = 0.137254902;
    double v7 = 0.231372549;
  }
  uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithRed:v5 green:v6 blue:v7 alpha:1.0];

  return v8;
}

void __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F76E88];
  id v4 = [*(id *)(a1 + 32) likeCommand];
  uint64_t v3 = [v4 changeValue:*(unsigned char *)(a1 + 40) == 0];
  [v2 performRequest:v3 completion:0];
}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_3()
{
  return 1;
}

void __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F76E88];
  id v4 = [*(id *)(a1 + 32) dislikeCommand];
  uint64_t v3 = [v4 changeValue:*(unsigned char *)(a1 + 40) == 0];
  [v2 performRequest:v3 completion:0];
}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_5()
{
  return 1;
}

void __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_6(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F76E88];
  id v4 = [*(id *)(a1 + 32) wishlistCommand];
  uint64_t v3 = [v4 changeValue:*(unsigned char *)(a1 + 40) == 0];
  [v2 performRequest:v3 completion:0];
}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_7()
{
  return 1;
}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)shouldShowTVRemoteButton
{
  uint64_t v3 = [(MRPlatterViewController *)self _tvMediaRemoteIdentifier];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(MRPlatterViewController *)self _tvAirplayIdentifier];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)presentTVRemote
{
  id v35 = [(MRPlatterViewController *)self _tvMediaRemoteIdentifier];
  if (v35)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v35 = [(MRPlatterViewController *)self _tvAirplayIdentifier];
    uint64_t v3 = 1;
  }
  BOOL v4 = [(MRPlatterViewController *)self _route];
  int v5 = [v4 isTVRoute];

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  if ([(MRPlatterViewController *)self style] == 3)
  {
    uint64_t v7 = 6;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v9 = [v8 bundleIdentifier];
    uint64_t v10 = [v9 lowercaseString];
    char v11 = [v10 isEqualToString:@"com.apple.siri"];

    if (v11)
    {
      uint64_t v7 = 7;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v13 = [v12 bundleIdentifier];
      int v14 = [v13 lowercaseString];
      int v15 = [v14 isEqualToString:@"com.apple.home"];

      if (v15) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 8;
      }
    }
  }
  if (v35)
  {
    if ([(MRPlatterViewController *)self _shouldUseViewServiceToPresentTVRemote])
    {
      id WeakRetained = (id)[objc_alloc(MEMORY[0x1E4FAA428]) initWithDeviceIdentifier:v35 identifierType:v3 deviceType:v6 launchContext:v7 launchMethod:0];
      id v17 = [MEMORY[0x1E4FAA430] sharedInstance];
      [v17 presentWithContext:WeakRetained];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v17 = objc_alloc_init(MEMORY[0x1E4FAA420]);
      [v17 configureWithDeviceIdentifier:v35 identifierType:v3 deviceType:v6 launchContext:5];
      uint64_t v18 = [v17 view];
      [v18 setClipsToBounds:1];

      [v17 setModalPresentationStyle:4];
      [v17 setTransitioningDelegate:self->_transitioningDelegate];
      double v19 = [v17 presentationController];
      if (objc_opt_respondsToSelector())
      {
        id v20 = [WeakRetained platterViewController:self presentingViewForPresentedViewController:v17];
        [v19 setPresentingView:v20];
      }
      double v21 = [(MRPlatterViewController *)self view];
      double v22 = [v21 superview];
      uint64_t v23 = [(MRPlatterViewController *)self view];
      [v23 center];
      double v25 = v24;
      double v27 = v26;
      int64_t v28 = [(MRPlatterViewController *)self view];
      uint64_t v29 = [v28 window];
      objc_msgSend(v22, "convertPoint:toView:", v29, v25, v27);
      objc_msgSend(v19, "setSourcePoint:");

      long long v30 = [(MRPlatterViewController *)self traitCollection];
      uint64_t v31 = [v30 userInterfaceIdiom];

      if (v31 == 1)
      {
        CCUIExpandedModuleEdgeInsets();
        objc_msgSend(v19, "setEdgeInsets:");
        CCUIExpandedModuleContinuousCornerRadius();
        double v33 = v32;
        double v34 = [v17 view];
        [v34 _setContinuousCornerRadius:v33];
      }
      if (objc_opt_respondsToSelector()) {
        [WeakRetained platterViewController:self homeGestureDismisalAllowedDidChange:1];
      }
      [(MRPlatterViewController *)self presentViewController:v17 animated:1 completion:0];
    }
  }
}

- (void)_platterViewControllerReceivedInteraction:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(MRPlatterViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 platterViewController:self didReceiveInteractionEvent:v7];
  }
  int v5 = self;
  uint64_t v6 = [(MRPlatterViewController *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 mediaControlsPanelViewController:v5 didReceiveInteractionEvent:v7];
  }
}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  int v5 = objc_msgSend(a4, "actionIdentifier", a3);
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F31288]];

  if (v6)
  {
    [(MRPlatterViewController *)self _showShareAudioViewController];
  }
}

- (void)routingViewController:(id)a3 didPickRoute:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained platterViewController:self didPickRoute:v6];
  }
}

- (UIEdgeInsets)contentInsetsForRoutingViewController:(id)a3
{
  double v3 = 10.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)routingViewController:(id)a3 willDisplayCell:(id)a4
{
  visualStylingProvider = self->_visualStylingProvider;
  id v6 = a4;
  id v19 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:0];
  id v7 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:1];
  uint64_t v8 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:3];
  id v9 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:5];
  int v10 = [v6 isEnabled];
  char v11 = [v6 titleView];
  BOOL v12 = v10 == 0;
  if (v10) {
    id v13 = v19;
  }
  else {
    id v13 = v8;
  }
  if (v12) {
    int v14 = v8;
  }
  else {
    int v14 = v7;
  }
  objc_msgSend(v11, "mt_replaceVisualStyling:", v13);

  int v15 = [v6 subtitleView];
  objc_msgSend(v15, "mt_replaceVisualStyling:", v14);

  id v16 = [v6 iconView];
  objc_msgSend(v16, "mt_replaceVisualStyling:", v13);

  id v17 = [v6 separatorView];
  objc_msgSend(v17, "mt_replaceVisualStyling:", v9);

  uint64_t v18 = [v6 volumeSlider];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 setMinimumTrackVisualProvider:self->_visualStylingProvider];
    [v18 setMaximumTrackVisualProvider:self->_visualStylingProvider];
  }
}

- (void)routingViewController:(id)a3 willDisplayHeaderView:(id)a4
{
  visualStylingProvider = self->_visualStylingProvider;
  id v5 = a4;
  id v7 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:0];
  id v6 = [v5 textLabel];

  objc_msgSend(v6, "mt_replaceVisualStyling:", v7);
}

- (void)setRoutingViewController:(id)a3
{
  id v5 = (MPAVRoutingViewController *)a3;
  p_routingViewController = &self->_routingViewController;
  routingViewController = self->_routingViewController;
  if (routingViewController != v5)
  {
    char v11 = v5;
    uint64_t v8 = routingViewController;
    objc_storeStrong((id *)&self->_routingViewController, a3);
    [(MPAVRoutingViewController *)*p_routingViewController setDelegate:self];
    [(MPAVRoutingViewController *)*p_routingViewController setThemeDelegate:self];
    [(MPAVRoutingViewController *)*p_routingViewController setGroupSliderCoordinator:self->_groupSliderCoordinator];
    if ([(MRPlatterViewController *)self isViewLoaded])
    {
      if ([(MRPlatterViewController *)self isOnScreen]) {
        [(MPAVRoutingViewController *)*p_routingViewController beginAppearanceTransition:1 animated:0];
      }
      [(MPAVRoutingViewController *)v8 beginAppearanceTransition:0 animated:0];
      id v9 = [(MPAVRoutingViewController *)*p_routingViewController view];
      int v10 = [(MRPlatterViewController *)self parentContainerView];
      [v10 setRoutingView:v9];

      if ([(MRPlatterViewController *)self isOnScreen]) {
        [(MPAVRoutingViewController *)*p_routingViewController endAppearanceTransition];
      }
      [(MPAVRoutingViewController *)v8 endAppearanceTransition];
    }

    id v5 = v11;
  }
}

- (BOOL)shouldEnableSyncingForSlider:(id)a3
{
  double v4 = [(MPVolumeGroupSliderCoordinator *)self->_groupSliderCoordinator individualVolumeSliders];
  BOOL v5 = (unint64_t)[v4 count] >= 2
    && [(MRPlatterViewController *)self selectedMode] == 1;

  return v5;
}

- (BOOL)slider:(id)a3 syncStateWillChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  id v8 = a3;
  if (a5 == 4)
  {
    if (a4 == 2)
    {
      groupSliderCoordinator = self->_groupSliderCoordinator;
      LOBYTE(self) = 1;
      [(MPVolumeGroupSliderCoordinator *)groupSliderCoordinator syncSliders:1];
      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(self) = 1;
    goto LABEL_7;
  }
  if (a5 != 1) {
    goto LABEL_6;
  }
  LODWORD(self) = [(MPVolumeGroupSliderCoordinator *)self->_groupSliderCoordinator synced] ^ 1;
LABEL_7:

  return (char)self;
}

- (BOOL)slider:(id)a3 shouldCancelSnapWithTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(MRPlatterViewController *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  char v11 = [(MRPlatterViewController *)self view];
  LOBYTE(v5) = objc_msgSend(v11, "pointInside:withEvent:", 0, v8, v10) ^ 1;

  return (char)v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_updateRoutingCornerView
{
  if ([(MediaControlsEndpointController *)self->_endpointController isRoutingToWireless]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [(MediaControlsEndpointController *)self->_endpointController isDeviceSystemRoute] ^ 1;
  }
  double v4 = [(MRPlatterViewController *)self routingCornerView];
  [v4 setRouting:v3];

  if ([(MediaControlsEndpointController *)self->_endpointController isRoutingToWireless]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [(MediaControlsEndpointController *)self->_endpointController isDeviceSystemRoute] ^ 1;
  }
  id v6 = [(MRPlatterViewController *)self nowPlayingHeaderView];
  [v6 setRouting:v5];

  if ([(MediaControlsEndpointController *)self->_endpointController hasAvailableRoutes]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = [(MediaControlsEndpointController *)self->_endpointController isDeviceSystemRoute] ^ 1;
  }
  id v8 = [(MRPlatterViewController *)self routingCornerView];
  [v8 setRoutesAvailable:v7];
}

- (void)setRoutingCornerViewTappedBlock:(id)a3
{
  if (self->_routingCornerViewTappedBlock != a3)
  {
    double v4 = _Block_copy(a3);
    id routingCornerViewTappedBlock = self->_routingCornerViewTappedBlock;
    self->_id routingCornerViewTappedBlock = v4;
  }
}

- (void)_updateRoutingIndicators
{
  uint64_t v3 = [(MRPlatterViewController *)self endpointController];
  double v4 = [v3 bundleID];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(MRPlatterViewController *)self endpointController];
    uint64_t v7 = [v6 representedBundleID];
    BOOL v5 = v7 != 0;
  }
  id v8 = [(MRPlatterViewController *)self endpointController];
  double v9 = [v8 route];

  if (([v9 isAppleTVRoute] & 1) != 0
    || ([v9 isTVRoute] & 1) != 0
    || [v9 containsDeviceWithSubtype:18])
  {
    double v10 = [(MRPlatterViewController *)self routingCornerView];
    [v10 setDeviceType:2];

    char v11 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    BOOL v12 = [v11 routingButton];
    id v13 = v12;
    uint64_t v14 = 2;
  }
  else
  {
    if (v5)
    {
      int v15 = [(MRPlatterViewController *)self endpointController];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__MRPlatterViewController__updateRoutingIndicators__block_invoke;
      v17[3] = &unk_1E5F0EE58;
      v17[4] = self;
      [v15 representsLongFormVideoContentWithCompletion:v17];

      goto LABEL_9;
    }
    id v16 = [(MRPlatterViewController *)self routingCornerView];
    [v16 setDeviceType:1];

    char v11 = [(MRPlatterViewController *)self nowPlayingHeaderView];
    BOOL v12 = [v11 routingButton];
    id v13 = v12;
    uint64_t v14 = 1;
  }
  [v12 setDeviceType:v14];

LABEL_9:
}

void __51__MRPlatterViewController__updateRoutingIndicators__block_invoke(uint64_t a1, int a2)
{
  double v4 = [*(id *)(a1 + 32) routingCornerView];
  BOOL v5 = v4;
  if (a2)
  {
    [v4 setDeviceType:2];

    id v9 = [*(id *)(a1 + 32) nowPlayingHeaderView];
    id v6 = [v9 routingButton];
    uint64_t v7 = v6;
    uint64_t v8 = 2;
  }
  else
  {
    [v4 setDeviceType:1];

    id v9 = [*(id *)(a1 + 32) nowPlayingHeaderView];
    id v6 = [v9 routingButton];
    uint64_t v7 = v6;
    uint64_t v8 = 1;
  }
  [v6 setDeviceType:v8];
}

- (void)_routingCornerViewReceivedTap:(id)a3
{
  id routingCornerViewTappedBlock = (void (**)(id, SEL, id))self->_routingCornerViewTappedBlock;
  if (routingCornerViewTappedBlock)
  {
    routingCornerViewTappedBlock[2](routingCornerViewTappedBlock, a2, a3);
    dispatch_time_t v5 = dispatch_time(0, 480000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MRPlatterViewController__routingCornerViewReceivedTap___block_invoke;
    block[3] = &unk_1E5F0D7F8;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__MRPlatterViewController__routingCornerViewReceivedTap___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) style];
  if (!result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _setRoutingPickerVisible:1 animated:1];
  }
  return result;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__MRPlatterViewController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  v8[3] = &unk_1E5F0D8E8;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __76__MRPlatterViewController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [*(id *)(a1 + 32) elements];
  double v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  dispatch_time_t v5 = objc_msgSend(*(id *)(a1 + 32), "elements", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) identifier];
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) setDisplayElements:v4];
}

- (BOOL)lockScreenPresentsOverrideRoutePicker
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Music"];
  uint64_t v3 = [v2 stringForKey:@"LockScreenRoutingStyleOverride"];
  char v4 = [v3 isEqualToString:@"Default"] ^ 1;

  return v4;
}

- (int64_t)lockScreenInternalRoutePickerOverrideWithDefaultStyle:(int64_t)a3
{
  char v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Music"];
  dispatch_time_t v5 = [v4 stringForKey:@"LockScreenRoutingStyleOverride"];
  if (([v5 isEqualToString:@"Default"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"ControlCenter"])
    {
      a3 = 0;
    }
    else if ([v5 isEqualToString:@"SingleSelect"])
    {
      a3 = 1;
    }
    else if ([v5 isEqualToString:@"MultiSelect"])
    {
      a3 = 2;
    }
    else if ([v5 isEqualToString:@"SharedQueue"])
    {
      a3 = 3;
    }
    else if ([v5 isEqualToString:@"VideoPicker"])
    {
      a3 = 4;
    }
    else if ([v5 isEqualToString:@"LocalTransportControls"])
    {
      a3 = 5;
    }
    else if ([v5 isEqualToString:@"AirPlayBluePill"])
    {
      a3 = 6;
    }
    else if ([v5 isEqualToString:@"MediumConfidenceVideoPicker"])
    {
      a3 = 7;
    }
    else if ([v5 isEqualToString:@"UpNextControls"])
    {
      a3 = 8;
    }
  }

  return a3;
}

- (id)_stateDumpObject
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v19[0] = @"_obj";
  uint64_t v3 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v20[0] = v3;
  v19[1] = @"onScreen";
  char v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MRPlatterViewController isOnScreen](self, "isOnScreen"));
  v20[1] = v4;
  v19[2] = @"route";
  uint64_t v5 = [(MRPlatterViewController *)self route];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"<NONE>";
  }
  v20[2] = v7;
  v19[3] = @"name";
  uint64_t v8 = [(MRPlatterViewController *)self routeName];
  uint64_t v9 = (void *)v8;
  if (v8) {
    double v10 = (__CFString *)v8;
  }
  else {
    double v10 = @"<NONE>";
  }
  v20[3] = v10;
  v19[4] = @"routingViewController";
  uint64_t v11 = [(MRPlatterViewController *)self routingViewController];
  long long v12 = (void *)v11;
  if (v11) {
    long long v13 = (__CFString *)v11;
  }
  else {
    long long v13 = @"<NONE>";
  }
  v20[4] = v13;
  v19[5] = @"endpointController";
  uint64_t v14 = [(MRPlatterViewController *)self endpointController];
  int v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = @"<NONE>";
  }
  v20[5] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

  return v17;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (MPAVRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (MRPlatterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRPlatterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsNowPlayingAppLaunch
{
  return self->_allowsNowPlayingAppLaunch;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (int64_t)style
{
  return self->_style;
}

- (double)_continuousCornerRadius
{
  return self->__continuousCornerRadius;
}

- (NSString)placeholderString
{
  return self->_placeholderString;
}

- (NSString)placeholderDeviceIdentifier
{
  return self->_placeholderDeviceIdentifier;
}

- (void)setPlaceholderDeviceIdentifier:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (MRMediaControlsVideoPickerFooterView)videoPickerFooterView
{
  return self->_videoPickerFooterView;
}

- (void)setVideoPickerFooterView:(id)a3
{
}

- (MRMediaControlsVideoPickerHeaderView)videoPickerHeaderView
{
  return self->_videoPickerHeaderView;
}

- (void)setVideoPickerHeaderView:(id)a3
{
}

- (MediaControlsRoutingCornerView)routingCornerView
{
  return self->_routingCornerView;
}

- (void)setRoutingCornerView:(id)a3
{
}

- (MediaControlsParentContainerView)parentContainerView
{
  return self->_parentContainerView;
}

- (void)setParentContainerView:(id)a3
{
}

- (MediaControlsVolumeContainerView)volumeContainerView
{
  return self->_volumeContainerView;
}

- (void)setVolumeContainerView:(id)a3
{
}

- (NSMutableArray)secondaryStringComponents
{
  return self->_secondaryStringComponents;
}

- (void)setSecondaryStringComponents:(id)a3
{
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isListeningForResponse
{
  return self->_isListeningForResponse;
}

- (void)setIsListeningForResponse:(BOOL)a3
{
  self->_isListeningForResponse = a3;
}

- (MPVolumeGroupSliderCoordinator)groupSliderCoordinator
{
  return self->_groupSliderCoordinator;
}

- (void)setGroupSliderCoordinator:(id)a3
{
}

- (MPAVEndpointRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (CGSize)lastKnownSize
{
  double width = self->_lastKnownSize.width;
  double height = self->_lastKnownSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastKnownSize:(CGSize)a3
{
  self->_lastKnownSize = a3;
}

- (MediaControlsTransitioningDelegate)transitioningDelegate
{
  return self->_transitioningDelegate;
}

- (void)setTransitioningDelegate:(id)a3
{
}

- (MediaControlsLanguageOptionsViewController)languageOptionsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_languageOptionsViewController);

  return (MediaControlsLanguageOptionsViewController *)WeakRetained;
}

- (void)setLanguageOptionsViewController:(id)a3
{
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
}

- (void)setShareAudioViewController:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (NSArray)displayElements
{
  return self->_displayElements;
}

- (NSString)explicitString
{
  return self->_explicitString;
}

- (void)setExplicitString:(id)a3
{
}

- (BOOL)failedToLoadArtwork
{
  return self->_failedToLoadArtwork;
}

- (void)setFailedToLoadArtwork:(BOOL)a3
{
  self->_failedToLoadArtwork = a3;
}

- (int64_t)failedArtworkRetryCount
{
  return self->_failedArtworkRetryCount;
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)supportedModes
{
  return self->_supportedModes;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (MediaControlsEndpointController)endpointController
{
  return self->_endpointController;
}

- (id)routingCornerViewTappedBlock
{
  return self->_routingCornerViewTappedBlock;
}

- (MediaControlsHeaderView)nowPlayingHeaderView
{
  return self->_nowPlayingHeaderView;
}

- (void)setNowPlayingHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingHeaderView, 0);
  objc_storeStrong(&self->_routingCornerViewTappedBlock, 0);
  objc_storeStrong((id *)&self->_endpointController, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_explicitString, 0);
  objc_storeStrong((id *)&self->_displayElements, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_shareAudioViewController, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_destroyWeak((id *)&self->_languageOptionsViewController);
  objc_storeStrong((id *)&self->_transitioningDelegate, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_groupSliderCoordinator, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_secondaryStringComponents, 0);
  objc_storeStrong((id *)&self->_volumeContainerView, 0);
  objc_storeStrong((id *)&self->_parentContainerView, 0);
  objc_storeStrong((id *)&self->_routingCornerView, 0);
  objc_storeStrong((id *)&self->_videoPickerHeaderView, 0);
  objc_storeStrong((id *)&self->_videoPickerFooterView, 0);
  objc_storeStrong((id *)&self->_placeholderDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

- (uint64_t)_showShareAudioViewController
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:](v0);
}

@end