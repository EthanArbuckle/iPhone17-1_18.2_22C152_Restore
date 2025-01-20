@interface NSPersistentStoreCoordinator
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)removePersistentHistoryFromPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)removeUbiquitousContentAndPersistentStoreAtURL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error;
+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error;
+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error;
+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error;
+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error;
+ (NSDictionary)registeredStoreTypes;
+ (NSPersistentStoreCoordinator)alloc;
+ (NSPersistentStoreCoordinator)allocWithZone:(_NSZone *)a3;
+ (const)_classForPersistentStoreAtURL:(uint64_t)a1;
+ (id)ubiquityStoreURLForStoreURL:(id)a3 ubiquityIdentityToken:(id)a4 ubiquityName:(id)a5;
+ (uint64_t)_beginPowerAssertionNamed:(void *)a3 withAssert:;
+ (uint64_t)_setMetadata:(void *)a3 forPersistentStoreOfType:(void *)a4 URL:(uint64_t)a5 options:(void *)a6 error:;
+ (uint64_t)_shouldDebugAllTaskAssertions;
+ (uint64_t)_storeClassForStoreType:(uint64_t)a1;
+ (void)_endPowerAssertionWithAssert:(void *)a3 andApp:;
+ (void)_registerCoreDataStoreClass:(Class)a3 forStoreType:(id)a4;
+ (void)initialize;
+ (void)registerStoreClass:(Class)storeClass forStoreType:(NSString *)storeType;
- (BOOL)_canRouteToStore:(void *)a3 forContext:;
- (BOOL)_canSaveGraphRootedAtObject:(void *)value intoStore:(uint64_t)a2 withPreviouslyChecked:(CFSetRef)theSet withAcceptableEntities:(const __CFSet *)a4;
- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5;
- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_finishDeferredLightweightMigrationTasks:(void *)a3 withError:;
- (BOOL)_refreshTriggerValuesInStore:(id)a3 error:(id *)a4;
- (BOOL)_rekeyPersistentStoreAtURL:(id)a3 type:(id)a4 options:(id)a5 withKey:(id)a6 error:(id *)a7;
- (BOOL)_removeAllPersistentStores:(id *)a3;
- (BOOL)_removePersistentStore:(unint64_t)a1;
- (BOOL)_removePersistentStore:(void *)(a1 error:;
- (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 storeType:(id)a7 error:(id *)a8;
- (BOOL)_validateQueryGeneration:(id)a3 error:(id *)a4;
- (BOOL)finishDeferredLightweightMigration:(NSError *)error;
- (BOOL)finishDeferredLightweightMigrationTask:(NSError *)error;
- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (BOOL)removePersistentStore:(NSPersistentStore *)store error:(NSError *)error;
- (BOOL)setURL:(NSURL *)url forPersistentStore:(NSPersistentStore *)store;
- (BOOL)tryLock;
- (NSArray)persistentStores;
- (NSDictionary)metadataForPersistentStore:(NSPersistentStore *)store;
- (NSManagedObjectID)managedObjectIDForURIRepresentation:(NSURL *)url;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentHistoryToken)currentPersistentHistoryTokenFromStores:(NSArray *)stores;
- (NSPersistentStore)addPersistentStoreWithType:(NSString *)storeType configuration:(NSString *)configuration URL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error;
- (NSPersistentStore)migratePersistentStore:(NSPersistentStore *)store toURL:(NSURL *)URL options:(NSDictionary *)options withType:(NSString *)storeType error:(NSError *)error;
- (NSPersistentStore)persistentStoreForURL:(NSURL *)URL;
- (NSPersistentStoreCoordinator)init;
- (NSPersistentStoreCoordinator)initWithManagedObjectModel:(NSManagedObjectModel *)model;
- (NSString)name;
- (NSTemporaryObjectID)managedObjectIDForURIRepresentation:(void *)a3 error:;
- (NSTemporaryObjectID)managedObjectIDFromUTF8String:(uint64_t)a3 length:(void *)a4 error:;
- (NSURL)URLForPersistentStore:(NSPersistentStore *)store;
- (_NSPersistentHistoryToken)_retainedChangeTokenFromStores:(_NSPersistentHistoryToken *)result;
- (_NSQueryGenerationToken)_retainedIdentifierFromStores:(_NSQueryGenerationToken *)result;
- (const)_storeClassForStoreWithType:(const char *)result URL:(uint64_t)a2 options:(void *)a3;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_doAddPersistentStoreWithDescription:(void *)a3 privateCopy:(int)a4 completeOnMainThread:(uint64_t)a5 withHandler:;
- (id)_exceptionNoStoreSaveFailureForError:(id)a3 recommendedFrame:(int *)a4;
- (id)_lastOpenError;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_reopenQueryGenerationWithIdentifier:(void *)(a1 inStoreWithIdentifier:error:;
- (id)_retainedCurrentQueryGeneration:(id)a3;
- (id)currentQueryGenerationTokenFromStores:(id)a3;
- (id)delegate;
- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)persistentStoreForIdentifier:(id)a3;
- (id)restoreOriginalRequestIfNecessary:(uint64_t)a3 store:(void *)a4 swizzledResults:(uint64_t)a5 originalRequestType:(uint64_t)a6 originalResultType:;
- (os_unfair_lock_s)_xpcBundleIdentifier;
- (os_unfair_lock_s)_xpcProcessName;
- (uint64_t)_checkForSkewedEntityHashes:(uint64_t)result metadata:(void *)a2;
- (uint64_t)_checkForTombstoneSkew:(uint64_t)a3 metadata:(uint64_t)a4 configuration:;
- (uint64_t)_doPreSaveAssignmentsForObjects:(void *)a3 intoStores:;
- (uint64_t)_handleFaultingError:(uint64_t)a3 fromContext:;
- (uint64_t)_hasHistoryTracking:(uint64_t)result;
- (uint64_t)_newConflictRecordForObject:(unint64_t)a3 andOriginalRow:(void *)a4 withContext:;
- (uint64_t)_repairIndiciesForStoreWithIdentifier:(uint64_t)a3 synchronous:;
- (uint64_t)applyMigrationStage:(void *)a3 withContext:(void *)a4 error:;
- (unint64_t)migrateStoreWithContext:(void *)a3 error:;
- (void)_addPersistentStore:(uint64_t)a3 identifier:;
- (void)_conflictsWithRowCacheForObject:(void *)a3 withContext:(void *)a4 andStore:;
- (void)_copyMetadataFromStore:(void *)a3 toStore:(uint64_t)a4 migrationManager:;
- (void)_introspectLastErrorAndThrow;
- (void)_persistentStoreForIdentifier:(uint64_t)a1;
- (void)_postStoreRemoteChangeNotificationsForStore:(uint64_t)a3 andState:;
- (void)_postStoresChangedNotificationsForStores:(uint64_t)a3 changeKey:(void *)a4 options:;
- (void)_retainedPersistentStores;
- (void)_routeHeavyweightBlock:(void *)(a1;
- (void)_routeLightweightBlock:(void *)(a1 toStore:;
- (void)_setIsMigrating:(void *)(a1;
- (void)_setIsRegisteredWithUbiquity:(void *)(a1;
- (void)_setXPCBundleIdentifier:(uint64_t)a1;
- (void)_setXPCProcessName:(uint64_t)a1;
- (void)addPersistentStoreWithDescription:(NSPersistentStoreDescription *)storeDescription completionHandler:(void *)block;
- (void)createPersistentContainerForMigrationContext:(void *)a1 withModel:(uint64_t)a2 andExecuteBlock:(uint64_t)a3;
- (void)dealloc;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)performBlock:(void *)block;
- (void)performBlockAndWait:(void *)block;
- (void)replaceResultTypeOfRequestIfNecessary:(unsigned __int8 *)a3 store:(uint64_t)a4 requestType:(void *)a5 originalResultType:;
- (void)setDelegate:(id)a3;
- (void)setMetadata:(NSDictionary *)metadata forPersistentStore:(NSPersistentStore *)store;
- (void)setName:(NSString *)name;
@end

@implementation NSPersistentStoreCoordinator

- (BOOL)_canRouteToStore:(void *)a3 forContext:
{
  if (result)
  {
    v4 = (void *)[a3 _queryGenerationToken];
    if ([v4 _isEnabled]) {
      return +[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken") != v4&& -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v4, a2) != 0;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

void __111__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56) == 1)
  {
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "persistentStore");
    if (v2)
    {
      v3 = (void *)v2;
      if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) indexOfObjectIdenticalTo:v2] != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v4 = [v3 supportsGenerationalQuerying];
        uint64_t v5 = *(void *)(a1 + 32);
        if (v4) {
          [v3 managedObjectContextDidUnregisterObjectsWithIDs:v5 generation:*(void *)(a1 + 40)];
        }
        else {
          [v3 managedObjectContextDidUnregisterObjectsWithIDs:v5];
        }
      }
    }
    v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  else
  {
    valueCallBacks.version = 0;
    valueCallBacks.retain = 0;
    *(_OWORD *)&valueCallBacks.release = *(_OWORD *)(MEMORY[0x1E4F1D540] + 16);
    valueCallBacks.equal = 0;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, &valueCallBacks);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v13 = [v12 persistentStore];
          if (v13)
          {
            v14 = (const void *)v13;
            if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) indexOfObjectIdenticalTo:v13] != 0x7FFFFFFFFFFFFFFFLL)
            {
              Value = (void *)CFDictionaryGetValue(v6, v14);
              if (!Value)
              {
                Value = CFArrayCreateMutable(allocator, 0, 0);
                CFDictionarySetValue(v6, v14, Value);
              }
              CFArrayAppendValue((CFMutableArrayRef)Value, v12);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v9);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v16 = [(__CFDictionary *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v6);
          }
          v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          v21 = CFDictionaryGetValue(v6, v20);
          if ([v20 supportsGenerationalQuerying]) {
            [v20 managedObjectContextDidUnregisterObjectsWithIDs:v21 generation:*(void *)(a1 + 40)];
          }
          else {
            [v20 managedObjectContextDidUnregisterObjectsWithIDs:v21];
          }
        }
        uint64_t v17 = [(__CFDictionary *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v17);
    }
    CFRelease(v6);
  }
}

id __95__NSPersistentStoreCoordinator__NSInternalMethods__newValuesForObjectWithID_withContext_error___block_invoke(uint64_t a1, void *a2)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = @"Reason";
    v6[1] = @"store";
    v7[0] = @"Store is not valid for this context's generation";
    v7[1] = a2;
    v6[2] = @"context";
    v7[2] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
    id result = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v5];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [a2 newValuesForObjectWithID:*(void *)(a1 + 48) withContext:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
    return *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  return result;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v7 = [a3 count];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke;
  v8[3] = &unk_1E544CDD0;
  v8[5] = a4;
  v8[6] = v7;
  v8[4] = a3;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((void (*)(void))self, (uint64_t)v8);
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v7 = [a3 count];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = __Block_byref_object_copy__18;
  v11[4] = __Block_byref_object_dispose__18;
  v12 = 0;
  v12 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __111__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke;
  v10[3] = &unk_1E544CDF8;
  v10[6] = v11;
  v10[7] = v7;
  v10[4] = a3;
  v10[5] = a4;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    uint64_t v9 = malloc_type_malloc(0x28uLL, 0x80040B8603338uLL);
    *uint64_t v9 = _Block_copy(v10);
    v9[1] = CFRetain(self);
    v9[2] = 8199;
    v9[3] = 0;
    v9[4] = 0;
    dispatch_async_f(dispatchQueue, v9, (dispatch_function_t)internalBlockToNSPersistentStoreCoordinatorPerform);
  }
  _Block_object_dispose(v11, 8);
}

- (void)_retainedPersistentStores
{
  v1 = (void *)a1;
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    v1 = (void *)v1[6];
    v3 = v1;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_routeHeavyweightBlock:(void *)(a1
{
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000;
    uint64_t v9 = __Block_byref_object_copy__18;
    uint64_t v10 = __Block_byref_object_dispose__18;
    uint64_t v11 = 0;
    v5[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v5[1] = (void (*)(void))3221225472;
    v5[2] = (void (*)(void))__55__NSPersistentStoreCoordinator__routeHeavyweightBlock___block_invoke;
    v5[3] = (void (*)(void))&unk_1E544CB30;
    v5[6] = (void (*)(void))&v12;
    v5[7] = (void (*)(void))&v6;
    v5[4] = a1;
    v5[5] = (void (*)(void))a2;
    _perform_0((unint64_t)a1, v5);
    if (*((unsigned char *)v13 + 24))
    {
      if (v7[5])
      {
        id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7[5]);

        [v3 drain];
        id v4 = 0;
      }
    }
    _Block_object_dispose(&v6, 8);
    _Block_object_dispose(&v12, 8);
  }
}

- (void)_routeLightweightBlock:(void *)(a1 toStore:
{
  if (a1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3052000000;
    uint64_t v10 = __Block_byref_object_copy__18;
    uint64_t v11 = __Block_byref_object_dispose__18;
    uint64_t v12 = 0;
    v6[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v6[1] = (void (*)(void))3221225472;
    v6[2] = (void (*)(void))__63__NSPersistentStoreCoordinator__routeLightweightBlock_toStore___block_invoke;
    void v6[3] = (void (*)(void))&unk_1E544CB08;
    v6[4] = a1;
    v6[5] = a3;
    v6[7] = (void (*)(void))&v13;
    v6[8] = (void (*)(void))&v7;
    v6[6] = (void (*)(void))a2;
    _perform_0((unint64_t)a1, v6);
    if (*((unsigned char *)v14 + 24))
    {
      if (v8[5])
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v8[5]);

        [v4 drain];
        id v5 = 0;
      }
    }
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v13, 8);
  }
}

void __63__NSPersistentStoreCoordinator__routeLightweightBlock_toStore___block_invoke(uint64_t a1)
{
  if ((*(_WORD *)(*(void *)(a1 + 32) + 24) & 2) == 0)
  {
LABEL_2:
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
    return;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  os_unfair_lock_lock_with_options();
  if ([*(id *)(*(void *)(a1 + 32) + 48) indexOfObjectIdenticalTo:*(void *)(a1 + 40)] != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(id *)(a1 + 40);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    [*(id *)(a1 + 40) _persistentStoreCoordinator];
    _NSCoreDataLog(1, @" API Misuse: Attempt to serialize store access on non-owning coordinator (PSC = %p, store PSC = %p)", v4, v5, v6, v7, v8, v9, v3);
    if (!HIBYTE(dword_1EB270AB0))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      goto LABEL_2;
    }
  }
}

void __55__NSPersistentStoreCoordinator__routeHeavyweightBlock___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if ((*(_WORD *)(v2 + 24) & 2) != 0)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    os_unfair_lock_lock_with_options();
    *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 48) mutableCopy];
    uint64_t v4 = (os_unfair_lock_s *)(a1[4] + 32);
    os_unfair_lock_unlock(v4);
  }
  else
  {
    uint64_t v3 = -[NSPersistentStoreCoordinator _retainedPersistentStores](v2);
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __109__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 1)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "persistentStore");
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      if ([a2 indexOfObjectIdenticalTo:v4] != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v6 = [v5 supportsGenerationalQuerying];
        uint64_t v7 = *(void *)(a1 + 32);
        if (v6)
        {
          uint64_t v8 = *(void *)(a1 + 40);
          [v5 managedObjectContextDidRegisterObjectsWithIDs:v7 generation:v8];
        }
        else
        {
          [v5 managedObjectContextDidRegisterObjectsWithIDs:v7];
        }
      }
    }
  }
  else
  {
    valueCallBacks.version = 0;
    valueCallBacks.retain = 0;
    *(_OWORD *)&valueCallBacks.release = *(_OWORD *)(MEMORY[0x1E4F1D540] + 16);
    valueCallBacks.equal = 0;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v9 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, &valueCallBacks);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v25 = a1;
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v16 = [v15 persistentStore];
          if (v16)
          {
            uint64_t v17 = (const void *)v16;
            if ([a2 indexOfObjectIdenticalTo:v16] != 0x7FFFFFFFFFFFFFFFLL)
            {
              Value = (void *)CFDictionaryGetValue(v9, v17);
              if (!Value)
              {
                Value = CFArrayCreateMutable(allocator, 0, 0);
                CFDictionarySetValue(v9, v17, Value);
              }
              CFArrayAppendValue((CFMutableArrayRef)Value, v15);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v12);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v19 = [(__CFDictionary *)v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v9);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          long long v24 = CFDictionaryGetValue(v9, v23);
          if ([v23 supportsGenerationalQuerying]) {
            [v23 managedObjectContextDidRegisterObjectsWithIDs:v24 generation:*(void *)(v25 + 40)];
          }
          else {
            [v23 managedObjectContextDidRegisterObjectsWithIDs:v24];
          }
        }
        uint64_t v20 = [(__CFDictionary *)v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v20);
    }
    CFRelease(v9);
  }
}

uint64_t __36__NSPersistentStoreCoordinator_name__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __59__NSPersistentStoreCoordinator__removeAllPersistentStores___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x18C127630]();
  uint64_t v3 = (void *)[*(id *)(a1 + 32) persistentStores];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (([*(id *)(a1 + 32) removePersistentStore:*(void *)(*((void *)&v9 + 1) + 8 * v7) error:*(void *)(*(void *)(a1 + 40) + 8) + 40] & 1) == 0)*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0; {
        ++v7;
        }
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

id __59__NSPersistentStoreCoordinator_metadataForPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 metadata];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return v3;
}

uint64_t __63__NSPersistentStoreCoordinator_setMetadata_forPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMetadata:*(void *)(a1 + 32)];
}

- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  uint64_t v6 = request;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3052000000;
  v98 = __Block_byref_object_copy__18;
  v99 = __Block_byref_object_dispose__18;
  uint64_t v100 = 0;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3052000000;
  v92 = __Block_byref_object_copy__18;
  v93 = __Block_byref_object_dispose__18;
  uint64_t v94 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  char v88 = 0;
  NSPersistentStoreRequestType v9 = [(NSPersistentStoreRequest *)request requestType];
  unint64_t v10 = v9;
  if (v9 == NSFetchRequestType)
  {
    uint64_t v11 = [(NSPersistentStoreRequest *)v6 resultType];
    LOBYTE(v12) = [(NSPersistentStoreRequest *)v6 _isAsyncRequest];
    char v73 = 0;
    v71 = 0;
    if (v11 == 4) {
      unint64_t v10 = 3;
    }
    else {
      unint64_t v10 = 1;
    }
    uint64_t v84 = 0;
    goto LABEL_11;
  }
  uint64_t v84 = 0;
  if (v9 - 5 < 3 || v9 == NSSaveRequestType) {
    goto LABEL_10;
  }
  if (v9 == 8)
  {
    int v12 = [(NSPersistentStoreRequest *)v6 isDelete];
    if (v12)
    {
LABEL_10:
      v71 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Executing write request", &v84);
      LOBYTE(v12) = 0;
      char v73 = 1;
      goto LABEL_11;
    }
    char v73 = 0;
    v71 = 0;
    unint64_t v10 = 8;
  }
  else
  {
    char v73 = 0;
    LOBYTE(v12) = 0;
    v71 = 0;
  }
LABEL_11:
  if (context && (v12 & 1) == 0 && _PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)context, a2);
  }
  uint64_t v13 = "pe";
  if (!PFInstrumentsRecordingEnabled()) {
    goto LABEL_27;
  }
  if (v10 == 1 || v10 == 3)
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_540;
    v83[3] = &unk_1E544CC90;
    v83[4] = v6;
    os_signpost_id_t spid = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_540((uint64_t)v83);
    goto LABEL_29;
  }
  if (v10 != 2)
  {
LABEL_27:
    os_signpost_id_t spid = 0;
LABEL_29:
    v82 = 0;
    int v15 = 1;
    if (v10 > 7 || ((1 << v10) & 0xE4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
  }
  os_signpost_id_t spid = os_signpost_id_generate((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog);
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
  }
  uint64_t v14 = PFInstrumentsGetLog_coreDataInstrumentsLog;
  kdebug_trace();
  uint64_t v13 = "pe";
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18AB82000, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Save", (const char *)&unk_18AEC651A, buf, 2u);
  }
  v82 = 0;
LABEL_31:
  int v15 = 0;
LABEL_32:
  if (context) {
    persistentStoreIdentifiers = context->_persistentStoreIdentifiers;
  }
  else {
    persistentStoreIdentifiers = 0;
  }
  uint64_t v17 = +[NSQueryGenerationToken currentQueryGenerationToken];
  if (v17 != (NSQueryGenerationToken *)[(NSManagedObjectContext *)context _queryGenerationToken])
  {
    char exception_object = 1;
    goto LABEL_36;
  }
  id v27 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:");
  if (v27)
  {
    BOOL v28 = [(NSManagedObjectContext *)context _setQueryGenerationFromToken:v27 error:&v82];

    if (v28)
    {
      char exception_object = 1;
      uint64_t v13 = "AttributeType" + 11;
      goto LABEL_36;
    }
  }
  else
  {
    v82 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134502 userInfo:0];
  }
  if (!v15)
  {
    uint64_t v13 = "AttributeType" + 11;
    [(NSManagedObjectContext *)context _setQueryGenerationFromToken:+[NSQueryGenerationToken unpinnedQueryGenerationToken] error:0];
    char exception_object = 0;
LABEL_36:
    if (v10 != 8 || ![(NSPersistentStoreRequest *)v6 token])
    {
LABEL_50:
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = *((void *)v13 + 22);
      v76[2] = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_547;
      v76[3] = &unk_1E544CCB8;
      v76[4] = v6;
      v76[5] = persistentStoreIdentifiers;
      v76[6] = self;
      v76[7] = context;
      char v77 = exception_object;
      v76[8] = &v89;
      v76[9] = &v85;
      v76[10] = &v95;
      v76[11] = v10;
      v76[12] = spid;
      v76[13] = error;
      -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((void (*)(void))self, (uint64_t)v76);
      if (*((unsigned char *)v86 + 24))
      {
        pthread_yield_np();
        id v26 = [(NSPersistentStoreCoordinator *)self executeRequest:v6 withContext:context error:error];
LABEL_92:
        v36 = v26;
        goto LABEL_93;
      }
      if (v6 && v10 == 2) {
        v6[3].super.isa = (Class)((unint64_t)v6[3].super.isa & 0xFFFFFF00);
      }
      id v29 = (id)v96[5];
      if (error && !v90[5]) {
        *error = (NSError *)v96[5];
      }
      if (spid)
      {
        if (v10 == 1 || v10 == 3)
        {
          if (PFInstrumentsGetLog_logtoken != -1) {
            dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
          }
          if (spid != -1)
          {
            uint64_t v40 = PFInstrumentsGetLog_coreDataInstrumentsLog;
            if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
            {
              int v41 = [(id)v90[5] count];
              *(_DWORD *)buf = 67109120;
              LODWORD(v105) = v41;
              long long v31 = "Fetch";
              long long v32 = "%d";
              long long v33 = v40;
              os_signpost_id_t v34 = spid;
              uint32_t v35 = 8;
              goto LABEL_84;
            }
          }
        }
        else if (v10 == 2)
        {
          if (PFInstrumentsGetLog_logtoken != -1) {
            dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
          }
          if (spid != -1)
          {
            uint64_t v30 = PFInstrumentsGetLog_coreDataInstrumentsLog;
            if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
            {
              *(_WORD *)buf = 0;
              long long v31 = "Save";
              long long v32 = (const char *)&unk_18AEC651A;
              long long v33 = v30;
              os_signpost_id_t v34 = spid;
              uint32_t v35 = 2;
LABEL_84:
              _os_signpost_emit_with_name_impl(&dword_18AB82000, v33, OS_SIGNPOST_INTERVAL_END, v34, v31, v32, buf, v35);
            }
          }
        }
      }
      uint64_t v42 = v96[5];
      if (v90[5])
      {
        if (!v42) {
          goto LABEL_91;
        }
      }
      else if (v42)
      {
LABEL_91:
        id v26 = (id)v90[5];
        goto LABEL_92;
      }
      uint64_t v43 = [NSString stringWithUTF8String:"Either a non nil result OR an error"];
      _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, v67);
      v50 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v50, OS_LOG_TYPE_FAULT, "CoreData: Either a non nil result OR an error", buf, 2u);
      }
      goto LABEL_91;
    }
    v70 = (void *)[(NSPersistentStoreRequest *)v6 token];
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v70, "storeTokens"), "count"));
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v70, "storeTokens"), "count"));
    v68 = persistentStoreIdentifiers;
    v69 = v6;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v79 = 0u;
    long long v78 = 0u;
    uint64_t v20 = (void *)[v70 storeTokens];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v103 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v79 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v78 + 1) + 8 * i);
          id v25 = [(NSPersistentStoreCoordinator *)self persistentStoreForIdentifier:v24];
          if (v25) {
            [v18 addObject:v25];
          }
          else {
            [v19 addObject:v24];
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v103 count:16];
      }
      while (v21);
    }
    persistentStoreIdentifiers = v68;
    uint64_t v6 = v69;
    uint64_t v13 = "pe";
    if ([v18 count])
    {
      [(NSPersistentStoreRequest *)v69 setAffectedStores:v18];
      goto LABEL_50;
    }
    v37 = (void *)MEMORY[0x1E4F28C58];
    v101 = @"Reason";
    uint64_t v102 = [NSString stringWithFormat:@"Unable to find stores referenced in History Token (%@) - %@", v70, v19];
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    v39 = (NSError *)[v37 errorWithDomain:*MEMORY[0x1E4F281F8] code:134501 userInfo:v38];
    v96[5] = (uint64_t)v39;
    if (v39)
    {
      if (error)
      {
        v36 = 0;
        *error = v39;
        goto LABEL_93;
      }
      goto LABEL_101;
    }
    uint64_t v60 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
    v59 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_101;
    }
    *(_DWORD *)buf = 136315394;
    v105 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
    __int16 v106 = 1024;
    int v107 = 2805;
LABEL_103:
    _os_log_fault_impl(&dword_18AB82000, v59, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_101;
  }
  if (v82)
  {
    if (error)
    {
      v36 = 0;
      *error = v82;
      goto LABEL_93;
    }
    goto LABEL_101;
  }
  uint64_t v52 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog(17, v52, v53, v54, v55, v56, v57, v58, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
  v59 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v105 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
    __int16 v106 = 1024;
    int v107 = 2782;
    goto LABEL_103;
  }
LABEL_101:
  v36 = 0;
LABEL_93:
  if (v73) {
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v84, v71);
  }
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);
  return v36;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3052000000;
  uint64_t v40 = __Block_byref_object_copy__18;
  int v41 = __Block_byref_object_dispose__18;
  uint64_t v42 = 0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3052000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__18;
  uint32_t v35 = __Block_byref_object_dispose__18;
  uint64_t v36 = 0;
  if (a5 && _PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a5, a2);
  }
  uint64_t v11 = (void (*)(void))[a4 persistentStore];
  uint64_t v30 = 0;
  if (a5) {
    uint64_t v12 = *((void *)a5 + 20);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = +[NSQueryGenerationToken currentQueryGenerationToken];
  if (v13 != (NSQueryGenerationToken *)[a5 _queryGenerationToken]) {
    goto LABEL_7;
  }
  id v18 = [(NSPersistentStoreCoordinator *)self _retainedCurrentQueryGeneration:v12];
  if (!v18)
  {
    uint64_t v20 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134502 userInfo:0];
    uint64_t v30 = v20;
    if (!v20)
    {
LABEL_15:
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      BOOL v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v45 = 1024;
        int v46 = 4683;
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      goto LABEL_20;
    }
LABEL_18:
    if (a6)
    {
      uint64_t v16 = 0;
      *a6 = v20;
      goto LABEL_11;
    }
LABEL_20:
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  char v19 = [a5 _setQueryGenerationFromToken:v18 error:&v30];

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = v30;
    if (!v30) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
LABEL_7:
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __110__NSPersistentStoreCoordinator__NSInternalMethods__newValueForRelationship_forObjectWithID_withContext_error___block_invoke;
  v29[3] = &unk_1E544CD80;
  v29[4] = self;
  v29[5] = a5;
  v29[6] = a3;
  v29[7] = a4;
  v29[8] = &v37;
  v29[9] = &v31;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v29, v11);
  id v14 = (id)v32[5];
  if (a6)
  {
    int v15 = (void *)v32[5];
    if (v15) {
      *a6 = v15;
    }
  }
  uint64_t v16 = (void *)v38[5];
LABEL_11:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v16;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3052000000;
  uint64_t v38 = __Block_byref_object_copy__18;
  uint64_t v39 = __Block_byref_object_dispose__18;
  uint64_t v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000;
  long long v32 = __Block_byref_object_copy__18;
  uint64_t v33 = __Block_byref_object_dispose__18;
  uint64_t v34 = 0;
  if (a4 && _PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a4, a2);
  }
  NSPersistentStoreRequestType v9 = (void (*)(void))[a3 persistentStore];
  BOOL v28 = 0;
  if (a4) {
    uint64_t v10 = *((void *)a4 + 20);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = +[NSQueryGenerationToken currentQueryGenerationToken];
  if (v11 != (NSQueryGenerationToken *)[a4 _queryGenerationToken]) {
    goto LABEL_7;
  }
  id v16 = [(NSPersistentStoreCoordinator *)self _retainedCurrentQueryGeneration:v10];
  if (!v16)
  {
    id v18 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134502 userInfo:0];
    BOOL v28 = v18;
    if (!v18)
    {
LABEL_15:
      uint64_t v19 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      uint64_t v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v42 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v43 = 1024;
        int v44 = 4625;
        _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      goto LABEL_20;
    }
LABEL_18:
    if (a5)
    {
      id v14 = 0;
      *a5 = v18;
      goto LABEL_11;
    }
LABEL_20:
    id v14 = 0;
    goto LABEL_11;
  }
  char v17 = [a4 _setQueryGenerationFromToken:v16 error:&v28];

  if ((v17 & 1) == 0)
  {
    id v18 = v28;
    if (!v28) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
LABEL_7:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __95__NSPersistentStoreCoordinator__NSInternalMethods__newValuesForObjectWithID_withContext_error___block_invoke;
  v27[3] = &unk_1E544CD58;
  v27[4] = self;
  v27[5] = a4;
  v27[6] = a3;
  v27[7] = &v35;
  v27[8] = &v29;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v27, v9);
  id v12 = (id)v30[5];
  if (a5)
  {
    uint64_t v13 = (void *)v30[5];
    if (v13) {
      *a5 = v13;
    }
  }
  id v14 = (void *)v36[5];
LABEL_11:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v14;
}

os_signpost_id_t __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_540(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog);
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
  }
  uint64_t v3 = PFInstrumentsGetLog_coreDataInstrumentsLog;
  kdebug_trace();
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "entity"), "name");
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_18AB82000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Fetch", "%@", (uint8_t *)&v6, 0xCu);
  }
  return v2;
}

- (id)_retainedCurrentQueryGeneration:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  NSPersistentStoreRequestType v9 = __Block_byref_object_copy__18;
  uint64_t v10 = __Block_byref_object_dispose__18;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__NSPersistentStoreCoordinator_QueryGenerations___retainedCurrentQueryGeneration___block_invoke;
  v5[3] = &unk_1E544CEC0;
  v5[5] = self;
  v5[6] = &v6;
  v5[4] = a3;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((void (*)(void))self, (uint64_t)v5);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __110__NSPersistentStoreCoordinator__NSInternalMethods__newValueForRelationship_forObjectWithID_withContext_error___block_invoke(uint64_t a1, void *a2)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = @"Reason";
    v6[1] = @"store";
    v7[0] = @"Store is not valid for this context's generation";
    v7[1] = a2;
    v6[2] = @"context";
    v7[2] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
    id result = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v5];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = result;
  }
  else
  {
    if ([*(id *)(a1 + 48) isTransient]) {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = NSArray_EmptyArray;
    }
    else {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [a2 newValueForRelationship:*(void *)(a1 + 48) forObjectWithID:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
    }
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

- (void)replaceResultTypeOfRequestIfNecessary:(unsigned __int8 *)a3 store:(uint64_t)a4 requestType:(void *)a5 originalResultType:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1
    && objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"SQLite")
    && [a3 coreSpotlightExporter])
  {
    if (a3) {
      int v9 = (a3[201] >> 2) & 1;
    }
    else {
      LOBYTE(v9) = 0;
    }
    if ((unint64_t)(a4 - 8) >= 0xFFFFFFFFFFFFFFFDLL && (v9 & 1) == 0)
    {
      if (a4 == 7 || a4 == 6 || a4 == 5)
      {
        *a5 = [a2 resultType];
        [a2 setResultType:1];
      }
      else
      {
        uint64_t v10 = [NSString stringWithUTF8String:"Unknown Batch Request with CoreSpotlight Exporter: %lu"];
        _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, a4);
        char v17 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v19 = a4;
          _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Unknown Batch Request with CoreSpotlight Exporter: %lu", buf, 0xCu);
        }
      }
    }
  }
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_547(uint64_t a1, void *a2)
{
  uint64_t v461 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) affectedStores];
  uint64_t v359 = a1;
  if ([v4 count])
  {
    obuint64_t j = (_WORD *)[MEMORY[0x1E4F1CA48] array];
    long long v411 = 0u;
    long long v412 = 0u;
    long long v413 = 0u;
    long long v414 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v411 objects:v454 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v412;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v412 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v411 + 1) + 8 * i);
          if ([a2 containsObject:v8]) {
            [obj addObject:v8];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v411 objects:v454 count:16];
      }
      while (v5);
    }
  }
  else if ([*(id *)(a1 + 40) count])
  {
    obuint64_t j = (_WORD *)[MEMORY[0x1E4F1CA48] array];
    long long v415 = 0u;
    long long v416 = 0u;
    long long v417 = 0u;
    long long v418 = 0u;
    uint64_t v9 = [a2 countByEnumeratingWithState:&v415 objects:v455 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v416;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v416 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void **)(*((void *)&v415 + 1) + 8 * j);
          if (objc_msgSend(*(id *)(v359 + 40), "containsObject:", objc_msgSend(v12, "identifier"))) {
            [obj addObject:v12];
          }
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v415 objects:v455 count:16];
      }
      while (v9);
    }
  }
  else
  {
    obuint64_t j = a2;
  }
  unint64_t v13 = *(void *)(v359 + 88);
  BOOL v14 = v13 > 7;
  uint64_t v15 = (1 << v13) & 0xE4;
  if (v14 || v15 == 0)
  {
    if (!*(void *)(v359 + 48))
    {
      obuint64_t j = 0;
      uint64_t v17 = [0 count];
      goto LABEL_29;
    }
    long long v32 = (_WORD *)[*(id *)(v359 + 56) _queryGenerationToken];
    if ([v32 _isEnabled])
    {
      if (+[NSQueryGenerationToken nostoresQueryGenerationToken] == v32)
      {
        obuint64_t j = (_WORD *)NSArray_EmptyArray;
        uint64_t v17 = [(id)NSArray_EmptyArray count];
      }
      else
      {
        obuint64_t j = -[_NSQueryGenerationToken _storesForRequestRoutingFrom:error:](v32, obj, 0);
        uint64_t v17 = [obj count];
      }
      goto LABEL_29;
    }
  }
  uint64_t v17 = [obj count];
