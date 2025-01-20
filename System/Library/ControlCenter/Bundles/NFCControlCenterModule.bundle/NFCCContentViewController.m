@interface NFCCContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (double)scrollViewContentHeightForWidth:(double)a3;
- (void)_didCollapse;
- (void)_moduleButtonTapped;
- (void)_setModuleState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setTransientModuleState:(int64_t)a3;
- (void)_startReader;
- (void)_startReaderIfNeeded;
- (void)_stopReader;
- (void)_stopTransientModuleStateTimer;
- (void)_updateContentViewSize;
- (void)_willExpand;
- (void)moduleAvailabilityDidChange:(BOOL)a3;
- (void)nfcReaderDidDetectNonNDEFTag;
- (void)nfcReaderStateDidChange:(int64_t)a3;
- (void)turnOnNFCButtonTapped;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation NFCCContentViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)NFCCContentViewController;
  [(NFCCContentViewController *)&v11 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = +[UIImage imageNamed:@"ModuleGlyph" inBundle:v3 withConfiguration:0];
  [(NFCCContentViewController *)self setGlyphImage:v4];

  v5 = [(NFCCContentViewController *)self buttonView];
  [v5 addTarget:self action:"_moduleButtonTapped" forControlEvents:64];

  v6 = _BCSLocalizedString();
  [(NFCCContentViewController *)self setTitle:v6];

  [(NFCCContentViewController *)self _setModuleState:0 animated:0];
  v7 = (BCSNFCReaderConnection *)objc_alloc_init((Class)BCSNFCReaderConnection);
  readerConnection = self->_readerConnection;
  self->_readerConnection = v7;

  v9 = [[NFCCModuleAvailabilityMonitor alloc] initWithDelegate:self readerConnection:self->_readerConnection];
  availabilityMonitor = self->_availabilityMonitor;
  self->_availabilityMonitor = v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFCCContentViewController;
  [(NFCCContentViewController *)&v9 viewWillAppear:a3];
  [(NFCCModuleAvailabilityMonitor *)self->_availabilityMonitor controlCenterWillAppear];
  v4 = [(NFCCContentViewController *)self buttonView];
  unsigned int v5 = [v4 isEnabled];
  int available = self->_available;

  if (available != v5)
  {
    BOOL v7 = self->_available;
    v8 = [(NFCCContentViewController *)self buttonView];
    [v8 setEnabled:v7];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFCCContentViewController;
  [(NFCCContentViewController *)&v4 viewWillDisappear:a3];
  [(NFCCContentViewController *)self _stopReader];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFCCContentViewController;
  [(NFCCContentViewController *)&v4 viewDidDisappear:a3];
  [(NFCCModuleAvailabilityMonitor *)self->_availabilityMonitor controlCenterDidDisappear];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NFCCContentViewController;
  [(NFCCContentViewController *)&v3 viewWillLayoutSubviews];
  [(NFCCContentViewController *)self _updateContentViewSize];
  [(NFCCContentView *)self->_contentView updateOrientationIfNeeded];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NFCCContentViewController;
  -[NFCCContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ([(NFCCContentViewController *)self isExpanded]) {
    [(NFCCContentViewController *)self _willExpand];
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_463C;
  v8[3] = &unk_C3E8;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)_updateContentViewSize
{
  [(NFCCContentViewController *)self preferredExpandedContentWidth];
  double v4 = v3;
  -[NFCCContentView preferredExpandedContentHeightForWidth:](self->_contentView, "preferredExpandedContentHeightForWidth:");
  contentView = self->_contentView;

  -[NFCCContentView setFrame:](contentView, "setFrame:", 0.0, 0.0, v4, v5);
}

- (void)_willExpand
{
  if (!self->_contentView)
  {
    double v3 = objc_alloc_init(NFCCContentView);
    contentView = self->_contentView;
    self->_contentView = v3;

    [(NFCCContentView *)self->_contentView setDelegate:self];
    [(NFCCContentView *)self->_contentView setModuleState:self->_moduleState animated:0];
    [(NFCCContentViewController *)self setCustomContentView:self->_contentView];
    [(NFCCContentViewController *)self _updateContentViewSize];
  }
}

- (void)_didCollapse
{
  [(NFCCContentViewController *)self setCustomContentView:0];
  contentView = self->_contentView;
  self->_contentView = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)scrollViewContentHeightForWidth:(double)a3
{
  [(NFCCContentView *)self->_contentView preferredExpandedContentHeightForWidth:a3];
  return result;
}

- (void)_startReaderIfNeeded
{
  if ([(NFCCContentViewController *)self isExpanded])
  {
    [(NFCCContentViewController *)self _startReader];
  }
}

- (void)_startReader
{
  [(NSTimer *)self->_reconnectTimer invalidate];
  reconnectTimer = self->_reconnectTimer;
  self->_reconnectTimer = 0;

  objc_initWeak(&location, self);
  readerConnection = self->_readerConnection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4930;
  v5[3] = &unk_C460;
  objc_copyWeak(&v6, &location);
  [(BCSNFCReaderConnection *)readerConnection checkNFCEnabledWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_stopReader
{
  [(NSTimer *)self->_reconnectTimer invalidate];
  reconnectTimer = self->_reconnectTimer;
  self->_reconnectTimer = 0;

  readerConnection = self->_readerConnection;

  [(BCSNFCReaderConnection *)readerConnection stopReaderWithErrorHandler:0];
}

- (void)_setModuleState:(int64_t)a3 animated:(BOOL)a4
{
  self->_moduleState = a3;
  -[NFCCContentView setModuleState:animated:](self->_contentView, "setModuleState:animated:");
  if ([(NFCCContentViewController *)self isExpanded])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_4E6C;
    v5[3] = &unk_C380;
    void v5[4] = self;
    +[UIView performWithoutAnimation:v5];
  }
}

- (void)_setTransientModuleState:(int64_t)a3
{
  [(NFCCContentViewController *)self _setModuleState:a3 animated:1];
  [(NFCCContentViewController *)self _stopTransientModuleStateTimer];
  objc_initWeak(&location, self);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  objc_super v9 = sub_5018;
  v10 = &unk_C410;
  objc_copyWeak(&v11, &location);
  double v4 = +[NSTimer timerWithTimeInterval:0 repeats:&v7 block:3.0];
  transientModuleStateTimer = self->_transientModuleStateTimer;
  self->_transientModuleStateTimer = v4;

  id v6 = +[NSRunLoop mainRunLoop];
  [v6 addTimer:self->_transientModuleStateTimer forMode:NSRunLoopCommonModes];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_stopTransientModuleStateTimer
{
  [(NSTimer *)self->_transientModuleStateTimer invalidate];
  transientModuleStateTimer = self->_transientModuleStateTimer;
  self->_transientModuleStateTimer = 0;
}

- (void)_moduleButtonTapped
{
  id v2 = [(NFCCContentViewController *)self contentModuleContext];
  [v2 requestExpandModule];
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NFCCContentViewController;
  -[NFCCContentViewController willTransitionToExpandedContentMode:](&v6, "willTransitionToExpandedContentMode:");
  if (v3)
  {
    double v5 = +[BCSAnalyticsLogger sharedLogger];
    [v5 didActivateNFCReader];

    [(NFCCContentViewController *)self _startReader];
  }
  else
  {
    [(NFCCContentViewController *)self _stopReader];
  }
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return self->_available;
}

- (void)moduleAvailabilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  self->_int available = a3;
  id v4 = [(NFCCContentViewController *)self buttonView];
  [v4 setEnabled:v3];
}

- (void)turnOnNFCButtonTapped
{
  objc_initWeak(&location, self);
  readerConnection = self->_readerConnection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_52A8;
  v4[3] = &unk_C460;
  objc_copyWeak(&v5, &location);
  [(BCSNFCReaderConnection *)readerConnection enableNFCWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)nfcReaderStateDidChange:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_5388;
  v3[3] = &unk_C488;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)nfcReaderDidDetectNonNDEFTag
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_55B0;
  block[3] = &unk_C380;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientModuleStateTimer, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_readerConnection, 0);
  objc_storeStrong((id *)&self->_availabilityMonitor, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end