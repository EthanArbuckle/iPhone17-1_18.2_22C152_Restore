@interface MFAlertOverlayController
+ (id)log;
- (BOOL)isPresentingAlert;
- (MFAlertOverlayController)initWithWindowScene:(id)a3;
- (UIAlertController)topmostPresentedAlert;
- (UIWindow)overlayWindow;
- (UIWindowScene)scene;
- (id)_bottomPresentedAlert;
- (id)_topmostViewController;
- (void)_handlePresentationDismissalNotification:(id)a3;
- (void)_setupOverlayWindowWithScene:(id)a3;
- (void)_teardownOverlayWindow;
- (void)dealloc;
- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setOverlayWindow:(id)a3;
@end

@implementation MFAlertOverlayController

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MFAlertOverlayController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;

  return v2;
}

void __31__MFAlertOverlayController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.messageui", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (MFAlertOverlayController)initWithWindowScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MFAlertOverlayController.m", 23, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)MFAlertOverlayController;
  v6 = [(MFAlertOverlayController *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_scene, v5);
  }

  return v7;
}

- (void)dealloc
{
  [(MFAlertOverlayController *)self _teardownOverlayWindow];
  v3.receiver = self;
  v3.super_class = (Class)MFAlertOverlayController;
  [(MFAlertOverlayController *)&v3 dealloc];
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = [(MFAlertOverlayController *)self _topmostViewController];
  if (!v10)
  {
    v11 = [(MFAlertOverlayController *)self scene];
    [(MFAlertOverlayController *)self _setupOverlayWindowWithScene:v11];
    v12 = [(MFAlertOverlayController *)self overlayWindow];
    objc_super v10 = [v12 rootViewController];
  }
  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel__handlePresentationDismissalNotification_ name:*MEMORY[0x1E4FB2E60] object:v8];

  v14 = +[MFAlertOverlayController log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "Presenting alert %@ from %@", (uint8_t *)&v15, 0x16u);
  }

  [v10 presentViewController:v8 animated:v6 completion:v9];
}

- (BOOL)isPresentingAlert
{
  v2 = [(MFAlertOverlayController *)self _bottomPresentedAlert];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIAlertController)topmostPresentedAlert
{
  v2 = [(MFAlertOverlayController *)self _topmostViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UIAlertController *)v3;
}

- (id)_topmostViewController
{
  v2 = [(MFAlertOverlayController *)self overlayWindow];
  uint64_t v3 = [v2 rootViewController];
  do
  {
    v4 = (void *)v3;

    uint64_t v3 = [v4 presentedViewController];
    v2 = v4;
  }
  while (v3);

  return v4;
}

- (id)_bottomPresentedAlert
{
  v2 = [(MFAlertOverlayController *)self overlayWindow];
  uint64_t v3 = [v2 rootViewController];
  v4 = [v3 presentedViewController];

  return v4;
}

- (void)_setupOverlayWindowWithScene:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[MFAlertOverlayController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_INFO, "Setting up alert overlay window...", (uint8_t *)&v11, 2u);
  }

  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  [v6 setRootViewController:v7];

  id v8 = +[MFAlertOverlayController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v4 session];
    objc_super v10 = [v9 persistentIdentifier];
    int v11 = 138412546;
    v12 = v10;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_INFO, "Succesfully set up alert overlay window in scene %@: %@", (uint8_t *)&v11, 0x16u);
  }
  [(MFAlertOverlayController *)self setOverlayWindow:v6];
  [v6 makeKeyAndVisible];
}

- (void)_teardownOverlayWindow
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "Found presented alert while tearing down alert overlay window. Dismissing it before continuing with teardown. Presented: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handlePresentationDismissalNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MFAlertOverlayController *)self _bottomPresentedAlert];
  BOOL v6 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v4 object];
    id v9 = +[MFAlertOverlayController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      __int16 v13 = v8;
      _os_log_impl(&dword_1AF945000, v9, OS_LOG_TYPE_DEFAULT, "Alert controller dismissed: %@", (uint8_t *)&v12, 0xCu);
    }

    if (v8 == v5) {
LABEL_10:
    }
      [(MFAlertOverlayController *)self _teardownOverlayWindow];
  }
  else
  {
    objc_super v10 = +[MFAlertOverlayController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = [v4 object];
      [(MFAlertOverlayController *)v11 _handlePresentationDismissalNotification:v10];
    }

    if (!v5 || [v5 isBeingDismissed]) {
      goto LABEL_10;
    }
  }
}

- (UIWindowScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIWindowScene *)WeakRetained;
}

- (UIWindow)overlayWindow
{
  return self->_overlayWindow;
}

- (void)setOverlayWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayWindow, 0);

  objc_destroyWeak((id *)&self->_scene);
}

- (void)_handlePresentationDismissalNotification:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Received unexpected dismissal notification for unknown object: %@", buf, 0xCu);
}

@end