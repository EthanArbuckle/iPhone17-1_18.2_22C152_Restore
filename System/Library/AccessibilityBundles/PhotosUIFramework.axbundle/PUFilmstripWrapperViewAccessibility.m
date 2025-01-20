@interface PUFilmstripWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
@end

@implementation PUFilmstripWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUFilmstripWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)canBecomeFocused
{
  if ([(PUFilmstripWrapperViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)PUFilmstripWrapperViewAccessibility;
  return [(PUFilmstripWrapperViewAccessibility *)&v4 canBecomeFocused];
}

@end