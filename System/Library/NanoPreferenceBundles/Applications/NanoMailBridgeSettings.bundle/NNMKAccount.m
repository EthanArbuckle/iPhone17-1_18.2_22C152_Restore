@interface NNMKAccount
- (id)nmcuiAccount;
@end

@implementation NNMKAccount

- (id)nmcuiAccount
{
  id v2 = [objc_alloc((Class)NMCUIAccount) initWithNNMKAccount:self];

  return v2;
}

@end