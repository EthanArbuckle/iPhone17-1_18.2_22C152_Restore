@interface _TVLoadingOverlayWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityCanBeConsideredAsMainWindow;
@end

@implementation _TVLoadingOverlayWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVLoadingOverlayWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  objc_opt_class();
  v3 = [(_TVLoadingOverlayWindowAccessibility *)self safeValueForKey:@"subviews"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 count] != 1) {
    _AXAssert();
  }
  v5 = [v4 firstObject];
  char v6 = [v5 _accessibilityViewIsVisible];

  return v6;
}

@end