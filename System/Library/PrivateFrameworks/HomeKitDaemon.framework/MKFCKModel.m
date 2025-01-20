@interface MKFCKModel
+ (NSArray)defaultPreloadedProperties;
+ (NSString)rootKeyPath;
+ (id)appendDefaultPreloadedPropertiesTo:(id)a3;
+ (id)canonicalModelForModels:(id)a3 context:(id)a4;
+ (id)createWithLocalModel:(id)a3 context:(id)a4;
+ (id)fetchWithLocalModel:(id)a3 context:(id)a4;
+ (id)logCategory;
+ (id)mergedDictionaryFromCloud:(id)a3 localModifications:(id)a4;
+ (id)modelWithModelID:(id)a3 context:(id)a4 error:(id *)a5;
+ (id)modelWithObjectID:(id)a3 context:(id)a4 error:(id *)a5;
+ (id)predicateWithModelID:(id)a3;
+ (id)predicateWithModelIDs:(id)a3;
+ (unint64_t)cloudStoreTypes;
- (BOOL)copyPropertiesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)copyPropertiesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)isDeletedLocallyWithContext:(id)a3;
- (BOOL)isFake;
- (BOOL)shouldExportUpdatedPropertyInSet:(id)a3 name:(id)a4;
- (BOOL)shouldSkipValidationDuringImport;
- (BOOL)validateFlags:(id *)a3 error:(id *)a4;
- (BOOL)validateModelID:(id *)a3 error:(id *)a4;
- (BOOL)validateWriterTimestamp:(id *)a3 error:(id *)a4;
- (BOOL)validateWriterVersion:(id *)a3 error:(id *)a4;
- (id)createLocalModelWithContext:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)fetchEquivalentModels:(id *)a3;
- (id)fetchLocalModelWithContext:(id)a3;
- (id)hmd_debugIdentifier;
- (id)predicateMatchingEquivalentModels;
- (id)redactedDescription;
- (id)relationshipForLocalName:(id)a3 localModel:(id)a4;
- (int64_t)ensureCanonicalModel;
- (void)awakeFromInsert;
- (void)convertToFakeModel;
- (void)didTurnIntoFault;
- (void)willSave;
@end

@implementation MKFCKModel

- (void).cxx_destruct
{
}

- (id)fetchEquivalentModels:(id *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = [(id)objc_opt_class() fetchRequest];
  v6 = [(MKFCKModel *)self predicateMatchingEquivalentModels];
  [v5 setPredicate:v6];

  v7 = [(id)objc_opt_class() defaultPreloadedProperties];
  [v5 setPropertiesToFetch:v7];

  v8 = [(MKFCKModel *)self objectID];
  v9 = [v8 persistentStore];
  v13[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v5 setAffectedStores:v10];

  v11 = [v5 execute:a3];

  return v11;
}

