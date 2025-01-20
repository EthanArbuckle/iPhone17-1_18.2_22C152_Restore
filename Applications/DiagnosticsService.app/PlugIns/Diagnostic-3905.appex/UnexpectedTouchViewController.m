@interface UnexpectedTouchViewController
- (BOOL)prefersStatusBarHidden;
- (MultiTouchHelper)multiTouchHelper;
- (NSMutableArray)allResults;
- (NSMutableArray)hitPixelTimes;
- (NSMutableArray)hitPixels;
- (NSMutableArray)touchEvents;
- (NSTimer)progressTimer;
- (UIDevice)device;
- (UILabel)doNotDisturbLabel;
- (UILabel)progressLabel;
- (UIProgressView)progressBar;
- (UIView)progressView;
- (UnexpectedTouchInputs)inputs;
- (id)localizedTimeRemaining:(int)a3;
- (int)secondsTicked;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)batteryStateChanged;
- (void)cleanUp;
- (void)endTest;
- (void)highlightView:(id)a3 touchEvent:(id)a4;
- (void)setAllResults:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDoNotDisturbLabel:(id)a3;
- (void)setHitPixelTimes:(id)a3;
- (void)setHitPixels:(id)a3;
- (void)setInputs:(id)a3;
- (void)setMultiTouchHelper:(id)a3;
- (void)setProgressBar:(id)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressTimer:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setSecondsTicked:(int)a3;
- (void)setTouchEvents:(id)a3;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)testFailedToExecuteWithStatusCode:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateTimer:(id)a3;
- (void)updateViewConstraints;
@end

@implementation UnexpectedTouchViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[UnexpectedTouchViewController setInputs:](self, "setInputs:", a3, a4);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [(UnexpectedTouchViewController *)self setHitPixels:v5];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  [(UnexpectedTouchViewController *)self setHitPixelTimes:v6];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  [(UnexpectedTouchViewController *)self setTouchEvents:v7];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  [(UnexpectedTouchViewController *)self setAllResults:v8];

  v9 = objc_alloc_init(MultiTouchHelper);
  [(UnexpectedTouchViewController *)self setMultiTouchHelper:v9];

  v10 = [(UnexpectedTouchViewController *)self inputs];
  unsigned int v11 = [v10 connectedToPowerRequired];

  if (v11)
  {
    v12 = +[UIDevice currentDevice];
    [(UnexpectedTouchViewController *)self setDevice:v12];

    v13 = [(UnexpectedTouchViewController *)self device];
    [v13 setBatteryMonitoringEnabled:1];
  }

  [(UnexpectedTouchViewController *)self setSecondsTicked:0];
}

- (void)start
{
  [(UnexpectedTouchViewController *)self setupView];
  v3 = [(UnexpectedTouchViewController *)self inputs];
  unsigned int v4 = [v3 connectedToPowerRequired];

  if (v4)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"batteryStateChanged" name:UIDeviceBatteryStateDidChangeNotification object:0];

    id v6 = [(UnexpectedTouchViewController *)self multiTouchHelper];
    unsigned __int8 v7 = [v6 isPowerConnected];

    if ((v7 & 1) == 0)
    {
      [(UnexpectedTouchViewController *)self testFailedToExecuteWithStatusCode:&off_1000087A8];
    }
  }
}

