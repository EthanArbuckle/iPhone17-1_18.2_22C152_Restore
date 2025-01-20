@interface BBServer
+ (id)_dataDirectoryPath;
+ (id)_persistentSettingsStore;
+ (id)savedChronologicalSectionOrder;
+ (id)savedSectionInfo;
+ (unint64_t)pairedDeviceCount;
+ (void)removeSavedChronologicalSectionInfo:(id)a3;
- (BBServer)initWithQueue:(id)a3;
- (BBServer)initWithQueue:(id)a3 dataProviderManager:(id)a4 syncService:(id)a5 dismissalSyncCache:(id)a6 observerListener:(id)a7 conduitListener:(id)a8 settingsListener:(id)a9;
- (BOOL)_deviceSupportsFavorites;
- (BOOL)_didNotificationCenterSettingsChangeWithSectionInfo:(id)a3 replacingSectionInfo:(id)a4;
- (BOOL)_hasPairedVehiclesForCarPlay;
- (BOOL)_isAnnounceSupportedForCarPlay;
- (BOOL)_isAnnounceSupportedForHeadphones;
- (BOOL)_shouldUseUNSSettings;
- (BOOL)_verifyBulletinRequest:(id)a3 forDataProvider:(id)a4;
- (BOOL)hasDestinationForRemoteNotifications;
- (BOOL)isGreyMatterEligble;
- (BOOL)isRunning;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_allBulletinsForSectionID:(id)a3;
- (id)_allSectionInfoIDs;
- (id)_appProtectionMonitor;
- (id)_applicableSectionInfosForBulletin:(id)a3 inSection:(id)a4;
- (id)_bulletinDefaultExpirationDateFromDate:(id)a3;
- (id)_bulletinIDsInSortedArray:(id)a3 withDateForKey:(id)a4 beforeCutoff:(id)a5;
- (id)_bulletinRequestsForIDs:(id)a3;
- (id)_bulletinsForIDs:(id)a3;
- (id)_bulletinsForSectionID:(id)a3 inFeeds:(unint64_t)a4;
- (id)_clearedInfoForSectionID:(id)a3;
- (id)_effectiveGlobalScheduledDeliveryTimes;
- (id)_enabledSectionIDsForDataProvider:(id)a3;
- (id)_encodedScheduledDeliveryTimesForDeliveryTimes:(id)a3;
- (id)_globalScheduledDeliveryTimes;
- (id)_mapForFeed:(unint64_t)a3;
- (id)_newDateCompontentsByInvertingInterestingPartsOfComponents:(id)a3;
- (id)_newValidatedDefaultExpirationComponentsFromComponents:(id)a3;
- (id)_nextExpireBulletinsDate;
- (id)_observerGatewaysForFeeds:(unint64_t)a3;
- (id)_observersForNoticesFeed;
- (id)_openApplicationOptionsForResponse:(id)a3;
- (id)_scheduledDeliveryTimesForEncodedDeliveryTimes:(id)a3;
- (id)_sectionIDsToMigrate;
- (id)_sectionInfoArray:(BOOL)a3;
- (id)_sectionInfoArrayForActiveSections:(BOOL)a3;
- (id)_sectionInfoArrayForSectionIDs:(id)a3 effective:(BOOL)a4;
- (id)_sectionInfoForSectionID:(id)a3;
- (id)_sectionInfoForSectionID:(id)a3 effective:(BOOL)a4;
- (id)_sectionInfoStore;
- (id)_sinceDate;
- (id)allBulletinIDsForSectionID:(id)a3;
- (id)bulletinIDsForSectionID:(id)a3 inFeed:(unint64_t)a4;
- (id)bulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4;
- (id)bulletinsRequestsForBulletinIDs:(id)a3;
- (id)carBulletinIDsForSectionID:(id)a3;
- (id)dataProviderForSectionID:(id)a3;
- (id)dpManager:(id)a3 sectionInfoForSectionID:(id)a4;
- (id)noticesBulletinIDsForSectionID:(id)a3;
- (id)savedClearedSections;
- (id)savedOrderDictionary;
- (id)savedSectionInfo;
- (id)sectionIDsForUniversalSectionID:(id)a3;
- (id)syncService:(id)a3 universalSectionIdentifierForSectionIdentifier:(id)a4;
- (id)universalSectionIDForSectionID:(id)a3;
- (int64_t)_defaultGlobalContentPreviewSetting;
- (int64_t)_defaultGlobalHighlightsSetting;
- (int64_t)_defaultGlobalSummarizationSetting;
- (int64_t)_effectiveGlobalAnnounceBuiltInSpeakerSetting;
- (int64_t)_effectiveGlobalAnnounceCarPlaySetting;
- (int64_t)_effectiveGlobalAnnounceHeadphonesSetting;
- (int64_t)_effectiveGlobalAnnounceHearingAidsSetting;
- (int64_t)_effectiveGlobalAnnounceSetting;
- (int64_t)_effectiveGlobalContentPreviewsSetting;
- (int64_t)_effectiveGlobalHighlightsSetting;
- (int64_t)_effectiveGlobalNotificationListDisplayStyleSetting;
- (int64_t)_effectiveGlobalScheduledDeliverySetting;
- (int64_t)_effectiveGlobalScheduledDeliveryShowNextSummarySetting;
- (int64_t)_effectiveGlobalSummarizationSetting;
- (int64_t)_globalAnnounceCarPlaySetting;
- (int64_t)_globalAnnounceHeadphonesSetting;
- (int64_t)_globalAnnounceSetting;
- (int64_t)_globalContentPreviewsSetting;
- (int64_t)_globalHighlightsSetting;
- (int64_t)_globalNotificationListDisplayStyleSetting;
- (int64_t)_globalScheduledDeliverySetting;
- (int64_t)_globalScheduledDeliveryShowNextSummarySetting;
- (int64_t)_globalSummarizationSetting;
- (unint64_t)_feedsForBulletin:(id)a3 destinations:(unint64_t)a4;
- (unint64_t)_filtersForSectionID:(id)a3;
- (unint64_t)_indexForNewDate:(id)a3 inBulletinIDArray:(id)a4 sortedAscendingByDateForKey:(id)a5;
- (unint64_t)_pairedDeviceCount;
- (unint64_t)effectivePushSettingsForSectionInfo:(id)a3;
- (void)_addActiveSectionID:(id)a3;
- (void)_addBulletin:(id)a3;
- (void)_addObserver:(id)a3;
- (void)_addSettingsGatewayConnection:(id)a3;
- (void)_addStateCaptureHandlers;
- (void)_addSuspendedConnection:(id)a3;
- (void)_assignIDToBulletinRequest:(id)a3;
- (void)_assignIDToBulletinRequest:(id)a3 checkAgainstBulletins:(id)a4;
- (void)_biometricResourceStateChanged;
- (void)_clearBulletinIDIfPossible:(id)a3 rescheduleExpirationTimer:(BOOL)a4;
- (void)_clearBulletinIDs:(id)a3 forSectionID:(id)a4 shouldSync:(BOOL)a5;
- (void)_clearBulletinsFromDate:(id)a3 toDate:(id)a4 forSection:(id)a5;
- (void)_clearExpirationTimer;
- (void)_clearSection:(id)a3;
- (void)_dataProviderDidClearInfo:(id)a3 forSection:(id)a4;
- (void)_didReceiveResponseForBulletin:(id)a3;
- (void)_enqueueBulletinUpdate:(id)a3;
- (void)_ensureDataDirectoryExists;
- (void)_expireBulletins;
- (void)_expireBulletinsAndRescheduleTimerIfNecessary;
- (void)_expireBulletinsDueToSystemEvent:(unint64_t)a3;
- (void)_fetchAllVehiclesForCarPlay;
- (void)_handleSignificantTimeChange;
- (void)_loadClearedSections;
- (void)_loadDataProvidersAndSettings;
- (void)_loadSavedSectionInfo;
- (void)_loadSystemCapabilities;
- (void)_logObserversBeforeAndAfterUpdateBlock:(id)a3;
- (void)_migrateGlobalAnnounceSettingIfNeeded;
- (void)_migrateLoadedData;
- (void)_modifyBulletin:(id)a3;
- (void)_observeManagedProfileChanges;
- (void)_pairedVehiclesForCarPlayDidChange:(id)a3;
- (void)_performPendingBulletinUpdatesForBulletinID:(id)a3;
- (void)_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:(int64_t)a3;
- (void)_publishBulletinRequest:(id)a3 forSectionID:(id)a4 forDestinations:(unint64_t)a5;
- (void)_publishBulletinsForAllDataProviders;
- (void)_queue_managedUserNotificationsSetttingsDidChange;
- (void)_reloadReloadSectionInfoForSectionID:(id)a3;
- (void)_reloadSectionParametersForSectionID:(id)a3;
- (void)_removeBulletin:(id)a3 rescheduleTimerIfAffected:(BOOL)a4 shouldSync:(BOOL)a5;
- (void)_removeBulletin:(id)a3 shouldSync:(BOOL)a4;
- (void)_removeBulletins:(id)a3 forSectionID:(id)a4 shouldSync:(BOOL)a5;
- (void)_removeObserver:(id)a3;
- (void)_removeSection:(id)a3;
- (void)_removeSettingsGatewayConnection:(id)a3;
- (void)_removeSuspendedConnection:(id)a3;
- (void)_resumeAllSuspendedConnectionsWithCompletionHandler:(id)a3;
- (void)_saveGlobalAnnounceSettingEnabledEvent;
- (void)_saveUpdatedSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)_scheduleExpirationForBulletin:(id)a3;
- (void)_scheduleTimerForDate:(id)a3;
- (void)_sendAddBulletin:(id)a3 toFeeds:(unint64_t)a4;
- (void)_sendBulletinUpdate:(id)a3;
- (void)_sendBulletinsLoadedForSectionID:(id)a3;
- (void)_sendModifyBulletin:(id)a3 toFeeds:(unint64_t)a4;
- (void)_sendObserver:(id)a3 noticesBulletinsForSectionID:(id)a4;
- (void)_sendRemoveBulletin:(id)a3 toFeeds:(unint64_t)a4 shouldSync:(BOOL)a5;
- (void)_sendRemoveBulletins:(id)a3 toFeeds:(unint64_t)a4 shouldSync:(BOOL)a5;
- (void)_sendRemoveSection:(id)a3;
- (void)_sendUpdateSectionInfo:(id)a3;
- (void)_setAnnounceSupportedForCarPlay:(BOOL)a3;
- (void)_setAnnounceSupportedForHeadphones:(BOOL)a3;
- (void)_setClearedInfo:(id)a3 forSectionID:(id)a4;
- (void)_setDefaultExpirationComponents:(id)a3;
- (void)_setGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)_setGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)_setGlobalAnnounceSetting:(int64_t)a3;
- (void)_setGlobalContentPreviewsSetting:(int64_t)a3;
- (void)_setGlobalHighlightsSetting:(int64_t)a3;
- (void)_setGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)_setGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)_setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)_setGlobalScheduledDeliveryTimes:(id)a3;
- (void)_setGlobalSummarizationSetting:(int64_t)a3;
- (void)_setPairedVehiclesForCarPlay:(BOOL)a3;
- (void)_setPrimitiveSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)_setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)_setSectionInfoNoteSettingsChanged:(id)a3 forSectionID:(id)a4;
- (void)_siriPreferencesDidChange:(id)a3;
- (void)_storeObserver:(id)a3 forFeed:(unint64_t)a4;
- (void)_unobserveManagedProfileChanges;
- (void)_updateAllBulletinsForDataProvider:(id)a3;
- (void)_updateAllBulletinsForDataProviderIfSectionIsEnabled:(id)a3;
- (void)_updateAllSectionInfos;
- (void)_updateAnnounceControlCenterModuleAvailability;
- (void)_updateAnnounceSettings;
- (void)_updateBulletinsInFeed:(unint64_t)a3 forDataProvider:(id)a4 enabledSectionIDs:(id)a5;
- (void)_updateBulletinsInFeed:(unint64_t)a3 forDataProviderIfSectionIsEnabled:(id)a4;
- (void)_updateBulletinsInFeed:(unint64_t)a3 ifSectionIsEnabled:(id)a4;
- (void)_updateClearedInfoForSectionID:(id)a3 handler:(id)a4;
- (void)_updateDataProviderForSectionInfo:(id)a3 sectionID:(id)a4;
- (void)_updateGlobalSettings;
- (void)_updateInterruptionLevelForBulletin:(id)a3;
- (void)_updateSectionInfoForSectionID:(id)a3 handler:(id)a4;
- (void)_updateSectionParametersForDataProvider:(id)a3;
- (void)_updateShowsMessagePreviewForBulletin:(id)a3;
- (void)_updateSiriPreferences;
- (void)_validateExpirationDateForBulletinRequest:(id)a3;
- (void)_writeClearedSections;
- (void)_writeSectionInfo;
- (void)clearBulletinIDIfPossible:(id)a3 rescheduleExpirationTimer:(BOOL)a4;
- (void)dealloc;
- (void)deliverResponse:(id)a3 withCompletion:(id)a4;
- (void)didChangeEffectiveAuthorizationStatusForSectionID:(id)a3;
- (void)didChangeMuteAssertionForSectionID:(id)a3;
- (void)dpManager:(id)a3 addDataProvider:(id)a4 withSectionInfo:(id)a5;
- (void)dpManager:(id)a3 addParentSectionFactory:(id)a4;
- (void)dpManager:(id)a3 removeDataProviderSectionID:(id)a4;
- (void)eligibleAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4;
- (void)getActiveSectionIDsWithHandler:(id)a3;
- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5;
- (void)getBulletinsWithHandler:(id)a3;
- (void)getEffectiveGlobalAnnounceCarPlaySettingWithHandler:(id)a3;
- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalAnnounceSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalContentPreviewsSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalHighlightsSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:(id)a3;
- (void)getEffectiveGlobalScheduledDeliverySettingWithHandler:(id)a3;
- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:(id)a3;
- (void)getEffectiveGlobalScheduledDeliveryTimesWithHandler:(id)a3;
- (void)getEffectiveGlobalSummarizationSettingWithHandler:(id)a3;
- (void)getEffectiveSectionInfoForSectionID:(id)a3 withHandler:(id)a4;
- (void)getEffectiveSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4;
- (void)getEffectiveSectionInfoWithHandler:(id)a3;
- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4;
- (void)getSectionIDsWithHandler:(id)a3;
- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3;
- (void)getSectionInfoForSectionID:(id)a3 withHandler:(id)a4;
- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4;
- (void)getSectionInfoWithHandler:(id)a3;
- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4;
- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4;
- (void)handleDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 inSection:(id)a5 forFeeds:(unint64_t)a6;
- (void)isGreyMatterEligble;
- (void)loadDataProvidersAndSettings;
- (void)noteChangeOfState:(unint64_t)a3 newValue:(BOOL)a4;
- (void)noteFinishedWithBulletinID:(id)a3;
- (void)noteOccurrenceOfEvent:(unint64_t)a3;
- (void)observer:(id)a3 clearBulletinIDs:(id)a4 inSection:(id)a5;
- (void)observer:(id)a3 clearBulletinsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6;
- (void)observer:(id)a3 clearSection:(id)a4;
- (void)observer:(id)a3 finishedWithBulletinID:(id)a4 transactionID:(unint64_t)a5;
- (void)observer:(id)a3 getSectionInfoForActiveSectionsWithHandler:(id)a4;
- (void)observer:(id)a3 getSectionInfoForSectionIDs:(id)a4 withHandler:(id)a5;
- (void)observer:(id)a3 getSectionInfoWithHandler:(id)a4;
- (void)observer:(id)a3 handleResponse:(id)a4 withCompletion:(id)a5;
- (void)observer:(id)a3 removeBulletins:(id)a4 inSection:(id)a5 fromFeeds:(unint64_t)a6;
- (void)observer:(id)a3 requestNoticesBulletinsForSectionID:(id)a4;
- (void)observer:(id)a3 setObserverFeed:(unint64_t)a4 asLightsAndSirensGateway:(id)a5 priority:(unint64_t)a6;
- (void)observer:(id)a3 setObserverFeed:(unint64_t)a4 attachToLightsAndSirensGateway:(id)a5;
- (void)ping:(id)a3;
- (void)protectionStateChangedForBundleIdentifiers:(id)a3;
- (void)publishBulletin:(id)a3 destinations:(unint64_t)a4;
- (void)publishBulletinRequest:(id)a3 destinations:(unint64_t)a4;
- (void)refreshAnnounceSettings;
- (void)refreshGlobalSettings;
- (void)refreshSectionInfo;
- (void)refreshSectionInfoForID:(id)a3;
- (void)removeBulletinID:(id)a3 fromNoticesSection:(id)a4;
- (void)removeBulletinID:(id)a3 fromSection:(id)a4 inFeed:(unint64_t)a5;
- (void)requestNoticesBulletinsForAllSections:(id)a3;
- (void)sendMessageToDataProviderSectionID:(id)a3 name:(id)a4 userInfo:(id)a5;
- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3 withHandler:(id)a4;
- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3 withHandler:(id)a4;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5;
- (void)syncService:(id)a3 receivedDismissalDictionaries:(id)a4 dismissalIDs:(id)a5 inSection:(id)a6 universalSectionID:(id)a7 forFeeds:(unint64_t)a8;
- (void)updateSection:(id)a3 inFeed:(unint64_t)a4 withBulletinRequests:(id)a5;
- (void)weeAppWithBundleID:(id)a3 getHiddenFromUser:(id)a4;
- (void)weeAppWithBundleID:(id)a3 setHiddenFromUser:(BOOL)a4;
- (void)withdrawBulletinID:(id)a3 shouldSync:(BOOL)a4;
- (void)withdrawBulletinRequestsWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4 forSectionID:(id)a5;
- (void)withdrawBulletinRequestsWithRecordID:(id)a3 forSectionID:(id)a4;
- (void)writeClearedSections:(id)a3;
- (void)writeOrderDictionary:(id)a3;
- (void)writeSectionInfo:(id)a3;
- (void)writeSectionInfo:(id)a3 withVersionNumber:(unint64_t)a4;
@end

@implementation BBServer

uint64_t __51__BBServer_getSectionInfoForSectionID_withHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _sectionInfoForSectionID:*(void *)(a1 + 40) effective:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __60__BBServer_getEffectiveSectionInfoForSectionID_withHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _sectionInfoForSectionID:*(void *)(a1 + 40) effective:1];
  return MEMORY[0x270F9A758]();
}

- (id)_sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  v8 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore sectionInfoForSectionID:v7 effective:v4];

  return v8;
}

- (int64_t)_effectiveGlobalSummarizationSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings]
    || !BBAreGenerativeSummarizationModelsAvailable())
  {
    return -1;
  }
  if ([(BBServer *)self _globalSummarizationSetting])
  {
    return [(BBServer *)self _globalSummarizationSetting];
  }
  else
  {
    return [(BBServer *)self _defaultGlobalSummarizationSetting];
  }
}

- (int64_t)_effectiveGlobalScheduledDeliverySetting
{
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    return [(BBPersistentStoreInterface *)persistentStore effectiveGlobalScheduledDeliverySetting];
  }
  else if ([(BBServer *)self _globalScheduledDeliverySetting])
  {
    return [(BBServer *)self _globalScheduledDeliverySetting];
  }
  else
  {
    return -1;
  }
}

- (BOOL)_shouldUseUNSSettings
{
  return _os_feature_enabled_impl();
}

- (int64_t)_globalScheduledDeliverySetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v3 = [v2 globalScheduledDeliverySetting];

  return v3;
}

- (int64_t)_effectiveGlobalContentPreviewsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    return [(BBPersistentStoreInterface *)persistentStore effectiveGlobalContentPreviewsSetting];
  }
  else if ([(BBServer *)self _globalContentPreviewsSetting])
  {
    return [(BBServer *)self _globalContentPreviewsSetting];
  }
  else
  {
    return [(BBServer *)self _defaultGlobalContentPreviewSetting];
  }
}

- (int64_t)_effectiveGlobalAnnounceSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    return [(BBPersistentStoreInterface *)persistentStore effectiveGlobalAnnounceSetting];
  }
  else if ([(BBServer *)self _isAnnounceSupportedForHeadphones] {
         || [(BBServer *)self _isAnnounceSupportedForCarPlay]
  }
         && [(BBServer *)self _hasPairedVehiclesForCarPlay]
         || self->_announceOnHearingAidsSupported
         || self->_announceOnBuiltInSpeakerEnabled)
  {
    if (self->_siriEnabled && self->_siriAllowedWhenLocked)
    {
      int64_t result = [(BBServer *)self _globalAnnounceSetting];
      if ((unint64_t)result <= 1) {
        return 1;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return -1;
  }
  return result;
}

- (BOOL)_isAnnounceSupportedForHeadphones
{
  v2 = +[BBBulletinBoardDefaults standardDefaults];
  char v3 = [v2 isAnnounceSupportedForHeadphones];

  return v3;
}

- (BOOL)_isAnnounceSupportedForCarPlay
{
  v2 = +[BBBulletinBoardDefaults standardDefaults];
  char v3 = [v2 isAnnounceSupportedForCarPlay];

  return v3;
}

- (int64_t)_globalContentPreviewsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v3 = [v2 globalContentPreviewSetting];

  return v3;
}

- (BOOL)_hasPairedVehiclesForCarPlay
{
  v2 = +[BBBulletinBoardDefaults standardDefaults];
  char v3 = [v2 hasPairedVehiclesForCarPlay];

  return v3;
}

- (int64_t)_defaultGlobalContentPreviewSetting
{
  if ([(BBBiometricResource *)self->_biometricResource hasPearlCapability]
    && [(BBBiometricResource *)self->_biometricResource isPearlEnabledAndEnrolled])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)hasDestinationForRemoteNotifications
{
  return 1;
}

- (void)getEffectiveSectionInfoForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BBServer_getEffectiveSectionInfoForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296198;
  v12 = &v13;
  block[4] = self;
  id v9 = v6;
  id v11 = v9;
  dispatch_sync(queue, block);
  if (v7) {
    v7[2](v7, v14[5]);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)getSectionInfoForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BBServer_getSectionInfoForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296198;
  v12 = &v13;
  block[4] = self;
  id v9 = v6;
  id v11 = v9;
  dispatch_sync(queue, block);
  if (v7) {
    v7[2](v7, v14[5]);
  }

  _Block_object_dispose(&v13, 8);
}

- (BBServer)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = [[BBDataProviderManager alloc] initWithDelegate:self queue:v4];
  int v6 = _os_feature_enabled_impl();
  id v7 = &off_264295908;
  if (!v6) {
    id v7 = off_2642958D8;
  }
  v8 = (void *)[objc_alloc(*v7) initWithDelegate:self queue:v4];
  id v9 = objc_alloc_init(BBDismissalSyncCache);
  v10 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.bulletinboard.observerconnection"];
  id v11 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.bulletinboard.serverconduitconnection"];
  v12 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.bulletinboard.settingsconnection"];
  uint64_t v13 = [(BBServer *)self initWithQueue:v4 dataProviderManager:v5 syncService:v8 dismissalSyncCache:v9 observerListener:v10 conduitListener:v11 settingsListener:v12];

  return v13;
}

- (BBServer)initWithQueue:(id)a3 dataProviderManager:(id)a4 syncService:(id)a5 dismissalSyncCache:(id)a6 observerListener:(id)a7 conduitListener:(id)a8 settingsListener:(id)a9
{
  id v16 = a3;
  id v74 = a4;
  id v73 = a5;
  id v72 = a6;
  id v71 = a7;
  id v70 = a8;
  id v17 = a9;
  v75.receiver = self;
  v75.super_class = (Class)BBServer;
  id v18 = [(BBServer *)&v75 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_dataProviderManager, a4);
    objc_storeStrong((id *)&v19->_syncService, a5);
    [(BBSyncServiceInterface *)v19->_syncService setDelegate:v19];
    objc_storeStrong((id *)&v19->_dismissalSyncCache, a6);
    objc_storeStrong((id *)&v19->_observerListener, a7);
    [(NSXPCListener *)v19->_observerListener setDelegate:v19];
    objc_storeStrong((id *)&v19->_conduitListener, a8);
    [(NSXPCListener *)v19->_conduitListener setDelegate:v19];
    objc_storeStrong((id *)&v19->_settingsListener, a9);
    [(NSXPCListener *)v19->_settingsListener setDelegate:v19];
    v20 = [[BBAppProtectionMonitor alloc] initWithDelegate:v19];
    appProtectionMonitor = v19->_appProtectionMonitor;
    v19->_appProtectionMonitor = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    observers = v19->_observers;
    v19->_observers = v22;

    v24 = [[BBMaskedSet alloc] initWithMaskBits:16];
    observerFeedSet = v19->_observerFeedSet;
    v19->_observerFeedSet = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observerGateways = v19->_observerGateways;
    v19->_observerGateways = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observerGatewaysByName = v19->_observerGatewaysByName;
    v19->_observerGatewaysByName = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observerGatewayEnumerators = v19->_observerGatewayEnumerators;
    v19->_observerGatewayEnumerators = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingUpdatesByBulletinID = v19->_pendingUpdatesByBulletinID;
    v19->_pendingUpdatesByBulletinID = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    settingsGatewayConnections = v19->_settingsGatewayConnections;
    v19->_settingsGatewayConnections = v34;

    uint64_t v36 = [(id)objc_opt_class() _persistentSettingsStore];
    persistentStore = v19->_persistentStore;
    v19->_persistentStore = (BBPersistentStoreInterface *)v36;

    uint64_t v38 = [(BBServer *)v19 _sectionInfoStore];
    sectionInfoStore = v19->_sectionInfoStore;
    v19->_sectionInfoStore = (BBSectionInfoStoreInterface *)v38;

    uint64_t v40 = [MEMORY[0x263EFF9C0] set];
    activeSectionIDs = v19->_activeSectionIDs;
    v19->_activeSectionIDs = (NSMutableSet *)v40;

    v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    expiringBulletinIDs = v19->_expiringBulletinIDs;
    v19->_expiringBulletinIDs = v42;

    v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eventBasedExpiringBulletinIDs = v19->_eventBasedExpiringBulletinIDs;
    v19->_eventBasedExpiringBulletinIDs = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bulletinsByID = v19->_bulletinsByID;
    v19->_bulletinsByID = v46;

    v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bulletinIDsBySectionID = v19->_bulletinIDsBySectionID;
    v19->_bulletinIDsBySectionID = v48;

    v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    noticeBulletinIDsBySectionID = v19->_noticeBulletinIDsBySectionID;
    v19->_noticeBulletinIDsBySectionID = v50;

    v52 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bulletinRequestsByID = v19->_bulletinRequestsByID;
    v19->_bulletinRequestsByID = v52;

    v19->_globalCounter = 0;
    v54 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    suspendedConnections = v19->_suspendedConnections;
    v19->_suspendedConnections = v54;

    v56 = objc_alloc_init(BBDismissalSyncCache);
    dismissalSyncCache = v19->_dismissalSyncCache;
    v19->_dismissalSyncCache = v56;

    io_object_t notifier = 0;
    IONotificationPortRef thePortRef = 0;
    __BBRootDomainConnect = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)_BBPowerChanged, &notifier);
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(thePortRef);
    if (RunLoopSource)
    {
      v59 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v59, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
    else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      -[BBServer initWithQueue:dataProviderManager:syncService:dismissalSyncCache:observerListener:conduitListener:settingsListener:]();
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)__server, (CFNotificationCallback)_BBHandleSignificantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(NSXPCListener *)v19->_observerListener resume];
    [(NSXPCListener *)v19->_conduitListener resume];
    [(NSXPCListener *)v19->_settingsListener resume];
    v62 = [[BBSectionAuthorizationManager alloc] initWithQueue:v16];
    sectionAuthorizationManager = v19->_sectionAuthorizationManager;
    v19->_sectionAuthorizationManager = v62;

    [(BBSectionAuthorizationManager *)v19->_sectionAuthorizationManager setDelegate:v19];
    v64 = [[BBMuteExpirationManager alloc] initWithQueue:v16];
    muteManager = v19->_muteManager;
    v19->_muteManager = v64;

    [(BBMuteExpirationManager *)v19->_muteManager setDelegate:v19];
    v66 = [[BBBiometricResource alloc] initWithQueue:v16];
    biometricResource = v19->_biometricResource;
    v19->_biometricResource = v66;

    if ([(BBBiometricResource *)v19->_biometricResource hasPearlCapability])
    {
      v68 = [MEMORY[0x263F08A00] defaultCenter];
      [v68 addObserver:v19 selector:sel__biometricResourceStateChanged name:@"BBBiometricResourceStateChanged" object:v19->_biometricResource];
    }
    [(BBServer *)v19 _addStateCaptureHandlers];
  }

  return v19;
}

