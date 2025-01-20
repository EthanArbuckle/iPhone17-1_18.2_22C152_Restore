@interface EKPersistentEvent
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)eventWithRandomUUID;
+ (id)relations;
- (BOOL)canForward;
- (BOOL)disallowProposeNewTime;
- (BOOL)firedTTL;
- (id)actions;
- (id)birthdayContactIdentifier;
- (id)birthdayContactName;
- (id)birthdayID;
- (id)color;
- (id)conferenceURLDetectedString;
- (id)conferenceURLString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)endDateRaw;
- (id)image;
- (id)organizer;
- (id)originalStartDate;
- (id)participationStatusModifiedDate;
- (id)proposedStartDate;
- (id)recurrenceSet;
- (id)responseComment;
- (id)specialDayString;
- (id)suggestionInfo;
- (id)travelTime;
- (int)entityType;
- (int)externalTrackingStatus;
- (int64_t)availability;
- (int64_t)locationPredictionState;
- (int64_t)privacyLevel;
- (int64_t)status;
- (int64_t)travelAdvisoryBehavior;
- (unint64_t)invitationStatus;
- (unint64_t)junkStatus;
- (unsigned)invitationChangedProperties;
- (void)setActions:(id)a3;
- (void)setAvailability:(int64_t)a3;
- (void)setBirthdayContactIdentifier:(id)a3;
- (void)setBirthdayContactName:(id)a3;
- (void)setBirthdayID:(id)a3;
- (void)setCanForward:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setConferenceURLDetectedString:(id)a3;
- (void)setConferenceURLString:(id)a3;
- (void)setDisallowProposeNewTime:(BOOL)a3;
- (void)setEndDateRaw:(id)a3;
- (void)setExternalTrackingStatus:(int)a3;
- (void)setFiredTTL:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setInvitationChangedProperties:(unsigned int)a3;
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setJunkStatus:(unint64_t)a3;
- (void)setLocationPredictionState:(int64_t)a3;
- (void)setOriginalStartDate:(id)a3;
- (void)setParticipationStatusModifiedDate:(id)a3;
- (void)setPrivacyLevel:(int64_t)a3;
- (void)setProposedStartDate:(id)a3;
- (void)setRecurrenceSet:(id)a3;
- (void)setResponseComment:(id)a3;
- (void)setSpecialDayString:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSuggestionInfo:(id)a3;
- (void)setTravelAdvisoryBehavior:(int64_t)a3;
- (void)setTravelTime:(id)a3;
@end

@implementation EKPersistentEvent

- (id)proposedStartDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57008]];
}

- (id)birthdayContactIdentifier
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56F60]];
}

- (int64_t)privacyLevel
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57000]];
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_9 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_9, &__block_literal_global_52);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_8;

  return v2;
}

- (int64_t)status
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57028]];
}

- (id)endDateRaw
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56FB0]];
}

- (id)travelTime
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F57040]];
}

- (id)conferenceURLString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56F90]];
}

- (id)conferenceURLDetectedString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56F88]];
}

+ (id)relations
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__EKPersistentEvent_relations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (relations_onceToken_13 != -1) {
    dispatch_once(&relations_onceToken_13, block);
  }
  v2 = (void *)relations_relations_13;

  return v2;
}

- (id)originalStartDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56FF0]];
}

- (int64_t)locationPredictionState
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56FE8]];
}

- (unsigned)invitationChangedProperties
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56FD0]];
}

- (int)entityType
{
  return 2;
}

- (unint64_t)invitationStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56FD8]];
}

