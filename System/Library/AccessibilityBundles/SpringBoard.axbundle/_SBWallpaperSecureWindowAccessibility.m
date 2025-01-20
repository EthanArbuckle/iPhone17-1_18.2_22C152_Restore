@interface _SBWallpaperSecureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation _SBWallpaperSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SBWallpaperSecureWindow";
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