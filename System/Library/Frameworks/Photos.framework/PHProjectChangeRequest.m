@interface PHProjectChangeRequest
+ (id)creationRequestForProjectCopyFromProject:(id)a3;
+ (id)creationRequestForProjectWithDocumentType:(id)a3 projectExtensionIdentifier:(id)a4;
+ (id)creationRequestForProjectWithDocumentType:(id)a3 projectExtensionIdentifier:(id)a4 assets:(id)a5 title:(id)a6;
+ (void)_deleteProjects:(id)a3 withOperation:(int64_t)a4;
+ (void)deleteProjects:(id)a3;
+ (void)expungeProjects:(id)a3;
+ (void)undeleteProjects:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)prepareForServicePreflightCheck:(id *)a3;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSData)projectExtensionData;
- (NSString)managedEntityName;
- (NSString)projectDocumentType;
- (NSString)title;
- (PHProjectChangeRequest)initWithProject:(PHProject *)project;
- (PHProjectChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHProjectChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHRelationshipChangeRequestHelper)assetsHelper;
- (PHRelationshipChangeRequestHelper)keyAssetHelper;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)placeholderForCreatedProject;
- (id)projectExtensionIdentifier;
- (id)projectRenderUuid;
- (void)_prepareAssetIDsIfNeeded;
- (void)_prepareKeyAssetIDIfNeeded;
- (void)_setOriginalProject:(id)a3;
- (void)addAssets:(id)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)insertAssets:(id)a3 atIndexes:(id)a4;
- (void)moveAssetsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeAssets:(id)assets;
- (void)removeAssetsAtIndexes:(id)a3;
- (void)replaceAssetsAtIndexes:(id)a3 withAssets:(id)a4;
- (void)setAssets:(id)a3;
- (void)setKeyAsset:(PHAsset *)keyAsset;
- (void)setProjectDocumentType:(id)a3;
- (void)setProjectExtensionData:(NSData *)projectExtensionData;
- (void)setProjectExtensionIdentifier:(id)a3;
- (void)setProjectPreviewImage:(UIImage *)previewImage;
- (void)setProjectRenderUuid:(id)a3;
- (void)setTitle:(NSString *)title;
@end

@implementation PHProjectChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetHelper, 0);
  objc_storeStrong((id *)&self->_assetsHelper, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);

  objc_storeStrong((id *)&self->_originalProject, 0);
}

