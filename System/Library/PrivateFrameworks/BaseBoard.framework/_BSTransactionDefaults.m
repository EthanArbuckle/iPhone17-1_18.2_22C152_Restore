@interface _BSTransactionDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation _BSTransactionDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"auditHistoryEnabled"];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");
}

@end