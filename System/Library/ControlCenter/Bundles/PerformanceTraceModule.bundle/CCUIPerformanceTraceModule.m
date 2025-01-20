@interface CCUIPerformanceTraceModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (CCUIPerformanceTraceModuleViewController)viewController;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation CCUIPerformanceTraceModule

- (void)setContentModuleContext:(id)a3
{
}

- (id)contentViewControllerForContext:(id)a3
{
  viewController = self->_viewController;
  if (!viewController)
  {
    v5 = objc_alloc_init(CCUIPerformanceTraceModuleViewController);
    v6 = objc_msgSend(MEMORY[0x263F086E0], "ccui_bundleForModuleInstance:", self);
    v7 = objc_msgSend(v6, "ccui_displayName");
    [(CCUIButtonModuleViewController *)v5 setTitle:v7];

    v8 = self->_viewController;
    self->_viewController = v5;
    v9 = v5;

    [(CCUIPerformanceTraceModuleViewController *)self->_viewController setContentModuleContext:self->_contentModuleContext];
    viewController = self->_viewController;
  }

  return viewController;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (CCUIPerformanceTraceModuleViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end