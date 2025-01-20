@interface EKCalendarItem
+ (BOOL)_shouldDeleteAndAddForMoveFromCalendar:(id)a3 toCalendar:(id)a4;
+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7;
+ (id)EKObjectChangeSummarizer_multiValueDiffKeys;
+ (id)EKObjectChangeSummarizer_singleValueDiffKeys;
+ (id)adjustDateFromUTC:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5;
+ (id)defaultPropertyKeysToSkipForRecursiveSnapshotCopies;
+ (id)keysToIgnoreForApplyingChanges;
+ (id)knownDerivedRelationshipKeys;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipMultiValueKeys;
+ (id)knownRelationshipMultiValueKeysForValidation;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownRelationshipSingleValueKeysForValidation;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
+ (id)preferredLocationWithClientLocation:(id)a3 structuredLocation:(id)a4;
+ (id)specialComparisonBlocks;
+ (id)timeZoneFromTimeZoneName:(id)a3 withFloatingTimeZone:(id)a4;
+ (id)timeZoneNameFromTimeZone:(id)a3;
- (BOOL)_excludeAlarmDueToConnectionTrigger:(id)a3;
- (BOOL)_hadAttendees;
- (BOOL)_hadRecurrenceRules;
- (BOOL)_isInSharedToMeCalendarWithNoSharingScheduling;
- (BOOL)_validateDeletable:(id *)a3;
- (BOOL)_validateDeletableBySharedCalendarShareeWithError:(id *)a3;
- (BOOL)_validateDeletableDueToAccessConsent:(id *)a3;
- (BOOL)_validateDeletableInCalendarWithError:(id *)a3;
- (BOOL)allowsAlarmModifications;
- (BOOL)allowsAttendeesModifications;
- (BOOL)allowsCalendarModifications;
- (BOOL)allowsSpansOtherThanThisEvent;
- (BOOL)canMoveToCalendar:(id)a3 error:(id *)a4;
- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5;
- (BOOL)defaultAlarmWasDeleted;
- (BOOL)hasAlarms;
- (BOOL)hasAttachment;
- (BOOL)hasAttendees;
- (BOOL)hasCalendarChangeThatRequiresDeleteAndAdd;
- (BOOL)hasComplexRecurrence;
- (BOOL)hasNotes;
- (BOOL)hasRecurrenceRuleAdditionOrRemoval;
- (BOOL)hasRecurrenceRules;
- (BOOL)isAlarmAcknowledgedPropertyDirty;
- (BOOL)isAllDay;
- (BOOL)isDeletable;
- (BOOL)isEditable;
- (BOOL)isExternallyOrganizedInvitation;
- (BOOL)isFloating;
- (BOOL)isNewItemThatFailedToPut;
- (BOOL)isOnlyAlarmAcknowledgedPropertyDirty;
- (BOOL)isOrganizedBySharedCalendarOwner;
- (BOOL)isSelfOrganized;
- (BOOL)isSelfOrganizedInvitation;
- (BOOL)needsResponse;
- (BOOL)requiresDetach;
- (BOOL)shouldHaveDefaultAlarms;
- (BOOL)shouldLoadRelationshipForValidation:(id)a3;
- (BOOL)suppressNotificationForChanges;
- (BOOL)validate:(id *)a3;
- (EKCalendar)calendar;
- (EKCalendarItem)originalItem;
- (NSArray)alarms;
- (NSArray)attachments;
- (NSArray)attendees;
- (NSArray)recurrenceRules;
- (NSData)localStructuredData;
- (NSData)structuredData;
- (NSDate)creationDate;
- (NSDate)lastModifiedDate;
- (NSString)calendarItemExternalIdentifier;
- (NSString)calendarItemIdentifier;
- (NSString)location;
- (NSString)notes;
- (NSURL)URL;
- (id)URLString;
- (id)_customObjectForKey:(id)a3 local:(BOOL)a4;
- (id)_dataFromStructuredDataDictionary:(id)a3 local:(BOOL)a4;
- (id)_generateNewUniqueID;
- (id)_selfAttendee;
- (id)_structuredDataDictionaryFromData:(id)a3 local:(BOOL)a4;
- (id)action;
- (id)actionString;
- (id)adjustDateFromUTC:(id)a3;
- (id)allAlarms;
- (id)allAlarmsSet;
- (id)appLink;
- (id)attachmentsSet;
- (id)attendeeMatchingEmailAddress:(id)a3;
- (id)attendeesRaw;
- (id)calendarScale;
- (id)clientLocation;
- (id)committedConstraints;
- (id)constraints;
- (id)customObjectForKey:(id)a3;
- (id)defaultAlarm;
- (id)defaultAlarms;
- (id)description;
- (id)detachedItems;
- (id)ekExceptionDates;
- (id)endTimeZone;
- (id)endTimeZoneName;
- (id)exceptionDates;
- (id)exceptionDatesAdjustedForFloatingEvents;
- (id)exportToICS;
- (id)exportToICSWithOptions:(unint64_t)a3;
- (id)externalData;
- (id)externalID;
- (id)externalModificationTag;
- (id)externalScheduleID;
- (id)externalURI;
- (id)filterAttendeesPendingDeletion:(id)a3;
- (id)findOriginalAlarmStartingWith:(id)a3;
- (id)localCustomObjectForKey:(id)a3;
- (id)localUID;
- (id)organizer;
- (id)participantMatchingContact:(id)a3;
- (id)preferredLocation;
- (id)propertiesThatCanBeModifiedOnReadOnlyCalendars;
- (id)recurrenceRuleString;
- (id)recurrenceRulesSet;
- selfAttendee;
- (id)sharedItemCreatedByAddress;
- (id)sharedItemCreatedByAddressString;
- (id)sharedItemCreatedByDisplayName;
- (id)sharedItemCreatedByFirstName;
- (id)sharedItemCreatedByLastName;
- (id)sharedItemCreatedDate;
- (id)sharedItemCreatedTimeZone;
- (id)sharedItemCreatedTimeZoneName;
- (id)sharedItemModifiedByAddress;
- (id)sharedItemModifiedByAddressString;
- (id)sharedItemModifiedByDisplayName;
- (id)sharedItemModifiedByFirstName;
- (id)sharedItemModifiedByLastName;
- (id)sharedItemModifiedDate;
- (id)sharedItemModifiedTimeZone;
- (id)sharedItemModifiedTimeZoneName;
- (id)singleRecurrenceRule;
- (id)sortedAlarms;
- (id)startDateForRecurrence;
- (id)startDateRaw;
- (id)startTimeZone;
- (id)startTimeZoneName;
- (id)structuredLocationWithoutPrediction;
- (id)syncError;
- (id)travelStartLocation;
- (id)uniqueID;
- (id)uniqueId;
- (id)unlocalizedTitle;
- (int)selfParticipantStatusRaw;
- (int)sequenceNumber;
- (int64_t)indexForAlarm:(id)a3;
- (int64_t)selfParticipantStatus;
- (unint64_t)actionsState;
- (unint64_t)entityType;
- (unint64_t)priority;
- (unsigned)modifiedProperties;
- (void)_addExceptionDate:(id)a3;
- (void)_addOrganizerAndSelfAttendeeForNewInvitationInCalendar:(id)a3;
- (void)_deletePersistentItemAndDetachedItems:(id)a3 forSavingItem:(id)a4;
- (void)_deleteSelfAndDetached;
- (void)_moveToCalendar:(id)a3 forSavingItem:(id)a4;
- (void)_recursivelyPerformBlockOnSelfAndDetachedItems:(id)a3 forSavingItem:(id)a4;
- (void)_removeAttendee:(id)a3;
- (void)_removeDetachedItem:(id)a3;
- (void)_removeExceptionDate:(id)a3;
- (void)_resetFieldsAfterMovingToNewCalendar;
- (void)_setCalendarRecursively:(id)a3 forSavingItem:(id)a4;
- (void)_setCustomObject:(id)a3 forKey:(id)a4 local:(BOOL)a5;
- (void)_setSelfAttendee:(id)a3;
- (void)_updateModifiedAlarmByAcknowledging;
- (void)_updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:(id)a3;
- (void)_willSave;
- (void)addAlarm:(EKAlarm *)alarm;
- (void)addAttachment:(id)a3;
- (void)addAttendee:(id)a3;
- (void)addOrganizerAndSelfAttendeeForNewInvitation;
- (void)addRecurrenceRule:(EKRecurrenceRule *)rule;
- (void)moveToCalendar:(id)a3;
- (void)pinRecurrenceRuleToEndsOfFreqency;
- (void)removeAcknowledgedSnoozedAlarms;
- (void)removeAlarm:(EKAlarm *)alarm;
- (void)removeAllSnoozedAlarms;
- (void)removeAttachment:(id)a3;
- (void)removeAttendee:(id)a3;
- (void)removeLastExtraneousOrganizerAndSelfAttendee;
- (void)removeRecurrenceRule:(EKRecurrenceRule *)rule;
- (void)selfAttendee;
- (void)setAction:(id)a3;
- (void)setActionString:(id)a3;
- (void)setAlarms:(NSArray *)alarms;
- (void)setAllAlarms:(id)a3;
- (void)setAllAlarmsSet:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setAttachments:(id)a3;
- (void)setAttachmentsSet:(id)a3;
- (void)setAttendees:(id)a3;
- (void)setAttendeesRaw:(id)a3;
- (void)setCalendar:(EKCalendar *)calendar;
- (void)setCalendarItemIdentifier:(id)a3;
- (void)setCalendarScale:(id)a3;
- (void)setClientLocation:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCustomObject:(id)a3 forKey:(id)a4;
- (void)setDefaultAlarmWasDeleted:(BOOL)a3;
- (void)setDetachedItems:(id)a3;
- (void)setEkExceptionDates:(id)a3;
- (void)setEndTimeZone:(id)a3;
- (void)setEndTimeZoneName:(id)a3;
- (void)setExceptionDates:(id)a3;
- (void)setExternalData:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalScheduleID:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setLocalCustomObject:(id)a3 forKey:(id)a4;
- (void)setLocalStructuredData:(id)a3;
- (void)setLocation:(NSString *)location;
- (void)setModifiedProperties:(unsigned int)a3;
- (void)setNotes:(NSString *)notes;
- (void)setOrganizer:(id)a3;
- (void)setOriginalItem:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRecurrenceRules:(NSArray *)recurrenceRules;
- (void)setRecurrenceRulesSet:(id)a3;
- (void)setSelfAttendee:(id)a3;
- (void)setSequenceNumber:(int)a3;
- (void)setSharedItemCreatedByAddress:(id)a3;
- (void)setSharedItemCreatedByAddressString:(id)a3;
- (void)setSharedItemCreatedByDisplayName:(id)a3;
- (void)setSharedItemCreatedByFirstName:(id)a3;
- (void)setSharedItemCreatedByLastName:(id)a3;
- (void)setSharedItemCreatedDate:(id)a3;
- (void)setSharedItemCreatedTimeZone:(id)a3;
- (void)setSharedItemCreatedTimeZoneName:(id)a3;
- (void)setSharedItemModifiedByAddress:(id)a3;
- (void)setSharedItemModifiedByAddressString:(id)a3;
- (void)setSharedItemModifiedByDisplayName:(id)a3;
- (void)setSharedItemModifiedByFirstName:(id)a3;
- (void)setSharedItemModifiedByLastName:(id)a3;
- (void)setSharedItemModifiedDate:(id)a3;
- (void)setSharedItemModifiedTimeZone:(id)a3;
- (void)setSharedItemModifiedTimeZoneName:(id)a3;
- (void)setStartDateRaw:(id)a3;
- (void)setStartTimeZone:(id)a3;
- (void)setStartTimeZoneName:(id)a3;
- (void)setStructuredData:(id)a3;
- (void)setStructuredLocationWithoutPrediction:(id)a3;
- (void)setSuppressNotificationForChanges:(BOOL)a3;
- (void)setSyncError:(id)a3;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setTravelStartLocation:(id)a3;
- (void)setURL:(NSURL *)URL;
- (void)setURLString:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)setUnlocalizedTitle:(id)a3;
- (void)snoozeAlarm:(id)a3 withLocation:(id)a4 proximity:(int64_t)a5;
- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4;
- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5;
- (void)updateWithVCSEntity:(id)a3 inCalendar:(id)a4;
@end

@implementation EKCalendarItem

