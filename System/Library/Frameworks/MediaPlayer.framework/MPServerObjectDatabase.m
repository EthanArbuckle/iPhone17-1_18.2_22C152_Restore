@interface MPServerObjectDatabase
+ (BOOL)prefersInMemoryDatabase;
+ (MPServerObjectDatabase)sharedServerObjectDatabase;
+ (void)_clearOldDatabasePaths;
+ (void)setPrefersInMemoryDatabase:(BOOL)a3;
+ (void)setXPCHostApplicationIdentifier:(id)a3;
- (BOOL)_createDatabaseSchema;
- (BOOL)importAssetsFromRequest:(id)a3 error:(id *)a4;
- (id)_assetsMatchingIdentifierSet:(id)a3 query:(id)a4;
- (id)_hlsAssetMatchingIdentifierSet:(id)a3 query:(id)a4;
- (id)_initWithDatabaseCreationBlock:(id)a3;
- (id)_modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4 error:(id *)a5;
- (id)_payloadForIdentifierSet:(id)a3 outError:(id *)a4;
- (id)_relatedIdentifierSetsForParentIdentifierSet:(id)a3 parentVersionHash:(id)a4 childKey:(id)a5;
- (id)assetsMatchingIdentifierSet:(id)a3;
- (id)assetsWithMiniSINFsMatchingIdentifierSet:(id)a3;
- (id)hlsAssetMatchingIdentifierSet:(id)a3;
- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5;
- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)importObjectsFromRequest:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4;
- (id)payloadDataForIdentifierSet:(id)a3 outError:(id *)a4;
- (id)payloadForRelatedEntityWithIdentifierSet:(id)a3;
- (id)relatedIdentifierSetsForParentIdentifierSet:(id)a3 childKey:(id)a4;
- (void)enumerateAssetsMissingSINFsForHashedPersonID:(id)a3 usingBlock:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MPServerObjectDatabase

void __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke(uint64_t a1)
{
  if ([(id)objc_opt_class() prefersInMemoryDatabase])
  {
    v2 = &__block_literal_global_35437;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke_3;
    v5[3] = &__block_descriptor_40_e21___MSVSQLDatabase_8__0l;
    v5[4] = *(void *)(a1 + 32);
    v2 = (void *)MEMORY[0x19971E0F0](v5);
  }
  id v3 = [[MPServerObjectDatabase alloc] _initWithDatabaseCreationBlock:v2];
  v4 = (void *)sharedServerObjectDatabase___sharedServerObjectDatabase;
  sharedServerObjectDatabase___sharedServerObjectDatabase = (uint64_t)v3;
}

- (id)_initWithDatabaseCreationBlock:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPServerObjectDatabase;
  id v6 = [(MPServerObjectDatabase *)&v18 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlayer.MPServerObjectDatabase/accessQueue", v7);
    v9 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v11 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v10;

    *((void *)v6 + 4) = 0;
    v12 = *((void *)v6 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MPServerObjectDatabase__initWithDatabaseCreationBlock___block_invoke;
    block[3] = &unk_1E57F53B8;
    id v15 = v6;
    id v16 = v5;
    SEL v17 = a2;
    dispatch_async(v12, block);
  }
  return v6;
}

+ (BOOL)prefersInMemoryDatabase
{
  return _MPServerObjectDatabasePrefersInMemoryDatabase;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(NSHashTable *)self->_observers addObject:v4];

  os_unfair_recursive_lock_unlock();
}

void __57__MPServerObjectDatabase__initWithDatabaseCreationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  if (([*(id *)(a1 + 32) _createDatabaseSchema] & 1) == 0)
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_FAULT, "SOD: Unable to create database schema. Attempting fallback to in-memory database.", v12, 2u);
    }

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F779F0]) initWithMemory];
    uint64_t v7 = *(void *)(a1 + 32);
    dispatch_queue_t v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;

    v9 = *(void **)(a1 + 32);
    if (!v9[2])
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MPServerObjectDatabase.m" lineNumber:545 description:@"SOD: Unable to create server objects database in-memory"];

      v9 = *(void **)(a1 + 32);
    }
    if (([v9 _createDatabaseSchema] & 1) == 0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MPServerObjectDatabase.m" lineNumber:546 description:@"SOD: Unable to create database schema on disk or in-memory."];
    }
  }
}

- (BOOL)_createDatabaseSchema
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  id v16 = 0;
  uint64_t v3 = [(MSVSQLDatabase *)database transactionWithName:@"schema" error:&v16];
  id v4 = v16;
  if (!v4)
  {
    id v15 = 0;
    [v3 executeStatementString:@"CREATE TABLE IF NOT EXISTS objects (identifier TEXT NOT NULL, person_id TEXT NOT NULL, source INTEGER NOT NULL DEFAULT 0, expiration_date INTEGER NOT NULL DEFAULT 0, type TEXT NOT NULL, payload TEXT, PRIMARY KEY (identifier, person_id)) WITHOUT ROWID", &v15 error];
    id v5 = v15;
    if (v5)
    {
      uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        objc_super v18 = v5;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create objects table [] error=%{public}@", buf, 0xCu);
      }
      char v6 = 0;
      goto LABEL_18;
    }
    id v14 = 0;
    [v3 executeStatementString:@"CREATE TABLE IF NOT EXISTS assets (identifier TEXT NOT NULL, hashed_person_id TEXT NOT NULL, flavor TEXT NOT NULL, url TEXT NOT NULL, url_expiration_date INTEGER NOT NULL DEFAULT 0, mini_sinf BLOB, sinfs BLOB, PRIMARY KEY (identifier, hashed_person_id, flavor)) WITHOUT ROWID", &v14 error];
    uint64_t v7 = v14;
    id v13 = 0;
    [v3 executeStatementString:@"CREATE TABLE IF NOT EXISTS hls_assets (identifier TEXT NOT NULL, hashed_person_id TEXT NOT NULL, url_expiration_date INTEGER NOT NULL DEFAULT 0, playlist_url TEXT NOT NULL, key_certificate_url TEXT, key_server_url TEXT, key_server_adam_id INTEGER NOT NULL DEFAULT 0, key_server_protocol_type TEXT NOT NULL, is_itunes_store_stream INTEGER NOT NULL, PRIMARY KEY (identifier, hashed_person_id)) WITHOUT ROWID", &v13 error];
    dispatch_queue_t v8 = v13;
    if (v8)
    {
      v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        objc_super v18 = v8;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create hls assets table [] error=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v12 = 0;
      [v3 executeStatementString:@"CREATE TABLE IF NOT EXISTS object_relationships (parent_identifier TEXT NOT NULL, child_identifier TEXT NOT_NULL, person_id TEXT NOT NULL, suborder INTEGER NOT NULL DEFAULT 0, child_key TEXT NOT NULL, parent_version_hash TEXT, PRIMARY KEY (parent_identifier, person_id, suborder, child_key)) WITHOUT ROWID", &v12 error];
      v9 = v12;
      if (!v9)
      {
        char v6 = [v3 commit];
        goto LABEL_17;
      }
      uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        objc_super v18 = v9;
        _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create object relationships table [] error=%{public}@", buf, 0xCu);
      }
    }
    char v6 = 0;
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  id v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v18 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create transaction [] error=%{public}@", buf, 0xCu);
  }
  char v6 = 0;
LABEL_19:

  return v6;
}

+ (void)_clearOldDatabasePaths
{
  id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v2 = [v20 URLsForDirectory:13 inDomains:1];
  uint64_t v3 = [v2 lastObject];

  id v4 = NSString;
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  char v6 = [v5 bundleIdentifier];
  uint64_t v7 = [v4 stringWithFormat:@"com.apple.MediaPlayer/ServerObjectDatabases/%@-ServerObjectDatabase.sqlpkg", v6];
  dispatch_queue_t v8 = [v3 URLByAppendingPathComponent:v7 isDirectory:1];

  [v20 removeItemAtURL:v8 error:0];
  v9 = [v20 URLsForDirectory:9 inDomains:1];
  uint64_t v10 = [v9 lastObject];

  v11 = [v10 URLByAppendingPathComponent:@"ServerObjectDatabase.sqlpkg" isDirectory:1];

  [v20 removeItemAtURL:v11 error:0];
  id v12 = [v11 URLByDeletingPathExtension];

  [v20 removeItemAtURL:v12 error:0];
  if (_XPCHostApplicationIdentifier)
  {
    id v13 = [v20 URLsForDirectory:14 inDomains:1];
    id v14 = [v13 lastObject];

    id v15 = NSString;
    id v16 = [MEMORY[0x1E4F28B50] mainBundle];
    SEL v17 = [v16 bundleIdentifier];
    objc_super v18 = [v15 stringWithFormat:@"com.apple.MediaPlayer/ServerObjectDatabases/%@-ServerObjectDatabase.sqlpkg", v17];
    uint64_t v19 = [v14 URLByAppendingPathComponent:v18 isDirectory:1];

    [v20 removeItemAtURL:v19 error:0];
    id v12 = (void *)v19;
  }
}

id __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 URLsForDirectory:14 inDomains:1];
  id v4 = [v3 lastObject];

  if (_XPCHostApplicationIdentifier)
  {
    id v5 = (id)_XPCHostApplicationIdentifier;
  }
  else
  {
    char v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v6 bundleIdentifier];
  }
  uint64_t v7 = [NSString stringWithFormat:@"com.apple.MediaPlayer/ServerObjectDatabases/%@-ServerObjectDatabase.sqlpkg", v5];
  dispatch_queue_t v8 = [v4 URLByAppendingPathComponent:v7 isDirectory:1];

  [v2 removeItemAtURL:v8 error:0];
  [*(id *)(a1 + 32) _clearOldDatabasePaths];
  v9 = [v8 path];
  [v2 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v10 = [v8 URLByAppendingPathComponent:@"Database" isDirectory:0];
  v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 path];
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "SOD: databasePath: %{public}@", buf, 0xCu);
  }
  id v19 = 0;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F779F0]) initWithURL:v10 error:&v19];
  id v14 = v19;
  id v15 = v14;
  if (!v13 || v14)
  {
    id v16 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      SEL v17 = [v10 path];
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_FAULT, "SOD: Unable to create server objects database at path=%{public}@ error=%{public}@", buf, 0x16u);
    }
  }

  return v13;
}

