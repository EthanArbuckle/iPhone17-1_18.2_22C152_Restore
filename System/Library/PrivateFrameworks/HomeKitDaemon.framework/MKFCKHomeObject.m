@interface MKFCKHomeObject
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (id)rootKeyPath;
+ (unint64_t)cloudStoreTypes;
- (BOOL)_exportSiblingRelationshipsFromLocalModel:(void *)a3 localRelationship:(void *)a4 context:;
- (BOOL)_importSiblingRelationshipsIntoLocalModel:(void *)a3 localRelationship:(void *)a4 context:;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)isReadyToImportIntoLocalModelWithContext:(id)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (BOOL)validateHome:(id *)a3 error:(id *)a4;
- (BOOL)validateHomeModelID:(id *)a3 error:(id *)a4;
- (id)_accessoryWithModelID:(void *)a3 context:;
- (uint64_t)_validateConstraints:(uint64_t)result;
- (void)_exportSiblingRelationshipsFromLocalModel:(void *)a3 localRelationship:(void *)a4 cloudRelationship:(void *)a5 context:;
- (void)_importSiblingRelationshipsIntoLocalModel:(void *)a3 localRelationship:(void *)a4 cloudRelationship:(void *)a5 context:;
- (void)willSave;
@end

@implementation MKFCKHomeObject

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (BOOL)validateForUpdate:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKFCKHomeObject;
  unsigned int v5 = -[HMDManagedObject validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5) {
    LOBYTE(v5) = -[MKFCKHomeObject _validateConstraints:]((uint64_t)self, a3);
  }
  return v5;
}

- (uint64_t)_validateConstraints:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)result;
    if (([(id)result shouldSkipValidationDuringImport] & 1) == 0)
    {
      uint64_t v4 = [v3 home];
      if (v4)
      {
        unsigned int v5 = (void *)v4;
        uint64_t v6 = [v3 homeModelID];
        if (v6)
        {
          objc_super v7 = (void *)v6;
          id v8 = [v3 home];
          id v9 = [v8 modelID];
          id v10 = [v3 homeModelID];
          char v11 = [v9 isEqual:v10];

          if ((v11 & 1) == 0)
          {
            if (!a2) {
              return 0;
            }
            objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"homeModelID must match home.modelID");
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            result = 0;
            *a2 = v12;
            return result;
          }
        }
        else
        {
        }
      }
    }
    return 1;
  }
  return result;
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKFCKHomeObject;
  unsigned int v5 = -[HMDManagedObject validateForInsert:](&v7, sel_validateForInsert_);
  if (v5) {
    LOBYTE(v5) = -[MKFCKHomeObject _validateConstraints:]((uint64_t)self, a3);
  }
  return v5;
}

- (void)willSave
{
  v7.receiver = self;
  v7.super_class = (Class)MKFCKHomeObject;
  [(MKFCKModel *)&v7 willSave];
  v3 = [(MKFCKHomeObject *)self homeModelID];

  if (!v3)
  {
    uint64_t v4 = [(MKFCKHomeObject *)self home];
    unsigned int v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 modelID];
      [(MKFCKHomeObject *)self setHomeModelID:v6];
    }
  }
}

