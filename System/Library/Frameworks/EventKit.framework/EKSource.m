@interface EKSource
+ (BOOL)isWeakRelationship;
+ (Class)frozenClass;
+ (EKSource)sourceWithEventStore:(id)a3;
+ (id)_eventKitBundle;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownSingleValueKeysForComparison;
+ (id)primaryLocalSourceID;
+ (int)_ekPrivacyLevelToCalEventPrivacyLevel:(int64_t)a3;
+ (int64_t)_calEventPrivacyLevelToEKPrivacyLevel:(int)a3;
- (BOOL)_reset;
- (BOOL)_shouldCopyDefaultAlarmsFromLocalSource;
- (BOOL)_validateClientCanModifySources:(id *)a3;
- (BOOL)allowsCalendarAddDeleteModify;
- (BOOL)allowsEvents;
- (BOOL)allowsPrivateEventAccessByDelegate;
- (BOOL)allowsProposeNewTime;
- (BOOL)allowsTasks;
- (BOOL)constraintSupportsAvailabilityRequests;
- (BOOL)disabled;
- (BOOL)doesSyncDefaultAlarmsToServer;
- (BOOL)flag2:(int)a3;
- (BOOL)flag:(int)a3;
- (BOOL)hasOwnerEmailAddress;
- (BOOL)isDelegate;
- (BOOL)isEnabled;
- (BOOL)isFacebook;
- (BOOL)isFacebookSource;
- (BOOL)isInMainWindow;
- (BOOL)isInSeparateWindow;
- (BOOL)isNestedLocalSource;
- (BOOL)isPrimaryAppleAccount;
- (BOOL)isPrimaryLocalSource;
- (BOOL)isReadable;
- (BOOL)isSyncing;
- (BOOL)isWritable;
- (BOOL)onlyCreatorCanModify;
- (BOOL)prohibitsDetachmentOnCommentChange;
- (BOOL)prohibitsICSImport;
- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence;
- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence;
- (BOOL)prohibitsPrivateEventsWithAttendees;
- (BOOL)prohibitsSlicingEventsWithAttendees;
- (BOOL)prohibitsYearlyRecurrenceInterval;
- (BOOL)readOnly;
- (BOOL)refresh;
- (BOOL)remove:(id *)a3;
- (BOOL)removeCalendarItemsOlderThanDate:(id)a3 entityTypeMask:(unint64_t)a4 error:(id *)a5;
- (BOOL)requiresOccurrencesConformToRecurrenceRule;
- (BOOL)requiresSamePrivacyLevelAcrossRecurrenceSeries;
- (BOOL)save:(id *)a3;
- (BOOL)serverUsesSSL;
- (BOOL)showsNotifications;
- (BOOL)snoozeAlarmRequiresDetach;
- (BOOL)supportsAlarmAcknowledgedDate;
- (BOOL)supportsAttachments;
- (BOOL)supportsAvailability;
- (BOOL)supportsAvailabilityRequests;
- (BOOL)supportsCalendarCreation;
- (BOOL)supportsCalendarTaskCreation;
- (BOOL)supportsClearingPrivateComments;
- (BOOL)supportsDelegateEnumeration;
- (BOOL)supportsDelegation;
- (BOOL)supportsEventCalendarCreation;
- (BOOL)supportsEventForwarding;
- (BOOL)supportsIgnoringEventsInAvailabilityRequests;
- (BOOL)supportsInvitationModificationsWithoutNotification;
- (BOOL)supportsLocationDirectorySearches;
- (BOOL)supportsPrivateEvents;
- (BOOL)supportsPush;
- (BOOL)supportsReminderActions;
- (BOOL)supportsSharedCalendars;
- (BOOL)supportsTaskCalendarCreation;
- (BOOL)supportsTravelTime;
- (BOOL)syncs;
- (BOOL)usesSelfAttendee;
- (BOOL)validate:(id *)a3;
- (BOOL)wantsCommentPromptWhenDeclining;
- (BOOL)wasMigrated;
- (EKSourceConstraints)constraints;
- (EKSyncError)syncError;
- (NSDate)lastSyncEndDate;
- (NSDate)lastSyncStartDate;
- (NSDictionary)cachedExternalInfo;
- (NSDictionary)lastSyncErrorUserInfo;
- (NSError)sourceError;
- (NSError)sourceOrEventError;
- (NSNumber)defaultAlarmOffset;
- (NSNumber)defaultAllDayAlarmOffset;
- (NSSet)allCalendars;
- (NSSet)calendars;
- (NSSet)calendarsForEntityType:(EKEntityType)entityType;
- (NSSet)ownerAddresses;
- (NSString)appGroupIdentifier;
- (NSString)constraintsDescriptionPath;
- (NSString)constraintsName;
- (NSString)creatorBundleID;
- (NSString)creatorCodeSigningIdentity;
- (NSString)delegatedAccountOwnerStoreID;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)notes;
- (NSString)ownerName;
- (NSString)personaIdentifier;
- (NSString)preferredOwnerAddress;
- (NSString)serverHost;
- (NSString)symbolicColorForNewCalendar;
- (NSString)title;
- (NSURL)serverURL;
- (REMObjectID)remAccountObjectID;
- (id)UUID;
- (id)_calDAVOfficeHoursFromEKOfficeHours:(id)a3;
- (id)_constraintsInternal;
- (id)_convertTypeOfOwnerAddresses:(id)a3 toSet:(BOOL)a4;
- (id)_ekOfficeHoursFromCalDAVOfficeHours:(id)a3;
- (id)_nsErrorFromSyncError:(id)a3 event:(id)a4;
- (id)availabilityCache;
- (id)cachedExternalInfoData;
- (id)calendarWithExternalIdentifier:(id)a3;
- (id)description;
- (id)externalInfoForKey:(id)a3;
- (id)pendingPersonaIdentifierForNewSource;
- (id)readWriteCalendarsForEntityType:(unint64_t)a3;
- (int)displayOrder;
- (int)displayOrderForNewCalendar;
- (int)flags;
- (int)flags2;
- (int)managedConfigurationAccountAccess;
- (int)preferredEventPrivateValueRaw;
- (int)strictestEventPrivateValueRaw;
- (int64_t)preferredEventPrivateValue;
- (int64_t)serverPort;
- (int64_t)sourceTypeRaw;
- (int64_t)strictestEventPrivateValue;
- (unint64_t)lastSyncError;
- (void)_copyInitialDefaultAlarmSettingsIfNeeded;
- (void)_countCalendarItemsOfCalType:(int)a3 resultHandler:(id)a4;
- (void)_resetInternalStateWithForce:(BOOL)a3;
- (void)_setConstraintsNameWithoutValidation:(id)a3;
- (void)countCalendarItemsOfType:(unint64_t)a3 resultHandler:(id)a4;
- (void)countCalendarItemsWithResultHandler:(id)a3;
- (void)fetchOfficeHoursWithCompletion:(id)a3 onQueue:(id)a4;
- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3;
- (void)setAllowsEvents:(BOOL)a3;
- (void)setAllowsPrivateEventAccessByDelegate:(BOOL)a3;
- (void)setAllowsProposeNewTime:(BOOL)a3;
- (void)setAllowsTasks:(BOOL)a3;
- (void)setAppGroupIdentifier:(id)a3;
- (void)setCachedExternalInfo:(id)a3;
- (void)setCachedExternalInfoData:(id)a3;
- (void)setConstraintsName:(id)a3;
- (void)setCreatorBundleID:(id)a3;
- (void)setCreatorCodeSigningIdentity:(id)a3;
- (void)setDefaultAlarmOffset:(id)a3;
- (void)setDefaultAllDayAlarmOffset:(id)a3;
- (void)setDelegatedAccountOwnerStoreID:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setDoesSyncDefaultAlarmsToServer:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setFlag2:(int)a3 value:(BOOL)a4;
- (void)setFlag:(int)a3 value:(BOOL)a4;
- (void)setFlags2:(int)a3;
- (void)setFlags:(int)a3;
- (void)setIsFacebook:(BOOL)a3;
- (void)setIsInMainWindow:(BOOL)a3;
- (void)setIsInSeparateWindow:(BOOL)a3;
- (void)setLastSyncEndDate:(id)a3;
- (void)setLastSyncError:(unint64_t)a3 userInfo:(id)a4;
- (void)setLastSyncStartDate:(id)a3;
- (void)setNotes:(id)a3;
- (void)setOfficeHours:(id)a3 withCompletion:(id)a4 onQueue:(id)a5;
- (void)setOnlyCreatorCanModify:(BOOL)a3;
- (void)setOwnerName:(id)a3;
- (void)setPendingPersonaIdentifierForNewSource:(id)a3;
- (void)setPreferredEventPrivateValue:(int64_t)a3;
- (void)setPreferredEventPrivateValueRaw:(int)a3;
- (void)setProhibitsDetachmentOnCommentChange:(BOOL)a3;
- (void)setProhibitsICSImport:(BOOL)a3;
- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3;
- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3;
- (void)setProhibitsPrivateEventsWithAttendees:(BOOL)a3;
- (void)setProhibitsSlicingEventsWithAttendees:(BOOL)a3;
- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRequiresOccurrencesConformToRecurrenceRule:(BOOL)a3;
- (void)setRequiresSamePrivacyLevelAcrossRecurrenceSeries:(BOOL)a3;
- (void)setShowsNotifications:(BOOL)a3;
- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3;
- (void)setSourceTypeRaw:(int64_t)a3;
- (void)setStrictestEventPrivateValue:(int64_t)a3;
- (void)setStrictestEventPrivateValueRaw:(int)a3;
- (void)setSupportsAlarmAcknowledgedDate:(BOOL)a3;
- (void)setSupportsAttachments:(BOOL)a3;
- (void)setSupportsAvailabilityRequests:(BOOL)a3;
- (void)setSupportsClearingPrivateComments:(BOOL)a3;
- (void)setSupportsDelegateEnumeration:(BOOL)a3;
- (void)setSupportsDelegation:(BOOL)a3;
- (void)setSupportsEventForwarding:(BOOL)a3;
- (void)setSupportsIgnoringEventsInAvailabilityRequests:(BOOL)a3;
- (void)setSupportsInvitationModificationsWithoutNotification:(BOOL)a3;
- (void)setSupportsLocationDirectorySearches:(BOOL)a3;
- (void)setSupportsPrivateEvents:(BOOL)a3;
- (void)setSupportsPush:(BOOL)a3;
- (void)setSupportsSharedCalendars:(BOOL)a3;
- (void)setSupportsTravelTime:(BOOL)a3;
- (void)setSyncError:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUsesSelfAttendee:(BOOL)a3;
- (void)setWasMigrated:(BOOL)a3;
@end