- (void)setupView
{
  v3 = [(UnexpectedTouchViewController *)self view];
  unsigned int v4 = +[UIColor whiteColor];
  [v3 setBackgroundColor:v4];

  id v5 = +[UIScreen mainScreen];
  [v5 nativeScale];
  double v7 = v6;

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v8 = [(UnexpectedTouchViewController *)self inputs];
  v9 = [v8 touchMap];

  id v10 = [v9 countByEnumeratingWithState:&v94 objects:v98 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v95;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v95 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        id v15 = objc_alloc((Class)UIView);
        [v14 x];
        double v17 = v16 / v7;
        [v14 y];
        double v19 = v18 / v7;
        [v14 width];
        double v21 = v20 / v7;
        [v14 height];
        id v23 = [v15 initWithFrame:v17, v19, v21, v22 / v7];
        [v23 setMultipleTouchEnabled:1];
        v24 = [(UnexpectedTouchViewController *)self view];
        [v24 addSubview:v23];
      }
      id v11 = [v9 countByEnumeratingWithState:&v94 objects:v98 count:16];
    }
    while (v11);
  }

  v25 = [(UnexpectedTouchViewController *)self view];
  [v25 setMultipleTouchEnabled:1];

  id v26 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v30 = [v26 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UnexpectedTouchViewController *)self setProgressView:v30];

  v31 = +[UIColor colorWithHexValue:@"EEEEEE" error:0];
  v32 = [(UnexpectedTouchViewController *)self progressView];
  [v32 setBackgroundColor:v31];

  v33 = [(UnexpectedTouchViewController *)self progressView];
  [v33 setAlpha:0.75];

  v34 = [(UnexpectedTouchViewController *)self progressView];
  v35 = [v34 layer];
  [v35 setCornerRadius:8.0];

  v36 = [(UnexpectedTouchViewController *)self progressView];
  [v36 setUserInteractionEnabled:0];

  v37 = [(UnexpectedTouchViewController *)self progressView];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v38 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UnexpectedTouchViewController *)self setProgressLabel:v38];

  v39 = +[UIColor darkTextColor];
  v40 = [(UnexpectedTouchViewController *)self progressLabel];
  [v40 setTextColor:v39];

  v41 = [(UnexpectedTouchViewController *)self progressLabel];
  [v41 setContentMode:7];

  v42 = [(UnexpectedTouchViewController *)self progressLabel];
  LODWORD(v43) = 1132134400;
  [v42 setContentHuggingPriority:0 forAxis:v43];

  v44 = [(UnexpectedTouchViewController *)self progressLabel];
  LODWORD(v45) = 1132134400;
  [v44 setContentHuggingPriority:1 forAxis:v45];

  v46 = [(UnexpectedTouchViewController *)self progressLabel];
  [v46 setTextAlignment:1];

  v47 = [(UnexpectedTouchViewController *)self progressLabel];
  [v47 setLineBreakMode:0];

  v48 = [(UnexpectedTouchViewController *)self progressLabel];
  [v48 setBaselineAdjustment:2];

  v49 = [(UnexpectedTouchViewController *)self progressLabel];
  [v49 setNumberOfLines:2];

  v50 = +[UIFont systemFontOfSize:17.0];
  v51 = [(UnexpectedTouchViewController *)self progressLabel];
  [v51 setFont:v50];

  v52 = [(UnexpectedTouchViewController *)self progressLabel];
  [v52 setPreferredMaxLayoutWidth:240.0];

  v53 = [(UnexpectedTouchViewController *)self inputs];
  v54 = -[UnexpectedTouchViewController localizedTimeRemaining:](self, "localizedTimeRemaining:", [v53 minutesToRun]);
  v55 = [(UnexpectedTouchViewController *)self progressLabel];
  [v55 setText:v54];

  v56 = [(UnexpectedTouchViewController *)self progressLabel];
  [v56 setUserInteractionEnabled:0];

  v57 = [(UnexpectedTouchViewController *)self progressLabel];
  [v57 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v58 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UnexpectedTouchViewController *)self setDoNotDisturbLabel:v58];

  v59 = +[UIColor darkTextColor];
  v60 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v60 setTextColor:v59];

  v61 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v61 setContentMode:7];

  v62 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  LODWORD(v63) = 1132134400;
  [v62 setContentHuggingPriority:0 forAxis:v63];

  v64 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  LODWORD(v65) = 1132134400;
  [v64 setContentHuggingPriority:1 forAxis:v65];

  v66 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v66 setTextAlignment:1];

  v67 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v67 setLineBreakMode:4];

  v68 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v68 setBaselineAdjustment:2];

  v69 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v69 setNumberOfLines:3];

  v70 = +[UIFont systemFontOfSize:27.0];
  v71 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v71 setFont:v70];

  v72 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v72 setPreferredMaxLayoutWidth:240.0];

  v73 = +[NSBundle mainBundle];
  v74 = [v73 localizedStringForKey:@"DO_NOT_DISTURB_THE_DEVICE" value:&stru_1000086A8 table:0];
  v75 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v75 setText:v74];

  v76 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v76 setUserInteractionEnabled:0];

  v77 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v77 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v78 = [objc_alloc((Class)UIProgressView) initWithProgressViewStyle:0];
  [(UnexpectedTouchViewController *)self setProgressBar:v78];

  v79 = [(UnexpectedTouchViewController *)self progressBar];
  [v79 setProgress:0.0];

  v80 = [(UnexpectedTouchViewController *)self progressBar];
  LODWORD(v81) = 1144750080;
  [v80 setContentHuggingPriority:1 forAxis:v81];

  v82 = [(UnexpectedTouchViewController *)self progressBar];
  [v82 setUserInteractionEnabled:0];

  v83 = [(UnexpectedTouchViewController *)self progressBar];
  [v83 setTranslatesAutoresizingMaskIntoConstraints:0];

  v84 = [(UnexpectedTouchViewController *)self view];
  [v84 setNeedsUpdateConstraints];

  v85 = [(UnexpectedTouchViewController *)self progressView];
  v86 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
  [v85 addSubview:v86];

  v87 = [(UnexpectedTouchViewController *)self progressView];
  v88 = [(UnexpectedTouchViewController *)self progressBar];
  [v87 addSubview:v88];

  v89 = [(UnexpectedTouchViewController *)self progressView];
  v90 = [(UnexpectedTouchViewController *)self progressLabel];
  [v89 addSubview:v90];

  v91 = [(UnexpectedTouchViewController *)self view];
  v92 = [(UnexpectedTouchViewController *)self progressView];
  [v91 addSubview:v92];

  v93 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateTimer:" selector:0 userInfo:1 repeats:1.0];
  [(UnexpectedTouchViewController *)self setProgressTimer:v93];
}

