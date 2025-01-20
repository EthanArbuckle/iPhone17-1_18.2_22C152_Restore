@interface BPSStingSetupOptInViewController
+ (id)animationFileURLForIdentifier:(id)a3;
- (BOOL)doneSettingUpViews;
- (BOOL)legacyButtonStyles;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (BPSStingFeatureCollectionView)collectionView;
- (BPSStingSetupOptInViewController)init;
- (CSLPRFStingSettingsItem)selectedActivity;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (NSLayoutConstraint)localContentViewHeightConstraint;
- (OS_dispatch_queue)npsQueue;
- (UIView)localContentView;
- (_UICAPackageView)animationView;
- (id)alternateButtonTitle;
- (id)animationViewForIdentifier:(id)a3;
- (id)detailString;
- (id)imageResource;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_applyScale;
- (void)alternateButtonPressed:(id)a3;
- (void)applyAnimationLayoutContraints;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)selectionChanged:(id)a3;
- (void)setAnimationView:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewHeightConstraint:(id)a3;
- (void)setDoneSettingUpViews:(BOOL)a3;
- (void)setLocalContentView:(id)a3;
- (void)setLocalContentViewHeightConstraint:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)setNpsQueue:(id)a3;
- (void)setSelectedActivity:(id)a3;
- (void)setupViews;
- (void)suggestedButtonPressed:(id)a3;
- (void)updateLocalViewSize;
- (void)viewDidLayoutSubviews;
@end

@implementation BPSStingSetupOptInViewController

- (BPSStingSetupOptInViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BPSStingSetupOptInViewController;
  v2 = [(BPSStingSetupOptInViewController *)&v5 initWithTitle:&stru_C4E0 detailText:0 icon:0 contentLayout:3];
  v3 = v2;
  if (v2) {
    [(BPSStingSetupOptInViewController *)v2 setStyle:10];
  }
  return v3;
}

