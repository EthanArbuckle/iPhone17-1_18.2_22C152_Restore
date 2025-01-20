@interface AXInvertColors_PosterBoard
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_PosterBoard

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBFGalleryEditingSceneViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PBFPosterGalleryPreviewViewController" isKindOfClass:@"UIViewController"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PBFPosterGalleryPreviewViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PBFGalleryEditingSceneViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"LockScreenPosterCollectionViewCell_InvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"HomeScreenPosterCollectionViewCell_InvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PBFPosterRackCollectionViewController_InvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PBFPosterGalleryPreviewViewController_InvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end