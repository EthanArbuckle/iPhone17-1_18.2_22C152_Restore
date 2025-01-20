@interface _ARViewerViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (ARViewerVendorProtocol)arviewerDelegate;
- (BOOL)isIgnoringInteractionEvents;
- (int64_t)statusBarOrientation;
- (void)setArviewerDelegate:(id)a3;
- (void)setStatusBarOrientation:(int64_t)a3;
@end

@implementation _ARViewerViewController

+ (id)_remoteViewControllerInterface
{
  if (_remoteViewControllerInterface_onceToken != -1) {
    dispatch_once(&_remoteViewControllerInterface_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_remoteViewControllerInterface_sHostInterface;
  return v2;
}

+ (id)_exportedInterface
{
  if (_exportedInterface_onceToken != -1) {
    dispatch_once(&_exportedInterface_onceToken, &__block_literal_global_49);
  }
  v2 = (void *)_exportedInterface_sVendorInterface;
  return v2;
}

- (BOOL)isIgnoringInteractionEvents
{
  v2 = [(_ARViewerViewController *)self _remoteViewControllerProxy];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___ARViewerViewController_isIgnoringInteractionEvents__block_invoke;
  v5[3] = &unk_1E6DD7BF0;
  v5[4] = &v6;
  [v2 isIgnoringInteractionEvents:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int64_t)statusBarOrientation
{
  v2 = [(_ARViewerViewController *)self _remoteViewControllerProxy];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47___ARViewerViewController_statusBarOrientation__block_invoke;
  v5[3] = &unk_1E6DD7C18;
  v5[4] = &v6;
  [v2 statusBarOrientation:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setStatusBarOrientation:(int64_t)a3
{
  id v4 = [(_ARViewerViewController *)self _remoteViewControllerProxy];
  [v4 setStatusBarOrientation:a3];
}

- (ARViewerVendorProtocol)arviewerDelegate
{
  return (ARViewerVendorProtocol *)objc_getProperty(self, a2, 976, 1);
}

- (void)setArviewerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end