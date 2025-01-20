@interface DMFClearRestrictionsPasswordRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFClearRestrictionsPasswordRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB5C8;
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