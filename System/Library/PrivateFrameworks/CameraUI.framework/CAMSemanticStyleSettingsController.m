@interface CAMSemanticStyleSettingsController
- (BOOL)_canShowWhileLocked;
- (CAMSemanticStyleSettingsController)init;
- (CAMSemanticStyleSettingsControllerDelegate)controllerDelegate;
- (CAMSemanticStyleSettingsRootController)_rootController;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)setControllerDelegate:(id)a3;
@end

@implementation CAMSemanticStyleSettingsController

- (CAMSemanticStyleSettingsController)init
{
  v14[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)CAMSemanticStyleSettingsController;
  v2 = [(CAMSemanticStyleSettingsController *)&v13 init];
  if (v2)
  {
    v3 = objc_alloc_init(CAMSemanticStyleSettingsRootController);
    rootController = v2->__rootController;
    v2->__rootController = v3;

    objc_initWeak(&location, v2);
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __42__CAMSemanticStyleSettingsController_init__block_invoke;
    v10 = &unk_263FA0E00;
    objc_copyWeak(&v11, &location);
    [(CAMSemanticStyleSettingsRootController *)v2->__rootController setCompletionBlock:&v7];
    v14[0] = v2->__rootController;
    v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v14, 1, v7, v8, v9, v10);
    [(CAMSemanticStyleSettingsController *)v2 setViewControllers:v5];

    [(CAMSemanticStyleSettingsController *)v2 setNavigationBarHidden:0];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__CAMSemanticStyleSettingsController_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained controllerDelegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 semanticStyleSettingsControllerDidDismiss:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CAMSemanticStyleSettingsControllerDelegate)controllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controllerDelegate);
  return (CAMSemanticStyleSettingsControllerDelegate *)WeakRetained;
}

- (void)setControllerDelegate:(id)a3
{
}

- (CAMSemanticStyleSettingsRootController)_rootController
{
  return self->__rootController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rootController, 0);
  objc_destroyWeak((id *)&self->_controllerDelegate);
}

@end