@interface SUUIPlayButtonControlAccessibility
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

@implementation SUUIPlayButtonControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIPlayButtonControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIPlayButtonControl", @"_showPlayIndicator:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIPlayButtonControl", @"beginIndeterminateAnimation", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIPlayButtonControl", @"endIndeterminateAnimation", "v", 0);
}

- (void)_showPlayIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUUIPlayButtonControlAccessibility;
  -[SUUIPlayButtonControlAccessibility _showPlayIndicator:](&v7, sel__showPlayIndicator_);
  if (v3) {
    v5 = @"play.button";
  }
  else {
    v5 = @"pause.button";
  }
  v6 = accessibilityLocalizedString(v5);
  [(SUUIPlayButtonControlAccessibility *)self setAccessibilityLabel:v6];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  [(SUUIPlayButtonControlAccessibility *)self safeFloatForKey:@"_progress"];
  if (v2 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    BOOL v3 = NSString;
    v4 = accessibilityLocalizedString(@"playback.progress");
    v5 = AXFormatFloatWithPercentage();
    v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIPlayButtonControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SUUIPlayButtonControlAccessibility *)&v3 accessibilityTraits];
}

- (void)beginIndeterminateAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIPlayButtonControlAccessibility;
  [(SUUIPlayButtonControlAccessibility *)&v4 beginIndeterminateAnimation];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  objc_super v3 = accessibilityLocalizedString(@"indeterminate.playback");
  UIAccessibilityPostNotification(v2, v3);
}

- (void)endIndeterminateAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)SUUIPlayButtonControlAccessibility;
  [(SUUIPlayButtonControlAccessibility *)&v2 endIndeterminateAnimation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end