@interface EKObject
+ (BOOL)_compareAllKnownKeysExceptKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5;
+ (BOOL)_compareAllKnownKeysExceptKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareIdentityKeys:(BOOL)a6;
+ (BOOL)_compareIdentityKeysForObject:(id)a3 againstObject:(id)a4 propertiesToIgnore:(id)a5;
+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5;
+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareIdentityKeys:(BOOL)a6 compareImmutableKeys:(BOOL)a7 propertiesToIgnore:(id)a8;
+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareImmutableKeys:(BOOL)a6 propertiesToIgnore:(id)a7;
+ (BOOL)_compareMultiValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6;
+ (BOOL)_compareMultiValueRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6;
+ (BOOL)_compareMutliValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6;
+ (BOOL)_compareNonIdentityKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareImmutableKeys:(BOOL)a6 propertiesToIgnore:(id)a7;
+ (BOOL)_compareNonIdentityKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6;
+ (BOOL)_compareNonRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6;
+ (BOOL)_compareRelationshipObject1:(id)a3 againstRelationshipObject2:(id)a4 propertiesToIgnore:(id)a5;
+ (BOOL)_compareRelationshipObject1:(id)a3 againstRelationshipObject2:(id)a4 propertiesToIgnore:(id)a5 relationshipObjectKey:(id)a6;
+ (BOOL)_compareSingleValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6 ignoreIdentityKeys:(BOOL)a7;
+ (BOOL)_compareSingleValueRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6;
+ (BOOL)_object:(id)a3 equalsObject:(id)a4 forKeys:(id)a5 compareImmutableKeys:(BOOL)a6 ignoringProperties:(id)a7;
+ (BOOL)_objects:(id)a3 haveSameMeltedClass:(Class)a4 frozenClass:(Class)a5;
+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7;
+ (BOOL)isDerivedRelationship;
+ (BOOL)isMeltedAndNotWeakRelationshipObject:(id)a3 forKey:(id)a4;
+ (BOOL)isWeakRelationObject:(id)a3 forKey:(id)a4;
+ (BOOL)isWeakRelationship;
+ (Class)frozenClass;
+ (id)EKObjectChangeSummarizer_multiValueDiffKeys;
+ (id)EKObjectChangeSummarizer_singleValueDiffKeys;
+ (id)_array:(id)a3 intersectedWithSet:(id)a4 minusSet:(id)a5;
+ (id)_changeSetForDiff:(id)a3;
+ (id)_createNonPartialObjectFromObject:(id)a3 ifPropertyIsUnavailable:(id)a4;
+ (id)defaultPropertyKeysToSkipForRecursiveSnapshotCopies;
+ (id)duplicatedPersistentObjectForObject:(id)a3 alreadyCopiedObjects:(id)a4;
+ (id)keysToIgnoreForApplyingChanges;
+ (id)knownDerivedAndSingleValueRelationshipKeys;
+ (id)knownDerivedRelationshipKeys;
+ (id)knownIdentityKeysForComparison;
+ (id)knownImmutableKeys;
+ (id)knownRelationshipMultiValueKeys;
+ (id)knownRelationshipSingleValueKeys;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
+ (id)knownSingleValueKeysToSkipForUIComparison;
+ (id)objectsIDsExistingInStoreFromObjects:(id)a3 eventStore:(id)a4;
+ (id)propertiesUnavailableForPartialObjects;
+ (id)specialComparisonBlocks;
+ (unint64_t)_numberOfSharedLocksForUnitTesting;
+ (void)_addChangesFromObject:(id)a3 toObjects:(id)a4 passingTest:(id)a5 copyingBackingObjects:(BOOL)a6;
+ (void)addChangesFromObject:(id)a3 toObject:(id)a4 exceptWhereObjectIsDifferentFrom:(id)a5 skippingChanges:(id)a6;
+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 except:(id)a5;
+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 keep:(id)a5;
+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 passingTest:(id)a5;
- (BOOL)_areOnlyChangedKeys:(id)a3;
- (BOOL)_hasChangeHelperInKeys:(id)a3 ignoreKeys:(id)a4 checkUnsaved:(BOOL)a5;
- (BOOL)_hasChanges;
- (BOOL)_hasChangesForKey:(id)a3;
- (BOOL)_hasChangesForKey:(id)a3 checkUnsaved:(BOOL)a4;
- (BOOL)_hasUnsavedChangesInKeys:(id)a3 ignoreKeys:(id)a4;
- (BOOL)_isNew;
- (BOOL)_isOnlyChangedKey:(id)a3;
- (BOOL)_isPropertyUnavailable:(id)a3 convertToFullObjectIfUnavailable:(BOOL)a4;
- (BOOL)_refreshCommon;
- (BOOL)_refreshable;
- (BOOL)_reset;
- (BOOL)_resetCommon;
- (BOOL)_resetIfBackingObjectIsOfClass:(Class)a3 fetchResetFrozenObjectBlock:(id)a4;
- (BOOL)canBeConvertedToFullObject;
- (BOOL)existsInStore;
- (BOOL)hasEverBeenCommitted;
- (BOOL)hasNeverBeenCommitted;
- (BOOL)hasUnsavedChanges;
- (BOOL)hasUnsavedChangesIgnoreKeys:(id)a3;
- (BOOL)hasUnsavedChangesInKeys:(id)a3;
- (BOOL)isCompletelyEqual:(id)a3;
- (BOOL)isDeleted;
- (BOOL)isDifferentFromCommitted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 comparingKeys:(id)a4 compareImmutableKeys:(BOOL)a5 ignoringProperties:(id)a6;
- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4;
- (BOOL)isFrozen;
- (BOOL)isPartialObject;
- (BOOL)isPropertyUnavailable:(id)a3;
- (BOOL)isSaved;
- (BOOL)isUndeleted;
- (BOOL)refresh;
- (BOOL)refreshAndNotify:(BOOL)a3;
- (BOOL)shouldLoadRelationshipForValidation:(id)a3;
- (BOOL)validate:(id *)a3;
- (BOOL)validateWithOwner:(id)a3 error:(id *)a4;
- (CADGenerationStampedObjectID)CADObjectID;
- (CADGenerationStampedObjectID)rebasedFrom;
- (Class)frozenClass;
- (EKChangeSet)changeSet;
- (EKEventStore)eventStore;
- (EKObject)init;
- (EKObject)initWithPersistentObject:(id)a3;
- (EKObjectID)objectID;
- (EKObjectValidationContext)_validationContext;
- (EKPersistentObject)backingObject;
- (EKPersistentObject)persistentObject;
- (NSDictionary)additionalFrozenProperties;
- (NSDictionary)additionalMeltedObjects;
- (NSDictionary)cachedMeltedObjects;
- (NSMutableDictionary)_cachedMeltedObjects;
- (NSMutableDictionary)_cachedValues;
- (NSString)uniqueIdentifier;
- (id)_basicSummaryWithDepth:(int64_t)a3;
- (id)_convertBackingObjectsWithPath:(id)a3 updateBackingObjects:(BOOL)a4 allChangedBackingObjects:(id)a5 eventStore:(id)a6 updatedBackingObjectProvider:(id)a7;
- (id)_copyWithoutChangesInZone:(_NSZone *)a3;
- (id)_multiRelationshipKeysToCheckForChanges;
- (id)_previousValueForKey:(id)a3;
- (id)_propertyValueForKey:(id)a3;
- (id)_recursiveSnapshotCopyWithPropertyAccessor:(id)a3 propertyKeysToCopy:(id)a4 propertyKeysToSkip:(id)a5 recurseOnWeakRelations:(BOOL)a6;
- (id)_singleRelationshipKeysToCheckForChanges;
- (id)_summaryWithDepth:(int64_t)a3;
- (id)backingObjectOfChildObject:(id)a3 withRelationshipKey:(id)a4;
- (id)cachedMeltedChildIdentifierToParentMap;
- (id)cachedMeltedObjectForSingleValueKey:(id)a3;
- (id)cachedMeltedObjectsForMultiValueKey:(id)a3;
- (id)cachedValueForKey:(id)a3;
- (id)cachedValueForKey:(id)a3 expectingCachedValue:(id)a4 forMasterKey:(id)a5 relatedKeys:(id)a6 populateBlock:(id)a7;
- (id)cachedValueForKey:(id)a3 populateBlock:(id)a4;
- (id)changedKeys;
- (id)committedCopy;
- (id)committedValueForKey:(id)a3;
- (id)copyMeltedObjectCache;
- (id)diffWithObject:(id)a3;
- (id)diffWithObject:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4;
- (id)duplicate;
- (id)duplicateToEventStore:(id)a3;
- (id)frozenObject;
- (id)frozenObjectInStore:(id)a3;
- (id)frozenOrMeltedCachedMultiRelationObjectsForKey:(id)a3;
- (id)frozenOrMeltedCachedSingleRelationObjectForKey:(id)a3;
- (id)inverseObjectWithObject:(id)a3 diff:(id *)a4;
- (id)meltedAndCachedMultiRelationObjectsForKey:(id)a3;
- (id)meltedAndCachedSingleRelationObjectForKey:(id)a3;
- (id)meltedObjectInStore:(id)a3;
- (id)multiChangedObjectValuesForKey:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)preFrozenRelationshipObjects;
- (id)prepareReminderKitObjectForSaveWithUpdatedBackingObjectProvider:(id)a3;
- (id)previouslySavedCopy;
- (id)privacyDescription;
- (id)shallowCopyWithoutChanges;
- (id)singleChangedValueForKey:(id)a3;
- (id)snapshotCopy;
- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3;
- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3 propertyKeysToSkip:(id)a4;
- (int)rowID;
- (os_unfair_lock_s)_lock;
- (unint64_t)_cachedMeltedObjectsCount;
- (unint64_t)hash;
- (unint64_t)meltedAndCachedMultiRelationCountForKey:(id)a3;
- (void)_addCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4;
- (void)_addChanges:(id)a3 copyingBackingObjects:(BOOL)a4;
- (void)_addChanges:(id)a3 copyingBackingObjects:(BOOL)a4 objectIdentifierBlock:(id)a5;
- (void)_addChangesFromObject:(id)a3 ignoringDifferencesFrom:(id)a4 changesToSkip:(id)a5 copyingBackingObjects:(BOOL)a6;
- (void)_addChangesFromObject:(id)a3 passingTest:(id)a4 ignoreRelations:(id)a5 copyingBackingObjects:(BOOL)a6;
- (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 indentFirstLine:(BOOL)a5;
- (void)_applyKnownImmutableValuesFrom:(id)a3;
- (void)_cachedMeltedChildIdentifierToParentMap:(id)a3;
- (void)_initChangeSetIfNone;
- (void)_markAsCommittedCommon;
- (void)_markAsDeletedCommon;
- (void)_markAsNotNewCommon;
- (void)_markAsSavedCommon;
- (void)_markAsUndeletedCommon;
- (void)_performBlockOnOwnedCachedRelatedObjects:(id)a3;
- (void)_performWithLock:(id)a3;
- (void)_removeCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4;
- (void)_resetAfterUpdatingChangeSetOrBackingObject;
- (void)_resetAfterUpdatingChangeSetOrBackingObjectWithForce:(BOOL)a3;
- (void)_resetMeltedCache;
- (void)_resetWithFrozenObject:(id)a3;
- (void)_rollbackCommon;
- (void)_sharedInit;
- (void)_updateCachedMeltedObjectSetForMultiValueKey:(id)a3 usingBlock:(id)a4;
- (void)_updatePersistentValueForKey:(id)a3;
- (void)addCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4;
- (void)addChanges:(id)a3;
- (void)addChangesFromObject:(id)a3;
- (void)addChangesFromObject:(id)a3 copyingBackingObjects:(BOOL)a4;
- (void)addCoCommitObject:(id)a3;
- (void)addMultiChangedObjectValue:(id)a3 forKey:(id)a4;
- (void)addMultiChangedObjectValues:(id)a3 forKey:(id)a4;
- (void)applyChanges:(id)a3;
- (void)augmentMeltedObjectCache:(id)a3;
- (void)clearCachedValueForKey:(id)a3;
- (void)clearCachedValuesForKeys:(id)a3;
- (void)deletePersistentObject;
- (void)emptyMeltedCache;
- (void)emptyMeltedCacheForKey:(id)a3;
- (void)emptyMeltedCacheForKeys:(id)a3;
- (void)insertPersistentObjectIfNeeded;
- (void)markAsCommitted;
- (void)markAsNew;
- (void)markAsNewShallow;
- (void)markAsUndeleted;
- (void)rebase;
- (void)rebaseSkippingRelationProperties:(id)a3;
- (void)rebaseSkippingRelationProperties:(id)a3 toEventStore:(id)a4;
- (void)rebaseToEventStore:(id)a3;
- (void)removeCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4;
- (void)removeMultiChangedObjectValue:(id)a3 forKey:(id)a4;
- (void)removeMultiChangedObjectValues:(id)a3 forKey:(id)a4;
- (void)replaceMultiChangedObjectValuesWithObjectValues:(id)a3 forKey:(id)a4;
- (void)setAdditionalFrozenProperties:(id)a3;
- (void)setAdditionalMeltedObjects:(id)a3;
- (void)setBackingObject:(id)a3;
- (void)setCachedMeltedObject:(id)a3 forSingleValueKey:(id)a4;
- (void)setCachedMeltedObjects:(id)a3;
- (void)setCachedMeltedObjects:(id)a3 forMultiValueKey:(id)a4;
- (void)setCachedValue:(id)a3 forKey:(id)a4;
- (void)setChangeSet:(id)a3;
- (void)setPersistentObject:(id)a3;
- (void)setSingleChangedValue:(id)a3 forKey:(id)a4;
- (void)set_cachedMeltedObjects:(id)a3;
- (void)set_cachedValues:(id)a3;
- (void)set_validationContext:(id)a3;
- (void)updateAfterApplyingChanges:(id)a3 objectIdentifierBlock:(id)a4;
- (void)updateMeltedAndCachedMultiRelationObjects:(id)a3 forKey:(id)a4;
- (void)updateMeltedAndCachedSingleRelationObject:(id)a3 forKey:(id)a4 frozenClass:(Class)a5;
- (void)updateMeltedCacheForChangeSet:(id)a3 objectIdentifierBlock:(id)a4;
- (void)updateMultiValueCacheForChangeSet:(id)a3 preservingExistingAdds:(BOOL)a4 objectIdentifierBlock:(id)a5;
- (void)updatePersistentObject;
- (void)updatePersistentObjectSkippingProperties:(id)a3;
- (void)updatePersistentValueForKeyIfNeeded:(id)a3;
@end

@implementation EKObject

- (EKObject)initWithPersistentObject:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKObject;
  v6 = [(EKObject *)&v10 init];
  if (v6)
  {
    EKLogInitIfNeeded();
    [(EKObject *)v6 _sharedInit];
    objc_storeStrong((id *)&v6->_persistentObject, a3);
    if ([(EKPersistentObject *)v6->_persistentObject isNew])
    {
      v7 = [(EKObject *)v6 eventStore];
      char v8 = [v7 isObjectInserted:v6->_persistentObject];

      if ((v8 & 1) == 0) {
        [(EKObject *)v6 markAsNewShallow];
      }
    }
  }

  return v6;
}

- (void)_sharedInit
{
  v3 = objc_opt_new();
  [(EKObject *)self set_cachedMeltedObjects:v3];

  id v4 = (id)objc_opt_new();
  [(EKObject *)self set_cachedValues:v4];
}

- (void)set_cachedValues:(id)a3
{
}

- (void)set_cachedMeltedObjects:(id)a3
{
}

- (id)cachedValueForKey:(id)a3 populateBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__18;
  v24 = __Block_byref_object_dispose__18;
  id v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke;
  v17[3] = &unk_1E5B97028;
  v19 = &v20;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  [(EKObject *)self _performWithLock:v17];
  v9 = (void *)v21[5];
  if (v7 && !v9)
  {
    uint64_t v10 = v7[2](v7);
    v11 = (void *)v21[5];
    v21[5] = v10;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke_2;
    v14[3] = &unk_1E5B96E58;
    v14[4] = self;
    id v15 = v8;
    v16 = &v20;
    [(EKObject *)self _performWithLock:v14];

    v9 = (void *)v21[5];
  }
  id v12 = v9;

  _Block_object_dispose(&v20, 8);

  return v12;
}

- (EKObjectID)objectID
{
  v2 = [(EKObject *)self persistentObject];
  v3 = [v2 objectID];

  return (EKObjectID *)v3;
}

- (id)cachedMeltedObjectsForMultiValueKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  id v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__EKObject_Shared__cachedMeltedObjectsForMultiValueKey___block_invoke;
  v8[3] = &unk_1E5B97028;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(EKObject *)self _performWithLock:v8];
  if (v12[5])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  }
  else
  {
    id v6 = 0;
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)meltedObjectInStore:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(EKObject *)self eventStore];
  v7 = (void *)v6;
  if (v5 && v6 && (id)v6 != v5)
  {
    if ([(EKObject *)self hasChanges])
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"EKObject.m" lineNumber:354 description:@"Cannot copy an object with changes from one event store to another"];
    }
    id v8 = [(EKObject *)self frozenObjectInStore:v5];
    id v9 = (EKObject *)[objc_alloc((Class)objc_opt_class()) initWithPersistentObject:v8 objectForCopy:self];
  }
  else
  {
    id v9 = self;
  }

  return v9;
}

- (id)meltedAndCachedSingleRelationObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(EKObject *)self frozenOrMeltedCachedSingleRelationObjectForKey:v4];
  uint64_t v6 = [(EKObject *)self eventStore];
  v7 = [v5 meltedObjectInStore:v6];

  if (v5 && !v7 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKObject(Shared) meltedAndCachedSingleRelationObjectForKey:]();
  }
  if ([v5 isFrozen]) {
    [(EKObject *)self setCachedMeltedObject:v7 forSingleValueKey:v4];
  }

  return v7;
}

- (EKEventStore)eventStore
{
  v2 = [(EKObject *)self persistentObject];
  v3 = [v2 eventStore];

  return (EKEventStore *)v3;
}

- (EKPersistentObject)persistentObject
{
  return self->_persistentObject;
}

- (id)frozenOrMeltedCachedSingleRelationObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(EKObject *)self cachedMeltedObjectForSingleValueKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(EKObject *)self singleChangedValueForKey:v4];
  }
  id v8 = v7;

  return v8;
}

- (id)cachedMeltedObjectForSingleValueKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  id v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__EKObject_Shared__cachedMeltedObjectForSingleValueKey___block_invoke;
  v8[3] = &unk_1E5B97028;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(EKObject *)self _performWithLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_performWithLock:(id)a3
{
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock([(EKObject *)self _lock]);
  v4[2](v4);

  id v5 = [(EKObject *)self _lock];

  os_unfair_lock_unlock(v5);
}

- (os_unfair_lock_s)_lock
{
  unsigned int v2 = self;
  if (GetSharedLockForIndex_onceToken != -1) {
    dispatch_once(&GetSharedLockForIndex_onceToken, &__block_literal_global_265);
  }
  return (os_unfair_lock_s *)&GetSharedLockForIndex_sharedLocks
       + ((((v2 >> 4) ^ (v2 >> 7)) ^ (v2 >> 10)) & 7);
}

void __56__EKObject_Shared__cachedMeltedObjectForSingleValueKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)_cachedMeltedObjects
{
  return self->__cachedMeltedObjects;
}

- (BOOL)isFrozen
{
  return 0;
}

void __56__EKObject_Shared__cachedMeltedObjectsForMultiValueKey___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)_isNew
{
  uint64_t v2 = [(EKObject *)self changeSet];
  char v3 = [v2 isNew];

  return v3;
}

- (id)singleChangedValueForKey:(id)a3
{
  id v4 = a3;
  if ([(EKObject *)self _isPropertyUnavailable:v4 convertToFullObjectIfUnavailable:1])
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKObject(Shared) singleChangedValueForKey:]();
    }
    id v5 = 0;
  }
  else
  {
    id v6 = [(EKObject *)self changeSet];

    if (v6)
    {
      id v7 = [(EKObject *)self changeSet];
      id v8 = [(EKObject *)self backingObject];
      id v9 = [(EKObject *)self additionalFrozenProperties];
      uint64_t v10 = [v7 valueForSingleValueKey:v4 basedOn:v8 and:v9];
    }
    else
    {
      uint64_t v11 = [(EKObject *)self additionalFrozenProperties];
      id v12 = [v11 objectForKeyedSubscript:v4];

      if (v12)
      {
        id v7 = [(EKObject *)self additionalFrozenProperties];
        [v7 objectForKeyedSubscript:v4];
      }
      else
      {
        id v7 = [(EKObject *)self backingObject];
        [v7 valueForKey:v4];
      uint64_t v10 = };
    }

    uint64_t v13 = objc_opt_class();
    if (v13 == objc_opt_class()) {
      id v5 = 0;
    }
    else {
      id v5 = v10;
    }
  }

  return v5;
}

- (EKChangeSet)changeSet
{
  return self->_changeSet;
}

- (EKPersistentObject)backingObject
{
  return self->_persistentObject;
}

