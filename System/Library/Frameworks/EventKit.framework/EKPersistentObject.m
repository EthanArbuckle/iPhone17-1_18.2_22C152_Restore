@interface EKPersistentObject
+ (BOOL)_shouldRetainPropertyForKey:(id)a3;
+ (Class)alternateUniverseClass;
+ (Class)meltedClass;
+ (id)_createNonPartialObjectFromObject:(id)a3 ifPropertyIsUnavailable:(id)a4;
+ (id)_relationForKey:(id)a3;
+ (id)allObjectsWithChangesRelatedToObjects:(id)a3;
+ (id)defaultPropertiesToLoad;
+ (id)propertiesToUnloadOnCommit;
+ (id)propertiesUnavailableForPartialObjects;
+ (id)propertyKeyForUniqueIdentifier;
+ (id)relations;
+ (void)_takeDefaultValuesForObjects:(id)a3 inEventStore:(id)a4;
+ (void)alternateUniverseClass;
- (BOOL)_areDefaultPropertiesLoaded;
- (BOOL)_isNew;
- (BOOL)_isPendingDelete;
- (BOOL)_isPendingInsert;
- (BOOL)_isPendingUpdate;
- (BOOL)_loadChildIdentifiersForKey:(id)a3 values:(id *)a4;
- (BOOL)_loadRelationForKey:(id)a3 value:(id *)a4;
- (BOOL)allowsDeletion;
- (BOOL)canBeConvertedToFullObject;
- (BOOL)existsInStore;
- (BOOL)isCompletelyEqual:(id)a3;
- (BOOL)isDirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4;
- (BOOL)isFrozen;
- (BOOL)isPartialObject;
- (BOOL)isPropertyDirty:(id)a3;
- (BOOL)isPropertyLoaded:(id)a3;
- (BOOL)isPropertyUnavailable:(id)a3;
- (BOOL)primitiveBoolValueForKey:(id)a3;
- (BOOL)refresh;
- (CADGenerationStampedObjectID)CADObjectID;
- (Class)frozenClass;
- (EKEventStore)eventStore;
- (EKObjectID)objectID;
- (EKPersistentObject)init;
- (NSString)uniqueIdentifier;
- (double)primitiveDoubleValueForKey:(id)a3;
- (id)_CADObjectID;
- (id)_loadStringValueForKey:(id)a3;
- (id)_loadedPropertyForKey:(id)a3;
- (id)_loadedPropertyKeys;
- (id)_primitiveValueForKey:(id)a3 loader:(id)a4;
- (id)_propertyForKey:(id)a3;
- (id)changeSet;
- (id)coCommitObjects;
- (id)dirtyPropertiesAndValues;
- (id)dump;
- (id)existingMeltedObject;
- (id)frozenObjectInStore:(id)a3;
- (id)loadedOrUpdatedPropertyValue:(id)a3 wasAvailable:(BOOL *)a4;
- (id)loadedPropertyForKey:(id)a3;
- (id)meltedObjectInStore:(id)a3;
- (id)ownedObjects;
- (id)preFrozenRelationshipObjects;
- (id)primitiveDataValueForKey:(id)a3;
- (id)primitiveDateValueForKey:(id)a3;
- (id)primitiveNumberValueForKey:(id)a3;
- (id)primitiveRelationValueForKey:(id)a3;
- (id)primitiveSecurityScopedURLWrapperValueForKey:(id)a3;
- (id)primitiveStringValueForKey:(id)a3;
- (id)rebasedFrom;
- (id)updatedPropertiesWithOnlyPersistentObjects;
- (int)databaseRestoreGeneration;
- (int)entityType;
- (int)primitiveIntValueForKey:(id)a3;
- (void)_addObjectCore:(id)a3 toValues:(id)a4 relation:(id)a5;
- (void)_createLoadedPropertiesIfNeeded;
- (void)_createUpdatedPropertiesIfNeeded;
- (void)_loadDefaultPropertiesIfNeeded;
- (void)_loadPropertiesIfNeeded:(id)a3;
- (void)_primitiveSetValue:(id)a3 forKey:(id)a4;
- (void)_releaseLoadedProperties;
- (void)_removeObjectCore:(id)a3 fromValues:(id)a4 relation:(id)a5;
- (void)_setDefaultPropertiesLoaded:(BOOL)a3;
- (void)_setEventStore:(id)a3;
- (void)_setObjectID:(id)a3 inDatabaseRestoreGeneration:(int)a4;
- (void)_setPendingDelete:(BOOL)a3;
- (void)_setPendingInsert:(BOOL)a3;
- (void)_setPendingUpdate:(BOOL)a3;
- (void)_setProperty:(id)a3 forKey:(id)a4 forRelation:(id)a5 isUpdatedProperty:(BOOL)a6;
- (void)_setProperty:(id)a3 forKey:(id)a4 isRelation:(BOOL)a5 isUpdatedProperty:(BOOL)a6;
- (void)_setProperty:(id)a3 forKey:(id)a4 isUpdatedProperty:(BOOL)a5;
- (void)_takeValues:(id)a3 forKeys:(id)a4 relatedObjectValues:(id)a5;
- (void)_takeValues:(id)a3 relatedObjectValues:(id)a4;
- (void)_takeValuesForDefaultPropertyKeys:(id)a3 values:(id)a4 relatedObjectValues:(id)a5;
- (void)addCoCommitObject:(id)a3;
- (void)changed;
- (void)dealloc;
- (void)didCommit;
- (void)internalAddCoCommitObject:(id)a3;
- (void)internalRemoveCoCommitObject:(id)a3;
- (void)loadPropertiesIfNeeded:(id)a3;
- (void)primitiveAddRelatedObject:(id)a3 forKey:(id)a4;
- (void)primitiveRemoveRelatedObject:(id)a3 forKey:(id)a4;
- (void)primitiveSetBoolValue:(BOOL)a3 forKey:(id)a4;
- (void)primitiveSetDataValue:(id)a3 forKey:(id)a4;
- (void)primitiveSetDateValue:(id)a3 forKey:(id)a4;
- (void)primitiveSetDoubleValue:(double)a3 forKey:(id)a4;
- (void)primitiveSetIntValue:(int)a3 forKey:(id)a4;
- (void)primitiveSetNumberValue:(id)a3 forKey:(id)a4;
- (void)primitiveSetRelationValue:(id)a3 forKey:(id)a4;
- (void)primitiveSetSecurityScopedURLWrapperValue:(id)a3 forKey:(id)a4;
- (void)primitiveSetStringValue:(id)a3 forKey:(id)a4;
- (void)removeCoCommitObject:(id)a3;
- (void)reset;
- (void)reset:(id)a3;
- (void)rollback;
- (void)setRebasedFrom:(id)a3;
- (void)takeDefaultValues:(id)a3;
- (void)takeValues:(id)a3 forKeys:(id)a4;
- (void)takeValuesForDefaultPropertyKeys:(id)a3 values:(id)a4;
- (void)unloadPropertyForKey:(id)a3;
@end

@implementation EKPersistentObject

- (BOOL)isEqual:(id)a3
{
  v4 = (EKPersistentObject *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    char v8 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(EKPersistentObject *)v5 objectID];
    if (v6)
    {
      pthread_mutex_lock(&self->_lock);
      v7 = self->_objectID;
      pthread_mutex_unlock(&self->_lock);
      if (v7) {
        char v8 = [v6 isEqual:v7];
      }
      else {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
LABEL_7:
    char v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)_isNew
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objectID = self->_objectID;
  if (objectID) {
    char v5 = [(EKObjectID *)objectID isTemporary];
  }
  else {
    char v5 = 1;
  }
  pthread_mutex_unlock(p_lock);
  return v5;
}

- (BOOL)isPropertyLoaded:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  v6 = [(EKPersistentObject *)self _loadedPropertyForKey:v5];

  pthread_mutex_unlock(p_lock);
  return v6 != 0;
}

