@interface PHChangeRequestHelper
+ (BOOL)supportsSecureCoding;
+ (id)changeRequestForObject:(id)a3;
+ (id)changeRequestWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 error:(id *)a4;
- (BOOL)getCloudGUIDIfReserved:(id *)a3 entityName:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)isClientEntitled;
- (BOOL)isClientInLimitedLibraryMode;
- (BOOL)isMutated;
- (BOOL)isNewRequest;
- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4;
- (BOOL)prepareForServicePreflightCheck:(id *)a3;
- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4;
- (NSManagedObjectID)objectID;
- (NSMutableDictionary)mutations;
- (NSMutableSet)nilMutations;
- (NSString)clientBundleIdentifier;
- (NSString)clientDisplayName;
- (NSString)fetchFilterIdentifier;
- (NSString)uuid;
- (PHChangeRequest)changeRequest;
- (PHChangeRequestHelper)init;
- (PHChangeRequestHelper)initWithCoder:(id)a3;
- (PHChangeRequestHelper)initWithUUID:(id)a3 objectID:(id)a4 changeRequest:(id)a5;
- (PHChangeRequestHelper)initWithUUID:(id)a3 objectID:(id)a4 isNew:(BOOL)a5 changeRequest:(id)a6;
- (PHChangeRequestHelper)initWithXPCDict:(id)a3 changeRequest:(id)a4 request:(id)a5 clientAuthorization:(id)a6;
- (PHClientLinkedAgainst)clientLinkedAgainst;
- (PHCreationRequestOptions)creationOptions;
- (PHPerformChangesRequest)request;
- (PLClientAuthorization)clientAuthorization;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)description;
- (id)initForNewObjectWithChangeRequest:(id)a3;
- (id)initForNewObjectWithUUID:(id)a3 changeRequest:(id)a4;
- (id)placeholderForCreatedObjectWithClass:(Class)a3 changeRequest:(id)a4;
- (id)validateMutationsToManagedObject:(id)a3;
- (void)didMutate;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeRequest:(id)a3;
- (void)setClientLinkedAgainst:(id)a3;
- (void)setCreationOptions:(id)a3;
- (void)setMutated:(BOOL)a3;
- (void)setNewRequest:(BOOL)a3;
- (void)setObjectID:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation PHChangeRequestHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationOptions, 0);
  objc_storeStrong((id *)&self->_clientLinkedAgainst, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_changeRequest);
  objc_storeStrong((id *)&self->_clientAuthorization, 0);
  objc_storeStrong((id *)&self->_nilMutations, 0);

  objc_storeStrong((id *)&self->_mutations, 0);
}

- (void)setCreationOptions:(id)a3
{
}

- (PHCreationRequestOptions)creationOptions
{
  return self->_creationOptions;
}

- (void)setClientLinkedAgainst:(id)a3
{
}

- (PHClientLinkedAgainst)clientLinkedAgainst
{
  return self->_clientLinkedAgainst;
}

- (void)setObjectID:(id)a3
{
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setRequest:(id)a3
{
  self->_request = (PHPerformChangesRequest *)a3;
}

- (PHPerformChangesRequest)request
{
  return self->_request;
}

- (void)setChangeRequest:(id)a3
{
}

- (PHChangeRequest)changeRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeRequest);

  return (PHChangeRequest *)WeakRetained;
}

- (PLClientAuthorization)clientAuthorization
{
  return self->_clientAuthorization;
}

- (NSMutableSet)nilMutations
{
  return self->_nilMutations;
}

- (NSMutableDictionary)mutations
{
  return self->_mutations;
}

