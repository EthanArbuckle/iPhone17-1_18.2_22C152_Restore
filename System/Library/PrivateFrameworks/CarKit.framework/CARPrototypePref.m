@interface CARPrototypePref
+ (BOOL)confirmedSafe;
+ (BOOL)qaModeLockout;
+ (BOOL)showTrustedLockout;
+ (CARPrototypeBoolPref)allowAutomaticConnectionDurationTTR;
+ (CARPrototypeBoolPref)allowSessionDurationRecordingEvents;
+ (CARPrototypeBoolPref)allowUnlimitedConnectionEvents;
+ (CARPrototypeBoolPref)audioSharingEnabled;
+ (CARPrototypeBoolPref)disableLocationNightMode;
+ (CARPrototypeBoolPref)fakeNeatlineDashboardSupport;
+ (CARPrototypeBoolPref)flipDashboardLayout;
+ (CARPrototypeBoolPref)force3xCluster;
+ (CARPrototypeBoolPref)shellCAFDisabled;
+ (CARPrototypeBoolPref)showCarPlayTemplateUIHostInCluster;
+ (CARPrototypeBoolPref)showDisclaimerLabel;
+ (CARPrototypeBoolPref)showInternalApps;
+ (CARPrototypeBoolPref)showInternalSettings;
+ (CARPrototypeBoolPref)showPrototypeApps;
+ (CARPrototypeBoolPref)showSerialNumber;
+ (CARPrototypeBoolPref)smartWidgetDebugGestures;
+ (CARPrototypeBoolPref)smartWidgetDebugShowScore;
+ (CARPrototypeBoolPref)smartWidgetRelaxHomeInRangeCheck;
+ (CARPrototypeBoolPref)useNightModeTester;
+ (CARPrototypeBoolPref)useSceneInterfaceStyle;
+ (CARPrototypePref)contentSize;
+ (CARPrototypePref)interfaceStyle;
+ (CARPrototypePref)latestInterfaceStyle;
+ (CARPrototypePref)nowPlayingAlbumArt;
+ (CARPrototypePref)prefWithDomain:(id)a3 key:(id)a4 title:(id)a5 defaultValue:(id)a6 valueChangedBlock:(id)a7;
+ (CARPrototypePref)statusBarEdgeOverride;
+ (CARPrototypePref)statusBarHorizontalThreshold;
+ (CARPrototypePref)wirelessConnectionDurationTTRThreshold;
+ (NSArray)prototypePrefs;
+ (NSDictionary)prototypePrefCache;
+ (id)_confirmedSafe;
+ (id)_qaModeLockout;
+ (void)setConfirmedSafe:(BOOL)a3;
+ (void)setPrototypePrefCache:(id)a3;
+ (void)setQaModeLockout:(BOOL)a3;
- (BOOL)cachedState;
- (BOOL)internalSettingsState;
- (BOOL)state;
- (NSString)domain;
- (NSString)key;
- (NSString)title;
- (id)cachedValue;
- (id)cachedValueOrDefault;
- (id)defaultValue;
- (id)description;
- (id)internalSettingsValue;
- (id)value;
- (id)valueChangedBlock;
- (id)valueOrDefault;
- (void)setCachedState:(BOOL)a3;
- (void)setCachedValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInternalSettingsState:(BOOL)a3;
- (void)setInternalSettingsValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setState:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueChangedBlock:(id)a3;
@end

@implementation CARPrototypePref

+ (NSArray)prototypePrefs
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CARPrototypePref_prototypePrefs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (prototypePrefs_onceToken != -1) {
    dispatch_once(&prototypePrefs_onceToken, block);
  }
  v2 = (void *)prototypePrefs__prototypePrefs;
  return (NSArray *)v2;
}

void __34__CARPrototypePref_prototypePrefs__block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) contentSize];
  v6[0] = v2;
  v3 = [*(id *)(a1 + 32) showPrototypeApps];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v5 = (void *)prototypePrefs__prototypePrefs;
  prototypePrefs__prototypePrefs = v4;
}

+ (BOOL)showTrustedLockout
{
  if (showTrustedLockout_onceToken != -1) {
    dispatch_once(&showTrustedLockout_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)showTrustedLockout__trustedLockoutPref;
  return [v2 state];
}

uint64_t __38__CARPrototypePref_showTrustedLockout__block_invoke()
{
  showTrustedLockout__trustedLockoutPref = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"ShowTrustedLockout" title:0 invertValueForState:0 valueChangedBlock:0];
  return MEMORY[0x1F41817F8]();
}

