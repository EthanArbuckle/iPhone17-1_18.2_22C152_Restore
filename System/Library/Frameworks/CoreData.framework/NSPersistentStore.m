@interface NSPersistentStore
+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6;
+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)doURLStuff:(id)a3 createdStubFile:(BOOL *)a4 readOnly:(BOOL *)a5 error:(id *)a6 options:(id)a7;
+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreWithURL:(NSURL *)url error:(NSError *)error;
+ (Class)migrationManagerClass;
+ (Class)rowCacheClass;
+ (NSDictionary)metadataForPersistentStoreWithURL:(NSURL *)url error:(NSError *)error;
+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3;
+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)_hasActiveGenerations;
- (BOOL)_isCloudKitOptioned;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)_unload:(id *)a3;
- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4;
- (BOOL)isCloudKitEnabled;
- (BOOL)isReadOnly;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(NSError *)error;
- (BOOL)supportsConcurrentRequestHandling;
- (BOOL)supportsGenerationalQuerying;
- (Class)_objectIDClass;
- (NSCoreDataCoreSpotlightDelegate)coreSpotlightExporter;
- (NSDictionary)metadata;
- (NSDictionary)options;
- (NSPersistentStore)init;
- (NSPersistentStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)root configurationName:(NSString *)name URL:(NSURL *)url options:(NSDictionary *)options;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)configurationName;
- (NSString)identifier;
- (NSString)type;
- (NSURL)URL;
- (_BYTE)_updateMetadata;
- (__CFSet)_entitiesForConfiguration;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_persistentStoreCoordinator;
- (id)_rawMetadata__;
- (id)_storeInfoForEntityDescription:(id)a3;
- (id)_updatedMetadataWithSeed:(id)a3 includeVersioning:(BOOL)a4;
- (id)ancillaryModels;
- (id)currentChangeToken;
- (id)currentQueryGeneration;
- (id)description;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)mirroringDelegate;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)objectIDFactoryForEntity:(id)a3;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3;
- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)entityIDForEntityDescription:(id)a3;
- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3;
- (void)_preflightCrossCheck;
- (void)_resetObjectIDFactoriesForStoreUUIDChange;
- (void)_setMetadataDirty:(BOOL)a3;
- (void)dealloc;
- (void)doFilesystemCleanupOnRemove:(BOOL)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)setIdentifier:(NSString *)identifier;
- (void)setMetadata:(NSDictionary *)metadata;
- (void)setReadOnly:(BOOL)readOnly;
- (void)setURL:(NSURL *)URL;
- (void)willRemoveFromPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator;
@end

@implementation NSPersistentStore

- (NSDictionary)options
{
  return self->_options;
}

- (id)objectIDFactoryForEntity:(id)a3
{
  if (!self->_oidFactories) {
    return 0;
  }
  if (![(NSPersistentStore *)self _persistentStoreCoordinator])
  {
    id v12 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134098, @"objectIDFactoryForEntity invoked after store was removed", 0);
    objc_exception_throw(v12);
  }
  uint64_t v5 = _PFModelMapSlotForEntity((uint64_t)self->_modelMap, a3);
  if (v5 < 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"objectIDFactoryForEntity invoked before model was finalized" userInfo:0]);
  }
  uint64_t v6 = v5;
  v7 = (objc_class *)atomic_load((unint64_t *)&self->_oidFactories[v5]);
  if (!v7)
  {
    v8 = [(objc_class *)[(NSPersistentStore *)self _objectIDClass] classWithStore:self andEntity:a3];
    v7 = v8;
    uint64_t v9 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_oidFactories[v6], (unint64_t *)&v9, (unint64_t)v8);
    if (v9)
    {
      v11 = (objc_class *)atomic_load((unint64_t *)&self->_oidFactories[v6]);
      if (v8 != v11)
      {
        [(objc_class *)v8 _storeDeallocated];

        return v11;
      }
    }
    else
    {
      [a3 _addFactoryToRetainList:v8];
    }
  }
  return v7;
}

- (id)_persistentStoreCoordinator
{
  return (id)atomic_load((unint64_t *)&self->_coordinator);
}

- (BOOL)_isPersistentStoreAlive
{
  BOOL result = 0;
  if ([(NSPersistentStore *)self _persistentStoreCoordinator])
  {
    v3 = (void *)atomic_load((unint64_t *)&self->_coordinator);
    if (![v3 _isDeallocating]) {
      return 1;
    }
  }
  return result;
}