- (PHRelationshipChangeRequestHelper)keyAssetHelper
{
  return self->_keyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)assetsHelper
{
  return self->_assetsHelper;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  helper = self->super._helper;
  id v33 = 0;
  BOOL v9 = [(PHChangeRequestHelper *)helper applyMutationsToManagedObject:v7 error:&v33];
  id v10 = v33;
  v11 = [(PHProjectChangeRequest *)self assetsHelper];
  id v12 = v7;
  if (!v9) {
    goto LABEL_9;
  }
  v13 = [v11 mutableObjectIDsAndUUIDs];

  if (v13)
  {
    [v11 setAllowsInsert:1];
    [v11 setAllowsRemove:1];
    [v11 setAllowsMove:1];
    v14 = [MEMORY[0x1E4F8A950] entityName];
    [v11 setDestinationEntityName:v14];

    v15 = [v11 relationshipName];
    v16 = [v12 mutableOrderedSetValueForKey:v15];

    id v32 = v10;
    int v17 = [v11 applyMutationsToManagedObject:v12 orderedMutableChildren:v16 error:&v32];
    id v18 = v32;

    if (!v17)
    {
      char v19 = 0;
      id v10 = v18;
      goto LABEL_10;
    }
  }
  else
  {
    id v18 = v10;
  }
  v20 = [(PHProjectChangeRequest *)self keyAssetHelper];
  v21 = [v20 mutableObjectIDsAndUUIDs];

  if (!v21)
  {

    goto LABEL_16;
  }
  [v20 setAllowsInsert:1];
  v22 = [MEMORY[0x1E4F8A950] entityName];
  [v20 setDestinationEntityName:v22];

  id v31 = v18;
  int v23 = [v20 applyMutationsToManagedObjectToOneRelationship:v12 error:&v31];
  id v10 = v31;

  if (!v23)
  {
LABEL_9:
    char v19 = 0;
    goto LABEL_10;
  }
  id v18 = v10;
LABEL_16:
  if (!self->_didSetPreviewImage)
  {
    char v19 = 1;
    goto LABEL_14;
  }
  previewImageData = self->_previewImageData;
  id v30 = v18;
  char v19 = [v12 setProjectPreviewImageData:previewImageData error:&v30];
  id v26 = v30;

  if (v26)
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v28 = [v26 localizedDescription];
    v35[0] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    objc_msgSend(v27, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3302, v29);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_10:
  if (!a5 || (v19 & 1) != 0)
  {
    id v18 = v10;
  }
  else
  {
    id v18 = v10;
    char v19 = 0;
    *a5 = v18;
  }
LABEL_14:

  return v19;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  helper = self->super._helper;
  id v11 = 0;
  BOOL v7 = [(PHChangeRequestHelper *)helper allowMutationToManagedObject:a3 propertyKey:a4 error:&v11];
  id v8 = v11;
  BOOL v9 = v8;
  if (a5 && !v7) {
    *a5 = v8;
  }

  return v7;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v5 = [(PHChangeRequest *)self uuid];
  if (v5)
  {
    v6 = [(PHProjectChangeRequest *)self projectDocumentType];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F8AAF0];
  id v7 = a3;
  id v8 = [(PHChangeRequest *)self uuid];
  BOOL v9 = [(PHProjectChangeRequest *)self projectDocumentType];
  id v10 = [(PHProjectChangeRequest *)self projectExtensionIdentifier];
  id v11 = [v6 insertIntoPhotoLibrary:v7 withUUID:v8 documentType:v9 projectExtensionIdentifier:v10];

  if (a4 && !v11)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v13 = [NSString stringWithFormat:@"Failed to create project"];
    v17[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSString)managedEntityName
{
  return (NSString *)[MEMORY[0x1E4F8AAF0] entityName];
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  v5 = [(PHChangeRequestHelper *)self->super._helper mutations];
  v6 = [v5 objectForKeyedSubscript:@"projectData"];

  if ((unint64_t)[v6 length] > 0x500000)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"projectExtensionData length exceeds maximum");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v7 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PHProjectChangeRequest;
    id v11 = 0;
    BOOL v7 = [(PHChangeRequest *)&v10 prepareForServicePreflightCheck:&v11];
    id v8 = v11;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v7) {
    *a3 = v8;
  }
LABEL_7:

  return v7;
}

- (PHProjectChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PHProjectChangeRequest;
  id v11 = [(PHChangeRequest *)&v31 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __70__PHProjectChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
      v28 = &unk_1E5848DF0;
      v14 = v11;
      v29 = v14;
      id v30 = v9;
      v15 = (void (**)(void))_Block_copy(&v25);
      uint64_t v16 = [PHRelationshipChangeRequestHelper alloc];
      uint64_t v17 = [(PHRelationshipChangeRequestHelper *)v16 initWithRelationshipName:@"assets", v8, v11->super._helper, v25, v26, v27, v28 xpcDict changeRequestHelper];
      assetsHelper = v14->_assetsHelper;
      v14->_assetsHelper = (PHRelationshipChangeRequestHelper *)v17;

      char v19 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customKeyAsset" xpcDict:v8 changeRequestHelper:v11->super._helper];
      keyAssetHelper = v14->_keyAssetHelper;
      v14->_keyAssetHelper = v19;

      BOOL v21 = xpc_dictionary_get_BOOL(v8, "didSetPreviewImage");
      v14->_didSetPreviewImage = v21;
      if (v21)
      {
        v15[2](v15);
        uint64_t v22 = PLDataFromXPCDictionary();
        previewImageData = v14->_previewImageData;
        v14->_previewImageData = (NSData *)v22;
      }
    }
  }

  return v11;
}

