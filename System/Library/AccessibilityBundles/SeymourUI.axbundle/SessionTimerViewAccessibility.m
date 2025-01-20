@interface SessionTimerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)updateDuration:(double)a3;
@end

@implementation SessionTimerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionTimerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)updateDuration:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SessionTimerViewAccessibility;
  -[SessionTimerViewAccessibility updateDuration:](&v10, sel_updateDuration_);
  uint64_t v5 = ((int)a3 % 60);
  v6 = NSString;
  if ((int)a3 < 60)
  {
    v7 = accessibilityLocalizedString(@"countdown.short.format");
    objc_msgSend(v6, "stringWithFormat:", v7, v5, v9);
  }
  else
  {
    v7 = accessibilityLocalizedString(@"countdown.long.format");
    objc_msgSend(v6, "stringWithFormat:", v7, (int)a3 / 0x3CuLL, v5);
  v8 = };

  [(SessionTimerViewAccessibility *)self setAccessibilityLabel:v8];
}

@end