@interface PHScreenSharingContainerViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)showingOverlay;
- (CNKFaceTimePiPSourceProviding)sharedContentViewController;
- (CNKParticipantScreenShareInfoViewFactory)infoViewFactory;
- (CNKParticipantScreenShareInfoViewProtocol)infoView;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (NSTimer)overlayDismissTimer;
- (PHPIPController)pipController;
- (PHScreenSharingContainerViewController)initWithCallDisplayStyleManager:(id)a3;
- (UIView)overlayView;
- (id)makeScreenShareViewController;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3;
- (void)overlayViewTapped:(id)a3;
- (void)pipStateDidChangeNotification:(id)a3;
- (void)setInfoView:(id)a3;
- (void)setInfoViewFactory:(id)a3;
- (void)setOverlayDismissTimer:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPipController:(id)a3;
- (void)setSharedContentViewController:(id)a3;
- (void)setShowingOverlay:(BOOL)a3;
- (void)setShowingOverlay:(BOOL)a3 animated:(BOOL)a4;
- (void)setupOverlayDismissTimerIfNeeded;
- (void)updatePresenterNameAndAvatar;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PHScreenSharingContainerViewController

- (PHScreenSharingContainerViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHScreenSharingContainerViewController;
  v6 = [(PHScreenSharingContainerViewController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = objc_opt_new();
    [(PHScreenSharingContainerViewController *)v7 setInfoViewFactory:v8];

    v9 = [(PHScreenSharingContainerViewController *)v7 makeScreenShareViewController];
    [(PHScreenSharingContainerViewController *)v7 setSharedContentViewController:v9];

    [(PHScreenSharingContainerViewController *)v7 setShowingOverlay:1];
    v10 = +[UIColor blackColor];
    v11 = [(PHScreenSharingContainerViewController *)v7 view];
    [v11 setBackgroundColor:v10];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v7 selector:"pipStateDidChangeNotification:" name:@"PHPIPControllerStateDidChangeNotification" object:0];

    v13 = v7;
  }

  return v7;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return (NSSet *)sub_1000B0B34(1uLL);
}

- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3
{
  id v4 = a3;
  id v5 = [(PHScreenSharingContainerViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v4 view];
  [v14 setFrame:v7, v9, v11, v13];

  objc_super v15 = [v4 view];
  [v15 setAutoresizingMask:18];

  id v17 = [(PHScreenSharingContainerViewController *)self view];
  v16 = [v4 view];

  [v17 sendSubviewToBack:v16];
}

- (void)setShowingOverlay:(BOOL)a3
{
}

- (void)setShowingOverlay:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingOverlay != a3)
  {
    self->_showingOverlay = a3;
    [(PHScreenSharingContainerViewController *)self overlayView];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000D2DB0;
    v14[3] = &unk_1002CEFC0;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v17 = a3;
    id v15 = v7;
    v16 = self;
    double v8 = objc_retainBlock(v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D2E1C;
    v13[3] = &unk_1002CD518;
    v13[4] = self;
    double v9 = objc_retainBlock(v13);
    double v10 = (void (**)(void))v9;
    if (a4)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000D2E24;
      v11[3] = &unk_1002CE840;
      double v12 = v9;
      +[UIView transitionWithView:v7 duration:5242880 options:v8 animations:v11 completion:0.2];
    }
    else
    {
      ((void (*)(void *))v8[2])(v8);
      v10[2](v10);
    }
  }
}

