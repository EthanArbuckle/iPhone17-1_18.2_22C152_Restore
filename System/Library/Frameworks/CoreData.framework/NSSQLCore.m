@interface NSSQLCore
+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6;
+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7;
+ (BOOL)coloredLoggingDefault;
+ (BOOL)dropPersistentHistoryforPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (BOOL)trackSQLiteDatabaseStatistics;
+ (BOOL)useConcurrentFetching;
+ (Class)migrationManagerClass;
+ (Class)rowCacheClass;
+ (id)_databaseKeyFromValue:(uint64_t)a1;
+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3;
+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)databaseKeyFromOptionsDictionary:(uint64_t)a1;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (int)debugDefault;
+ (int64_t)bufferedAllocationsOverride;
+ (uint64_t)sanityCheckFileAtURL:(void *)a3 options:(uint64_t *)a4 error:;
+ (void)initialize;
+ (void)setColoredLoggingDefault:(BOOL)a3;
+ (void)setDebugDefault:(int)a3;
+ (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3;
- (BOOL)_hasActiveGenerations;
- (BOOL)_initializeQueryGenerationTrackingConnection;
- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)_unload:(id *)a3;
- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4;
- (BOOL)hasAncillaryModels;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(id *)a3;
- (BOOL)supportsConcurrentRequestHandling;
- (BOOL)supportsGenerationalQuerying;
- (Class)_objectIDClass;
- (Class)objectIDFactoryForEntity:(id)a3;
- (Class)objectIDFactoryForPersistentHistoryEntity:(id)a3;
- (Class)objectIDFactoryForSQLEntity:(id)a3;
- (NSDictionary)ancillaryModels;
- (NSError)_newRowDataForXPCFetch:(void *)a3 variables:(uint64_t)a4 context:(NSError *)a5 error:;
- (NSError)_newValuesForRelationship:(void *)a3 forObjectWithID:(void *)a4 withContext:(NSError *)a5 error:;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSSQLCore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (NSSQLModel)model;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_newObjectIDForEntity:(id)a3 referenceData64:(unint64_t)a4;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_newReservedKeysForEntities:(void *)a3 counts:;
- (id)_rebuildDerivedAttributeTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:;
- (id)_storeInfoForEntityDescription:(id)a3;
- (id)adapter;
- (id)allPeerRanges;
- (id)ancillarySQLModels;
- (id)cachedModelWithError:(id)result;
- (id)connectionForMigration;
- (id)createMapOfEntityNameToPKMaxForEntities:(id)a3;
- (id)currentChangeToken;
- (id)currentQueryGeneration;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)externalDataReferencesDirectory;
- (id)fetchUbiquityKnowledgeVector;
- (id)fileBackedFuturesDirectory;
- (id)harvestIndexStatisticsFromConnections;
- (id)identifier;
- (id)metadata;
- (id)metadataToWrite;
- (id)newFetchUUIDSForSubentitiesRootedAt:(void *)a1;
- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4;
- (id)newObjectIDSetsForToManyPrefetchingRequest:(uint64_t)a3 andSourceObjectIDs:(uint64_t)a4 orderColumnName:;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3;
- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4;
- (id)type;
- (id)ubiquityTableValueForKey:(void *)a1;
- (uint64_t)_disconnectAllConnections;
- (uint64_t)_obtainPermanentIDsForObjects:(uint64_t)result withNotification:(void *)a2 error:(void *)a3;
- (uint64_t)_rebuildTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:(id *)a3;
- (uint64_t)_refreshTriggerValues:(uint64_t)a1;
- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1;
- (uint64_t)_ubiquityDictionaryForAttribute:(void *)a3 onObject:;
- (uint64_t)entityForObjectID:(uint64_t)result;
- (uint64_t)newForeignKeyID:(void *)a1 entity:(uint64_t)a2;
- (uint64_t)safeguardLocationForFileWithUUID:(unint64_t *)a1;
- (unint64_t)entityIDForEntityDescription:(id)a3;
- (void)_cacheRows:(void *)result;
- (void)_initializeQueryGenerationConnectionForProtectionClasses;
- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3;
- (void)_postChangeNotificationWithTransactionID:(uint64_t)a1;
- (void)_rebuildIndiciesSynchronously:(BOOL)a3;
- (void)_setHasAncillaryModels:(BOOL)a3;
- (void)_setMetadata:(int)a3 clean:;
- (void)_setupHistoryModelForPSC:(void *)a3 withExcludedEntityNames:;
- (void)_setupObserver:(id)a3;
- (void)_supportDirectoryPath;
- (void)_uncacheRows:(void *)result;
- (void)_updateAutoVacuumMetadataWithValues:(unsigned __int8 *)a1;
- (void)_updateToVersion640PrimaryKeyTableUsingStatements:(void *)a3 connection:;
- (void)_useModel:(id *)a1;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)addPeerRange:(uint64_t)a1;
- (void)dealloc;
- (void)dispatchRequest:(uint64_t)a3 withRetries:;
- (void)freeQueryGenerationWithIdentifier:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)recomputePrimaryKeyMaxForEntities:(void *)a1;
- (void)removeUbiquityMetadata;
- (void)replaceUbiquityKnowledgeVector:(uint64_t)a1;
- (void)resetExternalDataReferencesDirectories;
- (void)rowCacheForGeneration:(void *)result;
- (void)schemaValidationConnection;
- (void)setAncillaryModels:(id)a3;
- (void)setAncillarySQLModels:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setURL:(id)a3;
- (void)setUbiquityTableValue:(uint64_t)a3 forKey:;
- (void)supportsComplexFeatures;
- (void)updateUbiquityKnowledgeForPeerWithID:(uint64_t)a3 andTransactionNumber:;
- (void)updateUbiquityKnowledgeVector:(uint64_t)a1;
- (void)willRemoveFromPersistentStoreCoordinator:(id)a3;
@end

@implementation NSSQLCore

- (void)supportsComplexFeatures
{
  if (result)
  {
    v1 = result;
    result = (void *)[result _persistentStoreCoordinator];
    if (result)
    {
      if (objc_msgSend((id)objc_msgSend(v1, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey"))
      {
        return 0;
      }
      else
      {
        return (void *)(objc_msgSend((id)objc_msgSend(v1, "options"), "objectForKey:", @"NSXPCStoreDelegate") == 0);
      }
    }
  }
  return result;
}

- (Class)objectIDFactoryForEntity:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLCore;
  id v5 = -[NSPersistentStore objectIDFactoryForEntity:](&v8, sel_objectIDFactoryForEntity_);
  if (![v5 _storeInfo1])
  {
    uint64_t v6 = 0;
    if (self && a3) {
      uint64_t v6 = _sqlCoreLookupSQLEntityForEntityDescription(self, a3);
    }
    [v5 _setStoreInfo1:v6];
  }
  return (Class)v5;
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return (id)_sqlCoreLookupSQLEntityForEntityDescription(self, a3);
}

- (NSSQLModel)model
{
  return self->_model;
}

- (uint64_t)newForeignKeyID:(void *)a1 entity:(uint64_t)a2
{
  if (!a1 || !a2) {
    return 0;
  }
  id v3 = objc_alloc((Class)objc_msgSend(a1, "objectIDFactoryForSQLEntity:"));

  return [v3 initWithPK64:a2];
}

- (Class)objectIDFactoryForSQLEntity:(id)a3
{
  return [(NSSQLCore *)self objectIDFactoryForEntity:*((void *)a3 + 3)];
}

- (id)ancillarySQLModels
{
  return self->_ancillarySQLModels;
}

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (id)adapter
{
  return self->_adapter;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if ([(NSPersistentStore *)self _persistentStoreCoordinator])
  {
    if ([a3 isTemporaryID]) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"cannot find data for a temporary oid: %@", a3), 0 reason userInfo]);
    }
    [a4 stalenessInterval];
    double v10 = v9;
    if (v9 <= 0.0) {
      double v11 = *(double *)&NSSQLDistantPastTimeInterval;
    }
    else {
      double v11 = CFAbsoluteTimeGetCurrent() - v9;
    }
    if (v10 == 0.0) {
      double v13 = *(double *)&NSSQLDistantFutureTimeInterval;
    }
    else {
      double v13 = v11;
    }
    if (self) {
      v14 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:](self, objc_msgSend(a4, "_queryGenerationToken", v11));
    }
    else {
      v14 = 0;
    }
    v15 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v14, a3, v13);
    if (v15)
    {
      v12 = v15;
      v16 = v15;
      return v12;
    }
    v17 = [[NSSQLObjectFaultRequestContext alloc] initWithObjectID:a3 context:a4 sqlCore:self];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v17, 0);
    v12 = (os_unfair_lock_s *)[(NSSQLStoreRequestContext *)v17 result];
    if (v12)
    {
LABEL_28:

      return v12;
    }
    if (v17)
    {
      exception = v17->super._exception;
      if (exception)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = exception;
          objc_exception_throw(exception);
        }
        if (a5)
        {
          v19 = (NSError *)[(NSException *)exception errorObjectWithUserInfo:0];
LABEL_27:
          v12 = 0;
          *a5 = v19;
          goto LABEL_28;
        }
LABEL_30:
        v12 = 0;
        goto LABEL_28;
      }
      if (!a5) {
        goto LABEL_30;
      }
      error = v17->super._error;
      if (error)
      {
        v19 = error;
        goto LABEL_27;
      }
    }
    else if (!a5)
    {
      goto LABEL_30;
    }
    v21 = (void *)MEMORY[0x1E4F28C58];
    v25 = @"objectID";
    v26[0] = a3;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v19 = (NSError *)[v21 errorWithDomain:*MEMORY[0x1E4F281F8] code:133000 userInfo:v22];
    goto LABEL_27;
  }
  return 0;
}

- (id)fileBackedFuturesDirectory
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  p_fileBackedFuturesPath = (unint64_t *)&self->_fileBackedFuturesPath;
  if (atomic_load((unint64_t *)&self->_fileBackedFuturesPath)) {
    goto LABEL_10;
  }
  if ((*((unsigned char *)&self->_sqlCoreFlags + 1) & 0x20) == 0)
  {
    id v5 = &stru_1ED787880;
    goto LABEL_8;
  }
  id v5 = (__CFString *)(id)[-[NSSQLCore _supportDirectoryPath](self) stringByAppendingPathComponent:@"_FBF"];
  uint64_t v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  char v28 = 0;
  if ([v6 fileExistsAtPath:v5 isDirectory:&v28])
  {
    if (!v28)
    {
      v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3B8];
      double v9 = @"Can't create fbf directory (file exists)";
      uint64_t v10 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v27 = 0;
    if (([v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v27] & 1) == 0)
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Fatal error creating file backed futures directory: %@ at path %@ with ui %@"];
      v15 = @"null";
      if (v27) {
        v16 = v27;
      }
      else {
        v16 = @"null";
      }
      [(__CFString *)v27 userInfo];
      _NSCoreDataLog(17, v14, v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        if (v27) {
          v15 = v27;
        }
        uint64_t v24 = [(__CFString *)v27 userInfo];
        *(_DWORD *)buf = 138412802;
        v30 = v15;
        __int16 v31 = 2112;
        v32 = v5;
        __int16 v33 = 2112;
        uint64_t v34 = v24;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Fatal error creating file backed futures directory: %@ at path %@ with ui %@", buf, 0x20u);
      }
      v25 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v26 = *MEMORY[0x1E4F1C3B8];
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v27 forKey:*MEMORY[0x1E4F28A50]];
      double v9 = @"Can't create support directory (can't create directory)";
      v7 = v25;
      uint64_t v8 = v26;
LABEL_22:
      objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:v10]);
    }
  }
LABEL_8:
  uint64_t v11 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_fileBackedFuturesPath, (unint64_t *)&v11, (unint64_t)v5);
  if (v11) {

  }
LABEL_10:
  unint64_t v12 = atomic_load(p_fileBackedFuturesPath);
  if ([&stru_1ED787880 isEqual:v12]) {
    return 0;
  }
  else {
    return (id)atomic_load((unint64_t *)&self->_fileBackedFuturesPath);
  }
}

- (id)externalDataReferencesDirectory
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_externalDataReferencesDirectory = (unint64_t *)&self->_externalDataReferencesDirectory;
  if (atomic_load((unint64_t *)&self->_externalDataReferencesDirectory)) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_sqlCoreFlags & 2) != 0)
  {
    id v5 = (__CFString *)(id)[-[NSSQLCore _supportDirectoryPath](self) stringByAppendingPathComponent:@"_EXTERNAL_DATA"];
    uint64_t v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    char v31 = 0;
    if ([v6 fileExistsAtPath:v5 isDirectory:&v31])
    {
      if (v31) {
        goto LABEL_8;
      }
      v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3B8];
      double v9 = @"Can't create external reference directory (file exists)";
      uint64_t v10 = 0;
    }
    else
    {
      v30 = 0;
      if ([v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v30]) {
        goto LABEL_8;
      }
      uint64_t v17 = [NSString stringWithUTF8String:"Fatal error creating external data directory: %@ at path %@ with ui %@"];
      uint64_t v18 = @"null";
      if (v30) {
        uint64_t v19 = v30;
      }
      else {
        uint64_t v19 = @"null";
      }
      [(__CFString *)v30 userInfo];
      _NSCoreDataLog(17, v17, v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      uint64_t v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        if (v30) {
          uint64_t v18 = v30;
        }
        uint64_t v27 = [(__CFString *)v30 userInfo];
        *(_DWORD *)buf = 138412802;
        __int16 v33 = v18;
        __int16 v34 = 2112;
        uint64_t v35 = v5;
        __int16 v36 = 2112;
        uint64_t v37 = v27;
        _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: Fatal error creating external data directory: %@ at path %@ with ui %@", buf, 0x20u);
      }
      char v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3B8];
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v30 forKey:*MEMORY[0x1E4F28A50]];
      double v9 = @"Can't create support directory (can't create directory)";
      v7 = v28;
      uint64_t v8 = v29;
    }
    objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:v10]);
  }
  id v5 = &stru_1ED787880;
LABEL_8:
  uint64_t v11 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_externalDataReferencesDirectory, (unint64_t *)&v11, (unint64_t)v5);
  if (v11) {

  }
  if ((*(unsigned char *)&self->_sqlCoreFlags & 0x80) != 0)
  {
    unint64_t v12 = atomic_load((unint64_t *)&self->_externalDataReferencesDirectory);
    if (([&stru_1ED787880 isEqual:v12] & 1) == 0)
    {
      id v13 = (id)objc_msgSend(-[_PFGarbageManager temporaryLinksDirectoryForStore:]((id *)+[_PFGarbageManager defaultInstance](_PFGarbageManager, "defaultInstance"), self), "path");
      uint64_t v14 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_externalDataLinksDirectory, (unint64_t *)&v14, (unint64_t)v13);
      if (v14) {
    }
      }
  }
LABEL_14:
  unint64_t v15 = atomic_load(p_externalDataReferencesDirectory);
  if ([&stru_1ED787880 isEqual:v15]) {
    return 0;
  }
  else {
    return (id)atomic_load((unint64_t *)&self->_externalDataReferencesDirectory);
  }
}

- (void)rowCacheForGeneration:(void *)result
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = result;
    result = (void *)result[17];
    if (result)
    {
      result = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)result, a2);
      if (!result)
      {
        uint64_t v4 = [NSString stringWithUTF8String:"generational row cache %p failed to return a value for store '%@' with token %@"];
        uint64_t v5 = v2[17];
        [v2 identifier];
        _NSCoreDataLog(17, v4, v6, v7, v8, v9, v10, v11, v5);
        unint64_t v12 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v13 = v2[17];
          *(_DWORD *)buf = 134218498;
          uint64_t v15 = v13;
          __int16 v16 = 2112;
          uint64_t v17 = [v2 identifier];
          __int16 v18 = 2112;
          uint64_t v19 = a2;
          _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: generational row cache %p failed to return a value for store '%@' with token %@", buf, 0x20u);
        }
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)supportsGenerationalQuerying
{
  unsigned int v3 = -[NSSQLCore supportsComplexFeatures](self);
  if (v3)
  {
    if (self) {
      LOBYTE(v3) = (*(_DWORD *)&self->_sqlCoreFlags & 0x4000) == 0;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

+ (BOOL)coloredLoggingDefault
{
  return _CoreData_SyntaxColoredLogging;
}

+ (BOOL)useConcurrentFetching
{
  return dword_1E9122F58 != 0;
}

+ (int)debugDefault
{
  return dword_1E9122F54;
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_generationalRowCache, a4);
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(a3);
            }
            -[NSPersistentStoreCache decrementRefCountForObjectID:](v6, *(const void **)(*((void *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          uint64_t v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)dispatchRequest:(uint64_t)a3 withRetries:
{
  if (a1)
  {
    [a2 executePrologue];
    if (a2)
    {
      if (a2[6]) {
        return;
      }
      BOOL v6 = a2[5] != 0;
      if (a3 < 0) {
        return;
      }
    }
    else
    {
      BOOL v6 = 0;
      if (a3 < 0) {
        return;
      }
    }
    if (!v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = a3 + 1;
      while ((-[NSSQLCoreDispatchManager routeStoreRequest:](*(void *)(a1 + 128), (uint64_t)a2) & 1) == 0
           && ![a2 result])
      {
        if (a2) {
          uint64_t v9 = (void *)a2[6];
        }
        else {
          uint64_t v9 = 0;
        }
        id v10 = v9;
        if (v10)
        {
          long long v12 = v10;
          if (!v7) {
            uint64_t v7 = v10;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (objc_opt_respondsToSelector()) {
              [v12 userInfo];
            }
            _NSCoreDataLog(1, @"SQLCore dispatchRequest: exception handling request: %@ , %@ with userInfo of %@", v13, v14, v15, v16, v17, v18, (uint64_t)a2);
          }
        }
        if (--v8 <= 0)
        {
          if (a2 && v7)
          {
            objc_setProperty_nonatomic(a2, v11, v7, 48);
          }
          return;
        }
      }
      [a2 executeEpilogue];
    }
  }
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v190 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 requestType];
  v175 = 0;
  uint64_t v172 = *MEMORY[0x1E4F281F8];
  int v7 = 4;
  while (1)
  {
    BOOL v8 = __OFSUB__(v7--, 1);
    if (v7 < 0 != v8) {
      break;
    }
    switch(v6)
    {
      case 1:
        if ([a3 resultType] == 4) {
          goto LABEL_5;
        }
        if (self)
        {
          v94 = [[NSSQLFetchRequestContext alloc] initWithRequest:a3 context:a4 sqlCore:self];
          id v95 = (id)[a4 _delegate];
          if (v95 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v95 managedObjectContext:a4 willExecuteFetchRequest:a3];
          }
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v94, 0);
          id v96 = [(NSSQLStoreRequestContext *)v94 result];
          if (v94) {
            v97 = v94->super._exception;
          }
          else {
            v97 = 0;
          }
          exception = v97;
          if (v94) {
            error = v94->super._error;
          }
          else {
            error = 0;
          }
          uint64_t v21 = error;
          if (v95 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v99 = [(NSSQLFetchRequestContext *)v94 fetchStatement];
            uint64_t v100 = [(NSSQLiteStatement *)v99 sqlString];
            uint64_t v101 = [(NSSQLiteStatement *)v99 bindVariables];
            if (v96) {
              uint64_t v102 = [v96 count];
            }
            else {
              uint64_t v102 = -1;
            }
            [v95 managedObjectContext:a4 didExecuteFetchRequest:a3 withSQLString:v100 bindVariables:v101 rowCount:v102];
          }

          if (v96)
          {
LABEL_171:
            uint64_t v21 = 0;
          }
          else
          {
            if (exception) {
              objc_exception_throw(exception);
            }
            if (!v21)
            {
              uint64_t v151 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
              _NSCoreDataLog(17, v151, v152, v153, v154, v155, v156, v157, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
              v158 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v187 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
                __int16 v188 = 1024;
                int v189 = 2689;
                _os_log_fault_impl(&dword_18AB82000, v158, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
              }
              goto LABEL_171;
            }
          }
          v30 = (NSPersistentCloudKitContainerEventResult *)v96;
          goto LABEL_175;
        }
        uint64_t v21 = 0;
        v30 = 0;
LABEL_175:
        v150 = (void *)[a3 _asyncResultHandle];
        if (v150 && [v150 _isCancelled])
        {
          uint64_t v21 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:v172 code:3072 userInfo:0];
          v30 = 0;
          int v7 = 0;
        }
        uint64_t v6 = 1;
        goto LABEL_197;
      case 2:
        if (!self)
        {
          uint64_t v21 = 0;
          v30 = 0;
          goto LABEL_82;
        }
        uint64_t v23 = [[NSSQLSaveChangesRequestContext alloc] initWithRequest:a3 context:a4 sqlCore:self];
        p_isa = (id *)&v23->super.super.isa;
        if (!v23)
        {
          savePlan = 0;
          BOOL v27 = 1;
          atomic_fetch_add(&self->_transactionInMemorySequence, 1u);
          atomic_load((unsigned int *)&self->_transactionInMemorySequence);
LABEL_31:
          id v29 = (id)NSArray_EmptyArray;
          goto LABEL_79;
        }
        savePlan = v23->_savePlan;
        atomic_fetch_add(&self->_transactionInMemorySequence, 1u);
        unsigned int v26 = atomic_load((unsigned int *)&self->_transactionInMemorySequence);
        BOOL v27 = savePlan == 0;
        if (savePlan) {
          atomic_store(v26, (unsigned int *)&savePlan->_transactionInMemorySequence);
        }
        if (!v23->_metadataToWrite)
        {
          char v28 = v23->_savePlan;
          if (!v28 || (*(unsigned char *)&v28->_flags & 2) == 0) {
            goto LABEL_31;
          }
        }
        -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v23, 0);
        id v67 = (id)[p_isa result];
        id v68 = p_isa[6];
        if (!v67 && v68) {
          objc_exception_throw(v68);
        }
        atomic_store(1u, (unsigned __int8 *)&self->_metadataIsClean);
        [(NSPersistentStore *)self _setMetadataDirty:0];
        id v29 = v67;
LABEL_79:
        [(NSPersistentStore *)self doFilesystemCleanupOnRemove:0];
        v69 = (void *)MEMORY[0x1E4F28EA0];
        v70 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v71 = [NSNumber numberWithInt:5];
        if (v27) {
          uint64_t v72 = 0;
        }
        else {
          uint64_t v72 = atomic_load((unsigned int *)&savePlan->_transactionInMemorySequence);
        }
        uint64_t v73 = objc_msgSend(v69, "notificationWithName:object:userInfo:", @"_NSSQLCoreTransactionStateChangeNotification", self, objc_msgSend(v70, "dictionaryWithObjectsAndKeys:", v71, @"_NSSQLCoreTransactionType", objc_msgSend(NSNumber, "numberWithInt:", v72), @"_NSSQLCoreTransientSequenceNumber", a4, @"_NSSQLCoreActiveSavingContext", 0));
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v73);

        v30 = (NSPersistentCloudKitContainerEventResult *)v29;
        uint64_t v21 = 0;
LABEL_82:
        uint64_t v6 = 2;
        goto LABEL_197;
      case 3:
LABEL_5:
        if (self)
        {
          if (_sqlCoreLookupSQLEntityForEntityDescription(self, (void *)[a3 entity]))
          {
            uint64_t v9 = (void *)[a3 predicate];
            if (v9) {
              [v9 minimalFormInContext:0];
            }
            id v10 = [(NSSQLFetchRequestContext *)[NSSQLCountRequestContext alloc] initWithRequest:a3 context:a4 sqlCore:self];
            -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v10, 0);
            id v11 = [(NSSQLStoreRequestContext *)v10 result];
            if (v10) {
              long long v12 = v10->super.super._exception;
            }
            else {
              long long v12 = 0;
            }
            uint64_t v13 = v12;

            if (!v11 && v13) {
              objc_exception_throw(v13);
            }
            uint64_t v14 = (NSPersistentCloudKitContainerEventResult *)v11;
          }
          else
          {
            uint64_t v14 = (NSPersistentCloudKitContainerEventResult *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithInt:", 0));
          }
          v30 = v14;
          uint64_t v21 = 0;
        }
        else
        {
          uint64_t v21 = 0;
          v30 = 0;
        }
        uint64_t v6 = 3;
        goto LABEL_197;
      case 4:
        uint64_t v21 = 0;
        if (self) {
          v30 = (NSPersistentCloudKitContainerEventResult *)NSArray_EmptyArray;
        }
        else {
          v30 = 0;
        }
        uint64_t v6 = 4;
        goto LABEL_197;
      case 5:
        if (self)
        {
          uint64_t v15 = [[NSSQLBatchInsertRequestContext alloc] initWithRequest:a3 context:a4 sqlCore:self];
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v15, 0);
          id v16 = [(NSSQLStoreRequestContext *)v15 result];
          if (v15) {
            uint64_t v17 = v15->super.super._exception;
          }
          else {
            uint64_t v17 = 0;
          }
          uint64_t v18 = v17;
          if (v15) {
            uint64_t v19 = v15->super.super._error;
          }
          else {
            uint64_t v19 = 0;
          }
          uint64_t v20 = v19;

          if (v16)
          {
            uint64_t v21 = 0;
          }
          else
          {
            if (v18)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v163 = v18;
                objc_exception_throw(v18);
              }
              v103 = (NSError *)[(NSException *)v18 errorObjectWithUserInfo:0];
            }
            else
            {
              v103 = v20;
            }
            uint64_t v21 = v103;
          }
          v30 = (NSPersistentCloudKitContainerEventResult *)v16;
          if (v21 && a3 && (*((void *)a3 + 4) || *((void *)a3 + 5))) {
            int v7 = 0;
          }
        }
        else
        {
          uint64_t v21 = 0;
          v30 = 0;
        }
        uint64_t v6 = 5;
        goto LABEL_197;
      case 6:
        if (self)
        {
          uint64_t v38 = [[NSSQLBatchUpdateRequestContext alloc] initWithRequest:a3 context:a4 sqlCore:self];
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v38, 0);
          id v39 = [(NSSQLStoreRequestContext *)v38 result];
          if (v38) {
            v40 = v38->super.super._exception;
          }
          else {
            v40 = 0;
          }
          v41 = v40;
          if (v38) {
            v42 = v38->super.super._error;
          }
          else {
            v42 = 0;
          }
          v43 = v42;

          if (v39)
          {
            uint64_t v21 = 0;
          }
          else
          {
            if (v41)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v164 = v41;
                objc_exception_throw(v41);
              }
              v104 = (NSError *)[(NSException *)v41 errorObjectWithUserInfo:0];
            }
            else
            {
              v104 = v43;
            }
            uint64_t v21 = v104;
          }
          v30 = (NSPersistentCloudKitContainerEventResult *)v39;
        }
        else
        {
          uint64_t v21 = 0;
          v30 = 0;
        }
        uint64_t v6 = 6;
        goto LABEL_197;
      case 7:
        if (self)
        {
          v44 = [(NSSQLStoreRequestContext *)[NSSQLBatchDeleteRequestContext alloc] initWithRequest:a3 context:a4 sqlCore:self];
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v44, 0);
          id v45 = [(NSSQLStoreRequestContext *)v44 result];
          if (v44) {
            v46 = v44->super.super._exception;
          }
          else {
            v46 = 0;
          }
          v47 = v46;
          if (v44) {
            v48 = v44->super.super._error;
          }
          else {
            v48 = 0;
          }
          v49 = v48;

          if (v45)
          {
            uint64_t v21 = 0;
          }
          else
          {
            if (v47)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v165 = v47;
                objc_exception_throw(v47);
              }
              v105 = (NSError *)[(NSException *)v47 errorObjectWithUserInfo:0];
            }
            else
            {
              v105 = v49;
            }
            uint64_t v21 = v105;
          }
          v30 = (NSPersistentCloudKitContainerEventResult *)v45;
        }
        else
        {
          uint64_t v21 = 0;
          v30 = 0;
        }
        uint64_t v6 = 7;
        goto LABEL_197;
      case 8:
        if (!self) {
          goto LABEL_128;
        }
        if ((*((unsigned char *)&self->_sqlCoreFlags + 1) & 4) == 0)
        {
          id v31 = [(NSSQLCore *)self identifier];
          [(NSPersistentStore *)self URL];
          _NSCoreDataLog(1, @"History Change Request failed as no history tracking option detected on store %@ at %@", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
          uint64_t v21 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:v172 code:134091 userInfo:&unk_1ED7E2320];
          if (v21) {
            goto LABEL_39;
          }
          uint64_t v106 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v106, v107, v108, v109, v110, v111, v112, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
          uint64_t v113 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
            goto LABEL_128;
          }
          *(_DWORD *)buf = 136315394;
          v187 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
          __int16 v188 = 1024;
          int v189 = 2494;
          v147 = v113;
