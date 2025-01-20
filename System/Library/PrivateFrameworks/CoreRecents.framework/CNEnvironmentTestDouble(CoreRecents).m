@interface CNEnvironmentTestDouble(CoreRecents)
- (uint64_t)setCoreRecentsLibrary:()CoreRecents;
@end

@implementation CNEnvironmentTestDouble(CoreRecents)

- (uint64_t)setCoreRecentsLibrary:()CoreRecents
{
  return [a1 setValue:a3 forKey:@"core-recents-library"];
}

@end