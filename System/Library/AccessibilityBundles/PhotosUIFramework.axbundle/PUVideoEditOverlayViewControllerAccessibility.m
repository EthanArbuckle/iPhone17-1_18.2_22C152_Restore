@interface PUVideoEditOverlayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axSubjectIndicatorWasFocused;
- (void)_setAXSubjectIndicatorWasFocused:(BOOL)a3;
- (void)_setState:(int64_t)a3 forView:(id)a4 animated:(BOOL)a5;
@end

@implementation PUVideoEditOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUVideoEditOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axSubjectIndicatorWasFocused
{
  return MEMORY[0x270F09620](self, &__PUVideoEditOverlayViewControllerAccessibility___axSubjectIndicatorWasFocused);
}

- (void)_setAXSubjectIndicatorWasFocused:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_setState:(int64_t)a3 forView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUVideoEditOverlayViewControllerAccessibility;
  [(PUVideoEditOverlayViewControllerAccessibility *)&v11 _setState:a3 forView:v8 animated:v5];
  if ((unint64_t)(a3 - 1) <= 4)
  {
    objc_opt_class();
    v9 = __UIAccessibilityCastAsClass();
    if ([v9 accessibilityElementIsFocused])
    {
    }
    else
    {
      BOOL v10 = [(PUVideoEditOverlayViewControllerAccessibility *)self _axSubjectIndicatorWasFocused];

      if (v10) {
        UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v8);
      }
    }
  }
}

@end