@implementation EKSource

- (int64_t)sourceTypeRaw
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573C8]];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void).cxx_destruct
{
}

- (id)UUID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (BOOL)isWritable
{
  return ![(EKSource *)self readOnly]
      && ([(EKSource *)self managedConfigurationAccountAccess] & 0xFFFFFFFD) != 1;
}

- (BOOL)allowsEvents
{
  return ![(EKSource *)self flag:2];
}

- (BOOL)flag:(int)a3
{
  return ([(EKSource *)self flags] & a3) != 0;
}

- (int)flags
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57370]];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)readOnly
{
  return [(EKSource *)self flag:0x80000000];
}

- (int)managedConfigurationAccountAccess
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57390]];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)isDelegate
{
  v2 = [(EKSource *)self delegatedAccountOwnerStoreID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)delegatedAccountOwnerStoreID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57350]];
}

- (unint64_t)lastSyncError
{
  v2 = [(EKSource *)self syncError];
  BOOL v3 = v2;
  if (v2)
  {
    if ([v2 errorType]) {
      unint64_t v4 = 1;
    }
    else {
      unint64_t v4 = [v3 errorCode];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (EKSyncError)syncError
{
  return (EKSyncError *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F573D8]];
}

- (BOOL)isSyncing
{
  BOOL v3 = [(EKSource *)self lastSyncStartDate];
  uint64_t v4 = [(EKSource *)self lastSyncEndDate];
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      char v6 = 1;
      goto LABEL_7;
    }
    if (([v3 isEqualToDate:v4] & 1) == 0)
    {
      v7 = [v3 laterDate:v5];
      char v6 = [v7 isEqualToDate:v3];

      goto LABEL_7;
    }
  }
  char v6 = 0;
LABEL_7:

  return v6;
}

- (NSDate)lastSyncStartDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57388]];
}

- (NSDate)lastSyncEndDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57380]];
}

- (REMObjectID)remAccountObjectID
{
  BOOL v3 = [(EKObject *)self backingObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v3;
  char v6 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    v7 = [(EKObject *)self eventStore];
    v8 = [v7 reminderSourceForEventSource:v5];

    char v6 = [v8 backingObject];
  }
  v9 = [v6 remObjectID];

  return (REMObjectID *)v9;
}

- (NSString)externalID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57158]];
}