- (void)_setMetadataDirty:(BOOL)a3
{
}

+ (void)initialize
{
}

- (NSCoreDataCoreSpotlightDelegate)coreSpotlightExporter
{
  id v2 = self->_coreSpotlightDelegate;

  return (NSCoreDataCoreSpotlightDelegate *)v2;
}

- (BOOL)isReadOnly
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSString)configurationName
{
  if (self->_configurationName) {
    return self->_configurationName;
  }
  else {
    return (NSString *)@"PF_DEFAULT_CONFIGURATION_NAME";
  }
}

- (__CFSet)_entitiesForConfiguration
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  p_entitiesInConfiguration = (unint64_t *)&self->_entitiesInConfiguration;
  if (atomic_load((unint64_t *)&self->_entitiesInConfiguration)) {
    return (__CFSet *)atomic_load(p_entitiesInConfiguration);
  }
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  context = (void *)MEMORY[0x18C127630]();
  uint64_t v6 = objc_msgSend(self->_managedObjectModel, "entitiesForConfiguration:", -[NSPersistentStore configurationName](self, "configurationName"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        CFSetAddValue(Mutable, *(const void **)(*((void *)&v32 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }
  id v11 = [(NSPersistentStore *)self ancillaryModels];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)[v11 objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * v15)];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v25;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v25 != v19) {
                objc_enumerationMutation(v16);
              }
              CFSetAddValue(Mutable, *(const void **)(*((void *)&v24 + 1) + 8 * v20++));
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
          }
          while (v18);
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v13);
  }
  uint64_t v21 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_entitiesInConfiguration, (unint64_t *)&v21, (unint64_t)Mutable);
  if (v21)
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    p_entitiesInConfiguration = (unint64_t *)&self->_entitiesInConfiguration;
    return (__CFSet *)atomic_load(p_entitiesInConfiguration);
  }
  return Mutable;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStore;
  return (id)[NSString stringWithFormat:@"%@ (URL: %@)", -[NSPersistentStore description](&v3, sel_description), -[NSPersistentStore URL](self, "URL")];
}

- (void)_preflightCrossCheck
{
  objc_super v3 = [(NSPersistentStore *)self URL];
  if ([(NSURL *)v3 isFileURL]
    && ((__CFString *)[(NSPersistentStore *)self type] != @"SQLite"
     || (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, v3) & 1) == 0))
  {
    memset(&v27, 0, sizeof(v27));
    if (stat([(NSString *)[(NSURL *)v3 path] fileSystemRepresentation], &v27))
    {
      int v4 = *__error();
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v6 = *MEMORY[0x1E4F28798];
      uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = [(NSURL *)v3 path];
      uint64_t v9 = *MEMORY[0x1E4F28328];
      id v10 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, v4, objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E4F28328]));
      _NSCoreDataLog(1, @"Error opening store: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
      if (v4 != 20)
      {
        if (v4 == 13)
        {
          uint64_t v17 = 513;
        }
        else
        {
          if (v4 == 2) {
            goto LABEL_9;
          }
          uint64_t v17 = 512;
        }
LABEL_12:
        uint64_t v18 = *MEMORY[0x1E4F28A50];
        if (v10) {
          id v10 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:*MEMORY[0x1E4F28A50]];
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F281F8];
        id v21 = (id)[v19 initWithDomain:*MEMORY[0x1E4F281F8] code:v17 userInfo:v10];
        v22 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v23 = [(NSURL *)v3 path];
        uint64_t v24 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v21, v18, v23, v9, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", self), @"NSAffectedStoresErrorKey", 0);
        id v25 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v20 code:134030 userInfo:v24];
        id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"Could not write to file.", (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v25 forKey:@"NSCoreDataPrimaryError"]);
        objc_exception_throw(v26);
      }
LABEL_9:
      uint64_t v17 = 4;
      goto LABEL_12;
    }
  }
}

- (NSURL)URL
{
  return self->_url;
}

