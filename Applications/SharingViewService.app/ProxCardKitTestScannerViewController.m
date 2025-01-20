@interface ProxCardKitTestScannerViewController
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProxCardKitTestScannerViewController

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ProxCardKitTestScannerViewController;
  [(ProxCardKitTestScannerViewController *)&v6 viewDidAppear:a3];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012A68C;
  block[3] = &unk_1001A1BD8;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ProxCardKitTestScannerViewController;
  [(ProxCardKitTestScannerViewController *)&v5 viewDidDisappear:a3];
  dispatch_time_t v4 = [(ProxCardKitTestScannerViewController *)self scannerEngine];
  [v4 stop];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ProxCardKitTestScannerViewController;
  [(ProxCardKitTestScannerViewController *)&v5 viewWillAppear:a3];
  dispatch_time_t v4 = [(ProxCardKitTestScannerViewController *)self scannerEngine];
  [v4 start];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ProxCardKitTestScannerViewController;
  [(ProxCardKitTestScannerViewController *)&v3 viewDidLoad];
  [(ProxCardKitTestScannerViewController *)self setTitle:@"Wait a Few Seconds"];
}

@end