- (id)predicateMatchingEquivalentModels
{
  void v13[2] = *MEMORY[0x263EF8340];
  v3 = [(MKFCKModel *)self modelID];
  v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"modelID", v3];
  v5 = [(id)objc_opt_class() rootKeyPath];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F08A98];
    v7 = [(MKFCKModel *)self valueForKeyPath:v5];
    v8 = [v6 predicateWithFormat:@"%K = %@", v5, v7];

    v9 = (void *)MEMORY[0x263F08730];
    v13[0] = v4;
    v13[1] = v8;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    id v11 = [v9 andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (int64_t)ensureCanonicalModel
{
  v2 = self;
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v3 = 64;
  canonical = self->_canonical;
  if (!canonical)
  {
    v5 = NSNumber;
    if ([(MKFCKModel *)v2 isDeleted])
    {
      uint64_t v6 = -2;
LABEL_64:
      uint64_t v68 = [v5 numberWithInteger:v6];
      v69 = *(Class *)((char *)&v2->super.super.super.isa + v3);
      *(Class *)((char *)&v2->super.super.super.isa + v3) = (Class)v68;

      canonical = *(NSNumber **)((char *)&v2->super.super.super.isa + v3);
      goto LABEL_65;
    }
    v7 = [(MKFCKModel *)v2 objectID];
    v8 = [v7 persistentStore];

    v81 = [(MKFCKModel *)v2 managedObjectContext];
    v9 = objc_msgSend(v81, "hmd_coreData");
    uint64_t v10 = [(id)objc_opt_class() cloudStoreTypes];
    id v11 = [v9 cloudPrivateStore];
    if (v8 == v11)
    {
      uint64_t v13 = 1;
    }
    else
    {
      v12 = [v9 cloudSharedStore];
      uint64_t v13 = 2 * (v8 == v12);
    }
    v78 = v2;
    if ((v13 & v10) == 0)
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v2;
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        v27 = off_264A23240[v13];
        v28 = off_264A23258[v10 & 3];
        *(_DWORD *)buf = 138544130;
        id v88 = v26;
        __int16 v89 = 2114;
        v90 = (MKFCKModel *)v27;
        __int16 v91 = 2114;
        v92 = (MKFCKModel *)v28;
        __int16 v93 = 2112;
        v94 = v24;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring model in %{public}@ store, should be in %{public}@ store: %@", buf, 0x2Au);
      }
      uint64_t v6 = -2;
      v2 = v78;
      goto LABEL_63;
    }
    uint64_t v14 = [(id)objc_opt_class() rootKeyPath];
    v80 = (void *)v14;
    if (v14)
    {
      v15 = [(MKFCKModel *)v2 valueForKeyPath:v14];
      if (!v15)
      {
        v29 = (void *)MEMORY[0x230FBD990]();
        v30 = v2;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v88 = v32;
          __int16 v89 = 2112;
          v90 = v30;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring model without an associated root: %@", buf, 0x16u);
        }
        v33 = 0;
        uint64_t v6 = 0;
        goto LABEL_62;
      }
      v77 = v15;
      unint64_t v16 = [(MKFCKModel *)v15 ensureCanonicalModel];
      uint64_t v6 = v16;
      if (v16 >= 0xFFFFFFFFFFFFFFFELL)
      {
        if (([(MKFCKModel *)v2 isDeleted] & 1) == 0 && v13 == 1)
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          v18 = v2;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = v72 = v5;
            [(MKFCKModel *)v18 debugDescription];
            v21 = v9;
            v22 = (MKFCKModel *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            id v88 = v20;
            __int16 v89 = 2112;
            v90 = v77;
            __int16 v91 = 2112;
            v92 = v18;
            __int16 v93 = 2112;
            v94 = v22;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Deleting model associated with non-canonical root %@: %@\n%@", buf, 0x2Au);

            v9 = v21;
            v5 = v72;
          }

          [v81 deleteObject:v18];
        }
LABEL_61:
        v33 = v77;
LABEL_62:

LABEL_63:
        goto LABEL_64;
      }
      if (!v16)
      {
        v34 = (void *)MEMORY[0x230FBD990]();
        v35 = v2;
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v88 = v37;
          __int16 v89 = 2112;
          v90 = v77;
          __int16 v91 = 2112;
          v92 = v35;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring model while status of associated root %@ is not known: %@", buf, 0x20u);
        }
        uint64_t v6 = 0;
        goto LABEL_61;
      }
    }
    id v86 = 0;
    v38 = [(MKFCKModel *)v2 fetchEquivalentModels:&v86];
    v76 = v38;
    v77 = (MKFCKModel *)v86;
    if (v38)
    {
      if ([v38 count] == 1
        && ([v38 firstObject],
            v39 = (MKFCKModel *)objc_claimAutoreleasedReturnValue(),
            v39,
            BOOL v40 = v39 == v2,
            v38 = v76,
            v40))
      {
        uint64_t v6 = 1;
      }
      else
      {
        v74 = v9;
        v75 = v8;
        v41 = +[MKFCKModel canonicalModelForModels:v38 context:v81];
        if (v13 == 1)
        {
          uint64_t v71 = 64;
          v73 = v5;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id obj = v76;
          uint64_t v42 = [obj countByEnumeratingWithState:&v82 objects:buf count:16];
          v43 = v80;
          if (v42)
          {
            uint64_t v44 = v42;
            uint64_t v45 = *(void *)v83;
            do
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v83 != v45) {
                  objc_enumerationMutation(obj);
                }
                v47 = *(MKFCKModel **)(*((void *)&v82 + 1) + 8 * i);
                if (v47 != v41)
                {
                  v48 = (void *)MEMORY[0x230FBD990]([*(id *)(*((void *)&v82 + 1) + 8 * i) willAccessValueForKey:0]);
                  v49 = v2;
                  v50 = HMFGetOSLogHandle();
                  BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
                  if (v43)
                  {
                    if (v51)
                    {
                      v52 = HMFGetLogIdentifier();
                      v53 = [(MKFCKModel *)v47 debugDescription];
                      *(_DWORD *)v95 = 138543874;
                      *(void *)&v95[4] = v52;
                      *(_WORD *)&v95[12] = 2112;
                      *(void *)&v95[14] = v47;
                      *(_WORD *)&v95[22] = 2112;
                      v96 = v53;
                      _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Merging model with non-unique modelID: %@\n%@", v95, 0x20u);

                      v2 = v78;
                    }

                    v54 = v47;
                    if (v41)
                    {
                      v55 = [(MKFCKModel *)v41 entity];
                      v56 = [v55 relationshipsByName];
                      *(void *)v95 = MEMORY[0x263EF8330];
                      *(void *)&v95[8] = 3221225472;
                      *(void *)&v95[16] = __46__MKFCKModel_mergeRelationshipsFromDuplicate___block_invoke;
                      v96 = &unk_264A231D8;
                      v97 = v41;
                      v98 = v54;
                      [v56 enumerateKeysAndObjectsUsingBlock:v95];
                    }
                    v43 = v80;
                  }
                  else
                  {
                    if (v51)
                    {
                      v57 = HMFGetLogIdentifier();
                      v58 = [(MKFCKModel *)v47 debugDescription];
                      *(_DWORD *)v95 = 138543874;
                      *(void *)&v95[4] = v57;
                      *(_WORD *)&v95[12] = 2112;
                      *(void *)&v95[14] = v47;
                      *(_WORD *)&v95[22] = 2112;
                      v96 = v58;
                      _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Deleting model with non-unique modelID: %@\n%@", v95, 0x20u);

                      v2 = v78;
                      v43 = v80;
                    }
                  }
                  objc_msgSend(v81, "deleteObject:", v47, v71);
                }
              }
              uint64_t v44 = [obj countByEnumeratingWithState:&v82 objects:buf count:16];
            }
            while (v44);
          }

          uint64_t v3 = v71;
          v5 = v73;
        }
        v59 = (void *)MEMORY[0x230FBD990](-[MKFCKModel willAccessValueForKey:](v41, "willAccessValueForKey:", 0, v71));
        v60 = v2;
        v61 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = HMFGetLogIdentifier();
          v63 = [(MKFCKModel *)v41 debugDescription];
          *(_DWORD *)v95 = 138543874;
          *(void *)&v95[4] = v62;
          *(_WORD *)&v95[12] = 2112;
          *(void *)&v95[14] = v41;
          *(_WORD *)&v95[22] = 2112;
          v96 = v63;
          _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Determined canonical model: %@\n%@", v95, 0x20u);

          v2 = v78;
        }

        if (v41 == v60) {
          uint64_t v6 = 1;
        }
        else {
          uint64_t v6 = -1;
        }

        v9 = v74;
        v8 = v75;
      }
    }
    else
    {
      v64 = (void *)MEMORY[0x230FBD990]();
      v65 = v2;
      v66 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v88 = v67;
        __int16 v89 = 2112;
        v90 = v65;
        __int16 v91 = 2114;
        v92 = v77;
        _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch equivalent models for %@: %{public}@", buf, 0x20u);
      }
      uint64_t v6 = 0;
    }

    goto LABEL_61;
  }
