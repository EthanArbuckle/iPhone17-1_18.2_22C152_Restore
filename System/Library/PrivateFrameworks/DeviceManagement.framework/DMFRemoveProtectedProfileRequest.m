@interface DMFRemoveProtectedProfileRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFRemoveProtectedProfileRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABB08;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

@end