@interface FIUIActionButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
@end

@implementation FIUIActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIActionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityPath
{
  v7.receiver = self;
  v7.super_class = (Class)FIUIActionButtonAccessibility;
  v3 = [(FIUIActionButtonAccessibility *)&v7 accessibilityPath];
  if ([(FIUIActionButtonAccessibility *)self _accessibilityIsFKARunningForFocusItem]&& !v3)
  {
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    v5 = [v4 _backgroundView];

    if ([v5 _accessibilityViewIsVisible])
    {
      [v5 accessibilityFrame];
      v3 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

@end