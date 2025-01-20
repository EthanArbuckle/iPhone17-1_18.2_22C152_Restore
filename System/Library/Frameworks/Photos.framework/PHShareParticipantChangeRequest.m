@interface PHShareParticipantChangeRequest
+ (id)changeRequestForShareParticipant:(id)a3;
+ (id)creationRequestForShareParticipantWithEmailAddress:(id)a3 permission:(signed __int16)a4;
+ (id)creationRequestForShareParticipantWithPhoneNumber:(id)a3 permission:(signed __int16)a4;
+ (void)deleteShareParticipants:(id)a3;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)isCurrentUser;
- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4;
- (NSString)emailAddress;
- (NSString)managedEntityName;
- (NSString)phoneNumber;
- (PHObjectPlaceholder)placeholderForCreatedShareParticipant;
- (PHRelationshipChangeRequestHelper)personHelper;
- (PHShareParticipantChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHShareParticipantChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)_mutablePersonObjectIDsAndUUIDs;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (signed)exitState;
- (signed)permission;
- (unsigned)role;
- (void)_preparePersonIDIfNeeded;
- (void)encodeToXPCDict:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setExitState:(signed __int16)a3;
- (void)setIsCurrentUser:(BOOL)a3;
- (void)setPermission:(signed __int16)a3;
- (void)setPerson:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRole:(unsigned __int16)a3;
@end

@implementation PHShareParticipantChangeRequest

- (void).cxx_destruct
{
}

- (PHRelationshipChangeRequestHelper)personHelper
{
  return self->_personHelper;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [(PHChangeRequest *)self helper];
  id v20 = 0;
  int v9 = [v8 applyMutationsToManagedObject:v7 error:&v20];
  id v10 = v20;

  v11 = [(PHShareParticipantChangeRequest *)self personHelper];
  v12 = v11;
  if (v9)
  {
    v13 = [v11 mutableObjectIDsAndUUIDs];
    uint64_t v14 = [v13 count];

    if (!v14)
    {
      char v16 = 1;
      goto LABEL_9;
    }
    [v12 setAllowsInsert:1];
    v15 = [MEMORY[0x1E4F8AA10] entityName];
    [v12 setDestinationEntityName:v15];

    [v12 setIsDestinationObjectValid:&__block_literal_global_30225];
    id v19 = v10;
    char v16 = [v12 applyMutationsToManagedObjectToOneRelationship:v7 error:&v19];
    id v17 = v19;

    id v10 = v17;
    if (!a5) {
      goto LABEL_9;
    }
  }
  else
  {
    char v16 = 0;
    if (!a5) {
      goto LABEL_9;
    }
  }
  if ((v16 & 1) == 0)
  {
    id v10 = v10;
    char v16 = 0;
    *a5 = v10;
  }
LABEL_9:

  return v16;
}

uint64_t __84__PHShareParticipantChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValidForPersistence] ^ 1;
}

- (void)setPerson:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    [(PHChangeRequest *)self didMutate];
    v5 = PLObjectIDOrUUIDFromPHObject(v10);
    id v4 = v10;
    if (v5)
    {
      v6 = [(PHShareParticipantChangeRequest *)self _mutablePersonObjectIDsAndUUIDs];
      uint64_t v7 = [v6 count];

      v8 = [(PHShareParticipantChangeRequest *)self _mutablePersonObjectIDsAndUUIDs];
      int v9 = v8;
      if (v7) {
        [v8 replaceObjectAtIndex:0 withObject:v5];
      }
      else {
        [v8 addObject:v5];
      }

      id v4 = v10;
    }
  }
}

- (id)_mutablePersonObjectIDsAndUUIDs
{
  [(PHShareParticipantChangeRequest *)self _preparePersonIDIfNeeded];
  v3 = [(PHShareParticipantChangeRequest *)self personHelper];
  id v4 = [v3 mutableObjectIDsAndUUIDs];

  return v4;
}

