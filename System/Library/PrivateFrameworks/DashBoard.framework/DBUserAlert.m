@interface DBUserAlert
- (BOOL)requiresSafeAreaWindow;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBLocalSceneController)localSceneController;
- (DBUserAlert)initWithAlert:(id)a3 preferredPresentationStyle:(int64_t)a4 safeAreaInsets:(UIEdgeInsets)a5 environmentConfiguration:(id)a6;
- (FBScene)scene;
- (UIEdgeInsets)safeAreaInsets;
- (UIWindow)window;
- (URTAlert)alert;
- (id)_alertViewController;
- (id)presentationViewForRequester:(id)a3;
- (int64_t)preferredPresentationStyle;
- (void)_alertViewController;
- (void)_createUserAlertScene;
- (void)invalidate;
- (void)relinquishPresentationForRequester:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setLocalSceneController:(id)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setSceneFrame:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation DBUserAlert

- (DBUserAlert)initWithAlert:(id)a3 preferredPresentationStyle:(int64_t)a4 safeAreaInsets:(UIEdgeInsets)a5 environmentConfiguration:(id)a6
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  id v14 = a3;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DBUserAlert;
  v16 = [(DBUserAlert *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_alert, a3);
    v17->_preferredPresentationStyle = a4;
    objc_storeStrong((id *)&v17->_environmentConfiguration, a6);
    v17->_safeAreaInsets.CGFloat top = top;
    v17->_safeAreaInsets.CGFloat left = left;
    v17->_safeAreaInsets.CGFloat bottom = bottom;
    v17->_safeAreaInsets.CGFloat right = right;
    [(DBUserAlert *)v17 _createUserAlertScene];
  }

  return v17;
}

- (FBScene)scene
{
  v2 = [(DBUserAlert *)self localSceneController];
  v3 = [v2 scene];

  return (FBScene *)v3;
}

- (id)presentationViewForRequester:(id)a3
{
  id v4 = a3;
  v5 = [(DBUserAlert *)self localSceneController];
  v6 = [v5 presentationViewWithIdentifier:v4];

  return v6;
}

- (void)relinquishPresentationForRequester:(id)a3
{
  id v4 = a3;
  id v5 = [(DBUserAlert *)self localSceneController];
  [v5 invalidatePresentationViewForIdentifier:v4];
}

- (void)setSceneFrame:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v28 = *MEMORY[0x263EF8340];
  self->_safeAreaInsets = a4;
  BOOL v13 = [(DBUserAlert *)self requiresSafeAreaWindow];
  BOOL v14 = v13;
  if (v13)
  {
    double x = x + left;
    double y = y + top;
    double width = width - (left + right);
    double height = height - (top + bottom);
  }
  id v15 = DBLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    v16 = NSStringFromRect(v29);
    v30.double top = top;
    v30.double left = left;
    v30.double bottom = bottom;
    v30.double right = right;
    v17 = NSStringFromUIEdgeInsets(v30);
    *(_DWORD *)buf = 138412546;
    v25 = v16;
    __int16 v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_INFO, "updating user alert sceneFrame %@, safeAreaInsets: %@", buf, 0x16u);
  }
  v18 = [(DBUserAlert *)self localSceneController];
  objc_super v19 = [v18 scene];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __44__DBUserAlert_setSceneFrame_safeAreaInsets___block_invoke;
  v23[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
  *(double *)&v23[4] = x;
  *(double *)&v23[5] = y;
  *(double *)&v23[6] = width;
  *(double *)&v23[7] = height;
  [v19 updateSettingsWithBlock:v23];

  v20 = [(DBUserAlert *)self window];
  objc_msgSend(v20, "setFrame:", x, y, width, height);

  if (!v14)
  {
    v21 = [(DBUserAlert *)self window];
    v22 = [v21 rootViewController];
    objc_msgSend(v22, "setAdditionalSafeAreaInsets:", top, left, bottom, right);
  }
}

uint64_t __44__DBUserAlert_setSceneFrame_safeAreaInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  id v4 = [(DBUserAlert *)self localSceneController];
  id v5 = [v4 scene];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__DBUserAlert_setUserInterfaceStyle___block_invoke;
  v6[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  v6[4] = a3;
  [v5 updateSettingsWithBlock:v6];
}

uint64_t __37__DBUserAlert_setUserInterfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (BOOL)requiresSafeAreaWindow
{
  return [(DBUserAlert *)self preferredPresentationStyle] != 2;
}

- (void)invalidate
{
  v3 = [(DBUserAlert *)self localSceneController];
  [v3 invalidate];

  [(DBUserAlert *)self setWindow:0];
}

