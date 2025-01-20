@interface TVRKeyboardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TVRKeyboardViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVRKeyboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRKeyboardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)TVRKeyboardViewAccessibility;
  [(TVRKeyboardViewAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v3 = [(TVRKeyboardViewAccessibility *)self safeValueForKey:@"navigationBar"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityLocalizedString(@"tv.button.dictation.label");
  v6 = [v4 topItem];
  v7 = [v6 rightBarButtonItem];
  [v7 setAccessibilityLabel:v5];

  v8 = accessibilityLocalizedString(@"tv.button.dictation.hint");
  v9 = [v4 topItem];
  v10 = [v9 rightBarButtonItem];
  [v10 setAccessibilityHint:v8];
}

- (TVRKeyboardViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TVRKeyboardViewAccessibility;
  v3 = -[TVRKeyboardViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TVRKeyboardViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end