- (PHChangeRequestHelper)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PHChangeRequestHelper;
  v5 = [(PHChangeRequestHelper *)&v48 init];
  if (v5)
  {
    id v6 = v4;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v42 = [MEMORY[0x1E4F28B00] currentHandler];
        v43 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertRespondsToSelector(id  _Nullable __strong, SEL _Nonnull)");
        v44 = NSStringFromSelector(sel_userInfo);
        [v42 handleFailureInFunction:v43, @"PLHelperExtension.h", 91, @"Object does not respond to selector %@: %@", v44, v6 file lineNumber description];
      }
      id v7 = v6;
    }
    id v47 = v4;

    v46 = [v6 userInfo];
    v8 = [v46 persistentStoreCoordinator];
    uint64_t v9 = objc_opt_class();
    v10 = [NSString stringWithUTF8String:"uuid"];
    uint64_t v11 = [v6 decodeObjectOfClass:v9 forKey:v10];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v11;

    v13 = [NSString stringWithUTF8String:"isNewRequest"];
    v5->_isNewRequest = [v6 decodeBoolForKey:v13];

    uint64_t v14 = objc_opt_class();
    v15 = [NSString stringWithUTF8String:"objectID"];
    uint64_t v16 = [v6 decodeObjectOfClass:v14 forKey:v15];

    if (v16)
    {
      uint64_t v17 = PLManagedObjectIDFromData();
      objectID = v5->_objectID;
      v5->_objectID = (NSManagedObjectID *)v17;
    }
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v45 = (void *)v16;
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, objc_opt_class(), 0);
    v26 = [NSString stringWithUTF8String:"mutations"];
    uint64_t v27 = [v6 decodeObjectOfClasses:v25 forKey:v26];
    mutations = v5->_mutations;
    v5->_mutations = (NSMutableDictionary *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v29, "setWithObjects:", v30, v31, v32, v33, v34, objc_opt_class(), 0);
    v36 = [NSString stringWithUTF8String:"nilMutations"];
    uint64_t v37 = [v6 decodeObjectOfClasses:v35 forKey:v36];
    nilMutations = v5->_nilMutations;
    v5->_nilMutations = (NSMutableSet *)v37;

    uint64_t v39 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"creationOptions"];
    creationOptions = v5->_creationOptions;
    v5->_creationOptions = (PHCreationRequestOptions *)v39;

    id v4 = v47;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  id v4 = [(PHChangeRequestHelper *)self uuid];
  v5 = [NSString stringWithUTF8String:"uuid"];
  [v22 encodeObject:v4 forKey:v5];

  id v6 = [(PHChangeRequestHelper *)self changeRequest];
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = [NSString stringWithUTF8String:"className"];
  [v22 encodeObject:v8 forKey:v9];

  v10 = [(PHChangeRequestHelper *)self mutations];
  uint64_t v11 = [NSString stringWithUTF8String:"mutations"];
  [v22 encodeObject:v10 forKey:v11];

  v12 = [(PHChangeRequestHelper *)self nilMutations];
  v13 = [NSString stringWithUTF8String:"nilMutations"];
  [v22 encodeObject:v12 forKey:v13];

  BOOL v14 = [(PHChangeRequestHelper *)self isNewRequest];
  v15 = [NSString stringWithUTF8String:"isNewRequest"];
  [v22 encodeBool:v14 forKey:v15];

  uint64_t v16 = [(PHChangeRequestHelper *)self objectID];

  if (v16)
  {
    uint64_t v17 = [(PHChangeRequestHelper *)self objectID];
    v18 = PLDataFromManagedObjectID();
    v19 = [NSString stringWithUTF8String:"objectID"];
    [v22 encodeObject:v18 forKey:v19];
  }
  uint64_t v20 = [(PHChangeRequestHelper *)self creationOptions];

  if (v20)
  {
    uint64_t v21 = [(PHChangeRequestHelper *)self creationOptions];
    [v22 encodeObject:v21 forKey:@"creationOptions"];
  }
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PHChangeRequestHelper;
  v3 = [(PHChangeRequestHelper *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@" _uuid %@", self->_uuid];
  objc_msgSend(v4, "appendFormat:", @" _isMutated %d", self->_isMutated);
  objc_msgSend(v4, "appendFormat:", @" _isNewRequest %d", self->_isNewRequest);
  [v4 appendFormat:@" _mutations %@", self->_mutations];
  [v4 appendFormat:@" _nilMutations %@", self->_nilMutations];

  return v4;
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict = a3;
  [(PHClientLinkedAgainst *)self->_clientLinkedAgainst encodeToXPCDict:xdict];
  id v4 = [(PHChangeRequestHelper *)self uuid];
  PLXPCDictionarySetString();

  v5 = [(PHChangeRequestHelper *)self changeRequest];
  objc_super v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  PLXPCDictionarySetString();

  v8 = [(PHChangeRequestHelper *)self objectID];
  PLXPCDictionarySetManagedObjectID();

  uint64_t v9 = [(PHChangeRequestHelper *)self mutations];
  PLXPCDictionarySetDictionary();

  v10 = [(PHChangeRequestHelper *)self nilMutations];
  uint64_t v11 = [v10 allObjects];
  PLXPCDictionarySetArray();

  xpc_dictionary_set_BOOL(xdict, "isNewRequest", [(PHChangeRequestHelper *)self isNewRequest]);
  if (self->_creationOptions)
  {
    v12 = [(PHChangeRequestHelper *)self creationOptions];
    [v12 encodeToXPCDict:xdict];
  }
}

