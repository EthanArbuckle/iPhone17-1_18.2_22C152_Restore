@interface DMFRestartDeviceRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFRestartDeviceRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABB50;
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