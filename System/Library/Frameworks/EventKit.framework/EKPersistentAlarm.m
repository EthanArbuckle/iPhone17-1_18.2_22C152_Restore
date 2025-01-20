@interface EKPersistentAlarm
+ (Class)alternateUniverseClass;
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)propertyKeyForUniqueIdentifier;
+ (id)relations;
- (BOOL)isDefaultAlarm;
- (id)UUID;
- (id)absoluteDate;
- (id)acknowledgedDate;
- (id)calendarItemOwner;
- (id)calendarOwner;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)emailAddress;
- (id)externalData;
- (id)originalAlarm;
- (id)relativeOffset;
- (id)semanticIdentifier;
- (id)snoozedAlarmsSet;
- (id)structuredLocation;
- (id)urlWrapper;
- (int)entityType;
- (int64_t)proximity;
- (int64_t)type;
- (void)setAbsoluteDate:(id)a3;
- (void)setAcknowledgedDate:(id)a3;
- (void)setCalendarItemOwner:(id)a3;
- (void)setCalendarOwner:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setExternalData:(id)a3;
- (void)setIsDefaultAlarm:(BOOL)a3;
- (void)setOriginalAlarm:(id)a3;
- (void)setProximity:(int64_t)a3;
- (void)setRelativeOffset:(id)a3;
- (void)setSnoozedAlarmsSet:(id)a3;
- (void)setStructuredLocation:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUrlWrapper:(id)a3;
@end

@implementation EKPersistentAlarm

+ (id)relations
{
  if (relations_onceToken_8 != -1) {
    dispatch_once(&relations_onceToken_8, &__block_literal_global_39);
  }
  v2 = (void *)relations_relations_8;

  return v2;
}

void __30__EKPersistentAlarm_relations__block_invoke()
{
  id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56B98]];
  v14 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v17 ownsRelated:0];
  uint64_t v13 = *MEMORY[0x1E4F56A88];
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56D48]];
  v11 = +[EKRelation relationWithEntityName:@"Calendar" toMany:0 inversePropertyNames:v16 ownsRelated:0];
  uint64_t v10 = *MEMORY[0x1E4F56A90];
  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57080]];
  v0 = +[EKRelation relationWithEntityName:@"Location" toMany:0 inversePropertyNames:v12 ownsRelated:1];
  uint64_t v1 = *MEMORY[0x1E4F56AD0];
  uint64_t v2 = *MEMORY[0x1E4F56AC8];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56AC8]];
  v4 = +[EKRelation relationWithEntityName:@"Alarm" toMany:0 inversePropertyNames:v3 ownsRelated:0];
  uint64_t v5 = *MEMORY[0x1E4F56AB0];
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56AB0]];
  v7 = +[EKRelation relationWithEntityName:@"Alarm" toMany:1 inversePropertyNames:v6 ownsRelated:1];
  uint64_t v8 = objc_msgSend(v15, "initWithObjectsAndKeys:", v14, v13, v11, v10, v0, v1, v4, v5, v7, v2, 0);
  v9 = (void *)relations_relations_8;
  relations_relations_8 = v8;
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_5 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_5, &__block_literal_global_23);
  }
  uint64_t v2 = (void *)defaultPropertiesToLoad_defaultProperties;

  return v2;
}

void __44__EKPersistentAlarm_defaultPropertiesToLoad__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56AD0];
  v3[0] = *MEMORY[0x1E4F56AB8];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)defaultPropertiesToLoad_defaultProperties;
  defaultPropertiesToLoad_defaultProperties = v1;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

+ (Class)alternateUniverseClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 4;
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)relativeOffset
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F56AC0]];
}

- (void)setRelativeOffset:(id)a3
{
}

- (id)absoluteDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56A78]];
}

- (void)setAbsoluteDate:(id)a3
{
}

- (int64_t)type
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56AD8]];
}

- (void)setType:(int64_t)a3
{
}

- (id)externalData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56AA0]];
}

- (void)setExternalData:(id)a3
{
}

- (id)calendarItemOwner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56A88]];
}

- (void)setCalendarItemOwner:(id)a3
{
}

- (id)calendarOwner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56A90]];
}

- (void)setCalendarOwner:(id)a3
{
}

- (void)setProximity:(int64_t)a3
{
}

- (int64_t)proximity
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56AB8]];
}

