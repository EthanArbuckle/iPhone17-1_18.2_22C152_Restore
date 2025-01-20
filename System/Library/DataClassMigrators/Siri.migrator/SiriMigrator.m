@interface SiriMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
- (void)_cleanupBundleCaches;
- (void)_cleanupiOS9PhotoAlbumData;
- (void)_performATVDictationMigration;
- (void)_performAlwaysPrintOverrideMigration;
- (void)_performAppleAccountMigration;
- (void)_performAudioFeedbackMigration;
- (void)_performBootstrapSpeechIdMigration;
- (void)_performCarPlayAnnounceMigrationIfNeeded;
- (void)_performDictationMigration;
- (void)_performHomePodCensorSettingsMigration;
- (void)_performInternalToBackedUpMigration;
- (void)_performLoggingMigration;
- (void)_performOutputVoiceMigration;
- (void)_performSessionLanguageMigration;
- (void)_performSiriDataSharingMigrationIfNeeded;
- (void)_performVoiceNameMigration;
- (void)_performVoiceServicesLanguageMigration;
- (void)_removeOfflineMetrics;
- (void)_removeTokenDomain;
@end

@implementation SiriMigrator

- (void)_performHomePodCensorSettingsMigration
{
  if (AFIsHorseman())
  {
    v2 = AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      v5 = "-[SiriMigrator _performHomePodCensorSettingsMigration]";
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v4, 0xCu);
    }
    if (_AFPreferencesClearShouldCensorSpeechInternal()) {
      AFBackedUpPreferencesSynchronize();
    }
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      v5 = "-[SiriMigrator _performHomePodCensorSettingsMigration]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_performAppleAccountMigration
{
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[SiriMigrator _performAppleAccountMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v8, 0xCu);
  }
  id v3 = objc_alloc_init((Class)ACAccountStore);
  int v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  if (v4)
  {
    v5 = +[AFPreferences sharedPreferences];
    id v6 = [v5 cloudSyncEnabled];
    [v4 setEnabled:v6 forDataclass:kAccountDataclassSiri];
    [v5 setCloudSyncEnabled:v6];
    [v3 saveAccount:v4 withCompletionHandler:0];
  }
  v7 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[SiriMigrator _performAppleAccountMigration]";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_removeOfflineMetrics
{
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[SiriMigrator _removeOfflineMetrics]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v9, 0xCu);
  }
  id v3 = NSHomeDirectoryForUser(@"mobile");
  int v4 = [v3 stringByAppendingPathComponent:@"Library"];
  v5 = [v4 stringByAppendingPathComponent:@"Assistant"];
  id v6 = [v5 stringByAppendingPathComponent:@"SiriMetrics"];

  v7 = +[NSFileManager defaultManager];
  [v7 removeItemAtPath:v6 error:0];

  int v8 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[SiriMigrator _removeOfflineMetrics]";
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_cleanupiOS9PhotoAlbumData
{
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SiriMigrator _cleanupiOS9PhotoAlbumData]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v10, 0xCu);
  }
  id v3 = +[NSFileManager defaultManager];
  int v4 = NSHomeDirectoryForUser(@"mobile");
  v5 = [v4 stringByAppendingPathComponent:@"Library/Siri"];
  id v6 = [v5 stringByAppendingString:@"/"];
  [v3 removeItemAtPath:v6 error:0];

  v7 = NSHomeDirectoryForUser(@"mobile");
  int v8 = [v7 stringByAppendingPathComponent:@"Library/Assistant/SynapseBundleIDRegistry.plist"];
  [v3 removeItemAtPath:v8 error:0];

  int v9 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SiriMigrator _cleanupiOS9PhotoAlbumData]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_removeTokenDomain
{
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[SiriMigrator _removeTokenDomain]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v9, 0xCu);
  }
  id v3 = NSHomeDirectoryForUser(@"mobile");
  int v4 = [v3 stringByAppendingPathComponent:@"Library"];
  v5 = [v4 stringByAppendingPathComponent:@"Preferences"];
  id v6 = [v5 stringByAppendingPathComponent:@"com.apple.assistant.token.plist"];

  v7 = +[NSFileManager defaultManager];
  [v7 removeItemAtPath:v6 error:0];

  int v8 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[SiriMigrator _removeTokenDomain]";
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_cleanupBundleCaches
{
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SiriMigrator _cleanupBundleCaches]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v10, 0xCu);
  }
  id v3 = +[NSFileManager defaultManager];
  int v4 = NSHomeDirectoryForUser(@"mobile");
  v5 = [v4 stringByAppendingPathComponent:@"Library"];
  id v6 = [v5 stringByAppendingPathComponent:@"Caches"];

  v7 = [v6 stringByAppendingPathComponent:@"com.apple.siri.bundleservicecache.plist"];
  [v3 removeItemAtPath:v7 error:0];
  int v8 = [v6 stringByAppendingPathComponent:@"com.apple.siri.PresentationPluginCache.plist"];
  [v3 removeItemAtPath:v8 error:0];
  int v9 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SiriMigrator _cleanupBundleCaches]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_performAudioFeedbackMigration
{
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SiriMigrator _performAudioFeedbackMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v10, 0xCu);
  }
  id v3 = _AFBackedUpPreferencesValueForKey();

  if (v3)
  {
    int v4 = sub_3C80();
    if ([v4 compare:@"14.0" options:64] == (id)-1)
    {
      id v6 = AFProductVersion();
      id v7 = [v6 compare:@"14.0" options:64];

      if (v7 != (id)-1)
      {
        int v8 = _AFBackedUpPreferencesValueForKey();
        int v9 = (char *)[v8 integerValue];

        if (v9 == (unsigned char *)&dword_0 + 2)
        {
          _AFBackedUpPreferencesSetValueForKey();
          AFBackedUpPreferencesSynchronize();
        }
      }
    }
    else
    {
    }
  }
  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SiriMigrator _performAudioFeedbackMigration]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_performATVDictationMigration
{
  char v2 = AFIsATV();
  id v3 = AFSiriLogContextUtility;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v11 = 136315138;
      v12 = "-[SiriMigrator _performATVDictationMigration]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v11, 0xCu);
    }
    v5 = sub_3C80();
    if ([v5 compare:@"9.2" options:64] == (id)-1)
    {
      id v6 = AFProductVersion();
      id v7 = [v6 compare:@"9.2" options:64];

      if (v7 == (id)-1)
      {
LABEL_8:
        int v8 = +[AFPreferences sharedPreferences];
        [v8 _setSuppressDictationOptInLocal:1];

        int v9 = +[AFPreferences sharedPreferences];
        [v9 synchronize];

        id v3 = AFSiriLogContextUtility;
        if (!os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO)) {
          return;
        }
        int v11 = 136315138;
        v12 = "-[SiriMigrator _performATVDictationMigration]";
        int v10 = "%s Complete";
        goto LABEL_12;
      }
      v5 = +[AFPreferences sharedPreferences];
      [v5 _setDictationIsEnabledLocal:0];
    }

    goto LABEL_8;
  }
  if (!v4) {
    return;
  }
  int v11 = 136315138;
  v12 = "-[SiriMigrator _performATVDictationMigration]";
  int v10 = "%s Device is not ATV. Skipping.";