- (void)dealloc
{
  [(BBServer *)self _clearExpirationTimer];
  [(NSXPCListener *)self->_observerListener invalidate];
  [(NSXPCListener *)self->_conduitListener invalidate];
  [(NSXPCListener *)self->_settingsListener invalidate];
  notify_cancel(self->_serverIsRunningToken);
  [(BBServer *)self _unobserveManagedProfileChanges];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)__server, @"SignificantTimeChangeNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)BBServer;
  [(BBServer *)&v4 dealloc];
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  int v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = v7;
  if (self->_observerListener == v6)
  {
    uint64_t v15 = [v7 valueForEntitlement:@"com.apple.bulletinboard.observer"];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      id v17 = +[BBObserverServerProxy xpcInterface];
      [v8 setExportedInterface:v17];

      id v18 = +[BBObserverClientProxy xpcInterface];
      [v8 setRemoteObjectInterface:v18];

      v19 = [[BBObserverClientProxy alloc] initWithServer:self connection:v8 calloutQueue:self->_queue];
      [v8 setExportedObject:v19];
      v20 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v57 = self;
        _os_log_impl(&dword_217675000, v20, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBObserver client established", buf, 0xCu);
      }
      [(BBServer *)self _addObserver:v19];
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v8);
      objc_initWeak(&from, v19);
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke;
      v50[3] = &unk_2642964D0;
      objc_copyWeak(&v51, &location);
      objc_copyWeak(&v52, (id *)buf);
      objc_copyWeak(&v53, &from);
      [v8 setInterruptionHandler:v50];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_2;
      v46[3] = &unk_2642964D0;
      objc_copyWeak(&v47, &location);
      objc_copyWeak(&v48, (id *)buf);
      objc_copyWeak(&v49, &from);
      [v8 setInvalidationHandler:v46];
      if ([(BBServer *)self isRunning]) {
        [v8 resume];
      }
      else {
        [(BBServer *)self _addSuspendedConnection:v8];
      }
      objc_destroyWeak(&v49);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&v53);
      objc_destroyWeak(&v52);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      goto LABEL_33;
    }
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
      -[BBServer listener:shouldAcceptNewConnection:]();
    }
  }
  else if (self->_conduitListener == v6)
  {
    v21 = [v7 valueForEntitlement:@"com.apple.bulletinboard.serverconduit"];
    int v22 = [v21 BOOLValue];

    if (v22)
    {
      v23 = +[BBServerConduit serverInterface];
      [v8 setExportedInterface:v23];

      [v8 setExportedObject:self];
      v24 = +[BBServerConduit clientInterface];
      [v8 setRemoteObjectInterface:v24];

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v8);
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_69;
      v43[3] = &unk_2642964A8;
      objc_copyWeak(&v44, &location);
      objc_copyWeak(&v45, (id *)buf);
      [v8 setInterruptionHandler:v43];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_70;
      v40[3] = &unk_2642964A8;
      objc_copyWeak(&v41, &location);
      objc_copyWeak(&v42, (id *)buf);
      [v8 setInvalidationHandler:v40];
      if ([(BBServer *)self isRunning]) {
        [v8 resume];
      }
      else {
        [(BBServer *)self _addSuspendedConnection:v8];
      }
      objc_destroyWeak(&v42);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&v45);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
LABEL_33:
      BOOL v25 = 1;
      goto LABEL_34;
    }
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
      -[BBServer listener:shouldAcceptNewConnection:]();
    }
  }
  else if (self->_settingsListener == v6)
  {
    id v9 = [v7 valueForEntitlement:@"com.apple.bulletinboard.settings"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      id v11 = [MEMORY[0x263F29BE0] tokenFromNSXPCConnection:v8];
      v12 = [v11 bundleID];
      uint64_t v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "pid"));
        v14 = [v26 stringValue];
      }
      v27 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v14;
        _os_log_impl(&dword_217675000, v27, OS_LOG_TYPE_DEFAULT, "BBServer: Incoming connection for settingsListener from %@", buf, 0xCu);
      }
      v28 = +[BBSettingsGateway serverInterface];
      [v8 setExportedInterface:v28];

      [v8 setExportedObject:self];
      v29 = +[BBSettingsGateway clientInterface];
      [v8 setRemoteObjectInterface:v29];

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v8);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_74;
      v37[3] = &unk_2642964A8;
      objc_copyWeak(&v38, &location);
      objc_copyWeak(&v39, (id *)buf);
      [v8 setInterruptionHandler:v37];
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      v33 = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_75;
      v34 = &unk_2642964A8;
      objc_copyWeak(&v35, &location);
      objc_copyWeak(&v36, (id *)buf);
      [v8 setInvalidationHandler:&v31];
      -[BBServer _addSettingsGatewayConnection:](self, "_addSettingsGatewayConnection:", v8, v31, v32, v33, v34);
      if ([(BBServer *)self isRunning]) {
        [v8 resume];
      }
      else {
        [(BBServer *)self _addSuspendedConnection:v8];
      }
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      goto LABEL_33;
    }
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
      -[BBServer listener:shouldAcceptNewConnection:]();
    }
  }
  BOOL v25 = 0;
LABEL_34:

  return v25;
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = v2;
    id WeakRetained = objc_loadWeakRetained(a1 + 4);
    *(_DWORD *)buf = 138412290;
    id v12 = WeakRetained;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%@) to BBObserver client interrupted", buf, 0xCu);
  }
  v5 = (NSObject **)objc_loadWeakRetained(a1 + 5);
  int v6 = v5;
  if (v5)
  {
    id v7 = v5[5];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_65;
    v8[3] = &unk_2642964A8;
    objc_copyWeak(&v9, a1 + 5);
    objc_copyWeak(&v10, a1 + 6);
    dispatch_async(v7, v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
  }
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_65(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeObserver:v2];
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_2(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = v2;
    id WeakRetained = objc_loadWeakRetained(a1 + 4);
    *(_DWORD *)buf = 138412290;
    id v12 = WeakRetained;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%@) to BBObserver client invalidated", buf, 0xCu);
  }
  v5 = (NSObject **)objc_loadWeakRetained(a1 + 5);
  int v6 = v5;
  if (v5)
  {
    id v7 = v5[5];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_67;
    v8[3] = &unk_2642964A8;
    objc_copyWeak(&v9, a1 + 5);
    objc_copyWeak(&v10, a1 + 6);
    dispatch_async(v7, v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
  }
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeObserver:v2];
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_69(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = WeakRetained;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBServerConduit client interrupted", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 _removeSuspendedConnection:WeakRetained];
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_70(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = WeakRetained;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBServerConduit client invalidated", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 _removeSuspendedConnection:WeakRetained];
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_74(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBSettingsGateway client interrupted", (uint8_t *)&v7, 0xCu);
  }
  id v4 = (id *)(a1 + 40);
  id v5 = objc_loadWeakRetained(v4);
  [v5 _removeSettingsGatewayConnection:WeakRetained];

  id v6 = objc_loadWeakRetained(v4);
  [v6 _removeSuspendedConnection:WeakRetained];
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_75(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBSettingsGateway client invalidated", (uint8_t *)&v7, 0xCu);
  }
  id v4 = (id *)(a1 + 40);
  id v5 = objc_loadWeakRetained(v4);
  [v5 _removeSettingsGatewayConnection:WeakRetained];

  id v6 = objc_loadWeakRetained(v4);
  [v6 _removeSuspendedConnection:WeakRetained];
}

- (void)_addSettingsGatewayConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__BBServer__addSettingsGatewayConnection___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __42__BBServer__addSettingsGatewayConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) addObject:*(void *)(a1 + 40)];
}

- (void)_removeSettingsGatewayConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__BBServer__removeSettingsGatewayConnection___block_invoke;
  v7[3] = &unk_264295E50;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __45__BBServer__removeSettingsGatewayConnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(*(void *)(a1 + 40) + 112);
  return [v3 removeObject:v2];
}

+ (id)_persistentSettingsStore
{
  if (_persistentSettingsStore_onceToken != -1) {
    dispatch_once(&_persistentSettingsStore_onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)_persistentSettingsStore___persistentSettingsStore;
  return v2;
}

void __36__BBServer__persistentSettingsStore__block_invoke()
{
  int v0 = _os_feature_enabled_impl();
  v1 = BBLogPersistence;
  BOOL v2 = os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217675000, v1, OS_LOG_TYPE_DEFAULT, "Using BBXPCPersistentStore", buf, 2u);
    }
    char v3 = off_2642958F8;
  }
  else
  {
    if (v2)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_217675000, v1, OS_LOG_TYPE_DEFAULT, "Using BBPersistentStore", v6, 2u);
    }
    char v3 = off_264295840;
  }
  id v4 = objc_alloc_init(*v3);
  id v5 = (void *)_persistentSettingsStore___persistentSettingsStore;
  _persistentSettingsStore___persistentSettingsStore = (uint64_t)v4;
}

- (id)_sectionInfoStore
{
  sectionInfoStore = self->_sectionInfoStore;
  if (!sectionInfoStore)
  {
    int v4 = _os_feature_enabled_impl();
    id v5 = BBLogPersistence;
    BOOL v6 = os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Using BBXPCSectionInfoStore", buf, 2u);
      }
      int v7 = objc_alloc_init(BBXPCSectionInfoStore);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Using BBSectionInfoStore", v10, 2u);
      }
      int v7 = [[BBSectionInfoStore alloc] initWithEffectiveSettingsProvider:self persistence:self->_persistentStore];
    }
    id v8 = self->_sectionInfoStore;
    self->_sectionInfoStore = (BBSectionInfoStoreInterface *)v7;

    sectionInfoStore = self->_sectionInfoStore;
  }
  return sectionInfoStore;
}

- (void)publishBulletin:(id)a3 destinations:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v7 = [v6 sectionID];
  id v8 = [v6 bulletinID];
  unint64_t v9 = [(BBServer *)self _feedsForBulletin:v6 destinations:a4];
  BBPowerLogBulletinBoardPublishEvent(v7, v9);
  id v10 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [v6 bulletinID];
    uint64_t v13 = BBObserverFeedStrings(v9);
    int v22 = 138543874;
    v23 = v12;
    __int16 v24 = 2048;
    unint64_t v25 = v9;
    __int16 v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "BBServer: Publish bulletin %{public}@ to feeds %ld: %{public}@", (uint8_t *)&v22, 0x20u);
  }
  v14 = [(BBDismissalSyncCache *)self->_dismissalSyncCache findBulletinMatch:v6];
  uint64_t v15 = v14;
  if (v14)
  {
    v9 &= ~[v14 feeds];
    [(BBDismissalSyncCache *)self->_dismissalSyncCache removeBulletinMatch:v15];
    ADClientAddValueForScalarKey();
  }
  int v16 = [(NSMutableDictionary *)self->_bulletinsByID objectForKey:v8];
  if (v16)
  {
    [(BBServer *)self _modifyBulletin:v6];
    [(BBServer *)self _sendAddBulletin:v6 toFeeds:v9];
    [(BBServer *)self _sendModifyBulletin:v6 toFeeds:~v9];
    if ((v9 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_10:
    id v17 = [(NSMutableDictionary *)self->_noticeBulletinIDsBySectionID objectForKey:v7];

    if (!v17)
    {
      noticeBulletinIDsBySectionID = self->_noticeBulletinIDsBySectionID;
      v19 = [MEMORY[0x263EFF9C0] set];
      [(NSMutableDictionary *)noticeBulletinIDsBySectionID setObject:v19 forKey:v7];
    }
    v20 = [(NSMutableDictionary *)self->_noticeBulletinIDsBySectionID objectForKey:v7];
    [v20 addObject:v8];

    v21 = BBLogSectionUpdates;
    if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_217675000, v21, OS_LOG_TYPE_DEFAULT, "Sent bulletin to 'notices' feed: %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    [(BBServer *)self noteFinishedWithBulletinID:v8];
    goto LABEL_15;
  }
  [(BBServer *)self _addBulletin:v6];
  [(BBServer *)self _sendAddBulletin:v6 toFeeds:v9];
  if (v9) {
    goto LABEL_10;
  }
LABEL_14:
  [(BBServer *)self _scheduleExpirationForBulletin:v6];
LABEL_15:
}

- (void)withdrawBulletinID:(id)a3 shouldSync:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  id v8 = [(NSMutableDictionary *)self->_bulletinsByID objectForKey:v7];

  if (v8)
  {
    unint64_t v9 = (void *)BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [v8 bulletinID];
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_217675000, v10, OS_LOG_TYPE_DEFAULT, "BBServer: Withdraw bulletin: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    if (v4) {
      uint64_t v12 = [v8 usesExternalSync] ^ 1;
    }
    else {
      uint64_t v12 = 0;
    }
    [(BBServer *)self _removeBulletin:v8 shouldSync:v12];
  }
}

- (id)_mapForFeed:(unint64_t)a3
{
  char v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3) {
    id v5 = self->_noticeBulletinIDsBySectionID;
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (void)removeBulletinID:(id)a3 fromSection:(id)a4 inFeed:(unint64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v9 = [(BBServer *)self _mapForFeed:a5];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 objectForKey:v8];
    [v11 removeObject:v13];
  }
  uint64_t v12 = [(NSMutableDictionary *)self->_bulletinsByID objectForKey:v13];
  [(BBServer *)self _sendRemoveBulletin:v12 toFeeds:a5 shouldSync:0];
}

- (void)removeBulletinID:(id)a3 fromNoticesSection:(id)a4
{
}

- (id)bulletinIDsForSectionID:(id)a3 inFeed:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(BBServer *)self _mapForFeed:a4];
  id v8 = v7;
  if (!v7
    || (unint64_t v9 = (void *)MEMORY[0x263EFFA08],
        [v7 objectForKey:v6],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v9 setWithSet:v10],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    id v11 = [MEMORY[0x263EFFA08] set];
  }

  return v11;
}

- (id)noticesBulletinIDsForSectionID:(id)a3
{
  return [(BBServer *)self bulletinIDsForSectionID:a3 inFeed:1];
}

- (id)carBulletinIDsForSectionID:(id)a3
{
  return [(BBServer *)self bulletinIDsForSectionID:a3 inFeed:128];
}

- (id)allBulletinIDsForSectionID:(id)a3
{
  char v3 = (void *)MEMORY[0x263EFFA08];
  BOOL v4 = [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:a3];
  id v5 = [v3 setWithSet:v4];

  return v5;
}

- (void)_addSuspendedConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__BBServer__addSuspendedConnection___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __36__BBServer__addSuspendedConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) addObject:*(void *)(a1 + 40)];
}

- (void)_removeSuspendedConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__BBServer__removeSuspendedConnection___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __39__BBServer__removeSuspendedConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) removeObject:*(void *)(a1 + 40)];
}

- (void)_resumeAllSuspendedConnectionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer__resumeAllSuspendedConnectionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_2642964F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__BBServer__resumeAllSuspendedConnectionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 256);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "resume", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 256) removeAllObjects];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__BBServer__addObserver___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __25__BBServer__addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__BBServer__removeObserver___block_invoke;
    v7[3] = &unk_264295E50;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __28__BBServer__removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 256);
  uint64_t v3 = [*(id *)(a1 + 40) connection];
  [v2 removeObject:v3];

  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "observerFeedSet", (void)v16);
        [v9 removeObject:*(void *)(a1 + 40)];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 80) count] - 1;
    do
    {
      long long v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectAtIndex:", v10, (void)v16);
      uint64_t v12 = [v11 gateway];
      uint64_t v13 = *(void **)(a1 + 40);

      if (v12 == v13)
      {
        v14 = *(void **)(*(void *)(a1 + 32) + 88);
        uint64_t v15 = [v11 name];
        [v14 removeObjectForKey:v15];

        [*(id *)(*(void *)(a1 + 32) + 80) removeObjectAtIndex:v10];
      }

      --v10;
    }
    while (v10 != -1);
  }
}

- (void)_sendUpdateSectionInfo:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(BBMaskedSet *)self->_observerFeedSet objectAtIndex:9];
  uint64_t v6 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore effectiveSectionInfoForSectionInfo:v4];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v11++) updateSectionInfo:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v9);
  }
  int v22 = v7;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v23 = v4;
  id obj = [v4 dataProviderIDs];
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = [(BBServer *)self _sectionInfoForSectionID:*(void *)(*((void *)&v29 + 1) + 8 * v15) effective:1];
        if (v16)
        {
          long long v17 = [(BBMaskedSet *)self->_observerFeedSet objectAtIndex:9];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v26;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v17);
                }
                [*(id *)(*((void *)&v25 + 1) + 8 * v21++) updateSectionInfo:v16];
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
            }
            while (v19);
          }
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v13);
  }
}

- (id)_observersForNoticesFeed
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  observerFeedSet = self->_observerFeedSet;
  return [(BBMaskedSet *)observerFeedSet objectAtIndex:0];
}

- (void)_sendRemoveSection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BBMaskedSet *)self->_observerFeedSet objectAtIndex:9];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeSection:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_observerGatewaysForFeeds:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_observerGateways;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "feed", (void)v13) & a3) != 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_sendAddBulletin:(id)a3 toFeeds:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = (os_log_t *)&BBLogGateway;
  uint64_t v8 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    observerGatewaysByName = self->_observerGatewaysByName;
    long long v10 = v8;
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = [(NSMutableDictionary *)observerGatewaysByName count];
    _os_log_impl(&dword_217675000, v10, OS_LOG_TYPE_DEFAULT, "%lu gateways found.", buf, 0xCu);
  }
  long long v11 = [(BBServer *)self _observerGatewaysForFeeds:a4];
  if ((unint64_t)[v11 count] > 1)
  {
    if (a4 == 1)
    {
      long long v17 = BBLogGateway;
      if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "Sending to all gateways without delay", buf, 2u);
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v12 = v11;
      uint64_t v18 = [(BBObserverGatewayEnumerator *)v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        long long v35 = v11;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(v12);
            }
            int v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            os_log_t v23 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v24 = v23;
              [v22 name];
              id v25 = v6;
              long long v26 = v12;
              long long v28 = v27 = v7;
              *(_DWORD *)buf = 138412290;
              uint64_t v44 = (uint64_t)v28;
              _os_log_impl(&dword_217675000, v24, OS_LOG_TYPE_DEFAULT, "Sending to observers of gateway: %@", buf, 0xCu);

              uint64_t v7 = v27;
              long long v12 = v26;
              id v6 = v25;
            }
            [v22 sendObserversAddBulletin:v6 playLightsAndSirens:1 forFeeds:1];
          }
          uint64_t v19 = [(BBObserverGatewayEnumerator *)v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v19);
        long long v11 = v35;
      }
    }
    else
    {
      long long v12 = objc_alloc_init(BBObserverGatewayEnumerator);
      [(BBObserverGatewayEnumerator *)v12 setBulletin:v6];
      [(BBObserverGatewayEnumerator *)v12 setFeeds:a4];
      [(BBObserverGatewayEnumerator *)v12 setGateways:self->_observerGateways];
      [(BBObserverGatewayEnumerator *)v12 setGatewayTimeout:(double)BBGetObserverGatewayTimeout()];
      long long v29 = [v6 bulletinID];
      [(NSMutableDictionary *)self->_observerGatewayEnumerators setObject:v12 forKey:v29];
      long long v30 = (void *)BBLogGateway;
      if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
      {
        observerGatewayEnumerators = self->_observerGatewayEnumerators;
        long long v32 = v30;
        uint64_t v33 = [(NSMutableDictionary *)observerGatewayEnumerators count];
        *(_DWORD *)buf = 134217984;
        uint64_t v44 = v33;
        _os_log_impl(&dword_217675000, v32, OS_LOG_TYPE_DEFAULT, "Gateway enumerator added. %ld enumerators in flight", buf, 0xCu);
      }
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __37__BBServer__sendAddBulletin_toFeeds___block_invoke;
      v36[3] = &unk_264295E50;
      v36[4] = self;
      id v37 = v29;
      id v34 = v29;
      [(BBObserverGatewayEnumerator *)v12 enumerateWithCompletion:v36];
    }
  }
  else
  {
    long long v12 = [v11 anyObject];
    if (!v12)
    {
      long long v12 = [(NSMutableDictionary *)self->_observerGatewaysByName objectForKeyedSubscript:@"BBObserverGatewayLocalName"];
      if (!v12)
      {
        long long v13 = BBLogGateway;
        if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217675000, v13, OS_LOG_TYPE_DEFAULT, "No BulletinBoard gateways configured.", buf, 2u);
        }
        long long v12 = 0;
      }
    }
    long long v14 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = v14;
      long long v16 = [(BBObserverGatewayEnumerator *)v12 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = (uint64_t)v16;
      _os_log_impl(&dword_217675000, v15, OS_LOG_TYPE_DEFAULT, "Sending to observers of gateway: %@", buf, 0xCu);
    }
    [(BBObserverGatewayEnumerator *)v12 sendObserversAddBulletin:v6 playLightsAndSirens:1 forFeeds:a4];
  }
}

void __37__BBServer__sendAddBulletin_toFeeds___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _performPendingBulletinUpdatesForBulletinID:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 96) removeObjectForKey:*(void *)(a1 + 40)];
  id v2 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
    id v4 = v2;
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Gateway enumerator completed. %lu gateway enumerators still in flight", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_enqueueBulletinUpdate:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [v7 bulletin];
  int v5 = [v4 bulletinID];
  id v6 = [(NSMutableDictionary *)self->_pendingUpdatesByBulletinID objectForKey:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMutableDictionary *)self->_pendingUpdatesByBulletinID setObject:v6 forKey:v5];
  }
  [v6 addObject:v7];
}

- (void)_performPendingBulletinUpdatesForBulletinID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v5 = [(NSMutableDictionary *)self->_pendingUpdatesByBulletinID objectForKey:v4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BBServer *)self _sendBulletinUpdate:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_pendingUpdatesByBulletinID removeObjectForKey:v4];
}

- (void)_sendBulletinUpdate:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v5 = [v4 bulletin];
  uint64_t v31 = [v4 feeds];
  long long v32 = self;
  -[BBMaskedSet objectsForMask:](self->_observerFeedSet, "objectsForMask:");
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v37;
  uint64_t v9 = (os_log_t *)&BBLogBulletinLife;
  id v34 = v5;
  do
  {
    uint64_t v10 = 0;
    uint64_t v33 = v7;
    do
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(obj);
      }
      long long v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
      long long v12 = [v5 bulletinID];
      long long v13 = [v11 currentTransactionForBulletinID:v12];

      if (v13)
      {
        uint64_t v14 = [v13 incrementTransactionID];
        os_log_t v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = v15;
          [v4 typeDescription];
          uint64_t v17 = v8;
          uint64_t v18 = v9;
          v20 = id v19 = v4;
          uint64_t v21 = [v5 bulletinID];
          *(_DWORD *)buf = 138543874;
          long long v41 = v20;
          __int16 v42 = 2048;
          uint64_t v43 = v14;
          __int16 v44 = 2114;
          uint64_t v45 = v21;
          _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "Sending %{public}@ bulletin with transactionID %ld, bulletin %{public}@", buf, 0x20u);

          int v5 = v34;
          id v4 = v19;
          uint64_t v9 = v18;
          uint64_t v8 = v17;
          uint64_t v7 = v33;
        }
        int v22 = +[BBBulletinUpdateTransaction transactionWithBulletinUpdate:v4 transactionID:v14];
        [v11 updateBulletin:v22 withHandler:0];
      }
      else
      {
        os_log_t v23 = *v9;
        if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        int v22 = v23;
        __int16 v24 = [v4 typeDescription];
        id v25 = [v5 bulletinID];
        *(_DWORD *)buf = 138543618;
        long long v41 = v24;
        __int16 v42 = 2114;
        uint64_t v43 = (uint64_t)v25;
        _os_log_impl(&dword_217675000, v22, OS_LOG_TYPE_DEFAULT, "Can't send %{public}@ bulletin. No transactionID for bulletin %{public}@", buf, 0x16u);

        int v5 = v34;
      }

LABEL_13:
      ++v10;
    }
    while (v7 != v10);
    uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  }
  while (v7);
LABEL_15:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v26 = v4;
  }
  else {
    long long v26 = 0;
  }
  if ([v26 shouldSync])
  {
    long long v27 = [v5 sectionID];
    long long v28 = [(BBDismissalSyncCache *)v32->_dismissalSyncCache findBulletinMatch:v5];
    long long v29 = v28;
    if (!v28 || [v28 feeds] && objc_msgSend(v29, "feeds") != 65023)
    {
      long long v30 = [(BBDataProviderManager *)v32->_dataProviderManager dataProviderForSectionID:v27];
      if ([v30 syncsBulletinDismissal]) {
        [(BBSyncServiceInterface *)v32->_syncService enqueueSyncedRemovalForBulletin:v5 feeds:v31];
      }
    }
  }
}

- (void)_sendModifyBulletin:(id)a3 toFeeds:(unint64_t)a4
{
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  id v11 = +[BBBulletinModifyUpdate updateWithBulletin:v7 feeds:a4];
  observerGatewayEnumerators = self->_observerGatewayEnumerators;
  uint64_t v9 = [v7 bulletinID];

  uint64_t v10 = [(NSMutableDictionary *)observerGatewayEnumerators objectForKey:v9];

  if (v10) {
    [(BBServer *)self _enqueueBulletinUpdate:v11];
  }
  else {
    [(BBServer *)self _sendBulletinUpdate:v11];
  }
}

- (void)_sendRemoveBulletins:(id)a3 toFeeds:(unint64_t)a4 shouldSync:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = +[BBBulletinRemoveUpdate updateWithBulletin:v13 feeds:a4 shouldSync:v5];
        observerGatewayEnumerators = self->_observerGatewayEnumerators;
        long long v16 = [v13 bulletinID];
        uint64_t v17 = [(NSMutableDictionary *)observerGatewayEnumerators objectForKey:v16];

        if (v17) {
          [(BBServer *)self _enqueueBulletinUpdate:v14];
        }
        else {
          [(BBServer *)self _sendBulletinUpdate:v14];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

- (void)_sendRemoveBulletin:(id)a3 toFeeds:(unint64_t)a4 shouldSync:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(BBServer *)self _sendRemoveBulletins:v8 toFeeds:a4 shouldSync:v5];
}

