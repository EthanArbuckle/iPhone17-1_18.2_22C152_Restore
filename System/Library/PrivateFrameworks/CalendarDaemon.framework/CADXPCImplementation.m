@interface CADXPCImplementation
+ (void)monitorLocationAuthorizationStatusChanges:(unint64_t)a3;
- (BOOL)_CADDatabaseCanModifyCalendarDatabase;
- (BOOL)_CADDatabaseCanModifySuggestedEventCalendar;
- (BOOL)_checkAccess:(unint64_t)a3;
- (BOOL)_hasAccess:(unint64_t)a3;
- (BOOL)_performRestoreOperation:(id)a3;
- (BOOL)_requiresSpecialEntitlementToReadSecurityScopedURLWrapperForProperty:(id)a3;
- (BOOL)_verifyClientAllowedToWriteValue:(id)a3 forKey:(id)a4;
- (BOOL)accessGrantedToPerformSelector:(SEL)a3;
- (BOOL)hasAccess:(unint64_t)a3;
- (BOOL)isDuplicateEvent:(id)a3 updates:(id)a4;
- (BOOL)location:(void *)a3 matchesProperties:(id)a4;
- (BOOL)object:(void *)a3 matchesProperties:(id)a4 forKeys:(id)a5;
- (BOOL)recurrenceRule:(void *)a3 matchesProperties:(id)a4;
- (BOOL)shouldBlockSaveOfEvent:(id)a3 updates:(id)a4 becauseOfExistingEvent:(void *)a5;
- (CADXPCImplementation)initWithClientConnection:(id)a3;
- (ClientConnection)conn;
- (__CFArray)_copyToIntCFArrayRef:(id)a3;
- (__CFSet)_copyToIntCFSetRef:(id)a3;
- (id)_TCCPromptReasonStringForReason:(int64_t)a3;
- (id)_accountStoreForBackupRestore;
- (id)_getAlarmOccurrencesFromAlarmCacheForDatabase:(CalDatabase *)a3 databaseID:(int)a4 accessLogger:(id)a5;
- (id)_hangAssertionForBlockingTCCCall;
- (id)_importEvents:(id)a3 data:(id)a4 intoCalendarWithID:(id)a5 inDatabase:(CalDatabase *)a6 optionsMask:(unint64_t)a7 batchSize:(int)a8 outCalendarObjectID:(id *)a9 outError:(int *)a10;
- (id)_insert:(id)a3 delete:(id)a4 update:(id)a5 database:(CalDatabase *)a6 error:(int *)a7;
- (id)_insertObjectsWithTemporaryObjectIDs:(id)a3 updates:(id)a4 database:(CalDatabase *)a5 error:(int *)a6;
- (id)constraintsData:(id)a3 error:(int *)a4;
- (id)owningEventForObject:(id)a3 withUpdates:(id)a4;
- (id)owningObjectForObject:(id)a3 withProperties:(id)a4;
- (id)removeDuplicateEvents:(id)a3;
- (id)updatedOrInsertedObjectIDs:(id)a3 relatedToEvent:(id)a4;
- (int)_deleteObjects:(id)a3 database:(CalDatabase *)a4;
- (int)_tryPerformBlockWithCalendarID:(id)a3 forAction:(unint64_t)a4 withBlock:(id)a5;
- (int)_tryPerformBlockWithSourceID:(id)a3 forAction:(unint64_t)a4 entityType:(int)a5 withBlock:(id)a6;
- (int)_tryPerformBlockWithSourceID:(id)a3 forAction:(unint64_t)a4 withBlock:(id)a5;
- (int)_updatePropertiesAndRelations:(id)a3 database:(CalDatabase *)a4 insertedObjectMap:(id)a5;
- (int)findDatabaseForObject:(id)a3 withUpdates:(id)a4 personas:(id *)a5 accounts:(id *)a6 nextTempDBID:(int *)a7;
- (int)insert:(id)a3 deletes:(id)a4 updates:(id)a5 insertedObjectIDMap:(id)a6 inDatabase:(CalDatabase *)a7;
- (int)preflightAccessForDeletes:(id)a3 updates:(id)a4 inDatabase:(CalDatabase *)a5;
- (int)preflightObjectID:(id)a3 inDatabase:(CalDatabase *)a4;
- (unint64_t)sizeAttachmentsForDatabase:(CalDatabase *)a3;
- (unint64_t)sizeCalendarDirectoryForDatabase:(CalDatabase *)a3;
- (unint64_t)sizeDirectoryAtPath:(id)a3 excludingDirectory:(id)a4;
- (void)CADAnalyticsSendEvent:(id)a3 appendingClientBundleIDToPayload:(id)a4;
- (void)CADBackupDatabaseToFileNamed:(id)a3 inDirectory:(id)a4 includeAttachments:(BOOL)a5 reply:(id)a6;
- (void)CADBackupToICBU:(id)a3 reply:(id)a4;
- (void)CADCalendar:(id)a3 hasEvents:(id)a4;
- (void)CADCalendar:(id)a3 hasEventsWithRoomAsAttendee:(id)a4;
- (void)CADCalendarSetClearedFromNotificationCenter:(id)a3 error:(id)a4;
- (void)CADCatchUpIntegrationSyncingIfBehind:(id)a3;
- (void)CADCountCalendarItemsOfType:(int)a3 inSource:(id)a4 reply:(id)a5;
- (void)CADDatabaseCanModifyCalendarDatabase:(id)a3;
- (void)CADDatabaseCanModifySuggestedEventCalendar:(id)a3;
- (void)CADDatabaseCancelFetchRequestWithIdentifier:(unsigned int)a3;
- (void)CADDatabaseCommitDeletes:(id)a3 updatesAndInserts:(id)a4 options:(int64_t)a5 andFetchChangesSinceTimestamp:(id)a6 withReply:(id)a7;
- (void)CADDatabaseConsumeAllChangesUpToToken:(id)a3 except:(id)a4 reply:(id)a5;
- (void)CADDatabaseExportICSDataForCalendar:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)CADDatabaseExportICSDataForCalendarItems:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)CADDatabaseExportICSForCalendarItemWithID:(id)a3 occurrenceDate:(id)a4 options:(unint64_t)a5 reply:(id)a6;
- (void)CADDatabaseFetchCalendarItemsWithPredicate:(id)a3 entityType:(int)a4 fetchIdentifier:(int)a5 synchronous:(BOOL)a6 reply:(id)a7;
- (void)CADDatabaseFetchChangedObjectIDs:(id)a3;
- (void)CADDatabaseFetchObjectChangesForEntityTypes:(id)a3 insideObject:(id)a4 reply:(id)a5;
- (void)CADDatabaseGetAccess:(id)a3;
- (void)CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply:(id)a3;
- (void)CADDatabaseGetAlarmWithExternalID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetAlarmWithUUID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetAllEventsWithUniqueID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetAttachmentWithUUID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetBirthdayCalendarEnabledWithReply:(id)a3;
- (void)CADDatabaseGetBirthdayCalendarVersionWithReply:(id)a3;
- (void)CADDatabaseGetCalendarItemWithUUID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetCalendarItemsWithRecurrenceSet:(id)a3 inCalendar:(id)a4 reply:(id)a5;
- (void)CADDatabaseGetCalendarItemsWithUUIDs:(id)a3 inCalendars:(id)a4 propertiesToLoad:(id)a5 reply:(id)a6;
- (void)CADDatabaseGetCalendarItemsWithUniqueIdentifier:(id)a3 inCalendar:(id)a4 reply:(id)a5;
- (void)CADDatabaseGetCalendarsWithFaultedProperties:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetChangedEntityIDsSinceTimestamp:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetChangesSinceSequenceToken:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetColorWithProviderIdentifier:(id)a3 externalID:(id)a4 reply:(id)a5;
- (void)CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetDefaultAlarmOffsetForAllDay:(BOOL)a3 reply:(id)a4;
- (void)CADDatabaseGetDefaultCalendarForNewEventsInDelegateSource:(id)a3 withReply:(id)a4;
- (void)CADDatabaseGetDefaultLocalCalendarWithReply:(id)a3;
- (void)CADDatabaseGetDeletableCalendars:(id)a3;
- (void)CADDatabaseGetDeletableSources:(id)a3;
- (void)CADDatabaseGetErrorCount:(id)a3;
- (void)CADDatabaseGetEventNotificationItemsAfterDate:(id)a3 excludingUncheckedCalendars:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 reply:(id)a6;
- (void)CADDatabaseGetEventWithEventIdentifier:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetEventWithUniqueID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetEventsWithErrorsPerSource:(id)a3;
- (void)CADDatabaseGetInboxRepliedSectionItems:(id)a3;
- (void)CADDatabaseGetInviteReplyNotifications:(id)a3;
- (void)CADDatabaseGetLocalBirthdaySource:(id)a3;
- (void)CADDatabaseGetLocalSourceWithEnableIfNeeded:(BOOL)a3 reply:(id)a4;
- (void)CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply:(id)a3;
- (void)CADDatabaseGetNotificationCountExcludingUncheckedCalendars:(BOOL)a3 expanded:(BOOL)a4 reply:(id)a5;
- (void)CADDatabaseGetNotificationCountForSourceWithExternalIdentifier:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 expanded:(BOOL)a6 reply:(id)a7;
- (void)CADDatabaseGetOrCreateBirthdayCalendar:(id)a3;
- (void)CADDatabaseGetOrCreateSubscribedCalendarsSource:(id)a3;
- (void)CADDatabaseGetResourceChanges:(id)a3;
- (void)CADDatabaseGetSequenceToken:(id)a3;
- (void)CADDatabaseGetSharedCalendarInvitationsWithReply:(id)a3;
- (void)CADDatabaseGetSourceIdentifierForEventWithObjectID:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetSourcesWithFaultedProperties:(id)a3 reply:(id)a4;
- (void)CADDatabaseGetStorageUsage:(id)a3;
- (void)CADDatabaseGetSuggestedEventCalendarWithReply:(id)a3;
- (void)CADDatabaseGetTTLLocationAuthorizationStatus:(id)a3;
- (void)CADDatabaseGetUUID:(id)a3;
- (void)CADDatabaseImportEvents:(id)a3 fromICSData:(id)a4 intoCalendarsWithIDs:(id)a5 optionsMask:(unint64_t)a6 batchSize:(int)a7 reply:(id)a8;
- (void)CADDatabaseInsertSuggestedEventCalendarWithReply:(id)a3;
- (void)CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID:(id)a3 reply:(id)a4;
- (void)CADDatabaseLastConfirmedSplashScreenVersion:(id)a3;
- (void)CADDatabaseLoadEventsInCalendar:(id)a3 reply:(id)a4;
- (void)CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken:(id)a3 reply:(id)a4;
- (void)CADDatabaseMarkIndividualChangesConsumed:(id)a3 reply:(id)a4;
- (void)CADDatabaseMigrateSubscribedCalendar:(id)a3 toSource:(id)a4 reply:(id)a5;
- (void)CADDatabaseRebuildOccurrenceCacheWithReply:(id)a3;
- (void)CADDatabaseRegisterForDetailedChangeTrackingInSource:(id)a3 reply:(id)a4;
- (void)CADDatabaseRemoveSuggestedEventCalendarWithReply:(id)a3;
- (void)CADDatabaseRequestAccessForEntityType:(unint64_t)a3 desiredFullAccess:(BOOL)a4 isBlockingUIThread:(BOOL)a5 reason:(int64_t)a6 reply:(id)a7;
- (void)CADDatabaseResetWithReply:(id)a3;
- (void)CADDatabaseSetBirthdayCalendarEnabled:(BOOL)a3 withReply:(id)a4;
- (void)CADDatabaseSetBirthdayCalendarVersion:(int)a3 withReply:(id)a4;
- (void)CADDatabaseSetDefaultCalendarForNewEvents:(id)a3 delegateSource:(id)a4 reply:(id)a5;
- (void)CADDatabaseSetInitializationOptions:(id)a3 reply:(id)a4;
- (void)CADDatabaseSetShowsCompletedReminders:(BOOL)a3 reply:(id)a4;
- (void)CADDatabaseSetShowsDeclinedEvents:(BOOL)a3 reply:(id)a4;
- (void)CADDatabaseShouldPermitOrganizerEmailFromJunkChecks:(id)a3 reply:(id)a4;
- (void)CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3 reply:(id)a4;
- (void)CADDatabaseShowsDeclinedEventsWithReply:(id)a3;
- (void)CADDatabaseStatsBySource:(id)a3;
- (void)CADDatabaseUnregisterForDetailedChangeTracking:(id)a3;
- (void)CADDiagnosticsCancelCollectionWithToken:(unsigned int)a3 reply:(id)a4;
- (void)CADDiagnosticsCollectWithToken:(unsigned int)a3 options:(int64_t)a4 trafficLogsCollectionMode:(unint64_t)a5 reply:(id)a6;
- (void)CADEventSetInvitationStatus:(int)a3 forEvents:(id)a4 error:(id)a5;
- (void)CADInternalForceStatCollection:(id)a3;
- (void)CADInternalRemoveConferenceLinkRenewalDate:(id)a3;
- (void)CADInternalSetNextConferenceLinkRenewalToNow:(id)a3;
- (void)CADMigrateDatabaseIfNeeded:(id)a3;
- (void)CADObject:(id)a3 getDataPropertyWithName:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getDatePropertyWithName:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getNumberPropertyWithName:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getPropertiesWithNames:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getPropertyWithName:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getRelatedObjectWithRelationName:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getRelatedObjectsWithRelationName:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getSecurityScopedURLWrapperPropertyWithName:(id)a4 reply:(id)a5;
- (void)CADObject:(id)a3 getStringPropertyWithName:(id)a4 reply:(id)a5;
- (void)CADObjectExists:(id)a3 reply:(id)a4;
- (void)CADObjectGetConstraints:(id)a3 reply:(id)a4;
- (void)CADObjectIsManaged:(id)a3 reply:(id)a4;
- (void)CADObjects:(id)a3 getPropertiesWithNames:(id)a4 reply:(id)a5;
- (void)CADObjectsExist:(id)a3 reply:(id)a4;
- (void)CADOccurrenceCacheCancelSearchWithReplyID:(int)a3;
- (void)CADOccurrenceCacheDoEvents:(id)a3 haveOccurrencesAfterDate:(id)a4 reply:(id)a5;
- (void)CADOccurrenceCacheGetOccurrenceCountWithStartDate:(id)a3 endDate:(id)a4 reply:(id)a5;
- (void)CADOccurrenceCacheGetOccurrenceCountsForCalendars:(id)a3 reply:(id)a4;
- (void)CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID:(id)a3 nearestDate:(id)a4 prefersForwardSearch:(BOOL)a5 reply:(id)a6;
- (void)CADOccurrenceCacheGetOccurrencesForCalendars:(id)a3 onDay:(id)a4 reply:(id)a5;
- (void)CADOccurrenceCacheSearchLocationsWithTerm:(id)a3 inCalendars:(id)a4 responseToken:(int)a5 reply:(id)a6;
- (void)CADOccurrenceCacheSearchWithTerm:(id)a3 inCalendars:(id)a4 responseToken:(int)a5 reply:(id)a6;
- (void)CADOccurrencesExistInRangeForEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6 timezone:(id)a7 reply:(id)a8;
- (void)CADPersonaIdentifierForDatabaseID:(int)a3 reply:(id)a4;
- (void)CADPostSyntheticRouteHypothesis:(id)a3 forEventWithExternalURL:(id)a4 reply:(id)a5;
- (void)CADPurgeChangeTrackingReply:(id)a3;
- (void)CADRemoveCalendarItemsOlderThanDate:(id)a3 ofType:(int)a4 inSource:(id)a5 reply:(id)a6;
- (void)CADResourceChange:(id)a3 setAlertedWithError:(id)a4;
- (void)CADRestoreFromDatabaseBackupFileNamed:(id)a3 inDirectory:(id)a4 includeAttachments:(BOOL)a5 reply:(id)a6;
- (void)CADRestoreFromICBU:(id)a3 reply:(id)a4;
- (void)CADSourceAddExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toSourceWithID:(id)a5 reply:(id)a6;
- (void)CADSourceGetGrantedDelegatesList:(id)a3 reply:(id)a4;
- (void)CADSourceGetNotificationCollection:(id)a3 reply:(id)a4;
- (void)CADSourceRefresh:(id)a3 isUserRequested:(BOOL)a4 reply:(id)a5;
- (void)CADSourceRemoveExchangeDelegateWithID:(id)a3 reply:(id)a4;
- (void)CADSourceUpdateGrantedDelegate:(id)a3 action:(int64_t)a4 sourceID:(id)a5 reply:(id)a6;
- (void)CADTestingCloseDatabase:(id)a3;
- (void)CADTestingSimulateDaemonCrash;
- (void)_handleiTIPMesssageAndCopyEventFromDocument:(id)a3 data:(id)a4 database:(CalDatabase *)a5 store:(void *)a6 accountInfo:(id)a7 options:(unint64_t)a8;
- (void)clearCachedAuthorizationStatus;
@end

@implementation CADXPCImplementation

uint64_t __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"objectID"];
}

uint64_t __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

void __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    if (Count >= 1)
    {
      for (CFIndex i = 0; Count != i; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        v13 = CADEntityCopyObjectID();
        if (CalendarCanContainAnAllowedEntityType((uint64_t)ValueAtIndex, *(void **)(*(void *)(a1 + 32) + 8)))
        {
          if (![*(id *)(*(void *)(a1 + 32) + 8) isCalendarRestricted:ValueAtIndex forAction:0])
          {
            v18 = CalEntityCopyPropertyValues(*(void **)(*(void *)(a1 + 32) + 8), (uint64_t)ValueAtIndex, *(void **)(a1 + 40), (_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v13];
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v18];

            goto LABEL_14;
          }
          uint64_t v14 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v13;
            v15 = v14;
            v16 = "Read access managed -> unmanaged not allowed for calendar. ObjectID: [%@]";
LABEL_12:
            _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
          }
        }
        else
        {
          uint64_t v17 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v13;
            v15 = v17;
            v16 = "Calendar cannot contain an allowed entity type. ObjectID: [%@]";
            goto LABEL_12;
          }
        }
LABEL_14:
      }
    }
    CFRelease(v3);
  }
}

void __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getNumberPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          uint64_t v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = [v9 entityID];
          int v11 = [*(id *)(a1 + 32) entityType];
          int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v13 = 138544130;
          uint64_t v14 = v8;
          __int16 v15 = 1024;
          int v16 = (int)v9;
          __int16 v17 = 1024;
          int v18 = v11;
          __int16 v19 = 1024;
          int v20 = v12;
          _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Error getting number value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __88__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertiesWithNames_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      uint64_t v6 = CalEntityCopyPropertyValues(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v9 && v9 != 1010)
      {
        v10 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 48);
          int v12 = *(void **)(a1 + 32);
          int v13 = v10;
          LODWORD(v12) = [v12 entityID];
          int v14 = [*(id *)(a1 + 32) entityType];
          int v15 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v16 = 138544130;
          uint64_t v17 = v11;
          __int16 v18 = 1024;
          int v19 = (int)v12;
          __int16 v20 = 1024;
          int v21 = v14;
          __int16 v22 = 1024;
          int v23 = v15;
          _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "Error getting property names %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v16, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __99__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectsWithRelationName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        uint64_t v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          int v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = [v9 entityID];
          int v11 = [*(id *)(a1 + 32) entityType];
          int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v13 = 138544130;
          uint64_t v14 = v8;
          __int16 v15 = 1024;
          int v16 = (int)v9;
          __int16 v17 = 1024;
          int v18 = v11;
          __int16 v19 = 1024;
          int v20 = v12;
          _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Error getting related objects for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDatePropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        uint64_t v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          int v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = [v9 entityID];
          int v11 = [*(id *)(a1 + 32) entityType];
          int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v13 = 138544130;
          uint64_t v14 = v8;
          __int16 v15 = 1024;
          int v16 = (int)v9;
          __int16 v17 = 1024;
          int v18 = v11;
          __int16 v19 = 1024;
          int v20 = v12;
          _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Error getting date value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getStringPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        uint64_t v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          int v9 = *(void **)(a1 + 32);
          v10 = v7;
          LODWORD(v9) = [v9 entityID];
          int v11 = [*(id *)(a1 + 32) entityType];
          int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v13 = 138544130;
          uint64_t v14 = v8;
          __int16 v15 = 1024;
          int v16 = (int)v9;
          __int16 v17 = 1024;
          int v18 = v11;
          __int16 v19 = 1024;
          int v20 = v12;
          _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Error getting string value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

void __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseInsertSuggestedEventCalendarWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (const void *)CalDatabaseCopySuggestionsCalendar();
  uint64_t v6 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  uint64_t v7 = (const void *)v6;
  if (v5 && v6)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1020;
  }
  else if (!v5)
  {
    CalDatabaseInsertSuggestionsCalendar();
    if (v7) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  CFRelease(v5);
  if (v7)
  {
LABEL_6:
    CFRelease(v7);
    return;
  }
LABEL_10:
  MEMORY[0x1F410E5E8](a3);
}

void __98__CADXPCImplementation_CADSourceOperationGroup___tryPerformBlockWithSourceID_forAction_withBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) entityID];
  uint64_t v2 = CalDatabaseCopyStoreWithUID();
  if (!v2)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    int v5 = 1010;
    goto LABEL_5;
  }
  CFArrayRef v3 = (const void *)v2;
  if ([*(id *)(*(void *)(a1 + 40) + 8) isStoreRestricted:v2 forAction:*(void *)(a1 + 64)])
  {
    CFRelease(v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    int v5 = 1013;
LABEL_5:
    *(_DWORD *)(v4 + 24) = v5;
    return;
  }
  [*(id *)(*(void *)(a1 + 40) + 8) logAccessToObject:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  CFRelease(v3);
}

uint64_t __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectExists_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  uint64_t result = CADEntityExistsInDatabaseAndIsAccessible(a3, *(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40), 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __104__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v7 = [*(id *)(a1 + 32) valueForKey:@"entityID"];
  id v17 = [v6 setWithArray:v7];

  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 8) restrictedCalendarRowIDsForAction:0 inDatabase:a4];
  [v17 minusSet:v8];

  int v9 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  v10 = (const void *)CalFilterCreateWithDatabaseShowingCalendarsWithUIDs();
  int v11 = (void *)CalEventOccurrenceCacheCopyAllDaysAndOccurrenceCounts();
  CFRelease(v10);
  CFRelease(v9);
  if ([v11 count])
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(void *)(v12 + 40))
    {
      uint64_t v13 = CalEventOccurrenceCacheMergeCounts();
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      __int16 v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      id v16 = v11;
      __int16 v15 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v16;
    }
  }
}

- (void)CADDatabaseSetInitializationOptions:(id)a3 reply:(id)a4
{
  uint64_t v8 = (void (**)(id, uint64_t, uint64_t))a4;
  if ([(ClientConnection *)self->_conn trySetDatabaseInitializationOptions:a3])
  {
    if ([(ClientConnection *)self->_conn eventAccessLevel])
    {
      uint64_t v6 = [(ClientConnection *)self->_conn databaseRestoreGeneration];
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v6 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v6 = 0xFFFFFFFFLL;
    uint64_t v7 = 1013;
  }
  v8[2](v8, v7, v6);
}

- (BOOL)accessGrantedToPerformSelector:(SEL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (accessGrantedToPerformSelector__onceToken != -1) {
    dispatch_once(&accessGrantedToPerformSelector__onceToken, &__block_literal_global_5);
  }
  int v5 = NSStringFromSelector(a3);
  uint64_t v6 = [(id)accessGrantedToPerformSelector__accessTypeBySelector objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    BOOL v8 = [(CADXPCImplementation *)self hasAccess:v7];
  }
  else
  {
    int v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_FAULT))
    {
      int v11 = 138543362;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_FAULT, "Unknown selector %{public}@", (uint8_t *)&v11, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasAccess:(unint64_t)a3
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  LOBYTE(a3) = [(CADXPCImplementation *)self _hasAccess:a3];
  os_unfair_lock_unlock(p_accessLock);
  return a3;
}

- (BOOL)_hasAccess:(unint64_t)a3
{
  BOOL v3 = 1;
  if ((self->_allowedAccess & a3) == 0)
  {
    unsigned int v6 = 0;
    while (1)
    {
      uint64_t v7 = (1 << v6);
      if ((v7 & a3) != 0)
      {
        unint64_t checkedAccess = self->_checkedAccess;
        if ((checkedAccess & v7) == 0)
        {
          self->_unint64_t checkedAccess = checkedAccess | v7;
          if ([(CADXPCImplementation *)self _checkAccess:(1 << v6)]) {
            break;
          }
        }
      }
      BOOL v3 = v6++ < 0xC;
      if (v6 == 13) {
        return 0;
      }
    }
    self->_allowedAccess |= v7;
  }
  return v3;
}

void __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v7 = [a3 valueForKey:@"entityID"];
  BOOL v8 = [v6 setWithArray:v7];

  int v9 = [*(id *)(*(void *)(a1 + 32) + 8) restrictedCalendarRowIDsForAction:0 inDatabase:a4];
  [v8 minusSet:v9];

  uint64_t v10 = CalDatabaseCopyEventOccurrenceCache();
  uint64_t v11 = CalFilterCreateWithDatabaseShowingCalendarsWithUIDs();
  uint64_t v12 = a1;
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  CFTypeRef cf = (CFTypeRef)v11;
  CFTypeRef v26 = (CFTypeRef)v10;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)CalEventOccurrenceCacheCopyOccurrencesOnDay();
  uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v18 = [v17 objectForKeyedSubscript:@"occurrenceDate"];
        if (v18)
        {
          __int16 v19 = [v17 objectForKeyedSubscript:@"nextReminderDate"];
          id v20 = objc_alloc(MEMORY[0x1E4F57428]);
          uint64_t v21 = [v17 objectForKeyedSubscript:@"eventUID"];
          __int16 v22 = objc_msgSend(v20, "initWithEntityType:entityID:databaseID:", 2, objc_msgSend(v21, "intValue"), a2);

          long long v34 = xmmword_1E624F630;
          v35 = @"nextReminderDate";
          v33[0] = v18;
          v33[1] = v22;
          v33[2] = v19;
          if (v19) {
            uint64_t v23 = 3;
          }
          else {
            uint64_t v23 = 2;
          }
          uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v34 count:v23];
          [*(id *)(v12 + 48) addObject:v24];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v14);
  }

  CFRelease(cf);
  CFRelease(v26);
}

uint64_t __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 objectForKeyedSubscript:@"occurrenceDate"];
  unsigned int v6 = [v4 objectForKeyedSubscript:@"occurrenceDate"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)_checkAccess:(unint64_t)a3
{
  int v5 = [(ClientConnection *)self->_conn permissionValidator];
  if ([v5 testingAccessLevelGranted])
  {
    BOOL v6 = 1;
    goto LABEL_28;
  }
  if ((uint64_t)a3 > 127)
  {
    if ((uint64_t)a3 > 1023)
    {
      switch(a3)
      {
        case 0x400uLL:
          char v9 = [v5 testingAccessLevelGranted];
          goto LABEL_27;
        case 0x800uLL:
          BOOL v8 = [v5 eventAccessLevel] == 1;
LABEL_30:
          BOOL v6 = v8;
          goto LABEL_28;
        case 0x1000uLL:
          char v9 = [v5 isRemoteUIExtension];
          goto LABEL_27;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x80uLL:
          char v9 = [v5 internalAccessLevelGranted];
          goto LABEL_27;
        case 0x100uLL:
          char v9 = [v5 storageManagementAccessGranted];
          goto LABEL_27;
        case 0x200uLL:
          char v9 = [v5 canRequestDiagnostics];
LABEL_27:
          BOOL v6 = v9;
          goto LABEL_28;
      }
    }
LABEL_33:
    BOOL v6 = 0;
    goto LABEL_28;
  }
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        char v9 = [v5 hasSyncClientEntitlement];
        goto LABEL_27;
      case 0x20uLL:
        char v9 = [v5 hasCalendarToolEntitlement];
        goto LABEL_27;
      case 0x40uLL:
        char v9 = [v5 hasNotificationCountEntitlement];
        goto LABEL_27;
    }
    goto LABEL_33;
  }
  unint64_t v7 = a3 - 1;
  BOOL v6 = 1;
  switch(v7)
  {
    case 0uLL:
      break;
    case 1uLL:
      BOOL v8 = [(ClientConnection *)self->_conn eventAccessLevel] == 2;
      goto LABEL_30;
    case 3uLL:
      char v9 = [v5 isFirstPartyCalendarApp];
      goto LABEL_27;
    case 7uLL:
      char v9 = [v5 isCalendarDaemon];
      goto LABEL_27;
    default:
      goto LABEL_33;
  }
LABEL_28:

  return v6;
}

- (CADXPCImplementation)initWithClientConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADXPCImplementation;
  BOOL v6 = [(CADXPCImplementation *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conn, a3);
    v7->_accessLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)CADDatabaseGetDefaultCalendarForNewEventsInDelegateSource:(id)a3 withReply:(id)a4
{
  id v12 = a3;
  conn = self->_conn;
  unint64_t v7 = (void (**)(id, uint64_t, void *))a4;
  BOOL v8 = [(ClientConnection *)conn permissionValidator];
  objc_super v9 = +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:](CADOperationGroupUtil, "defaultCalendarForNewEventsInDelegateSource:withConnection:limitedAccess:", v12, conn, [v8 eventAccessLevel] == 1);

  if (v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 1010;
  }
  v7[2](v7, v10, v9);

  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (v12) {
    [v11 addObject:v12];
  }
  if (v9) {
    [v11 addObject:v9];
  }
  [(ClientConnection *)self->_conn logAccessToObjects:v11];
}

- (void)CADDatabaseGetEventNotificationItemsAfterDate:(id)a3 excludingUncheckedCalendars:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  conn = self->_conn;
  id v20 = 0;
  id v21 = 0;
  id v18 = 0;
  id v19 = 0;
  uint64_t v11 = (void (**)(id, void, id, id, id, id))a6;
  LOBYTE(v17) = 0;
  uint64_t v12 = +[CADNotificationUtilities CADDatabaseGetEventNotificationItemsWithConnection:conn afterDate:a3 forSourceWithExternalIdentifier:0 excludingDelegateSources:0 excludingUncheckedCalendars:v7 filteredByShowsNotificationsFlag:v6 expanded:v17 earliestExpirationDate:&v21 notificationTypes:&v20 objectIDs:&v19 occurrenceDates:&v18 attendeeObjectIDs:0];
  id v13 = v21;
  id v14 = v20;
  id v15 = v19;
  id v16 = v18;
  v11[2](v11, v12, v14, v15, v16, v13);

  [(ClientConnection *)self->_conn logAccessToObjects:v15];
}

- (void).cxx_destruct
{
}

- (void)CADDatabaseInsertSuggestedEventCalendarWithReply:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if (![(CADXPCImplementation *)self _CADDatabaseCanModifySuggestedEventCalendar])
  {
    BOOL v8 = v12;
    uint64_t v9 = 1013;
LABEL_6:
    *((_DWORD *)v8 + 6) = v9;
    goto LABEL_7;
  }
  conn = self->_conn;
  uint64_t v6 = *MEMORY[0x1E4F574B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseInsertSuggestedEventCalendarWithReply___block_invoke;
  v10[3] = &unk_1E624DDF0;
  v10[4] = &v11;
  BOOL v7 = [(ClientConnection *)conn withDatabaseID:v6 perform:v10];
  BOOL v8 = v12;
  if (!v7)
  {
    uint64_t v9 = 1007;
    goto LABEL_6;
  }
  uint64_t v9 = *((unsigned int *)v12 + 6);
LABEL_7:
  v4[2](v4, v9);
  _Block_object_dispose(&v11, 8);
}

- (BOOL)_CADDatabaseCanModifySuggestedEventCalendar
{
  uint64_t v2 = [(ClientConnection *)self->_conn permissionValidator];
  char v3 = [v2 canModifySuggestedEventCalendar];

  return v3;
}

void __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFArrayRef v4 = (const __CFArray *)CalDatabaseCopyOfAllStores();
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        if ([*(id *)(*(void *)(a1 + 32) + 8) eventAccessLevel] == 2
          && CalStoreAllowsEvents()
          && ([*(id *)(*(void *)(a1 + 32) + 8) isStoreRestricted:ValueAtIndex forAction:0] & 1) == 0)
        {
          uint64_t UID = CalStoreGetUID();
          uint64_t v11 = CalEntityCopyPropertyValues(*(void **)(*(void *)(a1 + 32) + 8), (uint64_t)ValueAtIndex, *(void **)(a1 + 40), (_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
          if (!v11)
          {
            uint64_t v12 = CADLogHandle;
            BOOL v13 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
            uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
            if (v13)
            {
              int v14 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
              *(_DWORD *)buf = 67109376;
              int v18 = UID;
              __int16 v19 = 1024;
              int v20 = v14;
              _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_ERROR, "Failed to get properties for store with rowID %d, error = %d", buf, 0xEu);
            }
          }
          id v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          id v16 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:6 entityID:UID databaseID:a2];
          [v15 addObject:v16];

          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v11];
        }
      }
    }
    CFRelease(v5);
  }
}

- (void)CADObjectGetConstraints:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(id, void, void *))a4;
  uint64_t v28 = 0;
  long long v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__6;
  long long v32 = __Block_byref_object_dispose__6;
  id v33 = 0;
  if ((!v7 || [v7 isVirtual])
    && [(ClientConnection *)self->_conn eventAccessLevel] == 1)
  {
    uint64_t v9 = +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:0 withConnection:self->_conn limitedAccess:0];
    conn = self->_conn;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke;
    v25[3] = &unk_1E624F178;
    id v11 = v9;
    id v26 = v11;
    v27 = &v28;
    [(ClientConnection *)conn withDatabaseForObject:v11 perform:v25];
    if (v29[5])
    {

LABEL_13:
      *(_DWORD *)buf = 0;
      id v16 = -[CADXPCImplementation constraintsData:error:](self, "constraintsData:error:", v29[5], buf, v19, v20, v21, v22);
      v8[2](v8, *(unsigned int *)buf, v16);

      goto LABEL_14;
    }
    uint64_t v17 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_ERROR, "Couldn't fetch the default source for getting constraints, with limited access", buf, 2u);
    }
    v8[2](v8, 1010, 0);
  }
  else
  {
    int v12 = [v7 entityType];
    if (v12 != 2)
    {
      if (v12 == 6)
      {
        objc_storeStrong(v29 + 5, a3);
      }
      else
      {
        id v15 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v7;
          _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_ERROR, "Undefined constraints for objectID: %@. We only support source and event to get source constraints right now", buf, 0xCu);
        }
      }
      goto LABEL_13;
    }
    BOOL v13 = self->_conn;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke_6;
    __int16 v22 = &unk_1E624F178;
    id v14 = v7;
    id v23 = v14;
    uint64_t v24 = &v28;
    [(ClientConnection *)v13 withDatabaseForObject:v14 perform:&v19];
    if (v29[5])
    {

      goto LABEL_13;
    }
    int v18 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v14;
      _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_ERROR, "Couldn't retrieve actual source for event (%@) to get its constraints", buf, 0xCu);
    }
    v8[2](v8, 1010, 0);
  }
LABEL_14:
  _Block_object_dispose(&v28, 8);
}

- (id)constraintsData:(id)a3 error:(int *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x4010000000;
  id v15 = "";
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CADXPCImplementation_CADSourceOperationGroup__constraintsData_error___block_invoke;
  v11[3] = &unk_1E624F150;
  v11[4] = &v12;
  int v7 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:v6 forAction:0 withBlock:v11];
  if (v7)
  {
    BOOL v8 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    BOOL v8 = (void *)[v9 initWithBytes:v13 + 4 length:28];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (int)_tryPerformBlockWithSourceID:(id)a3 forAction:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__CADXPCImplementation_CADSourceOperationGroup___tryPerformBlockWithSourceID_forAction_withBlock___block_invoke;
  v15[3] = &unk_1E624F0B0;
  id v11 = v8;
  id v16 = v11;
  uint64_t v17 = self;
  int v19 = &v21;
  unint64_t v20 = a4;
  id v12 = v9;
  id v18 = v12;
  if ([(ClientConnection *)conn withDatabaseForObject:v11 perform:v15])
  {
    int v13 = *((_DWORD *)v22 + 6);
  }
  else
  {
    int v13 = 1010;
    *((_DWORD *)v22 + 6) = 1010;
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)CADObjectExists:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 1010;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  conn = self->_conn;
  char v21 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectExists_reply___block_invoke;
  int v13 = &unk_1E624DB38;
  id v16 = &v22;
  uint64_t v17 = &v18;
  uint64_t v14 = self;
  id v9 = v6;
  id v15 = v9;
  [(ClientConnection *)conn withDatabaseForObject:v9 perform:&v10];
  (*((void (**)(id, void, void))v7 + 2))(v7, *((unsigned int *)v23 + 6), *((unsigned __int8 *)v19 + 24));
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v9, v10, v11, v12, v13, v14);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)CADOccurrenceCacheGetOccurrenceCountsForCalendars:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__12;
  int v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply___block_invoke;
  v11[3] = &unk_1E624F610;
  id v9 = v6;
  id v12 = v9;
  int v13 = self;
  uint64_t v14 = &v15;
  if ([(ClientConnection *)conn withDatabaseForObjects:v9 perform:v11]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 1010;
  }
  v7[2](v7, v10, v16[5]);
  [(ClientConnection *)self->_conn logAccessToObjects:v9];

  _Block_object_dispose(&v15, 8);
}

- (void)CADDatabaseGetSourcesWithFaultedProperties:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t, uint64_t))a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__6;
  uint64_t v24 = __Block_byref_object_dispose__6;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v8 = [(ClientConnection *)self->_conn eventAccessLevel];
  conn = self->_conn;
  if (v8 == 1)
  {
    uint64_t v10 = *MEMORY[0x1E4F574B8];
    uint64_t v11 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke;
    v13[3] = &unk_1E624F0D8;
    v13[4] = self;
    v13[5] = v6;
    v13[6] = &v26;
    v13[7] = &v20;
    v13[8] = &v14;
    [(ClientConnection *)conn withDatabaseID:v10 perform:v13];
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
  }
  else
  {
    uint64_t v11 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke_2;
    v12[3] = &unk_1E624F100;
    v12[4] = self;
    v12[5] = v6;
    v12[6] = &v26;
    v12[7] = &v20;
    v12[8] = &v14;
    [(ClientConnection *)conn withAllDatabasesPerform:v12];
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
    [(ClientConnection *)self->_conn logAccessToObjects:v21[5]];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

- (void)CADDatabaseGetCalendarsWithFaultedProperties:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t, uint64_t))a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__5;
  uint64_t v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__5;
  uint64_t v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  int v8 = [(ClientConnection *)self->_conn eventAccessLevel];
  conn = self->_conn;
  if (v8 == 1)
  {
    uint64_t v10 = *MEMORY[0x1E4F574B8];
    uint64_t v11 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke;
    v13[3] = &unk_1E624F038;
    v13[6] = &v20;
    v13[7] = &v14;
    v13[4] = self;
    v13[5] = v6;
    v13[8] = &v26;
    [(ClientConnection *)conn withDatabaseID:v10 perform:v13];
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
  }
  else
  {
    uint64_t v11 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke_2;
    v12[3] = &unk_1E624F060;
    v12[6] = &v20;
    v12[7] = &v14;
    v12[4] = self;
    v12[5] = v6;
    v12[8] = &v26;
    [(ClientConnection *)conn withAllDatabasesPerform:v12];
    v7[2](v7, *((unsigned int *)v27 + 6), v21[5], v15[5]);
    [(ClientConnection *)self->_conn logAccessToObjects:v21[5]];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

- (void)CADObject:(id)a3 getStringPropertyWithName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getStringPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E624DBD8;
    uint64_t v18 = &v24;
    id v15 = v8;
    uint64_t v16 = self;
    id v17 = v9;
    id v19 = &v20;
    if (![(ClientConnection *)conn withDatabaseForObject:v15 perform:v14]) {
      *((_DWORD *)v25 + 6) = 1010;
    }

    uint64_t v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    uint64_t v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  int v13 = (const void *)v21[3];
  if (v13) {
    CFRelease(v13);
  }
  [(ClientConnection *)self->_conn logAccessToObject:v8];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CFArrayRef v4 = WeakRetained;
  if (WeakRetained)
  {
    CFArrayRef v5 = [WeakRetained conn];
    id v6 = [v7 CalMap:&__block_literal_global_13];
    [v5 logAccessToObjects:v6];
  }
}

- (void)CADDatabaseFetchCalendarItemsWithPredicate:(id)a3 entityType:(int)a4 fetchIdentifier:(int)a5 synchronous:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  int v13 = (void (**)(id, uint64_t, void))a7;
  if (!v12) {
    goto LABEL_9;
  }
  if (v10 == 101) {
    goto LABEL_6;
  }
  if (v10 != 3)
  {
    if (v10 == 2)
    {
      if ([(ClientConnection *)self->_conn eventAccessLevel]) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
LABEL_9:
    uint64_t v17 = 1001;
LABEL_15:
    v13[2](v13, v17, 0);
    goto LABEL_16;
  }
  if (![(ClientConnection *)self->_conn reminderAccessGranted])
  {
LABEL_14:
    uint64_t v17 = 1013;
    goto LABEL_15;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v12;
      _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_ERROR, "Unsupported predicate: [%@]", buf, 0xCu);
    }
    uint64_t v17 = 1007;
    goto LABEL_15;
  }
  if (v8)
  {
    uint64_t v14 = +[_CADFetchCalendarItemsWithPredicateOperation performSynchronouslyWithPredicate:v12 entityType:v10 connection:self->_conn fetchIdentifier:v9 cancellationToken:0];
    ((void (**)(id, uint64_t, void *))v13)[2](v13, 0, v14);
    id v15 = [(CADXPCImplementation *)self conn];
    uint64_t v16 = [v14 CalMap:&__block_literal_global_9];
    [v15 logAccessToObjects:v16];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v19 = [_CADFetchCalendarItemsWithPredicateOperation alloc];
    conn = self->_conn;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke_2;
    id v25 = &unk_1E624E3F8;
    uint64_t v26 = v13;
    objc_copyWeak(&v27, (id *)buf);
    char v21 = [(_CADFetchCalendarItemsWithPredicateOperation *)v19 initWithPredicate:v12 entityType:v10 connection:conn fetchIdentifier:v9 completionHandler:&v22];
    -[ClientConnection addOperation:](self->_conn, "addOperation:", v21, v22, v23, v24, v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak((id *)buf);
  }
LABEL_16:
}

- (ClientConnection)conn
{
  return self->_conn;
}

- (void)CADObject:(id)a3 getDatePropertyWithName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDatePropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E624DBD8;
    uint64_t v18 = &v24;
    id v15 = v8;
    uint64_t v16 = self;
    id v17 = v9;
    id v19 = &v20;
    if (![(ClientConnection *)conn withDatabaseForObject:v15 perform:v14]) {
      *((_DWORD *)v25 + 6) = 1010;
    }

    uint64_t v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    uint64_t v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  int v13 = (const void *)v21[3];
  if (v13) {
    CFRelease(v13);
  }
  [(ClientConnection *)self->_conn logAccessToObject:v8];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (void)CADOccurrenceCacheGetOccurrencesForCalendars:(id)a3 onDay:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, id))a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  conn = self->_conn;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply___block_invoke;
  v18[3] = &unk_1E624DBB0;
  v18[4] = self;
  id v19 = v8;
  id v20 = v11;
  id v13 = v11;
  id v14 = v8;
  if ([(ClientConnection *)conn withDatabaseForObjects:v10 perform:v18]) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 1010;
  }
  [v13 sortWithOptions:16 usingComparator:&__block_literal_global_30];
  v9[2](v9, v15, v13);

  uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v10];

  id v17 = [v13 CalMap:&__block_literal_global_29];
  [v16 addObjectsFromArray:v17];

  [(ClientConnection *)self->_conn logAccessToObjects:v16];
}

- (void)CADObject:(id)a3 getRelatedObjectsWithRelationName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectsWithRelationName_reply___block_invoke;
    v19[3] = &unk_1E624DBD8;
    uint64_t v23 = &v29;
    id v20 = v8;
    char v21 = self;
    id v22 = v9;
    uint64_t v24 = &v25;
    [(ClientConnection *)conn withDatabaseForObject:v20 perform:v19];
  }
  else
  {
    *((_DWORD *)v30 + 6) = 1013;
  }
  uint64_t v12 = (void *)v26[3];
  id v13 = self->_conn;
  id v14 = [v12 allObjects];
  uint64_t v15 = [v14 arrayByAddingObject:v8];
  [(ClientConnection *)v13 logAccessToObjects:v15];

  v10[2](v10, *((unsigned int *)v30 + 6), v12);
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
  id v17 = [v12 allObjects];
  uint64_t v18 = [v16 arrayWithArray:v17];

  if (v8) {
    [v18 addObject:v8];
  }
  [(ClientConnection *)self->_conn logAccessToObjects:v18];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

- (void)CADObject:(id)a3 getPropertiesWithNames:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertiesWithNames_reply___block_invoke;
  v15[3] = &unk_1E624DB88;
  id v12 = v8;
  id v16 = v12;
  id v17 = self;
  id v19 = &v27;
  id v20 = &v21;
  id v13 = v9;
  id v18 = v13;
  if ([(ClientConnection *)conn withDatabaseForObject:v12 perform:v15])
  {
    uint64_t v14 = *((unsigned int *)v28 + 6);
  }
  else
  {
    uint64_t v14 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
  }
  v10[2](v10, v14, v22[5]);
  [(ClientConnection *)self->_conn logAccessToObject:v12];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

- (void)CADObject:(id)a3 getNumberPropertyWithName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__CADXPCImplementation_CADObjectOperationGroup__CADObject_getNumberPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E624DBD8;
    id v18 = &v24;
    id v15 = v8;
    id v16 = self;
    id v17 = v9;
    id v19 = &v20;
    if (![(ClientConnection *)conn withDatabaseForObject:v15 perform:v14]) {
      *((_DWORD *)v25 + 6) = 1010;
    }

    uint64_t v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    uint64_t v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  id v13 = (const void *)v21[3];
  if (v13) {
    CFRelease(v13);
  }
  [(ClientConnection *)self->_conn logAccessToObject:v8];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (void)CADDatabaseShowsDeclinedEventsWithReply:(id)a3
{
  CFArrayRef v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v3 = CalShowDeclinedEvents();
  v4[2](v4, 0, v3);
}

uint64_t __71__CADXPCImplementation_CADSourceOperationGroup__constraintsData_error___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CalStoreGetMaxAlarmsSupported();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 36) = CalStoreGetMaxRecurrencesSupported();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = CalStoreGetStrictestEventPrivateValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFFELL | (CalStoreGetType() == 0);
  int v2 = CalStoreSupportsAlarmTriggerIntervals();
  uint64_t v3 = 2;
  if (!v2) {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFFDLL | v3;
  int v4 = CalStoreSupportsAlarmTriggerDates();
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFFBLL | v5;
  int started = CalStoreSupportsAlarmsTriggeringAfterStartDate();
  uint64_t v7 = 8;
  if (!started) {
    uint64_t v7 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFF7 | v7;
  int SupportsInvitationModifications = CalStoreGetSupportsInvitationModifications();
  uint64_t v9 = 2048;
  if (!SupportsInvitationModifications) {
    uint64_t v9 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFF7FFLL | v9;
  int v10 = CalStoreSupportsEventForwarding();
  uint64_t v11 = 4096;
  if (!v10) {
    uint64_t v11 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFEFFFLL | v11;
  int v12 = CalStoreAllowsProposeNewTime();
  uint64_t v13 = 0x40000000000000;
  if (!v12) {
    uint64_t v13 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFBFFFFFFFFFFFFFLL | v13;
  int v14 = CalEventResponseCommentsSupportedInStore();
  uint64_t v15 = 0x2000;
  if (!v14) {
    uint64_t v15 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFDFFFLL | v15;
  if (CalAttendeeIsStatusKnownForOrganizedEventsInStore()) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFDFLL | v16;
  if (CalAttendeeIsStatusKnownForInvitedEventsInStore()) {
    uint64_t v17 = 64;
  }
  else {
    uint64_t v17 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFBFLL | v17;
  int IsAccurateInStore = CalEventGetStatusIsAccurateInStore();
  uint64_t v19 = 128;
  if (!IsAccurateInStore) {
    uint64_t v19 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFF7FLL | v19;
  if (CalStoreGetSupportsIncomingInvitations()) {
    uint64_t v20 = 256;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFEFFLL | v20;
  __int16 v21 = 512;
  if (CalStoreGetSupportsOutgoingInvitations()) {
    uint64_t v22 = 512;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFDFFLL | v22;
  int v23 = CalStoreSupportsSharedCalendars();
  uint64_t v24 = 0x8000000000;
  if (!v23) {
    uint64_t v24 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFF7FFFFFFFFFLL | v24;
  int v25 = CalStoreSupportsPrivateEvents();
  uint64_t v26 = 0x40000000000;
  if (!v25) {
    uint64_t v26 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFBFFFFFFFFFFLL | v26;
  int v27 = CalStoreProhibitsPrivateEventsWithAttendees();
  uint64_t v28 = 0x80000000000;
  if (!v27) {
    uint64_t v28 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFF7FFFFFFFFFFLL | v28;
  int v29 = CalStoreSupportsAvailabilityRequests();
  uint64_t v30 = 0x100000000000;
  if (!v29) {
    uint64_t v30 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFEFFFFFFFFFFFLL | v30;
  int v31 = CalStoreSupportsIgnoringEventsInAvailabilityRequests();
  uint64_t v32 = 0x200000000000;
  if (!v31) {
    uint64_t v32 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFDFFFFFFFFFFFLL | v32;
  int v33 = CalStoreSupportsInboxAvailability();
  uint64_t v34 = 0x1000000000000;
  if (!v33) {
    uint64_t v34 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFEFFFFFFFFFFFFLL | v34;
  int v35 = CalStoreRequiresSamePrivacyLevelAcrossRecurrenceSeries();
  uint64_t v36 = 0x800000000000;
  if (!v35) {
    uint64_t v36 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFF7FFFFFFFFFFFLL | v36;
  int ProhibitsICSImport = CalStoreGetProhibitsICSImport();
  uint64_t v38 = 0x80000000000000;
  if (!ProhibitsICSImport) {
    uint64_t v38 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFF7FFFFFFFFFFFFFLL | v38;
  int v39 = CalStoreSupportsAutoGeocodingStructuredLocations();
  uint64_t v40 = 0x100000000000000;
  if (!v39) {
    uint64_t v40 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFEFFFFFFFFFFFFFFLL | v40;
  int SupportsJunkReporting = CalStoreGetSupportsJunkReporting();
  uint64_t v42 = 0x200000000000000;
  if (!SupportsJunkReporting) {
    uint64_t v42 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFDFFFFFFFFFFFFFFLL | v42;
  int SupportsPhoneNumbers = CalStoreGetSupportsPhoneNumbers();
  uint64_t v44 = 0x400000000000000;
  if (!SupportsPhoneNumbers) {
    uint64_t v44 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFBFFFFFFFFFFFFFFLL | v44;
  int v45 = CalStoreSupportsLocationDirectorySearches();
  uint64_t v46 = 0x400000000000;
  if (!v45) {
    uint64_t v46 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFBFFFFFFFFFFFLL | v46;
  int IsFacebook = CalStoreIsFacebook();
  uint64_t v48 = 0x10000000000;
  if (!IsFacebook) {
    uint64_t v48 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFEFFFFFFFFFFLL | v48;
  int MustIncludeMoreThanFirstOccurrence = CalStoreRecurrenceSeriesMustIncludeMoreThanFirstOccurrence();
  uint64_t v50 = 0x20000000000;
  if (!MustIncludeMoreThanFirstOccurrence) {
    uint64_t v50 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFDFFFFFFFFFFLL | v50;
  if (CalEventRequiresOutgoingInvitationsInDefaultCalendarInStore()) {
    uint64_t v51 = 1024;
  }
  else {
    uint64_t v51 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFBFFLL | v51;
  if (CalEventGetDeliverySourceOrExternalIDRequiredForResponseInStore()) {
    uint64_t v52 = 0x4000;
  }
  else {
    uint64_t v52 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFBFFFLL | v52;
  int ProposedStatusRequiredForResponseInStore = CalEventGetProposedStatusRequiredForResponseInStore();
  uint64_t v54 = 0x8000;
  if (!ProposedStatusRequiredForResponseInStore) {
    uint64_t v54 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFF7FFFLL | v54;
  int v55 = CalEventGetRejectedStatusChangeRequiresNoExternalStatusInStore();
  uint64_t v56 = 0x10000;
  if (!v55) {
    uint64_t v56 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFEFFFFLL | v56;
  int v57 = CalEventDurationConstrainedToRecurrenceIntervalInStore();
  uint64_t v58 = 0x20000;
  if (!v57) {
    uint64_t v58 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFDFFFFLL | v58;
  int MustOccurOnSeparateDaysInStore = CalEventGetOccurrencesMustOccurOnSeparateDaysInStore();
  uint64_t v60 = 0x80000;
  if (!MustOccurOnSeparateDaysInStore) {
    uint64_t v60 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFF7FFFFLL | v60;
  int FutureStartDateLimitedToOccurrenceCacheBoundsInStore = CalEventGetFutureStartDateLimitedToOccurrenceCacheBoundsInStore();
  uint64_t v62 = 0x100000;
  if (!FutureStartDateLimitedToOccurrenceCacheBoundsInStore) {
    uint64_t v62 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFEFFFFFLL | v62;
  int v63 = CalStoreSupportsRecurrencesOnDetachedEvents();
  uint64_t v64 = 0x200000;
  if (!v63) {
    uint64_t v64 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFDFFFFFLL | v64;
  int v65 = CalStoreAreRecurrencesPinnedToMonthDays();
  uint64_t v66 = 0x400000;
  if (!v65) {
    uint64_t v66 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFBFFFFFLL | v66;
  int MustAcknowledgeMasterEvent = CalStoreMustAcknowledgeMasterEvent();
  uint64_t v68 = 0x1000000;
  if (!MustAcknowledgeMasterEvent) {
    uint64_t v68 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFEFFFFFFLL | v68;
  if (CalStoreGetSupportsClearingPrivateComments()) {
    __int16 v69 = 0x8000;
  }
  else {
    __int16 v69 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = v69 & 0x8000 | *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 56) & 0x7FFF;
  int AvailabilitySupportedByStore = CalCalendarItemGetAvailabilitySupportedByStore();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)((AvailabilitySupportedByStore - 1) < 2) << 25);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)(AvailabilitySupportedByStore == 2) << 26);
  int v71 = CalAttendeeRequireSearchInSingleAccountInStore();
  uint64_t v72 = 0x800000;
  if (!v71) {
    uint64_t v72 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFF7FFFFFLL | v72;
  int UseDeletedByOrganizerStatusInStore = CalAttendeeGetUseDeletedByOrganizerStatusInStore();
  uint64_t v74 = 0x800000000000000;
  if (!UseDeletedByOrganizerStatusInStore) {
    uint64_t v74 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xF7FFFFFFFFFFFFFFLL | v74;
  int v75 = CalStoreRequiresMSFormattedUIDKey();
  uint64_t v76 = 0x8000000;
  if (!v75) {
    uint64_t v76 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFF7FFFFFFLL | v76;
  int v77 = CalEventCancelDeletedEventsInStore();
  uint64_t v78 = 0x10000000;
  if (!v77) {
    uint64_t v78 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFEFFFFFFFLL | v78;
  int v79 = CalEventDeclineDeletedInvitationsInStore();
  uint64_t v80 = 0x20000000;
  if (!v79) {
    uint64_t v80 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFDFFFFFFFLL | v80;
  int v81 = CalStoreSupportsStructuredLocations();
  uint64_t v82 = 0x40000000;
  if (!v81) {
    uint64_t v82 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFBFFFFFFFLL | v82;
  int v83 = CalStoreSupportsReminderActions();
  uint64_t v84 = 0x80000000;
  if (!v83) {
    uint64_t v84 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFF7FFFFFFFLL | v84;
  int v85 = CalStoreSupportsReminderLocations();
  uint64_t v86 = 0x100000000;
  if (!v85) {
    uint64_t v86 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFEFFFFFFFFLL | v86;
  int v87 = CalStoreSupportsAlarmProximity();
  uint64_t v88 = 0x200000000;
  if (!v87) {
    uint64_t v88 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFDFFFFFFFFLL | v88;
  int v89 = CalStoreAllowsCalendarAddDeleteModify();
  uint64_t v90 = 0x400000000;
  if (!v89) {
    uint64_t v90 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFBFFFFFFFFLL | v90;
  int v91 = CalStoreAllowsTasks();
  uint64_t v92 = 0x800000000;
  if (!v91) {
    uint64_t v92 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFF7FFFFFFFFLL | v92;
  int v93 = CalStoreAllowsEvents();
  uint64_t v94 = 0x1000000000;
  if (!v93) {
    uint64_t v94 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFEFFFFFFFFFLL | v94;
  int v95 = CalEventURLFieldSupportedInStore();
  uint64_t v96 = 0x2000000000;
  if (!v95) {
    uint64_t v96 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFDFFFFFFFFFLL | v96;
  int v97 = CalTaskAllDayDueDatesSupportedInStore();
  uint64_t v98 = 0x4000000000;
  if (!v97) {
    uint64_t v98 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFBFFFFFFFFFLL | v98;
  if (CalStoreSnoozeAlarmRequiresDetach()) {
    uint64_t v99 = 16;
  }
  else {
    uint64_t v99 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFFFFFFFFFFFFEFLL | v99;
  int v100 = CalStoreProhibitsMultipleDaysInMonthlyRecurrence();
  uint64_t v101 = 0x4000000000000;
  if (!v100) {
    uint64_t v101 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFBFFFFFFFFFFFFLL | v101;
  int v102 = CalStoreProhibitsMultipleMonthsInYearlyRecurrence();
  uint64_t v103 = 0x2000000000000;
  if (!v102) {
    uint64_t v103 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFFDFFFFFFFFFFFFLL | v103;
  int v104 = CalStoreProhibitsYearlyRecurrenceInterval();
  uint64_t v105 = 0x8000000000000;
  if (!v104) {
    uint64_t v105 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFF7FFFFFFFFFFFFLL | v105;
  int v106 = CalStoreProhibitsDetachmentOnCommentChange();
  uint64_t v107 = 0x20000000000000;
  if (!v106) {
    uint64_t v107 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFDFFFFFFFFFFFFFLL | v107;
  int v108 = CalStoreRequiresOccurrencesConformToRecurrenceRule();
  uint64_t v109 = 0x10000000000000;
  if (!v108) {
    uint64_t v109 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xFFEFFFFFFFFFFFFFLL | v109;
  int v110 = CalStoreProhibitsSlicingEventsWithAttendees();
  uint64_t v111 = 0x1000000000000000;
  if (!v110) {
    uint64_t v111 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xEFFFFFFFFFFFFFFFLL | v111;
  int v112 = CalStoreSupportsAttachments();
  uint64_t v113 = 0x4000000000000000;
  if (!v112) {
    uint64_t v113 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xBFFFFFFFFFFFFFFFLL | v113;
  if (CalStoreRequiresOpeningAttachmentAsLink()) {
    __int16 v114 = 16;
  }
  else {
    __int16 v114 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFFEF | v114;
  if (CalStoreShouldUseDeleteAndAddInsteadOfMoveBetweenCalendars()) {
    __int16 v115 = 32;
  }
  else {
    __int16 v115 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFFDF | v115;
  int v116 = CalStoreSupportsDelegation();
  unint64_t v117 = 0x8000000000000000;
  if (!v116) {
    unint64_t v117 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v117 & 0x8000000000000000 | *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) & 0x7FFFFFFFFFFFFFFFLL;
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFFFE | (CalStoreSupportsDelegateEnumeration() != 0);
  if (CalStoreSupportsInvitationModificationsWithoutNotification()) {
    __int16 v118 = 64;
  }
  else {
    __int16 v118 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFFBF | v118;
  if (CalStoreSupportsFloatingTimeZone()) {
    __int16 v119 = 2;
  }
  else {
    __int16 v119 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFFFD | v119;
  int v120 = CalStoreSupportsSubscriptionCalendars();
  uint64_t v121 = 0x2000000000000000;
  if (!v120) {
    uint64_t v121 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 48) & 0xDFFFFFFFFFFFFFFFLL | v121;
  if (CalStoreSupportsManagedSubscriptionCalendars()) {
    __int16 v122 = 128;
  }
  else {
    __int16 v122 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFF7F | v122;
  if (CalStoreSupportsSubscriptionMirroring()) {
    __int16 v123 = 256;
  }
  else {
    __int16 v123 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFEFF | v123;
  v124 = CalDatabaseGetPreferences();
  if ((objc_msgSend(v124, "get_overrideParticipantRoleConstraint") & 1) == 0)
  {
    if (CalStoreSupportsParticipantRoles()) {
      __int16 v21 = 512;
    }
    else {
      __int16 v21 = 0;
    }
  }
  uint64_t v125 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v126 = *(_WORD *)(v125 + 56) & 0xFDFF | v21;
  *(void *)(v125 + 48) = *(void *)(v125 + 48);
  *(_WORD *)(v125 + 56) = v126;

  if (CalStoreProhibitsUsingEventOrganizerEmailWhenComposingMail()) {
    __int16 v127 = 4;
  }
  else {
    __int16 v127 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFFFB | v127;
  if (CalStoreSupportsRecurrenceSplit()) {
    __int16 v128 = 8;
  }
  else {
    __int16 v128 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFFF7 | v128;
  if (CalStoreSupportsPush()) {
    __int16 v129 = 1024;
  }
  else {
    __int16 v129 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xFBFF | v129;
  if (CalStoreSupportsTravelTime()) {
    __int16 v130 = 2048;
  }
  else {
    __int16 v130 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xF7FF | v130;
  if (CalStoreRequiresSeparateFilesForAllAttachments()) {
    __int16 v131 = 4096;
  }
  else {
    __int16 v131 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xEFFF | v131;
  if (CalEventGetOccurrenceOrderEnforcedAfterDetachmentInStore()) {
    __int16 v132 = 0x2000;
  }
  else {
    __int16 v132 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xDFFF | v132;
  if (CalStoreAllowsPrivateEventAccessByDelegate()) {
    __int16 v133 = 0x4000;
  }
  else {
    __int16 v133 = 0;
  }
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) & 0xBFFF | v133;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = CalStoreGetType() == 1;
  uint64_t result = CalStoreGetType();
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) |= 0x40000000uLL;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) |= 0x80000000uLL;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) |= 0x100000000uLL;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) |= 0x200000000uLL;
  }
  return result;
}

- (id)_accountStoreForBackupRestore
{
  uint64_t v3 = [MEMORY[0x1E4F57448] sharedInstance];
  int v4 = [(ClientConnection *)self->_conn databaseInitializationOptions];
  int v5 = [v4 unitTesting];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F57458] storeFilteringAllChangesInBackingAccountStore:v3];

    uint64_t v3 = (void *)v6;
  }
  return v3;
}

- (void)CADBackupToICBU:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  id v8 = [v6 url];
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "nil icbu URL given for backup", (uint8_t *)&buf, 2u);
    }
    goto LABEL_11;
  }
  if (([v8 startAccessingSecurityScopedResource] & 1) == 0)
  {
    int v14 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for backup icbu destination: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_11:
    v7[2](v7, 1001);
    goto LABEL_12;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x2020000000;
  conn = self->_conn;
  int v21 = 1015;
  uint64_t v11 = *MEMORY[0x1E4F574B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupToICBU_reply___block_invoke;
  v15[3] = &unk_1E624D9A8;
  id v12 = v9;
  id v16 = v12;
  uint64_t v17 = self;
  p_long long buf = &buf;
  if (![(ClientConnection *)conn withDatabaseID:v11 perform:v15]) {
    *(_DWORD *)(*((void *)&buf + 1) + 24) = 1007;
  }

  [v12 stopAccessingSecurityScopedResource];
  v7[2](v7, *(unsigned int *)(*((void *)&buf + 1) + 24));
  _Block_object_dispose(&buf, 8);
LABEL_12:
}

void __78__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupToICBU_reply___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 40) _accountStoreForBackupRestore];
  int v3 = CalDatabaseBackupToICBU();

  if (v3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)CADBackupDatabaseToFileNamed:(id)a3 inDirectory:(id)a4 includeAttachments:(BOOL)a5 reply:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  if ([v10 length])
  {
    uint64_t v13 = [v11 url];
    int v14 = v13;
    if (v13)
    {
      if ([v13 startAccessingSecurityScopedResource])
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v27 = 0x2020000000;
        int v28 = 1015;
        uint64_t v15 = [v14 URLByAppendingPathComponent:v10];
        conn = self->_conn;
        uint64_t v17 = *MEMORY[0x1E4F574B8];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __122__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupDatabaseToFileNamed_inDirectory_includeAttachments_reply___block_invoke;
        v22[3] = &unk_1E624D9D0;
        BOOL v25 = a5;
        id v18 = v15;
        id v23 = v18;
        p_long long buf = &buf;
        if (![(ClientConnection *)conn withDatabaseID:v17 perform:v22]) {
          *(_DWORD *)(*((void *)&buf + 1) + 24) = 1007;
        }

        [v14 stopAccessingSecurityScopedResource];
        v12[2](v12, *(unsigned int *)(*((void *)&buf + 1) + 24));
        _Block_object_dispose(&buf, 8);
        goto LABEL_16;
      }
      int v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for backup destination directory: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v20 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_ERROR, "nil destination directory URL given for backup", (uint8_t *)&buf, 2u);
      }
    }
    v12[2](v12, 1001);
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v19 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_ERROR, "No file name given for backup", (uint8_t *)&buf, 2u);
  }
  v12[2](v12, 1001);
LABEL_17:
}

uint64_t __122__CADXPCImplementation_CADBackupRestoreOperationGroup__CADBackupDatabaseToFileNamed_inDirectory_includeAttachments_reply___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t result = CalDatabaseBackupDatabaseFileAndAttachments();
    if ((result & 1) == 0) {
      return result;
    }
  }
  else
  {
    uint64_t result = CalDatabaseBackupDatabaseFile();
    if (!result) {
      return result;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (BOOL)_performRestoreOperation:(id)a3
{
  int v4 = (uint64_t (**)(id, int *))a3;
  int v11 = -1;
  int v5 = [(ClientConnection *)self->_conn databaseInitializationOptions];
  int v6 = [v5 unitTesting];

  if (v6)
  {
    LOBYTE(v7) = v4[2](v4, &v11);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F5E950] sharedConnection];
    uint64_t v9 = [v8 requestDaemonStopMonitoringAgents];
    int v7 = v4[2](v4, &v11);
    [v8 requestDaemonStartMonitoringAgentsWithToken:v9];
  }
  return v7;
}

- (void)CADRestoreFromDatabaseBackupFileNamed:(id)a3 inDirectory:(id)a4 includeAttachments:(BOOL)a5 reply:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 length])
  {
    uint64_t v13 = [v11 url];
    int v14 = v13;
    if (v13)
    {
      if ([v13 startAccessingSecurityScopedResource])
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v32 = 0x2020000000;
        int v33 = 1015;
        uint64_t v27 = 0;
        int v28 = &v27;
        uint64_t v29 = 0x2020000000;
        int v30 = -1;
        uint64_t v15 = [v14 URLByAppendingPathComponent:v10];
        conn = self->_conn;
        uint64_t v17 = *MEMORY[0x1E4F574B8];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke;
        v22[3] = &unk_1E624DA20;
        void v22[4] = self;
        BOOL v26 = a5;
        id v18 = v15;
        id v23 = v18;
        uint64_t v24 = &v27;
        p_long long buf = &buf;
        if (![(ClientConnection *)conn withDatabaseID:v17 perform:v22]) {
          *(_DWORD *)(*((void *)&buf + 1) + 24) = 1007;
        }

        [v14 stopAccessingSecurityScopedResource];
        (*((void (**)(id, void, void))v12 + 2))(v12, *(unsigned int *)(*((void *)&buf + 1) + 24), *((unsigned int *)v28 + 6));
        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&buf, 8);
        goto LABEL_16;
      }
      int v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for backup directory to be restored: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v20 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_ERROR, "nil backup directory URL given for restore", (uint8_t *)&buf, 2u);
      }
    }
    (*((void (**)(id, uint64_t, uint64_t))v12 + 2))(v12, 1001, 0xFFFFFFFFLL);
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v19 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_ERROR, "No backup database file name given for restore", (uint8_t *)&buf, 2u);
  }
  (*((void (**)(id, uint64_t, uint64_t))v12 + 2))(v12, 1001, 0xFFFFFFFFLL);
LABEL_17:
}

void __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke_2;
  v7[3] = &unk_1E624D9F8;
  char v11 = *(unsigned char *)(a1 + 64);
  uint64_t v10 = a3;
  int v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  if ([v4 _performRestoreOperation:v7]) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

uint64_t __131__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply___block_invoke_2(uint64_t a1, _DWORD *a2)
{
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t result = CalDatabaseRestoreFromBackupDatabaseFileAndAttachments();
  }
  else {
    uint64_t result = CalDatabaseRestoreFromBackupDatabaseFile();
  }
  *a2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)CADRestoreFromICBU:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v8 = [v6 url];
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "nil icbu URL given for restore", (uint8_t *)&buf, 2u);
    }
    goto LABEL_11;
  }
  if (([v8 startAccessingSecurityScopedResource] & 1) == 0)
  {
    int v14 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_ERROR, "Failed to get access to security-scoped URL for icbu to be restored: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_11:
    v7[2](v7, 1001, 0xFFFFFFFFLL);
    goto LABEL_12;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000;
  int v29 = 1015;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = -1;
  conn = self->_conn;
  uint64_t v11 = *MEMORY[0x1E4F574B8];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke;
  id v18 = &unk_1E624DA70;
  uint64_t v19 = self;
  id v12 = v9;
  id v20 = v12;
  int v21 = &v23;
  p_long long buf = &buf;
  if (![(ClientConnection *)conn withDatabaseID:v11 perform:&v15]) {
    *(_DWORD *)(*((void *)&buf + 1) + 24) = 1007;
  }

  objc_msgSend(v12, "stopAccessingSecurityScopedResource", v15, v16, v17, v18, v19);
  v7[2](v7, *(unsigned int *)(*((void *)&buf + 1) + 24), *((unsigned int *)v24 + 6));
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);
LABEL_12:
}

void __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) _accountStoreForBackupRestore];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke_2;
  v9[3] = &unk_1E624DA48;
  uint64_t v13 = a3;
  id v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  if ([v6 _performRestoreOperation:v9]) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

uint64_t __81__CADXPCImplementation_CADBackupRestoreOperationGroup__CADRestoreFromICBU_reply___block_invoke_2(uint64_t a1, _DWORD *a2)
{
  uint64_t result = CalDatabaseRestoreFromICBU();
  *a2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return result;
}

- (void)CADDatabaseGetAlarmWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (v6)
  {
    conn = self->_conn;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __88__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmWithUUID_reply___block_invoke;
    int v14 = &unk_1E624DAC0;
    id v15 = v6;
    uint64_t v16 = &v17;
    [(ClientConnection *)conn withAllDatabasesPerform:&v11];
    if (v18[5]) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 1010;
    }
    v8[2](v8, v10);
    -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v18[5], v11, v12, v13, v14);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1001, 0);
  }
  _Block_object_dispose(&v17, 8);
}

void __88__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmWithUUID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = CalDatabaseCopyAlarmWithUUID();
  if (v6)
  {
    id v7 = (const void *)v6;
    uint64_t v8 = CADEntityCopyObjectID();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    CFRelease(v7);
    *a4 = 1;
  }
}

- (void)CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = (void (**)(id, void, id))a3;
  uint64_t v6 = [v4 array];
  id v7 = objc_opt_new();
  conn = self->_conn;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke;
  v11[3] = &unk_1E624DB10;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(ClientConnection *)conn withAllDatabasesPerform:v11];
  v5[2](v5, 0, v9);

  [(ClientConnection *)self->_conn logAccessToObjects:v10];
}

void __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke_2;
  v8[3] = &unk_1E624DAE8;
  uint64_t v6 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v7 = [v6 _getAlarmOccurrencesFromAlarmCacheForDatabase:a3 databaseID:a2 accessLogger:v8];
  [*(id *)(a1 + 48) addObjectsFromArray:v7];
}

uint64_t __108__CADXPCImplementation_CADAlarmEngineOperationGroup__CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_getAlarmOccurrencesFromAlarmCacheForDatabase:(CalDatabase *)a3 databaseID:(int)a4 accessLogger:(id)a5
{
  uint64_t v42 = (void (**)(id, void *))a5;
  id v41 = [MEMORY[0x1E4F1CA48] array];
  CFArrayRef theArray = (const __CFArray *)CalDatabaseCopyAlarmOccurrencesFromAlarmCache();
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFTimeZoneRef cf = CFTimeZoneCreateWithName(0, @"UTC", 1u);
    CFTypeRef v39 = (CFTypeRef)CalCopyTimeZone();
    CFIndex v45 = Count;
    if (Count >= 1)
    {
      CFIndex v6 = 0;
      while (1)
      {
        CFArrayGetValueAtIndex(theArray, v6);
        CalAlarmOccurrenceGetAlarm();
        uint64_t v7 = CalAlarmCopyOwningEntity();
        if (v7) {
          break;
        }
LABEL_30:
        if (v45 == ++v6) {
          goto LABEL_31;
        }
      }
      uint64_t v8 = (const void *)v7;
      int Type = CalEntityGetType();
      if (Type == 1)
      {
        if ([(ClientConnection *)self->_conn reminderAccessGranted])
        {
          uint64_t v11 = CalCalendarCopyURI();
LABEL_19:
          uint64_t v17 = 0;
          uint64_t started = 0;
LABEL_27:
          id v22 = (void *)MEMORY[0x1E4F1C9C8];
          CalAlarmOccurrenceGetFireDate();
          uint64_t v24 = [v22 dateWithTimeIntervalSinceReferenceDate:floor(v23)];
          uint64_t v25 = (void *)CalAlarmCopyUUID();
          int v26 = (void *)MEMORY[0x1E4F1C9C8];
          CalAlarmGetAcknowledgedDate();
          v47 = [v26 dateWithTimeIntervalSinceReferenceDate:floor(v27)];
          uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:4 entityID:CalAlarmGetUID() databaseID:a4];
          int v29 = CADEntityCopyObjectID();
          uint64_t v30 = (void *)started;
          int v31 = (void *)v11;
          if (v29)
          {
            uint64_t v44 = v17;
            uint64_t v32 = [[EKAlarmOccurrence alloc] initWithAlarmID:v28 ownerID:v29 ownerDate:v17 ownerTimeZone:v30 ownerURI:v11 fireDate:v24 externalID:v25 acknowledgedDate:v47];
            [(EKAlarmOccurrence *)v32 dictionaryRepresentation];
            int v33 = v25;
            uint64_t v34 = v24;
            v36 = int v35 = v8;
            [v41 addObject:v36];
            v42[2](v42, v29);

            uint64_t v8 = v35;
            uint64_t v24 = v34;
            uint64_t v25 = v33;

            uint64_t v17 = v44;
          }
          CFRelease(v8);

          goto LABEL_30;
        }
      }
      else if (Type == 3)
      {
        if ([(ClientConnection *)self->_conn reminderAccessGranted])
        {
          uint64_t v12 = CalTaskCopyDueDate();
          if (v12)
          {
            id v13 = (const void *)v12;
            double v14 = MEMORY[0x1C1864B60]();
            uint64_t started = CalTaskCopyDueDateTimeZone();
            if (!started)
            {
              CalAbsoluteTimeGetAbsoluteTimeInTimeZone();
              double v14 = v16;
            }
            uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:floor(v14)];
            CFRelease(v13);
          }
          else
          {
            uint64_t v17 = 0;
            uint64_t started = 0;
          }
          uint64_t v21 = CalTaskCopyURI();
          goto LABEL_26;
        }
      }
      else if (Type == 2 && [(ClientConnection *)self->_conn eventAccessLevel])
      {
        if (CalAlarmOccurrenceGetEventOccurrence())
        {
          CalEventOccurrenceGetDate();
        }
        else
        {
          CalEventGetStartDate();
          double v19 = v18;
          if (!CalCalendarItemIsFloating())
          {
LABEL_23:
            uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:floor(v19)];
            uint64_t started = CalEventCopyStartTimeZone();
            uint64_t v17 = (void *)v20;
            uint64_t v21 = CalEventCopyURI();
LABEL_26:
            uint64_t v11 = v21;
            goto LABEL_27;
          }
          CalAbsoluteTimeGetAbsoluteTimeInTimeZone();
        }
        double v19 = v10;
        goto LABEL_23;
      }
      uint64_t v11 = 0;
      goto LABEL_19;
    }
LABEL_31:
    if (cf) {
      CFRelease(cf);
    }
    if (v39) {
      CFRelease(v39);
    }
    CFRelease(theArray);
  }

  return v41;
}

- (void)CADObjectsExist:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  double v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  conn = self->_conn;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectsExist_reply___block_invoke;
  v9[3] = &unk_1E624DB60;
  void v9[4] = self;
  v9[5] = &v10;
  [(ClientConnection *)conn withDatabaseForObjects:v6 options:1 perform:v9];
  v7[2](v7, 0, v11[5]);
  [(ClientConnection *)self->_conn logAccessToObjects:v6];
  _Block_object_dispose(&v10, 8);
}

void __71__CADXPCImplementation_CADObjectOperationGroup__CADObjectsExist_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((CADEntityExistsInDatabaseAndIsAccessible(a4, *(void **)(*(void *)(a1 + 32) + 8), v12, 0) & 1) == 0)
          {
            id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            if (!v13)
            {
              uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
              uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
              double v16 = *(void **)(v15 + 40);
              *(void *)(v15 + 40) = v14;

              id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            }
            [v13 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v17)
    {
      [v17 addObjectsFromArray:v7];
    }
    else
    {
      uint64_t v18 = [v7 mutableCopy];
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
}

- (void)CADObjects:(id)a3 getPropertiesWithNames:(id)a4 reply:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v9 = (void (**)(id, void, id))a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v11, "count"));
  id v13 = [[CADFetchedObjectSerializer alloc] initWithConnection:self->_conn defaultPropertiesToLoad:v10];

  conn = self->_conn;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__CADXPCImplementation_CADObjectOperationGroup__CADObjects_getPropertiesWithNames_reply___block_invoke;
  v17[3] = &unk_1E624DBB0;
  v17[4] = self;
  uint64_t v18 = v13;
  id v19 = v12;
  id v15 = v12;
  double v16 = v13;
  [(ClientConnection *)conn withDatabaseForObjects:v11 options:1 perform:v17];
  v9[2](v9, 0, v15);

  [(ClientConnection *)self->_conn logAccessToObjects:v11];
}

void __89__CADXPCImplementation_CADObjectOperationGroup__CADObjects_getPropertiesWithNames_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!a4) {
          goto LABEL_10;
        }
        id v11 = CADCopyEntityInDatabase(a4, *(void **)(*((void *)&v16 + 1) + 8 * v10));
        if (!v11) {
          goto LABEL_10;
        }
        uint64_t v12 = v11;
        if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 32) + 8), v11, 0))
        {
          CFRelease(v12);
LABEL_10:
          id v13 = *(void **)(a1 + 48);
LABEL_11:
          uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
          goto LABEL_12;
        }
        uint64_t v14 = [*(id *)(a1 + 40) addEntity:v12];
        CFRelease(v12);
        id v13 = *(void **)(a1 + 48);
        if (!v14) {
          goto LABEL_11;
        }
LABEL_12:
        [v13 addObject:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }
}

- (void)CADObject:(id)a3 getPropertyWithName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E624DBD8;
    long long v18 = &v24;
    id v15 = v8;
    long long v16 = self;
    id v17 = v9;
    long long v19 = &v20;
    if (![(ClientConnection *)conn withDatabaseForObject:v15 perform:v14]) {
      *((_DWORD *)v25 + 6) = 1010;
    }

    uint64_t v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    uint64_t v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  id v13 = (const void *)v21[3];
  if (v13) {
    CFRelease(v13);
  }
  [(ClientConnection *)self->_conn logAccessToObject:v8];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __85__CADXPCImplementation_CADObjectOperationGroup__CADObject_getPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    id v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        uint64_t v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          id v9 = *(void **)(a1 + 32);
          uint64_t v10 = v7;
          LODWORD(v9) = [v9 entityID];
          int v11 = [*(id *)(a1 + 32) entityType];
          int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v13 = 138544130;
          uint64_t v14 = v8;
          __int16 v15 = 1024;
          int v16 = (int)v9;
          __int16 v17 = 1024;
          int v18 = v11;
          __int16 v19 = 1024;
          int v20 = v12;
          _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Error getting object value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADObject:(id)a3 getDataPropertyWithName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDataPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E624DBD8;
    int v18 = &v24;
    id v15 = v8;
    int v16 = self;
    id v17 = v9;
    __int16 v19 = &v20;
    if (![(ClientConnection *)conn withDatabaseForObject:v15 perform:v14]) {
      *((_DWORD *)v25 + 6) = 1010;
    }

    uint64_t v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    uint64_t v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  int v13 = (const void *)v21[3];
  if (v13) {
    CFRelease(v13);
  }
  [(ClientConnection *)self->_conn logAccessToObject:v8];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __89__CADXPCImplementation_CADObjectOperationGroup__CADObject_getDataPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    id v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v6 && v6 != 1010)
      {
        uint64_t v7 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          id v9 = *(void **)(a1 + 32);
          uint64_t v10 = v7;
          LODWORD(v9) = [v9 entityID];
          int v11 = [*(id *)(a1 + 32) entityType];
          int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v13 = 138544130;
          uint64_t v14 = v8;
          __int16 v15 = 1024;
          int v16 = (int)v9;
          __int16 v17 = 1024;
          int v18 = v11;
          __int16 v19 = 1024;
          int v20 = v12;
          _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Error getting string value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (BOOL)_requiresSpecialEntitlementToReadSecurityScopedURLWrapperForProperty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F56B30]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F56B28]] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:*MEMORY[0x1E4F56B38]] ^ 1;
  }

  return v4;
}

- (void)CADObject:(id)a3 getSecurityScopedURLWrapperPropertyWithName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __109__CADXPCImplementation_CADObjectOperationGroup__CADObject_getSecurityScopedURLWrapperPropertyWithName_reply___block_invoke;
    v14[3] = &unk_1E624DC00;
    id v15 = v8;
    int v16 = self;
    int v18 = &v24;
    id v17 = v9;
    __int16 v19 = &v20;
    if (![(ClientConnection *)conn withDatabaseForObject:v15 perform:v14]) {
      *((_DWORD *)v25 + 6) = 1010;
    }

    uint64_t v12 = *((unsigned int *)v25 + 6);
  }
  else
  {
    uint64_t v12 = 1013;
    *((_DWORD *)v25 + 6) = 1013;
  }
  v10[2](v10, v12, v21[3]);
  int v13 = (const void *)v21[3];
  if (v13) {
    CFRelease(v13);
  }
  [(ClientConnection *)self->_conn logAccessToObject:v8];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __109__CADXPCImplementation_CADObjectOperationGroup__CADObject_getSecurityScopedURLWrapperPropertyWithName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) permissionValidator];
  if (v4)
  {
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0)
      || ([v5 canAccessDatabaseBookmarks] & 1) == 0
      && [*(id *)(a1 + 40) _requiresSpecialEntitlementToReadSecurityScopedURLWrapperForProperty:*(void *)(a1 + 48)])
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v4, *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24));
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v6)
      {
        if (v6 != 1010)
        {
          uint64_t v7 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            uint64_t v8 = *(void *)(a1 + 48);
            id v9 = *(void **)(a1 + 32);
            uint64_t v10 = v7;
            LODWORD(v9) = [v9 entityID];
            int v11 = [*(id *)(a1 + 32) entityType];
            int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            int v13 = 138544130;
            uint64_t v14 = v8;
            __int16 v15 = 1024;
            int v16 = (int)v9;
            __int16 v17 = 1024;
            int v18 = v11;
            __int16 v19 = 1024;
            int v20 = v12;
            _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Error getting SecurityScopedURLWrapper value for property %{public}@ of object ID {%i, %i}: %i", (uint8_t *)&v13, 0x1Eu);
          }
        }
      }
    }
    CFRelease(v4);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADObject:(id)a3 getRelatedObjectWithRelationName:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  if (CADObjectPassedOrSkippedAccessCheck(v8, self->_conn))
  {
    conn = self->_conn;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectWithRelationName_reply___block_invoke;
    v15[3] = &unk_1E624DBD8;
    __int16 v19 = &v27;
    id v16 = v8;
    __int16 v17 = self;
    id v18 = v9;
    int v20 = &v21;
    if (![(ClientConnection *)conn withDatabaseForObject:v16 perform:v15]) {
      *((_DWORD *)v28 + 6) = 1010;
    }

    uint64_t v12 = *((unsigned int *)v28 + 6);
  }
  else
  {
    uint64_t v12 = 1013;
    *((_DWORD *)v28 + 6) = 1013;
  }
  v10[2](v10, v12, v22[5]);
  int v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v14 = v13;
  if (v8) {
    [v13 addObject:v8];
  }
  if (v22[5]) {
    objc_msgSend(v14, "addObject:");
  }
  [(ClientConnection *)self->_conn logAccessToObjects:v14];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void __98__CADXPCImplementation_CADObjectOperationGroup__CADObject_getRelatedObjectWithRelationName_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    id v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
    }
    else
    {
      CFTypeRef cf = 0;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CalEntityCopyProperty(*(void **)(*(void *)(a1 + 40) + 8), (uint64_t)v5, *(void **)(a1 + 48), &cf);
      if (cf)
      {
        uint64_t v6 = CADEntityCopyObjectID();
        uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
        id v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;

        CFRelease(cf);
      }
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v9 && v9 != 1010)
      {
        uint64_t v10 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 48);
          uint64_t v12 = *(void **)(a1 + 32);
          int v13 = v10;
          LODWORD(v12) = [v12 entityID];
          int v14 = [*(id *)(a1 + 32) entityType];
          int v15 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          *(_DWORD *)long long buf = 138544130;
          uint64_t v18 = v11;
          __int16 v19 = 1024;
          int v20 = (int)v12;
          __int16 v21 = 1024;
          int v22 = v14;
          __int16 v23 = 1024;
          int v24 = v15;
          _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "Error getting related value for property %{public}@ of object ID {%i, %i}: %i", buf, 0x1Eu);
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADObjectIsManaged:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  conn = self->_conn;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  int v13 = __74__CADXPCImplementation_CADObjectOperationGroup__CADObjectIsManaged_reply___block_invoke;
  int v14 = &unk_1E624DC28;
  id v9 = v6;
  id v15 = v9;
  id v16 = self;
  __int16 v17 = &v23;
  uint64_t v18 = &v19;
  if ([(ClientConnection *)conn withDatabaseForObject:v9 perform:&v11])
  {
    uint64_t v10 = *((unsigned int *)v24 + 6);
  }
  else
  {
    uint64_t v10 = 1010;
    *((_DWORD *)v24 + 6) = 1010;
  }
  v7[2](v7, v10, *((unsigned __int8 *)v20 + 24));
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v9, v11, v12, v13, v14);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void __74__CADXPCImplementation_CADObjectOperationGroup__CADObjectIsManaged_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    id v5 = v4;
    if (CADEntityIsInRestrictedStore(*(void **)(*(void *)(a1 + 40) + 8), v4, 0)) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1013;
    }
    else {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CADEntityIsInManagedStore(*(void **)(*(void *)(a1 + 40) + 8), v5);
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetErrorCount:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  conn = self->_conn;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetErrorCount___block_invoke;
  v6[3] = &unk_1E624DC50;
  v6[4] = &v11;
  v6[5] = &v7;
  [(ClientConnection *)conn withAllDatabasesPerform:v6];
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned int *)v12 + 6), *((unsigned int *)v8 + 6));
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

void __73__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetErrorCount___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)CalDatabaseCopyAllErrors();
  if (v2)
  {
    CFArrayRef v3 = v2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += CFArrayGetCount(v2);
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1015;
  }
}

- (void)CADDatabaseGetEventsWithErrorsPerSource:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v5 = objc_opt_new();
  conn = self->_conn;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetEventsWithErrorsPerSource___block_invoke;
  v8[3] = &unk_1E624DC78;
  id v9 = v5;
  id v7 = v5;
  [(ClientConnection *)conn withAllDatabasesPerform:v8];
  v4[2](v4, 0, v7);

  [(ClientConnection *)self->_conn logAccessToObjects:v7];
}

void __88__CADXPCImplementation_CADErrorOperationGroup__CADDatabaseGetEventsWithErrorsPerSource___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = CalDatabaseGetIDOfOneEventWithAnErrorPerSource();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [*(id *)(a1 + 32) addObject:v7];
        id v8 = *(void **)(a1 + 32);
        id v9 = [v2 objectForKeyedSubscript:v7];
        [v8 addObject:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)CADDatabaseGetSharedCalendarInvitationsWithReply:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = (void (**)(id, void, id))a3;
  id v6 = [v4 array];
  conn = self->_conn;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __111__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetSharedCalendarInvitationsWithReply___block_invoke;
  long long v12 = &unk_1E624DCA0;
  long long v13 = self;
  id v14 = v6;
  id v8 = v6;
  [(ClientConnection *)conn withAllDatabasesPerform:&v9];
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8, v9, v10, v11, v12, v13);
}

void __111__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetSharedCalendarInvitationsWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  CFArrayRef v4 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        if (CalendarCanContainAnAllowedEntityType((uint64_t)ValueAtIndex, *(void **)(*(void *)(a1 + 32) + 8)))
        {
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:1 entityID:CalCalendarGetUID() databaseID:a2];
          [*(id *)(a1 + 40) addObject:v10];
        }
      }
    }
    CFRelease(v5);
  }
}

- (void)CADCalendarSetClearedFromNotificationCenter:(id)a3 error:(id)a4
{
  id v6 = a3;
  CFIndex v7 = (void (**)(id, uint64_t))a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADCalendarSetClearedFromNotificationCenter_error___block_invoke;
  v11[3] = &unk_1E624DCC8;
  id v9 = v6;
  long long v13 = self;
  id v14 = &v15;
  id v12 = v9;
  if ([(ClientConnection *)conn withDatabaseForObject:v9 perform:v11])
  {
    uint64_t v10 = *((unsigned int *)v16 + 6);
  }
  else
  {
    uint64_t v10 = 1010;
    *((_DWORD *)v16 + 6) = 1010;
  }
  v7[2](v7, v10);
  [(ClientConnection *)self->_conn logAccessToObject:v9];

  _Block_object_dispose(&v15, 8);
}

void __112__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADCalendarSetClearedFromNotificationCenter_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFArrayRef v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (!v4)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1010;
    return;
  }
  CFArrayRef v5 = v4;
  if ((![*(id *)(*(void *)(a1 + 40) + 8) eventAccessLevel]
     || (CalCalendarCanContainEntityType() & 1) == 0)
    && (![*(id *)(*(void *)(a1 + 40) + 8) reminderAccessGranted]
     || !CalCalendarCanContainEntityType()))
  {
    int v6 = 1013;
    goto LABEL_10;
  }
  CalCalendarSetInvitationStatus();
  if ((CalDatabaseSave() & 1) == 0)
  {
    int v6 = 1007;
LABEL_10:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  }
  CFRelease(v5);
}

- (void)CADDatabaseGetResourceChanges:(id)a3
{
  CFArrayRef v4 = (void *)MEMORY[0x1E4F1CA48];
  CFArrayRef v5 = (void (**)(id, void, id))a3;
  int v6 = [v4 array];
  conn = self->_conn;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __92__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetResourceChanges___block_invoke;
  id v12 = &unk_1E624DCA0;
  long long v13 = self;
  id v14 = v6;
  id v8 = v6;
  [(ClientConnection *)conn withAllDatabasesPerform:&v9];
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8, v9, v10, v11, v12, v13);
}

void __92__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetResourceChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  CFArrayRef v4 = (const __CFArray *)CalDatabaseCopyOfAllNotifications();
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      CFIndex v21 = Count;
      CFArrayRef v22 = v5;
      do
      {
        CFArrayGetValueAtIndex(v5, v8);
        if ((CalNotificationGetEntityType() & 0xFFFFFFFD) == 0x11)
        {
          CFArrayRef v9 = (const __CFArray *)CalResourceChangeNotificationCopyChanges();
          if (v9)
          {
            CFArrayRef v10 = v9;
            CFIndex v11 = CFArrayGetCount(v9);
            if (v11 >= 1)
            {
              CFIndex v12 = v11;
              for (CFIndex i = 0; v12 != i; ++i)
              {
                CFArrayGetValueAtIndex(v10, i);
                uint64_t v14 = CalResourceChangeCopyCalendarItem();
                if (v14)
                {
                  uint64_t v15 = (const void *)v14;
                  int Type = CalEntityGetType();
                  if (Type == 3)
                  {
                    if (![*(id *)(*(void *)(a1 + 32) + 8) reminderAccessGranted]) {
                      goto LABEL_17;
                    }
                  }
                  else if (Type == 2 {
                         && ![*(id *)(*(void *)(a1 + 32) + 8) eventAccessLevel])
                  }
                  {
LABEL_17:
                    CFRelease(v15);
                    continue;
                  }
                  CFRelease(v15);
                }
                else
                {
                  uint64_t v17 = CalResourceChangeCopyCalendar();
                  if (v17)
                  {
                    int v18 = (const void *)v17;
                    CanContainAnAllowedEntityint Type = CalendarCanContainAnAllowedEntityType(v17, *(void **)(*(void *)(a1 + 32) + 8));
                    CFRelease(v18);
                    if (!CanContainAnAllowedEntityType) {
                      continue;
                    }
                  }
                }
                int v20 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:18 entityID:CalResourceChangeGetUID() databaseID:a2];
                [*(id *)(a1 + 40) addObject:v20];
              }
            }
            CFRelease(v10);
            CFIndex v7 = v21;
            CFArrayRef v5 = v22;
          }
        }
        ++v8;
      }
      while (v8 != v7);
    }
    CFRelease(v5);
  }
}

- (void)CADDatabaseGetInviteReplyNotifications:(id)a3
{
  CFArrayRef v4 = (void *)MEMORY[0x1E4F1CA48];
  CFArrayRef v5 = (void (**)(id, void, id))a3;
  int v6 = [v4 array];
  conn = self->_conn;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  CFIndex v11 = __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInviteReplyNotifications___block_invoke;
  CFIndex v12 = &unk_1E624DCA0;
  long long v13 = self;
  id v14 = v6;
  id v8 = v6;
  [(ClientConnection *)conn withAllDatabasesPerform:&v9];
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8, v9, v10, v11, v12, v13);
}

void __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInviteReplyNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  CFArrayRef v4 = (const __CFArray *)CalDatabaseCopyOfAllNotifications();
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; v7 != i; ++i)
      {
        CFArrayGetValueAtIndex(v5, i);
        if (CalNotificationGetEntityType() != 16) {
          continue;
        }
        CFURLRef v9 = (const __CFURL *)CalInviteReplyNotificationCopyHostURL();
        if (!v9) {
          continue;
        }
        uint64_t v10 = v9;
        CFURLGetString(v9);
        uint64_t v11 = CalDatabaseCopyCalendarWithExternalIDInStore();
        if (v11)
        {
          CFIndex v12 = (const void *)v11;
          CFRelease(v10);
          uint64_t v10 = v12;
        }
        else
        {
          CFStringRef v13 = CFURLGetString((CFURLRef)v10);
          MutableCopy = CFStringCreateMutableCopy(0, 0, v13);
          if (!MutableCopy) {
            goto LABEL_14;
          }
          uint64_t v15 = MutableCopy;
          CFStringAppend(MutableCopy, @"/");
          uint64_t v16 = CalDatabaseCopyCalendarWithExternalIDInStore();
          CFRelease(v15);
          CFRelease(v10);
          uint64_t v10 = (const void *)v16;
          if (!v16) {
            goto LABEL_15;
          }
        }
        if (CalEntityGetType() != 1
          || CalendarCanContainAnAllowedEntityType((uint64_t)v10, *(void **)(*(void *)(a1 + 32) + 8)))
        {
LABEL_14:
          CFRelease(v10);
LABEL_15:
          uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:102 entityID:CalNotificationGetUID() databaseID:a2];
          [*(id *)(a1 + 40) addObject:v17];

          continue;
        }
        CFRelease(v10);
      }
    }
    CFRelease(v5);
  }
}

- (void)CADDatabaseGetNotificationCountForSourceWithExternalIdentifier:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 expanded:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  conn = self->_conn;
  id v18 = 0;
  id v19 = 0;
  CFStringRef v13 = (void (**)(id, void, uint64_t, id))a7;
  LOBYTE(v17) = a6;
  uint64_t v14 = +[CADNotificationUtilities CADDatabaseGetEventNotificationItemsWithConnection:conn afterDate:0 forSourceWithExternalIdentifier:a3 excludingDelegateSources:v9 excludingUncheckedCalendars:0 filteredByShowsNotificationsFlag:v8 expanded:v17 earliestExpirationDate:0 notificationTypes:&v19 objectIDs:&v18 occurrenceDates:0 attendeeObjectIDs:0];
  id v15 = v19;
  id v16 = v18;
  v13[2](v13, v14, [v15 count], v16);

  [(ClientConnection *)self->_conn logAccessToObjects:v16];
}

- (void)CADDatabaseGetInboxRepliedSectionItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CFArrayRef v4 = (void (**)(id, void, id, id))a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  conn = self->_conn;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke;
  v24[3] = &unk_1E624DC78;
  id v9 = v5;
  id v25 = v9;
  [(ClientConnection *)conn withAllDatabasesPerform:v24];
  if ([v9 count])
  {
    id v18 = v9;
    id v19 = v4;
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_23];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v16 = [v15 objectForKeyedSubscript:@"kObjectIDKey"];
          uint64_t v17 = [v15 objectForKeyedSubscript:@"kOccurrenceDateKey"];
          [v6 addObject:v16];
          [v7 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v12);
    }
    CFArrayRef v4 = v19;
    v19[2](v19, 0, v6, v7);
    [(ClientConnection *)self->_conn logAccessToObjects:v6];

    id v9 = v18;
  }
  else
  {
    v4[2](v4, 0, v6, v7);
  }
}

void __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)CalDatabaseCopyOfAllRepliedEventsInStore();
  if ([v3 count])
  {
    id v16 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_3];
    objc_msgSend(v3, "objectsAtIndexes:");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(obj);
          }
          BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:2 entityID:CalEntityGetID() databaseID:a2];
          id v9 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
          CalEventOccurrenceGetDate();
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
          CFRelease(v9);
          v23[0] = @"kParticipationStatusModifiedDateKey";
          uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
          CalEventGetParticipationStatusModifiedDate();
          uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
          v24[0] = v12;
          v23[1] = @"kStartDateKey";
          uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
          CalEventGetStartDate();
          uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
          v24[1] = v14;
          v24[2] = v8;
          v23[2] = @"kObjectIDKey";
          v23[3] = @"kOccurrenceDateKey";
          v24[3] = v10;
          id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

          [*(id *)(a1 + 32) addObject:v15];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v5);
    }
  }
}

uint64_t __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (CalCalendarItemGetStatus() == 3)
  {
    uint64_t v3 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = (const void *)CalCalendarItemCopyCalendar();
  uint64_t v5 = CalCalendarCopyStore();
  if (!v5)
  {
    uint64_t v3 = 0;
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v6 = (const void *)v5;
  if (!CalStoreGetSupportsIncomingInvitations()
    || (CalStoreIsFacebook() & 1) != 0
    || CalStoreGetType() == 1 && CalEventGetParticipationStatus() == 2)
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v9 = CalCalendarItemCopyOrganizer();
    if (v9)
    {
      uint64_t v10 = (const void *)v9;
      int v7 = CalOrganizerIsSelf() ^ 1;
      CFRelease(v10);
    }
    else
    {
      int v7 = 1;
    }
  }
  uint64_t v3 = v7 & ~[(id)objc_opt_class() storeIsReadOnlyDelegate:v6];
  CFRelease(v6);
  if (v4) {
LABEL_10:
  }
    CFRelease(v4);
LABEL_11:

  return v3;
}

uint64_t __101__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADDatabaseGetInboxRepliedSectionItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kParticipationStatusModifiedDateKey"];
  [v6 doubleValue];
  double v8 = v7;

  uint64_t v9 = [v4 objectForKeyedSubscript:@"kParticipationStatusModifiedDateKey"];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v5 objectForKeyedSubscript:@"kStartDateKey"];

  [v12 doubleValue];
  double v14 = v13;

  id v15 = [v4 objectForKeyedSubscript:@"kStartDateKey"];

  [v15 doubleValue];
  double v17 = v16;

  double v18 = vabdd_f64(v8, *MEMORY[0x1E4F57888]);
  double v19 = vabdd_f64(v11, *MEMORY[0x1E4F57888]);
  if (v18 < 2.22044605e-16 || v19 < 2.22044605e-16)
  {
    if (v18 < 2.22044605e-16 && v19 < 2.22044605e-16)
    {
      if (v14 >= v17) {
        return v14 > v17;
      }
      else {
        return -1;
      }
    }
    else if (v18 < 2.22044605e-16)
    {
      return 1;
    }
    else
    {
      return -1;
    }
  }
  else if (v8 >= v11)
  {
    if (v8 <= v11) {
      return 0;
    }
    else {
      return -1;
    }
  }
  else
  {
    return 1;
  }
}

- (void)CADResourceChange:(id)a3 setAlertedWithError:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, uint64_t))a4;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADResourceChange_setAlertedWithError___block_invoke;
  v11[3] = &unk_1E624DCC8;
  id v9 = v6;
  double v13 = self;
  double v14 = &v15;
  id v12 = v9;
  if ([(ClientConnection *)conn withDatabaseForObject:v9 perform:v11])
  {
    uint64_t v10 = *((unsigned int *)v16 + 6);
  }
  else
  {
    uint64_t v10 = 1010;
    *((_DWORD *)v16 + 6) = 1010;
  }
  v7[2](v7, v10);
  [(ClientConnection *)self->_conn logAccessToObject:v9];

  _Block_object_dispose(&v15, 8);
}

void __100__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADResourceChange_setAlertedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (!v4)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1010;
    return;
  }
  id v5 = v4;
  id v6 = (const void *)CalResourceChangeCopyCalendarItem();
  if (v6
    && (CalEntityGetType() == 2
     && ![*(id *)(*(void *)(a1 + 40) + 8) eventAccessLevel]
     || CalEntityGetType() == 3
     && ([*(id *)(*(void *)(a1 + 40) + 8) reminderAccessGranted] & 1) == 0))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1013;
  }
  else
  {
    CalResourceChangeSetAlerted();
    if ((CalDatabaseSave() & 1) == 0) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1007;
    }
    if (!v6) {
      goto LABEL_14;
    }
  }
  CFRelease(v6);
LABEL_14:
  CFRelease(v5);
}

- (void)CADEventSetInvitationStatus:(int)a3 forEvents:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADEventSetInvitationStatus_forEvents_error___block_invoke;
  v11[3] = &unk_1E624DD30;
  void v11[4] = &v13;
  int v12 = a3;
  [(ClientConnection *)conn withDatabaseForObjects:v8 perform:v11];
  v9[2](v9, *((unsigned int *)v14 + 6));
  [(ClientConnection *)self->_conn logAccessToObjects:v8];
  _Block_object_dispose(&v13, 8);
}

void __106__CADXPCImplementation_CADNotificationMonitorOperationGroup__CADEventSetInvitationStatus_forEvents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, os_unfair_lock_s *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(a4 + 20);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!_CADGetEntity((uint64_t)a4, *(void **)(*((void *)&v12 + 1) + 8 * i)))
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1010;
          goto LABEL_11;
        }
        _CalEventSetInvitationStatus();
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if (*MEMORY[0x1E4F56A58]) {
      os_unfair_lock_assert_owner(a4 + 20);
    }
    os_unfair_lock_unlock(a4 + 20);
    CalDatabaseRevert();
  }
  else if ((CalDatabaseSaveWithOptions() & 1) == 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1007;
  }
}

void __55__CADXPCImplementation_accessGrantedToPerformSelector___block_invoke()
{
  v136[133] = *MEMORY[0x1E4F143B8];
  v134 = NSStringFromSelector(sel_CADDatabaseSetInitializationOptions_reply_);
  v135[0] = v134;
  v136[0] = &unk_1F151D6B0;
  __int16 v133 = NSStringFromSelector(sel_CADDatabaseGetAccess_);
  v135[1] = v133;
  v136[1] = &unk_1F151D6B0;
  __int16 v132 = NSStringFromSelector(sel_CADDatabaseRequestAccessForEntityType_desiredFullAccess_isBlockingUIThread_reason_reply_);
  v135[2] = v132;
  v136[2] = &unk_1F151D6B0;
  __int16 v131 = NSStringFromSelector(sel_CADDatabaseResetWithReply_);
  v135[3] = v131;
  v136[3] = &unk_1F151D6B0;
  __int16 v130 = NSStringFromSelector(sel_CADDatabaseGetAlarmWithUUID_reply_);
  v135[4] = v130;
  v136[4] = &unk_1F151D6C8;
  __int16 v129 = NSStringFromSelector(sel_CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply_);
  v135[5] = v129;
  v136[5] = &unk_1F151D6C8;
  __int16 v128 = NSStringFromSelector(sel_CADDatabaseGetCalendarItemWithUUID_reply_);
  v135[6] = v128;
  v136[6] = &unk_1F151D6E0;
  __int16 v127 = NSStringFromSelector(sel_CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply_);
  v135[7] = v127;
  v136[7] = &unk_1F151D6E0;
  __int16 v126 = NSStringFromSelector(sel_CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply_);
  v135[8] = v126;
  v136[8] = &unk_1F151D6E0;
  uint64_t v125 = NSStringFromSelector(sel_CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply_);
  v135[9] = v125;
  v136[9] = &unk_1F151D6E0;
  v124 = NSStringFromSelector(sel_CADDatabaseGetAlarmWithExternalID_reply_);
  v135[10] = v124;
  v136[10] = &unk_1F151D6E0;
  __int16 v123 = NSStringFromSelector(sel_CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply_);
  v135[11] = v123;
  v136[11] = &unk_1F151D6F8;
  __int16 v122 = NSStringFromSelector(sel_CADDatabaseCancelFetchRequestWithIdentifier_);
  v135[12] = v122;
  v136[12] = &unk_1F151D6E0;
  uint64_t v121 = NSStringFromSelector(sel_CADDatabaseExportICSForCalendarItemWithID_occurrenceDate_options_reply_);
  v135[13] = v121;
  v136[13] = &unk_1F151D6E0;
  int v120 = NSStringFromSelector(sel_CADDatabaseGetCalendarsWithFaultedProperties_reply_);
  v135[14] = v120;
  v136[14] = &unk_1F151D6F8;
  __int16 v119 = NSStringFromSelector(sel_CADCalendar_hasEvents_);
  v135[15] = v119;
  v136[15] = &unk_1F151D6F8;
  __int16 v118 = NSStringFromSelector(sel_CADCalendar_hasEventsWithRoomAsAttendee_);
  v135[16] = v118;
  v136[16] = &unk_1F151D6E0;
  unint64_t v117 = NSStringFromSelector(sel_CADDatabaseGetUUID_);
  v135[17] = v117;
  v136[17] = &unk_1F151D6E0;
  int v116 = NSStringFromSelector(sel_CADDatabaseRegisterForDetailedChangeTrackingInSource_reply_);
  v135[18] = v116;
  v136[18] = &unk_1F151D6E0;
  __int16 v115 = NSStringFromSelector(sel_CADDatabaseUnregisterForDetailedChangeTracking_);
  v135[19] = v115;
  v136[19] = &unk_1F151D6E0;
  __int16 v114 = NSStringFromSelector(sel_CADDatabaseFetchChangedObjectIDs_);
  v135[20] = v114;
  v136[20] = &unk_1F151D6E0;
  uint64_t v113 = NSStringFromSelector(sel_CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply_);
  v135[21] = v113;
  v136[21] = &unk_1F151D6E0;
  int v112 = NSStringFromSelector(sel_CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken_reply_);
  v135[22] = v112;
  v136[22] = &unk_1F151D6E0;
  uint64_t v111 = NSStringFromSelector(sel_CADDatabaseConsumeAllChangesUpToToken_except_reply_);
  v135[23] = v111;
  v136[23] = &unk_1F151D6E0;
  int v110 = NSStringFromSelector(sel_CADDatabaseMarkIndividualChangesConsumed_reply_);
  v135[24] = v110;
  v136[24] = &unk_1F151D6E0;
  uint64_t v109 = NSStringFromSelector(sel_CADDatabaseGetSequenceToken_);
  v135[25] = v109;
  v136[25] = &unk_1F151D6E0;
  int v108 = NSStringFromSelector(sel_CADDatabaseGetChangesSinceSequenceToken_reply_);
  v135[26] = v108;
  v136[26] = &unk_1F151D6E0;
  uint64_t v107 = NSStringFromSelector(sel_CADDatabaseGetChangedEntityIDsSinceTimestamp_reply_);
  v135[27] = v107;
  v136[27] = &unk_1F151D6E0;
  int v106 = NSStringFromSelector(sel_CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply_);
  v135[28] = v106;
  v136[28] = &unk_1F151D6E0;
  uint64_t v105 = NSStringFromSelector(sel_CADDatabaseExportICSDataForCalendarItems_options_reply_);
  v135[29] = v105;
  v136[29] = &unk_1F151D6E0;
  int v104 = NSStringFromSelector(sel_CADDatabaseExportICSDataForCalendar_options_reply_);
  v135[30] = v104;
  v136[30] = &unk_1F151D6E0;
  uint64_t v103 = NSStringFromSelector(sel_CADDatabaseSetShowsDeclinedEvents_reply_);
  v135[31] = v103;
  v136[31] = &unk_1F151D6E0;
  int v102 = NSStringFromSelector(sel_CADDatabaseShowsDeclinedEventsWithReply_);
  v135[32] = v102;
  v136[32] = &unk_1F151D6E0;
  uint64_t v101 = NSStringFromSelector(sel_CADDatabaseSetShowsCompletedReminders_reply_);
  v135[33] = v101;
  v136[33] = &unk_1F151D6E0;
  int v100 = NSStringFromSelector(sel_CADDatabaseRebuildOccurrenceCacheWithReply_);
  v135[34] = v100;
  v136[34] = &unk_1F151D6E0;
  uint64_t v99 = NSStringFromSelector(sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_);
  v135[35] = v99;
  v136[35] = &unk_1F151D6F8;
  uint64_t v98 = NSStringFromSelector(sel_CADDatabaseCanModifyCalendarDatabase_);
  v135[36] = v98;
  v136[36] = &unk_1F151D6E0;
  int v97 = NSStringFromSelector(sel_CADDatabaseLastConfirmedSplashScreenVersion_);
  v135[37] = v97;
  v136[37] = &unk_1F151D6E0;
  uint64_t v96 = NSStringFromSelector(sel_CADDatabaseMigrateSubscribedCalendar_toSource_reply_);
  v135[38] = v96;
  v136[38] = &unk_1F151D6E0;
  int v95 = NSStringFromSelector(sel_CADDatabaseGetDefaultAlarmOffsetForAllDay_reply_);
  v135[39] = v95;
  v136[39] = &unk_1F151D6F8;
  uint64_t v94 = NSStringFromSelector(sel_CADAnalyticsSendEvent_appendingClientBundleIDToPayload_);
  v135[40] = v94;
  v136[40] = &unk_1F151D710;
  int v93 = NSStringFromSelector(sel_CADDatabaseStatsBySource_);
  v135[41] = v93;
  v136[41] = &unk_1F151D728;
  uint64_t v92 = NSStringFromSelector(sel_CADPersonaIdentifierForDatabaseID_reply_);
  v135[42] = v92;
  v136[42] = &unk_1F151D740;
  int v91 = NSStringFromSelector(sel_CADCatchUpIntegrationSyncingIfBehind_);
  v135[43] = v91;
  v136[43] = &unk_1F151D758;
  uint64_t v90 = NSStringFromSelector(sel_CADDatabaseGetDefaultLocalCalendarWithReply_);
  v135[44] = v90;
  v136[44] = &unk_1F151D6E0;
  int v89 = NSStringFromSelector(sel_CADDatabaseGetOrCreateSubscribedCalendarsSource_);
  v135[45] = v89;
  v136[45] = &unk_1F151D6E0;
  uint64_t v88 = NSStringFromSelector(sel_CADDatabaseGetOrCreateBirthdayCalendar_);
  v135[46] = v88;
  v136[46] = &unk_1F151D6E0;
  int v87 = NSStringFromSelector(sel_CADDatabaseGetDefaultCalendarForNewEventsInDelegateSource_withReply_);
  v135[47] = v87;
  v136[47] = &unk_1F151D6F8;
  uint64_t v86 = NSStringFromSelector(sel_CADDatabaseSetDefaultCalendarForNewEvents_delegateSource_reply_);
  v135[48] = v86;
  v136[48] = &unk_1F151D6E0;
  int v85 = NSStringFromSelector(sel_CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID_reply_);
  v135[49] = v85;
  v136[49] = &unk_1F151D710;
  uint64_t v84 = NSStringFromSelector(sel_CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID_reply_);
  v135[50] = v84;
  v136[50] = &unk_1F151D770;
  int v83 = NSStringFromSelector(sel_CADDatabaseGetEventWithEventIdentifier_reply_);
  v135[51] = v83;
  v136[51] = &unk_1F151D6F8;
  uint64_t v82 = NSStringFromSelector(sel_CADDatabaseGetEventWithUniqueID_reply_);
  v135[52] = v82;
  v136[52] = &unk_1F151D6E0;
  int v81 = NSStringFromSelector(sel_CADDatabaseGetAllEventsWithUniqueID_reply_);
  v135[53] = v81;
  v136[53] = &unk_1F151D6E0;
  uint64_t v80 = NSStringFromSelector(sel_CADDatabaseGetBirthdayCalendarEnabledWithReply_);
  v135[54] = v80;
  v136[54] = &unk_1F151D6E0;
  int v79 = NSStringFromSelector(sel_CADDatabaseSetBirthdayCalendarEnabled_withReply_);
  v135[55] = v79;
  v136[55] = &unk_1F151D6E0;
  uint64_t v78 = NSStringFromSelector(sel_CADDatabaseGetBirthdayCalendarVersionWithReply_);
  v135[56] = v78;
  v136[56] = &unk_1F151D6C8;
  int v77 = NSStringFromSelector(sel_CADDatabaseSetBirthdayCalendarVersion_withReply_);
  v135[57] = v77;
  v136[57] = &unk_1F151D6C8;
  uint64_t v76 = NSStringFromSelector(sel_CADDatabaseGetSuggestedEventCalendarWithReply_);
  v135[58] = v76;
  v136[58] = &unk_1F151D6E0;
  int v75 = NSStringFromSelector(sel_CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply_);
  v135[59] = v75;
  v136[59] = &unk_1F151D6E0;
  uint64_t v74 = NSStringFromSelector(sel_CADDatabaseCanModifySuggestedEventCalendar_);
  v135[60] = v74;
  v136[60] = &unk_1F151D6E0;
  v73 = NSStringFromSelector(sel_CADDatabaseGetSourceIdentifierForEventWithObjectID_reply_);
  v135[61] = v73;
  v136[61] = &unk_1F151D6F8;
  uint64_t v72 = NSStringFromSelector(sel_CADDatabaseInsertSuggestedEventCalendarWithReply_);
  v135[62] = v72;
  v136[62] = &unk_1F151D6E0;
  int v71 = NSStringFromSelector(sel_CADDatabaseRemoveSuggestedEventCalendarWithReply_);
  v135[63] = v71;
  v136[63] = &unk_1F151D6E0;
  v70 = NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply_);
  v135[64] = v70;
  v136[64] = &unk_1F151D6E0;
  __int16 v69 = NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply_);
  v135[65] = v69;
  v136[65] = &unk_1F151D6E0;
  uint64_t v68 = NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID_nearestDate_prefersForwardSearch_reply_);
  v135[66] = v68;
  v136[66] = &unk_1F151D6E0;
  v67 = NSStringFromSelector(sel_CADOccurrenceCacheGetOccurrenceCountWithStartDate_endDate_reply_);
  v135[67] = v67;
  v136[67] = &unk_1F151D6E0;
  uint64_t v66 = NSStringFromSelector(sel_CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply_);
  v135[68] = v66;
  v136[68] = &unk_1F151D6E0;
  int v65 = NSStringFromSelector(sel_CADOccurrenceCacheSearchWithTerm_inCalendars_responseToken_reply_);
  v135[69] = v65;
  v136[69] = &unk_1F151D6E0;
  uint64_t v64 = NSStringFromSelector(sel_CADOccurrenceCacheSearchLocationsWithTerm_inCalendars_responseToken_reply_);
  v135[70] = v64;
  v136[70] = &unk_1F151D6E0;
  int v63 = NSStringFromSelector(sel_CADOccurrenceCacheCancelSearchWithReplyID_);
  v135[71] = v63;
  v136[71] = &unk_1F151D6E0;
  uint64_t v62 = NSStringFromSelector(sel_CADOccurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone_reply_);
  v135[72] = v62;
  v136[72] = &unk_1F151D6E0;
  v61 = NSStringFromSelector(sel_CADDatabaseShouldPermitOrganizerEmailFromJunkChecks_reply_);
  v135[73] = v61;
  v136[73] = &unk_1F151D6E0;
  uint64_t v60 = NSStringFromSelector(sel_CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks_reply_);
  v135[74] = v60;
  v136[74] = &unk_1F151D6E0;
  v59 = NSStringFromSelector(sel_CADDatabaseGetAttachmentWithUUID_reply_);
  v135[75] = v59;
  v136[75] = &unk_1F151D6E0;
  uint64_t v58 = NSStringFromSelector(sel_CADDatabaseGetTTLLocationAuthorizationStatus_);
  v135[76] = v58;
  v136[76] = &unk_1F151D6E0;
  int v57 = NSStringFromSelector(sel_CADDatabaseLoadEventsInCalendar_reply_);
  v135[77] = v57;
  v136[77] = &unk_1F151D6C8;
  uint64_t v56 = NSStringFromSelector(sel_CADMigrateDatabaseIfNeeded_);
  v135[78] = v56;
  v136[78] = &unk_1F151D6B0;
  int v55 = NSStringFromSelector(sel_CADDatabaseGetSharedCalendarInvitationsWithReply_);
  v135[79] = v55;
  v136[79] = &unk_1F151D788;
  uint64_t v54 = NSStringFromSelector(sel_CADCalendarSetClearedFromNotificationCenter_error_);
  v135[80] = v54;
  v136[80] = &unk_1F151D788;
  v53 = NSStringFromSelector(sel_CADDatabaseGetResourceChanges_);
  v135[81] = v53;
  v136[81] = &unk_1F151D788;
  uint64_t v52 = NSStringFromSelector(sel_CADDatabaseGetInviteReplyNotifications_);
  v135[82] = v52;
  v136[82] = &unk_1F151D788;
  uint64_t v51 = NSStringFromSelector(sel_CADDatabaseGetEventNotificationItemsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_reply_);
  v135[83] = v51;
  v136[83] = &unk_1F151D788;
  uint64_t v50 = NSStringFromSelector(sel_CADDatabaseGetNotificationCountForSourceWithExternalIdentifier_excludingDelegateSources_filteredByShowsNotificationsFlag_expanded_reply_);
  v135[84] = v50;
  v136[84] = &unk_1F151D788;
  v49 = NSStringFromSelector(sel_CADDatabaseGetInboxRepliedSectionItems_);
  v135[85] = v49;
  v136[85] = &unk_1F151D788;
  uint64_t v48 = NSStringFromSelector(sel_CADResourceChange_setAlertedWithError_);
  v135[86] = v48;
  v136[86] = &unk_1F151D788;
  v47 = NSStringFromSelector(sel_CADEventSetInvitationStatus_forEvents_error_);
  v135[87] = v47;
  v136[87] = &unk_1F151D788;
  uint64_t v46 = NSStringFromSelector(sel_CADObjectExists_reply_);
  v135[88] = v46;
  v136[88] = &unk_1F151D6F8;
  CFIndex v45 = NSStringFromSelector(sel_CADObjectsExist_reply_);
  v135[89] = v45;
  v136[89] = &unk_1F151D6F8;
  uint64_t v44 = NSStringFromSelector(sel_CADObject_getPropertiesWithNames_reply_);
  v135[90] = v44;
  v136[90] = &unk_1F151D6F8;
  v43 = NSStringFromSelector(sel_CADObjects_getPropertiesWithNames_reply_);
  v135[91] = v43;
  v136[91] = &unk_1F151D6F8;
  uint64_t v42 = NSStringFromSelector(sel_CADObject_getPropertyWithName_reply_);
  v135[92] = v42;
  v136[92] = &unk_1F151D6F8;
  id v41 = NSStringFromSelector(sel_CADObject_getStringPropertyWithName_reply_);
  v135[93] = v41;
  v136[93] = &unk_1F151D6F8;
  uint64_t v40 = NSStringFromSelector(sel_CADObject_getNumberPropertyWithName_reply_);
  v135[94] = v40;
  v136[94] = &unk_1F151D6F8;
  CFTypeRef v39 = NSStringFromSelector(sel_CADObject_getDatePropertyWithName_reply_);
  v135[95] = v39;
  v136[95] = &unk_1F151D6F8;
  uint64_t v38 = NSStringFromSelector(sel_CADObject_getDataPropertyWithName_reply_);
  v135[96] = v38;
  v136[96] = &unk_1F151D6F8;
  uint64_t v37 = NSStringFromSelector(sel_CADObject_getSecurityScopedURLWrapperPropertyWithName_reply_);
  v135[97] = v37;
  v136[97] = &unk_1F151D6E0;
  uint64_t v36 = NSStringFromSelector(sel_CADObject_getRelatedObjectWithRelationName_reply_);
  v135[98] = v36;
  v136[98] = &unk_1F151D6F8;
  int v35 = NSStringFromSelector(sel_CADObject_getRelatedObjectsWithRelationName_reply_);
  v135[99] = v35;
  v136[99] = &unk_1F151D6F8;
  uint64_t v34 = NSStringFromSelector(sel_CADObjectIsManaged_reply_);
  v135[100] = v34;
  v136[100] = &unk_1F151D6E0;
  int v33 = NSStringFromSelector(sel_CADDatabaseGetSourcesWithFaultedProperties_reply_);
  v135[101] = v33;
  v136[101] = &unk_1F151D6F8;
  uint64_t v32 = NSStringFromSelector(sel_CADDatabaseGetLocalSourceWithEnableIfNeeded_reply_);
  v135[102] = v32;
  v136[102] = &unk_1F151D6E0;
  int v31 = NSStringFromSelector(sel_CADDatabaseGetLocalBirthdaySource_);
  v135[103] = v31;
  v136[103] = &unk_1F151D6E0;
  int v30 = NSStringFromSelector(sel_CADObjectGetConstraints_reply_);
  v135[104] = v30;
  v136[104] = &unk_1F151D6F8;
  uint64_t v29 = NSStringFromSelector(sel_CADSourceGetNotificationCollection_reply_);
  v135[105] = v29;
  v136[105] = &unk_1F151D6E0;
  uint64_t v28 = NSStringFromSelector(sel_CADSourceRefresh_isUserRequested_reply_);
  v135[106] = v28;
  v136[106] = &unk_1F151D6E0;
  uint64_t v27 = NSStringFromSelector(sel_CADCountCalendarItemsOfType_inSource_reply_);
  v135[107] = v27;
  v136[107] = &unk_1F151D6E0;
  uint64_t v26 = NSStringFromSelector(sel_CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply_);
  v135[108] = v26;
  v136[108] = &unk_1F151D6E0;
  id v25 = NSStringFromSelector(sel_CADSourceGetGrantedDelegatesList_reply_);
  v135[109] = v25;
  v136[109] = &unk_1F151D6E0;
  int v24 = NSStringFromSelector(sel_CADSourceUpdateGrantedDelegate_action_sourceID_reply_);
  v135[110] = v24;
  v136[110] = &unk_1F151D6E0;
  long long v23 = NSStringFromSelector(sel_CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply_);
  v135[111] = v23;
  v136[111] = &unk_1F151D6E0;
  long long v22 = NSStringFromSelector(sel_CADSourceRemoveExchangeDelegateWithID_reply_);
  v135[112] = v22;
  v136[112] = &unk_1F151D6E0;
  long long v21 = NSStringFromSelector(sel_CADInternalForceStatCollection_);
  v135[113] = v21;
  v136[113] = &unk_1F151D7A0;
  long long v20 = NSStringFromSelector(sel_CADInternalSetNextConferenceLinkRenewalToNow_);
  v135[114] = v20;
  v136[114] = &unk_1F151D7A0;
  double v19 = NSStringFromSelector(sel_CADInternalRemoveConferenceLinkRenewalDate_);
  v135[115] = v19;
  v136[115] = &unk_1F151D7A0;
  int v18 = NSStringFromSelector(sel_CADDatabaseGetNotificationCountExcludingUncheckedCalendars_expanded_reply_);
  v135[116] = v18;
  v136[116] = &unk_1F151D7B8;
  uint64_t v17 = NSStringFromSelector(sel_CADTestingSimulateDaemonCrash);
  v135[117] = v17;
  v136[117] = &unk_1F151D7D0;
  int v16 = NSStringFromSelector(sel_CADTestingCloseDatabase_);
  v135[118] = v16;
  v136[118] = &unk_1F151D7D0;
  long long v15 = NSStringFromSelector(sel_CADDatabaseGetDeletableCalendars_);
  v135[119] = v15;
  v136[119] = &unk_1F151D7E8;
  long long v14 = NSStringFromSelector(sel_CADDatabaseGetDeletableSources_);
  v135[120] = v14;
  v136[120] = &unk_1F151D7E8;
  long long v13 = NSStringFromSelector(sel_CADPurgeChangeTrackingReply_);
  v135[121] = v13;
  v136[121] = &unk_1F151D800;
  long long v12 = NSStringFromSelector(sel_CADPostSyntheticRouteHypothesis_forEventWithExternalURL_reply_);
  v135[122] = v12;
  v136[122] = &unk_1F151D800;
  v0 = NSStringFromSelector(sel_CADDatabaseGetStorageUsage_);
  v135[123] = v0;
  v136[123] = &unk_1F151D818;
  v1 = NSStringFromSelector(sel_CADBackupDatabaseToFileNamed_inDirectory_includeAttachments_reply_);
  v135[124] = v1;
  v136[124] = &unk_1F151D788;
  id v2 = NSStringFromSelector(sel_CADBackupToICBU_reply_);
  v135[125] = v2;
  v136[125] = &unk_1F151D788;
  uint64_t v3 = NSStringFromSelector(sel_CADRestoreFromDatabaseBackupFileNamed_inDirectory_includeAttachments_reply_);
  v135[126] = v3;
  v136[126] = &unk_1F151D788;
  id v4 = NSStringFromSelector(sel_CADRestoreFromICBU_reply_);
  v135[127] = v4;
  v136[127] = &unk_1F151D788;
  id v5 = NSStringFromSelector(sel_CADDiagnosticsCollectWithToken_options_trafficLogsCollectionMode_reply_);
  v135[128] = v5;
  v136[128] = &unk_1F151D830;
  id v6 = NSStringFromSelector(sel_CADDiagnosticsCancelCollectionWithToken_reply_);
  v135[129] = v6;
  v136[129] = &unk_1F151D830;
  id v7 = NSStringFromSelector(sel_CADDatabaseGetErrorCount_);
  v135[130] = v7;
  v136[130] = &unk_1F151D6E0;
  uint64_t v8 = NSStringFromSelector(sel_CADDatabaseGetEventsWithErrorsPerSource_);
  v135[131] = v8;
  v136[131] = &unk_1F151D6E0;
  uint64_t v9 = NSStringFromSelector(sel_CADDatabaseGetColorWithProviderIdentifier_externalID_reply_);
  v135[132] = v9;
  v136[132] = &unk_1F151D848;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:133];
  double v11 = (void *)accessGrantedToPerformSelector__accessTypeBySelector;
  accessGrantedToPerformSelector__accessTypeBySelector = v10;
}

- (void)clearCachedAuthorizationStatus
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  self->_allowedAccess = 0;
  self->_unint64_t checkedAccess = 0;
  os_unfair_lock_unlock(p_accessLock);
}

- (void)CADDatabaseGetUUID:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__1;
  long long v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  conn = self->_conn;
  uint64_t v6 = *MEMORY[0x1E4F574B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetUUID___block_invoke;
  v8[3] = &unk_1E624DDF0;
  void v8[4] = &v9;
  [(ClientConnection *)conn withDatabaseID:v6 perform:v8];
  if (v10[5]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 1007;
  }
  v4[2](v4, v7);
  _Block_object_dispose(&v9, 8);
}

uint64_t __70__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCopyUniqueIdentifier();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v2;
  return MEMORY[0x1F41817F8](v2);
}

- (void)CADDatabaseRegisterForDetailedChangeTrackingInSource:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  uint64_t v8 = [(ClientConnection *)self->_conn changeTrackingID];
  uint64_t v9 = v8;
  if (v8)
  {
    conn = self->_conn;
    if (v6)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke;
      v15[3] = &unk_1E624DCC8;
      id v16 = v6;
      int v18 = &v20;
      id v17 = v9;
      [(ClientConnection *)conn withDatabaseForObject:v16 perform:v15];
      uint64_t v11 = &v16;
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke_2;
      v13[3] = &unk_1E624DC78;
      id v14 = v8;
      [(ClientConnection *)conn withAllDatabasesPerform:v13];
      uint64_t v11 = &v14;
    }
  }
  else
  {
    long long v12 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_ERROR, "Attempt to register for change tracking without a bundle ID nor a clientSuffix.", buf, 2u);
    }
    *((_DWORD *)v21 + 6) = 1018;
  }
  v7[2](v7);

  _Block_object_dispose(&v20, 8);
}

void __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) entityID];
  uint64_t v2 = CalDatabaseCopyStoreWithUID();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    CalDatabaseRegisterClientForPersistentChangeTrackingInStore();
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1010;
  }
}

uint64_t __110__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRegisterForDetailedChangeTrackingInSource_reply___block_invoke_2()
{
  return CalDatabaseRegisterClientForPersistentChangeTracking();
}

- (void)CADDatabaseUnregisterForDetailedChangeTracking:(id)a3
{
  conn = self->_conn;
  id v5 = (void (**)(id, uint64_t))a3;
  id v6 = [(ClientConnection *)conn changeTrackingID];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = self->_conn;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseUnregisterForDetailedChangeTracking___block_invoke;
    v11[3] = &unk_1E624DC78;
    id v12 = v6;
    [(ClientConnection *)v8 withAllDatabasesPerform:v11];

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Attempt to unregister for change tracking without a bundle ID nor a clientSuffix.", buf, 2u);
    }
    uint64_t v9 = 1018;
  }
  v5[2](v5, v9);
}

uint64_t __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseUnregisterForDetailedChangeTracking___block_invoke()
{
  return CalRemoveClientForPersistentChangeTracking();
}

- (void)CADDatabaseFetchChangedObjectIDs:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t, void *, id))a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v5 = [(ClientConnection *)self->_conn changeTrackingID];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    conn = self->_conn;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __84__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchChangedObjectIDs___block_invoke;
    id v17 = &unk_1E624DE18;
    int v18 = self;
    id v19 = v5;
    id v9 = v6;
    id v20 = v9;
    uint64_t v22 = &v24;
    id v10 = v7;
    id v21 = v10;
    int v23 = &v28;
    [(ClientConnection *)conn withAllDatabasesPerform:&v14];
    if (*((unsigned char *)v25 + 24) || !*((unsigned char *)v29 + 24))
    {
      uint64_t v11 = [CADSequenceToken alloc];
      id v12 = -[CADSequenceToken initWithAllDBSequenceMap:](v11, "initWithAllDBSequenceMap:", v9, v14, v15, v16, v17, v18, v19, v20);
      uint64_t v13 = 0;
    }
    else
    {

      id v10 = 0;
      id v12 = 0;
      uint64_t v13 = 1;
    }
    v4[2](v4, 0, v13, v12, v10);
  }
  else
  {
    v4[2](v4, 1018, 0, 0, 0);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

void __84__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchChangedObjectIDs___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  void v23[4] = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1[4] + 8) restrictedStoreRowIDsForAction:0 inDatabase:a3];
  if ([v5 count])
  {
    id v6 = [v5 allObjects];
  }
  else
  {
    id v6 = 0;
  }
  unsigned int v21 = -1;
  unsigned __int8 v20 = 0;
  uint64_t v19 = 0;
  unsigned int v18 = 0;
  id v7 = CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient();
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v21, &v18);
  id v9 = (void *)a1[6];
  id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
  [v9 setObject:v8 forKeyedSubscript:v10];

  if ((int)CalDatabaseGetStoreForPersistentChangeTrackingClientIdentifier() >= 1) {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
  int v11 = v20;
  if (!v20 && v7)
  {
    if ([v7 length])
    {
      v23[0] = v7;
      v22[0] = @"changes";
      v22[1] = @"inserts";
      id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:HIDWORD(v19)];
      v23[1] = v12;
      v22[2] = @"updates";
      uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v19];
      v23[2] = v13;
      v22[3] = @"deletes";
      uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v18];
      v23[3] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

      id v16 = (void *)a1[7];
      id v17 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
      [v16 setObject:v15 forKeyedSubscript:v17];

      goto LABEL_13;
    }
    int v11 = v20;
  }
  if (v11) {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
LABEL_13:
}

- (void)CADDatabaseFetchObjectChangesForEntityTypes:(id)a3 insideObject:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t, CADSequenceToken *, uint64_t))a5;
  uint64_t v54 = 0;
  int v55 = &v54;
  uint64_t v56 = 0x2020000000;
  int v57 = 0;
  uint64_t v11 = [(ClientConnection *)self->_conn changeTrackingID];
  id v12 = (void *)v11;
  if (v11)
  {
    id v25 = (void *)v11;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    uint64_t v51 = __Block_byref_object_copy__1;
    uint64_t v52 = __Block_byref_object_dispose__1;
    id v53 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__1;
    v46[4] = __Block_byref_object_dispose__1;
    id v47 = 0;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    uint64_t v38 = 0;
    CFTypeRef v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    id v24 = v8;
    uint64_t v14 = [(CADXPCImplementation *)self _copyToIntCFSetRef:v8];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke;
    v28[3] = &unk_1E624DE40;
    v28[4] = self;
    id v15 = v9;
    id v16 = v9;
    id v29 = v16;
    uint64_t v37 = v14;
    id v30 = v25;
    uint64_t v32 = &v54;
    id v17 = v13;
    id v31 = v17;
    int v33 = &v38;
    uint64_t v34 = &v42;
    int v35 = &v48;
    uint64_t v36 = v46;
    unsigned int v18 = (void *)MEMORY[0x1C1867AB0](v28);
    uint64_t v19 = v18;
    conn = self->_conn;
    if (v16)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke_2;
      v26[3] = &unk_1E624DE68;
      id v27 = v18;
      [(ClientConnection *)conn withDatabaseForObject:v16 perform:v26];
    }
    else
    {
      [(ClientConnection *)conn withAllDatabasesPerform:v18];
    }
    CFRelease(v14);
    id v9 = v15;
    if (*((unsigned char *)v39 + 24) || !*((unsigned char *)v43 + 24))
    {
      if (!*((_DWORD *)v55 + 6))
      {
        int v23 = [[CADSequenceToken alloc] initWithAllDBSequenceMap:v17];
        uint64_t v21 = 0;
        goto LABEL_13;
      }
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = 1;
    }
    uint64_t v22 = (void *)v49[5];
    v49[5] = 0;

    int v23 = 0;
LABEL_13:
    v10[2](v10, *((unsigned int *)v55 + 6), v21, v23, v49[5]);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(v46, 8);

    _Block_object_dispose(&v48, 8);
    id v8 = v24;
    id v12 = v25;
    goto LABEL_14;
  }
  v10[2](v10, 1018, 0, 0, 0);
LABEL_14:

  _Block_object_dispose(&v54, 8);
}

void __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  unsigned int v25 = -1;
  id v24 = 0;
  id v7 = [*(id *)(a1[4] + 8) restrictedStoreRowIDsForAction:0 inDatabase:a3];
  if ([v7 count])
  {
    id v8 = [v7 allObjects];
  }
  else
  {
    id v8 = 0;
  }
  char v23 = 0;
  uint64_t ChangedEKObjectsForClient = CalDatabaseGetChangedEKObjectsForClient();
  id v10 = v24;
  if (ChangedEKObjectsForClient == -1)
  {
    *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = 1007;
    *a4 = 1;
  }
  else
  {
    uint64_t v11 = ChangedEKObjectsForClient;
    id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v25, &v23, &v24);
    id v13 = (void *)a1[7];
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
    [v13 setObject:v12 forKeyedSubscript:v14];

    if (v11 == 1 && v23) {
      CalRemoveClientForPersistentChangeTracking();
    }
    if ((int)CalDatabaseGetStoreForPersistentChangeTrackingClientIdentifier() >= 1) {
      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
    }
    if (v23)
    {
      *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
    }
    else if ([v10 count])
    {
      uint64_t v15 = *(void *)(a1[11] + 8);
      unsigned int v18 = *(void **)(v15 + 40);
      id v17 = (id *)(v15 + 40);
      id v16 = v18;
      if (v18)
      {
        uint64_t v19 = *(void **)(*(void *)(a1[12] + 8) + 40);
        if (!v19)
        {
          uint64_t v20 = [v16 mutableCopy];
          uint64_t v21 = *(void *)(a1[12] + 8);
          uint64_t v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          objc_storeStrong((id *)(*(void *)(a1[11] + 8) + 40), *(id *)(*(void *)(a1[12] + 8) + 40));
          uint64_t v19 = *(void **)(*(void *)(a1[12] + 8) + 40);
        }
        [v19 addObjectsFromArray:v10];
      }
      else
      {
        objc_storeStrong(v17, v10);
      }
    }
  }
}

uint64_t __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply___block_invoke_2(uint64_t a1)
{
  char v2 = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v19 = self;
  uint64_t v20 = [(ClientConnection *)self->_conn changeTrackingID];
  if (v20)
  {
    unsigned int v18 = v7;
    [v6 allDBSequenceMap];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          conn = v19->_conn;
          uint64_t v15 = [v13 intValue];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken_reply___block_invoke;
          v21[3] = &unk_1E624DE90;
          id v16 = v8;
          id v22 = v16;
          char v23 = v13;
          id v24 = v20;
          [(ClientConnection *)conn withDatabaseID:v15 perform:v21];
        }
        uint64_t v10 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    uint64_t v17 = 0;
    id v7 = v18;
  }
  else
  {
    uint64_t v17 = 1018;
  }
  v7[2](v7, v17);
}

uint64_t __114__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken_reply___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v1 intValue];

  return CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
}

- (void)CADDatabaseConsumeAllChangesUpToToken:(id)a3 except:(id)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v23 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  id v22 = [(ClientConnection *)self->_conn changeTrackingID];
  if (v22)
  {
    uint64_t v20 = v9;
    id v21 = v8;
    [v8 allDBSequenceMap];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          conn = self->_conn;
          uint64_t v17 = [v15 intValue];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseConsumeAllChangesUpToToken_except_reply___block_invoke;
          v24[3] = &unk_1E624DEE0;
          id v18 = v10;
          id v25 = v18;
          long long v26 = v15;
          id v27 = v23;
          id v28 = v22;
          [(ClientConnection *)conn withDatabaseID:v17 perform:v24];
        }
        uint64_t v12 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    uint64_t v19 = 0;
    uint64_t v9 = v20;
    id v8 = v21;
  }
  else
  {
    uint64_t v19 = 1018;
  }
  v9[2](v9, v19);
}

void __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseConsumeAllChangesUpToToken_except_reply___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 intValue];

  uint64_t v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [MEMORY[0x1E4F57420] makeObjectChangeEntityTypeMapToSet:v3];
  id v6 = *(id *)(a1 + 56);
  id v5 = v4;
  CalDatabaseEnumerateUnconsumedObjectChangesForClient();
}

void __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseConsumeAllChangesUpToToken_except_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFArray *a5, const __CFArray *a6)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
  id v18 = [v9 objectForKeyedSubscript:v10];

  uint64_t Count = CFArrayGetCount(a5);
  if (Count >= 1)
  {
    uint64_t v12 = Count;
    Mutable = CFArrayCreateMutable(0, Count, 0);
    for (CFIndex i = 0; i != v12; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a5, i);
      if (*(_DWORD *)(a1 + 56) >= (int)CFArrayGetValueAtIndex(a6, i))
      {
        id v16 = [MEMORY[0x1E4F28ED0] numberWithInt:ValueAtIndex];
        char v17 = [v18 containsObject:v16];

        if ((v17 & 1) == 0) {
          CFArrayAppendValue(Mutable, (const void *)(int)ValueAtIndex);
        }
      }
    }
    if (CFArrayGetCount(Mutable) > 0) {
      CalDatabaseClearIndividualChangeRowIDsForClient();
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
}

- (void)CADDatabaseMarkIndividualChangesConsumed:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v19 = [(ClientConnection *)self->_conn changeTrackingID];
  if (v19)
  {
    char v17 = v7;
    id v18 = v6;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          conn = self->_conn;
          uint64_t v15 = objc_msgSend(v13, "intValue", v17);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkIndividualChangesConsumed_reply___block_invoke;
          v20[3] = &unk_1E624DEE0;
          id v16 = v8;
          id v21 = v16;
          id v22 = v13;
          id v23 = self;
          id v24 = v19;
          [(ClientConnection *)conn withDatabaseID:v15 perform:v20];
        }
        uint64_t v10 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    id v7 = v17;
    v17[2](v17, 0);
    id v6 = v18;
  }
  else
  {
    v7[2](v7, 1018);
  }
}

void __98__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMarkIndividualChangesConsumed_reply___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  char v2 = objc_msgSend(MEMORY[0x1E4F57420], "makeObjectChangeEntityTypeMapToArray:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 allKeys];
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
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 intValue];
        uint64_t v9 = [v2 objectForKey:v8];
        uint64_t v10 = (const void *)[*(id *)(a1 + 48) _copyToIntCFArrayRef:v9];
        CalDatabaseClearIndividualChangeRowIDsForClient();
        CFRelease(v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (__CFArray)_copyToIntCFArrayRef:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  Mutable = CFArrayCreateMutable(0, [v3 count], 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        CFArrayAppendValue(Mutable, (const void *)(int)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "intValue", (void)v11));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return Mutable;
}

- (__CFSet)_copyToIntCFSetRef:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  Mutable = CFSetCreateMutable(0, [v3 count], 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        CFSetAddValue(Mutable, (const void *)(int)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "intValue", (void)v11));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return Mutable;
}

- (void)CADDatabaseGetSequenceToken:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__1;
  long long v13 = __Block_byref_object_dispose__1;
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  conn = self->_conn;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetSequenceToken___block_invoke;
  v8[3] = &unk_1E624DF08;
  void v8[4] = &v9;
  [(ClientConnection *)conn withAllDatabasesPerform:v8];
  uint64_t v6 = [CADSequenceToken alloc];
  uint64_t v7 = [(CADSequenceToken *)v6 initWithAllDBSequenceMap:v10[5]];
  v4[2](v4, 0, v7);

  _Block_object_dispose(&v9, 8);
}

void __79__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetSequenceToken___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t SequenceNumber = CalDatabaseGetSequenceNumber();
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = [MEMORY[0x1E4F28ED0] numberWithInt:SequenceNumber];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
  [v5 setObject:v7 forKey:v6];
}

- (void)CADDatabaseGetChangesSinceSequenceToken:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id, void *))a4;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  conn = self->_conn;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __97__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangesSinceSequenceToken_reply___block_invoke;
  uint64_t v19 = &unk_1E624DF30;
  id v11 = v6;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  id v23 = &v24;
  id v13 = v8;
  id v22 = v13;
  [(ClientConnection *)conn withAllDatabasesPerform:&v16];
  if (*((_DWORD *)v25 + 6))
  {

    id v13 = 0;
    id v14 = 0;
  }
  else
  {
    long long v15 = [CADSequenceToken alloc];
    id v14 = -[CADSequenceToken initWithAllDBSequenceMap:](v15, "initWithAllDBSequenceMap:", v12, v16, v17, v18, v19, v20, v21);
  }
  v7[2](v7, *((unsigned int *)v25 + 6), v13, v14);

  _Block_object_dispose(&v24, 8);
}

void __97__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangesSinceSequenceToken_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v7 = [*(id *)(a1 + 32) sequenceForDatabaseID:a2];
  if (v7 < 0)
  {
    uint64_t v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      int v15 = 67109120;
      int v16 = a2;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_INFO, "The sequence number for databaseID %d is less than 0. This should only happen when a new aux database is added", (uint8_t *)&v15, 8u);
    }
  }
  uint64_t SequenceNumber = CalDatabaseGetSequenceNumber();
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = [MEMORY[0x1E4F28ED0] numberWithInt:SequenceNumber];
  id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
  [v10 setObject:v11 forKey:v12];

  if (v7 <= (int)SequenceNumber)
  {
    id v14 = (void *)CalDatabaseCopyChangesSinceSequenceNumber();
    [*(id *)(a1 + 48) addEntriesFromDictionary:v14];
  }
  else
  {
    id v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v15 = 67109632;
      int v16 = v7;
      __int16 v17 = 1024;
      int v18 = SequenceNumber;
      __int16 v19 = 1024;
      int v20 = a2;
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "Error: The lastSequenceNumber %d is greater than the currentSequenceNumber %d for databaseID %d", (uint8_t *)&v15, 0x14u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1001;
    *a4 = 1;
  }
}

- (void)CADDatabaseGetChangedEntityIDsSinceTimestamp:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v8 = [(ClientConnection *)self->_conn databaseInitializationOptions];
  char v9 = [v8 allowIntegrations];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = [v6 allDatabases];
  if ([v13 count]) {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v13];
  }
  else {
    id v14 = 0;
  }
  conn = self->_conn;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangedEntityIDsSinceTimestamp_reply___block_invoke;
  v22[3] = &unk_1E624DF58;
  long long v28 = &v35;
  id v16 = v6;
  id v23 = v16;
  char v30 = v9;
  id v17 = v10;
  id v24 = v17;
  id v18 = v11;
  id v25 = v18;
  long long v29 = &v31;
  id v19 = v12;
  id v26 = v19;
  id v20 = v14;
  id v27 = v20;
  [(ClientConnection *)conn withAllDatabasesPerform:v22];
  if ([v20 count])
  {
    *((unsigned char *)v36 + 24) = 1;
LABEL_7:

    id v17 = 0;
    id v18 = 0;
    *((unsigned char *)v32 + 24) = 0;
    goto LABEL_8;
  }
  if (*((unsigned char *)v36 + 24)) {
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v21 = [[CADInMemoryChangeTimestamp alloc] initWithTimestamps:v19];
  (*((void (**)(id, void, id, id, CADInMemoryChangeTimestamp *, void))v7 + 2))(v7, 0, v17, v18, v21, *((unsigned __int8 *)v32 + 24));

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

void __102__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetChangedEntityIDsSinceTimestamp_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
  id v7 = [MEMORY[0x1E4F57460] changeTrackingForDatabase:a3];
  if (!v7)
  {
    uint64_t v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a2;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_ERROR, "No change tracking for database with id %i. (Will not return any changes.)", buf, 8u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    char v9 = (os_unfair_lock_s *)(a3 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 80));
    uint64_t v10 = *(void *)(a3 + 160);
    if (*MEMORY[0x1E4F56A58]) {
      os_unfair_lock_assert_owner(v9);
    }
    os_unfair_lock_unlock(v9);
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F57480]) initWithTimestampForMyself:CalMonotonicTime() others:v10];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) timestampForDatabase:a2];
    if (!v12) {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F57480]) initWithDawnOfTime];
    }
    uint64_t v20 = 1;
    *(void *)long long buf = 0;
    uint64_t v13 = *(unsigned __int8 *)(a1 + 88);
    id v19 = 0;
    id v14 = [v7 changedEntityIDsForDatabase:a3 sinceTimestamp:v12 allowIntegrationChanges:v13 latestTimestamp:&v19 changeType:&v20 deleteOffset:buf];
    id v11 = v19;
    if (v14)
    {
      [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v6];
      int v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)buf];
      [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v6];

      uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
      if (*(unsigned char *)(v16 + 24)) {
        BOOL v17 = v20 == 1;
      }
      else {
        BOOL v17 = 0;
      }
      char v18 = v17;
      *(unsigned char *)(v16 + 24) = v18;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
  }
  [*(id *)(a1 + 56) setObject:v11 forKeyedSubscript:v6];
  [*(id *)(a1 + 64) removeObject:v6];
}

- (void)CADDatabaseCanModifyCalendarDatabase:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, void, BOOL))a3 + 2))(v5, 0, [(CADXPCImplementation *)self _CADDatabaseCanModifyCalendarDatabase]);
}

- (BOOL)_CADDatabaseCanModifyCalendarDatabase
{
  char v2 = [(ClientConnection *)self->_conn permissionValidator];
  char v3 = [v2 canModifyCalendarDatabase];

  return v3;
}

- (void)CADDatabaseLastConfirmedSplashScreenVersion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, uint64_t))a3;
  id v5 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    conn = self->_conn;
    id v7 = v5;
    uint64_t v8 = [(ClientConnection *)conn identity];
    int v10 = 136315394;
    id v11 = "-[CADXPCImplementation(CADDatabaseOperationGroup) CADDatabaseLastConfirmedSplashScreenVersion:]";
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_DEBUG, "[%s] called by client: [%@].", (uint8_t *)&v10, 0x16u);
  }
  char v9 = [MEMORY[0x1E4F57440] shared];
  v4[2](v4, 0, objc_msgSend(v9, "get_LastConfirmedSplashScreenVersionViewed"));
}

- (void)CADDatabaseImportEvents:(id)a3 fromICSData:(id)a4 intoCalendarsWithIDs:(id)a5 optionsMask:(unint64_t)a6 batchSize:(int)a7 reply:(id)a8
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v59 = (void (**)(id, uint64_t, void))a8;
  v70 = v12;
  uint64_t v14 = [v12 count];
  uint64_t v58 = v13;
  v67 = v11;
  if (v14 != [v13 count])
  {
    char v18 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      *(_DWORD *)long long buf = 134218240;
      *(void *)&uint8_t buf[4] = [v12 count];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v13 count];
      _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_ERROR, "Mismatched number of data objects (%lu) and calendar row IDs (%lu).", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (v11)
  {
    uint64_t v15 = [v11 count];
    if (v15 != [v13 count])
    {
      uint64_t v20 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v20;
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = [v11 count];
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v13 count];
        _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Mismatched number of ID maps (%lu) and calendar row IDs (%lu).", buf, 0x16u);
      }
LABEL_9:
      v59[2](v59, 1001, 0);
      goto LABEL_48;
    }
  }
  uint64_t v100 = 0;
  uint64_t v101 = &v100;
  uint64_t v102 = 0x2020000000;
  int v103 = 0;
  id v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  unint64_t v16 = 0;
  uint64_t v17 = MEMORY[0x1E4F1CBF0];
  while (v16 < [v12 count])
  {
    [v63 addObject:v17];
    ++v16;
  }
  id v71 = (id)objc_opt_new();
  if (v11) {
    int v75 = objc_opt_new();
  }
  else {
    int v75 = 0;
  }
  uint64_t v74 = objc_opt_new();
  v73 = objc_opt_new();
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v58;
  uint64_t v22 = [obj countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v22)
  {
    uint64_t v23 = 0;
    uint64_t v66 = *(void *)v97;
    unsigned int v65 = *MEMORY[0x1E4F574B8];
    do
    {
      uint64_t v68 = v22;
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)v97 != v66) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        id v26 = [MEMORY[0x1E4F1CA98] null];
        BOOL v27 = v25 == v26;

        uint64_t v28 = v65;
        if (!v27) {
          uint64_t v28 = objc_msgSend(v25, "databaseID", v65);
        }
        long long v29 = [MEMORY[0x1E4F28ED0] numberWithInt:v28];
        char v30 = [v71 objectForKeyedSubscript:v29];
        uint64_t v31 = [v75 objectForKeyedSubscript:v29];
        long long v32 = [v74 objectForKeyedSubscript:v29];
        uint64_t v33 = [v73 objectForKeyedSubscript:v29];
        if (v30)
        {
          char v34 = v32;
        }
        else
        {
          char v30 = objc_opt_new();
          [v71 setObject:v30 forKeyedSubscript:v29];
          if (v75)
          {
            uint64_t v35 = objc_opt_new();

            [v75 setObject:v35 forKeyedSubscript:v29];
            uint64_t v31 = (void *)v35;
          }
          char v34 = objc_opt_new();

          [v74 setObject:v34 forKeyedSubscript:v29];
          uint64_t v36 = objc_opt_new();

          [v73 setObject:v36 forKeyedSubscript:v29];
          uint64_t v33 = (void *)v36;
        }
        uint64_t v37 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v23 + i];
        [v30 addObject:v37];

        char v38 = [v67 objectAtIndexedSubscript:v23 + i];
        [v31 addObject:v38];

        CFTypeRef v39 = [v70 objectAtIndexedSubscript:v23 + i];
        [v34 addObject:v39];

        [v33 addObject:v25];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v96 objects:v110 count:16];
      v23 += i;
    }
    while (v22);
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v107 = __Block_byref_object_copy__1;
  int v108 = __Block_byref_object_dispose__1;
  id v109 = [MEMORY[0x1E4F1CA48] array];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v72 = v71;
  uint64_t v40 = [v72 countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v40)
  {
    uint64_t v69 = *(void *)v93;
LABEL_32:
    uint64_t v41 = 0;
    while (1)
    {
      if (*(void *)v93 != v69) {
        objc_enumerationMutation(v72);
      }
      uint64_t v42 = *(void **)(*((void *)&v92 + 1) + 8 * v41);
      uint64_t v43 = [v42 intValue];
      uint64_t v44 = [v72 objectForKeyedSubscript:v42];
      char v45 = [v75 objectForKeyedSubscript:v42];
      uint64_t v46 = [v74 objectForKeyedSubscript:v42];
      id v47 = [v73 objectForKeyedSubscript:v42];
      conn = self->_conn;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __136__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply___block_invoke;
      v80[3] = &unk_1E624DF80;
      id v81 = v70;
      id v49 = v46;
      id v82 = v49;
      id v50 = v47;
      id v83 = v50;
      uint64_t v84 = self;
      id v51 = v45;
      int v91 = a7;
      id v85 = v51;
      uint64_t v88 = &v100;
      int v89 = buf;
      unint64_t v90 = a6;
      id v52 = v44;
      id v86 = v52;
      id v63 = v63;
      id v87 = v63;
      [(ClientConnection *)conn withDatabaseID:v43 perform:v80];
      int v53 = *((_DWORD *)v101 + 6);
      if (v53)
      {

        id v63 = 0;
      }

      if (v53) {
        break;
      }
      if (v40 == ++v41)
      {
        uint64_t v40 = [v72 countByEnumeratingWithState:&v92 objects:v105 count:16];
        if (v40) {
          goto LABEL_32;
        }
        break;
      }
    }
  }

  ((void (**)(id, uint64_t, id))v59)[2](v59, *((unsigned int *)v101 + 6), v63);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v54 = v63;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v76 objects:v104 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v77 != v56) {
          objc_enumerationMutation(v54);
        }
        [*(id *)(*(void *)&buf[8] + 40) addObjectsFromArray:*(void *)(*((void *)&v76 + 1) + 8 * j)];
      }
      uint64_t v55 = [v54 countByEnumeratingWithState:&v76 objects:v104 count:16];
    }
    while (v55);
  }

  [(ClientConnection *)self->_conn logAccessToObjects:*(void *)(*(void *)&buf[8] + 40)];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v100, 8);
LABEL_48:
}

void __136__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = *(id *)(v3 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v55 count:16];
  uint64_t v40 = v3;
  if (v6)
  {
    uint64_t v7 = v6;
    char v34 = 0;
    id obj = 0;
    uint64_t v35 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v10 = [*(id *)(v3 + 48) objectAtIndexedSubscript:&obj[i]];
        id v11 = [MEMORY[0x1E4F1CA98] null];

        id v12 = v10;
        if (v10 == v11)
        {

          id v12 = 0;
        }
        id v13 = *(void **)(v3 + 56);
        uint64_t v14 = [*(id *)(v3 + 64) objectAtIndexedSubscript:&obj[i]];
        uint64_t v15 = *(void *)(v40 + 104);
        uint64_t v16 = *(unsigned int *)(v40 + 112);
        id v45 = v12;
        uint64_t v17 = [v13 _importEvents:v14 data:v9 intoCalendarWithID:v12 inDatabase:a3 optionsMask:v15 batchSize:v16 outCalendarObjectID:&v45 outError:*(void *)(*(void *)(v40 + 88) + 8) + 24];
        id v18 = v45;

        uint64_t v3 = v40;
        if (*(_DWORD *)(*(void *)(*(void *)(v40 + 88) + 8) + 24))
        {
          uint64_t v20 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            int v21 = *(_DWORD *)(*(void *)(*(void *)(v40 + 88) + 8) + 24);
            *(_DWORD *)long long buf = 138543618;
            id v52 = v10;
            __int16 v53 = 1024;
            int v54 = v21;
            _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_ERROR, "Importing ICS data into calendar id %{public}@ failed with error %i", buf, 0x12u);
          }
          CalDatabaseRevert();

          goto LABEL_35;
        }
        [*(id *)(*(void *)(*(void *)(v40 + 96) + 8) + 40) addObject:v18];
        if (v17)
        {
          char v34 = 1;
        }
        else
        {
          id v19 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138543362;
            id v52 = v10;
            _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_INFO, "Importing ICS data into calendar id %{public}@ failed; returning no objects for this document",
              buf,
              0xCu);
          }
          uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
        }
        [v4 addObject:v17];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v55 count:16];
      obj += i;
      if (v7) {
        continue;
      }
      break;
    }

    if (v34) {
      CalDatabaseSave();
    }
  }
  else
  {
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v4;
  uint64_t v22 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v37 = v4;
    id obja = v5;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(obja);
        }
        BOOL v27 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
        long long v29 = [*(id *)(v40 + 72) objectAtIndexedSubscript:v24];
        objc_msgSend(*(id *)(v40 + 80), "setObject:atIndexedSubscript:", v28, (int)objc_msgSend(v29, "intValue"));
        CFIndex Count = CFArrayGetCount((CFArrayRef)v27);
        if (Count >= 1)
        {
          CFIndex v31 = Count;
          for (CFIndex k = 0; k != v31; ++k)
          {
            CFArrayGetValueAtIndex((CFArrayRef)v27, k);
            uint64_t v33 = CADEntityCopyObjectID();
            if (v33) {
              [v28 addObject:v33];
            }
          }
        }
        ++v24;
      }
      id v5 = obja;
      uint64_t v23 = [obja countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v23);
    uint64_t v4 = v37;
  }
LABEL_35:
}

- (id)_importEvents:(id)a3 data:(id)a4 intoCalendarWithID:(id)a5 inDatabase:(CalDatabase *)a6 optionsMask:(unint64_t)a7 batchSize:(int)a8 outCalendarObjectID:(id *)a9 outError:(int *)a10
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  if (a8) {
    CalDatabaseReset();
  }
  if (v18)
  {
    [v18 entityID];
    uint64_t DefaultCalendarForNewEvents = CalDatabaseCopyCalendarWithUID();
  }
  else
  {
    uint64_t DefaultCalendarForNewEvents = CalDatabaseCopyOrCreateDefaultCalendarForNewEvents();
  }
  uint64_t v20 = (const void *)DefaultCalendarForNewEvents;
  if ([(CADXPCImplementation *)self _CADDatabaseCanModifyCalendarDatabase])
  {
    if (!v20)
    {
      uint64_t v23 = 0;
      int v22 = 1001;
      uint64_t v24 = v16;
      goto LABEL_86;
    }
    int v21 = CADEntityCopyObjectID();
    unint64_t v72 = a7;
    if (v21)
    {
      if ([(ClientConnection *)self->_conn isCalendarRestricted:v20 forAction:1])
      {
        int v22 = 1013;
        if (!a9) {
          goto LABEL_17;
        }
      }
      else
      {
        if (v17) {
          int v22 = 0;
        }
        else {
          int v22 = 1001;
        }
        if (!a9)
        {
LABEL_17:

          if (v22)
          {
            uint64_t v23 = 0;
            uint64_t v24 = v16;
            goto LABEL_85;
          }
          uint64_t v25 = (const void *)CalCalendarCopyStore();
          uint64_t v24 = v16;
          id v71 = v25;
          if (v25)
          {
            if (CalStoreGetProhibitsICSImport())
            {
              id v26 = CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138543362;
                id v76 = v18;
                _os_log_impl(&dword_1BBC88000, v26, OS_LOG_TYPE_INFO, "Skipping import into calendar id %{public}@ because its source doesn't allow ICS import.", buf, 0xCu);
              }
              CalStoreGetType();
              updated = 0;
LABEL_81:
              CFRelease(v25);
LABEL_82:
              int v22 = 0;
              if (updated) {
                uint64_t v23 = updated;
              }
              else {
                uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
              }
              goto LABEL_85;
            }
            int Type = CalStoreGetType();
            if (v16) {
              char v30 = _copyExternalIDCallback;
            }
            else {
              char v30 = 0;
            }
            uint64_t v62 = v30;
            if (!Type)
            {
              uint64_t v31 = [(ClientConnection *)self->_conn localAccountInfo];
LABEL_38:
              v70 = (void *)v31;
              context = (void *)MEMORY[0x1C1867850]();
              id v73 = 0;
              long long v32 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithData:v17 options:v72 error:&v73];
              id v67 = v73;
              if (!v32)
              {
                uint64_t v40 = CADLogHandle;
                if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412290;
                  long long v41 = v67;
                  id v76 = v67;
                  _os_log_impl(&dword_1BBC88000, v40, OS_LOG_TYPE_ERROR, "Could not parse ICSDocument: %@", buf, 0xCu);
                  updated = 0;
                  long long v42 = 0;
                  long long v43 = v70;
                  uint64_t v25 = v71;
                }
                else
                {
                  updated = 0;
                  long long v42 = 0;
                  long long v43 = v70;
                  uint64_t v25 = v71;
                  long long v41 = v67;
                }
LABEL_80:

                if (!v25) {
                  goto LABEL_82;
                }
                goto LABEL_81;
              }
              unsigned int v65 = v32;
              uint64_t v33 = [v32 calendar];
              uint64_t v64 = v33;
              if ((*MEMORY[0x1E4F574D8] & v72) != 0)
              {
                uint64_t v34 = 0;
                int v35 = 0;
                int v36 = 1;
                uint64_t v25 = v71;
              }
              else
              {
                uint64_t v34 = [v33 method];
                uint64_t v25 = v71;
                int v35 = 0;
                int v36 = 1;
                switch((int)v34)
                {
                  case 0:
                  case 1:
                    break;
                  case 2:
                  case 5:
                    int v35 = 1;
                    break;
                  case 3:
                    int v36 = 0;
                    int v35 = 1;
                    uint64_t v34 = 3;
                    break;
                  default:
                    int v35 = 0;
                    int v36 = 0;
                    break;
                }
              }
              int v69 = v36;
              if ((*MEMORY[0x1E4F574E8] & v72) != 0) {
                int v37 = v35;
              }
              else {
                int v37 = 0;
              }
              int v66 = v37;
              BOOL v61 = (*MEMORY[0x1E4F574C8] & v72) != 0;
              id v63 = [MEMORY[0x1E4FB7F00] ICSStringFromMethod:v34];
              if (v35 & 1) != 0 || (v69)
              {
                if ((v69 | v66))
                {
                  log = CADLogHandle;
                  BOOL v44 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT);
                  if (v69)
                  {
                    if (v66)
                    {
                      if (!v44)
                      {
LABEL_63:
                        long long v46 = [v64 components];
                        LOBYTE(v59) = 1;
                        updated = (void *)CalItemsUpdateFromiCalendarDocumentWithOptionsIncludingPhantomMaster();
                        long long v47 = objc_msgSend(v64, "components", v16, v62, v16, v59, v70);
                        if (v47 == v46) {
                          int v48 = 0;
                        }
                        else {
                          int v48 = v66;
                        }

                        if (v48 == 1) {
                          [v64 setComponents:v46 options:2];
                        }

                        uint64_t v25 = v71;
LABEL_72:
                        long long v43 = v70;
                        if (v66)
                        {
                          long long v49 = self;
                          long long v42 = v65;
                          uint64_t v50 = [(CADXPCImplementation *)v49 _handleiTIPMesssageAndCopyEventFromDocument:v65 data:v17 database:a6 store:v25 accountInfo:v70 options:v61];
                          if (v50)
                          {
                            id v51 = (const void *)v50;
                            if ((v69 & 1) == 0)
                            {
                              uint64_t v74 = v50;
                              uint64_t v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];

                              updated = (void *)v52;
                              long long v42 = v65;
                            }
                            long long v41 = v67;
                            CFRelease(v51);
                            goto LABEL_79;
                          }
                          int v54 = (void *)CADLogHandle;
                          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v55 = v54;
                            uint64_t v56 = [v65 calendar];
                            int v57 = [v56 componentKeys];
                            uint64_t v58 = [v57 firstObject];
                            *(_DWORD *)long long buf = 138412290;
                            id v76 = v58;
                            _os_log_impl(&dword_1BBC88000, v55, OS_LOG_TYPE_ERROR, "Didn't find event while handling iTIP message. (%@)", buf, 0xCu);

                            uint64_t v24 = v16;
                            long long v42 = v65;

                            long long v43 = v70;
                          }
                        }
                        else
                        {
                          long long v42 = v65;
                        }
                        long long v41 = v67;
LABEL_79:

                        goto LABEL_80;
                      }
                      *(_DWORD *)long long buf = 138543362;
                      id v76 = v63;
                      id v45 = "Importing & handling iTIP message of type %{public}@";
                    }
                    else if (v35)
                    {
                      if (!v44) {
                        goto LABEL_63;
                      }
                      *(_DWORD *)long long buf = 138543362;
                      id v76 = v63;
                      id v45 = "Import-only requested for iTIP message of type %{public}@";
                    }
                    else
                    {
                      if (!v44) {
                        goto LABEL_63;
                      }
                      *(_DWORD *)long long buf = 138543362;
                      id v76 = v63;
                      id v45 = "Importing ICS with type %{public}@";
                    }
                    _os_log_impl(&dword_1BBC88000, log, OS_LOG_TYPE_DEFAULT, v45, buf, 0xCu);
                    goto LABEL_63;
                  }
                  if (v44)
                  {
                    *(_DWORD *)long long buf = 138543362;
                    id v76 = v63;
                    _os_log_impl(&dword_1BBC88000, log, OS_LOG_TYPE_DEFAULT, "Handling iTIP message of type %{public}@", buf, 0xCu);
                  }
LABEL_71:
                  updated = 0;
                  goto LABEL_72;
                }
                char v38 = CADLogHandle;
                if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                {
LABEL_62:
                  if (v69) {
                    goto LABEL_63;
                  }
                  goto LABEL_71;
                }
                *(_DWORD *)long long buf = 138543362;
                id v76 = v63;
                CFTypeRef v39 = "Got an iTIP message of type %{public}@, but asked not to handle it. Not importing.";
              }
              else
              {
                char v38 = CADLogHandle;
                if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_62;
                }
                *(_DWORD *)long long buf = 138543362;
                id v76 = v63;
                CFTypeRef v39 = "Unsupported message type %{public}@. Not importing.";
              }
              _os_log_impl(&dword_1BBC88000, v38, OS_LOG_TYPE_ERROR, v39, buf, 0xCu);
              goto LABEL_62;
            }
          }
          else
          {
            if (v16) {
              uint64_t v28 = _copyExternalIDCallback;
            }
            else {
              uint64_t v28 = 0;
            }
            uint64_t v62 = v28;
          }
          uint64_t v31 = [objc_alloc(MEMORY[0x1E4F57438]) initWithStore:v25];
          goto LABEL_38;
        }
      }
    }
    else
    {
      int v22 = 1001;
      if (!a9) {
        goto LABEL_17;
      }
    }
    *a9 = v21;
    goto LABEL_17;
  }
  uint64_t v23 = 0;
  int v22 = 1016;
  uint64_t v24 = v16;
  if (v20) {
LABEL_85:
  }
    CFRelease(v20);
LABEL_86:
  if (a10) {
    *a10 = v22;
  }

  return v23;
}

- (void)_handleiTIPMesssageAndCopyEventFromDocument:(id)a3 data:(id)a4 database:(CalDatabase *)a5 store:(void *)a6 accountInfo:(id)a7 options:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F57498]) initWithData:v14 document:v13 filename:0 scheduleChanges:0];
  [v16 setIMIPImported:1];
  id v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __135__CADXPCImplementation_CADDatabaseOperationGroup___handleiTIPMesssageAndCopyEventFromDocument_data_database_store_accountInfo_options___block_invoke;
  v21[3] = &unk_1E624DFA8;
  void v21[4] = &v22;
  id v18 = (void *)MEMORY[0x1C1867AB0](v21);
  [MEMORY[0x1E4F57490] processMessages:v17 withDatabase:a5 calStore:a6 accountInfo:v15 handledEventCallback:v18 cancellationToken:0 options:a8];
  CalDatabaseSave();
  id v19 = (void *)v23[3];

  _Block_object_dispose(&v22, 8);
  return v19;
}

void *__135__CADXPCImplementation_CADDatabaseOperationGroup___handleiTIPMesssageAndCopyEventFromDocument_data_database_store_accountInfo_options___block_invoke(void *result, int a2, int a3, int a4, CFTypeRef cf)
{
  if (cf)
  {
    id v5 = result;
    if (!*(void *)(*(void *)(result[4] + 8) + 24))
    {
      uint64_t result = CFRetain(cf);
      *(void *)(*(void *)(v5[4] + 8) + 24) = result;
    }
  }
  return result;
}

- (void)CADDatabaseExportICSDataForCalendarItems:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__1;
  id v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  conn = self->_conn;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __106__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendarItems_options_reply___block_invoke;
  id v17 = &unk_1E624DFD0;
  id v19 = &v22;
  uint64_t v20 = &v28;
  id v11 = v8;
  id v18 = v11;
  unint64_t v21 = a4;
  if (![(ClientConnection *)conn withDatabaseForObjects:v11 perform:&v14])
  {
    *((_DWORD *)v29 + 6) = 1010;
    goto LABEL_5;
  }
  if (*((_DWORD *)v29 + 6))
  {
LABEL_5:
    id v13 = (void *)v23[5];
    void v23[5] = 0;

    uint64_t v12 = *((unsigned int *)v29 + 6);
    goto LABEL_6;
  }
  uint64_t v12 = 0;
LABEL_6:
  v9[2](v9, v12, v23[5]);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v11, v14, v15, v16, v17);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

void __106__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendarItems_options_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_ERROR, "-CADDatabaseExportICSDataForCalendarItems:options:reply: does not support combining items in multiple databases into a single ICS document", buf, 2u);
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    int v11 = 1001;
    goto LABEL_6;
  }
  CFIndex v12 = [*(id *)(a1 + 32) count];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, v12, MEMORY[0x1E4F1D510]);
  if (!Mutable)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    int v11 = 1007;
LABEL_6:
    *(_DWORD *)(v10 + 24) = v11;
    goto LABEL_7;
  }
  uint64_t v14 = Mutable;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = CADCopyEntityInDatabase(a4, *(void **)(*((void *)&v25 + 1) + 8 * v19));
        if (v20)
        {
          unint64_t v21 = v20;
          CFArrayAppendValue(v14, v20);
          CFRelease(v21);
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v17);
  }

  uint64_t v22 = CalCreateiCalendarDataFromCalEntitiesWithOptions();
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  CFRelease(v14);
LABEL_7:
}

- (void)CADDatabaseExportICSDataForCalendar:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__1;
  long long v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  uint64_t v10 = objc_opt_new();
  conn = self->_conn;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __101__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendar_options_reply___block_invoke;
  uint64_t v18 = &unk_1E624DFF8;
  id v12 = v8;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  unint64_t v21 = self;
  uint64_t v22 = &v31;
  uint64_t v23 = &v25;
  unint64_t v24 = a4;
  if ([(ClientConnection *)conn withDatabaseForObject:v12 perform:&v15])
  {
    uint64_t v14 = *((unsigned int *)v32 + 6);
  }
  else
  {
    uint64_t v14 = 1010;
    *((_DWORD *)v32 + 6) = 1010;
  }
  v9[2](v9, v14, v26[5]);
  -[ClientConnection logAccessToEntities:](self->_conn, "logAccessToEntities:", v13, v15, v16, v17, v18);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __101__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendar_options_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  [*(id *)(a1 + 40) addObject:v4];
  if (v4)
  {
    if ([*(id *)(*(void *)(a1 + 48) + 8) isCalendarRestricted:v4 forAction:0])
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
      CFRelease(v4);
    }
    else
    {
      id v8 = *(id *)(a1 + 40);
      uint64_t v5 = CalCreateiCalendarDataFromCalendarWithOptions();
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1007;
      }
      CFRelease(v4);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

uint64_t __101__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseExportICSDataForCalendar_options_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

- (void)CADDatabaseSetShowsDeclinedEvents:(BOOL)a3 reply:(id)a4
{
  int v4 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  if (CalShowDeclinedEvents() != v4)
  {
    CalSetShowDeclinedEvents();
    [(ClientConnection *)self->_conn withAllDatabasesPerform:&__block_literal_global_7];
  }
  v6[2](v6, 0);
}

uint64_t __91__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseSetShowsDeclinedEvents_reply___block_invoke()
{
  return CalDatabaseRebuildOccurrenceCache();
}

- (void)CADDatabaseSetShowsCompletedReminders:(BOOL)a3 reply:(id)a4
{
  int v4 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  if (CalShowCompletedReminders() != v4)
  {
    CalSetShowCompletedReminders();
    [(ClientConnection *)self->_conn withAllDatabasesPerform:&__block_literal_global_35];
  }
  v6[2](v6, 0);
}

uint64_t __95__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseSetShowsCompletedReminders_reply___block_invoke()
{
  return CalDatabaseRebuildOccurrenceCache();
}

- (void)CADDatabaseRebuildOccurrenceCacheWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void))a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  uint64_t v5 = (id)CADLogHandle;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(ClientConnection *)self->_conn identity];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEBUG, "Received request to rebuild the occurrence cache from: [%@]", buf, 0xCu);
  }
  conn = self->_conn;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRebuildOccurrenceCacheWithReply___block_invoke;
  v8[3] = &unk_1E624DF08;
  void v8[4] = &v9;
  [(ClientConnection *)conn withAllDatabasesPerform:v8];
  v4[2](v4, *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
}

void __94__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseRebuildOccurrenceCacheWithReply___block_invoke(uint64_t a1)
{
  int v2 = CalDatabaseRebuildOccurrenceCache();
  uint64_t v3 = CADLogHandle;
  BOOL v4 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEBUG, "The occurrence cache was rebuilt successfully.", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEBUG, "The occurrence cache was not rebuilt successfully.", v5, 2u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1017;
  }
}

- (void)CADDatabaseCommitDeletes:(id)a3 updatesAndInserts:(id)a4 options:(int64_t)a5 andFetchChangesSinceTimestamp:(id)a6 withReply:(id)a7
{
  char v9 = a5;
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v128 = a4;
  id v105 = a6;
  id v109 = (void (**)(void))a7;
  uint64_t v183 = 0;
  v184 = &v183;
  uint64_t v185 = 0x2020000000;
  int v186 = 0;
  __int16 v130 = self;
  BOOL v13 = [(CADXPCImplementation *)self _CADDatabaseCanModifyCalendarDatabase];
  uint64_t v14 = v184;
  if (v13)
  {
    if (*((_DWORD *)v184 + 6) || [(ClientConnection *)self->_conn eventAccessLevel])
    {
      if ((v9 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    uint64_t v14 = v184;
    int v15 = 1013;
  }
  else
  {
    int v15 = 1016;
  }
  *((_DWORD *)v14 + 6) = v15;
  if (v9)
  {
LABEL_8:
    uint64_t v16 = [(CADXPCImplementation *)self removeDuplicateEvents:v128];

    id v128 = (id)v16;
  }
LABEL_9:
  int v110 = objc_opt_new();
  id v111 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v134 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v112 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v182 = -1;
  id v133 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  id obj = v12;
  uint64_t v17 = [obj countByEnumeratingWithState:&v178 objects:v206 count:16];
  if (v17)
  {
    __int16 v127 = 0;
    __int16 v132 = 0;
    uint64_t v18 = *(void *)v179;
    int v19 = *MEMORY[0x1E4F574B8];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v179 != v18) {
          objc_enumerationMutation(obj);
        }
        unint64_t v21 = *(void **)(*((void *)&v178 + 1) + 8 * i);
        uint64_t v22 = [v21 databaseID];
        uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v22];
        id v24 = [v134 objectForKeyedSubscript:v23];
        if (!v24)
        {
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v134 setObject:v24 forKeyedSubscript:v23];
        }
        [v24 addObject:v21];
        [v133 addObject:v23];
        if (v22 != v19 && [v21 entityType] == 6)
        {
          if (!v132)
          {
            __int16 v132 = objc_opt_new();
            uint64_t v25 = objc_opt_new();

            __int16 v127 = (void *)v25;
          }
          [v132 addObject:v23];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v178 objects:v206 count:16];
    }
    while (v17);
  }
  else
  {
    __int16 v127 = 0;
    __int16 v132 = 0;
  }

  int v26 = [(ClientConnection *)v130->_conn eventAccessLevel];
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v27 = v128;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v174 objects:v205 count:16];
  if (!v28)
  {

    __int16 v129 = 0;
    int v36 = v184;
    goto LABEL_87;
  }
  __int16 v129 = 0;
  uint64_t v29 = *(void *)v175;
  do
  {
    for (uint64_t j = 0; j != v28; ++j)
    {
      if (*(void *)v175 != v29) {
        objc_enumerationMutation(v27);
      }
      uint64_t v31 = *(void **)(*((void *)&v174 + 1) + 8 * j);
      int v32 = [v31 entityType];
      if (v32 == 1) {
        goto LABEL_33;
      }
      if (v32 != 2)
      {
        if (v32 != 6) {
          continue;
        }
LABEL_33:
        if (v26 == 1)
        {
          uint64_t v33 = (id)CADLogHandle;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            int v34 = [v27 objectForKeyedSubscript:v31];
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v34;
            _os_log_impl(&dword_1BBC88000, v33, OS_LOG_TYPE_ERROR, "With limited access, we should not allow changing calendar or store entity with ID %{public}@ (updates: %@)", buf, 0x16u);
          }
          *((_DWORD *)v184 + 6) = 1013;
        }
        continue;
      }
      if ([v31 isTemporary])
      {
        int v35 = v129;
        if (!v129) {
          int v35 = objc_opt_new();
        }
        __int16 v129 = v35;
        [v35 addObject:v31];
      }
    }
    uint64_t v28 = [v27 countByEnumeratingWithState:&v174 objects:v205 count:16];
  }
  while (v28);

  int v36 = v184;
  if (v129)
  {
    if (!*((_DWORD *)v184 + 6))
    {
      int v37 = v130->_conn;
      id v38 = v129;
      uint64_t v198 = 0;
      v199 = &v198;
      uint64_t v200 = 0x2020000000;
      int v201 = 0;
      int v103 = +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:0 withConnection:v37 limitedAccess:0];
      int v116 = [(ClientConnection *)v37 effectiveApplicationIdentifier];
      uint64_t v102 = v37;
      id v113 = [(ClientConnection *)v37 effectiveTeamIdentifier];
      id v39 = v27;
      id v118 = (id)[v39 mutableCopy];
      long long v197 = 0u;
      long long v195 = 0u;
      long long v196 = 0u;
      long long v194 = 0u;
      id v40 = v38;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v194 objects:buf count:16];
      __int16 v129 = v40;
      if (v41)
      {
        uint64_t v42 = *(void *)v195;
        uint64_t v121 = *MEMORY[0x1E4F57168];
        uint64_t v107 = *MEMORY[0x1E4F56BB0];
        uint64_t v106 = *MEMORY[0x1E4F56F98];
        uint64_t v104 = *MEMORY[0x1E4F56FA0];
        while (2)
        {
          uint64_t v43 = v41;
          for (uint64_t k = 0; k != v43; ++k)
          {
            if (*(void *)v195 != v42) {
              objc_enumerationMutation(v40);
            }
            id v45 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v194 + 1) + 8 * k);
            long long v46 = objc_msgSend(v118, "objectForKeyedSubscript:");
            v124 = (void *)[v46 mutableCopy];

            if (v26 == 1)
            {
              long long v47 = [v39 objectForKeyedSubscript:v45];
              int v48 = [v47 valueForKey:v121];

              if (v48)
              {
                long long v49 = [v39 objectForKeyedSubscript:v48];
                do
                {
                  if (![v48 isTemporary])
                  {
                    if (*((_DWORD *)v199 + 6))
                    {
                      id v51 = v49;
                      goto LABEL_147;
                    }
                    if (!v49
                      || ([v49 valueForKey:v107],
                          __int16 v53 = objc_claimAutoreleasedReturnValue(),
                          BOOL v54 = v53 == 0,
                          v53,
                          v54))
                    {
                      *(void *)v207 = 0;
                      *(void *)&v207[8] = v207;
                      *(void *)&v207[16] = 0x3032000000;
                      v208 = __Block_byref_object_copy__1;
                      v209 = __Block_byref_object_dispose__1;
                      id v210 = 0;
                      uint64_t v187 = MEMORY[0x1E4F143A8];
                      uint64_t v188 = 3221225472;
                      uint64_t v189 = (uint64_t)___handleNewCreatedEvents_block_invoke;
                      v190 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E624E1D8;
                      uint64_t v59 = v48;
                      v191 = v59;
                      v192 = &v198;
                      v193 = v207;
                      [(ClientConnection *)v102 withDatabaseForObject:v59 perform:&v187];
                      if (*((_DWORD *)v199 + 6))
                      {

                        _Block_object_dispose(v207, 8);
                        int v48 = v59;
                        goto LABEL_85;
                      }
                      [v124 setObject:*(void *)(*(void *)&v207[8] + 40) forKeyedSubscript:v107];

                      _Block_object_dispose(v207, 8);
                    }
                    else
                    {
                      uint64_t v55 = [v49 valueForKey:v107];
                      char v56 = [v55 isVirtual];
                      int v57 = v103;
                      if ((v56 & 1) == 0)
                      {
                        int v58 = objc_msgSend(v55, "isTemporary", v103);
                        int v57 = v55;
                        if (v58) {
                          int v57 = v103;
                        }
                      }
                      [v124 setObject:v57 forKeyedSubscript:v107];
                    }
                    id v51 = v49;
                    goto LABEL_72;
                  }
                  if (!v49)
                  {
                    uint64_t v60 = CADLogHandle;
                    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v207 = 138412802;
                      *(void *)&v207[4] = v48;
                      *(_WORD *)&v207[12] = 2112;
                      *(void *)&v207[14] = v39;
                      *(_WORD *)&v207[22] = 2112;
                      v208 = v45;
                      _os_log_impl(&dword_1BBC88000, v60, OS_LOG_TYPE_ERROR, "Error when trying to fetch changes for a temporary item %@ that should exist in updates dictionary %@ but it doesn't, when handlng new created event %@ for limited access client.", v207, 0x20u);
                    }
                    *((_DWORD *)v199 + 6) = 1007;
                    goto LABEL_85;
                  }
                  uint64_t v50 = [v49 valueForKey:v121];

                  id v51 = [v39 objectForKeyedSubscript:v50];

                  int v48 = (void *)v50;
                  long long v49 = v51;
                }
                while (v50);
                if (!*((_DWORD *)v199 + 6)) {
                  goto LABEL_57;
                }
                int v48 = 0;
LABEL_147:

LABEL_85:
                id v40 = v129;
                goto LABEL_86;
              }
              uint64_t v52 = [v39 objectForKeyedSubscript:v45];
              id v51 = [v52 valueForKey:v107];

              if (v51 && (([v51 isVirtual] & 1) != 0 || objc_msgSend(v51, "isTemporary"))) {
LABEL_57:
              }
                [v124 setObject:v103 forKeyedSubscript:v107];
LABEL_72:
            }
            if (v116) {
              [v124 setObject:v116 forKeyedSubscript:v106];
            }
            if (v113) {
              [v124 setObject:v113 forKeyedSubscript:v104];
            }
            [v118 setObject:v124 forKeyedSubscript:v45];

            id v40 = v129;
          }
          uint64_t v41 = [v129 countByEnumeratingWithState:&v194 objects:buf count:16];
          if (v41) {
            continue;
          }
          break;
        }
      }
LABEL_86:

      id v61 = v118;
      int v62 = *((_DWORD *)v199 + 6);

      _Block_object_dispose(&v198, 8);
      id v27 = v61;

      int v36 = v184;
      *((_DWORD *)v184 + 6) = v62;
    }
  }
  else
  {
    __int16 v129 = 0;
  }
LABEL_87:
  if (*((_DWORD *)v36 + 6)) {
    goto LABEL_103;
  }
  id v63 = (void *)[v27 mutableCopy];
  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v64 = v27;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v170 objects:v204 count:16];
  if (!v65) {
    goto LABEL_102;
  }
  uint64_t v66 = *(void *)v171;
  id v114 = (id)*MEMORY[0x1E4F56AA0];
  __int16 v122 = (void *)*MEMORY[0x1E4F571A0];
  id v119 = (id)*MEMORY[0x1E4F57180];
  unint64_t v117 = (void *)*MEMORY[0x1E4F571C0];
  uint64_t v125 = (void *)*MEMORY[0x1E4F56BF8];
  uint64_t v67 = *MEMORY[0x1E4F57168];
  while (2)
  {
    uint64_t v68 = 0;
    while (2)
    {
      if (*(void *)v171 != v66) {
        objc_enumerationMutation(v64);
      }
      int v69 = *(void **)(*((void *)&v170 + 1) + 8 * v68);
      if (v26 == 1)
      {
        int v70 = [*(id *)(*((void *)&v170 + 1) + 8 * v68) entityType];
        if ((v70 - 7) < 2)
        {
          _recursivelyFindAndReplacePropertyFromRebasedObject(v130->_conn, v69, v64, v122, v63);
          _recursivelyFindAndReplacePropertyFromRebasedObject(v130->_conn, v69, v64, v119, v63);
          id v71 = v117;
LABEL_99:
          _recursivelyFindAndReplacePropertyFromRebasedObject(v130->_conn, v69, v64, v71, v63);
        }
        else
        {
          id v71 = v125;
          if (v70 == 2) {
            goto LABEL_99;
          }
          if (v70 == 4)
          {
            id v71 = v114;
            goto LABEL_99;
          }
        }
      }
      unint64_t v72 = [v63 objectForKeyedSubscript:v69];
      id v73 = (void *)[v72 mutableCopy];

      [v73 removeObjectForKey:v67];
      [v63 setObject:v73 forKeyedSubscript:v69];

      if (v65 != ++v68) {
        continue;
      }
      break;
    }
    uint64_t v65 = [v64 countByEnumeratingWithState:&v170 objects:v204 count:16];
    if (v65) {
      continue;
    }
    break;
  }
LABEL_102:

  id v27 = v63;
  if (*((_DWORD *)v184 + 6))
  {
LABEL_103:
    int v74 = 0;
    __int16 v126 = 0;
    int v75 = 0;
  }
  else
  {
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    id v27 = v27;
    int v74 = 0;
    uint64_t v89 = [v27 countByEnumeratingWithState:&v166 objects:v203 count:16];
    if (v89)
    {
      __int16 v126 = 0;
      int v75 = 0;
      uint64_t v90 = *(void *)v167;
      while (2)
      {
        for (uint64_t m = 0; m != v89; ++m)
        {
          if (*(void *)v167 != v90) {
            objc_enumerationMutation(v27);
          }
          long long v92 = *(void **)(*((void *)&v166 + 1) + 8 * m);
          if ([v92 isTemporary])
          {
            id v165 = v75;
            id v164 = v126;
            uint64_t v93 = [(CADXPCImplementation *)v130 findDatabaseForObject:v92 withUpdates:v27 personas:&v165 accounts:&v164 nextTempDBID:&v182];
            id v94 = v165;

            id v95 = v164;
            if (v93 == 0x80000000)
            {
              uint64_t v100 = (id)CADLogHandle;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
              {
                uint64_t v101 = [v27 objectForKeyedSubscript:v92];
                *(_DWORD *)long long buf = 138543618;
                *(void *)&uint8_t buf[4] = v92;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v101;
                _os_log_impl(&dword_1BBC88000, v100, OS_LOG_TYPE_ERROR, "Couldn't find database for object with temporary ID %{public}@ (updates: %@)", buf, 0x16u);
              }
              *((_DWORD *)v184 + 6) = 1001;
              __int16 v126 = v95;
              int v75 = v94;
              goto LABEL_144;
            }
            long long v96 = [MEMORY[0x1E4F28ED0] numberWithInt:v93];
            id v97 = [v111 objectForKeyedSubscript:v96];
            if (!v97)
            {
              id v97 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v111 setObject:v97 forKeyedSubscript:v96];
            }
            [v97 addObject:v92];

            ++v74;
            __int16 v126 = v95;
            int v75 = v94;
          }
          else
          {
            long long v96 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v92, "databaseID"));
            [v110 addObject:v92];
          }
          id v98 = [v112 objectForKeyedSubscript:v96];
          if (!v98)
          {
            id v98 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v112 setObject:v98 forKeyedSubscript:v96];
          }
          long long v99 = [v27 objectForKeyedSubscript:v92];
          [v98 setObject:v99 forKeyedSubscript:v92];

          [v133 addObject:v96];
        }
        uint64_t v89 = [v27 countByEnumeratingWithState:&v166 objects:v203 count:16];
        if (v89) {
          continue;
        }
        break;
      }
    }
    else
    {
      __int16 v126 = 0;
      int v75 = 0;
    }
LABEL_144:
  }
  __int16 v123 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v74];
  if (!*((_DWORD *)v184 + 6))
  {
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v115 = v133;
    uint64_t v76 = [v115 countByEnumeratingWithState:&v160 objects:v202 count:16];
    if (v76)
    {
      id v120 = *(id *)v161;
      unsigned int v108 = *MEMORY[0x1E4F574B8];
LABEL_107:
      uint64_t v77 = 0;
      while (1)
      {
        if (*(id *)v161 != v120) {
          objc_enumerationMutation(v115);
        }
        long long v78 = *(void **)(*((void *)&v160 + 1) + 8 * v77);
        long long v79 = [v111 objectForKeyedSubscript:v78];
        uint64_t v80 = [v134 objectForKeyedSubscript:v78];
        id v81 = [v112 objectForKeyedSubscript:v78];
        uint64_t v82 = [v78 intValue];
        if ((v82 & 0x80000000) != 0)
        {
          conn = v130->_conn;
          v141[0] = MEMORY[0x1E4F143A8];
          v141[1] = 3221225472;
          v141[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2;
          v141[3] = &unk_1E624E090;
          id v142 = v75;
          v143 = v78;
          id v144 = v126;
          v145 = v130;
          v150 = &v183;
          id v146 = v79;
          id v147 = v80;
          id v148 = v81;
          id v149 = v123;
          [(ClientConnection *)conn withDatabaseID:v108 perform:v141];
        }
        else
        {
          *((_DWORD *)v184 + 6) = 1010;
          id v83 = v130->_conn;
          v151[0] = MEMORY[0x1E4F143A8];
          v151[1] = 3221225472;
          v151[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke;
          v151[3] = &unk_1E624E040;
          v159 = &v183;
          v151[4] = v130;
          id v152 = v79;
          id v153 = v80;
          id v154 = v81;
          id v155 = v123;
          id v156 = v132;
          v157 = v78;
          id v158 = v127;
          [(ClientConnection *)v83 withDatabaseID:v82 perform:v151];
        }
        BOOL v85 = *((_DWORD *)v184 + 6) == 0;

        if (!v85) {
          break;
        }
        if (v76 == ++v77)
        {
          uint64_t v76 = [v115 countByEnumeratingWithState:&v160 objects:v202 count:16];
          if (v76) {
            goto LABEL_107;
          }
          break;
        }
      }
    }

    if (!*((_DWORD *)v184 + 6) && ([v75 count] || objc_msgSend(v127, "count")))
    {
      id v86 = v130->_conn;
      uint64_t v87 = *MEMORY[0x1E4F574B8];
      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2_38;
      v136[3] = &unk_1E624E0B8;
      id v137 = v75;
      v140 = &v183;
      id v138 = v126;
      id v139 = v127;
      [(ClientConnection *)v86 withDatabaseID:v87 perform:v136];
    }
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v212 = __Block_byref_object_copy__1;
  v213 = __Block_byref_object_dispose__1;
  id v214 = 0;
  *(void *)v207 = 0;
  *(void *)&v207[8] = v207;
  *(void *)&v207[16] = 0x2020000000;
  LOBYTE(v208) = 0;
  *(void *)&long long v194 = 0;
  *((void *)&v194 + 1) = &v194;
  *(void *)&long long v195 = 0x3032000000;
  *((void *)&v195 + 1) = __Block_byref_object_copy__1;
  *(void *)&long long v196 = __Block_byref_object_dispose__1;
  *((void *)&v196 + 1) = 0;
  uint64_t v187 = 0;
  uint64_t v188 = (uint64_t)&v187;
  uint64_t v189 = 0x3032000000;
  v190 = __Block_byref_object_copy__1;
  v191 = __Block_byref_object_dispose__1;
  v192 = 0;
  if (!*((_DWORD *)v184 + 6))
  {
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_39;
    v135[3] = &unk_1E624E0E0;
    v135[4] = &v194;
    v135[5] = &v187;
    v135[6] = buf;
    v135[7] = v207;
    [(CADXPCImplementation *)v130 CADDatabaseGetChangedEntityIDsSinceTimestamp:v105 reply:v135];
  }
  v109[2]();
  uint64_t v88 = [v123 allValues];
  [v110 addObjectsFromArray:v88];

  [(ClientConnection *)v130->_conn logAccessToObjects:v110];
  _Block_object_dispose(&v187, 8);

  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(v207, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v183, 8);
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(a1 + 32) insert:*(void *)(a1 + 40) deletes:*(void *)(a1 + 48) updates:*(void *)(a1 + 56) insertedObjectIDMap:*(void *)(a1 + 64) inDatabase:a3];
  if ([*(id *)(a1 + 72) containsObject:*(void *)(a1 + 80)])
  {
    BOOL v4 = (void *)CalDatabaseCopyOfAllStores();
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)CalStoreCopyExternalID();
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, v12);
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [*(id *)(a1 + 88) setObject:v5 forKeyedSubscript:*(void *)(a1 + 80)];
  }
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:v2];
  BOOL v4 = [*(id *)(*(void *)(a1 + 56) + 8) databaseInitializationOptions];
  id v5 = objc_alloc(MEMORY[0x1E4F57468]);
  id v6 = [v4 databaseDirectory];
  uint64_t v7 = (void *)[v5 initWithDirectoryURL:v6];

  objc_msgSend(v7, "setOptions:", objc_msgSend(v4, "databaseInitOptions"));
  uint64_t v8 = [v4 calendarDataContainerProvider];

  if (v8)
  {
    uint64_t v9 = [v4 calendarDataContainerProvider];
    [v7 setDataContainerProvider:v9];
  }
  uint64_t v10 = CalDatabaseCreateWithConfigurationForPersonaID();
  if (v10)
  {
    uint64_t v11 = (const void *)v10;
    uint64_t v12 = CalDatabaseCopyAuxDatabaseForPersonaID();
    if (v12)
    {
      long long v13 = (const void *)v12;
      id v27 = v3;
      uint64_t v28 = v2;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = v3;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v25 = v11;
        int v26 = v7;
        uint64_t v17 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v14);
            }
            AuxDatabaseAccount = (const void *)CalDatabaseCreateAuxDatabaseAccount();
            CalAuxDatabaseAccountSetAccountID();
            CalAuxDatabaseAddAccount();
            CFRelease(AuxDatabaseAccount);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v16);

        CFRelease(v13);
        CalDatabaseSave();
        uint64_t v11 = v25;
        uint64_t v7 = v26;
      }
      else
      {

        CFRelease(v13);
      }
      uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
      [*(id *)(*(void *)(a1 + 56) + 8) addCreatedAuxDatabase:v11];
      uint64_t v23 = *(void *)(a1 + 56);
      id v24 = *(void **)(v23 + 8);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_37;
      v29[3] = &unk_1E624E068;
      uint64_t v34 = *(void *)(a1 + 96);
      v29[4] = v23;
      id v30 = *(id *)(a1 + 64);
      id v31 = *(id *)(a1 + 72);
      id v32 = *(id *)(a1 + 80);
      id v33 = *(id *)(a1 + 88);
      [v24 withDatabaseID:AuxilliaryDatabaseID perform:v29];

      uint64_t v3 = v27;
      int v2 = v28;
    }
    else
    {
      unint64_t v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v41 = v2;
        _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Couldn't find aux database for persona [%{public}@] immediately after it should have been created", buf, 0xCu);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1007;
    }
    CFRelease(v11);
  }
  else
  {
    id v20 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v41 = v2;
      _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_ERROR, "Couldn't create database for persona [%{public}@]", buf, 0xCu);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1007;
  }
}

uint64_t __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) insert:*(void *)(a1 + 40) deletes:*(void *)(a1 + 48) updates:*(void *)(a1 + 56) insertedObjectIDMap:*(void *)(a1 + 64) inDatabase:a3];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = result;
  return result;
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_2_38(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v60 objects:v69 count:16];
  uint64_t v40 = v1;
  if (v3)
  {
    uint64_t v5 = v3;
    char v47 = 0;
    id v6 = *(id *)v61;
    *(void *)&long long v4 = 138543362;
    long long v36 = v4;
    id v41 = v2;
    id obj = *(id *)v61;
    do
    {
      uint64_t v7 = 0;
      uint64_t v43 = v5;
      do
      {
        if (*(id *)v61 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v60 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "intValue", v36) & 0x80000000) == 0)
        {
          uint64_t v9 = [*(id *)(v1 + 32) objectForKeyedSubscript:v8];
          uint64_t v10 = CalDatabaseCopyAuxDatabaseForPersonaID();
          if (v10)
          {
            uint64_t v11 = (const void *)v10;
            id v45 = [*(id *)(v1 + 32) objectForKeyedSubscript:v8];
            uint64_t v12 = objc_msgSend(*(id *)(v1 + 40), "objectForKeyedSubscript:");
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v66 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v57;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v57 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  AuxDatabaseAccount = (const void *)CalDatabaseCreateAuxDatabaseAccount();
                  CalAuxDatabaseAccountSetAccountID();
                  CalAuxDatabaseAddAccount();
                  CFRelease(AuxDatabaseAccount);
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v66 count:16];
              }
              while (v14);
              char v47 = 1;
              uint64_t v1 = v40;
              id v2 = v41;
              id v6 = obj;
              uint64_t v5 = v43;
            }
            CFRelease(v11);
          }
          else
          {
            uint64_t v18 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v36;
              uint64_t v68 = v9;
              _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_ERROR, "Couldn't find aux database for persona [%{public}@] shortly after confirming that it existed", buf, 0xCu);
            }
            *(_DWORD *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1007;
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v5);
  }
  else
  {
    char v47 = 0;
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obja = *(id *)(v1 + 48);
  uint64_t v44 = [obja countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v53;
    *(void *)&long long v19 = 67109120;
    long long v37 = v19;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obja);
        }
        unint64_t v21 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        objc_msgSend(v21, "intValue", v37);
        uint64_t v22 = CalDatabaseCopyAuxDatabaseWithUID();
        if (v22)
        {
          uint64_t v23 = (const void *)v22;
          uint64_t v46 = j;
          id v24 = (void *)CalAuxDatabaseCopyAccounts();
          uint64_t v25 = [*(id *)(v1 + 48) objectForKeyedSubscript:v21];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v26 = v24;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v64 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            int v29 = 0;
            uint64_t v30 = *(void *)v49;
            do
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v49 != v30) {
                  objc_enumerationMutation(v26);
                }
                id v32 = (void *)CalAuxDatabaseAccountCopyAccountID();
                if (([v25 containsObject:v32] & 1) == 0)
                {
                  ++v29;
                  CalAuxDatabaseRemoveAccount();
                  char v47 = 1;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v64 count:16];
            }
            while (v28);
          }
          else
          {
            int v29 = 0;
          }

          if ([v26 count] == v29)
          {
            CalRemoveAuxDatabase();
            char v47 = 1;
          }
          CFRelease(v23);

          uint64_t v1 = v40;
          uint64_t j = v46;
        }
        else
        {
          id v33 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = v33;
            int v35 = [v21 intValue];
            *(_DWORD *)long long buf = v37;
            LODWORD(v68) = v35;
            _os_log_impl(&dword_1BBC88000, v34, OS_LOG_TYPE_ERROR, "Couldn't find aux database for id [%i] shortly after modifying it", buf, 8u);
          }
        }
      }
      uint64_t v44 = [obja countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v44);
  }

  if (v47) {
    CalDatabaseSave();
  }
}

void __142__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply___block_invoke_39(void *a1, uint64_t a2, void *a3, void *a4, void *a5, char a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1[4] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
  id v21 = v10;

  uint64_t v15 = *(void *)(a1[5] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v11;
  id v17 = v11;

  uint64_t v18 = *(void *)(a1[6] + 8);
  long long v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v12;
  id v20 = v12;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a6;
}

- (int)findDatabaseForObject:(id)a3 withUpdates:(id)a4 personas:(id *)a5 accounts:(id *)a6 nextTempDBID:(int *)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if ([v12 isTemporary])
  {
    uint64_t v14 = [v13 objectForKeyedSubscript:v12];
    if ([v12 entityType] == 6)
    {
      uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F573B0]];
      uint64_t v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F573C8]];
      if ([v16 intValue] - 1 > 1)
      {
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F57158]];
      }
      if (v17 | v15)
      {
        id v26 = v16;
        uint64_t v41 = 0;
        uint64_t v42 = &v41;
        uint64_t v43 = 0x2020000000;
        unsigned int v44 = 0x80000000;
        *(void *)long long buf = 0;
        uint64_t v46 = buf;
        uint64_t v47 = 0x3032000000;
        long long v48 = __Block_byref_object_copy__1;
        long long v49 = __Block_byref_object_dispose__1;
        id v50 = *a5;
        uint64_t v35 = 0;
        long long v36 = &v35;
        uint64_t v37 = 0x3032000000;
        long long v38 = __Block_byref_object_copy__1;
        id v39 = __Block_byref_object_dispose__1;
        id v22 = *a6;
        conn = self->_conn;
        id v40 = v22;
        uint64_t v23 = *MEMORY[0x1E4F574B8];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __116__CADXPCImplementation_CADDatabaseOperationGroup__findDatabaseForObject_withUpdates_personas_accounts_nextTempDBID___block_invoke;
        v28[3] = &unk_1E624E108;
        id v29 = (id)v17;
        id v31 = &v41;
        id v30 = (id)v15;
        id v32 = buf;
        id v33 = &v35;
        uint64_t v34 = a7;
        [(ClientConnection *)conn withDatabaseID:v23 perform:v28];
        uint64_t v16 = v26;
        *a6 = (id) v36[5];
        *a5 = *((id *)v46 + 5);
        int v18 = *((_DWORD *)v42 + 6);

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v41, 8);
      }
      else
      {
        int v18 = *MEMORY[0x1E4F574B8];
      }
    }
    else
    {
      long long v19 = [(CADXPCImplementation *)self owningObjectForObject:v12 withProperties:v14];
      uint64_t v15 = (uint64_t)v19;
      if (v19)
      {
        if (![v19 isVirtual])
        {
          if ([(id)v15 isTemporary]) {
            int v24 = [(CADXPCImplementation *)self findDatabaseForObject:v15 withUpdates:v13 personas:a5 accounts:a6 nextTempDBID:a7];
          }
          else {
            int v24 = [(id)v15 databaseID];
          }
          int v18 = v24;
          goto LABEL_20;
        }
        id v20 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          id v21 = v20;
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = [v12 entityType];
          _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Unexpected fake entity type %d in -findDatabaseForObject:withUpdates:", buf, 8u);
        }
      }
      int v18 = 0x80000000;
    }
LABEL_20:

    goto LABEL_21;
  }
  int v18 = [v12 databaseID];
LABEL_21:

  return v18;
}

void __116__CADXPCImplementation_CADDatabaseOperationGroup__findDatabaseForObject_withUpdates_personas_accounts_nextTempDBID___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = CalDatabaseGetCalendarDataContainerProvider();
  uint64_t v3 = v2;
  if (*(void *)(a1 + 32))
  {
    long long v4 = objc_msgSend(v2, "containerInfoForAccountIdentifier:");
    if (![v4 usesDataSeparatedContainer])
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *MEMORY[0x1E4F574B8];

      id v5 = 0;
      goto LABEL_31;
    }
    id v5 = [v4 personaID];
  }
  else
  {
    id v5 = *(id *)(a1 + 40);
  }
  uint64_t v6 = CalDatabaseCopyAuxDatabaseForPersonaID();
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CalAuxDatabaseGetUID();
    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = (const void *)CalDatabaseCopyAuxDatabaseAccountForAccountID();
      if (v8)
      {
        CFRelease(v8);
        CFRelease(v7);
        goto LABEL_31;
      }
    }
    CFRelease(v7);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v14, (void)v28);
          if ([v5 isEqualToString:v15])
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v14 intValue];

            goto LABEL_21;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(_DWORD *)(v16 + 24) == 0x80000000)
    {
      uint64_t v17 = *(_DWORD **)(a1 + 72);
      *(_DWORD *)(v16 + 24) = (*v17)--;
    }
  }
  int v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v18)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    int v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  id v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (void)v28);
  [v18 setObject:v5 forKeyedSubscript:v22];

  if (*(void *)(a1 + 32))
  {
    uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v23)
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
      id v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    id v27 = [v23 objectForKeyedSubscript:v5];
    if (!v27)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v27 forKeyedSubscript:v5];
    }
    [v27 addObject:*(void *)(a1 + 32)];
  }
LABEL_31:
}

- (int)insert:(id)a3 deletes:(id)a4 updates:(id)a5 insertedObjectIDMap:(id)a6 inDatabase:(CalDatabase *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = [(CADXPCImplementation *)self preflightAccessForDeletes:v13 updates:v14 inDatabase:a7];
  int v33 = v16;
  if (!v16)
  {
    os_unfair_lock_lock(&a7->var9);
    uint64_t v17 = [(CADXPCImplementation *)self _insert:v12 delete:v13 update:v14 database:a7 error:&v33];
    if (v33)
    {
      if (*MEMORY[0x1E4F56A58]) {
        os_unfair_lock_assert_owner(&a7->var9);
      }
      os_unfair_lock_unlock(&a7->var9);
    }
    else
    {
      if ((CalDatabaseSaveWithOptions() & 1) == 0)
      {
        int v33 = 1007;
LABEL_19:
        CalDatabaseReset();
LABEL_20:

        int v16 = v33;
        goto LABEL_21;
      }
      if (v17)
      {
        id v27 = v14;
        id v28 = v12;
        uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v30 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              [v19 objectForKeyedSubscript:v24];

              uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F57428]), "initWithEntityType:entityID:databaseID:", objc_msgSend(v24, "entityType"), CalEntityGetID(), AuxilliaryDatabaseID);
              [v15 setObject:v25 forKeyedSubscript:v24];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v21);
        }

        id v12 = v28;
        id v14 = v27;
      }
    }
    if (!v33) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_21:

  return v16;
}

- (int)preflightAccessForDeletes:(id)a3 updates:(id)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = [(CADXPCImplementation *)self preflightObjectID:*(void *)(*((void *)&v48 + 1) + 8 * i) inDatabase:a5];
        if (v15)
        {
          int v33 = v15;
          id v16 = v10;
          goto LABEL_33;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v45;
    uint64_t v20 = *MEMORY[0x1E4F57310];
    long long v38 = v16;
    id v39 = v9;
    uint64_t v35 = *(void *)v45;
    while (2)
    {
      uint64_t v21 = 0;
      uint64_t v36 = v18;
      do
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v37 = v21;
        uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8 * v21);
        int v23 = [(CADXPCImplementation *)self preflightObjectID:v22 inDatabase:a5];
        if (v23)
        {
          int v33 = v23;
          goto LABEL_33;
        }
        id v24 = [v16 objectForKeyedSubscript:v22];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v41;
          while (2)
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(v25);
              }
              long long v30 = *(void **)(*((void *)&v40 + 1) + 8 * j);
              long long v31 = [v25 objectForKeyedSubscript:v30];
              if ([v30 isEqualToString:v20]
                && ![(CADXPCImplementation *)self _verifyClientAllowedToWriteValue:v31 forKey:v30])
              {
                int v33 = 1013;
LABEL_32:

                id v16 = v38;
                id v9 = v39;
                goto LABEL_33;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v32 = [(CADXPCImplementation *)self preflightObjectID:v31 inDatabase:a5];
                if (v32)
                {
                  int v33 = v32;
                  goto LABEL_32;
                }
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        uint64_t v21 = v37 + 1;
        id v16 = v38;
        id v9 = v39;
        uint64_t v19 = v35;
      }
      while (v37 + 1 != v36);
      uint64_t v18 = [v38 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  int v33 = 0;
LABEL_33:

  return v33;
}

- (BOOL)_verifyClientAllowedToWriteValue:(id)a3 forKey:(id)a4
{
  return -[CADXPCImplementation hasAccess:](self, "hasAccess:", 1052, a4);
}

- (int)preflightObjectID:(id)a3 inDatabase:(CalDatabase *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isTemporary])
  {
    int v7 = 0;
  }
  else
  {
    id v8 = CADCopyEntityInDatabase((uint64_t)a4, v6);
    if (v8)
    {
      id v9 = v8;
      if (CADEntityIsInRestrictedStore(self->_conn, v8, 1))
      {
        id v10 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138543362;
          id v14 = v6;
          _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, "Failed preflight check: access denied to entity %{public}@", (uint8_t *)&v13, 0xCu);
        }
        int v7 = 1013;
      }
      else
      {
        int v7 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      uint64_t v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543362;
        id v14 = v6;
        _os_log_impl(&dword_1BBC88000, v11, OS_LOG_TYPE_ERROR, "Failed preflight check: can not find entity %{public}@", (uint8_t *)&v13, 0xCu);
      }
      int v7 = 1010;
    }
  }

  return v7;
}

- (id)_insert:(id)a3 delete:(id)a4 update:(id)a5 database:(CalDatabase *)a6 error:(int *)a7
{
  id v12 = a4;
  id v13 = a5;
  *a7 = 0;
  id v14 = [(CADXPCImplementation *)self _insertObjectsWithTemporaryObjectIDs:a3 updates:v13 database:a6 error:a7];
  if (*a7
    || (int v15 = [(CADXPCImplementation *)self _deleteObjects:v12 database:a6],
        (*a7 = v15) != 0)
    || (int v16 = [(CADXPCImplementation *)self _updatePropertiesAndRelations:v13 database:a6 insertedObjectMap:v14], (*a7 = v16) != 0))
  {
    id v17 = 0;
  }
  else
  {
    id v17 = v14;
  }

  return v17;
}

- (id)_insertObjectsWithTemporaryObjectIDs:(id)a3 updates:(id)a4 database:(CalDatabase *)a5 error:(int *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  uint64_t v9 = [v8 count];
  if (v9)
  {
    long long v30 = a6;
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v9];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v31 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      int v36 = 0;
      uint64_t v14 = *(void *)v38;
      uint64_t v33 = *MEMORY[0x1E4F57058];
      uint64_t v32 = *MEMORY[0x1E4F57068];
      id v34 = v11;
LABEL_4:
      uint64_t v15 = 0;
      while (2)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
        int v17 = objc_msgSend(v16, "entityType", v30);
        switch(v17)
        {
          case 1:
            CalendarForEntityint Type = _CalDatabaseCreateCalendarForEntityType();
            goto LABEL_38;
          case 2:
            CalendarForEntityint Type = _CalCalendarItemCreate();
            goto LABEL_38;
          case 3:
          case 13:
          case 22:
          case 25:
          case 26:
          case 27:
            goto LABEL_11;
          case 4:
            CalendarForEntityint Type = _CalDatabaseCreateAlarm();
            goto LABEL_38;
          case 5:
            CalendarForEntityint Type = _CalDatabaseCreateRecurrence();
            goto LABEL_38;
          case 6:
            CalendarForEntityint Type = _CalDatabaseCreateStore();
            goto LABEL_38;
          case 7:
            CalendarForEntityint Type = _CalDatabaseCreateAttendee();
            goto LABEL_38;
          case 8:
            CalendarForEntityint Type = _CalDatabaseCreateOrganizer();
            goto LABEL_38;
          case 9:
            CalendarForEntityint Type = _CalDatabaseCreateEventAction();
            goto LABEL_38;
          case 10:
            CalendarForEntityint Type = _CalDatabaseCreateExceptionDate();
            goto LABEL_38;
          case 11:
            CalendarForEntityint Type = _CalDatabaseCreateAttachment();
            goto LABEL_38;
          case 12:
            CalendarForEntityint Type = _CalDatabaseCreateCategory();
            goto LABEL_38;
          case 14:
            CalendarForEntityint Type = _CalDatabaseCreateLocation();
            goto LABEL_38;
          case 15:
            CalendarForEntityint Type = _CalDatabaseCreateSharee();
            goto LABEL_38;
          case 16:
            CalendarForEntityint Type = _CalDatabaseCreateInviteReplyNotification();
            goto LABEL_38;
          case 17:
            CalendarForEntityint Type = _CalDatabaseCreateResourceChangeNotification();
            goto LABEL_38;
          case 18:
            CalendarForEntityint Type = _CalCreateResourceChangeOfType();
            goto LABEL_38;
          case 19:
            CalendarForEntityint Type = _CalDatabaseCreateSuggestionNotification();
            goto LABEL_38;
          case 20:
            CalendarForEntityint Type = _CalDatabaseCreateSuggestedEventInfo();
            goto LABEL_38;
          case 21:
            CalendarForEntityint Type = _CalDatabaseCreateContact();
            goto LABEL_38;
          case 23:
            CalendarForEntityint Type = _CalDatabaseCreateConference();
            goto LABEL_38;
          case 24:
            CalendarForEntityint Type = _CalDatabaseCreateError();
            goto LABEL_38;
          case 28:
            uint64_t v22 = [v35 objectForKeyedSubscript:v16];
            int v23 = [v22 objectForKeyedSubscript:v33];
            id v24 = [v22 objectForKeyedSubscript:v32];
            if (([v24 isTemporary] & 1) != 0
              || ([v24 entityID],
                  (ImageWithIdentifierInStoreID = (const void *)_CalDatabaseGetImageWithIdentifierInStoreID()) == 0))
            {
              uint64_t Image = _CalDatabaseCreateImage();
            }
            else
            {
              uint64_t Image = (uint64_t)CFRetain(ImageWithIdentifierInStoreID);
            }
            uint64_t v27 = (const void *)Image;

            id v11 = v34;
            if (!v27) {
              goto LABEL_40;
            }
            goto LABEL_39;
          case 29:
            CalendarForEntityint Type = _CalDatabaseCreateColor();
            goto LABEL_38;
          default:
            if (v17 == 102)
            {
              CalendarForEntityint Type = _CalDatabaseCreateNotification();
LABEL_38:
              uint64_t v27 = (const void *)CalendarForEntityType;
              if (CalendarForEntityType)
              {
LABEL_39:
                [v10 setObject:v27 forKeyedSubscript:v16];
                CFRelease(v27);
              }
            }
            else
            {
LABEL_11:
              uint64_t v19 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
              {
                uint64_t v20 = v19;
                int v21 = [v16 entityType];
                *(_DWORD *)long long buf = 67109120;
                int v42 = v21;
                _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_ERROR, "Attempt to insert an invalid entity type (%d)", buf, 8u);
              }
              int v36 = 1001;
            }
LABEL_40:
            if (v13 != ++v15) {
              continue;
            }
            uint64_t v28 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
            uint64_t v13 = v28;
            if (!v28) {
              goto LABEL_49;
            }
            goto LABEL_4;
        }
      }
    }
    int v36 = 0;
LABEL_49:

    if (v30) {
      *long long v30 = v36;
    }
    id v8 = v31;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (int)_deleteObjects:(id)a3 database:(CalDatabase *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = _CADGetEntity((uint64_t)a4, *(void **)(*((void *)&v12 + 1) + 8 * v9));
        if (v10) {
          _CADDeleteEntity(v10);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return 0;
}

- (int)_updatePropertiesAndRelations:(id)a3 database:(CalDatabase *)a4 insertedObjectMap:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v34 = a5;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    uint64_t v33 = v8;
    long long v29 = (void *)*MEMORY[0x1E4F56C50];
    uint64_t v30 = *(void *)v40;
LABEL_3:
    uint64_t v12 = 0;
    uint64_t v31 = v10;
LABEL_4:
    if (*(void *)v40 != v11) {
      objc_enumerationMutation(v8);
    }
    long long v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
    uint64_t v14 = _CADGetExistingOrInsertedEntity((uint64_t)a4, v13, v34);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v32 = v12;
      int v16 = [v8 objectForKeyedSubscript:v13];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (!v18) {
        goto LABEL_20;
      }
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
LABEL_9:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v35 + 1) + 8 * v21);
        int v23 = objc_msgSend(v17, "objectForKeyedSubscript:", v22, v29);
        id v24 = [MEMORY[0x1E4F1CA98] null];

        if (v23 == v24) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = _CADGetExistingOrInsertedEntity((uint64_t)a4, v23, v34);
LABEL_16:

          int v23 = (void *)v25;
        }
        int v26 = _CalEntitySetProperty((uint64_t)a4, v15, v22, v23);

        if (v26)
        {

          id v8 = v33;
          goto LABEL_27;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v19) {
            goto LABEL_9;
          }
LABEL_20:

          uint64_t v27 = [v17 objectForKeyedSubscript:v29];
          if (v27) {
            _CalEntitySetProperty((uint64_t)a4, v15, v29, v27);
          }

          uint64_t v12 = v32 + 1;
          id v8 = v33;
          uint64_t v11 = v30;
          if (v32 + 1 == v31)
          {
            uint64_t v10 = [v33 countByEnumeratingWithState:&v39 objects:v44 count:16];
            int v26 = 0;
            if (!v10) {
              goto LABEL_27;
            }
            goto LABEL_3;
          }
          goto LABEL_4;
        }
      }
      uint64_t v25 = 0;
      goto LABEL_16;
    }
    int v26 = 1010;
  }
  else
  {
    int v26 = 0;
  }
LABEL_27:

  return v26;
}

- (id)removeDuplicateEvents:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  id v8 = 0;
  uint64_t v9 = *(void *)v26;
  uint64_t v10 = (os_log_t *)&CADLogHandle;
  *(void *)&long long v6 = 138543618;
  long long v23 = v6;
  id v24 = self;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if (objc_msgSend(v12, "entityType", v23) == 2
        && ([v12 entityID] & 0x80000000) != 0
        && [(CADXPCImplementation *)self isDuplicateEvent:v12 updates:v4])
      {
        long long v13 = [(CADXPCImplementation *)self conn];
        uint64_t v14 = [v13 identity];

        os_log_t v15 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
        {
          int v16 = v15;
          [v14 clientName];
          id v17 = v8;
          v19 = uint64_t v18 = v10;
          int v20 = [v14 pid];
          *(_DWORD *)long long buf = v23;
          uint64_t v30 = v19;
          __int16 v31 = 1024;
          int v32 = v20;
          _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "A new event being saved by a legacy write-only client (%{public}@ [%i]) is very similar to an existing event. Refusing to commit it.", buf, 0x12u);

          uint64_t v10 = v18;
          id v8 = v17;
          self = v24;
        }
        if (!v8) {
          id v8 = (id)[v4 mutableCopy];
        }
        uint64_t v21 = [(CADXPCImplementation *)self updatedOrInsertedObjectIDs:v8 relatedToEvent:v12];
        [v8 removeObjectsForKeys:v21];
      }
    }
    uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  }
  while (v7);
  if (!v8) {
LABEL_17:
  }
    id v8 = v4;

  return v8;
}

- (BOOL)isDuplicateEvent:(id)a3 updates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:v6];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F56D00]];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F56FB0]];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  conn = self->_conn;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__CADXPCImplementation_CADDatabaseOperationGroup__isDuplicateEvent_updates___block_invoke;
  v17[3] = &unk_1E624E130;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  int v20 = self;
  id v14 = v6;
  id v21 = v14;
  id v15 = v7;
  id v22 = v15;
  long long v23 = &v24;
  [(ClientConnection *)conn withAllDatabasesPerform:v17];
  LOBYTE(v6) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)v6;
}

void __76__CADXPCImplementation_CADDatabaseOperationGroup__isDuplicateEvent_updates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)CalDatabaseCopyOriginalVisibleEventsWithDates();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(a1 + 48), "shouldBlockSaveOfEvent:updates:becauseOfExistingEvent:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)shouldBlockSaveOfEvent:(id)a3 updates:(id)a4 becauseOfExistingEvent:(void *)a5
{
  v64[6] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = *MEMORY[0x1E4F56C58];
  v64[0] = *MEMORY[0x1E4F56D40];
  v64[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F56B88];
  v64[2] = *MEMORY[0x1E4F56C38];
  v64[3] = v12;
  uint64_t v13 = *MEMORY[0x1E4F56BF0];
  v64[4] = *MEMORY[0x1E4F56D08];
  v64[5] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:6];
  long long v53 = v10;
  id v15 = [v10 objectForKeyedSubscript:v9];
  if ([(CADXPCImplementation *)self object:a5 matchesProperties:v15 forKeys:v14])
  {
    long long v48 = v15;
    long long v49 = v14;
    uint64_t v16 = CalEventCopyCreatorIdentityString();
    uint64_t v17 = CalEventCopyCreatorTeamIdentityString();
    long long v50 = (void *)v17;
    if (!(v16 | v17)) {
      goto LABEL_19;
    }
    uint64_t v18 = v17;
    if (v16
      || ([(ClientConnection *)self->_conn effectiveApplicationIdentifier],
          (long long v51 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v5 = [(ClientConnection *)self->_conn effectiveApplicationIdentifier];
      int v19 = 1;
      char v20 = 1;
      if (![(id)v16 isEqual:v5]) {
        goto LABEL_14;
      }
      if (v18) {
        goto LABEL_12;
      }
    }
    else
    {
      int v19 = 0;
      long long v51 = 0;
      if (v18) {
        goto LABEL_12;
      }
    }
    id v10 = [(ClientConnection *)self->_conn effectiveTeamIdentifier];
    if (!v10)
    {
      char v20 = 0;
      if ((v19 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_12:
    id v22 = [(ClientConnection *)self->_conn effectiveTeamIdentifier];
    char v20 = [v50 isEqual:v22] ^ 1;

    if (v50)
    {
      if (!v19) {
        goto LABEL_15;
      }
    }
    else
    {

      if ((v19 & 1) == 0)
      {
LABEL_15:
        if (v16)
        {
          if (v20)
          {
LABEL_17:
            BOOL v21 = 0;
LABEL_49:

            id v15 = v48;
            long long v14 = v49;
            goto LABEL_50;
          }
        }
        else
        {

          if (v20) {
            goto LABEL_17;
          }
        }
LABEL_19:
        uint64_t v45 = a5;
        uint64_t v46 = v16;
        long long v23 = (void *)CalCalendarItemCopyRecurrences();
        uint64_t v24 = (void *)[v23 mutableCopy];

        id v47 = v9;
        [(CADXPCImplementation *)self updatedOrInsertedObjectIDs:v53 relatedToEvent:v9];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v25 countByEnumeratingWithState:&v58 objects:v63 count:16];
        long long v52 = v25;
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v59;
          while (2)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v59 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              if (objc_msgSend(v30, "entityType", v45) == 5)
              {
                for (unint64_t j = 0; j < [v24 count]; ++j)
                {
                  int v32 = [v24 objectAtIndexedSubscript:j];
                  uint64_t v33 = [v53 objectForKeyedSubscript:v30];
                  BOOL v34 = [(CADXPCImplementation *)self recurrenceRule:v32 matchesProperties:v33];

                  if (v34) {
                    break;
                  }
                }
                if (j >= [v24 count])
                {
                  id v25 = v52;

                  goto LABEL_47;
                }
                [v24 removeObjectAtIndex:j];
                id v25 = v52;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v58 objects:v63 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        if ([v24 count])
        {
LABEL_47:
          BOOL v21 = 0;
          uint64_t v16 = v46;
          id v9 = v47;
        }
        else
        {
          long long v35 = (const void *)CalCalendarItemCopyLocation();
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v36 = v25;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v55;
            while (2)
            {
              for (uint64_t k = 0; k != v38; ++k)
              {
                if (*(void *)v55 != v39) {
                  objc_enumerationMutation(v36);
                }
                long long v41 = *(void **)(*((void *)&v54 + 1) + 8 * k);
                if (objc_msgSend(v41, "entityType", v45) == 14)
                {
                  if (!v35
                    || ([v53 objectForKeyedSubscript:v41],
                        long long v42 = objc_claimAutoreleasedReturnValue(),
                        BOOL v43 = [(CADXPCImplementation *)self location:v35 matchesProperties:v42], v42, CFRelease(v35), !v43))
                  {

                    goto LABEL_54;
                  }
                  long long v35 = 0;
                }
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v62 count:16];
              if (v38) {
                continue;
              }
              break;
            }
          }

          if (v35)
          {
            CFRelease(v35);
LABEL_54:
            BOOL v21 = 0;
          }
          else
          {
            BOOL v21 = 1;
          }
          uint64_t v16 = v46;
          id v9 = v47;
          id v25 = v52;
        }

        goto LABEL_49;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  BOOL v21 = 0;
LABEL_50:

  return v21;
}

- (BOOL)recurrenceRule:(void *)a3 matchesProperties:(id)a4
{
  v13[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F57218];
  v13[0] = *MEMORY[0x1E4F57210];
  v13[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F571F8];
  v13[2] = *MEMORY[0x1E4F57200];
  v13[3] = v7;
  uint64_t v8 = *MEMORY[0x1E4F57208];
  void v13[4] = *MEMORY[0x1E4F57228];
  v13[5] = v8;
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  uint64_t v11 = [v9 arrayWithObjects:v13 count:6];
  LOBYTE(a3) = [(CADXPCImplementation *)self object:a3 matchesProperties:v10 forKeys:v11];

  return (char)a3;
}

- (BOOL)location:(void *)a3 matchesProperties:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F57078];
  v11[0] = *MEMORY[0x1E4F570D0];
  v11[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = [v7 arrayWithObjects:v11 count:2];
  LOBYTE(a3) = [(CADXPCImplementation *)self object:a3 matchesProperties:v8 forKeys:v9];

  return (char)a3;
}

- (BOOL)object:(void *)a3 matchesProperties:(id)a4 forKeys:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = a5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v22 = 0;
        int v15 = CalEntityCopyPropertyAllowingLimitedAccess(self->_conn, (uint64_t)a3, v14, &v22, 1);
        id v16 = v22;
        if (v15)
        {

LABEL_14:
          BOOL v20 = 0;
          goto LABEL_15;
        }
        uint64_t v17 = [v8 objectForKeyedSubscript:v14];
        uint64_t v18 = convertDefaultValueToNil(v16);

        uint64_t v19 = convertDefaultValueToNil(v17);

        if (v18 | v19 && ([(id)v18 isEqual:v19] & 1) == 0)
        {

          goto LABEL_14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_15:

  return v20;
}

- (id)updatedOrInsertedObjectIDs:(id)a3 relatedToEvent:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
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
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        int v15 = -[CADXPCImplementation owningEventForObject:withUpdates:](self, "owningEventForObject:withUpdates:", v14, v9, (void)v17);
        if ([v15 isEqual:v7]) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)owningEventForObject:(id)a3 withUpdates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 entityType] != 2)
  {
    id v9 = [v7 objectForKeyedSubscript:v6];
    uint64_t v10 = [(CADXPCImplementation *)self owningObjectForObject:v6 withProperties:v9];

    id v8 = [(CADXPCImplementation *)self owningEventForObject:v10 withUpdates:v7];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (id)owningObjectForObject:(id)a3 withProperties:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 entityType];
  id v8 = 0;
  id v9 = (void *)MEMORY[0x1E4F56EA8];
  switch(v7)
  {
    case -1:
    case 3:
    case 12:
    case 13:
    case 19:
    case 21:
    case 25:
    case 26:
    case 27:
      goto LABEL_2;
    case 0:
    case 6:
    case 22:
      goto LABEL_22;
    case 1:
      goto LABEL_21;
    case 2:
      id v9 = (void *)MEMORY[0x1E4F56BB0];
      goto LABEL_21;
    case 4:
      id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F56A88]];
      if (v8) {
        goto LABEL_22;
      }
      id v9 = (void *)MEMORY[0x1E4F56A90];
      goto LABEL_21;
    case 5:
      id v9 = (void *)MEMORY[0x1E4F57220];
      goto LABEL_21;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 15:
    case 20:
    case 23:
      id v9 = (void *)MEMORY[0x1E4F57160];
      goto LABEL_21;
    case 14:
      id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F57088]];
      if (v8) {
        goto LABEL_22;
      }
      id v9 = (void *)MEMORY[0x1E4F57080];
      goto LABEL_21;
    case 16:
    case 17:
      goto LABEL_8;
    case 18:
      id v9 = (void *)MEMORY[0x1E4F57288];
      goto LABEL_21;
    case 24:
      id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F56F20]];
      if (v8) {
        goto LABEL_22;
      }
      id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F56F08]];
      if (v8) {
        goto LABEL_22;
      }
      id v9 = (void *)MEMORY[0x1E4F56F00];
      goto LABEL_21;
    case 28:
      id v9 = (void *)MEMORY[0x1E4F57068];
      goto LABEL_21;
    case 29:
      id v9 = (void *)MEMORY[0x1E4F56EF8];
      goto LABEL_21;
    default:
      if ((v7 - 100) < 2)
      {
LABEL_2:
        uint64_t v10 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = v10;
          v13[0] = 67109120;
          v13[1] = [v5 entityType];
          _os_log_impl(&dword_1BBC88000, v11, OS_LOG_TYPE_ERROR, "Unexpected/unsupported entity type %d in -findDatabaseForObject:withUpdates:", (uint8_t *)v13, 8u);
        }
        id v8 = 0;
      }
      else if (v7 == 102)
      {
LABEL_8:
        id v9 = (void *)MEMORY[0x1E4F570E0];
LABEL_21:
        id v8 = [v6 objectForKeyedSubscript:*v9];
      }
LABEL_22:

      return v8;
  }
}

- (void)CADDatabaseMigrateSubscribedCalendar:(id)a3 toSource:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__1;
  long long v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke;
  v15[3] = &unk_1E624DB88;
  id v12 = v8;
  id v16 = v12;
  long long v19 = &v27;
  id v13 = v9;
  long long v20 = &v21;
  id v17 = v13;
  long long v18 = self;
  if ([(ClientConnection *)conn withDatabaseForObject:v12 perform:v15])
  {
    uint64_t v14 = *((unsigned int *)v28 + 6);
  }
  else
  {
    uint64_t v14 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
  }
  v10[2](v10, v14, v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) entityID];
  uint64_t v6 = CalDatabaseCopyCalendarWithUID();
  if (v6)
  {
    int v7 = (const void *)v6;
    id v8 = (void *)CalCalendarCopyTitle();
    if (CalCalendarIsSubscribed())
    {
      if ([*(id *)(a1 + 40) databaseID] == a2)
      {
        [*(id *)(a1 + 40) entityID];
        uint64_t v9 = CalDatabaseCopyStoreWithUID();
        if (!v9)
        {
          CFRelease(v7);
          uint64_t v23 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
          {
            long long v24 = *(void **)(a1 + 40);
            long long v25 = v23;
            *(_DWORD *)long long buf = 67109120;
            int v32 = [v24 entityID];
            _os_log_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Unable to find store with row ID %i", buf, 8u);
          }
          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
          goto LABEL_22;
        }
        uint64_t v10 = (const void *)v9;
        uint64_t v11 = CalCalendarMigrateSubscribedCalendarToStore();
        if ((int)v11 < 1)
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1007;
        }
        else
        {
          uint64_t v12 = [objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:1 entityID:v11 databaseID:a2];
          uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
        CFRelease(v10);
      }
      else
      {
        uint64_t v21 = *(void **)(a1 + 40);
        uint64_t v22 = *(void **)(*(void *)(a1 + 48) + 8);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke_42;
        v26[3] = &unk_1E624E158;
        id v27 = v21;
        uint64_t v29 = a3;
        int v30 = v7;
        long long v28 = *(_OWORD *)(a1 + 56);
        if (([v22 withDatabaseForObject:v27 perform:v26] & 1) == 0) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
        }
      }
    }
    else
    {
      long long v18 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
      {
        long long v19 = *(void **)(a1 + 32);
        long long v20 = v18;
        *(_DWORD *)long long buf = 67109378;
        int v32 = [v19 entityID];
        __int16 v33 = 2112;
        BOOL v34 = v8;
        _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Calendar to move (%i, \"%@\") is not a subscribed calendar", buf, 0x12u);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1001;
    }
    CFRelease(v7);
LABEL_22:

    return;
  }
  int v15 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
  {
    id v16 = *(void **)(a1 + 32);
    id v17 = v15;
    *(_DWORD *)long long buf = 67109120;
    int v32 = [v16 entityID];
    _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Unable to find calendar with row ID %i", buf, 8u);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
}

void __103__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseMigrateSubscribedCalendar_toSource_reply___block_invoke_42(uint64_t a1, unsigned int a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) entityID];
  uint64_t v4 = CalDatabaseCopyStoreWithUID();
  if (v4)
  {
    id v5 = (const void *)v4;
    unsigned int v19 = a2;
    CalDatabaseMultiLock();
    uint64_t v6 = (const void *)_CalDatabaseCopyCalendar();
    _CalStoreAddCalendar();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)_CalDatabaseCopyCalendarItemsWithCalendar();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          if ((_CalEventIsDetached() & 1) == 0)
          {
            Copy = (const void *)_CalCalendarItemCreateCopy();
            CFRelease(Copy);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    _CalRemoveCalendar();
    CalDatabaseSaveWithOptions();
    CalDatabaseSaveWithOptions();
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:1 entityID:CalCalendarGetUID() databaseID:v19];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    int v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    CFRelease(v5);
    CFRelease(v6);
  }
  else
  {
    id v16 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO))
    {
      id v17 = *(void **)(a1 + 32);
      long long v18 = v16;
      *(_DWORD *)long long buf = 67109120;
      int v26 = [v17 entityID];
      _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_DEBUG|OS_LOG_TYPE_INFO, "Unable to find store with row ID %i", buf, 8u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetDefaultAlarmOffsetForAllDay:(BOOL)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void, uint64_t))a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  conn = self->_conn;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  uint64_t v8 = *MEMORY[0x1E4F574B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetDefaultAlarmOffsetForAllDay_reply___block_invoke;
  v10[3] = &unk_1E624E180;
  BOOL v11 = a3;
  v10[4] = &v12;
  [(ClientConnection *)conn withDatabaseID:v8 perform:v10];
  uint64_t v9 = v13[5];
  if (!v9)
  {
    v13[5] = (uint64_t)&unk_1F151D860;

    uint64_t v9 = v13[5];
  }
  v6[2](v6, 0, v9);
  _Block_object_dispose(&v12, 8);
}

void __99__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseGetDefaultAlarmOffsetForAllDay_reply___block_invoke(uint64_t a1)
{
  CalDatabaseGetPreferences();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v2 = CalAlarmCopyDefaultAllDayAlarmOffsetWithPreferences();
  }
  else {
    uint64_t v2 = CalAlarmCopyDefaultTimedAlarmOffsetWithPreferences();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)CADAnalyticsSendEvent:(id)a3 appendingClientBundleIDToPayload:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v11 = [v6 dictionaryWithDictionary:a4];
  uint64_t v8 = [(ClientConnection *)self->_conn databaseInitializationOptions];
  uint64_t v9 = [v8 remoteClientIdentity];
  uint64_t v10 = [v9 untrustedBundleIdentifier];

  [v11 setObject:v10 forKeyedSubscript:@"clientBundleID"];
  CalAnalyticsSendEvent();
}

- (void)CADDatabaseStatsBySource:(id)a3
{
  uint64_t v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  conn = self->_conn;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseStatsBySource___block_invoke;
  v6[3] = &unk_1E624DF08;
  v6[4] = &v7;
  [(ClientConnection *)conn withAllDatabasesPerform:v6];
  v4[2](v4, 0, v8[5]);
  _Block_object_dispose(&v7, 8);
}

void __76__CADXPCImplementation_CADDatabaseOperationGroup__CADDatabaseStatsBySource___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CalDatabaseCopySourceStats();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  id v9 = v2;
  if (v4)
  {
    uint64_t v5 = [v4 arrayByAddingObjectsFromArray:v2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = v2;
    uint64_t v7 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v8;
  }
}

- (void)CADPersonaIdentifierForDatabaseID:(int)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void, uint64_t))a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__1;
  unsigned int v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 1010;
  conn = self->_conn;
  uint64_t v8 = *MEMORY[0x1E4F574B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__CADXPCImplementation_CADDatabaseOperationGroup__CADPersonaIdentifierForDatabaseID_reply___block_invoke;
  v9[3] = &unk_1E624E1A8;
  int v10 = a3;
  void v9[4] = &v15;
  v9[5] = &v11;
  [(ClientConnection *)conn withDatabaseID:v8 perform:v9];
  v6[2](v6, *((unsigned int *)v12 + 6), v16[5]);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

void __91__CADXPCImplementation_CADDatabaseOperationGroup__CADPersonaIdentifierForDatabaseID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCopyAuxDatabaseWithUID();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    uint64_t v4 = CalAuxDatabaseCopyPersonaID();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    CFRelease(v3);
  }
}

- (void)CADCatchUpIntegrationSyncingIfBehind:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28EB8];
  uint64_t v5 = (void (**)(id, void))a3;
  uint64_t v4 = [v3 defaultCenter];
  [v4 postNotificationName:@"CADCatchUpIntegrationSyncRequested" object:0];

  v5[2](v5, 0);
}

- (void)CADDatabaseGetStorageUsage:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  conn = self->_conn;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__CADDatabaseGetStorageUsage___block_invoke;
  v9[3] = &unk_1E624E270;
  void v9[4] = self;
  v9[5] = &v14;
  void v9[6] = &v10;
  [(ClientConnection *)conn withAllDatabasesPerform:v9];
  v18[0] = @"events";
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v15[3]];
  v18[1] = @"attachments";
  v19[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v11[3]];
  v19[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  v4[2](v4, 0, v8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

uint64_t __95__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__CADDatabaseGetStorageUsage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "sizeCalendarDirectoryForDatabase:");
  uint64_t result = [*(id *)(a1 + 32) sizeAttachmentsForDatabase:a3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += result;
  return result;
}

- (unint64_t)sizeCalendarDirectoryForDatabase:(CalDatabase *)a3
{
  uint64_t v4 = (void *)CalDatabaseCopyDirectoryPathForDatabase();
  unint64_t v5 = [(CADXPCImplementation *)self sizeDirectoryAtPath:v4 excludingDirectory:*MEMORY[0x1E4F57858]];

  return v5;
}

- (unint64_t)sizeAttachmentsForDatabase:(CalDatabase *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CFArrayRef v5 = (const __CFArray *)CalDatabaseCopyOfAllStores();
  CFArrayRef v6 = v5;
  if (v5)
  {
    CFIndex Count = CFArrayGetCount(v5);
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:Count];
    if (Count >= 1)
    {
      CFIndex v10 = 0;
      *(void *)&long long v9 = 67109378;
      long long v26 = v9;
      do
      {
        CFArrayGetValueAtIndex(v6, v10);
        uint64_t v11 = CalAttachmentFileCopyAttachmentContainerForStore();
        uint64_t v12 = [v11 path];
        if (v12)
        {
          [v8 addObject:v12];
        }
        else
        {
          uint64_t v13 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            log = v13;
            CFArrayRef v14 = v6;
            CFIndex v15 = Count;
            uint64_t v16 = a3;
            uint64_t v17 = v8;
            int UID = CalStoreGetUID();
            unsigned int v19 = (void *)CalStoreCopyName();
            *(_DWORD *)long long buf = v26;
            int v34 = UID;
            uint64_t v8 = v17;
            a3 = v16;
            CFIndex Count = v15;
            CFArrayRef v6 = v14;
            __int16 v35 = 2112;
            id v36 = v19;
            _os_log_impl(&dword_1BBC88000, log, OS_LOG_TYPE_ERROR, "No attachment container for store %i (%@)", buf, 0x12u);
          }
        }

        ++v10;
      }
      while (Count != v10);
    }
    CFRelease(v6);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      CFArrayRef v6 = 0;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          CFArrayRef v6 = (const __CFArray *)((char *)v6
                                 + -[CADXPCImplementation sizeDirectoryAtPath:excludingDirectory:](self, "sizeDirectoryAtPath:excludingDirectory:", *(void *)(*((void *)&v28 + 1) + 8 * i), 0, v26));
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v22);
    }
    else
    {
      CFArrayRef v6 = 0;
    }
  }
  return (unint64_t)v6;
}

- (unint64_t)sizeDirectoryAtPath:(id)a3 excludingDirectory:(id)a4
{
  v51[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v44 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v8 fileExistsAtPath:v6 isDirectory:&v44]) {
    BOOL v9 = v44 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v11 = (uint64_t *)MEMORY[0x1E4F1C628];
    uint64_t v12 = (uint64_t *)MEMORY[0x1E4F1C6E8];
    if (v7)
    {
      uint64_t v13 = *MEMORY[0x1E4F1C628];
      v51[0] = *MEMORY[0x1E4F1C6E8];
      v51[1] = v13;
      uint64_t v35 = *MEMORY[0x1E4F1C718];
      v51[2] = *MEMORY[0x1E4F1C718];
      CFArrayRef v14 = (void *)MEMORY[0x1E4F1C978];
      CFIndex v15 = v51;
      uint64_t v16 = 3;
    }
    else
    {
      uint64_t v35 = *MEMORY[0x1E4F1C718];
      uint64_t v50 = *MEMORY[0x1E4F1C718];
      CFArrayRef v14 = (void *)MEMORY[0x1E4F1C978];
      CFIndex v15 = &v50;
      uint64_t v16 = 1;
    }
    uint64_t v17 = [v14 arrayWithObjects:v15 count:v16];
    id v33 = v6;
    long long v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __107__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__sizeDirectoryAtPath_excludingDirectory___block_invoke;
    v43[3] = &unk_1E624E298;
    v43[4] = self;
    long long v31 = (void *)v17;
    int v32 = v8;
    unsigned int v19 = [v8 enumeratorAtURL:v18 includingPropertiesForKeys:v17 options:0 errorHandler:v43];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (!v21)
    {
      unint64_t v10 = 0;
      goto LABEL_28;
    }
    uint64_t v22 = v21;
    unint64_t v10 = 0;
    uint64_t v23 = *(void *)v40;
    uint64_t v24 = *v11;
    uint64_t v34 = *v12;
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (v7)
        {
          id v38 = 0;
          [v26 getResourceValue:&v38 forKey:v24 error:0];
          id v27 = v38;
          if ([v27 BOOLValue])
          {
            id v37 = 0;
            [v26 getResourceValue:&v37 forKey:v34 error:0];
            if ([v37 isEqualToString:v7])
            {
              [v20 skipDescendants];
              goto LABEL_24;
            }
          }
        }
        id v36 = 0;
        int v28 = [v26 getResourceValue:&v36 forKey:v35 error:0];
        id v27 = v36;
        if (v28)
        {
          long long v29 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v46 = v26;
            __int16 v47 = 2112;
            id v48 = v27;
            _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_DEBUG, "File at URL: [%@] has size: [%@]", buf, 0x16u);
          }
          v10 += [v27 unsignedLongLongValue];
        }
LABEL_24:
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (!v22)
      {
LABEL_28:

        uint64_t v8 = v32;
        id v6 = v33;
        goto LABEL_29;
      }
    }
  }
  unint64_t v10 = 0;
LABEL_29:

  return v10;
}

uint64_t __107__CADXPCImplementation_CADDatabaseStorageManagementOperationGroup__sizeDirectoryAtPath_excludingDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_ERROR, "%@ couldn't enumerate %@: %@", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

- (void)CADDatabaseGetCalendarItemWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  long long v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  conn = self->_conn;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __96__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemWithUUID_reply___block_invoke;
  uint64_t v16 = &unk_1E624E2C0;
  id v9 = v6;
  id v17 = v9;
  long long v18 = self;
  unsigned int v19 = &v27;
  id v20 = &v21;
  [(ClientConnection *)conn withAllDatabasesPerform:&v13];
  int v10 = v22;
  uint64_t v11 = v22[5];
  if (v11)
  {
    uint64_t v12 = *((unsigned int *)v28 + 6);
  }
  else
  {
    uint64_t v12 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
    uint64_t v11 = v10[5];
  }
  v7[2](v7, v12, v11);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v22[5], v13, v14, v15, v16);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void __96__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemWithUUID_reply___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = CalDatabaseCopyCalendarItemWithUUID();
  if (v6)
  {
    id v7 = (const void *)v6;
    *a4 = 1;
    if ([*(id *)(a1[5] + 8) isCalendarItemRestricted:v6 forAction:0])
    {
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 1013;
    }
    else
    {
      uint64_t v8 = CADEntityCopyObjectID();
      uint64_t v9 = *(void *)(a1[7] + 8);
      int v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    CFRelease(v7);
  }
}

- (void)CADDatabaseGetCalendarItemsWithUUIDs:(id)a3 inCalendars:(id)a4 propertiesToLoad:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, uint64_t, void *))a6;
  id v13 = a5;
  uint64_t v14 = [[CADFetchedObjectSerializer alloc] initWithConnection:self->_conn defaultPropertiesToLoad:v13];

  id v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v11];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke;
  v29[3] = &unk_1E624E2E8;
  id v16 = v10;
  id v30 = v16;
  long long v31 = self;
  id v17 = v14;
  int v32 = v17;
  id v18 = v15;
  id v33 = v18;
  unsigned int v19 = (void *)MEMORY[0x1C1867AB0](v29);
  id v20 = v19;
  conn = self->_conn;
  if (v11)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_3;
    v25[3] = &unk_1E624E338;
    uint64_t v22 = &v26;
    id v26 = v19;
    [(ClientConnection *)conn withDatabaseForObjects:v11 perform:v25];
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_2;
    v27[3] = &unk_1E624E310;
    uint64_t v22 = &v28;
    id v28 = v19;
    [(ClientConnection *)conn withAllDatabasesPerform:v27];
  }

  uint64_t v23 = [(CADFetchedObjectSerializer *)v17 fetchedObjectWrappers];
  if ([v23 count])
  {
    uint64_t v24 = 0;
  }
  else
  {

    uint64_t v23 = 0;
    uint64_t v24 = 1010;
  }
  v12[2](v12, v24, v23);
  [(ClientConnection *)self->_conn logAccessToObjects:v18];
}

void __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)CalDatabaseCopyCalendarItemsWithUUIDs();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        if (([*(id *)(*(void *)(a1 + 40) + 8) isCalendarItemRestricted:ValueAtIndex forAction:0] & 1) == 0)
        {
          id v8 = (id)[*(id *)(a1 + 48) addEntity:ValueAtIndex];
          uint64_t v9 = *(void **)(a1 + 56);
          id v10 = CADEntityCopyObjectID();
          [v9 addObject:v10];
        }
      }
    }
    CFRelease(v3);
  }
}

uint64_t __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __127__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 valueForKey:@"entityID"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)CADDatabaseGetCalendarItemsWithUniqueIdentifier:(id)a3 inCalendar:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2;
  id v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  id v11 = objc_opt_new();
  uint64_t v12 = v11;
  if (v9) {
    [v11 addObject:v9];
  }
  conn = self->_conn;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __120__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply___block_invoke;
  v18[3] = &unk_1E624E360;
  id v14 = v9;
  id v19 = v14;
  id v20 = self;
  id v15 = v8;
  id v21 = v15;
  uint64_t v23 = &v24;
  id v16 = v12;
  id v22 = v16;
  if ([(ClientConnection *)conn withDatabaseForObject:v14 perform:v18]) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = 1010;
  }
  v10[2](v10, v17, v25[5]);
  [(ClientConnection *)self->_conn logAccessToObjects:v16];

  _Block_object_dispose(&v24, 8);
}

void __120__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) entityID];
  CFArrayRef v2 = (const void *)CalDatabaseCopyCalendarWithUID();
  if (v2 && [*(id *)(*(void *)(a1 + 40) + 8) isCalendarRestricted:v2 forAction:0])
  {
    CFArrayRef v3 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      CFArrayRef v4 = *(const __CFArray **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      CFArrayRef v15 = v4;
      _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "Attempt to read restricted calendar: [%@]", buf, 0xCu);
    }
LABEL_17:
    CFRelease(v2);
    return;
  }
  CFArrayRef v5 = (const __CFArray *)CalDatabaseCopyAllEntitiesWithPropertyInCalendarOrStore();
  if (v5)
  {
    CFArrayRef v6 = v5;
    CFIndex Count = CFArrayGetCount(v5);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        if (CFArrayGetValueAtIndex(v6, i))
        {
          uint64_t v12 = CADEntityCopyObjectID();
          if (v12)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v12];
            [*(id *)(a1 + 56) addObject:v12];
          }
        }
        else
        {
          id v13 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            CFArrayRef v15 = v6;
            _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "NULL item found in array of matching entities: [%@]", buf, 0xCu);
          }
        }
      }
    }
    CFRelease(v6);
  }
  if (v2) {
    goto LABEL_17;
  }
}

- (void)CADDatabaseGetCalendarItemsWithRecurrenceSet:(id)a3 inCalendar:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  long long v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  id v11 = objc_opt_new();
  if (v8 && v9)
  {
    conn = self->_conn;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __117__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply___block_invoke;
    v15[3] = &unk_1E624E388;
    id v16 = v9;
    uint64_t v17 = self;
    id v13 = v11;
    id v18 = v13;
    id v19 = v8;
    id v20 = &v21;
    if ([(ClientConnection *)conn withDatabaseForObject:v16 perform:v15]) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 1010;
    }
    v10[2](v10, v14, v22[5]);
    [(ClientConnection *)self->_conn logAccessToObjects:v13];
  }
  else
  {
    v10[2](v10, 1001, v22[5]);
  }

  _Block_object_dispose(&v21, 8);
}

void __117__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) entityID];
  CFArrayRef v2 = (const void *)CalDatabaseCopyCalendarWithUID();
  if (v2 && [*(id *)(*(void *)(a1 + 40) + 8) isCalendarRestricted:v2 forAction:0])
  {
    CFRelease(v2);
    return;
  }
  [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
  CFArrayRef v3 = (const __CFArray *)CalDatabaseCopyEventsWithRecurrenceSet();
  if (v3)
  {
    CFArrayRef v4 = v3;
    CFIndex Count = CFArrayGetCount(v3);
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (Count >= 1)
    {
      for (CFIndex i = 0; Count != i; ++i)
      {
        if (CFArrayGetValueAtIndex(v4, i))
        {
          uint64_t v10 = CalCalendarItemCopyCalendar();
          if (v10)
          {
            id v11 = (const void *)v10;
            uint64_t v12 = CADEntityCopyObjectID();
            int v13 = [v12 entityID];
            if (v13 == [*(id *)(a1 + 32) entityID])
            {
              uint64_t v14 = CADEntityCopyObjectID();
              if (v14)
              {
                [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v14];
                [*(id *)(a1 + 48) addObject:v14];
              }
            }
            CFRelease(v11);

            continue;
          }
          uint64_t v18 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            CFArrayRef v20 = v4;
            id v16 = v18;
            uint64_t v17 = "NULL calendar found in array of matching entities: [%@]";
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v15 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            CFArrayRef v20 = v4;
            id v16 = v15;
            uint64_t v17 = "NULL item found in array of matching entities: [%@]";
LABEL_20:
            _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
          }
        }
      }
    }
    CFRelease(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (void)CADDatabaseGetAlarmWithExternalID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__2;
    id v28 = __Block_byref_object_dispose__2;
    id v29 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    conn = self->_conn;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __95__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetAlarmWithExternalID_reply___block_invoke;
    uint64_t v15 = &unk_1E624E3B0;
    id v16 = v6;
    uint64_t v17 = self;
    uint64_t v18 = &v24;
    id v19 = &v20;
    [(ClientConnection *)conn withAllDatabasesPerform:&v12];
    uint64_t v10 = (void *)v25[5];
    if (v10)
    {
      if (*((unsigned char *)v21 + 24))
      {
        v25[5] = 0;

        uint64_t v10 = (void *)v25[5];
        uint64_t v11 = 1013;
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 1010;
    }
    ((void (**)(void, uint64_t, void *))v8)[2](v8, v11, v10);
    -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v25[5], v12, v13, v14, v15);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1001, 0);
  }
}

void __95__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseGetAlarmWithExternalID_reply___block_invoke(void *a1)
{
  uint64_t v2 = CalDatabaseCopyAlarmWithUUID();
  if (v2)
  {
    CFArrayRef v3 = (const void *)v2;
    uint64_t v4 = CADEntityCopyObjectID();
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if ([*(id *)(a1[5] + 8) isAlarmRestricted:v3 forAction:0]) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
    CFRelease(v3);
  }
}

uint64_t __143__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (void)CADDatabaseCancelFetchRequestWithIdentifier:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(ClientConnection *)self->_conn operations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v10 = [v9 fetchIdentifier];
          if ((v10 & 0x80000000) == 0 && v10 == a3)
          {
            [v9 cancel];
            goto LABEL_13;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)CADDatabaseExportICSForCalendarItemWithID:(id)a3 occurrenceDate:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v12 = (void (**)(id, uint64_t, void))a6;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__2;
  long long v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  conn = self->_conn;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __126__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseExportICSForCalendarItemWithID_occurrenceDate_options_reply___block_invoke;
  uint64_t v20 = &unk_1E624E420;
  id v14 = v10;
  id v21 = v14;
  uint64_t v22 = self;
  uint64_t v24 = &v33;
  long long v25 = &v27;
  id v15 = v11;
  id v23 = v15;
  unint64_t v26 = a5;
  if ([(ClientConnection *)conn withDatabaseForObject:v14 perform:&v17])
  {
    uint64_t v16 = *((unsigned int *)v34 + 6);
  }
  else
  {
    uint64_t v16 = 1010;
    *((_DWORD *)v34 + 6) = 1010;
  }
  v12[2](v12, v16, v28[5]);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v14, v17, v18, v19, v20);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

void __126__CADXPCImplementation_CADCalendarItemOperationGroup__CADDatabaseExportICSForCalendarItemWithID_occurrenceDate_options_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  values = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    if ([*(id *)(*(void *)(a1 + 40) + 8) isCalendarItemRestricted:v4 forAction:0])
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1013;
      CFRelease(v5);
    }
    else
    {
      CFArrayRef v6 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      if (v6)
      {
        CFArrayRef v7 = v6;
        uint64_t v8 = CalCreateiCalendarDataFromCalEntitiesWithOptions();
        uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        CFRelease(v7);
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1007;
      }
      CFRelease(values);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetDeletableCalendars:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = (void (**)(id, void, id))a3;
  id v6 = objc_alloc_init(v4);
  conn = self->_conn;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __80__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableCalendars___block_invoke_2;
  long long v12 = &unk_1E624E490;
  id v13 = v6;
  id v14 = &__block_literal_global_10;
  id v8 = v6;
  [(ClientConnection *)conn withAllDatabasesPerform:&v9];
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8, v9, v10, v11, v12);
}

uint64_t __80__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableCalendars___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v4 = (const void *)CalDatabaseCopyDefaultLocalCalendar();
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = CFEqual(v4, a3);
    CFRelease(v5);
    if (v6) {
      return 0;
    }
  }
  uint64_t v8 = CalCalendarCopyStore();
  if (!v8) {
    return 1;
  }
  uint64_t v9 = (const void *)v8;
  BOOL v7 = CalStoreGetType() != 5;
  CFRelease(v9);
  return v7;
}

void __80__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableCalendars___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)CalDatabaseCopyOfAllCalendarsInStore();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40)))
        {
          uint64_t UID = CalCalendarGetUID();
          uint64_t v10 = *(void **)(a1 + 32);
          id v11 = objc_alloc(MEMORY[0x1E4F57428]);
          long long v12 = objc_msgSend(v11, "initWithEntityType:entityID:databaseID:", 1, UID, a2, (void)v13);
          [v10 addObject:v12];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)CADDatabaseGetDeletableSources:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = (void (**)(id, void, id))a3;
  id v6 = objc_alloc_init(v4);
  conn = self->_conn;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __78__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableSources___block_invoke_2;
  long long v12 = &unk_1E624E490;
  id v13 = v6;
  id v14 = &__block_literal_global_4;
  id v8 = v6;
  [(ClientConnection *)conn withAllDatabasesPerform:&v9];
  v5[2](v5, 0, v8);

  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v8, v9, v10, v11, v12);
}

BOOL __78__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableSources___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  id v4 = (const void *)CalDatabaseCopyLocalStore();
  if (v4 && (uint64_t v5 = v4, v6 = CFEqual(v4, a3), CFRelease(v5), v6)) {
    return 0;
  }
  else {
    return CalStoreGetType() != 5;
  }
}

void __78__CADXPCImplementation_CADSyncOperationGroup__CADDatabaseGetDeletableSources___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)CalDatabaseCopyOfAllStores();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40)))
        {
          uint64_t UID = CalStoreGetUID();
          uint64_t v10 = *(void **)(a1 + 32);
          id v11 = objc_alloc(MEMORY[0x1E4F57428]);
          long long v12 = objc_msgSend(v11, "initWithEntityType:entityID:databaseID:", 6, UID, a2, (void)v13);
          [v10 addObject:v12];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)CADMigrateDatabaseIfNeeded:(id)a3
{
  CFArrayRef v3 = (void (**)(id, uint64_t))a3;
  char IsCurrentProcessCalaccessd = CalDatabaseIsCurrentProcessCalaccessd();
  uint64_t v5 = CADLogHandle;
  BOOL v6 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT);
  if ((IsCurrentProcessCalaccessd & 1) == 0)
  {
    if (!v6)
    {
LABEL_10:
      uint64_t v9 = 0;
      goto LABEL_14;
    }
    *(_WORD *)long long v15 = 0;
    uint64_t v10 = "****** Ignoring request to migrate because this is not calaccessd";
    id v11 = v15;
LABEL_9:
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_10;
  }
  if (v6)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, "****** Requested to migrate", buf, 2u);
  }
  int v7 = CalDatabasePerformMigrationIfNeeded();
  uint64_t v5 = CADLogHandle;
  if (v7)
  {
    BOOL v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT);
    uint64_t v9 = 0;
    if (v8)
    {
      __int16 v13 = 0;
      uint64_t v10 = "****** Finished migration";
      id v11 = (uint8_t *)&v13;
      goto LABEL_9;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_ERROR, "****** Migration request failed because it was called before protected data is accessible", v12, 2u);
    }
    uint64_t v9 = 1022;
  }
LABEL_14:
  v3[2](v3, v9);
}

- (void)CADDatabaseGetNotificationCountExcludingUncheckedCalendars:(BOOL)a3 expanded:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a3;
  conn = self->_conn;
  id v12 = 0;
  BOOL v8 = (void (**)(id, void, uint64_t))a5;
  LOBYTE(v11) = a4;
  uint64_t v9 = +[CADNotificationUtilities CADDatabaseGetEventNotificationItemsWithConnection:conn afterDate:0 forSourceWithExternalIdentifier:0 excludingDelegateSources:0 excludingUncheckedCalendars:v6 filteredByShowsNotificationsFlag:1 expanded:v11 earliestExpirationDate:0 notificationTypes:&v12 objectIDs:0 occurrenceDates:0 attendeeObjectIDs:0];
  id v10 = v12;
  v8[2](v8, v9, [v10 count]);
}

- (void)CADDiagnosticsCollectWithToken:(unsigned int)a3 options:(int64_t)a4 trafficLogsCollectionMode:(unint64_t)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = (void (**)(id, void))a6;
  uint64_t v11 = [[CADDiagnosticsCollectionOperation alloc] initWithConnection:self->_conn token:v8 options:a4 trafficLogsCollectionMode:a5];
  [(ClientConnection *)self->_conn addOperation:v11];
  v10[2](v10, 0);
}

- (void)CADDiagnosticsCancelCollectionWithToken:(unsigned int)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(id, uint64_t))a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v7 = [(ClientConnection *)self->_conn operations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 token] == a3)
        {
          [v12 cancel];
          uint64_t v13 = 0;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1001;
LABEL_12:

  v6[2](v6, v13);
}

- (void)CADDatabaseGetAccess:(id)a3
{
  conn = self->_conn;
  id v6 = a3;
  id v9 = [(ClientConnection *)conn permissionValidator];
  uint64_t v7 = [v9 eventAuthorization];
  uint64_t v8 = [(ClientConnection *)self->_conn permissionValidator];
  (*((void (**)(id, void, uint64_t, uint64_t))a3 + 2))(v6, 0, v7, [v8 remindersAuthorization]);
}

- (id)_hangAssertionForBlockingTCCCall
{
  v36[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = (void *)MEMORY[0x1E4F96478];
  id v4 = [(ClientConnection *)self->_conn identity];
  uint64_t v5 = objc_msgSend(v3, "targetWithPid:", objc_msgSend(v4, "pid"));

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"DisableWatchdog"];
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F96318]);
      v36[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      id v9 = (void *)[v7 initWithExplanation:@"Prevent watchdog termination while blocking on TCC authorization" target:v5 attributes:v8];

      if (v9)
      {
        id v31 = 0;
        char v10 = [v9 acquireWithError:&v31];
        id v11 = v31;
        if (v10)
        {
          id v12 = v9;
        }
        else
        {
          long long v25 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            conn = self->_conn;
            uint64_t v27 = v25;
            id v28 = [(ClientConnection *)conn identity];
            int v29 = [v28 pid];
            *(_DWORD *)long long buf = 67109378;
            int v33 = v29;
            __int16 v34 = 2112;
            id v35 = v11;
            _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_ERROR, "Failed to acquire watchog disable assertion for pid %d with error: %@", buf, 0x12u);
          }
          id v12 = 0;
        }
      }
      else
      {
        id v21 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = self->_conn;
          id v23 = v21;
          uint64_t v24 = [(ClientConnection *)v22 identity];
          *(_DWORD *)long long buf = 67109120;
          int v33 = [v24 pid];
          _os_log_impl(&dword_1BBC88000, v23, OS_LOG_TYPE_ERROR, "Failed to create RBSAssertion for connected client with PID %d", buf, 8u);
        }
        id v12 = 0;
      }
    }
    else
    {
      long long v17 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = self->_conn;
        uint64_t v19 = v17;
        uint64_t v20 = [(ClientConnection *)v18 identity];
        *(_DWORD *)long long buf = 67109120;
        int v33 = [v20 pid];
        _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_ERROR, "Failed to create RBSAttribute for connected client with PID %d", buf, 8u);
      }
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v13 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      long long v14 = self->_conn;
      long long v15 = v13;
      long long v16 = [(ClientConnection *)v14 identity];
      *(_DWORD *)long long buf = 67109120;
      int v33 = [v16 pid];
      _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_ERROR, "Failed to create RBSTarget for connected client with PID %d", buf, 8u);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_TCCPromptReasonStringForReason:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 8) {
    return off_1E624EFF0[a3];
  }
  uint64_t v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_ERROR, "Unexpected CalRequestAccessReason (int value: %ld): we don't support this kind of CalRequestAccessReason.", (uint8_t *)&v6, 0xCu);
  }
  return @"Unknown";
}

- (void)CADDatabaseRequestAccessForEntityType:(unint64_t)a3 desiredFullAccess:(BOOL)a4 isBlockingUIThread:(BOOL)a5 reason:(int64_t)a6 reply:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  uint64_t v13 = v12;
  if (a3)
  {
    if (a3 != 1)
    {
LABEL_8:
      (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1001, 0);
      goto LABEL_16;
    }
    long long v14 = (uint64_t *)MEMORY[0x1E4FA9AF0];
  }
  else
  {
    long long v14 = (uint64_t *)MEMORY[0x1E4FA9A30];
  }
  uint64_t v15 = *v14;
  if (!*v14) {
    goto LABEL_8;
  }
  if (v8)
  {
    long long v16 = [(CADXPCImplementation *)self _hangAssertionForBlockingTCCCall];
  }
  else
  {
    long long v16 = 0;
  }
  long long v17 = objc_opt_new();
  uint64_t v18 = [(CADXPCImplementation *)self _TCCPromptReasonStringForReason:a6];
  [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4FA9A08]];

  uint64_t v19 = [(ClientConnection *)self->_conn identity];
  uint64_t v20 = [v19 bundleIdentifier];

  if (v20) {
    [v17 setObject:v20 forKeyedSubscript:@"kEventKitTCCUIFullAccessNotificationClientBundleIDKey"];
  }
  if (v9) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 4;
  }
  uint64_t v22 = [(ClientConnection *)self->_conn tccPermissionChecker];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __137__CADXPCImplementation_CADAccessOperationGroup__CADDatabaseRequestAccessForEntityType_desiredFullAccess_isBlockingUIThread_reason_reply___block_invoke;
  v24[3] = &unk_1E624EFD0;
  uint64_t v27 = v15;
  void v24[4] = self;
  id v25 = v16;
  id v26 = v13;
  id v23 = v16;
  [v22 requestAuthorization:v21 forService:v15 clientDictionary:v17 completion:v24];

LABEL_16:
}

void *__137__CADXPCImplementation_CADAccessOperationGroup__CADDatabaseRequestAccessForEntityType_desiredFullAccess_isBlockingUIThread_reason_reply___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v6 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[7];
      BOOL v8 = *(void **)(a1[4] + 8);
      BOOL v9 = v6;
      char v10 = [v8 identity];
      int v14 = 138543874;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      long long v17 = v10;
      __int16 v18 = 1024;
      int v19 = a3;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_ERROR, "Failed to request authorization for service %{public}@ for client %{public}@. Error = %d", (uint8_t *)&v14, 0x1Cu);
    }
  }
  [*(id *)(a1[4] + 8) clearCachedAuthorizationStatus];
  uint64_t v11 = a1[6];
  uint64_t v12 = CalAuthorizationStatusFromTCCAuthRight(a1[7], a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a3, v12);
  uint64_t result = (void *)a1[5];
  if (result) {
    return (void *)[result invalidate];
  }
  return result;
}

- (void)CADDatabaseResetWithReply:(id)a3
{
  conn = self->_conn;
  id v4 = (void (**)(id, void))a3;
  [(ClientConnection *)conn clearCachedAuthorizationStatus];
  v4[2](v4, 0);
}

void __102__CADXPCImplementation_CADCalendarOperationGroup__CADDatabaseGetCalendarsWithFaultedProperties_reply___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  BOOL v8 = (const void *)CalDatabaseCopyLimitedAccessVirtualCalendar();
  CADEntityCopyObjectID();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v9 = CalEntityCopyPropertyValues(*(void **)(*(void *)(a1 + 32) + 8), (uint64_t)v8, *(void **)(a1 + 40), (_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v9];
  CFRelease(v8);
}

- (void)CADCalendar:(id)a3 hasEvents:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if ([(ClientConnection *)self->_conn eventAccessLevel] == 2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEvents___block_invoke;
    v9[3] = &unk_1E624F088;
    void v9[4] = &v10;
    uint64_t v8 = [(CADXPCImplementation *)self _tryPerformBlockWithCalendarID:v6 forAction:0 withBlock:v9];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v7[2](v7, v8, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
}

uint64_t __73__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEvents___block_invoke(uint64_t a1)
{
  uint64_t result = CalCalendarHasEvents();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)CADCalendar:(id)a3 hasEventsWithRoomAsAttendee:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEventsWithRoomAsAttendee___block_invoke;
  v9[3] = &unk_1E624F088;
  void v9[4] = &v10;
  uint64_t v8 = [(CADXPCImplementation *)self _tryPerformBlockWithCalendarID:v6 forAction:0 withBlock:v9];
  v7[2](v7, v8, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
}

uint64_t __91__CADXPCImplementation_CADCalendarOperationGroup__CADCalendar_hasEventsWithRoomAsAttendee___block_invoke(uint64_t a1)
{
  uint64_t result = CalCalendarHasEventsWithRoomAsAttendee();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)_tryPerformBlockWithCalendarID:(id)a3 forAction:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  conn = self->_conn;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  uint8_t v15[2] = __102__CADXPCImplementation_CADCalendarOperationGroup___tryPerformBlockWithCalendarID_forAction_withBlock___block_invoke;
  v15[3] = &unk_1E624F0B0;
  id v11 = v8;
  id v16 = v11;
  long long v17 = self;
  int v19 = &v21;
  unint64_t v20 = a4;
  id v12 = v9;
  id v18 = v12;
  if ([(ClientConnection *)conn withDatabaseForObject:v11 perform:v15])
  {
    int v13 = *((_DWORD *)v22 + 6);
  }
  else
  {
    int v13 = 1010;
    *((_DWORD *)v22 + 6) = 1010;
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __102__CADXPCImplementation_CADCalendarOperationGroup___tryPerformBlockWithCalendarID_forAction_withBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) entityID];
  uint64_t v2 = CalDatabaseCopyCalendarWithUID();
  if (!v2)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    int v5 = 1010;
    goto LABEL_5;
  }
  uint64_t v3 = (const void *)v2;
  if ([*(id *)(*(void *)(a1 + 40) + 8) isCalendarRestricted:v2 forAction:*(void *)(a1 + 64)])
  {
    CFRelease(v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    int v5 = 1013;
LABEL_5:
    *(_DWORD *)(v4 + 24) = v5;
    return;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  CFRelease(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 8);
  [v7 logAccessToObject:v6];
}

void __98__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetSourcesWithFaultedProperties_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)CalDatabaseCopyLimitedAccessVirtualStore();
  CADEntityCopyObjectID();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = CalEntityCopyPropertyValues(*(void **)(*(void *)(a1 + 32) + 8), (uint64_t)v2, *(void **)(a1 + 40), (_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v3];
  CFRelease(v2);
}

- (void)CADDatabaseGetLocalSourceWithEnableIfNeeded:(BOOL)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  conn = self->_conn;
  uint64_t v8 = *MEMORY[0x1E4F574B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalSourceWithEnableIfNeeded_reply___block_invoke;
  v10[3] = &unk_1E624F128;
  BOOL v11 = a3;
  v10[4] = self;
  void v10[5] = &v12;
  v10[6] = &v18;
  if ([(ClientConnection *)conn withDatabaseID:v8 perform:v10])
  {
    uint64_t v9 = *((unsigned int *)v19 + 6);
  }
  else
  {
    uint64_t v9 = 1007;
    *((_DWORD *)v19 + 6) = 1007;
  }
  v6[2](v6, v9, v13[5]);
  [(ClientConnection *)self->_conn logAccessToObject:v13[5]];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __99__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalSourceWithEnableIfNeeded_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CalDatabaseCopyStoreWithUID();
  if (v4)
  {
    int v5 = (void *)v4;
    if (!CalStoreGetType()) {
      goto LABEL_13;
    }
    CalStoreRepairDefaultLocalStore();
    CFRelease(v5);
    int v5 = (void *)CalDatabaseCopyStoreWithUID();
    if (v5) {
      goto LABEL_13;
    }
  }
  uint64_t v6 = (void *)CalDatabaseCopyOfAllStores();
  if (!v6) {
    return;
  }
  id v18 = v6;
  uint64_t v7 = [v6 count];
  if (!v7)
  {
LABEL_9:

    return;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  while (1)
  {
    int v5 = [v18 objectAtIndexedSubscript:v9];

    if (!CalStoreGetType()) {
      break;
    }
    if (v8 == ++v9) {
      goto LABEL_9;
    }
  }
  CFRetain(v5);

  if (v5)
  {
LABEL_13:
    int v10 = [*(id *)(*(void *)(a1 + 32) + 8) eventAccessLevel];
    int v11 = [*(id *)(*(void *)(a1 + 32) + 8) reminderAccessGranted];
    int v12 = v11;
    if (v10 == 2 && (v11 & 1) != 0
      || v10 == 2 && (CalStoreAllowsEvents() & 1) != 0
      || v12 && CalStoreAllowsTasks())
    {
      if (*(unsigned char *)(a1 + 56))
      {
        if ((CalStoreIsEnabled() & 1) == 0)
        {
          CalStoreSetEnabled();
          if ((CalDatabaseSave() & 1) == 0)
          {
            int v13 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "Failed to save database after creating subscribed calendar store", buf, 2u);
            }
          }
        }
      }
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:6 entityID:CalStoreGetUID() databaseID:a2];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      int v17 = 0;
    }
    else
    {
      int v17 = 1013;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v17;
    CFRelease(v5);
  }
}

- (void)CADDatabaseGetLocalBirthdaySource:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  int v5 = [(ClientConnection *)self->_conn permissionValidator];
  if ([v5 canModifyBirthdayCalendar])
  {
    conn = self->_conn;
    uint64_t v7 = *MEMORY[0x1E4F574B8];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalBirthdaySource___block_invoke;
    v9[3] = &unk_1E624E1D8;
    void v9[4] = self;
    void v9[5] = &v10;
    void v9[6] = &v16;
    if (![(ClientConnection *)conn withDatabaseID:v7 perform:v9]) {
      *((_DWORD *)v17 + 6) = 1007;
    }
    uint64_t v8 = *((unsigned int *)v17 + 6);
  }
  else
  {
    uint64_t v8 = 1013;
    *((_DWORD *)v17 + 6) = 1013;
  }
  v4[2](v4, v8, v11[5]);
  [(ClientConnection *)self->_conn logAccessToObject:v11[5]];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void __83__CADXPCImplementation_CADSourceOperationGroup__CADDatabaseGetLocalBirthdaySource___block_invoke(void *a1, uint64_t a2)
{
  id v10 = (id)CalDatabaseCopyOfAllStores();
  if (v10)
  {
    uint64_t v4 = [v10 count];
    if (v4)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; v5 != i; ++i)
      {
        [v10 objectAtIndexedSubscript:i];

        if (CalStoreGetType() == 5)
        {
          if ([*(id *)(a1[4] + 8) eventAccessLevel] == 2
            && (CalStoreAllowsEvents() & 1) != 0)
          {
            uint64_t v7 = [objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:6 entityID:CalStoreGetUID() databaseID:a2];
            uint64_t v8 = *(void *)(a1[5] + 8);
            uint64_t v9 = *(void **)(v8 + 40);
            *(void *)(v8 + 40) = v7;

            *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 0;
            break;
          }
          *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 1013;
        }
      }
    }
  }
}

void __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) entityID];
  uint64_t v2 = CalDatabaseCopyCalendarWithUID();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    uint64_t v4 = (const void *)CalCalendarCopyStore();
    CFRelease(v3);
    if (v4)
    {
      uint64_t v5 = CADEntityCopyObjectID();
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      CFRelease(v4);
    }
  }
}

void __79__CADXPCImplementation_CADSourceOperationGroup__CADObjectGetConstraints_reply___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1C1865800](a3, [*(id *)(a1 + 32) entityID]);
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t v6 = (const void *)CalCalendarItemCopyCalendar();
    CFRelease(v5);
    if (v6)
    {
      uint64_t v7 = (const void *)CalCalendarCopyStore();
      CFRelease(v6);
      if (v7)
      {
        uint64_t v8 = CADEntityCopyObjectID();
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        CFRelease(v7);
      }
    }
  }
}

- (void)CADSourceGetNotificationCollection:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetNotificationCollection_reply___block_invoke;
  v9[3] = &unk_1E624F150;
  void v9[4] = &v10;
  uint64_t v8 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:v6 forAction:0 withBlock:v9];
  v7[2](v7, v8, v11[5]);
  _Block_object_dispose(&v10, 8);
}

void __90__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetNotificationCollection_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)CalStoreCopyCalendars();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        CFArrayGetValueAtIndex(v3, i);
        if (CalCalendarIsNotificationsCollection())
        {
          id v7 = objc_alloc(MEMORY[0x1E4F57428]);
          uint64_t UID = CalCalendarGetUID();
          uint64_t v9 = [v7 initWithEntityType:1 entityID:UID databaseID:CalDatabaseGetAuxilliaryDatabaseID()];
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
          int v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;
        }
      }
    }
    CFRelease(v3);
  }
}

- (void)CADSourceRefresh:(id)a3 isUserRequested:(BOOL)a4 reply:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  uint8_t v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__6;
  void v15[4] = __Block_byref_object_dispose__6;
  uint64_t v16 = self->_conn;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceRefresh_isUserRequested_reply___block_invoke;
  v13[3] = &unk_1E624F1A0;
  BOOL v14 = a4;
  void v13[4] = v15;
  v13[5] = &v21;
  v13[6] = &v17;
  unsigned int v10 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:v8 forAction:0 withBlock:v13];
  unsigned int v11 = *((_DWORD *)v18 + 6);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v10;
  }
  v9[2](v9, v12, *((unsigned __int8 *)v22 + 24));
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

void __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceRefresh_isUserRequested_reply___block_invoke(uint64_t a1)
{
  id v9 = (id)CalStoreCopyExternalID();
  if (v9)
  {
    CFArrayRef v2 = (const __CFArray *)CalStoreCopyCalendars();
    CFArrayRef v3 = v2;
    if (v2)
    {
      CFIndex Count = CFArrayGetCount(v2);
      if (Count < 1)
      {
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v5 = 0;
        for (CFIndex i = 0; i != Count; ++i)
        {
          CFArrayGetValueAtIndex(v3, i);
          if (CalCalendarCanContainEntityType()
            && [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventAccessLevel])
          {
            v5 |= 4uLL;
          }
          if (CalCalendarCanContainEntityType()
            && [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) reminderAccessGranted])
          {
            v5 |= 0x10uLL;
          }
        }
      }
      id v7 = [MEMORY[0x1E4F5E950] sharedConnection];
      int v8 = [v7 updateContentsOfAllFoldersForAccountID:v9 andDataclass:v5 isUserRequested:*(unsigned __int8 *)(a1 + 56)];

      if (v8) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      CFRelease(v3);
    }
  }
}

- (void)CADCountCalendarItemsOfType:(int)a3 inSource:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__CADXPCImplementation_CADSourceOperationGroup__CADCountCalendarItemsOfType_inSource_reply___block_invoke;
  void v11[3] = &unk_1E624F1C8;
  void v11[4] = &v13;
  int v12 = v6;
  uint64_t v10 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:v8 forAction:0 entityType:v6 withBlock:v11];
  v9[2](v9, v10, v14[3]);
  _Block_object_dispose(&v13, 8);
}

uint64_t __92__CADXPCImplementation_CADSourceOperationGroup__CADCountCalendarItemsOfType_inSource_reply___block_invoke(uint64_t a1)
{
  uint64_t result = CalDatabaseGetCountOfCalendarItemsInStore();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)result;
  return result;
}

- (void)CADRemoveCalendarItemsOlderThanDate:(id)a3 ofType:(int)a4 inSource:(id)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, void))a6;
  v18[0] = 0;
  v18[1] = v18;
  void v18[2] = 0x2020000000;
  v18[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__CADXPCImplementation_CADSourceOperationGroup__CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply___block_invoke;
  v14[3] = &unk_1E624F1F0;
  uint64_t v16 = v18;
  int v17 = v8;
  id v13 = v10;
  id v15 = v13;
  v12[2](v12, [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:v11 forAction:1 entityType:v8 withBlock:v14]);

  _Block_object_dispose(v18, 8);
}

uint64_t __107__CADXPCImplementation_CADSourceOperationGroup__CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply___block_invoke(uint64_t a1)
{
  uint64_t result = CalStoreRemoveItemsOfTypeOlderThanDateInStore();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)CADSourceGetGrantedDelegatesList:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke;
  v9[3] = &unk_1E624F240;
  id v7 = v6;
  id v10 = v7;
  uint64_t v8 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:a3 forAction:0 withBlock:v9];
  if (v8) {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, v8, 0);
  }
}

void __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (void *)CalStoreCopyExternalID();
  if (v2)
  {
    CFArrayRef v3 = [MEMORY[0x1E4F5E950] sharedConnection];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke_2;
    v5[3] = &unk_1E624F218;
    id v6 = *(id *)(a1 + 32);
    id v4 = (id)[v3 requestGrantedDelegatesListForAccountID:v2 resultsBlock:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __88__CADXPCImplementation_CADSourceOperationGroup__CADSourceGetGrantedDelegatesList_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v29 = v6;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_ERROR, "Error getting granted delegates list: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v21 = a1;
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v15 = objc_opt_new();
          uint64_t v16 = [v14 uri];
          [v15 setUri:v16];

          int v17 = [v14 displayName];
          [v15 setDisplayName:v17];

          uint64_t v18 = [v14 preferredUserAddress];
          [v15 setPreferredUserAddress:v18];

          unint64_t v19 = [v14 permission];
          if (v19 >= 3) {
            uint64_t v20 = -1;
          }
          else {
            uint64_t v20 = v19;
          }
          objc_msgSend(v15, "setPermission:", v20, v21);
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    (*(void (**)(void))(*(void *)(v21 + 32) + 16))();
    id v5 = v22;
  }
}

- (void)CADSourceUpdateGrantedDelegate:(id)a3 action:(int64_t)a4 sourceID:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  uint8_t v15[2] = __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke;
  v15[3] = &unk_1E624F268;
  id v12 = v11;
  id v16 = v10;
  id v17 = v12;
  int64_t v18 = a4;
  id v13 = v10;
  uint64_t v14 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:a5 forAction:1 withBlock:v15];
  if (v14) {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v14);
  }
}

void __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (void *)CalStoreCopyExternalID();
  if (v2)
  {
    CFArrayRef v3 = objc_opt_new();
    id v4 = [*(id *)(a1 + 32) displayName];
    [v3 setDisplayName:v4];

    id v5 = [*(id *)(a1 + 32) uri];
    [v3 setUri:v5];

    id v6 = [*(id *)(a1 + 32) preferredUserAddress];
    [v3 setPreferredUserAddress:v6];

    if (*(void *)(a1 + 48) == 1)
    {
      uint64_t v7 = 0;
    }
    else
    {
      unint64_t v8 = [*(id *)(a1 + 32) permission];
      if (v8 >= 3) {
        uint64_t v7 = -1;
      }
      else {
        uint64_t v7 = v8;
      }
    }
    [v3 setPermission:v7];
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    id v11 = [MEMORY[0x1E4F5E950] sharedConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    _DWORD v13[2] = __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke_2;
    v13[3] = &unk_1E624EB90;
    id v14 = *(id *)(a1 + 40);
    id v12 = (id)[v11 updateGrantedDelegateForAccountID:v2 grantedDelegate:v3 action:v10 resultsBlock:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __102__CADXPCImplementation_CADSourceOperationGroup__CADSourceUpdateGrantedDelegate_action_sourceID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_ERROR, "Error updating granted delegate: %@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (void)CADSourceAddExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toSourceWithID:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke;
  v17[3] = &unk_1E624F2B8;
  id v13 = v12;
  id v19 = v11;
  id v20 = v13;
  id v18 = v10;
  id v14 = v11;
  id v15 = v10;
  uint64_t v16 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:a5 forAction:1 withBlock:v17];
  if (v16) {
    (*((void (**)(id, uint64_t, void, uint64_t))v13 + 2))(v13, v16, 0, -1);
  }
}

void __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  int v6 = (void *)CalStoreCopyExternalID();
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F5E950] sharedConnection];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke_2;
    v10[3] = &unk_1E624F290;
    id v11 = v6;
    uint64_t v13 = a3;
    int v14 = a2;
    id v12 = *(id *)(a1 + 48);
    [v7 addExchangeDelegateWithName:v8 emailAddress:v9 toAccountWithID:v11 completion:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __120__CADXPCImplementation_CADSourceOperationGroup__CADSourceAddExchangeDelegateWithName_emailAddress_toSourceWithID_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (!v7 && a3 == -1)
  {
    uint64_t v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v20 = 138543618;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_ERROR, "Error adding Exchange delegate to account %{public}@: %@", (uint8_t *)&v20, 0x16u);
    }
    id v11 = 0;
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = -1;
    uint64_t v14 = 1015;
    goto LABEL_21;
  }
  if (v7)
  {
    uint64_t v15 = CalDatabaseCopyStoreWithUUID();
    if (!v15)
    {
      id v17 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v20 = 138543618;
        uint64_t v21 = v18;
        __int16 v22 = 2114;
        id v23 = v7;
        _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_ERROR, "Error adding Exchange delegate to account %{public}@. The delegate source ID we got (%{public}@) does not exist!", (uint8_t *)&v20, 0x16u);
      }
      id v11 = 0;
      uint64_t v14 = 1015;
      goto LABEL_14;
    }
    uint64_t v16 = (const void *)v15;
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:6 entityID:CalEntityGetID() databaseID:*(unsigned int *)(a1 + 56)];
    CFRelease(v16);
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v14 = 0;
LABEL_14:
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v19 = -1;
  if (!a3) {
    uint64_t v19 = 0;
  }
  if (a3 == 1) {
    uint64_t v19 = 1;
  }
  if (a3 == 2) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v19;
  }
LABEL_21:
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v12 + 16))(v12, v14, v11, v13);
}

- (void)CADSourceRemoveExchangeDelegateWithID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke;
  v9[3] = &unk_1E624F240;
  id v7 = v6;
  id v10 = v7;
  uint64_t v8 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:a3 forAction:1 withBlock:v9];
  if (v8) {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v8);
  }
}

void __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (void *)CalStoreCopyUUID();
  if (v2)
  {
    id v3 = (void *)CalStoreCopyDelegatedAccountOwnerStoreID();
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F5E950] sharedConnection];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke_2;
      v5[3] = &unk_1E624F2E0;
      id v6 = v2;
      id v7 = *(id *)(a1 + 32);
      [v4 removeExchangeDelegateWithSourceID:v6 fromParentAccountWithID:v3 completion:v5];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __93__CADXPCImplementation_CADSourceOperationGroup__CADSourceRemoveExchangeDelegateWithID_reply___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_ERROR, "Failed to remove Exchange delegate with accountID %{public}@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int)_tryPerformBlockWithSourceID:(id)a3 forAction:(unint64_t)a4 entityType:(int)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  int v12 = [(ClientConnection *)self->_conn eventAccessLevel];
  BOOL v13 = [(ClientConnection *)self->_conn reminderAccessGranted];
  int v14 = a5 != 3 || v13;
  BOOL v16 = a5 == 2 && v12 == 0;
  int v17 = 1013;
  if (v14 == 1 && !v16)
  {
    char v18 = !v13;
    if (!v12) {
      char v18 = 1;
    }
    if (a5 || (v18 & 1) == 0)
    {
      int v19 = [(CADXPCImplementation *)self _tryPerformBlockWithSourceID:v10 forAction:a4 withBlock:v11];
      int v17 = v19 & (v19 >> 31);
    }
  }

  return v17;
}

- (void)CADDatabaseGetColorWithProviderIdentifier:(id)a3 externalID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__7;
  __int16 v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  conn = self->_conn;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__CADXPCImplementation_CADColorOperationGroup__CADDatabaseGetColorWithProviderIdentifier_externalID_reply___block_invoke;
  v14[3] = &unk_1E624F310;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  int v17 = &v18;
  [(ClientConnection *)conn withAllDatabasesPerform:v14];
  v10[2](v10, 0, v19[5]);

  _Block_object_dispose(&v18, 8);
}

void __107__CADXPCImplementation_CADColorOperationGroup__CADDatabaseGetColorWithProviderIdentifier_externalID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = CalDatabaseCopyColorWithProviderAndExternalID();
  if (v7)
  {
    id v8 = (const void *)v7;
    *a4 = 1;
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:29 entityID:CalColorGetUID() databaseID:a2];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    CFRelease(v8);
  }
}

- (void)CADInternalForceStatCollection:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  CADStatsCollect();
  v3[2](v3, 0);
}

- (void)CADInternalSetNextConferenceLinkRenewalToNow:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = (void (**)(id, void))a3;
  id v4 = [v3 date];
  +[CADConferenceUtils setNextConferenceLinkRenewalDate:v4];

  v5[2](v5, 0);
}

- (void)CADInternalRemoveConferenceLinkRenewalDate:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  +[CADConferenceUtils removeNextConferenceLinkRenewalDate];
  v3[2](v3, 0);
}

- (void)CADTestingSimulateDaemonCrash
{
}

- (void)CADTestingCloseDatabase:(id)a3
{
  conn = self->_conn;
  id v4 = (void (**)(id, void))a3;
  [(ClientConnection *)conn closeDatabases];
  v4[2](v4, 0);
}

- (void)CADPurgeChangeTrackingReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEBUG, "Purging change log.", buf, 2u);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  conn = self->_conn;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__CADXPCImplementation_CADCalendarToolOperationGroup__CADPurgeChangeTrackingReply___block_invoke;
  v8[3] = &__block_descriptor_40_e346_v28__0i8__CalDatabase____CFRuntimeBase_QAQ_i__CPRecordStore___CalEventOccurrenceCache___CalScheduledTaskCache__v_v____CFDictionary_____CFDictionary__os_unfair_lock_s_I_II____CFArray_____CFString_____CFArray_ii____CFString_____CFURL_____CFString_____CFString_Qiii____opaque_pthread_mutex_t_q_56c__B____CFArray_B____CFSet____i____IIiQBBBBBBB_12_B20l;
  *(CFAbsoluteTime *)&void v8[4] = Current;
  [(ClientConnection *)conn withAllDatabasesPerform:v8];
  v4[2](v4, 0);
}

uint64_t __83__CADXPCImplementation_CADCalendarToolOperationGroup__CADPurgeChangeTrackingReply___block_invoke()
{
  return CalDatabasePurgeIdlePersistentChangeTrackingClients();
}

- (void)CADPostSyntheticRouteHypothesis:(id)a3 forEventWithExternalURL:(id)a4 reply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  uint64_t v10 = +[CADSyntheticRouteHypothesizerCache sharedInstance];
  id v11 = [v10 syntheticRouteHypothesizerForEventExternalURL:v8];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 updateHandler];
    int v14 = CADLogHandle;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = v8;
        _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_DEFAULT, "Posting synthetic route hypothesis for event with external url = %{public}@", (uint8_t *)&v17, 0xCu);
      }
      [v12 setCurrentCADRouteHypothesis:v7];
      v13[2](v13);
      uint64_t v15 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138543618;
        id v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_ERROR, "Could not post synthetic route hypothesis for event with external url because could not get update handler for synthetic route hypothesizer, event external url = %{public}@, synthetic route hypothesizer = %@", (uint8_t *)&v17, 0x16u);
      }
      uint64_t v15 = 1015;
    }
    v9[2](v9, v15);
  }
  else
  {
    id v16 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = v8;
      _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_ERROR, "Could not post synthetic route hypothesis for event with external url because could not get cached synthetic route hypothesizer, event external url = %{public}@", (uint8_t *)&v17, 0xCu);
    }
    v9[2](v9, 1015);
  }
}

- (void)CADDatabaseGetDefaultLocalCalendarWithReply:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__12;
  id v12 = __Block_byref_object_dispose__12;
  id v13 = 0;
  conn = self->_conn;
  uint64_t v6 = *MEMORY[0x1E4F574B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetDefaultLocalCalendarWithReply___block_invoke;
  v7[3] = &unk_1E624DDF0;
  void v7[4] = &v8;
  [(ClientConnection *)conn withDatabaseID:v6 perform:v7];
  v4[2](v4, 0, v9[5]);
  [(ClientConnection *)self->_conn logAccessToObject:v9[5]];
  _Block_object_dispose(&v8, 8);
}

void __92__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetDefaultLocalCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCopyDefaultLocalCalendar();
  if (v2)
  {
    id v3 = (const void *)v2;
    uint64_t v4 = CADEntityCopyObjectID();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    CFRelease(v3);
  }
}

- (void)CADDatabaseSetDefaultCalendarForNewEvents:(id)a3 delegateSource:(id)a4 reply:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  if (v9)
  {
    int v11 = [v8 databaseID];
    if (v11 != [v9 databaseID])
    {
      id v12 = (id)CADLogHandle;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = [v8 databaseID];
        int v14 = [v9 databaseID];
        *(_DWORD *)long long buf = 67109376;
        int v34 = v13;
        __int16 v35 = 1024;
        int v36 = v14;
        _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_ERROR, "Attempted to set a calendar in database %i as the default calendar for a source in database %i", buf, 0xEu);
      }

      *((_DWORD *)v30 + 6) = 1001;
    }
  }
  conn = self->_conn;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __111__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetDefaultCalendarForNewEvents_delegateSource_reply___block_invoke;
  uint64_t v24 = &unk_1E624E0B8;
  id v16 = v8;
  id v25 = v16;
  id v28 = &v29;
  id v17 = v9;
  id v26 = v17;
  uint64_t v27 = self;
  if ([(ClientConnection *)conn withDatabaseForObject:v16 perform:&v21])
  {
    uint64_t v18 = *((unsigned int *)v30 + 6);
  }
  else
  {
    uint64_t v18 = 1010;
    *((_DWORD *)v30 + 6) = 1010;
  }
  v10[2](v10, v18);
  __int16 v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2, v21, v22, v23, v24);
  uint64_t v20 = v19;
  if (v9) {
    [v19 addObject:v17];
  }
  if (v16) {
    [v20 addObject:v16];
  }
  [(ClientConnection *)self->_conn logAccessToObjects:v20];

  _Block_object_dispose(&v29, 8);
}

void __111__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetDefaultCalendarForNewEvents_delegateSource_reply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) entityID];
  uint64_t v2 = CalDatabaseCopyCalendarWithUID();
  if (v2)
  {
    id v3 = (const void *)v2;
    uint64_t v4 = *(void **)(a1 + 40);
    if (v4)
    {
      [v4 entityID];
      uint64_t v5 = CalDatabaseCopyStoreWithUID();
      if (!v5)
      {
        uint64_t v6 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v17 = v7;
          _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_ERROR, "NULL store returned from CalDatabaseCopyStoreWithUID. ObjectID: [%@]", buf, 0xCu);
        }
        id v8 = v3;
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    if ([*(id *)(*(void *)(a1 + 48) + 8) isCalendarRestricted:v3 forAction:1])
    {
      int v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v17 = v12;
        _os_log_impl(&dword_1BBC88000, v11, OS_LOG_TYPE_ERROR, "Calendar restricts unmanaged -> managed write action. ObjectID: [%@]", buf, 0xCu);
      }
    }
    else
    {
      int v13 = NSString;
      int v14 = [*(id *)(*(void *)(a1 + 48) + 8) identity];
      uint64_t v15 = [v13 stringWithFormat:@"EventKit (%@)", v14];
      CalDatabaseSetDefaultCalendarForNewEventsInStore();
    }
    CFRelease(v3);
    if (v5)
    {
      id v8 = (const void *)v5;
LABEL_17:
      CFRelease(v8);
    }
  }
  else
  {
    id v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_ERROR, "NULL calendar returned from CalDatabaseCopyCalendarWithUID. ObjectID: [%@]", buf, 0xCu);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetOrCreateSubscribedCalendarsSource:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  conn = self->_conn;
  int v13 = -1;
  uint64_t v6 = *MEMORY[0x1E4F574B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateSubscribedCalendarsSource___block_invoke;
  v9[3] = &unk_1E624F5A0;
  void v9[4] = &v14;
  void v9[5] = &v10;
  if (![(ClientConnection *)conn withDatabaseID:v6 perform:v9]) {
    *((_DWORD *)v15 + 6) = 1007;
  }
  if (*((_DWORD *)v11 + 6) == -1)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F57428]);
    id v8 = (void *)[v7 initWithEntityType:6 entityID:*((unsigned int *)v11 + 6) databaseID:v6];
  }
  v4[2](v4, *((unsigned int *)v15 + 6), v8);
  [(ClientConnection *)self->_conn logAccessToObject:v8];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateSubscribedCalendarsSource___block_invoke(uint64_t a1)
{
  uint64_t IfNeeded = CalDatabaseCopySubscribedCalendarStoreCreateIfNeeded();
  if (IfNeeded)
  {
    id v3 = (const void *)IfNeeded;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CalEntityGetID();
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_ERROR, "Failed to get subscribed calendars source.", v5, 2u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1015;
  }
}

- (void)CADDatabaseGetOrCreateBirthdayCalendar:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  conn = self->_conn;
  int v13 = -1;
  uint64_t v6 = *MEMORY[0x1E4F574B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateBirthdayCalendar___block_invoke;
  v9[3] = &unk_1E624F5A0;
  void v9[4] = &v10;
  void v9[5] = &v14;
  if (![(ClientConnection *)conn withDatabaseID:v6 perform:v9]) {
    *((_DWORD *)v15 + 6) = 1007;
  }
  if (*((_DWORD *)v11 + 6) == -1)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F57428]);
    id v8 = (void *)[v7 initWithEntityType:1 entityID:*((unsigned int *)v11 + 6) databaseID:v6];
  }
  v4[2](v4, *((unsigned int *)v15 + 6), v8);
  [(ClientConnection *)self->_conn logAccessToObject:v8];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetOrCreateBirthdayCalendar___block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCopyBirthdayCalendar();
  if (v2)
  {
    id v3 = (const void *)v2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CalCalendarGetUID();
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEFAULT, "No birthday calendar; creating one", buf, 2u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CalCalendarInsertBirthdayCalendar();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == -1)
    {
      uint64_t v5 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_ERROR, "Unable to create birthday calendar", v6, 2u);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1015;
    }
  }
}

- (void)CADDatabaseGetBirthdayCalendarEnabledWithReply:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, void, BOOL))a3 + 2))(v4, 0, +[CADBirthdayListener birthdayCalendarEnabled]);
}

- (void)CADDatabaseSetBirthdayCalendarEnabled:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  +[CADBirthdayListener setBirthdayCalendarEnabled:v4];
  v5[2](v5, 0);
}

- (void)CADDatabaseGetBirthdayCalendarVersionWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = -1;
  conn = self->_conn;
  uint64_t v6 = *MEMORY[0x1E4F574B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetBirthdayCalendarVersionWithReply___block_invoke;
  v8[3] = &unk_1E624DDF0;
  void v8[4] = &v9;
  if ([(ClientConnection *)conn withDatabaseID:v6 perform:v8]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 1007;
  }
  v4[2](v4, v7, *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
}

uint64_t __95__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetBirthdayCalendarVersionWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = CalCalendarGetBirthdayCalendarVersion();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)CADDatabaseSetBirthdayCalendarVersion:(int)a3 withReply:(id)a4
{
  conn = self->_conn;
  uint64_t v5 = *MEMORY[0x1E4F574B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetBirthdayCalendarVersion_withReply___block_invoke;
  v8[3] = &__block_descriptor_36_e342_v20__0i8__CalDatabase____CFRuntimeBase_QAQ_i__CPRecordStore___CalEventOccurrenceCache___CalScheduledTaskCache__v_v____CFDictionary_____CFDictionary__os_unfair_lock_s_I_II____CFArray_____CFString_____CFArray_ii____CFString_____CFURL_____CFString_____CFString_Qiii____opaque_pthread_mutex_t_q_56c__B____CFArray_B____CFSet____i____IIiQBBBBBBB_12l;
  int v9 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if ([(ClientConnection *)conn withDatabaseID:v5 perform:v8]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 1007;
  }
  v6[2](v6, v7);
}

uint64_t __96__CADXPCImplementation_CADEventOperationGroup__CADDatabaseSetBirthdayCalendarVersion_withReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F410E258](a3, *(unsigned int *)(a1 + 32));
}

- (void)CADDatabaseGetSuggestedEventCalendarWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  uint64_t v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  uint64_t v5 = [(ClientConnection *)self->_conn permissionValidator];
  if (![v5 canModifySuggestedEventCalendar]
    || !+[CADFeatureSet isSuggestionsEnabled])
  {
    int v9 = v19;
    uint64_t v10 = 1013;
LABEL_6:
    *((_DWORD *)v9 + 6) = v10;
    goto LABEL_7;
  }
  conn = self->_conn;
  uint64_t v7 = *MEMORY[0x1E4F574B8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSuggestedEventCalendarWithReply___block_invoke;
  void v11[3] = &unk_1E624F5A0;
  void v11[4] = &v18;
  void v11[5] = &v12;
  BOOL v8 = [(ClientConnection *)conn withDatabaseID:v7 perform:v11];
  int v9 = v19;
  if (!v8)
  {
    uint64_t v10 = 1007;
    goto LABEL_6;
  }
  uint64_t v10 = *((unsigned int *)v19 + 6);
LABEL_7:
  v4[2](v4, v10, v13[5]);
  [(ClientConnection *)self->_conn logAccessToObject:v13[5]];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

void __94__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSuggestedEventCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCopySuggestionsCalendar();
  if (v2)
  {
    id v3 = (const void *)v2;
    uint64_t v4 = CADEntityCopyObjectID();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1010;
    }
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  uint64_t v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  uint64_t v5 = [(ClientConnection *)self->_conn permissionValidator];
  if (![v5 canModifySuggestedEventCalendar]
    || !+[CADFeatureSet isSuggestionsEnabled])
  {
    int v9 = v19;
    uint64_t v10 = 1013;
LABEL_6:
    *((_DWORD *)v9 + 6) = v10;
    goto LABEL_7;
  }
  conn = self->_conn;
  uint64_t v7 = *MEMORY[0x1E4F574B8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply___block_invoke;
  void v11[3] = &unk_1E624F5A0;
  void v11[4] = &v18;
  void v11[5] = &v12;
  BOOL v8 = [(ClientConnection *)conn withDatabaseID:v7 perform:v11];
  int v9 = v19;
  if (!v8)
  {
    uint64_t v10 = 1007;
    goto LABEL_6;
  }
  uint64_t v10 = *((unsigned int *)v19 + 6);
LABEL_7:
  v4[2](v4, v10, v13[5]);
  [(ClientConnection *)self->_conn logAccessToObject:v13[5]];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

void __109__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  if (v2)
  {
    id v3 = (const void *)v2;
    uint64_t v4 = CADEntityCopyObjectID();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1010;
    }
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseRemoveSuggestedEventCalendarWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  if (![(CADXPCImplementation *)self _CADDatabaseCanModifySuggestedEventCalendar])
  {
    BOOL v8 = v12;
    uint64_t v9 = 1013;
LABEL_6:
    *((_DWORD *)v8 + 6) = v9;
    goto LABEL_7;
  }
  conn = self->_conn;
  uint64_t v6 = *MEMORY[0x1E4F574B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseRemoveSuggestedEventCalendarWithReply___block_invoke;
  v10[3] = &unk_1E624DDF0;
  void v10[4] = &v11;
  BOOL v7 = [(ClientConnection *)conn withDatabaseID:v6 perform:v10];
  BOOL v8 = v12;
  if (!v7)
  {
    uint64_t v9 = 1007;
    goto LABEL_6;
  }
  uint64_t v9 = *((unsigned int *)v12 + 6);
LABEL_7:
  v4[2](v4, v9);
  _Block_object_dispose(&v11, 8);
}

void __97__CADXPCImplementation_CADEventOperationGroup__CADDatabaseRemoveSuggestedEventCalendarWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = CalDatabaseCopySuggestionsCalendar();
  uint64_t v3 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  if (v2 | v3)
  {
    uint64_t v4 = (const void *)v3;
    if (v2)
    {
      CalDatabaseRemoveSuggestionsCalendar();
      CFRelease((CFTypeRef)v2);
    }
    if (v4)
    {
      CalDatabaseRemoveNaturalLanguageSuggestionsCalendar();
      CFRelease(v4);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1012;
  }
}

- (void)CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__12;
  uint64_t v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  conn = self->_conn;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __110__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID_reply___block_invoke;
  v10[3] = &unk_1E624E1D8;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v18;
  uint64_t v13 = &v14;
  [(ClientConnection *)conn withDatabaseForObject:v9 perform:v10];
  v7[2](v7, *((unsigned int *)v15 + 6), v19[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void __110__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1C1865800](a3, [*(id *)(a1 + 32) entityID]);
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t v6 = CalEventCopyCreatorTeamIdentityString();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1008;
  }
}

- (void)CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  BOOL v8 = [(ClientConnection *)self->_conn databaseInitializationOptions];
  id v9 = [v8 remoteClientIdentity];
  uint64_t v10 = [v9 teamIdentifier];

  if (v10
    || ([(ClientConnection *)self->_conn identity],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 teamIdentifier],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10))
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__12;
    id v23 = __Block_byref_object_dispose__12;
    id v24 = 0;
    conn = self->_conn;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __108__CADXPCImplementation_CADEventOperationGroup__CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID_reply___block_invoke;
    uint64_t v16 = &unk_1E624F178;
    id v17 = v6;
    uint64_t v18 = &v19;
    [(ClientConnection *)conn withDatabaseForObject:v17 perform:&v13];
    v7[2](v7, objc_msgSend(v10, "isEqual:", v20[5], v13, v14, v15, v16));

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v7[2](v7, 0);
  }
}

void __108__CADXPCImplementation_CADEventOperationGroup__CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1C1865800](a3, [*(id *)(a1 + 32) entityID]);
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t v6 = CalEventCopyCreatorTeamIdentityString();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    CFRelease(v5);
  }
}

- (void)CADDatabaseGetEventWithEventIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__12;
  id v24 = __Block_byref_object_dispose__12;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if ([(ClientConnection *)self->_conn eventAccessLevel] == 2)
  {
    conn = self->_conn;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithEventIdentifier_reply___block_invoke;
    void v11[3] = &unk_1E624E2C0;
    id v12 = v6;
    uint64_t v13 = self;
    uint64_t v14 = &v16;
    uint64_t v15 = &v20;
    [(ClientConnection *)conn withAllDatabasesPerform:v11];
  }
  if (v21[5]) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = 1010;
  }
  if (*((unsigned char *)v17 + 24)) {
    uint64_t v10 = 1013;
  }
  else {
    uint64_t v10 = v9;
  }
  v7[2](v7, v10);
  [(ClientConnection *)self->_conn logAccessToObject:v21[5]];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

void __93__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithEventIdentifier_reply___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = CalDatabaseCopyEventWithPublicID();
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    if ([*(id *)(a1[5] + 8) isCalendarItemRestricted:v6 forAction:0])
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      uint64_t v8 = CADEntityCopyObjectID();
      uint64_t v9 = *(void *)(a1[7] + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
      *a4 = 1;
    }
    CFRelease(v7);
  }
}

- (void)CADDatabaseGetEventWithUniqueID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__12;
  id v25 = __Block_byref_object_dispose__12;
  id v26 = 0;
  conn = self->_conn;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithUniqueID_reply___block_invoke;
  uint64_t v16 = &unk_1E624E2C0;
  id v9 = v6;
  id v17 = v9;
  uint64_t v18 = self;
  char v19 = &v27;
  uint64_t v20 = &v21;
  [(ClientConnection *)conn withAllDatabasesPerform:&v13];
  uint64_t v10 = v22;
  uint64_t v11 = v22[5];
  if (v11)
  {
    uint64_t v12 = *((unsigned int *)v28 + 6);
  }
  else
  {
    uint64_t v12 = 1010;
    *((_DWORD *)v28 + 6) = 1010;
    uint64_t v11 = v10[5];
  }
  v7[2](v7, v12, v11);
  -[ClientConnection logAccessToObject:](self->_conn, "logAccessToObject:", v22[5], v13, v14, v15, v16);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetEventWithUniqueID_reply___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = CalDatabaseCopyEventWithUniqueIdentifierInStore();
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    if ([*(id *)(a1[5] + 8) isCalendarItemRestricted:v6 forAction:0])
    {
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 1013;
    }
    else
    {
      uint64_t v8 = CADEntityCopyObjectID();
      uint64_t v9 = *(void *)(a1[7] + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
        *a4 = 1;
      }
    }
    CFRelease(v7);
  }
}

- (void)CADDatabaseGetAllEventsWithUniqueID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  uint64_t v8 = objc_opt_new();
  conn = self->_conn;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __90__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAllEventsWithUniqueID_reply___block_invoke;
  uint64_t v15 = &unk_1E624F5E8;
  id v10 = v6;
  char v19 = &v20;
  id v16 = v10;
  id v17 = self;
  id v11 = v8;
  id v18 = v11;
  [(ClientConnection *)conn withAllDatabasesPerform:&v12];
  v7[2](v7, *((unsigned int *)v21 + 6), v11);
  -[ClientConnection logAccessToObjects:](self->_conn, "logAccessToObjects:", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
}

void __90__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAllEventsWithUniqueID_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)CalDatabaseCopyAllEventsWithUniqueIdentifierInStore();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        if (ValueAtIndex
          && ([*(id *)(*(void *)(a1 + 40) + 8) isCalendarItemRestricted:ValueAtIndex forAction:0] & 1) == 0)
        {
          uint64_t v8 = CADEntityCopyObjectID();
          if (v8) {
            [*(id *)(a1 + 48) addObject:v8];
          }
        }
      }
    }
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1007;
  }
}

- (void)CADDatabaseCanModifySuggestedEventCalendar:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, void, BOOL))a3 + 2))(v5, 0, [(CADXPCImplementation *)self _CADDatabaseCanModifySuggestedEventCalendar]);
}

- (void)CADDatabaseGetSourceIdentifierForEventWithObjectID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__12;
  int v23 = __Block_byref_object_dispose__12;
  id v24 = 0;
  if ([v6 isTemporary])
  {
    uint64_t v8 = +[CADOperationGroupUtil defaultCalendarForNewEventsInDelegateSource:0 withConnection:self->_conn limitedAccess:0];
    conn = self->_conn;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke;
    v16[3] = &unk_1E624F178;
    id v10 = v8;
    id v17 = v10;
    id v18 = &v19;
    LOBYTE(conn) = [(ClientConnection *)conn withDatabaseForObject:v10 perform:v16];

    if ((conn & 1) == 0)
    {
LABEL_3:
      uint64_t v11 = 1010;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v12 = self->_conn;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    _DWORD v13[2] = __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke_2;
    v13[3] = &unk_1E624F178;
    id v14 = v6;
    uint64_t v15 = &v19;
    LODWORD(v12) = [(ClientConnection *)v12 withDatabaseForObject:v14 perform:v13];

    if (!v12) {
      goto LABEL_3;
    }
  }
  if (v20[5]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 1010;
  }
LABEL_8:
  v7[2](v7, v11, v20[5]);
  _Block_object_dispose(&v19, 8);
}

void __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = CalCalendarCopyStore();
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      uint64_t v8 = CalStoreCopyUUID();
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      CFRelease(v7);
    }
    CFRelease(v5);
  }
}

void __105__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetSourceIdentifierForEventWithObjectID_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = CalCalendarItemCopyCalendar();
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      uint64_t v8 = CalCalendarCopyStore();
      if (v8)
      {
        uint64_t v9 = (const void *)v8;
        uint64_t v10 = CalStoreCopyUUID();
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        CFRelease(v9);
      }
      CFRelease(v7);
    }
    CFRelease(v5);
  }
}

- (void)CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID:(id)a3 nearestDate:(id)a4 prefersForwardSearch:(BOOL)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __142__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID_nearestDate_prefersForwardSearch_reply___block_invoke;
  v17[3] = &unk_1E624F670;
  BOOL v22 = a5;
  id v18 = v11;
  id v19 = v10;
  uint64_t v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  [(ClientConnection *)conn withDatabaseForObject:v15 perform:v17];
}

void __142__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID_nearestDate_prefersForwardSearch_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  CFArrayRef v3 = (const void *)CalFilterCreateWithDatabaseShowingAll();
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  int v4 = *(unsigned __int8 *)(a1 + 64);
  [*(id *)(a1 + 40) entityID];
  if (v4) {
    uint64_t v5 = CalDatabaseCopyEventOccurrenceNearestToDatePreferringForwardSearch();
  }
  else {
    uint64_t v5 = CalDatabaseCopyEventOccurrenceNearestToDate();
  }
  uint64_t v6 = (const void *)v5;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    CalEventOccurrenceGetDate();
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v6);
    id v8 = v9;
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (v3) {
    CFRelease(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
  [*(id *)(*(void *)(a1 + 48) + 8) logAccessToObject:*(void *)(a1 + 40)];
}

- (void)CADOccurrenceCacheGetOccurrenceCountWithStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  conn = self->_conn;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountWithStartDate_endDate_reply___block_invoke;
  v14[3] = &unk_1E624F310;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  id v17 = &v18;
  [(ClientConnection *)conn withAllDatabasesPerform:v14];
  (*((void (**)(id, void, void))v10 + 2))(v10, 0, *((unsigned int *)v19 + 6));

  _Block_object_dispose(&v18, 8);
}

void __112__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheGetOccurrenceCountWithStartDate_endDate_reply___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += CalEventOccurrenceCacheCount();
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)CADOccurrenceCacheDoEvents:(id)a3 haveOccurrencesAfterDate:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v26 = a4;
  id v28 = (void (**)(id, uint64_t, id))a5;
  uint64_t v8 = [v7 count];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  if (v8)
  {
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    uint64_t v11 = v8;
    do
    {
      objc_msgSend(v9, "addObject:", v10, v26);
      --v11;
    }
    while (v11);
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", v16 + i, v26);
        [v12 setObject:v20 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      v16 += i;
    }
    while (v15);
  }

  conn = self->_conn;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __106__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply___block_invoke;
  v29[3] = &unk_1E624DBB0;
  id v30 = v26;
  id v31 = v12;
  id v22 = v9;
  id v32 = v22;
  id v23 = v12;
  id v24 = v26;
  if ([(ClientConnection *)conn withDatabaseForObjects:v13 perform:v29])
  {
    uint64_t v25 = 0;
  }
  else
  {

    id v22 = 0;
    uint64_t v25 = 1010;
  }
  v28[2](v28, v25, v22);
  [(ClientConnection *)self->_conn logAccessToObjects:v13];
}

void __106__CADXPCImplementation_CADEventOperationGroup__CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CalDatabaseCopyEventOccurrenceCache();
  uint64_t v6 = CalFilterCreateWithDatabaseShowingAll();
  [a1[4] timeIntervalSinceReferenceDate];
  [v4 valueForKey:@"entityID"];
  CFTypeRef cf = (CFTypeRef)v6;
  uint64_t v17 = v19 = (CFTypeRef)v5;
  HaveOccurrencesAfterDate = (void *)CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = [a1[5] objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
        uint64_t v15 = [v14 unsignedIntegerValue];

        uint64_t v16 = [HaveOccurrencesAfterDate objectAtIndexedSubscript:v11 + v13];
        [a1[6] setObject:v16 atIndexedSubscript:v15];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v11 += v13;
    }
    while (v10);
  }

  CFRelease(cf);
  CFRelease(v19);
}

- (void)CADOccurrenceCacheSearchWithTerm:(id)a3 inCalendars:(id)a4 responseToken:(int)a5 reply:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v12 = (void (**)(id, uint64_t))a6;
  uint64_t v10 = +[CADCalSearchOperation operationWithConnection:self->_conn searchTerm:a3 calendars:a4 replyID:v6];
  if (v10)
  {
    [(ClientConnection *)self->_conn addOperation:v10];
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1001;
  }
  v12[2](v12, v11);
}

- (void)CADOccurrenceCacheSearchLocationsWithTerm:(id)a3 inCalendars:(id)a4 responseToken:(int)a5 reply:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v12 = (void (**)(id, uint64_t))a6;
  uint64_t v10 = +[CADCalSearchOperation operationWithConnection:self->_conn searchTerm:a3 calendars:a4 replyID:v6];
  if (v10)
  {
    [(ClientConnection *)self->_conn addOperation:v10];
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1001;
  }
  v12[2](v12, v11);
}

- (void)CADOccurrenceCacheCancelSearchWithReplyID:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(ClientConnection *)self->_conn operations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 replyID] == a3)
        {
          [v9 cancel];
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)CADOccurrencesExistInRangeForEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6 timezone:(id)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = (void (**)(id, uint64_t, void))a8;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  conn = self->_conn;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __136__CADXPCImplementation_CADEventOperationGroup__CADOccurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone_reply___block_invoke;
  v25[3] = &unk_1E624F698;
  id v19 = v16;
  id v26 = v19;
  id v20 = v14;
  id v27 = v20;
  id v21 = v15;
  id v28 = v21;
  id v22 = v13;
  id v29 = v22;
  id v30 = &v37;
  id v31 = &v33;
  BOOL v32 = a6;
  if ([(ClientConnection *)conn withDatabaseForObject:v22 perform:v25])
  {
    uint64_t v23 = *((unsigned int *)v38 + 6);
  }
  else
  {
    uint64_t v23 = 1010;
    *((_DWORD *)v38 + 6) = 1010;
  }
  v17[2](v17, v23, *((unsigned __int8 *)v34 + 24));
  [(ClientConnection *)self->_conn logAccessToObject:v22];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __136__CADXPCImplementation_CADEventOperationGroup__CADOccurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
  [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
  CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
  uint64_t v5 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 56));
  if (v5)
  {
    uint64_t v6 = v5;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CalEventOccurrencesExistForEventInDateRange() != 0;
    CFRelease(v6);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseShouldPermitOrganizerEmailFromJunkChecks:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  conn = self->_conn;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerEmailFromJunkChecks_reply___block_invoke;
  v9[3] = &unk_1E624F6C0;
  void v9[4] = &v10;
  void v9[5] = v6;
  [(ClientConnection *)conn withAllDatabasesPerform:v9];
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
}

uint64_t __106__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerEmailFromJunkChecks_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = CalHasCurrentUserInvitedAttendeeWithEmail();
  if ((result & 1) != 0
    || (uint64_t result = CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithEmail(), (result & 1) != 0)
    || (uint64_t result = CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithEmail(), result))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  conn = self->_conn;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks_reply___block_invoke;
  v9[3] = &unk_1E624F6C0;
  void v9[4] = &v10;
  void v9[5] = v6;
  [(ClientConnection *)conn withAllDatabasesPerform:v9];
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
}

uint64_t __112__CADXPCImplementation_CADEventOperationGroup__CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = CalHasCurrentUserInvitedAttendeeWithPhoneNumber();
  if ((result & 1) != 0
    || (uint64_t result = CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithPhoneNumber(), (result & 1) != 0)
    || (uint64_t result = CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithPhoneNumber(), result))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)CADDatabaseGetAttachmentWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__12;
  id v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  if (v6)
  {
    if ([(ClientConnection *)self->_conn eventAccessLevel])
    {
      conn = self->_conn;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAttachmentWithUUID_reply___block_invoke;
      v10[3] = &unk_1E624E2C0;
      id v11 = v6;
      uint64_t v12 = self;
      char v13 = &v21;
      id v14 = &v15;
      [(ClientConnection *)conn withAllDatabasesPerform:v10];
      if (!v16[5]) {
        *((_DWORD *)v22 + 6) = 1010;
      }

      uint64_t v9 = *((unsigned int *)v22 + 6);
    }
    else
    {
      uint64_t v9 = 1013;
      *((_DWORD *)v22 + 6) = 1013;
    }
  }
  else
  {
    uint64_t v9 = 1001;
    int v24 = 1001;
  }
  v7[2](v7, v9, v16[5]);
  [(ClientConnection *)self->_conn logAccessToObject:v16[5]];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __87__CADXPCImplementation_CADEventOperationGroup__CADDatabaseGetAttachmentWithUUID_reply___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (const void *)CalDatabaseCopyAttachmentWithUUID();
  if (v6)
  {
    id v7 = v6;
    *a4 = 1;
    if (CADEntityIsInRestrictedStore(*(void **)(a1[5] + 8), v6, 0))
    {
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 1013;
    }
    else
    {
      uint64_t v8 = CADEntityCopyObjectID();
      uint64_t v9 = *(void *)(a1[7] + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    CFRelease(v7);
  }
}

- (void)CADDatabaseLoadEventsInCalendar:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  int v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__12;
  id v26 = __Block_byref_object_dispose__12;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__12;
  id v20 = __Block_byref_object_dispose__12;
  id v21 = 0;
  conn = self->_conn;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseLoadEventsInCalendar_reply___block_invoke;
  void v11[3] = &unk_1E624F6E8;
  id v9 = v6;
  id v12 = v9;
  char v13 = &v28;
  id v14 = &v16;
  uint64_t v15 = &v22;
  if ([(ClientConnection *)conn withDatabaseForObject:v9 perform:v11])
  {
    uint64_t v10 = *((unsigned int *)v29 + 6);
  }
  else
  {
    uint64_t v10 = 1010;
    *((_DWORD *)v29 + 6) = 1010;
  }
  v7[2](v7, v10, v23[5], v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __86__CADXPCImplementation_CADEventOperationGroup__CADDatabaseLoadEventsInCalendar_reply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) entityID];
  uint64_t v2 = CalDatabaseCopyCalendarWithUID();
  if (v2)
  {
    CFArrayRef v3 = (const void *)v2;
    CalEventCopyRowIDsAndUniqueIdentifiersInCalendar();
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1015;
    CFRelease(v3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1010;
  }
}

- (void)CADDatabaseGetTTLLocationAuthorizationStatus:(id)a3
{
  CFArrayRef v3 = (void *)MEMORY[0x1E4F57748];
  uint64_t v5 = (void (**)(id, void, uint64_t))a3;
  uint64_t v4 = [v3 ttlLocationStatus];
  +[CADXPCImplementation monitorLocationAuthorizationStatusChanges:v4];
  v5[2](v5, 0, v4);
}

+ (void)monitorLocationAuthorizationStatusChanges:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__CADXPCImplementation_CADEventOperationGroup__monitorLocationAuthorizationStatusChanges___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (monitorLocationAuthorizationStatusChanges__onceToken != -1) {
    dispatch_once(&monitorLocationAuthorizationStatusChanges__onceToken, block);
  }
}

void __90__CADXPCImplementation_CADEventOperationGroup__monitorLocationAuthorizationStatusChanges___block_invoke(uint64_t a1)
{
  monitorLocationAuthorizationStatusChanges__lastStatus = *(void *)(a1 + 32);
  uint64_t v1 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BBC88000, v1, OS_LOG_TYPE_INFO, "Listening for changes in location authorization status", v5, 2u);
  }
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = [v2 addObserverForName:*MEMORY[0x1E4F57618] object:0 queue:0 usingBlock:&__block_literal_global_44];
  uint64_t v4 = (void *)monitorLocationAuthorizationStatusChanges__receipt;
  monitorLocationAuthorizationStatusChanges__receipt = v3;
}

void __90__CADXPCImplementation_CADEventOperationGroup__monitorLocationAuthorizationStatusChanges___block_invoke_41()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F57748] ttlLocationStatus];
  if (v0 != monitorLocationAuthorizationStatusChanges__lastStatus)
  {
    uint64_t v1 = v0;
    uint64_t v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      int v4 = 134218240;
      uint64_t v5 = monitorLocationAuthorizationStatusChanges__lastStatus;
      __int16 v6 = 2048;
      uint64_t v7 = v1;
      _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_INFO, "Location authorization status changed from %lu to %lu", (uint8_t *)&v4, 0x16u);
    }
    monitorLocationAuthorizationStatusChanges__lastStatus = v1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CADTTLLocationAuthorizationStatusChangedNotification", 0, 0, 1u);
  }
}

@end