- (BOOL)applyMutationsToManagedObject:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__8690;
  v26 = __Block_byref_object_dispose__8691;
  id v27 = 0;
  if (self->_isMutated)
  {
    mutations = self->_mutations;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke;
    v18[3] = &unk_1E5842E98;
    v18[4] = self;
    id v9 = v6;
    id v19 = v9;
    uint64_t v20 = &v22;
    uint64_t v21 = &v28;
    [(NSMutableDictionary *)mutations enumerateKeysAndObjectsUsingBlock:v18];
    nilMutations = self->_nilMutations;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke_2;
    v14[3] = &unk_1E5842EC0;
    v14[4] = self;
    id v15 = v9;
    uint64_t v16 = &v22;
    uint64_t v17 = &v28;
    [(NSMutableSet *)nilMutations enumerateObjectsUsingBlock:v14];
  }
  int v11 = *((unsigned __int8 *)v29 + 24);
  if (a4 && !*((unsigned char *)v29 + 24))
  {
    *a4 = (id) v23[5];
    int v11 = *((unsigned __int8 *)v29 + 24);
  }
  BOOL v12 = v11 != 0;
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

void __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) changeRequest];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v9 allowMutationToManagedObject:v10 propertyKey:v7 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
  {
    [*(id *)(a1 + 40) setValue:v8 forKey:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) changeRequest];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v6 allowMutationToManagedObject:v7 propertyKey:v5 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  if (v9)
  {
    [*(id *)(a1 + 40) setValue:0 forKey:v5];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (id)validateMutationsToManagedObject:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8690;
  id v27 = __Block_byref_object_dispose__8691;
  id v5 = (void *)MEMORY[0x1E4F8B9B8];
  id v6 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v7 = [v5 successWithResult:v6];

  id v28 = v7;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__8690;
  v21[4] = __Block_byref_object_dispose__8691;
  id v22 = 0;
  if (self->_isMutated)
  {
    mutations = self->_mutations;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke;
    v17[3] = &unk_1E5842E98;
    v17[4] = self;
    id v9 = v4;
    id v18 = v9;
    id v19 = v21;
    uint64_t v20 = &v23;
    [(NSMutableDictionary *)mutations enumerateKeysAndObjectsUsingBlock:v17];
    nilMutations = self->_nilMutations;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke_2;
    v13[3] = &unk_1E5842EC0;
    v13[4] = self;
    id v14 = v9;
    id v15 = v21;
    uint64_t v16 = &v23;
    [(NSMutableSet *)nilMutations enumerateObjectsUsingBlock:v13];
  }
  id v11 = (id)v24[5];
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&v23, 8);

  return v11;
}