LABEL_12:
  _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);
}

- (void)_performVoiceNameMigration
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315138;
    v25 = "-[SiriMigrator _performVoiceNameMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v24, 0xCu);
  }
  id v3 = +[AFPreferences sharedPreferences];
  BOOL v4 = [v3 outputVoice];

  if (v4)
  {
    v5 = +[AFLocalization sharedInstance];
    id v6 = [v4 languageCode];
    id v7 = objc_msgSend(v5, "voiceNamesForOutputLanguageCode:gender:", v6, objc_msgSend(v4, "gender"));

    int v8 = [v4 name];
    if (!v8 || ![v7 containsObject:v8])
    {
      uint64_t v9 = [v7 firstObject];
      int v10 = AFSiriLogContextUtility;
      if (v9)
      {
        int v11 = (void *)v9;
        if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
        {
          int v24 = 136315650;
          v25 = "-[SiriMigrator _performVoiceNameMigration]";
          __int16 v26 = 2112;
          v27 = v8;
          __int16 v28 = 2112;
          v29 = v11;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%s Updating voice name for output voice from '%@' to '%@'", (uint8_t *)&v24, 0x20u);
        }
        uint64_t v12 = sub_4318(v4, v11);

        _AFPreferencesSetOutputVoice();
        AFBackedUpPreferencesSynchronize();
        BOOL v4 = (void *)v12;
        goto LABEL_13;
      }
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        int v24 = 136315394;
        v25 = "-[SiriMigrator _performVoiceNameMigration]";
        __int16 v26 = 2112;
        v27 = v4;
        _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%s Could not find a voice name for output voice %@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
LABEL_13:
  v13 = +[AFPreferences sharedPreferences];
  v14 = [v13 inProgressOutputVoice];

  if (!v14) {
    goto LABEL_23;
  }
  v15 = +[AFLocalization sharedInstance];
  v16 = [v14 languageCode];
  v17 = objc_msgSend(v15, "voiceNamesForOutputLanguageCode:gender:", v16, objc_msgSend(v14, "gender"));

  v18 = [v14 name];
  if (v18 && [v17 containsObject:v18]) {
    goto LABEL_22;
  }
  uint64_t v19 = [v17 firstObject];
  v20 = AFSiriLogContextUtility;
  if (!v19)
  {
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315394;
      v25 = "-[SiriMigrator _performVoiceNameMigration]";
      __int16 v26 = 2112;
      v27 = v14;
      _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%s Could not find a voice name for in progress voice %@", (uint8_t *)&v24, 0x16u);
    }
LABEL_22:

    goto LABEL_23;
  }
  v21 = (void *)v19;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315650;
    v25 = "-[SiriMigrator _performVoiceNameMigration]";
    __int16 v26 = 2112;
    v27 = v18;
    __int16 v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%s Updating voice name for in progress voice from '%@' to '%@'", (uint8_t *)&v24, 0x20u);
  }
  uint64_t v22 = sub_4318(v14, v21);

  _AFPreferencesSetInProgressOutputVoice();
  v14 = (void *)v22;
