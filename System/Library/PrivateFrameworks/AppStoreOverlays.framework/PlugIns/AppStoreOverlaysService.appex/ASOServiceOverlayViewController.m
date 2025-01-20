@interface ASOServiceOverlayViewController
+ (id)log;
- (ASORateLimiter)rateLimiter;
- (ASOServiceOverlayContainerConfiguration)containerConfiguration;
- (ASOServiceOverlayPresenter)currentOverlayPresenter;
- (ASOServicePresentationQueue)serviceQueue;
- (CGPoint)edgePointForPercentage:(double)a3;
- (CGRect)overlayFrameForEdgePoint:(CGPoint)a3;
- (UIGestureRecognizer)panGestureRecognizer;
- (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView)overlayContainer;
- (double)interactiveDismissStartPercentage;
- (double)overlayHeight;
- (double)percentageForEdgePoint:(CGPoint)a3;
- (double)percentageOnScreen;
- (id)dismissOverlayAnimated:(BOOL)a3;
- (id)hideOverlayAnimated:(BOOL)a3;
- (id)presentOverlayPresenter:(id)a3 animated:(BOOL)a4;
- (id)presentationQueue:(id)a3 presentOverlayWithConfiguration:(id)a4 delegate:(id)a5;
- (id)presentationQueueDismissOverlay:(id)a3;
- (id)showOverlayAnimated:(BOOL)a3;
- (void)hostDidEnterBackground;
- (void)hostWillEnterForeground;
- (void)interactiveDismissGesture:(id)a3;
- (void)loadView;
- (void)refreshOverlayFrame;
- (void)reloadAXSize;
- (void)reloadContainerConfiguration;
- (void)serviceContext:(id)a3 presentOverlayWithConfiguration:(id)a4 delegate:(id)a5;
- (void)serviceContextDismissOverlay:(id)a3;
- (void)setContainerConfiguration:(id)a3;
- (void)setCurrentOverlayPresenter:(id)a3;
- (void)setInteractiveDismissStartPercentage:(double)a3;
- (void)setOverlayContainer:(id)a3;
- (void)setOverlayHeight:(double)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPercentageOnScreen:(double)a3;
- (void)setPercentageOnScreen:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setRateLimiter:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)updateRateLimiterConstantsIfNeeded;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ASOServiceOverlayViewController

+ (id)log
{
  if (qword_10002CB40 != -1) {
    dispatch_once(&qword_10002CB40, &stru_100025078);
  }
  v2 = (void *)qword_10002CB48;

  return v2;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)ASOServiceOverlayViewController;
  [(ASOServiceOverlayViewController *)&v33 viewDidLoad];
  v3 = objc_alloc_init(ASOServicePresentationQueue);
  serviceQueue = self->_serviceQueue;
  self->_serviceQueue = v3;

  v5 = [(ASOServiceOverlayViewController *)self serviceQueue];
  [v5 setDelegate:self];

  v6 = [(ASOServiceOverlayViewController *)self extensionContext];
  [v6 setDelegate:self];

  v7 = +[ASCOverlaySettings sharedSettings];
  v8 = [v7 rateLimitRequestsPerSecond];

  v9 = &off_100025B68;
  if (v8) {
    v9 = v8;
  }
  v10 = v9;

  v11 = +[ASCOverlaySettings sharedSettings];
  v12 = [v11 rateLimitTimeWindow];

  v13 = &off_100025B78;
  if (v12) {
    v13 = v12;
  }
  v14 = v13;

  v15 = +[ASOServiceOverlayViewController log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v10;
    __int16 v37 = 2114;
    v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting up rate limiter. requestsPerSecond=%{public}@ timeWindow=%{public}@", buf, 0x16u);
  }

  v16 = [ASORateLimiter alloc];
  [v10 doubleValue];
  double v18 = v17;
  [v14 doubleValue];
  v20 = [(ASORateLimiter *)v16 initWithRequestsPerSecond:v18 timeWindow:v19];
  [(ASOServiceOverlayViewController *)self setRateLimiter:v20];

  [(ASOServiceOverlayViewController *)self setPercentageOnScreen:0.0];
  [(ASOServiceOverlayViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
  v21 = [(ASOServiceOverlayViewController *)self view];
  [v21 setInsetsLayoutMarginsFromSafeArea:1];

  v22 = objc_alloc_init(_TtC23AppStoreOverlaysService27ServiceOverlayContainerView);
  [(ASOServiceOverlayViewController *)self setOverlayContainer:v22];

  v23 = [(ASOServiceOverlayViewController *)self view];
  v24 = [(ASOServiceOverlayViewController *)self overlayContainer];
  [v23 addSubview:v24];

  id v25 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"interactiveDismissGesture:"];
  [(ASOServiceOverlayViewController *)self setPanGestureRecognizer:v25];

  v26 = [(ASOServiceOverlayViewController *)self view];
  v27 = [(ASOServiceOverlayViewController *)self panGestureRecognizer];
  [v26 addGestureRecognizer:v27];

  v28 = self;
  v34 = v28;
  v29 = +[NSArray arrayWithObjects:&v34 count:1];
  id v30 = [(ASOServiceOverlayViewController *)self registerForTraitChanges:v29 withAction:"reloadAXSize"];

  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"hostDidEnterBackground" name:NSExtensionHostDidEnterBackgroundNotification object:0];

  v32 = +[NSNotificationCenter defaultCenter];
  [v32 addObserver:self selector:"hostWillEnterForeground" name:NSExtensionHostWillEnterForegroundNotification object:0];
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(ASOServiceOverlayViewController *)self setView:v3];
}

