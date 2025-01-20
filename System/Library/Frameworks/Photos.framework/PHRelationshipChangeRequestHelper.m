@interface PHRelationshipChangeRequestHelper
+ (BOOL)supportsSecureCoding;
+ (id)_offsetsFromSourceOIDs:(id)a3 toManagedObjects:(id)a4;
+ (id)existentObjectIDsUsingQuery:(id)a3;
+ (id)objectIDsOrUUIDsFromPHObjects:(id)a3;
- (BOOL)allowsInsert;
- (BOOL)allowsMove;
- (BOOL)allowsRemove;
- (BOOL)applyMutationsToManagedObject:(id)a3 orderedMutableChildren:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 unorderedMutableChildren:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 unorderedMutableChildren:(id)a4 inserts:(id *)a5 deletes:(id *)a6 error:(id *)a7;
- (BOOL)applyMutationsToManagedObjectToOneRelationship:(id)a3 error:(id *)a4;
- (NSArray)originalObjectIDs;
- (NSMutableArray)mutableObjectIDsAndUUIDs;
- (NSString)destinationEntityName;
- (NSString)destinationUUIDKeyPath;
- (NSString)relationshipName;
- (PHChangeRequestHelper)changeRequestHelper;
- (PHRelationshipChangeRequestHelper)initWithCoder:(id)a3;
- (PHRelationshipChangeRequestHelper)initWithRelationshipName:(id)a3 changeRequestHelper:(id)a4;
- (PHRelationshipChangeRequestHelper)initWithRelationshipName:(id)a3 xpcDict:(id)a4 changeRequestHelper:(id)a5;
- (id)isDestinationObjectValid;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)prepareIfNeededWithExistentObjectIDs:(id)a3;
- (void)setAllowsInsert:(BOOL)a3;
- (void)setAllowsMove:(BOOL)a3;
- (void)setAllowsRemove:(BOOL)a3;
- (void)setChangeRequestHelper:(id)a3;
- (void)setDestinationEntityName:(id)a3;
- (void)setDestinationUUIDKeyPath:(id)a3;
- (void)setIsDestinationObjectValid:(id)a3;
- (void)setMutableObjectIDsAndUUIDs:(id)a3;
- (void)setOriginalObjectIDs:(id)a3;
@end

@implementation PHRelationshipChangeRequestHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRequestHelper, 0);
  objc_storeStrong(&self->_isDestinationObjectValid, 0);
  objc_storeStrong((id *)&self->_mutableObjectIDsAndUUIDs, 0);
  objc_storeStrong((id *)&self->_originalObjectIDs, 0);
  objc_storeStrong((id *)&self->_destinationUUIDKeyPath, 0);
  objc_storeStrong((id *)&self->_destinationEntityName, 0);

  objc_storeStrong((id *)&self->_relationshipName, 0);
}

- (void)setChangeRequestHelper:(id)a3
{
}

- (PHChangeRequestHelper)changeRequestHelper
{
  return self->_changeRequestHelper;
}

- (void)setIsDestinationObjectValid:(id)a3
{
}

- (id)isDestinationObjectValid
{
  return self->_isDestinationObjectValid;
}

- (void)setMutableObjectIDsAndUUIDs:(id)a3
{
}

- (NSMutableArray)mutableObjectIDsAndUUIDs
{
  return self->_mutableObjectIDsAndUUIDs;
}

- (void)setOriginalObjectIDs:(id)a3
{
}

- (NSArray)originalObjectIDs
{
  return self->_originalObjectIDs;
}

- (void)setAllowsRemove:(BOOL)a3
{
  self->_allowsRemove = a3;
}

- (BOOL)allowsRemove
{
  return self->_allowsRemove;
}

- (void)setAllowsMove:(BOOL)a3
{
  self->_allowsMove = a3;
}

- (BOOL)allowsMove
{
  return self->_allowsMove;
}

- (void)setAllowsInsert:(BOOL)a3
{
  self->_allowsInsert = a3;
}

- (BOOL)allowsInsert
{
  return self->_allowsInsert;
}

- (void)setDestinationUUIDKeyPath:(id)a3
{
}

- (void)setDestinationEntityName:(id)a3
{
}

- (NSString)destinationEntityName
{
  return self->_destinationEntityName;
}

- (NSString)relationshipName
{
  return self->_relationshipName;
}

