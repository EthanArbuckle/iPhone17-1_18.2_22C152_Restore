@interface TSSIMUnlockEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TSSIMUnlockEntryViewAccessibility)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureDetailLabelText;
@end

@implementation TSSIMUnlockEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSSIMUnlockEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TSSIMUnlockEntryView" hasInstanceVariable:@"_entryField" withType:"UITextField"];
  [v3 validateClass:@"TSSIMUnlockEntryView" hasInstanceVariable:@"_detailLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TSSIMUnlockEntryView", @"initWithActionType:actionSubtype:", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TSSIMUnlockEntryView", @"_configureDetailLabelText", "v", 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return (id)[(TSSIMUnlockEntryViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_detailLabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)TSSIMUnlockEntryViewAccessibility;
  [(TSSIMUnlockEntryViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TSSIMUnlockEntryViewAccessibility *)self safeValueForKey:@"_entryField"];
  v4 = accessibilityLocalizedString(@"enter.sim.pin");
  [v3 setAccessibilityLabel:v4];
}

- (TSSIMUnlockEntryViewAccessibility)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSSIMUnlockEntryViewAccessibility;
  v4 = [(TSSIMUnlockEntryViewAccessibility *)&v7 initWithActionType:a3 actionSubtype:a4];
  objc_super v5 = v4;
  if (v4) {
    [(TSSIMUnlockEntryViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  }

  return v5;
}

- (void)_configureDetailLabelText
{
  v6.receiver = self;
  v6.super_class = (Class)TSSIMUnlockEntryViewAccessibility;
  [(TSSIMUnlockEntryViewAccessibility *)&v6 _configureDetailLabelText];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  v4 = [(TSSIMUnlockEntryViewAccessibility *)self safeValueForKey:@"_detailLabel"];
  objc_super v5 = [v4 accessibilityLabel];
  UIAccessibilityPostNotification(v3, v5);
}

@end