LABEL_23:
  v23 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315138;
    v25 = "-[SiriMigrator _performVoiceNameMigration]";
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v24, 0xCu);
  }
}

- (void)_performDictationMigration
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v37 = 136315138;
    v38 = "-[SiriMigrator _performDictationMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v37, 0xCu);
  }
  if (AFIsHorseman())
  {
    id v3 = +[AFPreferences sharedPreferences];
    [v3 _setDictationIsEnabledLocal:0];
    [v3 synchronize];
    BOOL v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315138;
      v38 = "-[SiriMigrator _performDictationMigration]";
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Complete for HomePod", (uint8_t *)&v37, 0xCu);
    }
    goto LABEL_33;
  }
  int v5 = AFIsNano();
  id v6 = sub_3C80();
  id v7 = v6;
  if (v5)
  {
    if ([v6 compare:@"6.0" options:64] == (id)-1)
    {
      int v8 = AFProductVersion();
      id v9 = [v8 compare:@"6.0" options:64];

      if (v9 == (id)-1) {
        goto LABEL_18;
      }
      id v7 = +[AFPreferences sharedPreferences];
      if (([v7 dictationIsEnabled] & 1) == 0
        && [v7 assistantIsEnabled])
      {
        [v7 _setDictationIsEnabledLocal:1];
        [v7 synchronize];
      }
    }
    goto LABEL_17;
  }
  if ([v6 compare:@"8.3" options:64] != (id)-1) {
    goto LABEL_13;
  }
  v31 = AFProductVersion();
  id v32 = [v31 compare:@"8.3" options:64];

  if (v32 != (id)-1)
  {
    v33 = +[AFPreferences sharedPreferences];
    unsigned __int8 v34 = [v33 dictationIsEnabled];

    if ((v34 & 1) == 0
      && !CFPreferencesGetAppBooleanValue(@"UIKeyboardSupressDictationOptIn", kCFPreferencesAnyApplication, 0))
    {
      v35 = +[AFPreferences sharedPreferences];
      v36 = +[AFPreferences sharedPreferences];
      objc_msgSend(v35, "_setDictationIsEnabledLocal:", objc_msgSend(v36, "assistantIsEnabled"));

      id v7 = +[AFPreferences sharedPreferences];
      [v7 synchronize];
LABEL_13:
    }
  }
  id v7 = sub_3C80();
  if ([v7 compare:@"13.4.1" options:64] == (id)-1)
  {
    int v10 = AFProductVersion();
    id v11 = [v10 compare:@"13.4.1" options:64];

    if (v11 == (id)-1) {
      goto LABEL_18;
    }
    id v7 = +[AFPreferences sharedPreferences];
    [v7 setDictationSLSLanguagesEnabled:0];
  }