- (void)_addBulletin:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v11 = [v5 bulletinID];
  -[NSMutableDictionary setObject:forKey:](self->_bulletinsByID, "setObject:forKey:", v5);
  uint64_t v6 = [v5 sectionID];

  id v7 = [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:v6];

  if (!v7)
  {
    bulletinIDsBySectionID = self->_bulletinIDsBySectionID;
    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    [(NSMutableDictionary *)bulletinIDsBySectionID setObject:v9 forKey:v6];
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:v6];
  [v10 addObject:v11];
}

- (void)_modifyBulletin:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  bulletinsByID = self->_bulletinsByID;
  id v7 = [v5 bulletinID];
  [(NSMutableDictionary *)bulletinsByID setObject:v5 forKey:v7];
}

- (void)_removeBulletin:(id)a3 rescheduleTimerIfAffected:(BOOL)a4 shouldSync:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    id v11 = [v8 bulletinID];
    int v18 = 138543362;
    long long v19 = v11;
    _os_log_impl(&dword_217675000, v10, OS_LOG_TYPE_DEFAULT, "Server has been asked to remove bulletin: %{public}@", (uint8_t *)&v18, 0xCu);
  }
  long long v12 = [v8 bulletinID];
  long long v13 = [v8 sectionID];
  uint64_t v14 = [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:v13];
  [v14 removeObject:v12];

  os_log_t v15 = [(NSMutableDictionary *)self->_noticeBulletinIDsBySectionID objectForKey:v13];
  [v15 removeObject:v12];

  long long v16 = [(NSMutableDictionary *)self->_observerGatewayEnumerators objectForKey:v12];
  if (v16)
  {
    uint64_t v17 = BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      long long v19 = v12;
      _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "Cancel gateway enumerator because server removed bulletin: %{public}@", (uint8_t *)&v18, 0xCu);
    }
    [v16 cancel];
  }
  [(BBServer *)self _sendRemoveBulletin:v8 toFeeds:65023 shouldSync:v5];
  [(BBServer *)self _clearBulletinIDIfPossible:v12 rescheduleExpirationTimer:v6];
}

- (void)_removeBulletin:(id)a3 shouldSync:(BOOL)a4
{
}

- (void)_removeBulletins:(id)a3 forSectionID:(id)a4 shouldSync:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 count])
  {
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v15), "bulletinID", (void)v22);
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v13);
    }

    uint64_t v17 = (void *)BBLogBulletinLife;
    if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = v17;
      long long v19 = NSStringFromBOOL();
      uint64_t v20 = [(NSMutableDictionary *)self->_noticeBulletinIDsBySectionID objectForKey:v9];
      *(_DWORD *)buf = 138544130;
      id v27 = v9;
      __int16 v28 = 2114;
      long long v29 = v19;
      __int16 v30 = 2114;
      uint64_t v31 = v10;
      __int16 v32 = 2114;
      uint64_t v33 = v20;
      _os_log_impl(&dword_217675000, v18, OS_LOG_TYPE_DEFAULT, "Clearing section: %{public}@ syncing: %{public}@ \nwith bulletin IDs: %{public}@\nExisting notice bulletin IDs %{public}@", buf, 0x2Au);
    }
    -[BBServer _sendRemoveBulletins:toFeeds:shouldSync:](self, "_sendRemoveBulletins:toFeeds:shouldSync:", v11, 65023, v5, (void)v22);
    long long v21 = [(NSMutableDictionary *)self->_noticeBulletinIDsBySectionID objectForKey:v9];
    [v21 minusSet:v10];
  }
}

- (void)_dataProviderDidClearInfo:(id)a3 forSection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BBServer *)self dataProviderForSectionID:v6];
  [(BBServer *)self _setClearedInfo:v7 forSectionID:v6];

  [(BBServer *)self _updateAllBulletinsForDataProvider:v8];
}

- (void)clearBulletinIDIfPossible:(id)a3 rescheduleExpirationTimer:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__BBServer_clearBulletinIDIfPossible_rescheduleExpirationTimer___block_invoke;
  block[3] = &unk_2642962D8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __64__BBServer_clearBulletinIDIfPossible_rescheduleExpirationTimer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearBulletinIDIfPossible:*(void *)(a1 + 40) rescheduleExpirationTimer:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_clearBulletinIDs:(id)a3 forSectionID:(id)a4 shouldSync:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 count])
  {
    id v10 = [(BBServer *)self _bulletinsForIDs:v8];
    [(BBServer *)self _removeBulletins:v10 forSectionID:v9 shouldSync:v5];
    BOOL v11 = [(BBServer *)self dataProviderForSectionID:v9];
    uint64_t v12 = [(BBServer *)self _clearedInfoForSectionID:v9];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__BBServer__clearBulletinIDs_forSectionID_shouldSync___block_invoke;
    v13[3] = &unk_264296520;
    v13[4] = self;
    id v14 = v9;
    [v11 clearedInfoForBulletins:v10 lastClearedInfo:v12 completion:v13];
  }
}

uint64_t __54__BBServer__clearBulletinIDs_forSectionID_shouldSync___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dataProviderDidClearInfo:a2 forSection:*(void *)(a1 + 40)];
}

- (void)_clearBulletinsFromDate:(id)a3 toDate:(id)a4 forSection:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v29 = v10;
  [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:v10];
  v30 = __int16 v28 = self;
  BOOL v11 = -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:");
  uint64_t v12 = [MEMORY[0x263EFF9C0] set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v19 = [v18 recencyDate];
        uint64_t v20 = v19;
        if (v19)
        {
          id v21 = v19;
        }
        else
        {
          id v21 = [v18 date];
        }
        long long v22 = v21;

        if ([v22 compare:v8] != -1 && objc_msgSend(v22, "compare:", v9) == -1) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v15);
  }

  [(BBServer *)v28 _removeBulletins:v12 forSectionID:v29 shouldSync:1];
  long long v23 = [(BBServer *)v28 dataProviderForSectionID:v29];
  long long v24 = [(BBServer *)v28 _clearedInfoForSectionID:v29];
  if ([v23 canClearBulletinsByDate])
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke;
    v33[3] = &unk_264296520;
    long long v25 = &v34;
    v33[4] = v28;
    id v34 = v29;
    id v26 = v29;
    [v23 clearedInfoForClearingBulletinsFromDate:v8 toDate:v9 lastClearedInfo:v24 completion:v33];
  }
  else
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke_2;
    v31[3] = &unk_264296520;
    long long v25 = &v32;
    v31[4] = v28;
    __int16 v32 = v29;
    id v27 = v29;
    [v23 clearedInfoForBulletins:v12 lastClearedInfo:v24 completion:v31];
  }
}

uint64_t __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dataProviderDidClearInfo:a2 forSection:*(void *)(a1 + 40)];
}

uint64_t __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dataProviderDidClearInfo:a2 forSection:*(void *)(a1 + 40)];
}

- (void)_clearSection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:v4];
  id v6 = [(BBServer *)self _bulletinsForIDs:v5];
  [(BBServer *)self _removeBulletins:v6 forSectionID:v4 shouldSync:1];
  id v7 = [(BBServer *)self dataProviderForSectionID:v4];
  id v8 = [(BBServer *)self _clearedInfoForSectionID:v4];
  if ([v7 canClearAllBulletins])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __26__BBServer__clearSection___block_invoke;
    v14[3] = &unk_264296520;
    id v9 = &v15;
    v14[4] = self;
    id v15 = v4;
    id v10 = v4;
    [v7 clearedInfoForClearingAllBulletinsWithLastClearedInfo:v8 completion:v14];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __26__BBServer__clearSection___block_invoke_2;
    v12[3] = &unk_264296520;
    id v9 = &v13;
    v12[4] = self;
    id v13 = v4;
    id v11 = v4;
    [v7 clearedInfoForBulletins:v6 lastClearedInfo:v8 completion:v12];
  }
}

uint64_t __26__BBServer__clearSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dataProviderDidClearInfo:a2 forSection:*(void *)(a1 + 40)];
}

uint64_t __26__BBServer__clearSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dataProviderDidClearInfo:a2 forSection:*(void *)(a1 + 40)];
}

- (void)_removeSection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v5 = -[BBServer _allBulletinsForSectionID:](self, "_allBulletinsForSectionID:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BBServer *)self _removeBulletin:*(void *)(*((void *)&v10 + 1) + 8 * v9++) shouldSync:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(BBSectionInfoStoreInterface *)self->_sectionInfoStore removeSectionWithID:v4];
  [(NSMutableSet *)self->_activeSectionIDs removeObject:v4];
  [(BBMuteExpirationManager *)self->_muteManager stopWatchingExpirationsForSectionID:v4];
  [(BBServer *)self _sendRemoveSection:v4];
}

- (id)_applicableSectionInfosForBulletin:(id)a3 inSection:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v19 = v5;
  uint64_t v8 = [v5 subsectionIDs];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [v6 subsections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v14 subsectionID];
        int v16 = [v8 containsObject:v15];

        if (v16) {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  uint64_t v17 = [v7 count];
  if (v6 && !v17) {
    [v7 addObject:v6];
  }

  return v7;
}

- (unint64_t)_feedsForBulletin:(id)a3 destinations:(unint64_t)a4
{
  uint64_t v202 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 sectionID];
  uint64_t v8 = [(BBServer *)self _sectionInfoForSectionID:v7 effective:1];
  if (v8)
  {
    uint64_t v9 = [(BBServer *)self _applicableSectionInfosForBulletin:v6 inSection:v8];
    uint64_t v10 = [v6 subsectionIDs];
    if ([v10 count] && objc_msgSend(v9, "count") == 1)
    {
      int v11 = [v9 containsObject:v8];

      if (v11)
      {
        if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
          -[BBServer _feedsForBulletin:destinations:]();
        }
        uint64_t v12 = 0;
        goto LABEL_278;
      }
    }
    else
    {
    }
    uint64_t v13 = [v6 interruptionLevel];
    uint64_t v14 = v13;
    uint64_t v12 = (a4 >> 1) & 1;
    unint64_t v146 = a4;
    v142 = v8;
    if ((a4 & 2) != 0 && v13 != 3)
    {
      long long v189 = 0u;
      long long v190 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      id v15 = v9;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v187 objects:v201 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        int v18 = self;
        uint64_t v19 = *(void *)v188;
        uint64_t v12 = 1;
LABEL_13:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v188 != v19) {
            objc_enumerationMutation(v15);
          }
          if ([*(id *)(*((void *)&v187 + 1) + 8 * v20) notificationCenterSetting] == 2) {
            break;
          }
          if (v17 == ++v20)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v187 objects:v201 count:16];
            if (v17) {
              goto LABEL_13;
            }
            uint64_t v12 = 0;
            break;
          }
        }
        self = v18;
        uint64_t v8 = v142;
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    v136 = self;
    uint64_t v144 = v14;
    v140 = v9;
    v141 = v7;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v183 objects:v200 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v184;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v184 != v26) {
            objc_enumerationMutation(v22);
          }
          __int16 v28 = *(void **)(*((void *)&v183 + 1) + 8 * i);
          if (v25)
          {
            uint64_t v29 = [v25 subsectionPriority];
            if (v29 >= [v28 subsectionPriority]) {
              continue;
            }
          }
          id v30 = v28;

          uint64_t v25 = v30;
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v183 objects:v200 count:16];
      }
      while (v24);
    }
    else
    {
      uint64_t v25 = 0;
    }

    char v31 = v146;
    if ((unint64_t)[v6 interruptionLevel] <= 1)
    {
      __int16 v32 = [v6 threadID];
      char v33 = [v25 isBulletinMutedForThreadIdentifier:v32];

      if (v33)
      {
LABEL_277:

        uint64_t v9 = v140;
        uint64_t v7 = v141;
LABEL_278:

        unint64_t v21 = v12;
        goto LABEL_279;
      }
    }
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    id v34 = v22;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v179 objects:v199 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v180;
      unint64_t v38 = v12;
LABEL_42:
      uint64_t v39 = 0;
      while (1)
      {
        if (*(void *)v180 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v40 = *(void **)(*((void *)&v179 + 1) + 8 * v39);
        if ([v40 scheduledDeliverySetting] == 2) {
          break;
        }
        if (v36 == ++v39)
        {
          uint64_t v36 = [v34 countByEnumeratingWithState:&v179 objects:v199 count:16];
          if (v36) {
            goto LABEL_42;
          }
          int v41 = 0;
          goto LABEL_67;
        }
      }
      BOOL v42 = [v40 criticalAlertSetting] == 2 && objc_msgSend(v6, "interruptionLevel") == 3;
      BOOL v43 = [v40 timeSensitiveSetting] == 2 && objc_msgSend(v6, "interruptionLevel") == 2;
      if ([v40 directMessagesSetting] == 2)
      {
        __int16 v44 = [v6 contentType];
        if ([v44 isEqualToString:@"BBBulletinContentTypeMessagingDirect"])
        {
          char v45 = 1;
        }
        else
        {
          v46 = [v6 contentType];
          char v45 = [v46 isEqualToString:@"BBBulletinContentTypeMessagingGroup"];
        }
      }
      else
      {
        char v45 = 0;
      }
      int v41 = 0;
      if (v42 || v43)
      {
        unint64_t v38 = v12;
LABEL_67:
        char v31 = v146;
        goto LABEL_68;
      }
      unint64_t v38 = v12;
      char v31 = v146;
      if ((v45 & 1) == 0 && v144 != 3)
      {
        unint64_t v38 = v12 & 0xFFFFFFFFFFFFDFFFLL | (((v146 >> 2) & 1) << 13);
        int v41 = 1;
      }
    }
    else
    {
      int v41 = 0;
      unint64_t v38 = v12;
    }
LABEL_68:

    uint64_t v145 = [v6 interruptionLevel];
    int v143 = v41;
    if ((v41 & 1) == 0 && (v31 & 8) != 0 && v145)
    {
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v47 = v34;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v175 objects:v198 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v176;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v176 != v50) {
              objc_enumerationMutation(v47);
            }
            uint64_t v52 = [*(id *)(*((void *)&v175 + 1) + 8 * j) alertType];
            if (v52 == 1)
            {
              v38 |= 2uLL;
            }
            else if (v52 == 2)
            {
              v38 |= 4uLL;
              goto LABEL_82;
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v175 objects:v198 count:16];
        }
        while (v49);
      }
LABEL_82:

      uint64_t v53 = v38 | 4;
      if (v144 != 3) {
        uint64_t v53 = v38;
      }
      if ((v53 & 4) != 0) {
        unint64_t v38 = v53 & 0xFFFFFFFFFFFFFFFDLL;
      }
      else {
        unint64_t v38 = v53;
      }
    }
    unint64_t v54 = v38;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v55 = v34;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v171 objects:v197 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v172;
      do
      {
        for (uint64_t k = 0; k != v57; ++k)
        {
          if (*(void *)v172 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = *(void **)(*((void *)&v171 + 1) + 8 * k);
          if (v25)
          {
            uint64_t v61 = [v25 subsectionPriority];
            if (v61 >= [v60 subsectionPriority]) {
              continue;
            }
          }
          id v62 = v60;

          uint64_t v25 = v62;
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v171 objects:v197 count:16];
      }
      while (v57);
    }

    if ([v25 lockScreenSetting] == 2)
    {
      unint64_t v63 = v54;
      unint64_t v64 = v146;
      LODWORD(v65) = v143;
      if (!v143 || v144 == 3) {
        goto LABEL_102;
      }
    }
    else
    {
      unint64_t v63 = v54;
      unint64_t v64 = v146;
      LODWORD(v65) = v143;
      if (v144 == 3) {
LABEL_102:
      }
        v63 |= (v64 << 6) & 0x8000 | (8 * ((v64 >> 2) & 1)) & 0xFFFFFFFFFFFFFF9FLL | (32 * ((v63 >> 1) & 3));
    }
    if ((v63 & 0x806E) != 0 && [v6 turnsOnDisplay] && v145 && !v65) {
      v63 |= 0x800uLL;
    }
    v66 = [v6 sound];
    if ((v64 & 0x4D) == 0 || v66 == 0 || v145 == 0) {
      char v69 = 1;
    }
    else {
      char v69 = (char)v65;
    }
    v139 = v66;
    if (v69) {
      goto LABEL_157;
    }
    id v70 = [v66 alertConfiguration];
    if (!BBToneLibraryHasSettingsForAlertType([v70 type])
      || ([v8 usesManagedSettings] & 1) != 0)
    {
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id v71 = v55;
      uint64_t v72 = [v71 countByEnumeratingWithState:&v163 objects:v195 count:16];
      if (v72)
      {
        uint64_t v73 = v72;
        unint64_t v74 = v63;
        uint64_t v75 = *(void *)v164;
        while (2)
        {
          for (uint64_t m = 0; m != v73; ++m)
          {
            if (*(void *)v164 != v75) {
              objc_enumerationMutation(v71);
            }
            if ((~[*(id *)(*((void *)&v163 + 1) + 8 * m) pushSettings] & 0x12) == 0)
            {
              BOOL v77 = 1;
              goto LABEL_130;
            }
          }
          uint64_t v73 = [v71 countByEnumeratingWithState:&v163 objects:v195 count:16];
          if (v73) {
            continue;
          }
          break;
        }
        BOOL v77 = 0;
LABEL_130:
        unint64_t v63 = v74;
        LOWORD(v64) = v146;
      }
      else
      {
        BOOL v77 = 0;
      }

      uint64_t v8 = v142;
      goto LABEL_151;
    }
    v78 = [MEMORY[0x263F7FC90] sharedToneManager];
    if (objc_msgSend(v78, "bb_isToneEnabledForAlertConfiguration:", v70))
    {
    }
    else
    {
      v79 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
      int v80 = objc_msgSend(v79, "bb_isVibrationEnabledForAlertConfiguration:", v70);

      if (!v80)
      {
        int v86 = 0;
LABEL_150:
        BOOL v77 = v86 != 0;
LABEL_151:
        LOBYTE(v65) = v143;
        if (v144 == 3 || v77) {
          v63 |= 0x10uLL;
        }

LABEL_157:
        if ((v64 & 0x40) == 0 || v145 == 0) {
          char v89 = 1;
        }
        else {
          char v89 = (char)v65;
        }
        if (v89)
        {
          int v90 = 0;
        }
        else
        {
          long long v161 = 0u;
          long long v162 = 0u;
          long long v159 = 0u;
          long long v160 = 0u;
          id v65 = v55;
          uint64_t v91 = [v65 countByEnumeratingWithState:&v159 objects:v194 count:16];
          if (v91)
          {
            uint64_t v92 = v91;
            uint64_t v93 = *(void *)v160;
            while (2)
            {
              for (uint64_t n = 0; n != v92; ++n)
              {
                if (*(void *)v160 != v93) {
                  objc_enumerationMutation(v65);
                }
                if ([*(id *)(*((void *)&v159 + 1) + 8 * n) carPlaySetting] == 2)
                {
                  int v90 = 1;
                  goto LABEL_175;
                }
              }
              uint64_t v92 = [v65 countByEnumeratingWithState:&v159 objects:v194 count:16];
              if (v92) {
                continue;
              }
              break;
            }
            int v90 = 0;
LABEL_175:
            LOWORD(v64) = v146;
          }
          else
          {
            int v90 = 0;
          }

          LOBYTE(v65) = v143;
        }
        if (v144 == 3) {
          int v95 = 1;
        }
        else {
          int v95 = v90;
        }
        if (v95) {
          v63 |= 0x80uLL;
        }
        if ((v64 & 0xE) != 0) {
          char v96 = (char)v65;
        }
        else {
          char v96 = 1;
        }
        if ((v96 & 1) == 0 && v145)
        {
          long long v157 = 0u;
          long long v158 = 0u;
          long long v155 = 0u;
          long long v156 = 0u;
          id v97 = v55;
          uint64_t v98 = [v97 countByEnumeratingWithState:&v155 objects:v193 count:16];
          if (v98)
          {
            uint64_t v99 = v98;
            uint64_t v100 = *(void *)v156;
            while (2)
            {
              for (iuint64_t i = 0; ii != v99; ++ii)
              {
                if (*(void *)v156 != v100) {
                  objc_enumerationMutation(v97);
                }
                if ([*(id *)(*((void *)&v155 + 1) + 8 * ii) remoteNotificationsSetting] == 2)
                {
                  v63 |= 0x4000uLL;
                  goto LABEL_198;
                }
              }
              uint64_t v99 = [v97 countByEnumeratingWithState:&v155 objects:v193 count:16];
              if (v99) {
                continue;
              }
              break;
            }
LABEL_198:
            LOWORD(v64) = v146;
          }
        }
        if ((v64 & 0x80) != 0)
        {
          unint64_t v137 = v63;
          long long v153 = 0u;
          long long v154 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          id v102 = v55;
          uint64_t v103 = [v102 countByEnumeratingWithState:&v151 objects:v192 count:16];
          int v135 = v90;
          if (v103)
          {
            uint64_t v104 = v103;
            LOBYTE(v105) = 0;
            uint64_t v106 = *(void *)v152;
            do
            {
              for (juint64_t j = 0; jj != v104; ++jj)
              {
                if (*(void *)v152 != v106) {
                  objc_enumerationMutation(v102);
                }
                uint64_t v108 = [*(id *)(*((void *)&v151 + 1) + 8 * jj) announceSetting];
                if (v105)
                {
                  int v105 = 1;
                }
                else if (v108 == 2)
                {
                  v109 = [v6 contentType];
                  if (([v6 isMessagingNotification] & 1) != 0
                    || ([v6 isCallNotification] & 1) != 0)
                  {
                    int v105 = 1;
                  }
                  else
                  {
                    int v105 = [v109 isEqualToString:@"BBBulletinContentTypeIntercom"];
                  }
                  if ((unint64_t)[v6 interruptionLevel] > 1) {
                    int v105 = 1;
                  }
                }
                else
                {
                  int v105 = v108 == 3 && [v6 interruptionLevel] != 0;
                }
              }
              uint64_t v104 = [v102 countByEnumeratingWithState:&v151 objects:v192 count:16];
            }
            while (v104);
          }
          else
          {
            int v105 = 0;
          }

          uint64_t v110 = [(BBServer *)v136 _effectiveGlobalAnnounceHeadphonesSetting];
          int v111 = v105 ^ 1;
          if (v110 != 2) {
            int v111 = 1;
          }
          if (!v145) {
            int v111 = 1;
          }
          unint64_t v63 = v137;
          int v112 = v143 | v111;
          if (v145) {
            int v113 = v135 & v105 ^ 1;
          }
          else {
            int v113 = 1;
          }
          if (!v112) {
            unint64_t v63 = v137 | 0x100;
          }
          uint64_t v114 = [(BBServer *)v136 _effectiveGlobalAnnounceCarPlaySetting];
          if (((v143 | v113) & 1) == 0
            && ([v6 isMessagingNotification] & ((v114 & 0xFFFFFFFFFFFFFFFELL) == 2)) != 0)
          {
            v63 |= 0x1000uLL;
          }
          uint64_t v115 = [(BBServer *)v136 _effectiveGlobalAnnounceHearingAidsSetting];
          uint64_t v116 = [(BBServer *)v136 _effectiveGlobalAnnounceBuiltInSpeakerSetting];
          uint64_t v8 = v142;
          LOWORD(v64) = v146;
          if (v105)
          {
            BOOL v117 = v116 == 2 || v115 == 2;
            if (v117 && v145 && !v143) {
              v63 |= 0x100uLL;
            }
          }
        }
        if ((v63 & 8) != 0 && BBShouldAlwaysSpeakLockScreenNotifications()) {
          v63 |= 0x100uLL;
        }
        v118 = v139;
        if ((v64 & 0x100) != 0)
        {
          unint64_t v138 = v63;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          id v119 = v55;
          uint64_t v120 = [v119 countByEnumeratingWithState:&v147 objects:v191 count:16];
          if (v120)
          {
            uint64_t v121 = v120;
            unsigned __int8 v122 = 0;
            uint64_t v123 = *(void *)v148;
            do
            {
              for (kuint64_t k = 0; kk != v121; ++kk)
              {
                if (*(void *)v148 != v123) {
                  objc_enumerationMutation(v119);
                }
                v125 = *(void **)(*((void *)&v147 + 1) + 8 * kk);
                uint64_t v126 = [v125 alertType];
                uint64_t v127 = [v125 carPlaySetting];
                BOOL v130 = ([v125 announceSetting] & 0xFFFFFFFFFFFFFFFELL) == 2 || v127 == 2 || v126 != 0;
                v122 |= v130;
              }
              uint64_t v121 = [v119 countByEnumeratingWithState:&v147 objects:v191 count:16];
            }
            while (v121);
          }
          else
          {
            unsigned __int8 v122 = 0;
          }

          uint64_t v131 = [v25 lockScreenSetting];
          BOOL v133 = v144 == 3 || v131 == 2;
          uint64_t v12 = v138;
          if ((v133 | v122)) {
            uint64_t v12 = v138 | 0x400;
          }
          uint64_t v8 = v142;
          v118 = v139;
        }
        else
        {
          uint64_t v12 = v63;
        }

        goto LABEL_277;
      }
    }
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v81 = v55;
    uint64_t v82 = [v81 countByEnumeratingWithState:&v167 objects:v196 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v168;
      while (2)
      {
        for (muint64_t m = 0; mm != v83; ++mm)
        {
          if (*(void *)v168 != v84) {
            objc_enumerationMutation(v81);
          }
          if ([*(id *)(*((void *)&v167 + 1) + 8 * mm) authorizationStatus] == 2)
          {
            int v86 = 1;
            goto LABEL_146;
          }
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v167 objects:v196 count:16];
        if (v83) {
          continue;
        }
        break;
      }
      int v86 = 0;
LABEL_146:
      LOWORD(v64) = v146;
    }
    else
    {
      int v86 = 0;
    }

    uint64_t v8 = v142;
    goto LABEL_150;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
    -[BBServer _feedsForBulletin:destinations:]();
  }
  unint64_t v21 = 0;
LABEL_279:

  return v21;
}

- (id)_bulletinsForIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_allBulletinsForSectionID:(id)a3
{
  id v4 = [(BBServer *)self allBulletinIDsForSectionID:a3];
  id v5 = [(BBServer *)self _bulletinsForIDs:v4];

  return v5;
}

- (id)_sectionInfoForSectionID:(id)a3
{
  return [(BBServer *)self _sectionInfoForSectionID:a3 effective:0];
}

- (id)_sectionInfoArrayForSectionIDs:(id)a3 effective:(BOOL)a4
{
  return (id)[(BBSectionInfoStoreInterface *)self->_sectionInfoStore sortedSectionInfoForSectionIDs:a3 effective:a4];
}

- (id)_sectionInfoArrayForActiveSections:(BOOL)a3
{
  return (id)[(BBSectionInfoStoreInterface *)self->_sectionInfoStore allSortedActiveSections:a3];
}

- (id)_sectionInfoArray:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sectionInfoStore = self->_sectionInfoStore;
  return (id)[(BBSectionInfoStoreInterface *)sectionInfoStore allSortedSectionInfo:v3];
}

- (id)_allSectionInfoIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sectionInfoStore = self->_sectionInfoStore;
  return (id)[(BBSectionInfoStoreInterface *)sectionInfoStore allUnsortedSectionInfoIDs];
}

