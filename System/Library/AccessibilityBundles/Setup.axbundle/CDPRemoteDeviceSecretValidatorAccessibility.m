@interface CDPRemoteDeviceSecretValidatorAccessibility
@end

@implementation CDPRemoteDeviceSecretValidatorAccessibility

uint64_t __91__CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup_initWithContext_validator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) safeUnsignedIntForKey:@"supportedEscapeOfferMask"];
  v3 = *(void **)(a1 + 40);

  return [v3 _accessibilitySetUnsignedIntegerValue:v2 forKey:@"AXEscapeOffer"];
}

@end