+ (id)_qaModeLockout
{
  if (_qaModeLockout_onceToken != -1) {
    dispatch_once(&_qaModeLockout_onceToken, &__block_literal_global_70);
  }
  v2 = (void *)_qaModeLockout__qaModeLockout;
  return v2;
}

uint64_t __34__CARPrototypePref__qaModeLockout__block_invoke()
{
  _qaModeLockout__qaModeLockout = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"QAModeLockout" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_76];
  return MEMORY[0x1F41817F8]();
}

uint64_t __34__CARPrototypePref__qaModeLockout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 BOOLValue];
  if (result)
  {
    return +[CARPrototypePref setConfirmedSafe:1];
  }
  return result;
}

+ (BOOL)qaModeLockout
{
  v2 = +[CARPrototypePref _qaModeLockout];
  v3 = [v2 valueOrDefault];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (void)setQaModeLockout:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[CARPrototypePref _qaModeLockout];
  [v4 setState:v3];
}

+ (id)_confirmedSafe
{
  if (_confirmedSafe_onceToken != -1) {
    dispatch_once(&_confirmedSafe_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)_confirmedSafe__confirmedSafe;
  return v2;
}

uint64_t __34__CARPrototypePref__confirmedSafe__block_invoke()
{
  _confirmedSafe__confirmedSafe = +[CARPrototypePref prefWithDomain:@"com.apple.carplay.internal" key:@"lockoutConfirmedSafe" title:0 defaultValue:MEMORY[0x1E4F1CC38] valueChangedBlock:&__block_literal_global_84];
  return MEMORY[0x1F41817F8]();
}

void __34__CARPrototypePref__confirmedSafe__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  LODWORD(a2) = [a2 BOOLValue];
  if (a2 != [v4 BOOLValue])
  {
    if ([v4 BOOLValue])
    {
      long long v22 = 0uLL;
      long long v23 = 0uLL;
      *((void *)&v20 + 1) = 0;
      long long v21 = 0uLL;
      v5 = +[CARPrototypePref prototypePrefs];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v11 = [v10 cachedValue];

            if (v11)
            {
              v12 = [v10 cachedValue];
              [v10 setValue:v12];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v7);
      }
    }
    else
    {
      long long v26 = 0uLL;
      long long v27 = 0uLL;
      long long v24 = 0uLL;
      long long v25 = 0uLL;
      v13 = +[CARPrototypePref prototypePrefs];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * j);
            v19 = [v18 value];
            [v18 setCachedValue:v19];

            [v18 setState:0];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v15);
      }

      v5 = +[CARPrototypePref _qaModeLockout];
      [v5 setState:0];
    }
  }
}

+ (BOOL)confirmedSafe
{
  v2 = +[CARPrototypePref _confirmedSafe];
  BOOL v3 = [v2 valueOrDefault];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (void)setConfirmedSafe:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  BOOL v3 = +[CARPrototypePref _confirmedSafe];
  [v3 setValue:v4];
}

+ (CARPrototypeBoolPref)showInternalApps
{
  if (showInternalApps_onceToken != -1) {
    dispatch_once(&showInternalApps_onceToken, &__block_literal_global_87);
  }
  v2 = (void *)showInternalApps__showInternalApps;
  return (CARPrototypeBoolPref *)v2;
}

void __36__CARPrototypePref_showInternalApps__block_invoke()
{
  CRLocalizedStringForKey(@"INTERNAL_APPS");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"showInternalApps" title:v2 invertValueForState:0 valueChangedBlock:&__block_literal_global_95];
  v1 = (void *)showInternalApps__showInternalApps;
  showInternalApps__showInternalApps = v0;
}

void __36__CARPrototypePref_showInternalApps__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.refreshApps", 0, 0, 1u);
}

+ (CARPrototypeBoolPref)showDisclaimerLabel
{
  if (showDisclaimerLabel_onceToken != -1) {
    dispatch_once(&showDisclaimerLabel_onceToken, &__block_literal_global_100);
  }
  id v2 = (void *)showDisclaimerLabel__showDisclaimerLabel;
  return (CARPrototypeBoolPref *)v2;
}