LABEL_29:
  unint64_t v354 = v17;
  if ([obj count])
  {
    if ((*(void *)(v359 + 88) | 2) != 3
      || ((id v18 = (void *)[*(id *)(v359 + 32) entity],
           uint64_t v19 = [v18 managedObjectModel],
           uint64_t v20 = *(void *)(v359 + 48),
           v19 == *(void *)(v20 + 40))
       || (uint64_t v21 = *(void *)(v20 + 96), v22 = _PFModelMapPathForEntity(v18), v21)
       && [*(id *)(v21 + 56) objectForKey:v22])
      && *(unsigned char *)(v359 + 112))
    {
LABEL_37:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*(id *)(v359 + 32) _incrementInUseCounter];
      }
      if (v354 >= 2)
      {
        unint64_t v23 = *(void *)(v359 + 88);
        if (v23 > 7 || ((1 << v23) & 0xEA) == 0)
        {
          id v402 = 0;
          goto LABEL_93;
        }
        uint64_t v24 = (void *)[obj mutableCopy];
        uint64_t v25 = *(void **)(v359 + 32);
        if (*(void *)(v359 + 88) == 7) {
          uint64_t v25 = (void *)[v25 fetchRequest];
        }
        uint64_t v26 = (void *)[v25 entity];
        if (objc_msgSend((id)objc_msgSend(v26, "managedObjectModel"), "_modelsReferenceIDOffset") < 15001)
        {
          long long v405 = 0uLL;
          long long v406 = 0uLL;
          long long v403 = 0uLL;
          long long v404 = 0uLL;
          uint64_t v33 = [obj countByEnumeratingWithState:&v403 objects:v450 count:16];
          if (v33)
          {
            unsigned int v34 = 0;
            uint64_t v35 = *(void *)v404;
            do
            {
              for (uint64_t k = 0; k != v33; ++k)
              {
                if (*(void *)v404 != v35) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v37 = (void *)[*(id *)(*((void *)&v403 + 1) + 8 * k) configurationName];
                if ([v37 isEqualToString:@"PF_DEFAULT_CONFIGURATION_NAME"]
                  || objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v359 + 48) + 40), "entitiesForConfiguration:", v37), "indexOfObjectIdenticalTo:", v26) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  ++v34;
                }
                else
                {
                  [v24 removeObjectAtIndex:v34];
                }
              }
              uint64_t v33 = [obj countByEnumeratingWithState:&v403 objects:v450 count:16];
            }
            while (v33);
          }
        }
        else
        {
          long long v409 = 0uLL;
          long long v410 = 0uLL;
          long long v407 = 0uLL;
          long long v408 = 0uLL;
          uint64_t v27 = [obj countByEnumeratingWithState:&v407 objects:v451 count:16];
          if (v27)
          {
            unsigned int v28 = 0;
            uint64_t v29 = *(void *)v408;
            do
            {
              for (uint64_t m = 0; m != v27; ++m)
              {
                if (*(void *)v408 != v29) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v31 = *(unsigned char **)(*((void *)&v407 + 1) + 8 * m);
                if (objc_msgSend((id)objc_msgSend(v31, "type"), "isEqualToString:", @"SQLite")
                  && v31
                  && (v31[201] & 4) != 0)
                {
                  ++v28;
                }
                else
                {
                  [v24 removeObjectAtIndex:v28];
                }
              }
              uint64_t v27 = [obj countByEnumeratingWithState:&v407 objects:v451 count:16];
            }
            while (v27);
          }
        }
        if ([v24 count] == v354)
        {
        }
        else
        {
          obuint64_t j = v24;
          unint64_t v354 = [obj count];
        }
      }
      id v402 = 0;
      if (v354 == 1)
      {
        v370 = (unsigned __int8 *)[obj objectAtIndex:0];
        uint64_t v38 = v359;
        uint64_t v39 = *(void *)(v359 + 88);
        if (v39 != 2)
        {
          *(void *)buf = 0;
          -[NSPersistentStoreCoordinator replaceResultTypeOfRequestIfNecessary:store:requestType:originalResultType:](*(void *)(v359 + 48), *(void **)(v359 + 32), v370, v39, buf);
          *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = [v370 executeRequest:*(void *)(v359 + 32) withContext:*(void *)(v359 + 56) error:&v402];
          if (*(void *)(v359 + 88) == 1 && *(void *)(v359 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1) {
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
            }
            uint64_t v38 = v359;
            os_signpost_id_t v106 = *(void *)(v359 + 96);
            if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              int v107 = PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                int v108 = [*(id *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) count];
                *(_DWORD *)v458 = 67109120;
                int v459 = v108;
                _os_signpost_emit_with_name_impl(&dword_18AB82000, v107, OS_SIGNPOST_INTERVAL_END, v106, "Fetch", "%d", v458, 8u);
                uint64_t v38 = v359;
              }
            }
          }
          if (*(void *)(v38 + 48))
          {
            if (*(void *)(*(void *)(*(void *)(v38 + 64) + 8) + 40))
            {
              uint64_t v109 = *(void *)(v38 + 88);
              if (objc_msgSend((id)objc_msgSend(v370, "type"), "isEqualToString:", @"SQLite"))
              {
                if ([v370 coreSpotlightExporter] && (unint64_t)(v109 - 5) <= 2)
                {
                  uint64_t v110 = [v370 coreSpotlightExporter];
                  -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:](v110, *(void *)(*(void *)(*(void *)(v38 + 64) + 8) + 40), v111, v112, v113, v114, v115, v116, v350);
                  *(void *)(*(void *)(*(void *)(v38 + 64) + 8) + 40) = -[NSPersistentStoreCoordinator restoreOriginalRequestIfNecessary:store:swizzledResults:originalRequestType:originalResultType:](*(void *)(v38 + 48), *(void **)(v38 + 32), (uint64_t)v370, *(void **)(*(void *)(*(void *)(v38 + 64) + 8)+ 40), *(void *)(v38 + 88), *(uint64_t *)buf);
                }
              }
            }
          }
          if (!*(void *)(*(void *)(*(void *)(v38 + 64) + 8) + 40) && *(void *)(v38 + 104)) {
            *(void *)(*(void *)(*(void *)(v38 + 80) + 8) + 40) = v402;
          }
          goto LABEL_426;
        }
        if ([v370 isReadOnly])
        {
          if (*(void *)(v359 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1) {
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
            }
            os_signpost_id_t v40 = *(void *)(v359 + 96);
            if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              int v41 = PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_18AB82000, v41, OS_SIGNPOST_INTERVAL_END, v40, "Save", (const char *)&unk_18AEC651A, buf, 2u);
              }
            }
          }
          if (objc_msgSend((id)objc_msgSend(v370, "options"), "objectForKey:", @"NSReadOnlyPersistentStoreOption"))
          {
            uint64_t v42 = @"Unable to write to file opened Read Only.";
          }
          else
          {
            uint64_t v42 = @"File is in Read Only mode due to Persistent History being detected but NSPersistentHistoryTrackingKey was not included.";
          }
          __int16 v43 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v44 = objc_msgSend((id)objc_msgSend(v370, "URL"), "path");
          uint64_t v45 = [v370 options];
          if (!v45) {
            uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
          }
          uint64_t v46 = objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, @"storeURL", v45, @"NSPersistentStoreOptions", v42, @"reason", 0);
          *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:513 userInfo:v46];
          uint64_t v47 = *(void *)(v359 + 64);
LABEL_404:
          *(void *)(*(void *)(v47 + 8) + 40) = 0;
LABEL_426:
          unint64_t v286 = *(void *)(v359 + 88);
          if (v286 <= 7 && ((1 << v286) & 0xE4) != 0)
          {
            if (*(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40))
            {
              v288 = *(void **)(v359 + 56);
              if (v288)
              {
                if (v286 == 2
                  && objc_msgSend((id)objc_msgSend(v288, "_queryGenerationToken"), "_isEnabled"))
                {
                  v392[0] = MEMORY[0x1E4F143A8];
                  v392[1] = 3221225472;
                  v393 = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_607;
                  v394 = &unk_1E544BB28;
                  v289 = *(void **)(v359 + 56);
                  uint64_t v395 = *(void *)(v359 + 48);
                  v396 = obj;
                  v397 = v289;
                  if ([v289 concurrencyType]) {
                    [*(id *)(v359 + 48) performBlockAndWait:v392];
                  }
                  else {
                    v393((uint64_t)v392);
                  }
                }
                else
                {
                  long long v390 = 0u;
                  long long v391 = 0u;
                  long long v388 = 0u;
                  long long v389 = 0u;
                  uint64_t v290 = [obj countByEnumeratingWithState:&v388 objects:v438 count:16];
                  if (v290)
                  {
                    uint64_t v291 = *(void *)v389;
                    do
                    {
                      for (uint64_t n = 0; n != v290; ++n)
                      {
                        if (*(void *)v389 != v291) {
                          objc_enumerationMutation(obj);
                        }
                        v293 = *(void **)(*((void *)&v388 + 1) + 8 * n);
                        if ([v293 supportsGenerationalQuerying]
                          && [v293 _hasActiveGenerations])
                        {
                          v383[0] = MEMORY[0x1E4F143A8];
                          v383[1] = 3221225472;
                          v384 = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_2;
                          v385 = &unk_1E544B778;
                          v294 = *(void **)(v359 + 56);
                          uint64_t v386 = *(void *)(v359 + 48);
                          v387 = v293;
                          if ([v294 concurrencyType]) {
                            [*(id *)(v359 + 48) performBlockAndWait:v383];
                          }
                          else {
                            v384((uint64_t)v383);
                          }
                        }
                      }
                      uint64_t v290 = [obj countByEnumeratingWithState:&v388 objects:v438 count:16];
                    }
                    while (v290);
                  }
                }
                if (-[NSPersistentStoreCoordinator _hasHistoryTracking:](*(void *)(v359 + 48), obj))
                {
                  v377[0] = MEMORY[0x1E4F143A8];
                  v377[1] = 3221225472;
                  v378 = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_3;
                  v379 = &unk_1E544BB28;
                  v295 = *(void **)(v359 + 56);
                  uint64_t v380 = *(void *)(v359 + 48);
                  v381 = obj;
                  v382 = v295;
                  if ([v295 concurrencyType]) {
                    [*(id *)(v359 + 48) performBlockAndWait:v377];
                  }
                  else {
                    v378((uint64_t)v377);
                  }
                }
              }
            }
          }
          v296 = *(void **)(*(void *)(*(void *)(v359 + 80) + 8) + 40);
          if (v296) {
            id v297 = v296;
          }
          v298 = *(void **)(*(void *)(*(void *)(v359 + 64) + 8) + 40);
          if (v298) {
            id v299 = v298;
          }
          if (*(void *)(v359 + 88) == 2)
          {
            uint64_t v300 = *(void *)(v359 + 32);
            if (v300) {
              v301 = *(void *)(v300 + 56) ? *(void **)(v300 + 56) : (void *)MEMORY[0x1E4F1CBF0];
            }
            else {
              v301 = 0;
            }
            if ([v301 count])
            {
              id v302 = (id)[v301 firstObject];
              if ((unint64_t)[v301 count] >= 2)
              {
                contextc = (void *)MEMORY[0x18C127630]();
                id v303 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                long long v375 = 0u;
                long long v376 = 0u;
                long long v373 = 0u;
                long long v374 = 0u;
                uint64_t v304 = [v301 countByEnumeratingWithState:&v373 objects:v437 count:16];
                if (v304)
                {
                  uint64_t v305 = *(void *)v374;
                  do
                  {
                    for (iuint64_t i = 0; ii != v304; ++ii)
                    {
                      if (*(void *)v374 != v305) {
                        objc_enumerationMutation(v301);
                      }
                      v307 = *(void **)(*((void *)&v373 + 1) + 8 * ii);
                      v308 = (void *)MEMORY[0x18C127630]();
                      v309 = objc_msgSend((id)objc_msgSend(v307, "userInfo"), "objectForKey:", @"_NSManagedObjectContextObjectIDMutationMappingKey");
                      if ([v309 count]) {
                        [v303 addEntriesFromDictionary:v309];
                      }
                    }
                    uint64_t v304 = [v301 countByEnumeratingWithState:&v373 objects:v437 count:16];
                  }
                  while (v304);
                }
                id v310 = objc_alloc(MEMORY[0x1E4F28EA0]);
                uint64_t v311 = [v302 name];
                uint64_t v312 = [v302 object];
                v435 = @"_NSManagedObjectContextObjectIDMutationMappingKey";
                id v436 = v303;
                uint64_t v313 = objc_msgSend(v310, "initWithName:object:userInfo:", v311, v312, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v436, &v435, 1));

                id v302 = (id)v313;
              }
              v314 = (void *)MEMORY[0x18C127630]();
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v302);
              if (v300)
              {

                *(void *)(v300 + 56) = 0;
              }
            }
          }
          return;
        }
        [v370 _preflightCrossCheck];
        contextb = (void *)[MEMORY[0x1E4F1CA48] array];
        uint64_t v216 = *(void *)(v359 + 48);
        if (!v216)
        {
LABEL_379:
          if ([contextb count])
          {
            if (*(void *)(v359 + 96))
            {
              if (PFInstrumentsGetLog_logtoken != -1) {
                dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
              }
              os_signpost_id_t v340 = *(void *)(v359 + 96);
              if (v340 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v341 = PFInstrumentsGetLog_coreDataInstrumentsLog;
                if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_18AB82000, v341, OS_SIGNPOST_INTERVAL_END, v340, "Save", (const char *)&unk_18AEC651A, buf, 2u);
                }
              }
            }
            uint64_t v342 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:contextb forKey:@"conflictList"];
            objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v342]);
          }
          int v269 = [v370 _prepareForExecuteRequest:*(void *)(v359 + 32) withContext:*(void *)(v359 + 56) error:&v402];
          if (v269) {
            uint64_t v270 = [v370 executeRequest:*(void *)(v359 + 32) withContext:*(void *)(v359 + 56) error:&v402];
          }
          else {
            uint64_t v270 = 0;
          }
          if (*(void *)(v359 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1) {
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
            }
            os_signpost_id_t v271 = *(void *)(v359 + 96);
            if (v271 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v272 = PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_18AB82000, v272, OS_SIGNPOST_INTERVAL_END, v271, "Save", (const char *)&unk_18AEC651A, buf, 2u);
              }
            }
          }
          if (v270)
          {
            if ([v370 coreSpotlightExporter])
            {
              uint64_t v273 = [v370 coreSpotlightExporter];
              -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:](v273, *(void *)(v359 + 32), v274, v275, v276, v277, v278, v279, v350);
            }
          }
          else
          {
            if (v402) {
              int v284 = v269;
            }
            else {
              int v284 = 0;
            }
            if (v284 == 1 && [v402 code] == 134050)
            {
              uint64_t v349 = [v402 userInfo];
              objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v349]);
            }
            if (*(void *)(v359 + 104)) {
              *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = v402;
            }
          }
          *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = v270;
          goto LABEL_426;
        }
        v217 = *(void **)(v359 + 56);
        v363 = *(void **)(v359 + 32);
        if (_PF_Threading_Debugging_level) {
          _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v217, sel__checkRequestForStore_withContext_originalRequest_andOptimisticLocking_);
        }
        int v218 = [v370 isReadOnly];
        if (objc_msgSend((id)objc_msgSend(v363, "insertedObjects"), "count")) {
          int v219 = v218;
        }
        else {
          int v219 = 0;
        }
        if (v219 == 1)
        {
          v338 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v370), @"NSAffectedStoresErrorKey", 0);
          id v339 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134030, @"Cannot insert objects into a read only store.", v338);
          objc_exception_throw(v339);
        }
        [v217 stalenessInterval];
        uint64_t v221 = v220;
        if (v217) {
          v217[18] = NSSQLDistantPastTimeInterval;
        }
        id v355 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        v357 = (void *)[v217 _queryGenerationToken];
        int v361 = [v357 _isEnabled];
        if (v361) {
          objc_msgSend(v217, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"), 0);
        }
        v222 = (void *)[v363 insertedObjects];
        if ([v222 count])
        {
          if ([v370 configurationName])
          {
            CFSetRef v223 = (const __CFSet *)[v370 _entitiesForConfiguration];
            long long v434 = 0u;
            long long v433 = 0u;
            long long v431 = 0u;
            long long v432 = 0u;
            uint64_t v224 = [v222 countByEnumeratingWithState:&v431 objects:buf count:16];
            if (v224)
            {
              uint64_t v225 = *(void *)v432;
              do
              {
                for (juint64_t j = 0; jj != v224; ++jj)
                {
                  if (*(void *)v432 != v225) {
                    objc_enumerationMutation(v222);
                  }
                  v227 = *(void **)(*((void *)&v431 + 1) + 8 * jj);
                  if (!CFSetContainsValue(v223, (const void *)[v227 entity]))
                  {
                    v321 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v227, @"NSAffectedObjectsErrorKey", 0);
                    uint64_t v322 = [NSString stringWithFormat:@"Store %@ cannot hold instances of entity %@", v370, objc_msgSend(v227, "entity")];
                    id v323 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134020, v322, v321);
                    objc_exception_throw(v323);
                  }
                }
                uint64_t v224 = [v222 countByEnumeratingWithState:&v431 objects:buf count:16];
              }
              while (v224);
            }
          }
        }
        v228 = (void *)[v363 updatedObjects];
        if ([v228 count])
        {
          if (v218)
          {
            v343 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v370), @"NSAffectedStoresErrorKey", 0);
            uint64_t v344 = *MEMORY[0x1E4F1C3C8];
            v345 = @"Cannot update objects into a read only store.";
            goto LABEL_511;
          }
          long long v429 = 0u;
          long long v430 = 0u;
          long long v427 = 0u;
          long long v428 = 0u;
          uint64_t v229 = [v228 countByEnumeratingWithState:&v427 objects:v458 count:16];
          if (v229)
          {
            uint64_t v230 = *(void *)v428;
            do
            {
              for (kuint64_t k = 0; kk != v229; ++kk)
              {
                if (*(void *)v428 != v230) {
                  objc_enumerationMutation(v228);
                }
                v232 = *(_DWORD **)(*((void *)&v427 + 1) + 8 * kk);
                v233 = (void *)MEMORY[0x18C127630]();
                if (objc_msgSend((id)objc_msgSend(v232, "objectID"), "isTemporaryID"))
                {
                  v315 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v232), @"NSAffectedObjectsErrorKey", 0);
                  id v316 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134030, @"Cannot update object that was never inserted.", v315);
                  objc_exception_throw(v316);
                }
                v234 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v216, v232, (void **)v217, v370);
                if (v234) {
                  [contextb addObject:v234];
                }
              }
              uint64_t v229 = [v228 countByEnumeratingWithState:&v427 objects:v458 count:16];
            }
            while (v229);
          }
        }
        v235 = (void *)[v363 deletedObjects];
        if (![v235 count]) {
          goto LABEL_359;
        }
        if (!v218)
        {
          long long v425 = 0u;
          long long v426 = 0u;
          long long v423 = 0u;
          long long v424 = 0u;
          uint64_t v236 = [v235 countByEnumeratingWithState:&v423 objects:v457 count:16];
          if (v236)
          {
            v365 = 0;
            uint64_t v237 = *(void *)v424;
            do
            {
              for (muint64_t m = 0; mm != v236; ++mm)
              {
                if (*(void *)v424 != v237) {
                  objc_enumerationMutation(v235);
                }
                v239 = *(_DWORD **)(*((void *)&v423 + 1) + 8 * mm);
                v240 = (void *)MEMORY[0x18C127630]();
                if (objc_msgSend((id)objc_msgSend(v239, "objectID"), "isTemporaryID"))
                {
                  v317 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v239), @"NSAffectedObjectsErrorKey", 0);
                  id v318 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134030, @"Cannot delete object that was never inserted.", v317);
                  objc_exception_throw(v318);
                }
                v241 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v216, v239, (void **)v217, v370);
                v242 = v241;
                if (v241)
                {
                  if (objc_msgSend((id)objc_msgSend(v241, "objectForKey:", @"newVersion"), "intValue"))
                  {
                    [contextb addObject:v242];
                  }
                  else
                  {
                    v243 = v365;
                    if (!v365) {
                      v243 = objc_msgSend((id)objc_msgSend(v363, "deletedObjects"), "mutableCopy");
                    }
                    v365 = v243;
                    [v243 removeObject:v239];
                  }
                }
              }
              uint64_t v236 = [v235 countByEnumeratingWithState:&v423 objects:v457 count:16];
            }
            while (v236);
            goto LABEL_360;
          }
LABEL_359:
          v365 = 0;
LABEL_360:
          if (v217) {
            v217[18] = v221;
          }
          v261 = (void *)[v363 lockedObjects];
          if ([v261 count])
          {
            long long v421 = 0u;
            long long v422 = 0u;
            long long v419 = 0u;
            long long v420 = 0u;
            uint64_t v262 = [v261 countByEnumeratingWithState:&v419 objects:v456 count:16];
            if (v262)
            {
              uint64_t v263 = *(void *)v420;
              do
              {
                for (uint64_t nn = 0; nn != v262; ++nn)
                {
                  if (*(void *)v420 != v263) {
                    objc_enumerationMutation(v261);
                  }
                  v265 = *(_DWORD **)(*((void *)&v419 + 1) + 8 * nn);
                  v266 = (void *)MEMORY[0x18C127630]();
                  if (objc_msgSend((id)objc_msgSend(v265, "objectID"), "isTemporaryID"))
                  {
                    v319 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v265), @"NSAffectedObjectsErrorKey", 0);
                    id v320 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134030, @"Cannot lock object that was never inserted.", v319);
                    objc_exception_throw(v320);
                  }
                  v267 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v216, v265, (void **)v217, v370);
                  if (v267) {
                    [contextb addObject:v267];
                  }
                }
                uint64_t v262 = [v261 countByEnumeratingWithState:&v419 objects:v456 count:16];
              }
              while (v262);
            }
          }
          if (v217) {
            v217[18] = v221;
          }
          if (v361) {
            [v217 _setQueryGenerationFromToken:v357 error:0];
          }
          [v355 drain];
          id v268 = 0;
          if (v365)
          {
            -[NSSaveChangesRequest setDeletedObjects:](v363, v365);
          }
          goto LABEL_379;
        }
        v343 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v370), @"NSAffectedStoresErrorKey", 0);
        uint64_t v344 = *MEMORY[0x1E4F1C3C8];
        v345 = @"Cannot delete objects into a read only store.";
LABEL_511:
        id v346 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v344, 134030, (uint64_t)v345, v343);
        objc_exception_throw(v346);
      }
      unint64_t v23 = *(void *)(v359 + 88);
LABEL_93:
      switch(v23)
      {
        case 1uLL:
          v122 = (void *)[*(id *)(v359 + 32) sortDescriptors];
          BOOL v123 = [v122 count]
              && [*(id *)(v359 + 32) includesPropertyValues]
              && [*(id *)(v359 + 32) resultType] != 1;
          objc_msgSend((id)objc_msgSend(*(id *)(v359 + 32), "propertiesToGroupBy"), "count");
          *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v354];
          if (!v354)
          {
            int v244 = 0;
LABEL_396:
            if ((unint64_t)[*(id *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) count] >= 2
              && ((v244 ^ 1) & 1) == 0
              && v123)
            {
              [*(id *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) sortUsingDescriptors:v122];
            }
            goto LABEL_426;
          }
          int v244 = 0;
          uint64_t v245 = 0;
          while (1)
          {
            v246 = objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", v245), "executeRequest:withContext:error:", *(void *)(v359 + 32), *(void *)(v359 + 56), &v402);
            v247 = v246;
            if (!v246) {
              break;
            }
            if ([v246 count])
            {
              BOOL v248 = [*(id *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) count] != 0;
              [*(id *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) addObjectsFromArray:v247];
              v244 |= v248;
            }
            if (v354 == ++v245) {
              goto LABEL_396;
            }
          }
          *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = v402;
          uint64_t v47 = *(void *)(v359 + 64);
          goto LABEL_404;
        case 3uLL:
          *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v354];
          if (v354)
          {
            uint64_t v118 = 0;
            for (uint64_t i1 = 0; i1 != v354; ++i1)
            {
              v120 = objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", i1), "executeRequest:withContext:error:", *(void *)(v359 + 32), *(void *)(v359 + 56), *(void *)(*(void *)(v359 + 80) + 8) + 40);
              v121 = v120;
              if (v120 && [v120 count]) {
                uint64_t v118 = objc_msgSend((id)objc_msgSend(v121, "lastObject"), "unsignedIntValue")
              }
                     + v118;
            }
          }
          else
          {
            uint64_t v118 = 0;
          }
          v280 = (NSPersistentHistoryResult *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v118));
          break;
        case 2uLL:
          if (v354)
          {
            for (uint64_t i2 = 0; i2 != v354; ++i2)
              objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", i2), "_preflightCrossCheck");
          }
          -[NSPersistentStoreCoordinator _doPreSaveAssignmentsForObjects:intoStores:](*(void *)(v359 + 48), (void *)[*(id *)(v359 + 32) insertedObjects], obj);
          v352 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v354];
          v362 = (void *)[MEMORY[0x1E4F1CA48] array];
          if (v354)
          {
            uint64_t v49 = 0;
            uint64_t v351 = *MEMORY[0x1E4F1C3C8];
            do
            {
              uint64_t v353 = v49;
              v50 = (unsigned __int8 *)objc_msgSend(obj, "objectAtIndex:");
              uint64_t v364 = *(void *)(v359 + 48);
              if (v364)
              {
                v51 = *(void **)(v359 + 56);
                v356 = *(void **)(v359 + 32);
                if (_PF_Threading_Debugging_level) {
                  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v51, sel__saveRequestForStore_withContext_originalRequest_andOptimisticLocking_);
                }
                char v52 = [v50 isReadOnly];
                [v51 stalenessInterval];
                uint64_t v54 = v53;
                if (v51) {
                  v51[18] = NSSQLDistantPastTimeInterval;
                }
                context = (void **)v51;
                uint64_t v55 = (void *)[v356 insertedObjects];
                long long v434 = 0u;
                long long v433 = 0u;
                long long v431 = 0u;
                long long v432 = 0u;
                uint64_t v56 = [v55 countByEnumeratingWithState:&v431 objects:buf count:16];
                if (v56)
                {
                  v371 = 0;
                  uint64_t v57 = *(void *)v432;
                  do
                  {
                    for (uint64_t i3 = 0; i3 != v56; ++i3)
                    {
                      if (*(void *)v432 != v57) {
                        objc_enumerationMutation(v55);
                      }
                      v59 = *(void **)(*((void *)&v431 + 1) + 8 * i3);
                      if ((unsigned __int8 *)objc_msgSend((id)objc_msgSend(v59, "objectID"), "persistentStore") == v50)
                      {
                        if (v52)
                        {

                          uint64_t v97 = (void *)MEMORY[0x1E4F1C9E8];
                          uint64_t v98 = [MEMORY[0x1E4F1C978] arrayWithObject:v50];
                          id v99 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v351, 134030, @"Cannot insert objects into a read only store.", objc_msgSend(v97, "dictionaryWithObjectsAndKeys:", v98, @"NSAffectedStoresErrorKey", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v59), @"NSAffectedObjectsErrorKey", 0));
                          objc_exception_throw(v99);
                        }
                        uint64_t v60 = v371;
                        if (!v371) {
                          uint64_t v60 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v356, "insertedObjects"), "count"));
                        }
                        v371 = v60;
                        [v60 addObject:v59];
                      }
                    }
                    uint64_t v56 = [v55 countByEnumeratingWithState:&v431 objects:buf count:16];
                  }
                  while (v56);
                }
                else
                {
                  v371 = 0;
                }
                uint64_t v61 = (void *)[v356 updatedObjects];
                long long v429 = 0u;
                long long v430 = 0u;
                long long v427 = 0u;
                long long v428 = 0u;
                uint64_t v62 = [v61 countByEnumeratingWithState:&v427 objects:v458 count:16];
                if (v62)
                {
                  v360 = 0;
                  uint64_t v63 = *(void *)v428;
                  do
                  {
                    for (uint64_t i4 = 0; i4 != v62; ++i4)
                    {
                      if (*(void *)v428 != v63) {
                        objc_enumerationMutation(v61);
                      }
                      uint64_t v65 = *(_DWORD **)(*((void *)&v427 + 1) + 8 * i4);
                      uint64_t v66 = (void *)MEMORY[0x18C127630]();
                      if ((unsigned __int8 *)objc_msgSend((id)objc_msgSend(v65, "objectID"), "persistentStore") == v50)
                      {
                        if (v52)
                        {

                          uint64_t v100 = (void *)MEMORY[0x1E4F1C9E8];
                          uint64_t v101 = [MEMORY[0x1E4F1C978] arrayWithObject:v50];
                          id v102 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v351, 134030, @"Cannot update objects into a read only store.", objc_msgSend(v100, "dictionaryWithObjectsAndKeys:", v101, @"NSAffectedStoresErrorKey", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v65), @"NSAffectedObjectsErrorKey", 0));
                          objc_exception_throw(v102);
                        }
                        uint64_t v67 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v364, v65, context, v50);
                        if (v67)
                        {
                          [v362 addObject:v67];
                        }
                        else
                        {
                          v68 = v360;
                          if (!v360) {
                            v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v356, "updatedObjects"), "count"));
                          }
                          v360 = v68;
                          [v68 addObject:v65];
                        }
                      }
                    }
                    uint64_t v62 = [v61 countByEnumeratingWithState:&v427 objects:v458 count:16];
                  }
                  while (v62);
                }
                else
                {
                  v360 = 0;
                }
                v69 = (void *)[v356 deletedObjects];
                long long v425 = 0u;
                long long v426 = 0u;
                long long v423 = 0u;
                long long v424 = 0u;
                v70 = 0;
                uint64_t v71 = [v69 countByEnumeratingWithState:&v423 objects:v457 count:16];
                if (v71)
                {
                  uint64_t v72 = *(void *)v424;
                  do
                  {
                    uint64_t v73 = 0;
                    do
                    {
                      if (*(void *)v424 != v72) {
                        objc_enumerationMutation(v69);
                      }
                      v74 = *(_DWORD **)(*((void *)&v423 + 1) + 8 * v73);
                      v75 = (void *)MEMORY[0x18C127630]();
                      if ((unsigned __int8 *)objc_msgSend((id)objc_msgSend(v74, "objectID"), "persistentStore") == v50)
                      {
                        if (v52)
                        {

                          v103 = (void *)MEMORY[0x1E4F1C9E8];
                          uint64_t v104 = [MEMORY[0x1E4F1C978] arrayWithObject:v50];
                          id v105 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v351, 134030, @"Cannot delete objects into a read only store.", objc_msgSend(v103, "dictionaryWithObjectsAndKeys:", v104, @"NSAffectedStoresErrorKey", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v74), @"NSAffectedObjectsErrorKey", 0));
                          objc_exception_throw(v105);
                        }
                        v76 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v364, v74, context, v50);
                        char v77 = v76;
                        if (v76)
                        {
                          if (objc_msgSend((id)objc_msgSend(v76, "objectForKey:", @"newVersion"), "intValue"))
                          {
                            [v362 addObject:v77];
                          }
                          else if (!v70)
                          {
                            v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v356, "deletedObjects"), "count"));
                          }
                        }
                        else
                        {
                          if (!v70) {
                            v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v356, "deletedObjects"), "count"));
                          }
                          [v70 addObject:v74];
                        }
                      }
                      ++v73;
                    }
                    while (v71 != v73);
                    uint64_t v78 = [v69 countByEnumeratingWithState:&v423 objects:v457 count:16];
                    uint64_t v71 = v78;
                  }
                  while (v78);
                }
                if (context) {
                  context[18] = v54;
                }
                long long v79 = (void *)[v356 lockedObjects];
                long long v421 = 0u;
                long long v422 = 0u;
                long long v419 = 0u;
                long long v420 = 0u;
                long long v80 = 0;
                uint64_t v81 = [v79 countByEnumeratingWithState:&v419 objects:v456 count:16];
                if (v81)
                {
                  uint64_t v82 = *(void *)v420;
                  do
                  {
                    for (uint64_t i5 = 0; i5 != v81; ++i5)
                    {
                      if (*(void *)v420 != v82) {
                        objc_enumerationMutation(v79);
                      }
                      uint64_t v84 = *(_DWORD **)(*((void *)&v419 + 1) + 8 * i5);
                      uint64_t v85 = (void *)MEMORY[0x18C127630]();
                      if ((unsigned __int8 *)objc_msgSend((id)objc_msgSend(v84, "objectID"), "persistentStore") == v50)
                      {
                        v86 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v364, v84, context, v50);
                        if (v86)
                        {
                          [v362 addObject:v86];
                        }
                        else
                        {
                          if (!v80) {
                            long long v80 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v356, "lockedObjects"), "count"));
                          }
                          [v80 addObject:v84];
                        }
                      }
                    }
                    uint64_t v81 = [v79 countByEnumeratingWithState:&v419 objects:v456 count:16];
                  }
                  while (v81);
                }
                if (context) {
                  context[18] = v54;
                }
                uint64_t v87 = [v362 count];
                char v88 = [NSSaveChangesRequest alloc];
                if (v87) {
                  uint64_t v89 = 0;
                }
                else {
                  uint64_t v89 = v371;
                }
                if (v87) {
                  v90 = 0;
                }
                else {
                  v90 = v360;
                }
                if (v87) {
                  uint64_t v91 = 0;
                }
                else {
                  uint64_t v91 = v70;
                }
                if (v87) {
                  v92 = 0;
                }
                else {
                  v92 = v80;
                }
                v93 = [(NSSaveChangesRequest *)v88 initWithInsertedObjects:v89 updatedObjects:v90 deletedObjects:v91 lockedObjects:v92];

                uint64_t v94 = v93;
              }
              else
              {
                uint64_t v94 = 0;
              }
              if (([v50 isReadOnly] & 1) == 0)
              {
                if (-[NSSaveChangesRequest hasChanges]((BOOL)v94)
                  || v50 && (unsigned __int8 v95 = atomic_load(v50 + 60), (v95 & 1) != 0))
                {
                  uint64_t v350 = 0;
                  v96 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v50];
                  [(NSPersistentStoreRequest *)v94 setAffectedStores:v96];

                  [v352 addObject:v94];
                }
              }
              uint64_t v49 = v353 + 1;
            }
            while (v353 + 1 != v354);
          }
          if ([v362 count])
          {
            uint64_t v335 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v362 forKey:@"conflictList"];
            if (*(void *)(v359 + 96))
            {
              if (PFInstrumentsGetLog_logtoken != -1) {
                dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_25);
              }
              os_signpost_id_t v336 = *(void *)(v359 + 96);
              if (v336 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v337 = PFInstrumentsGetLog_coreDataInstrumentsLog;
                if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_18AB82000, v337, OS_SIGNPOST_INTERVAL_END, v336, "Save", (const char *)&unk_18AEC651A, buf, 2u);
                }
              }
            }
            objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v335]);
          }
          uint64_t v163 = [v352 count];
          *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v163];
          if (!v163) {
            goto LABEL_426;
          }
          uint64_t v164 = 0;
          uint64_t v165 = 1;
          contexta = (void *)*MEMORY[0x1E4F281F8];
          uint64_t v372 = *MEMORY[0x1E4F28A50];
          v166 = (void *)MEMORY[0x1E4F1CBF0];
          while (1)
          {
            v167 = (id *)[v352 objectAtIndex:v164];
            v168 = objc_msgSend((id)objc_msgSend(v167, "affectedStores"), "objectAtIndex:", 0);
            if ([v168 _prepareForExecuteRequest:v167 withContext:*(void *)(v359 + 56) error:*(void *)(*(void *)(v359 + 80) + 8) + 40])break; {
LABEL_286:
            }
            ++v164;
            ++v165;
            if (v164 == v163) {
              goto LABEL_426;
            }
          }
          uint64_t v169 = [v168 executeRequest:v167 withContext:*(void *)(v359 + 56) error:*(void *)(*(void *)(v359 + 80) + 8) + 40];
          if (v169)
          {
            [*(id *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) addObject:v169];
            if ([v168 coreSpotlightExporter])
            {
              uint64_t v170 = [v168 coreSpotlightExporter];
              -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:](v170, (uint64_t)v167, v171, v172, v173, v174, v175, v176, v350);
            }
            if (v167)
            {
              if (v167[7]) {
                id v177 = v167[7];
              }
              else {
                id v177 = v166;
              }
            }
            else
            {
              id v177 = 0;
            }
            if ([v177 count])
            {
              long long v400 = 0u;
              long long v401 = 0u;
              long long v398 = 0u;
              long long v399 = 0u;
              uint64_t v178 = [v177 countByEnumeratingWithState:&v398 objects:v447 count:16];
              if (v178)
              {
                uint64_t v179 = *(void *)v399;
                do
                {
                  for (uint64_t i6 = 0; i6 != v178; ++i6)
                  {
                    if (*(void *)v399 != v179) {
                      objc_enumerationMutation(v177);
                    }
                    -[NSSaveChangesRequest _addChangedObjectIDsNotification:](*(void *)(v359 + 32), *(void *)(*((void *)&v398 + 1) + 8 * i6));
                  }
                  uint64_t v178 = [v177 countByEnumeratingWithState:&v398 objects:v447 count:16];
                }
                while (v178);
              }
            }
            if (!v167) {
              goto LABEL_286;
            }

            v181 = v167 + 7;
            goto LABEL_285;
          }
          if (*(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40))
          {
LABEL_282:
            if (v163 != 1)
            {
              uint64_t v326 = *(void *)(v359 + 80);
              if (!v164)
              {
                uint64_t v327 = objc_msgSend(*(id *)(*(void *)(v326 + 8) + 40), "code", v169);
                uint64_t v326 = *(void *)(v359 + 80);
                if (v327 == 134050)
                {
                  uint64_t v328 = [*(id *)(*(void *)(v326 + 8) + 40) userInfo];
                  v329 = +[_NSCoreDataOptimisticLockingException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v328];
                  *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = 0;
                  objc_exception_throw(v329);
                }
              }
              uint64_t v330 = objc_msgSend(*(id *)(*(void *)(v326 + 8) + 40), "code", v169);
              uint64_t v331 = [*(id *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) localizedFailureReason];
              uint64_t v448 = v372;
              uint64_t v449 = *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40);
              v332 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v449 forKeys:&v448 count:1];
              if (v331) {
                v333 = (__CFString *)v331;
              }
              else {
                v333 = @"Save failed";
              }
              id v334 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], v330, (uint64_t)v333, v332);
              -[_NSCoreDataException _setDomain:]((uint64_t)v334, (void *)[*(id *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) domain]);
              *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = 0;
              objc_exception_throw(v334);
            }
            if (objc_msgSend(*(id *)(*(void *)(*(void *)(v359 + 80) + 8) + 40), "code", v169) == 134050)
            {
              uint64_t v324 = [*(id *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) userInfo];
              v325 = +[_NSCoreDataOptimisticLockingException exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"optimistic locking failure" userInfo:v324];
              *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = 0;
              objc_exception_throw(v325);
            }
            v181 = (void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40);
