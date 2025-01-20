@interface SOKerberosExtensionUserData
- (BOOL)useKeychain;
- (BOOL)useSmartCard;
- (BOOL)userSetKeychainChoice;
- (SOKerberosExtensionUserData)init;
- (void)setUseKeychain:(BOOL)a3;
- (void)setUseSmartCard:(BOOL)a3;
- (void)setUserSetKeychainChoice:(BOOL)a3;
@end

@implementation SOKerberosExtensionUserData

- (SOKerberosExtensionUserData)init
{
  v5.receiver = self;
  v5.super_class = (Class)SOKerberosExtensionUserData;
  v2 = [(SOKerberosExtensionUserData *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v3 registerDefaults:&unk_26D33C178];
  }
  return v2;
}

- (BOOL)useKeychain
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"useKeychain"];

  return v3;
}

- (void)setUseKeychain:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setBool:v3 forKey:@"useKeychain"];
}

- (BOOL)userSetKeychainChoice
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"userSetKeychainChoice"];

  return v3;
}

- (void)setUserSetKeychainChoice:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setBool:v3 forKey:@"userSetKeychainChoice"];
}

- (BOOL)useSmartCard
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"useSmartCard"];

  return v3;
}

- (void)setUseSmartCard:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setBool:v3 forKey:@"useSmartCard"];
}

@end