- (BOOL)isReadyToImportIntoLocalModelWithContext:(id)a3
{
  return 1;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = a1;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    v18 = objc_msgSend(v10, "hmd_debugIdentifier");
    int v20 = 138544130;
    v21 = v17;
    __int16 v22 = 2112;
    v23 = v18;
    __int16 v24 = 2160;
    uint64_t v25 = 1752392040;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Local model deleted: %@::%{mask.hash}@", (uint8_t *)&v20, 0x2Au);
  }

  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v13 objectWithID:v10];
  id v15 = MKFPropertyNamesFromDescriptions(v11);
  id v16 = [a1 fetchWithLocalModel:v14 context:v13];
  v17 = v16;
  if (!v16)
  {
    v38 = v15;
    v19 = (void *)MEMORY[0x230FBD990]();
    id v32 = a1;
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v40 = v33;
      __int16 v41 = 2112;
      v42 = v14;
      __int16 v43 = 2114;
      v44 = v38;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Local model updated but no cloud model exists: %@ (%{public}@)", buf, 0x20u);
    }
    goto LABEL_17;
  }
  if ([v16 exportFromLocalModel:v14 updatedProperties:v11 context:v13])
  {
    id v37 = v12;
    v38 = v15;
    int v18 = [v17 hasPersistentChangedValues];
    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    v21 = HMFGetOSLogHandle();
    __int16 v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v40 = v23;
        __int16 v41 = 2112;
        v42 = v17;
        __int16 v43 = 2114;
        v44 = v38;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);
      }
      __int16 v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = v20;
      __int16 v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v27 = v36 = v24;
        uint64_t v28 = [v17 debugDescription];
        *(_DWORD *)buf = 138543618;
        v40 = v27;
        __int16 v41 = 2112;
        v42 = v28;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        __int16 v24 = v36;
      }

      v19 = (void *)MEMORY[0x230FBD990]();
      id v29 = v25;
      __int16 v22 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      v30 = HMFGetLogIdentifier();
      v31 = [v14 debugDescription];
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        id v12 = v37;
LABEL_17:

        BOOL v34 = 1;
        id v15 = v38;
        goto LABEL_18;
      }
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      __int16 v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);
    }

    goto LABEL_16;
  }
  BOOL v34 = 0;
LABEL_18:

  return v34;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectWithID:v8];
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = a1;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    int v17 = 138543618;
    int v18 = v15;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Local model inserted, waiting for home update to insert cloud model: %@", (uint8_t *)&v17, 0x16u);
  }

  return 1;
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = a1;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    int v18 = objc_msgSend(v10, "hmd_debugIdentifier");
    int v20 = 138544130;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    v23 = v18;
    __int16 v24 = 2160;
    uint64_t v25 = 1752392040;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Cloud model deleted: %@::%{mask.hash}@", (uint8_t *)&v20, 0x2Au);
  }

  return 1;
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v13 objectWithID:v10];
  id v15 = MKFPropertyNamesFromDescriptions(v11);
  id v16 = [v14 fetchLocalModelWithContext:v13];
  if (!v16)
  {
    id v37 = v15;
    int v18 = (void *)MEMORY[0x230FBD990]();
    id v31 = a1;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v39 = v32;
      __int16 v40 = 2112;
      __int16 v41 = v14;
      __int16 v42 = 2114;
      __int16 v43 = v37;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Cloud model updated, waiting for home update to insert local model: %@ (%{public}@)", buf, 0x20u);
    }
    goto LABEL_17;
  }
  if ([v14 importIntoLocalModel:v16 updatedProperties:v11 context:v13])
  {
    id v36 = v12;
    id v37 = v15;
    int v17 = [v16 hasPersistentChangedValues];
    int v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1;
    int v20 = HMFGetOSLogHandle();
    uint64_t v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v39 = v22;
        __int16 v40 = 2112;
        __int16 v41 = v16;
        __int16 v42 = 2114;
        __int16 v43 = v37;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);
      }
      v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = v19;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v26 = v35 = v23;
        id v27 = [v16 debugDescription];
        *(_DWORD *)buf = 138543618;
        v39 = v26;
        __int16 v40 = 2112;
        __int16 v41 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        v23 = v35;
      }

      int v18 = (void *)MEMORY[0x230FBD990]();
      id v28 = v24;
      uint64_t v21 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      id v29 = HMFGetLogIdentifier();
      v30 = [v14 debugDescription];
      *(_DWORD *)buf = 138543618;
      v39 = v29;
      __int16 v40 = 2112;
      __int16 v41 = v30;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        id v12 = v36;
LABEL_17:

        BOOL v33 = 1;
        id v15 = v37;
        goto LABEL_18;
      }
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v29;
      __int16 v40 = 2112;
      __int16 v41 = v16;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);
    }

    goto LABEL_16;
  }
  BOOL v33 = 0;
LABEL_18:

  return v33;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectWithID:v8];
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = a1;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    int v17 = 138543618;
    int v18 = v15;
    __int16 v19 = 2112;
    int v20 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Cloud model inserted, waiting for home update to insert local model: %@", (uint8_t *)&v17, 0x16u);
  }

  return 1;
}