- (EKObjectID)objectID
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = self->_objectID;
  pthread_mutex_unlock(p_lock);

  return v4;
}

- (BOOL)isPropertyUnavailable:(id)a3
{
  char v5 = 0;
  id v3 = [(EKPersistentObject *)self loadedOrUpdatedPropertyValue:a3 wasAvailable:&v5];
  return v5 == 0;
}

- (id)loadedOrUpdatedPropertyValue:(id)a3 wasAvailable:(BOOL *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  pthread_mutex_lock(p_lock);
  char v8 = [(EKPersistentObject *)self _propertyForKey:v7];

  pthread_mutex_unlock(p_lock);
  if (a4) {
    *a4 = v8 != 0;
  }
  v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8 == v9)
  {

    char v8 = 0;
  }

  return v8;
}

- (int)primitiveIntValueForKey:(id)a3
{
  id v3 = [(EKPersistentObject *)self primitiveNumberValueForKey:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (id)primitiveDateValueForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  v6 = [(EKPersistentObject *)self _CADObjectID];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __47__EKPersistentObject_primitiveDateValueForKey___block_invoke;
  v14 = &unk_1E5B98740;
  id v15 = v6;
  v16 = self;
  id v7 = v6;
  char v8 = [(EKPersistentObject *)self _primitiveValueForKey:v5 loader:&v11];

  v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);
  pthread_mutex_unlock(p_lock);

  return v9;
}

- (id)primitiveNumberValueForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v6 = [(EKPersistentObject *)self _CADObjectID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke;
  v12[3] = &unk_1E5B986F0;
  id v13 = v6;
  v14 = self;
  id v15 = v4;
  id v7 = v4;
  id v8 = v6;
  v9 = [(EKPersistentObject *)self _primitiveValueForKey:v7 loader:v12];
  v10 = (void *)[v9 copy];

  pthread_mutex_unlock(p_lock);

  return v10;
}

- (id)_CADObjectID
{
  return [(EKObjectID *)self->_objectID CADObjectIDWithGeneration:self->_databaseRestoreGeneration];
}

- (id)primitiveStringValueForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__EKPersistentObject_primitiveStringValueForKey___block_invoke;
  v9[3] = &unk_1E5B96A48;
  v9[4] = self;
  v6 = [(EKPersistentObject *)self _primitiveValueForKey:v5 loader:v9];

  id v7 = (void *)[v6 copy];
  pthread_mutex_unlock(p_lock);

  return v7;
}

- (id)primitiveRelationValueForKey:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(EKPersistentObject *)self _loadDefaultPropertiesIfNeeded];
  v6 = [(EKPersistentObject *)self _propertyForKey:v4];
  id v7 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v7)
  {

    v6 = 0;
  }
  else if (!v6)
  {
    id v8 = [(id)objc_opt_class() _relationForKey:v4];
    v9 = v8;
    if (v8)
    {
      if ([v8 toMany])
      {
        id v35 = 0;
        BOOL v10 = [(EKPersistentObject *)self _loadChildIdentifiersForKey:v4 values:&v35];
        id v11 = v35;
        uint64_t v12 = v11;
        v6 = 0;
        if (v10)
        {
          if (v11)
          {
            v29 = v9;
            id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v11, "count"));
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            v28 = v12;
            id v14 = v12;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v32 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                  v20 = [(EKPersistentObject *)self eventStore];
                  v21 = [v20 registerFetchedObjectWithID:v19];

                  if (v21) {
                    [v13 addObject:v21];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
              }
              while (v16);
            }

            v6 = [MEMORY[0x1E4F1CA80] setWithSet:v13];
            [(EKPersistentObject *)self _setProperty:v6 forKey:v4 isUpdatedProperty:0];

            uint64_t v12 = v28;
            v9 = v29;
          }
          else
          {
            [(EKPersistentObject *)self _setProperty:0 forKey:v4 isUpdatedProperty:0];
            v6 = 0;
          }
        }
      }
      else
      {
        id v30 = 0;
        BOOL v24 = [(EKPersistentObject *)self _loadRelationForKey:v4 value:&v30];
        id v25 = v30;
        uint64_t v12 = v25;
        v6 = 0;
        if (v24 && v25)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          v6 = [WeakRetained registerFetchedObjectWithID:v12];
        }
        [(EKPersistentObject *)self _setProperty:v6 forKey:v4 isUpdatedProperty:0];
      }
    }
    else
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      NSLog(&cfstr_IsNotARelation.isa, v4, v23);

      v6 = 0;
    }
  }
  pthread_mutex_unlock(p_lock);

  return v6;
}

- (id)_primitiveValueForKey:(id)a3 loader:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  [(EKPersistentObject *)self _loadDefaultPropertiesIfNeeded];
  id v8 = [(EKPersistentObject *)self _propertyForKey:v6];
  v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8 == v9)
  {

    id v8 = 0;
  }
  else if (!v8)
  {
    id v8 = v7[2](v7, v6);
    [(EKPersistentObject *)self _setProperty:v8 forKey:v6 isUpdatedProperty:0];
  }

  return v8;
}

- (id)_propertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_updatedProperties objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 value];
    if (!v6) {
      [(NSMutableDictionary *)self->_updatedProperties removeObjectForKey:v4];
    }

    id v5 = (void *)v6;
  }
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(EKPersistentObject *)self _loadedPropertyForKey:v4];
  }
  id v8 = v7;

  return v8;
}

- (id)_loadedPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_loadedProperties objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 value];
    if (!v6) {
      [(NSMutableDictionary *)self->_loadedProperties removeObjectForKey:v4];
    }

    id v5 = (void *)v6;
  }

  return v5;
}

- (EKEventStore)eventStore
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  pthread_mutex_unlock(p_lock);

  return (EKEventStore *)WeakRetained;
}

- (void)_loadDefaultPropertiesIfNeeded
{
  id v3 = [(id)objc_opt_class() defaultPropertiesToLoad];
  if ([v3 count]
    && ![(EKPersistentObject *)self _areDefaultPropertiesLoaded])
  {
    [(EKPersistentObject *)self _loadPropertiesIfNeeded:v3];
  }
}

- (BOOL)_areDefaultPropertiesLoaded
{
  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = (v2->_flags >> 3) & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (BOOL)primitiveBoolValueForKey:(id)a3
{
  id v3 = [(EKPersistentObject *)self primitiveNumberValueForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)meltedObjectInStore:(id)a3
{
  id v4 = a3;
  id v5 = [(EKPersistentObject *)self frozenObjectInStore:v4];
  uint64_t v6 = [v4 publicObjectWithPersistentObject:v5];

  return v6;
}

- (id)frozenObjectInStore:(id)a3
{
  id v5 = a3;
  id v6 = [(EKPersistentObject *)self eventStore];
  id v7 = v6;
  if (v5 && v6 && v6 != v5)
  {
    id v8 = [v6 eventStoreIdentifier];
    v9 = [v5 eventStoreIdentifier];
    char v10 = [v8 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"EKPersistentObject.m" lineNumber:237 description:@"Cannot copy objects across different event stores backed by different databases"];
    }
    if ([(EKPersistentObject *)self isNew])
    {
      if (objc_opt_respondsToSelector()) {
        id v11 = (EKPersistentObject *)[(EKPersistentObject *)self copy];
      }
      else {
        id v11 = (EKPersistentObject *)objc_alloc_init((Class)objc_opt_class());
      }
      uint64_t v12 = v11;
      [(EKPersistentObject *)v11 _setEventStore:v5];
    }
    else
    {
      id v13 = [(EKPersistentObject *)self objectID];
      uint64_t v12 = [v5 registerFetchedObjectWithID:v13 withDefaultLoadedPropertyKeys:0 values:0];
    }
  }
  else
  {
    uint64_t v12 = self;
  }

  return v12;
}

- (BOOL)isFrozen
{
  return 1;
}

uint64_t __49__EKPersistentObject_primitiveStringValueForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadStringValueForKey:a2];
}

