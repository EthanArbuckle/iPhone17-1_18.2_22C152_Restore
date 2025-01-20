@interface CRKFetchMeCardRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
@end

@implementation CRKFetchMeCardRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end