+ (id)rootKeyPath
{
  return @"home";
}

+ (unint64_t)cloudStoreTypes
{
  return 1;
}

- (BOOL)validateHomeModelID:(id *)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]
    || !*a3
    || (objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, @"homeModelID", a4) & 1) != 0)
  {
    return 1;
  }
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = *a3;
    int v14 = 138543874;
    id v15 = v11;
    __int16 v16 = 2114;
    int v17 = @"homeModelID";
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v14, 0x20u);
  }
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"homeModelID");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a4 = v13;
  return result;
}

- (BOOL)validateHome:(id *)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]) {
    return 1;
  }
  id v7 = *a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (v7) {
      return 1;
    }
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    id v14 = *a3;
    int v16 = 138543874;
    int v17 = v13;
    __int16 v18 = 2114;
    id v19 = @"home";
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v16, 0x20u);
  }
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"home");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a4 = v15;
  return result;
}

- (id)_accessoryWithModelID:(void *)a3 context:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = +[MKFCKAccessory fetchRequest];
    id v8 = (void *)MEMORY[0x263F08A98];
    id v9 = [a1 home];
    id v10 = [v8 predicateWithFormat:@"%K == %@ && %K == %@", @"home", v9, @"modelID", v5];
    [v7 setPredicate:v10];

    id v18 = 0;
    id v11 = [v6 executeFetchRequest:v7 error:&v18];
    id v12 = v18;
    if (v11)
    {
      a1 = [v11 firstObject];
    }
    else
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = a1;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v20 = v16;
        __int16 v21 = 2160;
        uint64_t v22 = 1752392040;
        __int16 v23 = 2112;
        id v24 = v5;
        __int16 v25 = 2114;
        id v26 = v12;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessories for modelID %{mask.hash}@: %{public}@", buf, 0x2Au);
      }
      a1 = 0;
    }
  }
  return a1;
}

- (BOOL)_importSiblingRelationshipsIntoLocalModel:(void *)a3 localRelationship:(void *)a4 context:
{
  if (a1)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    id v10 = [v9 entity];
    id v11 = [v10 relationshipsByName];
    id v12 = [v11 objectForKeyedSubscript:v8];

    id v13 = [a1 relationshipForLocalName:v8 localModel:v9];

    -[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:cloudRelationship:context:](a1, v9, v12, v13, v7);
  }
  return a1 != 0;
}

- (void)_importSiblingRelationshipsIntoLocalModel:(void *)a3 localRelationship:(void *)a4 cloudRelationship:(void *)a5 context:
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  id v12 = [a3 name];
  id v13 = [v11 mutableSetValueForKey:v12];

  id v14 = [v10 name];

  id v15 = [a1 valueForKey:v14];

  int v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke;
  v29[3] = &unk_264A26938;
  id v17 = v16;
  id v30 = v17;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2;
  v24[3] = &unk_264A19C90;
  id v25 = v17;
  id v18 = v9;
  id v26 = v18;
  uint64_t v27 = a1;
  id v19 = v13;
  id v28 = v19;
  id v20 = v17;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_11;
  v22[3] = &unk_264A19CB8;
  id v23 = v19;
  id v21 = v19;
  [v20 enumerateKeysAndObjectsUsingBlock:v22];
}

void __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 modelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 modelID];
  [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v4];
  id v5 = [v3 fetchLocalModelWithContext:*(void *)(a1 + 40)];
  if (v5)
  {
    if (([*(id *)(a1 + 56) containsObject:v5] & 1) == 0) {
      [*(id *)(a1 + 56) addObject:v5];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 48);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@No local sibling found, home import will fix it later: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 32) removeObject:v4];
  }
}