- (id)startTimeZone
{
  v2 = [(EKCalendarItem *)self startTimeZoneName];
  v3 = [(id)objc_opt_class() timeZoneFromTimeZoneName:v2 withFloatingTimeZone:0];

  return v3;
}

+ (id)timeZoneFromTimeZoneName:(id)a3 withFloatingTimeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && ![v5 isEqualToString:@"_float"])
  {
    EKCachedTimeZoneWithName();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)startTimeZoneName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D08]];
}

- (BOOL)hasAttendees
{
  if ([(EKObject *)self isNew]
    || ![(EKObject *)self isPropertyUnavailable:*MEMORY[0x1E4F56BA8]])
  {
    v3 = [(EKCalendarItem *)self attendees];
    char v4 = [v3 count] != 0;
  }
  else
  {
    v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C20]];
    char v4 = [v3 BOOLValue];
  }

  return v4;
}

- (NSArray)attendees
{
  v3 = [(EKCalendarItem *)self attendeesRaw];
  char v4 = [(EKCalendarItem *)self filterAttendeesPendingDeletion:v3];

  return (NSArray *)v4;
}

- (id)filterAttendeesPendingDeletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "participantStatus", (void)v12) != -1) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)attendeesRaw
{
  uint64_t v3 = *MEMORY[0x1E4F56BA8];
  char v4 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:*MEMORY[0x1E4F56BA8]];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [(EKObject *)self cachedMeltedObjectForSingleValueKey:*MEMORY[0x1E4F56C88]];
    uint64_t v7 = [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:v3];
    uint64_t v8 = v7;
    if (v6)
    {
      v9 = (void *)[v7 mutableCopy];
      [v9 removeObject:v6];
      [v9 addObject:v6];
      uint64_t v10 = [v9 copy];

      [(EKObject *)self setCachedMeltedObjects:v10 forMultiValueKey:v3];
      uint64_t v8 = (void *)v10;
    }
    id v5 = v8;
  }

  return v5;
}

- (id)unlocalizedTitle
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D40]];
}

- (BOOL)hasRecurrenceRules
{
  if ([(EKObject *)self isNew]
    || ![(EKObject *)self isPropertyUnavailable:*MEMORY[0x1E4F56C80]])
  {
    uint64_t v3 = [(EKCalendarItem *)self recurrenceRules];
    char v4 = [v3 count] != 0;
  }
  else
  {
    uint64_t v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C30]];
    char v4 = [v3 BOOLValue];
  }

  return v4;
}

- (EKCalendarItem)originalItem
{
  return (EKCalendarItem *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56C68]];
}

- (id)preferredLocation
{
  uint64_t v3 = objc_opt_class();
  char v4 = [(EKCalendarItem *)self clientLocation];
  id v5 = [(EKCalendarItem *)self structuredLocation];
  uint64_t v6 = [v3 preferredLocationWithClientLocation:v4 structuredLocation:v5];

  return v6;
}

- (id)clientLocation
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56BC0]];
}

- (id)structuredLocationWithoutPrediction
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56D10]];
}

+ (id)preferredLocationWithClientLocation:(id)a3 structuredLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v5) {
    id v5 = v6;
  }

  return v5;
}

- (id)travelStartLocation
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56D30]];
}

- (BOOL)hasAttachment
{
  v2 = [(EKCalendarItem *)self attachments];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)attachments
{
  v2 = [(EKCalendarItem *)self attachmentsSet];
  if ([v2 count])
  {
    BOOL v3 = [v2 allObjects];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSArray *)v3;
}

- (id)attachmentsSet
{
  return [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56BA0]];
}

+ (id)knownDerivedRelationshipKeys
{
  if (knownDerivedRelationshipKeys_onceToken != -1) {
    dispatch_once(&knownDerivedRelationshipKeys_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)knownDerivedRelationshipKeys_keys;

  return v2;
}

- (NSString)location
{
  BOOL v3 = [(EKCalendarItem *)self preferredLocation];

  if (v3)
  {
    char v4 = [(EKCalendarItem *)self preferredLocation];
    id v5 = [v4 title];

    id v6 = [(EKCalendarItem *)self preferredLocation];
    uint64_t v7 = [v6 address];

    uint64_t v8 = [MEMORY[0x1E4F57740] fullDisplayStringWithTitle:v5 address:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSString *)v8;
}

- (id)uniqueID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D38]];
}

- (EKCalendar)calendar
{
  return (EKCalendar *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56BB0]];
}

- (id)endTimeZone
{
  v2 = [(EKCalendarItem *)self endTimeZoneName];
  BOOL v3 = [(id)objc_opt_class() timeZoneFromTimeZoneName:v2 withFloatingTimeZone:0];

  return v3;
}

- (id)endTimeZoneName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56BF0]];
}

- (id)localUID
{
  uint64_t v3 = [(EKCalendarItem *)self originalItem];
  char v4 = (void *)v3;
  if (v3) {
    id v5 = (EKCalendarItem *)v3;
  }
  else {
    id v5 = self;
  }
  id v6 = v5;

  uint64_t v7 = [(EKCalendarItem *)v6 calendarItemIdentifier];

  return v7;
}

- (NSString)calendarItemIdentifier
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (NSString)notes
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C58]];
}

- (NSURL)URL
{
  v2 = [(EKCalendarItem *)self URLString];
  if ([v2 length])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "_lp_URLWithUserTypedString:relativeToURL:", v2, 0);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSURL *)v3;
}

- (id)URLString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B88]];
}

- (BOOL)isSelfOrganizedInvitation
{
  BOOL v3 = [(EKCalendarItem *)self hasAttendees];
  if (v3)
  {
    LOBYTE(v3) = [(EKCalendarItem *)self isSelfOrganized];
  }
  return v3;
}

- selfAttendee
{
  void *v2;
  id v3;
  void *v4;
  uint64_t vars8;

  v2 = [(EKCalendarItem *)self _selfAttendee];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKCalendarItem selfAttendee](v4);
    }
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = v2;
  }

  return v3;
}

- (id)_selfAttendee
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F56C88];
  char v4 = [(EKObject *)self frozenOrMeltedCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56C88]];
  id v5 = v4;
  if (v4 && ([v4 isFrozen] & 1) != 0)
  {
    id v6 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:*MEMORY[0x1E4F56BA8]];
    uint64_t v7 = v6;
    if (v6)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v18 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            long long v14 = [v13 backingObject];
            char v15 = [v14 isEqual:v5];

            if (v15)
            {
              id v16 = v13;
              [(EKObject *)self setCachedMeltedObject:v16 forSingleValueKey:v3];

              uint64_t v7 = v18;
              goto LABEL_16;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      uint64_t v7 = v18;
    }
    id v16 = [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:v3];
LABEL_16:
  }
  else
  {
    id v16 = v5;
  }

  return v16;
}

- (id)organizer
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56C60]];
}

- (NSArray)recurrenceRules
{
  v2 = [(EKCalendarItem *)self recurrenceRulesSet];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)recurrenceRulesSet
{
  return [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56C80]];
}

- (id)exceptionDates
{
  v2 = [(EKCalendarItem *)self ekExceptionDates];
  uint64_t v3 = [v2 valueForKey:@"date"];

  return v3;
}

- (id)ekExceptionDates
{
  return [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56BE0]];
}

- (id)detachedItems
{
  return [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56BD8]];
}

void __46__EKCalendarItem_knownDerivedRelationshipKeys__block_invoke()
{
  v0 = (void *)knownDerivedRelationshipKeys_keys;
  knownDerivedRelationshipKeys_keys = (uint64_t)&unk_1EF953138;
}

void __50__EKCalendarItem_knownRelationshipSingleValueKeys__block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56BC0];
  v6[0] = *MEMORY[0x1E4F56D10];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56C88];
  v6[2] = *MEMORY[0x1E4F56C60];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56BB0];
  v6[4] = *MEMORY[0x1E4F56C68];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56D28];
  v6[6] = *MEMORY[0x1E4F56D30];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  id v5 = (void *)knownRelationshipSingleValueKeys_keys;
  knownRelationshipSingleValueKeys_keys = v4;
}

void __49__EKCalendarItem_knownRelationshipMultiValueKeys__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56C80];
  v5[0] = *MEMORY[0x1E4F56B98];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56BA0];
  v5[2] = *MEMORY[0x1E4F56BA8];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56BE0];
  v5[4] = *MEMORY[0x1E4F56BD8];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  uint64_t v4 = (void *)knownRelationshipMultiValueKeys_keys;
  knownRelationshipMultiValueKeys_keys = v3;
}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken, &__block_literal_global_24);
  }
  uint64_t v2 = (void *)knownRelationshipSingleValueKeys_keys;

  return v2;
}

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken != -1) {
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)knownRelationshipMultiValueKeys_keys;

  return v2;
}

- (NSData)structuredData
{
  return (NSData *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D18]];
}

- (void)setStructuredData:(id)a3
{
}

- (NSData)localStructuredData
{
  return (NSData *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C48]];
}

- (void)setLocalStructuredData:(id)a3
{
}

- (id)_structuredDataDictionaryFromData:(id)a3 local:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F577D8];
  id v6 = a3;
  uint64_t v7 = [v5 defaultPermittedClasses];
  id v13 = 0;
  id v8 = [v5 unarchiveDictionaryFromData:v6 permittedClasses:v7 strict:!v4 error:&v13];

  id v9 = v13;
  if (v9)
  {
    uint64_t v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKCalendarItem(Shared) _structuredDataDictionaryFromData:local:]((uint64_t)v9, v10);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (id)_dataFromStructuredDataDictionary:(id)a3 local:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F577D8];
  uint64_t v7 = [MEMORY[0x1E4F577D8] defaultPermittedClasses];
  id v13 = 0;
  id v8 = [v6 archiveDictionary:v5 permittedClasses:v7 strict:!v4 error:&v13];
  id v9 = v13;

  if (v9)
  {
    uint64_t v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKCalendarItem(Shared) _dataFromStructuredDataDictionary:local:]((uint64_t)v5, (uint64_t)v9, v10);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (id)_customObjectForKey:(id)a3 local:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(EKCalendarItem *)self localStructuredData];
  }
  else {
  uint64_t v7 = [(EKCalendarItem *)self structuredData];
  }
  id v8 = [(EKCalendarItem *)self _structuredDataDictionaryFromData:v7 local:v4];
  id v9 = [v8 objectForKey:v6];

  return v9;
}

- (void)_setCustomObject:(id)a3 forKey:(id)a4 local:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if (v5) {
    [(EKCalendarItem *)self localStructuredData];
  }
  else {
  id v9 = [(EKCalendarItem *)self structuredData];
  }
  uint64_t v10 = [(EKCalendarItem *)self _structuredDataDictionaryFromData:v9 local:v5];
  id v11 = (void *)[v10 mutableCopy];

  if (!v11) {
    id v11 = objc_opt_new();
  }
  if (v13) {
    [v11 setObject:v13 forKey:v8];
  }
  else {
    [v11 removeObjectForKey:v8];
  }
  if (v5)
  {
    long long v12 = [(EKCalendarItem *)self _dataFromStructuredDataDictionary:v11 local:1];
    [(EKCalendarItem *)self setLocalStructuredData:v12];
  }
  else
  {
    long long v12 = [(EKCalendarItem *)self _dataFromStructuredDataDictionary:v11 local:0];
    [(EKCalendarItem *)self setStructuredData:v12];
  }
}

- (id)customObjectForKey:(id)a3
{
  return [(EKCalendarItem *)self _customObjectForKey:a3 local:0];
}

- (void)setCustomObject:(id)a3 forKey:(id)a4
{
}

- (id)localCustomObjectForKey:(id)a3
{
  return [(EKCalendarItem *)self _customObjectForKey:a3 local:1];
}

- (void)setLocalCustomObject:(id)a3 forKey:(id)a4
{
}

- (id)description
{
  long long v14 = NSString;
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(EKCalendarItem *)self title];
  BOOL v5 = [(EKCalendarItem *)self location];
  id v6 = [(EKCalendarItem *)self calendar];
  uint64_t v7 = [(EKCalendarItem *)self alarms];
  id v8 = [(EKCalendarItem *)self URL];
  id v9 = [(EKCalendarItem *)self lastModifiedDate];
  uint64_t v10 = [(EKCalendarItem *)self startTimeZone];
  id v11 = [(EKCalendarItem *)self endTimeZone];
  objc_msgSend(v14, "stringWithFormat:", @"%@ <%p>\n{\t title = \t\t%@; \n\t location = \t%@; \n\t calendar = \t%@; \n\t alarms = \t\t%@; \n\t URL = \t\t\t%@; \n\t lastModified = %@; \n\t startTimeZone = \t%@; \n\t endTimeZone = \t%@ \n}",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  long long v12 = v11);

  return v12;
}