- (id)_loadStringValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16;
  v21 = __Block_byref_object_dispose__16;
  id v22 = 0;
  id v5 = [(EKPersistentObject *)self _CADObjectID];
  id v6 = v5;
  if (v5)
  {
    if (([v5 isTemporary] & 1) == 0)
    {
      p_eventStore = &self->_eventStore;
      id WeakRetained = objc_loadWeakRetained((id *)p_eventStore);

      if (WeakRetained)
      {
        id v9 = objc_loadWeakRetained((id *)p_eventStore);
        char v10 = [v9 connection];
        id v11 = [v10 CADOperationProxySync];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __45__EKPersistentObject__loadStringValueForKey___block_invoke;
        v14[3] = &unk_1E5B98768;
        id v15 = v4;
        uint64_t v16 = &v17;
        [v11 CADObject:v6 getStringPropertyWithName:v15 reply:v14];
      }
    }
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v12;
}

id __47__EKPersistentObject_primitiveDataValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  uint64_t v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (([v4 isTemporary] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
        id v7 = [v6 connection];
        id v8 = [v7 CADOperationProxySync];
        uint64_t v9 = *(void *)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2;
        v12[3] = &unk_1E5B98790;
        id v13 = *(id *)(a1 + 48);
        id v14 = &v15;
        [v8 CADObject:v9 getDataPropertyWithName:v3 reply:v12];
      }
    }
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

id __47__EKPersistentObject_primitiveDateValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  uint64_t v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (([v4 isTemporary] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
        id v7 = [v6 connection];
        id v8 = [v7 CADOperationProxySync];
        uint64_t v9 = *(void *)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2;
        v12[3] = &unk_1E5B98718;
        id v13 = v3;
        id v14 = &v15;
        [v8 CADObject:v9 getDatePropertyWithName:v13 reply:v12];
      }
    }
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __64__EKPersistentObject__takeDefaultValuesForObjects_inEventStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 registerFetchedObjectWithID:a2];
  [v6 takeDefaultValues:v5];
}

void __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = 0x1E4F1C000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v28 = 0;
      goto LABEL_37;
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = v6;
    uint64_t v12 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (!v12) {
      goto LABEL_35;
    }
    uint64_t v13 = v12;
    id v30 = v5;
    long long v31 = (void *)v10;
    id v29 = v6;
    uint64_t v14 = *(void *)v34;
    uint64_t v15 = (os_log_t *)&EKLogHandle;
    uint64_t v32 = *(void *)v34;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v8);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v17 = EKObjectIDFromDictionary();
      if (!v17) {
        goto LABEL_22;
      }
      v18 = v15;
      unint64_t v19 = v7;
      id v20 = v8;
      uint64_t v21 = a1;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
      v23 = [WeakRetained registerFetchedObjectWithID:v17];

      if (!v23)
      {
        a1 = v21;
        id v8 = v20;
        unint64_t v7 = v19;
        uint64_t v15 = v18;
        uint64_t v14 = v32;
        goto LABEL_22;
      }
      [v31 addObject:v23];
      a1 = v21;
      if (*(void *)(v21 + 40))
      {
        BOOL v24 = CalGetValuesFromFetchedObjectDictionary();
        id v8 = v20;
        if (v24) {
          [*(id *)(a1 + 40) setObject:v24 forKeyedSubscript:v17];
        }
      }
      else
      {
        id v8 = v20;
      }
      unint64_t v7 = v19;
      uint64_t v15 = v18;
      uint64_t v14 = v32;
LABEL_25:

      if (v13 == ++v16)
      {
        uint64_t v26 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
        uint64_t v13 = v26;
        if (!v26)
        {
          id v5 = v30;
          uint64_t v10 = (uint64_t)v31;
          id v6 = v29;
          goto LABEL_35;
        }
        goto LABEL_11;
      }
    }
    uint64_t v17 = 0;
LABEL_22:
    id v25 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v30;
      _os_log_error_impl(&dword_1A4E47000, v25, OS_LOG_TYPE_ERROR, "Failed to take value for related object with key %@", buf, 0xCu);
    }
    v23 = 0;
    goto LABEL_25;
  }
  EKObjectIDFromDictionary();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8
    && (id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72)),
        [v9 registerFetchedObjectWithID:v8],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    if (*(void *)(a1 + 40))
    {
      id v11 = CalGetValuesFromFetchedObjectDictionary();
      if (v11) {
        [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v8];
      }
    }
  }
  else
  {
    v27 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke_cold_1((uint64_t)v5, v27);
    }
    uint64_t v10 = 0;
  }
LABEL_35:

  uint64_t v28 = 1;
  id v6 = (id)v10;
LABEL_37:
  if (!*(unsigned char *)(a1 + 48) || ([*(id *)(a1 + 32) isPropertyLoaded:v5] & 1) == 0) {
    [*(id *)(a1 + 32) _setProperty:v6 forKey:v5 isRelation:v28 isUpdatedProperty:0];
  }
}

- (void)_setProperty:(id)a3 forKey:(id)a4 isRelation:(BOOL)a5 isUpdatedProperty:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a4;
  if (v7)
  {
    id v11 = [(id)objc_opt_class() _relationForKey:v10];
  }
  else
  {
    id v11 = 0;
  }
  [(EKPersistentObject *)self _setProperty:v12 forKey:v10 forRelation:v11 isUpdatedProperty:v6];
}

- (void)_setProperty:(id)a3 forKey:(id)a4 forRelation:(id)a5 isUpdatedProperty:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (uint64_t)v14;
  if (v14)
  {
    if (v11)
    {
      if ([v11 ownsRelatedObject])
      {
        uint64_t v12 = (uint64_t)v14;
      }
      else
      {
        uint64_t v13 = [[EKWeakReference alloc] initWithValue:v14];

        uint64_t v12 = (uint64_t)v13;
      }
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  id v15 = (id)v12;
  if (v6)
  {
    [(EKPersistentObject *)self _createUpdatedPropertiesIfNeeded];
    [(NSMutableDictionary *)self->_updatedProperties setObject:v15 forKey:v10];
    [(EKPersistentObject *)self changed];
  }
  else
  {
    [(EKPersistentObject *)self _createLoadedPropertiesIfNeeded];
    [(NSMutableDictionary *)self->_loadedProperties setObject:v15 forKey:v10];
  }
}

- (void)_createLoadedPropertiesIfNeeded
{
  if (!self->_loadedProperties)
  {
    self->_loadedProperties = (NSMutableDictionary *)objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
}

- (void)_setProperty:(id)a3 forKey:(id)a4 isUpdatedProperty:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() _relationForKey:v8];
  [(EKPersistentObject *)self _setProperty:v9 forKey:v8 forRelation:v10 isUpdatedProperty:v5];
}