LABEL_285:
            void *v181 = 0;
            goto LABEL_286;
          }
          if (objc_msgSend((id)objc_msgSend(v168, "type", 0), "isEqualToString:", @"SQLite"))
          {
            uint64_t v182 = [NSString stringWithUTF8String:"A sqlite store save failed but did not return an error: %@"];
            _NSCoreDataLog(17, v182, v183, v184, v185, v186, v187, v188, (uint64_t)v168);
            uint64_t v189 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v168;
              v190 = v189;
              v191 = "CoreData: A sqlite store save failed but did not return an error: %@";
LABEL_280:
              _os_log_fault_impl(&dword_18AB82000, v190, OS_LOG_TYPE_FAULT, v191, buf, 0xCu);
            }
          }
          else if (objc_msgSend((id)objc_msgSend(v168, "type"), "isEqualToString:", @"NSXPCStore"))
          {
            uint64_t v192 = [NSString stringWithUTF8String:"A xpc store save failed but did not return an error: %@"];
            _NSCoreDataLog(17, v192, v193, v194, v195, v196, v197, v198, (uint64_t)v168);
            uint64_t v199 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v168;
              v190 = v199;
              v191 = "CoreData: A xpc store save failed but did not return an error: %@";
              goto LABEL_280;
            }
          }
          else
          {
            if (!objc_msgSend((id)objc_msgSend(v168, "type"), "isEqualToString:", @"Binary"))
            {
              if (!objc_msgSend((id)objc_msgSend(v168, "type"), "isEqualToString:", @"InMemory")) {
                goto LABEL_281;
              }
              uint64_t v208 = [NSString stringWithUTF8String:"An in-memory store save failed but did not return an error: %@"];
              _NSCoreDataLog(17, v208, v209, v210, v211, v212, v213, v214, (uint64_t)v168);
              uint64_t v215 = __pflogFaultLog;
              if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
                goto LABEL_281;
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v168;
              v190 = v215;
              v191 = "CoreData: An in-memory store save failed but did not return an error: %@";
              goto LABEL_280;
            }
            uint64_t v200 = [NSString stringWithUTF8String:"A binary store save failed but did not return an error: %@"];
            _NSCoreDataLog(17, v200, v201, v202, v203, v204, v205, v206, (uint64_t)v168);
            uint64_t v207 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v168;
              v190 = v207;
              v191 = "CoreData: A binary store save failed but did not return an error: %@";
              goto LABEL_280;
            }
          }
LABEL_281:
          *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", contexta, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Unknown", v372));
          goto LABEL_282;
        default:
          id v124 = *(id *)(v359 + 32);
          if (v23 == 8)
          {
            if ([*(id *)(v359 + 32) resultType] == 4)
            {
              _NSCoreDataLog(1, @"NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores [%@]", v125, v126, v127, v128, v129, v130, (uint64_t)obj);
              v445 = @"NSAffectedStoresErrorKey";
              v446 = obj;
              v347 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v446 forKeys:&v445 count:1];
              id v348 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134091, @"NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores", v347);
              objc_exception_throw(v348);
            }
            if ([v124 fetchBatchSize])
            {
              id v124 = (id)[v124 copy];
              [v124 setFetchBatchSize:0];
            }
          }
          *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v354];
          id v131 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v132 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v354)
          {
            uint64_t v133 = 0;
            uint64_t v134 = *MEMORY[0x1E4F281F8];
            do
            {
              v135 = (unsigned __int8 *)[obj objectAtIndex:v133];
              *(void *)buf = 0;
              -[NSPersistentStoreCoordinator replaceResultTypeOfRequestIfNecessary:store:requestType:originalResultType:](*(void *)(v359 + 48), v124, v135, *(void *)(v359 + 88), buf);
              id v136 = (id)[v135 executeRequest:v124 withContext:*(void *)(v359 + 56) error:*(void *)(*(void *)(v359 + 80) + 8) + 40];
              if (v136)
              {
                if (*(void *)(v359 + 48))
                {
                  uint64_t v137 = *(void *)(v359 + 88);
                  if (objc_msgSend((id)objc_msgSend(v135, "type"), "isEqualToString:", @"SQLite"))
                  {
                    if ([v135 coreSpotlightExporter] && (unint64_t)(v137 - 5) <= 2)
                    {
                      uint64_t v138 = [v135 coreSpotlightExporter];
                      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:](v138, (uint64_t)v136, v139, v140, v141, v142, v143, v144, v350);
                      id v136 = -[NSPersistentStoreCoordinator restoreOriginalRequestIfNecessary:store:swizzledResults:originalRequestType:originalResultType:](*(void *)(v359 + 48), v124, (uint64_t)v135, v136, *(void *)(v359 + 88), *(uint64_t *)buf);
                    }
                  }
                }
                v145 = *(void **)(*(void *)(*(void *)(v359 + 64) + 8) + 40);
              }
              else
              {
                v146 = *(void **)(*(void *)(*(void *)(v359 + 80) + 8) + 40);
                if (v146)
                {
                  uint64_t v147 = [v146 code];
                  uint64_t v148 = *(void *)(*(void *)(v359 + 80) + 8);
                  id v136 = *(id *)(v148 + 40);
                  if (v147 != 134091)
                  {
                    [v132 addObject:*(void *)(v148 + 40)];
                    break;
                  }
                  v145 = v131;
                }
                else
                {
                  v149 = (void *)MEMORY[0x1E4F28C58];
                  v444[0] = *(void *)(v359 + 32);
                  v443[0] = @"NSPersistentStoreRequest";
                  v443[1] = @"NSPersistentStore";
                  uint64_t v150 = [obj objectAtIndex:v133];
                  v443[2] = @"reason";
                  v444[1] = v150;
                  v444[2] = @"Store returned nil but no error.";
                  id v136 = (id)objc_msgSend(v149, "errorWithDomain:code:userInfo:", v134, 134070, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v444, v443, 3));
                  v145 = v132;
                }
              }
              [v145 addObject:v136];
              *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = 0;
              ++v133;
            }
            while (v354 != v133);
          }
          if ([v131 count] == v354)
          {
            _NSCoreDataLog(1, @"NSPersistentStoreRequest failed unsupported by all stores on this coordinator.  Request: '%@' and stores [%@]", v151, v152, v153, v154, v155, v156, *(void *)(v359 + 32));
            v157 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v158 = *(void *)(v359 + 32);
            v441[0] = @"NSPersistentStoreRequest";
            v441[1] = @"NSPersistentStores";
            v442[0] = v158;
            v442[1] = obj;
            v441[2] = @"reason";
            v442[2] = @"Operation unsupported by all stores on this coordinator.";
            uint64_t v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v442 forKeys:v441 count:3];
            objc_msgSend(v132, "addObject:", objc_msgSend(v157, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134091, v159));
          }
          if ([v132 count])
          {
            *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = 0;
            if (*(void *)(v359 + 104))
            {
              v160 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v161 = *(void *)(v359 + 32);
              v439[0] = @"NSPersistentStoreRequest";
              v439[1] = @"Underlying errors";
              v440[0] = v161;
              v440[1] = v132;
              v439[2] = @"reason";
              v440[2] = @"One or more stores returned an error.";
              uint64_t v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v440 forKeys:v439 count:3];
              *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = [v160 errorWithDomain:*MEMORY[0x1E4F281F8] code:134070 userInfo:v162];
            }

            goto LABEL_426;
          }

          if (*(void *)(v359 + 48))
          {
            v281 = *(void **)(*(void *)(*(void *)(v359 + 64) + 8) + 40);
            uint64_t v282 = [*(id *)(v359 + 32) requestType];
            v283 = off_1E544AC58;
            switch(v282)
            {
              case 5:
                goto LABEL_423;
              case 6:
                v283 = off_1E544AC68;
                goto LABEL_423;
              case 7:
                v283 = off_1E544AC48;
                goto LABEL_423;
              case 8:
                if (!v281) {
                  goto LABEL_478;
                }
                if ([v281 count] == 1) {
                  goto LABEL_417;
                }
                v285 = [[NSPersistentHistoryResult alloc] initWithSubresults:v281];
                goto LABEL_424;
              case 10:
                v283 = off_1E544B0B8;
                goto LABEL_423;
              case 11:
                v283 = off_1E544AF90;
                goto LABEL_423;
              default:
                if ([v281 count] == 1)
                {
LABEL_417:
                  v280 = (NSPersistentHistoryResult *)[v281 lastObject];
                }
                else
                {
                  v283 = &off_1E544B128;
LABEL_423:
                  v285 = (NSPersistentHistoryResult *)[objc_alloc(*v283) initWithSubresults:v281];
LABEL_424:
                  v280 = v285;
                }
                break;
            }
          }
          else
          {
LABEL_478:
            v280 = 0;
          }
          break;
      }
      *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = v280;
      goto LABEL_426;
    }
  }
  switch(*(void *)(v359 + 88))
  {
    case 1:
    case 3:
      v117 = (NSPersistentHistoryResult *)(id)NSArray_EmptyArray;
      goto LABEL_353;
    case 2:
      uint64_t v259 = *(void *)(v359 + 32);
      if (!v259) {
        goto LABEL_357;
      }
      uint64_t v260 = *(void *)(v259 + 48);
      if ((_BYTE)v260)
      {
LABEL_36:
        -[NSPersistentStoreCoordinator _introspectLastErrorAndThrow](*(void **)(v359 + 48));
        goto LABEL_37;
      }
      *(void *)(v259 + 48) = v260 & 0xFFFFFF00 | 1;
LABEL_357:
      *(unsigned char *)(*(void *)(*(void *)(v359 + 72) + 8) + 24) = 1;
      return;
    case 5:
    case 6:
    case 7:
      goto LABEL_36;
    case 8:
      v249 = [NSPersistentHistoryResult alloc];
      uint64_t v250 = [*(id *)(v359 + 32) resultType];
      v117 = [(NSPersistentHistoryResult *)v249 initWithResultType:v250 andResult:NSArray_EmptyArray];
      goto LABEL_353;
    case 9:
      *(_DWORD *)buf = 0;
      uint64_t v251 = [*(id *)(v359 + 48) _exceptionNoStoreSaveFailureForError:*(void *)(*(void *)(v359 + 48) + 72) recommendedFrame:buf];
      id v252 = objc_alloc(MEMORY[0x1E4F28C58]);
      v452 = @"reason";
      uint64_t v453 = v251;
      uint64_t v253 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v453 forKeys:&v452 count:1];
      *(void *)(*(void *)(*(void *)(v359 + 80) + 8) + 40) = [v252 initWithDomain:*MEMORY[0x1E4F281F8] code:134098 userInfo:v253];
      *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = 0;
      return;
    case 0xALL:
      v258 = [NSSQLiteIndexStatisticsResult alloc];
      v117 = [(NSSQLiteIndexStatisticsResult *)v258 initWithResult:NSArray_EmptyArray];
      goto LABEL_353;
    case 0xBLL:
      v257 = [NSPersistentCloudKitContainerEventResult alloc];
      v117 = -[NSPersistentCloudKitContainerEventResult initWithResult:ofType:](v257, "initWithResult:ofType:", NSArray_EmptyArray, [*(id *)(v359 + 32) resultType]);
LABEL_353:
      *(void *)(*(void *)(*(void *)(v359 + 64) + 8) + 40) = v117;
      return;
    default:
      v254 = *(void **)(v359 + 48);
      if (v254)
      {
        v255 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v256 = [v254 _exceptionNoStoreSaveFailureForError:v254[9] recommendedFrame:0];
        objc_exception_throw((id)[v255 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v256 userInfo:0]);
      }
      goto LABEL_37;
  }
}

- (NSArray)persistentStores
{
  p_miniLocuint64_t k = &self->_miniLock;
  os_unfair_lock_lock_with_options();
  persistentStores = self->_persistentStores;
  uint64_t v5 = persistentStores;
  os_unfair_lock_unlock(p_miniLock);

  return persistentStores;
}

- (void)_setXPCProcessName:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();

    *(void *)(a1 + 88) = [a2 copy];
    os_unfair_lock_unlock(v4);
  }
}

- (void)_setXPCBundleIdentifier:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();

    *(void *)(a1 + 80) = [a2 copy];
    os_unfair_lock_unlock(v4);
  }
}

- (void)_conflictsWithRowCacheForObject:(void *)a3 withContext:(void *)a4 andStore:
{
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a2 objectID];
  unsigned int v9 = [a2 _versionReference];
  if ([a2 isFault]) {
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a2, (uint64_t)a3);
  }
  id v23 = 0;
  uint64_t v10 = (void *)[a4 newValuesForObjectWithID:v8 withContext:a3 error:&v23];
  uint64_t v11 = v10;
  if (v10)
  {
    if (v9 >= [v10 _versionNumber])
    {
      uint64_t v16 = 0;
      goto LABEL_12;
    }
    uint64_t v12 = a1;
    unint64_t v13 = a2;
    unint64_t v14 = (unint64_t)v11;
  }
  else
  {
    if (v23)
    {
      uint64_t v15 = (void *)[v23 domain];
      if (![v15 isEqualToString:*MEMORY[0x1E4F281F8]]
        || [v23 code] != 133000)
      {
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        uint64_t v20 = [v23 code];
        uint64_t v21 = *MEMORY[0x1E4F28A50];
        v26[0] = v23;
        v25[0] = v21;
        v25[1] = @"NSAffectedObjectsErrorKey";
        uint64_t v24 = v8;
        v26[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        id v22 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v19, v20, @"An error occurred while trying to fetch a row for conflict detection.", (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2]);
        -[_NSCoreDataException _setDomain:]((uint64_t)v22, (void *)[v23 domain]);
        objc_exception_throw(v22);
      }
    }
    uint64_t v12 = a1;
    unint64_t v13 = a2;
    unint64_t v14 = 0;
  }
  uint64_t v16 = (void *)-[NSPersistentStoreCoordinator _newConflictRecordForObject:andOriginalRow:withContext:](v12, v13, v14, a3);
  id v17 = v16;
LABEL_12:

  return v16;
}

- (NSManagedObjectID)managedObjectIDForURIRepresentation:(NSURL *)url
{
  if (!url) {
    return 0;
  }
  id v6 = 0;
  uint64_t v4 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](self, (CFURLRef)url, &v6);
  if (!v4 && (!v6 || [v6 code] != 134000)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"The specified URI is not a valid Core Data URI: %@", url), 0 reason userInfo]);
  }
  return &v4->super;
}

- (NSTemporaryObjectID)managedObjectIDForURIRepresentation:(void *)a3 error:
{
  uint64_t v3 = 0;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1 && url)
  {
    id v20 = 0;
    uint64_t v7 = buffer;
    CFIndex v8 = CFURLGetBytes(url, buffer, 511);
    if (v8 < 0)
    {
      CFIndex v9 = CFURLGetBytes(url, 0, 0);
      uint64_t v7 = (UInt8 *)malloc_type_malloc(v9 + 1, 0x100004077774924uLL);
      CFIndex v8 = CFURLGetBytes(url, v7, v9);
    }
    if (v8 <= 0)
    {
      if (v7 != buffer) {
        free(v7);
      }
      return 0;
    }
    else
    {
      v7[v8] = 0;
      if (a3) {
        uint64_t v10 = &v20;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v3 = -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:error:](a1, (char *)v7, v8, v10);
      if (v7 != buffer) {
        free(v7);
      }
      if (a3 && !v3)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        if (v20)
        {
          uint64_t v12 = [v20 domain];
          uint64_t v13 = [v20 code];
          id v23 = @"URI is not a valid Core Data URI";
          CFURLRef v24 = url;
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          uint64_t v15 = v11;
          uint64_t v16 = v12;
          uint64_t v17 = v13;
        }
        else
        {
          uint64_t v18 = *MEMORY[0x1E4F281F8];
          uint64_t v21 = @"URI is not a valid Core Data URI";
          CFURLRef v22 = url;
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          uint64_t v15 = v11;
          uint64_t v16 = v18;
          uint64_t v17 = 134060;
        }
        uint64_t v3 = 0;
        *a3 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v14, v20);
      }
    }
  }
  return v3;
}

- (NSTemporaryObjectID)managedObjectIDFromUTF8String:(uint64_t)a3 length:(void *)a4 error:
{
  v36[256] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a3 < 14 || __s1[a3] || strncmp(__s1, "x-coredata://", 0xDuLL))
  {
    if (a4)
    {
      CFIndex v8 = 0;
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:0];
      return v8;
    }
    return 0;
  }
  uint64_t v10 = 134060;
  CFAllocatorRef v11 = _PFStackAllocatorCreate(v36, 2048);
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  CFStringRef v13 = CFStringCreateWithBytesNoCopy(v11, (const UInt8 *)__s1 + 13, a3 - 13, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (__s1[13] == 47)
  {
    CFStringRef v14 = 0;
    uint64_t v15 = 14;
  }
  else
  {
    uint64_t v16 = strchr(__s1 + 13, 47);
    if (v16)
    {
      uint64_t v17 = v16 - __s1;
      v37.length = v16 - __s1 - 13;
      v37.locatiouint64_t n = 0;
      CFStringRef v14 = CFStringCreateWithSubstring(v11, v13, v37);
      uint64_t v15 = v17 + 1;
      if (v14)
      {
        CFStringRef v18 = (const __CFString *)-[NSPersistentStoreCoordinator _persistentStoreForIdentifier:]((uint64_t)a1, (uint64_t)v14);
        CFStringRef v19 = v14;
        CFStringRef v14 = v18;
        CFRelease(v19);
        if (!v14)
        {
          if (!a4)
          {
            CFIndex v8 = 0;
            goto LABEL_31;
          }
          uint64_t v10 = 134000;
          goto LABEL_30;
        }
      }
    }
    else
    {
      CFStringRef v14 = 0;
      uint64_t v15 = 13;
    }
  }
  if (v15 >= a3)
  {
    CFIndex v8 = 0;
  }
  else
  {
    id v20 = &__s1[v15];
    uint64_t v21 = strchr(&__s1[v15], 47);
    if (!v21) {
      goto LABEL_27;
    }
    unsigned int v34 = (__CFString *)v14;
    uint64_t v22 = v21 - v20;
    v38.locatiouint64_t n = v15 - 13;
    v38.length = v21 - v20;
    CFStringRef v23 = CFStringCreateWithSubstring(v11, v13, v38);
    if (!v23) {
      goto LABEL_27;
    }
    CFStringRef v24 = v23;
    uint64_t v35 = v22;
    uint64_t v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "managedObjectModel"), "entitiesByName"), "objectForKey:", v23);
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      CFRelease(v24);
      uint64_t v27 = v26;
      uint64_t v22 = v35;
    }
    else
    {
      unsigned int v28 = (void *)[a1 persistentStoreCoordinator];
      if (v28) {
        unsigned int v28 = (void *)v28[12];
      }
      uint64_t v27 = -[_PFModelMap ancillaryEntityWithName:](v28, (uint64_t)v24);
      CFRelease(v24);
      if (!v27) {
        goto LABEL_27;
      }
    }
    uint64_t v29 = v22 + 2;
    if (v22 + 2 > a3)
    {
LABEL_27:
      CFIndex v8 = 0;
      uint64_t v10 = 134060;
      goto LABEL_28;
    }
    int v30 = v20[v22 + 1];
    uint64_t v31 = &v20[v29];
    long long v32 = (char *)(__s1 - &v20[v29] + a3);
    if (v30 == 116)
    {
      CFStringRef v33 = CFStringCreateWithBytesNoCopy(v11, (const UInt8 *)&v20[v29], (CFIndex)v32, 0x8000100u, 0, v12);
      CFIndex v8 = [[NSTemporaryObjectID alloc] initWithEntity:v27 andUUIDString:v33];
      if (v33) {
        CFRelease(v33);
      }
      uint64_t v10 = 134060;
      if (v34) {
        -[NSTemporaryObjectID _setPersistentStore:](v8, "_setPersistentStore:");
      }
    }
    else
    {
      CFIndex v8 = 0;
      uint64_t v10 = 134060;
      if (v30 == 112 && v34) {
        CFIndex v8 = (NSTemporaryObjectID *)objc_msgSend((id)-[__CFString objectIDFactoryForEntity:](v34, "objectIDFactoryForEntity:", v27), "managedObjectIDFromUTF8String:length:", v31, v32);
      }
    }
  }
LABEL_28:
  if (a4 && !v8)
  {
LABEL_30:
    CFIndex v8 = 0;
    *a4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], v10, 0, v34);
  }
LABEL_31:
  if (v36[3] && v13) {
    CFRelease(v13);
  }
  return v8;
}

- (void)_persistentStoreForIdentifier:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = -[NSPersistentStoreCoordinator _retainedPersistentStores](a1);
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = (void *)[v3 objectAtIndex:v6];
      if (objc_msgSend((id)objc_msgSend(v7, "identifier"), "isEqual:", a2)) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v7 = 0;
  }

  return v7;
}

+ (void)initialize
{
  self;
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = self;
    [v3 _registerCoreDataStoreClass:objc_opt_class() forStoreType:@"SQLite"];
    [v3 _registerCoreDataStoreClass:objc_opt_class() forStoreType:@"Binary"];
    [v3 _registerCoreDataStoreClass:objc_opt_class() forStoreType:@"InMemory"];
    uint64_t v4 = objc_opt_class();
    [v3 _registerCoreDataStoreClass:v4 forStoreType:@"NSXPCStore"];
  }
}

+ (void)_registerCoreDataStoreClass:(Class)a3 forStoreType:(id)a4
{
  if (!qword_1EB2706F8) {
    qword_1EB2706F8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  }
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  uint64_t v7 = (void *)qword_1EB2706F8;

  [v7 setObject:v6 forKey:a4];
}

- (BOOL)_validateQueryGeneration:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (+[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken") == a3|| +[NSQueryGenerationToken unpinnedQueryGenerationToken] == a3)
  {
    return 1;
  }
  BOOL v7 = 1;
  if (+[NSQueryGenerationToken currentQueryGenerationToken] != a3)
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3052000000;
    CFStringRef v23 = __Block_byref_object_copy__18;
    CFStringRef v24 = __Block_byref_object_dispose__18;
    uint64_t v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__NSPersistentStoreCoordinator_QueryGenerations___validateQueryGeneration_error___block_invoke;
    v19[3] = &unk_1E544CF10;
    v19[4] = a3;
    v19[5] = &v20;
    v19[6] = &v26;
    -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((void (*)(void))self, (uint64_t)v19);
    if (!*((unsigned char *)v27 + 24))
    {
      CFIndex v8 = (void *)v21[5];
      if (v8)
      {
        if (a4) {
          *a4 = v8;
        }
      }
      else
      {
        uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
        uint64_t v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
          __int16 v32 = 1024;
          int v33 = 6340;
          _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      id v17 = (id)v21[5];
      BOOL v7 = *((unsigned char *)v27 + 24) != 0;
    }
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  return v7;
}

void __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self;
  byte_1EB2706F1 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.PowerAssertionsDebug");
  os_signpost_id_t v2 = getprogname();
  if (strcmp("chronod", v2) && strcmp("SpringBoard", v2))
  {
    Class Class = objc_getClass("UIApplication");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = Class;
    if (Class)
    {
      if (objc_opt_respondsToSelector()) {
        id v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), sel_sharedApplication);
      }
      else {
        id v4 = 0;
      }
      int v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      *(_OWORD *)str = 0u;
      long long v13 = 0u;
      __strlcpy_chk();
      qword_1EB270718 = (uint64_t)sel_registerName(str);
      char v11 = objc_opt_respondsToSelector();
      if (byte_1EB2706F1) {
        _NSCoreDataLog(9, @"Registration for _beginPowerAssertionNamed completed with class %p on app %p and result %@", v5, v6, v7, v8, v9, v10, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
      }
      if (v11) {
        qword_1EB270710 = (uint64_t)v4;
      }
    }
    if (!qword_1EB270710 && !strcmp("Podcasts", v2)) {
      _MergedGlobals_78 = 1;
    }
  }
}

