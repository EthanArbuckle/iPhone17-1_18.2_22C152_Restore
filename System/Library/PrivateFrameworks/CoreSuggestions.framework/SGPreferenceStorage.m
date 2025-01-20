@interface SGPreferenceStorage
+ (BOOL)EventMLRegexEnsembleExtractionEnabled;
+ (BOOL)allowAgeBasedPruning;
+ (BOOL)allowAnyDomainForMarkup;
+ (BOOL)allowGeocode;
+ (BOOL)allowUnverifiedSourceForMarkup;
+ (BOOL)alwaysShowCancelledEvents;
+ (BOOL)detectContacts;
+ (BOOL)detectMessageEventsML;
+ (BOOL)detectNLEvents;
+ (BOOL)detectReminders;
+ (BOOL)detectRemindersInMail;
+ (BOOL)detectStructuredEvents;
+ (BOOL)detectStructuredEventsML;
+ (BOOL)enableDKIMEnforcement;
+ (BOOL)hideEventsExtractedFromOldDocumentsForTests;
+ (BOOL)hidePastEventsForTests;
+ (BOOL)mailIntelligenceSPILogging;
+ (BOOL)onlyShowSignificantNLEvents;
+ (BOOL)onlyShowSignificantPseudoContacts;
+ (BOOL)shouldHarvestEvents;
+ (BOOL)showContactsFoundInMail;
+ (BOOL)showEventsFoundInMail;
+ (BOOL)showOperatingSystemVersionInSnippets;
+ (BOOL)showPastEvents;
+ (BOOL)showSuggestionsCalendar;
+ (BOOL)syncHistoryToCloud;
+ (BOOL)useMLModelForContactSharing;
+ (BOOL)useMLModelForContacts;
+ (BOOL)useMLModelForSelfId;
+ (BOOL)useManateeSaltForHistory;
+ (double)harvestBudgetCPUTimeSeconds;
+ (float)contactSharingNegativeSamplingRate;
+ (id)cloudKitPersistedState;
+ (id)defaults;
+ (id)detectSalientMails;
+ (id)didKVSMigrationTokenForIdentifier:(id)a3;
+ (id)disabledEventUpdateCategories;
+ (id)followUpComputeCustomTimeRangeForLanguage:(id)a3;
+ (id)followUpTimeRangeForDebugging;
+ (id)userAccountsPersistedState;
+ (int)registerBlockOnSuggestionsSettingsChange:(id)a3;
+ (int64_t)harvestBudgetNumberOfOperations;
+ (int64_t)hashedSessionsLogging;
+ (int64_t)messagesToProcessImmediately;
+ (int64_t)suggestionsLogLevel;
+ (void)removeDeprecatedDefaults;
+ (void)resetAllPreferences;
+ (void)resumeNotificationQueue;
+ (void)setAllowAgeBasedPruning:(BOOL)a3;
+ (void)setAllowAnyDomainForMarkup:(BOOL)a3;
+ (void)setAllowGeocodeForTests:(BOOL)a3;
+ (void)setAllowUnverifiedSourceForMarkup:(BOOL)a3;
+ (void)setAlwaysShowCancelledEvents:(BOOL)a3;
+ (void)setCloudKitPersistedState:(id)a3;
+ (void)setContactSharingNegativeSamplingRate:(float)a3;
+ (void)setContactsDetectionEnabledForTests:(BOOL)a3;
+ (void)setDetectContacts:(BOOL)a3;
+ (void)setDetectMessageEventsML:(BOOL)a3;
+ (void)setDetectNLEvents:(BOOL)a3;
+ (void)setDetectReminders:(BOOL)a3;
+ (void)setDetectRemindersInMail:(BOOL)a3;
+ (void)setDetectStructuredEvents:(BOOL)a3;
+ (void)setDetectStructuredEventsML:(BOOL)a3;
+ (void)setDidKVSMigrationToken:(id)a3 forIdentifier:(id)a4;
+ (void)setDisabledEventUpdateCategories:(id)a3;
+ (void)setEnableDKIMEnforcement:(BOOL)a3;
+ (void)setEnableEventsMLRegexEnsembleExtraction:(BOOL)a3;
+ (void)setEventsMLRegexEnsembleExtractionEnabledForTests:(BOOL)a3;
+ (void)setFirstPartyCalendarAppIsInstalled:(BOOL)a3;
+ (void)setFirstPartyMailAppIsInstalled:(BOOL)a3;
+ (void)setHarvestBudgetCPUTimeSeconds:(double)a3;
+ (void)setHarvestBudgetNumberOfOperations:(int64_t)a3;
+ (void)setHashedSessionsLogging:(int)a3;
+ (void)setHideEventsExtractedFromOldDocumentsForTests:(BOOL)a3;
+ (void)setHidePastEventsForTests:(BOOL)a3;
+ (void)setMailSaliencyDetectionEnabledForTests:(BOOL)a3;
+ (void)setMessageEventsMLDetectionEnabledForTests:(BOOL)a3;
+ (void)setMessagesToProcessImmediately:(int64_t)a3;
+ (void)setMessagesToProcessImmediatelyForTests:(int64_t)a3;
+ (void)setNLEventsDetectionEnabledForTests:(BOOL)a3;
+ (void)setOnlyShowSignificantNLEvents:(BOOL)a3;
+ (void)setOnlyShowSignificantPseudoContacts:(BOOL)a3;
+ (void)setOnlyShowSignificantPseudoContactsForTests:(BOOL)a3;
+ (void)setRemindersDetectionEnabledForTests:(BOOL)a3;
+ (void)setRemindersDetectionInMailEnabledForTests:(BOOL)a3;
+ (void)setShowCancelledEventsForTests:(BOOL)a3;
+ (void)setShowContactsFoundInMail:(BOOL)a3;
+ (void)setShowEventsFoundInMail:(BOOL)a3;
+ (void)setShowOperatingSystemVersionInSnippets:(BOOL)a3;
+ (void)setShowPastEvents:(BOOL)a3;
+ (void)setStructuredEventsDetectionEnabledForTests:(BOOL)a3;
+ (void)setStructuredEventsMLDetectionEnabledForTests:(BOOL)a3;
+ (void)setSyncHistoryToCloud:(BOOL)a3;
+ (void)setSyncHistoryToCloudForTests:(BOOL)a3;
+ (void)setUseMLModelForContactSharing:(BOOL)a3;
+ (void)setUseMLModelForContacts:(BOOL)a3;
+ (void)setUseMLModelForSelfId:(BOOL)a3;
+ (void)setUseMLModelForSelfIdForTests:(BOOL)a3;
+ (void)setUseManateeSaltForHistory:(BOOL)a3;
+ (void)setUserAccountsPersistedState:(id)a3;
+ (void)suspendNotificationQueue;
+ (void)updateBoolSettingKey:(id)a3 withValue:(BOOL)a4;
+ (void)updateDetection:(BOOL)a3 forKey:(id)a4;
+ (void)updateIntSettingKey:(id)a3 withValue:(int)a4;
@end

