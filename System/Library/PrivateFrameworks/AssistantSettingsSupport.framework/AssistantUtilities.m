@interface AssistantUtilities
+ (BOOL)assistantEnabled;
+ (BOOL)deviceIsClass:(__CFString *)a3;
+ (BOOL)deviceIsVision;
+ (BOOL)deviceIsiPad;
+ (BOOL)deviceIsiPhone;
+ (BOOL)deviceIsiPod;
+ (BOOL)isAppWithBundleIDPresent:(id)a3;
+ (BOOL)isAssistantLockScreenAccessRestricted;
+ (BOOL)isHardwareButtonTrigger;
+ (BOOL)isPasscodeSet;
+ (BOOL)isQuickTypeGestureEnabled;
+ (BOOL)isRpiOnDeviceDeletionEnabled;
+ (BOOL)isVoiceTriggerEnabled;
+ (BOOL)needsTrainingData:(BOOL)a3;
+ (BOOL)shouldShowCompactVoiceTriggerSpecifier;
+ (id)assistantLanguage;
+ (id)nameForApplicationWithBundleID:(id)a3;
+ (id)numberFormatter;
+ (void)disableVoiceTrigger;
+ (void)disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage;
+ (void)enableVoiceTrigger;
+ (void)setQuickTypeGestureEnabled:(BOOL)a3;
@end

@implementation AssistantUtilities

+ (BOOL)assistantEnabled
{
  v3 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v3 assistantIsEnabled])
  {
    v4 = (void *)MEMORY[0x263F284A0];
    v5 = [a1 assistantLanguage];
    char v6 = [v4 assistantIsSupportedForLanguageCode:v5 error:0];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)assistantLanguage
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  v3 = [v2 languageCode];

  return v3;
}

+ (BOOL)deviceIsiPad
{
  return [a1 deviceIsClass:@"iPad"];
}

+ (BOOL)deviceIsiPod
{
  return [a1 deviceIsClass:@"iPod"];
}

+ (BOOL)deviceIsiPhone
{
  return [a1 deviceIsClass:@"iPhone"];
}

+ (BOOL)deviceIsVision
{
  return [a1 deviceIsClass:@"RealityDevice"];
}

+ (BOOL)deviceIsClass:(__CFString *)a3
{
  v4 = (const void *)MGCopyAnswer();
  LOBYTE(a3) = CFEqual(v4, a3) != 0;
  CFRelease(v4);
  return (char)a3;
}

+ (id)numberFormatter
{
  if (numberFormatter_onceToken != -1) {
    dispatch_once(&numberFormatter_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)numberFormatter_numberFormatter;

  return v2;
}

uint64_t __37__AssistantUtilities_numberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)numberFormatter_numberFormatter;
  numberFormatter_numberFormatter = (uint64_t)v0;

  v2 = (void *)numberFormatter_numberFormatter;

  return [v2 setNumberStyle:1];
}

+ (BOOL)isHardwareButtonTrigger
{
  int v2 = [a1 assistantEnabled];
  if (v2) {
    LOBYTE(v2) = _AXSHomeButtonAssistant() == 0;
  }
  return v2;
}

+ (BOOL)isAssistantLockScreenAccessRestricted
{
  int v2 = [MEMORY[0x263F53C50] sharedConnection];
  if ([v2 isPasscodeSet]) {
    char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53788]];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

+ (BOOL)isPasscodeSet
{
  int v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

+ (BOOL)isVoiceTriggerEnabled
{
  int v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

+ (void)enableVoiceTrigger
{
  id v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v2 setVoiceTriggerEnabled:1];
}

+ (void)disableVoiceTrigger
{
  id v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v2 setVoiceTriggerEnabled:0];
}

+ (void)disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage
{
  char v3 = [MEMORY[0x263F78BB8] sharedInstance];
  v4 = [a1 assistantLanguage];
  [v3 discardSiriEnrollmentForLanguageCode:v4];

  [a1 disableVoiceTrigger];
}

+ (BOOL)needsTrainingData:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x263F78BB8] sharedInstance];
  char v6 = [v5 isSpeakerRecognitionAvailable];

  v7 = [MEMORY[0x263F78BB8] sharedInstance];
  v8 = [a1 assistantLanguage];
  char v9 = [v7 isSATEnrolledForSiriProfileId:0 forLanguageCode:v8];

  if (v3) {
    return v6 & (v9 ^ 1);
  }
  else {
    return 0;
  }
}

+ (BOOL)shouldShowCompactVoiceTriggerSpecifier
{
  id v2 = [a1 assistantLanguage];
  if (!v2)
  {
    BOOL v3 = [MEMORY[0x263F285A0] sharedPreferences];
    id v2 = [v3 bestSupportedLanguageCodeForLanguageCode:0];
  }
  v4 = [MEMORY[0x263F85AF0] sharedPreferences];
  if ([v4 isCompactVoiceTriggerAvailableForLanguageCode:v2]) {
    char v5 = AFDeviceSupportsANE();
  }
  else {
    char v5 = 0;
  }

  char v6 = _os_feature_enabled_impl() & v5;
  return v6;
}

+ (id)nameForApplicationWithBundleID:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  uint64_t v9 = 0;
  char v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v9];

  char v6 = 0;
  if (!v9)
  {
    char v6 = [v5 localizedName];
    if (![v6 length])
    {
      uint64_t v7 = [v5 localizedShortName];

      char v6 = (void *)v7;
    }
  }

  return v6;
}

+ (BOOL)isAppWithBundleIDPresent:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  uint64_t v9 = 0;
  char v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v9];

  if (v9)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v7 = [v5 applicationState];
    if ([v7 isInstalled]) {
      int v6 = [v7 isPlaceholder] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (BOOL)isRpiOnDeviceDeletionEnabled
{
  char v2 = [MEMORY[0x263F28510] isOnDeviceHistoryDeletionEnabled];
  BOOL v3 = [MEMORY[0x263F285A0] sharedPreferences];
  char v4 = [v3 longLivedIdentifierUploadingEnabled] ^ 1;

  return v2 & v4;
}

+ (BOOL)isQuickTypeGestureEnabled
{
  int v2 = [a1 assistantEnabled];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F285A0] sharedPreferences];
    char v4 = [v3 quickTypeGestureEnabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (void)setQuickTypeGestureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  [v4 setQuickTypeGestureEnabled:v3];
}

@end