- (NSPersistentStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)root configurationName:(NSString *)name URL:(NSURL *)url options:(NSDictionary *)options
{
  self;
  objc_opt_class();
  objc_opt_class();
  v18.receiver = self;
  v18.super_class = (Class)NSPersistentStore;
  id v11 = [(NSPersistentStore *)&v18 init];
  if (v11)
  {
    *((unsigned char *)v11 + 56) = *((unsigned char *)v11 + 56) & 0xFE | objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"NSReadOnlyPersistentStoreOption"), "BOOLValue");
    atomic_store((unint64_t)root, (unint64_t *)v11 + 1);
    *((void *)v11 + 2) = [(NSString *)name copy];
    if (root) {
      modelMap = root->_modelMap;
    }
    else {
      modelMap = 0;
    }
    uint64_t v13 = modelMap;
    *((void *)v11 + 12) = v13;
    if (v13) {
      unint64_t entityCount = v13->_entityCount;
    }
    else {
      unint64_t entityCount = 0;
    }
    uint64_t v15 = (unint64_t *)PF_CALLOC_OBJECT_ARRAY(entityCount + 1);
    *((void *)v11 + 5) = v15;
    atomic_store((unint64_t)v11, &v15[entityCount]);
    *((void *)v11 + 3) = url;
    if (url) {
      CFRetain(url);
    }
    *((void *)v11 + 4) = [(NSDictionary *)options copy];
    atomic_store(0, (unsigned __int8 *)v11 + 61);
    *((void *)v11 + 10) = [(NSPersistentStoreCoordinator *)root managedObjectModel];
    *((void *)v11 + 9) = [(NSDictionary *)options objectForKey:@"NSCoreDataCoreSpotlightExporter"];
    id v16 = objc_alloc((Class)objc_opt_class());
    *((void *)v11 + 6) = -[NSFaultHandler initWithPersistenceStore:](v16);
  }
  return (NSPersistentStore *)v11;
}