- (void)_clearBulletinIDIfPossible:(id)a3 rescheduleExpirationTimer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = self->_observers;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v11), "currentTransactionForBulletinID:", v6, (void)v29);

        if (v12)
        {
          int v13 = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  int v13 = 0;
LABEL_11:

  long long v14 = [(NSMutableDictionary *)self->_observerGatewayEnumerators objectForKey:v6];
  if (v14)
  {
    long long v15 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      observerGatewayEnumerators = self->_observerGatewayEnumerators;
      uint64_t v17 = v15;
      int v18 = [(NSMutableDictionary *)observerGatewayEnumerators count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v18;
      _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "Bulletin still in use by one of %d gateway enumerators", buf, 8u);
    }
  }
  uint64_t v19 = -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v6, (void)v29);
  uint64_t v20 = [v19 sectionID];
  unint64_t v21 = [(BBServer *)self noticesBulletinIDsForSectionID:v20];
  int v22 = [v21 containsObject:v6];

  if (v14) {
    char v23 = 1;
  }
  else {
    char v23 = v13;
  }
  uint64_t v24 = BBLogBulletinLife;
  BOOL v25 = os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT);
  if (v23 & 1) != 0 || (v22)
  {
    if (v25)
    {
      __int16 v28 = @"recent interruptions array";
      if (v14) {
        __int16 v28 = @"a gateway enumerator";
      }
      if (v22) {
        __int16 v28 = @"list";
      }
      if (v13) {
        __int16 v28 = @"an observer";
      }
      *(_DWORD *)buf = 138412546;
      id v34 = v6;
      __int16 v35 = 2114;
      uint64_t v36 = v28;
      _os_log_impl(&dword_217675000, v24, OS_LOG_TYPE_DEFAULT, "BBServer not purging bulletin %@ because still in use by %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v25)
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v19;
      _os_log_impl(&dword_217675000, v24, OS_LOG_TYPE_DEFAULT, "BBServer purging bulletin: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:v20];
    [v26 removeObject:v6];

    id v27 = [(NSMutableDictionary *)self->_noticeBulletinIDsBySectionID objectForKey:v20];
    [v27 removeObject:v6];

    if ([(NSMutableArray *)self->_expiringBulletinIDs containsObject:v6])
    {
      [(NSMutableArray *)self->_expiringBulletinIDs removeObject:v6];
      if (v4) {
        [(BBServer *)self _expireBulletinsAndRescheduleTimerIfNecessary];
      }
    }
    if ([(NSMutableArray *)self->_eventBasedExpiringBulletinIDs containsObject:v6]) {
      [(NSMutableArray *)self->_eventBasedExpiringBulletinIDs removeObject:v6];
    }
    [(BBServer *)self noteFinishedWithBulletinID:v6];
    [(NSMutableDictionary *)self->_bulletinsByID removeObjectForKey:v6];
  }
}

- (BOOL)_didNotificationCenterSettingsChangeWithSectionInfo:(id)a3 replacingSectionInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 subsectionID];

  if (v7)
  {
    uint64_t v8 = [v5 subsectionID];
    uint64_t v9 = [v6 _subsectionForID:v8];

    uint64_t v10 = [v5 notificationCenterSetting];
    if (v10 == [v9 notificationCenterSetting])
    {
      uint64_t v11 = [v5 contentPreviewSetting];
      if (v11 == [v9 contentPreviewSetting])
      {
        LOBYTE(v12) = 0;
        goto LABEL_17;
      }
    }
LABEL_16:
    LOBYTE(v12) = 1;
    goto LABEL_17;
  }
  uint64_t v13 = [v5 notificationCenterSetting];
  if (v13 != [v6 notificationCenterSetting]
    || (uint64_t v14 = [v5 contentPreviewSetting], v14 != objc_msgSend(v6, "contentPreviewSetting")))
  {
    LOBYTE(v12) = 1;
    goto LABEL_19;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = objc_msgSend(v5, "subsections", 0);
  uint64_t v12 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v15 = *(void *)v24;
LABEL_9:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v24 != v15) {
        objc_enumerationMutation(v9);
      }
      uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
      int v18 = [v17 subsectionID];
      uint64_t v19 = [v6 _subsectionForID:v18];

      uint64_t v20 = [v17 notificationCenterSetting];
      uint64_t v21 = [v19 notificationCenterSetting];

      if (v20 != v21) {
        goto LABEL_16;
      }
      if (v12 == ++v16)
      {
        uint64_t v12 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
LABEL_17:

LABEL_19:
  return v12;
}

- (void)_setSectionInfoNoteSettingsChanged:(id)a3 forSectionID:(id)a4
{
  id v11 = a4;
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  [(BBServer *)self _setSectionInfo:v7 forSectionID:v11];
  uint64_t v8 = [v7 sectionType];

  if (v8 != 1)
  {
    uint64_t v9 = [(BBServer *)self _sectionInfoForSectionID:v11];
    uint64_t v10 = (void *)[v9 copy];

    [(BBDataProviderManager *)self->_dataProviderManager noteSettingsChanged:v10 forSectionID:v11];
  }
}

- (void)_setPrimitiveSectionInfo:(id)a3 forSectionID:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore sectionInfoForSectionID:v7 effective:0];
  sectionInfoStore = self->_sectionInfoStore;
  if (v6)
  {
    [(BBSectionInfoStoreInterface *)sectionInfoStore setSectionInfo:v6 forSectionID:v7];
    if (!v8) {
      goto LABEL_6;
    }
LABEL_5:
    if ([v6 isEqual:v8]) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  [(BBSectionInfoStoreInterface *)sectionInfoStore removeSectionWithID:v7];
  if (v8) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v10 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl(&dword_217675000, v10, OS_LOG_TYPE_DEFAULT, "Persisting changes for %@", (uint8_t *)&v13, 0xCu);
  }
  persistentStore = self->_persistentStore;
  uint64_t v12 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore sectionInfoByID];
  [(BBPersistentStoreInterface *)persistentStore writeSectionInfo:v12];

LABEL_9:
}

- (void)_setSectionInfo:(id)a3 forSectionID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [(BBServer *)self _sectionInfoForSectionID:v7];
  uint64_t v9 = (void *)[v8 copy];

  [v6 queryAndUseManagedSettings];
  if ([v6 isEqual:v9])
  {
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v10 = [(BBSectionAuthorizationManager *)self->_sectionAuthorizationManager handleChangeForSectionInfo:v6 replacingSectionInfo:v9];

    [(BBMuteExpirationManager *)self->_muteManager cleanAndWatchExpirationsForSectionInfo:v10];
    id v11 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore effectiveSectionInfoForSectionInfo:v10];
    uint64_t v12 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore effectiveSectionInfoForSectionInfo:v9];
    BOOL v13 = [(BBServer *)self _didNotificationCenterSettingsChangeWithSectionInfo:v11 replacingSectionInfo:v12];
    id v14 = [v10 subsectionID];

    if (v14)
    {
      [v9 _replaceSubsection:v10];
      id v15 = v9;

      uint64_t v10 = v15;
    }
    uint64_t v16 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543874;
      id v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      int v22 = v10;
      _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "Saving updated section info for: %{public}@\n\tOld = %{public}@\n\tNew = %{public}@", (uint8_t *)&v17, 0x20u);
    }
    [(BBServer *)self _setPrimitiveSectionInfo:v10 forSectionID:v7];
    [(BBServer *)self _sendUpdateSectionInfo:v10];
    if (v13) {
      [(BBServer *)self _updateDataProviderForSectionInfo:v10 sectionID:v7];
    }
  }
}

- (void)_updateDataProviderForSectionInfo:(id)a3 sectionID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [(BBServer *)self dataProviderForSectionID:v7];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    [(BBServer *)self _updateAllBulletinsForDataProviderIfSectionIsEnabled:v8];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = objc_msgSend(v6, "dataProviderIDs", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v9 = 0;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        id v15 = v9;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v9 = [(BBServer *)self dataProviderForSectionID:*(void *)(*((void *)&v17 + 1) + 8 * v14)];

          if (v9)
          {
            uint64_t v16 = (void *)MEMORY[0x21D44A020]();
            [(BBServer *)self _updateAllBulletinsForDataProviderIfSectionIsEnabled:v9];
          }
          ++v14;
          id v15 = v9;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
}

- (void)_addStateCaptureHandlers
{
  objc_initWeak(&location, self);
  v6[1] = (id)MEMORY[0x263EF8330];
  v6[2] = (id)3221225472;
  v6[3] = __36__BBServer__addStateCaptureHandlers__block_invoke;
  v6[4] = &unk_264296548;
  objc_copyWeak(&v7, &location);
  id v2 = (id)BSLogAddStateCaptureBlockWithTitle();
  v5[1] = (id)MEMORY[0x263EF8330];
  v5[2] = (id)3221225472;
  v5[3] = __36__BBServer__addStateCaptureHandlers__block_invoke_2;
  v5[4] = &unk_264296548;
  objc_copyWeak(v6, &location);
  id v3 = (id)BSLogAddStateCaptureBlockWithTitle();
  objc_copyWeak(v5, &location);
  id v4 = (id)BSLogAddStateCaptureBlockWithTitle();
  objc_destroyWeak(v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __36__BBServer__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (WeakRetained)
  {
    id v3 = [WeakRetained _sectionInfoArray:1];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v9 = [v8 stateCapture];
          uint64_t v10 = [v8 sectionID];
          [v2 setValue:v9 forKey:v10];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  return v2;
}

id __36__BBServer__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = BBStringFromBBContentPreviewSetting([WeakRetained _effectiveGlobalContentPreviewsSetting]);
    char v33 = BBStringFromBBContentPreviewSetting([v2 _globalContentPreviewsSetting]);
    long long v32 = BBStringFromBBContentPreviewSetting([v2 _defaultGlobalContentPreviewSetting]);
    long long v31 = BBStringFromBBAnnounceSetting([v2 _effectiveGlobalAnnounceSetting]);
    long long v30 = BBStringFromBBAnnounceSetting([v2 _globalAnnounceSetting]);
    long long v29 = BBStringFromBBAnnounceSetting([v2 _effectiveGlobalAnnounceHeadphonesSetting]);
    uint64_t v28 = BBStringFromBBAnnounceSetting([v2 _globalAnnounceHeadphonesSetting]);
    id v27 = BBStringFromBBAnnounceCarPlaySetting([v2 _effectiveGlobalAnnounceCarPlaySetting]);
    long long v26 = BBStringFromBBAnnounceCarPlaySetting([v2 _globalAnnounceCarPlaySetting]);
    long long v25 = BBStringFromBBScheduledDeliverySetting([v2 _effectiveGlobalScheduledDeliverySetting]);
    long long v24 = BBStringFromBBSystemSetting([v2 _effectiveGlobalScheduledDeliveryShowNextSummarySetting]);
    uint64_t v4 = [v2 _effectiveGlobalScheduledDeliveryTimes];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v35;
      uint64_t v8 = @"[ ";
      do
      {
        uint64_t v9 = 0;
        uint64_t v10 = v8;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(v4);
          }
          -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", @" %li:%li, ", [*(id *)(*((void *)&v34 + 1) + 8 * v9) hour], objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v9), "minute"));
          uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v9;
          uint64_t v10 = v8;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v8 = @"[ ";
    }
    long long v19 = [(__CFString *)v8 stringByAppendingFormat:@" ]"];

    long long v18 = BBStringFromBBNotificationListDisplayStyleSetting([v2 _effectiveGlobalNotificationListDisplayStyleSetting]);
    v44[0] = @"EffectiveContentPreviewSetting";
    v44[1] = @"ContentPreviewSetting";
    v45[0] = v3;
    v45[1] = v33;
    v44[2] = @"DefaultContentPreviewSettingForDevice";
    v45[2] = v32;
    v46[0] = @"ContentPreviews";
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
    v47[0] = v23;
    v46[1] = @"AnnounceNotifications";
    v42[0] = @"EffectiveAnnounceSetting";
    v42[1] = @"AnnounceSetting";
    v43[0] = v31;
    v43[1] = v30;
    v42[2] = @"AnnounceSupportedHeadphones";
    uint64_t v22 = BBStringFromBool([v2 _isAnnounceSupportedForHeadphones]);
    v43[2] = v22;
    v42[3] = @"AnnounceSupportedCarPlay";
    __int16 v21 = BBStringFromBool([v2 _isAnnounceSupportedForCarPlay]);
    v43[3] = v21;
    void v43[4] = v29;
    v42[4] = @"EffectiveAnnounceHeadphonesSetting";
    v42[5] = @"EffectiveAnnounceCarPlaySetting";
    v43[5] = v27;
    v43[6] = v28;
    v42[6] = @"AnnounceHeadphonesSetting";
    v42[7] = @"AnnounceCarPlaySetting";
    v43[7] = v26;
    v42[8] = @"PairedVehiclesForCarPlay";
    long long v20 = BBStringFromBool([v2 _hasPairedVehiclesForCarPlay]);
    v43[8] = v20;
    v42[9] = @"SiriEnabled";
    long long v12 = BBStringFromBool(v2[305]);
    v43[9] = v12;
    v42[10] = @"SiriAllowedWhenLocked";
    long long v13 = BBStringFromBool(v2[304]);
    v43[10] = v13;
    long long v14 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:11];
    v47[1] = v14;
    v46[2] = @"ScheduledDelivery";
    v40[0] = @"EffectiveScheduledDeliverySetting";
    v40[1] = @"EffectiveScheduledDeliveryShowNextSummarySetting";
    v41[0] = v25;
    v41[1] = v24;
    v40[2] = @"ScheduledDeliveryTimes";
    v41[2] = v19;
    long long v15 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
    v47[2] = v15;
    v46[3] = @"NotificationList";
    uint64_t v38 = @"EffectiveNotificationListDisplayStyleSetting";
    uint64_t v39 = v18;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v47[3] = v16;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA78];
  }

  return v11;
}

id __36__BBServer__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = [WeakRetained _allSectionInfoIDs];
    uint64_t v5 = [v3 setWithArray:v4];

    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = objc_msgSend(v2, "allBulletinIDsForSectionID:", v13, (void)v19);
          if ([v14 count])
          {
            v10 += [v14 count];
            long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
            [v6 setValue:v15 forKey:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }

    v23[0] = @"BulletinCountBySection";
    v23[1] = @"TotalBulletinCount";
    v24[0] = v6;
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v10];
    v24[1] = v17;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263EFFA78];
  }

  return v16;
}

- (void)_handleSignificantTimeChange
{
  [MEMORY[0x263EFFA18] resetSystemTimeZone];
  [(BBServer *)self _expireBulletinsAndRescheduleTimerIfNecessary];
}

- (void)_clearExpirationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    uint64_t v4 = self->_expirationTimer;
    self->_expirationTimer = 0;
  }
  nextScheduledExpirationTimerFireDate = self->_nextScheduledExpirationTimerFireDate;
  self->_nextScheduledExpirationTimerFireDate = 0;
}

- (void)_scheduleTimerForDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(BBServer *)self _clearExpirationTimer];
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  if (v5 < 20.0)
  {
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_ERROR)) {
      -[BBServer _scheduleTimerForDate:]();
    }
    id v7 = [MEMORY[0x263EFF910] date];
    double v6 = 60.0;
    uint64_t v8 = [v7 dateByAddingTimeInterval:60.0];

    id v4 = (id)v8;
  }
  p_nextScheduledExpirationTimerFireDate = &self->_nextScheduledExpirationTimerFireDate;
  objc_storeStrong((id *)&self->_nextScheduledExpirationTimerFireDate, v4);
  uint64_t v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  expirationTimer = self->_expirationTimer;
  self->_expirationTimer = v10;

  long long v12 = self->_expirationTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __34__BBServer__scheduleTimerForDate___block_invoke;
  handler[3] = &unk_264295E28;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_source_set_timer((dispatch_source_t)self->_expirationTimer, 0, (unint64_t)(v6 * 1000000000.0), 0x4A817C800uLL);
  dispatch_resume((dispatch_object_t)self->_expirationTimer);
  uint64_t v13 = BBLogExpiration;
  if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = *p_nextScheduledExpirationTimerFireDate;
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v14;
    _os_log_impl(&dword_217675000, v13, OS_LOG_TYPE_DEFAULT, "Expiration timer now set for %{public}@", buf, 0xCu);
  }
}

uint64_t __34__BBServer__scheduleTimerForDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _expireBulletinsAndRescheduleTimerIfNecessary];
}

- (id)_nextExpireBulletinsDate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_expiringBulletinIDs count])
  {
    bulletinsByID = self->_bulletinsByID;
    id v4 = [(NSMutableArray *)self->_expiringBulletinIDs objectAtIndex:0];
    double v5 = [(NSMutableDictionary *)bulletinsByID objectForKey:v4];

    double v6 = [v5 expirationDate];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (void)_expireBulletinsAndRescheduleTimerIfNecessary
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(BBServer *)self _expireBulletins];
  id v3 = [(BBServer *)self _nextExpireBulletinsDate];
  id v4 = BBLogExpiration;
  if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
  {
    nextScheduledExpirationTimerFireDate = self->_nextScheduledExpirationTimerFireDate;
    int v12 = 138543618;
    uint64_t v13 = v3;
    __int16 v14 = 2114;
    long long v15 = nextScheduledExpirationTimerFireDate;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Next expire bulletins date = %{public}@; current fire date = %{public}@",
      (uint8_t *)&v12,
      0x16u);
  }
  if (v3)
  {
    if (![(NSDate *)v3 isEqualToDate:self->_nextScheduledExpirationTimerFireDate])
    {
      [(BBServer *)self _clearExpirationTimer];
      [(BBServer *)self _scheduleTimerForDate:v3];
      goto LABEL_11;
    }
    uint64_t v6 = BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = self->_nextScheduledExpirationTimerFireDate;
      int v12 = 138543362;
      uint64_t v13 = v7;
      uint64_t v8 = "Not adjusting expiration timer. Next fire date = %{public}@";
      uint64_t v9 = v6;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    [(BBServer *)self _clearExpirationTimer];
    uint64_t v11 = BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      uint64_t v8 = "Expiration timer is not set.";
      uint64_t v9 = v11;
      uint32_t v10 = 2;
      goto LABEL_9;
    }
  }
LABEL_11:
}

- (id)_bulletinIDsInSortedArray:(id)a3 withDateForKey:(id)a4 beforeCutoff:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v21 = a4;
  id v9 = a5;
  uint32_t v10 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v8, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = [(NSMutableDictionary *)self->_bulletinsByID objectForKey:v15];
        uint64_t v17 = [v16 valueForKey:v21];
        id v18 = [v17 laterDate:v9];

        if (v18 != v9)
        {

          goto LABEL_11;
        }
        [v10 addObject:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (unint64_t)_indexForNewDate:(id)a3 inBulletinIDArray:(id)a4 sortedAscendingByDateForKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v11 = [v9 count];
  unint64_t v12 = 0;
  if (v11)
  {
    while (1)
    {
      bulletinsByID = self->_bulletinsByID;
      __int16 v14 = [v9 objectAtIndex:v12];
      uint64_t v15 = [(NSMutableDictionary *)bulletinsByID objectForKey:v14];

      uint64_t v16 = [v15 valueForKey:v10];
      id v17 = [v16 earlierDate:v8];

      if (v17 == v8) {
        break;
      }
      if (v11 == ++v12)
      {
        unint64_t v12 = v11;
        break;
      }
    }
  }
  if (v12 >= v11) {
    unint64_t v18 = v11;
  }
  else {
    unint64_t v18 = v12;
  }

  return v18;
}

- (void)_expireBulletinsDueToSystemEvent:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  double v5 = BBLogExpiration;
  if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v28 = a3;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Received system event %ld; checking for expiration",
      buf,
      0xCu);
  }
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:self->_eventBasedExpiringBulletinIDs];
  id v7 = [(BBServer *)self _bulletinsForIDs:v6];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v24;
    *(void *)&long long v10 = 138543874;
    long long v22 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        __int16 v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v14, "expirationEvents", v22, (void)v23) & a3) != 0)
        {
          uint64_t v15 = (void *)BBLogExpiration;
          if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = v15;
            id v17 = [v14 sectionID];
            unint64_t v18 = [v14 bulletinID];
            *(_DWORD *)buf = v22;
            unint64_t v28 = (unint64_t)v17;
            __int16 v29 = 2114;
            long long v30 = v18;
            __int16 v31 = 2048;
            unint64_t v32 = a3;
            _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "Expiring bulletin in section <%{public}@>: bulletinID = <%{public}@>, event %ld", buf, 0x20u);
          }
          long long v19 = [v14 responseForExpireAction];
          [(BBServer *)self deliverResponse:v19 withCompletion:0];
          eventBasedExpiringBulletinIDs = self->_eventBasedExpiringBulletinIDs;
          id v21 = [v14 bulletinID];
          [(NSMutableArray *)eventBasedExpiringBulletinIDs removeObject:v21];

          [(BBServer *)self _removeBulletin:v14 rescheduleTimerIfAffected:0 shouldSync:0];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v11);
  }
}

- (void)_expireBulletins
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_expiringBulletinIDs count])
  {
    id v3 = [MEMORY[0x263EFF910] date];
    uint64_t v4 = [v3 dateByAddingTimeInterval:20.0];

    long long v19 = (void *)v4;
    unint64_t v18 = [(BBServer *)self _bulletinIDsInSortedArray:self->_expiringBulletinIDs withDateForKey:@"expirationDate" beforeCutoff:v4];
    -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:");
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v10 = (void *)BBLogExpiration;
          if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = v10;
            uint64_t v12 = [v9 sectionID];
            uint64_t v13 = [v9 bulletinID];
            __int16 v14 = [v9 expirationDate];
            *(_DWORD *)buf = 138543874;
            long long v26 = v12;
            __int16 v27 = 2114;
            unint64_t v28 = v13;
            __int16 v29 = 2114;
            long long v30 = v14;
            _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "Expiring bulletin in section <%{public}@>: bulletinID = <%{public}@>, expiration date = <%{public}@>", buf, 0x20u);
          }
          uint64_t v15 = [v9 responseForExpireAction];
          [(BBServer *)self deliverResponse:v15 withCompletion:0];
          expiringBulletinIDs = self->_expiringBulletinIDs;
          id v17 = [v9 bulletinID];
          [(NSMutableArray *)expiringBulletinIDs removeObject:v17];

          [(BBServer *)self _removeBulletin:v9 rescheduleTimerIfAffected:0 shouldSync:0];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v6);
    }
  }
}

- (id)_newValidatedDefaultExpirationComponentsFromComponents:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
    if ([v3 hour] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = [v3 hour];
      if (v5 >= 0) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = -v5;
      }
      [v4 setHour:v6];
    }
    if ([v3 day] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [v3 day];
      if (v7 >= 0) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = -v7;
      }
      [v4 setDay:v8];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_newDateCompontentsByInvertingInterestingPartsOfComponents:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
    if ([v3 hour] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v4, "setHour:", -objc_msgSend(v3, "hour"));
    }
    if ([v3 day] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v4, "setDay:", -objc_msgSend(v3, "day"));
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_setDefaultExpirationComponents:(id)a3
{
  long long v10 = (NSDateComponents *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = v10;
  if (self->_defaultExpirationComponents != v10)
  {
    uint64_t v5 = [(BBServer *)self _newValidatedDefaultExpirationComponentsFromComponents:v10];
    defaultExpirationComponents = self->_defaultExpirationComponents;
    self->_defaultExpirationComponents = v5;
    uint64_t v7 = v5;

    uint64_t v8 = [(BBServer *)self _newDateCompontentsByInvertingInterestingPartsOfComponents:self->_defaultExpirationComponents];
    expirationReferenceComponents = self->_expirationReferenceComponents;
    self->_expirationReferenceComponents = v8;

    id v4 = v10;
  }
}

- (id)_bulletinDefaultExpirationDateFromDate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_defaultExpirationComponents)
  {
    uint64_t v5 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v6 = [v5 dateByAddingComponents:self->_defaultExpirationComponents toDate:v4 options:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_validateExpirationDateForBulletinRequest:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_defaultExpirationComponents)
  {
    id v4 = [v8 recencyDate];
    if (v4 || ([v8 date], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v5 = [v8 expirationDate];
      uint64_t v6 = [(BBServer *)self _bulletinDefaultExpirationDateFromDate:v4];
      uint64_t v7 = v6;
      if (!v5) {
        id v5 = v6;
      }
      [v8 setExpirationDate:v5];
    }
  }
}

- (void)_scheduleExpirationForBulletin:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 expirationDate];
  uint64_t v6 = [v4 bulletinID];
  uint64_t v7 = [v4 expirationEvents];
  expiringBulletinIDs = self->_expiringBulletinIDs;
  if (v5)
  {
    [(NSMutableArray *)expiringBulletinIDs removeObject:v6];
    unint64_t v9 = [(BBServer *)self _indexForNewDate:v5 inBulletinIDArray:self->_expiringBulletinIDs sortedAscendingByDateForKey:@"expirationDate"];
    [(NSMutableArray *)self->_expiringBulletinIDs insertObject:v6 atIndex:v9];
    long long v10 = (void *)BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v10;
      uint64_t v12 = [v4 bulletinID];
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = (uint64_t)v5;
      __int16 v20 = 2048;
      unint64_t v21 = v9;
      _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "Bulletin with bulletinID <%{public}@>, expiration date <%{public}@> inserted in expiring bulletins array at index %ld", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (![(NSMutableArray *)expiringBulletinIDs containsObject:v6]) {
      goto LABEL_7;
    }
    [(NSMutableArray *)self->_expiringBulletinIDs removeObject:v6];
  }
  [(BBServer *)self _expireBulletinsAndRescheduleTimerIfNecessary];
LABEL_7:
  if (v7)
  {
    uint64_t v13 = (void *)BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = v13;
      uint64_t v15 = [v4 bulletinID];
      int v16 = 138543618;
      id v17 = v15;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      _os_log_impl(&dword_217675000, v14, OS_LOG_TYPE_DEFAULT, "Bulletin with bulletinID <%{public}@>, expiration event <%ld> inserted in event-based expiring bulletins array", (uint8_t *)&v16, 0x16u);
    }
    [(NSMutableArray *)self->_eventBasedExpiringBulletinIDs addObject:v6];
  }
}

- (void)ping:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __17__BBServer_ping___block_invoke;
  block[3] = &unk_264296288;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __17__BBServer_ping___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BBServer_getSectionParametersForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296570;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __57__BBServer_getSectionParametersForSectionID_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "dataProviderForSectionID:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v2 = [v5 sectionParameters];
      (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v2, 0);
    }
    else
    {
      id v3 = *(void (**)(uint64_t, void))(v1 + 16);
      uint64_t v4 = *(void *)(a1 + 48);
      v3(v4, 0);
    }
  }
}

- (void)_storeObserver:(id)a3 forFeed:(unint64_t)a4
{
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  [(BBMaskedSet *)self->_observerFeedSet removeObject:v7];
  [(BBMaskedSet *)self->_observerFeedSet addObject:v7 withMask:a4];
}

- (void)_logObserversBeforeAndAfterUpdateBlock:(id)a3
{
  id v3 = (void (**)(void))a3;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEBUG)) {
    -[BBServer _logObserversBeforeAndAfterUpdateBlock:].cold.6();
  }
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEBUG)) {
    -[BBServer _logObserversBeforeAndAfterUpdateBlock:].cold.5();
  }
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEBUG)) {
    -[BBServer _logObserversBeforeAndAfterUpdateBlock:].cold.4();
  }
  v3[2](v3);
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEBUG)) {
    -[BBServer _logObserversBeforeAndAfterUpdateBlock:]();
  }
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEBUG)) {
    -[BBServer _logObserversBeforeAndAfterUpdateBlock:]();
  }
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEBUG)) {
    -[BBServer _logObserversBeforeAndAfterUpdateBlock:]();
  }
}

