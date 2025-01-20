@interface _MKFHomeAccessCode
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (BOOL)_validateParentsForInsertOrUpdate:(id *)a3;
- (BOOL)validateAccessCodeForInsertOrUpdate:(id *)a3;
- (MKFHomeAccessCodeDatabaseID)databaseID;
- (id)fetchOtherGuestAccessCodesInHome:(id)a3;
- (id)fetchOtherGuestUserAccessCodesInHome:(id)a3;
- (id)fetchOtherUserAccessCodesInHome:(id)a3;
- (id)homeForHomeAccessCode:(id)a3;
@end

@implementation _MKFHomeAccessCode

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4F8740;
}

- (MKFHomeAccessCodeDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomeAccessCodeDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomeAccessCode"];
}

- (BOOL)_validateParentsForInsertOrUpdate:(id *)a3
{
  v5 = [(_MKFHomeAccessCode *)self entity];
  v6 = +[_MKFUserAccessCode entity];
  int v7 = [v5 isKindOfEntity:v6];

  if (v7)
  {
    if ([(_MKFModel *)self validateForInsertOrUpdateWithParentKey:@"user" error:a3])
    {
      return 1;
    }
    else
    {
      return [(_MKFModel *)self validateForInsertOrUpdateWithParentKey:@"guest" error:a3];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKFHomeAccessCode;
    return [(_MKFModel *)&v9 validateForInsertOrUpdate:a3];
  }
}

- (id)fetchOtherGuestAccessCodesInHome:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[_MKFGuestAccessCode fetchRequest];
  v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"home", v4];
  int v7 = (void *)MEMORY[0x263F08A98];
  v8 = [(_MKFHomeAccessCode *)self modelID];
  objc_super v9 = [v7 predicateWithFormat:@"(%K != %@)", @"modelID", v8];

  v10 = (void *)MEMORY[0x263F08730];
  v26[0] = v6;
  v26[1] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v12 = [v10 andPredicateWithSubpredicates:v11];
  [v5 setPredicate:v12];

  v13 = [(_MKFHomeAccessCode *)self managedObjectContext];
  id v21 = 0;
  v14 = [v13 executeFetchRequest:v5 error:&v21];
  id v15 = v21;

  if (v15)
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the guest accessCodes : %@", buf, 0x16u);
    }
  }

  return v14;
}

- (id)fetchOtherGuestUserAccessCodesInHome:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[_MKFUserAccessCode fetchRequest];
  v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K.%K == %@)", @"guest", @"home", v4];
  int v7 = (void *)MEMORY[0x263F08A98];
  v8 = [(_MKFHomeAccessCode *)self modelID];
  objc_super v9 = [v7 predicateWithFormat:@"(%K != %@)", @"modelID", v8];

  v10 = (void *)MEMORY[0x263F08730];
  v26[0] = v6;
  v26[1] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v12 = [v10 andPredicateWithSubpredicates:v11];
  [v5 setPredicate:v12];

  v13 = [(_MKFHomeAccessCode *)self managedObjectContext];
  id v21 = 0;
  v14 = [v13 executeFetchRequest:v5 error:&v21];
  id v15 = v21;

  if (v15)
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the accessCodes for guest: %@", buf, 0x16u);
    }
  }

  return v14;
}

- (id)fetchOtherUserAccessCodesInHome:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[_MKFUserAccessCode fetchRequest];
  v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K.%K == %@)", @"user", @"home", v4];
  int v7 = (void *)MEMORY[0x263F08A98];
  v8 = [(_MKFHomeAccessCode *)self modelID];
  objc_super v9 = [v7 predicateWithFormat:@"(%K != %@)", @"modelID", v8];

  v10 = (void *)MEMORY[0x263F08730];
  v26[0] = v6;
  v26[1] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v12 = [v10 andPredicateWithSubpredicates:v11];
  [v5 setPredicate:v12];

  v13 = [(_MKFHomeAccessCode *)self managedObjectContext];
  id v21 = 0;
  v14 = [v13 executeFetchRequest:v5 error:&v21];
  id v15 = v21;

  if (v15)
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the accessCodes for user: %@", buf, 0x16u);
    }
  }

  return v14;
}

