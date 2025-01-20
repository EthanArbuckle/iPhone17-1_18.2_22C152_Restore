@interface CARWallpaperPreviewPanel
- (CARWallpaperPreviewPanel)initWithWallpaper:(id)a3 wallpaperPreferences:(id)a4 panelController:(id)a5 completionHandler:(id)a6;
- (CRSIconLayoutController)iconLayoutController;
- (CRSUIStatusBarStyleAssertion)statusBarStyleAssertion;
- (CRSUIWallpaper)wallpaper;
- (CRSUIWallpaperPreferences)wallpaperPreferences;
- (NSArray)stackViewEdgeConstraints;
- (UILayoutGuide)stackViewLayoutGuide;
- (UIStackView)stackView;
- (UIView)wallpaperView;
- (id)_iconImageForIdentifier:(id)a3;
- (id)completionHandler;
- (unint64_t)iconColumns;
- (unint64_t)iconRows;
- (void)_activateStatusBarStyleOverrideIfNecessary;
- (void)_backButtonPressed:(id)a3;
- (void)_cancelButtonSelected:(id)a3;
- (void)_handleDismissal;
- (void)_sceneDidActivate:(id)a3;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_setButtonSelected:(id)a3;
- (void)_setIconState:(id)a3;
- (void)_updateStackViewEdgeConstraints;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setIconColumns:(unint64_t)a3;
- (void)setIconLayoutController:(id)a3;
- (void)setIconRows:(unint64_t)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewEdgeConstraints:(id)a3;
- (void)setStackViewLayoutGuide:(id)a3;
- (void)setStatusBarStyleAssertion:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)setWallpaperPreferences:(id)a3;
- (void)setWallpaperView:(id)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CARWallpaperPreviewPanel

- (CARWallpaperPreviewPanel)initWithWallpaper:(id)a3 wallpaperPreferences:(id)a4 panelController:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CARWallpaperPreviewPanel;
  v14 = [(CARSettingsPanel *)&v26 initWithPanelController:a5];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_wallpaper, a3);
    objc_storeStrong((id *)&v15->_wallpaperPreferences, a4);
    id v16 = objc_retainBlock(v13);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v16;

    v18 = (CRSIconLayoutController *)objc_alloc_init((Class)CRSIconLayoutController);
    iconLayoutController = v15->_iconLayoutController;
    v15->_iconLayoutController = v18;

    v20 = [(CRSUIWallpaper *)v15->_wallpaper traits];
    unsigned int v21 = [v20 supportsDynamicAppearance];

    if (v21) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = 2;
    }
    [(CARWallpaperPreviewPanel *)v15 setOverrideUserInterfaceStyle:v22];
    v23 = (CRSUIStatusBarStyleAssertion *)[objc_alloc((Class)CRSUIStatusBarStyleAssertion) initWithInterfaceStyle:v22 colorVariant:v21 ^ 1];
    statusBarStyleAssertion = v15->_statusBarStyleAssertion;
    v15->_statusBarStyleAssertion = v23;
  }
  return v15;
}

- (void)invalidate
{
  v3 = [(CARWallpaperPreviewPanel *)self statusBarStyleAssertion];
  [v3 invalidate];

  [(CARWallpaperPreviewPanel *)self setStatusBarStyleAssertion:0];
  v4 = [(CARWallpaperPreviewPanel *)self iconLayoutController];
  [v4 invalidate];

  [(CARWallpaperPreviewPanel *)self setIconLayoutController:0];
  v5.receiver = self;
  v5.super_class = (Class)CARWallpaperPreviewPanel;
  [(CARSettingsPanel *)&v5 invalidate];
}

