@interface NSManagedObjectContext
+ (BOOL)accessInstanceVariablesDirectly;
+ (NSManagedObjectContext)alloc;
+ (NSManagedObjectContext)allocWithZone:(_NSZone *)a3;
+ (id)createFutureForFileAtURL:(id)a3;
+ (uint64_t)_handleError:(uint64_t *)a3 withError:;
+ (void)_mergeChangesFromRemoteContextSave:(id)a3 intoContexts:(id)a4;
+ (void)_mergeChangesFromRemoteContextSave:(void *)a3 intoContexts:(uint64_t)a4 withClientQueryGeneration:;
+ (void)initialize;
- (BOOL)_allowAncillaryEntities;
- (BOOL)_attemptCoalesceChangesForFetch;
- (BOOL)_disableDiscardEditing;
- (BOOL)_isSwiftBound;
- (BOOL)_parentObtainPermanentIDsForObjects:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)_performImmediate:(id)a3;
- (BOOL)_setChangeTrackingTokenFromToken:(id)a3 error:(id *)a4;
- (BOOL)_setQueryGenerationFromToken:(id)a3 error:(id *)a4;
- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 onObjectWithID:(id)a5 error:(id *)a6;
- (BOOL)automaticallyMergesChangesFromParent;
- (BOOL)commitEditing;
- (BOOL)commitEditingAndReturnError:(id *)a3;
- (BOOL)evictFuture:(id)a3 withError:(id *)a4;
- (BOOL)hasChanges;
- (BOOL)isEditing;
- (BOOL)obtainPermanentIDsForObjects:(NSArray *)objects error:(NSError *)error;
- (BOOL)propagatesDeletesAtEndOfEvent;
- (BOOL)retainsRegisteredObjects;
- (BOOL)save:(NSError *)error;
- (BOOL)setQueryGenerationFromToken:(NSQueryGenerationToken *)generation error:(NSError *)error;
- (BOOL)shouldDeleteInaccessibleFaults;
- (BOOL)shouldPerformSecureOperation;
- (BOOL)shouldRefreshAfterSave;
- (BOOL)trackSQLiteDatabaseStatistics;
- (BOOL)tryLock;
- (NSArray)executeFetchRequest:(NSFetchRequest *)request error:(NSError *)error;
- (NSManagedObject)existingObjectWithID:(NSManagedObjectID *)objectID error:(NSError *)error;
- (NSManagedObject)objectRegisteredForID:(NSManagedObjectID *)objectID;
- (NSManagedObject)objectWithID:(NSManagedObjectID *)objectID;
- (NSManagedObjectContext)init;
- (NSManagedObjectContext)initWithCoder:(id)a3;
- (NSManagedObjectContext)initWithConcurrencyType:(NSManagedObjectContextConcurrencyType)ct;
- (NSManagedObjectContext)parentContext;
- (NSManagedObjectContextConcurrencyType)concurrencyType;
- (NSMutableDictionary)userInfo;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSPersistentStoreResult)executeRequest:(NSPersistentStoreRequest *)request error:(NSError *)error;
- (NSQueryGenerationToken)queryGenerationToken;
- (NSSaveChangesRequest)_newSaveRequestForCurrentState;
- (NSSet)deletedObjects;
- (NSSet)insertedObjects;
- (NSSet)registeredObjects;
- (NSSet)updatedObjects;
- (NSString)name;
- (NSString)transactionAuthor;
- (NSTimeInterval)stalenessInterval;
- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request error:(NSError *)error;
- (NSUndoManager)undoManager;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_changeTrackingToken__;
- (id)_createStoreFetchRequestForFetchRequest:(id *)a1;
- (id)_delegate;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_orderKeysForRelationshipWithName__:(id)a3 onObjectWithID:(id)a4;
- (id)_orderedSetWithResultsFromFetchRequest:(id)a3;
- (id)_queryGenerationToken__;
- (id)_retainedCurrentQueryGeneration:(id)a3;
- (id)_retainedObjectWithID:(void *)a1 optionalHandler:(void *)a2 withInlineStorage:(uint64_t)a3;
- (id)_retainedObjectsFromRemovedStore:(id)a3;
- (id)databaseStatistics;
- (id)description;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)mergePolicy;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)performBlockWithResult:(id)a3;
- (int64x2_t)_updateDatabaseStaticsWithCacheStats:(uint64_t)a1;
- (uint64_t)_addObjectIDsInsertUpdatedByDATriggers:(uint64_t)result;
- (uint64_t)_addObjectIDsUpdatedByDATriggers:(uint64_t)result;
- (uint64_t)_addObjectIDsUpdatedByTriggers:(uint64_t)result;
- (uint64_t)_batchRetainedObjects:(uint64_t)a1 forCount:(uint64_t)a2 withIDs:(uint64_t)a3 optionalHandler:(id *)a4 withInlineStorage:(uint64_t)a5;
- (uint64_t)_changeIDsForManagedObjects:(void *)a3 toIDs:;
- (uint64_t)_checkObjectForExistenceAndCacheRow:(uint64_t)a1;
- (uint64_t)_clearDeletions;
- (uint64_t)_clearInsertions;
- (uint64_t)_clearUnprocessedDeletions;
- (uint64_t)_clearUnprocessedInsertions;
- (uint64_t)_clearUnprocessedUpdates;
- (uint64_t)_clearUpdates;
- (uint64_t)_committedSnapshotForObject:(uint64_t)result;
- (uint64_t)_countForFetchRequest_:(id *)a3 error:;
- (uint64_t)_countWithNoChangesForRequest:(id *)a3 error:;
- (uint64_t)_dispose:(uint64_t)result;
- (uint64_t)_enqueueEndOfEventNotification;
- (uint64_t)_generateOptLockExceptionForConstraintFailure:(uint64_t)result;
- (uint64_t)_handleError:(uint64_t *)a3 withError:;
- (uint64_t)_implicitObservationInfoForEntity:(void *)a3 forResultingClass:;
- (uint64_t)_initWithParentObjectStore:(void *)a1;
- (uint64_t)_mergeRefreshEpilogueForObject:(uint64_t)a3 mergeChanges:;
- (uint64_t)_mergeRefreshObject:(char)a3 mergeChanges:(NSKnownKeysDictionary *)a4 withPersistentSnapshot:;
- (uint64_t)_parentProcessSaveRequest:(uint64_t)result inContext:(void *)a2 error:;
- (uint64_t)_postContextDidSaveNotificationWithUserInfo:(uint64_t)a1;
- (uint64_t)_postObjectsDidChangeNotificationWithUserInfo:(uint64_t)result;
- (uint64_t)_prepareForPushChanges:(uint64_t)a1;
- (uint64_t)_processPendingDeletions:(void *)a3 withInsertions:(void *)a4 withUpdates:withNewlyForgottenList:withRemovedChangedObjects:;
- (uint64_t)_processRecentChanges:(uint64_t)a1;
- (uint64_t)_registerClearStateWithUndoManager;
- (uint64_t)_registerForNotificationsWithCoordinator:(uint64_t)result;
- (uint64_t)_registerUndoForOperation:(void *)a3 withObjects:(uint64_t)a4 withExtraArguments:;
- (uint64_t)_retainedRegisteredObjects;
- (uint64_t)_sendCommitEditingSelectorToTarget:(uint64_t)a3 sender:(uint64_t)a4 selector:(char)a5 flag:(uint64_t)a6 contextInfo:(int)a7 delayed:;
- (uint64_t)_setPersistentStoreCoordinator:(uint64_t)result;
- (uint64_t)_startObservingUndoManagerNotifications;
- (uint64_t)_stopObservingUndoManagerNotifications;
- (uint64_t)_validateObjects:(int)a3 forOperation:(uint64_t *)a4 error:(int)a5 exhaustive:(int)a6 forSave:;
- (uint64_t)lockObjectStore;
- (uint64_t)unlockObjectStore;
- (unsigned)_setParentContext:(unsigned __int8 *)result;
- (void)_PFAutoreleasePoolReferenceQueueTrampoline;
- (void)_advanceQueryGenerationForSave;
- (void)_automaticallyMergeChangesFromContextDidSaveNotification:(id)a3;
- (void)_clearChangedThisTransaction:(id)a3;
- (void)_clearOriginalSnapshotAndInitializeRec:(void *)result;
- (void)_copyChildObject:(uint64_t)a1 toParentObject:(unsigned char *)a2 fromChildContext:(void *)a3;
- (void)_coreMergeChangesFromDidSaveDictionary:(int)a3 usingObjectIDs:(uint64_t)a4 withClientQueryGeneration:;
- (void)_createAndPostChangeNotification:(void *)a3 deletions:(void *)a4 updates:(void *)a5 refreshes:(void *)a6 deferrals:(int)a7 wasMerge:;
- (void)_dealloc__;
- (void)_didSaveChanges;
- (void)_establishEventSnapshotsForObject:(uint64_t)a1;
- (void)_forceInsertionForObject:(id)a3;
- (void)_forceMoveInsertToUpdatedList:(uint64_t)a1;
- (void)_forceRegisterLostFault:(uint64_t)a1;
- (void)_forgetObject:(id)a3 propagateToObjectStore:(BOOL)a4 removeFromRegistry:(BOOL)a5;
- (void)_informParentStoreNoLongerInterestedInObjectIDs:(uint64_t)a3 generation:;
- (void)_insertObjectWithGlobalID:(void *)a3 globalID:;
- (void)_managedObjectContextEditor:(id)a3 didCommit:(BOOL)a4 contextInfo:(id *)a5;
- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4;
- (void)_mergeChangesFromRemoteContextSave:(id)a3;
- (void)_mergeChangesFromRemoteContextSave:(id)a3 presupposingQueryGeneration:(id)a4;
- (void)_newUnchangedLockedObjects;
- (void)_persistentStoreDidUpdateAdditionalRows:(void *)a1;
- (void)_postRefreshedObjectsNotificationAndClearList;
- (void)_prepareUnprocessedDeletionAfterRefresh:(_DWORD *)a1;
- (void)_processChangedStoreConfigurationNotification:(id)a3;
- (void)_processPendingInsertions:(id *)a1 withDeletions:(void *)a2 withUpdates:(void *)a3;
- (void)_processPendingUpdates:(uint64_t)a1;
- (void)_processRecentlyForgottenObjects:(void *)a1;
- (void)_processReferenceQueue:(uint64_t)a1;
- (void)_refaultObject:(id *)a1 globalID:(uint64_t)a2 BOOLean:(int)a3;
- (void)_registerAsyncReferenceCallback;
- (void)_registerObject:(void *)a3 withID:;
- (void)_resetAllChanges;
- (void)_setAllowAncillaryEntities:(BOOL)a3;
- (void)_setAllowsExpandedUserInfoKeys:(BOOL)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDisableDiscardEditing:(BOOL)a3;
- (void)_setFaultingError:(id)a3;
- (void)_setRetainsRegisteredObjects:(uint64_t)a1;
- (void)_setUndoManager:(uint64_t)a1;
- (void)_stopConflictDetectionForObject:(id)a3;
- (void)_storeConfigurationChanged:(id)a3;
- (void)_thereIsNoSadnessLikeTheDeathOfOptimism;
- (void)_undoDeletions:(id)a3;
- (void)_undoDeletionsMovedToUpdates:(id)a3;
- (void)_undoInsertions:(id)a3;
- (void)_undoManagerCheckpoint:(id)a3;
- (void)_undoUpdates:(id)a3;
- (void)_unlimitRequest:(void *)a1;
- (void)assignObject:(id)object toPersistentStore:(NSPersistentStore *)store;
- (void)commitEditingWithDelegate:(id)a3 didCommitSelector:(SEL)a4 contextInfo:(void *)a5;
- (void)dealloc;
- (void)deleteObject:(NSManagedObject *)object;
- (void)detectConflictsForObject:(NSManagedObject *)object;
- (void)discardEditing;
- (void)encodeWithCoder:(id)a3;
- (void)insertObject:(NSManagedObject *)object;
- (void)lock;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)mergeChangesFromContextDidSaveNotification:(NSNotification *)notification;
- (void)objectDidBeginEditing:(id)a3;
- (void)objectDidEndEditing:(id)a3;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;
- (void)performBlock:(void *)block;
- (void)performBlockAndWait:(void *)block;
- (void)performWithOptions:(unint64_t)a3 andBlock:(id)a4;
- (void)processPendingChanges;
- (void)redo;
- (void)refreshAllObjects;
- (void)refreshObject:(NSManagedObject *)object mergeChanges:(BOOL)flag;
- (void)reset;
- (void)rollback;
- (void)setAutomaticallyMergesChangesFromParent:(BOOL)automaticallyMergesChangesFromParent;
- (void)setMergePolicy:(id)mergePolicy;
- (void)setName:(NSString *)name;
- (void)setParentContext:(NSManagedObjectContext *)parentContext;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (void)setPropagatesDeletesAtEndOfEvent:(BOOL)propagatesDeletesAtEndOfEvent;
- (void)setRetainsRegisteredObjects:(BOOL)retainsRegisteredObjects;
- (void)setShouldDeleteInaccessibleFaults:(BOOL)shouldDeleteInaccessibleFaults;
- (void)setShouldPerformSecureOperation:(BOOL)a3;
- (void)setShouldRefreshAfterSave:(BOOL)a3;
- (void)setStalenessInterval:(NSTimeInterval)stalenessInterval;
- (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3;
- (void)setTransactionAuthor:(NSString *)transactionAuthor;
- (void)setUndoManager:(NSUndoManager *)undoManager;
- (void)set_isSwiftBound:(BOOL)a3;
- (void)undo;
- (void)unlock;
@end

@implementation NSManagedObjectContext

- (id)_retainedObjectWithID:(void *)a1 optionalHandler:(void *)a2 withInlineStorage:(uint64_t)a3
{
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a1, sel__retainedObjectWithID_optionalHandler_withInlineStorage_);
  }
  Value = (void *)_PFCMT_GetValue(a1[15], a2);
  if (!Value)
  {
    unint64_t v8 = [a2 entity];
    v9 = (void *)[(id)_PFFastEntityClass(v8) allocWithEntity:v8];
    _PFfastOidRetain(0, a2);
    v10 = (void *)[v9 _initWithEntity:v8 withID:a2 withHandler:a3 withContext:a1];
    -[NSManagedObjectContext _registerObject:withID:]((uint64_t)a1, (uint64_t)v10, a2);
    v11 = (void *)*a1[21];
    if (v11 && [v11 containsObject:a2])
    {
      if (![v10 managedObjectContext]) {
        -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)a1, v10);
      }
      [a1 deleteObject:v10];
    }
    return v10;
  }

  return Value;
}

- (void)_registerObject:(void *)a3 withID:
{
  if (a1)
  {
    if (!a3)
    {
      v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3C8];
      v9 = @"cannot record object with null globalID";
LABEL_19:
      objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
    }
    uint64_t v6 = *(void *)(a2 + 32);
    if (v6)
    {
      if (v6 != a1)
      {
        v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        v9 = @"An NSManagedObject may only be in (or observed by) a single NSManagedObjectContext.";
        goto LABEL_19;
      }
    }
    else
    {
      *(void *)(a2 + 32) = a1;
    }
    v10 = *(void **)(a2 + 40);
    if (!v10 || v10 == a3)
    {
      *(void *)(a2 + 40) = a3;
    }
    else
    {
      -[NSManagedObject _setObjectID__:]((void *)a2, a3);
      uint64_t v11 = *(void *)(a2 + 24);
      if (v11) {
        snapshot_set_objectID(v11, a3);
      }
    }
    if (!*(void *)(a2 + 56))
    {
      atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 152) + 8), 1u);
      *(void *)(a2 + 56) = *(void *)(a1 + 152);
    }
    *(_DWORD *)(a2 + 16) &= 0xFFF7FF7F;
    uint64_t v12 = *(void *)(a1 + 120);
    _PFCMT_SetValue(v12, a3, (const void *)a2);
  }
}

- (NSManagedObjectContextConcurrencyType)concurrencyType
{
  if (!self->_dispatchQueue) {
    return 0;
  }
  if ((*((unsigned char *)&self->_flags + 2) & 8) != 0) {
    return 1;
  }
  return 2;
}

id __46__NSManagedObjectContext_queryGenerationToken__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _queryGenerationToken];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSTimeInterval)stalenessInterval
{
  return self->_fetchTimestamp;
}

- (NSArray)executeFetchRequest:(NSFetchRequest *)request error:(NSError *)error
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v162 = 0;
  if (!request)
  {
    request = (NSFetchRequest *)@"<null>";
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_28:
    v35 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v36 = *MEMORY[0x1E4F1C3C8];
    uint64_t v37 = [NSString stringWithFormat:@"%@ %@ is not a valid NSFetchRequest.", NSStringFromSelector(a2), request];
LABEL_29:
    uint64_t v38 = v37;
    v39 = v35;
    uint64_t v40 = v36;
    goto LABEL_30;
  }
  uint64_t v8 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v8)
  {
    if (error)
    {
      v9 = v8;
      id result = 0;
      *error = v9;
      return result;
    }
    return 0;
  }
  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  [(NSFetchRequest *)request _resolveEntityWithContext:self];
  if (![(NSFetchRequest *)request entity])
  {
    v35 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v36 = *MEMORY[0x1E4F1C3C8];
    uint64_t v37 = [NSString stringWithFormat:@"%@ A fetch request must have an entity.", NSStringFromSelector(a2), v121];
    goto LABEL_29;
  }
  uint64_t v11 = [(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)self persistentStoreCoordinator] managedObjectModel];
  if (v11 != [(NSEntityDescription *)[(NSFetchRequest *)request entity] managedObjectModel]&& ![(NSManagedObjectContext *)self _allowAncillaryEntities])
  {
    uint64_t v12 = NSString;
    v120 = [(NSFetchRequest *)request entity];
    [(NSEntityDescription *)[(NSFetchRequest *)request entity] name];
    uint64_t v13 = [v12 stringWithFormat:@"The fetch request's entity %p '%@' appears to be from a different NSManagedObjectModel than this context's"];
    id v14 = [(NSDictionary *)[(NSManagedObjectModel *)[(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)self persistentStoreCoordinator] managedObjectModel] entitiesByName] objectForKey:[(NSEntityDescription *)[(NSFetchRequest *)request entity] name]];
    if (v14)
    {
      id v21 = v14;
      _NSCoreDataLog(1, v13, v15, v16, v17, v18, v19, v20, (uint64_t)v120);
      request = (NSFetchRequest *)(id)[(NSFetchRequest *)request copy];
      [(NSFetchRequest *)request setEntity:v21];
      goto LABEL_13;
    }
    v41 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v42 = *MEMORY[0x1E4F1C3C8];
    uint64_t v38 = [NSString stringWithFormat:@"The fetch request's entity %p '%@' appears to be from a different NSManagedObjectModel than this context's", -[NSFetchRequest entity](request, "entity"), -[NSEntityDescription name](-[NSFetchRequest entity](request, "entity"), "name")];
    v39 = v41;
    uint64_t v40 = v42;
LABEL_30:
    objc_exception_throw((id)[v39 exceptionWithName:v40 reason:v38 userInfo:0]);
  }
LABEL_13:
  [(NSFetchRequest *)request allowEvaluation];
  NSFetchRequestResultType v22 = [(NSFetchRequest *)request resultType];
  if (v22 == 4)
  {
    NSUInteger v23 = [(NSManagedObjectContext *)self countForFetchRequest:request error:error];
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = [NSNumber numberWithUnsignedInteger:v23];
      v25 = (void *)MEMORY[0x1E4F1C978];
      return (NSArray *)[v25 arrayWithObject:v24];
    }
    return 0;
  }
  NSFetchRequestResultType v26 = v22;
  id v27 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (v26 != 2
    && [(NSFetchRequest *)request includesPendingChanges]
    && [(NSManagedObjectContext *)self hasChanges])
  {
    if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch]((BOOL)self)) {
      -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
    }
    int v28 = 1;
  }
  else
  {
    int v28 = 0;
  }
  v127 = request;
  v29 = -[NSManagedObjectContext _createStoreFetchRequestForFetchRequest:]((id *)&self->super.isa, request);
  uint64_t v131 = [v29 resultType];
  int v30 = [v29 includesPropertyValues];
  -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
  v128 = self;
  int v126 = v30;
  v31 = (void *)[self->_parentObjectStore executeRequest:v29 withContext:self error:&v162];
  id v32 = v31;
  if (v31)
  {
    id v33 = v31;
    int v34 = 1;
  }
  else
  {
    int v34 = 0;
  }
  id v43 = v162;

  [v27 drain];
  -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  id v44 = v162;
  if (v162)
  {
    if (v32)
    {
      uint64_t v45 = [NSString stringWithUTF8String:"Fetching generated an error AND a result: %@"];
      _NSCoreDataLog(17, v45, v46, v47, v48, v49, v50, v51, (uint64_t)v162);
      v52 = __pflogFaultLog;
      BOOL v53 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      id v44 = v162;
      if (v53)
      {
        LODWORD(callBacks.version) = 138412290;
        *(CFIndex *)((char *)&callBacks.version + 4) = (CFIndex)v162;
        _os_log_fault_impl(&dword_18AB82000, v52, OS_LOG_TYPE_FAULT, "CoreData: Fetching generated an error AND a result: %@", (uint8_t *)&callBacks, 0xCu);
        id v44 = v162;
      }
    }
    id v54 = v44;
    if (error) {
      *error = (NSError *)v162;
    }
    return 0;
  }
  if (!v32)
  {
    uint64_t v55 = [NSString stringWithUTF8String:"Fetching failed to generate a result OR an error OR an exception"];
    _NSCoreDataLog(17, v55, v56, v57, v58, v59, v60, v61, v119);
    v62 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(callBacks.version) = 0;
      _os_log_fault_impl(&dword_18AB82000, v62, OS_LOG_TYPE_FAULT, "CoreData: Fetching failed to generate a result OR an error OR an exception", (uint8_t *)&callBacks, 2u);
    }
  }
  if (!v34) {
    return 0;
  }
  if (!v32) {
    id v32 = (id)NSArray_EmptyArray;
  }
  id v129 = v32;
  if (v28)
  {
    id v123 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v63 = [(NSFetchRequest *)v127 predicate];
    v122 = [(NSFetchRequest *)v127 sortDescriptors];
    v64 = [(NSFetchRequest *)v127 affectedStores];
    v133 = [(NSFetchRequest *)v127 entity];
    if ([(NSDictionary *)[(NSEntityDescription *)v133 subentitiesByName] count]) {
      BOOL v132 = [(NSFetchRequest *)v127 includesSubentities];
    }
    else {
      BOOL v132 = 0;
    }
    if (v63) {
      id v130 = [+[_NSMemoryStorePredicateRemapper defaultInstance] createPredicateForFetchFromPredicate:v63 withContext:0];
    }
    else {
      id v130 = (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    if ([(NSArray *)v64 count]) {
      v65 = v64;
    }
    else {
      v65 = 0;
    }
    CFIndex v66 = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
    v67 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
    callBacks.versiouint64_t n = v66;
    callBacks.copyDescriptiouint64_t n = v67;
    callBacks.equal = 0;
    callBacks.hash = 0;
    uint64_t v68 = [(NSMutableSet *)self->_unprocessedChanges count];
    changedObjects = (__CFSet *)self->_changedObjects;
    if (v68)
    {
      if ([(NSMutableSet *)self->_changedObjects count])
      {
        changedObjects = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        unprocessedChanges = self->_unprocessedChanges;
        uint64_t v71 = [(NSMutableSet *)unprocessedChanges countByEnumeratingWithState:&v158 objects:v169 count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v159;
          do
          {
            for (uint64_t i = 0; i != v71; ++i)
            {
              if (*(void *)v159 != v72) {
                objc_enumerationMutation(unprocessedChanges);
              }
              CFSetAddValue(changedObjects, *(const void **)(*((void *)&v158 + 1) + 8 * i));
            }
            uint64_t v71 = [(NSMutableSet *)unprocessedChanges countByEnumeratingWithState:&v158 objects:v169 count:16];
          }
          while (v71);
        }
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        v74 = self->_changedObjects;
        uint64_t v75 = [(NSMutableSet *)v74 countByEnumeratingWithState:&v154 objects:v168 count:16];
        if (v75)
        {
          uint64_t v76 = *(void *)v155;
          do
          {
            for (uint64_t j = 0; j != v75; ++j)
            {
              if (*(void *)v155 != v76) {
                objc_enumerationMutation(v74);
              }
              CFSetAddValue(changedObjects, *(const void **)(*((void *)&v154 + 1) + 8 * j));
            }
            uint64_t v75 = [(NSMutableSet *)v74 countByEnumeratingWithState:&v154 objects:v168 count:16];
          }
          while (v75);
        }
        int v124 = 1;
      }
      else
      {
        int v124 = 0;
        changedObjects = (__CFSet *)self->_unprocessedChanges;
      }
    }
    else
    {
      int v124 = 0;
    }
    long long v152 = 0u;
    long long v153 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    v78 = 0;
    uint64_t v79 = [(__CFSet *)changedObjects countByEnumeratingWithState:&v150 objects:v167 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v151;
      do
      {
        for (uint64_t k = 0; k != v79; ++k)
        {
          if (*(void *)v151 != v80) {
            objc_enumerationMutation(changedObjects);
          }
          v82 = *(void **)(*((void *)&v150 + 1) + 8 * k);
          v83 = (void *)[v82 objectID];
          v84 = v83;
          if (!v65
            || -[NSArray indexOfObjectIdenticalTo:](v65, "indexOfObjectIdenticalTo:", [v83 persistentStore]) != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v85 = [v82 entity];
            if ((NSEntityDescription *)v85 == v133
              || v132 && [(NSEntityDescription *)v133 _subentitiesIncludes:v85])
            {
              if (!v78) {
                v78 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v129];
              }
              v86 = (void *)MEMORY[0x18C127630]();
              int v87 = [v130 evaluateWithObject:v82];
              if (v131) {
                v88 = v84;
              }
              else {
                v88 = v82;
              }
              if (v87) {
                [v78 addObject:v88];
              }
              else {
                [v78 removeObject:v88];
              }
            }
          }
        }
        uint64_t v79 = [(__CFSet *)changedObjects countByEnumeratingWithState:&v150 objects:v167 count:16];
      }
      while (v79);
    }
    if (v124) {
      CFRelease(changedObjects);
    }
    uint64_t v89 = [(NSMutableSet *)v128->_unprocessedInserts count];
    insertedObjects = (__CFSet *)v128->_insertedObjects;
    if (v89)
    {
      if ([(NSMutableSet *)v128->_insertedObjects count])
      {
        insertedObjects = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
        long long v148 = 0u;
        long long v149 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        unprocessedInserts = v128->_unprocessedInserts;
        uint64_t v92 = [(NSMutableSet *)unprocessedInserts countByEnumeratingWithState:&v146 objects:v166 count:16];
        if (v92)
        {
          uint64_t v93 = *(void *)v147;
          do
          {
            for (uint64_t m = 0; m != v92; ++m)
            {
              if (*(void *)v147 != v93) {
                objc_enumerationMutation(unprocessedInserts);
              }
              CFSetAddValue(insertedObjects, *(const void **)(*((void *)&v146 + 1) + 8 * m));
            }
            uint64_t v92 = [(NSMutableSet *)unprocessedInserts countByEnumeratingWithState:&v146 objects:v166 count:16];
          }
          while (v92);
        }
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        v95 = v128->_insertedObjects;
        uint64_t v96 = [(NSMutableSet *)v95 countByEnumeratingWithState:&v142 objects:v165 count:16];
        if (v96)
        {
          uint64_t v97 = *(void *)v143;
          do
          {
            for (uint64_t n = 0; n != v96; ++n)
            {
              if (*(void *)v143 != v97) {
                objc_enumerationMutation(v95);
              }
              CFSetAddValue(insertedObjects, *(const void **)(*((void *)&v142 + 1) + 8 * n));
            }
            uint64_t v96 = [(NSMutableSet *)v95 countByEnumeratingWithState:&v142 objects:v165 count:16];
          }
          while (v96);
        }
        int v125 = 1;
      }
      else
      {
        int v125 = 0;
        insertedObjects = (__CFSet *)v128->_unprocessedInserts;
      }
    }
    else
    {
      int v125 = 0;
    }
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    uint64_t v99 = [(__CFSet *)insertedObjects countByEnumeratingWithState:&v138 objects:v164 count:16];
    if (v99)
    {
      uint64_t v100 = *(void *)v139;
      do
      {
        for (iuint64_t i = 0; ii != v99; ++ii)
        {
          if (*(void *)v139 != v100) {
            objc_enumerationMutation(insertedObjects);
          }
          v102 = *(void **)(*((void *)&v138 + 1) + 8 * ii);
          v103 = (void *)[v102 objectID];
          v104 = v103;
          if (v65)
          {
            uint64_t v105 = [v103 persistentStore];
            if (!v105
              || [(NSArray *)v65 indexOfObjectIdenticalTo:v105] == 0x7FFFFFFFFFFFFFFFLL)
            {
              continue;
            }
          }
          uint64_t v106 = [v102 entity];
          if ((NSEntityDescription *)v106 == v133
            || v132 && [(NSEntityDescription *)v133 _subentitiesIncludes:v106])
          {
            if (!v78) {
              v78 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v129];
            }
            v107 = (void *)MEMORY[0x18C127630]();
            if ([v130 evaluateWithObject:v102])
            {
              if (v131) {
                v108 = v104;
              }
              else {
                v108 = v102;
              }
              [v78 addObject:v108];
            }
          }
        }
        uint64_t v99 = [(__CFSet *)insertedObjects countByEnumeratingWithState:&v138 objects:v164 count:16];
      }
      while (v99);
    }
    if (v125) {
      CFRelease(insertedObjects);
    }
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    deletedObjects = v128->_deletedObjects;
    uint64_t v110 = [(NSMutableSet *)deletedObjects countByEnumeratingWithState:&v134 objects:v163 count:16];
    if (v110)
    {
      uint64_t v111 = *(void *)v135;
      do
      {
        for (juint64_t j = 0; jj != v110; ++jj)
        {
          if (*(void *)v135 != v111) {
            objc_enumerationMutation(deletedObjects);
          }
          v113 = *(void **)(*((void *)&v134 + 1) + 8 * jj);
          if (!v65
            || -[NSArray indexOfObjectIdenticalTo:](v65, "indexOfObjectIdenticalTo:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v134 + 1) + 8 * jj), "objectID"), "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v114 = [v113 entity];
            if ((NSEntityDescription *)v114 == v133
              || v132 && [(NSEntityDescription *)v133 _subentitiesIncludes:v114])
            {
              if (!v78) {
                v78 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v129];
              }
              if (v131) {
                v113 = objc_msgSend(v113, "objectID", v114);
              }
              [v78 removeObject:v113];
            }
          }
        }
        uint64_t v110 = [(NSMutableSet *)deletedObjects countByEnumeratingWithState:&v134 objects:v163 count:16];
      }
      while (v110);
    }
    if (v78)
    {
      v115 = (void *)[v78 allObjects];
      if ([(NSArray *)v122 count]) {
        BOOL v116 = v131 != 0;
      }
      else {
        BOOL v116 = 1;
      }
      if (!v116 && ((v126 ^ 1) & 1) == 0) {
        v115 = (void *)[v115 sortedArrayUsingDescriptors:v122];
      }

      id v129 = v115;
    }

    [v123 drain];
  }
  unint64_t v117 = [(NSFetchRequest *)v127 fetchLimit];
  if (v117 && [v129 count] > v117)
  {
    id v118 = (id)objc_msgSend(v129, "subarrayWithRange:", 0, v117);
  }
  else
  {
    id v118 = v129;
  }
  if (v128->_dispatchQueue && !-[NSFetchRequest resultType](v127, "resultType") && [v118 count]) {
    -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)v128);
  }
  return (NSArray *)v118;
}

- (id)_queryGenerationToken__
{
  if (self->_parentObjectStore && (unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext), (v2 & 1) != 0)) {
    id v3 = +[NSQueryGenerationToken unpinnedQueryGenerationToken];
  }
  else {
    id v3 = (id)*((void *)self->_additionalPrivateIvars + 12);
  }
  id v4 = v3;

  return v4;
}

- (void)_PFAutoreleasePoolReferenceQueueTrampoline
{
  if (val)
  {
    if (val[3]) {
      BOOL v1 = _MergedGlobals_74 == 0;
    }
    else {
      BOOL v1 = 1;
    }
    if (!v1)
    {
      objc_initWeak(&location, val);
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __68__NSManagedObjectContext__PFAutoreleasePoolReferenceQueueTrampoline__block_invoke;
      v2[3] = &unk_1E544C3A0;
      objc_copyWeak(&v3, &location);
      +[_PFAutoreleasePoolThunk thunkWithBlock:]((uint64_t)_PFAutoreleasePoolThunk, v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

- (NSManagedObject)objectRegisteredForID:(NSManagedObjectID *)objectID
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, objectID);
  if (!Value)
  {
    uint64_t v6 = [(NSManagedObjectID *)objectID persistentStore];
    uint64_t v7 = [(NSPersistentStore *)v6 _persistentStoreCoordinator];
    uint64_t v8 = [(NSManagedObjectContext *)self persistentStoreCoordinator];
    BOOL v9 = [(NSManagedObjectID *)objectID _isPersistentStoreAlive];
    if (((NSPersistentStoreCoordinator *)v7 != v8 || !v9)
      && (v6 || ![(NSManagedObjectID *)objectID isTemporaryID]))
    {
      v10 = (void *)MEMORY[0x18C127630]();
      uint64_t v11 = [(NSManagedObjectID *)objectID URIRepresentation];
      if (-[NSPersistentStoreCoordinator _persistentStoreForIdentifier:]((uint64_t)v8, (uint64_t)[(NSManagedObjectID *)objectID _storeIdentifier]))
      {
        uint64_t v12 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v8, (CFURLRef)v11, 0);
        uint64_t v13 = v12;
        if (v12)
        {
          Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v12);
LABEL_14:

          return Value;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      Value = 0;
      goto LABEL_14;
    }
    return 0;
  }
  return Value;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  id result = (NSPersistentStoreCoordinator *)self->_parentObjectStore;
  if (v2) {
    return (NSPersistentStoreCoordinator *)[(NSPersistentStoreCoordinator *)result persistentStoreCoordinator];
  }
  return result;
}

- (BOOL)hasChanges
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)_createStoreFetchRequestForFetchRequest:(id *)a1
{
  unsigned __int8 v2 = a1;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (void *)MEMORY[0x18C127630]();
    uint64_t v5 = [a2 resultType];
    if (v5 == 2) {
      int v6 = 0;
    }
    else {
      int v6 = [a2 includesPendingChanges];
    }
    uint64_t v7 = [a2 fetchLimit];
    uint64_t v8 = (void *)[a2 propertiesToFetch];
    BOOL v9 = (void *)[a2 relationshipKeyPathsForPrefetching];
    if ([v8 count])
    {
      id v10 = (id)[a2 copy];
      a2 = v10;
      if (v5 == 4 || v5 == 1)
      {
        [v10 setPropertiesToFetch:0];
        [a2 setRelationshipKeyPathsForPrefetching:0];
      }
      else if (!v5 && [v9 count])
      {
        int v39 = v6;
        uint64_t v40 = v2;
        uint64_t v41 = v7;
        uint64_t v42 = a2;
        id v43 = v4;
        uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "entity"), "relationshipsByName");
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v13 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v50 != v15) {
                objc_enumerationMutation(v9);
              }
              CFStringRef v17 = *(const __CFString **)(*((void *)&v49 + 1) + 8 * i);
              result.locatiouint64_t n = 0;
              result.length = 0;
              if (v17
                && (v56.length = CFStringGetLength(v17),
                    v56.locatiouint64_t n = 0,
                    CFStringFindWithOptions(v17, @".", v56, 0, &result)))
              {
                v57.length = result.location;
                v57.locatiouint64_t n = 0;
                CFStringRef v17 = CFStringCreateWithSubstring(0, v17, v57);
                CFStringRef v18 = v17;
              }
              else
              {
                CFStringRef v18 = 0;
              }
              uint64_t v19 = (void *)[v11 objectForKey:v17];
              if (v19)
              {
                uint64_t v20 = v19;
                if (([v19 _isToManyRelationship] & 1) == 0) {
                  [v12 addObject:v20];
                }
              }
              if (v18) {
                CFRelease(v18);
              }
            }
            uint64_t v14 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
          }
          while (v14);
        }
        a2 = v42;
        if ([v12 count])
        {
          id v21 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v8];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v22 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                if ([v8 indexOfObjectIdenticalTo:v26] == 0x7FFFFFFFFFFFFFFFLL) {
                  [v21 addObject:v26];
                }
              }
              uint64_t v23 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
            }
            while (v23);
          }
          [v42 setPropertiesToFetch:v21];
        }

        id v4 = v43;
        unsigned __int8 v2 = v40;
        uint64_t v7 = v41;
        int v6 = v39;
      }
    }
    if (v7) {
      int v27 = v6;
    }
    else {
      int v27 = 0;
    }
    if (v27 == 1
      && (*((unsigned char *)v2 + 41) & 4) != 0
      && (uint64_t v28 = [v2[12] count],
          uint64_t v29 = [v2[7] count] + v28,
          (uint64_t v30 = v29 + [v2[11] count]) != 0))
    {
      unsigned __int8 v2 = (id *)[a2 _copyForDirtyContext];
      self;
      if (objc_opt_isKindOfClass())
      {
        v31 = objc_msgSend((id)objc_msgSend(v2, "substitutionVariables"), "mutableCopy");
        id v32 = objc_msgSend((id)objc_msgSend(v31, "objectForKey:", @"FETCH_REQUEST_LIMIT_SUBSTITUTION"), "constantValue");
        if (v32) {
          uint64_t v7 = [v32 unsignedIntegerValue];
        }
        uint64_t v33 = [NSNumber numberWithUnsignedInteger:v7 + v30];
        objc_msgSend(v31, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", v33), @"FETCH_REQUEST_LIMIT_SUBSTITUTION");
        [v2 setSubstitutionVariables:v31];
      }
      else
      {
        [v2 setFetchLimit:v30 + v7];
      }
    }
    else if ([a2 resultType] == 2 {
           && [a2 fetchBatchSize]
    }
           && !objc_msgSend((id)objc_msgSend(a2, "propertiesToFetch"), "count"))
    {
      id v35 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entity"), "attributesByName"), "allValues"), "mutableCopy");
      [v35 sortUsingFunction:_comparePropertiesByName context:0];
      uint64_t v36 = [v35 count];
      uint64_t v37 = v36 - 1;
      if (v36 != 1)
      {
        do
        {
          if (objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v37), "isTransient")) {
            [v35 removeObjectAtIndex:v37];
          }
          --v37;
        }
        while (v37);
      }
      uint64_t v38 = objc_alloc_init(NSExpressionDescription);
      [(NSPropertyDescription *)v38 setName:@"objectID"];
      -[NSExpressionDescription setExpression:](v38, "setExpression:", [MEMORY[0x1E4F28C68] expressionForEvaluatedObject]);
      [(NSExpressionDescription *)v38 setExpressionResultType:2000];
      [v35 addObject:v38];

      unsigned __int8 v2 = (id *)[a2 copy];
      [v2 setPropertiesToFetch:v35];
    }
    else
    {
      unsigned __int8 v2 = a2;
    }
  }
  return v2;
}

- (BOOL)_attemptCoalesceChangesForFetch
{
  if (result)
  {
    uint64_t v1 = result;
    return ![*(id *)(result + 64) count]
        && (![*(id *)(v1 + 72) count]
         || ([*(id *)(v1 + 88) intersectsSet:*(void *)(v1 + 72)] & 1) == 0);
  }
  return result;
}

- (void)assignObject:(id)object toPersistentStore:(NSPersistentStore *)store
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object) {
      return;
    }
  }
  else if (!object)
  {
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    id v12 = @"Parameter #1 to -assignObject:toPersistentStore: must be an NSManagedObject or subclass.";
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  uint64_t v7 = (void *)[object objectID];
  if (![v7 isTemporaryID])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", -[NSPersistentStore URL](store, "URL"), @"newStoreURL", objc_msgSend((id)objc_msgSend(v7, "persistentStore"), "URL"), @"originalStoreURL", v7, @"objectID", 0);
    id v12 = @"Can't reassign an object to a different store once it has been saved.";
LABEL_17:
    id v10 = v14;
    uint64_t v11 = v15;
LABEL_18:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:v13]);
  }
  uint64_t v8 = [(NSManagedObjectContext *)self persistentStoreCoordinator];
  if (v8) {
    uint64_t modelMap = (uint64_t)v8->_modelMap;
  }
  else {
    uint64_t modelMap = 0;
  }
  if (!objc_msgSend(-[_PFModelMap entitiesForContext:configuration:](modelMap, self, (uint64_t)-[NSPersistentStore configurationName](store, "configurationName")), "containsObject:", objc_msgSend(v7, "entity")))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", -[NSPersistentStore URL](store, "URL"), @"storeURL", objc_msgSend((id)objc_msgSend(v7, "entity"), "name"), @"entityName", v7, @"objectID", 0);
    id v12 = @"Can't assign an object to a store that does not contain the object's entity.";
    goto LABEL_17;
  }

  [v7 _setPersistentStore:store];
}

- (void)_informParentStoreNoLongerInterestedInObjectIDs:(uint64_t)a3 generation:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1 && [a2 count])
  {
    int v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(a2);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (([v11 isTemporaryID] & 1) == 0) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [*(id *)(a1 + 32) managedObjectContextDidUnregisterObjectsWithIDs:v6 generation:a3];
  }
}

- (uint64_t)unlockObjectStore
{
  if (!result || !_PF_Threading_Debugging_level) {
    return result;
  }
  uint64_t v1 = (void *)result;
  if (*(void *)(result + 24)) {
    goto LABEL_12;
  }
  if ([*(id *)(*(void *)(*(void *)(result + 168) + 56) + 32) count])
  {
    CFRange result = [*(id *)(*(void *)(v1[21] + 56) + 32) removeLastObject];
  }
  else
  {
    CFRange result = _PF_actor_set_owner(v1[4], (uint64_t)v1, 0);
    if ((result & 1) == 0 && _PF_Threading_Debugging_level) {
      CFRange result = _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v1, sel_unlockObjectStore);
    }
  }
  if (v1[3])
  {
    if (!_PF_Threading_Debugging_level) {
      return result;
    }
LABEL_12:
    return _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v1, sel_unlockObjectStore);
  }
  unsigned __int8 v2 = (void *)v1[17];

  return [v2 unlock];
}

- (uint64_t)lockObjectStore
{
  if (result && _PF_Threading_Debugging_level)
  {
    uint64_t v1 = (unint64_t *)result;
    if (*(void *)(result + 24))
    {
      CFRange result = _PFAssertSafeMultiThreadedAccess_impl(result, sel_lockObjectStore);
    }
    else
    {
      CFRange result = [*(id *)(result + 136) tryLock];
      if ((result & 1) == 0)
      {
        CFRange result = self;
        __break(1u);
        return result;
      }
    }
    if (!v1[3])
    {
      if (atomic_load(v1 + 1))
      {
        id v3 = *(void **)(*(void *)(v1[21] + 56) + 32);
        uint64_t v4 = NSKeyValueCoding_NullValue;
        return [v3 addObject:v4];
      }
      else
      {
        CFRange result = _PF_actor_set_owner(0, (uint64_t)v1, v1[4]);
        if ((result & 1) == 0 && _PF_Threading_Debugging_level)
        {
          return _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v1, sel_lockObjectStore);
        }
      }
    }
  }
  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__12;
  long long v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__NSManagedObjectContext__NestedContextSupport__newValuesForObjectWithID_withContext_error___block_invoke;
  v7[3] = &unk_1E544C748;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = &v8;
  _perform((unint64_t)self, (uint64_t)v7);
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke;
  v4[3] = &unk_1E544BB28;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  _perform((unint64_t)self, (uint64_t)v4);
}

void __68__NSManagedObjectContext__PFAutoreleasePoolReferenceQueueTrampoline__block_invoke(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v2 = (uint64_t)Weak;
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)Weak, sel_processPendingChanges);
    }
    -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
  }
}

- (void)reset
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [(NSManagedObjectContext *)self discardEditing];
  unint64_t Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23[1] = v23;
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (const void **)((char *)v23 - v7);
  if (Count >= 0x201) {
    uint64_t v8 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v23 - v7, 8 * v6);
  }
  unint64_t v9 = -[_PFContextMapTable getAllObjects:]((unint64_t)self->_infoByGID, v8);
  if (v9)
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      uint64_t v12 = (uint64_t)v8[v10];
      uint64_t v13 = (void *)[(id)v12 objectID];
      id v14 = (id)v12;
      int v15 = [v13 isTemporaryID];
      if (v12 && ((*(unsigned char *)(v12 + 17) & 2) == 0 ? (char v16 = 1) : (char v16 = v15), (v16 & 1) == 0))
      {
        [v4 addObject:v13];
        *(_DWORD *)(v12 + 16) &= ~0x200u;
      }
      else if (v15)
      {
        [v5 addObject:v13];
      }
      if (v12) {
        uint64_t v17 = _insertion_fault_handler;
      }
      else {
        uint64_t v17 = 0;
      }
      -[NSFaultHandler turnObject:intoFaultWithContext:](v17, v12, (uint64_t)self);
      [(NSManagedObjectContext *)self _forgetObject:v12 propagateToObjectStore:0 removeFromRegistry:0];

      uint64_t v10 = v11;
    }
    while (v9 > v11++);
  }
  if (Count >= 0x201) {
    NSZoneFree(0, v8);
  }
  _PFCMT_RemoveAllValues(&self->_infoByGID->super.isa);
  -[NSManagedObjectContext _resetAllChanges](self);
  if ([v4 count])
  {
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    objc_msgSend(self->_parentObjectStore, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v4, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  }
  if ([v5 count])
  {
    [v5 addObjectsFromArray:v4];
  }
  else
  {

    id v5 = v4;
  }
  if (byte_1EB270AB6) {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v5, @"invalidatedAll", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), @"managedObjectContext", 0);
  }
  else {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v5, @"invalidatedAll", 0);
  }
  -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v19);
  additionalPrivateIvars = self->_additionalPrivateIvars;
  id v21 = (id *)additionalPrivateIvars[1];
  if (v21)
  {

    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars[1]);
    *((void *)self->_additionalPrivateIvars + 1) = 0;
    additionalPrivateIvars = self->_additionalPrivateIvars;
  }

  *self->_additionalPrivateIvars = 0;
  *((void *)self->_additionalPrivateIvars + 17) = 0;

  *((void *)self->_additionalPrivateIvars + 18) = 0;
  *((void *)self->_additionalPrivateIvars + 14) = 0;

  *((void *)self->_additionalPrivateIvars + 19) = 0;
  if (objc_msgSend((id)-[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"), "_isEnabled"))-[NSManagedObjectContext _setQueryGenerationFromToken:error:](self, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0); {

  }
  [v24 drain];
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
  id v22 = 0;
}

- (void)_processReferenceQueue:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (_PF_Threading_Debugging_level && (a2 & 1) == 0)
  {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__processReferenceQueue_);
    if ((a2 & 1) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)(a1 + 42) & 4) != 0) {
        return;
      }
    }
  }
  else if ((a2 & 1) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a1 + 152);

  -[_PFManagedObjectReferenceQueue _processReferenceQueue:](v4, a2);
}

- (void)_forgetObject:(id)a3 propagateToObjectStore:(BOOL)a4 removeFromRegistry:(BOOL)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  values = a3;
  if (a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    uint64_t v7 = a3;
    unint64_t v9 = (void *)[a3 objectID];
    int v10 = v7[4];
    int v11 = v10 | 0x80;
    v7[4] = v10 | 0x80;
    if (v5 && (v10 & 0x80000) == 0)
    {
      _PFCMT_RemoveValue(&self->_infoByGID->super.isa, v9);
      int v11 = v7[4];
    }
    v7[4] = v11 | 0x80080;
    if (!v6 || (v11 & 0x200) == 0 || ([v9 isTemporaryID] & 1) != 0) {
      goto LABEL_30;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    CFAllocatorRef v12 = _PFStackAllocatorCreate((unint64_t *)&v21, 1024);
    CFArrayRef v13 = CFArrayCreate(v12, (const void **)&values, 1, 0);
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    id parentObjectStore = self->_parentObjectStore;
    if ([(__CFArray *)v13 count])
    {
      int v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[__CFArray count](v13, "count"));
      uint64_t v16 = [(__CFArray *)v13 count];
      if (v16)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          CFStringRef v18 = (_DWORD *)[(__CFArray *)v13 objectAtIndex:i];
          uint64_t v19 = (void *)[v18 objectID];
          if (([v19 isTemporaryID] & 1) == 0)
          {
            [v15 addObject:v19];
            if (v18) {
              v18[4] &= ~0x200u;
            }
          }
        }
      }
      objc_msgSend(parentObjectStore, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v15, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
    }
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
    if (*((void *)&v22 + 1))
    {
      if (v13) {
        CFRelease(v13);
      }
    }
    else
    {
      *((void *)&v21 + 1) = v21;
    }
    uint64_t v7 = values;
    if (values)
    {
LABEL_30:
      if ((v7[4] & 9) == 0
        || ([(NSMutableSet *)self->_unprocessedChanges removeObject:v7],
            [(NSMutableSet *)self->_changedObjects removeObject:values],
            (uint64_t v7 = values) != 0))
      {
        if ((v7[4] & 0x12) == 0
          || ([(NSMutableSet *)self->_unprocessedInserts removeObject:v7],
              [(NSMutableSet *)self->_insertedObjects removeObject:values],
              (uint64_t v7 = values) != 0))
        {
          if ((v7[4] & 0x24) == 0
            || ([(NSMutableSet *)self->_deletedObjects removeObject:v7],
                [(NSMutableSet *)self->_unprocessedDeletes removeObject:values],
                (uint64_t v7 = values) != 0))
          {
            v7[4] &= 0xFFFFFFC0;
          }
        }
      }
    }
  }
}

- (void)_registerAsyncReferenceCallback
{
  if (a1)
  {
    if (_PF_shouldAsyncProcessReferenceQueue)
    {
      if (*(void *)(a1 + 24))
      {
        if (!*(_DWORD *)(a1 + 16)
          && ([(id)a1 _isDeallocating] & 1) == 0
          && !atomic_fetch_add((atomic_uchar *volatile)(a1 + 51), 1u))
        {
          uint64_t v2 = *(const void **)(a1 + 152);
          if (v2)
          {
            id v3 = [[_PFWeakReference alloc] initWithObject:a1];
            if (v3)
            {
              uint64_t v4 = v3;
              CFRetain(v2);
              v5[0] = MEMORY[0x1E4F143A8];
              v5[1] = 3221225472;
              v5[2] = __90__NSManagedObjectContext__NSInternalNotificationHandling___registerAsyncReferenceCallback__block_invoke;
              v5[3] = &unk_1E544C720;
              v5[4] = v4;
              v5[5] = v2;
              [(id)a1 performWithOptions:24577 andBlock:v5];
            }
          }
        }
      }
    }
  }
}

- (void)performWithOptions:(unint64_t)a3 andBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self || self->_wasDisposed || [(NSManagedObjectContext *)self _isDeallocating])
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F29060], "callStackSymbols", a3, a4);
    _NSCoreDataLog(1, @"illegally invoked -performWithOptions* on dying NSManagedObjectContext at:\n\t%@", v22, v23, v24, v25, v26, v27, v21);
    __break(1u);
  }
  if (self->_dispatchQueue)
  {
    if (a3)
    {
      CFAllocatorRef v12 = malloc_type_malloc(0x20uLL, 0x80040B8603338uLL);
      *CFAllocatorRef v12 = _Block_copy(a4);
      if ((a3 & 0x1000) != 0) {
        CFTypeRef v13 = 0;
      }
      else {
        CFTypeRef v13 = CFRetain(self);
      }
      v12[1] = v13;
      v12[2] = a3 | 0x2001;
      v12[3] = 0;
      dispatchQueue = self->_dispatchQueue;
      dispatch_async_f(dispatchQueue, v12, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
    }
    else
    {
      uint64_t v7 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
      unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
      if (v8)
      {
        if (_PFIsSerializedWithMainQueue())
        {
LABEL_40:
          if ((a3 & 0x1000) == 0) {
            uint64_t v19 = self;
          }
          id context = a4;
          long long v29 = self;
          unint64_t v30 = a3;
          long long v31 = v7;
          developerSubmittedBlockToNSManagedObjectContextPerform(&context);
          return;
        }
      }
      else if (v7)
      {
        unint64_t v9 = 0;
        int v10 = 0;
        unint64_t v11 = (unint64_t)v7;
        while ((NSManagedObjectContext *)v11 != self)
        {
          if (v11 == v9) {
            goto LABEL_30;
          }
          if (!v9) {
            unint64_t v9 = v11;
          }
          unint64_t v11 = atomic_load((unint64_t *)(v11 + 8));
          if (!v11) {
            goto LABEL_31;
          }
        }
        int v10 = 1;
LABEL_30:
        if (v10) {
          goto LABEL_40;
        }
LABEL_31:
        uint64_t v16 = 0;
        int v17 = 0;
        CFStringRef v18 = self;
        while (v18 != v7)
        {
          if (v18 == v16) {
            goto LABEL_39;
          }
          if (!v16) {
            uint64_t v16 = v18;
          }
          CFStringRef v18 = (NSManagedObjectContext *)atomic_load((unint64_t *)&v18->_queueOwner);
          if (!v18) {
            goto LABEL_43;
          }
        }
        int v17 = 1;
LABEL_39:
        if (v17) {
          goto LABEL_40;
        }
      }
LABEL_43:
      if ((a3 & 0x1000) == 0) {
        uint64_t v20 = self;
      }
      id context = a4;
      long long v29 = self;
      unint64_t v30 = a3 | 0x2000;
      long long v31 = v7;
      dispatch_sync_f((dispatch_queue_t)self->_dispatchQueue, &context, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
    }
  }
  else if ((a3 & 0x8000) != 0)
  {
    id v14 = (void (*)(id))*((void *)a4 + 2);
    v14(a4);
  }
  else if ((a3 & 0x4000) == 0)
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-performWithOptions:andBlock: was called on a MOC of NSConfinementConcurrencyType unexpectedly." userInfo:0]);
  }
}

- (uint64_t)_processRecentChanges:(uint64_t)a1
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v4 = 0;
    return v4 & 1;
  }
  uint64_t v2 = a1;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__processRecentChanges_);
  }
  int v3 = *(_DWORD *)(v2 + 40);
  if ((v3 & 8) != 0) {
    goto LABEL_7;
  }
  if ((v3 & 0x100) == 0)
  {
    -[NSManagedObjectContext _postRefreshedObjectsNotificationAndClearList](v2);
    -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
LABEL_7:
    char v4 = 1;
    return v4 & 1;
  }
  char v86 = 0;
  id v76 = 0;
  *(_DWORD *)(v2 + 40) = v3 | 0x808;
  id v100 = 0;
  v74 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E4F1D548] + 8);
  CFIndex v75 = *MEMORY[0x1E4F1D548];
  uint64_t v72 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
  v73 = *(void (__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E4F1D548] + 16);
  CFAllocatorRef v71 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  char v4 = 1;
  uint64_t v79 = v2;
  while (1)
  {
    uint64_t v5 = [*(id *)(v2 + 56) count];
    uint64_t v6 = [*(id *)(v2 + 72) count];
    if (!(v6 + v5 + [*(id *)(v2 + 64) count])) {
      break;
    }
    if (!v76) {
      id v76 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    }
    callBacks.versiouint64_t n = v75;
    callBacks.retaiuint64_t n = v74;
    callBacks.release = v73;
    callBacks.copyDescriptiouint64_t n = v72;
    callBacks.equal = 0;
    callBacks.hash = 0;
    CFMutableSetRef v7 = CFSetCreateMutable(v71, 0, &callBacks);
    CFMutableSetRef v8 = CFSetCreateMutable(v71, 0, &callBacks);
    CFMutableSetRef v9 = CFSetCreateMutable(v71, 0, &callBacks);
    CFMutableSetRef v10 = CFSetCreateMutable(v71, 0, &callBacks);
    CFMutableSetRef v11 = CFSetCreateMutable(v71, 0, &callBacks);
    -[NSManagedObjectContext _registerClearStateWithUndoManager](v79);
    CFMutableSetRef v84 = v11;
    CFMutableSetRef v85 = v7;
    CFMutableSetRef v82 = v9;
    CFMutableSetRef v83 = v8;
    CFMutableSetRef v81 = v10;
    uint64_t v2 = v79;
    if ((*(unsigned char *)(v79 + 40) & 2) == 0)
    {
      char v77 = 1;
LABEL_72:
      CFMutableSetRef v38 = v84;
      goto LABEL_73;
    }
    if ([*(id *)(v79 + 64) count] || objc_msgSend(*(id *)(v79 + 88), "count"))
    {
      v113.versiouint64_t n = v75;
      v113.retaiuint64_t n = v74;
      v113.release = v73;
      v113.copyDescriptiouint64_t n = v72;
      v113.equal = 0;
      v113.hash = 0;
      uint64_t v2 = v79;
      CFMutableSetRef v12 = CFSetCreateMutable(v71, 0, &v113);
      if ([*(id *)(v79 + 64) count])
      {
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        CFTypeRef v13 = *(void **)(v79 + 64);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v109 objects:v124 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v110;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v110 != v15) {
                objc_enumerationMutation(v13);
              }
              [(__CFSet *)v12 addObject:*(void *)(*((void *)&v109 + 1) + 8 * i)];
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v109 objects:v124 count:16];
          }
          while (v14);
        }
      }
      if ([*(id *)(v79 + 56) count])
      {
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        int v17 = *(void **)(v79 + 56);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v105 objects:v123 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v106;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v106 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void *)(*((void *)&v105 + 1) + 8 * j);
              if (v21 && (*(unsigned char *)(v21 + 16) & 0x20) != 0) {
                -[__CFSet addObject:](v12, "addObject:");
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v105 objects:v123 count:16];
          }
          while (v18);
        }
      }
      if ([*(id *)(v79 + 112) count])
      {
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        uint64_t v22 = *(void **)(v79 + 112);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v122 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v102;
          do
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v102 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = [(id)v79 objectRegisteredForID:*(void *)(*((void *)&v101 + 1) + 8 * k)];
              if (v26 && (*(unsigned char *)(v26 + 16) & 0x20) != 0) {
                [(__CFSet *)v12 addObject:v26];
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v122 count:16];
          }
          while (v23);
        }
      }
      unsigned __int8 v27 = atomic_load((unsigned __int8 *)(v79 + 48));
      if ((v27 & 1) == 0 && [(id)v79 persistentStoreCoordinator] && -[__CFSet count](v12, "count"))
      {
        long long v28 = +[_PFRoutines createDictionaryPartitioningObjectsByEntity:]((uint64_t)_PFRoutines, (uint64_t)v12);
        long long v29 = objc_alloc_init(NSFetchRequest);
        [(NSFetchRequest *)v29 setResultType:0];
        [(NSFetchRequest *)v29 setIncludesPendingChanges:0];
        [(NSFetchRequest *)v29 setIncludesSubentities:0];
        v118.versiouint64_t n = MEMORY[0x1E4F143A8];
        v118.retaiuint64_t n = (CFSetRetainCallBack)3221225472;
        v118.release = (CFSetReleaseCallBack)__92__NSManagedObjectContext__NSInternalChangeProcessing___prefetchObjectsForDeletePropagation___block_invoke;
        v118.copyDescriptiouint64_t n = (CFSetCopyDescriptionCallBack)&unk_1E544C4B8;
        v118.equal = (CFSetEqualCallBack)v29;
        v118.hash = (CFSetHashCallBack)v79;
        [(__CFDictionary *)v28 enumerateKeysAndObjectsUsingBlock:&v118];
        CFRelease(v28);
      }
      if ([(__CFSet *)v12 count])
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        ++*(_WORD *)(v79 + 46);
        *(_DWORD *)(v79 + 40) |= 0x1000u;
        v118.versiouint64_t n = v75;
        v118.retaiuint64_t n = v74;
        v118.release = v73;
        v118.copyDescriptiouint64_t n = v72;
        v118.equal = 0;
        v118.hash = 0;
        CFMutableSetRef v31 = CFSetCreateMutable(v71, 0, &v118);
        uint64_t v32 = (void *)[(__CFSet *)v12 mutableCopy];
        unint64_t v33 = 0;
        while ([v32 count])
        {
          [*(id *)(v79 + 64) removeAllObjects];
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          uint64_t v34 = [v32 countByEnumeratingWithState:&v114 objects:v125 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v115;
            do
            {
              for (uint64_t m = 0; m != v34; ++m)
              {
                if (*(void *)v115 != v35) {
                  objc_enumerationMutation(v32);
                }
                long long v37 = *(void **)(*((void *)&v114 + 1) + 8 * m);
                [(__CFSet *)v31 addObject:v37];
                if (v37) {
                  -[NSManagedObject _propagateDelete:](v37, 1);
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v114 objects:v125 count:16];
            }
            while (v34);
          }
          if (v33 < 0x1E)
          {
            ++v33;
          }
          else
          {
            if ([*(id *)(v79 + 64) isSubsetOfSet:v31]) {
              break;
            }
            unint64_t v33 = 0;
          }

          uint64_t v32 = (void *)[*(id *)(v79 + 64) mutableCopy];
        }

        *(void *)(v79 + 64) = v31;
        *(_DWORD *)(v79 + 40) &= ~0x1000u;
        --*(_WORD *)(v79 + 46);
        [v30 drain];
      }
      if (a2) {
        char v77 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)v79, *(void **)(v79 + 64), 2, (uint64_t *)&v100, (*(_DWORD *)(v79 + 40) >> 2) & 1, 0);
      }
      else {
        char v77 = 1;
      }

      goto LABEL_72;
    }
    char v77 = 1;
    CFMutableSetRef v38 = v11;
    uint64_t v2 = v79;
LABEL_73:
    long long v39 = (void *)-[NSManagedObjectContext _processPendingDeletions:withInsertions:withUpdates:withNewlyForgottenList:withRemovedChangedObjects:](v2, v83, v81, v38);
    long long v40 = -[NSManagedObjectContext _processPendingInsertions:withDeletions:withUpdates:]((id *)v2, v85, v82);
    long long v41 = -[NSManagedObjectContext _processPendingUpdates:](v2, v82);
    if (v41) {
      -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:](v2, (uint64_t)sel__undoUpdates_, v41, 0);
    }
    if (v40) {
      -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:](v2, (uint64_t)sel__undoInsertions_, v40, 0);
    }
    if (v39)
    {
      uint64_t v42 = [v39 count];
      v78 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      uint64_t v43 = [(__CFSet *)v84 count];
      if (v43) {
        uint64_t v80 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42];
      }
      else {
        uint64_t v80 = 0;
      }
      id v44 = objc_alloc(MEMORY[0x1E4F1C978]);
      if (v80) {
        uint64_t v45 = (uint64_t)v80;
      }
      else {
        uint64_t v45 = NSKeyValueCoding_NullValue;
      }
      long long v46 = objc_msgSend(v44, "initWithObjects:", v45, 0);

      [v78 addObject:v46];
      long long v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42];
      [v78 addObject:v47];

      if (*(void *)(*(void *)(v2 + 168) + 40) && v42)
      {
        for (uint64_t n = 0; n != v42; ++n)
        {
          long long v49 = (void *)[v39 objectAtIndex:n];
          long long v50 = v49;
          if (v49
            && (long long v51 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](v49, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1)) != 0)
          {
            [v47 addObject:v51];
          }
          else
          {
            [v47 addObject:NSKeyValueCoding_NullValue];
            long long v51 = 0;
          }

          if (v43)
          {
            uint64_t v52 = [(__CFSet *)v84 member:v50];
            uint64_t v53 = &NSKeyValueCoding_NullValue;
            if (v52) {
              uint64_t v53 = &NSArray_EmptyArray;
            }
            [v80 addObject:*v53];
          }
        }
      }
      -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:](v2, (uint64_t)sel__undoDeletions_, v39, (uint64_t)v78);
    }
    if (([*(id *)(*(void *)(v2 + 168) + 40) groupsByEvent] & 1) == 0)
    {
      if (([*(id *)(*(void *)(v2 + 168) + 40) isUndoing] & 1) == 0
        && ([*(id *)(*(void *)(v2 + 168) + 40) isRedoing] & 1) == 0)
      {
        [*(id *)(*(void *)(v2 + 168) + 40) endUndoGrouping];
      }
      *(_DWORD *)(v2 + 40) &= ~0x20u;
    }
    [*(id *)(v2 + 72) removeAllObjects];
    [*(id *)(v2 + 64) removeAllObjects];
    [*(id *)(v2 + 56) removeAllObjects];
    id v54 = (void *)[*(id *)(v2 + 112) copy];
    [*(id *)(v2 + 112) removeAllObjects];
    if ((v86 & 1) == 0) {
      *(_DWORD *)(v2 + 40) &= 0xFFFFF6F6;
    }
    uint64_t v55 = *(void *)(v2 + 168);
    CFRange v56 = *(void **)(v55 + 88);
    if (v56)
    {
      *(void *)(v55 + 88) = 0;
      uint64_t v55 = *(void *)(v2 + 168);
    }
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:]((void *)v2, v85, v83, v82, v54, v56, *(void *)(v55 + 104) != 0);
    -[NSManagedObjectContext _processRecentlyForgottenObjects:]((void *)v2, v81);
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v57 = [v41 countByEnumeratingWithState:&v95 objects:v121 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v96;
      do
      {
        for (iuint64_t i = 0; ii != v57; ++ii)
        {
          if (*(void *)v96 != v58) {
            objc_enumerationMutation(v41);
          }
          -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(void *)(*((void *)&v95 + 1) + 8 * ii));
        }
        uint64_t v57 = [v41 countByEnumeratingWithState:&v95 objects:v121 count:16];
      }
      while (v57);
    }

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v60 = [v40 countByEnumeratingWithState:&v91 objects:v120 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v92;
      do
      {
        for (juint64_t j = 0; jj != v60; ++jj)
        {
          if (*(void *)v92 != v61) {
            objc_enumerationMutation(v40);
          }
          -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(void *)(*((void *)&v91 + 1) + 8 * jj));
        }
        uint64_t v60 = [v40 countByEnumeratingWithState:&v91 objects:v120 count:16];
      }
      while (v60);
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v63 = [v39 countByEnumeratingWithState:&v87 objects:v119 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v88;
      do
      {
        for (kuint64_t k = 0; kk != v63; ++kk)
        {
          if (*(void *)v88 != v64) {
            objc_enumerationMutation(v39);
          }
          -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(void *)(*((void *)&v87 + 1) + 8 * kk));
        }
        uint64_t v63 = [v39 countByEnumeratingWithState:&v87 objects:v119 count:16];
      }
      while (v63);
    }

    char v86 = 1;
    char v4 = v77;
  }
  if ([*(id *)(v2 + 112) count])
  {
    if (!v76) {
      id v76 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    }
    -[NSManagedObjectContext _postRefreshedObjectsNotificationAndClearList](v2);
  }
  if ((v86 & 1) == 0) {
    *(_DWORD *)(v2 + 40) &= 0xFFFFF6F6;
  }
  id v66 = v100;
  [v76 drain];
  id v67 = v100;
  if (a2 && v100) {
    *a2 = v100;
  }
  id v68 = 0;
  -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
  return v4 & 1;
}

- (void)discardEditing
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  CFArrayRef v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v3)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    CFArrayRef v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }
  if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
  {
    if ([(NSManagedObjectContext *)self isEditing])
    {
      CFIndex Count = CFArrayGetCount(v3);
      CFIndex v5 = Count - 1;
      if (Count >= 1)
      {
        do
          objc_msgSend((id)CFArrayGetValueAtIndex(v3, v5--), "discardEditing");
        while (v5 != -1);
      }
    }
  }
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_postRefreshedObjectsNotificationAndClearList
{
  if ([*(id *)(a1 + 112) count]
    || (uint64_t v2 = *(void *)(a1 + 168), *(void *)(v2 + 88))
    || *(void *)(v2 + 104))
  {
    CFArrayRef v3 = (void *)MEMORY[0x18C127630]();
    if ([*(id *)(a1 + 112) count]) {
      char v4 = (void *)[*(id *)(a1 + 112) copy];
    }
    else {
      char v4 = 0;
    }
    CFIndex v5 = *(void **)(*(void *)(a1 + 168) + 88);
    [*(id *)(a1 + 112) removeAllObjects];
    *(void *)(*(void *)(a1 + 168) + 88) = 0;
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:]((void *)a1, 0, 0, 0, v4, v5, *(void *)(*(void *)(a1 + 168) + 104) != 0);
  }
}

void __90__NSManagedObjectContext__NSInternalNotificationHandling___registerAsyncReferenceCallback__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(v2 + 8));
    char v4 = WeakRetained;
    CFIndex v5 = *(const void **)(a1 + 40);
    if (WeakRetained)
    {
      if ((WeakRetained[42] & 4) == 0)
      {
        uint64_t v6 = (void *)MEMORY[0x18C127630]();
        -[_PFManagedObjectReferenceQueue _processReferenceQueue:]((uint64_t)v5, 0);
        if (*((void *)v4 + 3))
        {
          atomic_store(0, v4 + 51);
          __dmb(0xBu);
        }
      }
    }
  }
  else
  {
    char v4 = 0;
    CFIndex v5 = *(const void **)(a1 + 40);
  }

  CFRelease(v5);
}

uint64_t __56__NSManagedObjectContext_setPersistentStoreCoordinator___block_invoke(uint64_t a1)
{
  return -[NSManagedObjectContext _setPersistentStoreCoordinator:](*(void *)(a1 + 32), *(CFTypeRef *)(a1 + 40));
}

void *__41__NSManagedObjectContext_setMergePolicy___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(*(void *)(result[5] + 168) + 24);
  if ((void *)result[4] != v1)
  {
    uint64_t v2 = result;

    id v3 = NSErrorMergePolicy;
    if (v2[4]) {
      id v3 = (id)v2[4];
    }
    *(void *)(*(void *)(v2[5] + 168) + 24) = v3;
    char v4 = *(void **)(*(void *)(v2[5] + 168) + 24);
    return v4;
  }
  return result;
}

uint64_t __47__NSManagedObjectContext_setTransactionAuthor___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 128)];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 168);
    uint64_t v5 = *(void *)(v4 + 128);
    if (v3)
    {
      uint64_t v6 = *(void *)(v4 + 128);
      id v3 = (void *)[v3 copy];
      uint64_t v5 = v6;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 128) = v3;
    }
    else
    {
      *(void *)(v4 + 128) = 0;
    }
    return MEMORY[0x1F41817F8](v3, v5);
  }
  return result;
}

- (void)_createAndPostChangeNotification:(void *)a3 deletions:(void *)a4 updates:(void *)a5 refreshes:(void *)a6 deferrals:(int)a7 wasMerge:
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  CFRange v56 = a1;
  if (!a1) {
    return;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v57 = v13;
  int v53 = a7;
  id v55 = a3;
  if (![a6 count])
  {
    uint64_t v19 = 0;
    uint64_t v14 = 0;
    goto LABEL_50;
  }
  id v54 = a5;
  if ([a3 count])
  {
    uint64_t v14 = (void *)[a6 mutableCopy];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v15 = [a3 countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v67 != v17) {
            objc_enumerationMutation(a3);
          }
          [v14 removeObject:*(void *)(*((void *)&v66 + 1) + 8 * i)];
        }
        uint64_t v16 = [a3 countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v16);
    }
    if ([a2 count])
    {
      a5 = v54;
      if (v14) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    a5 = v54;
  }
  else
  {
    if ([a2 count])
    {
LABEL_16:
      uint64_t v14 = (void *)[a6 mutableCopy];
LABEL_17:
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v20 = [a2 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v63 != v22) {
              objc_enumerationMutation(a2);
            }
            [v14 addObject:*(void *)(*((void *)&v62 + 1) + 8 * j)];
          }
          uint64_t v21 = [a2 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (v21);
        a2 = v14;
        a5 = v54;
      }
      else
      {
        a2 = v14;
      }
      goto LABEL_31;
    }
    uint64_t v14 = 0;
  }
  if (v14) {
    a2 = v14;
  }
  else {
    a2 = a6;
  }
LABEL_31:
  if ([a4 count])
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v24 = [a4 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v19 = 0;
      uint64_t v26 = *(void *)v59;
      if (v14) {
        a6 = v14;
      }
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v59 != v26) {
            objc_enumerationMutation(a4);
          }
          uint64_t v28 = *(void *)(*((void *)&v58 + 1) + 8 * k);
          if ([a6 containsObject:v28])
          {
            if (!v19) {
              uint64_t v19 = (void *)[a4 mutableCopy];
            }
            [v19 removeObject:v28];
          }
        }
        uint64_t v25 = [a4 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v25);
    }
    else
    {
      uint64_t v19 = 0;
    }
    if (v19) {
      a4 = v19;
    }
    id v13 = v57;
    a5 = v54;
  }
  else
  {
    uint64_t v19 = 0;
    id v13 = v57;
  }
LABEL_50:
  if ([a2 count]) {
    [v13 setObject:a2 forKey:@"inserted"];
  }
  if ([v55 count]) {
    [v13 setObject:v55 forKey:@"deleted"];
  }
  long long v29 = v56;
  if ([a4 count]) {
    [v13 setObject:a4 forKey:@"updated"];
  }
  if (![a5 count]) {
    goto LABEL_74;
  }
  [v13 setObject:a5 forKey:@"refreshed_objectIDs"];
  unint64_t v30 = [a5 count];
  unint64_t v31 = v30;
  if (v30 <= 1) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v30;
  }
  if (v30 >= 0x201) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v32;
  }
  uint64_t v34 = &v52[-((8 * v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (v30 >= 0x201)
  {
    uint64_t v34 = (unsigned char *)NSAllocateScannedUncollectable();
    [a5 getObjects:v34];
LABEL_67:
    uint64_t v36 = 0;
    uint64_t v35 = 0;
    do
    {
      uint64_t v37 = [v29 objectRegisteredForID:*(void *)&v34[8 * v36]];
      if (v37) {
        *(void *)&v34[8 * v35++] = v37;
      }
      ++v36;
    }
    while (v31 != v36);
    goto LABEL_71;
  }
  bzero(&v52[-((8 * v33 + 15) & 0xFFFFFFFFFFFFFFF0)], 8 * v32);
  [a5 getObjects:v34];
  if (v31) {
    goto LABEL_67;
  }
  uint64_t v35 = 0;
LABEL_71:
  CFMutableSetRef v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v34 count:v35];
  if (v31 >= 0x201) {
    NSZoneFree(0, v34);
  }
  id v13 = v57;
  [v57 setObject:v38 forKey:@"refreshed"];

LABEL_74:
  if ([v13 count])
  {
    if (byte_1EB270AB6) {
      objc_msgSend(v13, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v29), @"managedObjectContext");
    }
    if (v53) {
      [v13 setObject:NSSet_EmptySet forKey:@"NSObjectsChangedByMergeChangesKey"];
    }
    -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)v29, v13);
  }
  if (*(void *)(v29[21] + 104))
  {
    long long v39 = (void *)[v13 mutableCopy];
    if (byte_1EB270AB6) {
      objc_msgSend(v39, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v29), @"managedObjectContext");
    }
    [v39 removeObjectForKey:@"NSObjectsChangedByMergeChangesKey"];
    [v39 addEntriesFromDictionary:*(void *)(v29[21] + 104)];
    if ([v39 count])
    {
      id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (byte_1EB270AB6) {
        objc_msgSend(v40, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v29), @"managedObjectContext");
      }
      long long v41 = (NSQueryGenerationToken *)[v39 objectForKey:@"newQueryGeneration"];
      if (v41
        || (long long v51 = (NSQueryGenerationToken *)[v29 _queryGenerationToken]) != 0
        && (long long v41 = v51,
            v51 != +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"))&& v41 != +[NSQueryGenerationToken currentQueryGenerationToken])
      {
        [v40 setObject:v41 forKey:@"newQueryGeneration"];
      }
      for (uint64_t m = 0; m != 5; ++m)
      {
        uint64_t v43 = (void *)[v39 objectForKey:off_1E544C568[m]];
        if ([v43 count]) {
          id v44 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v43);
        }
        else {
          id v44 = (id)NSSet_EmptySet;
        }
        uint64_t v45 = v44;
        long long v46 = off_1E544C590[m];
        long long v47 = (void *)[v39 objectForKey:v46];
        if ([v45 count] || objc_msgSend(v47, "count"))
        {
          id v48 = +[_PFRoutines newSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v45, v47);

          [v40 setObject:v48 forKey:v46];
          uint64_t v45 = v48;
        }
        else
        {
          [v40 removeObjectForKey:v46];
        }
      }
      id v49 = (id)[v40 copy];

      long long v50 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      long long v29 = v56;
      [v50 postNotificationName:@"_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification" object:v56 userInfo:v49];
      [v50 postNotificationName:@"NSManagedObjectContextDidMergeChangesObjectIDsNotification" object:v29 userInfo:v49];
      id v13 = v57;
    }

    *(void *)(v29[21] + 104) = 0;
  }
}

- (void)_processPendingInsertions:(id *)a1 withDeletions:(void *)a2 withUpdates:(void *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1[9] count];
  if (!v6) {
    return 0;
  }
  unint64_t v7 = v6;
  CFMutableSetRef v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  if (v7 >= 0x201) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v7;
  }
  unint64_t v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  CFMutableSetRef v11 = (char *)v17 - v10;
  if (v7 > 0x200) {
    CFMutableSetRef v11 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v17 - v10, 8 * v7);
  }
  [a1[9] getObjects:v11];
  for (uint64_t i = 0; i != v7; ++i)
  {
    uint64_t v13 = *(void *)&v11[8 * i];
    if (!v13)
    {
      [a1[10] addObject:0];
      goto LABEL_19;
    }
    int v14 = *(_DWORD *)(v13 + 16);
    *(_DWORD *)(v13 + 16) = v14 & 0xFFFFFFFD;
    if ((v14 & 8) != 0)
    {
      uint64_t v15 = a3;
LABEL_17:
      [v15 addObject:v13];
      continue;
    }
    if ((v14 & 0x10) != 0)
    {
      uint64_t v15 = a2;
      goto LABEL_17;
    }
    if ((v14 & 0x20) != 0)
    {
      *(_DWORD *)(v13 + 16) = v14 & 0xFFFFFFDD;
      [a1[11] removeObject:v13];
    }
    else
    {
      [a1[10] addObject:v13];
      *(_DWORD *)(v13 + 16) |= 0x10u;
    }
LABEL_19:
    [v8 addObject:v13];
    [a2 addObject:v13];
    [a1[7] removeObject:v13];
    if (v13) {
      *(_DWORD *)(v13 + 16) &= ~1u;
    }
  }
  if (v7 >= 0x201) {
    NSZoneFree(0, v11);
  }
  return v8;
}

- (void)_processRecentlyForgottenObjects:(void *)a1
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a2 count];
  unint64_t v5 = MEMORY[0x1F4188790]();
  CFMutableSetRef v8 = (char *)v12 - v7;
  if (v5 >= 0x201)
  {
    CFMutableSetRef v8 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v8];
  }
  else
  {
    bzero((char *)v12 - v7, 8 * v6);
    [a2 getObjects:v8];
    if (!v4) {
      return;
    }
  }
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = *(void *)&v8[8 * v9];
    if (v10) {
      uint64_t v11 = _insertion_fault_handler;
    }
    else {
      uint64_t v11 = 0;
    }
    -[NSFaultHandler turnObject:intoFaultWithContext:](v11, *(void *)&v8[8 * v9], (uint64_t)a1);
    [a1 _forgetObject:v10 propagateToObjectStore:0 removeFromRegistry:1];
    ++v9;
  }
  while (v4 != v9);
  if (v4 >= 0x201) {
    NSZoneFree(0, v8);
  }
}

- (void)_processPendingUpdates:(uint64_t)a1
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 56) count];
  if (!v4) {
    return 0;
  }
  unint64_t v5 = v4;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  if (v5 >= 0x201) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v5;
  }
  unint64_t v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)v14 - v8;
  if (v5 > 0x200) {
    uint64_t v9 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v14 - v8, 8 * v5);
  }
  [*(id *)(a1 + 56) getObjects:v9];
  for (uint64_t i = 0; i != v5; ++i)
  {
    uint64_t v11 = *(void *)&v9[8 * i];
    if (v11)
    {
      int v12 = *(_DWORD *)(v11 + 16);
      *(_DWORD *)(v11 + 16) = v12 & 0xFFFFFFFE;
      if ((v12 & 0x30) != 0) {
        goto LABEL_14;
      }
      *(_DWORD *)(v11 + 16) = v12 & 0xFFFFFFF6 | 8;
    }
    [*(id *)(a1 + 96) addObject:v11];
LABEL_14:
    [v6 addObject:v11];
    [a2 addObject:v11];
  }
  if (v5 >= 0x201) {
    NSZoneFree(0, v9);
  }
  return v6;
}

- (uint64_t)_processPendingDeletions:(void *)a3 withInsertions:(void *)a4 withUpdates:withNewlyForgottenList:withRemovedChangedObjects:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [*(id *)(a1 + 64) count];
  if (!v8) {
    return 0;
  }
  unint64_t v9 = v8;
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  if (v9 >= 0x201) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v9;
  }
  unint64_t v12 = (8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = (char *)v21 - v12;
  if (v9 > 0x200) {
    uint64_t v13 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v21 - v12, 8 * v9);
  }
  [*(id *)(a1 + 64) getObjects:v13];
  for (uint64_t i = 0; i != v9; ++i)
  {
    uint64_t v15 = *(void *)&v13[8 * i];
    if (v15)
    {
      *(_DWORD *)(v15 + 16) &= ~4u;
      if (![*(id *)(a1 + 72) containsObject:v15])
      {
        unsigned int v18 = *(_DWORD *)(v15 + 16);
        if ((v18 & 0x10) != 0)
        {
          [*(id *)(a1 + 80) removeObject:v15];
          *(_DWORD *)(v15 + 16) &= ~0x10u;
          uint64_t v19 = a3;
        }
        else
        {
          if ((v18 & 8) != 0)
          {
            [*(id *)(a1 + 96) removeObject:v15];
            [a4 addObject:v15];
            unsigned int v18 = *(_DWORD *)(v15 + 16) & 0xFFFFFFF7;
          }
          *(_DWORD *)(v15 + 16) = v18 | 0x20;
LABEL_19:
          uint64_t v19 = *(void **)(a1 + 88);
        }
        [v19 addObject:v15];
        uint64_t v17 = (void *)v10;
LABEL_22:
        [v17 addObject:v15];
        [*(id *)(a1 + 56) removeObject:v15];
        if (v15) {
          *(_DWORD *)(v15 + 16) &= ~1u;
        }
        goto LABEL_24;
      }
    }
    else if (([*(id *)(a1 + 72) containsObject:0] & 1) == 0)
    {
      goto LABEL_19;
    }
    [*(id *)(a1 + 64) removeObject:v15];
    [*(id *)(a1 + 72) removeObject:v15];
    if (v15)
    {
      int v16 = *(_DWORD *)(v15 + 16);
      *(_DWORD *)(v15 + 16) = v16 & 0xFFFFFFFD;
      uint64_t v17 = a3;
      if ((v16 & 0x38) != 0) {
        continue;
      }
      goto LABEL_22;
    }
    [a3 addObject:0];
    [*(id *)(a1 + 56) removeObject:0];
LABEL_24:
    [a2 addObject:v15];
  }
  if (v9 >= 0x201) {
    NSZoneFree(0, v13);
  }
  return v10;
}

- (void)_setUndoManager:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(*(void *)(a1 + 168) + 40) != a2)
    {
      -[NSManagedObjectContext _stopObservingUndoManagerNotifications](a1);

      *(void *)(*(void *)(a1 + 168) + 40) = a2;
      if (a2)
      {
        id v4 = a2;
        -[NSManagedObjectContext _startObservingUndoManagerNotifications](a1);
      }
    }
  }
}

void __41__NSManagedObjectContext_setUndoManager___block_invoke(uint64_t a1)
{
}

uint64_t __43__NSManagedObjectContext_transactionAuthor__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 168) + 128) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __30__NSManagedObjectContext_name__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 168) + 168) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke;
  v4[3] = &unk_1E544BB28;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  _perform((unint64_t)self, (uint64_t)v4);
}

void __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 168);
  id v4 = *(void **)(v3 + 120);
  if (v2 != v4)
  {
    if (v2)
    {
      unint64_t v5 = *(void **)(v3 + 120);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 120) = v2;
      id v4 = v5;
    }
    else
    {
      *(void *)(v3 + 120) = 0;
    }
  }
}

void __34__NSManagedObjectContext_setName___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 168) + 168) = *(void *)(a1 + 40);
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if ((v2[42] & 8) != 0)
  {
    __str[0] = 0;
    if (*(void *)(a1 + 40))
    {
      snprintf(__str, 0x1FFuLL, "NSManagedObjectContext %p: ", v2);
      [*(id *)(a1 + 40) UTF8String];
      __strlcat_chk();
    }
    else
    {
      snprintf(__str, 0x1FFuLL, "NSManagedObjectContext %p", v2);
    }
    uint64_t v3 = strdup(__str);
    __dmb(0xBu);
    id v4 = *(char **)(*(void *)(*(void *)(a1 + 32) + 24) + *(unsigned __int16 *)(MEMORY[0x1E4F147A8] + 2));
    unint64_t v5 = v4;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 32) + 24)+ *(unsigned __int16 *)(MEMORY[0x1E4F147A8] + 2)), (unint64_t *)&v5, (unint64_t)v3);
    if (v5 == v4)
    {
      if (!v4) {
        return;
      }
      uint64_t v6 = v8;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      uint64_t v7 = __34__NSManagedObjectContext_setName___block_invoke_3;
    }
    else
    {
      uint64_t v6 = block;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      uint64_t v7 = __34__NSManagedObjectContext_setName___block_invoke_2;
      id v4 = v3;
    }
    v6[2] = v7;
    v6[3] = &__block_descriptor_40_e5_v8__0l;
    v6[4] = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __67__NSManagedObjectContext__setAutomaticallyMergesChangesFromParent___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  unsigned int v3 = *(_DWORD *)(v2 + 40);
  if (((v3 >> 23) & 1) != v1)
  {
    *(_DWORD *)(v2 + 40) = v3 & 0xFF7FFFFF | (v1 << 23);
    uint64_t v4 = *(void *)(result + 32);
    if ((*(unsigned char *)(v4 + 42) & 0x80) != 0)
    {
      if (*(void *)(v4 + 32) && *(void *)(v4 + 24))
      {
        uint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        return objc_msgSend(v6, "addObserver:selector:name:object:");
      }
    }
    else
    {
      unint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      return objc_msgSend(v5, "removeObserver:name:object:");
    }
  }
  return result;
}

uint64_t __60__NSManagedObjectContext_setShouldDeleteInaccessibleFaults___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFFEFFFFF | (*(unsigned __int8 *)(result + 40) << 20);
  return result;
}

- (void)mergeChangesFromContextDidSaveNotification:(NSNotification *)notification
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  unint64_t v5 = [(NSNotification *)notification object];
  if (v5 != self)
  {
    uint64_t v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(NSString *)[(NSNotification *)notification name] isEqualToString:@"com.apple.coredata.ubiquity.importer.didfinishimport"])
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(NSNotification *)notification userInfo];
      v14[0] = self;
      unint64_t v9 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v10 = (NSManagedObjectContext **)v14;
LABEL_10:
      objc_msgSend(v7, "_mergeChangesFromRemoteContextSave:intoContexts:", v8, objc_msgSend(v9, "arrayWithObjects:count:", v10, 1));
      return;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [(NSManagedObjectContext *)v6 persistentStoreCoordinator];
      if (v11 != [(NSManagedObjectContext *)self persistentStoreCoordinator])
      {
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = [(NSNotification *)notification userInfo];
        uint64_t v13 = self;
        unint64_t v9 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v10 = &v13;
        goto LABEL_10;
      }
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [(NSManagedObjectContext *)self _mergeChangesFromDidSaveDictionary:[(NSNotification *)notification userInfo] usingObjectIDs:0];
    [v12 drain];
  }
}

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke(uint64_t result)
{
  if (*(void *)(result + 48))
  {
    uint64_t v1 = result;
    unint64_t v2 = 0;
    do
    {
      if (*(void *)(*(void *)(v1 + 56) + 8 * v2))
      {
        uint64_t result = objc_msgSend(*(id *)(v1 + 32), "objectRegisteredForID:");
        if (result)
        {
          uint64_t v3 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24);
          *(unsigned char *)(v3 + v2) |= 1u;
        }
      }
      ++v2;
    }
    while (v2 < *(void *)(v1 + 48));
  }
  return result;
}

+ (void)_mergeChangesFromRemoteContextSave:(id)a3 intoContexts:(id)a4
{
}

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v5 = 0;
  uint64_t v3 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:&v5];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];
  }
  return [v2 drain];
}

double __47__NSManagedObjectContext_setStalenessInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 144) = result;
  return result;
}

uint64_t __73__NSManagedObjectContext__NSCoreDataSPI___setAllowsExpandedUserInfoKeys___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xDFFFFFFF | (*(unsigned __int8 *)(result + 40) << 29);
  return result;
}

uint64_t __68__NSManagedObjectContext__NSCoreDataSPI__setShouldRefreshAfterSave___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFBFFFFFF | (*(unsigned __int8 *)(result + 40) << 26);
  return result;
}

unsigned char *__83__NSManagedObjectContext__automaticallyMergeChangesFromContextDidSaveNotification___block_invoke(uint64_t a1)
{
  double result = *(unsigned char **)(a1 + 32);
  if ((result[42] & 0x80) != 0) {
    return (unsigned char *)[result mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
  }
  return result;
}

void __31__NSManagedObjectContext_save___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3[21] + 96) == v2)
  {
    objc_msgSend(v3, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0);
    id v2 = *(void **)(a1 + 40);
  }
}

uint64_t __95__NSManagedObjectContext__NSInternalNotificationHandling___sendOrEnqueueNotification_selector___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (!*(_DWORD *)(v1 + 16))
    {
      uint64_t v2 = a1;
      a1 = [*(id *)(a1 + 32) _isDeallocating];
      uint64_t v1 = *(void *)(v2 + 32);
      if ((a1 & 1) == 0)
      {
        objc_msgSend(*(id *)(v2 + 32), "performSelector:withObject:", *(void *)(v2 + 48), objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", *(void *)(v2 + 40)));
        -[NSManagedObjectContext _processReferenceQueue:](*(void *)(v2 + 32), 0);
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }
  }

  return MEMORY[0x1F41817F8](a1, v1);
}

- (uint64_t)_postObjectsDidChangeNotificationWithUserInfo:(uint64_t)result
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[a2 mutableCopy];
    if (byte_1EB270AB6) {
      objc_msgSend(v4, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, v3), @"managedObjectContext");
    }
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v6 = (void *)[a2 objectForKey:off_1E544C4D8[i]];
      if ([v6 count])
      {
        uint64_t v7 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v6);
        [v4 setObject:v7 forKey:off_1E544C4F8[i]];
      }
    }
    id v8 = (id)[v4 copy];

    unint64_t v9 = (void *)[a2 mutableCopy];
    [v9 removeObjectForKey:@"refreshed_objectIDs"];
    id v10 = (id)[v9 copy];

    uint64_t v11 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"_NSObjectsChangedInManagingContextPrivateNotification" object:v3 userInfo:v8];
    [v11 postNotificationName:@"NSObjectsChangedInManagingContextNotification" object:v3 userInfo:v10];
    double result = +[NSManagedObject instancesRespondToSelector:sel__willChange_Swift_Trampoline];
    if (result)
    {
      for (uint64_t j = 0; j != 4; ++j)
      {
        uint64_t v13 = (void *)[a2 objectForKey:off_1E544C4D8[j]];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          do
          {
            for (uint64_t k = 0; k != v15; ++k)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              unsigned int v18 = *(void **)(*((void *)&v28 + 1) + 8 * k);
              if ([v18 bindableObjectPublisher]) {
                objc_msgSend(v18, "_willChange_Swift_Trampoline");
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }
          while (v15);
        }
      }
      uint64_t v19 = (void *)[a2 objectForKey:@"refreshed"];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      double result = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (result)
      {
        uint64_t v20 = result;
        uint64_t v21 = *(void *)v25;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void **)(*((void *)&v24 + 1) + 8 * v22);
            if ([v23 bindableObjectPublisher]) {
              objc_msgSend(v23, "_willChange_Swift_Trampoline");
            }
            ++v22;
          }
          while (v20 != v22);
          double result = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
          uint64_t v20 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (id)_delegate
{
  return (id)*((void *)self->_additionalPrivateIvars + 2);
}

- (id)databaseStatistics
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v3 = (void *)[self->_additionalPrivateIvars[20] copy];

  return v3;
}

+ (NSManagedObjectContext)allocWithZone:(_NSZone *)a3
{
  return (NSManagedObjectContext *)_PFAllocateObject((Class)a1, 0);
}

uint64_t __106__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke(uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  -[NSManagedObjectContext lockObjectStore](a1[4]);
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v4 = (void *)a1[5];
    uint64_t v3 = a1[6];
    if ([v4 count])
    {
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v4);
            }
            id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            if (([v10 isTemporaryID] & 1) == 0) {
              [v5 addObject:v10];
            }
          }
          uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
      [*(id *)(v2 + 32) managedObjectContextDidRegisterObjectsWithIDs:v5 generation:v3];
    }
  }
  uint64_t v11 = a1[4];

  return -[NSManagedObjectContext unlockObjectStore](v11);
}

uint64_t __108__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke(uint64_t a1)
{
  -[NSManagedObjectContext lockObjectStore](*(void *)(a1 + 32));
  -[NSManagedObjectContext _informParentStoreNoLongerInterestedInObjectIDs:generation:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);

  return -[NSManagedObjectContext unlockObjectStore](v2);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if ((void *)qword_1EB2706B8 == context
    && (!self || self->_ignoreChangeNotification <= 0)
    && (*((unsigned char *)object + 17) & 0x20) == 0)
  {
    uint64_t v11 = (void *)[object entity];
    id v12 = v11;
    if (v11) {
      long long v13 = objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", keyPath);
    }
    else {
      long long v13 = 0;
    }
    if ([v13 _propertyType] != 4) {
      long long v13 = 0;
    }
    if (v13) {
      uint64_t v14 = [v13 inverseRelationship];
    }
    else {
      uint64_t v14 = 0;
    }
    if ([v13 _isToManyRelationship]
      && (unint64_t v15 = [v13 _entitysReferenceID],
          uint64_t v16 = _kvcPropertysPrimitiveGetters(v12),
          (Property = _PF_Handler_Public_GetProperty((id **)object, v15, (uint64_t)keyPath, *(void *)(v16 + 8 * v15))) != 0)
      && ((uint64_t v18 = Property, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([v18 _shouldProcessKVOChange] & 1) == 0)
    {
      _PFFastMOCObjectWillChange((uint64_t)self, object);
    }
    else
    {
      [object _didChangeValue:change forRelationship:v13 named:keyPath withInverse:v14];
    }
  }
}

uint64_t __92__NSManagedObjectContext__NestedContextSupport__newValuesForObjectWithID_withContext_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 8))
  {
    uint64_t v3 = PF_CALLOC_OBJECT_ARRAY(2);
    *uint64_t v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3[1] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 8) = v3;
  }
  if ([v2 isTemporaryID])
  {
    uint64_t v4 = [**(id **)(*(void *)(*(void *)(a1 + 40) + 168) + 8) objectForKey:v2];
    if (v4) {
      uint64_t v2 = (void *)v4;
    }
  }
  uint64_t result = [*(id *)(a1 + 40) objectRegisteredForID:v2];
  if (result)
  {
    uint64_t v6 = (_DWORD *)result;
    uint64_t result = [(id)result isFault];
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)-[NSFaultHandler fulfillFault:withContext:error:]((id)_insertion_fault_handler, v6, *(void *)(a1 + 40), 0);
      if (result)
      {
        uint64_t v7 = (void *)[v6 entity];
        uint64_t v8 = v7[13];
        unint64_t v9 = (void *)v7[14];
        uint64_t v10 = *(void *)(v8 + 40);
        uint64_t v11 = _kvcPropertysPrimitiveGetters(v7);
        id v12 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v8];
        uint64_t v17 = [(NSKnownKeysDictionary *)v12 values];
        unint64_t v18 = v9[6];
        uint64_t v19 = v9[7];
        if (v18 < v19 + v18)
        {
          do
          {
            _PF_Handler_Primitive_GetProperty((id **)v6, v18, *(void *)(v10 + 8 * v18), *(void *)(v11 + 8 * v18), v13, v14, v15, v16);
            *(void *)(v17 + 8 * v18++) = v20;
            --v19;
          }
          while (v19);
        }
        unint64_t v21 = v9[12];
        uint64_t v22 = v9[13];
        if (v21 < v22 + v21)
        {
          do
          {
            _PF_Handler_Primitive_GetProperty((id **)v6, v21, *(void *)(v10 + 8 * v21), *(void *)(v11 + 8 * v21), v13, v14, v15, v16);
            *(void *)(v17 + 8 * v21++) = (id)[v23 objectID];
            --v22;
          }
          while (v22);
        }
        uint64_t result = -[_PFTempNestedSnapshot initWithOwnedKKsD:andVersion:]([_PFTempNestedSnapshot alloc], "initWithOwnedKKsD:andVersion:", v12, [v6 _versionReference]);
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    -[NSManagedObjectContext lockObjectStore](*(void *)(a1 + 40));
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(*(void *)(a1 + 40) + 32) newValuesForObjectWithID:v2 withContext:*(void *)(a1 + 48) error:0];
    return -[NSManagedObjectContext unlockObjectStore](*(void *)(a1 + 40));
  }
  return result;
}

void __107__NSManagedObjectContext__NestedContextSupport__newValueForRelationship_forObjectWithID_withContext_error___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 8))
  {
    uint64_t v3 = PF_CALLOC_OBJECT_ARRAY(2);
    *uint64_t v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3[1] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 8) = v3;
  }
  if ([v2 isTemporaryID])
  {
    uint64_t v4 = [**(id **)(*(void *)(*(void *)(a1 + 40) + 168) + 8) objectForKey:v2];
    if (v4) {
      uint64_t v2 = (void *)v4;
    }
  }
  uint64_t v5 = (unsigned int *)[*(id *)(a1 + 40) objectRegisteredForID:v2];
  if (v5)
  {
    uint64_t v6 = v5;
    if (([v5 isFault] & 1) == 0)
    {
      uint64_t v7 = [*(id *)(a1 + 48) _entitysReferenceID];
      unint64_t v8 = v7;
      uint64_t v9 = v6[5];
      uint64_t v10 = v9 ? (char *)v6 + v9 : 0;
      if ((v10[(v7 >> 3) - (((unint64_t)v6[4] >> 22) & 0x3FC)] >> (v7 & 7)))
      {
        uint64_t v11 = (void *)[v6 entity];
        uint64_t v12 = _kvcPropertysPrimitiveGetters(v11);
        _PF_Handler_Primitive_GetProperty((id **)v6, v8, *(void *)(*(void *)(v11[13] + 40) + 8 * v8), *(void *)(v12 + 8 * v8), v13, v14, v15, v16);
        unint64_t v18 = v17;
        unint64_t v19 = [v17 count];
        v30[1] = v30;
        unint64_t v20 = MEMORY[0x1F4188790](v19);
        id v23 = (char *)v30 - v22;
        if (v20 > 0x200) {
          id v23 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)v30 - v22, 8 * v21);
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v32 = 0u;
        long long v31 = 0u;
        uint64_t v24 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = 0;
          uint64_t v27 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v18);
              }
              *(void *)&v23[8 * v26 + 8 * i] = *(void *)(*(void *)(*((void *)&v31 + 1) + 8 * i) + 40);
            }
            uint64_t v25 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
            v26 += i;
          }
          while (v25);
        }
        uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v23 count:v19];
        if (v19 >= 0x201) {
          NSZoneFree(0, v23);
        }
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v29;
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    -[NSManagedObjectContext lockObjectStore](*(void *)(a1 + 40));
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(*(void *)(a1 + 40) + 32) newValueForRelationship:*(void *)(a1 + 48) forObjectWithID:v2 withContext:*(void *)(a1 + 56) error:0];
    -[NSManagedObjectContext unlockObjectStore](*(void *)(a1 + 40));
  }
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__12;
  uint64_t v13 = __Block_byref_object_dispose__12;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__NSManagedObjectContext__NestedContextSupport__newValueForRelationship_forObjectWithID_withContext_error___block_invoke;
  v8[3] = &unk_1E544C638;
  v8[4] = a4;
  void v8[5] = self;
  v8[7] = a5;
  v8[8] = &v9;
  v8[6] = a3;
  _perform((unint64_t)self, (uint64_t)v8);
  uint64_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)_isSwiftBound
{
  return *(_DWORD *)&self->_flags >> 31;
}

- (uint64_t)_batchRetainedObjects:(uint64_t)a1 forCount:(uint64_t)a2 withIDs:(uint64_t)a3 optionalHandler:(id *)a4 withInlineStorage:(uint64_t)a5
{
  uint64_t v29 = a5;
  uint64_t result = 0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1 && a3)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 8 * a3;
    uint64_t v12 = a3;
    do
    {
      id Value = (id)_PFCMT_GetValue(*(void **)(a1 + 120), a4[v10 / 8]);
      if (Value)
      {
        id Value = Value;
        uint64_t v12 = (v12 - 1);
      }
      *(void *)(a2 + v10) = Value;
      v10 += 8;
    }
    while (v11 != v10);
    if (v12)
    {
      unint64_t v28 = [*a4 entity];
      uint64_t v14 = (void *)_PFFastEntityClass(v28);
      uint64_t v25 = (uint64_t)&v25;
      uint64_t v27 = v12;
      MEMORY[0x1F4188790](v14);
      uint64_t v16 = (char *)&v25 - v15;
      if (v12 > 0x200) {
        uint64_t v16 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v25 - v15, 8 * v12);
      }
      uint64_t v26 = a3;
      if (objc_msgSend(v14, "allocBatch:withEntity:count:", v16, v28, v12, v25) < v12) {
        [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not allocate memory." userInfo:0];
      }
      uint64_t v17 = 0;
      unsigned int v18 = 0;
      do
      {
        unint64_t v19 = *(void **)&v16[8 * v17];
        do
          unsigned int v20 = v18;
        while (*(void *)(a2 + 8 * v18++));
        uint64_t v22 = v20;
        id v23 = a4[v20];
        _PFfastOidRetain(0, v23);
        [v19 _initWithEntity:v28 withID:v23 withHandler:v29 withContext:a1];
        v19[7] = *(void *)(a1 + 152);
        *(void *)(a2 + 8 * v22) = v19;
        _PFCMT_SetValue(*(void *)(a1 + 120), v23, v19);
        uint64_t v24 = **(void ***)(a1 + 168);
        if (v24 && [v24 containsObject:v23])
        {
          if (![v19 managedObjectContext]) {
            -[NSManagedObjectContext _forceRegisterLostFault:](a1, v19);
          }
          [(id)a1 deleteObject:v19];
        }
        ++v17;
      }
      while (v17 != v27);
      atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 152) + 8), v12);
      if (v12 >= 0x201) {
        NSZoneFree(0, v16);
      }
      return v26;
    }
    else
    {
      return a3;
    }
  }
  return result;
}

- (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3
{
  BOOL v3 = a3;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if (v3) {
    int v5 = 0x40000000;
  }
  else {
    int v5 = 0;
  }
  self->_flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xBFFFFFFF | v5);
}

void __34__NSManagedObjectContext_setName___block_invoke_3(uint64_t a1)
{
}

- (int64x2_t)_updateDatabaseStaticsWithCacheStats:(uint64_t)a1
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__updateDatabaseStaticsWithCacheStats_);
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 168) + 160);
    if (v4
      || (*(void *)(*(void *)(a1 + 168) + 160) = [[NSSQLiteDatabaseStatistics alloc] initWithPageSize:a2[1].i64[1]], (uint64_t v4 = *(void *)(*(void *)(a1 + 168) + 160)) != 0))
    {
      uint64_t v6 = a2[1].i64[0];
      int64x2_t result = vaddq_s64(*(int64x2_t *)(v4 + 8), (int64x2_t)vextq_s8(*a2, *a2, 8uLL));
      *(int64x2_t *)(v4 + 8) = result;
      *(void *)(v4 + 24) += v6;
    }
  }
  return result;
}

- (BOOL)trackSQLiteDatabaseStatistics
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (uint64_t)_registerClearStateWithUndoManager
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 40) & 0x20) == 0)
    {
      uint64_t v2 = [NSNumber numberWithShort:*(__int16 *)(result + 44)];
      int64x2_t result = *(void *)(*(void *)(v1 + 168) + 40);
      if (result)
      {
        if (([(id)result groupsByEvent] & 1) == 0
          && ([*(id *)(*(void *)(v1 + 168) + 40) isUndoing] & 1) == 0
          && ([*(id *)(*(void *)(v1 + 168) + 40) isRedoing] & 1) == 0)
        {
          *(_DWORD *)(v1 + 40) |= 0x800u;
          [*(id *)(*(void *)(v1 + 168) + 40) beginUndoGrouping];
          *(_DWORD *)(v1 + 40) &= ~0x800u;
        }
        BOOL v3 = (void *)[*(id *)(v1 + 96) copy];
        uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v2, v3, 0);

        int64x2_t result = [*(id *)(*(void *)(v1 + 168) + 40) registerUndoWithTarget:v1 selector:sel__clearChangedThisTransaction_ object:v4];
      }
      *(_DWORD *)(v1 + 40) |= 0x20u;
    }
  }
  return result;
}

- (uint64_t)_enqueueEndOfEventNotification
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 40) & 9) == 0)
    {
      int64x2_t result = [*(id *)(*(void *)(result + 168) + 40) groupsByEvent];
      if (result) {
        int64x2_t result = [*(id *)(*(void *)(v1 + 168) + 40) registerUndoWithTarget:v1 selector:sel__noop_ object:NSArray_EmptyArray];
      }
      *(_DWORD *)(v1 + 40) |= 1u;
    }
  }
  return result;
}

- (uint64_t)_registerUndoForOperation:(void *)a3 withObjects:(uint64_t)a4 withExtraArguments:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 168) + 40))
  {
    uint64_t v8 = [a3 count];
    uint64_t result = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    if (v8)
    {
      unint64_t v10 = (void *)result;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v12 = (void *)[a3 objectAtIndex:i];
        uint64_t v13 = -[NSManagedObject _newSnapshotForUndo__](v12);
        if ([(NSKnownKeysDictionary *)v13 count]) {
          uint64_t v14 = (uint64_t)v13;
        }
        else {
          uint64_t v14 = NSKeyValueCoding_NullValue;
        }
        [v10 addObject:v14];

        -[NSManagedObject _setLastSnapshot__:](v12, 0);
      }
      if (a4) {
        uint64_t v15 = a4;
      }
      else {
        uint64_t v15 = NSKeyValueCoding_NullValue;
      }
      uint64_t v16 = *(void **)(*(void *)(a1 + 168) + 40);
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", a3, v10, v15, objc_msgSend(NSNumber, "numberWithShort:", *(__int16 *)(a1 + 44)), 0);
      return [v16 registerUndoWithTarget:a1 selector:a2 object:v17];
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t result = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (result)
    {
      uint64_t v18 = result;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(a3);
          }
          -[NSManagedObject _setLastSnapshot__:](*(void **)(*((void *)&v21 + 1) + 8 * v20++), 0);
        }
        while (v18 != v20);
        uint64_t result = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v18 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_didSaveChanges
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  CFMutableSetRef v81 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  uint64_t v2 = *(void **)(*(void *)(a1 + 168) + 136);
  if ([v2 count])
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v102 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          uint64_t v7 = objc_msgSend((id)a1, "objectRegisteredForID:", objc_msgSend(v6, "firstObject"));
          uint64_t v8 = v7;
          if (v7)
          {
            uint64_t v9 = (void *)[v7 entity];
            uint64_t v10 = [v6 objectAtIndex:1];
            if (v9)
            {
              if (objc_msgSend((id)objc_msgSend(v9, "propertiesByName"), "objectForKey:", v10))
              {
                [v6 lastObject];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v11 = 0;
                }
                else {
                  uint64_t v11 = [v6 lastObject];
                }
                objc_msgSend(v8, "setValue:forKey:", v11, objc_msgSend(v6, "objectAtIndex:", 1));
              }
            }
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v101 objects:v109 count:16];
      }
      while (v3);
    }
    *(_DWORD *)(a1 + 40) &= 0xFFFFFCFF;
  }
  uint64_t v12 = *(void **)(*(void *)(a1 + 168) + 144);
  if ([v12 count])
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v98;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v98 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v97 + 1) + 8 * j);
          uint64_t v17 = objc_msgSend((id)a1, "objectRegisteredForID:", objc_msgSend(v16, "firstObject"));
          uint64_t v18 = v17;
          if (v17)
          {
            uint64_t v19 = (void *)[v17 entity];
            uint64_t v20 = [v16 objectAtIndex:1];
            if (v19)
            {
              if (objc_msgSend((id)objc_msgSend(v19, "propertiesByName"), "objectForKey:", v20))
              {
                [v16 lastObject];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v21 = 0;
                }
                else {
                  uint64_t v21 = [v16 lastObject];
                }
                objc_msgSend(v18, "setValue:forKey:", v21, objc_msgSend(v16, "objectAtIndex:", 1));
              }
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v97 objects:v108 count:16];
      }
      while (v13);
    }
    *(_DWORD *)(a1 + 40) &= 0xFFFFFCFF;
  }
  long long v22 = (void *)[*(id *)(a1 + 80) copy];
  unint64_t v84 = [v22 count];
  v78 = v76;
  MEMORY[0x1F4188790](v84);
  uint64_t v25 = (uint64_t *)&v76[-v24];
  if (v26 >= 0x201)
  {
    CFMutableSetRef v83 = (uint64_t *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 80) getObjects:v83];
  }
  else
  {
    bzero(&v76[-v24], 8 * v23);
    uint64_t v27 = *(void **)(a1 + 80);
    CFMutableSetRef v83 = v25;
    [v27 getObjects:v25];
    if (!v84)
    {
      int v79 = 1;
      goto LABEL_41;
    }
  }
  uint64_t v28 = 0;
  do
  {
    uint64_t v29 = (void *)v83[v28];
    -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](v29);
    objc_msgSend(v29, "_setVersionReference__:", 1);
    ++v28;
  }
  while (v84 != v28);
  int v79 = 0;
LABEL_41:
  [v81 setObject:v22 forKey:@"inserted"];

  unint64_t v30 = [*(id *)(a1 + 96) count];
  long long v31 = (void *)[*(id *)(a1 + 96) copy];
  MEMORY[0x1F4188790](v31);
  long long v34 = (uint64_t *)&v76[-v33];
  if (v30 >= 0x201)
  {
    CFMutableSetRef v82 = (uint64_t *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 96) getObjects:v82];
  }
  else
  {
    bzero(&v76[-v33], 8 * v32);
    uint64_t v35 = *(void **)(a1 + 96);
    CFMutableSetRef v82 = v34;
    [v35 getObjects:v34];
    if (!v30)
    {
      int v77 = 1;
      goto LABEL_48;
    }
  }
  for (uint64_t k = 0; k != v30; ++k)
  {
    uint64_t v37 = (void *)v82[k];
    -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](v37);
    objc_msgSend(v37, "_setVersionReference__:", objc_msgSend(v37, "_versionReference") + 1);
  }
  int v77 = 0;
LABEL_48:
  [v81 setObject:v31 forKey:@"updated"];

  unint64_t v38 = [*(id *)(a1 + 88) count];
  unint64_t v39 = MEMORY[0x1F4188790](v38);
  uint64_t v42 = &v76[-v41];
  if (v39 >= 0x201)
  {
    uint64_t v42 = (unsigned char *)NSAllocateScannedUncollectable();
LABEL_52:
    id v80 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v38];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 88), "allObjects"), "getObjects:range:", v42, 0, v38);
    uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v42 count:v38];
    [v81 setObject:v43 forKey:@"deleted"];

    uint64_t v44 = 0;
    do
      -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](*(void **)&v42[8 * v44++]);
    while (v38 != v44);
    goto LABEL_54;
  }
  bzero(&v76[-v41], 8 * v40);
  if (v38) {
    goto LABEL_52;
  }
  id v80 = 0;
LABEL_54:
  -[NSManagedObjectContext _clearInsertions](a1);
  -[NSManagedObjectContext _clearUnprocessedInsertions](a1);
  -[NSManagedObjectContext _clearDeletions](a1);
  -[NSManagedObjectContext _clearUnprocessedDeletions](a1);
  -[NSManagedObjectContext _clearUpdates](a1);
  -[NSManagedObjectContext _clearUnprocessedUpdates](a1);
  int v45 = *(_DWORD *)(a1 + 40);
  ++*(_WORD *)(a1 + 44);
  *(_DWORD *)(a1 + 40) = v45 & 0xFFFFFFDF;
  [*(id *)(a1 + 104) removeAllObjects];
  [*(id *)(a1 + 112) removeAllObjects];

  **(void **)(a1 + 168) = 0;
  if ((*(unsigned char *)(a1 + 41) & 4) != 0)
  {
    [(id)a1 willChangeValueForKey:@"hasChanges"];
    *(_DWORD *)(a1 + 40) &= ~0x400u;
    [(id)a1 didChangeValueForKey:@"hasChanges"];
  }
  long long v46 = (void *)[v81 objectForKey:@"inserted"];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v93 objects:v107 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v94;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v94 != v48) {
          objc_enumerationMutation(v46);
        }
        long long v50 = *(_DWORD **)(*((void *)&v93 + 1) + 8 * m);
        long long v51 = v50 + 4;
        v50[4] |= 0x10u;
        [v50 didSave];
        *v51 &= ~0x10u;
      }
      uint64_t v47 = [v46 countByEnumeratingWithState:&v93 objects:v107 count:16];
    }
    while (v47);
  }
  uint64_t v52 = (void *)[v81 objectForKey:@"deleted"];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v53 = [v52 countByEnumeratingWithState:&v89 objects:v106 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v90;
    do
    {
      for (uint64_t n = 0; n != v53; ++n)
      {
        if (*(void *)v90 != v54) {
          objc_enumerationMutation(v52);
        }
        CFRange v56 = *(_DWORD **)(*((void *)&v89 + 1) + 8 * n);
        id v57 = v56 + 4;
        v56[4] |= 0x20u;
        [v56 didSave];
        *v57 &= ~0x20u;
      }
      uint64_t v53 = [v52 countByEnumeratingWithState:&v89 objects:v106 count:16];
    }
    while (v53);
  }
  long long v58 = (void *)[v81 objectForKey:@"updated"];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v85 objects:v105 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v86;
    do
    {
      for (iuint64_t i = 0; ii != v59; ++ii)
      {
        if (*(void *)v86 != v60) {
          objc_enumerationMutation(v58);
        }
        [*(id *)(*((void *)&v85 + 1) + 8 * ii) didSave];
      }
      uint64_t v59 = [v58 countByEnumeratingWithState:&v85 objects:v105 count:16];
    }
    while (v59);
  }
  if ([*(id *)(*(void *)(a1 + 168) + 96) _isEnabled])
  {
    long long v62 = *(NSQueryGenerationToken **)(*(void *)(a1 + 168) + 96);
    if (v62 != +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"))[v81 setValue:*(void *)(*(void *)(a1 + 168) + 96) forKey:@"newQueryGeneration"]; {
  }
    }
  uint64_t v63 = *(void *)(*(void *)(a1 + 168) + 120);
  if (v63) {
    [v81 setValue:v63 forKey:@"newChangeToken"];
  }
  if (byte_1EB270AB6)
  {
    id v64 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, a1);
    [v81 setValue:v64 forKey:@"managedObjectContext"];
  }
  if ((*(unsigned char *)(a1 + 42) & 2) != 0) {
    -[NSManagedObjectContext _postContextDidSaveNotificationWithUserInfo:](a1, v81);
  }

  if ((v79 & 1) == 0)
  {
    long long v65 = v83;
    unint64_t v66 = v84;
    do
    {
      -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*v65++);
      --v66;
    }
    while (v66);
  }
  if (v84 >= 0x201) {
    NSZoneFree(0, v83);
  }
  if ((v77 & 1) == 0)
  {
    long long v67 = v82;
    unint64_t v68 = v30;
    do
    {
      -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*v67++);
      --v68;
    }
    while (v68);
  }
  if (v30 >= 0x201) {
    NSZoneFree(0, v82);
  }
  if (v38)
  {
    for (juint64_t j = 0; jj != v38; ++jj)
    {
      v70 = *(unsigned char **)&v42[8 * jj];
      CFAllocatorRef v71 = (void *)[v70 objectID];
      if (v70)
      {
        if ((v70[17] & 2) != 0)
        {
          uint64_t v72 = v71;
          if (([v71 isTemporaryID] & 1) == 0) {
            [v80 addObject:v72];
          }
        }
      }
      if (v70) {
        uint64_t v73 = _insertion_fault_handler;
      }
      else {
        uint64_t v73 = 0;
      }
      -[NSFaultHandler turnObject:intoFaultWithContext:](v73, (uint64_t)v70, a1);
      [(id)a1 _forgetObject:v70 propagateToObjectStore:0 removeFromRegistry:1];
    }
    if (v38 >= 0x201) {
      NSZoneFree(0, v42);
    }
  }
  if ([v80 count])
  {
    -[NSManagedObjectContext lockObjectStore](a1);
    v74 = *(void **)(a1 + 32);
    uint64_t v75 = [(id)a1 _queryGenerationToken];
    [v74 managedObjectContextDidUnregisterObjectsWithIDs:v80 generation:v75];
    -[NSManagedObjectContext unlockObjectStore](a1);
  }
}

- (void)_resetAllChanges
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    -[NSManagedObjectContext _clearUnprocessedUpdates]((uint64_t)result);
    -[NSManagedObjectContext _clearUpdates](v1);
    -[NSManagedObjectContext _clearUnprocessedInsertions](v1);
    -[NSManagedObjectContext _clearInsertions](v1);
    -[NSManagedObjectContext _clearUnprocessedDeletions](v1);
    -[NSManagedObjectContext _clearDeletions](v1);
    [*(id *)(v1 + 104) removeAllObjects];
    [*(id *)(v1 + 112) removeAllObjects];
    uint64_t result = *(void **)(*(void *)(v1 + 168) + 40);
    if (result)
    {
      uint64_t result = (void *)[result isUndoRegistrationEnabled];
      if (result) {
        uint64_t result = (void *)[*(id *)(*(void *)(v1 + 168) + 40) removeAllActions];
      }
    }
    ++*(_WORD *)(v1 + 44);
    int v2 = *(_DWORD *)(v1 + 40);
    *(_DWORD *)(v1 + 40) = v2 & 0xFFFFFCDF;
    if ((v2 & 0x400) != 0)
    {
      [(id)v1 willChangeValueForKey:@"hasChanges"];
      *(_DWORD *)(v1 + 40) &= ~0x400u;
      return (void *)[(id)v1 didChangeValueForKey:@"hasChanges"];
    }
  }
  return result;
}

- (uint64_t)_clearUpdates
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 96) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 96) getObjects:v6];
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    [*(id *)(a1 + 96) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 96) removeAllObjects];
    }
  }
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~8u;
    }
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return [*(id *)(a1 + 96) removeAllObjects];
}

- (uint64_t)_clearUnprocessedUpdates
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 56) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 56) getObjects:v6];
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    [*(id *)(a1 + 56) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 56) removeAllObjects];
    }
  }
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~1u;
    }
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return [*(id *)(a1 + 56) removeAllObjects];
}

- (uint64_t)_clearUnprocessedInsertions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 72) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 72) getObjects:v6];
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    [*(id *)(a1 + 72) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 72) removeAllObjects];
    }
  }
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~2u;
    }
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return [*(id *)(a1 + 72) removeAllObjects];
}

- (uint64_t)_clearUnprocessedDeletions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 64) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 64) getObjects:v6];
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    [*(id *)(a1 + 64) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 64) removeAllObjects];
    }
  }
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~4u;
    }
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return [*(id *)(a1 + 64) removeAllObjects];
}

- (uint64_t)_clearInsertions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 80) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 80) getObjects:v6];
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    [*(id *)(a1 + 80) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 80) removeAllObjects];
    }
  }
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~0x10u;
    }
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return [*(id *)(a1 + 80) removeAllObjects];
}

- (uint64_t)_clearDeletions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 88) count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
    [*(id *)(a1 + 88) getObjects:v6];
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    [*(id *)(a1 + 88) getObjects:v6];
    if (!v3) {
      return [*(id *)(a1 + 88) removeAllObjects];
    }
  }
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = *(void *)&v6[8 * v7];
    if (v8) {
      *(_DWORD *)(v8 + 16) &= ~0x20u;
    }
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return [*(id *)(a1 + 88) removeAllObjects];
}

- (void)_clearOriginalSnapshotAndInitializeRec:(void *)result
{
  if (result)
  {
    unint64_t v2 = result;
    -[NSManagedObject _setOriginalSnapshot__:](result, 0);
    return -[NSManagedObject _setLastSnapshot__:](v2, 0);
  }
  return result;
}

- (void)_establishEventSnapshotsForObject:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (!_PF_Threading_Debugging_level)
  {
    if (a2) {
      goto LABEL_4;
    }
LABEL_22:
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  _PFAssertSafeMultiThreadedAccess_impl(a1, sel__establishEventSnapshotsForObject_);
  if (!a2) {
    goto LABEL_22;
  }
LABEL_4:
  uint64_t v3 = a2[6];
  if (v3 && *(void *)(v3 + 8))
  {
    if (*(void *)(v3 + 16)) {
      return;
    }
LABEL_17:
    uint64_t v6 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a2, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1);
LABEL_18:
    uint64_t v7 = v6;
    -[NSManagedObject _setLastSnapshot__:](a2, v6);

    return;
  }
  uint64_t v4 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a2, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1);
LABEL_9:
  -[NSManagedObject _setOriginalSnapshot__:](a2, v4);

  if (a2)
  {
    uint64_t v5 = a2[6];
    if (v5 && *(void *)(v5 + 16)) {
      return;
    }
    if (!v4) {
      goto LABEL_17;
    }
  }
  else if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_18;
  }

  -[NSManagedObject _setLastSnapshot__:](a2, v4);
}

- (uint64_t)_postContextDidSaveNotificationWithUserInfo:(uint64_t)a1
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (byte_1EB270AB6)
  {
    uint64_t v5 = [a2 objectForKey:@"managedObjectContext"];
    if (v5)
    {
      id v6 = (id)v5;
      uint64_t v7 = v4;
    }
    else
    {
      id v8 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, a1);
      [v4 setObject:v8 forKey:@"managedObjectContext"];
      if ((*(unsigned char *)(a1 + 43) & 0x20) == 0) {
        goto LABEL_7;
      }
      uint64_t v7 = a2;
      id v6 = v8;
    }
    [v7 setObject:v6 forKey:@"managedObjectContext"];
  }
LABEL_7:
  if ((*(unsigned char *)(a1 + 43) & 0x20) != 0)
  {
    uint64_t v9 = [a2 objectForKey:@"transactionAuthor"];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = v4;
LABEL_12:
      [v11 setObject:v10 forKey:@"transactionAuthor"];
      goto LABEL_13;
    }
    uint64_t v12 = [(id)a1 transactionAuthor];
    if (v12)
    {
      uint64_t v13 = v12;
      [v4 setObject:v12 forKey:@"transactionAuthor"];
      uint64_t v11 = a2;
      uint64_t v10 = v13;
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v14 = (void *)[a2 objectForKey:@"newQueryGeneration"];
  if (v14
    || (uint64_t v14 = (void *)[(id)a1 _queryGenerationToken], v15 = objc_msgSend(v14, "_isEnabled"), v14) && v15)
  {
    [v4 setObject:v14 forKey:@"newQueryGeneration"];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v17 = *(void **)(*(void *)(a1 + 168) + 136);
  id v63 = v4;
  if ([v17 count])
  {
    id v18 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"inserted"), "mutableCopy");
    if (!v18) {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v19 = [v17 countByEnumeratingWithState:&v72 objects:v78 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v73 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = objc_msgSend((id)a1, "objectWithID:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * i), "firstObject"));
          if (v23)
          {
            uint64_t v24 = v23;
            [v18 addObject:v23];
            [v16 addObject:v24];
          }
        }
        uint64_t v20 = [v17 countByEnumeratingWithState:&v72 objects:v78 count:16];
      }
      while (v20);
    }
    [a2 setObject:v18 forKey:@"inserted"];

    *(void *)(*(void *)(a1 + 168) + 136) = 0;
    id v4 = v63;
  }
  uint64_t v25 = *(void **)(*(void *)(a1 + 168) + 144);
  if ([v25 count])
  {
    id v26 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"updated"), "mutableCopy");
    if (!v26) {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v27 = [v25 countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v69 != v29) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = objc_msgSend((id)a1, "objectWithID:", objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * j), "firstObject"));
          if (v31)
          {
            uint64_t v32 = v31;
            [v26 addObject:v31];
            [v16 addObject:v32];
          }
        }
        uint64_t v28 = [v25 countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v28);
    }

    *(void *)(*(void *)(a1 + 168) + 144) = 0;
    id v4 = v63;
  }
  else
  {
    id v26 = 0;
  }
  uint64_t v33 = *(void **)(*(void *)(a1 + 168) + 112);
  if ([v33 count])
  {
    if (!v26)
    {
      id v26 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"updated"), "mutableCopy");
      if (!v26) {
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      }
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v65 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = [(id)a1 objectWithID:*(void *)(*((void *)&v64 + 1) + 8 * k)];
          if (v38)
          {
            uint64_t v39 = v38;
            [v26 addObject:v38];
            [v16 addObject:v39];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v35);
    }

    *(void *)(*(void *)(a1 + 168) + 112) = 0;
    id v4 = v63;
  }
  if (v26) {
    [a2 setObject:v26 forKey:@"updated"];
  }

  if ([v16 count]) {
    [a2 setObject:v16 forKey:@"_NSTriggerModifiedObjectsKey"];
  }

  if (!objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"inserted"), "count")) {
    [a2 removeObjectForKey:@"inserted"];
  }
  if (!objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"deleted"), "count")) {
    [a2 removeObjectForKey:@"deleted"];
  }
  if (!objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"updated"), "count")) {
    [a2 removeObjectForKey:@"updated"];
  }
  for (uint64_t m = 0; m != 5; ++m)
  {
    uint64_t v41 = (void *)[a2 objectForKey:off_1E544C518[m]];
    if ([v41 count])
    {
      uint64_t v42 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v41);
      [v4 setObject:v42 forKey:off_1E544C540[m]];
    }
  }
  uint64_t v43 = (void *)[a2 objectForKey:@"refreshed"];
  if ([v43 count]) {
    id v44 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v43);
  }
  else {
    id v44 = (id)NSSet_EmptySet;
  }
  int v45 = v44;
  long long v46 = (void *)[a2 objectForKey:@"refreshed_objectIDs"];
  if (![v45 count] && !objc_msgSend(v46, "count"))
  {
    [a2 removeObjectForKey:@"refreshed"];
    [a2 removeObjectForKey:@"refreshed_objectIDs"];
    [v4 removeObjectForKey:@"refreshed"];
    [v4 removeObjectForKey:@"refreshed_objectIDs"];
    goto LABEL_94;
  }
  id v47 = +[_PFRoutines newSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v45, v46);

  [v4 setObject:v47 forKey:@"refreshed_objectIDs"];
  unint64_t v48 = [v47 count];
  unint64_t v49 = v48;
  if (v48 <= 1) {
    uint64_t v50 = 1;
  }
  else {
    uint64_t v50 = v48;
  }
  if (v48 >= 0x201) {
    uint64_t v51 = 1;
  }
  else {
    uint64_t v51 = v50;
  }
  uint64_t v52 = (char *)&v62 - ((8 * v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v45 = v47;
  if (v48 >= 0x201)
  {
    uint64_t v52 = (char *)NSAllocateScannedUncollectable();
    [v47 getObjects:v52];
LABEL_87:
    uint64_t v54 = 0;
    uint64_t v53 = 0;
    do
    {
      uint64_t v55 = [(id)a1 objectRegisteredForID:*(void *)&v52[8 * v54]];
      if (v55) {
        *(void *)&v52[8 * v53++] = v55;
      }
      ++v54;
    }
    while (v49 != v54);
    goto LABEL_91;
  }
  bzero((char *)&v62 - ((8 * v51 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v50);
  [v47 getObjects:v52];
  if (v49) {
    goto LABEL_87;
  }
  uint64_t v53 = 0;
LABEL_91:
  CFRange v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v52 count:v53];
  if (v49 >= 0x201) {
    NSZoneFree(0, v52);
  }
  [a2 setObject:v56 forKey:@"refreshed"];

LABEL_94:
  id v57 = (id)[v4 copy];

  long long v58 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v59 = v58;
  unsigned __int8 v60 = atomic_load((unsigned __int8 *)(a1 + 48));
  if ((v60 & 1) == 0)
  {
    [v58 postNotificationName:@"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification" object:*(void *)(a1 + 32) userInfo:v57];
    [v59 postNotificationName:@"NSManagedObjectContextDidSaveObjectIDsNotification" object:*(void *)(a1 + 32) userInfo:v57];
  }
  [v59 postNotificationName:@"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification" object:a1 userInfo:v57];
  uint64_t result = [v59 postNotificationName:@"NSManagedObjectContextDidSaveObjectIDsNotification" object:a1 userInfo:v57];
  if ((*(unsigned char *)(a1 + 43) & 0x10) != 0) {
    return [v59 postNotificationName:@"NSManagingContextDidSaveChangesNotification" object:a1 userInfo:a2];
  }
  return result;
}

- (NSPersistentStoreResult)executeRequest:(NSPersistentStoreRequest *)request error:(NSError *)error
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      id v8 = v7;
LABEL_6:
      uint64_t v9 = 0;
LABEL_7:
      *error = v8;
      return v9;
    }
    return 0;
  }
  NSPersistentStoreRequestType v10 = [(NSPersistentStoreRequest *)request requestType];
  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  if (objc_opt_respondsToSelector()) {
    [(NSPersistentStoreRequest *)request _resolveEntityWithContext:self];
  }
  if (v10 == NSSaveRequestType)
  {
    if (error)
    {
      id v8 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E1D30];
      goto LABEL_6;
    }
    return 0;
  }
  if (v10 != NSFetchRequestType) {
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (_PF_Threading_Debugging_level) {
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, sel__executeAsynchronousFetchRequest_);
      }
      uint64_t v28 = (void *)[(NSPersistentStoreRequest *)request fetchRequest];
      uint64_t v111 = 0;
      long long v112 = &v111;
      uint64_t v113 = 0x2020000000;
      long long v114 = &v115;
      uint64_t v115 = 0;
      [v28 _resolveEntityWithContext:self];
      if ([v28 entity])
      {
        if (self->_dispatchQueue)
        {
          uint64_t v29 = [v28 resultType];
          if (v29 == 4)
          {
            NSUInteger v30 = [(NSManagedObjectContext *)self countForFetchRequest:v28 error:v112[3]];
            if (v30 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v9 = 0;
            }
            else
            {
              uint64_t v75 = [NSNumber numberWithUnsignedInteger:v30];
              uint64_t v9 = (NSPersistentStoreResult *)[MEMORY[0x1E4F1C978] arrayWithObject:v75];
            }
          }
          else
          {
            id v65 = objc_alloc_init(MEMORY[0x1E4F28B28]);
            if ([(NSManagedObjectContext *)self hasChanges]
              && ((int v66 = [v28 includesPendingChanges], v29 != 2) ? (v67 = v66) : (v67 = 0), v67 == 1))
            {
              if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch]((BOOL)self)) {
                -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
              }
              char v68 = 1;
            }
            else
            {
              char v68 = 0;
            }
            long long v69 = -[NSManagedObjectContext _createStoreFetchRequestForFetchRequest:]((id *)&self->super.isa, v28);
            v110[0] = 0;
            v110[1] = v110;
            v110[2] = (id)0x3052000000;
            v110[3] = __Block_byref_object_copy__12;
            v110[4] = __Block_byref_object_dispose__12;
            v110[5] = 0;
            BOOL v70 = [v69 resultType] == 0;
            char v71 = [v69 includesPropertyValues];
            v109[0] = 0;
            v109[1] = v109;
            v109[2] = 0x3052000000;
            v109[3] = __Block_byref_object_copy__12;
            v109[4] = __Block_byref_object_dispose__12;
            v109[5] = 0;
            [v65 drain];
            long long v72 = (void *)[MEMORY[0x1E4F28F90] currentProgress];
            if (v72
              && (long long v72 = (void *)[objc_alloc(MEMORY[0x1E4F28F90]) initWithParent:v72 userInfo:0]) != 0)
            {
              if ([(NSPersistentStoreRequest *)request estimatedResultCount] < 1) {
                uint64_t v73 = -1;
              }
              else {
                uint64_t v73 = [(NSPersistentStoreRequest *)request estimatedResultCount];
              }
              [v72 setTotalUnitCount:v73];
              [v72 setKind:@"managed objects"];
              char v74 = 0;
            }
            else
            {
              char v74 = 1;
            }
            uint64_t v103 = 0;
            long long v104 = &v103;
            uint64_t v105 = 0x3052000000;
            long long v106 = __Block_byref_object_copy__12;
            long long v107 = __Block_byref_object_dispose__12;
            id v108 = 0;
            id v108 = [[NSAsynchronousFetchResult alloc] initForFetchRequest:request withContext:self andProgress:v72 completetionBlock:[(NSPersistentStoreRequest *)request completionBlock]];
            [v69 _setAsyncResultHandle:v104[5]];
            if ((v74 & 1) == 0)
            {
              id v96 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, v104[5]);
              v102[0] = MEMORY[0x1E4F143A8];
              v102[1] = 3221225472;
              v102[2] = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke;
              v102[3] = &unk_1E544B868;
              v102[4] = v96;
              [v72 setCancellationHandler:v102];
            }
            id parentObjectStore = self->_parentObjectStore;
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_2;
            long long v117 = &unk_1E544C440;
            CFSetCallBacks v118 = self;
            uint64_t v119 = v69;
            v122 = v109;
            id v123 = v110;
            int v124 = &v111;
            int v125 = &v103;
            char v126 = v68;
            v120 = request;
            uint64_t v121 = v28;
            BOOL v127 = v70;
            char v128 = v71;
            [parentObjectStore performBlock:buf];
            uint64_t v9 = (NSPersistentStoreResult *)v104[5];
            _Block_object_dispose(&v103, 8);
            _Block_object_dispose(v109, 8);
            _Block_object_dispose(v110, 8);
          }
          _Block_object_dispose(&v111, 8);
          return v9;
        }
        long long v99 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v100 = [NSString stringWithFormat:@"NSConfinementConcurrencyType context %@ cannot support asynchronous fetch request %@.", self, request];
      }
      else
      {
        long long v99 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v100 = [NSString stringWithFormat:@"%@ A fetch request must have an entity.", NSStringFromSelector(sel__executeAsynchronousFetchRequest_)];
      }
      objc_exception_throw((id)[v99 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v100 userInfo:0]);
    }
LABEL_29:
    if (self->_parentObjectStore)
    {
      id v31 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v110[0] = 0;
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      id v32 = (id)[self->_parentObjectStore executeRequest:request withContext:self error:v110];
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      if (v110[0])
      {
        id v33 = v110[0];
        if (v110[0])
        {
          if (error) {
            *error = (NSError *)v110[0];
          }
        }
        else
        {
          uint64_t v46 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v46, v47, v48, v49, v50, v51, v52, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
          uint64_t v53 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2023;
            _os_log_fault_impl(&dword_18AB82000, v53, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }
      [v31 drain];
      id v54 = 0;
      id v55 = v110[0];
      if (self->_dispatchQueue && v32) {
        -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)self);
      }
      if ((!v32 || v110[0]) && (!v110[0] || v32))
      {
        uint64_t v56 = [NSString stringWithUTF8String:"Either a non nil result OR an error OR an exception"];
        _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, v101);
        id v63 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_18AB82000, v63, OS_LOG_TYPE_FAULT, "CoreData: Either a non nil result OR an error OR an exception", buf, 2u);
        }
      }
      return (NSPersistentStoreResult *)v32;
    }
    if (v10 - 5 <= 2)
    {
      if ((_BYTE)dword_1EB270AB8) {
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Context does not have a coordinator; cannot perform executeRequest:error:.",
      }
                                   0));
      _NSCoreDataLog(2, @"Context does not have a coordinator; cannot perform executeRequest:error:.",
        v11,
        v12,
        v13,
        v14,
        v15,
        v16,
        v101);
      switch(v10)
      {
        case NSBatchDeleteRequestType:
          uint64_t v34 = NSBatchDeleteResult;
          goto LABEL_84;
        case NSBatchUpdateRequestType:
          uint64_t v34 = NSBatchUpdateResult;
          goto LABEL_84;
        case NSBatchInsertRequestType:
          uint64_t v34 = NSBatchInsertResult;
LABEL_84:
          id v87 = [v34 alloc];
          uint64_t v88 = [(NSPersistentStoreRequest *)request resultType];
          uint64_t v37 = (NSPersistentCloudKitContainerEventResult *)[v87 initWithResultType:v88 andObject:NSArray_EmptyArray];
          return (NSPersistentStoreResult *)v37;
      }
      uint64_t v89 = [NSString stringWithUTF8String:"Unknown batch request - %@ - %lu"];
      _NSCoreDataLog(17, v89, v90, v91, v92, v93, v94, v95, (uint64_t)request);
      long long v85 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_86:
        uint64_t v37 = 0;
        return (NSPersistentStoreResult *)v37;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = request;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      long long v86 = "CoreData: Unknown batch request - %@ - %lu";
LABEL_97:
      _os_log_fault_impl(&dword_18AB82000, v85, OS_LOG_TYPE_FAULT, v86, buf, 0x16u);
      goto LABEL_86;
    }
    switch(v10)
    {
      case 0xBuLL:
        int v77 = [NSPersistentCloudKitContainerEventResult alloc];
        uint64_t v37 = [(NSPersistentCloudKitContainerEventResult *)v77 initWithResult:NSArray_EmptyArray ofType:[(NSPersistentStoreRequest *)request resultType]];
        break;
      case 0xAuLL:
        id v76 = [NSSQLiteIndexStatisticsResult alloc];
        uint64_t v37 = [(NSSQLiteIndexStatisticsResult *)v76 initWithResult:NSArray_EmptyArray];
        break;
      case 8uLL:
        uint64_t v35 = [NSPersistentHistoryResult alloc];
        uint64_t v36 = [(NSPersistentStoreRequest *)request resultType];
        uint64_t v37 = [(NSPersistentHistoryResult *)v35 initWithResultType:v36 andResult:NSArray_EmptyArray];
        break;
      default:
        uint64_t v78 = [NSString stringWithUTF8String:"Unknown request - %@ - %lu"];
        _NSCoreDataLog(17, v78, v79, v80, v81, v82, v83, v84, (uint64_t)request);
        long long v85 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
          goto LABEL_86;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = request;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v10;
        long long v86 = "CoreData: Unknown request - %@ - %lu";
        goto LABEL_97;
    }
    return (NSPersistentStoreResult *)v37;
  }
  uint64_t v17 = [[NSAsynchronousFetchRequest alloc] initWithFetchRequest:request completionBlock:0];
  uint64_t v9 = [[NSAsynchronousFetchResult alloc] initForFetchRequest:v17 withContext:self andProgress:0 completetionBlock:0];

  id v18 = v9;
  v110[0] = 0;
  uint64_t v19 = [(NSManagedObjectContext *)self executeFetchRequest:request error:v110];
  id v8 = (NSError *)v110[0];
  if (v19)
  {
    if (v110[0])
    {
      uint64_t v20 = [NSString stringWithUTF8String:"Fetching generated a result AND an error: %@"];
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)v110[0]);
      uint64_t v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(id *)&buf[4] = v110[0];
        _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Fetching generated a result AND an error: %@", buf, 0xCu);
      }
      [(NSPersistentStoreResult *)v9 setOperationError:v110[0]];
    }
    -[NSAsynchronousFetchResult setFinalResult:]((uint64_t)v9, v19);
  }
  else
  {
    if (!v110[0])
    {
      uint64_t v38 = [NSString stringWithUTF8String:"Fetching returned nil AND failed to generate an error"];
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, v101);
      int v45 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v45, OS_LOG_TYPE_FAULT, "CoreData: Fetching returned nil AND failed to generate an error", buf, 2u);
      }
      id v8 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E1D08];
    }
    uint64_t v9 = 0;
    if (error) {
      goto LABEL_7;
    }
  }
  return v9;
}

- (void)dealloc
{
  MEMORY[0x18C1285F0](self, a2);
  if (self->_dispatchQueue)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
    if ((v3 & 1) != 0 && _PFIsSerializedWithMainQueue())
    {
      int wasDisposed = self->_wasDisposed;
      -[NSManagedObjectContext _dealloc__]((uint64_t)self);
      internal_PF_actor_clear_for_dealloc((uint64_t)self);
      if (!wasDisposed)
      {
        objc_destructInstance(self);
        dispatch_time_t v5 = dispatch_time(0, 3000000000);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __33__NSManagedObjectContext_dealloc__block_invoke;
        v9[3] = &__block_descriptor_40_e5_v8__0l;
        v9[4] = self;
        dispatch_after(v5, MEMORY[0x1E4F14428], v9);
      }
    }
    else
    {
      dispatchQueue = self->_dispatchQueue;
      int v7 = self->_wasDisposed;
      dispatch_retain(dispatchQueue);
      MEMORY[0x18C1285F0]();
      internal_PF_actor_clear_for_dealloc((uint64_t)self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __internalBlockToDeallocNSManagedObjectContext_block_invoke;
      aBlock[3] = &unk_1E544C6D8;
      int v11 = v7;
      aBlock[4] = dispatchQueue;
      aBlock[5] = self;
      id v8 = malloc_type_malloc(0x20uLL, 0x80040B8603338uLL);
      *id v8 = _Block_copy(aBlock);
      v8[1] = self;
      v8[2] = 12289;
      v8[3] = 0;
      dispatch_async_f(dispatchQueue, v8, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
    }
  }
  else
  {
    -[NSManagedObjectContext _dealloc__]((uint64_t)self);
  }
}

- (void)_dealloc__
{
  if (!a1) {
    return;
  }
  if (!*(void *)(a1 + 168))
  {
    *(void *)(a1 + 168) = PF_CALLOC_OBJECT_ARRAY(22);
    if (!*(void *)(a1 + 136))
    {
      unint64_t v2 = (Class *)0x1E4F28FD0;
      if (_PF_Threading_Debugging_level <= 0) {
        unint64_t v2 = (Class *)off_1E544B1D0;
      }
      *(void *)(a1 + 136) = objc_alloc_init(*v2);
    }
    if (!_PF_Threading_Debugging_level) {
      goto LABEL_11;
    }
    uint64_t v12 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v12 = malloc_default_zone();
    }
    *(void *)(*(void *)(a1 + 168) + 56) = malloc_type_zone_malloc(v12, 0x30uLL, 0x80040B8603338uLL);
    pthread_t v13 = pthread_self();
    **(void **)(*(void *)(a1 + 168) + 56) = v13;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 8) = v13;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 16) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 32) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)(a1 + 49));
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = (void *)[MEMORY[0x1E4F28F08] currentQueue];
      if ([v15 maxConcurrentOperationCount] == 1) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 16) = v16;
      current_queue = dispatch_get_current_queue();
      if (current_queue == dispatch_get_global_queue(0, 0)) {
        id v18 = 0;
      }
      else {
        id v18 = current_queue;
      }
      *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 24) = v18;
    }
  }
  if (_PF_Threading_Debugging_level)
  {
    *(void *)(*(void *)(*(void *)(a1 + 168) + 56) + 8) = pthread_self();
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__dealloc__);
    }
  }
LABEL_11:
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3 || (unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a1 + 49)), (v4 & 1) != 0)) {
    -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](*(void *)(a1 + 152));
  }
  if ((*(unsigned char *)(a1 + 41) & 4) != 0)
  {
    [(id)a1 willChangeValueForKey:@"hasChanges"];
    *(_DWORD *)(a1 + 40) &= ~0x400u;
    [(id)a1 didChangeValueForKey:@"hasChanges"];
  }
  if (*(_DWORD *)(a1 + 16))
  {
    dispatch_time_t v5 = *(void ***)(a1 + 168);
    if (v5)
    {
      if (v5[7])
      {
        PF_FREE_OBJECT_ARRAY(v5[7]);
        *(void *)(*(void *)(a1 + 168) + 56) = 0;
        dispatch_time_t v5 = *(void ***)(a1 + 168);
      }
      PF_FREE_OBJECT_ARRAY(v5);
      *(void *)(a1 + 168) = 0;
    }
    id v6 = *(void **)(a1 + 136);
    if (v6)
    {

      *(void *)(a1 + 136) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 16) = 1;
    if (*(void *)(a1 + 168))
    {
      int v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      -[NSManagedObjectContext _stopObservingUndoManagerNotifications](a1);

      *(void *)(*(void *)(a1 + 168) + 40) = 0;
      uint64_t v8 = [(id)a1 persistentStoreCoordinator];
      if (v8) {
        [v7 removeObserver:a1 name:@"_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification" object:v8];
      }
      if ((*(unsigned char *)(a1 + 42) & 0x80) != 0 && *(void *)(a1 + 32)) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", a1, @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification", *(void *)(a1 + 32));
      }
    }
    uint64_t v9 = *(void **)(*(void *)(a1 + 168) + 72);
    if (v9)
    {

      *(void *)(*(void *)(a1 + 168) + 72) = 0;
    }
    unint64_t Count = _PFCMT_GetCount(*(void **)(a1 + 120));
    if (v3 || Count < 0x12C)
    {
      -[NSManagedObjectContext _dispose:](a1);
      if (!v3)
      {
        _PFDeallocateObject((id)a1);
      }
    }
    else
    {
      int v11 = [[_PFTask alloc] initWithFunction:_deallocateContextBackgroundThread withArgument:a1 andPriority:0];
      if (v11)
      {
      }
    }
  }
}

- (uint64_t)_stopObservingUndoManagerNotifications
{
  if (*(void *)(*(void *)(result + 168) + 40))
  {
    uint64_t v1 = result;
    unint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:v1 name:*MEMORY[0x1E4F28A60] object:*(void *)(*(void *)(v1 + 168) + 40)];
    uint64_t v3 = *(void **)(*(void *)(v1 + 168) + 40);
    return [v3 removeAllActionsWithTarget:v1];
  }
  return result;
}

- (NSManagedObjectContext)initWithConcurrencyType:(NSManagedObjectContextConcurrencyType)ct
{
  objc_opt_class();
  v14.receiver = self;
  v14.super_class = (Class)NSManagedObjectContext;
  dispatch_time_t v5 = [(NSManagedObjectContext *)&v14 init];
  id v6 = v5;
  if (!v5) {
    return v6;
  }
  if (ct == NSMainQueueConcurrencyType)
  {
    -[NSManagedObjectContext _initWithParentObjectStore:](v5, 3);
    dispatchQueue = MEMORY[0x1E4F14428];
    v6->_dispatchQueue = (void *)MEMORY[0x1E4F14428];
    if (!dispatch_queue_get_specific(dispatchQueue, "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
    {
      NSPersistentStoreRequestType v10 = objc_opt_class();
      dispatch_queue_set_specific(MEMORY[0x1E4F14428], "com.apple.CoreData.NSManagedObjectContext.mainQueue", v10, 0);
      dispatchQueue = v6->_dispatchQueue;
    }
    dispatch_retain(dispatchQueue);
    unsigned int v11 = *(_DWORD *)&v6->_flags & 0xFFF7FFFF;
  }
  else
  {
    if (ct != NSPrivateQueueConcurrencyType)
    {
      if (ct)
      {
        char v8 = 0;
      }
      else
      {
        char v8 = (byte_1EB2706B4 & 1) == 0
          && (current_queue = dispatch_get_current_queue(), pthread_main_np())
          && (current_queue == dispatch_get_global_queue(0, 0) || current_queue == MEMORY[0x1E4F14428]);
        dispatch_time_t v5 = v6;
      }
      -[NSManagedObjectContext _initWithParentObjectStore:](v5, v8);
      goto LABEL_19;
    }
    -[NSManagedObjectContext _initWithParentObjectStore:](v5, 2);
    v6->_dispatchQueue = createQueueForMOC(v6);
    unsigned int v11 = *(_DWORD *)&v6->_flags | 0x80000;
  }
  v6->_flags = (_managedObjectContextFlags)v11;
LABEL_19:
  atomic_store(0, (unint64_t *)&v6->_queueOwner);
  if (+[NSSQLCore trackSQLiteDatabaseStatistics]) {
    int v12 = 0x40000000;
  }
  else {
    int v12 = 0;
  }
  v6->_flags = (_managedObjectContextFlags)(*(_DWORD *)&v6->_flags & 0xBFFFFFFF | v12);
  return v6;
}

- (uint64_t)_initWithParentObjectStore:(void *)a1
{
  self;
  v29.receiver = a1;
  v29.super_class = (Class)NSManagedObjectContext;
  unsigned __int8 v4 = objc_msgSendSuper2(&v29, sel_init);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4[4] = 0;
    v4[21] = PF_CALLOC_OBJECT_ARRAY(22);
    id v6 = -[_PFContextMapTable initWithWeaksReferences:]([_PFContextMapTable alloc], 1);
    *(void *)(v5 + 120) = v6;
    CFRetain(v6);

    v28.versiouint64_t n = *MEMORY[0x1E4F1D548];
    *(_OWORD *)&v28.retaiuint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
    int v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
    v28.equal = 0;
    v28.hash = 0;
    v28.copyDescriptiouint64_t n = v7;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    *(void *)(v5 + 72) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v28);
    *(void *)(v5 + 64) = CFSetCreateMutable(v8, 0, &v28);
    *(void *)(v5 + 56) = CFSetCreateMutable(v8, 0, &v28);
    *(void *)(v5 + 80) = CFSetCreateMutable(v8, 0, &v28);
    *(void *)(v5 + 88) = CFSetCreateMutable(v8, 0, &v28);
    *(void *)(v5 + 96) = CFSetCreateMutable(v8, 0, &v28);
    *(void *)(v5 + 104) = CFSetCreateMutable(v8, 0, &v28);
    *(void *)(v5 + 112) = CFSetCreateMutable(v8, 0, &v28);
    atomic_store(a2 & 1, (unsigned __int8 *)(v5 + 49));
    if (_PF_USE_IOS_PLATFORM)
    {
      *(void *)(*(void *)(v5 + 168) + 40) = 0;
      *(_WORD *)(v5 + 44) = 0;
    }
    else
    {
      if (HIBYTE(dword_1EB270AB0))
      {
        *(void *)(*(void *)(v5 + 168) + 40) = 0;
      }
      else
      {
        *(void *)(*(void *)(v5 + 168) + 40) = objc_alloc_init(MEMORY[0x1E4F29140]);
        unsigned __int8 v9 = atomic_load((unsigned __int8 *)(v5 + 49));
        if ((v9 & 1) == 0) {
          [*(id *)(*(void *)(v5 + 168) + 40) setGroupsByEvent:0];
        }
      }
      *(_WORD *)(v5 + 44) = 0;
      if (*(void *)(*(void *)(v5 + 168) + 40)) {
        -[NSManagedObjectContext _startObservingUndoManagerNotifications](v5);
      }
    }
    if ((a2 & 2) == 0)
    {
      NSPersistentStoreRequestType v10 = (Class *)0x1E4F28FD0;
      if (_PF_Threading_Debugging_level <= 0) {
        NSPersistentStoreRequestType v10 = (Class *)off_1E544B1D0;
      }
      id v11 = objc_alloc_init(*v10);
      *(void *)(v5 + 136) = v11;
      CFRetain(v11);
    }
    *(_DWORD *)(v5 + 52) = 0;
    *(_DWORD *)(v5 + 20) = 0;
    int v12 = [_PFManagedObjectReferenceQueue alloc];
    if (v12)
    {
      v31.receiver = v12;
      v31.super_class = (Class)_PFManagedObjectReferenceQueue;
      pthread_t v13 = objc_msgSendSuper2(&v31, sel_init);
      objc_super v14 = v13;
      v13[2] = 0;
      v13[3] = v5;
      v13[4] = 0;
      if (_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88 && (unsigned __int8 v15 = atomic_load((unsigned __int8 *)(v5 + 49)), (v15))
      {
        Maiuint64_t n = CFRunLoopGetMain();
        context.versiouint64_t n = 0;
        memset(&context.retain, 0, 24);
        context.info = v14;
        uint64_t v17 = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 0, (CFRunLoopObserverCallBack)_performRunLoopAction, &context);
        CFRunLoopAddObserver(Main, v17, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        v14[5] = v17;
        CFRetain(v14);
      }
      else
      {
        v13[5] = 0;
      }
      CFRetain(v14);
    }
    else
    {
      objc_super v14 = 0;
    }
    *(void *)(v5 + 152) = v14;
    CFRetain(v14);

    *(void *)(v5 + 24) = 0;
    atomic_store(0, (unint64_t *)(v5 + 8));
    *(void *)(v5 + 144) = 0xBFF0000000000000;
    *(void *)(*(void *)(v5 + 168) + 16) = 0;
    *(_WORD *)(v5 + 46) = 0;
    atomic_store(0, (unsigned __int8 *)(v5 + 51));
    int v18 = *(_DWORD *)(v5 + 40);
    *(_DWORD *)(v5 + 16) = 0;
    if (byte_1EB2706B3) {
      int v19 = 0x4000000;
    }
    else {
      int v19 = 0;
    }
    *(_DWORD *)(v5 + 40) = v18 & 0xFBE9E000 | v19 | 0x120002;
    *(void *)(*(void *)(v5 + 168) + 24) = NSErrorMergePolicy;
    *(void *)(*(void *)(v5 + 168) + 96) = +[NSQueryGenerationToken unpinnedQueryGenerationToken];
    *(void *)(*(void *)(v5 + 168) + 32) = 0;
    *(_DWORD *)(v5 + 40) &= ~0x2000u;
    **(void **)(v5 + 168) = 0;
    *(void *)(*(void *)(v5 + 168) + 8) = 0;
    *(void *)(*(void *)(v5 + 168) + 136) = 0;
    *(void *)(*(void *)(v5 + 168) + 144) = 0;
    *(void *)(*(void *)(v5 + 168) + 112) = 0;
    *(void *)(*(void *)(v5 + 168) + 152) = 0;
    *(void *)(*(void *)(v5 + 168) + 56) = 0;
    *(void *)(v5 + 128) = 0;
    *(void *)(*(void *)(v5 + 168) + 48) = 0;
    *(void *)(*(void *)(v5 + 168) + 80) = 0;
    *(void *)(*(void *)(v5 + 168) + 120) = 0;
    *(void *)(*(void *)(v5 + 168) + 128) = 0;
    *(_DWORD *)(v5 + 40) = *(_DWORD *)(v5 + 40) & 0xE7FFFFFF | 0x10000000;
    if (_PF_Threading_Debugging_level)
    {
      uint64_t v21 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        uint64_t v21 = malloc_default_zone();
      }
      *(void *)(*(void *)(v5 + 168) + 56) = malloc_type_zone_malloc(v21, 0x30uLL, 0x80040B8603338uLL);
      pthread_t v22 = pthread_self();
      **(void **)(*(void *)(v5 + 168) + 56) = v22;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56) + 8) = v22;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56) + 16) = 0;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56) + 24) = 0;
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56) + 32) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(*(void *)(*(void *)(v5 + 168) + 56) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unsigned __int8 v23 = atomic_load((unsigned __int8 *)(v5 + 49));
      if ((v23 & 1) == 0)
      {
        uint64_t v24 = (void *)[MEMORY[0x1E4F28F08] currentQueue];
        if ([v24 maxConcurrentOperationCount] == 1) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = 0;
        }
        *(void *)(*(void *)(*(void *)(v5 + 168) + 56) + 16) = v25;
        current_queue = dispatch_get_current_queue();
        if (current_queue == dispatch_get_global_queue(0, 0)) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = current_queue;
        }
        *(void *)(*(void *)(*(void *)(v5 + 168) + 56) + 24) = v27;
      }
    }
  }
  return v5;
}

- (uint64_t)_dispose:(uint64_t)result
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  [*(id *)(result + 136) lock];
  ++*(_DWORD *)(v1 + 52);
  *(_DWORD *)(v1 + 16) = 1;
  if (_PF_Threading_Debugging_level && *(void *)(*(void *)(v1 + 168) + 56)) {
    *(void *)(*(void *)(*(void *)(v1 + 168) + 56) + 8) = pthread_self();
  }
  unint64_t v2 = *(const void **)(v1 + 32);
  if (v2) {
    BOOL v3 = CFGetRetainCount(v2) == 1;
  }
  else {
    BOOL v3 = 0;
  }
  ++*(_WORD *)(v1 + 46);
  -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](*(void *)(v1 + 152));
  unint64_t Count = _PFCMT_GetCount(*(void **)(v1 + 120));
  uint64_t v47 = (uint64_t)&v47;
  unint64_t v5 = MEMORY[0x1F4188790](Count);
  CFAllocatorRef v8 = (const void **)((char *)&v47 - v7);
  if (v5 >= 0x201) {
    CFAllocatorRef v8 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v47 - v7, 8 * v6);
  }
  CFIndex v9 = -[_PFContextMapTable getAllObjects:](*(void *)(v1 + 120), v8);
  -[NSManagedObjectContext lockObjectStore](v1);
  id v48 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  *(void *)&long long v49 = v8;
  CFArrayCallBacks callBacks = *(CFArrayCallBacks *)byte_1ED787230;
  if (!v3)
  {
    NSPersistentStoreRequestType v10 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, &callBacks);
    if (!v9) {
      goto LABEL_28;
    }
LABEL_13:
    id v11 = (id *)v49;
    do
    {
      int v12 = *v11;
      pthread_t v13 = objc_msgSend(*v11, "objectID", v47, v48);
      if (v12) {
        char v14 = v3;
      }
      else {
        char v14 = 1;
      }
      if ((v14 & 1) == 0 && (*((unsigned char *)v12 + 17) & 2) != 0)
      {
        unsigned __int8 v15 = v13;
        if (([v13 isTemporaryID] & 1) == 0)
        {
          CFArrayAppendValue(v10, v15);
          v12[4] &= ~0x200u;
        }
      }
      unsigned int v16 = v12[4];
      unsigned int v17 = v16 & 0xFFFFFFC0;
      v12[4] = v16 & 0xFFFFFFC0;
      int v18 = (v16 >> 15) & 7;
      if (v18 == 5 || v18 == 0)
      {
        -[NSFaultHandler turnObject:intoFaultWithContext:](_insertion_fault_handler, (uint64_t)v12, 0);
        unsigned int v17 = v12[4];
      }
      *((void *)v12 + 4) = 0;
      v12[4] = v17 | 0x80080;
      ++v11;
      --v9;
    }
    while (v9);
    goto LABEL_28;
  }
  NSPersistentStoreRequestType v10 = 0;
  if (v9) {
    goto LABEL_13;
  }
LABEL_28:
  if (!v3 && CFArrayGetCount(v10) >= 1) {
    objc_msgSend(*(id *)(v1 + 32), "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v10, objc_msgSend((id)v1, "_queryGenerationToken"));
  }
  if (v10) {
    CFRelease(v10);
  }
  -[_PFManagedObjectReferenceQueue _processReferenceQueue:](*(void *)(v1 + 152), 1);
  if (Count >= 0x201) {
    NSZoneFree(0, (void *)v49);
  }
  uint64_t v20 = *(void *)(v1 + 152);
  if (v20)
  {
    *(_DWORD *)(v20 + 20) = -1;
    os_unfair_lock_lock_with_options();
    *(void *)(v20 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 12));
    -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](v20);
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:](v20, 1);
    CFRelease((CFTypeRef)v20);
  }

  -[NSManagedObjectContext unlockObjectStore](v1);
  uint64_t v21 = *(const void **)(v1 + 152);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(v1 + 152) = 0;
  }
  *(_DWORD *)(v1 + 16) = 1;
  pthread_t v22 = *(const void **)(v1 + 120);
  *(void *)(v1 + 120) = 0;
  *(_DWORD *)(v1 + 40) = *(_DWORD *)(v1 + 40) & 0xFFFFF8BF | 0x40;
  __dmb(0xBu);
  if (v22) {
    CFRelease(v22);
  }

  *(void *)(v1 + 72) = 0;
  *(void *)(v1 + 64) = 0;

  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 80) = 0;

  *(void *)(v1 + 88) = 0;
  *(void *)(v1 + 96) = 0;

  *(void *)(v1 + 104) = 0;
  *(void *)(v1 + 112) = 0;

  *(void *)(*(void *)(v1 + 168) + 24) = 0;
  *(void *)(*(void *)(v1 + 168) + 96) = 0;

  *(void *)(*(void *)(v1 + 168) + 120) = 0;
  *(void *)(*(void *)(v1 + 168) + 128) = 0;

  *(void *)(*(void *)(v1 + 168) + 88) = 0;
  *(void *)(*(void *)(v1 + 168) + 104) = 0;
  unsigned __int8 v23 = *(void **)(v1 + 128);
  if (v23)
  {
    uint64_t v24 = *(void *)(*(void *)(v1 + 168) + 80);
    if (v24)
    {
      unint64_t v25 = 0;
      unint64_t v26 = 2 * v24;
      do
      {

        v25 += 2;
      }
      while (v25 < v26);
      unsigned __int8 v23 = *(void **)(v1 + 128);
    }
    PF_FREE_OBJECT_ARRAY(v23);
  }
  *(void *)(v1 + 128) = 0;

  *(void *)(*(void *)(v1 + 168) + 32) = 0;
  *(void *)(*(void *)(v1 + 168) + 16) = 0;

  *(void *)(*(void *)(v1 + 168) + 48) = 0;
  **(void **)(v1 + 168) = 0;

  *(void *)(*(void *)(v1 + 168) + 136) = 0;
  *(void *)(*(void *)(v1 + 168) + 144) = 0;

  *(void *)(*(void *)(v1 + 168) + 112) = 0;
  *(void *)(*(void *)(v1 + 168) + 152) = 0;

  *(void *)(*(void *)(v1 + 168) + 160) = 0;
  uint64_t v27 = *(void *)(v1 + 168);
  CFSetCallBacks v28 = *(id **)(v27 + 8);
  if (v28)
  {

    PF_FREE_OBJECT_ARRAY(*(void **)(*(void *)(v1 + 168) + 8));
    *(void *)(*(void *)(v1 + 168) + 8) = 0;
    uint64_t v27 = *(void *)(v1 + 168);
  }
  uint64_t v29 = *(void *)(v27 + 56);
  if (v29)
  {

    *(void *)(*(void *)(*(void *)(v1 + 168) + 56) + 32) = 85;
    *(void *)(*(void *)(*(void *)(v1 + 168) + 56) + 40) = 85;
    NSUInteger v30 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      NSUInteger v30 = malloc_default_zone();
    }
    malloc_zone_free(v30, *(void **)(*(void *)(v1 + 168) + 56));
    *(void *)(*(void *)(v1 + 168) + 56) = 0;
    uint64_t v27 = *(void *)(v1 + 168);
  }

  *(void *)(*(void *)(v1 + 168) + 168) = @"deallocated NSManagedObjectContext";
  PF_FREE_OBJECT_ARRAY(*(void **)(v1 + 168));
  *(void *)(v1 + 168) = 0;
  [*(id *)(v1 + 136) unlock];
  id v32 = *(NSObject **)(v1 + 24);
  if (v32) {
    dispatch_release(v32);
  }
  *(void *)(v1 + 24) = 0;
  unint64_t v33 = atomic_load((unint64_t *)(v1 + 8));
  unint64_t v34 = v33;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(v1 + 8), &v34, 0);
  if (v34 != v33)
  {
    *(void *)&long long v31 = 134218752;
    long long v49 = v31;
    do
    {
      uint64_t v37 = objc_msgSend(NSString, "stringWithUTF8String:", "Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)", v47);
      atomic_load((unint64_t *)(v1 + 8));
      _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, v1);
      uint64_t v44 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        unint64_t v46 = atomic_load((unint64_t *)(v1 + 8));
        *(_DWORD *)buf = v49;
        uint64_t v52 = v1;
        __int16 v53 = 2048;
        uint64_t v54 = 0;
        __int16 v55 = 2048;
        unint64_t v56 = v33;
        __int16 v57 = 2048;
        unint64_t v58 = v46;
        _os_log_fault_impl(&dword_18AB82000, v44, OS_LOG_TYPE_FAULT, "CoreData: Failed to set actor (%p) new owner (%p).  Expected previous (%p) is now (%p)", buf, 0x2Au);
      }
      unint64_t v33 = atomic_load((unint64_t *)(v1 + 8));
      unint64_t v45 = v33;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v1 + 8), &v45, 0);
    }
    while (v45 != v33);
  }
  uint64_t v35 = *(const void **)(v1 + 136);
  if (v35) {
    CFRelease(v35);
  }
  *(void *)(v1 + 136) = 0;
  uint64_t v36 = *(const void **)(v1 + 32);
  if (v36) {
    CFRelease(v36);
  }
  *(void *)(v1 + 32) = 0;
  return MEMORY[0x18C128600]();
}

+ (NSManagedObjectContext)alloc
{
  return (NSManagedObjectContext *)_PFAllocateObject((Class)a1, 0);
}

- (NSManagedObjectContext)parentContext
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  if (v2) {
    return (NSManagedObjectContext *)self->_parentObjectStore;
  }
  else {
    return 0;
  }
}

- (NSString)transactionAuthor
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3052000000;
  pthread_t v13 = __Block_byref_object_copy__12;
  char v14 = __Block_byref_object_dispose__12;
  uint64_t v15 = 0;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __43__NSManagedObjectContext_transactionAuthor__block_invoke;
  uint64_t v7 = &unk_1E544B9B0;
  CFAllocatorRef v8 = self;
  CFIndex v9 = &v10;
  if (self->_dispatchQueue) {
    [(NSManagedObjectContext *)self performBlockAndWait:&v4];
  }
  else {
    *(void *)(v9[1] + 40) = objc_msgSend(self->_additionalPrivateIvars[16], "copy", v4, v5, v6, v7, v8);
  }
  unsigned __int8 v2 = (NSString *)(id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v2;
}

- (BOOL)_setQueryGenerationFromToken:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_parentObjectStore)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if (v5) {
      return 0;
    }
  }
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  pthread_t v22 = __Block_byref_object_copy__12;
  unsigned __int8 v23 = __Block_byref_object_dispose__12;
  uint64_t v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke;
  v18[3] = &unk_1E544BB50;
  v18[4] = a3;
  v18[5] = self;
  v18[6] = &v25;
  v18[7] = &v19;
  if (self->_dispatchQueue) {
    [(NSManagedObjectContext *)self performBlockAndWait:v18];
  }
  else {
    __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke((uint64_t)v18);
  }
  if (*((unsigned char *)v26 + 24))
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = (void *)v20[5];
    if (v7)
    {
      if (a4) {
        *a4 = v7;
      }
    }
    else
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
      uint64_t v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        NSUInteger v30 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
        __int16 v31 = 1024;
        int v32 = 4387;
        _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id v16 = (id)v20[5];
    BOOL v6 = *((unsigned char *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v6;
}

- (BOOL)setQueryGenerationFromToken:(NSQueryGenerationToken *)generation error:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if (self->_parentObjectStore)
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if (v7) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Child contexts inherit parent context generations and may not have their own" userInfo:0]);
    }
    if ([(NSManagedObjectContext *)self automaticallyMergesChangesFromParent]
      && +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken") != generation&& +[NSQueryGenerationToken currentQueryGenerationToken] != generation)
    {
      [(NSManagedObjectContext *)self setAutomaticallyMergesChangesFromParent:0];
    }
    return [(NSManagedObjectContext *)self _setQueryGenerationFromToken:generation error:error];
  }
  else
  {
    if (error) {
      *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E1D58];
    }
    return 0;
  }
}

- (BOOL)automaticallyMergesChangesFromParent
{
  if (self->_dispatchQueue) {
    return *((unsigned __int8 *)&self->_flags + 2) >> 7;
  }
  else {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (NSQueryGenerationToken)queryGenerationToken
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  id v16 = __Block_byref_object_dispose__12;
  uint64_t v17 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __46__NSManagedObjectContext_queryGenerationToken__block_invoke;
  uint64_t v9 = &unk_1E544B9B0;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  if (self->_dispatchQueue) {
    [(NSManagedObjectContext *)self performBlockAndWait:&v6];
  }
  else {
    *(void *)(v11[1] + 40) = (id)[(NSManagedObjectContext *)self _queryGenerationToken];
  }
  char v2 = objc_msgSend((id)v13[5], "_isEnabled", v6, v7, v8, v9, v10);
  BOOL v3 = (void *)v13[5];
  if ((v2 & 1) == 0)
  {

    BOOL v3 = 0;
    v13[5] = 0;
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)setTransactionAuthor:(NSString *)transactionAuthor
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__NSManagedObjectContext_setTransactionAuthor___block_invoke;
  v3[3] = &unk_1E544B778;
  v3[4] = transactionAuthor;
  v3[5] = self;
  if (self->_dispatchQueue) {
    [(NSManagedObjectContext *)self performBlockAndWait:v3];
  }
  else {
    __47__NSManagedObjectContext_setTransactionAuthor___block_invoke((uint64_t)v3);
  }
}

- (void)setMergePolicy:(id)mergePolicy
{
  if (self->_dispatchQueue)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__NSManagedObjectContext_setMergePolicy___block_invoke;
    v9[3] = &unk_1E544B778;
    v9[4] = mergePolicy;
    void v9[5] = self;
    [(NSManagedObjectContext *)self performBlockAndWait:v9];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    id v5 = (id)*((void *)self->_additionalPrivateIvars + 3);
    if (v5 != mergePolicy)
    {

      id v6 = NSErrorMergePolicy;
      if (mergePolicy) {
        id v6 = mergePolicy;
      }
      *((void *)self->_additionalPrivateIvars + 3) = v6;
      uint64_t v7 = (void *)*((void *)self->_additionalPrivateIvars + 3);
      id v8 = v7;
    }
  }
}

- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
  if (persistentStoreCoordinator)
  {
    id parentObjectStore = (NSPersistentStoreCoordinator *)self->_parentObjectStore;
    if (parentObjectStore != persistentStoreCoordinator)
    {
      if (parentObjectStore) {
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Context already has a coordinator;  cannot replace.",
      }
                                   0));
      if (self->_dispatchQueue)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __56__NSManagedObjectContext_setPersistentStoreCoordinator___block_invoke;
        v6[3] = &unk_1E544B778;
        v6[4] = self;
        v6[5] = persistentStoreCoordinator;
        [(NSManagedObjectContext *)self performBlockAndWait:v6];
      }
      else
      {
        if (_PF_Threading_Debugging_level)
        {
          uint64_t v4 = persistentStoreCoordinator;
          id v5 = self;
          _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
          persistentStoreCoordinator = v4;
          self = v5;
        }
        -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)self, persistentStoreCoordinator);
      }
    }
  }
}

- (void)performBlockAndWait:(void *)block
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can only use -performBlockAndWait: on an NSManagedObjectContext that was created with a queue." userInfo:0]);
  }
  uint64_t v4 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  context[0] = block;
  context[1] = self;
  uint64_t v14 = 0;
  uint64_t v15 = v4;
  if (byte_1EB2706B2) {
    uint64_t v14 = 4;
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
  if (v5)
  {
    if (_PFIsSerializedWithMainQueue())
    {
LABEL_26:
      developerSubmittedBlockToNSManagedObjectContextPerform(context);
      return;
    }
  }
  else if (v4)
  {
    unint64_t v6 = 0;
    int v7 = 0;
    unint64_t v8 = (unint64_t)v4;
    while ((NSManagedObjectContext *)v8 != self)
    {
      if (v8 == v6) {
        goto LABEL_16;
      }
      if (!v6) {
        unint64_t v6 = v8;
      }
      unint64_t v8 = atomic_load((unint64_t *)(v8 + 8));
      if (!v8) {
        goto LABEL_17;
      }
    }
    int v7 = 1;
LABEL_16:
    if (v7) {
      goto LABEL_26;
    }
LABEL_17:
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v11 = self;
    while (v11 != v4)
    {
      if (v11 == v9) {
        goto LABEL_25;
      }
      if (!v9) {
        uint64_t v9 = v11;
      }
      uint64_t v11 = (NSManagedObjectContext *)atomic_load((unint64_t *)&v11->_queueOwner);
      if (!v11) {
        goto LABEL_27;
      }
    }
    int v10 = 1;
LABEL_25:
    if (v10) {
      goto LABEL_26;
    }
  }
LABEL_27:
  uint64_t v12 = 8196;
  if (!byte_1EB2706B2) {
    uint64_t v12 = 0x2000;
  }
  uint64_t v14 = v12;
  dispatch_sync_f((dispatch_queue_t)self->_dispatchQueue, context, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
}

- (void)setUndoManager:(NSUndoManager *)undoManager
{
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__NSManagedObjectContext_setUndoManager___block_invoke;
    v5[3] = &unk_1E544B778;
    v5[4] = self;
    v5[5] = undoManager;
    [(NSManagedObjectContext *)self performBlockAndWait:v5];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    -[NSManagedObjectContext _setUndoManager:]((uint64_t)self, undoManager);
  }
}

- (void)setName:(NSString *)name
{
  uint64_t v5 = [(NSString *)name copy];
  uint64_t v6 = v5;
  if (self->_dispatchQueue)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__NSManagedObjectContext_setName___block_invoke;
    v7[3] = &unk_1E544B778;
    v7[4] = self;
    v7[5] = v5;
    [(NSManagedObjectContext *)self performBlockAndWait:v7];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }

    *((void *)self->_additionalPrivateIvars + 21) = v6;
  }
}

- (void)_setDelegate:(id)a3
{
  *((void *)self->_additionalPrivateIvars + 2) = a3;
}

- (NSString)name
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  int v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__NSManagedObjectContext_name__block_invoke;
    v5[3] = &unk_1E544B9B0;
    v5[4] = self;
    v5[5] = &v6;
    [(NSManagedObjectContext *)self performBlockAndWait:v5];
    char v2 = (void *)v7[5];
  }
  else
  {
    char v2 = (void *)[self->_additionalPrivateIvars[21] copy];
    v7[5] = (uint64_t)v2;
  }
  BOOL v3 = v2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)_setParentContext:(unsigned __int8 *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    atomic_store(1u, result + 48);
    uint64_t v4 = [a2 persistentStoreCoordinator];
    *(void *)(v3 + 32) = a2;
    if (a2) {
      CFRetain(a2);
    }
    -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, v4);
    uint64_t result = (unsigned __int8 *)-[_PFContextMapTable setForUseWithCoordinator:](*(void **)(v3 + 120), v4);
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 96);
      if (v5) {
        uint64_t v5 = *(void *)(v5 + 48);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    *(void *)(*(void *)(v3 + 168) + 80) = v5;
  }
  return result;
}

- (uint64_t)_setPersistentStoreCoordinator:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(void *)(result + 32) = cf;
    if (cf)
    {
      CFRetain(cf);
      -[_PFContextMapTable setForUseWithCoordinator:](*(void **)(v3 + 120), (uint64_t)cf);
      uint64_t result = -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, (uint64_t)cf);
      uint64_t v4 = *((void *)cf + 12);
      if (v4) {
        uint64_t v4 = *(void *)(v4 + 48);
      }
    }
    else
    {
      -[_PFContextMapTable setForUseWithCoordinator:](*(void **)(result + 120), 0);
      uint64_t result = -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, 0);
      uint64_t v4 = 0;
    }
    *(void *)(*(void *)(v3 + 168) + 80) = v4;
  }
  return result;
}

- (uint64_t)_registerForNotificationsWithCoordinator:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      uint64_t v2 = result;
      uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", result, sel__storeConfigurationChanged_, @"_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification", a2);
      if ((*(unsigned char *)(v2 + 42) & 0x80) != 0 && *(void *)(v2 + 24) && *(void *)(v2 + 32))
      {
        uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v4 = *(void *)(v2 + 32);
        return [v3 addObserver:v2 selector:sel__automaticallyMergeChangesFromContextDidSaveNotification_ name:@"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification" object:v4];
      }
    }
  }
  return result;
}

- (void)set_isSwiftBound:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  self->_flags = (_managedObjectContextFlags)(v3 & 0x80000000 | *(_DWORD *)&self->_flags & 0x7FFFFFFF);
  if (a3) {
    atomic_store(1u, (unsigned __int8 *)&self->_generatedMutatedIDsNotification);
  }
}

- (NSMutableDictionary)userInfo
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t result = (NSMutableDictionary *)*((void *)self->_additionalPrivateIvars + 6);
  if (!result)
  {
    *((void *)self->_additionalPrivateIvars + 6) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    return (NSMutableDictionary *)*((void *)self->_additionalPrivateIvars + 6);
  }
  return result;
}

- (id)mergePolicy
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (id)*((void *)self->_additionalPrivateIvars + 3);
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[4];
  if (v3)
  {
    uint64_t v6 = [*(id *)(v3 + 32) objectForKey:a2];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = objc_alloc_init(NSFetchRequest);
      [(NSFetchRequest *)v8 setEntity:v7];
      [(NSFetchRequest *)v8 setIncludesSubentities:1];
      [(NSFetchRequest *)v8 setIncludesPendingChanges:0];
      -[NSFetchRequest setPredicate:](v8, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", a3]);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3;
      v11[3] = &unk_1E544B500;
      uint64_t v9 = (void *)a1[5];
      uint64_t v10 = a1[6];
      v11[4] = v9;
      v11[5] = v8;
      v11[6] = v10;
      if (v9[3]) {
        [v9 performBlockAndWait:v11];
      }
      else {
        __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3((uint64_t)v11);
      }
    }
  }
}

- (uint64_t)_countWithNoChangesForRequest:(id *)a3 error:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a2, "substitutionVariables"), "objectForKey:", @"FETCH_REQUEST_LIMIT_SUBSTITUTION"))
  {
    uint64_t v39 = 1;
  }
  else
  {
    uint64_t v39 = [a2 fetchLimit];
  }
  id v54 = 0;
  if (![a2 entity])
  {
    uint64_t v36 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%@ A fetch request must have an entity.", NSStringFromSelector(sel__countWithNoChangesForRequest_error_)), 0 reason userInfo];
    objc_exception_throw(v36);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = (void *)[a2 copy];
  if (v39 && [a1 hasChanges]) {
    -[NSManagedObjectContext _unlimitRequest:](v7);
  }
  [v7 setResultType:4];
  -[NSManagedObjectContext lockObjectStore]((uint64_t)a1);
  uint64_t v8 = (void *)[a1[4] executeRequest:v7 withContext:a1 error:&v54];
  id v9 = v54;
  id v10 = v8;

  [v6 drain];
  -[NSManagedObjectContext unlockObjectStore]((uint64_t)a1);
  if (v54)
  {
    id v11 = v54;
    if (a3) {
      *a3 = v54;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([v8 count]) {
    unint64_t v12 = objc_msgSend((id)objc_msgSend(v8, "lastObject"), "unsignedIntValue");
  }
  else {
    unint64_t v12 = 0;
  }

  if ([a1 hasChanges] && objc_msgSend(a2, "includesPendingChanges"))
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v14 = [a2 predicate];
    uint64_t v15 = (void *)[a2 affectedStores];
    uint64_t v16 = (void *)[a2 entity];
    if (objc_msgSend((id)objc_msgSend(v16, "subentitiesByName"), "count"))
    {
      int v17 = [a2 includesSubentities];
      if (v14)
      {
LABEL_22:
        id v40 = [+[_NSMemoryStorePredicateRemapper defaultInstance] createPredicateForFetchFromPredicate:v14 withContext:0];
        id v18 = v40;
LABEL_25:
        if (![v15 count]) {
          uint64_t v15 = 0;
        }
        callBacks.versiouint64_t n = *MEMORY[0x1E4F1D548];
        *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
        uint64_t v19 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
        callBacks.equal = 0;
        callBacks.hash = 0;
        callBacks.copyDescriptiouint64_t n = v19;
        uint64_t v20 = [a1[9] count];
        uint64_t v21 = (__CFSet *)a1[10];
        if (v20)
        {
          if ([a1[10] count])
          {
            uint64_t v21 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v22 = a1[9];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v50 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  CFSetAddValue(v21, *(const void **)(*((void *)&v49 + 1) + 8 * i));
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }
              while (v23);
            }
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v26 = a1[10];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v56 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v46;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v46 != v28) {
                    objc_enumerationMutation(v26);
                  }
                  CFSetAddValue(v21, *(const void **)(*((void *)&v45 + 1) + 8 * j));
                }
                uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v56 count:16];
              }
              while (v27);
            }
            int v37 = 1;
          }
          else
          {
            int v37 = 0;
            uint64_t v21 = (__CFSet *)a1[9];
          }
        }
        else
        {
          int v37 = 0;
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v30 = [(__CFSet *)v21 countByEnumeratingWithState:&v41 objects:v55 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v42;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v42 != v31) {
                objc_enumerationMutation(v21);
              }
              uint64_t v33 = *(void **)(*((void *)&v41 + 1) + 8 * k);
              if (v15)
              {
                uint64_t v34 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * k), "objectID"), "persistentStore");
                if (!v34 || [v15 indexOfObjectIdenticalTo:v34] == 0x7FFFFFFFFFFFFFFFLL) {
                  continue;
                }
              }
              uint64_t v35 = [v33 entity];
              if ((void *)v35 == v16 || v17 && [v16 _subentitiesIncludes:v35]) {
                v12 += [v40 evaluateWithObject:v33];
              }
            }
            uint64_t v30 = [(__CFSet *)v21 countByEnumeratingWithState:&v41 objects:v55 count:16];
          }
          while (v30);
        }
        if (v37) {
          CFRelease(v21);
        }
        [v38 drain];
        goto LABEL_63;
      }
    }
    else
    {
      int v17 = 0;
      if (v14) {
        goto LABEL_22;
      }
    }
    id v40 = (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
    goto LABEL_25;
  }
LABEL_63:
  if (v39 - 1 >= v12) {
    return v12;
  }
  else {
    return v39;
  }
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000;
  int v32 = __Block_byref_object_copy__12;
  uint64_t v33 = __Block_byref_object_dispose__12;
  uint64_t v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000;
  id v26 = __Block_byref_object_copy__12;
  uint64_t v27 = __Block_byref_object_dispose__12;
  uint64_t v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__NSManagedObjectContext__NestedContextSupport__executeRequest_withContext_error___block_invoke;
  v22[3] = &unk_1E544BA50;
  v22[4] = self;
  v22[5] = a3;
  v22[6] = a4;
  v22[7] = &v23;
  v22[8] = &v29;
  _perform((unint64_t)self, (uint64_t)v22);
  id v7 = (id)v24[5];
  id v8 = (id)v30[5];
  if (a5)
  {
    id v9 = (void *)v24[5];
    if (v9) {
      *a5 = v9;
    }
  }
  if ([a3 requestType] != 4)
  {
    uint64_t v10 = v24[5];
    if (v30[5])
    {
      if (!v10) {
        goto LABEL_11;
      }
    }
    else if (v10)
    {
      goto LABEL_11;
    }
    uint64_t v11 = [NSString stringWithUTF8String:"Either a non nil result OR an error in nexted context"];
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, v21);
    id v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v21) = 0;
      _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Either a non nil result OR an error in nexted context", (uint8_t *)&v21, 2u);
    }
  }
LABEL_11:
  uint64_t v19 = (void *)v30[5];
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v19;
}

- (void)_setAllowAncillaryEntities:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xF7FFFFFF | v3);
}

- (NSSet)updatedObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  int v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableSet count](self->_unprocessedChanges, "count")+ -[NSMutableSet count](self->_changedObjects, "count"));
  [v3 setSet:self->_changedObjects];
  [v3 unionSet:self->_unprocessedChanges];

  return (NSSet *)v3;
}

- (NSSet)insertedObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  int v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableSet count](self->_unprocessedInserts, "count")+ -[NSMutableSet count](self->_insertedObjects, "count"));
  [v3 setSet:self->_insertedObjects];
  [v3 unionSet:self->_unprocessedInserts];

  return (NSSet *)v3;
}

- (NSSet)deletedObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  int v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableSet count](self->_unprocessedDeletes, "count")+ -[NSMutableSet count](self->_deletedObjects, "count"));
  [v3 setSet:self->_deletedObjects];
  [v3 unionSet:self->_unprocessedDeletes];

  return (NSSet *)v3;
}

- (id)description
{
  id v3 = (id)[self->_additionalPrivateIvars[21] copy];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSManagedObjectContext;
    return (id)[NSString stringWithFormat:@"%@: %@", -[NSManagedObjectContext description](&v6, sel_description), v3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSManagedObjectContext;
    return [(NSManagedObjectContext *)&v5 description];
  }
}

+ (void)_mergeChangesFromRemoteContextSave:(void *)a3 intoContexts:(uint64_t)a4 withClientQueryGeneration:
{
  uint64_t v67 = a4;
  id v68 = a2;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  self;
  if (a3 && [a3 count])
  {
    id v61 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [v68 objectForKey:@"managedObjectContext"];
    if (v5
      && (Weauint64_t k = objc_loadWeak((id *)(v5 + 8))) != 0
      && (id v7 = Weak, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = (void *)[MEMORY[0x1E4F1CA80] set];
      do
      {
        [v8 addObject:v7];
        id v7 = (void *)[v7 parentContext];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v100 objects:v106 count:16];
    if (v9)
    {
      uint64_t v75 = 0;
      uint64_t v10 = *(void *)v101;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v101 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = [[_PFWeakReference alloc] initWithObject:*(void *)(*((void *)&v100 + 1) + 8 * v11)];
          uint64_t v13 = v12;
          if (v12)
          {
            id WeakRetained = objc_loadWeakRetained(&v12->_object);
            if (WeakRetained && (!v8 || ([v8 containsObject:WeakRetained] & 1) == 0))
            {
              [v76 addObject:WeakRetained];
              if (!v75) {
                uint64_t v75 = (void *)[WeakRetained persistentStoreCoordinator];
              }
            }
          }
          else
          {
            id WeakRetained = 0;
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v15 = [a3 countByEnumeratingWithState:&v100 objects:v106 count:16];
        uint64_t v9 = v15;
      }
      while (v15);
    }
    else
    {
      uint64_t v75 = 0;
    }
    uint64_t v16 = [v76 count];
    while (v16 > 0)
    {
      if (v75 != objc_msgSend((id)objc_msgSend(v76, "objectAtIndex:", --v16), "persistentStoreCoordinator"))
      {

        [v61 drain];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Mismatched PSCs in parameter contexts" userInfo:0]);
      }
    }
    if (v75 && [v76 count])
    {
      uint64_t v17 = (void *)[v68 objectForKey:@"newQueryGeneration"];
      if ([v17 _isEnabled]) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
      id v63 = v18;
      id v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"inserted", @"inserted_objectIDs", @"deleted", @"deleted_objectIDs", @"updated", @"updated_objectIDs", @"refreshed", @"refreshed_objectIDs", @"invalidated", @"invalidated_objectIDs", @"invalidatedAll", 0);
      id v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v68, "count"));
      id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v96 = 0;
      long long v97 = &v96;
      uint64_t v98 = 0x2020000000;
      uint64_t v99 = 0;
      uint64_t v90 = 0;
      uint64_t v91 = &v90;
      uint64_t v92 = 0x3052000000;
      uint64_t v93 = __Block_byref_object_copy__12;
      uint64_t v94 = __Block_byref_object_dispose__12;
      id v95 = 0;
      id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v60 = [v75 managedObjectModel];
      uint64_t v19 = [v66 count];
      uint64_t v20 = v19;
      if (v19)
      {
        unint64_t v21 = 0;
        uint64_t v62 = v19;
LABEL_38:
        uint64_t v22 = [v66 objectAtIndex:v21];
        uint64_t v23 = (void *)[v68 objectForKey:v22];
        unint64_t v74 = [v23 count];
        if (!v23 || !v74) {
          goto LABEL_95;
        }
        unint64_t v72 = v21;
        uint64_t v64 = v22;
        id v65 = &v59;
        if (v74 >= 0x201) {
          uint64_t v24 = 1;
        }
        else {
          uint64_t v24 = v74;
        }
        unint64_t v25 = (8 * v24 + 15) & 0xFFFFFFFFFFFFFFF0;
        id v26 = (char *)&v59 - v25;
        if (v74 > 0x200) {
          id v26 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v59 - v25, 8 * v74);
        }
        [v23 getObjects:v26];
        size_t v27 = 0;
        uint64_t v28 = 0;
        while (1)
        {
          CFURLRef v29 = *(const __CFURL **)&v26[8 * v28];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              int v32 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v75, v29, 0);
              goto LABEL_53;
            }
            CFURLRef v29 = (const __CFURL *)[(__CFURL *)v29 objectID];
          }
          uint64_t v30 = objc_msgSend((id)-[__CFURL persistentStore](v29, "persistentStore"), "_persistentStoreCoordinator");
          if (v30 != v75)
          {
            CFURLRef v31 = (const __CFURL *)[(__CFURL *)v29 URIRepresentation];
            int v32 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v75, v31, 0);
LABEL_53:
            CFURLRef v29 = (const __CFURL *)v32;
          }
          if (v29) {
            *(void *)&v26[8 * v27++] = v29;
          }
          if (v74 == ++v28)
          {
            if (v72 >= 4)
            {
              uint64_t v33 = malloc_type_calloc(1uLL, v27, 0x100004077774924uLL);
              v97[3] = (uint64_t)v33;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              uint64_t v34 = [v76 countByEnumeratingWithState:&v86 objects:v105 count:16];
              if (v34)
              {
                uint64_t v35 = *(void *)v87;
                do
                {
                  for (uint64_t i = 0; i != v34; ++i)
                  {
                    if (*(void *)v87 != v35) {
                      objc_enumerationMutation(v76);
                    }
                    int v37 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                    v85[0] = MEMORY[0x1E4F143A8];
                    v85[1] = 3221225472;
                    v85[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke;
                    v85[3] = &unk_1E544C5E8;
                    v85[6] = v27;
                    v85[7] = v26;
                    v85[4] = v37;
                    v85[5] = &v96;
                    if (v37[3]) {
                      [v37 performBlockAndWait:v85];
                    }
                    else {
                      __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke((uint64_t)v85);
                    }
                  }
                  uint64_t v34 = [v76 countByEnumeratingWithState:&v86 objects:v105 count:16];
                }
                while (v34);
              }
            }
            if (v27)
            {
              uint64_t v38 = 0;
              uint64_t v73 = 0;
              while (1)
              {
                uint64_t v39 = *(void *)&v26[8 * v38];
                if (v39) {
                  break;
                }
LABEL_84:
                if (++v38 == v27) {
                  goto LABEL_88;
                }
              }
              if (v72 >= 6)
              {
                if (!*(unsigned char *)(v97[3] + v38))
                {
LABEL_83:
                  [v71 addObject:v39];
                  uint64_t v44 = v73;
                  *(void *)&v26[8 * v73] = v39;
                  uint64_t v73 = v44 + 1;
                  goto LABEL_84;
                }
              }
              else if (v72 == 1)
              {
                goto LABEL_83;
              }
              uint64_t v40 = [*(id *)&v26[8 * v38] entity];
              if (v40)
              {
                if ((*(unsigned char *)(v40 + 120) & 4) != 0)
                {
                  long long v41 = *(void **)(v40 + 72);
                }
                else
                {
                  do
                  {
                    long long v41 = (void *)v40;
                    uint64_t v40 = [(id)v40 superentity];
                  }
                  while (v40);
                }
              }
              else
              {
                long long v41 = 0;
              }
              uint64_t v42 = [v41 name];
              id v43 = (id)[v70 objectForKey:v42];
              if (!v43)
              {
                id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v70 setObject:v43 forKey:v42];
              }
              [v43 addObject:v39];
              goto LABEL_83;
            }
            uint64_t v73 = 0;
LABEL_88:
            long long v45 = (void *)v97[3];
            if (v45)
            {
              free(v45);
              v97[3] = 0;
            }
            id v46 = objc_alloc(MEMORY[0x1E4F1C978]);
            uint64_t v20 = v62;
            unint64_t v21 = v72;
            long long v47 = (void *)[v46 initWithObjects:v26 count:v73];
            if ([v47 count])
            {
              [v69 setValue:v47 forKey:v64];
              if (v63) {
                [v69 setObject:v63 forKey:@"newQueryGeneration"];
              }
            }

            if (v74 >= 0x201) {
              NSZoneFree(0, v26);
            }
LABEL_95:
            if (++v21 == v20) {
              break;
            }
            goto LABEL_38;
          }
        }
      }
      if ([v70 count])
      {
        long long v48 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
        [(NSManagedObjectContext *)v48 setPersistentStoreCoordinator:v75];
        [(NSManagedObjectContext *)v48 setUndoManager:0];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_2;
        v84[3] = &unk_1E544C610;
        v84[4] = v60;
        v84[5] = v48;
        v84[6] = &v90;
        [v70 enumerateKeysAndObjectsUsingBlock:v84];
      }
      else
      {
        long long v48 = 0;
      }
      uint64_t v49 = [v76 count];
      if (v49)
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          long long v51 = (void *)[v76 objectAtIndex:j];
          if (![v51 parentContext])
          {
            v83[0] = MEMORY[0x1E4F143A8];
            v83[1] = 3221225472;
            v83[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4;
            v83[3] = &unk_1E544BB28;
            v83[4] = v51;
            v83[5] = v69;
            v83[6] = v67;
            if (v51[3]) {
              [v51 performBlockAndWait:v83];
            }
            else {
              __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4((uint64_t)v83);
            }
          }
        }
        for (uint64_t k = 0; k != v49; ++k)
        {
          __int16 v53 = (void *)[v76 objectAtIndex:k];
          if ([v53 parentContext])
          {
            v82[0] = MEMORY[0x1E4F143A8];
            v82[1] = 3221225472;
            v82[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5;
            v82[3] = &unk_1E544BB28;
            v82[4] = v53;
            v82[5] = v69;
            v82[6] = v67;
            if (v53[3]) {
              [v53 performBlockAndWait:v82];
            }
            else {
              __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5((uint64_t)v82);
            }
          }
        }
      }
      id v54 = (void *)v97[3];
      if (v54)
      {
        free(v54);
        v97[3] = 0;
      }
      if (v48)
      {
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_6;
        v81[3] = &unk_1E544B868;
        v81[4] = v48;
        [(NSManagedObjectContext *)v48 performBlockAndWait:v81];
      }

      [v61 drain];
      id v55 = 0;
      if (v48) {

      }
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      uint64_t v56 = [v76 countByEnumeratingWithState:&v77 objects:v104 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v78;
        do
        {
          for (uint64_t m = 0; m != v56; ++m)
          {
            if (*(void *)v78 != v57) {
              objc_enumerationMutation(v76);
            }
            -[NSManagedObjectContext _registerAsyncReferenceCallback](*(void *)(*((void *)&v77 + 1) + 8 * m));
          }
          uint64_t v56 = [v76 countByEnumeratingWithState:&v77 objects:v104 count:16];
        }
        while (v56);
      }

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v96, 8);
    }
    else
    {

      [v61 drain];
    }
  }
}

uint64_t __82__NSManagedObjectContext__NestedContextSupport__executeRequest_withContext_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 168) + 8))
  {
    uint64_t v2 = PF_CALLOC_OBJECT_ARRAY(2);
    *uint64_t v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2[1] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(*(void *)(v1 + 32) + 168) + 8) = v2;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v89 = 0;
  uint64_t v4 = 0;
  switch([*(id *)(v1 + 40) requestType])
  {
    case 1:
      if ([*(id *)(v1 + 40) resultType] == 4) {
        goto LABEL_8;
      }
      uint64_t v4 = *(_PFBatchFaultingArray **)(v1 + 32);
      if (!v4) {
        goto LABEL_6;
      }
      id v79 = v3;
      uint64_t v77 = v1;
      uint64_t v11 = *(void **)(v1 + 40);
      uint64_t v12 = *(void **)(v1 + 48);
      id v13 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      uint64_t v14 = (void *)[v11 copy];
      id v76 = v11;
      uint64_t v15 = [v11 resultType];
      id v98 = 0;
      if ([v14 predicate])
      {
        uint64_t v16 = [[_NSChildContextPredicateRemapper alloc] initWithContext:v4];
        id v17 = -[_NSChildContextPredicateRemapper createPredicateForFetchFromPredicate:withContext:](v16, "createPredicateForFetchFromPredicate:withContext:", [v14 predicate], v4);
        [v14 setPredicate:v17];
      }
      long long v80 = v14;
      id v78 = v13;
      if (![v14 fetchBatchSize]) {
        goto LABEL_33;
      }
      uint64_t v85 = [v14 entity];
      id v18 = (void *)[v14 affectedStores];
      if (!v18) {
        id v18 = objc_msgSend((id)-[_PFBatchFaultingArray persistentStoreCoordinator](v4, "persistentStoreCoordinator"), "persistentStores");
      }
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v94 objects:v100 count:16];
      if (!v19) {
        goto LABEL_33;
      }
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v95;
      uint64_t v81 = v15;
      break;
    case 2:
      uint64_t v5 = (_PFBatchFaultingArray *)-[NSManagedObjectContext _parentProcessSaveRequest:inContext:error:](*(void *)(v1 + 32), *(void **)(v1 + 40));
      goto LABEL_5;
    case 3:
LABEL_8:
      id v7 = (id)[*(id *)(v1 + 40) copy];
      if ([v7 predicate])
      {
        id v8 = [[_NSChildContextPredicateRemapper alloc] initWithContext:*(void *)(v1 + 32)];
        id v9 = -[_NSChildContextPredicateRemapper createPredicateForFetchFromPredicate:withContext:](v8, "createPredicateForFetchFromPredicate:withContext:", [v7 predicate], *(void *)(v1 + 32));
        [v7 setPredicate:v9];
      }
      uint64_t v10 = [*(id *)(v1 + 32) countForFetchRequest:v7 error:&v89];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v4 = 0;
      }
      else
      {
        uint64_t v5 = (_PFBatchFaultingArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10));
LABEL_5:
        uint64_t v4 = v5;
      }
LABEL_6:
      *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) = v89;
      *(void *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) = v4;
      return [v3 drain];
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      uint64_t v5 = (_PFBatchFaultingArray *)[*(id *)(v1 + 32) executeRequest:*(void *)(v1 + 40) error:&v89];
      goto LABEL_5;
    default:
      goto LABEL_6;
  }
  do
  {
    uint64_t v22 = v18;
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v95 != v21) {
        objc_enumerationMutation(v22);
      }
      uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
      char v25 = objc_msgSend((id)objc_msgSend(v24, "type"), "isEqual:", @"SQLite");
      char v26 = objc_msgSend((id)objc_msgSend(v24, "type"), "isEqual:", @"NSXPCStore");
      if ((v25 & 1) == 0 && (v26 & 1) == 0)
      {
        size_t v27 = (void *)[v24 configurationName];
        if (([v27 isEqualToString:@"PF_DEFAULT_CONFIGURATION_NAME"] & 1) != 0
          || objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[_PFBatchFaultingArray persistentStoreCoordinator](v4, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", v27), "indexOfObjectIdenticalTo:", v85) != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v80 setFetchBatchSize:0];
          uint64_t v15 = v81;
          id v13 = v78;
          goto LABEL_33;
        }
      }
    }
    id v18 = v22;
    uint64_t v20 = [v22 countByEnumeratingWithState:&v94 objects:v100 count:16];
    uint64_t v15 = v81;
    id v13 = v78;
  }
  while (v20);
LABEL_33:
  uint64_t v28 = v80;
  uint64_t v29 = [v80 includesPropertyValues];
  if (v15)
  {
    if (v15 == 1 && [(_PFBatchFaultingArray *)v4 hasChanges])
    {
      uint64_t v30 = 0;
LABEL_40:
      [v80 setResultType:v30];
    }
  }
  else if (!objc_msgSend((id)objc_msgSend(v80, "propertiesToFetch"), "count") {
         && ([(_PFBatchFaultingArray *)v4 hasChanges] & 1) == 0)
  }
  {
    uint64_t v30 = 1;
    goto LABEL_40;
  }
  [v80 setIncludesPropertyValues:v29];
  CFURLRef v31 = (void *)[(_PFBatchFaultingArray *)v4 executeFetchRequest:v80 error:&v98];
  uint64_t v32 = [v31 count];
  id v3 = v79;
  if (v32)
  {
    uint64_t v33 = v32;
    if ((!v15 && (_BYTE)dword_1EB270AB8 || BYTE1(dword_1EB270AB8) && v15 == 2) && [v80 fetchBatchSize])
    {
      uint64_t v34 = [v80 resultType];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v31)
        {
          CFURLRef v31 = (void *)[v31 newArrayFromObjectIDs];
          uint64_t v34 = 1;
          unint64_t v72 = v31;
        }
        else
        {
          unint64_t v72 = 0;
          uint64_t v34 = 1;
        }
      }
      else
      {
        unint64_t v72 = 0;
      }
      uint64_t v74 = v33;
      uint64_t v83 = (char *)PF_ALLOCATE_OBJECT_ARRAY(v33);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      uint64_t v47 = [v31 countByEnumeratingWithState:&v90 objects:v99 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = 0;
        uint64_t v50 = *(void *)v91;
        do
        {
          uint64_t v51 = 0;
          uint64_t v87 = v49;
          long long v52 = &v83[8 * v49];
          do
          {
            if (*(void *)v91 != v50) {
              objc_enumerationMutation(v31);
            }
            __int16 v53 = *(void **)(*((void *)&v90 + 1) + 8 * v51);
            if (v34 != 1) {
              __int16 v53 = objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * v51), "objectID", v72);
            }
            uint64_t v54 = objc_msgSend(*(id *)(*((void *)v4[2]._entryFlags + 1) + 8), "objectForKey:", v53, v72);
            if (v54)
            {
              id v55 = (void *)v54;
              if ([v12 objectRegisteredForID:v54]) {
                __int16 v53 = v55;
              }
            }
            *(void *)&v52[8 * v51++] = v53;
          }
          while (v48 != v51);
          uint64_t v48 = [v31 countByEnumeratingWithState:&v90 objects:v99 count:16];
          uint64_t v49 = v87 + v51;
        }
        while (v48);
      }
      uint64_t v56 = [[_PFArray alloc] initWithObjects:v83 count:v74 andFlags:10];
      uint64_t v57 = [[_PFBatchFaultingArray alloc] initWithPFArray:v56 andRequest:v76 andContext:v12];

      goto LABEL_98;
    }
    if (!v15)
    {
      uint64_t v75 = v33;
      uint64_t v84 = (char *)PF_ALLOCATE_OBJECT_ARRAY(v33);
      uint64_t v58 = [v80 resultType];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      uint64_t v59 = [v31 countByEnumeratingWithState:&v90 objects:v99 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = 0;
        uint64_t v62 = *(void *)v91;
        do
        {
          uint64_t v63 = 0;
          uint64_t v88 = v61;
          uint64_t v64 = &v84[8 * v61];
          do
          {
            if (*(void *)v91 != v62) {
              objc_enumerationMutation(v31);
            }
            id v65 = *(void **)(*((void *)&v90 + 1) + 8 * v63);
            if (v58 != 1) {
              id v65 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * v63) objectID];
            }
            uint64_t v66 = [*(id *)(*((void *)v4[2]._entryFlags + 1) + 8) objectForKey:v65];
            if (v66)
            {
              uint64_t v67 = (void *)v66;
              if ([v12 objectRegisteredForID:v66]) {
                id v65 = v67;
              }
            }
            if (v12) {
              id v68 = _PFRetainedObjectIDCore((uint64_t)v12, v65, 0, 1);
            }
            else {
              id v68 = 0;
            }
            *(void *)&v64[8 * v63++] = v68;
          }
          while (v60 != v63);
          uint64_t v69 = [v31 countByEnumeratingWithState:&v90 objects:v99 count:16];
          uint64_t v60 = v69;
          uint64_t v61 = v88 + v63;
        }
        while (v69);
      }
      id v46 = [[_PFArray alloc] initWithObjects:v84 count:v75 andFlags:42 andContext:v12];
      goto LABEL_97;
    }
    if (v15 == 1)
    {
      uint64_t v73 = v33;
      uint64_t v82 = (char *)PF_ALLOCATE_OBJECT_ARRAY(v33);
      uint64_t v36 = [v80 resultType];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      uint64_t v37 = [v31 countByEnumeratingWithState:&v90 objects:v99 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = 0;
        uint64_t v40 = *(void *)v91;
        do
        {
          uint64_t v41 = 0;
          uint64_t v86 = v39;
          uint64_t v42 = &v82[8 * v39];
          do
          {
            if (*(void *)v91 != v40) {
              objc_enumerationMutation(v31);
            }
            id v43 = *(void **)(*((void *)&v90 + 1) + 8 * v41);
            if (v36 != 1) {
              id v43 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * v41) objectID];
            }
            uint64_t v44 = [*(id *)(*((void *)v4[2]._entryFlags + 1) + 8) objectForKey:v43];
            if (v44)
            {
              long long v45 = (void *)v44;
              if ([v12 objectRegisteredForID:v44]) {
                id v43 = v45;
              }
            }
            *(void *)&v42[8 * v41++] = v43;
          }
          while (v38 != v41);
          uint64_t v38 = [v31 countByEnumeratingWithState:&v90 objects:v99 count:16];
          uint64_t v39 = v86 + v41;
        }
        while (v38);
      }
      id v46 = [[_PFArray alloc] initWithObjects:v82 count:v73 andFlags:10];
LABEL_97:
      uint64_t v57 = (_PFBatchFaultingArray *)v46;
LABEL_98:
      uint64_t v1 = v77;
      id v13 = v78;
      id v3 = v79;
      uint64_t v28 = v80;
LABEL_101:
      id v70 = v98;

      [v13 drain];
      -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)v4, 0);
      if (v98) {
        id v89 = v98;
      }
      id v71 = v98;
      uint64_t v5 = v57;
      goto LABEL_5;
    }
    uint64_t v35 = v31;
  }
  else
  {
    uint64_t v35 = (_PFBatchFaultingArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v57 = v35;
  uint64_t v1 = v77;
  goto LABEL_101;
}

- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request error:(NSError *)error
{
  NSUInteger result = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)self, request, (id *)error);
  if (error)
  {
    if (result == 0x7FFFFFFFFFFFFFFFLL) {
      *error = 0;
    }
  }
  return result;
}

- (uint64_t)_countForFetchRequest_:(id *)a3 error:
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(result, sel__countForFetchRequest__error_);
  }
  uint64_t v5 = *(void **)(*(void *)(v4 + 168) + 152);
  if (v5)
  {
    if (!a3) {
      return 0;
    }
    id v6 = v5;
    NSUInteger result = 0;
    *a3 = v6;
    return result;
  }
  [a2 _resolveEntityWithContext:v4];
  if (![(id)v4 hasChanges]
    || ![a2 includesPendingChanges]
    || [a2 resultType] == 2)
  {
    NSUInteger result = -[NSManagedObjectContext _countWithNoChangesForRequest:error:]((id *)v4, a2, a3);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        return 0;
      }
    }
    return result;
  }
  if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch](v4)) {
    -[NSManagedObjectContext _processRecentChanges:](v4, 0);
  }
  uint64_t v64 = v4;
  id v7 = (void *)[a2 affectedStores];
  id v8 = (void *)[a2 entity];
  uint64_t v63 = a2;
  if (objc_msgSend((id)objc_msgSend(v8, "subentitiesByName"), "count")) {
    int v9 = [a2 includesSubentities];
  }
  else {
    int v9 = 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  callBacks.versiouint64_t n = *MEMORY[0x1E4F1D548];
  *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
  uint64_t v12 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
  callBacks.equal = 0;
  callBacks.hash = 0;
  callBacks.copyDescriptiouint64_t n = v12;
  uint64_t v13 = *(void *)(v64 + 56);
  v97[0] = *(void *)(v64 + 96);
  v97[1] = v13;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  char v14 = 1;
  do
  {
    uint64_t v15 = (void *)v97[v10];
    char v69 = v14;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v77 objects:v96 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v78 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          if (!v7
            || objc_msgSend(v7, "indexOfObjectIdenticalTo:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * i), "objectID"), "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v20 = [v19 entity];
            if ((void *)v20 == v8 || v9 && [v8 _subentitiesIncludes:v20])
            {
              if (!v11) {
                uint64_t v11 = CFSetCreateMutable(allocator, 0, &callBacks);
              }
              CFSetAddValue(v11, v19);
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v77 objects:v96 count:16];
      }
      while (v16);
    }
    char v14 = 0;
    uint64_t v10 = 1;
  }
  while ((v69 & 1) != 0);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v21 = *(void **)(v64 + 88);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v73 objects:v95 count:16];
  if (v22)
  {
    cf = 0;
    uint64_t v23 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v74 != v23) {
          objc_enumerationMutation(v21);
        }
        char v25 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        uint64_t v26 = [v25 entity];
        if ((void *)v26 == v8 || v9 && [v8 _subentitiesIncludes:v26])
        {
          size_t v27 = cf;
          if (!cf) {
            size_t v27 = CFSetCreateMutable(allocator, 0, &callBacks);
          }
          cf = v27;
          CFSetAddValue(v27, v25);
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v73 objects:v95 count:16];
    }
    while (v22);
  }
  else
  {
    cf = 0;
  }
  if ([(__CFSet *)v11 count] || [(__CFSet *)cf count])
  {
    uint64_t v62 = [v63 fetchLimit];
    id v94 = 0;
    if (![v63 entity])
    {
      uint64_t v60 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%@ A fetch request must have an entity.", NSStringFromSelector(sel__countWithMergedChangesForRequest_possibleChanges_possibleDeletes_error_)), 0 reason userInfo];
      objc_exception_throw(v60);
    }
    id v28 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if ([(id)v64 hasChanges]
      && [v63 includesPendingChanges]
      && [v63 resultType] != 2
      && !-[NSManagedObjectContext _attemptCoalesceChangesForFetch](v64))
    {
      -[NSManagedObjectContext _processRecentChanges:](v64, 0);
    }
    uint64_t v29 = (void *)[v63 copy];
    -[NSManagedObjectContext _unlimitRequest:](v29);
    [v29 setIncludesPropertyValues:0];
    [v29 setResultType:1];
    [v29 setSortDescriptors:0];
    -[NSManagedObjectContext lockObjectStore](v64);
    uint64_t v30 = (void *)[*(id *)(v64 + 32) executeRequest:v29 withContext:v64 error:&v94];
    id v31 = v94;
    id v32 = v30;

    [v28 drain];
    -[NSManagedObjectContext unlockObjectStore](v64);
    if (v94)
    {
      id v33 = v94;
      if (a3) {
        *a3 = v94;
      }
    }
    else if (v30)
    {
      uint64_t v67 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v30];

      id v61 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      uint64_t v36 = [v63 predicate];
      uint64_t v37 = (void *)[v63 affectedStores];
      uint64_t v38 = (void *)[v63 entity];
      if (objc_msgSend((id)objc_msgSend(v38, "subentitiesByName"), "count")) {
        int allocatora = [v63 includesSubentities];
      }
      else {
        int allocatora = 0;
      }
      if (v36)
      {
        id v70 = [+[_NSMemoryStorePredicateRemapper defaultInstance] createPredicateForFetchFromPredicate:v36 withContext:0];
        id v39 = v70;
      }
      else
      {
        id v70 = (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
      }
      if ([v37 count]) {
        uint64_t v40 = v37;
      }
      else {
        uint64_t v40 = 0;
      }
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      uint64_t v41 = [(__CFSet *)v11 countByEnumeratingWithState:&v90 objects:v101 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v91;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v91 != v42) {
              objc_enumerationMutation(v11);
            }
            uint64_t v44 = *(void **)(*((void *)&v90 + 1) + 8 * k);
            uint64_t v45 = [v44 objectID];
            if ([v70 evaluateWithObject:v44]) {
              [v67 addObject:v45];
            }
            else {
              [v67 removeObject:v45];
            }
          }
          uint64_t v41 = [(__CFSet *)v11 countByEnumeratingWithState:&v90 objects:v101 count:16];
        }
        while (v41);
      }
      uint64_t v46 = 0;
      int8x16_t v100 = vextq_s8(*(int8x16_t *)(v64 + 72), *(int8x16_t *)(v64 + 72), 8uLL);
      char v47 = 1;
      do
      {
        uint64_t v48 = (void *)v100.i64[v46];
        char v65 = v47;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v86 objects:v99 count:16];
        if (v49)
        {
          uint64_t v50 = *(void *)v87;
          do
          {
            for (uint64_t m = 0; m != v49; ++m)
            {
              if (*(void *)v87 != v50) {
                objc_enumerationMutation(v48);
              }
              long long v52 = *(void **)(*((void *)&v86 + 1) + 8 * m);
              __int16 v53 = (void *)[v52 objectID];
              uint64_t v54 = v53;
              if (v40)
              {
                uint64_t v55 = [v53 persistentStore];
                if (!v55 || [v40 indexOfObjectIdenticalTo:v55] == 0x7FFFFFFFFFFFFFFFLL) {
                  continue;
                }
              }
              uint64_t v56 = [v52 entity];
              if ((void *)v56 == v38 || allocatora && [v38 _subentitiesIncludes:v56])
              {
                if ([v70 evaluateWithObject:v52]) {
                  [v67 addObject:v54];
                }
              }
            }
            uint64_t v49 = [v48 countByEnumeratingWithState:&v86 objects:v99 count:16];
          }
          while (v49);
        }
        char v47 = 0;
        uint64_t v46 = 1;
      }
      while ((v65 & 1) != 0);
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v57 = [(__CFSet *)cf countByEnumeratingWithState:&v82 objects:v98 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v83;
        do
        {
          for (uint64_t n = 0; n != v57; ++n)
          {
            if (*(void *)v83 != v58) {
              objc_enumerationMutation(cf);
            }
            objc_msgSend(v67, "removeObject:", objc_msgSend(*(id *)(*((void *)&v82 + 1) + 8 * n), "objectID"));
          }
          uint64_t v57 = [(__CFSet *)cf countByEnumeratingWithState:&v82 objects:v98 count:16];
        }
        while (v57);
      }
      [v61 drain];
      unint64_t v34 = [v67 count];

      if (v62 - 1 < v34) {
        unint64_t v34 = v62;
      }
      goto LABEL_68;
    }
    unint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v34 = -[NSManagedObjectContext _countWithNoChangesForRequest:error:]((id *)v64, v63, a3);
  }
LABEL_68:
  if (v11) {
    CFRelease(v11);
  }
  if (cf) {
    CFRelease(cf);
  }
  if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v35 = 0;
  }
  if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
    return v35;
  }
  else {
    return v34;
  }
}

- (uint64_t)_implicitObservationInfoForEntity:(void *)a3 forResultingClass:
{
  if (result)
  {
    uint64_t v5 = result;
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(result, sel__implicitObservationInfoForEntity_forResultingClass_);
    }
    if (*(__int16 *)(v5 + 46) <= 0)
    {
      uint64_t v16 = 0;
      uint64_t v6 = [(id)v5 persistentStoreCoordinator];
      if (v6) {
        uint64_t v7 = *(void *)(v6 + 96);
      }
      else {
        uint64_t v7 = 0;
      }
      if (!*(void *)(v5 + 128))
      {
        uint64_t v8 = *(void *)(*(void *)(v5 + 168) + 80);
        if (!v8)
        {
          *(void *)(*(void *)(v5 + 168) + 80) = _PFModelMapTotalEntityCountForModel((void *)[a2 managedObjectModel]);
          uint64_t v8 = *(void *)(*(void *)(v5 + 168) + 80);
        }
        *(void *)(v5 + 128) = PF_CALLOC_OBJECT_ARRAY(2 * v8);
      }
      uint64_t v9 = _PFModelMapSlotForEntity(v7, a2);
      uint64_t v10 = 2 * v9;
      uint64_t v11 = *(void *)(v5 + 128);
      uint64_t v12 = *(void *)(v11 + 16 * v9);
      if (v12)
      {
        uint64_t v16 = *(void *)(v11 + ((16 * v9) | 8));
      }
      else
      {
        id v13 = -[NSEntityDescription _new_implicitlyObservedKeys](a2);
        _PFFastEntityClass((unint64_t)a2);
        char v14 = (void *)MEMORY[0x18C127630]();
        uint64_t ImplicitObservationInfo = _NSKeyValueCreateImplicitObservationInfo();

        uint64_t v12 = NSKeyValueCoding_NullValue;
        if (ImplicitObservationInfo) {
          uint64_t v12 = ImplicitObservationInfo;
        }
        *(void *)(*(void *)(v5 + 128) + 8 * v10) = v12;
        *(void *)(*(void *)(v5 + 128) + ((8 * v10) | 8)) = 0;
      }
      if (v12 == NSKeyValueCoding_NullValue) {
        NSUInteger result = 0;
      }
      else {
        NSUInteger result = v12;
      }
      if (result) {
        *a3 = v16;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 168) + 96);
  if (*(void **)(a1 + 32) != v1)
  {
    id v3 = +[NSQueryGenerationToken unpinnedQueryGenerationToken];
    uint64_t v4 = *(NSQueryGenerationToken **)(a1 + 32);
    if (v4) {
      BOOL v5 = v3 == v4;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5
      || (id v3 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), v3 == *(NSQueryGenerationToken **)(a1 + 32))|| (id v3 = +[NSQueryGenerationToken nostoresQueryGenerationToken], v3 == *(NSQueryGenerationToken **)(a1 + 32)))
    {
      uint64_t v9 = v3;
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) persistentStoreCoordinator];
      id v8 = *(id *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      if (v6)
      {
        if (v6 != *(void *)(v7 + 32))
        {
          id v8 = (id)[*(id *)(a1 + 32) copy];
          uint64_t v7 = *(void *)(a1 + 40);
        }
      }
      id v10 = 0;
      if (![*(id *)(v7 + 32) _validateQueryGeneration:v8 error:&v10])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v10;
        goto LABEL_15;
      }
      uint64_t v9 = (NSQueryGenerationToken *)v8;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 168) + 96) = v9;
LABEL_15:
  }
}

+ (void)initialize
{
  self;
  objc_opt_class();
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class()) {
    return;
  }
  self;
  qword_1EB2706B8 = @"ImplicitObservation";
  objc_opt_class();
  _PF_Threading_Debugging_level = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.ConcurrencyDebug");
  id v3 = +[_PFRoutines stringValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.Logging.oslog");
  if ([v3 length]) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = -1;
  }
  BOOL v5 = +[_PFRoutines stringValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.Logging.stderr");
  if (![v5 length])
  {
    int v6 = -1;
    if (v4 < 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int v6 = [v5 intValue];
  if ((v4 & 0x80000000) == 0) {
LABEL_8:
  }
    _pflogging_enable_oslog = v4;
LABEL_9:
  if ((v6 & 0x80000000) == 0) {
    _pflogging_enable_stderr = v6;
  }
  byte_1EB2706B2 = HIBYTE(dword_1EB270AB0);
  _PF_shouldAsyncProcessReferenceQueue = BYTE2(dword_1EB270AB0);
  _MergedGlobals_74 = dword_1EB270AB8;
  byte_1EB2706B1 = +[_PFRoutines insecureBoolValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.Toolchain.EnableToolchainBehaviors");
  uint64_t v7 = getprogname();
  if (v7)
  {
    char v14 = v7;
    if (*v7)
    {
      if (!strncmp("CommCenter", v7, 0xAuLL)) {
        _PF_Threading_Debugging_level = 0;
      }
      if (!strncmp("SpringBoard", v14, 0xBuLL)) {
        _PF_Threading_Debugging_level = 0;
      }
      if (_PF_USE_IOS_PLATFORM == 1 && !strncmp("News", v14, 4uLL)) {
        byte_1EB2706B3 = 1;
      }
      if (!strncmp("assetsd", v14, 7uLL) || !strncmp("photolibraryd", v14, 0xDuLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 1;
        byte_1EB2706B4 = 1;
      }
      if (!strncmp("xctest", v14, 6uLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 1;
        byte_1EB2706B2 = 1;
      }
      if (!strncmp("accountsd", v14, 9uLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 0;
        byte_1EB2706B4 = 1;
      }
      if (!strncmp("CalendarAgent", v14, 0xDuLL)) {
        byte_1EB2706B4 = 1;
      }
      if (!strncmp("soagent", v14, 7uLL)) {
        byte_1EB2706B4 = 1;
      }
      if (!strncmp("Music", v14, 5uLL))
      {
        byte_1EB2706B2 = 0;
        _MergedGlobals_74 = 0;
      }
      if (!strncmp("Radio", v14, 5uLL))
      {
        byte_1EB2706B2 = 0;
        _MergedGlobals_74 = 0;
      }
      if (!strncmp("Podcasts", v14, 8uLL)) {
        _MergedGlobals_74 = 0;
      }
    }
  }
  if (!byte_1EB2706B2) {
    _MergedGlobals_74 = 0;
  }
  if (_PF_Threading_Debugging_level >= 1)
  {
    _NSCoreDataLog(4, @"Core Data multi-threading assertions enabled.", v8, v9, v10, v11, v12, v13, v16);
  }
}

- (BOOL)save:(NSError *)error
{
  v65[2] = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if ((*(_WORD *)&self->_flags & 0x8080) != 0)
  {
    if (error)
    {
      v64[0] = @"message";
      v64[1] = @"stack trace";
      v65[0] = @"attempt to recursively call -save: on the context aborted";
      v65[1] = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
      int v6 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:132001 userInfo:v5];
LABEL_9:
      BOOL v8 = 0;
      *error = v6;
      return v8;
    }
    return 0;
  }
  uint64_t v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      int v6 = v7;
      goto LABEL_9;
    }
    return 0;
  }
  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  id v62 = 0;
  _managedObjectContextFlags flags = self->_flags;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  if ((v11 & 1) == 0) {
    [self->_additionalPrivateIvars[12] _isEnabled];
  }
  *(_DWORD *)&self->_flags |= 0x8000u;
  __int16 v53 = v10;
  uint64_t v54 = error;
  char v52 = (char)flags;
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
  _managedObjectContextFlags v12 = self->_flags;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSManagingContextWillSaveChangesNotification", self, 0);
    _managedObjectContextFlags v12 = self->_flags;
  }
  if (error)
  {
    _managedObjectContextFlags v12 = (_managedObjectContextFlags)(*(_DWORD *)&v12 | 4);
    self->__managedObjectContextFlags flags = v12;
    uint64_t v13 = &v62;
  }
  else
  {
    uint64_t v13 = 0;
  }
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&v12 | 0x80);
  if (!-[NSManagedObjectContext _prepareForPushChanges:]((uint64_t)self, v13))
  {
    int v41 = 0;
    int v42 = 0;
    uint64_t v55 = 0;
    int v36 = 1;
    goto LABEL_70;
  }
  ++self->_ignoreChangeNotification;
  uint64_t v55 = -[NSManagedObjectContext _newSaveRequestForCurrentState]((uint64_t)self);
  int v56 = 0;
  uint64_t v14 = 0;
  char v15 = 1;
  while ((v15 & 1) != 0)
  {
    id v62 = 0;
    if ((v56 & 1) == 0)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      int v56 = 1;
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    ++v14;
    if ([(NSManagedObjectContext *)self _allowAncillaryEntities])
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v17 = [(NSManagedObjectContext *)self persistentStoreCoordinator];
      if (v17 && (uint64_t modelMap = v17->_modelMap) != 0) {
        models = modelMap->_models;
      }
      else {
        models = 0;
      }
      uint64_t v20 = [(NSArray *)models countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v59 != v21) {
              objc_enumerationMutation(models);
            }
            if (-[NSManagedObjectModel _hasEntityWithUniquenessConstraints](*(void *)(*((void *)&v58 + 1) + 8 * i)))
            {
              int hasEntityWithUniqueness = 1;
              goto LABEL_39;
            }
          }
          uint64_t v20 = [(NSArray *)models countByEnumeratingWithState:&v58 objects:v63 count:16];
          int hasEntityWithUniqueness = 0;
          if (v20) {
            continue;
          }
          break;
        }
      }
      else
      {
        int hasEntityWithUniqueness = 0;
      }
    }
    else
    {
      int hasEntityWithUniqueness = -[NSManagedObjectModel _hasEntityWithUniquenessConstraints]((uint64_t)[(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)self persistentStoreCoordinator] managedObjectModel]);
    }
LABEL_39:
    if ([(NSMutableSet *)self->_insertedObjects count])
    {
      if (hasEntityWithUniqueness) {
        goto LABEL_46;
      }
    }
    else
    {
      if ([(NSMutableSet *)self->_changedObjects count]) {
        char v24 = hasEntityWithUniqueness;
      }
      else {
        char v24 = 0;
      }
      if (v24)
      {
LABEL_46:
        char v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_insertedObjects];
        [v25 unionSet:self->_changedObjects];
        uint64_t v26 = (void *)[v25 allObjects];

        if ((*((unsigned char *)&self->_flags + 3) & 1) == 0)
        {
          id v27 = (id)*((void *)self->_additionalPrivateIvars + 9);
          if (!v27)
          {
            id v27 = -[NSConstraintValidator initWithManagedObjectContext:]([NSConstraintValidator alloc], self);
            *((void *)self->_additionalPrivateIvars + 9) = v27;
          }
          -[NSConstraintValidator registerObjects:]((uint64_t)v27, v26);
          id v28 = (void *)-[NSConstraintValidator validateForSave]((uint64_t)v27);
          -[NSConstraintValidator reset]((uint64_t)v27);
          if (v28)
          {
            uint64_t v40 = (void *)-[NSManagedObjectContext _generateOptLockExceptionForConstraintFailure:]((uint64_t)self, v28);
            objc_exception_throw(v40);
          }
        }
      }
    }
    char v15 = 1;
    if ([self->_parentObjectStore executeRequest:v55 withContext:self error:&v62])
    {
      id parentObjectStore = self->_parentObjectStore;
      uint64_t v30 = (void *)[(NSMutableSet *)self->_insertedObjects allObjects];
      if ([v30 count])
      {
        id v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v30, "count"));
        uint64_t v32 = [v30 count];
        if (v32)
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            unint64_t v34 = (_DWORD *)[v30 objectAtIndex:j];
            uint64_t v35 = (void *)[v34 objectID];
            if (([v35 isTemporaryID] & 1) == 0)
            {
              [v31 addObject:v35];
              if (v34) {
                v34[4] |= 0x200u;
              }
            }
          }
        }
        objc_msgSend(parentObjectStore, "managedObjectContextDidRegisterObjectsWithIDs:generation:", v31, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
      }
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      int v56 = 0;
      int v36 = 0;
      char v15 = 0;
    }
    else
    {
      int v36 = 1;
    }
    id v37 = v62;
    [v16 drain];
    id v38 = 0;
    id v39 = v62;
    if ((v36 | 8) == 8) {
      int v36 = 0;
    }
    if (v36) {
      goto LABEL_69;
    }
  }
  int v36 = 0;
LABEL_69:
  int v41 = v56;
  int v42 = 1;
LABEL_70:
  id v43 = v62;

  [v53 drain];
  if (v62)
  {
    id v44 = v62;
    if (v54) {
      *uint64_t v54 = (NSError *)v62;
    }
  }
  if (v41) {
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  }
  _managedObjectContextFlags v45 = self->_flags;
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&v45 & 0xFDFF7F77);
  if (v42) {
    --self->_ignoreChangeNotification;
  }
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&v45 & 0xFDFF7F73 | v52 & 4);
  BOOL v8 = v36 == 0;
  if (!v36)
  {
    id v46 = v62;
    id v47 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    -[NSManagedObjectContext _didSaveChanges]((uint64_t)self);
    if ((*((unsigned char *)&self->_flags + 3) & 4) != 0) {
      [(NSManagedObjectContext *)self refreshAllObjects];
    }
    [v47 drain];
    -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
    id v48 = v62;
    uint64_t v49 = (NSQueryGenerationToken *)*((void *)self->_additionalPrivateIvars + 12);
    if ([(NSQueryGenerationToken *)v49 _isEnabled]
      && v49 != +[NSQueryGenerationToken currentQueryGenerationToken])
    {
      uint64_t v50 = v49;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __31__NSManagedObjectContext_save___block_invoke;
      v57[3] = &unk_1E544B778;
      v57[4] = self;
      v57[5] = v49;
      +[_PFAutoreleasePoolThunk thunkWithBlock:]((uint64_t)_PFAutoreleasePoolThunk, v57);
    }
    if (self->_dispatchQueue) {
      -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)self);
    }
  }
  return v8;
}

- (BOOL)_allowAncillaryEntities
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (uint64_t)_prepareForPushChanges:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  [(id)a1 discardEditing];
  unsigned int v4 = *(_DWORD *)(a1 + 40);
  if (((v4 >> 1) & 1) == 0) {
    *(_DWORD *)(a1 + 40) = v4 | 2;
  }
  int v5 = (v4 >> 1) & 1;
  if ((-[NSManagedObjectContext _processRecentChanges:](a1, a2) & 1) == 0)
  {
    uint64_t v14 = 0;
    *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFFFDF5 | (2 * v5);
    return v14;
  }
  [*(id *)(*(void *)(a1 + 168) + 40) disableUndoRegistration];
  int v6 = 0;
  int v7 = 1;
  while (!v6 || -[NSManagedObjectContext _processRecentChanges:](a1, a2))
  {
    unsigned int v8 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = v8 | 8;
    int v9 = (v8 >> 2) & 1;
    id v16 = 0;
    if (-[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)a1, *(void **)(a1 + 88), 2, (uint64_t *)&v16, v9, 1))
    {
      int v10 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)a1, *(void **)(a1 + 80), 0, (uint64_t *)&v16, (v8 >> 2) & 1, 1);
      if ((v8 & 4) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
      int v10 = 0;
      if ((v8 & 4) == 0)
      {
LABEL_12:
        if (!v10) {
          goto LABEL_20;
        }
      }
    }
    if ([*(id *)(a1 + 96) count])
    {
      if ([*(id *)(a1 + 88) count] || objc_msgSend(*(id *)(a1 + 80), "count"))
      {
        unsigned __int8 v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(a1 + 96)];
        [v11 minusSet:*(void *)(a1 + 88)];
        [v11 minusSet:*(void *)(a1 + 80)];
      }
      else
      {
        unsigned __int8 v11 = *(void **)(a1 + 96);
        id v13 = v11;
      }
      if (v10) {
        int v10 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)a1, v11, 1, (uint64_t *)&v16, v9, 1);
      }
    }
LABEL_20:
    if (a2 && (v10 & 1) == 0) {
      *a2 = v16;
    }
    if (!v10) {
      break;
    }
    int v12 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = v12 & 0xFFFFFDFF | ((v7 == 998) << 9);
    if (v7 == 1000) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"Failed to process pending changes before save.  The context is still dirty after 1000 attempts.  Typically this recursive dirtying is caused by a bad validation method, -willSave, or notification handler.", 0 reason userInfo]);
    }
    *(_DWORD *)(a1 + 40) = v12 & 0xFFFFFDF7 | ((v7 == 998) << 9);
    --v6;
    ++v7;
    if ((v12 & 0x100) == 0)
    {
      uint64_t v14 = 1;
      goto LABEL_30;
    }
  }
  uint64_t v14 = 0;
LABEL_30:
  [*(id *)(*(void *)(a1 + 168) + 40) enableUndoRegistration];
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFFFDF5 | (2 * v5);
  return v14;
}

- (uint64_t)_validateObjects:(int)a3 forOperation:(uint64_t *)a4 error:(int)a5 exhaustive:(int)a6 forSave:
{
  int v117 = a6;
  int v122 = a5;
  uint64_t v119 = a4;
  int v126 = a3;
  long long v139 = (int *)a1;
  v156[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a2 count];
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  if (v7 >= 0x201) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  int v10 = &v116[-((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v128 = v7;
  id v120 = a2;
  if (v7 >= 0x201)
  {
    BOOL v127 = NSAllocateScannedUncollectable();
    objc_msgSend(a2, "getObjects:");
    goto LABEL_12;
  }
  bzero(&v116[-((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0)], 8 * v8);
  BOOL v127 = v10;
  [a2 getObjects:v10];
  if (v128)
  {
LABEL_12:
    id v124 = 0;
    uint64_t v14 = 0;
    int v12 = v139 + 10;
    uint64_t v121 = *MEMORY[0x1E4F281F8];
    CFSetCallBacks v118 = @"NSDetailedErrors";
    long long v135 = @"NSValidationErrorKey";
    int v123 = 1;
    while (1)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      long long v138 = (void *)v127[v14];
      v152[0] = 0;
      uint64_t v129 = v14;
      id v130 = v15;
      if (v126 == 2)
      {
        int v125 = [v138 validateForDelete:v152];
      }
      else
      {
        if (v126 != 1)
        {
          if (v126) {
            goto LABEL_20;
          }
          char v16 = [v138 validateForInsert:v152];
          goto LABEL_21;
        }
        int v125 = [v138 validateForUpdate:v152];
      }
      if (v125) {
        goto LABEL_20;
      }
      unint64_t v25 = objc_msgSend((id)objc_msgSend(v139, "mergePolicy"), "mergeType");
      char v16 = 0;
      if (v25 > 4 || ((1 << v25) & 0x16) == 0) {
        goto LABEL_21;
      }
      if ((-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v139, (uint64_t)v138) & 1) == 0)
      {
        *v12 |= 0x1000u;
        if (v152[0]) {
          uint64_t v29 = (__CFString *)v152[0];
        }
        else {
          uint64_t v29 = @"null";
        }
        [v152[0] userInfo];
        [v138 objectID];
        _NSCoreDataLog(4, @"repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
        if (![v138 managedObjectContext]) {
          -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v139, v138);
        }
        [v139 deleteObject:v138];
        -[NSManagedObject _propagateDelete:](v138, 3);
        *v12 &= ~0x1000u;
        v152[0] = 0;
        char v16 = 1;
        goto LABEL_21;
      }
      if (objc_msgSend((id)objc_msgSend(v152[0], "userInfo"), "objectForKey:", @"NSValidationErrorShouldAttemptRecoveryKey"))
      {
        uint64_t v26 = (void *)[v152[0] domain];
        if ([v26 isEqualToString:v121] && objc_msgSend(v152[0], "code") == 1560)
        {
          id v27 = (void *)[v152[0] userInfo];
          id v28 = (void *)[v27 objectForKey:v118];
        }
        else
        {
          v156[0] = v152[0];
          id v28 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:1];
        }
        int v36 = v28;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        uint64_t v37 = [v28 countByEnumeratingWithState:&v148 objects:v155 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v149;
          uint64_t v131 = *(void *)v149;
          BOOL v132 = v36;
          do
          {
            uint64_t v39 = 0;
            uint64_t v133 = v37;
            do
            {
              if (*(void *)v149 != v38) {
                objc_enumerationMutation(v36);
              }
              uint64_t v40 = (void *)[*(id *)(*((void *)&v148 + 1) + 8 * v39) userInfo];
              _NSCoreDataLog(2, @"checkpoint attempting validation failure recovery with error %@", v41, v42, v43, v44, v45, v46, (uint64_t)v40);
              uint64_t v47 = [v40 objectForKey:v135];
              id v48 = -[NSEntityDescription _relationshipNamed:]((void *)[v138 entity], v47);
              uint64_t v49 = v48;
              if (v48 && ([v48 isToMany] & 1) == 0)
              {
                uint64_t v68 = [v49 name];
                char v69 = (void *)[v138 valueForKey:v68];
                if ([v69 isFault]
                  && (-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v139, (uint64_t)v69) & 1) == 0)
                {
                  *v12 |= 0x1000u;
                  if (v152[0]) {
                    id v70 = (__CFString *)v152[0];
                  }
                  else {
                    id v70 = @"null";
                  }
                  [v152[0] userInfo];
                  [v69 objectID];
                  _NSCoreDataLog(4, @"repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it", v71, v72, v73, v74, v75, v76, (uint64_t)v70);
                  if (![v69 managedObjectContext]) {
                    -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v139, v69);
                  }
                  [v139 deleteObject:v69];
                  -[NSManagedObject _propagateDelete:](v69, 3);
                  *v12 &= ~0x1000u;
                }
              }
              else if ([v49 isToMany])
              {
                int v137 = [v49 isOrdered];
                uint64_t v50 = [v49 name];
                uint64_t v51 = (void *)[v138 valueForKey:v50];
                if ([v51 count])
                {
                  char v52 = (void *)[v51 copy];
                  id v136 = v49;
                  uint64_t v134 = v39;
                  long long v146 = 0u;
                  long long v147 = 0u;
                  long long v144 = 0u;
                  long long v145 = 0u;
                  uint64_t v53 = [v52 countByEnumeratingWithState:&v144 objects:v154 count:16];
                  if (v53)
                  {
                    uint64_t v54 = 0;
                    uint64_t v55 = *(void *)v145;
                    do
                    {
                      for (uint64_t i = 0; i != v53; ++i)
                      {
                        if (*(void *)v145 != v55) {
                          objc_enumerationMutation(v52);
                        }
                        uint64_t v57 = *(void **)(*((void *)&v144 + 1) + 8 * i);
                        if ([v57 isFault]
                          && (-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v139, (uint64_t)v57) & 1) == 0)
                        {
                          *v12 |= 0x1000u;
                          if (v152[0]) {
                            long long v58 = (__CFString *)v152[0];
                          }
                          else {
                            long long v58 = @"null";
                          }
                          [v152[0] userInfo];
                          [v57 objectID];
                          _NSCoreDataLog(4, @"repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it", v59, v60, v61, v62, v63, v64, (uint64_t)v58);
                          if (![v57 managedObjectContext]) {
                            -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v139, v57);
                          }
                          [v139 deleteObject:v57];
                          if (!v54)
                          {
                            if (v137)
                            {
                              uint64_t v65 = [v136 name];
                              uint64_t v66 = [v138 mutableOrderedSetValueForKey:v65];
                            }
                            else
                            {
                              uint64_t v67 = [v136 name];
                              uint64_t v66 = [v138 mutableSetValueForKey:v67];
                            }
                            uint64_t v54 = (void *)v66;
                          }
                          [v54 removeObject:v57];
                          -[NSManagedObject _propagateDelete:](v57, 3);
                          *v12 &= ~0x1000u;
                        }
                      }
                      uint64_t v53 = [v52 countByEnumeratingWithState:&v144 objects:v154 count:16];
                    }
                    while (v53);
                  }

                  uint64_t v38 = v131;
                  int v36 = v132;
                  uint64_t v37 = v133;
                  uint64_t v39 = v134;
                }
              }
              ++v39;
            }
            while (v39 != v37);
            uint64_t v37 = [v36 countByEnumeratingWithState:&v148 objects:v155 count:16];
          }
          while (v37);
        }
      }
      v152[0] = 0;
      if (v126 == 2)
      {
        int v125 = [v138 validateForDelete:v152];
      }
      else
      {
        if (v126 != 1) {
          goto LABEL_20;
        }
        int v125 = [v138 validateForUpdate:v152];
      }
      if (v125)
      {
LABEL_20:
        char v16 = 1;
        goto LABEL_21;
      }
      long long v77 = (void *)[v152[0] domain];
      if ([v77 isEqualToString:v121] && objc_msgSend(v152[0], "code") == 1560)
      {
        id v78 = v152[0];
        [v152[0] userInfo];
        _NSCoreDataLog(2, @"validation recovery attempt FAILED with multiple errors %@ and %@.", v79, v80, v81, v82, v83, v84, (uint64_t)v78);
        long long v85 = (void *)[v152[0] userInfo];
        long long v86 = (void *)[v85 objectForKey:v118];
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        uint64_t v87 = [v86 countByEnumeratingWithState:&v140 objects:v153 count:16];
        if (v87)
        {
          uint64_t v88 = *(void *)v141;
          do
          {
            for (uint64_t j = 0; j != v87; ++j)
            {
              if (*(void *)v141 != v88) {
                objc_enumerationMutation(v86);
              }
              long long v90 = *(void **)(*((void *)&v140 + 1) + 8 * j);
              [v90 userInfo];
              _NSCoreDataLog(2, @"validation recovery attempt FAILED with %@ and %@.", v91, v92, v93, v94, v95, v96, (uint64_t)v90);
            }
            uint64_t v87 = [v86 countByEnumeratingWithState:&v140 objects:v153 count:16];
            char v16 = 0;
          }
          while (v87);
          goto LABEL_21;
        }
      }
      else
      {
        id v97 = v152[0];
        [v152[0] userInfo];
        _NSCoreDataLog(2, @"validation recovery attempt FAILED with %@ and %@.", v98, v99, v100, v101, v102, v103, (uint64_t)v97);
      }
      char v16 = 0;
LABEL_21:
      id v17 = v152[0];
      [v130 drain];
      id v18 = v152[0];
      id v19 = 0;
      if (v16)
      {
        uint64_t v20 = v129;
      }
      else
      {
        uint64_t v20 = v129;
        if (!v124)
        {
          id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
          id v124 = (id)objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v120, "count"));
        }
        id v19 = v152[0];
        if (v152[0])
        {
          uint64_t v22 = (void *)[v152[0] domain];
          if ([v22 isEqual:v121] && objc_msgSend(v152[0], "code") == 1560)
          {
            uint64_t v23 = (void *)[v152[0] userInfo];
            uint64_t v24 = [v23 objectForKey:v118];
            id v19 = (id)[v124 addObjectsFromArray:v24];
          }
          else
          {
            id v19 = (id)[v124 addObject:v152[0]];
          }
        }
        if ((v122 & 1) == 0) {
          goto LABEL_113;
        }
        int v123 = 0;
      }
      uint64_t v14 = v20 + 1;
      if (v14 == v128)
      {
        if (v123)
        {
          if ((v117 & 1) == 0) {
            goto LABEL_112;
          }
          uint64_t v104 = 0;
          unsigned int v11 = *v12;
          *v12 |= 8u;
          do
          {
            uint64_t v105 = (void *)MEMORY[0x18C127630](v19);
            [(id)v127[v104] willSave];
            ++v104;
          }
          while (v128 != v104);
          int v13 = *v12;
          goto LABEL_111;
        }
LABEL_113:
        if ([v124 count] == 1)
        {
          if (v119)
          {
            uint64_t v107 = [v124 objectAtIndex:0];
            uint64_t v106 = 0;
            *uint64_t v119 = v107;
            goto LABEL_121;
          }
        }
        else
        {
          BOOL v108 = v119 != 0;
          unint64_t v109 = [v124 count];
          char v110 = !v108;
          if (v109 < 2) {
            char v110 = 1;
          }
          if ((v110 & 1) == 0)
          {
            id v111 = objc_alloc(MEMORY[0x1E4F1C9E8]);
            long long v112 = objc_msgSend(v111, "initWithObjectsAndKeys:", v124, v118, 0);
            uint64_t v113 = [MEMORY[0x1E4F28C58] errorWithDomain:v121 code:1560 userInfo:v112];
            *uint64_t v119 = v113;
          }
        }
        uint64_t v106 = 0;
LABEL_121:
        BOOL v114 = v128 < 0x201;

        if (!v114) {
          NSZoneFree(0, v127);
        }
        return v106;
      }
    }
  }
  if (v117)
  {
    id v124 = 0;
    int v12 = v139 + 10;
    unsigned int v11 = v139[10];
    int v13 = v11 | 8;
    v139[10] = v11 | 8;
LABEL_111:
    *int v12 = v13 & 0xFFFFFFF7 | (8 * ((v11 >> 3) & 1));
LABEL_112:
    uint64_t v106 = 1;
    goto LABEL_121;
  }
  return 1;
}

- (NSSaveChangesRequest)_newSaveRequestForCurrentState
{
  if (!a1) {
    return 0;
  }
  if ([*(id *)(a1 + 80) count]) {
    uint64_t v2 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v2 = 0;
  }
  if ([*(id *)(a1 + 96) count]) {
    uint64_t v3 = *(void *)(a1 + 96);
  }
  else {
    uint64_t v3 = 0;
  }
  if ([*(id *)(a1 + 88) count]) {
    uint64_t v4 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v4 = 0;
  }
  if ([*(id *)(a1 + 104) count])
  {
    int v5 = -[NSManagedObjectContext _newUnchangedLockedObjects](a1);
    if ([v5 count]) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
    int v5 = 0;
  }
  unint64_t v7 = [[NSSaveChangesRequest alloc] initWithInsertedObjects:v2 updatedObjects:v3 deletedObjects:v4 lockedObjects:v6];
  uint64_t v8 = v7;
  if ((*(unsigned char *)(a1 + 43) & 2) != 0) {
    [(NSSaveChangesRequest *)v7 _setSecureOperation:1];
  }
  if (v5) {

  }
  return v8;
}

- (NSManagedObject)objectWithID:(NSManagedObjectID *)objectID
{
  uint64_t v3 = objectID;
  if (!_PF_Threading_Debugging_level)
  {
    if (objectID) {
      goto LABEL_3;
    }
LABEL_16:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil is not a valid object ID" userInfo:0]);
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!v3) {
    goto LABEL_16;
  }
LABEL_3:
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
  if ((v5 & 1) == 0) {
    return (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, v3, 0, 1);
  }
  id Value = [(NSManagedObjectContext *)self objectRegisteredForID:v3];
  if (!Value)
  {
    if ([(NSManagedObjectID *)v3 isTemporaryID])
    {
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x3052000000;
      char v16 = __Block_byref_object_copy__12;
      id v17 = __Block_byref_object_dispose__12;
      uint64_t v18 = 0;
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      id parentObjectStore = self->_parentObjectStore;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __39__NSManagedObjectContext_objectWithID___block_invoke;
      v12[3] = &unk_1E544C3C8;
      v12[5] = v3;
      v12[6] = &v13;
      v12[4] = self;
      _perform((unint64_t)parentObjectStore, (uint64_t)v12);
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      if (v14[5]) {
        uint64_t v3 = (NSManagedObjectID *)v14[5];
      }
      goto LABEL_12;
    }
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3052000000;
    char v16 = __Block_byref_object_copy__12;
    id v17 = __Block_byref_object_dispose__12;
    uint64_t v18 = 0;
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    id v8 = self->_parentObjectStore;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__NSManagedObjectContext_objectWithID___block_invoke_2;
    v11[3] = &unk_1E544C3C8;
    v11[5] = v3;
    v11[6] = &v13;
    v11[4] = self;
    _perform((unint64_t)v8, (uint64_t)v11);
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
    uint64_t v9 = (void *)v14[5];
    if (!v9 || (id Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v9)) == 0)
    {
LABEL_12:
      _Block_object_dispose(&v13, 8);
      return (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, v3, 0, 1);
    }
    _Block_object_dispose(&v13, 8);
  }
  return Value;
}

- (void)setParentContext:(NSManagedObjectContext *)parentContext
{
  if (!parentContext)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    int v6 = @"Parent NSManagedObjectContext must not be nil.";
    goto LABEL_16;
  }
  id parentObjectStore = (NSManagedObjectContext *)self->_parentObjectStore;
  if (parentObjectStore == parentContext) {
    return;
  }
  if (parentObjectStore)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    int v6 = @"Context already has a coordinator;  cannot replace.";
    goto LABEL_16;
  }
  if (!parentContext->_dispatchQueue)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    int v6 = @"Parent NSManagedObjectContext must use either NSPrivateQueueConcurrencyType or NSMainQueueConcurrencyType.";
LABEL_16:
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
  }
  if (self->_dispatchQueue)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__NSManagedObjectContext_setParentContext___block_invoke;
    v9[3] = &unk_1E544B778;
    v9[4] = self;
    void v9[5] = parentContext;
    [(NSManagedObjectContext *)self performBlockAndWait:v9];
  }
  else
  {
    if (_PF_Threading_Debugging_level)
    {
      unint64_t v7 = parentContext;
      id v8 = self;
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
      parentContext = v7;
      self = v8;
    }
    -[NSManagedObjectContext _setParentContext:]((unsigned __int8 *)self, parentContext);
  }
}

- (BOOL)_setChangeTrackingTokenFromToken:(id)a3 error:(id *)a4
{
  if (self->_parentObjectStore)
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if (v4) {
      return 0;
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke;
  v6[3] = &unk_1E544B778;
  v6[4] = a3;
  v6[5] = self;
  if (self->_dispatchQueue) {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6, a4);
  }
  else {
    __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke((uint64_t)v6);
  }
  return 1;
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      -[NSManagedObjectContext _coreMergeChangesFromDidSaveDictionary:usingObjectIDs:withClientQueryGeneration:]((uint64_t)v3, *(void **)(a1 + 40), 1, v4);
    }
    else {
      [v3 _mergeChangesFromDidSaveDictionary:*(void *)(a1 + 40) usingObjectIDs:1];
    }
  }
  [v2 drain];
  uint64_t v5 = *(void *)(a1 + 32);

  -[NSManagedObjectContext _processReferenceQueue:](v5, 0);
}

- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4
{
}

- (void)refreshAllObjects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v4 = [(NSManagedObjectContext *)self registeredObjects];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSManagedObjectContext refreshObject:mergeChanges:](self, "refreshObject:mergeChanges:", *(void *)(*((void *)&v9 + 1) + 8 * v8), [*(id *)(*((void *)&v9 + 1) + 8 * v8) hasChanges]);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(NSManagedObjectContext *)self processPendingChanges];
  [v3 drain];
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
}

- (void)_coreMergeChangesFromDidSaveDictionary:(int)a3 usingObjectIDs:(uint64_t)a4 withClientQueryGeneration:
{
  int v153 = a3;
  id v150 = a2;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__coreMergeChangesFromDidSaveDictionary_usingObjectIDs_withClientQueryGeneration_);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = [v150 objectForKey:@"managedObjectContext"];
  if (!v7) {
    goto LABEL_11;
  }
  Weauint64_t k = objc_loadWeak((id *)(v7 + 8));
  if (!Weak)
  {
    long long v9 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    long long v9 = 0;
    Weauint64_t k = 0;
    goto LABEL_12;
  }
  long long v9 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v10 = Weak;
  do
  {
    [v9 addObject:v10];
    long long v10 = (void *)[v10 parentContext];
  }
  while (v10);
LABEL_12:
  if (Weak == (id)a1 || v9 && [v9 containsObject:a1])
  {
    [v6 drain];
    return;
  }
  long long v11 = (void *)[v150 objectForKey:@"newQueryGeneration"];
  if ([v11 _isEnabled]) {
    long long v12 = v11;
  }
  else {
    long long v12 = 0;
  }
  id v142 = (id)[(id)a1 _queryGenerationToken];
  if (!a4 && [v142 _isEnabled]) {
    objc_msgSend((id)a1, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0);
  }
  uint64_t v13 = (void *)[v150 objectForKey:@"inserted"];
  uint64_t v14 = (void *)[v150 objectForKey:@"inserted_objectIDs"];
  uint64_t v15 = [v13 count];
  char v16 = v14;
  uint64_t v17 = [v14 count];
  long long v138 = &v128;
  uint64_t v135 = v17;
  uint64_t v136 = v15;
  unint64_t v18 = v17 + v15;
  if ((unint64_t)(v17 + v15) <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v17 + v15;
  }
  if (v18 >= 0x201) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  size_t v152 = v17 + v15;
  id v140 = v6;
  if (v18 > 0x200)
  {
    long long v147 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    long long v147 = (char *)&v128 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v147, 8 * v19);
  }
  id v21 = v150;
  uint64_t v22 = (void *)[v150 objectForKey:@"updated"];
  uint64_t v23 = (void *)[v21 objectForKey:@"updated_objectIDs"];
  uint64_t v24 = v22;
  uint64_t v25 = [v22 count];
  id v132 = v23;
  uint64_t v26 = [v23 count];
  uint64_t v134 = v25;
  uint64_t v133 = v26;
  unint64_t v27 = v26 + v25;
  if ((unint64_t)(v26 + v25) <= 1) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = v26 + v25;
  }
  if (v27 >= 0x201) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = v28;
  }
  unint64_t v148 = v26 + v25;
  if (v27 > 0x200)
  {
    long long v146 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    long long v146 = (char *)&v128 - ((8 * v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v146, 8 * v28);
  }
  id v30 = v150;
  uint64_t v31 = (void *)[v150 objectForKey:@"deleted"];
  uint64_t v32 = (void *)[v30 objectForKey:@"deleted_objectIDs"];
  uint64_t v33 = [v31 count];
  id v131 = v32;
  uint64_t v34 = [v32 count];
  unint64_t v35 = v34 + v33;
  if ((unint64_t)(v34 + v33) <= 1) {
    uint64_t v36 = 1;
  }
  else {
    uint64_t v36 = v34 + v33;
  }
  if (v35 >= 0x201) {
    uint64_t v37 = 1;
  }
  else {
    uint64_t v37 = v36;
  }
  unint64_t v145 = v34 + v33;
  uint64_t v129 = v12;
  if (v35 > 0x200)
  {
    long long v144 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    long long v144 = (char *)&v128 - ((8 * v37 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v144, 8 * v36);
  }
  size_t v38 = v148;
  if (v145 > v148) {
    size_t v38 = v145;
  }
  if (v38 <= v152) {
    unint64_t v39 = v152;
  }
  else {
    unint64_t v39 = v38;
  }
  if (v39 <= 1) {
    uint64_t v40 = 1;
  }
  else {
    uint64_t v40 = v39;
  }
  if (v39 >= 0x201) {
    uint64_t v41 = 1;
  }
  else {
    uint64_t v41 = v40;
  }
  uint64_t v42 = (char *)&v128 - ((8 * v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v139 = v39;
  if (v39 > 0x200) {
    uint64_t v42 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v128 - ((8 * v41 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v40);
  }
  unint64_t v43 = v148 + v152;
  if (v148 + v152 <= 1) {
    uint64_t v44 = 1;
  }
  else {
    uint64_t v44 = v148 + v152;
  }
  if (v43 >= 0x201) {
    uint64_t v45 = 1;
  }
  else {
    uint64_t v45 = v44;
  }
  size_t v143 = v148 + v152;
  if (v43 > 0x200)
  {
    long long v151 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    long long v151 = (char *)&v128 - ((8 * v45 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v151, 8 * v44);
  }
  long long v149 = (unsigned __int8 *)malloc_type_calloc(1uLL, v143, 0x100004077774924uLL);
  int v141 = *(_DWORD *)(a1 + 40) & 0x40000;
  uint64_t v128 = a4;
  uint64_t v46 = (void *)[(id)a1 persistentStoreCoordinator];
  *(_DWORD *)(a1 + 40) |= 0x41000u;
  id v130 = v31;
  if (v152)
  {
    uint64_t v47 = [v13 count];
    id v48 = v13;
    unint64_t v49 = v47;
    uint64_t v50 = v24;
    [v48 getObjects:v42];
    [v16 getObjects:&v42[8 * v49]];
    unint64_t v51 = 0;
    while (1)
    {
      char v52 = *(void **)&v42[8 * v51];
      if ((v153 & 1) == 0 && v51 < v49) {
        char v52 = (void *)[*(id *)&v42[8 * v51] objectID];
      }
      if (([v52 _isPersistentStoreAlive] & 1) == 0
        && ([v52 isTemporaryID] & 1) == 0
        && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v52, "_storeIdentifier")))
      {
        break;
      }
      id v53 = (id)[(id)a1 objectWithID:v52];
      uint64_t v54 = (uint64_t)v53;
      *(void *)&v147[8 * v51] = v53;
      if (v53)
      {
        if (([v53 hasChanges] & 1) != 0
          || (uint64_t v55 = *(void **)(v54 + 48)) != 0 && (uint64_t v55 = (void *)*v55) != 0)
        {
          if ((*(unsigned char *)(v54 + 16) & 0x24) != 0)
          {
            [*(id *)(a1 + 64) removeObject:v54];
            [*(id *)(a1 + 88) removeObject:v54];
            *(_DWORD *)(v54 + 16) &= 0xFFFFFFDB;
          }
          int v56 = **(void ***)(a1 + 168);
          if (v56) {
            objc_msgSend(v56, "removeObject:", objc_msgSend((id)v54, "objectID"));
          }
          LOBYTE(v55) = 1;
        }
      }
      else
      {
        LOBYTE(v55) = 0;
      }
      v149[v51] = v55;
      if ([(id)v54 isFault]) {
        refreshed = 0;
      }
      else {
        refreshed = -[NSManagedObject _newChangedValuesForRefresh__](v54);
      }
      if (![(NSKnownKeysDictionary *)refreshed count])
      {

        refreshed = 0;
      }
      *(void *)&v151[8 * v51++] = refreshed;
      if (v152 == v51)
      {
        id v58 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        id v137 = (id)[v58 initWithObjects:v147 count:v152];
        goto LABEL_100;
      }
    }
    id v109 = 0;
  }
  else
  {
    id v137 = 0;
    uint64_t v50 = v24;
LABEL_100:
    if (v148)
    {
      unint64_t v59 = [v50 count];
      [v50 getObjects:v42];
      [v132 getObjects:&v42[8 * v59]];
      unint64_t v60 = 0;
      uint64_t v61 = (char *)&v149[v152];
      while (1)
      {
        uint64_t v62 = *(void **)&v42[8 * v60];
        if ((v153 & 1) == 0 && v60 < v59) {
          uint64_t v62 = (void *)[*(id *)&v42[8 * v60] objectID];
        }
        if (([v62 _isPersistentStoreAlive] & 1) == 0
          && ([v62 isTemporaryID] & 1) == 0
          && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v62, "_storeIdentifier")))
        {
          break;
        }
        uint64_t v63 = (NSKnownKeysDictionary *)(id)[(id)a1 objectRegisteredForID:v62];
        uint64_t v64 = v63;
        if (v63)
        {
          if ([(NSKnownKeysDictionary *)v63 hasChanges])
          {
            LOBYTE(isa) = 1;
          }
          else
          {
            isa = v64[6].super.super.super.isa;
            if (isa) {
              LOBYTE(isa) = *isa != 0;
            }
          }
          *(void *)&v146[8 * v60] = v64;
          v61[v60] = (char)isa;
          char v67 = [(NSKnownKeysDictionary *)v64 isFault];
          unint64_t v66 = v152 + v60;
          if (v67) {
            uint64_t v64 = 0;
          }
          else {
            uint64_t v64 = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)v64);
          }
        }
        else
        {
          *(void *)&v146[8 * v60] = 0;
          unint64_t v66 = v60 + v152;
          v61[v60] = 0;
        }
        if (![(NSKnownKeysDictionary *)v64 count])
        {

          uint64_t v64 = 0;
        }
        *(void *)&v151[8 * v66] = v64;
        if (v148 == ++v60) {
          goto LABEL_120;
        }
      }
    }
    else
    {
LABEL_120:
      if (!v145)
      {
LABEL_136:
        if (v152)
        {
          uint64_t v75 = (uint64_t *)v147;
          uint64_t v76 = v149;
          long long v77 = (void **)v151;
          size_t v78 = v152;
          do
          {
            int v79 = *v76;
            uint64_t v80 = *v77;
            if (*v75)
            {
              if (v80) {
                uint64_t v81 = (NSKnownKeysDictionary *)*v77;
              }
              else {
                uint64_t v81 = (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
              }
              int v82 = -[NSManagedObjectContext _mergeRefreshObject:mergeChanges:withPersistentSnapshot:](a1, *v75, v79 != 0, v81);
            }
            else
            {
              int v82 = 0;
            }

            *v77++ = 0;
            unsigned __int8 v83 = v79 | 2;
            if (!v82) {
              unsigned __int8 v83 = v79;
            }
            *v76++ = v83;
            ++v75;
            --v78;
          }
          while (v78);
        }
        if (v152 < v143)
        {
          uint64_t v84 = v133 + v134;
          long long v85 = (void **)&v151[8 * v152];
          long long v86 = &v149[v136 + v135];
          uint64_t v87 = (uint64_t *)v146;
          do
          {
            int v88 = *v86;
            long long v89 = *v85;
            if (*v87)
            {
              if (v89) {
                long long v90 = (NSKnownKeysDictionary *)*v85;
              }
              else {
                long long v90 = (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
              }
              int v91 = -[NSManagedObjectContext _mergeRefreshObject:mergeChanges:withPersistentSnapshot:](a1, *v87, v88 != 0, v90);
            }
            else
            {
              int v91 = 0;
            }

            *v85++ = 0;
            unsigned __int8 v92 = v88 | 2;
            if (!v91) {
              unsigned __int8 v92 = v88;
            }
            *v86++ = v92;
            ++v87;
            --v84;
          }
          while (v84);
        }
        if (v152)
        {
          uint64_t v93 = (void **)v147;
          uint64_t v94 = (char *)v149;
          size_t v95 = v152;
          do
          {
            char v97 = *v94++;
            char v96 = v97;
            int v98 = v97 & 2;
            if (*v93) {
              BOOL v99 = v98 == 0;
            }
            else {
              BOOL v99 = 1;
            }
            if (!v99) {
              -[NSManagedObjectContext _mergeRefreshEpilogueForObject:mergeChanges:](a1, *v93, v96 & 1);
            }
            ++v93;
            --v95;
          }
          while (v95);
        }
        if (v152 < v143)
        {
          uint64_t v100 = v133 + v134;
          uint64_t v101 = (char *)&v149[v136 + v135];
          uint64_t v102 = (void **)v146;
          do
          {
            char v104 = *v101++;
            char v103 = v104;
            int v105 = v104 & 2;
            if (*v102) {
              BOOL v106 = v105 == 0;
            }
            else {
              BOOL v106 = 1;
            }
            if (!v106) {
              -[NSManagedObjectContext _mergeRefreshEpilogueForObject:mergeChanges:](a1, *v102, v103 & 1);
            }
            ++v102;
            --v100;
          }
          while (v100);
        }
        int v107 = 1;
        char v108 = 0;
        *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFBEFFF | v141;
        goto LABEL_178;
      }
      id v68 = v130;
      unint64_t v69 = [v130 count];
      [v68 getObjects:v42];
      [v131 getObjects:&v42[8 * v69]];
      unint64_t v70 = 0;
      while (1)
      {
        uint64_t v71 = *(void **)&v42[8 * v70];
        if ((v153 & 1) == 0 && v70 < v69) {
          uint64_t v71 = (void *)[*(id *)&v42[8 * v70] objectID];
        }
        if (([v71 _isPersistentStoreAlive] & 1) == 0
          && ([v71 isTemporaryID] & 1) == 0
          && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v71, "_storeIdentifier")))
        {
          break;
        }
        if (v71)
        {
          uint64_t v72 = **(void ***)(a1 + 168);
          if (!v72)
          {
            **(void **)(a1 + 168) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            uint64_t v72 = **(void ***)(a1 + 168);
          }
          [v72 addObject:v71];
        }
        uint64_t v73 = (id)[(id)a1 objectRegisteredForID:v71];
        uint64_t v74 = v73;
        if (v73 && (v73[16] & 0x20) == 0) {
          [(id)a1 deleteObject:v73];
        }
        *(void *)&v144[8 * v70++] = v74;
        if (v145 == v70) {
          goto LABEL_136;
        }
      }
    }
    id v109 = v137;
  }
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFBEFFF | v141;

  int v107 = 0;
  id v137 = 0;
  char v108 = 1;
LABEL_178:
  if ((uint64_t)v143 >= 1)
  {
    char v110 = (id *)v151;
    size_t v111 = v143;
    do
    {
      if (*v110) {

      }
      ++v110;
      --v111;
    }
    while (v111);
  }
  long long v112 = v140;
  if (v143 >= 0x201) {
    NSZoneFree(0, v151);
  }
  if (v145 >= 0x201) {
    NSZoneFree(0, v144);
  }
  if (v152 >= 0x201) {
    NSZoneFree(0, v147);
  }
  if (v148 >= 0x201) {
    NSZoneFree(0, v146);
  }
  if (v139 >= 0x201) {
    NSZoneFree(0, v42);
  }
  if (v149) {
    free(v149);
  }
  if (v112) {
    [v112 drain];
  }
  if (v107)
  {
    if ((v108 & 1) == 0)
    {
      id v113 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      if (v137)
      {
        id v114 = *(id *)(*(void *)(a1 + 168) + 88);
        if (!v114)
        {
          id v114 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          *(void *)(*(void *)(a1 + 168) + 88) = v114;
        }
        [v114 unionSet:v137];
        id v115 = v137;
      }
      id v116 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v117 = v116;
      if (v129) {
        [v116 setObject:v129 forKey:@"newQueryGeneration"];
      }
      for (uint64_t i = 0; i != 5; ++i)
      {
        uint64_t v119 = (void *)[v150 objectForKey:off_1E544C460[i]];
        id v120 = off_1E544C488[i];
        uint64_t v121 = (void *)[v150 objectForKey:v120];
        if ([v119 count] || objc_msgSend(v121, "count"))
        {
          if (v119) {
            int v122 = v119;
          }
          else {
            int v122 = NSSet_EmptySet;
          }
          if (v121) {
            int v123 = v121;
          }
          else {
            int v123 = NSSet_EmptySet;
          }
          if (v153) {
            id v124 = v122;
          }
          else {
            id v124 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v122);
          }
          int v125 = v124;
          id v126 = +[_PFRoutines newSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v124, v123);

          [v117 setObject:v126 forKey:v120];
        }
      }
      BOOL v127 = v128 == 0;
      *(void *)(*(void *)(a1 + 168) + 104) = [v117 copy];

      if (v127 && [v142 _isEnabled]) {
        objc_msgSend((id)a1, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0);
      }
      [(id)a1 processPendingChanges];
      if (v113) {
        [v113 drain];
      }
      if (*(void *)(a1 + 24)) {
        -[NSManagedObjectContext _registerAsyncReferenceCallback](a1);
      }
    }
  }
}

- (void)processPendingChanges
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }

  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
}

- (NSSet)registeredObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  id v3 = (void *)-[NSManagedObjectContext _retainedRegisteredObjects]((uint64_t)self);

  return (NSSet *)v3;
}

- (uint64_t)_retainedRegisteredObjects
{
  uint64_t v1 = a1;
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[NSManagedObjectContext _processReferenceQueue:](a1, 0);
    unint64_t Count = _PFCMT_GetCount(*(void **)(v1 + 120));
    unint64_t v3 = Count;
    if (Count <= 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = Count;
    }
    if (Count >= 0x201) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = (const void **)((char *)v8 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (Count > 0x200) {
      id v6 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v8 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    }
    uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:count:", v6, -[_PFContextMapTable getAllObjects:](*(void *)(v1 + 120), v6));
    if (v3 >= 0x201) {
      NSZoneFree(0, v6);
    }
  }
  return v1;
}

- (uint64_t)_mergeRefreshObject:(char)a3 mergeChanges:(NSKnownKeysDictionary *)a4 withPersistentSnapshot:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__mergeRefreshObject_mergeChanges_withPersistentSnapshot_);
    if (a2)
    {
LABEL_3:
      unsigned int v8 = *(_DWORD *)(a2 + 16);
      if ((v8 & 0x80) != 0 || !*(void *)(a2 + 32)) {
        return 0;
      }
      int v9 = (v8 >> 15) & 7;
      if (v9 != 5 && v9 != 0) {
        return 0;
      }
      long long v11 = (void *)[(id)a2 objectID];
      values = v11;
      if ((a3 & 1) == 0)
      {
        [(id)a2 willRefresh:0];
        -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)a1, a2, 1);
        return 1;
      }
      long long v12 = v11;
      [(id)a2 willRefresh:1];
      refreshed = a4;
      if (!a4) {
        refreshed = -[NSManagedObject _newChangedValuesForRefresh__](a2);
      }
      uint64_t v14 = -[NSManagedObject _changedTransientProperties__]((void *)a2);
      uint64_t v15 = _insertion_fault_handler;
      uint64_t v16 = [(id)a2 entity];
      uint64_t v17 = *(uint64_t **)(a2 + 48);
      uint64_t v33 = v15;
      if (v17)
      {
        uint64_t v18 = *v17;
        unsigned int v19 = *(_DWORD *)(a2 + 16);
        uint64_t v20 = 0;
        int v21 = 1;
        if (v18)
        {
          if ((v19 & 0x2000) == 0)
          {
            if (v16)
            {
              uint64_t v20 = *(void *)(*(void *)(v16 + 152) + 48);
              if (v20)
              {
                *(_DWORD *)(a2 + 16) = v19 | 0x1000;
                [(id)a2 _willChangeValuesForKeys:v20];
                int v21 = 0;
                unsigned int v19 = *(_DWORD *)(a2 + 16) & 0xFFFFEFFF;
              }
            }
          }
        }
      }
      else
      {
        uint64_t v20 = 0;
        unsigned int v19 = *(_DWORD *)(a2 + 16);
        int v21 = 1;
      }
      *(_DWORD *)(a2 + 16) = v19 | 0x2000;
      -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)a1, a2, 0);
      int v22 = *(_DWORD *)(a2 + 16) & 0x12;
      BOOL v23 = v22 != 0;
      if ([v12 isTemporaryID])
      {
        unsigned __int8 v24 = atomic_load((unsigned __int8 *)(a1 + 48));
        BOOL v23 = (v24 & 1) == 0 || v22 != 0;
      }
      if (v23 || ((v21 ^ 1) & 1) != 0)
      {
        if (!v23) {
          goto LABEL_31;
        }
      }
      else if ([(id)a2 hasChanges])
      {
LABEL_31:
        -[NSManagedObjectContext lockObjectStore](a1);
        uint64_t v26 = [*(id *)(a1 + 32) newValuesForObjectWithID:values withContext:a1 error:0];
        BOOL v27 = v26 != 0;
        if (v26)
        {
          uint64_t v28 = (void *)v26;
          if ((*(unsigned char *)(a2 + 17) & 2) == 0 && ([values isTemporaryID] & 1) == 0)
          {
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            CFAllocatorRef v29 = _PFStackAllocatorCreate((unint64_t *)&v35, 1024);
            CFArrayRef v30 = CFArrayCreate(v29, (const void **)&values, 1, 0);
            objc_msgSend(*(id *)(a1 + 32), "managedObjectContextDidRegisterObjectsWithIDs:generation:", v30, objc_msgSend((id)a1, "_queryGenerationToken"));
            if (*((void *)&v36 + 1) && v30) {
              CFRelease(v30);
            }
            *(_DWORD *)(a2 + 16) |= 0x200u;
          }
          _PFFaultHandlerFulfillFault(v33, a2, a1, v28, 0);
        }
        -[NSManagedObjectContext unlockObjectStore](a1);
        goto LABEL_42;
      }
      BOOL v27 = 0;
LABEL_42:
      if ([(NSKnownKeysDictionary *)refreshed count]) {
        -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:]((_DWORD *)a2, refreshed, 0);
      }
      if (!a4) {

      }
      if ([(NSKnownKeysDictionary *)v14 count]) {
        -[NSManagedObject _updateFromSnapshot:](a2, v14);
      }
      unsigned int v31 = *(_DWORD *)(a2 + 16);
      if (v27)
      {
        *(_DWORD *)(a2 + 16) = v31 | 0x1000;
        [(id)a2 awakeFromFetch];
        unsigned int v31 = *(_DWORD *)(a2 + 16) & 0xFFFFEFFF;
      }
      *(_DWORD *)(a2 + 16) = v31 & 0xFFFFDFFF;
      if ((v21 & 1) == 0) {
        [(id)a2 _didChangeValuesForKeys:v20];
      }
      return 1;
    }
  }
  else if (a2)
  {
    goto LABEL_3;
  }
  return 0;
}

- (void)insertObject:(NSManagedObject *)object
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v5 = [(NSManagedObject *)object entity];
  if (!v5)
  {
    long long v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = @"An NSManagedObject must have a valid NSEntityDescription.";
    goto LABEL_16;
  }
  id v6 = v5;
  if ([(NSManagedObjectContext *)self persistentStoreCoordinator])
  {
    uint64_t v7 = [(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)self persistentStoreCoordinator] managedObjectModel];
    uint64_t v8 = [(NSEntityDescription *)v6 name];
    if ((!v7 || ![(NSMutableDictionary *)v7->_entities objectForKey:v8])
      && ![(NSManagedObjectContext *)self _allowAncillaryEntities])
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      uint64_t v16 = NSString;
      if ([(NSEntityDescription *)v6 name]) {
        uint64_t v17 = [(NSEntityDescription *)v6 name];
      }
      else {
        uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v13 = (__CFString *)[v16 stringWithFormat:@"Cannot insert '%@' in this managed object context because it is not found in the associated managed object model.", v17];
      long long v11 = v14;
      uint64_t v12 = v15;
LABEL_16:
      objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
    }
  }
  int v9 = [(NSManagedObject *)object objectID];
  if (v9)
  {
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)object, v9);
    if (object)
    {
LABEL_10:
      object->_cd_stateFlags |= 0x1000u;
      [(NSManagedObject *)object awakeFromInsert];
      object->_cd_stateFlags &= ~0x1000u;
      return;
    }
  }
  else
  {
    long long v10 = [[NSTemporaryObjectID alloc] initWithEntity:[(NSManagedObject *)object entity]];
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)object, v10);

    if (object) {
      goto LABEL_10;
    }
  }

  [0 awakeFromInsert];
}

- (void)_insertObjectWithGlobalID:(void *)a3 globalID:
{
  if (result)
  {
    if (!a2) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"attempt to insert a null object into this context" userInfo:0]);
    }
    uint64_t v5 = (uint64_t)result;
    -[NSManagedObjectContext _registerClearStateWithUndoManager]((uint64_t)result);
    int v6 = *(_DWORD *)(a2 + 16);
    if ((v6 & 0x80) != 0) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = *(void *)(a2 + 32);
    }
    if (v7 != v5)
    {
      -[NSManagedObjectContext _registerObject:withID:](v5, a2, a3);
      int v6 = *(_DWORD *)(a2 + 16);
    }
    *(_DWORD *)(a2 + 16) = v6 | 2;
    _PFFaultHandlerFulfillFault(0, a2, v5, 0, 1);
    -[NSManagedObjectContext _establishEventSnapshotsForObject:](v5, (void *)a2);
    int v8 = *(_DWORD *)(v5 + 40);
    if ((v8 & 0x200) != 0 && (v8 & 0x100) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      int v8 = *(_DWORD *)(v5 + 40);
    }
    *(_DWORD *)(v5 + 40) = v8 | 0x100;
    [*(id *)(v5 + 72) addObject:a2];
    -[NSManagedObjectContext _enqueueEndOfEventNotification](v5);
    if ((*(unsigned char *)(v5 + 41) & 4) == 0)
    {
      [(id)v5 willChangeValueForKey:@"hasChanges"];
      *(_DWORD *)(v5 + 40) |= 0x400u;
      [(id)v5 didChangeValueForKey:@"hasChanges"];
    }
    NSUInteger result = **(void ***)(v5 + 168);
    if (result)
    {
      return (void *)[result removeObject:a3];
    }
  }
  return result;
}

- (uint64_t)_mergeRefreshEpilogueForObject:(uint64_t)a3 mergeChanges:
{
  [a2 awakeFromSnapshotEvents:256];
  [a2 didRefresh:a3];
  -[NSManagedObjectContext _prepareUnprocessedDeletionAfterRefresh:]((_DWORD *)a1, a2);
  uint64_t result = objc_msgSend(*(id *)(a1 + 112), "addObject:", objc_msgSend(a2, "objectID"));
  if ((*(unsigned char *)(a1 + 40) & 1) == 0)
  {
    return -[NSManagedObjectContext _enqueueEndOfEventNotification](a1);
  }
  return result;
}

- (void)refreshObject:(NSManagedObject *)object mergeChanges:(BOOL)flag
{
  BOOL v4 = flag;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object) {
      goto LABEL_6;
    }
  }
  else if (!object)
  {
    goto LABEL_6;
  }
  if ((object->_cd_stateFlags & 0x80) == 0)
  {
    cd_managedObjectContext = object->_cd_managedObjectContext;
    goto LABEL_7;
  }
LABEL_6:
  cd_managedObjectContext = 0;
LABEL_7:
  if (cd_managedObjectContext != self)
  {
    if (!cd_managedObjectContext) {
      return;
    }
    if (BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88)) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"An NSManagedObjectContext cannot refresh objects in other contexts." userInfo:0]);
    }
  }
  unsigned int v8 = (object->_cd_stateFlags >> 15) & 7;
  if (v8 == 5 || v8 == 0)
  {
    long long v10 = [(NSManagedObject *)object objectID];
    values = v10;
    if (!v4)
    {
      [(NSManagedObject *)object willRefresh:0];
      -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)&self->super.isa, (uint64_t)object, 1);
LABEL_60:
      [(NSManagedObject *)object awakeFromSnapshotEvents:32];
      [(NSManagedObject *)object didRefresh:v4];
      -[NSManagedObjectContext _prepareUnprocessedDeletionAfterRefresh:](self, object);
      [(NSMutableSet *)self->_refreshedObjects addObject:[(NSManagedObject *)object objectID]];
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        -[NSManagedObjectContext _enqueueEndOfEventNotification]((uint64_t)self);
      }
      return;
    }
    long long v11 = v10;
    [(NSManagedObject *)object willRefresh:1];
    refreshed = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)object);
    uint64_t v13 = -[NSManagedObject _changedTransientProperties__](object);
    if (object) {
      uint64_t v14 = _insertion_fault_handler;
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = [(NSManagedObject *)object entity];
    cd_extras = object->_cd_extras;
    uint64_t v33 = v14;
    if (cd_extras)
    {
      var0 = cd_extras->var0;
      unsigned int cd_stateFlags = object->_cd_stateFlags;
      uint64_t v19 = 0;
      int v20 = 1;
      if (var0)
      {
        if ((cd_stateFlags & 0x2000) == 0)
        {
          if (v15)
          {
            uint64_t v19 = *((void *)v15->_kvcPropertyAccessors + 6);
            if (v19)
            {
              object->_unsigned int cd_stateFlags = cd_stateFlags | 0x1000;
              [(NSManagedObject *)object _willChangeValuesForKeys:v19];
              int v20 = 0;
              unsigned int cd_stateFlags = object->_cd_stateFlags & 0xFFFFEFFF;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v19 = 0;
      unsigned int cd_stateFlags = object->_cd_stateFlags;
      int v20 = 1;
    }
    object->_unsigned int cd_stateFlags = cd_stateFlags | 0x2000;
    -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)&self->super.isa, (uint64_t)object, 0);
    unsigned int v21 = object->_cd_stateFlags & 0x12;
    BOOL v22 = v21 != 0;
    if ([(NSManagedObjectID *)v11 isTemporaryID])
    {
      unsigned __int8 v23 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
      BOOL v22 = (v23 & 1) == 0 || v21 != 0;
    }
    if (v22 || ((v20 ^ 1) & 1) != 0)
    {
      if (!v22) {
        goto LABEL_37;
      }
    }
    else if ([(NSManagedObject *)object hasChanges])
    {
LABEL_37:
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      if (self) {
        id parentObjectStore = self->_parentObjectStore;
      }
      else {
        id parentObjectStore = 0;
      }
      uint64_t v26 = [parentObjectStore newValuesForObjectWithID:values withContext:self error:0];
      BOOL v27 = v26 != 0;
      if (v26)
      {
        uint64_t v28 = (void *)v26;
        if ((object->_cd_stateFlags & 0x200) == 0 && ([values isTemporaryID] & 1) == 0)
        {
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          CFAllocatorRef v29 = _PFStackAllocatorCreate((unint64_t *)&v35, 1024);
          CFArrayRef v30 = CFArrayCreate(v29, (const void **)&values, 1, 0);
          if (self) {
            id v32 = self->_parentObjectStore;
          }
          else {
            id v32 = 0;
          }
          objc_msgSend(v32, "managedObjectContextDidRegisterObjectsWithIDs:generation:", v30, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
          if (*((void *)&v36 + 1) && v30) {
            CFRelease(v30);
          }
          object->_cd_stateFlags |= 0x200u;
        }
        _PFFaultHandlerFulfillFault(v33, (uint64_t)object, (uint64_t)self, v28, 0);
      }
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      goto LABEL_52;
    }
    BOOL v27 = 0;
LABEL_52:
    if ([(NSKnownKeysDictionary *)refreshed count]) {
      -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](object, refreshed, 0);
    }

    if ([(NSKnownKeysDictionary *)v13 count]) {
      -[NSManagedObject _updateFromSnapshot:]((uint64_t)object, v13);
    }
    unsigned int v31 = object->_cd_stateFlags;
    if (v27)
    {
      object->_unsigned int cd_stateFlags = v31 | 0x1000;
      [(NSManagedObject *)object awakeFromFetch];
      unsigned int v31 = object->_cd_stateFlags & 0xFFFFEFFF;
    }
    object->_unsigned int cd_stateFlags = v31 & 0xFFFFDFFF;
    if ((v20 & 1) == 0) {
      [(NSManagedObject *)object _didChangeValuesForKeys:v19];
    }
    goto LABEL_60;
  }
}

- (void)_refaultObject:(id *)a1 globalID:(uint64_t)a2 BOOLean:(int)a3
{
  if (a1)
  {
    if ((a3 & 1) != 0 || (*(unsigned char *)(a2 + 16) & 0x3F) == 0)
    {
      uint64_t v7 = 0;
      long long v11 = 0;
    }
    else
    {
      int v6 = *(void **)(a2 + 48);
      if (v6) {
        int v6 = (void *)v6[1];
      }
      uint64_t v7 = v6;
      unsigned int v8 = *(void **)(a2 + 48);
      if (v8) {
        unsigned int v8 = (void *)v8[2];
      }
      long long v11 = v8;
    }
    if (a2) {
      uint64_t v9 = _insertion_fault_handler;
    }
    else {
      uint64_t v9 = 0;
    }
    -[NSFaultHandler turnObject:intoFaultWithContext:](v9, a2, (uint64_t)a1);
    if (a2 && a3)
    {
      int v10 = *(_DWORD *)(a2 + 16);
      if ((v10 & 9) != 0)
      {
        [a1[7] removeObject:a2];
        [a1[12] removeObject:a2];
        int v10 = *(_DWORD *)(a2 + 16);
      }
      if ((v10 & 0x12) != 0)
      {
        [a1[9] removeObject:a2];
        [a1[10] removeObject:a2];
        int v10 = *(_DWORD *)(a2 + 16);
      }
      if ((v10 & 0x24) != 0)
      {
        [a1[11] removeObject:a2];
        [a1[8] removeObject:a2];
        int v10 = *(_DWORD *)(a2 + 16);
      }
      *(_DWORD *)(a2 + 16) = v10 & 0xFFFFFFC0;
      -[NSManagedObject _setOriginalSnapshot__:]((void *)a2, 0);
      -[NSManagedObject _setLastSnapshot__:]((void *)a2, 0);
    }
    if (v7)
    {
      -[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)a1, (void *)a2);
    }
    if (v11)
    {
      -[NSManagedObject _setLastSnapshot__:]((void *)a2, v11);
    }
  }
}

- (void)_prepareUnprocessedDeletionAfterRefresh:(_DWORD *)a1
{
  if (a1 && [a2 isDeleted])
  {
    int v3 = a1[10];
    if ((v3 & 0x200) != 0 && (v3 & 0x100) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      int v3 = a1[10];
    }
    a1[10] = v3 | 0x100;
    if ((v3 & 0x400) == 0)
    {
      [a1 willChangeValueForKey:@"hasChanges"];
      a1[10] |= 0x400u;
      [a1 didChangeValueForKey:@"hasChanges"];
    }
  }
}

- (uint64_t)_committedSnapshotForObject:(uint64_t)result
{
  if (result)
  {
    if (_PF_Threading_Debugging_level)
    {
      _PFAssertSafeMultiThreadedAccess_impl(result, sel__committedSnapshotForObject_);
      if (a2)
      {
LABEL_4:
        uint64_t v3 = a2[6];
        if (v3 && *(void *)(v3 + 8)) {
          return *(void *)(v3 + 8);
        }
        BOOL v4 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a2, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1);
        -[NSManagedObject _setOriginalSnapshot__:](a2, v4);

        uint64_t v3 = a2[6];
        if (v3) {
          return *(void *)(v3 + 8);
        }
      }
    }
    else if (a2)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return result;
}

- (uint64_t)_changeIDsForManagedObjects:(void *)a3 toIDs:
{
  uint64_t v3 = a1;
  v24[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = [a2 count];
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      unint64_t v7 = v6;
      unsigned __int8 v8 = atomic_load((unsigned __int8 *)(v3 + 50));
      if (v8)
      {
        uint64_t v6 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = (void *)v6;
      }
      else
      {
        uint64_t v9 = 0;
      }
      uint64_t v22 = (uint64_t)&v22;
      MEMORY[0x1F4188790](v6);
      long long v11 = (char *)&v22 - v10;
      if (v7 > 0x200)
      {
        long long v11 = (char *)NSAllocateScannedUncollectable();
        uint64_t v13 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v22 - v10, 8 * v7);
        MEMORY[0x1F4188790](v12);
        uint64_t v13 = (char *)&v22 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v13, 8 * v7);
      }
      objc_msgSend(a2, "getObjects:range:", v11, 0, v7, v22);
      objc_msgSend(a3, "getObjects:range:", v13, 0, objc_msgSend(a3, "count"));
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v15 = *(void **)&v11[8 * i];
        id v16 = (id)[v15 objectID];
        id v17 = *(id *)&v13[8 * i];
        if (v17 != v16)
        {
          [v9 setObject:*(void *)&v13[8 * i] forKey:v16];
          _PFCMT_RemoveValue(*(void **)(v3 + 120), v16);
          -[NSManagedObject _setObjectID__:](v15, v17);
          uint64_t v18 = v15[3];
          if (v18) {
            snapshot_set_objectID(v18, v17);
          }
          _PFCMT_SetValue(*(void *)(v3 + 120), v17, v15);
          uint64_t v19 = *(id **)(*(void *)(v3 + 168) + 8);
          if (v19)
          {
            [*v19 setObject:v17 forKey:v16];
            [*(id *)(*(void *)(*(void *)(v3 + 168) + 8) + 8) setObject:v16 forKey:v17];
          }
        }
      }
      if (v7 >= 0x201)
      {
        NSZoneFree(0, v11);
        NSZoneFree(0, v13);
      }
      if (v8)
      {
        if ([v9 count])
        {
          id v20 = objc_alloc(MEMORY[0x1E4F28EA0]);
          unsigned __int8 v23 = @"_NSManagedObjectContextObjectIDMutationMappingKey";
          v24[0] = v9;
          uint64_t v3 = objc_msgSend(v20, "initWithName:object:userInfo:", @"_NSManagedObjectContextPrivateDidMutateObjectIDsNotification", v3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
        }
        else
        {
          uint64_t v3 = 0;
        }
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }
  return v3;
}

- (void)setAutomaticallyMergesChangesFromParent:(BOOL)automaticallyMergesChangesFromParent
{
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Automatic merging is not supported by contexts using NSConfinementConcurrencyType" userInfo:0]);
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__NSManagedObjectContext__setAutomaticallyMergesChangesFromParent___block_invoke;
  v3[3] = &unk_1E544C770;
  BOOL v4 = automaticallyMergesChangesFromParent;
  v3[4] = self;
  [(NSManagedObjectContext *)self performBlockAndWait:v3];
}

- (uint64_t)_addObjectIDsUpdatedByTriggers:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [a2 count];
    if (result)
    {
      BOOL v4 = *(void **)(*(void *)(v3 + 168) + 112);
      if (!v4)
      {
        *(void *)(*(void *)(v3 + 168) + 112) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        BOOL v4 = *(void **)(*(void *)(v3 + 168) + 112);
      }
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v9;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(a2);
            }
            [v4 addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
          }
          while (v5 != v7);
          uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_addObjectIDsUpdatedByDATriggers:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [a2 count];
    if (result)
    {
      BOOL v4 = *(void **)(*(void *)(v3 + 168) + 144);
      if (!v4)
      {
        *(void *)(*(void *)(v3 + 168) + 144) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        BOOL v4 = *(void **)(*(void *)(v3 + 168) + 144);
      }
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v9;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(a2);
            }
            [v4 addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
          }
          while (v5 != v7);
          uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_addObjectIDsInsertUpdatedByDATriggers:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = [a2 count];
    if (result)
    {
      BOOL v4 = *(void **)(*(void *)(v3 + 168) + 136);
      if (!v4)
      {
        *(void *)(*(void *)(v3 + 168) + 136) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        BOOL v4 = *(void **)(*(void *)(v3 + 168) + 136);
      }
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (result)
      {
        uint64_t v5 = result;
        uint64_t v6 = *(void *)v9;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(a2);
            }
            [v4 addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
          }
          while (v5 != v7);
          uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)setShouldDeleteInaccessibleFaults:(BOOL)shouldDeleteInaccessibleFaults
{
  BOOL v3 = shouldDeleteInaccessibleFaults;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__NSManagedObjectContext_setShouldDeleteInaccessibleFaults___block_invoke;
    v6[3] = &unk_1E544C770;
    v6[4] = self;
    BOOL v7 = shouldDeleteInaccessibleFaults;
    [(NSManagedObjectContext *)self performBlockAndWait:v6];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x100000;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v5);
  }
}

- (NSManagedObject)existingObjectWithID:(NSManagedObjectID *)objectID error:(NSError *)error
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (!_PF_Threading_Debugging_level)
  {
    if (objectID) {
      goto LABEL_3;
    }
LABEL_27:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil is not a valid object ID" userInfo:0]);
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!objectID) {
    goto LABEL_27;
  }
LABEL_3:
  BOOL v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      long long v8 = v7;
LABEL_16:
      long long v10 = 0;
      *error = v8;
      return v10;
    }
    return 0;
  }
  if (![(NSManagedObjectID *)objectID isTemporaryID])
  {
    id v16 = (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, objectID, error, 0);
    if (v16)
    {
      id v17 = v16;
      uint64_t v28 = 0;
      long long v10 = (NSManagedObject *)-[NSFaultHandler fulfillFault:withContext:error:]((id)_insertion_fault_handler, v16, (uint64_t)self, (id *)&v28);
      if (v10 == v17) {
        uint64_t v18 = v17;
      }
      else {

      }
      if (v28)
      {
        if (error)
        {
          long long v10 = 0;
          *error = v28;
          return v10;
        }
      }
      else
      {
        if (v10) {
          return v10;
        }
        uint64_t v19 = [NSString stringWithUTF8String:"existingObjectWithID incorrectly returned nil without an error set for objectID %@"];
        _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)objectID);
        uint64_t v26 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = objectID;
          _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: existingObjectWithID incorrectly returned nil without an error set for objectID %@", buf, 0xCu);
        }
      }
      return 0;
    }
    if (!error) {
      return 0;
    }
    long long v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F281F8];
    CFAllocatorRef v29 = @"objectID";
    CFArrayRef v30 = objectID;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v30;
    uint64_t v15 = &v29;
LABEL_15:
    long long v8 = (NSError *)objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 133000, objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1));
    goto LABEL_16;
  }
  long long v9 = [(NSManagedObjectContext *)self objectRegisteredForID:objectID];
  long long v10 = v9;
  if (error && !v9)
  {
    long long v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F281F8];
    uint64_t v33 = @"objectID";
    v34[0] = objectID;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = (NSManagedObjectID **)v34;
    uint64_t v15 = &v33;
    goto LABEL_15;
  }
  return v10;
}

- (void)setStalenessInterval:(NSTimeInterval)stalenessInterval
{
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__NSManagedObjectContext_setStalenessInterval___block_invoke;
    v5[3] = &unk_1E544C720;
    v5[4] = self;
    *(NSTimeInterval *)&v5[5] = stalenessInterval;
    [(NSManagedObjectContext *)self performBlockAndWait:v5];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    self->_fetchTimestamp = stalenessInterval;
  }
}

- (BOOL)tryLock
{
  if (self->_dispatchQueue)
  {
    uint64_t v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
    if (v3)
    {
      unint64_t v4 = 0;
      int v5 = 0;
      unint64_t v6 = v3;
      while ((NSManagedObjectContext *)v6 != self)
      {
        if (v6 == v4) {
          goto LABEL_13;
        }
        if (!v4) {
          unint64_t v4 = v6;
        }
        unint64_t v6 = atomic_load((unint64_t *)(v6 + 8));
        if (!v6) {
          goto LABEL_15;
        }
      }
      int v5 = 1;
LABEL_13:
      if (v5)
      {
        uint64_t v3 = 1;
        goto LABEL_27;
      }
LABEL_15:
      long long v8 = 0;
      int v9 = 0;
      long long v10 = self;
      do
      {
        BOOL v11 = v10 == (NSManagedObjectContext *)v3;
        if (v10 == (NSManagedObjectContext *)v3) {
          int v9 = 1;
        }
        if (v10 == v8) {
          BOOL v11 = 1;
        }
        if (v11) {
          break;
        }
        if (!v8) {
          long long v8 = v10;
        }
        long long v10 = (NSManagedObjectContext *)atomic_load((unint64_t *)&v10->_queueOwner);
      }
      while (v10);
      if (v9) {
        uint64_t v3 = v11;
      }
      else {
        uint64_t v3 = 0;
      }
    }
LABEL_27:
    unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
    if ((v12 & 1) == 0)
    {
      LOBYTE(v7) = v3 != 0;
      return v7;
    }
    unsigned __int8 v13 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
    if ((v13 & 1) == 0 || !_PFIsSerializedWithMainQueue())
    {
      LOBYTE(v7) = 0;
      return v7;
    }
LABEL_31:
    LOBYTE(v7) = 1;
    return v7;
  }
  int v7 = [self->_lock tryLock];
  if (v7)
  {
    [(NSManagedObjectContext *)self lock];
    [self->_lock unlock];
    goto LABEL_31;
  }
  return v7;
}

- (void)_storeConfigurationChanged:(id)a3
{
  if (self && !self->_wasDisposed && ([(NSManagedObjectContext *)self _isDeallocating] & 1) == 0)
  {
    uint64_t v4 = [a3 userInfo];
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = NSDictionary_EmptyDictionary;
    }
    if (self->_dispatchQueue)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __95__NSManagedObjectContext__NSInternalNotificationHandling___sendOrEnqueueNotification_selector___block_invoke;
      v11[3] = &unk_1E544BC40;
      v11[5] = v5;
      v11[6] = sel__processChangedStoreConfigurationNotification_;
      v11[4] = self;
      unint64_t v6 = self;
      BOOL v7 = [(NSManagedObjectContext *)self tryLock];
      long long v8 = self;
      if (v7)
      {
        [(NSManagedObjectContext *)self performBlockAndWait:v11];
        [(NSManagedObjectContext *)self unlock];
      }
      else
      {
        [(NSManagedObjectContext *)self performBlock:v11];
      }
    }
    else
    {
      int v9 = self;
      if ([(NSManagedObjectContext *)self tryLock])
      {
        if (!self->_wasDisposed && ([(NSManagedObjectContext *)self _isDeallocating] & 1) == 0)
        {
          -[NSManagedObjectContext performSelector:withObject:](self, "performSelector:withObject:", sel__processChangedStoreConfigurationNotification_, [MEMORY[0x1E4F1C978] arrayWithObject:v5]);
          -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
        }
        [(NSManagedObjectContext *)self unlock];
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EC0], "defaultQueue"), "enqueueNotification:postingStyle:", a3, 2);
      }
    }
  }
}

- (void)_processChangedStoreConfigurationNotification:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v5 = (void *)[a3 lastObject];
  unint64_t v6 = self;
  id v82 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  BOOL v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v8 = (void *)[v5 objectForKey:@"changedUUID"];
  if (v8)
  {
    int v9 = v8;
    uint64_t v81 = v5;
    char v96 = 0;
    uint64_t v10 = [v8 objectAtIndex:0];
    BOOL v11 = (void *)[v9 objectAtIndex:1];
    long long v85 = (_PFArray *)[v9 objectAtIndex:2];
    uint64_t v12 = [(NSMutableSet *)self->_insertedObjects count];
    uint64_t v13 = [(NSMutableSet *)self->_unprocessedInserts count];
    unint64_t v14 = v13 + v12;
    if (v13 + v12)
    {
      uint64_t v84 = &v77;
      MEMORY[0x1F4188790](v13);
      id v16 = (char *)&v77 - v15;
      if (v14 > 0x200) {
        id v16 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v77 - v15, 8 * v14);
      }
      [(NSMutableSet *)self->_insertedObjects getObjects:v16];
      [(NSMutableSet *)self->_unprocessedInserts getObjects:&v16[8 * [(NSMutableSet *)self->_insertedObjects count]]];
      uint64_t v17 = 0;
      long long v86 = v11;
      do
      {
        char v96 = *(void **)&v16[8 * v17];
        uint64_t v18 = (void *)[v96 objectID];
        if ([v18 persistentStore] == v10)
        {
          if ([v18 isTemporaryID])
          {
            [v18 _setPersistentStore:v11];
          }
          else
          {
            v95.versiouint64_t n = 0;
            v95.versiouint64_t n = (CFIndex)-[NSTemporaryObjectID initWithEntity:]([NSTemporaryObjectID alloc], "initWithEntity:", [v18 entity]);
            [(id)v95.version _setPersistentStore:v11];
            long long v127 = 0u;
            long long v128 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            long long v100 = 0u;
            memset(&v99, 0, sizeof(v99));
            CFAllocatorRef v19 = _PFStackAllocatorCreate((unint64_t *)&v99, 1024);
            CFArrayRef v20 = CFArrayCreate(v19, (const void **)&v96, 1, 0);
            CFArrayRef v21 = CFArrayCreate(v19, (const void **)&v95, 1, 0);
            uint64_t v22 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)self, v20, v21);
            if (v22)
            {
              uint64_t v23 = (void *)v22;
              [v7 addObject:v22];
            }
            if (v99.copyDescription)
            {
              BOOL v11 = v86;
              if (v20) {
                CFRelease(v20);
              }
              if (v21) {
                CFRelease(v21);
              }
            }
            else
            {
              v99.retaiuint64_t n = (CFDictionaryRetainCallBack)v99.version;
              BOOL v11 = v86;
            }
          }
        }
        ++v17;
      }
      while (v14 != v17);
      if (v14 >= 0x201) {
        NSZoneFree(0, v16);
      }
    }
    unint64_t v24 = [(_PFArray *)v85 count];
    uint64_t v80 = &v77;
    unint64_t v25 = MEMORY[0x1F4188790](v24);
    uint64_t v28 = (char *)&v77 - v27;
    size_t v29 = 8 * v26;
    if (v25 >= 0x402)
    {
      uint64_t v28 = (char *)NSAllocateScannedUncollectable();
      long long v86 = NSAllocateScannedUncollectable();
      uint64_t v84 = (uint64_t *)NSAllocateScannedUncollectable();
      unsigned __int8 v83 = NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v77 - v27, 8 * v26);
      MEMORY[0x1F4188790](v30);
      unint64_t v31 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
      long long v86 = (uint64_t *)((char *)&v77 - v31);
      bzero((char *)&v77 - v31, v29);
      MEMORY[0x1F4188790](v32);
      uint64_t v84 = (uint64_t *)((char *)&v77 - v31);
      bzero((char *)&v77 - v31, v29);
      MEMORY[0x1F4188790](v33);
      unsigned __int8 v83 = (uint64_t *)((char *)&v77 - v31);
      bzero((char *)&v77 - v31, v29);
      if (!v24)
      {
        CFIndex v34 = 0;
        goto LABEL_35;
      }
    }
    unint64_t v35 = 0;
    uint64_t v36 = 0;
    CFIndex v34 = 0;
    do
    {
      unint64_t v37 = v24;
      long long v38 = v28;
      long long v39 = v85;
      id v40 = [(_PFArray *)v85 objectAtIndex:v35];
      unint64_t v41 = v35 + 1;
      uint64_t v42 = [(_PFArray *)v39 objectAtIndex:v41];
      id Value = (void *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v40);
      char v96 = Value;
      if (Value)
      {
        v84[v36] = (uint64_t)Value;
        v83[v36] = v42;
        objc_msgSend(v96, "_setVersionReference__:", 1);
        ++v36;
      }
      *(void *)&v38[8 * v34] = v40;
      uint64_t v28 = v38;
      v86[v34++] = v42;
      unint64_t v35 = v41 + 1;
      unint64_t v24 = v37;
    }
    while (v35 < v37);
    if (v36)
    {
      long long v44 = [_PFArray alloc];
      long long v45 = [(_PFArray *)v44 initWithObjects:v84 count:v36 andFlags:48 andContext:self];
      long long v46 = [_PFArray alloc];
      long long v47 = [(_PFArray *)v46 initWithObjects:v83 count:v36 andFlags:0];
      long long v85 = v45;
      int v79 = v47;
      uint64_t v48 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)self, v45, v47);
      if (v48)
      {
        long long v49 = (void *)v48;
        [v7 addObject:v48];
      }
      goto LABEL_36;
    }
LABEL_35:
    int v79 = 0;
    long long v85 = 0;
LABEL_36:
    memset(&v99, 0, 24);
    *(_OWORD *)&v99.copyDescriptiouint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
    v99.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E4F1D530] + 40);
    memset(&v95, 0, 24);
    *(_OWORD *)&v95.copyDescriptiouint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D540] + 24);
    CFAllocatorRef v50 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    size_t v78 = v28;
    CFDictionaryRef v51 = CFDictionaryCreate(v50, (const void **)v28, (const void **)v86, v34, &v99, &v95);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v52 = [(NSManagedObjectContext *)self registeredObjects];
    uint64_t v53 = [(NSSet *)v52 countByEnumeratingWithState:&v91 objects:v98 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v92 != v55) {
            objc_enumerationMutation(v52);
          }
          long long v57 = *(id ***)(*((void *)&v91 + 1) + 8 * i);
          if (v57) {
            int v58 = _insertion_fault_handler;
          }
          else {
            int v58 = 0;
          }
          _PFFaultHandlerFixRelationshipsPostMigration(v58, v57, (uint64_t)self, v51);
        }
        uint64_t v54 = [(NSSet *)v52 countByEnumeratingWithState:&v91 objects:v98 count:16];
      }
      while (v54);
    }
    CFRelease(v51);

    if (v24 >= 0x402)
    {
      NSZoneFree(0, v78);
      NSZoneFree(0, v86);
      NSZoneFree(0, v84);
      NSZoneFree(0, v83);
    }
    uint64_t v5 = v81;
  }
  CFIndex Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  uint64_t v60 = [v5 objectForKey:@"removed"];
  if (v60)
  {
    long long v61 = (void *)v60;
    id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v63 = [v61 count];
    if (v63)
    {
      uint64_t v64 = v63;
      for (uint64_t j = 0; j != v64; ++j)
      {
        id v66 = -[NSManagedObjectContext _retainedObjectsFromRemovedStore:](self, "_retainedObjectsFromRemovedStore:", [v61 objectAtIndex:j]);
        [v62 addObjectsFromArray:v66];
      }
    }
    uint64_t v67 = [v62 count];
    if (v67)
    {
      uint64_t v68 = v67;
      if (v67 == Count) {
        unint64_t v69 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", NSArray_EmptyArray, @"invalidatedAll", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), @"managedObjectContext", 0);
      }
      else {
        unint64_t v69 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v62), @"invalidated", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), @"managedObjectContext", 0);
      }
      -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v69);
      for (uint64_t k = 0; k != v68; ++k)
      {
        uint64_t v71 = [v62 objectAtIndex:k];
        if (v71) {
          uint64_t v72 = _insertion_fault_handler;
        }
        else {
          uint64_t v72 = 0;
        }
        -[NSFaultHandler turnObject:intoFaultWithContext:](v72, v71, (uint64_t)self);
        if (self) {
          [(NSManagedObjectContext *)self _forgetObject:v71 propagateToObjectStore:0 removeFromRegistry:1];
        }
      }
    }
  }
  if (v7)
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v73 = [v7 countByEnumeratingWithState:&v87 objects:v97 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v88;
      do
      {
        for (uint64_t m = 0; m != v74; ++m)
        {
          if (*(void *)v88 != v75) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", *(void *)(*((void *)&v87 + 1) + 8 * m));
        }
        uint64_t v74 = [v7 countByEnumeratingWithState:&v87 objects:v97 count:16];
      }
      while (v74);
    }
  }
  [v82 drain];
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
}

- (void)unlock
{
  if (!self->_dispatchQueue)
  {
    lockCFIndex Count = self->_lockCount;
    if (lockCount >= 1) {
      self->_lockCFIndex Count = --lockCount;
    }
    if (_PF_Threading_Debugging_level)
    {
      uint64_t v3 = (void *)*((void *)self->_additionalPrivateIvars + 7);
      if (v3) {
        BOOL v4 = lockCount == 0;
      }
      else {
        BOOL v4 = 0;
      }
      if (v4) {
        v3[1] = *v3;
      }
    }
    [self->_lock unlock];
  }
}

- (void)lock
{
  if (!self->_dispatchQueue)
  {
    [self->_lock lock];
    ++self->_lockCount;
    if (!self->_dispatchQueue)
    {
      unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isMainThreadBlessed);
      if ((v3 & 1) != 0 && !pthread_main_np())
      {
        -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers]((uint64_t)self->_referenceQueue);
        atomic_store(0, (unsigned __int8 *)&self->_isMainThreadBlessed);
      }
    }
    if (_PF_Threading_Debugging_level)
    {
      if (*((void *)self->_additionalPrivateIvars + 7)) {
        *(void *)(*((void *)self->_additionalPrivateIvars + 7) + 8) = pthread_self();
      }
    }
  }
}

- (void)_automaticallyMergeChangesFromContextDidSaveNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__NSManagedObjectContext__automaticallyMergeChangesFromContextDidSaveNotification___block_invoke;
  v3[3] = &unk_1E544B778;
  v3[4] = self;
  void v3[5] = a3;
  [(NSManagedObjectContext *)self performBlock:v3];
}

- (void)performBlock:(void *)block
{
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can only use -performBlock: on an NSManagedObjectContext that was created with a queue." userInfo:0]);
  }

  [(NSManagedObjectContext *)self performWithOptions:8199 andBlock:block];
}

- (NSManagedObjectContext)init
{
  objc_opt_class();

  return [(NSManagedObjectContext *)self initWithConcurrencyType:0];
}

- (BOOL)_performImmediate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_dispatchQueue) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can only use -performBlockAndWait: on an NSManagedObjectContext that was created with a queue." userInfo:0]);
  }
  BOOL v4 = self;
  uint64_t v5 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  unint64_t v6 = self;
  v14[0] = a3;
  v14[1] = v6;
  uint64_t v15 = 0;
  id v16 = v5;
  if (byte_1EB2706B2) {
    uint64_t v15 = 4;
  }
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&v4->_isMainThreadBlessed);
  if (v7)
  {
    if (_PFIsSerializedWithMainQueue())
    {
LABEL_26:
      developerSubmittedBlockToNSManagedObjectContextPerform(v14);
      return 1;
    }
  }
  else if (v5)
  {
    unint64_t v8 = 0;
    int v9 = 0;
    unint64_t v10 = (unint64_t)v5;
    while ((NSManagedObjectContext *)v10 != v4)
    {
      if (v10 == v8) {
        goto LABEL_16;
      }
      if (!v8) {
        unint64_t v8 = v10;
      }
      unint64_t v10 = atomic_load((unint64_t *)(v10 + 8));
      if (!v10) {
        goto LABEL_17;
      }
    }
    int v9 = 1;
LABEL_16:
    if (v9) {
      goto LABEL_26;
    }
LABEL_17:
    BOOL v11 = 0;
    int v12 = 0;
    while (v4 != v5)
    {
      if (v4 == v11) {
        goto LABEL_25;
      }
      if (!v11) {
        BOOL v11 = v4;
      }
      BOOL v4 = (NSManagedObjectContext *)atomic_load((unint64_t *)&v4->_queueOwner);
      if (!v4) {
        goto LABEL_27;
      }
    }
    int v12 = 1;
LABEL_25:
    if (v12) {
      goto LABEL_26;
    }
  }
LABEL_27:

  return 0;
}

- (void)_setAllowsExpandedUserInfoKeys:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__NSManagedObjectContext__NSCoreDataSPI___setAllowsExpandedUserInfoKeys___block_invoke;
    v6[3] = &unk_1E544C770;
    v6[4] = self;
    BOOL v7 = a3;
    [(NSManagedObjectContext *)self performBlockAndWait:v6];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x20000000;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xDFFFFFFF | v5);
  }
}

- (void)deleteObject:(NSManagedObject *)object
{
  if (!_PF_Threading_Debugging_level)
  {
    if (object) {
      goto LABEL_3;
    }
LABEL_16:
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    unint64_t v8 = @"-deleteObject: requires a non-nil argument";
LABEL_17:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!object) {
    goto LABEL_16;
  }
LABEL_3:
  if ((object->_cd_stateFlags & 0x80) != 0)
  {
    if (self) {
      return;
    }
    goto LABEL_9;
  }
  cd_managedObjectContext = object->_cd_managedObjectContext;
  if (cd_managedObjectContext == self)
  {
LABEL_9:
    -[NSManagedObjectContext _registerClearStateWithUndoManager]((uint64_t)self);
    object->_cd_stateFlags |= 4u;
    -[NSManagedObjectContext _establishEventSnapshotsForObject:]((uint64_t)self, object);
    _managedObjectContextFlags flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) != 0 && (*(_WORD *)&flags & 0x100) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      _managedObjectContextFlags flags = self->_flags;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&flags | 0x100);
    [(NSMutableSet *)self->_unprocessedDeletes addObject:object];
    -[NSManagedObjectContext _enqueueEndOfEventNotification]((uint64_t)self);
    if ((*((unsigned char *)&self->_flags + 1) & 4) == 0)
    {
      [(NSManagedObjectContext *)self willChangeValueForKey:@"hasChanges"];
      *(_DWORD *)&self->_flags |= 0x400u;
      [(NSManagedObjectContext *)self didChangeValueForKey:@"hasChanges"];
    }
    [(NSManagedObject *)object prepareForDeletion];
    return;
  }
  if (cd_managedObjectContext)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    unint64_t v8 = @"An NSManagedObjectContext cannot delete objects in other contexts.";
    goto LABEL_17;
  }
}

- (void)setShouldRefreshAfterSave:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__NSManagedObjectContext__NSCoreDataSPI__setShouldRefreshAfterSave___block_invoke;
    v6[3] = &unk_1E544C770;
    v6[4] = self;
    BOOL v7 = a3;
    [(NSManagedObjectContext *)self performBlockAndWait:v6];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x4000000;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFBFFFFFF | v5);
  }
}

void __92__NSManagedObjectContext__NSInternalChangeProcessing___prefetchObjectsForDeletePropagation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  [*(id *)(a1 + 32) setEntity:a2];
  [*(id *)(a1 + 32) setPredicate:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF IN %@", a3)];
  unint64_t v8 = (void *)-[NSEntityDescription _keypathsToPrefetchForDeletePropagation](a2);
  if ([v8 count])
  {
    [*(id *)(a1 + 32) setRelationshipKeyPathsForPrefetching:v8];
    uint64_t v15 = 0;
    if (![*(id *)(a1 + 40) executeFetchRequest:*(void *)(a1 + 32) error:&v15])
    {
      _NSCoreDataLog(2, @"Delete propagation prefetching failed with error: %@", v9, v10, v11, v12, v13, v14, v15);
      *a4 = 1;
    }
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)_setRetainsRegisteredObjects:(uint64_t)a1
{
  if (a1)
  {
    if (_PFCMT_GetCount(*(void **)(a1 + 120))) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"An NSManagedObjectContext's retain policy cannot be changed while it has registered objects.  Trying using reset() first." userInfo:0]);
    }
    if (((((*(_DWORD *)(a1 + 40) & 0x40) == 0) ^ a2) & 1) == 0)
    {
      if (a2) {
        int v4 = 64;
      }
      else {
        int v4 = 0;
      }
      *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 40) & 0xFFFFFFBF | v4;
      CFRelease(*(CFTypeRef *)(a1 + 120));
      int v5 = -[_PFContextMapTable initWithWeaksReferences:]([_PFContextMapTable alloc], a2 ^ 1u);
      *(void *)(a1 + 120) = v5;
      -[_PFContextMapTable setForUseWithCoordinator:](v5, [(id)a1 persistentStoreCoordinator]);
      CFRetain(*(CFTypeRef *)(a1 + 120));
      unint64_t v6 = *(void **)(a1 + 120);
    }
  }
}

- (void)setRetainsRegisteredObjects:(BOOL)retainsRegisteredObjects
{
  BOOL v3 = retainsRegisteredObjects;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__NSManagedObjectContext_setRetainsRegisteredObjects___block_invoke;
    v5[3] = &unk_1E544C770;
    v5[4] = self;
    BOOL v6 = retainsRegisteredObjects;
    [(NSManagedObjectContext *)self performBlockAndWait:v5];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    -[NSManagedObjectContext _setRetainsRegisteredObjects:]((uint64_t)self, v3);
  }
}

void __54__NSManagedObjectContext_setRetainsRegisteredObjects___block_invoke(uint64_t a1)
{
}

- (BOOL)retainsRegisteredObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)shouldDeleteInaccessibleFaults
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

void __33__NSManagedObjectContext_dealloc__block_invoke(uint64_t a1)
{
  id v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    id v2 = malloc_default_zone();
  }
  BOOL v3 = *(void **)(a1 + 32);

  malloc_zone_free(v2, v3);
}

- (uint64_t)_startObservingUndoManagerNotifications
{
  if (*(void *)(*(void *)(result + 168) + 40))
  {
    uint64_t v1 = result;
    id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = *MEMORY[0x1E4F28A60];
    uint64_t v4 = *(void *)(*(void *)(v1 + 168) + 40);
    return [v2 addObserver:v1 selector:sel__undoManagerCheckpoint_ name:v3 object:v4];
  }
  return result;
}

- (NSUndoManager)undoManager
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (NSUndoManager *)*((void *)self->_additionalPrivateIvars + 5);
}

- (BOOL)propagatesDeletesAtEndOfEvent
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setPropagatesDeletesAtEndOfEvent:(BOOL)propagatesDeletesAtEndOfEvent
{
  BOOL v3 = propagatesDeletesAtEndOfEvent;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__NSManagedObjectContext_setPropagatesDeletesAtEndOfEvent___block_invoke;
    v6[3] = &unk_1E544C770;
    v6[4] = self;
    BOOL v7 = propagatesDeletesAtEndOfEvent;
    [(NSManagedObjectContext *)self performBlockAndWait:v6];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v5);
  }
}

uint64_t __59__NSManagedObjectContext_setPropagatesDeletesAtEndOfEvent___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFFFFFFFD | (2 * *(unsigned __int8 *)(result + 40));
  return result;
}

- (BOOL)obtainPermanentIDsForObjects:(NSArray *)objects error:(NSError *)error
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if (!self->_parentObjectStore) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Context does not have a coordinator;  cannot obtain permenant ids without a coordinator.",
  }
                               0));
  BOOL v7 = (void *)*((void *)self->_additionalPrivateIvars + 19);
  if (!v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = [(NSArray *)objects countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(objects);
          }
          uint64_t v13 = *(id **)(*((void *)&v22 + 1) + 8 * i);
          if ([v13[5] isTemporaryID]
            && (NSManagedObjectContext *)[v13 managedObjectContext] == self
            && ([v13 isDeleted] & 1) == 0)
          {
            [v9 addObject:v13];
          }
        }
        uint64_t v10 = [(NSArray *)objects countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
    if (![v9 count])
    {

      return 1;
    }
    id v21 = 0;
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if (v14)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      char v8 = [self->_parentObjectStore _parentObtainPermanentIDsForObjects:v9 context:self error:error];
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);

      return v8;
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    id v16 = [(NSManagedObjectContext *)self persistentStoreCoordinator];
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    BOOL v17 = [(NSPersistentStoreCoordinator *)v16 obtainPermanentIDsForObjects:v9 error:&v21];
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);

    id v18 = v21;
    [v15 drain];
    if (!v21) {
      return v17;
    }
    id v19 = v21;
    if (error) {
      *error = (NSError *)v21;
    }
    return 0;
  }
  if (!error) {
    return 0;
  }
  char v8 = 0;
  *error = (NSError *)v7;
  return v8;
}

- (uint64_t)_handleError:(uint64_t *)a3 withError:
{
  if (a1) {
    +[NSManagedObjectContext _handleError:withError:]((uint64_t)NSManagedObjectContext, a2, a3);
  }
  return 0;
}

- (void)_thereIsNoSadnessLikeTheDeathOfOptimism
{
  if (a1)
  {
    objc_opt_class();
    _NSCoreDataLog(1, @"fatal: Unable to recover from optimistic locking failure.\n", v1, v2, v3, v4, v5, v6, vars0);
    __break(1u);
  }
}

- (uint64_t)_generateOptLockExceptionForConstraintFailure:(uint64_t)result
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if ([a2 code] == 1551)
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"Conflicts");
      uint64_t v4 = *MEMORY[0x1E4F1C3B8];
      uint64_t v11 = @"conflictList";
      uint64_t v12 = v3;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      uint64_t v6 = @"constraint validation failure";
      BOOL v7 = _NSCoreDataOptimisticLockingException;
      uint64_t v8 = v4;
    }
    else
    {
      id v9 = (__objc2_class *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v14[0] = a2;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      uint64_t v6 = @"Attempting to generate a constraint exception for non constraint error.";
      BOOL v7 = v9;
      uint64_t v8 = v10;
    }
    return [(__objc2_class *)v7 exceptionWithName:v8 reason:v6 userInfo:v5];
  }
  return result;
}

- (void)_advanceQueryGenerationForSave
{
  if (a1)
  {
    uint64_t v2 = [a1 _retainedCurrentQueryGeneration:a1[20]];
    if (v2)
    {
      [a1 _setQueryGenerationFromToken:v2 error:0];
      char v3 = 1;
      uint64_t v4 = (void *)v2;
    }
    else
    {
      char v3 = 0;
      uint64_t v4 = 0;
    }

    if ((v3 & 1) == 0) {
      objc_msgSend(a1, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"), 0);
    }
  }
}

uint64_t __39__NSManagedObjectContext_objectWithID___block_invoke(uint64_t result)
{
  uint64_t v1 = *(id **)(*(void *)(*(void *)(*(void *)(result + 32) + 32) + 168) + 8);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = [*v1 objectForKey:*(void *)(result + 40)];
    *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) = result;
  }
  return result;
}

uint64_t __39__NSManagedObjectContext_objectWithID___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(*(void *)(result + 32) + 32) + 168) + 8);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(v1 + 8) objectForKey:*(void *)(result + 40)];
    *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) = result;
  }
  return result;
}

- (uint64_t)_checkObjectForExistenceAndCacheRow:(uint64_t)a1
{
  uint64_t v4 = (void *)[(id)a2 objectID];
  int v5 = *(_DWORD *)(a2 + 16);
  if ([v4 isTemporaryID])
  {
    if (!*(void *)(a2 + 32) || (unsigned __int8 v6 = atomic_load((unsigned __int8 *)(a1 + 48)), (v6 & 1) == 0))
    {
      uint64_t v12 = 0;
      [(id)a1 stalenessInterval];
      return [(id)a2 isFault];
    }
  }
  uint64_t v12 = 0;
  [(id)a1 stalenessInterval];
  if ((v5 & 0x12) != 0) {
    return [(id)a2 isFault];
  }
  uint64_t v9 = v7;
  *(void *)(a1 + 144) = 0;
  -[NSManagedObjectContext lockObjectStore](a1);
  uint64_t v10 = (void *)[*(id *)(a1 + 32) newValuesForObjectWithID:v4 withContext:a1 error:&v12];
  if (v10)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(void *)(a1 + 144) = v9;

  -[NSManagedObjectContext unlockObjectStore](a1);
  return v8;
}

void *__59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (v1)
  {
    uint64_t result = objc_loadWeak((id *)(v1 + 8));
    if (result)
    {
      return (void *)[result _cancelProgress];
    }
  }
  return result;
}

uint64_t __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v31 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) executeRequest:*(void *)(a1 + 40) withContext:*(void *)(a1 + 32) error:&v31];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  if (!v4)
  {
    *(void *)(v3 + 40) = 0;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  id v5 = v4;
  id v6 = v31;

  [v2 drain];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v7) {
    id v8 = v7;
  }
  if (v31)
  {
    id v9 = v31;
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v10) {
      void *v10 = v31;
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = 0;
  }
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(v11 + 8) + 40))
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_4;
    id v19 = &unk_1E544C418;
    char v23 = *(unsigned char *)(a1 + 96);
    uint64_t v20 = *(void *)(a1 + 56);
    id v21 = v12;
    __int16 v24 = *(_WORD *)(a1 + 97);
    uint64_t v13 = *(void *)(a1 + 88);
    v22[1] = v11;
    v22[2] = v13;
    unsigned __int8 v14 = v22;
  }
  else
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_3;
    uint64_t v28 = &unk_1E544C3F0;
    v30[1] = *(void *)(a1 + 88);
    id v29 = v31;
    unsigned __int8 v14 = v30;
  }
  *unsigned __int8 v14 = *(void *)(a1 + 48);
  return objc_msgSend(v12, "performBlock:", v16, v17, v18, v19, v20, v21);
}

id __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_3(uint64_t a1)
{
  -[NSAsynchronousFetchResult setFinalResult:](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOperationError:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) completionBlock])
  {
    uint64_t v2 = [*(id *)(a1 + 40) completionBlock];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return v3;
}

id __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)NSArray_EmptyArray;
  }
  if (*(unsigned char *)(v1 + 72))
  {
    id v73 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v2 = [*(id *)(v1 + 32) predicate];
    unint64_t v70 = (void *)[*(id *)(v1 + 32) sortDescriptors];
    uint64_t v3 = (void *)[*(id *)(v1 + 32) affectedStores];
    uint64_t v4 = (void *)[*(id *)(v1 + 32) entity];
    if (objc_msgSend((id)objc_msgSend(v4, "subentitiesByName"), "count"))
    {
      int v76 = [*(id *)(v1 + 32) includesSubentities];
      if (v2)
      {
LABEL_6:
        id v74 = [+[_NSMemoryStorePredicateRemapper defaultInstance] createPredicateForFetchFromPredicate:v2 withContext:0];
        id v5 = v74;
LABEL_9:
        if (![v3 count]) {
          uint64_t v3 = 0;
        }
        callBacks.versiouint64_t n = *MEMORY[0x1E4F1D548];
        *(_OWORD *)&callBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
        id v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
        callBacks.hash = 0;
        callBacks.copyDescriptiouint64_t n = v6;
        callBacks.equal = 0;
        uint64_t v7 = [*(id *)(*(void *)(v1 + 40) + 56) count];
        id v8 = *(__CFSet **)(*(void *)(v1 + 40) + 96);
        uint64_t v75 = v1;
        if (v7)
        {
          if ([(__CFSet *)v8 count])
          {
            id v8 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            id v9 = *(void **)(*(void *)(v1 + 40) + 56);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v101 objects:v112 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v102;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v102 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  CFSetAddValue(v8, *(const void **)(*((void *)&v101 + 1) + 8 * i));
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v101 objects:v112 count:16];
              }
              while (v11);
            }
            long long v99 = 0u;
            long long v100 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            unsigned __int8 v14 = *(void **)(*(void *)(v75 + 40) + 96);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v97 objects:v111 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v98;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v98 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  CFSetAddValue(v8, *(const void **)(*((void *)&v97 + 1) + 8 * j));
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v97 objects:v111 count:16];
              }
              while (v16);
            }
            int v71 = 1;
          }
          else
          {
            int v71 = 0;
            id v8 = *(__CFSet **)(*(void *)(v1 + 40) + 56);
          }
        }
        else
        {
          int v71 = 0;
        }
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        uint64_t v19 = [(__CFSet *)v8 countByEnumeratingWithState:&v93 objects:v110 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          id v21 = 0;
          uint64_t v22 = *(void *)v94;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v94 != v22) {
                objc_enumerationMutation(v8);
              }
              __int16 v24 = *(void **)(*((void *)&v93 + 1) + 8 * k);
              uint64_t v25 = (void *)[v24 objectID];
              uint64_t v26 = v25;
              if (!v3
                || objc_msgSend(v3, "indexOfObjectIdenticalTo:", objc_msgSend(v25, "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v27 = [v24 entity];
                if ((void *)v27 == v4 || v76 && [v4 _subentitiesIncludes:v27])
                {
                  if (!v21) {
                    id v21 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:*(void *)(*(void *)(*(void *)(v75 + 56) + 8) + 40)];
                  }
                  int v28 = [v74 evaluateWithObject:v24];
                  if (*(unsigned char *)(v75 + 73)) {
                    id v29 = v24;
                  }
                  else {
                    id v29 = v26;
                  }
                  if (v28) {
                    [v21 addObject:v29];
                  }
                  else {
                    [v21 removeObject:v29];
                  }
                }
              }
            }
            uint64_t v20 = [(__CFSet *)v8 countByEnumeratingWithState:&v93 objects:v110 count:16];
          }
          while (v20);
        }
        else
        {
          id v21 = 0;
        }
        if (v71) {
          CFRelease(v8);
        }
        uint64_t v30 = [*(id *)(*(void *)(v75 + 40) + 72) count];
        uint64_t v31 = *(void *)(v75 + 40);
        uint64_t v32 = *(__CFSet **)(v31 + 80);
        if (v30)
        {
          if ([*(id *)(v31 + 80) count])
          {
            uint64_t v32 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &callBacks);
            long long v89 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            uint64_t v33 = *(void **)(*(void *)(v75 + 40) + 72);
            uint64_t v34 = [v33 countByEnumeratingWithState:&v89 objects:v109 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v90;
              do
              {
                for (uint64_t m = 0; m != v35; ++m)
                {
                  if (*(void *)v90 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  CFSetAddValue(v32, *(const void **)(*((void *)&v89 + 1) + 8 * m));
                }
                uint64_t v35 = [v33 countByEnumeratingWithState:&v89 objects:v109 count:16];
              }
              while (v35);
            }
            long long v87 = 0u;
            long long v88 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v38 = *(void **)(*(void *)(v75 + 40) + 80);
            uint64_t v39 = [v38 countByEnumeratingWithState:&v85 objects:v108 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v41 = *(void *)v86;
              do
              {
                for (uint64_t n = 0; n != v40; ++n)
                {
                  if (*(void *)v86 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  CFSetAddValue(v32, *(const void **)(*((void *)&v85 + 1) + 8 * n));
                }
                uint64_t v40 = [v38 countByEnumeratingWithState:&v85 objects:v108 count:16];
              }
              while (v40);
            }
            int v72 = 1;
          }
          else
          {
            int v72 = 0;
            uint64_t v32 = *(__CFSet **)(*(void *)(v75 + 40) + 72);
          }
        }
        else
        {
          int v72 = 0;
        }
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        uint64_t v43 = [(__CFSet *)v32 countByEnumeratingWithState:&v81 objects:v107 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v82;
          do
          {
            for (iuint64_t i = 0; ii != v44; ++ii)
            {
              if (*(void *)v82 != v45) {
                objc_enumerationMutation(v32);
              }
              long long v47 = *(void **)(*((void *)&v81 + 1) + 8 * ii);
              uint64_t v48 = (void *)[v47 objectID];
              long long v49 = v48;
              if (v3)
              {
                uint64_t v50 = [v48 persistentStore];
                if (!v50 || [v3 indexOfObjectIdenticalTo:v50] == 0x7FFFFFFFFFFFFFFFLL) {
                  continue;
                }
              }
              uint64_t v51 = [v47 entity];
              if ((void *)v51 == v4 || v76 && [v4 _subentitiesIncludes:v51])
              {
                if ([v74 evaluateWithObject:v47])
                {
                  if (!v21) {
                    id v21 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:*(void *)(*(void *)(*(void *)(v75 + 56) + 8) + 40)];
                  }
                  if (*(unsigned char *)(v75 + 73)) {
                    long long v52 = v47;
                  }
                  else {
                    long long v52 = v49;
                  }
                  [v21 addObject:v52];
                }
              }
            }
            uint64_t v44 = [(__CFSet *)v32 countByEnumeratingWithState:&v81 objects:v107 count:16];
          }
          while (v44);
        }
        if (v72) {
          CFRelease(v32);
        }
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        uint64_t v1 = v75;
        uint64_t v53 = *(void **)(*(void *)(v75 + 40) + 88);
        uint64_t v54 = [v53 countByEnumeratingWithState:&v77 objects:v106 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v78;
          do
          {
            for (juint64_t j = 0; jj != v55; ++jj)
            {
              if (*(void *)v78 != v56) {
                objc_enumerationMutation(v53);
              }
              int v58 = *(void **)(*((void *)&v77 + 1) + 8 * jj);
              if (!v3
                || objc_msgSend(v3, "indexOfObjectIdenticalTo:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * jj), "objectID"), "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v59 = [v58 entity];
                if ((void *)v59 == v4 || v76 && [v4 _subentitiesIncludes:v59])
                {
                  if (!v21) {
                    id v21 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:*(void *)(*(void *)(*(void *)(v75 + 56) + 8) + 40)];
                  }
                  if (!*(unsigned char *)(v75 + 73)) {
                    int v58 = (void *)[v58 objectID];
                  }
                  [v21 removeObject:v58];
                }
              }
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v77 objects:v106 count:16];
          }
          while (v55);
        }
        if (v21)
        {
          uint64_t v60 = (void *)[v21 allObjects];
          if ([v70 count] && *(unsigned char *)(v75 + 73) && *(unsigned char *)(v75 + 74)) {
            uint64_t v60 = (void *)[v60 sortedArrayUsingDescriptors:v70];
          }

          *(void *)(*(void *)(*(void *)(v75 + 56) + 8) + 40) = v60;
        }
        [v73 drain];
        goto LABEL_119;
      }
    }
    else
    {
      int v76 = 0;
      if (v2) {
        goto LABEL_6;
      }
    }
    id v74 = (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
    goto LABEL_9;
  }
LABEL_119:
  unint64_t v61 = [*(id *)(v1 + 32) fetchLimit];
  if (v61)
  {
    unint64_t v62 = v61;
    if ([*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) count] > v61)
    {
      id v63 = (id)objc_msgSend(*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40), "subarrayWithRange:", 0, v62);

      *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) = v63;
    }
  }
  uint64_t v64 = [*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) progress];
  if (v64)
  {
    long long v65 = (void *)v64;
    uint64_t v66 = [*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) count];
    uint64_t v67 = [v65 completedUnitCount];
    [v65 setTotalUnitCount:v66];
    if (v67 != v66) {
      objc_msgSend(v65, "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40), "count"));
    }
  }
  -[NSAsynchronousFetchResult setFinalResult:](*(void *)(*(void *)(*(void *)(v1 + 64) + 8) + 40), *(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40));
  [*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) setOperationError:0];
  if ([*(id *)(v1 + 48) completionBlock])
  {
    uint64_t v68 = [*(id *)(v1 + 48) completionBlock];
    (*(void (**)(uint64_t, void))(v68 + 16))(v68, *(void *)(*(void *)(*(void *)(v1 + 64) + 8) + 40));
  }
  return *(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40);
}

- (void)rollback
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  [(NSManagedObjectContext *)self discardEditing];
  BOOL v3 = [(NSManagedObjectContext *)self propagatesDeletesAtEndOfEvent];
  [(NSManagedObjectContext *)self setPropagatesDeletesAtEndOfEvent:0];
  [(NSManagedObjectContext *)self processPendingChanges];

  *self->_additionalPrivateIvars = 0;
  if ([(NSMutableSet *)self->_changedObjects count]
    || [(NSMutableSet *)self->_insertedObjects count]
    || [(NSMutableSet *)self->_deletedObjects count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_changedObjects];
    [v6 unionSet:self->_deletedObjects];
    unint64_t v7 = [v6 count];
    unint64_t v8 = v7;
    if (v7 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v7;
    }
    if (v7 >= 0x201) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v11 = (char *)v26 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v7 >= 0x201) {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v26 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v9);
    }
    [v6 getObjects:v11];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v13 = *(void **)&v11[8 * i];
        unsigned __int8 v14 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)self, v13);
        if (v14)
        {
          -[NSManagedObject _updateFromSnapshot:]((uint64_t)v13, v14);
          [v13 awakeFromSnapshotEvents:16];
        }
      }
      if (v8 >= 0x201) {
        NSZoneFree(0, v11);
      }
    }

    uint64_t v15 = (void *)[(NSMutableSet *)self->_changedObjects allObjects];
    uint64_t v16 = (void *)[(NSMutableSet *)self->_insertedObjects allObjects];
    uint64_t v17 = [v16 count];
    if (v17)
    {
      for (uint64_t j = 0; j != v17; ++j)
        -[NSManagedObjectContext deleteObject:](self, "deleteObject:", [v16 objectAtIndex:j]);
    }
    uint64_t v19 = (void *)[(NSMutableSet *)self->_deletedObjects allObjects];
    uint64_t v20 = [v19 count];
    if (v20)
    {
      for (uint64_t k = 0; k != v20; ++k)
        -[NSManagedObjectContext insertObject:](self, "insertObject:", [v19 objectAtIndex:k]);
    }
    if ([v15 count])
    {
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v15];
      [v5 setObject:v22 forKey:@"updated"];
    }
    if ([v16 count])
    {
      char v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
      [v5 setObject:v23 forKey:@"deleted"];
    }
    if ([v19 count])
    {
      __int16 v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v19];
      [v5 setObject:v24 forKey:@"inserted"];
    }
    id v25 = 0;
    if ([v5 count])
    {
      if (byte_1EB270AB6) {
        objc_msgSend(v5, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), @"managedObjectContext");
      }
      -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v5);
    }

    [v4 drain];
    [(NSManagedObjectContext *)self processPendingChanges];
    -[NSManagedObjectContext _resetAllChanges](self);
    [(NSManagedObjectContext *)self setPropagatesDeletesAtEndOfEvent:v3];
  }
  else
  {
    [(NSManagedObjectContext *)self setPropagatesDeletesAtEndOfEvent:v3];
  }
}

- (void)undo
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  [(NSManagedObjectContext *)self discardEditing];
  if (*((void *)self->_additionalPrivateIvars + 5))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [self->_additionalPrivateIvars[5] undo];
    [v3 drain];
  }
}

- (void)redo
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  [(NSManagedObjectContext *)self discardEditing];
  if (*((void *)self->_additionalPrivateIvars + 5))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [self->_additionalPrivateIvars[5] redo];
    [v3 drain];
  }
}

- (NSManagedObjectContext)initWithCoder:(id)a3
{
  objc_opt_class();
  v19.receiver = self;
  v19.super_class = (Class)NSManagedObjectContext;
  id v5 = [(NSManagedObjectContext *)&v19 init];
  if (v5)
  {
    int v6 = [a3 decodeIntForKey:@"NSConcurrencyType"];
    int v7 = v6;
    if (v6 == 2)
    {
      char v9 = 3;
    }
    else if (v6 == 1)
    {
      char v9 = 2;
    }
    else
    {
      char v9 = !v6
        && (byte_1EB2706B4 & 1) == 0
        && (current_queue = dispatch_get_current_queue(), pthread_main_np())
        && (current_queue == dispatch_get_global_queue(0, 0) || current_queue == MEMORY[0x1E4F14428]);
    }
    uint64_t v10 = -[NSManagedObjectContext _initWithParentObjectStore:](v5, v9);
    if (v5 == (void *)v10 || (uint64_t v11 = (void *)v10, v5, (v5 = v11) != 0))
    {
      if (v7 == 2)
      {
        uint64_t v13 = MEMORY[0x1E4F14428];
        v5[3] = MEMORY[0x1E4F14428];
        if (!dispatch_queue_get_specific(v13, "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
        {
          unsigned __int8 v14 = objc_opt_class();
          dispatch_queue_set_specific(MEMORY[0x1E4F14428], "com.apple.CoreData.NSManagedObjectContext.mainQueue", v14, 0);
          uint64_t v13 = v5[3];
        }
        dispatch_retain(v13);
        unsigned int v12 = v5[5] & 0xFFF7FFFF;
      }
      else
      {
        if (v7 != 1)
        {
LABEL_22:
          atomic_store(0, v5 + 1);
          [a3 decodeFloatForKey:@"NSFetchTimestamp"];
          *((double *)v5 + 18) = v15;
          if ([a3 decodeBoolForKey:@"NSRetainsRegisteredObjects"]) {
            int v16 = 64;
          }
          else {
            int v16 = 0;
          }
          *((_DWORD *)v5 + 10) = v5[5] & 0xFFFFFFBF | v16;
          if ([a3 decodeBoolForKey:@"NSPropagatesDeleted"]) {
            int v17 = 2;
          }
          else {
            int v17 = 0;
          }
          *((_DWORD *)v5 + 10) = v5[5] & 0xFFFFFFFD | v17;
          objc_msgSend(v5, "setMergePolicy:", objc_msgSend(a3, "decodeObjectForKey:", @"NSMergePolicy"));
          return (NSManagedObjectContext *)v5;
        }
        v5[3] = createQueueForMOC(v5);
        unsigned int v12 = *((_DWORD *)v5 + 10) | 0x80000;
      }
      *((_DWORD *)v5 + 10) = v12;
      goto LABEL_22;
    }
  }
  return (NSManagedObjectContext *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  double fetchTimestamp = self->_fetchTimestamp;
  *(float *)&double fetchTimestamp = fetchTimestamp;
  [a3 encodeFloat:@"NSFetchTimestamp" forKey:fetchTimestamp];
  [a3 encodeBool:(*(_DWORD *)&self->_flags >> 6) & 1 forKey:@"NSRetainsRegisteredObjects"];
  [a3 encodeBool:(*(_DWORD *)&self->_flags >> 1) & 1 forKey:@"NSPropagatesDeleted"];
  objc_msgSend(a3, "encodeObject:forKey:", -[NSManagedObjectContext mergePolicy](self, "mergePolicy"), @"NSMergePolicy");
  NSManagedObjectContextConcurrencyType v6 = [(NSManagedObjectContext *)self concurrencyType];

  [a3 encodeInt:v6 forKey:@"NSConcurrencyType"];
}

- (void)detectConflictsForObject:(NSManagedObject *)object
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object) {
      goto LABEL_6;
    }
  }
  else if (!object)
  {
    goto LABEL_6;
  }
  if ((object->_cd_stateFlags & 0x80) == 0)
  {
    cd_managedObjectContext = object->_cd_managedObjectContext;
    goto LABEL_7;
  }
LABEL_6:
  cd_managedObjectContext = 0;
LABEL_7:
  if (cd_managedObjectContext == self)
  {
    if ([(NSManagedObject *)object isFault]) {
      -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, object, (uint64_t)self);
    }
    lockedObjects = self->_lockedObjects;
    [(NSMutableSet *)lockedObjects addObject:object];
  }
  else if (cd_managedObjectContext)
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"An NSManagedObjectContext cannot detect conflicts for objects in other contexts." userInfo:0]);
  }
}

unsigned __int8 *__43__NSManagedObjectContext_setParentContext___block_invoke(uint64_t a1)
{
  return -[NSManagedObjectContext _setParentContext:](*(unsigned __int8 **)(a1 + 32), *(void **)(a1 + 40));
}

void __34__NSManagedObjectContext_setName___block_invoke_2(uint64_t a1)
{
}

- (id)_retainedCurrentQueryGeneration:(id)a3
{
  if (self->_parentObjectStore)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isParentStoreContext);
    if ((v3 & 1) == 0)
    {
      id parentObjectStore = self->_parentObjectStore;
      return (id)[parentObjectStore _retainedCurrentQueryGeneration:a3];
    }
    id v6 = +[NSQueryGenerationToken unpinnedQueryGenerationToken];
  }
  else
  {
    id v6 = +[NSQueryGenerationToken nostoresQueryGenerationToken];
  }

  return v6;
}

- (id)_changeTrackingToken__
{
  id v2 = self->_additionalPrivateIvars[15];

  return v2;
}

- (void)objectDidBeginEditing:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  CFArrayRef v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v5)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    CFArrayRef v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }
  v7.length = CFArrayGetCount(v5);
  v7.locatiouint64_t n = 0;
  if (CFArrayGetFirstIndexOfValue(v5, v7, a3) == -1)
  {
    CFArrayAppendValue(v5, a3);
    if ((*((unsigned char *)&self->_flags + 1) & 0x20) == 0 && CFArrayGetCount(v5) >= 1)
    {
      [(NSManagedObjectContext *)self willChangeValueForKey:@"isEditing"];
      *(_DWORD *)&self->_flags |= 0x2000u;
      [(NSManagedObjectContext *)self didChangeValueForKey:@"isEditing"];
    }
  }
}

- (void)objectDidEndEditing:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  CFArrayRef v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v5)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    CFArrayRef v5 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }
  v8.length = CFArrayGetCount(v5);
  v8.locatiouint64_t n = 0;
  FirstIndexOfid Value = CFArrayGetFirstIndexOfValue(v5, v8, a3);
  if (FirstIndexOfValue != -1)
  {
    CFArrayRemoveValueAtIndex(v5, FirstIndexOfValue);
    if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0 && !CFArrayGetCount(v5))
    {
      [(NSManagedObjectContext *)self willChangeValueForKey:@"isEditing"];
      *(_DWORD *)&self->_flags &= ~0x2000u;
      [(NSManagedObjectContext *)self didChangeValueForKey:@"isEditing"];
    }
  }
}

- (BOOL)commitEditingAndReturnError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(NSManagedObjectContext *)self commitEditing];
  if (!v4)
  {
    CFArrayRef v5 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:0];
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
    }
    else
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
      uint64_t v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v16 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
        __int16 v17 = 1024;
        int v18 = 4598;
        _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v4;
}

- (BOOL)commitEditing
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  CFArrayRef v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (!v3)
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    CFArrayRef v3 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  }
  if ([(NSManagedObjectContext *)self isEditing]
    && (Count = CFArrayGetCount(v3), CFIndex v5 = Count - 1, Count >= 1))
  {
    do
    {
      int v6 = objc_msgSend((id)CFArrayGetValueAtIndex(v3, v5), "commitEditing");
      BOOL v8 = v5-- != 0;
    }
    while (v6 && v8);
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (uint64_t)_sendCommitEditingSelectorToTarget:(uint64_t)a3 sender:(uint64_t)a4 selector:(char)a5 flag:(uint64_t)a6 contextInfo:(int)a7 delayed:
{
  uint64_t v13 = a3;
  char v12 = a5;
  uint64_t v11 = a6;
  if (result)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA18], "invocationWithMethodSignature:", objc_msgSend(a2, "methodSignatureForSelector:", a4));
    [v10 setSelector:a4];
    [v10 setArgument:&v13 atIndex:2];
    [v10 setArgument:&v12 atIndex:3];
    [v10 setArgument:&v11 atIndex:4];
    if (a7) {
      return objc_msgSend(v10, "performSelector:withObject:afterDelay:inModes:", sel_invokeWithTarget_, a2, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", *MEMORY[0x1E4F1D410]), 0.0);
    }
    else {
      return [v10 invokeWithTarget:a2];
    }
  }
  return result;
}

- (void)commitEditingWithDelegate:(id)a3 didCommitSelector:(SEL)a4 contextInfo:(void *)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  uint64_t v9 = PF_CALLOC_SCANNED_BYTES(0x18uLL);
  void *v9 = a3;
  v9[1] = a4;
  v9[2] = a5;

  -[NSManagedObjectContext _sendCommitEditingSelectorToTarget:sender:selector:flag:contextInfo:delayed:]((uint64_t)self, self, 0, (uint64_t)sel__managedObjectContextEditor_didCommit_contextInfo_, 1, (uint64_t)v9, 1);
}

- (void)_managedObjectContextEditor:(id)a3 didCommit:(BOOL)a4 contextInfo:(id *)a5
{
  BOOL v6 = a4;
  CFArrayRef v8 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
  if (v8)
  {
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    *((void *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    CFArrayRef v8 = (const __CFArray *)*((void *)self->_additionalPrivateIvars + 4);
    if (!v6)
    {
LABEL_10:
      -[NSManagedObjectContext _sendCommitEditingSelectorToTarget:sender:selector:flag:contextInfo:delayed:]((uint64_t)self, a5->var0, (uint64_t)self, (uint64_t)a5->var1, v6, (uint64_t)a5->var2, 0);
      uint64_t v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        uint64_t v11 = malloc_default_zone();
      }
      malloc_zone_free(v11, a5);
      return;
    }
  }
  if (![(NSManagedObjectContext *)self isEditing]) {
    goto LABEL_10;
  }
  CFIndex Count = CFArrayGetCount(v8);
  if (Count < 1) {
    goto LABEL_10;
  }
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, Count - 1);

  [ValueAtIndex commitEditingWithDelegate:self didCommitSelector:sel__managedObjectContextEditor_didCommit_contextInfo_ contextInfo:a5];
}

- (void)_forceMoveInsertToUpdatedList:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      a2[4] &= 0xFFFFFFED;
    }
    [*(id *)(a1 + 72) removeObject:a2];
    [*(id *)(a1 + 80) removeObject:a2];
    _PFFastMOCObjectWillChange(a1, a2);
  }
}

- (void)_newUnchangedLockedObjects
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 104) count];
  CFArrayRef v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v2];
  MEMORY[0x1F4188790](v3);
  BOOL v6 = (id *)((char *)v11 - v5);
  if ((unint64_t)v2 > 0x200) {
    BOOL v6 = (id *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v11 - v5, 8 * v4);
  }
  [*(id *)(a1 + 104) getObjects:v6];
  if (v2 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v2;
    do
    {
      uint64_t v9 = *v7;
      if (([*v7 hasChanges] & 1) == 0)
      {
        [v3 addObject:v9];
        if ((v9[17] & 0x80) != 0) {
          -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, v9, a1);
        }
      }
      ++v7;
      --v8;
    }
    while (v8);
  }
  if ((unint64_t)v2 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return v3;
}

- (void)_unlimitRequest:(void *)a1
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)objc_msgSend((id)objc_msgSend(a1, "substitutionVariables"), "mutableCopy");
    objc_msgSend(v2, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", 0), @"FETCH_REQUEST_LIMIT_SUBSTITUTION");
    [a1 setSubstitutionVariables:v2];
  }
  else
  {
    [a1 setFetchLimit:0];
  }
}

- (void)_forceRegisterLostFault:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)[a2 objectID];
    id Value = _PFCMT_GetValue(*(void **)(a1 + 120), v4);
    if (Value) {
      BOOL v6 = Value == a2;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      -[NSManagedObjectContext _registerObject:withID:](a1, (uint64_t)a2, v4);
    }
    else
    {
      [a2 managedObjectContext];
      _NSCoreDataLog(1, @"fatal: Failed to re-registered lost fault. fault %p with oid %@ has a moc of %p but we expected %p\n", v7, v8, v9, v10, v11, v12, (uint64_t)a2);
      __break(1u);
    }
  }
}

+ (uint64_t)_handleError:(uint64_t *)a3 withError:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self;
  if (!a3) {
    return 0;
  }
  uint64_t v5 = (void *)[a2 userInfo];
  uint64_t v6 = [v5 objectForKey:@"NSCoreDataPrimaryError"];
  if (v6)
  {
    *a3 = v6;
    return 0;
  }
  uint64_t v7 = (void *)[v5 mutableCopy];
  if (v7)
  {
    uint64_t v8 = v7;
    [v7 setObject:a2 forKey:@"NSUnderlyingException"];
    if (a2) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a2, @"NSUnderlyingException", 0);
    if (a2)
    {
LABEL_6:
      if (a2[5]) {
        uint64_t v9 = a2[5];
      }
      else {
        uint64_t v9 = 134060;
      }
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
LABEL_9:
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:v9 userInfo:v8];
  if (v10)
  {
    *a3 = v10;
  }
  else
  {
    uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
    int v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
      __int16 v22 = 1024;
      int v23 = 6271;
      _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }

  return 0;
}

- (id)_retainedObjectsFromRemovedStore:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  unint64_t v6 = Count;
  if (Count <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = Count;
  }
  if (Count >= 0x201) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = (const void **)((char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (Count > 0x200) {
    uint64_t v9 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v7);
  }
  unint64_t v10 = -[_PFContextMapTable getAllObjects:]((unint64_t)self->_infoByGID, v9);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  if (v10)
  {
    uint64_t v12 = (id *)v9;
    do
    {
      id v13 = *v12;
      if ((id)objc_msgSend((id)objc_msgSend(*v12, "objectID"), "persistentStore") == a3) {
        [v11 addObject:v13];
      }
      ++v12;
      --v10;
    }
    while (v10);
  }
  if (v6 >= 0x201) {
    NSZoneFree(0, v9);
  }
  return v11;
}

- (void)_setDisableDiscardEditing:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)_disableDiscardEditing
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (void)_persistentStoreDidUpdateAdditionalRows:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a2 count];
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = [a2 objectAtIndex:i];
        uint64_t v7 = (_DWORD *)[a1 objectRegisteredForID:v6];
        if (v7)
        {
          uint64_t v8 = v7;
          if ([v7 hasChanges]) {
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Objects should not be both modified and additional" userInfo:0]);
          }
          int v9 = v8[4];
          if ((v9 & 0x200) == 0) {
            v8[4] = v9 | 0x200;
          }
          [a1 refreshObject:v8 mergeChanges:0];
        }
        else
        {
          [v10 addObject:v6];
        }
      }
    }
    if ([v10 count]) {
      -[NSManagedObjectContext _informParentStoreNoLongerInterestedInObjectIDs:generation:]((uint64_t)a1, v10, [a1 queryGenerationToken]);
    }
  }
}

- (void)_setFaultingError:(id)a3
{
  if (self->_additionalPrivateIvars[19] != a3)
  {
    id v5 = a3;

    *((void *)self->_additionalPrivateIvars + 19) = a3;
  }
}

- (void)_undoInsertions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self) {
    ++self->_ignoreChangeNotification;
  }
  id v5 = (void *)[a3 objectAtIndex:0];
  uint64_t v6 = (void *)[a3 objectAtIndex:1];
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      id v10 = (NSManagedObject *)[v5 objectAtIndex:i];
      uint64_t v11 = (void *)[v6 objectAtIndex:i];
      if (![(NSManagedObject *)v10 managedObjectContext]) {
        id v10 = [(NSManagedObjectContext *)self objectWithID:[(NSManagedObject *)v10 objectID]];
      }
      if (v11 != NSKeyValueCoding_NullValue) {
        -[NSManagedObject _updateFromUndoSnapshot:](v10, v11);
      }
      [(NSManagedObjectContext *)self deleteObject:v10];
    }
  }
  if (self) {
    --self->_ignoreChangeNotification;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * j) awakeFromSnapshotEvents:2];
      }
      uint64_t v13 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)_undoDeletionsMovedToUpdates:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = (void *)[a3 objectAtIndex:i];
      [(NSManagedObjectContext *)self deleteObject:v8];
      [v8 awakeFromSnapshotEvents:4];
    }
  }
}

- (void)_undoDeletions:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self) {
    ++self->_ignoreChangeNotification;
  }
  uint64_t v5 = (void *)[a3 objectAtIndex:0];
  uint64_t v6 = (void *)[a3 objectAtIndex:1];
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "objectAtIndex:", 0), "objectAtIndex:", 0);
  id v25 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "objectAtIndex:", 1);
  uint64_t v8 = (void *)[a3 objectAtIndex:3];
  if (v7 == NSKeyValueCoding_NullValue) {
    int v9 = 0;
  }
  else {
    int v9 = (void *)v7;
  }
  int undoTransactionID = (unsigned __int16)self->_undoTransactionID;
  if (undoTransactionID == (unsigned __int16)[v8 shortValue]) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v11) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v12 = 0;
  }
  uint64_t v13 = [v5 count];
  if (!v13) {
    goto LABEL_30;
  }
  uint64_t v14 = v13;
  uint64_t v24 = v12;
  for (uint64_t i = 0; i != v14; ++i)
  {
    long long v16 = (_DWORD *)objc_msgSend(v5, "objectAtIndex:", i, v24);
    long long v17 = (void *)[v6 objectAtIndex:i];
    if (v11) {
      uint64_t v18 = [v11 objectAtIndex:i];
    }
    else {
      uint64_t v18 = 0;
    }
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)v16, (void *)[v16 objectID]);
    if (v17 != NSKeyValueCoding_NullValue)
    {
      -[NSManagedObject _updateFromUndoSnapshot:](v16, v17);
      long long v17 = (void *)[v25 objectAtIndex:i];
      if ((void *)NSKeyValueCoding_NullValue != v17)
      {
        -[NSManagedObject _setLastSnapshot__:](v16, v17);
        long long v17 = NSKeyValueCoding_NullValue;
      }
    }
    if (v18 && (void *)v18 != v17 && (objc_msgSend((id)objc_msgSend(v16, "objectID"), "isTemporaryID") & 1) == 0)
    {
      if (v16)
      {
        v16[4] &= 0xFFFFFFDB;
        [(NSMutableSet *)self->_unprocessedDeletes removeObject:v16];
        [(NSMutableSet *)self->_deletedObjects removeObject:v16];
        v16[4] &= 0xFFFFFFED;
      }
      else
      {
        [(NSMutableSet *)self->_unprocessedDeletes removeObject:0];
        [(NSMutableSet *)self->_deletedObjects removeObject:0];
      }
      [(NSMutableSet *)self->_unprocessedInserts removeObject:v16];
      _PFFastMOCObjectWillChange((uint64_t)self, v16);
      [v24 addObject:v16];
    }
  }
  id v12 = v24;
  if (self) {
LABEL_30:
  }
    --self->_ignoreChangeNotification;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * j) awakeFromSnapshotEvents:4];
      }
      uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }
  if ([v12 count])
  {
    [self->_additionalPrivateIvars[5] registerUndoWithTarget:self selector:sel__undoDeletionsMovedToUpdates_ object:v12];
    int v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:](self, v23, 0, 0, 0, 0, 0);
  }
}

- (void)_undoUpdates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self) {
    ++self->_ignoreChangeNotification;
  }
  uint64_t v5 = (void *)[a3 objectAtIndex:0];
  uint64_t v6 = (void *)[a3 objectAtIndex:1];
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      id v10 = (NSManagedObject *)[v5 objectAtIndex:i];
      uint64_t v11 = (void *)[v6 objectAtIndex:i];
      if (![(NSManagedObject *)v10 managedObjectContext]) {
        id v10 = [(NSManagedObjectContext *)self objectWithID:[(NSManagedObject *)v10 objectID]];
      }
      if (v11 != NSKeyValueCoding_NullValue)
      {
        _PFFastMOCObjectWillChange((uint64_t)self, v10);
        -[NSManagedObject _updateFromUndoSnapshot:](v10, v11);
      }
    }
  }
  if (self) {
    --self->_ignoreChangeNotification;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * j) awakeFromSnapshotEvents:8];
      }
      uint64_t v13 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)_forceInsertionForObject:(id)a3
{
  if (a3)
  {
    int v5 = *((_DWORD *)a3 + 4);
    if ((v5 & 0x24) != 0)
    {
      [(NSMutableSet *)self->_unprocessedDeletes removeObject:a3];
      [(NSMutableSet *)self->_deletedObjects removeObject:a3];
      int v5 = *((_DWORD *)a3 + 4);
    }
    if ((v5 & 9) != 0)
    {
      [(NSMutableSet *)self->_unprocessedChanges removeObject:a3];
      [(NSMutableSet *)self->_changedObjects removeObject:a3];
      int v5 = *((_DWORD *)a3 + 4);
    }
    *((_DWORD *)a3 + 4) = v5 & 0xFFFFFFC0;
  }
  uint64_t v6 = (void *)[a3 objectID];
  -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)a3, v6);
  [(NSMutableSet *)self->_insertedObjects addObject:a3];
  if (a3) {
    *((_DWORD *)a3 + 4) |= 0x10u;
  }
  id v7 = *self->_additionalPrivateIvars;
  if (v7)
  {
    [v7 removeObject:v6];
  }
}

- (void)_clearChangedThisTransaction:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
  int v5 = (void *)[a3 objectAtIndex:0];
  int undoTransactionID = (unsigned __int16)self->_undoTransactionID;
  if (undoTransactionID == (unsigned __int16)[v5 shortValue])
  {
    id v7 = (void *)[a3 objectAtIndex:1];
    uint64_t v8 = [(NSMutableSet *)self->_changedObjects count];
    if (v8)
    {
      unint64_t v9 = v8;
      unint64_t v10 = MEMORY[0x1F4188790](v8);
      uint64_t v12 = (char *)v16 - v11;
      if (v10 > 0x200) {
        uint64_t v12 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v16 - v11, 8 * v10);
      }
      [(NSMutableSet *)self->_changedObjects getObjects:v12];
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v14 = *(void *)&v12[8 * i];
        if (([v7 containsObject:v14] & 1) == 0)
        {
          if (v14) {
            *(_DWORD *)(v14 + 16) &= ~8u;
          }
          [(NSMutableSet *)self->_changedObjects removeObject:v14];
        }
      }
      if (v9 >= 0x201) {
        NSZoneFree(0, v12);
      }
    }
  }
  *(_DWORD *)&self->_flags &= ~0x20u;
  BOOL v15 = [(NSMutableSet *)self->_insertedObjects count]
     || [(NSMutableSet *)self->_unprocessedInserts count]
     || [(NSMutableSet *)self->_deletedObjects count]
     || [(NSMutableSet *)self->_unprocessedDeletes count]
     || [(NSMutableSet *)self->_changedObjects count]
     || [(NSMutableSet *)self->_unprocessedChanges count] != 0;
  if (((*(_DWORD *)&self->_flags >> 10) & 1) != v15)
  {
    [(NSManagedObjectContext *)self willChangeValueForKey:@"hasChanges"];
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | (v15 << 10));
    [(NSManagedObjectContext *)self didChangeValueForKey:@"hasChanges"];
  }
}

- (void)_undoManagerCheckpoint:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 1) & 8) == 0)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, sel__processEndOfEventNotification_);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    id v7 = __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke;
    uint64_t v8 = &unk_1E544B868;
    unint64_t v9 = self;
    dispatchQueue = self->_dispatchQueue;
    BOOL v5 = [(NSManagedObjectContext *)self tryLock];
    if (!dispatchQueue)
    {
      if (!v5) {
        return;
      }
      v7((uint64_t)v6);
      goto LABEL_9;
    }
    if (v5)
    {
      [(NSManagedObjectContext *)self performBlockAndWait:v6];
LABEL_9:
      [(NSManagedObjectContext *)self unlock];
      return;
    }
    [(NSManagedObjectContext *)self performBlock:v6];
  }
}

uint64_t __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result && !*(_DWORD *)(result + 16))
  {
    uint64_t result = [(id)result _isDeallocating];
    if ((result & 1) == 0)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      [*(id *)(a1 + 32) processPendingChanges];
      [v3 drain];
      return (uint64_t)0;
    }
  }
  return result;
}

- (BOOL)shouldRefreshAfterSave
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (void)setShouldPerformSecureOperation:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __74__NSManagedObjectContext__NSCoreDataSPI__setShouldPerformSecureOperation___block_invoke;
    v6[3] = &unk_1E544C770;
    v6[4] = self;
    BOOL v7 = a3;
    [(NSManagedObjectContext *)self performBlockAndWait:v6];
  }
  else
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    }
    if (v3) {
      int v5 = 0x2000000;
    }
    else {
      int v5 = 0;
    }
    self->__managedObjectContextFlags flags = (_managedObjectContextFlags)(*(_DWORD *)&self->_flags & 0xFDFFFFFF | v5);
  }
}

uint64_t __74__NSManagedObjectContext__NSCoreDataSPI__setShouldPerformSecureOperation___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFDFFFFFF | (*(unsigned __int8 *)(result + 40) << 25);
  return result;
}

- (BOOL)shouldPerformSecureOperation
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (id)performBlockWithResult:(id)a3
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  unint64_t v9 = __Block_byref_object_copy__12;
  unint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__NSManagedObjectContext__NSCoreDataSPI__performBlockWithResult___block_invoke;
  v5[3] = &unk_1E544C5C0;
  v5[4] = a3;
  void v5[5] = &v6;
  [(NSManagedObjectContext *)self performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __65__NSManagedObjectContext__NSCoreDataSPI__performBlockWithResult___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v2;
}

- (id)_orderedSetWithResultsFromFetchRequest:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  int v5 = [[_PFFetchedResultOrderedSetWrapper alloc] initWithArray:a3 andContext:self];

  return v5;
}

- (void)_stopConflictDetectionForObject:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  lockedObjects = self->_lockedObjects;

  [(NSMutableSet *)lockedObjects removeObject:a3];
}

- (void)_mergeChangesFromRemoteContextSave:(id)a3 presupposingQueryGeneration:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(NSManagedObjectContext *)self persistentStoreCoordinator])
  {
    v7[0] = self;
    +[NSManagedObjectContext _mergeChangesFromRemoteContextSave:intoContexts:withClientQueryGeneration:]((uint64_t)NSManagedObjectContext, a3, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1], (uint64_t)a4);
  }
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      -[NSManagedObjectContext _coreMergeChangesFromDidSaveDictionary:usingObjectIDs:withClientQueryGeneration:]((uint64_t)v3, *(void **)(a1 + 40), 1, v4);
    }
    else {
      [v3 _mergeChangesFromDidSaveDictionary:*(void *)(a1 + 40) usingObjectIDs:1];
    }
  }
  [v2 drain];
  uint64_t v5 = *(void *)(a1 + 32);

  -[NSManagedObjectContext _processReferenceQueue:](v5, 0);
}

- (void)_mergeChangesFromRemoteContextSave:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  }
  if ([(NSManagedObjectContext *)self persistentStoreCoordinator])
  {
    v5[0] = self;
    objc_msgSend((id)objc_opt_class(), "mergeChangesFromRemoteContextSave:intoContexts:", a3, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 1));
  }
}

- (void)_copyChildObject:(uint64_t)a1 toParentObject:(unsigned char *)a2 fromChildContext:(void *)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__copyChildObject_toParentObject_fromChildContext_);
  }
  uint64_t v6 = -[NSManagedObject _newNestedSaveChangedValuesForParent:](a2, a3);
  if (v6)
  {
    uint64_t v30 = v6;
    uint64_t v7 = [a3 entity];
    uint64_t v8 = *(void *)(v7 + 112);
    uint64_t v9 = *(void *)(v8 + 136);
    if (!v9)
    {
      -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v30, 1);
LABEL_26:

      return;
    }
    uint64_t v10 = v7;
    unint64_t v11 = *(void *)(v8 + 128);
    if (_PF_Threading_Debugging_level)
    {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__currentEventSnapshotForObject_);
      if (a3) {
        goto LABEL_7;
      }
    }
    else if (a3)
    {
LABEL_7:
      uint64_t v12 = a3[6];
      if (!v12 || (uint64_t v13 = *(void **)(v12 + 16)) == 0) {
        uint64_t v13 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:](a1, a3);
      }
      goto LABEL_14;
    }
    uint64_t v13 = 0;
LABEL_14:
    uint64_t v14 = *(void **)(v10 + 104);
    uint64_t v15 = [v14 keys];
    long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "length"));
    unint64_t v28 = v11;
    uint64_t v29 = v9;
    unint64_t v27 = v9 + v11;
    if (v11 < v9 + v11)
    {
      uint64_t v17 = v9;
      long long v18 = (uint64_t *)(v15 + 8 * v11);
      do
      {
        uint64_t v19 = *v18;
        uint64_t v20 = (void *)[a3 valueForKey:*v18];
        uint64_t v21 = (void *)[v13 valueForKey:v19];
        if ((void *)[MEMORY[0x1E4F1CA98] null] == v21)
        {
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
        }
        else
        {
          id v22 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v20, v21);
          [v16 addObject:v22];

          objc_msgSend((id)objc_msgSend(a3, "primitiveValueForKey:", v19), "removeObjectsInArray:", objc_msgSend(v22, "array"));
        }
        ++v18;
        --v17;
      }
      while (v17);
    }
    -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v30, 1);
    uint64_t v23 = [v14 keys];
    if (v28 < v27)
    {
      uint64_t v24 = 0;
      uint64_t v25 = v23 + 8 * v28;
      do
      {
        long long v26 = (void *)[v16 objectAtIndex:v24];
        if ((void *)[MEMORY[0x1E4F1CA98] null] != v26) {
          objc_msgSend((id)objc_msgSend(a3, "primitiveValueForKey:", *(void *)(v25 + 8 * v24)), "addObjectsFromArray:", objc_msgSend(v26, "array"));
        }
        ++v24;
      }
      while (v29 != v24);
    }

    goto LABEL_26;
  }
}

- (uint64_t)_parentProcessSaveRequest:(uint64_t)result inContext:(void *)a2 error:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v3 = (void *)result;
    id v47 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [v3 processPendingChanges];
    uint64_t v4 = (void *)[a2 insertedObjects];
    uint64_t v5 = (void *)[a2 updatedObjects];
    uint64_t v6 = (void *)[a2 deletedObjects];
    unint64_t v7 = [v4 count];
    unint64_t v49 = [v5 count];
    unint64_t v48 = [v6 count];
    uint64_t v46 = (uint64_t)&v46;
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    if (v7 >= 0x201) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    unint64_t v50 = v7;
    if (v7 > 0x200)
    {
      uint64_t v53 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      uint64_t v53 = (char *)&v46 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v53, 8 * v8);
    }
    if (v49 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v49;
    }
    if (v49 >= 0x201) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v49 > 0x200)
    {
      long long v52 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      long long v52 = (char *)&v46 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v52, 8 * v10);
    }
    if (v48 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v48;
    }
    if (v48 >= 0x201) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    if (v48 > 0x200)
    {
      uint64_t v51 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      uint64_t v51 = (char *)&v46 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v51, 8 * v12);
    }
    if (v50)
    {
      uint64_t v14 = v50 >= 0x201 ? 1 : v50;
      unint64_t v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0;
      long long v16 = (char *)&v46 - v15;
      if (v50 > 0x200) {
        long long v16 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v46 - v15, 8 * v50);
      }
      objc_msgSend(v4, "getObjects:", v16, v46);
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v18 = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)[*(id *)&v16[8 * i] objectID], (uint64_t)v3);
        *(void *)&v53[8 * i] = v18;
        [v3 insertObject:v18];
      }
      for (uint64_t j = 0; j != v8; ++j)
        -[NSManagedObjectContext _copyChildObject:toParentObject:fromChildContext:]((uint64_t)v3, *(unsigned char **)&v16[8 * j], *(void **)&v53[8 * j]);
      if (v50 >= 0x201) {
        NSZoneFree(0, v16);
      }
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v63, 16, v46);
    if (v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v59;
      do
      {
        uint64_t v23 = 0;
        uint64_t v24 = &v52[8 * v21];
        do
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v5);
          }
          uint64_t v25 = *(unsigned char **)(*((void *)&v58 + 1) + 8 * v23);
          long long v26 = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)[v25 objectID], (uint64_t)v3);
          *(void *)&v24[8 * v23] = v26;
          -[NSManagedObjectContext _copyChildObject:toParentObject:fromChildContext:]((uint64_t)v3, v25, v26);
          ++v23;
        }
        while (v20 != v23);
        uint64_t v20 = [v5 countByEnumeratingWithState:&v58 objects:v63 count:16];
        v21 += v23;
      }
      while (v20);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v27 = [v6 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v55;
      do
      {
        uint64_t v30 = 0;
        uint64_t v31 = &v51[8 * v28];
        do
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(v6);
          }
          id v32 = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)[*(id *)(*((void *)&v54 + 1) + 8 * v30) objectID], (uint64_t)v3);
          *(void *)&v31[8 * v30] = v32;
          [v3 deleteObject:v32];
          ++v30;
        }
        while (v27 != v30);
        uint64_t v27 = [v6 countByEnumeratingWithState:&v54 objects:v62 count:16];
        v28 += v30;
      }
      while (v27);
    }
    if (v50)
    {
      uint64_t v33 = (id *)v53;
      unint64_t v34 = v50;
      do
      {
        [*v33++ awakeFromSnapshotEvents:128];
        --v34;
      }
      while (v34);
    }
    if (v49)
    {
      uint64_t v35 = (id *)v52;
      unint64_t v36 = v49;
      do
      {
        [*v35++ awakeFromSnapshotEvents:128];
        --v36;
      }
      while (v36);
    }
    if (v48)
    {
      unint64_t v37 = (id *)v51;
      unint64_t v38 = v48;
      do
      {
        [*v37++ awakeFromSnapshotEvents:128];
        --v38;
      }
      while (v38);
    }
    [v3 processPendingChanges];
    if (v50)
    {
      uint64_t v39 = (id *)v53;
      unint64_t v40 = v50;
      do
      {

        --v40;
      }
      while (v40);
    }
    if (v49)
    {
      uint64_t v41 = (id *)v52;
      unint64_t v42 = v49;
      do
      {

        --v42;
      }
      while (v42);
    }
    if (v48)
    {
      uint64_t v43 = (id *)v51;
      unint64_t v44 = v48;
      do
      {

        --v44;
      }
      while (v44);
    }
    if (v50 >= 0x201) {
      NSZoneFree(0, v53);
    }
    if (v49 >= 0x201) {
      NSZoneFree(0, v52);
    }
    if (v48 >= 0x201) {
      NSZoneFree(0, v51);
    }
    [v47 drain];
    id v45 = 0;
    return NSArray_EmptyArray;
  }
  return result;
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__12;
  uint64_t v23 = __Block_byref_object_dispose__12;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  long long v16 = __Block_byref_object_copy__12;
  uint64_t v17 = __Block_byref_object_dispose__12;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __133__NSManagedObjectContext__NestedContextSupport___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke;
  v12[3] = &unk_1E544C660;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  void v12[7] = a5;
  v12[8] = &v19;
  v12[9] = &v13;
  _perform((unint64_t)self, (uint64_t)v12);
  unint64_t v7 = v14;
  uint64_t v8 = (void *)v14[5];
  if (v8)
  {
    if (a6)
    {
      *a6 = v8;
      uint64_t v8 = (void *)v7[5];
    }
    id v9 = v8;
  }
  uint64_t v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __133__NSManagedObjectContext__NestedContextSupport___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (!*(void *)(*(void *)(a1[5] + 168) + 8))
  {
    id v3 = PF_CALLOC_OBJECT_ARRAY(2);
    *id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3[1] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(a1[5] + 168) + 8) = v3;
  }
  if ([v2 isTemporaryID])
  {
    uint64_t v4 = [**(id **)(*(void *)(a1[5] + 168) + 8) objectForKey:v2];
    if (v4) {
      id v2 = (void *)v4;
    }
  }
  -[NSManagedObjectContext lockObjectStore](a1[5]);
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[5] + 32) _newOrderedRelationshipInformationForRelationship:a1[6] forObjectWithID:v2 withContext:a1[7] error:*(void *)(a1[9] + 8) + 40];
  if (!*(void *)(*(void *)(a1[8] + 8) + 40)) {
    id v5 = *(id *)(*(void *)(a1[9] + 8) + 40);
  }
  uint64_t v6 = a1[5];

  return -[NSManagedObjectContext unlockObjectStore](v6);
}

- (BOOL)_parentObtainPermanentIDsForObjects:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v33 = 0;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  uint64_t v30 = __Block_byref_object_copy__12;
  uint64_t v31 = __Block_byref_object_dispose__12;
  uint64_t v32 = 0;
  v26[0] = 0;
  v26[1] = v26;
  void v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__12;
  v26[4] = __Block_byref_object_dispose__12;
  v26[5] = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__12;
  uint64_t v24 = __Block_byref_object_dispose__12;
  uint64_t v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__12;
  uint64_t v18 = __Block_byref_object_dispose__12;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__NSManagedObjectContext__NestedContextSupport___parentObtainPermanentIDsForObjects_context_error___block_invoke;
  v13[3] = &unk_1E544C688;
  v13[4] = self;
  v13[5] = a3;
  v13[8] = &v14;
  v13[9] = &v33;
  v13[10] = &v27;
  v13[11] = v26;
  v13[12] = a5;
  v13[6] = a4;
  v13[7] = &v20;
  _perform((unint64_t)self, (uint64_t)v13);
  if ([(id)v21[5] count])
  {
    unint64_t v7 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)a4, (void *)v21[5], (void *)v15[5]);
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x18C127630]();
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v7);
    }
  }

  v21[5] = 0;
  v15[5] = 0;
  id v9 = (id)v28[5];
  if (a5)
  {
    uint64_t v10 = (void *)v28[5];
    if (v10) {
      *a5 = v10;
    }
  }
  char v11 = *((unsigned char *)v34 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v11;
}

void __99__NSManagedObjectContext__NestedContextSupport___parentObtainPermanentIDsForObjects_context_error___block_invoke(uint64_t *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1[4] + 168) + 8))
  {
    id v2 = PF_CALLOC_OBJECT_ARRAY(2);
    *id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2[1] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(a1[4] + 168) + 8) = v2;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v4 = (void *)a1[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = (void *)[v8 objectID];
        if ([v9 isTemporaryID])
        {
          uint64_t v10 = (void *)[**(id **)(*(void *)(a1[4] + 168) + 8) objectForKey:v9];
          char v11 = v10;
          if (v10 && ([v10 isTemporaryID] & 1) == 0)
          {
            if (!*(void *)(*(void *)(a1[7] + 8) + 40)) {
              *(void *)(*(void *)(a1[7] + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            if (!*(void *)(*(void *)(a1[8] + 8) + 40)) {
              *(void *)(*(void *)(a1[8] + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v8];
            [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v11];
          }
          else
          {
            [v3 addObject:v8];
            [obj addObject:v9];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }
  if ([v3 count])
  {
    unsigned __int8 v12 = atomic_load((unsigned __int8 *)(a1[4] + 48));
    uint64_t v13 = (void *)a1[4];
    if (v12)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)v13);
      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = [*(id *)(a1[4] + 32) _parentObtainPermanentIDsForObjects:v3 context:a1[6] error:a1[12]];
      -[NSManagedObjectContext unlockObjectStore](a1[4]);
    }
    else
    {
      uint64_t v14 = (void *)[v13 persistentStoreCoordinator];
      -[NSManagedObjectContext lockObjectStore](a1[4]);
      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = [v14 obtainPermanentIDsForObjects:v3 error:*(void *)(a1[10] + 8) + 40];
      -[NSManagedObjectContext unlockObjectStore](a1[4]);

      uint64_t v15 = *(void *)(*(void *)(a1[10] + 8) + 40);
      if (v15)
      {
        uint64_t v16 = (void *)a1[12];
        if (v16) {
          *uint64_t v16 = v15;
        }
        *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 0;
      }
      id v17 = *(id *)(*(void *)(a1[11] + 8) + 40);
      obuint64_t j = 0;
      id v3 = 0;
    }
    if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24))
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = 0;
        uint64_t v22 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            uint64_t v25 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v21 + j, v29), "objectID");
            if (v24 != v25)
            {
              uint64_t v26 = [(id)a1[4] objectRegisteredForID:v24];
              if (v26)
              {
                [v29 addObject:v26];
                [v19 addObject:v25];
              }
              [**(id **)(*(void *)(a1[4] + 168) + 8) setObject:v25 forKey:v24];
              [*(id *)(*(void *)(*(void *)(a1[4] + 168) + 8) + 8) setObject:v24 forKey:v25];
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
          v21 += j;
        }
        while (v20);
      }
      if (objc_msgSend(v29, "count", v29)) {
        uint64_t v18 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](a1[4], v30, v19);
      }
      else {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }

  id v27 = *(id *)(*(void *)(a1[10] + 8) + 40);
  if (v18)
  {
    uint64_t v28 = (void *)MEMORY[0x18C127630](v27);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v18);
  }
}

- (id)_orderKeysForRelationshipWithName__:(id)a3 onObjectWithID:(id)a4
{
  uint64_t v5 = [(NSManagedObjectContext *)self objectWithID:a4];

  return [(NSManagedObject *)v5 _orderKeysForRelationshipWithName__:a3];
}

- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 onObjectWithID:(id)a5 error:(id *)a6
{
  id v9 = [(NSManagedObjectContext *)self objectWithID:a5];

  return [(NSManagedObject *)v9 _updateLocationsOfObjectsToLocationByOrderKey:a3 inRelationshipWithName:a4 error:a6];
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__12;
  uint64_t v26 = __Block_byref_object_dispose__12;
  uint64_t v27 = 0;
  uint64_t v9 = [a4 destinationEntity];
  if ([(NSManagedObjectContext *)self hasChanges])
  {
    id v10 = 0;
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E1D80];
    }
    goto LABEL_11;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "entity"), "isKindOfEntity:", v9))
  {
    uint64_t v14 = @"Destination object is not kind of [relationship destinationEntity]";
    goto LABEL_15;
  }
  if (![a4 isToMany])
  {
    uint64_t v14 = @"Relationship must be a to-many.";
    goto LABEL_15;
  }
  if (([a4 isOrdered] & 1) == 0)
  {
    uint64_t v14 = @"Can't find the order of objects in an unordered relationship";
LABEL_15:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3052000000;
  id v19 = __Block_byref_object_copy__12;
  uint64_t v20 = __Block_byref_object_dispose__12;
  uint64_t v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __105__NSManagedObjectContext__PhotosOrderKeyUpdateSupport___allOrderKeysForDestination_inRelationship_error___block_invoke;
  v15[3] = &unk_1E544C6B0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = &v22;
  v15[8] = &v16;
  [(NSManagedObjectContext *)self performBlockAndWait:v15];
  char v11 = (void *)v17[5];
  if (v11)
  {
    id v12 = v11;
    if (a5) {
      *a5 = (id)v17[5];
    }
  }
  id v10 = (id)v23[5];
  _Block_object_dispose(&v16, 8);
LABEL_11:
  _Block_object_dispose(&v22, 8);
  return v10;
}

id __105__NSManagedObjectContext__PhotosOrderKeyUpdateSupport___allOrderKeysForDestination_inRelationship_error___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 32) _allOrderKeysForDestination:a1[5] inRelationship:a1[6] error:*(void *)(a1[8] + 8) + 40];
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  if (!*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    return 0;
  }
  return result;
}

+ (id)createFutureForFileAtURL:(id)a3
{
  if (!a3 || ([a3 isFileURL] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    id v10 = @"Illegal attempt to pass a non-file URL to a file backed NSData";
    goto LABEL_13;
  }
  uint64_t v4 = [_NSDataFileBackedFuture alloc];
  if (v4)
  {
    if (([a3 isFileURL] & 1) == 0)
    {

      return 0;
    }
    v14.receiver = v4;
    v14.super_class = (Class)_NSDataFileBackedFuture;
    uint64_t v4 = objc_msgSendSuper2(&v14, sel_init);
    if (v4)
    {
      uint64_t v13 = 0;
      uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v13);
      if (v5)
      {
        uint64_t v6 = v5;
        if ([v5 valueForKey:@"NSFileSize"])
        {
          v4->_fileSize = objc_msgSend((id)objc_msgSend(v6, "valueForKey:", @"NSFileSize"), "unsignedIntegerValue");
          v4->_originalFileURL = (NSURL *)a3;
          v4->_uuid = (NSUUID *)(id)[MEMORY[0x1E4F29128] UUID];
          return v4;
        }
      }

      char v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      id v10 = (__CFString *)[NSString stringWithFormat:@"No file exists at URL '%@'", a3];
      uint64_t v8 = v11;
      uint64_t v9 = v12;
LABEL_13:
      objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
    }
  }
  return v4;
}

- (BOOL)evictFuture:(id)a3 withError:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F281F8];
    long long v32 = @"message";
    char v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v33 = [v11 stringWithFormat:@"%@ does not support eviction.", NSStringFromClass(v12)];
    uint64_t v13 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 3328, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    if (v13)
    {
      if (a4)
      {
        id v14 = (id)v13;
LABEL_15:
        LOBYTE(v7) = 0;
        *a4 = v14;
        return v7;
      }
LABEL_19:
      LOBYTE(v7) = 0;
      return v7;
    }
    uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m");
    uint64_t v22 = __pflogFaultLog;
    BOOL v7 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v7) {
      return v7;
    }
    *(_DWORD *)buf = 136315394;
    long long v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m";
    __int16 v36 = 1024;
    int v37 = 28;
LABEL_18:
    _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_19;
  }
  if (!a3) {
    goto LABEL_19;
  }
  id v31 = 0;
  char v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", *((void *)a3 + 1), &v31);
  LOBYTE(v7) = 1;
  if ((v6 & 1) == 0 && v31)
  {
    uint64_t v8 = (void *)[v31 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]] && objc_msgSend(v31, "code") == 4)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    id v14 = v31;
    if (v31)
    {
      if (a4) {
        goto LABEL_15;
      }
      goto LABEL_19;
    }
    uint64_t v23 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m");
    uint64_t v22 = __pflogFaultLog;
    BOOL v7 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v7) {
      return v7;
    }
    *(_DWORD *)buf = 136315394;
    long long v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m";
    __int16 v36 = 1024;
    int v37 = 338;
    goto LABEL_18;
  }
  return v7;
}

@end