LABEL_65:
  return [(NSNumber *)canonical integerValue];
}

void __46__MKFCKModel_mergeRelationshipsFromDuplicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v5 isToMany])
  {
    int v6 = [v5 isOrdered];
    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      v8 = [v7 mutableOrderedSetValueForKey:v13];
      v9 = [*(id *)(a1 + 40) valueForKey:v13];
      [v9 array];
    }
    else
    {
      v8 = [v7 mutableSetValueForKey:v13];
      v9 = [*(id *)(a1 + 40) valueForKey:v13];
      [v9 allObjects];
    v12 = };
    [v8 addObjectsFromArray:v12];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) valueForKey:v13];

    if (v10) {
      goto LABEL_9;
    }
    id v11 = *(void **)(a1 + 32);
    v8 = [*(id *)(a1 + 40) valueForKey:v13];
    [v11 setValue:v8 forKey:v13];
  }

LABEL_9:
}

- (BOOL)isDeletedLocallyWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmd_coreData");
  int v6 = [v5 workingStore];

  v7 = [(MKFCKModel *)self entity];
  v8 = +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:v7];

  v9 = [(MKFCKModel *)self modelID];
  LOBYTE(v7) = objc_msgSend(v6, "hmd_modelWasDeletedWithID:modelIDKey:entity:duration:context:", v9, @"modelID", v8, v4, 0.0);

  return (char)v7;
}

