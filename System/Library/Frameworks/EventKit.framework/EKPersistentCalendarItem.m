@interface EKPersistentCalendarItem
+ (id)defaultPropertiesToLoad;
+ (id)propertiesToUnloadOnCommit;
+ (id)propertyKeyForUniqueIdentifier;
+ (id)relations;
- (BOOL)defaultAlarmWasDeleted;
- (BOOL)hasAttendees;
- (BOOL)hasNotes;
- (BOOL)hasRecurrenceRules;
- (BOOL)isAllDay;
- (BOOL)phantomMaster;
- (BOOL)suppressNotificationForChanges;
- (id)URLString;
- (id)UUID;
- (id)actionString;
- (id)allAlarmsSet;
- (id)attachmentsSet;
- (id)attendeesRaw;
- (id)calendar;
- (id)calendarScale;
- (id)clientLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)creationDate;
- (id)detachedItems;
- (id)ekExceptionDates;
- (id)endLocation;
- (id)endTimeZoneName;
- (id)externalData;
- (id)externalID;
- (id)externalModificationTag;
- (id)externalScheduleID;
- (id)lastModifiedDate;
- (id)localStructuredData;
- (id)notes;
- (id)organizer;
- (id)originalItem;
- (id)recurrenceRulesSet;
- selfAttendee;
- (id)sharedItemCreatedByAddressString;
- (id)sharedItemCreatedByDisplayName;
- (id)sharedItemCreatedByFirstName;
- (id)sharedItemCreatedByLastName;
- (id)sharedItemCreatedDate;
- (id)sharedItemCreatedTimeZoneName;
- (id)sharedItemModifiedByAddressString;
- (id)sharedItemModifiedByDisplayName;
- (id)sharedItemModifiedByFirstName;
- (id)sharedItemModifiedByLastName;
- (id)sharedItemModifiedDate;
- (id)sharedItemModifiedTimeZoneName;
- (id)singleRecurrenceRule;
- (id)startDateRaw;
- (id)startTimeZoneName;
- (id)structuredData;
- (id)structuredLocationWithoutPrediction;
- (id)syncError;
- (id)travelStartLocation;
- (id)uniqueID;
- (id)unlocalizedTitle;
- (int)flags;
- (int)priority;
- (int)selfParticipantStatusRaw;
- (int)sequenceNumber;
- (unsigned)modifiedProperties;
- (void)addAlarm:(id)a3;
- (void)addAttendee:(id)a3;
- (void)addRecurrenceRule:(id)a3;
- (void)removeAlarm:(id)a3;
- (void)removeAttendee:(id)a3;
- (void)removeRecurrenceRule:(id)a3;
- (void)setActionString:(id)a3;
- (void)setAllAlarmsSet:(id)a3;
- (void)setAttachmentsSet:(id)a3;
- (void)setAttendeesRaw:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setCalendarScale:(id)a3;
- (void)setClientLocation:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDefaultAlarmWasDeleted:(BOOL)a3;
- (void)setDetachedItems:(id)a3;
- (void)setEkExceptionDates:(id)a3;
- (void)setEndLocation:(id)a3;
- (void)setEndTimeZoneName:(id)a3;
- (void)setExternalData:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalScheduleID:(id)a3;
- (void)setFlags:(int)a3;
- (void)setHasAttendees:(BOOL)a3;
- (void)setHasNotes:(BOOL)a3;
- (void)setHasRecurrenceRules:(BOOL)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setLocalStructuredData:(id)a3;
- (void)setModifiedProperties:(unsigned int)a3;
- (void)setNotes:(id)a3;
- (void)setOrganizer:(id)a3;
- (void)setOriginalItem:(id)a3;
- (void)setPhantomMaster:(BOOL)a3;
- (void)setPriority:(int)a3;
- (void)setRecurrenceRulesSet:(id)a3;
- (void)setSelfAttendee:(id)a3;
- (void)setSelfParticipantStatusRaw:(int)a3;
- (void)setSequenceNumber:(int)a3;
- (void)setSharedItemCreatedByAddressString:(id)a3;
- (void)setSharedItemCreatedByDisplayName:(id)a3;
- (void)setSharedItemCreatedByFirstName:(id)a3;
- (void)setSharedItemCreatedByLastName:(id)a3;
- (void)setSharedItemCreatedDate:(id)a3;
- (void)setSharedItemCreatedTimeZoneName:(id)a3;
- (void)setSharedItemModifiedByAddressString:(id)a3;
- (void)setSharedItemModifiedByDisplayName:(id)a3;
- (void)setSharedItemModifiedByFirstName:(id)a3;
- (void)setSharedItemModifiedByLastName:(id)a3;
- (void)setSharedItemModifiedDate:(id)a3;
- (void)setSharedItemModifiedTimeZoneName:(id)a3;
- (void)setStartDateRaw:(id)a3;
- (void)setStartTimeZoneName:(id)a3;
- (void)setStructuredData:(id)a3;
- (void)setStructuredLocationWithoutPrediction:(id)a3;
- (void)setSuppressNotificationForChanges:(BOOL)a3;
- (void)setSyncError:(id)a3;
- (void)setTravelStartLocation:(id)a3;
- (void)setURLString:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUnlocalizedTitle:(id)a3;
@end