+ (id)knownRelationshipSingleValueKeysForValidation
{
  if (knownRelationshipSingleValueKeysForValidation_onceToken != -1) {
    dispatch_once(&knownRelationshipSingleValueKeysForValidation_onceToken, &__block_literal_global_16);
  }
  uint64_t v2 = (void *)knownRelationshipSingleValueKeysForValidation_keys;

  return v2;
}

void __63__EKCalendarItem_knownRelationshipSingleValueKeysForValidation__block_invoke()
{
  uint64_t v0 = (void *)knownRelationshipSingleValueKeysForValidation_keys;
  knownRelationshipSingleValueKeysForValidation_keys = MEMORY[0x1E4F1CBF0];
}

+ (id)knownRelationshipMultiValueKeysForValidation
{
  if (knownRelationshipMultiValueKeysForValidation_onceToken != -1) {
    dispatch_once(&knownRelationshipMultiValueKeysForValidation_onceToken, &__block_literal_global_20);
  }
  uint64_t v2 = (void *)knownRelationshipMultiValueKeysForValidation_keys;

  return v2;
}

void __62__EKCalendarItem_knownRelationshipMultiValueKeysForValidation__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F56B98];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownRelationshipMultiValueKeysForValidation_keys;
  knownRelationshipMultiValueKeysForValidation_keys = v0;
}

- (BOOL)shouldLoadRelationshipForValidation:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F56B98]] ^ 1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_0 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_0, &__block_literal_global_22_0);
  }
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_0;

  return v2;
}

void __43__EKCalendarItem_knownRelationshipWeakKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56BB0];
  v3[0] = *MEMORY[0x1E4F56C68];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_0;
  knownRelationshipWeakKeys_keys_0 = v1;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_3 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_3, &__block_literal_global_24_0);
  }
  uint64_t v2 = (void *)knownIdentityKeysForComparison_keys_3;

  return v2;
}

void __48__EKCalendarItem_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownIdentityKeysForComparison_keys_3;
  knownIdentityKeysForComparison_keys_3 = v0;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_1 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_1, &__block_literal_global_26);
  }
  uint64_t v2 = (void *)knownSingleValueKeysForComparison_keys_1;

  return v2;
}

void __51__EKCalendarItem_knownSingleValueKeysForComparison__block_invoke()
{
  v18[33] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56B90];
  v18[0] = *MEMORY[0x1E4F56B88];
  v18[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56BB8];
  v18[2] = *MEMORY[0x1E4F56C38];
  v18[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56BD0];
  v18[4] = *MEMORY[0x1E4F56BC8];
  v18[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56BF8];
  v18[6] = *MEMORY[0x1E4F56BF0];
  v18[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56C28];
  v18[8] = *MEMORY[0x1E4F56C20];
  v18[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F56C40];
  v18[10] = *MEMORY[0x1E4F56C30];
  v18[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F56C58];
  v18[12] = *MEMORY[0x1E4F56C50];
  v18[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F56C90];
  v18[14] = *MEMORY[0x1E4F56C78];
  v18[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F56CA0];
  v18[16] = *MEMORY[0x1E4F56C98];
  v18[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F56CB0];
  v18[18] = *MEMORY[0x1E4F56CA8];
  v18[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F56CC0];
  v18[20] = *MEMORY[0x1E4F56CB8];
  v18[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F56CD0];
  v18[22] = *MEMORY[0x1E4F56CC8];
  v18[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F56CE0];
  v18[24] = *MEMORY[0x1E4F56CD8];
  v18[25] = v12;
  uint64_t v13 = *MEMORY[0x1E4F56CF0];
  v18[26] = *MEMORY[0x1E4F56CE8];
  v18[27] = v13;
  uint64_t v14 = *MEMORY[0x1E4F56D08];
  v18[28] = *MEMORY[0x1E4F56CF8];
  v18[29] = v14;
  uint64_t v15 = *MEMORY[0x1E4F56D38];
  v18[30] = *MEMORY[0x1E4F56D40];
  v18[31] = v15;
  v18[32] = *MEMORY[0x1E4F56C18];
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:33];
  uint64_t v17 = (void *)knownSingleValueKeysForComparison_keys_1;
  knownSingleValueKeysForComparison_keys_1 = v16;
}

+ (id)specialComparisonBlocks
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:&__block_literal_global_29_0 forKey:*MEMORY[0x1E4F56C90]];
}

uint64_t __41__EKCalendarItem_specialComparisonBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 selfParticipantStatus];
  if (v6 == [v5 selfParticipantStatus])
  {
    uint64_t v7 = 1;
  }
  else if ([v4 needsResponse])
  {
    uint64_t v7 = [v5 needsResponse];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)defaultPropertyKeysToSkipForRecursiveSnapshotCopies
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__EKCalendarItem_defaultPropertyKeysToSkipForRecursiveSnapshotCopies__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPropertyKeysToSkipForRecursiveSnapshotCopies_onceToken != -1) {
    dispatch_once(&defaultPropertyKeysToSkipForRecursiveSnapshotCopies_onceToken, block);
  }
  uint64_t v2 = (void *)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;

  return v2;
}

void __69__EKCalendarItem_defaultPropertyKeysToSkipForRecursiveSnapshotCopies__block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___EKCalendarItem;
  uint64_t v1 = objc_msgSendSuper2(&v8, sel_defaultPropertyKeysToSkipForRecursiveSnapshotCopies);
  uint64_t v2 = (void *)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;
  defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys = v1;

  uint64_t v3 = (void *)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;
  uint64_t v4 = *MEMORY[0x1E4F56C68];
  v9[0] = *MEMORY[0x1E4F56BD8];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = [v3 setByAddingObjectsFromArray:v5];
  uint64_t v7 = (void *)defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys;
  defaultPropertyKeysToSkipForRecursiveSnapshotCopies_keys = v6;
}

- (unint64_t)entityType
{
  return -1;
}

- (id)startDateRaw
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D00]];
}

- (void)setStartDateRaw:(id)a3
{
}

- (void)setCalendarItemIdentifier:(id)a3
{
}

- (NSString)calendarItemExternalIdentifier
{
  uint64_t v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D38]];
  if (!v3)
  {
    uint64_t v3 = [(EKCalendarItem *)self calendarItemIdentifier];
  }

  return (NSString *)v3;
}

- (id)uniqueId
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D38]];
}

- (void)setUniqueId:(id)a3
{
}

- (void)setUniqueID:(id)a3
{
}

- (void)setNotes:(NSString *)notes
{
}

- (BOOL)hasNotes
{
  if ([(EKObject *)self isNew]
    || ![(EKObject *)self isPropertyUnavailable:*MEMORY[0x1E4F56C58]])
  {
    uint64_t v3 = [(EKCalendarItem *)self notes];
    char v4 = [v3 length] != 0;
  }
  else
  {
    uint64_t v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C28]];
    char v4 = [v3 BOOLValue];
  }

  return v4;
}

- (void)setUnlocalizedTitle:(id)a3
{
}

- (void)setLocation:(NSString *)location
{
  uint64_t v7 = location;
  char v4 = [(EKCalendarItem *)self location];
  char v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      uint64_t v6 = +[EKStructuredLocation locationWithTitle:v7];
    }
    else
    {
      uint64_t v6 = 0;
    }
    [(EKCalendarItem *)self setStructuredLocation:v6];
  }

  MEMORY[0x1F4181820]();
}

- (void)setStructuredLocationWithoutPrediction:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56D10];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKStructuredLocation frozenClass]];
}

- (void)setClientLocation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56BC0];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKStructuredLocation frozenClass]];
}

- (void)setTravelStartLocation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56D30];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKStructuredLocation frozenClass]];
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C40]];
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56BC8]];
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)isAllDay
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C38]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAllDay:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56C38]];
}

- (id)calendarScale
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56BB8]];
}

- (void)setCalendarScale:(id)a3
{
}

- (unint64_t)priority
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C78]];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setPriority:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56C78]];
}

- (id)actionString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B90]];
}

- (void)setActionString:(id)a3
{
}

- (id)action
{
  uint64_t v2 = [(EKCalendarItem *)self actionString];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (void)setAction:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKCalendarItem *)self setActionString:v4];
}

- (id)appLink
{
  return 0;
}

- (void)setURLString:(id)a3
{
}

- (void)setURL:(NSURL *)URL
{
  id v4 = [(NSURL *)URL absoluteString];
  [(EKCalendarItem *)self setURLString:v4];
}

- (void)setCalendar:(EKCalendar *)calendar
{
  uint64_t v4 = *MEMORY[0x1E4F56BB0];
  id v5 = calendar;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKCalendar frozenClass]];
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  uint64_t v4 = timeZone;
  [(EKCalendarItem *)self setStartTimeZone:v4];
  [(EKCalendarItem *)self setEndTimeZone:v4];
}

- (void)setStartTimeZoneName:(id)a3
{
}

- (void)setStartTimeZone:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() timeZoneNameFromTimeZone:v4];

  [(EKCalendarItem *)self setStartTimeZoneName:v5];
}

- (void)setEndTimeZoneName:(id)a3
{
}

- (void)setEndTimeZone:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() timeZoneNameFromTimeZone:v4];

  [(EKCalendarItem *)self setEndTimeZoneName:v5];
}

- (BOOL)defaultAlarmWasDeleted
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56BD0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDefaultAlarmWasDeleted:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56BD0]];
}

- (id)externalID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C00]];
}

- (void)setExternalID:(id)a3
{
}

- (id)externalScheduleID
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C10]];
}

- (void)setExternalScheduleID:(id)a3
{
}

- (id)externalModificationTag
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C08]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (id)externalData
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56BF8]];
}

- (void)setExternalData:(id)a3
{
}

- (unsigned)modifiedProperties
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C50]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setModifiedProperties:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56C50]];
}

- (int)sequenceNumber
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C98]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setSequenceNumber:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56C98]];
}

- (id)syncError
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F56D28]];
}

- (void)setSyncError:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56D28];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKSyncError frozenClass]];
}

- (BOOL)isNewItemThatFailedToPut
{
  int v3 = [(EKCalendarItem *)self syncError];
  uint64_t v4 = v3;
  if (v3 && [v3 errorType] == 1 && objc_msgSend(v4, "errorCode") == 3)
  {
    id v5 = [(EKCalendarItem *)self externalModificationTag];
    BOOL v6 = [v5 length] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)exportToICS
{
  return [(EKCalendarItem *)self exportToICSWithOptions:0x40000];
}

- (id)exportToICSWithOptions:(unint64_t)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__4;
  long long v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  id v5 = [(EKObject *)self objectID];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = self;
      uint64_t v7 = [(EKCalendarItem *)v6 startDate];
      objc_super v8 = [(EKCalendarItem *)v6 adjustedPersistedDateForDate:v7 withAdjustmentMode:0 pinMode:0 clientCalendarDate:0];
    }
    else
    {
      objc_super v8 = 0;
    }
    uint64_t v9 = [(EKObject *)self eventStore];
    uint64_t v10 = [v9 connection];
    uint64_t v11 = [v10 CADOperationProxySync];
    uint64_t v12 = [(EKObject *)self CADObjectID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__EKCalendarItem_exportToICSWithOptions___block_invoke;
    v15[3] = &unk_1E5B976B8;
    v15[4] = &v16;
    [v11 CADDatabaseExportICSForCalendarItemWithID:v12 occurrenceDate:v8 options:a3 reply:v15];
  }
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __41__EKCalendarItem_exportToICSWithOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2)
  {
    BOOL v6 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    NSLog(&cfstr_ErrorExporting.isa, v6);
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = v5;
    BOOL v6 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
}

- (BOOL)suppressNotificationForChanges
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D20]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSuppressNotificationForChanges:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56D20]];
}

- (id)externalURI
{
  return 0;
}

- (id)committedConstraints
{
  return 0;
}

- (BOOL)requiresDetach
{
  return 0;
}

- (BOOL)allowsSpansOtherThanThisEvent
{
  return 1;
}