- (void)observer:(id)a3 setObserverFeed:(unint64_t)a4 attachToLightsAndSirensGateway:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__BBServer_observer_setObserverFeed_attachToLightsAndSirensGateway___block_invoke;
  v13[3] = &unk_264296598;
  id v14 = v8;
  id v15 = v9;
  int v16 = self;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __68__BBServer_observer_setObserverFeed_attachToLightsAndSirensGateway___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id v2 = BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v14 = v3;
      __int16 v15 = 2114;
      uint64_t v16 = v4;
      __int16 v17 = 2114;
      uint64_t v18 = v5;
      _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Setting feed %0lx on gateway %{public}@ observer %{public}@", buf, 0x20u);
    }
    id v6 = *(void **)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__BBServer_observer_setObserverFeed_attachToLightsAndSirensGateway___block_invoke_202;
    v9[3] = &unk_264296598;
    v9[4] = v6;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    id v10 = v7;
    uint64_t v12 = v8;
    id v11 = *(id *)(a1 + 40);
    [v6 _logObserversBeforeAndAfterUpdateBlock:v9];
  }
}

void __68__BBServer_observer_setObserverFeed_attachToLightsAndSirensGateway___block_invoke_202(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _storeObserver:*(void *)(a1 + 40) forFeed:*(void *)(a1 + 56)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (!v2)
  {
    id v2 = [[BBObserverGatewayHolder alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 40) name:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 88) setObject:v2 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  uint64_t v3 = [(BBObserverGatewayHolder *)v2 observerFeedSet];
  [v3 removeObject:*(void *)(a1 + 40)];

  uint64_t v4 = [(BBObserverGatewayHolder *)v2 observerFeedSet];
  [v4 addObject:*(void *)(a1 + 40) withMask:*(void *)(a1 + 56)];

  uint64_t v5 = BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 134218498;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Done setting feed %0lx on gateway %{public}@ observer %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)observer:(id)a3 setObserverFeed:(unint64_t)a4 asLightsAndSirensGateway:(id)a5 priority:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BBServer_observer_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke;
  block[3] = &unk_2642965C0;
  id v16 = v10;
  id v17 = v11;
  unint64_t v19 = a4;
  unint64_t v20 = a6;
  uint64_t v18 = self;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

void __71__BBServer_observer_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id v2 = BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      uint64_t v22 = v4;
      __int16 v23 = 1024;
      int v24 = v6;
      _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Setting feed %0lx on gateway %{public}@ observer %{public}@ at priority %u", buf, 0x26u);
    }
    uint64_t v7 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__BBServer_observer_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke_204;
    v12[3] = &unk_2642965C0;
    v12[4] = v7;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    id v13 = v8;
    uint64_t v15 = v9;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 64);
    id v14 = v10;
    uint64_t v16 = v11;
    [v7 _logObserversBeforeAndAfterUpdateBlock:v12];
  }
}

void __71__BBServer_observer_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke_204(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _storeObserver:*(void *)(a1 + 40) forFeed:*(void *)(a1 + 56)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (!v2)
  {
    id v2 = [[BBObserverGatewayHolder alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 40) name:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 88) setObject:v2 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  uint64_t v3 = [(BBObserverGatewayHolder *)v2 gateway];

  if (!v3)
  {
    [(BBObserverGatewayHolder *)v2 setGateway:*(void *)(a1 + 40)];
    [(BBObserverGatewayHolder *)v2 setGatewayPriority:*(void *)(a1 + 64)];
    [(BBObserverGatewayHolder *)v2 setFeed:*(void *)(a1 + 56)];
    uint64_t v4 = 0;
    switch(*(void *)(a1 + 64))
    {
      case 0:
      case 3:
        goto LABEL_9;
      case 1:
        uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 80) count] != 0;
        goto LABEL_9;
      case 2:
        unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 80) count];
        if (v5 >= 2) {
          uint64_t v4 = 2;
        }
        else {
          uint64_t v4 = v5;
        }
LABEL_9:
        [*(id *)(*(void *)(a1 + 32) + 80) insertObject:v2 atIndex:v4];
        break;
      default:
        break;
    }
  }
  uint64_t v6 = BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = 134218754;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    __int16 v17 = 1024;
    int v18 = v10;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Done setting feed %0lx on gateway %{public}@ observer %{public}@ at priority %u", (uint8_t *)&v11, 0x26u);
  }
}

- (id)_openApplicationOptionsForResponse:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v4 = *MEMORY[0x263F3F5E8];
  uint64_t v5 = *MEMORY[0x263F3F608];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, MEMORY[0x263EFFA88], v5, 0);
  uint64_t v8 = [v6 originID];

  if (v8) {
    [v7 setObject:v8 forKey:*MEMORY[0x263F3F5C0]];
  }

  return v7;
}

- (void)_didReceiveResponseForBulletin:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BBServer__didReceiveResponseForBulletin___block_invoke;
  v7[3] = &unk_264295E50;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__BBServer__didReceiveResponseForBulletin___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) bulletinID];
  [*(id *)(a1 + 40) _clearBulletinIDIfPossible:v2 rescheduleExpirationTimer:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 40) + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "currentTransactionForBulletinID:", v2, (void)v10);

        if (v9) {
          [v8 noteServerReceivedResponseForBulletin:*(void *)(a1 + 32)];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_sendBulletinsLoadedForSectionID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_observers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "noteBulletinsLoadedForSectionID:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)observer:(id)a3 handleResponse:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke;
  block[3] = &unk_264296260;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke(id *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    id v3 = [v2 bulletinID];
    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
        __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_2();
      }
      goto LABEL_13;
    }
    id v4 = [*((id *)a1[5] + 15) objectForKey:v3];
    uint64_t v5 = [v4 actionForResponse:a1[4]];
    uint64_t v6 = [v5 launchURL];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F018D8]);
      id v8 = [a1[5] _openApplicationOptionsForResponse:a1[4]];
      [v7 setFrontBoardOptions:v8];

      uint64_t v9 = [a1[4] endpoint];
      [v7 setTargetConnectionEndpoint:v9];

      [v7 setSensitive:1];
      id v10 = [MEMORY[0x263F01880] defaultWorkspace];
      id v11 = [v5 launchURL];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_207;
      v32[3] = &unk_264296610;
      int8x16_t v22 = *((int8x16_t *)a1 + 2);
      id v12 = (id)v22.i64[0];
      int8x16_t v33 = vextq_s8(v22, v22, 8uLL);
      id v34 = v4;
      id v35 = a1[6];
      [v10 openURL:v11 configuration:v7 completionHandler:v32];

      id v13 = (void *)v33.i64[1];
    }
    else
    {
      uint64_t v14 = [v5 launchBundleID];

      if (!v14)
      {
        id v20 = a1[4];
        id v21 = a1[5];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        void v24[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_212;
        v24[3] = &unk_2642966B0;
        v24[4] = v21;
        id v25 = v20;
        id v26 = v4;
        id v27 = a1[6];
        [v21 deliverResponse:v25 withCompletion:v24];

        goto LABEL_12;
      }
      id v7 = objc_alloc_init(MEMORY[0x263F018D8]);
      id v15 = [a1[5] _openApplicationOptionsForResponse:a1[4]];
      [v7 setFrontBoardOptions:v15];

      uint64_t v16 = [a1[4] endpoint];
      [v7 setTargetConnectionEndpoint:v16];

      __int16 v17 = [MEMORY[0x263F01880] defaultWorkspace];
      int v18 = [v5 launchBundleID];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_209;
      v28[3] = &unk_264296660;
      int8x16_t v23 = *((int8x16_t *)a1 + 2);
      id v19 = (id)v23.i64[0];
      int8x16_t v29 = vextq_s8(v23, v23, 8uLL);
      id v30 = v4;
      id v31 = a1[6];
      [v17 openApplicationWithBundleIdentifier:v18 configuration:v7 completionHandler:v28];

      id v13 = (void *)v29.i64[1];
    }

LABEL_12:
LABEL_13:

    return;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
    __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_1();
  }
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_207(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2;
  block[3] = &unk_2642965E8;
  id v10 = v4;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v8 = v4;
  dispatch_async(v5, block);
}

uint64_t __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setDidOpenApplication:1];
    [*(id *)(a1 + 48) deliverResponse:*(void *)(a1 + 40) withCompletion:0];
    [*(id *)(a1 + 48) _didReceiveResponseForBulletin:*(void *)(a1 + 56)];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, void))(result + 16))(result, v2 == 0, *(void *)(a1 + 40));
  }
  return result;
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_209(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_210;
  v10[3] = &unk_264296638;
  char v16 = a2;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = *(id *)(a1 + 56);
  id v9 = v5;
  dispatch_async(v6, v10);
}

uint64_t __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_210(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 32) setDidOpenApplication:1];
    [*(id *)(a1 + 40) deliverResponse:*(void *)(a1 + 32) withCompletion:0];
    [*(id *)(a1 + 40) _didReceiveResponseForBulletin:*(void *)(a1 + 48)];
  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_210_cold_1();
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 32));
  }
  return result;
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_212(uint64_t a1, char a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_213;
  block[3] = &unk_264296688;
  char v11 = a2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  dispatch_async(v3, block);
}

uint64_t __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_213(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64)
    || ([*(id *)(a1 + 32) setActivated:1],
        [*(id *)(a1 + 40) _didReceiveResponseForBulletin:*(void *)(a1 + 48)],
        !*(unsigned char *)(a1 + 64)))
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_213_cold_1();
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

- (void)observer:(id)a3 finishedWithBulletinID:(id)a4 transactionID:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__BBServer_observer_finishedWithBulletinID_transactionID___block_invoke;
  v13[3] = &unk_264296598;
  id v14 = v8;
  id v15 = v9;
  char v16 = self;
  unint64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __58__BBServer_observer_finishedWithBulletinID_transactionID___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40))
  {
    id v3 = objc_msgSend(v2, "currentTransactionForBulletinID:");
    if ([v3 transactionID] == *(void *)(a1 + 56))
    {
      [*(id *)(a1 + 32) removeTransaction:v3];
      id v4 = BBLogBulletinLife;
      if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v15 = 138543362;
        uint64_t v16 = v5;
        _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Observer is finished with bulletin %{public}@", (uint8_t *)&v15, 0xCu);
      }
      id v6 = [*(id *)(*(void *)(a1 + 48) + 72) objectAtIndex:0];
      int v7 = [v6 containsObject:*(void *)(a1 + 32)];

      if (v7)
      {
        id v8 = BBLogSectionUpdates;
        if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 40);
          int v15 = 138543362;
          uint64_t v16 = v9;
          _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "List observer is finished with bulletin %{public}@", (uint8_t *)&v15, 0xCu);
        }
      }
      [*(id *)(a1 + 48) _clearBulletinIDIfPossible:*(void *)(a1 + 40) rescheduleExpirationTimer:1];
    }
    else
    {
      id v10 = (void *)BBLogBulletinLife;
      if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 56);
        id v12 = v10;
        uint64_t v13 = [v3 transactionID];
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = 134218498;
        uint64_t v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = v13;
        __int16 v19 = 2114;
        uint64_t v20 = v14;
        _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring observer 'finishedWithBulletinID' for outdated transactionID %ld. Current ID: %ld, bulletin: %{public}@", (uint8_t *)&v15, 0x20u);
      }
    }
  }
}

- (void)observer:(id)a3 clearSection:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__BBServer_observer_clearSection___block_invoke;
  v8[3] = &unk_264295E50;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __34__BBServer_observer_clearSection___block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = BBLogSectionUpdates;
    if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Handling clear section %{public}@", (uint8_t *)&v4, 0xCu);
    }
    return [*(id *)(v1 + 40) _clearSection:*(void *)(v1 + 32)];
  }
  return result;
}

- (void)observer:(id)a3 clearBulletinsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__BBServer_observer_clearBulletinsFromDate_toDate_inSections___block_invoke;
  v16[3] = &unk_2642966D8;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  uint64_t v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, v16);
}

void __62__BBServer_observer_clearBulletinsFromDate_toDate_inSections___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v2 = *(id *)(a1 + 48);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v23 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v14;
      *(void *)&long long v4 = 138543874;
      long long v12 = v4;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
          id v9 = BBLogSectionUpdates;
          if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            uint64_t v11 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v12;
            uint64_t v18 = v8;
            __int16 v19 = 2114;
            uint64_t v20 = v10;
            __int16 v21 = 2114;
            uint64_t v22 = v11;
            _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, "Handling clear bulletins for section %{public}@: %{public}@ to %{public}@", buf, 0x20u);
          }
          objc_msgSend(*(id *)(a1 + 56), "_clearBulletinsFromDate:toDate:forSection:", *(void *)(a1 + 32), *(void *)(a1 + 40), v8, v12, (void)v13);
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v2 countByEnumeratingWithState:&v13 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (void)observer:(id)a3 clearBulletinIDs:(id)a4 inSection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BBServer_observer_clearBulletinIDs_inSection___block_invoke;
  block[3] = &unk_264296418;
  id v13 = v8;
  id v14 = v7;
  long long v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

uint64_t __48__BBServer_observer_clearBulletinIDs_inSection___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = BBLogSectionUpdates;
  if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Handling clear bulletins for section %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 48) _clearBulletinIDs:*(void *)(a1 + 40) forSectionID:*(void *)(a1 + 32) shouldSync:1];
}

- (void)observer:(id)a3 removeBulletins:(id)a4 inSection:(id)a5 fromFeeds:(unint64_t)a6
{
  id v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BBServer_observer_removeBulletins_inSection_fromFeeds___block_invoke;
  block[3] = &unk_2642962B0;
  void block[4] = self;
  id v12 = v8;
  unint64_t v13 = a6;
  id v10 = v8;
  dispatch_async(queue, block);
}

uint64_t __57__BBServer_observer_removeBulletins_inSection_fromFeeds___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRemoveBulletins:*(void *)(a1 + 40) toFeeds:*(void *)(a1 + 48) shouldSync:1];
}

- (void)observer:(id)a3 getSectionInfoWithHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__BBServer_observer_getSectionInfoWithHandler___block_invoke;
  v8[3] = &unk_2642961C0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __47__BBServer_observer_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _sectionInfoArray:1];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
  }
}

- (void)observer:(id)a3 getSectionInfoForActiveSectionsWithHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__BBServer_observer_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v8[3] = &unk_2642961C0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __64__BBServer_observer_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _sectionInfoArrayForActiveSections:1];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
  }
}

- (void)observer:(id)a3 getSectionInfoForSectionIDs:(id)a4 withHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BBServer_observer_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_264296570;
  id v13 = v7;
  id v14 = v8;
  void block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

void __61__BBServer_observer_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _sectionInfoArrayForSectionIDs:*(void *)(a1 + 40) effective:1];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
  }
}

- (void)observer:(id)a3 requestNoticesBulletinsForSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BBServer_observer_requestNoticesBulletinsForSectionID___block_invoke;
  block[3] = &unk_264296418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __57__BBServer_observer_requestNoticesBulletinsForSectionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendObserver:*(void *)(a1 + 40) noticesBulletinsForSectionID:*(void *)(a1 + 48)];
}

- (void)requestNoticesBulletinsForAllSections:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 56);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke_2;
  v3[3] = &unk_264296700;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 performBlockOnDataProviders:v3];
}

void __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 sectionIdentifier];
  [v2 _sendObserver:v3 noticesBulletinsForSectionID:v4];
}

- (void)_sendObserver:(id)a3 noticesBulletinsForSectionID:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
    id v7 = [(BBServer *)self noticesBulletinIDsForSectionID:a4];
    id v8 = [MEMORY[0x263EFF9C0] set];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v14 = [(NSMutableDictionary *)self->_bulletinsByID objectForKey:v13];
          long long v15 = +[BBBulletinAddUpdate updateWithBulletin:v14 feeds:1 shouldPlayLightsAndSirens:1];
          long long v16 = +[BBBulletinUpdateTransaction transactionWithBulletinUpdate:transactionID:](BBBulletinUpdateTransaction, "transactionWithBulletinUpdate:transactionID:", v15, [v6 incrementedTransactionIDForBulletinID:v13]);
          [v8 addObject:v16];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          [v6 updateBulletin:*(void *)(*((void *)&v23 + 1) + 8 * j) withHandler:0];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }
  }
}

- (void)getEffectiveSectionInfoWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v5 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Get all effective section infos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__BBServer_getEffectiveSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_264296728;
  void v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  if (v4) {
    v4[2](v4, v10[5], 0);
  }
  _Block_object_dispose(&v9, 8);
}

void __47__BBServer_getEffectiveSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _sectionInfoArray:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = (void *)BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
    int v8 = 134217984;
    uint64_t v9 = [v6 count];
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got %ld effective section infos", (uint8_t *)&v8, 0xCu);
  }
}

- (void)getSectionInfoWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v5 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Get all section infos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__BBServer_getSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_264296728;
  void v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  if (v4) {
    v4[2](v4, v10[5], 0);
  }
  _Block_object_dispose(&v9, 8);
}

void __38__BBServer_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _sectionInfoArray:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = (void *)BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
    int v8 = 134217984;
    uint64_t v9 = [v6 count];
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got %ld section infos", (uint8_t *)&v8, 0xCu);
  }
}

- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__BBServer_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v6[3] = &unk_264296728;
  v6[4] = self;
  id v6[5] = &v7;
  dispatch_sync(queue, v6);
  if (v4) {
    v4[2](v4, v8[5], 0);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __55__BBServer_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _sectionInfoArrayForActiveSections:0];
  return MEMORY[0x270F9A758]();
}

- (void)getActiveSectionIDsWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "BBServer: Servicing XPC request for activeSectionIDs", buf, 2u);
  }
  *(void *)buf = 0;
  uint64_t v11 = buf;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  id v14 = __Block_byref_object_dispose__3;
  id v15 = [MEMORY[0x263EFFA08] set];
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__BBServer_getActiveSectionIDsWithHandler___block_invoke;
  v9[3] = &unk_264296728;
  v9[4] = self;
  void v9[5] = buf;
  dispatch_sync(queue, v9);
  if (v4)
  {
    uint64_t v7 = (id)BBLogGeneral;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*((id *)v11 + 5) count];
      *(_DWORD *)long long v16 = 134217984;
      uint64_t v17 = v8;
      _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "BBServer: XPC request handler for activeSectionIDs count: %lu", v16, 0xCu);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, *((void *)v11 + 5), 0);
  }
  _Block_object_dispose(buf, 8);
}

void __43__BBServer_getActiveSectionIDsWithHandler___block_invoke(uint64_t a1)
{
}

- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BBServer_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_264296198;
  uint64_t v12 = &v13;
  void block[4] = self;
  id v9 = v6;
  id v11 = v9;
  dispatch_sync(queue, block);
  if (v7) {
    v7[2](v7, v14[5]);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __52__BBServer_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _sectionInfoArrayForSectionIDs:*(void *)(a1 + 40) effective:0];
  return MEMORY[0x270F9A758]();
}

- (void)getEffectiveSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__BBServer_getEffectiveSectionInfoForSectionIDs_withHandler___block_invoke;
  v11[3] = &unk_264296750;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v15;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(queue, v11);
  if (v9) {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __61__BBServer_getEffectiveSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t result)
{
  if (*(void *)(result + 48))
  {
    uint64_t v1 = result;
    *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) = [*(id *)(result + 32) _sectionInfoArrayForSectionIDs:*(void *)(result + 40) effective:1];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)getSectionIDsWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3;
  id v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v5 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Get all section IDs", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__BBServer_getSectionIDsWithHandler___block_invoke;
  v7[3] = &unk_264296728;
  void v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  if (v4) {
    v4[2](v4, v10[5], 0);
  }
  _Block_object_dispose(&v9, 8);
}

void __37__BBServer_getSectionIDsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _allSectionInfoIDs];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = (void *)BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
    int v8 = 134217984;
    uint64_t v9 = [v6 count];
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got %ld section IDs", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_updateAllSectionInfos
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = -[BBSectionInfoStoreInterface allSortedSectionInfo:](self->_sectionInfoStore, "allSortedSectionInfo:", 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x21D44A020]();
        [(BBServer *)self _sendUpdateSectionInfo:v8];
        uint64_t v10 = [v8 sectionID];
        uint64_t v11 = [(BBServer *)self dataProviderForSectionID:v10];
        [(BBServer *)self _updateAllBulletinsForDataProviderIfSectionIsEnabled:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_updateGlobalSettings
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v15 = [BBGlobalSettings alloc];
  int64_t v3 = [(BBServer *)self _effectiveGlobalContentPreviewsSetting];
  int64_t v4 = [(BBServer *)self _effectiveGlobalAnnounceSetting];
  int64_t v5 = [(BBServer *)self _effectiveGlobalAnnounceHeadphonesSetting];
  int64_t v6 = [(BBServer *)self _effectiveGlobalAnnounceCarPlaySetting];
  int64_t v7 = [(BBServer *)self _effectiveGlobalScheduledDeliverySetting];
  int v8 = [(BBServer *)self _effectiveGlobalScheduledDeliveryTimes];
  uint64_t v9 = [(BBGlobalSettings *)v15 initWithContentPreviewSetting:v3 announceSetting:v4 announceHeadphonesSetting:v5 announceCarPlaySetting:v6 scheduledDeliverySetting:v7 scheduledDeliveryTimes:v8 scheduledDeliveryShowNextSummarySetting:[(BBServer *)self _effectiveGlobalScheduledDeliveryShowNextSummarySetting] notificationListDisplayStyleSetting:[(BBServer *)self _effectiveGlobalNotificationListDisplayStyleSetting] summarizationSetting:[(BBServer *)self _effectiveGlobalSummarizationSetting] highlightsSettings:[(BBServer *)self _effectiveGlobalHighlightsSetting]];

  uint64_t v10 = [(BBMaskedSet *)self->_observerFeedSet objectAtIndex:9];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v14++) updateGlobalSettings:v9];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)_biometricResourceStateChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(BBServer *)self _globalContentPreviewsSetting])
  {
    [(BBServer *)self _updateGlobalSettings];
    [(BBServer *)self _updateAllSectionInfos];
  }
}

- (void)_setGlobalSummarizationSetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(BBServer *)self _shouldUseUNSSettings])
  {
    int64_t v5 = +[BBBulletinBoardDefaults standardDefaults];
    [v5 setGlobalSummarizationSetting:a3];

    [(BBServer *)self _updateGlobalSettings];
    [(BBServer *)self _updateAllSectionInfos];
  }
}

- (int64_t)_globalSummarizationSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v2 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v3 = [v2 globalSummarizationSetting];

  return v3;
}

- (int64_t)_defaultGlobalSummarizationSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (_os_feature_enabled_impl()) {
    int64_t v2 = 1;
  }
  else {
    int64_t v2 = 2;
  }
  if (BBAreGenerativeSummarizationModelsAvailable()) {
    return v2;
  }
  else {
    return -1;
  }
}

- (void)_setGlobalHighlightsSetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(BBServer *)self _shouldUseUNSSettings])
  {
    int64_t v5 = +[BBBulletinBoardDefaults standardDefaults];
    [v5 setGlobalHighlightsSetting:a3];

    [(BBServer *)self _updateGlobalSettings];
  }
}

- (int64_t)_globalHighlightsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t v2 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v3 = [v2 globalHighlightsSetting];

  return v3;
}

- (int64_t)_effectiveGlobalHighlightsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings]
    || !BBAreGenerativePrioritizationModelsAvailable())
  {
    return -1;
  }
  if ([(BBServer *)self _globalHighlightsSetting])
  {
    return [(BBServer *)self _globalHighlightsSetting];
  }
  else
  {
    return [(BBServer *)self _defaultGlobalHighlightsSetting];
  }
}

- (int64_t)_defaultGlobalHighlightsSetting
{
  if (BBAreGenerativePrioritizationModelsAvailable()) {
    return 2;
  }
  else {
    return -1;
  }
}

- (BOOL)isGreyMatterEligble
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    int v3 = domain_answer;
    int64_t v4 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR)) {
      [(BBServer *)v3 isGreyMatterEligble];
    }
  }
  else
  {
    int64_t v5 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = 0;
      _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "[BBServer: greyMatterEligible=%{BOOL}d", buf, 8u);
    }
  }
  return 0;
}

- (void)_setGlobalContentPreviewsSetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    [(BBPersistentStoreInterface *)persistentStore setGlobalContentPreviewsSetting:a3];
  }
  else
  {
    id v6 = +[BBBulletinBoardDefaults standardDefaults];
    [v6 setGlobalContentPreviewSetting:a3];
  }
}

- (void)getEffectiveGlobalContentPreviewsSettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer_getEffectiveGlobalContentPreviewsSettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__BBServer_getEffectiveGlobalContentPreviewsSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalContentPreviewsSetting];
    int v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);
    return v3(v1, v2, 0);
  }
  return result;
}

- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BBServer_setEffectiveGlobalContentPreviewsSetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __65__BBServer_setEffectiveGlobalContentPreviewsSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _globalContentPreviewsSetting];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2 != v3)
  {
    id v4 = *(void **)(a1 + 32);
    if (v3 == [v4 _defaultGlobalContentPreviewSetting]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = *(void *)(a1 + 48);
    }
    [v4 _setGlobalContentPreviewsSetting:v5];
    [*(id *)(a1 + 32) _updateGlobalSettings];
    [*(id *)(a1 + 32) _updateAllSectionInfos];
  }
  id v6 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalContentPreviewsSetting", v8, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)eligibleAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BBServer_eligibleAnnouncementRequestTypesChanged_onPlatform___block_invoke;
  block[3] = &unk_2642967A0;
  char v6 = a3 & 1;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(queue, block);
}

uint64_t __63__BBServer_eligibleAnnouncementRequestTypesChanged_onPlatform___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(result + 40);
  if (v2 == 2)
  {
    uint64_t v5 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(v1 + 48);
      int v7 = 67109120;
      int v8 = v6;
      _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Changed value of eligible setup for announce for CarPlay: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return [*(id *)(v1 + 32) _setAnnounceSupportedForCarPlay:*(unsigned __int8 *)(v1 + 48)];
  }
  else if (v2 == 1)
  {
    uint64_t v3 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(v1 + 48);
      int v7 = 67109120;
      int v8 = v4;
      _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Changed value of eligible setup for announce for headphones: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return [*(id *)(v1 + 32) _setAnnounceSupportedForHeadphones:*(unsigned __int8 *)(v1 + 48)];
  }
  return result;
}

- (void)_siriPreferencesDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BBServer__siriPreferencesDidChange___block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__BBServer__siriPreferencesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSiriPreferences];
}

