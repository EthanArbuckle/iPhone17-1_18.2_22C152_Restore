@interface WFUISceneDelegateRouter
- (UIWindowSceneDelegate)forwardingTarget;
- (WFUISceneDelegateRouter)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
@end

@implementation WFUISceneDelegateRouter

- (void).cxx_destruct
{
}

- (UIWindowSceneDelegate)forwardingTarget
{
  return self->_forwardingTarget;
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(WFUISceneDelegateRouter *)self forwardingTarget];
  [v5 sceneDidEnterBackground:v4];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(WFUISceneDelegateRouter *)self forwardingTarget];
  [v5 sceneDidDisconnect:v4];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WFUISceneDelegateRouter *)self forwardingTarget];
  [v11 scene:v10 willConnectToSession:v9 options:v8];
}

- (WFUISceneDelegateRouter)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFUISceneDelegateRouter;
  v2 = [(WFUISceneDelegateRouter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[WFAngelSceneManager sharedManager];
    forwardingTarget = v2->_forwardingTarget;
    v2->_forwardingTarget = (UIWindowSceneDelegate *)v3;

    id v5 = v2;
  }

  return v2;
}

@end