- (void)_postStoresChangedNotificationsForStores:(uint64_t)a3 changeKey:(void *)a4 options:
{
  if (a1)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    if (!a2) {
      a2 = [MEMORY[0x1E4F1C978] array];
    }
    uint64_t v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", a2, a3, 0);
    if ((!a4
       || (char v11 = (void *)[a4 objectForKey:@"_NSNotifyObserversOfStoreChange"]) == 0
       || ([v11 BOOLValue] & 1) != 0)
      && (*(_WORD *)(a1 + 24) & 0x400) == 0)
    {
      [v8 postNotificationName:@"_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification" object:a1 userInfo:v10];
      [v8 postNotificationName:@"NSPersistentStoreCoordinatorStoresDidChangeNotification" object:a1 userInfo:v10];
    }
  }
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke(uint64_t a1)
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"]
    || [*(id *)(a1 + 32) objectForKey:@"NSPersistentStoreRemoveUbiquitousMetadataOption"])
  {
    uint64_t v143 = [[PFUbiquitySetupAssistant alloc] initWithPersistentStoreCoordinator:*(void *)(a1 + 40) andStoreOptions:*(void *)(a1 + 32) forPersistentStoreOfType:*(void *)(a1 + 48) atURL:*(void *)(a1 + 56)];
    if ((-[PFUbiquitySetupAssistant validateOptionsWithError:]((uint64_t)v143, (uint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) & 1) == 0)
    {
      uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v2)
      {
        uint64_t v3 = *(void **)(a1 + 96);
        if (v3) {
          void *v3 = v2;
        }
      }
      else
      {
        uint64_t v4 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
        char v11 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
          __int16 v177 = 1024;
          int v178 = 1518;
          _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      id v12 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);

      return;
    }
  }
  else
  {
    uint64_t v143 = 0;
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  uint64_t v13 = [&unk_1ED7E97D8 countByEnumeratingWithState:&v147 objects:v165 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v148;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v148 != v14) {
          objc_enumerationMutation(&unk_1ED7E97D8);
        }
        uint64_t v16 = *(void *)(*((void *)&v147 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) valueForKey:v16])
        {
          __int16 v43 = NSString;
          uint64_t v44 = NSStringFromSelector(sel_setOption_forMirroringKey_);
          uint64_t v45 = (objc_class *)objc_opt_class();
          uint64_t v46 = [v43 stringWithFormat:@"%@ is only valid as a mirroring option. It should be set using '%@' on '%@'", v16, v44, NSStringFromClass(v45)];
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v163 = *MEMORY[0x1E4F28588];
          uint64_t v164 = v46;
          uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v47 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v48];
          return;
        }
      }
      uint64_t v13 = [&unk_1ED7E97D8 countByEnumeratingWithState:&v147 objects:v165 count:16];
    }
    while (v13);
  }
  if (![*(id *)(a1 + 32) objectForKey:@"NSPersistentHistoryTrackingKey"])
  {
LABEL_63:
    v175[0] = 0;
    uint64_t v64 = *(void **)(a1 + 48);
    uint64_t actualStoreFileURL = *(void *)(a1 + 56);
    v174[0] = 0;
    uint64_t v66 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Adding persistent store", v174);
    if (v64) {
      goto LABEL_68;
    }
    if (*(void *)(a1 + 40))
    {
      uint64_t v64 = *(void **)(a1 + 48);
      uint64_t v67 = *(void *)(a1 + 32);
      *(void *)buf = 0;
      v68 = (void *)[(id)objc_opt_class() metadataForPersistentStoreOfType:v64 URL:actualStoreFileURL options:v67 error:buf];
      if (v68)
      {
        uint64_t v64 = (void *)[v68 objectForKey:@"NSStoreType"];
      }
      else
      {
        uint64_t v89 = (void *)[*(id *)buf domain];
        if (![v89 isEqualToString:*MEMORY[0x1E4F281F8]]
          || [*(id *)buf code] != 4 && objc_msgSend(*(id *)buf, "code") != 260)
        {
          id v90 = *(id *)buf;
          v175[0] = *(id *)buf;
LABEL_103:
          if (!v90) {
            id v90 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:&unk_1ED7E2050];
          }
          long long v79 = 0;
          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v90;
          goto LABEL_180;
        }
      }
      if (v64)
      {
LABEL_68:
        v69 = (objc_class *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)v64);
        if (!v69) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unsupported store type." userInfo:0]);
        }
        char v70 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"NSIgnorePersistentStoreVersioningOption"), "BOOLValue");
        if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
          char v71 = v70;
        }
        else {
          char v71 = 1;
        }
        if (v71) {
          int v72 = 0;
        }
        else {
          int v72 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"NSMigratePersistentStoresAutomaticallyOption"), "BOOLValue");
        }
        if (v143 && v143->_ubiquityEnabled) {
          uint64_t actualStoreFileURL = (uint64_t)v143->_actualStoreFileURL;
        }
        if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
          && objc_msgSend(@"Default", "isEqual:")
          && ![*(id *)(a1 + 64) entitiesForConfiguration:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)])
        {
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = 0;
        }
        *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = [objc_allocWithZone(v69) initWithPersistentStoreCoordinator:*(void *)(a1 + 40) configurationName:*(void *)(*(void *)(*(void *)(a1 + 80)+ 8)+ 40) URL:actualStoreFileURL options:*(void *)(a1 + 32)];
        uint64_t v73 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        if (v73)
        {
          unsigned __int8 v74 = atomic_load((unsigned __int8 *)(v73 + 60));
          uint64_t v75 = v74 & 1;
          v76 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        }
        else
        {
          v76 = 0;
          uint64_t v75 = 0;
        }
        char v77 = [v76 loadMetadata:v175];
        uint64_t v78 = *(void *)(*(void *)(a1 + 88) + 8);
        long long v79 = *(void **)(v78 + 40);
        if ((v77 & 1) == 0)
        {
          if (v79)
          {
            *(void *)(v78 + 40) = 0;
          }
          else if (!v175[0])
          {
            uint64_t v87 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v88 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to initialize store.", @"reason", 0);
            v175[0] = (id)[v87 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v88];
          }
          if (*(void *)(a1 + 96)) {
            *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v175[0];
          }
          goto LABEL_180;
        }
        [*(id *)(v78 + 40) _didLoadMetadata];
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) _setMetadataDirty:v75];
        long long v79 = 0;
        long long v80 = (uint64_t *)(a1 + 88);
        uint64_t v81 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        if (v81)
        {
          id v82 = (id)objc_msgSend((id)objc_msgSend(v81, "metadata"), "copy");
          v83 = v82;
          if (!v82 && *(void *)(a1 + 96))
          {
            uint64_t v94 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v95 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Can't read store metadata.", @"reason", 0);
            *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v94 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v95];
            uint64_t v93 = *(void *)(a1 + 88);
LABEL_111:
            uint64_t v84 = *(void *)(v93 + 8);
            if (*(void *)(v84 + 40)) {
              long long v79 = *(void **)(v84 + 40);
            }
            goto LABEL_153;
          }
          if ((objc_msgSend(v64, "isEqual:", objc_msgSend(v82, "objectForKey:", @"NSStoreType")) & 1) == 0)
          {
            if (*(void *)(a1 + 96))
            {
              uint64_t v91 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v92 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"The store type in the metadata does not match the specified store type.", @"reason", v83, @"metadata", 0);
              *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v91 errorWithDomain:*MEMORY[0x1E4F281F8] code:134010 userInfo:v92];
            }
            uint64_t v93 = *v80;
            goto LABEL_111;
          }
          if ((v71 & 1) == 0)
          {
            v96 = (void *)[v83 objectForKey:@"NSStoreModelVersionHashesVersion"];
            if ([v96 intValue] >= 4)
            {
              if (*(void *)(a1 + 96))
              {
                uint64_t v116 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v117 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"The version hash version (and associated hashes) are incompatible with the current Core Data version.", @"reason", v83, @"metadata", 0);
                *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v116 errorWithDomain:*MEMORY[0x1E4F281F8] code:134100 userInfo:v117];
              }
              uint64_t v84 = *(void *)(*v80 + 8);
              uint64_t v118 = *(void **)(v84 + 40);
              if (!v118) {
                goto LABEL_153;
              }
              *(void *)(v84 + 40) = 0;
              uint64_t v119 = *v80;
              goto LABEL_152;
            }
            if (v96 && [v83 objectForKey:@"NSStoreModelVersionHashes"])
            {
              char v97 = [*(id *)(a1 + 64) isConfiguration:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) compatibleWithStoreMetadata:v83];
              char v98 = *(unsigned char *)(a1 + 104) ? 0 : v97;
              if ((v98 & 1) == 0
                && (*(unsigned char *)(a1 + 104)
                 || (-[NSPersistentStoreCoordinator _checkForSkewedEntityHashes:metadata:](*(void *)(a1 + 40), v83) & 1) == 0
                 && (!+[_PFPersistentHistoryModel _hasTombstonesInUserInfo:]((uint64_t)_PFPersistentHistoryModel, *(void **)(a1 + 64))|| (-[NSPersistentStoreCoordinator _checkForTombstoneSkew:metadata:configuration:](*(void *)(a1 + 40), *(void **)(a1 + 64), (uint64_t)v83, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) & 1) == 0)))
              {
                if (+[NSMappingModel migrationDebugLevel])
                {
                  if (v72) {
                    id v99 = @" ";
                  }
                  else {
                    id v99 = @" NOT ";
                  }
                  [*(id *)(a1 + 64) entityVersionHashesByName];
                  _NSCoreDataLog(4, @"Incompatible version schema for persistent store '%@'.  store metadata = %@ and current model versions = %@", v100, v101, v102, v103, v104, v105, actualStoreFileURL);
                  _NSCoreDataLog(4, @"(migration)\t will%@attempt automatic schema migration", v106, v107, v108, v109, v110, v111, (uint64_t)v99);
                }
                uint64_t v112 = *(void *)(*v80 + 8);
                uint64_t v113 = *(void **)(v112 + 40);
                if (v113)
                {
                  *(void *)(v112 + 40) = 0;
                  long long v79 = v113;
                }
                if (v72)
                {
                  uint64_t v114 = (void *)[*(id *)(a1 + 32) mutableCopy];
                  [v114 setValue:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey"];
                  uint64_t v115 = [[NSPersistentStoreCoordinatorMigrationContext alloc] initWithStoreURL:actualStoreFileURL type:v64 options:v114];

                  [(NSPersistentStoreCoordinatorMigrationContext *)v115 setConfigurationName:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
                  [(NSPersistentStoreCoordinatorMigrationContext *)v115 setDestinationConfigurationForCloudKitValidation:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
                  [(NSPersistentStoreCoordinatorMigrationContext *)v115 setMetadata:v83];
                  [(NSPersistentStoreCoordinatorMigrationContext *)v115 setForceMigration:*(unsigned __int8 *)(a1 + 104)];
                  [(NSPersistentStoreCoordinatorMigrationContext *)v115 setUbiquitySetupAssistant:v143];
                  if (-[NSPersistentStoreCoordinator migrateStoreWithContext:error:](*(void *)(a1 + 40), v115, (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)))*(void *)(*(void *)(*v80 + 8) + 40) = [(NSPersistentStoreCoordinatorMigrationContext *)v115 migratedStore]; {

                  }
                  goto LABEL_180;
                }
                if (*(void *)(a1 + 96))
                {
                  id v124 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v125 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"The model used to open the store is incompatible with the one used to create the store", @"reason", v83, @"metadata", 0);
                  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v124 errorWithDomain:*MEMORY[0x1E4F281F8] code:134100 userInfo:v125];
                }
                uint64_t v84 = *(void *)(*v80 + 8);
                goto LABEL_153;
              }
            }
          }
          uint64_t v84 = *(void *)(*v80 + 8);
          uint64_t v85 = *(void **)(v84 + 40);
          if (!v85)
          {
            if (*(void *)(a1 + 96))
            {
              *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v175[0];
              uint64_t v84 = *(void *)(*(void *)(a1 + 88) + 8);
            }
            goto LABEL_153;
          }
          if ([v85 load:v175])
          {
            -[NSPersistentStoreCoordinator _addPersistentStore:identifier:](*(void *)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40), [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) identifier]);

            -[NSPersistentStore _updateMetadata](*(unsigned char **)(*(void *)(*v80 + 8) + 40));
            [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) _setupObserver:*(void *)(a1 + 40)];
            [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) didAddToPersistentStoreCoordinator:*(void *)(a1 + 40)];
            v86 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", *(void *)(*(void *)(*v80 + 8) + 40), 0);
            -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:](*(void *)(a1 + 40), (uint64_t)v86, @"added", *(void **)(a1 + 32));
          }
          else
          {
            [*(id *)(*(void *)(*v80 + 8) + 40) _unload:0];
            uint64_t v120 = *(void *)(*v80 + 8);
            v121 = *(void **)(v120 + 40);
            if (v121)
            {
              *(void *)(v120 + 40) = 0;
              long long v79 = v121;
            }
            if (*(void *)(a1 + 96)) {
              *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v175[0];
            }
          }
        }
        if (v143)
        {
          v122 = (uint64_t *)(a1 + 88);
          uint64_t v123 = *(void *)(*(void *)(a1 + 88) + 8);
          if (v143->_ubiquityEnabled && *(void *)(v123 + 40))
          {
            if (-[PFUbiquitySetupAssistant performCoordinatorPostStoreSetup:error:]((uint64_t)v143, *(void **)(v123 + 40), v175))
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Post store setup succeded. %@", "-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]_block_invoke", 1889, *(void *)(*(void *)(*v122 + 8) + 40));
              }
              goto LABEL_180;
            }
            if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  An error occurred while setting up the ubiquity integration: %@\nuserInfo: %@", "-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]_block_invoke", 1891, v175[0], [v175[0] userInfo]);
            }
            *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v175[0];
            -[NSPersistentStoreCoordinator _removePersistentStore:](*(void *)(a1 + 40), *(unint64_t **)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
            uint64_t v84 = *(void *)(*v122 + 8);
            uint64_t v118 = *(void **)(v84 + 40);
            if (!v118)
            {
LABEL_153:
              *(void *)(v84 + 40) = 0;
LABEL_180:
              +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v174[0], v66);
              id v127 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);

              if (v79)
              {
                [v79 willRemoveFromPersistentStoreCoordinator:0];
              }
              uint64_t v128 = a1;
              uint64_t v129 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
              if (v129)
              {
                id v130 = v129;
                uint64_t v131 = a1;
                id v132 = *(void **)(*(void *)(a1 + 40) + 72);
                if (v132 != *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
                {

                  uint64_t v131 = a1;
                  *(void *)(*(void *)(a1 + 40) + 72) = 0;
                }
                if ([*(id *)(v131 + 56) isFileURL])
                {
                  uint64_t v133 = (void *)MEMORY[0x1E4F1CA60];
                  uint64_t v134 = [*(id *)(a1 + 56) path];
                  v135 = objc_msgSend(v133, "dictionaryWithObjectsAndKeys:", v134, *MEMORY[0x1E4F28328], 0);
                }
                else
                {
                  v135 = 0;
                }
                uint64_t v136 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "userInfo"), "objectForKey:", @"NSSQLiteErrorDomain");
                if (v136)
                {
                  if (!v135) {
                    v135 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  }
                  [v135 setObject:v136 forKey:@"NSSQLiteErrorDomain"];
                }
                uint64_t v137 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) userInfo];
                uint64_t v138 = *MEMORY[0x1E4F28798];
                uint64_t v139 = [v137 objectForKey:*MEMORY[0x1E4F28798]];
                if (v139)
                {
                  if (!v135) {
                    v135 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  }
                  [v135 setObject:v139 forKey:v138];
                }
                uint64_t v140 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "domain"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "code"), v135);
                uint64_t v128 = a1;
                *(void *)(*(void *)(a1 + 40) + 72) = v140;
              }
              if (*(void *)(*(void *)(*(void *)(v128 + 88) + 8) + 40))
              {

                *(void *)(*(void *)(a1 + 40) + 72) = 0;
              }
              uint64_t v141 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
              if (v141 && ([v141 supportsConcurrentRequestHandling] & 1) == 0) {
                *(_WORD *)(*(void *)(a1 + 40) + 24) &= ~2u;
              }
              return;
            }
            *(void *)(v84 + 40) = 0;
            uint64_t v119 = *v122;
LABEL_152:
            uint64_t v84 = *(void *)(v119 + 8);
            long long v79 = v118;
            goto LABEL_153;
          }
        }
        else
        {
          v122 = (uint64_t *)(a1 + 88);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"NSUbiquityOptionsRemovedDuringAutomaticMigrationKey"), "BOOLValue") & 1) == 0&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"NSPersistentStoreRemoveUbiquitousMetadataOption"), "BOOLValue")&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"NSReadOnlyPersistentStoreOption"), "BOOLValue") & 1) == 0)
        {
          +[PFUbiquitySetupAssistant removeUbiquityMetadataFromStore:]((uint64_t)PFUbiquitySetupAssistant, *(void **)(*(void *)(*v122 + 8) + 40));
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*v122 + 8) + 40), "metadata"), "objectForKey:", @"com.apple.coredata.ubiquity.ubiquitized"))
        {
          uint64_t v126 = (void *)[*(id *)(a1 + 32) objectForKey:@"NSReadOnlyPersistentStoreOption"];
          if ((![v126 isNSNumber] || (objc_msgSend(v126, "BOOLValue") & 1) == 0)
            && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"NSUbiquityImporterPrivateStoreKey"), "BOOLValue") & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"NSUbiquityOptionsRemovedDuringAutomaticMigrationKey"), "BOOLValue") & 1) == 0)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error: A persistent store which has been previously added to a coordinator using the iCloud integration options must always be added to the coordinator with the options present in the options dictionary. If you wish to use the store without iCloud, migrate the data from the iCloud store file to a new store file in local storage. %@\nThis will be a fatal error in a future release.", "-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]_block_invoke", 1927, [*(id *)(*(void *)(*v122 + 8) + 40) URL]);
            }
            if (HIBYTE(z9dsptsiQ80etb9782fsrs98bfdle88)) {
              [*(id *)(*(void *)(*v122 + 8) + 40) setReadOnly:1];
            }
          }
        }
        goto LABEL_180;
      }
    }
    id v90 = v175[0];
    goto LABEL_103;
  }
  uint64_t v17 = a1;
  if (!*(void *)(a1 + 40)) {
    goto LABEL_61;
  }
  int v18 = *(void **)(a1 + 64);
  uint64_t v142 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v19 = (void *)[*(id *)(a1 + 32) objectForKey:@"NSPersistentHistoryTrackingKey"];
  if (![v19 isNSDictionary])
  {
    if (([v19 isNSNumber] & 1) == 0)
    {
      uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v170 = *MEMORY[0x1E4F28588];
      v50 = NSString;
      v51 = (objc_class *)objc_opt_class();
      char v52 = NSStringFromClass(v51);
      uint64_t v53 = (objc_class *)objc_opt_class();
      uint64_t v171 = [v50 stringWithFormat:@"%@ expects an instance of %@ as its value but found: %@", @"NSPersistentHistoryTrackingKey", v52, NSStringFromClass(v53)];
      uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
      uint64_t v42 = [v49 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v54];
      if (v42) {
        goto LABEL_54;
      }
      goto LABEL_59;
    }
    goto LABEL_63;
  }
  id v146 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  obuint64_t j = (id)[v18 entities];
  uint64_t v20 = [obj countByEnumeratingWithState:&v159 objects:buf count:16];
  if (!v20) {
    goto LABEL_45;
  }
  uint64_t v21 = *(void *)v160;
  do
  {
    for (uint64_t j = 0; j != v20; ++j)
    {
      if (*(void *)v160 != v21) {
        objc_enumerationMutation(obj);
      }
      CFStringRef v23 = *(void **)(*((void *)&v159 + 1) + 8 * j);
      CFStringRef v24 = objc_msgSend((id)objc_msgSend(v23, "userInfo"), "objectForKey:", @"NSPersistentHistoryTombstoneAttributes");
      uint64_t v25 = v24;
      if (!v24) {
        continue;
      }
      if (![v24 isNSString])
      {
        int v30 = NSString;
        uint64_t v31 = [v23 name];
        __int16 v32 = (objc_class *)objc_opt_class();
        int v33 = NSStringFromClass(v32);
        uint64_t v34 = (objc_class *)objc_opt_class();
        uint64_t v35 = [v30 stringWithFormat:@"%@ - Wrong type: %@ but should be %@", v31, v33, NSStringFromClass(v34)];
LABEL_42:
        [v146 addObject:v35];
        continue;
      }
      if (![v25 length])
      {
        goto LABEL_42;
      }
      uint64_t v26 = (void *)[v25 componentsSeparatedByString:@","];
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v155 objects:v175 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v156;
        while (2)
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v156 != v28) {
              objc_enumerationMutation(v26);
            }
            if (!objc_msgSend((id)objc_msgSend(v23, "attributesByName"), "objectForKey:", *(void *)(*((void *)&v155 + 1) + 8 * k)))
            {
              uint64_t v35 = [NSString stringWithFormat:@"%@ - One or more unknown attributes: %@", objc_msgSend(v23, "name"), v25];
              goto LABEL_42;
            }
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v155 objects:v175 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v20 = [obj countByEnumeratingWithState:&v159 objects:buf count:16];
  }
  while (v20);
LABEL_45:
  if (![v146 count])
  {

    goto LABEL_63;
  }
  [v146 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"The following entities did not have a valid configuration for %@. It should be a string of comma separated attribute names to tombstone on delete.", @"NSPersistentHistoryTombstoneAttributes"];
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  uint64_t v37 = [v146 countByEnumeratingWithState:&v151 objects:v174 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v152;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v152 != v38) {
          objc_enumerationMutation(v146);
        }
        [v36 appendFormat:@"\n%@", *(void *)(*((void *)&v151 + 1) + 8 * m)];
      }
      uint64_t v37 = [v146 countByEnumeratingWithState:&v151 objects:v174 count:16];
    }
    while (v37);
  }
  os_signpost_id_t v40 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v172 = *MEMORY[0x1E4F28588];
  uint64_t v173 = v36;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
  uint64_t v42 = [v40 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v41];

  if (v42)
  {
LABEL_54:
    *(void *)(v142 + 40) = v42;
    uint64_t v17 = a1;
    goto LABEL_61;
  }
LABEL_59:
  uint64_t v55 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog(17, v55, v56, v57, v58, v59, v60, v61, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
  uint64_t v62 = __pflogFaultLog;
  uint64_t v17 = a1;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)v166 = 136315394;
    v167 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
    __int16 v168 = 1024;
    int v169 = 6580;
    _os_log_fault_impl(&dword_18AB82000, v62, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v166, 0x12u);
  }
LABEL_61:
  id v63 = *(id *)(*(void *)(*(void *)(v17 + 72) + 8) + 40);
}

+ (uint64_t)_storeClassForStoreType:(uint64_t)a1
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = (void *)[(id)qword_1EB2706F8 objectForKey:a2];
  if (!v4) {
    uint64_t v4 = (void *)[(id)qword_1EB270700 objectForKey:a2];
  }
  objc_sync_exit(v3);

  return [v4 pointerValue];
}

+ (uint64_t)_beginPowerAssertionNamed:(void *)a3 withAssert:
{
  uint64_t v5 = self;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000;
  uint64_t v27 = __Block_byref_object_copy__18;
  uint64_t v28 = __Block_byref_object_dispose__18;
  uint64_t v29 = 0;
  MEMORY[0x18C1285F0](v5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke;
  block[3] = &unk_1E544B4D0;
  block[4] = &v24;
  if (qword_1EB270708 != -1) {
    dispatch_once(&qword_1EB270708, block);
  }
  id v6 = (id)qword_1EB270710;
  if (!qword_1EB270710 && _MergedGlobals_78)
  {
    if (!v25[5])
    {
LABEL_18:
      id v6 = 0;
      goto LABEL_19;
    }
    if (objc_opt_respondsToSelector()) {
      id v6 = objc_msgSend((id)v25[5], sel_sharedApplication);
    }
    else {
      id v6 = 0;
    }
    char v13 = objc_opt_respondsToSelector();
    if (byte_1EB2706F1) {
      _NSCoreDataLog(9, @"Registration for _beginPowerAssertionNamed completed with class %p on app %p and result %@", v7, v8, v9, v10, v11, v12, v25[5]);
    }
    if ((v13 & 1) == 0)
    {
      id v6 = (id)qword_1EB270710;
      if (!qword_1EB270710) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }
    qword_1EB270710 = (uint64_t)v6;
  }
  if (!v6) {
    goto LABEL_19;
  }
LABEL_14:
  id v14 = objc_msgSend(v6, (SEL)qword_1EB270718, a2, &__block_literal_global_808);
  id v6 = v14;
  if (!v14)
  {
    _NSCoreDataLog(1, @"Failed to acquire background task assertion for task '%@'.", v15, v16, v17, v18, v19, v20, a2);
    goto LABEL_18;
  }
  if (byte_1EB2706F1) {
    _NSCoreDataLog(9, @"Successfully acquired background task assertion %d for task '%@'.", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
  }
LABEL_19:
  *a3 = v6;
  uint64_t v21 = qword_1EB270710;
  _Block_object_dispose(&v24, 8);
  return v21;
}

+ (void)_endPowerAssertionWithAssert:(void *)a3 andApp:
{
  uint64_t v5 = self;
  MEMORY[0x18C128600](v5);
  if (a2 && a3)
  {
    objc_msgSend(a3, sel_endBackgroundTask_, a2);
    if (byte_1EB2706F1) {
      _NSCoreDataLog(9, @"Ended background task assertion %d.", v6, v7, v8, v9, v10, v11, a2);
    }
  }
}

- (void)_addPersistentStore:(uint64_t)a3 identifier:
{
  if (a1)
  {
    uint64_t v6 = [a2 URL];
    if (v6 && [(id)a1 persistentStoreForURL:v6]
      || -[NSPersistentStoreCoordinator _persistentStoreForIdentifier:](a1, a3))
    {
      id v9 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134081, @"Can't add the same store twice", 0);
      objc_exception_throw(v9);
    }
    __dmb(0xBu);
    while (1)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v7 = *(void **)(a1 + 48);
      uint64_t v8 = (const void *)[v7 arrayByAddingObject:a2];
      CFRetain(v8);
      if (*(void **)(a1 + 48) == v7) {
        break;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      if (v8) {
        CFRelease(v8);
      }
    }
    *(void *)(a1 + 48) = v8;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    if (v7)
    {
      CFRelease(v7);
    }
  }
}

- (NSPersistentStore)persistentStoreForURL:(NSURL *)URL
{
  if (!URL) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid store URL: nil" userInfo:0]);
  }
  uint64_t v4 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  uint64_t v5 = [v4 count];
  if (v5 < 1)
  {
LABEL_9:
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = (NSPersistentStore *)[v4 objectAtIndex:v7];
      if ([(NSURL *)[(NSPersistentStore *)v8 URL] isEqual:URL]) {
        break;
      }
      id v9 = [(NSDictionary *)[(NSPersistentStore *)v8 metadata] objectForKey:@"PFUbiquitySetupOriginalStoreURLAbsoluteStringKey"];
      if (v9)
      {
        id v10 = v9;
        if ([v9 isNSString])
        {
          uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];
          char v12 = [v11 isEqual:URL];

          if (v12) {
            break;
          }
        }
      }
      if (v6 == ++v7) {
        goto LABEL_9;
      }
    }
  }

  return v8;
}

+ (NSPersistentStoreCoordinator)allocWithZone:(_NSZone *)a3
{
  return (NSPersistentStoreCoordinator *)_PFAllocateObject((Class)a1, 0);
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = -[NSPersistentStoreCoordinator _retainedChangeTokenFromStores:](*(_NSPersistentHistoryToken **)(a1 + 32), *(void **)(a1 + 40));
  [*(id *)(a1 + 48) _setChangeTrackingTokenFromToken:v2 error:0];
}

- (void)_postStoreRemoteChangeNotificationsForStore:(uint64_t)a3 andState:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = (id)[a2 identifier];
    id v8 = (id)[a2 URL];
    id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v21[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v20 = @"NSStoreUUID";
    uint64_t v11 = objc_msgSend(v9, "initWithObjects:forKeys:", v10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v20, 1));
    if (!v7)
    {
      char v13 = 0;
LABEL_12:

      return;
    }
    if (a3)
    {
      char v12 = [_NSPersistentHistoryToken alloc];
      char v13 = -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:](v12, "initWithTransactionNumber:andStoreID:", [NSNumber numberWithUnsignedLongLong:a3], v7);
      [v11 setObject:v13 forKey:@"historyToken"];
      if (!v8) {
        goto LABEL_9;
      }
    }
    else
    {
      char v13 = 0;
      if (!v8)
      {
LABEL_9:
        if (+[NSSQLCore debugDefault] >= 1) {
          _NSCoreDataLog(9, @"Remote Change Notification - posting for store  %@ with userInfo %@", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
        }
        [v6 postNotificationName:@"NSPersistentStoreRemoteChangeNotification" object:a1 userInfo:v11];
        goto LABEL_12;
      }
    }
    [v11 setObject:v8 forKey:@"storeURL"];
    goto LABEL_9;
  }
}

- (_NSPersistentHistoryToken)_retainedChangeTokenFromStores:(_NSPersistentHistoryToken *)result
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id result = (_NSPersistentHistoryToken *)[a2 count];
    if (result)
    {
      uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v4 = [a2 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v25 != v6) {
              objc_enumerationMutation(a2);
            }
            id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v9 = [v8 currentChangeToken];
            if (v9) {
              objc_msgSend(v3, "setObject:forKey:", v9, objc_msgSend(v8, "identifier"));
            }
          }
          uint64_t v5 = [a2 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v5);
      }
      id v23 = 0;
      if ([v3 count] == 1)
      {
        [v3 getObjects:&v23 andKeys:0 count:1];
        id v10 = v23;
        return (_NSPersistentHistoryToken *)v23;
      }
      else
      {
        id result = (_NSPersistentHistoryToken *)[v3 count];
        if (result)
        {
          uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v12 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v3);
                }
                uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * j);
                uint64_t v17 = (void *)[v3 objectForKey:v16];
                memset(v18, 0, sizeof(v18));
                if (objc_msgSend((id)objc_msgSend(v17, "storeTokens", 0), "countByEnumeratingWithState:objects:count:", v18, v28, 16))
                {
                  objc_msgSend(v11, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v17, "storeTokens"), "objectForKey:", **((void **)&v18[0] + 1)), v16);
                }
              }
              uint64_t v13 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
            }
            while (v13);
          }
          return [[_NSPersistentHistoryToken alloc] initWithDictionary:v11];
        }
      }
    }
  }
  return result;
}

- (void)addPersistentStoreWithDescription:(NSPersistentStoreDescription *)storeDescription completionHandler:(void *)block
{
  id v7 = (void *)[(NSPersistentStoreDescription *)storeDescription copy];
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    int v8 = ![(NSPersistentStoreDescription *)storeDescription shouldInvokeCompletionHandlerConcurrently];
  }
  else {
    int v8 = 0;
  }
  if ([v7 shouldAddStoreAsynchronously])
  {
    global_queue = dispatch_get_global_queue(0, 0);
    blocka[0] = MEMORY[0x1E4F143A8];
    blocka[1] = 3221225472;
    blocka[2] = __84__NSPersistentStoreCoordinator_addPersistentStoreWithDescription_completionHandler___block_invoke;
    blocka[3] = &unk_1E544CBD0;
    blocka[4] = self;
    blocka[5] = storeDescription;
    char v11 = v8;
    blocka[6] = v7;
    blocka[7] = block;
    dispatch_async(global_queue, blocka);
  }
  else
  {
    -[NSPersistentStoreCoordinator _doAddPersistentStoreWithDescription:privateCopy:completeOnMainThread:withHandler:](self, storeDescription, v7, v8, (uint64_t)block);
  }
}

- (id)_doAddPersistentStoreWithDescription:(void *)a3 privateCopy:(int)a4 completeOnMainThread:(uint64_t)a5 withHandler:
{
  v56[1] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v53 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "mirroringOptions"), "count"))
  {
    char v11 = (NSCloudKitMirroringDelegate *)(id)[a3 mirroringDelegate];
  }
  else
  {
    if (![a3 cloudKitContainerOptions])
    {
      char v11 = 0;
      char v51 = 1;
LABEL_13:
      uint64_t v19 = objc_msgSend(v9, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a3, "type"), objc_msgSend(a3, "configuration"), objc_msgSend(a3, "URL"), objc_msgSend(a3, "options"), &v53);
      if (v19) {
        goto LABEL_14;
      }
      id v27 = v53;
      _NSCoreDataLog(1, @"%@: Attempting recovery from error encountered during addPersistentStore: %p %@", v13, v14, v15, v16, v17, v18, (uint64_t)v9);
      uint64_t v28 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "URL"), "path"), "stringByDeletingLastPathComponent");
      int v30 = (void *)[v27 domain];
      if ([v30 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        if ([v27 code] != 512 && objc_msgSend(v27, "code") != 4 && objc_msgSend(v27, "code") != 514) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v31 = (void *)[v27 domain];
        if (![v31 isEqualToString:*MEMORY[0x1E4F28798]]
          || [v27 code] != 2)
        {
          goto LABEL_17;
        }
      }
      if (([a3 isReadOnly] & 1) == 0)
      {
        if ([v28 fileExistsAtPath:v29])
        {
          _NSCoreDataLog(1, @"During recovery, parent directory path reported to exist", v32, v33, v34, v35, v36, v37, v50);
        }
        else
        {
          _NSCoreDataLog(1, @"During recovery, parent directory path reported as missing", v32, v33, v34, v35, v36, v37, v50);
          uint64_t v54 = 0;
          if (([v28 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v54] & 1) == 0)
          {
            [v27 userInfo];
            _NSCoreDataLog(1, @"During recovery, failed to create directory structure '%@' with error %@ and userInfo %@", v38, v39, v40, v41, v42, v43, v29);
          }
        }
        id v53 = 0;
        uint64_t v19 = objc_msgSend(v9, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a3, "type"), objc_msgSend(a3, "configuration"), objc_msgSend(a3, "URL"), objc_msgSend(a3, "options"), &v53);
        if (v19)
        {
          _NSCoreDataLog(1, @"Recovery attempt while adding %@ was successful!", v44, v45, v46, v47, v48, v49, (uint64_t)a3);
LABEL_14:
          if ((v51 & 1) == 0) {
            [(NSCloudKitMirroringDelegate *)v11 persistentStoreCoordinator:v9 didSuccessfullyAddPersistentStore:v19 withDescription:a3];
          }
          goto LABEL_17;
        }
        _NSCoreDataLog(1, @"Recovery attempt while adding %@ FAILED with error %@", v44, v45, v46, v47, v48, v49, (uint64_t)a3);
      }
      goto LABEL_17;
    }
    [a3 cloudKitContainerOptions];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = -[NSCloudKitMirroringDelegate initWithOptions:]([NSCloudKitMirroringDelegate alloc], "initWithOptions:", [a3 cloudKitContainerOptions]);
    }
    else {
      uint64_t v12 = -[NSCloudKitMirroringDelegate initWithCloudKitContainerOptions:]([NSCloudKitMirroringDelegate alloc], "initWithCloudKitContainerOptions:", [a3 cloudKitContainerOptions]);
    }
    char v11 = v12;
    [a3 setMirroringDelegate:v12];
  }
  if (!v11)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Use of the mirroring options requires that a mirroring delegate also be provided. The following options were set, but a mirroring delegate was not found at '%@':\n%@", @"NSPersistentStoreMirroringDelegateOptionKey", objc_msgSend(a3, "mirroringOptions")];
    long long v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28588];
    v56[0] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    char v11 = 0;
    id v53 = (id)[v21 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v22];
    goto LABEL_17;
  }
  if (-[NSCloudKitMirroringDelegate validateManagedObjectModel:forUseWithStoreWithDescription:error:](v11, "validateManagedObjectModel:forUseWithStoreWithDescription:error:", [v9 managedObjectModel], a3, &v53))
  {
    char v51 = 0;
    goto LABEL_13;
  }