- (void)_updateSiriPreferences
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  int v4 = [v3 assistantIsEnabled];

  int siriEnabled = self->_siriEnabled;
  BOOL v6 = siriEnabled != v4;
  if (siriEnabled != v4) {
    self->_int siriEnabled = v4;
  }
  int v7 = [MEMORY[0x263F285A0] sharedPreferences];
  int v8 = [v7 disableAssistantWhilePasscodeLocked] ^ 1;

  if (self->_siriAllowedWhenLocked != v8)
  {
    self->_BOOL siriAllowedWhenLocked = v8;
    BOOL v6 = 1;
  }
  uint64_t v9 = [MEMORY[0x263F285A0] sharedPreferences];
  int v10 = [v9 announceNotificationsOnHearingAidsEnabled];

  if (self->_announceOnHearingAidsEnabled != v10)
  {
    self->_BOOL announceOnHearingAidsEnabled = v10;
    BOOL v6 = 1;
  }
  int64_t v11 = [MEMORY[0x263F285A0] sharedPreferences];
  int v12 = [v11 announceNotificationsOnHearingAidsSupported];

  if (self->_announceOnHearingAidsSupported != v12)
  {
    self->_BOOL announceOnHearingAidsSupported = v12;
    BOOL v6 = 1;
  }
  uint64_t v13 = [MEMORY[0x263F285A0] sharedPreferences];
  int v14 = [v13 announceNotificationsOnBuiltInSpeakerEnabled];

  if (self->_announceOnBuiltInSpeakerEnabled == v14)
  {
    if (!v6) {
      return;
    }
  }
  else
  {
    self->_BOOL announceOnBuiltInSpeakerEnabled = v14;
  }
  long long v15 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = self->_siriEnabled;
    BOOL siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    BOOL announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    BOOL announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    BOOL announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    v21[0] = 67110144;
    v21[1] = v16;
    __int16 v22 = 1024;
    BOOL v23 = siriAllowedWhenLocked;
    __int16 v24 = 1024;
    BOOL v25 = announceOnHearingAidsEnabled;
    __int16 v26 = 1024;
    BOOL v27 = announceOnHearingAidsSupported;
    __int16 v28 = 1024;
    BOOL v29 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_217675000, v15, OS_LOG_TYPE_DEFAULT, "Siri preferences did change [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d, Announce on hearing aids enabled: %{BOOL}d, Announce on hearing aids supported: %{BOOL}d, Announce on built in speaker enabled: %{BOOL}d]", (uint8_t *)v21, 0x20u);
  }
  [(BBServer *)self _updateAnnounceSettings];
}

- (void)_pairedVehiclesForCarPlayDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BBServer__pairedVehiclesForCarPlayDidChange___block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__BBServer__pairedVehiclesForCarPlayDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAllVehiclesForCarPlay];
}

- (void)_fetchAllVehiclesForCarPlay
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  uint64_t v3 = (void *)getCRPairedVehicleManagerClass_softClass;
  uint64_t v11 = getCRPairedVehicleManagerClass_softClass;
  if (!getCRPairedVehicleManagerClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getCRPairedVehicleManagerClass_block_invoke;
    v7[3] = &unk_264296920;
    void v7[4] = &v8;
    __getCRPairedVehicleManagerClass_block_invoke((uint64_t)v7);
    uint64_t v3 = (void *)v9[3];
  }
  int v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = objc_alloc_init(v4);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke;
  v6[3] = &unk_2642967C8;
  v6[4] = self;
  [v5 fetchAllVehiclesWithCompletion:v6];
}

void __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 count];
  int v4 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3 != 0;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Changed value of vehicles for CarPlay: %{BOOL}d", buf, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(NSObject **)(v5 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke_222;
  v7[3] = &unk_264296300;
  void v7[4] = v5;
  BOOL v8 = v3 != 0;
  dispatch_async(v6, v7);
}

uint64_t __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke_222(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPairedVehiclesForCarPlay:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateAnnounceControlCenterModuleAvailability
{
  if (!CFPreferencesGetAppBooleanValue(@"SBIconVisibility", @"com.apple.siri.SpokenNotificationsModule", 0))
  {
    CFPreferencesSetAppValue(@"SBIconVisibility", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.siri.SpokenNotificationsModule");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
  }
}

- (void)_saveGlobalAnnounceSettingEnabledEvent
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2050000000;
  uint64_t v2 = (void *)get_DKEventStreamClass_softClass;
  uint64_t v27 = get_DKEventStreamClass_softClass;
  if (!get_DKEventStreamClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __get_DKEventStreamClass_block_invoke;
    __int16 v22 = &unk_264296920;
    BOOL v23 = &v24;
    __get_DKEventStreamClass_block_invoke((uint64_t)&v19);
    uint64_t v2 = (void *)v25[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v24, 8);
  int v4 = [v3 eventStreamWithName:@"/discoverability/signals"];
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2050000000;
  uint64_t v5 = (void *)get_DKAnyStringIdentifierClass_softClass;
  uint64_t v27 = get_DKAnyStringIdentifierClass_softClass;
  if (!get_DKAnyStringIdentifierClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __get_DKAnyStringIdentifierClass_block_invoke;
    __int16 v22 = &unk_264296920;
    BOOL v23 = &v24;
    __get_DKAnyStringIdentifierClass_block_invoke((uint64_t)&v19);
    uint64_t v5 = (void *)v25[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v24, 8);
  int v7 = [v6 type];
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2050000000;
  BOOL v8 = (void *)get_DKIdentifierClass_softClass;
  uint64_t v27 = get_DKIdentifierClass_softClass;
  if (!get_DKIdentifierClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __get_DKIdentifierClass_block_invoke;
    __int16 v22 = &unk_264296920;
    BOOL v23 = &v24;
    __get_DKIdentifierClass_block_invoke((uint64_t)&v19);
    BOOL v8 = (void *)v25[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v24, 8);
  BOOL v10 = [v9 identifierWithString:@"com.apple.siri.spoken-notifications.enabled" type:v7];
  uint64_t v11 = [MEMORY[0x263EFF910] date];
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2050000000;
  int v12 = (void *)get_DKEventClass_softClass;
  uint64_t v27 = get_DKEventClass_softClass;
  if (!get_DKEventClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __get_DKEventClass_block_invoke;
    __int16 v22 = &unk_264296920;
    BOOL v23 = &v24;
    __get_DKEventClass_block_invoke((uint64_t)&v19);
    int v12 = (void *)v25[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v24, 8);
  int v14 = [v13 eventWithStream:v4 startDate:v11 endDate:v11 value:v10 confidence:0 metadata:1.0];
  if (v14)
  {
    uint64_t v24 = 0;
    BOOL v25 = &v24;
    uint64_t v26 = 0x2050000000;
    long long v15 = (void *)get_DKKnowledgeStoreClass_softClass;
    uint64_t v27 = get_DKKnowledgeStoreClass_softClass;
    if (!get_DKKnowledgeStoreClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __get_DKKnowledgeStoreClass_block_invoke;
      __int16 v22 = &unk_264296920;
      BOOL v23 = &v24;
      __get_DKKnowledgeStoreClass_block_invoke((uint64_t)&v19);
      long long v15 = (void *)v25[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v24, 8);
    long long v17 = [v16 knowledgeStore];
    v28[0] = v14;
    long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    [v17 saveObjects:v18 responseQueue:0 withCompletion:&__block_literal_global_241];
  }
}

void __50__BBServer__saveGlobalAnnounceSettingEnabledEvent__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      __50__BBServer__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1();
    }
  }
  else if (a2)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    [v5 setObject:@"com.apple.siri.spoken-notifications.enabled" forKeyedSubscript:@"signalIdentifier"];
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2050000000;
    id v6 = (void *)get_CDContextualKeyPathClass_softClass;
    uint64_t v20 = get_CDContextualKeyPathClass_softClass;
    if (!get_CDContextualKeyPathClass_softClass)
    {
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      int v14 = __get_CDContextualKeyPathClass_block_invoke;
      long long v15 = &unk_264296920;
      id v16 = &v17;
      __get_CDContextualKeyPathClass_block_invoke((uint64_t)&v12);
      id v6 = (void *)v18[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v17, 8);
    BOOL v8 = [v7 keyPathWithKey:@"/discoverability/signals/dataDictionary"];
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2050000000;
    id v9 = (void *)get_CDClientContextClass_softClass;
    uint64_t v20 = get_CDClientContextClass_softClass;
    if (!get_CDClientContextClass_softClass)
    {
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      int v14 = __get_CDClientContextClass_block_invoke;
      long long v15 = &unk_264296920;
      id v16 = &v17;
      __get_CDClientContextClass_block_invoke((uint64_t)&v12);
      id v9 = (void *)v18[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v17, 8);
    uint64_t v11 = [v10 userContext];
    [v11 setObject:v5 forKeyedSubscript:v8];
  }
}

- (void)_updateAnnounceSettings
{
  [(BBServer *)self _updateGlobalSettings];
  [(BBServer *)self _updateAllSectionInfos];
  [(BBServer *)self _updateAnnounceControlCenterModuleAvailability];
}

- (int64_t)_globalAnnounceSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v4 = [v3 globalAnnounceSetting];

  if (v4 == -1)
  {
    [(BBServer *)self _setGlobalAnnounceSetting:0];
    return 0;
  }
  return v4;
}

- (void)_setGlobalAnnounceSetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    [(BBPersistentStoreInterface *)persistentStore setGlobalAnnounceSetting:a3];
  }
  else
  {
    id v6 = +[BBBulletinBoardDefaults standardDefaults];
    uint64_t v7 = [v6 globalAnnounceSetting];

    if (a3 != -1 && v7 != a3)
    {
      BOOL v8 = +[BBBulletinBoardDefaults standardDefaults];
      [v8 setGlobalAnnounceSetting:a3];

      [(BBServer *)self _updateGlobalSettings];
      [(BBServer *)self _updateAllSectionInfos];
      [(BBServer *)self _updateAnnounceControlCenterModuleAvailability];
      if (a3 == 2)
      {
        [(BBServer *)self _saveGlobalAnnounceSettingEnabledEvent];
      }
    }
  }
}

- (void)getEffectiveGlobalAnnounceSettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BBServer_getEffectiveGlobalAnnounceSettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __57__BBServer_getEffectiveGlobalAnnounceSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalAnnounceSetting];
    id v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = BBStringFromBBAnnounceSetting(v2);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BBServer_setEffectiveGlobalAnnounceSetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __58__BBServer_setEffectiveGlobalAnnounceSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    uint64_t v5 = BBStringFromBBAnnounceSetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalAnnounceSetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setAnnounceSupportedForHeadphones:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _isAnnounceSupportedForHeadphones] != v3)
  {
    uint64_t v5 = +[BBBulletinBoardDefaults standardDefaults];
    [v5 setAnnounceSupportedForHeadphones:v3];

    [(BBServer *)self _updateAnnounceSettings];
  }
}

- (int64_t)_globalAnnounceHeadphonesSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v4 = [v3 globalAnnounceHeadphonesSetting];

  if (v4 == -1)
  {
    [(BBServer *)self _setGlobalAnnounceHeadphonesSetting:0];
    return 0;
  }
  return v4;
}

- (void)_setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    [(BBPersistentStoreInterface *)persistentStore setGlobalAnnounceHeadphonesSetting:a3];
  }
  else
  {
    id v6 = +[BBBulletinBoardDefaults standardDefaults];
    uint64_t v7 = [v6 globalAnnounceHeadphonesSetting];

    if (a3 != -1 && v7 != a3)
    {
      id v8 = +[BBBulletinBoardDefaults standardDefaults];
      [v8 setGlobalAnnounceHeadphonesSetting:a3];

      [(BBServer *)self _updateGlobalSettings];
    }
  }
}

- (int64_t)_effectiveGlobalAnnounceHeadphonesSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    return [(BBPersistentStoreInterface *)persistentStore effectiveGlobalAnnounceHeadphonesSetting];
  }
  else if ([(BBServer *)self _isAnnounceSupportedForHeadphones])
  {
    if (self->_siriEnabled
      && self->_siriAllowedWhenLocked
      && [(BBServer *)self _effectiveGlobalAnnounceSetting] == 2)
    {
      int64_t result = [(BBServer *)self _globalAnnounceHeadphonesSetting];
      if (!result) {
        return 2;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return -1;
  }
  return result;
}

- (int64_t)_effectiveGlobalAnnounceHearingAidsSetting
{
  if (!self->_siriEnabled || !self->_siriAllowedWhenLocked || !self->_announceOnHearingAidsSupported) {
    return -1;
  }
  if (self->_announceOnHearingAidsEnabled) {
    return 2;
  }
  return 1;
}

- (int64_t)_effectiveGlobalAnnounceBuiltInSpeakerSetting
{
  if (!self->_siriEnabled || !self->_siriAllowedWhenLocked) {
    return -1;
  }
  if (self->_announceOnBuiltInSpeakerEnabled) {
    return 2;
  }
  return 1;
}

- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__BBServer_getEffectiveGlobalAnnounceHeadphonesSettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __67__BBServer_getEffectiveGlobalAnnounceHeadphonesSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalAnnounceHeadphonesSetting];
    BOOL v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = BBStringFromBBAnnounceSetting(v2);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__BBServer_setEffectiveGlobalAnnounceHeadphonesSetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __68__BBServer_setEffectiveGlobalAnnounceHeadphonesSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    uint64_t v5 = BBStringFromBBAnnounceSetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalAnnounceHeadphonesSetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setAnnounceSupportedForCarPlay:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _isAnnounceSupportedForCarPlay] != v3)
  {
    uint64_t v5 = +[BBBulletinBoardDefaults standardDefaults];
    [v5 setAnnounceSupportedForCarPlay:v3];

    [(BBServer *)self _updateAnnounceSettings];
  }
}

- (void)_setPairedVehiclesForCarPlay:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _hasPairedVehiclesForCarPlay] != v3)
  {
    uint64_t v5 = +[BBBulletinBoardDefaults standardDefaults];
    [v5 setPairedVehiclesForCarPlay:v3];

    [(BBServer *)self _updateAnnounceSettings];
  }
}

- (int64_t)_globalAnnounceCarPlaySetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v4 = [v3 globalAnnounceCarPlaySetting];

  if (v4 == -1)
  {
    [(BBServer *)self _setGlobalAnnounceCarPlaySetting:0];
    return 0;
  }
  return v4;
}

- (void)_setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    [(BBPersistentStoreInterface *)persistentStore setGlobalAnnounceCarPlaySetting:a3];
  }
  else
  {
    id v6 = +[BBBulletinBoardDefaults standardDefaults];
    uint64_t v7 = [v6 globalAnnounceCarPlaySetting];

    if (a3 != -1 && v7 != a3)
    {
      id v8 = +[BBBulletinBoardDefaults standardDefaults];
      [v8 setGlobalAnnounceCarPlaySetting:a3];

      [(BBServer *)self _updateGlobalSettings];
    }
  }
}

- (int64_t)_effectiveGlobalAnnounceCarPlaySetting
{
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    return [(BBPersistentStoreInterface *)persistentStore effectiveGlobalAnnounceCarPlaySetting];
  }
  else if ([(BBServer *)self _isAnnounceSupportedForCarPlay] {
         && [(BBServer *)self _hasPairedVehiclesForCarPlay])
  }
  {
    if (self->_siriEnabled
      && self->_siriAllowedWhenLocked
      && [(BBServer *)self _effectiveGlobalAnnounceSetting] == 2)
    {
      int64_t result = [(BBServer *)self _globalAnnounceCarPlaySetting];
      if (!result) {
        return 3;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return -1;
  }
  return result;
}

- (void)getEffectiveGlobalAnnounceCarPlaySettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer_getEffectiveGlobalAnnounceCarPlaySettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__BBServer_getEffectiveGlobalAnnounceCarPlaySettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalAnnounceCarPlaySetting];
    BOOL v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = BBStringFromBBAnnounceCarPlaySetting(v2);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BBServer_setEffectiveGlobalAnnounceCarPlaySetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __65__BBServer_setEffectiveGlobalAnnounceCarPlaySetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    uint64_t v5 = BBStringFromBBAnnounceCarPlaySetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalAnnounceCarPlaySetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setGlobalScheduledDeliverySetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    [(BBPersistentStoreInterface *)persistentStore setGlobalScheduledDeliverySetting:a3];
  }
  else if ([(BBServer *)self _globalScheduledDeliverySetting] != a3)
  {
    id v6 = +[BBBulletinBoardDefaults standardDefaults];
    [v6 setGlobalScheduledDeliverySetting:a3];

    [(BBServer *)self _updateGlobalSettings];
  }
}

- (void)getEffectiveGlobalScheduledDeliverySettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__BBServer_getEffectiveGlobalScheduledDeliverySettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __66__BBServer_getEffectiveGlobalScheduledDeliverySettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalScheduledDeliverySetting];
    uint64_t v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = BBStringFromBBScheduledDeliverySetting(v2);
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__BBServer_setEffectiveGlobalScheduledDeliverySetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __67__BBServer_setEffectiveGlobalScheduledDeliverySetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    uint64_t v5 = BBStringFromBBScheduledDeliverySetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalScheduledDeliverySetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_scheduledDeliveryTimesForEncodedDeliveryTimes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [v3 count];
  if (v5)
  {
    unint64_t v6 = v5;
    for (unint64_t i = 0; i < v6; i += 2)
    {
      if (v6 <= i + 1) {
        break;
      }
      id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
      uint64_t v9 = [v3 objectAtIndex:i];
      objc_msgSend(v8, "setHour:", objc_msgSend(v9, "integerValue"));

      id v10 = [v3 objectAtIndex:i + 1];
      objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "integerValue"));

      [v4 addObject:v8];
    }
  }

  return v4;
}

- (id)_encodedScheduledDeliveryTimesForDeliveryTimes:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "hour", (void)v14));
        [v4 addObject:v11];

        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "minute"));
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_globalScheduledDeliveryTimes
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = +[BBBulletinBoardDefaults standardDefaults];
  id v4 = [v3 globalScheduledDeliveryTimes];
  id v5 = [(BBServer *)self _scheduledDeliveryTimesForEncodedDeliveryTimes:v4];

  return v5;
}

- (void)_setGlobalScheduledDeliveryTimes:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    [(BBPersistentStoreInterface *)self->_persistentStore setGlobalScheduledDeliveryTimes:v7];
  }
  else
  {
    id v4 = [(BBServer *)self _globalScheduledDeliveryTimes];

    if (v4 != v7)
    {
      id v5 = [(BBServer *)self _encodedScheduledDeliveryTimesForDeliveryTimes:v7];
      uint64_t v6 = +[BBBulletinBoardDefaults standardDefaults];
      [v6 setGlobalScheduledDeliveryTimes:v5];

      [(BBServer *)self _updateGlobalSettings];
    }
  }
}

- (id)_effectiveGlobalScheduledDeliveryTimes
{
  if ([(BBServer *)self _shouldUseUNSSettings]) {
    [(BBPersistentStoreInterface *)self->_persistentStore effectiveGlobalScheduledDeliveryTimes];
  }
  else {
  id v3 = [(BBServer *)self _globalScheduledDeliveryTimes];
  }
  return v3;
}

- (void)getEffectiveGlobalScheduledDeliveryTimesWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer_getEffectiveGlobalScheduledDeliveryTimesWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __64__BBServer_getEffectiveGlobalScheduledDeliveryTimesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _effectiveGlobalScheduledDeliveryTimes];
    id v3 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v4, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BBServer_setEffectiveGlobalScheduledDeliveryTimes_withHandler___block_invoke;
  block[3] = &unk_264296260;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __65__BBServer_setEffectiveGlobalScheduledDeliveryTimes_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 40) _setGlobalScheduledDeliveryTimes:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)_globalScheduledDeliveryShowNextSummarySetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v2 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v3 = [v2 globalScheduledDeliveryShowNextSummarySetting];

  return v3;
}

- (void)_setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    [(BBPersistentStoreInterface *)persistentStore setGlobalScheduledDeliveryShowNextSummarySetting:a3];
  }
  else if ([(BBServer *)self _globalScheduledDeliveryShowNextSummarySetting] != a3)
  {
    uint64_t v6 = +[BBBulletinBoardDefaults standardDefaults];
    [v6 setGlobalScheduledDeliveryShowNextSummarySetting:a3];

    [(BBServer *)self _updateGlobalSettings];
  }
}

- (int64_t)_effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    return [(BBPersistentStoreInterface *)persistentStore effectiveGlobalScheduledDeliveryShowNextSummarySetting];
  }
  else if ([(BBServer *)self _globalScheduledDeliveryShowNextSummarySetting])
  {
    return [(BBServer *)self _globalScheduledDeliveryShowNextSummarySetting];
  }
  else
  {
    return 1;
  }
}

- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__BBServer_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __81__BBServer_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalScheduledDeliveryShowNextSummarySetting];
    int64_t v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      int v5 = BBStringFromBBSystemSetting(v2);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__BBServer_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __82__BBServer_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    int v5 = BBStringFromBBSystemSetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalScheduledDeliveryShowNextSummarySetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)_globalNotificationListDisplayStyleSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v2 = +[BBBulletinBoardDefaults standardDefaults];
  int64_t v3 = [v2 globalNotificationListDisplayStyleSetting];

  return v3;
}

- (void)_setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    [(BBPersistentStoreInterface *)persistentStore setGlobalNotificationListDisplayStyleSetting:a3];
  }
  else if ([(BBServer *)self _globalNotificationListDisplayStyleSetting] != a3)
  {
    id v6 = +[BBBulletinBoardDefaults standardDefaults];
    [v6 setGlobalNotificationListDisplayStyleSetting:a3];

    [(BBServer *)self _updateGlobalSettings];
    [(BBServer *)self _publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:a3];
  }
}

- (int64_t)_effectiveGlobalNotificationListDisplayStyleSetting
{
  if ([(BBServer *)self _shouldUseUNSSettings])
  {
    persistentStore = self->_persistentStore;
    return [(BBPersistentStoreInterface *)persistentStore effectiveGlobalNotificationListDisplayStyleSetting];
  }
  else if ([(BBServer *)self _globalNotificationListDisplayStyleSetting])
  {
    return [(BBServer *)self _globalNotificationListDisplayStyleSetting];
  }
  else
  {
    return 2;
  }
}

- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__BBServer_getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __77__BBServer_getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    unint64_t v2 = [*(id *)(result + 32) _effectiveGlobalNotificationListDisplayStyleSetting];
    int64_t v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      int v5 = BBStringFromBBNotificationListDisplayStyleSetting(v2);
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalNotificationListDisplayStyleSetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__BBServer_setEffectiveGlobalNotificationListDisplayStyleSetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __78__BBServer_setEffectiveGlobalNotificationListDisplayStyleSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    int v5 = BBStringFromBBNotificationListDisplayStyleSetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalNotificationListDisplayStyleSetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalNotificationListDisplayStyleSetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getEffectiveGlobalSummarizationSettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__BBServer_getEffectiveGlobalSummarizationSettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __62__BBServer_getEffectiveGlobalSummarizationSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalSummarizationSetting];
    unint64_t v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      int v5 = BBStringFromBBSystemSetting(v2);
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got getEffectiveGlobalSummarizationSetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BBServer_setEffectiveGlobalSummarizationSetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __63__BBServer_setEffectiveGlobalSummarizationSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    int v5 = BBStringFromBBSystemSetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalSummarizationSetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalSummarizationSetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getEffectiveGlobalHighlightsSettingWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__BBServer_getEffectiveGlobalHighlightsSettingWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__BBServer_getEffectiveGlobalHighlightsSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveGlobalHighlightsSetting];
    uint64_t v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      int v5 = BBStringFromBBSystemSetting(v2);
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got getEffectiveGlobalHighlightsSetting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BBServer_setEffectiveGlobalHighlightsSetting_withHandler___block_invoke;
  block[3] = &unk_264296778;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __60__BBServer_setEffectiveGlobalHighlightsSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = v2;
    int v5 = BBStringFromBBSystemSetting(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalHighlightsSetting: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setGlobalHighlightsSetting:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:(int64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F2A9B8] discoverabilitySignal];
  int v5 = [v4 source];
  id v6 = objc_alloc(MEMORY[0x263F2A780]);
  id v10 = @"notificationListDisplayStyleSetting";
  int v7 = BBStringFromBBNotificationListDisplayStyleSetting(a3);
  v11[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v9 = (void *)[v6 initWithIdentifier:@"com.apple.SpringBoard.notificationListDisplayStyleSetting.changed" bundleID:@"com.apple.SpringBoard" context:@"NotificationListDisplayStyleSetting" userInfo:v8];

  [v5 sendEvent:v9];
}

- (id)universalSectionIDForSectionID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(BBDataProviderManager *)self->_dataProviderManager universalSectionIDForSectionID:v5];

  return v6;
}

- (id)sectionIDsForUniversalSectionID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(BBDataProviderManager *)self->_dataProviderManager localSectionIdentifiersFromDismissalSectionIdentifer:v5];

  return v6;
}

- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BBServer_getUniversalSectionIDForSectionID_withHandler___block_invoke;
  block[3] = &unk_264296570;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __58__BBServer_getUniversalSectionIDForSectionID_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "universalSectionIDForSectionID:");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v4, 0);
    }
    else
    {
      uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
      uint64_t v3 = *(void *)(a1 + 48);
      v2(v3, 0);
    }
  }
}

- (id)bulletinsRequestsForBulletinIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = -[NSMutableDictionary objectForKey:](self->_bulletinRequestsByID, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)bulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    id v21 = v7;
    uint64_t v20 = [(BBServer *)self allBulletinIDsForSectionID:v7];
    BOOL v25 = -[BBServer bulletinsRequestsForBulletinIDs:](self, "bulletinsRequestsForBulletinIDs:");
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v6;
    id obj = v6;
    uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v26)
    {
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v11 = v25;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v28 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                long long v17 = [v16 publisherMatchID];
                int v18 = [v10 isEqualToString:v17];

                if (v18) {
                  [v8 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v13);
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v26);
    }

    id v7 = v21;
    id v6 = v22;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)getBulletinsWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__BBServer_getBulletinsWithHandler___block_invoke;
  v7[3] = &unk_2642961C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __36__BBServer_getBulletinsWithHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 120) allValues];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BBServer_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke;
  block[3] = &unk_264296570;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __74__BBServer_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1[6])
  {
    id v2 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v3 = [*(id *)(a1[4] + 120) allValues];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v9 = [v8 publicationDate];
          id v10 = [v9 earlierDate:a1[5]];
          id v11 = (void *)a1[5];

          if (v10 == v11)
          {
            id v12 = [v8 sectionID];
            id v13 = [v2 objectForKeyedSubscript:v12];

            if (!v13)
            {
              id v13 = [MEMORY[0x263EFF980] array];
              uint64_t v14 = [v8 sectionID];
              [v2 setObject:v13 forKeyedSubscript:v14];
            }
            long long v15 = [v8 publisherMatchID];
            [v13 addObject:v15];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__BBServer_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke;
  v15[3] = &unk_264296810;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

void __67__BBServer_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    id v2 = [*(id *)(a1 + 32) bulletinsForPublisherMatchIDs:*(void *)(a1 + 40) sectionID:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (unint64_t)effectivePushSettingsForSectionInfo:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 alertType] != 0;
  uint64_t v5 = [v3 pushSettings];

  return v5 & 0xFFFFFFFFFFFFFFDFLL | (32 * v4);
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__BBServer_setSectionInfo_forSectionID_withHandler___block_invoke;
  v15[3] = &unk_264296210;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __52__BBServer_setSectionInfo_forSectionID_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 sectionID];
    int v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

    if (v4)
    {
      uint64_t v5 = BBLogSettings;
      if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v12 = 138543362;
        uint64_t v13 = v6;
        _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "SettingsGateway changed section settings: %{public}@", (uint8_t *)&v12, 0xCu);
      }
      id v7 = *(void **)(a1 + 48);
      id v8 = [v7 _sectionInfoForSectionID:*(void *)(a1 + 40)];
      char v9 = [v7 effectivePushSettingsForSectionInfo:v8];

      uint64_t v10 = [*(id *)(a1 + 48) effectivePushSettingsForSectionInfo:*(void *)(a1 + 32)] & 0x38;
      if ((v9 & 0x38) == 0 && v10 || (v9 & 0x38) != 0 && !v10) {
        ADClientAddValueForScalarKey();
      }
      [*(id *)(a1 + 48) _setSectionInfoNoteSettingsChanged:*(void *)(a1 + 32) forSectionID:*(void *)(a1 + 40)];
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)refreshAnnounceSettings
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__BBServer_refreshAnnounceSettings__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__BBServer_refreshAnnounceSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnnounceSettings];
}

