@interface MSDViewServiceRootViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)observerAdded;
- (MSDViewServiceRootViewController)initWithScene:(id)a3;
- (NSString)displayString;
- (NSTimer)showErrorTimer;
- (NSTimer)timer;
- (SBSRemoteAlertConfigurationContext)configurationContext;
- (SBSUIRemoteAlertScene)scene;
- (UIButton)cancelButton;
- (UILabel)mainLabel;
- (UILabel)statusLabel;
- (UIProgressView)progressBar;
- (UITextView)errorView;
- (void)doCancelInstall;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationFailed:(id)a3;
- (void)presentConfirmationAlert;
- (void)quit;
- (void)respondToGesture:(id)a3;
- (void)respondToShowErrorGesture:(id)a3;
- (void)restartTimerWithTimeInterval:(double)a3;
- (void)setCancelButton:(id)a3;
- (void)setConfigurationContext:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setMainLabel:(id)a3;
- (void)setObserverAdded:(BOOL)a3;
- (void)setProgressBar:(id)a3;
- (void)setScene:(id)a3;
- (void)setShowErrorTimer:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setTimer:(id)a3;
- (void)showErrorTimeout:(id)a3;
- (void)timeout:(id)a3;
- (void)updateErrorState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MSDViewServiceRootViewController

- (MSDViewServiceRootViewController)initWithScene:(id)a3
{
  id v4 = a3;
  v5 = sub_100002050();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[MSDViewServiceRootViewController initWithScene:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s called", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)MSDViewServiceRootViewController;
  v6 = [(MSDViewServiceRootViewController *)&v14 initWithNibName:0 bundle:0];
  if (v6)
  {
    v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"IN_PROGRESS" value:&stru_10000C610 table:0];
    displayString = v6->_displayString;
    v6->_displayString = (NSString *)v8;

    v10 = sub_100002050();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v6->_displayString;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Display string: %@", buf, 0xCu);
    }

    [(MSDViewServiceRootViewController *)v6 setObserverAdded:0];
    v12 = [v4 configurationContext];
    [(MSDViewServiceRootViewController *)v6 setConfigurationContext:v12];

    [(MSDViewServiceRootViewController *)v6 setScene:v4];
  }

  return v6;
}