LABEL_17:

LABEL_18:
  if (AFIsATV()) {
    goto LABEL_23;
  }
  uint64_t v12 = sub_3C80();
  if ([v12 compare:@"10.0" options:64] == (id)-1)
  {
    v13 = AFProductVersion();
    id v14 = [v13 compare:@"10.0" options:64];

    if (v14 == (id)-1) {
      goto LABEL_23;
    }
    BOOL v15 = CFPreferencesGetAppBooleanValue(@"UIKeyboardSupressDictationOptIn", kCFPreferencesAnyApplication, 0) != 0;
    CFPreferencesSetAppValue(@"UIKeyboardSupressDictationOptIn", 0, kCFPreferencesAnyApplication);
    CFPreferencesAppSynchronize(kCFPreferencesAnyApplication);
    uint64_t v12 = +[AFPreferences sharedPreferences];
    [v12 _setSuppressDictationOptInLocal:v15];
  }

LABEL_23:
  uint64_t v16 = kAFUIKitDictationEnabledKey;
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:kAFUIKitPreferencesDomain];
  unsigned int v17 = [v3 BOOLForKey:v16];
  v18 = +[AFPreferences sharedPreferences];
  id v19 = [v18 dictationIsEnabled];

  if (v17 != v19)
  {
    v20 = +[AFPreferences sharedPreferences];
    [v20 _setDictationIsEnabledLocal:v19];

    v21 = +[AFPreferences sharedPreferences];
    [v21 synchronize];
  }
  uint64_t v22 = _AFSupportPreferencesBoolValueForKey();
  if (!v22)
  {
    v27 = +[AFPreferences sharedPreferences];
    uint64_t v28 = AFPreferencesDictationAllowed();
    __int16 v26 = v27;
    goto LABEL_29;
  }
  unsigned int v23 = [v3 BOOLForKey:kAFUIKitDictationAllowedKey];
  id v24 = [v22 BOOLValue];
  if (v23 != v24)
  {
    uint64_t v25 = (uint64_t)v24;
    __int16 v26 = +[AFPreferences sharedPreferences];
    v27 = v26;
    uint64_t v28 = v25;
LABEL_29:
    [v26 _setDictationIsAllowed:v28];

    v29 = +[AFPreferences sharedPreferences];
    [v29 synchronize];
  }
  v30 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v37 = 136315138;
    v38 = "-[SiriMigrator _performDictationMigration]";
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v37, 0xCu);
  }

LABEL_33:
}

- (void)_performBootstrapSpeechIdMigration
{
  char v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  BOOL v4 = AFSiriLogContextUtility;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if ((v3 & 1) == 0)
  {
    if (!v5) {
      return;
    }
    int v9 = 136315138;
    int v10 = "-[SiriMigrator _performBootstrapSpeechIdMigration]";
    int v8 = "%s Assistant is not enabled. Skipping.";
    goto LABEL_10;
  }
  if (v5)
  {
    int v9 = 136315138;
    int v10 = "-[SiriMigrator _performBootstrapSpeechIdMigration]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v9, 0xCu);
  }
  CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"Bootstrap Speech Identifier", @"com.apple.siri.backedup.encrypted");
  if (v6)
  {
    id v7 = v6;
    CFPreferencesSetAppValue(@"Bootstrap Speech Identifier", 0, @"com.apple.siri.backedup.encrypted");
    CFPreferencesAppSynchronize(@"com.apple.siri.backedup.encrypted");
    CFRelease(v7);
  }
  BOOL v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[SiriMigrator _performBootstrapSpeechIdMigration]";
    int v8 = "%s Complete";
