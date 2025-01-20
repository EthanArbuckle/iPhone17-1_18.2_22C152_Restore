@interface TVLatencyColorimeterSetupProgressViewController
- (void)_handleDismissButton;
- (void)_prepareTrainingAnimation;
- (void)handleProgressEvent:(unsigned int)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencyColorimeterSetupProgressViewController

- (void)_prepareTrainingAnimation
{
  [(UIView *)self->super._animationContainerView setBackgroundColor:0];
  [(UIView *)self->super._animationContainerView setClipsToBounds:1];
  trainingView = self->super._trainingView;
  if (!trainingView)
  {
    v4 = [TVLatencyColorimeterTrainingView alloc];
    [(UIView *)self->super._animationContainerView bounds];
    v5 = -[TVLatencyColorimeterTrainingView initWithFrame:](v4, "initWithFrame:");
    v6 = self->super._trainingView;
    self->super._trainingView = v5;

    CGAffineTransformMakeScale(&v9, 0.609756098, 0.609756098);
    v7 = self->super._trainingView;
    CGAffineTransform v8 = v9;
    [(TVLatencyColorimeterTrainingView *)v7 setTransform:&v8];
    [(TVLatencyColorimeterTrainingView *)self->super._trainingView setUserInteractionEnabled:0];
    [(UIView *)self->super._animationContainerView addSubview:self->super._trainingView];
    trainingView = self->super._trainingView;
  }
  [(TVLatencyColorimeterTrainingView *)trainingView setInitialState];
  [(TVLatencyColorimeterTrainingView *)self->super._trainingView setStateName:@"State01_TVIcon"];
}

- (void)handleProgressEvent:(unsigned int)a3
{
  if (a3 == 278)
  {
    v5 = +[NSBundle mainBundle];
    v6 = sub_100138304(v5, @"Localizable-TVLatencyColorimeter", @"TVL_COLOR_TURN_PHONE_TITLE");
    [(TVLatencyColorimeterSetupProgressViewController *)self setTitle:v6];

    v7 = +[NSBundle mainBundle];
    CGAffineTransform v8 = sub_100138304(v7, @"Localizable-TVLatencyColorimeter", @"TVL_COLOR_TURN_PHONE_SUBTITLE");
    [(TVLatencyColorimeterSetupProgressViewController *)self setSubtitle:v8];

    trainingView = self->super._trainingView;
    [(TVLatencyColorimeterTrainingView *)trainingView animateToStateName:@"State03_Phone_Animation_Loop" completionHandler:&stru_1001A1040];
  }
}

- (void)_handleDismissButton
{
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = [(TVLatencyColorimeterSetupBaseViewController *)self mainController];
  [v3 dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupProgressViewController;
  [(TVLatencyColorimeterSetupProgressViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v9.receiver = self;
  v9.super_class = (Class)TVLatencyColorimeterSetupProgressViewController;
  [(TVLatencyColorimeterSetupProgressViewController *)&v9 viewWillAppear:v3];
  [(TVLatencyColorimeterSetupProgressViewController *)self _prepareTrainingAnimation];
  [(TVLatencyColorimeterTrainingView *)self->super._trainingView animateToStateName:@"State02_Phone_Animation_In" completionHandler:&stru_1001A1020];
  objc_super v5 = [(TVLatencyColorimeterSetupBaseViewController *)self mainController];
  id v6 = [v5 testFlags];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011446C;
    block[3] = &unk_1001A1BD8;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)TVLatencyColorimeterSetupProgressViewController;
  [(TVLatencyColorimeterSetupProgressViewController *)&v33 viewDidLoad];
  [(TVLatencyColorimeterSetupProgressViewController *)self setDismissalType:1];
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"CANCEL" value:&stru_1001A1DC0 table:@"Localizable"];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100114944;
  v30[3] = &unk_1001A19A0;
  objc_copyWeak(&v31, &location);
  v28 = +[PRXAction actionWithTitle:v4 style:1 handler:v30];

  id v5 = [(TVLatencyColorimeterSetupProgressViewController *)self addAction:v28];
  id v6 = +[NSBundle mainBundle];
  dispatch_time_t v7 = sub_100138304(v6, @"Localizable-TVLatencyColorimeter", @"TVL_COLOR_TURN_PHONE_TITLE");
  [(TVLatencyColorimeterSetupProgressViewController *)self setTitle:v7];

  CGAffineTransform v8 = +[NSBundle mainBundle];
  objc_super v9 = sub_100138304(v8, @"Localizable-TVLatencyColorimeter", @"TVL_COLOR_TURN_PHONE_SUBTITLE");
  [(TVLatencyColorimeterSetupProgressViewController *)self setSubtitle:v9];

  v10 = [(TVLatencyColorimeterSetupProgressViewController *)self contentView];
  v29 = [v10 mainContentGuide];

  v11 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  animationContainerView = self->super._animationContainerView;
  self->super._animationContainerView = v11;

  [(UIView *)self->super._animationContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(TVLatencyColorimeterSetupProgressViewController *)self contentView];
  [v13 addSubview:self->super._animationContainerView];

  v27 = [(UIView *)self->super._animationContainerView topAnchor];
  v26 = [v29 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v34[0] = v25;
  v24 = [(UIView *)self->super._animationContainerView bottomAnchor];
  v14 = [v29 bottomAnchor];
  v15 = [v24 constraintLessThanOrEqualToAnchor:v14];
  v34[1] = v15;
  v16 = [(UIView *)self->super._animationContainerView centerXAnchor];
  v17 = [v29 centerXAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v34[2] = v18;
  v19 = [(UIView *)self->super._animationContainerView heightAnchor];
  v20 = [v19 constraintEqualToConstant:150.0];
  v34[3] = v20;
  v21 = [(UIView *)self->super._animationContainerView widthAnchor];
  v22 = [v21 constraintEqualToConstant:262.0];
  v34[4] = v22;
  v23 = +[NSArray arrayWithObjects:v34 count:5];
  +[NSLayoutConstraint activateConstraints:v23];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

@end