- (void)_preparePersonIDIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHRelationshipChangeRequestHelper *)self->_personHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_personHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_personHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    personHelper = self->_personHelper;
    id v7 = [(PHRelationshipChangeRequestHelper *)personHelper originalObjectIDs];
    v6 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)personHelper setMutableObjectIDsAndUUIDs:v6];
  }
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v6 = [MEMORY[0x1E4F8ABD8] insertInPhotoLibrary:a3];
  id v7 = [(PHShareParticipantChangeRequest *)self emailAddress];
  [v6 setEmailAddress:v7];

  v8 = [(PHShareParticipantChangeRequest *)self phoneNumber];
  [v6 setPhoneNumber:v8];

  int v9 = [(PHChangeRequest *)self uuid];
  [v6 setUuid:v9];

  int v10 = [(PHShareParticipantChangeRequest *)self role];
  if ((v10 - 1) < 3) {
    uint64_t v11 = (unsigned __int16)(v10 - 1) + 1;
  }
  else {
    uint64_t v11 = 0;
  }
  [v6 setRole:v11];
  if (a4 && !v6)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setExitState:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"exitState"];
}

- (signed)exitState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"exitState"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"isCurrentUser"];
}

- (BOOL)isCurrentUser
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"isCurrentUser"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setPermission:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"permission"];
}

- (signed)permission
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"permission"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setRole:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"role"];
}

- (unsigned)role
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"role"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setPhoneNumber:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"phoneNumber"];

    id v8 = [(PHChangeRequest *)self helper];
    int v9 = [v8 nilMutations];
    [v9 removeObject:@"phoneNumber"];
  }
  else
  {
    [v6 removeObjectForKey:@"phoneNumber"];

    id v8 = [(PHChangeRequest *)self helper];
    int v9 = [v8 nilMutations];
    [v9 addObject:@"phoneNumber"];
  }
}

- (NSString)phoneNumber
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"phoneNumber"];

  return (NSString *)v5;
}

- (void)setEmailAddress:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"emailAddress"];

    id v8 = [(PHChangeRequest *)self helper];
    int v9 = [v8 nilMutations];
    [v9 removeObject:@"emailAddress"];
  }
  else
  {
    [v6 removeObjectForKey:@"emailAddress"];

    id v8 = [(PHChangeRequest *)self helper];
    int v9 = [v8 nilMutations];
    [v9 addObject:@"emailAddress"];
  }
}

- (NSString)emailAddress
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"emailAddress"];

  return (NSString *)v5;
}

- (PHObjectPlaceholder)placeholderForCreatedShareParticipant
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (NSString)managedEntityName
{
  return (NSString *)@"ShareParticipant";
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 type] && objc_msgSend(v5, "type") != 1)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28568];
      v10[0] = @"Change must be performed within the sharedPhotoLibrary or sharedMomentSharePhotoLibrary";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      objc_msgSend(v6, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (void)encodeToXPCDict:(id)a3
{
  id v5 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 encodeToXPCDict:v5];

  [(PHRelationshipChangeRequestHelper *)self->_personHelper encodeToXPCDict:v5];
}

- (PHShareParticipantChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PHShareParticipantChangeRequest;
  uint64_t v11 = [(PHChangeRequest *)&v17 init];
  if (v11)
  {
    v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    uint64_t v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"person" xpcDict:v8 changeRequestHelper:v11->super._helper];
    personHelper = v11->_personHelper;
    v11->_personHelper = v14;
  }
  return v11;
}

- (PHShareParticipantChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHShareParticipantChangeRequest;
  id v8 = [(PHChangeRequest *)&v14 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    uint64_t v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"person" changeRequestHelper:v8->super._helper];
    personHelper = v8->_personHelper;
    v8->_personHelper = v11;
  }
  return v8;
}

- (id)initForNewObject
{
  v8.receiver = self;
  v8.super_class = (Class)PHShareParticipantChangeRequest;
  v2 = [(PHChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"person" changeRequestHelper:v2->super._helper];
    personHelper = v2->_personHelper;
    v2->_personHelper = v5;
  }
  return v2;
}

+ (void)deleteShareParticipants:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)creationRequestForShareParticipantWithPhoneNumber:(id)a3 permission:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  id v6 = [[PHShareParticipantChangeRequest alloc] initForNewObject];
  [v6 setPhoneNumber:v5];

  [v6 setPermission:v4];

  return v6;
}

+ (id)creationRequestForShareParticipantWithEmailAddress:(id)a3 permission:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  id v6 = [[PHShareParticipantChangeRequest alloc] initForNewObject];
  [v6 setEmailAddress:v5];

  [v6 setPermission:v4];

  return v6;
}

+ (id)changeRequestForShareParticipant:(id)a3
{
  return +[PHChangeRequestHelper changeRequestForObject:a3];
}

@end