- (void)setupViews
{
  v3 = [(BPSStingSetupOptInViewController *)self suggestedChoiceButton];
  [v3 setEnabled:0];

  id v4 = objc_alloc((Class)UIView);
  objc_super v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;
  [(BPSStingSetupOptInViewController *)self availableContentViewHeight];
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7, v8);
  localContentView = self->_localContentView;
  self->_localContentView = v9;

  v11 = [(BPSStingSetupOptInViewController *)self contentView];
  [v11 addSubview:self->_localContentView];

  if (!self->_collectionView)
  {
    v12 = -[BPSStingFeatureCollectionView initWithFrame:]([BPSStingFeatureCollectionView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    collectionView = self->_collectionView;
    self->_collectionView = v12;

    [(BPSStingFeatureCollectionView *)self->_collectionView setSelectionChangeDelegate:self];
    [(BPSStingFeatureCollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(BPSStingSetupOptInViewController *)self localContentView];
    [v14 addSubview:self->_collectionView];

    v15 = [(BPSStingSetupOptInViewController *)self collectionView];
    [v15 addObserver:self forKeyPath:@"contentSize" options:2 context:0];
  }
  if (!self->_collectionViewHeightConstraint)
  {
    v16 = [(BPSStingFeatureCollectionView *)self->_collectionView heightAnchor];
    v17 = [v16 constraintEqualToConstant:106.0];
    collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
    self->_collectionViewHeightConstraint = v17;
  }
  v19 = [(BPSStingSetupOptInViewController *)self watchViewBottomConstraint];
  [v19 setActive:0];

  [(NSLayoutConstraint *)self->_collectionViewHeightConstraint setActive:1];
  v20 = [(BPSStingSetupOptInViewController *)self animationViewForIdentifier:0];
  animationView = self->_animationView;
  self->_animationView = v20;

  v22 = [(BPSStingSetupOptInViewController *)self localContentView];
  [v22 addSubview:self->_animationView];

  v43 = [(BPSStingFeatureCollectionView *)self->_collectionView leadingAnchor];
  v44 = [(BPSStingSetupOptInViewController *)self view];
  v42 = [v44 leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v45[0] = v41;
  v40 = [(BPSStingFeatureCollectionView *)self->_collectionView trailingAnchor];
  v23 = [(BPSStingSetupOptInViewController *)self view];
  v24 = [v23 trailingAnchor];
  v25 = [v40 constraintEqualToAnchor:v24];
  v45[1] = v25;
  v26 = [(BPSStingFeatureCollectionView *)self->_collectionView bottomAnchor];
  v27 = [(BPSStingSetupOptInViewController *)self contentView];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v45[2] = v29;
  v30 = +[NSArray arrayWithObjects:v45 count:3];
  +[NSLayoutConstraint activateConstraints:v30];

  [(BPSStingFeatureCollectionView *)self->_collectionView contentInset];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = [(BPSStingSetupOptInViewController *)self view];
  [v37 directionalLayoutMargins];
  double v39 = v38;

  -[BPSStingFeatureCollectionView setContentInset:](self->_collectionView, "setContentInset:", v32, v39, v34, v36);
  [(BPSStingFeatureCollectionView *)self->_collectionView reloadData];
  [(BPSStingSetupOptInViewController *)self setDoneSettingUpViews:1];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)BPSStingSetupOptInViewController;
  [(BPSStingSetupOptInViewController *)&v8 viewDidLayoutSubviews];
  v3 = [(BPSStingSetupOptInViewController *)self view];
  [v3 safeAreaInsets];
  if (v4 == 0.0)
  {
  }
  else
  {
    unsigned __int8 v5 = [(BPSStingSetupOptInViewController *)self doneSettingUpViews];

    if ((v5 & 1) == 0)
    {
      double v6 = bps_setup_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Safe insets are set, can now setup views", v7, 2u);
      }

      [(BPSStingSetupOptInViewController *)self setupViews];
      [(BPSStingSetupOptInViewController *)self applyAnimationLayoutContraints];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  [(NSLayoutConstraint *)self->_collectionViewHeightConstraint constant];
  double v8 = v7;
  v9 = [(BPSStingSetupOptInViewController *)self collectionView];
  [v9 preferredCellHeight];
  double v11 = v10;

  if (v8 != v11)
  {
    v12 = [(BPSStingSetupOptInViewController *)self collectionView];
    [v12 preferredCellHeight];
    -[NSLayoutConstraint setConstant:](self->_collectionViewHeightConstraint, "setConstant:");

    [(BPSStingSetupOptInViewController *)self updateLocalViewSize];
  }
}

- (void)updateLocalViewSize
{
  [(NSLayoutConstraint *)self->_collectionViewHeightConstraint constant];
  double v4 = v3;
  [(_UICAPackageView *)self->_animationView frame];
  double v6 = v4 + v5;
  double v7 = [(BPSStingSetupOptInViewController *)self localContentView];
  [v7 frame];
  double v9 = v8;

  if (v6 > v9)
  {
    id v17 = [(BPSStingSetupOptInViewController *)self localContentView];
    double v10 = [(BPSStingSetupOptInViewController *)self localContentView];
    [v10 frame];
    double v12 = v11;
    v13 = [(BPSStingSetupOptInViewController *)self localContentView];
    [v13 frame];
    double v15 = v14;
    v16 = [(BPSStingSetupOptInViewController *)self localContentView];
    [v16 frame];
    objc_msgSend(v17, "setFrame:", v12, v15);
  }
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  double v3 = [v2 localizedStringForKey:@"STING_SETUP_TITLE" value:&stru_C4E0 table:@"Localizable-N199"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  double v3 = [v2 localizedStringForKey:@"STING_SETUP_DETAIL" value:&stru_C4E0 table:@"Localizable-N199"];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  double v3 = [v2 localizedStringForKey:@"STING_SUGGESTED_BUTTON_TITLE" value:&stru_C4E0 table:@"Localizable-N199"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  double v3 = [v2 localizedStringForKey:@"STING_ALTERNATE_BUTTON_TITLE" value:&stru_C4E0 table:@"Localizable-N199"];

  return v3;
}

- (id)imageResource
{
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  npsQueue = self->_npsQueue;
  if (!npsQueue)
  {
    double v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Bridge.NPSQueue", 0);
    double v6 = self->_npsQueue;
    self->_npsQueue = v5;

    npsQueue = self->_npsQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_39CC;
  block[3] = &unk_C2E0;
  block[4] = self;
  dispatch_async(npsQueue, block);
  double v7 = [(BPSStingSetupOptInViewController *)self miniFlowDelegate];
  [v7 miniFlowStepComplete:self];
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = [(BPSStingSetupOptInViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (void)selectionChanged:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(BPSStingSetupOptInViewController *)self suggestedChoiceButton];
    [(id)v5 setEnabled:1];

    double v6 = [(BPSStingSetupOptInViewController *)self selectedActivity];
    double v7 = [v6 identifier];
    double v8 = [v4 identifier];
    LOBYTE(v5) = [v7 isEqualToString:v8];

    [(BPSStingSetupOptInViewController *)self setSelectedActivity:v4];
    [(_UICAPackageView *)self->_animationView removeFromSuperview];
    animationView = self->_animationView;
    self->_animationView = 0;

    double v10 = [v4 identifier];

    double v11 = [(BPSStingSetupOptInViewController *)self animationViewForIdentifier:v10];
    double v12 = self->_animationView;
    self->_animationView = v11;

    v13 = [(BPSStingSetupOptInViewController *)self contentView];
    [v13 addSubview:self->_animationView];

    if ((v5 & 1) == 0)
    {
      double v14 = [(_UICAPackageView *)self->_animationView layer];
      [v14 setBeginTime:0.0];

      double v15 = [(_UICAPackageView *)self->_animationView layer];
      [v15 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v17 = v16;

      v18 = [(_UICAPackageView *)self->_animationView layer];
      [v18 setBeginTime:v17];
    }
    [(BPSStingSetupOptInViewController *)self applyAnimationLayoutContraints];
  }
}

+ (id)animationFileURLForIdentifier:(id)a3
{
  id v4 = +[BPSStingSetupModel fileNameForIdentifier:a3];
  uint64_t v5 = +[NSBundle bundleForClass:a1];
  double v6 = [v5 URLForResource:v4 withExtension:@"caar"];

  return v6;
}

- (id)animationViewForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() animationFileURLForIdentifier:v3];

  if (!v4)
  {
    id v4 = [(id)objc_opt_class() animationFileURLForIdentifier:0];
  }
  id v5 = [objc_alloc((Class)_UICAPackageView) initWithContentsOfURL:v4 publishedObjectViewClassMap:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v5;
}

- (void)_applyScale
{
  if (!+[BPSStingFeatureCell isLargeText])
  {
    [(BPSStingSetupOptInViewController *)self availableContentViewHeight];
    double v4 = v3;
    [(NSLayoutConstraint *)self->_collectionViewHeightConstraint constant];
    double v6 = v4 - v5 + -15.0;
    double v7 = [(_UICAPackageView *)self->_animationView layer];
    [v7 frame];
    double v9 = fmin(v6, 316.0) / v8;

    if (v9 < 0.75) {
      double v9 = 0.75;
    }
    CATransform3DMakeScale(&v19, v9, v9, 1.0);
    animationView = self->_animationView;
    CATransform3D v18 = v19;
    [(_UICAPackageView *)animationView setTransform3D:&v18];
    double v11 = bps_setup_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [(BPSStingSetupOptInViewController *)self availableContentViewHeight];
      uint64_t v13 = v12;
      [(NSLayoutConstraint *)self->_collectionViewHeightConstraint constant];
      uint64_t v15 = v14;
      double v16 = [(_UICAPackageView *)self->_animationView layer];
      [v16 frame];
      *(_DWORD *)buf = 134219008;
      double v21 = v6;
      __int16 v22 = 2048;
      double v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = v15;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Space for animation: %f scalefactor: %f availablecontentheight: %f collectionviewHeight: %f animationViewHeight: %f", buf, 0x34u);
    }
    [(_UICAPackageView *)self->_animationView sizeToFit];
  }
}

- (void)applyAnimationLayoutContraints
{
  [(BPSStingSetupOptInViewController *)self _applyScale];
  [(BPSStingSetupOptInViewController *)self updateLocalViewSize];
  CATransform3D v18 = [(_UICAPackageView *)self->_animationView topAnchor];
  CATransform3D v19 = [(BPSStingSetupOptInViewController *)self localContentView];
  double v16 = [v19 topAnchor];
  uint64_t v17 = [(_UICAPackageView *)self->_animationView layer];
  [v17 frame];
  uint64_t v15 = [v18 constraintEqualToAnchor:v16 constant:v3];
  v20[0] = v15;
  uint64_t v14 = [(_UICAPackageView *)self->_animationView widthAnchor];
  double v4 = [v14 constraintEqualToConstant:197.0];
  v20[1] = v4;
  double v5 = [(_UICAPackageView *)self->_animationView centerXAnchor];
  double v6 = [(BPSStingSetupOptInViewController *)self view];
  double v7 = [v6 centerXAnchor];
  double v8 = [v5 constraintEqualToAnchor:v7];
  v20[2] = v8;
  double v9 = [(BPSStingFeatureCollectionView *)self->_collectionView bottomAnchor];
  double v10 = [(BPSStingSetupOptInViewController *)self localContentView];
  double v11 = [v10 bottomAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  v20[3] = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (CSLPRFStingSettingsItem)selectedActivity
{
  return self->_selectedActivity;
}

- (void)setSelectedActivity:(id)a3
{
}

- (OS_dispatch_queue)npsQueue
{
  return self->_npsQueue;
}

- (void)setNpsQueue:(id)a3
{
}

- (BPSStingFeatureCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (_UICAPackageView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
}

- (UIView)localContentView
{
  return self->_localContentView;
}

- (void)setLocalContentView:(id)a3
{
}

- (BOOL)doneSettingUpViews
{
  return self->_doneSettingUpViews;
}

- (void)setDoneSettingUpViews:(BOOL)a3
{
  self->_doneSettingUpViews = a3;
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)localContentViewHeightConstraint
{
  return self->_localContentViewHeightConstraint;
}

- (void)setLocalContentViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localContentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_localContentView, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_npsQueue, 0);
  objc_storeStrong((id *)&self->_selectedActivity, 0);

  objc_destroyWeak((id *)&self->miniFlowDelegate);
}

@end