@interface CNEnvironment(CoreRecents)
- (uint64_t)coreRecentsLibrary;
@end

@implementation CNEnvironment(CoreRecents)

- (uint64_t)coreRecentsLibrary
{
  return [a1 valueForKey:@"core-recents-library" onCacheMiss:&__block_literal_global_0];
}

@end