LABEL_10:
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
  }
}

- (void)_performSessionLanguageMigration
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performSessionLanguageMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v5, 0xCu);
  }
  unsigned __int8 v3 = +[AFPreferences sharedPreferences];
  if (([v3 assistantIsEnabled] & 1) == 0) {
    [v3 resetSessionLanguage];
  }
  BOOL v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performSessionLanguageMigration]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_performVoiceServicesLanguageMigration
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performVoiceServicesLanguageMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v5, 0xCu);
  }
  unsigned __int8 v3 = +[AFPreferences sharedPreferences];
  if ([v3 assistantIsEnabled]) {
    [v3 synchronizeVoiceServicesLanguageCode];
  }
  BOOL v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFPropertyListRef v6 = "-[SiriMigrator _performVoiceServicesLanguageMigration]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_performAlwaysPrintOverrideMigration
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[SiriMigrator _performAlwaysPrintOverrideMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v7, 0xCu);
  }
  unsigned __int8 v3 = sub_3C80();
  if ([v3 compare:@"14.0" options:64] == (id)-1)
  {
    BOOL v4 = AFProductVersion();
    id v5 = [v4 compare:@"14.0" options:64];

    if (v5 != (id)-1)
    {
      AFPreferencesTypeToSiriEnabled();
      _AFPreferencesSetSiriResponseShouldAlwaysPrintOverride();
    }
  }
  else
  {
  }
  CFPropertyListRef v6 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[SiriMigrator _performAlwaysPrintOverrideMigration]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_performOutputVoiceMigration
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    id v19 = "-[SiriMigrator _performOutputVoiceMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v18, 0xCu);
  }
  unsigned __int8 v3 = _AFPreferencesOutputVoice();

  if (!v3)
  {
    BOOL v4 = _AFPreferencesLanguageCode();
    if (v4)
    {
      id v5 = objc_alloc((Class)AFVoiceInfo);
      CFPropertyListRef v6 = AFOutputVoiceLanguageForRecognitionLanguage();
      id v7 = [v5 initWithLanguageCode:v6 gender:0 isCustom:1];

      _AFPreferencesSetOutputVoice();
      AFBackedUpPreferencesSynchronize();
    }
  }
  int v8 = sub_3C80();
  id v9 = [v8 compare:@"13.0" options:64];

  if (v9 == (id)-1)
  {
    int v10 = _AFPreferencesLanguageCode();
    if ([v10 isEqualToString:@"en-IN"])
    {
      id v11 = _AFPreferencesOutputVoice();
      uint64_t v12 = [v11 languageCode];
      unsigned int v13 = [v12 isEqualToString:@"en-GB"];

      if (v13)
      {
        id v14 = objc_alloc((Class)AFVoiceInfo);
        BOOL v15 = AFOutputVoiceLanguageForRecognitionLanguage();
        id v16 = objc_msgSend(v14, "initWithLanguageCode:gender:isCustom:", v15, objc_msgSend(v11, "gender"), 1);

        _AFPreferencesSetOutputVoice();
        AFBackedUpPreferencesSynchronize();
      }
    }
  }
  unsigned int v17 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    id v19 = "-[SiriMigrator _performOutputVoiceMigration]";
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%s Complete", (uint8_t *)&v18, 0xCu);
  }
}

- (void)_performLoggingMigration
{
  char v2 = AFIsInternalInstall();
  unsigned __int8 v3 = AFSiriLogContextUtility;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if ((v2 & 1) == 0)
  {
    if (!v4) {
      return;
    }
    int v10 = 136315138;
    id v11 = "-[SiriMigrator _performLoggingMigration]";
    id v9 = "%s Device is not internal install. Skipping.";
    goto LABEL_13;
  }
  if (v4)
  {
    int v10 = 136315138;
    id v11 = "-[SiriMigrator _performLoggingMigration]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v10, 0xCu);
  }
  CFStringRef v5 = (const __CFString *)kAFLogPreferencesDomain;
  CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"AFSpeechLoggingEnabled", kAFLogPreferencesDomain);
  if (v6)
  {
    id v7 = (void *)v6;
    CFPreferencesSetAppValue(@"AFSpeechLoggingEnabled", 0, v5);
    int v8 = +[AFPreferences sharedPreferences];
    if ([v7 BOOLValue])
    {
      if (([v8 fileLoggingIsEnabled] & 1) == 0) {
        [v8 setFileLoggingIsEnabled:1];
      }
    }
    CFRelease(v7);

    CFPreferencesAppSynchronize(v5);
  }
  unsigned __int8 v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[SiriMigrator _performLoggingMigration]";
    id v9 = "%s Complete";
