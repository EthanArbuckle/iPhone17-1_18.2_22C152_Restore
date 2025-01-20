@interface AVMobileTitlebarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AVMobileTitlebarViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation AVMobileTitlebarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileTitlebarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVMobileTitlebarView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"AVMobileTitlebarView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"AVMobileTitlebarView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)AVMobileTitlebarViewAccessibility;
  [(AVMobileTitlebarViewAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(AVMobileTitlebarViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_265101948;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityLabelBlock:v7];

  v4 = [(AVMobileTitlebarViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_265101948;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v2 = [WeakRetained safeValueForKey:@"titleLabel"];
  id v3 = __UIAccessibilityCastAsClass();

  v4 = [v3 text];

  return v4;
}

id __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v2 = [WeakRetained safeValueForKey:@"subtitleLabel"];
  id v3 = __UIAccessibilityCastAsClass();

  v4 = [v3 text];

  return v4;
}

- (AVMobileTitlebarViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileTitlebarViewAccessibility;
  id v3 = -[AVMobileTitlebarViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AVMobileTitlebarViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileTitlebarViewAccessibility;
  [(AVMobileTitlebarViewAccessibility *)&v3 layoutSubviews];
  [(AVMobileTitlebarViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end