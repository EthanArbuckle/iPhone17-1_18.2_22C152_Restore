@interface CSBackgroundContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isScreenOff;
- (CSBackgroundContentViewController)initWithScene:(id)a3 frame:(CGRect)a4;
- (FBScene)scene;
- (UIScenePresentation)presentationView;
- (UIScenePresenter)scenePresenter;
- (id)sceneHostEnvironmentEntriesForBacklightSession;
- (void)_updateForegroundState;
- (void)_updateUserInterfaceStyle;
- (void)backlightLuminanceChangedForEnvironment:(id)a3 previousTraitCollection:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)tapGestureRecognizerAction:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSBackgroundContentViewController

- (CSBackgroundContentViewController)initWithScene:(id)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v37[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CSBackgroundContentViewController;
  v11 = [(CSBackgroundContentViewController *)&v35 init];
  v12 = v11;
  if (v11)
  {
    p_scene = (id *)&v11->_scene;
    objc_storeStrong((id *)&v11->_scene, a3);
    v37[0] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    id v15 = (id)[(CSBackgroundContentViewController *)v12 registerForTraitChanges:v14 withAction:sel_backlightLuminanceChangedForEnvironment_previousTraitCollection_];

    uint64_t v36 = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    id v17 = (id)[(CSBackgroundContentViewController *)v12 registerForTraitChanges:v16 withAction:sel_userInterfaceStyleChangedForEnvironment_previousTraitCollection_];

    id v18 = *p_scene;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __57__CSBackgroundContentViewController_initWithScene_frame___block_invoke;
    v29 = &unk_1E6AD9D70;
    v19 = v12;
    v30 = v19;
    CGFloat v31 = x;
    CGFloat v32 = y;
    CGFloat v33 = width;
    CGFloat v34 = height;
    [v18 updateSettingsWithBlock:&v26];
    v20 = objc_msgSend(*p_scene, "uiPresentationManager", v26, v27, v28, v29);
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    uint64_t v23 = [v20 createPresenterWithIdentifier:v22 priority:1];
    id v24 = v19[132];
    v19[132] = (id)v23;

    [v19[132] modifyPresentationContext:&__block_literal_global_11];
    [v19[132] activate];
    [*p_scene activateWithTransitionContext:0];
  }
  return v12;
}

void __57__CSBackgroundContentViewController_initWithScene_frame___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F62420];
  id v4 = a2;
  id v6 = [v3 mainConfiguration];
  [v4 setDisplayConfiguration:v6];
  v5 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __57__CSBackgroundContentViewController_initWithScene_frame___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:1];
}

- (void)dealloc
{
  [(FBScene *)self->_scene invalidate];
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSBackgroundContentViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = [(CSBackgroundContentViewController *)self scenePresenter];
  id v5 = [v3 presentationView];

  id v4 = [[CSBackgroundContentView alloc] initWithPresentationView:v5];
  [(CSBackgroundContentView *)v4 bs_setHitTestingDisabled:1];
  [(CSBackgroundContentViewController *)self setView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSBackgroundContentViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSBackgroundContentViewController *)self _updateForegroundState];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSBackgroundContentViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(CSBackgroundContentViewController *)self _updateForegroundState];
}

- (void)tapGestureRecognizerAction:(id)a3
{
  id v4 = a3;
  id v5 = [(CSBackgroundContentViewController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FA7C48]), "initWithLocation:", v7, v9);
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v11, 0);
  [(FBScene *)self->_scene sendActions:v10];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  objc_super v3 = [(FBScene *)self->_scene clientHandle];
  id v4 = [v3 bundleIdentifier];

  id v5 = [(FBScene *)self->_scene backlightSceneHostEnvironment];
  double v6 = [MEMORY[0x1E4FA5EB0] entryWithSceneHostEnvironment:v5 bundleIdentifier:v4];
  double v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];

  return v7;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)CSBackgroundContentViewController;
  id v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = (void *)MEMORY[0x1E4F4F680];
  [v7 transitionDuration];
  double v10 = v9;

  id v11 = [v8 settingsWithDuration:v10];
  scene = self->_scene;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__CSBackgroundContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E6AD9DB8;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  id v15 = v11;
  double v18 = width;
  double v19 = height;
  id v13 = v11;
  [(FBScene *)scene performUpdate:v14];
}

void __88__CSBackgroundContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F42D58];
  id v6 = a3;
  id v8 = a2;
  id v7 = [v5 _synchronizedDrawingFence];
  [v6 setAnimationFence:v7];

  [v6 setAnimationSettings:*(void *)(a1 + 32)];
  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)backlightLuminanceChangedForEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "_backlightLuminance", a3) != 0;
  if (((v5 ^ [(CSBackgroundContentViewController *)self isScreenOff]) & 1) == 0)
  {
    [(CSBackgroundContentViewController *)self _updateForegroundState];
  }
}

- (BOOL)isScreenOff
{
  id v2 = [(CSBackgroundContentViewController *)self traitCollection];
  BOOL v3 = [v2 _backlightLuminance] == 0;

  return v3;
}

- (void)_updateForegroundState
{
  BOOL v3 = [(CSBackgroundContentViewController *)self _appearState] != 0;
  char v4 = v3 & ~[(CSBackgroundContentViewController *)self isScreenOff];
  scene = self->_scene;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CSBackgroundContentViewController__updateForegroundState__block_invoke;
  v6[3] = &__block_descriptor_33_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  char v7 = v4;
  [(FBScene *)scene updateSettingsWithBlock:v6];
}

uint64_t __59__CSBackgroundContentViewController__updateForegroundState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateUserInterfaceStyle
{
  BOOL v3 = [(CSBackgroundContentViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  scene = self->_scene;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CSBackgroundContentViewController__updateUserInterfaceStyle__block_invoke;
  v6[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  void v6[4] = v4;
  [(FBScene *)scene updateSettingsWithBlock:v6];
}

uint64_t __62__CSBackgroundContentViewController__updateUserInterfaceStyle__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (UIScenePresentation)presentationView
{
  return self->_presentationView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end