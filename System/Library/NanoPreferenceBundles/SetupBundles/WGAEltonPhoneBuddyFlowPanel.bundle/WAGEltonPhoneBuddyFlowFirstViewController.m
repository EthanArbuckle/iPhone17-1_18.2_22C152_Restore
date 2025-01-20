@interface WAGEltonPhoneBuddyFlowFirstViewController
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (WAGEltonPhoneBuddyFlowFirstViewController)init;
- (id)_phoneBuddyFlowPanelLog;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_handlepplicationDidBecomeActiveNotification;
- (void)_prepareUIForVideoReadyToPlay;
- (void)_setupViews;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation WAGEltonPhoneBuddyFlowFirstViewController

- (WAGEltonPhoneBuddyFlowFirstViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)WAGEltonPhoneBuddyFlowFirstViewController;
  v2 = [(WAGEltonPhoneBuddyFlowFirstViewController *)&v9 initWithTitle:&stru_4240 detailText:0 icon:0 contentLayout:1];
  v3 = v2;
  if (v2)
  {
    v4 = [(WAGEltonPhoneBuddyFlowFirstViewController *)v2 _phoneBuddyFlowPanelLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      __int16 v12 = 2080;
      v13 = "-[WAGEltonPhoneBuddyFlowFirstViewController init]";
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
    }
    [(WAGEltonPhoneBuddyFlowFirstViewController *)v3 setStyle:2];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"_handlepplicationDidBecomeActiveNotification" name:UIApplicationDidBecomeActiveNotification object:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WAGEltonPhoneBuddyFlowFirstViewController;
  [(WAGEltonPhoneBuddyFlowFirstViewController *)&v6 viewDidLoad];
  v3 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    v8 = v5;
    __int16 v9 = 2080;
    v10 = "-[WAGEltonPhoneBuddyFlowFirstViewController viewDidLoad]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }
  [(WAGEltonPhoneBuddyFlowFirstViewController *)self _setupViews];
}

- (void)dealloc
{
  v3 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    __int16 v9 = v5;
    __int16 v10 = 2080;
    v11 = "-[WAGEltonPhoneBuddyFlowFirstViewController dealloc]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }
  [(AVQueuePlayer *)self->_avQueuePlayer removeObserver:self forKeyPath:@"status"];
  [(AVQueuePlayer *)self->_avQueuePlayer removeObserver:self forKeyPath:@"timeControlStatus"];
  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];

  v7.receiver = self;
  v7.super_class = (Class)WAGEltonPhoneBuddyFlowFirstViewController;
  [(WAGEltonPhoneBuddyFlowFirstViewController *)&v7 dealloc];
}

- (void)_setupViews
{
  v3 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    v31 = v5;
    __int16 v32 = 2080;
    v33 = "-[WAGEltonPhoneBuddyFlowFirstViewController _setupViews]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }
  objc_super v6 = +[UIColor blackColor];
  objc_super v7 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self view];
  [v7 setBackgroundColor:v6];

  v8 = (UIView *)objc_alloc_init((Class)UIView);
  containerContentView = self->_containerContentView;
  self->_containerContentView = v8;

  __int16 v10 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self contentView];
  [v10 addSubview:self->_containerContentView];

  v11 = +[UIColor blackColor];
  __int16 v12 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self contentView];
  [v12 setBackgroundColor:v11];

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 pathForResource:@"elton_instruction" ofType:@"m4v"];

  if (v14)
  {
    v15 = +[NSURL fileURLWithPath:v14];
    v16 = +[AVPlayerItem playerItemWithURL:v15];
    v29 = v16;
    v17 = +[NSArray arrayWithObjects:&v29 count:1];
    v18 = +[AVQueuePlayer queuePlayerWithItems:v17];
    avQueuePlayer = self->_avQueuePlayer;
    self->_avQueuePlayer = v18;

    v20 = +[AVPlayerLooper playerLooperWithPlayer:self->_avQueuePlayer templateItem:v16];
    playerLooper = self->_playerLooper;
    self->_playerLooper = v20;

    [(AVQueuePlayer *)self->_avQueuePlayer addObserver:self forKeyPath:@"status" options:0 context:0];
    v22 = +[AVPlayerLayer playerLayerWithPlayer:self->_avQueuePlayer];
    playerLayer = self->_playerLayer;
    self->_playerLayer = v22;

    [(AVPlayerLayer *)self->_playerLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    v24 = [(UIView *)self->_containerContentView layer];
    [v24 addSublayer:self->_playerLayer];
  }
  v25 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = +[UIImage imageNamed:@"elton_first_frame_fpo" inBundle:v25 withConfiguration:0];

  v27 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v26];
  playerPlaceholderImageView = self->_playerPlaceholderImageView;
  self->_playerPlaceholderImageView = v27;

  [(UIImageView *)self->_playerPlaceholderImageView setContentMode:1];
  [(UIView *)self->_containerContentView addSubview:self->_playerPlaceholderImageView];
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)WAGEltonPhoneBuddyFlowFirstViewController;
  [(WAGEltonPhoneBuddyFlowFirstViewController *)&v22 viewDidLayoutSubviews];
  v3 = [(UIImageView *)self->_playerPlaceholderImageView image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  if (v7 <= 0.0 || v5 <= 0.0) {
    double v9 = 1.38;
  }
  else {
    double v9 = v5 / v7;
  }
  __int16 v10 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self contentView];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;

  v15 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  v18 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self view];
  [v18 bounds];
  double v20 = v19 / v9;

  double v21 = v12 + (v14 - v20) * 0.5;
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:", 0.0, v21, v17, v20);
  -[UIImageView setFrame:](self->_playerPlaceholderImageView, "setFrame:", 0.0, v21, v17, v20);
  -[UIView setFrame:](self->_containerContentView, "setFrame:", 0.0, v21, v17, v20);
}