+ (MPServerObjectDatabase)sharedServerObjectDatabase
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedServerObjectDatabase_onceToken != -1) {
    dispatch_once(&sharedServerObjectDatabase_onceToken, block);
  }
  uint64_t v2 = (void *)sharedServerObjectDatabase___sharedServerObjectDatabase;

  return (MPServerObjectDatabase *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4 error:(id *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v67 = 0;
  v11 = [(MPServerObjectDatabase *)self _payloadForIdentifierSet:v9 outError:&v67];
  id v12 = v67;
  id v13 = v12;
  if (v11 && !v12)
  {
    id v14 = [v11 objectForKeyedSubscript:@"source"];
    uint64_t v15 = [v14 integerValue];

    v64 = [v11 objectForKeyedSubscript:@"PersonID"];
    id v16 = [v11 objectForKeyedSubscript:@"PayloadData"];
    id v66 = 0;
    v65 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v16 options:0 error:&v66];
    id v17 = v66;
    if (v17)
    {
      objc_super v18 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v75 = v17;
        _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_FAULT, "SOD: modelObjectMatchingIdentifierSet jsonError: %{public}@", buf, 0xCu);
      }

      id v19 = 0;
      if (a5) {
        *a5 = v17;
      }
LABEL_48:

      goto LABEL_49;
    }
    if (v15 && !v65)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      [v63 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:805 description:@"Cannot have a source without a payload."];
    }
    id v20 = (void *)MEMORY[0x19971DE60]();
    if (v15 == 2)
    {
      v57 = v16;
      context = v20;
      v60 = +[MPServerObjectDatabaseStorePlatformImportRequest _entityTypeForObject:v65];
      uint64_t v31 = [v60 genericObjectRelationshipKey];
      v32 = [v10 relationships];
      v33 = [v32 objectForKeyedSubscript:v31];

      v58 = (void *)v31;
      if (v33)
      {
        id v19 = [[MPStoreItemMetadata alloc] initWithStorePlatformDictionary:v65];
        if (!v19)
        {
          v29 = 0;
          v30 = v60;
          id v16 = v57;

LABEL_44:
          id v20 = context;
          goto LABEL_45;
        }
        v34 = [(MPStoreModelObjectBuilder *)[MPStoreModelGenericObjectBuilder alloc] initWithRequestedPropertySet:v10];
        [(MPStoreModelGenericObjectBuilder *)v34 setPreventStoreItemMetadataCaching:1];
        uint64_t v35 = [v64 longLongValue];
        id v16 = v57;
        v56 = v34;
        if (v35)
        {
          uint64_t v36 = [NSNumber numberWithLongLong:v35];
        }
        else
        {
          uint64_t v36 = 0;
        }
        v54 = (void *)v36;
        v48 = [MEMORY[0x1E4FB87B8] specificAccountWithDSID:v36];
        v62 = (MPMediaKitEntityTranslatorContext *)v19;
        id v19 = [(MPStoreModelObjectBuilder *)v56 modelObjectWithStoreItemMetadata:v19 userIdentity:v48];

        if (!v35)
        {
          v49 = [(MPStoreItemMetadata *)v19 identifiers];
          v50 = (void *)[v49 copyWithSource:@"ServerObjectDatabase" block:&__block_literal_global_144_35069];
          uint64_t v52 = [(MPStoreItemMetadata *)v19 copyWithIdentifiers:v50];

          id v19 = (MPStoreItemMetadata *)v52;
        }

        v29 = 0;
        v30 = v60;
        v28 = v56;
LABEL_43:

        goto LABEL_44;
      }
      v37 = (void *)MEMORY[0x1E4F28C58];
      v68[0] = @"MissingPropertySetMappingEntityType";
      v30 = v60;
      uint64_t v44 = [v60 serverEntityType];
      v45 = @"<null>";
      v62 = (MPMediaKitEntityTranslatorContext *)v44;
      if (v44) {
        v46 = (__CFString *)v44;
      }
      else {
        v46 = @"<null>";
      }
      v68[1] = @"MissingPropertySetMappingRelationshipKey";
      v69[0] = v46;
      if (v31) {
        v45 = (__CFString *)v31;
      }
      v69[1] = v45;
      v41 = (void *)MEMORY[0x1E4F1C9E8];
      v42 = v69;
      v43 = v68;
    }
    else
    {
      if (v15 != 1)
      {
        v29 = 0;
        id v19 = 0;
LABEL_45:
        if (a5) {
          *a5 = v29;
        }

        goto LABEL_48;
      }
      v57 = v16;
      context = v20;
      v59 = +[MPServerObjectDatabaseMediaKitImportRequest _entityTypeForObject:v65];
      uint64_t v21 = [v59 genericObjectRelationshipKey];
      __int16 v22 = [v10 relationships];
      v23 = [v22 objectForKeyedSubscript:v21];

      v58 = (void *)v21;
      if (v23)
      {
        v62 = objc_alloc_init(MPMediaKitEntityTranslatorContext);
        [(MPMediaKitEntityTranslatorContext *)v62 setPersonID:v64];
        [(MPMediaKitEntityTranslatorContext *)v62 setRelationshipPayloadProvider:self];
        v55 = +[MPBaseEntityTranslator translatorForMPModelClass:objc_opt_class()];
        uint64_t v24 = [MPPropertySet alloc];
        uint64_t v70 = v21;
        v53 = [v10 relationships];
        v25 = [v53 objectForKeyedSubscript:v21];
        v71 = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        v27 = [(MPPropertySet *)v24 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:v26];

        id v19 = [v55 objectForPropertySet:v27 payload:v65 context:v62];

        v28 = v55;
        v29 = 0;
        v30 = v59;
LABEL_37:
        id v16 = v57;
        goto LABEL_43;
      }
      v37 = (void *)MEMORY[0x1E4F28C58];
      v72[0] = @"MissingPropertySetMappingEntityType";
      v30 = v59;
      uint64_t v38 = [v59 serverEntityType];
      v39 = @"<null>";
      v62 = (MPMediaKitEntityTranslatorContext *)v38;
      if (v38) {
        v40 = (__CFString *)v38;
      }
      else {
        v40 = @"<null>";
      }
      v72[1] = @"MissingPropertySetMappingRelationshipKey";
      if (v21) {
        v39 = (__CFString *)v21;
      }
      v73[0] = v40;
      v73[1] = v39;
      v41 = (void *)MEMORY[0x1E4F1C9E8];
      v42 = v73;
      v43 = v72;
    }
    uint64_t v47 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:2];
    v29 = objc_msgSend(v37, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MPObjectDatabaseError", 1, v47, @"Matching object is not supported");
    v28 = (void *)v47;
    id v19 = 0;
    goto LABEL_37;
  }
  id v19 = 0;
  if (a5) {
    *a5 = v12;
  }
LABEL_49:

  return v19;
}

uint64_t __78__MPServerObjectDatabase__modelObjectMatchingIdentifierSet_propertySet_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPersonalStoreIdentifiersWithPersonID:*MEMORY[0x1E4FB8580] block:&__block_literal_global_147];
}

- (id)_payloadForIdentifierSet:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__35081;
  v40 = __Block_byref_object_dispose__35082;
  id v41 = 0;
  uint64_t v7 = [v6 personalizedStore];
  dispatch_queue_t v8 = [v7 personID];

  if (![v8 length])
  {
    id v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_INFO, "SOD: modelObjectMatchingIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    id v10 = (id)*MEMORY[0x1E4FB8580];
    dispatch_queue_t v8 = v10;
  }
  v11 = [v6 prioritizedStoreStringIdentifiersForPersonID:v8];
  if ([v11 count])
  {
    *(void *)buf = 0;
    uint64_t v31 = buf;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__35081;
    v34 = __Block_byref_object_dispose__35082;
    id v35 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__35081;
    v27 = __Block_byref_object_dispose__35082;
    id v28 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MPServerObjectDatabase__payloadForIdentifierSet_outError___block_invoke;
    block[3] = &unk_1E57F53E0;
    void block[4] = self;
    id v17 = v11;
    id v18 = v8;
    id v19 = v29;
    id v20 = &v23;
    uint64_t v21 = buf;
    __int16 v22 = &v36;
    dispatch_sync(accessQueue, block);
    if (!v24[5])
    {
      if (a4)
      {
        id v13 = (void *)*((void *)v31 + 5);
        if (v13) {
          *a4 = v13;
        }
      }
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(buf, 8);
  }
  else if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:0 userInfo:0];
  }
  id v14 = (id)v37[5];

  _Block_object_dispose(&v36, 8);

  return v14;
}

void __60__MPServerObjectDatabase__payloadForIdentifierSet_outError___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) statementWithString:@"SELECT source, payload FROM objects WHERE identifier = @identifier AND person_id = @personID", 0 error];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v27;
    *(void *)&long long v4 = 138543362;
    long long v23 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(v2, "bindStringValue:toParameterNamed:", *(void *)(*((void *)&v26 + 1) + 8 * i), @"@identifier", v23);
        [v2 bindStringValue:*(void *)(a1 + 48) toParameterNamed:@"@personID"];
        dispatch_queue_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) resultsForStatement:v2];
        id v25 = 0;
        id v9 = [v8 nextObjectWithError:&v25];
        id v10 = v25;
        id v11 = v25;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v9 int64ValueAtColumnIndex:0];
        uint64_t v12 = [v9 jsonDataAtColumnIndex:1];
        uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        if (v11)
        {
          uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v23;
            id v33 = v11;
            _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_FAULT, "SOD: modelObjectMatchingIdentifierSet stepError: %{public}@", buf, 0xCu);
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v10);
        }
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v16)
        {
          v30[0] = @"PayloadData";
          v30[1] = @"PersonID";
          uint64_t v17 = *(void *)(a1 + 48);
          uint64_t v18 = *(void *)(a1 + 56);
          v31[0] = v16;
          v31[1] = v17;
          v30[2] = @"source";
          id v19 = [NSNumber numberWithInteger:*(void *)(*(void *)(v18 + 8) + 24)];
          v31[2] = v19;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
          uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
          __int16 v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          goto LABEL_15;
        }
        [v2 reset];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  [v2 invalidate];
}