- (void)setContainerConfiguration:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_containerConfiguration, a3);
  id v5 = [v14 userDismissible];
  v6 = [(ASOServiceOverlayViewController *)self panGestureRecognizer];
  [v6 setEnabled:v5];

  if ([v14 hostIdiom] == (id)6)
  {
    v7 = [(ASOServiceOverlayViewController *)self view];
    v8 = v7;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    id v12 = [v14 position];
    if (v12 == (id)1)
    {
      v7 = [(ASOServiceOverlayViewController *)self view];
      v8 = v7;
      double v10 = 75.0;
      double v9 = 15.0;
    }
    else
    {
      if (v12) {
        goto LABEL_9;
      }
      v7 = [(ASOServiceOverlayViewController *)self view];
      v8 = v7;
      double v9 = 15.0;
      double v10 = 20.0;
    }
    double v11 = 15.0;
  }
  objc_msgSend(v7, "setLayoutMargins:", 0.0, v9, v10, v11);

LABEL_9:
  v13 = [(ASOServiceOverlayViewController *)self view];
  [v13 setNeedsLayout];
}

- (void)reloadContainerConfiguration
{
  id v3 = [(ASOServiceOverlayViewController *)self currentOverlayPresenter];

  if (v3)
  {
    id v5 = [(ASOServiceOverlayViewController *)self currentOverlayPresenter];
    v4 = [v5 containerConfiguration];
    [(ASOServiceOverlayViewController *)self setContainerConfiguration:v4];
  }
}

- (id)presentOverlayPresenter:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ASOServiceOverlayViewController *)self updateRateLimiterConstantsIfNeeded];
  v7 = [(ASOServiceOverlayViewController *)self rateLimiter];
  unsigned __int8 v8 = [v7 recordAttempt];

  if (v8)
  {
    double v9 = [(ASOServiceOverlayViewController *)self dismissOverlayAnimated:v4];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009C74;
    v14[3] = &unk_100025118;
    v14[4] = self;
    id v15 = v6;
    BOOL v16 = v4;
    double v10 = [v9 thenWithBlock:v14];
  }
  else
  {
    double v11 = +[ASOServiceOverlayViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000182B4(v11);
    }

    double v9 = +[NSError errorWithDomain:@"ASOErrorDomain" code:5 userInfo:0];
    id v12 = +[ASCMetrics sharedMetrics];
    [v12 logErrorMessage:&off_100025B90];

    [v6 didFailToLoadWithError:v9];
    double v10 = +[AMSBinaryPromise promiseWithError:v9];
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASOServiceOverlayViewController;
  [(ASOServiceOverlayViewController *)&v4 viewWillAppear:a3];
  [(ASOServiceOverlayViewController *)self reloadAXSize];
}