@implementation SGPreferenceStorage

+ (int)registerBlockOnSuggestionsSettingsChange:(id)a3
{
  id v3 = a3;
  v4 = +[SGPreferenceManager defaultManager];
  int v5 = [v4 registerBlock:v3];

  return v5;
}

+ (void)setCloudKitPersistedState:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaults];
  [v5 setValue:v4 forKey:@"CloudKitPersistedState"];
}

+ (id)defaults
{
  v2 = +[SGPreferenceManager defaultManager];
  id v3 = v2[1];

  return v3;
}

+ (void)resumeNotificationQueue
{
  v2 = +[SGPreferenceManager defaultManager];
  [v2 _resumeNotificationQueue];

  notificationQueueSuspended = 0;
}

+ (void)suspendNotificationQueue
{
  notificationQueueSuspended = 1;
  id v2 = +[SGPreferenceManager defaultManager];
  [v2 _suspendNotificationQueue];
}

+ (void)setEventsMLRegexEnsembleExtractionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)eventsMLRegexEnsembleExtractionEnabledForTests;
  eventsMLRegexEnsembleExtractionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setUseMLModelForSelfIdForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)useMLModelForSelfId;
  useMLModelForSelfId = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setMessagesToProcessImmediatelyForTests:(int64_t)a3
{
  uint64_t v3 = [NSNumber numberWithInteger:a3];
  id v4 = (void *)messagesToProcessImmediatelyForTests;
  messagesToProcessImmediatelyForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setSyncHistoryToCloudForTests:(BOOL)a3
{
  syncHistoryToCloudForTests = [NSNumber numberWithBool:a3];

  MEMORY[0x1F41817F8]();
}

+ (void)setAllowGeocodeForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)allowGeocode;
  allowGeocode = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setContactsDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)contactsDetectionEnabledForTests;
  contactsDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setMailSaliencyDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)mailSaliencyDetectionEnabledForTests;
  mailSaliencyDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setRemindersDetectionInMailEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)remindersDetectionInMailEnabledForTests;
  remindersDetectionInMailEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setStructuredEventsMLDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)structuredEventsMLDetectionEnabledForTests;
  structuredEventsMLDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setRemindersDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)remindersDetectionEnabledForTests;
  remindersDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setStructuredEventsDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)structuredEventsDetectionEnabledForTests;
  structuredEventsDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setMessageEventsMLDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)messageEventsMLDetectionEnabledForTests;
  messageEventsMLDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setNLEventsDetectionEnabledForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)nlEventsDetectionEnabledForTests;
  nlEventsDetectionEnabledForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setShowCancelledEventsForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)showCancelledEventsForTests;
  showCancelledEventsForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setHideEventsExtractedFromOldDocumentsForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)hideEventsExtractedFromOldDocumentsForTests;
  hideEventsExtractedFromOldDocumentsForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (BOOL)hideEventsExtractedFromOldDocumentsForTests
{
  return [(id)hideEventsExtractedFromOldDocumentsForTests BOOLValue];
}