- (NSString)personaIdentifier
{
  BOOL v3 = [(EKObject *)self objectID];
  if (([v3 isTemporary] & 1) == 0)
  {
    id v6 = [(EKObject *)self eventStore];
    uint64_t v4 = objc_msgSend(v6, "personaIdentifierForDatabaseID:", objc_msgSend(v3, "databaseID"));
    goto LABEL_6;
  }
  uint64_t v4 = [(EKSource *)self pendingPersonaIdentifierForNewSource];
  if (v4) {
    goto LABEL_7;
  }
  if ((unint64_t)([(EKSource *)self sourceTypeRaw] - 1) <= 1)
  {
    id v5 = [(EKSource *)self externalID];
    id v6 = [MEMORY[0x1E4F57658] personaIdentifierForAccountIdentifier:v5];

    uint64_t v4 = v6;
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_7:

  return (NSString *)v4;
}

- (NSString)title
{
  if ([(EKSource *)self isFacebookSource])
  {
    BOOL v3 = @"CalDAV";
  }
  else
  {
    uint64_t v4 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573E0]];
    BOOL v3 = v4;
    if (v4 && [(__CFString *)v4 isEqualToString:@"VIRTUAL_APP_SOURCE_NAME"])
    {
      id v5 = [(id)objc_opt_class() _eventKitBundle];
      uint64_t v6 = [v5 localizedStringForKey:@"virtual source name" value:@"Account" table:0];

      BOOL v3 = (__CFString *)v6;
    }
  }

  return (NSString *)v3;
}

- (BOOL)isFacebookSource
{
  return [(EKSource *)self flag:64];
}

- (NSSet)calendarsForEntityType:(EKEntityType)entityType
{
  id v5 = [(EKObject *)self eventStore];
  uint64_t v6 = [v5 calendarsForEntityType:entityType inSource:self];

  return (NSSet *)v6;
}

- (BOOL)hasOwnerEmailAddress
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(EKSource *)self ownerAddresses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 hasMailto] & 1) != 0 || (objc_msgSend(v7, "resemblesEmailAddress"))
        {
          BOOL v8 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isWeakRelationship
{
  return 1;
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_5 != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_5, &__block_literal_global_68);
  }
  v2 = (void *)knownRelationshipSingleValueKeys_keys_5;

  return v2;
}

void __44__EKSource_knownRelationshipSingleValueKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F573D8];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownRelationshipSingleValueKeys_keys_5;
  knownRelationshipSingleValueKeys_keys_5 = v0;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_10 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_10, &__block_literal_global_13_1);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_10;

  return v2;
}

void __42__EKSource_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_10;
  knownIdentityKeysForComparison_keys_10 = v0;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_9 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_9, &__block_literal_global_15_0);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_9;

  return v2;
}

void __45__EKSource_knownSingleValueKeysForComparison__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57398];
  v3[0] = *MEMORY[0x1E4F573E0];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)knownSingleValueKeysForComparison_keys_9;
  knownSingleValueKeysForComparison_keys_9 = v1;
}

+ (EKSource)sourceWithEventStore:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKSource sourceWithEventStore:](v5);
    }
  }
  uint64_t v6 = objc_alloc_init(EKPersistentSource);
  [v4 _registerObject:v6];
  v7 = (void *)[objc_alloc((Class)a1) initWithPersistentObject:v6];
  BOOL v8 = EKUUIDString();
  [v7 setSourceIdentifier:v8];

  return (EKSource *)v7;
}

- (void)setSourceTypeRaw:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F573C8]];
}

+ (int)_ekPrivacyLevelToCalEventPrivacyLevel:(int64_t)a3
{
  int v3 = a3;
  if ((unint64_t)a3 >= 4)
  {
    id v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKSource _ekPrivacyLevelToCalEventPrivacyLevel:](v3, v4);
    }
    return 0;
  }
  return v3;
}

+ (int64_t)_calEventPrivacyLevelToEKPrivacyLevel:(int)a3
{
  if (a3 < 4) {
    return a3;
  }
  uint64_t v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKSource _calEventPrivacyLevelToEKPrivacyLevel:](a3, v5);
  }
  return 0;
}

- (int)preferredEventPrivateValueRaw
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573B8]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setPreferredEventPrivateValueRaw:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F573B8]];
}

- (int64_t)preferredEventPrivateValue
{
  uint64_t v2 = [(EKSource *)self preferredEventPrivateValueRaw];
  int v3 = objc_opt_class();

  return [v3 _calEventPrivacyLevelToEKPrivacyLevel:v2];
}

- (void)setPreferredEventPrivateValue:(int64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() _ekPrivacyLevelToCalEventPrivacyLevel:a3];

  [(EKSource *)self setPreferredEventPrivateValueRaw:v4];
}

- (int)strictestEventPrivateValueRaw
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573D0]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setStrictestEventPrivateValueRaw:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F573D0]];
}

- (int64_t)strictestEventPrivateValue
{
  uint64_t v2 = [(EKSource *)self strictestEventPrivateValueRaw];
  int v3 = objc_opt_class();

  return [v3 _calEventPrivacyLevelToEKPrivacyLevel:v2];
}

- (void)setStrictestEventPrivateValue:(int64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() _ekPrivacyLevelToCalEventPrivacyLevel:a3];

  [(EKSource *)self setStrictestEventPrivateValueRaw:v4];
}

+ (id)_eventKitBundle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EKSource__eventKitBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_eventKitBundle_onceToken_0 != -1) {
    dispatch_once(&_eventKitBundle_onceToken_0, block);
  }
  uint64_t v2 = (void *)_eventKitBundle_bundle_0;

  return v2;
}

uint64_t __27__EKSource__eventKitBundle__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v2 = _eventKitBundle_bundle_0;
  _eventKitBundle_bundle_0 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)setTitle:(id)a3
{
}

- (NSString)notes
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57398]];
}

- (void)setNotes:(id)a3
{
}

- (NSNumber)defaultAlarmOffset
{
  return (NSNumber *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57340]];
}

- (void)setDefaultAlarmOffset:(id)a3
{
}

- (NSNumber)defaultAllDayAlarmOffset
{
  return (NSNumber *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57348]];
}

- (void)setDefaultAllDayAlarmOffset:(id)a3
{
}

- (void)setUUID:(id)a3
{
}

- (void)setExternalID:(id)a3
{
}

- (NSString)constraintsDescriptionPath
{
  uint64_t v2 = [(EKSource *)self constraintsName];
  int v3 = [MEMORY[0x1E4F57678] backwardsCompatibleConstraintsPathForName:v2];

  return (NSString *)v3;
}

- (NSString)constraintsName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57328]];
}

- (void)_setConstraintsNameWithoutValidation:(id)a3
{
}