- (id)payloadDataForIdentifierSet:(id)a3 outError:(id *)a4
{
  long long v4 = [(MPServerObjectDatabase *)self _payloadForIdentifierSet:a3 outError:a4];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PayloadData"];

  return v5;
}

- (id)_hlsAssetMatchingIdentifierSet:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__35081;
  uint64_t v21 = __Block_byref_object_dispose__35082;
  id v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__MPServerObjectDatabase__hlsAssetMatchingIdentifierSet_query___block_invoke;
  v13[3] = &unk_1E57F82D8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __63__MPServerObjectDatabase__hlsAssetMatchingIdentifierSet_query___block_invoke(void *a1)
{
  v1 = a1;
  v150[0] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = (void *)a1[6];
  id v4 = *(id *)(a1[4] + 16);
  id v5 = v2;
  id v6 = v3;
  id v7 = [v5 personalizedStore];
  dispatch_queue_t v8 = [v7 personID];

  if (![v8 length])
  {
    id v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_INFO, "SOD: _MPServerObjectDatabaseHLSAssetsMatchingIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    id v10 = (id)*MEMORY[0x1E4FB8580];
    dispatch_queue_t v8 = v10;
  }
  id v11 = [v5 prioritizedStoreStringIdentifiersForPersonID:v8];
  if (![v11 count])
  {
    uint64_t v19 = 0;
    goto LABEL_133;
  }
  v136 = v11;
  id v137 = v6;
  id v12 = v8;
  memset(&v142, 0, sizeof(v142));
  *(void *)buf = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)&v142);
  id v13 = v12;
  id v14 = (unsigned char *)[v13 UTF8String];
  uint64_t v15 = [v13 length];
  int v16 = v15;
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(void *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&v142, v14, v15);
      }
      else if (*(void *)buf == 4512)
      {
        CC_SHA512_Update(&v142, v14, v15);
      }
    }
    else if (*(void *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v142, v14, v15);
    }
    else if (*(void *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&v142, v14, v15);
    }
  }
  else if (*(uint64_t *)buf > 2999)
  {
    if (*(void *)buf == 3000)
    {
      _MSV_XXH_XXH32_update_12030(&v142, v14, v15);
    }
    else if (*(void *)buf == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v142, v14, v15);
    }
  }
  else if (*(void *)buf)
  {
    if (*(void *)buf == 2000)
    {
      int v17 = (((v15 + BYTE3(v142.count[1])) & 3) - BYTE3(v142.count[1]));
      uint64_t v18 = (char *)&v142.hash[-1] + BYTE3(v142.count[1]);
      switch(v17)
      {
        case 0:
          break;
        case 1:
          *uint64_t v18 = *v14;
          break;
        case 2:
          __int16 v22 = *(_WORD *)v14;
          goto LABEL_30;
        case 3:
          __int16 v22 = *(_WORD *)v14;
          *((unsigned char *)&v142.count[1] + BYTE3(v142.count[1]) + 2) = v14[2];
LABEL_30:
          *(_WORD *)uint64_t v18 = v22;
          break;
        default:
          memcpy(v18, v14, (((v16 + BYTE3(v142.count[1])) & 3) - BYTE3(v142.count[1])));
          break;
      }
      HIDWORD(v142.count[0]) += v16;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    [v20 handleFailureInFunction:v21 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
  }
  memset((char *)v143 + 8, 0, 64);
  *(void *)&v143[0] = *(void *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    id v11 = v136;
    if (*(uint64_t *)buf <= 4000)
    {
      if (*(void *)buf == 3001)
      {
        *((void *)&v143[0] + 1) = _MSV_XXH_XXH64_digest(&v142);
      }
      else if (*(void *)buf == 4000)
      {
        CC_MD5_Final((unsigned __int8 *)v143 + 8, (CC_MD5_CTX *)&v142);
      }
    }
    else
    {
      switch(*(void *)buf)
      {
        case 0xFA1:
          CC_SHA1_Final((unsigned __int8 *)v143 + 8, (CC_SHA1_CTX *)&v142);
          break;
        case 0x10A0:
          CC_SHA256_Final((unsigned __int8 *)v143 + 8, (CC_SHA256_CTX *)&v142);
          break;
        case 0x11A0:
          CC_SHA512_Final((unsigned __int8 *)v143 + 8, &v142);
          break;
      }
    }
    goto LABEL_69;
  }
  id v11 = v136;
  if (*(uint64_t *)buf > 1999)
  {
    if (*(void *)buf != 2000)
    {
      if (*(void *)buf != 3000) {
        goto LABEL_69;
      }
      if (HIDWORD(v142.count[0])) {
        int v53 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v142.count[1], (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v142.count[1], (uint32x4_t)xmmword_1956897D0)));
      }
      else {
        int v53 = LODWORD(v142.hash[0]) + 374761393;
      }
      unsigned int v57 = LODWORD(v142.count[0]) + v53;
      v58 = &v142.hash[1];
      unint64_t v59 = v142.hash[3] & 0xF;
      if (v59 >= 4)
      {
        do
        {
          int v60 = *(_DWORD *)v58;
          v58 = (CC_LONG64 *)((char *)v58 + 4);
          HIDWORD(v61) = v57 - 1028477379 * v60;
          LODWORD(v61) = HIDWORD(v61);
          unsigned int v57 = 668265263 * (v61 >> 15);
          v59 -= 4;
        }
        while (v59 > 3);
      }
      for (; v59; --v59)
      {
        int v62 = *(unsigned __int8 *)v58;
        v58 = (CC_LONG64 *)((char *)v58 + 1);
        HIDWORD(v63) = v57 + 374761393 * v62;
        LODWORD(v63) = HIDWORD(v63);
        unsigned int v57 = -1640531535 * (v63 >> 21);
      }
      unsigned int v64 = (-2048144777 * (v57 ^ (v57 >> 15))) ^ ((-2048144777 * (v57 ^ (v57 >> 15))) >> 13);
      unsigned int v65 = (-1028477379 * v64) ^ ((-1028477379 * v64) >> 16);
      goto LABEL_68;
    }
    switch(BYTE3(v142.count[1]))
    {
      case 1u:
        int v56 = LOBYTE(v142.count[1]);
        break;
      case 2u:
        int v56 = LOWORD(v142.count[1]);
        break;
      case 3u:
        int v56 = LOWORD(v142.count[1]) | (BYTE2(v142.count[1]) << 16);
        break;
      default:
        unsigned int v66 = v142.count[0];
        goto LABEL_67;
    }
    unsigned int v66 = (461845907 * ((380141568 * v56) | ((-862048943 * v56) >> 17))) ^ LODWORD(v142.count[0]);
LABEL_67:
    unsigned int v67 = -2048144789 * (HIDWORD(v142.count[0]) ^ v66 ^ ((HIDWORD(v142.count[0]) ^ v66) >> 16));
    unsigned int v65 = (-1028477387 * (v67 ^ (v67 >> 13))) ^ ((-1028477387 * (v67 ^ (v67 >> 13))) >> 16);
    LODWORD(v142.count[0]) = v65;
LABEL_68:
    DWORD2(v143[0]) = v65;
    goto LABEL_69;
  }
  if (*(void *)buf)
  {
    if (*(void *)buf == 1000)
    {
      CC_LONG64 v23 = (v142.count[0] + v142.count[1]) ^ __ROR8__(v142.count[1], 51);
      CC_LONG64 v24 = v142.hash[0] + (v142.hash[1] ^ v142.hash[2]);
      uint64_t v25 = __ROR8__(v142.hash[1] ^ v142.hash[2], 48);
      CC_LONG64 v26 = (v24 ^ v25) + __ROR8__(v142.count[0] + v142.count[1], 32);
      CC_LONG64 v27 = v26 ^ __ROR8__(v24 ^ v25, 43);
      CC_LONG64 v28 = v24 + v23;
      CC_LONG64 v29 = v28 ^ __ROR8__(v23, 47);
      CC_LONG64 v30 = (v26 ^ v142.hash[2]) + v29;
      CC_LONG64 v31 = v30 ^ __ROR8__(v29, 51);
      CC_LONG64 v32 = (__ROR8__(v28, 32) ^ 0xFFLL) + v27;
      uint64_t v33 = __ROR8__(v27, 48);
      uint64_t v34 = __ROR8__(v30, 32) + (v32 ^ v33);
      uint64_t v35 = v34 ^ __ROR8__(v32 ^ v33, 43);
      CC_LONG64 v36 = v31 + v32;
      CC_LONG64 v37 = v36 ^ __ROR8__(v31, 47);
      CC_LONG64 v38 = v37 + v34;
      uint64_t v39 = v38 ^ __ROR8__(v37, 51);
      uint64_t v40 = __ROR8__(v36, 32) + v35;
      uint64_t v41 = __ROR8__(v35, 48);
      uint64_t v42 = __ROR8__(v38, 32) + (v40 ^ v41);
      uint64_t v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
      uint64_t v44 = v39 + v40;
      uint64_t v45 = v44 ^ __ROR8__(v39, 47);
      uint64_t v46 = v45 + v42;
      uint64_t v47 = v46 ^ __ROR8__(v45, 51);
      uint64_t v48 = __ROR8__(v44, 32) + v43;
      uint64_t v49 = __ROR8__(v43, 48);
      CC_LONG64 v50 = __ROR8__(v46, 32) + (v48 ^ v49);
      CC_LONG64 v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
      uint64_t v52 = v47 + v48;
      v142.count[0] = v50;
      v142.count[1] = v52 ^ __ROR8__(v47, 47);
      v142.hash[0] = __ROR8__(v52, 32);
      v142.hash[1] = v51;
      *((void *)&v143[0] + 1) = v142.count[1] ^ v50 ^ v142.hash[0] ^ v51;
    }
  }
  else
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    v55 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
    [v54 handleFailureInFunction:v55 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
  }