- (void)updateViewConstraints
{
  v152.receiver = self;
  v152.super_class = (Class)UnexpectedTouchViewController;
  [(UnexpectedTouchViewController *)&v152 updateViewConstraints];
  v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v5 = [(UnexpectedTouchViewController *)self progressView];
    double v6 = [(UnexpectedTouchViewController *)self progressView];
    double v7 = +[NSLayoutConstraint constraintWithItem:v6 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:280.0];
    [v5 addConstraint:v7];

    id v8 = [(UnexpectedTouchViewController *)self progressView];
    v9 = +[NSLayoutConstraint constraintWithItem:v8 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:150.0];

    LODWORD(v10) = 1144750080;
    [v9 setPriority:v10];
    id v11 = [(UnexpectedTouchViewController *)self progressView];
    [v11 addConstraint:v9];

    uint64_t v12 = [(UnexpectedTouchViewController *)self view];
    v13 = [(UnexpectedTouchViewController *)self progressView];
    v14 = [(UnexpectedTouchViewController *)self view];
    id v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:9 relatedBy:0 toItem:v14 attribute:9 multiplier:1.0 constant:0.0];
    [v12 addConstraint:v15];

    double v16 = [(UnexpectedTouchViewController *)self view];
    double v17 = [(UnexpectedTouchViewController *)self progressView];
    double v18 = [(UnexpectedTouchViewController *)self view];
    double v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:10 relatedBy:0 toItem:v18 attribute:10 multiplier:1.0 constant:0.0];
    [v16 addConstraint:v19];

    double v20 = [(UnexpectedTouchViewController *)self progressView];
    double v21 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    double v22 = [(UnexpectedTouchViewController *)self progressView];
    id v23 = +[NSLayoutConstraint constraintWithItem:v21 attribute:5 relatedBy:0 toItem:v22 attribute:5 multiplier:1.0 constant:26.0];
    [v20 addConstraint:v23];

    v24 = [(UnexpectedTouchViewController *)self progressView];
    v25 = [(UnexpectedTouchViewController *)self progressView];
    id v26 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v27 = +[NSLayoutConstraint constraintWithItem:v25 attribute:6 relatedBy:0 toItem:v26 attribute:6 multiplier:1.0 constant:26.0];
    [v24 addConstraint:v27];

    v28 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v29 = +[NSLayoutConstraint constraintWithItem:v28 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:65.0];

    LODWORD(v30) = 1144750080;
    [v29 setPriority:v30];
    v31 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    [v31 addConstraint:v29];

    v32 = [(UnexpectedTouchViewController *)self progressView];
    v33 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v34 = [(UnexpectedTouchViewController *)self progressView];
    v35 = +[NSLayoutConstraint constraintWithItem:v33 attribute:9 relatedBy:0 toItem:v34 attribute:9 multiplier:1.0 constant:0.0];
    [v32 addConstraint:v35];

    v36 = [(UnexpectedTouchViewController *)self progressView];
    v37 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    id v38 = [(UnexpectedTouchViewController *)self progressView];
    v39 = +[NSLayoutConstraint constraintWithItem:v37 attribute:11 relatedBy:0 toItem:v38 attribute:10 multiplier:1.0 constant:-13.0];
    [v36 addConstraint:v39];

    v40 = [(UnexpectedTouchViewController *)self progressView];
    v41 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v42 = [(UnexpectedTouchViewController *)self progressView];
    double v43 = +[NSLayoutConstraint constraintWithItem:v41 attribute:3 relatedBy:0 toItem:v42 attribute:3 multiplier:1.0 constant:26.0];
    [v40 addConstraint:v43];

    v44 = [(UnexpectedTouchViewController *)self progressBar];
    double v45 = [(UnexpectedTouchViewController *)self progressBar];
    v46 = +[NSLayoutConstraint constraintWithItem:v45 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:240.0];
    [v44 addConstraint:v46];

    v47 = [(UnexpectedTouchViewController *)self progressView];
    v48 = [(UnexpectedTouchViewController *)self progressBar];
    v49 = [(UnexpectedTouchViewController *)self progressView];
    v50 = +[NSLayoutConstraint constraintWithItem:v48 attribute:9 relatedBy:0 toItem:v49 attribute:9 multiplier:1.0 constant:0.0];
    [v47 addConstraint:v50];

    v51 = [(UnexpectedTouchViewController *)self progressView];
    v52 = [(UnexpectedTouchViewController *)self progressBar];
    v53 = [(UnexpectedTouchViewController *)self progressView];
    v54 = +[NSLayoutConstraint constraintWithItem:v52 attribute:3 relatedBy:0 toItem:v53 attribute:10 multiplier:1.0 constant:13.0];
    [v51 addConstraint:v54];

    v55 = [(UnexpectedTouchViewController *)self progressView];
    v56 = [(UnexpectedTouchViewController *)self progressLabel];
    v57 = [(UnexpectedTouchViewController *)self progressView];
    id v58 = +[NSLayoutConstraint constraintWithItem:v56 attribute:5 relatedBy:0 toItem:v57 attribute:5 multiplier:1.0 constant:26.0];
    [v55 addConstraint:v58];

    v59 = [(UnexpectedTouchViewController *)self progressView];
    v60 = [(UnexpectedTouchViewController *)self progressView];
    v61 = [(UnexpectedTouchViewController *)self progressLabel];
    v62 = +[NSLayoutConstraint constraintWithItem:v60 attribute:6 relatedBy:0 toItem:v61 attribute:6 multiplier:1.0 constant:26.0];
    [v59 addConstraint:v62];

    double v63 = [(UnexpectedTouchViewController *)self progressLabel];
    v64 = +[NSLayoutConstraint constraintWithItem:v63 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:21.0];

    LODWORD(v65) = 1144750080;
    [v64 setPriority:v65];
    v66 = [(UnexpectedTouchViewController *)self progressLabel];
    [v66 addConstraint:v64];

    v67 = [(UnexpectedTouchViewController *)self progressView];
    v68 = [(UnexpectedTouchViewController *)self progressLabel];
    v69 = [(UnexpectedTouchViewController *)self progressView];
    v70 = +[NSLayoutConstraint constraintWithItem:v68 attribute:9 relatedBy:0 toItem:v69 attribute:9 multiplier:1.0 constant:0.0];
    [v67 addConstraint:v70];

    v71 = [(UnexpectedTouchViewController *)self progressView];
    v72 = [(UnexpectedTouchViewController *)self progressLabel];
    v73 = [(UnexpectedTouchViewController *)self progressBar];
    v74 = +[NSLayoutConstraint constraintWithItem:v72 attribute:3 relatedBy:0 toItem:v73 attribute:4 multiplier:1.0 constant:16.0];
    [v71 addConstraint:v74];

    v75 = [(UnexpectedTouchViewController *)self progressView];
    v76 = [(UnexpectedTouchViewController *)self progressView];
    v77 = [(UnexpectedTouchViewController *)self progressLabel];
    double v78 = 1.0;
    double v79 = 26.0;
    v80 = v76;
    uint64_t v81 = 4;
    v82 = v77;
    uint64_t v83 = 11;
  }
  else
  {
    v84 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v9 = +[NSLayoutConstraint constraintWithItem:v84 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:65.0];

    LODWORD(v85) = 1144750080;
    [v9 setPriority:v85];
    v86 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    [v86 addConstraint:v9];

    v87 = [(UnexpectedTouchViewController *)self progressBar];
    v88 = [(UnexpectedTouchViewController *)self progressBar];
    v89 = +[NSLayoutConstraint constraintWithItem:v88 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:240.0];
    [v87 addConstraint:v89];

    v90 = [(UnexpectedTouchViewController *)self progressLabel];
    v29 = +[NSLayoutConstraint constraintWithItem:v90 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:21.0];

    LODWORD(v91) = 1144750080;
    [v29 setPriority:v91];
    v92 = [(UnexpectedTouchViewController *)self progressLabel];
    [v92 addConstraint:v29];

    v93 = [(UnexpectedTouchViewController *)self progressView];
    long long v94 = [(UnexpectedTouchViewController *)self progressView];
    long long v95 = [(UnexpectedTouchViewController *)self progressLabel];
    long long v96 = +[NSLayoutConstraint constraintWithItem:v94 attribute:9 relatedBy:0 toItem:v95 attribute:9 multiplier:1.0 constant:0.0];
    [v93 addConstraint:v96];

    long long v97 = [(UnexpectedTouchViewController *)self progressView];
    v98 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v99 = [(UnexpectedTouchViewController *)self progressView];
    v100 = +[NSLayoutConstraint constraintWithItem:v98 attribute:5 relatedBy:0 toItem:v99 attribute:5 multiplier:1.0 constant:20.0];
    [v97 addConstraint:v100];

    v101 = [(UnexpectedTouchViewController *)self progressView];
    v64 = +[NSLayoutConstraint constraintWithItem:v101 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:150.0];

    LODWORD(v102) = 1144750080;
    [v64 setPriority:v102];
    v103 = [(UnexpectedTouchViewController *)self progressView];
    [v103 addConstraint:v64];

    v104 = [(UnexpectedTouchViewController *)self progressView];
    v105 = [(UnexpectedTouchViewController *)self progressView];
    v106 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v107 = +[NSLayoutConstraint constraintWithItem:v105 attribute:9 relatedBy:0 toItem:v106 attribute:9 multiplier:1.0 constant:0.0];
    [v104 addConstraint:v107];

    v108 = [(UnexpectedTouchViewController *)self progressView];
    v109 = [(UnexpectedTouchViewController *)self progressView];
    v110 = +[NSLayoutConstraint constraintWithItem:v109 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:280.0];
    [v108 addConstraint:v110];

    v111 = [(UnexpectedTouchViewController *)self progressView];
    v112 = [(UnexpectedTouchViewController *)self progressBar];
    v113 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v114 = +[NSLayoutConstraint constraintWithItem:v112 attribute:3 relatedBy:0 toItem:v113 attribute:4 multiplier:1.0 constant:15.0];
    [v111 addConstraint:v114];

    v115 = [(UnexpectedTouchViewController *)self progressView];
    v116 = [(UnexpectedTouchViewController *)self progressView];
    v117 = [(UnexpectedTouchViewController *)self progressBar];
    v118 = +[NSLayoutConstraint constraintWithItem:v116 attribute:9 relatedBy:0 toItem:v117 attribute:9 multiplier:1.0 constant:0.0];
    [v115 addConstraint:v118];

    v119 = [(UnexpectedTouchViewController *)self progressView];
    v120 = [(UnexpectedTouchViewController *)self progressLabel];
    v121 = [(UnexpectedTouchViewController *)self progressView];
    v122 = +[NSLayoutConstraint constraintWithItem:v120 attribute:5 relatedBy:0 toItem:v121 attribute:5 multiplier:1.0 constant:20.0];
    [v119 addConstraint:v122];

    v123 = [(UnexpectedTouchViewController *)self progressView];
    v124 = [(UnexpectedTouchViewController *)self progressView];
    v125 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v126 = +[NSLayoutConstraint constraintWithItem:v124 attribute:6 relatedBy:0 toItem:v125 attribute:6 multiplier:1.0 constant:20.0];
    [v123 addConstraint:v126];

    v127 = [(UnexpectedTouchViewController *)self progressView];
    v128 = [(UnexpectedTouchViewController *)self progressView];
    v129 = [(UnexpectedTouchViewController *)self progressLabel];
    v130 = +[NSLayoutConstraint constraintWithItem:v128 attribute:6 relatedBy:0 toItem:v129 attribute:6 multiplier:1.0 constant:20.0];
    [v127 addConstraint:v130];

    v131 = [(UnexpectedTouchViewController *)self progressView];
    v132 = [(UnexpectedTouchViewController *)self progressLabel];
    v133 = [(UnexpectedTouchViewController *)self progressBar];
    v134 = +[NSLayoutConstraint constraintWithItem:v132 attribute:3 relatedBy:0 toItem:v133 attribute:4 multiplier:1.0 constant:16.0];
    [v131 addConstraint:v134];

    v135 = [(UnexpectedTouchViewController *)self progressView];
    v136 = [(UnexpectedTouchViewController *)self doNotDisturbLabel];
    v137 = [(UnexpectedTouchViewController *)self progressView];
    v138 = +[NSLayoutConstraint constraintWithItem:v136 attribute:3 relatedBy:0 toItem:v137 attribute:3 multiplier:1.0 constant:15.0];
    [v135 addConstraint:v138];

    v139 = [(UnexpectedTouchViewController *)self progressView];
    v140 = [(UnexpectedTouchViewController *)self progressView];
    v141 = [(UnexpectedTouchViewController *)self progressBar];
    v142 = +[NSLayoutConstraint constraintWithItem:v140 attribute:10 relatedBy:0 toItem:v141 attribute:10 multiplier:1.0 constant:-21.0];
    [v139 addConstraint:v142];

    v143 = [(UnexpectedTouchViewController *)self progressView];
    v144 = [(UnexpectedTouchViewController *)self progressView];
    v145 = [(UnexpectedTouchViewController *)self progressLabel];
    v146 = +[NSLayoutConstraint constraintWithItem:v144 attribute:4 relatedBy:0 toItem:v145 attribute:4 multiplier:1.0 constant:16.0];
    [v143 addConstraint:v146];

    v147 = [(UnexpectedTouchViewController *)self view];
    v148 = [(UnexpectedTouchViewController *)self progressView];
    v149 = [(UnexpectedTouchViewController *)self view];
    v150 = +[NSLayoutConstraint constraintWithItem:v148 attribute:9 relatedBy:0 toItem:v149 attribute:9 multiplier:1.0 constant:0.0];
    [v147 addConstraint:v150];

    v75 = [(UnexpectedTouchViewController *)self view];
    v76 = [(UnexpectedTouchViewController *)self progressView];
    v77 = [(UnexpectedTouchViewController *)self view];
    double v78 = 1.0;
    double v79 = 0.0;
    v80 = v76;
    uint64_t v81 = 10;
    v82 = v77;
    uint64_t v83 = 10;
  }
  v151 = +[NSLayoutConstraint constraintWithItem:v80 attribute:v81 relatedBy:0 toItem:v82 attribute:v83 multiplier:v78 constant:v79];
  [v75 addConstraint:v151];
}

