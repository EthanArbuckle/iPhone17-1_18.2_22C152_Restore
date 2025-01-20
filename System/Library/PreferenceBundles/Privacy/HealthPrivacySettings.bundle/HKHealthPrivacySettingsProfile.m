@interface HKHealthPrivacySettingsProfile
- (id)presentationContext;
- (id)userActivityManager;
@end

@implementation HKHealthPrivacySettingsProfile

- (id)userActivityManager
{
  return 0;
}

- (id)presentationContext
{
  return WDProfilePresentationContextSettingsPrivacy;
}

@end