- (BOOL)isEditable
{
  if ([(EKObject *)self isNew]) {
    return 1;
  }
  id v4 = [(EKCalendarItem *)self calendar];
  id v5 = v4;
  if (v4
    && (([v4 allowsContentModifications] & 1) != 0
     || ([v5 isMutableSuggestionsCalendar] & 1) != 0
     || [v5 isMutableNaturalLanguageSuggestionsCalendar]))
  {
    if ([(EKCalendarItem *)self hasAttendees])
    {
      BOOL v6 = [v5 source];
      if ((!v6
         || ([(EKCalendarItem *)self constraints],
             uint64_t v7 = objc_claimAutoreleasedReturnValue(),
             int v8 = [v7 supportsInvitationModifications],
             v7,
             v8))
        && [v5 allowsScheduling])
      {
        BOOL v3 = [(EKCalendarItem *)self isSelfOrganized]
          || [(EKCalendarItem *)self isOrganizedBySharedCalendarOwner];
      }
      else
      {
        BOOL v3 = 0;
      }
    }
    else
    {
      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isDeletable
{
  return [(EKCalendarItem *)self _validateDeletable:0];
}

- (BOOL)_validateDeletable:(id *)a3
{
  if (!-[EKCalendarItem _validateDeletableDueToAccessConsent:](self, "_validateDeletableDueToAccessConsent:")
    || ![(EKCalendarItem *)self _validateDeletableInCalendarWithError:a3])
  {
    return 0;
  }

  return [(EKCalendarItem *)self _validateDeletableBySharedCalendarShareeWithError:a3];
}

- (BOOL)_validateDeletableDueToAccessConsent:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[EKEventStore realAuthorizationStatusForEntityType:[(EKCalendarItem *)self entityType]];
  if (v5 <= 2)
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:29];
    }
    BOOL v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = v6;
      unint64_t v8 = [(EKCalendarItem *)self entityType];
      id v9 = @"reminders";
      if (!v8) {
        id v9 = @"events";
      }
      int v11 = 138412546;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_INFO, "Validation is failing for %@ because access has not been granted for %{public}@.", (uint8_t *)&v11, 0x16u);
    }
  }
  return v5 > 2;
}

- (BOOL)_validateDeletableInCalendarWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(EKCalendarItem *)self calendar];
  if ([v5 allowsContentModifications]) {
    goto LABEL_6;
  }
  BOOL v6 = [(EKCalendarItem *)self calendar];
  if ([v6 isSuggestedEventCalendar])
  {
LABEL_5:

LABEL_6:
LABEL_7:
    LOBYTE(v8) = 1;
    return v8;
  }
  uint64_t v7 = [(EKCalendarItem *)self calendar];
  if ([v7 isNaturalLanguageSuggestedEventCalendar])
  {

    goto LABEL_5;
  }
  BOOL v9 = [(EKCalendarItem *)self isNewItemThatFailedToPut];

  if (v9) {
    goto LABEL_7;
  }
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:6];
  }
  uint64_t v10 = EKLogHandle;
  BOOL v8 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO);
  if (v8)
  {
    int v12 = 138412290;
    __int16 v13 = self;
    _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_INFO, "Validation is failing for %@ because readonly items can't be removed.", (uint8_t *)&v12, 0xCu);
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)_isInSharedToMeCalendarWithNoSharingScheduling
{
  BOOL v3 = [(EKCalendarItem *)self calendar];
  if ([v3 sharingStatus] == 2)
  {
    id v4 = [(EKCalendarItem *)self calendar];
    int v5 = [v4 allowsScheduling] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_validateDeletableBySharedCalendarShareeWithError:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(EKCalendarItem *)self _isInSharedToMeCalendarWithNoSharingScheduling]&& [(EKCalendarItem *)self hasAttendees])
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:0];
    }
    int v5 = EKLogHandle;
    BOOL v6 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO);
    if (v6)
    {
      int v8 = 138412290;
      BOOL v9 = self;
      _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_INFO, "Validation is failing for %@ because it's not deletable by shared calendar sharees.", (uint8_t *)&v8, 0xCu);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)isFloating
{
  uint64_t v2 = [(EKCalendarItem *)self timeZone];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isSelfOrganized
{
  uint64_t v2 = [(EKCalendarItem *)self organizer];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 isCurrentUser];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isExternallyOrganizedInvitation
{
  BOOL v3 = [(EKCalendarItem *)self hasAttendees];
  if (v3) {
    LOBYTE(v3) = ![(EKCalendarItem *)self isSelfOrganized];
  }
  return v3;
}

- (BOOL)isOrganizedBySharedCalendarOwner
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKCalendarItem *)self calendar];
  char v4 = [v3 sharedOwnerAddresses];

  if (!v4) {
    goto LABEL_14;
  }
  int v5 = [(EKCalendarItem *)self organizer];
  BOOL v6 = [v5 URL];
  uint64_t v7 = [v6 absoluteString];

  if (v7)
  {
    int v8 = [v7 stringRemovingMailto];
    BOOL v9 = [v7 stringRemovingTel];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      id v21 = v4;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v15 isEqualToString:v7]) {
            goto LABEL_16;
          }
          uint64_t v16 = [v15 stringRemovingMailto];
          if (([v16 isEqualToString:v8] & 1) != 0
            || ([v15 stringRemovingTel],
                uint64_t v17 = objc_claimAutoreleasedReturnValue(),
                int v18 = [v17 isEqualToString:v9],
                v17,
                v18))
          {

LABEL_16:
            BOOL v19 = 1;
            char v4 = v21;
            goto LABEL_18;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        BOOL v19 = 0;
        char v4 = v21;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
LABEL_18:
  }
  else
  {
LABEL_14:
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)needsResponse
{
  BOOL v3 = [(EKCalendarItem *)self isExternallyOrganizedInvitation];
  return v3 & +[EKParticipant needsResponseForParticipantStatus:[(EKCalendarItem *)self selfParticipantStatus]];
}

- (id)constraints
{
  return 0;
}

- (BOOL)allowsCalendarModifications
{
  if ([(EKObject *)self isNew]) {
    return 1;
  }
  char v4 = [(EKCalendarItem *)self calendar];
  char v5 = [v4 allowsContentModifications];

  return v5;
}

- (BOOL)allowsAlarmModifications
{
  BOOL v3 = [(EKCalendarItem *)self constraints];
  if ((([v3 supportsAlarmTriggerIntervals] & 1) != 0
     || [v3 supportsAlarmTriggerDates])
    && [v3 maxAlarmsAllowed])
  {
    if ([(EKCalendarItem *)self isExternallyOrganizedInvitation]) {
      char v4 = [v3 supportsInvitationModifications];
    }
    else {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)allowsAttendeesModifications
{
  return 0;
}

- (unint64_t)actionsState
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__EKCalendarItem_actionsState__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  uint64_t v2 = [(EKObject *)self cachedValueForKey:@"actionsState" populateBlock:v5];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __30__EKCalendarItem_actionsState__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) externalData];
  uint64_t v2 = [MEMORY[0x1E4F57470] metadataWithData:v1];
  unint64_t v3 = [v2 unrecognizedProperties];
  char v4 = [v3 objectForKey:@"X-APPLE-NO-ACTION"];

  char v5 = objc_opt_class();
  if ([v5 isSubclassOfClass:objc_opt_class()])
  {
    BOOL v6 = [v4 objectAtIndex:0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = 0;
    if ([v7 isSubclassOfClass:objc_opt_class()])
    {
      BOOL v9 = [v6 value];
      id v10 = objc_opt_class();
      LODWORD(v10) = [v10 isSubclassOfClass:objc_opt_class()];

      if (v10)
      {
        uint64_t v11 = [v6 value];
        if ([v11 isEqualToString:@"OUT-OF-DATE"])
        {
          uint64_t v8 = 2;
        }
        else if ([v11 isEqualToString:@"DELEGATORS-COPY"])
        {
          uint64_t v8 = 3;
        }
        else if ([v11 isEqualToString:@"DELEGATEES-COPY"])
        {
          uint64_t v8 = 4;
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:v8];

  return v12;
}

- (id)adjustDateFromUTC:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_class();
  BOOL v6 = [(EKCalendarItem *)self isAllDay];
  uint64_t v7 = [(EKCalendarItem *)self timeZone];
  uint64_t v8 = [v5 adjustDateFromUTC:v4 allDay:v6 timeZone:v7];

  return v8;
}

+ (id)adjustDateFromUTC:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (!a5 || v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F57708];
    BOOL v9 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    uint64_t v10 = [v8 dateInTimeZone:v9 fromFloatingDateInGMT:v7];

    id v7 = (id)v10;
  }

  return v7;
}

+ (id)keysToIgnoreForApplyingChanges
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EKCalendarItem_keysToIgnoreForApplyingChanges__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (keysToIgnoreForApplyingChanges_onceToken != -1) {
    dispatch_once(&keysToIgnoreForApplyingChanges_onceToken, block);
  }
  uint64_t v2 = (void *)keysToIgnoreForApplyingChanges_keysToIgnore;

  return v2;
}

void __48__EKCalendarItem_keysToIgnoreForApplyingChanges__block_invoke(uint64_t a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKCalendarItem;
  uint64_t v1 = objc_msgSendSuper2(&v7, sel_keysToIgnoreForApplyingChanges);
  uint64_t v2 = *MEMORY[0x1E4F56C28];
  v8[0] = *MEMORY[0x1E4F56C20];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56C90];
  v8[2] = *MEMORY[0x1E4F56C30];
  v8[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  uint64_t v5 = [v1 setByAddingObjectsFromArray:v4];
  BOOL v6 = (void *)keysToIgnoreForApplyingChanges_keysToIgnore;
  keysToIgnoreForApplyingChanges_keysToIgnore = v5;
}

- (BOOL)hasAlarms
{
  uint64_t v2 = [(EKCalendarItem *)self alarms];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)shouldHaveDefaultAlarms
{
  return 0;
}

- (id)defaultAlarms
{
  return 0;
}

- (id)defaultAlarm
{
  return 0;
}

- (void)setAlarms:(NSArray *)alarms
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[(NSArray *)alarms mutableCopy];
  if (![(EKCalendarItem *)self shouldHaveDefaultAlarms])
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v5 = [(EKCalendarItem *)self allAlarms];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v66;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v66 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          if ([v10 isDefaultAlarm])
          {
            [v4 addObject:v10];
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        if (([v18 isSnoozed] & 1) == 0)
        {
          [v11 addObject:v18];
          BOOL v19 = [v18 UUID];

          if (v19)
          {
            long long v20 = [v18 UUID];
            [v12 addObject:v20];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v15);
  }
  v46 = self;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v13;
  uint64_t v21 = [obj countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v48 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v58 != v48) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v57 + 1) + 8 * k);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v25 = [v24 snoozedAlarms];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v70 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v54;
          do
          {
            for (uint64_t m = 0; m != v27; ++m)
            {
              if (*(void *)v54 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v53 + 1) + 8 * m);
              [v11 addObject:v30];
              v31 = [v30 UUID];

              if (v31)
              {
                v32 = [v30 UUID];
                [v12 addObject:v32];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v53 objects:v70 count:16];
          }
          while (v27);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v57 objects:v71 count:16];
    }
    while (v22);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v33 = v46;
  v34 = [(EKCalendarItem *)v46 allAlarms];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v49 objects:v69 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v50;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v50 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v49 + 1) + 8 * n);
        if ([(EKCalendarItem *)v33 _excludeAlarmDueToConnectionTrigger:v39])
        {
          uint64_t v40 = [v39 UUID];
          if (v40)
          {
            v41 = (void *)v40;
            v42 = [v39 UUID];
            char v43 = [v12 containsObject:v42];

            v33 = v46;
            if ((v43 & 1) == 0)
            {
              [v11 addObject:v39];
              v44 = [v39 UUID];
              [v12 addObject:v44];
            }
          }
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v49 objects:v69 count:16];
    }
    while (v36);
  }

  v45 = [v11 set];
  [(EKCalendarItem *)v33 setAllAlarmsSet:v45];
}