uint64_t __70__PHProjectChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setMutated:1];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 recordUpdateRequest:v3];
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict = a3;
  [(PHChangeRequestHelper *)self->super._helper encodeToXPCDict:xdict];
  [(PHRelationshipChangeRequestHelper *)self->_assetsHelper encodeToXPCDict:xdict];
  [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper encodeToXPCDict:xdict];
  xpc_dictionary_set_BOOL(xdict, "didSetPreviewImage", self->_didSetPreviewImage);
  if (self->_didSetPreviewImage) {
    PLXPCDictionarySetData();
  }
}

- (void)moveAssetsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  id v10 = a3;
  if ([v10 count])
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
    v6 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];
    BOOL v7 = [v6 objectsAtIndexes:v10];
    [v6 removeObjectsAtIndexes:v10];
    uint64_t v8 = [v10 count];
    id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a4, v8);
    [v6 insertObjects:v7 atIndexes:v9];
  }
}

- (void)replaceAssetsAtIndexes:(id)a3 withAssets:(id)a4
{
  id v8 = a3;
  v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a4];
  if (v6)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
    BOOL v7 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];
    [v7 replaceObjectsAtIndexes:v8 withObjects:v6];
  }
}

- (void)removeAssetsAtIndexes:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
    v4 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];
    [v4 removeObjectsAtIndexes:v5];
  }
}

- (void)removeAssets:(id)assets
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:assets];
  if (v5)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
    v4 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)insertAssets:(id)a3 atIndexes:(id)a4
{
  id v8 = a4;
  v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v6)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
    BOOL v7 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];
    [v7 insertObjects:v6 atIndexes:v8];
  }
}

- (void)addAssets:(id)a3
{
  id v5 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v5)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
    v4 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];
    [v4 addObjectsFromArray:v5];
  }
}

- (void)_prepareAssetIDsIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper originalObjectIDs];
  if (!v3)
  {
    originalProject = self->_originalProject;
    if (!originalProject) {
      goto LABEL_7;
    }
    uint64_t v3 = +[PHQuery queryForAssetsInAssetCollection:originalProject options:0];
    id v5 = [v3 executeQuery];
    assetsHelper = self->_assetsHelper;
    BOOL v7 = [v5 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)assetsHelper setOriginalObjectIDs:v7];

    id v8 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper originalObjectIDs];

    if (!v8)
    {
      id v9 = self->_assetsHelper;
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(PHRelationshipChangeRequestHelper *)v9 setOriginalObjectIDs:v10];
    }
  }

LABEL_7:
  id v11 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];

  if (!v11)
  {
    id v12 = self->_assetsHelper;
    id v14 = [(PHRelationshipChangeRequestHelper *)v12 originalObjectIDs];
    v13 = (void *)[v14 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)v12 setMutableObjectIDsAndUUIDs:v13];
  }
}

- (void)setKeyAsset:(PHAsset *)keyAsset
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = keyAsset;
  id v5 = PLObjectIDOrUUIDFromPHObject(v4);
  if (v5)
  {
    if (self->_originalProject
      || ([(PHChangeRequest *)self helper],
          v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 isNewRequest],
          v6,
          v7))
    {
      [(PHChangeRequest *)self didMutate];
      [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
      id v8 = [(PHProjectChangeRequest *)self assetsHelper];
      id v9 = [v8 mutableObjectIDsAndUUIDs];

      if (([v9 containsObject:v4] & 1) == 0)
      {
        v13[0] = v4;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        [(PHProjectChangeRequest *)self addAssets:v10];
      }
      [(PHProjectChangeRequest *)self _prepareKeyAssetIDIfNeeded];
      id v11 = [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper mutableObjectIDsAndUUIDs];
      [v11 removeAllObjects];

      id v12 = [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper mutableObjectIDsAndUUIDs];
      [v12 addObject:v5];
    }
  }
}

