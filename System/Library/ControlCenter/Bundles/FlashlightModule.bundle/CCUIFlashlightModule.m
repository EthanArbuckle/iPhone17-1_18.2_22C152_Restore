@interface CCUIFlashlightModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (CCUIContentModuleBackgroundViewController)backgroundViewController;
- (CCUIContentModuleContentViewController)contentViewController;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
@end

@implementation CCUIFlashlightModule

- (id)contentViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(CCUIFlashlightModuleViewController);
  v5 = objc_msgSend(MEMORY[0x263F086E0], "ccui_bundleForModuleInstance:", self);
  v6 = objc_msgSend(v5, "ccui_displayName");
  [(CCUIButtonModuleViewController *)v4 setTitle:v6];

  v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"flashlight.off.fill"];
  [(CCUIButtonModuleViewController *)v4 setGlyphImage:v7];

  v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"flashlight.on.fill"];
  [(CCUIButtonModuleViewController *)v4 setSelectedGlyphImage:v8];

  v9 = [MEMORY[0x263F1C550] systemIndigoColor];
  [(CCUIButtonModuleViewController *)v4 setSelectedGlyphColor:v9];

  viewController = self->_viewController;
  p_viewController = &self->_viewController;
  if (!viewController) {
    objc_storeStrong((id *)p_viewController, v4);
  }

  return v4;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(CCUIFlashlightBackgroundViewController);
  backgroundViewController = self->_backgroundViewController;
  p_backgroundViewController = &self->_backgroundViewController;
  if (!backgroundViewController) {
    objc_storeStrong((id *)p_backgroundViewController, v4);
  }

  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return (CCUIContentModuleContentViewController *)self->_viewController;
}

- (CCUIContentModuleBackgroundViewController)backgroundViewController
{
  return (CCUIContentModuleBackgroundViewController *)self->_backgroundViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewController, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end