- (NSArray)alarms
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKCalendarItem *)self allAlarms];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          BOOL v12 = -[EKCalendarItem _excludeAlarmDueToConnectionTrigger:](self, "_excludeAlarmDueToConnectionTrigger:", v11, (void)v14);
          if (([v11 isSnoozed] & 1) == 0
            && !v12
            && ([(EKCalendarItem *)self shouldHaveDefaultAlarms]
             || ([v11 isDefaultAlarm] & 1) == 0))
          {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)sortedAlarms
{
  uint64_t v2 = [(EKCalendarItem *)self alarms];
  BOOL v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

- (int64_t)indexForAlarm:(id)a3
{
  id v4 = a3;
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    uint64_t v11 = 0;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    id v6 = [(EKCalendarItem *)self sortedAlarms];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__EKCalendarItem_indexForAlarm___block_invoke;
    v8[3] = &unk_1E5B976E0;
    id v9 = v4;
    uint64_t v10 = &v11;
    [v6 enumerateObjectsUsingBlock:v8];
    int64_t v5 = v12[3];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

void __32__EKCalendarItem_indexForAlarm___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:") & 1) != 0
    || ([*(id *)(a1 + 32) UUID],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v10 UUID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)_excludeAlarmDueToConnectionTrigger:(id)a3
{
  id v3 = a3;
  BOOL v5 = 1;
  if (([v3 proximity] & 0x8000000000000000) == 0)
  {
    uint64_t v4 = [v3 proximity];
    if (v4 <= +[EKAlarm maxPublicProximity]) {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)allAlarmsSet
{
  uint64_t v2 = [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:*MEMORY[0x1E4F56B98]];
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (void)setAllAlarmsSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "isDefaultAlarm", (void)v10))
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  [(EKCalendarItem *)self setDefaultAlarmWasDeleted:v9];
  [(EKObject *)self updateMeltedAndCachedMultiRelationObjects:v4 forKey:*MEMORY[0x1E4F56B98]];
}

- (void)setAllAlarms:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [(EKCalendarItem *)self setAllAlarmsSet:v4];
}

- (id)allAlarms
{
  uint64_t v2 = [(EKCalendarItem *)self allAlarmsSet];
  if ([v2 count])
  {
    id v3 = [v2 allObjects];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)addAlarm:(EKAlarm *)alarm
{
  id v4 = alarm;
  if (v4)
  {
    uint64_t v5 = v4;
    if ([(EKAlarm *)v4 isDefaultAlarm]) {
      [(EKCalendarItem *)self setDefaultAlarmWasDeleted:0];
    }
    [(EKObject *)self addCachedMeltedObject:v5 forMultiValueKey:*MEMORY[0x1E4F56B98]];
    id v4 = v5;
  }
}

- (void)removeAlarm:(EKAlarm *)alarm
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = alarm;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(EKAlarm *)v4 snoozedAlarms];
    if ([(EKAlarm *)v5 isDefaultAlarm])
    {
      uint64_t v7 = [(EKCalendarItem *)self allAlarmsSet];
      int v8 = [v7 containsObject:v5];

      if (v8) {
        [(EKCalendarItem *)self setDefaultAlarmWasDeleted:1];
      }
    }
    uint64_t v19 = v5;
    [(EKObject *)self removeCachedMeltedObject:v5 forMultiValueKey:*MEMORY[0x1E4F56B98]];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
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
          uint64_t v15 = [v14 calendarItemOwner];
          long long v16 = [v15 calendarItemIdentifier];
          long long v17 = [(EKCalendarItem *)self calendarItemIdentifier];
          int v18 = [v16 isEqualToString:v17];

          if (v18) {
            [(EKCalendarItem *)self removeAlarm:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v5 = v19;
  }
}

- (id)findOriginalAlarmStartingWith:(id)a3
{
  id v3 = a3;
  id v4 = [v3 originalAlarm];
  if (v4)
  {
    id v5 = [v3 originalAlarm];
  }
  else
  {
    id v5 = v3;
  }
  uint64_t v6 = v5;

  uint64_t v7 = [v6 originalAlarm];
  if (v7)
  {
    int v8 = (void *)v7;
    while (1)
    {
      id v9 = [v6 externalID];
      uint64_t v10 = [v3 externalID];
      char v11 = [v9 isEqualToString:v10];

      if (v11) {
        break;
      }
      uint64_t v12 = [v6 originalAlarm];

      int v8 = [v12 originalAlarm];
      uint64_t v6 = v12;
      if (!v8) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v12 = v6;
LABEL_10:

  return v12;
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4
{
}

- (void)snoozeAlarm:(id)a3 withLocation:(id)a4 proximity:(int64_t)a5
{
  id v14 = a3;
  id v9 = a4;
  if (!a5)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"EKCalendarItem.m" lineNumber:1144 description:@"Can't snooze an alarm with location but no proximity."];
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  [v14 setAcknowledgedDate:v10];

  char v11 = [v14 duplicate];
  [v11 setStructuredLocation:v9];
  [v11 setProximity:a5];
  uint64_t v12 = [(EKCalendarItem *)self findOriginalAlarmStartingWith:v14];
  [v11 setOriginalAlarm:v12];
  [(EKCalendarItem *)self addAlarm:v11];
}

- (BOOL)isAlarmAcknowledgedPropertyDirty
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56B98]]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(EKCalendarItem *)self allAlarms];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x1E4F56A80];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) _hasChangesForKey:v7])
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)isOnlyAlarmAcknowledgedPropertyDirty
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(EKObject *)self hasChanges]
    || ![(EKObject *)self _isOnlyChangedKey:*MEMORY[0x1E4F56B98]])
  {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(EKCalendarItem *)self allAlarms];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = 0;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = *MEMORY[0x1E4F56A80];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 hasChanges])
        {
          if (![v10 _isOnlyChangedKey:v8]) {
            goto LABEL_15;
          }
          BOOL v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
LABEL_15:
    BOOL v6 = 0;
  }

  return v6;
}

- (void)removeAcknowledgedSnoozedAlarms
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [(EKCalendarItem *)self allAlarms];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 isSnoozed])
        {
          uint64_t v10 = [v9 acknowledgedDate];

          if (v10) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[EKCalendarItem removeAlarm:](self, "removeAlarm:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)removeAllSnoozedAlarms
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [(EKCalendarItem *)self allAlarms];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v9 isSnoozed]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[EKCalendarItem removeAlarm:](self, "removeAlarm:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)recurrenceRuleString
{
  id v3 = [(EKCalendarItem *)self singleRecurrenceRule];
  uint64_t v4 = objc_msgSend(v3, "stringValueAsDateOnly:isFloating:", -[EKCalendarItem isAllDay](self, "isAllDay"), -[EKCalendarItem isFloating](self, "isFloating"));

  return v4;
}

- (id)singleRecurrenceRule
{
  uint64_t v2 = [(EKCalendarItem *)self recurrenceRules];
  id v3 = [v2 lastObject];

  return v3;
}

- (BOOL)_hadRecurrenceRules
{
  if ([(EKObject *)self isNew])
  {
    uint64_t v3 = *MEMORY[0x1E4F56C80];
LABEL_5:
    uint64_t v6 = [(EKObject *)self _previousValueForKey:v3];
    char v7 = [v6 count] != 0;
    goto LABEL_6;
  }
  uint64_t v4 = [(EKObject *)self persistentObject];
  uint64_t v3 = *MEMORY[0x1E4F56C80];
  int v5 = [v4 isPropertyUnavailable:*MEMORY[0x1E4F56C80]];

  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56C30]];
  char v7 = [v6 BOOLValue];
LABEL_6:

  return v7;
}

- (void)setRecurrenceRules:(NSArray *)recurrenceRules
{
  int v5 = recurrenceRules;
  if (v5)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
    [(EKCalendarItem *)self setRecurrenceRulesSet:v4];
  }
  else
  {
    [(EKCalendarItem *)self setRecurrenceRulesSet:0];
  }
}

- (BOOL)hasComplexRecurrence
{
  uint64_t v2 = [(EKCalendarItem *)self singleRecurrenceRule];
  if ([v2 isPinnedToEndOfFrequency])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 daysOfTheWeek];
    if ([v4 count])
    {
      BOOL v3 = 1;
    }
    else
    {
      int v5 = [v2 daysOfTheMonth];
      if ([v5 count])
      {
        BOOL v3 = 1;
      }
      else
      {
        uint64_t v6 = [v2 daysOfTheYear];
        if ([v6 count])
        {
          BOOL v3 = 1;
        }
        else
        {
          char v7 = [v2 weeksOfTheYear];
          if ([v7 count])
          {
            BOOL v3 = 1;
          }
          else
          {
            uint64_t v8 = [v2 monthsOfTheYear];
            if ([v8 count])
            {
              BOOL v3 = 1;
            }
            else
            {
              BOOL v9 = [v2 setPositions];
              BOOL v3 = [v9 count] != 0;
            }
          }
        }
      }
    }
  }

  return v3;
}

- (void)pinRecurrenceRuleToEndsOfFreqency
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (![(EKCalendarItem *)self hasComplexRecurrence])
  {
    BOOL v3 = [(EKCalendarItem *)self singleRecurrenceRule];
    if ([v3 frequency] != 2 && objc_msgSend(v3, "frequency") != 3) {
      goto LABEL_28;
    }
    uint64_t v4 = [(EKCalendarItem *)self timeZone];
    int v5 = (void *)MEMORY[0x1E4F1C9A8];
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9A8] CalGregorianCalendarForTimeZone:v4];
    }
    else
    {
      char v7 = [(EKObject *)self eventStore];
      uint64_t v8 = [v7 timeZone];
      uint64_t v6 = [v5 CalGregorianCalendarForTimeZone:v8];
    }
    BOOL v9 = [(EKCalendarItem *)self startDateForRecurrence];
    id v10 = [v6 components:24 fromDate:v9];

    if (v10)
    {
      if ([v3 frequency] == 2 && (uint64_t v11 = objc_msgSend(v10, "day"), (unint64_t)(v11 - 29) <= 2))
      {
        uint64_t v12 = v11;
        uint64_t v26 = v6;
        uint64_t v13 = [NSNumber numberWithInteger:-1];
        v33[0] = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
        [v3 setSetPositions:v14];

        long long v15 = [MEMORY[0x1E4F1CA48] array];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v16 = [&unk_1EF953150 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v28;
LABEL_12:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(&unk_1EF953150);
            }
            long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
            if (v12 < [v20 integerValue]) {
              break;
            }
            [v15 addObject:v20];
            if (v17 == ++v19)
            {
              uint64_t v17 = [&unk_1EF953150 countByEnumeratingWithState:&v27 objects:v32 count:16];
              if (v17) {
                goto LABEL_12;
              }
              break;
            }
          }
        }
        [v3 setDaysOfTheMonth:v15];

        int v21 = 0;
        uint64_t v6 = v26;
      }
      else
      {
        int v21 = 1;
      }
      if ([v3 frequency] == 3 && objc_msgSend(v10, "month") == 2 && objc_msgSend(v10, "day") == 29)
      {
        long long v22 = [NSNumber numberWithInteger:-1];
        v31 = v22;
        long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        [v3 setSetPositions:v23];

        long long v24 = &unk_1EF953168;
        uint64_t v25 = v3;
LABEL_26:
        [v25 setDaysOfTheMonth:v24];
        goto LABEL_27;
      }
      if (!v21)
      {
LABEL_27:

LABEL_28:
        return;
      }
    }
    [v3 setSetPositions:0];
    uint64_t v25 = v3;
    long long v24 = 0;
    goto LABEL_26;
  }
}

- (void)setRecurrenceRulesSet:(id)a3
{
  [(EKObject *)self updateMeltedAndCachedMultiRelationObjects:a3 forKey:*MEMORY[0x1E4F56C80]];

  [(EKCalendarItem *)self pinRecurrenceRuleToEndsOfFreqency];
}

- (void)addRecurrenceRule:(EKRecurrenceRule *)rule
{
  [(EKObject *)self addCachedMeltedObject:rule forMultiValueKey:*MEMORY[0x1E4F56C80]];

  [(EKCalendarItem *)self pinRecurrenceRuleToEndsOfFreqency];
}

- (void)removeRecurrenceRule:(EKRecurrenceRule *)rule
{
}

- (id)startDateForRecurrence
{
  return 0;
}

- (BOOL)_hadAttendees
{
  uint64_t v2 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56C20]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAttendeesRaw:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [(EKObject *)self updateMeltedAndCachedMultiRelationObjects:v4 forKey:*MEMORY[0x1E4F56BA8]];
}

- (void)setAttendees:(id)a3
{
  id v5 = a3;
  -[EKCalendarItem setAttendeesRaw:](self, "setAttendeesRaw:");
  id v4 = [(EKCalendarItem *)self selfAttendee];
  if (v4 && ([v5 containsObject:v4] & 1) == 0) {
    [(EKCalendarItem *)self _setSelfAttendee:0];
  }
}