- (void)viewDidLoad
{
  v140.receiver = self;
  v140.super_class = (Class)CARWallpaperPreviewPanel;
  [(CARSettingsPanel *)&v140 viewDidLoad];
  v3 = [(CARWallpaperPreviewPanel *)self wallpaperPreferences];
  v4 = [v3 dataProvider];
  objc_super v5 = [(CARWallpaperPreviewPanel *)self wallpaper];
  v122 = [v4 resolveWallpaper:v5];

  if (v122)
  {
    v6 = [v122 view];
    [(CARWallpaperPreviewPanel *)self setWallpaperView:v6];

    v7 = [(CARWallpaperPreviewPanel *)self wallpaperView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(CARWallpaperPreviewPanel *)self view];
    v9 = [(CARWallpaperPreviewPanel *)self wallpaperView];
    [v8 addSubview:v9];

    v135 = [(CARWallpaperPreviewPanel *)self wallpaperView];
    v131 = [v135 leadingAnchor];
    v133 = [(CARWallpaperPreviewPanel *)self view];
    v129 = [v133 leadingAnchor];
    v127 = [v131 constraintEqualToAnchor:v129];
    v144[0] = v127;
    v125 = [(CARWallpaperPreviewPanel *)self wallpaperView];
    v120 = [v125 trailingAnchor];
    v123 = [(CARWallpaperPreviewPanel *)self view];
    v118 = [v123 trailingAnchor];
    v116 = [v120 constraintEqualToAnchor:v118];
    v144[1] = v116;
    v114 = [(CARWallpaperPreviewPanel *)self wallpaperView];
    v112 = [v114 topAnchor];
    v10 = [(CARWallpaperPreviewPanel *)self view];
    id v11 = [v10 topAnchor];
    id v12 = [v112 constraintEqualToAnchor:v11];
    v144[2] = v12;
    id v13 = [(CARWallpaperPreviewPanel *)self wallpaperView];
    v14 = [v13 bottomAnchor];
    v15 = [(CARWallpaperPreviewPanel *)self view];
    id v16 = [v15 bottomAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v144[3] = v17;
    v18 = +[NSArray arrayWithObjects:v144 count:4];
    +[NSLayoutConstraint activateConstraints:v18];
  }
  id v134 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v134 setAxis:1];
  [v134 setDistribution:3];
  [v134 setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [(CARWallpaperPreviewPanel *)self view];
  [v19 addSubview:v134];

  [(CARWallpaperPreviewPanel *)self setStackView:v134];
  id v20 = objc_alloc_init((Class)UILayoutGuide);
  [(CARWallpaperPreviewPanel *)self setStackViewLayoutGuide:v20];

  unsigned int v21 = [(CARWallpaperPreviewPanel *)self view];
  uint64_t v22 = [(CARWallpaperPreviewPanel *)self stackViewLayoutGuide];
  [v21 addLayoutGuide:v22];

  v136 = +[CARWallpaperPreviewButton buttonWithType:0];
  v23 = sub_1000210C8(@"WALLPAPER_BUTTON_CANCEL");
  [v136 setTitle:v23 forState:0];

  [v136 addTarget:self action:"_cancelButtonSelected:" forControlEvents:0x2000];
  [v136 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = [(CARWallpaperPreviewPanel *)self view];
  [v24 addSubview:v136];

  v132 = +[CARWallpaperPreviewButton buttonWithType:0];
  v25 = sub_1000210C8(@"WALLPAPER_BUTTON_SET");
  [v132 setTitle:v25 forState:0];

  [v132 addTarget:self action:"_setButtonSelected:" forControlEvents:0x2000];
  [v132 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v26 = [(CARWallpaperPreviewPanel *)self view];
  [v26 addSubview:v132];

  v27 = [v134 leadingAnchor];
  v28 = [(CARWallpaperPreviewPanel *)self view];
  v29 = [v28 safeAreaLayoutGuide];
  v30 = [v29 leadingAnchor];
  v130 = [v27 constraintEqualToAnchor:v30];

  v31 = [(CARWallpaperPreviewPanel *)self view];
  v32 = [v31 safeAreaLayoutGuide];
  v33 = [v32 trailingAnchor];
  v34 = [v134 trailingAnchor];
  v128 = [v33 constraintEqualToAnchor:v34];

  v35 = [v134 topAnchor];
  v36 = [(CARWallpaperPreviewPanel *)self view];
  v37 = [v36 safeAreaLayoutGuide];
  v38 = [v37 topAnchor];
  v126 = [v35 constraintEqualToAnchor:v38];

  v39 = [v136 topAnchor];
  v40 = [v134 bottomAnchor];
  v124 = [v39 constraintEqualToAnchor:v40];

  v143[0] = v126;
  v143[1] = v130;
  v143[2] = v124;
  v143[3] = v128;
  v41 = +[NSArray arrayWithObjects:v143 count:4];
  [(CARWallpaperPreviewPanel *)self setStackViewEdgeConstraints:v41];

  v142[0] = v130;
  v142[1] = v128;
  v142[2] = v126;
  v142[3] = v124;
  v121 = [(CARWallpaperPreviewPanel *)self stackViewLayoutGuide];
  v115 = [v121 leadingAnchor];
  v119 = [(CARWallpaperPreviewPanel *)self view];
  v117 = [v119 safeAreaLayoutGuide];
  v113 = [v117 leadingAnchor];
  v111 = [v115 constraintEqualToAnchor:v113];
  v142[4] = v111;
  v110 = [(CARWallpaperPreviewPanel *)self stackViewLayoutGuide];
  v107 = [v110 trailingAnchor];
  v109 = [(CARWallpaperPreviewPanel *)self view];
  v108 = [v109 safeAreaLayoutGuide];
  v106 = [v108 trailingAnchor];
  v105 = [v107 constraintEqualToAnchor:v106];
  v142[5] = v105;
  v104 = [(CARWallpaperPreviewPanel *)self stackViewLayoutGuide];
  v101 = [v104 topAnchor];
  v103 = [(CARWallpaperPreviewPanel *)self view];
  v102 = [v103 safeAreaLayoutGuide];
  v100 = [v102 topAnchor];
  v99 = [v101 constraintEqualToAnchor:v100];
  v142[6] = v99;
  v98 = [(CARWallpaperPreviewPanel *)self stackViewLayoutGuide];
  v97 = [v98 bottomAnchor];
  v96 = [v136 topAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v142[7] = v95;
  v92 = [v136 leadingAnchor];
  v94 = [(CARWallpaperPreviewPanel *)self view];
  v93 = [v94 safeAreaLayoutGuide];
  v91 = [v93 leadingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91 constant:20.0];
  v142[8] = v90;
  v89 = [v132 leadingAnchor];
  v88 = [v136 trailingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88 constant:40.0];
  v142[9] = v87;
  v86 = [(CARWallpaperPreviewPanel *)self view];
  v85 = [v86 safeAreaLayoutGuide];
  v84 = [v85 bottomAnchor];
  v83 = [v136 bottomAnchor];
  v82 = [v84 constraintEqualToSystemSpacingBelowAnchor:v83 multiplier:1.0];
  v142[10] = v82;
  v81 = [v136 heightAnchor];
  v80 = [v81 constraintEqualToConstant:36.0];
  v142[11] = v80;
  v79 = [(CARWallpaperPreviewPanel *)self view];
  v78 = [v79 safeAreaLayoutGuide];
  v77 = [v78 trailingAnchor];
  v76 = [v132 trailingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:20.0];
  v142[12] = v75;
  v74 = [v132 widthAnchor];
  v73 = [v136 widthAnchor];
  v42 = [v74 constraintEqualToAnchor:v73];
  v142[13] = v42;
  v43 = [(CARWallpaperPreviewPanel *)self view];
  v44 = [v43 safeAreaLayoutGuide];
  v45 = [v44 bottomAnchor];
  v46 = [v132 bottomAnchor];
  v47 = [v45 constraintEqualToSystemSpacingBelowAnchor:v46 multiplier:1.0];
  v142[14] = v47;
  v48 = [v132 heightAnchor];
  v49 = [v48 constraintEqualToConstant:36.0];
  v142[15] = v49;
  v50 = +[NSArray arrayWithObjects:v142 count:16];
  +[NSLayoutConstraint activateConstraints:v50];

  id v51 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_backButtonPressed:"];
  [v51 setAllowedPressTypes:&off_1000973D0];
  v52 = [(CARWallpaperPreviewPanel *)self view];
  [v52 addGestureRecognizer:v51];

  objc_initWeak(&location, self);
  v53 = [(CARSettingsPanel *)self panelController];
  v54 = [v53 vehicle];
  v55 = [v54 identifier];
  v56 = [v55 UUIDString];

  if (v56)
  {
    v57 = [(CARWallpaperPreviewPanel *)self iconLayoutController];
    v137[0] = _NSConcreteStackBlock;
    v137[1] = 3221225472;
    v137[2] = sub_10001FBBC;
    v137[3] = &unk_1000925A0;
    objc_copyWeak(&v138, &location);
    [v57 fetchIconStateForVehicleID:v56 completion:v137];

    objc_destroyWeak(&v138);
  }
  else
  {
    v58 = sub_100021030();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = [(CARSettingsPanel *)self panelController];
      v60 = [v59 vehicle];
      sub_1000656E0(v60, buf, v58, v59);
    }
  }
  v61 = +[NSNotificationCenter defaultCenter];
  v62 = [(CARWallpaperPreviewPanel *)self view];
  v63 = [v62 window];
  v64 = [v63 windowScene];
  [v61 addObserver:self selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:v64];

  v65 = +[NSNotificationCenter defaultCenter];
  v66 = [(CARWallpaperPreviewPanel *)self view];
  v67 = [v66 window];
  v68 = [v67 windowScene];
  [v65 addObserver:self selector:"_sceneDidActivate:" name:UISceneDidActivateNotification object:v68];

  v69 = +[NSNotificationCenter defaultCenter];
  v70 = [(CARWallpaperPreviewPanel *)self view];
  v71 = [v70 window];
  v72 = [v71 windowScene];
  [v69 addObserver:self selector:"_sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:v72];

  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CARWallpaperPreviewPanel;
  [(CARWallpaperPreviewPanel *)&v7 viewWillAppear:a3];
  v4 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  objc_super v5 = +[BSAnimationSettings settingsWithDuration:v4 timingFunction:0.5];

  v6 = [(CARWallpaperPreviewPanel *)self statusBarStyleAssertion];
  [v6 acquireWithAnimationSettings:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CARWallpaperPreviewPanel;
  -[CARWallpaperPreviewPanel viewWillTransitionToSize:withTransitionCoordinator:](&v7, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  objc_super v5 = [(CARSettingsPanel *)self panelController];
  [v5 dismissPanel:self];

  v6 = [(CARWallpaperPreviewPanel *)self statusBarStyleAssertion];
  [v6 invalidate];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CARWallpaperPreviewPanel;
  [(CARWallpaperPreviewPanel *)&v3 viewSafeAreaInsetsDidChange];
  [(CARWallpaperPreviewPanel *)self _updateStackViewEdgeConstraints];
}

- (void)_sceneWillEnterForeground:(id)a3
{
}

- (void)_sceneDidActivate:(id)a3
{
}

- (void)_activateStatusBarStyleOverrideIfNecessary
{
  objc_super v3 = [(CARWallpaperPreviewPanel *)self statusBarStyleAssertion];
  unsigned __int8 v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    id v7 = +[BSAnimationSettings settingsWithDuration:v5 timingFunction:0.5];

    v6 = [(CARWallpaperPreviewPanel *)self statusBarStyleAssertion];
    [v6 acquireWithAnimationSettings:v7];
  }
}

- (void)_sceneWillDeactivate:(id)a3
{
  unsigned __int8 v4 = [(CARWallpaperPreviewPanel *)self view];
  objc_super v5 = [v4 window];
  v6 = [v5 windowScene];
  id v7 = [v6 _FBSScene];
  id v11 = [v7 settings];

  if ([v11 deactivationReasons] != (id)16)
  {
    v8 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v9 = +[BSAnimationSettings settingsWithDuration:v8 timingFunction:0.5];

    v10 = [(CARWallpaperPreviewPanel *)self statusBarStyleAssertion];
    [v10 relinquishWithAnimationSettings:v9];
  }
}

- (void)_backButtonPressed:(id)a3
{
}

- (void)_cancelButtonSelected:(id)a3
{
}

- (void)_handleDismissal
{
  objc_super v3 = sub_100021030();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = [(CARWallpaperPreviewPanel *)self wallpaper];
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] Preview for #wallpaper %{public}@ canceled, dismissing.", buf, 0xCu);
  }
  objc_super v5 = [(CARWallpaperPreviewPanel *)self completionHandler];

  if (v5)
  {
    v6 = [(CARWallpaperPreviewPanel *)self completionHandler];
    v6[2](v6, 0);
  }
  id v7 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  v8 = +[BSAnimationSettings settingsWithDuration:v7 timingFunction:0.35];

  v9 = [(CARWallpaperPreviewPanel *)self statusBarStyleAssertion];
  [v9 relinquishWithAnimationSettings:v8];

  v10 = [(CARSettingsPanel *)self panelController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000201F8;
  v11[3] = &unk_100091F38;
  v11[4] = self;
  [v10 dismissPanel:self completion:v11];
}

- (void)_setButtonSelected:(id)a3
{
  unsigned __int8 v4 = sub_100021030();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = [(CARWallpaperPreviewPanel *)self wallpaper];
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Settings] Saving selected #wallpaper %{public}@", buf, 0xCu);
  }
  v6 = [(CARWallpaperPreviewPanel *)self wallpaperPreferences];
  id v7 = [(CARWallpaperPreviewPanel *)self wallpaper];
  [v6 setCurrentWallpaper:v7];

  v8 = [(CARWallpaperPreviewPanel *)self completionHandler];

  if (v8)
  {
    v9 = [(CARWallpaperPreviewPanel *)self completionHandler];
    v9[2](v9, 1);
  }
  v10 = [(CARSettingsPanel *)self panelController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000203D4;
  v11[3] = &unk_100091F38;
  v11[4] = self;
  [v10 dismissPanel:self completion:v11];
}

- (void)_setIconState:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:kCRSIconLayoutRowCount];
  id v6 = [v5 unsignedIntegerValue];

  id v7 = [v4 objectForKeyedSubscript:kCRSIconLayoutColumnCount];
  id v8 = [v7 unsignedIntegerValue];

  id v39 = v6;
  if (v6 != (id)[(CARWallpaperPreviewPanel *)self iconRows]
    || v8 != (id)[(CARWallpaperPreviewPanel *)self iconColumns])
  {
    v36 = v4;
    [(CARWallpaperPreviewPanel *)self setIconRows:v6];
    [(CARWallpaperPreviewPanel *)self setIconColumns:v8];
    [(CARWallpaperPreviewPanel *)self _updateStackViewEdgeConstraints];
    v9 = [(CARWallpaperPreviewPanel *)self stackView];
    v10 = [v9 arrangedSubviews];

    v35 = v10;
    [v10 enumerateObjectsUsingBlock:&stru_1000925E0];
    uint64_t v11 = +[NSMutableArray arrayWithCapacity:(void)v8 * (void)v39];
    id v12 = (void *)v11;
    if (v39)
    {
      uint64_t v13 = 0;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      v17 = &_s7SwiftUI18_AspectRatioLayoutVAA12ViewModifierAAWP_ptr;
      v18 = &_s7SwiftUI18_AspectRatioLayoutVAA12ViewModifierAAWP_ptr;
      v19 = &_s7SwiftUI18_AspectRatioLayoutVAA12ViewModifierAAWP_ptr;
      id v37 = v8;
      v38 = self;
      v41 = (void *)v11;
      do
      {
        uint64_t v40 = v13;
        id v20 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
        [v20 setAxis:0];
        [v20 setDistribution:3];
        unsigned int v21 = [(CARWallpaperPreviewPanel *)self stackView];
        v42 = v20;
        [v21 addArrangedSubview:v20];

        uint64_t v22 = (char *)v8;
        if (v8)
        {
          do
          {
            id v23 = objc_alloc_init((Class)v17[160]);
            [v42 addArrangedSubview:v23];
            [v12 addObject:v23];
            v43 = v18[126];
            v24 = [v23 widthAnchor];
            v25 = [v24 constraintEqualToConstant:60.0];
            v47[0] = v25;
            [v23 heightAnchor];
            v27 = objc_super v26 = v17;
            v28 = [v27 constraintEqualToConstant:60.0];
            v47[1] = v28;
            [v19[118] arrayWithObjects:v47 count:2];
            v29 = v19;
            v31 = v30 = v18;
            [v43 activateConstraints:v31];

            v18 = v30;
            v19 = v29;

            v17 = v26;
            id v12 = v41;

            --v22;
          }
          while (v22);
        }

        uint64_t v13 = v40 + 1;
        id v8 = v37;
        self = v38;
      }
      while ((id)(v40 + 1) != v39);
    }
    id v4 = v36;
    v32 = [v36 objectForKeyedSubscript:kCRSIconLayoutIconOrderKey];
    v33 = [v32 firstObject];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000207CC;
    v44[3] = &unk_100092608;
    id v45 = v12;
    v46 = self;
    id v34 = v12;
    [v33 enumerateObjectsUsingBlock:v44];
  }
}

- (id)_iconImageForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100020B4C;
  v28 = sub_100020B5C;
  id v29 = 0;
  uint64_t v5 = CRSNowPlayingIdentifier;
  if ([v4 isEqualToString:CRSNowPlayingIdentifier])
  {
    id v6 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:3];
    id v7 = +[NSString stringWithFormat:@"CarDisplayCanvasIcon-%@.png", v5];
    uint64_t v8 = +[UIImage crsui_imageNamed:v7 compatibleWithTraitCollection:v6];
    v9 = (void *)v25[5];
    v25[5] = v8;

    uint64_t v10 = [(id)v25[5] _applicationIconImageForFormat:8 precomposed:1 scale:0.0];
    uint64_t v11 = (void *)v25[5];
    v25[5] = v10;
  }
  else if (([v4 isEqualToString:CRSOEMIdentifier] & 1) != 0 {
         || [v4 isEqualToString:CRSCalendarIdentifier])
  }
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    uint64_t v13 = [(CARWallpaperPreviewPanel *)self iconLayoutController];
    v14 = [(CARSettingsPanel *)self panelController];
    v15 = [v14 vehicle];
    id v16 = [v15 identifier];
    v17 = [v16 UUIDString];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100020B64;
    v21[3] = &unk_100092630;
    id v23 = &v24;
    id v6 = v12;
    uint64_t v22 = v6;
    [v13 fetchApplicationIconInformationForBundleIdentifier:v4 vehicleID:v17 showBorder:0 completion:v21];

    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v18 = +[UIImage _applicationIconImageForBundleIdentifier:v4 format:8];
    id v6 = v25[5];
    v25[5] = v18;
  }

  id v19 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v19;
}

