@interface DKRestrictionsProvider
- (BOOL)isPreserveESIMOnEraseEnforced;
@end

@implementation DKRestrictionsProvider

- (BOOL)isPreserveESIMOnEraseEnforced
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPreserveESIMOnEraseEnforced];

  return v3;
}

@end