LABEL_13:
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
  }
}

- (void)_performInternalToBackedUpMigration
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[SiriMigrator _performInternalToBackedUpMigration]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", buf, 0xCu);
  }
  __int16 v6 = 0;
  sub_54B4(kAFHandsFreeModeKey, (unsigned char *)&v6 + 1, &v6);
  sub_54B4(kAFSessionLanguage, (unsigned char *)&v6 + 1, &v6);
  sub_54B4(kAFOutputVoice, (unsigned char *)&v6 + 1, &v6);
  unsigned __int8 v3 = AFPreferencesDefaultsDeleteTypeToSiriSetting();
  if (v3)
  {
    BOOL v4 = _AFBackedUpPreferencesValueForKey();

    if (!v4)
    {
      _AFBackedUpPreferencesSetValueForKey();
      HIBYTE(v6) = 1;
    }
  }
  sub_54B4(kAFAnnounceNotificationsOnBuiltInSpeaker, (unsigned char *)&v6 + 1, &v6);
  sub_54B4(kAFAnnounceNotificationsOnHearingAids, (unsigned char *)&v6 + 1, &v6);
  sub_54B4(kAFMessageWithoutConfirmationKey, (unsigned char *)&v6 + 1, &v6);
  sub_54B4(kAFMessageWithoutConfirmationInCarPlayKey, (unsigned char *)&v6 + 1, &v6);
  sub_54B4(kAFMessageWithoutConfirmationHeadphonesPlayKey, (unsigned char *)&v6 + 1, &v6);
  if (HIBYTE(v6)) {
    AFBackedUpPreferencesSynchronize();
  }
  if ((_BYTE)v6) {
    AFInternalPreferencesSynchronize();
  }
  CFStringRef v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[SiriMigrator _performInternalToBackedUpMigration]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s Complete", buf, 0xCu);
  }
}

- (float)migrationProgress
{
  return 1.0;
}

- (float)estimatedDuration
{
  return 0.01;
}

- (void)_performSiriDataSharingMigrationIfNeeded
{
  if (_AFPreferencesSiriDataSharingOptInStatus() != 1)
  {
    int v8 = AFSiriLogContextUtility;
    if (!os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v28 = 136315138;
    v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    __int16 v6 = "%s Device is not opted in to data sharing.";
    goto LABEL_7;
  }
  unsigned int v3 = +[AFFeatureFlags isSiriDataSharingRepromptEnabled];
  BOOL v4 = AFSiriLogContextUtility;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v5) {
      return;
    }
    int v28 = 136315138;
    v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    __int16 v6 = "%s Skipping siri data sharing migration. Reprompt is enabled.";
    id v7 = v4;
    goto LABEL_8;
  }
  if (v5)
  {
    int v28 = 136315138;
    v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Reprompt is disabled. Continuing with siri data sharing migration.", (uint8_t *)&v28, 0xCu);
  }
  int v9 = DMGetUserDataDisposition();
  if (v9 != 4)
  {
    if (v9 == 2)
    {
      int v10 = sub_3C80();
      if ((AFShouldOptOutDataSharingForMigrationFromProductVersion() & 1) == 0)
      {
        id v24 = AFSiriLogContextUtility;
        if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
        {
          int v28 = 136315138;
          v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "%s Device is upgrading from a sufficiently new iOS build.", (uint8_t *)&v28, 0xCu);
        }
        goto LABEL_40;
      }
    }