@implementation EKPersistentCalendarItem

- (id)startTimeZoneName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56D08]];
}

- (id)unlocalizedTitle
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56D40]];
}

- (id)clientLocation
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56BC0]];
}

- (id)originalItem
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56C68]];
}

- (id)startDateRaw
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56D00]];
}

- (BOOL)hasRecurrenceRules
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56C30]];
}

- (BOOL)isAllDay
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56C38]];
}

- (int)flags
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56C18]];
}

- (id)calendar
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56BB0]];
}

- (id)uniqueID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56D38]];
}

- selfAttendee
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56C88]];
}

- (id)structuredLocationWithoutPrediction
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56D10]];
}

- (id)travelStartLocation
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56D30]];
}

- (id)attendeesRaw
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56BA8]];
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (id)notes
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56C58]];
}

- (id)endTimeZoneName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56BF0]];
}

- (id)attachmentsSet
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56BA0]];
}

- (id)URLString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56B88]];
}

- (id)recurrenceRulesSet
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56C80]];
}

void __37__EKPersistentCalendarItem_relations__block_invoke()
{
  id v38 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v42 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56A88]];
  v46 = +[EKRelation relationWithEntityName:@"Alarm" toMany:1 inversePropertyNames:v42];
  uint64_t v36 = *MEMORY[0x1E4F56B98];
  uint64_t v0 = *MEMORY[0x1E4F57160];
  v41 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57160]];
  v45 = +[EKRelation relationWithEntityName:@"Attachment" toMany:1 inversePropertyNames:v41];
  uint64_t v35 = *MEMORY[0x1E4F56BA0];
  v40 = [MEMORY[0x1E4F1CAD0] setWithObject:v0];
  v44 = +[EKRelation relationWithEntityName:@"Attendee" toMany:1 inversePropertyNames:v40];
  uint64_t v33 = *MEMORY[0x1E4F56BA8];
  v39 = [MEMORY[0x1E4F1CAD0] setWithObject:v0];
  v43 = +[EKRelation relationWithEntityName:@"ExceptionDate" toMany:1 inversePropertyNames:v39];
  uint64_t v32 = *MEMORY[0x1E4F56BE0];
  v37 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57220]];
  v30 = +[EKRelation relationWithEntityName:@"RecurrenceRule" toMany:1 inversePropertyNames:v37];
  uint64_t v29 = *MEMORY[0x1E4F56C80];
  v27 = +[EKRelation relationWithEntityName:@"Calendar" toMany:0 inversePropertyNames:0 ownsRelated:0];
  uint64_t v26 = *MEMORY[0x1E4F56BB0];
  v34 = [MEMORY[0x1E4F1CAD0] setWithObject:v0];
  v25 = +[EKRelation relationWithEntityName:@"Organizer" toMany:0 inversePropertyNames:v34];
  uint64_t v24 = *MEMORY[0x1E4F56C60];
  v22 = +[EKRelation relationWithEntityName:@"Attendee" toMany:0 inversePropertyNames:0];
  uint64_t v21 = *MEMORY[0x1E4F56C88];
  uint64_t v1 = *MEMORY[0x1E4F57088];
  v31 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57088]];
  v19 = +[EKRelation relationWithEntityName:@"Location" toMany:0 inversePropertyNames:v31];
  uint64_t v18 = *MEMORY[0x1E4F56D10];
  v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v1];
  v17 = +[EKRelation relationWithEntityName:@"ClientLocation" toMany:0 inversePropertyNames:v28];
  uint64_t v16 = *MEMORY[0x1E4F56BC0];
  v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v1];
  v12 = +[EKRelation relationWithEntityName:@"StartLocation" toMany:0 inversePropertyNames:v23];
  uint64_t v14 = *MEMORY[0x1E4F56D30];
  v20 = [MEMORY[0x1E4F1CAD0] setWithObject:@"calendarItemOwner"];
  v11 = +[EKRelation relationWithEntityName:@"EndLocation" toMany:0 inversePropertyNames:v20];
  uint64_t v13 = *MEMORY[0x1E4F56BE8];
  uint64_t v2 = *MEMORY[0x1E4F56C68];
  v15 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56C68]];
  v10 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:1 inversePropertyNames:v15];
  uint64_t v3 = *MEMORY[0x1E4F56BD8];
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56BD8]];
  v5 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56F00]];
  v7 = +[EKRelation relationWithEntityName:@"Error" toMany:0 inversePropertyNames:v6];
  uint64_t v8 = objc_msgSend(v38, "initWithObjectsAndKeys:", v46, v36, v45, v35, v44, v33, v43, v32, v30, v29, v27, v26, v25, v24, v22, v21, v19,
         v18,
         v17,
         v16,
         v12,
         v14,
         v11,
         v13,
         v10,
         v3,
         v5,
         v2,
         v7,
         *MEMORY[0x1E4F56D28],
         0);
  v9 = (void *)relations_relations_17;
  relations_relations_17 = v8;
}

