@interface ContinuityCaptureShieldUIDefaultSceneDelegate
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation ContinuityCaptureShieldUIDefaultSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v16 = a3;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v16;
    id v9 = [objc_alloc((Class)UIWindow) initWithWindowScene:v8];
    [v8 _setBackgroundStyle:4];
    v10 = [[ContinuityCaptureShieldUIPauseSceneComponent alloc] initWithScene:v8];
    [v8 _registerSceneComponent:v10 forKey:@"com.apple.ContinuityCaptureShieldUI.PauseComponent"];

    v11 = [ContinuityCaptureShieldUIViewController alloc];
    v12 = [v8 session];
    v13 = [v12 role];
    v14 = [(ContinuityCaptureShieldUIViewController *)v11 initWithSceneSessionRole:v13];

    [v9 setRootViewController:v14];
    [(ContinuityCaptureShieldUIBaseSceneDelegate *)self setWindow:v9];
    v15 = [v7 URLContexts];
    [(ContinuityCaptureShieldUIBaseSceneDelegate *)self scene:v8 openURLContexts:v15];

    [v9 makeKeyAndVisible];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ContinuityCaptureShieldUIDefaultSceneDelegate;
  id v3 = a3;
  [(ContinuityCaptureShieldUIBaseSceneDelegate *)&v4 sceneDidDisconnect:v3];
  [v3 _unregisterSceneComponentForKey:@"com.apple.ContinuityCaptureShieldUI.PauseComponent" receiver:v4.receiver super_class:v4.super_class];
}

@end