void __30__EKPersistentEvent_relations__block_invoke(uint64_t a1)
{
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___EKPersistentEvent;
  v1 = objc_msgSendSuper2(&v13, sel_relations);
  v2 = (void *)[v1 mutableCopy];

  uint64_t v3 = *MEMORY[0x1E4F57160];
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57160]];
  v5 = +[EKRelation relationWithEntityName:@"EventAction" toMany:1 inversePropertyNames:v4];
  [v2 setObject:v5 forKey:*MEMORY[0x1E4F56F50]];

  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  v7 = +[EKRelation relationWithEntityName:@"ExceptionDate" toMany:1 inversePropertyNames:v6];
  [v2 setObject:v7 forKey:*MEMORY[0x1E4F56BE0]];

  v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  v9 = +[EKRelation relationWithEntityName:@"SuggestedEventInfo" toMany:0 inversePropertyNames:v8];
  [v2 setObject:v9 forKey:*MEMORY[0x1E4F57030]];

  v10 = +[EKRelation relationWithEntityName:@"Image" toMany:0 inversePropertyNames:0 ownsRelated:0];
  [v2 setObject:v10 forKey:*MEMORY[0x1E4F56FC8]];

  v11 = +[EKRelation relationWithEntityName:@"Color" toMany:0 inversePropertyNames:0 ownsRelated:1];
  [v2 setObject:v11 forKey:*MEMORY[0x1E4F56F80]];

  v12 = (void *)relations_relations_13;
  relations_relations_13 = (uint64_t)v2;
}

- (id)participationStatusModifiedDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56FF8]];
}

- (id)organizer
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56C60]];
}

uint64_t __44__EKPersistentEvent_defaultPropertiesToLoad__block_invoke()
{
  defaultPropertiesToLoad_defaultPropertiesToLoad_8 = CADEKPersistentEventDefaultPropertiesToLoad();

  return MEMORY[0x1F41817F8]();
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)birthdayID
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F56F70]];
}

- (void)setBirthdayID:(id)a3
{
}

- (void)setEndDateRaw:(id)a3
{
}

- (void)setTravelTime:(id)a3
{
}

- (void)setProposedStartDate:(id)a3
{
}

- (void)setStatus:(int64_t)a3
{
}

- (void)setLocationPredictionState:(int64_t)a3
{
}

- (void)setInvitationStatus:(unint64_t)a3
{
}

- (void)setInvitationChangedProperties:(unsigned int)a3
{
}

- (int64_t)availability
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56F58]];
}

- (void)setAvailability:(int64_t)a3
{
}

- (void)setPrivacyLevel:(int64_t)a3
{
}

- (int64_t)travelAdvisoryBehavior
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57038]];
}

- (void)setTravelAdvisoryBehavior:(int64_t)a3
{
}

- (id)responseComment
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57018]];
}

- (void)setResponseComment:(id)a3
{
}

- (int)externalTrackingStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56FB8]];
}

- (void)setExternalTrackingStatus:(int)a3
{
}

- (BOOL)canForward
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56F78]];
}

- (void)setCanForward:(BOOL)a3
{
}

- (BOOL)disallowProposeNewTime
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56FA8]];
}

- (unint64_t)junkStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56FE0]];
}

- (void)setJunkStatus:(unint64_t)a3
{
}

- (void)setDisallowProposeNewTime:(BOOL)a3
{
}

- (void)setOriginalStartDate:(id)a3
{
}

- (id)actions
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56F50]];
}

- (void)setActions:(id)a3
{
}

- (void)setConferenceURLString:(id)a3
{
}

- (void)setBirthdayContactIdentifier:(id)a3
{
}

- (id)birthdayContactName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56F68]];
}

- (void)setBirthdayContactName:(id)a3
{
}

- (id)recurrenceSet
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57010]];
}

- (void)setRecurrenceSet:(id)a3
{
}

- (void)setParticipationStatusModifiedDate:(id)a3
{
}

- (void)setConferenceURLDetectedString:(id)a3
{
}

- (id)specialDayString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57020]];
}

- (void)setSpecialDayString:(id)a3
{
}

- (id)image
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56FC8]];
}

- (void)setImage:(id)a3
{
}

- (id)color
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56F80]];
}