- (void)_updateStackViewEdgeConstraints
{
  objc_super v3 = [(CARWallpaperPreviewPanel *)self stackViewLayoutGuide];
  [v3 layoutFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v27.origin.x = v5;
  v27.origin.double y = v7;
  v27.size.double width = v9;
  v27.size.double height = v11;
  double Height = CGRectGetHeight(v27);
  double v13 = Height - (double)[(CARWallpaperPreviewPanel *)self iconRows] * 60.0;
  double v14 = v13 / (double)([(CARWallpaperPreviewPanel *)self iconRows] + 1);
  v15 = [(CARWallpaperPreviewPanel *)self stackViewEdgeConstraints];
  id v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setConstant:v14];

  v17 = [(CARWallpaperPreviewPanel *)self stackViewEdgeConstraints];
  uint64_t v18 = [v17 objectAtIndexedSubscript:2];
  [v18 setConstant:v14];

  v28.origin.x = v5;
  v28.origin.double y = v7;
  v28.size.double width = v9;
  v28.size.double height = v11;
  double Width = CGRectGetWidth(v28);
  double v20 = Width - (double)[(CARWallpaperPreviewPanel *)self iconColumns] * 60.0;
  double v21 = v20 / (double)([(CARWallpaperPreviewPanel *)self iconColumns] + 1);
  uint64_t v22 = [(CARWallpaperPreviewPanel *)self stackViewEdgeConstraints];
  id v23 = [v22 objectAtIndexedSubscript:1];
  [v23 setConstant:v21];

  id v25 = [(CARWallpaperPreviewPanel *)self stackViewEdgeConstraints];
  uint64_t v24 = [v25 objectAtIndexedSubscript:3];
  [v24 setConstant:v21];
}

