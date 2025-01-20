@interface AXInvertColors_Wallpaper
+ (id)bundleName;
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_Wallpaper

+ (void)performValidations:(id)a3
{
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"WallpaperControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"WallpaperMagicTableCategoryButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"WallpaperPhotoCellInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 4;
}

+ (id)bundleName
{
  return @"Wallpaper.bundle";
}

@end