@interface AXInvertColors_VideosUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
@end

@implementation AXInvertColors_VideosUI

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"VUICollectionViewFeaturedCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"VUIImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end