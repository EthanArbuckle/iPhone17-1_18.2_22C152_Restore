@interface CNSharedProfileOnboardingStateControllerTestDouble
+ (id)userDefaults;
- (BOOL)accountCanCreateSNaP;
- (BOOL)alwaysShowSNaPOnboarding;
- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3;
- (BOOL)deviceSupportsPosters;
- (BOOL)didSkipPosterSetup;
- (BOOL)hasCompletedOnboarding;
- (BOOL)iCloudSignedInToUseNicknames;
- (BOOL)isPhotosReadyForOnboarding;
- (BOOL)multiplePhoneNumbersTiedToAppleID;
- (BOOL)shouldShowOnboarding;
- (CNSharedProfileOnboardingStateControllerTestDouble)initWithIsPhotosReady:(BOOL)a3 multiplePhoneNumbersTiedToAppleID:(BOOL)a4 accountCanCreateSNaP:(BOOL)a5 hasCompletedOnboarding:(BOOL)a6 didSkipPoster:(BOOL)a7 lastShownVersionOnLaunch:(int64_t)a8 lastShownVersionInSettings:(int64_t)a9 deviceSupportsPosters:(BOOL)a10;
- (int64_t)currentOnboardingVersion;
- (int64_t)lastShowOnboardingVersionInSettings;
- (int64_t)lastShownOnboardingVersion;
- (void)setAccountCanCreateSNaP:(BOOL)a3;
- (void)setAlwaysShowSNaPOnboarding:(BOOL)a3;
- (void)setCurrentOnboardingVersion:(int64_t)a3;
- (void)setDeviceSupportsPosters:(BOOL)a3;
- (void)setDidSkipPosterSetup:(BOOL)a3;
- (void)setHasCompletedOnboarding:(BOOL)a3;
- (void)setICloudSignedInToUseNicknames:(BOOL)a3;
- (void)setIsPhotosReadyForOnboarding:(BOOL)a3;
- (void)setLastShowOnboardingVersionInSettings:(int64_t)a3;
- (void)setLastShownOnboardingVersion:(int64_t)a3;
- (void)setMultiplePhoneNumbersTiedToAppleID:(BOOL)a3;
- (void)writeToDefaultsLastShownOnboardingVersion;
- (void)writeToDefaultsLastShownSettingsOnboardingVersion;
@end

@implementation CNSharedProfileOnboardingStateControllerTestDouble

- (void)setHasCompletedOnboarding:(BOOL)a3
{
  self->_hasCompletedOnboarding = a3;
}

- (BOOL)hasCompletedOnboarding
{
  return self->_hasCompletedOnboarding;
}

- (void)setDidSkipPosterSetup:(BOOL)a3
{
  self->_didSkipPosterSetup = a3;
}

- (BOOL)didSkipPosterSetup
{
  return self->_didSkipPosterSetup;
}

- (void)setDeviceSupportsPosters:(BOOL)a3
{
  self->_deviceSupportsPosters = a3;
}

- (BOOL)deviceSupportsPosters
{
  return self->_deviceSupportsPosters;
}

- (void)setICloudSignedInToUseNicknames:(BOOL)a3
{
  self->_iCloudSignedInToUseNicknames = a3;
}

- (BOOL)iCloudSignedInToUseNicknames
{
  return self->_iCloudSignedInToUseNicknames;
}

- (void)setLastShowOnboardingVersionInSettings:(int64_t)a3
{
  self->_lastShowOnboardingVersionInSettings = a3;
}

- (int64_t)lastShowOnboardingVersionInSettings
{
  return self->_lastShowOnboardingVersionInSettings;
}

- (void)setLastShownOnboardingVersion:(int64_t)a3
{
  self->_lastShownOnboardingVersion = a3;
}

- (int64_t)lastShownOnboardingVersion
{
  return self->_lastShownOnboardingVersion;
}

- (void)setCurrentOnboardingVersion:(int64_t)a3
{
  self->_currentOnboardingVersion = a3;
}

