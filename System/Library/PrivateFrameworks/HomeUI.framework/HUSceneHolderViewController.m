@interface HUSceneHolderViewController
- (HUSceneHolderViewController)initWithBundleIdentifier:(id)a3;
- (NSString)bundleId;
- (UIButton)closeButton;
- (void)_lookupScene;
- (void)_updateScene;
- (void)close:(id)a3;
- (void)dealloc;
- (void)sceneDidInvalidate:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUSceneHolderViewController

- (HUSceneHolderViewController)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSceneHolderViewController;
  v5 = [(HUSceneHolderViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;
  }
  return v5;
}

- (void)dealloc
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HUSceneHolderViewController.m" lineNumber:52 description:@"must dealloc (or could be in an explicit invalidate instead) on main thread as FBScene and FBSceneManager are main thread only"];
  }
  scene = self->_scene;
  if (scene)
  {
    [(FBScene *)scene removeObserver:self];
    v5 = [MEMORY[0x1E4F62490] sharedInstance];
    uint64_t v6 = [(FBScene *)self->_scene identifier];
    [v5 destroyScene:v6 withTransitionContext:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)HUSceneHolderViewController;
  [(HUSceneHolderViewController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  v46[4] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)HUSceneHolderViewController;
  [(HUSceneHolderViewController *)&v45 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  id v4 = [(HUSceneHolderViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x1E4F427E0] buttonWithType:7];
  [(HUSceneHolderViewController *)self setCloseButton:v5];

  uint64_t v6 = [(HUSceneHolderViewController *)self closeButton];
  [v6 addTarget:self action:sel_close_ forControlEvents:64];

  v7 = [(HUSceneHolderViewController *)self closeButton];
  [v7 setAlpha:0.9];

  objc_super v8 = [(HUSceneHolderViewController *)self view];
  objc_super v9 = [(HUSceneHolderViewController *)self closeButton];
  [v8 addSubview:v9];

  v10 = [(HUSceneHolderViewController *)self closeButton];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = (void *)MEMORY[0x1E4F28DC8];
  v43 = [(HUSceneHolderViewController *)self closeButton];
  v41 = [v43 trailingAnchor];
  v42 = [(HUSceneHolderViewController *)self view];
  v40 = [v42 safeAreaLayoutGuide];
  v39 = [v40 trailingAnchor];
  v38 = [v41 constraintEqualToAnchor:v39 constant:-40.0];
  v46[0] = v38;
  v37 = [(HUSceneHolderViewController *)self closeButton];
  v33 = [v37 topAnchor];
  v35 = [(HUSceneHolderViewController *)self view];
  v34 = [v35 safeAreaLayoutGuide];
  v11 = [v34 topAnchor];
  v12 = [v33 constraintEqualToAnchor:v11 constant:10.0];
  v46[1] = v12;
  v13 = [(HUSceneHolderViewController *)self closeButton];
  v14 = [v13 heightAnchor];
  v15 = [v14 constraintEqualToConstant:26.0];
  v46[2] = v15;
  v16 = [(HUSceneHolderViewController *)self closeButton];
  v17 = [v16 widthAnchor];
  v18 = [v17 constraintEqualToConstant:26.0];
  v46[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
  [v36 activateConstraints:v19];

  v20 = (void *)MEMORY[0x1E4F96408];
  v21 = [(HUSceneHolderViewController *)self bundleId];
  v22 = [v20 identityForEmbeddedApplicationIdentifier:v21];
  processIdentity = self->_processIdentity;
  self->_processIdentity = v22;

  v24 = [MEMORY[0x1E4F29128] UUID];
  v25 = [v24 UUIDString];

  v26 = (void *)MEMORY[0x1E4F62A60];
  v27 = [(HUSceneHolderViewController *)self bundleId];
  v28 = [v26 identityForIdentifier:v25 workspaceIdentifier:v27];
  sceneIdentity = self->_sceneIdentity;
  self->_sceneIdentity = v28;

  id v30 = objc_alloc(MEMORY[0x1E4F62400]);
  v31 = self->_processIdentity;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __42__HUSceneHolderViewController_viewDidLoad__block_invoke;
  v44[3] = &unk_1E638A6C8;
  v44[4] = self;
  v32 = (void *)[v30 initWithProcessIdentity:v31 executionContextProvider:v44];
  [v32 begin];
}

id __42__HUSceneHolderViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F62440]) initWithIdentity:*(void *)(*(void *)(a1 + 32) + 976)];
  [v1 setLaunchIntent:3];

  return v1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUSceneHolderViewController;
  [(HUSceneHolderViewController *)&v4 viewDidAppear:a3];
  self->_visible = 1;
  [(HUSceneHolderViewController *)self _updateScene];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUSceneHolderViewController;
  [(HUSceneHolderViewController *)&v4 viewWillDisappear:a3];
  self->_visible = 0;
  [(HUSceneHolderViewController *)self _updateScene];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HUSceneHolderViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__HUSceneHolderViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScene];
}