- (void)updateTimer:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000040A0;
  v4[3] = &unk_100008298;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000414C;
  v3[3] = &unk_1000082C0;
  v3[4] = self;
  +[UIView animateWithDuration:v4 animations:v3 completion:1.0];
}

- (void)cleanUp
{
  v3 = [(UnexpectedTouchViewController *)self progressTimer];

  if (v3)
  {
    unint64_t v4 = [(UnexpectedTouchViewController *)self progressTimer];
    [v4 invalidate];

    [(UnexpectedTouchViewController *)self setProgressTimer:0];
  }
  id v5 = [(UnexpectedTouchViewController *)self inputs];
  unsigned int v6 = [v5 connectedToPowerRequired];

  if (v6)
  {
    double v7 = [(UnexpectedTouchViewController *)self device];
    [v7 setBatteryMonitoringEnabled:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self];
  }
}

- (void)endTest
{
  [(UnexpectedTouchViewController *)self cleanUp];
  v3 = [(UnexpectedTouchViewController *)self hitPixels];
  id v4 = [v3 count];

  id v5 = [(UnexpectedTouchViewController *)self result];
  unsigned int v6 = v5;
  if (v4) {
    double v7 = &off_1000087C0;
  }
  else {
    double v7 = &off_1000087D8;
  }
  [v5 setStatusCode:v7];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v38 = self;
  id obj = [(UnexpectedTouchViewController *)self hitPixels];
  id v39 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v39)
  {
    int v8 = 0;
    uint64_t v37 = *(void *)v48;
    do
    {
      v9 = 0;
      uint64_t v41 = v8;
      do
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v9);
        double v43 = [(UnexpectedTouchViewController *)v38 allResults];
        v53[0] = @"xPos";
        [v10 frame];
        double v45 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v54[0] = v45;
        v53[1] = @"yPos";
        [v10 frame];
        uint64_t v12 = +[NSNumber numberWithDouble:v11];
        v54[1] = v12;
        v53[2] = @"width";
        [v10 bounds];
        v14 = +[NSNumber numberWithDouble:v13];
        v54[2] = v14;
        v53[3] = @"height";
        [v10 bounds];
        double v16 = +[NSNumber numberWithDouble:v15];
        v54[3] = v16;
        v53[4] = @"timestamp";
        double v17 = [(UnexpectedTouchViewController *)v38 hitPixelTimes];
        double v18 = [v17 objectAtIndexedSubscript:(char *)v9 + v41];
        v54[4] = v18;
        v53[5] = @"touchEvent";
        double v19 = [(UnexpectedTouchViewController *)v38 touchEvents];
        double v20 = [v19 objectAtIndexedSubscript:(char *)v9 + v41];
        v54[5] = v20;
        double v21 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:6];
        [v43 addObject:v21];

        v9 = (char *)v9 + 1;
      }
      while (v39 != v9);
      id v22 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      int v8 = v41 + v9;
      id v39 = v22;
    }
    while (v22);
  }

  v51[0] = @"displayResX";
  v46 = +[UIScreen mainScreen];
  [v46 bounds];
  v44 = +[NSNumber numberWithDouble:v23];
  v52[0] = v44;
  v51[1] = @"displayResY";
  v42 = +[UIScreen mainScreen];
  [v42 bounds];
  v40 = +[NSNumber numberWithDouble:v24];
  v52[1] = v40;
  v51[2] = @"touchesFound";
  v25 = [(UnexpectedTouchViewController *)v38 allResults];
  v52[2] = v25;
  v51[3] = @"isCharging";
  id v26 = objc_alloc((Class)NSNumber);
  v27 = [(UnexpectedTouchViewController *)v38 multiTouchHelper];
  id v28 = [v26 initWithBool:[v27 isBatteryCharging]];
  v52[3] = v28;
  v51[4] = @"isPluggedIntoPower";
  id v29 = objc_alloc((Class)NSNumber);
  double v30 = [(UnexpectedTouchViewController *)v38 multiTouchHelper];
  id v31 = [v29 initWithBool:[v30 isPowerConnected]];
  v52[4] = v31;
  v51[5] = @"temperatureData";
  v32 = [(UnexpectedTouchViewController *)v38 multiTouchHelper];
  v33 = [v32 temperatureData];
  v52[5] = v33;
  v34 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
  v35 = [(UnexpectedTouchViewController *)v38 result];
  [v35 setData:v34];

  [(UnexpectedTouchViewController *)v38 setFinished:1];
}