LABEL_205:
          _os_log_fault_impl(&dword_18AB82000, v147, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_128:
          uint64_t v21 = 0;
          v30 = 0;
          goto LABEL_191;
        }
        v84 = (NSPersistentHistoryChangeRequest *)a3;
        if ([a3 token])
        {
          v85 = objc_msgSend((id)objc_msgSend(a3, "token"), "storeTokens");
          if (!objc_msgSend(v85, "objectForKey:", -[NSSQLCore identifier](self, "identifier")))
          {
            v136 = (void *)MEMORY[0x1E4F28C58];
            v183 = @"Reason";
            v137 = NSString;
            uint64_t v138 = [a3 token];
            id v182 = [(NSSQLCore *)self identifier];
            uint64_t v184 = [v137 stringWithFormat:@"Unable to find stores referenced in History Token (%@) - %@", v138, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v182, 1)];
            uint64_t v21 = (NSError *)objc_msgSend(v136, "errorWithDomain:code:userInfo:", v172, 134501, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1));
            if (v21)
            {
LABEL_39:
              uint64_t v22 = 0;
              goto LABEL_185;
            }
            uint64_t v139 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v139, v140, v141, v142, v143, v144, v145, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
            uint64_t v146 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
              goto LABEL_128;
            }
            *(_DWORD *)buf = 136315394;
            v187 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
            __int16 v188 = 1024;
            int v189 = 2501;
            v147 = v146;
            goto LABEL_205;
          }
          id exceptiona = (id)[a3 resultType];
          uint64_t v86 = objc_msgSend(v85, "objectForKey:", -[NSSQLCore identifier](self, "identifier"));
          uint64_t v87 = [a3 fetchLimit];
          exception_object = (_Unwind_Exception *)[a3 fetchBatchSize];
          v84 = -[NSPersistentHistoryChangeRequest initWithTransactionID:delete:transactionOnly:percentageOfDB:]([NSPersistentHistoryChangeRequest alloc], "initWithTransactionID:delete:transactionOnly:percentageOfDB:", v86, [a3 isDelete], objc_msgSend(a3, "isFetchTransactionForToken"), objc_msgSend(a3, "percentageOfDB"));
          [(NSPersistentHistoryChangeRequest *)v84 setResultType:exceptiona];
          [(NSPersistentHistoryChangeRequest *)v84 setFetchLimit:v87];
          [(NSPersistentHistoryChangeRequest *)v84 setFetchBatchSize:exception_object];
          -[NSPersistentStoreRequest setAffectedStores:](v84, "setAffectedStores:", [a3 affectedStores]);
          -[NSPersistentHistoryChangeRequest setFetchRequest:](v84, "setFetchRequest:", [a3 fetchRequest]);
        }
        v88 = [[NSSQLPersistentHistoryChangeRequestContext alloc] initWithRequest:v84 context:a4 sqlCore:self];
        -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v88, 0);
        id v89 = [(NSSQLStoreRequestContext *)v88 result];
        if (v88) {
          v90 = v88->super._exception;
        }
        else {
          v90 = 0;
        }
        v91 = v90;
        if (v88) {
          v92 = v88->super._error;
        }
        else {
          v92 = 0;
        }
        v93 = v92;

        if (v89)
        {
          uint64_t v21 = 0;
        }
        else
        {
          if (v91)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v166 = v91;
              objc_exception_throw(v91);
            }
            v127 = (NSError *)[(NSException *)v91 errorObjectWithUserInfo:0];
          }
          else
          {
            v127 = v93;
          }
          uint64_t v21 = v127;
        }
        v159 = (NSSQLiteIndexStatisticsResult *)v89;
        v30 = (NSPersistentCloudKitContainerEventResult *)v159;
        if (v21)
        {
          uint64_t v22 = v159;
LABEL_185:
          if ([(NSError *)v21 code] == 134091
            || [(NSError *)v21 code] == 134501
            || [(NSError *)v21 code] == 134301)
          {
            int v7 = 0;
          }
          uint64_t v6 = 8;
          goto LABEL_190;
        }
LABEL_191:
        uint64_t v6 = 8;
        goto LABEL_197;
      case 9:
        if (self)
        {
          v176 = 0;
          v50 = (NSPersistentStoreResult *)[(NSPersistentStore *)self mirroringDelegate];
          v51 = v50;
          if (v50) {
            v52 = -[NSCloudKitMirroringDelegate executeMirroringRequest:error:](v50, a3, (uint64_t *)&v176);
          }
          else {
            v52 = objc_alloc_init(NSPersistentStoreResult);
          }
          v30 = (NSPersistentCloudKitContainerEventResult *)v52;

          if (v30) {
            goto LABEL_115;
          }
          uint64_t v21 = v176;
          if (!v176)
          {
            uint64_t v128 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v128, v129, v130, v131, v132, v133, v134, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
            v135 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v187 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
              __int16 v188 = 1024;
              int v189 = 5076;
              _os_log_fault_impl(&dword_18AB82000, v135, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
LABEL_115:
            uint64_t v21 = 0;
          }
        }
        else
        {
          uint64_t v21 = 0;
          v30 = 0;
        }
        int v7 = 0;
        uint64_t v6 = 9;
        goto LABEL_197;
      case 10:
        if (self)
        {
          if ((*((unsigned char *)&self->_sqlCoreFlags + 2) & 1) == 0)
          {
            uint64_t v22 = 0;
            uint64_t v21 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:v172 code:134091 userInfo:&unk_1ED7E2348];
            goto LABEL_138;
          }
          v76 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_ancillaryModels, "objectForKeyedSubscript:", @"NSPersistentStoreTrackIndexUseOptionKey"), "entitiesByName");
          v77 = (objc_class *)objc_opt_class();
          uint64_t v78 = [v76 objectForKeyedSubscript:NSStringFromClass(v77)];
          v79 = objc_alloc_init(NSFetchRequest);
          [(NSFetchRequest *)v79 setEntity:v78];
          [(NSFetchRequest *)v79 setResultType:2];
          v80 = [[NSSQLFetchRequestContext alloc] initWithRequest:v79 context:a4 sqlCore:self];
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v80, 0);
          id v81 = [(NSSQLStoreRequestContext *)v80 result];
          if (v80) {
            v82 = v80->super._exception;
          }
          else {
            v82 = 0;
          }
          v83 = v82;

          if (v81)
          {
            if (![v81 count])
            {
              uint64_t v21 = 0;
              uint64_t v22 = (NSSQLiteIndexStatisticsResult *)NSArray_EmptyArray;
              goto LABEL_138;
            }
          }
          else if (v83)
          {
            objc_exception_throw(v83);
          }
          id v114 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v179 = 0u;
          long long v180 = 0u;
          long long v177 = 0u;
          long long v178 = 0u;
          uint64_t v115 = [v81 countByEnumeratingWithState:&v177 objects:v185 count:16];
          if (v115)
          {
            uint64_t v116 = *(void *)v178;
            do
            {
              for (uint64_t i = 0; i != v115; ++i)
              {
                if (*(void *)v178 != v116) {
                  objc_enumerationMutation(v81);
                }
                objc_msgSend(v114, "addObject:", -[NSSQLiteIndexStatistics initWithResultDictionary:storeID:]([NSSQLiteIndexStatistics alloc], "initWithResultDictionary:storeID:", *(void *)(*((void *)&v177 + 1) + 8 * i), -[NSSQLCore identifier](self, "identifier")));
              }
              uint64_t v115 = [v81 countByEnumeratingWithState:&v177 objects:v185 count:16];
            }
            while (v115);
          }

          v118 = [[NSSQLiteIndexStatisticsResult alloc] initWithResult:v114];
          uint64_t v21 = 0;
          uint64_t v22 = v118;
        }
        else
        {
          uint64_t v21 = 0;
          uint64_t v22 = 0;
        }
LABEL_138:
        uint64_t v6 = 10;
LABEL_190:
        v30 = (NSPersistentCloudKitContainerEventResult *)v22;
        goto LABEL_197;
      case 11:
        if (self)
        {
          uint64_t v53 = [a3 resultType];
          v54 = [(NSPersistentStore *)self mirroringDelegate];
          if (v54
            && v54[144]
            && (v55 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_ancillaryModels, "objectForKeyedSubscript:", @"NSPersistentStoreMirroringDelegateOptionKey"), "entitiesByName"), v56 = (objc_class *)objc_opt_class(), (uint64_t v57 = objc_msgSend(v55, "objectForKeyedSubscript:", NSStringFromClass(v56))) != 0))
          {
            if (a3)
            {
              [*((id *)a3 + 3) setEntity:v57];
              [*((id *)a3 + 3) setReturnsObjectsAsFaults:0];
              v58 = (void *)*((void *)a3 + 3);
            }
            else
            {
              [0 setEntity:v57];
              [0 setReturnsObjectsAsFaults:0];
              v58 = 0;
            }
            [v58 setResultType:4 * (v53 == 1)];
            v59 = off_1E544B060;
            if (v53 != 1) {
              v59 = off_1E544B080;
            }
            id v60 = objc_alloc(*v59);
            if (a3) {
              uint64_t v61 = *((void *)a3 + 3);
            }
            else {
              uint64_t v61 = 0;
            }
            v62 = (void *)[v60 initWithRequest:v61 context:a4 sqlCore:self];
            -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v62, 0);
            id v63 = (id)[v62 result];
            if (v62) {
              v64 = (void *)v62[6];
            }
            else {
              v64 = 0;
            }
            id v65 = v64;

            if (!v63 && v65) {
              objc_exception_throw(v65);
            }
            if (!v63)
            {
              uint64_t v119 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
              _NSCoreDataLog(17, v119, v120, v121, v122, v123, v124, v125, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
              v126 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v187 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
                __int16 v188 = 1024;
                int v189 = 5132;
                _os_log_fault_impl(&dword_18AB82000, v126, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
              }
              goto LABEL_141;
            }
            if (v53)
            {
              if (v53 == 1)
              {
                v66 = [[NSPersistentCloudKitContainerEventResult alloc] initWithResult:v63 ofType:1];
                goto LABEL_193;
              }
LABEL_141:
              v75 = 0;
            }
            else if ([v63 count])
            {
              v148 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v63, "count"));
              v181[0] = MEMORY[0x1E4F143A8];
              v181[1] = 3221225472;
              v181[2] = __66__NSSQLCore_processCloudKitContainerEventRequest_inContext_error___block_invoke;
              v181[3] = &unk_1E544D820;
              v181[4] = v148;
              [v63 enumerateObjectsUsingBlock:v181];
              v149 = (void *)[v148 copy];
              v75 = [[NSPersistentCloudKitContainerEventResult alloc] initWithResult:v149 ofType:0];
            }
            else
            {
              v160 = [NSPersistentCloudKitContainerEventResult alloc];
              v66 = [(NSPersistentCloudKitContainerEventResult *)v160 initWithResult:NSArray_EmptyArray ofType:0];
LABEL_193:
              v75 = v66;
            }
          }
          else
          {
            v74 = [NSPersistentCloudKitContainerEventResult alloc];
            v75 = [(NSPersistentCloudKitContainerEventResult *)v74 initWithResult:NSArray_EmptyArray ofType:v53];
          }
          v30 = v75;
          goto LABEL_196;
        }
        v30 = 0;
LABEL_196:
        uint64_t v21 = 0;
        uint64_t v6 = 11;
LABEL_197:
        v161 = v175;
        if (v21) {
          BOOL v162 = v175 == 0;
        }
        else {
          BOOL v162 = 0;
        }
        if (v162) {
          v161 = v21;
        }
        v175 = v161;
        if (v30) {
          return v30;
        }
        break;
      default:
        uint64_t v21 = 0;
        v30 = 0;
        goto LABEL_197;
    }
  }
  v30 = 0;
  if (a5 && v175)
  {
    v30 = 0;
    *a5 = v175;
  }
  return v30;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = -[NSSQLCore rowCacheForGeneration:](self, a4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        -[NSPersistentStoreCache incrementRefCountForObjectID:]((uint64_t)v5, *(const void **)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSError)_newRowDataForXPCFetch:(void *)a3 variables:(uint64_t)a4 context:(NSError *)a5 error:
{
  error = a1;
  if (a1)
  {
    uint64_t v9 = [(NSSQLFetchRequestContext *)[NSSQLXPCFetchRequestContext alloc] initWithRequest:a2 context:a4 sqlCore:a1];
    long long v11 = v9;
    if (v9) {
      objc_setProperty_nonatomic(v9, v10, a3, 216);
    }
    long long v12 = (void *)[a2 predicate];
    if (v12) {
      [v12 minimalFormInContext:0];
    }
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)error, v11, 0);
    error = (NSError *)[(NSSQLStoreRequestContext *)v11 result];
    if (error) {
      goto LABEL_12;
    }
    if (v11)
    {
      exception = v11->super.super._exception;
      if (exception)
      {
        id v16 = exception;
        objc_exception_throw(exception);
      }
      if (!a5)
      {
        error = 0;
        goto LABEL_12;
      }
      error = v11->super.super._error;
    }
    else
    {
      error = 0;
      if (!a5) {
        goto LABEL_12;
      }
    }
    uint64_t v14 = error;
    error = 0;
    *a5 = v14;
LABEL_12:
  }
  return error;
}

- (uint64_t)entityForObjectID:(uint64_t)result
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2)
    {
      unsigned int v3 = (void *)result;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        result = [a2 _storeInfo1];
        if (result) {
          return result;
        }
        uint64_t v4 = [NSString stringWithUTF8String:"entityForObjectID failed to retrieve an NSSQLEntity for objectID %@"];
        _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
        long long v11 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = a2;
          _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: entityForObjectID failed to retrieve an NSSQLEntity for objectID %@", buf, 0xCu);
        }
      }
      long long v12 = (void *)[a2 entity];
      if (v12)
      {
        long long v13 = v12;
        result = _sqlCoreLookupSQLEntityForEntityDescription(v3, v12);
        if (result) {
          return result;
        }
        uint64_t v14 = [NSString stringWithUTF8String:"_sqlCoreLookupSQLEntityForEntityDescription failed to return a result for objectID %@ with entity %@"];
        _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)a2);
        uint64_t v21 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
          return 0;
        }
        *(_DWORD *)buf = 138412546;
        v43 = a2;
        __int16 v44 = 2112;
        id v45 = v13;
        uint64_t v22 = "CoreData: _sqlCoreLookupSQLEntityForEntityDescription failed to return a result for objectID %@ with entity %@";
        uint64_t v23 = v21;
        uint32_t v24 = 22;
        goto LABEL_17;
      }
      uint64_t v33 = [NSString stringWithUTF8String:"entityForObjectID passed a nil entity description from %@"];
      _NSCoreDataLog(17, v33, v34, v35, v36, v37, v38, v39, (uint64_t)a2);
      uint64_t v40 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 138412290;
      v43 = a2;
      uint64_t v22 = "CoreData: entityForObjectID passed a nil entity description from %@";
      uint64_t v23 = v40;
      uint32_t v24 = 12;
    }
    else
    {
      uint64_t v25 = [NSString stringWithUTF8String:"entityForObjectID was passed a nil objectID"];
      _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, v41);
      uint64_t v32 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        return 0;
      }
      *(_WORD *)buf = 0;
      uint64_t v22 = "CoreData: entityForObjectID was passed a nil objectID";
      uint64_t v23 = v32;
      uint32_t v24 = 2;
    }
LABEL_17:
    _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, v22, buf, v24);
    return 0;
  }
  return result;
}

- (NSError)_newValuesForRelationship:(void *)a3 forObjectWithID:(void *)a4 withContext:(NSError *)a5 error:
{
  if (!a1 || ![a1 _persistentStoreCoordinator]) {
    return 0;
  }
  if ([a3 isTemporaryID]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"cannot find data for a temporary oid: %@", a3), 0 reason userInfo]);
  }
  [a4 stalenessInterval];
  double v11 = v10;
  double v12 = CFAbsoluteTimeGetCurrent() - v10;
  if (v11 <= 0.0) {
    double v12 = *(double *)&NSSQLDistantPastTimeInterval;
  }
  if (v11 == 0.0) {
    double v13 = *(double *)&NSSQLDistantFutureTimeInterval;
  }
  else {
    double v13 = v12;
  }
  uint64_t v14 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:](a1, objc_msgSend(a4, "_queryGenerationToken", v12));
  if ([a2 isToMany])
  {
    uint64_t v15 = (NSError *)(id)-[NSPersistentStoreCache toManyInformationForSourceObjectID:forProperty:afterTimestamp:]((uint64_t)v14, a3, a2, v13);
  }
  else
  {
    uint64_t v17 = -[os_unfair_lock_s valueForKey:](-[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v14, a3, v13), "valueForKey:", [a2 name]);
    if (!v17) {
      goto LABEL_15;
    }
    uint64_t v15 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v17, 0);
  }
  error = v15;
  if (!v15)
  {
LABEL_15:
    uint64_t v18 = [[NSSQLRelationshipFaultRequestContext alloc] initWithObjectID:a3 relationship:a2 context:a4 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v18, 0);
    error = (NSError *)[(NSSQLStoreRequestContext *)v18 result];
    if (error)
    {
LABEL_25:

      return error;
    }
    if (v18)
    {
      exception = v18->super._exception;
      if (exception)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v22 = exception;
          objc_exception_throw(exception);
        }
        if (a5)
        {
          uint64_t v20 = (NSError *)[(NSException *)exception errorObjectWithUserInfo:0];
LABEL_24:
          error = 0;
          *a5 = v20;
          goto LABEL_25;
        }
LABEL_27:
        error = 0;
        goto LABEL_25;
      }
      if (!a5) {
        goto LABEL_27;
      }
      error = v18->super._error;
    }
    else
    {
      error = 0;
      if (!a5) {
        goto LABEL_25;
      }
    }
    uint64_t v20 = error;
    goto LABEL_24;
  }
  return error;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v6 = -[NSSQLCore _newValuesForRelationship:forObjectWithID:withContext:error:](self, a3, a4, a5, (NSError **)a6);
  id v7 = (id)[(NSError *)v6 firstObject];

  return v7;
}

- (Class)objectIDFactoryForPersistentHistoryEntity:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLCore;
  id v4 = -[NSPersistentStore objectIDFactoryForEntity:](&v6, sel_objectIDFactoryForEntity_, [a3 entityDescription]);
  if (![v4 _storeInfo1]) {
    [v4 _setStoreInfo1:a3];
  }
  return (Class)v4;
}

uint64_t __32__NSSQLCore__loadAndSetMetadata__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __35__NSSQLCore_currentQueryGeneration__block_invoke_528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double v10 = (_PFSQLiteSnapshotWrapper *)atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLiteConnection currentQueryGenerationIdentifier](v10);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    _NSCoreDataLog(1, @"SQLCore failed to get a currentQueryGeneration", v11, v12, v13, v14, v15, v16, a9);
  }
}

uint64_t __47__NSSQLCore_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208));
  return -[NSSQLiteConnection freeQueryGenerationWithIdentifier:](v2, v1);
}

void __40__NSSQLCore__ensureDatabaseMatchesModel__block_invoke(uint64_t a1)
{
  uint64_t v303 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1 || !-[NSSQLiteConnection _hasTableWithName:isTemp:](v1, @"Z_METADATA", 0)) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) model];
    if (v4) {
      uint64_t v5 = *(void **)(v4 + 32);
    }
    else {
      uint64_t v5 = 0;
    }
    os_unfair_lock_lock_with_options();
    objc_super v6 = (void *)[*(id *)(v2 + 160) objectForKey:@"NSStoreModelVersionHashes"];
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 152));
    if (v6)
    {
      long long v298 = 0u;
      long long v297 = 0u;
      long long v296 = 0u;
      *(_OWORD *)buf = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:buf objects:&v286 count:16];
      if (!v7) {
        goto LABEL_26;
      }
      uint64_t v8 = *(void *)v296;
LABEL_9:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v296 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(v6, "objectForKey:", objc_msgSend(*(id *)(*(void *)(*(void *)&buf[8] + 8 * v9) + 24), "name")))break; {
        if (v7 == ++v9)
        }
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:buf objects:&v286 count:16];
          if (v7) {
            goto LABEL_9;
          }
          goto LABEL_26;
        }
      }
    }
    -[NSSQLiteConnection connect]((uint64_t)v3);
    double v10 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:-[NSSQLiteConnection fetchTableNames](v3)];
    long long v294 = 0u;
    long long v293 = 0u;
    long long v292 = 0u;
    long long v291 = 0u;
    uint64_t v11 = [v5 countByEnumeratingWithState:&v291 objects:&v285 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v292;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v292 != v12) {
            objc_enumerationMutation(v5);
          }
          uint64_t v14 = *(void **)(*((void *)&v291 + 1) + 8 * i);
          if (v14
            && !v14[20]
            && (objc_msgSend(v10, "containsObject:", objc_msgSend(*(id *)(*((void *)&v291 + 1) + 8 * i), "tableName")) & 1) == 0)
          {
            uint64_t v63 = [NSString stringWithFormat:@"Can't find table for entity '%@' in database at URL '%@'", objc_msgSend((id)objc_msgSend(v14, "entityDescription"), "name"), objc_msgSend((id)v2, "URL")];
            v290[0] = v63;
            uint64_t v64 = *MEMORY[0x1E4F28328];
            v289[0] = @"message";
            v289[1] = v64;
            v290[1] = objc_msgSend((id)objc_msgSend((id)v2, "URL"), "path");
            id v65 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v290 forKeys:v289 count:2];
            id v66 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134020, v63, v65);
            objc_exception_throw(v66);
          }
        }
        uint64_t v11 = [v5 countByEnumeratingWithState:&v291 objects:&v285 count:16];
      }
      while (v11);
    }
  }
LABEL_26:
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15)
  {
    uint64_t v16 = *(void **)(a1 + 32);
    os_unfair_lock_lock_with_options();
    uint64_t v17 = (void *)[*(id *)(v15 + 160) objectForKey:0x1ED796A20];
    os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 152));
    [v17 unsignedIntegerValue];
    if ((int)[v17 intValue] >= 901
      && (int)[v17 intValue] <= 966
      && ([(id)v15 isReadOnly] & 1) == 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v15, "URL"), "path"), "hasSuffix:", @"com.apple.security.keychain-defaultContext.TrustedPeersHelper.db"))
    {
      char v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v15, "metadata"), "objectForKey:", @"NSStoreModelVersionHashes"), "allKeys"), "containsObject:", @"Machine");
      char v19 = v16 ? v18 : 1;
      if ((v19 & 1) == 0
        && -[NSSQLiteConnection _hasTableWithName:isTemp:]((uint64_t)v16, @"ZMACHINE", 0))
      {
        -[NSSQLiteConnection _dropTableWithName:]((uint64_t)v16, @"ZMACHINE");
      }
    }
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v15, "options"), "allKeys"), "containsObject:", @"NSXPCStoreListener") & 1) != 0|| !objc_msgSend((id)v15, "_persistentStoreCoordinator")|| (objc_msgSend((id)v15, "isReadOnly") & 1) != 0|| (int)objc_msgSend(v17, "intValue") >= 619&& ((int)objc_msgSend(v17, "intValue") < 960 || (int)objc_msgSend(v17, "intValue") > 971))
    {
      int v20 = 0;
    }
    else
    {
      os_unfair_lock_lock_with_options();
      [*(id *)(v15 + 160) setValue:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreRebuildIndicies"];
      atomic_store(0, (unsigned __int8 *)(v15 + 196));
      [(id)v15 _setMetadataDirty:1];
      os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 152));
      uint64_t v56 = [(id)v15 identifier];
      _NSCoreDataLog(2, @"Rebuilding indicies for store - %@", v57, v58, v59, v60, v61, v62, v56);
      int v20 = 1;
    }
    if ((int)[v17 intValue] >= 1002
      && (int)[v17 intValue] <= 1004
      && ([(id)v15 isReadOnly] & 1) == 0
      && [(id)v15 model])
    {
      uint64_t v21 = getprogname();
      if (v21
        && (!strncmp("assetsd", v21, 7uLL) || !strncmp("photolibraryd", v21, 0xDuLL))
        && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v15, "URL"), "lastPathComponent"), "isEqualToString:", @"Photos.sqlite"))
      {
        uint64_t v22 = [[NSSQLColumn alloc] initWithColumnName:@"COUNT(*)" sqlType:1];
        id v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v22, 0);

        v243 = @"ZSHAREPARTICIPANT";
        uint32_t v24 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, [NSString stringWithFormat:@"SELECT COUNT(*) FROM (SELECT * FROM %@ WHERE Z_ENT = 0 LIMIT 1)"]);
        LODWORD(v22) = -[NSSQLiteConnection selectCountWithStatement:]((uint64_t)v16, v24);

        -[NSSQLiteConnection setColumnsToFetch:](v16, v23);
        if (v22)
        {
          uint64_t v25 = -[NSSQLiteConnection newFetchedArray]((uint64_t)v16);
          if ([v25 count])
          {
            int v26 = objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", 0), "unsignedIntValue");

            if (v26)
            {
              _NSCoreDataLog(2, @"Corruption encountered during a past migration - DB integrity has been compromised.", v27, v28, v29, v30, v31, v32, @"ZSHAREPARTICIPANT");
              uint64_t v33 = (void *)[MEMORY[0x1E4F1CA48] array];
              memset(&v285, 0, 64);
              uint64_t v34 = [(id)v15 model];
              if (v34) {
                uint64_t v35 = *(void **)(v34 + 32);
              }
              else {
                uint64_t v35 = 0;
              }
              uint64_t v36 = [v35 countByEnumeratingWithState:&v285 objects:&v286 count:16];
              if (v36)
              {
                uint64_t v37 = **(void **)&v285.st_uid;
                do
                {
                  for (uint64_t j = 0; j != v36; ++j)
                  {
                    if (**(void **)&v285.st_uid != v37) {
                      objc_enumerationMutation(v35);
                    }
                    uint64_t v39 = *(void **)(v285.st_ino + 8 * j);
                    if (objc_msgSend((id)objc_msgSend(v39, "tableName"), "isEqualToString:", @"ZSHAREPARTICIPANT"))objc_msgSend(v33, "addObject:", v39); {
                  }
                    }
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v285 objects:&v286 count:16];
                }
                while (v36);
              }
              if ([v33 count] == 1)
              {
                [v33 firstObject];
                _NSCoreDataLog(2, @"Attempting Repair - One entity found for table - %@ setting Z_ENT = %u", v46, v47, v48, v49, v50, v51, @"ZSHAREPARTICIPANT");
                -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v16, 0);
                v52 = NSString;
                uint64_t v53 = [v33 firstObject];
                if (v53) {
                  uint64_t v54 = *(unsigned int *)(v53 + 184);
                }
                else {
                  uint64_t v54 = 0;
                }
                v55 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", [v33 firstObject], objc_msgSend(v52, "stringWithFormat:", @"UPDATE OR FAIL %@ SET Z_ENT = %u", @"ZSHAREPARTICIPANT", v54));
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v16, v55);
              }
              else
              {
                _NSCoreDataLog(2, @"Unable to Repair - More than one entity found for table - %@ Entites - %@", v40, v41, v42, v43, v44, v45, @"ZSHAREPARTICIPANT");
              }
            }
          }
        }
        -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v16, 0);
      }
      -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v16, 0);
    }
    if (v20) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  uint64_t v67 = *(void *)(a1 + 40);
  if (!v67) {
    goto LABEL_245;
  }
  uint64_t v68 = *(void *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  v69 = objc_msgSend(*(id *)(v67 + 160), "objectForKey:");
  os_unfair_lock_unlock((os_unfair_lock_t)(v67 + 152));
  unint64_t v70 = [v69 unsignedIntegerValue];
  if ([(id)v67 _persistentStoreCoordinator])
  {
    if (v70 <= 0xB9 && ([(id)v67 isReadOnly] & 1) == 0)
    {
      CFArrayRef v71 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v68, @"pragma auto_vacuum");
      CFArrayRef v72 = v71;
      if (v71)
      {
        if (*(uint64_t *)CFArrayGetValueAtIndex(v71, 0) < 1 || *(void *)CFArrayGetValueAtIndex(v72, 1))
        {
          CFRelease(v72);
        }
        else
        {
          CFRelease(v72);
          uint64_t v132 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v67, "URL"), "path"), "fileSystemRepresentation");
          memset(&v286, 0, 512);
          memset(&v285, 0, sizeof(v285));
          int v133 = access(v132, 6);
          if (stat(v132, &v285) || (off_t st_size = v285.st_size) == 0 || statfs(v132, &v286))
          {
            if (v133) {
              goto LABEL_89;
            }
          }
          else if (v133 || (int64_t)(v286.f_bavail * v286.f_bsize) <= st_size)
          {
            goto LABEL_89;
          }
          CFMutableArrayRef v135 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v68, @"pragma auto_vacuum=1");
          if (v135) {
            CFRelease(v135);
          }
          CFMutableArrayRef v136 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v68, @"vacuum");
          if (v136) {
            CFRelease(v136);
          }
          -[NSSQLiteConnection disconnect](v68);
          -[NSSQLiteConnection connect](v68);
        }
      }
    }
  }
