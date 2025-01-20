@interface HearingDevicesCCContentModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)isEnabled;
- (CCUIContentModuleContext)contentModuleContext;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation HearingDevicesCCContentModule

- (BOOL)isEnabled
{
  return 1;
}

- (id)contentViewControllerForContext:(id)a3
{
  moduleViewController = self->_moduleViewController;
  if (!moduleViewController)
  {
    v6 = objc_alloc_init(HearingDevicesCCModuleViewController);
    v7 = self->_moduleViewController;
    self->_moduleViewController = v6;

    moduleViewController = self->_moduleViewController;
  }
  v8 = objc_msgSend_contentModuleContext(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setContentModuleContext_(moduleViewController, v9, (uint64_t)v8, v10);

  v11 = self->_moduleViewController;

  return v11;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
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

  objc_storeStrong((id *)&self->_moduleViewController, 0);
}

@end