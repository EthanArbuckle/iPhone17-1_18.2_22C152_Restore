@interface CCIncrementalSetDonation
- (unint64_t)priorVersion;
@end

@implementation CCIncrementalSetDonation

- (unint64_t)priorVersion
{
  v3.receiver = self;
  v3.super_class = (Class)CCIncrementalSetDonation;
  return [(CCSetDonation *)&v3 priorVersion];
}

@end