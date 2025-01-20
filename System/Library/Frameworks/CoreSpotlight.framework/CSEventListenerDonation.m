@interface CSEventListenerDonation
- (unsigned)getItemCount;
@end

@implementation CSEventListenerDonation

- (unsigned)getItemCount
{
  return _MDPlistArrayGetCount();
}

@end