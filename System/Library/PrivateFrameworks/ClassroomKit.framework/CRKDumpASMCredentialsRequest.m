@interface CRKDumpASMCredentialsRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
@end

@implementation CRKDumpASMCredentialsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end