- (id)homeForHomeAccessCode:(id)a3
{
  id v4 = [(_MKFHomeAccessCode *)self entity];
  v5 = +[_MKFUserAccessCode entity];
  int v6 = [v4 isKindOfEntity:v5];

  if (v6)
  {
    int v7 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    objc_super v9 = v8;

    v10 = [(_MKFHomeAccessCode *)v9 user];
    v11 = [v10 home];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      v22 = [(_MKFHomeAccessCode *)v9 guest];
      id v13 = [v22 home];
    }
LABEL_15:

    goto LABEL_16;
  }
  v14 = [(_MKFHomeAccessCode *)self entity];
  id v15 = +[_MKFGuestAccessCode entity];
  int v16 = [v14 isKindOfEntity:v15];

  if (v16
    || ([(_MKFHomeAccessCode *)self entity],
        v17 = objc_claimAutoreleasedReturnValue(),
        +[_MKFRemovedUserAccessCode entity],
        v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v17 isKindOfEntity:v18],
        v18,
        v17,
        v19))
  {
    v20 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    objc_super v9 = v21;

    id v13 = [(_MKFHomeAccessCode *)v9 home];
    goto LABEL_15;
  }
  id v13 = 0;
LABEL_16:
  return v13;
}

- (BOOL)validateAccessCodeForInsertOrUpdate:(id *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  int v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v44 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Validating access code for insert or update", buf, 0xCu);
  }
  if (![(_MKFHomeAccessCode *)v6 _validateParentsForInsertOrUpdate:a3])
  {
    int v19 = (void *)MEMORY[0x230FBD990]();
    v20 = v6;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Validation failed in the super class", buf, 0xCu);
    }
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  objc_super v9 = [(_MKFHomeAccessCode *)v6 accessCode];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    __int16 v24 = v6;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Validation failed because the access code has zero length", buf, 0xCu);
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"Access code must not be empty.");
      char v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v18;
    }
    return 0;
  }
  v11 = [(_MKFHomeAccessCode *)v6 entity];
  v12 = +[_MKFRemovedUserAccessCode entity];
  int v13 = [v11 isKindOfEntity:v12];

  if (v13)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = v6;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Not enforcing value uniqueness on access code because it is a RemovedUserAccessCode", buf, 0xCu);
    }
    return 1;
  }
  else
  {
    v27 = [(_MKFHomeAccessCode *)v6 homeForHomeAccessCode:v6];
    v28 = [(_MKFHomeAccessCode *)v6 fetchOtherUserAccessCodesInHome:v27];
    v29 = [(_MKFHomeAccessCode *)v6 fetchOtherGuestAccessCodesInHome:v27];
    uint64_t v30 = [(_MKFHomeAccessCode *)v6 fetchOtherGuestUserAccessCodesInHome:v27];
    v31 = (void *)v30;
    char v18 = 0;
    if (v28 && v29 && v30)
    {
      v32 = [MEMORY[0x263EFF980] array];
      [v32 addObjectsFromArray:v28];
      [v32 addObjectsFromArray:v29];
      [v32 addObjectsFromArray:v31];
      v33 = [v32 asSet];
      v34 = objc_msgSend(v33, "na_map:", &__block_literal_global_188977);

      v35 = (void *)MEMORY[0x263F0DEC0];
      v36 = [(_MKFHomeAccessCode *)v6 accessCode];
      int v37 = [v35 doesAccessCode:v36 conflictWithExistingAccessCodes:v34];

      if (v37)
      {
        context = (void *)MEMORY[0x230FBD990]();
        v38 = v6;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v44 = v41;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Validation failed because the access code conflicts with an existing access code", buf, 0xCu);
        }
        if (a3)
        {
          objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"Access code must be unique within home");
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      char v18 = v37 ^ 1;
    }
  }
  return v18;
}

@end