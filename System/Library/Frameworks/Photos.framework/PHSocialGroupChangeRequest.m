@interface PHSocialGroupChangeRequest
+ (id)_creationRequestForSocialGroupCopyWithUUID:(id)a3;
+ (id)_findNonUserVerifiedGroupUUIDWithMembers:(id)a3 context:(id)a4 changesError:(id *)a5;
+ (id)changeRequestForSocialGroup:(id)a3 userAction:(BOOL)a4;
+ (id)creationRequestForSocialGroupWithMembers:(id)a3 userAction:(BOOL)a4;
+ (void)deleteSocialGroups:(id)a3;
- (BOOL)_applyAutomaticOrderToContainer:(id)a3 error:(id *)a4;
- (BOOL)_applyInitialMembersToContainer:(id)a3 error:(id *)a4;
- (BOOL)_applyKeyAssetToContainer:(id)a3 managedObject:(id)a4 error:(id *)a5;
- (BOOL)_applyManualOrderToContainer:(id)a3 error:(id *)a4;
- (BOOL)_applyVerifiedTypeToContainer:(id)a3 error:(id *)a4;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)isUserAction;
- (NSString)managedEntityName;
- (PHSocialGroupChangeRequest)initWithUUID:(id)a3;
- (PHSocialGroupChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHSocialGroupChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)_personIDsFromXPCDict:(id)a3 key:(const char *)a4 request:(id)a5;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)initialMemberPersonIDs;
- (id)placeholderForCreatedSocialGroup;
- (void)_setMembers:(id)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)rejectSocialGroup;
- (void)resetCustomTitle;
- (void)setCustomTitle:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setOrder:(int64_t)a3;
- (void)unrejectSocialGroup;
@end

@implementation PHSocialGroupChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetID, 0);
  objc_storeStrong((id *)&self->_initialMemberPersonIDs, 0);

  objc_storeStrong((id *)&self->_customTitle, 0);
}

- (BOOL)isUserAction
{
  return self->_userAction;
}

- (id)initialMemberPersonIDs
{
  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  if (initialMemberPersonIDs)
  {
    v3 = initialMemberPersonIDs;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v3;
}

- (void)setKeyAsset:(id)a3
{
  id v4 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  v6 = [v4 objectID];

  keyAssetID = self->_keyAssetID;
  self->_keyAssetID = v6;
}

- (void)setOrder:(int64_t)a3
{
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  if (self->_userAction) {
    v6 = &OBJC_IVAR___PHSocialGroupChangeRequest__didSetManualOrder;
  }
  else {
    v6 = &OBJC_IVAR___PHSocialGroupChangeRequest__didSetAutomaticOrder;
  }
  v7 = &OBJC_IVAR___PHSocialGroupChangeRequest__manualOrder;
  if (!self->_userAction) {
    v7 = &OBJC_IVAR___PHSocialGroupChangeRequest__automaticOrder;
  }
  *((unsigned char *)&self->super.super.isa + *v6) = 1;
  *(Class *)((char *)&self->super.super.isa + *v7) = (Class)a3;
}

- (void)resetCustomTitle
{
  v3 = [(PHChangeRequest *)self helper];
  [v3 didMutate];

  self->_didSetCustomTitle = 1;
  customTitle = self->_customTitle;
  self->_customTitle = 0;
}

- (void)unrejectSocialGroup
{
  if (!self->_userAction)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PHSocialGroupChangeRequest.m", 542, @"Invalid parameter not satisfying: %@", @"_userAction" object file lineNumber description];
  }
  v3 = [(PHChangeRequest *)self helper];
  [v3 didMutate];

  self->_didUnrejectSocialGroup = 1;
}

- (void)rejectSocialGroup
{
  if (!self->_userAction)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PHSocialGroupChangeRequest.m", 536, @"Invalid parameter not satisfying: %@", @"_userAction" object file lineNumber description];
  }
  v3 = [(PHChangeRequest *)self helper];
  [v3 didMutate];

  self->_didRejectSocialGroup = 1;
}

- (void)_setMembers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "objectID", (void)v15);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = (NSSet *)[v6 copy];
  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  self->_initialMemberPersonIDs = v13;
}