void __39__CARPrototypePref_showDisclaimerLabel__block_invoke()
{
  CRLocalizedStringForKey(@"DISCLAIMER_LABEL");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"showDisclaimerLabel" title:v2 invertValueForState:0 valueChangedBlock:&__block_literal_global_108];
  v1 = (void *)showDisclaimerLabel__showDisclaimerLabel;
  showDisclaimerLabel__showDisclaimerLabel = v0;
}

void __39__CARPrototypePref_showDisclaimerLabel__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.showDisclaimer", 0, 0, 1u);
}

+ (CARPrototypeBoolPref)showSerialNumber
{
  if (showSerialNumber_onceToken != -1) {
    dispatch_once(&showSerialNumber_onceToken, &__block_literal_global_113);
  }
  id v2 = (void *)showSerialNumber__showSerialNumber;
  return (CARPrototypeBoolPref *)v2;
}

void __36__CARPrototypePref_showSerialNumber__block_invoke()
{
  CRLocalizedStringForKey(@"SERIAL_LABEL");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"showSerialNumber" title:v2 invertValueForState:0 valueChangedBlock:&__block_literal_global_121];
  v1 = (void *)showSerialNumber__showSerialNumber;
  showSerialNumber__showSerialNumber = v0;
}

void __36__CARPrototypePref_showSerialNumber__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.showDisclaimer", 0, 0, 1u);
}

+ (CARPrototypeBoolPref)allowUnlimitedConnectionEvents
{
  if (allowUnlimitedConnectionEvents_onceToken != -1) {
    dispatch_once(&allowUnlimitedConnectionEvents_onceToken, &__block_literal_global_123);
  }
  id v2 = (void *)allowUnlimitedConnectionEvents__allowUnlimitedConnectionEvents;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __50__CARPrototypePref_allowUnlimitedConnectionEvents__block_invoke()
{
  allowUnlimitedConnectionEvents__allowUnlimitedConnectionEvents = +[CARPrototypePref prefWithDomain:@"com.apple.carplay.internal" key:@"allowUnlimitedConnectionEvents" title:0 defaultValue:MEMORY[0x1E4F1CC28] valueChangedBlock:&__block_literal_global_128];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)allowSessionDurationRecordingEvents
{
  if (allowSessionDurationRecordingEvents_onceToken != -1) {
    dispatch_once(&allowSessionDurationRecordingEvents_onceToken, &__block_literal_global_130);
  }
  id v2 = (void *)allowSessionDurationRecordingEvents__allowSessionDurationRecordingEvents;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __55__CARPrototypePref_allowSessionDurationRecordingEvents__block_invoke()
{
  allowSessionDurationRecordingEvents__allowSessionDurationRecordingEvents = +[CARPrototypePref prefWithDomain:@"com.apple.carplay.internal" key:@"allowSessionDurationRecordingEvents" title:0 defaultValue:MEMORY[0x1E4F1CC28] valueChangedBlock:&__block_literal_global_135];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)allowAutomaticConnectionDurationTTR
{
  if (allowAutomaticConnectionDurationTTR_onceToken != -1) {
    dispatch_once(&allowAutomaticConnectionDurationTTR_onceToken, &__block_literal_global_137);
  }
  id v2 = (void *)allowAutomaticConnectionDurationTTR__allowAutomaticConnectionDurationTTR;
  return (CARPrototypeBoolPref *)v2;
}

void __55__CARPrototypePref_allowAutomaticConnectionDurationTTR__block_invoke()
{
  CRLocalizedStringForKey(@"Detect Connection Time Issues");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.internal.carkitd" key:@"allowAutomaticConnectionDurationTTR" title:v2 invertValueForState:0 valueChangedBlock:&__block_literal_global_148];
  v1 = (void *)allowAutomaticConnectionDurationTTR__allowAutomaticConnectionDurationTTR;
  allowAutomaticConnectionDurationTTR__allowAutomaticConnectionDurationTTR = v0;
}

void __55__CARPrototypePref_allowAutomaticConnectionDurationTTR__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CarPlayAllowConnectionDurationTTRChangedNotification", 0, 0, 1u);
}

+ (CARPrototypePref)wirelessConnectionDurationTTRThreshold
{
  if (wirelessConnectionDurationTTRThreshold_onceToken != -1) {
    dispatch_once(&wirelessConnectionDurationTTRThreshold_onceToken, &__block_literal_global_153);
  }
  id v2 = (void *)wirelessConnectionDurationTTRThreshold__wirelessConnectionDurationTTRThreshold;
  return (CARPrototypePref *)v2;
}

uint64_t __58__CARPrototypePref_wirelessConnectionDurationTTRThreshold__block_invoke()
{
  wirelessConnectionDurationTTRThreshold__wirelessConnectionDurationTTRThreshold = +[CARPrototypePref prefWithDomain:@"com.apple.internal.carkitd" key:@"wirelessConnectionDurationTTRThreshold" title:@"Automatic Connection TTR Threshold" defaultValue:&unk_1F0318068 valueChangedBlock:&__block_literal_global_163];
  return MEMORY[0x1F41817F8]();
}

void __58__CARPrototypePref_wirelessConnectionDurationTTRThreshold__block_invoke_161()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CarPlayAllowConnectionDurationTTRChangedNotification", 0, 0, 1u);
}