LABEL_89:
  uint64_t v73 = *(void **)(a1 + 40);
  if (v73)
  {
    uint64_t v74 = *(void *)(a1 + 32);
    if ([*(id *)(a1 + 40) _persistentStoreCoordinator])
    {
      if (([v73 isReadOnly] & 1) == 0)
      {
        -[NSSQLiteConnection connect](v74);
        if (!v74 || (-[NSSQLiteConnection _hasTableWithName:isTemp:](v74, @"Z_MODELCACHE", 0) & 1) == 0) {
          -[NSSQLiteConnection saveCachedModel:](v74, objc_msgSend((id)objc_msgSend(v73, "model"), "managedObjectModel"));
        }
      }
    }
    uint64_t v75 = *(void *)(a1 + 40);
    if (v75)
    {
      uint64_t v76 = *(void *)(a1 + 32);
      os_unfair_lock_lock_with_options();
      v77 = (void *)[*(id *)(v75 + 160) objectForKey:0x1ED796A20];
      os_unfair_lock_unlock((os_unfair_lock_t)(v75 + 152));
      unint64_t v78 = [v77 unsignedIntegerValue];
      uint64_t v79 = [(id)v75 _persistentStoreCoordinator];
      v80 = (void *)v79;
      if (v79 && v78 >= 0x2BD && v78 <= 0x2EA)
      {
        if (([(id)v75 isReadOnly] & 1) == 0)
        {
          -[NSSQLiteConnection connect](v76);
          *(void *)&v286.f_bsize = 0;
          if ((-[NSSQLCore _rebuildTriggerSchemaUsingConnection:recomputeValues:error:](v75, v76, (id *)&v286) & 1) == 0)
          {
            uint64_t v81 = *(void *)&v286.f_bsize;
            [*(id *)&v286.f_bsize userInfo];
            _NSCoreDataLog(1, @"Repairing old triggers failed with error = %@ and userInfo = %@", v82, v83, v84, v85, v86, v87, v81);
          }
          goto LABEL_202;
        }
      }
      else if (!v79)
      {
LABEL_171:
        if (([(id)v75 isReadOnly]
           || v78 < 0x3BE
           || v78 > 0x44B
           || !-[NSManagedObjectModel _hasEntityWithDerivedAttribute]([v80 managedObjectModel]))
          && (([(id)v75 isReadOnly] & 1) != 0
           || v78 > 0x4BC
           || !-[NSManagedObjectModel _hasEntityWithDerivedAttribute]([v80 managedObjectModel])))
        {
LABEL_203:
          uint64_t v155 = *(void *)(a1 + 40);
          if (!v155) {
            goto LABEL_245;
          }
          uint64_t v156 = *(id **)(a1 + 32);
          os_unfair_lock_lock_with_options();
          uint64_t v157 = (void *)[*(id *)(v155 + 160) objectForKey:0x1ED796A20];
          os_unfair_lock_unlock((os_unfair_lock_t)(v155 + 152));
          uint64_t v158 = [(id)v155 _persistentStoreCoordinator];
          unint64_t v159 = [v157 unsignedIntegerValue];
          v160 = (void *)[*(id *)(v155 + 232) objectForKey:@"NSPersistentHistoryTrackingKey"];
          char v161 = [(id)v155 isReadOnly];
          if (!v158 || (v161 & 1) != 0) {
            goto LABEL_242;
          }
          int v162 = *(_DWORD *)(v155 + 200);
          int hasPersistentHistory = -[NSSQLiteConnection _hasPersistentHistoryTables]((uint64_t)v156);
          int v164 = hasPersistentHistory;
          if ((v162 & 0x400) == 0)
          {
            if (hasPersistentHistory && -[NSSQLiteConnection hasHistoryRows]((BOOL)v156))
            {
              uint64_t v165 = [NSString stringWithUTF8String:"Store opened without NSPersistentHistoryTrackingKey but previously had been opened with NSPersistentHistoryTrackingKey - Forcing into Read Only mode store at '%@'"];
              uint64_t v166 = [(id)v155 URL];
              _NSCoreDataLog(17, v165, v167, v168, v169, v170, v171, v172, v166);
              v173 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                uint64_t v234 = [(id)v155 URL];
                v286.f_bsize = 138412290;
                *(void *)&v286.f_iosize = v234;
                _os_log_fault_impl(&dword_18AB82000, v173, OS_LOG_TYPE_FAULT, "CoreData: Store opened without NSPersistentHistoryTrackingKey but previously had been opened with NSPersistentHistoryTrackingKey - Forcing into Read Only mode store at '%@'", (uint8_t *)&v286, 0xCu);
              }
              [(id)v155 setReadOnly:1];
            }
            goto LABEL_242;
          }
          if (v159 - 801 <= 0x16 && -[NSSQLiteConnection _hasOldHistoryTrackingTables]((uint64_t)v156))
          {
            -[NSSQLiteConnection connect]((uint64_t)v156);
            -[NSSQLiteConnection _dropOldHistoryTrackingTables]((uint64_t)v156);
          }
          if (v164)
          {
            if (v159 < 0x334)
            {
LABEL_217:
              -[NSSQLiteConnection connect]((uint64_t)v156);
              -[NSSQLiteConnection dropHistoryTrackingTables](v156);
              LOBYTE(v164) = 0;
              LOBYTE(v174) = 1;
              goto LABEL_231;
            }
            if (v159 <= 0x34C)
            {
              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"coreduetd"))goto LABEL_217; {
              if (v159 <= 0x345)
              }
              {
                unint64_t v175 = -[NSSQLiteConnection numberOfTombstones]((uint64_t)v156);
                if (v175 < +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, *(void **)(v155 + 104)))
                {
                  -[NSSQLiteConnection connect]((uint64_t)v156);
                  unint64_t v176 = -[NSSQLiteConnection numberOfTombstones]((uint64_t)v156);
                  unint64_t v177 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)_PFPersistentHistoryModel, *(void **)(v155 + 104));
                  [(NSSQLiteConnection *)v156 addTombstoneColumnsForRange:v177];
                }
              }
            }
            if (v159 == 914 || v159 == 863)
            {
              -[NSSQLiteConnection connect]((uint64_t)v156);
              long long v178 = -[NSSQLiteConnection hasAncillaryEntitiesInHistory](v156);
              uint64_t v185 = (uint64_t)v178;
              if (v178)
              {
                _NSCoreDataLog(1, @"found Ancillary Entities in Persistent History - %@", v179, v180, v181, v182, v183, v184, (uint64_t)v178);
                -[NSSQLiteConnection dropHistoryBeforeTransactionID:](v156, v185);
              }
            }
          }
          int v174 = v164 ^ 1;
          if (v159 >= 0x35E && v159 - 900 > 0xC)
          {
            if (!v174)
            {
LABEL_242:
              uint64_t v187 = *(void *)(a1 + 40);
              if (v187)
              {
                uint64_t v188 = *(void *)(a1 + 32);
                os_unfair_lock_lock_with_options();
                unint64_t v189 = objc_msgSend((id)objc_msgSend(*(id *)(v187 + 160), "objectForKey:", 0x1ED796A20), "unsignedIntegerValue");
                uint64_t v190 = (void *)[*(id *)(v187 + 160) objectForKey:0x1ED796400];
                os_unfair_lock_unlock((os_unfair_lock_t)(v187 + 152));
                v191 = getprogname();
                if (v191)
                {
                  if (!strncmp("homed", v191, 5uLL))
                  {
                    if ([(id)v187 _persistentStoreCoordinator])
                    {
                      if (v189 >= 0x4BA)
                      {
                        char v211 = [(id)v187 isReadOnly];
                        if (v188)
                        {
                          if ((v211 & 1) == 0
                            && -[NSSQLiteConnection _hasTableWithName:isTemp:](v188, @"Z_47ACTIONMEDIAPLAYBACKS_", 0)&& -[NSSQLiteConnection _hasTableWithName:isTemp:](v188, @"Z_48ACTIONMEDIAPLAYBACKS_", 0))
                          {
                            if (([v190 isEqualToString:@"7G8C8LDyGsq8nWlygb+W8X+/Cib0xLur8J7eDoPpDg+r21Lp9FSS3Lxq6BtPoouvaSJ1rZ7uYvGBCtGwtaU/IA=="] & 1) != 0|| (objc_msgSend(v190, "isEqualToString:", @"NdSMhI64y0fcuGTkPpTBUTgUCmv1yHtrblyXGtAcfUtTWLUB/DyCki93Ps2ZydhpvOlS/5cUaUueM7chxR4pWg==") & 1) != 0|| objc_msgSend(v190, "isEqualToString:", @"GrkWfiJ5F085geZxp8His1GEvGdt1zwn0jZ+8FYWsccb6+KEIWdCVcNcaa7RAU+X37QwU+10nMCuBCnuT0/zQg=="))
                            {
                              _NSCoreDataLog(1, @"Executing schema repair operations for HomeKitModel-882 Z_48ACTIONMEDIAPLAYBACKS_ table", v212, v213, v214, v215, v216, v217, (uint64_t)v243);
                              CFMutableArrayRef v218 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v188, @"DROP TABLE Z_48ACTIONMEDIAPLAYBACKS_");
                              if (v218) {
                                CFRelease(v218);
                              }
                            }
                            else
                            {
                              uint64_t v235 = [NSString stringWithUTF8String:"Unknown schema hash presents conflicting ACTIONMEDIAPLAYBACKS_ tables: %@"];
                              _NSCoreDataLog(17, v235, v236, v237, v238, v239, v240, v241, (uint64_t)v190);
                              v242 = __pflogFaultLog;
                              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                              {
                                v286.f_bsize = 138412290;
                                *(void *)&v286.f_iosize = v190;
                                _os_log_fault_impl(&dword_18AB82000, v242, OS_LOG_TYPE_FAULT, "CoreData: Unknown schema hash presents conflicting ACTIONMEDIAPLAYBACKS_ tables: %@", (uint8_t *)&v286, 0xCu);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              goto LABEL_245;
            }
LABEL_239:
            -[NSSQLiteConnection connect]((uint64_t)v156);
            -[NSSQLiteConnection beginTransaction]((uint64_t)v156);
            if ((-[NSSQLiteConnection _hasPersistentHistoryTables]((uint64_t)v156) & 1) == 0) {
              -[NSSQLiteConnection createMissingHistoryTables]((uint64_t)v156);
            }
            -[NSSQLiteConnection commitTransaction]((uint64_t)v156);
            -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v156, 0);
            goto LABEL_242;
          }
LABEL_231:
          -[NSSQLiteConnection connect]((uint64_t)v156);
          if (v164)
          {
            if ((-[NSSQLiteConnection _hasHistoryTransactionStringTable]((uint64_t)v156) & 1) == 0)
            {
              uint64_t v186 = [v160 entityNamed:@"TRANSACTIONSTRING"];
              if (v186)
              {
                *(void *)&long long v299 = v186;
                -[NSSQLiteConnection createTablesForEntities:]((uint64_t)v156, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v299 count:1]);
              }
            }
          }
          else
          {
            -[NSSQLiteConnection createMissingHistoryTables]((uint64_t)v156);
            LOBYTE(v174) = 0;
          }
          if ((-[NSSQLiteConnection hasTransactionStringColumnsInTransactionTable]((uint64_t)v156) & 1) == 0) {
            -[NSSQLiteConnection addTransactionStringColumnsToTransactionTable](v156);
          }
          if ((v174 & 1) == 0) {
            goto LABEL_242;
          }
          goto LABEL_239;
        }
        -[NSSQLiteConnection connect](v76);
        -[NSSQLiteConnection _dropAllDATriggers](v76);
        -[NSSQLCore _rebuildDerivedAttributeTriggerSchemaUsingConnection:recomputeValues:error:](v75, v76);
LABEL_202:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_203;
      }
      if (![(id)v75 isReadOnly] && v78 >= 0x385 && v78 <= 0x3BF)
      {
        uint64_t v255 = v75;
        *(void *)&long long v299 = 0;
        uint64_t v252 = v76;
        -[NSSQLiteConnection connect](v76);
        -[NSSQLiteConnection _dropAllTriggers](v76);
        if ((-[NSSQLCore _rebuildTriggerSchemaUsingConnection:recomputeValues:error:](v75, v76, (id *)&v299) & 1) == 0)
        {
          uint64_t v88 = v299;
          [(id)v299 userInfo];
          _NSCoreDataLog(1, @"Repairing triggers failed with error = %@ and userInfo = %@", v89, v90, v91, v92, v93, v94, v88);
        }
        id v284 = 0;
        id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v244 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        long long v282 = 0u;
        long long v283 = 0u;
        long long v280 = 0u;
        long long v281 = 0u;
        uint64_t v96 = *(void *)(v75 + 104);
        if (v96) {
          v97 = *(void **)(v96 + 24);
        }
        else {
          v97 = 0;
        }
        v98 = (void *)[v97 allValues];
        uint64_t v99 = [v98 countByEnumeratingWithState:&v280 objects:&v285 count:16];
        obuint64_t j = v98;
        if (v99)
        {
          uint64_t v247 = *(void *)v281;
          char v250 = 1;
          while (2)
          {
            uint64_t v100 = 0;
            uint64_t v246 = v99;
            do
            {
              if (*(void *)v281 != v247) {
                objc_enumerationMutation(obj);
              }
              uint64_t v248 = v100;
              uint64_t v101 = *(void **)(*((void *)&v280 + 1) + 8 * v100);
              long long v276 = 0u;
              long long v277 = 0u;
              long long v278 = 0u;
              long long v279 = 0u;
              uint64_t v102 = objc_msgSend((id)objc_msgSend(v101, "entityDescription"), "properties");
              uint64_t v103 = [v102 countByEnumeratingWithState:&v276 objects:buf count:16];
              id v253 = v102;
              if (v103)
              {
                uint64_t v254 = *(void *)v277;
LABEL_117:
                uint64_t v104 = 0;
                while (1)
                {
                  if (*(void *)v277 != v254) {
                    objc_enumerationMutation(v253);
                  }
                  v105 = *(void **)(*((void *)&v276 + 1) + 8 * v104);
                  if ([v105 _propertyType] == 2 && !objc_msgSend(v105, "attributeType"))
                  {
                    if ([v105 isTransient])
                    {
                      uint64_t v106 = objc_msgSend((id)objc_msgSend(-[NSEntityDescription _attributeNamed:](objc_msgSend(v101, "entityDescription"), objc_msgSend(v105, "name")), "userInfo"), "objectForKey:", @"_NSLocationAttributeDerivedComponents");
                      if (v106)
                      {
                        uint64_t v107 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v106, [v105 name], v101);
                        uint64_t v108 = v107;
                        if (v107)
                        {
                          if ([(NSSQLLocationAttributeRTreeExtension *)v107 validate:&v284])
                          {
                            long long v274 = 0u;
                            long long v275 = 0u;
                            long long v272 = 0u;
                            long long v273 = 0u;
                            v251 = v108;
                            uint64_t v109 = [(NSSQLLocationAttributeRTreeExtension *)v108 dropSQLStrings];
                            uint64_t v110 = [(NSArray *)v109 countByEnumeratingWithState:&v272 objects:&v291 count:16];
                            if (v110)
                            {
                              uint64_t v111 = *(void *)v273;
                              do
                              {
                                for (uint64_t k = 0; k != v110; ++k)
                                {
                                  if (*(void *)v273 != v111) {
                                    objc_enumerationMutation(v109);
                                  }
                                  uint64_t v113 = [[NSSQLiteStatement alloc] initWithEntity:v101 sqlString:*(void *)(*((void *)&v272 + 1) + 8 * k)];
                                  [v95 addObject:v113];
                                }
                                uint64_t v110 = [(NSArray *)v109 countByEnumeratingWithState:&v272 objects:&v291 count:16];
                              }
                              while (v110);
                            }
                            long long v270 = 0u;
                            long long v271 = 0u;
                            long long v268 = 0u;
                            long long v269 = 0u;
                            id v114 = [(NSSQLLocationAttributeRTreeExtension *)v251 insertSQLStrings];
                            uint64_t v115 = [(NSArray *)v114 countByEnumeratingWithState:&v268 objects:v290 count:16];
                            if (v115)
                            {
                              uint64_t v116 = *(void *)v269;
                              do
                              {
                                for (uint64_t m = 0; m != v115; ++m)
                                {
                                  if (*(void *)v269 != v116) {
                                    objc_enumerationMutation(v114);
                                  }
                                  v118 = [[NSSQLiteStatement alloc] initWithEntity:v101 sqlString:*(void *)(*((void *)&v268 + 1) + 8 * m)];
                                  [v95 addObject:v118];
                                }
                                uint64_t v115 = [(NSArray *)v114 countByEnumeratingWithState:&v268 objects:v290 count:16];
                              }
                              while (v115);
                            }
                            long long v266 = 0u;
                            long long v267 = 0u;
                            long long v264 = 0u;
                            long long v265 = 0u;
                            uint64_t v108 = v251;
                            uint64_t v119 = [(NSSQLLocationAttributeRTreeExtension *)v251 bulkUpdateSQLStrings];
                            uint64_t v120 = [(NSArray *)v119 countByEnumeratingWithState:&v264 objects:v289 count:16];
                            if (v120)
                            {
                              uint64_t v121 = *(void *)v265;
                              do
                              {
                                for (uint64_t n = 0; n != v120; ++n)
                                {
                                  if (*(void *)v265 != v121) {
                                    objc_enumerationMutation(v119);
                                  }
                                  uint64_t v123 = [[NSSQLiteStatement alloc] initWithEntity:v101 sqlString:*(void *)(*((void *)&v264 + 1) + 8 * n)];
                                  [v95 addObject:v123];
                                }
                                uint64_t v120 = [(NSArray *)v119 countByEnumeratingWithState:&v264 objects:v289 count:16];
                              }
                              while (v120);
                              uint64_t v108 = v251;
                            }
                          }
                          else
                          {
                            char v250 = 0;
                          }

                          if ((v250 & 1) == 0) {
                            break;
                          }
                        }
                      }
                    }
                  }
                  if (++v104 == v103)
                  {
                    uint64_t v103 = [v253 countByEnumeratingWithState:&v276 objects:buf count:16];
                    if (v103) {
                      goto LABEL_117;
                    }
                    break;
                  }
                }
              }
              if ((v250 & 1) == 0)
              {
                char v131 = 0;
                goto LABEL_195;
              }
              long long v262 = 0u;
              long long v263 = 0u;
              long long v260 = 0u;
              long long v261 = 0u;
              uint64_t v124 = (void *)[-[NSSQLEntity rtreeIndexes](v101) allValues];
              uint64_t v125 = [v124 countByEnumeratingWithState:&v260 objects:v288 count:16];
              if (v125)
              {
                uint64_t v126 = *(void *)v261;
                do
                {
                  for (iuint64_t i = 0; ii != v125; ++ii)
                  {
                    if (*(void *)v261 != v126) {
                      objc_enumerationMutation(v124);
                    }
                    objc_msgSend(v95, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v260 + 1) + 8 * ii), "generateStatementsForStore:", v255));
                  }
                  uint64_t v125 = [v124 countByEnumeratingWithState:&v260 objects:v288 count:16];
                }
                while (v125);
              }
              uint64_t v100 = v248 + 1;
            }
            while (v248 + 1 != v246);
            uint64_t v99 = [obj countByEnumeratingWithState:&v280 objects:&v285 count:16];
            if (v99) {
              continue;
            }
            break;
          }
        }
        if ([v95 count])
        {
          -[NSSQLiteConnection beginTransaction](v252);
          long long v258 = 0u;
          long long v259 = 0u;
          long long v256 = 0u;
          long long v257 = 0u;
          uint64_t v128 = [v95 countByEnumeratingWithState:&v256 objects:v287 count:16];
          if (v128)
          {
            uint64_t v129 = *(void *)v257;
            do
            {
              for (juint64_t j = 0; jj != v128; ++jj)
              {
                if (*(void *)v257 != v129) {
                  objc_enumerationMutation(v95);
                }
                -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v252, *(void **)(*((void *)&v256 + 1) + 8 * jj));
              }
              uint64_t v128 = [v95 countByEnumeratingWithState:&v256 objects:v287 count:16];
            }
            while (v128);
          }
          char v131 = 1;
          -[NSSQLiteConnection commitTransaction](v252);
        }
        else
        {
          char v131 = 1;
        }
LABEL_195:
        -[NSSQLiteConnection endFetchAndRecycleStatement:](v252, 0);
        id v137 = v284;

        id v138 = 0;
        id v139 = v284;
        if ((v131 & 1) == 0)
        {
          if (v284)
          {
            *(void *)&long long v299 = v284;
          }
          else
          {
            uint64_t v140 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v140, v141, v142, v143, v144, v145, v146, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
            v147 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v286.f_bsize = 136315394;
              *(void *)&v286.f_iosize = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
              WORD2(v286.f_blocks) = 1024;
              *(_DWORD *)((char *)&v286.f_blocks + 6) = 5568;
              _os_log_fault_impl(&dword_18AB82000, v147, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", (uint8_t *)&v286, 0x12u);
            }
          }
          uint64_t v148 = v299;
          [(id)v299 userInfo];
          _NSCoreDataLog(1, @"Repairing RTree triggers failed with error = %@ and userInfo = %@", v149, v150, v151, v152, v153, v154, v148);
        }
        -[NSSQLCore _rebuildDerivedAttributeTriggerSchemaUsingConnection:recomputeValues:error:](v255, v252);
        goto LABEL_202;
      }
      goto LABEL_171;
    }
  }
LABEL_245:
  uint64_t v192 = a1;
  if ([*(id *)(a1 + 40) _persistentStoreCoordinator]
    && (*(unsigned char *)(*(void *)(a1 + 40) + 202) & 1) != 0
    && (-[NSSQLiteConnection setUpIndexTracking](*(id **)(a1 + 32)) & 1) == 0)
  {
    _NSCoreDataLog(2, @"failed to set up index tracking, disabling", v193, v194, v195, v196, v197, v198, (uint64_t)v243);
    *(_DWORD *)(*(void *)(a1 + 40) + 200) &= ~0x10000u;
  }
  uint64_t v199 = *(void *)(a1 + 40);
  if (!v199) {
    goto LABEL_292;
  }
  v200 = *(void **)(a1 + 32);
  os_unfair_lock_lock_with_options();
  v201 = (void *)[*(id *)(v199 + 160) objectForKey:0x1ED796A20];
  os_unfair_lock_unlock((os_unfair_lock_t)(v199 + 152));
  unint64_t v202 = [v201 unsignedIntegerValue];
  if ([(id)v199 _persistentStoreCoordinator]
    && (int)[v201 intValue] <= 639
    && ([(id)v199 isReadOnly] & 1) == 0)
  {
    if (v202 - 496 > 0x8F)
    {
      BOOL v219 = v202 > 0x27F;
      uint64_t v192 = a1;
      if (v219)
      {
LABEL_292:
        *(unsigned char *)(*(void *)(*(void *)(v192 + 48) + 8) + 24) = 0;
        goto LABEL_293;
      }
      v203 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v299 = 0u;
      long long v300 = 0u;
      long long v301 = 0u;
      long long v302 = 0u;
      uint64_t v220 = *(void *)(v199 + 104);
      if (v220) {
        v221 = *(void **)(v220 + 32);
      }
      else {
        v221 = 0;
      }
      uint64_t v222 = [v221 countByEnumeratingWithState:&v299 objects:&v286 count:16];
      if (v222)
      {
        uint64_t v223 = *(void *)v300;
        do
        {
          for (kuint64_t k = 0; kk != v222; ++kk)
          {
            if (*(void *)v300 != v223) {
              objc_enumerationMutation(v221);
            }
            v225 = *(void **)(*((void *)&v299 + 1) + 8 * kk);
            if (v225 && !v225[20])
            {
              v226 = -[NSSQLiteAdapter newSimplePrimaryKeyUpdateStatementForEntity:](*(NSSQLiteStatement **)(v199 + 112), v225);
              [v203 addObject:v226];
            }
          }
          uint64_t v222 = [v221 countByEnumeratingWithState:&v299 objects:&v286 count:16];
        }
        while (v222);
      }
    }
    else
    {
      v203 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v299 = 0u;
      long long v300 = 0u;
      long long v301 = 0u;
      long long v302 = 0u;
      uint64_t v204 = *(void *)(v199 + 104);
      if (v204) {
        v205 = *(void **)(v204 + 32);
      }
      else {
        v205 = 0;
      }
      uint64_t v206 = [v205 countByEnumeratingWithState:&v299 objects:&v286 count:16];
      if (v206)
      {
        uint64_t v207 = *(void *)v300;
        do
        {
          for (muint64_t m = 0; mm != v206; ++mm)
          {
            if (*(void *)v300 != v207) {
              objc_enumerationMutation(v205);
            }
            v209 = *(void **)(*((void *)&v299 + 1) + 8 * mm);
            if (v209 && !v209[20])
            {
              v210 = -[NSSQLiteAdapter newComplexPrimaryKeyUpdateStatementForEntity:](*(void *)(v199 + 112), v209);
              [v203 addObject:v210];
            }
          }
          uint64_t v206 = [v205 countByEnumeratingWithState:&v299 objects:&v286 count:16];
        }
        while (v206);
      }
    }
    -[NSSQLCore _updateToVersion640PrimaryKeyTableUsingStatements:connection:](v199, v203, v200);
    uint64_t v192 = a1;
    goto LABEL_292;
  }