- (id)createLocalModelWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(MKFCKModel *)self entity];
  int v6 = +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x263EFF280]) initWithEntity:v6 insertIntoManagedObjectContext:v4];
  id v8 = v7;
  v9 = [(MKFCKModel *)self modelID];
  [v8 setModelID:v9];

  uint64_t v10 = [(MKFCKModel *)self writerTimestamp];
  [v8 setWriterTimestamp:v10];

  return v8;
}

- (id)fetchLocalModelWithContext:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MKFCKModel *)self entity];
  int v6 = +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:v5];

  v7 = (void *)MEMORY[0x263EFF260];
  id v8 = [v6 name];
  v9 = [v7 fetchRequestWithEntityName:v8];

  uint64_t v10 = objc_opt_class();
  id v11 = [(MKFCKModel *)self modelID];
  v12 = [v10 predicateWithModelID:v11];
  [v9 setPredicate:v12];

  v27[0] = @"modelID";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  [v9 setPropertiesToFetch:v13];

  id v22 = 0;
  uint64_t v14 = [v4 executeFetchRequest:v9 error:&v22];
  id v15 = v22;
  if (v14)
  {
    if ([v14 count])
    {
      unint64_t v16 = [v14 firstObject];
      goto LABEL_8;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local models: %{public}@", buf, 0x16u);
    }
  }
  unint64_t v16 = 0;
LABEL_8:

  return v16;
}

- (void)willSave
{
  v11.receiver = self;
  v11.super_class = (Class)MKFCKModel;
  [(MKFCKModel *)&v11 willSave];
  uint64_t v3 = [(MKFCKModel *)self writerTimestamp];
  if (([(MKFCKModel *)self isDeleted] & 1) == 0
    && (!v3 || [(MKFCKModel *)self hasChanges]))
  {
    id v4 = [(MKFCKModel *)self writerVersion];
    id v5 = [(MKFCKModel *)self changedValues];
    uint64_t v6 = [v5 count];
    if (!v3 || v6 || !v4)
    {
      if (!v3
        || ([v5 objectForKeyedSubscript:@"writerTimestamp"],
            v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            !v7))
      {
        id v8 = [MEMORY[0x263EFF910] now];
        [(MKFCKModel *)self setWriterTimestamp:v8];
      }
      if (!v4
        || ([v5 objectForKeyedSubscript:@"writerVersion"],
            v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            !v9))
      {
        uint64_t v10 = MKFCKModelCurrentWriterVersionString();
        if (([v4 isEqualToString:v10] & 1) == 0) {
          [(MKFCKModel *)self setWriterVersion:v10];
        }
      }
    }
  }
}

- (void)didTurnIntoFault
{
  v4.receiver = self;
  v4.super_class = (Class)MKFCKModel;
  [(MKFCKModel *)&v4 didTurnIntoFault];
  canonical = self->_canonical;
  self->_canonical = 0;
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)MKFCKModel;
  [(MKFCKModel *)&v4 awakeFromInsert];
  uint64_t v3 = _generateFlags(0);
  [(MKFCKModel *)self setPrimitiveFlags:v3];
}

- (id)hmd_debugIdentifier
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MKFCKModel;
  objc_super v4 = [(NSManagedObject *)&v8 hmd_debugIdentifier];
  id v5 = [(MKFCKModel *)self modelID];
  uint64_t v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (id)redactedDescription
{
  uint64_t v3 = NSString;
  objc_super v4 = [(MKFCKModel *)self objectID];
  id v5 = objc_msgSend(v4, "hmd_debugIdentifier");
  uint64_t v6 = [(MKFCKModel *)self modelID];
  uint64_t v7 = [v6 hash];
  BOOL v8 = [(MKFCKModel *)self isFake];
  v9 = "";
  if (v8) {
    v9 = " [FAKE]";
  }
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %lu%s>", v5, v7, v9];

  return v10;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MKFCKModel;
  objc_super v4 = [(HMDManagedObject *)&v9 debugDescription];
  BOOL v5 = [(MKFCKModel *)self isFake];
  uint64_t v6 = "";
  if (v5) {
    uint64_t v6 = " [FAKE]";
  }
  uint64_t v7 = [v3 stringWithFormat:@"%@%s", v4, v6];

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  objc_super v4 = [(MKFCKModel *)self objectID];
  BOOL v5 = objc_msgSend(v4, "hmd_debugIdentifier");
  uint64_t v6 = [(MKFCKModel *)self modelID];
  BOOL v7 = [(MKFCKModel *)self isFake];
  BOOL v8 = "";
  if (v7) {
    BOOL v8 = " [FAKE]";
  }
  objc_super v9 = [v3 stringWithFormat:@"<%@: %@%s>", v5, v6, v8];

  return v9;
}

