@interface CapsuleNavigationBarRegistrationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CapsuleNavigationBarRegistrationAccessibility)initWithBar:(id)a3 barManager:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CapsuleNavigationBarRegistrationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CapsuleNavigationBarRegistration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CapsuleNavigationBarRegistration" hasInstanceVariable:@"_formatMenuButton" withType:"SFNavigationBarToggleButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CapsuleNavigationBarRegistration", @"initWithBar:barManager:", "@", "@", 0);
  [v3 validateClass:@"CapsuleNavigationBarRegistration" hasInstanceVariable:@"_buttonsByBarItem" withType:"NSMutableDictionary"];
  [v3 validateClass:@"CapsuleNavigationBarRegistration" hasInstanceVariable:@"_pageFormatItemState" withType:"Q"];
}

- (CapsuleNavigationBarRegistrationAccessibility)initWithBar:(id)a3 barManager:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CapsuleNavigationBarRegistrationAccessibility;
  v4 = [(CapsuleNavigationBarRegistrationAccessibility *)&v6 initWithBar:a3 barManager:a4];
  [(CapsuleNavigationBarRegistrationAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)CapsuleNavigationBarRegistrationAccessibility;
  [(CapsuleNavigationBarRegistrationAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(CapsuleNavigationBarRegistrationAccessibility *)self safeUIViewForKey:@"_formatMenuButton"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__CapsuleNavigationBarRegistrationAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_265136FF8;
  objc_copyWeak(&v9, &location);
  [v3 setAccessibilityLabelBlock:v8];

  v4 = [(CapsuleNavigationBarRegistrationAccessibility *)self safeValueForKey:@"_buttonsByBarItem"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 objectForKeyedSubscript:&unk_26F726C68];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = [v5 className];
        _AXAssert();
      }
      objc_super v6 = accessibilitySafariServicesLocalizedString(@"buttonbar.voicesearch");
      [v5 setAccessibilityLabel:v6];
    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __91__CapsuleNavigationBarRegistrationAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v2 = [WeakRetained safeUnsignedIntegerForKey:@"_pageFormatItemState"];

  if ((v2 & 0x4000) != 0) {
    accessibilitySafariScribbleLocalizedString(@"buttonbar.formatMenu.distractions.hidden");
  }
  else {
  id v3 = accessibilitySafariServicesLocalizedString(@"buttonbar.formatMenu");
  }

  return v3;
}

@end