- (void)_createUserAlertScene
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = [(DBUserAlert *)self alert];
  id v4 = [v3 identifier];

  id v5 = NSString;
  v6 = [(DBUserAlert *)self environmentConfiguration];
  v7 = [v6 displayConfiguration];
  v8 = [v7 identity];
  v9 = [v5 stringWithFormat:@"UserAlert-%@-%@", v4, v8];

  v10 = [MEMORY[0x263F3F7C8] identityForIdentifier:v9 workspaceIdentifier:@"com.apple.DashBoard.scene-workspace.user-alert"];
  v11 = [(DBUserAlert *)self environmentConfiguration];
  [v11 currentSafeViewAreaFrame];
  double v13 = v12;
  double v15 = v14;

  double v17 = *MEMORY[0x263F00148];
  double v16 = *(double *)(MEMORY[0x263F00148] + 8);
  BOOL v18 = [(DBUserAlert *)self requiresSafeAreaWindow];
  BOOL v19 = v18;
  if (v18)
  {
    [(DBUserAlert *)self safeAreaInsets];
    double v17 = v17 + v20;
    double v16 = v16 + v21;
    double v13 = v13 - (v20 + v22);
    double v15 = v15 - (v21 + v23);
  }
  v24 = DBLogForCategory(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v44.origin.double x = v17;
    v44.origin.double y = v16;
    v44.size.double width = v13;
    v44.size.double height = v15;
    v25 = NSStringFromRect(v44);
    [(DBUserAlert *)self safeAreaInsets];
    __int16 v26 = NSStringFromUIEdgeInsets(v45);
    *(_DWORD *)buf = 138412546;
    v40 = v25;
    __int16 v41 = 2112;
    v42 = v26;
    _os_log_impl(&dword_22D6F0000, v24, OS_LOG_TYPE_INFO, "creating user alert with frame %@, safeAreaInsets: %@", buf, 0x16u);
  }
  v27 = [DBLocalSceneController alloc];
  uint64_t v28 = [(DBUserAlert *)self environmentConfiguration];
  NSRect v29 = [v28 displayConfiguration];
  UIEdgeInsets v30 = -[DBLocalSceneController initWithDisplayConfiguration:frame:sceneIdentity:](v27, "initWithDisplayConfiguration:frame:sceneIdentity:", v29, v10, v17, v16, v13, v15);
  [(DBUserAlert *)self setLocalSceneController:v30];

  id v31 = objc_alloc(MEMORY[0x263F82E88]);
  v32 = [(DBUserAlert *)self localSceneController];
  v33 = [v32 clientScene];
  v34 = objc_msgSend(v31, "_initWithFrame:debugName:scene:attached:", v9, v33, 0, v17, v16, v13, v15);
  [(DBUserAlert *)self setWindow:v34];

  v35 = [(DBUserAlert *)self _alertViewController];
  if (!v19)
  {
    [(DBUserAlert *)self safeAreaInsets];
    objc_msgSend(v35, "setAdditionalSafeAreaInsets:");
  }
  v36 = [(DBUserAlert *)self window];
  [v36 setRootViewController:v35];

  v37 = [(DBUserAlert *)self window];
  [v37 setHidden:0];

  v38 = DBLogForCategory(0);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v38, OS_LOG_TYPE_INFO, "created user alert scene", buf, 2u);
  }
}

- (id)_alertViewController
{
  int64_t v3 = [(DBUserAlert *)self preferredPresentationStyle];
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      id v4 = DBLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = DBLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
LABEL_9:
      }
        [(DBUserAlert *)v4 _alertViewController];
    }

    v24 = [DBUserAlertModalViewController alloc];
    double v21 = [(DBUserAlert *)self alert];
    double v23 = [(DBUserAlertModalViewController *)v24 initWithAlert:v21];
    goto LABEL_11;
  }
  double v12 = DBLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    [(DBUserAlert *)v12 _alertViewController];
  }

  double v20 = [DBUserAlertSheetViewController alloc];
  double v21 = [(DBUserAlert *)self alert];
  double v22 = [(DBUserAlert *)self environmentConfiguration];
  double v23 = [(DBUserAlertSheetViewController *)v20 initWithAlert:v21 environmentConfiguration:v22];

LABEL_11:
  return v23;
}

- (URTAlert)alert
{
  return self->_alert;
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (DBLocalSceneController)localSceneController
{
  return self->_localSceneController;
}

- (void)setLocalSceneController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSceneController, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

- (void)_alertViewController
{
}

@end