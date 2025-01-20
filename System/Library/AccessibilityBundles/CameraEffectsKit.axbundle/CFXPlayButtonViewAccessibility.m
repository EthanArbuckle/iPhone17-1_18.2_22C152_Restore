@interface CFXPlayButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)playButtonTapped:(id)a3;
@end

@implementation CFXPlayButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXPlayButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPlayButtonView", @"playButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPlayButtonView", @"playButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CFXPlayButtonViewAccessibility *)self safeValueForKey:@"playButton"];
  int v3 = [v2 safeBoolForKey:@"selected"];

  if (v3) {
    v4 = @"pause.button";
  }
  else {
    v4 = @"play.button";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CFXPlayButtonViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CFXPlayButtonViewAccessibility *)&v3 accessibilityTraits];
}

- (void)playButtonTapped:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CFXPlayButtonViewAccessibility;
  [(CFXPlayButtonViewAccessibility *)&v6 playButtonTapped:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  v5 = [(CFXPlayButtonViewAccessibility *)self accessibilityContainer];
  UIAccessibilityPostNotification(v4, v5);
}

@end