+ (id)_relationForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 relations];
  BOOL v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)_loadChildIdentifiersForKey:(id)a3 values:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16;
  BOOL v24 = __Block_byref_object_dispose__16;
  id v25 = 0;
  BOOL v7 = [(EKPersistentObject *)self _CADObjectID];
  id v8 = v7;
  if (v7)
  {
    if (([v7 isTemporary] & 1) == 0)
    {
      p_eventStore = &self->_eventStore;
      id WeakRetained = objc_loadWeakRetained((id *)p_eventStore);

      if (WeakRetained)
      {
        id v11 = objc_loadWeakRetained((id *)p_eventStore);
        uint64_t v12 = [v11 connection];
        uint64_t v13 = [v12 CADOperationProxySync];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke;
        v16[3] = &unk_1E5B98808;
        id v17 = v6;
        v18 = &v20;
        unint64_t v19 = &v26;
        [v13 CADObject:v8 getRelatedObjectsWithRelationName:v17 reply:v16];
      }
    }
  }
  *a4 = (id) v21[5];
  char v14 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (void)_loadPropertiesIfNeeded:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] && !-[EKPersistentObject isNew](self, "isNew"))
  {
    id v5 = v4;
    if ([(NSMutableDictionary *)self->_updatedProperties count]
      || [(NSMutableDictionary *)self->_loadedProperties count])
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v34 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v12 = [(NSMutableDictionary *)self->_updatedProperties objectForKey:v11];
            if (v12)
            {
            }
            else
            {
              uint64_t v13 = [(NSMutableDictionary *)self->_loadedProperties objectForKey:v11];
              BOOL v14 = v13 == 0;

              if (v14) {
                [v6 addObject:v11];
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v8);
      }
    }
    else
    {
      id v6 = v5;
    }
    if ([v6 count])
    {
      uint64_t v27 = 0;
      uint64_t v28 = &v27;
      uint64_t v29 = 0x3032000000;
      id v30 = __Block_byref_object_copy__16;
      long long v31 = __Block_byref_object_dispose__16;
      id v32 = 0;
      id v15 = [(EKPersistentObject *)self _CADObjectID];
      uint64_t v16 = v15;
      if (v15)
      {
        if (([v15 isTemporary] & 1) == 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          BOOL v18 = WeakRetained == 0;

          if (!v18)
          {
            unint64_t v19 = (void *)MEMORY[0x1A62664B0]();
            id v20 = objc_loadWeakRetained((id *)&self->_eventStore);
            uint64_t v21 = [v20 connection];
            uint64_t v22 = [v21 CADOperationProxySync];
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __46__EKPersistentObject__loadPropertiesIfNeeded___block_invoke;
            v24[3] = &unk_1E5B986A0;
            id v25 = v16;
            uint64_t v26 = &v27;
            [v22 CADObject:v25 getPropertiesWithNames:v6 reply:v24];
          }
        }
      }
      uint64_t v23 = v28[5];
      if (v23) {
        [(EKPersistentObject *)self _takeValuesForDefaultPropertyKeys:v6 values:v23 relatedObjectValues:0];
      }

      _Block_object_dispose(&v27, 8);
    }
  }
}

id __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  BOOL v18 = __Block_byref_object_copy__16;
  unint64_t v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (([v4 isTemporary] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
        id v7 = [v6 connection];
        uint64_t v8 = [v7 CADOperationProxySync];
        uint64_t v9 = *(void *)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2;
        v12[3] = &unk_1E5B986C8;
        id v13 = *(id *)(a1 + 48);
        BOOL v14 = &v15;
        [v8 CADObject:v9 getNumberPropertyWithName:v3 reply:v12];
      }
    }
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)takeDefaultValues:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  [(EKPersistentObject *)self _takeValues:v5 relatedObjectValues:0];

  [(EKPersistentObject *)self _setDefaultPropertiesLoaded:1];

  pthread_mutex_unlock(p_lock);
}

- (void)_takeValuesForDefaultPropertyKeys:(id)a3 values:(id)a4 relatedObjectValues:(id)a5
{
  [(EKPersistentObject *)self _takeValues:a4 forKeys:a3 relatedObjectValues:a5];
  if (a4)
  {
    [(EKPersistentObject *)self _setDefaultPropertiesLoaded:1];
  }
}

- (void)_takeValues:(id)a3 forKeys:(id)a4 relatedObjectValues:(id)a5
{
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = a5;
    id v10 = [v8 dictionaryWithObjects:a3 forKeys:a4];
    [(EKPersistentObject *)self _takeValues:v10 relatedObjectValues:v9];
  }
}

- (void)_takeValues:(id)a3 relatedObjectValues:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    BOOL v8 = self->_loadedProperties != 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke;
    v9[3] = &unk_1E5B98858;
    v9[4] = self;
    id v10 = v6;
    BOOL v11 = v8;
    [a3 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

- (void)takeValuesForDefaultPropertyKeys:(id)a3 values:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)objc_opt_new();
  pthread_mutex_lock(&self->_lock);
  [(EKPersistentObject *)self _takeValuesForDefaultPropertyKeys:v7 values:v6 relatedObjectValues:v10];

  pthread_mutex_unlock(&self->_lock);
  BOOL v8 = objc_opt_class();
  id v9 = [(EKPersistentObject *)self eventStore];
  [v8 _takeDefaultValuesForObjects:v10 inEventStore:v9];
}

- (void)_setDefaultPropertiesLoaded:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v3) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFF7 | v6;

  pthread_mutex_unlock(p_lock);
}

+ (void)_takeDefaultValuesForObjects:(id)a3 inEventStore:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__EKPersistentObject__takeDefaultValuesForObjects_inEventStore___block_invoke;
  v7[3] = &unk_1E5B98830;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

- (CADGenerationStampedObjectID)CADObjectID
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v4 = [(EKPersistentObject *)self _CADObjectID];
  pthread_mutex_unlock(p_lock);

  return (CADGenerationStampedObjectID *)v4;
}

void __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v15 = +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(void *)(*((void *)&v16 + 1) + 8 * v13), (void)v16);
          [v14 addObject:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (EKPersistentObject)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)EKPersistentObject;
  v2 = [(EKPersistentObject *)&v6 init];
  if (v2)
  {
    v7.__sig = 0;
    *(void *)v7.__opaque = 0;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2);
    pthread_mutex_init(&v2->_lock, &v7);
    uint64_t v3 = +[EKObjectID temporaryObjectIDWithEntityType:[(EKPersistentObject *)v2 entityType]];
    objectID = v2->_objectID;
    v2->_objectID = (EKObjectID *)v3;

    v2->_databaseRestoreGeneration = -1;
  }
  return v2;
}

- (void)_setObjectID:(id)a3 inDatabaseRestoreGeneration:(int)a4
{
  uint64_t v11 = (EKObjectID *)a3;
  pthread_mutex_lock(&self->_lock);
  objectID = self->_objectID;
  if (objectID && ![(EKObjectID *)objectID isTemporary])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"EKPersistentObject.m" lineNumber:330 description:@"Trying to set the object ID on an object that has one!"];
  }
  if (self->_objectID != v11)
  {
    uint64_t v8 = (EKObjectID *)[(EKObjectID *)v11 copy];
    id v9 = self->_objectID;
    self->_objectID = v8;
  }
  self->_databaseRestoreGeneration = a4;
  pthread_mutex_unlock(&self->_lock);
}

- (void)_setEventStore:(id)a3
{
  id obj = a3;
  if (obj)
  {
    pthread_mutex_lock(&self->_lock);
    objc_storeWeak((id *)&self->_eventStore, obj);
    pthread_mutex_unlock(&self->_lock);
  }
  else
  {
    objc_storeWeak((id *)&self->_eventStore, 0);
  }
}

void __46__EKPersistentObject__loadPropertiesIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    pthread_mutexattr_t v7 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    NSLog(&cfstr_ErrorLoadingPr.isa, v6, v7);
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v5;
    pthread_mutexattr_t v7 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)EKPersistentObject;
  [(EKPersistentObject *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_loadedProperties, 0);
  objc_storeStrong((id *)&self->_coCommitObjects, 0);
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_destroyWeak((id *)&self->_eventStore);
}

void __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __45__EKPersistentObject__loadStringValueForKey___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __45__EKPersistentObject__loadStringValueForKey___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)primitiveDataValueForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v6 = [(EKPersistentObject *)self _CADObjectID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__EKPersistentObject_primitiveDataValueForKey___block_invoke;
  v12[3] = &unk_1E5B986F0;
  id v13 = v6;
  BOOL v14 = self;
  id v15 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = [(EKPersistentObject *)self _primitiveValueForKey:v7 loader:v12];
  id v10 = (void *)[v9 copy];

  pthread_mutex_unlock(p_lock);

  return v10;
}

+ (id)defaultPropertiesToLoad
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

+ (id)relations
{
  return 0;
}