- (void)refreshGlobalSettings
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__BBServer_refreshGlobalSettings__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__BBServer_refreshGlobalSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateGlobalSettings];
}

- (void)refreshSectionInfo
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__BBServer_refreshSectionInfo__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__BBServer_refreshSectionInfo__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAllSectionInfos];
}

- (void)refreshSectionInfoForID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__BBServer_refreshSectionInfoForID___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __36__BBServer_refreshSectionInfoForID___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 72) objectAtIndex:9];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 216) sectionInfoForSectionID:*(void *)(a1 + 40) effective:1];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v8++) updateSectionInfo:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }
  id v19 = v4;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v3 dataProviderIDs];
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSectionID:effective:", *(void *)(*((void *)&v25 + 1) + 8 * v12), 1, v19);
        if (v13)
        {
          uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 72) objectAtIndex:9];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                [*(id *)(*((void *)&v21 + 1) + 8 * v18++) updateSectionInfo:v13];
              }
              while (v16 != v18);
              uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
            }
            while (v16);
          }
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v10);
  }
}

- (void)sendMessageToDataProviderSectionID:(id)a3 name:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke;
  v15[3] = &unk_2642966D8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataProviderForSectionID:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    [v2 deliverMessageWithName:*(void *)(a1 + 48) userInfo:*(void *)(a1 + 56)];
  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke_cold_1();
  }
}

- (void)weeAppWithBundleID:(id)a3 setHiddenFromUser:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke;
  block[3] = &unk_2642962D8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _sectionInfoForSectionID:*(void *)(a1 + 40)];
  id v3 = [v2 pathToWeeAppPluginBundle];

  if (v3)
  {
    if (*(unsigned __int8 *)(a1 + 48) != [v2 hideWeeApp])
    {
      id v4 = BBLogSettings;
      if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        id v6 = @"HIDDEN";
        if (!*(unsigned char *)(a1 + 48)) {
          id v6 = @"NOT HIDDEN";
        }
        int v7 = 138543618;
        uint64_t v8 = v5;
        __int16 v9 = 2112;
        id v10 = v6;
        _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Changing hidden state for wee app <%{public}@> to: %@", (uint8_t *)&v7, 0x16u);
      }
      [v2 setHideWeeApp:*(unsigned __int8 *)(a1 + 48)];
      [v2 setSuppressFromSettings:*(unsigned __int8 *)(a1 + 48)];
      [*(id *)(a1 + 32) _setSectionInfo:v2 forSectionID:*(void *)(a1 + 40)];
    }
  }
  else if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR))
  {
    __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke_cold_1();
  }
}

- (void)weeAppWithBundleID:(id)a3 getHiddenFromUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BBServer_weeAppWithBundleID_getHiddenFromUser___block_invoke;
  block[3] = &unk_264296260;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __49__BBServer_weeAppWithBundleID_getHiddenFromUser___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _sectionInfoForSectionID:*(void *)(a1 + 40)];
  id v3 = [v2 pathToWeeAppPluginBundle];

  if (v3)
  {
    uint64_t v4 = [v2 hideWeeApp];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR)) {
      __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke_cold_1();
    }
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [NSNumber numberWithBool:v4];
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
}

- (id)_sectionIDsToMigrate
{
  return &unk_26C7ABB60;
}

- (void)_migrateLoadedData
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(BBServer *)self _sectionIDsToMigrate];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 138543362;
    long long v15 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_msgSend(v3, "objectForKey:", v9, v15);
        uint64_t v11 = [(BBServer *)self _clearedInfoForSectionID:v9];
        if (v11)
        {
          id v12 = BBLogMigration;
          if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            long long v22 = v9;
            __int16 v23 = 2114;
            long long v24 = v10;
            _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Migrating saved cleared info for \"%{public}@\" to \"%{public}@\"", buf, 0x16u);
          }
          id v13 = [(BBServer *)self _clearedInfoForSectionID:v10];

          if (v13)
          {
            id v14 = BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              long long v22 = v10;
              _os_log_impl(&dword_217675000, v14, OS_LOG_TYPE_DEFAULT, "\t*** Not migrating because cleared info for \"%{public}@\" already exists!", buf, 0xCu);
            }
          }
          else
          {
            [(BBSectionInfoStoreInterface *)self->_sectionInfoStore setClearedInfo:v11 forSectionID:v10];
          }
          [(BBSectionInfoStoreInterface *)self->_sectionInfoStore setClearedInfo:0 forSectionID:v9];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)loadDataProvidersAndSettings
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__BBServer_loadDataProvidersAndSettings__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__BBServer_loadDataProvidersAndSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadDataProvidersAndSettings];
}

- (void)_migrateGlobalAnnounceSettingIfNeeded
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = +[BBBulletinBoardDefaults standardDefaults];
  uint64_t v4 = [v3 globalAnnounceSetting];

  long long v5 = +[BBBulletinBoardDefaults standardDefaults];
  unint64_t v6 = objc_msgSend(v5, "globalSpokenNotificationSetting_deprecated");

  if (v4) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6 + 1 >= 2;
  }
  if (v7)
  {
    uint64_t v8 = BBLogMigration;
    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = v6;
      _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Migrating announce setting to previously persisted setting with value = %ld", (uint8_t *)&v9, 0xCu);
    }
    [(BBServer *)self _setGlobalAnnounceSetting:BBAnnounceSettingForSpokenNotificationSetting(v6)];
  }
}

- (void)_loadSystemCapabilities
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = (AFSiriAnnouncementRequestCapabilityManager *)[objc_alloc(MEMORY[0x263F28600]) initWithPlatform:1];
  announcementCapabilityManagerForHeadphones = self->_announcementCapabilityManagerForHeadphones;
  self->_announcementCapabilityManagerForHeadphones = v3;

  BOOL v5 = [(BBServer *)self _isAnnounceSupportedForHeadphones];
  unint64_t v6 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v31 = v5;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Cached value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  BOOL v7 = self->_announcementCapabilityManagerForHeadphones;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __35__BBServer__loadSystemCapabilities__block_invoke;
  v29[3] = &unk_264296838;
  v29[4] = self;
  [(AFSiriAnnouncementRequestCapabilityManager *)v7 fetchEligibleAnnouncementRequestTypesWithCompletion:v29];
  uint64_t v8 = (AFSiriAnnouncementRequestCapabilityManager *)[objc_alloc(MEMORY[0x263F28600]) initWithPlatform:2];
  announcementCapabilityManagerForCarPlay = self->_announcementCapabilityManagerForCarPlay;
  self->_announcementCapabilityManagerForCarPlay = v8;

  BOOL v10 = [(BBServer *)self _isAnnounceSupportedForCarPlay];
  uint64_t v11 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v31 = v10;
    _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "Cached value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  id v12 = self->_announcementCapabilityManagerForCarPlay;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  void v28[2] = __35__BBServer__loadSystemCapabilities__block_invoke_290;
  v28[3] = &unk_264296838;
  void v28[4] = self;
  [(AFSiriAnnouncementRequestCapabilityManager *)v12 fetchEligibleAnnouncementRequestTypesWithCompletion:v28];
  BOOL v13 = [(BBServer *)self _hasPairedVehiclesForCarPlay];
  id v14 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v31 = v13;
    _os_log_impl(&dword_217675000, v14, OS_LOG_TYPE_DEFAULT, "Cached value of vehicles for CarPlay: %{BOOL}d", buf, 8u);
  }
  [(BBServer *)self _fetchAllVehiclesForCarPlay];
  long long v15 = [MEMORY[0x263F087C8] defaultCenter];
  [v15 addObserver:self selector:sel__pairedVehiclesForCarPlayDidChange_ name:@"CRPairedVehiclesDidChangeNotification" object:0];

  id v16 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL siriEnabled = [v16 assistantIsEnabled];

  long long v17 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL siriAllowedWhenLocked = [v17 disableAssistantWhilePasscodeLocked] ^ 1;

  long long v18 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL announceOnHearingAidsEnabled = [v18 announceNotificationsOnHearingAidsEnabled];

  long long v19 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL announceOnHearingAidsSupported = [v19 announceNotificationsOnHearingAidsSupported];

  long long v20 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL announceOnBuiltInSpeakerEnabled = [v20 announceNotificationsOnBuiltInSpeakerEnabled];

  long long v21 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    BOOL siriEnabled = self->_siriEnabled;
    BOOL siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    BOOL announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    BOOL announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    BOOL announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    *(_DWORD *)buf = 67110144;
    BOOL v31 = siriEnabled;
    __int16 v32 = 1024;
    BOOL v33 = siriAllowedWhenLocked;
    __int16 v34 = 1024;
    BOOL v35 = announceOnHearingAidsEnabled;
    __int16 v36 = 1024;
    BOOL v37 = announceOnHearingAidsSupported;
    __int16 v38 = 1024;
    BOOL v39 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_217675000, v21, OS_LOG_TYPE_DEFAULT, "Siri preferences did load [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d Announce On Hearing Aids Enabled: %{BOOL}d, Announce on Hearing Aids Supported: %{BOOL}d, Announce on Built-In Speaker: %{BOOL}d]", buf, 0x20u);
  }
  long long v27 = [MEMORY[0x263F08A00] defaultCenter];
  [v27 addObserver:self selector:sel__siriPreferencesDidChange_ name:*MEMORY[0x263F28318] object:0];

  [(AFSiriAnnouncementRequestCapabilityManager *)self->_announcementCapabilityManagerForHeadphones addObserver:self];
  [(AFSiriAnnouncementRequestCapabilityManager *)self->_announcementCapabilityManagerForCarPlay addObserver:self];
}

void __35__BBServer__loadSystemCapabilities__block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = a2 & 1;
  uint64_t v4 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = v3;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Fetched value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(NSObject **)(v5 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__BBServer__loadSystemCapabilities__block_invoke_288;
  v7[3] = &unk_264296300;
  void v7[4] = v5;
  char v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __35__BBServer__loadSystemCapabilities__block_invoke_288(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAnnounceSupportedForHeadphones:*(unsigned __int8 *)(a1 + 40)];
}

void __35__BBServer__loadSystemCapabilities__block_invoke_290(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = a2 & 1;
  uint64_t v4 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = v3;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Fetched value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(NSObject **)(v5 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__BBServer__loadSystemCapabilities__block_invoke_291;
  v7[3] = &unk_264296300;
  void v7[4] = v5;
  char v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __35__BBServer__loadSystemCapabilities__block_invoke_291(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAnnounceSupportedForCarPlay:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_loadDataProvidersAndSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(BBServer *)self _loadSystemCapabilities];
  [(BBServer *)self _ensureDataDirectoryExists];
  +[BBPersistentStoreMigrator migrateSectionInfoForStore:self->_persistentStore];
  [(BBServer *)self _migrateGlobalAnnounceSettingIfNeeded];
  int v3 = BBShouldPerformMigration();
  [(BBServer *)self _loadSavedSectionInfo];
  [(BBServer *)self _loadClearedSections];
  if (v3)
  {
    [(BBServer *)self _migrateLoadedData];
    [(BBDataProviderManager *)self->_dataProviderManager loadAllDataProvidersAndPerformMigration:1];
    [(BBServer *)self _writeClearedSections];
    BBNoteMigrationComplete();
  }
  else
  {
    [(BBDataProviderManager *)self->_dataProviderManager loadAllDataProvidersAndPerformMigration:0];
  }
  self->_isRunning = 1;
  uint64_t v4 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Up and running!", buf, 2u);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__BBServer__loadDataProvidersAndSettings__block_invoke;
  v5[3] = &unk_264295E28;
  v5[4] = self;
  [(BBServer *)self _resumeAllSuspendedConnectionsWithCompletionHandler:v5];
  [(BBServer *)self _observeManagedProfileChanges];
  [(BBServer *)self _updateAnnounceControlCenterModuleAvailability];
}

uint64_t __41__BBServer__loadDataProvidersAndSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishBulletinsForAllDataProviders];
}

- (void)_publishBulletinsForAllDataProviders
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dataProviderManager = self->_dataProviderManager;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__BBServer__publishBulletinsForAllDataProviders__block_invoke;
  v4[3] = &unk_264296860;
  v4[4] = self;
  [(BBDataProviderManager *)dataProviderManager performBlockOnDataProviders:v4];
}

void __48__BBServer__publishBulletinsForAllDataProviders__block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _updateSectionParametersForDataProvider:v4];
  [*(id *)(a1 + 32) _updateAllBulletinsForDataProviderIfSectionIsEnabled:v4];
}

- (BOOL)_verifyBulletinRequest:(id)a3 forDataProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  BOOL v7 = [v6 sectionIdentifier];
  [v5 setSectionID:v7];

  char v8 = [v6 sectionBundlePath];
  [v5 setSectionBundlePath:v8];

  int v9 = [v6 universalSectionIdentifier];
  [v5 setUniversalSectionID:v9];

  int v10 = [v6 parentSectionIdentifier];
  [v5 setParentSectionID:v10];

  [v5 setBulletinID:0];
  uint64_t v11 = [v5 sectionID];
  if (!v11) {
    goto LABEL_11;
  }
  id v12 = (void *)v11;
  BOOL v13 = [v5 publisherMatchID];

  if (v13)
  {
    BOOL v14 = 1;
  }
  else
  {
LABEL_11:
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[BBServer _verifyBulletinRequest:forDataProvider:]();
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_enabledSectionIDsForDataProvider:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  if (v4)
  {
    id v6 = (void *)MEMORY[0x21D44A020]();
    BOOL v7 = [v4 sectionIdentifier];
    char v8 = [(BBServer *)self _sectionInfoForSectionID:v7 effective:1];
    if ([v8 notificationCenterSetting] == 2) {
      [v5 addObject:v7];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v9 = objc_msgSend(v8, "subsections", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 notificationCenterSetting] == 2)
          {
            long long v15 = [v14 subsectionID];
            [v5 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }

  return v5;
}

- (void)_updateBulletinsInFeed:(unint64_t)a3 ifSectionIsEnabled:(id)a4
{
  id v6 = [(BBServer *)self dataProviderForSectionID:a4];
  [(BBServer *)self _updateBulletinsInFeed:a3 forDataProviderIfSectionIsEnabled:v6];
}

- (void)_updateBulletinsInFeed:(unint64_t)a3 forDataProviderIfSectionIsEnabled:(id)a4
{
  id v7 = a4;
  id v6 = -[BBServer _enabledSectionIDsForDataProvider:](self, "_enabledSectionIDsForDataProvider:");
  if ([v6 count]) {
    [(BBServer *)self _updateBulletinsInFeed:a3 forDataProvider:v7 enabledSectionIDs:v6];
  }
}

- (void)_updateAllBulletinsForDataProviderIfSectionIsEnabled:(id)a3
{
}

- (id)_sinceDate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_expirationReferenceComponents)
  {
    int v3 = [MEMORY[0x263EFF8F0] currentCalendar];
    expirationReferenceComponents = self->_expirationReferenceComponents;
    id v5 = [MEMORY[0x263EFF910] date];
    id v6 = [v3 dateByAddingComponents:expirationReferenceComponents toDate:v5 options:0];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)_updateBulletinsInFeed:(unint64_t)a3 forDataProvider:(id)a4 enabledSectionIDs:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v26 = 0;
  if (!BBPublisherDestinationForObserverFeed(a3, &v26))
  {
    long long v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BBServer.m", 3768, @"Invalid parameter not satisfying: %@", @"foundValidDestination" object file lineNumber description];
  }
  uint64_t v11 = [v9 sectionIdentifier];
  uint64_t v12 = (void *)BBLogGeneral;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = v12;
      BOOL v14 = [v9 sectionIdentifier];
      *(_DWORD *)buf = 138543618;
      long long v28 = v14;
      __int16 v29 = 2048;
      unint64_t v30 = a3;
      _os_log_impl(&dword_217675000, v13, OS_LOG_TYPE_DEFAULT, "BBServer: Update bulletins in section %{public}@ for feed %ld", buf, 0x16u);
    }
    uint64_t v15 = v26;
    id v16 = [(BBServer *)self _sinceDate];
    long long v17 = +[BBBulletinRequestParameters requestParametersForDestination:v15 withSinceDate:v16 maximumCount:500 enabledSectionIDs:v10];

    if (![v10 count])
    {
      long long v18 = (void *)BBLogGeneral;
      if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[BBServer _updateBulletinsInFeed:forDataProvider:enabledSectionIDs:](v18, self, (uint64_t)v11);
      }
    }
    long long v19 = [(BBServer *)self _clearedInfoForSectionID:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    _DWORD v21[2] = __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke;
    v21[3] = &unk_2642968B0;
    unint64_t v25 = a3;
    id v22 = v9;
    __int16 v23 = self;
    id v24 = v11;
    [v22 bulletinsWithRequestParameters:v17 lastCleared:v19 completion:v21];
  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[BBServer _updateBulletinsInFeed:forDataProvider:enabledSectionIDs:]();
  }
}

void __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 sectionIdentifier];
    uint64_t v8 = [v3 count];
    uint64_t v9 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    __int16 v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v8;
    __int16 v35 = 2048;
    uint64_t v36 = v9;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "BBServer: Section %{public}@ responded with %ld bulletin requests to feed %ld", buf, 0x20u);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  void v28[2] = __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke_313;
  v28[3] = &unk_264296888;
  int8x16_t v22 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v22.i64[0];
  int8x16_t v29 = vextq_s8(v22, v22, 8uLL);
  uint64_t v11 = [v3 objectsPassingTest:v28];

  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v25;
    *(void *)&long long v16 = 138412546;
    long long v23 = v16;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v14);
        }
        long long v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v21 = objc_msgSend(v20, "publisherMatchID", v23, (void)v24);
        if ([v13 containsObject:v21]) {
          BBIsInternalDevice();
        }
        [v12 addObject:v20];
        [v13 addObject:v21];
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v17);
  }

  [*(id *)(a1 + 40) updateSection:*(void *)(a1 + 48) inFeed:*(void *)(a1 + 56) withBulletinRequests:v12];
  [*(id *)(a1 + 40) _sendBulletinsLoadedForSectionID:*(void *)(a1 + 48)];
}

uint64_t __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke_313(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _verifyBulletinRequest:a2 forDataProvider:*(void *)(a1 + 40)];
}

- (void)_updateAllBulletinsForDataProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(BBServer *)self _enabledSectionIDsForDataProvider:v4];
  [(BBServer *)self _updateBulletinsInFeed:1 forDataProvider:v4 enabledSectionIDs:v5];
}

- (void)_reloadSectionParametersForSectionID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  dataProviderManager = self->_dataProviderManager;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BBServer__reloadSectionParametersForSectionID___block_invoke;
  v7[3] = &unk_264296860;
  void v7[4] = self;
  [(BBDataProviderManager *)dataProviderManager reloadIdentityForSectionID:v5 withCompletion:v7];
}

uint64_t __49__BBServer__reloadSectionParametersForSectionID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateSectionParametersForDataProvider:a2];
}

- (void)_updateSectionParametersForDataProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 sectionIdentifier];
  id v6 = [v4 sectionParameters];
  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_observers;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "updateSectionParameters:forSectionID:", v6, v5, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_reloadReloadSectionInfoForSectionID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dataProviderManager = self->_dataProviderManager;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BBServer__reloadReloadSectionInfoForSectionID___block_invoke;
  v7[3] = &unk_264296700;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BBDataProviderManager *)dataProviderManager reloadIdentityForSectionID:v6 withCompletion:v7];
}

void __49__BBServer__reloadReloadSectionInfoForSectionID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 _sectionInfoForSectionID:v4 effective:0];
  id v8 = (id)[v6 copy];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 56) rebuildSectionInfo:v8 forSectionID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setSectionInfo:v7 forSectionID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateSectionParametersForDataProvider:v5];
  [*(id *)(a1 + 32) _updateAllBulletinsForDataProviderIfSectionIsEnabled:v5];
}

- (void)_publishBulletinRequest:(id)a3 forSectionID:(id)a4 forDestinations:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(BBServer *)self dataProviderForSectionID:v9];
  if (v10)
  {
    if ([(BBServer *)self _verifyBulletinRequest:v8 forDataProvider:v10]) {
      [(BBServer *)self publishBulletinRequest:v8 destinations:a5];
    }
  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[BBServer _publishBulletinRequest:forSectionID:forDestinations:]();
  }
}

- (unint64_t)_filtersForSectionID:(id)a3
{
  return 0;
}

- (id)_clearedInfoForSectionID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore clearedInfoForSectionID:v5];

  return v6;
}

- (void)_setClearedInfo:(id)a3 forSectionID:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  [(BBSectionInfoStoreInterface *)self->_sectionInfoStore setClearedInfo:v8 forSectionID:v7];

  if (![(BBServer *)self _shouldUseUNSSettings])
  {
    [(BBServer *)self _writeClearedSections];
  }
}

- (void)_updateClearedInfoForSectionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBServer *)self _clearedInfoForSectionID:v6];
  id v9 = [(BBServer *)self dataProviderForSectionID:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __51__BBServer__updateClearedInfoForSectionID_handler___block_invoke;
  v11[3] = &unk_264296520;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 updateClearedInfoWithClearedInfo:v8 handler:v7 completion:v11];
}

uint64_t __51__BBServer__updateClearedInfoForSectionID_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _saveUpdatedClearedInfo:a2 forSectionID:*(void *)(a1 + 40)];
}

- (void)_saveUpdatedSectionInfo:(id)a3 forSectionID:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(BBServer *)self _setSectionInfo:v6 forSectionID:v7];
  }
  else
  {
    id v8 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Not updating section info for <%{public}@>", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_updateSectionInfoForSectionID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BBServer *)self _sectionInfoForSectionID:v6 effective:0];
  int v9 = (void *)[v8 copy];

  id v10 = [(BBServer *)self dataProviderForSectionID:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__BBServer__updateSectionInfoForSectionID_handler___block_invoke;
  v12[3] = &unk_2642968D8;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 updateSectionInfoWithSectionInfo:v9 handler:v7 completion:v12];
}

uint64_t __51__BBServer__updateSectionInfoForSectionID_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _saveUpdatedSectionInfo:a2 forSectionID:*(void *)(a1 + 40)];
}

- (id)dataProviderForSectionID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(BBDataProviderManager *)self->_dataProviderManager dataProviderForSectionID:v5];

  return v6;
}

- (id)dpManager:(id)a3 sectionInfoForSectionID:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = [(BBServer *)self _sectionInfoForSectionID:v6 effective:0];

  return v7;
}

- (void)dpManager:(id)a3 addDataProvider:(id)a4 withSectionInfo:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v11 parentSectionIdentifier];
  if (v8)
  {
    int v9 = [(BBServer *)self _sectionInfoForSectionID:v8];
    [v9 _associateDataProviderSectionInfo:v7];
  }
  id v10 = [v11 sectionIdentifier];
  if (([v7 suppressFromSettings] & 1) == 0) {
    [v7 queryAndUseManagedSettingsForSectionID:v10];
  }
  if ([(BBMuteExpirationManager *)self->_muteManager cleanAndWatchExpirationsForSectionInfo:v7])
  {
    [(BBServer *)self _writeSectionInfo];
  }
  [(BBServer *)self _setPrimitiveSectionInfo:v7 forSectionID:v10];
  [(BBServer *)self _addActiveSectionID:v10];
  if ([(BBServer *)self isRunning])
  {
    [(BBServer *)self _updateSectionParametersForDataProvider:v11];
    [(BBServer *)self _sendUpdateSectionInfo:v7];
    [(BBServer *)self _updateAllBulletinsForDataProviderIfSectionIsEnabled:v11];
  }
}

- (void)dpManager:(id)a3 addParentSectionFactory:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v7 sectionIdentifier];
  if (v5)
  {
    id v6 = [v7 sectionInfo];
    [v6 queryAndUseManagedSettingsForSectionID:v5];
    if ([(BBMuteExpirationManager *)self->_muteManager cleanAndWatchExpirationsForSectionInfo:v6])
    {
      [(BBServer *)self _writeSectionInfo];
    }
    [(BBServer *)self _setPrimitiveSectionInfo:v6 forSectionID:v5];
    [(BBServer *)self _addActiveSectionID:v5];
    if ([(BBServer *)self isRunning]) {
      [(BBServer *)self _sendUpdateSectionInfo:v6];
    }
  }
}

- (void)dpManager:(id)a3 removeDataProviderSectionID:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  [(BBServer *)self _removeSection:v6];
}

- (void)_addActiveSectionID:(id)a3
{
  if (a3)
  {
    sectionInfoStore = self->_sectionInfoStore;
    id v5 = a3;
    [(BBSectionInfoStoreInterface *)sectionInfoStore addActiveSectionID:v5];
    [(NSMutableSet *)self->_activeSectionIDs addObject:v5];
  }
}

- (id)_bulletinsForSectionID:(id)a3 inFeeds:(unint64_t)a4
{
  id v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = a3;
  id v7 = [v5 set];
  id v8 = [(BBServer *)self bulletinIDsForSectionID:v6 inFeed:1];

  int v9 = [(BBServer *)self _bulletinsForIDs:v8];
  [v7 unionSet:v9];

  return v7;
}

+ (id)_dataDirectoryPath
{
  return (id)[@"~/Library/BulletinBoard/" stringByExpandingTildeInPath];
}

- (void)_ensureDataDirectoryExists
{
  id v3 = [(id)objc_opt_class() _dataDirectoryPath];
  id v2 = [MEMORY[0x263F08850] defaultManager];
  if (([v2 fileExistsAtPath:v3] & 1) == 0) {
    [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (id)savedClearedSections
{
  return (id)[(BBPersistentStoreInterface *)self->_persistentStore readClearedSections];
}

- (void)writeClearedSections:(id)a3
{
}

- (void)_loadClearedSections
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(BBServer *)self savedClearedSections];
  id v5 = (id)[v3 mutableCopy];

  id v4 = v5;
  if (!v5) {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v6 = v4;
  [(BBSectionInfoStoreInterface *)self->_sectionInfoStore setClearedSectionsByID:v4];
}

- (void)_writeClearedSections
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore clearedSectionsByID];
  [(BBServer *)self writeClearedSections:v3];
}

- (id)savedOrderDictionary
{
  return (id)[(BBPersistentStoreInterface *)self->_persistentStore readSectionOrder];
}

- (void)writeOrderDictionary:(id)a3
{
}

- (id)savedSectionInfo
{
  id v2 = [(BBPersistentStoreInterface *)self->_persistentStore readSectionInfo];
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (void)writeSectionInfo:(id)a3 withVersionNumber:(unint64_t)a4
{
}

- (void)writeSectionInfo:(id)a3
{
}

- (void)_loadSavedSectionInfo
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(BBServer *)self savedSectionInfo];
  [(BBSectionInfoStoreInterface *)self->_sectionInfoStore setSectionInfoByID:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(BBServer *)self _allSectionInfoIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [(BBServer *)self _sectionInfoForSectionID:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v9 queryAndUseManagedSettings];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_writeSectionInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(BBSectionInfoStoreInterface *)self->_sectionInfoStore sectionInfoByID];
  [(BBServer *)self writeSectionInfo:v3];
}

