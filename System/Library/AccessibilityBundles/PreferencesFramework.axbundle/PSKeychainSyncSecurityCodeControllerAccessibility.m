@interface PSKeychainSyncSecurityCodeControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_configureTextEntryCell;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkupTable;
- (void)viewDidLoad;
@end

@implementation PSKeychainSyncSecurityCodeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSKeychainSyncSecurityCodeController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PSKeychainSyncSecurityCodeController" hasInstanceVariable:@"_footerButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSKeychainSyncSecurityCodeController", @"_configureTextEntryCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSKeychainSyncSecurityCodeController", @"textEntryCell", "@", 0);
}

- (void)_accessibilityMarkupTable
{
  id v3 = [(PSKeychainSyncSecurityCodeControllerAccessibility *)self safeValueForKey:@"table"];
  [v3 accessibilitySetIdentification:@"KeychainSynchTable"];

  id v5 = [(PSKeychainSyncSecurityCodeControllerAccessibility *)self safeValueForKey:@"table"];
  v4 = [(PSKeychainSyncSecurityCodeControllerAccessibility *)self safeValueForKey:@"_footerButton"];
  [v5 _accessibilitySetAssignedValue:v4 forKey:@"Footer"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  [(PSKeychainSyncSecurityCodeControllerAccessibility *)&v3 viewDidLoad];
  [(PSKeychainSyncSecurityCodeControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  [(PSKeychainSyncSecurityCodeControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  id v3 = [(PSKeychainSyncSecurityCodeControllerAccessibility *)&v4 safeValueForKey:@"textEntryCell"];
  [(PSKeychainSyncSecurityCodeControllerAccessibility *)self _accessibilityMarkupTable];
}

- (id)_configureTextEntryCell
{
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  v2 = [(PSKeychainSyncSecurityCodeControllerAccessibility *)&v4 _configureTextEntryCell];
  [v2 setAccessibilityIdentifier:@"SecurityTextEntryCell"];

  return v2;
}

@end