@interface AssistantSiriInCallController
+ (BOOL)isSettingEnabled;
+ (BOOL)isSettingSupported;
+ (Class)_config;
+ (id)bundle;
+ (id)localizedSettingName;
- (id)_localizedFooterText;
- (id)_localizedHangUpTriggerPhrase;
- (id)enabled:(id)a3;
- (id)specifiers;
- (void)_localizedHangUpTriggerPhrase;
- (void)setEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantSiriInCallController

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantBundle;
  if (!bundle_sAssistantBundle)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantBundle;
    bundle_sAssistantBundle = v3;

    v2 = (void *)bundle_sAssistantBundle;
  }

  return v2;
}

+ (BOOL)isSettingSupported
{
  if (_os_feature_enabled_impl()) {
    return 0;
  }
  v4 = (void *)[a1 _config];

  return [v4 supported];
}

+ (BOOL)isSettingEnabled
{
  v2 = (void *)[a1 _config];

  return [v2 enabled];
}

+ (id)localizedSettingName
{
  uint64_t v3 = [a1 bundle];
  v4 = objc_msgSend((id)objc_msgSend(a1, "_config"), "localizationKey");
  v5 = [v3 localizedStringForKey:v4 value:&stru_26D2AB140 table:@"AssistantSettings"];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantSiriInCallController;
  [(AssistantSiriInCallController *)&v3 viewWillAppear:a3];
}

- (id)specifiers
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SIRI_IN_CALL_GROUP"];
    v6 = [(AssistantSiriInCallController *)self _localizedFooterText];
    [v5 setProperty:v6 forKey:*MEMORY[0x263F600F8]];

    v7 = (void *)MEMORY[0x263F5FC40];
    v8 = +[AssistantSiriInCallController localizedSettingName];
    v9 = [v7 preferenceSpecifierNamed:v8 target:self set:sel_setEnabled_specifier_ get:sel_enabled_ detail:0 cell:6 edit:0];

    v13[0] = v5;
    v13[1] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v10;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)AssistantSiriInCallController;
  [(AssistantSiriInCallController *)&v23 viewDidAppear:a3];
  v22 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/SIRI_IN_CALL_ID"];
  id v4 = objc_alloc(MEMORY[0x263F08DB0]);
  v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  v8 = (void *)[v4 initWithKey:@"Call Hang Up" table:0 locale:v5 bundleURL:v7];

  v9 = +[GMEligibilityProvider shared];
  LODWORD(v6) = [v9 deviceSupported];

  if (v6) {
    v10 = @"Apple Intelligence & Siri";
  }
  else {
    v10 = @"Siri";
  }
  id v11 = objc_alloc(MEMORY[0x263F08DB0]);
  v12 = [MEMORY[0x263EFF960] currentLocale];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 bundleURL];
  v15 = (void *)[v11 initWithKey:v10 table:0 locale:v12 bundleURL:v14];

  id v16 = objc_alloc(MEMORY[0x263F08DB0]);
  v17 = [MEMORY[0x263EFF960] currentLocale];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 bundleURL];
  v20 = (void *)[v16 initWithKey:@"Call Hang Up" table:0 locale:v17 bundleURL:v19];

  v24[0] = v15;
  v24[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [(AssistantSiriInCallController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v8 localizedNavigationComponents:v21 deepLink:v22];
}

+ (Class)_config
{
  v2 = objc_opt_class();
  if (AFSupportsSiriInCall()) {
    v2 = objc_opt_class();
  }

  return (Class)v2;
}

- (id)enabled:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [(objc_class *)+[AssistantSiriInCallController _config] enabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  v5 = +[AssistantSiriInCallController _config];
  uint64_t v6 = [v4 BOOLValue];

  [(objc_class *)v5 setEnabled:v6];
}

- (id)_localizedFooterText
{
  uint64_t v3 = [(objc_class *)+[AssistantSiriInCallController _config] localizationFooterKey];
  id v4 = [v3 stringByAppendingString:@"_EXPLANATION"];

  if ((MEMORY[0x223C71780]() & 1) == 0)
  {
    uint64_t v5 = [v4 stringByAppendingString:@"_HEADPHONES_ONLY"];

    id v4 = (void *)v5;
  }
  uint64_t v6 = [(AssistantSiriInCallController *)self bundle];
  v7 = [v6 localizedStringForKey:v4 value:&stru_26D2AB140 table:@"AssistantSettings"];

  v8 = +[AssistantSiriInCallController _config];
  if (v8 == (objc_class *)objc_opt_class())
  {
    v9 = [(AssistantSiriInCallController *)self _localizedHangUpTriggerPhrase];
    uint64_t v10 = [NSString stringWithValidatedFormat:v7, @"%@", 0, v9 validFormatSpecifiers error];

    v7 = (void *)v10;
  }

  return v7;
}

- (id)_localizedHangUpTriggerPhrase
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  id v4 = [v3 languageCode];

  uint64_t v5 = [MEMORY[0x263F85AF0] sharedPreferences];
  uint64_t v6 = [v5 localizedTriggerPhraseForLanguageCode:v4];

  v7 = [MEMORY[0x263F28530] sharedInstance];
  v8 = [(AssistantSiriInCallController *)self bundle];
  v9 = [v7 localizedStringForKey:@"CALL_HANG_UP_TRIGGER_PHRASE" table:@"AssistantSettings" bundle:v8 languageCode:v4];

  if ([v6 length] && objc_msgSend(v9, "length"))
  {
    uint64_t v10 = [NSString stringWithValidatedFormat:v9, @"%@", 0, v6 validFormatSpecifiers error];
    id v11 = [v10 stringByReplacingOccurrencesOfString:@" " withString:@" "];
    v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "-[AssistantSiriInCallController _localizedHangUpTriggerPhrase]";
      __int16 v17 = 2112;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_220C23000, v12, OS_LOG_TYPE_DEFAULT, "%s languageCode: %@, triggerPhrase: %@", buf, 0x20u);
    }
  }
  else
  {
    v13 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(AssistantSiriInCallController *)(uint64_t)v4 _localizedHangUpTriggerPhrase];
    }
    id v11 = &stru_26D2AB140;
  }

  return v11;
}

- (void)_localizedHangUpTriggerPhrase
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[AssistantSiriInCallController _localizedHangUpTriggerPhrase]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_220C23000, a2, OS_LOG_TYPE_ERROR, "%s Missing localization for trigger phrase, languageCode: %@", (uint8_t *)&v2, 0x16u);
}

@end