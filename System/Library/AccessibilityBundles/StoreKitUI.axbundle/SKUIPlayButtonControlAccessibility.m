@interface SKUIPlayButtonControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_showPlayIndicator:(BOOL)a3;
- (void)beginIndeterminateAnimation;
- (void)endIndeterminateAnimation;
@end

@implementation SKUIPlayButtonControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIPlayButtonControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIPlayButtonControl", @"_showPlayIndicator:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIPlayButtonControl", @"beginIndeterminateAnimation", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIPlayButtonControl", @"endIndeterminateAnimation", "v", 0);
}

- (void)_showPlayIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKUIPlayButtonControlAccessibility;
  -[SKUIPlayButtonControlAccessibility _showPlayIndicator:](&v7, sel__showPlayIndicator_);
  if (v3) {
    v5 = @"play.button";
  }
  else {
    v5 = @"pause.button";
  }
  v6 = accessibilitySKUILocalizedString(v5);
  [(SKUIPlayButtonControlAccessibility *)self setAccessibilityLabel:v6];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  [(SKUIPlayButtonControlAccessibility *)self safeFloatForKey:@"_progress"];
  if (v2 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    BOOL v3 = NSString;
    v4 = accessibilitySKUILocalizedString(@"playback.progress");
    v5 = AXFormatFloatWithPercentage();
    v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIPlayButtonControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SKUIPlayButtonControlAccessibility *)&v3 accessibilityTraits];
}

- (void)beginIndeterminateAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIPlayButtonControlAccessibility;
  [(SKUIPlayButtonControlAccessibility *)&v4 beginIndeterminateAnimation];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  objc_super v3 = accessibilitySKUILocalizedString(@"indeterminate.playback");
  UIAccessibilityPostNotification(v2, v3);
}

- (void)endIndeterminateAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)SKUIPlayButtonControlAccessibility;
  [(SKUIPlayButtonControlAccessibility *)&v2 endIndeterminateAnimation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end