+ (BOOL)doURLStuff:(id)a3 createdStubFile:(BOOL *)a4 readOnly:(BOOL *)a5 error:(id *)a6 options:(id)a7
{
  if (!a3 || ![a3 isFileURL]) {
    return 1;
  }
  uint64_t v12 = (void *)[a3 path];
  uint64_t v13 = (char *)[v12 fileSystemRepresentation];
  uint64_t v14 = (void *)[a7 valueForKey:@"NSReadOnlyPersistentStoreOption"];
  uint64_t v15 = v14;
  if (v14)
  {
    int v16 = [v14 BOOLValue];
    int v17 = [v15 BOOLValue] ^ 1;
  }
  else
  {
    int v16 = 0;
    int v17 = 0;
  }
  uint64_t v18 = [a7 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  if (v18)
  {
    if ([(id)*MEMORY[0x1E4F28378] isEqualToString:v18])
    {
      LODWORD(v18) = 4;
    }
    else if ([(id)*MEMORY[0x1E4F28358] isEqualToString:v18])
    {
      LODWORD(v18) = 3;
    }
    else if ([(id)*MEMORY[0x1E4F28348] isEqualToString:v18])
    {
      LODWORD(v18) = 2;
    }
    else if ([(id)*MEMORY[0x1E4F28340] isEqualToString:v18])
    {
      LODWORD(v18) = 1;
    }
    else if ([(id)*MEMORY[0x1E4F28368] isEqualToString:v18])
    {
      LODWORD(v18) = 7;
    }
    else
    {
      _NSCoreDataLog(1, @"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey", v19, v20, v21, v22, v23, v24, v18);
      LODWORD(v18) = 0;
    }
  }
  if (access(v13, 4))
  {
    uint64_t v25 = *__error();
    if (v25 != 2)
    {
      if (v25 == 20)
      {
        if (a6)
        {
          v36 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v37 = *MEMORY[0x1E4F281F8];
          v38 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v39 = [NSString stringWithFormat:@"Component of path %@ is not a directory", v12];
          uint64_t v28 = objc_msgSend(v38, "dictionaryWithObjectsAndKeys:", v39, @"reason", v12, *MEMORY[0x1E4F28328], 0);
          long long v29 = v36;
          uint64_t v30 = v37;
          uint64_t v31 = 258;
          goto LABEL_37;
        }
      }
      else if (v25 == 13)
      {
        if (a6)
        {
          id v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = *MEMORY[0x1E4F281F8];
          uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSString, "stringWithFormat:", @"No access to file; code = %d", 13),
                  @"reason");
          long long v29 = v26;
          uint64_t v30 = v27;
          uint64_t v31 = 257;
LABEL_37:
          *a6 = (id)[v29 errorWithDomain:v30 code:v31 userInfo:v28];
          goto LABEL_38;
        }
      }
      else if (a6)
      {
        v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F281F8];
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"Unknown failure to access file: %d", v25), @"reason" forKey];
        long long v29 = v40;
        uint64_t v30 = v41;
        uint64_t v31 = 256;
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    if (v16)
    {
      if (!a6) {
        return 0;
      }
      BOOL v32 = 0;
      *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 260, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSString, "stringWithFormat:", @"Attempt to open missing file read only; code = %d",
                      2),
                    @"reason"));
      return v32;
    }
    int v43 = _PFCeateStubFileAtPath(v13, v18);
    if ((v43 & 0x80000000) == 0)
    {
      close(v43);
      BOOL v32 = 1;
      *a4 = 1;
      return v32;
    }
    if (!a6)
    {
LABEL_60:
      +[_PFRoutines _logFileAccessDebugInformation:]((uint64_t)_PFRoutines, v13);
      +[_PFRoutines _logDirectoryAccessDebugInformation:]((uint64_t)_PFRoutines, (void *)[v12 stringByDeletingLastPathComponent]);
      return 0;
    }
    uint64_t v44 = *__error();
    if ((int)v44 > 12)
    {
      if (v44 != 13)
      {
        if (v44 == 17)
        {
          v45 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v46 = *MEMORY[0x1E4F281F8];
          v49 = (void *)MEMORY[0x1E4F1C9E8];
          v50 = @"File unexpectedly appeared during sanity check";
LABEL_58:
          uint64_t v55 = [v49 dictionaryWithObject:v50 forKey:@"reason"];
          v56 = v45;
          uint64_t v57 = v46;
          uint64_t v58 = 512;
          goto LABEL_59;
        }
        goto LABEL_56;
      }
      v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F281F8];
      v53 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v54 = objc_msgSend(NSString, "stringWithFormat:", @"No access to create file; code = %d", 13);
    }
    else
    {
      if (v44 != 1)
      {
        if (v44 == 2)
        {
          v45 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v46 = *MEMORY[0x1E4F281F8];
          v47 = (void *)MEMORY[0x1E4F1C9E8];
          v48 = NSString;
          uint64_t v44 = 2;
LABEL_57:
          v50 = (__CFString *)objc_msgSend(v48, "stringWithFormat:", @"Failed to create file; code = %d", v44);
          v49 = v47;
          goto LABEL_58;
        }
LABEL_56:
        v45 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F281F8];
        v47 = (void *)MEMORY[0x1E4F1C9E8];
        v48 = NSString;
        goto LABEL_57;
      }
      v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F281F8];
      v53 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v54 = objc_msgSend(NSString, "stringWithFormat:", @"No permissions to create file; code = %d",
              1);
    }
    uint64_t v55 = [v53 dictionaryWithObject:v54 forKey:@"reason"];
    v56 = v51;
    uint64_t v57 = v52;
    uint64_t v58 = 513;
LABEL_59:
    *a6 = (id)[v56 errorWithDomain:v57 code:v58 userInfo:v55];
    goto LABEL_60;
  }
  if (!v17)
  {
    if (!v15)
    {
      BOOL v32 = 1;
      if (access(v13, 2))
      {
        *a5 = 1;
        +[_PFRoutines _logFileAccessDebugInformation:]((uint64_t)_PFRoutines, v13);
      }
      return v32;
    }
    return 1;
  }
  BOOL v32 = 1;
  if (access(v13, 2))
  {
    uint64_t v33 = *__error();
    *a5 = 1;
    if (a6)
    {
      long long v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F281F8];
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"No write permissions to file: %d", v33), @"reason" forKey];
      long long v29 = v34;
      uint64_t v30 = v35;
      uint64_t v31 = 513;
      goto LABEL_37;
    }
LABEL_38:
    +[_PFRoutines _logFileAccessDebugInformation:]((uint64_t)_PFRoutines, v13);
    return 0;
  }
  return v32;
}

+ (Class)rowCacheClass
{
  return (Class)objc_opt_class();
}

- (_BYTE)_updateMetadata
{
  if (result)
  {
    v1 = result;
    if ((result[56] & 1) == 0)
    {
      uint64_t v2 = objc_msgSend(result, "_updatedMetadataWithSeed:includeVersioning:", objc_msgSend(result, "metadata"), 1);
      return (unsigned char *)[v1 setMetadata:v2];
    }
  }
  return result;
}