+ (id)relations
{
  if (relations_onceToken_17 != -1) {
    dispatch_once(&relations_onceToken_17, &__block_literal_global_72);
  }
  uint64_t v2 = (void *)relations_relations_17;

  return v2;
}

- (id)ekExceptionDates
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56BE0]];
}

- (id)detachedItems
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56BD8]];
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E4F57150];
}

+ (id)defaultPropertiesToLoad
{
  return 0;
}

+ (id)propertiesToUnloadOnCommit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__EKPersistentCalendarItem_propertiesToUnloadOnCommit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToUnloadOnCommit_onceToken_2 != -1) {
    dispatch_once(&propertiesToUnloadOnCommit_onceToken_2, block);
  }
  uint64_t v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;

  return v2;
}

void __54__EKPersistentCalendarItem_propertiesToUnloadOnCommit__block_invoke(uint64_t a1)
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___EKPersistentCalendarItem;
  uint64_t v1 = objc_msgSendSuper2(&v10, sel_propertiesToUnloadOnCommit);
  uint64_t v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2 = v1;

  uint64_t v3 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;
  uint64_t v4 = *MEMORY[0x1E4F56C20];
  v11[0] = *MEMORY[0x1E4F56C28];
  v11[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F56C90];
  v11[2] = *MEMORY[0x1E4F56C30];
  v11[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F56F88];
  v11[4] = *MEMORY[0x1E4F56D20];
  v11[5] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];
  uint64_t v8 = [v3 arrayByAddingObjectsFromArray:v7];
  v9 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_2 = v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = EKUUIDString();
  [v4 setUUID:v5];

  uint64_t v6 = [(EKPersistentCalendarItem *)self calendar];
  [v4 setCalendar:v6];

  objc_msgSend(v4, "setIsAllDay:", -[EKPersistentCalendarItem isAllDay](self, "isAllDay"));
  v7 = [(EKPersistentCalendarItem *)self startDateRaw];
  [v4 setStartDateRaw:v7];

  uint64_t v8 = [(EKPersistentCalendarItem *)self startTimeZoneName];
  [v4 setStartTimeZoneName:v8];

  v9 = [(EKPersistentCalendarItem *)self endTimeZoneName];
  [v4 setEndTimeZoneName:v9];

  objc_super v10 = [(EKPersistentCalendarItem *)self unlocalizedTitle];
  [v4 setUnlocalizedTitle:v10];

  v11 = [(EKPersistentCalendarItem *)self notes];
  [v4 setNotes:v11];

  v12 = [(EKPersistentCalendarItem *)self URLString];
  [v4 setURLString:v12];

  objc_msgSend(v4, "setSequenceNumber:", -[EKPersistentCalendarItem sequenceNumber](self, "sequenceNumber"));
  uint64_t v13 = [(EKPersistentCalendarItem *)self calendarScale];
  [v4 setCalendarScale:v13];

  objc_msgSend(v4, "setPriority:", -[EKPersistentCalendarItem priority](self, "priority"));
  uint64_t v14 = [(EKPersistentCalendarItem *)self actionString];
  [v4 setActionString:v14];

  v15 = [(EKPersistentCalendarItem *)self structuredData];
  [v4 setStructuredData:v15];

  uint64_t v16 = [(EKPersistentCalendarItem *)self localStructuredData];
  [v4 setLocalStructuredData:v16];

  objc_msgSend(v4, "setDefaultAlarmWasDeleted:", -[EKPersistentCalendarItem defaultAlarmWasDeleted](self, "defaultAlarmWasDeleted"));
  v17 = [(EKPersistentCalendarItem *)self sharedItemCreatedByDisplayName];
  [v4 setSharedItemCreatedByDisplayName:v17];

  uint64_t v18 = [(EKPersistentCalendarItem *)self sharedItemCreatedByAddressString];
  [v4 setSharedItemCreatedByAddressString:v18];

  v19 = [(EKPersistentCalendarItem *)self sharedItemCreatedByFirstName];
  [v4 setSharedItemCreatedByFirstName:v19];

  v20 = [(EKPersistentCalendarItem *)self sharedItemCreatedByLastName];
  [v4 setSharedItemCreatedByLastName:v20];

  uint64_t v21 = [(EKPersistentCalendarItem *)self sharedItemCreatedDate];
  [v4 setSharedItemCreatedDate:v21];

  v22 = [(EKPersistentCalendarItem *)self sharedItemCreatedTimeZoneName];
  [v4 setSharedItemCreatedTimeZoneName:v22];

  v23 = [(EKPersistentCalendarItem *)self sharedItemModifiedByDisplayName];
  [v4 setSharedItemModifiedByDisplayName:v23];

  uint64_t v24 = [(EKPersistentCalendarItem *)self sharedItemModifiedByAddressString];
  [v4 setSharedItemModifiedByAddressString:v24];

  v25 = [(EKPersistentCalendarItem *)self sharedItemModifiedByFirstName];
  [v4 setSharedItemModifiedByFirstName:v25];

  uint64_t v26 = [(EKPersistentCalendarItem *)self sharedItemModifiedByLastName];
  [v4 setSharedItemModifiedByLastName:v26];

  v27 = [(EKPersistentCalendarItem *)self sharedItemModifiedDate];
  [v4 setSharedItemModifiedDate:v27];

  v28 = [(EKPersistentCalendarItem *)self sharedItemModifiedTimeZoneName];
  [v4 setSharedItemModifiedTimeZoneName:v28];

  uint64_t v29 = [(EKPersistentObject *)self eventStore];
  int v30 = [v29 eventAccessLevel];

  if (v30 == 2)
  {
    v31 = [(EKPersistentCalendarItem *)self externalData];
    [v4 setExternalData:v31];
  }
  return v4;
}

