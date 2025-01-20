@interface ASFController
+ (id)sharedController;
- (AFPreferences)afPreferences;
- (ASFApplicationSupplier)applicationSupplier;
- (ASFController)init;
- (ASFNotificationSettingsCenter)notificationSettingsCenter;
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)assistantIsEnabled;
- (BOOL)hardwareButtonAssistantIsEnabled;
- (BOOL)isAnnounceNotificationEnabled;
- (BOOL)isAnnounceNotificationEnabledForApp:(id)a3;
- (BOOL)isAnnounceNotificationEnabledForPlatform:(int64_t)a3;
- (BOOL)isCallHangUpEnabled;
- (BOOL)isLearningEnabledForApp:(id)a3;
- (BOOL)isShowSuggestionsEnabledInApp:(id)a3;
- (BOOL)isSpokenNotificationSkipTriggerlessReplyConfirmationEnabled;
- (BOOL)isVoiceTriggerEnabled;
- (BOOL)siriResponseShouldAlwaysPrint;
- (BOOL)typeToSiriIsEnabled;
- (VTPreferences)voiceTriggerPreferences;
- (id)getAllNotificationAppIds;
- (id)getAllNotificationApps;
- (id)siriSuggestionClients;
- (int64_t)useDeviceSpeakerForTTS;
- (void)setAlwaysShowRecognizedSpeech:(BOOL)a3;
- (void)setAnnounceNotificationEnabled:(BOOL)a3;
- (void)setAnnounceNotificationEnabledForApp:(id)a3 annouceNotificationEnabled:(BOOL)a4;
- (void)setAnnounceNotificationEnabledForPlatform:(int64_t)a3 annouceNotificationEnabled:(BOOL)a4;
- (void)setAssistantIsEnabled:(BOOL)a3;
- (void)setCallHangUpEnabled:(BOOL)a3;
- (void)setHardwareButtonAssistant:(BOOL)a3;
- (void)setLearningForApp:(id)a3 enabled:(BOOL)a4;
- (void)setShowSuggestionsInApp:(id)a3 enabled:(BOOL)a4;
- (void)setSiriResponseShouldAlwaysPrint:(BOOL)a3;
- (void)setSpokenNotificationSkipTriggerlessReplyConfirmationEnabled:(BOOL)a3;
- (void)setTypeToSiriEnabled:(BOOL)a3;
- (void)setUseDeviceSpeakerForTTS:(int64_t)a3;
@end

@implementation ASFController

+ (id)sharedController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "+[ASFController sharedController]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ASFController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken_2 != -1) {
    dispatch_once(&sharedController_onceToken_2, block);
  }
  v4 = (void *)sharedController_sharedController_0;

  return v4;
}

uint64_t __33__ASFController_sharedController__block_invoke(uint64_t a1)
{
  sharedController_sharedController_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (ASFController)init
{
  v10.receiver = self;
  v10.super_class = (Class)ASFController;
  v2 = [(ASFController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F85AF0] sharedPreferences];
    voiceTriggerPreferences = v2->_voiceTriggerPreferences;
    v2->_voiceTriggerPreferences = (VTPreferences *)v3;

    v5 = objc_alloc_init(ASFApplicationSupplier);
    applicationSupplier = v2->_applicationSupplier;
    v2->_applicationSupplier = v5;

    uint64_t v7 = [MEMORY[0x263F285A0] sharedPreferences];
    afPreferences = v2->_afPreferences;
    v2->_afPreferences = (AFPreferences *)v7;
  }
  return v2;
}

- (ASFNotificationSettingsCenter)notificationSettingsCenter
{
  return (ASFNotificationSettingsCenter *)[MEMORY[0x263F84580] currentNotificationSettingsCenter];
}

- (BOOL)assistantIsEnabled
{
  v2 = [(ASFController *)self afPreferences];
  char v3 = [v2 assistantIsEnabled];

  return v3;
}

- (void)setAssistantIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ASFController *)self afPreferences];
  int v6 = [v5 assistantIsEnabled];

  if (v6 != v3)
  {
    uint64_t v7 = [(ASFController *)self afPreferences];
    [v7 setAssistantIsEnabled:v3];

    id v8 = [(ASFController *)self afPreferences];
    [v8 synchronize];
  }
}

- (BOOL)isVoiceTriggerEnabled
{
  v2 = [(ASFController *)self voiceTriggerPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

- (BOOL)hardwareButtonAssistantIsEnabled
{
  return _AXSHomeButtonAssistant() == 0;
}

- (void)setHardwareButtonAssistant:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  MEMORY[0x270F90A30](v3, a2);
}

- (BOOL)typeToSiriIsEnabled
{
  return [(AFPreferences *)self->_afPreferences quickTypeGestureEnabled];
}

- (void)setTypeToSiriEnabled:(BOOL)a3
{
}

- (BOOL)alwaysShowRecognizedSpeech
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController alwaysShowRecognizedSpeech]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v4 = [(ASFController *)self afPreferences];
  char v5 = [v4 alwaysShowRecognizedSpeech];

  return v5;
}