- (PHRelationshipChangeRequestHelper)initWithCoder:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PHRelationshipChangeRequestHelper;
  v5 = [(PHRelationshipChangeRequestHelper *)&v55 init];
  if (v5)
  {
    id v45 = v4;
    id v6 = v4;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v41 = [MEMORY[0x1E4F28B00] currentHandler];
        v42 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertRespondsToSelector(id  _Nullable __strong, SEL _Nonnull)");
        v43 = NSStringFromSelector(sel_userInfo);
        [v41 handleFailureInFunction:v42, @"PLHelperExtension.h", 91, @"Object does not respond to selector %@: %@", v43, v6 file lineNumber description];
      }
      id v7 = v6;
    }

    v44 = [v6 userInfo];
    v8 = [v44 persistentStoreCoordinator];
    uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"relationshipName"];
    relationshipName = v5->_relationshipName;
    v5->_relationshipName = (NSString *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableObjectIDsAndUUIDs = v5->_mutableObjectIDsAndUUIDs;
    v5->_mutableObjectIDsAndUUIDs = v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v46 = v6;
    v16 = [v6 decodeObjectOfClasses:v15 forKey:@"mutableObjectIDsAndUUIDs"];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v51 + 1) + 8 * v21);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = PLManagedObjectIDFromData();
            if (v23)
            {
              v24 = (void *)v23;
              v25 = +[PHPhotoLibrary uniquedOID:v23];

              if (v25)
              {
                [(NSMutableArray *)v5->_mutableObjectIDsAndUUIDs addObject:v25];
              }
            }
          }
          else
          {
            [(NSMutableArray *)v5->_mutableObjectIDsAndUUIDs addObject:v22];
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v19);
    }

    v26 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    originalObjectIDs = v5->_originalObjectIDs;
    v5->_originalObjectIDs = v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v31 = [v46 decodeObjectOfClasses:v30 forKey:@"originalObjectIDs"];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v48;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v48 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = PLManagedObjectIDFromData();
          if (v37)
          {
            v38 = (void *)v37;
            v39 = +[PHPhotoLibrary uniquedOID:v37];

            if (v39)
            {
              [(NSArray *)v5->_originalObjectIDs addObject:v39];
            }
          }
          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v34);
    }

    id v4 = v45;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_mutableObjectIDsAndUUIDs)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = self->_originalObjectIDs;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = PLDataFromManagedObjectID();
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    [v4 encodeObject:v5 forKey:@"originalObjectIDs"];
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = self->_mutableObjectIDsAndUUIDs;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = PLDataFromManagedObjectID();
            [v12 addObject:v19];
          }
          else
          {
            objc_msgSend(v12, "addObject:", v18, (void)v20);
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    [v4 encodeObject:v12 forKey:@"mutableObjectIDsAndUUIDs"];
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationshipName, @"relationshipName", (void)v20);
}

- (BOOL)applyMutationsToManagedObjectToOneRelationship:(id)a3 error:(id *)a4
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PHRelationshipChangeRequestHelper *)self changeRequestHelper];
  if (([v7 isMutated] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v8 = [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];

  if (!v8)
  {
LABEL_6:
    id v23 = 0;
    BOOL v24 = 1;
    goto LABEL_7;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v10 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];
  v11 = [v9 setWithArray:v10];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];
  uint64_t v14 = [v12 setWithArray:v13];

  uint64_t v15 = [MEMORY[0x1E4F1CA80] setWithSet:v11];
  [v15 intersectSet:v14];
  uint64_t v16 = [MEMORY[0x1E4F1CA80] setWithSet:v11];
  [v16 minusSet:v15];
  uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithSet:v14];
  [v17 minusSet:v15];
  v70 = v17;
  if ((unint64_t)[v16 count] < 2)
  {
    v69 = v16;
    if ((unint64_t)[v17 count] >= 2)
    {
      long long v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v81 = *MEMORY[0x1E4F28568];
      long long v27 = NSString;
      uint64_t v28 = [(PHRelationshipChangeRequestHelper *)self relationshipName];
      uint64_t v29 = v17;
      long long v20 = (void *)v28;
      long long v21 = [v27 stringWithFormat:@"Invalid change to %@, cannot add %d objects", v28, objc_msgSend(v29, "count")];
      v82 = v21;
      long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    uint64_t v32 = [v6 managedObjectContext];
    uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __90__PHRelationshipChangeRequestHelper_applyMutationsToManagedObjectToOneRelationship_error___block_invoke;
    v76[3] = &unk_1E5842F88;
    id v34 = v33;
    id v77 = v34;
    [v17 enumerateObjectsUsingBlock:v76];
    id v68 = (id)v32;
    if ([v34 count])
    {
      v66 = v11;
      uint64_t v35 = (void *)MEMORY[0x1E4F1C0D0];
      uint64_t v36 = [(PHRelationshipChangeRequestHelper *)self destinationEntityName];
      [v35 fetchRequestWithEntityName:v36];
      v38 = uint64_t v37 = (void *)v32;

      v39 = (void *)MEMORY[0x1E4F28F60];
      v40 = [(PHRelationshipChangeRequestHelper *)self destinationUUIDKeyPath];
      v65 = v34;
      v41 = [v39 predicateWithFormat:@"%K in %@", v40, v34];
      [v38 setPredicate:v41];

      id v75 = 0;
      v64 = v38;
      v42 = [v37 executeFetchRequest:v38 error:&v75];
      id v43 = v75;
      uint64_t v16 = v69;
      v62 = v43;
      v63 = v42;
      if (v42)
      {
        v31 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v44 = v42;
        id v23 = (id)[v44 countByEnumeratingWithState:&v71 objects:v80 count:16];
        v11 = v66;
        if (v23)
        {
          v59 = v15;
          v60 = v14;
          v61 = a4;
          uint64_t v45 = *(void *)v72;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v72 != v45) {
                objc_enumerationMutation(v44);
              }
              long long v47 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              long long v48 = [(PHRelationshipChangeRequestHelper *)self destinationUUIDKeyPath];
              long long v49 = [v47 valueForKey:v48];
              [v31 setObject:v47 forKey:v49];
            }
            id v23 = (id)[v44 countByEnumeratingWithState:&v71 objects:v80 count:16];
          }
          while (v23);
          uint64_t v14 = v60;
          a4 = v61;
          v11 = v66;
          uint64_t v15 = v59;
          uint64_t v16 = v69;
        }
      }
      else
      {
        long long v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v78 = *MEMORY[0x1E4F28568];
        id v44 = [NSString stringWithFormat:@"Unable to fetch %@", v43];
        id v79 = v44;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        long long v51 = v15;
        v53 = long long v52 = v14;
        long long v54 = v50;
        uint64_t v16 = v69;
        objc_msgSend(v54, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v53);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v14 = v52;
        uint64_t v15 = v51;
        v31 = 0;
        v11 = v66;
      }

      BOOL v24 = (char)v63;
      if (!v63) {
        goto LABEL_34;
      }
      uint64_t v17 = v70;
    }
    else
    {

      id v23 = 0;
      v31 = 0;
      uint64_t v16 = v69;
    }
    if ([v16 count] == 1 && !objc_msgSend(v17, "count"))
    {
      objc_super v55 = [(PHRelationshipChangeRequestHelper *)self relationshipName];
      [v6 setValue:0 forKey:v55];

      uint64_t v16 = v69;
    }
    if ([v17 count] == 1)
    {
      uint64_t v56 = [v17 anyObject];
      objc_opt_class();
      v67 = (void *)v56;
      if (objc_opt_isKindOfClass()) {
        [v68 objectWithID:v56];
      }
      else {
      v57 = [v31 objectForKey:v56];
      }
      uint64_t v58 = [(PHRelationshipChangeRequestHelper *)self relationshipName];
      [v6 setValue:v57 forKey:v58];

      BOOL v24 = 1;
      uint64_t v16 = v69;
    }
    else
    {
      BOOL v24 = 1;
    }
