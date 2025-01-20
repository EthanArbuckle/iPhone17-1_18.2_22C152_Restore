@interface CAMSmartStyleSettingsController
- (BOOL)_canShowWhileLocked;
- (CAMSmartStyleSettingsController)init;
- (CAMSmartStyleSettingsRootController)_rootController;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation CAMSmartStyleSettingsController

- (CAMSmartStyleSettingsController)init
{
  v8[1] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStyleSettingsController;
  v2 = [(CAMSmartStyleSettingsController *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(CAMSmartStyleSettingsRootController);
    rootController = v2->__rootController;
    v2->__rootController = v3;

    v8[0] = v2->__rootController;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [(CAMSmartStyleSettingsController *)v2 setViewControllers:v5];
  }
  return v2;
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

- (CAMSmartStyleSettingsRootController)_rootController
{
  return self->__rootController;
}

- (void).cxx_destruct
{
}

@end