- (CRSUIWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
}

- (CRSUIWallpaperPreferences)wallpaperPreferences
{
  return self->_wallpaperPreferences;
}

- (void)setWallpaperPreferences:(id)a3
{
}

- (CRSUIStatusBarStyleAssertion)statusBarStyleAssertion
{
  return self->_statusBarStyleAssertion;
}

- (void)setStatusBarStyleAssertion:(id)a3
{
}

- (CRSIconLayoutController)iconLayoutController
{
  return self->_iconLayoutController;
}

- (void)setIconLayoutController:(id)a3
{
}

- (unint64_t)iconRows
{
  return self->_iconRows;
}

- (void)setIconRows:(unint64_t)a3
{
  self->_iconRows = a3;
}

- (unint64_t)iconColumns
{
  return self->_iconColumns;
}

- (void)setIconColumns:(unint64_t)a3
{
  self->_iconColumns = a3;
}

- (UIView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILayoutGuide)stackViewLayoutGuide
{
  return self->_stackViewLayoutGuide;
}

- (void)setStackViewLayoutGuide:(id)a3
{
}

- (NSArray)stackViewEdgeConstraints
{
  return self->_stackViewEdgeConstraints;
}

- (void)setStackViewEdgeConstraints:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_stackViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_stackViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_iconLayoutController, 0);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_wallpaperPreferences, 0);

  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end