LABEL_293:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (+[NSSQLCore debugDefault] >= 1) {
      _NSCoreDataLog(4, @"finished upgrade checks, bumping metadata", v227, v228, v229, v230, v231, v232, (uint64_t)v243);
    }
    -[NSSQLiteConnection beginTransaction](*(void *)(a1 + 32));
    v233 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "metadata"), "mutableCopy");
    [(__CFString *)v233 setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x1ED796A20];
    -[NSSQLiteConnection saveMetadata:](*(void **)(a1 + 32), v233);

    os_unfair_lock_lock_with_options();
    [*(id *)(*(void *)(a1 + 40) + 160) setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x1ED796A20];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 152));
    -[NSSQLiteConnection commitTransaction](*(void *)(a1 + 32));
    -[NSSQLiteConnection endFetchAndRecycleStatement:](*(void *)(a1 + 32), 0);
  }
}

void __38__NSSQLCore__disconnectAllConnections__block_invoke(uint64_t a1)
{
}

void __20__NSSQLCore_dealloc__block_invoke(uint64_t a1)
{
}

uint64_t __49__NSSQLCore__registerNewQueryGenerationSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v2 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208));
  uint64_t result = -[NSSQLiteConnection _registerNewQueryGenerationSnapshot:](v2, *(void **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)type
{
  return @"SQLite";
}

- (BOOL)_hasActiveGenerations
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self)
  {
    if (atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection))
    {
      uint64_t v3 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __34__NSSQLCore__hasActiveGenerations__block_invoke;
      v6[3] = &unk_1E544B9B0;
      v6[4] = self;
      v6[5] = &v7;
      -[NSSQLiteConnection performAndWait:](v3, (uint64_t)v6);
    }
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count")) {
    return 1;
  }
  id v20 = 0;
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = objc_msgSend(a3, "insertedObjects", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v13, "objectID"), "isTemporaryID")) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }
  BOOL v14 = -[NSSQLCore _obtainPermanentIDsForObjects:withNotification:error:]((uint64_t)self, v7, &v20) != 0;
  if (v20)
  {
    -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)a3, (uint64_t)v20);
  }
  return v14;
}

+ (BOOL)trackSQLiteDatabaseStatistics
{
  return _MergedGlobals_170;
}

- (void)freeQueryGenerationWithIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__NSSQLCore_freeQueryGenerationWithIdentifier___block_invoke;
    v4[3] = &unk_1E544B778;
    v4[4] = self;
    v4[5] = a3;
    -[NSSQLiteConnection performAndWait:](v3, (uint64_t)v4);
  }
}

- (NSSQLCore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  self;
  if (!a5)
  {

    uint64_t v81 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v82 = *MEMORY[0x1E4F1C3C8];
    uint64_t v83 = @"Cannot create an SQL store with a nil URL.";
    goto LABEL_160;
  }
  if (([a5 isFileURL] & 1) == 0)
  {
    uint64_t v84 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v85 = *MEMORY[0x1E4F1C3C8];
    uint64_t v83 = (__CFString *)[NSString stringWithFormat:@"CoreData SQL stores only support file URLs (got %@).", a5];
    uint64_t v81 = v84;
    uint64_t v82 = v85;
LABEL_160:
    objc_exception_throw((id)[v81 exceptionWithName:v82 reason:v83 userInfo:0]);
  }
  id v126 = 0;
  int v10 = +[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, a5);
  if (v10) {
    int v11 = 0x4000;
  }
  else {
    int v11 = 0;
  }
  self->_sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&self->_sqlCoreFlags & 0xFFFFBFFF | v11);
  id v95 = a3;
  if (v10)
  {
    if (!strcmp((const char *)[a5 fileSystemRepresentation], "/dev/null"))
    {
      if ((int)objc_msgSend((id)objc_msgSend(a6, "objectForKey:", @"NSPersistentStoreConnectionPoolMaxSize"), "intValue") >= 2)
      {

        id v89 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134060, @"Error - In Memory store at /dev/null can only have NSPersistentStoreConnectionPoolMaxSizeKey equal to 1", 0);
        objc_exception_throw(v89);
      }
      if (a6)
      {
        a6 = (id)[a6 mutableCopy];
        objc_msgSend(a6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1), @"NSPersistentStoreConnectionPoolMaxSize");
      }
      else
      {
        a6 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1), @"NSPersistentStoreConnectionPoolMaxSize");
      }
    }
    __int16 v125 = 0;
  }
  else
  {
    __int16 v125 = 0;
    if (!+[NSPersistentStore doURLStuff:a5 createdStubFile:(char *)&v125 + 1 readOnly:&v125 error:&v126 options:a6])
    {

      uint64_t v86 = [v126 code];
      uint64_t v87 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v126, @"NSCoreDataPrimaryError", 0);
      id v88 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], v86, @"Error validating url for store", v87);
      objc_exception_throw(v88);
    }
    if ((_BYTE)v125)
    {
      if (a3)
      {
        if ((objc_msgSend((id)objc_msgSend(a6, "valueForKey:", @"NSReadOnlyPersistentStoreOption"), "BOOLValue") & 1) == 0)
        {
          if ([a6 valueForKey:@"NSReadOnlyPersistentStoreOption"]
            && BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88))
          {
            if (v126) {
              uint64_t v90 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v126 forKey:*MEMORY[0x1E4F28A50]];
            }
            else {
              uint64_t v90 = 0;
            }
            id v91 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 513, @"Attempt to add read-only store read-write", v90);
            objc_exception_throw(v91);
          }
          if (a6)
          {
            a6 = (id)[a6 mutableCopy];
            objc_msgSend(a6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption");
          }
          else
          {
            a6 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption");
          }
          uint64_t v12 = [NSString stringWithUTF8String:"Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard error in the future; you must specify the NSReadOnlyPersistentStoreOption."];
          _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a5);
          long long v19 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = a5;
            _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard error in the future; you must specify the NSReadOnlyPersistentStoreOption.",
              (uint8_t *)location,
              0xCu);
          }
        }
      }
      else if (a6)
      {
        a6 = (id)[a6 mutableCopy];
        objc_msgSend(a6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption");
      }
      else
      {
        a6 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption");
      }
    }
  }
  v124.receiver = self;
  v124.super_class = (Class)NSSQLCore;
  id v20 = [(NSPersistentStore *)&v124 initWithPersistentStoreCoordinator:a3 configurationName:a4 URL:a5 options:a6];
  v97 = v20;
  uint64_t v21 = (uint64_t)v20;
  if (!v20) {
    return 0;
  }
  v20->_remoteNotificationTokeuint64_t n = -1;
  if (HIBYTE(v125))
  {
    uint64_t v21 = (uint64_t)v20;
    if (objc_msgSend((id)objc_msgSend(a6, "objectForKey:", @"NSPersistentStoreRemoveStoreOnCleanup"), "BOOLValue"))
    {
      [(NSPersistentStore *)v97 doFilesystemCleanupOnRemove:1];
      uint64_t v21 = (uint64_t)v97;
    }
  }
  if (a3)
  {
    id v94 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v93 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v92 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    uint64_t v22 = (void *)[a3 persistentStores];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v120 objects:v132 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v121;
LABEL_34:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v121 != v24) {
          objc_enumerationMutation(v22);
        }
        int v26 = *(void **)(*((void *)&v120 + 1) + 8 * v25);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [v22 countByEnumeratingWithState:&v120 objects:v132 count:16];
          if (v23) {
            goto LABEL_34;
          }
          goto LABEL_44;
        }
      }
      uint64_t v28 = (void *)[v26 model];
      if (!v28) {
        goto LABEL_44;
      }
      id v29 = a6;
      uint64_t v21 = (uint64_t)v97;
      uint64_t v30 = v28;
    }
    else
    {
LABEL_44:
      id v29 = a6;
      uint64_t v21 = (uint64_t)v97;
      uint64_t v30 = -[NSSQLModel initWithManagedObjectModel:configurationName:brokenHashVersion:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:brokenHashVersion:", [a3 managedObjectModel], 0, 0);
    }
    *(void *)(v21 + 104) = v30;
    if (!v30) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Got a nil sqlmodel" userInfo:0]);
    }
  }
  else
  {
    id v93 = 0;
    id v94 = 0;
    id v92 = 0;
    id v29 = a6;
  }
  *(_DWORD *)(v21 + 200) = *(_DWORD *)(v21 + 200) & 0xFFFFFFFE | +[NSSQLCore coloredLoggingDefault];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  uint64_t v31 = *(void *)(v21 + 104);
  if (v31) {
    uint64_t v32 = *(void **)(v31 + 32);
  }
  else {
    uint64_t v32 = 0;
  }
  uint64_t v33 = [v32 countByEnumeratingWithState:&v116 objects:v131 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v117;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v117 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v36 = *(void *)(*((void *)&v116 + 1) + 8 * i);
        if (v36 && (*(unsigned char *)(v36 + 280) & 2) != 0)
        {
          uint64_t v21 = (uint64_t)v97;
          *(_DWORD *)&v97->_sqlCoreFlags |= 0x2000u;
          goto LABEL_61;
        }
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v116 objects:v131 count:16];
      uint64_t v21 = (uint64_t)v97;
      if (v33) {
        continue;
      }
      break;
    }
  }
LABEL_61:
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  uint64_t v37 = *(void *)(v21 + 104);
  if (v37) {
    uint64_t v38 = *(void **)(v37 + 32);
  }
  else {
    uint64_t v38 = 0;
  }
  uint64_t v39 = [v38 countByEnumeratingWithState:&v112 objects:v130 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v113;
    while (2)
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v113 != v40) {
          objc_enumerationMutation(v38);
        }
        uint64_t v42 = *(void *)(*((void *)&v112 + 1) + 8 * j);
        if (v42 && (*(unsigned char *)(v42 + 280) & 1) != 0)
        {
          uint64_t v21 = (uint64_t)v97;
          *(_DWORD *)&v97->_sqlCoreFlags |= 2u;
          goto LABEL_74;
        }
      }
      uint64_t v39 = [v38 countByEnumeratingWithState:&v112 objects:v130 count:16];
      uint64_t v21 = (uint64_t)v97;
      if (v39) {
        continue;
      }
      break;
    }
  }
LABEL_74:
  int v43 = objc_msgSend((id)objc_msgSend(v29, "objectForKey:", @"NSPersistentStoreTrackIndexUseOptionKey"), "BOOLValue");
  if (v43) {
    int v44 = 0x10000;
  }
  else {
    int v44 = 0;
  }
  *(_DWORD *)(v21 + 200) = *(_DWORD *)(v21 + 200) & 0xFFFEFFFF | v44;
  if (v95) {
    int v45 = v43;
  }
  else {
    int v45 = 0;
  }
  if (v45 == 1)
  {
    +[_PFRoutines _getPFBundleVersionNumber]();
    id v46 = +[NSSQLiteIndexTrackingModel newModelForFrameworkVersion:]();
    -[_PFModelMap addManagedObjectModel:](v95[12], v46);
    uint64_t v47 = [[NSSQLModel alloc] initWithManagedObjectModel:v46];
    objc_msgSend(v92, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v46, "entitiesByName"), "allKeys"));
    [v94 setObject:v46 forKey:@"NSPersistentStoreTrackIndexUseOptionKey"];
    [v93 setObject:v47 forKey:@"NSPersistentStoreTrackIndexUseOptionKey"];
  }
  else if (!v95)
  {
    goto LABEL_86;
  }
  if (objc_msgSend((id)objc_msgSend(v29, "objectForKey:", @"NSPersistentStoreMirroringOptionsKey"), "objectForKey:", @"NSPersistentStoreMirroringDelegateOptionKey")|| objc_msgSend((id)objc_msgSend(v29, "objectForKey:", @"NSCloudKitMirroringDelegateReadOnlyOptionKey"), "BOOLValue"))
  {
    PFBundleVersiouint64_t n = (void *)+[_PFRoutines _getPFBundleVersionNumber]();
    uint64_t v49 = +[PFCloudKitMetadataModel newMetadataModelForFrameworkVersion:]((uint64_t)PFCloudKitMetadataModel, PFBundleVersion);
    -[_PFModelMap addManagedObjectModel:](v95[12], v49);
    objc_msgSend(v92, "addObjectsFromArray:", -[NSDictionary allKeys](-[NSManagedObjectModel entitiesByName](v49, "entitiesByName"), "allKeys"));
    [v94 setObject:v49 forKey:@"NSPersistentStoreMirroringDelegateOptionKey"];
    uint64_t v50 = [[NSSQLModel alloc] initWithManagedObjectModel:v49];
    [v93 setObject:v50 forKey:@"NSPersistentStoreMirroringDelegateOptionKey"];
  }
LABEL_86:
  [(id)v21 setAncillaryModels:v94];
  [(id)v21 setAncillarySQLModels:v93];
  if (v95) {
    -[NSSQLCore _setupHistoryModelForPSC:withExcludedEntityNames:](v21, (uint64_t)v95, v92);
  }
  if ([*(id *)(v21 + 224) count])
  {
    *(_DWORD *)(v21 + 200) |= 0x800u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    uint64_t v51 = (void *)[*(id *)(v21 + 232) allValues];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v108 objects:v129 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v109;
      do
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v109 != v53) {
            objc_enumerationMutation(v51);
          }
          uint64_t v55 = *(void *)(*((void *)&v108 + 1) + 8 * v54);
          if ((*(unsigned char *)(v21 + 201) & 0x20) == 0)
          {
            long long v106 = 0u;
            long long v107 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            uint64_t v56 = v55 ? *(void **)(v55 + 32) : 0;
            uint64_t v57 = [v56 countByEnumeratingWithState:&v104 objects:v128 count:16];
            if (v57)
            {
              uint64_t v58 = *(void *)v105;
              while (2)
              {
                for (uint64_t k = 0; k != v57; ++k)
                {
                  if (*(void *)v105 != v58) {
                    objc_enumerationMutation(v56);
                  }
                  uint64_t v60 = *(void *)(*((void *)&v104 + 1) + 8 * k);
                  if (v60 && (*(unsigned char *)(v60 + 280) & 2) != 0)
                  {
                    *(_DWORD *)&v97->_sqlCoreFlags |= 0x2000u;
                    id v29 = a6;
                    goto LABEL_108;
                  }
                }
                uint64_t v57 = [v56 countByEnumeratingWithState:&v104 objects:v128 count:16];
                id v29 = a6;
                if (v57) {
                  continue;
                }
                break;
              }
            }
          }
LABEL_108:
          uint64_t v21 = (uint64_t)v97;
          if ((*(unsigned char *)&v97->_sqlCoreFlags & 2) == 0)
          {
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            uint64_t v61 = v55 ? *(void **)(v55 + 32) : 0;
            uint64_t v62 = [v61 countByEnumeratingWithState:&v100 objects:v127 count:16];
            if (v62)
            {
              uint64_t v63 = *(void *)v101;
              while (2)
              {
                for (uint64_t m = 0; m != v62; ++m)
                {
                  if (*(void *)v101 != v63) {
                    objc_enumerationMutation(v61);
                  }
                  uint64_t v65 = *(void *)(*((void *)&v100 + 1) + 8 * m);
                  if (v65 && (*(unsigned char *)(v65 + 280) & 1) != 0)
                  {
                    *(_DWORD *)&v97->_sqlCoreFlags |= 2u;
                    id v29 = a6;
                    goto LABEL_122;
                  }
                }
                uint64_t v62 = [v61 countByEnumeratingWithState:&v100 objects:v127 count:16];
                id v29 = a6;
                if (v62) {
                  continue;
                }
                break;
              }
            }
          }
LABEL_122:
          ++v54;
        }
        while (v54 != v52);
        uint64_t v66 = [v51 countByEnumeratingWithState:&v108 objects:v129 count:16];
        uint64_t v52 = v66;
      }
      while (v66);
    }
  }
  self;
  *(void *)(v21 + 248) = +[NSSQLCore _databaseKeyFromValue:]((uint64_t)NSSQLCore, (void *)[v29 objectForKey:@"_NSSQLiteSEEKeychainItemOption"]);

  if (v95) {
    uint64_t v67 = [[NSGenerationalRowCache alloc] initWithStore:v21];
  }
  else {
    uint64_t v67 = 0;
  }
  *(void *)(v21 + 136) = v67;
  *(void *)(v21 + 112) = [[NSSQLiteAdapter alloc] initWithSQLCore:v21];
  uint64_t v68 = (void *)[a6 valueForKey:@"NSXPCStoreDelegate"];
  if ([v68 isEqual:MEMORY[0x1E4F1CC38]]) {
    *(_DWORD *)(v21 + 200) |= 0x100u;
  }
  *(_DWORD *)(v21 + 152) = 0;
  *(void *)(v21 + 216) = objc_alloc_init(_PFMutex);
  if (objc_msgSend((id)objc_msgSend(a6, "valueForKey:", @"NSPersistentStoreOrderKeyUpdateNotification"), "BOOLValue"))*(_DWORD *)(v21 + 200) |= 0x20u; {
  uint64_t v69 = [a6 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  }
  if (!v69)
  {
    uint64_t v27 = (NSSQLCore *)v21;
    unsigned int v70 = *(_DWORD *)(v21 + 200) & 0xFFFFFFE3;
    goto LABEL_146;
  }
  if ([(id)*MEMORY[0x1E4F28378] isEqualToString:v69])
  {
    uint64_t v27 = (NSSQLCore *)v21;
    unsigned int v70 = *(_DWORD *)(v21 + 200) & 0xFFFFFFE3 | 0x10;
LABEL_146:
    *(_DWORD *)(v21 + 200) = v70;
    goto LABEL_147;
  }
  if ([(id)*MEMORY[0x1E4F28358] isEqualToString:v69])
  {
    uint64_t v27 = (NSSQLCore *)v21;
    unsigned int v70 = *(_DWORD *)(v21 + 200) & 0xFFFFFFE3 | 0xC;
    goto LABEL_146;
  }
  if ([(id)*MEMORY[0x1E4F28348] isEqualToString:v69])
  {
    uint64_t v27 = (NSSQLCore *)v21;
    unsigned int v70 = *(_DWORD *)(v21 + 200) & 0xFFFFFFE3 | 8;
    goto LABEL_146;
  }
  if ([(id)*MEMORY[0x1E4F28340] isEqualToString:v69])
  {
    uint64_t v27 = (NSSQLCore *)v21;
    unsigned int v70 = *(_DWORD *)(v21 + 200) & 0xFFFFFFE3 | 4;
    goto LABEL_146;
  }
  if ([(id)*MEMORY[0x1E4F28368] isEqualToString:v69])
  {
    uint64_t v27 = (NSSQLCore *)v21;
    unsigned int v70 = *(_DWORD *)(v21 + 200) | 0x1C;
    goto LABEL_146;
  }
  _NSCoreDataLog(1, @"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey", v71, v72, v73, v74, v75, v76, v69);
  uint64_t v27 = (NSSQLCore *)v21;
LABEL_147:
  if (v95)
  {
    v77 = getprogname();
    if (!v77) {
      return (NSSQLCore *)v21;
    }
    uint64_t v27 = (NSSQLCore *)v21;
    if (!strncmp("assetsd", v77, 7uLL)
      || !strncmp("homed", v77, 5uLL)
      || !strncmp("mapssyncd", v77, 9uLL)
      || !strncmp("financed", v77, 8uLL)
      || !strncmp("xctest", v77, 6uLL))
    {
      objc_initWeak(location, (id)v21);
      global_queue = dispatch_get_global_queue(0, 0);
      uint64_t v79 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 0x30uLL, global_queue);
      *(void *)(v21 + 272) = v79;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke;
      handler[3] = &unk_1E544C3A0;
      objc_copyWeak(&v99, location);
      dispatch_source_set_event_handler(v79, handler);
      dispatch_resume(*(dispatch_object_t *)(v21 + 272));
      *(_DWORD *)(v21 + 200) &= ~0x20000u;
      objc_destroyWeak(&v99);
      objc_destroyWeak(location);
      return (NSSQLCore *)v21;
    }
  }
  return v27;
}

- (void)setAncillarySQLModels:(id)a3
{
  self->_ancillarySQLModels = 0;
  self->_ancillarySQLModels = (NSDictionary *)a3;
}

- (void)setAncillaryModels:(id)a3
{
  self->_ancillaryModels = 0;
  self->_ancillaryModels = (NSDictionary *)a3;
}

+ (id)_databaseKeyFromValue:(uint64_t)a1
{
  v27[3] = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return 0;
  }
  if (!byte_1EB270ABC)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"Illegal attempt to use SPI outside of entitled process"];
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v24);
    int v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(result) = 0;
      _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to use SPI outside of entitled process", (uint8_t *)&result, 2u);
    }
    return 0;
  }
  CFTypeRef result = 0;
  if (![a2 isNSData])
  {
    uint64_t v13 = *MEMORY[0x1E4F3BD48];
    v26[0] = *MEMORY[0x1E4F3B978];
    v26[1] = v13;
    v27[0] = *MEMORY[0x1E4F3B988];
    v27[1] = a2;
    void v26[2] = *MEMORY[0x1E4F3BC70];
    v27[2] = *MEMORY[0x1E4F1CFD0];
    uint64_t v14 = SecItemCopyMatching((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3], &result);
    if (v14)
    {
      uint64_t v15 = v14;
      CFStringRef v16 = SecCopyErrorMessageString(v14, 0);
      if (v16)
      {
        CFStringRef v22 = v16;
        uint64_t v23 = [NSString stringWithFormat:@"Keychain failed to return key for database encryption (error %d): %@", v15, v16];
        CFRelease(v22);
        id v20 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        long long v19 = (__CFString *)v23;
      }
      else
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3C8];
        long long v19 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Keychain failed to return key for database encryption (error %d)", v15);
        id v20 = v17;
        uint64_t v21 = v18;
      }
    }
    else
    {
      uint64_t v3 = (void *)result;
      if (result) {
        return v3;
      }
      id v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      long long v19 = @"Keychain did not return a key for database encryption";
    }
    objc_exception_throw((id)[v20 exceptionWithName:v21 reason:v19 userInfo:0]);
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_newZeroingDataWithBytes:length:", objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"));
  CFTypeRef result = v3;
  return v3;
}

- (void)_setupHistoryModelForPSC:(void *)a3 withExcludedEntityNames:
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (!a1
    || !objc_msgSend((id)objc_msgSend((id)a1, "options"), "objectForKey:", @"NSPersistentHistoryTrackingKey"))
  {
    return;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)a1, "options"), "objectForKey:", @"NSPersistentHistoryTrackingKey");
  uint64_t v7 = v6;
  if (v6 && ([v6 isNSDictionary] & 1) == 0 && (objc_msgSend(v7, "isNSNumber") & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersistentHistoryTrackingKey must be a NSNumber" userInfo:0]);
  }
  if (([v7 isNSDictionary] & 1) == 0
    && (![v7 isNSNumber] || !objc_msgSend(v7, "BOOLValue")))
  {
    _NSCoreDataLog(9, @"Persistent History is disabled - %@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    return;
  }
  if ([(id)a1 ancillaryModels]) {
    id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", objc_msgSend((id)a1, "ancillaryModels"));
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v67 = v8;
  uint64_t v65 = a3;
  if ([(id)a1 ancillarySQLModels]) {
    id v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", objc_msgSend((id)a1, "ancillarySQLModels"));
  }
  else {
    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  *(_DWORD *)(a1 + 200) |= 0x400u;
  uint64_t v15 = *(void **)(a1 + 104);
  [(id)a1 options];
  id v16 = +[_PFPersistentHistoryModel newPersistentHistoryManagedObjectModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v15);
  [v67 setObject:v16 forKey:@"NSPersistentHistoryTrackingKey"];
  uint64_t v17 = *(void **)(a1 + 104);
  [(id)a1 options];
  id v18 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]((uint64_t)_PFPersistentHistoryModel, v17);
  [v66 setObject:v18 forKey:@"NSPersistentHistoryTrackingKey"];
  if (a2)
  {
    -[_PFModelMap addManagedObjectModel:](*(void *)(a2 + 96), v16);
    id v19 = +[_PFPersistentHistoryFetchModel newFetchHistoryModelForCoordinator:andOptions:]();
    -[_PFModelMap addManagedObjectModel:](*(void *)(a2 + 96), v19);
  }
  if (![v7 isNSDictionary] || !objc_msgSend(v7, "count"))
  {
    uint64_t v28 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend((id)objc_msgSend(v7, "valueForKey:", @"NSPersistentHistoryTrackingExcludeUnmodifiedPropertiesForBatchUpdate"), "BOOLValue"))
  {
    _NSCoreDataLog(9, @"Persistent History Tracking Option - Batch Update Only Tracks Modified Properties", v20, v21, v22, v23, v24, v25, v64);
    *(_DWORD *)(a1 + 200) |= 0x8000u;
  }
  int v26 = (void *)[v7 objectForKey:@"NSPersistentHistoryTrackingEntitiesToInclude"];
  uint64_t v27 = v26;
  if (v26 && ([v26 isNSArray] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersistentHistoryTrackingEntitiesToInclude must be an NSArray of NSString" userInfo:0]);
  }
  if ([v27 count])
  {
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v27, "count"));
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v29 = [v27 countByEnumeratingWithState:&v80 objects:v89 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v81 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          if (([v32 isNSString] & 1) == 0)
          {
            uint64_t v62 = @"NSPersistentHistoryTrackingEntitiesToInclude must be an NSArray of NSString";
            goto LABEL_88;
          }
          if (![*(id *)(a1 + 104) entityNamed:v32])
          {
            uint64_t v62 = @"NSPersistentHistoryTrackingEntitiesToInclude has entities not included in the Managed Object Model";
LABEL_88:
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v62 userInfo:0]);
          }
          [v28 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v80 objects:v89 count:16];
      }
      while (v29);
    }
  }
  else
  {
    uint64_t v28 = 0;
  }
  uint64_t v49 = (void *)[v7 objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
  uint64_t v50 = v49;
  if (v49 && ([v49 isNSArray] & 1) == 0)
  {
    uint64_t v63 = @"NSPersistentHistoryTrackingEntitiesToExclude must be an NSArray";
    goto LABEL_95;
  }
  if ([v28 count] && objc_msgSend(v50, "count"))
  {
    uint64_t v63 = @"NSPersistentHistoryTrackingEntitiesToExclude & NSPersistentHistoryTrackingEntitiesToInclude are mutually exclusive, you cannot set both options";
LABEL_95:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v63 userInfo:0]);
  }
  if ([v50 count])
  {
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v50, "count"));
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v77 != v52) {
            objc_enumerationMutation(v50);
          }
          uint64_t v54 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          if (([v54 isNSString] & 1) == 0) {
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersistentHistoryTrackingEntitiesToExclude must be an NSArray of NSString" userInfo:0]);
          }
          if ([*(id *)(a1 + 104) entityNamed:v54])
          {
            [v33 addObject:v54];
          }
          else
          {
            uint64_t v55 = [NSString stringWithFormat:@"Entity (%@) was not found in model."];
            _NSCoreDataLog(2, v55, v56, v57, v58, v59, v60, v61, (uint64_t)v54);
          }
        }
        uint64_t v51 = [v50 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }
      while (v51);
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v33 = 0;
LABEL_37:
  uint64_t v34 = *(void *)(a1 + 104);
  if (v34) {
    uint64_t v35 = *(void **)(v34 + 24);
  }
  else {
    uint64_t v35 = 0;
  }
  uint64_t v36 = (void *)[v35 allKeys];
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v28 count])
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v39 = [v36 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v73 != v40) {
            objc_enumerationMutation(v36);
          }
          uint64_t v42 = *(void *)(*((void *)&v72 + 1) + 8 * k);
          if ([v28 containsObject:v42]) {
            int v43 = v37;
          }
          else {
            int v43 = v38;
          }
          [v43 addObject:v42];
        }
        uint64_t v39 = [v36 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v39);
    }
  }
  else if ([v33 count])
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v44 = [v36 countByEnumeratingWithState:&v68 objects:v86 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v69;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v69 != v45) {
            objc_enumerationMutation(v36);
          }
          uint64_t v47 = *(void *)(*((void *)&v68 + 1) + 8 * m);
          if ([v33 containsObject:v47]) {
            uint64_t v48 = v38;
          }
          else {
            uint64_t v48 = v37;
          }
          [v48 addObject:v47];
        }
        uint64_t v44 = [v36 countByEnumeratingWithState:&v68 objects:v86 count:16];
      }
      while (v44);
    }
  }
  else
  {
    [v37 addObjectsFromArray:v36];
  }
  if ([v65 count]) {
    objc_msgSend(v38, "addObjectsFromArray:", objc_msgSend(v65, "allObjects"));
  }
  v84[0] = @"NSPersistentHistoryTrackingEntitiesToInclude";
  v85[0] = [MEMORY[0x1E4F1CAD0] setWithArray:v37];
  v84[1] = @"NSPersistentHistoryTrackingEntitiesToExclude";
  v85[1] = [MEMORY[0x1E4F1CAD0] setWithArray:v38];
  *(void *)(a1 + 240) = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
  [(id)a1 setAncillaryModels:v67];
  [(id)a1 setAncillarySQLModels:v66];
}

