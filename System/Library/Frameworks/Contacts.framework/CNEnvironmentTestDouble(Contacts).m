@interface CNEnvironmentTestDouble(Contacts)
- (uint64_t)setNicknameProvider:()Contacts;
@end

@implementation CNEnvironmentTestDouble(Contacts)

- (uint64_t)setNicknameProvider:()Contacts
{
  return [a1 setValue:a3 forKey:@"nickname-provider"];
}

@end