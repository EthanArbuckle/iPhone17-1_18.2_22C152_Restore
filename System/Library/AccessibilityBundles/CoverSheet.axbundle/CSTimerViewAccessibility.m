@interface CSTimerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setAlpha:(double)a3;
@end

@implementation CSTimerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSTimerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSTimerView" hasInstanceVariable:@"_endDate" withType:"NSDate"];
  [v3 validateClass:@"CSTimerView" isKindOfClass:@"UIView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

- (id)accessibilityLabel
{
  v2 = [(CSTimerViewAccessibility *)self safeValueForKey:@"_endDate"];
  [v2 timeIntervalSinceNow];
  id v3 = MEMORY[0x245649F10](1);

  v4 = accessibilitySBLocalizedString(@"lock.screen.timer");
  v5 = __UIAXStringForVariables();

  return v5;
}

- (void)setAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSTimerViewAccessibility;
  -[CSTimerViewAccessibility setAlpha:](&v5, sel_setAlpha_);
  if (a3 == 1.0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812F8], self);
  }
}

@end