- (NSDictionary)additionalFrozenProperties
{
  return self->_additionalFrozenProperties;
}

- (BOOL)_isPropertyUnavailable:(id)a3 convertToFullObjectIfUnavailable:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    goto LABEL_4;
  }
  id v7 = [(EKObject *)self changeSet];
  char v8 = [v7 hasUnsavedChangeForKey:v6];

  if ((v8 & 1) != 0
    || ([(EKObject *)self additionalFrozenProperties],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:v6],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
LABEL_4:
    char v11 = 0;
  }
  else
  {
    uint64_t v13 = [(EKObject *)self backingObject];
    char v11 = [v13 isPropertyUnavailable:v6];
  }
  return v11;
}

- (BOOL)isPropertyUnavailable:(id)a3
{
  return [(EKObject *)self _isPropertyUnavailable:a3 convertToFullObjectIfUnavailable:0];
}

void __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedValues];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)_cachedValues
{
  return self->__cachedValues;
}

- (void)clearCachedValueForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EKObject_Shared__clearCachedValueForKey___block_invoke;
  v6[3] = &unk_1E5B97140;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(EKObject *)self _performWithLock:v6];
}

void __43__EKObject_Shared__clearCachedValueForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedValues];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)committedValueForKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EKObject *)self _previousValueForKey:v4];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      char v8 = [(EKObject *)self eventStore];
      uint64_t v9 = [v5 meltedObjectInStore:v8];

      id v5 = (void *)v9;
    }
    else
    {
      uint64_t v10 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
      int v11 = [v10 containsObject:v4];

      if (v11)
      {
        id v12 = v5;
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v12, "count"));
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v20 = [(EKObject *)self eventStore];
              v21 = [v19 meltedObjectInStore:v20];

              [v13 addObject:v21];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v16);
        }

        id v5 = [MEMORY[0x1E4F1CAD0] setWithSet:v13];
      }
    }
  }

  return v5;
}

- (id)_previousValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(EKObject *)self additionalFrozenProperties];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    id v8 = 0;
  }
  else if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(EKObject *)self backingObject];
    id v8 = [v9 valueForKey:v4];
  }

  return v8;
}

void __60__EKObject_Shared__setCachedMeltedObject_forSingleValueKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _cachedMeltedObjects];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = v3;
  if (v2) {
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  else {
    [v3 removeObjectForKey:v4];
  }
}

- (void)setCachedMeltedObject:(id)a3 forSingleValueKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__EKObject_Shared__setCachedMeltedObject_forSingleValueKey___block_invoke;
  v10[3] = &unk_1E5B97190;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(EKObject *)self _performWithLock:v10];
}

void __52__EKObject_Shared__cachedValueForKey_populateBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedValues];
  id v7 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v7)
  {
    id v4 = v7;
    id v5 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v4;
  }
  else
  {
    uint64_t v6 = *(void *)(v3 + 40);
    id v5 = [*(id *)(a1 + 32) _cachedValues];
    [v5 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void __60__EKObject_Shared__setCachedMeltedObjects_forMultiValueKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _cachedMeltedObjects];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = v3;
  if (v2) {
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  else {
    [v3 removeObjectForKey:v4];
  }
}

void __45__EKObject_Shared___cachedMeltedObjectsCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

void __42__EKObject_Shared__setCachedValue_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) _cachedValues];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (unint64_t)hash
{
  uint64_t v2 = [(EKObject *)self persistentObject];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)meltedAndCachedMultiRelationObjectsForKey:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [(EKObject *)self multiChangedObjectValuesForKey:v4];
    if (v7)
    {
      id v25 = v4;
      id v8 = [MEMORY[0x1E4F1CA80] set];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v24 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
            uint64_t v15 = [(EKObject *)self eventStore];
            uint64_t v16 = [v14 meltedObjectInStore:v15];

            if (v16)
            {
              [v8 addObject:v16];
            }
            else
            {
              uint64_t v17 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                id v18 = v17;
                v19 = [(EKObject *)self eventStore];
                *(_DWORD *)buf = 138412546;
                uint64_t v20 = @"not nil";
                if (!v19) {
                  uint64_t v20 = @"nil";
                }
                id v31 = v25;
                __int16 v32 = 2112;
                v33 = v20;
                _os_log_error_impl(&dword_1A4E47000, v18, OS_LOG_TYPE_ERROR, "Failed to get melted object for frozen object related by key %@. Event store is %@", buf, 0x16u);
              }
            }

            ++v13;
          }
          while (v11 != v13);
          uint64_t v21 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          uint64_t v11 = v21;
        }
        while (v21);
      }

      id v4 = v25;
      [(EKObject *)self setCachedMeltedObjects:v8 forMultiValueKey:v25];
      uint64_t v22 = (void *)[v8 copy];

      id v7 = v24;
    }
    else
    {
      uint64_t v22 = 0;
    }
    id v6 = v22;
  }

  return v6;
}

- (void)setCachedMeltedObjects:(id)a3 forMultiValueKey:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__EKObject_Shared__setCachedMeltedObjects_forMultiValueKey___block_invoke;
  v10[3] = &unk_1E5B97190;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [(EKObject *)self _performWithLock:v10];
}

- (id)multiChangedObjectValuesForKey:(id)a3
{
  id v4 = a3;
  if ([(EKObject *)self _isPropertyUnavailable:v4 convertToFullObjectIfUnavailable:1])
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKObject(Shared) singleChangedValueForKey:]();
    }
    id v5 = 0;
  }
  else
  {
    id v6 = [(EKObject *)self changeSet];

    if (v6)
    {
      id v7 = [(EKObject *)self changeSet];
      id v8 = [(EKObject *)self backingObject];
      id v9 = [(EKObject *)self additionalFrozenProperties];
      uint64_t v10 = [v7 valuesForMultiValueKey:v4 basedOn:v8 and:v9];
    }
    else
    {
      id v11 = [(EKObject *)self additionalFrozenProperties];
      uint64_t v12 = [v11 objectForKeyedSubscript:v4];

      if (v12)
      {
        id v7 = [(EKObject *)self additionalFrozenProperties];
        [v7 objectForKeyedSubscript:v4];
      }
      else
      {
        id v7 = [(EKObject *)self backingObject];
        [v7 valueForKey:v4];
      uint64_t v10 = };
    }

    uint64_t v13 = objc_opt_class();
    if (v13 == objc_opt_class()) {
      id v5 = 0;
    }
    else {
      id v5 = v10;
    }
  }

  return v5;
}

- (BOOL)_hasChangesForKey:(id)a3 checkUnsaved:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v4
    || ([(EKObject *)self changeSet],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 hasUnsavedChangeForKey:v6],
        v7,
        (v8 & 1) == 0))
  {
    if ([(EKObject *)self isPropertyUnavailable:v6])
    {
      LOBYTE(v9) = 0;
      goto LABEL_22;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__EKObject_Shared___hasChangesForKey_checkUnsaved___block_invoke;
    v23[3] = &__block_descriptor_33_e30_B16__0___EKFrozenMeltedPair__8l;
    BOOL v24 = v4;
    uint64_t v10 = (uint64_t (**)(void, void))MEMORY[0x1A6266730](v23);
    id v11 = [(EKObject *)self _singleRelationshipKeysToCheckForChanges];
    int v12 = [v11 containsObject:v6];

    if (v12)
    {
      uint64_t v13 = [(EKObject *)self cachedMeltedObjectForSingleValueKey:v6];
      LOBYTE(v9) = ((uint64_t (**)(void, void *))v10)[2](v10, v13);
    }
    else
    {
      id v14 = [(EKObject *)self _multiRelationshipKeysToCheckForChanges];
      int v15 = [v14 containsObject:v6];

      if (!v15)
      {
        LOBYTE(v9) = 0;
LABEL_21:

        goto LABEL_22;
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v13 = -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", v6, 0);
      uint64_t v9 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v9)
      {
        uint64_t v16 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            if (v10[2](v10, *(void *)(*((void *)&v19 + 1) + 8 * i)))
            {
              LOBYTE(v9) = 1;
              goto LABEL_20;
            }
          }
          uint64_t v9 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v9) = 1;
LABEL_22:

  return v9;
}

- (BOOL)_hasChangesForKey:(id)a3
{
  return [(EKObject *)self _hasChangesForKey:a3 checkUnsaved:1];
}

- (id)_singleRelationshipKeysToCheckForChanges
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  unint64_t v3 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  BOOL v4 = [v2 setWithArray:v3];

  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(id)objc_opt_class() knownDerivedRelationshipKeys];
  id v7 = [v5 setWithArray:v6];
  [v4 unionSet:v7];

  return v4;
}

- (id)_multiRelationshipKeysToCheckForChanges
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  BOOL v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __51__EKObject_Shared___hasChangesForKey_checkUnsaved___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 && ([v3 isFrozen] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v6 = [v4 hasUnsavedChanges];
    }
    else {
      uint64_t v6 = [v4 hasChanges];
    }
    uint64_t v5 = v6;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)knownRelationshipSingleValueKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)knownRelationshipMultiValueKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)knownDerivedRelationshipKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)hasUnsavedChanges
{
  return [(EKObject *)self hasUnsavedChangesIgnoreKeys:0];
}

- (BOOL)hasUnsavedChangesIgnoreKeys:(id)a3
{
  return [(EKObject *)self _hasUnsavedChangesInKeys:0 ignoreKeys:a3];
}

- (BOOL)_hasUnsavedChangesInKeys:(id)a3 ignoreKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(EKObject *)self changeSet];
  if (v8)
  {
  }
  else if (![(EKObject *)self _cachedMeltedObjectsCount])
  {
    BOOL v19 = 0;
    goto LABEL_17;
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
  if (v6)
  {
    id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  }
  else
  {
    id v11 = 0;
  }
  int v12 = [(EKObject *)self changeSet];
  int v13 = [v12 hasUnsavedChanges];

  if (!v13) {
    goto LABEL_15;
  }
  id v14 = (void *)MEMORY[0x1E4F1CA80];
  int v15 = [(EKObject *)self changeSet];
  uint64_t v16 = [v15 changedKeys];
  uint64_t v17 = [v14 setWithSet:v16];

  [v17 minusSet:v10];
  if (v11) {
    [v17 intersectSet:v11];
  }
  uint64_t v18 = [v17 count];

  if (v18) {
    BOOL v19 = 1;
  }
  else {
LABEL_15:
  }
    BOOL v19 = [(EKObject *)self _hasChangeHelperInKeys:v11 ignoreKeys:v10 checkUnsaved:1];

LABEL_17:
  return v19;
}

- (unint64_t)_cachedMeltedObjectsCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__EKObject_Shared___cachedMeltedObjectsCount__block_invoke;
  v4[3] = &unk_1E5B96F20;
  v4[4] = self;
  v4[5] = &v5;
  [(EKObject *)self _performWithLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (CADGenerationStampedObjectID)CADObjectID
{
  unint64_t v2 = [(EKObject *)self persistentObject];
  id v3 = [v2 CADObjectID];

  return (CADGenerationStampedObjectID *)v3;
}

- (void)markAsNewShallow
{
  [(EKObject *)self _initChangeSetIfNone];
  id v3 = [(EKObject *)self changeSet];
  [v3 setIsNew:1];

  id v4 = [(EKObject *)self changeSet];
  [v4 setIsSaved:0];
}

- (void)setSingleChangedValue:(id)a3 forKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(EKObject *)self _initChangeSetIfNone];
  if (![(EKObject *)self _isPropertyUnavailable:v7 convertToFullObjectIfUnavailable:1])
  {
    id v9 = [(EKObject *)self changeSet];
    id v11 = [(EKObject *)self backingObject];
    uint64_t v10 = [(EKObject *)self additionalFrozenProperties];
    [v9 changeSingleValue:v6 forKey:v7 basedOn:v11 and:v10];
    goto LABEL_5;
  }
  uint64_t v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    id v9 = v8;
    uint64_t v10 = [(EKObject *)self backingObject];
    id v11 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v12 = 138413058;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    BOOL v19 = v11;
    _os_log_error_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_ERROR, "Unable to set single changed value %@. Property %@ was unavailable on backingObject %@. %@", (uint8_t *)&v12, 0x2Au);
LABEL_5:
  }
}

- (void)_initChangeSetIfNone
{
  id v3 = [(EKObject *)self changeSet];

  if (!v3)
  {
    id v4 = objc_alloc_init(EKChangeSet);
    [(EKObject *)self setChangeSet:v4];
  }
}

- (void)setChangeSet:(id)a3
{
}

- (void)setCachedValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__EKObject_Shared__setCachedValue_forKey___block_invoke;
  v10[3] = &unk_1E5B97190;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(EKObject *)self _performWithLock:v10];
}

- (EKObject)init
{
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() frozenClass]);
  id v4 = [(EKObject *)self initWithPersistentObject:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__validationContext, 0);
  objc_storeStrong((id *)&self->__cachedValues, 0);
  objc_storeStrong((id *)&self->_additionalMeltedObjects, 0);
  objc_storeStrong((id *)&self->_additionalFrozenProperties, 0);
  objc_storeStrong((id *)&self->_cachedMeltedObjects, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_persistentObject, 0);

  objc_storeStrong((id *)&self->__cachedMeltedObjects, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EKObject *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v9 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [(EKObject *)self persistentObject];
    id v8 = [(EKObject *)v6 persistentObject];

    char v9 = [v7 isEqual:v8];
  }
  else
  {
LABEL_5:
    char v9 = 0;
  }
LABEL_7:

  return v9;
}

- (void)setBackingObject:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  id v3 = [(objc_class *)[(EKObject *)self frozenClass] propertyKeyForUniqueIdentifier];
  id v4 = [(EKObject *)self singleChangedValueForKey:v3];

  return (NSString *)v4;
}

- (BOOL)hasNeverBeenCommitted
{
  unint64_t v2 = [(EKObject *)self backingObject];
  char v3 = [v2 isNew];

  return v3;
}

- (BOOL)isDifferentFromCommitted
{
  char v3 = [(EKObject *)self committedCopy];
  id v4 = [v3 diffWithObject:self];
  BOOL v5 = [v4 result] != 0;

  return v5;
}

- (id)frozenObject
{
  char v3 = [(EKObject *)self eventStore];
  id v4 = [(EKObject *)self frozenObjectInStore:v3];

  return v4;
}

- (id)frozenObjectInStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKObject *)self persistentObject];
  id v6 = [v5 frozenObjectInStore:v4];

  return v6;
}

- (BOOL)isCompletelyEqual:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4
{
  return [(EKObject *)self isEqual:a3 comparingKeys:0 compareImmutableKeys:0 ignoringProperties:a4];
}

- (BOOL)isEqual:(id)a3 comparingKeys:(id)a4 compareImmutableKeys:(BOOL)a5 ignoringProperties:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(v6) = [(id)objc_opt_class() _object:self equalsObject:v12 forKeys:v11 compareImmutableKeys:v6 ignoringProperties:v10];

  return v6;
}

+ (BOOL)_object:(id)a3 equalsObject:(id)a4 forKeys:(id)a5 compareImmutableKeys:(BOOL)a6 ignoringProperties:(id)a7
{
  BOOL v8 = a6;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  __int16 v16 = v15;
  if (v12 == v13)
  {
    char v20 = 1;
    goto LABEL_10;
  }
  if (![v15 count])
  {
    uint64_t v17 = [v12 hash];
    if (v17 != [v13 hash]) {
      goto LABEL_9;
    }
  }
  uint64_t v18 = [a1 meltedClass];
  uint64_t v19 = [a1 frozenClass];
  char v20 = 0;
  if (v12 && v13)
  {
    uint64_t v21 = v19;
    v25[0] = v12;
    v25[1] = v13;
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    int v23 = [a1 _objects:v22 haveSameMeltedClass:v18 frozenClass:v21];

    if (v23)
    {
      char v20 = [a1 _compareKnownKeys:v14 forObject:v12 againstObject:v13 compareImmutableKeys:v8 propertiesToIgnore:v16];
      goto LABEL_10;
    }
LABEL_9:
    char v20 = 0;
  }
LABEL_10:

  return v20;
}

+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareImmutableKeys:(BOOL)a6 propertiesToIgnore:(id)a7
{
  return [a1 _compareKnownKeys:a3 forObject:a4 againstObject:a5 compareIdentityKeys:1 compareImmutableKeys:a6 propertiesToIgnore:a7];
}

+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareIdentityKeys:(BOOL)a6 compareImmutableKeys:(BOOL)a7 propertiesToIgnore:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v15 == v16)
  {
    char v18 = 1;
  }
  else if (v10 {
         && ![a1 _compareIdentityKeysForObject:v15 againstObject:v16 propertiesToIgnore:v17])
  }
  {
    char v18 = 0;
  }
  else
  {
    char v18 = [a1 _compareNonIdentityKeys:v14 forObject:v15 againstObject:v16 compareImmutableKeys:v9 propertiesToIgnore:v17];
  }

  return v18;
}

+ (BOOL)_compareNonIdentityKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareImmutableKeys:(BOOL)a6 propertiesToIgnore:(id)a7
{
  id v11 = a3;
  id v39 = a4;
  id v38 = a5;
  id v12 = a7;
  id v13 = (void *)MEMORY[0x1E4F1CA80];
  id v14 = [a1 knownRelationshipMultiValueKeys];
  id v15 = [v13 setWithArray:v14];

  id v16 = (void *)MEMORY[0x1E4F1CA80];
  id v17 = [a1 knownRelationshipSingleValueKeys];
  char v18 = [v16 setWithArray:v17];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CA80];
  char v20 = [a1 knownSingleValueKeysForComparison];
  uint64_t v21 = [v19 setWithArray:v20];

  long long v22 = (void *)MEMORY[0x1E4F1CA80];
  int v23 = [a1 knownImmutableKeys];
  BOOL v24 = [v22 setWithArray:v23];

  v40 = v21;
  if (v11)
  {
    id v25 = v15;
    [v15 intersectSet:v11];
    [v18 intersectSet:v11];
    [v21 intersectSet:v11];
    [v24 intersectSet:v11];
  }
  else
  {
    id v25 = v15;
    if (!a6)
    {

      BOOL v24 = 0;
    }
  }
  uint64_t v26 = [v18 allObjects];
  long long v28 = v38;
  long long v27 = v39;
  int v29 = [a1 _compareSingleValueRelationshipKeys:v26 forObject:v39 againstObject:v38 propertiesToIgnore:v12];

  if (!v29
    || ([v25 allObjects],
        v30 = objc_claimAutoreleasedReturnValue(),
        int v31 = [a1 _compareMultiValueRelationshipKeys:v30 forObject:v39 againstObject:v38 propertiesToIgnore:v12], v30, !v31))
  {
    char v35 = 0;
    goto LABEL_11;
  }
  __int16 v32 = [v40 allObjects];
  int v33 = [a1 _compareNonRelationshipKeys:v32 forObject:v39 againstObject:v38 propertiesToIgnore:v12];

  if (!v33)
  {
    char v35 = 0;
LABEL_14:
    long long v28 = v38;
    long long v27 = v39;
    goto LABEL_11;
  }
  if (!v24)
  {
    char v35 = 1;
    goto LABEL_14;
  }
  v34 = [v24 allObjects];
  long long v28 = v38;
  long long v27 = v39;
  char v35 = [a1 _compareNonRelationshipKeys:v34 forObject:v39 againstObject:v38 propertiesToIgnore:v12];

LABEL_11:
  return v35;
}

+ (BOOL)_compareIdentityKeysForObject:(id)a3 againstObject:(id)a4 propertiesToIgnore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 knownIdentityKeysForComparison];
  LOBYTE(a1) = [a1 _compareNonRelationshipKeys:v11 forObject:v10 againstObject:v9 propertiesToIgnore:v8];

  return (char)a1;
}

+ (BOOL)_compareSingleValueRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        if (!objc_msgSend(a1, "_compareSingleValueRelationshipKey:forObject:againstObject:propertiesToIgnore:ignoreIdentityKeys:", *(void *)(*((void *)&v21 + 1) + 8 * i), v11, v12, v13, 0, (void)v21))
        {
          BOOL v19 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareMultiValueRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        if (!objc_msgSend(a1, "_compareMutliValueRelationshipKey:forObject:againstObject:propertiesToIgnore:", *(void *)(*((void *)&v21 + 1) + 8 * i), v11, v12, v13, (void)v21))
        {
          BOOL v19 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareMutliValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 isPropertyUnavailable:v10]
    && ([v12 isPropertyUnavailable:v10] & 1) != 0)
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = v11;
    id v16 = v12;
    int v17 = [v15 isPartialObject];
    if (v17 != [v16 isPartialObject])
    {
      uint64_t v18 = [a1 _createNonPartialObjectFromObject:v15 ifPropertyIsUnavailable:v10];

      uint64_t v19 = [a1 _createNonPartialObjectFromObject:v16 ifPropertyIsUnavailable:v10];

      id v16 = (id)v19;
      id v15 = (id)v18;
    }
    char v20 = [v15 valueForKey:v10];
    long long v21 = [v16 valueForKey:v10];
    uint64_t v22 = [v20 count];
    if (v22 == [v21 count])
    {
      id v45 = v11;
      v46 = v21;
      id v42 = v15;
      id v43 = v16;
      id v44 = v12;
      long long v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v41 = v20;
      id v24 = v20;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v52 != v27) {
              objc_enumerationMutation(v24);
            }
            int v29 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v30 = [v29 uniqueIdentifier];
            if (v30) {
              [v23 setObject:v29 forKeyedSubscript:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v26);
      }

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v31 = v46;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        id v40 = v10;
        uint64_t v34 = *(void *)v48;
        while (2)
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v48 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            v37 = [v36 uniqueIdentifier];
            id v38 = [v23 objectForKeyedSubscript:v37];
            LODWORD(v36) = [a1 _compareRelationshipObject1:v38 againstRelationshipObject2:v36 propertiesToIgnore:v13];

            if (!v36)
            {
              BOOL v14 = 0;
              goto LABEL_27;
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v33) {
            continue;
          }
          break;
        }
        BOOL v14 = 1;