LABEL_34:
    uint64_t v30 = v68;
    goto LABEL_35;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v83 = *MEMORY[0x1E4F28568];
  uint64_t v19 = NSString;
  long long v20 = [(PHRelationshipChangeRequestHelper *)self relationshipName];
  long long v21 = [v19 stringWithFormat:@"Invalid change to %@, cannot remove %d objects", v20, objc_msgSend(v16, "count")];
  v84[0] = v21;
  long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
  objc_msgSend(v18, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v22);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  uint64_t v30 = [v6 managedObjectContext];
  BOOL v24 = 0;
  v31 = 0;
LABEL_35:

  if (a4 && !v24)
  {
    id v23 = v23;
    BOOL v24 = 0;
    *a4 = v23;
  }
LABEL_7:

  return v24;
}

void __90__PHRelationshipChangeRequestHelper_applyMutationsToManagedObjectToOneRelationship_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)applyMutationsToManagedObject:(id)a3 unorderedMutableChildren:(id)a4 inserts:(id *)a5 deletes:(id *)a6 error:(id *)a7
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = [(PHRelationshipChangeRequestHelper *)self changeRequestHelper];
  if (([v15 isMutated] & 1) == 0)
  {

    goto LABEL_14;
  }
  uint64_t v16 = [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];

  if (!v16)
  {
LABEL_14:
    id v53 = 0;
    BOOL v54 = 1;
    goto LABEL_15;
  }
  SEL v79 = a2;
  v93 = v14;
  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];
  uint64_t v19 = [v17 setWithArray:v18];

  long long v20 = (void *)MEMORY[0x1E4F1CAD0];
  long long v21 = [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];
  long long v22 = [v20 setWithArray:v21];

  id v23 = (void *)MEMORY[0x1E4F1CA80];
  id v24 = v22;
  long long v25 = [v23 setWithSet:v19];
  [v25 intersectSet:v24];

  long long v26 = (void *)MEMORY[0x1E4F1CA80];
  id v27 = v25;
  v86 = (void *)v19;
  v92 = [v26 setWithSet:v19];
  [v92 minusSet:v27];

  uint64_t v28 = (void *)MEMORY[0x1E4F1CA80];
  id v29 = v27;
  v85 = v24;
  uint64_t v30 = [v28 setWithSet:v24];
  [v30 minusSet:v29];
  v84 = v29;

  v31 = [v13 managedObjectContext];
  uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __114__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_unorderedMutableChildren_inserts_deletes_error___block_invoke;
  v107[3] = &unk_1E5842F88;
  id v33 = v32;
  id v108 = v33;
  v91 = v30;
  [v30 enumerateObjectsUsingBlock:v107];
  v89 = a6;
  v90 = a5;
  v87 = a7;
  id v88 = v13;
  uint64_t v83 = v33;
  if ([v33 count])
  {
    id v34 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v35 = [(PHRelationshipChangeRequestHelper *)self destinationEntityName];
    uint64_t v36 = [v34 fetchRequestWithEntityName:v35];

    uint64_t v37 = (void *)MEMORY[0x1E4F28F60];
    v38 = self;
    v39 = [(PHRelationshipChangeRequestHelper *)self destinationUUIDKeyPath];
    v40 = [v37 predicateWithFormat:@"%K in %@", v39, v33];
    [v36 setPredicate:v40];

    id v106 = 0;
    v41 = [v31 executeFetchRequest:v36 error:&v106];
    id v42 = v106;
    id v43 = v42;
    BOOL v82 = v41 != 0;
    if (v41)
    {
      id v77 = v42;
      id v44 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v45 = v41;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v102 objects:v113 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        long long v74 = v41;
        id v75 = v36;
        uint64_t v48 = *(void *)v103;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v103 != v48) {
              objc_enumerationMutation(v45);
            }
            long long v50 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            long long v51 = [(PHRelationshipChangeRequestHelper *)v38 destinationUUIDKeyPath];
            long long v52 = [v50 valueForKey:v51];
            [v44 setObject:v50 forKey:v52];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v102 objects:v113 count:16];
        }
        while (v47);
        id v80 = 0;
        a6 = v89;
        a5 = v90;
        v41 = v74;
        uint64_t v36 = v75;
      }
      else
      {
        id v80 = 0;
      }
      id v43 = v77;
    }
    else
    {
      id v81 = (id)MEMORY[0x1E4F28C58];
      uint64_t v111 = *MEMORY[0x1E4F28568];
      id v45 = [NSString stringWithFormat:@"Unable to fetch %@", v42];
      id v112 = v45;
      uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      objc_msgSend(v81, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v56);
      id v80 = (id)objc_claimAutoreleasedReturnValue();

      id v44 = 0;
    }

    id v14 = v93;
    self = v38;
  }
  else
  {
    id v44 = 0;
    id v80 = 0;
    BOOL v82 = 1;
    id v14 = v93;
  }
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v92 count])
  {
    uint64_t v78 = self;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v58 = v92;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v98 objects:v110 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v99;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v99 != v61) {
            objc_enumerationMutation(v58);
          }
          uint64_t v63 = *(void *)(*((void *)&v98 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v76 = [MEMORY[0x1E4F28B00] currentHandler];
            [v76 handleFailureInMethod:v79, v78, @"PHChangeRequestHelper.m", 937, @"Expected delete oid (%@) to be ManagedObjectID", v63 object file lineNumber description];
          }
          v64 = [v31 objectWithID:v63];
          if (v64)
          {
            [v14 removeObject:v64];
            [v57 addObject:v64];
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v98 objects:v110 count:16];
      }
      while (v60);
    }

    a6 = v89;
    a5 = v90;
  }
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v91 count])
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v66 = v91;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v94 objects:v109 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v95;
      do
      {
        for (uint64_t k = 0; k != v68; ++k)
        {
          if (*(void *)v95 != v69) {
            objc_enumerationMutation(v66);
          }
          uint64_t v71 = *(void *)(*((void *)&v94 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v31 objectWithID:v71];
          }
          else {
          long long v72 = [v44 objectForKey:v71];
          }
          if (v72)
          {
            [v93 addObject:v72];
            [v65 addObject:v72];
          }
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v94 objects:v109 count:16];
      }
      while (v68);
    }

    id v14 = v93;
    a6 = v89;
    a5 = v90;
  }
  if (a5) {
    *a5 = v65;
  }
  if (a6) {
    *a6 = v57;
  }

  BOOL v54 = v82;
  if (v87) {
    char v73 = v82;
  }
  else {
    char v73 = 1;
  }
  if (v73)
  {
    id v13 = v88;
    id v53 = v80;
  }
  else
  {
    id v53 = v80;
    BOOL v54 = 0;
    id *v87 = v53;
    id v13 = v88;
  }