- (void)_prepareKeyAssetIDIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  v4 = [(PHRelationshipChangeRequestHelper *)self->_keyAssetHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    keyAssetHelper = self->_keyAssetHelper;
    id v7 = [(PHRelationshipChangeRequestHelper *)keyAssetHelper originalObjectIDs];
    v6 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)keyAssetHelper setMutableObjectIDsAndUUIDs:v6];
  }
}

- (id)placeholderForCreatedProject
{
  helper = self->super._helper;
  uint64_t v4 = objc_opt_class();

  return [(PHChangeRequestHelper *)helper placeholderForCreatedObjectWithClass:v4 changeRequest:self];
}

- (void)setProjectPreviewImage:(UIImage *)previewImage
{
  id v8 = previewImage;
  [(PHChangeRequest *)self didMutate];
  self->_didSetPreviewImage = 1;
  uint64_t v4 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v5 = [(id)*MEMORY[0x1E4F444E0] identifier];
  v6 = CGImageDestinationCreateWithData(v4, v5, 1uLL, 0);

  if (v6)
  {
    CGImageDestinationAddImage(v6, [(UIImage *)v8 CGImage], 0);
    CGImageDestinationFinalize(v6);
    CFRelease(v6);
  }
  previewImageData = self->_previewImageData;
  self->_previewImageData = (NSData *)v4;
}

- (void)_setOriginalProject:(id)a3
{
}

- (void)setAssets:(id)a3
{
  id v6 = +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:a3];
  if (v6)
  {
    [(PHChangeRequestHelper *)self->super._helper didMutate];
    [(PHProjectChangeRequest *)self _prepareAssetIDsIfNeeded];
    assetsHelper = self->_assetsHelper;
    id v5 = (void *)[v6 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)assetsHelper setMutableObjectIDsAndUUIDs:v5];
  }
}

- (void)setProjectRenderUuid:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"projectRenderUuid"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"projectRenderUuid"];
  }
  else
  {
    [v6 removeObjectForKey:@"projectRenderUuid"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"projectRenderUuid"];
  }
}

- (id)projectRenderUuid
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"projectRenderUuid"];

  return v5;
}

- (void)setProjectExtensionData:(NSData *)projectExtensionData
{
  id v10 = projectExtensionData;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"projectData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"projectData"];
  }
  else
  {
    [v6 removeObjectForKey:@"projectData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"projectData"];
  }
}

- (NSData)projectExtensionData
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"projectData"];

  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1C9B8] data];
  }

  return (NSData *)v5;
}

- (void)setProjectExtensionIdentifier:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"projectExtensionIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"projectExtensionIdentifier"];
  }
  else
  {
    [v6 removeObjectForKey:@"projectExtensionIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"projectExtensionIdentifier"];
  }
}

- (id)projectExtensionIdentifier
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"projectExtensionIdentifier"];

  return v5;
}

- (void)setProjectDocumentType:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"projectDocumentType"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"projectDocumentType"];
  }
  else
  {
    [v6 removeObjectForKey:@"projectDocumentType"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"projectDocumentType"];
  }
}

- (NSString)projectDocumentType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"projectDocumentType"];

  return (NSString *)v5;
}

- (void)setTitle:(NSString *)title
{
  id v10 = title;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (id)initForNewObject
{
  v10.receiver = self;
  v10.super_class = (Class)PHProjectChangeRequest;
  v2 = [(PHChangeRequest *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"assets" changeRequestHelper:v2->super._helper];
    assetsHelper = v2->_assetsHelper;
    v2->_assetsHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customKeyAsset" changeRequestHelper:v2->super._helper];
    keyAssetHelper = v2->_keyAssetHelper;
    v2->_keyAssetHelper = v7;
  }
  return v2;
}

- (PHProjectChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHProjectChangeRequest;
  id v8 = [(PHChangeRequest *)&v16 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    id v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"assets" changeRequestHelper:v8->super._helper];
    assetsHelper = v8->_assetsHelper;
    v8->_assetsHelper = v11;

    v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customKeyAsset" changeRequestHelper:v8->super._helper];
    keyAssetHelper = v8->_keyAssetHelper;
    v8->_keyAssetHelper = v13;
  }
  return v8;
}