LABEL_17:
  int v23 = [MEMORY[0x1E4F29060] isMainThread];
  if (([a3 shouldInvokeCompletionHandlerConcurrently] | v23 ^ a4))
  {
    id v24 = v53;
    id v25 = a2;
    if (a4) {
      global_queue = MEMORY[0x1E4F14428];
    }
    else {
      global_queue = dispatch_get_global_queue(0, 0);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__NSPersistentStoreCoordinator__doAddPersistentStoreWithDescription_privateCopy_completeOnMainThread_withHandler___block_invoke;
    block[3] = &unk_1E544CBA8;
    block[4] = a2;
    void block[5] = v53;
    block[6] = a5;
    dispatch_async(global_queue, block);
  }
  else
  {
    (*(void (**)(uint64_t, void *, id))(a5 + 16))(a5, a2, v53);
  }

  [v10 drain];
  return 0;
}

- (NSPersistentStore)addPersistentStoreWithType:(NSString *)storeType configuration:(NSString *)configuration URL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3052000000;
  uint64_t v88 = __Block_byref_object_copy__18;
  uint64_t v89 = __Block_byref_object_dispose__18;
  id v90 = configuration;
  uint64_t v79 = 0;
  long long v80 = &v79;
  uint64_t v81 = 0x3052000000;
  id v82 = __Block_byref_object_copy__18;
  v83 = __Block_byref_object_dispose__18;
  uint64_t v84 = 0;
  uint64_t v73 = 0;
  unsigned __int8 v74 = &v73;
  uint64_t v75 = 0x3052000000;
  v76 = __Block_byref_object_copy__18;
  char v77 = __Block_byref_object_dispose__18;
  uint64_t v78 = 0;
  uint64_t v13 = [(NSPersistentStoreCoordinator *)self managedObjectModel];
  int v14 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"NSPersistentStoreForceLightweightMigrationOption"), "BOOLValue");
  char v15 = v14;
  if (v14)
  {
    id v16 = (id)[(NSDictionary *)options mutableCopy];
    [v16 removeObjectForKey:@"NSPersistentStoreForceLightweightMigrationOption"];
    options = (NSDictionary *)(id)[v16 copy];
  }
  v71[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v71[1] = (void (*)(void))3221225472;
  v71[2] = (void (*)(void))__91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke;
  v71[3] = (void (*)(void))&unk_1E544CBF8;
  v71[4] = (void (*)(void))options;
  v71[5] = (void (*)(void))self;
  v71[6] = (void (*)(void))storeType;
  v71[7] = (void (*)(void))storeURL;
  v71[8] = (void (*)(void))v13;
  v71[9] = (void (*)(void))&v73;
  v71[10] = (void (*)(void))&v85;
  v71[11] = (void (*)(void))&v79;
  v71[12] = (void (*)(void))error;
  char v72 = v15;
  _perform_0((unint64_t)self, v71);
  id v17 = (id)v80[5];
  if (v74[5])
  {
    uint64_t v18 = NSStringFromSelector(a2);
    [(id)v74[5] domain];
    [(id)v74[5] code];
    _NSCoreDataLog(1, @"%@ returned error %@ (%ld)", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    if (objc_msgSend((id)objc_msgSend((id)v74[5], "userInfo"), "count"))
    {
      _NSCoreDataLog(1, @"userInfo:", v25, v26, v27, v28, v29, v30, v68);
      objc_msgSend((id)objc_msgSend((id)v74[5], "userInfo"), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_12);
    }
    _NSCoreDataLog(1, @"storeType: %@", v25, v26, v27, v28, v29, v30, (uint64_t)storeType);
    _NSCoreDataLog(1, @"configuration: %@", v31, v32, v33, v34, v35, v36, v86[5]);
    _NSCoreDataLog(1, @"URL: %@", v37, v38, v39, v40, v41, v42, (uint64_t)storeURL);
    if ([(NSDictionary *)options count])
    {
      _NSCoreDataLog(4, @"options:", v43, v44, v45, v46, v47, v48, v67);
      [(NSDictionary *)options enumerateKeysAndObjectsUsingBlock:&__block_literal_global_458];
    }
    if ([(id)v74[5] code] == 134130 || objc_msgSend((id)v74[5], "code") == 134020)
    {
      uint64_t v49 = [(NSManagedObjectModel *)[(NSPersistentStoreCoordinator *)self managedObjectModel] entityVersionHashesByName];
      _NSCoreDataLog(1, @"NSPersistentStoreCoordinator's current model hashes are %@", v50, v51, v52, v53, v54, v55, (uint64_t)v49);
    }
    uint64_t v56 = (void *)v74[5];
    if (error)
    {
      *error = (NSError *)v56;
    }
    else
    {

      v74[5] = 0;
    }
  }
  if (v80[5])
  {
    id v57 = [(NSDictionary *)options valueForKey:@"NSCoreDataCoreSpotlightExporter"];
    if (v57) {
      -[NSCoreDataCoreSpotlightDelegate _initializePersistentStore]((uint64_t)v57);
    }
    if (objc_msgSend((id)objc_msgSend((id)v80[5], "type"), "isEqualToString:", @"SQLite")) {
      -[NSSQLCore _initializeQueryGenerationConnectionForProtectionClasses]((unint64_t *)v80[5]);
    }
    if (([(id)v80[5] isReadOnly] & 1) == 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v80[5], "metadata"), "objectForKey:", @"NSPersistentStoreRebuildIndicies"), "BOOLValue"))
    {
      uint64_t v58 = getprogname();
      if (v58 && (!strncmp("assetsd", v58, 7uLL) || !strncmp("photolibraryd", v58, 0xDuLL)))
      {
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_4;
        v70[3] = &unk_1E544B4A8;
        v70[4] = self;
        v70[5] = &v79;
        [(NSPersistentStoreCoordinator *)self performBlockAndWait:v70];
      }
      else if ([(NSDictionary *)options valueForKey:@"NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey"])
      {
        _NSCoreDataLog(4, @"Deferring index repair until after migration is complete (NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey is set).", v59, v60, v61, v62, v63, v64, v67);
      }
      else
      {
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_5;
        v69[3] = &unk_1E544B4A8;
        v69[4] = self;
        v69[5] = &v79;
        [(NSPersistentStoreCoordinator *)self performBlock:v69];
      }
    }
  }
  uint64_t v65 = (NSPersistentStore *)v80[5];
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);
  return v65;
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_607(uint64_t a1)
{
  uint64_t v2 = -[NSPersistentStoreCoordinator _retainedIdentifierFromStores:](*(_NSQueryGenerationToken **)(a1 + 32), *(void **)(a1 + 40));
  if (!v2)
  {
    _NSCoreDataLog(1, @"Coordinator failed to create a new query generation post save", v3, v4, v5, v6, v7, v8, v9);
    uint64_t v2 = +[NSQueryGenerationToken currentQueryGenerationToken];
  }
  id v10 = v2;
  [*(id *)(a1 + 48) _setQueryGenerationFromToken:v2 error:0];
}

void __82__NSPersistentStoreCoordinator_QueryGenerations___retainedCurrentQueryGeneration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a2);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v9, "identifier"))) {
            [v4 addObject:v9];
          }
        }
        uint64_t v6 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = 0;
  }
  if (v4) {
    id v10 = v4;
  }
  else {
    id v10 = a2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = -[NSPersistentStoreCoordinator _retainedIdentifierFromStores:](*(_NSQueryGenerationToken **)(a1 + 40), v10);
}

- (_NSQueryGenerationToken)_retainedIdentifierFromStores:(_NSQueryGenerationToken *)result
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if ([a2 count])
    {
      uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v4 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v17;
        while (2)
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(a2);
            }
            uint64_t v8 = [*(id *)(*((void *)&v16 + 1) + 8 * v7) currentQueryGeneration];
            if (!v8)
            {
              _NSCoreDataLog(1, @"Store currentQueryGeneration returned nil unexpectedly", v9, v10, v11, v12, v13, v14, v16);
              return 0;
            }
            [v3 addObject:v8];
            ++v7;
          }
          while (v5 != v7);
          uint64_t v5 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
      if ([v3 count] == 1)
      {
        return (_NSQueryGenerationToken *)(id)[v3 lastObject];
      }
      else
      {
        id result = [_NSQueryGenerationToken alloc];
        if (result)
        {
          id result = (_NSQueryGenerationToken *)-[_NSQueryGenerationToken _initWithValue:singleton:](result, v3, 0);
          if (result) {
            *(_WORD *)&result->_flags |= 1u;
          }
        }
      }
    }
    else
    {
      id v15 = +[NSQueryGenerationToken nostoresQueryGenerationToken];
      return (_NSQueryGenerationToken *)v15;
    }
  }
  return result;
}

id __81__NSPersistentStoreCoordinator_QueryGenerations___validateQueryGeneration_error___block_invoke(uint64_t a1, void *a2)
{
  id result = (id)objc_msgSend(-[_NSQueryGenerationToken _storesForRequestRoutingFrom:error:](*(_WORD **)(a1 + 32), a2, (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)), "count");
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id result = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E20A0];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return v4;
  }
  return result;
}

- (void)performBlockAndWait:(void *)block
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can only use -performBlockAndWait: on an NSPersistentStoreCoordinator that was created with a queue." userInfo:0]);
  }
  uint64_t v3 = *(void (***)(void))(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  v12[0] = (void (**)(void))block;
  v12[1] = (void (**)(void))self;
  v12[2] = (void (**)(void))8196;
  v12[3] = v3;
  id v13 = 0;
  if (v3)
  {
    unint64_t v4 = 0;
    int v5 = 0;
    unint64_t v6 = (unint64_t)v3;
    while ((NSPersistentStoreCoordinator *)v6 != self)
    {
      if (v6 == v4) {
        goto LABEL_11;
      }
      if (!v4) {
        unint64_t v4 = v6;
      }
      unint64_t v6 = atomic_load((unint64_t *)(v6 + 8));
      if (!v6) {
        goto LABEL_12;
      }
    }
    int v5 = 1;
LABEL_11:
    if (v5)
    {
LABEL_21:
      gutsOfBlockToNSPersistentStoreCoordinatorPerform(v12);
      goto LABEL_23;
    }
LABEL_12:
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = self;
    while (v9 != (NSPersistentStoreCoordinator *)v3)
    {
      if (v9 == v7) {
        goto LABEL_20;
      }
      if (!v7) {
        uint64_t v7 = v9;
      }
      uint64_t v9 = (NSPersistentStoreCoordinator *)atomic_load((unint64_t *)&v9->_queueOwner);
      if (!v9) {
        goto LABEL_22;
      }
    }
    int v8 = 1;
LABEL_20:
    if (v8) {
      goto LABEL_21;
    }
  }
LABEL_22:
  dispatch_sync_f((dispatch_queue_t)self->_dispatchQueue, v12, (dispatch_function_t)developerSubmittedBlockToNSPersistentStoreCoordinatorPerform);
LABEL_23:
  id v10 = v13;
  if (v13)
  {
    id v11 = v13;
    objc_exception_throw(v10);
  }
}

- (NSPersistentHistoryToken)currentPersistentHistoryTokenFromStores:(NSArray *)stores
{
  if (!stores || (unint64_t v4 = stores, ![(NSArray *)stores count])) {
    unint64_t v4 = [(NSPersistentStoreCoordinator *)self persistentStores];
  }
  int v5 = -[NSPersistentStoreCoordinator _retainedChangeTokenFromStores:]((_NSPersistentHistoryToken *)self, v4);

  return (NSPersistentHistoryToken *)v5;
}

- (NSPersistentStoreCoordinator)initWithManagedObjectModel:(NSManagedObjectModel *)model
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  objc_opt_class();
  v12.receiver = self;
  v12.super_class = (Class)NSPersistentStoreCoordinator;
  int v5 = [(NSPersistentStoreCoordinator *)&v12 init];
  if (v5)
  {
    if (!model) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot create an NSPersistentStoreCoordinator with a nil model" userInfo:0]);
    }
    unint64_t v6 = (void *)MEMORY[0x18C127630]();
    v5->_persistentStores = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v5->_miniLock._os_unfair_lock_opaque = 0;
    v5->_managedObjectModel = model;
    __str[0] = 0;
    uint64_t v7 = [(NSPersistentStoreCoordinator *)v5 name];
    if (v7)
    {
      snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p: ", v5);
      [(NSString *)v7 UTF8String];
      __strlcat_chk();
    }
    else
    {
      snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p", v5);
    }
    _persistentStoreCoordinatorFlags flags = v5->_flags;
    if ((*(unsigned int *)&flags >> 2)) {
      uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)(*(unsigned int *)&flags >> 2), 0);
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = dispatch_queue_create(__str, v9);
    dispatch_set_context(v10, v5);
    v5->_dispatchQueue = v10;
    [(NSManagedObjectModel *)v5->_managedObjectModel _setIsEditable:0];
    *(_WORD *)&v5->_flags |= 2u;
    v5->_modelMap = (_PFModelMap *)-[_PFModelMap initWithClientModel:]([_PFModelMap alloc], model);
  }
  return v5;
}

- (NSString)name
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__18;
  id v10 = __Block_byref_object_dispose__18;
  uint64_t v11 = 0;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36__NSPersistentStoreCoordinator_name__block_invoke;
    v5[3] = &unk_1E544B9B0;
    v5[4] = self;
    v5[5] = &v6;
    [(NSPersistentStoreCoordinator *)self performBlockAndWait:v5];
    uint64_t v2 = (void *)v7[5];
  }
  else
  {
    uint64_t v2 = (void *)[(NSString *)self->_queueLabel copy];
    v7[5] = (uint64_t)v2;
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (NSPersistentStoreCoordinator)alloc
{
  return (NSPersistentStoreCoordinator *)_PFAllocateObject((Class)a1, 0);
}

- (id)persistentStoreForIdentifier:(id)a3
{
  unint64_t v4 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  uint64_t v5 = [v4 count];
  if (v5 < 1)
  {
LABEL_5:
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = (void *)[v4 objectAtIndex:v7];
      if (objc_msgSend((id)objc_msgSend(v8, "identifier"), "isEqual:", a3)) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (BOOL)_canSaveGraphRootedAtObject:(void *)value intoStore:(uint64_t)a2 withPreviouslyChecked:(CFSetRef)theSet withAcceptableEntities:(const __CFSet *)a4
{
  CFSetRef v48 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl([value managedObjectContext], sel__canSaveGraphRootedAtObject_intoStore_withPreviouslyChecked_withAcceptableEntities_);
    if (!value) {
      return 1;
    }
  }
  else if (!value)
  {
    return 1;
  }
  if (CFSetContainsValue(theSet, value)) {
    return 1;
  }
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFSetAddValue(Mutable, value);
  CFMutableSetRef v51 = theSet;
  do
  {
    CFIndex Count = CFSetGetCount(Mutable);
    BOOL v46 = Count == 0;
    if (!Count) {
      break;
    }
    CFIndex v10 = Count;
    uint64_t v47 = v45;
    unint64_t v11 = MEMORY[0x1F4188790](Count);
    id v13 = (const void **)&v45[-v12];
    if (v11 > 0x200) {
      id v13 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero(&v45[-v12], 8 * v11);
    }
    CFSetGetValues(Mutable, v13);
    CFSetRemoveAllValues(Mutable);
    unint64_t v14 = 0;
    int v15 = 0;
    unint64_t v50 = v10;
    uint64_t v49 = v13;
    while (1)
    {
      int v52 = v15;
      uint64_t v55 = (id **)v13[v14];
      if (!CFSetContainsValue(theSet, v55)) {
        break;
      }
LABEL_39:
      unint64_t v14 = (v52 + 1);
      int v15 = v52 + 1;
      unint64_t v43 = v50;
      theSet = v51;
      id v13 = v49;
      if (v50 <= v14)
      {
        char v44 = 1;
        goto LABEL_42;
      }
    }
    long long v16 = v55;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v55, "objectID"), "persistentStore");
    long long v18 = (void *)[v16 entity];
    if (v17) {
      BOOL v19 = v17 == a2;
    }
    else {
      BOOL v19 = 1;
    }
    if (v19)
    {
      uint64_t v20 = v18;
      if (CFSetContainsValue(v48, v18))
      {
        uint64_t v21 = v55;
        CFSetAddValue(v51, v55);
        if (([v21 isFault] & 1) == 0)
        {
          uint64_t v22 = (void *)v20[14];
          uint64_t v23 = *(void *)(v20[13] + 40);
          uint64_t v54 = _kvcPropertysPrimitiveGetters(v20);
          unint64_t v28 = v22[12];
          uint64_t v29 = v22[13];
          if (v28 < v29 + v28)
          {
            do
            {
              _PF_Handler_Primitive_GetProperty(v55, v28, *(void *)(v23 + 8 * v28), *(void *)(v54 + 8 * v28), v24, v25, v26, v27);
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = (void *)[v30 objectID];
                if (([v32 isTemporaryID] & 1) != 0 || objc_msgSend(v32, "persistentStore") != a2) {
                  CFSetAddValue(Mutable, v31);
                }
              }
              ++v28;
              --v29;
            }
            while (v29);
          }
          unint64_t v33 = v22[18];
          unint64_t v53 = v22[19] + v33;
          if (v33 < v53)
          {
            do
            {
              uint64_t v34 = v23;
              _PF_Handler_Primitive_GetProperty(v55, v33, *(void *)(v23 + 8 * v33), *(void *)(v54 + 8 * v33), v24, v25, v26, v27);
              uint64_t v36 = v35;
              if (([v35 isFault] & 1) == 0)
              {
                if ([v36 count])
                {
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v57 = 0u;
                  long long v56 = 0u;
                  uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v60 count:16];
                  if (v37)
                  {
                    uint64_t v38 = v37;
                    uint64_t v39 = *(void *)v57;
                    do
                    {
                      for (uint64_t i = 0; i != v38; ++i)
                      {
                        if (*(void *)v57 != v39) {
                          objc_enumerationMutation(v36);
                        }
                        uint64_t v41 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                        uint64_t v42 = (void *)[v41 objectID];
                        if (([v42 isTemporaryID] & 1) != 0 || objc_msgSend(v42, "persistentStore") != a2) {
                          CFSetAddValue(Mutable, v41);
                        }
                      }
                      uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v60 count:16];
                    }
                    while (v38);
                  }
                }
              }
              ++v33;
              uint64_t v23 = v34;
            }
            while (v33 != v53);
          }
        }
        goto LABEL_39;
      }
    }
    char v44 = 0;
    theSet = v51;
    unint64_t v43 = v50;
    id v13 = v49;
LABEL_42:
    if (v43 >= 0x201) {
      NSZoneFree(0, v13);
    }
  }
  while ((v44 & 1) != 0);
  CFRelease(Mutable);
  return v46;
}

- (uint64_t)_doPreSaveAssignmentsForObjects:(void *)a3 intoStores:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = (void *)result;
  if (result)
  {
    if (_PF_Threading_Debugging_level)
    {
      if (objc_opt_respondsToSelector()) {
        unint64_t v28 = (void *)[a2 anyObject];
      }
      else {
        unint64_t v28 = (void *)[a2 lastObject];
      }
      _PFAssertSafeMultiThreadedAccess_impl([v28 managedObjectContext], sel__doPreSaveAssignmentsForObjects_intoStores_);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id result = [a2 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v46;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      uint64_t v29 = *(void *)v46;
      uint64_t v30 = a2;
      do
      {
        uint64_t v6 = 0;
        uint64_t v31 = v4;
        do
        {
          if (*(void *)v46 != v5) {
            objc_enumerationMutation(a2);
          }
          uint64_t v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
          if (!objc_msgSend((id)objc_msgSend(v7, "objectID", v29, v30), "persistentStore"))
          {
            uint64_t v32 = v6;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v8 = [a3 countByEnumeratingWithState:&v41 objects:v54 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v42;
              do
              {
                uint64_t v11 = 0;
                uint64_t v35 = v9;
                do
                {
                  if (*(void *)v42 != v10) {
                    objc_enumerationMutation(a3);
                  }
                  uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
                  if (([v12 isReadOnly] & 1) == 0)
                  {
                    id v13 = v7;
                    unint64_t v14 = objc_msgSend((id)objc_msgSend(v34, "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(v12, "configurationName"));
                    CFSetRef Mutable = CFSetCreateMutable(allocator, 0, 0);
                    long long v16 = CFSetCreateMutable(allocator, 0, 0);
                    long long v37 = 0u;
                    long long v38 = 0u;
                    long long v39 = 0u;
                    long long v40 = 0u;
                    uint64_t v17 = [v14 countByEnumeratingWithState:&v37 objects:v53 count:16];
                    if (v17)
                    {
                      uint64_t v18 = v17;
                      uint64_t v19 = *(void *)v38;
                      do
                      {
                        for (uint64_t i = 0; i != v18; ++i)
                        {
                          if (*(void *)v38 != v19) {
                            objc_enumerationMutation(v14);
                          }
                          CFSetAddValue(v16, *(const void **)(*((void *)&v37 + 1) + 8 * i));
                        }
                        uint64_t v18 = [v14 countByEnumeratingWithState:&v37 objects:v53 count:16];
                      }
                      while (v18);
                    }
                    uint64_t v7 = v13;
                    BOOL v21 = -[NSPersistentStoreCoordinator _canSaveGraphRootedAtObject:intoStore:withPreviouslyChecked:withAcceptableEntities:](v13, (uint64_t)v12, Mutable, v16);
                    CFRelease(v16);
                    if (v21)
                    {
                      long long v49 = 0u;
                      long long v50 = 0u;
                      long long v51 = 0u;
                      long long v52 = 0u;
                      uint64_t v22 = [(__CFSet *)Mutable countByEnumeratingWithState:&v49 objects:v56 count:16];
                      if (v22)
                      {
                        uint64_t v23 = v22;
                        uint64_t v24 = *(void *)v50;
                        do
                        {
                          for (uint64_t j = 0; j != v23; ++j)
                          {
                            if (*(void *)v50 != v24) {
                              objc_enumerationMutation(Mutable);
                            }
                            uint64_t v26 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * j) objectID];
                            if ([v26 isTemporaryID])
                            {
                              if (![v26 persistentStore]) {
                                [v26 _setPersistentStore:v12];
                              }
                            }
                          }
                          uint64_t v23 = [(__CFSet *)Mutable countByEnumeratingWithState:&v49 objects:v56 count:16];
                        }
                        while (v23);
                      }
                      CFRelease(Mutable);
                      uint64_t v5 = v29;
                      a2 = v30;
                      uint64_t v4 = v31;
                      uint64_t v6 = v32;
                      goto LABEL_38;
                    }
                    CFRelease(Mutable);
                    uint64_t v9 = v35;
                  }
                  ++v11;
                }
                while (v11 != v9);
                uint64_t v9 = [a3 countByEnumeratingWithState:&v41 objects:v54 count:16];
              }
              while (v9);
            }
            id v27 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134020, @"Can't resolve how to assign objects to stores; some objects may have been assigned to stores; use [[managedObject objectID] persistentStore] to find out what is going where now; use [managedObjectContext assignObject:toStore:] to straighten things out",
                    (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"problemObject"]);
            objc_exception_throw(v27);
          }
LABEL_38:
          ++v6;
        }
        while (v6 != v4);
        id result = [a2 countByEnumeratingWithState:&v45 objects:v55 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __39__NSPersistentStoreCoordinator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v1 = a1;
    id v25 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (-[NSPersistentStoreCoordinator _hasHistoryTracking:](*(void *)(v1 + 40), *(void **)(v1 + 32))) {
      +[_PFPersistentHistoryModel resetCaches]();
    }
    uint64_t v26 = v1;
    uint64_t v2 = *(void **)(*(void *)(v1 + 40) + 64);
    if (v2 || *(void *)(v1 + 32))
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v3)
      {
        uint64_t v4 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (*(void *)v36 != v4) {
              objc_enumerationMutation(v2);
            }
            -[_PFGarbageManager doCleanupForURL:]((uint64_t)+[_PFGarbageManager defaultInstance](_PFGarbageManager, "defaultInstance"), *(void **)(*((void *)&v35 + 1) + 8 * i));
          }
          uint64_t v3 = [v2 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v3);
      }

      *(void *)(*(void *)(v26 + 40) + 64) = 0;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v6 = *(void **)(v26 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v7; ++j)
          {
            if (*(void *)v32 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(unint64_t **)(*((void *)&v31 + 1) + 8 * j);
            uint64_t v11 = (__CFString *)[v10 type];
            if (v10) {
              BOOL v12 = v11 == @"SQLite";
            }
            else {
              BOOL v12 = 0;
            }
            if (v12)
            {
              unint64_t v13 = atomic_load(v10 + 22);
              if (v13)
              {
                unint64_t v14 = +[_PFGarbageManager defaultInstance];
                -[_PFGarbageManager doCleanupForURL:]((uint64_t)v14, (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1]);
              }
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v42 count:16];
        }
        while (v7);
      }
    }
    context = (void *)MEMORY[0x18C127630]();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    int v15 = *(void **)(v26 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(unint64_t **)(*((void *)&v27 + 1) + 8 * k);
          uint64_t v20 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
          long long v39 = @"removed";
          long long v40 = v19;
          objc_msgSend(v20, "postNotificationName:object:userInfo:", @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
          [v19 willRemoveFromPersistentStoreCoordinator:0];
          if (v19)
          {
            if (atomic_load(v19 + 1)) {
              atomic_store(0, v19 + 1);
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v16);
    }
    uint64_t v22 = *(const void **)(v26 + 32);
    if (v22) {
      CFRelease(v22);
    }

    *(void *)(*(void *)(v26 + 40) + 72) = 0;
    *(void *)(*(void *)(v26 + 40) + 80) = 0;

    *(void *)(*(void *)(v26 + 40) + 88) = 0;
    *(void *)(*(void *)(v26 + 40) + 96) = 0;

    *(void *)(*(void *)(v26 + 40) + 40) = 0;
    objc_storeWeak((id *)(*(void *)(v26 + 40) + 104), 0);
    a1 = [v25 drain];
  }
  return MEMORY[0x18C128600](a1);
}

- (uint64_t)_hasHistoryTracking:(uint64_t)result
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    id result = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(a2);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5), "options"), "objectForKey:", @"NSPersistentHistoryTrackingKey"))
          {
            return 1;
          }
          ++v5;
        }
        while (v3 != v5);
        id result = [a2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(@"NSXPCStore", "isEqual:"))
  {
    uint64_t v10 = [[NSXPCStore alloc] initWithPersistentStoreCoordinator:0 configurationName:0 URL:url options:options];
    if (v10)
    {
      uint64_t v11 = v10;
      if ([(NSXPCStore *)v10 loadMetadata:error])
      {
        BOOL v12 = [(NSXPCStore *)v11 metadata];

        return v12;
      }
    }
    else if (error)
    {
      NSLog((NSString *)@"Can't create store");
      uint64_t v22 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:0];
      id result = 0;
      *error = v22;
      return result;
    }
    return 0;
  }
  if ([(NSString *)storeType length]) {
    unint64_t v14 = storeType;
  }
  else {
    unint64_t v14 = 0;
  }
  uint64_t v15 = self;
  if (!url) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid store URL: nil" userInfo:0]);
  }
  uint64_t v16 = (void *)v15;
  objc_opt_class();
  objc_opt_class();
  id v17 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v43 = 0;
  id v44 = 0;
  long long v38 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Retrieving metadata for persistent store", &v43);
  if ([(NSURL *)url isFileURL])
  {
    uint64_t v18 = [(NSURL *)url path];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isReadableFileAtPath:", v18) & 1) == 0)
    {
      if (error)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v24 = objc_msgSend(v23, "initWithObjectsAndKeys:", url, *MEMORY[0x1E4F289D0], 0);
        id v44 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v24];
        *error = (NSError *)v44;
      }
      id v25 = 0;
      int v26 = 0;
      goto LABEL_50;
    }
    memset(&v45, 0, sizeof(v45));
    if (stat([(NSString *)v18 fileSystemRepresentation], &v45)) {
      off_t st_size = 0;
    }
    else {
      off_t st_size = v45.st_size;
    }
    if (!v14) {
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v20 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)v14);
    if (v20) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  off_t st_size = 1;
  if (v14) {
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v20 = (void *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, url);
LABEL_19:
  if (v20
    && st_size
    && ((objc_opt_respondsToSelector() & 1) == 0
      ? (BOOL v21 = (void *)[v20 metadataForPersistentStoreWithURL:url error:&v44])
      : (BOOL v21 = (void *)[v20 metadataForPersistentStoreWithURL:url options:options error:&v44]),
        (id v25 = v21) != 0))
  {
    int v26 = 1;
  }
  else
  {
    id v25 = 0;
    int v26 = 1;
    if (![(NSString *)v14 length] && st_size)
    {
      objc_sync_enter(v16);
      long long v27 = (void *)[(id)qword_1EB270700 allKeys];
      objc_sync_exit(v16);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:&v45 count:16];
      if (v28)
      {
        id v37 = v17;
        uint64_t v29 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v40 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            id v44 = 0;
            long long v32 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, v31);
            if (objc_opt_respondsToSelector()) {
              long long v33 = (void *)[v32 metadataForPersistentStoreWithURL:url options:options error:&v44];
            }
            else {
              long long v33 = (void *)[v32 metadataForPersistentStoreWithURL:url error:&v44];
            }
            id v25 = v33;
            if (v25)
            {
              id v44 = 0;
              int v26 = 1;
              goto LABEL_48;
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:&v45 count:16];
          int v26 = 1;
          if (v28) {
            continue;
          }
          break;
        }
        id v25 = 0;
LABEL_48:
        id v17 = v37;
      }
      else
      {
        id v25 = 0;
      }
    }
  }
LABEL_50:
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v43, v38);
  id v34 = v44;
  [v17 drain];
  id v35 = v44;
  if (!v26) {
    return 0;
  }
  if (error && !v25)
  {
    long long v36 = (NSError *)v44;
    if (!v44) {
      long long v36 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:0];
    }
    *error = v36;
  }
  return (NSDictionary *)v25;
}

- (BOOL)_removeAllPersistentStores:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  BOOL v12 = __Block_byref_object_copy__18;
  unint64_t v13 = __Block_byref_object_dispose__18;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NSPersistentStoreCoordinator__removeAllPersistentStores___block_invoke;
  v8[3] = &unk_1E544BEB8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  [(NSPersistentStoreCoordinator *)self performBlockAndWait:v8];
  id v4 = (id)v10[5];
  if (a3)
  {
    uint64_t v5 = (void *)v10[5];
    if (v5) {
      *a3 = v5;
    }
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

- (NSDictionary)metadataForPersistentStore:(NSPersistentStore *)store
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__18;
  uint64_t v10 = __Block_byref_object_dispose__18;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NSPersistentStoreCoordinator_metadataForPersistentStore___block_invoke;
  v5[3] = &unk_1E544CB80;
  v5[4] = &v6;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v5, (void (*)(void))store);
  uint64_t v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  uint64_t v2 = self;
  if (self && (*(_WORD *)&self->_flags & 1) != 0)
  {
    self;
    self = (NSPersistentStoreCoordinator *)-[PFUbiquitySwitchboard unregisterCoordinator:](_sharedSwitchboard, v2);
  }
  MEMORY[0x18C1285F0](self, a2);
  os_unfair_lock_lock_with_options();
  persistentStores = (void (*)(void))v2->_persistentStores;
  v2->_persistentStores = 0;
  __dmb(0xBu);
  os_unfair_lock_unlock(&v2->_miniLock);
  if (persistentStores)
  {
    v5[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v5[1] = (void (*)(void))3221225472;
    v5[2] = (void (*)(void))__39__NSPersistentStoreCoordinator_dealloc__block_invoke;
    v5[3] = (void (*)(void))&unk_1E544B778;
    v5[4] = persistentStores;
    void v5[5] = (void (*)(void))v2;
    _perform_0((unint64_t)v2, v5);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__NSPersistentStoreCoordinator_dealloc__block_invoke_312;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)v2->_dispatchQueue, block);
  }
}