void __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)a1[4];
  id v7 = a2;
  uint64_t v8 = [v6 changeRequest];
  uint64_t v9 = a1[5];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v8 allowMutationToManagedObject:v9 propertyKey:v7 error:&obj];

  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = +[PHChangeRequest sanitizedFailureWithError:*(void *)(*(void *)(a1[6] + 8) + 40)];
    uint64_t v13 = *(void *)(a1[7] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

void __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a2;
  id v7 = [v5 changeRequest];
  uint64_t v8 = a1[5];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v7 allowMutationToManagedObject:v8 propertyKey:v6 error:&obj];

  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = +[PHChangeRequest sanitizedFailureWithError:*(void *)(*(void *)(a1[6] + 8) + 40)];
    uint64_t v12 = *(void *)(a1[7] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a3 = 1;
  }
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v5 = [(PHChangeRequestHelper *)self validateMutationsToManagedObject:a3];
  id v6 = [v5 resultWithError:a4];
  LOBYTE(a4) = v6 != 0;

  return (char)a4;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = [(PHChangeRequestHelper *)self changeRequest];
  uint64_t v11 = [v10 managedEntityName];
  uint64_t v12 = [v8 managedObjectContext];
  uint64_t v13 = PLSafeEntityForNameInManagedObjectContext();
  id v14 = 0;

  if (!v13)
  {
    if (!a5)
    {
      BOOL v20 = 0;
      goto LABEL_13;
    }
    uint64_t v21 = v14;
LABEL_11:
    id v14 = v21;
    BOOL v20 = 0;
    *a5 = v14;
    goto LABEL_13;
  }
  id v15 = [v8 entity];
  int v16 = [v15 isKindOfEntity:v13];

  if (!v16)
  {
    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v23 = NSString;
    uint64_t v24 = [v13 name];
    uint64_t v25 = [v23 stringWithFormat:@"Invalid entity %@", v24];
    uint64_t v30 = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v21 = objc_msgSend(v22, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v26);

    id v14 = (id)v26;
    goto LABEL_10;
  }
  uint64_t v17 = [v8 entity];
  id v18 = [v17 attributesByName];
  id v19 = [v18 objectForKey:v9];

  if (!v19)
  {
    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v24 = [NSString stringWithFormat:@"Invalid property %@", v9];
    v32[0] = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v21 = objc_msgSend(v27, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v25);
LABEL_10:

    if (!a5)
    {
      BOOL v20 = 0;
      id v14 = v21;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  BOOL v20 = 1;
LABEL_13:

  return v20;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PHChangeRequestHelper *)self changeRequest];
  id v8 = [v7 managedEntityName];
  id v9 = [v6 managedObjectContext];

  char v10 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext();
  id v11 = 0;

  if (a4 && !v10)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    v16[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)getCloudGUIDIfReserved:(id *)a3 entityName:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(PHChangeRequestHelper *)self creationOptions];
  uint64_t v13 = [v12 reservedCloudIdentifier];

  if (v13)
  {
    v40 = a6;
    id v14 = [v13 identifierCode];
    uint64_t v15 = +[PHPhotoLibrary PHObjectClassForIdentifierCode:v14];

    int v16 = [(objc_class *)v15 managedEntityName];
    if (v16)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1C0A8];
      id v18 = [v11 managedObjectContext];
      id v19 = [v17 entityForName:v16 inManagedObjectContext:v18];
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F1C0A8];
    id v41 = v11;
    id v22 = [v11 managedObjectContext];
    uint64_t v23 = [v21 entityForName:v10 inManagedObjectContext:v22];

    uint64_t v24 = [v13 localCloudIdentifier];
    id v25 = v10;
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v24];
    v43 = (void *)v23;
    v44 = v19;
    v42 = v25;
    if ([v19 isKindOfEntity:v23])
    {
      uint64_t v39 = a3;
      id v27 = [(PHChangeRequestHelper *)self request];
      id v28 = [v27 libraryServicesManager];
      uint64_t v29 = [v28 cloudIdentifierReservationSupport];

      uint64_t v30 = [v27 clientBundleID];
      id v45 = 0;
      uint64_t v31 = (void *)v26;
      int v32 = [v29 takeReservedCloudIdentifierWithEntityName:v16 uuid:v26 clientBundleIdentifier:v30 error:&v45];
      id v33 = v45;

      if (v32)
      {
        *uint64_t v39 = v24;
        BOOL v20 = 1;
LABEL_13:
        id v10 = v42;

        id v11 = v41;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F8C500];
      uint64_t v46 = *MEMORY[0x1E4F28228];
      v36 = [NSString stringWithFormat:@"Cannot assign %@ based cloud identifier to %@", v15, +[PHPhotoLibrary PHObjectClassForEntityName:](PHPhotoLibrary, "PHObjectClassForEntityName:", v25)];
      v47[0] = v36;
      uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      id v33 = [v34 errorWithDomain:v35 code:46201 userInfo:v37];

      uint64_t v31 = (void *)v26;
    }
    if (v40)
    {
      id v33 = v33;
      BOOL v20 = 0;
      id *v40 = v33;
    }
    else
    {
      BOOL v20 = 0;
    }
    goto LABEL_13;
  }
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (NSString)fetchFilterIdentifier
{
  return (NSString *)[(PLClientAuthorization *)self->_clientAuthorization fetchFilterIdentifier];
}

