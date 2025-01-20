@interface PBADeviceBlockOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (PBADeviceBlockOverlayViewController)initWithBlockStatusProvider:(id)a3;
- (PBADeviceBlockOverlayViewControllerDelegate)delegate;
- (SBFBlockStatusProvider)blockStatusProvider;
- (SBFDeviceBlockTimer)blockTimer;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)loadView;
- (void)setBlockStatusProvider:(id)a3;
- (void)setBlockTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBADeviceBlockOverlayViewController

- (PBADeviceBlockOverlayViewController)initWithBlockStatusProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PBADeviceBlockOverlayViewController;
  v5 = [(PBADeviceBlockOverlayViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PBADeviceBlockOverlayViewController *)v5 setBlockStatusProvider:v4];
  }

  return v6;
}

- (void)dealloc
{
  [(SBFDeviceBlockTimer *)self->_blockTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBADeviceBlockOverlayViewController;
  [(PBADeviceBlockOverlayViewController *)&v3 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)loadView
{
  objc_super v3 = (SBFDeviceBlockTimer *)[objc_alloc((Class)SBFDeviceBlockTimer) initWithDeviceBlockStatusProvider:self->_blockStatusProvider];
  blockTimer = self->_blockTimer;
  self->_blockTimer = v3;

  objc_initWeak(&location, self);
  v5 = self->_blockTimer;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10000BEA0;
  v15 = &unk_10001CC70;
  objc_copyWeak(&v16, &location);
  [(SBFDeviceBlockTimer *)v5 setHandler:&v12];
  id v6 = objc_alloc((Class)SBUILockOverlayView);
  v7 = +[UIScreen mainScreen];
  [v7 _referenceBounds];
  id v8 = [v6 initWithFrame:4];

  v9 = [v8 titleLabel];
  v10 = [(SBFDeviceBlockTimer *)self->_blockTimer titleText];
  [v9 setText:v10];

  v11 = +[UIColor blackColor];
  [v8 setBackgroundColor:v11];

  [(PBADeviceBlockOverlayViewController *)self setView:v8];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBFDeviceBlockTimer *)self->_blockTimer start];
  v5.receiver = self;
  v5.super_class = (Class)PBADeviceBlockOverlayViewController;
  [(PBADeviceBlockOverlayViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBFDeviceBlockTimer *)self->_blockTimer invalidate];
  v5.receiver = self;
  v5.super_class = (Class)PBADeviceBlockOverlayViewController;
  [(PBADeviceBlockOverlayViewController *)&v5 viewDidDisappear:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PBADeviceBlockOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PBADeviceBlockOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFDeviceBlockTimer)blockTimer
{
  return self->_blockTimer;
}

- (void)setBlockTimer:(id)a3
{
}

- (SBFBlockStatusProvider)blockStatusProvider
{
  return self->_blockStatusProvider;
}

- (void)setBlockStatusProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockStatusProvider, 0);
  objc_storeStrong((id *)&self->_blockTimer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end