+ (Class)alternateUniverseClass
{
  id v4 = +[EKReminderStore log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[EKPersistentObject alternateUniverseClass];
  }

  [a1 doesNotRecognizeSelector:a2];
  id v5 = objc_opt_class();

  return (Class)v5;
}

- (BOOL)canBeConvertedToFullObject
{
  return 0;
}

- (BOOL)isPartialObject
{
  return 0;
}

- (id)preFrozenRelationshipObjects
{
  return 0;
}

+ (id)propertiesUnavailableForPartialObjects
{
  return 0;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return @"uniqueIdentifier";
}

- (NSString)uniqueIdentifier
{
  objc_super v3 = [(id)objc_opt_class() propertyKeyForUniqueIdentifier];
  if ([v3 isEqualToString:@"uniqueIdentifier"])
  {
    id v4 = [(EKPersistentObject *)self objectID];
    id v5 = [v4 stringRepresentation];
  }
  else
  {
    id v5 = [(EKPersistentObject *)self valueForKey:v3];
  }

  return (NSString *)v5;
}

- (id)changeSet
{
  return 0;
}

- (id)existingMeltedObject
{
  return 0;
}

- (Class)frozenClass
{
  v2 = objc_opt_class();

  return (Class)[v2 frozenClass];
}

- (BOOL)isCompletelyEqual:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4
{
  return 0;
}

+ (id)_createNonPartialObjectFromObject:(id)a3 ifPropertyIsUnavailable:(id)a4
{
  return 0;
}

- (int)databaseRestoreGeneration
{
  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  pthread_mutex_unlock(p_lock);
  return (int)v2;
}

- (BOOL)existsInStore
{
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v4 = [(EKPersistentObject *)self _CADObjectID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  pthread_mutex_unlock(p_lock);
  if (WeakRetained && v4 && ([v4 isTemporary] & 1) == 0)
  {
    id v6 = [WeakRetained connection];
    id v7 = [v6 CADOperationProxySync];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__EKPersistentObject_existsInStore__block_invoke;
    v10[3] = &unk_1E5B98678;
    id v11 = v4;
    uint64_t v12 = &v13;
    [v7 CADObjectExists:v11 reply:v10];
  }
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __35__EKPersistentObject_existsInStore__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    NSLog(&cfstr_ErrorCheckingW_0.isa, v3, v4);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (BOOL)isDirty
{
  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableDictionary *)v2->_updatedProperties count] != 0;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)changed
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objectID = self->_objectID;
  if (objectID
    && ![(EKObjectID *)objectID isTemporary]
    && ![(EKPersistentObject *)self _isPendingUpdate]
    && ![(EKPersistentObject *)self _isPendingInsert]
    && ![(EKPersistentObject *)self _isPendingDelete])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    [WeakRetained _trackModifiedObject:self];
  }

  pthread_mutex_unlock(p_lock);
}

- (id)_loadedPropertyKeys
{
  return (id)[(NSMutableDictionary *)self->_loadedProperties allKeys];
}

- (BOOL)refresh
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v4 = [(EKPersistentObject *)self _loadedPropertyKeys];
  id v5 = [(id)objc_opt_class() propertyKeyForUniqueIdentifier];
  id v6 = [(NSMutableDictionary *)self->_loadedProperties objectForKeyedSubscript:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = -[NSMutableDictionary objectForKey:](self->_updatedProperties, "objectForKey:", v12, (void)v15);

        if (!v13) {
          [(EKPersistentObject *)self unloadPropertyForKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if (v6) {
    [(NSMutableDictionary *)self->_loadedProperties setObject:v6 forKeyedSubscript:v5];
  }
  pthread_mutex_unlock(p_lock);

  return 1;
}

- (BOOL)isPropertyDirty:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_updatedProperties objectForKey:v5];

  pthread_mutex_unlock(p_lock);
  return v6 != 0;
}

- (id)dirtyPropertiesAndValues
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v4 = (id)[(NSMutableDictionary *)self->_updatedProperties count];
  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v21 = p_lock;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(NSMutableDictionary *)self->_updatedProperties allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      id v11 = [(EKPersistentObject *)self _propertyForKey:v10];
      if (v11)
      {
        uint64_t v12 = [(id)objc_opt_class() _relationForKey:v10];
        uint64_t v13 = v12;
        if (v12)
        {
          if ([v12 toMany])
          {
LABEL_13:

            goto LABEL_14;
          }
          BOOL v14 = [MEMORY[0x1E4F1CA98] null];

          if (v11 != v14)
          {
            long long v15 = [v11 CADObjectID];
            [v4 setObject:v15 forKey:v10];

            goto LABEL_13;
          }
        }
        [v4 setObject:v11 forKey:v10];
        goto LABEL_13;
      }
LABEL_14:
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v7);
LABEL_16:

  if (![v4 count])
  {
    p_lock = v21;
    goto LABEL_21;
  }
  uint64_t v16 = [(EKPersistentObject *)self objectID];
  p_lock = v21;
  if (!v16)
  {
LABEL_21:
    pthread_mutex_unlock(p_lock);
    goto LABEL_22;
  }
  long long v17 = (void *)v16;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  pthread_mutex_unlock(v21);
  if (WeakRetained)
  {
    id v4 = v4;
    long long v19 = v4;
    goto LABEL_23;
  }
LABEL_22:
  long long v19 = 0;
LABEL_23:

  return v19;
}

+ (id)propertiesToUnloadOnCommit
{
  if (propertiesToUnloadOnCommit_onceToken_1 != -1) {
    dispatch_once(&propertiesToUnloadOnCommit_onceToken_1, &__block_literal_global_54);
  }
  v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_1;

  return v2;
}

void __48__EKPersistentObject_propertiesToUnloadOnCommit__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57168];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_1;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_1 = v0;
}

- (void)didCommit
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  coCommitObjects = self->_coCommitObjects;
  self->_coCommitObjects = 0;

  [(NSMutableDictionary *)self->_loadedProperties addEntriesFromDictionary:self->_updatedProperties];
  updatedProperties = self->_updatedProperties;
  self->_updatedProperties = 0;

  pthread_mutex_unlock(p_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "propertiesToUnloadOnCommit", 0);
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
        [(EKPersistentObject *)self unloadPropertyForKey:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)reset
{
}

- (void)reset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  if ([v4 containsObject:self->_objectID])
  {
    pthread_mutex_unlock(&self->_lock);
  }
  else
  {
    [(EKPersistentObject *)self _releaseLoadedProperties];
    updatedProperties = self->_updatedProperties;
    uint64_t v6 = [(id)objc_opt_class() propertyKeyForUniqueIdentifier];
    uint64_t v7 = [(NSMutableDictionary *)updatedProperties objectForKeyedSubscript:v6];

    if (v7)
    {
      uint64_t v8 = [(EKPersistentObject *)self uniqueIdentifier];
      [(NSMutableDictionary *)self->_updatedProperties removeAllObjects];
      if (v8)
      {
        uint64_t v9 = [(id)objc_opt_class() propertyKeyForUniqueIdentifier];
        [(EKPersistentObject *)self setValue:v8 forKey:v9];
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_updatedProperties removeAllObjects];
    }
    [(EKPersistentObject *)self _setDefaultPropertiesLoaded:0];
    uint64_t v10 = self->_coCommitObjects;
    uint64_t v11 = [(NSHashTable *)v10 count];
    if (v11)
    {
      if (!v4)
      {
        id v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:v11 + 1];
      }
      [v4 addObject:self->_objectID];
      coCommitObjects = self->_coCommitObjects;
      self->_coCommitObjects = 0;
    }
    [(EKPersistentObject *)self _setPendingUpdate:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    pthread_mutex_unlock(&self->_lock);
    [WeakRetained _objectDidReset:self];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v14 = v10;
    uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "reset:", v4, (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (void)rollback
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(NSHashTable *)self->_coCommitObjects removeAllObjects];
  [(NSMutableDictionary *)self->_updatedProperties removeAllObjects];
  [(EKPersistentObject *)self _setPendingUpdate:0];

  pthread_mutex_unlock(p_lock);
}

