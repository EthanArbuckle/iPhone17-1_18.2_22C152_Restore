@interface CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityShowsEscapeOffer;
@end

@implementation CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI

+ (id)safeCategoryTargetClassName
{
  return @"CDPRemoteSecretEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CDPRemoteSecretEntryViewController" isKindOfClass:@"PSDetailController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSDetailController", @"pane", "@", 0);
  [v3 validateClass:@"CDPRemoteSecretEntryViewController" hasInstanceVariable:@"_validator" withType:"CDPRemoteDeviceSecretValidator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CDPRemoteDeviceSecretValidator", @"supportedEscapeOfferMask", "Q", 0);
  [v3 validateClass:@"CDPRemoteSecretEntryPane"];
}

- (BOOL)accessibilityShowsEscapeOffer
{
  id v3 = [(CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI *)self safeValueForKey:@"_validator"];
  uint64_t v4 = [v3 _accessibilityUnsignedIntegerValueForKey:@"AXEscapeOffer"];
  v5 = [(CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI *)self safeValueForKey:@"pane"];
  NSClassFromString(&cfstr_Cdpremotesecre_1.isa);
  LOBYTE(v4) = objc_opt_isKindOfClass() & (v4 != 1);

  return v4;
}

@end