- (void)setStructuredLocation:(id)a3
{
}

- (id)structuredLocation
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56AD0]];
}

- (void)setAcknowledgedDate:(id)a3
{
}

- (id)acknowledgedDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56A80]];
}

- (BOOL)isDefaultAlarm
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56AA8]];
}

- (void)setIsDefaultAlarm:(BOOL)a3
{
}

- (void)setOriginalAlarm:(id)a3
{
}

- (id)originalAlarm
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56AB0]];
}

- (void)setSnoozedAlarmsSet:(id)a3
{
}

- (id)snoozedAlarmsSet
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F56AC8]];
}

- (void)setEmailAddress:(id)a3
{
}

- (id)emailAddress
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56A98]];
}

- (void)setUrlWrapper:(id)a3
{
}

- (id)urlWrapper
{
  return [(EKPersistentObject *)self primitiveSecurityScopedURLWrapperValueForKey:*MEMORY[0x1E4F56AE0]];
}

- (id)semanticIdentifier
{
  BOOL v3 = [(EKPersistentAlarm *)self isDefaultAlarm];
  v4 = [(EKPersistentAlarm *)self absoluteDate];
  uint64_t v5 = [(EKPersistentAlarm *)self relativeOffset];
  v6 = +[EKAlarmSemanticIdentifierGenerator semanticIdentifierForAlarmIsDefault:v3 absoluteDate:v4 relativeOffset:v5 emailAddress:0 url:0];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(EKPersistentAlarm);
  uint64_t v5 = [(EKPersistentAlarm *)self absoluteDate];

  if (v5)
  {
    v6 = [(EKPersistentAlarm *)self absoluteDate];
    [(EKPersistentAlarm *)v4 setAbsoluteDate:v6];
  }
  else
  {
    v6 = [(EKPersistentAlarm *)self relativeOffset];
    [(EKPersistentAlarm *)v4 setRelativeOffset:v6];
  }

  [(EKPersistentAlarm *)v4 setProximity:[(EKPersistentAlarm *)self proximity]];
  [(EKPersistentAlarm *)v4 setType:[(EKPersistentAlarm *)self type]];
  v7 = [(EKPersistentAlarm *)self emailAddress];
  [(EKPersistentAlarm *)v4 setEmailAddress:v7];

  uint64_t v8 = [(EKPersistentAlarm *)self urlWrapper];
  [(EKPersistentAlarm *)v4 setUrlWrapper:v8];

  v9 = EKUUIDString();
  [(EKPersistentAlarm *)v4 setUUID:v9];

  [(EKPersistentAlarm *)v4 setIsDefaultAlarm:[(EKPersistentAlarm *)self isDefaultAlarm]];
  uint64_t v10 = [(EKPersistentObject *)self eventStore];
  int v11 = [v10 eventAccessLevel];

  if (v11 == 2)
  {
    v12 = [(EKPersistentAlarm *)self externalData];
    uint64_t v13 = (void *)[v12 copy];
    [(EKPersistentAlarm *)v4 setExternalData:v13];
  }
  return v4;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E4F57150];
}

- (id)description
{
  BOOL v3 = [(EKPersistentAlarm *)self absoluteDate];

  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    v6 = [(EKPersistentAlarm *)self absoluteDate];
    int64_t v7 = [(EKPersistentAlarm *)self proximity];
    uint64_t v8 = [(EKPersistentAlarm *)self structuredLocation];
    objc_msgSend(v4, "stringWithFormat:", @"%@ <%p> {triggerDate = %@; proximity = %ld; location = %@, type = %ld}",
      v5,
      self,
      v6,
      v7,
      v8,
      [(EKPersistentAlarm *)self type]);
  }
  else
  {
    v6 = [(EKPersistentAlarm *)self relativeOffset];
    [v6 doubleValue];
    uint64_t v10 = v9;
    int64_t v11 = [(EKPersistentAlarm *)self proximity];
    uint64_t v8 = [(EKPersistentAlarm *)self structuredLocation];
    objc_msgSend(v4, "stringWithFormat:", @"%@ <%p> {triggerInterval = %lf; proximity = %ld; location = %@, type = %ld}",
      v5,
      self,
      v10,
      v11,
      v8,
      [(EKPersistentAlarm *)self type]);
  v12 = };

  return v12;
}

@end