+ (void)setHidePastEventsForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  id v4 = (void *)hidePastEventsForTests;
  hidePastEventsForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (BOOL)hidePastEventsForTests
{
  return [(id)hidePastEventsForTests BOOLValue];
}

+ (void)setEnableDKIMEnforcement:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 defaults];
  [v4 setBool:v3 forKey:@"EnableDKIMEnforcement"];
}

+ (BOOL)enableDKIMEnforcement
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"EnableDKIMEnforcement"];

  return v3;
}

+ (BOOL)mailIntelligenceSPILogging
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsMailIntelligenceSPILogging"];

  return v3;
}

+ (id)followUpComputeCustomTimeRangeForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaults];
  v6 = [v5 dictionaryForKey:@"SuggestionsFollowUpComputeCustomTimeRange"];
  v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

+ (id)followUpTimeRangeForDebugging
{
  id v2 = [a1 defaults];
  char v3 = [v2 dictionaryForKey:@"SuggestionsFollowUpTimeRangeForDebugging"];

  return v3;
}

+ (void)setHarvestBudgetCPUTimeSeconds:(double)a3
{
  id v4 = [a1 defaults];
  [v4 setDouble:@"SuggestionsHarvestBudgetCPUTimeSeconds" forKey:a3];
}

+ (double)harvestBudgetCPUTimeSeconds
{
  id v2 = [a1 defaults];
  [v2 doubleForKey:@"SuggestionsHarvestBudgetCPUTimeSeconds"];
  double v4 = v3;

  return v4;
}

+ (void)setHarvestBudgetNumberOfOperations:(int64_t)a3
{
  id v4 = [a1 defaults];
  [v4 setInteger:a3 forKey:@"SuggestionsHarvestBudgetNumberOfOperations"];
}

+ (int64_t)harvestBudgetNumberOfOperations
{
  id v2 = [a1 defaults];
  int64_t v3 = [v2 integerForKey:@"SuggestionsHarvestBudgetNumberOfOperations"];

  return v3;
}

+ (void)setShowOperatingSystemVersionInSnippets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 defaults];
  [v4 setBool:v3 forKey:@"ShowOperatingSystemVersionInSnippets"];
}

+ (BOOL)showOperatingSystemVersionInSnippets
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"ShowOperatingSystemVersionInSnippets"];

  return v3;
}

+ (void)setDidKVSMigrationToken:(id)a3 forIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  v9 = [v8 defaults];
  v10 = [v9 dictionaryForKey:@"DidKVSMigrationToken"];
  v11 = v10;
  if (!v10) {
    v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  v12 = (void *)[v10 mutableCopy];

  [v12 setObject:v6 forKeyedSubscript:v7];
  v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1A4D8C000, v13, OS_LOG_TYPE_DEFAULT, "setDidKVSMigrationToken:%{public}@ forIdentifier:%{public}@, new dict: %{public}@", (uint8_t *)&v15, 0x20u);
  }

  v14 = [v8 defaults];
  [v14 setObject:v12 forKey:@"DidKVSMigrationToken"];

  objc_sync_exit(v8);
}