void __39__NSPersistentStoreCoordinator_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_set_context(v2, 0);
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
  uint64_t v3 = *(void **)(a1 + 40);

  _PFDeallocateObject(v3);
}

+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error
{
  if (objc_msgSend(@"NSXPCStore", "isEqual:"))
  {
    if (error)
    {
      NSLog((NSString *)@"This is not the API you're looking for.");
      *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"This is not the API you're looking for" code:134060 userInfo:0];
    }
    return 0;
  }
  else
  {
    return (NSDictionary *)[a1 metadataForPersistentStoreOfType:storeType URL:url options:0 error:error];
  }
}

void __39__NSPersistentStoreCoordinator_dealloc__block_invoke_312(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);

  *(void *)(v2 + 56) = 0;
  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 712);
  if (v5 == v2)
  {
    *(void *)(StatusReg + 712) = 0;
  }
  else if (v5)
  {
    unint64_t v6 = atomic_load((unint64_t *)(v5 + 8));
    if (v6 == v2)
    {
      unint64_t v7 = v6;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v5 + 8), &v7, 0);
      if (v7 != v6)
      {
        uint64_t v8 = [NSString stringWithUTF8String:"Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)"];
        atomic_load((unint64_t *)(v5 + 8));
        _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, v5);
        uint64_t v15 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          unint64_t v16 = atomic_load((unint64_t *)(v5 + 8));
          *(_DWORD *)buf = 134218752;
          uint64_t v34 = v5;
          __int16 v35 = 2048;
          uint64_t v36 = 0;
          __int16 v37 = 2048;
          unint64_t v38 = v6;
          __int16 v39 = 2048;
          unint64_t v40 = v16;
          _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)", buf, 0x2Au);
        }
      }
    }
  }
  unint64_t v17 = atomic_load((unint64_t *)(v2 + 8));
  unint64_t v18 = v17;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(v2 + 8), &v18, 0);
  if (v18 != v17)
  {
    do
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)"];
      uint64_t v22 = (unint64_t *)(v2 + 8);
      atomic_load((unint64_t *)(v2 + 8));
      _NSCoreDataLog(17, v21, v23, v24, v25, v26, v27, v28, v2);
      uint64_t v29 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        unint64_t v31 = atomic_load(v22);
        *(_DWORD *)buf = 134218752;
        uint64_t v34 = v2;
        __int16 v35 = 2048;
        uint64_t v36 = 0;
        __int16 v37 = 2048;
        unint64_t v38 = v17;
        __int16 v39 = 2048;
        unint64_t v40 = v31;
        _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)", buf, 0x2Au);
      }
      unint64_t v17 = atomic_load(v22);
      unint64_t v30 = v17;
      atomic_compare_exchange_strong((atomic_ullong *volatile)v22, &v30, 0);
    }
    while (v30 != v17);
  }
  __dmb(0xBu);
  *(void *)(v2 + 16) = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NSPersistentStoreCoordinator_dealloc__block_invoke_2;
  block[3] = &unk_1E544C720;
  uint64_t v20 = *(void *)(a1 + 32);
  block[4] = v3;
  void block[5] = v20;
  dispatch_async(global_queue, block);
}

- (void)setMetadata:(NSDictionary *)metadata forPersistentStore:(NSPersistentStore *)store
{
  if ([(NSPersistentStore *)store isReadOnly]) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Cannot set metadata in read-only store.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", store), @"NSAffectedStoresErrorKey", 0)));
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__NSPersistentStoreCoordinator_setMetadata_forPersistentStore___block_invoke;
  v7[3] = &unk_1E544CB58;
  void v7[4] = metadata;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v7, (void (*)(void))store);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)performBlock:(void *)block
{
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can only use -performBlock: on an NSPersistentStoreCoordinator that was created with a queue." userInfo:0]);
  }
  uint64_t v5 = malloc_type_malloc(0x28uLL, 0x80040B8603338uLL);
  *uint64_t v5 = _Block_copy(block);
  v5[1] = CFRetain(self);
  v5[2] = 8199;
  v5[3] = 0;
  v5[4] = 0;
  dispatchQueue = self->_dispatchQueue;

  dispatch_async_f(dispatchQueue, v5, (dispatch_function_t)developerSubmittedBlockToNSPersistentStoreCoordinatorPerform);
}

- (void)setName:(NSString *)name
{
  uint64_t v4 = [(NSString *)name copy];
  uint64_t v5 = (NSString *)v4;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__NSPersistentStoreCoordinator_setName___block_invoke;
    void v6[3] = &unk_1E544B778;
    v6[4] = self;
    v6[5] = v4;
    [(NSPersistentStoreCoordinator *)self performBlockAndWait:v6];
  }
  else
  {

    self->_queueLabel = v5;
  }
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];

  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(a1 + 40);
  __str[0] = 0;
  if (*(void *)(a1 + 40))
  {
    snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p: ", *(const void **)(a1 + 32));
    [*(id *)(a1 + 40) UTF8String];
    __strlcat_chk();
  }
  else
  {
    snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p", *(const void **)(a1 + 32));
  }
  uint64_t v2 = strdup(__str);
  __dmb(0xBu);
  uint64_t v3 = *(char **)(*(void *)(*(void *)(a1 + 32) + 16) + *(unsigned __int16 *)(MEMORY[0x1E4F147A8] + 2));
  uint64_t v4 = v3;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 32) + 16) + *(unsigned __int16 *)(MEMORY[0x1E4F147A8] + 2)), (unint64_t *)&v4, (unint64_t)v2);
  if (v4 == v3)
  {
    if (!v3) {
      return;
    }
    uint64_t v5 = v7;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    unint64_t v6 = __40__NSPersistentStoreCoordinator_setName___block_invoke_3;
  }
  else
  {
    uint64_t v5 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    unint64_t v6 = __40__NSPersistentStoreCoordinator_setName___block_invoke_2;
    uint64_t v3 = v2;
  }
  v5[2] = v6;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke_2(uint64_t a1)
{
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke_3(uint64_t a1)
{
}

+ (void)registerStoreClass:(Class)storeClass forStoreType:(NSString *)storeType
{
  if (!storeType) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot register a store class using a 'nil' type." userInfo:0]);
  }
  objc_sync_enter(a1);
  if (qword_1EB2706F8 && [(id)qword_1EB2706F8 objectForKey:storeType])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = [NSString stringWithFormat:@"Store type '%@' is reserved for Core Data, and cannot be re-registered.", storeType];
    objc_exception_throw((id)[v9 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  unint64_t v7 = (void *)qword_1EB270700;
  if (qword_1EB270700)
  {
    if (storeClass)
    {
LABEL_6:
      uint64_t v8 = [MEMORY[0x1E4F29238] valueWithPointer:storeClass];
      [(id)qword_1EB270700 setObject:v8 forKey:storeType];
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    qword_1EB270700 = (uint64_t)v7;
    if (storeClass) {
      goto LABEL_6;
    }
  }
  [v7 removeObjectForKey:storeType];
LABEL_9:

  objc_sync_exit(a1);
}

+ (NSDictionary)registeredStoreTypes
{
  objc_sync_enter(a1);
  if (qword_1EB270700)
  {
    uint64_t v3 = (void *)[(id)qword_1EB270700 mutableCopy];
    [v3 addEntriesFromDictionary:qword_1EB2706F8];
  }
  else
  {
    uint64_t v3 = (void *)[(id)qword_1EB2706F8 copy];
  }
  objc_sync_exit(a1);

  return (NSDictionary *)v3;
}

+ (const)_classForPersistentStoreAtURL:(uint64_t)a1
{
  v7[1] = *MEMORY[0x1E4F143B8];
  self;
  if ([a2 isFileURL])
  {
    id result = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
    if (!result) {
      return result;
    }
    int v4 = open(result, 0);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      ssize_t v6 = read(v4, v7, 8uLL);
      close(v5);
      if (v6 == 8 && (v7[0] == 0x66206574694C5153 || v7[0] == 0x6174614465726F43)) {
        return (const char *)objc_opt_class();
      }
    }
  }
  return 0;
}

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  if ([(NSString *)storeType isEqualToString:@"NSXPCStore"])
  {
    uint64_t v12 = [[NSXPCStore alloc] initWithPersistentStoreCoordinator:0 configurationName:0 URL:url options:options];
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v18 = 0;
      if ([(NSXPCStore *)v12 loadMetadata:&v18])
      {
        [(NSXPCStore *)v13 setMetadata:metadata];
        id v14 = [(NSXPCStore *)v13 executeRequest:objc_alloc_init(NSSaveChangesRequest) withContext:0 error:error];

        return [v14 BOOLValue];
      }
      if (error)
      {
        if (v18) {
          unint64_t v17 = v18;
        }
        else {
          unint64_t v17 = @"Unknown";
        }
        *error = (NSError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v17, *MEMORY[0x1E4F28A50]));
      }
    }
    else if (error)
    {
      NSLog((NSString *)@"Can't create store");
      unint64_t v16 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:0];
      BOOL result = 0;
      *error = v16;
      return result;
    }
    return 0;
  }
  else
  {
    return +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)metadata, storeType, url, (uint64_t)options, error);
  }
}

+ (uint64_t)_setMetadata:(void *)a3 forPersistentStoreOfType:(void *)a4 URL:(uint64_t)a5 options:(void *)a6 error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = self;
  if (!a4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid store URL: nil" userInfo:0]);
  }
  uint64_t v12 = (void *)v11;
  objc_opt_class();
  objc_opt_class();
  id v27 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v33 = 0;
  id v34 = 0;
  uint64_t v28 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Setting metadata for persistent store", &v33);
  if ((a3
     && (uint64_t v13 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)a3)) != 0|| (uint64_t v13 = (void *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, a4)) != 0)&& ((objc_opt_respondsToSelector() & 1) == 0? (v14 = [v13 setMetadata:a2 forPersistentStoreWithURL:a4 error:&v34]): (v14 = objc_msgSend(v13, "setMetadata:forPersistentStoreWithURL:options:error:", a2, a4, a5, &v34)), (v14 & 1) != 0))
  {
    uint64_t v15 = 1;
  }
  else
  {
    if (![a3 length])
    {
      objc_sync_enter(v12);
      unint64_t v17 = (void *)[(id)qword_1EB270700 allKeys];
      objc_sync_exit(v12);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v30;
        uint64_t v26 = a6;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            id v34 = 0;
            uint64_t v22 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, v21);
            if (objc_opt_respondsToSelector()) {
              char v23 = [v22 setMetadata:a2 forPersistentStoreWithURL:a4 options:a5 error:&v34];
            }
            else {
              char v23 = [v22 setMetadata:a2 forPersistentStoreWithURL:a4 error:&v34];
            }
            if (v23)
            {
              uint64_t v15 = 1;
              a6 = v26;
              goto LABEL_27;
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
          a6 = v26;
          if (v18) {
            continue;
          }
          break;
        }
      }
    }
    if (a6) {
      id v16 = v34;
    }
    uint64_t v15 = 0;
  }
LABEL_27:
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v33, v28);
  [v27 drain];
  if (a6) {
    char v24 = v15;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0) {
    *a6 = v34;
  }
  return v15;
}

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error
{
  return +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)metadata, storeType, url, 0, error);
}

- (NSPersistentStoreCoordinator)init
{
  _NSCoreDataLog(2, @"client failed to call designated initializer on NSPersistentStoreCoordinator", v2, v3, v4, v5, v6, v7, v12);
  uint64_t v9 = objc_alloc_init(NSManagedObjectModel);
  uint64_t v10 = [(NSPersistentStoreCoordinator *)self initWithManagedObjectModel:v9];

  return v10;
}

- (BOOL)tryLock
{
  return 1;
}

- (uint64_t)_checkForSkewedEntityHashes:(uint64_t)result metadata:(void *)a2
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (void *)result;
    objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"NSPersistenceFrameworkVersion"), "floatValue");
    if ((int)v4 <= 386)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t v5 = objc_msgSend(v3, "managedObjectModel", 0);
      BOOL result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v6 = result;
        uint64_t v7 = *(void *)v10;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v5);
            }
            if (-[NSEntityDescription _hasPotentialHashSkew](*(void *)(*((void *)&v9 + 1) + 8 * i))) {
              return objc_msgSend(-[NSManagedObjectModel _entityVersionHashesByNameInStyle:]((id)objc_msgSend(v3, "managedObjectModel"), 1), "isEqual:", objc_msgSend(a2, "valueForKey:", @"NSStoreModelVersionHashes"));
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
          BOOL result = 0;
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_checkForTombstoneSkew:(uint64_t)a3 metadata:(uint64_t)a4 configuration:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = [a2 mutableCopy];
  uint64_t v8 = (void *)v7;
  if (v7) {
    -[NSManagedObjectModel _traverseTombstonesAndMark:](v7, 1);
  }
  if ([v8 isConfiguration:a4 compatibleWithStoreMetadata:a3])
  {
    uint64_t v9 = 1;
  }
  else
  {

    uint64_t v10 = [a2 mutableCopy];
    uint64_t v8 = (void *)v10;
    if (v10) {
      -[NSManagedObjectModel _traverseTombstonesAndMark:](v10, 0);
    }
    uint64_t v9 = [v8 isConfiguration:a4 compatibleWithStoreMetadata:a3];
  }

  return v9;
}

void __114__NSPersistentStoreCoordinator__doAddPersistentStoreWithDescription_privateCopy_completeOnMainThread_withHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v2 drain];
}

id __84__NSPersistentStoreCoordinator_addPersistentStoreWithDescription_completionHandler___block_invoke(uint64_t a1)
{
  return -[NSPersistentStoreCoordinator _doAddPersistentStoreWithDescription:privateCopy:completeOnMainThread:withHandler:](*(id *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
}

- (unint64_t)migrateStoreWithContext:(void *)a3 error:
{
  unint64_t v3 = a1;
  v73[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = [a2 configurationName];
    [a2 setConfigurationName:0];
    id v59 = 0;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSPersistentStoreStagedMigrationManagerOptionKey");
    if (v7
      && (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSMigratePersistentStoresAutomaticallyOption"), "BOOLValue")|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", @"NSInferMappingModelAutomaticallyOption"), "BOOLValue") & 1) == 0))
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = *MEMORY[0x1E4F281F8];
      uint64_t v72 = *MEMORY[0x1E4F28568];
      v73[0] = @"Staged Migration was requested with NSPersistentStoreStagedMigrationManagerOptionKey but without setting NSMigratePersistentStoresAutomaticallyOption and NSInferMappingModelAutomaticallyOption to YES.";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
      uint64_t v15 = 134100;
      goto LABEL_14;
    }
    [a2 setStagedMigrationManager:v7];
    if (!objc_msgSend((id)objc_msgSend(v7, "stages"), "count"))
    {
      uint64_t v18 = 0;
LABEL_21:
      *(_WORD *)(v3 + 24) |= 0x400u;
      if ([v18 count])
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v25 = [v18 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v56;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v56 != v27) {
                objc_enumerationMutation(v18);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                long long v53 = 0u;
                long long v54 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                uint64_t v31 = [v18 countByEnumeratingWithState:&v51 objects:v64 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v52;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v32; ++j)
                    {
                      if (*(void *)v52 != v33) {
                        objc_enumerationMutation(v18);
                      }
                      __int16 v35 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                      uint64_t v36 = (void *)MEMORY[0x18C127630]();
                      if ((-[NSPersistentStoreCoordinator applyMigrationStage:withContext:error:]((void *)v3, v35, a2, &v59) & 1) == 0)
                      {
                        id v39 = v59;
                        goto LABEL_47;
                      }
                    }
                    uint64_t v32 = [v18 countByEnumeratingWithState:&v51 objects:v64 count:16];
                    if (v32) {
                      continue;
                    }
                    break;
                  }
                }
                goto LABEL_42;
              }
            }
            uint64_t v26 = [v18 countByEnumeratingWithState:&v55 objects:v65 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }
        long long v29 = (void *)[v18 lastObject];
        long long v30 = (void *)v3;
      }
      else
      {
        long long v30 = (void *)v3;
        long long v29 = 0;
      }
      if ((-[NSPersistentStoreCoordinator applyMigrationStage:withContext:error:](v30, v29, a2, &v59) & 1) == 0)
      {
        id v38 = v59;
LABEL_47:
        *(_WORD *)(v3 + 24) &= ~0x400u;
LABEL_50:
        id v41 = v59;
        if (v41)
        {
          if (a3)
          {
            unint64_t v3 = 0;
            *a3 = v41;
            goto LABEL_56;
          }
        }
        else
        {
          uint64_t v42 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
          long long v49 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v61 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
            __int16 v62 = 1024;
            int v63 = 3855;
            _os_log_fault_impl(&dword_18AB82000, v49, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
        unint64_t v3 = 0;
        goto LABEL_56;
      }
LABEL_42:
      *(_WORD *)(v3 + 24) &= ~0x400u;
      -[NSPersistentStoreCoordinator _removePersistentStore:](v3, (unint64_t *)objc_msgSend((id)v3, "persistentStoreForURL:", objc_msgSend(a2, "storeURL")));
      uint64_t v37 = objc_msgSend((id)v3, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a2, "storeType"), v6, objc_msgSend(a2, "storeURL"), objc_msgSend(a2, "options"), &v59);
      id v19 = v59;
      if (v37 && !v59)
      {
        [a2 setMigratedStore:v37];
        unint64_t v3 = 1;
LABEL_56:

        return v3;
      }
LABEL_49:
      id v40 = v19;
      goto LABEL_50;
    }
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "metadata"), "objectForKey:", @"NSStoreModelVersionChecksumKey");
    if (!v8) {
      goto LABEL_61;
    }
    uint64_t v9 = v8;
    uint64_t v10 = [v7 _findCurrentMigrationStageFromModelChecksum:v8];
    if ((objc_msgSend(v7, "_shouldAttemptStagedMigrationWithStoreModelVersionChecksum:coordinatorModelVersionChecksum:error:", v9, objc_msgSend((id)objc_msgSend((id)v3, "managedObjectModel"), "versionChecksum"), &v59) & 1) == 0)
    {
      id v19 = v59;
      goto LABEL_49;
    }
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_61:
      if (objc_msgSend((id)objc_msgSend(a2, "storeType"), "isEqualToString:", @"SQLite"))
      {
        id v11 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", [a2 storeURL], objc_msgSend(a2, "options"), &v59);
        [v11 _setIsEditable:0];
        if (v11)
        {
          uint64_t v10 = objc_msgSend(v7, "_findCurrentMigrationStageFromModelChecksum:", objc_msgSend(v11, "versionChecksum"));
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v13 = *MEMORY[0x1E4F281F8];
            uint64_t v70 = *MEMORY[0x1E4F28568];
            char v71 = @"Cannot use staged migration with an unknown model version.";
            uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
            uint64_t v15 = 134504;
LABEL_14:
            id v16 = v12;
            uint64_t v17 = v13;
LABEL_15:
            id v59 = (id)[v16 initWithDomain:v17 code:v15 userInfo:v14];
            goto LABEL_50;
          }
          goto LABEL_20;
        }
        id v19 = v59;
        if (v59) {
          goto LABEL_49;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F281F8];
        uint64_t v68 = *MEMORY[0x1E4F28568];
        v69 = @"The store must be opened one time without Staged Migration to update store metadata to be able to use Staged Migration.";
        uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
        char v23 = &v69;
        char v24 = &v68;
      }
      else
      {
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F281F8];
        uint64_t v66 = *MEMORY[0x1E4F28568];
        uint64_t v67 = @"The store must be opened one time without Staged Migration to update store metadata to be able to use Staged Migration.";
        uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
        char v23 = &v67;
        char v24 = &v66;
      }
      uint64_t v14 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
      id v16 = v20;
      uint64_t v17 = v21;
      uint64_t v15 = 134505;
      goto LABEL_15;
    }
LABEL_20:
    uint64_t v18 = objc_msgSend((id)objc_msgSend(v7, "stages"), "subarrayWithRange:", v10, objc_msgSend((id)objc_msgSend(v7, "stages"), "count") - v10);
    goto LABEL_21;
  }
  return v3;
}

- (BOOL)_removePersistentStore:(unint64_t)a1
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unint64_t v10 = *(void *)(StatusReg + 712);
      if (!v10) {
        goto LABEL_32;
      }
      unint64_t v11 = 0;
      int v12 = 0;
      while (v10 != a1)
      {
        if (v10 == v11) {
          goto LABEL_23;
        }
        if (!v11) {
          unint64_t v11 = v10;
        }
        unint64_t v10 = atomic_load((unint64_t *)(v10 + 8));
        if (!v10) {
          goto LABEL_24;
        }
      }
      int v12 = 1;
LABEL_23:
      if (v12) {
        goto LABEL_3;
      }
LABEL_24:
      uint64_t v13 = *(void *)(StatusReg + 712);
      if (!v13) {
        goto LABEL_32;
      }
      unint64_t v14 = 0;
      int v15 = 0;
      unint64_t v16 = a1;
      while (v16 != v13)
      {
        if (v16 == v14) {
          goto LABEL_33;
        }
        if (!v14) {
          unint64_t v14 = v16;
        }
        unint64_t v16 = atomic_load((unint64_t *)(v16 + 8));
        if (!v16) {
          goto LABEL_32;
        }
      }
      int v15 = 1;
LABEL_33:
      while (!v15)
      {
LABEL_32:
        self;
        __break(1u);
      }
    }
LABEL_3:
    [a2 willRemoveFromPersistentStoreCoordinator:a1];
    __dmb(0xBu);
    while (1)
    {
      os_unfair_lock_lock_with_options();
      float v4 = *(void **)(a1 + 48);
      uint64_t v5 = (void *)[v4 mutableCopy];
      [v5 removeObjectIdenticalTo:a2];
      id v6 = (id)[v5 copy];

      CFRetain(v6);
      if (*(void **)(a1 + 48) == v4) {
        break;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      if (v6) {
        CFRelease(v6);
      }
    }
    *(void *)(a1 + 48) = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    if (a2)
    {
      if (atomic_load(a2 + 1)) {
        atomic_store(0, a2 + 1);
      }
    }
    if (v4) {
      CFRelease(v4);
    }
  }
  return a1 != 0;
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier];

  return -[NSPersistentStoreCoordinator _repairIndiciesForStoreWithIdentifier:synchronous:](v1, v2, 1);
}

- (uint64_t)_repairIndiciesForStoreWithIdentifier:(uint64_t)a3 synchronous:
{
  if (result)
  {
    float v4 = (void *)[(id)result persistentStoreForIdentifier:a2];
    BOOL result = [v4 isReadOnly];
    if ((result & 1) == 0)
    {
      BOOL result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "metadata"), "objectForKey:", @"NSPersistentStoreRebuildIndicies"), "BOOLValue");
      if (result)
      {
        return [v4 _rebuildIndiciesSynchronously:a3];
      }
    }
  }
  return result;
}

uint64_t __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier];

  return -[NSPersistentStoreCoordinator _repairIndiciesForStoreWithIdentifier:synchronous:](v1, v2, 0);
}

- (BOOL)removePersistentStore:(NSPersistentStore *)store error:(NSError *)error
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (store)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = @"removed";
    v10[0] = store;
    objc_msgSend(v7, "postNotificationName:object:userInfo:", @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
  return -[NSPersistentStoreCoordinator _removePersistentStore:error:]((void (*)(void))self, store, error);
}

- (BOOL)_removePersistentStore:(void *)(a1 error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  int v15 = __Block_byref_object_copy__18;
  unint64_t v16 = __Block_byref_object_dispose__18;
  uint64_t v17 = 0;
  if (objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", @"NSXPCStore"))
  {
    id v6 = a2;
    [a2 _prepareStoreForRemovalFromCoordinator:a1];
  }
  v11[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v11[1] = (void (*)(void))3221225472;
  v11[2] = (void (*)(void))__61__NSPersistentStoreCoordinator__removePersistentStore_error___block_invoke;
  v11[3] = (void (*)(void))&unk_1E544BB50;
  v11[4] = (void (*)(void))a2;
  void v11[5] = a1;
  v11[6] = (void (*)(void))&v18;
  v11[7] = (void (*)(void))&v12;
  _perform_0((unint64_t)a1, v11);
  uint64_t v7 = (void *)v13[5];
  if (v7)
  {
    id v8 = v7;
    if (a3) {
      *a3 = v13[5];
    }
  }
  BOOL v9 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

void __61__NSPersistentStoreCoordinator__removePersistentStore_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 32);
  if (*(void *)(a1 + 32)
    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStores"), "indexOfObjectIdenticalTo:", *(void *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = *(id *)(a1 + 32);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[NSPersistentStoreCoordinator _removePersistentStore:](*(void *)(a1 + 40), *(unint64_t **)(a1 + 32));
    float v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v2 count:1];
    -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:](*(void *)(a1 + 40), (uint64_t)v4, @"removed", 0);

    if ((__CFString *)[*(id *)(a1 + 32) type] == @"SQLite"
      && !*(void *)(*(void *)(a1 + 40) + 64))
    {
      *(void *)(*(void *)(a1 + 40) + 64) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        unint64_t v6 = atomic_load((unint64_t *)(v5 + 176));
        if (v6) {
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "addObject:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", v6, 1));
        }
      }
    }
    uint64_t v7 = *v2;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E2078];
  }
}

- (NSURL)URLForPersistentStore:(NSPersistentStore *)store
{
  if (!store) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil is not a valid store." userInfo:0]);
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  BOOL v9 = __Block_byref_object_copy__18;
  unint64_t v10 = __Block_byref_object_dispose__18;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__NSPersistentStoreCoordinator_URLForPersistentStore___block_invoke;
  v5[3] = &unk_1E544CB80;
  v5[4] = &v6;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v5, (void (*)(void))store);
  id v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __54__NSPersistentStoreCoordinator_URLForPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  id result = (id)[a2 URL];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (BOOL)setURL:(NSURL *)url forPersistentStore:(NSPersistentStore *)store
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__NSPersistentStoreCoordinator_setURL_forPersistentStore___block_invoke;
  void v6[3] = &unk_1E544CC40;
  v6[4] = url;
  v6[5] = &v7;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v6, (void (*)(void))store);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__NSPersistentStoreCoordinator_setURL_forPersistentStore___block_invoke(uint64_t result, void *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    id result = objc_msgSend(a2, "setURL:");
    *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (NSPersistentStore)migratePersistentStore:(NSPersistentStore *)store toURL:(NSURL *)URL options:(NSDictionary *)options withType:(NSString *)storeType error:(NSError *)error
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy__18;
  long long v29 = __Block_byref_object_dispose__18;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__18;
  char v23 = __Block_byref_object_dispose__18;
  uint64_t v24 = 0;
  if (!store)
  {
    uint64_t v17 = @"nil is not a valid persistent store";
    goto LABEL_10;
  }
  if (!URL && ![(NSString *)storeType isEqualToString:@"InMemory"])
  {
    uint64_t v17 = @"nil is not a valid persistent store URL";
LABEL_10:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v17, 0, storeType, error));
  }
  v18[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v18[1] = (void (*)(void))3221225472;
  v18[2] = (void (*)(void))__84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke;
  v18[3] = (void (*)(void))&unk_1E544CC68;
  _OWORD v18[4] = (void (*)(void))store;
  v18[5] = (void (*)(void))self;
  v18[6] = (void (*)(void))options;
  v18[7] = (void (*)(void))storeType;
  v18[8] = (void (*)(void))URL;
  v18[9] = (void (*)(void))&v25;
  v18[10] = (void (*)(void))&v19;
  v18[11] = (void (*)(void))error;
  _perform_0((unint64_t)self, v18);
  id v13 = (id)v26[5];
  if (error)
  {
    uint64_t v14 = (NSError *)v26[5];
    if (v14) {
      *error = v14;
    }
  }
  int v15 = (NSPersistentStore *)v20[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v15;
}

void __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v44 = 0;
  id v42 = (id)[*(id *)(a1 + 32) configurationName];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = self;
  objc_sync_enter(v3);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  char v4 = (void *)qword_1EB2706F8;
  uint64_t v5 = [(id)qword_1EB2706F8 countByEnumeratingWithState:&v49 objects:&v56 count:16];
  if (!v5)
  {
LABEL_9:
    char v10 = (void *)qword_1EB270700;
    if (qword_1EB270700)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v11 = [(id)qword_1EB270700 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v46 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            uint64_t v14 = objc_opt_class();
            if (v14 == objc_msgSend((id)objc_msgSend((id)qword_1EB270700, "objectForKey:", v8), "pointerValue")) {
              goto LABEL_19;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v11);
      }
    }
    objc_sync_exit(v3);
    int v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't find store type for store %@ (class == %@) in %@.", v2, objc_opt_class(), objc_msgSend(v3, "registeredStoreTypes")), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  uint64_t v6 = *(void *)v50;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v50 != v6) {
      objc_enumerationMutation(v4);
    }
    uint64_t v8 = *(void **)(*((void *)&v49 + 1) + 8 * v7);
    uint64_t v9 = objc_opt_class();
    if (v9 == objc_msgSend((id)objc_msgSend((id)qword_1EB2706F8, "objectForKey:", v8), "pointerValue")) {
      break;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:&v56 count:16];
      if (!v5) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }
LABEL_19:
  objc_sync_exit(v3);
  id v16 = v8;
  id v17 = (id)[*(id *)(a1 + 32) URL];
  uint64_t v18 = objc_msgSend(objc_allocWithZone((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", objc_msgSend(*(id *)(a1 + 40), "managedObjectModel"));
  uint64_t v19 = *(void **)(a1 + 48);
  if (v19) {
    id v20 = (id)[v19 mutableCopy];
  }
  else {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v21 = v20;
  if (![v20 objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"]) {
    [v21 setObject:&unk_1ED7E2938 forKey:@"NSPersistentStoreRemoveUbiquitousMetadataOption"];
  }
  [v21 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
  uint64_t v22 = (void **)[v18 addPersistentStoreWithType:*(void *)(a1 + 56) configuration:v42 URL:*(void *)(a1 + 64) options:v21 error:&v44];

  if (v22)
  {
    char v23 = v22;
    id v24 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v56 = 0;
    long long v57 = &v56;
    uint64_t v58 = 0x3052000000;
    id v59 = __Block_byref_object_copy__18;
    uint64_t v60 = __Block_byref_object_dispose__18;
    uint64_t v61 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke_488;
    v43[3] = &unk_1E544C748;
    uint64_t v25 = *(void *)(a1 + 32);
    v43[4] = v18;
    v43[5] = v25;
    v43[6] = v22;
    v43[7] = &v56;
    [v18 performBlockAndWait:v43];
    uint64_t v26 = (void *)v57[5];
    _Block_object_dispose(&v56, 8);
    id v27 = v44;

    [v24 drain];
    if (v44)
    {
      id v28 = v44;
      if (*(void *)(a1 + 88)) {
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v44;
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = 0;
    }
    else if (v26)
    {
      id v29 = *(id *)(a1 + 32);
      uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(a1 + 48)];
      objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 0), @"_NSNotifyObserversOfStoreChange");
      if ([*(id *)(a1 + 56) isEqualToString:@"InMemory"]) {
        [v30 setObject:-[NSDictionaryStoreMap _archivedData](v22[13]) forKey:0x1ED7953C0];
      }
      if (![v30 objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"]) {
        [v30 setObject:&unk_1ED7E2938 forKey:@"NSPersistentStoreRemoveUbiquitousMetadataOption"];
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [*(id *)(a1 + 40) addPersistentStoreWithType:*(void *)(a1 + 56) configuration:v42 URL:*(void *)(a1 + 64) options:v30 error:&v44];

      if (v44) {
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v44;
      }
      unint64_t v31 = [v26 count];
      if (v31 >= 2)
      {
        for (unint64_t j = 1; j < v31; j += 2)
          objc_msgSend(v26, "replaceObjectAtIndex:withObject:", j, objc_msgSend(*(id *)(a1 + 40), "managedObjectIDForURIRepresentation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "objectAtIndex:", j), "objectID"), "URIRepresentation")));
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
      {
        uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v26, 0);
        -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:](*(void *)(a1 + 40), (uint64_t)v33, @"changedUUID", 0);

        if (*(void *)(a1 + 32))
        {
          id v34 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v35 = *(void *)(a1 + 32);
          uint64_t v36 = *(void *)(a1 + 40);
          long long v53 = @"removed";
          uint64_t v54 = v35;
          objc_msgSend(v34, "postNotificationName:object:userInfo:", @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", v36, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          uint64_t v37 = *(void **)(a1 + 32);
        }
        else
        {
          uint64_t v37 = 0;
        }
        -[NSPersistentStoreCoordinator _removePersistentStore:error:](*(void (**)(void))(a1 + 40), v37, &v44);
      }
      else
      {
      }
    }
    else
    {

      if (*(void *)(a1 + 88))
      {
        id v38 = (void *)MEMORY[0x1E4F28C58];
        if (v44) {
          uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v44 forKey:*MEMORY[0x1E4F28A50]];
        }
        else {
          uint64_t v39 = 0;
        }
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v38 errorWithDomain:*MEMORY[0x1E4F281F8] code:134030 userInfo:v39];
      }
    }
  }
  else
  {
    if (*(void *)(a1 + 88)) {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v44;
    }

    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = 0;
  }
  id v40 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v40) {
    id v41 = v40;
  }
}

void __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke_488(uint64_t a1)
{
  uint64_t v1 = (void *)a1;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  -[NSPersistentStoreCoordinator _addPersistentStore:identifier:](*(void *)(a1 + 32), *(void **)(a1 + 40), [*(id *)(a1 + 40) identifier]);
  unint64_t v2 = v1[4];
  if (!v2)
  {
    uint64_t v60 = 0;
    goto LABEL_72;
  }
  id v3 = (void *)v1[5];
  char v4 = (void *)v1[6];
  uint64_t v5 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
  [(NSManagedObjectContext *)v5 setPersistentStoreCoordinator:v2];
  [(NSManagedObjectContext *)v5 setRetainsRegisteredObjects:1];
  [(NSManagedObjectContext *)v5 setUndoManager:0];
  if (_PF_Threading_Debugging_level)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unint64_t v70 = *(void *)(StatusReg + 712);
    if (!v70) {
      goto LABEL_95;
    }
    unint64_t v71 = 0;
    int v72 = 0;
    while (v70 != v2)
    {
      if (v70 == v71) {
        goto LABEL_86;
      }
      if (!v71) {
        unint64_t v71 = v70;
      }
      unint64_t v70 = atomic_load((unint64_t *)(v70 + 8));
      if (!v70) {
        goto LABEL_87;
      }
    }
    int v72 = 1;
LABEL_86:
    if (v72) {
      goto LABEL_3;
    }
LABEL_87:
    uint64_t v73 = *(void *)(StatusReg + 712);
    if (!v73) {
      goto LABEL_95;
    }
    unint64_t v74 = 0;
    int v75 = 0;
    unint64_t v76 = v2;
    while (v76 != v73)
    {
      if (v76 == v74) {
        goto LABEL_96;
      }
      if (!v74) {
        unint64_t v74 = v76;
      }
      unint64_t v76 = atomic_load((unint64_t *)(v76 + 8));
      if (!v76) {
        goto LABEL_95;
      }
    }
    int v75 = 1;
LABEL_96:
    while (!v75)
    {
LABEL_95:
      self;
      __break(1u);
    }
  }
LABEL_3:
  id v90 = v3;
  uint64_t v91 = v5;
  v86 = v1;
  uint64_t v6 = objc_alloc_init(NSFetchRequest);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  unint64_t v88 = v2;
  uint64_t v7 = *(void **)(v2 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v107 objects:v106 count:16];
  uint64_t v87 = v4;
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v108;
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v108 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        if (![v14 superentity])
        {
          uint64_t v100 = 0;
          [(NSFetchRequest *)v6 setEntity:v14];
          -[NSFetchRequest setAffectedStores:](v6, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObject:v90]);
          if (![(NSManagedObjectContext *)v5 executeFetchRequest:v6 error:&v100]) {
            id v10 = (id)[MEMORY[0x1E4F1CA00] exceptionWithName:v12, objc_msgSend(NSString, "stringWithFormat:", @"Fetch instances of entity %@ from store %@ failed, reason: %@", v14, v90, v100), 0 reason userInfo];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v107 objects:v106 count:16];
    }
    while (v9);

    int v15 = v5;
    if (v10) {
      goto LABEL_101;
    }
  }
  else
  {

    int v15 = v5;
  }
  id v16 = [(NSManagedObjectContext *)v15 registeredObjects];
  id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSSet count](v16, "count"));
  uint64_t v85 = [(NSSet *)[(NSManagedObjectContext *)v15 deletedObjects] count];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v18 = [(NSSet *)v16 countByEnumeratingWithState:&v96 objects:&v102 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v97 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(v22, "objectID"), "persistentStore") == v90)
        {
          [v17 addObject:v22];
          if (v22) {
            uint64_t v23 = _insertion_fault_handler;
          }
          else {
            uint64_t v23 = 0;
          }
          -[NSFaultHandler _fireFirstAndSecondLevelFaultsForObject:withContext:](v23, v22);
        }
      }
      uint64_t v19 = [(NSSet *)v16 countByEnumeratingWithState:&v96 objects:&v102 count:16];
    }
    while (v19);
  }
  obuint64_t j = v17;
  id v24 = [(NSManagedObjectContext *)v15 registeredObjects];
  uint64_t v25 = [(NSSet *)[(NSManagedObjectContext *)v15 deletedObjects] count];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v26 = [(NSSet *)v24 countByEnumeratingWithState:&v92 objects:v101 count:16];
  if (!v26)
  {
    int v28 = 0;
    goto LABEL_46;
  }
  uint64_t v27 = v26;
  int v28 = 0;
  uint64_t v29 = *(void *)v93;
  do
  {
    for (uint64_t k = 0; k != v27; ++k)
    {
      if (*(void *)v93 != v29) {
        objc_enumerationMutation(v24);
      }
      unint64_t v31 = *(unsigned char **)(*((void *)&v92 + 1) + 8 * k);
      if (objc_msgSend((id)objc_msgSend(v31, "objectID"), "persistentStore") == v90)
      {
        ++v28;
        if (([obj containsObject:v31] & 1) == 0)
        {
          uint64_t v32 = (void *)[v31 objectID];
          if (v31[16] & 0x12) != 0 || (uint64_t v33 = v32, ([v32 isTemporaryID]))
          {
LABEL_42:
            uint64_t v35 = *MEMORY[0x1E4F1C3B8];
            uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v31, @"object", 0);
            uint64_t v37 = @"Save failed during during migratePersistentStore:toURL:options:withType:error:, object added to store during fetch.";
            uint64_t v38 = v35;
            uint64_t v39 = 134030;
          }
          else
          {
            uint64_t v100 = 0;
            id v34 = (void *)[v90 newValuesForObjectWithID:v33 withContext:v15 error:&v100];
            if (v34)
            {

              goto LABEL_42;
            }
            uint64_t v61 = v100;
            uint64_t v84 = *MEMORY[0x1E4F28778];
            uint64_t v62 = [NSString stringWithFormat:@"CoreData could not fulfill a fault for '%@'", v33];
            int v63 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObject:v31];
            if (v61) {
              uint64_t v65 = objc_msgSend(v63, "dictionaryWithObjectsAndKeys:", v64, @"NSAffectedObjectsErrorKey", v100, *MEMORY[0x1E4F28A50], 0);
            }
            else {
              uint64_t v65 = objc_msgSend(v63, "dictionaryWithObjectsAndKeys:", v64, @"NSAffectedObjectsErrorKey", 0, v82, v83);
            }
            id v66 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v84, 133000, v62, v65);
            uint64_t v67 = *MEMORY[0x1E4F1C3B8];
            uint64_t v68 = [NSString stringWithFormat:@"Referential integrity problem found during migratePersistentStore:toURL:options:withType:error: %@", objc_msgSend(v66, "reason")];
            uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v66, @"NSUnderlyingException", 0);
            uint64_t v38 = v67;
            uint64_t v39 = 133000;
            uint64_t v37 = (__CFString *)v68;
          }
          id v10 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v38, v39, (uint64_t)v37, v36);
          if (!v10) {
            goto LABEL_46;
          }
LABEL_101:

          objc_exception_throw(v10);
        }
      }
    }
    uint64_t v27 = [(NSSet *)v24 countByEnumeratingWithState:&v92 objects:v101 count:16];
  }
  while (v27);
LABEL_46:
  if ([obj count] == v28)
  {
    if (v25 != v85)
    {
      uint64_t v40 = *MEMORY[0x1E4F1C3B8];
      uint64_t v41 = [NSString stringWithFormat:@"Save failed during migratePersistentStore:toURL:options:withType:error:, %d objects in store were removed during fetch.", v25 - v85];
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  uint64_t v40 = *MEMORY[0x1E4F1C3B8];
  uint64_t v41 = [NSString stringWithFormat:@"Save failed during migratePersistentStore:toURL:options:withType:error:, %d objects in store were removed during fetch.", objc_msgSend(obj, "count") - v28];
LABEL_50:
  id v10 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v40, 134030, v41, 0);
  if (v10) {
    goto LABEL_101;
  }
LABEL_51:
  id v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  id v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v45 = [obj countByEnumeratingWithState:&v102 objects:v106 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v103;
    do
    {
      for (uint64_t m = 0; m != v46; ++m)
      {
        if (*(void *)v103 != v47) {
          objc_enumerationMutation(obj);
        }
        long long v49 = *(void **)(*((void *)&v102 + 1) + 8 * m);
        long long v50 = (void *)[v49 objectID];
        [v42 addObject:v50];
        long long v51 = -[NSTemporaryObjectID initWithEntity:]([NSTemporaryObjectID alloc], "initWithEntity:", [v49 entity]);
        [v42 addObject:v49];
        [v43 addObject:v49];
        [v44 addObject:v51];

        -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](v91, (uint64_t)v49, v50);
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v102 objects:v106 count:16];
    }
    while (v46);
  }
  if ([v43 count])
  {

    uint64_t v52 = [v43 count];
    uint64_t v53 = objc_msgSend(*(id *)(v88 + 40), "entitiesForConfiguration:", objc_msgSend(v87, "configurationName"));
    if (v52)
    {
      uint64_t v54 = (void *)v53;
      uint64_t v55 = 0;
      while (1)
      {
        uint64_t v56 = (void *)[v43 objectAtIndex:v55];
        long long v57 = v56;
        if (_PF_Threading_Debugging_level) {
          _PFAssertSafeMultiThreadedAccess_impl([v56 managedObjectContext], sel__assignObject_toPersistentStore_forConfiguration_);
        }
        uint64_t v58 = (void *)[v57 objectID];
        if (![v58 isTemporaryID]) {
          break;
        }
        if (objc_msgSend(v54, "indexOfObjectIdenticalTo:", objc_msgSend(v58, "entity")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          char v77 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v78 = *MEMORY[0x1E4F1C3C8];
          uint64_t v79 = @"Can't assign an object to a store that does not contain the object's entity.";
LABEL_100:
          objc_exception_throw((id)[v77 exceptionWithName:v78 reason:v79 userInfo:0]);
        }
        [v58 _setPersistentStore:v87];
        if (v52 == ++v55) {
          goto LABEL_66;
        }
      }
      char v77 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v78 = *MEMORY[0x1E4F1C3C8];
      uint64_t v79 = @"Can't reassign an object to a different store once it has been saved.";
      goto LABEL_100;
    }
  }
LABEL_66:

  -[NSPersistentStoreCoordinator _copyMetadataFromStore:toStore:migrationManager:](v88, v90, v87, 0);
  if (v90)
  {
    id v59 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    *(void *)&long long v107 = @"removed";
    v101[0] = v90;
    objc_msgSend(v59, "postNotificationName:object:userInfo:", @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", v88, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v101, &v107, 1));
  }
  -[NSPersistentStoreCoordinator _removePersistentStore:](v88, (unint64_t *)v90);
  *(void *)&long long v96 = 0;
  [(NSManagedObjectContext *)v91 save:&v96];
  uint64_t v1 = v86;
  if ((void)v96)
  {

    long long v80 = v91;
    id v81 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134030, @"Save failed.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", (void)v96, @"NSCoreDataPrimaryError", 0));
    objc_exception_throw(v81);
  }
  [(NSManagedObjectContext *)v91 reset];

  if ((void)v96) {
    uint64_t v60 = 0;
  }
  else {
    uint64_t v60 = v42;
  }
LABEL_72:
  *(void *)(*(void *)(v1[7] + 8) + 40) = v60;
}

- (BOOL)finishDeferredLightweightMigration:(NSError *)error
{
  return -[NSPersistentStoreCoordinator _finishDeferredLightweightMigrationTasks:withError:](self, 1, error);
}

- (BOOL)_finishDeferredLightweightMigrationTasks:(void *)a3 withError:
{
  if (!a1) {
    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__18;
  int v15 = __Block_byref_object_dispose__18;
  uint64_t v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__NSPersistentStoreCoordinator_DeferredLightweightMigration___finishDeferredLightweightMigrationTasks_withError___block_invoke;
  v9[3] = &unk_1E544CF60;
  char v10 = a2;
  v9[4] = a1;
  v9[5] = &v11;
  v9[6] = &v17;
  [a1 performBlockAndWait:v9];
  id v4 = (id)v12[5];
  uint64_t v5 = v18;
  int v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((unsigned char *)v18 + 24))
  {
    *a3 = v12[5];
    int v6 = *((unsigned __int8 *)v5 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

- (BOOL)finishDeferredLightweightMigrationTask:(NSError *)error
{
  return -[NSPersistentStoreCoordinator _finishDeferredLightweightMigrationTasks:withError:](self, 0, error);
}

- (id)_exceptionNoStoreSaveFailureForError:(id)a3 recommendedFrame:(int *)a4
{
  if (a4) {
    *a4 = 0;
  }
  if (a3)
  {
    uint64_t v6 = [a3 code];
    BOOL v7 = (void *)[a3 domain];
    if ([v7 isEqualToString:@"NSSQLiteErrorDomain"]) {
      uint64_t v8 = [NSNumber numberWithInteger:v6];
    }
    else {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSSQLiteErrorDomain");
    }
    uint64_t v16 = (void *)v8;
    uint64_t v17 = *MEMORY[0x1E4F28798];
    if ([v7 isEqualToString:*MEMORY[0x1E4F28798]]) {
      uint64_t v18 = [NSNumber numberWithInteger:v6];
    }
    else {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", v17);
    }
    uint64_t v19 = (void *)v18;
    if ([v7 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      if (v6 == 134020 || v6 == 134100)
      {
        if (!a4) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      unint64_t v20 = v6 - 134171;
      if (a4 && v20 >= 0xFFFFFFFFFFFFFFB9)
      {
LABEL_18:
        *a4 = 2;
LABEL_19:
        uint64_t v21 = @"(schema mismatch or migration failure)";
LABEL_34:
        uint64_t v9 = (void *)[NSString stringWithFormat:@"This NSPersistentStoreCoordinator has no persistent stores %@.  It cannot perform a save operation.", v21];
        [a3 domain];
        [a3 code];
        [a3 userInfo];
        _NSCoreDataLog(1, @"Illegal attempt to save to a file that was never opened.  \"%@\".  Last recorded error = %@(%ld) / %@\n", v23, v24, v25, v26, v27, v28, (uint64_t)v9);
        return v9;
      }
      if (v20 > 0xFFFFFFFFFFFFFFB8) {
        goto LABEL_19;
      }
    }
    if (v16)
    {
      int v22 = [v16 integerValue];
      switch(v22)
      {
        case 3:
          if (a4) {
            *a4 = 5;
          }
          uint64_t v21 = @"(permission denied)";
          goto LABEL_34;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
          goto LABEL_31;
        case 10:
          if (a4) {
            *a4 = 8;
          }
          uint64_t v21 = @"(I/O error)";
          goto LABEL_34;
        case 11:
          goto LABEL_28;
        case 13:
          if (a4) {
            *a4 = 7;
          }
          uint64_t v21 = @"(disk full)";
          goto LABEL_34;
        case 14:
          if (a4) {
            *a4 = 6;
          }
          uint64_t v21 = @"(can't open)";
          goto LABEL_34;
        default:
          if (v22 == 23)
          {
            if (a4) {
              *a4 = 3;
            }
            uint64_t v21 = @"(device locked)";
          }
          else
          {
            if (v22 != 26) {
              goto LABEL_31;
            }
LABEL_28:
            if (a4) {
              *a4 = 1;
            }
            uint64_t v21 = @"(corrupt file)";
          }
          break;
      }
    }
    else
    {
LABEL_31:
      if (v19) {
        [v19 integerValue];
      }
      uint64_t v21 = @"(unknown)";
    }
    goto LABEL_34;
  }
  uint64_t v9 = (void *)[NSString stringWithFormat:@"This NSPersistentStoreCoordinator has no persistent stores %@.  It cannot perform a save operation.", @"(unknown)"];
  _NSCoreDataLog(1, @"Illegal attempt to save to a file that was never opened. \"%@\". No last error recorded.", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  return v9;
}

- (void)_introspectLastErrorAndThrow
{
  if (result)
  {
    int v2 = 0;
    uint64_t v1 = [result _exceptionNoStoreSaveFailureForError:result[9] recommendedFrame:&v2];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v1 userInfo:0]);
  }
  return result;
}

- (id)restoreOriginalRequestIfNecessary:(uint64_t)a3 store:(void *)a4 swizzledResults:(uint64_t)a5 originalRequestType:(uint64_t)a6 originalResultType:
{
  if (!a1) {
    return 0;
  }
  if (a3 && (*(unsigned char *)(a3 + 201) & 4) != 0) {
    return a4;
  }
  if (a5 == 5 && a6 != 1)
  {
    [a2 setResultType:a6];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "result"), "count");
    if (a6 == 2)
    {
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v8];
      if (v12)
      {
        uint64_t v9 = v12;
LABEL_27:
        uint64_t v13 = off_1E544AC58;
        goto LABEL_34;
      }
    }
    else if (!a6)
    {
      if (v8) {
        uint64_t v9 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v9 = MEMORY[0x1E4F1CC28];
      }
      goto LABEL_27;
    }
    return a4;
  }
  if (a5 != 6 || a6 == 1)
  {
    if (a5 != 7 || a6 == 1) {
      return a4;
    }
    [a2 setResultType:a6];
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "result"), "count");
    if (a6 == 2)
    {
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:v11];
      if (!v15) {
        return a4;
      }
      uint64_t v9 = v15;
    }
    else
    {
      if (a6) {
        return a4;
      }
      if (v11) {
        uint64_t v9 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v9 = MEMORY[0x1E4F1CC28];
      }
    }
    uint64_t v13 = off_1E544AC48;
  }
  else
  {
    [a2 setResultType:a6];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "result"), "count");
    if (a6 == 2)
    {
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:v10];
      if (!v14) {
        return a4;
      }
      uint64_t v9 = v14;
    }
    else
    {
      if (a6) {
        return a4;
      }
      if (v10) {
        uint64_t v9 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v9 = MEMORY[0x1E4F1CC28];
      }
    }
    uint64_t v13 = off_1E544AC68;
  }
LABEL_34:
  uint64_t v16 = (void *)[objc_alloc(*v13) initWithResultType:a6 andObject:v9];
  if (!v16) {
    return a4;
  }

  return v16;
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_2(uint64_t a1)
{
  v2[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(_NSQueryGenerationToken **)(a1 + 32);
  v2[0] = *(void *)(a1 + 40);
}

+ (BOOL)removeUbiquitousContentAndPersistentStoreAtURL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000;
  uint64_t v32 = __Block_byref_object_copy__18;
  uint64_t v33 = __Block_byref_object_dispose__18;
  uint64_t v34 = 0;
  if (![(NSDictionary *)options objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Must pass in a store name" userInfo:0]);
  }
  self;
  id v7 = -[PFUbiquityMetadataFactory newMetadataManagedObjectModel](_sharedFactory);
  uint64_t v8 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v7];
  uint64_t v9 = [[PFUbiquitySetupAssistant alloc] initWithPersistentStoreCoordinator:v8 andStoreOptions:options forPersistentStoreOfType:@"SQLite" atURL:storeURL];
  int v10 = -[PFUbiquitySetupAssistant validateOptionsWithError:]((uint64_t)v9, v30 + 5);
  *((unsigned char *)v36 + 24) = v10;
  if (!v10) {
    goto LABEL_21;
  }
  if (v9) {
    v9->_cacheFilePresenterForUbiquityRoot = 1;
  }
  int v11 = -[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]((uint64_t)v9, v30 + 5);
  *((unsigned char *)v36 + 24) = v11;
  if (v11)
  {
    if (v9) {
      uint64_t actualStoreFileURL = v9->_actualStoreFileURL;
    }
    else {
      uint64_t actualStoreFileURL = 0;
    }
    uint64_t v13 = actualStoreFileURL;
    uint64_t v14 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (objc_msgSend(v14, "fileExistsAtPath:", -[NSURL path](v13, "path"))
      && ![(NSPersistentStoreCoordinator *)v8 _destroyPersistentStoreAtURL:v13 withType:@"SQLite" options:options error:v30 + 5]&& +[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Couldn't delete store file: %@\n%@\nWill still try to nuke the container.", "+[NSPersistentStoreCoordinator removeUbiquitousContentAndPersistentStoreAtURL:options:error:]", 3662, v13, v30[5]);
    }
    if (v9) {
      ubiquityRootURL = v9->_ubiquityRootURL;
    }
    else {
      ubiquityRootURL = 0;
    }
    uint64_t v16 = ubiquityRootURL;
    uint64_t v17 = [(NSURL *)v16 URLByDeletingLastPathComponent];
    if (v9) {
      localPeerID = v9->_localPeerID;
    }
    else {
      localPeerID = 0;
    }
    uint64_t v19 = -[NSURL URLByAppendingPathComponent:](v17, "URLByAppendingPathComponent:", [NSString stringWithFormat:@"OldUbiquitousContent-%@", localPeerID]);
    unint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __93__NSPersistentStoreCoordinator_removeUbiquitousContentAndPersistentStoreAtURL_options_error___block_invoke;
    v24[3] = &unk_1E544CCE0;
    v24[4] = v14;
    v24[5] = &v25;
    v24[6] = &v35;
    v24[7] = &v29;
    [v20 coordinateWritingItemAtURL:v16 options:2 writingItemAtURL:v19 options:8 error:v30 + 5 byAccessor:v24];
    if (!*((unsigned char *)v36 + 24)
      && !*((unsigned char *)v26 + 24)
      && +[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  The coordinated write to remove the ubiquitous contents failed: %@", "+[NSPersistentStoreCoordinator removeUbiquitousContentAndPersistentStoreAtURL:options:error:]", 3695, v30[5]);
    }

    _Block_object_dispose(&v25, 8);
    uint64_t v21 = v13;
  }
  else
  {
LABEL_21:
    uint64_t v16 = 0;
    uint64_t v21 = 0;
  }

  char v22 = *((unsigned char *)v36 + 24);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v22;
}

void __93__NSPersistentStoreCoordinator_removeUbiquitousContentAndPersistentStoreAtURL_options_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a3, "path"))) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) removeItemAtURL:a3 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) moveItemAtURL:a2 toURL:a3 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) removeItemAtURL:a3 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to move content directory to new location: %@\nNew: %@\n%@", "+[NSPersistentStoreCoordinator removeUbiquitousContentAndPersistentStoreAtURL:options:error:]_block_invoke", 3688, a2, a3, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    }
  }
}

- (uint64_t)applyMigrationStage:(void *)a3 withContext:(void *)a4 error:
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  uint64_t v128 = 0;
  uint64_t v129 = &v128;
  uint64_t v130 = 0x2020000000;
  char v131 = 1;
  uint64_t v122 = 0;
  uint64_t v123 = &v122;
  uint64_t v124 = 0x3052000000;
  uint64_t v125 = __Block_byref_object_copy__18;
  uint64_t v126 = __Block_byref_object_dispose__18;
  uint64_t v127 = 0;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [a3 storeType];
  uint64_t v10 = [a3 storeURL];
  uint64_t v11 = [a3 options];
  objc_msgSend(a3, "setMetadata:", objc_msgSend(v8, "metadataForPersistentStoreOfType:URL:options:error:", v9, v10, v11, v123 + 5));
  uint64_t v12 = v123;
  if (v123[5])
  {
    *((unsigned char *)v129 + 24) = 0;
    id v13 = (id)v12[5];
  }
  if (!*((unsigned char *)v129 + 24)) {
    goto LABEL_92;
  }
  if (!a2) {
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a2 subsequentStage])
    {
      [a2 subsequentStage];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = (void *)[a2 subsequentStage];
        uint64_t v15 = (void *)[v14 currentModel];
        if ([v15 resolve:v123 + 5])
        {
          uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "currentModel"), "resolvedModel");
LABEL_15:
          uint64_t v19 = v16;
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      uint64_t v29 = [NSString stringWithUTF8String:"I don't know what to do with lightweight stages that aren't followed by a custom stage yet: %@"];
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)a2);
      uint64_t v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v133 = (const char *)a2;
        char v28 = "CoreData: I don't know what to do with lightweight stages that aren't followed by a custom stage yet: %@";
        goto LABEL_21;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = (void *)[a2 currentModel];
      if (![v17 resolve:v123 + 5]
        || (uint64_t v18 = (void *)[a2 nextModel], !objc_msgSend(v18, "resolve:", v123 + 5)))
      {
LABEL_22:
        *((unsigned char *)v129 + 24) = 0;
        id v36 = (id)v123[5];
        goto LABEL_23;
      }
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel"), "versionHash"), "isEqualToData:", objc_msgSend((id)objc_msgSend(a1, "managedObjectModel"), "versionHash")) & 1) == 0)
      {
        uint64_t v16 = objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel");
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"I don't know how to handle this type of stage yet: %@"];
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)a2);
      uint64_t v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v133 = (const char *)a2;
        char v28 = "CoreData: I don't know how to handle this type of stage yet: %@";
LABEL_21:
        _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
      }
    }
  }
LABEL_23:
  uint64_t v19 = 0;
LABEL_24:
  uint64_t v37 = objc_alloc_init(NSStoreMigrationPolicy);
  BOOL v39 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stagedMigrationManager"), "stages"), "lastObject") != a2
     || v19 != 0;
  BOOL v111 = v39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 willMigrateHandler])
  {
    long long v110 = a1;
    uint64_t v40 = a4;
    uint64_t v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "currentModel"), "resolvedModel"), "copy");
    id v42 = v41;
    if (v41)
    {
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      uint64_t v43 = [v41 countByEnumeratingWithState:&v118 objects:v137 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v119;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v119 != v44) {
              objc_enumerationMutation(v42);
            }
            uint64_t v46 = *(void *)(*((void *)&v118 + 1) + 8 * i);
            if (v46)
            {

              *(void *)(v46 + 48) = 0;
            }
          }
          uint64_t v43 = [v42 countByEnumeratingWithState:&v118 objects:v137 count:16];
        }
        while (v43);
      }
    }
    uint64_t v47 = [a3 stagedMigrationManager];
    a1 = v110;
    a4 = v40;
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke;
    v117[3] = &unk_1E544CD30;
    v117[4] = v47;
    v117[5] = a2;
    v117[6] = a3;
    v117[7] = &v122;
    v117[8] = &v128;
    -[NSPersistentStoreCoordinator createPersistentContainerForMigrationContext:withModel:andExecuteBlock:](a3, (uint64_t)v42, (uint64_t)v117);
  }
  if (*((unsigned char *)v129 + 24))
  {
    if (v19) {
      long long v48 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v19];
    }
    else {
      long long v48 = a1;
    }
    long long v49 = (void (*)(void))v48;
    long long v50 = v48;
    -[NSPersistentStoreCoordinator _setIsMigrating:](v49, 1);
    -[NSStoreMigrationPolicy setPersistentStoreCoordinator:sourceURL:configuration:metadata:options:](v37, v49, (void *)[a3 storeURL], objc_msgSend(a3, "configurationName"), objc_msgSend(a3, "metadata"), objc_msgSend(a3, "options"));
    char v51 = [a3 forceMigration];
    if (v37) {
      v37->_forcedMigratiouint64_t n = v51;
    }
    uint64_t v52 = [a2 label];
    if (v37)
    {
      uint64_t v53 = (void *)v52;
      stageLabel = v37->_stageLabel;
      if (stageLabel != (NSString *)v52)
      {

        v37->_stageLabel = 0;
        v37->_stageLabel = (NSString *)[v53 copy];
      }
    }
    uint64_t v55 = [a3 destinationConfigurationForCloudKitValidation];
    if (v37)
    {
      uint64_t v56 = (void *)v55;
      destinationConfigurationForCloudKitValidatiouint64_t n = v37->_destinationConfigurationForCloudKitValidation;
      if (destinationConfigurationForCloudKitValidation != (NSString *)v55)
      {

        v37->_destinationConfigurationForCloudKitValidatiouint64_t n = 0;
        v37->_destinationConfigurationForCloudKitValidatiouint64_t n = (NSString *)[v56 copy];
      }
    }
    uint64_t v58 = -[NSStoreMigrationPolicy _gatherDataAndPerformMigration:]((uint64_t)v37, v123 + 5);
    if (v58)
    {
      [a3 setMigratedStore:v58];
      id v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(a3, "storeURL"), @"storeURL", 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSPersistentStoreCoordinatorDidAutomigrateStoreNotification", a1, v59);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 didMigrateHandler])
      {
        uint64_t v60 = a1;
        uint64_t v61 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel"), "copy");
        uint64_t v62 = v61;
        if (v61)
        {
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          uint64_t v63 = [v61 countByEnumeratingWithState:&v113 objects:v136 count:16];
          if (v63)
          {
            uint64_t v64 = *(void *)v114;
            do
            {
              for (uint64_t j = 0; j != v63; ++j)
              {
                if (*(void *)v114 != v64) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v66 = *(void *)(*((void *)&v113 + 1) + 8 * j);
                if (v66)
                {

                  *(void *)(v66 + 48) = 0;
                }
              }
              uint64_t v63 = [v62 countByEnumeratingWithState:&v113 objects:v136 count:16];
            }
            while (v63);
          }
        }
        uint64_t v67 = [a3 stagedMigrationManager];
        a1 = v60;
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke_2;
        v112[3] = &unk_1E544CD30;
        v112[4] = v67;
        v112[5] = a2;
        v112[6] = a3;
        v112[7] = &v122;
        v112[8] = &v128;
        -[NSPersistentStoreCoordinator createPersistentContainerForMigrationContext:withModel:andExecuteBlock:](a3, (uint64_t)v62, (uint64_t)v112);
      }
      uint64_t v68 = [a3 ubiquitySetupAssistant];
      if (v68) {
        *(unsigned char *)(v68 + 276) = 1;
      }
      if (+[NSMappingModel migrationDebugLevel])
      {
        uint64_t v69 = [a3 storeURL];
        if (a2) {
          _NSCoreDataLog(4, @"(migration)\t Automatic schema migration succeeded for store at '%@' with migration stage: %@", v70, v71, v72, v73, v74, v75, v69);
        }
        else {
          _NSCoreDataLog(4, @"(migration)\t Automatic schema migration succeeded for store at '%@'", v70, v71, v72, v73, v74, v75, v69);
        }
      }
    }
    else
    {
      *((unsigned char *)v129 + 24) = 0;
      id v76 = (id)v123[5];
      if (v123[5]
        && +[NSStoreMigrationPolicy migrationDebugLevel] >= 1)
      {
        id v77 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        [v77 appendFormat:@"CoreData: error: (migration) migration failed with error %@", v123[5]];
        id v84 = (id)[(id)v123[5] userInfo];
        if (v84)
        {
          uint64_t v85 = *MEMORY[0x1E4F28A50];
          do
          {
            [v77 appendFormat:@"\nError User Info: %@", v84];
            uint64_t v86 = [v84 objectForKey:v85];
            uint64_t v87 = (void *)v86;
            if (!v86) {
              break;
            }
            [v77 appendFormat:@"\nUnderlying error: %@", v86];
            id v84 = (id)[v87 userInfo];
          }
          while (v84);
        }
        _NSCoreDataLog(1, @"%@", v78, v79, v80, v81, v82, v83, (uint64_t)v77);
      }
    }
  }
  if (v111) {
    -[NSPersistentStoreCoordinator _removePersistentStore:]((unint64_t)a1, (unint64_t *)objc_msgSend(a1, "persistentStoreForURL:", objc_msgSend(a3, "storeURL")));
  }
  if (a2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v88 = objc_msgSend((id)objc_msgSend(a2, "subsequentStage"), "currentModel");
LABEL_89:
      [v88 unresolve];
      goto LABEL_92;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend((id)objc_msgSend(a2, "currentModel"), "unresolve");
      unint64_t v88 = (void *)[a2 nextModel];
      goto LABEL_89;
    }
    uint64_t v89 = [NSString stringWithUTF8String:"I don't know how to handle this stage type %@"];
    uint64_t v90 = objc_opt_class();
    _NSCoreDataLog(17, v89, v91, v92, v93, v94, v95, v96, v90);
    long long v97 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v109 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v133 = (const char *)v109;
      _os_log_fault_impl(&dword_18AB82000, v97, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle this stage type %@", buf, 0xCu);
    }
  }
