@interface BKSIAPDefaults
- (BKSIAPDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation BKSIAPDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"videoTVOutSystem"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"System" toDefaultValue:0 options:1];

  v4 = [NSString stringWithUTF8String:"videoTVOutSignal"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"Signal" toDefaultValue:0 options:1];

  v5 = [NSString stringWithUTF8String:"videoTVOutReservedForIPodOut"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"iPodOut" toDefaultValue:0 options:1];

  id v6 = [NSString stringWithUTF8String:"videoTVOutReservedForRemoteUI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"RemoteUI" toDefaultValue:0 options:1];
}

- (BKSIAPDefaults)init
{
  return (BKSIAPDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.iapd"];
}

@end