- (void)setConstraintsName:(id)a3
{
  id v4 = a3;
  if ([v4 isAbsolutePath])
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
      -[EKSource setConstraintsName:]();
    }
  }
  else if ([v4 hasSuffix:@".plist"])
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
      -[EKSource setConstraintsName:]();
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F57678] constraintsURLForName:v4];

    if (!v5 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
      -[EKSource setConstraintsName:]();
    }
  }
  [(EKSource *)self _setConstraintsNameWithoutValidation:v4];
}

- (NSString)externalModificationTag
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57368]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSString)creatorBundleID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57330]];
}

- (void)setCreatorBundleID:(id)a3
{
}

- (NSString)creatorCodeSigningIdentity
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57338]];
}

- (void)setCreatorCodeSigningIdentity:(id)a3
{
}

- (BOOL)onlyCreatorCanModify
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573A0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOnlyCreatorCanModify:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F573A0]];
}

- (NSString)appGroupIdentifier
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57310]];
}

- (void)setAppGroupIdentifier:(id)a3
{
}

- (id)pendingPersonaIdentifierForNewSource
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573B0]];
}

- (void)setPendingPersonaIdentifierForNewSource:(id)a3
{
}

- (void)setFlags:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57370]];
}

- (void)setFlag:(int)a3 value:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = [(EKSource *)self flags] | a3;
  }
  else {
    uint64_t v5 = [(EKSource *)self flags] & ~a3;
  }

  [(EKSource *)self setFlags:v5];
}

- (int)flags2
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57378]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setFlags2:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57378]];
}

- (BOOL)flag2:(int)a3
{
  return ([(EKSource *)self flags2] & a3) != 0;
}

- (void)setFlag2:(int)a3 value:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = [(EKSource *)self flags2] | a3;
  }
  else {
    uint64_t v5 = [(EKSource *)self flags2] & ~a3;
  }

  [(EKSource *)self setFlags2:v5];
}

- (BOOL)isInMainWindow
{
  return [(EKSource *)self flag2:256];
}

- (void)setIsInMainWindow:(BOOL)a3
{
}

- (BOOL)isInSeparateWindow
{
  return [(EKSource *)self flag2:512];
}

- (void)setIsInSeparateWindow:(BOOL)a3
{
}

- (BOOL)doesSyncDefaultAlarmsToServer
{
  return [(EKSource *)self flag2:2048];
}

- (void)setDoesSyncDefaultAlarmsToServer:(BOOL)a3
{
}

- (BOOL)wasMigrated
{
  return [(EKSource *)self flag:8];
}

- (void)setWasMigrated:(BOOL)a3
{
}

- (BOOL)showsNotifications
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573C0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsNotifications:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F573C0]];
}

- (BOOL)usesSelfAttendee
{
  return ![(EKSource *)self flag:128];
}

- (void)setUsesSelfAttendee:(BOOL)a3
{
}

- (BOOL)disabled
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57358]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57358]];
}

- (BOOL)isEnabled
{
  return ![(EKSource *)self disabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)allowsTasks
{
  if ((CalIsReminderBridgeEnabled() & 1) != 0 || (char v3 = 1, [(EKSource *)self flag:1]))
  {
    id v4 = [(EKSource *)self remAccountObjectID];
    BOOL v5 = v4 != 0;

    char v3 = 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if ([(EKSource *)self sourceType] == EKSourceTypeMobileMe || [(EKSource *)self isDelegate]) {
    return 0;
  }
  else {
    return v5 | v3;
  }
}

- (void)setAllowsTasks:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (CalIsReminderBridgeEnabled())
    {
      id v4 = (void *)EKLogHandle;
      uint64_t v5 = 1;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = v4;
        v7 = [(EKSource *)self externalID];
        v8[0] = 67109378;
        v8[1] = 1;
        __int16 v9 = 2114;
        long long v10 = v7;
        _os_log_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_INFO, "Ignoring attempt to set allowsTasks to %d on source %{public}@. Forcing to NO", (uint8_t *)v8, 0x12u);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  [(EKSource *)self setFlag:1 value:v5];
}

- (void)setAllowsEvents:(BOOL)a3
{
}

- (BOOL)allowsCalendarAddDeleteModify
{
  return ![(EKSource *)self flag:4];
}

- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3
{
}

- (BOOL)supportsSharedCalendars
{
  return [(EKSource *)self flag:32];
}

- (void)setSupportsSharedCalendars:(BOOL)a3
{
}

- (BOOL)supportsAlarmAcknowledgedDate
{
  return [(EKSource *)self flag:512];
}

- (void)setSupportsAlarmAcknowledgedDate:(BOOL)a3
{
}

- (BOOL)supportsPrivateEvents
{
  return [(EKSource *)self flag:1024];
}

- (void)setSupportsPrivateEvents:(BOOL)a3
{
}

- (BOOL)prohibitsPrivateEventsWithAttendees
{
  return [(EKSource *)self flag:2048];
}

- (void)setProhibitsPrivateEventsWithAttendees:(BOOL)a3
{
}

- (BOOL)requiresSamePrivacyLevelAcrossRecurrenceSeries
{
  return [(EKSource *)self flag:0x2000];
}

- (void)setRequiresSamePrivacyLevelAcrossRecurrenceSeries:(BOOL)a3
{
}

- (BOOL)supportsAvailabilityRequests
{
  return [(EKSource *)self flag:4096];
}

- (void)setSupportsAvailabilityRequests:(BOOL)a3
{
}

- (BOOL)supportsIgnoringEventsInAvailabilityRequests
{
  return [(EKSource *)self flag:0x80000];
}

- (void)setSupportsIgnoringEventsInAvailabilityRequests:(BOOL)a3
{
}

- (BOOL)supportsLocationDirectorySearches
{
  return [(EKSource *)self flag:0x20000];
}

- (void)setSupportsLocationDirectorySearches:(BOOL)a3
{
}

- (BOOL)allowsProposeNewTime
{
  return [(EKSource *)self flag:0x400000];
}

- (void)setAllowsProposeNewTime:(BOOL)a3
{
}

- (BOOL)prohibitsICSImport
{
  return [(EKSource *)self flag:0x800000];
}

- (void)setProhibitsICSImport:(BOOL)a3
{
}

- (BOOL)prohibitsDetachmentOnCommentChange
{
  return [(EKSource *)self flag:0x40000];
}

- (void)setProhibitsDetachmentOnCommentChange:(BOOL)a3
{
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return [(EKSource *)self flag:0x8000];
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  return [(EKSource *)self flag:0x4000];
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return [(EKSource *)self flag:0x10000];
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
}

- (BOOL)supportsDelegation
{
  return [(EKSource *)self flag:0x20000000];
}

- (void)setSupportsDelegation:(BOOL)a3
{
}

- (BOOL)supportsDelegateEnumeration
{
  return [(EKSource *)self flag:0x40000000];
}

- (void)setSupportsDelegateEnumeration:(BOOL)a3
{
}

- (BOOL)prohibitsSlicingEventsWithAttendees
{
  return [(EKSource *)self flag:0x8000000];
}

- (void)setProhibitsSlicingEventsWithAttendees:(BOOL)a3
{
}

- (BOOL)supportsEventForwarding
{
  return [(EKSource *)self flag:0x200000];
}

- (void)setSupportsEventForwarding:(BOOL)a3
{
}

- (BOOL)requiresOccurrencesConformToRecurrenceRule
{
  return [(EKSource *)self flag:0x100000];
}

- (void)setRequiresOccurrencesConformToRecurrenceRule:(BOOL)a3
{
}

- (BOOL)supportsAttachments
{
  return [(EKSource *)self flag:0x10000000];
}

- (void)setSupportsAttachments:(BOOL)a3
{
}

- (BOOL)supportsClearingPrivateComments
{
  return [(EKSource *)self flag:0x20000];
}

- (void)setSupportsClearingPrivateComments:(BOOL)a3
{
}

- (BOOL)supportsPush
{
  return [(EKSource *)self flag2:0x4000];
}

- (void)setSupportsPush:(BOOL)a3
{
}

- (BOOL)supportsTravelTime
{
  return [(EKSource *)self flag2:0x8000];
}

- (void)setSupportsTravelTime:(BOOL)a3
{
}

- (BOOL)allowsPrivateEventAccessByDelegate
{
  return [(EKSource *)self flag2:0x10000];
}

- (void)setAllowsPrivateEventAccessByDelegate:(BOOL)a3
{
}

- (BOOL)supportsInvitationModificationsWithoutNotification
{
  return [(EKSource *)self flag2:128];
}

- (void)setSupportsInvitationModificationsWithoutNotification:(BOOL)a3
{
}

- (void)setDelegatedAccountOwnerStoreID:(id)a3
{
}

- (NSSet)calendars
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(EKObject *)self eventStore];
  uint64_t v5 = [v4 calendars];

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
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 source];
        int v12 = [v11 isEqual:self];

        if (v12) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (NSSet)allCalendars
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(EKObject *)self eventStore];
  uint64_t v5 = [v4 _allCalendars];

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
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 source];
        int v12 = [v11 isEqual:self];

        if (v12) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (id)calendarWithExternalIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(EKSource *)self allCalendars];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v12 = [v11 externalID];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v5 count] >= 2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKSource calendarWithExternalIdentifier:]();
  }
  long long v14 = [v5 firstObject];

  return v14;
}