- (id)dismissOverlayAnimated:(BOOL)a3
{
  objc_super v4 = [(ASOServiceOverlayViewController *)self hideOverlayAnimated:a3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A078;
  v7[3] = &unk_100025140;
  v7[4] = self;
  id v5 = [v4 thenWithBlock:v7];

  return v5;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ASOServiceOverlayViewController;
  [(ASOServiceOverlayViewController *)&v3 viewWillLayoutSubviews];
  [(ASOServiceOverlayViewController *)self refreshOverlayFrame];
}

- (double)overlayHeight
{
  objc_super v3 = [(ASOServiceOverlayViewController *)self overlayContainer];
  objc_super v4 = [(ASOServiceOverlayViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "sizeThatFits:", v5, v6);
  double v8 = v7;

  return v8;
}

- (void)refreshOverlayFrame
{
  objc_super v3 = [(ASOServiceOverlayViewController *)self containerConfiguration];
  id v4 = [v3 hostIdiom];

  if (v4 == (id)6)
  {
    [(ASOServiceOverlayViewController *)self edgePointForPercentage:1.0];
    -[ASOServiceOverlayViewController overlayFrameForEdgePoint:](self, "overlayFrameForEdgePoint:");
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(ASOServiceOverlayViewController *)self overlayContainer];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    [(ASOServiceOverlayViewController *)self percentageOnScreen];
    double v15 = v14;
    BOOL v16 = [(ASOServiceOverlayViewController *)self overlayContainer];
    [v16 setAlpha:v15];
  }
  else
  {
    [(ASOServiceOverlayViewController *)self percentageOnScreen];
    -[ASOServiceOverlayViewController edgePointForPercentage:](self, "edgePointForPercentage:");
    -[ASOServiceOverlayViewController overlayFrameForEdgePoint:](self, "overlayFrameForEdgePoint:");
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    BOOL v16 = [(ASOServiceOverlayViewController *)self overlayContainer];
    objc_msgSend(v16, "setFrame:", v18, v20, v22, v24);
  }

  id v25 = [(ASOServiceOverlayViewController *)self overlayContainer];
  [v25 setNeedsLayout];
}

- (void)setPercentageOnScreen:(double)a3
{
  self->_percentageOnScreen = a3;
  [(ASOServiceOverlayViewController *)self refreshOverlayFrame];
}

- (void)setPercentageOnScreen:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double v8 = (void (**)(id, uint64_t))a5;
  double v9 = [(ASOServiceOverlayViewController *)self view];
  [v9 layoutIfNeeded];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A3C4;
  v12[3] = &unk_100025168;
  v12[4] = self;
  *(double *)&v12[5] = a3;
  double v10 = objc_retainBlock(v12);
  double v11 = v10;
  if (v5)
  {
    +[ASOOverlayAnimator performAnimations:v10 completion:v8];
  }
  else
  {
    ((void (*)(void *))v10[2])(v10);
    if (v8) {
      v8[2](v8, 1);
    }
  }
}

