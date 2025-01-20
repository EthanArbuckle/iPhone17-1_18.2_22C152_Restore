@interface PHSmartAlbumChangeRequest
+ (id)_changeRequestForSmartAlbum:(id)a3 userQuery:(id)a4;
+ (id)changeRequestForSmartAlbum:(id)a3;
+ (id)creationRequestForSmartAlbumCopyFromSmartAlbum:(id)a3;
+ (id)creationRequestForSmartAlbumWithTitle:(id)a3 userQuery:(id)a4;
+ (id)validateSmartAlbumTitle:(id)a3 error:(id *)a4;
+ (void)_deleteSmartAlbums:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5;
+ (void)deleteSmartAlbumsFromAssetCollection:(id)a3;
+ (void)expungeSmartAlbumsFromAssetCollection:(id)a3;
+ (void)undeleteSmartAlbumsFromAssetCollection:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)customSortAscending;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSString)title;
- (PHObjectPlaceholder)placeholderForCreatedSmartAlbum;
- (PHSmartAlbumChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHSmartAlbumChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PLQuery)userQuery;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)description;
- (id)initForNewObject;
- (id)managedEntityName;
- (unsigned)customSortKey;
- (void)encodeToXPCDict:(id)a3;
- (void)setCustomSortAscending:(BOOL)a3;
- (void)setCustomSortKey:(unsigned int)a3;
- (void)setTitle:(id)a3;
- (void)setUserQuery:(id)a3;
@end

@implementation PHSmartAlbumChangeRequest

- (void).cxx_destruct
{
}

- (void)setUserQuery:(id)a3
{
}

- (PLQuery)userQuery
{
  return self->_userQuery;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHSmartAlbumChangeRequest;
  v3 = [(PHSmartAlbumChangeRequest *)&v8 description];
  v4 = [(PHSmartAlbumChangeRequest *)self title];
  v5 = [(PHSmartAlbumChangeRequest *)self userQuery];
  v6 = [v3 stringByAppendingFormat:@" title=%@ userQuery=%@", v4, v5];

  return v6;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_super v8 = [v7 managedObjectContext];
  v9 = PLSafeEntityForNameInManagedObjectContext();

  if (!v9)
  {
    id v14 = 0;
    goto LABEL_12;
  }
  v10 = [v7 entity];
  int v11 = [v10 isKindOfEntity:v9];

  if (!v11 || [v7 kindValue] != 1507)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v21 = [NSString stringWithFormat:@"Invalid album type"];
    v26[0] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v22);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    if (a5)
    {
      id v14 = v14;
      BOOL v19 = 0;
      *a5 = v14;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v19 = 0;
    goto LABEL_13;
  }
  v12 = [(PHChangeRequest *)self helper];
  id v24 = 0;
  int v13 = [v12 applyMutationsToManagedObject:v7 error:&v24];
  id v14 = v24;

  if (!v13) {
    goto LABEL_9;
  }
  userQuery = self->_userQuery;
  if (userQuery)
  {
    v16 = (void *)MEMORY[0x1E4F8AB08];
    id v17 = v7;
    v18 = [v16 dataFromQuery:userQuery];
    [v17 setUserQueryData:v18];
  }
  BOOL v19 = 1;
LABEL_13:

  return v19;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHChangeRequest *)self helper];
  id v22 = 0;
  int v11 = [v10 allowMutationToManagedObject:v8 propertyKey:v9 error:&v22];
  id v12 = v22;

  if (v11)
  {
    if (([v9 isEqualToString:@"title"] & 1) != 0
      || ([v9 isEqualToString:@"customSortKey"] & 1) != 0
      || [v9 isEqualToString:@"customSortAscending"])
    {
      if ([v8 canPerformEditOperation:64])
      {
        BOOL v13 = 1;
        goto LABEL_13;
      }
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@"Invalid operation on property %@", v9];
      v26[0] = v15;
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      id v17 = (void **)v26;
      v18 = &v25;
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@"Invalid property %@", v9];
      id v24 = v15;
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      id v17 = &v24;
      v18 = &v23;
    }
    BOOL v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
    uint64_t v20 = objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v19);

    id v12 = (id)v20;
  }
  if (a5)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_13:

  return v13;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v6 = [MEMORY[0x1E4F8A848] insertNewSmartAlbumIntoLibrary:a3];
  id v7 = [(PHChangeRequest *)self uuid];
  [v6 setUuid:v7];

  if (a4 && !v6)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v9 = [NSString stringWithFormat:@"Failed to create asset collection"];
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_userQuery)
  {
    id v7 = [(PHSmartAlbumChangeRequest *)self title];
    id v12 = 0;
    id v8 = [(id)objc_opt_class() validateSmartAlbumTitle:v7 error:&v12];
    id v9 = v12;

    BOOL v10 = v8 != 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Smart Album doesn't allow nil query");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v10) {
    *a4 = v9;
  }
