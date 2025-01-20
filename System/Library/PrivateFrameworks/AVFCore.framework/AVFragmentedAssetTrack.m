@interface AVFragmentedAssetTrack
+ (BOOL)expectsPropertyRevisedNotifications;
@end

@implementation AVFragmentedAssetTrack

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

@end