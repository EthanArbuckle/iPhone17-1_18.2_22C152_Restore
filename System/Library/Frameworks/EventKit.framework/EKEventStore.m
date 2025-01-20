@interface EKEventStore
+ (BOOL)_isConfirmedSuggestedEvent:(id)a3 uniqueKey:(id *)a4;
+ (BOOL)_shouldRefreshSource:(id)a3;
+ (BOOL)_shouldUseInProcessXPCWithInitOptions:(unint64_t)a3;
+ (BOOL)_staticAccessFlagSaysDeniedForEntityType:(unint64_t)a3;
+ (BOOL)shouldUseInProcessXPCByDefault;
+ (Class)classForEntityName:(id)a3;
+ (EKAuthorizationStatus)authorizationStatusForEntityType:(EKEntityType)entityType;
+ (NSString)eventStoreChangedDistributedNotificationName;
+ (double)_defaultDelayForThrottledNotificationsWithInitializationOptions:(id)a3;
+ (double)_throttleDelayForEventStoreChangedNotificationWithLastFiredTime:(unint64_t)a3 delay:(double)a4;
+ (id)_contextForNotificationWithChangeType:(unint64_t)a3 changedObjectIDs:(id)a4;
+ (id)_filteredArrayWithIdentifiers:(id)a3 fromObjects:(id)a4 excludingObjects:(id)a5;
+ (id)_filteredObjectsWithIdentifiers:(id)a3 fromObjects:(id)a4 excludingObjects:(id)a5;
+ (id)_iMIPScheduledEvent:(id)a3;
+ (id)calendarObjectIDsForPredicate:(id)a3;
+ (id)eventDraftsPath;
+ (id)reminderStoreContainerTokenProvider;
+ (int)calDatabaseInitOptionsFromEKEventStoreInitOptions:(unint64_t)a3;
+ (int64_t)authorizationStatusWithAuditToken:(id *)a3 entityType:(unint64_t)a4;
+ (int64_t)realAuthorizationStatusForEntityType:(unint64_t)a3;
+ (unint64_t)ekEventStoreInitOptionsFromCalDatabaseInitOptions:(int)a3;
+ (unint64_t)predicatePropertyLoadMode;
+ (void)EKObjectIDsFromData:(id)a3 deletedObjectIDOffsets:(id)a4 outChangedIDs:(id *)a5 outDeletedIDs:(id *)a6;
+ (void)_addDaysSpannedByEvent:(id)a3 toCountedSet:(id)a4 inRange:(id)a5 withNSCalendar:(id)a6;
+ (void)_refreshFolderListForSource:(id)a3 isUserRequested:(BOOL)a4;
+ (void)setDenyAccessToEvents:(BOOL)a3;
+ (void)setDenyAccessToReminders:(BOOL)a3;
+ (void)setPredicatePropertyLoadMode:(unint64_t)a3;
+ (void)setReminderStoreContainerTokenProvider:(id)a3;
- (BOOL)_calendar:(id)a3 supportsEntityType:(unint64_t)a4;
- (BOOL)_commit:(id *)a3;
- (BOOL)_commitObjectsWithIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)_isRegisteredObject:(id)a3;
- (BOOL)_isUnitTesting;
- (BOOL)_parseURI:(id)a3 expectedScheme:(id)a4 identifier:(id *)a5 options:(id *)a6;
- (BOOL)_refreshDASource:(id)a3 isUserRequested:(BOOL)a4;
- (BOOL)_removeCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)_removeEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6;
- (BOOL)_removeEventCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)_removeReminder:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)_saveCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)_saveCalendar:(id)a3 error:(id *)a4;
- (BOOL)_saveDraftOfEvent:(id)a3 toDirectory:(id)a4;
- (BOOL)_saveDraftOfEvent:(id)a3 toDirectory:(id)a4 withVersion:(id)a5;
- (BOOL)_saveEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6;
- (BOOL)_saveReminder:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)accessGrantedForEntityType:(unint64_t)a3;
- (BOOL)acknowledgeNotifications:(id)a3 error:(id *)a4;
- (BOOL)allowAccessToEventsOnly;
- (BOOL)allowDelegateSources;
- (BOOL)allowsBirthdayModifications;
- (BOOL)allowsIntegrationModifications;
- (BOOL)automaticLocationGeocodingAllowed;
- (BOOL)backupDatabaseToDestination:(id)a3 withFormat:(unint64_t)a4 error:(id *)a5;
- (BOOL)birthdayCalendarEnabled;
- (BOOL)canModifyCalendarDatabase;
- (BOOL)canModifySuggestedEventCalendar;
- (BOOL)clientCanModifySources;
- (BOOL)commit:(NSError *)error;
- (BOOL)commitObjects:(id)a3 error:(id *)a4;
- (BOOL)commitWithRollback:(id *)a3;
- (BOOL)commitWithRollbackForNewClients:(id *)a3;
- (BOOL)consumeAllChangesUpToToken:(id)a3 except:(id)a4 error:(id *)a5;
- (BOOL)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4 error:(id *)a5;
- (BOOL)enableSourceSyncStatusChanges;
- (BOOL)eventWithUUID:(id)a3 isInCalendars:(id)a4;
- (BOOL)eventsExistOnCalendar:(id)a3;
- (BOOL)eventsMarkedScheduleAgentClientExistOnCalendar:(id)a3;
- (BOOL)futureScheduledEventsExistOnCalendar:(id)a3;
- (BOOL)hasImmediatelyEligibleTravelEvents;
- (BOOL)hideCalendarsFromNotificationCenter:(id)a3 error:(id *)a4;
- (BOOL)ignoreExternalChanges;
- (BOOL)inboxRepliedSectionHasContent;
- (BOOL)isCurrentProcessCreatorOfEvent:(id)a3;
- (BOOL)isDataProtected;
- (BOOL)isObjectInserted:(id)a3;
- (BOOL)isPendingIntegrationEvent:(id)a3;
- (BOOL)isSourceManaged:(id)a3;
- (BOOL)markIndividualChangesConsumed:(id)a3 error:(id *)a4;
- (BOOL)markResourceChangeAlertedAndSave:(id)a3 error:(id *)a4;
- (BOOL)needsGeocodingForEvent:(id)a3;
- (BOOL)objectWithIDExists:(id)a3;
- (BOOL)objectsHaveChangesToCommit:(id)a3;
- (BOOL)occurrencesExistInRangeForEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6 timezone:(id)a7;
- (BOOL)removeCalendar:(EKCalendar *)calendar commit:(BOOL)commit error:(NSError *)error;
- (BOOL)removeCalendar:(id)a3 error:(id *)a4;
- (BOOL)removeEvent:(EKEvent *)event span:(EKSpan)span commit:(BOOL)commit error:(NSError *)error;
- (BOOL)removeEvent:(EKEvent *)event span:(EKSpan)span error:(NSError *)error;
- (BOOL)removeInviteReplyNotification:(id)a3 error:(id *)a4;
- (BOOL)removeInviteReplyNotifications:(id)a3 error:(id *)a4;
- (BOOL)removeReminder:(EKReminder *)reminder commit:(BOOL)commit error:(NSError *)error;
- (BOOL)removeReminder:(id)a3 error:(id *)a4;
- (BOOL)removeResourceChange:(id)a3 error:(id *)a4;
- (BOOL)removeResourceChanges:(id)a3 error:(id *)a4;
- (BOOL)removeResourceChangesForCalendarItem:(id)a3 error:(id *)a4;
- (BOOL)removeSource:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)restoreDatabaseFromBackup:(id)a3 withFormat:(unint64_t)a4 error:(id *)a5;
- (BOOL)restoreGenerationChanged;
- (BOOL)returnEventResults;
- (BOOL)returnReminderResults;
- (BOOL)save:(id *)a3;
- (BOOL)saveAttachment:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)saveCalendar:(EKCalendar *)calendar commit:(BOOL)commit error:(NSError *)error;
- (BOOL)saveCalendar:(id)a3 error:(id *)a4;
- (BOOL)saveColor:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)saveDraftOfEvent:(id)a3;
- (BOOL)saveEvent:(EKEvent *)event span:(EKSpan)span commit:(BOOL)commit error:(NSError *)error;
- (BOOL)saveEvent:(EKEvent *)event span:(EKSpan)span error:(NSError *)error;
- (BOOL)saveNotification:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)saveNotificationCollection:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)saveReminder:(EKReminder *)reminder commit:(BOOL)commit error:(NSError *)error;
- (BOOL)saveReminder:(id)a3 error:(id *)a4;
- (BOOL)saveSource:(id)a3 commit:(BOOL)a4 error:(id *)a5;
- (BOOL)setInvitationStatus:(unint64_t)a3 forEvent:(id)a4 error:(id *)a5;
- (BOOL)setInvitationStatus:(unint64_t)a3 forEvents:(id)a4 error:(id *)a5;
- (BOOL)setRestoreGenerationChangedAndGetPreviousValue:(BOOL)a3;
- (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3;
- (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3;
- (BOOL)shouldRecordObjectIDMap;
- (BOOL)shouldSaveCalendarAsEventCalendar:(id)a3;
- (BOOL)shouldSaveCalendarAsReminderCalendar:(id)a3;
- (BOOL)showCompletedReminders;
- (BOOL)showDeclinedEvents;
- (BOOL)showsIntegrations;
- (BOOL)skipModificationValidation;
- (BOOL)unregisterForDetailedChangeTracking:(id *)a3;
- (CADInMemoryChangeTimestamp)lastDatabaseNotificationTimestamp;
- (CGColor)copyCGColorForNewCalendar;
- (Class)_SGSuggestionsServiceClass;
- (EKAlarm)defaultAllDayAlarm;
- (EKAlarm)defaultTimedAlarm;
- (EKCalendar)calendarWithIdentifier:(NSString *)identifier;
- (EKCalendar)defaultCalendarForNewEvents;
- (EKCalendar)defaultCalendarForNewReminders;
- (EKCalendar)naturalLanguageSuggestedEventCalendar;
- (EKCalendar)suggestedEventCalendar;
- (EKCalendarItem)calendarItemWithIdentifier:(NSString *)identifier;
- (EKDaemonConnection)connection;
- (EKDaemonConnection)database;
- (EKDataProtectionObserver)dataProtectionObserver;
- (EKEmailSender)emailSender;
- (EKEvent)eventWithIdentifier:(NSString *)identifier;
- (EKEventStore)initWithBirthdayCalendarModifications;
- (EKEventStore)initWithEKOptions:(unint64_t)a3;
- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7;
- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7 allowedSourceIdentifiers:(id)a8;
- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 containerProvider:(id)a5 changeTrackingClientId:(id)a6 enablePropertyModificationLogging:(BOOL)a7 allowDelegateSources:(BOOL)a8 allowedSourceIdentifiers:(id)a9;
- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 containerProvider:(id)a5 tccPermissionChecker:(id)a6 changeTrackingClientId:(id)a7 enablePropertyModificationLogging:(BOOL)a8 allowDelegateSources:(BOOL)a9 allowedSourceIdentifiers:(id)a10;
- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 sources:(id)a5;
- (EKEventStore)initWithOptions:(int)a3 path:(id)a4;
- (EKEventStore)initWithOptions:(int)a3 path:(id)a4 allowDelegateSources:(BOOL)a5;
- (EKEventStore)initWithOptions:(int)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7;
- (EKEventStore)initWithSources:(NSArray *)sources;
- (EKImageCache)imageCache;
- (EKReminderStore)reminderStore;
- (EKSource)sourceWithIdentifier:(NSString *)identifier;
- (EKSourceConstraints)_cachedDefaultConstraints;
- (NSArray)calendarItemsWithExternalIdentifier:(NSString *)externalIdentifier;
- (NSArray)calendars;
- (NSArray)calendarsForEntityType:(EKEntityType)entityType;
- (NSArray)delegateSources;
- (NSArray)eventNotifications;
- (NSArray)eventsMatchingPredicate:(NSPredicate *)predicate;
- (NSArray)inboxRepliedSectionItems;
- (NSArray)objectsPendingCommit;
- (NSDictionary)eventSourceIDToReminderSourceIDMapping;
- (NSDictionary)reminderSourceIDToEventSourceIDMapping;
- (NSHashTable)insertedObjects;
- (NSMutableDictionary)_cachedConstraints;
- (NSMutableDictionary)_cachedNotificationCollections;
- (NSMutableDictionary)registeredObjects;
- (NSMutableSet)deletedObjects;
- (NSMutableSet)objectsPendingSave;
- (NSMutableSet)uncommittableObjects;
- (NSMutableSet)updatedObjects;
- (NSNumber)defaultAllDayAlarmOffset;
- (NSNumber)defaultTimedAlarmOffset;
- (NSNumber)siriSuggestionsAllDayAlarmOffset;
- (NSNumber)siriSuggestionsTimedAlarmOffset;
- (NSPredicate)predicateForCompletedRemindersWithCompletionDateStarting:(NSDate *)startDate ending:(NSDate *)endDate calendars:(NSArray *)calendars;
- (NSPredicate)predicateForEventsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate calendars:(NSArray *)calendars;
- (NSPredicate)predicateForIncompleteRemindersWithDueDateStarting:(NSDate *)startDate ending:(NSDate *)endDate calendars:(NSArray *)calendars;
- (NSPredicate)predicateForRemindersInCalendars:(NSArray *)calendars;
- (NSSet)deletedObjectIDsPendingCommit;
- (NSString)databasePath;
- (NSString)eventStoreIdentifier;
- (NSTimeZone)timeZone;
- (OS_dispatch_queue)calendarSourcesAndDefaultsQueue;
- (OS_dispatch_queue)constraintsCacheQueue;
- (OS_dispatch_queue)dbChangedQueue;
- (OS_dispatch_queue)notificationCollectionCacheQueue;
- (OS_dispatch_queue)registeredQueue;
- (OS_dispatch_queue)unsavedChangesQueue;
- (double)_throttleDelayForEventStoreChangedNotificationWithTags:(id)a3 context:(id)a4;
- (id)ICSDataForCalendarItems:(id)a3 options:(unint64_t)a4;
- (id)ICSDataForCalendarItems:(id)a3 preventLineFolding:(BOOL)a4;
- (id)_addFetchedObjectWithID:(id)a3;
- (id)_allCalendars;
- (id)_apiExpectedEventForEvent:(id)a3;
- (id)_apiExpectedEventsForEvents:(id)a3;
- (id)_calendarItemsMatchingPredicate:(id)a3;
- (id)_calendarItemsWithExternalIdentifier:(id)a3 inCalendars:(id)a4 entityTypes:(unint64_t)a5;
- (id)_checkPendingIntegrationEvents:(id)a3 changedIDsValid:(BOOL)a4;
- (id)_combineEventSources:(id)a3 withReminderSources:(id)a4;
- (id)_deletableCalendars;
- (id)_deletableSources;
- (id)_draftPathForEventWithOccurrenceID:(id)a3 draftDirectory:(id)a4;
- (id)_entityWrappersForEventUUIDs:(id)a3 inCalendars:(id)a4 propertiesToLoad:(id)a5;
- (id)_eventCalendarWithIdentifier:(id)a3;
- (id)_eventOccurrenceWithURI:(id)a3;
- (id)_eventWithEventIdentifier:(id)a3;
- (id)_eventWithURI:(id)a3 checkValid:(BOOL)a4;
- (id)_fetchConstraintsForObjectWithCADObjectID:(id)a3;
- (id)_fetchPersistentNotificationCollectionForSourceWithCADObjectID:(id)a3;
- (id)_imageCache;
- (id)_importEventsWithExternalIDs:(id)a3 fromICSData:(id)a4 intoCalendarsWithIDs:(id)a5 options:(unint64_t)a6 batchSize:(int)a7;
- (id)_invalidCADObjectIDs:(id)a3;
- (id)_loadDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4;
- (id)_loadDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4 withVersion:(id)a5;
- (id)_localSourceWithEnableIfNeeded:(BOOL)a3;
- (id)_markObjectsWithIdentifiersAsCommitted:(id)a3 excludingObjects:(id)a4;
- (id)_nextEventsWithFetchBlock:(id)a3 steps:(id)a4 limit:(unint64_t)a5;
- (id)_sourceWithID:(id)a3;
- (id)alarmOccurrencesFromAlarmCache;
- (id)alarmWithExternalID:(id)a3;
- (id)alarmWithUUID:(id)a3;
- (id)allEventsWithUniqueId:(id)a3 occurrenceDate:(id)a4;
- (id)attachmentWithUUID:(id)a3;
- (id)beginCalDAVServerSimulationWithHostname:(id)a3;
- (id)cachedConstraintsForCalendar:(id)a3;
- (id)cachedConstraintsForEvent:(id)a3;
- (id)cachedConstraintsForEventOrSourceWithCADObjectID:(id)a3;
- (id)cachedConstraintsForReminder:(id)a3;
- (id)cachedConstraintsForSource:(id)a3;
- (id)calendarItemsWithExternalIdentifier:(id)a3 inCalendars:(id)a4;
- (id)calendarItemsWithUniqueIdentifier:(id)a3 inCalendar:(id)a4;
- (id)calendarWithCADID:(id)a3;
- (id)calendarWithExternalID:(id)a3;
- (id)calendarWithExternalURI:(id)a3;
- (id)calendarWithID:(id)a3;
- (id)calendarWithUniqueID:(id)a3;
- (id)calendarsForEntityType:(unint64_t)a3 inSource:(id)a4;
- (id)calendarsWithIdentifiers:(id)a3;
- (id)calendarsWithObjectIDs:(id)a3;
- (id)closestCachedOccurrenceToDate:(double)a3 forEventObjectID:(id)a4;
- (id)closestCachedOccurrenceToDate:(double)a3 forEventObjectID:(id)a4 prefersForwardSearch:(BOOL)a5;
- (id)colorStringForNewCalendar;
- (id)colorWithProviderIdentifier:(id)a3 externalIdentifier:(id)a4;
- (id)combineEventCalendars:(id)a3 withReminderCalendars:(id)a4;
- (id)combinedReminderAndEventSources;
- (id)creatorTeamIdentifierForEvent:(id)a3;
- (id)dbStatsBySource;
- (id)defaultCalendarForNewEventsInDelegateSource:(id)a3;
- (id)defaultLocalCalendar;
- (id)delegateSourcesForSource:(id)a3;
- (id)deletedObjectIDs;
- (id)doEvents:(id)a3 haveOccurrencesAfterDate:(id)a4;
- (id)eventForObjectID:(id)a3 occurrenceDate:(id)a4;
- (id)eventForObjectID:(id)a3 occurrenceDate:(id)a4 checkValid:(BOOL)a5;
- (id)eventForUID:(id)a3 occurrenceDate:(id)a4;
- (id)eventForUID:(id)a3 occurrenceDate:(id)a4 checkValid:(BOOL)a5;
- (id)eventNotificationsAfterDate:(id)a3;
- (id)eventNotificationsAfterDate:(id)a3 excludingUncheckedCalendars:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 earliestExpiringNotification:(id *)a6;
- (id)eventNotificationsAfterDate:(id)a3 filteredByShowsNotificationsFlag:(BOOL)a4 earliestExpiringNotification:(id *)a5;
- (id)eventNotificationsExcludingUncheckedCalendars:(BOOL)a3 filteredByShowsNotificationsFlag:(BOOL)a4 earliestExpiringNotification:(id *)a5;
- (id)eventObjectIDsMatchingPredicate:(id)a3;
- (id)eventSourceForReminderSource:(id)a3;
- (id)eventSourceIDForReminderSourceID:(id)a3;
- (id)eventSourceMap;
- (id)eventSources;
- (id)eventWithExternalURI:(id)a3;
- (id)eventWithRecurrenceIdentifier:(id)a3;
- (id)eventWithUUID:(id)a3 occurrenceDate:(id)a4;
- (id)eventWithUniqueId:(id)a3;
- (id)eventWithUniqueId:(id)a3 occurrenceDate:(id)a4;
- (id)eventsWithErrorsPerSourceID;
- (id)eventsWithExternalIdentifier:(id)a3 inCalendars:(id)a4;
- (id)eventsWithIdentifiers:(id)a3;
- (id)eventsWithSameRecurrenceSetAsEvent:(id)a3;
- (id)eventsWithUUIDToOccurrenceDateMap:(id)a3 inCalendars:(id)a4;
- (id)fetchEventsMatchingPredicate:(id)a3 resultHandler:(id)a4;
- (id)fetchRemindersMatchingPredicate:(NSPredicate *)predicate completion:(void *)completion;
- (id)fetchStorageUsage;
- (id)getSubscribedCalendarsSourceCreateIfNeededWithError:(id *)a3;
- (id)importEventsWithExternalIDs:(id)a3 fromICSData:(id)a4 intoCalendars:(id)a5 options:(unint64_t)a6 batchSize:(int)a7;
- (id)importICS:(id)a3 intoCalendar:(id)a4 options:(unint64_t)a5;
- (id)importICSData:(id)a3 intoCalendar:(id)a4 options:(unint64_t)a5;
- (id)importICSData:(id)a3 intoCalendars:(id)a4 options:(unint64_t)a5;
- (id)importVCSData:(id)a3 intoCalendars:(id)a4 error:(id *)a5;
- (id)init;
- (id)insertedObjectIDs;
- (id)insertedPersistentObjectWithEntityName:(id)a3;
- (id)lastCommitTempToPermanentObjectIDMap;
- (id)lastDatabaseTimestampForOOPToWaitOn;
- (id)loadDraftOfEventWithOccurrenceID:(id)a3;
- (id)localBirthdayCalendarCreateIfNeededWithError:(id *)a3;
- (id)localBirthdayCalendarSource;
- (id)localSource;
- (id)localSourceEnableIfNeeded;
- (id)mimicSaveAndCommitEvent:(id)a3 oldToNewObjectIDMap:(id)a4 insertedObjectIDs:(id)a5 updatedObjectIDs:(id)a6 deletedObjectIDs:(id)a7;
- (id)nextEventWithCalendarIdentifiers:(id)a3 exclusionOptions:(int64_t)a4;
- (id)nextEventWithCalendars:(id)a3 exclusionOptions:(int64_t)a4;
- (id)nextEventsWithCalendars:(id)a3 limit:(unint64_t)a4 exclusionOptions:(int64_t)a5;
- (id)notificationCollectionForSource:(id)a3;
- (id)objectWithObjectID:(id)a3;
- (id)objectsMatchingPredicate:(id)a3;
- (id)occurrenceCacheGetOccurrenceCountsForCalendars:(id)a3;
- (id)occurrenceCacheGetOccurrencesForCalendars:(id)a3 onDay:(id)a4;
- (id)parentSourceForDelegateSource:(id)a3;
- (id)persistentObjectWithEntityName:(id)a3;
- (id)personaIdentifierForDatabaseID:(int)a3;
- (id)predicateForAssistantEventSearchWithTimeZone:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 notes:(id)a8 participants:(id)a9 calendars:(id)a10 limit:(int64_t)a11;
- (id)predicateForCalendarItemsOfType:(unint64_t)a3 inCalendar:(id)a4;
- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withExternalID:(id)a4 inCalendar:(id)a5;
- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withExternalID:(id)a4 inSource:(id)a5;
- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withUniqueIdentifier:(id)a4 inCalendar:(id)a5;
- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withUniqueIdentifier:(id)a4 inSource:(id)a5;
- (id)predicateForCalendarStoreForRemindersInCalendars:(id)a3;
- (id)predicateForEventCreatedFromSuggestionWithOpaqueKey:(id)a3;
- (id)predicateForEventsCreatedFromSuggestion;
- (id)predicateForEventsCreatedFromSuggestionWithExtractionGroupIdentifier:(id)a3;
- (id)predicateForEventsInSubscribedCalendar:(id)a3;
- (id)predicateForEventsWithAttendeesInCalendar:(id)a3;
- (id)predicateForEventsWithConferenceURL:(id)a3 limit:(int64_t)a4;
- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 exclusionOptions:(int64_t)a6 filterdOutTitles:(id)a7 randomize:(BOOL)a8 limit:(int64_t)a9;
- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 loadDefaultProperties:(BOOL)a6;
- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 matchingContacts:(id)a6;
- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 prefetchHint:(int64_t)a6 exclusionOptions:(int64_t)a7;
- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 uniqueID:(id)a5 calendars:(id)a6;
- (id)predicateForIncompleteRemindersAndRemindersCompletedAfter:(id)a3 inCalendar:(id)a4;
- (id)predicateForMasterEventsInCalendar:(id)a3;
- (id)predicateForMasterEventsInCalendars:(id)a3;
- (id)predicateForMasterEventsWithExternalTrackingStatusInCalendar:(id)a3;
- (id)predicateForMasterEventsWithInvitationsAndOccurrencesAfter:(id)a3 inCalendar:(id)a4;
- (id)predicateForMasterEventsWithOccurrencesWithStartDate:(id)a3 endDate:(id)a4 inCalendar:(id)a5;
- (id)predicateForMasterEventsWithStartDate:(id)a3 title:(id)a4 inCalendar:(id)a5;
- (id)predicateForNaturalLanguageSuggestedEventsWithSearchString:(id)a3;
- (id)predicateForNaturalLanguageSuggestedEventsWithSearchString:(id)a3 startDate:(id)a4;
- (id)predicateForNonrecurringEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5;
- (id)predicateForNotifiableEvents;
- (id)predicateForNotificationCenterVisibleEvents;
- (id)predicateForPotentialTravelEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)predicateForPreloadedCompletedRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6;
- (id)predicateForPreloadedIncompleteRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6;
- (id)predicateForPreloadedIncompleteRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6 maxResults:(unint64_t)a7;
- (id)predicateForRandomMasterEventsWithStartDate:(id)a3 endDate:(id)a4 needToHaveAttendee:(BOOL)a5 needToHaveLocation:(BOOL)a6 allDay:(BOOL)a7 filteredOutTitles:(id)a8 limit:(int64_t)a9 calendars:(id)a10;
- (id)predicateForRemindersInCalendars:(id)a3 preloadProperties:(id)a4;
- (id)predicateForRemindersWithTitle:(id)a3 listTitle:(id)a4 limitToCompletedOrIncomplete:(BOOL)a5 completed:(BOOL)a6 dueAfter:(id)a7 dueBefore:(id)a8 searchTerm:(id)a9 sortOrder:(int)a10 maxResults:(unint64_t)a11;
- (id)predicateForScheduleAgentClientEventsInCalendar:(id)a3;
- (id)predicateForUnacknowledgedEvents;
- (id)predicateForUnalertedEvents;
- (id)predicateForUpNextEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5 startDateRestrictionThreshold:(double)a6;
- (id)predicateForUpcomingEventsWithLimit:(int)a3;
- (id)primaryAppleAccountSource;
- (id)publicObjectWithFetchedObjectID:(id)a3;
- (id)publicObjectWithObjectID:(id)a3;
- (id)publicObjectWithPersistentObject:(id)a3;
- (id)readWriteCalendarsForEntityType:(unint64_t)a3;
- (id)redactedMimicSaveEvent:(id)a3 oldToNewObjectIDMap:(id)a4 serializedDictionary:(id)a5 objectIDToChangeSetDictionaryMap:(id)a6 objectIDToPersistentDictionaryMap:(id)a7;
- (id)refreshEverythingIfNecessary:(BOOL)a3;
- (id)refreshFolderListsIfNecessary:(BOOL)a3;
- (id)refreshSourcesIfNecessary:(BOOL)a3;
- (id)registerFetchedObjectWithID:(id)a3;
- (id)registerFetchedObjectWithID:(id)a3 withDefaultLoadedPropertyKeys:(id)a4 values:(id)a5;
- (id)reminderIntegrationCalendar;
- (id)reminderObjectIDsMatchingPredicate:(id)a3;
- (id)reminderSourceForEventSource:(id)a3;
- (id)reminderSourceMap;
- (id)reminderSources;
- (id)reminderWithExternalURI:(id)a3;
- (id)reminderWithIdentifier:(id)a3;
- (id)reminderWithUniqueId:(id)a3;
- (id)remindersMatchingPredicate:(id)a3;
- (id)remindersWithExternalIdentifier:(id)a3 inCalendars:(id)a4;
- (id)resourceChangesForEntityTypes:(unint64_t)a3;
- (id)sequenceToken;
- (id)sharedCalendarInvitationsForEntityTypes:(unint64_t)a3;
- (id)sourceIdentifierForEvent:(id)a3;
- (id)sourceWithExternalID:(id)a3;
- (id)sourcesEnabledForEntityType:(unint64_t)a3;
- (id)travelEligibleEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:(id)a3;
- (id)uniqueIdentifiersForEventsWithObjectIDs:(id)a3;
- (id)updatedObjectIDs;
- (id)validatedNonDeletedPersistentObjectWithObjectID:(id)a3;
- (id)validatedNonDeletedPublicObjectWithObjectID:(id)a3;
- (int)birthdayCalendarVersion;
- (int)countOfEventsFromStartDate:(id)a3 toEndDate:(id)a4;
- (int)eventAccessLevel;
- (int)readWriteCalendarCountForEntityType:(unint64_t)a3;
- (int)sequenceNumber;
- (int)syncErrorCount;
- (int64_t)registerForDetailedChangeTracking:(id *)a3;
- (int64_t)registerForDetailedChangeTrackingInSource:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)reminderSourceMapLock;
- (unint64_t)addressValidationStatus:(id)a3;
- (unint64_t)eventNotificationCount;
- (unint64_t)eventNotificationCountExcludingUncheckedCalendars:(BOOL)a3 expanded:(BOOL)a4;
- (unint64_t)eventNotificationCountExpanded:(BOOL)a3;
- (unint64_t)eventNotificationCountForSource:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 excludeObjectIDs:(id)a6;
- (unint64_t)eventNotificationCountForSource:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 excludeObjectIDs:(id)a6 expanded:(BOOL)a7;
- (unint64_t)lastConfirmedSplashScreenVersion;
- (unint64_t)timeToLeaveLocationAuthorizationStatus;
- (void)_accessStatusChanged;
- (void)_addObjectToPendingCommits:(id)a3;
- (void)_addPendingIntegrationEvent:(id)a3 toArrayOfHashTables:(id)a4;
- (void)_addRemovedObjectToPendingCommits:(id)a3;
- (void)_cacheCalendarWithCADObjectID:(id)a3 withDefaultLoadedPropertyValues:(id)a4 forKeys:(id)a5;
- (void)_cacheDeletedEventIdentifierIfNeededForObject:(id)a3;
- (void)_cacheSourceWithCADObjectID:(id)a3 withDefaultLoadedPropertyValues:(id)a4 forKeys:(id)a5;
- (void)_clearAllCachedConstraints;
- (void)_clearAllCaches;
- (void)_clearCachedCalendars;
- (void)_clearCachedConstraintsForObjectWithCADObjectID:(id)a3;
- (void)_clearCachedSources;
- (void)_clearEventsNeedingGeocodingWithCommittedObjects:(id)a3;
- (void)_clearImageCache;
- (void)_clearPendingChangesForObjectsWithOwner:(id)a3;
- (void)_databaseChangedExternally:(unint64_t)a3 processSynchronously:(BOOL)a4;
- (void)_defaultAlarmChangedExternally;
- (void)_defaultCalendarChangedExternally;
- (void)_deleteDraft:(id)a3;
- (void)_deleteDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4;
- (void)_deleteObject:(id)a3;
- (void)_detachObject:(id)a3;
- (void)_fetchAndClearEventsNeedingGeocoding:(id *)a3 withCommittedObjects:(id)a4;
- (void)_fetchProperties:(id)a3 forObjects:(id)a4;
- (void)_forgetRegisteredObjects;
- (void)_handleExternalDatabaseChangeNotification:(id)a3 synchronously:(BOOL)a4;
- (void)_handleExternalDatabaseChangedNotificationAsynchronously:(id)a3;
- (void)_implicitUpgradeToFullAccessIfNeededWithReason:(int64_t)a3;
- (void)_implicitlyRequestEventAccessForOlderApps;
- (void)_insertObject:(id)a3;
- (void)_loadCalendarsIfNeeded;
- (void)_loadSourcesIfNeeded;
- (void)_markObjectUncommittable:(id)a3;
- (void)_mimicCommitWithOldToNewObjectIDMap:(id)a3 insertedObjectsToCommit:(id)a4 updatedObjectsToCommit:(id)a5 deletedObjectsToCommit:(id)a6;
- (void)_objectDidReset:(id)a3;
- (void)_populateCalendarsByIdentifierIfNeeded;
- (void)_postEventStoreChangedNotificationWithChangeType:(unint64_t)a3 changedObjectIDs:(id)a4 forceImmediate:(BOOL)a5;
- (void)_postEventStoreChangedNotificationWithTags:(id)a3 context:(id)a4;
- (void)_processChangedObjectIDsWithErrorCode:(int)a3 changesTruncated:(BOOL)a4 latestToken:(id)a5 changeData:(id)a6 resultHandler:(id)a7;
- (void)_processExternalChangesWithLatestTimestamp:(id)a3 changedObjectIDsData:(id)a4 deletedObjectIDOffsets:(id)a5 changesWereSyncStatusOnly:(BOOL)a6 forceImmediateNotification:(BOOL)a7;
- (void)_rebuildSourceMapsWithEventSources:(id)a3 reminderSources:(id)a4;
- (void)_registerObject:(id)a3;
- (void)_registerObjectImmediate:(id)a3;
- (void)_removeCachedCalendarFromSource:(id)a3;
- (void)_removeCachedCalendarWithCADID:(id)a3;
- (void)_reregisterObject:(id)a3 oldID:(id)a4;
- (void)_resetAndApplyChangesForRedactedMimicCommitOnObject:(id)a3 usingModifiedObject:(id)a4;
- (void)_resetAndNotifyAfterDatabaseRestoreGenerationChanged;
- (void)_resetCachedPersonaIdentifiers;
- (void)_resetForMimicCommitOnObject:(id)a3 oldToNewObjectIDMap:(id)a4;
- (void)_setIsUnitTesting:(BOOL)a3;
- (void)_setMockPermissions:(id)a3;
- (void)_simulateDaemonCrashForUnitTests;
- (void)_trackModifiedObject:(id)a3;
- (void)_uncacheImage:(id)a3;
- (void)_unregisterObject:(id)a3;
- (void)_updateDefaultDelayForThrottleEventStoreChangedNotifications;
- (void)_validateEventPredicate:(id)a3;
- (void)acceptSuggestedEvent:(id)a3;
- (void)acceptSuggestedEvent:(id)a3 placeOnCalendar:(id)a4;
- (void)addExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toSource:(id)a5 completion:(id)a6;
- (void)addPendingIntegrationEvent:(id)a3;
- (void)analyticsSendEvent:(id)a3 appendingClientBundleIDToPayload:(id)a4;
- (void)cacheConstraints:(id)a3 forObjectWithCADObjectID:(id)a4;
- (void)cacheValidationStatusForAddress:(id)a3 status:(unint64_t)a4;
- (void)cancelFetchRequest:(id)fetchIdentifier;
- (void)changedObjectIDsSinceToken:(int64_t)a3 resultHandler:(id)a4;
- (void)changesSinceSequenceToken:(id)a3 completion:(id)a4;
- (void)clearSuperfluousChanges;
- (void)confirmSuggestedEvent:(id)a3;
- (void)consumeAllChangesUpToToken:(id)a3;
- (void)daemonRestarted;
- (void)databaseRestoreGenerationChangedExternally:(int)a3;
- (void)dealloc;
- (void)deleteAllDrafts;
- (void)deleteDraftOfEventWithOccurrenceID:(id)a3;
- (void)deleteSuggestedEvent:(id)a3;
- (void)endCalDAVServerSimulation:(id)a3;
- (void)ensureLoadedProperties:(id)a3 forObjects:(id)a4;
- (void)enumerateEventsMatchingPredicate:(NSPredicate *)predicate usingBlock:(EKEventSearchCallback)block;
- (void)familyCalendarsWithCompletion:(id)a3;
- (void)fetchChangedObjectIDs:(id)a3;
- (void)fetchChangedObjectIDsSinceToken:(int64_t)a3 resultHandler:(id)a4;
- (void)fetchEventCountsInRange:(id)a3 inCalendars:(id)a4 exclusionOptions:(int64_t)a5 completion:(id)a6;
- (void)fetchGrantedDelegatesForSource:(id)a3 results:(id)a4;
- (void)getMapsWithReminderSourceMap:(id *)a3 eventSourceMap:(id *)a4;
- (void)handleExternalDatabaseChangeNotification:(id)a3;
- (void)initializeEKEventStorePlusReminders;
- (void)insertSuggestedEventCalendar;
- (void)invalidateReminderSourceMaps;
- (void)loadEventIDs:(id *)a3 uniqueIDs:(id *)a4 calendar:(id)a5;
- (void)markChangedObjectIDsConsumedUpToToken:(int64_t)a3;
- (void)pendingIntegrationEventChangedIdentifierFrom:(id)a3 to:(id)a4;
- (void)performHoldingReminderSourceMapLock:(id)a3;
- (void)postSyntheticRouteHypothesis:(id)a3 forEventWithExternalURL:(id)a4;
- (void)purgeChangelog;
- (void)rebuildOccurrenceCache;
- (void)recordObjectRebaseWithOldObjectID:(id)a3 newObjectID:(id)a4;
- (void)recordSequenceTokenForLegacyClients:(id)a3;
- (void)refreshSourcesIfNecessary;
- (void)reminderStoreChanged;
- (void)removeEmptyTablesInArray:(id)a3;
- (void)removeExchangeDelegate:(id)a3 completion:(id)a4;
- (void)removePendingIntegrationEvent:(id)a3;
- (void)removeSuggestedEventCalendar;
- (void)requestAccessToEntityType:(EKEntityType)entityType completion:(EKEventStoreRequestAccessCompletionHandler)completion;
- (void)requestAccessToEntityType:(unint64_t)a3 desiredFullAccess:(BOOL)a4 testing:(BOOL)a5 synchronous:(BOOL)a6 reason:(int64_t)a7 completion:(id)a8;
- (void)requestFullAccessToEventsWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion;
- (void)requestFullAccessToRemindersWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion;
- (void)requestIntegrationCatchupSync;
- (void)requestWriteOnlyAccessToEventsWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion;
- (void)reset;
- (void)respondToSharedCalendarInvitation:(id)a3 withStatus:(unint64_t)a4;
- (void)rollback;
- (void)rollbackObjectsWithIdentifiers:(id)a3;
- (void)setAllowsIntegrationModifications:(BOOL)a3;
- (void)setBirthdayCalendarEnabled:(BOOL)a3;
- (void)setBirthdayCalendarVersion:(int)a3;
- (void)setCachedDefaultAlarmOffsetsToNSNotFound;
- (void)setCachedEKSourceConstraintObject:(id)a3 forKey:(id)a4;
- (void)setDataProtectionObserver:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDefaultCalendar:(id)a3 forNewEventsInDelegateSource:(id)a4;
- (void)setDefaultCalendarForNewEvents:(id)a3;
- (void)setDefaultCalendarForNewReminders:(id)a3;
- (void)setDeletedObjects:(id)a3;
- (void)setEmailSender:(id)a3;
- (void)setEventSourceIDToReminderSourceIDMapping:(id)a3;
- (void)setInsertedObjects:(id)a3;
- (void)setLastDatabaseNotificationTimestamp:(id)a3;
- (void)setNeedsGeocoding:(BOOL)a3 forEvent:(id)a4;
- (void)setObjectsPendingSave:(id)a3;
- (void)setPrivacyClientIdentity:(id)a3;
- (void)setRegisteredObjects:(id)a3;
- (void)setReminderSourceIDToEventSourceIDMapping:(id)a3;
- (void)setRemoteClientIdentity:(id)a3;
- (void)setRestoreGenerationChanged:(BOOL)a3;
- (void)setShowCompletedReminders:(BOOL)a3;
- (void)setShowDeclinedEvents:(BOOL)a3;
- (void)setSkipModificationValidation:(BOOL)a3;
- (void)setSourceAccountManagement:(int)a3;
- (void)setSourceAccountManagement:(int)a3 withBundleID:(id)a4;
- (void)setTimeZone:(id)a3;
- (void)setUncommittableObjects:(id)a3;
- (void)setUpdatedObjects:(id)a3;
- (void)set_cachedConstraints:(id)a3;
- (void)set_cachedDefaultConstraints:(id)a3;
- (void)set_cachedNotificationCollections:(id)a3;
- (void)showCompletedRemindersChanged:(id)a3;
- (void)showDeclinedEventsChanged:(id)a3;
- (void)startRecordingObjectIDChangeMap;
- (void)stopRecordingObjectIDChangeMap;
- (void)updateGrantedDelegate:(id)a3 action:(int64_t)a4 source:(id)a5 completion:(id)a6;
- (void)waitUntilDatabaseUpdatedToTimestamp:(id)a3 callback:(id)a4;
@end

@implementation EKEventStore

- (id)publicObjectWithPersistentObject:(id)a3
{
  id v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "meltedClass")), "initWithPersistentObject:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:6728 description:@"Object is not an EKObject"];
  }

  return v6;
}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v1 = [v2 CADOperationProxySync];
  [v1 CADDatabaseInsertSuggestedEventCalendarWithReply:&__block_literal_global_427];
}

- (BOOL)showsIntegrations
{
  return (BYTE1(self->_options) >> 5) & 1;
}

- (NSArray)objectsPendingCommit
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__EKEventStore_objectsPendingCommit__block_invoke;
  v5[3] = &unk_1E5B96F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(unsavedChangesQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSSet)deletedObjectIDsPendingCommit
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__EKEventStore_deletedObjectIDsPendingCommit__block_invoke;
  v5[3] = &unk_1E5B96F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(unsavedChangesQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (id)eventForObjectID:(id)a3 occurrenceDate:(id)a4 checkValid:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 entityType] == 2)
  {
    if (v5)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v10 = [(EKEventStore *)self database];
      id v11 = objc_msgSend(v8, "CADObjectIDWithGeneration:", objc_msgSend(v10, "databaseRestoreGeneration"));

      v12 = [(EKEventStore *)self connection];
      v13 = [v12 CADOperationProxySync];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke;
      v18[3] = &unk_1E5B99230;
      v18[4] = &v19;
      [v13 CADObjectExists:v11 reply:v18];

      if (*((unsigned char *)v20 + 24))
      {
        v14 = [(EKEventStore *)self registerFetchedObjectWithID:v8];
      }
      else
      {
        v14 = 0;
      }

      _Block_object_dispose(&v19, 8);
      if (!v14) {
        goto LABEL_13;
      }
    }
    else
    {
      v14 = [(EKEventStore *)self registerFetchedObjectWithID:v8];
      if (!v14)
      {
LABEL_13:
        v16 = 0;
        goto LABEL_14;
      }
    }
    v16 = [[EKEvent alloc] initWithPersistentObject:v14 occurrenceDate:v9];
LABEL_14:
    v15 = v16;

    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKEventStore eventForObjectID:occurrenceDate:checkValid:]();
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)registerFetchedObjectWithID:(id)a3 withDefaultLoadedPropertyKeys:(id)a4 values:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__23;
  char v22 = __Block_byref_object_dispose__23;
  id v23 = 0;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__EKEventStore_registerFetchedObjectWithID_withDefaultLoadedPropertyKeys_values___block_invoke;
  block[3] = &unk_1E5B97028;
  v17 = &v18;
  block[4] = self;
  id v12 = v8;
  id v16 = v12;
  dispatch_sync(registeredQueue, block);
  if (v9 && v10) {
    [(id)v19[5] takeValuesForDefaultPropertyKeys:v9 values:v10];
  }
  id v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)registerFetchedObjectWithID:(id)a3
{
  return [(EKEventStore *)self registerFetchedObjectWithID:a3 withDefaultLoadedPropertyKeys:0 values:0];
}

id __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke_410(uint64_t a1, void *a2)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 objectForKeyedSubscript:@"nextReminderDate"];
  v4 = [v2 objectForKeyedSubscript:@"objectID"];
  BOOL v5 = +[EKObjectID objectIDWithCADObjectID:v4];

  uint64_t v6 = [v2 objectForKeyedSubscript:@"occurrenceDate"];

  if (v3)
  {
    v15[0] = @"occurrenceDate";
    v15[1] = @"objectID";
    v16[0] = v6;
    v16[1] = v5;
    v15[2] = @"nextReminderDate";
    v16[2] = v3;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = v16;
    id v9 = v15;
    uint64_t v10 = 3;
  }
  else
  {
    v13[0] = @"occurrenceDate";
    v13[1] = @"objectID";
    v14[0] = v6;
    v14[1] = v5;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = v14;
    id v9 = v13;
    uint64_t v10 = 2;
  }
  id v11 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];

  return v11;
}

- (EKDaemonConnection)connection
{
  return self->_database;
}

- (id)sourceIdentifierForEvent:(id)a3
{
  id v4 = a3;
  int v5 = [(EKEventStore *)self eventAccessLevel];
  uint64_t v6 = [v4 calendar];
  v7 = v6;
  if (v5 == 1)
  {

    if (v7)
    {
      uint64_t v15 = 0;
      id v16 = &v15;
      uint64_t v17 = 0x3032000000;
      uint64_t v18 = __Block_byref_object_copy__23;
      uint64_t v19 = __Block_byref_object_dispose__23;
      id v20 = 0;
      id v8 = [(EKEventStore *)self connection];
      id v9 = [v8 CADOperationProxySync];
      uint64_t v10 = [v4 CADObjectID];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __41__EKEventStore_sourceIdentifierForEvent___block_invoke;
      v14[3] = &unk_1E5B99B70;
      v14[4] = &v15;
      [v9 CADDatabaseGetSourceIdentifierForEventWithObjectID:v10 reply:v14];

      id v11 = (id)v16[5];
      _Block_object_dispose(&v15, 8);
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v12 = [v6 source];
    id v11 = [v12 sourceIdentifier];
  }

  return v11;
}

- (int)eventAccessLevel
{
  return [(EKAuthStatusChecker *)self->_authStatusChecker eventAccessLevel];
}

- (NSArray)calendarsForEntityType:(EKEntityType)entityType
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (entityType >= 2)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:2625 description:@"Invalid entity type passed"];
  }
  int v5 = [(EKEventStore *)self _allCalendars];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (entityType == EKEntityTypeReminder)
        {
          if ((objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "allowedEntityTypes", (void)v20) & 2) != 0)
          {
            uint64_t v15 = [v12 source];
            int v16 = [v15 allowsTasks];

            if (v16)
            {
LABEL_15:
              objc_msgSend(v6, "addObject:", v12, (void)v20);
              continue;
            }
          }
        }
        else if (entityType == EKEntityTypeEvent {
               && ([*(id *)(*((void *)&v20 + 1) + 8 * i) allowedEntityTypes] & 1) != 0)
        }
        {
          id v13 = [v12 source];
          char v14 = [v13 allowsEvents];

          if (v14) {
            goto LABEL_15;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (BOOL)skipModificationValidation
{
  return self->_skipModificationValidation;
}

- (BOOL)allowsBirthdayModifications
{
  int v3 = [MEMORY[0x1E4F57700] currentProcessHasBirthdayModificationEntitlement];
  if (v3) {
    LOBYTE(v3) = self->_allowsBirthdayCalendarModifications;
  }
  return v3;
}

void __29__EKEventStore__allCalendars__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadCalendarsIfNeeded];
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    int v3 = [v2 allValues];
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          id v13 = [EKCalendar alloc];
          char v14 = -[EKObject initWithPersistentObject:](v13, "initWithPersistentObject:", v12, (void)v15);
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)_loadCalendarsIfNeeded
{
  if (!self->_calendars)
  {
    int v3 = +[EKPersistentCalendar defaultPropertiesToLoad];
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy__23;
    v24 = __Block_byref_object_dispose__23;
    id v25 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__23;
    v18[4] = __Block_byref_object_dispose__23;
    id v19 = 0;
    uint64_t v4 = [(EKEventStore *)self connection];
    uint64_t v5 = [v4 CADOperationProxySync];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __38__EKEventStore__loadCalendarsIfNeeded__block_invoke;
    v17[3] = &unk_1E5B99BC0;
    v17[4] = &v20;
    v17[5] = v18;
    [v5 CADDatabaseGetCalendarsWithFaultedProperties:v3 reply:v17];

    if (v21[5])
    {
      uint64_t v6 = [(EKEventStore *)self database];
      int v7 = [v6 databaseRestoreGeneration];

      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)v21[5], "count"));
      uint64_t v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      calendars = self->_calendars;
      self->_calendars = v8;

      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)v21[5], "count"));
      uint64_t v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      calendarsByIdentifier = self->_calendarsByIdentifier;
      self->_calendarsByIdentifier = v10;

      uint64_t v12 = (void *)v21[5];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_310;
      v13[3] = &unk_1E5B99BE8;
      int v16 = v7;
      v13[4] = self;
      long long v15 = v18;
      id v14 = v3;
      [v12 enumerateObjectsUsingBlock:v13];
    }
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v20, 8);
  }
}

+ (id)calendarObjectIDsForPredicate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v6)
    {
LABEL_15:

      goto LABEL_18;
    }
    uint64_t v7 = v6;
    id v17 = v3;
    char v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 backingObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v14 = [v11 CADObjectID];
          [v4 addObject:v14];
        }
        else
        {
          char v8 = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);

    if (v8)
    {
      id v3 = v17;
      if ([v4 count]) {
        goto LABEL_18;
      }
      id v15 = objc_alloc(MEMORY[0x1E4F57428]);
      id v5 = (id)[v15 initWithEntityType:1 entityID:0x80000000 databaseID:*MEMORY[0x1E4F574B8]];
      [v4 addObject:v5];
      goto LABEL_15;
    }
    id v3 = v17;
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_18:

  return v4;
}

- (id)occurrenceCacheGetOccurrencesForCalendars:(id)a3 onDay:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__23;
  v30 = __Block_byref_object_dispose__23;
  id v31 = 0;
  char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) CADObjectID];
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v10);
  }

  id v14 = [(EKEventStore *)self connection];
  id v15 = [v14 CADOperationProxySync];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke;
  v19[3] = &unk_1E5B986A0;
  id v16 = v8;
  id v20 = v16;
  long long v21 = &v26;
  [v15 CADOccurrenceCacheGetOccurrencesForCalendars:v16 onDay:v7 reply:v19];

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventSources];
  if ([*(id *)(a1 + 32) returnEventResults]) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_1(v9);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) reminderSources];
    if ([*(id *)(a1 + 32) returnReminderResults]) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      uint64_t v10 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_2(v10);
      }
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) _combineEventSources:v2 withReminderSources:v4];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      char v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

- (id)eventSources
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  uint64_t v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  if ([(EKEventStore *)self returnEventResults])
  {
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__EKEventStore_eventSources__block_invoke;
    v6[3] = &unk_1E5B96E30;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_allCalendars
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__23;
  id v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  if ([(EKEventStore *)self returnEventResults])
  {
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__EKEventStore__allCalendars__block_invoke;
    v11[3] = &unk_1E5B96E30;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(calendarSourcesAndDefaultsQueue, v11);
  }
  BOOL v4 = [(EKEventStore *)self returnReminderResults];
  BOOL v5 = (void *)v13[5];
  if (v4)
  {
    [(EKReminderStore *)self->_reminderStore calendars];
    if (v5) {
      uint64_t v6 = {;
    }
      [v5 addObjectsFromArray:v6];

      id v7 = (id)[(id)v13[5] copy];
    }
    else
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = v5;
  }
  char v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (BOOL)accessGrantedForEntityType:(unint64_t)a3
{
  if (a3 != 1)
  {
    if (a3)
    {
      BOOL v5 = EKLogHandle;
      int v4 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      -[EKEventStore accessGrantedForEntityType:](a3, v5, v6, v7, v8, v9, v10, v11);
    }
    else if (!denyAccessToEvents)
    {
      LOBYTE(v4) = [(EKAuthStatusChecker *)self->_authStatusChecker eventAccessLevel] != 0;
      return v4;
    }
LABEL_6:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (denyAccessToReminders) {
    goto LABEL_6;
  }
  authStatusChecker = self->_authStatusChecker;

  LOBYTE(v4) = [(EKAuthStatusChecker *)authStatusChecker hasAccessToReminders];
  return v4;
}

- (BOOL)returnEventResults
{
  if (!CalIsReminderBridgeEnabled()) {
    return 1;
  }

  return [(EKEventStore *)self accessGrantedForEntityType:0];
}

- (BOOL)returnReminderResults
{
  int IsReminderBridgeEnabled = CalIsReminderBridgeEnabled();
  if (IsReminderBridgeEnabled)
  {
    LOBYTE(IsReminderBridgeEnabled) = [(EKEventStore *)self accessGrantedForEntityType:1];
  }
  return IsReminderBridgeEnabled;
}

- (id)reminderSources
{
  if ([(EKEventStore *)self returnReminderResults])
  {
    BOOL v3 = [(EKReminderStore *)self->_reminderStore sources];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t __31__EKEventStore_delegateSources__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDelegate];
}

void __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2_cold_1(v7);
    }
  }
  else if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) database];
    uint64_t v9 = objc_msgSend(v6, "stampedCopyWithGeneration:", objc_msgSend(v8, "databaseRestoreGeneration"));
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

- (NSArray)delegateSources
{
  id v2 = [(EKEventStore *)self eventSources];
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_267];
  int v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

void __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke(void *a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v39 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (a2)
  {
    id v15 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke_cold_1(v15);
    }
  }
  else
  {
    id v36 = v13;
    id obj = a6;
    uint64_t v16 = [v12 count];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
    uint64_t v18 = *(void *)(a1[5] + 8);
    long long v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    if (v16)
    {
      uint64_t v20 = 0;
      long long v21 = &off_1E5B96000;
      long long v22 = &off_1E5B96000;
      uint64_t v38 = v16;
      do
      {
        long long v23 = [v11 objectAtIndexedSubscript:v20];
        uint64_t v24 = [v23 intValue];

        long long v25 = [v12 objectAtIndexedSubscript:v20];
        uint64_t v26 = [v21[98] objectIDWithCADObjectID:v25];
        if (v24 > 1)
        {
          v35 = (void *)[objc_alloc((Class)v22[49]) initWithType:v24 objectID:v26 eventStore:a1[4]];
        }
        else
        {
          id v27 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [v39 objectAtIndexedSubscript:v20];
          v40 = v25;
          uint64_t v28 = v22;
          v29 = a1;
          id v30 = v12;
          id v31 = v11;
          uint64_t v33 = v32 = v21;
          [v33 doubleValue];
          v34 = objc_msgSend(v27, "initWithTimeIntervalSinceReferenceDate:");

          long long v21 = v32;
          id v11 = v31;
          id v12 = v30;
          a1 = v29;
          long long v22 = v28;
          long long v25 = v40;
          v35 = (void *)[objc_alloc((Class)v22[49]) initWithType:v24 objectID:v26 date:v34 eventStore:a1[4]];

          uint64_t v16 = v38;
        }
        [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v35];

        ++v20;
      }
      while (v16 != v20);
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
    uint64_t v14 = v36;
  }
}

void __36__EKEventStore__loadSourcesIfNeeded__block_invoke_260(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 stampedCopyWithGeneration:*(unsigned int *)(a1 + 56)];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:a3];
  [v5 _cacheSourceWithCADObjectID:v7 withDefaultLoadedPropertyValues:v6 forKeys:*(void *)(a1 + 40)];
}

void __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_310(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = [a2 stampedCopyWithGeneration:*(unsigned int *)(a1 + 56)];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:a3];
  [v5 _cacheCalendarWithCADObjectID:v7 withDefaultLoadedPropertyValues:v6 forKeys:*(void *)(a1 + 40)];
}

- (void)_cacheCalendarWithCADObjectID:(id)a3 withDefaultLoadedPropertyValues:(id)a4 forKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  calendars = self->_calendars;
  if (calendars)
  {
    uint64_t v12 = [(NSMutableDictionary *)calendars objectForKey:v8];
    id v13 = (void *)v12;
    if (v9 || !v12)
    {
      uint64_t v14 = +[EKObjectID objectIDWithCADObjectID:v8];
      id v15 = [(EKEventStore *)self registerFetchedObjectWithID:v14 withDefaultLoadedPropertyKeys:v10 values:v9];

      uint64_t v16 = [(EKObject *)[EKCalendar alloc] initWithPersistentObject:v15];
      uint64_t v17 = v16;
      if (!v13 && ![(EKCalendar *)v16 isHidden])
      {
        [(NSMutableDictionary *)self->_calendars setObject:v15 forKey:v8];
        uint64_t v18 = [(EKCalendar *)v17 calendarIdentifier];
        if (v18)
        {
          [(NSMutableDictionary *)self->_calendarsByIdentifier setObject:v15 forKey:v18];
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          -[EKEventStore _cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:]();
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:]();
  }
}

- (void)_cacheSourceWithCADObjectID:(id)a3 withDefaultLoadedPropertyValues:(id)a4 forKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sources = self->_sources;
  if (sources)
  {
    uint64_t v12 = [(NSMutableDictionary *)sources objectForKey:v8];
    id v13 = (void *)v12;
    if (v9 || !v12)
    {
      uint64_t v14 = +[EKObjectID objectIDWithCADObjectID:v8];
      uint64_t v15 = [(EKEventStore *)self registerFetchedObjectWithID:v14 withDefaultLoadedPropertyKeys:v10 values:v9];

      if (v15)
      {
        [(NSMutableDictionary *)self->_sources setObject:v15 forKey:v8];
        id v13 = (void *)v15;
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _cacheSourceWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:]();
  }
}

- (BOOL)showDeclinedEvents
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__EKEventStore_showDeclinedEvents__block_invoke;
  v5[3] = &unk_1E5B96E30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)objectWithIDExists:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (v4)
  {
    id v5 = [(EKEventStore *)self connection];
    uint64_t v6 = [v5 CADOperationProxySync];
    id v7 = [v4 CADObjectIDWithGeneration:0xFFFFFFFFLL];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__EKEventStore_objectWithIDExists___block_invoke;
    v10[3] = &unk_1E5B98678;
    id v11 = v4;
    uint64_t v12 = &v13;
    [v6 CADObjectExists:v7 reply:v10];
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore objectWithIDExists:]();
  }
  char v8 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 loadDefaultProperties:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    long long v22 = _NSMethodExceptionProem();
    [v20 raise:v21, @"%@: startDate is nil", v22 format];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v23 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v24 = *MEMORY[0x1E4F1C3C8];
  long long v25 = _NSMethodExceptionProem();
  [v23 raise:v24, @"%@: endDate is nil", v25 format];

LABEL_3:
  id v26 = v11;
  restrictDateRange(v10, &v26);
  id v13 = v26;

  uint64_t v14 = +[EKEventStore calendarObjectIDsForPredicate:v12];
  if (v6) {
    uint64_t v15 = _predicatePropertyLoadMode;
  }
  else {
    uint64_t v15 = 0;
  }
  char v16 = (void *)MEMORY[0x1E4F56970];
  uint64_t v17 = [(EKEventStore *)self timeZone];
  uint64_t v18 = [v16 predicateWithStartDate:v10 endDate:v13 timeZone:v17 calendars:v14 propertyLoadMode:v15];

  return v18;
}

- (NSPredicate)predicateForEventsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate calendars:(NSArray *)calendars
{
  char v8 = startDate;
  char v9 = endDate;
  id v10 = calendars;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    long long v19 = _NSMethodExceptionProem();
    [v17 raise:v18, @"%@: startDate is nil", v19 format];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v21 = *MEMORY[0x1E4F1C3C8];
  long long v22 = _NSMethodExceptionProem();
  [v20 raise:v21, @"%@: endDate is nil", v22 format];

LABEL_3:
  long long v23 = v9;
  restrictDateRange(v8, (id *)&v23);
  id v11 = v23;

  id v12 = +[EKEventStore calendarObjectIDsForPredicate:v10];
  id v13 = (void *)MEMORY[0x1E4F56970];
  uint64_t v14 = [(EKEventStore *)self timeZone];
  uint64_t v15 = [v13 predicateWithStartDate:v8 endDate:v11 timeZone:v14 calendars:v12 propertyLoadMode:_predicatePropertyLoadMode];

  return (NSPredicate *)v15;
}

- (NSTimeZone)timeZone
{
  timeZone = self->_timeZone;
  if (timeZone)
  {
    char v3 = (void *)[(NSTimeZone *)timeZone copy];
  }
  else
  {
    char v3 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }

  return (NSTimeZone *)v3;
}

void __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v7 = [v5 CalMap:&__block_literal_global_413];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (BOOL)isDataProtected
{
  id v2 = [(EKEventStore *)self dataProtectionObserver];
  char v3 = [v2 dataIsAccessible] ^ 1;

  return v3;
}

- (id)eventNotificationsExcludingUncheckedCalendars:(BOOL)a3 filteredByShowsNotificationsFlag:(BOOL)a4 earliestExpiringNotification:(id *)a5
{
  return [(EKEventStore *)self eventNotificationsAfterDate:0 excludingUncheckedCalendars:a3 filteredByShowsNotificationsFlag:a4 earliestExpiringNotification:a5];
}

- (id)eventNotificationsAfterDate:(id)a3 excludingUncheckedCalendars:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 earliestExpiringNotification:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__23;
  id v26 = __Block_byref_object_dispose__23;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__23;
  uint64_t v20 = __Block_byref_object_dispose__23;
  id v21 = 0;
  id v11 = [(EKEventStore *)self connection];
  id v12 = [v11 CADOperationProxySync];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke;
  void v15[3] = &unk_1E5B9A0E8;
  v15[4] = self;
  v15[5] = &v22;
  v15[6] = &v16;
  [v12 CADDatabaseGetEventNotificationItemsAfterDate:v10 excludingUncheckedCalendars:v8 filteredByShowsNotificationsFlag:v7 reply:v15];

  if (a6) {
    *a6 = (id) v17[5];
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v13;
}

void __28__EKEventStore_eventSources__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadSourcesIfNeeded];
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    char v3 = [v2 allValues];
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
          id v11 = [EKSource alloc];
          id v12 = -[EKObject initWithPersistentObject:](v11, "initWithPersistentObject:", v10, (void)v16);
          [v4 addObject:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v13 = [v4 copy];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (void)_loadSourcesIfNeeded
{
  if (!self->_sources)
  {
    char v3 = +[EKPersistentSource defaultPropertiesToLoad];
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__23;
    uint64_t v22 = __Block_byref_object_dispose__23;
    id v23 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__23;
    void v16[4] = __Block_byref_object_dispose__23;
    id v17 = 0;
    id v4 = [(EKEventStore *)self connection];
    id v5 = [v4 CADOperationProxySync];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__EKEventStore__loadSourcesIfNeeded__block_invoke;
    void v15[3] = &unk_1E5B99BC0;
    v15[4] = &v18;
    v15[5] = v16;
    [v5 CADDatabaseGetSourcesWithFaultedProperties:v3 reply:v15];

    if (v19[5])
    {
      uint64_t v6 = [(EKEventStore *)self database];
      int v7 = [v6 databaseRestoreGeneration];

      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)v19[5], "count"));
      uint64_t v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      sources = self->_sources;
      self->_sources = v8;

      uint64_t v10 = (void *)v19[5];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __36__EKEventStore__loadSourcesIfNeeded__block_invoke_260;
      v11[3] = &unk_1E5B99BE8;
      int v14 = v7;
      v11[4] = self;
      uint64_t v13 = v16;
      id v12 = v3;
      [v10 enumerateObjectsUsingBlock:v11];
    }
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(&v18, 8);
  }
}

- (id)defaultCalendarForNewEventsInDelegateSource:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 isDelegate] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore defaultCalendarForNewEventsInDelegateSource:]();
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v6 = [v5 CADObjectID];
    int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    long long v25 = __Block_byref_object_copy__23;
    id v26 = __Block_byref_object_dispose__23;
    id v27 = 0;
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke;
    id v17 = &unk_1E5B99F08;
    uint64_t v18 = self;
    id v11 = v8;
    id v19 = v11;
    id v12 = v7;
    id v20 = v12;
    uint64_t v21 = &v22;
    dispatch_sync(calendarSourcesAndDefaultsQueue, &v14);
    uint64_t v9 = -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:", v23[5], v14, v15, v16, v17, v18);

    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (id)calendarWithCADID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 restoreGeneration] == -1
     || (int v6 = [v5 restoreGeneration],
         [(EKEventStore *)self database],
         int v7 = objc_claimAutoreleasedReturnValue(),
         int v8 = [v7 databaseRestoreGeneration],
         v7,
         v6 == v8)))
  {
    uint64_t v9 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v10 = [(EKEventStore *)self calendarWithID:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)calendarWithID:(id)a3
{
  char v3 = [(EKEventStore *)self objectWithObjectID:a3];
  if (v3) {
    id v4 = [(EKObject *)[EKCalendar alloc] initWithPersistentObject:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)objectWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__23;
  long long v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EKEventStore_objectWithObjectID___block_invoke;
  block[3] = &unk_1E5B97028;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(registeredQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __81__EKEventStore_registerFetchedObjectWithID_withDefaultLoadedPropertyKeys_values___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 440) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _addFetchedObjectWithID:*(void *)(a1 + 40)];
    MEMORY[0x1F41817F8]();
  }
}

- (id)_addFetchedObjectWithID:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [v5 entityName];
  int v8 = (objc_class *)[v6 classForEntityName:v7];

  if (!v8)
  {
    uint64_t v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
      -[EKEventStore _addFetchedObjectWithID:](v9, v5);
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [v5 entityName];
    [v10 handleFailureInMethod:a2, self, @"EKEventStore.m", 6654, @"Unknown entity name %@ for objectID: %@ with entity type: %d", v11, v5, objc_msgSend(v5, "entityType") object file lineNumber description];
  }
  id v12 = objc_alloc_init(v8);
  uint64_t v13 = [(EKEventStore *)self database];
  objc_msgSend(v12, "_setObjectID:inDatabaseRestoreGeneration:", v5, objc_msgSend(v13, "databaseRestoreGeneration"));

  [(EKEventStore *)self _registerObjectImmediate:v12];

  return v12;
}

- (EKDaemonConnection)database
{
  return self->_database;
}

- (void)_registerObjectImmediate:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:6558 description:@"Object is not an EKPersistentObject"];
  }
  id v5 = [v10 objectID];

  if (!v5)
  {
    id v6 = +[EKObjectID temporaryObjectIDWithEntityType:](EKObjectID, "temporaryObjectIDWithEntityType:", [v10 entityType]);
    [v10 _setObjectID:v6 inDatabaseRestoreGeneration:0xFFFFFFFFLL];
  }
  registeredObjects = self->_registeredObjects;
  int v8 = [v10 objectID];
  [(NSMutableDictionary *)registeredObjects setObject:v10 forKey:v8];

  [v10 _setEventStore:self];
}

+ (Class)classForEntityName:(id)a3
{
  uint64_t v3 = classForEntityName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&classForEntityName__onceToken, &__block_literal_global_77);
  }
  id v5 = [(id)classForEntityName__sClassMap objectForKey:v4];

  return (Class)v5;
}

uint64_t __34__EKEventStore_showDeclinedEvents__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[23];
  if (!v3)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v4 = [v2 connection];
    id v5 = [v4 CADOperationProxySync];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__EKEventStore_showDeclinedEvents__block_invoke_2;
    v10[3] = &unk_1E5B99230;
    void v10[4] = &v11;
    [v5 CADDatabaseShowsDeclinedEventsWithReply:v10];

    uint64_t v6 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 24)];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 184);
    *(void *)(v7 + 184) = v6;

    _Block_object_dispose(&v11, 8);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 184);
  }
  uint64_t result = [v3 BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3
{
  return [(EKEventStore *)self initWithEKOptions:a3 path:0 changeTrackingClientId:0 enablePropertyModificationLogging:1 allowDelegateSources:1];
}

uint64_t __36__EKEventStore_objectsPendingCommit__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 112) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __45__EKEventStore_deletedObjectIDsPendingCommit__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 312) valueForKey:@"objectID"];

  return MEMORY[0x1F41817F8]();
}

- (EKEventStore)initWithOptions:(int)a3 path:(id)a4 allowDelegateSources:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  uint64_t v9 = [(EKEventStore *)self initWithEKOptions:+[EKEventStore ekEventStoreInitOptionsFromCalDatabaseInitOptions:v6] path:v8 changeTrackingClientId:0 enablePropertyModificationLogging:1 allowDelegateSources:v5];

  return v9;
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7
{
  return [(EKEventStore *)self initWithEKOptions:a3 path:a4 changeTrackingClientId:a5 enablePropertyModificationLogging:a6 allowDelegateSources:a7 allowedSourceIdentifiers:0];
}

+ (unint64_t)ekEventStoreInitOptionsFromCalDatabaseInitOptions:(int)a3
{
  return a3 & 0x3F;
}

- (void)setAllowsIntegrationModifications:(BOOL)a3
{
  self->_allowsIntegrationModifications = a3;
}

- (id)cachedConstraintsForSource:(id)a3
{
  id v4 = a3;
  if (-[EKEventStore returnEventResults](self, "returnEventResults") && [v4 allowsEvents]) {
    goto LABEL_7;
  }
  if ([(EKEventStore *)self returnReminderResults]
    && [v4 allowsTasks])
  {
    BOOL v5 = [(EKReminderStore *)self->_reminderStore cachedConstraintsForSource:v4];
    goto LABEL_9;
  }
  if ([v4 isPrimaryLocalSource])
  {
LABEL_7:
    uint64_t v6 = [v4 CADObjectID];
    BOOL v5 = [(EKEventStore *)self cachedConstraintsForEventOrSourceWithCADObjectID:v6];
  }
  else
  {
    BOOL v5 = 0;
  }
LABEL_9:
  uint64_t v7 = [v4 remAccountObjectID];

  if (v7) {
    [v5 setAllowsTasks:1];
  }
  if (!v5)
  {
    id v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore cachedConstraintsForSource:](v8);
    }
  }

  return v5;
}

- (id)reminderSourceForEventSource:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKEventStore *)self reminderStore];
  uint64_t v6 = [(EKEventStore *)self eventSourceMap];
  uint64_t v7 = [v4 valueForKey:*MEMORY[0x1E4F57150]];

  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = [v5 sourceWithIdentifier:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)eventSourceMap
{
  id v4 = 0;
  [(EKEventStore *)self getMapsWithReminderSourceMap:0 eventSourceMap:&v4];
  id v2 = v4;

  return v2;
}

- (void)getMapsWithReminderSourceMap:(id *)a3 eventSourceMap:(id *)a4
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__11;
  id v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__11;
  uint64_t v11 = __Block_byref_object_dispose__11;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__EKEventStore_Reminders__getMapsWithReminderSourceMap_eventSourceMap___block_invoke;
  v6[3] = &unk_1E5B970C8;
  v6[4] = self;
  v6[5] = &v13;
  void v6[6] = &v7;
  [(EKEventStore *)self performHoldingReminderSourceMapLock:v6];
  if (a3) {
    *a3 = (id) v14[5];
  }
  if (a4) {
    *a4 = (id) v8[5];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

- (EKReminderStore)reminderStore
{
  return self->_reminderStore;
}

- (id)cachedConstraintsForEventOrSourceWithCADObjectID:(id)a3
{
  id v4 = a3;
  if ([v4 entityType] == 2
    && [(EKEventStore *)self eventAccessLevel] != 1)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore cachedConstraintsForEventOrSourceWithCADObjectID:]();
    }
    id v6 = 0;
  }
  else
  {
    if ([v4 isTemporary]) {
      BOOL v5 = [v4 entityType] == 2;
    }
    else {
      BOOL v5 = 0;
    }
    if ([v4 isTemporary] && objc_msgSend(v4, "entityType") == 6)
    {
      id v6 = (id)objc_opt_new();
    }
    else
    {
      uint64_t v13 = 0;
      char v14 = &v13;
      uint64_t v15 = 0x3032000000;
      long long v16 = __Block_byref_object_copy__23;
      id v17 = __Block_byref_object_dispose__23;
      id v18 = 0;
      uint64_t v7 = [(EKEventStore *)self constraintsCacheQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65__EKEventStore_cachedConstraintsForEventOrSourceWithCADObjectID___block_invoke;
      v9[3] = &unk_1E5B971B8;
      BOOL v12 = v5;
      uint64_t v11 = &v13;
      v9[4] = self;
      id v10 = v4;
      dispatch_sync(v7, v9);

      id v6 = (id)v14[5];
      _Block_object_dispose(&v13, 8);
    }
  }

  return v6;
}

- (OS_dispatch_queue)constraintsCacheQueue
{
  return self->_constraintsCacheQueue;
}

- (id)combinedReminderAndEventSources
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  id v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke;
  v5[3] = &unk_1E5B96E30;
  v5[4] = self;
  v5[5] = &v6;
  [(EKEventStore *)self performHoldingReminderSourceMapLock:v5];
  id v2 = (void *)v7[5];
  if (!v2)
  {
    v7[5] = MEMORY[0x1E4F1CBF0];

    id v2 = (void *)v7[5];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)reminderStoreChanged
{
  [(EKEventStore *)self invalidateReminderSourceMaps];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__EKEventStore_reminderStoreChanged__block_invoke;
  v3[3] = &unk_1E5B96DE0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)invalidateReminderSourceMaps
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__EKEventStore_Reminders__invalidateReminderSourceMaps__block_invoke;
  v2[3] = &unk_1E5B96E08;
  v2[4] = self;
  [(EKEventStore *)self performHoldingReminderSourceMapLock:v2];
}

- (id)_combineEventSources:(id)a3 withReminderSources:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(EKEventStore *)self _rebuildSourceMapsWithEventSources:v6 reminderSources:v7];
  uint64_t v8 = [(EKEventStore *)self reminderSourceIDToEventSourceIDMapping];
  if (![v7 count])
  {
    id v18 = v6;
LABEL_15:
    uint64_t v9 = v18;
    goto LABEL_16;
  }
  if (![v6 count])
  {
    id v18 = v7;
    goto LABEL_15;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v7, "count"));
  id v20 = v6;
  [v9 addObjectsFromArray:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v16 = [v15 sourceIdentifier];
        id v17 = [v8 objectForKeyedSubscript:v16];

        if (!v17) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  id v6 = v20;
LABEL_16:

  return v9;
}

- (void)_rebuildSourceMapsWithEventSources:(id)a3 reminderSources:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count] && objc_msgSend(v6, "count"))
  {
    v35 = self;
    id v37 = v7;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v36 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v40 = 0;
      uint64_t v12 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v15 = [v14 externalID];
          if (v15)
          {
            [v8 setObject:v14 forKeyedSubscript:v15];
          }
          else if ([v14 isPrimaryLocalSource] {
                 && [v14 isWritable])
          }
          {
            id v16 = v14;

            v40 = v16;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v11);
    }
    else
    {
      v40 = 0;
    }

    unint64_t v18 = [v7 count];
    unint64_t v19 = [v9 count];
    if (v18 >= v19) {
      unint64_t v18 = v19;
    }
    id v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v18];
    uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v18];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v57 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          uint64_t v26 = [v25 externalID];
          id v27 = [v8 objectForKeyedSubscript:v26];

          if (v27)
          {
            uint64_t v28 = [v25 externalID];
            [v8 removeObjectForKey:v28];

LABEL_27:
            v29 = [v27 sourceIdentifier];
            uint64_t v30 = [v25 sourceIdentifier];
            id v31 = (void *)v30;
            if (v29) {
              BOOL v32 = v30 == 0;
            }
            else {
              BOOL v32 = 1;
            }
            if (v32)
            {
              uint64_t v33 = EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                v50 = v29;
                __int16 v51 = 2112;
                v52 = v31;
                __int16 v53 = 2112;
                v54 = v27;
                __int16 v55 = 2112;
                v56 = v25;
                _os_log_error_impl(&dword_1A4E47000, v33, OS_LOG_TYPE_ERROR, "Event or reminder source without ID: eventSourceID=%@, reminderSourceID=%@, eventSource=%@, reminderSource=%@", buf, 0x2Au);
              }
            }
            else
            {
              [v39 setObject:v29 forKeyedSubscript:v30];
              [v38 setObject:v31 forKeyedSubscript:v29];
            }

            continue;
          }
          if (![v25 sourceType])
          {
            id v27 = v40;
            if ([v25 isWritable] && v40 != 0)
            {
              v40 = 0;
              goto LABEL_27;
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v57 count:16];
      }
      while (v22);
    }

    [(EKEventStore *)v35 setReminderSourceIDToEventSourceIDMapping:v39];
    [(EKEventStore *)v35 setEventSourceIDToReminderSourceIDMapping:v38];

    id v6 = v36;
    id v7 = v37;
  }
  else
  {
    uint64_t v17 = MEMORY[0x1E4F1CC08];
    [(EKEventStore *)self setReminderSourceIDToEventSourceIDMapping:MEMORY[0x1E4F1CC08]];
    [(EKEventStore *)self setEventSourceIDToReminderSourceIDMapping:v17];
  }
}

uint64_t __71__EKEventStore_Reminders__getMapsWithReminderSourceMap_eventSourceMap___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reminderSourceIDToEventSourceIDMapping];

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) eventSources];
    id v4 = [*(id *)(a1 + 32) reminderSources];
    [*(id *)(a1 + 32) _rebuildSourceMapsWithEventSources:v3 reminderSources:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 32) reminderSourceIDToEventSourceIDMapping];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) eventSourceIDToReminderSourceIDMapping];

  return MEMORY[0x1F41817F8]();
}

- (NSDictionary)reminderSourceIDToEventSourceIDMapping
{
  return self->_reminderSourceIDToEventSourceIDMapping;
}

- (NSDictionary)eventSourceIDToReminderSourceIDMapping
{
  return self->_eventSourceIDToReminderSourceIDMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailSender, 0);
  objc_storeStrong((id *)&self->_siriSuggestionsAllDayAlarmOffset, 0);
  objc_storeStrong((id *)&self->_siriSuggestionsTimedAlarmOffset, 0);
  objc_storeStrong((id *)&self->_defaultAllDayAlarm, 0);
  objc_storeStrong((id *)&self->_defaultTimedAlarm, 0);
  objc_storeStrong((id *)&self->_eventSourceIDToReminderSourceIDMapping, 0);
  objc_storeStrong((id *)&self->_reminderSourceIDToEventSourceIDMapping, 0);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_registeredObjects, 0);
  objc_storeStrong((id *)&self->__cachedNotificationCollections, 0);
  objc_storeStrong((id *)&self->__cachedConstraints, 0);
  objc_storeStrong((id *)&self->__cachedDefaultConstraints, 0);
  objc_storeStrong((id *)&self->_dataProtectionObserver, 0);
  objc_storeStrong((id *)&self->_notificationCollectionCacheQueue, 0);
  objc_storeStrong((id *)&self->_constraintsCacheQueue, 0);
  objc_storeStrong((id *)&self->_dbChangedQueue, 0);
  objc_storeStrong((id *)&self->_unsavedChangesQueue, 0);
  objc_storeStrong((id *)&self->_registeredQueue, 0);
  objc_storeStrong((id *)&self->_calendarSourcesAndDefaultsQueue, 0);
  objc_storeStrong((id *)&self->_lastDatabaseNotificationTimestamp, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_objectsPendingSave, 0);
  objc_storeStrong((id *)&self->_uncommittableObjects, 0);
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_deletedObjects, 0);
  objc_storeStrong((id *)&self->_insertedObjects, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_lastSequenceToken, 0);
  objc_storeStrong((id *)&self->_deletedEventUniqueIdentifiersCache, 0);
  objc_storeStrong((id *)&self->_notificationAccumulatingQueue, 0);
  objc_storeStrong((id *)&self->_asynchronousSearchQueue, 0);
  objc_storeStrong((id *)&self->_authStatusChecker, 0);
  objc_storeStrong((id *)&self->_showCompletedRemindersNumber, 0);
  objc_storeStrong((id *)&self->_showDeclinedEventsNumber, 0);
  objc_storeStrong((id *)&self->_defaultAllDayAlarmOffset, 0);
  objc_storeStrong((id *)&self->_defaultTimedAlarmOffset, 0);
  objc_storeStrong((id *)&self->_databaseWaitTimestamps, 0);
  objc_storeStrong((id *)&self->_databaseWaitCallbacks, 0);
  objc_storeStrong((id *)&self->_rebaseTempObjectIDReverseMap, 0);
  objc_storeStrong((id *)&self->_lastCommitTempToPermanentObjectIDMap, 0);
  objc_storeStrong((id *)&self->_eventsNeedsGeocoding, 0);
  objc_storeStrong((id *)&self->_objectsPendingCommit, 0);
  objc_storeStrong((id *)&self->_pendingIntegrationEvents, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_cachedValidatedAddresses, 0);
  objc_storeStrong((id *)&self->_calendarsByIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIDByDatabaseID, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_subscribedCalendarsSourceID, 0);
  objc_storeStrong((id *)&self->_naturalLanguageSuggestedEventCalendarID, 0);
  objc_storeStrong((id *)&self->_suggestedEventCalendarID, 0);
  objc_storeStrong((id *)&self->_defaultCalendarsForNewEventsIDBySourceID, 0);
  objc_storeStrong((id *)&self->_birthdaySourceID, 0);

  objc_storeStrong((id *)&self->_initializationOptions, 0);
}

- (void)dealloc
{
  [(EKDaemonConnection *)self->_database setDelegate:0];
  if ([(CADDatabaseInitializationOptions *)self->_initializationOptions unitTesting])
  {
    id v3 = [(EKDaemonConnection *)self->_database CADOperationProxySync];
    [v3 CADTestingCloseDatabase:&__block_literal_global_200];
  }
  [(EKDaemonConnection *)self->_database disconnect];
  v4.receiver = self;
  v4.super_class = (Class)EKEventStore;
  [(EKEventStore *)&v4 dealloc];
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7 allowedSourceIdentifiers:(id)a8
{
  return [(EKEventStore *)self initWithEKOptions:a3 path:a4 containerProvider:0 changeTrackingClientId:a5 enablePropertyModificationLogging:a6 allowDelegateSources:a7 allowedSourceIdentifiers:a8];
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 containerProvider:(id)a5 changeTrackingClientId:(id)a6 enablePropertyModificationLogging:(BOOL)a7 allowDelegateSources:(BOOL)a8 allowedSourceIdentifiers:(id)a9
{
  LOBYTE(v10) = a8;
  return [(EKEventStore *)self initWithEKOptions:a3 path:a4 containerProvider:a5 tccPermissionChecker:0 changeTrackingClientId:a6 enablePropertyModificationLogging:a7 allowDelegateSources:v10 allowedSourceIdentifiers:a9];
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 containerProvider:(id)a5 tccPermissionChecker:(id)a6 changeTrackingClientId:(id)a7 enablePropertyModificationLogging:(BOOL)a8 allowDelegateSources:(BOOL)a9 allowedSourceIdentifiers:(id)a10
{
  BOOL v10 = a8;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  v84.receiver = self;
  v84.super_class = (Class)EKEventStore;
  uint64_t v21 = [(EKEventStore *)&v84 init];
  if (v21)
  {
    EKLogInitIfNeeded();
    uint64_t v22 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEventStore initWithEKOptions:path:containerProvider:tccPermissionChecker:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:]((uint64_t)v21, v22);
    }
    id v75 = v20;
    v21->_options = a3;
    [MEMORY[0x1E4F569C8] setValidator:objc_opt_class()];
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.eventkit.eventstore.calendars", 0);
    calendarSourcesAndDefaultsQueue = v21->_calendarSourcesAndDefaultsQueue;
    v21->_calendarSourcesAndDefaultsQueue = (OS_dispatch_queue *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.eventkit.eventstore.registered", 0);
    registeredQueue = v21->_registeredQueue;
    v21->_registeredQueue = (OS_dispatch_queue *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("com.apple.eventkit.eventstore.unsaved", 0);
    unsavedChangesQueue = v21->_unsavedChangesQueue;
    v21->_unsavedChangesQueue = (OS_dispatch_queue *)v27;

    dispatch_queue_t v29 = dispatch_queue_create("com.apple.eventkit.eventstore.dbchanged", 0);
    dbChangedQueue = v21->_dbChangedQueue;
    v21->_dbChangedQueue = (OS_dispatch_queue *)v29;

    id v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.eventkit.EKPredicateSearch", v31);
    asynchronousSearchQueue = v21->_asynchronousSearchQueue;
    v21->_asynchronousSearchQueue = (OS_dispatch_queue *)v32;

    dispatch_queue_t v34 = dispatch_queue_create("com.apple.eventkit.eventstore.constraintsCache", 0);
    constraintsCacheQueue = v21->_constraintsCacheQueue;
    v21->_constraintsCacheQueue = (OS_dispatch_queue *)v34;

    dispatch_queue_t v36 = dispatch_queue_create("com.apple.eventkit.eventstore.notificationCollectionCache", 0);
    notificationCollectionCacheQueue = v21->_notificationCollectionCacheQueue;
    v21->_notificationCollectionCacheQueue = (OS_dispatch_queue *)v36;

    uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
    databaseWaitCallbacks = v21->_databaseWaitCallbacks;
    v21->_databaseWaitCallbacks = (NSMutableArray *)v38;

    uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
    databaseWaitTimestamps = v21->_databaseWaitTimestamps;
    v21->_databaseWaitTimestamps = (NSMutableArray *)v40;

    uint64_t v42 = [MEMORY[0x1E4F56998] timestampForNow];
    lastDatabaseNotificationTimestamp = v21->_lastDatabaseNotificationTimestamp;
    v21->_lastDatabaseNotificationTimestamp = (CADInMemoryChangeTimestamp *)v42;

    objc_initWeak(&location, v21);
    long long v44 = objc_alloc_init(EKDataProtectionObserver);
    [(EKEventStore *)v21 setDataProtectionObserver:v44];

    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke;
    v81[3] = &unk_1E5B96DE0;
    objc_copyWeak(&v82, &location);
    long long v45 = [(EKEventStore *)v21 dataProtectionObserver];
    [v45 setStateChangedCallback:v81];

    long long v46 = (CADDatabaseInitializationOptions *)objc_alloc_init(MEMORY[0x1E4F56958]);
    initializationOptions = v21->_initializationOptions;
    v21->_initializationOptions = v46;

    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setDatabaseInitOptions:+[EKEventStore calDatabaseInitOptionsFromEKEventStoreInitOptions:a3]];
    long long v48 = [v19 CADChangeTrackingClientId];
    v49 = v48;
    if (!v48) {
      v49 = objc_opt_new();
    }
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setChangeTrackingClientId:v49];
    if (!v48) {

    }
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setEnablePropertyModificationLogging:v10];
    if (v16)
    {
      v50 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
    }
    else
    {
      v50 = 0;
    }
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setDatabaseDirectory:v50];
    if (v16) {

    }
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setCalendarDataContainerProvider:v17];
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setAllowDelegateSources:a9];
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setAllowedSourceIdentifiers:v20];
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setUnitTesting:(a3 >> 12) & 1];
    [(CADDatabaseInitializationOptions *)v21->_initializationOptions setAllowIntegrations:(a3 >> 13) & 1];
    v21->_flagsLock._os_unfair_lock_opaque = 0;
    if ([(id)objc_opt_class() _shouldUseInProcessXPCWithInitOptions:a3])
    {
      if (!v18) {
        id v18 = (id)objc_opt_new();
      }
      __int16 v51 = [[EKLocalXPCConnectionFactory alloc] initWithTCCPermissionChecker:v18];
      [(CADDatabaseInitializationOptions *)v21->_initializationOptions setDatabaseInitOptions:[(CADDatabaseInitializationOptions *)v21->_initializationOptions databaseInitOptions] | 0x2000];
    }
    else
    {
      __int16 v51 = +[EKRemoteXPCConnectionFactory sharedInstance];
    }
    v52 = [[EKDaemonConnection alloc] initWithConnectionFactory:v51];
    database = v21->_database;
    v21->_database = v52;

    [(EKDaemonConnection *)v21->_database setDelegate:v21];
    [(EKDaemonConnection *)v21->_database setInitializationOptions:v21->_initializationOptions];
    v54 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredObjects = v21->_registeredObjects;
    v21->_registeredObjects = v54;

    uint64_t v56 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
    eventsNeedsGeocoding = v21->_eventsNeedsGeocoding;
    v21->_eventsNeedsGeocoding = (NSHashTable *)v56;

    if ((a3 & 0x200) != 0)
    {
      v58 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
      deletedEventUniqueIdentifiersCache = v21->_deletedEventUniqueIdentifiersCache;
      v21->_deletedEventUniqueIdentifiersCache = v58;

      [(NSCache *)v21->_deletedEventUniqueIdentifiersCache setCountLimit:1000];
    }
    [(EKEventStore *)v21 _updateDefaultDelayForThrottleEventStoreChangedNotifications];
    id v60 = objc_alloc(MEMORY[0x1E4F57668]);
    id v74 = v17;
    uint64_t v61 = MEMORY[0x1E4F14428];
    id v62 = MEMORY[0x1E4F14428];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_180;
    v79[3] = &unk_1E5B97E50;
    objc_copyWeak(&v80, &location);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_2;
    v77[3] = &unk_1E5B999F0;
    objc_copyWeak(&v78, &location);
    uint64_t v63 = [v60 initWithQueue:v61 andBlock:v79 throttle:v77];
    notificationAccumulatingQueue = v21->_notificationAccumulatingQueue;
    v21->_notificationAccumulatingQueue = (CalAccumulatingQueue *)v63;

    if ((a3 & 0x104) == 0)
    {
      v65 = (void *)MEMORY[0x1E4F576F8];
      v66 = [(id)objc_opt_class() eventStoreChangedDistributedNotificationName];
      [v65 addObserver:v21 selector:sel__handleExternalDatabaseChangedNotificationAsynchronously_ name:v66];

      if ((a3 & 0x40) != 0) {
        [MEMORY[0x1E4F576F8] addObserver:v21 selector:sel__handleExternalDatabaseChangedNotificationAsynchronously_ name:*MEMORY[0x1E4F574B0]];
      }
      if ((a3 & 0x2000) != 0) {
        [MEMORY[0x1E4F576F8] addObserver:v21 selector:sel__handleExternalDatabaseChangedNotificationAsynchronously_ name:*MEMORY[0x1E4F574A8]];
      }
      [MEMORY[0x1E4F576F8] addObserver:v21 selector:sel__handleExternalDatabaseChangedNotificationAsynchronously_ name:*MEMORY[0x1E4F574F8]];
      [MEMORY[0x1E4F576F8] addObserver:v21 selector:sel__handleExternalDatabaseChangedNotificationAsynchronously_ name:@"com.apple.calendar.defaultAlarmChangedNotification"];
      [MEMORY[0x1E4F576F8] addObserver:v21 selector:sel__handleExternalDatabaseChangedNotificationAsynchronously_ name:*MEMORY[0x1E4F56A70]];
      [MEMORY[0x1E4F576F8] addObserver:v21 selector:sel_showDeclinedEventsChanged_ name:@"com.apple.mobilecal.showdeclinedchanged"];
      [MEMORY[0x1E4F576F8] addObserver:v21 selector:sel_showCompletedRemindersChanged_ name:@"com.apple.mobilecal.showCompletedRemindersChanged"];
    }
    if (!_CFExecutableLinkedOnOrAfter()) {
      [(EKEventStore *)v21 _implicitlyRequestEventAccessForOlderApps];
    }
    [(EKEventStore *)v21 initializeEKEventStorePlusReminders];
    if ([(EKEventStore *)v21 allowAccessToEventsOnly])
    {
      v67 = [[EKStaticAuthStatusChecker alloc] initWithEventAccessLevel:2 hasAccessToReminders:0];
      authStatusChecker = v21->_authStatusChecker;
      v21->_authStatusChecker = (EKAuthStatusChecker *)v67;

      v69 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E47000, v69, OS_LOG_TYPE_DEFAULT, "Initialized event store with access to events only", buf, 2u);
      }
    }
    else
    {
      objc_storeStrong((id *)&v21->_authStatusChecker, v21->_database);
      if (_reminderStoreContainerTokenProvider)
      {
        v70 = (*(void (**)(void))(_reminderStoreContainerTokenProvider + 16))();
      }
      else
      {
        v70 = 0;
      }
      v71 = [[EKReminderStore alloc] initWithEventStore:v21 token:v70];
      reminderStore = v21->_reminderStore;
      v21->_reminderStore = v71;
    }
    objc_destroyWeak(&v78);
    objc_destroyWeak(&v80);

    objc_destroyWeak(&v82);
    objc_destroyWeak(&location);
    id v17 = v74;
    id v20 = v75;
  }

  return v21;
}

- (EKDataProtectionObserver)dataProtectionObserver
{
  return self->_dataProtectionObserver;
}

- (void)initializeEKEventStorePlusReminders
{
  *(_DWORD *)[(EKEventStore *)self reminderSourceMapLock] = 0;
}

- (void)setDataProtectionObserver:(id)a3
{
}

- (BOOL)allowAccessToEventsOnly
{
  if ((self->_options & 0x80) != 0
    || ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessIsCalendarDaemon] & 1) != 0)
  {
    return 1;
  }
  id v3 = (void *)MEMORY[0x1E4F57700];

  return [v3 currentProcessIsDataAccess];
}

- (void)_updateDefaultDelayForThrottleEventStoreChangedNotifications
{
  [(id)objc_opt_class() _defaultDelayForThrottledNotificationsWithInitializationOptions:self->_initializationOptions];
  self->_defaultDelayForThrottledNotifications = v3;
}

+ (BOOL)shouldUseInProcessXPCByDefault
{
  return [MEMORY[0x1E4F57700] currentProcessUsesInProcessEventStores];
}

+ (int)calDatabaseInitOptionsFromEKEventStoreInitOptions:(unint64_t)a3
{
  return a3 & 0x3B;
}

+ (BOOL)_shouldUseInProcessXPCWithInitOptions:(unint64_t)a3
{
  if ((a3 & 0x800) != 0) {
    return 0;
  }
  if ((a3 & 0x400) != 0) {
    return 1;
  }
  return [a1 shouldUseInProcessXPCByDefault];
}

+ (double)_defaultDelayForThrottledNotificationsWithInitializationOptions:(id)a3
{
  double v3 = 0.0;
  if (([a3 unitTesting] & 1) == 0
    && ([MEMORY[0x1E4F57700] currentProcessIsCalendarDaemon] & 1) == 0)
  {
    if ([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement]) {
      return 0.0;
    }
    else {
      return 1.0;
    }
  }
  return v3;
}

+ (NSString)eventStoreChangedDistributedNotificationName
{
  return (NSString *)(id)*MEMORY[0x1E4F574A0];
}

- (void)performHoldingReminderSourceMapLock:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  os_unfair_lock_lock([(EKEventStore *)self reminderSourceMapLock]);
  v4[2](v4);

  uint64_t v5 = [(EKEventStore *)self reminderSourceMapLock];

  os_unfair_lock_unlock(v5);
}

- (os_unfair_lock_s)reminderSourceMapLock
{
  return &self->_reminderSourceMapLock;
}

- (void)setEventSourceIDToReminderSourceIDMapping:(id)a3
{
}

uint64_t __55__EKEventStore_Reminders__invalidateReminderSourceMaps__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setReminderSourceIDToEventSourceIDMapping:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setEventSourceIDToReminderSourceIDMapping:0];
}

- (void)setReminderSourceIDToEventSourceIDMapping:(id)a3
{
}

- (void)enumerateEventsMatchingPredicate:(NSPredicate *)predicate usingBlock:(EKEventSearchCallback)block
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = predicate;
  id v7 = block;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"block is nil"];
  }
  [(EKEventStore *)self eventsMatchingPredicate:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
      char v14 = 0;
      v7[2](v7, v13, &v14);
      if (v14) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKEventStore enumerateEventsMatchingPredicate:usingBlock:]();
  }
}

- (id)fetchEventsMatchingPredicate:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(EKEventStore *)self _validateEventPredicate:v7];
  id v8 = +[EKPredicateSearch searchWithEntityClass:objc_opt_class() predicate:v7 store:self];

  uint64_t v9 = (void *)MEMORY[0x1A6266730](v6);
  uint64_t v10 = [v8 startWithCompletion:v9 queue:self->_asynchronousSearchQueue];

  return v10;
}

- (NSArray)eventsMatchingPredicate:(NSPredicate *)predicate
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = predicate;
  [(EKEventStore *)self _validateEventPredicate:v4];
  [(EKEventStore *)self _implicitUpgradeToFullAccessIfNeededWithReason:7];
  mach_absolute_time();
  uint64_t v5 = +[EKPredicateSearch searchWithEntityClass:objc_opt_class() predicate:v4 store:self];
  id v6 = [v5 runSynchronously];
  mach_absolute_time();
  CalAnalyticsTimeIntervalFromMachTimes();
  uint64_t v10 = @"duration";
  id v7 = objc_msgSend(NSNumber, "numberWithDouble:");
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  CalAnalyticsSendEvent();

  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKEventStore eventsMatchingPredicate:]();
  }

  return (NSArray *)v6;
}

- (void)_validateEventPredicate:(id)a3
{
  id v3 = a3;
  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"predicate is nil"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"predicate was not created with EKCalendarStore methods"];
  }
}

- (void)_implicitUpgradeToFullAccessIfNeededWithReason:(int64_t)a3
{
  if ([(EKEventStore *)self eventAccessLevel] == 1 && _shouldUseLegacyAccessBehavior())
  {
    [(EKEventStore *)self requestAccessToEntityType:0 desiredFullAccess:1 testing:0 synchronous:1 reason:a3 completion:0];
  }
}

void __36__EKEventStore_reminderStoreChanged__block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4[0] = @"EKEventStoreRemindersDataChangedUserInfoKey";
    v4[1] = @"EKEventStoreCalendarDataChangedUserInfoKey";
    v5[0] = MEMORY[0x1E4F1CC38];
    v5[1] = MEMORY[0x1E4F1CC28];
    id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"EKEventStoreChangedNotification" object:WeakRetained userInfo:v2];
  }
}

- (EKEventStore)initWithOptions:(int)a3 path:(id)a4
{
  return [(EKEventStore *)self initWithOptions:*(void *)&a3 path:a4 allowDelegateSources:1];
}

uint64_t __35__EKEventStore_classForEntityName___block_invoke()
{
  id v19 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  classForEntityName__sClassMap = objc_msgSend(v19, "initWithObjectsAndKeys:", v18, @"Source", v17, @"Calendar", v16, @"Event", v15, @"Alarm", v14, @"Attachment", v13, @"Attendee", v12, @"Organizer", v11, @"RecurrenceRule", v0,
                                    @"ExceptionDate",
                                    v1,
                                    @"EventAction",
                                    v2,
                                    @"Location",
                                    v3,
                                    @"Sharee",
                                    v4,
                                    @"ResourceChange",
                                    v5,
                                    @"SuggestionNotification",
                                    v6,
                                    @"InviteReplyNotification",
                                    v7,
                                    @"SuggestedEventInfo",
                                    v8,
                                    @"Error",
                                    v9,
                                    @"Image",
                                    objc_opt_class(),
                                    @"Color",
                                    0);

  return MEMORY[0x1F41817F8]();
}

- (id)predicateForEventsCreatedFromSuggestion
{
  return (id)[MEMORY[0x1E4F56968] predicateForAllSuggestedEvents];
}

- (id)init
{
  return [(EKEventStore *)self initWithOptions:0 path:0];
}

+ (void)setPredicatePropertyLoadMode:(unint64_t)a3
{
  _predicatePropertyLoadMode = a3;
}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 1020)
    {
      uint64_t v2 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_2(v2, v3, v4);
      }
    }
    else
    {
      uint64_t v5 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_1(v5);
      }
    }
  }
}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[EKEventStore insertSuggestedEventCalendar]_block_invoke_2";
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, a1, a3, "%s: Could not insert the Found in Mail calendar because it already exists.", (uint8_t *)&v3);
}

void __35__EKEventStore_objectWithObjectID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 440) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && [*(id *)(a1 + 32) objectWithIDExists:*(void *)(a1 + 40)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _addFetchedObjectWithID:*(void *)(a1 + 40)];
    MEMORY[0x1F41817F8]();
  }
}

- (void)insertSuggestedEventCalendar
{
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__EKEventStore_insertSuggestedEventCalendar__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
}

- (void)requestAccessToEntityType:(EKEntityType)entityType completion:(EKEventStoreRequestAccessCompletionHandler)completion
{
}

- (id)personaIdentifierForDatabaseID:(int)a3
{
  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__23;
    uint64_t v12 = __Block_byref_object_dispose__23;
    id v13 = 0;
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke;
    block[3] = &unk_1E5B96EF8;
    block[4] = self;
    void block[5] = &v8;
    int v7 = a3;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);
    id v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v6)
  {
    int v7 = [*(id *)(a1 + 32) connection];
    uint64_t v8 = [v7 CADOperationProxySync];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2;
    uint64_t v17 = &unk_1E5B99EE0;
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = v9;
    [v8 CADDatabaseGetDefaultCalendarForNewEventsInDelegateSource:v10 withReply:&v14];
  }
  uint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(void *)(a1 + 40), v14, v15, v16, v17, v18);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (id)calendarsForEntityType:(unint64_t)a3 inSource:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = v7;
  if (a3 >= 2)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:2651 description:@"Invalid entity type passed"];
  }
  else if (!a3)
  {
    if ([v7 allowsEvents])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if (![(EKEventStore *)self returnEventResults]) {
        goto LABEL_21;
      }
      uint64_t v18 = [v8 backingObject];
      calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__EKEventStore_calendarsForEntityType_inSource___block_invoke;
      block[3] = &unk_1E5B97190;
      block[4] = self;
      id v27 = v18;
      id v9 = v9;
      id v28 = v9;
      id v10 = v18;
      dispatch_sync(calendarSourcesAndDefaultsQueue, block);

      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (([v8 allowsTasks] & 1) == 0)
  {
LABEL_20:
    id v9 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_21;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (a3 == 1 && [(EKEventStore *)self returnReminderResults])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [(EKReminderStore *)self->_reminderStore calendars];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = [v15 source];
          int v17 = [v16 isEqual:v8];

          if (v17) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v12);
    }
LABEL_19:
  }
LABEL_21:

  return v9;
}

void __65__EKEventStore_cachedConstraintsForEventOrSourceWithCADObjectID___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 _cachedDefaultConstraints];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    uint64_t v6 = [v3 _cachedConstraints];
    uint64_t v7 = [v6 objectForKey:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v10 = *(unsigned char *)(a1 + 56) ? 0 : *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 32) _fetchConstraintsForObjectWithCADObjectID:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v14 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 56))
      {
        objc_msgSend(v14, "set_cachedDefaultConstraints:");
      }
      else
      {
        uint64_t v15 = [v14 _cachedConstraints];

        if (!v15)
        {
          uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
          objc_msgSend(*(id *)(a1 + 32), "set_cachedConstraints:", v16);
        }
        id v17 = [*(id *)(a1 + 32) _cachedConstraints];
        [v17 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
      }
    }
  }
}

- (NSMutableDictionary)_cachedConstraints
{
  return self->__cachedConstraints;
}

- (void)set_cachedConstraints:(id)a3
{
}

- (id)_fetchConstraintsForObjectWithCADObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__23;
  uint64_t v15 = __Block_byref_object_dispose__23;
  id v16 = 0;
  uint64_t v5 = [(EKEventStore *)self connection];
  uint64_t v6 = [v5 CADOperationProxySync];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke;
  v10[3] = &unk_1E5B976B8;
  void v10[4] = &v11;
  [v6 CADObjectGetConstraints:v4 reply:v10];

  uint64_t v7 = [EKSourceConstraints alloc];
  uint64_t v8 = [(EKSourceConstraints *)v7 initWithData:v12[5]];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __48__EKEventStore_calendarsForEntityType_inSource___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadCalendarsIfNeeded];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = *MEMORY[0x1E4F56EA8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 valueForKey:v6];
        if ([v9 isEqual:*(void *)(a1 + 40)])
        {
          uint64_t v10 = [(EKObject *)[EKCalendar alloc] initWithPersistentObject:v8];
          if ([(EKCalendar *)v10 allowedEntityTypes]) {
            [*(id *)(a1 + 48) addObject:v10];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __38__EKEventStore__loadCalendarsIfNeeded__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    uint64_t v10 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_cold_1(v10);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

void __36__EKEventStore__loadSourcesIfNeeded__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    uint64_t v10 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(v10);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

- (void)setTimeZone:(id)a3
{
  if (self->_timeZone != a3)
  {
    self->_timeZone = (NSTimeZone *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

void __35__EKEventStore_objectWithIDExists___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __35__EKEventStore_objectWithIDExists___block_invoke_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void __34__EKEventStore_showDeclinedEvents__block_invoke_2(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __34__EKEventStore_showDeclinedEvents__block_invoke_2_cold_1(v5);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

void __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

void __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)requestAccessToEntityType:(unint64_t)a3 desiredFullAccess:(BOOL)a4 testing:(BOOL)a5 synchronous:(BOOL)a6 reason:(int64_t)a7 completion:(id)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  uint64_t v15 = (void (**)(void, void, void))v14;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_9;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4FA9AF0];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4FA9A30];
  }
  if (*v16)
  {
    int64_t v17 = +[EKEventStore realAuthorizationStatusForEntityType:a3];
    if (v10)
    {
      if (a3 == 1) {
        +[EKEventStore setDenyAccessToReminders:0];
      }
      else {
        +[EKEventStore setDenyAccessToEvents:0];
      }
    }
    id v19 = [(EKEventStore *)self connection];
    uint64_t v20 = v19;
    if (a6)
    {
      uint64_t v18 = [v19 CADOperationProxySync];

      uint64_t v21 = [MEMORY[0x1E4F29060] isMainThread];
    }
    else
    {
      uint64_t v18 = [v19 CADOperationProxy];

      uint64_t v21 = 0;
    }
    long long v22 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = @"write-only";
      if (v11) {
        long long v23 = @"full";
      }
      long long v24 = @"events";
      if (a3) {
        long long v24 = @"reminders";
      }
      *(_DWORD *)buf = 138543618;
      id v31 = v23;
      __int16 v32 = 2114;
      uint64_t v33 = v24;
      _os_log_impl(&dword_1A4E47000, v22, OS_LOG_TYPE_DEFAULT, "Requesting %{public}@ access to %{public}@", buf, 0x16u);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __98__EKEventStore_requestAccessToEntityType_desiredFullAccess_testing_synchronous_reason_completion___block_invoke;
    v25[3] = &unk_1E5B99A38;
    unint64_t v27 = a3;
    int64_t v28 = v17;
    v25[4] = self;
    BOOL v29 = v11;
    uint64_t v26 = v15;
    [v18 CADDatabaseRequestAccessForEntityType:a3 desiredFullAccess:v11 isBlockingUIThread:v21 reason:a7 reply:v25];

LABEL_24:
    goto LABEL_25;
  }
LABEL_9:
  if (v14)
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:27];
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:]();
    }
    ((void (**)(void, void, void *))v15)[2](v15, 0, v18);
    goto LABEL_24;
  }
LABEL_25:
}

+ (int64_t)realAuthorizationStatusForEntityType:(unint64_t)a3
{
  uint64_t v5 = +[EKDaemonConnection anyAvailableDaemonConnection];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    id v6 = [v7 connection];
  }
  if (a3 == 1)
  {
    uint64_t v8 = [v6 remindersAuthorization];
    goto LABEL_8;
  }
  if (!a3)
  {
    uint64_t v8 = [v6 eventAuthorization];
LABEL_8:
    int64_t v9 = v8;
    goto LABEL_10;
  }
  int64_t v9 = 0;
LABEL_10:
  if ([a1 _staticAccessFlagSaysDeniedForEntityType:a3]) {
    int64_t v10 = 2;
  }
  else {
    int64_t v10 = v9;
  }

  return v10;
}

- (id)cachedConstraintsForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 calendar];

  if (v5)
  {
    if ([(EKEventStore *)self eventAccessLevel] == 1)
    {
      id v6 = [v4 CADObjectID];
      uint64_t v7 = [v4 rebasedFrom];
      while ([v6 isTemporary] && v7)
      {
        id v8 = v7;

        int64_t v9 = [(EKEventStore *)self objectsPendingCommit];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __42__EKEventStore_cachedConstraintsForEvent___block_invoke;
        v14[3] = &unk_1E5B9A1B0;
        id v15 = v8;
        id v6 = v8;
        int64_t v10 = [v9 CalFirstObjectPassingTest:v14];

        uint64_t v7 = [v10 rebasedFrom];
      }
      uint64_t v11 = [(EKEventStore *)self cachedConstraintsForEventOrSourceWithCADObjectID:v6];
    }
    else
    {
      id v6 = [v4 calendar];
      uint64_t v7 = [v6 source];
      uint64_t v11 = [(EKEventStore *)self cachedConstraintsForSource:v7];
    }
    long long v12 = (void *)v11;
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 328));
  if ([*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    uint64_t v2 = +[EKPersistentObject allObjectsWithChangesRelatedToObjects:*(void *)(*(void *)(a1[6] + 8) + 40)];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = a1[5];
  uint64_t v7 = [*(id *)(a1[4] + 304) allObjects];
  uint64_t v8 = [v5 _filteredObjectsWithIdentifiers:v6 fromObjects:v7 excludingObjects:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v9 = *(void *)(a1[7] + 8);
  int64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = a1[5];
  long long v13 = [*(id *)(a1[4] + 320) allObjects];
  uint64_t v14 = [v11 _filteredObjectsWithIdentifiers:v12 fromObjects:v13 excludingObjects:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v15 = *(void *)(a1[8] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  int64_t v17 = objc_opt_class();
  uint64_t v18 = a1[5];
  id v22 = [*(id *)(a1[4] + 312) allObjects];
  uint64_t v19 = [v17 _filteredObjectsWithIdentifiers:v18 fromObjects:v22 excludingObjects:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v20 = *(void *)(a1[9] + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

+ (id)_filteredObjectsWithIdentifiers:(id)a3 fromObjects:(id)a4 excludingObjects:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          int64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v18 = [v17 objectID];
          if ([v7 containsObject:v18])
          {
            char v19 = [v10 containsObject:v17];

            if ((v19 & 1) == 0) {
              [v11 addObject:v17];
            }
          }
          else
          {
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    uint64_t v20 = (void *)[v11 copy];
    id v8 = v22;
  }
  else if ([v9 count])
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
    [v20 minusSet:v10];
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  }

  return v20;
}

- (id)occurrenceCacheGetOccurrenceCountsForCalendars:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__23;
  unint64_t v27 = __Block_byref_object_dispose__23;
  id v28 = 0;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        int64_t v10 = [*(id *)(*((void *)&v19 + 1) + 8 * i) CADObjectID];
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [(EKEventStore *)self connection];
  id v12 = [v11 CADOperationProxySync];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke;
  v16[3] = &unk_1E5B986A0;
  id v13 = v5;
  id v17 = v13;
  uint64_t v18 = &v23;
  [v12 CADOccurrenceCacheGetOccurrenceCountsForCalendars:v13 reply:v16];

  id v14 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v14;
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_507(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _markObjectsWithIdentifiersAsCommitted:*(void *)(a1 + 40) excludingObjects:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = [v5 valueForKey:@"objectID"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) _clearEventsNeedingGeocodingWithCommittedObjects:v5];
}

- (BOOL)commitWithRollback:(id *)a3
{
  id v9 = 0;
  BOOL v5 = [(EKEventStore *)self commit:&v9];
  id v6 = v9;
  uint64_t v7 = v6;
  if (!v5)
  {
    if (a3) {
      *a3 = v6;
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore commitWithRollback:]();
    }
    [(EKEventStore *)self rollback];
  }

  return v5;
}

- (BOOL)commit:(NSError *)error
{
  id v10 = 0;
  BOOL v4 = [(EKEventStore *)self _commit:&v10];
  id v5 = v10;
  id v6 = v5;
  if (error) {
    *error = (NSError *)v5;
  }
  uint64_t v7 = EKLogHandle;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Committed successfully", v9, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore commit:]();
  }

  return v4;
}

- (BOOL)canModifyCalendarDatabase
{
  return 1;
}

- (id)_markObjectsWithIdentifiersAsCommitted:(id)a3 excludingObjects:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_unsavedChangesQueue);
  uint64_t v8 = [(id)objc_opt_class() _filteredArrayWithIdentifiers:v6 fromObjects:self->_objectsPendingCommit excludingObjects:v7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v13 markAsCommitted];
        [(NSMutableArray *)self->_objectsPendingCommit removeObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v8;
}

- (void)_fetchAndClearEventsNeedingGeocoding:(id *)a3 withCommittedObjects:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_unsavedChangesQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if (-[NSHashTable containsObject:](self->_eventsNeedsGeocoding, "containsObject:", v13, (void)v15))
          {
            [(NSHashTable *)self->_eventsNeedsGeocoding removeObject:v13];
            if (a3)
            {
              id v14 = *a3;
              if (!*a3)
              {
                id v14 = (id)objc_opt_new();
                *a3 = v14;
              }
              [v14 addObject:v13];
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (BOOL)_commitObjectsWithIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKEventStore _commitObjectsWithIdentifiers:error:]();
  }
  if (a4) {
    *a4 = 0;
  }
  uint64_t v144 = 0;
  v145 = &v144;
  uint64_t v146 = 0x2020000000;
  char v147 = 0;
  if ([(EKEventStore *)self canModifyCalendarDatabase])
  {
    uint64_t v138 = 0;
    v139 = &v138;
    uint64_t v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__23;
    v142 = __Block_byref_object_dispose__23;
    id v143 = 0;
    uint64_t v132 = 0;
    v133 = &v132;
    uint64_t v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__23;
    v136 = __Block_byref_object_dispose__23;
    id v137 = 0;
    uint64_t v126 = 0;
    v127 = &v126;
    uint64_t v128 = 0x3032000000;
    v129 = __Block_byref_object_copy__23;
    v130 = __Block_byref_object_dispose__23;
    id v131 = 0;
    v124[0] = 0;
    v124[1] = v124;
    v124[2] = 0x3032000000;
    v124[3] = __Block_byref_object_copy__23;
    v124[4] = __Block_byref_object_dispose__23;
    id v125 = 0;
    unsavedChangesQueue = self->_unsavedChangesQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke;
    block[3] = &unk_1E5B9A1D8;
    v120 = v124;
    block[4] = self;
    v121 = &v138;
    id v6 = v58;
    id v119 = v6;
    v122 = &v132;
    v123 = &v126;
    dispatch_sync(unsavedChangesQueue, block);
    if ([(id)v139[5] count] || objc_msgSend((id)v133[5], "count") || objc_msgSend((id)v127[5], "count"))
    {
      uint64_t v56 = v6;
      v57 = a4;
      id v7 = (id)EKLogHandle;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = [(id)v139[5] count];
        int v9 = [(id)v133[5] count];
        int v10 = [(id)v127[5] count];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v8;
        LOWORD(v158) = 1024;
        *(_DWORD *)((char *)&v158 + 2) = v9;
        HIWORD(v158) = 1024;
        LODWORD(v159) = v10;
        _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_INFO, "Committing with %d insertions, %d updates, %d deletions", buf, 0x14u);
      }

      *(void *)buf = 0;
      v158 = buf;
      uint64_t v159 = 0x3032000000;
      v160 = __Block_byref_object_copy__23;
      v161 = __Block_byref_object_dispose__23;
      id v162 = (id)objc_opt_new();
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v11 = (id)v127[5];
      char v12 = 0;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v110 objects:v156 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v111;
        uint64_t v59 = 136315394;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v111 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v110 + 1) + 8 * v15);
            long long v17 = objc_opt_class();
            id v109 = 0;
            int v18 = [v17 _isConfirmedSuggestedEvent:v16 uniqueKey:&v109];
            id v19 = v109;
            if (v18)
            {
              uint64_t v20 = EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v150 = 136315394;
                *(void *)&v150[4] = "-[EKEventStore _commitObjectsWithIdentifiers:error:]";
                *(_WORD *)&v150[12] = 2112;
                *(void *)&v150[14] = v16;
                _os_log_debug_impl(&dword_1A4E47000, v20, OS_LOG_TYPE_DEBUG, "%s - Notifying suggestions we have deleted previously confirmed event %@", v150, 0x16u);
              }
              long long v21 = [(objc_class *)[(EKEventStore *)self _SGSuggestionsServiceClass] serviceForEvents];
              v107[0] = MEMORY[0x1E4F143A8];
              v107[1] = 3221225472;
              v107[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_508;
              v107[3] = &unk_1E5B9A050;
              id v22 = v21;
              id v108 = v22;
              [v22 eventFromUniqueId:v19 withCompletion:v107];
            }
            uint64_t v23 = [(id)objc_opt_class() _iMIPScheduledEvent:v16];
            if (v23
              && +[EKiMIPCancel shouldSendEmailForEvent:v23 removedAttendees:0])
            {
              long long v24 = [EKiMIPCancel alloc];
              uint64_t v25 = [v23 attendees];
              long long v26 = [(EKiMIPCancel *)v24 initWithEvent:v23 andAttendees:v25];

              [*((id *)v158 + 5) addObject:v26];
            }
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            v12 |= isKindOfClass;
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v110 objects:v156 count:16];
        }
        while (v13);
      }

      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_512;
      v106[3] = &unk_1E5B9A200;
      v106[4] = self;
      v106[5] = buf;
      id v28 = (void (**)(void, void))MEMORY[0x1A6266730](v106);
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v29 = (id)v139[5];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v102 objects:v155 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v103;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v103 != v31) {
              objc_enumerationMutation(v29);
            }
            v28[2](v28, *(void *)(*((void *)&v102 + 1) + 8 * i));
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v102 objects:v155 count:16];
        }
        while (v30);
      }

      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id obj = (id)v133[5];
      uint64_t v33 = [obj countByEnumeratingWithState:&v98 objects:v154 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v99;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v99 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v36 = *(void *)(*((void *)&v98 + 1) + 8 * j);
            if (v12)
            {
              id v37 = [(id)objc_opt_class() _iMIPScheduledEvent:v36];
              id v97 = 0;
              BOOL v38 = +[EKiMIPCancel shouldSendEmailForEvent:v37 removedAttendees:&v97];
              id v39 = v97;
              if (v38)
              {
                uint64_t v40 = [EKiMIPCancel alloc];
                id v41 = v39;
                if (!v39)
                {
                  uint64_t v59 = [v37 attendees];
                  id v41 = (id)v59;
                }
                uint64_t v42 = [(EKiMIPCancel *)v40 initWithEvent:v37 andAttendees:v41];
                if (!v39) {

                }
                [*((id *)v158 + 5) addObject:v42];
              }
            }
            v28[2](v28, v36);
          }
          uint64_t v33 = [obj countByEnumeratingWithState:&v98 objects:v154 count:16];
        }
        while (v33);
      }

      *(void *)v150 = 0;
      *(void *)&v150[8] = v150;
      *(void *)&v150[16] = 0x3032000000;
      v151 = __Block_byref_object_copy__23;
      v152 = __Block_byref_object_dispose__23;
      id v153 = 0;
      uint64_t v91 = 0;
      v92 = &v91;
      uint64_t v93 = 0x3032000000;
      v94 = __Block_byref_object_copy__23;
      v95 = __Block_byref_object_dispose__23;
      id v96 = 0;
      v89[0] = 0;
      v89[1] = v89;
      v89[2] = 0x3032000000;
      v89[3] = __Block_byref_object_copy__23;
      v89[4] = __Block_byref_object_dispose__23;
      id v90 = 0;
      v87[0] = 0;
      v87[1] = v87;
      v87[2] = 0x3032000000;
      v87[3] = __Block_byref_object_copy__23;
      v87[4] = __Block_byref_object_dispose__23;
      id v88 = 0;
      v85[0] = 0;
      v85[1] = v85;
      v85[2] = 0x3032000000;
      v85[3] = __Block_byref_object_copy__23;
      v85[4] = __Block_byref_object_dispose__23;
      id v86 = 0;
      v83[0] = 0;
      v83[1] = v83;
      v83[2] = 0x2020000000;
      char v84 = 0;
      dbChangedQueue = self->_dbChangedQueue;
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_517;
      v70[3] = &unk_1E5B9A2A0;
      v70[4] = self;
      v72 = &v138;
      v73 = &v132;
      id v74 = &v126;
      id v75 = &v91;
      v76 = v87;
      v77 = v85;
      id v78 = v89;
      v79 = v83;
      id v71 = v56;
      id v80 = v124;
      v81 = v150;
      id v82 = &v144;
      dispatch_sync(dbChangedQueue, v70);
      if (v57) {
        id *v57 = (id) v92[5];
      }
      if (*((unsigned char *)v145 + 24))
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v44 = *((id *)v158 + 5);
        uint64_t v45 = [v44 countByEnumeratingWithState:&v66 objects:v149 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v67;
          do
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v67 != v46) {
                objc_enumerationMutation(v44);
              }
              [*(id *)(*((void *)&v66 + 1) + 8 * k) sendEmail];
            }
            uint64_t v45 = [v44 countByEnumeratingWithState:&v66 objects:v149 count:16];
          }
          while (v45);
        }

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v48 = *(id *)(*(void *)&v150[8] + 40);
        uint64_t v49 = [v48 countByEnumeratingWithState:&v62 objects:v148 count:16];
        if (v49)
        {
          uint64_t v50 = *(void *)v63;
          do
          {
            for (uint64_t m = 0; m != v49; ++m)
            {
              if (*(void *)v63 != v50) {
                objc_enumerationMutation(v48);
              }
              +[EKMapsUtilities geocodeEventIfNeeded:*(void *)(*((void *)&v62 + 1) + 8 * m)];
            }
            uint64_t v49 = [v48 countByEnumeratingWithState:&v62 objects:v148 count:16];
          }
          while (v49);
        }

        BOOL v52 = *((unsigned char *)v145 + 24) != 0;
      }
      else
      {
        BOOL v52 = 0;
      }

      _Block_object_dispose(v83, 8);
      _Block_object_dispose(v85, 8);

      _Block_object_dispose(v87, 8);
      _Block_object_dispose(v89, 8);

      _Block_object_dispose(&v91, 8);
      _Block_object_dispose(v150, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v54 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E47000, v54, OS_LOG_TYPE_INFO, "Nothing to commit. Bailing early.", buf, 2u);
      }
      *(void *)buf = 0;
      v158 = buf;
      uint64_t v159 = 0x3032000000;
      v160 = __Block_byref_object_copy__23;
      v161 = __Block_byref_object_dispose__23;
      id v162 = 0;
      __int16 v55 = self->_unsavedChangesQueue;
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_507;
      v114[3] = &unk_1E5B98EE8;
      v114[4] = self;
      id v115 = v6;
      v116 = v124;
      v117 = buf;
      dispatch_sync(v55, v114);
      if ([*((id *)v158 + 5) count]) {
        [(EKEventStore *)self _postEventStoreChangedNotificationWithChangeType:1 changedObjectIDs:*((void *)v158 + 5) forceImmediate:1];
      }

      _Block_object_dispose(buf, 8);
      BOOL v52 = 1;
    }

    _Block_object_dispose(v124, 8);
    _Block_object_dispose(&v126, 8);

    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(&v138, 8);
  }
  else
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:30];
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEventStore _commitObjectsWithIdentifiers:error:]();
    }
    BOOL v52 = 0;
  }
  _Block_object_dispose(&v144, 8);

  return v52;
}

- (BOOL)_commit:(id *)a3
{
  BOOL v5 = [(EKEventStore *)self returnEventResults];
  if (v5
    && ![(EKEventStore *)self _commitObjectsWithIdentifiers:0 error:a3])
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (![(EKEventStore *)self returnReminderResults])
  {
    if (a3) {
      char v8 = v5;
    }
    else {
      char v8 = 1;
    }
    if ((v8 & 1) == 0)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:29];
      LOBYTE(v5) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return v5;
  }
  reminderStore = self->_reminderStore;

  return [(EKReminderStore *)reminderStore commit:a3];
}

- (void)_clearEventsNeedingGeocodingWithCommittedObjects:(id)a3
{
}

+ (id)_filteredArrayWithIdentifiers:(id)a3 fromObjects:(id)a4 excludingObjects:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v21 = v8;
    id v22 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "objectID", v21);
          if ([v7 containsObject:v16])
          {
            long long v17 = [v15 frozenObject];
            char v18 = [v9 containsObject:v17];

            if ((v18 & 1) == 0) {
              [v22 addObject:v15];
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    id v19 = (void *)[v22 copy];
    id v8 = v21;
  }
  else
  {
    id v19 = (void *)[v8 copy];
  }

  return v19;
}

- (id)combineEventCalendars:(id)a3 withReminderCalendars:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    if ([v5 count])
    {
      id v7 = [v5 arrayByAddingObjectsFromArray:v6];
    }
    else
    {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (id)eventSourceForReminderSource:(id)a3
{
  BOOL v4 = [a3 sourceIdentifier];
  id v5 = [(EKEventStore *)self eventSourceIDForReminderSourceID:v4];

  if (v5)
  {
    id v6 = [(EKEventStore *)self sourceWithIdentifier:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)eventSourceIDForReminderSourceID:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventStore *)self reminderSourceMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)reminderSourceMap
{
  id v4 = 0;
  [(EKEventStore *)self getMapsWithReminderSourceMap:&v4 eventSourceMap:0];
  id v2 = v4;

  return v2;
}

- (BOOL)restoreGenerationChanged
{
  id v2 = self;
  p_flagsLocuint64_t k = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LOBYTE(v2) = *(unsigned char *)&v2->_flags & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)setRestoreGenerationChanged:(BOOL)a3
{
  p_flagsLocuint64_t k = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;

  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)setRestoreGenerationChangedAndGetPreviousValue:(BOOL)a3
{
  p_flagsLocuint64_t k = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags & 0xFE | a3;
  os_unfair_lock_unlock(p_flagsLock);
  return flags & 1;
}

+ (id)reminderStoreContainerTokenProvider
{
  id v2 = (void *)MEMORY[0x1A6266730](_reminderStoreContainerTokenProvider, a2);

  return v2;
}

+ (void)setReminderStoreContainerTokenProvider:(id)a3
{
  _reminderStoreContainerTokenProvider = MEMORY[0x1A6266730](a3, a2);

  MEMORY[0x1F41817F8]();
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 sources:(id)a5
{
  id v8 = a4;
  id v9 = [a5 valueForKey:@"sourceIdentifier"];
  id v10 = [(EKEventStore *)self initWithEKOptions:a3 path:v8 changeTrackingClientId:0 enablePropertyModificationLogging:1 allowDelegateSources:1 allowedSourceIdentifiers:v9];

  return v10;
}

- (EKEventStore)initWithSources:(NSArray *)sources
{
  return [(EKEventStore *)self initWithEKOptions:0 path:0 sources:sources];
}

- (EKEventStore)initWithBirthdayCalendarModifications
{
  uint64_t result = [(EKEventStore *)self initWithEKOptions:4 path:0 changeTrackingClientId:0 enablePropertyModificationLogging:0 allowDelegateSources:1];
  if (result) {
    result->_allowsBirthdayCalendarModifications = 1;
  }
  return result;
}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained dataProtectionObserver];
    char v4 = [v3 dataIsAccessible];

    BOOL v5 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v5) {
        __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_1();
      }
      [v2 _accessStatusChanged];
    }
    else if (v5)
    {
      __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_2();
    }
  }
}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  char v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _postEventStoreChangedNotificationWithTags:v6 context:v5];
}

double __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _throttleDelayForEventStoreChangedNotificationWithTags:v6 context:v5];
  double v9 = v8;

  return v9;
}

- (EKEventStore)initWithOptions:(int)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = [(EKEventStore *)self initWithEKOptions:+[EKEventStore ekEventStoreInitOptionsFromCalDatabaseInitOptions:v10] path:v13 changeTrackingClientId:v12 enablePropertyModificationLogging:v8 allowDelegateSources:v7];

  return v14;
}

void __23__EKEventStore_dealloc__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __23__EKEventStore_dealloc__block_invoke_cold_1(v2);
    }
  }
}

+ (EKAuthorizationStatus)authorizationStatusForEntityType:(EKEntityType)entityType
{
  EKAuthorizationStatus v3 = [a1 realAuthorizationStatusForEntityType:entityType];
  if (v3 == EKAuthorizationStatusWriteOnly && (_shouldUseLegacyAccessBehavior() & 1) != 0) {
    return 3;
  }
  return v3;
}

+ (BOOL)_staticAccessFlagSaysDeniedForEntityType:(unint64_t)a3
{
  if (!a3 && denyAccessToEvents) {
    return 1;
  }
  return a3 == 1 && denyAccessToReminders != 0;
}

+ (int64_t)authorizationStatusWithAuditToken:(id *)a3 entityType:(unint64_t)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return 0;
    }
    char v4 = (void *)MEMORY[0x1E4FA9AF0];
  }
  else
  {
    char v4 = (void *)MEMORY[0x1E4FA9A30];
  }
  if (!*v4) {
    return 0;
  }
  uint64_t v5 = tcc_authorization_check_audit_token();
  int64_t result = 3;
  switch(v5)
  {
    case 0:
      if (TCCAccessRestricted()) {
        int64_t result = 1;
      }
      else {
        int64_t result = 2;
      }
      break;
    case 1:
      int64_t result = TCCAccessRestricted() != 0;
      break;
    case 2:
      return result;
    case 4:
      int64_t result = 4;
      break;
    default:
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKEventStore authorizationStatusWithAuditToken:entityType:]();
      }
      int64_t result = 2;
      break;
  }
  return result;
}

- (void)_implicitlyRequestEventAccessForOlderApps
{
  if (+[EKEventStore realAuthorizationStatusForEntityType:0] <= 2)
  {
    [(EKEventStore *)self requestWriteOnlyAccessToEventsWithCompletion:&__block_literal_global_207];
  }
}

- (void)requestFullAccessToEventsWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion
{
}

- (void)requestWriteOnlyAccessToEventsWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion
{
}

- (void)requestFullAccessToRemindersWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion
{
}

void __98__EKEventStore_requestAccessToEntityType_desiredFullAccess_testing_synchronous_reason_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109376;
    int v11 = a3;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_DEFAULT, "Access request result: %d, error = %d", (uint8_t *)&v10, 0xEu);
  }
  if (+[EKEventStore _staticAccessFlagSaysDeniedForEntityType:*(void *)(a1 + 48)])
  {
    BOOL v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      a3 = 2;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Coercing access request result to denied due to static access flags", (uint8_t *)&v10, 2u);
    }
    else
    {
      a3 = 2;
    }
  }
  if (*(void *)(a1 + 56) != a3) {
    [*(id *)(a1 + 32) _accessStatusChanged];
  }
  if (*(unsigned char *)(a1 + 64) && (_shouldUseLegacyAccessBehavior() & 1) == 0) {
    BOOL v8 = a3 == 3;
  }
  else {
    BOOL v8 = a3 > 2;
  }
  if (*(void *)(a1 + 40))
  {
    double v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      int v11 = v8;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "Calling request access completion handler with result: %{BOOL}d", (uint8_t *)&v10, 8u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_accessStatusChanged
{
  [(EKEventStore *)self reset];
  [(EKAuthStatusChecker *)self->_authStatusChecker clearCachedAuthStatus];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EKEventStore__accessStatusChanged__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __36__EKEventStore__accessStatusChanged__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"EKEventStoreChangedNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (NSString)databasePath
{
  id v2 = [(CADDatabaseInitializationOptions *)self->_initializationOptions databaseDirectory];
  EKAuthorizationStatus v3 = [v2 path];

  return (NSString *)v3;
}

- (BOOL)allowDelegateSources
{
  return [(CADDatabaseInitializationOptions *)self->_initializationOptions allowDelegateSources];
}

+ (void)setDenyAccessToEvents:(BOOL)a3
{
  denyAccessToEvents = a3;
}

+ (void)setDenyAccessToReminders:(BOOL)a3
{
  denyAccessToReminders = a3;
}

- (void)setSourceAccountManagement:(int)a3
{
}

- (void)setSourceAccountManagement:(int)a3 withBundleID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  initializationOptions = self->_initializationOptions;
  id v7 = a4;
  [(CADDatabaseInitializationOptions *)initializationOptions setManagement:v4];
  [(CADDatabaseInitializationOptions *)self->_initializationOptions setManagementBundleIdentifier:v7];

  BOOL v8 = self->_initializationOptions;
  id v9 = [(EKEventStore *)self connection];
  [v9 setInitializationOptions:v8];
}

- (void)setRemoteClientIdentity:(id)a3
{
  [(CADDatabaseInitializationOptions *)self->_initializationOptions setRemoteClientIdentity:a3];
  initializationOptions = self->_initializationOptions;
  id v5 = [(EKEventStore *)self connection];
  [v5 setInitializationOptions:initializationOptions];
}

- (void)_setIsUnitTesting:(BOOL)a3
{
  uint64_t v4 = 4096;
  if (!a3) {
    uint64_t v4 = 0;
  }
  self->_options = self->_options & 0xFFFFFFFFFFFFEFFFLL | v4;
  -[CADDatabaseInitializationOptions setUnitTesting:](self->_initializationOptions, "setUnitTesting:");
  initializationOptions = self->_initializationOptions;
  id v6 = [(EKEventStore *)self connection];
  [v6 setInitializationOptions:initializationOptions];

  [(EKEventStore *)self _updateDefaultDelayForThrottleEventStoreChangedNotifications];
}

- (BOOL)_isUnitTesting
{
  return [(CADDatabaseInitializationOptions *)self->_initializationOptions unitTesting];
}

- (void)setPrivacyClientIdentity:(id)a3
{
  [(CADDatabaseInitializationOptions *)self->_initializationOptions setPrivacyClientIdentity:a3];
  initializationOptions = self->_initializationOptions;
  id v5 = [(EKEventStore *)self connection];
  [v5 setInitializationOptions:initializationOptions];
}

- (void)_simulateDaemonCrashForUnitTests
{
  id v3 = [(EKEventStore *)self connection];
  id v2 = [v3 CADOperationProxySync];
  [v2 CADTestingSimulateDaemonCrash];
}

- (void)_setMockPermissions:(id)a3
{
  id v8 = a3;
  id v4 = [(CADDatabaseInitializationOptions *)self->_initializationOptions mockPermissions];

  id v5 = v8;
  if (v4 != v8)
  {
    [(CADDatabaseInitializationOptions *)self->_initializationOptions setMockPermissions:v8];
    initializationOptions = self->_initializationOptions;
    id v7 = [(EKEventStore *)self connection];
    [v7 setInitializationOptions:initializationOptions];

    id v5 = v8;
  }
}

- (int)sequenceNumber
{
  id v2 = [(EKEventStore *)self sequenceToken];
  int v3 = [v2 sequenceForDatabaseID:*MEMORY[0x1E4F574B8]];

  return v3;
}

- (id)sequenceToken
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__23;
  int v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  id v2 = [(EKEventStore *)self connection];
  int v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__EKEventStore_sequenceToken__block_invoke;
  v6[3] = &unk_1E5B99A60;
  v6[4] = &v7;
  [v3 CADDatabaseGetSequenceToken:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__EKEventStore_sequenceToken__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __29__EKEventStore_sequenceToken__block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (void)changesSinceSequenceToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EKEventStore *)self connection];
  uint64_t v9 = [v8 CADOperationProxySync];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke;
  v11[3] = &unk_1E5B99A88;
  id v12 = v6;
  id v10 = v6;
  [v9 CADDatabaseGetChangesSinceSequenceToken:v7 reply:v11];
}

void __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    uint64_t v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke_cold_1(v9);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_invalidCADObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__23;
  long long v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  if (v4 && [v4 count])
  {
    id v6 = [(EKEventStore *)self connection];
    id v7 = [v6 CADOperationProxySync];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__EKEventStore__invalidCADObjectIDs___block_invoke;
    v10[3] = &unk_1E5B99AB0;
    id v12 = &v13;
    id v11 = v5;
    [v7 CADObjectsExist:v11 reply:v10];
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    -[EKEventStore _invalidCADObjectIDs:]();
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __37__EKEventStore__invalidCADObjectIDs___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (a2 == 1010)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_2();
      }
      uint64_t v7 = [*(id *)(a1 + 32) copy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      id v10 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_1(v10);
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)handleExternalDatabaseChangeNotification:(id)a3
{
}

- (void)_handleExternalDatabaseChangedNotificationAsynchronously:(id)a3
{
}

- (void)_handleExternalDatabaseChangeNotification:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (_handleExternalDatabaseChangeNotification_synchronously__onceToken != -1) {
    dispatch_once(&_handleExternalDatabaseChangeNotification_synchronously__onceToken, &__block_literal_global_225);
  }
  uint64_t v7 = [(id)_handleExternalDatabaseChangeNotification_synchronously__notificationToAction objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, EKEventStore *, BOOL))(v7 + 16))(v7, self, v4);
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _handleExternalDatabaseChangeNotification:synchronously:]();
  }
}

void __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke()
{
  void v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F574B0];
  v5[0] = *MEMORY[0x1E4F574A0];
  v5[1] = v0;
  v6[0] = &__block_literal_global_228;
  v6[1] = &__block_literal_global_230;
  uint64_t v1 = *MEMORY[0x1E4F574F8];
  v5[2] = *MEMORY[0x1E4F574A8];
  void v5[3] = v1;
  v6[2] = &__block_literal_global_232;
  v6[3] = &__block_literal_global_234;
  uint64_t v2 = *MEMORY[0x1E4F56A70];
  v5[4] = @"com.apple.calendar.defaultAlarmChangedNotification";
  v5[5] = v2;
  v6[4] = &__block_literal_global_236;
  void v6[5] = &__block_literal_global_238;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  BOOL v4 = (void *)_handleExternalDatabaseChangeNotification_synchronously__notificationToAction;
  _handleExternalDatabaseChangeNotification_synchronously__notificationToAction = v3;
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _databaseChangedExternally:1 processSynchronously:a3];
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _databaseChangedExternally:2 processSynchronously:a3];
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _databaseChangedExternally:1 processSynchronously:a3];
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 _defaultCalendarChangedExternally];
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 _defaultAlarmChangedExternally];
}

void __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  id v4 = [v2 defaultCenter];
  [v4 postNotificationName:@"EKEventStoreIdleChangeTrackingClientWasPurgedNotification" object:v3];
}

- (void)_databaseChangedExternally:(unint64_t)a3 processSynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  if (([(CADDatabaseInitializationOptions *)self->_initializationOptions databaseInitOptions] & 4) == 0
    && [(EKEventStore *)self eventAccessLevel] == 2)
  {
    uint64_t v7 = [(EKEventStore *)self connection];
    char v8 = [v7 hasEverConnected];

    if (v8)
    {
      if ([(EKEventStore *)self returnEventResults])
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke;
        v11[3] = &unk_1E5B96E08;
        void v11[4] = self;
        uint64_t v9 = (void *)MEMORY[0x1A6266730](v11);
        dbChangedQueue = self->_dbChangedQueue;
        if (v4) {
          dispatch_sync(dbChangedQueue, v9);
        }
        else {
          dispatch_async(dbChangedQueue, v9);
        }
      }
    }
    else
    {
      [(EKEventStore *)self _postEventStoreChangedNotificationWithChangeType:a3 changedObjectIDs:0 forceImmediate:0];
    }
  }
}

void __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke(uint64_t a1)
{
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__23;
  unint64_t v27 = __Block_byref_object_dispose__23;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__23;
  id v21 = __Block_byref_object_dispose__23;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__23;
  uint64_t v15 = __Block_byref_object_dispose__23;
  id v16 = 0;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 CADOperationProxySync];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 352);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2;
  v6[3] = &unk_1E5B99AF8;
  v6[4] = v4;
  void v6[5] = &v17;
  void v6[6] = &v11;
  void v6[7] = &v23;
  v6[8] = &v7;
  [v3 CADDatabaseGetChangedEntityIDsSinceTimestamp:v5 reply:v6];

  [*(id *)(a1 + 32) _processExternalChangesWithLatestTimestamp:v24[5] changedObjectIDsData:v18[5] deletedObjectIDOffsets:v12[5] changesWereSyncStatusOnly:*((unsigned __int8 *)v8 + 24) forceImmediateNotification:0];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2(void *a1, int a2, void *a3, void *a4, void *a5, char a6)
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a2)
  {
    uint64_t v15 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2_cold_1((uint64_t)a1, v15);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a5);
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = a6;
  }
}

+ (void)EKObjectIDsFromData:(id)a3 deletedObjectIDOffsets:(id)a4 outChangedIDs:(id *)a5 outDeletedIDs:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        id v16 = [v7 objectForKeyedSubscript:v15];
        uint64_t v17 = [v8 objectForKeyedSubscript:v15];
        uint64_t v18 = [v17 unsignedIntegerValue];
        v12 += v18;
        unint64_t v11 = v11 - v18 + ((unint64_t)[v16 length] >> 3);
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v7;
  uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v46;
    id v39 = v8;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        uint64_t v23 = [obj objectForKeyedSubscript:v22];
        id v44 = [v8 objectForKeyedSubscript:v22];
        uint64_t v24 = [v44 unsignedIntegerValue];
        unint64_t v42 = [v23 length];
        uint64_t v25 = [v22 intValue];
        id v43 = v23;
        uint64_t v26 = [v43 bytes];
        uint64_t v27 = v26;
        unint64_t v28 = v24;
        if (v24)
        {
          id v29 = (unsigned int *)(v26 + 4);
          do
          {
            uint64_t v30 = +[EKObjectID objectIDWithEntityType:*(v29 - 1) rowID:*v29 databaseID:v25];
            [v19 addObject:v30];

            v29 += 2;
            --v24;
          }
          while (v24);
        }
        unint64_t v31 = (v42 >> 3) - v28;
        if (v42 >> 3 > v28)
        {
          __int16 v32 = (unsigned int *)(v27 + 8 * v28 + 4);
          do
          {
            uint64_t v33 = +[EKObjectID objectIDWithEntityType:*(v32 - 1) rowID:*v32 databaseID:v25];
            [v20 addObject:v33];

            v32 += 2;
            --v31;
          }
          while (v31);
        }

        id v8 = v39;
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v40);
  }

  id v34 = v19;
  *a5 = v34;
  id v35 = v20;
  *a6 = v35;
}

- (void)_processExternalChangesWithLatestTimestamp:(id)a3 changedObjectIDsData:(id)a4 deletedObjectIDOffsets:(id)a5 changesWereSyncStatusOnly:(BOOL)a6 forceImmediateNotification:(BOOL)a7
{
  BOOL v63 = a7;
  BOOL v64 = a6;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v67 = a4;
  id v66 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbChangedQueue);
  long long v65 = v11;
  if (v11) {
    objc_storeStrong((id *)&self->_lastDatabaseNotificationTimestamp, a3);
  }
  if ([(EKEventStore *)self setRestoreGenerationChangedAndGetPreviousValue:0])
  {
    [(EKEventStore *)self _resetAndNotifyAfterDatabaseRestoreGenerationChanged];
  }
  else
  {
    if (v67)
    {
      uint64_t v116 = 0;
      uint64_t v115 = 0;
      +[EKEventStore EKObjectIDsFromData:deletedObjectIDOffsets:outChangedIDs:outDeletedIDs:](EKEventStore, "EKObjectIDsFromData:deletedObjectIDOffsets:outChangedIDs:outDeletedIDs:");
      unint64_t v12 = (unint64_t)0;
      unint64_t v13 = (unint64_t)0;
      id v71 = (void *)v12;
      if (!(v12 | v13)) {
        goto LABEL_70;
      }
      id v14 = (void *)v13;
    }
    else
    {
      uint64_t v109 = 0;
      long long v110 = &v109;
      uint64_t v111 = 0x3032000000;
      long long v112 = __Block_byref_object_copy__23;
      long long v113 = __Block_byref_object_dispose__23;
      id v114 = 0;
      registeredQueue = self->_registeredQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke;
      block[3] = &unk_1E5B96F20;
      void block[5] = &v109;
      block[4] = self;
      dispatch_sync(registeredQueue, block);
      id v16 = [(id)v110[5] valueForKey:@"CADObjectID"];
      v72 = [(EKEventStore *)self _invalidCADObjectIDs:v16];
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
      id v71 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count") - objc_msgSend(v72, "count"));
      id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v72, "count"));
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v104 objects:v123 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v105;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v105 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void *)(*((void *)&v104 + 1) + 8 * i);
            uint64_t v23 = +[EKObjectID objectIDWithCADObjectID:v22];
            if ([v17 containsObject:v22]) {
              uint64_t v24 = v14;
            }
            else {
              uint64_t v24 = v71;
            }
            [v24 addObject:v23];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v104 objects:v123 count:16];
        }
        while (v19);
      }

      _Block_object_dispose(&v109, 8);
    }
    int v73 = [(EKEventStore *)self eventAccessLevel];
    uint64_t v100 = 0;
    long long v101 = &v100;
    uint64_t v102 = 0x2020000000;
    char v103 = 0;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id obj = v14;
    uint64_t v25 = [obj countByEnumeratingWithState:&v96 objects:v122 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v97;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v97 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v96 + 1) + 8 * j);
          uint64_t v109 = 0;
          long long v110 = &v109;
          uint64_t v111 = 0x3032000000;
          long long v112 = __Block_byref_object_copy__23;
          long long v113 = __Block_byref_object_dispose__23;
          id v114 = 0;
          id v29 = self->_registeredQueue;
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_2;
          v95[3] = &unk_1E5B97028;
          v95[6] = &v109;
          v95[4] = self;
          v95[5] = v28;
          dispatch_sync(v29, v95);
          uint64_t v30 = (void *)v110[5];
          if (v30 && ([v30 isNew] & 1) == 0)
          {
            [(EKEventStore *)self _cacheDeletedEventIdentifierIfNeededForObject:v110[5]];
            calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_3;
            v93[3] = &unk_1E5B99B20;
            v93[4] = self;
            v93[5] = &v109;
            int v94 = v73;
            v93[6] = &v100;
            dispatch_sync(calendarSourcesAndDefaultsQueue, v93);
            unsavedChangesQueue = self->_unsavedChangesQueue;
            v92[0] = MEMORY[0x1E4F143A8];
            v92[1] = 3221225472;
            v92[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_4;
            v92[3] = &unk_1E5B96E30;
            v92[4] = self;
            v92[5] = &v109;
            dispatch_sync(unsavedChangesQueue, v92);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            uint64_t v34 = v110[5];
            if (isKindOfClass) {
              [(EKEventStore *)self _detachObject:v34];
            }
            else {
              [(EKEventStore *)self _unregisterObject:v34];
            }
          }
          _Block_object_dispose(&v109, 8);
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v96 objects:v122 count:16];
      }
      while (v25);
    }

    id v35 = self->_unsavedChangesQueue;
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_5;
    v89[3] = &unk_1E5B97140;
    id v69 = obj;
    id v90 = v69;
    uint64_t v91 = self;
    dispatch_sync(v35, v89);
    uint64_t v109 = 0;
    long long v110 = &v109;
    uint64_t v111 = 0x3032000000;
    long long v112 = __Block_byref_object_copy__23;
    long long v113 = __Block_byref_object_dispose__23;
    id v114 = 0;
    uint64_t v36 = self->_registeredQueue;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_6;
    v85[3] = &unk_1E5B971B8;
    BOOL v88 = v67 != 0;
    v87 = &v109;
    v85[4] = self;
    id v37 = v71;
    id v86 = v37;
    dispatch_sync(v36, v85);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v38 = (id)v110[5];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v121 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v82;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v82 != v40) {
            objc_enumerationMutation(v38);
          }
          unint64_t v42 = *(void **)(*((void *)&v81 + 1) + 8 * k);
          id v43 = (void *)MEMORY[0x1A62664B0]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 && ([v42 isNew] & 1) == 0)
          {
            [v42 refresh];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & (v73 != 1)) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & (v73 == 1)) == 1))
            {
              id v44 = [v42 CADObjectID];
              [(EKEventStore *)self _clearCachedConstraintsForObjectWithCADObjectID:v44];
            }
          }
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v121 count:16];
      }
      while (v39);
    }

    long long v45 = self->_calendarSourcesAndDefaultsQueue;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_7;
    v77[3] = &unk_1E5B99B48;
    BOOL v80 = v67 != 0;
    void v77[4] = self;
    id v74 = v37;
    id v78 = v74;
    v79 = &v100;
    dispatch_sync(v45, v77);
    if (*((unsigned char *)v101 + 24)) {
      [(EKEventStore *)self invalidateReminderSourceMaps];
    }
    long long v68 = [(EKEventStore *)self _checkPendingIntegrationEvents:v74 changedIDsValid:v67 != 0];
    databaseWaitCallbacks = self->_databaseWaitCallbacks;
    if (databaseWaitCallbacks && [(NSMutableArray *)databaseWaitCallbacks count])
    {
      long long v47 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E47000, v47, OS_LOG_TYPE_DEFAULT, "EKEventStore - Should loop _databaseWaitCallbacks", buf, 2u);
      }
      long long v48 = (void *)[(NSMutableArray *)self->_databaseWaitCallbacks copy];
      long long v49 = (void *)[(NSMutableArray *)self->_databaseWaitTimestamps copy];
      for (unint64_t m = 0; m < [v48 count]; ++m)
      {
        long long v51 = [v48 objectAtIndexedSubscript:m];
        long long v52 = [v49 objectAtIndexedSubscript:m];
        int v53 = [MEMORY[0x1E4F56998] doesTimestamp:self->_lastDatabaseNotificationTimestamp includeAllChangesVisibleToTimestamp:v52];
        v54 = EKLogHandle;
        BOOL v55 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT);
        if (v53)
        {
          if (v55)
          {
            *(_DWORD *)buf = 138412290;
            v118 = v52;
            _os_log_impl(&dword_1A4E47000, v54, OS_LOG_TYPE_DEFAULT, "Triggering database wait callback for timestamp: %@", buf, 0xCu);
          }
          uint64_t v56 = self->_databaseWaitCallbacks;
          v57 = (void *)MEMORY[0x1A6266730](v51);
          [(NSMutableArray *)v56 removeObject:v57];

          [(NSMutableArray *)self->_databaseWaitTimestamps removeObject:v52];
          v75[0] = MEMORY[0x1E4F143A8];
          v75[1] = 3221225472;
          v75[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_248;
          v75[3] = &unk_1E5B984B0;
          id v76 = v51;
          dispatch_async(MEMORY[0x1E4F14428], v75);
        }
        else if (v55)
        {
          lastDatabaseNotificationTimestamp = self->_lastDatabaseNotificationTimestamp;
          *(_DWORD *)buf = 138412546;
          v118 = lastDatabaseNotificationTimestamp;
          __int16 v119 = 2112;
          v120 = v52;
          _os_log_impl(&dword_1A4E47000, v54, OS_LOG_TYPE_DEFAULT, "Timestamp after DB refresh is still older than timestamp it's waiting on. This is might be an error unless there are multiple waiting callbacks. currTimestamp: %@. waitOnTimestamp: %@", buf, 0x16u);
        }
      }
    }
    if (!v64 || [(EKEventStore *)self enableSourceSyncStatusChanges])
    {
      if (v67)
      {
        uint64_t v59 = [v74 arrayByAddingObjectsFromArray:v69];
        id v60 = v59;
        if (v68)
        {
          uint64_t v61 = objc_msgSend(v59, "arrayByAddingObjectsFromArray:");

          id v60 = (void *)v61;
        }
      }
      else
      {
        id v60 = 0;
      }
      if (v64) {
        uint64_t v62 = 2;
      }
      else {
        uint64_t v62 = 1;
      }
      [(EKEventStore *)self _postEventStoreChangedNotificationWithChangeType:v62 changedObjectIDs:v60 forceImmediate:v63];
    }
    _Block_object_dispose(&v109, 8);

    _Block_object_dispose(&v100, 8);
  }
LABEL_70:
}

uint64_t __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 440) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 440) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) CADObjectID];
    [v2 _removeCachedCalendarWithCADID:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) _clearCachedSources];
      uint64_t v3 = *(void **)(a1 + 32);
      if (*(_DWORD *)(a1 + 56) == 1)
      {
        [*(id *)(a1 + 32) _clearAllCachedConstraints];
      }
      else
      {
        uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) CADObjectID];
        [v3 _clearCachedConstraintsForObjectWithCADObjectID:v4];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

uint64_t __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 304) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(*(void *)(a1 + 32) + 320) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(*(void *)(a1 + 32) + 312) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(*(void *)(a1 + 32) + 328) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setPendingInsert:0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setPendingUpdate:0];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 _setPendingDelete:0];
}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_5(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count] && objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "count"))
  {
    uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 40) + 112);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "objectID", (void)v12);
          int v11 = [v2 containsObject:v10];

          if (v11) {
            [v3 addIndex:v7 + v9];
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        v7 += v9;
      }
      while (v6);
    }

    [*(id *)(*(void *)(a1 + 40) + 112) removeObjectsAtIndexes:v3];
  }
}

uint64_t __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 440);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v4 = [v2 objectsForKeys:v3 notFoundMarker:v11];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v8 = v11;
  }
  else
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 440) allValues];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v9 + 40);
    *(void *)(v9 + 40) = v7;
  }

  return MEMORY[0x1F41817F8](v7, v8);
}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_7(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2 && (v3[7] || v3[8]))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v5) {
      goto LABEL_22;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "entityType", (void)v19);
        uint64_t v11 = *(void **)(a1 + 32);
        if (v10 == 6)
        {
          [v11 _clearCachedCalendars];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          long long v12 = *(void **)(a1 + 32);
          if (!v12[8]) {
            continue;
          }
          long long v13 = [v12 database];
          long long v14 = objc_msgSend(v9, "CADObjectIDWithGeneration:", objc_msgSend(v13, "databaseRestoreGeneration"));

          long long v15 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v14];

          if (!v15) {
            [*(id *)(a1 + 32) _clearCachedSources];
          }
          goto LABEL_19;
        }
        if (v10 == 1 && v11[7] != 0)
        {
          uint64_t v17 = [v11 database];
          long long v14 = objc_msgSend(v9, "CADObjectIDWithGeneration:", objc_msgSend(v17, "databaseRestoreGeneration"));

          id v18 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v14];

          if (!v18) {
            [*(id *)(a1 + 32) _cacheCalendarWithCADObjectID:v14 withDefaultLoadedPropertyValues:0 forKeys:0];
          }
LABEL_19:

          continue;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v6)
      {
LABEL_22:

        return;
      }
    }
  }
  [v3 _clearCachedSources];
  [*(id *)(a1 + 32) _clearCachedCalendars];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

uint64_t __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_checkPendingIntegrationEvents:(id)a3 changedIDsValid:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbChangedQueue);
  if (v4)
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v6 = v46;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v95 objects:v106 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v96;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v96 != v8) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v95 + 1) + 8 * i) entityType] == 2)
          {

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v95 objects:v106 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    goto LABEL_83;
  }
LABEL_12:
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = self->_pendingIntegrationEvents;
  uint64_t v50 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v91 objects:v105 count:16];
  if (!v50)
  {

    id v6 = 0;
LABEL_83:
    id v55 = 0;
    goto LABEL_84;
  }
  id v55 = 0;
  uint64_t v48 = *(void *)v92;
  id v49 = 0;
  do
  {
    for (uint64_t j = 0; j != v50; ++j)
    {
      if (*(void *)v92 != v48) {
        objc_enumerationMutation(obj);
      }
      int v53 = *(void **)(*((void *)&v91 + 1) + 8 * j);
      long long v52 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingIntegrationEvents, "objectForKeyedSubscript:");
      [(EKEventStore *)self removeEmptyTablesInArray:v52];
      if ([v52 count])
      {
        uint64_t v85 = 0;
        id v86 = &v85;
        uint64_t v87 = 0x3032000000;
        BOOL v88 = __Block_byref_object_copy__23;
        v89 = __Block_byref_object_dispose__23;
        id v90 = 0;
        uint64_t v10 = [(EKEventStore *)self connection];
        uint64_t v11 = [v10 CADOperationProxySync];
        uint64_t v79 = MEMORY[0x1E4F143A8];
        uint64_t v80 = 3221225472;
        long long v81 = __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke;
        long long v82 = &unk_1E5B986A0;
        long long v83 = v53;
        long long v84 = &v85;
        objc_msgSend(v11, "CADDatabaseGetAllEventsWithUniqueID:reply:");

        uint64_t v12 = [(id)v86[5] count];
        if (v12)
        {
          uint64_t v61 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v13 = (id)v86[5];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v75 objects:v104 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v76;
            do
            {
              for (uint64_t k = 0; k != v14; ++k)
              {
                if (*(void *)v76 != v15) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v17 = +[EKObjectID objectIDWithCADObjectID:*(void *)(*((void *)&v75 + 1) + 8 * k)];
                id v18 = [(EKEventStore *)self publicObjectWithFetchedObjectID:v17];

                if (v18) {
                  [v61 addObject:v18];
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v75 objects:v104 count:16];
            }
            while (v14);
          }

          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v54 = v52;
          uint64_t v58 = [v54 countByEnumeratingWithState:&v71 objects:v103 count:16];
          if (v58)
          {
            id v60 = 0;
            uint64_t v56 = *(void *)v72;
            do
            {
              for (uint64_t m = 0; m != v58; ++m)
              {
                if (*(void *)v72 != v56) {
                  objc_enumerationMutation(v54);
                }
                long long v19 = *(void **)(*((void *)&v71 + 1) + 8 * m);
                long long v20 = [v19 anyObject];
                if (v20)
                {
                  v57 = v19;
                  long long v69 = 0u;
                  long long v70 = 0u;
                  long long v67 = 0u;
                  long long v68 = 0u;
                  id v21 = v61;
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v102 count:16];
                  if (v22)
                  {
                    uint64_t v23 = *(void *)v68;
                    while (2)
                    {
                      for (uint64_t n = 0; n != v22; ++n)
                      {
                        if (*(void *)v68 != v23) {
                          objc_enumerationMutation(v21);
                        }
                        uint64_t v25 = *(void **)(*((void *)&v67 + 1) + 8 * n);
                        uint64_t v26 = [v25 calendar];
                        uint64_t v27 = [v20 calendar];
                        int v28 = [v26 isEqual:v27];

                        if (v28)
                        {
                          id v29 = (id)EKLogHandle;
                          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                          {
                            uint64_t v30 = [v20 privacySafeIntegrationEventDescription];
                            *(_DWORD *)buf = 138543362;
                            long long v101 = v30;
                            _os_log_impl(&dword_1A4E47000, v29, OS_LOG_TYPE_INFO, "Pending integration event has been matched; removing it: %{public}@",
                              buf,
                              0xCu);
                          }
                          uint64_t v59 = [v20 objectID];
                          long long v65 = 0u;
                          long long v66 = 0u;
                          long long v63 = 0u;
                          long long v64 = 0u;
                          id v31 = v57;
                          uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v99 count:16];
                          if (v32)
                          {
                            uint64_t v33 = *(void *)v64;
                            do
                            {
                              for (iuint64_t i = 0; ii != v32; ++ii)
                              {
                                if (*(void *)v64 != v33) {
                                  objc_enumerationMutation(v31);
                                }
                                id v35 = *(void **)(*((void *)&v63 + 1) + 8 * ii);
                                uint64_t v36 = [v35 backingObject];
                                [(EKEventStore *)self _objectDidReset:v36];

                                id v37 = [v25 backingObject];
                                [v35 setBackingObject:v37];

                                [v35 _resetAfterUpdatingChangeSetOrBackingObject];
                              }
                              uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v99 count:16];
                            }
                            while (v32);
                          }

                          id v38 = v55;
                          if (!v55) {
                            id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                          }
                          id v55 = v38;
                          [v38 addObject:v59];
                          id v39 = v60;
                          if (!v60) {
                            id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                          }
                          id v60 = v39;
                          [v39 addObject:v31];

                          goto LABEL_57;
                        }
                      }
                      uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v102 count:16];
                      if (v22) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_57:
                }
                else
                {
                  uint64_t v40 = EKLogHandle;
                  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    long long v101 = v53;
                    _os_log_impl(&dword_1A4E47000, v40, OS_LOG_TYPE_INFO, "Discarding empty pending integration event table for: %{public}@", buf, 0xCu);
                  }
                  id v41 = v60;
                  if (!v60) {
                    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  id v60 = v41;
                  [v41 addObject:v19];
                }
              }
              uint64_t v58 = [v54 countByEnumeratingWithState:&v71 objects:v103 count:16];
            }
            while (v58);
          }
          else
          {
            id v60 = 0;
          }

          id v43 = v49;
          uint64_t v44 = [v60 count];
          if (v44 == [v54 count])
          {
            if (!v49) {
              id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v43 addObject:v53];
          }
          else if (v60)
          {
            objc_msgSend(v54, "removeObjectsInArray:");
          }
          id v49 = v43;
        }
        _Block_object_dispose(&v85, 8);
      }
      else
      {
        id v42 = v49;
        if (!v49) {
          id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        id v49 = v42;
        [v42 addObject:v53];
      }
    }
    uint64_t v50 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v91 objects:v105 count:16];
  }
  while (v50);

  if (v49)
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_pendingIntegrationEvents, "removeObjectsForKeys:");
    id v6 = v49;
  }
  else
  {
    id v6 = 0;
  }
LABEL_84:

  return v55;
}

void __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)removeEmptyTablesInArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * i) anyObject];

        if (!v10)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
          }
          [v7 addIndex:v6 + i];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v6 += i;
    }
    while (v5);
    if (v7)
    {
      [v3 removeObjectsAtIndexes:v7];
    }
  }
}

- (void)_cacheDeletedEventIdentifierIfNeededForObject:(id)a3
{
  id v4 = a3;
  if (self->_deletedEventUniqueIdentifiersCache)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(id)objc_opt_class() propertyKeyForUniqueIdentifier];
      char v10 = 0;
      uint64_t v6 = [v4 loadedOrUpdatedPropertyValue:v5 wasAvailable:&v10];
      id v7 = (void *)v6;
      if (v10 && v6)
      {
        deletedEventUniqueIdentifiersCache = self->_deletedEventUniqueIdentifiersCache;
        uint64_t v9 = [v4 objectID];
        [(NSCache *)deletedEventUniqueIdentifiersCache setObject:v7 forKey:v9];
      }
    }
  }
}

+ (id)_contextForNotificationWithChangeType:(unint64_t)a3 changedObjectIDs:(id)a4
{
  id v5 = a4;
  if (_contextForNotificationWithChangeType_changedObjectIDs__onceToken != -1) {
    dispatch_once(&_contextForNotificationWithChangeType_changedObjectIDs__onceToken, &__block_literal_global_250);
  }
  if (a3 == 2)
  {
    if (v5)
    {
      id v6 = 0;
      goto LABEL_11;
    }
    id v7 = &_contextForNotificationWithChangeType_changedObjectIDs__contextForSyncOnlyWithUnknownChanges;
  }
  else
  {
    id v7 = &_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithKnownChanges;
    if (!v5) {
      id v7 = &_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithUnknownChanges;
    }
  }
  id v6 = (id)*v7;
LABEL_11:

  return v6;
}

void __71__EKEventStore__contextForNotificationWithChangeType_changedObjectIDs___block_invoke()
{
  v12[1] = *MEMORY[0x1E4F143B8];
  long long v11 = @"EKEventStoreUnknownChangeKey";
  uint64_t v0 = MEMORY[0x1E4F1CC38];
  v12[0] = MEMORY[0x1E4F1CC38];
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v2 = (void *)_contextForNotificationWithChangeType_changedObjectIDs__contextForSyncOnlyWithUnknownChanges;
  _contextForNotificationWithChangeType_changedObjectIDs__contextForSyncOnlyWithUnknownChanges = v1;

  uint64_t v9 = @"EKEventStoreNonSyncOnlyChangeKey";
  uint64_t v10 = v0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v4 = (void *)_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithKnownChanges;
  _contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithKnownChanges = v3;

  v7[0] = @"EKEventStoreUnknownChangeKey";
  v7[1] = @"EKEventStoreNonSyncOnlyChangeKey";
  v8[0] = v0;
  v8[1] = v0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v6 = (void *)_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithUnknownChanges;
  _contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithUnknownChanges = v5;
}

- (void)_postEventStoreChangedNotificationWithChangeType:(unint64_t)a3 changedObjectIDs:(id)a4 forceImmediate:(BOOL)a5
{
  BOOL v5 = a5;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [(id)objc_opt_class() _contextForNotificationWithChangeType:a3 changedObjectIDs:v8];
  uint64_t v10 = v9;
  if (v5)
  {
    if (v9)
    {
      long long v11 = (void *)[v9 mutableCopy];
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"EKEventStoreForceImmediateChangeKey"];

      uint64_t v10 = v11;
    }
    else
    {
      long long v12 = @"EKEventStoreForceImmediateChangeKey";
      v13[0] = MEMORY[0x1E4F1CC38];
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
  }
  [(CalAccumulatingQueue *)self->_notificationAccumulatingQueue updateTagsAndExecuteBlock:v8 withContext:v10];
}

- (void)_postEventStoreChangedNotificationWithTags:(id)a3 context:(id)a4
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v8 = CalMonotonicTime();
  self->_lastFiredEventStoreChangedNotificationTime = v8;
  id v9 = v6;
  uint64_t v10 = [v7 objectForKeyedSubscript:@"EKEventStoreUnknownChangeKey"];
  int v11 = [v10 BOOLValue];

  long long v12 = v9;
  if (v11)
  {

    long long v12 = 0;
  }
  long long v13 = [v7 objectForKeyedSubscript:@"EKEventStoreNonSyncOnlyChangeKey"];
  int v14 = [v13 BOOLValue];

  if (!v14)
  {
    uint64_t v15 = 2;
    if (v12) {
      goto LABEL_5;
    }
LABEL_7:
    v23[0] = @"EKEventStoreChangeTypeUserInfoKey";
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v15];
    v24[0] = v16;
    v24[1] = MEMORY[0x1E4F1CC38];
    v23[1] = @"EKEventStoreCalendarDataChangedUserInfoKey";
    v23[2] = @"EKEventStoreRemindersDataChangedUserInfoKey";
    v24[2] = MEMORY[0x1E4F1CC28];
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = v24;
    long long v19 = v23;
    uint64_t v20 = 3;
    goto LABEL_8;
  }
  self->_lastFiredNonSyncOnlyEventStoreChangedNotificationTime = v8;
  uint64_t v15 = 1;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_5:
  v26[0] = v12;
  v25[0] = @"EKEventStoreChangedObjectIDsUserInfoKey";
  v25[1] = @"EKEventStoreChangeTypeUserInfoKey";
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v15];
  v26[1] = v16;
  v26[2] = MEMORY[0x1E4F1CC38];
  v25[2] = @"EKEventStoreCalendarDataChangedUserInfoKey";
  v25[3] = @"EKEventStoreRemindersDataChangedUserInfoKey";
  v26[3] = MEMORY[0x1E4F1CC28];
  uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
  id v18 = v26;
  long long v19 = v25;
  uint64_t v20 = 4;
LABEL_8:
  id v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];

  uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v22 postNotificationName:@"EKEventStoreChangedNotification" object:self userInfo:v21];
}

- (double)_throttleDelayForEventStoreChangedNotificationWithTags:(id)a3 context:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  double v6 = 0.0;
  if (self->_defaultDelayForThrottledNotifications != 0.0)
  {
    id v7 = [v5 objectForKeyedSubscript:@"EKEventStoreForceImmediateChangeKey"];
    char v8 = [v7 BOOLValue];

    if ((v8 & 1) == 0)
    {
      id v9 = [v5 objectForKeyedSubscript:@"EKEventStoreNonSyncOnlyChangeKey"];
      int v10 = [v9 BOOLValue];

      uint64_t v11 = 256;
      if (v10) {
        uint64_t v11 = 264;
      }
      [(id)objc_opt_class() _throttleDelayForEventStoreChangedNotificationWithLastFiredTime:*(Class *)((char *)&self->super.isa + v11) delay:self->_defaultDelayForThrottledNotifications];
      double v6 = v12;
    }
  }

  return v6;
}

+ (double)_throttleDelayForEventStoreChangedNotificationWithLastFiredTime:(unint64_t)a3 delay:(double)a4
{
  if (!a3) {
    return 0.0;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v6 = CalMonotonicTime();
  double result = 0.0;
  if ((double)((v6 - a3) * info.numer / info.denom / 0x3B9ACA00) <= a4) {
    return a4;
  }
  return result;
}

- (void)_defaultCalendarChangedExternally
{
  uint64_t v3 = [(EKEventStore *)self calendarSourcesAndDefaultsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EKEventStore__defaultCalendarChangedExternally__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(v3, block);

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"EKEventStoreCalendarsChangedNotification" object:self];
}

void __49__EKEventStore__defaultCalendarChangedExternally__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)_defaultAlarmChangedExternally
{
  uint64_t v3 = [(EKEventStore *)self calendarSourcesAndDefaultsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EKEventStore__defaultAlarmChangedExternally__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __46__EKEventStore__defaultAlarmChangedExternally__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = 0;
}

- (void)daemonRestarted
{
  uint64_t v3 = [(EKEventStore *)self dataProtectionObserver];
  int v4 = [v3 dataIsAccessible];

  if (v4)
  {
    [(EKEventStore *)self _databaseChangedExternally:0 processSynchronously:0];
  }
}

- (void)databaseRestoreGenerationChangedExternally:(int)a3
{
  if ([(EKEventStore *)self ignoreExternalChanges])
  {
    if (databaseRestoreGenerationChangedExternally__onceToken != -1) {
      dispatch_once(&databaseRestoreGenerationChangedExternally__onceToken, &__block_literal_global_253);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__EKEventStore_databaseRestoreGenerationChangedExternally___block_invoke_2;
    block[3] = &unk_1E5B96E08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)databaseRestoreGenerationChangedExternally__autoResetQueue, block);
  }
  else
  {
    [(EKEventStore *)self setRestoreGenerationChanged:1];
  }
}

void __59__EKEventStore_databaseRestoreGenerationChangedExternally___block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_DEFAULT, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.eventkit.autoreset", attr);
  uint64_t v2 = (void *)databaseRestoreGenerationChangedExternally__autoResetQueue;
  databaseRestoreGenerationChangedExternally__autoResetQueue = (uint64_t)v1;
}

uint64_t __59__EKEventStore_databaseRestoreGenerationChangedExternally___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetAndNotifyAfterDatabaseRestoreGenerationChanged];
}

- (NSString)eventStoreIdentifier
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__23;
  uint64_t v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  uint64_t v2 = [(EKEventStore *)self connection];
  uint64_t v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__EKEventStore_eventStoreIdentifier__block_invoke;
  v6[3] = &unk_1E5B99B70;
  v6[4] = &v7;
  [v3 CADDatabaseGetUUID:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __36__EKEventStore_eventStoreIdentifier__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __36__EKEventStore_eventStoreIdentifier__block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (BOOL)automaticLocationGeocodingAllowed
{
  return +[EKFeatureSet automaticGeocodingEnabled];
}

- (unint64_t)lastConfirmedSplashScreenVersion
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = [(EKEventStore *)self connection];
  uint64_t v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__EKEventStore_lastConfirmedSplashScreenVersion__block_invoke;
  v6[3] = &unk_1E5B99B98;
  v6[4] = &v7;
  [v3 CADDatabaseLastConfirmedSplashScreenVersion:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__EKEventStore_lastConfirmedSplashScreenVersion__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (BOOL)clientCanModifySources
{
  if ([(EKEventStore *)self skipModificationValidation]
    || ([MEMORY[0x1E4F57700] currentProcessHasTestingEntitlement] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessIsCalendarDaemon] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessIsPreferences] & 1) != 0)
  {
    return 1;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F57700];

  return [v3 currentProcessIsAutomator];
}

- (id)_sourceWithID:(id)a3
{
  uint64_t v3 = [(EKEventStore *)self objectWithObjectID:a3];
  if (v3) {
    unint64_t v4 = [(EKObject *)[EKSource alloc] initWithPersistentObject:v3];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)sourcesEnabledForEntityType:(unint64_t)a3
{
  unint64_t v4 = [(EKEventStore *)self sources];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __44__EKEventStore_sourcesEnabledForEntityType___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__EKSource_8__NSDictionary_16l;
  v8[4] = a3;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __44__EKEventStore_sourcesEnabledForEntityType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  char v8 = (uint64_t *)(a1 + 32);
  uint64_t v7 = v9;
  if (v9 == 1)
  {
    uint64_t v10 = [v5 allowsTasks];
    goto LABEL_5;
  }
  if (!v7)
  {
    uint64_t v10 = [v5 allowsEvents];
LABEL_5:
    uint64_t v11 = v10;
    goto LABEL_9;
  }
  id v12 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __44__EKEventStore_sourcesEnabledForEntityType___block_invoke_cold_1(v8, v12);
  }
  uint64_t v11 = 0;
LABEL_9:

  return v11;
}

- (id)_deletableSources
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  uint64_t v11 = __Block_byref_object_dispose__23;
  id v12 = (id)objc_opt_new();
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__EKEventStore__deletableSources__block_invoke;
  v6[3] = &unk_1E5B96E30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__EKEventStore__deletableSources__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__23;
  uint64_t v20 = __Block_byref_object_dispose__23;
  id v21 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = [v2 CADOperationProxySync];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__EKEventStore__deletableSources__block_invoke_2;
  void v15[3] = &unk_1E5B99C30;
  v15[4] = &v16;
  [v3 CADDatabaseGetDeletableSources:v15];

  id v4 = (void *)v17[5];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11);
          uint64_t v10 = [*(id *)(a1 + 32) _sourceWithID:v9];
          if (v10) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
      }
      while (v6);
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __33__EKEventStore__deletableSources__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __33__EKEventStore__deletableSources__block_invoke_2_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (id)getSubscribedCalendarsSourceCreateIfNeededWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__23;
  long long v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__23;
  long long v13 = __Block_byref_object_dispose__23;
  id v14 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke;
  block[3] = &unk_1E5B970C8;
  block[4] = self;
  void block[5] = &v9;
  void block[6] = &v15;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
  if (v16[5])
  {
    id v6 = -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:");
  }
  else
  {
    id v6 = 0;
    if (a3) {
      *a3 = (id) v10[5];
    }
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[6]) {
    goto LABEL_3;
  }
  uint64_t v3 = [v2 connection];
  id v4 = [v3 CADOperationProxySync];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2;
  v8[3] = &unk_1E5B99258;
  long long v9 = *(_OWORD *)(a1 + 32);
  [v4 CADDatabaseGetOrCreateSubscribedCalendarsSource:v8];

  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
LABEL_3:
    uint64_t v5 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2_cold_1();
    }
  }
  else
  {
    long long v9 = [*(id *)(a1 + 32) database];
    uint64_t v10 = objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v9, "databaseRestoreGeneration"));
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(void **)(v11 + 48);
    *(void *)(v11 + 48) = v10;
  }
}

- (id)localBirthdayCalendarCreateIfNeededWithError:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__23;
  uint64_t v23 = __Block_byref_object_dispose__23;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__23;
  uint64_t v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  id v5 = [(EKEventStore *)self connection];
  uint64_t v6 = [v5 CADOperationProxySync];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke;
  v12[3] = &unk_1E5B99C58;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = self;
  [v6 CADDatabaseGetOrCreateBirthdayCalendar:v12];

  if (v14[5])
  {
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_265;
    block[3] = &unk_1E5B96E30;
    block[4] = self;
    void block[5] = &v13;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);
    uint64_t v8 = +[EKObjectID objectIDWithCADObjectID:v14[5]];
    long long v9 = [(EKEventStore *)self publicObjectWithFetchedObjectID:v8];
  }
  else
  {
    long long v9 = 0;
    if (a3) {
      *a3 = (id) v20[5];
    }
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_cold_1();
    }
  }
  else
  {
    long long v9 = [*(id *)(a1 + 32) database];
    uint64_t v10 = objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v9, "databaseRestoreGeneration"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

uint64_t __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_265(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cacheCalendarWithCADObjectID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withDefaultLoadedPropertyValues:0 forKeys:0];
}

- (id)delegateSourcesForSource:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventStore *)self eventSources];
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __41__EKEventStore_delegateSourcesForSource___block_invoke;
  v11[3] = &unk_1E5B99CA0;
  id v12 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 predicateWithBlock:v11];
  long long v9 = [v5 filteredArrayUsingPredicate:v8];

  return v9;
}

uint64_t __41__EKEventStore_delegateSourcesForSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isDelegate])
  {
    id v4 = [v3 delegatedAccountOwnerStoreID];
    id v5 = [*(id *)(a1 + 32) externalID];
    uint64_t v6 = [v4 isEqualToString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)parentSourceForDelegateSource:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 delegatedAccountOwnerStoreID];
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(EKEventStore *)self eventSources];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [v9 externalID];
          int v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore parentSourceForDelegateSource:]();
    }
    id v6 = 0;
  }

  return v6;
}

- (void)fetchGrantedDelegatesForSource:(id)a3 results:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(EKEventStore *)self connection];
  long long v9 = [v8 CADOperationProxy];
  uint64_t v10 = [v7 CADObjectID];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke;
  v12[3] = &unk_1E5B99CC8;
  id v13 = v6;
  id v11 = v6;
  [v9 CADSourceGetGrantedDelegatesList:v10 reply:v12];
}

void __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke_cold_1(v6);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
      v8();
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_8;
    }
  }
}

- (void)updateGrantedDelegate:(id)a3 action:(int64_t)a4 source:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(EKEventStore *)self connection];
  long long v14 = [v13 CADOperationProxy];
  long long v15 = [v11 CADObjectID];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke;
  v17[3] = &unk_1E5B99CF0;
  id v18 = v10;
  id v16 = v10;
  [v14 CADSourceUpdateGrantedDelegate:v12 action:a4 sourceID:v15 reply:v17];
}

void __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke_cold_1(v4);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

- (void)addExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toSource:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void *, void, uint64_t, void *))a6;
  if (v13) {
    long long v14 = v13;
  }
  else {
    long long v14 = (void (**)(void *, void, uint64_t, void *))&__block_literal_global_270;
  }
  if (!v11)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = @"No emailAddress given";
LABEL_11:
    id v20 = [v18 errorWithEKErrorCode:63 description:v19];
    v14[2](v14, 0, -1, v20);

    goto LABEL_12;
  }
  if (!v12)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = @"No source given";
    goto LABEL_11;
  }
  if ([v12 sourceType] != 1)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = @"Given source is not an Exchange source";
    goto LABEL_11;
  }
  long long v15 = [(EKEventStore *)self connection];
  id v16 = [v15 CADOperationProxy];
  uint64_t v17 = [v12 CADObjectID];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__EKEventStore_addExchangeDelegateWithName_emailAddress_toSource_completion___block_invoke_2;
  v21[3] = &unk_1E5B99D38;
  v21[4] = self;
  uint64_t v22 = v14;
  [v16 CADSourceAddExchangeDelegateWithName:v10 emailAddress:v11 toSourceWithID:v17 reply:v21];

LABEL_12:
}

void __77__EKEventStore_addExchangeDelegateWithName_emailAddress_toSource_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v12 = v5;
  if (a2)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = [*(id *)(a1 + 32) database];
      uint64_t v9 = objc_msgSend(v12, "stampedCopyWithGeneration:", objc_msgSend(v8, "databaseRestoreGeneration"));

      [*(id *)(a1 + 32) _cacheSourceWithCADObjectID:v9 withDefaultLoadedPropertyValues:0 forKeys:0];
      id v10 = *(void **)(a1 + 32);
      id v11 = +[EKObjectID objectIDWithCADObjectID:v12];
      id v6 = [v10 _sourceWithID:v11];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (void)removeExchangeDelegate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, void, id))a4;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = (void (**)(void *, void, id))&__block_literal_global_282;
  }
  if (!v6)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    long long v14 = @"No delegate given";
LABEL_11:
    id v12 = [v13 errorWithEKErrorCode:63 description:v14];
    v8[2](v8, 0, v12);
    goto LABEL_12;
  }
  if (([v6 isDelegate] & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    long long v14 = @"Given source is not a delegate";
    goto LABEL_11;
  }
  if ([v6 sourceType] != 1)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    long long v14 = @"Given delegate is not an Exchange source";
    goto LABEL_11;
  }
  uint64_t v9 = [v6 CADObjectID];
  id v10 = [(EKEventStore *)self connection];
  id v11 = [v10 CADOperationProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_2;
  void v15[3] = &unk_1E5B99D60;
  v15[4] = self;
  id v16 = v9;
  uint64_t v17 = v8;
  id v12 = v9;
  [v11 CADSourceRemoveExchangeDelegateWithID:v12 reply:v15];

LABEL_12:
}

void __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  if (a2)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 360);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_3;
    v9[3] = &unk_1E5B97140;
    v9[4] = v7;
    id v10 = *(id *)(a1 + 40);
    dispatch_sync(v8, v9);

    id v6 = 0;
  }
  (*(void (**)(void, BOOL, void *, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2 == 0, v6, v4, v5);
}

uint64_t __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearCachedSources];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _clearCachedConstraintsForObjectWithCADObjectID:v3];
}

- (id)_localSourceWithEnableIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[EKSource primaryLocalSourceID];
  id v6 = [(EKEventStore *)self registerFetchedObjectWithID:v5];
  uint64_t v7 = [(EKObject *)[EKSource alloc] initWithPersistentObject:v6];
  int v8 = [(EKSource *)v7 isEnabledForEvents];
  uint64_t v9 = [(EKSource *)v7 sourceType];
  uint64_t v10 = v9;
  if (v3 & ~v8 || v9)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__23;
    uint64_t v21 = __Block_byref_object_dispose__23;
    id v22 = 0;
    id v12 = [(EKEventStore *)self connection];
    id v13 = [v12 CADOperationProxySync];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__EKEventStore__localSourceWithEnableIfNeeded___block_invoke;
    v16[3] = &unk_1E5B99D88;
    void v16[4] = &v17;
    [v13 CADDatabaseGetLocalSourceWithEnableIfNeeded:v3 reply:v16];

    if (v10) {
      [(EKEventStore *)self _clearAllCaches];
    }
    if (v18[5])
    {
      uint64_t v14 = -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:");

      id v11 = [(EKObject *)[EKSource alloc] initWithPersistentObject:v14];
      id v6 = (void *)v14;
    }
    else
    {
      id v11 = 0;
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

void __47__EKEventStore__localSourceWithEnableIfNeeded___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(v6);
    }
  }
  else
  {
    uint64_t v7 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)localSource
{
  return [(EKEventStore *)self _localSourceWithEnableIfNeeded:0];
}

- (id)localSourceEnableIfNeeded
{
  return [(EKEventStore *)self _localSourceWithEnableIfNeeded:1];
}

- (id)localBirthdayCalendarSource
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  id v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EKEventStore_localBirthdayCalendarSource__block_invoke;
  v6[3] = &unk_1E5B96E30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  if (v8[5])
  {
    uint64_t v4 = -[EKEventStore _sourceWithID:](self, "_sourceWithID:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__EKEventStore_localBirthdayCalendarSource__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2[2]) {
    goto LABEL_3;
  }
  BOOL v3 = [v2 connection];
  uint64_t v4 = [v3 CADOperationProxySync];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __43__EKEventStore_localBirthdayCalendarSource__block_invoke_2;
  v8[3] = &unk_1E5B99DB0;
  void v8[4] = *(void *)(a1 + 32);
  [v4 CADDatabaseGetLocalBirthdaySource:v8];

  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
LABEL_3:
    uint64_t v5 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __43__EKEventStore_localBirthdayCalendarSource__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(v6);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) database];
    uint64_t v8 = objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v7, "databaseRestoreGeneration"));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = v8;
  }
}

- (EKSource)sourceWithIdentifier:(NSString *)identifier
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = identifier;
  if ([(EKEventStore *)self returnEventResults])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(EKEventStore *)self sources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v11 = [v10 sourceIdentifier];
          char v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v13 = v10;

            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  if ([(EKEventStore *)self returnReminderResults])
  {
    id v13 = [(EKReminderStore *)self->_reminderStore sourceWithIdentifier:v4];
  }
  else
  {
    id v13 = 0;
  }
LABEL_15:

  return (EKSource *)v13;
}

- (id)sourceWithExternalID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(EKEventStore *)self sources];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 externalID];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)primaryAppleAccountSource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = [(EKEventStore *)self eventSources];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isPrimaryAppleAccount])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)saveSource:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  long long v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (!v8) {
    goto LABEL_12;
  }
  long long v10 = [v8 eventStore];

  if (v10 != self)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  if (![v9 validate:a5] || !objc_msgSend(v9, "save:", a5)) {
    goto LABEL_12;
  }
  [(EKEventStore *)self _addObjectToPendingCommits:v9];
  BOOL v11 = [(EKEventStore *)self save:a5];
  if (v11 && v6) {
    LOBYTE(v11) = [(EKEventStore *)self commitWithRollback:a5];
  }
LABEL_13:

  return v11;
}

- (BOOL)removeSource:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  long long v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (!v8) {
    goto LABEL_11;
  }
  long long v10 = [v8 eventStore];

  if (v10 != self)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  if (![v9 remove:a5]) {
    goto LABEL_11;
  }
  [(EKEventStore *)self _addObjectToPendingCommits:v9];
  if (![(EKEventStore *)self save:a5]) {
    goto LABEL_11;
  }
  [v9 markAsDeleted];
  BOOL v11 = !v6 || [(EKEventStore *)self commitWithRollback:a5];
LABEL_12:

  return v11;
}

- (void)_clearCachedSources
{
  self->_sources = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)isSourceManaged:(id)a3
{
  id v4 = a3;
  if (-[EKEventStore returnEventResults](self, "returnEventResults") && [v4 allowsEvents])
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v5 = [v4 externalID];
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&isSourceManaged__cacheLock);
      BOOL v6 = [(id)isSourceManaged__kIsManagedCache objectForKey:v5];
      if (!v6)
      {
        uint64_t v7 = [(EKEventStore *)self connection];
        id v8 = [v7 CADOperationProxySync];
        long long v9 = [v4 CADObjectID];
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        long long v17 = __32__EKEventStore_isSourceManaged___block_invoke;
        uint64_t v18 = &unk_1E5B98678;
        id v19 = v4;
        uint64_t v20 = &v21;
        [v8 CADObjectIsManaged:v9 reply:&v15];

        if (!isSourceManaged__kIsManagedCache)
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1C998]);
          BOOL v11 = (void *)isSourceManaged__kIsManagedCache;
          isSourceManaged__kIsManagedCache = (uint64_t)v10;
        }
        BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v22 + 24), v15, v16, v17, v18);
        [(id)isSourceManaged__kIsManagedCache setObject:v6 forKey:v5];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&isSourceManaged__cacheLock);
      char v12 = [v6 BOOLValue];
    }
    else
    {
      char v12 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
  else if ([(EKEventStore *)self returnReminderResults] {
         && [v4 allowsTasks])
  }
  {
    char v12 = [(EKReminderStore *)self->_reminderStore isSourceManaged:v4];
  }
  else
  {
    uint64_t v13 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore isSourceManaged:](v13, v4);
    }
    char v12 = 0;
  }

  return v12;
}

void __32__EKEventStore_isSourceManaged___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    id v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __32__EKEventStore_isSourceManaged___block_invoke_cold_1(a1, v5, a2);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (id)dbStatsBySource
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__23;
  BOOL v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  int v2 = [(EKEventStore *)self connection];
  id v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__EKEventStore_dbStatsBySource__block_invoke;
  v6[3] = &unk_1E5B99C30;
  v6[4] = &v7;
  [v3 CADDatabaseStatsBySource:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__EKEventStore_dbStatsBySource__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __31__EKEventStore_dbStatsBySource__block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

void __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 72);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 32) connection];
    id v8 = [v7 CADOperationProxySync];
    int v9 = *(_DWORD *)(a1 + 48);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2;
    id v19 = &unk_1E5B99DF0;
    LODWORD(v21) = v9;
    uint64_t v20 = *(void *)(a1 + 40);
    objc_msgSend(v8, "CADPersonaIdentifierForDatabaseID:reply:", MEMORY[0x1E4F143A8], 3221225472, __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2, &unk_1E5B99DF0, v20, v21);

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v10)
    {
      BOOL v11 = *(void **)(*(void *)(a1 + 32) + 72);
      if (!v11)
      {
        uint64_t v12 = objc_opt_new();
        uint64_t v13 = *(void *)(a1 + 32);
        long long v14 = *(void **)(v13 + 72);
        *(void *)(v13 + 72) = v12;

        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        BOOL v11 = *(void **)(*(void *)(a1 + 32) + 72);
      }
      uint64_t v15 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
      [v11 setObject:v10 forKeyedSubscript:v15];
    }
  }
}

void __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2_cold_1(a1, v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (void)_resetCachedPersonaIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_calendarSourcesAndDefaultsQueue);
  personaIDByDatabaseID = self->_personaIDByDatabaseID;
  self->_personaIDByDatabaseID = 0;
}

- (NSArray)calendars
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = [(EKEventStore *)self _allCalendars];
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "allowedEntityTypes", (void)v13))
        {
          uint64_t v10 = [v9 source];
          int v11 = [v10 allowsEvents];

          if (v11) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)hideCalendarsFromNotificationCenter:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    if (a4) {
      *a4 = 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v33;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        if (!v10) {
          break;
        }
        int v11 = [*(id *)(*((void *)&v32 + 1) + 8 * v9) eventStore];
        BOOL v12 = v11 == 0;

        if (v12) {
          goto LABEL_22;
        }
        long long v13 = [v10 eventStore];
        BOOL v14 = v13 == self;

        if (!v14)
        {
          if (a4)
          {
            [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
            LOBYTE(v10) = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            break;
          }
LABEL_22:
          LOBYTE(v10) = 0;
          break;
        }
        uint64_t v28 = 0;
        id v29 = &v28;
        uint64_t v30 = 0x2020000000;
        char v31 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = &v22;
        uint64_t v24 = 0x3032000000;
        uint64_t v25 = __Block_byref_object_copy__23;
        uint64_t v26 = __Block_byref_object_dispose__23;
        id v27 = 0;
        long long v15 = [(EKEventStore *)self connection];
        long long v16 = [v15 CADOperationProxySync];
        uint64_t v17 = [v10 CADObjectID];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke;
        v21[3] = &unk_1E5B99E18;
        v21[4] = v10;
        void v21[5] = &v22;
        v21[6] = &v28;
        [v16 CADCalendarSetClearedFromNotificationCenter:v17 error:v21];

        if (a4) {
          *a4 = (id) v23[5];
        }
        BOOL v18 = *((unsigned char *)v29 + 24) == 0;
        _Block_object_dispose(&v22, 8);

        _Block_object_dispose(&v28, 8);
        if (v18) {
          goto LABEL_22;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
          LOBYTE(v10) = 1;
          if (v7) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

void __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke_cold_1(a1, v4, a2);
    }
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)_deletableCalendars
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  int v11 = __Block_byref_object_dispose__23;
  id v12 = (id)objc_opt_new();
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__EKEventStore__deletableCalendars__block_invoke;
  v6[3] = &unk_1E5B96E30;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__EKEventStore__deletableCalendars__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__23;
  uint64_t v20 = __Block_byref_object_dispose__23;
  id v21 = 0;
  int v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 CADOperationProxySync];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__EKEventStore__deletableCalendars__block_invoke_2;
  void v15[3] = &unk_1E5B99C30;
  v15[4] = &v16;
  [v3 CADDatabaseGetDeletableCalendars:v15];

  id v4 = (void *)v17[5];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11);
          uint64_t v10 = [*(id *)(a1 + 32) calendarWithID:v9];
          if (v10) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
      }
      while (v6);
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __35__EKEventStore__deletableCalendars__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __35__EKEventStore__deletableCalendars__block_invoke_2_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (BOOL)_calendar:(id)a3 supportsEntityType:(unint64_t)a4
{
  id v7 = a3;
  if (a4 >= 2)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:2819 description:@"Invalid entity type passed"];
  }
  if (([v7 allowedEntityTypes] & (1 << a4)) != 0)
  {
    if (a4 == 1)
    {
      uint64_t v8 = [v7 source];
      char v9 = [v8 allowsTasks];
      goto LABEL_9;
    }
    if (!a4)
    {
      uint64_t v8 = [v7 source];
      char v9 = [v8 allowsEvents];
LABEL_9:
      BOOL v10 = v9;

      goto LABEL_10;
    }
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (int)readWriteCalendarCountForEntityType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(EKEventStore *)self _allCalendars];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([(EKEventStore *)self _calendar:v11 supportsEntityType:a3]) {
          v8 += [v11 allowsContentModifications];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)readWriteCalendarsForEntityType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(EKEventStore *)self _allCalendars];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([(EKEventStore *)self _calendar:v11 supportsEntityType:a3]
          && [v11 allowsContentModifications])
        {
          if (!v8)
          {
            int v8 = [MEMORY[0x1E4F1CA48] array];
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)_addRemovedObjectToPendingCommits:(id)a3
{
  id v6 = a3;
  id v4 = [v6 persistentObject];
  char v5 = [v4 isNew];

  if ((v5 & 1) == 0) {
    [(EKEventStore *)self _addObjectToPendingCommits:v6];
  }
}

- (void)_addObjectToPendingCommits:(id)a3
{
  id v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __43__EKEventStore__addObjectToPendingCommits___block_invoke;
  v7[3] = &unk_1E5B97140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(unsavedChangesQueue, v7);
}

uint64_t __43__EKEventStore__addObjectToPendingCommits___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 112))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 336))
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 336);
    *(void *)(v7 + 336) = v6;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 112) addObject:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(a1 + 40);
  BOOL v10 = *(void **)(*(void *)(a1 + 32) + 336);

  return [v10 addObject:v9];
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  return [(EKEventStore *)self saveCalendar:a3 commit:1 error:a4];
}

- (BOOL)removeCalendar:(id)a3 error:(id *)a4
{
  return [(EKEventStore *)self removeCalendar:a3 commit:1 error:a4];
}

- (BOOL)saveCalendar:(EKCalendar *)calendar commit:(BOOL)commit error:(NSError *)error
{
  id v12 = 0;
  BOOL v6 = [(EKEventStore *)self _saveCalendar:calendar commit:commit error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (error) {
    *error = (NSError *)v7;
  }
  uint64_t v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_INFO, "Saved calendar successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore saveCalendar:commit:error:]();
  }

  return v6;
}

- (BOOL)_saveCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(EKEventStore *)self shouldSaveCalendarAsEventCalendar:v8]
    && ![(EKEventStore *)self _saveCalendar:v8 error:a5])
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    if ([(EKEventStore *)self shouldSaveCalendarAsReminderCalendar:v8])
    {
      BOOL v9 = [(EKReminderStore *)self->_reminderStore saveCalendar:v8 error:a5];
      if (!v9) {
        goto LABEL_10;
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
    if (v6) {
      LOBYTE(v9) = [(EKEventStore *)self commitWithRollbackForNewClients:a5];
    }
  }
LABEL_10:

  return v9;
}

- (BOOL)_saveCalendar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!a4)
  {
    if (![(EKEventStore *)self canModifyCalendarDatabase]) {
      goto LABEL_14;
    }
LABEL_5:
    if (-[EKEventStore eventAccessLevel](self, "eventAccessLevel") == 1 && [v6 isNew])
    {
      if (a4)
      {
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = 17;
        goto LABEL_13;
      }
LABEL_14:
      LOBYTE(v10) = 0;
      goto LABEL_15;
    }
    if (!v6) {
      goto LABEL_14;
    }
    BOOL v9 = [v6 eventStore];

    if (v9 != self)
    {
      if (a4)
      {
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = 11;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    id v12 = [v6 source];
    if ([v6 allowEvents]
      && [v12 isPrimaryLocalSource]
      && ([v12 isEnabledForEvents] & 1) == 0
      && [(EKEventStore *)self clientCanModifySources])
    {
      [v12 setAllowsEvents:1];
      id v17 = 0;
      BOOL v13 = [(EKEventStore *)self saveSource:v12 commit:0 error:&v17];
      id v10 = v17;
      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          -[EKEventStore _saveCalendar:error:]();
          if (!a4) {
            goto LABEL_29;
          }
        }
        else if (!a4)
        {
          goto LABEL_29;
        }
        id v10 = v10;
        *a4 = v10;
        goto LABEL_29;
      }
      long long v14 = [v6 constraints];
      [v14 setAllowsEvents:1];

      int v15 = 0;
    }
    else
    {
      int v15 = 1;
    }
    if ([v6 validate:a4] && objc_msgSend(v6, "save:", a4))
    {
      [(EKEventStore *)self _addObjectToPendingCommits:v6];
      LODWORD(v10) = [(EKEventStore *)self save:a4];
    }
    else
    {
      LODWORD(v10) = 0;
    }
    if ((v15 | v10)) {
      goto LABEL_30;
    }
    long long v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    [(EKEventStore *)self rollbackObjectsWithIdentifiers:v16];

    id v10 = [v12 CADObjectID];
    [(EKEventStore *)self _clearCachedConstraintsForObjectWithCADObjectID:v10];
LABEL_29:

    LOBYTE(v10) = 0;
LABEL_30:

    goto LABEL_15;
  }
  *a4 = 0;
  if ([(EKEventStore *)self canModifyCalendarDatabase]) {
    goto LABEL_5;
  }
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = 30;
LABEL_13:
  [v7 errorWithEKErrorCode:v8];
  LOBYTE(v10) = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return (char)v10;
}

- (BOOL)removeCalendar:(EKCalendar *)calendar commit:(BOOL)commit error:(NSError *)error
{
  id v12 = 0;
  BOOL v6 = [(EKEventStore *)self _removeCalendar:calendar commit:commit error:&v12];
  id v7 = v12;
  uint64_t v8 = v7;
  if (error) {
    *error = (NSError *)v7;
  }
  BOOL v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_INFO, "Removed calendar successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore removeCalendar:commit:error:]();
  }

  return v6;
}

- (BOOL)_removeCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (![(EKEventStore *)self shouldSaveCalendarAsEventCalendar:v8]
    || (LOBYTE(v9) = 0,
        [(EKEventStore *)self _removeEventCalendar:v8 commit:0 error:a5]))
  {
    if ([(EKEventStore *)self shouldSaveCalendarAsReminderCalendar:v8])
    {
      BOOL v9 = [(EKReminderStore *)self->_reminderStore removeCalendar:v8 error:a5];
      if (!v9) {
        goto LABEL_9;
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
    if (v6) {
      LOBYTE(v9) = [(EKEventStore *)self commitWithRollbackForNewClients:a5];
    }
  }
LABEL_9:

  return v9;
}

- (BOOL)_removeEventCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (a5)
  {
    *a5 = 0;
    if (![(EKEventStore *)self canModifyCalendarDatabase])
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = 30;
LABEL_11:
      [v12 errorWithEKErrorCode:v13];
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (!v8) {
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v9 = [(EKEventStore *)self canModifyCalendarDatabase];
    BOOL v10 = 0;
    if (!v8 || !v9) {
      goto LABEL_17;
    }
  }
  long long v11 = [v8 eventStore];

  if (v11 != self)
  {
    if (!a5)
    {
LABEL_16:
      BOOL v10 = 0;
      goto LABEL_17;
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 11;
    goto LABEL_11;
  }
  if (![v8 remove:a5]) {
    goto LABEL_16;
  }
  [(EKEventStore *)self _addRemovedObjectToPendingCommits:v8];
  if (![(EKEventStore *)self save:a5]) {
    goto LABEL_16;
  }
  [v8 markAsDeleted];
  BOOL v10 = !v6 || [(EKEventStore *)self commitWithRollbackForNewClients:a5];
LABEL_17:

  return v10;
}

- (BOOL)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a5)
  {
    *a5 = 0;
    if (![(EKEventStore *)self canModifyCalendarDatabase])
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = 30;
LABEL_11:
      [v12 errorWithEKErrorCode:v13];
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (!v8) {
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v9 = [(EKEventStore *)self canModifyCalendarDatabase];
    BOOL v10 = 0;
    if (!v8 || !v9) {
      goto LABEL_17;
    }
  }
  long long v11 = [v8 eventStore];

  if (v11 != self)
  {
    if (!a5)
    {
LABEL_12:
      BOOL v10 = 0;
      goto LABEL_17;
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 11;
    goto LABEL_11;
  }
  unint64_t v14 = [v8 allowedEntityTypes] & ~a4;
  if (v14)
  {
    [v8 setAllowedEntityTypes:v14];
    BOOL v15 = [(EKEventStore *)self saveCalendar:v8 commit:1 error:a5];
  }
  else
  {
    BOOL v15 = [(EKEventStore *)self removeCalendar:v8 commit:1 error:a5];
  }
  BOOL v10 = v15;
LABEL_17:

  return v10;
}

- (BOOL)eventsExistOnCalendar:(id)a3
{
  uint64_t v4 = [(EKEventStore *)self predicateForCalendarItemsOfType:1 inCalendar:a3];
  char v5 = [(EKEventStore *)self eventsMatchingPredicate:v4];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)futureScheduledEventsExistOnCalendar:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EKEventStore *)self predicateForEventsWithAttendeesInCalendar:a3];
  uint64_t v22 = self;
  char v5 = [(EKEventStore *)self eventsMatchingPredicate:v4];
  BOOL v6 = [MEMORY[0x1E4F1C9C8] now];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7)
  {
    BOOL v18 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v20 = v4;
  uint64_t v9 = *(void *)v24;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(obj);
      }
      long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v12 = [v11 endDateUnadjustedForLegacyClients];
      if ([v6 compare:v12] == -1)
      {
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];
        unint64_t v14 = [(EKEventStore *)v22 doEvents:v13 haveOccurrencesAfterDate:v6];
        BOOL v15 = [v14 firstObject];
        uint64_t v16 = [v15 integerValue];

        if (v16 != 1) {
          continue;
        }
      }
      id v17 = [v11 selfAttendee];
      if (v17)
      {

LABEL_17:
        BOOL v18 = 1;
        goto LABEL_18;
      }
      if ([v11 isSelfOrganized]) {
        goto LABEL_17;
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  BOOL v18 = 0;
LABEL_18:
  uint64_t v4 = v20;
LABEL_19:

  return v18;
}

- (BOOL)eventsMarkedScheduleAgentClientExistOnCalendar:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(EKEventStore *)self predicateForScheduleAgentClientEventsInCalendar:a3];
  char v5 = [(EKEventStore *)self eventsMatchingPredicate:v4];
  BOOL v6 = [MEMORY[0x1E4F1C9C8] now];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v19 = v4;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v12 suppressNotificationForChanges] & 1) == 0)
        {
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
          unint64_t v14 = [(EKEventStore *)self doEvents:v13 haveOccurrencesAfterDate:v6];
          BOOL v15 = [v14 firstObject];
          uint64_t v16 = [v15 integerValue];

          if (v16 == 1)
          {
            BOOL v17 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    BOOL v17 = 0;
LABEL_12:
    uint64_t v4 = v19;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)eventsWithIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[EKEventStore eventWithIdentifier:](self, "eventWithIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];

  return v12;
}

- (id)eventWithRecurrenceIdentifier:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 localUID];
  id v6 = [(EKEventStore *)self calendarItemWithIdentifier:v5];
  uint64_t v7 = v6;
  if (!v6)
  {
    long long v15 = 0;
    goto LABEL_28;
  }
  uint64_t v8 = NSString;
  uint64_t v9 = [v6 uniqueID];
  uint64_t v10 = [v4 recurrenceDate];
  [v10 timeIntervalSinceReferenceDate];
  id v12 = [v8 stringWithFormat:@"%@/RID=%lu", v9, (unint64_t)v11];

  uint64_t v13 = [(EKEventStore *)self eventWithUniqueId:v12];
  long long v14 = v13;
  if (!v13)
  {
    long long v16 = [v4 recurrenceDate];
    if (v16 && [v7 hasRecurrenceRules])
    {
      long long v17 = [v7 exceptionDates];
      char v18 = [v17 containsObject:v16];

      if (v18)
      {
        long long v15 = 0;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v19 = [v7 timeZone];
      long long v20 = v19;
      if (v19)
      {
        id v21 = v19;
      }
      else
      {
        id v21 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
      }
      long long v22 = v21;

      uint64_t v37 = v16;
      long long v23 = [MEMORY[0x1E4F57838] calendarDateWithDate:v16 timeZone:v22];
      long long v24 = objc_alloc_init(EKRecurrenceGenerator);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v25 = [v7 recurrenceRules];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        long long v35 = v22;
        uint64_t v36 = v12;
        uint64_t v28 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v39 != v28) {
              objc_enumerationMutation(v25);
            }
            if ([(EKRecurrenceGenerator *)v24 occurrenceDate:v23 matchesRecurrenceRule:*(void *)(*((void *)&v38 + 1) + 8 * i) forEvent:v7 includeDetachedEventsInSeries:0])
            {

              id v12 = v36;
              long long v14 = 0;
              long long v16 = v37;
              goto LABEL_22;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v27) {
            continue;
          }
          break;
        }

        long long v15 = 0;
        long long v22 = v35;
        id v12 = v36;
      }
      else
      {

        long long v15 = 0;
      }
      long long v16 = v37;
      long long v14 = 0;
    }
    else
    {
LABEL_22:
      uint64_t v30 = [v7 timeZone];

      if (!v30)
      {
        char v31 = [(EKEventStore *)self timeZone];
        uint64_t v32 = [v16 dateInTimeZone:v31 fromTimeZone:0];

        long long v16 = (void *)v32;
      }
      long long v33 = [EKEvent alloc];
      long long v22 = [v7 persistentObject];
      long long v15 = [(EKEvent *)v33 initWithPersistentObject:v22 occurrenceDate:v16];
    }

    goto LABEL_26;
  }
  long long v15 = v13;
LABEL_27:

LABEL_28:

  return v15;
}

- (EKEvent)eventWithIdentifier:(NSString *)identifier
{
  id v4 = identifier;
  if (v4)
  {
    [(EKEventStore *)self _implicitUpgradeToFullAccessIfNeededWithReason:6];
    [(NSString *)v4 rangeOfString:*MEMORY[0x1E4F57918]];
    if (v5)
    {
      id v6 = [(EKEventStore *)self _eventWithEventIdentifier:v4];
    }
    else
    {
      uint64_t v8 = +[EKRecurrenceIdentifier recurrenceIdentifierWithString:v4];
      id v6 = [(EKEventStore *)self eventWithRecurrenceIdentifier:v8];
    }
    uint64_t v7 = [(EKEventStore *)self _apiExpectedEventForEvent:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (EKEvent *)v7;
}

- (id)validatedNonDeletedPersistentObjectWithObjectID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_16;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(EKEventStore *)self objectsPendingCommit];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
      double v11 = [v10 objectID];
      char v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v7) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    uint64_t v13 = [v10 persistentObject];

    if (v13) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_10:
  }
  uint64_t v13 = [(EKEventStore *)self registerFetchedObjectWithID:v4];
  if (v13)
  {
LABEL_13:
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    unsavedChangesQueue = self->_unsavedChangesQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__EKEventStore_validatedNonDeletedPersistentObjectWithObjectID___block_invoke;
    block[3] = &unk_1E5B97028;
    long long v20 = &v21;
    block[4] = self;
    id v15 = v13;
    id v19 = v15;
    dispatch_sync(unsavedChangesQueue, block);
    id v16 = 0;
    if (!*((unsigned char *)v22 + 24)) {
      id v16 = v15;
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
LABEL_16:
    id v16 = 0;
  }

  return v16;
}

uint64_t __64__EKEventStore_validatedNonDeletedPersistentObjectWithObjectID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 312) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)validatedNonDeletedPublicObjectWithObjectID:(id)a3
{
  if (a3)
  {
    id v4 = -[EKEventStore validatedNonDeletedPersistentObjectWithObjectID:](self, "validatedNonDeletedPersistentObjectWithObjectID:");
    if (v4)
    {
      uint64_t v5 = [(EKEventStore *)self publicObjectWithPersistentObject:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_eventWithEventIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__23;
    long long v33 = __Block_byref_object_dispose__23;
    id v34 = 0;
    if ([(EKEventStore *)self eventAccessLevel] == 2)
    {
      [(EKEventStore *)self objectsPendingCommit];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v26 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v10 = [v9 eventIdentifier];
              int v11 = [v4 isEqual:v10];

              if (v11)
              {
                uint64_t v13 = [v9 objectID];
                long long v14 = (void *)v30[5];
                v30[5] = v13;

                goto LABEL_15;
              }
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    uint64_t v15 = v30[5];
    if (!v15)
    {
      id v16 = [(EKEventStore *)self connection];
      long long v17 = [v16 CADOperationProxySync];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __42__EKEventStore__eventWithEventIdentifier___block_invoke;
      long long v22 = &unk_1E5B99E40;
      id v23 = v4;
      char v24 = &v29;
      [v17 CADDatabaseGetEventWithEventIdentifier:v23 reply:&v19];

      uint64_t v15 = v30[5];
    }
    char v12 = -[EKEventStore validatedNonDeletedPublicObjectWithObjectID:](self, "validatedNonDeletedPublicObjectWithObjectID:", v15, v19, v20, v21, v22);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

void __42__EKEventStore__eventWithEventIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __42__EKEventStore__eventWithEventIdentifier___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (BOOL)_parseURI:(id)a3 expectedScheme:(id)a4 identifier:(id *)a5 options:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  int v11 = [v9 scheme];
  if ([v11 isEqualToString:v10])
  {
    char v12 = [v9 absoluteString];
    uint64_t v13 = objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v11, "length") + 3);

    long long v14 = [v13 componentsSeparatedByString:@"?"];
    if (![v14 count])
    {
      BOOL v38 = 0;
LABEL_30:

      goto LABEL_31;
    }
    long long v51 = a6;
    uint64_t v15 = [v14 objectAtIndex:0];

    id v16 = [v15 pathComponents];
    if ([v11 isEqualToString:@"x-apple-calevent"])
    {
      if ([v16 count] == 2)
      {
        long long v17 = NSString;
        char v18 = [v16 objectAtIndex:0];
        [v18 stringByRemovingPercentEncoding];
        id v46 = v15;
        uint64_t v19 = v48 = v16;
        uint64_t v20 = [v16 objectAtIndex:1];
        uint64_t v21 = [v20 stringByRemovingPercentEncoding];
        long long v22 = [v17 stringWithFormat:@"%@:%@", v19, v21];

        uint64_t v15 = v46;
        if (v22)
        {
LABEL_6:
          if (a5) {
            *a5 = v22;
          }
          id v16 = v48;
          if (v51)
          {
            long long v45 = v22;
            *long long v51 = 0;
            id v23 = [v9 query];
            char v24 = v23;
            if (v23)
            {
              long long v47 = v15;
              uint64_t v44 = v14;
              long long v25 = [v23 componentsSeparatedByString:@"&"];
              id v50 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
              if ([v25 count])
              {
                unint64_t v26 = 0;
                long long v27 = @"=";
                id v49 = v24;
                do
                {
                  long long v28 = [v24 componentsSeparatedByString:v27];
                  if ([v28 count] == 2)
                  {
                    uint64_t v29 = [v28 objectAtIndex:0];
                    [v28 objectAtIndex:1];
                    uint64_t v30 = v11;
                    id v31 = v9;
                    id v32 = v10;
                    long long v33 = v25;
                    v35 = id v34 = v27;
                    uint64_t v36 = [v35 stringByRemovingPercentEncoding];

                    long long v27 = v34;
                    long long v25 = v33;
                    id v10 = v32;
                    id v9 = v31;
                    int v11 = v30;
                    [v50 setObject:v36 forKey:v29];

                    char v24 = v49;
                  }

                  ++v26;
                }
                while (v26 < [v25 count]);
              }
              id v37 = v50;
              *long long v51 = v37;

              long long v14 = v44;
              uint64_t v15 = v47;
              id v16 = v48;
            }

            BOOL v38 = 1;
            long long v22 = v45;
          }
          else
          {
            BOOL v38 = 1;
          }
          goto LABEL_29;
        }
        goto LABEL_27;
      }
LABEL_28:
      long long v22 = 0;
      BOOL v38 = 0;
      goto LABEL_29;
    }
    if ([v11 isEqualToString:@"x-apple-calendar"])
    {
      if ([v16 count] != 1) {
        goto LABEL_28;
      }
      uint64_t v48 = v16;
      long long v39 = v16;
      uint64_t v40 = 0;
    }
    else
    {
      if (![v11 isEqualToString:@"x-apple-reminderkit"]) {
        goto LABEL_28;
      }
      if ([v16 count] != 2) {
        goto LABEL_28;
      }
      long long v41 = [v16 firstObject];
      int v42 = [v41 isEqualToString:@"REMCDReminder"];

      if (!v42) {
        goto LABEL_28;
      }
      uint64_t v48 = v16;
      long long v39 = v16;
      uint64_t v40 = 1;
    }
    long long v22 = [v39 objectAtIndex:v40];
    if (v22) {
      goto LABEL_6;
    }
LABEL_27:
    BOOL v38 = 0;
    id v16 = v48;
LABEL_29:

    uint64_t v13 = v15;
    goto LABEL_30;
  }
  BOOL v38 = 0;
LABEL_31:

  return v38;
}

- (id)eventWithExternalURI:(id)a3
{
  return [(EKEventStore *)self _eventWithURI:a3 checkValid:1];
}

- (id)_eventWithURI:(id)a3 checkValid:(BOOL)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__23;
  id v34 = __Block_byref_object_dispose__23;
  id v35 = 0;
  if (!v6)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:3431 description:@"Nil URI passed"];
  }
  id v28 = 0;
  id v29 = 0;
  BOOL v7 = [(EKEventStore *)self _parseURI:v6 expectedScheme:@"x-apple-calevent" identifier:&v29 options:&v28];
  id v8 = v29;
  id v9 = v28;
  id v10 = v9;
  if (v7)
  {
    if (v9)
    {
      int v11 = [v9 objectForKey:@"o"];
      char v12 = v11;
      if (v11)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
        [v11 doubleValue];
        long long v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        long long v14 = 0;
      }
    }
    else
    {
      long long v14 = 0;
    }
    id v16 = [(EKEventStore *)self connection];
    long long v17 = [v16 CADOperationProxySync];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    char v24 = __41__EKEventStore__eventWithURI_checkValid___block_invoke;
    long long v25 = &unk_1E5B99E40;
    id v26 = v6;
    long long v27 = &v30;
    [v17 CADDatabaseGetEventWithEventIdentifier:v8 reply:&v22];

    if (v31[5])
    {
      char v18 = -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v22, v23, v24, v25);
      if (v18) {
        uint64_t v19 = [[EKEvent alloc] initWithPersistentObject:v18 occurrenceDate:v14];
      }
      else {
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    uint64_t v15 = v19;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore _eventWithURI:checkValid:]();
    }
    uint64_t v15 = 0;
  }

  _Block_object_dispose(&v30, 8);

  return v15;
}

void __41__EKEventStore__eventWithURI_checkValid___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __41__EKEventStore__eventWithURI_checkValid___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)_eventOccurrenceWithURI:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__23;
  uint64_t v32 = __Block_byref_object_dispose__23;
  id v33 = 0;
  id v26 = 0;
  id v27 = 0;
  BOOL v5 = [(EKEventStore *)self _parseURI:v4 expectedScheme:@"x-apple-calevent" identifier:&v27 options:&v26];
  id v6 = v27;
  id v7 = v26;
  id v8 = v7;
  if (v5)
  {
    if (!v7) {
      goto LABEL_11;
    }
    id v9 = [v7 objectForKey:@"o"];
    id v10 = v9;
    if (!v9) {
      goto LABEL_11;
    }
    int v11 = (void *)MEMORY[0x1E4F1C9C8];
    [v9 doubleValue];
    char v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");

    if (v12)
    {
      uint64_t v13 = [(EKEventStore *)self connection];
      long long v14 = [v13 CADOperationProxySync];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __40__EKEventStore__eventOccurrenceWithURI___block_invoke;
      uint64_t v23 = &unk_1E5B99E40;
      id v24 = v4;
      long long v25 = &v28;
      [v14 CADDatabaseGetEventWithEventIdentifier:v6 reply:&v20];

      if (v29[5])
      {
        objc_msgSend(v12, "timeIntervalSinceReferenceDate", v20, v21, v22, v23);
        uint64_t v15 = -[EKEventStore closestCachedOccurrenceToDate:forEventObjectID:](self, "closestCachedOccurrenceToDate:forEventObjectID:", v29[5]);
        id v16 = [v15 startDate];
        int v17 = [v16 isEqualToDate:v12];

        if (v17) {
          id v18 = v15;
        }
        else {
          id v18 = 0;
        }
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
LABEL_11:
      id v18 = [(EKEventStore *)self _eventWithURI:v4 checkValid:1];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore _eventWithURI:checkValid:]();
    }
    id v18 = 0;
  }

  _Block_object_dispose(&v28, 8);

  return v18;
}

void __40__EKEventStore__eventOccurrenceWithURI___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __41__EKEventStore__eventWithURI_checkValid___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)eventForUID:(id)a3 occurrenceDate:(id)a4
{
  return [(EKEventStore *)self eventForUID:a3 occurrenceDate:a4 checkValid:1];
}

- (id)eventForUID:(id)a3 occurrenceDate:(id)a4 checkValid:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F57428]), "initWithEntityType:entityID:", 2, objc_msgSend(v8, "intValue"));
    int v11 = [(EKEventStore *)self connection];
    char v12 = [v11 CADOperationProxySync];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke;
    v20[3] = &unk_1E5B99230;
    v20[4] = &v21;
    [v12 CADObjectExists:v10 reply:v20];

    if (*((unsigned char *)v22 + 24))
    {
      uint64_t v13 = +[EKObjectID objectIDWithCADObjectID:v10];
      long long v14 = [(EKEventStore *)self registerFetchedObjectWithID:v13];
    }
    else
    {
      long long v14 = 0;
    }

    _Block_object_dispose(&v21, 8);
    if (!v14) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v16 = [v8 intValue];
    int v17 = +[EKObjectID objectIDWithEntityType:2 rowID:v16 databaseID:*MEMORY[0x1E4F574B8]];
    long long v14 = [(EKEventStore *)self registerFetchedObjectWithID:v17];

    if (!v14)
    {
LABEL_10:
      id v18 = 0;
      goto LABEL_11;
    }
  }
  id v18 = [[EKEvent alloc] initWithPersistentObject:v14 occurrenceDate:v9];
LABEL_11:
  uint64_t v15 = v18;

LABEL_12:

  return v15;
}

void __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)eventForObjectID:(id)a3 occurrenceDate:(id)a4
{
  return [(EKEventStore *)self eventForObjectID:a3 occurrenceDate:a4 checkValid:1];
}

void __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)eventWithUniqueId:(id)a3
{
  return [(EKEventStore *)self eventWithUniqueId:a3 occurrenceDate:0];
}

- (id)eventWithUniqueId:(id)a3 occurrenceDate:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__23;
  id v34 = __Block_byref_object_dispose__23;
  id v35 = 0;
  if (v6)
  {
    [(EKEventStore *)self objectsPendingCommit];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v12 = [v11 uniqueIdentifier];
            int v13 = [v6 isEqual:v12];

            if (v13)
            {
              uint64_t v15 = [v11 objectID];
              uint64_t v16 = (void *)v31[5];
              v31[5] = v15;

              goto LABEL_14;
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    uint64_t v17 = v31[5];
    if (!v17)
    {
      id v18 = [(EKEventStore *)self connection];
      uint64_t v19 = [v18 CADOperationProxySync];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke;
      void v23[3] = &unk_1E5B99E40;
      id v24 = v6;
      long long v25 = &v30;
      [v19 CADDatabaseGetEventWithUniqueID:v24 reply:v23];

      uint64_t v17 = v31[5];
    }
    uint64_t v20 = [(EKEventStore *)self validatedNonDeletedPersistentObjectWithObjectID:v17];
    if (v20) {
      long long v14 = [[EKEvent alloc] initWithPersistentObject:v20 occurrenceDate:v22];
    }
    else {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }
  _Block_object_dispose(&v30, 8);

  return v14;
}

void __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)eventWithUUID:(id)a3 occurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__23;
    long long v25 = __Block_byref_object_dispose__23;
    id v26 = 0;
    uint64_t v8 = [(EKEventStore *)self connection];
    uint64_t v9 = [v8 CADOperationProxySync];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke;
    id v18 = &unk_1E5B99E40;
    id v19 = v6;
    uint64_t v20 = &v21;
    [v9 CADDatabaseGetCalendarItemWithUUID:v19 reply:&v15];

    if (v22[5])
    {
      id v10 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v15, v16, v17, v18);
      int v11 = [(EKEventStore *)self registerFetchedObjectWithID:v10];

      if (v11) {
        char v12 = [[EKEvent alloc] initWithPersistentObject:v11 occurrenceDate:v7];
      }
      else {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
    int v13 = v12;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

void __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)_entityWrappersForEventUUIDs:(id)a3 inCalendars:(id)a4 propertiesToLoad:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 valueForKey:@"CADObjectID"];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__23;
  id v24 = __Block_byref_object_dispose__23;
  id v25 = 0;
  char v12 = [(EKEventStore *)self connection];
  int v13 = [v12 CADOperationProxySync];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke;
  v17[3] = &unk_1E5B986A0;
  id v14 = v8;
  id v18 = v14;
  id v19 = &v20;
  [v13 CADDatabaseGetCalendarItemsWithUUIDs:v14 inCalendars:v11 propertiesToLoad:v10 reply:v17];

  id v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (BOOL)eventWithUUID:(id)a3 isInCalendars:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[EKEventStore _entityWrappersForEventUUIDs:inCalendars:propertiesToLoad:](self, "_entityWrappersForEventUUIDs:inCalendars:propertiesToLoad:", v9, v7, MEMORY[0x1E4F1CBF0], v12, v13);

  LOBYTE(v8) = [v10 count] != 0;
  return (char)v8;
}

- (id)eventsWithUUIDToOccurrenceDateMap:(id)a3 inCalendars:(id)a4
{
  v47[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x1E4F56C38];
    v47[0] = *MEMORY[0x1E4F57150];
    v47[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F56FB0];
    v47[2] = *MEMORY[0x1E4F56D00];
    v47[3] = v9;
    v47[4] = *MEMORY[0x1E4F56C90];
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:5];
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    id v12 = [v6 allKeys];
    id v35 = (void *)v10;
    uint64_t v13 = [(EKEventStore *)self _entityWrappersForEventUUIDs:v12 inCalendars:v7 propertiesToLoad:v10];

    if (v13)
    {
      long long v29 = v13;
      id v30 = v7;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v13;
      uint64_t v36 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v36)
      {
        id v33 = v6;
        uint64_t v34 = *(void *)v42;
        uint64_t v32 = self;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v42 != v34) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v16 = objc_msgSend(v15, "loadedValues", v29, v30);
            uint64_t v17 = [v16 firstObject];

            id v18 = [v15 objectID];
            id v19 = +[EKObjectID objectIDWithCADObjectID:v18];
            uint64_t v20 = [v15 loadedValues];
            uint64_t v21 = [(EKEventStore *)self registerFetchedObjectWithID:v19 withDefaultLoadedPropertyKeys:v35 values:v20];

            if (v21)
            {
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              uint64_t v22 = [v6 objectForKeyedSubscript:v17];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v38;
                do
                {
                  for (uint64_t j = 0; j != v24; ++j)
                  {
                    if (*(void *)v38 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    long long v27 = [[EKEvent alloc] initWithPersistentObject:v21 occurrenceDate:*(void *)(*((void *)&v37 + 1) + 8 * j)];
                    [v11 addObject:v27];
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
                }
                while (v24);
              }

              self = v32;
              id v6 = v33;
            }
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v36);
      }

      uint64_t v13 = v29;
      id v7 = v30;
    }
  }
  else
  {
    int v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)allEventsWithUniqueId:(id)a3 occurrenceDate:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v18 = (id)objc_opt_new();
  if (v6)
  {
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__23;
    id v30 = __Block_byref_object_dispose__23;
    id v31 = 0;
    uint64_t v8 = [(EKEventStore *)self connection];
    uint64_t v9 = [v8 CADOperationProxySync];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke;
    void v23[3] = &unk_1E5B986A0;
    id v24 = v6;
    uint64_t v25 = &v26;
    [v9 CADDatabaseGetAllEventsWithUniqueID:v24 reply:v23];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = (id)v27[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          if (*(void *)(*((void *)&v19 + 1) + 8 * i))
          {
            id v14 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
            id v15 = [(EKEventStore *)self registerFetchedObjectWithID:v14];

            if (v15)
            {
              uint64_t v16 = [[EKEvent alloc] initWithPersistentObject:v15 occurrenceDate:v7];
              [v18 addObject:v16];
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v32 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(&v26, 8);
  }

  return v18;
}

void __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)_apiExpectedEventForEvent:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_apiExpectedEventsForEvents:(id)a3
{
  id v3 = a3;

  return v3;
}

- (BOOL)saveEvent:(EKEvent *)event span:(EKSpan)span error:(NSError *)error
{
  return [(EKEventStore *)self saveEvent:event span:span commit:1 error:error];
}

- (BOOL)removeEvent:(EKEvent *)event span:(EKSpan)span error:(NSError *)error
{
  return [(EKEventStore *)self removeEvent:event span:span commit:1 error:error];
}

- (BOOL)saveEvent:(EKEvent *)event span:(EKSpan)span commit:(BOOL)commit error:(NSError *)error
{
  BOOL v7 = commit;
  id v10 = EKSavingSignpostsHandle;
  uint64_t v11 = event;
  os_signpost_id_t v12 = os_signpost_id_generate(v10);
  uint64_t v13 = (id)EKSavingSignpostsHandle;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4E47000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "saveEvent", "", buf, 2u);
  }

  id v24 = 0;
  BOOL v15 = [(EKEventStore *)self _saveEvent:v11 span:span commit:v7 error:&v24];

  id v16 = v24;
  uint64_t v17 = v16;
  if (error) {
    *error = (NSError *)v16;
  }
  id v18 = EKLogHandle;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1A4E47000, v18, OS_LOG_TYPE_INFO, "Saved event successfully", v23, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore saveEvent:span:commit:error:]();
  }
  long long v19 = (id)EKSavingSignpostsHandle;
  long long v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4E47000, v20, OS_SIGNPOST_INTERVAL_END, v12, "saveEvent", "", v22, 2u);
  }

  return v15;
}

- (BOOL)_saveEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  if (a6)
  {
    *a6 = 0;
    if (![(EKEventStore *)self canModifyCalendarDatabase])
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 30;
      goto LABEL_11;
    }
    if (!v10) {
      goto LABEL_31;
    }
LABEL_7:
    uint64_t v13 = [v10 eventStore];

    if (v13 != self)
    {
      if (a6)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = 11;
LABEL_11:
        id v16 = [v14 errorWithEKErrorCode:v15];
LABEL_12:
        BOOL v12 = 0;
        *a6 = v16;
        goto LABEL_32;
      }
LABEL_31:
      BOOL v12 = 0;
      goto LABEL_32;
    }
    if (([v10 isNew] & 1) == 0)
    {
      uint64_t v17 = [v10 persistentObject];
      if ([v17 _isPendingInsert])
      {
      }
      else
      {
        id v18 = [v10 persistentObject];
        BOOL v19 = [(EKEventStore *)self _isRegisteredObject:v18];

        if (!v19)
        {
          if (a6)
          {
            id v16 = [MEMORY[0x1E4F28C58] errorWithCADResult:1010];
            goto LABEL_12;
          }
          goto LABEL_31;
        }
      }
    }
    if (![v10 validateWithSpan:a4 error:a6]) {
      goto LABEL_31;
    }
    char v20 = [v10 hasChanges];
    if ([v10 saveWithSpan:a4 error:a6])
    {
      if ((v20 & 1) != 0
        || ([v10 persistentObject],
            long long v21 = objc_claimAutoreleasedReturnValue(),
            int v22 = [v21 _isPendingInsert],
            v21,
            v22))
      {
        [(EKEventStore *)self _addObjectToPendingCommits:v10];
      }
      BOOL v23 = [(EKEventStore *)self save:a6];
      if (v23 && v7)
      {
        if ([(EKEventStore *)self commitWithRollbackForNewClients:a6])
        {
LABEL_25:
          BOOL v12 = 1;
          goto LABEL_32;
        }
      }
      else if (v23)
      {
        goto LABEL_25;
      }
    }
    id v24 = [v10 persistentObject];
    int v25 = [v24 _isPendingInsert];

    if (v25)
    {
      uint64_t v26 = [v10 persistentObject];
      [(EKEventStore *)self _deleteObject:v26];
    }
    goto LABEL_31;
  }
  BOOL v11 = [(EKEventStore *)self canModifyCalendarDatabase];
  BOOL v12 = 0;
  if (v10 && v11) {
    goto LABEL_7;
  }
LABEL_32:

  return v12;
}

- (BOOL)removeEvent:(EKEvent *)event span:(EKSpan)span commit:(BOOL)commit error:(NSError *)error
{
  BOOL v7 = commit;
  id v10 = EKSavingSignpostsHandle;
  BOOL v11 = event;
  os_signpost_id_t v12 = os_signpost_id_generate(v10);
  uint64_t v13 = (id)EKSavingSignpostsHandle;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4E47000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "removeEvent", "", buf, 2u);
  }

  id v24 = 0;
  BOOL v15 = [(EKEventStore *)self _removeEvent:v11 span:span commit:v7 error:&v24];

  id v16 = v24;
  uint64_t v17 = v16;
  if (error) {
    *error = (NSError *)v16;
  }
  id v18 = EKLogHandle;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v23 = 0;
      _os_log_impl(&dword_1A4E47000, v18, OS_LOG_TYPE_INFO, "Removed event successfully", v23, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore removeEvent:span:commit:error:]();
  }
  BOOL v19 = (id)EKSavingSignpostsHandle;
  char v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)int v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4E47000, v20, OS_SIGNPOST_INTERVAL_END, v12, "removeEvent", "", v22, 2u);
  }

  return v15;
}

- (BOOL)_removeEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (a6)
  {
    *a6 = 0;
    if (![(EKEventStore *)self canModifyCalendarDatabase])
    {
      BOOL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = 30;
      goto LABEL_13;
    }
    if (!v10) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v11 = [(EKEventStore *)self canModifyCalendarDatabase];
    LOBYTE(v12) = 0;
    if (!v10 || !v11) {
      goto LABEL_14;
    }
  }
  uint64_t v13 = [v10 eventStore];

  if (!v13) {
    goto LABEL_11;
  }
  id v14 = [v10 eventStore];

  if (v14 != self)
  {
    if (a6)
    {
      BOOL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = 11;
LABEL_13:
      [v15 errorWithEKErrorCode:v16];
      LOBYTE(v12) = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_11:
    LOBYTE(v12) = 0;
    goto LABEL_14;
  }
  id v18 = objc_alloc((Class)objc_opt_class());
  BOOL v19 = [v10 persistentObject];
  char v20 = (void *)[v18 initWithPersistentObject:v19 objectForCopy:v10];

  if ([v10 _hasChangesForKey:*MEMORY[0x1E4F56C58]]
    && ([v10 virtualConference],
        long long v21 = objc_claimAutoreleasedReturnValue(),
        [v20 virtualConference],
        int v22 = objc_claimAutoreleasedReturnValue(),
        char v23 = [v21 isEqual:v22],
        v22,
        v21,
        (v23 & 1) == 0))
  {
    long long v37 = [v10 virtualConference];
  }
  else
  {
    long long v37 = 0;
  }
  long long v39 = v20;
  [v20 virtualConference];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v38 = v47 = 0u;
  id v24 = [v38 joinMethods];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = [*(id *)(*((void *)&v44 + 1) + 8 * i) URL];
        [v10 invalidateVirtualConferenceURLIfNeededOnCommit:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v26);
  }

  if ([v39 removeWithSpan:a4 error:a6])
  {
    [(EKEventStore *)self _addRemovedObjectToPendingCommits:v10];
    id v30 = v37;
    if ([(EKEventStore *)self save:a6])
    {
      [v10 markAsDeleted];
      BOOL v12 = !v7 || [(EKEventStore *)self commitWithRollbackForNewClients:a6];
      if (v12 && v37)
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v31 = [v37 joinMethods];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v41 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = [*(id *)(*((void *)&v40 + 1) + 8 * j) URL];
              +[EKConferenceUtils invalidateConferenceURL:v36];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v33);
        }

        LOBYTE(v12) = 1;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
    id v30 = v37;
  }

LABEL_14:
  return v12;
}

- (BOOL)setInvitationStatus:(unint64_t)a3 forEvent:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (v8)
  {
    v13[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    BOOL v11 = [(EKEventStore *)self setInvitationStatus:a3 forEvents:v10 error:a5];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)setInvitationStatus:(unint64_t)a3 forEvents:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a5) {
    *a5 = 0;
  }
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x3032000000;
  long long v44 = __Block_byref_object_copy__23;
  long long v45 = __Block_byref_object_dispose__23;
  id v46 = 0;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        BOOL v15 = [v14 eventStore];
        BOOL v16 = v15 == 0;

        if (v16) {
          goto LABEL_26;
        }
        uint64_t v17 = [v14 eventStore];
        BOOL v18 = v17 == self;

        if (!v18)
        {
          if (a5)
          {
            *a5 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
          }
LABEL_26:

          BOOL v26 = 0;
          goto LABEL_27;
        }
        BOOL v19 = [v14 CADObjectID];
        [v9 addObject:v19];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  char v20 = [(EKEventStore *)self connection];
  long long v21 = [v20 CADOperationProxySync];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke;
  v32[3] = &unk_1E5B99E68;
  v32[4] = &v41;
  v32[5] = &v33;
  [v21 CADEventSetInvitationStatus:a3 forEvents:v9 error:v32];

  if (a5) {
    *a5 = (id) v42[5];
  }
  if (*((unsigned char *)v34 + 24))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v47 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "clearInvitationStatus", (void)v28);
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v47 count:16];
      }
      while (v23);
    }
  }
  _Block_object_dispose(&v33, 8);
  BOOL v26 = 1;
LABEL_27:

  _Block_object_dispose(&v41, 8);
  return v26;
}

void __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke_cold_1(v3);
    }
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)creatorTeamIdentifierForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 CADObjectID];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__23;
  BOOL v15 = __Block_byref_object_dispose__23;
  id v16 = 0;
  id v6 = [(EKEventStore *)self connection];
  BOOL v7 = [v6 CADOperationProxySync];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__EKEventStore_creatorTeamIdentifierForEvent___block_invoke;
  v10[3] = &unk_1E5B99B70;
  void v10[4] = &v11;
  [v7 CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID:v5 reply:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __46__EKEventStore_creatorTeamIdentifierForEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke_cold_1(v6);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (BOOL)isCurrentProcessCreatorOfEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 CADObjectID];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v6 = [(EKEventStore *)self connection];
  uint64_t v7 = [v6 CADOperationProxySync];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__EKEventStore_isCurrentProcessCreatorOfEvent___block_invoke;
  v9[3] = &unk_1E5B99E90;
  v9[4] = &v10;
  [v7 CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID:v5 reply:v9];

  LOBYTE(v6) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v6;
}

uint64_t __47__EKEventStore_isCurrentProcessCreatorOfEvent___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)importICS:(id)a3 intoCalendar:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8 || ![v8 length])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = _NSMethodExceptionProem();
    [v10 raise:v11, @"%@: path is empty or nil", v12 format];
  }
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v8];
  if (v13)
  {
    id v14 = [(EKEventStore *)self importICSData:v13 intoCalendar:v9 options:a5];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)importICSData:(id)a3 intoCalendars:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [a4 valueForKey:@"CADObjectID"];
  uint64_t v10 = [(EKEventStore *)self _importEventsWithExternalIDs:0 fromICSData:v8 intoCalendarsWithIDs:v9 options:a5 batchSize:0];

  return v10;
}

- (id)importEventsWithExternalIDs:(id)a3 fromICSData:(id)a4 intoCalendars:(id)a5 options:(unint64_t)a6 batchSize:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a4;
  id v13 = a3;
  id v14 = [a5 valueForKey:@"CADObjectID"];
  BOOL v15 = [(EKEventStore *)self _importEventsWithExternalIDs:v13 fromICSData:v12 intoCalendarsWithIDs:v14 options:a6 batchSize:v7];

  return v15;
}

- (id)_importEventsWithExternalIDs:(id)a3 fromICSData:(id)a4 intoCalendarsWithIDs:(id)a5 options:(unint64_t)a6 batchSize:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__23;
  long long v28 = __Block_byref_object_dispose__23;
  id v29 = 0;
  BOOL v15 = [(EKEventStore *)self connection];
  id v16 = [v15 CADOperationProxySync];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke;
  v20[3] = &unk_1E5B99EB8;
  id v17 = v14;
  id v22 = self;
  uint64_t v23 = &v24;
  id v21 = v17;
  [v16 CADDatabaseImportEvents:v12 fromICSData:v13 intoCalendarsWithIDs:v17 optionsMask:a6 batchSize:v7 reply:v20];

  id v18 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v18;
}

void __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    char v20 = v6;
    id obj = v6;
    uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = v10;
          uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
          id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v13 = +[EKObjectID EKObjectIDsFromCADObjectIDs:v11];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = [*(id *)(a1 + 40) registerFetchedObjectWithID:*(void *)(*((void *)&v25 + 1) + 8 * v17)];
                if (v18)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    BOOL v19 = [[EKEvent alloc] initWithPersistentObject:v18];
                    [v12 addObject:v19];
                  }
                }

                ++v17;
              }
              while (v15 != v17);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v15);
          }

          uint64_t v10 = v24 + 1;
        }
        while (v24 + 1 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }

    id v6 = v20;
  }
}

- (id)importICSData:(id)a3 intoCalendar:(id)a4 options:(unint64_t)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9) {
      [v9 CADObjectID];
    }
    else {
    id v12 = [MEMORY[0x1E4F1CA98] null];
    }
    v18[0] = v8;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v17 = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    uint64_t v15 = [(EKEventStore *)self _importEventsWithExternalIDs:0 fromICSData:v13 intoCalendarsWithIDs:v14 options:a5 batchSize:0];
    uint64_t v11 = [v15 firstObject];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)ICSDataForCalendarItems:(id)a3 options:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__23;
  long long v26 = __Block_byref_object_dispose__23;
  id v27 = 0;
  uint64_t v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) CADObjectID];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }

  id v13 = [(EKEventStore *)self connection];
  uint64_t v14 = [v13 CADOperationProxySync];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__EKEventStore_ICSDataForCalendarItems_options___block_invoke;
  v17[3] = &unk_1E5B976B8;
  void v17[4] = &v22;
  [v14 CADDatabaseExportICSDataForCalendarItems:v7 options:a4 reply:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __48__EKEventStore_ICSDataForCalendarItems_options___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)ICSDataForCalendarItems:(id)a3 preventLineFolding:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  return [(EKEventStore *)self ICSDataForCalendarItems:a3 options:v4];
}

- (id)importVCSData:(id)a3 intoCalendars:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = 0x1E4F1C000uLL;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  if (v9 && (uint64_t v12 = [v9 count], v12 == objc_msgSend(v8, "count")))
  {
    uint64_t v35 = v11;
    if ([v8 count])
    {
      uint64_t v13 = 0;
      long long v32 = a5;
      id v33 = v9;
      id v34 = v8;
      while (1)
      {
        uint64_t v14 = [v8 objectAtIndexedSubscript:v13];
        id v15 = [v9 objectAtIndexedSubscript:v13];
        [*(id *)(v10 + 2632) array];
        v17 = id v16 = v8;
        long long v39 = (void *)v14;
        long long v18 = [MEMORY[0x1E4FB7FB8] parseVCSData:v14];
        uint64_t v19 = [v18 count];
        uint64_t v20 = v19;
        long long v38 = v18;
        if (v19)
        {
          uint64_t v36 = v19;
          uint64_t v37 = v13;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id obj = v18;
          uint64_t v42 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
          if (v42)
          {
            uint64_t v41 = *(void *)v49;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v49 != v41) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v43 = v21;
                uint64_t v22 = *(void **)(*((void *)&v48 + 1) + 8 * v21);
                long long v44 = 0u;
                long long v45 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                uint64_t v23 = [v22 children];
                uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
                if (v24)
                {
                  uint64_t v25 = v24;
                  uint64_t v26 = *(void *)v45;
                  do
                  {
                    for (uint64_t i = 0; i != v25; ++i)
                    {
                      if (*(void *)v45 != v26) {
                        objc_enumerationMutation(v23);
                      }
                      long long v28 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                      if ([v28 entityType] == 2)
                      {
                        uint64_t v29 = +[EKEvent eventWithEventStore:self];
                        [v29 updateWithVCSEntity:v28 inCalendar:v15];
                        [v17 addObject:v29];
                      }
                    }
                    uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
                  }
                  while (v25);
                }

                uint64_t v21 = v43 + 1;
              }
              while (v43 + 1 != v42);
              uint64_t v42 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
            }
            while (v42);
          }

          [v35 addObject:v17];
          id v9 = v33;
          id v8 = v34;
          a5 = v32;
          unint64_t v10 = 0x1E4F1C000;
          uint64_t v20 = v36;
          uint64_t v13 = v37;
        }
        else
        {
          id v8 = v16;
          unint64_t v10 = 0x1E4F1C000;
          if (a5)
          {
            *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:0 userInfo:0];
          }
        }

        if (!v20) {
          break;
        }
        if ([v8 count] <= (unint64_t)++v13) {
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:
      if ([(EKEventStore *)self commitWithRollback:a5])
      {
        uint64_t v11 = v35;
        id v30 = v35;
        goto LABEL_33;
      }
    }
    id v30 = 0;
    uint64_t v11 = v35;
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:3 userInfo:0];
    id v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = 0;
  }
LABEL_33:

  return v30;
}

- (CGColor)copyCGColorForNewCalendar
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = [(EKEventStore *)self colorStringForNewCalendar];
  id v3 = (__CFString *)v2;
  if (v2)
  {
    uint64_t v8 = 0;
    int v7 = 0;
    CFStringGetCString(v2, buffer, 100, 0x8000100u);
    sscanf(buffer, "#%02X%02X%02X", (char *)&v8 + 4, &v8, &v7);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v8, HIDWORD(v8))), (float32x2_t)vdup_n_s32(0x437F0000u)));
    double v10 = (float)((float)v7 / 255.0);
    uint64_t v11 = 0x3FF0000000000000;
    id v5 = CGColorCreate(DeviceRGB, components);
    CFRelease(DeviceRGB);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)colorStringForNewCalendar
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = [(EKEventStore *)self calendarsForEntityType:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v9 isHidden] & 1) == 0)
        {
          double v10 = [v9 colorString];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  uint64_t v11 = EKGetDefaultCalendarColors();
  uint64_t v12 = [v11 firstObject];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    unint64_t v17 = -1;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        unint64_t v20 = objc_msgSend(v3, "countForObject:", v19, (void)v24);
        if (v20 < v17)
        {
          unint64_t v21 = v20;
          id v22 = v19;

          unint64_t v17 = v21;
          uint64_t v12 = v22;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }

  return v12;
}

- (id)defaultLocalCalendar
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__23;
  id v13 = __Block_byref_object_dispose__23;
  id v14 = 0;
  id v3 = [(EKEventStore *)self connection];
  id v4 = [v3 CADOperationProxySync];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __36__EKEventStore_defaultLocalCalendar__block_invoke;
  v8[3] = &unk_1E5B99D88;
  void v8[4] = &v9;
  [v4 CADDatabaseGetDefaultLocalCalendarWithReply:v8];

  if (v10[5])
  {
    uint64_t v5 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    uint64_t v6 = [(EKEventStore *)self calendarWithID:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__EKEventStore_defaultLocalCalendar__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __36__EKEventStore_defaultLocalCalendar__block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (void)setDefaultCalendar:(id)a3 forNewEventsInDelegateSource:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore setDefaultCalendar:forNewEventsInDelegateSource:]();
    }
    goto LABEL_17;
  }
  if (!v7)
  {
    unint64_t v17 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v17;
      uint64_t v12 = [v6 objectID];
      id v13 = [v6 title];
      *(_DWORD *)buf = 138543618;
      long long v29 = v12;
      __int16 v30 = 2112;
      long long v31 = v13;
      _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "Setting default calendar for new events to %{public}@ (\"%@\")", buf, 0x16u);
      goto LABEL_11;
    }
LABEL_12:
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke;
    block[3] = &unk_1E5B97190;
    block[4] = self;
    id v19 = v7;
    id v26 = v19;
    id v20 = v6;
    id v27 = v20;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);
    unint64_t v21 = [(EKEventStore *)self connection];
    id v22 = [v21 CADOperationProxySync];
    uint64_t v23 = [v20 CADObjectID];
    long long v24 = [v19 CADObjectID];
    [v22 CADDatabaseSetDefaultCalendarForNewEvents:v23 delegateSource:v24 reply:&__block_literal_global_358];

    goto LABEL_17;
  }
  if ([v7 isDelegate])
  {
    uint64_t v8 = [v6 source];
    char v9 = [v7 isEqual:v8];

    double v10 = (void *)EKLogHandle;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        uint64_t v12 = [v6 objectID];
        id v13 = [v6 title];
        id v14 = [v7 objectID];
        uint64_t v15 = [v7 externalID];
        uint64_t v16 = [v7 title];
        *(_DWORD *)buf = 138544386;
        long long v29 = v12;
        __int16 v30 = 2112;
        long long v31 = v13;
        __int16 v32 = 2114;
        id v33 = v14;
        __int16 v34 = 2114;
        uint64_t v35 = v15;
        __int16 v36 = 2112;
        uint64_t v37 = v16;
        _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "Setting default calendar for new events to %{public}@ (\"%@\") in source %{public}@ (%{public}@ - \"%@\")", buf, 0x34u);

LABEL_11:
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore setDefaultCalendar:forNewEventsInDelegateSource:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore setDefaultCalendar:forNewEventsInDelegateSource:]();
  }
LABEL_17:
}

void __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 48) CADObjectID];
  CFStringRef v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2) {
    [v2 CADObjectID];
  }
  else {
  id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  [v3 setObject:v5 forKeyedSubscript:v4];
}

void __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    CFStringRef v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke_2_cold_1(v2);
    }
  }
}

- (EKCalendar)defaultCalendarForNewEvents
{
  return (EKCalendar *)[(EKEventStore *)self defaultCalendarForNewEventsInDelegateSource:0];
}

- (void)setDefaultCalendarForNewEvents:(id)a3
{
}

- (EKCalendar)defaultCalendarForNewReminders
{
  if ([(EKEventStore *)self returnReminderResults])
  {
    id v3 = [(EKReminderStore *)self->_reminderStore defaultCalendarForNewReminders];
  }
  else
  {
    id v3 = 0;
  }

  return (EKCalendar *)v3;
}

- (void)_clearCachedCalendars
{
  calendars = self->_calendars;
  self->_calendars = 0;

  calendarsByIdentifier = self->_calendarsByIdentifier;
  self->_calendarsByIdentifier = 0;

  defaultCalendarsForNewEventsIDBySourceID = self->_defaultCalendarsForNewEventsIDBySourceID;
  self->_defaultCalendarsForNewEventsIDBySourceID = 0;

  suggestedEventCalendarID = self->_suggestedEventCalendarID;
  self->_suggestedEventCalendarID = 0;

  naturalLanguageSuggestedEventCalendarID = self->_naturalLanguageSuggestedEventCalendarID;
  self->_naturalLanguageSuggestedEventCalendarID = 0;
}

- (void)_removeCachedCalendarFromSource:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  if (self->_defaultCalendarsForNewEventsIDBySourceID)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = [MEMORY[0x1E4F1CA98] null];
    v33[0] = v4;
    id v5 = [v28 CADObjectID];
    v33[1] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

    id obj = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v12 = [(NSMutableDictionary *)self->_defaultCalendarsForNewEventsIDBySourceID objectForKeyedSubscript:v11];
          if (v12)
          {
            id v13 = [(EKEventStore *)self calendarWithCADID:v12];
            id v14 = [v13 source];
            uint64_t v15 = [v14 persistentObject];
            int v16 = [v15 isEqual:v28];

            if (v16) {
              [(NSMutableDictionary *)self->_defaultCalendarsForNewEventsIDBySourceID removeObjectForKey:v11];
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v8);
    }
  }
  if (self->_suggestedEventCalendarID)
  {
    unint64_t v17 = -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:");
    long long v18 = [v17 source];
    id v19 = [v18 persistentObject];
    int v20 = [v19 isEqual:v28];

    if (v20)
    {
      suggestedEventCalendarID = self->_suggestedEventCalendarID;
      self->_suggestedEventCalendarID = 0;
    }
  }
  if (self->_naturalLanguageSuggestedEventCalendarID)
  {
    id v22 = -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:");
    uint64_t v23 = [v22 source];
    long long v24 = [v23 persistentObject];
    int v25 = [v24 isEqual:v28];

    if (v25)
    {
      naturalLanguageSuggestedEventCalendarID = self->_naturalLanguageSuggestedEventCalendarID;
      self->_naturalLanguageSuggestedEventCalendarID = 0;
    }
  }
}

- (void)_removeCachedCalendarWithCADID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableDictionary *)self->_calendars removeObjectForKey:v4];
  calendarsByIdentifier = self->_calendarsByIdentifier;
  self->_calendarsByIdentifier = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(NSMutableDictionary *)self->_defaultCalendarsForNewEventsIDBySourceID allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [(NSMutableDictionary *)self->_defaultCalendarsForNewEventsIDBySourceID objectForKeyedSubscript:v11];
        if ([v12 isEqual:v4]) {
          [(NSMutableDictionary *)self->_defaultCalendarsForNewEventsIDBySourceID removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([(CADGenerationStampedObjectID *)self->_suggestedEventCalendarID isEqual:v4])
  {
    suggestedEventCalendarID = self->_suggestedEventCalendarID;
    self->_suggestedEventCalendarID = 0;
  }
  if ([(CADGenerationStampedObjectID *)self->_naturalLanguageSuggestedEventCalendarID isEqual:v4])
  {
    naturalLanguageSuggestedEventCalendarID = self->_naturalLanguageSuggestedEventCalendarID;
    self->_naturalLanguageSuggestedEventCalendarID = 0;
  }
}

+ (id)eventDraftsPath
{
  CFStringRef v2 = (void *)CalDatabaseCopyDirectoryPath();
  id v3 = [v2 stringByAppendingPathComponent:@"Pending Events"];

  return v3;
}

- (BOOL)saveDraftOfEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[EKEventStore eventDraftsPath];
  LOBYTE(self) = [(EKEventStore *)self _saveDraftOfEvent:v4 toDirectory:v5];

  return (char)self;
}

- (BOOL)_saveDraftOfEvent:(id)a3 toDirectory:(id)a4
{
  return [(EKEventStore *)self _saveDraftOfEvent:a3 toDirectory:a4 withVersion:@"3.0"];
}

- (BOOL)_saveDraftOfEvent:(id)a3 toDirectory:(id)a4 withVersion:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 eventOccurrenceID];
  if ([v8 hasChanges] && (objc_msgSend(v8, "isDeleted") & 1) == 0)
  {
    long long v15 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
      __int16 v42 = 2114;
      uint64_t v43 = v11;
      __int16 v44 = 2112;
      id v45 = v9;
      __int16 v46 = 2112;
      long long v47 = self;
      _os_log_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_DEFAULT, "%s: Serializing %{public}@ to path %@ for event store %@", buf, 0x2Au);
    }
    long long v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v16 fileExistsAtPath:v9 isDirectory:0] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        -[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]();
      }
      id v39 = 0;
      char v17 = [v16 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v39];
      id v18 = v39;
      id v19 = v18;
      if ((v17 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
          -[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]();
        }

        goto LABEL_30;
      }
    }
    uint64_t v20 = [v8 eventOccurrenceID];
    __int16 v36 = [(EKEventStore *)self _draftPathForEventWithOccurrenceID:v20 draftDirectory:v9];

    unint64_t v21 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      uint64_t v23 = [v8 attendees];
      long long v24 = [v8 changeSet];
      int v25 = [v24 summary];
      *(_DWORD *)buf = 136316162;
      uint64_t v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
      __int16 v42 = 2114;
      uint64_t v43 = v11;
      __int16 v44 = 2112;
      id v45 = v23;
      __int16 v46 = 2112;
      long long v47 = v25;
      __int16 v48 = 2112;
      long long v49 = v36;
      _os_log_impl(&dword_1A4E47000, v22, OS_LOG_TYPE_DEFAULT, "%s: Serializing event %{public}@ with attendees %@ and with changeset %@ to file %@", buf, 0x34u);
    }
    id v26 = +[EKDefaultSerializerFactory createSerializerWithEventStore:self withVersion:v10];
    id v38 = 0;
    id v27 = [v26 serializeEvent:v8 error:&v38];
    id v28 = (EKEventStore *)v38;
    long long v29 = v28;
    if (v27)
    {

      id v37 = 0;
      int v30 = [v27 writeToFile:v36 options:1 error:&v37];
      long long v29 = (EKEventStore *)v37;
      long long v31 = EKLogHandle;
      if (!v30)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          id v33 = v31;
          uint64_t v35 = [v8 changeSet];
          __int16 v34 = [v35 summary];
          *(_DWORD *)buf = 136316162;
          uint64_t v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
          __int16 v42 = 2114;
          uint64_t v43 = v11;
          __int16 v44 = 2112;
          id v45 = v34;
          __int16 v46 = 2112;
          long long v47 = v36;
          __int16 v48 = 2112;
          long long v49 = v29;
          _os_log_error_impl(&dword_1A4E47000, v33, OS_LOG_TYPE_ERROR, "%s: Failed to serialize changeset event %{public}@ with changeset %@ to file %@: %@", buf, 0x34u);
        }
        BOOL v13 = 0;
LABEL_29:

        if (v27) {
          goto LABEL_6;
        }
LABEL_30:
        BOOL v13 = 0;
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
        _os_log_impl(&dword_1A4E47000, v31, OS_LOG_TYPE_DEFAULT, "%s: Serialization successful", buf, 0xCu);
      }
    }
    else
    {
      long long v32 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]((uint64_t)v29, v8, v32);
      }
    }
    BOOL v13 = 1;
    goto LABEL_29;
  }
  uint64_t v12 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
    __int16 v42 = 2114;
    uint64_t v43 = v11;
    _os_log_impl(&dword_1A4E47000, v12, OS_LOG_TYPE_DEFAULT, "%s: Event %{public}@ has no changes (or was deleted).  Not serializing", buf, 0x16u);
  }
  BOOL v13 = 1;
LABEL_6:

  return v13;
}

- (id)loadDraftOfEventWithOccurrenceID:(id)a3
{
  id v4 = a3;
  id v5 = +[EKEventStore eventDraftsPath];
  id v6 = [(EKEventStore *)self _loadDraftOfEventWithOccurrenceID:v4 fromDirectory:v5];

  return v6;
}

- (id)_loadDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4
{
  return [(EKEventStore *)self _loadDraftOfEventWithOccurrenceID:a3 fromDirectory:a4 withVersion:0];
}

- (id)_loadDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4 withVersion:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
    __int16 v59 = 2114;
    id v60 = v8;
    __int16 v61 = 2112;
    id v62 = v9;
    __int16 v63 = 2112;
    long long v64 = self;
    _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "%s: Loading event with occurrenceID %{public}@ from path %@ for event store %@", buf, 0x2Au);
  }
  uint64_t v12 = [(EKEventStore *)self _draftPathForEventWithOccurrenceID:v8 draftDirectory:v9];
  BOOL v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v13 fileExistsAtPath:v12 isDirectory:0])
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v12];
    if (v14)
    {
      long long v15 = +[EKDefaultSerializerFactory createSerializerWithEventStore:self withVersion:@"3.0"];
      long long v16 = v15;
      if (v10)
      {
        id v17 = v10;
      }
      else
      {
        id v17 = [v15 version];
      }
      uint64_t v54 = v17;
      if ([v17 isEqualToString:@"3.0"])
      {
        id v55 = 0;
        id v56 = 0;
        long long v51 = v16;
        uint64_t v20 = [v16 deserializeData:v14 isNew:&v56 error:&v55];
        id v52 = v56;
        id v50 = v55;
        int v53 = v20;
        if (v20)
        {
          [(EKEventStore *)self _deleteDraft:v12];
          unint64_t v21 = [v20 calendar];

          if (v21)
          {
            uint64_t v22 = [(EKEventStore *)self eventWithIdentifier:v8];
            long long v49 = (void *)v22;
            if (v22)
            {
              uint64_t v23 = (void *)v22;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
                -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.5();
              }
              long long v24 = [v23 diffWithObject:v20];
              int v25 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
                -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.4(v25);
              }
              long long v47 = v24;
              __int16 v48 = [v24 changeSetForDiff];
              id v26 = [v48 changedKeys];
              id v27 = (void *)[v26 mutableCopy];

              id v28 = [v53 changeSet];
              long long v29 = [v28 changedKeys];
              [v27 minusSet:v29];

              __int16 v46 = v27;
              int v30 = [v27 allObjects];
              [v48 rollbackChangesForKeys:v30];

              long long v31 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
                -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:](v31);
              }
              long long v32 = v49;
              [v49 applyChanges:v48];
              id v33 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v34 = v33;
                uint64_t v35 = [v49 changeSet];
                __int16 v36 = [v35 summary];
                *(_DWORD *)buf = 136315394;
                uint64_t v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
                __int16 v59 = 2112;
                id v60 = v36;
                _os_log_impl(&dword_1A4E47000, v34, OS_LOG_TYPE_DEFAULT, "%s: Applied changes to event: %@", buf, 0x16u);

                long long v32 = v49;
              }
              id v19 = v32;

              id v37 = v32;
              long long v16 = v51;
              id v38 = v52;
              id v39 = v50;
            }
            else
            {
              id v38 = v52;
              if (v52 && ![v52 BOOLValue])
              {
                __int16 v44 = EKLogHandle;
                long long v16 = v51;
                if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v58 = v8;
                  _os_log_impl(&dword_1A4E47000, v44, OS_LOG_TYPE_DEFAULT, "Discarding draft for event %{public}@ because the draft was for an event that has been deleted.", buf, 0xCu);
                }
                id v19 = 0;
              }
              else
              {
                uint64_t v41 = (void *)EKLogHandle;
                if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v42 = v41;
                  uint64_t v43 = [v20 attendees];
                  *(_DWORD *)buf = 136315650;
                  uint64_t v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
                  __int16 v59 = 2112;
                  id v60 = (char *)v20;
                  __int16 v61 = 2112;
                  id v62 = v43;
                  _os_log_impl(&dword_1A4E47000, v42, OS_LOG_TYPE_DEFAULT, "%s: Return deserialized event %@ with attendees %@", buf, 0x20u);
                }
                [v20 markAsNew];
                id v19 = v20;
                long long v16 = v51;
                id v38 = v52;
              }
              id v37 = 0;
              id v39 = v50;
            }
          }
          else
          {
            long long v40 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v58 = v8;
              _os_log_impl(&dword_1A4E47000, v40, OS_LOG_TYPE_DEFAULT, "Discarding draft for event %{public}@ because the draft was on a calendar that has been deleted.", buf, 0xCu);
            }
            id v19 = 0;
            long long v16 = v51;
            id v38 = v52;
            id v39 = v50;
          }
        }
        else
        {
          id v39 = v50;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
            -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]();
          }
          [(EKEventStore *)self _deleteDraft:v12];
          id v19 = 0;
          long long v16 = v51;
          id v38 = v52;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
          -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.6();
        }
        [(EKEventStore *)self _deleteDraft:v12];
        id v19 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]();
      }
      id v19 = 0;
    }
  }
  else
  {
    id v18 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
      __int16 v59 = 2112;
      id v60 = v12;
      _os_log_impl(&dword_1A4E47000, v18, OS_LOG_TYPE_DEFAULT, "%s: No file exists at path %@", buf, 0x16u);
    }
    id v19 = 0;
  }

  return v19;
}

- (void)deleteDraftOfEventWithOccurrenceID:(id)a3
{
  id v4 = a3;
  id v5 = +[EKEventStore eventDraftsPath];
  [(EKEventStore *)self _deleteDraftOfEventWithOccurrenceID:v4 fromDirectory:v5];
}

- (void)deleteAllDrafts
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Error trying to cleanup files from events pending changes: %@", v2);
}

- (void)_deleteDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4
{
  id v5 = [(EKEventStore *)self _draftPathForEventWithOccurrenceID:a3 draftDirectory:a4];
  [(EKEventStore *)self _deleteDraft:v5];
}

- (void)_deleteDraft:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v7];
  id v6 = v7;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEventStore _deleteDraft:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _deleteDraft:]();
  }
}

- (id)_draftPathForEventWithOccurrenceID:(id)a3 draftDirectory:(id)a4
{
  id v5 = a4;
  id v6 = [a3 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  id v7 = [NSString stringWithFormat:@"%@.plist", v6];
  id v8 = [NSString stringWithFormat:@"%@/%@", v5, v7];

  return v8;
}

- (BOOL)saveReminder:(id)a3 error:(id *)a4
{
  return [(EKEventStore *)self saveReminder:a3 commit:1 error:a4];
}

- (BOOL)saveReminder:(EKReminder *)reminder commit:(BOOL)commit error:(NSError *)error
{
  id v12 = 0;
  BOOL v6 = [(EKEventStore *)self _saveReminder:reminder commit:commit error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (error) {
    *error = (NSError *)v7;
  }
  id v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_INFO, "Saved reminder successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore saveReminder:commit:error:]();
  }

  return v6;
}

- (BOOL)_saveReminder:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 eventStore];

  if (v9 != self)
  {
    if (a5)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = 11;
LABEL_11:
      [v10 errorWithEKErrorCode:v11];
      LOBYTE(v12) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    LOBYTE(v12) = 0;
    goto LABEL_14;
  }
  if (![(EKEventStore *)self returnReminderResults])
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKEventStore _saveReminder:commit:error:]();
      if (!a5) {
        goto LABEL_13;
      }
    }
    else if (!a5)
    {
      goto LABEL_13;
    }
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 29;
    goto LABEL_11;
  }
  BOOL v12 = [(EKReminderStore *)self->_reminderStore saveReminder:v8 error:a5];
  if (v12 && v6) {
    LOBYTE(v12) = [(EKEventStore *)self commit:a5];
  }
LABEL_14:

  return v12;
}

- (BOOL)removeReminder:(id)a3 error:(id *)a4
{
  return [(EKEventStore *)self removeReminder:a3 commit:1 error:a4];
}

- (BOOL)removeReminder:(EKReminder *)reminder commit:(BOOL)commit error:(NSError *)error
{
  id v12 = 0;
  BOOL v6 = [(EKEventStore *)self _removeReminder:reminder commit:commit error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (error) {
    *error = (NSError *)v7;
  }
  id v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_INFO, "Removed reminder successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore removeReminder:commit:error:]();
  }

  return v6;
}

- (BOOL)_removeReminder:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(EKEventStore *)self returnReminderResults])
  {
    BOOL v9 = [(EKReminderStore *)self->_reminderStore removeReminder:v8 error:a5];
    if (v9 && v6) {
      LOBYTE(v9) = [(EKEventStore *)self commitWithRollbackForNewClients:a5];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)reminderWithExternalURI:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:4695 description:@"Nil URI passed"];
  }
  id v11 = 0;
  BOOL v6 = [(EKEventStore *)self _parseURI:v5 expectedScheme:@"x-apple-reminderkit" identifier:&v11 options:0];
  id v7 = v11;
  if (v6)
  {
    if ([0 isEqualToString:@"Reminder"])
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEventStore reminderWithExternalURI:]();
      }
    }
    else
    {
      id v8 = [(EKEventStore *)self calendarItemWithIdentifier:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore reminderWithExternalURI:]();
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (id)reminderWithUniqueId:(id)a3
{
  if (a3)
  {
    id v4 = -[EKReminderStore reminderWithUniqueId:](self->_reminderStore, "reminderWithUniqueId:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)eventsWithSameRecurrenceSetAsEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isDetached])
  {
    id v5 = [v4 originalItem];
    id v18 = [v5 recurrenceSet];
  }
  else
  {
    id v18 = [v4 recurrenceSet];
  }
  if (v18)
  {
    BOOL v6 = objc_opt_new();
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__23;
    int v30 = __Block_byref_object_dispose__23;
    id v31 = 0;
    id v7 = [(EKEventStore *)self connection];
    id v8 = [v7 CADOperationProxySync];
    BOOL v9 = [v4 calendar];
    id v10 = [v9 CADObjectID];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke;
    void v23[3] = &unk_1E5B986A0;
    id v24 = v18;
    int v25 = &v26;
    [v8 CADDatabaseGetCalendarItemsWithRecurrenceSet:v24 inCalendar:v10 reply:v23];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = (id)v27[5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = +[EKObjectID objectIDWithCADObjectID:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          long long v16 = [(EKEventStore *)self publicObjectWithFetchedObjectID:v15];

          if (v16) {
            [v6 addObject:v16];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v32 count:16];
      }
      while (v12);
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)calendarItemsWithUniqueIdentifier:(id)a3 inCalendar:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  id v7 = objc_opt_new();
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  int v30 = __Block_byref_object_copy__23;
  id v31 = __Block_byref_object_dispose__23;
  id v32 = 0;
  id v8 = [(EKEventStore *)self connection];
  BOOL v9 = [v8 CADOperationProxySync];
  id v10 = [v19 CADObjectID];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke;
  void v24[3] = &unk_1E5B986A0;
  id v11 = v6;
  id v25 = v11;
  uint64_t v26 = &v27;
  [v9 CADDatabaseGetCalendarItemsWithUniqueIdentifier:v11 inCalendar:v10 reply:v24];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = (id)v28[5];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = +[EKObjectID objectIDWithCADObjectID:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        id v17 = [(EKEventStore *)self publicObjectWithFetchedObjectID:v16];

        if (v17) {
          [v7 addObject:v17];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v33 count:16];
    }
    while (v13);
  }

  _Block_object_dispose(&v27, 8);

  return v7;
}

void __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)reminderWithIdentifier:(id)a3
{
  return [(EKReminderStore *)self->_reminderStore reminderWithIdentifier:a3];
}

- (EKCalendarItem)calendarItemWithIdentifier:(NSString *)identifier
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = identifier;
  if (![(EKEventStore *)self returnReminderResults]
    || ([(EKReminderStore *)self->_reminderStore reminderWithIdentifier:v4],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([(EKEventStore *)self returnEventResults])
    {
      uint64_t v30 = 0;
      id v31 = &v30;
      uint64_t v32 = 0x3032000000;
      uint64_t v33 = __Block_byref_object_copy__23;
      uint64_t v34 = __Block_byref_object_dispose__23;
      id v35 = 0;
      [(EKEventStore *)self objectsPendingCommit];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v27 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = [v10 uniqueIdentifier];
              int v12 = [(NSString *)v4 isEqual:v11];

              if (v12)
              {
                uint64_t v13 = [v10 objectID];
                uint64_t v14 = (void *)v31[5];
                v31[5] = v13;

                goto LABEL_16;
              }
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      uint64_t v15 = v31[5];
      if (!v15)
      {
        [(EKEventStore *)self _implicitUpgradeToFullAccessIfNeededWithReason:4];
        long long v16 = [(EKEventStore *)self connection];
        id v17 = [v16 CADOperationProxySync];
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        long long v22 = __43__EKEventStore_calendarItemWithIdentifier___block_invoke;
        long long v23 = &unk_1E5B99E40;
        id v24 = v4;
        id v25 = &v30;
        [v17 CADDatabaseGetCalendarItemWithUUID:v24 reply:&v20];

        uint64_t v15 = v31[5];
      }
      id v18 = -[EKEventStore validatedNonDeletedPublicObjectWithObjectID:](self, "validatedNonDeletedPublicObjectWithObjectID:", v15, v20, v21, v22, v23);
      if (v18)
      {
        id v5 = [(EKEventStore *)self _apiExpectedEventForEvent:v18];
      }
      else
      {
        id v5 = 0;
      }

      _Block_object_dispose(&v30, 8);
    }
    else
    {
      id v5 = 0;
    }
  }

  return (EKCalendarItem *)v5;
}

void __43__EKEventStore_calendarItemWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)_calendarItemsWithExternalIdentifier:(id)a3 inCalendars:(id)a4 entityTypes:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"externalIdentifier must be an instance of NSString"];
  }
  if ([v8 length])
  {
    if (v9)
    {
LABEL_6:
      id v10 = +[EKEventStore calendarObjectIDsForPredicate:v9];
      goto LABEL_10;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"externalIdentifier is empty"];
    if (v9) {
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_10:
  id v11 = objc_opt_new();
  if ((v5 & 2) != 0 && [(EKEventStore *)self returnReminderResults])
  {
    int v12 = [(EKReminderStore *)self->_reminderStore remindersWithExternalIdentifier:v8];
    [v11 addObjectsFromArray:v12];
  }
  if ((v5 & 1) != 0 && [(EKEventStore *)self returnEventResults])
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F56938]) initWithExternalIdentifier:v8 entityType:2];
    [v13 setCalendars:v10];
    uint64_t v14 = [(EKEventStore *)self _calendarItemsMatchingPredicate:v13];
    uint64_t v15 = [(EKEventStore *)self _apiExpectedEventsForEvents:v14];

    [v11 addObjectsFromArray:v15];
  }
  if (![v11 count])
  {
    long long v16 = [(EKEventStore *)self calendarItemWithIdentifier:v8];
    id v17 = v16;
    if (v16)
    {
      if (!v9
        || ([v16 calendar],
            id v18 = objc_claimAutoreleasedReturnValue(),
            [v18 CADObjectID],
            id v19 = objc_claimAutoreleasedReturnValue(),
            int v20 = [v10 containsObject:v19],
            v19,
            v18,
            v20))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = [(EKEventStore *)self _apiExpectedEventForEvent:v17];

          id v17 = (void *)v21;
        }
        [v11 addObject:v17];
      }
    }
  }
LABEL_25:

  return v11;
}

- (NSArray)calendarItemsWithExternalIdentifier:(NSString *)externalIdentifier
{
  id v4 = externalIdentifier;
  [(EKEventStore *)self _implicitUpgradeToFullAccessIfNeededWithReason:5];
  char v5 = [(EKEventStore *)self calendarItemsWithExternalIdentifier:v4 inCalendars:0];

  return (NSArray *)v5;
}

- (id)calendarItemsWithExternalIdentifier:(id)a3 inCalendars:(id)a4
{
  return [(EKEventStore *)self _calendarItemsWithExternalIdentifier:a3 inCalendars:a4 entityTypes:3];
}

- (id)eventsWithExternalIdentifier:(id)a3 inCalendars:(id)a4
{
  return [(EKEventStore *)self _calendarItemsWithExternalIdentifier:a3 inCalendars:a4 entityTypes:1];
}

- (id)remindersWithExternalIdentifier:(id)a3 inCalendars:(id)a4
{
  return [(EKEventStore *)self _calendarItemsWithExternalIdentifier:a3 inCalendars:a4 entityTypes:2];
}

- (id)_calendarItemsMatchingPredicate:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"predicate is nil"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"predicate is not a calendar item predicate created through EKEventStore"];
  }
  char v5 = +[EKPredicateSearch searchWithEntityClass:objc_opt_class() predicate:v4 store:self];
  uint64_t v6 = [v5 runSynchronously];

  return v6;
}

- (id)remindersMatchingPredicate:(id)a3
{
  return [(EKReminderStore *)self->_reminderStore remindersMatchingPredicate:a3];
}

- (id)fetchRemindersMatchingPredicate:(NSPredicate *)predicate completion:(void *)completion
{
  uint64_t v6 = predicate;
  uint64_t v7 = completion;
  if ([(EKEventStore *)self returnReminderResults])
  {
    reminderStore = self->_reminderStore;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __59__EKEventStore_fetchRemindersMatchingPredicate_completion___block_invoke;
    v11[3] = &unk_1E5B99F30;
    void v11[4] = self;
    id v12 = v7;
    id v9 = [(EKReminderStore *)reminderStore fetchRemindersMatchingPredicate:v6 completion:v11];
  }
  else
  {
    (*((void (**)(void *, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
    id v9 = +[EKNullFetchRequestToken sharedToken];
  }

  return v9;
}

uint64_t __59__EKEventStore_fetchRemindersMatchingPredicate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSPredicate)predicateForRemindersInCalendars:(NSArray *)calendars
{
  return (NSPredicate *)[(EKReminderStore *)self->_reminderStore predicateForRemindersInCalendars:calendars];
}

- (id)predicateForCalendarStoreForRemindersInCalendars:(id)a3
{
  return [(EKReminderStore *)self->_reminderStore predicateForCalendarStoreForRemindersInCalendars:a3];
}

- (id)predicateForRemindersInCalendars:(id)a3 preloadProperties:(id)a4
{
  return 0;
}

- (NSPredicate)predicateForIncompleteRemindersWithDueDateStarting:(NSDate *)startDate ending:(NSDate *)endDate calendars:(NSArray *)calendars
{
  return (NSPredicate *)[(EKReminderStore *)self->_reminderStore predicateForIncompleteRemindersWithDueDateStarting:startDate ending:endDate calendars:calendars];
}

- (NSPredicate)predicateForCompletedRemindersWithCompletionDateStarting:(NSDate *)startDate ending:(NSDate *)endDate calendars:(NSArray *)calendars
{
  return (NSPredicate *)[(EKReminderStore *)self->_reminderStore predicateForCompletedRemindersWithCompletionDateStarting:startDate ending:endDate calendars:calendars];
}

- (BOOL)ignoreExternalChanges
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)enableSourceSyncStatusChanges
{
  return (self->_options & 0x44) == 64;
}

- (BOOL)shouldSaveCalendarAsEventCalendar:(id)a3
{
  id v3 = a3;
  if (CalIsReminderBridgeEnabled()) {
    BOOL v4 = [v3 allowedEntityTypes] & 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)shouldSaveCalendarAsReminderCalendar:(id)a3
{
  id v3 = a3;
  if (CalIsReminderBridgeEnabled()) {
    unint64_t v4 = ((unint64_t)[v3 allowedEntityTypes] >> 1) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)closestCachedOccurrenceToDate:(double)a3 forEventObjectID:(id)a4
{
  return [(EKEventStore *)self closestCachedOccurrenceToDate:a4 forEventObjectID:0 prefersForwardSearch:a3];
}

- (id)closestCachedOccurrenceToDate:(double)a3 forEventObjectID:(id)a4 prefersForwardSearch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__23;
  __int16 v36 = __Block_byref_object_dispose__23;
  id v37 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__23;
  uint64_t v30 = __Block_byref_object_dispose__23;
  id v31 = 0;
  id v9 = [(EKEventStore *)self database];
  id v10 = objc_msgSend(v8, "CADObjectIDWithGeneration:", objc_msgSend(v9, "databaseRestoreGeneration"));

  id v11 = [(EKEventStore *)self connection];
  id v12 = [v11 CADOperationProxySync];
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  int v20 = __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke;
  uint64_t v21 = &unk_1E5B99F58;
  id v14 = v8;
  id v22 = v14;
  long long v23 = self;
  id v24 = &v32;
  id v25 = &v26;
  [v12 CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID:v10 nearestDate:v13 prefersForwardSearch:v5 reply:&v18];

  if (v33[5] && v27[5])
  {
    uint64_t v15 = [EKEvent alloc];
    long long v16 = -[EKEvent initWithPersistentObject:occurrenceDate:](v15, "initWithPersistentObject:occurrenceDate:", v33[5], v27[5], v18, v19, v20, v21);
  }
  else
  {
    long long v16 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

void __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke_cold_1(a1, v7, a2);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) registerFetchedObjectWithID:*(void *)(a1 + 32)];
    if (v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    }
  }
}

- (int)countOfEventsFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  id v8 = [(EKEventStore *)self connection];
  id v9 = [v8 CADOperationProxySync];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke;
  v11[3] = &unk_1E5B99F80;
  void v11[4] = &v12;
  [v9 CADOccurrenceCacheGetOccurrenceCountWithStartDate:v6 endDate:v7 reply:v11];

  LODWORD(v8) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return (int)v8;
}

void __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)doEvents:(id)a3 haveOccurrencesAfterDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__23;
  uint64_t v18 = __Block_byref_object_dispose__23;
  id v19 = 0;
  id v8 = [v6 valueForKey:@"CADObjectID"];
  id v9 = [(EKEventStore *)self connection];
  id v10 = [v9 CADOperationProxySync];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke;
  v13[3] = &unk_1E5B99C30;
  v13[4] = &v14;
  [v10 CADOccurrenceCacheDoEvents:v8 haveOccurrencesAfterDate:v7 reply:v13];

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (id)calendarWithUniqueID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v6 = [(EKEventStore *)self _allCalendars];
  id v7 = (void *)[v5 initWithArray:v6];

  id v8 = [(EKEventStore *)self sharedCalendarInvitationsForEntityTypes:3];
  [v7 addObjectsFromArray:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "uniqueIdentifier", (void)v17);
        char v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)calendarWithExternalID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EKEventStore *)self returnEventResults])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v6 = [(EKEventStore *)self _allCalendars];
    id v7 = (void *)[v5 initWithArray:v6];

    id v8 = [(EKEventStore *)self sharedCalendarInvitationsForEntityTypes:3];
    [v7 addObjectsFromArray:v8];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "externalID", (void)v17);
          char v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            id v10 = v13;
            goto LABEL_13;
          }
        }
        id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_populateCalendarsByIdentifierIfNeeded
{
  id v7 = a2;
  id v8 = [a3 CADObjectID];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_ERROR, "Cached calendar has no calendarIdentifier: %{public}@", a1, 0xCu);
}

- (id)_eventCalendarWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__23;
    long long v17 = __Block_byref_object_dispose__23;
    id v18 = 0;
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__EKEventStore__eventCalendarWithIdentifier___block_invoke;
    block[3] = &unk_1E5B96EA8;
    block[4] = self;
    uint64_t v12 = &v13;
    id v11 = v4;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);
    if (v14[5])
    {
      id v7 = [EKCalendar alloc];
      id v8 = [(EKObject *)v7 initWithPersistentObject:v14[5]];
    }
    else
    {
      id v8 = 0;
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __45__EKEventStore__eventCalendarWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _populateCalendarsByIdentifierIfNeeded];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (EKCalendar)calendarWithIdentifier:(NSString *)identifier
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = identifier;
  if ([(EKEventStore *)self returnEventResults])
  {
    id v5 = [(EKEventStore *)self _eventCalendarWithIdentifier:v4];
    if (v5) {
      goto LABEL_16;
    }
    [(EKEventStore *)self sharedCalendarInvitationsForEntityTypes:3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "calendarIdentifier", (void)v15);
          char v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            id v5 = v11;

            goto LABEL_16;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  if ([(EKEventStore *)self returnReminderResults])
  {
    id v5 = [(EKReminderStore *)self->_reminderStore calendarWithIdentifier:v4];
  }
  else
  {
    id v5 = 0;
  }
LABEL_16:

  return (EKCalendar *)v5;
}

- (id)calendarsWithIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[EKEventStore calendarWithIdentifier:](self, "calendarWithIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

- (id)calendarsWithObjectIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[EKEventStore publicObjectWithObjectID:](self, "publicObjectWithObjectID:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

- (void)familyCalendarsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__EKEventStore_familyCalendarsWithCompletion___block_invoke;
  v6[3] = &unk_1E5B99FA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[EKFamilyCircleManager requestFamilyShareesWithCompletion:v6];
}

void __46__EKEventStore_familyCalendarsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [*(id *)(a1 + 32) calendarsForEntityType:0];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if (+[EKFamilyCircleManager isFamilyCalendar:v10 givenFamilySharees:v3])
          {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)calendarWithExternalURI:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"EKEventStore.m" lineNumber:5223 description:@"Nil URI passed"];
  }
  id v11 = 0;
  BOOL v6 = [(EKEventStore *)self _parseURI:v5 expectedScheme:@"x-apple-calendar" identifier:&v11 options:0];
  id v7 = v11;
  if (v6)
  {
    uint64_t v8 = [(EKEventStore *)self calendarWithIdentifier:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore calendarWithExternalURI:]();
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)uniqueIdentifiersForEventsWithObjectIDs:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  __int16 v48 = v3;
  if (![v3 count])
  {
    __int16 v44 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_54;
  }
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke;
  block[3] = &unk_1E5B97190;
  id v6 = v48;
  id v78 = v6;
  uint64_t v79 = self;
  id v7 = v4;
  id v80 = v7;
  dispatch_sync(registeredQueue, block);
  uint64_t v8 = (void *)[v6 mutableCopy];
  uint64_t v9 = +[EKPersistentCalendarItem propertyKeyForUniqueIdentifier];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v74 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        uint64_t v16 = [v15 loadedOrUpdatedPropertyValue:v9 wasAvailable:0];
        if (v16)
        {
          [v10 addObject:v16];
          long long v17 = [v15 objectID];
          [v8 removeObject:v17];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v86 count:16];
    }
    while (v12);
  }

  if ([v8 count])
  {
    if (!self->_deletedEventUniqueIdentifiersCache) {
      goto LABEL_23;
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v18 = [v8 allObjects];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:v85 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v70 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v69 + 1) + 8 * j);
          long long v23 = [(NSCache *)self->_deletedEventUniqueIdentifiersCache objectForKey:v22];
          if (v23)
          {
            [v10 addObject:v23];
            [v8 removeObject:v22];
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:v85 count:16];
      }
      while (v19);
    }

    if ([v8 count])
    {
LABEL_23:
      id v52 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      id v24 = [(EKEventStore *)self database];
      uint64_t v25 = [v24 databaseRestoreGeneration];

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v26 = v8;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v84 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v66;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v66 != v28) {
              objc_enumerationMutation(v26);
            }
            uint64_t v30 = *(void **)(*((void *)&v65 + 1) + 8 * k);
            if (([v30 isTemporary] & 1) == 0 && objc_msgSend(v30, "entityType") == 2)
            {
              id v31 = [v30 CADObjectIDWithGeneration:v25];
              [v52 addObject:v31];
            }
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v84 count:16];
        }
        while (v27);
      }

      if (v52)
      {
        uint64_t v59 = 0;
        id v60 = &v59;
        uint64_t v61 = 0x3032000000;
        id v62 = __Block_byref_object_copy__23;
        __int16 v63 = __Block_byref_object_dispose__23;
        id v64 = 0;
        uint64_t v32 = [(EKEventStore *)self database];
        uint64_t v33 = [v32 CADOperationProxySync];
        long long v83 = v9;
        uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2;
        v58[3] = &unk_1E5B99C30;
        v58[4] = &v59;
        [v33 CADObjects:v52 getPropertiesWithNames:v34 reply:v58];

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id obj = (id)v60[5];
        uint64_t v50 = [obj countByEnumeratingWithState:&v54 objects:v82 count:16];
        if (v50)
        {
          uint64_t v49 = *(void *)v55;
          while (2)
          {
            for (uint64_t m = 0; m != v50; ++m)
            {
              if (*(void *)v55 != v49) {
                objc_enumerationMutation(obj);
              }
              __int16 v36 = *(void **)(*((void *)&v54 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                __int16 v44 = 0;
                goto LABEL_48;
              }
              id v37 = v36;
              id v38 = [v37 loadedValues];
              id v39 = [v38 firstObject];

              if (v39)
              {
                long long v51 = [v37 objectID];
                long long v40 = +[EKObjectID objectIDWithCADObjectID:v51];
                long long v81 = v9;
                uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
                __int16 v42 = [v37 loadedValues];
                id v43 = [(EKEventStore *)self registerFetchedObjectWithID:v40 withDefaultLoadedPropertyKeys:v41 values:v42];

                [v10 addObject:v39];
              }
            }
            uint64_t v50 = [obj countByEnumeratingWithState:&v54 objects:v82 count:16];
            if (v50) {
              continue;
            }
            break;
          }
        }

        __int16 v44 = (void *)[v10 copy];
LABEL_48:
        _Block_object_dispose(&v59, 8);
      }
      else
      {
        __int16 v44 = (void *)[v10 copy];
      }

      goto LABEL_53;
    }
    uint64_t v45 = [v10 copy];
  }
  else
  {
    uint64_t v45 = [v10 copy];
  }
  __int16 v44 = (void *)v45;
LABEL_53:

LABEL_54:

  return v44;
}

void __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "entityType", (void)v9) == 2)
        {
          uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 440) objectForKeyedSubscript:v7];
          if (v8) {
            [*(id *)(a1 + 48) addObject:v8];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2_cold_1(a2, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

- (id)uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "frozenObject", (void)v14);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = +[EKPersistentObject allObjectsWithChangesRelatedToObjects:v4];
  uint64_t v12 = [v11 valueForKey:@"uniqueIdentifier"];

  return v12;
}

- (int)syncErrorCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  id v2 = [(EKEventStore *)self connection];
  id v3 = [v2 CADOperationProxySync];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__EKEventStore_syncErrorCount__block_invoke;
  void v5[3] = &unk_1E5B99F80;
  v5[4] = &v6;
  [v3 CADDatabaseGetErrorCount:v5];

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __30__EKEventStore_syncErrorCount__block_invoke(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __30__EKEventStore_syncErrorCount__block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)eventsWithErrorsPerSourceID
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__23;
  uint64_t v12 = __Block_byref_object_dispose__23;
  id v13 = 0;
  id v3 = [(EKEventStore *)self connection];
  uint64_t v4 = [v3 CADOperationProxySync];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke;
  v7[3] = &unk_1E5B99AB0;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 CADDatabaseGetEventsWithErrorsPerSource:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke_cold_1(v7);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", (unint64_t)objc_msgSend(v5, "count") >> 1);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      long long v14 = 0;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
          long long v18 = (void *)v17;
          if (v14)
          {
            uint64_t v19 = [*(id *)(a1 + 32) publicObjectWithFetchedObjectID:v17];
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v19 forKeyedSubscript:v14];

            long long v14 = 0;
          }
          else
          {
            long long v14 = (void *)v17;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (EKImageCache)imageCache
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__23;
  uint64_t v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  registeredQueue = self->_registeredQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__EKEventStore_imageCache__block_invoke;
  void v5[3] = &unk_1E5B96F20;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(registeredQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (EKImageCache *)v3;
}

uint64_t __26__EKEventStore_imageCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _imageCache];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_imageCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_registeredQueue);
  imageCache = self->_imageCache;
  if (!imageCache)
  {
    uint64_t v4 = objc_alloc_init(EKImageCache);
    id v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }

  return imageCache;
}

- (void)_uncacheImage:(id)a3
{
  id v5 = a3;
  if ([v5 entityType] == 28)
  {
    uint64_t v4 = [(EKEventStore *)self _imageCache];
    [v4 uncacheImage:v5];
  }
}

- (void)_clearImageCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_registeredQueue);
  imageCache = self->_imageCache;
  self->_imageCache = 0;
}

- (id)colorWithProviderIdentifier:(id)a3 externalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__23;
  uint64_t v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  uint64_t v8 = [(EKEventStore *)self connection];
  uint64_t v9 = [v8 CADOperationProxySync];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke;
  v12[3] = &unk_1E5B99D88;
  void v12[4] = &v13;
  [v9 CADDatabaseGetColorWithProviderIdentifier:v6 externalID:v7 reply:v12];

  if (v14[5])
  {
    uint64_t v10 = -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:");
  }
  else
  {
    uint64_t v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke_cold_1(v6);
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  if (v5)
  {
LABEL_4:
    uint64_t v7 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
LABEL_5:
}

- (BOOL)saveColor:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v10 = [v8 eventStore];

  if (v10 != self)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  if (![v9 validate:a5] || !objc_msgSend(v9, "save:", a5)) {
    goto LABEL_12;
  }
  [(EKEventStore *)self _addObjectToPendingCommits:v9];
  BOOL v11 = [(EKEventStore *)self save:a5];
  if (v11 && v6) {
    LOBYTE(v11) = [(EKEventStore *)self commitWithRollback:a5];
  }
LABEL_13:

  return v11;
}

- (void)setShowDeclinedEvents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(EKEventStore *)self connection];
  id v5 = [v4 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__EKEventStore_setShowDeclinedEvents___block_invoke;
  v6[3] = &__block_descriptor_33_e8_v12__0i8l;
  BOOL v7 = v3;
  [v5 CADDatabaseSetShowsDeclinedEvents:v3 reply:v6];
}

void __38__EKEventStore_setShowDeclinedEvents___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __38__EKEventStore_setShowDeclinedEvents___block_invoke_cold_1(a1, v3);
    }
  }
}

- (void)showDeclinedEventsChanged:(id)a3
{
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EKEventStore_showDeclinedEventsChanged___block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
}

void __42__EKEventStore_showDeclinedEventsChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 184);
  *(void *)(v1 + 184) = 0;
}

- (void)setShowCompletedReminders:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(EKEventStore *)self connection];
  id v5 = [v4 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__EKEventStore_setShowCompletedReminders___block_invoke;
  v6[3] = &__block_descriptor_33_e8_v12__0i8l;
  BOOL v7 = v3;
  [v5 CADDatabaseSetShowsCompletedReminders:v3 reply:v6];
}

void __42__EKEventStore_setShowCompletedReminders___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __42__EKEventStore_setShowCompletedReminders___block_invoke_cold_1(a1, v3);
    }
  }
}

- (BOOL)showCompletedReminders
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__EKEventStore_showCompletedReminders__block_invoke;
  void v5[3] = &unk_1E5B96E30;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__EKEventStore_showCompletedReminders__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);
  if (!v2)
  {
    uint64_t v3 = [NSNumber numberWithBool:CalShowCompletedReminders()];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 192);
    *(void *)(v4 + 192) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);
  }
  uint64_t result = [v2 BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)showCompletedRemindersChanged:(id)a3
{
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EKEventStore_showCompletedRemindersChanged___block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
}

void __46__EKEventStore_showCompletedRemindersChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 192);
  *(void *)(v1 + 192) = 0;
}

- (void)rebuildOccurrenceCache
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Sending request to rebuild the occurrence cache.", v2, v3, v4, v5, v6);
}

void __38__EKEventStore_rebuildOccurrenceCache__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = (void *)EKLogHandle;
  BOOL v4 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4) {
      __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_2(v3);
    }
  }
  else if (v4)
  {
    __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_1();
  }
}

- (BOOL)birthdayCalendarEnabled
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = [(EKEventStore *)self connection];
  uint64_t v3 = [v2 CADOperationProxySync];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__EKEventStore_birthdayCalendarEnabled__block_invoke;
  void v5[3] = &unk_1E5B99230;
  v5[4] = &v6;
  [v3 CADDatabaseGetBirthdayCalendarEnabledWithReply:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__EKEventStore_birthdayCalendarEnabled__block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    uint64_t v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __39__EKEventStore_birthdayCalendarEnabled__block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (void)setBirthdayCalendarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(EKEventStore *)self connection];
  BOOL v4 = [v5 CADOperationProxySync];
  [v4 CADDatabaseSetBirthdayCalendarEnabled:v3 withReply:&__block_literal_global_424];
}

void __43__EKEventStore_setBirthdayCalendarEnabled___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __43__EKEventStore_setBirthdayCalendarEnabled___block_invoke_cold_1(v2);
    }
  }
}

- (int)birthdayCalendarVersion
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  uint64_t v2 = [(EKEventStore *)self connection];
  BOOL v3 = [v2 CADOperationProxySync];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__EKEventStore_birthdayCalendarVersion__block_invoke;
  void v5[3] = &unk_1E5B99F80;
  v5[4] = &v6;
  [v3 CADDatabaseGetBirthdayCalendarVersionWithReply:v5];

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __39__EKEventStore_birthdayCalendarVersion__block_invoke(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    BOOL v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __39__EKEventStore_birthdayCalendarVersion__block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (void)setBirthdayCalendarVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = [(EKEventStore *)self connection];
  id v5 = [v4 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EKEventStore_setBirthdayCalendarVersion___block_invoke;
  v6[3] = &__block_descriptor_36_e8_v12__0i8l;
  int v7 = v3;
  [v5 CADDatabaseSetBirthdayCalendarVersion:v3 withReply:v6];
}

void __43__EKEventStore_setBirthdayCalendarVersion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __43__EKEventStore_setBirthdayCalendarVersion___block_invoke_cold_1(a1, v3);
    }
  }
}

- (EKCalendar)suggestedEventCalendar
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  BOOL v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__EKEventStore_suggestedEventCalendar__block_invoke;
  v6[3] = &unk_1E5B96E30;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  if (v8[5])
  {
    BOOL v4 = -[EKEventStore calendarWithID:](self, "calendarWithID:");
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (EKCalendar *)v4;
}

void __38__EKEventStore_suggestedEventCalendar__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[4]) {
    goto LABEL_5;
  }
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__23;
  long long v14 = __Block_byref_object_dispose__23;
  id v15 = 0;
  uint64_t v3 = [v2 connection];
  BOOL v4 = [v3 CADOperationProxySync];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__EKEventStore_suggestedEventCalendar__block_invoke_2;
  v9[3] = &unk_1E5B99258;
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = &v10;
  [v4 CADDatabaseGetSuggestedEventCalendarWithReply:v9];

  id v5 = (void *)v11[5];
  if (v5) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v5);
  }
  _Block_object_dispose(&v10, 8);

  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
LABEL_5:
    uint64_t v6 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __38__EKEventStore_suggestedEventCalendar__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __38__EKEventStore_suggestedEventCalendar__block_invoke_2_cold_1(v6);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) database];
    uint64_t v8 = objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v7, "databaseRestoreGeneration"));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)removeSuggestedEventCalendar
{
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__EKEventStore_removeSuggestedEventCalendar__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
}

void __44__EKEventStore_removeSuggestedEventCalendar__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v1 = [v2 CADOperationProxySync];
  [v1 CADDatabaseRemoveSuggestedEventCalendarWithReply:&__block_literal_global_430];
}

void __44__EKEventStore_removeSuggestedEventCalendar__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __44__EKEventStore_removeSuggestedEventCalendar__block_invoke_2_cold_1(v2);
    }
  }
}

- (void)confirmSuggestedEvent:(id)a3
{
  BOOL v4 = [a3 suggestionInfo];
  id v5 = [v4 uniqueKey];

  if (v5)
  {
    uint64_t v6 = [(objc_class *)[(EKEventStore *)self _SGSuggestionsServiceClass] serviceForEvents];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __38__EKEventStore_confirmSuggestedEvent___block_invoke;
    v11[3] = &unk_1E5B9A050;
    id v12 = v6;
    id v7 = v6;
    [v7 eventFromUniqueId:v5 withCompletion:v11];
  }
  else
  {
    uint64_t v8 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      [(EKEventStore *)v8 confirmSuggestedEvent:v10];
    }
  }
}

uint64_t __38__EKEventStore_confirmSuggestedEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 recordId];
  uint64_t v6 = v5;
  if (!a3 && v5)
  {
    uint64_t v8 = v5;
    uint64_t v5 = [*(id *)(a1 + 32) confirmEventByRecordId:v5 withCompletion:&__block_literal_global_433];
    uint64_t v6 = v8;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

void __38__EKEventStore_confirmSuggestedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __38__EKEventStore_confirmSuggestedEvent___block_invoke_2_cold_1();
  }
}

- (void)acceptSuggestedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventStore *)self defaultCalendarForNewEvents];
  [(EKEventStore *)self acceptSuggestedEvent:v4 placeOnCalendar:v5];
}

- (void)acceptSuggestedEvent:(id)a3 placeOnCalendar:(id)a4
{
  id v6 = a3;
  [v6 setCalendar:a4];
  id v10 = 0;
  BOOL v7 = [(EKEventStore *)self saveEvent:v6 span:0 error:&v10];
  id v8 = v10;
  uint64_t v9 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    -[EKEventStore acceptSuggestedEvent:placeOnCalendar:](v7, (uint64_t)v8, v9);
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v7) {
LABEL_3:
  }
    [(EKEventStore *)self confirmSuggestedEvent:v6];
LABEL_4:
}

- (void)deleteSuggestedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 suggestionInfo];
  id v6 = [v5 uniqueKey];
  BOOL v7 = (void *)[v6 copy];

  id v19 = 0;
  BOOL v8 = [(EKEventStore *)self removeEvent:v4 span:2 error:&v19];
  id v9 = v19;
  id v10 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    [(EKEventStore *)v8 deleteSuggestedEvent:v10];
  }
  if (v7) {
    BOOL v11 = v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEventStore deleteSuggestedEvent:]();
    }
    id v12 = [(objc_class *)[(EKEventStore *)self _SGSuggestionsServiceClass] serviceForEvents];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__EKEventStore_deleteSuggestedEvent___block_invoke;
    v17[3] = &unk_1E5B9A050;
    id v18 = v12;
    id v13 = v12;
    [v13 eventFromUniqueId:v7 withCompletion:v17];
  }
  else if (!v7)
  {
    long long v14 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      [(EKEventStore *)v14 deleteSuggestedEvent:v16];
    }
  }
}

uint64_t __37__EKEventStore_deleteSuggestedEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 recordId];
  uint64_t v6 = v5;
  if (!a3 && v5)
  {
    uint64_t v8 = v5;
    uint64_t v5 = [*(id *)(a1 + 32) rejectEventByRecordId:v5 withCompletion:&__block_literal_global_442];
    uint64_t v6 = v8;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

void __37__EKEventStore_deleteSuggestedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __37__EKEventStore_deleteSuggestedEvent___block_invoke_2_cold_1();
  }
}

- (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (BOOL)canModifySuggestedEventCalendar
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  if (canModifySuggestedEventCalendar_onceToken != -1) {
    dispatch_once(&canModifySuggestedEventCalendar_onceToken, block);
  }
  return canModifySuggestedEventCalendar_canModifySuggestedEventCalendar;
}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 360);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_2;
  block[3] = &unk_1E5B96E08;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v1 = [v2 CADOperationProxySync];
  [v1 CADDatabaseCanModifySuggestedEventCalendar:&__block_literal_global_447];
}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_3(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    uint64_t v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_3_cold_1(v3);
    }
  }
  else
  {
    canModifySuggestedEventCalendar_canModifySuggestedEventCalendar = a3;
  }
}

- (EKCalendar)naturalLanguageSuggestedEventCalendar
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__23;
  BOOL v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke;
  v6[3] = &unk_1E5B96E30;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  if (v8[5])
  {
    id v4 = -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:");
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (EKCalendar *)v4;
}

void __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[5];
  if (v3)
  {
    id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else
  {
    uint64_t v5 = [v2 connection];
    uint64_t v6 = [v5 CADOperationProxySync];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2;
    v7[3] = &unk_1E5B99258;
    long long v8 = *(_OWORD *)(a1 + 32);
    [v6 CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply:v7];

    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v4 = (id *)(*(void *)(a1 + 32) + 40);
  }
  objc_storeStrong(v4, v3);
}

void __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2_cold_1(v6);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) database];
    uint64_t v8 = objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v7, "databaseRestoreGeneration"));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)saveNotification:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil notification passed in to [EKEventStore saveNotification:commit:error:]"];
    goto LABEL_13;
  }
  id v10 = [v8 eventStore];

  if (v10 != self)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    LOBYTE(v11) = 0;
    goto LABEL_14;
  }
  if (![v9 validate:a5] || !objc_msgSend(v9, "save:", a5)) {
    goto LABEL_13;
  }
  [(EKEventStore *)self _addObjectToPendingCommits:v9];
  BOOL v11 = [(EKEventStore *)self save:a5];
  if (v11 && v6) {
    LOBYTE(v11) = [(EKEventStore *)self commitWithRollback:a5];
  }
LABEL_14:

  return v11;
}

- (BOOL)saveNotificationCollection:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (a5)
  {
    *a5 = 0;
    if (![(EKEventStore *)self canModifyCalendarDatabase])
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = 30;
LABEL_9:
      [v9 errorWithEKErrorCode:v10];
      LOBYTE(v12) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else if (![(EKEventStore *)self canModifyCalendarDatabase])
  {
    goto LABEL_16;
  }
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Nil notification collection passed in to [EKEventStore saveNotificationCollection:commit:error:]"];
    goto LABEL_16;
  }
  BOOL v11 = [v8 eventStore];

  if (v11 != self)
  {
    if (a5)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = 11;
      goto LABEL_9;
    }
LABEL_16:
    LOBYTE(v12) = 0;
    goto LABEL_17;
  }
  if (![v8 validate:a5] || !objc_msgSend(v8, "save:", a5)) {
    goto LABEL_16;
  }
  [(EKEventStore *)self _addObjectToPendingCommits:v8];
  BOOL v12 = [(EKEventStore *)self save:a5];
  if (v12 && v6) {
    LOBYTE(v12) = [(EKEventStore *)self commitWithRollback:a5];
  }
LABEL_17:

  return v12;
}

- (id)sharedCalendarInvitationsForEntityTypes:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F57700] currentProcessIsCalendarDaemon] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessHasSyncClientEntitlement] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessHasCalendarToolEntitlement] & 1) != 0
    || ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp] & 1) != 0
    || [MEMORY[0x1E4F57700] currentProcessHasTestingEntitlement])
  {
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__23;
    id v26 = __Block_byref_object_dispose__23;
    id v27 = 0;
    id v4 = [(EKEventStore *)self connection];
    id v5 = [v4 CADOperationProxySync];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke;
    v21[3] = &unk_1E5B9A098;
    v21[4] = &v22;
    void v21[5] = a3;
    [v5 CADDatabaseGetSharedCalendarInvitationsWithReply:v21];

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = (id)v23[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(void *)(*((void *)&v17 + 1) + 8 * i), v15);
          BOOL v11 = [(EKEventStore *)self registerFetchedObjectWithID:v10];
          if (v11)
          {
            BOOL v12 = [(EKObject *)[EKCalendar alloc] initWithPersistentObject:v11];
            if (([(EKCalendar *)v12 allowedEntityTypes] & a3) != 0) {
              [v15 addObject:v12];
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v28 count:16];
      }
      while (v7);
    }

    id v13 = (void *)[v15 copy];
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke_cold_1(a1, v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (void)respondToSharedCalendarInvitation:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 objectID];
  uint64_t v8 = [(EKEventStore *)self calendarWithID:v7];

  uint64_t v9 = [v6 source];

  if (v8)
  {
    switch(a4)
    {
      case 0uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
        uint64_t v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unsupported status for responding to shared calendar invitation. Only accept and decline are supported" userInfo:0];
        [v10 raise];

        goto LABEL_4;
      case 1uLL:
LABEL_4:
        uint64_t v11 = 1;
        break;
      case 2uLL:
        uint64_t v11 = 2;
        break;
      default:
        uint64_t v11 = 0;
        break;
    }
    BOOL v12 = [MEMORY[0x1E4F5E950] sharedConnection];
    id v13 = [v8 calendarIdentifier];
    long long v14 = [v9 externalID];
    [v12 respondToSharedCalendarInvite:v11 forCalendarWithID:v13 accountID:v14 queue:MEMORY[0x1E4F14428] completionBlock:&__block_literal_global_460];
  }
  else
  {
    uint64_t v15 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore respondToSharedCalendarInvitation:withStatus:](v15, v16, v17);
    }
  }
}

void __61__EKEventStore_respondToSharedCalendarInvitation_withStatus___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543874;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_ERROR, "Failed to respond to shared calendar invitation with calendar ID %{public}@, account ID %{public}@: %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (id)resourceChangesForEntityTypes:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__23;
  id v27 = __Block_byref_object_dispose__23;
  id v28 = 0;
  id v5 = [(EKEventStore *)self connection];
  id v6 = [v5 CADOperationProxySync];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__EKEventStore_resourceChangesForEntityTypes___block_invoke;
  v22[3] = &unk_1E5B99C30;
  v22[4] = &v23;
  [v6 CADDatabaseGetResourceChanges:v22];

  if (v24[5])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = (id)v24[5];
    uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          int v10 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(void *)(*((void *)&v18 + 1) + 8 * i), v16);
          id v11 = [(EKEventStore *)self registerFetchedObjectWithID:v10];
          if (v11)
          {
            __int16 v12 = [(EKEventStore *)self publicObjectWithPersistentObject:v11];
            id v13 = [v12 calendarItem];
            __int16 v14 = [v12 calendar];
            if (a3 & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()) {
              || (a3 & 2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            }
              || !v13 && ([v14 allowedEntityTypes] & a3) != 0)
            {
              [v16 addObject:v12];
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v29 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v16 = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __46__EKEventStore_resourceChangesForEntityTypes___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __46__EKEventStore_resourceChangesForEntityTypes___block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (BOOL)markResourceChangeAlertedAndSave:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v8 = [v6 eventStore];

  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = [v7 eventStore];

  if (v9 != self)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__23;
  long long v20 = __Block_byref_object_dispose__23;
  id v21 = 0;
  __int16 v12 = [(EKEventStore *)self connection];
  id v13 = [v12 CADOperationProxySync];
  __int16 v14 = [v7 CADObjectID];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke;
  void v15[3] = &unk_1E5B99E68;
  v15[4] = &v16;
  void v15[5] = &v22;
  [v13 CADResourceChange:v14 setAlertedWithError:v15];

  if (a4) {
    *a4 = (id) v17[5];
  }
  if (*((unsigned char *)v23 + 24))
  {
    [v7 clearAlertedStatus];
    BOOL v10 = *((unsigned char *)v23 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
LABEL_9:

  return v10;
}

void __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke_cold_1();
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)removeResourceChange:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
    BOOL v8 = [(EKEventStore *)self removeResourceChanges:v7 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)removeResourceChanges:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (!v6) {
    goto LABEL_17;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "eventStore", (void)v18);
        __int16 v14 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

        if (v14 != self)
        {
          if (a4)
          {
            *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
          }

          goto LABEL_17;
        }
        id v15 = [v13 persistentObject];
        [(EKEventStore *)self _deleteObject:v15];

        [(EKEventStore *)self _addRemovedObjectToPendingCommits:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if ([(EKEventStore *)self save:a4]) {
    BOOL v16 = [(EKEventStore *)self commitWithRollback:a4];
  }
  else {
LABEL_17:
  }
    BOOL v16 = 0;

  return v16;
}

- (BOOL)removeResourceChangesForCalendarItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKEventStore *)self resourceChangesForEntityTypes:3];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __59__EKEventStore_removeResourceChangesForCalendarItem_error___block_invoke;
  v13[3] = &unk_1E5B9A0C0;
  id v14 = v6;
  id v9 = v6;
  uint64_t v10 = [v8 predicateWithBlock:v13];
  uint64_t v11 = [v7 filteredArrayUsingPredicate:v10];

  LOBYTE(a4) = [(EKEventStore *)self removeResourceChanges:v11 error:a4];
  return (char)a4;
}

uint64_t __59__EKEventStore_removeResourceChangesForCalendarItem_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 calendarItem];
  uint64_t v4 = [v3 calendarItemIdentifier];
  id v5 = [*(id *)(a1 + 32) calendarItemIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (NSArray)eventNotifications
{
  return (NSArray *)[(EKEventStore *)self eventNotificationsAfterDate:0];
}

- (id)eventNotificationsAfterDate:(id)a3
{
  return [(EKEventStore *)self eventNotificationsAfterDate:a3 filteredByShowsNotificationsFlag:1 earliestExpiringNotification:0];
}

- (id)eventNotificationsAfterDate:(id)a3 filteredByShowsNotificationsFlag:(BOOL)a4 earliestExpiringNotification:(id *)a5
{
  return [(EKEventStore *)self eventNotificationsAfterDate:a3 excludingUncheckedCalendars:0 filteredByShowsNotificationsFlag:a4 earliestExpiringNotification:a5];
}

- (unint64_t)eventNotificationCount
{
  return [(EKEventStore *)self eventNotificationCountExpanded:0];
}

- (unint64_t)eventNotificationCountExpanded:(BOOL)a3
{
  return [(EKEventStore *)self eventNotificationCountExcludingUncheckedCalendars:0 expanded:a3];
}

- (unint64_t)eventNotificationCountExcludingUncheckedCalendars:(BOOL)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v6 = [(EKEventStore *)self connection];
  uint64_t v7 = [v6 CADOperationProxySync];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke;
  v10[3] = &unk_1E5B99B98;
  void v10[4] = &v11;
  [v7 CADDatabaseGetNotificationCountExcludingUncheckedCalendars:v5 expanded:v4 reply:v10];

  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (unint64_t)eventNotificationCountForSource:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 excludeObjectIDs:(id)a6
{
  return [(EKEventStore *)self eventNotificationCountForSource:a3 excludingDelegateSources:a4 filteredByShowsNotificationsFlag:a5 excludeObjectIDs:a6 expanded:0];
}

- (unint64_t)eventNotificationCountForSource:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 excludeObjectIDs:(id)a6 expanded:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v14 = [(EKEventStore *)self connection];
  id v15 = [v14 CADOperationProxySync];
  BOOL v16 = [v12 externalID];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __132__EKEventStore_eventNotificationCountForSource_excludingDelegateSources_filteredByShowsNotificationsFlag_excludeObjectIDs_expanded___block_invoke;
  v20[3] = &unk_1E5B9A110;
  id v17 = v13;
  id v21 = v17;
  uint64_t v22 = &v23;
  [v15 CADDatabaseGetNotificationCountForSourceWithExternalIdentifier:v16 excludingDelegateSources:v10 filteredByShowsNotificationsFlag:v9 expanded:v7 reply:v20];

  unint64_t v18 = v24[3];
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __132__EKEventStore_eventNotificationCountForSource_excludingDelegateSources_filteredByShowsNotificationsFlag_excludeObjectIDs_expanded___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a2)
  {
    unint64_t v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke_cold_1(v8);
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        if (!a3) {
          break;
        }
        a3 -= objc_msgSend(v7, "containsObject:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
        if (v11 == v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v11) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (BOOL)acknowledgeNotifications:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "acknowledgeWithEventStore:error:", self, a4, (void)v13))
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (NSArray)inboxRepliedSectionItems
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  BOOL v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  id v2 = [(EKEventStore *)self connection];
  uint64_t v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__EKEventStore_inboxRepliedSectionItems__block_invoke;
  v6[3] = &unk_1E5B9A138;
  void v6[4] = &v7;
  [v3 CADDatabaseGetInboxRepliedSectionItems:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __40__EKEventStore_inboxRepliedSectionItems__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    uint64_t v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __40__EKEventStore_inboxRepliedSectionItems__block_invoke_cold_1(v9);
    }
  }
  else
  {
    uint64_t v10 = [v7 count];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        long long v15 = [v7 objectAtIndexedSubscript:i];
        long long v16 = [v8 objectAtIndexedSubscript:i];
        [v16 timeIntervalSinceReferenceDate];
        double v18 = v17;

        uint64_t v19 = +[EKObjectID objectIDWithCADObjectID:v15];
        long long v20 = [[EKEventOccurrenceInfo alloc] initWithObjectID:v19 date:v18];
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v20];
      }
    }
  }
}

- (BOOL)removeInviteReplyNotification:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  LOBYTE(a4) = [(EKEventStore *)self removeInviteReplyNotifications:v6 error:a4];

  return (char)a4;
}

- (BOOL)removeInviteReplyNotifications:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (!v6) {
    goto LABEL_17;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "eventStore", (void)v18);
        long long v14 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

        if (v14 != self)
        {
          if (a4)
          {
            *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
          }

          goto LABEL_17;
        }
        long long v15 = [v13 persistentObject];
        [(EKEventStore *)self _deleteObject:v15];

        [(EKEventStore *)self _addRemovedObjectToPendingCommits:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if ([(EKEventStore *)self save:a4]) {
    BOOL v16 = [(EKEventStore *)self commitWithRollback:a4];
  }
  else {
LABEL_17:
  }
    BOOL v16 = 0;

  return v16;
}

- (id)attachmentWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__23;
  long long v18 = __Block_byref_object_dispose__23;
  id v19 = 0;
  BOOL v5 = [(EKEventStore *)self connection];
  id v6 = [v5 CADOperationProxySync];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__EKEventStore_attachmentWithUUID___block_invoke;
  v10[3] = &unk_1E5B9A160;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = self;
  long long v13 = &v14;
  [v6 CADDatabaseGetAttachmentWithUUID:v7 reply:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __35__EKEventStore_attachmentWithUUID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __35__EKEventStore_attachmentWithUUID___block_invoke_cold_1();
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = +[EKObjectID objectIDWithCADObjectID:v5];
    id v8 = [v6 registerFetchedObjectWithID:v7];

    if (v8)
    {
      uint64_t v9 = [(EKObject *)[EKAttachment alloc] initWithPersistentObject:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

- (BOOL)saveAttachment:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil attachment passed in to [EKEventStore saveAttachment:commit:error:]"];
    goto LABEL_9;
  }
  if (![v8 validateWithOwner:0 error:a5])
  {
LABEL_9:
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }
  uint64_t v10 = [v9 eventStore];

  if (v10 != self)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:11];
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (![v9 save:a5]) {
    goto LABEL_9;
  }
  [(EKEventStore *)self _addObjectToPendingCommits:v9];
  BOOL v11 = [(EKEventStore *)self save:a5];
  if (v11 && v6) {
    LOBYTE(v11) = [(EKEventStore *)self commitWithRollback:a5];
  }
LABEL_10:

  return v11;
}

- (BOOL)_refreshDASource:(id)a3 isUserRequested:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 externalID];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (v7)
  {
    id v8 = [(EKEventStore *)self connection];
    uint64_t v9 = [v8 CADOperationProxySync];
    uint64_t v10 = [v6 CADObjectID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __49__EKEventStore__refreshDASource_isUserRequested___block_invoke;
    v13[3] = &unk_1E5B99230;
    void v13[4] = &v14;
    [v9 CADSourceRefresh:v10 isUserRequested:v4 reply:v13];

    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __49__EKEventStore__refreshDASource_isUserRequested___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    uint64_t v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __49__EKEventStore__refreshDASource_isUserRequested___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

+ (BOOL)_shouldRefreshSource:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && [v3 isEnabled] && objc_msgSend(v4, "sourceType"))
  {
    id v5 = [v4 externalID];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)_refreshFolderListForSource:(id)a3 isUserRequested:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F5E950];
  id v6 = a3;
  id v8 = [v5 sharedConnection];
  id v7 = [v6 externalID];

  [v8 updateFolderListForAccountID:v7 andDataclasses:4 isUserRequested:v4];
}

- (id)refreshSourcesIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(EKEventStore *)self canModifyCalendarDatabase])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(EKEventStore *)self eventSources];
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
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ([(id)objc_opt_class() _shouldRefreshSource:v11]
            && [(EKEventStore *)self _refreshDASource:v11 isUserRequested:v3])
          {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

- (void)refreshSourcesIfNecessary
{
  id v2 = [(EKEventStore *)self refreshSourcesIfNecessary:0];
}

- (id)refreshFolderListsIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(EKEventStore *)self eventSources];
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
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([(id)objc_opt_class() _shouldRefreshSource:v11])
        {
          [(id)objc_opt_class() _refreshFolderListForSource:v11 isUserRequested:v3];
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)refreshEverythingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[EKEventStore refreshFolderListsIfNecessary:](self, "refreshFolderListsIfNecessary:");
  id v6 = [(EKEventStore *)self refreshSourcesIfNecessary:v3];
  uint64_t v7 = [v5 setByAddingObjectsFromSet:v6];

  return v7;
}

- (void)_registerObject:(id)a3
{
  id v4 = a3;
  registeredQueue = self->_registeredQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __32__EKEventStore__registerObject___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(registeredQueue, v7);
}

uint64_t __32__EKEventStore__registerObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerObjectImmediate:*(void *)(a1 + 40)];
}

- (void)_unregisterObject:(id)a3
{
  id v4 = a3;
  registeredQueue = self->_registeredQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __34__EKEventStore__unregisterObject___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(registeredQueue, v7);
}

uint64_t __34__EKEventStore__unregisterObject___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(result + 32) + 440);
  if (v1)
  {
    uint64_t v2 = result;
    BOOL v3 = [*(id *)(result + 40) objectID];
    [v1 removeObjectForKey:v3];

    id v4 = *(void **)(v2 + 32);
    uint64_t v5 = *(void *)(v2 + 40);
    return [v4 _uncacheImage:v5];
  }
  return result;
}

- (void)_detachObject:(id)a3
{
  id v4 = a3;
  registeredQueue = self->_registeredQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __30__EKEventStore__detachObject___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(registeredQueue, v7);
}

uint64_t __30__EKEventStore__detachObject___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(result + 32) + 440);
  if (v1)
  {
    uint64_t v2 = result;
    BOOL v3 = [*(id *)(result + 40) objectID];
    [v1 removeObjectForKey:v3];

    id v4 = *(void **)(v2 + 32);
    uint64_t v5 = *(void *)(v2 + 40);
    return [v4 _uncacheImage:v5];
  }
  return result;
}

- (void)_reregisterObject:(id)a3 oldID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EKEventStore__reregisterObject_oldID___block_invoke;
  block[3] = &unk_1E5B97190;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(registeredQueue, block);
}

void __40__EKEventStore__reregisterObject_oldID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 440) objectForKey:a1[5]];
  if (v2)
  {
    id v6 = v2;
    [*(id *)(a1[4] + 440) removeObjectForKey:a1[5]];
    BOOL v3 = *(void **)(a1[4] + 440);
    id v4 = (void *)a1[6];
    uint64_t v5 = [v4 objectID];
    [v3 setObject:v4 forKey:v5];

    uint64_t v2 = v6;
  }
}

- (void)_forgetRegisteredObjects
{
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EKEventStore__forgetRegisteredObjects__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(registeredQueue, block);
}

void __40__EKEventStore__forgetRegisteredObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A62664B0]();
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 440) allValues];
  [v3 makeObjectsPerformSelector:sel__setEventStore_ withObject:0];

  [*(id *)(*(void *)(a1 + 32) + 440) removeAllObjects];
  [*(id *)(a1 + 32) _clearImageCache];
}

- (BOOL)_isRegisteredObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EKEventStore__isRegisteredObject___block_invoke;
  block[3] = &unk_1E5B96EA8;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(registeredQueue, block);
  LOBYTE(registeredQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)registeredQueue;
}

void __36__EKEventStore__isRegisteredObject___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 440);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 40) objectID];
    BOOL v3 = [v1 objectForKey:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
  }
}

- (id)persistentObjectWithEntityName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)[(id)objc_opt_class() classForEntityName:v4];

  id v6 = objc_alloc_init(v5);
  [v6 _setEventStore:self];

  return v6;
}

- (id)insertedPersistentObjectWithEntityName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)[(id)objc_opt_class() classForEntityName:v4];

  id v6 = objc_alloc_init(v5);
  [(EKEventStore *)self _insertObject:v6];

  return v6;
}

- (id)publicObjectWithObjectID:(id)a3
{
  id v4 = [(EKEventStore *)self objectWithObjectID:a3];
  if (v4)
  {
    uint64_t v5 = [(EKEventStore *)self publicObjectWithPersistentObject:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)publicObjectWithFetchedObjectID:(id)a3
{
  id v4 = [(EKEventStore *)self registerFetchedObjectWithID:a3];
  uint64_t v5 = [(EKEventStore *)self publicObjectWithPersistentObject:v4];

  return v5;
}

- (void)_trackModifiedObject:(id)a3
{
  id v5 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EKEventStore__trackModifiedObject___block_invoke;
  block[3] = &unk_1E5B9A188;
  id v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(unsavedChangesQueue, block);
}

uint64_t __37__EKEventStore__trackModifiedObject___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isPendingInsert] & 1) != 0
    || [*(id *)(a1 + 32) _isPendingDelete])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"EKEventStore.m" lineNumber:6750 description:@"Can't add deleted or inserted object to update set"];
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 320);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 320);
    *(void *)(v4 + 320) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 320);
  }
  [v2 addObject:*(void *)(a1 + 32)];
  id v6 = *(void **)(a1 + 32);

  return [v6 _setPendingUpdate:1];
}

- (void)_objectDidReset:(id)a3
{
  id v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __32__EKEventStore__objectDidReset___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(unsavedChangesQueue, v7);
}

void __32__EKEventStore__objectDidReset___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 320) removeObject:*(void *)(a1 + 40)];
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v3;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        SEL v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = objc_msgSend(*(id *)(a1 + 40), "objectID", (void)v15);
        uint64_t v13 = [v11 objectID];
        char v14 = [v12 isEqual:v13];

        if ((v14 & 1) == 0) {
          [*(id *)(*(void *)(a1 + 32) + 112) addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [*(id *)(*(void *)(a1 + 32) + 304) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 320) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 312) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 328) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) _setPendingDelete:0];
  [*(id *)(a1 + 40) _setPendingUpdate:0];
  [*(id *)(a1 + 40) _setPendingInsert:0];
}

- (void)_insertObject:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Attempt to insert a nil object.";
    goto LABEL_12;
  }
  id v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Attempt to insert something that is not a EKPersistentObject.";
LABEL_12:
    id v15 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];
    objc_exception_throw(v15);
  }
  id v6 = [v5 eventStore];

  if (v6)
  {
    uint64_t v7 = [v5 eventStore];

    if (v7 != self)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = @"Attempt to insert an object that belongs to a different event store.";
      goto LABEL_12;
    }
  }
  else
  {
    [v5 _setEventStore:self];
  }
  SEL v11 = [v5 objectID];

  if (!v11)
  {
    id v12 = +[EKObjectID temporaryObjectIDWithEntityType:](EKObjectID, "temporaryObjectIDWithEntityType:", [v5 entityType]);
    [v5 _setObjectID:v12 inDatabaseRestoreGeneration:0xFFFFFFFFLL];
  }
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __30__EKEventStore__insertObject___block_invoke;
  v16[3] = &unk_1E5B97140;
  void v16[4] = self;
  id v17 = v5;
  id v14 = v5;
  dispatch_sync(unsavedChangesQueue, v16);
}

void __30__EKEventStore__insertObject___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 304))
  {
    uint64_t v2 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 304);
    *(void *)(v3 + 304) = v2;
  }
  if ([*(id *)(a1 + 40) _isPendingDelete])
  {
    [*(id *)(*(void *)(a1 + 32) + 312) removeObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) _setPendingDelete:0];
    id v5 = [*(id *)(a1 + 40) objectID];
    char v6 = [v5 isTemporary];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      [v7 _unregisterObject:v8];
    }
  }
  else if ([*(id *)(a1 + 40) _isPendingUpdate])
  {
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 320);
    if (!v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 320);
      *(void *)(v11 + 320) = v10;

      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 320);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    [v9 addObject:v13];
  }
  else if (([*(id *)(a1 + 40) _isPendingInsert] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 304) addObject:*(void *)(a1 + 40)];
    id v14 = *(void **)(a1 + 40);
    [v14 _setPendingInsert:1];
  }
}

- (void)_markObjectUncommittable:(id)a3
{
  id v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __41__EKEventStore__markObjectUncommittable___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(unsavedChangesQueue, v7);
}

uint64_t __41__EKEventStore__markObjectUncommittable___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 328);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 328);
    *(void *)(v4 + 328) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 328);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (BOOL)isObjectInserted:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EKEventStore_isObjectInserted___block_invoke;
  block[3] = &unk_1E5B97028;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);
  LOBYTE(unsavedChangesQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)unsavedChangesQueue;
}

uint64_t __33__EKEventStore_isObjectInserted___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 304) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_deleteObject:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = @"Attempt to delete a nil object.";
    goto LABEL_9;
  }
  id v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = @"Attempt to delete something that is not a EKPersistentObject.";
LABEL_9:
    id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
  id v6 = [v5 eventStore];

  if (v6 == self && [v5 allowsDeletion])
  {
    [(EKEventStore *)self _cacheDeletedEventIdentifierIfNeededForObject:v5];
    unsavedChangesQueue = self->_unsavedChangesQueue;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __30__EKEventStore__deleteObject___block_invoke;
    long long v16 = &unk_1E5B97140;
    id v17 = self;
    id v8 = v5;
    id v18 = v8;
    dispatch_sync(unsavedChangesQueue, &v13);
    -[EKEventStore _clearPendingChangesForObjectsWithOwner:](self, "_clearPendingChangesForObjectsWithOwner:", v8, v13, v14, v15, v16, v17);
  }
}

void __30__EKEventStore__deleteObject___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 312))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 312);
    *(void *)(v3 + 312) = v2;
  }
  int v5 = [*(id *)(a1 + 40) _isPendingInsert];
  id v6 = *(void **)(a1 + 40);
  if (v5)
  {
    [v6 _setPendingInsert:0];
    [*(id *)(*(void *)(a1 + 32) + 304) removeObject:*(void *)(a1 + 40)];
LABEL_8:
    [*(id *)(*(void *)(a1 + 32) + 328) removeObject:*(void *)(a1 + 40)];
    goto LABEL_11;
  }
  int v7 = [v6 _isPendingUpdate];
  id v8 = *(void **)(a1 + 40);
  if (v7)
  {
    [v8 _setPendingUpdate:0];
    [*(id *)(a1 + 40) _setPendingDelete:1];
    [*(id *)(*(void *)(a1 + 32) + 320) removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    if ([v8 isNew]) {
      goto LABEL_8;
    }
    [*(id *)(a1 + 40) _setPendingDelete:1];
  }
  [*(id *)(*(void *)(a1 + 32) + 312) addObject:*(void *)(a1 + 40)];
LABEL_11:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "copy", 0);
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
        id v15 = [v14 objectID];
        long long v16 = [*(id *)(a1 + 40) objectID];
        int v17 = [v15 isEqual:v16];

        if (v17) {
          [*(id *)(*(void *)(a1 + 32) + 112) removeObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)rollback
{
}

- (void)rollbackObjectsWithIdentifiers:(id)a3
{
  id v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(unsavedChangesQueue, v7);
}

void __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 304) allObjects];
  int v5 = [v2 _filteredObjectsWithIdentifiers:v3 fromObjects:v4 excludingObjects:0];

  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(*(void *)(a1 + 32) + 320) allObjects];
  id v9 = [v6 _filteredObjectsWithIdentifiers:v7 fromObjects:v8 excludingObjects:0];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 312) allObjects];
  uint64_t v13 = [v10 _filteredObjectsWithIdentifiers:v11 fromObjects:v12 excludingObjects:0];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * i) _setPendingInsert:0];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v16);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        [v24 rollback];
        [v24 _setPendingUpdate:0];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v21);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v25 = v13;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        [v30 rollback];
        [v30 _setPendingDelete:0];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v27);
  }

  uint64_t v32 = *(void *)(a1 + 32);
  id v31 = *(void **)(a1 + 40);
  uint64_t v33 = *(void **)(v32 + 112);
  if (v31)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke_2;
    v43[3] = &unk_1E5B9A1B0;
    id v44 = v31;
    [v33 CalFilterUsingBlock:v43];
  }
  else
  {
    [*(id *)(v32 + 112) removeAllObjects];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v34 = v14;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v39 objects:v57 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v34);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 304), "removeObject:", *(void *)(*((void *)&v39 + 1) + 8 * m), (void)v39);
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v39 objects:v57 count:16];
    }
    while (v36);
  }

  [*(id *)(*(void *)(a1 + 32) + 312) minusSet:v25];
  [*(id *)(*(void *)(a1 + 32) + 320) minusSet:v19];
  [*(id *)(*(void *)(a1 + 32) + 328) minusSet:v34];
  [*(id *)(*(void *)(a1 + 32) + 328) minusSet:v19];
  [*(id *)(*(void *)(a1 + 32) + 328) minusSet:v25];
}

uint64_t __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 objectID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)_clearAllCaches
{
  [(NSCache *)self->_deletedEventUniqueIdentifiersCache removeAllObjects];
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EKEventStore__clearAllCaches__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(unsavedChangesQueue, block);
  [(EKEventStore *)self _forgetRegisteredObjects];
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__EKEventStore__clearAllCaches__block_invoke_2;
  void v5[3] = &unk_1E5B96E08;
  v5[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v5);
  [(EKEventStore *)self invalidateReminderSourceMaps];
}

uint64_t __31__EKEventStore__clearAllCaches__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 304);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v7 _setPendingInsert:0];
        [v7 _setEventStore:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v4);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 320);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        [v13 _setPendingUpdate:0];
        [v13 _setEventStore:0];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = *(id *)(*(void *)(a1 + 32) + 312);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v21 + 1) + 8 * k);
        objc_msgSend(v19, "_setPendingDelete:", 0, (void)v21);
        [v19 _setEventStore:0];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v16);
  }

  [*(id *)(*(void *)(a1 + 32) + 304) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 312) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 320) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 328) removeAllObjects];
  return [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
}

void __31__EKEventStore__clearAllCaches__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearCachedCalendars];
  [*(id *)(a1 + 32) _clearCachedSources];
  [*(id *)(a1 + 32) _resetCachedPersonaIdentifiers];
  [*(id *)(*(void *)(a1 + 32) + 200) clearCachedAuthStatus];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = 0;
}

- (void)reset
{
  if ([(EKEventStore *)self returnReminderResults]) {
    [(EKReminderStore *)self->_reminderStore reset];
  }
  [(EKEventStore *)self _clearAllCaches];
  id v3 = [(EKDaemonConnection *)self->_database CADOperationProxySync];
  [v3 CADDatabaseResetWithReply:&__block_literal_global_502];
}

- (BOOL)save:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__23;
  long long v18 = __Block_byref_object_dispose__23;
  id v19 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__EKEventStore_save___block_invoke;
  block[3] = &unk_1E5B96E30;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_sync(unsavedChangesQueue, block);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)v15[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "markAsSaved", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v14, 8);
  return 1;
}

void __21__EKEventStore_save___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 336), "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v9 = objc_msgSend(v8, "persistentObject", (void)v13);
        if (![v9 isNew]
          || [*(id *)(*(void *)(a1 + 32) + 304) containsObject:v9])
        {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v2;
  id v12 = v2;

  [*(id *)(*(void *)(a1 + 32) + 336) removeAllObjects];
}

- (BOOL)commitWithRollbackForNewClients:(id *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E60901FFFFFFFFLL])
  {
    return [(EKEventStore *)self commitWithRollback:a3];
  }
  else
  {
    return [(EKEventStore *)self commit:a3];
  }
}

- (BOOL)commitObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = [v6 valueForKey:@"persistentObject"];
    id v8 = +[EKPersistentObject allObjectsWithChangesRelatedToObjects:v7];
    long long v9 = [v8 setByAddingObjectsFromSet:v7];
    uint64_t v10 = [v9 valueForKey:@"objectID"];
    id v18 = 0;
    BOOL v11 = [(EKEventStore *)self _commitObjectsWithIdentifiers:v10 error:&v18];
    id v12 = v18;
    long long v13 = v12;
    if (a4) {
      *a4 = v12;
    }
    long long v14 = EKLogHandle;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1A4E47000, v14, OS_LOG_TYPE_DEFAULT, "Committed successfully", v17, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        -[EKEventStore commitWithRollback:]();
      }
      [(EKEventStore *)self rollbackObjectsWithIdentifiers:v10];
    }
  }
  else
  {
    long long v15 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_DEFAULT, "Committing no objects. Calling it a success and bailing early.", buf, 2u);
    }
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (BOOL)objectsHaveChangesToCommit:(id)a3
{
  id v3 = [a3 valueForKey:@"persistentObject"];
  uint64_t v4 = +[EKPersistentObject allObjectsWithChangesRelatedToObjects:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

+ (id)_iMIPScheduledEvent:(id)a3
{
  return 0;
}

+ (BOOL)_isConfirmedSuggestedEvent:(id)a3 uniqueKey:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [[EKEvent alloc] initWithPersistentObject:v5];
    uint64_t v7 = [(EKEvent *)v6 suggestionInfo];

    if (v7
      && ([(EKCalendarItem *)v6 calendar],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 isSuggestedEventCalendar],
          v8,
          (v9 & 1) == 0))
    {
      if (a4)
      {
        BOOL v11 = [(EKEvent *)v6 suggestionInfo];
        *a4 = [v11 uniqueKey];
      }
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_clearPendingChangesForObjectsWithOwner:(id)a3
{
  uint64_t v4 = [a3 ownedObjects];
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __56__EKEventStore__clearPendingChangesForObjectsWithOwner___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(unsavedChangesQueue, v7);
}

uint64_t __56__EKEventStore__clearPendingChangesForObjectsWithOwner___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 320) minusSet:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 312) minusSet:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 40);
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
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 304), "removeObject:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 328) minusSet:*(void *)(a1 + 40)];
}

uint64_t __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_508(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 recordId];
  uint64_t v6 = v5;
  if (!a3 && v5)
  {
    uint64_t v8 = v5;
    uint64_t v5 = [*(id *)(a1 + 32) deleteEventByRecordId:v5 withCompletion:&__block_literal_global_510];
    uint64_t v6 = v8;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_cold_1();
  }
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_512(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [(id)objc_opt_class() _iMIPScheduledEvent:v3];

  uint64_t v4 = v9;
  if (v9)
  {
    uint64_t v5 = [v9 diffFromCommitted];
    if (+[EKiMIPInvitation shouldSendEmailForEvent:v9 withDiff:v5])
    {
      uint64_t v6 = [[EKiMIPInvitation alloc] initWithEvent:v9 withDiff:v5];
    }
    else
    {
      if (+[EKiMIPUpdate shouldSendEmailForEvent:v9 withDiff:v5])
      {
        uint64_t v7 = EKiMIPUpdate;
      }
      else
      {
        if (!+[EKiMIPReply shouldSendEmailForEvent:v9 withDiff:v5])
        {
LABEL_10:

          uint64_t v4 = v9;
          goto LABEL_11;
        }
        uint64_t v7 = EKiMIPReply;
      }
      uint64_t v6 = (EKiMIPInvitation *)[[v7 alloc] initWithEvent:v9];
    }
    uint64_t v8 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];

    goto LABEL_10;
  }
LABEL_11:
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_517(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 376);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3;
  block[3] = &unk_1E5B9A278;
  long long v4 = *(_OWORD *)(a1 + 56);
  void block[4] = v2;
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v10 = v4;
  long long v11 = v5;
  long long v12 = *(_OWORD *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 104);
  long long v7 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v7;
  long long v9 = v7;
  long long v14 = *(_OWORD *)(a1 + 112);
  uint64_t v15 = *(void *)(a1 + 128);
  dispatch_sync(v3, block);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24)
    && ([*(id *)(a1 + 32) ignoreExternalChanges] & 1) == 0)
  {
    [*(id *)(a1 + 32) _processExternalChangesWithLatestTimestamp:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) changedObjectIDsData:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) deletedObjectIDOffsets:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) changesWereSyncStatusOnly:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) forceImmediateNotification:1];
  }
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v64 = [MEMORY[0x1E4F1CA80] setWithSet:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [v64 unionSet:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  if ([v64 count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v3 = v64;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v112 objects:v120 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v113 != v5) {
            objc_enumerationMutation(v3);
          }
          long long v7 = *(void **)(*((void *)&v112 + 1) + 8 * i);
          uint64_t v8 = [v7 dirtyPropertiesAndValues];
          if (v8)
          {
            long long v9 = [v7 CADObjectID];
            [v2 setObject:v8 forKeyedSubscript:v9];
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v112 objects:v120 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v2 = 0;
  }
  long long v10 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) valueForKey:@"CADObjectID"];
  long long v11 = [v10 allObjects];

  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x2020000000;
  int v111 = 0;
  uint64_t v106 = 0;
  uint64_t v107 = &v106;
  uint64_t v108 = 0x2020000000;
  char v109 = 0;
  uint64_t v100 = 0;
  long long v101 = &v100;
  uint64_t v102 = 0x3032000000;
  char v103 = __Block_byref_object_copy__23;
  long long v104 = __Block_byref_object_dispose__23;
  id v105 = 0;
  if (([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E70901FFFFFFFFLL] & 1) == 0) {
    [*(id *)(a1 + 32) eventAccessLevel];
  }
  long long v12 = [*(id *)(a1 + 32) database];
  uint64_t v13 = [v12 CADOperationProxySync];
  uint64_t v88 = MEMORY[0x1E4F143A8];
  uint64_t v89 = 3221225472;
  id v90 = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4;
  long long v91 = &unk_1E5B9A228;
  uint64_t v14 = *(void *)(a1 + 72);
  long long v94 = v110;
  uint64_t v95 = v14;
  id v92 = v11;
  id v93 = v2;
  long long v96 = &v106;
  long long v97 = &v100;
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v98 = *(_OWORD *)(a1 + 80);
  long long v99 = v15;
  id v62 = v93;
  id v63 = v92;
  objc_msgSend(v13, "CADDatabaseCommitDeletes:updatesAndInserts:options:andFetchChangesSinceTimestamp:withReply:", v92);

  if (*((unsigned char *)v107 + 24))
  {
    if ([*(id *)(a1 + 32) shouldRecordObjectIDMap])
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v16 = (id)v101[5];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v84 objects:v119 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v85;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v85 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v84 + 1) + 8 * j);
            uint64_t v21 = [(id)v101[5] objectForKeyedSubscript:v20];
            long long v22 = +[EKObjectID objectIDWithCADObjectID:v20];
            long long v23 = +[EKObjectID objectIDWithCADObjectID:v21];
            long long v24 = [*(id *)(*(void *)(a1 + 32) + 136) objectForKeyedSubscript:v22];
            long long v25 = *(void **)(*(void *)(a1 + 32) + 128);
            if (v24) {
              [v25 setObject:v23 forKeyedSubscript:v24];
            }
            else {
              [v25 setObject:v23 forKeyedSubscript:v22];
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v84 objects:v119 count:16];
        }
        while (v17);
      }
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v26 = [obj countByEnumeratingWithState:&v80 objects:v118 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v81;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v81 != v27) {
              objc_enumerationMutation(obj);
            }
            long long v29 = *(void **)(*((void *)&v80 + 1) + 8 * k);
            [*(id *)(*(void *)(a1 + 32) + 304) removeObject:v29];
            long long v30 = (void *)v101[5];
            long long v31 = [v29 CADObjectID];
            long long v32 = [v30 objectForKey:v31];

            if (v32)
            {
              uint64_t v33 = +[EKObjectID objectIDWithCADObjectID:v32];
              id v34 = [*(id *)(a1 + 32) database];
              objc_msgSend(v29, "_setObjectID:inDatabaseRestoreGeneration:", v33, objc_msgSend(v34, "databaseRestoreGeneration"));

              [*(id *)(a1 + 32) _registerObject:v29];
            }
            [v29 _setPendingInsert:0];
            [v29 didCommit];
            uint64_t v35 = *(void *)(a1 + 32);
            uint64_t v36 = *(NSObject **)(v35 + 360);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_519;
            block[3] = &unk_1E5B97140;
            void block[4] = v35;
            void block[5] = v29;
            dispatch_sync(v36, block);
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v80 objects:v118 count:16];
        }
        while (v26);
      }
    }
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v37 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v38 = 0;
    int v39 = 0;
    uint64_t v40 = [v37 countByEnumeratingWithState:&v75 objects:v117 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v76;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v76 != v41) {
            objc_enumerationMutation(v37);
          }
          id v43 = *(void **)(*((void *)&v75 + 1) + 8 * m);
          [v43 _setPendingUpdate:0];
          [v43 didCommit];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v38 = 1;
          }
          else
          {
            objc_opt_class();
            v39 |= objc_opt_isKindOfClass();
          }
        }
        uint64_t v40 = [v37 countByEnumeratingWithState:&v75 objects:v117 count:16];
      }
      while (v40);
    }

    if ((v38 | v39))
    {
      uint64_t v44 = *(void *)(a1 + 32);
      long long v45 = *(NSObject **)(v44 + 360);
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_520;
      v72[3] = &unk_1E5B9A250;
      char v73 = v38 & 1;
      v72[4] = v44;
      char v74 = v39 & 1;
      dispatch_sync(v45, v72);
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v46 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v68 objects:v116 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v69;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v69 != v48) {
            objc_enumerationMutation(v46);
          }
          long long v50 = *(void **)(*((void *)&v68 + 1) + 8 * n);
          [v50 _setPendingDelete:0];
          [*(id *)(a1 + 32) _unregisterObject:v50];
          uint64_t v51 = *(void *)(a1 + 32);
          long long v52 = *(NSObject **)(v51 + 360);
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3_521;
          v67[3] = &unk_1E5B97140;
          v67[4] = v50;
          v67[5] = v51;
          dispatch_sync(v52, v67);
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v68 objects:v116 count:16];
      }
      while (v47);
    }

    [*(id *)(*(void *)(a1 + 32) + 312) minusSet:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    [*(id *)(*(void *)(a1 + 32) + 320) minusSet:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v53 = *(id *)(a1 + 40);
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
    {
      long long v54 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) valueForKey:@"objectID"];
      uint64_t v55 = [v53 setByAddingObjectsFromSet:v54];

      id v53 = (id)v55;
    }
    long long v56 = [*(id *)(a1 + 32) _markObjectsWithIdentifiersAsCommitted:v53 excludingObjects:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
    long long v57 = *(void **)(a1 + 32);
    id v66 = 0;
    [v57 _fetchAndClearEventsNeedingGeocoding:&v66 withCommittedObjects:v56];
    id v58 = v66;
    uint64_t v59 = *(void *)(*(void *)(a1 + 120) + 8);
    id v60 = *(void **)(v59 + 40);
    *(void *)(v59 + 40) = v58;
    id v61 = v58;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 1;
  }

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(v110, 8);
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, char a7)
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a2;
  if (a2)
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v18 = *(void *)(a1[7] + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_2();
    }
    if (a2 == 1010 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_1();
    }
    char v20 = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[10] + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(a1[11] + 8) + 40), a5);
    objc_storeStrong((id *)(*(void *)(a1[12] + 8) + 40), a6);
    *(unsigned char *)(*(void *)(a1[13] + 8) + 24) = a7;
    char v20 = 1;
  }
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v20;
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_519(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[7]
    && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v2 = *(void **)(a1 + 32), (isKindOfClass & 1) != 0))
  {
    id v5 = [*(id *)(a1 + 40) CADObjectID];
    [v2 _cacheCalendarWithCADObjectID:v5 withDefaultLoadedPropertyValues:0 forKeys:0];
  }
  else
  {
    if (!v2[8]) {
      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) CADObjectID];
    [v4 _cacheSourceWithCADObjectID:v5 withDefaultLoadedPropertyValues:0 forKeys:0];
  }
}

uint64_t __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_520(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 40)) {
    uint64_t result = [*(id *)(result + 32) _clearCachedCalendars];
  }
  if (*(unsigned char *)(v1 + 41))
  {
    id v2 = *(void **)(v1 + 32);
    return [v2 _clearCachedSources];
  }
  return result;
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3_521(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) CADObjectID];
    objc_msgSend(v2, "_removeCachedCalendarWithCADID:");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    [*(id *)(a1 + 40) _removeCachedCalendarFromSource:*(void *)(a1 + 32)];
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 64);
    id v5 = [v3 CADObjectID];
    objc_msgSend(v4, "removeObjectForKey:");
  }
}

- (void)ensureLoadedProperties:(id)a3 forObjects:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v19 = self;
    long long v9 = 0;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v20;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([v12 isPropertyUnavailable:*(void *)(*((void *)&v21 + 1) + 8 * j)])
              {
                if (!v9)
                {
                  if (objc_opt_respondsToSelector()) {
                    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
                  }
                  else {
                    uint64_t v18 = objc_opt_new();
                  }
                  long long v9 = (void *)v18;
                }
                [v9 addObject:v12];
                goto LABEL_21;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_21:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
    if (v9)
    {
      [(EKEventStore *)v19 _fetchProperties:v13 forObjects:v9];
    }
  }
}

- (void)_fetchProperties:(id)a3 forObjects:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  if ([v21 count])
  {
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x3032000000;
    long long v30 = __Block_byref_object_copy__23;
    uint64_t v31 = __Block_byref_object_dispose__23;
    id v32 = 0;
    id v19 = self;
    id v6 = [(EKDaemonConnection *)self->_database CADOperationProxySync];
    uint64_t v7 = [v21 valueForKey:@"CADObjectID"];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__EKEventStore__fetchProperties_forObjects___block_invoke;
    v26[3] = &unk_1E5B99C30;
    v26[4] = &v27;
    [v6 CADObjects:v7 getPropertiesWithNames:v20 reply:v26];

    uint64_t v8 = [(id)v28[5] count];
    if (v8 != [v21 count] && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore _fetchProperties:forObjects:]();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)v28[5];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            uint64_t v16 = [v21 objectAtIndexedSubscript:v11 + v13];
            uint64_t v17 = [v16 frozenObjectInStore:v19];
            uint64_t v18 = [v15 loadedValues];
            [v17 takeValuesForDefaultPropertyKeys:v20 values:v18];
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v33 count:16];
        v11 += v13;
      }
      while (v10);
    }

    _Block_object_dispose(&v27, 8);
  }
}

void __44__EKEventStore__fetchProperties_forObjects___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2_cold_1(a2, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

- (BOOL)isPendingIntegrationEvent:(id)a3
{
  pendingIntegrationEvents = self->_pendingIntegrationEvents;
  uint64_t v4 = [a3 uniqueID];
  id v5 = [(NSMutableDictionary *)pendingIntegrationEvents objectForKeyedSubscript:v4];
  LOBYTE(pendingIntegrationEvents) = v5 != 0;

  return (char)pendingIntegrationEvents;
}

- (void)addPendingIntegrationEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueID];
  id v6 = (void *)EKLogHandle;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKEventStore addPendingIntegrationEvent:](v6);
    }
    dbChangedQueue = self->_dbChangedQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__EKEventStore_addPendingIntegrationEvent___block_invoke;
    block[3] = &unk_1E5B97190;
    void block[4] = self;
    id v9 = v5;
    id v10 = v4;
    dispatch_sync(dbChangedQueue, block);
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore addPendingIntegrationEvent:]();
  }
}

void __43__EKEventStore_addPendingIntegrationEvent___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 104);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 104);
  }
  uint64_t v6 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(a1 + 32) + 104) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v6 = (uint64_t)v7;
  }
  id v8 = (id)v6;
  [*(id *)(a1 + 32) _addPendingIntegrationEvent:*(void *)(a1 + 48) toArrayOfHashTables:v6];
}

- (void)_addPendingIntegrationEvent:(id)a3 toArrayOfHashTables:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v20 = [v5 objectID];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8)
  {

LABEL_15:
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    [v7 addObject:v10];
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v14 = [v13 anyObject];
      id v15 = v14;
      if (v5)
      {
        uint64_t v16 = [v14 objectID];
        int v17 = [v16 isEqual:v20];

        if (v17)
        {
          id v19 = v13;

          id v10 = v19;
          goto LABEL_12;
        }
      }
      else
      {
        id v18 = v13;

        id v10 = v18;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v9);
LABEL_12:

  if (!v10) {
    goto LABEL_15;
  }
LABEL_16:
  [v10 addObject:v5];
}

- (void)pendingIntegrationEventChangedIdentifierFrom:(id)a3 to:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_INFO, "Updating pending integration event ID from %{public}@ to %{public}@", buf, 0x16u);
  }
  dbChangedQueue = self->_dbChangedQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__EKEventStore_pendingIntegrationEventChangedIdentifierFrom_to___block_invoke;
  block[3] = &unk_1E5B97190;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(dbChangedQueue, block);
}

void __64__EKEventStore_pendingIntegrationEventChangedIdentifierFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                [*(id *)(a1 + 32) _addPendingIntegrationEvent:*(void *)(*((void *)&v19 + 1) + 8 * j) toArrayOfHashTables:v2];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }

    uint64_t v4 = v18;
  }
  if (v2)
  {
    id v17 = v2;

    uint64_t v4 = v17;
  }
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];
}

- (void)removePendingIntegrationEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = [v4 privacySafeIntegrationEventDescription];
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_INFO, "Removing pending integration event: %{public}@", buf, 0xCu);
  }
  dbChangedQueue = self->_dbChangedQueue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __46__EKEventStore_removePendingIntegrationEvent___block_invoke;
  uint64_t v13 = &unk_1E5B97140;
  id v14 = v4;
  uint64_t v15 = self;
  id v9 = v4;
  dispatch_sync(dbChangedQueue, &v10);
  objc_msgSend(v9, "reset", v10, v11, v12, v13);
}

void __46__EKEventStore_removePendingIntegrationEvent___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) uniqueID];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 104) objectForKeyedSubscript:v2];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "removeObject:", *(void *)(a1 + 32), (void)v14);
        id v12 = [v11 anyObject];

        if (!v12) {
          [v4 addIndex:v8 + i];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v8 += i;
    }
    while (v7);
  }

  uint64_t v13 = [v4 count];
  if (v13 == [v5 count])
  {
    [*(id *)(*(void *)(a1 + 40) + 104) setObject:0 forKeyedSubscript:v2];
  }
  else if ([v4 count])
  {
    [v5 removeObjectsAtIndexes:v4];
  }
}

- (id)reminderIntegrationCalendar
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(EKEventStore *)self sources];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "sourceType", (void)v9) == 6)
        {
          uint64_t v7 = [v6 allCalendars];
          id v3 = [v7 anyObject];

          goto LABEL_11;
        }
      }
      id v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)requestIntegrationCatchupSync
{
  id v2 = [(EKDaemonConnection *)self->_database CADOperationProxy];
  [v2 CADCatchUpIntegrationSyncingIfBehind:&__block_literal_global_526];
}

void __45__EKEventStore_requestIntegrationCatchupSync__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __45__EKEventStore_requestIntegrationCatchupSync__block_invoke_cold_1(v2);
    }
  }
}

- (void)loadEventIDs:(id *)a3 uniqueIDs:(id *)a4 calendar:(id)a5
{
  id v8 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__23;
  long long v22 = __Block_byref_object_dispose__23;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__23;
  long long v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  long long v9 = [(EKDaemonConnection *)self->_database CADOperationProxySync];
  long long v10 = [v8 CADObjectID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __48__EKEventStore_loadEventIDs_uniqueIDs_calendar___block_invoke;
  v11[3] = &unk_1E5B99BC0;
  void v11[4] = &v18;
  void v11[5] = &v12;
  [v9 CADDatabaseLoadEventsInCalendar:v10 reply:v11];

  if (a3)
  {
    *a3 = +[EKObjectID EKObjectIDsFromCADObjectIDs:v19[5]];
  }
  if (a4) {
    *a4 = (id) v13[5];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __48__EKEventStore_loadEventIDs_uniqueIDs_calendar___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    long long v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __45__EKEventStore_requestIntegrationCatchupSync__block_invoke_cold_1(v9);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v8;
}

- (id)redactedMimicSaveEvent:(id)a3 oldToNewObjectIDMap:(id)a4 serializedDictionary:(id)a5 objectIDToChangeSetDictionaryMap:(id)a6 objectIDToPersistentDictionaryMap:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v42 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v39 = v12;
  if (!v12)
  {
    id v39 = +[EKEvent eventWithEventStore:self];
  }
  uint64_t v35 = v15;
  uint64_t v36 = objc_alloc_init(_TtC8EventKit26EKRemoteUIObjectSerializer);
  int v38 = self;
  uint64_t v40 = [(EKRemoteUIObjectSerializer *)v36 deserializedRepresentationWithSerializedDictionary:v13 objectIDToChangeSetDictionaryMap:v14 objectIDToPersistentDictionaryMap:v15 eventStore:self occurrenceDate:0];
  id v37 = [v40 deserializedObject];
  long long v16 = [v40 tempObjectIDMap];
  [(EKEventStore *)self _resetAndApplyChangesForRedactedMimicCommitOnObject:v39 usingModifiedObject:v37];
  uint64_t v41 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v49;
    id v20 = v13;
    id v21 = v14;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        long long v24 = [v17 objectForKeyedSubscript:v23];
        long long v25 = [v42 objectForKeyedSubscript:v23];
        if (v25)
        {
          [v41 setObject:v25 forKeyedSubscript:v24];
        }
        else
        {
          long long v26 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v23;
            _os_log_error_impl(&dword_1A4E47000, v26, OS_LOG_TYPE_ERROR, "redactedMimicSaveEvent: could not find corresponding remoteUI user committed permanent objectID for hostTempID[%{public}@]. initialTempID[%{public}@]", buf, 0x16u);
          }
        }

        id v13 = v20;
        id v14 = v21;
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v18);
  }

  uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
  long long v28 = [v17 allValues];
  uint64_t v29 = [v27 setWithArray:v28];

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v53 = __Block_byref_object_copy__23;
  long long v54 = __Block_byref_object_dispose__23;
  id v55 = 0;
  unsavedChangesQueue = v38->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke;
  block[3] = &unk_1E5B97028;
  uint64_t v47 = buf;
  void block[4] = v38;
  id v31 = v29;
  id v46 = v31;
  dispatch_sync(unsavedChangesQueue, block);
  [(EKEventStore *)v38 _mimicCommitWithOldToNewObjectIDMap:v41 insertedObjectsToCommit:*(void *)(*(void *)&buf[8] + 40) updatedObjectsToCommit:0 deletedObjectsToCommit:0];
  id v32 = v38->_unsavedChangesQueue;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke_2;
  v43[3] = &unk_1E5B97140;
  void v43[4] = v38;
  id v44 = v31;
  id v33 = v31;
  dispatch_sync(v32, v43);

  _Block_object_dispose(buf, 8);

  return v39;
}

void __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke(void *a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = a1[5];
  id v7 = [*(id *)(a1[4] + 304) allObjects];
  uint64_t v4 = [v2 _filteredObjectsWithIdentifiers:v3 fromObjects:v7 excludingObjects:0];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _markObjectsWithIdentifiersAsCommitted:*(void *)(a1 + 40) excludingObjects:0];
}

- (void)_resetAndApplyChangesForRedactedMimicCommitOnObject:(id)a3 usingModifiedObject:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 setChangeSet:0];
  id v7 = [v6 backingObject];
  [v5 setBackingObject:v7];

  [v5 _resetAfterUpdatingChangeSetOrBackingObjectWithForce:1];
  id v8 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        id v14 = [v5 cachedMeltedObjectForSingleValueKey:v13];
        uint64_t v15 = [v6 cachedMeltedObjectForSingleValueKey:v13];
        long long v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17 && ([(id)objc_opt_class() isWeakRelationObject:v14 forKey:v13] & 1) == 0) {
          [(EKEventStore *)self _resetAndApplyChangesForRedactedMimicCommitOnObject:v14 usingModifiedObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v10);
  }
  uint64_t v34 = v8;
  [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v39)
  {
    uint64_t v36 = *(void *)v56;
    id v37 = v6;
    id v38 = v5;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v56 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v18;
        uint64_t v19 = *(void *)(*((void *)&v55 + 1) + 8 * v18);
        id v20 = [v5 cachedMeltedObjectsForMultiValueKey:v19];
        id v44 = [v6 cachedMeltedObjectsForMultiValueKey:v19];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v42 = v20;
        uint64_t v46 = [v42 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v46)
        {
          uint64_t v43 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v52 != v43) {
                objc_enumerationMutation(v42);
              }
              long long v22 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              uint64_t v23 = [v22 objectID];
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v24 = v44;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v63 count:16];
              if (!v25)
              {
                uint64_t v27 = v24;
                goto LABEL_36;
              }
              uint64_t v26 = v25;
              long long v45 = v22;
              uint64_t v27 = 0;
              uint64_t v28 = *(void *)v48;
              do
              {
                for (uint64_t k = 0; k != v26; ++k)
                {
                  if (*(void *)v48 != v28) {
                    objc_enumerationMutation(v24);
                  }
                  long long v30 = *(void **)(*((void *)&v47 + 1) + 8 * k);
                  id v31 = [v30 objectID];
                  int v32 = [v31 isEqual:v23];

                  if (v32)
                  {
                    id v33 = v30;

                    uint64_t v27 = v33;
                  }
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v63 count:16];
              }
              while (v26);

              if (v27)
              {
                [(EKEventStore *)self _resetAndApplyChangesForRedactedMimicCommitOnObject:v45 usingModifiedObject:v27];
LABEL_36:
              }
            }
            uint64_t v46 = [v42 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }
          while (v46);
        }

        uint64_t v18 = v40 + 1;
        id v6 = v37;
        id v5 = v38;
      }
      while (v40 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v39);
  }
}

- (id)mimicSaveAndCommitEvent:(id)a3 oldToNewObjectIDMap:(id)a4 insertedObjectIDs:(id)a5 updatedObjectIDs:(id)a6 deletedObjectIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    id v12 = +[EKEvent eventWithEventStore:self];
  }
  [(EKEventStore *)self _resetForMimicCommitOnObject:v12 oldToNewObjectIDMap:v13];
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  long long v50 = __Block_byref_object_copy__23;
  long long v51 = __Block_byref_object_dispose__23;
  id v52 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__23;
  long long v45 = __Block_byref_object_dispose__23;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__23;
  uint64_t v39 = __Block_byref_object_dispose__23;
  id v40 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke;
  block[3] = &unk_1E5B9A2C8;
  int v32 = &v47;
  void block[4] = self;
  id v18 = v14;
  id v29 = v18;
  id v33 = &v41;
  id v19 = v15;
  id v30 = v19;
  uint64_t v34 = &v35;
  id v20 = v16;
  id v31 = v20;
  dispatch_sync(unsavedChangesQueue, block);
  [(EKEventStore *)self _mimicCommitWithOldToNewObjectIDMap:v13 insertedObjectsToCommit:v48[5] updatedObjectsToCommit:v42[5] deletedObjectsToCommit:v36[5]];
  id v21 = [v18 setByAddingObjectsFromSet:v19];
  long long v22 = [v21 setByAddingObjectsFromSet:v20];

  uint64_t v23 = self->_unsavedChangesQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke_2;
  v26[3] = &unk_1E5B97140;
  v26[4] = self;
  id v27 = v22;
  id v24 = v22;
  dispatch_sync(v23, v26);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);

  return v12;
}

void __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke(void *a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = a1[5];
  uint64_t v4 = [*(id *)(a1[4] + 304) allObjects];
  uint64_t v5 = [v2 _filteredObjectsWithIdentifiers:v3 fromObjects:v4 excludingObjects:0];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = objc_opt_class();
  uint64_t v9 = a1[6];
  uint64_t v10 = [*(id *)(a1[4] + 320) allObjects];
  uint64_t v11 = [v8 _filteredObjectsWithIdentifiers:v9 fromObjects:v10 excludingObjects:0];
  uint64_t v12 = *(void *)(a1[9] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = objc_opt_class();
  uint64_t v15 = a1[7];
  id v19 = [*(id *)(a1[4] + 312) allObjects];
  uint64_t v16 = [v14 _filteredObjectsWithIdentifiers:v15 fromObjects:v19 excludingObjects:0];
  uint64_t v17 = *(void *)(a1[10] + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

id __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _markObjectsWithIdentifiersAsCommitted:*(void *)(a1 + 40) excludingObjects:0];
}

- (void)_mimicCommitWithOldToNewObjectIDMap:(id)a3 insertedObjectsToCommit:(id)a4 updatedObjectsToCommit:(id)a5 deletedObjectsToCommit:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dbChangedQueue = self->_dbChangedQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke;
  block[3] = &unk_1E5B97950;
  void block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_sync(dbChangedQueue, block);
}

void __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 376);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke_2;
  block[3] = &unk_1E5B97950;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  dispatch_sync(v2, block);
}

uint64_t __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v34 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [*(id *)(*(void *)(a1 + 40) + 304) removeObject:v7];
          id v8 = *(void **)(a1 + 48);
          id v9 = [v7 objectID];
          id v10 = [v8 objectForKey:v9];

          if (v10)
          {
            id v11 = [*(id *)(a1 + 40) database];
            objc_msgSend(v7, "_setObjectID:inDatabaseRestoreGeneration:", v10, objc_msgSend(v11, "databaseRestoreGeneration"));

            [*(id *)(a1 + 40) _registerObject:v7];
          }
          [v7 _setPendingInsert:0];
          [v7 didCommit];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v4);
    }
  }
  if ([*(id *)(a1 + 56) count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          [v17 _setPendingUpdate:0];
          [v17 didCommit];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v14);
    }

    [*(id *)(*(void *)(a1 + 40) + 320) minusSet:*(void *)(a1 + 56)];
  }
  uint64_t result = [*(id *)(a1 + 64) count];
  if (result)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = *(id *)(a1 + 64);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v25 + 1) + 8 * k);
          objc_msgSend(v24, "_setPendingDelete:", 0, (void)v25);
          [*(id *)(a1 + 40) _unregisterObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v21);
    }

    return [*(id *)(*(void *)(a1 + 40) + 312) minusSet:*(void *)(a1 + 64)];
  }
  return result;
}

- (void)_resetForMimicCommitOnObject:(id)a3 oldToNewObjectIDMap:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 setChangeSet:0];
  id v8 = [v6 backingObject];
  uint64_t v9 = [v8 objectID];

  long long v30 = (void *)v9;
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];
  long long v29 = (void *)v10;
  if (v10)
  {
    id v11 = [(EKEventStore *)self registerFetchedObjectWithID:v10];
    [v6 setBackingObject:v11];
  }
  else
  {
    id v11 = [v6 backingObject];
    [v11 reset];
  }

  [v6 _resetAfterUpdatingChangeSetOrBackingObjectWithForce:1];
  id v12 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v18 = [v6 cachedMeltedObjectForSingleValueKey:v17];
        if (v18 && ([(id)objc_opt_class() isWeakRelationObject:v18 forKey:v17] & 1) == 0) {
          [(EKEventStore *)self _resetForMimicCommitOnObject:v18 oldToNewObjectIDMap:v7];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v14);
  }
  long long v28 = v12;
  [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(obj);
        }
        id v23 = objc_msgSend(v6, "cachedMeltedObjectsForMultiValueKey:", *(void *)(*((void *)&v36 + 1) + 8 * j), v28, v29);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v33;
          do
          {
            for (uint64_t k = 0; k != v25; ++k)
            {
              if (*(void *)v33 != v26) {
                objc_enumerationMutation(v23);
              }
              [(EKEventStore *)self _resetForMimicCommitOnObject:*(void *)(*((void *)&v32 + 1) + 8 * k) oldToNewObjectIDMap:v7];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
          }
          while (v25);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v20);
  }
}

- (id)insertedObjectIDs
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__EKEventStore_insertedObjectIDs__block_invoke;
  v9[3] = &unk_1E5B97140;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(unsavedChangesQueue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __33__EKEventStore_insertedObjectIDs__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "insertedObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) objectID];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)updatedObjectIDs
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__EKEventStore_updatedObjectIDs__block_invoke;
  v9[3] = &unk_1E5B97140;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(unsavedChangesQueue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __32__EKEventStore_updatedObjectIDs__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "updatedObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) objectID];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)deletedObjectIDs
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__EKEventStore_deletedObjectIDs__block_invoke;
  v9[3] = &unk_1E5B97140;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(unsavedChangesQueue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __32__EKEventStore_deletedObjectIDs__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "deletedObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) objectID];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)lastCommitTempToPermanentObjectIDMap
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__23;
  long long v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__EKEventStore_lastCommitTempToPermanentObjectIDMap__block_invoke;
  void v5[3] = &unk_1E5B96F20;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(unsavedChangesQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__EKEventStore_lastCommitTempToPermanentObjectIDMap__block_invoke(uint64_t a1)
{
}

- (void)waitUntilDatabaseUpdatedToTimestamp:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    *(void *)buf = 0;
    id v18 = buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    dbChangedQueue = self->_dbChangedQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__EKEventStore_waitUntilDatabaseUpdatedToTimestamp_callback___block_invoke;
    block[3] = &unk_1E5B9A2F0;
    id v16 = buf;
    void block[4] = self;
    id v14 = v6;
    long long v9 = v7;
    id v15 = v9;
    dispatch_sync(dbChangedQueue, block);
    if (v18[24])
    {
      long long v10 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_DEFAULT, "Immediately triggering database wait callback because database timestamp is up to date", v12, 2u);
      }
      v9[2](v9);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v11 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "No timestamp given, immediately triggering database wait callback", buf, 2u);
    }
    v7[2](v7);
  }
}

uint64_t __61__EKEventStore_waitUntilDatabaseUpdatedToTimestamp_callback___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [MEMORY[0x1E4F56998] doesTimestamp:*(void *)(a1[4] + 352) includeAllChangesVisibleToTimestamp:a1[5]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[5];
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "database wait callback must wait until eventStore is refreshed. waitUntilTimestamp: %@", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v5 = *(void **)(a1[4] + 144);
    id v6 = (void *)MEMORY[0x1A6266730](a1[6]);
    [v5 addObject:v6];

    return [*(id *)(a1[4] + 152) addObject:a1[5]];
  }
  return result;
}

- (id)lastDatabaseTimestampForOOPToWaitOn
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__23;
  long long v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  dbChangedQueue = self->_dbChangedQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__EKEventStore_lastDatabaseTimestampForOOPToWaitOn__block_invoke;
  void v5[3] = &unk_1E5B96F20;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(dbChangedQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__EKEventStore_lastDatabaseTimestampForOOPToWaitOn__block_invoke(uint64_t a1)
{
}

- (void)recordObjectRebaseWithOldObjectID:(id)a3 newObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__EKEventStore_recordObjectRebaseWithOldObjectID_newObjectID___block_invoke;
  block[3] = &unk_1E5B97190;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(unsavedChangesQueue, block);
}

uint64_t __62__EKEventStore_recordObjectRebaseWithOldObjectID_newObjectID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldRecordObjectIDMap];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 136);
    return [v5 setObject:v3 forKeyedSubscript:v4];
  }
  return result;
}

- (void)startRecordingObjectIDChangeMap
{
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_startRecordingObjectIDChangeMap__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(unsavedChangesQueue, block);
}

uint64_t __47__EKEventStore_startRecordingObjectIDChangeMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 136);
  *(void *)(v6 + 136) = v5;

  return MEMORY[0x1F41817F8](v5, v7);
}

- (void)stopRecordingObjectIDChangeMap
{
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EKEventStore_stopRecordingObjectIDChangeMap__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(unsavedChangesQueue, block);
}

void __46__EKEventStore_stopRecordingObjectIDChangeMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = 0;
}

- (BOOL)shouldRecordObjectIDMap
{
  return self->_lastCommitTempToPermanentObjectIDMap && self->_rebaseTempObjectIDReverseMap != 0;
}

- (id)eventObjectIDsMatchingPredicate:(id)a3
{
  id v4 = a3;
  [(EKEventStore *)self _validateEventPredicate:v4];
  uint64_t v5 = +[EKPredicateSearch searchWithEntityClass:objc_opt_class() predicate:v4 store:self];
  uint64_t v6 = [v5 fetchObjectIDs];
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKEventStore eventsMatchingPredicate:]();
  }

  return v6;
}

- (id)objectsMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[EKPredicateSearch searchWithEntityClass:objc_opt_class() predicate:v4 store:self];

  uint64_t v6 = [v5 runSynchronously];

  return v6;
}

- (void)fetchEventCountsInRange:(id)a3 inCalendars:(id)a4 exclusionOptions:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [v10 startDate];
  id v14 = [v10 endDate];
  id v15 = [(EKEventStore *)self predicateForEventsWithStartDate:v13 endDate:v14 calendars:v12 prefetchHint:0 exclusionOptions:a5];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__EKEventStore_fetchEventCountsInRange_inCalendars_exclusionOptions_completion___block_invoke;
  v19[3] = &unk_1E5B9A318;
  void v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = [(EKEventStore *)self fetchEventsMatchingPredicate:v15 resultHandler:v19];
}

void __80__EKEventStore_fetchEventCountsInRange_inCalendars_exclusionOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [*(id *)(a1 + 32) timeZone];
  [v6 setTimeZone:v7];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend((id)objc_opt_class(), "_addDaysSpannedByEvent:toCountedSet:inRange:withNSCalendar:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), v4, *(void *)(a1 + 40), v6, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)_addDaysSpannedByEvent:(id)a3 toCountedSet:(id)a4 inRange:(id)a5 withNSCalendar:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  long long v13 = [v12 startOfDayForStartDateInCalendar:v10];
  long long v14 = [v12 startOfDayForEndDateInCalendar:v10];

  long long v15 = [v11 startDate];
  long long v16 = [v10 timeZone];
  id v17 = [v15 dateForDayInTimeZone:v16];

  uint64_t v18 = [v11 endDate];

  uint64_t v19 = [v10 timeZone];
  id v20 = [v18 dateForDayInTimeZone:v19];

  id v21 = [v13 laterDate:v17];
  uint64_t v22 = [v14 earlierDate:v20];
  id v23 = objc_opt_new();
  [v23 setHour:0];
  [v23 setMinute:0];
  [v23 setSecond:0];
  [v9 addObject:v21];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __75__EKEventStore__addDaysSpannedByEvent_toCountedSet_inRange_withNSCalendar___block_invoke;
  v26[3] = &unk_1E5B9A340;
  id v27 = v22;
  id v28 = v9;
  id v24 = v9;
  id v25 = v22;
  [v10 enumerateDatesStartingAfterDate:v21 matchingComponents:v23 options:1024 usingBlock:v26];
}

uint64_t __75__EKEventStore__addDaysSpannedByEvent_toCountedSet_inRange_withNSCalendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  if (v6 && (v9 = v6, id v6 = (id)[v6 CalIsAfterDate:*(void *)(a1 + 32)], v7 = v9, !v6))
  {
    id v6 = (id)[*(id *)(a1 + 40) addObject:v9];
    id v7 = v9;
  }
  else
  {
    *a4 = 1;
  }

  return MEMORY[0x1F41817F8](v6, v7);
}

- (void)cancelFetchRequest:(id)fetchIdentifier
{
  id v3 = fetchIdentifier;
  if ([v3 conformsToProtocol:&unk_1EF95F8D8])
  {
    [v3 cancel];
  }
  else
  {
    id v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
      -[EKEventStore cancelFetchRequest:](v4);
    }
  }
}

- (id)nextEventWithCalendarIdentifiers:(id)a3 exclusionOptions:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = -[EKEventStore calendarWithIdentifier:](self, "calendarWithIdentifier:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v14 = [(EKEventStore *)self nextEventWithCalendars:v7 exclusionOptions:a4];

  return v14;
}

- (id)nextEventWithCalendars:(id)a3 exclusionOptions:(int64_t)a4
{
  id v4 = [(EKEventStore *)self nextEventsWithCalendars:a3 limit:1 exclusionOptions:a4];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)nextEventsWithCalendars:(id)a3 limit:(unint64_t)a4 exclusionOptions:(int64_t)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __63__EKEventStore_nextEventsWithCalendars_limit_exclusionOptions___block_invoke;
  v12[3] = &unk_1E5B9A368;
  void v12[4] = self;
  id v13 = v8;
  int64_t v14 = a5;
  id v9 = v8;
  uint64_t v10 = [(EKEventStore *)self _nextEventsWithFetchBlock:v12 steps:&unk_1EF9531E0 limit:a4];

  return v10;
}

id __63__EKEventStore_nextEventsWithCalendars_limit_exclusionOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 startDate];
  id v6 = [v4 endDate];

  id v7 = [v3 predicateForEventsWithStartDate:v5 endDate:v6 calendars:*(void *)(a1 + 40) prefetchHint:0 exclusionOptions:*(void *)(a1 + 48)];

  id v8 = [*(id *)(a1 + 32) eventsMatchingPredicate:v7];

  return v8;
}

- (id)_nextEventsWithFetchBlock:(id)a3 steps:(id)a4 limit:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = (void (**)(id, void *))a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  id v25 = v9;
  if ([v7 count])
  {
    unint64_t v10 = 0;
    id v27 = v7;
    uint64_t v11 = v9;
    while (1)
    {
      id v12 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v25);
      uint64_t v13 = [v12 integerValue];

      int64_t v14 = [MEMORY[0x1E4F576D0] rangeWithStartDate:v11 duration:(double)(unint64_t)(86400 * v13)];
      long long v15 = v28[2](v28, v14);
      long long v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_556];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
LABEL_5:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * v21);
          if ([v8 count] >= a5) {
            break;
          }
          [v8 addObject:v22];
          if (v19 == ++v21)
          {
            uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v19) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      if ([v8 count] == a5) {
        break;
      }
      id v9 = [v14 endDate];

      ++v10;
      id v7 = v27;
      uint64_t v11 = v9;
      if ([v27 count] <= v10) {
        goto LABEL_15;
      }
    }

    id v9 = v11;
    id v7 = v27;
  }
LABEL_15:
  id v23 = objc_msgSend(v8, "copy", v25);

  return v23;
}

uint64_t __54__EKEventStore__nextEventsWithFetchBlock_steps_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)alarmWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    int64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__23;
    id v17 = __Block_byref_object_dispose__23;
    id v18 = 0;
    uint64_t v5 = [(EKEventStore *)self connection];
    id v6 = [v5 CADOperationProxySync];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__EKEventStore_alarmWithUUID___block_invoke;
    v9[3] = &unk_1E5B9A160;
    id v10 = v4;
    uint64_t v11 = self;
    id v12 = &v13;
    [v6 CADDatabaseGetAlarmWithUUID:v10 reply:v9];

    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __30__EKEventStore_alarmWithUUID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __30__EKEventStore_alarmWithUUID___block_invoke_cold_1();
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = +[EKObjectID objectIDWithCADObjectID:v5];
    id v8 = [v6 registerFetchedObjectWithID:v7];

    if (v8)
    {
      id v9 = [(EKObject *)[EKAlarm alloc] initWithPersistentObject:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

- (id)alarmWithExternalID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    int64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__23;
    id v17 = __Block_byref_object_dispose__23;
    id v18 = 0;
    id v5 = [(EKEventStore *)self connection];
    id v6 = [v5 CADOperationProxySync];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__EKEventStore_alarmWithExternalID___block_invoke;
    v9[3] = &unk_1E5B9A160;
    id v10 = v4;
    uint64_t v11 = self;
    id v12 = &v13;
    [v6 CADDatabaseGetAlarmWithExternalID:v10 reply:v9];

    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __36__EKEventStore_alarmWithExternalID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __36__EKEventStore_alarmWithExternalID___block_invoke_cold_1();
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = +[EKObjectID objectIDWithCADObjectID:v5];
    id v8 = [v6 registerFetchedObjectWithID:v7];

    if (v8)
    {
      id v9 = [(EKObject *)[EKAlarm alloc] initWithPersistentObject:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

- (id)alarmOccurrencesFromAlarmCache
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  uint64_t v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  uint64_t v2 = [(EKEventStore *)self connection];
  id v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke;
  v6[3] = &unk_1E5B99C30;
  void v6[4] = &v7;
  [v3 CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke_cold_1(v7);
    }
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          id v15 = objc_alloc(MEMORY[0x1E4F56A38]);
          long long v16 = objc_msgSend(v15, "initWithDictionaryRepresentation:", v14, (void)v20);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v17 = [v8 copy];
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

+ (unint64_t)predicatePropertyLoadMode
{
  return _predicatePropertyLoadMode;
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 uniqueID:(id)a5 calendars:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    long long v22 = _NSMethodExceptionProem();
    [v20 raise:v21, @"%@: startDate is nil", v22 format];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v23 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v24 = *MEMORY[0x1E4F1C3C8];
  uint64_t v25 = _NSMethodExceptionProem();
  [v23 raise:v24, @"%@: endDate is nil", v25 format];

LABEL_3:
  id v26 = v11;
  restrictDateRange(v10, &v26);
  id v14 = v26;

  id v15 = +[EKEventStore calendarObjectIDsForPredicate:v13];
  long long v16 = (void *)MEMORY[0x1E4F56970];
  uint64_t v17 = [(EKEventStore *)self timeZone];
  uint64_t v18 = [v16 predicateWithStartDate:v10 endDate:v14 timeZone:v17 eventUUID:v12 calendars:v15];

  return v18;
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 prefetchHint:(int64_t)a6 exclusionOptions:(int64_t)a7
{
  return [(EKEventStore *)self predicateForEventsWithStartDate:a3 endDate:a4 calendars:a5 exclusionOptions:a7 filterdOutTitles:0 randomize:0 limit:0];
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 exclusionOptions:(int64_t)a6 filterdOutTitles:(id)a7 randomize:(BOOL)a8 limit:(int64_t)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  uint64_t v19 = v18;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v35 = v18;
    id v26 = v17;
    BOOL v27 = v9;
    id v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    long long v30 = _NSMethodExceptionProem();
    long long v31 = v28;
    BOOL v9 = v27;
    id v17 = v26;
    uint64_t v19 = v35;
    [v31 raise:v29, @"%@: startDate is nil", v30 format];

    if (v16) {
      goto LABEL_3;
    }
  }
  long long v32 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v33 = *MEMORY[0x1E4F1C3C8];
  uint64_t v34 = _NSMethodExceptionProem();
  [v32 raise:v33, @"%@: endDate is nil", v34 format];

LABEL_3:
  id v36 = v16;
  restrictDateRange(v15, &v36);
  id v20 = v36;

  uint64_t v21 = +[EKEventStore calendarObjectIDsForPredicate:v17];
  long long v22 = (void *)MEMORY[0x1E4F56970];
  long long v23 = [(EKEventStore *)self timeZone];
  uint64_t v24 = [v22 predicateWithStartDate:v15 endDate:v20 timeZone:v23 calendars:v21 propertyLoadMode:_predicatePropertyLoadMode];

  [v24 setExcludeTimedEvents:((unint64_t)a6 >> 1) & 1];
  [v24 setExcludeAllDayEvents:a6 & 1];
  [v24 setExcludeDeclined:((unint64_t)a6 >> 2) & 1];
  [v24 setExcludeProposed:((unint64_t)a6 >> 3) & 1];
  [v24 setExcludeDeclinedUnlessProposed:((unint64_t)a6 >> 4) & 1];
  [v24 setExcludeNoAttendeeEvents:((unint64_t)a6 >> 5) & 1];
  [v24 setExcludeNoLocationEvents:((unint64_t)a6 >> 6) & 1];
  [v24 setRandomize:v9];
  [v24 setLimit:a9];
  [v24 setFilteredOutTitles:v19];

  return v24;
}

- (id)predicateForAssistantEventSearchWithTimeZone:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 notes:(id)a8 participants:(id)a9 calendars:(id)a10 limit:(int64_t)a11
{
  id v17 = (objc_class *)MEMORY[0x1E4F56980];
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = (void *)[[v17 alloc] initWithTimeZone:v25 startDate:v24 endDate:v23 title:v22 location:v21 notes:v20 participants:v19 limit:a11];

  BOOL v27 = +[EKEventStore calendarObjectIDsForPredicate:v18];

  [v26 setCalendars:v27];

  return v26;
}

- (id)predicateForNotifiableEvents
{
  return (id)[MEMORY[0x1E4F569B8] predicate];
}

- (id)predicateForNotificationCenterVisibleEvents
{
  return (id)[MEMORY[0x1E4F569C0] predicate];
}

- (id)predicateForUnacknowledgedEvents
{
  return (id)[MEMORY[0x1E4F56A08] predicate];
}

- (id)predicateForUnalertedEvents
{
  return (id)[MEMORY[0x1E4F56A10] predicate];
}

- (id)predicateForUpcomingEventsWithLimit:(int)a3
{
  return (id)[MEMORY[0x1E4F56A20] predicateWithLimit:*(void *)&a3];
}

- (id)predicateForMasterEventsInCalendars:(id)a3
{
  id v3 = +[EKEventStore calendarObjectIDsForPredicate:a3];
  id v4 = [MEMORY[0x1E4F56A40] predicateWithCalendarIDs:v3];

  return v4;
}

- (id)predicateForScheduleAgentClientEventsInCalendar:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 CADObjectID];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  id v5 = [MEMORY[0x1E4F56A48] predicateWithCalendarIDs:v4];

  return v5;
}

- (BOOL)hasImmediatelyEligibleTravelEvents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v5 = [(EKEventStore *)self calendarsForEntityType:0];
  [(EKEventStore *)self travelEligibleEventsInCalendars:v5 startDate:v3 endDate:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "preferredLocation", (void)v13);
        char v11 = [v10 hasKnownSpatialData];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)travelEligibleEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = [(EKEventStore *)self predicateForPotentialTravelEventsInCalendars:a3 startDate:a4 endDate:a5];
  uint64_t v7 = [(EKEventStore *)self eventsMatchingPredicate:v6];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "potentiallyEligibleForTravelAdvisories", (void)v16) & 1) == 0) {
          [v8 removeObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)predicateForPotentialTravelEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore predicateForPotentialTravelEventsInCalendars:startDate:endDate:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKEventStore predicateForPotentialTravelEventsInCalendars:startDate:endDate:]();
  }
LABEL_6:
  id v14 = v9;
  restrictDateRange(v8, &v14);
  id v10 = v14;

  uint64_t v11 = +[EKEventStore calendarObjectIDsForPredicate:v7];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F56A00]) initWithCalendarIDs:v11 startDate:v8 endDate:v10];

  return v12;
}

- (id)predicateForUpNextEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5 startDateRestrictionThreshold:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:]();
    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKEventStore predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:]();
  }
LABEL_6:
  id v16 = v11;
  restrictDateRange(v10, &v16);
  id v12 = v16;

  long long v13 = +[EKEventStore calendarObjectIDsForPredicate:v9];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F56A18]) initWithCalendarIDs:v13 startDate:v10 endDate:v12];

  [v14 setStartDateRestrictionThreshold:a6];

  return v14;
}

- (id)predicateForNaturalLanguageSuggestedEventsWithSearchString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F569A8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(EKEventStore *)self timeZone];
  id v8 = (void *)[v6 initWithSearchString:v5 timeZone:v7];

  return v8;
}

- (id)predicateForNaturalLanguageSuggestedEventsWithSearchString:(id)a3 startDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    id v7 = (id)objc_opt_new();
  }
  id v8 = objc_alloc(MEMORY[0x1E4F569A8]);
  id v9 = [(EKEventStore *)self timeZone];
  id v10 = (void *)[v8 initWithSearchString:v6 startDate:v7 timeZone:v9];

  return v10;
}

- (id)predicateForEventCreatedFromSuggestionWithOpaqueKey:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F56968];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithOpaqueKey:v4];

  return v5;
}

- (id)predicateForEventsCreatedFromSuggestionWithExtractionGroupIdentifier:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F56968];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithExtractionGroupIdentifier:v4];

  return v5;
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 matchingContacts:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[EKEventStore calendarObjectIDsForPredicate:v12];
  if ([v13 count])
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F56950]) initWithCalendarIDs:v14 startDate:v10 endDate:v11 contacts:v13];
  }
  else
  {
    uint64_t v15 = [(EKEventStore *)self predicateForEventsWithStartDate:v10 endDate:v11 calendars:v12];
  }
  id v16 = (void *)v15;

  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 inCalendar:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F569D8];
  id v6 = a4;
  id v7 = [v5 alloc];
  if (a3 == 2) {
    unsigned int v8 = 3;
  }
  else {
    unsigned int v8 = 101;
  }
  if (a3 == 1) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = [v6 CADObjectID];

  id v11 = (void *)[v7 initWithEntityType:v9 filters:0 calendar:v10];

  return v11;
}

- (id)predicateForMasterEventsWithExternalTrackingStatusInCalendar:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F569D0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithProperty:0 comparison:1 integerValue:0];
  id v6 = objc_alloc(MEMORY[0x1E4F569D8]);
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  unsigned int v8 = [v4 CADObjectID];

  uint64_t v9 = (void *)[v6 initWithEntityType:2 filters:v7 calendar:v8];

  return v9;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withUniqueIdentifier:(id)a4 inCalendar:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F569D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[[v7 alloc] initWithProperty:1 comparison:0 stringValue:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F569D8]);
  if (a3 == 2) {
    unsigned int v12 = 3;
  }
  else {
    unsigned int v12 = 101;
  }
  if (a3 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12;
  }
  v18[0] = v10;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v15 = [v8 CADObjectID];

  id v16 = (void *)[v11 initWithEntityType:v13 filters:v14 calendar:v15];

  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withUniqueIdentifier:(id)a4 inSource:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F569D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[[v7 alloc] initWithProperty:1 comparison:0 stringValue:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F569D8]);
  if (a3 == 2) {
    unsigned int v12 = 3;
  }
  else {
    unsigned int v12 = 101;
  }
  if (a3 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12;
  }
  v18[0] = v10;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v15 = [v8 CADObjectID];

  id v16 = (void *)[v11 initWithEntityType:v13 filters:v14 source:v15];

  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withExternalID:(id)a4 inCalendar:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F569D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[[v7 alloc] initWithProperty:3 comparison:0 stringValue:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F569D8]);
  if (a3 == 2) {
    unsigned int v12 = 3;
  }
  else {
    unsigned int v12 = 101;
  }
  if (a3 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12;
  }
  v18[0] = v10;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v15 = [v8 CADObjectID];

  id v16 = (void *)[v11 initWithEntityType:v13 filters:v14 calendar:v15];

  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withExternalID:(id)a4 inSource:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F569D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[[v7 alloc] initWithProperty:3 comparison:0 stringValue:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F569D8]);
  if (a3 == 2) {
    unsigned int v12 = 3;
  }
  else {
    unsigned int v12 = 101;
  }
  if (a3 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12;
  }
  v18[0] = v10;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v15 = [v8 CADObjectID];

  id v16 = (void *)[v11 initWithEntityType:v13 filters:v14 source:v15];

  return v16;
}

- (id)predicateForEventsWithAttendeesInCalendar:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F569D0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithProperty:12 comparison:0 integerValue:1];
  id v6 = objc_alloc(MEMORY[0x1E4F569D8]);
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v8 = [v4 CADObjectID];

  id v9 = (void *)[v6 initWithEntityType:2 filters:v7 calendar:v8];

  return v9;
}

- (id)predicateForMasterEventsWithStartDate:(id)a3 title:(id)a4 inCalendar:(id)a5
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F569D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v7 alloc] initWithProperty:4 comparison:0 stringValue:v9];

  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:5 comparison:0 dateValue:v10];
  id v13 = objc_alloc(MEMORY[0x1E4F569D8]);
  v18[0] = v11;
  v18[1] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v15 = [v8 CADObjectID];

  id v16 = (void *)[v13 initWithEntityType:2 filters:v14 calendar:v15];

  return v16;
}

- (id)predicateForMasterEventsInCalendar:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F569D8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 CADObjectID];

  id v7 = (void *)[v5 initWithEntityType:2 filters:MEMORY[0x1E4F1CBF0] calendar:v6];

  return v7;
}

- (id)predicateForRandomMasterEventsWithStartDate:(id)a3 endDate:(id)a4 needToHaveAttendee:(BOOL)a5 needToHaveLocation:(BOOL)a6 allDay:(BOOL)a7 filteredOutTitles:(id)a8 limit:(int64_t)a9 calendars:(id)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  v56[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v43 = a10;
  long long v18 = objc_opt_new();
  if (v13)
  {
    long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:12 comparison:0 integerValue:1];
    [v18 addObject:v19];
  }
  if (v12)
  {
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:13 comparison:1 integerValue:0];
    [v18 addObject:v20];
  }
  id v44 = v16;
  long long v45 = v15;
  if (v15 && v16)
  {
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:5 comparison:2 dateValue:v16];
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:6 comparison:4 dateValue:v15];
    id v23 = objc_alloc(MEMORY[0x1E4F56948]);
    v56[0] = v21;
    v56[1] = v22;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    id v25 = (void *)[v23 initWithFilters:v24 operation:0];

    [v18 addObject:v25];
  }
  long long v42 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:14 comparison:0 integerValue:v11];
  objc_msgSend(v18, "addObject:");
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v26 = v17;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:4 comparison:1 stringValue:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        [v18 addObject:v31];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v28);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v32 = v43;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    id v35 = 0;
    uint64_t v36 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(v32);
        }
        long long v38 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        if (!v35) {
          id v35 = objc_opt_new();
        }
        long long v39 = [v38 CADObjectID];
        [v35 addObject:v39];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v34);
  }
  else
  {
    id v35 = 0;
  }

  long long v40 = (void *)[objc_alloc(MEMORY[0x1E4F569D8]) initWithEntityType:2 filters:v18 calendars:v35 limit:a9 randomize:1];

  return v40;
}

- (id)predicateForEventsInSubscribedCalendar:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F569F8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 CADObjectID];

  id v7 = (void *)[v5 initWithCalendar:v6];

  return v7;
}

- (id)predicateForMasterEventsWithOccurrencesWithStartDate:(id)a3 endDate:(id)a4 inCalendar:(id)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F569D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v27 = (void *)[[v7 alloc] initWithProperty:10 comparison:0 integerValue:1];
  BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:5 comparison:2 dateValue:v9];
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:6 comparison:4 dateValue:v10];
  id v12 = objc_alloc(MEMORY[0x1E4F56948]);
  v32[0] = v11;
  v32[1] = v28;
  BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v14 = (void *)[v12 initWithFilters:v13 operation:0];

  id v15 = objc_alloc(MEMORY[0x1E4F56948]);
  v31[0] = v11;
  v31[1] = v27;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  id v17 = (void *)[v15 initWithFilters:v16 operation:0];

  id v18 = objc_alloc(MEMORY[0x1E4F56948]);
  v30[0] = v14;
  v30[1] = v17;
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v20 = (void *)[v18 initWithFilters:v19 operation:1];

  id v21 = objc_alloc(MEMORY[0x1E4F569D8]);
  uint64_t v29 = v20;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  id v23 = [v8 CADObjectID];

  id v24 = (void *)[v21 initWithEntityType:2 filters:v22 calendar:v23];
  id v25 = (void *)[objc_alloc(MEMORY[0x1E4F56978]) initWithPredicate:v24 limitWithStartDate:v10 endDate:v9 mustStartInInterval:0];

  return v25;
}

- (id)predicateForMasterEventsWithInvitationsAndOccurrencesAfter:(id)a3 inCalendar:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F569D0];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithProperty:10 comparison:0 integerValue:1];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:9 comparison:1 integerValue:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F569D0]) initWithProperty:5 comparison:5 dateValue:v7];
  id v11 = objc_alloc(MEMORY[0x1E4F56948]);
  v23[0] = v8;
  v23[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  BOOL v13 = (void *)[v11 initWithFilters:v12 operation:1];

  id v14 = objc_alloc(MEMORY[0x1E4F569D8]);
  v22[0] = v9;
  v22[1] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v16 = [v6 CADObjectID];

  id v17 = (void *)[v14 initWithEntityType:2 filters:v15 calendar:v16];
  id v18 = objc_alloc(MEMORY[0x1E4F56978]);
  long long v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v20 = (void *)[v18 initWithPredicate:v17 limitWithStartDate:v7 endDate:v19 mustStartInInterval:0];

  return v20;
}

- (id)predicateForNonrecurringEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[EKEventStore calendarObjectIDsForPredicate:a5];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F569B0]) initWithStartDate:v8 endDate:v7 calendarIDs:v9];

  return v10;
}

- (unint64_t)timeToLeaveLocationAuthorizationStatus
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = [(EKEventStore *)self connection];
  id v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke;
  v6[3] = &unk_1E5B99B98;
  void v6[4] = &v7;
  [v3 CADDatabaseGetTTLLocationAuthorizationStatus:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)predicateForEventsWithConferenceURL:(id)a3 limit:(int64_t)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F56988];
  id v6 = a3;
  uint64_t v7 = (void *)[[v5 alloc] initWithURL:v6 limit:a4];

  [v7 setCalendars:MEMORY[0x1E4F1CBF0]];

  return v7;
}

- (int64_t)registerForDetailedChangeTracking:(id *)a3
{
  return [(EKEventStore *)self registerForDetailedChangeTrackingInSource:0 error:a3];
}

- (int64_t)registerForDetailedChangeTrackingInSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = -1;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__23;
  id v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  uint64_t v7 = [(EKEventStore *)self connection];
  id v8 = [v7 CADOperationProxySync];
  uint64_t v9 = [v6 CADObjectID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke;
  v12[3] = &unk_1E5B99E68;
  void v12[4] = &v13;
  void v12[5] = &v19;
  [v8 CADDatabaseRegisterForDetailedChangeTrackingInSource:v9 reply:v12];

  if (a4) {
    *a4 = (id) v14[5];
  }
  int64_t v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke_cold_1();
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)unregisterForDetailedChangeTracking:(id *)a3
{
  uint64_t v9 = 0;
  int64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__23;
  uint64_t v13 = __Block_byref_object_dispose__23;
  id v14 = 0;
  uint64_t v4 = [(EKEventStore *)self connection];
  id v5 = [v4 CADOperationProxySync];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke;
  v8[3] = &unk_1E5B96D00;
  void v8[4] = &v9;
  [v5 CADDatabaseUnregisterForDetailedChangeTracking:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  BOOL v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke_cold_1();
    }
  }
}

- (void)fetchChangedObjectIDsSinceToken:(int64_t)a3 resultHandler:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(EKEventStore *)self connection];
  uint64_t v7 = [v6 CADOperationProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke;
  v9[3] = &unk_1E5B9A3E0;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 CADDatabaseFetchChangedObjectIDs:v9];
}

void __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke(uint64_t a1, int a2, char a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_2;
  block[3] = &unk_1E5B9A3B8;
  int v19 = a2;
  char v20 = a3;
  id v12 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v16 = v9;
  id v17 = v10;
  id v18 = v12;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, block);
}

void __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 64);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 68);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_3;
  v6[3] = &unk_1E5B9A390;
  void v6[4] = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _processChangedObjectIDsWithErrorCode:v1 changesTruncated:v2 latestToken:v4 changeData:v5 resultHandler:v6];
}

void __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10 = a1;
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = a6;
  id v13 = a5;
  id v16 = a4;
  id v14 = a3;
  [v11 recordSequenceTokenForLegacyClients:v14];
  uint64_t v15 = *(void *)(v10 + 40);
  LODWORD(v10) = [v14 legacyToken];

  (*(void (**)(uint64_t, uint64_t, void, id, id, id))(v15 + 16))(v15, a2, (int)v10, v16, v13, v12);
}

- (void)changedObjectIDsSinceToken:(int64_t)a3 resultHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __57__EKEventStore_changedObjectIDsSinceToken_resultHandler___block_invoke;
  v7[3] = &unk_1E5B9A390;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(EKEventStore *)self fetchChangedObjectIDs:v7];
}

void __57__EKEventStore_changedObjectIDsSinceToken_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10 = a1;
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = a6;
  id v13 = a5;
  id v16 = a4;
  id v14 = a3;
  [v11 recordSequenceTokenForLegacyClients:v14];
  uint64_t v15 = *(void *)(v10 + 40);
  LODWORD(v10) = [v14 legacyToken];

  (*(void (**)(uint64_t, uint64_t, void, id, id, id))(v15 + 16))(v15, a2, (int)v10, v16, v13, v12);
}

- (void)fetchChangedObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(EKEventStore *)self connection];
  id v6 = [v5 CADOperationProxySync];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __38__EKEventStore_fetchChangedObjectIDs___block_invoke;
  v8[3] = &unk_1E5B9A3E0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 CADDatabaseFetchChangedObjectIDs:v8];
}

uint64_t __38__EKEventStore_fetchChangedObjectIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _processChangedObjectIDsWithErrorCode:a2 changesTruncated:a3 latestToken:a4 changeData:a5 resultHandler:*(void *)(a1 + 40)];
}

- (void)_processChangedObjectIDsWithErrorCode:(int)a3 changesTruncated:(BOOL)a4 latestToken:(id)a5 changeData:(id)a6 resultHandler:(id)a7
{
  BOOL v9 = a4;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (a3)
  {
    id v14 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKEventStore _processChangedObjectIDsWithErrorCode:changesTruncated:latestToken:changeData:resultHandler:](v14);
    }
    (*((void (**)(id, void, void, void, void, void))v13 + 2))(v13, 0, 0, 0, 0, 0);
    goto LABEL_52;
  }
  BOOL v51 = v9;
  id v52 = v12;
  id v53 = v11;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v15 = (EKSequenceToken *)v12;
  uint64_t v61 = [(EKSequenceToken *)v15 countByEnumeratingWithState:&v65 objects:v77 count:16];
  id v57 = v13;
  if (v61)
  {
    long long v54 = 0;
    long long v55 = 0;
    id v17 = 0;
    id v18 = 0;
    int v19 = 0;
    uint64_t v59 = *(void *)v66;
    long long v56 = 0;
    *(void *)&long long v16 = 134218752;
    long long v50 = v16;
    long long v60 = v15;
LABEL_7:
    uint64_t v20 = 0;
    while (1)
    {
      id v63 = v17;
      id v64 = v18;
      if (*(void *)v66 != v59) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void **)(*((void *)&v65 + 1) + 8 * v20);
      uint64_t v22 = -[EKSequenceToken objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v21, v50);
      id v23 = [v22 objectForKeyedSubscript:@"changes"];
      id v24 = [v22 objectForKeyedSubscript:@"inserts"];
      uint64_t v25 = [v24 unsignedIntegerValue];

      id v26 = [v22 objectForKeyedSubscript:@"updates"];
      uint64_t v27 = [v26 unsignedIntegerValue];

      uint64_t v28 = [v22 objectForKeyedSubscript:@"deletes"];
      uint64_t v29 = [v28 unsignedIntegerValue];

      uint64_t v30 = [v21 intValue];
      long long v31 = +[EKObjectID EKObjectIDsFromData:range:databaseID:](EKObjectID, "EKObjectIDsFromData:range:databaseID:", v23, 0, v25, v30);
      id v32 = +[EKObjectID EKObjectIDsFromData:range:databaseID:](EKObjectID, "EKObjectIDsFromData:range:databaseID:", v23, v25, v27, v30);
      uint64_t v33 = +[EKObjectID EKObjectIDsFromData:range:databaseID:](EKObjectID, "EKObjectIDsFromData:range:databaseID:", v23, v27 + v25, v29, v30);
      uint64_t v34 = (void *)v33;
      if (v31) {
        BOOL v35 = v32 == 0;
      }
      else {
        BOOL v35 = 1;
      }
      BOOL v36 = v35 || v33 == 0;
      int v37 = !v36;
      int v62 = v37;
      if (v36)
      {
        long long v58 = v32;
        long long v40 = (void *)EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          long long v48 = v40;
          uint64_t v49 = [v23 length];
          *(_DWORD *)buf = v50;
          uint64_t v70 = v25;
          __int16 v71 = 2048;
          uint64_t v72 = v27;
          __int16 v73 = 2048;
          uint64_t v74 = v29;
          __int16 v75 = 2048;
          uint64_t v76 = v49;
          _os_log_error_impl(&dword_1A4E47000, v48, OS_LOG_TYPE_ERROR, "Change data was the wrong size to hold the changes we received. Told of %lu inserts, %lu updates, and %lu deletes, but change data was only %lu bytes long.", buf, 0x2Au);
        }
        (*((void (**)(id, void, void, void, void, void))v57 + 2))(v57, 0, 0, 0, 0, 0);
        id v17 = v63;
        id v18 = v64;
        uint64_t v15 = v60;
        id v32 = v58;
        goto LABEL_41;
      }
      if (v19 && [v19 count])
      {
        id v18 = v64;
        long long v38 = v56;
        if (!v56)
        {
          id v39 = (id)[v19 mutableCopy];

          long long v38 = v39;
          int v19 = v39;
        }
        id v17 = v63;
        long long v56 = v38;
        [v38 addObjectsFromArray:v31];
        if (!v64)
        {
LABEL_35:
          id v44 = v32;

          id v18 = v44;
          if (!v17) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
      }
      else
      {
        id v41 = v31;

        int v19 = v41;
        id v17 = v63;
        id v18 = v64;
        if (!v64) {
          goto LABEL_35;
        }
      }
      if (![v18 count]) {
        goto LABEL_35;
      }
      long long v42 = v55;
      if (!v55)
      {
        id v43 = (id)[v18 mutableCopy];

        long long v42 = v43;
        id v18 = v43;
      }
      long long v55 = v42;
      [v42 addObjectsFromArray:v32];
      if (!v17) {
        goto LABEL_40;
      }
LABEL_36:
      if ([v17 count])
      {
        long long v45 = v54;
        if (!v54)
        {
          id v46 = (id)[v17 mutableCopy];

          long long v45 = v46;
          id v17 = v46;
        }
        uint64_t v15 = v60;
        long long v54 = v45;
        [v45 addObjectsFromArray:v34];
        goto LABEL_41;
      }
LABEL_40:
      id v47 = v34;

      id v17 = v47;
      uint64_t v15 = v60;
LABEL_41:

      if (!v62)
      {
        id v12 = v52;
        id v11 = v53;
        id v13 = v57;
        goto LABEL_51;
      }
      if (v61 == ++v20)
      {
        uint64_t v61 = [(EKSequenceToken *)v15 countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (v61) {
          goto LABEL_7;
        }
        goto LABEL_47;
      }
    }
  }
  long long v54 = 0;
  long long v55 = 0;
  long long v56 = 0;
  id v17 = 0;
  id v18 = 0;
  int v19 = 0;
LABEL_47:

  id v11 = v53;
  if (v53) {
    uint64_t v15 = [[EKSequenceToken alloc] initWithCADSequenceToken:v53];
  }
  else {
    uint64_t v15 = 0;
  }
  id v13 = v57;
  (*((void (**)(id, BOOL, EKSequenceToken *, void *, void *, void *))v57 + 2))(v57, v51, v15, v19, v18, v17);
  id v12 = v52;
LABEL_51:

LABEL_52:
}

- (void)markChangedObjectIDsConsumedUpToToken:(int64_t)a3
{
  lastSequenceTokeuint64_t n = self->_lastSequenceToken;
  if (lastSequenceToken) {
    uint64_t v6 = [(EKSequenceToken *)lastSequenceToken legacyToken];
  }
  else {
    uint64_t v6 = -1;
  }
  if (v6 != a3 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKEventStore markChangedObjectIDsConsumedUpToToken:]();
  }
  if (self->_lastSequenceToken) {
    -[EKEventStore consumeAllChangesUpToToken:](self, "consumeAllChangesUpToToken:");
  }
}

- (void)consumeAllChangesUpToToken:(id)a3
{
  id v4 = a3;
  id v7 = [(EKEventStore *)self connection];
  id v5 = [v7 CADOperationProxySync];
  uint64_t v6 = [v4 CADToken];

  [v5 CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken:v6 reply:&__block_literal_global_602];
}

void __43__EKEventStore_consumeAllChangesUpToToken___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __43__EKEventStore_consumeAllChangesUpToToken___block_invoke_cold_1(v2);
    }
  }
}

- (BOOL)consumeAllChangesUpToToken:(id)a3 except:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[EKObjectChange CADObjectChangeIDsFromEKObjectChanges:v9];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  id v11 = [(EKEventStore *)self connection];
  id v12 = [v11 CADOperationProxySync];
  id v13 = [v8 CADToken];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__EKEventStore_consumeAllChangesUpToToken_except_error___block_invoke;
  v16[3] = &unk_1E5B96D00;
  void v16[4] = &v17;
  [v12 CADDatabaseConsumeAllChangesUpToToken:v13 except:v10 reply:v16];

  int v14 = *((_DWORD *)v18 + 6);
  if (a5 && v14)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithCADResult:*((unsigned int *)v18 + 6)];
  }
  _Block_object_dispose(&v17, 8);

  return v14 == 0;
}

uint64_t __56__EKEventStore_consumeAllChangesUpToToken_except_error___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)markIndividualChangesConsumed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[EKObjectChange CADObjectChangeIDsFromEKObjectChanges:v6];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  id v8 = [(EKEventStore *)self connection];
  id v9 = [v8 CADOperationProxySync];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __52__EKEventStore_markIndividualChangesConsumed_error___block_invoke;
  v12[3] = &unk_1E5B96D00;
  void v12[4] = &v13;
  [v9 CADDatabaseMarkIndividualChangesConsumed:v7 reply:v12];

  int v10 = *((_DWORD *)v14 + 6);
  if (a4 && v10)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithCADResult:*((unsigned int *)v14 + 6)];
  }
  _Block_object_dispose(&v13, 8);

  return v10 == 0;
}

uint64_t __52__EKEventStore_markIndividualChangesConsumed_error___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)recordSequenceTokenForLegacyClients:(id)a3
{
}

- (void)clearSuperfluousChanges
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Somebody called clearSuperfluousChanges. This call is no longer needed and does nothing.", v2, v3, v4, v5, v6);
}

- (void)setCachedDefaultAlarmOffsetsToNSNotFound
{
  defaultTimedAlarmOffset = self->_defaultTimedAlarmOffset;
  self->_defaultTimedAlarmOffset = (NSNumber *)&unk_1EF952F58;

  defaultAllDayAlarmOffset = self->_defaultAllDayAlarmOffset;
  self->_defaultAllDayAlarmOffset = (NSNumber *)&unk_1EF952F58;
}

- (NSNumber)defaultTimedAlarmOffset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__23;
  id v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  uint64_t v3 = [(EKEventStore *)self calendarSourcesAndDefaultsQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__EKEventStore_defaultTimedAlarmOffset__block_invoke;
  v6[3] = &unk_1E5B96E30;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  if ([(id)v8[5] integerValue] == 0x7FFFFFFFFFFFFFFFLL) {
    id v4 = 0;
  }
  else {
    id v4 = (id)v8[5];
  }
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

void __39__EKEventStore_defaultTimedAlarmOffset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[20];
  if (!v3)
  {
    id v4 = [v2 connection];
    uint64_t v5 = [v4 CADOperationProxySync];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2;
    v6[3] = &unk_1E5B9A408;
    void v6[4] = *(void *)(a1 + 32);
    [v5 CADDatabaseGetDefaultAlarmOffsetForAllDay:0 reply:v6];

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 160);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

void __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), a3);
  }
}

- (NSNumber)defaultAllDayAlarmOffset
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__23;
  id v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  uint64_t v3 = [(EKEventStore *)self calendarSourcesAndDefaultsQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke;
  v6[3] = &unk_1E5B96E30;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  if ([(id)v8[5] integerValue] == 0x7FFFFFFFFFFFFFFFLL) {
    id v4 = 0;
  }
  else {
    id v4 = (id)v8[5];
  }
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

void __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[21];
  if (!v3)
  {
    id v4 = [v2 connection];
    uint64_t v5 = [v4 CADOperationProxySync];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2;
    v6[3] = &unk_1E5B9A408;
    void v6[4] = *(void *)(a1 + 32);
    [v5 CADDatabaseGetDefaultAlarmOffsetForAllDay:1 reply:v6];

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 168);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

void __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), a3);
  }
}

- (void)purgeChangelog
{
  id v3 = [(EKEventStore *)self connection];
  uint64_t v2 = [v3 CADOperationProxySync];
  [v2 CADPurgeChangeTrackingReply:&__block_literal_global_609];
}

void __30__EKEventStore_purgeChangelog__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __30__EKEventStore_purgeChangelog__block_invoke_cold_1(v2);
    }
  }
}

- (void)cacheValidationStatusForAddress:(id)a3 status:(unint64_t)a4
{
  id v10 = a3;
  cachedValidatedAddresses = self->_cachedValidatedAddresses;
  if (!cachedValidatedAddresses)
  {
    uint64_t v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    id v8 = self->_cachedValidatedAddresses;
    self->_cachedValidatedAddresses = v7;

    cachedValidatedAddresses = self->_cachedValidatedAddresses;
  }
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)cachedValidatedAddresses setObject:v9 forKey:v10];
}

- (unint64_t)addressValidationStatus:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_cachedValidatedAddresses objectForKey:a3];
  unint64_t v4 = (int)[v3 intValue];

  return v4;
}

- (BOOL)occurrencesExistInRangeForEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6 timezone:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  int v16 = [(EKEventStore *)self connection];
  uint64_t v17 = [v16 CADOperationProxySync];
  id v18 = [v12 CADObjectID];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__EKEventStore_occurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone___block_invoke;
  v20[3] = &unk_1E5B99230;
  void v20[4] = &v21;
  [v17 CADOccurrencesExistInRangeForEvent:v18 startDate:v13 endDate:v14 mustStartInInterval:v8 timezone:v15 reply:v20];

  LOBYTE(v8) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return v8;
}

uint64_t __95__EKEventStore_occurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone___block_invoke(uint64_t result, uint64_t a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (id)cachedConstraintsForCalendar:(id)a3
{
  id v4 = a3;
  if (-[EKEventStore eventAccessLevel](self, "eventAccessLevel") != 1 || ![v4 allowEvents])
  {
    id v6 = [v4 source];
    uint64_t v7 = [(EKEventStore *)self cachedConstraintsForSource:v6];
LABEL_8:
    uint64_t v5 = (void *)v7;

    goto LABEL_9;
  }
  if (![v4 isNew])
  {
    id v6 = [v4 CADObjectID];
    uint64_t v7 = [(EKEventStore *)self cachedConstraintsForEventOrSourceWithCADObjectID:v6];
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
    -[EKEventStore cachedConstraintsForCalendar:]();
  }
  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

- (id)cachedConstraintsForReminder:(id)a3
{
  id v4 = [a3 calendar];
  uint64_t v5 = [v4 source];
  id v6 = [(EKEventStore *)self cachedConstraintsForSource:v5];

  return v6;
}

uint64_t __42__EKEventStore_cachedConstraintsForEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 CADObjectID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_clearCachedConstraintsForObjectWithCADObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKEventStore *)self constraintsCacheQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __64__EKEventStore__clearCachedConstraintsForObjectWithCADObjectID___block_invoke;
  v7[3] = &unk_1E5B97140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __64__EKEventStore__clearCachedConstraintsForObjectWithCADObjectID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedConstraints];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_clearAllCachedConstraints
{
  id v3 = [(EKEventStore *)self constraintsCacheQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EKEventStore__clearAllCachedConstraints__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __42__EKEventStore__clearAllCachedConstraints__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_cachedDefaultConstraints:", 0);
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "set_cachedConstraints:", 0);
}

- (void)cacheConstraints:(id)a3 forObjectWithCADObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(EKEventStore *)self constraintsCacheQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__EKEventStore_cacheConstraints_forObjectWithCADObjectID___block_invoke;
    block[3] = &unk_1E5B97190;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_sync(v8, block);
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore cacheConstraints:forObjectWithCADObjectID:]();
  }
}

void __58__EKEventStore_cacheConstraints_forObjectWithCADObjectID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedConstraints];

  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(*(id *)(a1 + 32), "set_cachedConstraints:", v3);
  }
  id v4 = [*(id *)(a1 + 32) _cachedConstraints];
  [v4 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

void __41__EKEventStore_sourceIdentifierForEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (id)notificationCollectionForSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectID];
  char v6 = [v5 isTemporary];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__23;
    id v18 = __Block_byref_object_dispose__23;
    id v19 = 0;
    id v8 = [(EKEventStore *)self notificationCollectionCacheQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__EKEventStore_notificationCollectionForSource___block_invoke;
    block[3] = &unk_1E5B97028;
    id v13 = &v14;
    void block[4] = self;
    id v12 = v4;
    dispatch_sync(v8, block);

    if (v15[5])
    {
      uint64_t v9 = [EKNotificationCollection alloc];
      id v7 = [(EKObject *)v9 initWithPersistentObject:v15[5]];
    }
    else
    {
      id v7 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

void __48__EKEventStore_notificationCollectionForSource___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedNotificationCollections];
  id v3 = [*(id *)(a1 + 40) CADObjectID];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) CADObjectID];
    uint64_t v9 = [v7 _fetchPersistentNotificationCollectionForSourceWithCADObjectID:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v12 = [*(id *)(a1 + 32) _cachedNotificationCollections];
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "set_cachedNotificationCollections:", v12);
      }
      else
      {
        id v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
        objc_msgSend(*(id *)(a1 + 32), "set_cachedNotificationCollections:", v13);
      }
      id v17 = [*(id *)(a1 + 32) _cachedNotificationCollections];
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v16 = [v14 CADObjectID];
      [v17 setObject:v15 forKey:v16];
    }
  }
}

- (id)_fetchPersistentNotificationCollectionForSourceWithCADObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__23;
  id v18 = __Block_byref_object_dispose__23;
  id v19 = 0;
  uint64_t v5 = [(EKEventStore *)self connection];
  char v6 = [v5 CADOperationProxySync];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke;
  v10[3] = &unk_1E5B9A430;
  id v7 = v4;
  id v12 = self;
  id v13 = &v14;
  id v11 = v7;
  [v6 CADSourceGetNotificationCollection:v7 reply:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  char v6 = v5;
  if (a2)
  {
    id v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_2(v7);
    }
  }
  else if (v5)
  {
    id v8 = +[EKObjectID objectIDWithCADObjectID:v5];
    uint64_t v9 = [*(id *)(a1 + 40) registerFetchedObjectWithID:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_1();
  }
}

- (BOOL)needsGeocodingForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EKEventStore_needsGeocodingForEvent___block_invoke;
  block[3] = &unk_1E5B97028;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);
  LOBYTE(unsavedChangesQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)unsavedChangesQueue;
}

uint64_t __39__EKEventStore_needsGeocodingForEvent___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 120) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)setNeedsGeocoding:(BOOL)a3 forEvent:(id)a4
{
  id v6 = a4;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EKEventStore_setNeedsGeocoding_forEvent___block_invoke;
  block[3] = &unk_1E5B9A458;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(unsavedChangesQueue, block);
}

uint64_t __43__EKEventStore_setNeedsGeocoding_forEvent___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v1) {
    return [v3 addObject:v2];
  }
  else {
    return [v3 removeObject:v2];
  }
}

- (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [(EKEventStore *)self connection];
  id v6 = [v5 CADOperationProxySync];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke;
  v8[3] = &unk_1E5B99230;
  void v8[4] = &v9;
  [v6 CADDatabaseShouldPermitOrganizerEmailFromJunkChecks:v4 reply:v8];

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [(EKEventStore *)self connection];
  id v6 = [v5 CADOperationProxySync];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke;
  v8[3] = &unk_1E5B99230;
  void v8[4] = &v9;
  [v6 CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks:v4 reply:v8];

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke_cold_1(v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)fetchStorageUsage
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__23;
  uint64_t v11 = __Block_byref_object_dispose__23;
  id v12 = 0;
  uint64_t v2 = [(EKEventStore *)self connection];
  id v3 = [v2 CADOperationProxySync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__EKEventStore_fetchStorageUsage__block_invoke;
  v6[3] = &unk_1E5B9A480;
  void v6[4] = &v7;
  [v3 CADDatabaseGetStorageUsage:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__EKEventStore_fetchStorageUsage__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __33__EKEventStore_fetchStorageUsage__block_invoke_cold_1(v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (void)analyticsSendEvent:(id)a3 appendingClientBundleIDToPayload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(EKEventStore *)self connection];
  id v8 = [v9 CADOperationProxySync];
  [v8 CADAnalyticsSendEvent:v7 appendingClientBundleIDToPayload:v6];
}

- (void)setCachedEKSourceConstraintObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EKEventStore *)self _cachedConstraints];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(EKEventStore *)self set_cachedConstraints:v9];
  }
  id v12 = [(EKEventStore *)self _cachedConstraints];
  id v10 = [(EKEventStore *)self database];
  uint64_t v11 = objc_msgSend(v6, "CADObjectIDWithGeneration:", objc_msgSend(v10, "databaseRestoreGeneration"));

  [v12 setObject:v7 forKey:v11];
}

- (void)postSyntheticRouteHypothesis:(id)a3 forEventWithExternalURL:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_DEFAULT, "Posting synthetic route hypothesis for event external url = %{public}@, route hypothesis = %@", buf, 0x16u);
  }
  if (v6)
  {
    id v9 = +[EKTravelEngineUtilities cadRouteHypothesisForEKTravelEngineHypothesis:v6];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [(EKEventStore *)self connection];
  uint64_t v11 = [v10 CADOperationProxySync];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke;
  v14[3] = &unk_1E5B9A4A8;
  id v15 = v7;
  id v16 = v9;
  id v12 = v9;
  id v13 = v7;
  [v11 CADPostSyntheticRouteHypothesis:v12 forEventWithExternalURL:v13 reply:v14];
}

void __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke_cold_1();
    }
  }
}

- (id)beginCalDAVServerSimulationWithHostname:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    if ([v3 hasSuffix:@"simulated.calendar.apple.com"]) {
      goto LABEL_6;
    }
    uint64_t v5 = [NSString stringWithFormat:@"%@.simulated.calendar.apple.com", v4];
  }
  else
  {
    id v6 = NSString;
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v7 = [v4 UUIDString];
    uint64_t v5 = [v6 stringWithFormat:@"%@.simulated.calendar.apple.com", v7];
  }
  id v4 = (void *)v5;
LABEL_6:
  id v8 = [MEMORY[0x1E4F5E950] sharedConnection];
  [v8 beginCalDAVServerSimulationWithHostname:v4];

  return v4;
}

- (void)endCalDAVServerSimulation:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F5E950];
  id v4 = a3;
  id v5 = [v3 sharedConnection];
  [v5 endCalDAVServerSimulationWithHostname:v4];
}

- (BOOL)backupDatabaseToDestination:(id)a3 withFormat:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__23;
  uint64_t v27 = __Block_byref_object_dispose__23;
  id v28 = 0;
  if (a4 != 2)
  {
    id v13 = [v8 lastPathComponent];
    char v14 = [v9 URLByDeletingLastPathComponent];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v14];
    id v16 = [(EKEventStore *)self connection];
    id v17 = [v16 CADOperationProxySync];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_622;
    v20[3] = &unk_1E5B96D00;
    void v20[4] = &v23;
    [v17 CADBackupDatabaseToFileNamed:v13 inDirectory:v15 includeAttachments:a4 == 1 reply:v20];

    goto LABEL_5;
  }
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  char v12 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:0 attributes:0 error:&obj];
  objc_storeStrong(v11, obj);

  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKEventStore backupDatabaseToDestination:withFormat:error:]();
      if (a5) {
        goto LABEL_11;
      }
    }
    else if (a5)
    {
LABEL_11:
      BOOL v18 = 0;
      *a5 = (id) v24[5];
      goto LABEL_8;
    }
    BOOL v18 = 0;
    goto LABEL_8;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v9];
  char v14 = [(EKEventStore *)self connection];
  id v15 = [v14 CADOperationProxySync];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke;
  v21[3] = &unk_1E5B96D00;
  v21[4] = &v23;
  [v15 CADBackupToICBU:v13 reply:v21];
LABEL_5:

  if (a5) {
    *a5 = (id) v24[5];
  }
  BOOL v18 = v24[5] == 0;
LABEL_8:
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_cold_1();
    }
  }
}

void __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_622(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_cold_1();
    }
  }
}

- (void)_resetAndNotifyAfterDatabaseRestoreGenerationChanged
{
  [(EKEventStore *)self _clearAllCaches];

  [(EKEventStore *)self _postEventStoreChangedNotificationWithChangeType:0 changedObjectIDs:0 forceImmediate:1];
}

- (BOOL)restoreDatabaseFromBackup:(id)a3 withFormat:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__23;
  uint64_t v22 = __Block_byref_object_dispose__23;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke;
  v17[3] = &unk_1E5B9A4D0;
  void v17[4] = self;
  void v17[5] = &v18;
  id v9 = (void *)MEMORY[0x1A6266730](v17);
  if (a4 == 2)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v8 readonly:1];
    uint64_t v11 = [(EKEventStore *)self connection];
    char v12 = [v11 CADOperationProxySync];
    [v12 CADRestoreFromICBU:v10 reply:v9];
  }
  else
  {
    id v10 = [v8 lastPathComponent];
    uint64_t v11 = [v8 URLByDeletingLastPathComponent];
    char v12 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v11 readonly:1];
    id v13 = [(EKEventStore *)self connection];
    char v14 = [v13 CADOperationProxySync];
    [v14 CADRestoreFromDatabaseBackupFileNamed:v10 inDirectory:v12 includeAttachments:a4 == 1 reply:v9];
  }
  id v15 = (void *)v19[5];
  if (a5 && v15) {
    *a5 = v15;
  }

  _Block_object_dispose(&v18, 8);
  return v15 == 0;
}

void __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke_cold_1();
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) connection];
    [v8 databaseRestoreGenerationChangedByThisClient:a3];

    id v9 = *(void **)(a1 + 32);
    [v9 _resetAndNotifyAfterDatabaseRestoreGenerationChanged];
  }
}

- (void)setDefaultCalendarForNewReminders:(id)a3
{
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
    -[EKEventStore setDefaultCalendarForNewReminders:]();
  }
}

- (id)predicateForPreloadedIncompleteRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6
{
  return 0;
}

- (id)predicateForPreloadedIncompleteRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6 maxResults:(unint64_t)a7
{
  return 0;
}

- (id)predicateForPreloadedCompletedRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6
{
  return 0;
}

- (id)reminderObjectIDsMatchingPredicate:(id)a3
{
  return 0;
}

- (id)predicateForIncompleteRemindersAndRemindersCompletedAfter:(id)a3 inCalendar:(id)a4
{
  return 0;
}

- (id)predicateForRemindersWithTitle:(id)a3 listTitle:(id)a4 limitToCompletedOrIncomplete:(BOOL)a5 completed:(BOOL)a6 dueAfter:(id)a7 dueBefore:(id)a8 searchTerm:(id)a9 sortOrder:(int)a10 maxResults:(unint64_t)a11
{
  return 0;
}

- (NSHashTable)insertedObjects
{
  return self->_insertedObjects;
}

- (void)setInsertedObjects:(id)a3
{
}

- (NSMutableSet)deletedObjects
{
  return self->_deletedObjects;
}

- (void)setDeletedObjects:(id)a3
{
}

- (NSMutableSet)updatedObjects
{
  return self->_updatedObjects;
}

- (void)setUpdatedObjects:(id)a3
{
}

- (NSMutableSet)uncommittableObjects
{
  return self->_uncommittableObjects;
}

- (void)setUncommittableObjects:(id)a3
{
}

- (NSMutableSet)objectsPendingSave
{
  return self->_objectsPendingSave;
}

- (void)setObjectsPendingSave:(id)a3
{
}

- (void)setDatabase:(id)a3
{
}

- (CADInMemoryChangeTimestamp)lastDatabaseNotificationTimestamp
{
  return self->_lastDatabaseNotificationTimestamp;
}

- (void)setLastDatabaseNotificationTimestamp:(id)a3
{
}

- (OS_dispatch_queue)calendarSourcesAndDefaultsQueue
{
  return self->_calendarSourcesAndDefaultsQueue;
}

- (OS_dispatch_queue)registeredQueue
{
  return self->_registeredQueue;
}

- (OS_dispatch_queue)unsavedChangesQueue
{
  return self->_unsavedChangesQueue;
}

- (OS_dispatch_queue)dbChangedQueue
{
  return self->_dbChangedQueue;
}

- (OS_dispatch_queue)notificationCollectionCacheQueue
{
  return self->_notificationCollectionCacheQueue;
}

- (EKSourceConstraints)_cachedDefaultConstraints
{
  return self->__cachedDefaultConstraints;
}

- (void)set_cachedDefaultConstraints:(id)a3
{
}

- (NSMutableDictionary)_cachedNotificationCollections
{
  return self->__cachedNotificationCollections;
}

- (void)set_cachedNotificationCollections:(id)a3
{
}

- (NSMutableDictionary)registeredObjects
{
  return self->_registeredObjects;
}

- (void)setRegisteredObjects:(id)a3
{
}

- (BOOL)inboxRepliedSectionHasContent
{
  return self->_inboxRepliedSectionHasContent;
}

- (BOOL)allowsIntegrationModifications
{
  return self->_allowsIntegrationModifications;
}

- (EKAlarm)defaultTimedAlarm
{
  return self->_defaultTimedAlarm;
}

- (EKAlarm)defaultAllDayAlarm
{
  return self->_defaultAllDayAlarm;
}

- (NSNumber)siriSuggestionsTimedAlarmOffset
{
  return self->_siriSuggestionsTimedAlarmOffset;
}

- (NSNumber)siriSuggestionsAllDayAlarmOffset
{
  return self->_siriSuggestionsAllDayAlarmOffset;
}

- (void)setSkipModificationValidation:(BOOL)a3
{
  self->_skipModificationValidatiouint64_t n = a3;
}

- (EKEmailSender)emailSender
{
  return self->_emailSender;
}

- (void)setEmailSender:(id)a3
{
}

void __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Failed to fetch any event sources despite having access to events. Skipping reminder sources and returning 0 sources", v1, 2u);
}

void __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Failed to fetch any reminder sources despite having access to reminders. Skipping event sources and returning 0 sources", v1, 2u);
}

- (void)initWithEKOptions:(uint64_t)a1 path:(void *)a2 containerProvider:tccPermissionChecker:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28F80];
  uint64_t v3 = a2;
  uint64_t v4 = [v2 processInfo];
  uint64_t v5 = [v4 processName];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v3, v6, "[%@] initialized in process: [%@]", v7);
}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Data is not protected.  Saying that protected data became available.", v2, v3, v4, v5, v6);
}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Data is protected.  Will not say that protected data became available.", v2, v3, v4, v5, v6);
}

void __23__EKEventStore_dealloc__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error closing the database: %@", v6, v7, v8, v9, v10);
}

+ (void)authorizationStatusWithAuditToken:entityType:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Unexpected tcc_authorization_right_t (int value: %llu): we don't support this kind of authorization.", v2);
}

- (void)requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Calling request access completion handler with invalid entity type error", v2, v3, v4, v5, v6);
}

void __29__EKEventStore_sequenceToken__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting changes sequence token from daemon: %@", v6, v7, v8, v9, v10);
}

void __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting changes since sequence number from daemon: %@", v6, v7, v8, v9, v10);
}

- (void)_invalidCADObjectIDs:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v0, v1, "No object IDs given.  Will not validate object IDs: [%@]", v2);
}

void __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error validating object IDs from daemon: %@", v6, v7, v8, v9, v10);
}

void __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Got a not found error when validating an array of objectIDs. Assuming all are invalid", v2, v3, v4, v5, v6);
}

- (void)_handleExternalDatabaseChangeNotification:synchronously:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Not handling notification \"%@\" because there is no action for that notification name.", v2);
}

void __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v5, v6, "Error getting changed object IDs since timestamp %{public}@ from daemon: %@", v7, v8, v9, v10, v11);
}

void __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting events with uniqueId %@: %@", v6, v7, v8, v9, v10);
}

void __36__EKEventStore_eventStoreIdentifier__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting UUID: %@", v6, v7, v8, v9, v10);
}

- (void)_cacheSourceWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Attempted to cache a source before _sources was initialized. Ignoring.", v2, v3, v4, v5, v6);
}

void __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting sources: %@", v6, v7, v8, v9, v10);
}

void __44__EKEventStore_sourcesEnabledForEntityType___block_invoke_cold_1(uint64_t *a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = *a1;
  id v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedInteger:v3];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v6, v7, "Invalid source type passed to sourcesEnabledForEntityType: %@", v8, v9, v10, v11, v12);
}

void __33__EKEventStore__deletableSources__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting deletable sources: %@", v6, v7, v8, v9, v10);
}

void __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to get scubscribed calendars source: %@", v2);
}

void __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to get local birthday calendar: %@", v2);
}

- (void)parentSourceForDelegateSource:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "parentSourceForDelegateSource called with non-delegate source", v2, v3, v4, v5, v6);
}

void __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting granted delegates list: %@", v6, v7, v8, v9, v10);
}

void __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error updating granted delegate: %@", v6, v7, v8, v9, v10);
}

- (void)isSourceManaged:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 sourceIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v3, v5, "Cannot check whether source (%{public}@) is managed because we don't have access to the entity type it supports", v6);
}

void __32__EKEventStore_isSourceManaged___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v7 = [v5 sourceIdentifier];
  uint64_t v8 = [*(id *)(a1 + 32) objectID];
  int v9 = [v8 rowID];
  uint8_t v10 = [MEMORY[0x1E4F28C58] errorWithCADResult:a3];
  int v11 = 138543874;
  uint8_t v12 = v7;
  __int16 v13 = 1024;
  int v14 = v9;
  __int16 v15 = 2112;
  id v16 = v10;
  _os_log_error_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_ERROR, "Error checking whether source (%{public}@, rowID = %d) is managed: %@", (uint8_t *)&v11, 0x1Cu);
}

void __31__EKEventStore_dbStatsBySource__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting stats: %@", v6, v7, v8, v9, v10);
}

void __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_14(&dword_1A4E47000, v5, v6, "Error getting persona identifier for database %i: %@", v7, v8, v9, v10, v11);
}

void __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 objectID];
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithCADResult:a3];
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v8, v9, "Error clearing calendar %@ from notification center: %@", v10, v11, v12, v13, 2u);
}

- (void)_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Attempted to cache a calendar before _calendars was initialized. Ignoring.", v2, v3, v4, v5, v6);
}

- (void)_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Cached calendar has no calendarIdentifier: %{public}@", v2);
}

void __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting all calendars: %@", v6, v7, v8, v9, v10);
}

void __35__EKEventStore__deletableCalendars__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting deletable calendars: %@", v6, v7, v8, v9, v10);
}

- (void)saveCalendar:commit:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to save calendar: %@", v2);
}

- (void)_saveCalendar:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to save local source when attempting to enable events to save a new calendar: %@", v2);
}

- (void)removeCalendar:commit:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to remove calendar: %@", v2);
}

void __42__EKEventStore__eventWithEventIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting event with identifier %@: %@", v6, v7, v8, v9, v10);
}

- (void)_eventWithURI:checkValid:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_19();
  uint64_t v3 = @"x-apple-calevent";
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v0, v1, "Malformed event URI (%@) passed to _eventWithURI. Expected scheme: %@", v2);
}

void __41__EKEventStore__eventWithURI_checkValid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting calendar item with URI %@: %@", v6, v7, v8, v9, v10);
}

void __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error checking for existence of event in eventForUID: %@", v6, v7, v8, v9, v10);
}

- (void)eventForObjectID:occurrenceDate:checkValid:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Error: objectID provided is nil or has the wrong entity type %{public}@", v2);
}

void __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error checking for existence of event in eventForObjectID: %{public}@", v6, v7, v8, v9, v10);
}

void __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting event with uniqueId %@: %@", v6, v7, v8, v9, v10);
}

void __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting calendar item with UUID %@: %@", v6, v7, v8, v9, v10);
}

void __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting entity wrappers for event uuids %@: %@", v6, v7, v8, v9, v10);
}

void __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting all events with uniqueId %@: %@", v6, v7, v8, v9, v10);
}

- (void)saveEvent:span:commit:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to save event: %@", v2);
}

- (void)removeEvent:span:commit:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to remove event: %@", v2);
}

void __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error setting invitation status for event: %@", v6, v7, v8, v9, v10);
}

void __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error importing ICS data into calendars %@: %@", v6, v7, v8, v9, v10);
}

void __36__EKEventStore_defaultLocalCalendar__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting default local calendar: %@", v6, v7, v8, v9, v10);
}

- (void)defaultCalendarForNewEventsInDelegateSource:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Non-delegate sources do not have their own default calendar.  Pass nil to get the default across all non-delegate sources", v2, v3, v4, v5, v6);
}

void __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting default calendar for new events: %@", v6, v7, v8, v9, v10);
}

- (void)setDefaultCalendar:forNewEventsInDelegateSource:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "The default calendar cannot be an integration calendar", v2, v3, v4, v5, v6);
}

- (void)setDefaultCalendar:forNewEventsInDelegateSource:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "A delegate source's default calendar must be one of its own calendars.", v2, v3, v4, v5, v6);
}

- (void)setDefaultCalendar:forNewEventsInDelegateSource:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "You cannot set a default calendar on a non-delegate source.  Pass nil to set the default across all non-delegate sources", v2, v3, v4, v5, v6);
}

void __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error setting default calendar for new events: %@", v6, v7, v8, v9, v10);
}

- (void)_saveDraftOfEvent:(uint64_t)a1 toDirectory:(void *)a2 withVersion:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  uint64_t v6 = [a2 changeSet];
  uint64_t v7 = [v6 summary];
  int v8 = 136315906;
  uint64_t v9 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  __int16 v14 = 2112;
  __int16 v15 = v7;
  _os_log_error_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_ERROR, "%s: Failed to serialize changeset. Error: [%@]. Event [%@]. Changeset: [%@]", (uint8_t *)&v8, 0x2Au);
}

- (void)_saveDraftOfEvent:toDirectory:withVersion:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_18(&dword_1A4E47000, v0, v1, "%s: Can't create draft event directory %@ with error %@", v2);
}

- (void)_saveDraftOfEvent:toDirectory:withVersion:.cold.3()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v0, v1, "%s: Creating directory at path %@", (uint8_t *)&v2);
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v0, v1, "%s: Unable to read data from path %@", (uint8_t *)&v2);
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_18(&dword_1A4E47000, v0, v1, "%s: Failed to deserialize changeset. Error: [%@]. Data: [%@]", v2);
}

- (void)_loadDraftOfEventWithOccurrenceID:(void *)a1 fromDirectory:withVersion:.cold.3(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() summary];
  int v5 = 136315394;
  uint64_t v6 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v1, v4, "%s: Made changeset from diff: %@", (uint8_t *)&v5);
}

- (void)_loadDraftOfEventWithOccurrenceID:(void *)a1 fromDirectory:withVersion:.cold.4(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() summaryString];
  int v5 = 136315394;
  uint64_t v6 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v1, v4, "%s: Computed diff from existing event: %@", (uint8_t *)&v5);
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.5()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v0, v1, "%s: Found existing event: %@", (uint8_t *)&v2);
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.6()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_12();
  __int16 v3 = v0;
  uint64_t v4 = @"3.0";
  _os_log_error_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_ERROR, "%s: Draft at path %@ has incorrect version (%@ vs %@).  Deleting", (uint8_t *)v2, 0x2Au);
}

- (void)_deleteDraft:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  __int16 v3 = "-[EKEventStore _deleteDraft:]";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v0, v1, "%s: Removed file at path %@", (uint8_t *)&v2);
}

- (void)_deleteDraft:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_18(&dword_1A4E47000, v0, v1, "%s: Failed to remove file from path %@ with error %@", v2);
}

- (void)saveReminder:commit:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to save reminder: %@", v2);
}

- (void)_saveReminder:commit:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Can't save reminder either because you have no access or you're trying to save using the legacy store, which is no longer supported", v2, v3, v4, v5, v6);
}

- (void)removeReminder:commit:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to remove reminder: %@", v2);
}

- (void)reminderWithExternalURI:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Malformed event URI passed to _reminderWithURI: %@", v2);
}

- (void)reminderWithExternalURI:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_19();
  uint64_t v3 = @"x-apple-reminderkit";
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v0, v1, "Malformed event URI (%@) passed to _reminderWithURI. Expected scheme: %@", v2);
}

void __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting events with reurrenceSet %@: %@", v6, v7, v8, v9, v10);
}

void __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting events with unique identifier %@: %@", v6, v7, v8, v9, v10);
}

- (void)accessGrantedForEntityType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = a2;
  LODWORD(v5) = [v5 rowID];
  LODWORD(v4) = [*(id *)(v4 + 32) databaseID];
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithCADResult:a3];
  v8[0] = 67109634;
  v8[1] = v5;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2112;
  __int16 v12 = v7;
  _os_log_error_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_ERROR, "Error getting closest occurrence date for event with row ID %i, databaseID %i : %@", (uint8_t *)v8, 0x18u);
}

void __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error asking daemon to count occurrences: %@", v6, v7, v8, v9, v10);
}

void __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error asking daemon if events have occurrences after date: %@", v6, v7, v8, v9, v10);
}

- (void)calendarWithExternalURI:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Malformed calendar URI passed to calendarWithExternalURI: %@", v2);
}

void __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __30__EKEventStore_syncErrorCount__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Could not fetch error count: %@", v6, v7, v8, v9, v10);
}

void __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Could not fetch errors by source: %@", v6, v7, v8, v9, v10);
}

void __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Could not fetch color: %@", v6, v7, v8, v9, v10);
}

void __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting occurrence cache occurrences for calendars %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error getting occurrence cache counts for calendars %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __38__EKEventStore_setShowDeclinedEvents___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_14(&dword_1A4E47000, v5, v6, "The setting for showing declined events was not successfully set to %{BOOL}d.  Error: [%@]", v7, v8, v9, v10, v11);
}

void __34__EKEventStore_showDeclinedEvents__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Fetching showDeclinedEvents setting was not successful. Error: [%@]", v6, v7, v8, v9, v10);
}

void __42__EKEventStore_setShowCompletedReminders___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_14(&dword_1A4E47000, v5, v6, "The setting for showing completed reminders was not successfully set to %{BOOL}d.  Error: [%@]", v7, v8, v9, v10, v11);
}

void __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "The occurrence cache was rebuilt successfully.", v2, v3, v4, v5, v6);
}

void __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v1, v4, "The occurrence cache was not rebuilt successfully.  Error: [%@]", v5);
}

void __39__EKEventStore_birthdayCalendarEnabled__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "%s: Failed find out if birthday calendars are enabled with error %@", v6, v7, v8, v9, 2u);
}

void __43__EKEventStore_setBirthdayCalendarEnabled___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "%s: Unable to set birthday calendars enabled with error %@", v6, v7, v8, v9, 2u);
}

void __39__EKEventStore_birthdayCalendarVersion__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "%s: Failed find out birthday calendar version with error %@", v6, v7, v8, v9, 2u);
}

void __43__EKEventStore_setBirthdayCalendarVersion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  int v6 = 136315650;
  uint64_t v7 = "-[EKEventStore setBirthdayCalendarVersion:]_block_invoke";
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 2112;
  uint8_t v11 = v5;
  _os_log_error_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_ERROR, "%s: Unable to set birthday calendars version to %d with error %@", (uint8_t *)&v6, 0x1Cu);
}

void __38__EKEventStore_suggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "%s: Failed to get the Found in Mail calendar with error %@", v6, v7, v8, v9, 2u);
}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "%s: Could not insert the Found in Mail calendar with error %@", v6, v7, v8, v9, 2u);
}

void __44__EKEventStore_removeSuggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "%s: Could not remove the Found in Mail calendar with error %@", v6, v7, v8, v9, 2u);
}

- (void)confirmSuggestedEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[EKEventStore confirmSuggestedEvent:]";
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, a1, a3, "%s - event has no suggestions key", (uint8_t *)&v3);
}

void __38__EKEventStore_confirmSuggestedEvent___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[EKEventStore confirmSuggestedEvent:]_block_invoke_2";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v0, v1, "%s - confirmEventByRecordId failed with error %@", (uint8_t *)&v2);
}

- (void)acceptSuggestedEvent:(NSObject *)a3 placeOnCalendar:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  int v3 = @"FAILED";
  *(void *)&v4[4] = "-[EKEventStore acceptSuggestedEvent:placeOnCalendar:]";
  *(_DWORD *)uint64_t v4 = 136315650;
  *(_WORD *)&v4[12] = 2112;
  if (a1) {
    int v3 = @"succeeded";
  }
  *(void *)&v4[14] = v3;
  *(_WORD *)&v4[22] = 2112;
  OUTLINED_FUNCTION_26(&dword_1A4E47000, a2, a3, "%s - promoting saveEvent %@ - had error %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], a2);
}

- (void)deleteSuggestedEvent:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[EKEventStore deleteSuggestedEvent:]";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v0, v1, "%s - Notifying suggestions we have ignored event %@", (uint8_t *)&v2);
}

- (void)deleteSuggestedEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[EKEventStore deleteSuggestedEvent:]";
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, a1, a3, "%s - event has no suggestions key", (uint8_t *)&v3);
}

- (void)deleteSuggestedEvent:(NSObject *)a3 .cold.3(char a1, uint64_t a2, NSObject *a3)
{
  int v3 = @"FAILED";
  *(void *)&v4[4] = "-[EKEventStore deleteSuggestedEvent:]";
  *(_DWORD *)uint64_t v4 = 136315650;
  *(_WORD *)&v4[12] = 2112;
  if (a1) {
    int v3 = @"succeeded";
  }
  *(void *)&v4[14] = v3;
  *(_WORD *)&v4[22] = 2112;
  OUTLINED_FUNCTION_26(&dword_1A4E47000, a2, a3, "%s - removeEvent %@ - had error %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], a2);
}

void __37__EKEventStore_deleteSuggestedEvent___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[EKEventStore deleteSuggestedEvent:]_block_invoke_2";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v0, v1, "%s - rejectEventByRecordId failed with error %@", (uint8_t *)&v2);
}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_3_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error determining if the suggested event calendar is modifiable: %@", v6, v7, v8, v9, v10);
}

void __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "%s: Failed to get the Natural Language Suggestions calendar with error %@", v6, v7, v8, v9, 2u);
}

void __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint8_t v10 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_14(&dword_1A4E47000, v4, v5, "Error getting shared calendar invitations for entity types %i from daemon: %@", v6, v7, v8, v9, 2u);
}

- (void)respondToSharedCalendarInvitation:(uint64_t)a3 withStatus:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = 0;
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, a1, a3, "Error: calendar does not exist when calling respondToSharedCalendarInvitation. calendar: %@", (uint8_t *)&v3);
}

void __46__EKEventStore_resourceChangesForEntityTypes___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting resource changes: %@", v6, v7, v8, v9, v10);
}

void __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Error marking resource change alerted: %@", v2);
}

void __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "EKEventStore: Can't get event notification information. Error: [%@]", v6, v7, v8, v9, v10);
}

void __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "EKEventStore: Can't get event notification count. Error: [%@]", v6, v7, v8, v9, v10);
}

void __40__EKEventStore_inboxRepliedSectionItems__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting replied event invitation information: %@", v6, v7, v8, v9, v10);
}

void __35__EKEventStore_attachmentWithUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error fetching attachment with UUID. UUID: [%{public}@].  Error: [%@]", v6, v7, v8, v9, v10);
}

void __49__EKEventStore__refreshDASource_isUserRequested___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error refreshing source: %@", v6, v7, v8, v9, v10);
}

- (void)_addFetchedObjectWithID:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  v5[0] = 67109376;
  v5[1] = [(id)OUTLINED_FUNCTION_5() entityType];
  __int16 v6 = 1024;
  int v7 = [a2 rowID];
  _os_log_fault_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_FAULT, "Unknown entity type: %d for object with rowid: %d", (uint8_t *)v5, 0xEu);
}

- (void)objectWithIDExists:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "No object ID provided.  Will not find out if the object exists.", v2, v3, v4, v5, v6);
}

void __35__EKEventStore_objectWithIDExists___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error encountered while checking for existence of object with ID: [%@]  Error: [%@]", v6, v7, v8, v9, v10);
}

- (void)commit:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to commit: %@", v2);
}

- (void)commitWithRollback:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Rolling back changes after commit error: %@", v2);
}

- (void)_commitObjectsWithIdentifiers:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Client not allowed to modify the calendar database.  Will not commit.", v2, v3, v4, v5, v6);
}

- (void)_commitObjectsWithIdentifiers:error:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v0, v1, "Attempting to commit changes in event store: [%@].", v2);
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[EKEventStore _commitObjectsWithIdentifiers:error:]_block_invoke_2";
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v0, v1, "%s - deleteEventByRecordId failed with error %@", (uint8_t *)&v2);
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_4();
  __int16 v4 = 2114;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v1, v2, "Failed to delete %{public}@ update/insert %{public}@", v3);
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Error committing event store: [%@]", v2);
}

- (void)_fetchProperties:forObjects:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_7_2(&dword_1A4E47000, v1, (uint64_t)v1, "Got the wrong number of entity wrappers back; asked for %lud things but got %lud",
    v2);
}

- (void)addPendingIntegrationEvent:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "New integration events without identifiers cannot be matched with their permanent events.", v2, v3, v4, v5, v6);
}

- (void)addPendingIntegrationEvent:(void *)a1 .cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() privacySafeIntegrationEventDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v1, v4, "Adding pending integration event: %{public}@", v5);
}

void __45__EKEventStore_requestIntegrationCatchupSync__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error requesting catchup sync: [%@]", v6, v7, v8, v9, v10);
}

- (void)eventsMatchingPredicate:.cold.1()
{
  OUTLINED_FUNCTION_21();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  [v0 count];
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_4_2(&dword_1A4E47000, v2, v3, "%ld events were found for predicate: %@", v4);
}

- (void)enumerateEventsMatchingPredicate:usingBlock:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v0, v1, "Enumeration attempt for events that were fetched is complete.  Predicate: [%@]", v2);
}

- (void)cancelFetchRequest:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  OUTLINED_FUNCTION_5();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  id v4 = v3;
  _os_log_fault_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_FAULT, "Invalid fetchIdentifier given to cancelFetchRequest. Type: %{public}@", v5, 0xCu);
}

void __30__EKEventStore_alarmWithUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error fetching alarm with UUID.  UUID: [%@].  Error: [%@]", v6, v7, v8, v9, v10);
}

void __36__EKEventStore_alarmWithExternalID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error fetching alarm with externalID.  externalID: [%@].  Error: [%@]", v6, v7, v8, v9, v10);
}

void __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting alarm occurrences in range: %@", v6, v7, v8, v9, v10);
}

- (void)predicateForPotentialTravelEventsInCalendars:startDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_21();
  id v2 = v1;
  OUTLINED_FUNCTION_20();
  id v3 = _NSMethodExceptionProem();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "%@: Error building fetch predicate for 'Time to Leave' events. End date is nil.", v6, v7, v8, v9, v10);
}

- (void)predicateForPotentialTravelEventsInCalendars:startDate:endDate:.cold.2()
{
  OUTLINED_FUNCTION_21();
  id v2 = v1;
  OUTLINED_FUNCTION_20();
  id v3 = _NSMethodExceptionProem();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "%@: Error building fetch predicate for 'Time to Leave' events. Start date is nil.", v6, v7, v8, v9, v10);
}

- (void)predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:.cold.1()
{
  OUTLINED_FUNCTION_21();
  id v2 = v1;
  OUTLINED_FUNCTION_20();
  id v3 = _NSMethodExceptionProem();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "%@: Error building fetch predicate for 'Up Next' events. End date is nil.", v6, v7, v8, v9, v10);
}

- (void)predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:.cold.2()
{
  OUTLINED_FUNCTION_21();
  id v2 = v1;
  OUTLINED_FUNCTION_20();
  id v3 = _NSMethodExceptionProem();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "%@: Error building fetch predicate for 'Up Next' events. Start date is nil.", v6, v7, v8, v9, v10);
}

void __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error fetching location authorization status for TTL: %@", v6, v7, v8, v9, v10);
}

void __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Error registering for detailed change tracking: %@", v2);
}

void __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Error unregistering for detailed change tracking: %@", v2);
}

- (void)_processChangedObjectIDsWithErrorCode:(void *)a1 changesTruncated:latestToken:changeData:resultHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error fetching changed object IDs: %@", v6, v7, v8, v9, v10);
}

- (void)markChangedObjectIDsConsumedUpToToken:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "A client is passing a token other than the one it most recently fetched to -markChangedObjectIDsConsumedUpToToken:. That's no longer supported.", v2, v3, v4, v5, v6);
}

void __43__EKEventStore_consumeAllChangesUpToToken___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error marking changed object IDs as consumed: %@", v6, v7, v8, v9, v10);
}

void __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting defaultTimedAlarmOffset: %@", v6, v7, v8, v9, v10);
}

void __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting _defaultAllDayAlarmOffset: %@", v6, v7, v8, v9, v10);
}

void __30__EKEventStore_purgeChangelog__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error in call to _saveWithoutNotify: %@", v6, v7, v8, v9, v10);
}

- (void)cachedConstraintsForSource:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() sourceIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v1, v4, "Cannot get source constraints for source %{public}@ because we don't have access to the entity type it supports", v5);
}

- (void)cachedConstraintsForCalendar:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_FAULT, "Shouldn't call cachedConstraintsForCalendar for new created calendar in limited access, since calendar creation is forbidden in limited access", v1, 2u);
}

- (void)cachedConstraintsForEventOrSourceWithCADObjectID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "This method (cachedConstraintsForEventOrSourceWithCADObjectID:) doesn't intend to handle an event if the client isn't in limited access mode. Use a source instead.", v2, v3, v4, v5, v6);
}

- (void)cacheConstraints:forObjectWithCADObjectID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Error caching constraints for objectWithCADObjectID", v2, v3, v4, v5, v6);
}

void __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting constraints for source: %@", v6, v7, v8, v9, v10);
}

void __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "NotificationCollectionID requested when it has not yet been created. SourceID: %@", v2);
}

void __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting notificationCollection for source: %@", v6, v7, v8, v9, v10);
}

void __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error checking whether to permit email address: %@", v6, v7, v8, v9, v10);
}

void __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error checking whether to permitted phone number: %@", v6, v7, v8, v9, v10);
}

void __33__EKEventStore_fetchStorageUsage__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v4, v5, "Error getting storage usage: %@", v6, v7, v8, v9, v10);
}

void __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_4();
  __int16 v4 = 1024;
  int v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_ERROR, "Could not post synthetic route hypothesis for event with external url = %{public}@, error = %d, route hypothesis = %@", v3, 0x1Cu);
}

- (void)backupDatabaseToDestination:withFormat:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to create destination .icbu: %@", v2);
}

void __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to backup: %@", v2);
}

void __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_5(&dword_1A4E47000, v0, v1, "Failed to restore: %@", v2);
}

- (void)setDefaultCalendarForNewReminders:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_FAULT, "Attempt to set the default calendar for new reminders using EventKit. This is unsupported. You must use ReminderKit.", v1, 2u);
}

@end