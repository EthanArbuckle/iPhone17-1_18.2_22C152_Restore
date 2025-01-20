@interface ACAccount
- (id)nmcuiAccount;
@end

@implementation ACAccount

- (id)nmcuiAccount
{
  id v2 = [objc_alloc((Class)sub_10E88()) initWithACAccount:self];

  return v2;
}

@end