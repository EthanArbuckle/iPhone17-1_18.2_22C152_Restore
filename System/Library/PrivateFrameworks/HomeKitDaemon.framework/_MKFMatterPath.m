@interface _MKFMatterPath
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)_validateParentsForInsertOrUpdate:(id *)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFHome)home;
- (MKFMatterPathDatabaseID)databaseID;
- (NSArray)actionCommands;
- (NSArray)eventAttributes;
- (NSArray)matterBulletinRegistrations;
- (NSUUID)hmd_parentModelID;
- (id)findAccessoryRelationWithModelID:(id)a3;
- (id)findMatterBulletinRegistrationsRelationWithModelID:(id)a3;
- (id)materializeOrCreateAccessoryRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateMatterBulletinRegistrationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (void)addMatterBulletinRegistrationsObject:(id)a3;
- (void)removeMatterBulletinRegistrationsObject:(id)a3;
@end

@implementation _MKFMatterPath

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFMatterPath"];
}

- (void)removeMatterBulletinRegistrationsObject:(id)a3
{
}

- (void)addMatterBulletinRegistrationsObject:(id)a3
{
}

- (id)findMatterBulletinRegistrationsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"matterBulletinRegistrations_" modelProtocol:@"MKFMatterBulletinRegistration" keyValue:a3];
}

- (id)materializeOrCreateMatterBulletinRegistrationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"matterBulletinRegistrations_" modelProtocol:@"MKFMatterBulletinRegistration" keyValue:a3 createdNew:a4];
}

- (NSArray)matterBulletinRegistrations
{
  v2 = [(_MKFMatterPath *)self valueForKey:@"matterBulletinRegistrations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)eventAttributes
{
  v2 = [(_MKFMatterPath *)self valueForKey:@"eventAttributes_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)actionCommands
{
  v2 = [(_MKFMatterPath *)self valueForKey:@"actionCommands_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)findAccessoryRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"accessory" modelProtocol:@"MKFHAPAccessory" keyValue:a3];
}

- (id)materializeOrCreateAccessoryRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"accessory" modelProtocol:@"MKFHAPAccessory" keyValue:a3 createdNew:a4];
}

- (MKFHome)home
{
  v2 = [(_MKFMatterPath *)self accessory];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFMatterPathDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFMatterPathDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)_validateParentsForInsertOrUpdate:(id *)a3
{
  v5 = +[HMDCoreData featuresDataSource];
  if (![v5 isRVCEnabled])
  {
    BOOL v17 = 1;
LABEL_22:

    return v17;
  }
  v6 = [(_MKFMatterPath *)self entity];
  v7 = +[_MKFMatterPath entity];
  int v8 = [v6 isKindOfEntity:v7];

  if (v8)
  {
    v5 = [(_MKFMatterPath *)self entity];
    v9 = [(_MKFMatterPath *)self valueForKey:@"accessory"];
    if (v9)
    {
      uint64_t v10 = [(_MKFMatterPath *)self valueForKey:@"endpointID"];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = [(_MKFMatterPath *)self valueForKey:@"clusterID"];

        if (v12)
        {
          uint64_t v13 = [(_MKFMatterPath *)self valueForKey:@"attributeID"];
          uint64_t v14 = [(_MKFMatterPath *)self valueForKey:@"commandID"];
          v15 = [(_MKFMatterPath *)self valueForKey:@"eventID"];
          v16 = v15;
          if ((!v13 || !v14) && (!(v13 | v14) || !v15))
          {

            BOOL v17 = 1;
            goto LABEL_21;
          }
          if (a3)
          {
            objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"only attribute/command/event can be set");
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_20;
        }
      }
      if (a3)
      {
        v18 = @"both endpoint and cluster are needed";
        goto LABEL_19;
      }
    }
    else if (a3)
    {
      v18 = @"at least on accessory is required";
LABEL_19:
      objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", v18);
      BOOL v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
LABEL_20:
    BOOL v17 = 0;
    goto LABEL_21;
  }
  return 1;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    v9 = [(_MKFMatterPath *)v6 modelID];
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Validating matter path (%@) for insert or update", (uint8_t *)&v13, 0x16u);
  }
  if (a3) {
    *a3 = 0;
  }
  if (![(_MKFMatterPath *)v6 _validateParentsForInsertOrUpdate:a3]) {
    return 0;
  }
  uint64_t v10 = [(_MKFMatterPath *)v6 accessory];
  BOOL v11 = v10 != 0;

  if (a3 && !v10)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:managedObject:attributeName:", @"at least one accessory is required", v6, @"accessory");
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E57A8B8;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t6 != -1) {
    dispatch_once(&homeRelation__hmf_once_t6, &__block_literal_global_198285);
  }
  v2 = (void *)homeRelation__hmf_once_v7;
  return (NSPredicate *)v2;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  int v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSUUID)hmd_parentModelID
{
  uint64_t v3 = objc_opt_class();
  if (HMDManagedObjectClassIsBSORepresentable(v3))
  {
    id v4 = [(NSManagedObject *)self hmd_lastKnownValueForKey:@"accessory"];
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = objc_msgSend(v4, "hmd_modelID");
    }
    else
    {
      uint64_t v6 = 0;
    }

    return (NSUUID *)v6;
  }
  else
  {
    int v8 = (HMDMatterPathModel *)_HMFPreconditionFailure();
    [(HMDMatterPathModel *)v8 cd_populateParentRelationshipInContext:v10 error:v11];
  }
  return result;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end