LABEL_27:
        id v10 = v40;
      }
      else
      {
        BOOL v14 = 1;
      }

      id v12 = v44;
      id v11 = v45;
      id v15 = v42;
      id v16 = v43;
      char v20 = v41;
      long long v21 = v46;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  return v14;
}

+ (BOOL)_compareRelationshipObject1:(id)a3 againstRelationshipObject2:(id)a4 propertiesToIgnore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v7 == 0) != (v8 == 0)) {
    goto LABEL_5;
  }
  BOOL v10 = 1;
  if (v7 && v8)
  {
    id v11 = (void *)[(id)objc_opt_class() meltedClass];
    if (v11 != (void *)[(id)objc_opt_class() meltedClass])
    {
LABEL_5:
      BOOL v10 = 0;
      goto LABEL_6;
    }
    if ([v11 isWeakRelationship]) {
      char v13 = [v11 _compareIdentityKeysForObject:v7 againstObject:v8 propertiesToIgnore:v9];
    }
    else {
      char v13 = [v7 isEqual:v8 ignoringProperties:v9];
    }
    BOOL v10 = v13;
  }
LABEL_6:

  return v10;
}

+ (BOOL)_objects:(id)a3 haveSameMeltedClass:(Class)a4 frozenClass:(Class)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(a1, "meltedClass", (void)v13);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [a1 frozenClass];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v11 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (Class)frozenClass
{
  return 0;
}

+ (id)_createNonPartialObjectFromObject:(id)a3 ifPropertyIsUnavailable:(id)a4
{
  return 0;
}

- (BOOL)canBeConvertedToFullObject
{
  return 0;
}

- (id)preFrozenRelationshipObjects
{
  return 0;
}

- (Class)frozenClass
{
  unint64_t v2 = [(EKObject *)self persistentObject];
  char v3 = objc_opt_class();

  return (Class)v3;
}

- (BOOL)isPartialObject
{
  return 0;
}

+ (id)propertiesUnavailableForPartialObjects
{
  return 0;
}

- (CADGenerationStampedObjectID)rebasedFrom
{
  return (CADGenerationStampedObjectID *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57168]];
}

- (void)rebase
{
  id v3 = [(EKObject *)self eventStore];
  [(EKObject *)self rebaseToEventStore:v3];
}

- (void)rebaseToEventStore:(id)a3
{
}

- (void)rebaseSkippingRelationProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(EKObject *)self eventStore];
  [(EKObject *)self rebaseSkippingRelationProperties:v4 toEventStore:v5];
}

- (void)rebaseSkippingRelationProperties:(id)a3 toEventStore:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(EKObject *)self _initChangeSetIfNone];
  uint64_t v8 = [(EKObject *)self persistentObject];
  id v43 = [v8 objectID];

  uint64_t v9 = [(EKObject *)self persistentObject];
  BOOL v10 = (void *)[v9 copy];

  [v10 _setEventStore:v7];
  BOOL v11 = [(EKObject *)self additionalFrozenProperties];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __58__EKObject_rebaseSkippingRelationProperties_toEventStore___block_invoke;
  v60[3] = &unk_1E5B96D28;
  v60[4] = self;
  id v42 = v10;
  id v61 = v42;
  [v11 enumerateKeysAndObjectsUsingBlock:v60];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v12 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v57;
    id v44 = v6;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v57 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        if (([v6 containsObject:v17] & 1) == 0)
        {
          uint64_t v18 = [(EKObject *)self valueForKey:v17];
          if (v18
            && [(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v18 forKey:v17])
          {
            [v18 rebaseToEventStore:v7];
            [(EKObject *)self changeSet];
            char v20 = v19 = v12;
            long long v21 = [v18 frozenObject];
            [v20 forceChangeValue:v21 forKey:v17];

            id v12 = v19;
            id v6 = v44;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v14);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v53;
    uint64_t v45 = *(void *)v53;
    do
    {
      uint64_t v25 = 0;
      uint64_t v46 = v23;
      do
      {
        if (*(void *)v53 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v52 + 1) + 8 * v25);
        if ([v6 containsObject:v26])
        {
          uint64_t v27 = [(EKObject *)self changeSet];
          id v28 = [v27 multiValueRemovals];
          [v28 setObject:0 forKeyedSubscript:v26];
        }
        else
        {
          int v29 = [(EKObject *)self valueForKey:v26];
          v30 = [(EKObject *)self changeSet];
          uint64_t v63 = v26;
          id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
          [v30 rollbackChangesForKeys:v31];

          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v28 = v29;
          uint64_t v32 = [v28 countByEnumeratingWithState:&v48 objects:v62 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            id v34 = v6;
            uint64_t v35 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v49 != v35) {
                  objc_enumerationMutation(v28);
                }
                v37 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                if (v37
                  && [(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v37 forKey:v26])
                {
                  [v37 rebaseToEventStore:v7];
                  id v38 = [v37 frozenObject];
                  [(EKObject *)self addMultiChangedObjectValue:v38 forKey:v26];
                }
              }
              uint64_t v33 = [v28 countByEnumeratingWithState:&v48 objects:v62 count:16];
            }
            while (v33);
            uint64_t v27 = v28;
            id v6 = v34;
            uint64_t v24 = v45;
            uint64_t v23 = v46;
          }
          else
          {
            uint64_t v27 = v28;
          }
        }

        ++v25;
      }
      while (v25 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v23);
  }

  id v39 = [v42 objectID];
  [v7 recordObjectRebaseWithOldObjectID:v43 newObjectID:v39];
  id v40 = [(EKObject *)self persistentObject];
  v41 = [v40 CADObjectID];
  [v42 setValue:v41 forKey:*MEMORY[0x1E4F57168]];

  [(EKObject *)self setPersistentObject:v42];
}

void __58__EKObject_rebaseSkippingRelationProperties_toEventStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  if ([v6 containsObject:v13])
  {
  }
  else
  {
    id v7 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
    char v8 = [v7 containsObject:v13];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(id)objc_opt_class() keysToIgnoreForApplyingChanges];
      char v10 = [v9 containsObject:v13];

      if ((v10 & 1) == 0)
      {
        BOOL v11 = [*(id *)(a1 + 32) changeSet];
        char v12 = [v11 hasUnsavedChangeForKey:v13];

        if ((v12 & 1) == 0) {
          [*(id *)(a1 + 40) setValue:v5 forKey:v13];
        }
      }
    }
  }
}

- (int)rowID
{
  unint64_t v2 = [(EKObject *)self objectID];
  int v3 = [v2 rowID];

  return v3;
}

- (BOOL)existsInStore
{
  unint64_t v2 = [(EKObject *)self persistentObject];
  if ([v2 isNew]) {
    char v3 = 0;
  }
  else {
    char v3 = [v2 existsInStore];
  }

  return v3;
}

+ (id)objectsIDsExistingInStoreFromObjects:(id)a3 eventStore:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  char v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = [v14 persistentObject];
        char v16 = [v15 isNew];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = [v14 CADObjectID];
          uint64_t v18 = v17;
          if (v17 && ([v17 isTemporary] & 1) == 0) {
            [v8 addObject:v18];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    uint64_t v19 = [v6 connection];
    char v20 = [v19 CADOperationProxySync];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__EKObject_objectsIDsExistingInStoreFromObjects_eventStore___block_invoke;
    v22[3] = &unk_1E5B96D50;
    id v23 = v8;
    id v24 = v7;
    [v20 CADObjectsExist:v23 reply:v22];
  }

  return v7;
}

void __60__EKObject_objectsIDsExistingInStoreFromObjects_eventStore___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    NSLog(&cfstr_ErrorCheckingW.isa, v3, v11);
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (([v4 containsObject:v10] & 1) == 0) {
            [*(id *)(a1 + 40) addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)hasEverBeenCommitted
{
  return ![(EKPersistentObject *)self->_persistentObject isNew];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(EKObject *)self _copyWithoutChangesInZone:a3];
  if ([(EKObject *)self hasUnsavedChanges]) {
    [v4 addChangesFromObject:self copyingBackingObjects:0];
  }
  return v4;
}

- (id)shallowCopyWithoutChanges
{
  id v2 = [(EKObject *)self _copyWithoutChangesInZone:0];

  return v2;
}

- (id)_copyWithoutChangesInZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(EKObject *)self persistentObject];
  uint64_t v6 = (void *)[v4 initWithPersistentObject:v5 objectForCopy:self];

  uint64_t v7 = [(EKObject *)self additionalFrozenProperties];
  [v6 setAdditionalFrozenProperties:v7];

  return v6;
}

- (id)duplicate
{
  uint64_t v3 = [(EKObject *)self eventStore];
  id v4 = [(EKObject *)self duplicateToEventStore:v3];

  return v4;
}

- (id)duplicateToEventStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(EKObject *)self copy];
  [v5 rebaseToEventStore:v4];

  [v5 markAsNew];

  return v5;
}

- (id)committedCopy
{
  uint64_t v3 = [(id)objc_opt_class() defaultPropertyKeysToSkipForRecursiveSnapshotCopies];
  id v4 = [(EKObject *)self _recursiveSnapshotCopyWithPropertyAccessor:&__block_literal_global_5 propertyKeysToCopy:0 propertyKeysToSkip:v3 recurseOnWeakRelations:1];

  return v4;
}

id __25__EKObject_committedCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 persistentObject];
  uint64_t v6 = [v5 loadedPropertyForKey:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)snapshotCopy
{
  return [(EKObject *)self snapshotCopyWithPropertyKeysToCopy:0];
}

- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() defaultPropertyKeysToSkipForRecursiveSnapshotCopies];
  uint64_t v6 = [(EKObject *)self snapshotCopyWithPropertyKeysToCopy:v4 propertyKeysToSkip:v5];

  return v6;
}

- (id)snapshotCopyWithPropertyKeysToCopy:(id)a3 propertyKeysToSkip:(id)a4
{
  return [(EKObject *)self _recursiveSnapshotCopyWithPropertyAccessor:&__block_literal_global_22 propertyKeysToCopy:a3 propertyKeysToSkip:a4 recurseOnWeakRelations:1];
}

id __66__EKObject_snapshotCopyWithPropertyKeysToCopy_propertyKeysToSkip___block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "valueForKey:");
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  id v5 = v4;

  return v5;
}

- (id)previouslySavedCopy
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__EKObject_previouslySavedCopy__block_invoke;
  v6[3] = &unk_1E5B96D98;
  v6[4] = self;
  uint64_t v3 = [(id)objc_opt_class() defaultPropertyKeysToSkipForRecursiveSnapshotCopies];
  id v4 = [(EKObject *)self _recursiveSnapshotCopyWithPropertyAccessor:v6 propertyKeysToCopy:0 propertyKeysToSkip:v3 recurseOnWeakRelations:1];

  return v4;
}

id __31__EKObject_previouslySavedCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 _previousValueForKey:v5];
  if (!v6)
  {
    id v19 = [MEMORY[0x1E4F1CA98] null];
LABEL_37:
    id v18 = v19;
    goto LABEL_38;
  }
  id v7 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) cachedMeltedObjectForSingleValueKey:v5];
    uint64_t v10 = [v9 objectID];
    id v11 = [v6 objectID];
    char v12 = [v10 isEqual:v11];

    if (v12)
    {
LABEL_6:
      id v18 = v9;

      goto LABEL_38;
    }
    long long v13 = [*(id *)(a1 + 32) additionalMeltedObjects];
    long long v14 = [v13 objectForKeyedSubscript:v5];

    long long v15 = [v14 objectID];
    char v16 = [v6 objectID];
    int v17 = [v15 isEqual:v16];

    if (v17)
    {
      id v9 = v14;
      goto LABEL_6;
    }

    goto LABEL_36;
  }
  char v20 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  int v21 = [v20 containsObject:v5];

  if (!v21)
  {
LABEL_36:
    id v19 = v6;
    goto LABEL_37;
  }
  long long v49 = v6;
  uint64_t v22 = (void *)[v6 mutableCopy];
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v22, "count"));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v50 = v5;
  id v23 = [*(id *)(a1 + 32) cachedMeltedObjectsForMultiValueKey:v5];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v60 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        int v29 = [v28 persistentObject];
        int v30 = [v22 containsObject:v29];

        if (v30)
        {
          [v18 addObject:v28];
          id v31 = [v28 persistentObject];
          [v22 removeObject:v31];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v25);
  }
  uint64_t v32 = [*(id *)(a1 + 32) additionalMeltedObjects];
  uint64_t v33 = [v32 objectForKeyedSubscript:v50];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v56 != v37) {
          objc_enumerationMutation(v34);
        }
        id v39 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        id v40 = [v39 persistentObject];
        int v41 = [v22 containsObject:v40];

        if (v41)
        {
          [v18 addObject:v39];
          id v42 = [v39 persistentObject];
          [v22 removeObject:v42];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v36);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v43 = v22;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(v43);
        }
        [v18 addObject:*(void *)(*((void *)&v51 + 1) + 8 * k)];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v45);
  }

  uint64_t v6 = v49;
  id v5 = v50;
LABEL_38:

  return v18;
}

+ (id)_array:(id)a3 intersectedWithSet:(id)a4 minusSet:(id)a5
{
  id v7 = a3;
  unint64_t v8 = (unint64_t)a4;
  unint64_t v9 = (unint64_t)a5;
  if (v8 | v9)
  {
    id v11 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
    char v12 = v11;
    if (v8) {
      [v11 intersectSet:v8];
    }
    if (v9) {
      [v12 minusSet:v9];
    }
    id v10 = [v12 allObjects];
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (id)_recursiveSnapshotCopyWithPropertyAccessor:(id)a3 propertyKeysToCopy:(id)a4 propertyKeysToSkip:(id)a5 recurseOnWeakRelations:(BOOL)a6
{
  BOOL v98 = a6;
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  v99 = (void (**)(id, EKObject *, void))a3;
  id v9 = a4;
  id v10 = a5;
  context = (void *)MEMORY[0x1A62664B0]();
  id v11 = objc_alloc((Class)objc_opt_class());
  char v12 = [(EKObject *)self persistentObject];
  v85 = (void *)[v11 initWithPersistentObject:v12 objectForCopy:self];

  v93 = objc_opt_new();
  long long v13 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  long long v14 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  long long v15 = [(id)objc_opt_class() knownSingleValueKeysForComparison];
  char v16 = [(id)objc_opt_class() _array:v13 intersectedWithSet:v9 minusSet:v10];

  int v17 = [(id)objc_opt_class() _array:v14 intersectedWithSet:v9 minusSet:v10];

  v94 = v10;
  v95 = v9;
  id v18 = [(id)objc_opt_class() _array:v15 intersectedWithSet:v9 minusSet:v10];

  uint64_t v19 = [v16 count];
  uint64_t v20 = [v17 count] + v19;
  uint64_t v21 = [v18 count];
  uint64_t v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v20 + v21];
  [v22 addObjectsFromArray:v16];
  v90 = v17;
  [v22 addObjectsFromArray:v17];
  v80 = v18;
  [v22 addObjectsFromArray:v18];
  v100 = self;
  id v23 = [(EKObject *)self persistentObject];
  v81 = v22;
  [v23 loadPropertiesIfNeeded:v22];

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = v16;
  uint64_t v24 = [obj countByEnumeratingWithState:&v113 objects:v124 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    id v96 = *(id *)v114;
    do
    {
      uint64_t v26 = 0;
      uint64_t v27 = v25;
      do
      {
        if (*(id *)v114 != v96) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v113 + 1) + 8 * v26);
        int v29 = (void *)MEMORY[0x1A62664B0]();
        int v30 = v99[2](v99, v100, v28);
        if (v30)
        {
          uint64_t v31 = objc_opt_class();
          if (v31 == objc_opt_class())
          {
            uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
            [v93 setObject:v36 forKey:v28];
LABEL_19:

            uint64_t v25 = v27;
            goto LABEL_20;
          }
          uint64_t v32 = [(EKObject *)v100 eventStore];
          uint64_t v33 = [v30 frozenObjectInStore:v32];
          [v93 setObject:v33 forKey:v28];

          int v34 = [(id)objc_opt_class() isWeakRelationObject:v30 forKey:v28] ^ 1;
          if ((v34 & 1) != 0 || v98)
          {
            uint64_t v35 = [(EKObject *)v100 eventStore];
            uint64_t v36 = [v30 meltedObjectInStore:v35];

            uint64_t v37 = [(id)objc_opt_class() defaultPropertyKeysToSkipForRecursiveSnapshotCopies];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v38 = v95;
              id v39 = v94;

              uint64_t v37 = v39;
            }
            else
            {
              id v38 = 0;
            }
            id v40 = [v36 _recursiveSnapshotCopyWithPropertyAccessor:v99 propertyKeysToCopy:v38 propertyKeysToSkip:v37 recurseOnWeakRelations:v34 & v98];
            if (v40)
            {
              [v85 setCachedMeltedObject:v40 forSingleValueKey:v28];
            }
            else
            {
              int v41 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                id v42 = v41;
                uint64_t v43 = objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v121 = v30;
                __int16 v122 = 2114;
                uint64_t v123 = v43;
                _os_log_error_impl(&dword_1A4E47000, v42, OS_LOG_TYPE_ERROR, "Failed to create committed relationship for relation %@ (%{public}@)", buf, 0x16u);
              }
            }

            goto LABEL_19;
          }
        }
LABEL_20:

        ++v26;
      }
      while (v25 != v26);
      uint64_t v25 = [obj countByEnumeratingWithState:&v113 objects:v124 count:16];
    }
    while (v25);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v86 = v90;
  uint64_t v44 = [v86 countByEnumeratingWithState:&v109 objects:v119 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v110;
    uint64_t v83 = *(void *)v110;
    do
    {
      uint64_t v47 = 0;
      uint64_t v84 = v45;
      do
      {
        if (*(void *)v110 != v46) {
          objc_enumerationMutation(v86);
        }
        uint64_t v48 = *(void *)(*((void *)&v109 + 1) + 8 * v47);
        long long v49 = (void *)MEMORY[0x1A62664B0]();
        id v50 = v99[2](v99, v100, v48);
        if (v50)
        {
          uint64_t v51 = objc_opt_class();
          if (v51 == objc_opt_class())
          {
            v68 = [MEMORY[0x1E4F1CAD0] set];
            [v93 setObject:v68 forKey:v48];
          }
          else
          {
            v91 = v49;
            uint64_t v92 = v47;
            long long v52 = [v50 valueForKey:@"frozenObject"];
            uint64_t v88 = v48;
            [v93 setObject:v52 forKey:v48];

            long long v53 = objc_opt_new();
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            v89 = v50;
            id v97 = v50;
            uint64_t v54 = [v97 countByEnumeratingWithState:&v105 objects:v118 count:16];
            if (v54)
            {
              uint64_t v55 = v54;
              uint64_t v56 = *(void *)v106;
              do
              {
                uint64_t v57 = 0;
                do
                {
                  if (*(void *)v106 != v56) {
                    objc_enumerationMutation(v97);
                  }
                  long long v58 = *(void **)(*((void *)&v105 + 1) + 8 * v57);
                  long long v59 = [(EKObject *)v100 eventStore];
                  long long v60 = [v58 meltedObjectInStore:v59];

                  long long v61 = [(id)objc_opt_class() defaultPropertyKeysToSkipForRecursiveSnapshotCopies];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v62 = v95;
                    id v63 = v94;

                    long long v61 = v63;
                  }
                  else
                  {
                    id v62 = 0;
                  }
                  v64 = [v60 _recursiveSnapshotCopyWithPropertyAccessor:v99 propertyKeysToCopy:v62 propertyKeysToSkip:v61 recurseOnWeakRelations:v98];
                  if (v64)
                  {
                    [v53 addObject:v64];
                  }
                  else
                  {
                    v65 = (void *)EKLogHandle;
                    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v66 = v65;
                      uint64_t v67 = objc_opt_class();
                      *(_DWORD *)buf = 138412546;
                      v121 = 0;
                      __int16 v122 = 2114;
                      uint64_t v123 = v67;
                      _os_log_error_impl(&dword_1A4E47000, v66, OS_LOG_TYPE_ERROR, "Failed to create committed relationship for relation %@ (%{public}@)", buf, 0x16u);
                    }
                  }

                  ++v57;
                }
                while (v55 != v57);
                uint64_t v55 = [v97 countByEnumeratingWithState:&v105 objects:v118 count:16];
              }
              while (v55);
            }

            v68 = v53;
            v69 = [MEMORY[0x1E4F1CAD0] setWithSet:v53];
            [v85 setCachedMeltedObjects:v69 forMultiValueKey:v88];

            uint64_t v46 = v83;
            uint64_t v45 = v84;
            long long v49 = v91;
            uint64_t v47 = v92;
            id v50 = v89;
          }
        }
        ++v47;
      }
      while (v47 != v45);
      uint64_t v45 = [v86 countByEnumeratingWithState:&v109 objects:v119 count:16];
    }
    while (v45);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v70 = v80;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v101 objects:v117 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v72; ++i)
      {
        if (*(void *)v102 != v73) {
          objc_enumerationMutation(v70);
        }
        uint64_t v75 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        v76 = (void *)MEMORY[0x1A62664B0]();
        v77 = v99[2](v99, v100, v75);
        if (v77) {
          [v93 setObject:v77 forKey:v75];
        }
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v101 objects:v117 count:16];
    }
    while (v72);
  }

  v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v93];
  [v85 setAdditionalFrozenProperties:v78];

  [v85 _resetInternalStateWithForce:0];

  return v85;
}