LABEL_15:

  return v54;
}

void __114__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_unorderedMutableChildren_inserts_deletes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)applyMutationsToManagedObject:(id)a3 unorderedMutableChildren:(id)a4 error:(id *)a5
{
  return [(PHRelationshipChangeRequestHelper *)self applyMutationsToManagedObject:a3 unorderedMutableChildren:a4 inserts:0 deletes:0 error:a5];
}

- (BOOL)applyMutationsToManagedObject:(id)a3 orderedMutableChildren:(id)a4 error:(id *)a5
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v112 = a3;
  id v114 = a4;
  uint64_t v182 = 0;
  v183 = &v182;
  uint64_t v184 = 0x2020000000;
  char v185 = 1;
  uint64_t v176 = 0;
  v177 = &v176;
  uint64_t v178 = 0x3032000000;
  v179 = __Block_byref_object_copy__8690;
  v180 = __Block_byref_object_dispose__8691;
  id v181 = 0;
  v113 = self;
  if ([(PHChangeRequestHelper *)self->_changeRequestHelper isMutated] && self->_mutableObjectIDsAndUUIDs)
  {
    id v108 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:self->_originalObjectIDs];
    id v106 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:self->_mutableObjectIDsAndUUIDs];
    uint64_t v175 = 0;
    uint64_t v7 = [MEMORY[0x1E4F1C978] array];
    uint64_t v174 = 0;
    uint64_t v173 = 0;
    uint64_t v172 = 0;
    uint64_t v171 = 0;
    diffOrderedSets();
    id v107 = 0;
    id v110 = 0;
    id v105 = 0;
    id v103 = 0;

    if ([v105 count]) {
      BOOL v8 = v175 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    int v9 = !v8;
    int v109 = v9;
    uint64_t v104 = [v110 count];
    v117 = [v112 managedObjectContext];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & v109) == 1)
    {
      id v10 = v112;
      if ([v10 customSortKey])
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v114, "count"));
        long long v101 = v10;
        v115 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v114, "count"));
        long long v169 = 0u;
        long long v170 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        id v12 = v114;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v167 objects:v200 count:16];
        if (v13)
        {
          uint64_t v14 = 0;
          uint64_t v15 = *(void *)v168;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v168 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v167 + 1) + 8 * i);
              uint64_t v18 = [NSNumber numberWithInt:v14 + i];
              uint64_t v19 = [v17 objectID];
              [v11 setObject:v18 forKey:v19];

              long long v20 = [v17 objectID];
              long long v21 = [NSNumber numberWithInt:v14 + i];
              [v115 setObject:v20 forKey:v21];
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v167 objects:v200 count:16];
            uint64_t v14 = (v14 + i);
          }
          while (v13);
        }

        long long v165 = 0u;
        long long v166 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        long long v22 = v113->_mutableObjectIDsAndUUIDs;
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v163 objects:v199 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v164;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v164 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = *(void *)(*((void *)&v163 + 1) + 8 * j);
              id v27 = [v11 objectForKey:v26];
              [v11 removeObjectForKey:v26];
              [v115 removeObjectForKey:v27];
            }
            uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v163 objects:v199 count:16];
          }
          while (v23);
        }

        [v101 setCustomSortKey:0];
        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        uint64_t v28 = v113->_originalObjectIDs;
        uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v159 objects:v198 count:16];
        if (v29)
        {
          uint64_t v30 = 0;
          uint64_t v31 = *(void *)v160;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v160 != v31) {
                objc_enumerationMutation(v28);
              }
              id v33 = [v117 objectWithID:*(void *)(*((void *)&v159 + 1) + 8 * k)];
              uint64_t v34 = [v12 indexOfObject:v33];

              uint64_t v35 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v34];
              [v12 moveObjectsAtIndexes:v35 toIndex:v30 + k];
            }
            uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v159 objects:v198 count:16];
            v30 += k;
          }
          while (v29);
        }

        for (unint64_t m = 0; [v12 count] > m; ++m)
        {
          uint64_t v37 = [NSNumber numberWithInt:m];
          v38 = [v115 objectForKey:v37];

          if (v38)
          {
            v39 = [v117 objectWithID:v38];
            uint64_t v40 = [v12 indexOfObject:v39];

            v41 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v40];
            [v12 moveObjectsAtIndexes:v41 toIndex:m];
          }
        }

        id v10 = v101;
      }
    }
    if ([v107 count]) {
      unsigned int v42 = ![(PHRelationshipChangeRequestHelper *)v113 allowsRemove];
    }
    else {
      unsigned int v42 = 0;
    }
    if ([v110 count]) {
      unsigned int v43 = ![(PHRelationshipChangeRequestHelper *)v113 allowsInsert];
    }
    else {
      unsigned int v43 = 0;
    }
    if (v109)
    {
      unsigned int v44 = ![(PHRelationshipChangeRequestHelper *)v113 allowsMove];
      if ((v42 & 1) == 0) {
        goto LABEL_47;
      }
    }
    else
    {
      unsigned int v44 = 0;
      if ((v42 & 1) == 0)
      {
LABEL_47:
        int v45 = (v43 | v44) ^ 1;
        *((unsigned char *)v183 + 24) = (v43 | v44) ^ 1;
        if (((v43 | v44) & 1) == 0) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
    *((unsigned char *)v183 + 24) = 0;
LABEL_51:
    uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v196 = *MEMORY[0x1E4F28568];
    uint64_t v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid operation (insert %d delete %d move %d)", v43, v42, v44);
    v197 = v47;
    uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
    uint64_t v49 = objc_msgSend(v46, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v48);
    long long v50 = (void *)v177[5];
    v177[5] = v49;

    int v45 = *((unsigned __int8 *)v183 + 24);
LABEL_52:
    id v51 = 0;
    id v52 = 0;
    if (v45 && v104)
    {
      id v53 = [MEMORY[0x1E4F1CA80] set];
      v156[0] = MEMORY[0x1E4F143A8];
      v156[1] = 3221225472;
      v156[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke;
      v156[3] = &unk_1E5842EE8;
      id v102 = v106;
      id v157 = v102;
      id v54 = v53;
      id v158 = v54;
      [v110 enumerateIndexesUsingBlock:v156];
      if ([v54 count])
      {
        objc_super v55 = (void *)MEMORY[0x1E4F1C0D0];
        uint64_t v56 = [(PHRelationshipChangeRequestHelper *)v113 destinationEntityName];
        v116 = [v55 fetchRequestWithEntityName:v56];

        id v57 = (void *)MEMORY[0x1E4F28F60];
        id v58 = [(PHRelationshipChangeRequestHelper *)v113 destinationUUIDKeyPath];
        uint64_t v59 = [v57 predicateWithFormat:@"%K in %@", v58, v54];
        [v116 setPredicate:v59];

        id v155 = 0;
        uint64_t v60 = [v117 executeFetchRequest:v116 error:&v155];
        id v61 = v155;
        long long v100 = v61;
        if (v60)
        {
          v62 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v153 = 0u;
          long long v154 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          id v63 = v60;
          uint64_t v64 = [v63 countByEnumeratingWithState:&v151 objects:v195 count:16];
          if (v64)
          {
            uint64_t v65 = *(void *)v152;
            do
            {
              for (uint64_t n = 0; n != v64; ++n)
              {
                if (*(void *)v152 != v65) {
                  objc_enumerationMutation(v63);
                }
                uint64_t v67 = *(void **)(*((void *)&v151 + 1) + 8 * n);
                uint64_t v68 = [(PHRelationshipChangeRequestHelper *)v113 destinationUUIDKeyPath];
                uint64_t v69 = [v67 valueForKey:v68];
                [v62 setObject:v67 forKey:v69];
              }
              uint64_t v64 = [v63 countByEnumeratingWithState:&v151 objects:v195 count:16];
            }
            while (v64);
          }
        }
        else
        {
          v70 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v193 = *MEMORY[0x1E4F28568];
          uint64_t v71 = [NSString stringWithFormat:@"Unable to fetch %@", v61];
          v194 = v71;
          long long v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
          uint64_t v73 = objc_msgSend(v70, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v72);
          long long v74 = (void *)v177[5];
          v177[5] = v73;

          v62 = 0;
          *((unsigned char *)v183 + 24) = 0;
        }
      }
      else
      {
        v62 = 0;
      }
      id v75 = objc_opt_new();
      v76 = [MEMORY[0x1E4F28E60] indexSet];
      v142[0] = MEMORY[0x1E4F143A8];
      v142[1] = 3221225472;
      v142[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_2;
      v142[3] = &unk_1E5842F10;
      id v143 = v102;
      id v144 = v117;
      id v77 = v62;
      id v145 = v77;
      v146 = v113;
      id v52 = v75;
      id v147 = v52;
      id v51 = v76;
      id v148 = v51;
      v149 = &v176;
      v150 = &v182;
      [v110 enumerateIndexesUsingBlock:v142];

      int v45 = *((unsigned __int8 *)v183 + 24);
    }
    if (!v45)
    {
      id v83 = 0;
LABEL_106:

      goto LABEL_107;
    }
    if ([v107 count])
    {
      [v108 objectsAtIndexes:v107];
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v78 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v79 = [v78 countByEnumeratingWithState:&v138 objects:v192 count:16];
      if (v79)
      {
        uint64_t v80 = *(void *)v139;
        do
        {
          for (iuint64_t i = 0; ii != v79; ++ii)
          {
            if (*(void *)v139 != v80) {
              objc_enumerationMutation(v78);
            }
            BOOL v82 = [v117 objectWithID:*(void *)(*((void *)&v138 + 1) + 8 * ii)];
            if (v82) {
              [v114 removeObject:v82];
            }
          }
          uint64_t v79 = [v78 countByEnumeratingWithState:&v138 objects:v192 count:16];
        }
        while (v79);
      }

      if ((v109 | (v104 != 0)) != 1)
      {
        id v83 = 0;
        goto LABEL_100;
      }
      [v108 removeObjectsAtIndexes:v107];
    }
    else if ((v109 & 1) == 0 && !v104)
    {
      id v83 = 0;
      goto LABEL_101;
    }
    id v83 = [(id)objc_opt_class() _offsetsFromSourceOIDs:v108 toManagedObjects:v114];
    if (!v104) {
      goto LABEL_101;
    }
    v84 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v85 = [v83 count];
    uint64_t v134 = 0;
    v135 = &v134;
    uint64_t v136 = 0x2020000000;
    uint64_t v137 = 0;
    uint64_t v137 = [v114 count];
    if (v85)
    {
      v86 = [v83 objectAtIndex:v85 - 1];
      uint64_t v87 = [v86 unsignedIntegerValue];
    }
    else
    {
      uint64_t v87 = [v114 count];
    }
    if (v109)
    {
      id v88 = [v52 objectEnumerator];
    }
    else
    {
      id v88 = 0;
    }
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_3;
    v126[3] = &unk_1E5842F38;
    id v83 = v83;
    id v127 = v83;
    v131 = &v134;
    uint64_t v132 = v87;
    id v78 = v84;
    id v128 = v78;
    char v133 = v109;
    id v89 = v88;
    id v129 = v89;
    id v130 = v108;
    [v51 enumerateIndexesUsingBlock:v126];
    uint64_t v90 = [v114 count];
    if ([v52 count]) {
      [v114 insertObjects:v52 atIndexes:v78];
    }
    uint64_t v91 = [v114 count] - v90;
    if (v91 != [v52 count])
    {
      v92 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        int v93 = [v52 count];
        *(_DWORD *)buf = 136315650;
        v187 = "-[PHRelationshipChangeRequestHelper applyMutationsToManagedObject:orderedMutableChildren:error:]";
        __int16 v188 = 1024;
        int v189 = v93;
        __int16 v190 = 1024;
        int v191 = v91;
        _os_log_impl(&dword_19B043000, v92, OS_LOG_TYPE_ERROR, "Unreported error from %s, attempted to insert %d, only %d inserted", buf, 0x18u);
      }
    }
    _Block_object_dispose(&v134, 8);
LABEL_100:

LABEL_101:
    if (v109)
    {
      uint64_t v134 = 0;
      v135 = &v134;
      uint64_t v136 = 0x2020000000;
      uint64_t v137 = 0;
      uint64_t v94 = [v83 count];
      if (v94)
      {
        long long v95 = [v83 objectAtIndex:v94 - 1];
        uint64_t v96 = [v95 unsignedIntegerValue];
      }
      else
      {
        uint64_t v96 = [v114 count];
      }
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_279;
      v118[3] = &unk_1E5842F60;
      v123 = &v134;
      uint64_t v124 = v175;
      id v119 = v108;
      id v120 = v117;
      id v121 = v114;
      id v83 = v83;
      id v122 = v83;
      uint64_t v125 = v96;
      [v105 enumerateIndexesUsingBlock:v118];

      _Block_object_dispose(&v134, 8);
    }
    goto LABEL_106;
  }
LABEL_107:
  int v97 = *((unsigned __int8 *)v183 + 24);
  if (a5 && !*((unsigned char *)v183 + 24))
  {
    *a5 = (id) v177[5];
    int v97 = *((unsigned __int8 *)v183 + 24);
  }
  BOOL v98 = v97 != 0;
  _Block_object_dispose(&v176, 8);

  _Block_object_dispose(&v182, 8);
  return v98;
}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectAtIndex:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 40) objectWithID:v4];
  }
  else {
  v5 = [*(id *)(a1 + 48) objectForKey:v4];
  }
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [*(id *)(a1 + 56) isDestinationObjectValid];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [*(id *)(a1 + 56) isDestinationObjectValid],
        BOOL v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
        int v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v5),
        v8,
        v7,
        v9))
  {
    [*(id *)(a1 + 64) addObject:v5];
    [*(id *)(a1 + 72) addIndex:a2];
  }
  else
  {
LABEL_8:
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v11 = [NSString stringWithFormat:@"Added object failed validation"];
    v17[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v13 = objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v12);
    uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  }
}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_3(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(a1 + 32) count] <= a2)
  {
    uint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndex:a2];
    uint64_t v5 = [v4 unsignedIntegerValue];
  }
  if (v5 + a2 >= *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  else {
    unint64_t v6 = v5 + a2;
  }
  [*(id *)(a1 + 40) addIndex:v6];
  uint64_t v7 = *(void **)(a1 + 32);
  BOOL v8 = [NSNumber numberWithUnsignedInteger:v5];
  [v7 insertObject:v8 atIndex:a2];

  if (*(unsigned char *)(a1 + 80))
  {
    int v9 = [*(id *)(a1 + 48) nextObject];
    id v10 = *(void **)(a1 + 56);
    v11 = [v9 objectID];
    [v10 insertObject:v11 atIndex:a2];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void __96__PHRelationshipChangeRequestHelper_applyMutationsToManagedObject_orderedMutableChildren_error___block_invoke_279(uint64_t a1, unint64_t a2)
{
  CFArrayRef v4 = *(const __CFArray **)(a1 + 72);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  CFIndex v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  ValueAtIndex = CFArrayGetValueAtIndex(v4, v6);
  if ([*(id *)(a1 + 32) count] <= (unint64_t)ValueAtIndex)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [*(id *)(a1 + 32) objectAtIndex:ValueAtIndex];
    if (v8)
    {
      id v16 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v9 = [*(id *)(a1 + 40) objectWithID:v16];
        uint64_t v10 = [*(id *)(a1 + 48) indexOfObject:v9];
        if ([*(id *)(a1 + 56) count] <= a2)
        {
          uint64_t v12 = *(void *)(a1 + 80);
        }
        else
        {
          v11 = [*(id *)(a1 + 56) objectAtIndex:a2];
          uint64_t v12 = [v11 unsignedIntegerValue];
        }
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v13 = v12 + a2;
          if (v13 < [*(id *)(a1 + 48) count] && v13 != v10)
          {
            uint64_t v14 = *(void **)(a1 + 48);
            uint64_t v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v10];
            [v14 moveObjectsAtIndexes:v15 toIndex:v13];
          }
        }
      }
      BOOL v8 = v16;
    }
  }
}

