__CFString *sub_3C80()
{
  __CFString *v0;
  uint64_t vars8;

  _AFPreferencesValueForKey();
  v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v0) {
    v0 = @"1.0";
  }

  return v0;
}

id sub_4318(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_alloc((Class)AFVoiceInfo);
  v6 = [v4 languageCode];
  id v7 = [v4 gender];
  id v8 = [v4 isCustom];

  id v9 = [v5 initWithLanguageCode:v6 gender:v7 isCustom:v8 name:v3 footprint:0 contentVersion:0 masteredVersion:0];

  return v9;
}

void sub_54B4(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  id v5 = _AFPreferencesValueForKey();
  if (v5)
  {
    id v7 = v5;
    v6 = _AFBackedUpPreferencesValueForKey();

    if (!v6)
    {
      _AFBackedUpPreferencesSetValueForKey();
      if (a2) {
        *a2 = 1;
      }
    }
    _AFPreferencesSetValueForKey();
    id v5 = v7;
    if (a3) {
      *a3 = 1;
    }
  }
}

uint64_t AFBackedUpPreferencesSynchronize()
{
  return _AFBackedUpPreferencesSynchronize();
}

uint64_t AFInternalPreferencesSynchronize()
{
  return _AFInternalPreferencesSynchronize();
}

uint64_t AFIsATV()
{
  return _AFIsATV();
}

uint64_t AFIsHorseman()
{
  return _AFIsHorseman();
}

uint64_t AFIsInternalInstall()
{
  return _AFIsInternalInstall();
}

uint64_t AFIsNano()
{
  return _AFIsNano();
}

uint64_t AFLogInitIfNeeded()
{
  return _AFLogInitIfNeeded();
}

uint64_t AFOutputVoiceLanguageForRecognitionLanguage()
{
  return _AFOutputVoiceLanguageForRecognitionLanguage();
}

uint64_t AFPreferencesDefaultsDeleteTypeToSiriSetting()
{
  return _AFPreferencesDefaultsDeleteTypeToSiriSetting();
}

uint64_t AFPreferencesDictationAllowed()
{
  return _AFPreferencesDictationAllowed();
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return _AFPreferencesTypeToSiriEnabled();
}

uint64_t AFProductVersion()
{
  return _AFProductVersion();
}

uint64_t AFShouldOptOutDataSharingForMigrationFromBuildVersion()
{
  return _AFShouldOptOutDataSharingForMigrationFromBuildVersion();
}

uint64_t AFShouldOptOutDataSharingForMigrationFromProductVersion()
{
  return _AFShouldOptOutDataSharingForMigrationFromProductVersion();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t DMGetUserDataDisposition()
{
  return _DMGetUserDataDisposition();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

uint64_t _AFBackedUpPreferencesSetValueForKey()
{
  return __AFBackedUpPreferencesSetValueForKey();
}

uint64_t _AFBackedUpPreferencesValueForKey()
{
  return __AFBackedUpPreferencesValueForKey();
}

uint64_t _AFPreferencesClearShouldCensorSpeechInternal()
{
  return __AFPreferencesClearShouldCensorSpeechInternal();
}

uint64_t _AFPreferencesLanguageCode()
{
  return __AFPreferencesLanguageCode();
}

uint64_t _AFPreferencesOutputVoice()
{
  return __AFPreferencesOutputVoice();
}

uint64_t _AFPreferencesSetAnnounceNotificationsInCarPlayType()
{
  return __AFPreferencesSetAnnounceNotificationsInCarPlayType();
}

uint64_t _AFPreferencesSetInProgressOutputVoice()
{
  return __AFPreferencesSetInProgressOutputVoice();
}

uint64_t _AFPreferencesSetOutputVoice()
{
  return __AFPreferencesSetOutputVoice();
}

uint64_t _AFPreferencesSetPhoneOptedOut2021()
{
  return __AFPreferencesSetPhoneOptedOut2021();
}

uint64_t _AFPreferencesSetSiriDataSharingOptInStatus()
{
  return __AFPreferencesSetSiriDataSharingOptInStatus();
}

uint64_t _AFPreferencesSetSiriResponseShouldAlwaysPrintOverride()
{
  return __AFPreferencesSetSiriResponseShouldAlwaysPrintOverride();
}

uint64_t _AFPreferencesSetValueForKey()
{
  return __AFPreferencesSetValueForKey();
}

uint64_t _AFPreferencesSiriDataSharingOptInStatus()
{
  return __AFPreferencesSiriDataSharingOptInStatus();
}

uint64_t _AFPreferencesValueForKey()
{
  return __AFPreferencesValueForKey();
}

uint64_t _AFSupportPreferencesBoolValueForKey()
{
  return __AFSupportPreferencesBoolValueForKey();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__cleanupBundleCaches(void *a1, const char *a2, ...)
{
  return [a1 _cleanupBundleCaches];
}

id objc_msgSend__cleanupiOS9PhotoAlbumData(void *a1, const char *a2, ...)
{
  return [a1 _cleanupiOS9PhotoAlbumData];
}

id objc_msgSend__performATVDictationMigration(void *a1, const char *a2, ...)
{
  return [a1 _performATVDictationMigration];
}

id objc_msgSend__performAlwaysPrintOverrideMigration(void *a1, const char *a2, ...)
{
  return [a1 _performAlwaysPrintOverrideMigration];
}

id objc_msgSend__performAppleAccountMigration(void *a1, const char *a2, ...)
{
  return [a1 _performAppleAccountMigration];
}

id objc_msgSend__performAudioFeedbackMigration(void *a1, const char *a2, ...)
{
  return [a1 _performAudioFeedbackMigration];
}

id objc_msgSend__performBootstrapSpeechIdMigration(void *a1, const char *a2, ...)
{
  return [a1 _performBootstrapSpeechIdMigration];
}

id objc_msgSend__performCarPlayAnnounceMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _performCarPlayAnnounceMigrationIfNeeded];
}

id objc_msgSend__performDictationMigration(void *a1, const char *a2, ...)
{
  return [a1 _performDictationMigration];
}

id objc_msgSend__performHomePodCensorSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performHomePodCensorSettingsMigration];
}

