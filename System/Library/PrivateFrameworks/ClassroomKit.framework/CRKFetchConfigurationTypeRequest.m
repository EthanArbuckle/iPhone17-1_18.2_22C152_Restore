@interface CRKFetchConfigurationTypeRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
@end

@implementation CRKFetchConfigurationTypeRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end