@interface SBSUIWallpaperButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_viewToAddFocusLayer;
@end

@implementation SBSUIWallpaperButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSUIWallpaperButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_viewToAddFocusLayer
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();

  return v2;
}

@end