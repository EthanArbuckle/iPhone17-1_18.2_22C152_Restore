@interface AVSystemController(Announce)
- (uint64_t)an_isCarPlayConnected;
@end

@implementation AVSystemController(Announce)

- (uint64_t)an_isCarPlayConnected
{
  v1 = [a1 attributeForKey:*MEMORY[0x263F54358]];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end