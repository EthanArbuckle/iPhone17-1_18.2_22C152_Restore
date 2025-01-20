@interface CardButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CardButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CardButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CardButton" hasInstanceVariable:@"_actionButton" withType:"UIButton"];
  [v3 validateClass:@"CardButton" isKindOfClass:@"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)CardButtonAccessibility;
  [(CardButtonAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(CardButtonAccessibility *)self safeValueForKey:@"_actionButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 imageForState:0];
  if (MEMORY[0x245653140]())
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v6 = [v4 buttonType];

  if (v6 == 7)
  {
    v7 = [(CardButtonAccessibility *)self accessibilityIdentifier];
    int v8 = [v7 isEqualToString:@"CardButtonTypeShare"];

    if (v8) {
      v9 = @"SHARE_BUTTON";
    }
    else {
      v9 = @"CLOSE_BUTTON";
    }
    v5 = AXMapsLocString(v9);
    [v4 setAccessibilityLabel:v5];
    goto LABEL_7;
  }
LABEL_8:
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CardButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_26512D790;
  objc_copyWeak(&v11, &location);
  [v4 _setAccessibilityFrameBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

double __69__CardButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v3 = v2;

  return v3;
}

@end