- (id)_updatedMetadataWithSeed:(id)a3 includeVersioning:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)[a3 mutableCopy];
  if (!v7) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  }
  uint64_t v8 = [(NSPersistentStore *)self type];
  if (v8 || (uint64_t v8 = (NSString *)[a3 objectForKey:@"NSStoreType"]) != 0) {
    [v7 setObject:v8 forKey:@"NSStoreType"];
  }
  uint64_t v9 = (NSString *)[a3 objectForKey:@"NSStoreUUID"];
  if (!v9)
  {
    uint64_t v9 = [(NSPersistentStore *)self identifier];
    if (!v9) {
      uint64_t v9 = (NSString *)+[_PFRoutines _getUUID]();
    }
  }
  [v7 setObject:v9 forKey:@"NSStoreUUID"];
  if (v4)
  {
    [v7 setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x1ED796A20];
    BOOL v10 = [(NSString *)[(NSPersistentStore *)self type] isEqualToString:@"SQLite"]
       || [(NSString *)[(NSPersistentStore *)self type] isEqualToString:@"Binary"];
    int v11 = v10 | [(NSString *)[(NSPersistentStore *)self type] isEqualToString:@"NSXPCStore"];
    id v12 = [(NSPersistentStore *)self _persistentStoreCoordinator];
    if (v12)
    {
      uint64_t v13 = (void *)[v12 managedObjectModel];
      uint64_t v14 = (void *)[v13 entityVersionHashesByName];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 3), 0x1ED796A00);
      [v7 setObject:v14 forKey:@"NSStoreModelVersionHashes"];
      if (v13) {
        uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "versionIdentifiers"), "allObjects");
      }
      else {
        uint64_t v15 = 0;
      }
      [v7 setObject:v15 forKey:@"NSStoreModelVersionIdentifiers"];
      if (v11) {
        objc_msgSend(v7, "setObject:forKey:", -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v13, v14), 0x1ED796400);
      }
      uint64_t v16 = [v13 versionChecksum];
      int v17 = @"NSStoreModelVersionChecksumKey";
      uint64_t v18 = v7;
      goto LABEL_19;
    }
    if (![v7 objectForKey:0x1ED796A00])
    {
      id v19 = [(NSDictionary *)[(NSPersistentStore *)self metadata] objectForKey:0x1ED796A00];
      if (v19) {
        [v7 setObject:v19 forKey:0x1ED796A00];
      }
    }
    if (![v7 objectForKey:@"NSStoreModelVersionHashes"])
    {
      id v20 = [(NSDictionary *)[(NSPersistentStore *)self metadata] objectForKey:@"NSStoreModelVersionHashes"];
      if (v20) {
        [v7 setObject:v20 forKey:@"NSStoreModelVersionHashes"];
      }
    }
    if (![v7 objectForKey:0x1ED796400])
    {
      if (v11)
      {
        id v21 = [(NSDictionary *)[(NSPersistentStore *)self metadata] objectForKey:0x1ED796400];
        if (v21) {
          [v7 setObject:v21 forKey:0x1ED796400];
        }
      }
    }
    if (![v7 objectForKey:@"NSStoreModelVersionChecksumKey"])
    {
      objc_opt_class();
      uint64_t v22 = (objc_opt_isKindOfClass() & 1) != 0
          ? (NSDictionary *)[(NSPersistentStore *)self _rawMetadata]
          : [(NSPersistentStore *)self metadata];
      uint64_t v23 = [(NSDictionary *)v22 objectForKey:@"NSStoreModelVersionChecksumKey"];
      if (v23) {
        [v7 setObject:v23 forKey:@"NSStoreModelVersionChecksumKey"];
      }
    }
    if (![v7 objectForKey:@"NSStoreModelVersionIdentifiers"])
    {
      id v25 = [(NSDictionary *)[(NSPersistentStore *)self metadata] objectForKey:@"NSStoreModelVersionIdentifiers"];
      if (v25)
      {
        uint64_t v16 = (uint64_t)v25;
        uint64_t v18 = v7;
        int v17 = @"NSStoreModelVersionIdentifiers";
LABEL_19:
        [v18 setObject:v16 forKey:v17];
      }
    }
  }

  return v7;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  p_coordinator = (unint64_t *)&self->_coordinator;
  objc_super v3 = (void *)atomic_load((unint64_t *)&self->_coordinator);
  if ([v3 _isDeallocating]) {
    return 0;
  }
  id v5 = (void *)atomic_load(p_coordinator);
  id v6 = v5;

  return (NSPersistentStoreCoordinator *)v6;
}