- (NSDictionary)ancillaryModels
{
  return self->_ancillaryModels;
}

+ (Class)rowCacheClass
{
  return (Class)objc_opt_class();
}

- (id)identifier
{
  p_sqlCoreStateLocuint64_t k = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  id v4 = (id)[(NSMutableDictionary *)self->_storeMetadata objectForKey:@"NSStoreUUID"];
  os_unfair_lock_unlock(p_sqlCoreStateLock);
  return v4;
}

- (id)metadataToWrite
{
  if (!a1) {
    return 0;
  }
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 196));
  if (v2) {
    return 0;
  }
  os_unfair_lock_lock_with_options();
  id v3 = (id)[*(id *)(a1 + 160) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    self;
    objc_opt_class();
    self;
    dword_1E9122F54 = +[_PFRoutines sensitiveIntegerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.SQLDebug");
    unsigned __int8 v2 = +[_PFRoutines stringValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.ConcurrentFetching");
    if (v2 && (id v3 = v2, [v2 length])) {
      int v4 = [v3 intValue];
    }
    else {
      int v4 = 1;
    }
    dword_1E9122F58 = v4;
    BOOL v6 = (int)+[_PFTask getNumActiveProcessors]() > 1 && dword_1E9122F58 > 0;
    dword_1E9122F58 = v6;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast"), "timeIntervalSinceReferenceDate");
    NSSQLDistantPastTimeInterval = v7;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture"), "timeIntervalSinceReferenceDate");
    NSSQLDistantFutureTimeInterval = v8;
    qword_1E9122F68 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v9 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.BufferAllocations");
    qword_1E9122F60 = v9;
    if (v9 >= 1) {
      _NSCoreDataLog(2, @"Dictionary Result type overridden to use Buffered Results with level - %ld!!!", v10, v11, v12, v13, v14, v15, v9);
    }
    _CoreData_debugVMBufferAllocations = +[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.BufferAllocations.VMMemory");
    _CoreData_debugOneBufferAllocations = +[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.BufferAllocations.OneBuffer");
    _CoreData_debuguseManyResultSetsAllocations = +[_PFRoutines BOOLValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.BufferAllocations.ManyResultSets");
    _MergedGlobals_170 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.SQLDatabaseStatistics") != 0;
    id v16 = getprogname();
    if (v16)
    {
      uint64_t v17 = v16;
      if (!strncmp("xctest", v16, 6uLL) || !strncmp("mapssyncd", v17, 9uLL)) {
        byte_1E9122F51 = 1;
      }
    }
  }
}

- (void)_postChangeNotificationWithTransactionID:(uint64_t)a1
{
  if (a1)
  {
    int v4 = (void *)MEMORY[0x18C127630]();
    if ((*(unsigned char *)(a1 + 201) & 0x10) != 0) {
      uint64_t v5 = (void *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)_PFRoutines, (void *)a1);
    }
    else {
      uint64_t v5 = 0;
    }
    BOOL v6 = (const char *)[v5 UTF8String];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = *(_DWORD *)(a1 + 268);
      out_tokeuint64_t n = v8;
      if (v8 == -1)
      {
        if (notify_register_check(v6, &out_token))
        {
          _NSCoreDataLog(1, @"unable to check registration for posting store changed notification", v15, v16, v17, v18, v19, v20, v22);
          if (out_token != -1) {
            notify_cancel(out_token);
          }
          goto LABEL_13;
        }
        int v8 = out_token;
        int v21 = -1;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 268), (unsigned int *)&v21, out_token, memory_order_relaxed, memory_order_relaxed);
        if (v21 != -1)
        {
          notify_cancel(v8);
          int v8 = *(_DWORD *)(a1 + 268);
          out_tokeuint64_t n = v8;
        }
      }
      if (a2 && v8 != -1) {
        notify_set_state(v8, [a2 unsignedLongLongValue]);
      }
      if (+[NSSQLCore debugDefault] >= 1) {
        _NSCoreDataLog(9, @"Remote Change Notification - Posting for %@", v9, v10, v11, v12, v13, v14, (uint64_t)v5);
      }
      notify_post(v7);
    }
LABEL_13:
  }
}

+ (int64_t)bufferedAllocationsOverride
{
  return qword_1E9122F60;
}

- (void)_updateAutoVacuumMetadataWithValues:(unsigned __int8 *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v4 = objc_msgSend((id)objc_msgSend(a1, "metadata"), "mutableCopy");
    unsigned __int8 v5 = atomic_load(a1 + 196);
    if (v4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v6 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(a2);
            }
            objc_msgSend(v4, "setValue:forKey:", objc_msgSend(a2, "valueForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i)), *(void *)(*((void *)&v13 + 1) + 8 * i));
          }
          uint64_t v7 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
      int v10 = v5 & 1;
      uint64_t v11 = (uint64_t)a1;
      uint64_t v12 = v4;
    }
    else
    {
      int v10 = v5 & 1;
      uint64_t v11 = (uint64_t)a1;
      uint64_t v12 = a2;
    }
    -[NSSQLCore _setMetadata:clean:](v11, v12, v10);
  }
}

- (void)setMetadata:(id)a3
{
  if ([(NSPersistentStore *)self isReadOnly]) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Cannot set metadata in read-only store.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", self), @"NSAffectedStoresErrorKey", 0)));
  }
  id v5 = [(NSPersistentStore *)self _updatedMetadataWithSeed:a3 includeVersioning:1];
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(NSMutableDictionary *)self->_storeMetadata objectForKey:@"_NSAutoVacuumLevel"];
  os_unfair_lock_unlock(&self->_sqlCoreStateLock);
  if (v6) {
    [v5 setObject:v6 forKey:@"_NSAutoVacuumLevel"];
  }

  -[NSSQLCore _setMetadata:clean:]((uint64_t)self, v5, 0);
}

void __32__NSSQLCore__loadAndSetMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  if (-[NSSQLiteConnection canConnect](a2))
  {
    if (![*(id *)(a1 + 32) metadata])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      -[NSSQLCore _setMetadata:clean:](*(void *)(a1 + 32), v4, 1);
    }
    -[NSSQLiteConnection connect](a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLiteConnection fetchMetadata](a2);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      uint64_t v6 = (void *)[*(id *)(a1 + 32) _updatedMetadataWithSeed:v5 includeVersioning:0];
      BOOL v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:0x1ED796A00] != 0;
      uint64_t v8 = *(void *)(a1 + 32);
      -[NSSQLCore _setMetadata:clean:](v8, v6, v7);
    }
  }
}

- (void)_setMetadata:(int)a3 clean:
{
  if (!a1) {
    return;
  }
  uint64_t v6 = (void *)[a2 mutableCopy];
  os_unfair_lock_lock_with_options();
  BOOL v7 = *(void **)(a1 + 160);
  if (!v7)
  {
    uint64_t v8 = 0;
LABEL_7:

    *(void *)(a1 + 160) = v6;
    atomic_store(a3, (unsigned __int8 *)(a1 + 196));
    [(id)a1 _setMetadataDirty:a3 ^ 1u];
    goto LABEL_8;
  }
  if (([v7 isEqual:a2] & 1) == 0)
  {
    uint64_t v8 = *(void **)(a1 + 160);
    goto LABEL_7;
  }

LABEL_8:

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
}

- (id)metadata
{
  p_sqlCoreStateLocuint64_t k = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_storeMetadata;
  os_unfair_lock_unlock(p_sqlCoreStateLock);
  return v4;
}

- (BOOL)loadMetadata:(id *)a3
{
  if (!self)
  {
    BOOL v9 = 1;
    if (!a3) {
      return !v9;
    }
    goto LABEL_6;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__23;
  uint64_t v23 = __Block_byref_object_dispose__23;
  uint64_t v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __32__NSSQLCore__loadAndSetMetadata__block_invoke;
  v18[3] = &unk_1E544D710;
  v18[4] = self;
  v18[5] = &v19;
  if ((*(unsigned char *)&self->_sqlCoreFlags & 0x40) != 0)
  {
    uint64_t v6 = [NSSQLBlockRequestContext alloc];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = (uint64_t)__32__NSSQLCore__loadAndSetMetadata__block_invoke_2;
    long long v15 = (void (*)(uint64_t, uint64_t))&unk_1E544D738;
    long long v16 = (void (*)(uint64_t))v18;
    BOOL v7 = [(NSSQLBlockRequestContext *)v6 initWithBlock:&v12 context:0 sqlCore:self];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v7, 0);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = (uint64_t)&v12;
    uint64_t v14 = 0x3052000000;
    long long v15 = __Block_byref_object_copy__23;
    long long v16 = __Block_byref_object_dispose__23;
    uint64_t v17 = 0;
    uint64_t v5 = -[NSSQLCore schemaValidationConnection](self);
    *(void *)(v13 + 40) = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __32__NSSQLCore__loadAndSetMetadata__block_invoke_3;
    v11[3] = &unk_1E544B908;
    v11[4] = v18;
    v11[5] = &v12;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v5, (uint64_t)v11);
    _Block_object_dispose(&v12, 8);
  }
  uint64_t v8 = v20[5];
  _Block_object_dispose(&v19, 8);
  BOOL v9 = v8 == 0;
  if (a3)
  {
LABEL_6:
    if (v9) {
      *a3 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134080 userInfo:0];
    }
  }
  return !v9;
}

- (void)schemaValidationConnection
{
  if ((result[25] & 0x40) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = result;
    CFTypeRef result = (void *)result[15];
    if (!result)
    {
      CFTypeRef result = [[NSSQLiteConnection alloc] initForSQLCore:v1];
      v1[15] = result;
    }
  }
  return result;
}

- (BOOL)supportsConcurrentRequestHandling
{
  int v3 = -[NSSQLCore supportsComplexFeatures](self);
  if (v3)
  {
    id v4 = [(NSDictionary *)[(NSPersistentStore *)self options] valueForKey:@"NSPersistentStoreConnectionPoolMaxSize"];
    if ([v4 integerValue] > 0) {
      goto LABEL_3;
    }
    if (v4)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    uint64_t v5 = getprogname();
    if (!v5 || (int v3 = strncmp("YouTube", v5, 7uLL)) != 0) {
LABEL_3:
    }
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)load:(id *)a3
{
  if (self)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 0;
    id v4 = -[NSSQLCore schemaValidationConnection](self);
    if (-[NSSQLiteConnection canConnect]((uint64_t)v4)
      && (!-[NSSQLiteConnection databaseIsEmpty]((BOOL)v4) || (*((unsigned char *)&self->_sqlCoreFlags + 1) & 0x40) != 0))
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__NSSQLCore__ensureDatabaseMatchesModel__block_invoke;
      v8[3] = &unk_1E544B500;
      v8[4] = v4;
      v8[5] = self;
      v8[6] = v9;
      -[NSSQLiteConnection performAndWait:]((uint64_t)v4, (uint64_t)v8);
    }
    _Block_object_dispose(v9, 8);
  }
  int v5 = *(_DWORD *)&self->_sqlCoreFlags | 0x40;
  self->_sqlCoreFlags = (_sqlCoreFlags)v5;
  schemaValidationConnectiouint64_t n = self->_schemaValidationConnection;
  if (schemaValidationConnection) {
    LODWORD(schemaValidationConnection) = ((*(_DWORD *)&schemaValidationConnection->_sqliteConnectionFlags & 0xC) == 4) << 7;
  }
  self->_sqlCoreFlags = (_sqlCoreFlags)(schemaValidationConnection | v5 & 0xFFFFFF7F);
  self->_dispatchManager = [[NSSQLCoreDispatchManager alloc] initWithSQLCore:self seedConnection:self->_schemaValidationConnection];

  self->_schemaValidationConnectiouint64_t n = 0;
  return 1;
}

- (void)_setupObserver:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char v5 = objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", @"NSPersistentStoreRemoteChangeNotificationOptionKey"), "BOOLValue");
  int v6 = objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", @"NSXPCStorePostUpdateNotifications"), "BOOLValue");
  _sqlCoreFlags sqlCoreFlags = self->_sqlCoreFlags;
  if ((v5 & 1) != 0 || v6)
  {
    self->__sqlCoreFlags sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&sqlCoreFlags | 0x1000);
LABEL_6:
    if (+[NSSQLCore debugDefault] >= 1)
    {
      id v8 = [(NSSQLCore *)self identifier];
      _NSCoreDataLog(9, @"Remote Change Notification - registered core observer for %@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    }
    long long v15 = [_NSSQLCoreConnectionObserver alloc];
    if (v15)
    {
      v39.receiver = v15;
      v39.super_class = (Class)_NSSQLCoreConnectionObserver;
      long long v16 = [(NSPersistentStore *)&v39 init];
      uint64_t v17 = (_NSSQLCoreConnectionObserver *)v16;
      if (!v16) {
        goto LABEL_20;
      }
      LODWORD(v16->super._configurationName) = -1;
      objc_storeWeak((id *)&v16->super._url, self);
      objc_storeWeak((id *)&v17->_psc, a3);
      if ((*((unsigned char *)&self->_sqlCoreFlags + 1) & 0x10) == 0) {
        goto LABEL_20;
      }
      uint64_t v18 = (void *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)_PFRoutines, self);
      if (!v18) {
        goto LABEL_20;
      }
      v17->_queue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@.queue.%p", v18, v17), "UTF8String"], 0);
      objc_initWeak(&location, v17);
      uint64_t v19 = (const char *)[v18 fileSystemRepresentation];
      queue = v17->_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __63___NSSQLCoreConnectionObserver_initWithSQLCore_andCoordinator___block_invoke;
      handler[3] = &unk_1E544D958;
      objc_copyWeak(&v37, &location);
      uint64_t v21 = notify_register_dispatch(v19, &v17->_token, queue, handler);
      if (!v21)
      {
        if (+[NSSQLCore debugDefault] >= 1) {
          _NSCoreDataLog(9, @"Remote Change Notification - registered for  %@", v30, v31, v32, v33, v34, v35, (uint64_t)v18);
        }
        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
        goto LABEL_20;
      }
      uint64_t v22 = [NSString stringWithUTF8String:"Remote Change Notification - Failed to setup notification listener for NSPersistentStoreRemoteChangeNotification: %d"];
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, v21);
      uint64_t v29 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v41 = v21;
        _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Remote Change Notification - Failed to setup notification listener for NSPersistentStoreRemoteChangeNotification: %d", buf, 8u);
      }

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
    uint64_t v17 = 0;
LABEL_20:
    self->_observer = v17;
    return;
  }
  if ((*(_WORD *)&sqlCoreFlags & 0x1000) != 0) {
    goto LABEL_6;
  }
}

- (id)currentChangeToken
{
  unsigned __int8 v2 = self;
  if (self)
  {
    if ((*((unsigned char *)&self->_sqlCoreFlags + 1) & 4) != 0)
    {
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2020000000;
      uint64_t v16 = -1;
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __31__NSSQLCore_currentChangeToken__block_invoke;
      uint64_t v10 = &unk_1E544D898;
      uint64_t v11 = self;
      uint64_t v12 = &v13;
      int v3 = [[NSSQLBlockRequestContext alloc] initWithBlock:&v7 context:0 sqlCore:self];
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v2, v3, 0);

      if (v14[3] == -1)
      {
        char v5 = 0;
      }
      else
      {
        id v4 = [_NSPersistentHistoryToken alloc];
        char v5 = -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:](v4, "initWithTransactionNumber:andStoreID:", objc_msgSend(NSNumber, "numberWithLongLong:", v14[3], v7, v8, v9, v10, v11, v12), -[NSSQLCore identifier](v2, "identifier"));
      }
      unsigned __int8 v2 = v5;
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (void)_initializeQueryGenerationConnectionForProtectionClasses
{
  if (a1)
  {
    unsigned __int8 v2 = getprogname();
    BOOL v3 = v2 && strcmp("routined", v2) == 0;
    if ([a1 supportsGenerationalQuerying])
    {
      if (([a1 isReadOnly] & 1) == 0)
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "options"), "objectForKey:", @"NSPersistentStoreFileProtectionKey");
        if (v4)
        {
          char v5 = (void *)v4;
          if ([a1 _isCloudKitOptioned])
          {
            if (([v5 isEqualToString:*MEMORY[0x1E4F28348]] & 1) != 0
              || [v5 isEqualToString:*MEMORY[0x1E4F28340]])
            {
              if (atomic_load(a1 + 26))
              {
                if (!v3) {
                  return;
                }
              }
              else
              {
                BOOL GenerationTracking = -[NSSQLCore _initializeQueryGenerationTrackingConnection]((BOOL)a1);
                if (!v3) {
                  return;
                }
                if (GenerationTracking)
                {
                  uint64_t v8 = [a1 options];
                  uint64_t v15 = @"Preloading query generation connection success for store with options: %@";
LABEL_18:
                  _NSCoreDataLog(2, (uint64_t)v15, v9, v10, v11, v12, v13, v14, v8);
                  return;
                }
              }
              uint64_t v8 = [a1 options];
              uint64_t v15 = @"Preloading query generation connection failed without a reported error for store with options: %@";
              goto LABEL_18;
            }
          }
        }
      }
    }
  }
}

sqlite3_int64 __31__NSSQLCore_currentChangeToken__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  -[NSSQLiteConnection connect](v3);
  sqlite3_int64 result = -[NSSQLiteConnection fetchMaxPrimaryKeyForEntity:](v3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"TRANSACTION"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (uint64_t)_obtainPermanentIDsForObjects:(uint64_t)result withNotification:(void *)a2 error:(void *)a3
{
  uint64_t v84 = a3;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = (void *)result;
    if ([a2 count])
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      uint64_t v94 = (uint64_t)a2;
      uint64_t v5 = [a2 countByEnumeratingWithState:&v103 objects:v109 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v104;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v104 != v6) {
              objc_enumerationMutation((id)v94);
            }
            uint64_t v85 = [*(id *)(*((void *)&v103 + 1) + 8 * i) managedObjectContext];
            if (v85)
            {
              id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v87 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", objc_msgSend(v4, "model"), 0);
              objc_msgSend(v87, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "ancillarySQLModels"), "allValues"));
              id v92 = (char *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              size_t v9 = [v87 count];
              uint64_t v86 = malloc_type_calloc(8uLL, v9, 0x207C3624uLL);
              id v93 = malloc_type_calloc(8uLL, v9, 0xD93A6B42uLL);
              if ([v87 count])
              {
                unint64_t v10 = 0;
                uint64_t v91 = 0;
                do
                {
                  uint64_t v11 = [v87 objectAtIndexedSubscript:v10];
                  uint64_t v12 = [NSNumber numberWithInt:v10];
                  if (v11)
                  {
                    objc_msgSend(v92, "setObject:forKeyedSubscript:", v12, objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v11 + 60)));
                    uint64_t v13 = *(void **)(v11 + 32);
                  }
                  else
                  {
                    objc_msgSend(v92, "setObject:forKeyedSubscript:", v12, objc_msgSend(NSNumber, "numberWithUnsignedInt:", 0));
                    uint64_t v13 = 0;
                  }
                  uint64_t v14 = [v13 count];
                  int v15 = v14;
                  v86[v10] = v14;
                  v93[v10] = malloc_type_calloc(0x18uLL, v14 + 1, 0x3AA132AuLL);
                  uint64_t v91 = (v91 + v15);
                  ++v10;
                }
                while ([v87 count] > v10);
              }
              else
              {
                uint64_t v91 = 0;
              }
              long long v101 = 0u;
              long long v102 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              uint64_t v16 = [(id)v94 countByEnumeratingWithState:&v99 objects:v108 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v100;
                do
                {
                  uint64_t v18 = 0;
                  do
                  {
                    if (*(void *)v100 != v17) {
                      objc_enumerationMutation((id)v94);
                    }
                    uint64_t v19 = *(void **)(*((void *)&v99 + 1) + 8 * v18);
                    if (objc_msgSend((id)objc_msgSend(v19, "objectID"), "isTemporaryID"))
                    {
                      uint64_t v20 = (void *)[v19 entity];
                      if (v20) {
                        uint64_t v21 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v4, v20);
                      }
                      else {
                        uint64_t v21 = 0;
                      }
                      uint64_t v22 = (_DWORD *)[v21 rootEntity];
                      uint64_t v23 = NSNumber;
                      uint64_t v24 = [v22 model];
                      if (v24) {
                        uint64_t v25 = *(unsigned int *)(v24 + 60);
                      }
                      else {
                        uint64_t v25 = 0;
                      }
                      int v26 = objc_msgSend((id)objc_msgSend(v92, "objectForKeyedSubscript:", objc_msgSend(v23, "numberWithUnsignedInt:", v25)), "intValue");
                      if (v22) {
                        int v27 = v22[46];
                      }
                      else {
                        int v27 = 0;
                      }
                      uint64_t v28 = v93[v26];
                      uint64_t v29 = [v22 model];
                      if (v29) {
                        int v30 = *(_DWORD *)(v29 + 60);
                      }
                      else {
                        int v30 = 0;
                      }
                      uint64_t v31 = 24 * (v27 - v30);
                      ++*(void *)(v28 + v31);
                      uint64_t v32 = *(void **)(v28 + v31 + 16);
                      if (v32) {
                        [v32 addObject:v19];
                      }
                      else {
                        *(void *)(v28 + v31 + 16) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v19, 0);
                      }
                    }
                    ++v18;
                  }
                  while (v16 != v18);
                  uint64_t v33 = [(id)v94 countByEnumeratingWithState:&v99 objects:v108 count:16];
                  uint64_t v16 = v33;
                }
                while (v33);
              }

              Mutable = CFDictionaryCreateMutable(0, (int)v91, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              if ([v87 count])
              {
                unint64_t v35 = 0;
                do
                {
                  uint64_t v36 = [v87 objectAtIndexedSubscript:v35];
                  uint64_t v37 = v86[v35];
                  if (v37 >= 1)
                  {
                    uint64_t v38 = v36;
                    uint64_t v39 = 0;
                    uint64_t v40 = (void *)(v93[v35] + 24);
                    do
                    {
                      if (v38) {
                        uint64_t v41 = *(unsigned int *)(v38 + 60);
                      }
                      else {
                        uint64_t v41 = 0;
                      }
                      uint64_t v42 = _sqlEntityForEntityID(v38, v39 + v41 + 1);
                      if (*v40) {
                        CFDictionarySetValue(Mutable, v42, (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInteger:"));
                      }
                      ++v39;
                      v40 += 3;
                    }
                    while (v37 != v39);
                  }
                  ++v35;
                }
                while ([v87 count] > v35);
              }
              int v43 = [[NSSQLGenerateObjectIDRequestContext alloc] initForEntitiesAndCounts:Mutable context:v85 sqlCore:v4];
              CFRelease(Mutable);
              id v83 = v43;
              -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v4, v43, 1);
              uint64_t v44 = [v43 result];
              uint64_t v45 = (void *)v44;
              if (v44)
              {
                unint64_t v46 = 0;
                id v88 = (void *)v44;
                while (objc_msgSend(v87, "count", v83) > v46)
                {
                  uint64_t v47 = [v87 objectAtIndexedSubscript:v46];
                  uint64_t v91 = v86[v46];
                  if (v91 >= 1)
                  {
                    uint64_t v48 = v47;
                    id v92 = (char *)v93[v46];
                    uint64_t v49 = 1;
                    uint64_t v89 = v47;
                    unint64_t v90 = v46;
                    do
                    {
                      if (v48) {
                        uint64_t v50 = *(unsigned int *)(v48 + 60);
                      }
                      else {
                        uint64_t v50 = 0;
                      }
                      uint64_t v51 = objc_msgSend((id)objc_msgSend(v45, "objectForKey:", _sqlEntityForEntityID(v48, v49 + v50)), "integerValue");
                      uint64_t v94 = v49;
                      uint64_t v52 = v92;
                      uint64_t v53 = &v92[24 * v49];
                      *((void *)v53 + 1) = v51;
                      uint64_t v54 = v53 + 8;
                      if (*(void *)&v52[24 * v49])
                      {
                        long long v97 = 0u;
                        long long v98 = 0u;
                        long long v95 = 0u;
                        long long v96 = 0u;
                        uint64_t v55 = *(void **)&v92[24 * v94 + 16];
                        uint64_t v56 = [v55 countByEnumeratingWithState:&v95 objects:v107 count:16];
                        if (v56)
                        {
                          uint64_t v57 = *(void *)v96;
                          do
                          {
                            for (uint64_t j = 0; j != v56; ++j)
                            {
                              if (*(void *)v96 != v57) {
                                objc_enumerationMutation(v55);
                              }
                              uint64_t v59 = *(void **)(*((void *)&v95 + 1) + 8 * j);
                              uint64_t v60 = (void *)[v59 entity];
                              if (v60) {
                                uint64_t v61 = _sqlCoreLookupSQLEntityForEntityDescription(v4, v60);
                              }
                              else {
                                uint64_t v61 = 0;
                              }
                              uint64_t v62 = (void *)[v4 newObjectIDForEntity:v61 pk:(*v54)--];
                              [v8 setObject:v59 forKey:v62];
                            }
                            uint64_t v56 = [v55 countByEnumeratingWithState:&v95 objects:v107 count:16];
                          }
                          while (v56);
                        }
                      }
                      uint64_t v49 = v94 + 1;
                      unint64_t v46 = v90;
                      uint64_t v45 = v88;
                      uint64_t v48 = v89;
                    }
                    while (v94 != v91);
                  }
                  ++v46;
                }
                id v64 = 0;
                int v65 = 1;
              }
              else
              {
                if (v43) {
                  uint64_t v63 = (void *)v43[6];
                }
                else {
                  uint64_t v63 = 0;
                }
                id v64 = v63;
                int v65 = 0;
              }
              if (v93)
              {
                for (unint64_t k = 0; objc_msgSend(v87, "count", v83) > k; ++k)
                {
                  uint64_t v67 = (id *)v93[k];
                  uint64_t v68 = v86[k];
                  if (v68 >= 1)
                  {
                    long long v69 = v67 + 5;
                    do
                    {

                      v69 += 3;
                      --v68;
                    }
                    while (v68);
                  }
                  free(v67);
                }
                free(v93);
              }

              free(v86);
              if (v64)
              {

                objc_exception_throw(v64);
              }
              if (v65)
              {
                unint64_t v70 = [v8 count];
                unint64_t v71 = v70;
                uint64_t v94 = (uint64_t)&v83;
                if (v70 <= 1) {
                  uint64_t v72 = 1;
                }
                else {
                  uint64_t v72 = v70;
                }
                if (v70 >= 0x201) {
                  uint64_t v73 = 1;
                }
                else {
                  uint64_t v73 = v72;
                }
                long long v74 = (char *)&v83 - ((8 * v73 + 15) & 0xFFFFFFFFFFFFFFF0);
                size_t v75 = 8 * v72;
                if (v70 > 0x200)
                {
                  long long v74 = (char *)NSAllocateScannedUncollectable();
                  long long v76 = (char *)NSAllocateScannedUncollectable();
                }
                else
                {
                  bzero((char *)&v83 - ((8 * v73 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v72);
                  long long v76 = (char *)&v83 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
                  bzero(v76, v75);
                }
                BOOL v78 = v71 < 0x201;
                [v8 getObjects:v76 andKeys:v74];
                long long v79 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v74 count:v71];
                long long v80 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v76 count:v71];
                long long v77 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](v85, v80, v79);

                if (!v78)
                {
                  NSZoneFree(0, v74);
                  NSZoneFree(0, v76);
                }
              }
              else
              {
                long long v77 = 0;
              }

              uint64_t v81 = [v4 doFilesystemCleanupOnRemove:0];
              if (v77)
              {
                if (v84)
                {
                  void *v84 = v77;
                }
                else
                {
                  long long v82 = (void *)MEMORY[0x18C127630](v81);
                  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v77);
                }
              }
              else if (v84)
              {
                void *v84 = 0;
              }
              if (v65) {
                return NSArray_EmptyArray;
              }
              else {
                return 0;
              }
            }
          }
          uint64_t v5 = [(id)v94 countByEnumeratingWithState:&v103 objects:v109 count:16];
          sqlite3_int64 result = 0;
          if (v5) {
            continue;
          }
          break;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return NSArray_EmptyArray;
    }
  }
  return result;
}

- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4
{
  id v5 = objc_alloc([(NSSQLCore *)self objectIDFactoryForSQLEntity:a3]);

  return (id)[v5 initWithPK64:a4];
}

- (id)currentQueryGeneration
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (![(NSSQLCore *)self supportsGenerationalQuerying])
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    int v27 = @"store";
    v28[0] = self;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    objc_exception_throw((id)[v17 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unsupported feature in this configuration" userInfo:v18]);
  }
  unint64_t v3 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
  if (v3 || -[NSSQLCore _initializeQueryGenerationTrackingConnection]((BOOL)self))
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3052000000;
    uint64_t v24 = __Block_byref_object_copy__23;
    uint64_t v25 = __Block_byref_object_dispose__23;
    uint64_t v26 = 0;
    os_unfair_lock_lock_with_options();
    BOOL remoteStoresDidChange = self->_remoteStoresDidChange;
    os_unfair_lock_unlock(&self->_sqlCoreStateLock);
    if (remoteStoresDidChange)
    {
      uint64_t v11 = [NSSQLBlockRequestContext alloc];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __35__NSSQLCore_currentQueryGeneration__block_invoke;
      v20[3] = &unk_1E544D760;
      v20[4] = self;
      uint64_t v12 = [(NSSQLBlockRequestContext *)v11 initWithBlock:v20 context:0 sqlCore:self];
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v12, 0);
    }
    uint64_t v13 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__35__NSSQLCore_currentQueryGeneration__block_invoke_528;
    v19[3] = (uint64_t)&unk_1E544B9B0;
    v19[4] = (uint64_t)self;
    v19[5] = (uint64_t)&v21;
    -[NSSQLiteConnection performAndWait:](v13, (uint64_t)v19);
    if (v22[5])
    {
      uint64_t v14 = [_NSQueryGenerationToken alloc];
      int v15 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v14, (void *)v22[5], self, 1);
    }
    else
    {
      int v15 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    _NSCoreDataLog(1, @"initializing query generations connection for current failed.", v4, v5, v6, v7, v8, v9, v19[0]);
    return 0;
  }
  return v15;
}

- (void)_useModel:(id *)a1
{
  if (a1 && a1[13] != a2)
  {
    uint64_t v4 = (void *)MEMORY[0x18C127630]();
    id v5 = a2;

    a1[13] = a2;
    -[NSSQLiteAdapter _useModel:]([a1 adapter], a2);
    -[NSSQLCore _setupHistoryModelForPSC:withExcludedEntityNames:]((uint64_t)a1, 0, (void *)NSSet_EmptySet);
  }
}

- (void)willRemoveFromPersistentStoreCoordinator:(id)a3
{
  observer = self->_observer;
  if (observer)
  {
    objc_storeWeak((id *)&observer->_core, 0);

    self->_observer = 0;
  }
  id v6 = -[NSSQLCore harvestIndexStatisticsFromConnections]((uint64_t)self);
  if ([v6 count])
  {
    uint64_t v11 = 0;
    uint64_t v7 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Saving index statistics", &v11);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__NSSQLCore_willRemoveFromPersistentStoreCoordinator___block_invoke;
    v10[3] = &unk_1E544D7A8;
    v10[4] = v6;
    v10[5] = self;
    uint64_t v8 = [[NSSQLBlockRequestContext alloc] initWithBlock:v10 context:0 sqlCore:self];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v8, 0);

    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v11, v7);
  }
  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)NSSQLCore;
  [(NSPersistentStore *)&v9 willRemoveFromPersistentStoreCoordinator:a3];
}

- (id)harvestIndexStatisticsFromConnections
{
  if (!a1 || (*(unsigned char *)(a1 + 202) & 1) == 0) {
    return 0;
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__23;
  objc_super v9 = __Block_byref_object_dispose__23;
  uint64_t v10 = 0;
  uint64_t v2 = *(void *)(a1 + 128);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke;
  v4[3] = &unk_1E544D910;
  v4[4] = &v5;
  -[NSSQLCoreDispatchManager enumerateAvailableConnectionsWithBlock:](v2, (uint64_t)v4);
  id v1 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v1;
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return v5;
  }
  if (![a3 isFileURL]) {
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "path")) & 1) == 0)
  {
    if (a5)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v18 = objc_msgSend(v17, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E4F289D0], 0);
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v18];
    }
    return 0;
  }
  objc_super v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = [NSNumber numberWithDouble:240.0];
  uint64_t v21 = @"journal_mode";
  v22[0] = [MEMORY[0x1E4F1CA98] null];
  uint64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"NSPersistentStoreTimeoutOption", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1), @"NSSQLitePragmasOption", 0);
  uint64_t v12 = v11;
  if (a4)
  {
    [v11 addEntriesFromDictionary:a4];
    [v12 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    uint64_t v13 = (void *)[a4 objectForKey:@"NSSQLitePragmasOption"];
    if ([v13 objectForKey:@"journal_mode"])
    {
      uint64_t v14 = (void *)[v13 mutableCopy];
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode");
      [v12 setObject:v14 forKey:@"NSSQLitePragmasOption"];
    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, v5, a4, (uint64_t *)a5))return 0; {
  int v15 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:v5 options:v12];
  }
  if ([v15 loadMetadata:a5])
  {
    id v5 = (id)objc_msgSend((id)objc_msgSend(v15, "metadata"), "copy");
    int v16 = 0;
  }
  else
  {
    id v5 = 0;
    int v16 = 1;
  }
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v15);

  if ((v16 | 2) != 2) {
    return 0;
  }
  uint64_t v19 = (void *)[v5 objectForKey:@"NSStoreType"];
  if (v19 && ![v19 isEqualToString:@"SQLite"]) {
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  observer = self->_observer;
  if (observer)
  {
    objc_storeWeak((id *)&observer->_core, 0);

    self->_observer = 0;
  }
  cache_event_source = self->_cache_event_source;
  if (cache_event_source)
  {
    dispatch_source_cancel(cache_event_source);
    if ((*((unsigned char *)&self->_sqlCoreFlags + 2) & 2) != 0)
    {
      dispatch_resume((dispatch_object_t)self->_cache_event_source);
      *(_DWORD *)&self->_sqlCoreFlags &= ~0x20000u;
    }
    dispatch_release((dispatch_object_t)self->_cache_event_source);
    self->_cache_event_source = 0;
  }
  schemaValidationConnectiouint64_t n = self->_schemaValidationConnection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __20__NSSQLCore_dealloc__block_invoke;
  v17[3] = &unk_1E544B868;
  v17[4] = self;
  -[NSSQLiteConnection performAndWait:]((uint64_t)schemaValidationConnection, (uint64_t)v17);

  self->_schemaValidationConnectiouint64_t n = 0;
  self->_adapter = 0;

  self->_generationalRowCache = 0;
  self->_storeMetadata = 0;

  self->_usedIndexes = 0;
  self->_historyTrackingOptions = 0;
  id v6 = (void *)atomic_load((unint64_t *)&self->_externalDataReferencesDirectory);

  atomic_store(0, (unint64_t *)&self->_externalDataReferencesDirectory);
  uint64_t v7 = (void *)atomic_load((unint64_t *)&self->_externalDataLinksDirectory);

  atomic_store(0, (unint64_t *)&self->_externalDataLinksDirectory);
  uint64_t v8 = (void *)atomic_load((unint64_t *)&self->_fileBackedFuturesPath);

  atomic_store(0, (unint64_t *)&self->_fileBackedFuturesPath);
  -[NSSQLCoreDispatchManager disconnectAllConnections]((uint64_t)self->_dispatchManager);

  self->_dispatchManager = 0;
  remoteNotificationTokeuint64_t n = self->_remoteNotificationToken;
  if (remoteNotificationToken != -1)
  {
    notify_cancel(remoteNotificationToken);
    self->_remoteNotificationTokeuint64_t n = -1;
  }
  p_queryGenerationTrackingConnectiouint64_t n = (unint64_t *)&self->_queryGenerationTrackingConnection;
  if (atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection))
  {
    uint64_t v12 = atomic_load(p_queryGenerationTrackingConnection);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __20__NSSQLCore_dealloc__block_invoke_2;
    v16[3] = &unk_1E544B868;
    v16[4] = self;
    -[NSSQLiteConnection performAndWait:](v12, (uint64_t)v16);
    uint64_t v13 = (void *)atomic_load(p_queryGenerationTrackingConnection);

    atomic_store(0, p_queryGenerationTrackingConnection);
  }
  dbKey = self->_dbKey;
  if (dbKey)
  {
    CFRelease(dbKey);
    self->_dbKey = 0;
  }

  self->_writerSerializationMutex = 0;
  self->_ancillaryModels = 0;

  self->_ancillarySQLModels = 0;
  self->_model = 0;
  v15.receiver = self;
  v15.super_class = (Class)NSSQLCore;
  [(NSPersistentStore *)&v15 dealloc];
}

- (uint64_t)_disconnectAllConnections
{
  if (result)
  {
    uint64_t v1 = result;
    -[NSSQLCoreDispatchManager disconnectAllConnections](*(void *)(result + 128));
    uint64_t v2 = *(void *)(v1 + 120);
    if (v2)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __38__NSSQLCore__disconnectAllConnections__block_invoke;
      v6[3] = &unk_1E544B868;
      v6[4] = v1;
      -[NSSQLiteConnection performAndWait:](v2, (uint64_t)v6);
    }
    if (atomic_load((unint64_t *)(v1 + 208)))
    {
      uint64_t v4 = atomic_load((unint64_t *)(v1 + 208));
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __38__NSSQLCore__disconnectAllConnections__block_invoke_2;
      v5[3] = &unk_1E544B868;
      v5[4] = v1;
      -[NSSQLiteConnection performAndWait:](v4, (uint64_t)v5);
    }
    sqlite3_int64 result = *(unsigned int *)(v1 + 268);
    if (result != -1)
    {
      sqlite3_int64 result = notify_cancel(result);
      *(_DWORD *)(v1 + 268) = -1;
    }
  }
  return result;
}

+ (uint64_t)sanityCheckFileAtURL:(void *)a3 options:(uint64_t *)a4 error:
{
  self;
  uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
  if (v7)
  {
    uint64_t v8 = v7;
    if (*v7)
    {
      if ([a3 objectForKey:@"_NSSQLiteSEEKeychainItemOption"]) {
        return 1;
      }
      int v19 = +[NSSQLiteConnection readMagicWordFromPath:options:]((uint64_t)NSSQLiteConnection, v8, a3);
      int v20 = v19;
      if (v19 > 12)
      {
        if (v19 == 92)
        {
          if (!a4) {
            return 1;
          }
          id v26 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          uint64_t v11 = objc_msgSend(v26, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F289D0], 0);
          uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v23 = *MEMORY[0x1E4F281F8];
          uint64_t v24 = 259;
LABEL_19:
          uint64_t v12 = [v22 errorWithDomain:v23 code:v24 userInfo:v11];
          goto LABEL_6;
        }
        if (v19 != 13)
        {
LABEL_11:
          if (!a4) {
            return 1;
          }
          id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          uint64_t v11 = objc_msgSend(v21, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F289D0], 0);
          uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v23 = *MEMORY[0x1E4F28798];
          uint64_t v24 = v20;
          goto LABEL_19;
        }
      }
      else
      {
        if (!v19) {
          return 1;
        }
        if (v19 != 1) {
          goto LABEL_11;
        }
      }
      if (!a4) {
        return 1;
      }
      id v25 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v11 = objc_msgSend(v25, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F289D0], 0);
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F281F8];
      uint64_t v24 = 257;
      goto LABEL_19;
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F289D0], @"path's fileSystemRepresentation returned NULL", @"reason", 0);
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:258 userInfo:v11];
  _NSCoreDataLog(1, @" failed to open file due to illegal URL encoding.  error = %@ with userInfo %@", v13, v14, v15, v16, v17, v18, v12);
  if (a4) {
LABEL_6:
  }
    *a4 = v12;

  return 0;
}

+ (id)databaseKeyFromOptionsDictionary:(uint64_t)a1
{
  self;
  unint64_t v3 = (void *)[a2 objectForKey:@"_NSSQLiteSEEKeychainItemOption"];

  return +[NSSQLCore _databaseKeyFromValue:]((uint64_t)NSSQLCore, v3);
}

- (BOOL)_unload:(id *)a3
{
  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)NSSQLCore;
  return [(NSPersistentStore *)&v6 _unload:a3];
}

- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    int v9 = 0;
    uint64_t v3 = atomic_load((unint64_t *)(a1 + 208));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__NSSQLCore__registerNewQueryGenerationSnapshot___block_invoke;
    v5[3] = &unk_1E544C3F0;
    void v5[5] = a2;
    v5[6] = &v6;
    v5[4] = v2;
    -[NSSQLiteConnection performAndWait:](v3, (uint64_t)v5);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(v2 + 264) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 152));
    uint64_t v2 = *((unsigned int *)v7 + 6);
    _Block_object_dispose(&v6, 8);
  }
  return v2;
}

- (void)_supportDirectoryPath
{
  if (result)
  {
    uint64_t v1 = (void *)[result URL];
    if (([v1 isFileURL] & 1) == 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't write external data to non-file URL" userInfo:0]);
    }
    uint64_t v2 = (void *)[v1 path];
    uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "lastPathComponent"), "stringByDeletingPathExtension");
    uint64_t v4 = (void *)[v2 stringByDeletingLastPathComponent];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(@".", "stringByAppendingString:", v3), "stringByAppendingString:", @"_SUPPORT");
    return (void *)[v4 stringByAppendingPathComponent:v5];
  }
  return result;
}

- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3
{
  if (byte_1E9122F51 == 1)
  {
    [(NSSQLCore *)self managedObjectContextDidUnregisterObjectsWithIDs:a3 generation:0];
  }
  else
  {
    uint64_t v3 = [NSString stringWithUTF8String:"Attempt to use SPI reserved for mapssyncd"];
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v11);
    id v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: Attempt to use SPI reserved for mapssyncd", (uint8_t *)&v11, 2u);
    }
  }
}

+ (void)setDebugDefault:(int)a3
{
  dword_1E9122F54 = a3;
}

+ (void)setColoredLoggingDefault:(BOOL)a3
{
  _CoreData_SyntaxColoredLogging = a3;
}

+ (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3
{
  _MergedGlobals_170 = a3;
}

+ (Class)migrationManagerClass
{
  return (Class)objc_opt_class();
}

void __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  Weaunint64_t k = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v3 = (uint64_t)Weak;
    uint64_t v4 = (void *)MEMORY[0x18C127630]();
    [(id)v3 identifier];
    _NSCoreDataLog(2, @"cache_handle_memory_pressure invoked for core %p / %@", v5, v6, v7, v8, v9, v10, v3);
    -[NSSQLCoreDispatchManager enumerateAvailableConnectionsWithBlock:](*(void *)(v3 + 128), (uint64_t)&__block_literal_global_905);
    -[NSGenerationalRowCache forgetAllGenerationalExternalData](*(void *)(v3 + 136));
    os_unfair_lock_lock_with_options();
    dispatch_suspend(*(dispatch_object_t *)(v3 + 272));
    *(_DWORD *)(v3 + 200) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 152));
    dispatch_time_t v11 = dispatch_time(0, 10000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke_2;
    block[3] = &unk_1E544C3A0;
    objc_copyWeak(&v14, v1);
    dispatch_after(v11, global_queue, block);
    objc_destroyWeak(&v14);
  }
}

void __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke_2(uint64_t a1)
{
  Weaunint64_t k = (os_unfair_lock_s *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v2 = Weak;
    uint64_t v3 = Weak + 38;
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(NSObject **)&v2[68]._os_unfair_lock_opaque;
    if (v4)
    {
      dispatch_resume(v4);
      v2[50]._os_unfair_lock_opaque &= ~0x20000u;
    }
    os_unfair_lock_unlock(v3);
  }
}

void __18__NSSQLCore_load___block_invoke(uint64_t a1)
{
}

void __18__NSSQLCore_load___block_invoke_2(uint64_t a1)
{
}

- (uint64_t)_rebuildTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:(id *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v59 = 0;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v4 = *(void *)(a1 + 104);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 24);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (void *)[v5 allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (!v7) {
    goto LABEL_53;
  }
  uint64_t v40 = *(void *)v56;
  char v43 = 1;
  do
  {
    uint64_t v8 = 0;
    uint64_t v41 = v7;
    do
    {
      if (*(void *)v56 != v40) {
        objc_enumerationMutation(v6);
      }
      uint64_t v9 = *(void *)(*((void *)&v55 + 1) + 8 * v8);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      if (v9) {
        uint64_t v10 = *(void **)(v9 + 40);
      }
      else {
        uint64_t v10 = 0;
      }
      dispatch_time_t v11 = (void *)[v10 allValues];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v65 count:16];
      uint64_t v42 = v8;
      if (v12)
      {
        uint64_t v13 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v52 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(_WORD **)(*((void *)&v51 + 1) + 8 * i);
            int v16 = [v15 propertyType];
            if (v15) {
              BOOL v17 = v16 == 1;
            }
            else {
              BOOL v17 = 0;
            }
            if (v17 && (v15[16] & 8) != 0)
            {
              uint64_t v18 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]((uint64_t)NSSQLAttributeExtensionFactory, v15, (uint64_t *)&v59);
              int v19 = v18;
              if (v18)
              {
                v49[0] = MEMORY[0x1E4F143A8];
                v49[1] = 3221225472;
                v49[2] = __72__NSSQLCore__rebuildTriggerSchemaUsingConnection_recomputeValues_error___block_invoke;
                v49[3] = &unk_1E544D870;
                v49[4] = v9;
                v49[5] = v44;
                char v50 = 0;
                [v18 enumerateObjectsUsingBlock:v49];
              }
              else
              {
                char v43 = 0;
              }
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v65 count:16];
        }
        while (v12);
      }
      uint64_t v8 = v42 + 1;
    }
    while (v42 + 1 != v41);
    uint64_t v20 = [v6 countByEnumeratingWithState:&v55 objects:v66 count:16];
    uint64_t v7 = v20;
  }
  while (v20);
  if (v43)
  {
LABEL_53:
    if ([v44 count])
    {
      -[NSSQLiteConnection beginTransaction](a2);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v22 = [v44 countByEnumeratingWithState:&v45 objects:v64 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v46 != v23) {
              objc_enumerationMutation(v44);
            }
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a2, *(void **)(*((void *)&v45 + 1) + 8 * j));
          }
          uint64_t v22 = [v44 countByEnumeratingWithState:&v45 objects:v64 count:16];
        }
        while (v22);
      }
      uint64_t v21 = 1;
      -[NSSQLiteConnection commitTransaction](a2);
    }
    else
    {
      uint64_t v21 = 1;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:](a2, 0);
  id v25 = v59;

  id v26 = 0;
  id v27 = v59;
  if ((v21 & 1) == 0)
  {
    if (v59)
    {
      if (a3) {
        *a3 = v59;
      }
    }
    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
      unint64_t v35 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v61 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
        __int16 v62 = 1024;
        int v63 = 5475;
        _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v21;
}

- (id)_rebuildDerivedAttributeTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = *(void *)(a1 + 104);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 24);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = objc_msgSend(v5, "allValues", v21);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = -[NSSQLEntity derivedAttributesExtension](*(NSSQLEntity_DerivedAttributesExtension **)(*((void *)&v28 + 1) + 8 * v9));
        dispatch_time_t v11 = v10;
        if (v10)
        {
          -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL]((uint64_t)v10);
          migrationSQL = v11->_migrationSQL;
        }
        else
        {
          migrationSQL = 0;
        }
        uint64_t v13 = [(NSMutableDictionary *)migrationSQL valueForKey:@"dropStatements"];
        uint64_t v14 = [(NSMutableDictionary *)migrationSQL valueForKey:@"triggerCreationStatements"];
        [v3 addObjectsFromArray:v13];
        [v3 addObjectsFromArray:v14];
        objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary valueForKey:](migrationSQL, "valueForKey:", @"dataStatements"));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      uint64_t v7 = v15;
    }
    while (v15);
  }
  if ([v3 count])
  {
    -[NSSQLiteConnection beginTransaction](a2);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v16 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v3);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a2, *(void **)(*((void *)&v24 + 1) + 8 * i));
        }
        uint64_t v16 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }
    -[NSSQLiteConnection commitTransaction](a2);
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:](a2, 0);

  id v19 = 0;
  return 0;
}

- (void)_updateToVersion640PrimaryKeyTableUsingStatements:(void *)a3 connection:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[NSSQLiteConnection connect]((uint64_t)a3);
  -[NSSQLiteConnection beginTransaction]((uint64_t)a3);
  uint64_t v6 = -[NSSQLiteConnection fetchMetadata]((uint64_t)a3);
  uint64_t v7 = (void *)[v6 objectForKey:0x1ED796A20];
  if (v7 && (int)[v7 intValue] <= 639)
  {
    uint64_t v8 = (__CFString *)[v6 mutableCopy];
    [(__CFString *)v8 setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x1ED796A20];
    -[NSSQLiteConnection saveMetadata:](a3, v8);

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(a2);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a3, *(void **)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
    -[NSSQLiteConnection commitTransaction]((uint64_t)a3);
    os_unfair_lock_lock_with_options();
    [*(id *)(a1 + 160) setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x1ED796A20];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
  else
  {
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a3);
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a3, 0);
}

uint64_t __32__NSSQLCore__loadAndSetMetadata__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __32__NSSQLCore__loadAndSetMetadata__block_invoke_4(uint64_t a1)
{
}

void __20__NSSQLCore_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208));
  -[NSSQLiteConnection disconnect](v1);
}

- (id)newObjectIDSetsForToManyPrefetchingRequest:(uint64_t)a3 andSourceObjectIDs:(uint64_t)a4 orderColumnName:
{
  id v4 = a1;
  if (a1)
  {
    uint64_t v5 = [[NSSQLObjectIDSetFetchRequestContext alloc] initWithRequest:a2 context:0 sqlCore:a1 idSets:a3 columnName:a4];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v4, v5, 0);
    id v4 = [(NSSQLStoreRequestContext *)v5 result];
  }
  return v4;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  return (id)-[NSSQLCore _obtainPermanentIDsForObjects:withNotification:error:]((uint64_t)self, a3, 0);
}

void __38__NSSQLCore__disconnectAllConnections__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208));
  -[NSSQLiteConnection disconnect](v1);
}

- (void)_rebuildIndiciesSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSPersistentStore *)self isReadOnly]
    || ![(NSPersistentStore *)self persistentStoreCoordinator]
    || (*((unsigned char *)&self->_sqlCoreFlags + 1) & 1) != 0)
  {
    if (+[NSSQLCore debugDefault] >= 1)
    {
      id v6 = [(NSSQLCore *)self identifier];
      [(NSPersistentStore *)self isReadOnly];
      _NSCoreDataLog(4, @"Unable to reindex store(%@) - %@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke;
    v15[3] = &unk_1E544D760;
    v15[4] = self;
    if (v3)
    {
      uint64_t v5 = [[NSSQLBlockRequestContext alloc] initWithBlock:v15 context:0 sqlCore:self];
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v5, 0);
    }
    else
    {
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke_387;
      block[3] = &unk_1E544CA00;
      void block[4] = self;
      block[5] = v15;
      dispatch_async(global_queue, block);
    }
  }
}

void __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  if (-[NSSQLiteConnection recreateIndices](v3))
  {
    os_unfair_lock_lock_with_options();
    [*(id *)(*(void *)(a1 + 32) + 160) setValue:0 forKey:@"NSPersistentStoreRebuildIndicies"];
    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 196));
    [*(id *)(a1 + 32) _setMetadataDirty:1];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 152));
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    _NSCoreDataLog(2, @"Finished rebuilding indicies for store - %@", v11, v12, v13, v14, v15, v16, v10);
  }
  else
  {
    _NSCoreDataLog(1, @"Index recreation failed", v4, v5, v6, v7, v8, v9, v17);
  }
}

void __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke_387(uint64_t a1)
{
  uint64_t v2 = [[NSSQLBlockRequestContext alloc] initWithBlock:*(void *)(a1 + 40) context:0 sqlCore:*(void *)(a1 + 32)];
  -[NSSQLCore dispatchRequest:withRetries:](*(void *)(a1 + 32), v2, 0);
}

+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3
{
  uint64_t v3 = (void *)[a3 path];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(@".", "stringByAppendingString:", objc_msgSend((id)objc_msgSend(v3, "lastPathComponent"), "stringByDeletingPathExtension")), "stringByAppendingString:", @"_SUPPORT"));
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];

  return (id)[v5 fileURLWithPath:v4 isDirectory:1];
}

