@interface DMFClearActivationLockBypassCodeRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFClearActivationLockBypassCodeRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB5B0;
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