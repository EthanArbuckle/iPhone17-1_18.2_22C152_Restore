@interface BKSLockdownDefaults
- (BKSLockdownDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation BKSLockdownDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"tetheredDisplayPortMode"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"EnableTetheredDisplayPortMode" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

- (BKSLockdownDefaults)init
{
  return (BKSLockdownDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.mobile.demo"];
}

@end