- (NSString)destinationUUIDKeyPath
{
  destinationUUIDKeyPath = (__CFString *)self->_destinationUUIDKeyPath;
  if (!destinationUUIDKeyPath)
  {
    self->_destinationUUIDKeyPath = (NSString *)@"uuid";
    destinationUUIDKeyPath = @"uuid";
  }

  return (NSString *)destinationUUIDKeyPath;
}

- (void)prepareIfNeededWithExistentObjectIDs:(id)a3
{
  id v9 = a3;
  +[PHPhotoLibrary assertTransaction];
  CFArrayRef v4 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];

  if (!v4)
  {
    if (v9) {
      id v5 = v9;
    }
    else {
      id v5 = (id)MEMORY[0x1E4F1CBF0];
    }
    [(PHRelationshipChangeRequestHelper *)self setOriginalObjectIDs:v5];
  }
  CFIndex v6 = [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];

  if (!v6)
  {
    uint64_t v7 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];
    BOOL v8 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)self setMutableObjectIDsAndUUIDs:v8];
  }
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_mutableObjectIDsAndUUIDs)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    id v21 = v4;
    xpc_dictionary_set_value(v4, [(NSString *)self->_relationshipName UTF8String], v5);
    xpc_object_t v6 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v5, "originalObjectIDs", v6);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = self->_originalObjectIDs;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          PLXPCArrayAppendManagedObjectID();
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v9);
    }

    xpc_object_t v12 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v5, "mutableObjectIDsAndUUIDs", v12);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unint64_t v13 = self->_mutableObjectIDsAndUUIDs;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            PLXPCArrayAppendManagedObjectID();
          }
          else
          {
            *(void *)uu = 0;
            uint64_t v31 = 0;
            uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v18];
            long long v20 = v19;
            if (v19)
            {
              [v19 getUUIDBytes:uu];
              if (!uuid_is_null(uu)) {
                xpc_array_set_uuid(v12, 0xFFFFFFFFFFFFFFFFLL, uu);
              }
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v15);
    }

    id v4 = v21;
  }
}