- (void)setCustomTitle:(id)a3
{
  v5 = (NSString *)a3;
  if (!self->_userAction)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PHSocialGroupChangeRequest.m", 517, @"Invalid parameter not satisfying: %@", @"_userAction" object file lineNumber description];
  }
  id v6 = [(PHChangeRequest *)self helper];
  [v6 didMutate];

  customTitle = self->_customTitle;
  self->_customTitle = v5;

  self->_didSetCustomTitle = 1;
}

- (NSString)managedEntityName
{
  return (NSString *)[MEMORY[0x1E4F8A858] entityName];
}

- (BOOL)_applyInitialMembersToContainer:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSSet *)self->_initialMemberPersonIDs count] <= 1)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    v29[0] = @"Social groups must have at least two members";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"PHPhotosErrorDomain" code:7404 userInfo:v8];
    uint64_t v10 = v9;
    if (a4) {
      *a4 = v9;
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F8ABF8];
  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  v13 = [v6 sourceNode];
  v14 = [v13 managedObjectContext];
  uint64_t v8 = [v11 fetchDuplicateSocialGroupIDsWithMemberIDs:initialMemberPersonIDs inContext:v14 error:a4];

  if (v8)
  {
    if (![v8 count])
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F8AA10];
      v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", self->_initialMemberPersonIDs];
      v22 = [v6 sourceNode];
      v23 = [v22 managedObjectContext];
      v24 = [v20 personsMatchingPredicate:v21 fetchLimit:0 sortDescriptors:0 relationshipKeyPathsForPrefetching:0 inManagedObjectContext:v23];

      v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
      char v18 = [v6 setMembers:v25 error:a4];

      goto LABEL_11;
    }
    long long v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28228];
    v27 = @"Each social group must have distinct members";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    long long v16 = [v15 errorWithDomain:@"PHPhotosErrorDomain" code:7401 userInfo:v10];
    long long v17 = v16;
    if (a4) {
      *a4 = v16;
    }

    goto LABEL_9;
  }
LABEL_10:
  char v18 = 0;
LABEL_11:

  return v18;
}

- (BOOL)_applyManualOrderToContainer:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_didSetManualOrder) {
    goto LABEL_4;
  }
  if ((self->_manualOrder & 0x8000000000000000) == 0)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v6 setManualOrder:v7];

LABEL_4:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28228];
  v15[0] = @"The manual order must be nonnegative";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v11 = [v9 errorWithDomain:@"PHPhotosErrorDomain" code:7403 userInfo:v10];
  v12 = v11;
  if (a4) {
    *a4 = v11;
  }

  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_applyAutomaticOrderToContainer:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_didSetAutomaticOrder) {
    goto LABEL_4;
  }
  if ((self->_automaticOrder & 0x8000000000000000) == 0)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v6 setAutomaticOrder:v7];