LABEL_69:
  long long v144 = v143[0];
  long long v145 = v143[1];
  long long v146 = v143[2];
  long long v147 = v143[3];
  uint64_t v148 = *(void *)&v143[4];
  v135 = v8;
  if (*(uint64_t *)&v143[0] > 3999)
  {
    if (*(uint64_t *)&v143[0] > 4255)
    {
      if (*(void *)&v143[0] == 4256)
      {
        v109 = (unsigned __int8 *)&v144 + 8;
        v110 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v111 = v110;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v113 = *v109++;
          v114 = &v110[i];
          char *v114 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v113 >> 4];
          v114[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v113 & 0xF];
        }
        id v80 = [NSString alloc];
        v81 = v111;
        uint64_t v82 = 64;
      }
      else
      {
        if (*(void *)&v143[0] != 4512) {
          goto LABEL_134;
        }
        v87 = (unsigned __int8 *)&v144 + 8;
        v88 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v89 = v88;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v91 = *v87++;
          v92 = &v88[j];
          char *v92 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v91 >> 4];
          v92[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v91 & 0xF];
        }
        id v80 = [NSString alloc];
        v81 = v89;
        uint64_t v82 = 128;
      }
    }
    else if (*(void *)&v143[0] == 4000)
    {
      v99 = (unsigned __int8 *)&v144 + 8;
      v100 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v101 = v100;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v103 = *v99++;
        v104 = &v100[k];
        char *v104 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v103 >> 4];
        v104[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v103 & 0xF];
      }
      id v80 = [NSString alloc];
      v81 = v101;
      uint64_t v82 = 32;
    }
    else
    {
      if (*(void *)&v143[0] != 4001) {
        goto LABEL_134;
      }
      v74 = (unsigned __int8 *)&v144 + 8;
      id v75 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v76 = v75;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v78 = *v74++;
        v79 = &v75[m];
        char *v79 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v78 >> 4];
        v79[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v78 & 0xF];
      }
      id v80 = [NSString alloc];
      v81 = v76;
      uint64_t v82 = 40;
    }
LABEL_113:
    CFStringRef v98 = (CFStringRef)[v80 initWithBytesNoCopy:v81 length:v82 encoding:4 freeWhenDone:1];
    goto LABEL_114;
  }
  if (*(uint64_t *)&v143[0] > 2999)
  {
    if (*(void *)&v143[0] == 3000)
    {
      LODWORD(v149[0]) = bswap32(DWORD2(v144));
      v105 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v106 = 0;
      v107 = v105 + 1;
      do
      {
        unint64_t v108 = *((unsigned __int8 *)v149 + v106);
        *(v107 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v108 >> 4];
        unsigned char *v107 = MSVFastHexStringFromBytes_hexCharacters_53728[v108 & 0xF];
        v107 += 2;
        ++v106;
      }
      while (v106 != 4);
      id v80 = [NSString alloc];
      v81 = v105;
      uint64_t v82 = 8;
    }
    else
    {
      if (*(void *)&v143[0] != 3001) {
        goto LABEL_134;
      }
      v149[0] = (id)bswap64(*((unint64_t *)&v144 + 1));
      v83 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v84 = 0;
      v85 = v83 + 1;
      do
      {
        unint64_t v86 = *((unsigned __int8 *)v149 + v84);
        *(v85 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v86 >> 4];
        unsigned char *v85 = MSVFastHexStringFromBytes_hexCharacters_53728[v86 & 0xF];
        v85 += 2;
        ++v84;
      }
      while (v84 != 8);
      id v80 = [NSString alloc];
      v81 = v83;
      uint64_t v82 = 16;
    }
    goto LABEL_113;
  }
  if (*(void *)&v143[0] == 1000)
  {
    uint64_t v93 = *((void *)&v144 + 1);
    v94 = (char *)v150 + 1;
    uint64_t quot = *((void *)&v144 + 1);
    do
    {
      lldiv_t v96 = lldiv(quot, 10);
      uint64_t quot = v96.quot;
      if (v96.rem >= 0) {
        LOBYTE(v97) = v96.rem;
      }
      else {
        uint64_t v97 = -v96.rem;
      }
      *(v94 - 2) = v97 + 48;
      v73 = (const UInt8 *)(v94 - 2);
      --v94;
    }
    while (v96.quot);
    if (v93 < 0)
    {
      *(v94 - 2) = 45;
      v73 = (const UInt8 *)(v94 - 2);
    }
    v72 = (char *)((char *)v150 - (char *)v73);
    goto LABEL_103;
  }
  if (*(void *)&v143[0] != 2000)
  {
LABEL_134:
    v131 = [MEMORY[0x1E4F28B00] currentHandler];
    v132 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
    [v131 handleFailureInFunction:v132 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

    v115 = &stru_1EE680640;
    goto LABEL_115;
  }
  uint64_t v68 = DWORD2(v144);
  v69 = v150;
  do
  {
    ldiv_t v70 = ldiv(v68, 10);
    uint64_t v68 = v70.quot;
    if (v70.rem >= 0) {
      LOBYTE(v71) = v70.rem;
    }
    else {
      uint64_t v71 = -v70.rem;
    }
    *((unsigned char *)v69 - 1) = v71 + 48;
    v69 = (void *)((char *)v69 - 1);
  }
  while (v70.quot);
  v72 = (char *)((char *)v150 - (char *)v69);
  v73 = (const UInt8 *)v69;
LABEL_103:
  CFStringRef v98 = CFStringCreateWithBytes(0, v73, (CFIndex)v72, 0x8000100u, 0);
LABEL_114:
  v115 = (__CFString *)v98;
LABEL_115:

  v140 = [(__CFString *)v115 substringToIndex:7];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v117 = v116;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id obj = v11;
  uint64_t v118 = [obj countByEnumeratingWithState:&v144 objects:buf count:16];
  if (v118)
  {
    uint64_t v119 = v118;
    id v133 = v5;
    v134 = v1;
    uint64_t v120 = *(void *)v145;
    while (2)
    {
      for (uint64_t n = 0; n != v119; ++n)
      {
        if (*(void *)v145 != v120) {
          objc_enumerationMutation(obj);
        }
        uint64_t v122 = *(void *)(*((void *)&v144 + 1) + 8 * n);
        v123 = objc_msgSend(v4, "statementWithString:error:", v6, 0, v133, v134);
        [v123 bindStringValue:v122 toParameterNamed:@"@identifier"];
        [v123 bindStringValue:v140 toParameterNamed:@"@hashedPersonID"];
        [v123 bindInt64Value:(uint64_t)v117 toParameterNamed:@"@now"];
        v124 = [v4 resultsForStatement:v123];
        v149[0] = 0;
        v125 = [v124 nextObjectWithError:v149];
        id v126 = v149[0];
        if (v125)
        {
          v139 = [[MPServerObjectDatabaseHLSAsset alloc] initWithSQLRowResult:v125];
        }
        else
        {
          [v123 invalidate];
          if (v126)
          {
            id v127 = v4;
            v128 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
            if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v143[0]) = 138543618;
              *(void *)((char *)v143 + 4) = v137;
              WORD6(v143[0]) = 2114;
              *(void *)((char *)v143 + 14) = v126;
              _os_log_impl(&dword_1952E8000, v128, OS_LOG_TYPE_FAULT, "SOD: _MPServerObjectDatabaseAssetsMatchingIdentifierSet query='%{public}@' stepError=%{public}@", (uint8_t *)v143, 0x16u);
            }

            id v4 = v127;
            id v6 = v137;
          }
        }

        if (v125)
        {
          id v5 = v133;
          v1 = v134;
          id v11 = v136;
          uint64_t v19 = v139;
          goto LABEL_132;
        }
      }
      uint64_t v119 = [obj countByEnumeratingWithState:&v144 objects:buf count:16];
      if (v119) {
        continue;
      }
      break;
    }
    uint64_t v19 = 0;
    id v5 = v133;
    v1 = v134;
    id v11 = v136;
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_132:

  dispatch_queue_t v8 = v135;
LABEL_133:

  uint64_t v129 = *(void *)(v1[7] + 8);
  v130 = *(void **)(v129 + 40);
  *(void *)(v129 + 40) = v19;
}

- (id)_assetsMatchingIdentifierSet:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CC_LONG64 v24 = __Block_byref_object_copy__35081;
  uint64_t v25 = __Block_byref_object_dispose__35082;
  id v26 = (id)MEMORY[0x1E4F1CBF0];
  accessQueue = self->_accessQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __61__MPServerObjectDatabase__assetsMatchingIdentifierSet_query___block_invoke;
  int v16 = &unk_1E57F82D8;
  uint64_t v20 = &v21;
  int v17 = self;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  dispatch_sync(accessQueue, &v13);
  id v11 = objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);

  return v11;
}