+ (id)didKVSMigrationTokenForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaults];
  id v6 = [v5 dictionaryForKey:@"DidKVSMigrationToken"];

  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (void)setUseManateeSaltForHistory:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 defaults];
  [v4 setBool:v3 forKey:@"UseManateeSaltForHistory"];
}

+ (BOOL)useManateeSaltForHistory
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"UseManateeSaltForHistory"];

  return v3;
}

+ (void)setUserAccountsPersistedState:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaults];
  [v5 setValue:v4 forKey:@"UserAccountsPersistedState"];
}

+ (id)userAccountsPersistedState
{
  id v2 = [a1 defaults];
  char v3 = [v2 stringArrayForKey:@"UserAccountsPersistedState"];

  return v3;
}

+ (id)cloudKitPersistedState
{
  id v2 = [a1 defaults];
  char v3 = [v2 dataForKey:@"CloudKitPersistedState"];

  return v3;
}

+ (BOOL)shouldHarvestEvents
{
  if (!firstPartyCalendarAppIsInstalled || (int v2 = [(id)firstPartyCalendarAppIsInstalled BOOLValue]) != 0) {
    LOBYTE(v2) = 1;
  }
  return v2;
}

+ (void)setFirstPartyMailAppIsInstalled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!firstPartyMailAppIsInstalled || [(id)firstPartyMailAppIsInstalled BOOLValue] != a3)
  {
    uint64_t v4 = [NSNumber numberWithBool:v3];
    id v5 = (void *)firstPartyMailAppIsInstalled;
    firstPartyMailAppIsInstalled = v4;

    id v6 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];
    notify_post(v6);
  }
}

+ (void)setFirstPartyCalendarAppIsInstalled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!firstPartyCalendarAppIsInstalled
    || [(id)firstPartyCalendarAppIsInstalled BOOLValue] != a3)
  {
    uint64_t v4 = [NSNumber numberWithBool:v3];
    id v5 = (void *)firstPartyCalendarAppIsInstalled;
    firstPartyCalendarAppIsInstalled = v4;

    id v6 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];
    notify_post(v6);
  }
}

+ (void)setEnableEventsMLRegexEnsembleExtraction:(BOOL)a3
{
}

+ (void)setDetectRemindersInMail:(BOOL)a3
{
}

+ (void)setDetectStructuredEventsML:(BOOL)a3
{
}

+ (void)setDetectReminders:(BOOL)a3
{
}

+ (void)setDetectContacts:(BOOL)a3
{
  if (contactsDetectionEnabledForTests) {
    __assert_rtn("+[SGPreferenceStorage setDetectContacts:]", "SGPreferenceStorage.m", 699, "contactsDetectionEnabledForTests == nil");
  }

  [a1 updateDetection:a3 forKey:@"SuggestionsDetectContacts"];
}

+ (void)setDetectMessageEventsML:(BOOL)a3
{
  if (messageEventsMLDetectionEnabledForTests) {
    __assert_rtn("+[SGPreferenceStorage setDetectMessageEventsML:]", "SGPreferenceStorage.m", 692, "messageEventsMLDetectionEnabledForTests == nil");
  }

  [a1 updateDetection:a3 forKey:@"SuggestionsShowMessageEventsML"];
}

+ (void)setDetectNLEvents:(BOOL)a3
{
  if (nlEventsDetectionEnabledForTests) {
    __assert_rtn("+[SGPreferenceStorage setDetectNLEvents:]", "SGPreferenceStorage.m", 686, "nlEventsDetectionEnabledForTests == nil");
  }

  [a1 updateDetection:a3 forKey:@"SuggestionsShowNLEvents"];
}

+ (void)setDetectStructuredEvents:(BOOL)a3
{
  if (structuredEventsDetectionEnabledForTests) {
    __assert_rtn("+[SGPreferenceStorage setDetectStructuredEvents:]", "SGPreferenceStorage.m", 679, "structuredEventsDetectionEnabledForTests == nil");
  }

  [a1 updateDetection:a3 forKey:@"SuggestionsDetectStructuredEvents"];
}

