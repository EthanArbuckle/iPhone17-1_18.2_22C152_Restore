@interface _MKFHomeManager
+ (Class)cd_modelClass;
+ (NSUUID)defaultModelID;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)fetchWithContext:(id)a3 error:(id *)a4;
- (BOOL)validateModelID:(id *)a3 error:(id *)a4;
- (MKFHomeManagerDatabaseID)databaseID;
- (NSArray)accounts;
- (NSArray)homes;
- (NSArray)incomingInvitations;
- (id)findAccountsRelationWithModelID:(id)a3;
- (id)findHomesRelationWithModelID:(id)a3;
- (id)findIncomingInvitationsRelationWithModelID:(id)a3;
- (id)hmd_modelsWithChangeType:(unint64_t)a3 detached:(BOOL)a4 error:(id *)a5;
- (id)materializeOrCreateAccountsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateHomesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateIncomingInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateMetadataRelation:(BOOL *)a3;
- (void)awakeFromInsert;
@end

@implementation _MKFHomeManager

- (id)materializeOrCreateMetadataRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"metadata" modelProtocol:@"MKFHAPMetadata" keyValue:0 createdNew:a3];
}

- (id)findIncomingInvitationsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"incomingInvitations_" modelProtocol:@"MKFIncomingInvitation" keyValue:a3];
}

- (id)materializeOrCreateIncomingInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"incomingInvitations_" modelProtocol:@"MKFIncomingInvitation" keyValue:a3 createdNew:a4];
}

- (NSArray)incomingInvitations
{
  v2 = [(_MKFHomeManager *)self valueForKey:@"incomingInvitations_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)findHomesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"homes_" modelProtocol:@"MKFHomeManagerHome" keyValue:a3];
}

- (id)materializeOrCreateHomesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"homes_" modelProtocol:@"MKFHomeManagerHome" keyValue:a3 createdNew:a4];
}

- (NSArray)homes
{
  v2 = [(_MKFHomeManager *)self valueForKey:@"homes_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)findAccountsRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"accounts_" modelProtocol:@"MKFAccount" keyValue:a3];
}

- (id)materializeOrCreateAccountsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"accounts_" modelProtocol:@"MKFAccount" keyValue:a3 createdNew:a4];
}

- (NSArray)accounts
{
  v2 = [(_MKFHomeManager *)self valueForKey:@"accounts_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHomeManagerDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeManagerDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E52DFF0;
}

+ (id)fetchWithContext:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [a1 fetchRequest];
  v8 = (void *)MEMORY[0x263F08A98];
  v9 = +[_MKFHomeManager defaultModelID];
  v10 = [v8 predicateWithFormat:@"%K == %@", @"modelID", v9];
  [v7 setPredicate:v10];

  id v19 = 0;
  v11 = [v6 executeFetchRequest:v7 error:&v19];
  id v12 = v19;
  if (v11)
  {
    v13 = [v11 firstObject];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home managers: %@", buf, 0x16u);
    }
    v13 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v13;
}

+ (NSUUID)defaultModelID
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  return (NSUUID *)v2;
}

- (BOOL)validateModelID:(id *)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)_MKFHomeManager;
  BOOL v7 = -[_MKFModel validateModelID:error:](&v17, sel_validateModelID_error_);
  if (v7)
  {
    v8 = [(id)objc_opt_class() defaultModelID];
    char v9 = [v8 isEqual:*a3];

    if (v9)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        id v14 = *a3;
        *(_DWORD *)buf = 138543874;
        id v19 = v13;
        __int16 v20 = 2112;
        v21 = @"modelID";
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %@: %@", buf, 0x20u);
      }
      objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"modelID");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = 0;
      *a4 = v15;
    }
  }
  return v7;
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)_MKFHomeManager;
  [(_MKFHomeManager *)&v4 awakeFromInsert];
  v3 = [(id)objc_opt_class() defaultModelID];
  [(_MKFHomeManager *)self setPrimitiveModelID:v3];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeManager"];
}

- (id)hmd_modelsWithChangeType:(unint64_t)a3 detached:(BOOL)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = [(HMDBackingStoreModelObject *)[HMDHomeManagerModel alloc] initWithManagedObject:self changeType:a3 detached:a4 error:a5];
  if (v6)
  {
    uint64_t v7 = +[HMDApplicationDataModel cd_modelWithMKFHomeManager:self];
    v8 = (void *)v7;
    if (v7)
    {
      id v15 = v6;
      uint64_t v16 = v7;
      char v9 = (void *)MEMORY[0x263EFF8C0];
      v10 = &v15;
      uint64_t v11 = 2;
    }
    else
    {
      id v14 = v6;
      char v9 = (void *)MEMORY[0x263EFF8C0];
      v10 = &v14;
      uint64_t v11 = 1;
    }
    id v12 = objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v14, v15, v16, v17);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end