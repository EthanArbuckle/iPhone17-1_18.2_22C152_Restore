@interface DocumentScannerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (_TtC16ContinuityCamera29DocumentScannerViewController)initWithCoder:(id)a3;
- (_TtC16ContinuityCamera29DocumentScannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)viewDidLoad;
@end

@implementation DocumentScannerViewController

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100008C64();
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100008E34((uint64_t)v6, (uint64_t)v7);
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100008F44((uint64_t)v4);
}

- (_TtC16ContinuityCamera29DocumentScannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100009500();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16ContinuityCamera29DocumentScannerViewController *)sub_100009038(v5, v7, a4);
}

- (_TtC16ContinuityCamera29DocumentScannerViewController)initWithCoder:(id)a3
{
  return (_TtC16ContinuityCamera29DocumentScannerViewController *)sub_100009180(a3);
}

- (void).cxx_destruct
{
  sub_100008AE0((uint64_t)self + OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_documentCamera);
}

@end