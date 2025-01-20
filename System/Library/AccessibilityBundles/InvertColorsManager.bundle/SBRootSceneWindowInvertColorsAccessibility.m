@interface SBRootSceneWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation SBRootSceneWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRootSceneWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  return 0;
}

@end