void __61__MPServerObjectDatabase__assetsMatchingIdentifierSet_query___block_invoke(void *a1)
{
  v1 = a1;
  v158[0] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = (void *)a1[6];
  id v147 = *(id *)(a1[4] + 16);
  id v4 = v2;
  id v148 = v3;
  id v5 = [v4 personalizedStore];
  id v6 = [v5 personID];

  if (![v6 length])
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_INFO, "SOD: _MPServerObjectDatabaseAssetsMatchingIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    id v8 = (id)*MEMORY[0x1E4FB8580];
    id v6 = v8;
  }
  id v9 = [v4 prioritizedStoreStringIdentifiersForPersonID:v6];
  uint64_t v10 = [v9 count];
  uint64_t v11 = MEMORY[0x1E4F1CBF0];
  if (!v10)
  {
    id v19 = 0;
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_134;
  }
  id v12 = v6;
  memset(&v150, 0, sizeof(v150));
  *(void *)buf = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)&v150);
  id v13 = v12;
  uint64_t v14 = (unsigned char *)[v13 UTF8String];
  uint64_t v15 = [v13 length];
  int v16 = v15;
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(void *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&v150, v14, v15);
      }
      else if (*(void *)buf == 4512)
      {
        CC_SHA512_Update(&v150, v14, v15);
      }
    }
    else if (*(void *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v150, v14, v15);
    }
    else if (*(void *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&v150, v14, v15);
    }
  }
  else if (*(uint64_t *)buf > 2999)
  {
    if (*(void *)buf == 3000)
    {
      _MSV_XXH_XXH32_update_12030(&v150, v14, v15);
    }
    else if (*(void *)buf == 3001)
    {
      _MSV_XXH_XXH64_update_12031((char *)&v150, v14, v15);
    }
  }
  else if (*(void *)buf)
  {
    if (*(void *)buf == 2000)
    {
      int v17 = (((v15 + BYTE3(v150.count[1])) & 3) - BYTE3(v150.count[1]));
      id v18 = (char *)&v150.hash[-1] + BYTE3(v150.count[1]);
      switch(v17)
      {
        case 0:
          break;
        case 1:
          *id v18 = *v14;
          break;
        case 2:
          __int16 v23 = *(_WORD *)v14;
          goto LABEL_30;
        case 3:
          __int16 v23 = *(_WORD *)v14;
          *((unsigned char *)&v150.count[1] + BYTE3(v150.count[1]) + 2) = v14[2];
LABEL_30:
          *(_WORD *)id v18 = v23;
          break;
        default:
          memcpy(v18, v14, (((v16 + BYTE3(v150.count[1])) & 3) - BYTE3(v150.count[1])));
          break;
      }
      HIDWORD(v150.count[0]) += v16;
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    [v21 handleFailureInFunction:v22 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
  }
  memset((char *)v151 + 8, 0, 64);
  *(void *)&v151[0] = *(void *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    if (*(uint64_t *)buf <= 4000)
    {
      if (*(void *)buf == 3001)
      {
        *((void *)&v151[0] + 1) = _MSV_XXH_XXH64_digest(&v150);
      }
      else if (*(void *)buf == 4000)
      {
        CC_MD5_Final((unsigned __int8 *)v151 + 8, (CC_MD5_CTX *)&v150);
      }
    }
    else
    {
      switch(*(void *)buf)
      {
        case 0xFA1:
          CC_SHA1_Final((unsigned __int8 *)v151 + 8, (CC_SHA1_CTX *)&v150);
          break;
        case 0x10A0:
          CC_SHA256_Final((unsigned __int8 *)v151 + 8, (CC_SHA256_CTX *)&v150);
          break;
        case 0x11A0:
          CC_SHA512_Final((unsigned __int8 *)v151 + 8, &v150);
          break;
      }
    }
    goto LABEL_69;
  }
  if (*(uint64_t *)buf > 1999)
  {
    if (*(void *)buf != 2000)
    {
      if (*(void *)buf != 3000) {
        goto LABEL_69;
      }
      if (HIDWORD(v150.count[0])) {
        int v54 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v150.count[1], (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v150.count[1], (uint32x4_t)xmmword_1956897D0)));
      }
      else {
        int v54 = LODWORD(v150.hash[0]) + 374761393;
      }
      unsigned int v58 = LODWORD(v150.count[0]) + v54;
      unint64_t v59 = &v150.hash[1];
      unint64_t v60 = v150.hash[3] & 0xF;
      if (v60 >= 4)
      {
        do
        {
          int v61 = *(_DWORD *)v59;
          unint64_t v59 = (CC_LONG64 *)((char *)v59 + 4);
          HIDWORD(v62) = v58 - 1028477379 * v61;
          LODWORD(v62) = HIDWORD(v62);
          unsigned int v58 = 668265263 * (v62 >> 15);
          v60 -= 4;
        }
        while (v60 > 3);
      }
      for (; v60; --v60)
      {
        int v63 = *(unsigned __int8 *)v59;
        unint64_t v59 = (CC_LONG64 *)((char *)v59 + 1);
        HIDWORD(v64) = v58 + 374761393 * v63;
        LODWORD(v64) = HIDWORD(v64);
        unsigned int v58 = -1640531535 * (v64 >> 21);
      }
      unsigned int v65 = (-2048144777 * (v58 ^ (v58 >> 15))) ^ ((-2048144777 * (v58 ^ (v58 >> 15))) >> 13);
      unsigned int v66 = (-1028477379 * v65) ^ ((-1028477379 * v65) >> 16);
      goto LABEL_68;
    }
    switch(BYTE3(v150.count[1]))
    {
      case 1u:
        int v57 = LOBYTE(v150.count[1]);
        break;
      case 2u:
        int v57 = LOWORD(v150.count[1]);
        break;
      case 3u:
        int v57 = LOWORD(v150.count[1]) | (BYTE2(v150.count[1]) << 16);
        break;
      default:
        unsigned int v67 = v150.count[0];
        goto LABEL_67;
    }
    unsigned int v67 = (461845907 * ((380141568 * v57) | ((-862048943 * v57) >> 17))) ^ LODWORD(v150.count[0]);
LABEL_67:
    unsigned int v68 = -2048144789 * (HIDWORD(v150.count[0]) ^ v67 ^ ((HIDWORD(v150.count[0]) ^ v67) >> 16));
    unsigned int v66 = (-1028477387 * (v68 ^ (v68 >> 13))) ^ ((-1028477387 * (v68 ^ (v68 >> 13))) >> 16);
    LODWORD(v150.count[0]) = v66;
LABEL_68:
    DWORD2(v151[0]) = v66;
    goto LABEL_69;
  }
  if (*(void *)buf)
  {
    if (*(void *)buf == 1000)
    {
      CC_LONG64 v24 = (v150.count[0] + v150.count[1]) ^ __ROR8__(v150.count[1], 51);
      CC_LONG64 v25 = v150.hash[0] + (v150.hash[1] ^ v150.hash[2]);
      uint64_t v26 = __ROR8__(v150.hash[1] ^ v150.hash[2], 48);
      CC_LONG64 v27 = (v25 ^ v26) + __ROR8__(v150.count[0] + v150.count[1], 32);
      CC_LONG64 v28 = v27 ^ __ROR8__(v25 ^ v26, 43);
      CC_LONG64 v29 = v25 + v24;
      CC_LONG64 v30 = v29 ^ __ROR8__(v24, 47);
      CC_LONG64 v31 = (v27 ^ v150.hash[2]) + v30;
      CC_LONG64 v32 = v31 ^ __ROR8__(v30, 51);
      CC_LONG64 v33 = (__ROR8__(v29, 32) ^ 0xFFLL) + v28;
      uint64_t v34 = __ROR8__(v28, 48);
      uint64_t v35 = __ROR8__(v31, 32) + (v33 ^ v34);
      uint64_t v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
      CC_LONG64 v37 = v32 + v33;
      CC_LONG64 v38 = v37 ^ __ROR8__(v32, 47);
      CC_LONG64 v39 = v38 + v35;
      uint64_t v40 = v39 ^ __ROR8__(v38, 51);
      uint64_t v41 = __ROR8__(v37, 32) + v36;
      uint64_t v42 = __ROR8__(v36, 48);
      uint64_t v43 = __ROR8__(v39, 32) + (v41 ^ v42);
      uint64_t v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
      uint64_t v45 = v40 + v41;
      uint64_t v46 = v45 ^ __ROR8__(v40, 47);
      uint64_t v47 = v46 + v43;
      uint64_t v48 = v47 ^ __ROR8__(v46, 51);
      uint64_t v49 = __ROR8__(v45, 32) + v44;
      uint64_t v50 = __ROR8__(v44, 48);
      CC_LONG64 v51 = __ROR8__(v47, 32) + (v49 ^ v50);
      CC_LONG64 v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
      uint64_t v53 = v48 + v49;
      v150.count[0] = v51;
      v150.count[1] = v53 ^ __ROR8__(v48, 47);
      v150.hash[0] = __ROR8__(v53, 32);
      v150.hash[1] = v52;
      *((void *)&v151[0] + 1) = v150.count[1] ^ v51 ^ v150.hash[0] ^ v52;
    }
  }
  else
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    int v56 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
    [v55 handleFailureInFunction:v56 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
  }
LABEL_69:
  long long v152 = v151[0];
  long long v153 = v151[1];
  long long v154 = v151[2];
  long long v155 = v151[3];
  uint64_t v156 = *(void *)&v151[4];
  v143 = v1;
  if (*(uint64_t *)&v151[0] > 3999)
  {
    if (*(uint64_t *)&v151[0] > 4255)
    {
      if (*(void *)&v151[0] == 4256)
      {
        v110 = (unsigned __int8 *)&v152 + 8;
        v111 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v112 = v111;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v114 = *v110++;
          v115 = &v111[i];
          char *v115 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v114 >> 4];
          v115[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v114 & 0xF];
        }
        id v81 = [NSString alloc];
        uint64_t v82 = v112;
        uint64_t v83 = 64;
      }
      else
      {
        if (*(void *)&v151[0] != 4512) {
          goto LABEL_137;
        }
        v88 = (unsigned __int8 *)&v152 + 8;
        v89 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v90 = v89;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v92 = *v88++;
          uint64_t v93 = &v89[j];
          *uint64_t v93 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v92 >> 4];
          v93[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v92 & 0xF];
        }
        id v81 = [NSString alloc];
        uint64_t v82 = v90;
        uint64_t v83 = 128;
      }
    }
    else if (*(void *)&v151[0] == 4000)
    {
      v100 = (unsigned __int8 *)&v152 + 8;
      v101 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v102 = v101;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v104 = *v100++;
        v105 = &v101[k];
        char *v105 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v104 >> 4];
        v105[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v104 & 0xF];
      }
      id v81 = [NSString alloc];
      uint64_t v82 = v102;
      uint64_t v83 = 32;
    }
    else
    {
      if (*(void *)&v151[0] != 4001) {
        goto LABEL_137;
      }
      id v75 = (unsigned __int8 *)&v152 + 8;
      uint64_t v76 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v77 = v76;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v79 = *v75++;
        id v80 = &v76[m];
        *id v80 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v79 >> 4];
        v80[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v79 & 0xF];
      }
      id v81 = [NSString alloc];
      uint64_t v82 = v77;
      uint64_t v83 = 40;
    }