LABEL_92:
  if (!*((unsigned char *)v129 + 24))
  {
    [a3 setMigratedStore:0];
    id v100 = (id)v123[5];
    if (v100)
    {
      if (a4) {
        *a4 = v100;
      }
    }
    else
    {
      uint64_t v101 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v101, v102, v103, v104, v105, v106, v107, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      long long v108 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v133 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v134 = 1024;
        int v135 = 4121;
        _os_log_fault_impl(&dword_18AB82000, v108, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v123[5] = 0;
  uint64_t v98 = *((unsigned __int8 *)v129 + 24);
  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v128, 8);
  return v98;
}

- (void)createPersistentContainerForMigrationContext:(void *)a1 withModel:(uint64_t)a2 andExecuteBlock:(uint64_t)a3
{
  uint64_t v6 = (void *)MEMORY[0x18C127630]();
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__18;
  uint64_t v17 = __Block_byref_object_dispose__18;
  uint64_t v18 = 0;
  id v7 = +[NSPersistentContainer persistentContainerWithPath:managedObjectModel:](NSPersistentContainer, "persistentContainerWithPath:managedObjectModel:", objc_msgSend((id)objc_msgSend(a1, "storeURL"), "path"), a2);
  id v8 = [(NSArray *)[(NSPersistentContainer *)v7 persistentStoreDescriptions] firstObject];
  objc_msgSend(v8, "setType:", objc_msgSend(a1, "storeType"));
  objc_msgSend(v8, "setConfiguration:", objc_msgSend(a1, "configurationName"));
  uint64_t v9 = (void *)[a1 options];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke;
  v12[3] = &unk_1E544CD08;
  v12[4] = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
  [v8 setShouldMigrateStoreAutomatically:0];
  [v8 setShouldInferMappingModelAutomatically:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke_2;
  v11[3] = &unk_1E544BB78;
  v11[4] = &v19;
  void v11[5] = &v13;
  [(NSPersistentContainer *)v7 loadPersistentStoresWithCompletionHandler:v11];
  if (*((unsigned char *)v20 + 24))
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v7 = 0;
    uint64_t v10 = v14[5];
  }
  (*(void (**)(uint64_t, NSPersistentContainer *, uint64_t))(a3 + 16))(a3, v7, v10);

  v14[5] = 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

uint64_t __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setOption:a3 forKey:a2];
}

void *__103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke_2(void *result, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v3 = result;
    *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 0;
    id result = a3;
    *(void *)(*(void *)(v3[5] + 8) + 40) = result;
  }
  return result;
}

id __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [*(id *)(a1 + 32) setContainer:a2];
    uint64_t v4 = [*(id *)(a1 + 40) willMigrateHandler];
    if (((*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v4 + 16))(v4, [*(id *)(a1 + 48) stagedMigrationManager], *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 56) + 8) + 40) & 1) == 0)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = @"offendingStage";
        v11[0] = v9;
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v8, @"willMigrate must return YES or NO with an error", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      id v5 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    uint64_t v6 = *(void **)(a1 + 32);
    return (id)[v6 setContainer:0];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (void)_setIsMigrating:(void *)(a1
{
  if (a1)
  {
    v2[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v2[1] = (void (*)(void))3221225472;
    void v2[2] = (void (*)(void))__68__NSPersistentStoreCoordinator__NSInternalMethods___setIsMigrating___block_invoke;
    v2[3] = (void (*)(void))&unk_1E544C770;
    v2[4] = a1;
    char v3 = a2;
    _perform_0((unint64_t)a1, v2);
  }
}

id __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [*(id *)(a1 + 32) setContainer:a2];
    uint64_t v4 = [*(id *)(a1 + 40) didMigrateHandler];
    if (((*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v4 + 16))(v4, [*(id *)(a1 + 48) stagedMigrationManager], *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 56) + 8) + 40) & 1) == 0)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = @"offendingStage";
        v11[0] = v9;
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v8, @"didMigrate must return YES or NO with an error", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      id v5 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    uint64_t v6 = *(void **)(a1 + 32);
    return (id)[v6 setContainer:0];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  return -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:error:](self, (char *)a3, a4, 0);
}

+ (uint64_t)_shouldDebugAllTaskAssertions
{
  return (char)+[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.PowerAssertionsDebug");
}

void __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

- (id)_lastOpenError
{
  if (result)
  {
    id v1 = result[9];
    return (id *)v1;
  }
  return result;
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x3052000000;
  uint64_t v40 = __Block_byref_object_copy__18;
  uint64_t v41 = __Block_byref_object_dispose__18;
  uint64_t v42 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3052000000;
  uint64_t v34 = __Block_byref_object_copy__18;
  uint64_t v35 = __Block_byref_object_dispose__18;
  uint64_t v36 = 0;
  uint64_t v11 = (void (*)(void))[a4 persistentStore];
  uint64_t v30 = 0;
  if (a5) {
    uint64_t v12 = *((void *)a5 + 20);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = +[NSQueryGenerationToken currentQueryGenerationToken];
  if (v13 != (NSQueryGenerationToken *)[a5 _queryGenerationToken]) {
    goto LABEL_4;
  }
  id v18 = [(NSPersistentStoreCoordinator *)self _retainedCurrentQueryGeneration:v12];
  if (!v18)
  {
    uint64_t v20 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134502 userInfo:0];
    uint64_t v30 = v20;
    if (!v20)
    {
LABEL_12:
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      char v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v45 = 1024;
        int v46 = 4741;
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      goto LABEL_17;
    }
LABEL_15:
    if (a6)
    {
      uint64_t v16 = 0;
      *a6 = v20;
      goto LABEL_8;
    }
LABEL_17:
    uint64_t v16 = 0;
    goto LABEL_8;
  }
  char v19 = [a5 _setQueryGenerationFromToken:v18 error:&v30];

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = v30;
    if (!v30) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
LABEL_4:
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __136__NSPersistentStoreCoordinator__NSInternalMethods___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke;
  v29[3] = &unk_1E544CD80;
  v29[4] = self;
  v29[5] = a5;
  v29[6] = a3;
  v29[7] = a4;
  v29[8] = &v37;
  v29[9] = &v31;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v29, v11);
  id v14 = (id)v32[5];
  if (a6)
  {
    uint64_t v15 = (void *)v32[5];
    if (v15) {
      *a6 = v15;
    }
  }
  uint64_t v16 = (void *)v38[5];
LABEL_8:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v16;
}

id __136__NSPersistentStoreCoordinator__NSInternalMethods___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke(uint64_t a1, void *a2)
{
  void v7[5] = *MEMORY[0x1E4F143B8];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = @"Reason";
    v6[1] = @"store";
    v7[0] = @"Store is not valid for this context's generation";
    v7[1] = a2;
    v6[2] = @"context";
    void v7[2] = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
    id result = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v5];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = result;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [a2 _newOrderedRelationshipInformationForRelationship:*(void *)(a1 + 48) forObjectWithID:*(void *)(a1 + 56) withContext:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__18;
  uint64_t v23 = __Block_byref_object_dispose__18;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__18;
  uint64_t v17 = __Block_byref_object_dispose__18;
  uint64_t v18 = 0;
  uint64_t v9 = (void (*)(void))[a3 persistentStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__NSPersistentStoreCoordinator__NSInternalMethods___allOrderKeysForDestination_inRelationship_error___block_invoke;
  v12[3] = &unk_1E544CDA8;
  v12[4] = a3;
  void v12[5] = a4;
  v12[6] = &v19;
  v12[7] = &v13;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((void (*)(void))self, (uint64_t)v12, v9);
  if (a5) {
    *a5 = (id)v14[5];
  }
  id v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

id __101__NSPersistentStoreCoordinator__NSInternalMethods___allOrderKeysForDestination_inRelationship_error___block_invoke(void *a1, void *a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[a2 _allOrderKeysForDestination:a1[4] inRelationship:a1[5] error:*(void *)(a1[7] + 8) + 40];
  return *(id *)(*(void *)(a1[7] + 8) + 40);
}

- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return 1;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = *(void *)v40;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v40 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v11 = [*(id *)(*((void *)&v39 + 1) + 8 * i) managedObjectContext];
      uint64_t v12 = (void *)v11;
      if (v11)
      {
        uint64_t v38 = 0;
        if (_PF_Threading_Debugging_level) {
          _PFAssertSafeMultiThreadedAccess_impl(v11, a2);
        }
        uint64_t v32 = 0;
        uint64_t v33 = &v32;
        uint64_t v34 = 0x3052000000;
        uint64_t v35 = __Block_byref_object_copy__18;
        uint64_t v36 = __Block_byref_object_dispose__18;
        uint64_t v37 = 0;
        uint64_t v28 = 0;
        uint64_t v29 = &v28;
        uint64_t v30 = 0x2020000000;
        char v31 = 0;
        uint64_t v16 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Executing obtain objectID request", &v38);
        uint64_t v27 = 0;
        uint64_t v17 = v12[20];
        uint64_t v18 = +[NSQueryGenerationToken currentQueryGenerationToken];
        if (v18 != (NSQueryGenerationToken *)[v12 _queryGenerationToken]) {
          goto LABEL_22;
        }
        id v19 = [(NSPersistentStoreCoordinator *)self _retainedCurrentQueryGeneration:v17];
        if (v19)
        {
          char v20 = [v12 _setQueryGenerationFromToken:v19 error:&v27];

          if (v20)
          {
LABEL_22:
            v25[0] = 0;
            v25[1] = v25;
            void v25[2] = 0x3052000000;
            v25[3] = __Block_byref_object_copy__18;
            v25[4] = __Block_byref_object_dispose__18;
            uint64_t v26 = 0;
            uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __87__NSPersistentStoreCoordinator__NSInternalMethods__obtainPermanentIDsForObjects_error___block_invoke;
            v24[3] = &unk_1E544CE20;
            v24[4] = v17;
            v24[5] = self;
            v24[6] = a3;
            v24[7] = v12;
            void v24[8] = &v32;
            v24[9] = v25;
            v24[10] = &v28;
            -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((void (*)(void))self, (uint64_t)v24);
            _Block_object_dispose(v25, 8);
            +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v38, v16);
            id v21 = (id)v33[5];
            if (a4)
            {
              uint64_t v22 = (void *)v33[5];
              if (v22) {
                *a4 = v22;
              }
            }
            BOOL v15 = *((unsigned char *)v29 + 24) != 0;
            _Block_object_dispose(&v28, 8);
            _Block_object_dispose(&v32, 8);
            return v15;
          }
        }
        else
        {
          uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134502 userInfo:0];
        }
        objc_msgSend(v12, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"), 0);
        goto LABEL_22;
      }
    }
    uint64_t v8 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_10:
  if (!a4) {
    return 0;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:@"NSManagedObjectContext is nil for objects passed to obtainPermanentIDsForObjects"];
  BOOL v15 = 0;
  *a4 = (id)[v13 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v14];
  return v15;
}

void __87__NSPersistentStoreCoordinator__NSInternalMethods__obtainPermanentIDsForObjects_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) count]) {
    goto LABEL_14;
  }
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v49 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v6 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v6, "identifier"))) {
          [v34 addObject:v6];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v3);
  }
  if (v34)
  {
    uint64_t v33 = v34;
    if (![v34 count])
    {
LABEL_56:
      id v32 = objc_retain(+[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], 134020, @"Can't resolve how to assign objects to stores; Coordinator does not have any stores",
                0));
      objc_exception_throw(v32);
    }
  }
  else
  {
LABEL_14:
    uint64_t v33 = a2;
    id v34 = 0;
  }
  if (![a2 count]) {
    goto LABEL_56;
  }
  id v7 = 0;
  char v8 = 1;
  do
  {
    -[NSPersistentStoreCoordinator _doPreSaveAssignmentsForObjects:intoStores:](*(void *)(a1 + 40), *(void **)(a1 + 48), v33);
    if (v7) {

    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          uint64_t v14 = (void *)[v13 objectID];
          if ([v14 isTemporaryID])
          {
            uint64_t v15 = [v14 persistentStore];
            if (v15)
            {
              id v16 = (id)[v7 objectForKey:v15];
              if (!v16)
              {
                id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v7 setObject:v16 forKey:v15];
              }
              [v16 addObject:v13];
            }
            else
            {
              char v8 = 0;
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v10);
    }
    char v17 = v8;
    char v8 = 0;
  }
  while ((v17 & 1) == 0);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v18 = [v7 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v41;
LABEL_35:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v41 != v19) {
        objc_enumerationMutation(v7);
      }
      id v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
      uint64_t v22 = (void *)[v7 objectForKey:v21];
      uint64_t v23 = (void *)[v21 obtainPermanentIDsForObjects:v22 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
      uint64_t v24 = v23;
      if (!v23) {
        break;
      }
      if ([v23 count])
      {
        uint64_t v25 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](*(void *)(a1 + 56), v22, v24);
        if (v25)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v25];
        }
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v7 countByEnumeratingWithState:&v40 objects:v53 count:16];
        if (v18) {
          goto LABEL_35;
        }
        goto LABEL_44;
      }
    }
  }
  else
  {
LABEL_44:
    LODWORD(v24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }

  id v26 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
  {
    uint64_t v27 = (void *)MEMORY[0x18C127630]();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", *(void *)(*((void *)&v36 + 1) + 8 * k));
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v52 count:16];
      }
      while (v29);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeAllObjects];
  }
  if (v24) {
    objc_exception_rethrow();
  }
}

- (uint64_t)_newConflictRecordForObject:(unint64_t)a3 andOriginalRow:(void *)a4 withContext:
{
  if (result)
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    if (a3 && [a2 managedObjectContext])
    {
      uint64_t v6 = (void *)[v5 entity];
      long long v40 = (void *)[v5 objectID];
      uint64_t v7 = [v40 persistentStore];
      char v8 = (void *)v7;
      if (v7) {
        uint64_t v38 = *(void *)(v7 + 48);
      }
      else {
        uint64_t v38 = 0;
      }
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v6, "propertiesByName"), "values");
      uint64_t v10 = [NSKnownKeysDictionary alloc];
      long long v39 = v8;
      if (v6) {
        uint64_t v11 = v6[13];
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = [(NSKnownKeysDictionary *)v10 initWithSearchStrategy:v11];
      uint64_t v36 = [(NSKnownKeysDictionary *)v12 values];
      uint64_t v13 = [(id)v4 knownKeyValuesPointer];
      uint64_t v14 = [(NSKnownKeysMappingStrategy *)[(NSKnownKeysDictionary *)v12 mapping] keys];
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      id v16 = (void *)v6[14];
      unint64_t v17 = v16[6];
      uint64_t v18 = v16[7];
      long long v37 = v12;
      if (v17 < v18 + v17)
      {
        uint64_t v34 = v9;
        uint64_t v19 = (void *)(v14 + 8 * v17);
        uint64_t v20 = (void *)(v36 + 8 * v17);
        id v21 = (void **)(v13 + 8 * v17);
        do
        {
          if (v13) {
            uint64_t v22 = *v21;
          }
          else {
            uint64_t v22 = (void *)[(id)v4 valueForKey:*v19];
          }
          id v23 = (id)v15;
          if (v22) {
            id v23 = v22;
          }
          *v20++ = v23;
          ++v19;
          ++v21;
          --v18;
        }
        while (v18);
        id v16 = (void *)v6[14];
        uint64_t v12 = v37;
        uint64_t v9 = v34;
      }
      unint64_t v24 = v16[12];
      uint64_t v25 = v16[13];
      if (v24 < v25 + v24)
      {
        uint64_t v35 = v5;
        id v26 = (void *)(v9 + 8 * v24);
        uint64_t v27 = (uint64_t *)(v36 + 8 * v24);
        uint64_t v28 = (void **)(v13 + 8 * v24);
        do
        {
          if (v13) {
            uint64_t v29 = *v28;
          }
          else {
            uint64_t v29 = (void *)[v39 newValueForRelationship:*v26 forObjectWithID:v40 withContext:a4 error:0];
          }
          uint64_t v30 = v15;
          if (v29)
          {
            id v31 = (_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88
                ? v29
                : -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a4, v29, v38);
            uint64_t v30 = (uint64_t)v31;
            if (!v13) {
          }
            }
          *v27++ = v30;
          ++v26;
          ++v28;
          --v25;
        }
        while (v25);
        uint64_t v5 = v35;
        uint64_t v12 = v37;
      }
    }
    else
    {
      uint64_t v12 = (NSKnownKeysDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    id v32 = [NSMergeConflict alloc];
    if (v4) {
      unint64_t v4 = [(id)v4 _versionNumber];
    }
    uint64_t v33 = -[NSMergeConflict initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:](v32, "initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:", v5, v4, [v5 _versionReference], v12, 0);

    return v33;
  }
  return result;
}

- (const)_storeClassForStoreWithType:(const char *)result URL:(uint64_t)a2 options:(void *)a3
{
  if (result)
  {
    unint64_t v4 = (char *)result;
    id result = (const char *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, a2);
    if (!result
      && (![v4 persistentStoreForURL:a3] || (id result = (const char *)objc_opt_class()) == 0))
    {
      return +[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, a3);
    }
  }
  return result;
}

- (void)_copyMetadataFromStore:(void *)a3 toStore:(uint64_t)a4 migrationManager:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = (void *)[a2 metadata];
    uint64_t v7 = (void *)[a3 metadata];
    char v8 = (void *)[v6 mutableCopyWithZone:0];
    uint64_t v9 = v8;
    if (!a4) {
      [v8 removeObjectForKey:@"NSStoreUUID"];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"NSStoreModelVersionHashesVersion", @"NSStoreModelVersionHashes", @"NSStoreModelVersionIdentifiers", @"NSPersistenceFrameworkVersion", 0, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v16 = [v7 objectForKey:v15];
          [v9 removeObjectForKey:v15];
          if (v16) {
            [v9 setObject:v16 forKey:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    [a3 setMetadata:v9];
  }
}

uint64_t __68__NSPersistentStoreCoordinator__NSInternalMethods___setIsMigrating___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 24) = *(_WORD *)(*(void *)(result + 32) + 24) & 0xFBFF | (*(unsigned __int8 *)(result + 40) << 10);
  return result;
}

- (void)_setIsRegisteredWithUbiquity:(void *)(a1
{
  if (a1)
  {
    v2[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v2[1] = (void (*)(void))3221225472;
    void v2[2] = (void (*)(void))__81__NSPersistentStoreCoordinator__NSInternalMethods___setIsRegisteredWithUbiquity___block_invoke;
    v2[3] = (void (*)(void))&unk_1E544C770;
    v2[4] = a1;
    char v3 = a2;
    _perform_0((unint64_t)a1, v2);
  }
}

uint64_t __81__NSPersistentStoreCoordinator__NSInternalMethods___setIsRegisteredWithUbiquity___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 24) = *(_WORD *)(*(void *)(result + 32) + 24) & 0xFFFE | *(unsigned __int8 *)(result + 40);
  return result;
}

+ (id)ubiquityStoreURLForStoreURL:(id)a3 ubiquityIdentityToken:(id)a4 ubiquityName:(id)a5
{
  self;
  char v8 = 0;
  uint64_t v9 = +[PFUbiquitySetupAssistant findContainerIDForToken:storeName:haveExistingMappings:]((uint64_t)PFUbiquitySetupAssistant, (uint64_t)a4, (uint64_t)a5, 0);
  uint64_t v10 = (__CFString *)v9;
  if (a4 && v9 || !((unint64_t)a4 | v9))
  {
    char v8 = +[PFUbiquitySetupAssistant createDefaultLocalPeerID]();
    id v11 = +[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]((uint64_t)PFUbiquitySetupAssistant, a3, (uint64_t)v8, v10, (uint64_t)a5);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)currentQueryGenerationTokenFromStores:(id)a3
{
  id v3 = [(NSPersistentStoreCoordinator *)self _retainedCurrentQueryGeneration:a3];

  return v3;
}

- (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 storeType:(id)a7 error:(id *)a8
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    id v23 = @"Invalid destination store URL: nil";
    goto LABEL_14;
  }
  if (!a5)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    id v23 = @"Invalid source store URL: nil";
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0, a6, a7, a8));
  }
  if (objc_msgSend(a5, "isEqual:")) {
    return 1;
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000;
  id v32 = __Block_byref_object_copy__18;
  uint64_t v33 = __Block_byref_object_dispose__18;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v16 = [(NSPersistentStoreCoordinator *)self persistentStoreForURL:a3];
  if (v16)
  {
    long long v17 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v35 = @"removed";
    v36[0] = v16;
    objc_msgSend(v17, "postNotificationName:object:userInfo:", @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
  }
  v24[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v24[1] = (void (*)(void))3221225472;
  v24[2] = (void (*)(void))__182__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error___block_invoke;
  v24[3] = (void (*)(void))&unk_1E544CE48;
  v24[4] = (void (*)(void))self;
  v24[5] = (void (*)(void))a7;
  v24[6] = (void (*)(void))a5;
  v24[7] = (void (*)(void))a6;
  void v24[8] = (void (*)(void))a3;
  v24[9] = (void (*)(void))a4;
  v24[10] = (void (*)(void))&v29;
  void v24[11] = (void (*)(void))&v25;
  v24[12] = (void (*)(void))a8;
  _perform_0((unint64_t)self, v24);
  id v18 = (id)v30[5];
  if (a8)
  {
    long long v19 = (void *)v30[5];
    if (v19) {
      *a8 = v19;
    }
  }
  BOOL v15 = *((unsigned char *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v15;
}

id __182__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error___block_invoke(uint64_t a1)
{
  int v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48));
  if (!v2) {
    int v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 64));
  }
  id v3 = (void *)[*(id *)(a1 + 32) persistentStoreForURL:*(void *)(a1 + 64)];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    if (!-[NSPersistentStoreCoordinator _removePersistentStore:error:](*(void (**)(void))(a1 + 32), v3, (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (void *)[*(id *)(a1 + 32) persistentStoreForURL:*(void *)(a1 + 48)];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = (void *)[*(id *)(a1 + 56) objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
    if (v7) {
      int v8 = [v7 BOOLValue];
    }
    else {
      int v8 = 0;
    }
    if (objc_msgSend((id)objc_msgSend(v5, "type"), "isEqual:", @"SQLite")) {
      -[NSSQLCore _disconnectAllConnections]((uint64_t)v5);
    }
    if (v4 && v6 && v4 != v6)
    {
      uint64_t v19 = [NSString stringWithFormat:@"source and destination store are different classes of store: %@ != %@", v4, v6];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0]);
    }
  }
  else
  {
    int v8 = 0;
  }
  if (v2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v2 _replacePersistentStoreAtURL:*(void *)(a1 + 64) destinationOptions:*(void *)(a1 + 72) withPersistentStoreFromURL:*(void *)(a1 + 48) sourceOptions:*(void *)(a1 + 56) error:*(void *)(*(void *)(a1 + 80) + 8) + 40];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [*(id *)(a1 + 32) setURL:*(void *)(a1 + 64) forPersistentStore:v5];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      BOOL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *(void *)(a1 + 48), *(void *)(a1 + 64), 0);
      uint64_t v18 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, *MEMORY[0x1E4F289D0], 0);
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [v15 errorWithDomain:*MEMORY[0x1E4F281F8] code:134080 userInfo:v18];
    }
  }
LABEL_25:
  id result = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
    && *(void *)(a1 + 96)
    && !*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *(void *)(a1 + 48), *(void *)(a1 + 64), 0);
    uint64_t v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E4F289D0], 0);
    id result = (id)[v11 errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v14];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 options:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Invalid store URL: nil", 0, a6));
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__18;
  id v26 = __Block_byref_object_dispose__18;
  uint64_t v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v11 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:");
  if (v11)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    char v28 = @"removed";
    v29[0] = v11;
    objc_msgSend(v12, "postNotificationName:object:userInfo:", @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
  }
  v17[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v17[1] = (void (*)(void))3221225472;
  v17[2] = (void (*)(void))__129__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___destroyPersistentStoreAtURL_withType_options_error___block_invoke;
  v17[3] = (void (*)(void))&unk_1E544CE70;
  v17[4] = (void (*)(void))self;
  v17[5] = (void (*)(void))a4;
  v17[6] = (void (*)(void))a3;
  v17[7] = (void (*)(void))a5;
  v17[8] = (void (*)(void))&v22;
  v17[9] = (void (*)(void))&v18;
  v17[10] = (void (*)(void))a6;
  _perform_0((unint64_t)self, v17);
  id v13 = (id)v23[5];
  if (a6)
  {
    uint64_t v14 = (void *)v23[5];
    if (v14) {
      *a6 = v14;
    }
  }
  char v15 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v15;
}

id __129__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___destroyPersistentStoreAtURL_withType_options_error___block_invoke(uint64_t a1)
{
  int v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48));
  id v3 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = (void *)[*(id *)(a1 + 32) persistentStoreForURL:*(void *)(a1 + 48)];
  if (v7) {
    BOOL v8 = !-[NSPersistentStoreCoordinator _removePersistentStore:error:](*(void (**)(void))(a1 + 32), v7, (void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  [v6 drain];
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v8)
  {
    if (v2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v2 _destroyPersistentStoreAtURL:*(void *)(a1 + 48) options:*(void *)(a1 + 56) error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
    }
    else if (*(void *)(a1 + 80))
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 48), *MEMORY[0x1E4F289D0], 0);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [v11 errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v12];
    }
  }

  return *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
}

- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5
{
  return [(NSPersistentStoreCoordinator *)self _destroyPersistentStoreAtURL:a3 withType:a4 options:0 error:a5];
}

- (BOOL)_rekeyPersistentStoreAtURL:(id)a3 type:(id)a4 options:(id)a5 withKey:(id)a6 error:(id *)a7
{
  v49[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Invalid store URL: nil", 0, a6, a7));
  }
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3052000000;
  long long v41 = __Block_byref_object_copy__18;
  long long v42 = __Block_byref_object_dispose__18;
  uint64_t v43 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000;
  uint64_t v31 = __Block_byref_object_copy__18;
  id v32 = __Block_byref_object_dispose__18;
  uint64_t v33 = 0;
  uint64_t v33 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:");
  if (v29[5])
  {
    id v13 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v14 = v29[5];
    long long v48 = @"removed";
    v49[0] = v14;
    objc_msgSend(v13, "postNotificationName:object:userInfo:", @"_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1));
  }
  v27[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v27[1] = (void (*)(void))3221225472;
  v27[2] = (void (*)(void))__131__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___rekeyPersistentStoreAtURL_type_options_withKey_error___block_invoke;
  v27[3] = (void (*)(void))&unk_1E544CE98;
  v27[4] = (void (*)(void))self;
  v27[5] = (void (*)(void))a4;
  v27[6] = (void (*)(void))a3;
  v27[7] = (void (*)(void))a5;
  v27[10] = (void (*)(void))&v38;
  v27[11] = (void (*)(void))&v34;
  v27[8] = (void (*)(void))a6;
  void v27[9] = (void (*)(void))&v28;
  v27[12] = (void (*)(void))a7;
  _perform_0((unint64_t)self, v27);
  id v15 = (id)v39[5];
  if (!*((unsigned char *)v35 + 24))
  {
    uint64_t v18 = (void *)v39[5];
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
    }
    else
    {
      uint64_t v19 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      id v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v45 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v46 = 1024;
        int v47 = 6201;
        _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  char v16 = *((unsigned char *)v35 + 24);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  return v16;
}

id __131__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___rekeyPersistentStoreAtURL_type_options_withKey_error___block_invoke(uint64_t a1)
{
  int v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48));
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v4) {
    BOOL v5 = !-[NSPersistentStoreCoordinator _removePersistentStore:error:](*(void (**)(void))(a1 + 32), v4, (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  [v3 drain];
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v10 = *(void *)(v8 + 40);
    uint64_t v9 = v8 + 40;
    if (!v10)
    {
      if (v2)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v2 _rekeyPersistentStoreAtURL:*(void *)(a1 + 48) options:*(void *)(a1 + 56) withKey:*(void *)(a1 + 64) error:v9];
      }
      else if (*(void *)(a1 + 96))
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 48), *MEMORY[0x1E4F289D0], 0);
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = [v12 errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v13];
      }
    }
  }
  return *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (id)_reopenQueryGenerationWithIdentifier:(void *)(a1 inStoreWithIdentifier:error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__18;
  uint64_t v21 = __Block_byref_object_dispose__18;
  uint64_t v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__18;
  id v15 = __Block_byref_object_dispose__18;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __115__NSPersistentStoreCoordinator_QueryGenerations___reopenQueryGenerationWithIdentifier_inStoreWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E544CEE8;
  v10[4] = a3;
  v10[5] = a2;
  v10[6] = &v17;
  v10[7] = &v11;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:](a1, (uint64_t)v10);
  BOOL v5 = v12;
  id v6 = (void *)v12[5];
  if (v6)
  {
    if (a4)
    {
      *a4 = v6;
      id v6 = (void *)v5[5];
    }
    id v7 = v6;
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

uint64_t __115__NSPersistentStoreCoordinator_QueryGenerations___reopenQueryGenerationWithIdentifier_inStoreWithIdentifier_error___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_msgSend((id)objc_msgSend(v8, "identifier"), "isEqual:", a1[4]))
        {
          *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[v8 reopenQueryGenerationWithIdentifier:a1[5] error:*(void *)(a1[7] + 8) + 40];
          uint64_t v9 = *(void **)(*(void *)(a1[7] + 8) + 40);
          if (v9) {
            id v10 = v9;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)_refreshTriggerValuesInStore:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000;
  id v26 = __Block_byref_object_copy__18;
  uint64_t v27 = __Block_byref_object_dispose__18;
  uint64_t v28 = 0;
  uint64_t v7 = (NSPersistentStoreCoordinator *)[a3 _persistentStoreCoordinator];
  if (v7 != self)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Provided persistent store must be from this coordinator: %@\n%@\n%@", self, v7, a3];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0]);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Provided persistent store must be of type NSSQLiteStoreType: %@", a3];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0]);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__NSPersistentStoreCoordinator_Triggers___refreshTriggerValuesInStore_error___block_invoke;
  v22[3] = &unk_1E544CF38;
  v22[4] = a3;
  v22[5] = &v29;
  v22[6] = &v23;
  [(NSPersistentStoreCoordinator *)self performBlockAndWait:v22];
  id v8 = (id)v24[5];
  if (!*((unsigned char *)v30 + 24))
  {
    long long v11 = (void *)v24[5];
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        __int16 v35 = 1024;
        int v36 = 6379;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  char v9 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v9;
}

id __77__NSPersistentStoreCoordinator_Triggers___refreshTriggerValuesInStore_error___block_invoke(uint64_t *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = -[NSSQLCore _refreshTriggerValues:](a1[4], (id *)(*(void *)(a1[6] + 8) + 40));
  int v2 = *(void **)(*(void *)(a1[6] + 8) + 40);

  return v2;
}

+ (BOOL)removePersistentHistoryFromPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (([a3 isFileURL] & 1) == 0)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F28328];
    if ([a3 path]) {
      uint64_t v22 = [a3 path];
    }
    else {
      uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
    }
    v30[0] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    objc_exception_throw((id)[v21 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid store URL" userInfo:v23]);
  }
  objc_opt_class();
  objc_opt_class();
  id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v24 = 0;
  char v9 = (char *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, a3);
  if (v9)
  {
    if (objc_opt_respondsToSelector())
    {
      char v10 = [v9 dropPersistentHistoryforPersistentStoreWithURL:a3 options:a4 error:&v24];
      goto LABEL_15;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28328];
    if (objc_msgSend(a3, "path", v24)) {
      uint64_t v14 = [a3 path];
    }
    else {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v28 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v16 = (void *)[v13 errorWithDomain:*MEMORY[0x1E4F281F8] code:134091 userInfo:v15];
  }
  else
  {
    if (!a5) {
      goto LABEL_18;
    }
    long long v11 = (void *)MEMORY[0x1E4F28C58];
    if (objc_msgSend(a3, "path", v24, *MEMORY[0x1E4F28328])) {
      uint64_t v12 = [a3 path];
    }
    else {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v26 = v12;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v16 = (void *)[v11 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v17];
  }
  char v10 = 0;
  id v24 = v16;
LABEL_15:
  if (!a5 || (v10 & 1) != 0) {
    goto LABEL_19;
  }
  id v18 = v24;
LABEL_18:
  char v10 = 0;
LABEL_19:
  objc_msgSend(v8, "drain", v24);
  if (a5) {
    char v19 = v10;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0) {
    *a5 = v24;
  }
  return v10;
}

- (os_unfair_lock_s)_xpcBundleIdentifier
{
  if (result)
  {
    id v1 = result;
    int v2 = result + 8;
    os_unfair_lock_lock_with_options();
    id v3 = *(id *)&v1[20]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (os_unfair_lock_s)_xpcProcessName
{
  if (result)
  {
    id v1 = result;
    int v2 = result + 8;
    os_unfair_lock_lock_with_options();
    id v3 = *(id *)&v1[22]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

id __113__NSPersistentStoreCoordinator_DeferredLightweightMigration___finishDeferredLightweightMigrationTasks_withError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = objc_msgSend(*(id *)(a1 + 32), "persistentStores", 0);
  id result = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (([*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) finishDeferredLightweightMigration:*(unsigned __int8 *)(a1 + 56) withError:*(void *)(*(void *)(a1 + 40) + 8) + 40] & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          return *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (uint64_t)_handleFaultingError:(uint64_t)a3 fromContext:
{
  if (result)
  {
    uint64_t v5 = [(id)result delegate];
    if (v5 && (uint64_t v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) != 0))
    {
      return [v6 handleFaultingError:a2 fromContext:a3];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end