- (void)addAttendee:(id)a3
{
  if (a3) {
    [(EKObject *)self addCachedMeltedObject:a3 forMultiValueKey:*MEMORY[0x1E4F56BA8]];
  }
}

- (void)removeAttendee:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v6 = [(EKCalendarItem *)self selfAttendee];

    if (v6 == v7) {
      [(EKCalendarItem *)self _setSelfAttendee:0];
    }
    id v4 = (id)[(EKCalendarItem *)self _removeAttendee:v7];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_removeAttendee:(id)a3
{
}

- (void)setSelfAttendee:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
      -[EKCalendarItem setSelfAttendee:](v9);
    }
  }
  else
  {
    id v5 = [(EKCalendarItem *)self selfAttendee];
    if ([v4 isEqual:v5])
    {
      if (v5 != v4)
      {
        id v6 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
          -[EKCalendarItem setSelfAttendee:](v6);
        }
      }
    }
    else
    {
      id v7 = [(EKCalendarItem *)self attendees];
      uint64_t v8 = v7;
      if (v4 && ([v7 containsObject:v4] & 1) == 0) {
        [(EKCalendarItem *)self addAttendee:v4];
      }
      if (v5 && [v8 containsObject:v5]) {
        [(EKCalendarItem *)self _removeAttendee:v5];
      }
      [(EKCalendarItem *)self _setSelfAttendee:v4];
    }
  }
}

- (void)_setSelfAttendee:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56C88];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKAttendee frozenClass]];
}

- (int)selfParticipantStatusRaw
{
  if (![(EKObject *)self isNew]
    && ([(EKObject *)self isPropertyUnavailable:*MEMORY[0x1E4F56C88]]
     || ([(EKCalendarItem *)self selfAttendee],
         char v3 = objc_claimAutoreleasedReturnValue(),
         int v4 = [v3 isPropertyUnavailable:*MEMORY[0x1E4F56B78]],
         v3,
         v4)))
  {
    id v5 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56C90]];
    int v6 = [v5 integerValue];
  }
  else
  {
    id v5 = [(EKCalendarItem *)self selfAttendee];
    int v6 = EKParticipantStatusToCalAttendeeStatus([v5 participantStatus]);
  }
  int v7 = v6;

  return v7;
}

- (int64_t)selfParticipantStatus
{
  uint64_t v2 = [(EKCalendarItem *)self selfParticipantStatusRaw];

  return CalAttendeeStatusToEKParticipantStatus(v2);
}

- (id)participantMatchingContact:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [EKParticipantToContactMatcher alloc];
    v11[0] = v4;
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

    int v7 = [(EKParticipantToContactMatcher *)v5 initWithContacts:v6];
    uint64_t v8 = [(EKParticipantToContactMatcher *)v7 matchingParticipantsFromItem:self];
    BOOL v9 = [v8 firstObject];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)attendeeMatchingEmailAddress:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(EKCalendarItem *)self attendees];
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
        BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 emailAddress];
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

- (void)setOrganizer:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56C60];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKOrganizer frozenClass]];
}

- (void)addOrganizerAndSelfAttendeeForNewInvitation
{
  id v3 = [(EKCalendarItem *)self calendar];
  [(EKCalendarItem *)self _addOrganizerAndSelfAttendeeForNewInvitationInCalendar:v3];
}

- (void)_addOrganizerAndSelfAttendeeForNewInvitationInCalendar:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EKCalendarItem *)self hasAttendees]
    && (![(EKCalendarItem *)self hasAttendees] || ![(EKCalendarItem *)self _hadAttendees]))
  {
    uint64_t v5 = [(EKCalendarItem *)self organizer];
    if (!v5
      || (id v6 = (void *)v5,
          [(EKCalendarItem *)self organizer],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 scheduleAgent],
          v7,
          v6,
          v8))
    {
      BOOL v9 = [(EKCalendarItem *)self organizer];
      if (!v9)
      {
        BOOL v9 = [v4 ownerIdentityOrganizer];
        [v9 setCurrentUser:1];
        if (v9)
        {
          id v10 = [v4 source];
          unint64_t v11 = [v10 sourceType];

          if (v11 > 3) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = qword_1A4F8FE00[v11];
          }
          [v9 setScheduleAgent:v12];
          [(EKCalendarItem *)self setOrganizer:v9];
        }
      }
      long long v13 = [v4 source];
      if ([v13 usesSelfAttendee])
      {
        long long v14 = [(EKCalendarItem *)self selfAttendee];

        if (!v14)
        {
          long long v15 = [(EKCalendarItem *)self attendeesRaw];
          long long v16 = [v9 name];
          uint64_t v17 = [v9 emailAddress];
          uint64_t v18 = [v9 phoneNumber];
          uint64_t v19 = [v9 URL];
          long long v20 = +[EKAttendee attendeeWithName:v16 emailAddress:v17 phoneNumber:v18 url:v19];

          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v21 = v15;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v30;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v30 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                if (objc_msgSend(v26, "isEqualToParticipant:", v20, (void)v29))
                {
                  id v27 = v26;

                  long long v20 = v27;
                  goto LABEL_25;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_25:

          [(EKCalendarItem *)self setSelfAttendee:v20];
          long long v28 = [(EKCalendarItem *)self selfAttendee];
          [v28 setParticipantStatus:2];
        }
      }
      else
      {
      }
    }
  }
}

- (void)removeLastExtraneousOrganizerAndSelfAttendee
{
  id v6 = [(EKCalendarItem *)self attendees];
  if ([v6 count] == 1)
  {
    id v3 = [(EKCalendarItem *)self selfAttendee];
    id v4 = [(EKCalendarItem *)self organizer];
    int v5 = [v3 isEqualToParticipant:v4];

    if (v5)
    {
      [(EKCalendarItem *)self setSelfAttendee:0];
      [(EKCalendarItem *)self setOrganizer:0];
    }
  }
  else
  {
  }
}

- (id)sharedItemCreatedByDisplayName
{
  id v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CA8]];
  if (!v3)
  {
    id v4 = [(EKCalendarItem *)self sharedItemCreatedByFirstName];
    int v5 = [(EKCalendarItem *)self sharedItemCreatedByLastName];
    id v3 = DisplayNameStringForIdentityWithProperties();
  }

  return v3;
}

- (void)setSharedItemCreatedByDisplayName:(id)a3
{
}

- (id)sharedItemCreatedByAddressString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CA0]];
}

- (void)setSharedItemCreatedByAddressString:(id)a3
{
}

- (id)sharedItemCreatedByAddress
{
  uint64_t v2 = [(EKCalendarItem *)self sharedItemCreatedByAddressString];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setSharedItemCreatedByAddress:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKCalendarItem *)self setSharedItemCreatedByAddressString:v4];
}

- (id)sharedItemCreatedByFirstName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CB0]];
}

- (void)setSharedItemCreatedByFirstName:(id)a3
{
}

- (id)sharedItemCreatedByLastName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CB8]];
}

- (void)setSharedItemCreatedByLastName:(id)a3
{
}

- (id)sharedItemCreatedDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CC0]];
}

- (void)setSharedItemCreatedDate:(id)a3
{
}

- (id)sharedItemCreatedTimeZoneName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CC8]];
}

- (void)setSharedItemCreatedTimeZoneName:(id)a3
{
}

- (id)sharedItemCreatedTimeZone
{
  uint64_t v2 = [(EKCalendarItem *)self sharedItemCreatedTimeZoneName];
  id v3 = +[EKCalendarItem timeZoneFromTimeZoneName:v2 withFloatingTimeZone:0];

  return v3;
}

- (void)setSharedItemCreatedTimeZone:(id)a3
{
  id v4 = +[EKCalendarItem timeZoneNameFromTimeZone:a3];
  [(EKCalendarItem *)self setSharedItemCreatedTimeZoneName:v4];
}

- (id)sharedItemModifiedByDisplayName
{
  id v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CD8]];
  if (!v3)
  {
    id v4 = [(EKCalendarItem *)self sharedItemModifiedByFirstName];
    int v5 = [(EKCalendarItem *)self sharedItemModifiedByLastName];
    id v3 = DisplayNameStringForIdentityWithProperties();
  }

  return v3;
}

- (void)setSharedItemModifiedByDisplayName:(id)a3
{
}

- (id)sharedItemModifiedByAddressString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CD0]];
}

- (void)setSharedItemModifiedByAddressString:(id)a3
{
}

- (id)sharedItemModifiedByAddress
{
  uint64_t v2 = [(EKCalendarItem *)self sharedItemModifiedByAddressString];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setSharedItemModifiedByAddress:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKCalendarItem *)self setSharedItemModifiedByAddressString:v4];
}

- (id)sharedItemModifiedByFirstName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CE0]];
}

- (void)setSharedItemModifiedByFirstName:(id)a3
{
}

- (id)sharedItemModifiedByLastName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CE8]];
}

- (void)setSharedItemModifiedByLastName:(id)a3
{
}

- (id)sharedItemModifiedDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CF0]];
}

- (void)setSharedItemModifiedDate:(id)a3
{
}

- (id)sharedItemModifiedTimeZoneName
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56CF8]];
}

- (void)setSharedItemModifiedTimeZoneName:(id)a3
{
}

- (id)sharedItemModifiedTimeZone
{
  uint64_t v2 = [(EKCalendarItem *)self sharedItemModifiedTimeZoneName];
  id v3 = +[EKCalendarItem timeZoneFromTimeZoneName:v2 withFloatingTimeZone:0];

  return v3;
}

- (void)setSharedItemModifiedTimeZone:(id)a3
{
  id v4 = +[EKCalendarItem timeZoneNameFromTimeZone:a3];
  [(EKCalendarItem *)self setSharedItemModifiedTimeZoneName:v4];
}

- (void)setAttachmentsSet:(id)a3
{
}

- (void)setAttachments:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [(EKCalendarItem *)self setAttachmentsSet:v4];
}

- (void)addAttachment:(id)a3
{
}

- (void)removeAttachment:(id)a3
{
}

- (BOOL)canMoveToCalendar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKCalendarItem *)self calendar];
  LOBYTE(a4) = [(EKCalendarItem *)self canMoveToCalendar:v6 fromCalendar:v7 error:a4];

  return (char)a4;
}

- (BOOL)canMoveToCalendar:(id)a3 fromCalendar:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v10 = [(EKObject *)self eventStore];
  if ([v10 eventAccessLevel] == 1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v12 = [(EKObject *)self eventStore];
      long long v13 = [(EKObject *)self CADObjectID];
      long long v14 = [v12 cachedConstraintsForEventOrSourceWithCADObjectID:v13];

      if (v14)
      {
        id v15 = v14;
        long long v16 = v15;
        if (!v9) {
          goto LABEL_13;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
  id v15 = [v9 constraints];
  long long v16 = 0;
  if (!v9) {
    goto LABEL_13;
  }
LABEL_10:
  if (([v9 allowsContentModifications] & 1) == 0
    && ([v9 isMutableSuggestionsCalendar] & 1) == 0
    && ([v9 isMutableNaturalLanguageSuggestionsCalendar] & 1) == 0)
  {
LABEL_20:
    if (a5)
    {
      uint64_t v25 = 6;
      goto LABEL_22;
    }
LABEL_26:
    char v24 = 0;
    goto LABEL_27;
  }
LABEL_13:
  if (([v8 allowsContentModifications] & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v17 = [(EKCalendarItem *)self organizer];
  if (!v17 || (v18 = (void *)v17, BOOL v19 = [(EKCalendarItem *)self hasAttendees], v18, !v19))
  {
    char v24 = 1;
    goto LABEL_27;
  }
  long long v20 = [v8 source];
  id v21 = [v9 source];
  char v22 = [v20 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    if (a5)
    {
      uint64_t v25 = 43;
      goto LABEL_22;
    }
    goto LABEL_26;
  }
  int v23 = [v15 requiresOutgoingInvitationsInDefaultCalendar];
  char v24 = v23 ^ 1;
  if (a5 && v23)
  {
    uint64_t v25 = 12;
LABEL_22:
    [MEMORY[0x1E4F28C58] errorWithEKErrorCode:v25];
    char v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:

  return v24;
}

- (id)propertiesThatCanBeModifiedOnReadOnlyCalendars
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(EKCalendarItem *)self calendar];
  uint64_t v3 = [v2 type];

  if (v3 == 4)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = *MEMORY[0x1E4F56BD0];
    v10[0] = *MEMORY[0x1E4F56B98];
    v10[1] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    id v7 = (id)[v4 setWithArray:v6];
  }
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56D28]];

  return v8;
}