LABEL_113:
    CFStringRef v99 = (CFStringRef)[v81 initWithBytesNoCopy:v82 length:v83 encoding:4 freeWhenDone:1];
    goto LABEL_114;
  }
  if (*(uint64_t *)&v151[0] > 2999)
  {
    if (*(void *)&v151[0] == 3000)
    {
      LODWORD(v157[0]) = bswap32(DWORD2(v152));
      uint64_t v106 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v107 = 0;
      unint64_t v108 = v106 + 1;
      do
      {
        unint64_t v109 = *((unsigned __int8 *)v157 + v107);
        *(v108 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v109 >> 4];
        *unint64_t v108 = MSVFastHexStringFromBytes_hexCharacters_53728[v109 & 0xF];
        v108 += 2;
        ++v107;
      }
      while (v107 != 4);
      id v81 = [NSString alloc];
      uint64_t v82 = v106;
      uint64_t v83 = 8;
    }
    else
    {
      if (*(void *)&v151[0] != 3001) {
        goto LABEL_137;
      }
      v157[0] = (id)bswap64(*((unint64_t *)&v152 + 1));
      uint64_t v84 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v85 = 0;
      unint64_t v86 = v84 + 1;
      do
      {
        unint64_t v87 = *((unsigned __int8 *)v157 + v85);
        *(v86 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v87 >> 4];
        *unint64_t v86 = MSVFastHexStringFromBytes_hexCharacters_53728[v87 & 0xF];
        v86 += 2;
        ++v85;
      }
      while (v85 != 8);
      id v81 = [NSString alloc];
      uint64_t v82 = v84;
      uint64_t v83 = 16;
    }
    goto LABEL_113;
  }
  if (*(void *)&v151[0] == 1000)
  {
    uint64_t v94 = *((void *)&v152 + 1);
    v95 = (char *)v158 + 1;
    uint64_t quot = *((void *)&v152 + 1);
    do
    {
      lldiv_t v97 = lldiv(quot, 10);
      uint64_t quot = v97.quot;
      if (v97.rem >= 0) {
        LOBYTE(v98) = v97.rem;
      }
      else {
        uint64_t v98 = -v97.rem;
      }
      *(v95 - 2) = v98 + 48;
      v74 = (const UInt8 *)(v95 - 2);
      --v95;
    }
    while (v97.quot);
    if (v94 < 0)
    {
      *(v95 - 2) = 45;
      v74 = (const UInt8 *)(v95 - 2);
    }
    v73 = (char *)((char *)v158 - (char *)v74);
    goto LABEL_103;
  }
  if (*(void *)&v151[0] != 2000)
  {
LABEL_137:
    v138 = [MEMORY[0x1E4F28B00] currentHandler];
    v139 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
    [v138 handleFailureInFunction:v139 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

    double v116 = &stru_1EE680640;
    goto LABEL_115;
  }
  uint64_t v69 = DWORD2(v152);
  ldiv_t v70 = v158;
  do
  {
    ldiv_t v71 = ldiv(v69, 10);
    uint64_t v69 = v71.quot;
    if (v71.rem >= 0) {
      LOBYTE(v72) = v71.rem;
    }
    else {
      uint64_t v72 = -v71.rem;
    }
    *((unsigned char *)v70 - 1) = v72 + 48;
    ldiv_t v70 = (void *)((char *)v70 - 1);
  }
  while (v71.quot);
  v73 = (char *)((char *)v158 - (char *)v70);
  v74 = (const UInt8 *)v70;
LABEL_103:
  CFStringRef v99 = CFStringCreateWithBytes(0, v74, (CFIndex)v73, 0x8000100u, 0);
LABEL_114:
  double v116 = (__CFString *)v99;
LABEL_115:
  v141 = v6;
  id v142 = v4;

  long long v146 = [(__CFString *)v116 substringToIndex:7];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v118 = v117;
  uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  v140 = v9;
  id obj = v9;
  uint64_t v119 = [obj countByEnumeratingWithState:&v152 objects:buf count:16];
  if (v119)
  {
    uint64_t v120 = v119;
    id v19 = 0;
    uint64_t v145 = *(void *)v153;
LABEL_117:
    uint64_t v121 = 0;
    while (1)
    {
      if (*(void *)v153 != v145) {
        objc_enumerationMutation(obj);
      }
      uint64_t v122 = *(void *)(*((void *)&v152 + 1) + 8 * v121);
      v123 = objc_msgSend(v147, "statementWithString:error:", v148, 0, v140);
      [v123 bindStringValue:v122 toParameterNamed:@"@identifier"];
      [v123 bindStringValue:v146 toParameterNamed:@"@hashedPersonID"];
      [v123 bindInt64Value:(uint64_t)v118 toParameterNamed:@"@now"];
      v124 = [v147 resultsForStatement:v123];
      v157[0] = 0;
      v125 = [v124 nextObjectWithError:v157];
      id v126 = v157[0];
      id v127 = v126;
      for (BOOL n = v126 == 0; v125 && !v127; BOOL n = v127 == 0)
      {
        uint64_t v129 = v125;
        v130 = [[MPServerObjectDatabaseAsset alloc] initWithSQLRowResult:v125];
        [v20 addObject:v130];

        v157[0] = 0;
        v125 = [v124 nextObjectWithError:v157];
        id v127 = v157[0];
      }
      [v123 invalidate];
      if (!n)
      {
        v131 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT))
        {
          LODWORD(v151[0]) = 138543618;
          *(void *)((char *)v151 + 4) = v148;
          WORD6(v151[0]) = 2114;
          *(void *)((char *)v151 + 14) = v127;
          _os_log_impl(&dword_1952E8000, v131, OS_LOG_TYPE_FAULT, "SOD: _MPServerObjectDatabaseAssetsMatchingIdentifierSet query='%{public}@' stepError=%{public}@", (uint8_t *)v151, 0x16u);
        }

        id v19 = v127;
      }
      uint64_t v132 = [v20 count];

      if (v132) {
        break;
      }
      if (++v121 == v120)
      {
        uint64_t v120 = [obj countByEnumeratingWithState:&v152 objects:buf count:16];
        if (v120) {
          goto LABEL_117;
        }
        break;
      }
    }
  }
  else
  {
    id v19 = 0;
  }

  id v4 = v142;
  v1 = v143;
  id v9 = v140;
  id v6 = v141;
  uint64_t v11 = MEMORY[0x1E4F1CBF0];
LABEL_134:

  id v133 = v19;
  uint64_t v134 = *(void *)(v1[7] + 8);
  v135 = *(void **)(v134 + 40);
  *(void *)(v134 + 40) = v20;

  if (v133)
  {
    uint64_t v136 = *(void *)(v1[7] + 8);
    id v137 = *(void **)(v136 + 40);
    *(void *)(v136 + 40) = v11;
  }
}

- (id)payloadForRelatedEntityWithIdentifierSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 personalizedStore];
  id v6 = [v5 personID];
  id v7 = [v4 preferredStoreStringIdentifierForPersonID:v6];

  if (v7)
  {
    id v8 = [v4 personalizedStore];
    id v9 = [v8 personID];

    if (![v9 length])
    {
      uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_INFO, "SOD: payloadForRelatedEntityWithIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
      }

      id v11 = (id)*MEMORY[0x1E4FB8580];
      id v9 = v11;
    }
    *(void *)buf = 0;
    uint64_t v21 = buf;
    uint64_t v22 = 0x3032000000;
    __int16 v23 = __Block_byref_object_copy__35081;
    CC_LONG64 v24 = __Block_byref_object_dispose__35082;
    id v25 = 0;
    accessQueue = self->_accessQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__MPServerObjectDatabase_payloadForRelatedEntityWithIdentifierSet___block_invoke;
    v16[3] = &unk_1E57F82D8;
    v16[4] = self;
    id v17 = v7;
    id v18 = v9;
    id v19 = buf;
    id v13 = v9;
    dispatch_sync(accessQueue, v16);
    id v14 = *((id *)v21 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __67__MPServerObjectDatabase_payloadForRelatedEntityWithIdentifierSet___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 16) statementWithString:@"SELECT payload FROM objects WHERE identifier = @identifier AND person_id = @personID AND source = @source LIMIT 1" error:0];
  [v2 bindStringValue:a1[5] toParameterNamed:@"@identifier"];
  [v2 bindStringValue:a1[6] toParameterNamed:@"@personID"];
  [v2 bindInt64Value:1 toParameterNamed:@"@source"];
  uint64_t v3 = [*(id *)(a1[4] + 16) resultsForStatement:v2];
  id v13 = 0;
  id v4 = [v3 nextObjectWithError:&v13];
  id v5 = v13;
  id v12 = 0;
  uint64_t v6 = [v4 jsonValueAtColumnIndex:0 error:&v12];
  id v7 = v12;
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  [v2 invalidate];
  if (v5)
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_FAULT, "SOD: payloadForRelatedEntityWithIdentifierSet stepError: %{public}@", buf, 0xCu);
    }
  }
  if (v7)
  {
    id v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_FAULT, "SOD: payloadForRelatedEntityWithIdentifierSet jsonError: %{public}@", buf, 0xCu);
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(NSHashTable *)self->_observers removeObject:v4];

  os_unfair_recursive_lock_unlock();
}