- (BOOL)removeCalendarItemsOlderThanDate:(id)a3 entityTypeMask:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4 - 1 >= 3)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithCADResult:1001];
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    uint64_t v9 = dword_1A4F900DC[a4 - 1];
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__21;
    v22 = __Block_byref_object_dispose__21;
    id v23 = 0;
    long long v10 = [(EKObject *)self eventStore];
    uint64_t v11 = [v10 connection];
    int v12 = [v11 CADOperationProxy];
    int v13 = [(EKObject *)self CADObjectID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__EKSource_removeCalendarItemsOlderThanDate_entityTypeMask_error___block_invoke;
    v17[3] = &unk_1E5B96D00;
    v17[4] = &v18;
    [v12 CADRemoveCalendarItemsOlderThanDate:v8 ofType:v9 inSource:v13 reply:v17];

    long long v14 = (void *)v19[5];
    BOOL v15 = v14 == 0;
    if (a5 && v14) {
      *a5 = v14;
    }
    _Block_object_dispose(&v18, 8);
  }
  return v15;
}

uint64_t __66__EKSource_removeCalendarItemsOlderThanDate_entityTypeMask_error___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    uint64_t v4 = *(void *)(*(void *)(v2 + 32) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    return MEMORY[0x1F41817F8](v3, v5);
  }
  return result;
}

- (id)readWriteCalendarsForEntityType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(EKObject *)self eventStore];
  uint64_t v7 = [v6 calendarsForEntityType:a3];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v13 = [v12 source];
        if ([v13 isEqual:self])
        {
          int v14 = [v12 allowsContentModifications];

          if (v14) {
            [v5 addObject:v12];
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (BOOL)supportsCalendarCreation
{
  if ([(EKSource *)self sourceType] == (EKSourceTypeSubscribed|EKSourceTypeCalDAV))
  {
    uint64_t v3 = [(EKObject *)self eventStore];
    char v4 = [v3 allowsIntegrationModifications];
  }
  else
  {
    uint64_t v3 = [(EKSource *)self _constraintsInternal];
    char v4 = [v3 allowsCalendarAddDeleteModify];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)constraintSupportsAvailabilityRequests
{
  uint64_t v2 = [(EKSource *)self _constraintsInternal];
  char v3 = [v2 supportsAvailabilityRequests];

  return v3;
}

- (BOOL)supportsCalendarTaskCreation
{
  BOOL v3 = [(EKSource *)self allowsTasks];
  if (v3)
  {
    LOBYTE(v3) = [(EKSource *)self supportsCalendarCreation];
  }
  return v3;
}

- (void)countCalendarItemsWithResultHandler:(id)a3
{
}

- (void)countCalendarItemsOfType:(unint64_t)a3 resultHandler:(id)a4
{
  if (a3 == 1) {
    unsigned int v4 = 3;
  }
  else {
    unsigned int v4 = 0;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 2;
  }
  [(EKSource *)self _countCalendarItemsOfCalType:v5 resultHandler:a4];
}

- (void)_countCalendarItemsOfCalType:(int)a3 resultHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(EKObject *)self eventStore];
  uint64_t v8 = [v7 connection];
  uint64_t v9 = [v8 CADOperationProxy];
  uint64_t v10 = [(EKObject *)self CADObjectID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__EKSource__countCalendarItemsOfCalType_resultHandler___block_invoke;
  v12[3] = &unk_1E5B994B8;
  id v13 = v6;
  id v11 = v6;
  [v9 CADCountCalendarItemsOfType:v4 inSource:v10 reply:v12];
}

uint64_t __55__EKSource__countCalendarItemsOfCalType_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = v3;
    uint64_t v4 = (*(uint64_t (**)(void))(v4 + 16))();
    uint64_t v3 = v6;
  }

  return MEMORY[0x1F41817F8](v4, v3);
}

