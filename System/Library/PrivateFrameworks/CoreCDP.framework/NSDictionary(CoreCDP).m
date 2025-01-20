@interface NSDictionary(CoreCDP)
- (id)cdp_sanitizedCopy;
@end

@implementation NSDictionary(CoreCDP)

- (id)cdp_sanitizedCopy
{
  v1 = (void *)[a1 mutableCopy];
  [v1 removeObjectForKey:*MEMORY[0x263F28F78]];
  v2 = (void *)[v1 copy];

  return v2;
}

@end