+ (CARPrototypeBoolPref)audioSharingEnabled
{
  if (audioSharingEnabled_onceToken != -1) {
    dispatch_once(&audioSharingEnabled_onceToken, &__block_literal_global_165);
  }
  id v2 = (void *)audioSharingEnabled__audioSharingEnabled;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __39__CARPrototypePref_audioSharingEnabled__block_invoke()
{
  audioSharingEnabled__audioSharingEnabled = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"CARAudioSharingEnabled" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_170];
  return MEMORY[0x1F41817F8]();
}

void __39__CARPrototypePref_audioSharingEnabled__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CarPlayAudioSharingEnabledDidChangeNotification", 0, 0, 1u);
}

+ (CARPrototypePref)contentSize
{
  if (contentSize_onceToken != -1) {
    dispatch_once(&contentSize_onceToken, &__block_literal_global_175);
  }
  id v2 = (void *)contentSize__contentSize;
  return (CARPrototypePref *)v2;
}

uint64_t __31__CARPrototypePref_contentSize__block_invoke()
{
  contentSize__contentSize = +[CARPrototypePref prefWithDomain:@"com.apple.UIKit" key:@"UICarPlayPreferredContentSizeCategoryName" title:0 defaultValue:@"UICTContentSizeCategoryL" valueChangedBlock:&__block_literal_global_186];
  return MEMORY[0x1F41817F8]();
}

void __31__CARPrototypePref_contentSize__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleCarPlayPreferredContentSizeCategoryChangedNotification", 0, 0, 1u);
}

+ (CARPrototypePref)interfaceStyle
{
  if (interfaceStyle_onceToken != -1) {
    dispatch_once(&interfaceStyle_onceToken, &__block_literal_global_191);
  }
  id v2 = (void *)interfaceStyle__interfaceStyle;
  return (CARPrototypePref *)v2;
}

uint64_t __34__CARPrototypePref_interfaceStyle__block_invoke()
{
  interfaceStyle__interfaceStyle = +[CARPrototypePref prefWithDomain:@"com.apple.UIKit" key:@"CarPlayUserInterfaceStyle" title:0 defaultValue:&unk_1F0318080 valueChangedBlock:&__block_literal_global_200];
  return MEMORY[0x1F41817F8]();
}

void __34__CARPrototypePref_interfaceStyle__block_invoke_198()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.capabilities-changed", 0, 0, 1u);
}

+ (CARPrototypePref)latestInterfaceStyle
{
  if (latestInterfaceStyle_onceToken != -1) {
    dispatch_once(&latestInterfaceStyle_onceToken, &__block_literal_global_205);
  }
  id v2 = (void *)latestInterfaceStyle__interfaceStyle;
  return (CARPrototypePref *)v2;
}

uint64_t __40__CARPrototypePref_latestInterfaceStyle__block_invoke()
{
  latestInterfaceStyle__interfaceStyle = +[CARPrototypePref prefWithDomain:@"com.apple.CarPlayApp" key:@"CarPlayUserInterfaceStyle" title:0 defaultValue:&unk_1F0318080 valueChangedBlock:&__block_literal_global_210];
  return MEMORY[0x1F41817F8]();
}

void __40__CARPrototypePref_latestInterfaceStyle__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.capabilities-changed", 0, 0, 1u);
}

