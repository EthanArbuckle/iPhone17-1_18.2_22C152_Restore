@interface WFApertureStatusViewController
+ (id)requestIdentifierForContext:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)initialPresentationTransitioning;
- (BOOL)providesHostedContent;
- (NSDictionary)postOptions;
- (NSNumberFormatter)percentageFormatter;
- (NSProgress)progress;
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (NSTimer)collapseTimer;
- (UIColor)keyColor;
- (UILabel)titleLabel;
- (WFApertureIconAccessoryView)iconView;
- (WFApertureStatusViewController)initWithRunningContext:(id)a3 attribution:(id)a4;
- (WFApertureStatusViewController)initWithRunningContext:(id)a3 attribution:(id)a4 progress:(id)a5;
- (WFApertureStatusViewControllerDelegate)delegate;
- (WFDialogAttribution)attribution;
- (WFDialogAttribution)pendingDelayedAttribution;
- (WFProgressAccessoryView)progressView;
- (WFWorkflowRunningContext)associatedRunningContext;
- (WFWorkflowRunningContext)runningContext;
- (double)preferredHeightForBottomSafeArea;
- (id)titleFont;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)minimumLayoutMode;
- (int64_t)overrideLayoutMode;
- (int64_t)preferredLayoutMode;
- (int64_t)preferredLayoutModeForRunningContext:(id)a3;
- (int64_t)previousLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedRunningContext:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setCollapseTimer:(id)a3;
- (void)setCompletingSuccessfully:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialPresentationTransitioning:(BOOL)a3;
- (void)setOverrideLayoutMode:(int64_t)a3;
- (void)setPendingDelayedAttribution:(id)a3;
- (void)setPreviousLayoutMode:(int64_t)a3;
- (void)setProgress:(id)a3;
- (void)startCollapseTimerIfNecessary;
- (void)viewWillLayoutSubviews;
@end