LABEL_4:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28228];
  v15[0] = @"The automatic order must be nonnegative";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v11 = [v9 errorWithDomain:@"PHPhotosErrorDomain" code:7403 userInfo:v10];
  v12 = v11;
  if (a4) {
    *a4 = v11;
  }

  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_applyKeyAssetToContainer:(id)a3 managedObject:(id)a4 error:(id *)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (self->_keyAssetID)
  {
    if ([v9 keyAssetPickSource] == -1)
    {
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28228];
      v52[0] = @"Error fetching social group key-asset edge for pick source";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      v24 = [v22 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v23];
      v25 = v24;
      if (a5) {
        *a5 = v24;
      }

      goto LABEL_34;
    }
    if (!self->_userAction)
    {
      if ([v9 keyAssetPickSource])
      {
        uint64_t v26 = [v9 keyAsset];

        if (v26)
        {
          v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v47 = *MEMORY[0x1E4F28228];
          v48 = @"Only the user may override a visible, user-picked-key asset";
          uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          v29 = [v27 errorWithDomain:@"PHPhotosErrorDomain" code:7409 userInfo:v28];
          v30 = v29;
          if (a5) {
            *a5 = v29;
          }

          int v17 = 0;
          goto LABEL_33;
        }
      }
    }
    v40 = [v10 managedObjectContext];
    v42 = [v40 objectWithID:self->_keyAssetID];
    if (!v42)
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2, self, @"PHSocialGroupChangeRequest.m", 432, @"Invalid parameter not satisfying: %@", @"keyAsset != nil" object file lineNumber description];
    }
    v41 = (void *)[MEMORY[0x1E4F8ABF8] newNodeContainerWithNode:v10];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F8AC00]) initWithSocialGroup:v41];
    v12 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_keyAssetID];
    id v46 = 0;
    v13 = [v11 assetIDsIncludedInExclusiveContainment:v12 error:&v46];
    id v14 = v46;

    if (!v13) {
      goto LABEL_22;
    }
    if ([v13 containsObject:self->_keyAssetID])
    {
      id v45 = v14;
      char v15 = [v9 setKeyAsset:v42 error:&v45];
      id v16 = v45;

      if (v15)
      {
        if (self->_userAction)
        {
          id v44 = v16;
          int v17 = 1;
          char v18 = [v9 setKeyAssetPickSource:1 error:&v44];
          id v19 = v44;

          id v14 = v19;
          uint64_t v20 = v40;
          if (v18) {
            goto LABEL_43;
          }
        }
        else
        {
          id v43 = v16;
          char v37 = [v9 setKeyAssetPickSource:0 error:&v43];
          id v38 = v43;

          id v14 = v38;
          if (v37)
          {
            int v17 = 1;
            uint64_t v20 = v40;
LABEL_43:

            char v31 = 1;
LABEL_32:

            if (v31)
            {
LABEL_33:
              BOOL v21 = v17 != 0;
              goto LABEL_35;
            }
LABEL_34:
            BOOL v21 = 0;
            goto LABEL_35;
          }
          uint64_t v20 = v40;
        }
        if (a5)
        {
          id v14 = v14;
          int v17 = 0;
          *a5 = v14;
        }
        else
        {
          int v17 = 0;
        }
        goto LABEL_43;
      }
      if (a5)
      {
        id v14 = v16;
        char v31 = 0;
        *a5 = v14;
        int v17 = 1;
      }
      else
      {
        char v31 = 0;
        int v17 = 1;
        id v14 = v16;
      }
LABEL_31:
      uint64_t v20 = v40;
      goto LABEL_32;
    }
    if (([v13 containsObject:self->_keyAssetID] & 1) == 0)
    {
      v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28228];
      v50 = @"The key asset must exist in the social group";
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v34 = [v32 errorWithDomain:@"PHPhotosErrorDomain" code:7402 userInfo:v33];
      v35 = v34;
      if (a5) {
        *a5 = v34;
      }
    }
    else
    {
LABEL_22:
      if (a5)
      {
        id v14 = v14;
        int v17 = 0;
        *a5 = v14;
LABEL_30:
        char v31 = 1;
        goto LABEL_31;
      }
    }
    int v17 = 0;
    goto LABEL_30;
  }
  BOOL v21 = 1;
LABEL_35:

  return v21;
}

- (BOOL)_applyVerifiedTypeToContainer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = v7;
  if (!self->_didRejectSocialGroup)
  {
    if (!self->_userAction)
    {
      if (!self->_didUnrejectSocialGroup)
      {
        if ([v7 socialGroupVerifiedType])
        {
          id v11 = 0;
          goto LABEL_6;
        }
        int v17 = 0;
        char v9 = [v8 setSocialGroupVerifiedType:2 error:&v17];
        id v10 = v17;
        goto LABEL_5;
      }
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PHSocialGroupChangeRequest.m", 411, @"Invalid parameter not satisfying: %@", @"_userAction" object file lineNumber description];
    }
    id v18 = 0;
    BOOL v12 = 1;
    char v14 = [v8 setSocialGroupVerifiedType:1 error:&v18];
    id v11 = v18;
    if (v14) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (!self->_userAction)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PHSocialGroupChangeRequest.m", 404, @"Invalid parameter not satisfying: %@", @"_userAction" object file lineNumber description];
  }
  id v19 = 0;
  char v9 = [v8 setSocialGroupVerifiedType:0xFFFFFFFFLL error:&v19];
  id v10 = v19;