- (id)relationshipForLocalName:(id)a3 localModel:(id)a4
{
  id v6 = a3;
  BOOL v7 = [a4 entity];
  BOOL v8 = [v7 relationshipsByName];
  objc_super v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 userInfo];
  objc_super v11 = [v10 objectForKeyedSubscript:@"cloudSyncKey"];
  if (!v11)
  {
    v12 = [v10 objectForKeyedSubscript:@"cloudSyncInclude"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      objc_super v11 = [v9 name];
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  uint64_t v14 = [(MKFCKModel *)self entity];
  id v15 = [v14 relationshipsByName];
  unint64_t v16 = [v15 objectForKeyedSubscript:v11];

  return v16;
}

- (BOOL)copyPropertiesFromLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [v5 entity];
  BOOL v7 = [v6 attributesByName];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__MKFCKModel_copyPropertiesFromLocalModel_context___block_invoke;
  v10[3] = &unk_264A24198;
  id v11 = v5;
  v12 = self;
  id v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  return 1;
}

void __51__MKFCKModel_copyPropertiesFromLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = [a3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"cloudSyncKey"];
  if (v6
    || ([v5 objectForKeyedSubscript:@"cloudSyncInclude"],
        id v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 BOOLValue],
        v15,
        v16)
    && (id v6 = v17) != 0)
  {
    BOOL v7 = [*(id *)(a1 + 32) valueForKey:v17];
    if (v7)
    {
      id v8 = [v5 objectForKeyedSubscript:@"cloudSyncTransformer"];
      if (v8)
      {
        objc_super v9 = [MEMORY[0x263F08D50] valueTransformerForName:v8];
        uint64_t v10 = [v9 transformedValue:v7];

        BOOL v7 = (void *)v10;
      }
    }
    id v11 = [v5 objectForKeyedSubscript:@"cloudSyncSkipIfNil"];
    int v12 = [v11 BOOLValue];

    if (!v12 || v7)
    {
      int v13 = [*(id *)(a1 + 40) valueForKey:v6];
      char v14 = HMFEqualObjects();

      if ((v14 & 1) == 0) {
        [*(id *)(a1 + 40) setValue:v7 forKey:v6];
      }
    }
  }
}

- (BOOL)shouldExportUpdatedPropertyInSet:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v5, "hmf_isEmpty"))
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    int v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__MKFCKModel_shouldExportUpdatedPropertyInSet_name___block_invoke;
    v9[3] = &unk_264A2CF80;
    id v10 = v6;
    id v11 = &v12;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

void __52__MKFCKModel_shouldExportUpdatedPropertyInSet_name___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 name];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (BOOL)copyPropertiesIntoLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  int v6 = [v5 entity];
  BOOL v7 = [v6 attributesByName];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__MKFCKModel_copyPropertiesIntoLocalModel_context___block_invoke;
  v10[3] = &unk_264A24198;
  void v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  return 1;
}

void __51__MKFCKModel_copyPropertiesIntoLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = [a3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"cloudSyncKey"];
  if (v6
    || ([v5 objectForKeyedSubscript:@"cloudSyncInclude"],
        char v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 BOOLValue],
        v15,
        v16)
    && (id v6 = v17) != 0)
  {
    BOOL v7 = [*(id *)(a1 + 32) valueForKey:v6];
    if (v7)
    {
      id v8 = [v5 objectForKeyedSubscript:@"cloudSyncTransformer"];
      if (v8)
      {
        objc_super v9 = [MEMORY[0x263F08D50] valueTransformerForName:v8];
        uint64_t v10 = [v9 reverseTransformedValue:v7];

        BOOL v7 = (void *)v10;
      }
    }
    id v11 = [v5 objectForKeyedSubscript:@"cloudSyncSkipIfNil"];
    int v12 = [v11 BOOLValue];

    if (!v12 || v7)
    {
      int v13 = [*(id *)(a1 + 40) valueForKey:v17];
      char v14 = HMFEqualObjects();

      if ((v14 & 1) == 0) {
        [*(id *)(a1 + 40) setValue:v7 forKey:v17];
      }
    }
  }
}