- (BOOL)importAssetsFromRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__35081;
  uint64_t v26 = __Block_byref_object_dispose__35082;
  id v27 = 0;
  id v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v6);

  id v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SODImportAssetsFromRequest", " enableTelemetry=YES ", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MPServerObjectDatabase_importAssetsFromRequest_error___block_invoke;
  block[3] = &unk_1E57F9F48;
  void block[4] = self;
  id v12 = v6;
  id v19 = v12;
  uint64_t v20 = &v22;
  dispatch_sync(accessQueue, block);
  if (a4)
  {
    id v13 = (void *)v23[5];
    if (v13) {
      *a4 = v13;
    }
  }
  id v14 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  id v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v15, OS_SIGNPOST_INTERVAL_END, v8, "SODImportAssetsFromRequest", (const char *)&unk_1956A9243, buf, 2u);
  }

  BOOL v16 = v23[5] != 0;
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __56__MPServerObjectDatabase_importAssetsFromRequest_error___block_invoke(void *a1)
{
  uint64_t v2 = -[_MPServerObjectDatabaseImporter initWithDatabase:]([_MPServerObjectDatabaseImporter alloc], *(void **)(a1[4] + 16));
  uint64_t v3 = (void *)a1[5];
  id obj = 0;
  [v3 performWithDatabaseOperations:v2 error:&obj];
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

- (void)enumerateAssetsMissingSINFsForHashedPersonID:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MPServerObjectDatabase_enumerateAssetsMissingSINFsForHashedPersonID_usingBlock___block_invoke;
  block[3] = &unk_1E57F8408;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, block);
}

void __82__MPServerObjectDatabase_enumerateAssetsMissingSINFsForHashedPersonID_usingBlock___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 16) statementWithString:@"SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE mini_sinf IS NULL AND sinfs is NULL AND hashed_person_id = @hashedPersonID AND cast(identifier AS INT) != 0", 0 error];
  [v2 bindStringValue:a1[5] toParameterNamed:@"@hashedPersonID"];
  uint64_t v3 = [*(id *)(a1[4] + 16) resultsForStatement:v2];
  id v4 = 0;
  char v10 = 0;
  while (1)
  {
    id v5 = v4;
    id v9 = 0;
    id v4 = [v3 nextObjectWithError:&v9];
    id v6 = v9;

    if (!v4 || v6) {
      break;
    }
    id v7 = [[MPServerObjectDatabaseAsset alloc] initWithSQLRowResult:v4];
    (*(void (**)(void))(a1[6] + 16))();

    if (v10)
    {
      [v2 invalidate];
      goto LABEL_10;
    }
  }
  [v2 invalidate];
  if (v6)
  {
    os_signpost_id_t v8 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_FAULT, "SOD: enumerateAssetsMissingSINFsUsingBlock stepError: %{public}@", buf, 0xCu);
    }
  }
LABEL_10:
}

- (id)hlsAssetMatchingIdentifierSet:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SODHLSAssetMatchingIdentifierSet", " enableTelemetry=YES ", buf, 2u);
  }

  id v9 = [(MPServerObjectDatabase *)self _hlsAssetMatchingIdentifierSet:v4 query:@"SELECT identifier, hashed_person_id, playlist_url, key_certificate_url, key_server_url, key_server_adam_id, key_server_protocol_type, is_itunes_store_stream FROM hls_assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND url_expiration_date > @now"];

  char v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "SODHLSAssetMatchingIdentifierSet", (const char *)&unk_1956A9243, v13, 2u);
  }

  return v9;
}

- (id)assetsWithMiniSINFsMatchingIdentifierSet:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SODAssetsWithMiniSINFsMatchingIdentifierSet", " enableTelemetry=YES ", buf, 2u);
  }

  id v9 = [(MPServerObjectDatabase *)self _assetsMatchingIdentifierSet:v4 query:@"SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND LENGTH(mini_sinf) > 1 AND url_expiration_date > @now"];

  char v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "SODAssetsWithMiniSINFsMatchingIdentifierSet", (const char *)&unk_1956A9243, v13, 2u);
  }

  return v9;
}

- (id)assetsMatchingIdentifierSet:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SODAssetsMatchingIdentifierSet", " enableTelemetry=YES ", buf, 2u);
  }

  id v9 = [(MPServerObjectDatabase *)self _assetsMatchingIdentifierSet:v4 query:@"SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND url_expiration_date > @now"];

  char v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  id v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "SODAssetsMatchingIdentifierSet", (const char *)&unk_1956A9243, v13, 2u);
  }

  return v9;
}

- (id)_relatedIdentifierSetsForParentIdentifierSet:(id)a3 parentVersionHash:(id)a4 childKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 personalizedStore];
  id v12 = [v11 personID];

  if (![v12 length])
  {
    uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_INFO, "SOD: relatedIdentifierSetsForParentIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    id v14 = (id)*MEMORY[0x1E4FB8580];
    id v12 = v14;
  }
  id v15 = [v8 prioritizedStoreStringIdentifiersForPersonID:v12];
  if ([v15 count])
  {
    *(void *)buf = 0;
    CC_LONG64 v30 = buf;
    uint64_t v31 = 0x3032000000;
    CC_LONG64 v32 = __Block_byref_object_copy__35081;
    CC_LONG64 v33 = __Block_byref_object_dispose__35082;
    id v34 = 0;
    BOOL v16 = [MEMORY[0x1E4F1CA48] array];
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__MPServerObjectDatabase__relatedIdentifierSetsForParentIdentifierSet_parentVersionHash_childKey___block_invoke;
    block[3] = &unk_1E57F5390;
    id v22 = v12;
    id v23 = v15;
    id v24 = v9;
    id v25 = self;
    id v26 = v10;
    id v18 = v16;
    id v27 = v18;
    CC_LONG64 v28 = buf;
    dispatch_sync(accessQueue, block);
    if (*((void *)v30 + 5)) {
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else {
      id v19 = (void *)[v18 copy];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __98__MPServerObjectDatabase__relatedIdentifierSetsForParentIdentifierSet_parentVersionHash_childKey___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x19971DE60]();
  uint64_t v2 = objc_alloc_init(MPMediaKitEntityTranslatorContext);
  [(MPMediaKitEntityTranslatorContext *)v2 setPersonID:*(void *)(a1 + 32)];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v28 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v3;
        uint64_t v4 = *(void *)(*((void *)&v32 + 1) + 8 * v3);
        id v5 = *(void **)(*(void *)(a1 + 56) + 16);
        if (*(void *)(a1 + 48))
        {
          os_signpost_id_t v6 = [v5 statementWithString:@"SELECT child_identifier FROM object_relationships WHERE parent_identifier = @parentIdentifier AND person_id = @personID AND parent_version_hash = @parentVersionHash AND child_key = @childKey ORDER BY suborder" error:0];
          [v6 bindStringValue:*(void *)(a1 + 48) toParameterNamed:@"@parentVersionHash"];
        }
        else
        {
          os_signpost_id_t v6 = [v5 statementWithString:@"SELECT child_identifier FROM object_relationships WHERE parent_identifier = @parentIdentifier AND person_id = @personID AND child_key = @childKey ORDER BY suborder" error:0];
        }
        [v6 bindStringValue:v4 toParameterNamed:@"@parentIdentifier"];
        [v6 bindStringValue:*(void *)(a1 + 32) toParameterNamed:@"@personID"];
        [v6 bindStringValue:*(void *)(a1 + 64) toParameterNamed:@"@childKey"];
        id v7 = [*(id *)(*(void *)(a1 + 56) + 16) resultsForStatement:v6];
        id v31 = 0;
        id v8 = [v7 nextObjectWithError:&v31];
        id v9 = v31;
        BOOL v10 = v9 == 0;
        if (v9) {
          BOOL v11 = 0;
        }
        else {
          BOOL v11 = v8 != 0;
        }
        BOOL v30 = v11;
        if (v11)
        {
          id v12 = v8;
          while (1)
          {
            uint64_t v13 = [v12 stringValueAtColumnIndex:0];
            CC_LONG64 v38 = @"id";
            CC_LONG64 v39 = v13;
            id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
            id v15 = *(id *)(a1 + 64);
            if ([v15 isEqualToString:@"MPModelChildSongAlbum"])
            {
              BOOL v16 = (void *)MEMORY[0x1E4F779D8];
              id v17 = @"songs";
            }
            else
            {
              if ([v15 isEqualToString:@"MPModelChildSongArtists"])
              {
                BOOL v16 = (void *)MEMORY[0x1E4F779D8];
                id v17 = @"songs";
LABEL_24:
                id v18 = @"artists";
                goto LABEL_25;
              }
              if ([v15 isEqualToString:@"MPModelChildAlbumSongs"])
              {
                BOOL v16 = (void *)MEMORY[0x1E4F779D8];
                id v17 = @"albums";
LABEL_21:
                id v18 = @"songs";
                goto LABEL_25;
              }
              if ([v15 isEqualToString:@"MPModelChildAlbumArtists"])
              {
                BOOL v16 = (void *)MEMORY[0x1E4F779D8];
                id v17 = @"albums";
                goto LABEL_24;
              }
              if ([v15 isEqualToString:@"MPModelChildAlbumRecordLabels"])
              {
                BOOL v16 = (void *)MEMORY[0x1E4F779D8];
                id v17 = @"albums";
                id v18 = @"record-labels";
                goto LABEL_25;
              }
              if (![v15 isEqualToString:@"MPModelChildArtistAlbums"])
              {
                if (![v15 isEqualToString:@"MPModelChildPlaylistEntries"])
                {
                  if ([v15 isEqualToString:@"MPModelChildRadioStationEvents"])
                  {
                    BOOL v16 = (void *)MEMORY[0x1E4F779D8];
                    id v17 = @"stations";
                    id v18 = @"station-events";
                    goto LABEL_25;
                  }
                  if (![v15 isEqualToString:@"MPModelChildCreditsArtistRelatedArtist"])
                  {
                    id v19 = 0;
                    goto LABEL_26;
                  }
                  BOOL v16 = (void *)MEMORY[0x1E4F779D8];
                  id v17 = @"credit-artists";
                  goto LABEL_24;
                }
                BOOL v16 = (void *)MEMORY[0x1E4F779D8];
                id v17 = @"playlists";
                goto LABEL_21;
              }
              BOOL v16 = (void *)MEMORY[0x1E4F779D8];
              id v17 = @"artists";
            }
            id v18 = @"albums";
LABEL_25:
            id v19 = [v16 pairWithFirst:v17 second:v18];
LABEL_26:

            uint64_t v20 = [v19 second];

            uint64_t v21 = +[MPMediaKitEntityTranslator translatorForType:v20];
            id v22 = [v21 identifiersForPayload:v14 context:v2];
            if (v22) {
              [*(id *)(a1 + 72) addObject:v22];
            }

            id v31 = 0;
            id v8 = [v7 nextObjectWithError:&v31];
            id v23 = v31;

            BOOL v10 = v23 == 0;
            if (v8)
            {
              id v12 = v8;
              if (!v23) {
                continue;
              }
            }
            goto LABEL_43;
          }
        }
        id v23 = v9;
LABEL_43:
        [v6 invalidate];
        if (!v10)
        {
          id v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v37 = v23;
            _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_FAULT, "SOD: relatedIdentifierSetsForParentIdentifierSet stepError: %{public}@", buf, 0xCu);
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v23);
        }

        if (v30) {
          goto LABEL_50;
        }
        uint64_t v3 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v28);
  }