@implementation WFApertureStatusViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDelayedAttribution, 0);
  objc_storeStrong((id *)&self->_collapseTimer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_associatedRunningContext, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

- (void)setPendingDelayedAttribution:(id)a3
{
}

- (WFDialogAttribution)pendingDelayedAttribution
{
  return self->_pendingDelayedAttribution;
}

- (void)setInitialPresentationTransitioning:(BOOL)a3
{
  self->_initialPresentationTransitioning = a3;
}

- (BOOL)initialPresentationTransitioning
{
  return self->_initialPresentationTransitioning;
}

- (void)setOverrideLayoutMode:(int64_t)a3
{
  self->_overrideLayoutMode = a3;
}

- (int64_t)overrideLayoutMode
{
  return self->_overrideLayoutMode;
}

- (void)setPreviousLayoutMode:(int64_t)a3
{
  self->_previousLayoutMode = a3;
}

- (int64_t)previousLayoutMode
{
  return self->_previousLayoutMode;
}

- (void)setCollapseTimer:(id)a3
{
}

- (NSTimer)collapseTimer
{
  return self->_collapseTimer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)setDelegate:(id)a3
{
}

- (WFApertureStatusViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WFApertureStatusViewControllerDelegate *)WeakRetained;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setAssociatedRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)associatedRunningContext
{
  return self->_associatedRunningContext;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (int64_t)minimumLayoutMode
{
  return self->_minimumLayoutMode;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (NSString)requesterIdentifier
{
  return (NSString *)_WFBannerRequesterIdentifier(self, a2);
}

- (NSString)requestIdentifier
{
  v3 = objc_opt_class();
  v4 = [(WFApertureStatusViewController *)self runningContext];
  v5 = [v3 requestIdentifierForContext:v4];

  return (NSString *)v5;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (unint64_t)presentationBehaviors
{
  return 4120;
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)VCBundleIdentifierShortcutsiOS;
}

- (UIColor)keyColor
{
  v2 = [(WFApertureStatusViewController *)self iconView];
  v3 = [v2 primaryColor];

  return (UIColor *)v3;
}

- (double)preferredHeightForBottomSafeArea
{
  return 47.0;
}

- (int64_t)preferredLayoutMode
{
  if ([(WFApertureStatusViewController *)self overrideLayoutMode])
  {
    return [(WFApertureStatusViewController *)self overrideLayoutMode];
  }
  else
  {
    v4 = [(WFApertureStatusViewController *)self runningContext];
    int64_t v5 = [(WFApertureStatusViewController *)self preferredLayoutModeForRunningContext:v4];

    return v5;
  }
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)contentRole
{
  return 2;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->_previousLayoutMode = self->_activeLayoutMode;
  self->_activeLayoutMode = a3;
  int64_t v5 = [(WFApertureStatusViewController *)self progressView];
  [v5 setActiveLayoutMode:a3];

  if (a3 == 4)
  {
    v6 = [(WFApertureStatusViewController *)self view];
    v7 = [v6 subviews];
    v8 = [(WFApertureStatusViewController *)self iconView];
    if ([v7 containsObject:v8])
    {
      v9 = [(WFApertureStatusViewController *)self view];
      v10 = [v9 subviews];
      v11 = [(WFApertureStatusViewController *)self progressView];
      unsigned __int8 v12 = [v10 containsObject:v11];

      if (v12) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v13 = [(WFApertureStatusViewController *)self view];
    v14 = [(WFApertureStatusViewController *)self iconView];
    [v13 addSubview:v14];

    v15 = [(WFApertureStatusViewController *)self view];
    v16 = [(WFApertureStatusViewController *)self progressView];
    [v15 addSubview:v16];
  }
LABEL_7:
  BOOL v17 = (id)[(WFApertureStatusViewController *)self previousLayoutMode] == (id)3
     || (id)[(WFApertureStatusViewController *)self previousLayoutMode] == (id)3
     || (id)[(WFApertureStatusViewController *)self previousLayoutMode] == (id)2;
  if (a3 == 4 && v17)
  {
    v18 = [(WFApertureStatusViewController *)self collapseTimer];
    [v18 invalidate];

    [(WFApertureStatusViewController *)self setCollapseTimer:0];
    v19 = [(WFApertureStatusViewController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      v21 = [(WFApertureStatusViewController *)self delegate];
      [v21 statusViewControllerDidTransitionFromVisibleToCustomLayout:self];
    }
  }
  int64_t v22 = [(WFApertureStatusViewController *)self previousLayoutMode];
  if (a3 != 4 && v22 == 4)
  {
    v23 = [(WFApertureStatusViewController *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v25 = [(WFApertureStatusViewController *)self delegate];
      [v25 statusViewControllerDidCollapseFromCustomLayout:self];
    }
  }
}

- (NSString)elementIdentifier
{
  v2 = [(WFApertureStatusViewController *)self runningContext];
  v3 = WFApertureStatusViewControllerIdentityFromRunningContext();

  return (NSString *)v3;
}

- (int64_t)preferredLayoutModeForRunningContext:(id)a3
{
  return 3;
}

- (void)setAttribution:(id)a3
{
  id v11 = a3;
  if ([(WFApertureStatusViewController *)self initialPresentationTransitioning])
  {
    [(WFApertureStatusViewController *)self setPendingDelayedAttribution:v11];
  }
  else
  {
    objc_storeStrong((id *)&self->_attribution, a3);
    int64_t v5 = [(WFApertureStatusViewController *)self iconView];
    v6 = [v11 icon];
    v7 = [v11 appBundleIdentifier];
    [v5 setIcon:v6 associatedAppBundleIdentifier:v7 animated:1];

    v8 = [(WFApertureStatusViewController *)self progressView];
    v9 = [(WFApertureStatusViewController *)self iconView];
    v10 = [v9 primaryColor];
    [v8 tintControlWithColor:v10 animated:1];
  }
}

- (void)startCollapseTimerIfNecessary
{
  v3 = [(WFApertureStatusViewController *)self collapseTimer];

  if (!v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000081A4;
    v5[3] = &unk_100010588;
    v5[4] = self;
    v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v5 block:2.5];
    [(WFApertureStatusViewController *)self setCollapseTimer:v4];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100017128 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000082A4;
    block[3] = &unk_1000105B0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setProgress:(id)a3
{
  int64_t v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    v7 = progress;
    v8 = v7;
    if (v7)
    {
      [(NSProgress *)v7 removeObserver:self forKeyPath:@"fractionCompleted"];
      v9 = [(WFApertureStatusViewController *)self progressView];
      [v9 setCancelAction:0];
    }
    objc_storeStrong((id *)&self->_progress, a3);
    if (v5)
    {
      [(NSProgress *)v5 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:off_100017128];
      v10 = [(WFApertureStatusViewController *)self progressView];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100008474;
      v12[3] = &unk_100010560;
      v13 = v5;
      id v11 = +[UIAction actionWithHandler:v12];
      [v10 setCancelAction:v11];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)WFApertureStatusViewController;
  [(WFApertureStatusViewController *)&v36 viewWillLayoutSubviews];
  int64_t v3 = [(WFApertureStatusViewController *)self activeLayoutMode];
  v4 = [(WFApertureStatusViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  v9 = [(WFApertureStatusViewController *)self view];
  v10 = [v9 SBUISA_systemApertureObstructedAreaLayoutGuide];
  [v10 layoutFrame];
  double v12 = v11;

  v13 = [(WFApertureStatusViewController *)self trailingView];
  v14 = v13;
  double v15 = 50.0;
  if (v3 != 4) {
    double v15 = 24.0;
  }
  double v16 = (v8 - v15) * 0.5;
  if (v3 == 4)
  {
    [v13 setFrame:CGRectMake(v6 + -50.0 + -17.0, v16, 50.0, 50.0)];

    BOOL v17 = [(WFApertureStatusViewController *)self leadingView];
    [v17 setFrame:CGRectMake(v16, 50.0, 50.0)];

    v18 = [(WFApertureStatusViewController *)self leadingView];
    [v18 frame];
    double v19 = CGRectGetMaxX(v37) + 14.0;

    double v20 = v12 + -4.0;
    v21 = [(WFApertureStatusViewController *)self titleLabel];
    [v21 intrinsicContentSize];
    double v23 = v22;

    char v24 = [(WFApertureStatusViewController *)self trailingView];
    [v24 frame];
    double v26 = v25 - v19 + -6.0;

    if (v23 >= v26) {
      double v23 = v26;
    }
    v27 = [(WFApertureStatusViewController *)self titleLabel];
    [v27 intrinsicContentSize];
    double v29 = v28;

    v30 = [(WFApertureStatusViewController *)self titleLabel];
    v31 = v30;
    double v32 = v19;
    double v35 = v20;
    double v33 = v23;
    double v34 = v29;
  }
  else
  {
    [v13 setFrame:CGRectMake(v6 + -7.0 + -24.0, v16, 24.0, 24.0)];

    v30 = [(WFApertureStatusViewController *)self leadingView];
    v31 = v30;
    double v32 = 7.0;
    double v33 = 24.0;
    double v34 = 24.0;
    double v35 = v16;
  }
  [v30 setFrame:v32, v35, v33, v34];
}

- (WFProgressAccessoryView)progressView
{
  progressView = self->_progressView;
  if (!progressView)
  {
    v4 = [WFProgressAccessoryView alloc];
    double v5 = [(WFApertureStatusViewController *)self iconView];
    double v6 = [v5 primaryColor];
    double v7 = [(WFApertureStatusViewController *)self runningContext];
    double v8 = [(WFProgressAccessoryView *)v4 initWithTintColor:v6 runningContext:v7];
    v9 = self->_progressView;
    self->_progressView = v8;

    progressView = self->_progressView;
  }

  return progressView;
}

- (WFApertureIconAccessoryView)iconView
{
  iconView = self->_iconView;
  if (!iconView)
  {
    v4 = [WFApertureIconAccessoryView alloc];
    double v5 = [(WFApertureStatusViewController *)self attribution];
    double v6 = [v5 icon];
    double v7 = [(WFApertureStatusViewController *)self runningContext];
    double v8 = [(WFApertureIconAccessoryView *)v4 initWithIcon:v6 runningContext:v7];
    v9 = self->_iconView;
    self->_iconView = v8;

    iconView = self->_iconView;
  }

  return iconView;
}

- (NSDictionary)postOptions
{
  uint64_t v4 = kSBUIPresentableSystemApertureSupportingUserInfoKey;
  double v5 = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

- (id)titleFont
{
  return +[UIFont sbui_systemAperturePreferredFontForTextStyle:0];
}

- (void)setCompletingSuccessfully:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(WFApertureStatusViewController *)self progressView];
    [v3 updateProgressWithValue:1.0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"fractionCompleted" context:off_100017128];
  v3.receiver = self;
  v3.super_class = (Class)WFApertureStatusViewController;
  [(WFApertureStatusViewController *)&v3 dealloc];
}

- (WFApertureStatusViewController)initWithRunningContext:(id)a3 attribution:(id)a4 progress:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    double v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFApertureStatusViewController.m", 62, @"Invalid parameter not satisfying: %@", @"runningContext" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v27 = +[NSAssertionHandler currentHandler];
  [v27 handleFailureInMethod:a2, self, @"WFApertureStatusViewController.m", 63, @"Invalid parameter not satisfying: %@", @"attribution" object file lineNumber description];

LABEL_3:
  v30.receiver = self;
  v30.super_class = (Class)WFApertureStatusViewController;
  v13 = [(WFApertureStatusViewController *)&v30 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    v13->_overrideLayoutMode = 0;
    v13->_previousLayoutMode = 0;
    objc_storeStrong((id *)&v13->_attribution, a4);
    objc_storeStrong((id *)&v14->_runningContext, a3);
    double v15 = (UILabel *)objc_alloc_init((Class)UILabel);
    double v16 = [(WFApertureStatusViewController *)v14 titleFont];
    [(UILabel *)v15 setFont:v16];

    BOOL v17 = [v11 title];
    [(UILabel *)v15 setText:v17];

    [(UILabel *)v15 setNumberOfLines:1];
    v18 = +[UIColor systemWhiteColor];
    [(UILabel *)v15 setTextColor:v18];

    double v19 = [(WFApertureStatusViewController *)v14 view];
    [v19 addSubview:v15];

    titleLabel = v14->_titleLabel;
    v14->_titleLabel = v15;
    v21 = v15;

    [(WFApertureStatusViewController *)v14 setAssociatedRunningContext:v10];
    [(WFApertureStatusViewController *)v14 startCollapseTimerIfNecessary];
    [(WFApertureStatusViewController *)v14 setProgress:v12];
    v14->_initialPresentationTransitioning = 1;
    dispatch_time_t v22 = dispatch_time(0, 600000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008C80;
    block[3] = &unk_1000105B0;
    double v23 = v14;
    double v29 = v23;
    dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
    char v24 = v23;
  }
  return v14;
}

- (WFApertureStatusViewController)initWithRunningContext:(id)a3 attribution:(id)a4
{
  return [(WFApertureStatusViewController *)self initWithRunningContext:a3 attribution:a4 progress:0];
}

+ (id)requestIdentifierForContext:(id)a3
{
  return (id)WFApertureStatusViewControllerIdentityFromRunningContext();
}

@end