- (void)convertToFakeModel
{
  if (![(MKFCKModel *)self isFake])
  {
    _generateFlags(1);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(MKFCKModel *)self setFlags:v3];
  }
}

- (BOOL)isFake
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [(MKFCKModel *)self flags];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [v2 getUUIDBytes:&v6];
  unsigned int v3 = BYTE5(v7);

  return (v3 >> 3) & 1;
}

- (BOOL)shouldSkipValidationDuringImport
{
  v2 = [(MKFCKModel *)self managedObjectContext];
  BOOL v3 = objc_msgSend(v2, "hmd_transactionAuthor") == 0;

  return v3;
}

+ (id)mergedDictionaryFromCloud:(id)a3 localModifications:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  if ([v5 count])
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
    [v8 addEntriesFromDictionary:v5];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__MKFCKModel_mergedDictionaryFromCloud_localModifications___block_invoke;
    v12[3] = &unk_264A2BD48;
    id v13 = v8;
    id v9 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    id v10 = (id)[v9 copy];
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

uint64_t __59__MKFCKModel_mergedDictionaryFromCloud_localModifications___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

+ (id)canonicalModelForModels:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "hmd_coreData");
  id v9 = [v8 container];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__171068;
  v24 = __Block_byref_object_dispose__171069;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__171068;
  v18[4] = __Block_byref_object_dispose__171069;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __46__MKFCKModel_canonicalModelForModels_context___block_invoke;
  void v13[3] = &unk_264A23200;
  id v10 = v9;
  id v14 = v10;
  char v15 = &v20;
  int v16 = v18;
  id v17 = a1;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  id v11 = (id)v21[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __46__MKFCKModel_canonicalModelForModels_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 objectID];
  id v7 = [v5 recordIDForManagedObjectID:v6];

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    goto LABEL_12;
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    if (!v7) {
      goto LABEL_13;
    }
    uint64_t v9 = [v8 compareToRecordID:v7];
    if (v9 == 1) {
      goto LABEL_13;
    }
    if (!v9)
    {
      uint64_t v8 = (void *)_HMFPreconditionFailureWithFormat();
      goto LABEL_7;
    }
LABEL_12:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
LABEL_13:

    return;
  }
LABEL_7:
  if (v7) {
    goto LABEL_12;
  }
  id v10 = (void *)MEMORY[0x230FBD990](v8);
  id v11 = *(id *)(a1 + 56);
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543874;
    v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Comparing multiple candidate models without a CKRecordID: %@, %@", buf, 0x20u);
  }
  char v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectID];
  int v16 = [v4 objectID];
  uint64_t v17 = [v15 compare:v16];

  if (v17 == 1) {
    goto LABEL_13;
  }
  if (v17) {
    goto LABEL_12;
  }
  v18 = (void *)_HMFPreconditionFailureWithFormat();
  +[MKFCKModel createWithLocalModel:v20 context:v21];
}

+ (id)createWithLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 modelID];
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithContext:v7];

  [v9 setModelID:v8];
  return v9;
}

+ (id)fetchWithLocalModel:(id)a3 context:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 fetchRequest];
  uint64_t v9 = [v6 modelID];
  id v10 = [a1 predicateWithModelID:v9];
  [v8 setPredicate:v10];

  id v11 = [a1 defaultPreloadedProperties];
  [v8 setPropertiesToFetch:v11];

  id v20 = 0;
  int v12 = [v7 executeFetchRequest:v8 error:&v20];
  id v13 = v20;
  if (v12)
  {
    if ([v12 count])
    {
      uint64_t v14 = [v12 firstObject];
      goto LABEL_8;
    }
  }
  else
  {
    char v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = a1;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v18;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud models: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v14 = 0;
LABEL_8:

  return v14;
}

+ (id)logCategory
{
  return +[HMDCoreDataCloudTransform logCategory];
}