LABEL_7:

  return v10;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
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
  v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (PHObjectPlaceholder)placeholderForCreatedSmartAlbum
{
  v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (id)managedEntityName
{
  return @"FetchingAlbum";
}

- (void)encodeToXPCDict:(id)a3
{
  xpc_object_t xdict = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 encodeToXPCDict:xdict];

  if (self->_userQuery)
  {
    objc_msgSend(MEMORY[0x1E4F8AB08], "dataFromQuery:");
    id v5 = objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(xdict, "userQuery", (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  }
}

- (PHSmartAlbumChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PHSmartAlbumChangeRequest;
  int v11 = [(PHChangeRequest *)&v20 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      size_t length = 0;
      data = xpc_dictionary_get_data(v8, "userQuery", &length);
      if (length)
      {
        v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
        uint64_t v16 = [MEMORY[0x1E4F8AB08] constructQueryFromData:v15];
        userQuery = v11->_userQuery;
        v11->_userQuery = (PLQuery *)v16;
      }
    }
  }

  return v11;
}

- (PHSmartAlbumChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHSmartAlbumChangeRequest;
  id v8 = [(PHChangeRequest *)&v12 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;
  }
  return v8;
}

- (id)initForNewObject
{
  v6.receiver = self;
  v6.super_class = (Class)PHSmartAlbumChangeRequest;
  v2 = [(PHChangeRequest *)&v6 init];
  if (v2)
  {
    v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;
  }
  return v2;
}

- (void)setCustomSortAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  objc_super v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"customSortAscending"];
}

- (BOOL)customSortAscending
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"customSortAscending"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setCustomSortKey:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedInt:v3];
  objc_super v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"customSortKey"];
}

- (unsigned)customSortKey
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"customSortKey"];

  LODWORD(v3) = [v5 intValue];
  return v3;
}

+ (void)_deleteSmartAlbums:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  +[PHObject assertAllObjects:v7 forSelector:a5 areOfType:objc_opt_class()];
  +[PHPhotoLibrary assertTransaction];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHCollectionDeleteRequest, "deleteRequestForObject:operation:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), a4, (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

+ (void)undeleteSmartAlbumsFromAssetCollection:(id)a3
{
}

+ (void)expungeSmartAlbumsFromAssetCollection:(id)a3
{
}

+ (void)deleteSmartAlbumsFromAssetCollection:(id)a3
{
}

+ (id)validateSmartAlbumTitle:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28B88];
  id v6 = a3;
  id v7 = [v5 whitespaceAndNewlineCharacterSet];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if ([v8 length])
  {
    uint64_t v9 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Empty title unsupported");
    id v8 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a4 = v9;
  }
LABEL_7:

  return v8;
}

+ (id)creationRequestForSmartAlbumCopyFromSmartAlbum:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 assetCollectionType] == 2)
  {
    v4 = [v3 title];
    id v5 = [v3 userQuery];
    id v6 = +[PHSmartAlbumChangeRequest creationRequestForSmartAlbumWithTitle:v4 userQuery:v5];
  }
  else
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Asset collection type is not a smart album: %@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)creationRequestForSmartAlbumWithTitle:(id)a3 userQuery:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PHSmartAlbumChangeRequest alloc] initForNewObject];
  [v7 setTitle:v6];

  [v7 setUserQuery:v5];

  return v7;
}

+ (id)changeRequestForSmartAlbum:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userQuery];
  id v6 = [a1 _changeRequestForSmartAlbum:v4 userQuery:v5];

  return v6;
}

+ (id)_changeRequestForSmartAlbum:(id)a3 userQuery:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isTransient])
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [PHSmartAlbumChangeRequest alloc];
    int v9 = [v5 uuid];
    id v10 = [v5 objectID];
    id v7 = [(PHSmartAlbumChangeRequest *)v8 initWithUUID:v9 objectID:v10];

    if (v6) {
      [(PHSmartAlbumChangeRequest *)v7 setUserQuery:v6];
    }
  }

  return v7;
}

@end