- (void)reloadAXSize
{
  objc_super v3 = [(ASOServiceOverlayViewController *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  id v8 = [(ASOServiceOverlayViewController *)self view];
  double v6 = [v8 traitOverrides];
  if (IsAccessibilityCategory)
  {
    [v6 setPreferredContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  }
  else
  {
    double v7 = self;
    [v6 removeTrait:v7];
  }
}

- (void)interactiveDismissGesture:(id)a3
{
  id v22 = a3;
  id v4 = [(ASOServiceOverlayViewController *)self view];
  [v22 translationInView:v4];

  id v5 = [v22 state];
  if (v5 == (id)3)
  {
    [(ASOServiceOverlayViewController *)self percentageOnScreen];
    -[ASOServiceOverlayViewController edgePointForPercentage:](self, "edgePointForPercentage:");
    double v7 = v6;
    id v8 = [(ASOServiceOverlayViewController *)self view];
    [v22 velocityInView:v8];
    double v10 = v9;

    double v11 = [(ASOServiceOverlayViewController *)self view];
    [v11 safeAreaInsets];
    double v13 = v7 - v12;

    [(ASOServiceOverlayViewController *)self overlayHeight];
    if (v13 / v14 < 0.3 || v10 > 300.0) {
      id v21 = [(ASOServiceOverlayViewController *)self hideOverlayAnimated:1];
    }
    else {
      [(ASOServiceOverlayViewController *)self setPercentageOnScreen:1 animated:0 completion:1.0];
    }
  }
  else if (v5 == (id)2)
  {
    [(ASOServiceOverlayViewController *)self interactiveDismissStartPercentage];
    -[ASOServiceOverlayViewController edgePointForPercentage:](self, "edgePointForPercentage:");
    -[ASOServiceOverlayViewController percentageForEdgePoint:](self, "percentageForEdgePoint:");
    double v16 = v15;
    BSUIConstrainValueWithRubberBand();
    double v18 = v17 + 1.0;
    double v19 = 0.0;
    if (v16 >= 0.0) {
      double v19 = v16;
    }
    if (v17 <= 0.0) {
      double v20 = 1.0;
    }
    else {
      double v20 = v17 + 1.0;
    }
    if (v19 < v20) {
      double v20 = v19;
    }
    -[ASOServiceOverlayViewController setPercentageOnScreen:](self, "setPercentageOnScreen:", v20, v18);
  }
  else if (v5 == (id)1)
  {
    [(ASOServiceOverlayViewController *)self percentageOnScreen];
    -[ASOServiceOverlayViewController setInteractiveDismissStartPercentage:](self, "setInteractiveDismissStartPercentage:");
  }
}

- (id)showOverlayAnimated:(BOOL)a3
{
  [(ASOServiceOverlayViewController *)self percentageOnScreen];
  if (v5 <= 0.0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A754;
    block[3] = &unk_1000251E0;
    block[4] = self;
    BOOL v12 = a3;
    id v7 = objc_alloc_init((Class)AMSMutableBinaryPromise);
    id v11 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v8 = v11;
    id v6 = v7;
  }
  else
  {
    id v6 = +[AMSBinaryPromise promiseWithSuccess];
  }

  return v6;
}

- (id)hideOverlayAnimated:(BOOL)a3
{
  double v5 = [(ASOServiceOverlayViewController *)self panGestureRecognizer];
  [v5 setEnabled:0];

  id v6 = [(ASOServiceOverlayViewController *)self panGestureRecognizer];
  [v6 setEnabled:1];

  [(ASOServiceOverlayViewController *)self percentageOnScreen];
  if (v7 == 0.0)
  {
    id v8 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AB98;
    block[3] = &unk_1000251E0;
    block[4] = self;
    BOOL v14 = a3;
    id v9 = objc_alloc_init((Class)AMSMutableBinaryPromise);
    id v13 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    double v10 = v13;
    id v8 = v9;
  }

  return v8;
}

- (CGPoint)edgePointForPercentage:(double)a3
{
  double v5 = [(ASOServiceOverlayViewController *)self view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(ASOServiceOverlayViewController *)self view];
  [v14 layoutMargins];
  CGFloat v16 = v7 + v15;
  CGFloat v18 = v9 + v17;
  CGFloat v20 = v11 - (v15 + v19);
  CGFloat v22 = v13 - (v17 + v21);

  [(ASOServiceOverlayViewController *)self overlayHeight];
  double v24 = v23;
  id v25 = [(ASOServiceOverlayViewController *)self view];
  [v25 layoutMargins];
  double v27 = v24 + v26;

  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  double MidX = CGRectGetMidX(v31);
  double v29 = v27 * a3;
  result.y = v29;
  result.x = MidX;
  return result;
}

- (double)percentageForEdgePoint:(CGPoint)a3
{
  double y = a3.y;
  [(ASOServiceOverlayViewController *)self edgePointForPercentage:1.0];
  return y / v4;
}

- (CGRect)overlayFrameForEdgePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(ASOServiceOverlayViewController *)self view];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(ASOServiceOverlayViewController *)self view];
  [v15 layoutMargins];
  CGFloat v17 = v8 + v16;
  CGFloat v19 = v10 + v18;
  CGFloat v21 = v12 - (v16 + v20);
  CGFloat v23 = v14 - (v18 + v22);

  v32.origin.double x = v17;
  v32.origin.double y = v19;
  v32.size.width = v21;
  v32.size.height = v23;
  double v24 = fmin(CGRectGetWidth(v32), 600.0);
  id v25 = [(ASOServiceOverlayViewController *)self view];
  [v25 frame];
  CGFloat v26 = CGRectGetMaxY(v33) - y;

  [(ASOServiceOverlayViewController *)self overlayHeight];
  double v28 = v27;
  double v29 = x + v24 * -0.5;
  double v30 = v26;
  double v31 = v24;
  result.size.height = v28;
  result.size.width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)serviceContext:(id)a3 presentOverlayWithConfiguration:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ASOServiceOverlayViewController *)self serviceQueue];
  [v9 queuePresentOverlayWithConfiguration:v8 delegate:v7];
}

