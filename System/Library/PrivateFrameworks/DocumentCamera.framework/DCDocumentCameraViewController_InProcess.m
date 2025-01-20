@interface DCDocumentCameraViewController_InProcess
- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4;
- (DCDocumentCameraViewController_InProcess)initWithDelegate:(id)a3;
- (UIViewController)viewController;
- (id)documentCameraControllerCreateDataCryptorIfNecessary;
- (id)scanDataDelegateWithIdentifier:(id)a3;
- (int64_t)_preferredModalPresentationStyle;
- (void)_autoDismiss;
- (void)didReceiveMemoryWarning;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6;
- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4;
- (void)documentCameraControllerDidCancel:(id)a3;
- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4;
- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4;
- (void)remoteDocumentCameraControllerDidCancel:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation DCDocumentCameraViewController_InProcess

- (DCDocumentCameraViewController_InProcess)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [[ICDocCamImageCache alloc] initWithDataCryptorDelegate:0];
  if (DCDebugInterfaceEnabled())
  {
    v6 = [[ICRemoteDocCamViewController alloc] initWithImageCache:v5];
    uint64_t v7 = objc_opt_class();
    v8 = DCDynamicCast(v7, (uint64_t)v6);
    [v8 setDelegate:self];

    v9 = v6;
    v10 = (ICDocCamViewController *)v9;
  }
  else
  {
    v10 = [[ICDocCamViewController alloc] initWithImageCache:v5];
    uint64_t v11 = objc_opt_class();
    v12 = DCDynamicCast(v11, (uint64_t)v10);
    [v12 setDelegate:self];

    v9 = (ICRemoteDocCamViewController *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v10];
  }
  v13 = v9;
  v16.receiver = self;
  v16.super_class = (Class)DCDocumentCameraViewController_InProcess;
  v14 = [(DCDocumentCameraViewController *)&v16 initWithDelegate:v4 childViewController:v9];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_viewController, v10);
    [(DCDocumentCameraViewController_InProcess *)v14 setModalPresentationStyle:0];
  }

  return v14;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)DCDocumentCameraViewController_InProcess;
  [(DCDocumentCameraViewController_InProcess *)&v2 didReceiveMemoryWarning];
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  return a4 <= 0x18;
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  return 0;
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  id v13 = a4;
  id v8 = a5;
  v9 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [[DCScannedDocument alloc] initWithDocInfoCollection:v13 imageCache:v8];
    v12 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v12 documentCameraViewController:self didFinishWithDocument:v11];
  }
  else
  {
    [(DCDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4
{
  v5 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v7 documentCameraViewControllerDidCancel:self];
  }
  else
  {
    [(DCDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)documentCameraControllerDidCancel:(id)a3
{
  id v4 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v6 documentCameraViewControllerDidCancel:self];
  }
  else
  {
    [(DCDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  return 0;
}

- (void)remoteDocumentCameraControllerDidCancel:(id)a3
{
  id v4 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v6 documentCameraViewControllerDidCancel:self];
  }
  else
  {
    [(DCDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [DCScannedDocument alloc];
    char v10 = [v13 imageCache];
    uint64_t v11 = [(DCScannedDocument *)v9 initWithDocInfoCollection:v6 imageCache:v10];

    v12 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v12 documentCameraViewController:self didFinishWithDocument:v11];
  }
  else
  {
    [(DCDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4
{
  char v5 = [(DCDocumentCameraViewController *)self docCamDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(DCDocumentCameraViewController *)self docCamDelegate];
    [v7 documentCameraViewControllerDidCancel:self];
  }
  else
  {
    [(DCDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)_autoDismiss
{
  id v2 = [(DCDocumentCameraViewController_InProcess *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end