- (void)testFailedToExecuteWithStatusCode:(id)a3
{
  id v4 = a3;
  [(UnexpectedTouchViewController *)self cleanUp];
  id v5 = [(UnexpectedTouchViewController *)self result];
  [v5 setStatusCode:v4];

  unsigned int v6 = [(UnexpectedTouchViewController *)self result];
  [v6 setData:&__NSDictionary0__struct];

  [(UnexpectedTouchViewController *)self setFinished:1];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(UnexpectedTouchViewController *)self view];
  double v7 = [v5 anyObject];

  int v8 = [(UnexpectedTouchViewController *)self view];
  [v7 locationInView:v8];
  [v6 hitTest:0];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v10)
  {
    [(UnexpectedTouchViewController *)self highlightView:v10 touchEvent:@"touchesBegan"];
    v9 = v10;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(UnexpectedTouchViewController *)self view];
  double v7 = [v5 anyObject];

  int v8 = [(UnexpectedTouchViewController *)self view];
  [v7 locationInView:v8];
  [v6 hitTest:0];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v10)
  {
    [(UnexpectedTouchViewController *)self highlightView:v10 touchEvent:@"touchesMoved"];
    v9 = v10;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(UnexpectedTouchViewController *)self view];
  double v7 = [v5 anyObject];

  int v8 = [(UnexpectedTouchViewController *)self view];
  [v7 locationInView:v8];
  [v6 hitTest:0];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v10)
  {
    [(UnexpectedTouchViewController *)self highlightView:v10 touchEvent:@"touchesEnded"];
    v9 = v10;
  }
}

