@interface VNDocumentCameraViewController_InProcess
- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4;
- (UIViewController)viewController;
- (VNDocumentCameraViewController_InProcess)init;
- (id)documentCameraControllerCreateDataCryptorIfNecessary;
- (id)scanDataDelegateWithIdentifier:(id)a3;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)preferredContainerBackgroundStyle;
- (void)_autoDismiss;
- (void)didReceiveMemoryWarning;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6;
- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4;
- (void)documentCameraControllerDidCancel:(id)a3;
- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4;
- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4;
- (void)remoteDocumentCameraControllerDidCancel:(id)a3;
- (void)removeSaveActionBlockerForFiles;
- (void)setViewController:(id)a3;
@end

@implementation VNDocumentCameraViewController_InProcess

- (VNDocumentCameraViewController_InProcess)init
{
  v3 = [[ICDocCamImageCache alloc] initWithDataCryptorDelegate:0];
  if (DCDebugInterfaceEnabled())
  {
    v4 = [[ICRemoteDocCamViewController alloc] initWithImageCache:v3];
    uint64_t v5 = objc_opt_class();
    v6 = DCDynamicCast(v5, (uint64_t)v4);
    [v6 setDelegate:self];

    v7 = v4;
    v8 = (ICDocCamViewController *)v7;
  }
  else
  {
    v8 = [[ICDocCamViewController alloc] initWithImageCache:v3];
    uint64_t v9 = objc_opt_class();
    v10 = DCDynamicCast(v9, (uint64_t)v8);
    [v10 setDelegate:self];

    v7 = (ICRemoteDocCamViewController *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v8];
  }
  v11 = v7;
  v15.receiver = self;
  v15.super_class = (Class)VNDocumentCameraViewController_InProcess;
  v12 = [(VNDocumentCameraViewController *)&v15 initWithChildViewController:v7];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewController, v8);
    [(VNDocumentCameraViewController_InProcess *)v13 setModalPresentationStyle:0];
  }

  return v13;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)VNDocumentCameraViewController_InProcess;
  [(VNDocumentCameraViewController_InProcess *)&v2 didReceiveMemoryWarning];
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (int64_t)preferredContainerBackgroundStyle
{
  return 2;
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
  uint64_t v9 = [(VNDocumentCameraViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [[VNDocumentCameraScan alloc] initWithDocInfoCollection:v13 imageCache:v8];
    v12 = [(VNDocumentCameraViewController *)self delegate];
    [v12 documentCameraViewController:self didFinishWithScan:v11];
  }
  else
  {
    [(VNDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4
{
  uint64_t v5 = [(VNDocumentCameraViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(VNDocumentCameraViewController *)self delegate];
    [v7 documentCameraViewControllerDidCancel:self];
  }
  else
  {
    [(VNDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)documentCameraControllerDidCancel:(id)a3
{
  id v11 = a3;
  if (![v11 setupResult])
  {
    v4 = [(VNDocumentCameraViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(VNDocumentCameraViewController *)self delegate];
      [v6 documentCameraViewControllerDidCancel:self];
LABEL_10:

      goto LABEL_12;
    }
  }
  if ([v11 setupResult])
  {
    id v7 = [(VNDocumentCameraViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      if ([v11 setupResult] == 1) {
        uint64_t v9 = -11852;
      }
      else {
        uint64_t v9 = -11800;
      }
      char v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:v9 userInfo:0];
      char v10 = [(VNDocumentCameraViewController *)self delegate];
      [v10 documentCameraViewController:self didFailWithError:v6];

      goto LABEL_10;
    }
  }
  [(VNDocumentCameraViewController_InProcess *)self _autoDismiss];
LABEL_12:
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  return 0;
}

- (void)remoteDocumentCameraControllerDidCancel:(id)a3
{
  v4 = [(VNDocumentCameraViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  char v6 = [(VNDocumentCameraViewController *)self delegate];
  id v9 = v6;
  if (v5)
  {
    [v6 documentCameraViewControllerDidCancel:self];
LABEL_5:

    return;
  }
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:-11800 userInfo:0];
    char v8 = [(VNDocumentCameraViewController *)self delegate];
    [v8 documentCameraViewController:self didFailWithError:v9];

    goto LABEL_5;
  }

  [(VNDocumentCameraViewController_InProcess *)self _autoDismiss];
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  char v7 = [(VNDocumentCameraViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [VNDocumentCameraScan alloc];
    char v10 = [v13 imageCache];
    id v11 = [(VNDocumentCameraScan *)v9 initWithDocInfoCollection:v6 imageCache:v10];

    v12 = [(VNDocumentCameraViewController *)self delegate];
    [v12 documentCameraViewController:self didFinishWithScan:v11];
  }
  else
  {
    [(VNDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4
{
  id v8 = a4;
  char v5 = [(VNDocumentCameraViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(VNDocumentCameraViewController *)self delegate];
    [v7 documentCameraViewController:self didFailWithError:v8];
  }
  else
  {
    [(VNDocumentCameraViewController_InProcess *)self _autoDismiss];
  }
}

- (void)_autoDismiss
{
  id v2 = [(VNDocumentCameraViewController_InProcess *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)removeSaveActionBlockerForFiles
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "Calling removeSaveActionBlockerForFiles...", v1, 2u);
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