LABEL_16:
    if (AFIsHorseman())
    {
      int v8 = AFSiriLogContextUtility;
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        int v28 = 136315138;
        v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
        __int16 v6 = "%s Device is a HomePod. Exiting early..";
LABEL_7:
        id v7 = v8;
LABEL_8:
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v28, 0xCu);
        return;
      }
      return;
    }
    id v13 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.purplebuddy"];
    int v10 = [v13 objectForKey:@"SetupLastExit"];

    id v14 = objc_alloc_init((Class)NSDateComponents);
    int v15 = AFIsInternalInstall();
    if (v15) {
      uint64_t v16 = 2020;
    }
    else {
      uint64_t v16 = 2021;
    }
    if (v15) {
      uint64_t v17 = 10;
    }
    else {
      uint64_t v17 = 6;
    }
    if (v15) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 6;
    }
    [v14 setYear:v16];
    [v14 setMonth:v17];
    [v14 setDay:v18];
    [v14 setHour:0];
    [v14 setMinute:0];
    id v19 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v20 = [v19 dateFromComponents:v14];

    id v21 = [v10 compare:v20];
    uint64_t v22 = AFSiriLogContextUtility;
    BOOL v23 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
    if (v21 == (id)-1)
    {
      if (v23)
      {
        uint64_t v25 = v22;
        int v26 = AFIsATV();
        CFStringRef v27 = @"iOS";
        if (v26) {
          CFStringRef v27 = @"tvOS";
        }
        int v28 = 136315394;
        v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
        __int16 v30 = 2112;
        CFStringRef v31 = v27;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%s Device has not seen setup on %@ 15.", (uint8_t *)&v28, 0x16u);
      }
    }
    else
    {
      if (v23)
      {
        int v28 = 136315138;
        v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%s Migrate Siri Data Sharing status.", (uint8_t *)&v28, 0xCu);
      }
      _AFPreferencesSetSiriDataSharingOptInStatus();
      _AFPreferencesSetPhoneOptedOut2021();
    }
LABEL_40:

    return;
  }
  id v11 = [(SiriMigrator *)self restoredBackupBuildVersion];
  char v12 = AFShouldOptOutDataSharingForMigrationFromBuildVersion();

  if (v12) {
    goto LABEL_16;
  }
  int v8 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v28 = 136315138;
    v29 = "-[SiriMigrator _performSiriDataSharingMigrationIfNeeded]";
    __int16 v6 = "%s Device is restoring from a sufficiently new iOS build.";
    goto LABEL_7;
  }
}

