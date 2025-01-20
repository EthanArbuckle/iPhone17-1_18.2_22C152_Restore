@interface DMFTriggerDiagnosticsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFTriggerDiagnosticsRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABD60;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 0;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

@end