+ (id)modelWithModelID:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 fetchRequest];
  id v11 = [a1 predicateWithModelID:v8];
  [v10 setPredicate:v11];

  int v12 = [a1 defaultPreloadedProperties];
  [v10 setPropertiesToFetch:v12];

  [v10 setFetchBatchSize:1];
  id v21 = 0;
  id v13 = [v9 executeFetchRequest:v10 error:&v21];
  id v14 = v21;
  if (v13)
  {
    char v15 = [v13 firstObject];
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      SEL v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v23 = v19;
      __int16 v24 = 2160;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch model with ID %{mask.hash}@: %{public}@", buf, 0x2Au);
    }
    char v15 = 0;
    if (a5) {
      *a5 = v14;
    }
  }

  return v15;
}

+ (id)modelWithObjectID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 defaultPreloadedProperties];
  id v11 = objc_msgSend(v8, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v9, v10, a5);

  if (!v11) {
    goto LABEL_6;
  }
  if (objc_opt_isKindOfClass())
  {
    a5 = v11;
    goto LABEL_7;
  }
  if (a5)
  {
    int v12 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithFormat:@"Fetched object is not of the expected type: %@", v11];
    *a5 = [v12 hmErrorWithCode:22 description:0 reason:v13 suggestion:0];

LABEL_6:
    a5 = 0;
  }
LABEL_7:

  return a5;
}

+ (id)predicateWithModelIDs:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"modelID", a3];
}

+ (id)predicateWithModelID:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"modelID", a3];
}

+ (id)appendDefaultPreloadedPropertiesTo:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaultPreloadedProperties];
  id v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v5, "count"));
  [v6 addObjectsFromArray:v5];
  [v6 addObjectsFromArray:v4];

  id v7 = [v6 allObjects];

  return v7;
}

+ (NSArray)defaultPreloadedProperties
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"modelID";
  v4[1] = @"flags";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return (NSArray *)v2;
}

+ (NSString)rootKeyPath
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (unint64_t)cloudStoreTypes
{
  return 3;
}

- (BOOL)validateFlags:(id *)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]
    || (objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, @"flags", a4) & 1) != 0)
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
    int v13 = 138543874;
    id v14 = v11;
    __int16 v15 = 2114;
    id v16 = @"flags";
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v13, 0x20u);
  }
  return 0;
}

- (BOOL)validateWriterVersion:(id *)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]) {
    return 1;
  }
  id v8 = *a3;
  if (!*a3)
  {
    if ([(MKFCKModel *)self isInserted]) {
      return 1;
    }
    id v8 = *a3;
  }
  id v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (!v11) {
    goto LABEL_15;
  }
  id v12 = MKFCKModelCurrentWriterVersionString();
  char v13 = [v11 isEqualToString:v12];

  if (v13) {
    goto LABEL_14;
  }
  id v14 = (void *)MEMORY[0x230FBD990]();
  __int16 v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __int16 v17 = HMFGetLogIdentifier();
    id v18 = [(MKFCKModel *)v15 modelID];
    __int16 v28 = v14;
    id v19 = *a3;
    id v20 = MKFCKModelCurrentWriterVersionString();
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = v17;
    __int16 v31 = 2112;
    v32 = v18;
    __int16 v33 = 2112;
    id v34 = v19;
    id v14 = v28;
    __int16 v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Object with modelID %@ has writerVersion %@ that doesn't match current writer version %@", buf, 0x2Au);
  }
  id v21 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:*a3];

  if (v21)
  {
LABEL_14:
    BOOL v7 = 1;
  }
  else
  {
LABEL_15:
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    __int16 v23 = self;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      id v26 = *a3;
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v25;
      __int16 v31 = 2114;
      v32 = @"writerVersion";
      __int16 v33 = 2112;
      id v34 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", buf, 0x20u);
    }
    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"writerVersion");
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)validateWriterTimestamp:(id *)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]) {
    return 1;
  }
  id v8 = *a3;
  if (!*a3)
  {
    if ([(MKFCKModel *)self isInserted]) {
      return 1;
    }
    id v8 = *a3;
  }
  id v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  BOOL v7 = v11 != 0;
  if (!v11)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    char v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      id v16 = *a3;
      int v18 = 138543874;
      id v19 = v15;
      __int16 v20 = 2114;
      id v21 = @"writerTimestamp";
      __int16 v22 = 2112;
      id v23 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v18, 0x20u);
    }
    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"writerTimestamp");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)validateModelID:(id *)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]
    || (objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, @"modelID", a4) & 1) != 0)
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
    int v13 = 138543874;
    id v14 = v11;
    __int16 v15 = 2114;
    id v16 = @"modelID";
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v13, 0x20u);
  }
  return 0;
}

@end