- (BOOL)_reset
{
  uint64_t v3 = [(EKObject *)self persistentObject];
  [v3 reset];

  return [(EKObject *)self _resetCommon];
}

- (BOOL)refresh
{
  return [(EKObject *)self refreshAndNotify:1];
}

- (BOOL)refreshAndNotify:(BOOL)a3
{
  if ([(EKObject *)self isNew]) {
    return 0;
  }
  id v4 = [(EKObject *)self persistentObject];
  int v5 = [v4 existsInStore];

  if (!v5) {
    return 0;
  }

  return [(EKObject *)self _refreshCommon];
}

- (void)markAsNew
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v3 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if ([(EKObject *)self _hasChangesForKey:v8])
        {
          id v9 = [(EKObject *)self valueForKey:v8];
          if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v9 forKey:v8])
          {
            id v10 = [v9 existingMeltedObject];
            [v10 markAsNew];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        if ([(EKObject *)self _hasChangesForKey:v15])
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          char v16 = [(EKObject *)self valueForKey:v15];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            do
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * k);
                if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v21 forKey:v15])
                {
                  uint64_t v22 = [v21 existingMeltedObject];
                  [v22 markAsNew];
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
            }
            while (v18);
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v12);
  }

  [(EKObject *)self markAsNewShallow];
}

- (void)markAsUndeleted
{
  [(EKObject *)self rebase];

  [(EKObject *)self _markAsUndeletedCommon];
}

- (void)markAsCommitted
{
  [(EKObject *)self _markAsCommittedCommon];

  [(EKObject *)self _performBlockOnOwnedCachedRelatedObjects:&__block_literal_global_29];
}

uint64_t __27__EKObject_markAsCommitted__block_invoke(uint64_t a1, void *a2)
{
  return [a2 markAsCommitted];
}

- (void)_performBlockOnOwnedCachedRelatedObjects:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = [(EKObject *)self cachedMeltedObjectForSingleValueKey:v10];
        if (v11
          && [(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v11 forKey:v10])
        {
          v4[2](v4, v11);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v14 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:v13];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * k);
              if (v19
                && [(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v19 forKey:v13])
              {
                v4[2](v4, v19);
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v16);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v22);
  }
}

- (void)updatePersistentValueForKeyIfNeeded:(id)a3
{
  id v4 = a3;
  if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:")) {
    [(EKObject *)self _updatePersistentValueForKey:v4];
  }
}

- (void)_updatePersistentValueForKey:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKObject *)self _propertyValueForKey:v4];
  uint64_t v6 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = v5;
    id v9 = [(EKObject *)self persistentObject];
    uint64_t v10 = [v8 persistentObject];
    [v9 setValue:v10 forKey:v4];

    [v8 updatePersistentObject];
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
    int v12 = [v11 containsObject:v4];

    if (v12)
    {
      id v13 = v5;
      long long v14 = [(EKObject *)self persistentObject];
      uint64_t v15 = [v13 valueForKey:@"persistentObject"];
      [v14 setValue:v15 forKey:v4];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v16 = v13;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v22;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v22 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "updatePersistentObject", (void)v21);
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v18);
      }
    }
    else
    {
      id v16 = [(EKObject *)self persistentObject];
      [v16 setValue:v5 forKey:v4];
    }
  }
}

- (id)_propertyValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:v4];
  }
  else
  {
    id v8 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
    int v9 = [v8 containsObject:v4];

    if (v9) {
      [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:v4];
    }
    else {
    uint64_t v7 = [(EKObject *)self singleChangedValueForKey:v4];
    }
  }
  uint64_t v10 = (void *)v7;
  uint64_t v11 = [MEMORY[0x1E4F1CA98] null];

  if (v10 == v11)
  {

    uint64_t v10 = 0;
  }

  return v10;
}

- (void)insertPersistentObjectIfNeeded
{
  id v3 = [(EKObject *)self persistentObject];
  if ([v3 isNew] && (objc_msgSend(v3, "_isPendingInsert") & 1) == 0)
  {
    id v2 = [v3 eventStore];
    [v2 _insertObject:v3];
  }
}

- (void)updatePersistentObject
{
}

- (void)updatePersistentObjectSkippingProperties:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKObject *)self changeSet];
  int v6 = [v5 changedKeys];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        if (([v4 containsObject:v12] & 1) == 0) {
          [(EKObject *)self _updatePersistentValueForKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v9);
  }

  id v13 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        if (([v4 containsObject:v18] & 1) == 0
          && ([v7 containsObject:v18] & 1) == 0
          && [(EKObject *)self _hasChangesForKey:v18])
        {
          uint64_t v19 = [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:v18];
          [v19 updatePersistentObject];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v15);
  }
  long long v31 = v13;
  uint64_t v20 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    long long v32 = v20;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * k);
        if ((objc_msgSend(v4, "containsObject:", v25, v31) & 1) == 0
          && ([v7 containsObject:v25] & 1) == 0
          && [(EKObject *)self _hasChangesForKey:v25])
        {
          uint64_t v26 = [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:v25];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v34;
            do
            {
              for (uint64_t m = 0; m != v28; ++m)
              {
                if (*(void *)v34 != v29) {
                  objc_enumerationMutation(v26);
                }
                [*(id *)(*((void *)&v33 + 1) + 8 * m) updatePersistentObject];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
            }
            while (v28);
          }

          uint64_t v20 = v32;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v22);
  }
}

- (void)deletePersistentObject
{
  id v3 = [(EKObject *)self persistentObject];
  id v2 = [v3 eventStore];
  [v2 _deleteObject:v3];
}

- (void)addCoCommitObject:(id)a3
{
  id v4 = a3;
  id v6 = [(EKObject *)self persistentObject];
  uint64_t v5 = [v4 persistentObject];

  [v6 addCoCommitObject:v5];
}

- (void)setPersistentObject:(id)a3
{
}

- (NSDictionary)cachedMeltedObjects
{
  return self->_cachedMeltedObjects;
}

- (void)setCachedMeltedObjects:(id)a3
{
}

- (void)setAdditionalFrozenProperties:(id)a3
{
}

- (NSDictionary)additionalMeltedObjects
{
  return self->_additionalMeltedObjects;
}

- (void)setAdditionalMeltedObjects:(id)a3
{
}

- (EKObjectValidationContext)_validationContext
{
  return self->__validationContext;
}

- (void)set_validationContext:(id)a3
{
}

- (id)_basicSummaryWithDepth:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[EKDiff _indentStringAtDepth:a3];
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v19 = (void *)v4;
  id v6 = [NSString stringWithFormat:@"%@%@ <0x%x>", v4, objc_opt_class(), self];
  [v5 appendString:v6];

  id v7 = [(id)objc_opt_class() knownSummaryKeys];
  uint64_t v8 = [(id)objc_opt_class() knownIdentityKeysForComparison];
  uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = [(EKObject *)self valueForKey:v15];
        if (v16)
        {
          uint64_t v17 = [(EKObject *)self valueForKey:v15];
          [v5 appendFormat:@", %@:%@", v15, v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v5;
}

- (id)_summaryWithDepth:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  id v6 = [(EKObject *)self _basicSummaryWithDepth:a3];
  [v5 appendString:v6];

  [(EKObject *)self _addSummaryWithDepth:0 toMutableString:v5 indentFirstLine:0];

  return v5;
}

- (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 indentFirstLine:(BOOL)a5
{
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() knownSingleValueKeysForComparison];
  +[EKDiff _addSummaryWithDepth:a3 toMutableString:v7 forSingleValueKeys:v8 firstObject:self secondObject:0];

  id v10 = [(id)objc_opt_class() knownDerivedAndSingleValueRelationshipKeys];
  +[EKDiff _addSummaryWithDepth:a3 toMutableString:v7 forRelationshipSingleValueKeys:v10 firstObject:self secondObject:0];
  uint64_t v9 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  +[EKDiff _addSummaryWithDepth:a3 toMutableString:v7 forRelationshipMultiValueKeys:v9 firstObject:self secondObject:0];
}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  return 0;
}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  return 0;
}

+ (unint64_t)_numberOfSharedLocksForUnitTesting
{
  return 8;
}

- (id)cachedValueForKey:(id)a3
{
  return [(EKObject *)self cachedValueForKey:a3 populateBlock:0];
}

- (void)clearCachedValuesForKeys:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__EKObject_Shared__clearCachedValuesForKeys___block_invoke;
  v6[3] = &unk_1E5B97140;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(EKObject *)self _performWithLock:v6];
}

void __45__EKObject_Shared__clearCachedValuesForKeys___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "_cachedValues", (void)v9);
        [v8 removeObjectForKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)cachedValueForKey:(id)a3 expectingCachedValue:(id)a4 forMasterKey:(id)a5 relatedKeys:(id)a6 populateBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(void))a7;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__18;
  long long v40 = __Block_byref_object_dispose__18;
  id v41 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke;
  v31[3] = &unk_1E5B98CF0;
  v31[4] = self;
  id v17 = v14;
  id v32 = v17;
  id v18 = v13;
  id v33 = v18;
  long long v35 = &v36;
  id v19 = v12;
  id v34 = v19;
  [(EKObject *)self _performWithLock:v31];
  long long v20 = (void *)v37[5];
  if (v16 && !v20)
  {
    uint64_t v21 = v16[2](v16);
    long long v22 = (void *)v37[5];
    v37[5] = v21;

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke_2;
    void v25[3] = &unk_1E5B98D18;
    v25[4] = self;
    id v26 = v17;
    id v27 = v18;
    id v28 = v15;
    id v29 = v19;
    long long v30 = &v36;
    [(EKObject *)self _performWithLock:v25];

    long long v20 = (void *)v37[5];
  }
  id v23 = v20;

  _Block_object_dispose(&v36, 8);

  return v23;
}

void __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedValues];
  uint64_t v8 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  unint64_t v3 = *(void *)(a1 + 48);
  if (!(v3 | v8) || [(id)v3 isEqual:v8])
  {
    uint64_t v4 = [*(id *)(a1 + 32) _cachedValues];
    uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 56)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __98__EKObject_Shared__cachedValueForKey_expectingCachedValue_forMasterKey_relatedKeys_populateBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _cachedValues];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  unint64_t v4 = *(void *)(a1 + 48);
  if (v4 | v3 && ([(id)v4 isEqual:v3] & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
          long long v11 = objc_msgSend(*(id *)(a1 + 32), "_cachedValues", (void)v16);
          [v11 removeObjectForKey:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [*(id *)(a1 + 32) _cachedValues];
    [v13 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v15 = objc_msgSend(*(id *)(a1 + 32), "_cachedValues", (void)v16);
  [v15 setObject:v14 forKeyedSubscript:*(void *)(a1 + 64)];
}

+ (BOOL)isWeakRelationship
{
  return 0;
}

+ (BOOL)isDerivedRelationship
{
  return 0;
}

+ (id)knownDerivedAndSingleValueRelationshipKeys
{
  id v2 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v3 = [(id)objc_opt_class() knownDerivedRelationshipKeys];
  unint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (BOOL)shouldLoadRelationshipForValidation:(id)a3
{
  return 1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_3 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_3, &__block_literal_global_59);
  }
  id v2 = (void *)knownRelationshipWeakKeys_keys_3;

  return v2;
}

void __45__EKObject_Shared__knownRelationshipWeakKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57160];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownRelationshipWeakKeys_keys_3;
  knownRelationshipWeakKeys_keys_3 = v0;
}

+ (id)knownImmutableKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)knownIdentityKeysForComparison
{
  return 0;
}

+ (id)specialComparisonBlocks
{
  return 0;
}

+ (id)knownSingleValueKeysForComparison
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)knownSingleValueKeysToSkipForUIComparison
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)defaultPropertyKeysToSkipForRecursiveSnapshotCopies
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

+ (BOOL)isMeltedAndNotWeakRelationshipObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 isFrozen] & 1) == 0)
  {
    uint64_t v9 = [v6 existingMeltedObject];
    char v10 = [a1 isWeakRelationObject:v9 forKey:v7];

    char v8 = v10 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isWeakRelationObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "isWeakRelationship"))
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [a1 knownRelationshipWeakKeys];
    char v6 = [v7 containsObject:v5];
  }
  return v6;
}

- (BOOL)validate:(id *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = [(EKObject *)self _validationContext];
  if (!v5)
  {
    id v5 = [[EKObjectValidationContext alloc] initWithRootObject:self];
    [(EKObject *)self set_validationContext:v5];
  }
  [(EKObjectValidationContext *)v5 setDepth:[(EKObjectValidationContext *)v5 depth] + 1];
  if ([(EKObjectValidationContext *)v5 depth] >= 0x33)
  {
    [(EKObjectValidationContext *)v5 setReachedMaxDepth:1];
    id v6 = [(EKObjectValidationContext *)v5 rootObject];
    id v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKObject(Shared) validate:](v7, v6);
      if (!a3) {
        goto LABEL_7;
      }
    }
    else if (!a3)
    {
LABEL_7:
      char v8 = [(EKObject *)self _validationContext];
      [v8 faultIfNeededForObject:self];

      [(EKObject *)self set_validationContext:0];
      BOOL v9 = 0;
      goto LABEL_64;
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
    goto LABEL_7;
  }
  long long v48 = a3;
  long long v49 = v5;
  char v10 = [(id)objc_opt_class() knownRelationshipWeakKeys];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v11 = [(id)objc_opt_class() knownRelationshipSingleValueKeysForValidation];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v61 objects:v75 count:16];
  id v50 = v10;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v62 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        if (([v10 containsObject:v17] & 1) != 0
          || [(EKObject *)self isPropertyUnavailable:v17]
          && ![(EKObject *)self shouldLoadRelationshipForValidation:v17])
        {
          long long v18 = 0;
        }
        else
        {
          long long v18 = [(EKObject *)self valueForKey:v17];
          if (v18
            && [(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v18 forKey:v17])
          {
            id v60 = v14;
            char v19 = [v18 validateWithOwner:self error:&v60];
            id v6 = v60;

            if ((v19 & 1) == 0)
            {
              long long v20 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                long long v39 = v20;
                uint64_t v40 = objc_opt_class();
                id v41 = [(EKObject *)self uniqueIdentifier];
                *(_DWORD *)buf = 138544130;
                uint64_t v68 = v40;
                __int16 v69 = 2114;
                id v70 = v41;
                __int16 v71 = 2114;
                uint64_t v72 = v17;
                __int16 v73 = 2112;
                id v74 = v6;
                _os_log_error_impl(&dword_1A4E47000, v39, OS_LOG_TYPE_ERROR, "Object of type %{public}@ (uniqueIdentifier = %{public}@) failed validation while validating relation %{public}@ with error [%@].", buf, 0x2Au);
              }
              uint64_t v21 = [(EKObject *)self _validationContext];
              [v21 faultIfNeededForObject:self];

              [(EKObject *)self set_validationContext:0];
              char v10 = v50;
              if (v48 && v6) {
                *long long v48 = v6;
              }

              BOOL v9 = 0;
              id v5 = v49;
              goto LABEL_63;
            }
            uint64_t v14 = v6;
            char v10 = v50;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v61 objects:v75 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v22 = [(id)objc_opt_class() knownRelationshipMultiValueKeysForValidation];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v57;
    long long v47 = v22;
    uint64_t v45 = *(void *)v57;
    do
    {
      uint64_t v26 = 0;
      uint64_t v46 = v24;
      do
      {
        if (*(void *)v57 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v56 + 1) + 8 * v26);
        if (([v10 containsObject:v27] & 1) == 0
          && (![(EKObject *)self isPropertyUnavailable:v27]
           || [(EKObject *)self shouldLoadRelationshipForValidation:v27]))
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v28 = [(EKObject *)self valueForKey:v27];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v65 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v53;
            while (2)
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v53 != v31) {
                  objc_enumerationMutation(v28);
                }
                id v33 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                if (v33
                  && [(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v33 forKey:v27])
                {
                  id v51 = v14;
                  id v34 = v14;
                  char v35 = [v33 validateWithOwner:self error:&v51];
                  id v6 = v51;

                  if ((v35 & 1) == 0)
                  {
                    uint64_t v36 = (void *)EKLogHandle;
                    char v10 = v50;
                    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      long long v42 = v36;
                      uint64_t v43 = objc_opt_class();
                      long long v44 = [(EKObject *)self uniqueIdentifier];
                      *(_DWORD *)buf = 138544130;
                      uint64_t v68 = v43;
                      __int16 v69 = 2114;
                      id v70 = v44;
                      __int16 v71 = 2114;
                      uint64_t v72 = v27;
                      __int16 v73 = 2112;
                      id v74 = v6;
                      _os_log_error_impl(&dword_1A4E47000, v42, OS_LOG_TYPE_ERROR, "Object of type %{public}@ (uniqueIdentifier = %{public}@) failed validation while validating relation %{public}@ with error [%@].", buf, 0x2Au);
                    }
                    long long v37 = [(EKObject *)self _validationContext];
                    [v37 faultIfNeededForObject:self];

                    [(EKObject *)self set_validationContext:0];
                    id v5 = v49;
                    if (v48 && v6) {
                      *long long v48 = v6;
                    }

                    BOOL v9 = 0;
                    goto LABEL_63;
                  }
                  uint64_t v14 = v6;
                  char v10 = v50;
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v65 count:16];
              if (v30) {
                continue;
              }
              break;
            }
          }

          uint64_t v24 = v46;
          long long v22 = v47;
          uint64_t v25 = v45;
        }
        ++v26;
      }
      while (v26 != v24);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v24);
  }

  if (v48 && v14) {
    *long long v48 = v14;
  }
  id v5 = v49;
  [(EKObjectValidationContext *)v49 setDepth:[(EKObjectValidationContext *)v49 depth] - 1];
  [(EKObject *)self set_validationContext:0];
  BOOL v9 = 1;
  id v6 = v14;
LABEL_63:

LABEL_64:
  return v9;
}

- (BOOL)validateWithOwner:(id)a3 error:(id *)a4
{
  id v6 = [a3 _validationContext];
  [(EKObject *)self set_validationContext:v6];

  return [(EKObject *)self validate:a4];
}

- (void)_markAsNotNewCommon
{
  id v2 = [(EKObject *)self changeSet];
  [v2 setIsNew:0];
}

- (void)_markAsDeletedCommon
{
  [(EKObject *)self _initChangeSetIfNone];
  id v3 = [(EKObject *)self changeSet];
  [v3 setIsDeleted:1];
}

- (void)_markAsUndeletedCommon
{
  [(EKObject *)self markAsNew];
  id v3 = [(EKObject *)self changeSet];
  [v3 setIsDeleted:0];

  id v4 = [(EKObject *)self changeSet];
  [v4 setIsUndeleted:1];
}

- (void)_markAsSavedCommon
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = [(EKObject *)self frozenObject];
  uint64_t v23 = [(EKObject *)self changeSet];
  [v23 markChangesAsSaved];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if ([(EKObject *)self _hasChangesForKey:v8])
        {
          BOOL v9 = [(EKObject *)self valueForKey:v8];
          if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v9 forKey:v8])
          {
            char v10 = [v9 existingMeltedObject];
            [v10 markAsSaved];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v5);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        if ([(EKObject *)self _hasChangesForKey:v15])
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v16 = [(EKObject *)self valueForKey:v15];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v27;
            do
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v26 + 1) + 8 * k);
                if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v21 forKey:v15])
                {
                  long long v22 = [v21 existingMeltedObject];
                  [v22 markAsSaved];
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
            }
            while (v18);
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v12);
  }

  [(EKObject *)self _resetWithFrozenObject:v24];
  [(EKObject *)self setChangeSet:v23];
}

