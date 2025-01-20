@interface BKSPersistentConnectionDefaults
- (BKSPersistentConnectionDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation BKSPersistentConnectionDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"forceDemoMaxHBI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"PCForceDemoMaxHBI" toDefaultValue:&unk_1ED76C958 options:1];

  id v4 = [NSString stringWithUTF8String:"wifiInterfaceName"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"PCWiFiInterface" toDefaultValue:0 options:1];
}

- (BKSPersistentConnectionDefaults)init
{
  return (BKSPersistentConnectionDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.persistentconnection"];
}

@end