- (NSString)identifier
{
  objc_super v3 = [(NSDictionary *)[(NSPersistentStore *)self metadata] objectForKey:@"NSStoreUUID"];
  if (!v3)
  {
    objc_super v3 = (NSString *)+[_PFRoutines _getUUID]();
    [(NSPersistentStore *)self setIdentifier:v3];
  }
  return v3;
}

- (BOOL)isCloudKitEnabled
{
  id v2 = [(NSPersistentStore *)self mirroringDelegate];
  if (v2)
  {
    objc_opt_class();
    LOBYTE(v2) = objc_opt_isKindOfClass();
  }
  return v2 & 1;
}

- (id)mirroringDelegate
{
  id v2 = [(NSDictionary *)[(NSPersistentStore *)self options] objectForKey:@"NSPersistentStoreMirroringOptionsKey"];

  return (id)[v2 objectForKey:@"NSPersistentStoreMirroringDelegateOptionKey"];
}

- (void)doFilesystemCleanupOnRemove:(BOOL)a3
{
}

- (void)dealloc
{
  p_entitiesInConfiguration = (unint64_t *)&self->_entitiesInConfiguration;
  if (atomic_load((unint64_t *)&self->_entitiesInConfiguration))
  {
    id v5 = (const void *)atomic_load(p_entitiesInConfiguration);
    CFRelease(v5);
    atomic_store(0, p_entitiesInConfiguration);
  }
  oidFactories = (unint64_t *)self->_oidFactories;
  if (oidFactories)
  {
    uint64_t v7 = (NSPersistentStore *)atomic_load(oidFactories);
    if (v7 != self)
    {
      uint64_t v8 = 0;
      do
      {
        uint64_t v9 = (void *)atomic_load((unint64_t *)&self->_oidFactories[v8]);
        [v9 _storeDeallocated];
        BOOL v10 = (NSPersistentStore *)atomic_load((unint64_t *)&self->_oidFactories[++v8]);
      }
      while (v10 != self);
    }
  }
  temporaryIDClass = self->_temporaryIDClass;
  if (temporaryIDClass)
  {
    [temporaryIDClass _storeDeallocated];

    self->_temporaryIDClass = 0;
  }

  self->_modelMap = 0;
  atomic_store(0, (unint64_t *)&self->_coordinator);
  self->_configurationName = 0;
  id v12 = (unint64_t *)self->_oidFactories;
  if (v12)
  {
    uint64_t v13 = (NSPersistentStore *)atomic_load(v12);
    if (v13 != self)
    {
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = (const void *)atomic_load((unint64_t *)&self->_oidFactories[v14]);
        if (v15) {
          CFRelease(v15);
        }
        atomic_store(0, (unint64_t *)&self->_oidFactories[v14]);
        uint64_t v16 = (NSPersistentStore *)atomic_load((unint64_t *)&self->_oidFactories[++v14]);
      }
      while (v16 != self);
    }
    PF_FREE_OBJECT_ARRAY(self->_oidFactories);
    self->_oidFactories = 0;
  }
  self->_defaultFaultHandler = 0;
  self->_coreSpotlightDelegate = 0;
  self->_url = 0;
  self->_options = 0;

  v17.receiver = self;
  v17.super_class = (Class)NSPersistentStore;
  [(NSPersistentStore *)&v17 dealloc];
}

- (BOOL)_unload:(id *)a3
{
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_cleanOnRemove);
  id v6 = [(NSURL *)self->_url path];
  if ((v5 & 1) == 0) {
    goto LABEL_7;
  }
  if (!self->_url)
  {
    BOOL result = 0;
    goto LABEL_9;
  }
  uint64_t v7 = v6;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v6))
  {
    BOOL result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", -[NSURL path](self->_url, "path"), a3);
    if (a3 && !result)
    {
      uint64_t v9 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSString, "stringWithFormat:", @"Unable to unload store file because file at path '%@' could not be removed", v7), @"reason", 0) code userInfo];
      BOOL result = 0;
      *a3 = v9;
    }
  }
  else
  {
LABEL_7:
    BOOL result = 1;
  }