- (void)loadView
{
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v226 = "-[MSDViewServiceRootViewController loadView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s called", buf, 0xCu);
  }

  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [objc_alloc((Class)UIView) initWithFrame:v6, v8, v10, v12];
  objc_super v14 = +[UIColor clearColor];
  [v13 setBackgroundColor:v14];

  [v13 setOpaque:0];
  [(MSDViewServiceRootViewController *)self setView:v13];
  uint64_t v15 = +[UIBlurEffect effectWithStyle:2];
  id v16 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v15];
  v17 = [(MSDViewServiceRootViewController *)self view];
  [v17 bounds];
  [v16 setFrame:];

  [v16 setAutoresizingMask:18];
  v221 = (void *)v15;
  v219 = +[UIVibrancyEffect effectForBlurEffect:v15];
  id v18 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v219];
  v222 = v13;
  [v13 bounds];
  [v18 setFrame:];
  v19 = [v16 contentView];
  v218 = v18;
  [v19 addSubview:v18];

  v20 = [(MSDViewServiceRootViewController *)self view];
  v220 = v16;
  [v20 insertSubview:v16 atIndex:0];

  v21 = [(MSDViewServiceRootViewController *)self configurationContext];
  v22 = [v21 userInfo];

  v23 = +[NSBundle mainBundle];
  v24 = [v22 objectForKeyedSubscript:@"DisplayString"];
  v25 = [v23 localizedStringForKey:v24 value:&stru_10000C610 table:0];
  [(MSDViewServiceRootViewController *)self setDisplayString:v25];

  v217 = [v22 objectForKeyedSubscript:@"CancelButton"];
  id v26 = [v217 BOOLValue];
  v27 = +[MSDViewServiceModel sharedInstance];
  [v27 setShowCancelButton:v26];

  v28 = sub_100002050();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [(MSDViewServiceRootViewController *)self displayString];
    *(_DWORD *)buf = 138543362;
    v226 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "StoreDemoViewService DisplayString = %{public}@", buf, 0xCu);
  }
  id v30 = objc_alloc_init((Class)UILabel);
  [(MSDViewServiceRootViewController *)self setMainLabel:v30];

  id v31 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v32 = +[UIDevice currentDevice];
  id v33 = [v32 userInterfaceIdiom];

  if (v33 == (id)1)
  {
    double v34 = 40.0;
    v35 = +[UIFont fontWithName:@"HelveticaNeue-Thin" size:40.0];
    v36 = [(MSDViewServiceRootViewController *)self mainLabel];
    [v36 setFont:v35];
    double v37 = 15.0;
    double v38 = 50.0;
  }
  else
  {
    v35 = +[UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0];
    v36 = [(MSDViewServiceRootViewController *)self mainLabel];
    [v36 setFont:v35];
    double v37 = 5.0;
    double v34 = 30.0;
    double v38 = 30.0;
  }

  [v31 setMinimumLineHeight:v34];
  [v31 setMaximumLineHeight:v38];
  [v31 setLineSpacing:v37];

  v39 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

  v40 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v40 setNumberOfLines:0];

  v41 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v41 setAdjustsFontSizeToFitWidth:1];

  v42 = +[UIColor clearColor];
  v43 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v43 setBackgroundColor:v42];

  v44 = +[UIColor whiteColor];
  v45 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v45 setTextColor:v44];

  [v31 setAlignment:1];
  NSAttributedStringKey v223 = NSParagraphStyleAttributeName;
  id v224 = v31;
  uint64_t v46 = +[NSDictionary dictionaryWithObjects:&v224 forKeys:&v223 count:1];
  id v47 = objc_alloc((Class)NSAttributedString);
  v48 = [(MSDViewServiceRootViewController *)self displayString];
  v216 = (void *)v46;
  id v49 = [v47 initWithString:v48 attributes:v46];
  v50 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v50 setAttributedText:v49];

  v51 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v51 sizeToFit];

  v52 = [(MSDViewServiceRootViewController *)self view];
  v53 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v52 addSubview:v53];

  id v54 = objc_alloc_init((Class)UIButton);
  [(MSDViewServiceRootViewController *)self setCancelButton:v54];

  v55 = [(MSDViewServiceRootViewController *)self cancelButton];
  [v55 setHidden:1];

  v56 = [(MSDViewServiceRootViewController *)self cancelButton];
  [v56 setTranslatesAutoresizingMaskIntoConstraints:0];

  v57 = [(MSDViewServiceRootViewController *)self cancelButton];
  v58 = +[NSBundle mainBundle];
  v59 = [v58 localizedStringForKey:@"STOP_INSTALL" value:&stru_10000C610 table:0];
  [v57 setTitle:v59 forState:0];

  v60 = [(MSDViewServiceRootViewController *)self cancelButton];
  [v60 sizeToFit];

  v61 = [(MSDViewServiceRootViewController *)self cancelButton];
  [v61 addTarget:self action:"presentConfirmationAlert" forControlEvents:64];

  v62 = [(MSDViewServiceRootViewController *)self view];
  v63 = [(MSDViewServiceRootViewController *)self cancelButton];
  [v62 addSubview:v63];

  id v64 = objc_alloc_init((Class)UILabel);
  [(MSDViewServiceRootViewController *)self setStatusLabel:v64];

  v65 = [(MSDViewServiceRootViewController *)self statusLabel];
  [v65 setTranslatesAutoresizingMaskIntoConstraints:0];

  v66 = +[NSBundle mainBundle];
  v67 = [v66 localizedStringForKey:@"ITEM_FAILED" value:&stru_10000C610 table:0];
  v68 = [(MSDViewServiceRootViewController *)self statusLabel];
  [v68 setText:v67];

  v69 = [(MSDViewServiceRootViewController *)self statusLabel];
  [v69 setLineBreakMode:0];

  v70 = [(MSDViewServiceRootViewController *)self statusLabel];
  [v70 setNumberOfLines:0];

  v71 = [(MSDViewServiceRootViewController *)self statusLabel];
  v72 = +[UIColor whiteColor];
  [v71 setTextColor:v72];

  v73 = [(MSDViewServiceRootViewController *)self statusLabel];
  v74 = +[UIFont systemFontOfSize:14.0];
  [v73 setFont:v74];

  v75 = [(MSDViewServiceRootViewController *)self statusLabel];
  [v75 setTextAlignment:2];

  v76 = [(MSDViewServiceRootViewController *)self statusLabel];
  [v76 sizeToFit];

  v77 = [(MSDViewServiceRootViewController *)self view];
  v78 = [(MSDViewServiceRootViewController *)self statusLabel];
  [v77 addSubview:v78];

  id v79 = objc_alloc_init((Class)UITextView);
  [(MSDViewServiceRootViewController *)self setErrorView:v79];

  v80 = [(MSDViewServiceRootViewController *)self errorView];
  [v80 setHidden:1];

  v81 = [(MSDViewServiceRootViewController *)self errorView];
  [v81 setUserInteractionEnabled:0];

  v82 = [(MSDViewServiceRootViewController *)self errorView];
  [v82 setTranslatesAutoresizingMaskIntoConstraints:0];

  v83 = [(MSDViewServiceRootViewController *)self errorView];
  v84 = +[UIColor whiteColor];
  [v83 setTextColor:v84];

  v85 = [(MSDViewServiceRootViewController *)self errorView];
  v86 = +[UIFont systemFontOfSize:14.0];
  [v85 setFont:v86];

  v87 = +[UIColor clearColor];
  v88 = [(MSDViewServiceRootViewController *)self errorView];
  [v88 setBackgroundColor:v87];

  v89 = [(MSDViewServiceRootViewController *)self errorView];
  [v89 setTextAlignment:0];

  v90 = [(MSDViewServiceRootViewController *)self view];
  v91 = [(MSDViewServiceRootViewController *)self errorView];
  [v90 addSubview:v91];

  id v92 = [objc_alloc((Class)UIProgressView) initWithProgressViewStyle:0];
  [(MSDViewServiceRootViewController *)self setProgressBar:v92];

  v93 = [(MSDViewServiceRootViewController *)self progressBar];
  [v93 setTranslatesAutoresizingMaskIntoConstraints:0];

  v94 = [(MSDViewServiceRootViewController *)self progressBar];
  [v94 setHidden:1];

  v95 = +[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
  v96 = [(MSDViewServiceRootViewController *)self progressBar];
  [v96 setTrackTintColor:v95];

  v97 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
  v98 = [(MSDViewServiceRootViewController *)self progressBar];
  [v98 setTintColor:v97];

  v99 = [(MSDViewServiceRootViewController *)self view];
  v100 = [(MSDViewServiceRootViewController *)self progressBar];
  [v99 addSubview:v100];

  v101 = [(MSDViewServiceRootViewController *)self view];
  v102 = [(MSDViewServiceRootViewController *)self mainLabel];
  v103 = [(MSDViewServiceRootViewController *)self view];
  v104 = +[NSLayoutConstraint constraintWithItem:v102 attribute:9 relatedBy:0 toItem:v103 attribute:9 multiplier:1.0 constant:0.0];
  [v101 addConstraint:v104];

  v105 = [(MSDViewServiceRootViewController *)self view];
  v106 = [(MSDViewServiceRootViewController *)self mainLabel];
  v107 = [(MSDViewServiceRootViewController *)self view];
  v108 = +[NSLayoutConstraint constraintWithItem:v106 attribute:10 relatedBy:0 toItem:v107 attribute:10 multiplier:1.0 constant:0.0];
  [v105 addConstraint:v108];

  v109 = +[UIDevice currentDevice];
  id v110 = [v109 userInterfaceIdiom];

  v111 = [(MSDViewServiceRootViewController *)self view];
  v112 = [(MSDViewServiceRootViewController *)self mainLabel];
  v113 = [(MSDViewServiceRootViewController *)self view];
  if (v110 == (id)1)
  {
    v114 = +[NSLayoutConstraint constraintWithItem:v112 attribute:5 relatedBy:0 toItem:v113 attribute:5 multiplier:1.0 constant:50.0];
    [v111 addConstraint:v114];

    v115 = [(MSDViewServiceRootViewController *)self view];
    v116 = [(MSDViewServiceRootViewController *)self mainLabel];
    v117 = [(MSDViewServiceRootViewController *)self view];
    double v118 = 1.0;
    v119 = v116;
    v120 = v117;
    double v121 = 50.0;
  }
  else
  {
    v122 = +[NSLayoutConstraint constraintWithItem:v112 attribute:5 relatedBy:0 toItem:v113 attribute:5 multiplier:1.0 constant:10.0];
    [v111 addConstraint:v122];

    v115 = [(MSDViewServiceRootViewController *)self view];
    v116 = [(MSDViewServiceRootViewController *)self mainLabel];
    v117 = [(MSDViewServiceRootViewController *)self view];
    double v118 = 1.0;
    double v121 = 10.0;
    v119 = v116;
    v120 = v117;
  }
  v123 = +[NSLayoutConstraint constraintWithItem:v119 attribute:5 relatedBy:0 toItem:v120 attribute:5 multiplier:v118 constant:v121];
  [v115 addConstraint:v123];

  v124 = [(MSDViewServiceRootViewController *)self view];
  v125 = [(MSDViewServiceRootViewController *)self cancelButton];
  v126 = [(MSDViewServiceRootViewController *)self view];
  v127 = +[NSLayoutConstraint constraintWithItem:v125 attribute:9 relatedBy:0 toItem:v126 attribute:9 multiplier:1.0 constant:0.0];
  [v124 addConstraint:v127];

  v128 = [(MSDViewServiceRootViewController *)self view];
  v129 = [(MSDViewServiceRootViewController *)self cancelButton];
  v130 = [(MSDViewServiceRootViewController *)self view];
  v131 = +[NSLayoutConstraint constraintWithItem:v129 attribute:10 relatedBy:0 toItem:v130 attribute:10 multiplier:1.7 constant:0.0];
  [v128 addConstraint:v131];

  v132 = [(MSDViewServiceRootViewController *)self view];
  v133 = [(MSDViewServiceRootViewController *)self errorView];
  v134 = [v133 centerXAnchor];
  v135 = [(MSDViewServiceRootViewController *)self view];
  v136 = [v135 safeAreaLayoutGuide];
  v137 = [v136 centerXAnchor];
  v138 = [v134 constraintEqualToAnchor:v137];
  [v132 addConstraint:v138];

  v139 = [(MSDViewServiceRootViewController *)self view];
  v140 = [(MSDViewServiceRootViewController *)self errorView];
  v141 = [v140 centerYAnchor];
  v142 = [(MSDViewServiceRootViewController *)self view];
  v143 = [v142 safeAreaLayoutGuide];
  v144 = [v143 centerYAnchor];
  v145 = [v141 constraintEqualToAnchor:v144];
  [v139 addConstraint:v145];

  v146 = [(MSDViewServiceRootViewController *)self view];
  v147 = [(MSDViewServiceRootViewController *)self errorView];
  v148 = [v147 leadingAnchor];
  v149 = [(MSDViewServiceRootViewController *)self view];
  v150 = [v149 safeAreaLayoutGuide];
  v151 = [v150 leadingAnchor];
  v152 = [v148 constraintEqualToAnchor:v151 constant:20.0];
  [v146 addConstraint:v152];

  v153 = [(MSDViewServiceRootViewController *)self view];
  v154 = [(MSDViewServiceRootViewController *)self errorView];
  v155 = [v154 trailingAnchor];
  v156 = [(MSDViewServiceRootViewController *)self view];
  v157 = [v156 safeAreaLayoutGuide];
  v158 = [v157 trailingAnchor];
  v159 = [v155 constraintEqualToAnchor:v158 constant:-20.0];
  [v153 addConstraint:v159];

  v160 = [(MSDViewServiceRootViewController *)self view];
  v161 = [(MSDViewServiceRootViewController *)self errorView];
  v162 = [v161 topAnchor];
  v163 = [(MSDViewServiceRootViewController *)self view];
  v164 = [v163 safeAreaLayoutGuide];
  v165 = [v164 topAnchor];
  v166 = [v162 constraintEqualToAnchor:v165 constant:20.0];
  [v160 addConstraint:v166];

  v167 = [(MSDViewServiceRootViewController *)self view];
  v168 = [(MSDViewServiceRootViewController *)self errorView];
  v169 = [v168 bottomAnchor];
  v170 = [(MSDViewServiceRootViewController *)self view];
  v171 = [v170 safeAreaLayoutGuide];
  v172 = [v171 bottomAnchor];
  v173 = [v169 constraintEqualToAnchor:v172 constant:-20.0];
  [v167 addConstraint:v173];

  v174 = [(MSDViewServiceRootViewController *)self view];
  v175 = [(MSDViewServiceRootViewController *)self statusLabel];
  v176 = [v175 trailingAnchor];
  v177 = [(MSDViewServiceRootViewController *)self view];
  v178 = [v177 safeAreaLayoutGuide];
  v179 = [v178 trailingAnchor];
  v180 = [v176 constraintEqualToAnchor:v179 constant:-20.0];
  [v174 addConstraint:v180];

  v181 = [(MSDViewServiceRootViewController *)self view];
  v182 = [(MSDViewServiceRootViewController *)self statusLabel];
  v183 = [v182 leadingAnchor];
  v184 = [(MSDViewServiceRootViewController *)self view];
  v185 = [v184 safeAreaLayoutGuide];
  v186 = [v185 leadingAnchor];
  v187 = [v183 constraintEqualToAnchor:v186 constant:20.0];
  [v181 addConstraint:v187];

  v188 = [(MSDViewServiceRootViewController *)self view];
  v189 = [(MSDViewServiceRootViewController *)self statusLabel];
  v190 = [v189 bottomAnchor];
  v191 = [(MSDViewServiceRootViewController *)self view];
  v192 = [v191 safeAreaLayoutGuide];
  v193 = [v192 bottomAnchor];
  v194 = [v190 constraintEqualToAnchor:v193 constant:-20.0];
  [v188 addConstraint:v194];

  v195 = [(MSDViewServiceRootViewController *)self view];
  v196 = [(MSDViewServiceRootViewController *)self progressBar];
  v197 = [v196 centerXAnchor];
  v198 = [(MSDViewServiceRootViewController *)self view];
  v199 = [v198 safeAreaLayoutGuide];
  v200 = [v199 centerXAnchor];
  v201 = [v197 constraintEqualToAnchor:v200];
  [v195 addConstraint:v201];

  v202 = [(MSDViewServiceRootViewController *)self view];
  v203 = [(MSDViewServiceRootViewController *)self progressBar];
  v204 = [v203 widthAnchor];
  v205 = [(MSDViewServiceRootViewController *)self view];
  v206 = [v205 safeAreaLayoutGuide];
  v207 = [v206 widthAnchor];
  v208 = [v204 constraintEqualToAnchor:v207];
  [v202 addConstraint:v208];

  v209 = [(MSDViewServiceRootViewController *)self view];
  v210 = [(MSDViewServiceRootViewController *)self progressBar];
  v211 = [v210 bottomAnchor];
  v212 = [(MSDViewServiceRootViewController *)self view];
  v213 = [v212 safeAreaLayoutGuide];
  v214 = [v213 bottomAnchor];
  v215 = [v211 constraintEqualToAnchor:v214];
  [v209 addConstraint:v215];

  [(MSDViewServiceRootViewController *)self updateErrorState];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)MSDViewServiceRootViewController;
  [(MSDViewServiceRootViewController *)&v28 viewDidLoad];
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v30 = "-[MSDViewServiceRootViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s called", buf, 0xCu);
  }

  id v4 = objc_alloc_init((Class)UIView);
  double v5 = [(MSDViewServiceRootViewController *)self view];
  [v5 size];
  double v7 = v6 * 0.5;
  double v8 = [(MSDViewServiceRootViewController *)self view];
  [v8 size];
  double v10 = v9 * 0.5;
  double v11 = [(MSDViewServiceRootViewController *)self view];
  [v11 size];
  double v13 = v12 * 0.5;

  [v4 setFrame:v7, 0.0, v10, v13];
  objc_super v14 = [(MSDViewServiceRootViewController *)self view];
  [v14 addSubview:v4];

  id v15 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"respondToGesture:"];
  [v15 setDelegate:self];
  [v15 setMinimumPressDuration:5.0];
  [v15 setNumberOfTouchesRequired:3];
  [v4 addGestureRecognizer:v15];
  if (os_variant_has_internal_content())
  {
    id v16 = objc_alloc_init((Class)UIView);

    v17 = [(MSDViewServiceRootViewController *)self view];
    [v17 size];
    double v19 = v18 * 0.5;
    v20 = [(MSDViewServiceRootViewController *)self view];
    [v20 size];
    double v22 = v21 * 0.5;
    v23 = [(MSDViewServiceRootViewController *)self view];
    [v23 size];
    double v25 = v24 * 0.5;

    [v16 setFrame:0.0, v19, v22, v25];
    id v26 = [(MSDViewServiceRootViewController *)self view];
    [v26 addSubview:v16];

    id v27 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"respondToShowErrorGesture:"];
    [v27 setDelegate:self];
    [v27 setMinimumPressDuration:5.0];
    [v27 setNumberOfTouchesRequired:3];
    [v16 addGestureRecognizer:v27];
    id v15 = v27;
    id v4 = v16;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  if (![(MSDViewServiceRootViewController *)self observerAdded])
  {
    id v4 = +[MSDViewServiceModel sharedInstance];
    [v4 addObserver:self forKeyPath:@"errorMessage" options:3 context:0];
    [v4 addObserver:self forKeyPath:@"errorToReport" options:3 context:0];
    [v4 addObserver:self forKeyPath:@"progress" options:3 context:0];
    [(MSDViewServiceRootViewController *)self setObserverAdded:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = +[MSDKManagedDevice sharedInstance];
  [v3 checkInBlockingUI];
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = sub_100002050();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "StoreDemoViewService disappeared.", v8, 2u);
  }

  if ([(MSDViewServiceRootViewController *)self observerAdded])
  {
    double v5 = +[MSDViewServiceModel sharedInstance];
    [v5 removeObserver:self forKeyPath:@"errorMessage"];

    double v6 = +[MSDViewServiceModel sharedInstance];
    [v6 removeObserver:self forKeyPath:@"errorToReport"];

    double v7 = +[MSDViewServiceModel sharedInstance];
    [v7 removeObserver:self forKeyPath:@"progress"];

    [(MSDViewServiceRootViewController *)self setObserverAdded:0];
  }
}