- (void)setAlwaysShowRecognizedSpeech:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController setAlwaysShowRecognizedSpeech:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  int v6 = [(ASFController *)self afPreferences];
  [v6 setAlwaysShowRecognizedSpeech:v3];
}

- (BOOL)siriResponseShouldAlwaysPrint
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController siriResponseShouldAlwaysPrint]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v4 = [(ASFController *)self afPreferences];
  char v5 = [v4 siriResponseShouldAlwaysPrint];

  return v5;
}

- (void)setSiriResponseShouldAlwaysPrint:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController setSiriResponseShouldAlwaysPrint:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  int v6 = [(ASFController *)self afPreferences];
  [v6 setSiriResponseShouldAlwaysPrint:v3];
}

- (int64_t)useDeviceSpeakerForTTS
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController useDeviceSpeakerForTTS]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v4 = [(ASFController *)self afPreferences];
  int64_t v5 = [v4 useDeviceSpeakerForTTS];

  return v5;
}

- (void)setUseDeviceSpeakerForTTS:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController setUseDeviceSpeakerForTTS:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  int v6 = [(ASFController *)self afPreferences];
  [v6 setUseDeviceSpeakerForTTS:a3];
}

- (BOOL)isCallHangUpEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController isCallHangUpEnabled]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v4 = [(ASFController *)self voiceTriggerPreferences];
  char v5 = [v4 canUseVoiceTriggerDuringPhoneCall];

  return v5;
}

- (void)setCallHangUpEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ASFController setCallHangUpEnabled:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  int v6 = [(ASFController *)self voiceTriggerPreferences];
  [v6 setCanUseVoiceTriggerDuringPhoneCall:v3];
}

- (BOOL)isAnnounceNotificationEnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ASFController isAnnounceNotificationEnabled]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  v4 = [(ASFController *)self notificationSettingsCenter];
  char v5 = [v4 notificationSystemSettings];
  BOOL v6 = [v5 announcementSetting] == 2;

  return v6;
}

- (void)setAnnounceNotificationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[ASFController setAnnounceNotificationEnabled:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  BOOL v6 = [(ASFController *)self notificationSettingsCenter];
  int v7 = [v6 notificationSystemSettings];
  int v8 = (void *)[v7 mutableCopy];

  if (v3) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v8 setAnnouncementSetting:v9];
  [v6 setNotificationSystemSettings:v8];
}

- (BOOL)isSpokenNotificationSkipTriggerlessReplyConfirmationEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[ASFController isSpokenNotificationSkipTriggerlessReplyConfirmationEnabled]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v4 = [(ASFController *)self afPreferences];
  char v5 = [v4 spokenNotificationSkipTriggerlessReplyConfirmation];

  return v5;
}

- (void)setSpokenNotificationSkipTriggerlessReplyConfirmationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[ASFController setSpokenNotificationSkipTriggerlessReplyConfirmationEnabled:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  BOOL v6 = [(ASFController *)self afPreferences];
  [v6 setSpokenNotificationSkipTriggerlessReplyConfirmation:v3];
}

- (BOOL)isAnnounceNotificationEnabledForPlatform:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[ASFController isAnnounceNotificationEnabledForPlatform:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
  }
  BOOL v6 = [(ASFController *)self notificationSettingsCenter];
  int v7 = [v6 notificationSystemSettings];

  switch(a3)
  {
    case 1:
      uint64_t v8 = [v7 announcementHeadphonesSetting];
      goto LABEL_7;
    case 2:
      uint64_t v8 = [v7 announcementCarPlaySetting];
LABEL_7:
      BOOL v9 = v8 == 2;
      break;
    case 3:
      int v10 = [(ASFController *)self afPreferences];
      char v11 = [v10 announceNotificationsOnHearingAidsEnabled];
      goto LABEL_10;
    case 4:
      int v10 = [(ASFController *)self afPreferences];
      char v11 = [v10 announceNotificationsOnBuiltInSpeakerEnabled];
LABEL_10:
      BOOL v9 = v11;

      break;
    default:
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (void)setAnnounceNotificationEnabledForPlatform:(int64_t)a3 annouceNotificationEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v7 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[ASFController setAnnounceNotificationEnabledForPlatform:annouceNotificationEnabled:]";
    _os_log_impl(&dword_2487B3000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  BOOL v9 = [(ASFController *)self notificationSettingsCenter];
  int v10 = [v9 notificationSystemSettings];
  char v11 = (void *)[v10 mutableCopy];

  switch(a3)
  {
    case 1:
    case 2:
      if (v4) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      [v11 setAnnouncementHeadphonesSetting:v12];
      [v9 setNotificationSystemSettings:v11];
      break;
    case 3:
      v14 = [(ASFController *)self afPreferences];
      [v14 setAnnounceNotificationsOnHearingAidsEnabled:v4];
      goto LABEL_12;
    case 4:
      v14 = [(ASFController *)self afPreferences];
      [v14 setAnnounceNotificationsOnBuiltInSpeakerEnabled:v4];
LABEL_12:

      break;
    default:
      int v13 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        v16 = "-[ASFController setAnnounceNotificationEnabledForPlatform:annouceNotificationEnabled:]";
        _os_log_impl(&dword_2487B3000, v13, OS_LOG_TYPE_DEFAULT, "%s The platform is not found for announce notification setting.", (uint8_t *)&v15, 0xCu);
      }
      break;
  }
}