- (NSString)clientBundleIdentifier
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(PLClientAuthorization *)self->_clientAuthorization trustedCallerBundleID];
  if ([v3 length])
  {
LABEL_2:

    goto LABEL_3;
  }
  int v6 = MEMORY[0x19F388B10]();

  if (v6)
  {
    v3 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = (int)[(PLClientAuthorization *)self->_clientAuthorization clientProcessIdentifier];
      id v8 = [(PHChangeRequestHelper *)self clientDisplayName];
      int v9 = 134218242;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_FAULT, "Client has no bundle identifier. PID %ld, name %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_2;
  }
LABEL_3:
  id v4 = [(PLClientAuthorization *)self->_clientAuthorization trustedCallerBundleID];

  return (NSString *)v4;
}

- (NSString)clientDisplayName
{
  return (NSString *)[(PLClientAuthorization *)self->_clientAuthorization trustedCallerDisplayName];
}

- (BOOL)isClientInLimitedLibraryMode
{
  return [(PLClientAuthorization *)self->_clientAuthorization limitedLibraryMode];
}

- (BOOL)isClientEntitled
{
  return [(PLClientAuthorization *)self->_clientAuthorization photoKitEntitled];
}

- (void)setNewRequest:(BOOL)a3
{
  self->_isNewRequest = a3;
}

- (BOOL)isNewRequest
{
  return self->_isNewRequest;
}

- (void)setMutated:(BOOL)a3
{
  self->_isMutated = a3;
}

- (BOOL)isMutated
{
  return self->_isMutated;
}

- (void)didMutate
{
  +[PHPhotoLibrary assertTransaction];
  if (!self->_isMutated)
  {
    v3 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
    id v4 = [(PHChangeRequestHelper *)self changeRequest];
    [v3 recordUpdateRequest:v4];

    self->_isMutated = 1;
  }
}

