@interface CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup)initWithContext:(id)a3 validator:(id)a4;
@end

@implementation CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup

+ (id)safeCategoryTargetClassName
{
  return @"CDPRemoteDeviceSecretValidator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CDPRemoteDeviceSecretValidator", @"supportedEscapeOfferMask", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CDPRemoteDeviceSecretValidator", @"initWithContext:validator:", "@", "@", 0);
}

- (CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup)initWithContext:(id)a3 validator:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup;
  v4 = [(CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup *)&v13 initWithContext:a3 validator:a4];
  v5 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup_initWithContext_validator___block_invoke;
  v10[3] = &unk_26514E420;
  v11 = v4;
  v6 = v11;
  v12 = v6;
  dispatch_async(v5, v10);

  v7 = v12;
  v8 = v6;

  return v8;
}

@end