+ (CARPrototypeBoolPref)useSceneInterfaceStyle
{
  if (useSceneInterfaceStyle_onceToken != -1) {
    dispatch_once(&useSceneInterfaceStyle_onceToken, &__block_literal_global_212);
  }
  id v2 = (void *)useSceneInterfaceStyle__useSceneInterfaceStyle;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __42__CARPrototypePref_useSceneInterfaceStyle__block_invoke()
{
  useSceneInterfaceStyle__useSceneInterfaceStyle = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.UIKit" key:@"ApplySceneUserInterfaceStyleToCarScreen" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_217];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)disableLocationNightMode
{
  if (disableLocationNightMode_onceToken != -1) {
    dispatch_once(&disableLocationNightMode_onceToken, &__block_literal_global_219);
  }
  id v2 = (void *)disableLocationNightMode__disableLocationNightMode;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __44__CARPrototypePref_disableLocationNightMode__block_invoke()
{
  disableLocationNightMode__disableLocationNightMode = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.CarPlayApp" key:@"kCarPlayAppDisableLocationNightMode" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_224];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)useNightModeTester
{
  if (useNightModeTester_onceToken != -1) {
    dispatch_once(&useNightModeTester_onceToken, &__block_literal_global_226);
  }
  id v2 = (void *)useNightModeTester__useNightModeTester;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __38__CARPrototypePref_useNightModeTester__block_invoke()
{
  useNightModeTester__useNightModeTester = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.CarPlayApp" key:@"kCarPlayAppUseNightModeTester" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_231];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)showCarPlayTemplateUIHostInCluster
{
  if (showCarPlayTemplateUIHostInCluster_onceToken != -1) {
    dispatch_once(&showCarPlayTemplateUIHostInCluster_onceToken, &__block_literal_global_233);
  }
  id v2 = (void *)showCarPlayTemplateUIHostInCluster__showCarPlayTemplateUIHostInCluster;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __54__CARPrototypePref_showCarPlayTemplateUIHostInCluster__block_invoke()
{
  showCarPlayTemplateUIHostInCluster__showCarPlayTemplateUIHostInCluster = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.CarPlayApp" key:@"kCarPlayAppShowCarPlayTemplateUIHostInCluster" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_238];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)shellCAFDisabled
{
  if (shellCAFDisabled_onceToken != -1) {
    dispatch_once(&shellCAFDisabled_onceToken, &__block_literal_global_240);
  }
  id v2 = (void *)shellCAFDisabled__shellCAFDisabled;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __36__CARPrototypePref_shellCAFDisabled__block_invoke()
{
  shellCAFDisabled__shellCAFDisabled = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.CarPlayApp" key:@"CAFDisabled" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_245];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)force3xCluster
{
  if (force3xCluster_onceToken != -1) {
    dispatch_once(&force3xCluster_onceToken, &__block_literal_global_247);
  }
  id v2 = (void *)force3xCluster__force3xCluster;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __34__CARPrototypePref_force3xCluster__block_invoke()
{
  force3xCluster__force3xCluster = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.mediaexperience" key:@"kForce3xCluster" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_255];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)showPrototypeApps
{
  if (showPrototypeApps_onceToken != -1) {
    dispatch_once(&showPrototypeApps_onceToken, &__block_literal_global_257);
  }
  id v2 = (void *)showPrototypeApps__showPrototypeApps;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __37__CARPrototypePref_showPrototypeApps__block_invoke()
{
  showPrototypeApps__showPrototypeApps = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"showPrototypeApps" title:0 invertValueForState:0 valueChangedBlock:&__block_literal_global_262];
  return MEMORY[0x1F41817F8]();
}

void __37__CARPrototypePref_showPrototypeApps__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.refreshApps", 0, 0, 1u);
}

+ (CARPrototypePref)nowPlayingAlbumArt
{
  if (nowPlayingAlbumArt_onceToken != -1) {
    dispatch_once(&nowPlayingAlbumArt_onceToken, &__block_literal_global_264);
  }
  id v2 = (void *)nowPlayingAlbumArt__nowPlayingAlbumArt;
  return (CARPrototypePref *)v2;
}

void __38__CARPrototypePref_nowPlayingAlbumArt__block_invoke()
{
  CFPreferencesSetAppValue(@"MusicUIServiceNowPlayingAlbumArt", 0, @"com.apple.internal.carkitd");
  CFPreferencesAppSynchronize(@"com.apple.internal.carkitd");
  CRLocalizedStringForKey(@"INTERNAL_NOW_PLAYING_ALBUM_ART");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypePref prefWithDomain:@"com.apple.internal.carkitd" key:@"NowPlayingAlbumArtMode" title:v2 defaultValue:&unk_1F0318080 valueChangedBlock:&__block_literal_global_275];
  v1 = (void *)nowPlayingAlbumArt__nowPlayingAlbumArt;
  nowPlayingAlbumArt__nowPlayingAlbumArt = v0;
}

void __38__CARPrototypePref_nowPlayingAlbumArt__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.capabilities-changed", 0, 0, 1u);
}

+ (CARPrototypeBoolPref)showInternalSettings
{
  if (showInternalSettings_onceToken != -1) {
    dispatch_once(&showInternalSettings_onceToken, &__block_literal_global_277);
  }
  id v2 = (void *)showInternalSettings__showInternalSettings;
  return (CARPrototypeBoolPref *)v2;
}

void __40__CARPrototypePref_showInternalSettings__block_invoke()
{
  CRLocalizedStringForKey(@"INTERNAL_SETTINGS");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"showInternalSettings" title:v2 invertValueForState:0 valueChangedBlock:&__block_literal_global_285];
  v1 = (void *)showInternalSettings__showInternalSettings;
  showInternalSettings__showInternalSettings = v0;
}

void __40__CARPrototypePref_showInternalSettings__block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.refreshApps", 0, 0, 1u);
}

+ (CARPrototypeBoolPref)smartWidgetDebugShowScore
{
  if (smartWidgetDebugShowScore_onceToken != -1) {
    dispatch_once(&smartWidgetDebugShowScore_onceToken, &__block_literal_global_287);
  }
  id v2 = (void *)smartWidgetDebugShowScore__smartWidgetDebugShowScore;
  return (CARPrototypeBoolPref *)v2;
}

void __45__CARPrototypePref_smartWidgetDebugShowScore__block_invoke()
{
  CRLocalizedStringForKey(@"INTERNAL_SMART_WIDGET_SHOW_SCORE");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.CarPlayApp" key:@"CARSmartWidgetDebugShowScore" title:v2 invertValueForState:0 valueChangedBlock:0];
  v1 = (void *)smartWidgetDebugShowScore__smartWidgetDebugShowScore;
  smartWidgetDebugShowScore__smartWidgetDebugShowScore = v0;
}

+ (CARPrototypeBoolPref)smartWidgetDebugGestures
{
  if (smartWidgetDebugGestures_onceToken != -1) {
    dispatch_once(&smartWidgetDebugGestures_onceToken, &__block_literal_global_295);
  }
  id v2 = (void *)smartWidgetDebugGestures__smartWidgetDebugGestures;
  return (CARPrototypeBoolPref *)v2;
}

void __44__CARPrototypePref_smartWidgetDebugGestures__block_invoke()
{
  CRLocalizedStringForKey(@"INTERNAL_SMART_WIDGET_GESTURES");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.CarPlayApp" key:@"CARSmartWidgetDebugGestures" title:v2 invertValueForState:0 valueChangedBlock:0];
  v1 = (void *)smartWidgetDebugGestures__smartWidgetDebugGestures;
  smartWidgetDebugGestures__smartWidgetDebugGestures = v0;
}

+ (CARPrototypeBoolPref)smartWidgetRelaxHomeInRangeCheck
{
  if (smartWidgetRelaxHomeInRangeCheck_onceToken != -1) {
    dispatch_once(&smartWidgetRelaxHomeInRangeCheck_onceToken, &__block_literal_global_303);
  }
  id v2 = (void *)smartWidgetRelaxHomeInRangeCheck__smartWidgetRelaxHomeInRangeCheck;
  return (CARPrototypeBoolPref *)v2;
}

void __52__CARPrototypePref_smartWidgetRelaxHomeInRangeCheck__block_invoke()
{
  CRLocalizedStringForKey(@"INTERNAL_SMART_WIDGET_RELAXED_INRANGE");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.CarPlayApp" key:@"CARSmartWidgetDebugRelaxHomeInRangeCheck" title:v2 invertValueForState:0 valueChangedBlock:0];
  v1 = (void *)smartWidgetRelaxHomeInRangeCheck__smartWidgetRelaxHomeInRangeCheck;
  smartWidgetRelaxHomeInRangeCheck__smartWidgetRelaxHomeInRangeCheck = v0;
}

+ (CARPrototypeBoolPref)fakeNeatlineDashboardSupport
{
  if (fakeNeatlineDashboardSupport_onceToken != -1) {
    dispatch_once(&fakeNeatlineDashboardSupport_onceToken, &__block_literal_global_311);
  }
  id v2 = (void *)fakeNeatlineDashboardSupport__fakeNeatlineDashboardEnabled;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __48__CARPrototypePref_fakeNeatlineDashboardSupport__block_invoke()
{
  fakeNeatlineDashboardSupport__fakeNeatlineDashboardEnabled = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"kCarPlayFakeNeatlineDashboard" title:@"Fake Neatline Dashboard" invertValueForState:0 valueChangedBlock:&__block_literal_global_319];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypePref)statusBarEdgeOverride
{
  if (statusBarEdgeOverride_onceToken != -1) {
    dispatch_once(&statusBarEdgeOverride_onceToken, &__block_literal_global_321);
  }
  id v2 = (void *)statusBarEdgeOverride__statusBarEdgeOverride;
  return (CARPrototypePref *)v2;
}

uint64_t __41__CARPrototypePref_statusBarEdgeOverride__block_invoke()
{
  statusBarEdgeOverride__statusBarEdgeOverride = +[CARPrototypePref prefWithDomain:@"com.apple.carplay.internal" key:@"CARStatusBarEdgeOverride" title:@"Status bar edge override" defaultValue:&unk_1F0318098 valueChangedBlock:&__block_literal_global_332];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypePref)statusBarHorizontalThreshold
{
  if (statusBarHorizontalThreshold_onceToken != -1) {
    dispatch_once(&statusBarHorizontalThreshold_onceToken, &__block_literal_global_334);
  }
  id v2 = (void *)statusBarHorizontalThreshold__statusBarHorizontalThreshold;
  return (CARPrototypePref *)v2;
}

uint64_t __48__CARPrototypePref_statusBarHorizontalThreshold__block_invoke()
{
  statusBarHorizontalThreshold__statusBarHorizontalThreshold = +[CARPrototypePref prefWithDomain:@"com.apple.carplay.internal" key:@"CARStatusBarHorizontalThreshold" title:@"Status bar horizontal threshold" defaultValue:&unk_1F03180B0 valueChangedBlock:&__block_literal_global_345];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypeBoolPref)flipDashboardLayout
{
  if (flipDashboardLayout_onceToken != -1) {
    dispatch_once(&flipDashboardLayout_onceToken, &__block_literal_global_347);
  }
  id v2 = (void *)flipDashboardLayout__flipDashboardLayout;
  return (CARPrototypeBoolPref *)v2;
}

uint64_t __39__CARPrototypePref_flipDashboardLayout__block_invoke()
{
  flipDashboardLayout__flipDashboardLayout = +[CARPrototypeBoolPref prefWithDomain:@"com.apple.carplay.internal" key:@"CARFlipDashboardLayout" title:@"Flip Dashboard Layout" invertValueForState:0 valueChangedBlock:&__block_literal_global_355];
  return MEMORY[0x1F41817F8]();
}

+ (CARPrototypePref)prefWithDomain:(id)a3 key:(id)a4 title:(id)a5 defaultValue:(id)a6 valueChangedBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)a1);
  [v17 setDomain:v16];

  [v17 setKey:v15];
  [v17 setTitle:v14];

  [v17 setDefaultValue:v13];
  [v17 setValueChangedBlock:v12];

  return (CARPrototypePref *)v17;
}

- (id)value
{
  BOOL v3 = [(CARPrototypePref *)self domain];
  CFPreferencesAppSynchronize(v3);

  id v4 = [(CARPrototypePref *)self key];
  v5 = [(CARPrototypePref *)self domain];
  uint64_t v6 = (void *)CFPreferencesCopyAppValue(v4, v5);

  return v6;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  v5 = [(CARPrototypePref *)self value];
  id value = v4;
  uint64_t v6 = [(CARPrototypePref *)self key];
  uint64_t v7 = [(CARPrototypePref *)self domain];
  CFPreferencesSetAppValue(v6, value, v7);

  uint64_t v8 = [(CARPrototypePref *)self domain];
  CFPreferencesAppSynchronize(v8);

  v9 = [(CARPrototypePref *)self valueChangedBlock];

  if (v9)
  {
    v10 = [(CARPrototypePref *)self valueChangedBlock];
    ((void (**)(void, void *, id))v10)[2](v10, v5, value);
  }
}

- (id)valueOrDefault
{
  BOOL v3 = [(CARPrototypePref *)self value];

  if (v3) {
    [(CARPrototypePref *)self value];
  }
  else {
  id v4 = [(CARPrototypePref *)self defaultValue];
  }
  return v4;
}

- (BOOL)state
{
  id v2 = [(CARPrototypePref *)self value];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setState:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CARPrototypePref *)self defaultValue];
    [(CARPrototypePref *)self setValue:v4];
  }
  else
  {
    [(CARPrototypePref *)self setValue:0];
  }
}

+ (NSDictionary)prototypePrefCache
{
  CFPreferencesAppSynchronize(@"com.apple.carplay.internal");
  BOOL v3 = (void *)CFPreferencesCopyAppValue(@"PrototypePrefCache", @"com.apple.carplay.internal");
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v4 = objc_opt_new();

    [a1 setPrototypePrefCache:v4];
    BOOL v3 = (void *)v4;
  }
  return (NSDictionary *)v3;
}

