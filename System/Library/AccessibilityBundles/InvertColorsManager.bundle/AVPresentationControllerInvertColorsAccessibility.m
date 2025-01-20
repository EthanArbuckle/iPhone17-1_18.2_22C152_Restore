@interface AVPresentationControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)presentationTransitionWillBegin;
@end

@implementation AVPresentationControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)presentationTransitionWillBegin
{
  v3.receiver = self;
  v3.super_class = (Class)AVPresentationControllerInvertColorsAccessibility;
  [(AVPresentationControllerInvertColorsAccessibility *)&v3 presentationTransitionWillBegin];
  [(AVPresentationControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v3 = [(AVPresentationControllerInvertColorsAccessibility *)self safeValueForKey:@"context"];
  v2 = [v3 safeUIViewForKey:@"backgroundView"];
  [v2 setAccessibilityIgnoreInvertIfDarkBackgroundColor:1];
}

@end