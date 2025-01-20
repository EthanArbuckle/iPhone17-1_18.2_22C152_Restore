@interface DMFPlayLostModeSoundRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFPlayLostModeSoundRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABA00;
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