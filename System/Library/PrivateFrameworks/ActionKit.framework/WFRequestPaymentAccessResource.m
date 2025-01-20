@interface WFRequestPaymentAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (unint64_t)status;
@end

@implementation WFRequestPaymentAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (unint64_t)status
{
  return 4;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.Passbook";
}

@end