LABEL_5:
  id v11 = v10;
  if (v9)
  {
LABEL_6:
    BOOL v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  if (a4)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a4 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_14:

  return v12;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = [(PHChangeRequest *)self helper];
  id v32 = 0;
  int v9 = [v8 applyMutationsToManagedObject:v7 error:&v32];
  id v10 = v32;

  if (v9)
  {
    id v11 = (void *)[MEMORY[0x1E4F8A860] newNodeContainerWithNode:v7];
    BOOL v12 = [v11 members];
    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28228];
      v34[0] = @"Error fetching social group members";
      char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      uint64_t v15 = [v13 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v14];

      id v10 = (id)v15;
    }
    uint64_t v16 = [v12 count];
    if (v12) {
      BOOL v17 = v16 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    BOOL v18 = !v17;
    if (v16) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v12 == 0;
    }
    if (!v19)
    {
      id v31 = v10;
      BOOL v18 = [(PHSocialGroupChangeRequest *)self _applyInitialMembersToContainer:v11 error:&v31];
      id v20 = v31;

      id v10 = v20;
    }
    if (self->_didSetCustomTitle) {
      [v11 setCustomTitle:self->_customTitle];
    }
    if (v18)
    {
      id v30 = v10;
      BOOL v21 = [(PHSocialGroupChangeRequest *)self _applyAutomaticOrderToContainer:v11 error:&v30];
      id v22 = v30;

      if (!v21)
      {
LABEL_25:
        BOOL v25 = 0;
        id v10 = v22;
LABEL_26:

        if (!a5) {
          goto LABEL_29;
        }
        goto LABEL_27;
      }
      id v29 = v22;
      BOOL v23 = [(PHSocialGroupChangeRequest *)self _applyManualOrderToContainer:v11 error:&v29];
      id v10 = v29;

      if (v23)
      {
        id v28 = v10;
        BOOL v24 = [(PHSocialGroupChangeRequest *)self _applyKeyAssetToContainer:v11 managedObject:v7 error:&v28];
        id v22 = v28;

        if (v24)
        {
          id v27 = v22;
          BOOL v25 = [(PHSocialGroupChangeRequest *)self _applyVerifiedTypeToContainer:v11 error:&v27];
          id v10 = v27;

          goto LABEL_26;
        }
        goto LABEL_25;
      }
    }
    BOOL v25 = 0;
    goto LABEL_26;
  }
  BOOL v25 = 0;
  if (!a5) {
    goto LABEL_29;
  }
LABEL_27:
  if (!v25) {
    *a5 = v10;
  }
LABEL_29:

  return v25;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHChangeRequest *)self helper];
  id v14 = 0;
  char v11 = [v10 allowMutationToManagedObject:v9 propertyKey:v8 error:&v14];

  id v12 = v14;
  if (a5 && (v11 & 1) == 0) {
    *a5 = v12;
  }

  return v11;
}

- (PHSocialGroupChangeRequest)initWithUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHSocialGroupChangeRequest;
  v5 = [(PHChangeRequest *)&v9 init];
  if (v5)
  {
    id v6 = [[PHChangeRequestHelper alloc] initForNewObjectWithUUID:v4 changeRequest:v5];
    helper = v5->super._helper;
    v5->super._helper = v6;
  }
  return v5;
}

- (PHSocialGroupChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHSocialGroupChangeRequest;
  id v8 = [(PHChangeRequest *)&v12 init];
  if (v8)
  {
    objc_super v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;
  }
  return v8;
}