- (void)doCancelInstall
{
  id v3 = +[MSDKManagedDevice sharedInstance];
  [v3 cancelOperation];

  [(MSDViewServiceRootViewController *)self quit];
}

- (void)timeout:(id)a3
{
  [(MSDViewServiceRootViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v4 = [(MSDViewServiceRootViewController *)self cancelButton];
  [v4 setHidden:1];
}

- (void)showErrorTimeout:(id)a3
{
  id v4 = [(MSDViewServiceRootViewController *)self errorView];
  [v4 setHidden:1];

  double v5 = [(MSDViewServiceRootViewController *)self mainLabel];
  [v5 setHidden:0];

  double v6 = +[MSDViewServiceModel sharedInstance];
  double v7 = [v6 errorMessage];

  if (v7)
  {
    id v8 = [(MSDViewServiceRootViewController *)self statusLabel];
    [v8 setHidden:0];
  }
}

- (void)respondToGesture:(id)a3
{
  id v7 = a3;
  if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)4)
  {
    id v4 = +[MSDViewServiceModel sharedInstance];
    if ([v4 showCancelButton])
    {
      double v5 = [(MSDViewServiceRootViewController *)self cancelButton];
      unsigned int v6 = [v5 isHidden];

      if (!v6) {
        goto LABEL_7;
      }
      [(MSDViewServiceRootViewController *)self restartTimerWithTimeInterval:10.0];
      id v4 = [(MSDViewServiceRootViewController *)self cancelButton];
      [v4 setHidden:0];
    }
  }
LABEL_7:
}