- (void)_markAsCommittedCommon
{
  id v3 = [(EKObject *)self changeSet];
  [v3 setIsNew:0];

  id v4 = [(EKObject *)self changeSet];
  [v4 setIsModified:0];
}

- (BOOL)isDeleted
{
  id v2 = [(EKObject *)self changeSet];
  char v3 = [v2 isDeleted];

  return v3;
}

- (BOOL)isUndeleted
{
  id v2 = [(EKObject *)self changeSet];
  char v3 = [v2 isUndeleted];

  return v3;
}

- (BOOL)isSaved
{
  char v3 = [(EKObject *)self changeSet];
  if ([v3 isSaved])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(EKObject *)self backingObject];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)_hasChanges
{
  char v3 = [(EKObject *)self changeSet];
  if (v3)
  {
  }
  else
  {
    unint64_t v4 = [(EKObject *)self _cachedMeltedObjectsCount];
    if (!v4) {
      return v4;
    }
  }
  uint64_t v5 = [(EKObject *)self changeSet];
  char v6 = [v5 hasChanges];

  if (v6)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    LOBYTE(v4) = [(EKObject *)self _hasChangeHelperInKeys:0 ignoreKeys:0 checkUnsaved:0];
  }
  return v4;
}

- (BOOL)hasUnsavedChangesInKeys:(id)a3
{
  return [(EKObject *)self _hasUnsavedChangesInKeys:a3 ignoreKeys:0];
}

- (BOOL)_hasChangeHelperInKeys:(id)a3 ignoreKeys:(id)a4 checkUnsaved:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __67__EKObject_Shared___hasChangeHelperInKeys_ignoreKeys_checkUnsaved___block_invoke;
  uint64_t v21 = &unk_1E5B98D40;
  BOOL v25 = a5;
  id v22 = v9;
  id v23 = v8;
  uint64_t v24 = self;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = (uint64_t (**)(void, void))MEMORY[0x1A6266730](&v18);
  uint64_t v13 = [(EKObject *)self _singleRelationshipKeysToCheckForChanges];
  char v14 = ((uint64_t (**)(void, void *))v12)[2](v12, v13);

  if (v14)
  {
    char v15 = 1;
  }
  else
  {
    long long v16 = [(EKObject *)self _multiRelationshipKeysToCheckForChanges];
    char v15 = ((uint64_t (**)(void, void *))v12)[2](v12, v16);
  }
  return v15;
}

uint64_t __67__EKObject_Shared___hasChangeHelperInKeys_ignoreKeys_checkUnsaved___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ((!*(unsigned char *)(a1 + 56)
           || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12) & 1) == 0&& ((id v9 = *(void **)(a1 + 40)) == 0 || (objc_msgSend(v9, "containsObject:", v8) & 1) != 0)|| !*(unsigned char *)(a1 + 56))&& (objc_msgSend(*(id *)(a1 + 48), "_hasChangesForKey:checkUnsaved:", v8, *(unsigned __int8 *)(a1 + 56), (void)v12) & 1) != 0)
        {
          uint64_t v10 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_16:

  return v10;
}

- (BOOL)_isOnlyChangedKey:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  LOBYTE(self) = [(EKObject *)self _areOnlyChangedKeys:v4];

  return (char)self;
}

- (BOOL)_areOnlyChangedKeys:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKObject *)self changeSet];
  int v6 = [v5 hasUnsavedChanges];

  if (v6)
  {
    id v7 = [(EKObject *)self changeSet];
    uint64_t v8 = [v7 changedKeys];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v8 count] && !objc_msgSend(v8, "isSubsetOfSet:", v4))
  {
    BOOL v20 = 0;
    goto LABEL_28;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [(EKObject *)self _singleRelationshipKeysToCheckForChanges];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
      if ([(EKObject *)self _hasChangesForKey:v14])
      {
        if (![v4 containsObject:v14]) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v11) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = [(EKObject *)self _multiRelationshipKeysToCheckForChanges];
    uint64_t v15 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (!v15)
    {
      BOOL v20 = 1;
      goto LABEL_26;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
LABEL_17:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(v9);
      }
      uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * v18);
      if ([(EKObject *)self _hasChangesForKey:v19])
      {
        if (![v4 containsObject:v19]) {
          break;
        }
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        BOOL v20 = 1;
        if (v16) {
          goto LABEL_17;
        }
        goto LABEL_26;
      }
    }
  }
  BOOL v20 = 0;
LABEL_26:

LABEL_28:
  return v20;
}

- (void)addChangesFromObject:(id)a3
{
}

- (void)addChangesFromObject:(id)a3 copyingBackingObjects:(BOOL)a4
{
}

- (void)_addChangesFromObject:(id)a3 passingTest:(id)a4 ignoreRelations:(id)a5 copyingBackingObjects:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (EKObject *)a3;
  id v47 = a4;
  id v42 = a5;
  long long v44 = self;
  uint64_t v45 = v10;
  if (v10 != self)
  {
    context = (void *)MEMORY[0x1A62664B0]();
    uint64_t v38 = [(EKObject *)v10 changeSet];
    long long v39 = [[EKChangeSet alloc] initWithChangeSet:v38];
    uint64_t v11 = v39;
    if (v47)
    {
      uint64_t v12 = [EKChangeSet alloc];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke;
      v70[3] = &unk_1E5B98D88;
      id v73 = v47;
      __int16 v71 = v10;
      uint64_t v72 = self;
      uint64_t v13 = [(EKChangeSet *)v12 initWithChangeSet:v39 filter:v70];

      uint64_t v11 = (void *)v13;
    }
    long long v36 = v11;
    -[EKObject _addChanges:copyingBackingObjects:](self, "_addChanges:copyingBackingObjects:");
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v14 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v67 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          if (![(EKObject *)v10 isPropertyUnavailable:v18]
            && ([v42 containsObject:v18] & 1) == 0)
          {
            uint64_t v19 = [(EKObject *)v10 valueForKey:v18];
            if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v19 forKey:v18])
            {
              BOOL v20 = [(EKObject *)v44 meltedAndCachedSingleRelationObjectForKey:v18];
              uint64_t v21 = [v19 existingMeltedObject];
              [v20 _addChangesFromObject:v21 passingTest:v47 ignoreRelations:0 copyingBackingObjects:v6];
            }
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v15);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
    uint64_t v43 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v43)
    {
      uint64_t v41 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v63 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v62 + 1) + 8 * j);
          if (![(EKObject *)v45 isPropertyUnavailable:v22])
          {
            id v23 = [(id)objc_opt_class() knownRelationshipWeakKeys];
            if (([v23 containsObject:v22] & 1) == 0)
            {
              char v24 = [v42 containsObject:v22];

              if (v24) {
                continue;
              }
              long long v25 = [(EKObject *)v44 valueForKey:v22];
              uint64_t v56 = 0;
              long long v57 = &v56;
              uint64_t v58 = 0x3032000000;
              long long v59 = __Block_byref_object_copy__18;
              id v60 = __Block_byref_object_dispose__18;
              id v61 = 0;
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke_2;
              v52[3] = &unk_1E5B97028;
              long long v55 = &v56;
              long long v53 = v45;
              uint64_t v54 = v22;
              long long v26 = (void (**)(void))MEMORY[0x1A6266730](v52);
              long long v50 = 0u;
              long long v51 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              id v23 = v25;
              uint64_t v27 = [v23 countByEnumeratingWithState:&v48 objects:v74 count:16];
              if (v27)
              {
                uint64_t v28 = *(void *)v49;
                do
                {
                  for (uint64_t k = 0; k != v27; ++k)
                  {
                    if (*(void *)v49 != v28) {
                      objc_enumerationMutation(v23);
                    }
                    long long v30 = *(void **)(*((void *)&v48 + 1) + 8 * k);
                    long long v31 = [v30 changeSet];
                    int v32 = [v31 hasChanges];

                    if (v32)
                    {
                      v26[2](v26);
                      long long v33 = (void *)v57[5];
                      long long v34 = [v30 uniqueIdentifier];
                      long long v35 = [v33 objectForKeyedSubscript:v34];

                      if (v35) {
                        [v30 _addChangesFromObject:v35 passingTest:v47 ignoreRelations:0 copyingBackingObjects:v6];
                      }
                    }
                  }
                  uint64_t v27 = [v23 countByEnumeratingWithState:&v48 objects:v74 count:16];
                }
                while (v27);
              }

              _Block_object_dispose(&v56, 8);
            }
          }
        }
        uint64_t v43 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
      }
      while (v43);
    }
  }
}

uint64_t __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, void))(a1[6] + 16))(a1[6], a2, a3, a1[4], a1[5]);
}

void __92__EKObject_Shared___addChangesFromObject_passingTest_ignoreRelations_copyingBackingObjects___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v2 = [*(id *)(a1 + 32) valueForKey:*(void *)(a1 + 40)];
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v13 = objc_msgSend(v11, "uniqueIdentifier", (void)v14);
          [v12 setObject:v11 forKeyedSubscript:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)_addChangesFromObject:(id)a3 ignoringDifferencesFrom:(id)a4 changesToSkip:(id)a5 copyingBackingObjects:(BOOL)a6
{
  BOOL v94 = a6;
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (EKObject *)a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 != self)
  {
    context = (void *)MEMORY[0x1A62664B0]();
    long long v102 = v10;
    uint64_t v12 = [v10 diffWithObject:self compareUIVisiblePropertiesOnly:1];
    uint64_t v13 = [(EKObject *)v9 changeSet];
    long long v14 = [EKChangeSet alloc];
    v142[0] = MEMORY[0x1E4F143A8];
    v142[1] = 3221225472;
    v142[2] = __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_2;
    v142[3] = &unk_1E5B98DB0;
    id v93 = v11;
    id v105 = v11;
    id v143 = v105;
    id v15 = v12;
    id v144 = v15;
    v91 = (void *)v13;
    long long v16 = [(EKChangeSet *)v14 initWithChangeSet:v13 filter:v142];
    long long v17 = [(EKChangeSet *)v16 multiValueAdditions];
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_3;
    v139[3] = &unk_1E5B98DD8;
    v139[4] = self;
    long long v106 = v16;
    v140 = v106;
    id v141 = &__block_literal_global_43;
    [v17 enumerateKeysAndObjectsUsingBlock:v139];

    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v103 = self;
    uint64_t v18 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v135 objects:v151 count:16];
    id v98 = v15;
    v99 = v9;
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v136 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v135 + 1) + 8 * i);
          if (![(EKObject *)v9 isPropertyUnavailable:v23])
          {
            char v24 = [v15 relationshipSingleValueModifies];
            long long v25 = [v24 objectForKeyedSubscript:v23];

            if (!v25)
            {
              long long v26 = [(EKObject *)v9 frozenOrMeltedCachedSingleRelationObjectForKey:v23];
              uint64_t v27 = [v102 frozenOrMeltedCachedSingleRelationObjectForKey:v23];
              if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v26 forKey:v23])
              {
                uint64_t v28 = [(EKObject *)v103 meltedAndCachedSingleRelationObjectForKey:v23];
                long long v29 = [v27 semanticIdentifier];
                long long v30 = [v28 semanticIdentifier];
                int v31 = [v29 isEqualToString:v30];

                if (v31)
                {
                  int v32 = [v26 existingMeltedObject];
                  if (v32)
                  {
                    long long v33 = [v27 existingMeltedObject];
                    [v28 _addChangesFromObject:v32 ignoringDifferencesFrom:v33 changesToSkip:v105 copyingBackingObjects:v94];
                  }
                }

                id v15 = v98;
                uint64_t v9 = v99;
              }
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v135 objects:v151 count:16];
      }
      while (v20);
    }

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v34 = v103;
    long long v35 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v131 objects:v150 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v132;
      uint64_t v95 = *(void *)v132;
      id v96 = v35;
      do
      {
        uint64_t v39 = 0;
        uint64_t v97 = v37;
        do
        {
          if (*(void *)v132 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v131 + 1) + 8 * v39);
          if (![(EKObject *)v9 isPropertyUnavailable:v40])
          {
            uint64_t v41 = [(id)objc_opt_class() knownRelationshipWeakKeys];
            if ([v41 containsObject:v40])
            {

              goto LABEL_77;
            }
            char v42 = [v105 containsObject:v40];

            if ((v42 & 1) == 0)
            {
              uint64_t v101 = v39;
              long long v110 = objc_opt_new();
              uint64_t v43 = objc_opt_new();
              uint64_t v44 = objc_opt_new();
              uint64_t v107 = v40;
              uint64_t v45 = [(EKObject *)v9 frozenOrMeltedCachedMultiRelationObjectsForKey:v40];
              long long v127 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              long long v130 = 0u;
              obuint64_t j = v45;
              uint64_t v46 = [v45 countByEnumeratingWithState:&v127 objects:v149 count:16];
              if (!v46) {
                goto LABEL_39;
              }
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v128;
              while (1)
              {
                for (uint64_t j = 0; j != v47; ++j)
                {
                  if (*(void *)v128 != v48) {
                    objc_enumerationMutation(obj);
                  }
                  long long v50 = *(void **)(*((void *)&v127 + 1) + 8 * j);
                  long long v51 = [(EKObject *)v34 eventStore];
                  long long v52 = [v50 meltedObjectInStore:v51];

                  if (([v50 isNew] & 1) == 0)
                  {
                    uint64_t v54 = [v52 committedCopy];
                    long long v53 = [v54 semanticIdentifier];

                    if (!v53) {
                      goto LABEL_37;
                    }
LABEL_36:
                    [v110 setObject:v52 forKeyedSubscript:v53];
                    goto LABEL_37;
                  }
                  long long v53 = [v52 semanticIdentifier];
                  if (v53) {
                    goto LABEL_36;
                  }
LABEL_37:
                }
                uint64_t v47 = [obj countByEnumeratingWithState:&v127 objects:v149 count:16];
                if (!v47)
                {
LABEL_39:
                  uint64_t v55 = v40;
                  uint64_t v56 = [v102 frozenOrMeltedCachedMultiRelationObjectsForKey:v40];
                  long long v123 = 0u;
                  long long v124 = 0u;
                  long long v125 = 0u;
                  long long v126 = 0u;
                  id v108 = v56;
                  uint64_t v57 = [v56 countByEnumeratingWithState:&v123 objects:v148 count:16];
                  if (v57)
                  {
                    uint64_t v58 = v57;
                    uint64_t v59 = *(void *)v124;
                    do
                    {
                      for (uint64_t k = 0; k != v58; ++k)
                      {
                        if (*(void *)v124 != v59) {
                          objc_enumerationMutation(v108);
                        }
                        id v61 = *(void **)(*((void *)&v123 + 1) + 8 * k);
                        long long v62 = [v61 semanticIdentifier];
                        [v43 setObject:v61 forKeyedSubscript:v62];
                      }
                      uint64_t v58 = [v108 countByEnumeratingWithState:&v123 objects:v148 count:16];
                    }
                    while (v58);
                  }
                  v100 = (void *)v44;
                  long long v63 = [(EKObject *)v34 frozenOrMeltedCachedMultiRelationObjectsForKey:v40];
                  long long v119 = 0u;
                  long long v120 = 0u;
                  long long v121 = 0u;
                  long long v122 = 0u;
                  id v64 = v63;
                  uint64_t v65 = [v64 countByEnumeratingWithState:&v119 objects:v147 count:16];
                  id v104 = v64;
                  if (v65)
                  {
                    uint64_t v66 = v65;
                    uint64_t v67 = *(void *)v120;
                    while (2)
                    {
                      for (uint64_t m = 0; m != v66; ++m)
                      {
                        if (*(void *)v120 != v67) {
                          objc_enumerationMutation(v64);
                        }
                        long long v69 = [*(id *)(*((void *)&v119 + 1) + 8 * m) semanticIdentifier];
                        id v70 = [v110 objectForKeyedSubscript:v69];

                        if (v70 && [v70 hasChanges])
                        {

                          id v64 = [(EKObject *)v103 meltedAndCachedMultiRelationObjectsForKey:v40];
                          long long v115 = 0u;
                          long long v116 = 0u;
                          long long v117 = 0u;
                          long long v118 = 0u;
                          uint64_t v71 = [v64 countByEnumeratingWithState:&v115 objects:v146 count:16];
                          if (v71)
                          {
                            uint64_t v72 = v71;
                            uint64_t v73 = *(void *)v116;
                            do
                            {
                              for (uint64_t n = 0; n != v72; ++n)
                              {
                                if (*(void *)v116 != v73) {
                                  objc_enumerationMutation(v64);
                                }
                                uint64_t v75 = *(void **)(*((void *)&v115 + 1) + 8 * n);
                                uint64_t v76 = [v75 semanticIdentifier];
                                uint64_t v77 = [v110 objectForKeyedSubscript:v76];
                                v78 = [v43 objectForKeyedSubscript:v76];
                                v79 = v78;
                                if (v77)
                                {
                                  v80 = [v78 existingMeltedObject];
                                  [v75 _addChangesFromObject:v77 ignoringDifferencesFrom:v80 changesToSkip:v105 copyingBackingObjects:1];
                                }
                              }
                              uint64_t v72 = [v64 countByEnumeratingWithState:&v115 objects:v146 count:16];
                            }
                            while (v72);
                            uint64_t v55 = v107;
                          }
                          goto LABEL_66;
                        }
                      }
                      uint64_t v66 = [v64 countByEnumeratingWithState:&v119 objects:v147 count:16];
                      if (v66) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_66:

                  v81 = [(EKObject *)v103 frozenOrMeltedCachedMultiRelationObjectsForKey:v55];

                  long long v113 = 0u;
                  long long v114 = 0u;
                  long long v111 = 0u;
                  long long v112 = 0u;
                  id v82 = v81;
                  uint64_t v83 = [v82 countByEnumeratingWithState:&v111 objects:v145 count:16];
                  if (v83)
                  {
                    uint64_t v84 = v83;
                    uint64_t v85 = *(void *)v112;
                    do
                    {
                      for (iuint64_t i = 0; ii != v84; ++ii)
                      {
                        if (*(void *)v112 != v85) {
                          objc_enumerationMutation(v82);
                        }
                        v87 = *(void **)(*((void *)&v111 + 1) + 8 * ii);
                        uint64_t v88 = [v87 semanticIdentifier];
                        int v89 = [v100 containsObject:v88];

                        if (v89)
                        {
                          v90 = [MEMORY[0x1E4F1CAD0] setWithObject:v87];
                          [(EKChangeSet *)v106 removeFromChanges:v90 forMultiValueKey:v107 basedOn:0 and:0 objectIdentifierBlock:&__block_literal_global_43];
                        }
                        else
                        {
                          v90 = [v87 semanticIdentifier];
                          [v100 addObject:v90];
                        }
                      }
                      uint64_t v84 = [v82 countByEnumeratingWithState:&v111 objects:v145 count:16];
                    }
                    while (v84);
                  }

                  id v15 = v98;
                  uint64_t v9 = v99;
                  long long v34 = v103;
                  uint64_t v38 = v95;
                  long long v35 = v96;
                  uint64_t v37 = v97;
                  uint64_t v39 = v101;

                  break;
                }
              }
            }
          }
LABEL_77:
          ++v39;
        }
        while (v39 != v37);
        uint64_t v37 = [v35 countByEnumeratingWithState:&v131 objects:v150 count:16];
      }
      while (v37);
    }

    [(EKObject *)v34 _addChanges:v106 copyingBackingObjects:v94 objectIdentifierBlock:&__block_literal_global_43];
    id v11 = v93;
    id v10 = v102;
  }
}

uint64_t __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 semanticIdentifier];
}

uint64_t __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7 && ([v7 containsObject:v5] & 1) != 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) differentSingleValueKeys];
    if ([v9 containsObject:v5])
    {
      uint64_t v8 = 0;
    }
    else
    {
      id v10 = [*(id *)(a1 + 40) differentRelationshipSingleValueKeys];
      uint64_t v8 = [v10 containsObject:v5] ^ 1;
    }
  }

  return v8;
}

void __102__EKObject_Shared___addChangesFromObject_ignoringDifferencesFrom_changesToSkip_copyingBackingObjects___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v24 = a1;
  long long v25 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) frozenOrMeltedCachedMultiRelationObjectsForKey:v5];
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v30 + 1) + 8 * i) semanticIdentifier];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v22 = [v21 semanticIdentifier];
        int v23 = [v9 containsObject:v22];

        if (v23) {
          [v8 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  if ([v8 count]) {
    [*(id *)(v24 + 40) removeFromChanges:v8 forMultiValueKey:v25 basedOn:0 and:0 objectIdentifierBlock:*(void *)(v24 + 48)];
  }
}

+ (void)addChangesFromObject:(id)a3 toObject:(id)a4 exceptWhereObjectIsDifferentFrom:(id)a5 skippingChanges:(id)a6
{
}

+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 except:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __58__EKObject_Shared__addChangesFromObject_toObjects_except___block_invoke;
    id v15 = &unk_1E5B98E00;
    id v16 = v8;
    id v17 = v10;
    uint64_t v11 = (void *)MEMORY[0x1A6266730](&v12);
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend(a1, "_addChangesFromObject:toObjects:passingTest:copyingBackingObjects:", v8, v9, v11, 1, v12, v13, v14, v15);
}

