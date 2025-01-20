@interface CARSettingsWindowSceneDelegate
- (CARSessionStatus)sessionStatus;
- (CARSettingsViewController)viewController;
- (UIWindow)settingsWindow;
- (void)connectToWindowScene:(id)a3;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setSettingsWindow:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation CARSettingsWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 role];
    unsigned int v9 = [v8 isEqualToString:_UIWindowSceneSessionRoleCarPlay];

    if (v9)
    {
      id v10 = [objc_alloc((Class)CARSessionStatus) initAndWaitUntilSessionUpdated];
      [(CARSettingsWindowSceneDelegate *)self setSessionStatus:v10];

      [(CARSettingsWindowSceneDelegate *)self connectToWindowScene:v11];
    }
  }
}

- (void)connectToWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)UIWindow) initWithWindowScene:v4];

  [(CARSettingsWindowSceneDelegate *)self setSettingsWindow:v5];
  v6 = [(CARSettingsWindowSceneDelegate *)self settingsWindow];
  [v6 setAutoresizesSubviews:1];

  id v7 = [(CARSettingsWindowSceneDelegate *)self settingsWindow];
  [v7 setAutoresizingMask:18];

  v8 = [CARSettingsViewController alloc];
  unsigned int v9 = [(CARSettingsWindowSceneDelegate *)self sessionStatus];
  id v10 = [(CARSettingsViewController *)v8 initWithSessionStatus:v9];
  [(CARSettingsWindowSceneDelegate *)self setViewController:v10];

  id v11 = [(CARSettingsWindowSceneDelegate *)self viewController];
  v12 = [(CARSettingsWindowSceneDelegate *)self settingsWindow];
  [v12 setRootViewController:v11];

  v13 = [(CARSettingsWindowSceneDelegate *)self settingsWindow];
  [v13 makeKeyAndVisible];

  id v14 = [(CARSettingsWindowSceneDelegate *)self settingsWindow];
  [v14 setHidden:0];
}

- (void)sceneDidDisconnect:(id)a3
{
  [(CARSettingsViewController *)self->_viewController invalidate];
  settingsWindow = self->_settingsWindow;
  self->_settingsWindow = 0;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = +[CARSettingsAppDelegate sharedDelegate];
  v3 = [v4 signpostManager];
  [v3 emitRenderedIfNeeded];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v15 = a4;
  id v5 = [(CARSettingsWindowSceneDelegate *)self sessionStatus];
  v6 = [v5 currentSession];
  id v7 = [v6 configuration];
  unsigned int v8 = [v7 supportsVehicleData];

  unsigned int v9 = v15;
  if (v8)
  {
    id v10 = [v15 allObjects];
    id v11 = [v10 firstObject];
    v12 = [v11 URL];

    if (v12)
    {
      v13 = +[CARSettingsAppDelegate sharedDelegate];
      id v14 = [v13 carManager];
      [v14 openSettingsURL:v12];
    }
    unsigned int v9 = v15;
  }
}

- (UIWindow)settingsWindow
{
  return self->_settingsWindow;
}

- (void)setSettingsWindow:(id)a3
{
}

- (CARSettingsViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_settingsWindow, 0);
}

@end