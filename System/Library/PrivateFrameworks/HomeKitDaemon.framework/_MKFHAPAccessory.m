@interface _MKFHAPAccessory
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)hasRGCapableService;
- (MKFHAPAccessoryDatabaseID)databaseID;
- (NSArray)actionCharacteristicWrites;
- (NSArray)matterPaths;
- (NSArray)naturalLightingActions;
- (NSArray)pairedUsers;
- (NSArray)services;
- (id)bulletinRegistrationFromFetchRequest:(id)a3 context:(id)a4;
- (id)cameraAccessModeBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5;
- (id)cameraReachabilityBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5;
- (id)cameraSignificantEventBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5;
- (id)characteristicFromInstanceID:(id)a3 context:(id)a4;
- (id)findMatterPathsRelationWithModelID:(id)a3;
- (id)findServicesRelationWithInstanceID:(id)a3;
- (id)materializeOrCreateMatterPathsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateNaturalLightingActionsRelation:(BOOL *)a3;
- (id)materializeOrCreateServicesRelationWithInstanceID:(id)a3 createdNew:(BOOL *)a4;
- (id)predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:(id)a3 user:(id)a4;
- (id)serviceWithID:(id)a3 context:(id)a4;
- (id)weekDayScheduleCapacity;
- (id)yearDayScheduleCapacity;
- (void)addMatterPathsObject:(id)a3;
- (void)addPairedUsersObject:(id)a3;
- (void)maybeFixUpCharacteristicWriteActionsInContext:(id)a3;
- (void)removeMatterPathsObject:(id)a3;
- (void)removePairedUsersObject:(id)a3;
- (void)synchronizeServicesRelationWith:(id)a3;
@end

@implementation _MKFHAPAccessory

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHAPAccessory"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E55CBD8;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t7_165174 != -1) {
    dispatch_once(&homeRelation__hmf_once_t7_165174, &__block_literal_global_52_165175);
  }
  v2 = (void *)homeRelation__hmf_once_v8_165176;
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

- (void)removeMatterPathsObject:(id)a3
{
}

- (void)addMatterPathsObject:(id)a3
{
}

- (id)findMatterPathsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"matterPaths_" modelProtocol:@"MKFMatterPath" keyValue:a3];
}

- (id)materializeOrCreateMatterPathsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"matterPaths_" modelProtocol:@"MKFMatterPath" keyValue:a3 createdNew:a4];
}

- (NSArray)matterPaths
{
  v2 = [(_MKFHAPAccessory *)self valueForKey:@"matterPaths_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeServicesRelationWith:(id)a3
{
}

- (id)findServicesRelationWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"services_" modelProtocol:@"MKFService" keyValue:a3];
}

- (id)materializeOrCreateServicesRelationWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"services_" modelProtocol:@"MKFService" keyValue:a3 createdNew:a4];
}

- (NSArray)services
{
  v2 = [(_MKFHAPAccessory *)self valueForKey:@"services_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removePairedUsersObject:(id)a3
{
}

- (void)addPairedUsersObject:(id)a3
{
}

- (NSArray)pairedUsers
{
  v2 = [(_MKFHAPAccessory *)self valueForKey:@"pairedUsers_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateNaturalLightingActionsRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"naturalLightingActions_" modelProtocol:@"MKFNaturalLightingAction" keyValue:0 createdNew:a3];
}

- (NSArray)naturalLightingActions
{
  v2 = [(_MKFHAPAccessory *)self valueForKey:@"naturalLightingActions_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)actionCharacteristicWrites
{
  v2 = [(_MKFHAPAccessory *)self valueForKey:@"actionCharacteristicWrites_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHAPAccessoryDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHAPAccessoryDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)yearDayScheduleCapacity
{
  v3 = [(_MKFHAPAccessory *)self supportsMatterYearDaySchedule];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [(_MKFHAPAccessory *)self matterYearDayScheduleCapacity];
    if ([v5 integerValue] < 1)
    {
      uint64_t v6 = &unk_26E4723A0;
    }
    else
    {
      uint64_t v6 = [(_MKFHAPAccessory *)self matterYearDayScheduleCapacity];
    }
  }
  else
  {
    uint64_t v6 = &unk_26E4723B8;
  }
  return v6;
}

- (id)weekDayScheduleCapacity
{
  v3 = [(_MKFHAPAccessory *)self supportsMatterWeekDaySchedule];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [(_MKFHAPAccessory *)self matterWeekDayScheduleCapacity];
    if ([v5 integerValue] < 1)
    {
      uint64_t v6 = &unk_26E4723A0;
    }
    else
    {
      uint64_t v6 = [(_MKFHAPAccessory *)self matterWeekDayScheduleCapacity];
    }
  }
  else
  {
    uint64_t v6 = &unk_26E4723B8;
  }
  return v6;
}

- (void)maybeFixUpCharacteristicWriteActionsInContext:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "hmd_assertIsExecuting");
  v5 = +[_MKFCharacteristicWriteAction fetchRequest];
  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"accessory", self];
  [v5 setPredicate:v6];

  v23[0] = @"characteristicID";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v5 setPropertiesToFetch:v7];

  id v18 = 0;
  v8 = [v4 executeFetchRequest:v5 error:&v18];
  id v9 = v18;
  if (v8)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66___MKFHAPAccessory_maybeFixUpCharacteristicWriteActionsInContext___block_invoke;
    v14[3] = &unk_264A22E50;
    v15 = @"service";
    v16 = self;
    id v17 = v4;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch actions: %@", buf, 0x16u);
    }
  }
}

