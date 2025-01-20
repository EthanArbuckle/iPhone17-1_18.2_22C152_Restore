@interface EKPersistentResourceChange
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)relations;
- (BOOL)alerted;
- (id)calendar;
- (id)calendarItem;
- (id)changedByAddress;
- (id)changedByDisplayName;
- (id)changedByFirstName;
- (id)changedByLastName;
- (id)createCount;
- (id)deleteCount;
- (id)deletedTitle;
- (id)notification;
- (id)timestamp;
- (id)updateCount;
- (int)entityType;
- (unsigned)changeType;
- (unsigned)changedProperties;
- (unsigned)publicStatus;
@end

@implementation EKPersistentResourceChange

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_6 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_6, &__block_literal_global_40);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_5;

  return v2;
}

void __53__EKPersistentResourceChange_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57240];
  v8[0] = *MEMORY[0x1E4F57238];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57260];
  v8[2] = *MEMORY[0x1E4F57258];
  v8[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F57248];
  v8[4] = *MEMORY[0x1E4F57268];
  v8[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F57270];
  v8[6] = *MEMORY[0x1E4F57298];
  v8[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F572A0];
  uint64_t v9 = *MEMORY[0x1E4F57278];
  uint64_t v10 = v4;
  uint64_t v5 = *MEMORY[0x1E4F57280];
  uint64_t v11 = v9;
  uint64_t v12 = v5;
  uint64_t v13 = *MEMORY[0x1E4F570D8];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:13];
  v7 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_5;
  defaultPropertiesToLoad_defaultPropertiesToLoad_5 = v6;
}

+ (id)relations
{
  if (relations_onceToken_9 != -1) {
    dispatch_once(&relations_onceToken_9, &__block_literal_global_18_1);
  }
  uint64_t v2 = (void *)relations_relations_9;

  return v2;
}

void __39__EKPersistentResourceChange_relations__block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F57118]];
  v6[0] = *MEMORY[0x1E4F57238];
  uint64_t v1 = +[EKRelation relationWithEntityName:@"Calendar" toMany:0 inversePropertyNames:0 ownsRelated:0];
  v7[0] = v1;
  v6[1] = *MEMORY[0x1E4F57240];
  uint64_t v2 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:0 ownsRelated:0];
  v7[1] = v2;
  v6[2] = *MEMORY[0x1E4F57288];
  uint64_t v3 = +[EKRelation relationWithEntityName:@"Notification" toMany:0 inversePropertyNames:v0 ownsRelated:0];
  v7[2] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  uint64_t v5 = (void *)relations_relations_9;
  relations_relations_9 = v4;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 18;
}

- (id)calendar
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57238]];
}

- (id)calendarItem
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57240]];
}

- (id)notification
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57288]];
}

- (id)changedByDisplayName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57258]];
}

- (id)changedByAddress
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57250]];
}

- (id)changedByFirstName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57260]];
}

- (id)changedByLastName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57268]];
}

- (unsigned)changeType
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57248]];
}

- (id)timestamp
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57298]];
}

- (id)createCount
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F57278]];
}

- (id)updateCount
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F572A0]];
}

- (id)deleteCount
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F57278]];
}

- (unsigned)changedProperties
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57270]];
}

- (id)deletedTitle
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57280]];
}

- (BOOL)alerted
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F57230]];
}

- (unsigned)publicStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57290]];
}

@end