- (BOOL)supportsReminderActions
{
  uint64_t v2 = [(EKSource *)self _constraintsInternal];
  char v3 = [v2 supportsReminderActions];

  return v3;
}

- (id)_constraintsInternal
{
  char v3 = [(EKObject *)self eventStore];
  uint64_t v4 = [v3 cachedConstraintsForSource:self];

  return v4;
}

- (EKSourceConstraints)constraints
{
  char v3 = [(EKObject *)self eventStore];
  uint64_t v4 = [v3 cachedConstraintsForSource:self];

  return (EKSourceConstraints *)v4;
}

- (int)displayOrderForNewCalendar
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(EKSource *)self allCalendars];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    int v6 = -1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((int)[v8 displayOrder] > v6) {
          int v6 = [v8 displayOrder];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int v6 = -1;
  }

  return v6 + 1;
}

- (NSString)symbolicColorForNewCalendar
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(EKSource *)self allCalendars];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 symbolicColorName];
        if (v10)
        {
          long long v11 = (void *)v10;
          uint64_t v12 = [v9 type];

          if (v12 != 4)
          {
            long long v13 = [v9 symbolicColorName];
            [v3 addObject:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  int v14 = [MEMORY[0x1E4F57828] symbolicColorForNewCalendarWithExistingSymbolicNames:v3];

  return (NSString *)v14;
}

- (void)fetchOfficeHoursWithCompletion:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EKSource *)self externalID];
  uint64_t v9 = [MEMORY[0x1E4F5E950] sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__EKSource_fetchOfficeHoursWithCompletion_onQueue___block_invoke;
  v11[3] = &unk_1E5B994E0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 fetchOfficeHoursForAccountWithID:v8 queue:v7 completionBlock:v11];
}

void __51__EKSource_fetchOfficeHoursWithCompletion_onQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = [v6 _ekOfficeHoursFromCalDAVOfficeHours:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_ekOfficeHoursFromCalDAVOfficeHours:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
    id v4 = a3;
    uint64_t v5 = [v3 currentCalendar];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__EKSource__ekOfficeHoursFromCalDAVOfficeHours___block_invoke;
    v12[3] = &unk_1E5B99508;
    id v13 = v5;
    id v7 = v6;
    id v14 = v7;
    id v8 = v5;
    [v4 enumerateObjectsUsingBlock:v12];

    uint64_t v9 = v14;
    id v10 = v7;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __48__EKSource__ekOfficeHoursFromCalDAVOfficeHours___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  uint64_t v5 = [v12 startDate];
  uint64_t v6 = [v12 endDate];
  id v7 = (void *)v6;
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) dateFromComponents:v5];
    uint64_t v9 = [v5 timeZone];
    if (v7)
    {
LABEL_3:
      id v10 = [*(id *)(a1 + 32) dateFromComponents:v7];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  id v10 = 0;
LABEL_6:
  long long v11 = -[EKOfficeHour initWithEnabled:weekday:startTime:endTime:timeZone:]([EKOfficeHour alloc], "initWithEnabled:weekday:startTime:endTime:timeZone:", [v12 enabled], a3, v8, v10, v9);
  [*(id *)(a1 + 40) addObject:v11];
}

- (void)setOfficeHours:(id)a3 withCompletion:(id)a4 onQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(EKSource *)self _calDAVOfficeHoursFromEKOfficeHours:a3];
  long long v11 = [(EKSource *)self externalID];
  id v12 = [MEMORY[0x1E4F5E950] sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__EKSource_setOfficeHours_withCompletion_onQueue___block_invoke;
  v14[3] = &unk_1E5B99530;
  id v15 = v8;
  id v13 = v8;
  [v12 setOfficeHours:v10 forAccountWithID:v11 queue:v9 completionBlock:v14];
}

uint64_t __50__EKSource_setOfficeHours_withCompletion_onQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_calDAVOfficeHoursFromEKOfficeHours:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v9 = objc_alloc_init(MEMORY[0x1E4F5E930]);
          objc_msgSend(v9, "setEnabled:", objc_msgSend(v8, "enabled"));
          id v10 = [v8 startTime];
          if (v10)
          {
            long long v11 = [v8 startTime];
            id v12 = [v4 components:608 fromDate:v11];

            id v13 = [v8 timeZone];
            [v12 setTimeZone:v13];
          }
          else
          {
            id v12 = 0;
          }
          id v14 = objc_msgSend(v8, "endTime", v19);
          if (v14)
          {
            id v15 = [v8 endTime];
            long long v16 = [v4 components:608 fromDate:v15];

            long long v17 = [v8 timeZone];
            [v16 setTimeZone:v17];
          }
          else
          {
            long long v16 = 0;
          }
          [v9 setStartDate:v12];
          [v9 setEndDate:v16];
          [v22 addObject:v9];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    id v3 = v19;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)_nsErrorFromSyncError:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = (EKSource *)a4;
  if (v6
    && ([v6 errorType] || objc_msgSend(v6, "errorCode"))
    && ([v6 errorType] != 1 || objc_msgSend(v6, "errorCode")))
  {
    uint64_t v8 = [v6 errorType];
    id v9 = kEKCalendarItemErrorDomain;
    if (!v8) {
      id v9 = kEKAccountErrorDomain;
    }
    id v10 = *v9;
    if (v7) {
      long long v11 = v7;
    }
    else {
      long long v11 = self;
    }
    id v12 = v11;
    id v13 = [v6 userInfo];
    id v14 = +[EKSyncError augmentSyncErrorUserInfo:v13 for:v12];

    id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v10, objc_msgSend(v6, "errorCode"), v14);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (NSError)sourceError
{
  id v3 = [(EKSource *)self syncError];
  id v4 = [(EKSource *)self _nsErrorFromSyncError:v3 event:0];

  return (NSError *)v4;
}

- (NSError)sourceOrEventError
{
  id v3 = [(EKSource *)self sourceError];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(EKObject *)self eventStore];
    id v7 = [v6 eventsWithErrorsPerSourceID];
    uint64_t v8 = [(EKObject *)self objectID];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = [v9 syncError];
      id v5 = [(EKSource *)self _nsErrorFromSyncError:v10 event:v9];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSError *)v5;
}

- (void)setLastSyncError:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  if (a3 || v6)
  {
    id v7 = [[EKSyncError alloc] initWithAccountError:a3 userInfo:v6];
    [(EKSource *)self setSyncError:v7];
  }
  else
  {
    [(EKSource *)self setSyncError:0];
  }
}

- (NSDictionary)lastSyncErrorUserInfo
{
  uint64_t v2 = [(EKSource *)self syncError];
  id v3 = [v2 userInfo];

  return (NSDictionary *)v3;
}