- (PHRelationshipChangeRequestHelper)initWithRelationshipName:(id)a3 xpcDict:(id)a4 changeRequestHelper:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PHRelationshipChangeRequestHelper *)self initWithRelationshipName:v8 changeRequestHelper:v10];
  if (v11)
  {
    xpc_object_t v12 = xpc_dictionary_get_value(v9, (const char *)[v8 UTF8String]);
    unint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = xpc_dictionary_get_value(v12, "mutableObjectIDsAndUUIDs");
      if (v14)
      {
        uint64_t v15 = [v10 request];
        uint64_t v16 = [v15 persistentStoreCoordinator];
        uint64_t v17 = [(PHChangeRequestHelper *)v11->_changeRequestHelper changeRequest];
        [v15 recordUpdateRequest:v17];

        [(PHChangeRequestHelper *)v11->_changeRequestHelper setMutated:1];
        uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:xpc_array_get_count(v14)];
        mutableObjectIDsAndUUIDs = v11->_mutableObjectIDsAndUUIDs;
        v11->_mutableObjectIDsAndUUIDs = (NSMutableArray *)v18;

        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke;
        applier[3] = &unk_1E5848340;
        long long v20 = v11;
        uint64_t v30 = v20;
        id v21 = v16;
        id v31 = v21;
        xpc_array_apply(v14, applier);
        long long v22 = xpc_dictionary_get_value(v13, "originalObjectIDs");
        uint64_t v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:xpc_array_get_count(v22)];
        originalObjectIDs = v20->_originalObjectIDs;
        v20->_originalObjectIDs = (NSArray *)v23;

        if (v22)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke_2;
          v26[3] = &unk_1E5848340;
          id v27 = v21;
          long long v28 = v20;
          xpc_array_apply(v22, v26);
        }
      }
    }
  }

  return v11;
}

