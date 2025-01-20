@interface _UIKeyboardPopoverAffordanceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation _UIKeyboardPopoverAffordanceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyboardPopoverAffordance";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"keyboard.floating.grabber");
}

- (id)accessibilityHint
{
  char v6 = 0;
  char v4 = 0;
  if ([MEMORY[0x263F1C738] isFloatingForced])
  {
    id v7 = accessibilityLocalizedString(@"keyboard.floating.grabber.hint.floating.forced");
    char v6 = 1;
    id v2 = v7;
  }
  else
  {
    id v5 = accessibilityLocalizedString(@"keyboard.floating.grabber.hint.default");
    char v4 = 1;
    id v2 = v5;
  }
  v8 = v2;
  if (v4) {

  }
  if (v6) {

  }
  return v8;
}

- (BOOL)accessibilityActivate
{
  return [MEMORY[0x263F1C738] isFloating] & 1;
}

@end