- (void)_lookupScene
{
  p_scene = &self->_scene;
  if (!self->_scene)
  {
    objc_super v4 = [MEMORY[0x1E4F62490] sharedInstance];
    v5 = [(FBSSceneIdentity *)self->_sceneIdentity identifier];
    id obj = [v4 sceneWithIdentifier:v5];

    if (obj)
    {
      [obj addObserver:self];
      objc_storeStrong((id *)p_scene, obj);
      [(HUSceneHolderViewController *)self _updateScene];
      uint64_t v6 = [(FBScene *)*p_scene uiPresentationManager];
      v7 = [NSString stringWithFormat:@"VC-Hoster for %@", self->_sceneIdentity];
      objc_super v8 = [v6 createPresenterWithIdentifier:v7];
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v8;

      [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_105];
      [(UIScenePresenter *)self->_scenePresenter activate];
      v10 = [(HUSceneHolderViewController *)self view];
      v11 = [(UIScenePresenter *)self->_scenePresenter presentationView];
      v12 = [(HUSceneHolderViewController *)self closeButton];
      [v10 insertSubview:v11 below:v12];
    }
  }
}

uint64_t __43__HUSceneHolderViewController__lookupScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAppearanceStyle:0];
}

- (void)_updateScene
{
  if (self->_visible)
  {
    v3 = [(HUSceneHolderViewController *)self view];
    if (self->_scene)
    {
      objc_super v4 = [(HUSceneHolderViewController *)self _screen];
      v5 = [v4 displayConfiguration];

      scene = self->_scene;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __43__HUSceneHolderViewController__updateScene__block_invoke;
      v28[3] = &unk_1E638A710;
      id v29 = v5;
      id v30 = v3;
      v7 = v5;
      [(FBScene *)scene updateSettingsWithBlock:v28];
    }
    else
    {
      if (self->_transaction) {
        goto LABEL_10;
      }
      id v9 = objc_alloc(MEMORY[0x1E4F62410]);
      processIdentity = self->_processIdentity;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __43__HUSceneHolderViewController__updateScene__block_invoke_2;
      v27[3] = &unk_1E638A6C8;
      v27[4] = self;
      v11 = (FBApplicationUpdateScenesTransaction *)[v9 initWithProcessIdentity:processIdentity executionContextProvider:v27];
      transaction = self->_transaction;
      self->_transaction = v11;

      v13 = self->_transaction;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __43__HUSceneHolderViewController__updateScene__block_invoke_3;
      v26[3] = &unk_1E6386730;
      v26[4] = self;
      v7 = self;
      [(FBApplicationUpdateScenesTransaction *)v13 setCompletionBlock:v26];
      v14 = (void *)MEMORY[0x1E4F629B8];
      v15 = [MEMORY[0x1E4F42788] specification];
      v16 = [v14 parametersForSpecification:v15];

      v17 = [(HUSceneHolderViewController *)v7 _screen];
      v18 = [v17 displayConfiguration];

      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __43__HUSceneHolderViewController__updateScene__block_invoke_4;
      v23 = &unk_1E638A738;
      id v24 = v18;
      id v25 = v3;
      id v19 = v18;
      [v16 updateSettingsWithBlock:&v20];
      -[FBApplicationUpdateScenesTransaction updateSceneWithIdentity:parameters:transitionContext:](self->_transaction, "updateSceneWithIdentity:parameters:transitionContext:", v7->_sceneIdentity, v16, 0, v20, v21, v22, v23);
      [(FBApplicationUpdateScenesTransaction *)self->_transaction begin];
    }
LABEL_10:

    return;
  }
  objc_super v8 = self->_scene;
  if (v8)
  {
    [(FBScene *)v8 updateSettingsWithBlock:&__block_literal_global_39_0];
  }
}

void __43__HUSceneHolderViewController__updateScene__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setForeground:1];
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v3, "setFrame:");
}

id __43__HUSceneHolderViewController__updateScene__block_invoke_2(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F62440]) initWithIdentity:*(void *)(*(void *)(a1 + 32) + 976)];
  [v1 setLaunchIntent:4];

  return v1;
}

uint64_t __43__HUSceneHolderViewController__updateScene__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1000);
  *(void *)(v2 + 1000) = 0;

  objc_super v4 = *(void **)(a1 + 32);

  return [v4 _lookupScene];
}

void __43__HUSceneHolderViewController__updateScene__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setForeground:1];
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v3, "setFrame:");
}

uint64_t __43__HUSceneHolderViewController__updateScene__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (void)sceneDidInvalidate:(id)a3
{
  if (self->_scene == a3)
  {
    [(UIScenePresenter *)self->_scenePresenter invalidate];
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;

    [(FBScene *)self->_scene removeObserver:self];
    scene = self->_scene;
    self->_scene = 0;

    [(HUSceneHolderViewController *)self _updateScene];
  }
}

- (void)close:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);

  objc_storeStrong((id *)&self->_processIdentity, 0);
}

@end