- (void)setUUID:(id)a3
{
}

- (void)setCalendar:(id)a3
{
}

- (void)setNotes:(id)a3
{
}

- (BOOL)hasNotes
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56C28]];
}

- (void)setHasNotes:(BOOL)a3
{
}

- (void)setUnlocalizedTitle:(id)a3
{
}

- (BOOL)phantomMaster
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56C70]];
}

- (void)setPhantomMaster:(BOOL)a3
{
}

- (id)calendarScale
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56BB8]];
}

- (void)setCalendarScale:(id)a3
{
}

- (void)setStructuredLocationWithoutPrediction:(id)a3
{
}

- (void)setClientLocation:(id)a3
{
}

- (void)setTravelStartLocation:(id)a3
{
}

- (id)endLocation
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56BE8]];
}

- (void)setEndLocation:(id)a3
{
}

- (id)lastModifiedDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56C40]];
}

- (void)setLastModifiedDate:(id)a3
{
}

- (id)creationDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56BC8]];
}

- (void)setCreationDate:(id)a3
{
}

- (void)setStartDateRaw:(id)a3
{
}

- (void)setStartTimeZoneName:(id)a3
{
}

- (void)setEndTimeZoneName:(id)a3
{
}

- (void)setIsAllDay:(BOOL)a3
{
}

- (int)priority
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56C78]];
}

- (void)setPriority:(int)a3
{
}

- (int)sequenceNumber
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56C98]];
}

- (void)setSequenceNumber:(int)a3
{
}

- (id)actionString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56B90]];
}

- (void)setActionString:(id)a3
{
}

- (void)setURLString:(id)a3
{
}