uint64_t __58__EKObject_Shared__addChangesFromObject_toObjects_except___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 32) == a4) {
    return [*(id *)(a1 + 40) containsObject:a2] ^ 1;
  }
  else {
    return 1;
  }
}

+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 keep:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __56__EKObject_Shared__addChangesFromObject_toObjects_keep___block_invoke;
    id v15 = &unk_1E5B98E00;
    id v16 = v8;
    id v17 = v10;
    uint64_t v11 = (void *)MEMORY[0x1A6266730](&v12);
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend(a1, "_addChangesFromObject:toObjects:passingTest:copyingBackingObjects:", v8, v9, v11, 1, v12, v13, v14, v15);
}

uint64_t __56__EKObject_Shared__addChangesFromObject_toObjects_keep___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 32) == a4) {
    return [*(id *)(a1 + 40) containsObject:a2];
  }
  else {
    return 1;
  }
}

+ (void)addChangesFromObject:(id)a3 toObjects:(id)a4 passingTest:(id)a5
{
}

+ (void)_addChangesFromObject:(id)a3 toObjects:(id)a4 passingTest:(id)a5 copyingBackingObjects:(BOOL)a6
{
  BOOL v39 = a6;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  id v38 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v10 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        id v16 = objc_msgSend(v8, "cachedMeltedObjectForSingleValueKey:", v15, v37);
        id v17 = v16;
        if (!v16 || ([v16 isNew] & 1) != 0 || (objc_msgSend(v17, "hasChanges") & 1) == 0) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v12);
  }
  uint64_t v40 = v9;

  uint64_t v18 = [(id)objc_opt_class() knownRelationshipWeakKeys];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v41 = v8;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v19 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v51 + 1) + 8 * j);
        if ((objc_msgSend(v18, "containsObject:", v23, v37) & 1) == 0)
        {
          uint64_t v24 = v18;
          long long v25 = [v41 cachedMeltedObjectsForMultiValueKey:v23];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v26 = v25;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v60 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v48;
            while (2)
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v48 != v29) {
                  objc_enumerationMutation(v26);
                }
                long long v31 = *(void **)(*((void *)&v47 + 1) + 8 * k);
                if ([v31 isNew] & 1) == 0 && (objc_msgSend(v31, "hasChanges"))
                {

                  goto LABEL_29;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v60 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          [v40 addObject:v23];
LABEL_29:

          uint64_t v18 = v24;
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v20);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v37;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v32);
        }
        objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * m), "_addChangesFromObject:passingTest:ignoreRelations:copyingBackingObjects:", v41, v38, v40, v39, v37);
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v34);
  }
}

- (void)addChanges:(id)a3
{
}

- (void)_addChanges:(id)a3 copyingBackingObjects:(BOOL)a4
{
}

- (void)_addChanges:(id)a3 copyingBackingObjects:(BOOL)a4 objectIdentifierBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(EKObject *)self _initChangeSetIfNone];
  if (v5)
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = [(id)objc_opt_class() knownRelationshipWeakKeys];
    uint64_t v12 = [v10 setWithArray:v11];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__EKObject_Shared___addChanges_copyingBackingObjects_objectIdentifierBlock___block_invoke;
    v17[3] = &unk_1E5B98E28;
    id v18 = v12;
    id v13 = v12;
    long long v14 = (void *)MEMORY[0x1A6266730](v17);
  }
  else
  {
    long long v14 = &__block_literal_global_48;
  }
  uint64_t v15 = [(EKObject *)self changeSet];
  [v15 addChanges:v9 shouldCopyKeyCallback:v14 objectIdentifierBlock:v8];

  id v16 = [(EKObject *)self changeSet];
  [(EKObject *)self updateAfterApplyingChanges:v16 objectIdentifierBlock:v8];
}

uint64_t __76__EKObject_Shared___addChanges_copyingBackingObjects_objectIdentifierBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __76__EKObject_Shared___addChanges_copyingBackingObjects_objectIdentifierBlock___block_invoke_2()
{
  return 0;
}

+ (id)keysToIgnoreForApplyingChanges
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (void)applyChanges:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [EKChangeSet alloc];
  BOOL v5 = [(id)objc_opt_class() keysToIgnoreForApplyingChanges];
  id v6 = [(EKChangeSet *)v4 initWithChangeSet:v7 changesToSkip:v5];
  [(EKObject *)self setChangeSet:v6];

  [(EKObject *)self updateAfterApplyingChanges:v7 objectIdentifierBlock:0];
}

- (void)addMultiChangedObjectValue:(id)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(EKObject *)self addMultiChangedObjectValues:v8 forKey:v7];
}

- (void)addMultiChangedObjectValues:(id)a3 forKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(EKObject *)self _initChangeSetIfNone];
  if (![(EKObject *)self _isPropertyUnavailable:v7 convertToFullObjectIfUnavailable:1])
  {
    id v9 = [(EKObject *)self changeSet];
    uint64_t v11 = [(EKObject *)self backingObject];
    id v10 = [(EKObject *)self additionalFrozenProperties];
    [v9 addToChanges:v6 forMultiValueKey:v7 basedOn:v11 and:v10];
    goto LABEL_5;
  }
  id v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    id v9 = v8;
    id v10 = [(EKObject *)self backingObject];
    uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v12 = 138413058;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_error_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_ERROR, "Unable to add multi changed object values %@. Property %@ was unavailable on backingObject %@. %@", (uint8_t *)&v12, 0x2Au);
LABEL_5:
  }
}

- (void)removeMultiChangedObjectValue:(id)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(EKObject *)self removeMultiChangedObjectValues:v8 forKey:v7];
}

- (void)removeMultiChangedObjectValues:(id)a3 forKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(EKObject *)self _initChangeSetIfNone];
  if (![(EKObject *)self _isPropertyUnavailable:v7 convertToFullObjectIfUnavailable:1])
  {
    id v9 = [(EKObject *)self changeSet];
    uint64_t v11 = [(EKObject *)self backingObject];
    id v10 = [(EKObject *)self additionalFrozenProperties];
    [v9 removeFromChanges:v6 forMultiValueKey:v7 basedOn:v11 and:v10];
    goto LABEL_5;
  }
  id v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    id v9 = v8;
    id v10 = [(EKObject *)self backingObject];
    uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v12 = 138413058;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_error_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_ERROR, "Unable to remove multi changed object values %@. Property %@ was unavailable on backingObject %@. %@", (uint8_t *)&v12, 0x2Au);
LABEL_5:
  }
}

- (void)replaceMultiChangedObjectValuesWithObjectValues:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(EKObject *)self multiChangedObjectValuesForKey:v6];
  [(EKObject *)self removeMultiChangedObjectValues:v7 forKey:v6];

  [(EKObject *)self addMultiChangedObjectValues:v8 forKey:v6];
}

- (id)changedKeys
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKObject *)self changeSet];
  char v4 = [v3 isDeleted];

  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA80];
    id v7 = [(EKObject *)self changeSet];
    id v8 = [v7 changedKeys];
    BOOL v5 = [v6 setWithSet:v8];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if ([(EKObject *)self _hasChangesForKey:v14]) {
            [v5 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * j);
          if ([(EKObject *)self _hasChangesForKey:v20]) {
            [v5 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }
  }

  return v5;
}

- (void)_rollbackCommon
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKObject *)self changeSet];
  [v3 rollbackChanges];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  char v4 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if ([(EKObject *)self _hasChangesForKey:v9])
        {
          uint64_t v10 = [(EKObject *)self valueForKey:v9];
          if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v10 forKey:v9])
          {
            uint64_t v11 = [v10 existingMeltedObject];
            [v11 rollback];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v6);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        if ([(EKObject *)self _hasChangesForKey:v16])
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v17 = [(EKObject *)self valueForKey:v16];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v26;
            do
            {
              for (uint64_t k = 0; k != v19; ++k)
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v17);
                }
                long long v22 = *(void **)(*((void *)&v25 + 1) + 8 * k);
                if ([(id)objc_opt_class() isMeltedAndNotWeakRelationshipObject:v22 forKey:v16])
                {
                  long long v23 = [v22 existingMeltedObject];
                  [v23 rollback];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
            }
            while (v19);
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v13);
  }

  [(EKObject *)self _resetAfterUpdatingChangeSetOrBackingObject];
}

- (BOOL)_resetIfBackingObjectIsOfClass:(Class)a3 fetchResetFrozenObjectBlock:(id)a4
{
  uint64_t v5 = (void (**)(id, void *))a4;
  uint64_t v6 = [(EKObject *)self backingObject];
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = v5[2](v5, v6);
    id v8 = (void *)v7;
    BOOL v9 = v7 != 0;
    if (v7) {
      BOOL v10 = v7 == (void)v6;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      [(EKObject *)self _resetWithFrozenObject:v7];
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_resetCommon
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v22 = [(EKObject *)self isDeleted];
  [(EKObject *)self setChangeSet:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        BOOL v9 = [(EKObject *)self frozenOrMeltedCachedSingleRelationObjectForKey:v8];
        if (v9 && ([(id)objc_opt_class() isWeakRelationObject:v9 forKey:v8] & 1) == 0) {
          [v9 reset];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = [(EKObject *)self frozenOrMeltedCachedMultiRelationObjectsForKey:v14];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v24 + 1) + 8 * k);
              if (([(id)objc_opt_class() isWeakRelationObject:v20 forKey:v14] & 1) == 0) {
                [v20 reset];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
          }
          while (v17);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v11);
  }

  [(EKObject *)self _resetAfterUpdatingChangeSetOrBackingObject];
  if (v22) {
    [(EKObject *)self markAsDeleted];
  }
  return 1;
}

- (BOOL)_refreshable
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKObject *)self persistentObject];
  char v4 = [v3 isNew];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(EKObject *)self persistentObject];
  if ([v6 _isPendingUpdate] & 1) != 0 || (objc_msgSend(v6, "_isPendingDelete"))
  {
    BOOL v5 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(EKObject *)self eventStore];
    uint64_t v8 = [v7 objectsPendingCommit];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v14 = [v6 objectID];
          id v15 = [v13 objectID];
          char v16 = [v14 isEqual:v15];

          if (v16)
          {
            BOOL v5 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 1;
LABEL_16:
  }
  return v5;
}

- (BOOL)_refreshCommon
{
  id v2 = self;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKObject *)self changeSet];
  id v64 = (void *)[v3 copy];

  id v70 = [MEMORY[0x1E4F1CA60] dictionary];
  id v61 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  char v4 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v97 objects:v106 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v98 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v97 + 1) + 8 * i);
        uint64_t v10 = [(EKObject *)v2 cachedMeltedObjectForSingleValueKey:v9];
        if (v10)
        {
          if (([(id)objc_opt_class() isWeakRelationObject:v10 forKey:v9] & 1) == 0)
          {
            uint64_t v11 = [v10 changeSet];

            if (v11)
            {
              uint64_t v12 = [v10 changeSet];
              uint64_t v13 = (void *)[v12 copy];
              [v70 setObject:v13 forKeyedSubscript:v9];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v97 objects:v106 count:16];
    }
    while (v6);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obid j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v75 = v2;
  uint64_t v65 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v94;
    do
    {
      for (id j = 0; j != (id)v65; id j = (char *)j + 1)
      {
        if (*(void *)v94 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v93 + 1) + 8 * (void)j);
        char v16 = [(EKObject *)v2 cachedMeltedObjectsForMultiValueKey:v15];
        uint64_t v17 = [v64 multiValueAdditions];
        long long v18 = [v17 objectForKey:v15];

        if (v16)
        {
          id v68 = j;
          uint64_t v71 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v73 = [MEMORY[0x1E4F1CA48] array];
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          uint64_t v66 = v16;
          id v19 = v16;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v89 objects:v104 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v90;
            do
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v90 != v22) {
                  objc_enumerationMutation(v19);
                }
                long long v24 = *(void **)(*((void *)&v89 + 1) + 8 * k);
                if (([(id)objc_opt_class() isWeakRelationObject:v24 forKey:v15] & 1) == 0)
                {
                  uint64_t v25 = [v24 changeSet];
                  if (v25)
                  {
                    long long v26 = (void *)v25;
                    long long v27 = [v24 uniqueIdentifier];

                    if (v27)
                    {
                      long long v28 = [v24 changeSet];
                      long long v29 = (void *)[v28 copy];
                      long long v30 = [v24 uniqueIdentifier];
                      [v71 setObject:v29 forKeyedSubscript:v30];

                      id v2 = v75;
                    }
                  }
                }
                long long v31 = [v24 backingObject];
                int v32 = [v18 containsObject:v31];

                if (v32) {
                  [v73 addObject:v24];
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v89 objects:v104 count:16];
            }
            while (v21);
          }

          if ([v71 count]) {
            [v70 setObject:v71 forKeyedSubscript:v15];
          }
          char v16 = v66;
          id j = v68;
          if ([v73 count]) {
            [v61 setObject:v73 forKey:v15];
          }
        }
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
    }
    while (v65);
  }

  BOOL v33 = [(EKObject *)v2 _reset];
  BOOL v34 = v33;
  if (v33)
  {
    BOOL v67 = v33;
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __34__EKObject_Shared___refreshCommon__block_invoke;
    v88[3] = &unk_1E5B98E70;
    v88[4] = v2;
    [v61 enumerateKeysAndObjectsUsingBlock:v88];
    [(EKObject *)v2 updateMultiValueCacheForChangeSet:v64 preservingExistingAdds:1 objectIdentifierBlock:0];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v35 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v84 objects:v103 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v85;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v85 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v84 + 1) + 8 * m);
          uint64_t v41 = [v70 objectForKeyedSubscript:v40];
          if (v41)
          {
            char v42 = [(EKObject *)v2 valueForKey:v40];
            long long v43 = [(EKObject *)v2 eventStore];
            long long v44 = [v42 meltedObjectInStore:v43];

            [v44 setChangeSet:v41];
            [(EKObject *)v2 setValue:v44 forKey:v40];
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v84 objects:v103 count:16];
      }
      while (v37);
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v69 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
    uint64_t v74 = [v69 countByEnumeratingWithState:&v80 objects:v102 count:16];
    if (v74)
    {
      uint64_t v72 = *(void *)v81;
      do
      {
        for (uint64_t n = 0; n != v74; ++n)
        {
          if (*(void *)v81 != v72) {
            objc_enumerationMutation(v69);
          }
          uint64_t v46 = *(void *)(*((void *)&v80 + 1) + 8 * n);
          long long v47 = [v70 objectForKeyedSubscript:v46];
          if ([v47 count])
          {
            long long v48 = [(EKObject *)v2 valueForKey:v46];
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v76 objects:v101 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v77;
              do
              {
                for (iuint64_t i = 0; ii != v50; ++ii)
                {
                  if (*(void *)v77 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  long long v53 = *(void **)(*((void *)&v76 + 1) + 8 * ii);
                  long long v54 = [v53 uniqueIdentifier];

                  if (v54)
                  {
                    [v53 uniqueIdentifier];
                    v56 = long long v55 = v2;
                    long long v57 = [v47 objectForKeyedSubscript:v56];

                    long long v58 = [(EKObject *)v55 eventStore];
                    uint64_t v59 = [v53 meltedObjectInStore:v58];

                    if (v57) {
                      [v59 setChangeSet:v57];
                    }

                    id v2 = v75;
                  }
                }
                uint64_t v50 = [v48 countByEnumeratingWithState:&v76 objects:v101 count:16];
              }
              while (v50);
            }
          }
        }
        uint64_t v74 = [v69 countByEnumeratingWithState:&v80 objects:v102 count:16];
      }
      while (v74);
    }

    [(EKObject *)v2 setChangeSet:v64];
    BOOL v34 = v67;
  }

  return v34;
}

void __34__EKObject_Shared___refreshCommon__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) _addCachedMeltedObject:*(void *)(*((void *)&v11 + 1) + 8 * v10++) forMultiValueKey:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_resetWithFrozenObject:(id)a3
{
  id v4 = a3;
  [(EKObject *)self setBackingObject:v4];
  [(EKObject *)self setAdditionalFrozenProperties:0];
  [(EKObject *)self _applyDefinedAfterFirstSaveFrom:v4];

  [(EKObject *)self _resetAfterUpdatingChangeSetOrBackingObject];
}

- (void)_applyKnownImmutableValuesFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = objc_msgSend((id)objc_opt_class(), "knownImmutableKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        long long v11 = [(EKObject *)self additionalFrozenProperties];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];
        if (v12)
        {
          long long v13 = (void *)v12;
        }
        else
        {
          long long v13 = [v4 valueForKey:v10];

          if (!v13) {
            goto LABEL_12;
          }
        }
        uint64_t v14 = objc_opt_class();
        if (v14 != objc_opt_class()) {
          [(EKObject *)self setValue:v13 forKey:v10];
        }
LABEL_12:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v7)
      {
LABEL_14:

        break;
      }
    }
  }
}

void __39__EKObject_Shared__cachedMeltedObjects__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __43__EKObject_Shared__setCachedMeltedObjects___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 40) mutableCopy];
  objc_msgSend(*(id *)(a1 + 32), "set_cachedMeltedObjects:", v2);
}

- (void)_updateCachedMeltedObjectSetForMultiValueKey:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:v6];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__18;
  uint64_t v21 = __Block_byref_object_dispose__18;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__EKObject_Shared___updateCachedMeltedObjectSetForMultiValueKey_usingBlock___block_invoke;
  v14[3] = &unk_1E5B97028;
  long long v16 = &v17;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  [(EKObject *)self _performWithLock:v14];
  uint64_t v10 = v18[5];
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;

    uint64_t v10 = v18[5];
  }
  long long v13 = v7[2](v7, v10);
  [(EKObject *)self setCachedMeltedObjects:v13 forMultiValueKey:v9];

  _Block_object_dispose(&v17, 8);
}

void __76__EKObject_Shared___updateCachedMeltedObjectSetForMultiValueKey_usingBlock___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EKObject *)self eventStore];
  id v10 = [v7 meltedObjectInStore:v8];

  id v9 = [v10 frozenObject];
  [(EKObject *)self _addCachedMeltedObject:v10 forMultiValueKey:v6];
  [(EKObject *)self addMultiChangedObjectValue:v9 forKey:v6];
}

- (void)_addCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__EKObject_Shared___addCachedMeltedObject_forMultiValueKey___block_invoke;
    v8[3] = &unk_1E5B98E98;
    id v9 = v6;
    [(EKObject *)self _updateCachedMeltedObjectSetForMultiValueKey:a4 usingBlock:v8];
  }
}

uint64_t __60__EKObject_Shared___addCachedMeltedObject_forMultiValueKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setByAddingObject:*(void *)(a1 + 32)];
}

- (void)removeCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(EKObject *)self _removeCachedMeltedObject:v7 forMultiValueKey:v6];
  id v8 = [v7 frozenObject];

  [(EKObject *)self removeMultiChangedObjectValue:v8 forKey:v6];
}

- (void)_removeCachedMeltedObject:(id)a3 forMultiValueKey:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__EKObject_Shared___removeCachedMeltedObject_forMultiValueKey___block_invoke;
    v8[3] = &unk_1E5B98EC0;
    id v9 = v6;
    [(EKObject *)self _updateCachedMeltedObjectSetForMultiValueKey:a4 usingBlock:v8];
  }
}

id __63__EKObject_Shared___removeCachedMeltedObject_forMultiValueKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 mutableCopy];
  [v3 removeObject:*(void *)(a1 + 32)];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)frozenOrMeltedCachedMultiRelationObjectsForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(EKObject *)self multiChangedObjectValuesForKey:v4];
  }
  id v8 = v7;

  return v8;
}

- (void)updateMeltedAndCachedSingleRelationObject:(id)a3 forKey:(id)a4 frozenClass:(Class)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(EKObject *)self eventStore];
  id v10 = [v8 meltedObjectInStore:v9];

  uint64_t v11 = [v10 frozenObject];
  if (v8 && !v10 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKObject(Shared) meltedAndCachedSingleRelationObjectForKey:]();
  }
  [(EKObject *)self setCachedMeltedObject:v10 forSingleValueKey:v7];
  [(EKObject *)self setSingleChangedValue:v11 forKey:v7];
}

- (void)updateMeltedAndCachedMultiRelationObjects:(id)a3 forKey:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [(EKObject *)self eventStore];
  unint64_t v10 = 0x1E4F1C000uLL;
  uint64_t v11 = v8;
  if (v9)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v18 = [v17 eventStore];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            uint64_t v20 = [v17 eventStore];

            if (v9 != v20)
            {
              uint64_t v39 = self;
              id v40 = v8;
              id v41 = v7;
              uint64_t v21 = v12;

              objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v12, "count"));
              id v12 = (id)objc_claimAutoreleasedReturnValue();
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v22 = v21;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v62 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v48;
                do
                {
                  for (uint64_t j = 0; j != v24; ++j)
                  {
                    if (*(void *)v48 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    long long v27 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                    long long v28 = [v27 meltedObjectInStore:v9];
                    if (v28)
                    {
                      [v12 addObject:v28];
                    }
                    else
                    {
                      long long v29 = (void *)EKLogHandle;
                      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                      {
                        log = v29;
                        uint64_t v30 = objc_opt_class();
                        long long v31 = [v27 objectID];
                        *(_DWORD *)buf = 138412802;
                        long long v57 = v27;
                        __int16 v58 = 2114;
                        uint64_t v59 = v30;
                        __int16 v60 = 2114;
                        id v61 = v31;
                        _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Failed to copy %@ (class = %{public}@, objectID = %{public}@) to my event store.", buf, 0x20u);
                      }
                    }
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v62 count:16];
                }
                while (v24);
              }

              uint64_t v11 = (void *)[v12 copy];
              id v8 = v40;
              id v7 = v41;
              self = v39;
              goto LABEL_24;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      uint64_t v11 = v12;
