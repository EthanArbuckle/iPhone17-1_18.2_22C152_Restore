@interface BCSLocaleHelper
- (NSLocale)currentLocale;
- (id)description;
@end

@implementation BCSLocaleHelper

- (NSLocale)currentLocale
{
  return (NSLocale *)[MEMORY[0x263EFF960] currentLocale];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(BCSLocaleHelper *)self currentLocale];
  v5 = [v4 localeIdentifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"currentLocaleIdentifier"];

  v7 = [v3 build];

  return v7;
}

@end