- (uint64_t)safeguardLocationForFileWithUUID:(unint64_t *)a1
{
  if (!a1 || ![a2 length]) {
    return 0;
  }
  if (!atomic_load(a1 + 21)) {
    [a1 externalDataReferencesDirectory];
  }
  uint64_t v5 = (void *)atomic_load(a1 + 22);

  return [v5 stringByAppendingPathComponent:a2];
}

- (void)resetExternalDataReferencesDirectories
{
  if (a1)
  {
    uint64_t v2 = (void *)atomic_load(a1 + 22);

    atomic_store(0, a1 + 22);
    uint64_t v3 = (void *)atomic_load(a1 + 21);

    atomic_store(0, a1 + 21);
    uint64_t v4 = (void *)atomic_load(a1 + 23);

    atomic_store(0, a1 + 23);
  }
}

- (id)cachedModelWithError:(id)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    if (a2) {
      *a2 = 0;
    }
    uint64_t v4 = [[NSSQLBlockRequestContext alloc] initWithBlock:&__block_literal_global_14 context:0 sqlCore:result];
    -[NSSQLCore dispatchRequest:withRetries:](v3, v4, 0);
    id v5 = [(NSSQLStoreRequestContext *)v4 result];
    if (v4) {
      error = v4->super._error;
    }
    else {
      error = 0;
    }
    uint64_t v7 = error;
    if (!v5)
    {
      if (v4)
      {
        exceptiouint64_t n = v4->super._exception;
        if (exception)
        {
          uint64_t v9 = exception;
          objc_exception_throw(exception);
        }
      }
      id v5 = 0;
      if (a2) {
        *a2 = v7;
      }
    }

    return v5;
  }
  return result;
}

void __34__NSSQLCore_cachedModelWithError___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v3 = (void *)a2[3];
  }
  else {
    uint64_t v3 = 0;
  }
  if (-[NSSQLiteConnection canConnect]((uint64_t)v3))
  {
    -[NSSQLiteConnection connect]((uint64_t)v3);
    [a2 setResult:-[NSSQLiteConnection fetchCachedModel](v3)];
  }
  else
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134180 userInfo:&unk_1ED7E2370];
    if (a2) {
      objc_setProperty_nonatomic(a2, v5, v4, 40);
    }
  }
}

- (void)setIdentifier:(id)a3
{
  p_sqlCoreStateLocunint64_t k = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_storeMetadata setObject:a3 forKey:@"NSStoreUUID"];
  atomic_store(0, (unsigned __int8 *)&self->_metadataIsClean);
  [(NSPersistentStore *)self _setMetadataDirty:1];

  os_unfair_lock_unlock(p_sqlCoreStateLock);
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)[a1 metadataForPersistentStoreWithURL:a3 options:0 error:a4];
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return [a1 setMetadata:a3 forPersistentStoreWithURL:a4 options:0 error:a5];
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___NSSQLCore;
  if (!objc_msgSendSuper2(&v20, sel_setMetadata_forPersistentStoreWithURL_error_, a3, a4, a6)) {
    return 0;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [NSNumber numberWithDouble:240.0];
  id v21 = @"journal_mode";
  v22[0] = [MEMORY[0x1E4F1CA98] null];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"NSPersistentStoreTimeoutOption", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1), @"NSSQLitePragmasOption", 0);
  uint64_t v14 = v13;
  if (a5)
  {
    [v13 addEntriesFromDictionary:a5];
    [v14 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    uint64_t v15 = (void *)[a5 objectForKey:@"NSSQLitePragmasOption"];
    if ([v15 objectForKey:@"journal_mode"])
    {
      uint64_t v16 = (void *)[v15 mutableCopy];
      objc_msgSend(v16, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode");
      [v14 setObject:v16 forKey:@"NSSQLitePragmasOption"];
    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, a4, a5, (uint64_t *)a6))return 0; {
  uint64_t v17 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a4 options:v14];
  }
  if ([v17 loadMetadata:a6] && objc_msgSend(v17, "load:", a6))
  {
    [v17 setMetadata:a3];
    BOOL v18 = [v17 executeRequest:objc_alloc_init(NSSaveChangesRequest) withContext:0 error:a6] != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v17);

  return v18;
}

+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || ![a3 isFileURL])
  {
    if (a5)
    {
      id v16 = 0;
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134070 userInfo:&unk_1ED7E2398];
      return v16;
    }
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) == 0)
  {
    if (a5)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      BOOL v18 = objc_msgSend(v17, "initWithObjectsAndKeys:", a3, *MEMORY[0x1E4F289D0], 0);
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v18];
    }
    return 0;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = [NSNumber numberWithDouble:240.0];
  objc_super v20 = @"journal_mode";
  v21[0] = [MEMORY[0x1E4F1CA98] null];
  uint64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"NSPersistentStoreTimeoutOption", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1), @"NSSQLitePragmasOption", 0);
  uint64_t v12 = v11;
  if (a4)
  {
    [v11 addEntriesFromDictionary:a4];
    [v12 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    uint64_t v13 = (void *)[a4 objectForKey:@"NSSQLitePragmasOption"];
    if ([v13 objectForKey:@"journal_mode"])
    {
      uint64_t v14 = (void *)[v13 mutableCopy];
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode");
      [v12 setObject:v14 forKey:@"NSSQLitePragmasOption"];
    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, a3, a4, (uint64_t *)a5))return 0; {
  uint64_t v15 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a3 options:v12];
  }
  if ([v15 loadMetadata:a5] && objc_msgSend(v15, "load:", a5)) {
    id v16 = -[NSSQLCore cachedModelWithError:](v15, (NSError **)a5);
  }
  else {
    id v16 = 0;
  }
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v15);

  return v16;
}

+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a3 && ([a3 isFileURL] & 1) != 0)
  {
    uint64_t v20 = 0;
    uint64_t v9 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Destroying store", &v20);
    if (+[NSSQLiteConnection _destroyPersistentStoreAtURL:options:error:]((uint64_t)NSSQLiteConnection, a3, a4, (uint64_t *)a5))
    {
      uint64_t v10 = [a1 _figureOutWhereExternalReferencesEndedUpRelativeTo:a3];
      if (!v10
        || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", v10, 0) & 1) != 0
        || +[NSSQLCore debugDefault] < 1)
      {
        BOOL v12 = 1;
      }
      else
      {
        uint64_t v11 = [a3 path];
        BOOL v12 = 1;
        _NSCoreDataLog(1, @"Failed to delete support directory for store: %@", v13, v14, v15, v16, v17, v18, v11);
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v20, v9);
  }
  else
  {
    BOOL v12 = 0;
    if (a5) {
      *a5 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Only persistent stores backed by files can be destroyed", a4, *MEMORY[0x1E4F28568], 0));
    }
  }
  return v12;
}

+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7
{
  if (a5)
  {
    int v13 = [a5 isFileURL];
    if (a3)
    {
      if (v13 && ([a3 isFileURL] & 1) != 0)
      {
        uint64_t v80 = 0;
        long long v74 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Replacing entire store", &v80);
        uint64_t v14 = (void *)[a1 _figureOutWhereExternalReferencesEndedUpRelativeTo:a3];
        long long v76 = (void *)[a1 _figureOutWhereExternalReferencesEndedUpRelativeTo:a5];
        BOOL v78 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend((id)objc_msgSend(v14, "path"), "stringByAppendingString:", @"_transsrc_4052146efa0d85c9fbe0634c0e8bc4457ed82f7c"), 1);
        long long v77 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend((id)objc_msgSend(v14, "path"), "stringByAppendingString:", @"_transdst_878d188f109e9f52ae70b0b25413f6a38c8267a8"), 1);
        uint64_t v15 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
        int v75 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v76, "path"));
        int v73 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v14, "path"));
        int v16 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v78, "path"));
        int v17 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v77, "path"));
        if (!v16) {
          goto LABEL_15;
        }
        long long v79 = 0;
        if ([v15 removeItemAtURL:v78 error:&v79]) {
          goto LABEL_15;
        }
        if (+[NSSQLCore debugDefault] >= 1)
        {
          uint64_t v18 = [v78 path];
          _NSCoreDataLog(4, @"Failed to delete staging area for external support directory for store: %@", v19, v20, v21, v22, v23, v24, v18);
        }
        if (v75)
        {
          int v25 = 0;
          if (a7) {
            *a7 = v79;
          }
        }
        else
        {
LABEL_15:
          int v25 = 1;
        }
        int v27 = v75;
        if (!v25) {
          int v27 = 0;
        }
        if (v27 == 1)
        {
          long long v79 = 0;
          int v28 = [v15 copyItemAtURL:v76 toURL:v78 error:&v79];
          if ((v28 & 1) == 0)
          {
            if (+[NSSQLCore debugDefault] >= 1)
            {
              uint64_t v72 = [a5 path];
              [v78 path];
              _NSCoreDataLog(4, @"Failed to copy support directory from store: %@ to store: %@.  %@", v29, v30, v31, v32, v33, v34, v72);
            }
            if (a7) {
              *a7 = v79;
            }
          }
          int v25 = v28;
        }
        else
        {
          int v28 = 0;
        }
        if (v25) {
          int v35 = v17;
        }
        else {
          int v35 = 0;
        }
        if (v35 == 1)
        {
          long long v79 = 0;
          if ([v15 removeItemAtURL:v77 error:&v79]) {
            goto LABEL_36;
          }
          if (+[NSSQLCore debugDefault] >= 1)
          {
            uint64_t v36 = [a5 path];
            [v78 path];
            _NSCoreDataLog(4, @"Failed to copy support directory from store: %@ to store: %@.  %@", v37, v38, v39, v40, v41, v42, v36);
          }
          if (!v73)
          {
LABEL_36:
            int v25 = 1;
          }
          else
          {
            int v25 = 0;
            if (a7) {
              *a7 = v79;
            }
          }
        }
        if (v25)
        {
          int v43 = +[NSSQLiteConnection _replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:]((uint64_t)NSSQLiteConnection, a3, a4, a5, a6, (uint64_t *)a7);
          if ((v43 & v73) == 1)
          {
            long long v79 = 0;
            int v44 = [v15 moveItemAtURL:v14 toURL:v77 error:&v79];
            if (v44) {
              goto LABEL_47;
            }
            if (+[NSSQLCore debugDefault] >= 1)
            {
              uint64_t v45 = [a3 path];
              _NSCoreDataLog(4, @"Failed to delete support directory for store: %@.  %@", v46, v47, v48, v49, v50, v51, v45);
            }
            if (!v75)
            {
LABEL_47:
              int v43 = 1;
            }
            else
            {
              int v43 = 0;
              if (a7) {
                *a7 = v79;
              }
            }
          }
          else
          {
            int v44 = 0;
          }
          if (v43) {
            int v52 = v28;
          }
          else {
            int v52 = 0;
          }
          if (v52 == 1)
          {
            long long v79 = 0;
            int v53 = [v15 moveItemAtURL:v78 toURL:v14 error:&v79];
            if ((v53 & 1) == 0 && +[NSSQLCore debugDefault] >= 1)
            {
              uint64_t v54 = [a5 path];
              [a3 path];
              _NSCoreDataLog(4, @"Failed to copy support directory from store: %@ to store: %@ (failed to move %@ to %@ due to %@)", v55, v56, v57, v58, v59, v60, v54);
            }
            int v43 = v53;
          }
        }
        else
        {
          int v44 = 0;
          int v43 = 0;
        }
        uint64_t v61 = (void *)[a6 objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
        if (v61)
        {
          int v62 = [v61 BOOLValue];
          BOOL v63 = v43 == 0;
          if (v43 && ((v62 ^ 1) & 1) == 0)
          {
            long long v79 = 0;
            if (([v15 removeItemAtURL:v76 error:&v79] & 1) == 0
              && +[NSSQLCore debugDefault] >= 1)
            {
              uint64_t v64 = [v76 path];
              [a5 path];
              _NSCoreDataLog(1, @"Failed to unlink support directory %@ from old store location: %@ due to %@", v65, v66, v67, v68, v69, v70, v64);
            }
LABEL_65:
            if (v44) {
              [v15 removeItemAtURL:v77 error:0];
            }
            BOOL v26 = v43 != 0;
            +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v80, v74);
            return v26;
          }
        }
        else
        {
          BOOL v63 = v43 == 0;
        }
        if ((v63 & v28) == 1) {
          [v15 removeItemAtURL:v78 error:0];
        }
        goto LABEL_65;
      }
    }
  }
  BOOL v26 = 0;
  if (a7) {
    *a7 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Both source and destination stores must be backed by files", a4, *MEMORY[0x1E4F28568], 0));
  }
  return v26;
}

+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6
{
  if (a3 && ([a3 isFileURL] & 1) != 0)
  {
    uint64_t v14 = 0;
    uint64_t v10 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Rekeying entire store", &v14);
    id v11 = +[NSSQLCore _databaseKeyFromValue:]((uint64_t)NSSQLCore, a5);
    BOOL v12 = +[NSSQLiteConnection _rekeyPersistentStoreAtURL:options:withKey:error:]((uint64_t)NSSQLiteConnection, a3, a4, v11, (uint64_t *)a6);
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v14, v10);
  }
  else
  {
    BOOL v12 = 0;
    if (a6) {
      *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Only persistent stores backed by files can be rekeyed", a4, a5, *MEMORY[0x1E4F28568], 0));
    }
  }
  return v12;
}

- (BOOL)_initializeQueryGenerationTrackingConnection
{
  if (result)
  {
    BOOL v1 = result;
    id v2 = [[NSSQLiteConnection alloc] initAsQueryGenerationTrackingConnectionForSQLCore:result];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__NSSQLCore__initializeQueryGenerationTrackingConnection__block_invoke;
    v15[3] = &unk_1E544B868;
    v15[4] = v2;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v2, (uint64_t)v15);
    if (v2)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v3 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v1 + 208), (unint64_t *)&v3, (unint64_t)v2);
      if (v3) {

      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 152));
      unint64_t v4 = atomic_load((unint64_t *)(v1 + 208));
      return v4 != 0;
    }
    else
    {
      uint64_t v5 = [NSString stringWithUTF8String:"An unreported error occurred during initialization of query generation connection."];
      _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, v13);
      BOOL v12 = __pflogFaultLog;
      sqlite3_int64 result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: An unreported error occurred during initialization of query generation connection.", buf, 2u);
        return 0;
      }
    }
  }
  return result;
}

void __57__NSSQLCore__initializeQueryGenerationTrackingConnection__block_invoke(uint64_t a1)
{
}

uint64_t __34__NSSQLCore__hasActiveGenerations__block_invoke(uint64_t a1)
{
  id v2 = (id *)atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208));
  uint64_t result = [-[NSSQLiteConnection _activeGenerations](v2) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __35__NSSQLCore_currentQueryGeneration__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 24);
  }
  else {
    id v2 = 0;
  }
  if ([v2 registerCurrentQueryGenerationWithStore:*(void *)(a1 + 32)])
  {
    uint64_t v3 = [NSString stringWithUTF8String:"Failed to adopt query generation from remote change"];
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v11);
    uint64_t v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: Failed to adopt query generation from remote change", (uint8_t *)&v11, 2u);
    }
  }
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (![(NSSQLCore *)self supportsGenerationalQuerying])
  {
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    int v25 = @"store";
    v26[0] = self;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v19, @"Unsupported feature in this configuration", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1)));
  }
  unint64_t v7 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
  if (!v7 && !-[NSSQLCore _initializeQueryGenerationTrackingConnection]((BOOL)self))
  {
    if (a4) {
      *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134502 userInfo:0];
    }
    _NSCoreDataLog(1, @"initializing query generations connection failed.", v8, v9, v10, v11, v12, v13, v20);
    return 0;
  }
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __55__NSSQLCore_reopenQueryGenerationWithIdentifier_error___block_invoke;
  uint64_t v23 = &unk_1E544D760;
  id v24 = a3;
  uint64_t v14 = [[NSSQLBlockRequestContext alloc] initWithBlock:&v20 context:0 sqlCore:self];
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v14, 0);
  id v15 = [(NSSQLStoreRequestContext *)v14 result];
  if (v15) {
    return -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:]([_NSQueryGenerationToken alloc], v15, self, 1);
  }
  if (v14)
  {
    exceptiouint64_t n = v14->super._exception;
    if (exception) {
      objc_exception_throw(exception);
    }
    if (a4)
    {
      error = v14->super._error;
LABEL_10:
      id result = 0;
      *a4 = error;
      return result;
    }
    return 0;
  }
  error = 0;
  id result = 0;
  if (a4) {
    goto LABEL_10;
  }
  return result;
}

void __55__NSSQLCore_reopenQueryGenerationWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v4 = a2[3];
  }
  else {
    uint64_t v4 = 0;
  }
  -[NSSQLiteConnection connect](v4);
  id newValue = 0;
  uint64_t v6 = -[NSSQLiteConnection reopenQueryGenerationWithIdentifier:error:](v4, *(void **)(a1 + 32), &newValue);
  if (v6)
  {
    [a2 setResult:v6];
  }
  else if (a2)
  {
    objc_setProperty_nonatomic(a2, v5, newValue, 40);
  }
}

- (id)connectionForMigration
{
  id v1 = a1;
  if (a1)
  {
    id v1 = [[NSSQLiteConnection alloc] initForSQLCore:a1];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __35__NSSQLCore_connectionForMigration__block_invoke;
    v3[3] = &unk_1E544B868;
    v3[4] = v1;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v1, (uint64_t)v3);
  }
  return v1;
}

void __35__NSSQLCore_connectionForMigration__block_invoke(uint64_t a1)
{
}

- (void)setURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NSSQLCore;
  [(NSPersistentStore *)&v4 setURL:a3];
  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  -[NSSQLCore resetExternalDataReferencesDirectories]((unint64_t *)self);
}

- (void)_cacheRows:(void *)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = -[NSSQLCore rowCacheForGeneration:](result, 0);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id result = (void *)[a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      objc_super v4 = result;
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(a2);
          }
          unint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
          uint64_t v8 = (void *)[v7 objectID];
          if (v3) {
            -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v3, (uint64_t)v7, v8, 0);
          }
          uint64_t v6 = (void *)((char *)v6 + 1);
        }
        while (v4 != v6);
        id result = (void *)[a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        objc_super v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_uncacheRows:(void *)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = -[NSSQLCore rowCacheForGeneration:](result, 0);
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id result = (void *)[a2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      objc_super v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(a2);
          }
          -[NSPersistentStoreCache decrementRefCountForObjectID:]((uint64_t)v3, (const void *)[*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) objectID]);
          uint64_t v6 = (void *)((char *)v6 + 1);
        }
        while (v4 != v6);
        id result = (void *)[a2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        objc_super v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (self
    && [(NSDictionary *)[(NSPersistentStore *)self options] objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSDictionary *)[(NSPersistentStore *)self options] valueForKey:@"NSPersistentStoreConnectionPoolMaxSize"];
  }
  if ([v5 integerValue])
  {
    dispatchManager = self->_dispatchManager;
    [(NSSQLCoreDispatchManager *)dispatchManager setExclusiveLockingMode:v3];
  }
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3
{
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3
{
}

void __54__NSSQLCore_willRemoveFromPersistentStoreCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v2 = 0;
  }
  BOOL v3 = *(void **)(a1 + 32);
  objc_super v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "ancillarySQLModels"), "objectForKey:", @"NSPersistentStoreTrackIndexUseOptionKey");

  +[NSSQLiteIndexTrackingModel updateIndexStatistics:usingConnection:model:]((uint64_t)NSSQLiteIndexTrackingModel, v3, v2, v4);
}

- (id)newFetchUUIDSForSubentitiesRootedAt:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    if ([a2 superentity]) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't fetch UUIDs for non-root entities" userInfo:0]);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__NSSQLCore_newFetchUUIDSForSubentitiesRootedAt___block_invoke;
    v8[3] = &unk_1E544D760;
    v8[4] = a2;
    objc_super v4 = [[NSSQLBlockRequestContext alloc] initWithBlock:v8 context:0 sqlCore:v2];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v2, v4, 0);
    id v2 = [(NSSQLStoreRequestContext *)v4 result];
    if (v4) {
      exceptiouint64_t n = v4->super._exception;
    }
    else {
      exceptiouint64_t n = 0;
    }
    uint64_t v6 = exception;
    if (!v2 && v6) {
      objc_exception_throw(v6);
    }
  }
  return v2;
}

void __49__NSSQLCore_newFetchUUIDSForSubentitiesRootedAt___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v4 = a2[3];
  }
  else {
    uint64_t v4 = 0;
  }
  -[NSSQLiteConnection connect](v4);
  id v5 = -[NSSQLiteConnection newFetchUUIDSForSubentitiesRootedAt:](v4, *(void **)(a1 + 32));
  [a2 setResult:v5];
}

- (void)removeUbiquityMetadata
{
  if (a1)
  {
    id v2 = (void *)[a1 metadata];
    id v9 = (id)[v2 mutableCopy];
    uint64_t v3 = [v2 objectForKey:@"com.apple.coredata.ubiquity.ubiquitized"];
    BOOL v4 = v3 != 0;
    if (v3) {
      [v9 removeObjectForKey:@"com.apple.coredata.ubiquity.ubiquitized"];
    }
    if ([v2 objectForKey:@"com.apple.coredata.ubiquity.token"])
    {
      [v9 removeObjectForKey:@"com.apple.coredata.ubiquity.token"];
      BOOL v4 = 1;
    }
    if ([v2 objectForKey:@"com.apple.coredata.ubiquity.localImportComplete"])
    {
      [v9 removeObjectForKey:@"com.apple.coredata.ubiquity.localImportComplete"];
      uint64_t v5 = [v2 objectForKey:@"com.apple.coredata.ubiquity.baseline.timestamp"];
      uint64_t v6 = v9;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v7 = [v2 objectForKey:@"com.apple.coredata.ubiquity.baseline.timestamp"];
    uint64_t v6 = v9;
    if (v7)
    {
LABEL_10:
      [v6 removeObjectForKey:@"com.apple.coredata.ubiquity.baseline.timestamp"];
      uint64_t v6 = v9;
LABEL_11:
      [a1 setMetadata:v6];

      long long v8 = [[NSSQLBlockRequestContext alloc] initWithBlock:&__block_literal_global_584 context:0 sqlCore:a1];
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v8, 0);

      return;
    }
    if (v4) {
      goto LABEL_11;
    }
    MEMORY[0x1F41817F8](0, v9);
  }
}

void __35__NSSQLCore_removeUbiquityMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  -[NSSQLiteConnection dropUbiquityTables](v3);
  BOOL v4 = [NSSQLSaveChangesRequestContext alloc];
  if (a2) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSSQLSaveChangesRequestContext *)v4 initWithRequest:0 context:0 sqlCore:v5];
  if (v6)
  {
    if (v6->_metadataToWrite || (savePlauint64_t n = v6->_savePlan) != 0 && (*(unsigned char *)&savePlan->_flags & 2) != 0)
    {
      if (a2) {
        long long v8 = *(void **)(a2 + 24);
      }
      else {
        long long v8 = 0;
      }
      id v9 = v6;
      -[NSSQLStoreRequestContext setConnection:]((uint64_t)v6, v8);
      _executeSaveChangesRequest((uint64_t)v9);
      -[NSSQLStoreRequestContext setConnection:]((uint64_t)v9, 0);
      uint64_t v6 = v9;
    }
  }
}

- (id)fetchUbiquityKnowledgeVector
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3052000000;
    long long v8 = __Block_byref_object_copy__23;
    id v9 = __Block_byref_object_dispose__23;
    uint64_t v10 = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__NSSQLCore_fetchUbiquityKnowledgeVector__block_invoke;
    v4[3] = &unk_1E544D7D0;
    v4[4] = &v5;
    id v2 = [[NSSQLBlockRequestContext alloc] initWithBlock:v4 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v1, v2, 0);

    id v1 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

id __41__NSSQLCore_fetchUbiquityKnowledgeVector__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id result = (id)-[NSSQLiteConnection fetchUbiquityKnowledgeVector](v3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)updateUbiquityKnowledgeVector:(uint64_t)a1
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__NSSQLCore_updateUbiquityKnowledgeVector___block_invoke;
    v4[3] = &unk_1E544D760;
    v4[4] = a2;
    uint64_t v3 = [[NSSQLBlockRequestContext alloc] initWithBlock:v4 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:](a1, v3, 0);
  }
}

void *__43__NSSQLCore_updateUbiquityKnowledgeVector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 24);
  }
  else {
    id v2 = 0;
  }
  return -[NSSQLiteConnection updateUbiquityKnowledgeVector:](v2, *(void **)(a1 + 32));
}

- (void)updateUbiquityKnowledgeForPeerWithID:(uint64_t)a3 andTransactionNumber:
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__NSSQLCore_updateUbiquityKnowledgeForPeerWithID_andTransactionNumber___block_invoke;
    v5[3] = &unk_1E544D7A8;
    v5[4] = a2;
    void v5[5] = a3;
    BOOL v4 = [[NSSQLBlockRequestContext alloc] initWithBlock:v5 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:](a1, v4, 0);
  }
}

void *__71__NSSQLCore_updateUbiquityKnowledgeForPeerWithID_andTransactionNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 24);
  }
  else {
    id v2 = 0;
  }
  return -[NSSQLiteConnection updateUbiquityKnowledgeForPeerWithID:andTransactionNumber:](v2, *(__CFString **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)replaceUbiquityKnowledgeVector:(uint64_t)a1
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__NSSQLCore_replaceUbiquityKnowledgeVector___block_invoke;
    v4[3] = &unk_1E544D760;
    v4[4] = a2;
    uint64_t v3 = [[NSSQLBlockRequestContext alloc] initWithBlock:v4 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:](a1, v3, 0);
  }
}

void *__44__NSSQLCore_replaceUbiquityKnowledgeVector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 24);
  }
  else {
    id v2 = 0;
  }
  return -[NSSQLiteConnection replaceUbiquityKnowledgeVector:](v2, *(void **)(a1 + 32));
}

- (id)allPeerRanges
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3052000000;
    long long v8 = __Block_byref_object_copy__23;
    id v9 = __Block_byref_object_dispose__23;
    uint64_t v10 = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __26__NSSQLCore_allPeerRanges__block_invoke;
    v4[3] = &unk_1E544D7D0;
    v4[4] = &v5;
    id v2 = [[NSSQLBlockRequestContext alloc] initWithBlock:v4 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v1, v2, 0);

    id v1 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

_DWORD *__26__NSSQLCore_allPeerRanges__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(_DWORD **)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id result = -[NSSQLiteConnection allPeerRanges](v3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)addPeerRange:(uint64_t)a1
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __26__NSSQLCore_addPeerRange___block_invoke;
    v4[3] = &unk_1E544D760;
    v4[4] = a2;
    uint64_t v3 = [[NSSQLBlockRequestContext alloc] initWithBlock:v4 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:](a1, v3, 0);
  }
}

void *__26__NSSQLCore_addPeerRange___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 24);
  }
  else {
    id v2 = 0;
  }
  return -[NSSQLiteConnection addPeerRange:](v2, *(void **)(a1 + 32));
}