LABEL_50:
}

- (id)relatedIdentifierSetsForParentIdentifierSet:(id)a3 childKey:(id)a4
{
  return [(MPServerObjectDatabase *)self _relatedIdentifierSetsForParentIdentifierSet:a3 parentVersionHash:0 childKey:a4];
}

- (id)modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  os_signpost_id_t v6 = [(MPServerObjectDatabase *)self modelObjectMatchingIdentifierSet:a3 propertySet:a4 error:&v20];
  id v7 = v20;
  if (!v7)
  {
    id v13 = v6;
    goto LABEL_13;
  }
  id v8 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v7, "msv_description");
    *(_DWORD *)buf = 138543362;
    id v22 = v9;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "SOD: modelObjectMatchingIdentifierSet: returning nil [non-nil error] error=%{public}@", buf, 0xCu);
  }
  BOOL v10 = [v7 domain];
  BOOL v11 = @"MPObjectDatabaseError";
  if (v10 == @"MPObjectDatabaseError")
  {
  }
  else
  {
    int v12 = [(__CFString *)v10 isEqual:@"MPObjectDatabaseError"];

    if (!v12) {
      goto LABEL_11;
    }
  }
  uint64_t v14 = [v7 code];

  if (v14 == 1)
  {
    id v15 = [v7 userInfo];
    BOOL v10 = [v15 objectForKeyedSubscript:@"MissingPropertySetMappingEntityType"];

    BOOL v16 = [v7 userInfo];
    id v17 = [v16 objectForKeyedSubscript:@"MissingPropertySetMappingRelationshipKey"];

    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPServerObjectDatabase.m", 294, @"PropertySet does not contain mapping for identifierSet [] matchingEntityType='%@' relationshipKey=%@", v10, v17 object file lineNumber description];

LABEL_11:
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  id v7 = [(MPServerObjectDatabase *)self identifiersMatchingIdentifierSet:a3 propertySet:a4 options:a5 error:&v21];
  id v8 = v21;
  if (!v8)
  {
    id v14 = v7;
    goto LABEL_13;
  }
  id v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = objc_msgSend(v8, "msv_description");
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v10;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "SOD: identifiersMatchingIdentifierSet: returning nil [non-nil error] error=%{public}@", buf, 0xCu);
  }
  BOOL v11 = [v8 domain];
  int v12 = @"MPObjectDatabaseError";
  if (v11 == @"MPObjectDatabaseError")
  {
  }
  else
  {
    int v13 = [(__CFString *)v11 isEqual:@"MPObjectDatabaseError"];

    if (!v13) {
      goto LABEL_11;
    }
  }
  uint64_t v15 = [v8 code];

  if (v15 == 1)
  {
    BOOL v16 = [v8 userInfo];
    BOOL v11 = [v16 objectForKeyedSubscript:@"MissingPropertySetMappingEntityType"];

    id v17 = [v8 userInfo];
    id v18 = [v17 objectForKeyedSubscript:@"MissingPropertySetMappingRelationshipKey"];

    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MPServerObjectDatabase.m", 274, @"PropertySet does not contain mapping for identifierSet [] matchingEntityType='%@' relationshipKey=%@", v11, v18 object file lineNumber description];

LABEL_11:
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  int v12 = objc_alloc_init(MPMutablePropertySet);
  int v13 = [v10 relationships];

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __85__MPServerObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke;
  id v25 = &unk_1E57F5350;
  unint64_t v27 = a5;
  id v14 = v12;
  id v26 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:&v22];

  uint64_t v15 = -[MPServerObjectDatabase _modelObjectMatchingIdentifierSet:propertySet:error:](self, "_modelObjectMatchingIdentifierSet:propertySet:error:", v11, v14, a6, v22, v23, v24, v25);

  if (!v15) {
    goto LABEL_10;
  }
  if (a5)
  {
    uint64_t v16 = [v15 type];
    switch(v16)
    {
      case 9:
        id v17 = [v15 anyObject];
        char IsRestricted = MPModelMovieIsRestricted(v17);
        break;
      case 6:
        id v17 = [v15 anyObject];
        char IsRestricted = MPModelTVEpisodeIsRestricted(v17);
        break;
      case 1:
        id v17 = [v15 anyObject];
        char IsRestricted = [v17 isExplicitSong];
        break;
      default:
        goto LABEL_11;
    }
    char v19 = IsRestricted;

    if (v19)
    {
LABEL_10:
      id v20 = 0;
      goto LABEL_12;
    }
  }
LABEL_11:
  id v20 = [v15 identifiers];
LABEL_12:

  return v20;
}

void __85__MPServerObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
    goto LABEL_2;
  }
  if ([v5 isEqual:@"MPModelRelationshipGenericSong"])
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v16 = @"MPModelPropertySongExplicit";
    id v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v16;
LABEL_9:
    int v12 = objc_msgSend(v10, "arrayWithObjects:count:", v11, 1, v14, v15, v16, v17);
    int v13 = +[MPPropertySet propertySetWithProperties:v12];
    [v9 addRelationship:v5 properties:v13];

    goto LABEL_10;
  }
  if ([v5 isEqual:@"MPModelRelationshipGenericMovie"])
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v15 = @"MPModelPropertyMovieExplicitRating";
    id v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v15;
    goto LABEL_9;
  }
  if ([v5 isEqual:@"MPModelRelationshipGenericTVEpisode"])
  {
    id v9 = *(void **)(a1 + 32);
    id v14 = @"MPModelPropertyTVEpisodeExplicitRating";
    id v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v14;
    goto LABEL_9;
  }
LABEL_2:
  id v7 = *(void **)(a1 + 32);
  id v8 = +[MPPropertySet emptyPropertySet];
  [v7 addRelationship:v5 properties:v8];

LABEL_10:
}

- (id)importObjectsFromRequest:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v8);

  id v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = [v14 UTF8String];
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SODImportObjectsFromRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:string1, name=type}s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__35081;
  uint64_t v42 = __Block_byref_object_dispose__35082;
  id v43 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__35081;
  id v37 = __Block_byref_object_dispose__35082;
  id v38 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke;
  block[3] = &unk_1E57F5328;
  unint64_t v32 = a4;
  void block[4] = self;
  BOOL v30 = &v33;
  id v16 = v8;
  id v29 = v16;
  p_long long buf = &buf;
  dispatch_sync(accessQueue, block);
  if (a5)
  {
    uint64_t v17 = *(void **)(*((void *)&buf + 1) + 40);
    if (v17) {
      *a5 = v17;
    }
  }
  id v18 = self->_accessQueue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_2;
  v25[3] = &unk_1E57F9F48;
  v25[4] = self;
  unint64_t v27 = &buf;
  id v19 = v16;
  id v26 = v19;
  dispatch_async(v18, v25);
  id v20 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  id v21 = v20;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v21, OS_SIGNPOST_INTERVAL_END, v10, "SODImportObjectsFromRequest", (const char *)&unk_1956A9243, v24, 2u);
  }

  id v22 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);

  return v22;
}

void __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[_MPServerObjectDatabaseImporter initWithDatabase:]([_MPServerObjectDatabaseImporter alloc], *(void **)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    id v11 = 0;
    uint64_t v4 = [v3 performWithDatabaseOperations:v2 augmentingPayload:&v11];
    id v5 = v11;
  }
  else
  {
    uint64_t v4 = [v3 performWithDatabaseOperations:v2 augmentingPayload:0];
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  os_signpost_id_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_2(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  os_unfair_recursive_lock_unlock();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_3;
  block[3] = &unk_1E57F82D8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = v2;
  uint64_t v9 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          if (objc_opt_respondsToSelector()) {
            [v7 database:*(void *)(a1 + 40) didFailImportRequest:*(void *)(a1 + 48) withErrror:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v7, "database:didFinishImportRequest:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (void)setPrefersInMemoryDatabase:(BOOL)a3
{
  _MPServerObjectDatabasePrefersInMemoryDatabase = a3;
}

id __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F779F0]) initWithMemory];

  return v0;
}

+ (void)setXPCHostApplicationIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "SOD: setXPCHostApplicationIdentifier: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (_XPCHostApplicationIdentifier && (objc_msgSend(v5, "isEqualToString:") & 1) == 0)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MPServerObjectDatabase.m" lineNumber:79 description:@"XPCHostApplicationIdentifier is inconsistent"];
  }
  uint64_t v7 = [v5 copy];
  long long v8 = (void *)_XPCHostApplicationIdentifier;
  _XPCHostApplicationIdentifier = v7;
}

@end