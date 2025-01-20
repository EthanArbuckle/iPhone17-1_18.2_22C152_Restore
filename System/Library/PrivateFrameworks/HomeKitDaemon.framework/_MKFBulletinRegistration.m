@interface _MKFBulletinRegistration
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFBulletinRegistrationDatabaseID)databaseID;
- (MKFHome)home;
- (NSArray)conditions;
- (id)createConditionsRelationOfType:(id)a3 modelID:(id)a4;
- (id)createConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3;
- (id)createConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3;
- (id)findConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3;
- (id)findConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3;
- (id)materializeOrCreateConditionsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (void)addConditionsObject:(id)a3;
- (void)removeConditionsObject:(id)a3;
- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4;
@end

@implementation _MKFBulletinRegistration

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFBulletinRegistration"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4FADC8;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_122717 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_122717, &__block_literal_global_122718);
  }
  v2 = (void *)homeRelation__hmf_once_v1_122719;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)removeConditionsObject:(id)a3
{
}

- (void)addConditionsObject:(id)a3
{
}

- (id)findConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"conditions_" modelProtocol:@"MKFTimePeriodBulletinCondition" keyValue:a3];
}

- (id)createConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"conditions_" modelProtocol:@"MKFTimePeriodBulletinCondition" keyValue:a3];
}

- (id)materializeOrCreateConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"conditions_" modelProtocol:@"MKFTimePeriodBulletinCondition" keyValue:a3 createdNew:a4];
}

- (id)findConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"conditions_" modelProtocol:@"MKFPresenceBulletinCondition" keyValue:a3];
}

- (id)createConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"conditions_" modelProtocol:@"MKFPresenceBulletinCondition" keyValue:a3];
}

- (id)materializeOrCreateConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"conditions_" modelProtocol:@"MKFPresenceBulletinCondition" keyValue:a3 createdNew:a4];
}

- (id)createConditionsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"conditions_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateConditionsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  id v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"conditions_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)conditions
{
  v2 = [(_MKFBulletinRegistration *)self valueForKey:@"conditions_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v2 = [(_MKFBulletinRegistration *)self user];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFBulletinRegistrationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFBulletinRegistrationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  id v8 = v7;
  v9 = (void *)v7[2];
  if (!v9)
  {
    id v10 = [v7 targetDeviceAddress];

    if (v10)
    {
      v11 = +[_MKFBulletinRegistration fetchRequest];
      [v11 setResultType:1];
      v12 = [v8 targetUser];
      int v13 = [v12 isRestrictedGuest];

      v14 = (void *)MEMORY[0x263F08A98];
      v15 = [v8 targetUser];
      v16 = [v8 targetDeviceAddress];
      uint64_t v17 = [v16 idsIdentifier];
      v18 = (void *)v17;
      v19 = @"user";
      if (v13) {
        v19 = @"guest";
      }
      v20 = [v14 predicateWithFormat:@"(%K == %@) && (%K == %@)", v19, v15, @"deviceIdsIdentifier", v17];
      [v11 setPredicate:v20];

      id v40 = 0;
      v21 = [v11 execute:&v40];
      id v22 = v40;
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = self;
      v25 = HMFGetOSLogHandle();
      v26 = v25;
      if (v21)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v27 = id v39 = v22;
          v28 = [v8 targetDeviceAddress];
          *(_DWORD *)buf = 138543874;
          v42 = v27;
          __int16 v43 = 2114;
          id v44 = v21;
          __int16 v45 = 2112;
          v46 = v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Setting context->_relevantBulletinRegistrations to: %{public}@ for targetDeviceAddress: %@", buf, 0x20u);

          id v22 = v39;
        }

        uint64_t v29 = [MEMORY[0x263EFFA08] setWithArray:v21];
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v42 = v35;
          __int16 v43 = 2114;
          id v44 = v22;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch relevant bulletin registrations: %{public}@", buf, 0x16u);
        }
        uint64_t v29 = [MEMORY[0x263EFFA08] set];
      }
      v36 = (void *)v8[2];
      v8[2] = v29;
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v42 = v33;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_DEBUG, "%{public}@No targetDeviceAddress when trying to set context->_relevantBulletinRegistrations", buf, 0xCu);
      }
      uint64_t v34 = [MEMORY[0x263EFFA08] set];
      v11 = (void *)v8[2];
      v8[2] = v34;
    }

    v9 = (void *)v8[2];
  }
  v37 = [(_MKFBulletinRegistration *)self objectID];
  int v38 = [v9 containsObject:v37];

  if (v38) {
    [v6 addCondition:@"deviceIsTargetDevice"];
  }
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    id v8 = [(_MKFBulletinRegistration *)v7 characteristic];
    v9 = [v8 service];
    id v10 = [v9 accessory];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12) {
      char v13 = [v12 shouldIncludeForRestrictedGuestWithContext:v4];
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

@end