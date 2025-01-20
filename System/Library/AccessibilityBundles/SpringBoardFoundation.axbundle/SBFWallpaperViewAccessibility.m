@interface SBFWallpaperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation SBFWallpaperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFWallpaperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end