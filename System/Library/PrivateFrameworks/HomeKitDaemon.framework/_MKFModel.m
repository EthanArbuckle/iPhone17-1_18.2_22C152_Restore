@interface _MKFModel
+ (Protocol)backingModelProtocol;
+ (id)modelWithModelID:(id)a3 context:(id)a4;
+ (id)modelWithModelID:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (BOOL)validateForInsertOrUpdateWithParentKey:(id)a3 error:(id *)a4;
- (BOOL)validateModelID:(id *)a3 error:(id *)a4;
- (BOOL)validateWriterTimestamp:(id *)a3 error:(id *)a4;
- (MKFModelDatabaseID)databaseID;
- (NSString)description;
- (id)hmd_debugIdentifier;
- (id)redactedDescription;
- (void)deleteObjects:(id)a3;
- (void)willSave;
@end

@implementation _MKFModel

- (id)redactedDescription
{
  v3 = [(_MKFModel *)self modelID];
  if (v3)
  {
    v4 = NSString;
    v5 = [(_MKFModel *)self objectID];
    v6 = objc_msgSend(v5, "hmd_debugIdentifier");
    v7 = [v4 stringWithFormat:@"<%@: %lu>", v6, objc_msgSend(v3, "hash")];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKFModel;
    v7 = [(HMDManagedObject *)&v9 redactedDescription];
  }

  return v7;
}

- (NSString)description
{
  v3 = [(_MKFModel *)self modelID];
  if (v3)
  {
    v4 = NSString;
    v5 = [(_MKFModel *)self objectID];
    v6 = objc_msgSend(v5, "hmd_debugIdentifier");
    v7 = [v4 stringWithFormat:@"<%@: %@>", v6, v3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKFModel;
    v7 = [(HMDManagedObject *)&v9 description];
  }

  return (NSString *)v7;
}

- (id)hmd_debugIdentifier
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MKFModel;
  v4 = [(NSManagedObject *)&v8 hmd_debugIdentifier];
  v5 = [(_MKFModel *)self modelID];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (BOOL)validateWriterTimestamp:(id *)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = *a3;
  if (!*a3)
  {
    if ([(_MKFModel *)self isInserted]) {
      return 1;
    }
    id v7 = *a3;
  }
  id v9 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  BOOL v8 = v11 != 0;
  if (!v11)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      id v16 = *a3;
      int v18 = 138543874;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = @"writerTimestamp";
      __int16 v22 = 2112;
      id v23 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %@: %@", (uint8_t *)&v18, 0x20u);
    }
    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"writerTimestamp");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)validateModelID:(id *)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v6 = objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, @"modelID", a4);
  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    BOOL v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      id v11 = *a3;
      int v13 = 138543874;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = @"modelID";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %@: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  return v6;
}

- (BOOL)validateForInsertOrUpdateWithParentKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MKFModel;
  if ([(HMDManagedObject *)&v12 validateForInsertOrUpdate:a4])
  {
    id v7 = [(_MKFModel *)self entity];
    if (v6
      && ([(_MKFModel *)self valueForKey:v6],
          BOOL v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {
      if (a4)
      {
        v10 = (void *)MEMORY[0x263F087E8];
        id v11 = [NSString stringWithFormat:@"%@ is required", v6];
        objc_msgSend(v10, "hmd_validationErrorWithDescription:managedObject:attributeName:", v11, self, v6);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      LOBYTE(a4) = 1;
    }
  }
  else
  {
    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v5 = [(_MKFModel *)self entity];
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"parent"];

  LOBYTE(a3) = [(_MKFModel *)self validateForInsertOrUpdateWithParentKey:v7 error:a3];
  return (char)a3;
}

- (void)willSave
{
  v22.receiver = self;
  v22.super_class = (Class)_MKFModel;
  [(_MKFModel *)&v22 willSave];
  if (([(_MKFModel *)self isDeleted] & 1) == 0)
  {
    if ([(_MKFModel *)self isInserted])
    {
      v3 = [(_MKFModel *)self writerTimestamp];

      if (v3) {
        return;
      }
      v4 = [MEMORY[0x263EFF910] now];
      [(_MKFModel *)self setWriterTimestamp:v4];
      goto LABEL_12;
    }
    if ([(_MKFModel *)self hasChanges])
    {
      v5 = [(_MKFModel *)self managedObjectContext];
      uint64_t v6 = objc_msgSend(v5, "hmd_transactionAuthor");

      if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        v4 = [(_MKFModel *)self changedValues];
        if ([v4 count])
        {
          id v7 = [v4 objectForKeyedSubscript:@"writerTimestamp"];

          if (!v7)
          {
            uint64_t v18 = 0;
            uint64_t v19 = &v18;
            uint64_t v20 = 0x2020000000;
            char v21 = 0;
            BOOL v8 = [(_MKFModel *)self entity];
            id v9 = [v8 attributesByName];

            uint64_t v12 = MEMORY[0x263EF8330];
            uint64_t v13 = 3221225472;
            v14 = __21___MKFModel_willSave__block_invoke;
            __int16 v15 = &unk_264A26960;
            id v10 = v9;
            id v16 = v10;
            __int16 v17 = &v18;
            [v4 enumerateKeysAndObjectsUsingBlock:&v12];
            if (*((unsigned char *)v19 + 24))
            {
              id v11 = objc_msgSend(MEMORY[0x263EFF910], "now", v12, v13, v14, v15);
              [(_MKFModel *)self setWriterTimestamp:v11];
            }
            _Block_object_dispose(&v18, 8);
          }
        }
LABEL_12:
      }
    }
  }
}

- (MKFModelDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFModelDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  return 1;
}

- (void)deleteObjects:(id)a3
{
  id v4 = a3;
  v5 = [(_MKFModel *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27___MKFModel_deleteObjects___block_invoke;
  v7[3] = &unk_264A26938;
  id v8 = v5;
  id v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E480D78;
}

+ (id)modelWithModelID:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  id v8 = [a1 modelWithModelID:v6 context:v7 error:&v15];
  id v9 = v15;
  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch model with modelID %@: %@", buf, 0x20u);
    }
  }

  return v8;
}

+ (id)modelWithModelID:(id)a3 context:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 fetchRequest];
  id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"modelID", v9];

  [v10 setPredicate:v11];
  [v10 setFetchBatchSize:1];
  v16[0] = @"modelID";
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v10 setPropertiesToFetch:v12];

  uint64_t v13 = [v8 executeFetchRequest:v10 error:a5];

  if (v13)
  {
    v14 = [v13 firstObject];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end