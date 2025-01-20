@interface MPAVAirPlayMirroringModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (CCUIContentModuleContext)contentModuleContext;
- (MRUMirroringViewController)mirroringViewController;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setMirroringViewController:(id)a3;
@end

@implementation MPAVAirPlayMirroringModule

- (id)contentViewControllerForContext:(id)a3
{
  mirroringViewController = self->_mirroringViewController;
  if (!mirroringViewController)
  {
    v5 = objc_alloc_init(MRUMirroringViewController);
    v6 = self->_mirroringViewController;
    self->_mirroringViewController = v5;

    [(CCUIMenuModuleViewController *)self->_mirroringViewController setContentModuleContext:self->_contentModuleContext];
    mirroringViewController = self->_mirroringViewController;
  }

  return mirroringViewController;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (MRUMirroringViewController)mirroringViewController
{
  return self->_mirroringViewController;
}

- (void)setMirroringViewController:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_mirroringViewController, 0);
}

@end