+ (void)updateDetection:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [a1 defaults];
  [v7 setBool:v4 forKey:v6];

  id v8 = [a1 defaults];
  [v8 synchronize];

  v9 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v9);
}

+ (BOOL)EventMLRegexEnsembleExtractionEnabled
{
  if (eventsMLRegexEnsembleExtractionEnabledForTests)
  {
    int v2 = (void *)eventsMLRegexEnsembleExtractionEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsEventsMLRegexEnsembleExtractionEnabled"];

    return v5;
  }
}

+ (id)detectSalientMails
{
  if (mailSaliencyDetectionEnabledForTests)
  {
    id v2 = (id)mailSaliencyDetectionEnabledForTests;
  }
  else
  {
    BOOL v3 = [a1 defaults];
    id v2 = [v3 objectForKey:@"SuggestionsDetectSalientMails"];
  }

  return v2;
}

+ (BOOL)detectRemindersInMail
{
  if (remindersDetectionInMailEnabledForTests)
  {
    id v2 = (void *)remindersDetectionInMailEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsDetectRemindersInMail"];

    return v5;
  }
}

+ (BOOL)detectStructuredEventsML
{
  if (structuredEventsMLDetectionEnabledForTests)
  {
    id v2 = (void *)structuredEventsMLDetectionEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsDetectStructuredsEventML"];

    return v5;
  }
}

+ (BOOL)detectReminders
{
  if (remindersDetectionEnabledForTests)
  {
    id v2 = (void *)remindersDetectionEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsDetectReminders"];

    return v5;
  }
}

+ (BOOL)detectStructuredEvents
{
  if (structuredEventsDetectionEnabledForTests)
  {
    id v2 = (void *)structuredEventsDetectionEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsDetectStructuredEvents"];

    return v5;
  }
}

+ (BOOL)detectMessageEventsML
{
  if (messageEventsMLDetectionEnabledForTests)
  {
    id v2 = (void *)messageEventsMLDetectionEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsShowMessageEventsML"];

    return v5;
  }
}

+ (BOOL)detectNLEvents
{
  if (nlEventsDetectionEnabledForTests)
  {
    id v2 = (void *)nlEventsDetectionEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsShowNLEvents"];

    return v5;
  }
}

+ (BOOL)detectContacts
{
  if (contactsDetectionEnabledForTests)
  {
    id v2 = (void *)contactsDetectionEnabledForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsDetectContacts"];

    return v5;
  }
}

+ (void)setContactSharingNegativeSamplingRate:(float)a3
{
  char v5 = [a1 defaults];
  *(float *)&double v6 = a3;
  [v5 setFloat:@"SuggestionsContactSharingNegativeSamplingRate" forKey:v6];

  id v7 = [a1 defaults];
  [v7 synchronize];

  id v8 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v8);
}

+ (float)contactSharingNegativeSamplingRate
{
  id v2 = [a1 defaults];
  [v2 floatForKey:@"SuggestionsContactSharingNegativeSamplingRate"];
  float v4 = v3;

  return v4;
}

+ (void)setUseMLModelForContactSharing:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [a1 defaults];
  [v5 setBool:v3 forKey:@"SuggestionsUseMLModelForContactSharing"];

  double v6 = [a1 defaults];
  [v6 synchronize];

  id v7 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v7);
}

+ (BOOL)useMLModelForContactSharing
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsUseMLModelForContactSharing"];

  return v3;
}

+ (void)setUseMLModelForSelfId:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [a1 defaults];
  [v5 setBool:v3 forKey:@"SuggestionsUseMLModelForSelfId"];

  double v6 = [a1 defaults];
  [v6 synchronize];

  id v7 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v7);
}

+ (BOOL)useMLModelForSelfId
{
  if (useMLModelForSelfId)
  {
    id v2 = (void *)useMLModelForSelfId;
    return [v2 BOOLValue];
  }
  else
  {
    float v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsUseMLModelForSelfId"];

    return v5;
  }
}

+ (void)setUseMLModelForContacts:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [a1 defaults];
  [v5 setBool:v3 forKey:@"SuggestionsUseMLModelForContacts"];

  double v6 = [a1 defaults];
  [v6 synchronize];

  id v7 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v7);
}

