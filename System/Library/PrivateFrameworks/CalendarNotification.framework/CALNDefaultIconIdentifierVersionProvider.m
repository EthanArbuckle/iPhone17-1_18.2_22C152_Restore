@interface CALNDefaultIconIdentifierVersionProvider
- (int64_t)iconIdentifierVersion;
- (int64_t)iconVersionToUpgradeTo;
- (void)setIconIdentifierVersion:(int64_t)a3;
@end

@implementation CALNDefaultIconIdentifierVersionProvider

- (int64_t)iconIdentifierVersion
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"CALNNotificationIconIdentifierVersion"];

  return v3;
}

- (void)setIconIdentifierVersion:(int64_t)a3
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setInteger:a3 forKey:@"CALNNotificationIconIdentifierVersion"];
}

- (int64_t)iconVersionToUpgradeTo
{
  return 4;
}

@end