- (void)serviceContextDismissOverlay:(id)a3
{
  id v3 = [(ASOServiceOverlayViewController *)self serviceQueue];
  [v3 queueDismissOverlay];
}

- (id)presentationQueue:(id)a3 presentOverlayWithConfiguration:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [ASOServiceOverlayPresenter alloc];
  double v10 = [(ASOServiceOverlayViewController *)self serviceContext];
  double v11 = objc_alloc_init(ASOServiceOverlayLoader);
  double v12 = [(ASOServiceOverlayPresenter *)v9 initWithConfiguration:v8 remoteDelegate:v7 serviceContext:v10 overlayLoader:v11];

  double v13 = +[ASOServiceOverlayViewController log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Starting overlay presentation", v16, 2u);
  }

  double v14 = [(ASOServiceOverlayViewController *)self presentOverlayPresenter:v12 animated:1];
  [v14 addSuccessBlock:&stru_100025200];
  [v14 addErrorBlock:&stru_100025240];

  return v14;
}

- (id)presentationQueueDismissOverlay:(id)a3
{
  return [(ASOServiceOverlayViewController *)self dismissOverlayAnimated:1];
}

- (void)hostDidEnterBackground
{
  id v2 = [(ASOServiceOverlayViewController *)self currentOverlayPresenter];
  [v2 hostApplicationDidEnterBackground];
}

- (void)hostWillEnterForeground
{
  id v2 = [(ASOServiceOverlayViewController *)self currentOverlayPresenter];
  [v2 hostApplicationWillEnterForeground];
}

- (void)updateRateLimiterConstantsIfNeeded
{
  id v3 = +[ASCOverlaySettings sharedSettings];
  id v12 = [v3 rateLimitRequestsPerSecond];

  if (v12)
  {
    [v12 doubleValue];
    double v5 = v4;
    double v6 = [(ASOServiceOverlayViewController *)self rateLimiter];
    [v6 setRequestsPerSecond:v5];
  }
  id v7 = +[ASCOverlaySettings sharedSettings];
  id v8 = [v7 rateLimitTimeWindow];

  if (v8)
  {
    [v8 doubleValue];
    double v10 = v9;
    double v11 = [(ASOServiceOverlayViewController *)self rateLimiter];
    [v11 setTimeWindow:v10];
  }
}

- (ASOServiceOverlayPresenter)currentOverlayPresenter
{
  return self->_currentOverlayPresenter;
}

- (void)setCurrentOverlayPresenter:(id)a3
{
}

- (ASOServiceOverlayContainerConfiguration)containerConfiguration
{
  return self->_containerConfiguration;
}

- (_TtC23AppStoreOverlaysService27ServiceOverlayContainerView)overlayContainer
{
  return self->_overlayContainer;
}

- (void)setOverlayContainer:(id)a3
{
}

- (ASOServicePresentationQueue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (UIGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (ASORateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (double)percentageOnScreen
{
  return self->_percentageOnScreen;
}

- (double)interactiveDismissStartPercentage
{
  return self->_interactiveDismissStartPercentage;
}

- (void)setInteractiveDismissStartPercentage:(double)a3
{
  self->_interactiveDismissStartPercentage = a3;
}

- (void)setOverlayHeight:(double)a3
{
  self->_overlayHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_overlayContainer, 0);
  objc_storeStrong((id *)&self->_containerConfiguration, 0);

  objc_storeStrong((id *)&self->_currentOverlayPresenter, 0);
}

@end