void __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 modelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (![v5 isDeletedLocallyWithContext:*(void *)(a1 + 32)])
  {
    int v10 = [v5 modelID];
    uint64_t v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v10];
    if (v11)
    {
      [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:v10];
      __int16 v12 = (void *)v11;
    }
    else
    {
      __int16 v12 = [v5 createLocalModelWithContext:*(void *)(a1 + 32)];
    }
    id v13 = [MEMORY[0x263EFFA08] set];
    char v14 = [v5 importIntoLocalModel:v12 updatedProperties:v13 context:*(void *)(a1 + 32)];

    if ((v14 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a3 = 1;
LABEL_29:

      goto LABEL_30;
    }
    if (v11)
    {
      int v15 = [v12 hasPersistentChangedValues];
      int v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 40);
      id v18 = HMFGetOSLogHandle();
      id v19 = v18;
      if (!v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          __int16 v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v44 = v41;
          __int16 v45 = 2112;
          id v46 = v12;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);
        }
        goto LABEL_28;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = HMFGetLogIdentifier();
        __int16 v42 = [v12 changedValues];
        id v21 = [v42 allKeys];
        uint64_t v22 = [v21 sortedArrayUsingSelector:sel_compare_];
        *(_DWORD *)buf = 138543874;
        uint64_t v44 = v20;
        __int16 v45 = 2112;
        id v46 = v12;
        __int16 v47 = 2114;
        v48 = v22;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);
      }
      id v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 40);
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        uint64_t v27 = [v12 debugDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v26;
        __int16 v45 = 2112;
        id v46 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
      }
      int v16 = (void *)MEMORY[0x230FBD990]();
      id v28 = *(id *)(a1 + 40);
      id v29 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
LABEL_24:

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 40);
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v33;
        __int16 v45 = 2112;
        id v46 = v12;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);
      }
      BOOL v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = *(id *)(a1 + 40);
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = HMFGetLogIdentifier();
        v38 = [v12 debugDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v37;
        __int16 v45 = 2112;
        id v46 = v38;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
      }
      int v16 = (void *)MEMORY[0x230FBD990]();
      id v28 = *(id *)(a1 + 40);
      id v29 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
    }
    v39 = HMFGetLogIdentifier();
    __int16 v40 = [v5 debugDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v39;
    __int16 v45 = 2112;
    id v46 = v40;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    goto LABEL_24;
  }
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v9;
    __int16 v45 = 2112;
    id v46 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Skip create/update since model is already deleted locally: %@", buf, 0x16u);
  }
LABEL_30:
}

- (BOOL)_exportSiblingRelationshipsFromLocalModel:(void *)a3 localRelationship:(void *)a4 context:
{
  if (a1)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    int v10 = [v9 entity];
    uint64_t v11 = [v10 relationshipsByName];
    __int16 v12 = [v11 objectForKeyedSubscript:v8];

    id v13 = [a1 relationshipForLocalName:v8 localModel:v9];

    -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:cloudRelationship:context:](a1, v9, v12, v13, v7);
  }
  return a1 != 0;
}

- (void)_exportSiblingRelationshipsFromLocalModel:(void *)a3 localRelationship:(void *)a4 cloudRelationship:(void *)a5 context:
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  __int16 v12 = [a3 name];
  id v13 = [v11 valueForKey:v12];

  char v14 = [v10 name];

  int v15 = [a1 mutableSetValueForKey:v14];

  int v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke;
  v29[3] = &unk_264A19D08;
  id v17 = v16;
  id v30 = v17;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_2;
  v24[3] = &unk_264A19D30;
  id v25 = v17;
  id v18 = v9;
  id v26 = v18;
  uint64_t v27 = a1;
  id v19 = v15;
  id v28 = v19;
  id v20 = v17;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_15;
  v22[3] = &unk_264A19D58;
  id v23 = v19;
  id v21 = v19;
  [v20 enumerateKeysAndObjectsUsingBlock:v22];
}

void __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 modelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 entity];
  id v5 = +[HMDCoreDataCloudTransform exportTransformableClassFromEntity:v4];

  id v6 = [v3 modelID];
  [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v6];
  id v7 = [(objc_class *)v5 fetchWithLocalModel:v3 context:*(void *)(a1 + 40)];
  if (v7)
  {
    if (([*(id *)(a1 + 56) containsObject:v7] & 1) == 0) {
      [*(id *)(a1 + 56) addObject:v7];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 48);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@No cloud sibling found, home export will fix it later: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

void __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 32) removeObject:v4];
  }
}

@end