uint64_t __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MEMORY[0x19F38A470]() == MEMORY[0x1E4F14600])
  {
    memset(v9, 0, 37);
    bytes = xpc_uuid_get_bytes(v4);

    uuid_unparse(bytes, v9);
    if (!v9[0]) {
      return 1;
    }
    xpc_object_t v6 = [NSString stringWithCString:v9 encoding:4];
LABEL_7:
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "addObject:", v6, *(_OWORD *)v9, *(void *)&v9[16], *(_OWORD *)&v9[24], v10);

    return 1;
  }
  xpc_object_t v5 = PLManagedObjectIDFromXPCValue();

  if (v5)
  {
    xpc_object_t v6 = +[PHPhotoLibrary uniquedOID:v5];

    if (v6) {
      goto LABEL_7;
    }
  }
  return 1;
}

uint64_t __90__PHRelationshipChangeRequestHelper_initWithRelationshipName_xpcDict_changeRequestHelper___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PLManagedObjectIDFromXPCValue();
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = +[PHPhotoLibrary uniquedOID:v2];

    if (v4)
    {
      [*(id *)(*(void *)(a1 + 40) + 40) addObject:v4];
    }
  }
  return 1;
}

- (PHRelationshipChangeRequestHelper)initWithRelationshipName:(id)a3 changeRequestHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)PHRelationshipChangeRequestHelper;
    id v9 = [(PHRelationshipChangeRequestHelper *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_relationshipName, a3);
      objc_storeStrong(p_isa + 8, a4);
    }
    self = p_isa;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)existentObjectIDsUsingQuery:(id)a3
{
  if (a3)
  {
    id v3 = [a3 executeQuery];
    id v4 = [v3 fetchedObjectIDs];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C978] array];
  }

  return v4;
}

+ (id)objectIDsOrUUIDsFromPHObjects:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!v6)
        {
          xpc_object_t v6 = [MEMORY[0x1E4F1CA48] array];
        }
        uint64_t v10 = PLObjectIDOrUUIDFromPHObject(v9);
        [v6 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    xpc_object_t v6 = 0;
  }

  return v6;
}

+ (id)_offsetsFromSourceOIDs:(id)a3 toManagedObjects:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  xpc_object_t v6 = +[PHPhotoLibrary uniquedOIDsFromObjects:a4];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = -v10;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [v6 indexOfObject:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
        if (v15 >= v10 + v11 + v13 && v15 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v11 = v15 + v14;
        }
        uint64_t v17 = [NSNumber numberWithInteger:v11];
        [v7 addObject:v17];

        ++v13;
        --v14;
      }
      while (v9 != v13);
      v10 += v13;
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v7;
}

@end