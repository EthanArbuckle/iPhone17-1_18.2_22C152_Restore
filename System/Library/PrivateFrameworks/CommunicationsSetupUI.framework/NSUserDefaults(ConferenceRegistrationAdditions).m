@interface NSUserDefaults(ConferenceRegistrationAdditions)
+ (uint64_t)CNFObjectForKey:()ConferenceRegistrationAdditions;
+ (uint64_t)CNFRegEmailValidationTimeout;
+ (uint64_t)CNFRegSavedAccountName;
+ (uint64_t)CNFRegServerURLOverride;
+ (uint64_t)setCNFObject:()ConferenceRegistrationAdditions forKey:;
+ (uint64_t)setCNFRegSavedAccountName:()ConferenceRegistrationAdditions;
+ (uint64_t)setCNFRegServerURLOverride:()ConferenceRegistrationAdditions;
+ (uint64_t)shouldShowCNFRegistrationServerLogs;
+ (uint64_t)shouldShowCNFRegistrationSettingsUI;
+ (void)setCNFRegEmailValidationTimeout:()ConferenceRegistrationAdditions;
+ (void)setShouldShowCNFRegistrationServerLogs:()ConferenceRegistrationAdditions;
+ (void)setShouldShowCNFRegistrationSettingsUI:()ConferenceRegistrationAdditions;
@end

@implementation NSUserDefaults(ConferenceRegistrationAdditions)

+ (uint64_t)setCNFObject:()ConferenceRegistrationAdditions forKey:
{
  return [a1 _IMSetObject:a3 forKey:a4 inDomain:@"com.apple.conference"];
}

+ (uint64_t)CNFObjectForKey:()ConferenceRegistrationAdditions
{
  return [a1 _IMObjectForKey:a3 inDomain:@"com.apple.conference"];
}

+ (void)setShouldShowCNFRegistrationSettingsUI:()ConferenceRegistrationAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setCNFObject:v2 forKey:@"CNFRegShowRegistrationSettingsUI"];
}

+ (uint64_t)shouldShowCNFRegistrationSettingsUI
{
  v1 = [a1 CNFObjectForKey:@"CNFRegShowRegistrationSettingsUI"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (uint64_t)CNFRegEmailValidationTimeout
{
  v1 = [a1 CNFObjectForKey:@"registration.emailValidationTimeout"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

+ (void)setCNFRegEmailValidationTimeout:()ConferenceRegistrationAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setCNFObject:v2 forKey:@"registration.emailValidationTimeout"];
}

+ (uint64_t)CNFRegSavedAccountName
{
  return [a1 CNFObjectForKey:@"registration.savedAccountName"];
}

+ (uint64_t)setCNFRegSavedAccountName:()ConferenceRegistrationAdditions
{
  return [a1 setCNFObject:a3 forKey:@"registration.savedAccountName"];
}

+ (uint64_t)setCNFRegServerURLOverride:()ConferenceRegistrationAdditions
{
  return [a1 setCNFObject:a3 forKey:@"registration.serverPageURLOverride"];
}

+ (uint64_t)CNFRegServerURLOverride
{
  return [a1 CNFObjectForKey:@"registration.serverPageURLOverride"];
}

+ (void)setShouldShowCNFRegistrationServerLogs:()ConferenceRegistrationAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setCNFObject:v2 forKey:@"registration.showServerWebPageLogging"];
}

+ (uint64_t)shouldShowCNFRegistrationServerLogs
{
  v1 = [a1 CNFObjectForKey:@"registration.showServerWebPageLogging"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end