- (void)setAllAlarmsSet:(id)a3
{
}

- (id)allAlarmsSet
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56B98]];
}

- (void)addAlarm:(id)a3
{
}

- (void)removeAlarm:(id)a3
{
}

- (BOOL)defaultAlarmWasDeleted
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56BD0]];
}

- (void)setDefaultAlarmWasDeleted:(BOOL)a3
{
}

- (void)setHasRecurrenceRules:(BOOL)a3
{
}

- (void)setRecurrenceRulesSet:(id)a3
{
}

- (void)addRecurrenceRule:(id)a3
{
}

- (void)removeRecurrenceRule:(id)a3
{
}

- (id)singleRecurrenceRule
{
  uint64_t v2 = [(EKPersistentCalendarItem *)self recurrenceRulesSet];
  uint64_t v3 = [v2 anyObject];

  return v3;
}

- (void)setEkExceptionDates:(id)a3
{
}

- (BOOL)hasAttendees
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56C20]];
}

- (void)setHasAttendees:(BOOL)a3
{
}

- (void)setAttendeesRaw:(id)a3
{
}

- (void)addAttendee:(id)a3
{
}

- (void)removeAttendee:(id)a3
{
}

- (void)setSelfAttendee:(id)a3
{
}

- (id)organizer
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56C60]];
}

- (void)setOrganizer:(id)a3
{
}

- (int)selfParticipantStatusRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56C90]];
}

- (void)setSelfParticipantStatusRaw:(int)a3
{
}

- (void)setUniqueID:(id)a3
{
}

- (id)externalID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56C00]];
}

- (void)setExternalID:(id)a3
{
}

- (id)externalScheduleID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56C10]];
}

- (void)setExternalScheduleID:(id)a3
{
}

- (id)externalModificationTag
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56C08]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (id)externalData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56BF8]];
}

- (void)setExternalData:(id)a3
{
}

- (void)setAttachmentsSet:(id)a3
{
}

- (id)sharedItemCreatedByDisplayName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CA8]];
}

- (void)setSharedItemCreatedByDisplayName:(id)a3
{
}

- (id)sharedItemCreatedByAddressString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CA0]];
}

- (void)setSharedItemCreatedByAddressString:(id)a3
{
}

- (id)sharedItemCreatedByFirstName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CB0]];
}

- (void)setSharedItemCreatedByFirstName:(id)a3
{
}

- (id)sharedItemCreatedByLastName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CB8]];
}

- (void)setSharedItemCreatedByLastName:(id)a3
{
}

- (id)sharedItemCreatedDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56CC0]];
}

- (void)setSharedItemCreatedDate:(id)a3
{
}

- (id)sharedItemCreatedTimeZoneName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CC8]];
}

- (void)setSharedItemCreatedTimeZoneName:(id)a3
{
}

- (id)sharedItemModifiedByDisplayName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CD8]];
}

- (void)setSharedItemModifiedByDisplayName:(id)a3
{
}

- (id)sharedItemModifiedByAddressString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CD0]];
}

- (void)setSharedItemModifiedByAddressString:(id)a3
{
}

- (id)sharedItemModifiedByFirstName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CE0]];
}

- (void)setSharedItemModifiedByFirstName:(id)a3
{
}

- (id)sharedItemModifiedByLastName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CE8]];
}

- (void)setSharedItemModifiedByLastName:(id)a3
{
}

- (id)sharedItemModifiedDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56CF0]];
}

- (void)setSharedItemModifiedDate:(id)a3
{
}

- (id)sharedItemModifiedTimeZoneName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56CF8]];
}

- (void)setSharedItemModifiedTimeZoneName:(id)a3
{
}

- (unsigned)modifiedProperties
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56C50]];
}

- (void)setModifiedProperties:(unsigned int)a3
{
}

- (id)structuredData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56D18]];
}

- (void)setStructuredData:(id)a3
{
}

- (id)localStructuredData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56C48]];
}

- (void)setLocalStructuredData:(id)a3
{
}

- (id)syncError
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56D28]];
}

- (void)setSyncError:(id)a3
{
}

- (BOOL)suppressNotificationForChanges
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56D20]];
}

- (void)setSuppressNotificationForChanges:(BOOL)a3
{
}

- (void)setFlags:(int)a3
{
}

- (void)setOriginalItem:(id)a3
{
}

- (void)setDetachedItems:(id)a3
{
}

@end