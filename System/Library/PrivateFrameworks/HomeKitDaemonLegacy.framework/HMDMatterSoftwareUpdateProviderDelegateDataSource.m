@interface HMDMatterSoftwareUpdateProviderDelegateDataSource
- (BOOL)isMatterAccessorySoftwareUpdateEnabled;
@end

@implementation HMDMatterSoftwareUpdateProviderDelegateDataSource

- (BOOL)isMatterAccessorySoftwareUpdateEnabled
{
  return (_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) != 0;
}

@end