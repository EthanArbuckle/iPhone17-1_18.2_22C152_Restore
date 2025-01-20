@interface WBSPrivateBrowsingExplanationConfiguration(SafariServicesExtras)
+ (id)defaultConfiguration;
@end

@implementation WBSPrivateBrowsingExplanationConfiguration(SafariServicesExtras)

+ (id)defaultConfiguration
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F98D08]);
  if (deviceSupportedBiometryType_onceToken != -1) {
    dispatch_once(&deviceSupportedBiometryType_onceToken, &__block_literal_global_62);
  }
  [v0 setBiometryType:deviceSupportedBiometryType_deviceSupportedBiometryType];
  v1 = +[_SFManagedFeatureObserver sharedObserver];
  objc_msgSend(v0, "setUserHasPassword:", objc_msgSend(v1, "doesUserHavePasscodeSet"));

  v2 = [MEMORY[0x1E4F98CF0] sharedManager];
  [v0 setPrivacyProxyAvailabilityManager:v2];

  v3 = +[_SFSearchEngineController sharedInstance];
  v4 = [v3 defaultSearchEngineForPrivateBrowsing:1];
  [v0 setPrivateBrowsingSearchEngine:v4];

  return v0;
}

@end