+ (BOOL)useMLModelForContacts
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsUseMLModelForContacts"];

  return v3;
}

+ (void)setAllowAgeBasedPruning:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [a1 defaults];
  [v5 setBool:v3 forKey:@"SuggestionsAllowAgeBasedPruning"];

  double v6 = [a1 defaults];
  [v6 synchronize];

  id v7 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v7);
}

+ (BOOL)allowAgeBasedPruning
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsAllowAgeBasedPruning"];

  return v3;
}

+ (void)setDisabledEventUpdateCategories:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaults];
  [v5 setObject:v4 forKey:@"DisableEventUpdateCategories"];
}

+ (id)disabledEventUpdateCategories
{
  id v2 = [a1 defaults];
  char v3 = [v2 stringArrayForKey:@"DisableEventUpdateCategories"];
  id v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

+ (void)setAllowAnyDomainForMarkup:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 defaults];
  [v5 setBool:v3 forKey:@"SuggestionsAllowAnyDomainForMarkup"];

  double v6 = [a1 defaults];
  [v6 synchronize];

  id v7 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v7);
}

+ (BOOL)allowAnyDomainForMarkup
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsAllowAnyDomainForMarkup"];

  return v3;
}

+ (void)setAllowUnverifiedSourceForMarkup:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 defaults];
  [v5 setBool:v3 forKey:@"SuggestionsAllowUnverifiedSourceForMarkup"];

  double v6 = [a1 defaults];
  [v6 synchronize];

  id v7 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v7);
}

+ (BOOL)allowUnverifiedSourceForMarkup
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsAllowUnverifiedSourceForMarkup"];

  return v3;
}

+ (BOOL)allowGeocode
{
  if (allowGeocode) {
    id v2 = (void *)allowGeocode;
  }
  else {
    id v2 = (void *)MEMORY[0x1E4F1CC38];
  }
  return [v2 BOOLValue];
}

+ (void)setSyncHistoryToCloud:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&syncHistoryToCloudLock);
  id v5 = [a1 defaults];
  [v5 setBool:!v3 forKey:@"SuggestionsSuppressSyncHistoryToCloud"];

  syncHistoryToCloud = v3;

  pthread_mutex_unlock(&syncHistoryToCloudLock);
}

+ (BOOL)syncHistoryToCloud
{
  pthread_mutex_lock(&syncHistoryToCloudLock);
  int v3 = syncHistoryToCloud;
  if (syncHistoryToCloud == 255)
  {
    id v4 = [a1 defaults];
    syncHistoryToCloud = [v4 BOOLForKey:@"SuggestionsSuppressSyncHistoryToCloud"] ^ 1;

    int v3 = syncHistoryToCloud;
  }
  BOOL v5 = v3 != 0;
  pthread_mutex_unlock(&syncHistoryToCloudLock);
  return v5;
}

+ (void)setMessagesToProcessImmediately:(int64_t)a3
{
  BOOL v5 = [a1 defaults];
  [v5 setInteger:a3 forKey:@"SuggestionsMessagesToProcessImmediately"];

  double v6 = [a1 defaults];
  [v6 synchronize];

  id v7 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v7);
}

+ (int64_t)messagesToProcessImmediately
{
  if (messagesToProcessImmediatelyForTests)
  {
    id v2 = (void *)messagesToProcessImmediatelyForTests;
    return [v2 integerValue];
  }
  else
  {
    id v4 = [a1 defaults];
    int64_t v5 = [v4 integerForKey:@"SuggestionsMessagesToProcessImmediately"];

    return v5;
  }
}

+ (void)removeDeprecatedDefaults
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [&unk_1EF92F8D0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(&unk_1EF92F8D0);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = [a1 defaults];
        [v8 removeObjectForKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1EF92F8D0 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

+ (BOOL)showSuggestionsCalendar
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsShowSuggestionsCalendar"];

  return v3;
}

+ (void)setHashedSessionsLogging:(int)a3
{
}

+ (int64_t)hashedSessionsLogging
{
  id v2 = [a1 defaults];
  int64_t v3 = [v2 integerForKey:@"SuggestionsHashedSessionsLogging"];

  return v3;
}

+ (void)setOnlyShowSignificantNLEvents:(BOOL)a3
{
}

+ (BOOL)onlyShowSignificantNLEvents
{
  id v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"SuggestionsOnlyShowSignificantNLEvents"];

  return v3;
}