LABEL_9:
  atomic_store(0, (unint64_t *)&self->_coordinator);
  return result;
}

- (void)willRemoveFromPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator
{
  coreSpotlightDelegate = (unsigned __int8 *)self->_coreSpotlightDelegate;
  if (coreSpotlightDelegate)
  {
    atomic_store(0, coreSpotlightDelegate + 72);
    unsigned __int8 v5 = (void *)*((void *)coreSpotlightDelegate + 4);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__NSCoreDataCoreSpotlightDelegate__invalidate__block_invoke;
    v6[3] = &unk_1E544B868;
    v6[4] = coreSpotlightDelegate;
    [v5 performBlock:v6];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", coordinator), "postNotificationName:object:userInfo:", @"NSPersistentStoreCoordinatorWillRemoveStoreNotification", self, 0);

  [(NSPersistentStore *)self _unload:0];
}

- (NSPersistentStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStore;
  return [(NSPersistentStore *)&v3 init];
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (NSDictionary)metadataForPersistentStoreWithURL:(NSURL *)url error:(NSError *)error
{
  return 0;
}

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreWithURL:(NSURL *)url error:(NSError *)error
{
  if ((id)objc_opt_class() == a1)
  {
    return +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)metadata, 0, url, 0, error);
  }
  else if ([(NSURL *)url isFileURL])
  {
    uint64_t v8 = [(NSURL *)url path];
    BOOL result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isWritableFileAtPath:", v8);
    if (error)
    {
      if (!result)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        int v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", url, *MEMORY[0x1E4F289D0], 0);
        *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:v11];

        return 0;
      }
    }
  }
  else
  {
    return 1;
  }
  return result;
}

- (void)setReadOnly:(BOOL)readOnly
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | readOnly;
}

- (void)setURL:(NSURL *)URL
{
  [(NSPersistentStore *)self _setMetadataDirty:1];
  unsigned __int8 v5 = self->_url;
  if (v5 != URL)
  {
    if (v5) {
      CFRelease(v5);
    }
    self->_url = URL;
    if (URL)
    {
      CFRetain(URL);
    }
  }
}

- (void)setIdentifier:(NSString *)identifier
{
  unsigned __int8 v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NSPersistentStore metadata](self, "metadata"));
  id v6 = v5;
  if (identifier) {
    [v5 setObject:identifier forKey:@"NSStoreUUID"];
  }
  else {
    [v5 removeObjectForKey:@"NSStoreUUID"];
  }

  [(NSPersistentStore *)self setMetadata:v6];
}

- (NSDictionary)metadata
{
  return 0;
}

- (void)setMetadata:(NSDictionary *)metadata
{
  unsigned __int8 v5 = (NSDictionary *)[(NSPersistentStore *)self _rawMetadata];
  if (v5 != metadata && ([(NSDictionary *)metadata isEqual:v5] & 1) == 0)
  {
    [(NSPersistentStore *)self _setMetadataDirty:1];
  }
}

- (NSString)type
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)loadMetadata:(NSError *)error
{
  return 1;
}

+ (Class)migrationManagerClass
{
  return (Class)objc_opt_class();
}

- (id)_rawMetadata__
{
  return 0;
}

+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7
{
  if (!a5) {
    return 0;
  }
  int v11 = objc_msgSend(a5, "isFileURL", a3, a4);
  BOOL v12 = 0;
  if (!a3 || !v11) {
    return v12;
  }
  if (![a3 isFileURL]) {
    return 0;
  }
  uint64_t v13 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation");
  uint64_t v14 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a5, "path"), "fileSystemRepresentation");
  uint64_t v15 = (void *)[a6 objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
  if (v15 && [v15 BOOLValue])
  {
    rename(v14, v13, v16);
    if (v17)
    {
      uint64_t v18 = *__error();
      BOOL v12 = v18 == 2;
      if (a7 && v18 != 2)
      {
        id v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F28798];
        id v21 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(a5, "path"), objc_msgSend(a3, "path"), 0);
        uint64_t v23 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v18, objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v22, *MEMORY[0x1E4F28328], 0));
        BOOL v12 = 0;
        *a7 = v23;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    id v25 = copyfile_state_alloc();
    if (copyfile((const char *)v14, (const char *)v13, v25, 0xFu))
    {
      uint64_t v26 = *__error();
      BOOL v12 = v26 == 2;
      if (a7 && v26 != 2)
      {
        uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28798];
        long long v29 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_msgSend(a5, "path"), objc_msgSend(a3, "path"), 0);
        uint64_t v31 = objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v26, objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v30, *MEMORY[0x1E4F28328], 0));
        BOOL v12 = 0;
        *a7 = v31;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
    copyfile_state_free(v25);
  }
  return v12;
}