- (id)predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:(id)a3 user:(id)a4
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == %@)", @"accessory", self, @"deviceIdsIdentifier", a3, @"user", a4];
}

- (id)cameraSignificantEventBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[_MKFCameraSignificantEventBulletinRegistration fetchRequest];
  v12 = [(_MKFHAPAccessory *)self predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:v10 user:v9];

  [v11 setPredicate:v12];
  v13 = [(_MKFHAPAccessory *)self bulletinRegistrationFromFetchRequest:v11 context:v8];

  return v13;
}

- (id)cameraAccessModeBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[_MKFCameraAccessModeBulletinRegistration fetchRequest];
  v12 = [(_MKFHAPAccessory *)self predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:v10 user:v9];

  [v11 setPredicate:v12];
  v13 = [(_MKFHAPAccessory *)self bulletinRegistrationFromFetchRequest:v11 context:v8];

  return v13;
}

- (id)cameraReachabilityBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[_MKFCameraReachabilityBulletinRegistration fetchRequest];
  v12 = [(_MKFHAPAccessory *)self predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:v10 user:v9];

  [v11 setPredicate:v12];
  v13 = [(_MKFHAPAccessory *)self bulletinRegistrationFromFetchRequest:v11 context:v8];

  return v13;
}

- (id)bulletinRegistrationFromFetchRequest:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = [v7 executeFetchRequest:v6 error:&v16];
  id v9 = v16;
  if (v8)
  {
    id v10 = [v8 firstObject];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v18 = v14;
      __int16 v19 = 2112;
      v20 = v12;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch bulletin registrations on accessory %@: %@", buf, 0x20u);
    }
    id v10 = 0;
  }

  return v10;
}

- (id)characteristicFromInstanceID:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_MKFCharacteristic fetchRequest];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K.%K == %@) AND (%K == %@)", @"service", @"accessory", self, @"instanceID", v6];
  [v8 setPredicate:v9];

  id v19 = 0;
  id v10 = [v7 executeFetchRequest:v8 error:&v19];
  id v11 = v19;
  if (v10)
  {
    v12 = [v10 firstObject];
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [(_MKFHAPAccessory *)v14 modelID];
      *(_DWORD *)buf = 138544130;
      __int16 v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristics with accessory UUID %@ & instanceID %@: %@", buf, 0x2Au);
    }
    v12 = 0;
  }

  return v12;
}

- (id)serviceWithID:(id)a3 context:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_MKFService fetchRequest];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"accessory", self, @"instanceID", v6];
  [v8 setPredicate:v9];

  id v18 = 0;
  id v10 = [v7 executeFetchRequest:v8 error:&v18];
  id v11 = v18;
  if (v10)
  {
    v12 = [v10 firstObject];
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch services with instanceID %@: %@", buf, 0x20u);
    }
    v12 = 0;
  }

  return v12;
}

- (BOOL)hasRGCapableService
{
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = [(_MKFHAPAccessory *)self services];
  char v5 = objc_msgSend(v4, "hmf_isEmpty");

  BOOL v8 = 0;
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(_MKFHAPAccessory *)self services];
    id v7 = objc_msgSend((id)v6, "na_map:", &__block_literal_global_165469);

    LOBYTE(v6) = [MEMORY[0x263F0E6E8] doesAccessoryHaveRestrictedGuestCapableServiceTypes:v7];
    if (v6) {
      BOOL v8 = 1;
    }
  }
  return v8;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end