+ (void)setOnlyShowSignificantPseudoContactsForTests:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  uint64_t v4 = (void *)onlyShowSignificantPseudoContactsForTests;
  onlyShowSignificantPseudoContactsForTests = v3;

  _blockingNotifySettingsChanged();
}

+ (void)setOnlyShowSignificantPseudoContacts:(BOOL)a3
{
  BOOL v3 = a3;
  if (onlyShowSignificantPseudoContactsForTests)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"SGPreferenceStorage.m", 348, @"Invalid parameter not satisfying: %@", @"onlyShowSignificantPseudoContactsForTests == nil" object file lineNumber description];
  }

  [a1 updateBoolSettingKey:@"SuggestionsOnlyShowSignificantPseudoContacts" withValue:v3];
}

+ (BOOL)onlyShowSignificantPseudoContacts
{
  if (onlyShowSignificantPseudoContactsForTests)
  {
    id v2 = (void *)onlyShowSignificantPseudoContactsForTests;
    return [v2 BOOLValue];
  }
  else
  {
    uint64_t v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsOnlyShowSignificantPseudoContacts"];

    return v5;
  }
}

+ (void)updateIntSettingKey:(id)a3 withValue:(int)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 defaults];
  [v7 setInteger:a4 forKey:v6];

  id v8 = [a1 defaults];
  [v8 synchronize];

  long long v9 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v9);
}

+ (void)updateBoolSettingKey:(id)a3 withValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [a1 defaults];
  [v7 setBool:v4 forKey:v6];

  id v8 = [a1 defaults];
  [v8 synchronize];

  long long v9 = (const char *)[@"com.apple.suggestions.settingsChanged" UTF8String];

  notify_post(v9);
}

+ (void)setAlwaysShowCancelledEvents:(BOOL)a3
{
}

+ (BOOL)alwaysShowCancelledEvents
{
  if (showCancelledEventsForTests)
  {
    id v2 = (void *)showCancelledEventsForTests;
    return [v2 BOOLValue];
  }
  else
  {
    BOOL v4 = [a1 defaults];
    char v5 = [v4 BOOLForKey:@"SuggestionsAlwaysShowCancelledEvents"];

    return v5;
  }
}

+ (void)setShowPastEvents:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&shouldShowPastEventsLock);
  [a1 updateBoolSettingKey:@"SuggestionsShowPastEvents" withValue:v3];
  shouldShowPastEvents = v3;

  pthread_mutex_unlock(&shouldShowPastEventsLock);
}

+ (BOOL)showPastEvents
{
  if (hidePastEventsForTests)
  {
    if ([(id)hidePastEventsForTests BOOLValue]) {
      return 0;
    }
    if (![(id)hidePastEventsForTests BOOLValue]) {
      return 1;
    }
  }
  pthread_mutex_lock(&shouldShowPastEventsLock);
  int v4 = shouldShowPastEvents;
  if (shouldShowPastEvents == 255)
  {
    char v5 = [a1 defaults];
    shouldShowPastEvents = [v5 BOOLForKey:@"SuggestionsShowPastEvents"];

    int v4 = shouldShowPastEvents;
  }
  BOOL v3 = v4 != 0;
  pthread_mutex_unlock(&shouldShowPastEventsLock);
  return v3;
}

+ (int64_t)suggestionsLogLevel
{
  id v2 = [a1 defaults];
  int64_t v3 = [v2 integerForKey:@"SuggestionsLoggingLevel"];

  return v3;
}