+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a3)
  {
    int v7 = [a3 isFileURL];
    if (v7)
    {
      if (unlink((const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation")))
      {
        uint64_t v8 = *__error();
        LOBYTE(v7) = v8 == 2;
        if (a5 && v8 != 2)
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v10 = *MEMORY[0x1E4F28798];
          int v11 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v12 = [a3 path];
          uint64_t v13 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v8, objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, *MEMORY[0x1E4F28328], 0));
          LOBYTE(v7) = 0;
          *a5 = v13;
        }
      }
      else
      {
        LOBYTE(v7) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Store does not support encryption", a4, a5, *MEMORY[0x1E4F28568], 0));
  }
  return 0;
}

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (BOOL)load:(id *)a3
{
  BOOL v4 = [(NSPersistentStore *)self identifier];
  oidFactories = (unint64_t *)self->_oidFactories;
  if (oidFactories)
  {
    id v6 = (NSPersistentStore *)atomic_load(oidFactories);
    if (v6 != self)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = (void *)atomic_load((unint64_t *)&self->_oidFactories[v7]);
        [v8 setObjectStoreIdentifier:v4];
        uint64_t v9 = (NSPersistentStore *)atomic_load((unint64_t *)&self->_oidFactories[++v7]);
      }
      while (v9 != self);
    }
  }
  temporaryIDClass = self->_temporaryIDClass;
  if (temporaryIDClass) {
    [temporaryIDClass setObjectStoreIdentifier:v4];
  }
  return 1;
}

- (void)_resetObjectIDFactoriesForStoreUUIDChange
{
  if (a1)
  {
    id v2 = *(unint64_t **)(a1 + 40);
    if (v2)
    {
      unint64_t v3 = atomic_load(v2);
      if (v3 != a1)
      {
        uint64_t v4 = 0;
        do
        {
          unsigned __int8 v5 = (void *)atomic_load((unint64_t *)(*(void *)(a1 + 40) + v4));
          if (v5)
          {
            [v5 _storeDeallocated];
            CFRelease(v5);
          }
          atomic_store(0, (unint64_t *)(*(void *)(a1 + 40) + v4));
          unint64_t v6 = atomic_load((unint64_t *)(*(void *)(a1 + 40) + v4 + 8));
          v4 += 8;
        }
        while (v6 != a1);
      }
    }
  }
}

+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3
{
  return 0;
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  return 0;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_isCloudKitOptioned
{
  return 0;
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return 0;
}

+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  return +[NSSQLCore cachedModelForPersistentStoreWithURL:a3 options:a4 error:a5];
}

- (unint64_t)entityIDForEntityDescription:(id)a3
{
  return 0;
}

- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3
{
  return (id)NSArray_EmptyArray;
}

- (BOOL)supportsConcurrentRequestHandling
{
  return 0;
}

- (BOOL)supportsGenerationalQuerying
{
  return 0;
}

- (BOOL)_hasActiveGenerations
{
  return 0;
}

- (id)currentQueryGeneration
{
  if (!currentQueryGeneration_token)
  {
    id v2 = -[_NSQueryGenerationToken initForNonGenerationalStore:]([_NSQueryGenerationToken alloc], self);
    uint64_t v3 = 0;
    atomic_compare_exchange_strong(&currentQueryGeneration_token, (unint64_t *)&v3, (unint64_t)v2);
    if (v3) {
  }
    }
  id v4 = (id)currentQueryGeneration_token;

  return v4;
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  if (!+[_NSQueryGenerationToken identifierIsForNonGenerationalStore:]((uint64_t)_NSQueryGenerationToken, (uint64_t)a3))return 0; {

  }
  return [(NSPersistentStore *)self currentQueryGeneration];
}

- (id)currentChangeToken
{
  return 0;
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E2028];
  }
  return 0;
}

- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4
{
  return 1;
}

- (id)ancillaryModels
{
  return 0;
}

@end