- (BOOL)_deviceSupportsFavorites
{
  return MEMORY[0x270F95FB8](@"telephony", a2);
}

- (void)_observeManagedProfileChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F53B60];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)BBManagedUserNotificationsSetttingsDidChangeHandler, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unobserveManagedProfileChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F53B60];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
}

- (void)_queue_managedUserNotificationsSetttingsDidChange
{
  id v2 = self;
  uint64_t v52 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Managed profile was changed", buf, 2u);
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v5 = [(BBSectionInfoStoreInterface *)v2->_sectionInfoStore allSortedSectionInfo:0];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v10 usesManagedSettings])
        {
          long long v11 = [v10 sectionID];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v7);
  }

  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v13 = [MEMORY[0x263F53C50] sharedConnection];
  long long v14 = [v13 restrictionEnforcedNotificationSettings];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    uint64_t v18 = *MEMORY[0x263F53DF8];
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v20 = [*(id *)(*((void *)&v40 + 1) + 8 * j) objectForKey:v18];
        if (v20) {
          [v12 addObject:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v16);
  }

  id v21 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v34 = v4;
  [v21 unionSet:v4];
  [v21 unionSet:v12];
  __int16 v33 = v21;
  int8x16_t v22 = [(BBSectionInfoStoreInterface *)v2->_sectionInfoStore sectionInfosByIDForSectionIDs:v21 effective:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v22 allKeys];
  uint64_t v23 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * v26);
        long long v28 = [v22 objectForKey:v27];
        if (v28)
        {
          if (([v12 containsObject:v27] & 1) != 0
            || ([v28 sectionInfoSettings],
                int8x16_t v29 = v2,
                unint64_t v30 = objc_claimAutoreleasedReturnValue(),
                uint64_t v31 = [v30 authorizationStatus],
                v30,
                id v2 = v29,
                v31))
          {
            [(BBServer *)v2 _setSectionInfoNoteSettingsChanged:v28 forSectionID:v27];
          }
          else
          {
            [(BBServer *)v29 _removeSection:v27];
          }
        }

        ++v26;
      }
      while (v24 != v26);
      uint64_t v32 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
      uint64_t v24 = v32;
    }
    while (v32);
  }

  [(BBServer *)v2 _writeSectionInfo];
}

- (void)noteChangeOfState:(unint64_t)a3 newValue:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BBServer_noteChangeOfState_newValue___block_invoke;
  block[3] = &unk_2642967A0;
  BOOL v6 = a4;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __39__BBServer_noteChangeOfState_newValue___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(result + 48)) {
    uint64_t v3 = *(void *)(v2 + 24) | v1;
  }
  else {
    uint64_t v3 = *(void *)(v2 + 24) & ~v1;
  }
  *(void *)(v2 + 24) = v3;
  return result;
}

- (void)noteOccurrenceOfEvent:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__BBServer_noteOccurrenceOfEvent___block_invoke;
  v4[3] = &unk_264296080;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __34__BBServer_noteOccurrenceOfEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _expireBulletinsDueToSystemEvent:*(void *)(a1 + 40)];
}

- (void)syncService:(id)a3 receivedDismissalDictionaries:(id)a4 dismissalIDs:(id)a5 inSection:(id)a6 universalSectionID:(id)a7 forFeeds:(unint64_t)a8
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v17 = [MEMORY[0x263EFF9C0] set];
  objc_msgSend(v17, "bs_safeAddObject:", v15);
  if (v16)
  {
    uint64_t v18 = [(BBServer *)self sectionIDsForUniversalSectionID:v16];
    long long v19 = [v18 allObjects];
    [v17 addObjectsFromArray:v19];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v17;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[BBServer handleDismissalDictionaries:dismissalIDs:inSection:forFeeds:](self, "handleDismissalDictionaries:dismissalIDs:inSection:forFeeds:", v13, v14, *(void *)(*((void *)&v25 + 1) + 8 * v24++), a8, (void)v25);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }
}

- (void)handleDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 inSection:(id)a5 forFeeds:(unint64_t)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v43 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v11 = [(BBServer *)self dataProviderForSectionID:v10];
  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_bulletinIDsBySectionID objectForKey:v10];
    if (v12)
    {
      __int16 v35 = v11;
      unint64_t v36 = a6;
      id v37 = v10;
      long long v46 = [MEMORY[0x263EFF9C0] setWithArray:v43];
      id v13 = [MEMORY[0x263EFF9C0] setWithArray:v41];
      id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v34 = v12;
      id obj = v12;
      uint64_t v44 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v44)
      {
        uint64_t v42 = *(void *)v57;
        long long v39 = self;
        long long v40 = v13;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v57 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v47 = *(void *)(*((void *)&v56 + 1) + 8 * i);
            id v16 = [(NSMutableDictionary *)self->_bulletinsByID objectForKey:v34];
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v17 = v43;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
            if (!v18)
            {

LABEL_20:
              long long v50 = 0u;
              long long v51 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              id v27 = v41;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v49;
                do
                {
                  for (uint64_t j = 0; j != v29; ++j)
                  {
                    if (*(void *)v49 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    uint64_t v32 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                    if (BBDismissalSyncDictionaryMatchesBulletin(v32, v16))
                    {
                      [v13 removeObject:v32];
                      [v14 addObject:v47];
                    }
                  }
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
                }
                while (v29);
              }

              goto LABEL_30;
            }
            uint64_t v19 = v18;
            uint64_t v45 = i;
            id v20 = v14;
            char v21 = 0;
            uint64_t v22 = *(void *)v53;
            do
            {
              for (uint64_t k = 0; k != v19; ++k)
              {
                if (*(void *)v53 != v22) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v24 = *(void *)(*((void *)&v52 + 1) + 8 * k);
                long long v25 = [v16 dismissalID];
                int v26 = [v25 isEqualToString:v24];

                if (v26)
                {
                  [v20 addObject:v47];
                  [v46 removeObject:v24];
                  char v21 = 1;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
            }
            while (v19);

            self = v39;
            id v13 = v40;
            id v14 = v20;
            uint64_t i = v45;
            if ((v21 & 1) == 0) {
              goto LABEL_20;
            }
LABEL_30:
          }
          uint64_t v44 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
        }
        while (v44);
      }

      id v10 = v37;
      [(BBDismissalSyncCache *)self->_dismissalSyncCache cacheDismissalDictionaries:v41 dismissalIDs:v43 inSection:v37 forFeeds:v36];
      if (v36 != 65023 && v36)
      {
        __int16 v33 = [(BBServer *)self _bulletinsForIDs:v14];
        [(BBServer *)self _sendRemoveBulletins:v33 toFeeds:v36 shouldSync:0];
      }
      else
      {
        -[BBServer _clearBulletinIDs:forSectionID:shouldSync:](self, "_clearBulletinIDs:forSectionID:shouldSync:", v14, v37, 0, v34);
      }
      id v12 = v34;
      long long v11 = v35;
      objc_msgSend(v14, "count", v34);
      ADClientAddValueForScalarKey();
      if ([v13 count] || objc_msgSend(v46, "count")) {
        ADClientAddValueForScalarKey();
      }
    }
    else
    {
      [(BBDismissalSyncCache *)self->_dismissalSyncCache cacheDismissalDictionaries:v41 dismissalIDs:v43 inSection:v10 forFeeds:a6];
      ADClientAddValueForScalarKey();
      ADClientAddValueForScalarKey();
    }
  }
  else
  {
    ADClientAddValueForScalarKey();
    ADClientAddValueForScalarKey();
  }
}

- (id)syncService:(id)a3 universalSectionIdentifierForSectionIdentifier:(id)a4
{
  return [(BBServer *)self universalSectionIDForSectionID:a4];
}

- (void)didChangeEffectiveAuthorizationStatusForSectionID:(id)a3
{
  id v4 = [(BBServer *)self _sectionInfoForSectionID:a3];
  [(BBServer *)self _sendUpdateSectionInfo:v4];
}

- (void)didChangeMuteAssertionForSectionID:(id)a3
{
  uint64_t v4 = [(BBServer *)self _sectionInfoForSectionID:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    if ([(BBMuteExpirationManager *)self->_muteManager cleanAndWatchExpirationsForSectionInfo:v4])
    {
      [(BBServer *)self _writeSectionInfo];
      [(BBServer *)self _sendUpdateSectionInfo:v5];
    }
  }
  MEMORY[0x270F9A758]();
}

+ (unint64_t)pairedDeviceCount
{
  return [(id)__server _pairedDeviceCount];
}

- (unint64_t)_pairedDeviceCount
{
  return [(BBSyncServiceInterface *)self->_syncService pairedDeviceCount];
}

+ (id)savedChronologicalSectionOrder
{
  uint64_t v2 = [a1 _persistentSettingsStore];
  uint64_t v3 = [v2 readSectionOrder];
  uint64_t v4 = [v3 objectForKey:@"BBSectionOrderChronologicalIDs"];

  return v4;
}

+ (id)savedSectionInfo
{
  uint64_t v2 = [a1 _persistentSettingsStore];
  uint64_t v3 = [v2 readSectionInfo];
  uint64_t v4 = (void *)[v3 mutableCopy];

  return v4;
}

+ (void)removeSavedChronologicalSectionInfo:(id)a3
{
  id v5 = (id)[a3 mutableCopy];
  if (+[BBPersistentStoreMigrator removeSavedChronologicalSectionInfos:](BBPersistentStoreMigrator, "removeSavedChronologicalSectionInfos:"))
  {
    uint64_t v4 = [a1 _persistentSettingsStore];
    [v4 writeSectionInfo:v5];
  }
}

- (void)protectionStateChangedForBundleIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__BBServer_protectionStateChangedForBundleIdentifiers___block_invoke;
  v7[3] = &unk_264295E50;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__BBServer_protectionStateChangedForBundleIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 216), "sectionInfoForSectionID:effective:", v7, 1, (void)v14);
        if ([*(id *)(*(void *)(a1 + 40) + 296) isApplicationLocked:v7])
        {
          int v9 = v8;
          uint64_t v10 = 3;
LABEL_10:
          [v9 setContentPreviewSetting:v10];
          [*(id *)(a1 + 40) _setSectionInfo:v8 forSectionID:v7];
          goto LABEL_12;
        }
        if ([v8 contentPreviewSetting] == 3)
        {
          int v9 = v8;
          uint64_t v10 = 0;
          goto LABEL_10;
        }
        [*(id *)(a1 + 40) _sendUpdateSectionInfo:v8];
LABEL_12:
        int v11 = [*(id *)(*(void *)(a1 + 40) + 296) isApplicationHidden:v7];
        id v12 = *(void **)(a1 + 40);
        if (v11)
        {
          [*(id *)(a1 + 40) _clearSection:v7];
        }
        else
        {
          id v13 = [*(id *)(a1 + 40) dataProviderForSectionID:v7];
          [v12 _updateAllBulletinsForDataProviderIfSectionIsEnabled:v13];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (id)_appProtectionMonitor
{
  return self->_appProtectionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForCarPlay, 0);
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForHeadphones, 0);
  objc_storeStrong((id *)&self->_appProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_muteManager, 0);
  objc_storeStrong((id *)&self->_sectionAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_dismissalSyncCache, 0);
  objc_storeStrong((id *)&self->_suspendedConnections, 0);
  objc_storeStrong((id *)&self->_settingsListener, 0);
  objc_storeStrong((id *)&self->_conduitListener, 0);
  objc_storeStrong((id *)&self->_observerListener, 0);
  objc_storeStrong((id *)&self->_activeSectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionInfoStore, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_expirationReferenceComponents, 0);
  objc_storeStrong((id *)&self->_defaultExpirationComponents, 0);
  objc_storeStrong((id *)&self->_nextScheduledExpirationTimerFireDate, 0);
  objc_storeStrong((id *)&self->_eventBasedExpiringBulletinIDs, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_expiringBulletinIDs, 0);
  objc_storeStrong((id *)&self->_noticeBulletinIDsBySectionID, 0);
  objc_storeStrong((id *)&self->_bulletinIDsBySectionID, 0);
  objc_storeStrong((id *)&self->_bulletinsByID, 0);
  objc_storeStrong((id *)&self->_settingsGatewayConnections, 0);
  objc_storeStrong((id *)&self->_pendingUpdatesByBulletinID, 0);
  objc_storeStrong((id *)&self->_observerGatewayEnumerators, 0);
  objc_storeStrong((id *)&self->_observerGatewaysByName, 0);
  objc_storeStrong((id *)&self->_observerGateways, 0);
  objc_storeStrong((id *)&self->_observerFeedSet, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataProviderManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sectionInfoByID, 0);
  objc_storeStrong((id *)&self->_bulletinRequestsByID, 0);
}

- (void)noteFinishedWithBulletinID:(id)a3
{
}

- (void)deliverResponse:(id)a3 withCompletion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v13 bulletinID];
  id v8 = [(NSMutableDictionary *)self->_bulletinRequestsByID objectForKey:v7];
  int v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 sectionID];
    int v11 = [(BBServer *)self dataProviderForSectionID:v10];

    if (v11)
    {
      [v11 deliverResponse:v13 forBulletinRequest:v9 withCompletion:v6];
    }
    else
    {
      id v12 = [v9 sectionID];
      NSLog(&cfstr_BbserverDelive_0.isa, v12);
    }
  }
  else
  {
    NSLog(&cfstr_BbserverDelive.isa, v7);
  }
}

- (void)_updateShowsMessagePreviewForBulletin:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = objc_msgSend(v4, "sectionID", 0);
  id v6 = [(BBServer *)self _sectionInfoForSectionID:v5 effective:1];
  uint64_t v7 = [(BBServer *)self _applicableSectionInfosForBulletin:v4 inSection:v6];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v10)
        {
          uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) subsectionPriority];
          if (v14 <= [v10 subsectionPriority]) {
            continue;
          }
        }
        id v15 = v13;

        uint64_t v10 = v15;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  if ([v10 contentPreviewSetting]) {
    uint64_t v16 = [v10 contentPreviewSetting];
  }
  else {
    uint64_t v16 = [(BBServer *)self _effectiveGlobalContentPreviewsSetting];
  }
  [v4 setContentPreviewSetting:v16];
}

- (void)_updateInterruptionLevelForBulletin:(id)a3
{
  id v8 = a3;
  id v4 = [v8 sectionID];
  uint64_t v5 = [(BBServer *)self _sectionInfoForSectionID:v4 effective:1];

  uint64_t v6 = [v8 interruptionLevel];
  if (v6 == 2) {
    goto LABEL_5;
  }
  uint64_t v7 = v6;
  if (v6 != 3) {
    goto LABEL_8;
  }
  if ([v5 criticalAlertSetting] != 2)
  {
LABEL_5:
    if ([v5 timeSensitiveSetting] == 2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 3;
  }
LABEL_8:
  [v8 setInterruptionLevel:v7];
}

- (void)publishBulletinRequest:(id)a3 destinations:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 bulletinID];

  if (!v7) {
    [(BBServer *)self _assignIDToBulletinRequest:v6];
  }
  id v8 = [v6 sectionID];
  uint64_t v9 = [v6 bulletinID];
  [(BBServer *)self _updateShowsMessagePreviewForBulletin:v6];
  [(BBServer *)self _updateInterruptionLevelForBulletin:v6];
  uint64_t v10 = [(NSMutableDictionary *)self->_bulletinRequestsByID objectForKey:v9];
  uint64_t v11 = [(BBServer *)self _appProtectionMonitor];
  char v12 = [v11 isApplicationHidden:v8];

  if ((v12 & 1) == 0)
  {
    if (!v10)
    {
      int v13 = a4 != 0;
      if ((a4 & 0x4C) == 0) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    int v30 = [v6 hasContentModificationsRelativeTo:v10];
    if ((a4 & 2) != 0)
    {
      uint64_t v16 = [(BBServer *)self noticesBulletinIDsForSectionID:v8];
      int v29 = [v16 containsObject:v9] ^ 1;

      if ((a4 & 0x40) != 0) {
        goto LABEL_9;
      }
    }
    else
    {
      int v29 = 0;
      if ((a4 & 0x40) != 0)
      {
LABEL_9:
        uint64_t v14 = [(BBServer *)self carBulletinIDsForSectionID:v8];
        int v15 = [v14 containsObject:v9] ^ 1;

        goto LABEL_14;
      }
    }
    int v15 = 0;
LABEL_14:
    int v17 = v30;
    if ((a4 & 0x4C) != 0) {
      int v17 = 1;
    }
    int v18 = v17 | v29;
    if (a4 == 1) {
      int v18 = 1;
    }
    int v13 = v18 | v15;
    if ((a4 & 0x4C) == 0) {
      goto LABEL_20;
    }
LABEL_19:
    long long v19 = [MEMORY[0x263EFF910] date];
    [v6 setLastInterruptDate:v19];

LABEL_23:
    char v21 = [MEMORY[0x263EFF910] date];
    [v6 setPublicationDate:v21];

    goto LABEL_24;
  }
  int v13 = 0;
  if ((a4 & 0x4C) != 0) {
    goto LABEL_19;
  }
LABEL_20:
  if (v10)
  {
    long long v20 = [v10 lastInterruptDate];
    [v6 setLastInterruptDate:v20];
  }
LABEL_22:
  if (a4) {
    goto LABEL_23;
  }
LABEL_24:
  if ((v13 & 1) != 0 || v10)
  {
    uint64_t v22 = (void *)[v6 copy];
    [(NSMutableDictionary *)self->_bulletinRequestsByID setObject:v22 forKey:v9];
  }
  if (v13)
  {
    [(BBServer *)self _validateExpirationDateForBulletinRequest:v6];
    uint64_t v23 = (void *)BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = v23;
      long long v25 = [v6 subsectionIDs];
      int v26 = [v6 bulletinID];
      id v27 = [v6 expirationDate];
      *(_DWORD *)buf = 138544386;
      uint64_t v32 = v8;
      __int16 v33 = 2112;
      uint64_t v34 = v25;
      __int16 v35 = 2114;
      unint64_t v36 = v26;
      __int16 v37 = 2114;
      long long v38 = v27;
      __int16 v39 = 2048;
      uint64_t v40 = [v6 expirationEvents];
      _os_log_impl(&dword_217675000, v24, OS_LOG_TYPE_DEFAULT, "Publishing bulletin for section <%{public}@>: subsectionIDs: %{%@}@, bulletinID = <%{public}@>, expiration date = <%{public}@>, expiration events <%ld>", buf, 0x34u);
    }
    uint64_t v28 = +[BBBulletin bulletinWithBulletin:v6];
    [(BBServer *)self publishBulletin:v28 destinations:a4];
  }
}

- (void)updateSection:(id)a3 inFeed:(unint64_t)a4 withBulletinRequests:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v48 = a5;
  uint64_t v7 = (void *)BBLogSectionUpdates;
  if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)buf = 138543618;
    uint64_t v66 = (uint64_t)v6;
    __int16 v67 = 2048;
    uint64_t v68 = [v48 count];
    _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Updating section %{public}@ with %ld new bulletins", buf, 0x16u);
  }
  id v46 = v6;
  id v43 = [(BBServer *)self bulletinIDsForSectionID:v6 inFeed:a4];
  uint64_t v9 = -[BBServer _bulletinRequestsForIDs:](self, "_bulletinRequestsForIDs:");
  uint64_t v10 = (void *)BBLogSectionUpdates;
  if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    uint64_t v12 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v66 = v12;
    _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "Current bulletins in this section: %ld", buf, 0xCu);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v47 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v59 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        int v17 = [v16 publisherMatchID];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v18 = v48;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v55;
          while (2)
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v55 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = [*(id *)(*((void *)&v54 + 1) + 8 * j) publisherMatchID];
              char v24 = [v17 isEqualToString:v23];

              if (v24)
              {

                goto LABEL_22;
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v54 objects:v63 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        long long v25 = (void *)MEMORY[0x21D44A020]();
        int v26 = (void *)BBLogSectionUpdates;
        if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = v26;
          uint64_t v28 = [(BBServer *)self bulletinIDsForSectionID:v46 inFeed:a4];
          uint64_t v29 = [v28 count];
          *(_DWORD *)buf = 138412546;
          uint64_t v66 = (uint64_t)v16;
          __int16 v67 = 2048;
          uint64_t v68 = v29;
          _os_log_impl(&dword_217675000, v27, OS_LOG_TYPE_DEFAULT, "Removing old bulletin: %@\n%ld bulletins remain", buf, 0x16u);
        }
        int v30 = [v16 bulletinID];
        [(BBServer *)self removeBulletinID:v30 fromSection:v46 inFeed:(8 * (a4 & 1)) | a4];

LABEL_22:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v14);
  }

  uint64_t v31 = v46;
  uint64_t v32 = [(BBServer *)self allBulletinIDsForSectionID:v46];
  __int16 v33 = [(BBServer *)self _bulletinRequestsForIDs:v32];

  if (a4 == 1)
  {
    uint64_t v34 = [v48 allObjects];
    __int16 v35 = [v34 sortedArrayUsingComparator:&__block_literal_global_10];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v51 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v50 + 1) + 8 * k);
          uint64_t v42 = (void *)MEMORY[0x21D44A020]();
          [(BBServer *)self _assignIDToBulletinRequest:v41 checkAgainstBulletins:v33];
          [(BBServer *)self publishBulletinRequest:v41 destinations:2];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v38);
    }

    uint64_t v31 = v46;
  }
}

uint64_t __67__BBServer_Publication__updateSection_inFeed_withBulletinRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)withdrawBulletinRequestsWithRecordID:(id)a3 forSectionID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(BBServer *)self allBulletinIDsForSectionID:a4];
  id v8 = [(BBServer *)self _bulletinRequestsForIDs:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v15 = objc_msgSend(v14, "recordID", (void)v18);
        int v16 = [v6 isEqualToString:v15];

        if (v16)
        {
          int v17 = [v14 bulletinID];
          [(BBServer *)self withdrawBulletinID:v17 shouldSync:1];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)withdrawBulletinRequestsWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4 forSectionID:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(BBServer *)self allBulletinIDsForSectionID:a5];
  uint64_t v10 = [(BBServer *)self _bulletinRequestsForIDs:v9];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v17 = objc_msgSend(v16, "publisherBulletinID", (void)v20);
        int v18 = [v8 isEqualToString:v17];

        if (v18)
        {
          long long v19 = [v16 bulletinID];
          [(BBServer *)self withdrawBulletinID:v19 shouldSync:v6];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

- (id)_bulletinRequestsForIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[NSMutableDictionary objectForKey:](self->_bulletinRequestsByID, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_assignIDToBulletinRequest:(id)a3
{
  id v4 = a3;
  id v7 = [v4 sectionID];
  uint64_t v5 = [(BBServer *)self allBulletinIDsForSectionID:v7];
  id v6 = [(BBServer *)self _bulletinRequestsForIDs:v5];

  [(BBServer *)self _assignIDToBulletinRequest:v4 checkAgainstBulletins:v6];
}

- (void)_assignIDToBulletinRequest:(id)a3 checkAgainstBulletins:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 publisherMatchID];
  if (v8)
  {
    uint64_t v18 = self;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v15 = [v14 publisherMatchID];
          int v16 = [v8 isEqualToString:v15];

          if (v16)
          {
            int v17 = [v14 bulletinID];
            [v6 setBulletinID:v17];

            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    self = v18;
  }
  [v6 generateNewBulletinID];
  ++self->_globalCounter;
  objc_msgSend(v6, "setCounter:");
LABEL_13:
}

- (void)initWithQueue:dataProviderManager:syncService:dismissalSyncCache:observerListener:conduitListener:settingsListener:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BulletinBoard: IONotificationPortGetRunLoopSource returned a NULL run loop", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BBServer: Canceling incoming observer connection because it lacks observer entitlement.", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BBServer: Canceling incoming conduit connection because it lacks conduit entitlement.", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BBServer: Canceling incoming settings connection because it lacks settings entitlement.", v2, v3, v4, v5, v6);
}

- (void)_feedsForBulletin:destinations:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_217675000, v0, v1, "BBServer: Could not find section info for <%@>. Ignoring bulletin: %@");
}

- (void)_feedsForBulletin:destinations:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "BBServer: Ignoring bulletin published with subsections that do not exist: %@", v2, v3, v4, v5, v6);
}

- (void)_scheduleTimerForDate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Request to schedule BBServer timer for unexpectedly early date <%@>. This is evidence of a logic error - please file a SpringBoard bug.", v2, v3, v4, v5, v6);
}

- (void)_logObserversBeforeAndAfterUpdateBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217675000, v0, v1, "New observer feeds: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_logObserversBeforeAndAfterUpdateBlock:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217675000, v0, v1, "New prioritized observer gateways: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_logObserversBeforeAndAfterUpdateBlock:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217675000, v0, v1, "New observer gateways: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_logObserversBeforeAndAfterUpdateBlock:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217675000, v0, v1, "Current observer feeds: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_logObserversBeforeAndAfterUpdateBlock:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217675000, v0, v1, "Current prioritized observer gateways: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_logObserversBeforeAndAfterUpdateBlock:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217675000, v0, v1, "Current observer gateways: %{public}@", v2, v3, v4, v5, v6);
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BBServer-handleResponse: Error: empty response", v2, v3, v4, v5, v6);
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BBServer-handleResponse: Error: response lacks bulletinID", v2, v3, v4, v5, v6);
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BBServer-handleResponse: Error: openURL: failed", v2, v3, v4, v5, v6);
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_210_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "BBServer-handleResponse: failed: openApplicationWithBundleIdentifier: %@", v2, v3, v4, v5, v6);
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_213_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_217675000, v0, v1, "BBServer-handleResponse: failed: deliverResponse:", v2, v3, v4, v5, v6);
}

- (void)isGreyMatterEligble
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "Failed to determine availability with status code: %d", (uint8_t *)v2, 8u);
}

void __50__BBServer__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error saving spoken notification setting chagne to Duet: %{public}@", v2, v3, v4, v5, v6);
}

void __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_217675000, v0, v1, "BBServer: unable to deliver message \"%@\" because no data provider exists for section \"%@\"");
}

void __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "BBServer: no wee app found for <%{public}@>", v2, v3, v4, v5, v6);
}

- (void)_verifyBulletinRequest:forDataProvider:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Bulletin request failed verification. Possible problems: request is not kind of class BBBulletinRequest, data provider returns nil for -sectionIdentifier, or publisherBulletinID and recordID are both nil.\n Failed bulletin: %@", v2, v3, v4, v5, v6);
}

- (void)_updateBulletinsInFeed:forDataProvider:enabledSectionIDs:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "BBServer: sectionID for dataProvider (%@) is nil, so we cannot update bulletins", v2, v3, v4, v5, v6);
}

- (void)_updateBulletinsInFeed:(void *)a1 forDataProvider:(void *)a2 enabledSectionIDs:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 _sectionInfoForSectionID:a3];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_217675000, v5, OS_LOG_TYPE_ERROR, "BBServer: enabledSectionIDs is empty: %{public}@", v7, 0xCu);
}

- (void)_publishBulletinRequest:forSectionID:forDestinations:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_217675000, v0, v1, "BBServer: No data provider found for section <%@>. Ignoring bulletin: %@");
}

@end