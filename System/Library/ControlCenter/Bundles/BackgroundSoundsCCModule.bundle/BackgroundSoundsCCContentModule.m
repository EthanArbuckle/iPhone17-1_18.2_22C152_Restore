@interface BackgroundSoundsCCContentModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)isEnabled;
- (CCUIContentModuleContext)contentModuleContext;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation BackgroundSoundsCCContentModule

- (BOOL)isEnabled
{
  return 1;
}

- (id)contentViewControllerForContext:(id)a3
{
  moduleViewController = self->_moduleViewController;
  if (!moduleViewController)
  {
    v5 = objc_alloc_init(BackgroundSoundsCCModuleViewController);
    v6 = self->_moduleViewController;
    self->_moduleViewController = v5;

    moduleViewController = self->_moduleViewController;
  }
  v7 = [(BackgroundSoundsCCContentModule *)self contentModuleContext];
  [(BackgroundSoundsCCModuleViewController *)moduleViewController setContentModuleContext:v7];

  v8 = self->_moduleViewController;

  return v8;
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