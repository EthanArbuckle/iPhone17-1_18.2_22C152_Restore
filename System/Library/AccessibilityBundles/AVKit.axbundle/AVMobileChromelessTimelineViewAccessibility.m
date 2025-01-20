@interface AVMobileChromelessTimelineViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AVMobileChromelessTimelineViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVMobileChromelessTimelineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileChromelessTimelineView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVMobileChromelessTimelineView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"AVMobileChromelessTimelineView" hasInstanceVariable:@"_leadingLabel" withType:"AVLabel"];
  [v3 validateClass:@"AVMobileChromelessTimelineView" hasInstanceVariable:@"_trailingLabel" withType:"AVLabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)AVMobileChromelessTimelineViewAccessibility;
  [(AVMobileChromelessTimelineViewAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(AVMobileChromelessTimelineViewAccessibility *)self safeValueForKey:@"leadingLabel"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__AVMobileChromelessTimelineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_265101948;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityLabelBlock:v7];

  v4 = [(AVMobileChromelessTimelineViewAccessibility *)self safeValueForKey:@"trailingLabel"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __89__AVMobileChromelessTimelineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_265101948;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __89__AVMobileChromelessTimelineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v2 = [WeakRetained safeValueForKey:@"leadingLabel"];
  id v3 = __UIAccessibilityCastAsClass();

  if (v3)
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"media.time.elapsed");
    id v6 = [v3 text];
    v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __89__AVMobileChromelessTimelineViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v2 = [WeakRetained safeValueForKey:@"trailingLabel"];
  id v3 = __UIAccessibilityCastAsClass();

  if (v3)
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"media.time.remaining");
    id v6 = [v3 text];
    v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AVMobileChromelessTimelineViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessTimelineViewAccessibility;
  id v3 = -[AVMobileChromelessTimelineViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AVMobileChromelessTimelineViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end