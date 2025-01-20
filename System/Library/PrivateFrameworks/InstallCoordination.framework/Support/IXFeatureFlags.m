@interface IXFeatureFlags
+ (BOOL)scheduledUpdatesEnabled;
@end

@implementation IXFeatureFlags

+ (BOOL)scheduledUpdatesEnabled
{
  return __os_feature_enabled_impl("InstallCoordination", "IX_BACKGROUND_UPDATE_SCHEDULING");
}

@end