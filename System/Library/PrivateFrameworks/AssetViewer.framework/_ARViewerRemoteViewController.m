@interface _ARViewerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (ARViewerHostProtocol)arviewerDelegate;
- (void)isIgnoringInteractionEvents:(id)a3;
- (void)setArviewerDelegate:(id)a3;
- (void)setStatusBarOrientation:(int64_t)a3;
- (void)statusBarOrientation:(id)a3;
@end

@implementation _ARViewerRemoteViewController

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1) {
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)serviceViewControllerInterface_sVendorInterface;
  return v2;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1) {
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)exportedInterface_sHostInterface;
  return v2;
}

- (void)isIgnoringInteractionEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(_ARViewerRemoteViewController *)self arviewerDelegate];
  [v5 isIgnoringInteractionEvents:v4];
}

- (void)statusBarOrientation:(id)a3
{
  id v4 = a3;
  id v5 = [(_ARViewerRemoteViewController *)self arviewerDelegate];
  [v5 statusBarOrientation:v4];
}

- (void)setStatusBarOrientation:(int64_t)a3
{
  id v4 = [(_ARViewerRemoteViewController *)self arviewerDelegate];
  [v4 setStatusBarOrientation:a3];
}

- (ARViewerHostProtocol)arviewerDelegate
{
  return (ARViewerHostProtocol *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setArviewerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end