- (BOOL)validate:(id *)a3
{
  id v6 = [(EKObject *)self changeSet];
  int v7 = [v6 hasUnsavedChangeForKey:*MEMORY[0x1E4F56BD8]];

  if (!v7)
  {
    v33.receiver = self;
    v33.super_class = (Class)EKCalendarItem;
    BOOL v11 = [(EKObject *)&v33 validate:a3];
    if (!v11) {
      return v11;
    }
    uint64_t v12 = [(EKCalendarItem *)self calendar];

    if (!v12)
    {
      if (a3)
      {
        id v8 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v9 = 1;
        goto LABEL_4;
      }
      goto LABEL_37;
    }
    long long v13 = [(EKCalendarItem *)self calendar];
    if (([v13 allowsContentModifications] & 1) == 0)
    {
      long long v14 = [(EKCalendarItem *)self calendar];
      if (([v14 isMutableSuggestionsCalendar] & 1) == 0)
      {
        id v15 = [(EKCalendarItem *)self calendar];
        if (([v15 isMutableNaturalLanguageSuggestionsCalendar] & 1) == 0)
        {
          long long v16 = [(EKObject *)self eventStore];
          if (([v16 skipModificationValidation] & 1) == 0)
          {
            long long v29 = [(EKCalendarItem *)self propertiesThatCanBeModifiedOnReadOnlyCalendars];
            BOOL v30 = [(EKObject *)self _areOnlyChangedKeys:v29];

            if (!v30)
            {
              if (a3)
              {
                id v8 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v9 = 6;
                goto LABEL_4;
              }
              goto LABEL_37;
            }
            goto LABEL_15;
          }
        }
      }
    }
LABEL_15:
    uint64_t v17 = *MEMORY[0x1E4F56BB0];
    if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BB0]]
      && ![(EKObject *)self isNew])
    {
      uint64_t v18 = [(EKObject *)self committedValueForKey:v17];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2 object:self file:@"EKCalendarItem.m" lineNumber:1934 description:@"Committed Value class is incorrect!"];
      }
      BOOL v19 = [(EKCalendarItem *)self calendar];
      BOOL v20 = [(EKCalendarItem *)self canMoveToCalendar:v19 fromCalendar:v18 error:a3];

      if (!v20) {
        goto LABEL_37;
      }
    }
    id v21 = [(EKCalendarItem *)self constraints];
    if ([v21 supportsStructuredLocations]) {
      goto LABEL_23;
    }
    char v22 = [(EKCalendarItem *)self calendar];
    if ([v22 isSuggestedEventCalendar])
    {

LABEL_23:
LABEL_24:
      LOBYTE(v11) = 1;
      return v11;
    }
    int v23 = [(EKCalendarItem *)self calendar];
    char v24 = [v23 isNaturalLanguageSuggestedEventCalendar];

    if (v24) {
      goto LABEL_24;
    }
    if (![(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56D10]]
      || ([(EKCalendarItem *)self structuredLocation],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          int v26 = [v25 isStructured],
          v25,
          !v26))
    {
      if (![(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56D30]]) {
        goto LABEL_24;
      }
      id v27 = [(EKCalendarItem *)self travelStartLocation];
      int v28 = [v27 isStructured];

      if (!v28) {
        goto LABEL_24;
      }
    }
    if (a3)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = 19;
      goto LABEL_4;
    }
LABEL_37:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (!a3) {
    goto LABEL_37;
  }
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = 67;
LABEL_4:
  id v10 = [v8 errorWithEKErrorCode:v9];
  LOBYTE(v11) = 0;
  *a3 = v10;
  return v11;
}

- (void)moveToCalendar:(id)a3
{
}

+ (BOOL)_shouldDeleteAndAddForMoveFromCalendar:(id)a3 toCalendar:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 source];
  id v8 = [v6 source];

  if ([v7 isEqual:v8])
  {
    uint64_t v9 = [v5 constraints];
    char v10 = [v9 shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)hasCalendarChangeThatRequiresDeleteAndAdd
{
  uint64_t v3 = *MEMORY[0x1E4F56BB0];
  BOOL v4 = [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BB0]];
  if (v4)
  {
    id v5 = [(EKCalendarItem *)self calendar];
    id v6 = [(EKObject *)self _previousValueForKey:v3];
    int v7 = [(EKObject *)self eventStore];
    id v8 = [v6 meltedObjectInStore:v7];

    char v9 = [(id)objc_opt_class() _shouldDeleteAndAddForMoveFromCalendar:v8 toCalendar:v5];
    LOBYTE(v4) = v9;
  }
  return v4;
}

- (BOOL)hasRecurrenceRuleAdditionOrRemoval
{
  BOOL v3 = [(EKCalendarItem *)self _hadRecurrenceRules];
  return v3 ^ [(EKCalendarItem *)self hasRecurrenceRules];
}

- (void)_moveToCalendar:(id)a3 forSavingItem:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (EKCalendarItem *)a4;
  id v8 = [(EKCalendarItem *)self originalItem];
  char v9 = v8;
  if (!v8)
  {
    char v10 = [(EKObject *)self _previousValueForKey:*MEMORY[0x1E4F56BB0]];
    BOOL v11 = [(EKObject *)self eventStore];
    uint64_t v12 = [v10 meltedObjectInStore:v11];

    if ([v12 isEqual:v6])
    {
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v37 = v12;
    if ([(id)objc_opt_class() _shouldDeleteAndAddForMoveFromCalendar:v12 toCalendar:v6])
    {
      if (_moveToCalendar_forSavingItem__onceToken != -1) {
        dispatch_once(&_moveToCalendar_forSavingItem__onceToken, &__block_literal_global_119);
      }
      long long v13 = [(EKCalendarItem *)self detachedItems];
      uint64_t v14 = [v13 count];

      id v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v14 + 1];
      long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v14];
      uint64_t v17 = [(EKObject *)v7 changeSet];
      uint64_t v18 = (void *)[v17 copy];
      [v18 removeAllChangesExceptRemovals];
      id v19 = [(EKObject *)v7 copyMeltedObjectCache];
      [(EKObject *)v7 setChangeSet:v18];
      [(EKObject *)v7 _resetAfterUpdatingChangeSetOrBackingObject];
      [(EKCalendarItem *)v7 setCalendar:v6];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_2;
      v48[3] = &unk_1E5B97708;
      id v20 = v15;
      id v49 = v20;
      long long v50 = self;
      id v21 = v7;
      long long v51 = v21;
      id v22 = v16;
      id v52 = v22;
      [(EKCalendarItem *)self _recursivelyPerformBlockOnSelfAndDetachedItems:v48 forSavingItem:v21];
      [(EKObject *)v21 updatePersistentObject];
      [(EKObject *)v21 setChangeSet:v17];
      [(EKObject *)v21 _resetAfterUpdatingChangeSetOrBackingObject];
      [(EKObject *)v21 augmentMeltedObjectCache:v19];
      [(EKObject *)self setCachedMeltedObjects:v22 forMultiValueKey:*MEMORY[0x1E4F56BD8]];
      if (v21 != self) {
        [(EKCalendarItem *)v21 setOriginalItem:self];
      }
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_3;
      v47[3] = &unk_1E5B97730;
      v47[4] = self;
      [(EKCalendarItem *)self _recursivelyPerformBlockOnSelfAndDetachedItems:v47 forSavingItem:v21];
    }
    else
    {
      id v20 = 0;
    }
    [(EKCalendarItem *)self _setCalendarRecursively:v6 forSavingItem:v7];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v23 = v20;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          long long v29 = [(EKObject *)self eventStore];
          [v29 _deleteObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v25);
    }

    if (self != v7)
    {
      BOOL v30 = [(EKObject *)self eventStore];
      [v30 _addObjectToPendingCommits:self];
    }
    long long v31 = [(EKObject *)self eventStore];
    uint64_t v12 = v37;
    if ([v31 eventAccessLevel] == 1)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v34 = 0;
        goto LABEL_26;
      }
      long long v31 = [(EKObject *)self eventStore];
      objc_super v33 = [(EKObject *)self CADObjectID];
      uint64_t v34 = [v31 cachedConstraintsForEventOrSourceWithCADObjectID:v33];
    }
    else
    {
      uint64_t v34 = 0;
    }

LABEL_26:
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_4;
    v38[3] = &unk_1E5B97708;
    id v39 = v37;
    id v40 = v6;
    id v41 = v34;
    uint64_t v35 = v7;
    v42 = v35;
    id v36 = v34;
    [(EKCalendarItem *)self _recursivelyPerformBlockOnSelfAndDetachedItems:v38 forSavingItem:v35];
    [(EKCalendarItem *)self _updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:v35];

    goto LABEL_27;
  }
  [v8 _moveToCalendar:v6 forSavingItem:v7];
LABEL_28:
}

void __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F56D28];
  v6[0] = *MEMORY[0x1E4F56F50];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56C88];
  v6[2] = *MEMORY[0x1E4F56BD8];
  v6[3] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  id v5 = (void *)_moveToCalendar_forSavingItem__propertiesToSkip;
  _moveToCalendar_forSavingItem__propertiesToSkip = v4;
}

void __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_2(id *a1, void *a2)
{
  id v14 = a2;
  BOOL v3 = [v14 persistentObject];
  [a1[4] addObject:v3];
  uint64_t v4 = [v14 calendarItemIdentifier];
  id v5 = [v14 selfAttendee];
  [v14 rebaseSkippingRelationProperties:_moveToCalendar_forSavingItem__propertiesToSkip];
  [v14 setCalendarItemIdentifier:v4];
  id v6 = [v14 persistentObject];
  [v6 addCoCommitObject:v3];

  [v14 insertPersistentObjectIfNeeded];
  if (v5)
  {
    int v7 = [v14 changeSet];
    id v8 = [v5 persistentObject];
    [v7 forceChangeValue:v8 forKey:*MEMORY[0x1E4F56C88]];
  }
  if (a1[5] != v14)
  {
    char v9 = [v14 frozenObject];
    [a1[5] addMultiChangedObjectValue:v9 forKey:*MEMORY[0x1E4F56BD8]];
    char v10 = [a1[5] persistentObject];
    [v10 addCoCommitObject:v9];

    id v11 = a1[7];
    if (a1[6] == v14)
    {
      uint64_t v12 = [a1[5] eventStore];
      long long v13 = [v9 meltedObjectInStore:v12];
      [v11 addObject:v13];
    }
    else
    {
      objc_msgSend(a1[7], "addObject:");
    }
  }
}

void __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _generateNewUniqueID];
  [v3 setUniqueID:v4];
}

uint64_t __48__EKCalendarItem__moveToCalendar_forSavingItem___block_invoke_4(void *a1, void *a2)
{
  return [a2 _adjustAfterMovingOrCopyingFromOldCalendar:a1[4] toNewCalendar:a1[5] cachedConstraintsForOldCalendar:a1[6] savingItem:a1[7]];
}

- (void)_updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__EKCalendarItem__updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem___block_invoke;
  v6[3] = &unk_1E5B97730;
  id v7 = v4;
  id v5 = v4;
  [(EKCalendarItem *)self _recursivelyPerformBlockOnSelfAndDetachedItems:v6 forSavingItem:v5];
}

void __83__EKCalendarItem__updatePersistentObjectOfSelfAndDetachedItemsExceptForSavingItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void **)(a1 + 32) != a2)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = *MEMORY[0x1E4F56BD8];
    id v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a2;
    id v5 = [v3 arrayWithObjects:&v7 count:1];
    id v6 = objc_msgSend(v2, "setWithArray:", v5, v7, v8);
    [v4 updatePersistentObjectSkippingProperties:v6];

    [v4 insertPersistentObjectIfNeeded];
  }
}

- (void)_setCalendarRecursively:(id)a3 forSavingItem:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__EKCalendarItem__setCalendarRecursively_forSavingItem___block_invoke;
  v8[3] = &unk_1E5B97730;
  id v9 = v6;
  id v7 = v6;
  [(EKCalendarItem *)self _recursivelyPerformBlockOnSelfAndDetachedItems:v8 forSavingItem:a4];
}

void __56__EKCalendarItem__setCalendarRecursively_forSavingItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setCalendar:v2];
  [v3 _resetFieldsAfterMovingToNewCalendar];
}

- (void)_resetFieldsAfterMovingToNewCalendar
{
}