LABEL_24:
      unint64_t v10 = 0x1E4F1C000;
    }
    else
    {
      uint64_t v11 = v12;
    }
  }
  [(EKObject *)self setCachedMeltedObjects:v8 forMultiValueKey:v7];
  int v32 = objc_msgSend(*(id *)(v10 + 2688), "setWithCapacity:", objc_msgSend(v11, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v33 = v11;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = [*(id *)(*((void *)&v43 + 1) + 8 * k) frozenObject];
        [v32 addObject:v38];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v35);
  }

  [(EKObject *)self replaceMultiChangedObjectValuesWithObjectValues:v32 forKey:v7];
}

- (unint64_t)meltedAndCachedMultiRelationCountForKey:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __60__EKObject_Shared__meltedAndCachedMultiRelationCountForKey___block_invoke;
  id v12 = &unk_1E5B98EE8;
  uint64_t v13 = self;
  id v5 = v4;
  id v14 = v5;
  uint64_t v15 = &v21;
  long long v16 = &v17;
  [(EKObject *)self _performWithLock:&v9];
  if (*((unsigned char *)v22 + 24))
  {
    unint64_t v6 = v18[3];
  }
  else
  {
    id v7 = -[EKObject multiChangedObjectValuesForKey:](self, "multiChangedObjectValuesForKey:", v5, v9, v10, v11, v12, v13);
    unint64_t v6 = [v7 count];
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v6;
}

void __60__EKObject_Shared__meltedAndCachedMultiRelationCountForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = v4;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 count];
    uint64_t v3 = v4;
  }
}

- (void)updateAfterApplyingChanges:(id)a3 objectIdentifierBlock:(id)a4
{
  [(EKObject *)self updateMeltedCacheForChangeSet:a3 objectIdentifierBlock:a4];

  [(EKObject *)self _resetInternalStateWithForce:0];
}

- (void)updateMeltedCacheForChangeSet:(id)a3 objectIdentifierBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 changedSingleValueKeys];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __72__EKObject_Shared__updateMeltedCacheForChangeSet_objectIdentifierBlock___block_invoke;
  uint64_t v13 = &unk_1E5B97140;
  id v14 = v8;
  uint64_t v15 = self;
  id v9 = v8;
  [(EKObject *)self _performWithLock:&v10];
  -[EKObject updateMultiValueCacheForChangeSet:preservingExistingAdds:objectIdentifierBlock:](self, "updateMultiValueCacheForChangeSet:preservingExistingAdds:objectIdentifierBlock:", v7, 0, v6, v10, v11, v12, v13);
}

void __72__EKObject_Shared__updateMeltedCacheForChangeSet_objectIdentifierBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "_cachedMeltedObjects", (void)v9);
        [v8 removeObjectForKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)updateMultiValueCacheForChangeSet:(id)a3 preservingExistingAdds:(BOOL)a4 objectIdentifierBlock:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (char *)a5;
  id v8 = (char *)&__block_literal_global_61;
  long long v69 = 0u;
  long long v70 = 0u;
  if (v7) {
    id v8 = v7;
  }
  long long v43 = (void (**)(char *, void *))v8;
  long long v71 = 0uLL;
  long long v72 = 0uLL;
  obuint64_t j = [v6 changedMultiValueKeys];
  uint64_t v44 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v44)
  {
    uint64_t v41 = *(void *)v70;
    long long v9 = v43 + 2;
    id v42 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v70 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v10;
        uint64_t v11 = *(void *)(*((void *)&v69 + 1) + 8 * v10);
        id v12 = [(EKObject *)self meltedAndCachedMultiRelationObjectsForKey:v11];
        uint64_t v13 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:v11];
        uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_2;
        v66[3] = &unk_1E5B98F10;
        uint64_t v15 = v43;
        id v68 = v15;
        id v54 = v14;
        id v67 = v54;
        long long v46 = v13;
        [v13 enumerateObjectsUsingBlock:v66];
        long long v16 = [(EKObject *)self multiChangedObjectValuesForKey:v11];
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_3;
        v63[3] = &unk_1E5B98F38;
        uint64_t v18 = v15;
        uint64_t v65 = v18;
        id v48 = v17;
        id v64 = v48;
        long long v45 = v16;
        [v16 enumerateObjectsUsingBlock:v63];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v53 = v11;
        uint64_t v19 = [v6 unsavedMultiValueRemovedObjectsForKey:v11];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v78 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v60 != v22) {
                objc_enumerationMutation(v19);
              }
              char v24 = (*v9)(v18, *(void **)(*((void *)&v59 + 1) + 8 * i));
              if (v24)
              {
                uint64_t v25 = [v54 objectForKeyedSubscript:v24];
                if (v25) {
                  [(EKObject *)self _removeCachedMeltedObject:v25 forMultiValueKey:v53];
                }
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v59 objects:v78 count:16];
          }
          while (v21);
        }

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v51 = [v6 unsavedMultiValueAddedObjectsForKey:v53];
        uint64_t v26 = [v51 countByEnumeratingWithState:&v55 objects:v77 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v56;
          do
          {
            uint64_t v29 = 0;
            uint64_t v49 = v27;
            do
            {
              if (*(void *)v56 != v28) {
                objc_enumerationMutation(v51);
              }
              uint64_t v30 = *(void **)(*((void *)&v55 + 1) + 8 * v29);
              long long v31 = (*v9)(v18, v30);
              if (v31)
              {
                int v32 = [v54 objectForKeyedSubscript:v31];
                if (v32 && !a4) {
                  [(EKObject *)self _removeCachedMeltedObject:v32 forMultiValueKey:v53];
                }
                if (v32) {
                  BOOL v33 = a4;
                }
                else {
                  BOOL v33 = 0;
                }
                if (!v33)
                {
                  uint64_t v34 = v18;
                  uint64_t v35 = v28;
                  id v36 = [v48 objectForKeyedSubscript:v31];
                  if (!v36)
                  {
                    uint64_t v37 = EKLogHandle;
                    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v74 = v31;
                      __int16 v75 = 2114;
                      uint64_t v76 = v53;
                      _os_log_error_impl(&dword_1A4E47000, v37, OS_LOG_TYPE_ERROR, "Missing corresponding added object with semantic identifier %@ for relation key %{public}@.", buf, 0x16u);
                    }
                    id v36 = v30;
                  }
                  uint64_t v38 = [(EKObject *)self eventStore];
                  uint64_t v39 = [v36 meltedObjectInStore:v38];

                  [(EKObject *)self _addCachedMeltedObject:v39 forMultiValueKey:v53];
                  uint64_t v28 = v35;
                  uint64_t v18 = v34;
                  uint64_t v27 = v49;
                }
              }
              ++v29;
            }
            while (v27 != v29);
            uint64_t v27 = [v51 countByEnumeratingWithState:&v55 objects:v77 count:16];
          }
          while (v27);
        }

        uint64_t v10 = v47 + 1;
        id v6 = v42;
      }
      while (v47 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
    }
    while (v44);
  }
}

uint64_t __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
}

void __99__EKObject_Shared__updateMultiValueCacheForChangeSet_preservingExistingAdds_objectIdentifierBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
}

- (void)_resetAfterUpdatingChangeSetOrBackingObjectWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKObject *)self _resetMeltedCache];

  [(EKObject *)self _resetInternalStateWithForce:v3];
}

- (void)_resetAfterUpdatingChangeSetOrBackingObject
{
  [(EKObject *)self _resetMeltedCache];

  [(EKObject *)self _resetInternalStateWithForce:0];
}

- (void)_resetMeltedCache
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
  long long v55 = self;
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v79 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1A62664B0]();
        long long v9 = [(EKObject *)self cachedMeltedObjectForSingleValueKey:v7];
        if (v9)
        {
          uint64_t v10 = [(EKObject *)self backingObject];
          uint64_t v11 = [v10 valueForKey:v7];

          uint64_t v12 = [v9 backingObject];
          if ((void *)v12 == v11)
          {
          }
          else
          {
            uint64_t v13 = (void *)v12;
            uint64_t v14 = [v9 uniqueIdentifier];
            [v11 uniqueIdentifier];
            uint64_t v15 = v4;
            v17 = uint64_t v16 = v5;
            int v58 = [v14 isEqualToString:v17];

            uint64_t v5 = v16;
            uint64_t v4 = v15;

            self = v55;
            if (!v58)
            {
              [(EKObject *)v55 setCachedMeltedObject:0 forSingleValueKey:v7];
LABEL_12:

              goto LABEL_13;
            }
          }
          [v9 _resetWithFrozenObject:v11];
          goto LABEL_12;
        }
LABEL_13:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v4);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v52 = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v18 = [v52 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v75;
    uint64_t v50 = *(void *)v75;
    do
    {
      uint64_t v21 = 0;
      uint64_t v51 = v19;
      do
      {
        if (*(void *)v75 != v20) {
          objc_enumerationMutation(v52);
        }
        uint64_t v22 = *(void *)(*((void *)&v74 + 1) + 8 * v21);
        uint64_t v23 = (void *)MEMORY[0x1A62664B0]();
        char v24 = [(EKObject *)self cachedMeltedObjectsForMultiValueKey:v22];
        uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __37__EKObject_Shared___resetMeltedCache__block_invoke;
        v72[3] = &unk_1E5B98F60;
        id obja = v25;
        id v73 = obja;
        [v24 enumerateObjectsUsingBlock:v72];
        if (v24)
        {
          if ([v24 count])
          {
            uint64_t v53 = v23;
            uint64_t v54 = v21;
            long long v59 = [MEMORY[0x1E4F1CA80] setWithSet:v24];
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            uint64_t v26 = [(EKObject *)self backingObject];
            uint64_t v27 = [v26 valueForKey:v22];

            uint64_t v28 = v27;
            uint64_t v29 = [v27 countByEnumeratingWithState:&v68 objects:v84 count:16];
            uint64_t v30 = v24;
            long long v31 = obja;
            if (v29)
            {
              uint64_t v32 = v29;
              uint64_t v33 = *(void *)v69;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v69 != v33) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v35 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                  id v36 = [v35 uniqueIdentifier];
                  uint64_t v37 = [v31 objectForKeyedSubscript:v36];

                  if (v37)
                  {
                    [v37 _resetWithFrozenObject:v35];
                    [v59 removeObject:v37];
                  }
                  else
                  {
                    uint64_t v38 = [(EKObject *)v55 eventStore];
                    uint64_t v39 = [v35 meltedObjectInStore:v38];

                    long long v31 = obja;
                    [(EKObject *)v55 _addCachedMeltedObject:v39 forMultiValueKey:v22];
                  }
                }
                uint64_t v32 = [v28 countByEnumeratingWithState:&v68 objects:v84 count:16];
              }
              while (v32);
            }

            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v40 = v59;
            uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:v83 count:16];
            self = v55;
            uint64_t v19 = v51;
            uint64_t v23 = v53;
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v65;
              do
              {
                for (uint64_t k = 0; k != v42; ++k)
                {
                  if (*(void *)v65 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  [(EKObject *)v55 _removeCachedMeltedObject:*(void *)(*((void *)&v64 + 1) + 8 * k) forMultiValueKey:v22];
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v64 objects:v83 count:16];
              }
              while (v42);
            }

            uint64_t v20 = v50;
            char v24 = v30;
            uint64_t v21 = v54;
          }
          else
          {
            [(EKObject *)self emptyMeltedCacheForKey:v22];
          }
        }

        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = [v52 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v19);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v45 = [(id)objc_opt_class() knownDerivedRelationshipKeys];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v60 objects:v82 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v61;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v61 != v48) {
          objc_enumerationMutation(v45);
        }
        [(EKObject *)self setCachedMeltedObject:0 forSingleValueKey:*(void *)(*((void *)&v60 + 1) + 8 * m)];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v60 objects:v82 count:16];
    }
    while (v47);
  }
}

void __37__EKObject_Shared___resetMeltedCache__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 uniqueIdentifier];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 uniqueIdentifier];
    [v5 setObject:v3 forKeyedSubscript:v6];
  }
  else
  {
    uint64_t v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __37__EKObject_Shared___resetMeltedCache__block_invoke_cold_1((uint64_t)v3, v7);
    }
  }
}

- (void)emptyMeltedCache
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  void v2[2] = __36__EKObject_Shared__emptyMeltedCache__block_invoke;
  v2[3] = &unk_1E5B96E08;
  v2[4] = self;
  [(EKObject *)self _performWithLock:v2];
}

void __36__EKObject_Shared__emptyMeltedCache__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  [v1 removeAllObjects];
}

- (void)emptyMeltedCacheForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EKObject_Shared__emptyMeltedCacheForKey___block_invoke;
  v6[3] = &unk_1E5B97140;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(EKObject *)self _performWithLock:v6];
}

void __43__EKObject_Shared__emptyMeltedCacheForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)emptyMeltedCacheForKeys:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__EKObject_Shared__emptyMeltedCacheForKeys___block_invoke;
  v6[3] = &unk_1E5B97140;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(EKObject *)self _performWithLock:v6];
}

void __44__EKObject_Shared__emptyMeltedCacheForKeys___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  [v2 removeObjectsForKeys:*(void *)(a1 + 40)];
}

- (id)copyMeltedObjectCache
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__18;
  long long v9 = __Block_byref_object_dispose__18;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__EKObject_Shared__copyMeltedObjectCache__block_invoke;
  v4[3] = &unk_1E5B96F20;
  v4[4] = self;
  v4[5] = &v5;
  [(EKObject *)self _performWithLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__EKObject_Shared__copyMeltedObjectCache__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)augmentMeltedObjectCache:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v57 = self;
  id v5 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v78 objects:v87 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v79 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v11 = [v4 objectForKeyedSubscript:v10];
        if (v11)
        {
          uint64_t v12 = [(EKObject *)v57 frozenOrMeltedCachedSingleRelationObjectForKey:v10];
          uint64_t v13 = [v12 frozenObject];
          uint64_t v14 = [v11 frozenObject];

          if (v13 == v14) {
            [(EKObject *)v57 setCachedMeltedObject:v11 forSingleValueKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v7);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v15 = v57;
  obuint64_t j = [(id)objc_opt_class() knownRelationshipMultiValueKeys];
  uint64_t v51 = v4;
  uint64_t v53 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v75 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        uint64_t v18 = [v4 objectForKeyedSubscript:v17];
        if ([v18 count])
        {
          uint64_t v56 = j;
          uint64_t v54 = v17;
          uint64_t v19 = [(EKObject *)v15 frozenOrMeltedCachedMultiRelationObjectsForKey:v17];
          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v21 = v19;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v85 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v71;
            do
            {
              for (uint64_t k = 0; k != v23; ++k)
              {
                if (*(void *)v71 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v70 + 1) + 8 * k);
                uint64_t v27 = [v26 objectID];
                [v20 setObject:v26 forKeyedSubscript:v27];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v70 objects:v85 count:16];
            }
            while (v23);
          }

          uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v21, "count"));
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v55 = v18;
          id v29 = v18;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v66 objects:v84 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v67;
            do
            {
              for (uint64_t m = 0; m != v31; ++m)
              {
                if (*(void *)v67 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void **)(*((void *)&v66 + 1) + 8 * m);
                uint64_t v35 = [v34 objectID];
                id v36 = [v20 objectForKeyedSubscript:v35];

                if (v36)
                {
                  [v28 addObject:v34];
                  [v20 removeObjectForKey:v35];
                }
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v66 objects:v84 count:16];
            }
            while (v31);
          }

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v37 = v20;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v83 count:16];
          uint64_t v15 = v57;
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v63;
            do
            {
              for (uint64_t n = 0; n != v39; ++n)
              {
                if (*(void *)v63 != v40) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v42 = [v37 objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * n)];
                uint64_t v43 = [(EKObject *)v57 eventStore];
                uint64_t v44 = [v42 meltedObjectInStore:v43];

                [v28 addObject:v44];
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v62 objects:v83 count:16];
            }
            while (v39);
          }

          [(EKObject *)v57 setCachedMeltedObjects:v28 forMultiValueKey:v54];
          id v4 = v51;
          uint64_t v18 = v55;
          uint64_t j = v56;
        }
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v53);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v45 = [(id)objc_opt_class() knownDerivedRelationshipKeys];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:v82 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v59;
    do
    {
      for (iuint64_t i = 0; ii != v47; ++ii)
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(v45);
        }
        [(EKObject *)v15 setCachedMeltedObject:0 forSingleValueKey:*(void *)(*((void *)&v58 + 1) + 8 * ii)];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v58 objects:v82 count:16];
    }
    while (v47);
  }
}

- (id)diffWithObject:(id)a3
{
  return [(EKObject *)self diffWithObject:a3 compareUIVisiblePropertiesOnly:0];
}

- (id)diffWithObject:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  return +[EKDiff diffBetweenObject:self andObject:a3 compareUIVisiblePropertiesOnly:a4];
}

- (id)inverseObjectWithObject:(id)a3 diff:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKObject *)self snapshotCopy];
  uint64_t v8 = [v7 diffWithObject:v6];
  long long v9 = v8;
  if (a4) {
    *a4 = v8;
  }
  uint64_t v10 = [(id)objc_opt_class() _changeSetForDiff:v9];
  [v7 applyChanges:v10];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18;
  uint64_t v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke;
  v22[3] = &unk_1E5B96F20;
  void v22[4] = self;
  v22[5] = &v23;
  [(EKObject *)self _performWithLock:v22];
  if ([(id)v24[5] count])
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)v24[5], "count"));
    uint64_t v12 = (void *)v24[5];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke_2;
    uint64_t v19 = &unk_1E5B96D28;
    uint64_t v20 = self;
    id v13 = v11;
    id v21 = v13;
    [v12 enumerateKeysAndObjectsUsingBlock:&v16];
    uint64_t v14 = objc_msgSend(v13, "copy", v16, v17, v18, v19, v20);
    [v7 setAdditionalMeltedObjects:v14];
  }
  _Block_object_dispose(&v23, 8);

  return v7;
}

void __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __49__EKObject_Shared__inverseObjectWithObject_diff___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
    if (([(id)objc_opt_class() isWeakRelationObject:v6 forKey:v5] & 1) == 0)
    {
      long long v9 = [v6 snapshotCopy];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
    }
  }
  else
  {
    id v10 = v6;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v10, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "snapshotCopy", (void)v19);
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    uint64_t v18 = (void *)[v11 copy];
    [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:v5];
  }
}

+ (id)duplicatedPersistentObjectForObject:(id)a3 alreadyCopiedObjects:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectID];
  int v8 = [v6 objectForKeyedSubscript:v7];
  if (!v8)
  {
    long long v9 = [v5 duplicate];
    [v9 updatePersistentObject];
    int v8 = [v9 backingObject];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }

  return v8;
}

+ (id)_changeSetForDiff:(id)a3
{
  id v4 = [a3 changeSetForDiff];
  id v5 = [v4 singleValueChanges];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = objc_opt_new();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke;
  v26[3] = &unk_1E5B98F88;
  id v29 = a1;
  id v8 = v7;
  id v27 = v8;
  id v9 = v4;
  id v28 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v26];
  id v10 = [v9 multiValueAdditions];
  uint64_t v11 = (void *)[v10 copy];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke_69;
  v22[3] = &unk_1E5B98FD8;
  id v25 = a1;
  id v23 = v8;
  id v12 = v9;
  id v24 = v12;
  id v13 = v8;
  [v11 enumerateKeysAndObjectsUsingBlock:v22];
  uint64_t v14 = [v12 multiValueRemovals];
  uint64_t v15 = (void *)[v14 copy];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke_70;
  v20[3] = &unk_1E5B99028;
  id v16 = v12;
  id v21 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v20];
  uint64_t v17 = v21;
  id v18 = v16;

  return v18;
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  if ((id)v7 == v6)
  {
  }
  else
  {
    id v8 = (void *)v7;
    id v9 = [(id)objc_opt_class() knownRelationshipSingleValueKeys];
    int v10 = [v9 containsObject:v5];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v6;
        id v12 = [(id)objc_opt_class() knownRelationshipWeakKeys];
        char v13 = [v12 containsObject:v5];

        if (v13) {
          [v11 backingObject];
        }
        else {
        id v14 = [*(id *)(a1 + 48) duplicatedPersistentObjectForObject:v11 alreadyCopiedObjects:*(void *)(a1 + 32)];
        }
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v6;
        id v16 = [(id)objc_opt_class() knownRelationshipWeakKeys];
        char v17 = [v16 containsObject:v5];

        if (v17) {
          id v14 = v15;
        }
        else {
          id v14 = (id)[v15 copy];
        }
LABEL_15:
        long long v19 = v14;

        [*(id *)(a1 + 40) forceChangeValue:v19 forKey:v5];
        goto LABEL_16;
      }
      id v18 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        __38__EKObject_Shared___changeSetForDiff___block_invoke_cold_1(v18);
      }
    }
  }
