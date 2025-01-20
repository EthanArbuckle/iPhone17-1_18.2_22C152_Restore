@interface CCUILowPowerModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation CCUILowPowerModule

- (void)setContentModuleContext:(id)a3
{
}

- (id)contentViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(CCUILowPowerModuleViewController);
  [(CCUIMenuModuleViewController *)v4 setContentModuleContext:self->_contentModuleContext];

  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void).cxx_destruct
{
}

@end