- (id)placeholderForCreatedObjectWithClass:(Class)a3 changeRequest:(id)a4
{
  id v6 = a4;
  +[PHPhotoLibrary assertTransaction];
  int v7 = [v6 isNewRequest];

  if (v7)
  {
    id v8 = [(PHChangeRequestHelper *)self uuid];

    if (!v8)
    {
      int v9 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v10 = [v9 UUIDString];
      uuid = self->_uuid;
      self->_uuid = v10;
    }
    uint64_t v12 = [(PHChangeRequestHelper *)self uuid];
    uint64_t v13 = [(objc_class *)a3 localIdentifierWithUUID:v12];

    id v14 = [[PHObjectPlaceholder alloc] initWithLocalIdentifier:v13];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = [a3 type];
  int v6 = v5;
  if (a4 && v5)
  {
    int v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Change must be performed within the sharedPhotoLibrary";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  return 1;
}

- (PHChangeRequestHelper)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-[PHChangeRequestHelper init] unsupported" userInfo:0];
  objc_exception_throw(v2);
}

- (PHChangeRequestHelper)initWithXPCDict:(id)a3 changeRequest:(id)a4 request:(id)a5 clientAuthorization:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (PHPerformChangesRequest *)a5;
  id v37 = a6;
  if (!v12)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"PHChangeRequestHelper.m" lineNumber:143 description:@"Must provide a change request"];
  }
  id v14 = [(PHPerformChangesRequest *)v13 persistentStoreCoordinator];
  uint64_t v15 = xpc_dictionary_get_value(v11, "objectID");
  if (v15)
  {
    int v16 = PLManagedObjectIDFromXPCValue();
  }
  else
  {
    int v16 = 0;
  }
  BOOL v17 = xpc_dictionary_get_BOOL(v11, "isNewRequest");
  id v18 = PLStringFromXPCDictionary();
  id v19 = [(PHChangeRequestHelper *)self initWithUUID:v18 objectID:v16 isNew:v17 changeRequest:v12];

  if (v19)
  {
    v19->_request = v13;
    objc_storeStrong((id *)&v19->_clientAuthorization, a6);
    BOOL v20 = PLDictionaryFromXPCDictionary();
    uint64_t v21 = [v20 mutableCopy];
    mutations = v19->_mutations;
    v19->_mutations = (NSMutableDictionary *)v21;

    uint64_t v23 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v24 = PLArrayFromXPCDictionary();
    uint64_t v25 = [v23 setWithArray:v24];
    nilMutations = v19->_nilMutations;
    v19->_nilMutations = (NSMutableSet *)v25;

    v19->_isNewRequest = v17;
    id v27 = [[PHClientLinkedAgainst alloc] initWithXPCDict:v11];
    clientLinkedAgainst = v19->_clientLinkedAgainst;
    v19->_clientLinkedAgainst = v27;

    if (!v16) {
      [(PHPerformChangesRequest *)v13 recordInsertRequest:v12];
    }
    uint64_t v29 = [(PHChangeRequestHelper *)v19 uuid];

    if (!v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v31 = [v30 UUIDString];
      uuid = v19->_uuid;
      v19->_uuid = (NSString *)v31;
    }
    if ([(NSMutableDictionary *)v19->_mutations count] || [(NSMutableSet *)v19->_nilMutations count])
    {
      [(PHPerformChangesRequest *)v13 recordUpdateRequest:v12];
      v19->_isMutated = 1;
    }
    id v33 = [[PHCreationRequestOptions alloc] initWithXPCDict:v11];
    creationOptions = v19->_creationOptions;
    v19->_creationOptions = v33;
  }
  return v19;
}

- (id)initForNewObjectWithUUID:(id)a3 changeRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  +[PHPhotoLibrary assertTransaction];
  if (v8)
  {
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2 object:self file:@"PHChangeRequestHelper.m" lineNumber:129 description:@"Must provide a change request"];

  if (!v7)
  {
LABEL_3:
    id v7 = [MEMORY[0x1E4F29128] UUID];
  }
LABEL_4:
  int v9 = [v7 UUIDString];
  uint64_t v10 = [(PHChangeRequestHelper *)self initWithUUID:v9 objectID:0 isNew:1 changeRequest:v8];

  if (v10)
  {
    id v11 = objc_alloc_init(PHClientLinkedAgainst);
    clientLinkedAgainst = v10->_clientLinkedAgainst;
    v10->_clientLinkedAgainst = v11;
  }
  return v10;
}

