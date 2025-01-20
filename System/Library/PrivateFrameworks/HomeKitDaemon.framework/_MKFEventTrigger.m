@interface _MKFEventTrigger
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFEventTriggerDatabaseID)databaseID;
- (NSArray)events;
- (id)createEventsRelationOfType:(id)a3 modelID:(id)a4;
- (id)createEventsRelationOfTypeCalendarEventWithModelID:(id)a3;
- (id)createEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3;
- (id)createEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3;
- (id)createEventsRelationOfTypeDurationEventWithModelID:(id)a3;
- (id)createEventsRelationOfTypeLocationEventWithModelID:(id)a3;
- (id)createEventsRelationOfTypeMatterAttributeValueEventWithModelID:(id)a3;
- (id)createEventsRelationOfTypePresenceEventWithModelID:(id)a3;
- (id)createEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypeCalendarEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypeDurationEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypeLocationEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypeMatterAttributeValueEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypePresenceEventWithModelID:(id)a3;
- (id)findEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3;
- (id)materializeOrCreateEventsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateEventsRelationOfTypeCalendarEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEventsRelationOfTypeDurationEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEventsRelationOfTypeLocationEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEventsRelationOfTypeMatterAttributeValueEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEventsRelationOfTypePresenceEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)residentSyncAttributeValueForKey:(id)a3 userContext:(id)a4;
- (void)awakeFromFetch;
- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4;
@end

@implementation _MKFEventTrigger

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFEventTrigger"];
}

- (id)residentSyncAttributeValueForKey:(id)a3 userContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"evaluationCondition"]
    && ([v7 targetUser],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isOwnerOrAdmin],
        v8,
        (v9 & 1) == 0))
  {
    v11 = [(_MKFEventTrigger *)self evaluationCondition];
    if (v11)
    {
      v12 = [v7 targetUser];
      v13 = (void *)MEMORY[0x263EFFA08];
      v14 = [v12 modelID];
      v15 = [v12 home];
      v16 = [v15 owner];
      v17 = [v16 modelID];
      v18 = objc_msgSend(v13, "setWithObjects:", v14, v17, 0);

      v10 = +[HMDPredicateUtilities filteredPredicate:v11 withUserUUIDs:v18];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = [(_MKFEventTrigger *)self valueForKey:v6];
  }

  return v10;
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)v7[1];
  if (!v8)
  {
    char v9 = +[_MKFEventTrigger fetchRequest];
    [v9 setResultType:1];
    v10 = (void *)MEMORY[0x263F08A98];
    v11 = +[_MKFPresenceEvent entity];
    uint64_t v12 = *MEMORY[0x263F0D4B0];
    uint64_t v13 = *MEMORY[0x263F0D4C8];
    v14 = [v7 targetUser];
    v15 = [v10 predicateWithFormat:@"SUBQUERY(%K, $p, $p.entity = %@ AND( $p.%K = %@ OR  $p.%K = %@ OR  SUBQUERY($p.%K, $u, $u = %@).@count > 0)).@count > 0", @"events_", v11, @"presenceType", v12, @"presenceType", v13, @"users_", v14];
    [v9 setPredicate:v15];

    id v26 = 0;
    v16 = [v9 execute:&v26];
    id v17 = v26;
    if (v16)
    {
      uint64_t v18 = [MEMORY[0x263EFFA08] setWithArray:v16];
    }
    else
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        __int16 v29 = 2114;
        id v30 = v17;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch relevant triggers: %{public}@", buf, 0x16u);
      }
      uint64_t v18 = [MEMORY[0x263EFFA08] set];
    }
    v23 = (void *)v7[1];
    v7[1] = v18;

    v8 = (void *)v7[1];
  }
  v24 = [(_MKFEventTrigger *)self objectID];
  int v25 = [v8 containsObject:v24];

  if (v25) {
    [v6 addCondition:@"triggerIsRelevant"];
  }
}

- (id)findEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFSignificantTimeEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFSignificantTimeEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFSignificantTimeEvent" keyValue:a3 createdNew:a4];
}

- (id)findEventsRelationOfTypePresenceEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFPresenceEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypePresenceEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFPresenceEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypePresenceEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFPresenceEvent" keyValue:a3 createdNew:a4];
}

- (id)findEventsRelationOfTypeMatterAttributeValueEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFMatterAttributeValueEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypeMatterAttributeValueEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFMatterAttributeValueEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypeMatterAttributeValueEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFMatterAttributeValueEvent" keyValue:a3 createdNew:a4];
}

- (id)findEventsRelationOfTypeLocationEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFLocationEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypeLocationEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFLocationEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypeLocationEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFLocationEvent" keyValue:a3 createdNew:a4];
}

- (id)findEventsRelationOfTypeDurationEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFDurationEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypeDurationEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFDurationEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypeDurationEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFDurationEvent" keyValue:a3 createdNew:a4];
}

- (id)findEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFCharacteristicValueEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFCharacteristicValueEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFCharacteristicValueEvent" keyValue:a3 createdNew:a4];
}

- (id)findEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFCharacteristicRangeEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFCharacteristicRangeEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFCharacteristicRangeEvent" keyValue:a3 createdNew:a4];
}

- (id)findEventsRelationOfTypeCalendarEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"events_" modelProtocol:@"MKFCalendarEvent" keyValue:a3];
}

- (id)createEventsRelationOfTypeCalendarEventWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:@"MKFCalendarEvent" keyValue:a3];
}

- (id)materializeOrCreateEventsRelationOfTypeCalendarEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:@"MKFCalendarEvent" keyValue:a3 createdNew:a4];
}

- (id)createEventsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  id v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"events_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateEventsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  char v9 = NSStringFromProtocol((Protocol *)a3);
  v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"events_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)events
{
  v2 = [(_MKFEventTrigger *)self valueForKey:@"events_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFEventTriggerDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFEventTriggerDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (void)awakeFromFetch
{
  v8.receiver = self;
  v8.super_class = (Class)_MKFEventTrigger;
  [(_MKFEventTrigger *)&v8 awakeFromFetch];
  v3 = [(_MKFEventTrigger *)self recurrenceDays];
  if (!v3)
  {
    v4 = [(_MKFEventTrigger *)self recurrences];

    if (!v4) {
      return;
    }
    v5 = NSNumber;
    v3 = [(_MKFEventTrigger *)self recurrences];
    id v6 = [v3 decodeArrayOfDateComponents];
    id v7 = [v5 numberWithUnsignedInteger:HMDaysOfTheWeekFromDateComponents()];
    [(_MKFEventTrigger *)self setPrimitiveValue:v7 forKey:@"recurrenceDays"];
  }
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E596E90;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_222477 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_222477, &__block_literal_global_222478);
  }
  v2 = (void *)homeRelation__hmf_once_v1_222479;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  objc_super v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end