- (void)setColor:(id)a3
{
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKPersistentCalendarItem *)self title];
  v6 = [(EKPersistentCalendarItem *)self calendar];
  v7 = [(EKPersistentCalendarItem *)self allAlarmsSet];
  v8 = [(EKPersistentCalendarItem *)self URLString];
  v9 = [(EKPersistentCalendarItem *)self lastModifiedDate];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> \n\t {title = %@; \n\t calendar = %@; \n\t alarms = %@; \n\t URLString = %@; \n\t lastModified = %@}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  v24 = v9);

  v23 = NSString;
  uint64_t v22 = objc_opt_class();
  v21 = [(EKPersistentCalendarItem *)self structuredLocationWithoutPrediction];
  v10 = [(EKPersistentCalendarItem *)self travelStartLocation];
  v11 = [(EKPersistentCalendarItem *)self startDate];
  v12 = [(EKPersistentEvent *)self endDate];
  BOOL v13 = [(EKPersistentCalendarItem *)self isAllDay];
  v14 = [(EKPersistentCalendarItem *)self startTimeZoneName];
  v15 = [(EKPersistentEvent *)self travelTime];
  uint64_t v16 = [v15 integerValue];
  v17 = [(EKPersistentCalendarItem *)self recurrenceRulesSet];
  v18 = [(EKPersistentCalendarItem *)self attendeesRaw];
  objc_msgSend(v23, "stringWithFormat:", @"%@ <%p> {%@; \n\t location = %@; \n\t startLocation = %@; \n\t startDate = %@; \n\t endDate = %@; \n\t allDay = %u; \n\t timeZone = %@; \n\t travelTime: %ld; \n\t recurrences = %@; \n\t attendees = %@}",
    v22,
    self,
    v24,
    v21,
    v10,
    v11,
    v12,
    v13,
    v14,
    v16,
    v17,
  v19 = v18);

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)EKPersistentEvent;
  id v4 = [(EKPersistentCalendarItem *)&v14 copyWithZone:a3];
  v5 = [(EKPersistentEvent *)self endDate];
  [v4 setEndDate:v5];

  objc_msgSend(v4, "setStatus:", -[EKPersistentEvent status](self, "status"));
  objc_msgSend(v4, "setAvailability:", -[EKPersistentEvent availability](self, "availability"));
  objc_msgSend(v4, "setPrivacyLevel:", -[EKPersistentEvent privacyLevel](self, "privacyLevel"));
  v6 = [(EKPersistentEvent *)self travelTime];
  [v4 setTravelTime:v6];

  v7 = [(EKPersistentEvent *)self originalStartDate];
  [v4 setOriginalStartDate:v7];

  objc_msgSend(v4, "setTravelAdvisoryBehavior:", -[EKPersistentEvent travelAdvisoryBehavior](self, "travelAdvisoryBehavior"));
  v8 = [(EKPersistentEvent *)self responseComment];
  [v4 setResponseComment:v8];

  v9 = [(EKPersistentEvent *)self proposedStartDate];
  [v4 setProposedStartDate:v9];

  objc_msgSend(v4, "setLocationPredictionState:", -[EKPersistentEvent locationPredictionState](self, "locationPredictionState"));
  v10 = [(EKPersistentEvent *)self birthdayContactIdentifier];
  [v4 setBirthdayContactIdentifier:v10];

  v11 = [(EKPersistentEvent *)self birthdayContactName];
  [v4 setBirthdayContactName:v11];

  v12 = [(EKPersistentEvent *)self birthdayID];
  if (v12) {
    [v4 setBirthdayID:v12];
  }
  objc_msgSend(v4, "setCanForward:", -[EKPersistentEvent canForward](self, "canForward"));
  objc_msgSend(v4, "setDisallowProposeNewTime:", -[EKPersistentEvent disallowProposeNewTime](self, "disallowProposeNewTime"));

  return v4;
}

- (id)suggestionInfo
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57030]];
}

- (void)setSuggestionInfo:(id)a3
{
}

- (BOOL)firedTTL
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56FC0]];
}

- (void)setFiredTTL:(BOOL)a3
{
}

+ (id)eventWithRandomUUID
{
  v2 = objc_alloc_init(EKPersistentEvent);
  uint64_t v3 = EKUUIDString();
  [(EKPersistentCalendarItem *)v2 setUUID:v3];

  return v2;
}

@end