- (void)_performCarPlayAnnounceMigrationIfNeeded
{
  char v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s Starting", (uint8_t *)&v17, 0xCu);
  }
  unsigned int v3 = (void *)CFPreferencesCopyAppValue(@"BBAnnounceCarPlaySetting", @"com.apple.bulletinboard");
  BOOL v4 = AFSiriLogContextUtility;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v17 = 136315394;
      uint64_t v18 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
      __int16 v19 = 2112;
      CFStringRef v20 = @"BBAnnounceCarPlaySetting";
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s User has previously set %@. No migration needed.", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      int v17 = 136315650;
      uint64_t v18 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
      __int16 v19 = 2112;
      CFStringRef v20 = @"BBAnnounceCarPlaySetting";
      __int16 v21 = 2112;
      uint64_t v22 = &off_8788;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Setting %@ to %@", (uint8_t *)&v17, 0x20u);
    }
    CFPreferencesSetAppValue(@"BBAnnounceCarPlaySetting", &off_8788, @"com.apple.bulletinboard");
    __int16 v6 = (void *)CFPreferencesCopyAppValue(@"BBAnnounceSetting", @"com.apple.bulletinboard");
    id v7 = v6;
    if (v6 && [v6 integerValue] != (char *)&dword_0 + 2)
    {
      int v8 = AFSiriLogContextUtility;
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315650;
        uint64_t v18 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
        __int16 v19 = 2112;
        CFStringRef v20 = @"BBAnnounceSetting";
        __int16 v21 = 2112;
        uint64_t v22 = &off_87A0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s Global announce is not enabled. Setting %@ to %@", (uint8_t *)&v17, 0x20u);
      }
      CFPreferencesSetAppValue(@"BBAnnounceSetting", &off_87A0, @"com.apple.bulletinboard");
      int v9 = (void *)CFPreferencesCopyAppValue(@"BBAnnounceSupportedForHeadPhones", @"com.apple.bulletinboard");
      int v10 = (void *)CFPreferencesCopyAppValue(@"BBAnnounceHeadphonesSetting", @"com.apple.bulletinboard");
      if (v9 && [v9 BOOLValue] && !v10)
      {
        id v11 = AFSiriLogContextUtility;
        if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
        {
          int v17 = 136315650;
          uint64_t v18 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
          __int16 v19 = 2112;
          CFStringRef v20 = @"BBAnnounceHeadphonesSetting";
          __int16 v21 = 2112;
          uint64_t v22 = &off_87B8;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s User has paired headphones, but disabled the global announce toggle. Setting %@ = %@ so they don't start getting headphone announcements.", (uint8_t *)&v17, 0x20u);
        }
        CFPreferencesSetAppValue(@"BBAnnounceHeadphonesSetting", &off_87B8, @"com.apple.bulletinboard");
      }
    }
    CFPreferencesAppSynchronize(@"com.apple.bulletinboard");
  }
  CFStringRef v12 = (const __CFString *)kAFAnnounceNotificationsInCarPlayType;
  id v13 = _AFPreferencesValueForKey();
  id v14 = (_UNKNOWN **)[v13 integerValue];

  if (v14)
  {
    int v15 = AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315650;
      uint64_t v18 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
      __int16 v19 = 2112;
      CFStringRef v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%s Migrating %@ to the backed up preferences domain. Setting value to %ld", (uint8_t *)&v17, 0x20u);
    }
    _AFPreferencesSetAnnounceNotificationsInCarPlayType();
    _AFPreferencesSetValueForKey();
  }
  uint64_t v16 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[SiriMigrator _performCarPlayAnnounceMigrationIfNeeded]";
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%s Completed", (uint8_t *)&v17, 0xCu);
  }
}

- (BOOL)performMigration
{
  AFLogInitIfNeeded();
  unsigned int v3 = sub_3C80();
  BOOL v4 = AFProductVersion();
  BOOL v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "-[SiriMigrator performMigration]";
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s Starting Siri data migration from %@ to %@...", (uint8_t *)&v8, 0x20u);
  }
  [(SiriMigrator *)self _performInternalToBackedUpMigration];
  [(SiriMigrator *)self _performLoggingMigration];
  [(SiriMigrator *)self _performSessionLanguageMigration];
  [(SiriMigrator *)self _performDictationMigration];
  [(SiriMigrator *)self _performATVDictationMigration];
  [(SiriMigrator *)self _performOutputVoiceMigration];
  [(SiriMigrator *)self _performVoiceServicesLanguageMigration];
  [(SiriMigrator *)self _performVoiceNameMigration];
  [(SiriMigrator *)self _performBootstrapSpeechIdMigration];
  [(SiriMigrator *)self _performAudioFeedbackMigration];
  [(SiriMigrator *)self _cleanupBundleCaches];
  [(SiriMigrator *)self _removeTokenDomain];
  [(SiriMigrator *)self _cleanupiOS9PhotoAlbumData];
  [(SiriMigrator *)self _performAppleAccountMigration];
  [(SiriMigrator *)self _removeOfflineMetrics];
  [(SiriMigrator *)self _performHomePodCensorSettingsMigration];
  [(SiriMigrator *)self _performAlwaysPrintOverrideMigration];
  [(SiriMigrator *)self _performCarPlayAnnounceMigrationIfNeeded];
  if ((AFIsHorseman() & 1) == 0) {
    [(SiriMigrator *)self _performSiriDataSharingMigrationIfNeeded];
  }
  _AFPreferencesSetValueForKey();
  AFInternalPreferencesSynchronize();
  __int16 v6 = AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "-[SiriMigrator performMigration]";
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s Finished Siri data migration from %@ to %@.", (uint8_t *)&v8, 0x20u);
  }

  return 1;
}

- (id)dataClassName
{
  return @"com.apple.siri.migrator";
}

@end