- (id)initForNewObjectWithChangeRequest:(id)a3
{
  return [(PHChangeRequestHelper *)self initForNewObjectWithUUID:0 changeRequest:a3];
}

- (PHChangeRequestHelper)initWithUUID:(id)a3 objectID:(id)a4 changeRequest:(id)a5
{
  int v5 = [(PHChangeRequestHelper *)self initWithUUID:a3 objectID:a4 isNew:0 changeRequest:a5];
  if (v5)
  {
    int v6 = objc_alloc_init(PHClientLinkedAgainst);
    clientLinkedAgainst = v5->_clientLinkedAgainst;
    v5->_clientLinkedAgainst = v6;
  }
  return v5;
}

- (PHChangeRequestHelper)initWithUUID:(id)a3 objectID:(id)a4 isNew:(BOOL)a5 changeRequest:(id)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  +[PHPhotoLibrary assertTransaction];
  if (!v14)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"PHChangeRequestHelper.m" lineNumber:80 description:@"Must provide a change request"];
  }
  v31.receiver = self;
  v31.super_class = (Class)PHChangeRequestHelper;
  uint64_t v15 = [(PHChangeRequestHelper *)&v31 init];
  int v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_objectID, a4);
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    mutations = v16->_mutations;
    v16->_mutations = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    nilMutations = v16->_nilMutations;
    v16->_nilMutations = (NSMutableSet *)v19;

    objc_storeWeak((id *)&v16->_changeRequest, v14);
    uint64_t v21 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
    if (v21 || (PLIsAssetsd() & 1) != 0)
    {
      if (v13) {
        goto LABEL_11;
      }
    }
    else
    {
      id v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v16 file:@"PHChangeRequestHelper.m" lineNumber:89 description:@"must be in a transaction PHPhotoLibrary or be running in assetsd"];

      if (v13) {
        goto LABEL_11;
      }
    }
    if (!v7)
    {
      id v22 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        uint64_t v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        id v35 = v14;
        uint64_t v24 = "Invalid change request %{public}@ %@ with isNew = NO and objectID = nil";
        uint64_t v25 = v22;
        uint32_t v26 = 22;
LABEL_15:
        _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_FAULT, v24, buf, v26);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
LABEL_11:
    if (!v13 || !v7)
    {
      if (v12) {
        [v21 setChangeRequest:v14 forUUID:v12];
      }
      if (!v13)
      {
        [v21 recordInsertRequest:v14];
        *(_WORD *)&v16->_isMutated = 257;
      }
      goto LABEL_17;
    }
    id v22 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      uint64_t v29 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v29;
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2114;
      id v37 = v13;
      uint64_t v24 = "Invalid change request %{public}@ %@ with isNew = YES and objectID = %{public}@";
      uint64_t v25 = v22;
      uint32_t v26 = 32;
      goto LABEL_15;
    }
LABEL_16:

    int v16 = 0;
LABEL_17:
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)changeRequestWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  PLStringFromXPCDictionary();
  id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v13 = NSClassFromString(v12);
  if (!v13)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PHChangeRequestHelper.m", 409, @"encoded missing 'className' field: %@", v9 object file lineNumber description];
  }
  id v14 = (void *)[[v13 alloc] initWithXPCDict:v9 request:v11 clientAuthorization:v10];

  return v14;
}

+ (id)changeRequestForObject:(id)a3
{
  id v5 = a3;
  int v6 = [v5 uuid];
  BOOL v7 = [v5 photoLibrary];
  id v8 = [v7 changeRequestForUUID:v6];
  if (!v8)
  {
    id v9 = (objc_class *)[v5 changeRequestClass];
    if (v9)
    {
      id v10 = [v9 alloc];
      id v11 = [v5 objectID];
      id v8 = (void *)[v10 initWithUUID:v6 objectID:v11];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"PHChangeRequestHelper.m" lineNumber:68 description:@"Unsupported change request type!"];
      id v8 = 0;
    }
  }

  return v8;
}

@end