- (void)setAccountCanCreateSNaP:(BOOL)a3
{
  self->_accountCanCreateSNaP = a3;
}

- (BOOL)accountCanCreateSNaP
{
  return self->_accountCanCreateSNaP;
}

- (void)setMultiplePhoneNumbersTiedToAppleID:(BOOL)a3
{
  self->_multiplePhoneNumbersTiedToAppleID = a3;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  return self->_multiplePhoneNumbersTiedToAppleID;
}

- (void)setAlwaysShowSNaPOnboarding:(BOOL)a3
{
  self->_alwaysShowSNaPOnboarding = a3;
}

- (BOOL)alwaysShowSNaPOnboarding
{
  return self->_alwaysShowSNaPOnboarding;
}

- (void)setIsPhotosReadyForOnboarding:(BOOL)a3
{
  self->_isPhotosReadyForOnboarding = a3;
}

- (BOOL)isPhotosReadyForOnboarding
{
  return self->_isPhotosReadyForOnboarding;
}

- (int64_t)currentOnboardingVersion
{
  return 1;
}

- (void)writeToDefaultsLastShownSettingsOnboardingVersion
{
  self->_lastShowOnboardingVersionInSettings = [(CNSharedProfileOnboardingStateControllerTestDouble *)self currentOnboardingVersion];
}

- (BOOL)shouldShowOnboarding
{
  return [(CNSharedProfileOnboardingStateControllerTestDouble *)self alwaysShowSNaPOnboarding]|| [(CNSharedProfileOnboardingStateControllerTestDouble *)self lastShownOnboardingVersion] < 1;
}

- (void)writeToDefaultsLastShownOnboardingVersion
{
  self->_lastShownOnboardingVersion = [(CNSharedProfileOnboardingStateControllerTestDouble *)self currentOnboardingVersion];
}

- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3
{
  BOOL v5 = [(CNSharedProfileOnboardingStateControllerTestDouble *)self accountCanCreateSNaP];
  if (v5) {
    LOBYTE(v5) = a3
  }
              || ([MEMORY[0x1E4F5A3D8] currentEnvironment],
                  v6 = objc_claimAutoreleasedReturnValue(),
                  [v6 featureFlags],
                  v7 = objc_claimAutoreleasedReturnValue(),
                  int v8 = [v7 isFeatureEnabled:14],
                  v7,
                  v6,
                  !v8)
              || ![(CNSharedProfileOnboardingStateControllerTestDouble *)self multiplePhoneNumbersTiedToAppleID];
  return v5;
}

- (CNSharedProfileOnboardingStateControllerTestDouble)initWithIsPhotosReady:(BOOL)a3 multiplePhoneNumbersTiedToAppleID:(BOOL)a4 accountCanCreateSNaP:(BOOL)a5 hasCompletedOnboarding:(BOOL)a6 didSkipPoster:(BOOL)a7 lastShownVersionOnLaunch:(int64_t)a8 lastShownVersionInSettings:(int64_t)a9 deviceSupportsPosters:(BOOL)a10
{
  v20.receiver = self;
  v20.super_class = (Class)CNSharedProfileOnboardingStateControllerTestDouble;
  v16 = [(CNSharedProfileOnboardingStateControllerTestDouble *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_isPhotosReadyForOnboarding = a3;
    v16->_multiplePhoneNumbersTiedToAppleID = a4;
    v16->_accountCanCreateSNaP = a5;
    v16->_alwaysShowSNaPOnboarding = 0;
    v16->_deviceSupportsPosters = a10;
    v16->_iCloudSignedInToUseNicknames = 1;
    v16->_lastShownOnboardingVersion = a8;
    v16->_lastShowOnboardingVersionInSettings = a9;
    v16->_didSkipPosterSetup = a7;
    v16->_hasCompletedOnboarding = a6;
    v18 = v16;
  }

  return v17;
}

+ (id)userDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.contacts.sharedProfile.test"];

  return v2;
}

@end