- (void)viewDidLoad
{
  v99.receiver = self;
  v99.super_class = (Class)PHScreenSharingContainerViewController;
  [(PHScreenSharingContainerViewController *)&v99 viewDidLoad];
  v3 = [(PHScreenSharingContainerViewController *)self sharedContentViewController];
  id v4 = [(PHScreenSharingContainerViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [v3 view];
  [v13 setFrame:v6, v8, v10, v12];

  v14 = v3;
  v98 = v3;
  id v15 = [v3 view];
  [v15 setAutoresizingMask:18];

  [v3 willMoveToParentViewController:self];
  v16 = [(PHScreenSharingContainerViewController *)self view];
  BOOL v17 = [v14 view];
  [v16 addSubview:v17];

  [(PHScreenSharingContainerViewController *)self addChildViewController:v14];
  [v14 didMoveToParentViewController:self];
  [v16 setAutoresizingMask:18];
  id v97 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"overlayViewTapped:"];
  [v16 addGestureRecognizer:v97];
  id v18 = objc_alloc_init((Class)UIView);
  [(PHScreenSharingContainerViewController *)self setOverlayView:v18];
  v19 = +[UIColor clearColor];
  [v18 setBackgroundColor:v19];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setUserInteractionEnabled:0];
  [v18 setHidden:[self showingOverlay] ^ 1];
  [v16 addSubview:v18];
  v96 = +[UIBlurEffect effectWithStyle:17];
  id v20 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v96];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 addSubview:v20];
  id v21 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v96];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 addSubview:v21];
  [v20 _setGroupName:@"PHScreenSharingContainerViewController.blurGroupName"];
  [v21 _setGroupName:@"PHScreenSharingContainerViewController.blurGroupName"];
  v95 = self;
  v22 = [(CNKParticipantScreenShareInfoViewFactory *)self->_infoViewFactory makeParticipantView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 preferredHeight];
  [v22 setCustomCornerRadius:v23 * 0.5];
  [(PHScreenSharingContainerViewController *)self setInfoView:v22];
  [v18 addSubview:v22];
  [(PHScreenSharingContainerViewController *)self updatePresenterNameAndAvatar];
  v94 = [v18 leadingAnchor];
  v93 = [v16 leadingAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v100[0] = v92;
  v90 = [v18 trailingAnchor];
  v89 = [v16 trailingAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v100[1] = v88;
  v87 = [v18 topAnchor];
  v86 = [v16 topAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v100[2] = v85;
  v84 = [v18 bottomAnchor];
  v83 = [v16 bottomAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v100[3] = v82;
  v91 = v18;
  v81 = [v18 widthAnchor];
  v80 = [v16 widthAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v100[4] = v79;
  v78 = [v18 heightAnchor];
  v77 = [v16 heightAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v100[5] = v76;
  v74 = [v22 leadingAnchor];
  v75 = [v16 safeAreaLayoutGuide];
  v72 = [v75 leadingAnchor];
  v71 = [v74 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v72 multiplier:1.0];
  v100[6] = v71;
  v73 = v22;
  v69 = [v22 trailingAnchor];
  v70 = [v16 safeAreaLayoutGuide];
  v68 = [v70 trailingAnchor];
  v67 = [v69 constraintLessThanOrEqualToSystemSpacingAfterAnchor:v68 multiplier:1.0];
  v100[7] = v67;
  v64 = [v22 topAnchor];
  v65 = [v16 safeAreaLayoutGuide];
  v63 = [v65 topAnchor];
  v62 = [v64 constraintGreaterThanOrEqualToAnchor:v63];
  v100[8] = v62;
  v61 = [v22 topAnchor];
  v60 = [v21 bottomAnchor];
  v59 = [v61 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v60 multiplier:1.0];
  v100[9] = v59;
  v57 = [v22 widthAnchor];
  v56 = [v16 widthAnchor];
  v55 = [v57 constraintLessThanOrEqualToAnchor:v56];
  v100[10] = v55;
  v54 = [v22 heightAnchor];
  [v22 preferredHeight];
  v53 = [v54 constraintGreaterThanOrEqualToConstant:];
  v100[11] = v53;
  v24 = [v22 leadingAnchor];
  v25 = [v16 safeAreaLayoutGuide];
  v26 = [v25 leadingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];

  LODWORD(v28) = 1144750080;
  v52 = v27;
  [v27 setPriority:v28];
  v100[12] = v27;
  v51 = [v20 bottomAnchor];
  v50 = [v16 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v100[13] = v49;
  v66 = v20;
  v48 = [v20 widthAnchor];
  v47 = [v16 widthAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v100[14] = v46;
  v44 = [v20 topAnchor];
  v45 = [v16 safeAreaLayoutGuide];
  v43 = [v45 bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v100[15] = v42;
  v41 = [v21 topAnchor];
  v40 = [v16 topAnchor];
  v29 = [v41 constraintEqualToAnchor:v40];
  v100[16] = v29;
  v58 = v21;
  v30 = [v21 widthAnchor];
  v31 = [v16 widthAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v100[17] = v32;
  v33 = [v21 bottomAnchor];
  v34 = [v16 safeAreaLayoutGuide];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintGreaterThanOrEqualToAnchor:v35];
  v100[18] = v36;
  v37 = +[NSArray arrayWithObjects:v100 count:19];
  +[NSLayoutConstraint activateConstraints:v37];

  v38 = [(PHScreenSharingContainerViewController *)v95 pipController];
  [v38 updatePIPSize];

  v39 = [(PHScreenSharingContainerViewController *)v95 pipController];
  [v39 updatePIPFrame];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHScreenSharingContainerViewController;
  [(PHScreenSharingContainerViewController *)&v6 viewDidAppear:a3];
  id v4 = [(PHScreenSharingContainerViewController *)self pipController];
  [v4 updatePIPSize];

  double v5 = [(PHScreenSharingContainerViewController *)self pipController];
  [v5 updatePIPFrame];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PHScreenSharingContainerViewController;
  [(PHScreenSharingContainerViewController *)&v6 viewDidLayoutSubviews];
  v3 = [(PHScreenSharingContainerViewController *)self infoView];
  [v3 frame];
  double Height = CGRectGetHeight(v7);

  double v5 = [(PHScreenSharingContainerViewController *)self infoView];
  [v5 setCustomCornerRadius:Height * 0.5];
}

- (void)pipStateDidChangeNotification:(id)a3
{
  id v4 = [a3 object];
  double v5 = [(PHScreenSharingContainerViewController *)self pipController];

  if (v4 == v5)
  {
    objc_super v6 = [(PHScreenSharingContainerViewController *)self pipController];
    id v7 = [v6 isPipped];

    double v8 = [(PHScreenSharingContainerViewController *)self sharedContentViewController];
    [v8 setIsPipped:v7];

    if (v7)
    {
      id v9 = [(PHScreenSharingContainerViewController *)self overlayDismissTimer];
      [v9 invalidate];
    }
    else
    {
      [(PHScreenSharingContainerViewController *)self setupOverlayDismissTimerIfNeeded];
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  return ![(PHScreenSharingContainerViewController *)self showingOverlay];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return ![(PHScreenSharingContainerViewController *)self showingOverlay];
}

- (void)overlayViewTapped:(id)a3
{
  uint64_t v4 = [(PHScreenSharingContainerViewController *)self showingOverlay] ^ 1;

  [(PHScreenSharingContainerViewController *)self setShowingOverlay:v4 animated:1];
}

- (void)updatePresenterNameAndAvatar
{
  objc_initWeak(&location, self);
  v3 = [(PHScreenSharingContainerViewController *)self sharedContentViewController];
  uint64_t v4 = [v3 sharedContentSourceName];

  double v5 = [(PHScreenSharingContainerViewController *)self infoView];
  [v5 configureWith:v4 isFullScreenMode:0];

  objc_super v6 = [(PHScreenSharingContainerViewController *)self pipController];
  [v6 setScreenSharingTitle:v4 andAvatarIfNeeded:0];

  id v7 = [(PHScreenSharingContainerViewController *)self sharedContentViewController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D3C6C;
  v9[3] = &unk_1002D04A0;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v7 getSharedContentSourceAvatarWithImageHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setupOverlayDismissTimerIfNeeded
{
  v3 = [(PHScreenSharingContainerViewController *)self overlayDismissTimer];
  [v3 invalidate];

  if ([(PHScreenSharingContainerViewController *)self showingOverlay])
  {
    objc_initWeak(&location, self);
    double v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_1000D3F10;
    id v8 = &unk_1002CDA48;
    objc_copyWeak(&v9, &location);
    uint64_t v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v5 block:3.0];
    -[PHScreenSharingContainerViewController setOverlayDismissTimer:](self, "setOverlayDismissTimer:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (PHPIPController)pipController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);

  return (PHPIPController *)WeakRetained;
}

- (void)setPipController:(id)a3
{
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (CNKFaceTimePiPSourceProviding)sharedContentViewController
{
  return self->_sharedContentViewController;
}

- (void)setSharedContentViewController:(id)a3
{
}

- (CNKParticipantScreenShareInfoViewProtocol)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
}

- (CNKParticipantScreenShareInfoViewFactory)infoViewFactory
{
  return self->_infoViewFactory;
}

- (void)setInfoViewFactory:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (BOOL)showingOverlay
{
  return self->_showingOverlay;
}

- (NSTimer)overlayDismissTimer
{
  return self->_overlayDismissTimer;
}

- (void)setOverlayDismissTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayDismissTimer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_infoViewFactory, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_sharedContentViewController, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);

  objc_destroyWeak((id *)&self->_pipController);
}

- (id)makeScreenShareViewController
{
  v2 = self;
  id v3 = PHScreenSharingContainerViewController.makeScreenShareViewController()();

  return v3;
}

@end