- (id)titleString
{
  v2 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
    int v8 = 138412546;
    double v9 = v4;
    __int16 v10 = 2080;
    double v11 = "-[WAGEltonPhoneBuddyFlowFirstViewController titleString]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);
  }
  double v5 = +[NSBundle bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"TITLE" value:&stru_4240 table:@"Localizable"];

  return v6;
}

- (id)detailString
{
  v2 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
    int v8 = 138412546;
    double v9 = v4;
    __int16 v10 = 2080;
    double v11 = "-[WAGEltonPhoneBuddyFlowFirstViewController detailString]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);
  }
  double v5 = +[NSBundle bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"DETAIL" value:&stru_4240 table:@"Localizable"];

  return v6;
}

- (id)suggestedButtonTitle
{
  v2 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
    int v8 = 138412546;
    double v9 = v4;
    __int16 v10 = 2080;
    double v11 = "-[WAGEltonPhoneBuddyFlowFirstViewController suggestedButtonTitle]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);
  }
  double v5 = +[NSBundle bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"BUTTON_TITLE" value:&stru_4240 table:@"Localizable"];

  return v6;
}

- (void)suggestedButtonPressed:(id)a3
{
  double v4 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    int v8 = 138412546;
    double v9 = v6;
    __int16 v10 = 2080;
    double v11 = "-[WAGEltonPhoneBuddyFlowFirstViewController suggestedButtonPressed:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);
  }
  double v7 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self miniFlowDelegate];
  [v7 miniFlowStepComplete:self];
}

- (id)imageResource
{
  return @"Elton_icon";
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412546;
    double v16 = v12;
    __int16 v17 = 2080;
    v18 = "-[WAGEltonPhoneBuddyFlowFirstViewController observeValueForKeyPath:ofObject:change:context:]";
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }
  if ([v9 isEqual:self->_avQueuePlayer]
    && [v8 isEqualToString:@"status"]
    && [(AVQueuePlayer *)self->_avQueuePlayer status] == (char *)&dword_0 + 1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1FEC;
    block[3] = &unk_41E0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if ([v9 isEqual:self->_avQueuePlayer]
    && [v8 isEqualToString:@"timeControlStatus"]
    && [(AVQueuePlayer *)self->_avQueuePlayer timeControlStatus] == (char *)&dword_0 + 2)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_203C;
    v13[3] = &unk_41E0;
    v13[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

- (void)_prepareUIForVideoReadyToPlay
{
  v3 = [(WAGEltonPhoneBuddyFlowFirstViewController *)self _phoneBuddyFlowPanelLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2080;
    __int16 v10 = "-[WAGEltonPhoneBuddyFlowFirstViewController _prepareUIForVideoReadyToPlay]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v7, 0x16u);
  }
  double v6 = [(UIImageView *)self->_playerPlaceholderImageView superview];

  if (v6)
  {
    [(AVQueuePlayer *)self->_avQueuePlayer play];
    [(AVQueuePlayer *)self->_avQueuePlayer addObserver:self forKeyPath:@"timeControlStatus" options:0 context:0];
  }
}

- (void)_handlepplicationDidBecomeActiveNotification
{
  id v2 = [(AVPlayerLayer *)self->_playerLayer player];
  [v2 play];
}

- (id)_phoneBuddyFlowPanelLog
{
  if (qword_8A80 != -1) {
    dispatch_once(&qword_8A80, &stru_4220);
  }
  id v2 = (void *)qword_8A78;

  return v2;
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->miniFlowDelegate);
  objc_storeStrong((id *)&self->_containerContentView, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_avQueuePlayer, 0);

  objc_storeStrong((id *)&self->_playerPlaceholderImageView, 0);
}

@end