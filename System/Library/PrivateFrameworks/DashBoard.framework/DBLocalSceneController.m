@interface DBLocalSceneController
- (DBLocalSceneController)initWithDisplayConfiguration:(id)a3 frame:(CGRect)a4 sceneIdentity:(id)a5;
- (FBSScene)clientScene;
- (FBScene)scene;
- (NSMutableDictionary)secondaryScenePresentersByIdentifier;
- (UIScenePresentation)presentationView;
- (UIScenePresenter)scenePresenter;
- (id)presentationViewWithIdentifier:(id)a3;
- (void)invalidate;
- (void)invalidatePresentationViewForIdentifier:(id)a3;
- (void)setScene:(id)a3;
- (void)setScenePresenter:(id)a3;
- (void)setSecondaryScenePresentersByIdentifier:(id)a3;
@end

@implementation DBLocalSceneController

- (DBLocalSceneController)initWithDisplayConfiguration:(id)a3 frame:(CGRect)a4 sceneIdentity:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  v37.receiver = self;
  v37.super_class = (Class)DBLocalSceneController;
  v13 = [(DBLocalSceneController *)&v37 init];
  if (v13)
  {
    v14 = [MEMORY[0x263F3F760] definition];
    [v14 setIdentity:v12];
    v15 = [MEMORY[0x263F3F7A8] localIdentity];
    [v14 setClientIdentity:v15];

    v16 = [MEMORY[0x263F82480] specification];
    [v14 setSpecification:v16];

    v17 = (void *)MEMORY[0x263F3F768];
    v18 = [v14 specification];
    v19 = [v17 parametersForSpecification:v18];

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __75__DBLocalSceneController_initWithDisplayConfiguration_frame_sceneIdentity___block_invoke;
    v31[3] = &unk_2649B6440;
    id v32 = v11;
    CGFloat v33 = x;
    CGFloat v34 = y;
    CGFloat v35 = width;
    CGFloat v36 = height;
    [v19 updateSettingsWithBlock:v31];
    v20 = DBLogForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v12;
      _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "[DBLocalSceneController] Creating local scene %{public}@", buf, 0xCu);
    }

    v21 = [MEMORY[0x263F3F4F0] sharedInstance];
    uint64_t v22 = [v21 createSceneWithDefinition:v14 initialParameters:v19];
    scene = v13->_scene;
    v13->_scene = (FBScene *)v22;

    v24 = [(FBScene *)v13->_scene uiPresentationManager];
    uint64_t v25 = [v24 createPresenterWithIdentifier:@"LocalSceneHost"];
    scenePresenter = v13->_scenePresenter;
    v13->_scenePresenter = (UIScenePresenter *)v25;

    [(UIScenePresenter *)v13->_scenePresenter modifyPresentationContext:&__block_literal_global_36];
    [(UIScenePresenter *)v13->_scenePresenter activate];
    v27 = [MEMORY[0x263F3F438] sharedInstance];
    uint64_t v28 = [v27 fbsSceneForScene:v13->_scene];
    clientScene = v13->_clientScene;
    v13->_clientScene = (FBSScene *)v28;
  }
  return v13;
}

void __75__DBLocalSceneController_initWithDisplayConfiguration_frame_sceneIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [v4 setInterfaceOrientation:1];
  [v4 setStatusBarDisabled:1];
  [v4 setForeground:1];
}

void __75__DBLocalSceneController_initWithDisplayConfiguration_frame_sceneIdentity___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:0];
  id v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColorWhileHosting:v3];
}

- (UIScenePresentation)presentationView
{
  id v2 = [(DBLocalSceneController *)self scenePresenter];
  id v3 = [v2 presentationView];

  return (UIScenePresentation *)v3;
}

- (id)presentationViewWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(DBLocalSceneController *)self secondaryScenePresentersByIdentifier];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(DBLocalSceneController *)self setSecondaryScenePresentersByIdentifier:v6];
  }
  v7 = [(DBLocalSceneController *)self secondaryScenePresentersByIdentifier];
  v8 = [v7 objectForKey:v4];

  if (!v8)
  {
    v8 = [(DBLocalSceneController *)self scene];
    if (v8)
    {
      v14 = [(DBLocalSceneController *)self scene];
      v15 = [v14 uiPresentationManager];
      char v16 = [v15 isInvalidated];

      if (v16)
      {
        v8 = 0;
      }
      else
      {
        v17 = [(DBLocalSceneController *)self scene];
        v18 = [v17 uiPresentationManager];
        v8 = [v18 createPresenterWithIdentifier:v4 priority:100];

        [v8 modifyPresentationContext:&__block_literal_global_12];
        v19 = [(DBLocalSceneController *)self secondaryScenePresentersByIdentifier];
        objc_msgSend(v19, "bs_setSafeObject:forKey:", v8, v4);
      }
    }
  }
  v9 = DBLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(DBLocalSceneController *)self scene];
    id v11 = [v10 identity];
    int v20 = 138543362;
    v21 = v11;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "[DBLocalSceneController] Activating presenter for local scene %{public}@", (uint8_t *)&v20, 0xCu);
  }
  [v8 activate];
  id v12 = [v8 presentationView];

  return v12;
}

void __57__DBLocalSceneController_presentationViewWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:1];
  id v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColorWhileHosting:v3];
}

- (void)invalidatePresentationViewForIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DBLocalSceneController *)self scene];
    v7 = [v6 identity];
    int v11 = 138543362;
    id v12 = v7;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBLocalSceneController] Invalidating presenter for local scene %{public}@", (uint8_t *)&v11, 0xCu);
  }
  v8 = [(DBLocalSceneController *)self secondaryScenePresentersByIdentifier];
  v9 = [v8 objectForKey:v4];

  [v9 invalidate];
  v10 = [(DBLocalSceneController *)self secondaryScenePresentersByIdentifier];
  [v10 removeObjectForKey:v4];
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = DBLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DBLocalSceneController *)self scene];
    v5 = [v4 identity];
    int v11 = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "[DBLocalSceneController] Invalidating local scene %{public}@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [(DBLocalSceneController *)self scene];
  [v6 updateSettingsWithBlock:&__block_literal_global_15];

  v7 = [(DBLocalSceneController *)self scene];
  [v7 invalidate];

  [(DBLocalSceneController *)self setScene:0];
  v8 = [(DBLocalSceneController *)self scenePresenter];
  [v8 invalidate];

  v9 = [(DBLocalSceneController *)self secondaryScenePresentersByIdentifier];
  [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_18];

  v10 = [(DBLocalSceneController *)self secondaryScenePresentersByIdentifier];
  [v10 removeAllObjects];
}

uint64_t __36__DBLocalSceneController_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

uint64_t __36__DBLocalSceneController_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (FBSScene)clientScene
{
  return self->_clientScene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (void)setScenePresenter:(id)a3
{
}

- (NSMutableDictionary)secondaryScenePresentersByIdentifier
{
  return self->_secondaryScenePresentersByIdentifier;
}

- (void)setSecondaryScenePresentersByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryScenePresentersByIdentifier, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_clientScene, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end