id objc_msgSend__performInternalToBackedUpMigration(void *a1, const char *a2, ...)
{
  return [a1 _performInternalToBackedUpMigration];
}

id objc_msgSend__performLoggingMigration(void *a1, const char *a2, ...)
{
  return [a1 _performLoggingMigration];
}

id objc_msgSend__performOutputVoiceMigration(void *a1, const char *a2, ...)
{
  return [a1 _performOutputVoiceMigration];
}

id objc_msgSend__performSessionLanguageMigration(void *a1, const char *a2, ...)
{
  return [a1 _performSessionLanguageMigration];
}

id objc_msgSend__performSiriDataSharingMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _performSiriDataSharingMigrationIfNeeded];
}

id objc_msgSend__performVoiceNameMigration(void *a1, const char *a2, ...)
{
  return [a1 _performVoiceNameMigration];
}

id objc_msgSend__performVoiceServicesLanguageMigration(void *a1, const char *a2, ...)
{
  return [a1 _performVoiceServicesLanguageMigration];
}

id objc_msgSend__removeOfflineMetrics(void *a1, const char *a2, ...)
{
  return [a1 _removeOfflineMetrics];
}

id objc_msgSend__removeTokenDomain(void *a1, const char *a2, ...)
{
  return [a1 _removeTokenDomain];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistantIsEnabled];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cloudSyncEnabled(void *a1, const char *a2, ...)
{
  return [a1 cloudSyncEnabled];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 dictationIsEnabled];
}

id objc_msgSend_fileLoggingIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 fileLoggingIsEnabled];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_gender(void *a1, const char *a2, ...)
{
  return [a1 gender];
}

id objc_msgSend_inProgressOutputVoice(void *a1, const char *a2, ...)
{
  return [a1 inProgressOutputVoice];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCustom(void *a1, const char *a2, ...)
{
  return [a1 isCustom];
}

id objc_msgSend_isSiriDataSharingRepromptEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSiriDataSharingRepromptEnabled];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_outputVoice(void *a1, const char *a2, ...)
{
  return [a1 outputVoice];
}

id objc_msgSend_resetSessionLanguage(void *a1, const char *a2, ...)
{
  return [a1 resetSessionLanguage];
}

id objc_msgSend_restoredBackupBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 restoredBackupBuildVersion];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeVoiceServicesLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 synchronizeVoiceServicesLanguageCode];
}

id objc_msgSend_voiceNamesForOutputLanguageCode_gender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceNamesForOutputLanguageCode:gender:");
}