- (id)createMapOfEntityNameToPKMaxForEntities:(id)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__23;
  uint64_t v12 = __Block_byref_object_dispose__23;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NSSQLCore_createMapOfEntityNameToPKMaxForEntities___block_invoke;
  v7[3] = &unk_1E544D7F8;
  v7[4] = a3;
  v7[5] = &v8;
  BOOL v4 = [[NSSQLBlockRequestContext alloc] initWithBlock:v7 context:0 sqlCore:self];
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v4, 0);

  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void *__53__NSSQLCore_createMapOfEntityNameToPKMaxForEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id result = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntities:](v3, *(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setUbiquityTableValue:(uint64_t)a3 forKey:
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__NSSQLCore_setUbiquityTableValue_forKey___block_invoke;
    v5[3] = &unk_1E544D7A8;
    v5[4] = a2;
    void v5[5] = a3;
    BOOL v4 = [[NSSQLBlockRequestContext alloc] initWithBlock:v5 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:](a1, v4, 0);
  }
}

void *__42__NSSQLCore_setUbiquityTableValue_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 24);
  }
  else {
    id v2 = 0;
  }
  return -[NSSQLiteConnection setUbiquityTableValue:forKey:](v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)ubiquityTableValueForKey:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000;
    id v9 = __Block_byref_object_copy__23;
    uint64_t v10 = __Block_byref_object_dispose__23;
    uint64_t v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__NSSQLCore_ubiquityTableValueForKey___block_invoke;
    v5[3] = &unk_1E544D7F8;
    v5[4] = a2;
    void v5[5] = &v6;
    uint64_t v3 = [[NSSQLBlockRequestContext alloc] initWithBlock:v5 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v2, v3, 0);

    id v2 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  return v2;
}

id __38__NSSQLCore_ubiquityTableValueForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id result = -[NSSQLiteConnection ubiquityTableValueForKey:](v3, *(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (uint64_t)_ubiquityDictionaryForAttribute:(void *)a3 onObject:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = (const void *)[a3 objectID];
  uint64_t v7 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:](a1, objc_msgSend((id)objc_msgSend(a3, "managedObjectContext"), "_queryGenerationToken"));
  if (!v7
    || (uint64_t v8 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v7, v6, *(double *)&NSSQLDistantPastTimeInterval)) == 0)
  {
    id v9 = -[NSSQLObjectFaultRequestContext initWithObjectID:context:sqlCore:]([NSSQLObjectFaultRequestContext alloc], "initWithObjectID:context:sqlCore:", v6, [a3 managedObjectContext], a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v9, 0);
    uint64_t v8 = (os_unfair_lock_s *)[(NSSQLStoreRequestContext *)v9 result];
    if (!v8)
    {
      if (v9) {
        exceptiouint64_t n = v9->super._exception;
      }
      else {
        exceptiouint64_t n = 0;
      }
      uint64_t v11 = exception;
      if (v11) {
        objc_exception_throw(v11);
      }
      uint64_t v8 = 0;
    }
  }
  uint64_t v12 = -[os_unfair_lock_s valueForKey:](v8, "valueForKey:", [a2 name]);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = (void *)v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v14, "setObject:forKey:", objc_msgSend(v13, "databaseValue"), @"databaseValue");
    uint64_t v15 = [v13 UUID];
    if (v15)
    {
      [v14 setObject:v15 forKey:@"UUID"];
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "length")), @"length");
    }
    return (uint64_t)v14;
  }
  int v17 = (void *)MEMORY[0x1E4F1C9E8];

  return [v17 dictionaryWithObject:v13 forKey:@"databaseValue"];
}

- (void)recomputePrimaryKeyMaxForEntities:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1 && [a2 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(a2);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
          if (v8)
          {
            if ((*(unsigned char *)(v8 + 120) & 4) != 0)
            {
              id v9 = *(void **)(v8 + 72);
            }
            else
            {
              do
              {
                id v9 = (void *)v8;
                uint64_t v8 = [(id)v8 superentity];
              }
              while (v8);
            }
          }
          else
          {
            id v9 = 0;
          }
          objc_msgSend(v4, "addObject:", objc_msgSend((id)objc_msgSend(a1, "model"), "entityNamed:", objc_msgSend(v9, "name")));
          ++v7;
        }
        while (v7 != v5);
        uint64_t v10 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v5 = v10;
      }
      while (v10);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__NSSQLCore_recomputePrimaryKeyMaxForEntities___block_invoke;
    v14[3] = &unk_1E544D760;
    v14[4] = v4;
    uint64_t v11 = [[NSSQLBlockRequestContext alloc] initWithBlock:v14 context:0 sqlCore:a1];

    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v11, 0);
    if (v11) {
      exceptiouint64_t n = v11->super._exception;
    }
    else {
      exceptiouint64_t n = 0;
    }
    uint64_t v13 = exception;

    if (v13) {
      objc_exception_throw(v13);
    }
  }
}

void __47__NSSQLCore_recomputePrimaryKeyMaxForEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v4 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v4 = 0;
  }
  -[NSSQLiteConnection beginTransaction](v4);
  uint64_t v5 = -[NSSQLiteConnection createMapOfEntityNameToPKMaxForEntities:](v4, *(void **)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ set %@=%@ where %@ = '%@'", @"Z_PRIMARYKEY", @"Z_MAX", objc_msgSend(obj, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v7)), @"Z_NAME", *(void *)(*((void *)&v13 + 1) + 8 * v7)];
        if (a2) {
          id v9 = (void *)-[NSSQLiteAdapter newStatementWithSQLString:]([*(id *)(a2 + 8) adapter], (uint64_t)v8);
        }
        else {
          id v9 = 0;
        }

        -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v4, v9);
        ++v7;
      }
      while (v6 != v7);
      uint64_t v10 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v10;
    }
    while (v10);
  }
  -[NSSQLiteConnection commitTransaction](v4);
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v4, 0);
}

- (id)_newReservedKeysForEntities:(void *)a3 counts:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = [a2 count];
  if (!a2 || !a3 || (uint64_t v7 = v6, v6 != [a3 count])) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid parameter value (missing parameter)" userInfo:0]);
  }
  if (v7)
  {
    unint64_t v8 = [a2 count];
    unint64_t v9 = MEMORY[0x1F4188790](v8);
    uint64_t v12 = (const void **)((char *)&v30 - v11);
    if (v9 > 0x200) {
      uint64_t v12 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v30 - v11, 8 * v10);
    }
    unint64_t v15 = [a3 count];
    unint64_t v16 = MEMORY[0x1F4188790](v15);
    uint64_t v19 = (const void **)((char *)&v30 - v18);
    if (v16 > 0x200) {
      uint64_t v19 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v30 - v18, 8 * v17);
    }
    objc_msgSend(a2, "getObjects:range:", v12, 0, objc_msgSend(a2, "count"));
    if ([a2 count])
    {
      unint64_t v20 = 0;
      do
      {
        if ([(id)v12[v20] superentity]) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid parameter value (bad entity)" userInfo:0]);
        }
        v12[v20] = (const void *)_sqlCoreLookupSQLEntityForEntityDescription(a1, v12[v20]);
        ++v20;
      }
      while (v20 < [a2 count]);
    }
    objc_msgSend(a3, "getObjects:range:", v19, 0, objc_msgSend(a3, "count"));
    CFIndex v21 = [a2 count];
    CFDictionaryRef v22 = CFDictionaryCreate(0, v12, v19, v21, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v8 >= 0x201) {
      NSZoneFree(0, v12);
    }
    if (v15 >= 0x201) {
      NSZoneFree(0, v19);
    }
    uint64_t v23 = [[NSSQLGenerateObjectIDRequestContext alloc] initForEntitiesAndCounts:v22 context:0 sqlCore:a1];
    CFRelease(v22);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v23, 0);
    id v24 = (id)[v23 result];
    if (!v24)
    {
      if (v23) {
        uint64_t v29 = (void *)v23[6];
      }
      else {
        uint64_t v29 = 0;
      }
      objc_exception_throw(v29);
    }

    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    uint64_t v26 = [a2 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(a2);
          }
          objc_msgSend(v25, "addObject:", objc_msgSend(v24, "objectForKey:", _sqlCoreLookupSQLEntityForEntityDescription(a1, *(void **)(*((void *)&v30 + 1) + 8 * i))));
        }
        uint64_t v26 = [a2 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v26);
    }

    return v25;
  }
  long long v13 = NSArray_EmptyArray;

  return v13;
}

- (id)_newObjectIDForEntity:(id)a3 referenceData64:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ([(NSDictionary *)[(NSPersistentStore *)self options] objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"])
    {
      uint64_t v12 = @"PFUbiquitySetupCheckForFork";
      v13[0] = MEMORY[0x1E4F1CC38];
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      uint64_t v11 = 0;
    }
    unint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Invalid parameter value (zero)";
LABEL_12:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:v11]);
  }
  if (!a3 || (id v6 = -[NSSQLModel entityNamed:](self->_model, "entityNamed:", [a3 name])) == 0)
  {
    unint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Invalid parameter value (bad entity)";
    uint64_t v11 = 0;
    goto LABEL_12;
  }

  return [(NSSQLCore *)self newObjectIDForEntity:v6 pk:a4];
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)qword_1E9122F68;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  self;
  -[PFUbiquitySwitchboard unregisterPersistentStore:inCoordinator:](_sharedSwitchboard, self, (uint64_t)[(NSPersistentStore *)self persistentStoreCoordinator]);
  uint64_t v5 = (void (*)(id, void))*((void *)a3 + 2);

  v5(a3, 0);
}

void __66__NSSQLCore_processCloudKitContainerEventRequest_inContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[NSPersistentCloudKitContainerEvent alloc] initWithCKEvent:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  unint64_t v15 = 0;
  uint64_t v9 = -[NSSQLCore _newValuesForRelationship:forObjectWithID:withContext:error:](self, a3, a4, a5, &v15);
  uint64_t v10 = v9;
  if (a6 && !v9)
  {
    uint64_t v11 = v15;
    if (!v15)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F281F8];
      unint64_t v16 = @"message";
      v17[0] = [NSString stringWithFormat:@"failed to retrieve ordering information from fault for object %@ and relationship %@", a4, objc_msgSend(a3, "name")];
      uint64_t v11 = (NSError *)objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 133000, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));
    }
    *a6 = v11;
  }
  return v10;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  unint64_t v8 = (void *)[a4 entity];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "subentities"), "count");
  uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(self, v8);
  uint64_t v11 = [a4 name];
  if (v10)
  {
    uint64_t v12 = [*(id *)(v10 + 40) objectForKey:v11];
    if ([(id)v12 isToMany])
    {
LABEL_3:
      uint64_t v13 = -[NSSQLiteAdapter generateSQLStatmentForSourcesAndOrderKeysForDestination:inToMany:]((NSSQLiteStatement *)[(NSSQLCore *)self adapter], a3, (void *)v12);
LABEL_7:
      long long v14 = v13;
      goto LABEL_9;
    }
    if (v12 && *(unsigned char *)(v12 + 24) == 9)
    {
      uint64_t v13 = -[NSSQLiteAdapter generateSQLStatmentForSourcesAndOrderKeysForDestination:inManyToMany:]((NSSQLiteStatement *)[(NSSQLCore *)self adapter], a3, (__CFString *)v12);
      goto LABEL_7;
    }
    long long v14 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    long long v14 = 0;
    if ([0 isToMany]) {
      goto LABEL_3;
    }
  }
LABEL_9:
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  long long v31 = __62__NSSQLCore__allOrderKeysForDestination_inRelationship_error___block_invoke;
  long long v32 = &unk_1E544D760;
  long long v33 = v14;
  unint64_t v15 = [[NSSQLBlockRequestContext alloc] initWithBlock:&v29 context:0 sqlCore:self];

  int v28 = v15;
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v15, 4);
  CFArrayRef v16 = [(NSSQLStoreRequestContext *)v15 result];
  CFArrayRef v17 = v16;
  if (!v16)
  {
    exceptiouint64_t n = v15;
    if (v15) {
      exceptiouint64_t n = v15->super._exception;
    }
    objc_exception_throw(exception);
  }
  unint64_t Count = CFArrayGetCount(v16);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (Count >= 2)
  {
    CFArrayGetValueAtIndex(v17, 0);
    for (CFIndex i = 1; i != Count; ++i)
    {
      ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(v17, i);
      uint64_t v22 = *ValueAtIndex;
      if (*ValueAtIndex)
      {
        uint64_t v23 = ValueAtIndex[2];
        id v24 = (const void *)v10;
        if (v9) {
          id v24 = _sqlEntityForEntityID((uint64_t)self->_model, ValueAtIndex[1]);
        }
        id v25 = -[NSSQLCore newObjectIDForEntity:pk:](self, "newObjectIDForEntity:pk:", v24, v22, v28, v29, v30, v31, v32, v33);
        [v19 addObject:v25];

        objc_msgSend(v19, "addObject:", objc_msgSend(NSNumber, "numberWithLongLong:", v23));
      }
    }
  }

  return v19;
}

void __62__NSSQLCore__allOrderKeysForDestination_inRelationship_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v3 = a2[3];
  }
  else {
    uint64_t v3 = 0;
  }
  CFMutableArrayRef v4 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v3, (void *)[*(id *)(a1 + 32) sqlString]);
  [a2 setResult:v4];
  CFRelease(v4);
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v3, 0);
}

- (uint64_t)_refreshTriggerValues:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v54 = 0;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v3 = *(void *)(a1 + 104);
  if (v3) {
    CFMutableArrayRef v4 = *(void **)(v3 + 24);
  }
  else {
    CFMutableArrayRef v4 = 0;
  }
  uint64_t v5 = (void *)[v4 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v60 count:16];
  uint64_t v7 = "pe";
  if (!v6) {
    goto LABEL_34;
  }
  uint64_t v39 = *(void *)v51;
  char v42 = 1;
  do
  {
    uint64_t v8 = 0;
    uint64_t v40 = v6;
    do
    {
      if (*(void *)v51 != v39) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void *)(*((void *)&v50 + 1) + 8 * v8);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      if (v9) {
        uint64_t v10 = *(void **)(v9 + 40);
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = (void *)[v10 allValues];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v59 count:16];
      uint64_t v41 = v8;
      if (v12)
      {
        uint64_t v13 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v47 != v13) {
              objc_enumerationMutation(v11);
            }
            unint64_t v15 = *(_WORD **)(*((void *)&v46 + 1) + 8 * i);
            int v16 = [v15 propertyType];
            if (v15) {
              BOOL v17 = v16 == 1;
            }
            else {
              BOOL v17 = 0;
            }
            if (v17 && (v15[16] & 8) != 0)
            {
              uint64_t v18 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]((uint64_t)NSSQLAttributeExtensionFactory, v15, (uint64_t *)&v54);
              id v19 = v18;
              if (v18)
              {
                v45[0] = MEMORY[0x1E4F143A8];
                v45[1] = 3221225472;
                v45[2] = __35__NSSQLCore__refreshTriggerValues___block_invoke;
                v45[3] = &unk_1E544D848;
                v45[4] = v9;
                v45[5] = v43;
                [v18 enumerateObjectsUsingBlock:v45];
              }
              else
              {
                char v42 = 0;
              }
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v59 count:16];
        }
        while (v12);
      }
      uint64_t v8 = v41 + 1;
    }
    while (v41 + 1 != v40);
    uint64_t v20 = [v5 countByEnumeratingWithState:&v50 objects:v60 count:16];
    uint64_t v6 = v20;
  }
  while (v20);
  uint64_t v7 = "AttributeType" + 11;
  if (v42)
  {
LABEL_34:
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = *((void *)v7 + 22);
    v44[2] = __35__NSSQLCore__refreshTriggerValues___block_invoke_2;
    v44[3] = &unk_1E544D7A8;
    v44[4] = v43;
    v44[5] = a1;
    uint64_t v22 = [[NSSQLBlockRequestContext alloc] initWithBlock:v44 context:0 sqlCore:a1];
    -[NSSQLCore dispatchRequest:withRetries:](a1, v22, 0);
    if (v22) {
      exceptiouint64_t n = v22->super._exception;
    }
    else {
      exceptiouint64_t n = 0;
    }
    id v24 = exception;

    if (v24) {
      objc_exception_throw(v24);
    }
    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v25 = v54;

  id v26 = 0;
  id v27 = v54;
  if ((v21 & 1) == 0)
  {
    if (v54)
    {
      if (a2) {
        *a2 = v54;
      }
    }
    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
      uint64_t v35 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
        __int16 v57 = 1024;
        int v58 = 5392;
        _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v21;
}

uint64_t __35__NSSQLCore__refreshTriggerValues___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(a2, "bulkUpdateSQLStrings", 0);
  uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [[NSSQLiteStatement alloc] initWithEntity:*(void *)(a1 + 32) sqlString:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [*(id *)(a1 + 40) addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void __35__NSSQLCore__refreshTriggerValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2) {
    CFMutableArrayRef v4 = *(void **)(a2 + 24);
  }
  else {
    CFMutableArrayRef v4 = 0;
  }
  -[NSSQLiteConnection beginTransaction]((uint64_t)v4);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(void **)(*((void *)&v21 + 1) + 8 * i));
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }
  -[NSSQLiteConnection commitTransaction]((uint64_t)v4);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    if (atomic_load((unint64_t *)(v9 + 208)))
    {
      if (a2) {
        uint64_t v11 = *(void *)(a2 + 8);
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = [v4 registerCurrentQueryGenerationWithStore:v11];
      if (v12)
      {
        uint64_t v13 = [NSString stringWithUTF8String:"Refreshing trigger values failed to adopt post transaction query generation with error %d"];
        _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, v12);
        uint64_t v20 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v26 = v12;
          _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Refreshing trigger values failed to adopt post transaction query generation with error %d", buf, 8u);
        }
      }
    }
  }
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v4, 0);
}

void __72__NSSQLCore__rebuildTriggerSchemaUsingConnection_recomputeValues_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (id)[a2 insertSQLStrings];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = (void *)[a2 dropSQLStrings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [[NSSQLiteStatement alloc] initWithEntity:*(void *)(a1 + 32) sqlString:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        [*(id *)(a1 + 40) addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v4);
        }
        uint64_t v15 = [[NSSQLiteStatement alloc] initWithEntity:*(void *)(a1 + 32) sqlString:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        [*(id *)(a1 + 40) addObject:v15];
      }
      uint64_t v12 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v16 = objc_msgSend(a2, "bulkUpdateSQLStrings", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [[NSSQLiteStatement alloc] initWithEntity:*(void *)(a1 + 32) sqlString:*(void *)(*((void *)&v22 + 1) + 8 * k)];
          [*(id *)(a1 + 40) addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v18);
    }
  }
}

- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __58__NSSQLCore_finishDeferredLightweightMigration_withError___block_invoke;
  uint64_t v16 = &unk_1E544D8C0;
  uint64_t v17 = &v19;
  LOBYTE(v18) = a3;
  uint64_t v6 = [[NSSQLBlockRequestContext alloc] initWithBlock:&v13 context:0 sqlCore:self];
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v6, 0);
  if (*((unsigned char *)v20 + 24)) {
    goto LABEL_11;
  }
  if (!v6)
  {
    if (!a4) {
      goto LABEL_11;
    }
    error = 0;
    goto LABEL_9;
  }
  exceptiouint64_t n = v6->super._exception;
  if (!exception)
  {
    if (!a4) {
      goto LABEL_11;
    }
    error = v6->super._error;
LABEL_9:
    uint64_t v8 = error;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = exception;
    objc_exception_throw(exception);
  }
  if (a4)
  {
    uint64_t v8 = (NSError *)-[NSException errorObjectWithUserInfo:](exception, "errorObjectWithUserInfo:", 0, v13, v14, v15, v16, v17, v18);
LABEL_10:
    *a4 = v8;
  }
LABEL_11:

  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v10;
}

BOOL __58__NSSQLCore_finishDeferredLightweightMigration_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL result = -[NSSQLiteConnection finishDeferredLightweightMigration:](v3, *(unsigned __int8 *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void *__50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = -[NSSQLiteConnection harvestUsedIndexes](a2);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    uint64_t v5 = [v4 count];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke_2;
      void v9[3] = &unk_1E544D8E8;
      v9[4] = v6;
      return (void *)[v3 enumerateKeysAndObjectsUsingBlock:v9];
    }
    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 40);
  }
  else
  {
    uint64_t v8 = 0;
  }

  BOOL result = v3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void *__50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL result = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:a2];
  if (result)
  {
    uint64_t v7 = result[4];
    result[3] += a3[3];
    result[4] = v7 + a3[4];
    result[5] += a3[5];
  }
  else
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return (void *)[v8 setObject:a3 forKeyedSubscript:a2];
  }
  return result;
}

- (BOOL)hasAncillaryModels
{
  return (*((unsigned __int8 *)&self->_sqlCoreFlags + 1) >> 3) & 1;
}

- (void)_setHasAncillaryModels:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->__sqlCoreFlags sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&self->_sqlCoreFlags & 0xFFFFF7FF | v3);
}

+ (BOOL)dropPersistentHistoryforPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = [NSNumber numberWithDouble:240.0];
  long long v30 = @"journal_mode";
  v31[0] = [MEMORY[0x1E4F1CA98] null];
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  uint64_t v12 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"NSPersistentStoreTimeoutOption", v11, @"NSSQLitePragmasOption", MEMORY[0x1E4F1CC38], @"NSPersistentHistoryTrackingKey", 0);
  uint64_t v13 = v12;
  if (a4)
  {
    [v12 addEntriesFromDictionary:a4];
    [v13 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    uint64_t v14 = (void *)[a4 objectForKey:@"NSSQLitePragmasOption"];
    if ([v14 objectForKey:@"journal_mode"])
    {
      uint64_t v15 = (void *)[v14 mutableCopy];
      objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode");
      [v13 setObject:v15 forKey:@"NSSQLitePragmasOption"];
    }
  }
  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]((uint64_t)NSSQLCore, a3, a4, (uint64_t *)a5))return 0; {
  uint64_t v16 = [objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a3 options:v13];
  }
  uint64_t v17 = (void *)v16;
  if (v16)
  {
    if ((*(unsigned char *)(v16 + 200) & 0x40) != 0)
    {
      uint64_t v20 = [NSSQLBlockRequestContext alloc];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = (uint64_t)__31__NSSQLCore__dropHistoryTables__block_invoke_2;
      long long v27 = (void (*)(uint64_t, uint64_t))&unk_1E544D738;
      long long v28 = (void (*)(uint64_t))&__block_literal_global_640;
      uint64_t v21 = [(NSSQLBlockRequestContext *)v20 initWithBlock:&v24 context:0 sqlCore:v17];
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v17, v21, 0);
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = (uint64_t)&v24;
      uint64_t v26 = 0x3052000000;
      long long v27 = __Block_byref_object_copy__23;
      long long v28 = __Block_byref_object_dispose__23;
      uint64_t v29 = 0;
      uint64_t v18 = -[NSSQLCore schemaValidationConnection]((void *)v16);
      *(void *)(v25 + 40) = v18;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __31__NSSQLCore__dropHistoryTables__block_invoke_3;
      v23[3] = &unk_1E544B908;
      v23[4] = &__block_literal_global_640;
      v23[5] = &v24;
      -[NSSQLiteConnection performAndWait:]((uint64_t)v18, (uint64_t)v23);
      _Block_object_dispose(&v24, 8);
    }
  }
  BOOL v19 = 1;
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v17);

  return v19;
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = -[NSSQLiteConnection canConnect](a2);
  if (result)
  {
    -[NSSQLiteConnection connect](a2);
    return -[NSSQLiteConnection _dropKnownHistoryTrackingTables](a2);
  }
  return result;
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __31__NSSQLCore__dropHistoryTables__block_invoke_4(uint64_t a1)
{
}

- (unint64_t)entityIDForEntityDescription:(id)a3
{
  if (!a3) {
    return 0;
  }
  model = self->_model;
  if (model) {
    return -[NSKnownKeysMappingStrategy fastIndexForKnownKey:](-[NSKnownKeysDictionary mapping](model->_entitiesByName, "mapping"), "fastIndexForKnownKey:", [a3 name])+ 1;
  }
  else {
    return 0;
  }
}

- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return (id)NSArray_EmptyArray;
  }
  id v3 = -[NSSQLModel entityNamed:](self->_model, "entityNamed:", [a3 name]);
  if (!v3) {
    return (id)NSArray_EmptyArray;
  }
  id v4 = v3;
  uint64_t v5 = (void *)[v3 foreignKeyColumns];
  uint64_t v6 = (void *)[v4 foreignEntityKeyColumns];
  uint64_t v7 = (void *)[v4 foreignOrderKeyColumns];
  uint64_t v8 = (void *)[v4 attributeColumns];
  uint64_t v9 = (void *)[v4 toManyRelationships];
  uint64_t v10 = (void *)[v4 manyToManyRelationships];
  uint64_t v50 = [v8 count];
  uint64_t v11 = [v7 count];
  uint64_t v12 = [v6 count];
  uint64_t v13 = [v5 count];
  uint64_t v14 = [v9 count];
  uint64_t v15 = [v10 count];
  uint64_t v16 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v11 + v50 + v12 + v13 + v14 + v15];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v17 = [v5 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v72;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v72 != v19) {
          objc_enumerationMutation(v5);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * v20) toOneRelationship];
        if (v21)
        {
          char v22 = (void *)[v21 propertyDescription];
          if (v22) {
            objc_msgSend(v16, "addObject:", objc_msgSend(v22, "name"));
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v5 countByEnumeratingWithState:&v71 objects:v80 count:16];
    }
    while (v18);
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v23 = [v6 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v68;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v68 != v25) {
          objc_enumerationMutation(v6);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v26) toOneRelationship];
        if (v27)
        {
          long long v28 = (void *)[v27 propertyDescription];
          if (v28) {
            objc_msgSend(v16, "addObject:", objc_msgSend(v28, "name"));
          }
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v6 countByEnumeratingWithState:&v67 objects:v79 count:16];
    }
    while (v24);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v29 = [v7 countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v64;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(v7);
        }
        long long v33 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * v32) toOneRelationship];
        if (v33)
        {
          uint64_t v34 = (void *)[v33 propertyDescription];
          if (v34) {
            objc_msgSend(v16, "addObject:", objc_msgSend(v34, "name"));
          }
        }
        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [v7 countByEnumeratingWithState:&v63 objects:v78 count:16];
    }
    while (v30);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v35 = [v8 countByEnumeratingWithState:&v59 objects:v77 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v60;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v60 != v37) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v16, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * v38++), "attributeDescription"), "name"));
      }
      while (v36 != v38);
      uint64_t v36 = [v8 countByEnumeratingWithState:&v59 objects:v77 count:16];
    }
    while (v36);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v39 = [v9 countByEnumeratingWithState:&v55 objects:v76 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v56;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v56 != v41) {
          objc_enumerationMutation(v9);
        }
        id v43 = *(void **)(*((void *)&v55 + 1) + 8 * v42);
        if (v43) {
          id v43 = (void *)[v43 propertyDescription];
        }
        objc_msgSend(v16, "addObject:", objc_msgSend(v43, "name"));
        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [v9 countByEnumeratingWithState:&v55 objects:v76 count:16];
    }
    while (v40);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v44 = [v10 countByEnumeratingWithState:&v51 objects:v75 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v52;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(v10);
        }
        long long v48 = *(void **)(*((void *)&v51 + 1) + 8 * v47);
        if (v48) {
          long long v48 = (void *)[v48 propertyDescription];
        }
        objc_msgSend(v16, "addObject:", objc_msgSend(v48, "name"));
        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = [v10 countByEnumeratingWithState:&v51 objects:v75 count:16];
    }
    while (v45);
  }
  return (id)[v16 allObjects];
}

@end