- (void)restartTimerWithTimeInterval:(double)a3
{
  double v5 = [(MSDViewServiceRootViewController *)self timer];

  if (v5)
  {
    unsigned int v6 = [(MSDViewServiceRootViewController *)self timer];
    [v6 invalidate];

    [(MSDViewServiceRootViewController *)self setTimer:0];
  }
  id v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"timeout:" selector:0 userInfo:0 repeats:a3];
  [(MSDViewServiceRootViewController *)self setTimer:v7];
}

- (void)presentConfirmationAlert
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"CONFIRMATION_ALERT_TITLE" value:&stru_10000C610 table:0];
  double v5 = +[NSBundle mainBundle];
  unsigned int v6 = [v5 localizedStringForKey:@"CONFIRMATION_ALERT_MESSAGE" value:&stru_10000C610 table:0];
  id v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  id v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"STOP" value:&stru_10000C610 table:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004E20;
  v15[3] = &unk_10000C468;
  v15[4] = self;
  double v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v15];
  [v7 addAction:v10];

  double v11 = +[NSBundle mainBundle];
  double v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_10000C610 table:0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004E28;
  v14[3] = &unk_10000C468;
  v14[4] = self;
  double v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v14];
  [v7 addAction:v13];

  [(MSDViewServiceRootViewController *)self presentViewController:v7 animated:1 completion:0];
  [(MSDViewServiceRootViewController *)self restartTimerWithTimeInterval:30.0];
}

