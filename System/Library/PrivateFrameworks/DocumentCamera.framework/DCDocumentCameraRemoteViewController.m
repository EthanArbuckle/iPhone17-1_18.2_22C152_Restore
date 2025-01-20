@interface DCDocumentCameraRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (DCDocumentCameraPublicViewController)publicViewController;
- (int64_t)preferredContainerBackgroundStyle;
- (void)didCancel;
- (void)didFailWithError:(id)a3;
- (void)didFinishWithDocumentInfoCollection:(id)a3;
- (void)dismiss;
- (void)setPublicViewController:(id)a3;
- (void)viewControllerWasDismissed;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewServicePreferredSizeDidChange:(CGSize)a3;
@end

@implementation DCDocumentCameraRemoteViewController

- (int64_t)preferredContainerBackgroundStyle
{
  return 2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[DCDocumentCameraRemoteViewController viewServiceDidTerminateWithError:]((uint64_t)v4, v5);
  }

  [(DCDocumentCameraRemoteViewController *)self dismiss];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C8353C8];
}

+ (id)exportedInterface
{
  v7[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C825530];
  v3 = (void *)MEMORY[0x263EFFA08];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_didFinishWithDocumentInfoCollection_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)viewServicePreferredSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(DCDocumentCameraRemoteViewController *)self publicViewController];
  objc_msgSend(v5, "viewServicePreferredSizeDidChange:", width, height);
}

- (void)dismiss
{
  id v2 = [(DCDocumentCameraRemoteViewController *)self publicViewController];
  [v2 dismiss];
}

- (void)viewControllerWasDismissed
{
  v3 = [(DCDocumentCameraRemoteViewController *)self viewServiceViewController];
  [v3 viewControllerWasDismissed];

  [(DCDocumentCameraRemoteViewController *)self setPublicViewController:0];
}

- (void)didCancel
{
  id v2 = [(DCDocumentCameraRemoteViewController *)self publicViewController];
  [v2 didCancel];
}

- (void)didFinishWithDocumentInfoCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(DCDocumentCameraRemoteViewController *)self publicViewController];
  [v5 didFinishWithDocumentInfoCollection:v4];
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(DCDocumentCameraRemoteViewController *)self publicViewController];
  [v5 didFailWithError:v4];
}

- (DCDocumentCameraPublicViewController)publicViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publicViewController);

  return (DCDocumentCameraPublicViewController *)WeakRetained;
}

- (void)setPublicViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "Remote view service terminated with error: %@", (uint8_t *)&v2, 0xCu);
}

@end