- (id)getAllNotificationApps
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[ASFController getAllNotificationApps]";
    _os_log_impl(&dword_2487B3000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  BOOL v4 = [MEMORY[0x263EFF9C0] set];
  char v5 = [(ASFController *)self notificationSettingsCenter];
  BOOL v6 = [v5 allNotificationSources];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isHiddenFromSettings", (void)v18) & 1) == 0)
        {
          int v13 = [ASFApplication alloc];
          v14 = [v12 sourceIdentifier];
          int v15 = [v12 displayName];
          v16 = [(ASFApplication *)v13 initWithBundleId:v14 localizedName:v15];
          [v4 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)getAllNotificationAppIds
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(ASFController *)self getAllNotificationApps];
  BOOL v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleId", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isAnnounceNotificationEnabledForApp:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    int v15 = "-[ASFController isAnnounceNotificationEnabledForApp:]";
    _os_log_impl(&dword_2487B3000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v6 = [(ASFController *)self notificationSettingsCenter];
  uint64_t v7 = v6;
  if (v4
    && ([v6 notificationSourceWithIdentifier:v4],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = v8;
    uint64_t v10 = [v8 sourceSettings];
    long long v11 = [v10 notificationSettings];
    BOOL v12 = [v11 announcementSetting] == 2;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setAnnounceNotificationEnabledForApp:(id)a3 annouceNotificationEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[ASFController setAnnounceNotificationEnabledForApp:annouceNotificationEnabled:]";
    _os_log_impl(&dword_2487B3000, v7, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v8 = [(ASFController *)self notificationSettingsCenter];
  uint64_t v9 = [v8 notificationSourceWithIdentifier:v6];
  uint64_t v10 = [v9 sourceSettings];
  long long v11 = [v10 notificationSettings];
  BOOL v12 = (void *)[v11 mutableCopy];

  if (v4) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [v12 setAnnouncementSetting:v13];
  int v14 = (void *)[v12 copy];
  [v8 replaceNotificationSettings:v14 forNotificationSourceIdentifier:v6];
}

- (id)siriSuggestionClients
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.apple.store.Jolly", @"com.apple.mobilecal", @"com.apple.MobileAddressBook", @"com.apple.Home", @"com.apple.mobilemail", @"com.apple.Maps", @"com.apple.MobileSMS", @"com.apple.news", @"com.apple.mobilephone", @"com.apple.podcasts", @"com.apple.reminders", @"com.apple.mobilesafari", @"com.apple.tips", @"com.apple.iBooks", 0);
  BOOL v4 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(ASFApplicationSupplier *)self->_applicationSupplier applicationForBundleId:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isLearningEnabledForApp:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

- (void)setLearningForApp:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  char v5 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = (void *)[v5 mutableCopy];
  }
  else {
    uint64_t v7 = objc_opt_new();
  }
  uint64_t v8 = v7;
  if (v4)
  {
    [v7 removeObject:v10];
  }
  else if (([v7 containsObject:v10] & 1) == 0)
  {
    [v8 addObject:v10];
  }
  CFPreferencesSetAppValue(@"SiriCanLearnFromAppBlacklist", v8, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (BOOL)isShowSuggestionsEnabledInApp:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

- (void)setShowSuggestionsInApp:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  char v5 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = (void *)[v5 mutableCopy];
  }
  else {
    uint64_t v7 = objc_opt_new();
  }
  uint64_t v8 = v7;
  if (v4)
  {
    [v7 removeObject:v10];
  }
  else if (([v7 containsObject:v10] & 1) == 0)
  {
    [v8 addObject:v10];
  }
  CFPreferencesSetAppValue(@"AppCanShowSiriSuggestionsBlacklist", v8, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (VTPreferences)voiceTriggerPreferences
{
  return self->_voiceTriggerPreferences;
}

- (AFPreferences)afPreferences
{
  return self->_afPreferences;
}

- (ASFApplicationSupplier)applicationSupplier
{
  return self->_applicationSupplier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationSupplier, 0);
  objc_storeStrong((id *)&self->_afPreferences, 0);

  objc_storeStrong((id *)&self->_voiceTriggerPreferences, 0);
}

@end