@interface VNDocumentCameraViewController_ViewService
- (BKSAccelerometer)accelerometer;
- (DCDocumentCameraRemoteViewController)remoteViewController;
- (DCDocumentCameraViewServiceSession)viewServiceSession;
- (DCDocumentCameraViewServiceViewController)viewServiceViewController;
- (VNDocumentCameraViewController_ViewService)init;
- (id)castedChildViewController;
- (int64_t)preferredContainerBackgroundStyle;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)dealloc;
- (void)didCancel;
- (void)didFailWithError:(id)a3;
- (void)didFinishWithDocumentInfoCollection:(id)a3;
- (void)dismiss;
- (void)removeSaveActionBlockerForFiles;
- (void)setAccelerometer:(id)a3;
- (void)setViewServiceSession:(id)a3;
- (void)viewDidLoad;
@end

@implementation VNDocumentCameraViewController_ViewService

- (VNDocumentCameraViewController_ViewService)init
{
  v5.receiver = self;
  v5.super_class = (Class)VNDocumentCameraViewController_ViewService;
  v2 = [(VNDocumentCameraViewController *)&v5 initWithChildViewController:0];
  v3 = v2;
  if (v2) {
    [(VNDocumentCameraViewController_ViewService *)v2 setModalPresentationStyle:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(VNDocumentCameraViewController_ViewService *)self accelerometer];
  [v3 setOrientationEventsEnabled:0];

  v4 = [(VNDocumentCameraViewController_ViewService *)self accelerometer];
  [v4 setPassiveOrientationEvents:1];

  objc_super v5 = [(VNDocumentCameraViewController_ViewService *)self accelerometer];
  [v5 setDelegate:0];

  v6.receiver = self;
  v6.super_class = (Class)VNDocumentCameraViewController_ViewService;
  [(VNDocumentCameraViewController_ViewService *)&v6 dealloc];
}

- (int64_t)preferredContainerBackgroundStyle
{
  return 2;
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v5 = [(VNDocumentCameraViewController_ViewService *)self viewServiceViewController];
  [v5 setOrientation:a4 animated:1];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)VNDocumentCameraViewController_ViewService;
  [(VNDocumentCameraViewController_ViewService *)&v15 viewDidLoad];
  id v14 = 0;
  v3 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.DocumentCamera.ViewService" error:&v14];
  id v4 = v14;
  if (v3)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__2;
    v12 = __Block_byref_object_dispose__2;
    id v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke;
    v7[3] = &unk_2642A9C40;
    v7[4] = self;
    v7[5] = &v8;
    uint64_t v5 = [MEMORY[0x263F1CD20] instantiateWithExtension:v3 completion:v7];
    objc_super v6 = (void *)v9[5];
    v9[5] = v5;

    [(id)v9[5] delayDisplayOfRemoteController];
    [(VNDocumentCameraViewController *)self setChildViewController:v9[5]];
    _Block_object_dispose(&v8, 8);
  }
}

- (id)castedChildViewController
{
  v2 = [(VNDocumentCameraViewController *)self childViewController];
  uint64_t v3 = objc_opt_class();
  v9 = DCClassAndProtocolCast(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&unk_26C825530);

  return v9;
}

- (DCDocumentCameraViewServiceViewController)viewServiceViewController
{
  v2 = [(VNDocumentCameraViewController_ViewService *)self remoteViewController];
  uint64_t v3 = [v2 viewServiceViewController];

  return (DCDocumentCameraViewServiceViewController *)v3;
}

- (DCDocumentCameraRemoteViewController)remoteViewController
{
  v2 = [(VNDocumentCameraViewController_ViewService *)self castedChildViewController];
  uint64_t v3 = [v2 remoteViewController];

  return (DCDocumentCameraRemoteViewController *)v3;
}

- (void)dismiss
{
  uint64_t v3 = [(VNDocumentCameraViewController_ViewService *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  id v4 = [(VNDocumentCameraViewController_ViewService *)self remoteViewController];
  [v4 viewControllerWasDismissed];
}

- (void)didCancel
{
  uint64_t v3 = [(VNDocumentCameraViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = [(VNDocumentCameraViewController *)self delegate];
  id v8 = v5;
  if (v4)
  {
    [v5 documentCameraViewControllerDidCancel:self];
  }
  else
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:-11800 userInfo:0];
    uint64_t v7 = [(VNDocumentCameraViewController *)self delegate];
    [v7 documentCameraViewController:self didFailWithError:v8];
  }
}

- (void)didFinishWithDocumentInfoCollection:(id)a3
{
  id v11 = a3;
  char v4 = [(VNDocumentCameraViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [VNDocumentCameraScan alloc];
    uint64_t v7 = [(VNDocumentCameraViewController_ViewService *)self viewServiceSession];
    id v8 = [v7 docCamImageCache];
    v9 = [(VNDocumentCameraScan *)v6 initWithDocInfoCollection:v11 imageCache:v8];

    uint64_t v10 = [(VNDocumentCameraViewController *)self delegate];
    [v10 documentCameraViewController:self didFinishWithScan:v9];
  }
}

- (void)didFailWithError:(id)a3
{
  id v7 = a3;
  char v4 = [(VNDocumentCameraViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(VNDocumentCameraViewController *)self delegate];
    [v6 documentCameraViewController:self didFailWithError:v7];
  }
}

- (void)removeSaveActionBlockerForFiles
{
  id v2 = [(VNDocumentCameraViewController_ViewService *)self viewServiceViewController];
  [v2 removeSaveActionBlockerForFiles];
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