+ (void)setPrototypePrefCache:(id)a3
{
  CFPreferencesSetAppValue(@"PrototypePrefCache", a3, @"com.apple.carplay.internal");
  CFPreferencesAppSynchronize(@"com.apple.carplay.internal");
}

- (id)cachedValue
{
  BOOL v3 = [(id)objc_opt_class() prototypePrefCache];
  uint64_t v4 = [(CARPrototypePref *)self domain];
  v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [(CARPrototypePref *)self key];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)setCachedValue:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() prototypePrefCache];
  id v13 = [v5 carMutableDeepCopy];

  uint64_t v6 = [(CARPrototypePref *)self domain];
  uint64_t v7 = [v13 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    v9 = [(CARPrototypePref *)self domain];
    [v13 setObject:v8 forKeyedSubscript:v9];
  }
  v10 = [(CARPrototypePref *)self domain];
  v11 = [v13 objectForKeyedSubscript:v10];
  id v12 = [(CARPrototypePref *)self key];
  [v11 setObject:v4 forKeyedSubscript:v12];

  [(id)objc_opt_class() setPrototypePrefCache:v13];
}

- (id)cachedValueOrDefault
{
  BOOL v3 = [(CARPrototypePref *)self cachedValue];

  if (v3) {
    [(CARPrototypePref *)self cachedValue];
  }
  else {
  id v4 = [(CARPrototypePref *)self defaultValue];
  }
  return v4;
}