- (void)_setPendingInsert:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  self->_flags = self->_flags & 0xFFFFFFFE | v3;

  pthread_mutex_unlock(p_lock);
}

- (BOOL)_isPendingInsert
{
  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = v2->_flags & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)_setPendingUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v3) {
    int v6 = 2;
  }
  else {
    int v6 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFFD | v6;

  pthread_mutex_unlock(p_lock);
}

- (BOOL)_isPendingUpdate
{
  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = (v2->_flags >> 1) & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)_setPendingDelete:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v3) {
    int v6 = 4;
  }
  else {
    int v6 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFFB | v6;

  pthread_mutex_unlock(p_lock);
}

- (BOOL)allowsDeletion
{
  return 1;
}

- (BOOL)_isPendingDelete
{
  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = (v2->_flags >> 2) & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

+ (BOOL)_shouldRetainPropertyForKey:(id)a3
{
  BOOL v3 = [a1 _relationForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 ownsRelatedObject];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)coCommitObjects
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_coCommitObjects allObjects];
  pthread_mutex_unlock(p_lock);

  return v4;
}

- (void)addCoCommitObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(EKPersistentObject *)self internalAddCoCommitObject:v4];
    [v4 internalAddCoCommitObject:self];
  }
}

- (void)internalAddCoCommitObject:(id)a3
{
  id v7 = a3;
  pthread_mutex_lock(&self->_lock);
  coCommitObjects = self->_coCommitObjects;
  if (!coCommitObjects)
  {
    char v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
    int v6 = self->_coCommitObjects;
    self->_coCommitObjects = v5;

    coCommitObjects = self->_coCommitObjects;
  }
  [(NSHashTable *)coCommitObjects addObject:v7];
  pthread_mutex_unlock(&self->_lock);
}

- (void)removeCoCommitObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(EKPersistentObject *)self internalRemoveCoCommitObject:v4];
    [v4 internalRemoveCoCommitObject:self];
  }
}

- (void)internalRemoveCoCommitObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  [(NSHashTable *)self->_coCommitObjects removeObject:v5];

  pthread_mutex_unlock(p_lock);
}

- (id)loadedPropertyForKey:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  [(EKPersistentObject *)self _loadDefaultPropertiesIfNeeded];
  id v5 = [(EKPersistentObject *)self _loadedPropertyForKey:v4];
  if (!v5)
  {
    int v6 = [(EKPersistentObject *)self _CADObjectID];
    id v7 = v6;
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__16;
    long long v25 = __Block_byref_object_dispose__16;
    id v26 = 0;
    if (v6)
    {
      if (([v6 isTemporary] & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
        BOOL v9 = WeakRetained == 0;

        if (!v9)
        {
          uint64_t v10 = (void *)MEMORY[0x1A62664B0]();
          id v11 = objc_loadWeakRetained((id *)&self->_eventStore);
          long long v12 = [v11 connection];
          long long v13 = [v12 CADOperationProxySync];
          v29[0] = v4;
          long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __43__EKPersistentObject_loadedPropertyForKey___block_invoke;
          v18[3] = &unk_1E5B986A0;
          id v19 = v7;
          long long v20 = &v21;
          [v13 CADObject:v19 getPropertiesWithNames:v14 reply:v18];
        }
      }
    }
    if (v22[5])
    {
      uint64_t v28 = v22[5];
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      id v27 = v4;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      [(EKPersistentObject *)self _takeValues:v15 forKeys:v16 relatedObjectValues:0];

      id v5 = [(EKPersistentObject *)self _loadedPropertyForKey:v4];
    }
    else
    {
      id v5 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  pthread_mutex_unlock(&self->_lock);

  return v5;
}

uint64_t __43__EKPersistentObject_loadedPropertyForKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithCADResult:a2];
    NSLog(&cfstr_ErrorLoadingDe.isa, v4, v9);
    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v5 = [a3 firstObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v7 + 40);
    *(void *)(v7 + 40) = v5;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)_createUpdatedPropertiesIfNeeded
{
  if (!self->_updatedProperties)
  {
    BOOL v3 = (NSMutableDictionary *)objc_opt_new();
    updatedProperties = self->_updatedProperties;
    self->_updatedProperties = v3;
    MEMORY[0x1F41817F8](v3, updatedProperties);
  }
}

- (id)updatedPropertiesWithOnlyPersistentObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_updatedProperties;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableDictionary objectForKey:](self->_updatedProperties, "objectForKey:", v9, (void)v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 value];

          uint64_t v10 = (void *)v11;
        }
        if (v10) {
          [v3 setValue:v10 forKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_releaseLoadedProperties
{
  id v5 = [(id)objc_opt_class() propertyKeyForUniqueIdentifier];
  BOOL v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_loadedProperties, "objectForKeyedSubscript:");
  loadedProperties = self->_loadedProperties;
  if (v3)
  {
    [(NSMutableDictionary *)loadedProperties removeAllObjects];
    [(NSMutableDictionary *)self->_loadedProperties setObject:v3 forKeyedSubscript:v5];
  }
  else
  {
    self->_loadedProperties = 0;
  }
}

- (void)unloadPropertyForKey:(id)a3
{
  id v7 = a3;
  pthread_mutex_lock(&self->_lock);
  [(NSMutableDictionary *)self->_updatedProperties removeObjectForKey:v7];
  uint64_t v4 = [(EKPersistentObject *)self _loadedPropertyForKey:v7];
  if (v4)
  {
    [(NSMutableDictionary *)self->_loadedProperties removeObjectForKey:v7];
    id v5 = [(id)objc_opt_class() defaultPropertiesToLoad];
    int v6 = [v5 containsObject:v7];

    if (v6) {
      [(EKPersistentObject *)self _setDefaultPropertiesLoaded:0];
    }
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)_addObjectCore:(id)a3 toValues:(id)a4 relation:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 eventStore];
  if (!v11)
  {
LABEL_4:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    [WeakRetained _insertObject:v8];

    [(EKPersistentObject *)self addCoCommitObject:v8];
    goto LABEL_6;
  }
  long long v12 = (void *)v11;
  if ([v8 isNew])
  {
    char v13 = [v8 _isPendingInsert];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }

LABEL_6:
  [v9 addObject:v8];
  long long v15 = [v10 inversePropertyNames];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([v10 shouldSetInverseProperty:v20 onObject:v8 forObject:self]) {
          [v8 _setProperty:self forKey:v20 isUpdatedProperty:1];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)_removeObjectCore:(id)a3 fromValues:(id)a4 relation:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 inversePropertyNames];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 shouldSetInverseProperty:v16 onObject:v8 forObject:self]) {
          [v8 _setProperty:0 forKey:v16 isUpdatedProperty:1];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
  [v9 removeObject:v8];
  if ([v8 isNew]) {
    [(EKPersistentObject *)self removeCoCommitObject:v8];
  }
  else {
    [(EKPersistentObject *)self addCoCommitObject:v8];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  [WeakRetained _deleteObject:v8];
}

- (void)primitiveAddRelatedObject:(id)a3 forKey:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  pthread_mutex_lock(&self->_lock);
  id v8 = [(id)objc_opt_class() _relationForKey:v7];
  id v9 = v8;
  if (v8 && ([v8 toMany] & 1) != 0)
  {
    id v10 = [v15 eventStore];

    if (!v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
      [WeakRetained _insertObject:v15];

      [(EKPersistentObject *)self addCoCommitObject:v15];
    }
    uint64_t v12 = [(EKPersistentObject *)self primitiveRelationValueForKey:v7];
    if (!v12)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      [(EKPersistentObject *)self _setProperty:v12 forKey:v7 isUpdatedProperty:1];
    }
    [(EKPersistentObject *)self _addObjectCore:v15 toValues:v12 relation:v9];
    pthread_mutex_unlock(&self->_lock);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"EKPersistentObject.m", 1020, @"Trying to add an object as a related object for property %@ on %@, but it's not a relation or not to-many", v7, v14 object file lineNumber description];
  }
}

