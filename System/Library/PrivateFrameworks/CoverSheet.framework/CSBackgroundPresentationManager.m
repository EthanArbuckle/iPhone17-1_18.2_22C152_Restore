@interface CSBackgroundPresentationManager
- (BLSHGenericSceneDelegateWithActionHandlers)sceneDelegate;
- (CSBackgroundPresentationManager)init;
- (FBScene)currentScene;
- (FBSceneWorkspace)sceneWorkspace;
- (UIScenePresenter)scenePresenter;
- (id)createBackgroundViewControllerForDefinition:(id)a3 frame:(CGRect)a4;
- (void)dealloc;
@end

@implementation CSBackgroundPresentationManager

- (CSBackgroundPresentationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSBackgroundPresentationManager;
  v2 = [(CSBackgroundPresentationManager *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F624B0]);
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = [v3 initWithIdentifier:v5];
    sceneWorkspace = v2->_sceneWorkspace;
    v2->_sceneWorkspace = (FBSceneWorkspace *)v6;

    v8 = (BLSHGenericSceneDelegateWithActionHandlers *)objc_alloc_init(MEMORY[0x1E4F4F570]);
    sceneDelegate = v2->_sceneDelegate;
    v2->_sceneDelegate = v8;

    v10 = [MEMORY[0x1E4F4F580] sharedService];
    [v10 registerSceneWorkspace:v2->_sceneWorkspace];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F4F580] sharedService];
  [v3 deregisterSceneWorkspace:self->_sceneWorkspace];

  [(FBSceneWorkspace *)self->_sceneWorkspace invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CSBackgroundPresentationManager;
  [(CSBackgroundPresentationManager *)&v4 dealloc];
}

- (id)createBackgroundViewControllerForDefinition:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = [v9 clientBundleIdentifier];
  v11 = [MEMORY[0x1E4FA7C40] specification];
  objc_super v12 = [MEMORY[0x1E4F96408] identityForAngelJobLabel:v10];
  v13 = [MEMORY[0x1E4F62470] identityForProcessIdentity:v12];
  v14 = [(CSBackgroundPresentationManager *)self sceneWorkspace];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__CSBackgroundPresentationManager_createBackgroundViewControllerForDefinition_frame___block_invoke;
  v22[3] = &unk_1E6ADA4F0;
  id v23 = v9;
  id v24 = v11;
  id v25 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v9;
  v18 = [v14 createScene:v22];
  currentScene = self->_currentScene;
  self->_currentScene = v18;

  [(FBScene *)self->_currentScene setDelegate:self->_sceneDelegate];
  v20 = -[CSBackgroundContentViewController initWithScene:frame:]([CSBackgroundContentViewController alloc], "initWithScene:frame:", self->_currentScene, x, y, width, height);

  return v20;
}

void __85__CSBackgroundPresentationManager_createBackgroundViewControllerForDefinition_frame___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v5 = a2;
  objc_super v4 = [v3 sceneIdentifier];
  [v5 setIdentifier:v4];

  [v5 setSpecification:a1[5]];
  [v5 setClientIdentity:a1[6]];
}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (FBScene)currentScene
{
  return self->_currentScene;
}

- (BLSHGenericSceneDelegateWithActionHandlers)sceneDelegate
{
  return self->_sceneDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDelegate, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);

  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
}

@end