- (void)setSyncError:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F573D8];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKSyncError frozenClass]];
}

- (void)setLastSyncStartDate:(id)a3
{
}

- (void)setLastSyncEndDate:(id)a3
{
}

- (BOOL)syncs
{
  return (unint64_t)([(EKSource *)self sourceType] - 1) < 4;
}

- (int)displayOrder
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57360]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setDisplayOrder:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57360]];
}

- (NSString)ownerName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F573A8]];
}

- (void)setOwnerName:(id)a3
{
}

+ (id)primaryLocalSourceID
{
  return +[EKObjectID objectIDWithEntityType:6 rowID:1 databaseID:*MEMORY[0x1E4F574B8]];
}

- (BOOL)isPrimaryLocalSource
{
  uint64_t v2 = [(EKObject *)self objectID];
  int v3 = [(id)objc_opt_class() primaryLocalSourceID];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (BOOL)isNestedLocalSource
{
  if ([(EKSource *)self sourceType]) {
    return 0;
  }
  else {
    return ![(EKSource *)self isPrimaryLocalSource];
  }
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EKSource *)self sourceIdentifier];
  id v6 = description_kTypeStrings[[(EKSource *)self sourceType]];
  id v7 = [(EKSource *)self title];
  id v8 = [(EKSource *)self externalID];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {UUID = %@; type = %@; title = %@; externalID = %@}",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return v9;
}

- (BOOL)_validateClientCanModifySources:(id *)a3
{
  uint64_t v4 = [(EKObject *)self eventStore];
  char v5 = [v4 clientCanModifySources];

  if (a3 && (v5 & 1) == 0)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:58];
  }
  return v5;
}

- (BOOL)validate:(id *)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (![(EKObject *)self isNew])
  {
    uint64_t v5 = *MEMORY[0x1E4F57348];
    v13[0] = *MEMORY[0x1E4F57340];
    v13[1] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    BOOL v7 = [(EKObject *)self hasUnsavedChangesIgnoreKeys:v6];

    if (!v7) {
      goto LABEL_5;
    }
  }
  BOOL v8 = [(EKSource *)self _validateClientCanModifySources:a3];
  if (v8)
  {
    id v9 = [(EKSource *)self sourceIdentifier];
    uint64_t v10 = [v9 length];

    if (v10)
    {
LABEL_5:
      LOBYTE(v8) = 1;
      return v8;
    }
    if (a3)
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:65];
      LOBYTE(v8) = 0;
      *a3 = v11;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (BOOL)_shouldCopyDefaultAlarmsFromLocalSource
{
  return 0;
}

- (void)_copyInitialDefaultAlarmSettingsIfNeeded
{
  if ([(EKSource *)self _shouldCopyDefaultAlarmsFromLocalSource])
  {
    uint64_t v8 = [(EKSource *)self defaultAlarmOffset];
    uint64_t v3 = [(EKSource *)self defaultAllDayAlarmOffset];
    if (!(v8 | v3))
    {
      uint64_t v4 = [(EKObject *)self eventStore];
      uint64_t v5 = [v4 defaultTimedAlarmOffset];
      [(EKSource *)self setDefaultAlarmOffset:v5];

      id v6 = [(EKObject *)self eventStore];
      BOOL v7 = [v6 defaultAllDayAlarmOffset];
      [(EKSource *)self setDefaultAllDayAlarmOffset:v7];
    }
  }
}

- (BOOL)save:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  uint64_t v4 = *MEMORY[0x1E4F57378];
  v15[0] = *MEMORY[0x1E4F57378];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  if (![(EKObject *)self hasUnsavedChangesInKeys:v5]) {
    goto LABEL_6;
  }
  uint64_t v14 = *MEMORY[0x1E4F57358];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  if ([(EKObject *)self hasUnsavedChangesInKeys:v6])
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL v8 = [(EKSource *)self isDelegate];

  if (v8)
  {
    id v9 = [(EKObject *)self _previousValueForKey:v4];
    __int16 v10 = [v9 intValue];

    BOOL v11 = [(EKSource *)self isInMainWindow];
    BOOL v12 = [(EKSource *)self isInSeparateWindow];
    if (((v10 & 0x100) == 0) == v11 || ((((v10 & 0x200) == 0) ^ v12) & 1) == 0)
    {
      int v13 = v11 || v12;
      if ((v11 || v12) == [(EKSource *)self disabled]) {
        [(EKSource *)self setDisabled:v13 ^ 1u];
      }
    }
  }
LABEL_7:
  [(EKSource *)self _copyInitialDefaultAlarmSettingsIfNeeded];
  [(EKObject *)self insertPersistentObjectIfNeeded];
  [(EKObject *)self updatePersistentObject];
  return 1;
}

- (BOOL)remove:(id *)a3
{
  if (!-[EKSource _validateClientCanModifySources:](self, "_validateClientCanModifySources:")) {
    goto LABEL_5;
  }
  if ([(EKSource *)self isPrimaryLocalSource])
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:59];
      char v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v5 & 1;
    }
LABEL_5:
    char v5 = 0;
    return v5 & 1;
  }
  id v6 = [(EKObject *)self backingObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:68];
    }
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    [(EKObject *)self deletePersistentObject];
  }
  char v5 = isKindOfClass ^ 1;

  return v5 & 1;
}

- (BOOL)wantsCommentPromptWhenDeclining
{
  return [(EKSource *)self sourceType] == EKSourceTypeExchange;
}

- (id)availabilityCache
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_availabilityCache)
  {
    uint64_t v3 = [[EKAvailabilityCache alloc] initWithSource:v2];
    availabilityCache = v2->_availabilityCache;
    v2->_availabilityCache = v3;
  }
  objc_sync_exit(v2);

  char v5 = v2->_availabilityCache;

  return v5;
}

- (id)cachedExternalInfoData
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57318]];
}

- (void)setCachedExternalInfoData:(id)a3
{
}

- (NSDictionary)cachedExternalInfo
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__EKSource_cachedExternalInfo__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  uint64_t v2 = [(EKObject *)self cachedValueForKey:@"cachedExternalInfoDictionary" populateBlock:v4];

  return (NSDictionary *)v2;
}

id __30__EKSource_cachedExternalInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedExternalInfoData];
  if (!v2)
  {
    char v5 = 0;
    goto LABEL_12;
  }
  id v8 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:&v8];
  id v4 = v8;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __32__EKCalendar_cachedExternalInfo__block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __32__EKCalendar_cachedExternalInfo__block_invoke_cold_2(v6);
    }
