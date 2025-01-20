@interface AMSCarrierMSISDNProvider
- (NSString)msisdn;
@end

@implementation AMSCarrierMSISDNProvider

- (NSString)msisdn
{
  return +[AMSDevice phoneNumber];
}

@end