- (void)respondToShowErrorGesture:(id)a3
{
  id v13 = a3;
  if ([v13 state] == (id)3 || objc_msgSend(v13, "state") == (id)4)
  {
    id v4 = [(MSDViewServiceRootViewController *)self errorView];
    unsigned int v5 = [v4 isHidden];

    if (v5)
    {
      unsigned int v6 = [(MSDViewServiceRootViewController *)self showErrorTimer];

      if (v6)
      {
        id v7 = [(MSDViewServiceRootViewController *)self showErrorTimer];
        [v7 invalidate];

        [(MSDViewServiceRootViewController *)self setShowErrorTimer:0];
      }
      id v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"showErrorTimeout:" selector:0 userInfo:0 repeats:30.0];
      [(MSDViewServiceRootViewController *)self setShowErrorTimer:v8];

      double v9 = [(MSDViewServiceRootViewController *)self errorView];
      [v9 setHidden:0];

      double v10 = [(MSDViewServiceRootViewController *)self mainLabel];
      [v10 setHidden:1];

      double v11 = [(MSDViewServiceRootViewController *)self cancelButton];
      [v11 setHidden:1];

      double v12 = [(MSDViewServiceRootViewController *)self statusLabel];
      [v12 setHidden:1];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  if ([v9 isEqualToString:@"errorToReport"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005264;
    block[3] = &unk_10000C490;
    objc_copyWeak(&v19, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v19);
  }
  else if ([v9 isEqualToString:@"errorMessage"])
  {
    double v12 = sub_100002050();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received an error message change: %{public}@", buf, 0xCu);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005360;
    v16[3] = &unk_10000C490;
    objc_copyWeak(&v17, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
    objc_destroyWeak(&v17);
  }
  else if ([v9 isEqualToString:@"progress"])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000053A0;
    v14[3] = &unk_10000C490;
    objc_copyWeak(&v15, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    objc_destroyWeak(&v15);
  }
  else
  {
    id v13 = sub_100002050();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000633C(v13);
    }
  }
  objc_destroyWeak(&location);
}

- (void)updateErrorState
{
  id v3 = +[MSDViewServiceModel sharedInstance];
  id v8 = [v3 errorMessage];

  id v4 = [(MSDViewServiceRootViewController *)self statusLabel];
  if (v8)
  {
    [v4 setHidden:0];

    unsigned int v5 = [(MSDViewServiceRootViewController *)self errorView];
    unsigned int v6 = v5;
    CFStringRef v7 = v8;
  }
  else
  {
    [v4 setHidden:1];

    unsigned int v5 = [(MSDViewServiceRootViewController *)self errorView];
    unsigned int v6 = v5;
    CFStringRef v7 = @"<no error>";
  }
  [v5 setText:v7];
}

- (void)operationFailed:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[MSDKManagedDevice sharedInstance];
  id v6 = [v5 typeOfDemoDevice];

  if (v6 == (id)5)
  {
    [(MSDViewServiceRootViewController *)self quit];
  }
  else
  {
    if ([v4 code] == (id)3727741088) {
      CFStringRef v7 = @"CONNECTION_FAILED";
    }
    else {
      CFStringRef v7 = @"GENERIC_FAILUARE";
    }
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Demo Setup" value:&stru_10000C610 table:0];

    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:v7 value:&stru_10000C610 table:0];

    double v12 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:1];
    id v13 = +[NSBundle mainBundle];
    objc_super v14 = [v13 localizedStringForKey:@"OK" value:&stru_10000C610 table:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005740;
    v16[3] = &unk_10000C468;
    void v16[4] = self;
    id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v16];
    [v12 addAction:v15];

    [(MSDViewServiceRootViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

- (void)quit
{
  id v2 = [(MSDViewServiceRootViewController *)self scene];
  [v2 deactivate];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (NSString)displayString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayString:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (UITextView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSTimer)showErrorTimer
{
  return self->_showErrorTimer;
}

- (void)setShowErrorTimer:(id)a3
{
}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  return self->_configurationContext;
}

- (void)setConfigurationContext:(id)a3
{
}

- (SBSUIRemoteAlertScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (BOOL)observerAdded
{
  return self->_observerAdded;
}

- (void)setObserverAdded:(BOOL)a3
{
  self->_observerAdded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_showErrorTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);

  objc_storeStrong((id *)&self->_displayString, 0);
}

@end