- (void)primitiveRemoveRelatedObject:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  pthread_mutex_lock(&self->_lock);
  id v8 = [(id)objc_opt_class() _relationForKey:v7];
  id v9 = v8;
  if (!v8 || ([v8 toMany] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"EKPersistentObject.m", 1053, @"Trying to remove an object as a related object for property %@ on %@, but it's not a relation or not to-many", v7, v12 object file lineNumber description];
  }
  uint64_t v13 = [(EKPersistentObject *)self _propertyForKey:v7];
  if (v13) {
    [(EKPersistentObject *)self _removeObjectCore:v14 fromValues:v13 relation:v9];
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)primitiveSetRelationValue:(id)a3 forKey:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  p_locuint64_t k = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v10 = [(id)objc_opt_class() _relationForKey:v8];
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"EKPersistentObject.m", 1069, @"Requested set of relation called %@ on a %@, but that doesn't exist.", v8, v13 object file lineNumber description];
  }
  if ([v10 toMany])
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v57 = [MEMORY[0x1E4F28B00] currentHandler];
        [v57 handleFailureInMethod:a2 object:self file:@"EKPersistentObject.m" lineNumber:1075 description:@"Setting a to-many relation requires an NSSet"];
      }
    }
    uint64_t v14 = [(EKPersistentObject *)self primitiveRelationValueForKey:v8];
    id v15 = v7;
    v61 = (void *)v14;
    if (!v14)
    {
      v61 = [MEMORY[0x1E4F1CA80] set];
    }
    v62 = v15;
    if ([v15 count])
    {
      uint64_t v16 = (void *)[v15 mutableCopy];
      uint64_t v17 = v61;
      if ([v61 count]) {
        [v16 minusSet:v61];
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = v61;
    }
    if ([v17 count])
    {
      long long v31 = (void *)[v17 mutableCopy];
      id v32 = &self->_lock;
      if ([v15 count]) {
        [v31 minusSet:v15];
      }
    }
    else
    {
      id v32 = &self->_lock;
      long long v31 = 0;
    }
    long long v33 = [MEMORY[0x1E4F1CA80] setWithSet:v61];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v16;
    uint64_t v34 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v78 != v36) {
            objc_enumerationMutation(obj);
          }
          [(EKPersistentObject *)self _addObjectCore:*(void *)(*((void *)&v77 + 1) + 8 * i) toValues:v33 relation:v10];
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
      }
      while (v35);
    }

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v38 = v31;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v74 != v41) {
            objc_enumerationMutation(v38);
          }
          [(EKPersistentObject *)self _removeObjectCore:*(void *)(*((void *)&v73 + 1) + 8 * j) fromValues:v33 relation:v10];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v40);
    }

    [(EKPersistentObject *)self _setProperty:v33 forKey:v8 isUpdatedProperty:1];
    p_locuint64_t k = v32;
    goto LABEL_54;
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v58 = [MEMORY[0x1E4F28B00] currentHandler];
      [v58 handleFailureInMethod:a2 object:self file:@"EKPersistentObject.m" lineNumber:1117 description:@"Setting a relation requires an EKPersistentObject"];
    }
  }
  id v18 = v7;
  uint64_t v19 = [(EKPersistentObject *)self primitiveRelationValueForKey:v8];
  v61 = v18;
  v62 = (void *)v19;
  if ((id)v19 != v18)
  {
    uint64_t v20 = v19;
    id obj = [v10 inversePropertyNames];
    id v59 = v8;
    id v60 = v7;
    if (v20)
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t v21 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      long long v22 = v62;
      if (v21)
      {
        uint64_t v23 = v21;
        uint64_t v24 = *(void *)v70;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v70 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v69 + 1) + 8 * k);
            if ([v10 shouldSetInverseProperty:v26 onObject:v22 forObject:self])
            {
              id v27 = [(id)objc_opt_class() _relationForKey:v26];
              if ([v27 toMany])
              {
                uint64_t v28 = [v22 _propertyForKey:v26];
                if (v28)
                {
                  uint64_t v29 = [MEMORY[0x1E4F1CA80] setWithSet:v28];
                  [v29 removeObject:self];
                  id v30 = [MEMORY[0x1E4F1CA80] setWithSet:v29];
                  [v62 _setProperty:v30 forKey:v26 isUpdatedProperty:1];

                  long long v22 = v62;
                }
              }
              else
              {
                [v22 _setProperty:0 forKey:v26 isUpdatedProperty:1];
              }
            }
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
        }
        while (v23);
      }
      id v8 = v59;
      id v7 = v60;
      p_locuint64_t k = &self->_lock;
      if ([v10 ownsRelatedObject])
      {
        if ([v62 _isPendingInsert]) {
          [(EKPersistentObject *)self removeCoCommitObject:v62];
        }
        else {
          [(EKPersistentObject *)self addCoCommitObject:v62];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
        [WeakRetained _deleteObject:v62];
      }
    }
    if ([v10 ownsRelatedObject]
      && [v61 isNew]
      && ([v61 _isPendingInsert] & 1) == 0)
    {
      id v44 = objc_loadWeakRetained((id *)&self->_eventStore);
      [v44 _insertObject:v61];
    }
    [(EKPersistentObject *)self _setProperty:v61 forKey:v8 isUpdatedProperty:1];
    if (!v7) {
      goto LABEL_55;
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v38 = obj;
    uint64_t v45 = [v38 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      id v47 = *(id *)v66;
      unint64_t v48 = 0x1E4F1C000uLL;
      v49 = v61;
      id obja = *(id *)v66;
      do
      {
        for (uint64_t m = 0; m != v46; ++m)
        {
          if (*(id *)v66 != v47) {
            objc_enumerationMutation(v38);
          }
          uint64_t v51 = *(void *)(*((void *)&v65 + 1) + 8 * m);
          if ([v10 shouldSetInverseProperty:v51 onObject:v49 forObject:self])
          {
            v52 = [(id)objc_opt_class() _relationForKey:v51];
            if ([v52 toMany])
            {
              v53 = [v49 _propertyForKey:v51];
              v54 = *(void **)(v48 + 2688);
              if (v53)
              {
                v55 = [v54 setWithSet:v53];
                [v55 addObject:self];
                v56 = [*(id *)(v48 + 2688) setWithSet:v55];

                v49 = v61;
              }
              else
              {
                v56 = [v54 setWithObject:self];
              }
              [v49 _setProperty:v56 forKey:v51 isUpdatedProperty:1];

              id v47 = obja;
              unint64_t v48 = 0x1E4F1C000;
            }
            else
            {
              [v49 _setProperty:self forKey:v51 isUpdatedProperty:1];
            }
          }
        }
        uint64_t v46 = [v38 countByEnumeratingWithState:&v65 objects:v81 count:16];
      }
      while (v46);
      id obj = v38;
      id v8 = v59;
      id v7 = v60;
      p_locuint64_t k = &self->_lock;
    }
    else
    {
      id obj = v38;
      id v8 = v59;
      id v7 = v60;
    }
LABEL_54:

LABEL_55:
  }

  pthread_mutex_unlock(p_lock);
}

- (void)_primitiveSetValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)v9;
  id v8 = v6;
  if (!v9)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  id v10 = (id)v7;
  [(EKPersistentObject *)self _setProperty:v7 forKey:v8 isUpdatedProperty:1];
}

