@interface DMFStopAirPlayMirroringRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFStopAirPlayMirroringRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABD18;
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