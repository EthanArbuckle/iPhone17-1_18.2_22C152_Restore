@interface CRKFetchCoursesRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
@end

@implementation CRKFetchCoursesRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end