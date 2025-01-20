@interface DCDocumentCameraViewController_ViewService
- (BKSAccelerometer)accelerometer;
- (DCDocumentCameraRemoteViewController)remoteViewController;
- (DCDocumentCameraViewController_ViewService)initWithDelegate:(id)a3;
- (DCDocumentCameraViewServiceSession)viewServiceSession;
- (DCDocumentCameraViewServiceViewController)viewServiceViewController;
- (id)castedChildViewController;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)dealloc;
- (void)didCancel;
- (void)didFailWithError:(id)a3;
- (void)didFinishWithDocumentInfoCollection:(id)a3;
- (void)dismiss;
- (void)setAccelerometer:(id)a3;
- (void)setViewServiceSession:(id)a3;
- (void)viewDidLoad;
@end

@implementation DCDocumentCameraViewController_ViewService

- (DCDocumentCameraViewController_ViewService)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DCDocumentCameraViewController_ViewService;
  v3 = [(DCDocumentCameraViewController *)&v6 initWithDelegate:a3 childViewController:0];
  v4 = v3;
  if (v3) {
    [(DCDocumentCameraViewController_ViewService *)v3 setModalPresentationStyle:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(DCDocumentCameraViewController_ViewService *)self accelerometer];
  [v3 setOrientationEventsEnabled:0];

  v4 = [(DCDocumentCameraViewController_ViewService *)self accelerometer];
  [v4 setPassiveOrientationEvents:1];

  v5 = [(DCDocumentCameraViewController_ViewService *)self accelerometer];
  [v5 setDelegate:0];

  v6.receiver = self;
  v6.super_class = (Class)DCDocumentCameraViewController_ViewService;
  [(DCDocumentCameraViewController_ViewService *)&v6 dealloc];
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v5 = [(DCDocumentCameraViewController_ViewService *)self viewServiceViewController];
  [v5 setOrientation:a4 animated:1];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)DCDocumentCameraViewController_ViewService;
  [(DCDocumentCameraViewController_ViewService *)&v15 viewDidLoad];
  id v14 = 0;
  v3 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.DocumentCamera.ViewService" error:&v14];
  id v4 = v14;
  if (v3)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__7;
    v12 = __Block_byref_object_dispose__7;
    id v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__DCDocumentCameraViewController_ViewService_viewDidLoad__block_invoke;
    v7[3] = &unk_2642A9C40;
    v7[4] = self;
    v7[5] = &v8;
    uint64_t v5 = [MEMORY[0x263F1CD20] instantiateWithExtension:v3 completion:v7];
    objc_super v6 = (void *)v9[5];
    v9[5] = v5;

    [(id)v9[5] delayDisplayOfRemoteController];
    [(DCDocumentCameraViewController *)self setChildViewController:v9[5]];
    _Block_object_dispose(&v8, 8);
  }
}

- (id)castedChildViewController
{
  v2 = [(DCDocumentCameraViewController *)self childViewController];
  uint64_t v3 = objc_opt_class();
  v9 = DCClassAndProtocolCast(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&unk_26C825530);

  return v9;
}

- (DCDocumentCameraViewServiceViewController)viewServiceViewController
{
  v2 = [(DCDocumentCameraViewController_ViewService *)self remoteViewController];
  uint64_t v3 = [v2 viewServiceViewController];

  return (DCDocumentCameraViewServiceViewController *)v3;
}

- (DCDocumentCameraRemoteViewController)remoteViewController
{
  v2 = [(DCDocumentCameraViewController_ViewService *)self castedChildViewController];
  uint64_t v3 = [v2 remoteViewController];

  return (DCDocumentCameraRemoteViewController *)v3;
}

- (void)dismiss
{
  uint64_t v3 = [(DCDocumentCameraViewController_ViewService *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  id v4 = [(DCDocumentCameraViewController_ViewService *)self remoteViewController];
  [v4 viewControllerWasDismissed];
}

- (void)didCancel
{
  uint64_t v3 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v5 documentCameraViewControllerDidCancel:self];
  }
}

- (void)didFinishWithDocumentInfoCollection:(id)a3
{
  id v11 = a3;
  char v4 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [DCScannedDocument alloc];
    uint64_t v7 = [(DCDocumentCameraViewController_ViewService *)self viewServiceSession];
    uint64_t v8 = [v7 docCamImageCache];
    v9 = [(DCScannedDocument *)v6 initWithDocInfoCollection:v11 imageCache:v8];

    uint64_t v10 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v10 documentCameraViewController:self didFinishWithDocument:v9];
  }
}

- (void)didFailWithError:(id)a3
{
  char v4 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v6 documentCameraViewControllerDidCancel:self];
  }
}

- (DCDocumentCameraViewServiceSession)viewServiceSession
{
  return self->_viewServiceSession;
}

- (void)setViewServiceSession:(id)a3
{
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerometer, 0);

  objc_storeStrong((id *)&self->_viewServiceSession, 0);
}

@end