+ (void)resetAllPreferences
{
  int64_t v3 = [a1 defaults];
  [v3 removeObjectForKey:@"SuggestionsAlwaysShowCancelledEvents"];

  int v4 = [a1 defaults];
  [v4 removeObjectForKey:@"SuggestionsLoggingLevel"];

  char v5 = [a1 defaults];
  [v5 removeObjectForKey:@"SuggestionsMessagesToProcessImmediately"];

  id v6 = [a1 defaults];
  [v6 removeObjectForKey:@"SuggestionsOnlyShowSignificantPseudoContacts"];

  uint64_t v7 = [a1 defaults];
  [v7 removeObjectForKey:@"SuggestionsOnlyShowSignificantNLEvents"];

  id v8 = [a1 defaults];
  [v8 removeObjectForKey:@"SuggestionsShowPastEvents"];

  long long v9 = [a1 defaults];
  [v9 removeObjectForKey:@"SuggestionsShowSuggestionsCalendar"];

  long long v10 = [a1 defaults];
  [v10 removeObjectForKey:@"SuggestionsSuppressSyncHistoryToCloud"];

  long long v11 = [a1 defaults];
  [v11 removeObjectForKey:@"SuggestionsAllowGeocode"];

  long long v12 = [a1 defaults];
  [v12 removeObjectForKey:@"SuggestionsAllowUnverifiedSourceForMarkup"];

  v13 = [a1 defaults];
  [v13 removeObjectForKey:@"SuggestionsAllowAnyDomainForMarkup"];

  uint64_t v14 = [a1 defaults];
  [v14 removeObjectForKey:@"SuggestionsUseMLModelForContacts"];

  int v15 = [a1 defaults];
  [v15 removeObjectForKey:@"SuggestionsUseMLModelForSelfId"];

  id v16 = [a1 defaults];
  [v16 removeObjectForKey:@"SuggestionsAllowAgeBasedPruning"];

  __int16 v17 = [a1 defaults];
  [v17 removeObjectForKey:@"SuggestionsDetectContacts"];

  id v18 = [a1 defaults];
  [v18 removeObjectForKey:@"SuggestionsShowNLEvents"];

  __int16 v19 = [a1 defaults];
  [v19 removeObjectForKey:@"SuggestionsShowMessageEventsML"];

  v20 = [a1 defaults];
  [v20 removeObjectForKey:@"SuggestionsDetectStructuredEvents"];

  uint64_t v21 = [a1 defaults];
  [v21 removeObjectForKey:@"SuggestionsDetectReminders"];

  v22 = [a1 defaults];
  [v22 removeObjectForKey:@"SuggestionsDetectStructuredsEventML"];

  v23 = [a1 defaults];
  [v23 removeObjectForKey:@"SuggestionsDetectRemindersInMail"];

  v24 = [a1 defaults];
  [v24 removeObjectForKey:@"SuggestionsDetectSalientMails"];

  v25 = [a1 defaults];
  [v25 removeObjectForKey:@"SuggestionsFollowUpTimeRangeForDebugging"];

  v26 = [a1 defaults];
  [v26 removeObjectForKey:@"SuggestionsFollowUpComputeCustomTimeRange"];

  v27 = [a1 defaults];
  [v27 removeObjectForKey:@"SuggestionsMailIntelligenceSPILogging"];

  v28 = [a1 defaults];
  [v28 removeObjectForKey:@"SuggestionsHashedSessionsLogging"];

  v29 = [a1 defaults];
  [v29 removeObjectForKey:@"CloudKitPersistedState"];

  v30 = [a1 defaults];
  [v30 removeObjectForKey:@"UserAccountsPersistedState"];

  v31 = [a1 defaults];
  [v31 removeObjectForKey:@"SuggestionsUseMLModelForContactSharing"];

  v32 = [a1 defaults];
  [v32 removeObjectForKey:@"SuggestionsContactSharingNegativeSamplingRate"];

  v33 = [a1 defaults];
  [v33 removeObjectForKey:@"SuggestionsHarvestBudgetNumberOfOperations"];

  v34 = [a1 defaults];
  [v34 removeObjectForKey:@"SuggestionsHarvestBudgetCPUTimeSeconds"];

  v35 = [a1 defaults];
  [v35 removeObjectForKey:@"DisableEventUpdateCategories"];

  id v36 = [a1 defaults];
  [v36 removeObjectForKey:@"SuggestionsEventsMLRegexEnsembleExtractionEnabled"];
}

+ (void)setShowEventsFoundInMail:(BOOL)a3
{
}

+ (BOOL)showEventsFoundInMail
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  char v3 = [v2 containsObject:@"com.apple.mobilecal"] ^ 1;

  return v3;
}

+ (void)setShowContactsFoundInMail:(BOOL)a3
{
}

+ (BOOL)showContactsFoundInMail
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  char v3 = [v2 containsObject:@"com.apple.MobileAddressBook"] ^ 1;

  return v3;
}

@end