- (BOOL)cachedState
{
  id v2 = [(CARPrototypePref *)self cachedValue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setCachedState:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CARPrototypePref *)self defaultValue];
    [(CARPrototypePref *)self setCachedValue:v4];
  }
  else
  {
    [(CARPrototypePref *)self setCachedValue:0];
  }
}

- (id)internalSettingsValue
{
  if (+[CARPrototypePref confirmedSafe]) {
    [(CARPrototypePref *)self value];
  }
  else {
  BOOL v3 = [(CARPrototypePref *)self cachedValue];
  }
  return v3;
}

- (void)setInternalSettingsValue:(id)a3
{
  id v4 = a3;
  if (+[CARPrototypePref confirmedSafe]) {
    [(CARPrototypePref *)self setValue:v4];
  }
  else {
    [(CARPrototypePref *)self setCachedValue:v4];
  }
}

- (BOOL)internalSettingsState
{
  if (+[CARPrototypePref confirmedSafe])
  {
    return [(CARPrototypePref *)self state];
  }
  else
  {
    return [(CARPrototypePref *)self cachedState];
  }
}

- (void)setInternalSettingsState:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[CARPrototypePref confirmedSafe])
  {
    [(CARPrototypePref *)self setState:v3];
  }
  else
  {
    [(CARPrototypePref *)self setCachedState:v3];
  }
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CARPrototypePref *)self domain];
  uint64_t v6 = [(CARPrototypePref *)self key];
  uint64_t v7 = [(CARPrototypePref *)self value];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p %@-%@=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (id)valueChangedBlock
{
  return self->_valueChangedBlock;
}

- (void)setValueChangedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueChangedBlock, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end