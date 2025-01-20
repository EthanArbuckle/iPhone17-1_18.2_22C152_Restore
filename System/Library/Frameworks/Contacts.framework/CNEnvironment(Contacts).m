@interface CNEnvironment(Contacts)
- (uint64_t)nicknameProvider;
@end

@implementation CNEnvironment(Contacts)

- (uint64_t)nicknameProvider
{
  return [a1 valueForKey:@"nickname-provider" onCacheMiss:&__block_literal_global_25];
}

@end