- (void)primitiveSetNumberValue:(id)a3 forKey:(id)a4
{
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetIntValue:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  pthread_mutex_lock(p_lock);
  id v8 = [NSNumber numberWithInt:v4];
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

- (double)primitiveDoubleValueForKey:(id)a3
{
  BOOL v3 = [(EKPersistentObject *)self primitiveNumberValueForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)primitiveSetDoubleValue:(double)a3 forKey:(id)a4
{
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  pthread_mutex_lock(p_lock);
  id v8 = [NSNumber numberWithDouble:a3];
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetBoolValue:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  pthread_mutex_lock(p_lock);
  id v8 = [NSNumber numberWithBool:v4];
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetDateValue:(id)a3 forKey:(id)a4
{
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetStringValue:(id)a3 forKey:(id)a4
{
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

void __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)primitiveSetDataValue:(id)a3 forKey:(id)a4
{
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

- (id)primitiveSecurityScopedURLWrapperValueForKey:(id)a3
{
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v6 = [(EKPersistentObject *)self _CADObjectID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke;
  v11[3] = &unk_1E5B986F0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = [(EKPersistentObject *)self _primitiveValueForKey:v7 loader:v11];
  pthread_mutex_unlock(p_lock);

  return v9;
}

id __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__16;
  uint64_t v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (([v4 isTemporary] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
        id v7 = [v6 connection];
        id v8 = [v7 CADOperationProxySync];
        uint64_t v9 = *(void *)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke_2;
        v12[3] = &unk_1E5B987B8;
        id v13 = *(id *)(a1 + 48);
        id v14 = &v15;
        [v8 CADObject:v9 getSecurityScopedURLWrapperPropertyWithName:v3 reply:v12];
      }
    }
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)primitiveSetSecurityScopedURLWrapperValue:(id)a3 forKey:(id)a4
{
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(EKPersistentObject *)self _primitiveSetValue:v8 forKey:v7];

  pthread_mutex_unlock(p_lock);
}

- (BOOL)_loadRelationForKey:(id)a3 value:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__16;
  uint64_t v26 = __Block_byref_object_dispose__16;
  id v27 = 0;
  id v7 = [(EKPersistentObject *)self _CADObjectID];
  id v8 = v7;
  if (v7)
  {
    if (([v7 isTemporary] & 1) == 0)
    {
      p_eventStore = &self->_eventStore;
      id WeakRetained = objc_loadWeakRetained((id *)p_eventStore);

      if (WeakRetained)
      {
        id v11 = objc_loadWeakRetained((id *)p_eventStore);
        id v12 = [v11 connection];
        id v13 = [v12 CADOperationProxySync];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __48__EKPersistentObject__loadRelationForKey_value___block_invoke;
        v18[3] = &unk_1E5B987E0;
        id v19 = v6;
        id v20 = &v22;
        uint64_t v21 = &v28;
        [v13 CADObject:v8 getRelatedObjectWithRelationName:v19 reply:v18];
      }
    }
  }
  id v14 = v29;
  if (*((unsigned char *)v29 + 24) && v23[5])
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v29;
  }
  else
  {
    id v15 = 0;
  }
  *a4 = v15;
  char v16 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __48__EKPersistentObject__loadRelationForKey_value___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __48__EKPersistentObject__loadRelationForKey_value___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)takeValues:(id)a3 forKeys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)objc_opt_new();
  pthread_mutex_lock(&self->_lock);
  [(EKPersistentObject *)self _takeValues:v7 forKeys:v6 relatedObjectValues:v10];

  pthread_mutex_unlock(&self->_lock);
  id v8 = objc_opt_class();
  uint64_t v9 = [(EKPersistentObject *)self eventStore];
  [v8 _takeDefaultValuesForObjects:v10 inEventStore:v9];
}

- (void)loadPropertiesIfNeeded:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  [(EKPersistentObject *)self _loadPropertiesIfNeeded:v5];

  pthread_mutex_unlock(p_lock);
}

+ (id)allObjectsWithChangesRelatedToObjects:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  id v20 = v3;
  id v5 = [v3 allObjects];
  id v6 = (void *)[v5 mutableCopy];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke;
  v29[3] = &unk_1E5B98880;
  id v7 = v4;
  id v30 = v7;
  id v8 = v6;
  id v31 = v8;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x1A6266730](v29);
  while ([v8 count])
  {
    id v10 = [v8 lastObject];
    [v8 removeLastObject];
    [v7 addObject:v10];
    if (([v10 isDirty] & 1) != 0
      || ([v10 _isPendingInsert] & 1) != 0
      || ([v10 _isPendingDelete] & 1) != 0
      || [v10 _isPendingUpdate])
    {
      [v21 addObject:v10];
    }
    id v11 = [v10 coCommitObjects];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v9[2](v9, *(void *)(*((void *)&v25 + 1) + 8 * i));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v13);
    }
    char v16 = [(id)objc_opt_class() relations];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke_2;
    v22[3] = &unk_1E5B988A8;
    id v23 = v10;
    uint64_t v24 = v9;
    id v17 = v10;
    [v16 enumerateKeysAndObjectsUsingBlock:v22];
  }
  id v18 = (void *)[v21 copy];

  return v18;
}

void __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  id v7 = [*(id *)(a1 + 32) _propertyForKey:v5];
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ([v6 toMany])
      {
        id v8 = v7;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v10);
        }
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
  }
}

- (id)ownedObjects
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__EKPersistentObject_ownedObjects__block_invoke;
  v16[3] = &unk_1E5B98880;
  id v5 = v4;
  id v17 = v5;
  id v6 = v3;
  id v18 = v6;
  id v7 = (void *)MEMORY[0x1A6266730](v16);
  while ([v5 count])
  {
    id v8 = [v5 lastObject];
    [v5 removeLastObject];
    uint64_t v9 = [(id)objc_opt_class() relations];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__EKPersistentObject_ownedObjects__block_invoke_2;
    v13[3] = &unk_1E5B988A8;
    id v14 = v8;
    id v15 = v7;
    id v10 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
  }
  uint64_t v11 = (void *)[v6 copy];

  return v11;
}

void __34__EKPersistentObject_ownedObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  [*(id *)(a1 + 40) addObject:v4];
}

void __34__EKPersistentObject_ownedObjects__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 ownsRelatedObject])
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
    id v7 = [*(id *)(a1 + 32) _propertyForKey:v5];
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ([v6 toMany])
        {
          id v8 = v7;
          long long v13 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v14;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v14 != v11) {
                  objc_enumerationMutation(v8);
                }
                (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
            }
            while (v10);
          }
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
    }
  }
}

- (id)dump
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
  [v3 appendString:@"{\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(EKPersistentObject *)self _loadedPropertyKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(EKPersistentObject *)self _propertyForKey:v9];
        uint64_t v11 = [(id)objc_opt_class() _relationForKey:v9];
        uint64_t v12 = (void *)v11;
        if (v11) {
          [v3 appendFormat:@"    %@ = %@\n", v9, v11];
        }
        else {
          [v3 appendFormat:@"    %@ = %@\n", v9, v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"}"];
  objc_msgSend(NSString, "stringWithFormat:", @"%@ <%p> {loaded = %@; updated = %@}",
    objc_opt_class(),
    self,
    v3,
  long long v13 = self->_updatedProperties);

  return v13;
}

- (id)rebasedFrom
{
  return [(EKPersistentObject *)self _propertyForKey:*MEMORY[0x1E4F57168]];
}

- (void)setRebasedFrom:(id)a3
{
}

+ (Class)meltedClass
{
  return 0;
}

- (int)entityType
{
  return -1;
}

+ (void)alternateUniverseClass
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromClass(a1);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "+alternateUniverseClass called on a class that does not implement it (%{public}@)", (uint8_t *)&v4, 0xCu);
}

void __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error loading number %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error loading date %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __45__EKPersistentObject__loadStringValueForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error loading string %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error loading data %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __48__EKPersistentObject__loadRelationForKey_value___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error loading to-one relation %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(), "errorWithCADResult:");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4E47000, v4, v5, "Error loading to-many relation %@ from daemon: %@", v6, v7, v8, v9, v10);
}

void __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Failed to take value for related object with key %@", (uint8_t *)&v2, 0xCu);
}

@end