- (void)highlightView:(id)a3 touchEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UnexpectedTouchViewController *)self inputs];
  v9 = [v8 touchColor];
  [v6 setBackgroundColor:v9];

  id v10 = [(UnexpectedTouchViewController *)self hitPixels];
  [v10 addObject:v6];

  double v11 = +[NSDate date];
  [v11 timeIntervalSince1970];
  double v13 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v12 * 1000.0)];

  v14 = [(UnexpectedTouchViewController *)self hitPixelTimes];
  [v14 addObject:v13];

  double v15 = [(UnexpectedTouchViewController *)self touchEvents];
  [v15 addObject:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004D98;
  v17[3] = &unk_1000082E8;
  id v18 = v6;
  double v19 = self;
  id v16 = v6;
  +[UIView animateWithDuration:131074 delay:v17 options:0 animations:2.0 completion:0.5];
}

- (void)batteryStateChanged
{
  v3 = [(UnexpectedTouchViewController *)self device];
  if ([v3 batteryState] == (id)1)
  {
  }
  else
  {
    id v4 = [(UnexpectedTouchViewController *)self device];
    id v5 = [v4 batteryState];

    if (v5) {
      return;
    }
  }

  [(UnexpectedTouchViewController *)self testFailedToExecuteWithStatusCode:&off_1000087A8];
}

