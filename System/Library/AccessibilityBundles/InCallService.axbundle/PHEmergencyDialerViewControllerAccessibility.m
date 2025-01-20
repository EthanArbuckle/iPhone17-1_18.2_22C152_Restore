@interface PHEmergencyDialerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)medicalIDButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PHEmergencyDialerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHEmergencyDialerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHEmergencyDialerViewController" hasInstanceVariable:@"_dialerView" withType:"PHEmergencyHandsetDialerView"];
  [v3 validateClass:@"PHEmergencyHandsetDialerView" isKindOfClass:@"PHAbstractDialerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"callButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHEmergencyDialerViewController", @"medicalIDButtonTapped:", "v", "@", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHEmergencyDialerViewControllerAccessibility;
  [(PHEmergencyDialerViewControllerAccessibility *)&v9 viewDidDisappear:a3];
  v4 = [(PHEmergencyDialerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v5 = [v4 window];
  [v5 _setAccessibilityIsMainWindow:0];

  v6 = [(PHEmergencyDialerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v7 = [v6 window];
  [v7 setAccessibilityViewIsModal:0];

  v8 = (id *)MEMORY[0x263F1D020];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetAllowsNotificationsDuringSuspension:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  [*v8 _accessibilitySetAllowsNotificationsDuringSuspension:0];
}

- (void)medicalIDButtonTapped:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHEmergencyDialerViewControllerAccessibility;
  [(PHEmergencyDialerViewControllerAccessibility *)&v4 medicalIDButtonTapped:a3];
  id v3 = (id *)MEMORY[0x263F1D020];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetAllowsNotificationsDuringSuspension:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  [*v3 _accessibilitySetAllowsNotificationsDuringSuspension:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PHEmergencyDialerViewControllerAccessibility;
  [(PHEmergencyDialerViewControllerAccessibility *)&v12 viewDidAppear:a3];
  objc_super v4 = [(PHEmergencyDialerViewControllerAccessibility *)self safeValueForKey:@"_dialerView"];
  v5 = [v4 safeValueForKey:@"callButton"];
  v6 = accessibilityLocalizedString(@"call.text");
  [v5 setAccessibilityLabel:v6];

  v7 = [(PHEmergencyDialerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v8 = [v7 window];
  [v8 _setAccessibilityIsMainWindow:1];

  objc_super v9 = [(PHEmergencyDialerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v10 = [v9 window];
  [v10 setAccessibilityViewIsModal:1];

  v11 = (id *)MEMORY[0x263F1D020];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetAllowsNotificationsDuringSuspension:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  [*v11 _accessibilitySetAllowsNotificationsDuringSuspension:0];
}

@end