@interface HULockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HULockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HULockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULockupView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULockupView", @"downloadControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUDownloadControl", @"controlStatus", "{HUDownloadControlStatus=qd}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)HULockupViewAccessibility;
  [(HULockupViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HULockupViewAccessibility *)self safeValueForKey:@"titleLabel"];
  LOBYTE(location) = 0;
  objc_opt_class();
  v4 = [(HULockupViewAccessibility *)self safeValueForKey:@"downloadControl"];
  v5 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v5);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HULockupViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2651283D0;
  objc_copyWeak(&v10, &location);
  id v6 = v3;
  id v8 = v6;
  v9 = self;
  [v5 setAccessibilityLabelBlock:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __71__HULockupViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [WeakRetained controlStatus];

  if ((unint64_t)(v3 - 3) > 1)
  {
    v9.receiver = a1[5];
    v9.super_class = (Class)HULockupViewAccessibility;
    v7 = objc_msgSendSuper2(&v9, sel_accessibilityLabel);
  }
  else
  {
    v4 = NSString;
    v5 = accessibilityHomeLocalizedString(@"item.updating");
    id v6 = [a1[4] accessibilityLabel];
    v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  }

  return v7;
}

@end