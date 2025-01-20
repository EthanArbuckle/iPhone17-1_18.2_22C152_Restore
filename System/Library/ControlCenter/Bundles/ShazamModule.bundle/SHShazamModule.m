@interface SHShazamModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (SHShazamMenuModuleViewController)shazamMenuModuleViewController;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setShazamMenuModuleViewController:(id)a3;
@end

@implementation SHShazamModule

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  id v5 = a3;
  [(SHShazamMenuModuleViewController *)self->_shazamMenuModuleViewController setContentModuleContext:v5];
}

- (id)contentViewControllerForContext:(id)a3
{
  shazamMenuModuleViewController = self->_shazamMenuModuleViewController;
  if (!shazamMenuModuleViewController)
  {
    id v5 = objc_alloc_init(SHShazamMenuModuleViewController);
    v6 = self->_shazamMenuModuleViewController;
    self->_shazamMenuModuleViewController = v5;

    [(SHShazamMenuModuleViewController *)self->_shazamMenuModuleViewController setContentModuleContext:self->_contentModuleContext];
    shazamMenuModuleViewController = self->_shazamMenuModuleViewController;
  }

  return shazamMenuModuleViewController;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (SHShazamMenuModuleViewController)shazamMenuModuleViewController
{
  return self->_shazamMenuModuleViewController;
}

- (void)setShazamMenuModuleViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shazamMenuModuleViewController, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end