- (id)localizedTimeRemaining:(int)a3
{
  if (!qword_10000D158)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)qword_10000D158;
    qword_10000D158 = v4;

    [(id)qword_10000D158 setUnitsStyle:3];
    [(id)qword_10000D158 setAllowedUnits:64];
    [(id)qword_10000D158 setFormattingContext:5];
    [(id)qword_10000D158 setMaximumUnitCount:1];
  }
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"ABOUT_REMAINING" value:&stru_1000086A8 table:0];
  int v8 = [(id)qword_10000D158 stringFromTimeInterval:(float)((float)a3 * 60.0)];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  return v9;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
}

- (UILabel)doNotDisturbLabel
{
  return self->_doNotDisturbLabel;
}

- (void)setDoNotDisturbLabel:(id)a3
{
}

- (NSTimer)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
}

- (NSMutableArray)hitPixels
{
  return self->_hitPixels;
}

- (void)setHitPixels:(id)a3
{
}

- (NSMutableArray)hitPixelTimes
{
  return self->_hitPixelTimes;
}

- (void)setHitPixelTimes:(id)a3
{
}

- (NSMutableArray)touchEvents
{
  return self->_touchEvents;
}

- (void)setTouchEvents:(id)a3
{
}

- (int)secondsTicked
{
  return self->_secondsTicked;
}

- (void)setSecondsTicked:(int)a3
{
  self->_secondsTicked = a3;
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (UIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (MultiTouchHelper)multiTouchHelper
{
  return self->_multiTouchHelper;
}

- (void)setMultiTouchHelper:(id)a3
{
}

- (UnexpectedTouchInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_multiTouchHelper, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_touchEvents, 0);
  objc_storeStrong((id *)&self->_hitPixelTimes, 0);
  objc_storeStrong((id *)&self->_hitPixels, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_doNotDisturbLabel, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end