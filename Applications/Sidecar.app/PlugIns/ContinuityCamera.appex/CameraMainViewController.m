@interface CameraMainViewController
- (BOOL)_canShowWhileLocked;
- (CameraMainViewController)initWithCoder:(id)a3;
- (CameraMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (int64_t)requestCompleted;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsFor:(id)a4;
- (void)_layerdump;
- (void)dealloc;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)loadView;
- (void)requestDidStart:(id)a3;
- (void)sidecarServiceActive;
- (void)sidecarServiceVolumeDownButtonPressed:(BOOL)a3;
- (void)sidecarServiceVolumeUpButtonPressed:(BOOL)a3;
@end

@implementation CameraMainViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v2 = self;
  sub_100002018();
}

- (void).cxx_destruct
{
}

- (void)loadView
{
  v2 = self;
  sub_1000020C4();
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)_layerdump
{
  v2 = self;
  sub_10000263C();
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsFor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unint64_t v9 = sub_100002928();

  return v9;
}

- (void)sidecarServiceVolumeUpButtonPressed:(BOOL)a3
{
  v4 = self;
  sub_1000029E8(a3);
}

- (void)sidecarServiceVolumeDownButtonPressed:(BOOL)a3
{
  v4 = self;
  sub_100002D58(a3);
}

- (void)sidecarServiceActive
{
  v2 = self;
  sub_100002DC0();
}

- (CameraMainViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (CameraMainViewController *)sub_100002E30(v5, v7, a4);
}

- (CameraMainViewController)initWithCoder:(id)a3
{
  return (CameraMainViewController *)sub_100002F1C(a3);
}

- (void)requestDidStart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100002FC4(v4);
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000041CC((uint64_t)v8, v7);
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100004AB0();
}

- (int64_t)requestCompleted
{
  return 2;
}

@end