LABEL_16:
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)[a3 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__EKObject_Shared___changeSetForDiff___block_invoke_2;
  v8[3] = &unk_1E5B98FB0;
  uint64_t v12 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [*(id *)(a1 + 56) duplicatedPersistentObjectForObject:v3 alreadyCopiedObjects:*(void *)(a1 + 32)];
LABEL_5:
    id v5 = (void *)v4;
    [*(id *)(a1 + 48) replaceMultiChangeAddedObject:v3 withObject:v4 forKey:*(void *)(a1 + 40)];

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 copy];
    goto LABEL_5;
  }
  id v6 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __38__EKObject_Shared___changeSetForDiff___block_invoke_2_cold_1(v6);
  }
LABEL_8:
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)[a3 copy];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  char v13 = __38__EKObject_Shared___changeSetForDiff___block_invoke_2_71;
  id v14 = &unk_1E5B99000;
  id v15 = v5;
  id v16 = v7;
  id v8 = v7;
  id v9 = v5;
  [v6 enumerateObjectsUsingBlock:&v11];
  id v10 = objc_msgSend(*(id *)(a1 + 32), "multiValueRemovals", v11, v12, v13, v14);
  [v10 setObject:v8 forKeyedSubscript:v9];
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2_71(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 backingObject];
LABEL_5:
    id v5 = v4;
    [*(id *)(a1 + 40) addObject:v4];

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  id v6 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __38__EKObject_Shared___changeSetForDiff___block_invoke_2_71_cold_1(v6);
  }
LABEL_8:
}

+ (BOOL)_compareAllKnownKeysExceptKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5
{
  return [a1 _compareAllKnownKeysExceptKeys:a3 forObject:a4 againstObject:a5 compareIdentityKeys:1];
}

+ (BOOL)_compareAllKnownKeysExceptKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 compareIdentityKeys:(BOOL)a6
{
  uint64_t v6 = a6;
  id v10 = (void *)MEMORY[0x1E4F1CA80];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [a1 knownRelationshipMultiValueKeys];
  id v15 = [v10 setWithArray:v14];

  id v16 = [a1 knownRelationshipSingleValueKeys];
  [v15 addObjectsFromArray:v16];

  char v17 = [a1 knownSingleValueKeysForComparison];
  [v15 addObjectsFromArray:v17];

  id v18 = [a1 knownImmutableKeys];
  [v15 addObjectsFromArray:v18];

  [v15 minusSet:v13];
  LOBYTE(v6) = [a1 _compareKnownKeys:v15 forObject:v12 againstObject:v11 compareIdentityKeys:v6 compareImmutableKeys:0 propertiesToIgnore:0];

  return v6;
}

+ (BOOL)_compareKnownKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5
{
  return [a1 _compareKnownKeys:a3 forObject:a4 againstObject:a5 compareImmutableKeys:0 propertiesToIgnore:0];
}

+ (BOOL)_compareMultiValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 isPropertyUnavailable:v9]
    && ([v11 isPropertyUnavailable:v9] & 1) != 0)
  {
    BOOL v13 = 1;
  }
  else
  {
    id v14 = [v10 valueForKey:v9];
    id v15 = [v11 valueForKey:v9];
    uint64_t v16 = [v14 count];
    if (v16 == [v15 count])
    {
      id v36 = v10;
      id v37 = v15;
      id v35 = v11;
      char v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v34 = v14;
      id v18 = v14;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v44 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v24 = [v23 uniqueIdentifier];
            if (v24) {
              [v17 setObject:v23 forKeyedSubscript:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v20);
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v25 = v37;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v40;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v40 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v39 + 1) + 8 * j);
            uint64_t v31 = [v30 uniqueIdentifier];
            uint64_t v32 = [v17 objectForKeyedSubscript:v31];
            LODWORD(v30) = [a1 _compareRelationshipObject1:v32 againstRelationshipObject2:v30 propertiesToIgnore:v12 relationshipObjectKey:v9];

            if (!v30)
            {
              BOOL v13 = 0;
              goto LABEL_25;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
      BOOL v13 = 1;
LABEL_25:

      id v11 = v35;
      id v10 = v36;
      id v14 = v34;
      id v15 = v37;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

+ (BOOL)_compareNonIdentityKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  return [a1 _compareNonIdentityKeys:a3 forObject:a4 againstObject:a5 compareImmutableKeys:0 propertiesToIgnore:a6];
}

+ (BOOL)_compareNonRelationshipKeys:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = v12;
  if (v10 == v11)
  {
    BOOL v14 = 1;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__EKObject_Shared___compareNonRelationshipKeys_forObject_againstObject_propertiesToIgnore___block_invoke;
    v16[3] = &unk_1E5B99050;
    id v17 = v12;
    id v18 = v10;
    id v19 = v11;
    id v20 = a1;
    BOOL v14 = [a3 indexOfObjectPassingTest:v16] == 0x7FFFFFFFFFFFFFFFLL;
  }
  return v14;
}

uint64_t __91__EKObject_Shared___compareNonRelationshipKeys_forObject_againstObject_propertiesToIgnore___block_invoke(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([a1[4] containsObject:v6] & 1) != 0
    || [a1[5] isPropertyUnavailable:v6]
    && ([a1[6] isPropertyUnavailable:v6] & 1) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = [a1[5] valueForKey:v6];
    id v9 = [a1[6] valueForKey:v6];
    int v10 = [a1[7] canonicalizedEqualityTestValue1:v8 value2:v9 key:v6 object1:a1[5] object2:a1[6]];
    if ((v10 & 1) == 0) {
      *a4 = 1;
    }
    uint64_t v7 = v10 ^ 1u;
  }
  return v7;
}

+ (BOOL)_compareSingleValueRelationshipKey:(id)a3 forObject:(id)a4 againstObject:(id)a5 propertiesToIgnore:(id)a6 ignoreIdentityKeys:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([v13 isPropertyUnavailable:v12]
    && ([v14 isPropertyUnavailable:v12] & 1) != 0)
  {
    char v16 = 1;
  }
  else
  {
    id v17 = [v13 valueForKey:v12];
    id v18 = [v14 valueForKey:v12];
    if (v7)
    {
      id v19 = [(id)objc_opt_class() knownIdentityKeysForComparison];
      id v20 = [v15 setByAddingObjectsFromArray:v19];

      uint64_t v21 = [(id)objc_opt_class() knownSingleValueKeysToSkipForUIComparison];
      id v15 = [v20 setByAddingObjectsFromArray:v21];
    }
    char v16 = [a1 _compareRelationshipObject1:v17 againstRelationshipObject2:v18 propertiesToIgnore:v15 relationshipObjectKey:v12];
  }
  return v16;
}

+ (BOOL)_compareRelationshipObject1:(id)a3 againstRelationshipObject2:(id)a4 propertiesToIgnore:(id)a5 relationshipObjectKey:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((v9 == 0) != (v10 == 0)) {
    goto LABEL_5;
  }
  BOOL v13 = 1;
  if (v9 && v10)
  {
    id v14 = (void *)[(id)objc_opt_class() meltedClass];
    if (v14 != (void *)[(id)objc_opt_class() meltedClass])
    {
LABEL_5:
      BOOL v13 = 0;
      goto LABEL_6;
    }
    if (([v14 isWeakRelationship] & 1) != 0
      || ([v14 knownRelationshipWeakKeys],
          char v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 containsObject:v12],
          v16,
          v17))
    {
      char v18 = [v14 _compareIdentityKeysForObject:v9 againstObject:v10 propertiesToIgnore:v11];
    }
    else
    {
      char v18 = [v9 isEqual:v10 ignoringProperties:v11];
    }
    BOOL v13 = v18;
  }
LABEL_6:

  return v13;
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqual:a4];
  }
  else {
    return 1;
  }
}

- (id)privacyDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EKObject *)self uniqueIdentifier];
  id v6 = [v3 stringWithFormat:@"<%@ uniqueIdentifier=[%@]>", v4, v5];

  return v6;
}

- (id)_convertBackingObjectsWithPath:(id)a3 updateBackingObjects:(BOOL)a4 allChangedBackingObjects:(id)a5 eventStore:(id)a6 updatedBackingObjectProvider:(id)a7
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v77 = 0;
  long long v78 = &v77;
  uint64_t v79 = 0x3032000000;
  long long v80 = __Block_byref_object_copy__18;
  long long v81 = __Block_byref_object_dispose__18;
  id v82 = 0;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke;
  v76[3] = &unk_1E5B96F20;
  v76[4] = self;
  v76[5] = &v77;
  [(EKObject *)self _performWithLock:v76];
  uint64_t v70 = 0;
  long long v71 = &v70;
  uint64_t v72 = 0x3032000000;
  long long v73 = __Block_byref_object_copy__18;
  long long v74 = __Block_byref_object_dispose__18;
  id v75 = 0;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_2;
  v69[3] = &unk_1E5B99078;
  v69[4] = &v70;
  id v15 = (void *)MEMORY[0x1A6266730](v69);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_3;
  v62[3] = &unk_1E5B990A0;
  BOOL v67 = a4;
  id v43 = v12;
  id v63 = v43;
  id v44 = v13;
  id v64 = v44;
  id v45 = v14;
  id v65 = v45;
  char v68 = 1;
  id v46 = v15;
  id v66 = v46;
  char v16 = (void (**)(void, void, void, void))MEMORY[0x1A6266730](v62);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = (id)v78[5];
  uint64_t v49 = [obj countByEnumeratingWithState:&v58 objects:v84 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v51 = [(id)v78[5] objectForKeyedSubscript:v17];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(id)objc_opt_class() isWeakRelationObject:v51 forKey:v17]) {
            goto LABEL_43;
          }
          id v18 = v51;
          id v52 = [(EKObject *)self backingObjectOfChildObject:v18 withRelationshipKey:v17];
          if (v53
            && ([(EKObject *)self changeSet],
                id v19 = objc_claimAutoreleasedReturnValue(),
                char v20 = [v19 hasUnsavedChangeForKey:v17],
                v19,
                (v20 & 1) == 0))
          {
            id v35 = [(EKObject *)self backingObject];
            id v36 = [v35 remObjectID];

            if (v36)
            {
              [v53 addObject:v36];
              id v21 = v53;
            }
            else
            {
              id v21 = 0;
            }
          }
          else
          {
            id v21 = 0;
          }
          id v37 = ((void (**)(void, id, id, id))v16)[2](v16, v52, v18, v21);
          uint64_t v38 = [(EKObject *)self changeSet];
          id v39 = [v38 valueForSingleValueKey:v17 basedOn:0];

          if (v37 && v39)
          {
            [(EKObject *)self setSingleChangedValue:v37 forKey:v17];
          }
          else if (v39 != v52)
          {
            long long v40 = [(EKObject *)self changeSet];
            [v40 forceChangeValue:v52 forKey:v17];

            (*((void (**)(id, id, id))v46 + 2))(v46, v52, v52);
          }
          if (v21) {
            [v53 removeLastObject];
          }
        }
        else
        {
          id v22 = v51;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v52 = v22;
          uint64_t v23 = [v52 countByEnumeratingWithState:&v54 objects:v83 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v55 != v24) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 8 * j);
                uint64_t v27 = [(EKObject *)self backingObjectOfChildObject:v26 withRelationshipKey:v17];
                if (v53
                  && ([(EKObject *)self changeSet],
                      uint64_t v28 = objc_claimAutoreleasedReturnValue(),
                      char v29 = [v28 isUniqueAddedObject:v26 forKey:v17],
                      v28,
                      (v29 & 1) == 0))
                {
                  uint64_t v31 = [(EKObject *)self backingObject];
                  uint64_t v32 = [v31 remObjectID];

                  if (v32)
                  {
                    [v53 addObject:v32];
                    id v30 = v53;
                  }
                  else
                  {
                    id v30 = 0;
                  }
                }
                else
                {
                  id v30 = 0;
                }
                uint64_t v33 = ((void (**)(void, void *, uint64_t, id))v16)[2](v16, v27, v26, v30);
                if (v33)
                {
                  uint64_t v34 = [(EKObject *)self changeSet];
                  [v34 replaceMultiChangeAddedObject:v27 withObject:v33 forKey:v17];
                }
                if (v30) {
                  [v53 removeLastObject];
                }
              }
              uint64_t v23 = [v52 countByEnumeratingWithState:&v54 objects:v83 count:16];
            }
            while (v23);
          }
        }

LABEL_43:
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v58 objects:v84 count:16];
    }
    while (v49);
  }

  id v41 = (id)v71[5];
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v77, 8);

  return v41;
}

void __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  id v10 = [v11 uniqueIdentifier];
  [v6 setObject:v5 forKeyedSubscript:v10];
}

id __137__EKObject_Shared___convertBackingObjectsWithPath_updateBackingObjects_allChangedBackingObjects_eventStore_updatedBackingObjectProvider___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 _convertBackingObjectsWithPath:v9 updateBackingObjects:*(unsigned __int8 *)(a1 + 64) allChangedBackingObjects:*(void *)(a1 + 32) eventStore:*(void *)(a1 + 40) updatedBackingObjectProvider:*(void *)(a1 + 48)];
  objc_opt_class();
  if (*(unsigned char *)(a1 + 65) == (objc_opt_isKindOfClass() & 1))
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v11 = *(void **)(a1 + 48);
      id v12 = [v7 uniqueIdentifier];
      id v13 = [v11 existingUpdatedObject:v12];

      if ([v10 count] || (objc_msgSend(v8, "hasUnsavedChanges") & 1) != 0 || v13)
      {
        if (!v13) {
          id v13 = v7;
        }
        id v14 = [v8 changeSet];
        id v15 = [v13 updatedFrozenObjectWithChanges:v14 updatedChildren:v10];

        if (v15 == v13)
        {
          id v15 = v13;
        }
        else
        {
          char v16 = [v8 changeSet];
          [v16 markChangesAsSaved];

          [v8 setBackingObject:v15];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          if (v9 && *(void *)(a1 + 32))
          {
            [v15 setPath:v9];
            [*(id *)(a1 + 32) addObject:v15];
          }
        }
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "alternateUniverseClass")), "initWithAlternateUniverseObject:inEventStore:withUpdatedChildObjects:", v7, *(void *)(a1 + 40), v10);
    id v15 = v17;
    if (*(unsigned char *)(a1 + 64))
    {
      id v18 = [v17 uncommittedChanges];
      id v19 = [v8 changeSet];
      [v18 addChanges:v19];

      char v20 = [v8 changeSet];
      [v20 markChangesAsSaved];
    }
    [v8 setBackingObject:v15];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

  return v15;
}

- (id)backingObjectOfChildObject:(id)a3 withRelationshipKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 backingObject];
  if (!v8)
  {
    id v9 = [(EKObject *)self changeSet];
    id v10 = [v9 singleValueChanges];
    id v8 = [v10 objectForKeyedSubscript:v7];

    if (!v8)
    {
      id v11 = [v6 uniqueIdentifier];
      id v12 = [(EKObject *)self changeSet];
      id v13 = [v12 unsavedMultiValueAddedObjectsForKey:v7];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = v13;
      id v8 = (id)[v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v14);
            }
            uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v18 = objc_msgSend(v17, "uniqueIdentifier", (void)v21);
            int v19 = [v18 isEqualToString:v11];

            if (v19)
            {
              id v8 = v17;
              goto LABEL_13;
            }
          }
          id v8 = (id)[v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }

  return v8;
}

- (id)prepareReminderKitObjectForSaveWithUpdatedBackingObjectProvider:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(EKObject *)self eventStore];
  id v9 = [(EKObject *)self _convertBackingObjectsWithPath:v7 updateBackingObjects:1 allChangedBackingObjects:v6 eventStore:v8 updatedBackingObjectProvider:v5];

  id v10 = [(EKObject *)self changeSet];
  if ([v10 hasUnsavedChanges])
  {
  }
  else
  {
    uint64_t v11 = [v9 count];

    if (!v11) {
      goto LABEL_5;
    }
  }
  id v12 = [(EKObject *)self backingObject];
  id v13 = [(EKObject *)self changeSet];
  id v14 = [v12 updatedFrozenObjectWithChanges:v13 updatedChildren:v9];

  [(EKObject *)self setBackingObject:v14];
  uint64_t v15 = [(EKObject *)self changeSet];
  [v15 markChangesAsSaved];

  [v6 addObject:v14];
LABEL_5:

  return v6;
}

- (id)cachedMeltedChildIdentifierToParentMap
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(EKObject *)self _cachedMeltedChildIdentifierToParentMap:v3];

  return v3;
}

- (void)_cachedMeltedChildIdentifierToParentMap:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__18;
  id v41 = __Block_byref_object_dispose__18;
  id v42 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __60__EKObject_Shared___cachedMeltedChildIdentifierToParentMap___block_invoke;
  v36[3] = &unk_1E5B96F20;
  v36[4] = self;
  v36[5] = &v37;
  [(EKObject *)self _performWithLock:v36];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = (id)v38[5];
  uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v23 = [(id)v38[5] objectForKeyedSubscript:v5];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v6 = v23;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v51 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v7; ++j)
              {
                if (*(void *)v29 != v8) {
                  objc_enumerationMutation(v6);
                }
                id v10 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                if (([(id)objc_opt_class() isWeakRelationObject:v10 forKey:v5] & 1) == 0)
                {
                  uint64_t v11 = [v10 uniqueIdentifier];
                  if (v11)
                  {
                    [v4 setObject:self forKeyedSubscript:v11];
                  }
                  else
                  {
                    id v12 = (id)EKLogHandle;
                    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
                    {
                      id v27 = (id)objc_opt_class();
                      uint64_t v24 = objc_opt_class();
                      uint64_t v26 = [v10 frozenObject];
                      uint64_t v13 = [v26 REMObject];
                      *(_DWORD *)buf = 138544130;
                      id v44 = v27;
                      __int16 v45 = 2114;
                      uint64_t v46 = v5;
                      __int16 v47 = 2114;
                      uint64_t v48 = v24;
                      __int16 v49 = 2112;
                      uint64_t v50 = v13;
                      id v25 = (void *)v13;
                      _os_log_fault_impl(&dword_1A4E47000, v12, OS_LOG_TYPE_FAULT, "Got a nil unique identifier for object of type %{public}@ for relation key %{public}@ on object of type %{public}@. Backing object of bad object = %@", buf, 0x2Au);
                    }
                  }
                  [v10 _cachedMeltedChildIdentifierToParentMap:v4];
                }
              }
              uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v51 count:16];
            }
            while (v7);
          }
        }
        else
        {
          if ([(id)objc_opt_class() isWeakRelationObject:v23 forKey:v5]) {
            goto LABEL_30;
          }
          id v6 = [v23 uniqueIdentifier];
          if (v6)
          {
            [v4 setObject:self forKeyedSubscript:v6];
          }
          else
          {
            id v14 = (id)EKLogHandle;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              id v15 = (id)objc_opt_class();
              uint64_t v16 = objc_opt_class();
              uint64_t v17 = [v23 frozenObject];
              id v18 = [v17 REMObject];
              *(_DWORD *)buf = 138544130;
              id v44 = v15;
              __int16 v45 = 2114;
              uint64_t v46 = v5;
              __int16 v47 = 2114;
              uint64_t v48 = v16;
              __int16 v49 = 2112;
              uint64_t v50 = (uint64_t)v18;
              _os_log_fault_impl(&dword_1A4E47000, v14, OS_LOG_TYPE_FAULT, "Got a nil unique identifier for object of type %{public}@ for relation key %{public}@ on object of type %{public}@. Backing object of bad object = %@", buf, 0x2Au);
            }
          }
          [v23 _cachedMeltedChildIdentifierToParentMap:v4];
        }

LABEL_30:
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v21);
  }

  _Block_object_dispose(&v37, 8);
}

void __60__EKObject_Shared___cachedMeltedChildIdentifierToParentMap___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _cachedMeltedObjects];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __37__EKObject_Shared___resetMeltedCache__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F29060];
  id v3 = a2;
  id v10 = [v2 callStackSymbols];
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "All EKObjects need to have a unique identifier but %@ does not. %@", v6, v7, v8, v9, 2u);
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_cold_1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v3, v4, "Unexpected object type %{public}@ in change set for change to single value key %{public}@", v5, v6, v7, v8, 2u);
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2_cold_1(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_3_2(v2);
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Unexpected object type %{public}@ in change set for multi value add for key %{public}@", v6, v7, v8, v9, v10);
}

void __38__EKObject_Shared___changeSetForDiff___block_invoke_2_71_cold_1(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_3_2(v2);
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Unexpected object type %{public}@ in change set for multi value delete for key %{public}@", v6, v7, v8, v9, v10);
}

@end