- (id)placeholderForCreatedSocialGroup
{
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return v4;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 managedObjectContext];
  id v8 = objc_opt_class();
  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  id v10 = [v6 managedObjectContext];
  char v11 = [v8 _findNonUserVerifiedGroupUUIDWithMembers:initialMemberPersonIDs context:v10 changesError:a4];

  if (v11)
  {
    if (([v11 isEqualToString:&stru_1EEAC1950] & 1) != 0
      || ![(PHSocialGroupChangeRequest *)self isUserAction])
    {
      objc_super v12 = (void *)[MEMORY[0x1E4F8ABF8] newNodeContainerWithManagedObjectContext:v7];
      BOOL v17 = [(PHChangeRequest *)self uuid];
      [v12 setUuid:v17];

      uint64_t v16 = [v12 sourceNode];
    }
    else
    {
      objc_super v12 = [MEMORY[0x1E4F8A858] fetchRequest];
      v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"uuid", v11];
      [v12 setPredicate:v13];

      id v14 = [v6 managedObjectContext];
      uint64_t v15 = [v14 executeFetchRequest:v12 error:a4];
      uint64_t v16 = [v15 firstObject];

      if (v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v30 = v16;
        _os_log_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Found duplicate rejected/graph/unverified group %{public}@ (and no duplicate user groups) so not inserting new one.", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  BOOL v18 = [(PHChangeRequest *)self uuid];
  BOOL v19 = [v16 uuid];
  char v20 = [v18 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
    BOOL v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    id v28 = @"Social group placeholder UUID doesn't match object created for creation request";
    BOOL v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    BOOL v24 = [v21 errorWithDomain:v22 code:46502 userInfo:v23];
    BOOL v25 = v24;
    if (a4) {
      *a4 = v24;
    }

    uint64_t v16 = 0;
  }

  return v16;
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  xpc_dictionary_set_BOOL(v4, "userAction", self->_userAction);
  xpc_dictionary_set_BOOL(v4, "didSetCustomTitle", self->_didSetCustomTitle);
  if (self->_didSetCustomTitle) {
    PLXPCDictionarySetString();
  }
  xpc_dictionary_set_BOOL(v4, "didRejectSocialGroup", self->_didRejectSocialGroup);
  xpc_dictionary_set_BOOL(v4, "didUnrejectSocialGroup", self->_didUnrejectSocialGroup);
  if ([(NSSet *)self->_initialMemberPersonIDs count])
  {
    xpc_object_t v6 = xpc_array_create(0, 0);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_initialMemberPersonIDs;
    uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          PLXPCArrayAppendManagedObjectID();
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    xpc_dictionary_set_value(v4, "memberPersonIDs", v6);
  }
  xpc_dictionary_set_BOOL(v4, "didSetAutomaticOrder", self->_didSetAutomaticOrder);
  if (self->_didSetAutomaticOrder) {
    xpc_dictionary_set_int64(v4, "automaticOrder", self->_automaticOrder);
  }
  xpc_dictionary_set_BOOL(v4, "didSetManualOrder", self->_didSetManualOrder);
  if (self->_didSetManualOrder) {
    xpc_dictionary_set_int64(v4, "manualOrder", self->_manualOrder);
  }
  if (self->_keyAssetID) {
    PLXPCDictionarySetManagedObjectID();
  }
}

- (id)initForNewObject
{
  v6.receiver = self;
  v6.super_class = (Class)PHSocialGroupChangeRequest;
  v2 = [(PHChangeRequest *)&v6 init];
  if (v2)
  {
    v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;
  }
  return v2;
}

- (id)_personIDsFromXPCDict:(id)a3 key:(const char *)a4 request:(id)a5
{
  id v8 = a5;
  uint64_t v9 = xpc_dictionary_get_value(a3, a4);
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v11 = [v8 persistentStoreCoordinator];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    BOOL v19 = __64__PHSocialGroupChangeRequest__personIDsFromXPCDict_key_request___block_invoke;
    char v20 = &unk_1E5848340;
    id v21 = v11;
    id v22 = v10;
    id v12 = v10;
    id v13 = v11;
    xpc_array_apply(v9, &v17);
    long long v14 = [(PHChangeRequest *)self helper];
    [v14 setMutated:1];

    [v8 recordUpdateRequest:self];
    long long v15 = (void *)[v12 copy];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

uint64_t __64__PHSocialGroupChangeRequest__personIDsFromXPCDict_key_request___block_invoke(uint64_t a1)
{
  uint64_t v2 = PLManagedObjectIDFromXPCValue();
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = +[PHPhotoLibrary uniquedOID:v2];

    if (v4)
    {
      [*(id *)(a1 + 40) addObject:v4];
    }
  }
  return 1;
}

- (PHSocialGroupChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PHSocialGroupChangeRequest;
  uint64_t v11 = [(PHChangeRequest *)&v28 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    v11->_userAction = xpc_dictionary_get_BOOL(v8, "userAction");
    BOOL v14 = xpc_dictionary_get_BOOL(v8, "didSetCustomTitle");
    v11->_didSetCustomTitle = v14;
    if (v14)
    {
      uint64_t v15 = PLStringFromXPCDictionary();
      customTitle = v11->_customTitle;
      v11->_customTitle = (NSString *)v15;

      [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
      [v9 recordUpdateRequest:v11];
    }
    BOOL v17 = xpc_dictionary_get_BOOL(v8, "didRejectSocialGroup");
    v11->_didRejectSocialGroup = v17;
    if (v17)
    {
      [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
      [v9 recordUpdateRequest:v11];
    }
    BOOL v18 = xpc_dictionary_get_BOOL(v8, "didUnrejectSocialGroup");
    v11->_didUnrejectSocialGroup = v18;
    if (v18)
    {
      [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
      [v9 recordUpdateRequest:v11];
    }
    uint64_t v19 = [(PHSocialGroupChangeRequest *)v11 _personIDsFromXPCDict:v8 key:"memberPersonIDs" request:v9];
    initialMemberPersonIDs = v11->_initialMemberPersonIDs;
    v11->_initialMemberPersonIDs = (NSSet *)v19;

    BOOL v21 = xpc_dictionary_get_BOOL(v8, "didSetAutomaticOrder");
    v11->_didSetAutomaticOrder = v21;
    if (v21)
    {
      v11->_automaticOrder = xpc_dictionary_get_int64(v8, "automaticOrder");
      [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
      [v9 recordUpdateRequest:v11];
    }
    BOOL v22 = xpc_dictionary_get_BOOL(v8, "didSetManualOrder");
    v11->_didSetManualOrder = v22;
    if (v22)
    {
      v11->_manualOrder = xpc_dictionary_get_int64(v8, "manualOrder");
      [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
      [v9 recordUpdateRequest:v11];
    }
    BOOL v23 = xpc_dictionary_get_value(v8, "keyAssetID");
    if (v23)
    {
      BOOL v24 = [v9 persistentStoreCoordinator];
      uint64_t v25 = PLManagedObjectIDFromXPCValue();
      keyAssetID = v11->_keyAssetID;
      v11->_keyAssetID = (NSManagedObjectID *)v25;

      [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
      [v9 recordUpdateRequest:v11];
    }
  }
  return v11;
}

+ (void)deleteSocialGroups:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)_findNonUserVerifiedGroupUUIDWithMembers:(id)a3 context:(id)a4 changesError:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F8ABF8] fetchDuplicateSocialGroupIDsWithMemberIDs:v7 inContext:v8 error:a5];
    if (!v9)
    {
      uint64_t v19 = 0;
      BOOL v17 = &stru_1EEAC1950;
      goto LABEL_19;
    }
    id v10 = (void *)v9;
    uint64_t v11 = [MEMORY[0x1E4F8A868] fetchRequest];
    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K IN %@) AND (%K = %@) AND (%K = %d)", @"node", v10, @"valueName", @"socialGroupVerifiedType", @"intValue", 1];
    [v11 setPredicate:v12];

    [v11 setResultType:1];
    id v28 = 0;
    id v13 = [v8 executeFetchRequest:v11 error:&v28];
    id v14 = v28;
    uint64_t v15 = v14;
    if (v13)
    {
      if ([v13 count])
      {
        int v16 = 0;
        BOOL v17 = &stru_1EEAC1950;
        id v18 = v15;
        uint64_t v19 = &stru_1EEAC1950;
        goto LABEL_17;
      }
      if ([v10 count])
      {
        uint64_t v26 = [v10 firstObject];
        char v20 = [MEMORY[0x1E4F8A858] fetchRequest];
        [v20 setResultType:2];
        v29[0] = @"uuid";
        BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
        [v20 setPropertiesToFetch:v21];

        BOOL v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self = %@", v26];
        [v20 setPredicate:v22];

        id v27 = v15;
        BOOL v23 = [v8 executeFetchRequest:v20 error:&v27];
        id v18 = v27;

        BOOL v24 = [v23 firstObject];

        if (v24)
        {
          BOOL v17 = [v24 objectForKeyedSubscript:@"uuid"];

          uint64_t v19 = 0;
          int v16 = 1;
          goto LABEL_17;
        }
        if (a5) {
          *a5 = v18;
        }

        int v16 = 0;
        uint64_t v19 = 0;
LABEL_16:
        BOOL v17 = &stru_1EEAC1950;
LABEL_17:

        if (!v16) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      uint64_t v19 = 0;
      int v16 = 1;
    }
    else
    {
      if (a5)
      {
        id v18 = v14;
        int v16 = 0;
        uint64_t v19 = 0;
        *a5 = v18;
        goto LABEL_16;
      }
      int v16 = 0;
      uint64_t v19 = 0;
    }
    id v18 = v15;
    goto LABEL_16;
  }
  BOOL v17 = &stru_1EEAC1950;
LABEL_18:
  BOOL v17 = v17;
  uint64_t v19 = v17;
LABEL_19:

  return v19;
}

+ (id)changeRequestForSocialGroup:(id)a3 userAction:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v6 = [PHSocialGroupChangeRequest alloc];
    id v7 = [v5 uuid];
    id v8 = [v5 objectID];
    uint64_t v9 = [(PHSocialGroupChangeRequest *)v6 initWithUUID:v7 objectID:v8];

    v9->_userAction = a4;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)creationRequestForSocialGroupWithMembers:(id)a3 userAction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) objectID];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  if (!v4) {
    goto LABEL_13;
  }
  v34[0] = 0;
  v34[1] = v34;
  void v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__45870;
  v34[4] = __Block_byref_object_dispose__45871;
  id v35 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__45870;
  id v32 = __Block_byref_object_dispose__45871;
  id v33 = 0;
  id v13 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
  id v14 = [v13 managedObjectContext];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__PHSocialGroupChangeRequest_creationRequestForSocialGroupWithMembers_userAction___block_invoke;
  v22[3] = &unk_1E5848368;
  uint64_t v25 = &v28;
  id v27 = a1;
  id v23 = v7;
  id v15 = v14;
  id v24 = v15;
  uint64_t v26 = v34;
  [v15 performBlockAndWait:v22];
  int v16 = (void *)v29[5];
  if (!v16) {
    goto LABEL_11;
  }
  if (([v16 isEqualToString:&stru_1EEAC1950] & 1) == 0)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F29128]);
    char v20 = (void *)[v19 initWithUUIDString:v29[5]];
    BOOL v17 = [a1 _creationRequestForSocialGroupCopyWithUUID:v20];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v29[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v21;
      _os_log_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Found duplicate rejected/graph/unverified group %{public}@ (and no duplicate user groups) so using creation request for existing group.", buf, 0xCu);
    }
  }
  else
  {
LABEL_11:
    BOOL v17 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);

  if (!v17)
  {
LABEL_13:
    BOOL v17 = [[PHSocialGroupChangeRequest alloc] initForNewObject];
    v17[32] = v4;
  }
  [v17 _setMembers:v8];

  return v17;
}

void __82__PHSocialGroupChangeRequest_creationRequestForSocialGroupWithMembers_userAction___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  BOOL v4 = (void *)a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 _findNonUserVerifiedGroupUUIDWithMembers:v2 context:v3 changesError:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "creationRequestForSocialGroupWithMembers: error fetching social group nodes: %@", buf, 0xCu);
    }
  }
}

+ (id)_creationRequestForSocialGroupCopyWithUUID:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[PHSocialGroupChangeRequest alloc] initWithUUID:v3];

  v4->_userAction = 1;
  [(PHSocialGroupChangeRequest *)v4 unrejectSocialGroup];

  return v4;
}

@end