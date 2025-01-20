@interface DMFFetchInstalledApplicationsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFFetchInstalledApplicationsRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB790;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

@end