LABEL_10:
    char v5 = 0;
    goto LABEL_11;
  }
  char v5 = [*(id *)(a1 + 32) _convertTypeOfOwnerAddresses:v3 toSet:1];
LABEL_11:

LABEL_12:

  return v5;
}

- (void)setCachedExternalInfo:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_5;
  }
  char v5 = (void *)MEMORY[0x1E4F28F98];
  id v6 = [(EKSource *)self _convertTypeOfOwnerAddresses:v4 toSet:0];
  id v10 = 0;
  uint64_t v7 = [v5 dataWithPropertyList:v6 format:200 options:0 error:&v10];
  id v8 = v10;

  if (v7)
  {

    id v8 = (id)v7;
LABEL_5:
    id v9 = [(EKSource *)self _convertTypeOfOwnerAddresses:v4 toSet:1];
    [(EKObject *)self setCachedValue:v9 forKey:@"cachedExternalInfoDictionary"];

    [(EKSource *)self setCachedExternalInfoData:v8];
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKCalendar setCachedExternalInfo:]();
  }
LABEL_8:
}

- (id)_convertTypeOfOwnerAddresses:(id)a3 toSet:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F572F0];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F572F0]];
  if (v7)
  {
    id v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() ^ v4))
    {
      if (v4) {
        [MEMORY[0x1E4F1CAD0] setWithArray:v8];
      }
      else {
      id v10 = [v8 allObjects];
      }

      id v9 = (void *)[v5 mutableCopy];
      [v9 setObject:v10 forKeyedSubscript:v6];
    }
    else
    {
      id v9 = (void *)[v5 copy];
    }
  }
  else
  {
    id v9 = (void *)[v5 copy];
  }

  return v9;
}

- (void)_resetInternalStateWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKObject *)self clearCachedValueForKey:@"cachedExternalInfoDictionary"];
  v5.receiver = self;
  v5.super_class = (Class)EKSource;
  [(EKObject *)&v5 _resetInternalStateWithForce:v3];
}

- (NSURL)serverURL
{
  BOOL v3 = [(EKSource *)self serverHost];
  if (v3)
  {
    int64_t v4 = [(EKSource *)self serverPort];
    BOOL v5 = [(EKSource *)self serverUsesSSL];
    id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v6 setHost:v3];
    uint64_t v7 = 80;
    if (v5) {
      uint64_t v7 = 443;
    }
    if (v4 != v7)
    {
      id v8 = [NSNumber numberWithInteger:v4];
      [v6 setPort:v8];
    }
    if (v5) {
      id v9 = @"https";
    }
    else {
      id v9 = @"http";
    }
    [v6 setScheme:v9];
    id v10 = [v6 URL];
  }
  else
  {
    id v10 = 0;
  }

  return (NSURL *)v10;
}

- (id)externalInfoForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKSource *)self cachedExternalInfo];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSString)serverHost
{
  return (NSString *)[(EKSource *)self externalInfoForKey:*MEMORY[0x1E4F572E0]];
}

- (int64_t)serverPort
{
  uint64_t v2 = [(EKSource *)self externalInfoForKey:*MEMORY[0x1E4F572F8]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)serverUsesSSL
{
  uint64_t v2 = [(EKSource *)self externalInfoForKey:*MEMORY[0x1E4F57308]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSSet)ownerAddresses
{
  return (NSSet *)[(EKSource *)self externalInfoForKey:*MEMORY[0x1E4F572F0]];
}

- (NSString)preferredOwnerAddress
{
  return (NSString *)[(EKSource *)self externalInfoForKey:*MEMORY[0x1E4F57300]];
}

- (BOOL)isPrimaryAppleAccount
{
  uint64_t v2 = [(EKSource *)self externalInfoForKey:*MEMORY[0x1E4F572E8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isReadable
{
  return ([(EKSource *)self managedConfigurationAccountAccess] & 0xFFFFFFFE) != 2;
}

- (void)setReadOnly:(BOOL)a3
{
}

- (BOOL)supportsEventCalendarCreation
{
  BOOL v3 = [(EKSource *)self supportsCalendarCreation];
  if (v3)
  {
    LOBYTE(v3) = [(EKSource *)self allowsEvents];
  }
  return v3;
}

- (BOOL)refresh
{
  if ([(EKObject *)self isNew]) {
    return 1;
  }

  return [(EKObject *)self _refreshCommon];
}

- (BOOL)_reset
{
  BOOL v3 = [(EKObject *)self eventStore];
  id v4 = [(EKSource *)self sourceIdentifier];
  BOOL v5 = [v3 sourceWithIdentifier:v4];

  if (v5)
  {
    id v6 = [v5 backingObject];
    [(EKObject *)self _resetWithFrozenObject:v6];
  }
  return v5 != 0;
}

- (BOOL)supportsTaskCalendarCreation
{
  return self->_supportsTaskCalendarCreation;
}

- (BOOL)isFacebook
{
  return self->_isFacebook;
}

- (void)setIsFacebook:(BOOL)a3
{
  self->_isFacebook = a3;
}

- (BOOL)snoozeAlarmRequiresDetach
{
  return self->_snoozeAlarmRequiresDetach;
}

- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3
{
  self->_snoozeAlarmRequiresDetach = a3;
}

- (BOOL)supportsAvailability
{
  return self->_supportsAvailability;
}

+ (void)sourceWithEventStore:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "API MISUSE: nil event store used in initialization of EKSource instance", v1, 2u);
}

+ (void)_ekPrivacyLevelToCalEventPrivacyLevel:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Unexpected EKPrivacyLevel: %d", (uint8_t *)v2, 8u);
}

+ (void)_calEventPrivacyLevelToEKPrivacyLevel:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Unexpected CalEventPrivacyLevel: %d", (uint8_t *)v2, 8u);
}

- (void)setConstraintsName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8(&dword_1A4E47000, v0, v1, "Attempting to set a path (%{public}@) with -[EKSource setConstraintsName:]. Only the name should be supplied without an extension.", v2, v3, v4, v5, v6);
}

- (void)setConstraintsName:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8(&dword_1A4E47000, v0, v1, "Attempting to set a file name with .plist extension (%{public}@) with -[EKSource setConstraintsName:]. Only the name should be supplied without an extension.", v2, v3, v4, v5, v6);
}

- (void)setConstraintsName:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8(&dword_1A4E47000, v0, v1, "Attempting to set an unrecognized constraints name (%{public}@) with -[EKSource setConstraintsName:]. The given name should be a valid .plist resource in CalendarFoundation.", v2, v3, v4, v5, v6);
}

- (void)calendarWithExternalIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Source has more than one calendar with the same external Id: %@", v2, v3, v4, v5, v6);
}

@end