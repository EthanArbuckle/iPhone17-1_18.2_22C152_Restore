@interface FontsPreviewController
- (void)setupController;
@end

@implementation FontsPreviewController

- (void)setupController
{
  id v4 = objc_alloc_init((Class)PSSpecifier);
  v3 = objc_alloc_init(FontFamilyPreviewController);
  [(FontFamilyPreviewController *)v3 setRootController:self];
  [(FontFamilyPreviewController *)v3 setSpecifier:v4];
  [(FontFamilyPreviewController *)v3 setParentController:self];
  [(FontsPreviewController *)self showController:v3];
}

@end