- (void)_recursivelyPerformBlockOnSelfAndDetachedItems:(id)a3 forSavingItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, id))a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = v8;
  if ([(EKObject *)v8 isEqual:v7])
  {
    id v9 = (EKCalendarItem *)v7;
  }
  char v10 = [(EKCalendarItem *)v8 detachedItems];
  v6[2](v6, v9);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "_recursivelyPerformBlockOnSelfAndDetachedItems:forSavingItem:", v6, v7, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)setOriginalItem:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EKCalendarItem.m" lineNumber:2193 description:@"Original item class must match our class"];
    }
  }
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v7, *MEMORY[0x1E4F56C68], [(id)objc_opt_class() frozenClass]);
}

- (void)setDetachedItems:(id)a3
{
}

- (void)_removeDetachedItem:(id)a3
{
}

- (void)_deleteSelfAndDetached
{
  id v3 = [(EKObject *)self persistentObject];
  [(EKCalendarItem *)self _deletePersistentItemAndDetachedItems:v3 forSavingItem:self];
}

- (void)setEkExceptionDates:(id)a3
{
}

- (id)exceptionDatesAdjustedForFloatingEvents
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(EKCalendarItem *)self isFloating] && ![(EKCalendarItem *)self isAllDay])
  {
    id v4 = [(EKCalendarItem *)self exceptionDates];
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          char v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [(EKCalendarItem *)self timeZone];
          uint64_t v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            uint64_t v14 = [(EKObject *)self eventStore];
            id v13 = [v14 timeZone];
          }
          uint64_t v15 = [v10 dateInTimeZone:v13 fromTimeZone:0];
          [v3 addObject:v15];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v3 = [(EKCalendarItem *)self exceptionDates];
  }

  return v3;
}

- (void)setExceptionDates:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
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
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [EKExceptionDate alloc];
        id v13 = -[EKExceptionDate initWithDate:](v12, "initWithDate:", v11, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(EKCalendarItem *)self setEkExceptionDates:v5];
}

- (void)_addExceptionDate:(id)a3
{
  id v4 = a3;
  id v5 = [[EKExceptionDate alloc] initWithDate:v4];

  [(EKObject *)self addCachedMeltedObject:v5 forMultiValueKey:*MEMORY[0x1E4F56BE0]];
}

- (void)_removeExceptionDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(EKCalendarItem *)self ekExceptionDates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      uint64_t v11 = [v10 date];
      char v12 = [v11 isEqualToDate:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    [(EKObject *)self removeCachedMeltedObject:v13 forMultiValueKey:*MEMORY[0x1E4F56BE0]];
    id v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)_deletePersistentItemAndDetachedItems:(id)a3 forSavingItem:(id)a4
{
  id v6 = a3;
  [(EKCalendarItem *)self _recursivelyPerformBlockOnSelfAndDetachedItems:&__block_literal_global_129 forSavingItem:a4];
  id v7 = [(EKObject *)self eventStore];
  [v7 _deleteObject:v6];
}

uint64_t __70__EKCalendarItem__deletePersistentItemAndDetachedItems_forSavingItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDetachedItems:0];
}

- (void)_updateModifiedAlarmByAcknowledging
{
  BOOL v3 = [(EKCalendarItem *)self isOnlyAlarmAcknowledgedPropertyDirty];
  unsigned int v4 = [(EKCalendarItem *)self modifiedProperties];
  if (v3)
  {
    uint64_t v5 = v4 | 0x1000;
  }
  else
  {
    if ((v4 & 0x1000) == 0) {
      return;
    }
    uint64_t v5 = [(EKCalendarItem *)self modifiedProperties] & 0xFFFFEFFFLL;
  }

  [(EKCalendarItem *)self setModifiedProperties:v5];
}

- (void)_willSave
{
  BOOL v3 = [(EKCalendarItem *)self uniqueID];

  if (!v3)
  {
    id v4 = [(EKCalendarItem *)self _generateNewUniqueID];
    [(EKCalendarItem *)self setUniqueID:v4];
  }
}

+ (id)timeZoneNameFromTimeZone:(id)a3
{
  if (a3)
  {
    id v4 = [a3 name];
  }
  else
  {
    id v4 = @"_float";
  }
  return v4;
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v14 isEqualToString:*MEMORY[0x1E4F56C40]])
  {
    unsigned __int8 v17 = 1;
  }
  else
  {
    v19.receiver = a1;
    v19.super_class = (Class)&OBJC_METACLASS___EKCalendarItem;
    unsigned __int8 v17 = objc_msgSendSuper2(&v19, sel_canonicalizedEqualityTestValue1_value2_key_object1_object2_, v12, v13, v14, v15, v16);
  }

  return v17;
}

- (void)updateWithVCSEntity:(id)a3 inCalendar:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v6 = a4;
  id v7 = [(EKCalendarItem *)self timeZone];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(EKObject *)self eventStore];
    id v9 = [v10 timeZone];
  }
  long long v66 = v6;
  [(EKCalendarItem *)self setCalendar:v6];
  uint64_t v11 = [v68 propertyForName:@"DESCRIPTION"];
  id v12 = [v11 singleValue];
  id v13 = [v12 value];
  [(EKCalendarItem *)self setNotes:v13];

  id v14 = [v68 propertyForName:@"SEQUENCE"];
  id v15 = [v14 singleValue];
  id v16 = [v15 value];
  -[EKCalendarItem setSequenceNumber:](self, "setSequenceNumber:", [v16 intValue]);

  unsigned __int8 v17 = [v68 propertyForName:@"CREATED"];
  long long v18 = [v17 singleValue];
  objc_super v19 = [v18 value];

  long long v65 = v19;
  v71 = v9;
  long long v20 = [v19 nsDateWithLocalTimeZone:v9];
  [(EKCalendarItem *)self setCreationDate:v20];

  uint64_t v21 = [v68 propertyForName:@"SUMMARY"];
  uint64_t v22 = [v21 singleValue];
  uint64_t v23 = [v22 value];
  uint64_t v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  else {
    uint64_t v25 = &stru_1EF932508;
  }
  [(EKCalendarItem *)self setTitle:v25];

  uint64_t v26 = [v68 propertyForName:@"URL"];
  id v27 = [v26 singleValue];
  uint64_t v28 = [v27 value];
  long long v67 = self;
  [(EKCalendarItem *)self setURL:v28];

  long long v29 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v30 = [v68 alarms];
  v70 = objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v31 = [v68 alarms];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v77 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        uint64_t v37 = [v36 triggerType];
        if (v37 == 1)
        {
          [v36 triggerDuration];
          id v40 = +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:");
        }
        else if (v37)
        {
          id v40 = 0;
        }
        else
        {
          v38 = [v36 triggerDate];
          id v39 = [v38 nsDateWithLocalTimeZone:v9];

          id v40 = +[EKAlarm alarmWithAbsoluteDate:v39];
        }
        unint64_t v41 = [v36 alarmType];
        if (v41 <= 3) {
          [v40 setType:qword_1A4F8FE20[v41]];
        }
        if ([v40 type] != 3 && objc_msgSend(v40, "type") != 2) {
          [v70 addObject:v40];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v76 objects:v81 count:16];
    }
    while (v33);
  }

  [(EKCalendarItem *)v67 setAlarms:v70];
  v42 = [v68 propertyForName:@"ATTACH"];
  long long v43 = [v42 values];

  long long v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v43, "count"));
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v45 = v43;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = 1;
    id v49 = &off_1E5B96000;
    uint64_t v50 = *(void *)v73;
    do
    {
      uint64_t v51 = 0;
      uint64_t v69 = v47;
      do
      {
        if (*(void *)v73 != v50) {
          objc_enumerationMutation(v45);
        }
        id v52 = *(void **)(*((void *)&v72 + 1) + 8 * v51);
        id v53 = objc_alloc_init((Class)v49[30]);
        uint64_t v54 = [v52 value];
        [v53 setURL:v54];

        long long v55 = [v53 fileNameRaw];
        uint64_t v56 = [v55 length];

        if (!v56)
        {
          if (v48 == 1)
          {
            long long v57 = [MEMORY[0x1E4F28B50] mainBundle];
            long long v58 = [v57 localizedStringForKey:@"Attachment" value:&stru_1EF932508 table:0];
          }
          else
          {
            long long v59 = NSString;
            long long v57 = [MEMORY[0x1E4F28B50] mainBundle];
            [v57 localizedStringForKey:@"Attachment %lu" value:&stru_1EF932508 table:0];
            uint64_t v60 = v50;
            long long v61 = v44;
            long long v62 = v49;
            v64 = id v63 = v45;
            long long v58 = objc_msgSend(v59, "localizedStringWithFormat:", v64, v48);

            id v45 = v63;
            id v49 = v62;
            long long v44 = v61;
            uint64_t v50 = v60;
            uint64_t v47 = v69;
          }

          [v53 setFileNameRaw:v58];
          ++v48;
        }
        [v44 addObject:v53];

        ++v51;
      }
      while (v47 != v51);
      uint64_t v47 = [v45 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v47);
  }

  [(EKCalendarItem *)v67 setAttachments:v44];
}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  if (EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_142 != -1) {
    dispatch_once(&EKObjectChangeSummarizer_singleValueDiffKeys_onceToken_142, &__block_literal_global_144);
  }
  uint64_t v2 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_141;

  return v2;
}

void __88__EKCalendarItem_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke()
{
  v8[11] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56D40];
  v7[0] = *MEMORY[0x1E4F56BB0];
  v7[1] = v0;
  v8[0] = @"EKChangedCalendar";
  v8[1] = @"EKChangedTitle";
  uint64_t v1 = *MEMORY[0x1E4F56C58];
  v7[2] = *MEMORY[0x1E4F56D10];
  v7[3] = v1;
  v8[2] = @"EKChangedLocation";
  v8[3] = @"EKChangedNotes";
  uint64_t v2 = *MEMORY[0x1E4F56D08];
  v7[4] = *MEMORY[0x1E4F56C38];
  v7[5] = v2;
  void v8[4] = @"EKChangedAllDay";
  void v8[5] = @"EKChangedTimeZone";
  uint64_t v3 = *MEMORY[0x1E4F56B88];
  v7[6] = *MEMORY[0x1E4F56D00];
  v7[7] = v3;
  v8[6] = @"EKChangedStartDate";
  v8[7] = @"EKChangedURL";
  uint64_t v4 = *MEMORY[0x1E4F56C98];
  v7[8] = *MEMORY[0x1E4F56C78];
  v7[9] = v4;
  v8[8] = @"EKChangedPriority";
  v8[9] = @"EKChangedSequence";
  v7[10] = *MEMORY[0x1E4F56C18];
  v8[10] = @"EKChangedFlags";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:11];
  id v6 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_141;
  EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys_141 = v5;
}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  if (EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_146 != -1) {
    dispatch_once(&EKObjectChangeSummarizer_multiValueDiffKeys_onceToken_146, &__block_literal_global_148);
  }
  uint64_t v2 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_145;

  return v2;
}

void __87__EKCalendarItem_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F56B98];
  v6[0] = @"add";
  v6[1] = @"remove";
  v7[0] = @"EKChangedAlarmsAdded";
  v7[1] = @"EKChangedAlarmsRemoved";
  v6[2] = @"modify";
  v7[2] = @"EKChangedAlarmsModified";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  v8[1] = *MEMORY[0x1E4F56C80];
  v9[0] = v0;
  v4[0] = @"add";
  v4[1] = @"remove";
  v5[0] = @"EKChangedRecurrenceRule";
  v5[1] = @"EKChangedRecurrenceRule";
  v4[2] = @"modify";
  v5[2] = @"EKChangedRecurrenceRule";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v9[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v3 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_145;
  EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys_145 = v2;
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)_generateNewUniqueID
{
  return 0;
}

- (void)selfAttendee
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_ERROR, "selfAttendee is not an attendee; it's a %{public}@. Ignoring invalid selfAttendee and pretending there is no self attendee.",
    (uint8_t *)&v3,
    0xCu);
}

- (void)setSelfAttendee:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "Attempting to set the same selfAttendee using a different EKAttendee instance. There is no work to be done, but if the passed in instance had changes then they will not be saved when this calendar item is saved.", v1, 2u);
}

- (void)setSelfAttendee:(void *)a1 .cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_fault_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_FAULT, "Ignoring attempt to set the selfAttendee to something that's not an attendee (%{public}@)", (uint8_t *)&v3, 0xCu);
}

@end