- (PHProjectChangeRequest)initWithProject:(PHProject *)project
{
  uint64_t v4 = project;
  id v5 = [PHProjectChangeRequest alloc];
  id v6 = [(PHObject *)v4 uuid];
  id v7 = [(PHObject *)v4 objectID];
  id v8 = [(PHProjectChangeRequest *)v5 initWithUUID:v6 objectID:v7];

  [(PHProjectChangeRequest *)v8 _setOriginalProject:v4];
  return v8;
}

+ (void)expungeProjects:(id)a3
{
}

+ (void)undeleteProjects:(id)a3
{
}

+ (void)deleteProjects:(id)a3
{
}

+ (void)_deleteProjects:(id)a3 withOperation:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  +[PHObject assertAllObjects:v6 forSelector:a2 areOfType:objc_opt_class()];
  +[PHPhotoLibrary assertTransaction];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHCollectionDeleteRequest, "deleteRequestForObject:operation:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), a4, (void)v13);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

+ (id)creationRequestForProjectCopyFromProject:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 assetCollectionType] == 10)
  {
    uint64_t v4 = [v3 photoLibrary];
    id v5 = [v4 librarySpecificFetchOptions];

    id v6 = +[PHAsset fetchAssetsInAssetCollection:v3 options:v5];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__18929;
    v39 = __Block_byref_object_dispose__18930;
    id v40 = 0;
    uint64_t v30 = 0;
    objc_super v31 = &v30;
    uint64_t v32 = 0x3032000000;
    id v33 = __Block_byref_object_copy__18929;
    uint64_t v34 = __Block_byref_object_dispose__18930;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__18929;
    v28 = __Block_byref_object_dispose__18930;
    id v29 = 0;
    id v7 = [v3 photoLibrary];
    uint64_t v8 = [v7 photoLibrary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__PHProjectChangeRequest_creationRequestForProjectCopyFromProject___block_invoke;
    v19[3] = &unk_1E5847C80;
    id v9 = v3;
    id v20 = v9;
    p_long long buf = &buf;
    uint64_t v22 = &v30;
    int v23 = &v24;
    [v8 performBlockAndWait:v19];

    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v11 = v31[5];
    id v12 = [v9 title];
    long long v13 = +[PHProjectChangeRequest creationRequestForProjectWithDocumentType:v10 projectExtensionIdentifier:v11 assets:v6 title:v12];

    [v13 setProjectData:v25[5]];
    long long v14 = [MEMORY[0x1E4F8BA08] UUIDString];
    id v18 = 0;
    long long v15 = [0 duplicateProjectPreviewImageData:v14 error:&v18];
    id v16 = v18;

    if (v15) {
      [v13 setProjectRenderUuid:v14];
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "Asset collection type is not a project: %@", (uint8_t *)&buf, 0xCu);
    }
    long long v13 = 0;
  }

  return v13;
}

void __67__PHProjectChangeRequest_creationRequestForProjectCopyFromProject___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A848];
  id v3 = [*(id *)(a1 + 32) objectID];
  uint64_t v4 = [*(id *)(a1 + 32) photoLibrary];
  id v5 = [v4 photoLibrary];
  id v15 = [v2 albumWithObjectID:v3 inLibrary:v5];

  uint64_t v6 = [v15 projectDocumentType];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v15 projectExtensionIdentifier];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = [v15 projectData];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

+ (id)creationRequestForProjectWithDocumentType:(id)a3 projectExtensionIdentifier:(id)a4 assets:(id)a5 title:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[PHProjectChangeRequest alloc] initForNewObject];
  [v13 setProjectDocumentType:v12];

  [v13 setProjectExtensionIdentifier:v11];
  [v13 setAssets:v10];

  [v13 setTitle:v9];

  return v13;
}

+ (id)creationRequestForProjectWithDocumentType:(id)a3 projectExtensionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PHProjectChangeRequest alloc] initForNewObject];
  [v7 setProjectDocumentType:v6];

  [v7 setProjectExtensionIdentifier:v5];

  return v7;
}

@end