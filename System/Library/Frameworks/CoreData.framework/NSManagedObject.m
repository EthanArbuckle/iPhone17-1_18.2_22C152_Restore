@interface NSManagedObject
+ ($EAB3BE0B71F214810D362421349279B4)_PFMOClassFactoryData;
+ (BOOL)_classShouldAlwaysRegisterSelectorNamed:(const char *)a3;
+ (BOOL)_hasOverriddenAwake;
+ (BOOL)_isGeneratedClass;
+ (BOOL)_isGeneratedClass_1;
+ (BOOL)_useFastValidationMethod;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)contextShouldIgnoreUnmodeledPropertyChanges;
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (Class)classForEntity:(id)a3;
+ (NSFetchRequest)fetchRequest;
+ (char)_transientPropertiesChangesMask__;
+ (id)_PFPlaceHolderSingleton;
+ (id)_PFPlaceHolderSingleton_core;
+ (id)_entityName;
+ (id)_retain_1;
+ (id)allocWithEntity:(id)a3;
+ (id)allocWithZone_10_4:(_NSZone *)a3;
+ (id)alloc_10_4;
+ (id)batchAllocateWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4 count:(unsigned int)a5;
+ (unsigned)allocBatch:(id *)a3 withEntity:(id)a4 count:(unsigned int)a5;
+ (void)_entityDeallocated;
+ (void)_initializeAccessorStubs;
+ (void)_initializePrimitiveAccessorStubs;
+ (void)_release_1;
+ (void)initialize;
- (BOOL)_defaultValidation:(id *)a3 error:(id *)a4;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 error:(id *)a5;
- (BOOL)hasChanges;
- (BOOL)hasFaultForRelationshipNamed:(NSString *)key;
- (BOOL)hasPersistentChangedValues;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFault;
- (BOOL)isInserted;
- (BOOL)isUpdated;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)validateForDelete:(NSError *)error;
- (BOOL)validateForInsert:(NSError *)error;
- (BOOL)validateForUpdate:(NSError *)error;
- (BOOL)validateValue:(id *)value forKey:(NSString *)key error:(NSError *)error;
- (NSArray)objectIDsForRelationshipNamed:(NSString *)key;
- (NSDictionary)changedValues;
- (NSDictionary)changedValuesForCurrentEvent;
- (NSDictionary)committedValuesForKeys:(NSArray *)keys;
- (NSKnownKeysDictionary)_changedTransientProperties__;
- (NSKnownKeysDictionary)_newChangedValuesForRefresh__;
- (NSKnownKeysDictionary)_newCommittedSnapshotValues;
- (NSKnownKeysDictionary)_newNestedSaveChangedValuesForParent:(unsigned char *)a1;
- (NSKnownKeysDictionary)_newPropertiesForRetainedTypes:(unsigned int *)a3 andCopiedTypes:(char)a4 preserveFaults:;
- (NSKnownKeysDictionary)_newSnapshotForUndo__;
- (NSManagedObject)init;
- (NSManagedObject)initWithContext:(NSManagedObjectContext *)moc;
- (NSManagedObject)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context;
- (NSManagedObject)retain;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectID)objectID;
- (NSString)description;
- (NSUInteger)faultingState;
- (id)_genericMergeableStringValueForKey:(id)a3 withIndex:(int64_t)a4;
- (id)_genericMutableOrderedSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5;
- (id)_genericMutableSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5;
- (id)_genericValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5;
- (id)_implicitObservationInfo;
- (id)_initWithEntity:(id)a3 withID:(id)a4 withHandler:(id)a5 withContext:(id)a6;
- (id)_orderKeysForRelationshipWithName__:(id)a3;
- (id)bindableObjectPublisher;
- (id)dictionaryWithPropertyValues;
- (id)dictionaryWithValuesForKeys:(id)a3;
- (id)diffOrderedSets:(void *)a3 :(uint64_t *)a4 :(id *)a5 :(id *)a6 :(id *)a7 :(id *)a8 :;
- (id)mergeableStringValueForKey:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)mutableArrayValueForKey:(id)a3;
- (id)mutableOrderedSetValueForKey:(id)a3;
- (id)mutableSetValueForKey:(id)a3;
- (id)primitiveValueForKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;
- (id)valueForUndefinedKey:(id)a3;
- (uint64_t)_commitPhotoshoperyForRelationshipAtIndex:(void *)a3 newValue:;
- (uint64_t)_generateErrorWithCode:(void *)a3 andMessage:(uint64_t)a4 forKey:(uint64_t)a5 andValue:(uint64_t)a6 additionalDetail:;
- (uint64_t)_isValidRelationshipDestination__;
- (uint64_t)_validateForSave:(void *)a1;
- (uint64_t)_validateValue:(void *)a3 forProperty:(uint64_t)a4 andKey:(uint64_t)a5 withIndex:(void *)a6 error:;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (unsigned)_versionReference__;
- (void)_chainNewError:(uint64_t *)a3 toOriginalErrorDoublePointer:;
- (void)_clearRawPropertiesWithHint:(uint64_t)a3;
- (void)_didChangeValue:(id)a3 forRelationship:(id)a4 named:(id)a5 withInverse:(id)a6;
- (void)_genericUpdateFromSnapshot:(_DWORD *)a1;
- (void)_maintainInverseRelationship:(uint64_t *)a1 forProperty:(void *)a2 oldDestination:(uint64_t *)a3 newDestination:(uint64_t *)a4;
- (void)_maintainInverseRelationship:(void *)a3 forProperty:(uint64_t)a4 forChange:(void *)a5 onSet:;
- (void)_nilOutReservedCurrentEventSnapshot__;
- (void)_propagateDelete:(void *)a1;
- (void)_setGenericValue:(id)a3 forKey:(id)a4 withIndex:(int64_t)a5 flags:(int64_t)a6;
- (void)_setLastSnapshot__:(void *)result;
- (void)_setObjectID__:(void *)result;
- (void)_setOriginalSnapshot__:(void *)result;
- (void)_setVersionReference__:(unsigned int)a3;
- (void)_substituteEntityAndProperty:(void *)a3 inString:;
- (void)_updateFromRefreshSnapshot:(int)a3 includingTransients:;
- (void)_updateFromSnapshot:(uint64_t)a1;
- (void)_updateFromUndoSnapshot:(_DWORD *)a1;
- (void)_updateToManyRelationship:(void *)a3 from:(void *)a4 to:(void *)a5 with:;
- (void)_willChange_Swift_Trampoline;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)awakeFromSnapshotEvents:(NSSnapshotEventType)flags;
- (void)dealloc;
- (void)didAccessValueForKey:(NSString *)key;
- (void)didChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5;
- (void)didChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects;
- (void)didChangeValueForKey:(NSString *)key;
- (void)didSave;
- (void)methodForSelector:(SEL)a3;
- (void)observationInfo;
- (void)prepareForDeletion;
- (void)release;
- (void)setBindableObjectPublisher:(id)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setObservationInfo:(void *)inObservationInfo;
- (void)setPrimitiveValue:(id)value forKey:(NSString *)key;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setValue:(id)value forKey:(NSString *)key;
- (void)setValuesForKeysWithDictionary:(id)a3;
- (void)willAccessValueForKey:(NSString *)key;
- (void)willChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5;
- (void)willChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects;
- (void)willChangeValueForKey:(NSString *)key;
- (void)willSave;
@end

@implementation NSManagedObject

- (id)_initWithEntity:(id)a3 withID:(id)a4 withHandler:(id)a5 withContext:(id)a6
{
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NSManagedObject;
  id result = [(NSManagedObject *)&v11 init];
  if (result)
  {
    v10 = result;
    *((void *)result + 4) = a6;
    if (!v7) {
      v7 = _PFFastTemporaryIDCreation(a3);
    }
    v10[5] = v7;
    *((_DWORD *)v10 + 4) |= 0x8400u;
    return (id)[v10 initWithEntity:a3 insertIntoManagedObjectContext:a6];
  }
  return result;
}

- (NSManagedObject)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
  v4 = self;
  if ((self->_cd_stateFlags & 0x400) != 0) {
    return v4;
  }
  if (!entity)
  {
    uint64_t v12 = objc_opt_class();
    if ((v4->_cd_stateFlags & 0x100000) == 0) {

    }
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = [NSString stringWithFormat:@"An NSManagedObject of class '%@' must have a valid NSEntityDescription.", v12];
    v16 = v13;
    uint64_t v17 = v14;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&entity->_entityDescriptionFlags & 4) == 0)
  {
    if ([(NSEntityDescription *)entity managedObjectModel]) {
      v7 = [(NSEntityDescription *)entity managedObjectModel];
    }
    else {
      v7 = (NSManagedObjectModel *)entity;
    }
    [(NSManagedObjectModel *)v7 _setIsEditable:0];
  }
  v8 = (objc_class *)_PFFastEntityClass((unint64_t)entity);
  if (_MergedGlobals_72 == 1)
  {
    Class = object_getClass(v4);
    if ((v4->_cd_stateFlags & 0x100000) != 0)
    {
LABEL_14:
      v4 = (NSManagedObject *)[(objc_class *)v8 allocWithEntity:entity];
      goto LABEL_15;
    }
    v10 = Class;
    if (Class == v8) {
      goto LABEL_15;
    }
    if (Class == class_getSuperclass(v8) || v10 == object_getClass((id)qword_1EB270640))
    {
      _PFDeallocateObject(v4);
      goto LABEL_14;
    }
    uint64_t v18 = objc_opt_class();
    v4->_cd_stateFlags = v4->_cd_stateFlags & 0xFFFC7FFF | 0x8000;

    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = [NSString stringWithFormat:@"NSEntityDescription '%@' can only support a single custom class (tried to instantiate class '%@'). Use a subentity with 0 properties to further specialize the NSManagedObject subclass.", -[NSEntityDescription name](entity, "name"), v18];
    v16 = v19;
    uint64_t v17 = v20;
LABEL_24:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:0]);
  }
  object_setClass(v4, v8);
LABEL_15:
  v21.receiver = v4;
  v21.super_class = (Class)NSManagedObject;
  v4 = [(NSManagedObject *)&v21 init];
  if (v4)
  {
    v4->_cd_objectID = (NSManagedObjectID *)_PFFastTemporaryIDCreation(entity);
    v4->_cd_stateFlags |= 0x8400u;
    if (context) {
      [(NSManagedObjectContext *)context insertObject:v4];
    }
    else {
      _PFFaultHandlerFulfillFault(0, (uint64_t)v4, 0, 0, 1);
    }
  }
  return v4;
}

+ (id)allocWithEntity:(id)a3
{
  unint64_t v5 = _PFFastEntityClass((unint64_t)a3);
  if (v5)
  {
    v6 = (void *)v5;
    if ((*((unsigned char *)a3 + 120) & 4) == 0)
    {
      uint64_t v13 = [a3 managedObjectModel];
      id v14 = a3;
      if (v13) {
        id v14 = (id)[a3 managedObjectModel];
      }
      [v14 _setIsEditable:0];
    }
    uint64_t v7 = [v6 _PFMOClassFactoryData];
    if (v7)
    {
      uint64_t v8 = v7;
      if (!*(void *)(v7 + 24))
      {
        uint64_t v15 = *((void *)a3 + 14);
        if (v15) {
          unint64_t v16 = *(void *)(v15 + 8);
        }
        else {
          unint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
        }
        if (v16 <= 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = v16;
        }
        *(void *)(v8 + 24) = 8 * v17;
      }
      v9 = _PFAllocateObject((Class)v6, 0);
      int InstanceSize = class_getInstanceSize((Class)v6);
      v9[4] = *(_DWORD *)(v8 + 40) | (*(unsigned __int8 *)(v8 + 32) << 24);
      v9[5] = (InstanceSize + 7) & 0xFFFFFFF8;
      __dmb(0xBu);
      return v9;
    }
    uint64_t v12 = (objc_class *)v6;
  }
  else
  {
    uint64_t v12 = (objc_class *)a1;
  }

  return _PFAllocateObject(v12, 0);
}

+ (BOOL)_classShouldAlwaysRegisterSelectorNamed:(const char *)a3
{
  size_t v5 = strlen(a3);
  if (v5 >= 0x21 && !strncmp("automaticallyNotifiesObserversOf", a3, 0x20uLL)) {
    return 1;
  }
  uint64_t v6 = [a1 _PFMOClassFactoryData];
  if (v6)
  {
    if ((*(unsigned char *)(v6 + 96) & 0x40) != 0) {
      return 1;
    }
  }
  BOOL result = 0;
  if (v5 >= 0xA && !BYTE1(dword_1EB270AB8))
  {
    uint64_t v8 = 9;
    BOOL result = (!strncmp("primitive", a3, 9uLL) || v5 >= 0xD && (v8 = 12, !strncmp("setPrimitive", a3, 0xCuLL)))
          && (__darwin_ct_rune_t v9 = a3[v8]) != 0
          && v9 == (char)__toupper(v9);
  }
  return result;
}

+ ($EAB3BE0B71F214810D362421349279B4)_PFMOClassFactoryData
{
  return 0;
}

+ (BOOL)_isGeneratedClass
{
  return 0;
}

- (unint64_t)hash
{
  unsigned int v2 = (2 * ((unint64_t)self >> 4)) & 0xAAAAAAAA | (((unint64_t)self >> 4) >> 1) & 0x55555555;
  unsigned int v3 = (4 * v2) & 0xCCCCCCCC | (v2 >> 2) & 0x33333333;
  unsigned int v4 = (16 * v3) & 0xF0F0F0F0 | (v3 >> 4) & 0xF0F0F0F;
  return (v4 << 8) & 0xFF0000 | (v4 << 24) | (v4 >> 8) & 0xFF00 | HIBYTE(v4);
}

- (BOOL)_isDeallocating
{
  return self->_cd_rc & 1;
}

- (NSManagedObjectContext)managedObjectContext
{
  if (self)
  {
    if ((self->_wasDisposed & 0x80) != 0) {
      return 0;
    }
    else {
      return (NSManagedObjectContext *)self->_parentObjectStore;
    }
  }
  return self;
}

- (id)_genericValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  if (a5 && (self->_cd_stateFlags & 0x40) == 0) {
    return (id)_sharedIMPL_vfk_core((id **)self, (uint64_t)a2, a4);
  }
  _sharedIMPL_pvfk_core((uint64_t)self, (uint64_t)a2, a4, a4, a5, v5, v6, v7);
  return result;
}

- (void)awakeFromFetch
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (NSManagedObject)retain
{
  if (*MEMORY[0x1E4F1CBC0]) {
    NSRecordAllocationEvent();
  }
  return self;
}

- (NSManagedObjectID)objectID
{
  return self->_cd_objectID;
}

- (void)dealloc
{
  self->_cd_rc = 536870913;
  self->_cd_managedObjectContext = 0;
  unsigned int v3 = (self->_cd_stateFlags >> 15) & 7;
  if (v3 == 5 || v3 == 0) {
    -[NSFaultHandler turnObject:intoFaultWithContext:](_insertion_fault_handler, (uint64_t)self, 0);
  }
  if (self->_cd_extras || self->_cd_rawData)
  {
    uint64_t v5 = _PFEntityForManagedObject(self);
    if (v5)
    {
      uint64_t v6 = v5[14];
      if (v6) {
        [(NSManagedObject *)(uint64_t)self _clearRawPropertiesWithHint:*(void *)(v6 + 8)];
      }
    }
  }
  cd_extras = self->_cd_extras;
  if (cd_extras)
  {

    uint64_t v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v8 = malloc_default_zone();
    }
    malloc_zone_free(v8, self->_cd_extras);
    self->_cd_extras = 0;
  }
  cd_queueReference = (atomic_uint *)self->_cd_queueReference;
  if (cd_queueReference && (int)atomic_fetch_add(cd_queueReference + 2, 0xFFFFFFFF) <= 0)
  {
    cd_queueReference[2] += 0x20000000;
    [(atomic_uint *)cd_queueReference dealloc];
  }

  _PFDeallocateObject(self);
}

- (void)_clearRawPropertiesWithHint:(uint64_t)a3
{
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {

      *(void *)(v6 + 8) = 0;
      *(void *)(v6 + 16) = 0;

      *(void *)(v6 + 24) = 0;
      if (!*(void *)v6 && !*(void *)(v6 + 32))
      {
        uint64_t v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
        if (!_PF_Private_Malloc_Zone) {
          uint64_t v7 = malloc_default_zone();
        }
        malloc_zone_free(v7, *(void **)(a1 + 48));
        *(void *)(a1 + 48) = 0;
      }
    }
    uint64_t v8 = *(void **)(a1 + 24);
    if (v8)
    {
      int v9 = a2 + a3;
      if (a2 < a2 + a3)
      {
        uint64_t v10 = *(unsigned int *)(a1 + 20);
        if (v10) {
          uint64_t v11 = a1 + v10;
        }
        else {
          uint64_t v11 = 0;
        }
        unint64_t v12 = ((unint64_t)*(unsigned int *)(a1 + 16) >> 22) & 0x3FC;
        uint64_t v13 = v11 - v12;
        int v14 = v9 - 1;
        int v15 = (int)a2 >> 3;
        int v16 = v14 >> 3;
        unsigned int v17 = 0xFFu >> (8 - (a2 & 7));
        if (v14 >> 3 == (int)a2 >> 3)
        {
          int v18 = (510 << (v14 & 7)) | v17;
        }
        else
        {
          *(unsigned char *)(v13 + v15) &= v17;
          if (v15 + 1 < v16) {
            bzero((void *)(v15 - v12 + v11 + 1), (v16 - v15 - 2) + 1);
          }
          int v18 = 510 << (v14 & 7);
          int v15 = v14 >> 3;
        }
        *(unsigned char *)(v13 + v15) &= v18;
        uint64_t v8 = *(void **)(a1 + 24);
      }

      *(void *)(a1 + 24) = 0;
    }
    *(_DWORD *)(a1 + 12) = 0;
  }
}

- (void)release
{
  unsigned int add = atomic_fetch_add(&self->_cd_rc, 0xFFFFFFFE);
  unsigned int v4 = (unsigned char *)MEMORY[0x1E4F1CBC0];
  if (*MEMORY[0x1E4F1CBC0])
  {
    NSRecordAllocationEvent();
    if (add) {
      return;
    }
  }
  else if (add)
  {
    return;
  }
  if ((self->_cd_stateFlags & 0x100000) != 0)
  {
    atomic_fetch_add(&self->_cd_rc, 0x20000000u);
  }
  else
  {
    id cd_queueReference = self->_cd_queueReference;
    if (cd_queueReference)
    {
      atomic_fetch_add(&self->_cd_rc, 2u);
      if (*v4)
      {
        id v7 = cd_queueReference;
        NSRecordAllocationEvent();
        id cd_queueReference = v7;
      }
      -[_PFManagedObjectReferenceQueue _queueForDealloc:]((uint64_t)cd_queueReference, (atomic_uint *)self);
    }
    else
    {
      int v6 = -2;
      atomic_compare_exchange_strong(&self->_cd_rc, (unsigned int *)&v6, 1u);
      if (v6 == -2)
      {
        [(NSManagedObject *)self dealloc];
      }
    }
  }
}

- (void)_nilOutReservedCurrentEventSnapshot__
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      unsigned int v3 = *(void **)(v2 + 24);
      if (v3)
      {

        *(void *)(*(void *)(a1 + 48) + 24) = 0;
      }
    }
  }
}

- (void)_propagateDelete:(void *)a1
{
  int v94 = a2;
  v102[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__propagateDelete_);
    }
    unsigned int v3 = _PFEntityForManagedObject(a1);
    unsigned int v4 = v3;
    if ((a1[2] & 0x80) != 0) {
      id v95 = 0;
    }
    else {
      id v95 = (id)a1[4];
    }
    if (v3)
    {
      uint64_t v5 = v3[13];
      uint64_t v91 = v3[14];
      uint64_t v6 = v3[12];
      uint64_t v7 = v5 + 40;
    }
    else
    {
      uint64_t v91 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 40;
    }
    uint64_t v8 = *(void *)v7;
    uint64_t v99 = v6 + 24;
    uint64_t v100 = v8;
    uint64_t v97 = _kvcPropertysPrimitiveGetters(v3);
    uint64_t v9 = _kvcPropertysPublicSetters(v4);
    int v10 = *((_DWORD *)a1 + 4);
    v98 = a1;
    *((_DWORD *)a1 + 4) = v10 | 0x800;
    if ((v10 & 0x8000) != 0) {
      -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, v98, *((void *)v98 + 4));
    }
    uint64_t v11 = 0;
    int v88 = v10 & 0x800;
    v102[0] = 0xA00000006;
    int v12 = 1;
    uint64_t v13 = (id **)v98;
    do
    {
      LODWORD(v101) = v12;
      v96 = (void *)MEMORY[0x18C127630]();
      int v14 = (unint64_t *)(v91 + 16 * *((unsigned int *)v102 + v11));
      unint64_t v16 = *v14;
      unint64_t v15 = v14[1];
      char v17 = v94;
      if (*v14 < v15 + *v14)
      {
        do
        {
          int v18 = *(void **)(v99 + 8 * v16);
          uint64_t v19 = *(void *)(v100 + 8 * v16);
          uint64_t v20 = [v18 deleteRule];
          if (!v20) {
            goto LABEL_31;
          }
          uint64_t v25 = v20;
          if (v20 == 3 && (v17 & 2) == 0) {
            goto LABEL_31;
          }
          _PF_Handler_Primitive_GetProperty(v13, v16, v19, *(void *)(v97 + 8 * v16), v21, v22, v23, v24);
          if (!v26) {
            goto LABEL_31;
          }
          v27 = v26;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            __break(1u);
          }
          if ((v17 & 2) == 0 && (unint64_t)(v25 - 1) > 1) {
            goto LABEL_31;
          }
          v28 = (void *)[v18 inverseRelationship];
          id v29 = v27;
          _PF_Handler_Public_SetProperty((unsigned int *)v13, v16, 0, v19, *(void **)(v9 + 8 * v16));
          if (v28)
          {
            if (([v28 isToMany] & 1) == 0)
            {
              v30 = (void *)[v27 entity];
              uint64_t v31 = [v28 entity];
              unint64_t v32 = [v28 _entitysReferenceID];
              if (v30 != (void *)v31) {
                unint64_t v32 = [v30 _offsetRelationshipIndex:v32 fromSuperEntity:v31 andIsToMany:0];
              }
              uint64_t v33 = *(void *)(_kvcPropertysPrimitiveGetters(v30) + 8 * v32);
              uint64_t v34 = [v28 name];
              _PF_Handler_Primitive_GetProperty((id **)v27, v32, v34, v33, v35, v36, v37, v38);
              uint64_t v13 = (id **)v98;
              char v17 = v94;
              if (v39 != v98) {
                goto LABEL_30;
              }
            }
            -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:]((uint64_t *)v13, v28, (uint64_t *)v27, 0);
          }
          if (v25 == 2 && ([v27 isDeleted] & 1) == 0) {
            [v95 deleteObject:v27];
          }
LABEL_30:

LABEL_31:
          ++v16;
          --v15;
        }
        while (v15);
      }
      int v12 = 0;
      uint64_t v11 = 1;
    }
    while ((v101 & 1) != 0);
    uint64_t v40 = 0;
    v102[0] = 0xD00000009;
    int v41 = 1;
    uint64_t v42 = v91;
    while (1)
    {
      int v90 = v41;
      v89 = (void *)MEMORY[0x18C127630]();
      v43 = (unint64_t *)(v42 + 16 * *((unsigned int *)v102 + v40));
      unint64_t v45 = *v43;
      unint64_t v44 = v43[1];
      unint64_t v46 = v44 + v45;
      char v47 = v94;
      if (v45 < v44 + v45) {
        break;
      }
LABEL_69:
      int v41 = 0;
      uint64_t v40 = 1;
      if ((v90 & 1) == 0)
      {
        v98[4] = v98[4] & 0xFFFFF7FF | v88;
        return;
      }
    }
    unint64_t v92 = v44 + v45;
    while (1)
    {
      v48 = *(void **)(v99 + 8 * v45);
      uint64_t v49 = *(void *)(v100 + 8 * v45);
      uint64_t v50 = [v48 deleteRule];
      if (v50)
      {
        uint64_t v55 = v50;
        if (v50 != 3 || (v47 & 2) != 0)
        {
          _PF_Handler_Primitive_GetProperty((id **)v98, v45, v49, *(void *)(v97 + 8 * v45), v51, v52, v53, v54);
          if (v56)
          {
            v57 = v56;
            if ([v56 count])
            {
              if ((v47 & 2) != 0 || (unint64_t)(v55 - 1) <= 1)
              {
                v58 = (void *)[v48 inverseRelationship];
                uint64_t v59 = [v58 isToMany];
                v60 = (void *)[v57 allObjects];
                v61 = (void *)[v60 count];
                v93 = v87;
                MEMORY[0x1F4188790]();
                if ((unint64_t)v61 > 0x200)
                {
                  v65 = NSAllocateScannedUncollectable();
                }
                else
                {
                  v64 = &v87[-v63];
                  bzero(&v87[-v63], 8 * v62);
                  v65 = v64;
                }
                v66 = v98;
                v101 = v65;
                objc_msgSend(v60, "getObjects:range:", v65, 0, v61);
                unint64_t v67 = *(void *)(v42 + 128);
                BOOL v68 = v45 >= v67;
                unint64_t v69 = v45 - v67;
                if (v68 && v69 < *(void *)(v42 + 136)) {
                  v70 = (void *)[v66 mutableOrderedSetValueForKey:v49];
                }
                else {
                  v70 = (void *)[v66 mutableSetValueForKey:v49];
                }
                uint64_t v71 = [v70 removeAllObjects];
                if (v61)
                {
                  uint64_t v72 = 0;
                  v96 = v61;
                  while (1)
                  {
                    v73 = (void *)MEMORY[0x18C127630](v71);
                    v74 = (id **)v101[v72];
                    if (v58)
                    {
                      if ((v59 & 1) == 0)
                      {
                        uint64_t v75 = v59;
                        v76 = (void *)[(id)v101[v72] entity];
                        uint64_t v77 = [v58 entity];
                        unint64_t v78 = [v58 _entitysReferenceID];
                        if (v76 != (void *)v77) {
                          unint64_t v78 = [v76 _offsetRelationshipIndex:v78 fromSuperEntity:v77 andIsToMany:0];
                        }
                        uint64_t v79 = *(void *)(_kvcPropertysPrimitiveGetters(v76) + 8 * v78);
                        uint64_t v80 = [v58 name];
                        _PF_Handler_Primitive_GetProperty(v74, v78, v80, v79, v81, v82, v83, v84);
                        v66 = v98;
                        uint64_t v59 = v75;
                        v61 = v96;
                        if (v85 != v98)
                        {
                          int v86 = 1;
                          goto LABEL_61;
                        }
                      }
                      -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:]((uint64_t *)v66, v58, (uint64_t *)v74, 0);
                    }
                    int v86 = 0;
LABEL_61:
                    if (v55 == 2 && ((v86 | [v74 isDeleted]) & 1) == 0) {
                      [v95 deleteObject:v74];
                    }
                    if (v61 == (void *)++v72)
                    {
                      char v47 = v94;
                      uint64_t v42 = v91;
                      if ((unint64_t)v61 >= 0x201) {
                        NSZoneFree(0, v101);
                      }
                      break;
                    }
                  }
                }
                unint64_t v46 = v92;
              }
            }
          }
        }
      }
      if (++v45 == v46) {
        goto LABEL_69;
      }
    }
  }
}

- (NSDictionary)changedValues
{
  uint64_t v2 = self;
  if (_PF_Threading_Debugging_level) {
    self = (NSManagedObject *)_PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ((v2->_cd_stateFlags & 0x8000) != 0) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  cd_extras = v2->_cd_extras;
  if (!cd_extras || !cd_extras->var1) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  uint64_t v4 = NSDictionary_EmptyDictionary;
  context = (void *)MEMORY[0x18C127630](self, a2);
  uint64_t v5 = _PFEntityForManagedObject(v2);
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = v5[13];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v7];
  uint64_t v10 = _kvcPropertysPrimitiveGetters(v6);
  uint64_t v37 = v4;
  if (v6) {
    uint64_t v41 = v6[14];
  }
  else {
    uint64_t v41 = 0;
  }
  uint64_t v11 = NSKeyValueCoding_NullValue;
  int v12 = v2->_cd_extras;
  if (v12) {
    id var1 = v12->var1;
  }
  else {
    id var1 = 0;
  }
  uint64_t v14 = objc_msgSend(var1, "values", v37);
  v39 = v9;
  uint64_t v43 = [(NSKnownKeysDictionary *)v9 values];
  uint64_t v19 = 0;
  char v20 = 1;
  do
  {
    char v42 = v20;
    uint64_t v21 = (unint64_t *)(v41 + 16 * dword_18AE54174[v19]);
    unint64_t v23 = *v21;
    unint64_t v22 = v21[1];
    if (*v21 < v22 + *v21)
    {
      do
      {
        if (*(void *)(v14 + 8 * v23) == v11) {
          uint64_t v24 = 0;
        }
        else {
          uint64_t v24 = *(void **)(v14 + 8 * v23);
        }
        _PF_Handler_Primitive_GetProperty((id **)v2, v23, 0, *(void *)(v10 + 8 * v23), v15, v16, v17, v18);
        if (v24 != v25)
        {
          v26 = v25;
          if (([*(id *)(v6[12] + 24 + 8 * v23) _epsilonEquals:v25 rhs:v24 withFlags:1] & 1) == 0)
          {
            id v27 = (id)v11;
            if (v26) {
              id v27 = v26;
            }
            *(void *)(v43 + 8 * v23) = v27;
          }
        }
        ++v23;
        --v22;
      }
      while (v22);
    }
    char v20 = 0;
    uint64_t v19 = 1;
  }
  while ((v42 & 1) != 0);
  unint64_t v29 = *(void *)(v41 + 144);
  uint64_t v28 = *(void *)(v41 + 152);
  if (v29 < v28 + v29)
  {
    do
    {
      if (*(void *)(v14 + 8 * v29) == v11) {
        v30 = 0;
      }
      else {
        v30 = *(void **)(v14 + 8 * v29);
      }
      _PF_Handler_Primitive_GetProperty((id **)v2, v29, 0, *(void *)(v10 + 8 * v29), v15, v16, v17, v18);
      unint64_t v32 = v31;
      int v33 = [v30 isFault];
      if ((v33 & [v32 isFault] & 1) == 0
        && v30 != v32
        && ([v32 isEqual:v30] & 1) == 0)
      {
        uint64_t v34 = v11;
        if (v32) {
          uint64_t v34 = [v32 copy];
        }
        *(void *)(v43 + 8 * v29) = v34;
      }
      ++v29;
      --v28;
    }
    while (v28);
  }
  if ([(NSKnownKeysDictionary *)v39 count])
  {
    uint64_t v35 = v39;
  }
  else
  {

    uint64_t v35 = v38;
  }
  uint64_t v36 = v35;

  return (NSDictionary *)v35;
}

- (id)valueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5 && (v6 = v5, uint64_t v7 = [*((id *)v5 + 13) indexForKey:key], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v7;
    uint64_t v10 = *(void *)(_kvcPropertysPublicGetters(v6) + 8 * v7);
    return _PF_Handler_Public_GetProperty((id **)self, v9, (uint64_t)key, v10);
  }
  else
  {
    object_getClass(self);
    _NSKeyValueGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }
}

- (NSKnownKeysDictionary)_newPropertiesForRetainedTypes:(unsigned int *)a3 andCopiedTypes:(char)a4 preserveFaults:
{
  uint64_t v43 = a2;
  unint64_t v44 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newPropertiesForRetainedTypes_andCopiedTypes_preserveFaults_);
  }
  if ((*((unsigned char *)a1 + 17) & 0x80) != 0) {
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, a1[4]);
  }
  uint64_t v6 = _PFEntityForManagedObject(a1);
  uint64_t v7 = _kvcPropertysPrimitiveGetters(v6);
  if (v6) {
    uint64_t v8 = (void *)v6[13];
  }
  else {
    uint64_t v8 = 0;
  }
  char v42 = &v40;
  [v8 length];
  unint64_t v9 = MEMORY[0x1F4188790]();
  int v12 = (char *)&v40 - v11;
  unint64_t v40 = v9;
  if (v9 > 0x200) {
    int v12 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v40 - v11, 8 * v10);
  }
  uint64_t v41 = v8;
  if (v6) {
    uint64_t v17 = v6[14];
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = NSKeyValueCoding_NullValue;
  uint64_t v19 = *v43;
  if (v19)
  {
    uint64_t v20 = 1;
    do
    {
      uint64_t v21 = (unint64_t *)(v17 + 16 * v43[v20]);
      unint64_t v23 = *v21;
      unint64_t v22 = v21[1];
      if (*v21 < v22 + *v21)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a1, v23, 0, *(void *)(v7 + 8 * v23), v13, v14, v15, v16);
          id v25 = (id)v18;
          if (v24) {
            id v25 = v24;
          }
          *(void *)&v12[8 * v23++] = v25;
          --v22;
        }
        while (v22);
      }
      BOOL v26 = v20++ == v19;
    }
    while (!v26);
  }
  uint64_t v43 = (unsigned int *)*v44;
  if (v43)
  {
    uint64_t v27 = 1;
    do
    {
      uint64_t v28 = (unint64_t *)(v17 + 16 * v44[v27]);
      unint64_t v30 = *v28;
      unint64_t v29 = v28[1];
      if (*v28 < v29 + *v28)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a1, v30, 0, *(void *)(v7 + 8 * v30), v13, v14, v15, v16);
          unint64_t v32 = v31;
          uint64_t v33 = v18;
          if (v32)
          {
            if ((a4 & 1) == 0 && [v32 isFault]) {
              [v32 count];
            }
            uint64_t v33 = objc_msgSend(v32, "copy", v40);
          }
          *(void *)&v12[8 * v30++] = v33;
          --v29;
        }
        while (v29);
      }
      BOOL v26 = v27++ == (void)v43;
    }
    while (!v26);
  }
  uint64_t v34 = [NSKnownKeysDictionary alloc];
  uint64_t v35 = v41;
  uint64_t v36 = [(NSKnownKeysDictionary *)v34 initWithSearchStrategy:v41];
  [(NSKnownKeysDictionary *)v36 setValues:v12];
  if ([v35 length])
  {
    unint64_t v37 = 0;
    do
    {
      uint64_t v38 = *(void **)&v12[8 * v37];
      if (v38 != (void *)v18) {

      }
      ++v37;
    }
    while (v37 < objc_msgSend(v35, "length", v40));
  }
  if (v40 >= 0x201) {
    NSZoneFree(0, v12);
  }
  return v36;
}

- (id)bindableObjectPublisher
{
  cd_extras = self->_cd_extras;
  if (cd_extras) {
    return cd_extras->var4;
  }
  else {
    return 0;
  }
}

- (void)observationInfo
{
  cd_extras = self->_cd_extras;
  if (cd_extras) {
    return cd_extras->var0;
  }
  else {
    return 0;
  }
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (!v5)
  {
    v29.receiver = self;
    v29.super_class = (Class)NSManagedObject;
    return [(NSManagedObject *)&v29 dictionaryWithValuesForKeys:a3];
  }
  uint64_t v6 = v5;
  uint64_t v7 = [a3 count];
  if (a3)
  {
    unint64_t v8 = v7;
    if (!v7) {
      return (id)NSDictionary_EmptyDictionary;
    }
    MEMORY[0x1F4188790](v7);
    uint64_t v10 = (char *)&v26 - v9;
    uint64_t v26 = v11;
    if (v8 > 0x200)
    {
      uint64_t v10 = (char *)NSAllocateScannedUncollectable();
      uint64_t v13 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v26 - v9, 8 * v8);
      MEMORY[0x1F4188790](v12);
      uint64_t v13 = (char *)&v26 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v13, 8 * v8);
    }
    objc_msgSend(a3, "getObjects:range:", v10, 0, v8, v26);
    uint64_t v17 = (void *)v6[13];
    uint64_t v18 = (void *)[v6 propertiesByName];
    uint64_t v28 = _kvcPropertysPublicGetters(v6);
    uint64_t v27 = [v18 values];
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v20 = 0;
    do
    {
      uint64_t v21 = *(void *)&v10[8 * v20];
      unint64_t v22 = [v17 indexForKey:v21];
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id Property = [(NSManagedObject *)self valueForKey:v21];
      }
      else
      {
        unint64_t v24 = v22;
        id Property = _PF_Handler_Public_GetProperty((id **)self, v22, v21, *(void *)(v28 + 8 * v22));
        if ([Property isFault]
          && [*(id *)(v27 + 8 * v24) _isToManyRelationship])
        {
          [Property count];
        }
      }
      if (Property) {
        uint64_t v25 = (uint64_t)Property;
      }
      else {
        uint64_t v25 = v19;
      }
      *(void *)&v13[8 * v20++] = v25;
    }
    while (v8 != v20);
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v13 forKeys:v10 count:v8];
    if (v8 >= 0x201)
    {
      NSZoneFree(0, v13);
      NSZoneFree(0, v10);
    }
    return v14;
  }
  if (self) {
    uint64_t v15 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 0);
  }
  else {
    uint64_t v15 = 0;
  }

  return v15;
}

- (uint64_t)_validateForSave:(void *)a1
{
  if (!a1)
  {
LABEL_25:
    char v18 = 0;
    return v18 & 1;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__validateForSave_);
  }
  uint64_t v26 = 0;
  if ((*((unsigned char *)a1 + 17) & 0x80) != 0) {
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, a1[4]);
  }
  uint64_t v25 = a2;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__validatePropertiesWithError_);
  }
  uint64_t v4 = _PFEntityForManagedObject(a1);
  id v5 = (unint64_t *)v4[14];
  uint64_t v6 = *(void *)(v4[13] + 40);
  uint64_t v7 = _kvcPropertysPrimitiveGetters(v4);
  uint64_t v23 = _kvcPropertysPublicSetters(v4);
  uint64_t v8 = v4[12];
  unint64_t v10 = *v5;
  unint64_t v9 = v5[1];
  int v11 = [(objc_class *)object_getClass(a1) _useFastValidationMethod];
  if (v10 >= v9 + v10)
  {
    char v18 = 1;
    return v18 & 1;
  }
  int v16 = v11;
  uint64_t v24 = v8 + 24;
  if (v25) {
    uint64_t v17 = &v28;
  }
  else {
    uint64_t v17 = 0;
  }
  char v18 = 1;
  do
  {
    uint64_t v28 = 0;
    uint64_t v19 = *(void *)(v6 + 8 * v10);
    _PF_Handler_Primitive_GetProperty((id **)a1, v10, v19, *(void *)(v7 + 8 * v10), v12, v13, v14, v15);
    uint64_t v21 = v20;
    uint64_t v27 = v20;
    if (v16)
    {
      if (-[NSManagedObject _validateValue:forProperty:andKey:withIndex:error:](a1, (uint64_t *)&v27, *(void **)(v24 + 8 * v10), v19, v10, v17))goto LABEL_18; {
    }
      }
    else if ([a1 validateValue:&v27 forKey:v19 error:v17])
    {
LABEL_18:
      if (v21 != v27 && (objc_msgSend(v21, "isEqual:") & 1) == 0) {
        _PF_Handler_Public_SetProperty((unsigned int *)a1, v10, v27, v19, *(void **)(v23 + 8 * v10));
      }
      goto LABEL_21;
    }
    if (!v25) {
      goto LABEL_25;
    }
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v28, &v26);
    char v18 = 0;
LABEL_21:
    ++v10;
    --v9;
  }
  while (v9);
  if (!((v25 == 0) | v18 & 1))
  {
    char v18 = 0;
    *uint64_t v25 = v26;
  }
  return v18 & 1;
}

- (uint64_t)_validateValue:(void *)a3 forProperty:(uint64_t)a4 andKey:(uint64_t)a5 withIndex:(void *)a6 error:
{
  if (!a1) {
    goto LABEL_62;
  }
  uint64_t v58 = 0;
  v59[0] = 0;
  if (a6) {
    uint64_t v12 = &v58;
  }
  else {
    uint64_t v12 = 0;
  }
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    Class = object_getClass(a1);
    Class Superclass = class_getSuperclass(Class);
    if (Superclass == (Class)objc_opt_class())
    {
      LOBYTE(v18) = 1;
      return v18 & 1;
    }
    v57.receiver = a1;
    v57.super_class = (Class)NSManagedObject;
    unsigned __int8 v15 = objc_msgSendSuper2(&v57, sel_validateValue_forKey_error_, a2, a4, v12);
  }
  else
  {
    int v16 = _PFEntityForManagedObject(a1);
    uint64_t v17 = *(void *)(v16[19] + 32);
    if (!v17) {
      uint64_t v17 = _resolveValidationMethods((unint64_t)v16);
    }
    if (!*(void *)(v17 + 8 * a5))
    {
      id v19 = _PFEntityForManagedObject(a1);
      goto LABEL_22;
    }
    method_invoke();
  }
  LOBYTE(v18) = v15;
  if (a6 && (v15 & 1) == 0) {
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v58, v59);
  }
  if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_59;
  }
  id v19 = _PFEntityForManagedObject(a1);
  if ((v18 & 1) == 0)
  {
    if (!a6 || ([a3 _nonPredicateValidateValue:a2 forKey:a4 inObject:a1 error:&v58] & 1) != 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_22:
  int v20 = [a3 _nonPredicateValidateValue:a2 forKey:a4 inObject:a1 error:v12];
  int v18 = v20;
  if (a6 && (v20 & 1) == 0)
  {
LABEL_24:
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v58, v59);
LABEL_25:
    int v18 = 0;
  }
  if (*a2)
  {
    if (a6) {
      int v21 = 1;
    }
    else {
      int v21 = v18;
    }
    if (v21 == 1)
    {
      unint64_t v22 = (void *)[a3 _rawValidationPredicates];
      uint64_t v50 = (uint64_t)a3;
      v56 = (void *)[a3 _rawValidationWarnings];
      uint64_t v23 = [v22 count];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v55 = v19;
        uint64_t v25 = 0;
        uint64_t v52 = *MEMORY[0x1E4F28568];
        uint64_t v51 = *MEMORY[0x1E4F281F8];
        uint64_t v54 = a4;
        while ((objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", v25), "evaluateWithObject:", *a2) & 1) != 0)
        {
LABEL_47:
          if (v24 == ++v25) {
            goto LABEL_59;
          }
        }
        if (!a6) {
          goto LABEL_62;
        }
        uint64_t v26 = (void *)[v56 objectAtIndex:v25];
        uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(v22, "objectAtIndex:", v25), @"NSValidationErrorPredicate", 0);
        if (v26)
        {
          if ([v26 isNSString])
          {
            uint64_t v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "managedObjectModel"), "_localizationPolicy"), "localizedModelStringForKey:", v26);
            if (v28) {
              objc_super v29 = (void *)v28;
            }
            else {
              objc_super v29 = v26;
            }
            uint64_t v30 = *a2;
            uint64_t v31 = (uint64_t)a1;
            int v32 = 1550;
            goto LABEL_45;
          }
          if (![v26 isNSNumber])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              char v47 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v48 = *MEMORY[0x1E4F1C3B8];
              uint64_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"Illegal validation warning: property = \"%@\"; predicate/warning index = %lu; warning = %@.",
                      v54,
                      v25,
                      v26);
              objc_exception_throw((id)objc_msgSend(v47, "exceptionWithName:reason:userInfo:", v48, v49, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v54, @"NSValidationErrorKey", objc_msgSend(NSNumber, "numberWithUnsignedLong:", v25), @"index", v26, @"warning", *a2, @"NSValidationErrorValue", 0)));
            }
            uint64_t v53 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v26, "userInfo"));
            uint64_t v34 = *a2;
            uint64_t v35 = (void *)MEMORY[0x1E4F1CA60];
            if (!*a2) {
              uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
            }
            objc_msgSend(v53, "addEntriesFromDictionary:", objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", a1, @"NSValidationErrorObject", v54, @"NSValidationErrorKey", v34, @"NSValidationErrorValue", 0));
            [v53 addEntriesFromDictionary:v27];
            if ([v53 valueForKey:v52]
              || [v26 domain] == v51
              && [v26 code] >= 1024
              && [v26 code] < 2048)
            {
              uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v37 = [v26 domain];
              uint64_t v38 = [v26 code];
              v39 = v36;
              uint64_t v40 = v37;
              uint64_t v41 = (uint64_t)v53;
            }
            else
            {
              char v42 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:v51 code:1550 userInfo:v53];
              objc_msgSend(v53, "setObject:forKey:", -[NSManagedObject _substituteEntityAndProperty:inString:](a1, v50, objc_msgSend(v42, "localizedDescription")), v52);
              uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v44 = [v26 domain];
              uint64_t v45 = [v26 code];
              uint64_t v41 = [v42 userInfo];
              v39 = v43;
              uint64_t v40 = v44;
              uint64_t v38 = v45;
            }
            uint64_t v33 = [v39 errorWithDomain:v40 code:v38 userInfo:v41];
            uint64_t v58 = v33;
            a4 = v54;
            goto LABEL_46;
          }
          int v32 = [v26 intValue];
          uint64_t v30 = *a2;
          uint64_t v31 = (uint64_t)a1;
        }
        else
        {
          uint64_t v30 = *a2;
          uint64_t v31 = (uint64_t)a1;
          int v32 = 1550;
        }
        objc_super v29 = 0;
LABEL_45:
        uint64_t v33 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:](v31, v32, v29, a4, v30, v27);
        uint64_t v58 = v33;
LABEL_46:
        -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v33, v59);
        LOBYTE(v18) = 0;
        goto LABEL_47;
      }
      goto LABEL_59;
    }
LABEL_62:
    LOBYTE(v18) = 0;
    return v18 & 1;
  }
LABEL_59:
  if (a6 && (v18 & 1) == 0)
  {
    LOBYTE(v18) = 0;
    *a6 = v59[0];
  }
  return v18 & 1;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v7 = _PFEntityForManagedObject(self);
  if (v7 && (uint64_t v8 = v7, v9 = [*((id *)v7 + 13) indexForKey:key], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v10 = v9;
    int v11 = *(void **)(_kvcPropertysPublicSetters(v8) + 8 * v9);
    _PF_Handler_Public_SetProperty((unsigned int *)self, v10, value, (uint64_t)key, v11);
  }
  else
  {
    object_getClass(self);
    _NSKeyValueSetterForClassAndKey();
    _NSSetUsingKeyValueSetter();
  }
}

+ (BOOL)_useFastValidationMethod
{
  return 1;
}

double __80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_3(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = *(void *)(a1 + 32);
  if (!_pvfk_header(a2, v9, a3, a4, a5, a6, a7, a8)) {
    return 0.0;
  }
  unint64_t v10 = (char *)*((void *)a2 + 3);
  Class Class = object_getClass(v10);
  return *(double *)&v10[*((unsigned int *)object_getIndexedIvars(Class) + v9 + 19)];
}

- (NSArray)objectIDsForRelationshipNamed:(NSString *)key
{
  unsigned int v3 = key;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!_PF_Threading_Debugging_level)
  {
    if (key) {
      goto LABEL_3;
    }
LABEL_42:
    CFStringRef v5 = 0;
    goto LABEL_43;
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (!v3) {
    goto LABEL_42;
  }
LABEL_3:
  result.location = 0;
  result.length = 0;
  v47.length = CFStringGetLength((CFStringRef)v3);
  v47.location = 0;
  if (CFStringFindWithOptions((CFStringRef)v3, @".", v47, 0, &result))
  {
    v48.length = result.location;
    v48.location = 0;
    CFStringRef v5 = CFStringCreateWithSubstring(0, (CFStringRef)v3, v48);
    unsigned int v3 = (NSString *)v5;
  }
  else
  {
    CFStringRef v5 = 0;
  }
  id v6 = _PFEntityForManagedObject(self);
  if (!v6 || (id v7 = v6, v8 = [*((id *)v6 + 13) indexForKey:v3], v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_43:
    int v32 = NSString;
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = [(NSEntityDescription *)[(NSManagedObject *)self entity] name];
    uint64_t v35 = @"<null>";
    if (v3) {
      uint64_t v35 = (__CFString *)v3;
    }
    uint64_t v36 = [v32 stringWithFormat:@"[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\".", v33, self, v34, v35];
    id v37 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    if (!v3) {
      unsigned int v3 = (NSString *)[MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v38 = objc_msgSend(v37, "initWithObjectsAndKeys:", self, @"NSTargetObjectUserInfoKey", v3, @"NSUnknownUserInfoKey", 0);
    v39 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28A48] reason:v36 userInfo:v38];

    if (v5) {
      CFRelease(v5);
    }
    objc_exception_throw(v39);
  }
  unint64_t v9 = v8;
  unint64_t v10 = (void *)v7[14];
  [(NSManagedObject *)self willAccessValueForKey:v3];
  unint64_t v11 = v10[12];
  BOOL v13 = v9 >= v11;
  unint64_t v12 = v9 - v11;
  BOOL v13 = !v13 || v12 >= v10[13];
  if (!v13 || (unint64_t v14 = v10[18], v13 = v9 >= v14, v15 = v9 - v14, v13) && v15 < v10[19])
  {
    int v16 = _PF_ObjectIDsForDeferredFault((id **)self, v9);
LABEL_17:
    uint64_t v17 = (NSArray *)v16;
    goto LABEL_18;
  }
  unint64_t v19 = v10[20];
  BOOL v13 = v9 >= v19;
  unint64_t v20 = v9 - v19;
  if (!v13 || v20 >= v10[21])
  {
    unint64_t v21 = v10[26];
    BOOL v13 = v9 >= v21;
    unint64_t v22 = v9 - v21;
    if (!v13 || v22 >= v10[27])
    {
      [(NSManagedObject *)self didAccessValueForKey:v3];
      goto LABEL_43;
    }
  }
  uint64_t v23 = _kvcPropertysPrimitiveGetters(v7);
  id Property = _PF_Handler_Public_GetProperty((id **)self, v9, (uint64_t)v3, *(void *)(v23 + 8 * v9));
  if (!Property)
  {
    int v16 = (id *)[MEMORY[0x1E4F1C978] array];
    goto LABEL_17;
  }
  uint64_t v25 = Property;
  unint64_t v26 = v10[20];
  BOOL v13 = v9 >= v26;
  unint64_t v27 = v9 - v26;
  if (v13 && v27 < v10[21])
  {
    int v16 = (id *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(Property, "objectID"));
    goto LABEL_17;
  }
  uint64_t v17 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v28 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v25);
        }
        -[NSArray addObject:](v17, "addObject:", [*(id *)(*((void *)&v40 + 1) + 8 * i) objectID]);
      }
      uint64_t v29 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v29);
  }
LABEL_18:
  [(NSManagedObject *)self didAccessValueForKey:v3];
  if (v5) {
    CFRelease(v5);
  }
  return v17;
}

- (void)willAccessValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  else if (!self)
  {
    goto LABEL_4;
  }
  if ((self->_cd_stateFlags & 0x4000) == 0)
  {
LABEL_4:
    if (key) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
  unint64_t v9 = self;
  self->_cd_stateFlags &= ~0x4000u;
  if (key)
  {
LABEL_5:
    CFStringRef v5 = (id *)_PFEntityForManagedObject(self);
    if (v5)
    {
      unint64_t v6 = [v5[13] indexForKey:key];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t cd_extraFlags = self->_cd_extraFlags;
        uint64_t v8 = cd_extraFlags ? (char *)self + cd_extraFlags : 0;
        if (((v8[(v6 >> 3) - (((unint64_t)self->_cd_stateFlags >> 22) & 0x3FC)] >> (v6 & 7)) & 1) == 0)
        {
          _PF_FulfillDeferredFault((id **)self, v6);
        }
      }
    }
    return;
  }
LABEL_17:
  unint64_t v10 = (void *)_insertion_fault_handler;
  cd_managedObjectContext = self->_cd_managedObjectContext;

  -[NSFaultHandler fulfillFault:withContext:](v10, self, (uint64_t)cd_managedObjectContext);
}

- (void)didAccessValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (unsigned)_versionReference__
{
  return self->_cd_lockingInfo;
}

- (uint64_t)_commitPhotoshoperyForRelationshipAtIndex:(void *)a3 newValue:
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 48);
    if (v4)
    {
      uint64_t v7 = *(void *)(v4 + 8);
      if (v7)
      {
        uint64_t v8 = v7 + 24;
        unint64_t v9 = *(void **)(v7 + 24 + 8 * a2);
        if (v9 != a3)
        {
          CFRange result = [*(id *)(v8 + 8 * a2) isFault];
          if (result)
          {

            CFRange result = [a3 copy];
            *(void *)(v8 + 8 * a2) = result;
          }
        }
      }
      uint64_t v10 = *(void *)(v3 + 48);
      if (v10)
      {
        uint64_t v11 = *(void *)(v10 + 16);
        if (v11)
        {
          uint64_t v12 = v11 + 24;
          BOOL v13 = *(void **)(v11 + 24 + 8 * a2);
          if (v13 != a3)
          {
            CFRange result = [*(id *)(v12 + 8 * a2) isFault];
            if (result)
            {

              CFRange result = [a3 copy];
              *(void *)(v12 + 8 * a2) = result;
            }
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)isInserted
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  return (self->_cd_stateFlags & 0x12) != 0;
}

- (uint64_t)_isValidRelationshipDestination__
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 16) & 0x80) != 0) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = *(void *)(result + 32);
    }
    if ([*(id *)(result + 40) isTemporaryID] && (*(unsigned char *)(v1 + 16) & 0x12) == 0)
    {
      if (v2)
      {
        unsigned __int8 v4 = atomic_load((unsigned __int8 *)(v2 + 48));
        unsigned int v3 = v4 & 1;
      }
      else
      {
        unsigned int v3 = 0;
      }
    }
    else
    {
      unsigned int v3 = 1;
    }
    if (v2) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

+ (unsigned)allocBatch:(id *)a3 withEntity:(id)a4 count:(unsigned int)a5
{
  uint64_t v8 = (void *)_PFFastEntityClass((unint64_t)a4);
  uint64_t v9 = [v8 _PFMOClassFactoryData];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  if (!*(void *)(v9 + 24))
  {
    if (a4 && (uint64_t v17 = *((void *)a4 + 14)) != 0) {
      unint64_t v18 = *(void *)(v17 + 8);
    }
    else {
      unint64_t v18 = objc_msgSend((id)objc_msgSend(a4, "propertiesByName"), "count");
    }
    if (v18 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }
    *(void *)(v10 + 24) = 8 * v19;
  }
  unsigned int v11 = _PFAllocateObjects((objc_class *)v8, a3, a5, 0);
  int InstanceSize = class_getInstanceSize((Class)v8);
  if (v11)
  {
    int v13 = *(_DWORD *)(v10 + 40) | (*(unsigned __int8 *)(v10 + 32) << 24);
    uint64_t v14 = v11;
    do
    {
      uint64_t v15 = (uint64_t)*a3++;
      *(_DWORD *)(v15 + 16) = v13;
      *(_DWORD *)(v15 + 20) = (InstanceSize + 7) & 0xFFFFFFF8;
      --v14;
    }
    while (v14);
  }
  return v11;
}

+ (void)_entityDeallocated
{
  uint64_t v3 = [a1 _PFMOClassFactoryData];
  if (v3)
  {
    uint64_t v4 = v3;
    os_unfair_lock_lock(&stru_1EB27066C);
    *(void *)(v4 + 24) = 0;
    CFStringRef v5 = (void *)[a1 _PFPlaceHolderSingleton];
    unint64_t v6 = (objc_class *)objc_opt_class();
    object_setClass(v5, v6);
    *(void *)(v4 + 8) = 0;
    os_unfair_lock_unlock(&stru_1EB27066C);
  }
}

+ (Class)classForEntity:(id)a3
{
  Class v219 = (Class)MethodImplementation;
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  if (!qword_1EB270678)
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    qword_1EB270678 = (uint64_t)class_getMethodImplementation(v4, sel_willChangeValueForKey_);
    CFStringRef v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_didChangeValueForKey_);
    qword_1EB270680 = (uint64_t)MethodImplementation;
  }
  MEMORY[0x1F4188790](MethodImplementation);
  v218 = (char *)&v180;
  unint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (!v6 || (uint64_t v7 = v6, !*v6)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Entity name must not be nil." userInfo:0]);
  }
  if ((*((unsigned char *)a3 + 120) & 4) == 0)
  {
    uint64_t v147 = [a3 managedObjectModel];
    id v148 = a3;
    if (v147) {
      id v148 = (id)[a3 managedObjectModel];
    }
    [v148 _setIsEditable:0];
  }
  v188 = v7;
  Name = (char *)class_getName(v219);
  uint64_t v9 = strchr(Name, 46);
  if (MEMORY[0x1F4188790](v9))
  {
    long long v178 = 0u;
    long long v179 = 0u;
    memset(v177, 0, sizeof(v177));
    long long v176 = 0u;
    long long v174 = 0u;
    memset(v175, 0, sizeof(v175));
    memset(v173, 0, sizeof(v173));
    long long v172 = 0u;
    long long v170 = 0u;
    memset(v171, 0, sizeof(v171));
    memset(v169, 0, sizeof(v169));
    long long v168 = 0u;
    long long v166 = 0u;
    memset(v167, 0, sizeof(v167));
    memset(v165, 0, sizeof(v165));
    long long v164 = 0u;
    long long v162 = 0u;
    memset(v163, 0, sizeof(v163));
    memset(v161, 0, sizeof(v161));
    long long v160 = 0u;
    memset(v159, 0, sizeof(v159));
    unsigned int v10 = strlen(Name);
    if (v10 >= 0x1FF) {
      uint64_t v11 = 511;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        int v13 = Name[i];
        if (!Name[i]) {
          break;
        }
        if (v13 == 46) {
          LOBYTE(v13) = 95;
        }
        *((unsigned char *)v159 + i) = v13;
      }
    }
    Name = (char *)v159;
  }
  uint64_t v14 = v188;
  v212 = Name;
  snprintf(v218, 0x200uLL, "%s_%s_", Name, v188);
  os_unfair_lock_lock(&stru_1EB27066C);
  v216 = 0;
  SEL v194 = sel_retain;
  SEL v195 = sel__retain_1;
  SEL v192 = sel_release;
  SEL v193 = sel__release_1;
  SEL v209 = sel__isGeneratedClass;
  SEL v210 = sel__isGeneratedClass_1;
  SEL v215 = sel_class;
  SEL v211 = sel_superclass;
  SEL v191 = sel__PFMOClassFactoryData;
  SEL v187 = sel_willAccessValueForKey_;
  SEL v186 = sel_didAccessValueForKey_;
  SEL v208 = sel_resolveInstanceMethod_;
  SEL v185 = sel__classShouldAlwaysRegisterSelectorNamed_;
  SEL v207 = sel_validateValue_forKey_error_;
  SEL v184 = sel__useFastValidationMethod;
  *(void *)&long long v15 = 136315138;
  long long v182 = v15;
  *(void *)&long long v15 = 134218498;
  long long v181 = v15;
  SEL v206 = sel_awakeFromFetch;
  SEL v205 = sel_willChangeValueForKey_;
  SEL v204 = sel_didChangeValueForKey_;
  SEL v203 = sel_willChangeValueForKey_withSetMutation_usingObjects_;
  SEL v201 = sel_willFireFault;
  SEL v202 = sel_didChangeValueForKey_withSetMutation_usingObjects_;
  SEL v200 = sel_didFireFault;
  SEL v183 = sel__transientPropertiesChangesMask__;
  v189 = a3;
  SEL v190 = sel__PFPlaceHolderSingleton;
  v213 = &v221[2];
  uint64_t v217 = 2;
  do
  {
    while (1)
    {
      while (1)
      {
        Class Class = objc_getClass(v218);
        Class v17 = Class;
        if (Class)
        {
          unint64_t v18 = Class;
        }
        else
        {
          Class ClassPair = objc_allocateClassPair(v219, v218, 0);
          unint64_t v18 = ClassPair;
          if (!ClassPair) {
            goto LABEL_107;
          }
          unint64_t v20 = object_getClass(ClassPair);
          ClassMethod = class_getClassMethod(v18, v195);
          Implementation = method_getImplementation(ClassMethod);
          TypeEncoding = method_getTypeEncoding(ClassMethod);
          class_addMethod(v20, v194, Implementation, TypeEncoding);
          uint64_t v24 = class_getClassMethod(v18, v193);
          uint64_t v25 = method_getImplementation(v24);
          unint64_t v26 = method_getTypeEncoding(v24);
          class_addMethod(v20, v192, v25, v26);
          unint64_t v27 = class_getClassMethod(v18, v210);
          uint64_t v28 = method_getImplementation(v27);
          uint64_t v29 = method_getTypeEncoding(v27);
          class_addMethod(v20, v209, v28, v29);
          uint64_t v30 = class_getClassMethod(v219, v215);
          uint64_t v31 = method_getTypeEncoding(v30);
          class_addMethod(v18, v215, (IMP)override_instace_class, v31);
          int v32 = class_getClassMethod(v219, v215);
          uint64_t v33 = method_getTypeEncoding(v32);
          class_addMethod(v20, v215, (IMP)override_class_class, v33);
          uint64_t v34 = class_getClassMethod(v219, v211);
          uint64_t v35 = method_getTypeEncoding(v34);
          class_addMethod(v20, v211, (IMP)override_class_superclass, v35);
          Class v214 = v20;
          int v36 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
          id v37 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone) {
            id v37 = malloc_default_zone();
          }
          if (v36) {
            size_t v38 = (((v36 - 1) >> 3) & 0x1FFFFFFC) + 108;
          }
          else {
            size_t v38 = 108;
          }
          v39 = malloc_type_zone_calloc(v37, 1uLL, v38, 0x8E0FE644uLL);
          v221[0] = MEMORY[0x1E4F143A8];
          v221[1] = 3221225472;
          v221[2] = (unint64_t)__generateReturnPointerMethod_block_invoke;
          v221[3] = (unint64_t)&__block_descriptor_40_e9__v16__0_8l;
          *(void *)&long long v222 = v39;
          long long v40 = imp_implementationWithBlock(v221);
          if (!v40)
          {
            uint64_t v41 = [NSString stringWithUTF8String:"Failed to generate function for '%s'"];
            _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)v14);
            CFRange v48 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v221[0]) = v182;
              *(unint64_t *)((char *)v221 + 4) = (unint64_t)v14;
              _os_log_fault_impl(&dword_18AB82000, v48, OS_LOG_TYPE_FAULT, "CoreData: Failed to generate function for '%s'", (uint8_t *)v221, 0xCu);
            }
          }
          if (!class_addMethod(v214, v191, v40, "@@:"))
          {
            uint64_t v49 = [NSString stringWithUTF8String:"Failed to add function to class for '%s'"];
            _NSCoreDataLog(17, v49, v50, v51, v52, v53, v54, v55, (uint64_t)v14);
            v56 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v221[0]) = v182;
              *(unint64_t *)((char *)v221 + 4) = (unint64_t)v14;
              _os_log_fault_impl(&dword_18AB82000, v56, OS_LOG_TYPE_FAULT, "CoreData: Failed to add function to class for '%s'", (uint8_t *)v221, 0xCu);
            }
          }
          objc_super v57 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone) {
            objc_super v57 = malloc_default_zone();
          }
          size_t InstanceSize = class_getInstanceSize(v219);
          v216 = malloc_type_zone_calloc(v57, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0xC83DDBB4uLL);
          v39[6] = v216;
          if ((Class)objc_opt_class() == v219)
          {
            uint64_t v119 = 2392384;
          }
          else
          {
            uint64_t v59 = (objc_class *)objc_opt_class();
            v60 = v187;
            IMP v61 = class_getMethodImplementation(v59, v187);
            IMP v62 = class_getMethodImplementation(v219, v60);
            uint64_t v63 = (objc_class *)objc_opt_class();
            v64 = v186;
            IMP v65 = class_getMethodImplementation(v63, v186);
            IMP v66 = class_getMethodImplementation(v219, v64);
            BOOL v68 = v61 != v62 || v65 != v66;
            *((_DWORD *)v39 + 24) = v39[12] & 0xFFFFFFFE | v68;
            unint64_t v69 = (objc_class *)objc_opt_class();
            v70 = class_getClassMethod(v69, v208);
            uint64_t v71 = method_getImplementation(v70);
            uint64_t v72 = class_getClassMethod(v219, v208);
            if (v71 != method_getImplementation(v72))
            {
              *((_DWORD *)v39 + 24) |= 0x40u;
              v73 = (objc_class *)objc_opt_class();
              v74 = class_getClassMethod(v73, v210);
              uint64_t v75 = object_getClass(v219);
              v76 = method_getImplementation(v74);
              uint64_t v77 = method_getTypeEncoding(v70);
              class_addMethod(v75, v185, v76, v77);
            }
            unint64_t v78 = (objc_class *)objc_opt_class();
            uint64_t v79 = class_getMethodImplementation(v78, v207);
            if (v79 != class_getMethodImplementation(v219, v207))
            {
              *((_DWORD *)v39 + 24) |= 0x10u;
              uint64_t v80 = (objc_class *)objc_opt_class();
              uint64_t v81 = class_getClassMethod(v80, v209);
              uint64_t v82 = method_getImplementation(v81);
              uint64_t v83 = method_getTypeEncoding(v81);
              class_addMethod(v214, v184, v82, v83);
            }
            uint64_t v84 = (objc_class *)objc_opt_class();
            v85 = class_getMethodImplementation(v84, v206);
            if (v85 != class_getMethodImplementation(v219, v206)) {
              *((_DWORD *)v39 + 24) |= 0x20u;
            }
            int v86 = (objc_class *)objc_opt_class();
            IMP v87 = class_getMethodImplementation(v86, v205);
            IMP v88 = class_getMethodImplementation(v219, v205);
            v89 = (objc_class *)objc_opt_class();
            int v90 = class_getMethodImplementation(v89, v204);
            if (v90 == class_getMethodImplementation(v219, v204) && v87 == v88) {
              int v92 = 0;
            }
            else {
              int v92 = 2;
            }
            *((_DWORD *)v39 + 24) = v39[12] & 0xFFFFFFFD | v92;
            v93 = (objc_class *)objc_opt_class();
            IMP v94 = class_getMethodImplementation(v93, v203);
            IMP v95 = class_getMethodImplementation(v219, v203);
            v96 = (objc_class *)objc_opt_class();
            uint64_t v97 = class_getMethodImplementation(v96, v202);
            if (v97 == class_getMethodImplementation(v219, v202) && v94 == v95) {
              int v99 = 0;
            }
            else {
              int v99 = 4;
            }
            *((_DWORD *)v39 + 24) = v39[12] & 0xFFFFFFFB | v99;
            uint64_t v100 = (objc_class *)objc_opt_class();
            IMP v199 = class_getMethodImplementation(v100, v201);
            IMP v198 = class_getMethodImplementation(v219, v201);
            v101 = (objc_class *)objc_opt_class();
            IMP v197 = class_getMethodImplementation(v101, v200);
            IMP v196 = class_getMethodImplementation(v219, v200);
            uint64_t v102 = *((void *)a3 + 14);
            unint64_t v103 = *(void *)(v102 + 80);
            uint64_t v104 = *(void *)(v102 + 88);
            if (v103 < v104 + v103)
            {
              uint64_t v105 = *(void *)(v189[13] + 40);
              do
              {
                objc_msgSend(*(id *)(v105 + 8 * v103), "UTF8String", v159[0], *(void *)&v159[1], *(_OWORD *)((char *)&v159[1] + 8), *((void *)&v159[2] + 1), v160, *(void *)&v161[0], *(_OWORD *)((char *)v161 + 8), *((void *)&v161[1] + 1), v162, *(void *)&v163[0], *(_OWORD *)((char *)v163 + 8), *((void *)&v163[1] + 1), v164, *(void *)&v165[0], *(_OWORD *)((char *)v165 + 8), *((void *)&v165[1] + 1), v166,
                  *(void *)&v167[0],
                  *(_OWORD *)((char *)v167 + 8),
                  *((void *)&v167[1] + 1),
                  v168,
                  *(void *)&v169[0],
                  *(_OWORD *)((char *)v169 + 8),
                  *((void *)&v169[1] + 1),
                  v170,
                  *(void *)&v171[0],
                  *(_OWORD *)((char *)v171 + 8),
                  *((void *)&v171[1] + 1),
                  v172,
                  *(void *)&v173[0],
                  *(_OWORD *)((char *)v173 + 8),
                  *((void *)&v173[1] + 1),
                  v174,
                  *(void *)&v175[0],
                  *(_OWORD *)((char *)v175 + 8),
                  *((void *)&v175[1] + 1),
                  v176,
                  *(void *)&v177[0],
                  *(_OWORD *)((char *)v177 + 8),
                  *((void *)&v177[1] + 1),
                  (void)v178);
                unsigned int v106 = __strlcpy_chk();
                __strlcat_chk();
                *((unsigned char *)v221 + v106) = __toupper(*((char *)v221 + v106));
                if (BYTE2(dword_1EB270AB8)) {
                  uint64_t v107 = sel_lookUpByName();
                }
                else {
                  uint64_t v107 = (uint64_t)sel_registerName((const char *)v221);
                }
                v108 = (const char *)v107;
                if ((objc_opt_respondsToSelector() & 1) != 0 && [v219 v108])
                {
                  v109 = (char *)v39[11];
                  if (!v109)
                  {
                    v39[11] = v39 + 13;
                    v109 = (char *)(v39 + 13);
                  }
                  v109[v103 >> 3] |= 1 << (v103 & 7);
                }
                ++v103;
                --v104;
              }
              while (v104);
            }
            uint64_t v110 = v39[11];
            if (v110)
            {
              v221[0] = MEMORY[0x1E4F143A8];
              v221[1] = 3221225472;
              v221[2] = (unint64_t)__generateReturnPointerMethod_block_invoke;
              v221[3] = (unint64_t)&__block_descriptor_40_e9__v16__0_8l;
              *(void *)&long long v222 = v110;
              v111 = imp_implementationWithBlock(v221);
              class_addMethod(v214, v183, v111, "@@:");
            }
            BOOL v112 = v199 == v198;
            BOOL v113 = v197 == v196;
            int v114 = *((_DWORD *)v39 + 24);
            uint64_t v115 = 0x8000;
            if ((v114 & 1) == 0) {
              uint64_t v115 = 32832;
            }
            if ((v114 & 2) == 0) {
              v115 |= 0x40000uLL;
            }
            BOOL v116 = !v112 || !v113;
            if (v112 && v113) {
              int v117 = 0;
            }
            else {
              int v117 = 8;
            }
            *((_DWORD *)v39 + 24) = v114 & 0xFFFFFFF7 | v117;
            uint64_t v118 = v115 | 0x100;
            if (v116) {
              uint64_t v118 = v115;
            }
            if ((v114 & 4) != 0) {
              uint64_t v119 = v118;
            }
            else {
              uint64_t v119 = v118 | 0x200000;
            }
            uint64_t v14 = v188;
            a3 = v189;
          }
          if (-[objc_class contextShouldIgnoreUnmodeledPropertyChanges](v219, "contextShouldIgnoreUnmodeledPropertyChanges", *(void *)&v159[0], *((void *)&v159[0] + 1), *(void *)&v159[1], *((void *)&v159[1] + 1), *(void *)&v159[2], *((void *)&v159[2] + 1), (void)v160, *((void *)&v160 + 1), *(void *)&v161[0], *((void *)&v161[0] + 1), *(void *)&v161[1], *((void *)&v161[1] + 1), (void)v162, *((void *)&v162 + 1), *(void *)&v163[0], *((void *)&v163[0] + 1), *(void *)&v163[1],
                               *((void *)&v163[1] + 1),
                               (void)v164,
                               *((void *)&v164 + 1),
                               *(void *)&v165[0],
                               *((void *)&v165[0] + 1),
                               *(void *)&v165[1],
                               *((void *)&v165[1] + 1),
                               (void)v166,
                               *((void *)&v166 + 1),
                               *(void *)&v167[0],
                               *((void *)&v167[0] + 1),
                               *(void *)&v167[1],
                               *((void *)&v167[1] + 1),
                               (void)v168,
                               *((void *)&v168 + 1),
                               *(void *)&v169[0],
                               *((void *)&v169[0] + 1),
                               *(void *)&v169[1],
                               *((void *)&v169[1] + 1),
                               (void)v170,
                               *((void *)&v170 + 1),
                               *(void *)&v171[0],
                               *((void *)&v171[0] + 1),
                               *(void *)&v171[1],
                               *((void *)&v171[1] + 1),
                               (void)v172,
                               *((void *)&v172 + 1),
                               *(void *)&v173[0],
                               *((void *)&v173[0] + 1),
                               *(void *)&v173[1],
                               *((void *)&v173[1] + 1),
                               (void)v174,
                               *((void *)&v174 + 1),
                               *(void *)&v175[0],
                               *((void *)&v175[0] + 1),
                               *(void *)&v175[1],
                               *((void *)&v175[1] + 1),
                               (void)v176,
                               *((void *)&v176 + 1),
                               *(void *)&v177[0],
                               *((void *)&v177[0] + 1),
                               *(void *)&v177[1],
                               *((void *)&v177[1] + 1),
                               (void)v178))
            uint64_t v120 = 0x400000;
          else {
            uint64_t v120 = 0;
          }
          int v121 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
          __snprintf_chk(v218, 0x200uLL, 0, 0x200uLL, "_cd_bits_%p", v18);
          if (v121) {
            unsigned int v122 = ((v121 - 1) >> 5) + 1;
          }
          else {
            unsigned int v122 = 1;
          }
          if (v122 > 0x4000) {
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Incorrect ivar generation" userInfo:0]);
          }
          __snprintf_chk(v220, 0xAuLL, 0, 0xAuLL, "[%dI]", v122);
          if (!class_addIvar(v18, v218, 4 * v122, 1u, v220)) {
            objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"class_addIvar failed" userInfo:0]);
          }
          v221[0] = MEMORY[0x1E4F143A8];
          v221[1] = 3221225472;
          v221[2] = (unint64_t)__generateReturnPointerMethod_block_invoke;
          v221[3] = (unint64_t)&__block_descriptor_40_e9__v16__0_8l;
          *(void *)&long long v222 = v216;
          v123 = imp_implementationWithBlock(v221);
          class_addMethod(v214, v190, v123, "@@:");
          objc_registerClassPair(v18);
          object_setClass(v216, v18);
          v124 = v216;
          *((_DWORD *)v216 + 4) |= 0x100000u;
          v124[2] = 10000;
          InstanceVariable = class_getInstanceVariable(v18, v218);
          int Offset = ivar_getOffset(InstanceVariable);
          *((unsigned char *)v39 + 32) = ((((unsigned __int16)class_getInstanceSize(v18) + 7) & 0x3F8u) - Offset) >> 2;
          v39[5] = v120 | v119;
          uint64_t v127 = [(objc_class *)v18 _PFMOClassFactoryData];
          if (v39 != (void *)v127)
          {
            uint64_t v149 = [NSString stringWithUTF8String:"Testing generated function for +classForEntity: failed for entity %s (%p)"];
            _NSCoreDataLog(17, v149, v150, v151, v152, v153, v154, v155, (uint64_t)v188);
            v156 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v221[0]) = 136315394;
              *(unint64_t *)((char *)v221 + 4) = (unint64_t)v188;
              WORD2(v221[1]) = 2048;
              *(unint64_t *)((char *)&v221[1] + 6) = (unint64_t)v18;
              _os_log_fault_impl(&dword_18AB82000, v156, OS_LOG_TYPE_FAULT, "CoreData: Testing generated function for +classForEntity: failed for entity %s (%p)", (uint8_t *)v221, 0x16u);
            }
            v157 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v158 = [NSString stringWithFormat:@"Testing generated function, factory %p != result %p", v39, v127];
            objc_exception_throw((id)[v157 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v158 userInfo:0]);
          }
          objc_msgSend((id)objc_msgSend(a3, "versionHash"), "getBytes:length:", v39 + 7, 32);
        }
        uint64_t v128 = -[objc_class _PFMOClassFactoryData](v18, "_PFMOClassFactoryData", *(void *)&v159[0], *((void *)&v159[0] + 1), *(void *)&v159[1], *((void *)&v159[1] + 1), *(void *)&v159[2], *((void *)&v159[2] + 1), (void)v160, *((void *)&v160 + 1), *(void *)&v161[0], *((void *)&v161[0] + 1), *(void *)&v161[1], *((void *)&v161[1] + 1), (void)v162, *((void *)&v162 + 1), *(void *)&v163[0], *((void *)&v163[0] + 1), *(void *)&v163[1],
                 *((void *)&v163[1] + 1),
                 (void)v164,
                 *((void *)&v164 + 1),
                 *(void *)&v165[0],
                 *((void *)&v165[0] + 1),
                 *(void *)&v165[1],
                 *((void *)&v165[1] + 1),
                 (void)v166,
                 *((void *)&v166 + 1),
                 *(void *)&v167[0],
                 *((void *)&v167[0] + 1),
                 *(void *)&v167[1],
                 *((void *)&v167[1] + 1),
                 (void)v168,
                 *((void *)&v168 + 1),
                 *(void *)&v169[0],
                 *((void *)&v169[0] + 1),
                 *(void *)&v169[1],
                 *((void *)&v169[1] + 1),
                 (void)v170,
                 *((void *)&v170 + 1),
                 *(void *)&v171[0],
                 *((void *)&v171[0] + 1),
                 *(void *)&v171[1],
                 *((void *)&v171[1] + 1),
                 (void)v172,
                 *((void *)&v172 + 1),
                 *(void *)&v173[0],
                 *((void *)&v173[0] + 1),
                 *(void *)&v173[1],
                 *((void *)&v173[1] + 1),
                 (void)v174,
                 *((void *)&v174 + 1),
                 *(void *)&v175[0],
                 *((void *)&v175[0] + 1),
                 *(void *)&v175[1],
                 *((void *)&v175[1] + 1),
                 (void)v176,
                 *((void *)&v176 + 1),
                 *(void *)&v177[0],
                 *((void *)&v177[0] + 1),
                 *(void *)&v177[1],
                 *((void *)&v177[1] + 1),
                 (void)v178);
        if (!v17) {
          goto LABEL_108;
        }
        long long v250 = 0u;
        long long v251 = 0u;
        long long v248 = 0u;
        long long v249 = 0u;
        long long v246 = 0u;
        long long v247 = 0u;
        long long v244 = 0u;
        long long v245 = 0u;
        long long v242 = 0u;
        long long v243 = 0u;
        long long v240 = 0u;
        long long v241 = 0u;
        long long v238 = 0u;
        long long v239 = 0u;
        long long v236 = 0u;
        long long v237 = 0u;
        long long v234 = 0u;
        long long v235 = 0u;
        long long v232 = 0u;
        long long v233 = 0u;
        long long v230 = 0u;
        long long v231 = 0u;
        long long v228 = 0u;
        long long v229 = 0u;
        long long v226 = 0u;
        long long v227 = 0u;
        long long v224 = 0u;
        long long v225 = 0u;
        long long v222 = 0u;
        long long v223 = 0u;
        memset(v221, 0, sizeof(v221));
        CFAllocatorRef v129 = _PFStackAllocatorCreate(v221, 1024);
        CFDataRef v130 = CFDataCreate(v129, (const UInt8 *)(v128 + 56), 32);
        int v131 = objc_msgSend((id)objc_msgSend(a3, "versionHash"), "isEqual:", v130);
        int v132 = v131;
        if (!v221[3]) {
          break;
        }
        if (v130) {
          CFRelease(v130);
        }
        if (v132) {
          goto LABEL_105;
        }
LABEL_107:
        __snprintf_chk(v218, 0x200uLL, 0, 0x200uLL, "%s_%s_%x", v212, v14, v217);
        uint64_t v217 = (v217 + 1);
      }
      v221[1] = v221[0];
      if (!v131) {
        goto LABEL_107;
      }
LABEL_105:
      id v133 = *(id *)(v128 + 8);
      if (v133 && v133 != a3) {
        goto LABEL_107;
      }
LABEL_108:
      if (!*(void *)(v128 + 8)) {
        break;
      }
LABEL_114:
      if (v18) {
        goto LABEL_117;
      }
    }
    *(_DWORD *)uint64_t v128 = 0;
    *(void *)(v128 + 8) = a3;
    if (!*(void *)(v128 + 16)) {
      *(void *)(v128 + 16) = objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
    }
    *(void *)(v128 + 24) = 0;
    v134 = (void *)[(objc_class *)v18 _PFPlaceHolderSingleton];
    unint64_t v135 = (unint64_t)v134;
    if (v134 != *(void **)(v128 + 48))
    {
      uint64_t v136 = [NSString stringWithUTF8String:"Factory and entity class skew over placeholder singleton.  Expected %p but got %p for entity '%s'"];
      _NSCoreDataLog(17, v136, v137, v138, v139, v140, v141, v142, *(void *)(v128 + 48));
      v143 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        unint64_t v144 = *(void *)(v128 + 48);
        LODWORD(v221[0]) = v181;
        *(unint64_t *)((char *)v221 + 4) = v144;
        WORD2(v221[1]) = 2048;
        *(unint64_t *)((char *)&v221[1] + 6) = v135;
        HIWORD(v221[2]) = 2080;
        v221[3] = (unint64_t)v14;
        _os_log_fault_impl(&dword_18AB82000, v143, OS_LOG_TYPE_FAULT, "CoreData: Factory and entity class skew over placeholder singleton.  Expected %p but got %p for entity '%s'", (uint8_t *)v221, 0x20u);
      }
      goto LABEL_114;
    }
    object_setClass(v134, v18);
    *(void *)(v128 + 48) = v135;
  }
  while (!v18);
LABEL_117:
  os_unfair_lock_unlock(&stru_1EB27066C);
  if (v216)
  {
    os_unfair_lock_lock_with_options();
    Mutable = (__CFArray *)qword_1EB270688;
    if (!qword_1EB270688)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
      qword_1EB270688 = (uint64_t)Mutable;
    }
    CFArrayAppendValue(Mutable, v216);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB270670);
  }
  self;
  __dmb(0xBu);
  return v18;
}

+ (BOOL)contextShouldIgnoreUnmodeledPropertyChanges
{
  return 1;
}

void *__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke(uint64_t a1, void *a2, double a3)
{
  unint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___sharedIMPL_setvfk_core_d_block_invoke;
  v6[3] = &unk_1E544C2C8;
  v6[4] = a2;
  v6[5] = v4;
  *(double *)&v6[6] = a3;
  return _sharedIMPL_setvfk_core_scalar(a2, v4, (uint64_t)v6);
}

- (void)_setLastSnapshot__:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = (void *)result[6];
    if (!v4)
    {
      if (!a2) {
        return result;
      }
      CFStringRef v5 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        CFStringRef v5 = malloc_default_zone();
      }
      unint64_t v4 = malloc_type_zone_calloc(v5, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
      v3[6] = v4;
    }
    uint64_t v8 = (void *)v4[2];
    unint64_t v6 = v4 + 2;
    uint64_t v7 = v8;
    uint64_t v9 = v6 + 1;

    if (v8 != a2)
    {
      void *v9 = v7;
      uint64_t v9 = v6;
    }
    CFRange result = a2;
    void *v9 = result;
  }
  return result;
}

- (void)_setOriginalSnapshot__:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFRange result = (void *)result[6];
    if (!result)
    {
      if (!a2) {
        return result;
      }
      unint64_t v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        unint64_t v4 = malloc_default_zone();
      }
      CFRange result = malloc_type_zone_calloc(v4, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
      v3[6] = result;
    }
    CFStringRef v5 = (void *)result[1];
    if (v5 != a2)
    {

      CFRange result = a2;
      *(void *)(v3[6] + 8) = result;
    }
  }
  return result;
}

- (void)didSave
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (void)_setVersionReference__:(unsigned int)a3
{
  self->_cd_lockingInfo = a3;
}

+ (void)_release_1
{
}

- (id)primitiveValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  CFStringRef v5 = _PFEntityForManagedObject(self);
  if (!v5
    || ((v6 = v5, uint64_t v7 = (void *)v5[13], !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      ? (uint64_t v8 = [v7 indexForKey:key])
      : (uint64_t v8 = [v7 fastIndexForKnownKey:key]),
        uint64_t v9 = v8,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    object_getClass(self);
    _NSKeyValuePrimitiveGetterForClassAndKey();
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    if ((self->_cd_stateFlags & 0x8000) != 0) {
      [(id)_insertion_fault_handler fulfillFault:self withContext:self->_cd_managedObjectContext forIndex:v9];
    }
    return (id)_NSGetUsingKeyValueGetter();
  }
  if (*(void *)(_kvcPropertysPrimitiveGetters(v6) + 8 * v8)) {
    goto LABEL_10;
  }

  return [(NSManagedObject *)self _genericValueForKey:key withIndex:v9 flags:0];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSManagedObject;
  return objc_msgSendSuper2(&v4, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (BOOL)isFault
{
  return BYTE1(self->_cd_stateFlags) >> 7;
}

- (BOOL)_tryRetain
{
  while (1)
  {
    int cd_rc = self->_cd_rc;
    if (cd_rc) {
      break;
    }
    int v3 = self->_cd_rc;
    atomic_compare_exchange_strong(&self->_cd_rc, (unsigned int *)&v3, cd_rc + 2);
    if (v3 == cd_rc)
    {
      if (*MEMORY[0x1E4F1CBC0]) {
        NSRecordAllocationEvent();
      }
      return (cd_rc & 1) == 0;
    }
  }
  return (cd_rc & 1) == 0;
}

- (id)_implicitObservationInfo
{
  uint64_t v5 = 0;
  if (!self || (self->_cd_stateFlags & 0x80) != 0) {
    cd_managedObjectContext = 0;
  }
  else {
    cd_managedObjectContext = self->_cd_managedObjectContext;
  }
  int v3 = _PFEntityForManagedObject(self);
  return (id)-[NSManagedObjectContext _implicitObservationInfoForEntity:forResultingClass:]((uint64_t)cd_managedObjectContext, v3, &v5);
}

- (void)_didChangeValue:(id)a3 forRelationship:(id)a4 named:(id)a5 withInverse:(id)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a6, "isReadOnly", a3, a4, a5))
  {
    uint64_t v34 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v35 = *MEMORY[0x1E4F1C3B8];
    uint64_t v36 = [NSString stringWithFormat:@"Cannot maintain read-only inverse relationship \"%@\" for relationship: %@.", objc_msgSend(a6, "name"), objc_msgSend(a4, "name")];
    objc_exception_throw((id)objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, v36, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(a4, "name"), @"key", objc_msgSend(a6, "name"), @"inverse", 0)));
  }
  unsigned int v10 = (void *)[a3 objectForKey:*MEMORY[0x1E4F284E0]];
  uint64_t v11 = (void *)[a3 objectForKey:*MEMORY[0x1E4F284C8]];
  if ([v10 isEqual:NSKeyValueCoding_NullValue]) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = (uint64_t)v10;
  }
  if ([v11 isEqual:NSKeyValueCoding_NullValue]) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = (uint64_t)v11;
  }
  if (v12 | v13) {
    BOOL v14 = v12 == v13;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && ((objc_opt_respondsToSelector() & 1) == 0 || ([(id)v12 _isIdenticalFault:v13] & 1) == 0))
  {
    self->_cd_stateFlags |= 0x800u;
    if ([a4 isToMany])
    {
      switch(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F284C0]), "intValue"))
      {
        case 1u:
          unint64_t v15 = [(id)v12 count];
          unint64_t v16 = [(id)v13 count];
          uint64_t v17 = [a4 isOrdered];
          int v18 = v17;
          if (v17)
          {
            if (v15)
            {
              MEMORY[0x1F4188790](v17);
              unint64_t v20 = (char *)v37 - v19;
              if (v15 > 0x200) {
                unint64_t v20 = (char *)NSAllocateScannedUncollectable();
              }
              else {
                bzero((char *)v37 - v19, 8 * v15);
              }
              [(id)v12 getObjects:v20];
              uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v20 count:v15];
              uint64_t v12 = v17;
              if (v15 >= 0x201) {
                NSZoneFree(0, v20);
              }
            }
            else
            {
              uint64_t v12 = NSSet_EmptySet;
            }
            if (v16)
            {
              MEMORY[0x1F4188790](v17);
              unint64_t v27 = (char *)v37 - v26;
              if (v16 > 0x200) {
                unint64_t v27 = (char *)NSAllocateScannedUncollectable();
              }
              else {
                bzero((char *)v37 - v26, 8 * v16);
              }
              [(id)v13 getObjects:v27];
              uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v27 count:v16];
              if (v16 >= 0x201) {
                NSZoneFree(0, v27);
              }
            }
            else
            {
              uint64_t v13 = NSSet_EmptySet;
            }
          }
          else
          {
            if (!v13) {
              uint64_t v13 = NSSet_EmptySet;
            }
            if (!v12) {
              uint64_t v12 = NSSet_EmptySet;
            }
          }
          if (([(id)v12 isEqualToSet:v13] & 1) == 0)
          {
            if ([(id)v13 count])
            {
              uint64_t v28 = (void *)[(id)v13 mutableCopy];
              uint64_t v29 = v28;
              if (v28) {
                [v28 minusSet:v12];
              }
            }
            else
            {
              uint64_t v29 = 0;
            }
            if ([(id)v12 count])
            {
              uint64_t v30 = (void *)[(id)v12 mutableCopy];
              uint64_t v31 = v30;
              if (v30) {
                [v30 minusSet:v13];
              }
            }
            else
            {
              uint64_t v31 = 0;
            }
            if ([v31 count]) {
              -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]((uint64_t *)self, a6, a4, 3, v31);
            }
            if ([v29 count]) {
              -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]((uint64_t *)self, a6, a4, 2, v29);
            }
          }
          if (v15) {
            int v32 = v18;
          }
          else {
            int v32 = 0;
          }
          if (v32 == 1) {

          }
          if (v16) {
            int v33 = v18;
          }
          else {
            int v33 = 0;
          }
          if (v33 == 1) {

          }
          break;
        case 2u:
          goto LABEL_23;
        case 3u:
          unint64_t v21 = (uint64_t *)self;
          id v22 = a6;
          id v23 = a4;
          uint64_t v24 = 3;
          uint64_t v25 = (void *)v12;
          goto LABEL_24;
        case 4u:
          -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]((uint64_t *)self, a6, a4, 3, (void *)v12);
LABEL_23:
          unint64_t v21 = (uint64_t *)self;
          id v22 = a6;
          id v23 = a4;
          uint64_t v24 = 2;
          uint64_t v25 = (void *)v13;
LABEL_24:
          -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:](v21, v22, v23, v24, v25);
          break;
        default:
          break;
      }
    }
    else
    {
      -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:]((uint64_t *)self, a6, (uint64_t *)v12, (uint64_t *)v13);
    }
    self->_cd_stateFlags &= ~0x800u;
  }
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)_maintainInverseRelationship:(uint64_t *)a1 forProperty:(void *)a2 oldDestination:(uint64_t *)a3 newDestination:(uint64_t *)a4
{
  if (!a1 || a4 == a3) {
    return;
  }
  uint64_t v8 = (void *)MEMORY[0x18C127630]();
  if (!a3 || a3 != a1 && (a3[2] & 0x800) != 0) {
    goto LABEL_32;
  }
  if (!a2)
  {
    if (([a3 hasChanges] & 1) == 0) {
      _PFFastMOCObjectWillChange(a1[4], a3);
    }
    goto LABEL_32;
  }
  uint64_t v9 = [a2 isToMany];
  uint64_t v10 = [a2 name];
  unint64_t v11 = [a2 _entitysReferenceID];
  uint64_t v12 = [a2 entity];
  uint64_t v13 = (void *)[a3 entity];
  BOOL v14 = v13;
  if (v13 != (void *)v12) {
    unint64_t v11 = [v13 _offsetRelationshipIndex:v11 fromSuperEntity:v12 andIsToMany:v9];
  }
  if (!v9)
  {
    uint64_t v26 = a1[4];
    if (!v26
      || (*(unsigned char *)(v26 + 42) & 4) == 0
      || (!*(void *)(_kvcPropertysPrimitiveGetters(v14) + 8 * v11)
        ? (uint64_t v27 = [a3 _genericValueForKey:v10 withIndex:v11 flags:0])
        : (uint64_t v27 = _NSGetUsingKeyValueGetter()),
          (uint64_t *)v27 == a1))
    {
      uint64_t v30 = _kvcPropertysPublicSetters(v14);
      _PF_Handler_Public_SetProperty((unsigned int *)a3, v11, 0, v10, *(void **)(v30 + 8 * v11));
    }
    goto LABEL_32;
  }
  v56 = a1;
  unint64_t v15 = _PFEntityForManagedObject(a3);
  unint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "propertiesByName"), "valueAtIndex:", v11);
  uint64_t v17 = *(void *)(_kvcPropertysPrimitiveGetters(v15) + 8 * v11);
  LODWORD(v16) = [v16 isOrdered];
  [a3 willAccessValueForKey:v10];
  _PF_Handler_Primitive_GetProperty((id **)a3, v11, v10, v17, v18, v19, v20, v21);
  id v23 = v22;
  if (!v16)
  {
    if (v22)
    {
      int v28 = [v22 containsObject:a1];
      [a3 didAccessValueForKey:v10];
      if (!v28) {
        goto LABEL_32;
      }
      uint64_t v29 = *(void *)(_kvcPropertysPublicRelationshipMutators(v15) + 8 * v11);
      if (v29)
      {
        if (*(void *)(v29 + 16))
        {
LABEL_27:
          method_invoke();
          goto LABEL_32;
        }
        uint64_t v54 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v56 count:1];
        goto LABEL_62;
      }
      uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v56 count:1];
      [a3 willChangeValueForKey:v10 withSetMutation:2 usingObjects:v52];
      [v23 removeObject:v56];
      [a3 didChangeValueForKey:v10 withSetMutation:2 usingObjects:v52];
LABEL_56:

      goto LABEL_32;
    }
LABEL_28:
    [a3 didAccessValueForKey:v10];
    goto LABEL_32;
  }
  if (!v22) {
    goto LABEL_28;
  }
  uint64_t v24 = [v22 indexOfObject:a1];
  [a3 didAccessValueForKey:v10];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_32;
  }
  uint64_t v25 = *(void *)(_kvcPropertysPublicRelationshipMutators(v15) + 8 * v11);
  if (!v25)
  {
    uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v24];
    [a3 willChange:3 valuesAtIndexes:v52 forKey:v10];
    [v23 removeObjectAtIndex:v24];
    [a3 didChange:3 valuesAtIndexes:v52 forKey:v10];
    goto LABEL_56;
  }
  if (*(void *)(v25 + 16)) {
    goto LABEL_27;
  }
  uint64_t v54 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v24];
LABEL_62:
  uint64_t v55 = (void *)v54;
  method_invoke();

LABEL_32:
  if (a4 && (a4 == a1 || (a4[2] & 0x800) == 0))
  {
    if (!a2)
    {
      _PFFastMOCObjectWillChange(a1[4], a4);
      goto LABEL_46;
    }
    uint64_t v31 = [a2 isToMany];
    uint64_t v32 = [a2 name];
    unint64_t v33 = [a2 _entitysReferenceID];
    uint64_t v34 = [a2 entity];
    uint64_t v35 = (void *)[a4 entity];
    uint64_t v36 = v35;
    if (v35 != (void *)v34) {
      unint64_t v33 = [v35 _offsetRelationshipIndex:v33 fromSuperEntity:v34 andIsToMany:v31];
    }
    if (!v31)
    {
      uint64_t v48 = _kvcPropertysPublicSetters(v36);
      _PF_Handler_Public_SetProperty((unsigned int *)a4, v33, a1, v32, *(void **)(v48 + 8 * v33));
      goto LABEL_46;
    }
    v56 = a1;
    id v37 = _PFEntityForManagedObject(a4);
    uint64_t v38 = *(void *)(_kvcPropertysPrimitiveGetters(v37) + 8 * v33);
    int v39 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "propertiesByName"), "valueAtIndex:", v33), "isOrdered");
    [a4 willAccessValueForKey:v32];
    _PF_Handler_Primitive_GetProperty((id **)a4, v33, v32, v38, v40, v41, v42, v43);
    uint64_t v45 = v44;
    [a4 didAccessValueForKey:v32];
    if (([v45 containsObject:a1] & 1) == 0)
    {
      if (v39)
      {
        uint64_t v46 = [v45 count];
        uint64_t v47 = *(void *)(_kvcPropertysPublicRelationshipMutators(v37) + 8 * v33);
        if (!v47)
        {
          uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v46];
          [a4 willChange:2 valuesAtIndexes:v50 forKey:v32];
          [v45 addObject:a1];
          [a4 didChange:2 valuesAtIndexes:v50 forKey:v32];

          goto LABEL_46;
        }
        if (*(void *)(v47 + 8)) {
          goto LABEL_43;
        }
        uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v46];
        uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v56 count:1];
        method_invoke();
      }
      else
      {
        uint64_t v49 = *(void *)(_kvcPropertysPublicRelationshipMutators(v37) + 8 * v33);
        if (v49)
        {
          if (*(void *)(v49 + 8))
          {
LABEL_43:
            method_invoke();
            goto LABEL_46;
          }
          uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v56 count:1];
          method_invoke();
        }
        else
        {
          uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v56 count:1];
          [a4 willChangeValueForKey:v32 withSetMutation:1 usingObjects:v51];
          [v45 addObject:v56];
          [a4 didChangeValueForKey:v32 withSetMutation:1 usingObjects:v51];
        }
      }
    }
  }
LABEL_46:
}

- (void)_setGenericValue:(id)a3 forKey:(id)a4 withIndex:(int64_t)a5 flags:(int64_t)a6
{
  if (a6) {
    _sharedIMPL_setvfk_core((char **)self, (uint64_t)a2, a3, a5);
  }
  else {
    _sharedIMPL_setPvfk_core((char **)self, (uint64_t)a2, a3, a5);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class Class = object_getClass(self);

  return class_respondsToSelector(Class, a3);
}

- (void)_maintainInverseRelationship:(void *)a3 forProperty:(uint64_t)a4 forChange:(void *)a5 onSet:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v10 = [a5 count];
    if (v10)
    {
      unint64_t v11 = v10;
      if (v10 >= 0x201) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v10;
      }
      unint64_t v13 = (8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0;
      BOOL v14 = (char *)v21 - v13;
      if (v10 > 0x200) {
        BOOL v14 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v21 - v13, 8 * v10);
      }
      [a5 getObjects:v14];
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3B8];
        uint64_t v20 = [NSString stringWithFormat:@"Insufficient information to maintain inverse relationship \"%@\" for relationship: %@.", objc_msgSend(a2, "name"), objc_msgSend(a3, "name")];
        objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(a3, "name"), @"key", objc_msgSend(a2, "name"), @"inverse", 0)));
      }
      for (uint64_t i = 0; i != v11; ++i)
      {
        unint64_t v16 = *(uint64_t **)&v14[8 * i];
        if (a4 == 2)
        {
          uint64_t v17 = 0;
        }
        else
        {
          uint64_t v17 = *(uint64_t **)&v14[8 * i];
          unint64_t v16 = 0;
        }
        -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:](a1, a2, v17, v16);
      }
      if (v11 >= 0x201) {
        NSZoneFree(0, v14);
      }
    }
  }
}

- (void)willChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  unint64_t v10 = (id *)_PFEntityForManagedObject(self);
  if (v10) {
    unint64_t v11 = [v10[13] indexForKey:inKey];
  }
  else {
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  _PF_ManagedObject_WillChangeValueForKeywithSetMutation(self, (uint64_t)a2, (uint64_t)inKey, inMutationKind, (uint64_t)inObjects, v11);
}

- (void)didChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }

  _PF_ManagedObject_DidChangeValueForKeywithSetMutation((uint64_t)self, (uint64_t)a2, (uint64_t)inKey);
}

+ (void)initialize
{
  self;
  if (objc_getClass("NSManagedObject") == a1 && qword_1EB270640 == 0)
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    off_1EB270648 = class_getMethodImplementation(v4, sel_willChangeValueForKey_);
    uint64_t v5 = (objc_class *)objc_opt_class();
    _NSObjectDidChangeVFKImp = (uint64_t (*)(void, void, void))class_getMethodImplementation(v5, sel_didChangeValueForKey_);
    unint64_t v6 = (objc_class *)objc_opt_class();
    off_1EB270650 = class_getMethodImplementation(v6, sel_willChangeValueForKey_withSetMutation_usingObjects_);
    uint64_t v7 = (objc_class *)objc_opt_class();
    _NSObjectDidChangeForKeywithSetMutationImp = (uint64_t (*)(void, void, void))class_getMethodImplementation(v7, sel_didChangeValueForKey_withSetMutation_usingObjects_);
    uint64_t v8 = (objc_class *)objc_opt_class();
    off_1EB270658 = class_getMethodImplementation(v8, sel_willChange_valuesAtIndexes_forKey_);
    uint64_t v9 = (objc_class *)objc_opt_class();
    off_1EB270660 = class_getMethodImplementation(v9, sel_didChange_valuesAtIndexes_forKey_);
    unint64_t v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      unint64_t v10 = malloc_default_zone();
    }
    size_t InstanceSize = class_getInstanceSize((Class)a1);
    qword_1EB270640 = (uint64_t)malloc_type_zone_calloc(v10, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0x66599487uLL);
    object_setClass((id)qword_1EB270640, (Class)a1);
    uint64_t v12 = qword_1EB270640;
    *(_DWORD *)(qword_1EB270640 + 16) |= 0x100000u;
    *(_DWORD *)(v12 + 8) = 0x20000000;
    _MergedGlobals_72 = 1;
    objc_opt_class();
  }
}

- (BOOL)validateForInsert:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ([_PFEntityForManagedObject(self) _skipValidation]) {
    return 1;
  }

  return -[NSManagedObject _validateForSave:](self, error);
}

- (void)willSave
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (BOOL)validateForUpdate:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ([_PFEntityForManagedObject(self) _skipValidation]) {
    return 1;
  }

  return -[NSManagedObject _validateForSave:](self, error);
}

- (BOOL)validateForDelete:(NSError *)error
{
  v75[1] = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ([_PFEntityForManagedObject(self) _skipValidation]) {
    return 1;
  }
  if ((self->_cd_stateFlags & 0x8000) != 0) {
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, self, (uint64_t)self->_cd_managedObjectContext);
  }
  uint64_t v5 = _PFEntityForManagedObject(self);
  if (!v5)
  {
    BOOL result = _kvcPropertysPrimitiveGetters(0);
    __break(1u);
    return result;
  }
  unint64_t v6 = v5;
  uint64_t v7 = v5[14];
  uint64_t v8 = *(void *)(v5[13] + 40);
  uint64_t v55 = _kvcPropertysPrimitiveGetters(v5);
  uint64_t v9 = v6[12];
  IMP v65 = 0;
  unint64_t v11 = *(void *)(v7 + 32);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v12 = v10 + v11;
  if (v11 >= v10 + v11) {
    return 1;
  }
  uint64_t v56 = v9 + 24;
  uint64_t v13 = *MEMORY[0x1E4F281F8];
  uint64_t v52 = error;
  uint64_t v53 = v13;
  BOOL v14 = 1;
  uint64_t v51 = v8;
  do
  {
    uint64_t v15 = *(void *)(v8 + 8 * v11);
    unint64_t v16 = *(void **)(v56 + 8 * v11);
    if (![v16 deleteRule]) {
      goto LABEL_34;
    }
    _PF_Handler_Primitive_GetProperty((id **)self, v11, v15, *(void *)(v55 + 8 * v11), v17, v18, v19, v20);
    if (!v21) {
      goto LABEL_34;
    }
    id v22 = v21;
    if ([v16 isToMany])
    {
      uint64_t v23 = [v22 count];
      if (!v23) {
        goto LABEL_34;
      }
      unint64_t v24 = v23;
      unint64_t v25 = MEMORY[0x1F4188790](v23);
      uint64_t v27 = (char *)&v49 - v26;
      uint64_t v54 = v28;
      if (v25 > 0x200) {
        uint64_t v27 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v49 - v26, 8 * v25);
      }
      [v22 getObjects:v27];
      uint64_t v31 = 0;
      while (([*(id *)&v27[8 * v31] isDeleted] & 1) != 0)
      {
        if (v24 == ++v31)
        {
          error = v52;
          goto LABEL_31;
        }
      }
      error = v52;
      if (v52)
      {
        v74 = @"NSValidationErrorShouldAttemptRecoveryKey";
        v75[0] = [NSNumber numberWithBool:1];
        uint64_t v32 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)self, 1600, 0, v15, (uint64_t)v22, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1]);
        -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](self, v32, (uint64_t *)&v65);
        unint64_t v33 = [(NSError *)v65 domain];
        if ([(NSString *)v33 isEqualToString:v53])
        {
          if ([(NSError *)v65 code] == 1560
            && ![(NSDictionary *)[(NSError *)v65 userInfo] objectForKey:@"NSValidationErrorShouldAttemptRecoveryKey"])
          {
            id v41 = [(NSDictionary *)[(NSError *)v65 userInfo] objectForKey:@"NSDetailedErrors"];
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id v50 = v41;
            uint64_t v42 = [v41 countByEnumeratingWithState:&v61 objects:v73 count:16];
            if (!v42)
            {
LABEL_53:
              uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
              v71[0] = @"NSDetailedErrors";
              v71[1] = @"NSValidationErrorShouldAttemptRecoveryKey";
              v72[0] = v50;
              v72[1] = MEMORY[0x1E4F1CC38];
              uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
              BOOL v14 = 0;
              IMP v65 = (NSError *)[v46 errorWithDomain:v53 code:1560 userInfo:v47];
LABEL_31:
              if (v24 >= 0x201) {
                NSZoneFree(0, v27);
              }
              uint64_t v8 = v51;
              if (error == 0 && !v14) {
                return 0;
              }
              goto LABEL_34;
            }
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v62;
LABEL_47:
            uint64_t v45 = 0;
            while (1)
            {
              if (*(void *)v62 != v44) {
                objc_enumerationMutation(v50);
              }
              if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * v45), "userInfo"), "objectForKey:", @"NSValidationErrorShouldAttemptRecoveryKey"), "BOOLValue"))break; {
              if (v43 == ++v45)
              }
              {
                uint64_t v43 = [v50 countByEnumeratingWithState:&v61 objects:v73 count:16];
                if (v43) {
                  goto LABEL_47;
                }
                goto LABEL_53;
              }
            }
          }
        }
      }
      BOOL v14 = 0;
      goto LABEL_31;
    }
    if ([v22 isDeleted]) {
      goto LABEL_34;
    }
    if (!error) {
      return 0;
    }
    unint64_t v69 = @"NSValidationErrorShouldAttemptRecoveryKey";
    uint64_t v70 = [NSNumber numberWithBool:1];
    uint64_t v29 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)self, 1600, 0, v15, (uint64_t)v22, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1]);
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](self, v29, (uint64_t *)&v65);
    uint64_t v30 = [(NSError *)v65 domain];
    if (![(NSString *)v30 isEqualToString:v53]
      || [(NSError *)v65 code] != 1560
      || [(NSDictionary *)[(NSError *)v65 userInfo] objectForKey:@"NSValidationErrorShouldAttemptRecoveryKey"])
    {
      goto LABEL_20;
    }
    id v34 = [(NSDictionary *)[(NSError *)v65 userInfo] objectForKey:@"NSDetailedErrors"];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v58;
LABEL_38:
      uint64_t v38 = 0;
      while (1)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * v38), "userInfo"), "objectForKey:", @"NSValidationErrorShouldAttemptRecoveryKey"), "BOOLValue"))break; {
        if (v36 == ++v38)
        }
        {
          uint64_t v36 = [v34 countByEnumeratingWithState:&v57 objects:v68 count:16];
          if (v36) {
            goto LABEL_38;
          }
          goto LABEL_44;
        }
      }
LABEL_20:
      BOOL v14 = 0;
      goto LABEL_34;
    }
LABEL_44:
    int v39 = (void *)MEMORY[0x1E4F28C58];
    v66[0] = @"NSDetailedErrors";
    v66[1] = @"NSValidationErrorShouldAttemptRecoveryKey";
    v67[0] = v34;
    v67[1] = MEMORY[0x1E4F1CC38];
    uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
    BOOL v14 = 0;
    IMP v65 = (NSError *)[v39 errorWithDomain:v53 code:1560 userInfo:v40];
LABEL_34:
    ++v11;
  }
  while (v11 != v12);
  if (error != 0 && !v14)
  {
    BOOL v14 = 0;
    *error = v65;
  }
  return v14;
}

- (NSDictionary)changedValuesForCurrentEvent
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ((self->_cd_stateFlags & 0x8000) != 0) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  cd_extras = self->_cd_extras;
  if (!cd_extras || !cd_extras->var3 && !cd_extras->var2) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  uint64_t v4 = NSDictionary_EmptyDictionary;
  uint64_t v5 = _PFEntityForManagedObject(self);
  unint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = v5[13];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v7];
  uint64_t v10 = _kvcPropertysPrimitiveGetters(v6);
  uint64_t v37 = (NSDictionary *)v4;
  if (v6) {
    uint64_t v11 = v6[14];
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = NSKeyValueCoding_NullValue;
  uint64_t v13 = self->_cd_extras;
  if (v13)
  {
    id var3 = v13->var3;
    if (!var3) {
      id var3 = v13->var2;
    }
  }
  else
  {
    id var3 = 0;
  }
  uint64_t v15 = [var3 values];
  uint64_t v38 = v9;
  uint64_t v41 = [(NSKnownKeysDictionary *)v9 values];
  uint64_t v20 = 0;
  uint64_t v39 = v11;
  do
  {
    uint64_t v21 = (unint64_t *)(v11 + 16 * dword_18AE54160[v20]);
    unint64_t v23 = *v21;
    unint64_t v22 = v21[1];
    if (*v21 < v22 + *v21)
    {
      do
      {
        if (*(void *)(v15 + 8 * v23) == v12) {
          unint64_t v24 = 0;
        }
        else {
          unint64_t v24 = *(void **)(v15 + 8 * v23);
        }
        _PF_Handler_Primitive_GetProperty((id **)self, v23, 0, *(void *)(v10 + 8 * v23), v16, v17, v18, v19);
        if (v24 != v25
          && ([*(id *)(v6[12] + 24 + 8 * v23) _epsilonEquals:v25 rhs:v24 withFlags:1] & 1) == 0)
        {
          id v26 = (id)v12;
          if (v24) {
            id v26 = v24;
          }
          *(void *)(v41 + 8 * v23) = v26;
        }
        ++v23;
        --v22;
      }
      while (v22);
    }
    ++v20;
    uint64_t v11 = v39;
  }
  while (v20 != 3);
  char v27 = 0;
  uint64_t v28 = 3;
  do
  {
    char v40 = v27;
    uint64_t v29 = (unint64_t *)(v39 + 16 * dword_18AE54160[v28]);
    unint64_t v31 = *v29;
    unint64_t v30 = v29[1];
    if (*v29 < v30 + *v29)
    {
      do
      {
        if (*(void *)(v15 + 8 * v31) == v12) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = *(void **)(v15 + 8 * v31);
        }
        _PF_Handler_Primitive_GetProperty((id **)self, v31, 0, *(void *)(v10 + 8 * v31), v16, v17, v18, v19);
        id v34 = v33;
        int v35 = [v32 isFault];
        if ((v35 & [v34 isFault] & 1) == 0
          && v32 != v34
          && ([v34 isEqual:v32] & 1) == 0)
        {
          uint64_t v36 = v12;
          if (v32) {
            uint64_t v36 = [v32 copy];
          }
          *(void *)(v41 + 8 * v31) = v36;
        }
        ++v31;
        --v30;
      }
      while (v30);
    }
    char v27 = 1;
    uint64_t v28 = 4;
  }
  while ((v40 & 1) == 0);
  if ([(NSKnownKeysDictionary *)v38 count])
  {
    return (NSDictionary *)v38;
  }
  else
  {

    return v37;
  }
}

- (NSUInteger)faultingState
{
  return ((unint64_t)self->_cd_stateFlags >> 15) & 7;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  uint64_t v300 = *MEMORY[0x1E4F143B8];
  Name = sel_getName(a3);
  uint64_t v6 = [a1 _PFMOClassFactoryData];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void **)(v6 + 8);
    if (v8)
    {
      id v263 = a1;
      SEL v258 = a3;
      int v9 = strncmp(Name, "managedObjectOriginal_", 0x16uLL);
      uint64_t v10 = (void *)v8[13];
      if (v9) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 22;
      }
      uint64_t v12 = &Name[v11];
      long long v298 = 0u;
      long long v299 = 0u;
      long long v296 = 0u;
      long long v297 = 0u;
      long long v294 = 0u;
      long long v295 = 0u;
      long long v292 = 0u;
      long long v293 = 0u;
      long long v290 = 0u;
      long long v291 = 0u;
      long long v288 = 0u;
      long long v289 = 0u;
      long long v286 = 0u;
      long long v287 = 0u;
      long long v284 = 0u;
      long long v285 = 0u;
      long long v282 = 0u;
      long long v283 = 0u;
      long long v280 = 0u;
      long long v281 = 0u;
      long long v278 = 0u;
      long long v279 = 0u;
      long long v276 = 0u;
      long long v277 = 0u;
      long long v274 = 0u;
      long long v275 = 0u;
      long long v272 = 0u;
      long long v273 = 0u;
      long long v270 = 0u;
      long long v271 = 0u;
      long long v268 = 0u;
      long long v269 = 0u;
      CFAllocatorRef v13 = _PFStackAllocatorCreate((unint64_t *)&v268, 1024);
      size_t v14 = strlen(v12);
      size_t v15 = v14 + 100;
      MEMORY[0x1F4188790](v14);
      v259 = (__CFString **)((char *)&v256 - v16);
      CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
      CFStringRef v18 = CFStringCreateWithCStringNoCopy(v13, v12, 0x600u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
      id v261 = v10;
      CFStringRef v262 = v18;
      uint64_t v19 = [v10 indexForKey:v18];
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v14 < 5) {
          goto LABEL_273;
        }
        if (v14 < 0xE)
        {
          if (v14 < 0xA)
          {
            v260 = &v256;
            int v65 = 0;
            goto LABEL_66;
          }
        }
        else if (!strncmp("setPrimitive", v12, 0xCuLL))
        {
          if (*((void *)&v269 + 1))
          {
            if (v262) {
              CFRelease(v262);
            }
          }
          else
          {
            *((void *)&v268 + 1) = v268;
          }
          IMP v88 = (const char *)v259;
          strlcpy((char *)v259, v12 + 12, v15);
          v88[v14 - 13] = 0;
          CFStringRef v89 = CFStringCreateWithCStringNoCopy(v13, v88, 0x600u, v17);
          id v90 = v261;
          CFStringRef v262 = v89;
          uint64_t v91 = objc_msgSend(v261, "indexForKey:");
          if (v91 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_208;
          }
          if (*((void *)&v269 + 1))
          {
            if (v262) {
              CFRelease(v262);
            }
          }
          else
          {
            *((void *)&v268 + 1) = v268;
          }
          v157 = (char *)v259;
          char *v157 = __tolower(*(char *)v259);
          CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v157, 0x600u, v17);
          uint64_t v91 = objc_msgSend(v90, "indexForKey:");
          if (v91 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_208:
            unint64_t v20 = v91;
            id v21 = v263;
            if ((_MergedGlobals_73 & 1) == 0) {
              [v263 _initializePrimitiveAccessorStubs];
            }
            unint64_t v69 = 0;
            int v257 = 0;
            LODWORD(v261) = 0;
            unint64_t v67 = 0;
            uint64_t v72 = qword_1EB270698;
            int v71 = 1;
            goto LABEL_320;
          }
          goto LABEL_273;
        }
        if (!strncmp("primitive", v12, 9uLL))
        {
          if (*((void *)&v269 + 1))
          {
            if (v262) {
              CFRelease(v262);
            }
          }
          else
          {
            *((void *)&v268 + 1) = v268;
          }
          uint64_t v84 = (const char *)v259;
          strlcpy((char *)v259, v12 + 9, v15);
          CFStringRef v85 = CFStringCreateWithCStringNoCopy(v13, v84, 0x600u, v17);
          id v86 = v261;
          CFStringRef v262 = v85;
          uint64_t v87 = objc_msgSend(v261, "indexForKey:");
          if (v87 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_194;
          }
          if (*((void *)&v269 + 1))
          {
            if (v262) {
              CFRelease(v262);
            }
          }
          else
          {
            *((void *)&v268 + 1) = v268;
          }
          uint64_t v152 = (char *)v259;
          *uint64_t v152 = __tolower(*(char *)v259);
          CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v152, 0x600u, v17);
          uint64_t v87 = objc_msgSend(v86, "indexForKey:");
          if (v87 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_194:
            unint64_t v20 = v87;
            id v21 = v263;
            if ((byte_1EB270669 & 1) == 0) {
              [v263 _initializeAccessorStubs];
            }
            unint64_t v69 = 0;
            int v257 = 0;
            LODWORD(v261) = 0;
            unint64_t v67 = 0;
            BOOL v70 = 0;
            uint64_t v72 = qword_1EB2706A0;
            int v71 = 1;
            goto LABEL_276;
          }
          goto LABEL_273;
        }
        v260 = &v256;
        int v65 = 1;
LABEL_66:
        if (strncmp("set", v12, 3uLL))
        {
          if (strncmp("add", v12, 3uLL))
          {
            if (v14 < 8) {
              goto LABEL_200;
            }
            if (strncmp("remove", v12, 6uLL))
            {
              if (v14 < 0x12)
              {
                if (v14 < 0x10) {
                  goto LABEL_200;
                }
              }
              else
              {
                if (!strncmp("insert", v12, 6uLL))
                {
                  if (v14 < 0x18 || strncmp("insertObject:in", v12, 0xFuLL) || strncmp("AtIndex:", &v12[v14 - 8], 8uLL))
                  {
                    if (!strncmp(":atIndexes:", &v12[v14 - 11], 0xBuLL))
                    {
                      if (*((void *)&v269 + 1))
                      {
                        if (v262) {
                          CFRelease(v262);
                        }
                      }
                      else
                      {
                        *((void *)&v268 + 1) = v268;
                      }
                      long long v226 = (const char *)v259;
                      strlcpy((char *)v259, v12 + 6, v15);
                      v226[v14 - 17] = 0;
                      CFStringRef v227 = CFStringCreateWithCStringNoCopy(v13, v226, 0x600u, v17);
                      id v228 = v261;
                      CFStringRef v262 = v227;
                      uint64_t v229 = objc_msgSend(v261, "indexForKey:");
                      if (v229 != 0x7FFFFFFFFFFFFFFFLL) {
                        goto LABEL_407;
                      }
                      if (*((void *)&v269 + 1))
                      {
                        if (v262) {
                          CFRelease(v262);
                        }
                      }
                      else
                      {
                        *((void *)&v268 + 1) = v268;
                      }
                      long long v238 = (char *)v259;
                      *long long v238 = __tolower(*(char *)v259);
                      CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v238, 0x600u, v17);
                      uint64_t v229 = objc_msgSend(v228, "indexForKey:");
                      if (v229 != 0x7FFFFFFFFFFFFFFFLL)
                      {
LABEL_407:
                        unint64_t v20 = v229;
                        int v257 = 0;
                        LODWORD(v261) = 0;
                        uint64_t v72 = 0;
                        int v71 = 0;
                        BOOL v70 = 1;
                        unint64_t v67 = _sharedIMPL_insertOrderedSetAtIndexes_core;
                        unint64_t v69 = "v@:@@";
                        goto LABEL_275;
                      }
                    }
                    goto LABEL_273;
                  }
                  if (*((void *)&v269 + 1))
                  {
                    if (v262) {
                      CFRelease(v262);
                    }
                  }
                  else
                  {
                    *((void *)&v268 + 1) = v268;
                  }
                  long long v244 = (const char *)v259;
                  strlcpy((char *)v259, v12 + 15, v15);
                  v244[v14 - 23] = 0;
                  CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v244, 0x600u, v17);
                  uint64_t v245 = objc_msgSend(v261, "indexForKey:");
                  if (v245 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_443;
                  }
                  if (*((void *)&v269 + 1))
                  {
                    if (v262) {
                      CFRelease(v262);
                    }
                  }
                  else
                  {
                    *((void *)&v268 + 1) = v268;
                  }
                  long long v248 = (char *)v259;
                  *long long v248 = __tolower(*(char *)v259);
                  CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v248, 0x600u, v17);
                  uint64_t v245 = objc_msgSend(v261, "indexForKey:");
                  if (v245 != 0x7FFFFFFFFFFFFFFFLL)
                  {
LABEL_443:
                    unint64_t v20 = v245;
                    int v257 = 0;
                    LODWORD(v261) = 0;
                    uint64_t v72 = 0;
                    int v71 = 0;
                    BOOL v70 = 1;
                    unint64_t v67 = _sharedIMPL_insertObjectToOrderedSetAtIndex_core;
                    unint64_t v69 = "v@:@Q";
                    goto LABEL_275;
                  }
                  goto LABEL_451;
                }
                if (v14 >= 0x17 && !strncmp("replace", v12, 7uLL))
                {
                  if (v14 < 0x23
                    || strncmp("replaceObjectIn", v12, 0xFuLL)
                    || strncmp("AtIndex:withObject:", &v12[v14 - 19], 0x13uLL))
                  {
                    IMP v66 = v260;
                    if (v12[v14 - 1] == 58)
                    {
                      unint64_t v67 = strnstr(v12, "AtIndexes:with", v14);
                      if (v67)
                      {
                        v260 = v66;
                        if (*((void *)&v269 + 1))
                        {
                          if (v262) {
                            CFRelease(v262);
                          }
                        }
                        else
                        {
                          *((void *)&v268 + 1) = v268;
                        }
                        long long v240 = (const char *)v259;
                        strlcpy((char *)v259, v12 + 7, v15);
                        v240[&v12[v14] - v67 - 15] = 0;
                        CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v240, 0x600u, v17);
                        uint64_t v241 = objc_msgSend(v261, "indexForKey:");
                        if (v241 == 0x7FFFFFFFFFFFFFFFLL)
                        {
                          if (*((void *)&v269 + 1))
                          {
                            if (v262) {
                              CFRelease(v262);
                            }
                          }
                          else
                          {
                            *((void *)&v268 + 1) = v268;
                          }
                          long long v246 = (char *)v259;
                          *long long v246 = __tolower(*(char *)v259);
                          CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v246, 0x600u, v17);
                          uint64_t v241 = objc_msgSend(v261, "indexForKey:");
                        }
                        unint64_t v20 = v241;
                        int v257 = 0;
                        LODWORD(v261) = 0;
                        uint64_t v72 = 0;
                        int v71 = 0;
                        BOOL v70 = v241 != 0x7FFFFFFFFFFFFFFFLL;
                        if (v241 == 0x7FFFFFFFFFFFFFFFLL) {
                          unint64_t v69 = 0;
                        }
                        else {
                          unint64_t v69 = "v@:@@";
                        }
                        if (v241 == 0x7FFFFFFFFFFFFFFFLL) {
                          unint64_t v67 = 0;
                        }
                        else {
                          unint64_t v67 = _sharedIMPL_replaceOrderedSetAtIndexes_core;
                        }
                        goto LABEL_275;
                      }
                      unint64_t v69 = 0;
                      int v257 = 0;
                      LODWORD(v261) = 0;
                      goto LABEL_274;
                    }
LABEL_273:
                    unint64_t v69 = 0;
                    int v257 = 0;
                    LODWORD(v261) = 0;
                    unint64_t v67 = 0;
LABEL_274:
                    uint64_t v72 = 0;
                    int v71 = 0;
                    BOOL v70 = 0;
                    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_275:
                    id v21 = v263;
                    goto LABEL_276;
                  }
                  if (*((void *)&v269 + 1))
                  {
                    if (v262) {
                      CFRelease(v262);
                    }
                  }
                  else
                  {
                    *((void *)&v268 + 1) = v268;
                  }
                  long long v249 = (const char *)v259;
                  strlcpy((char *)v259, v12 + 15, v15);
                  v249[v14 - 34] = 0;
                  CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v249, 0x600u, v17);
                  uint64_t v250 = objc_msgSend(v261, "indexForKey:");
                  if (v250 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_452;
                  }
                  if (*((void *)&v269 + 1))
                  {
                    if (v262) {
                      CFRelease(v262);
                    }
                  }
                  else
                  {
                    *((void *)&v268 + 1) = v268;
                  }
                  long long v251 = (char *)v259;
                  *long long v251 = __tolower(*(char *)v259);
                  CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v251, 0x600u, v17);
                  uint64_t v250 = objc_msgSend(v261, "indexForKey:");
                  if (v250 != 0x7FFFFFFFFFFFFFFFLL)
                  {
LABEL_452:
                    unint64_t v20 = v250;
                    int v257 = 0;
                    LODWORD(v261) = 0;
                    uint64_t v72 = 0;
                    int v71 = 0;
                    BOOL v70 = 1;
                    unint64_t v67 = _sharedIMPL_replaceObjectInOrderedSetAtIndex_core;
                    unint64_t v69 = "v@:Q@";
                    goto LABEL_275;
                  }
LABEL_451:
                  unint64_t v69 = 0;
                  int v257 = 0;
                  LODWORD(v261) = 0;
                  unint64_t v67 = 0;
                  uint64_t v72 = 0;
                  int v71 = 0;
                  BOOL v70 = 0;
                  unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_275;
                }
              }
              if (!strncmp("validate", v12, 8uLL) && !strncmp(":error:", &v12[v14 - 7], 7uLL))
              {
                if (*((void *)&v269 + 1))
                {
                  if (v262) {
                    CFRelease(v262);
                  }
                }
                else
                {
                  *((void *)&v268 + 1) = v268;
                }
                long long v223 = (const char *)v259;
                strlcpy((char *)v259, v12 + 8, v15);
                v223[v14 - 15] = 0;
                CFStringRef v224 = CFStringCreateWithCStringNoCopy(v13, v223, 0x600u, v17);
                id v225 = v261;
                CFStringRef v262 = v224;
                if (objc_msgSend(v261, "indexForKey:") != 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_397;
                }
                if (*((void *)&v269 + 1))
                {
                  if (v262) {
                    CFRelease(v262);
                  }
                }
                else
                {
                  *((void *)&v268 + 1) = v268;
                }
                long long v234 = (char *)v259;
                *long long v234 = __tolower(*(char *)v259);
                CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v234, 0x600u, v17);
                unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
                if (objc_msgSend(v225, "indexForKey:") != 0x7FFFFFFFFFFFFFFFLL)
                {
LABEL_397:
                  long long v235 = (objc_class *)v263;
                  if (*((void *)&v269 + 1))
                  {
                    if (v262) {
                      CFRelease(v262);
                    }
                  }
                  else
                  {
                    *((void *)&v268 + 1) = v268;
                  }
                  InstanceMethod = class_getInstanceMethod(v235, sel__defaultValidation_error_);
                  IMP Implementation = method_getImplementation(InstanceMethod);
                  TypeEncoding = method_getTypeEncoding(InstanceMethod);
                  SEL v195 = v235;
                  IMP v196 = v258;
                  Accessor = Implementation;
                  goto LABEL_292;
                }
                goto LABEL_396;
              }
LABEL_200:
              if (!v65) {
                goto LABEL_451;
              }
              int v153 = strncmp("will", v12, 4uLL);
              if (v153)
              {
                int v154 = strncmp("did", v12, 3uLL);
                uint64_t v155 = v260;
                if (v154) {
                  goto LABEL_273;
                }
                if (!strncmp("Change", v12 + 3, 6uLL))
                {
                  v260 = v155;
                  int v156 = 1;
                }
                else
                {
                  if (strncmp("Access", v12 + 3, 6uLL)) {
                    goto LABEL_273;
                  }
                  v260 = v155;
                  int v156 = 0;
                }
                uint64_t v170 = 9;
              }
              else
              {
                int v158 = strncmp("Change", v12 + 4, 6uLL);
                v159 = v260;
                if (v158)
                {
                  if (strncmp("Access", v12 + 4, 6uLL)) {
                    goto LABEL_273;
                  }
                  v260 = v159;
                  int v156 = 0;
                }
                else
                {
                  int v156 = 1;
                }
                uint64_t v170 = 10;
              }
              if (*((void *)&v269 + 1))
              {
                if (v262) {
                  CFRelease(v262);
                }
              }
              else
              {
                *((void *)&v268 + 1) = v268;
              }
              SEL v187 = &v12[v170];
              v188 = (const char *)v259;
              strlcpy((char *)v259, v187, v15);
              CFStringRef v189 = CFStringCreateWithCStringNoCopy(v13, v188, 0x600u, v17);
              id v190 = v261;
              CFStringRef v262 = v189;
              uint64_t v191 = objc_msgSend(v261, "indexForKey:");
              if (v191 != 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_346;
              }
              if (*((void *)&v269 + 1))
              {
                if (v262) {
                  CFRelease(v262);
                }
              }
              else
              {
                *((void *)&v268 + 1) = v268;
              }
              SEL v208 = (char *)v259;
              *SEL v208 = __tolower(*(char *)v259);
              CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v208, 0x600u, v17);
              uint64_t v191 = objc_msgSend(v190, "indexForKey:");
              unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
              if (v191 != 0x7FFFFFFFFFFFFFFFLL)
              {
LABEL_346:
                uint64_t v209 = v191;
                SEL v210 = (objc_class *)v263;
                if (*((void *)&v269 + 1))
                {
                  if (v262) {
                    CFRelease(v262);
                  }
                }
                else
                {
                  *((void *)&v268 + 1) = v268;
                }
                if (v153)
                {
                  Accessor = (void (*)(void))pf_empty_method_imp;
                  if (!v156)
                  {
LABEL_357:
                    TypeEncoding = "v@:";
                    SEL v195 = v210;
                    goto LABEL_343;
                  }
                  SEL v211 = _sharedIMPL_dcvfk_core;
                }
                else if (v156)
                {
                  SEL v211 = _sharedIMPL_wcvfk_core;
                }
                else
                {
                  SEL v211 = _PF_Handler_WillAccess_Property;
                }
                Accessor = generateAccessor((uint64_t)v211, v209);
                goto LABEL_357;
              }
LABEL_396:
              unint64_t v69 = 0;
              int v257 = 0;
              LODWORD(v261) = 0;
              unint64_t v67 = 0;
              uint64_t v72 = 0;
              int v71 = 0;
              BOOL v70 = 0;
              goto LABEL_275;
            }
            if (v14 < 0xE) {
              goto LABEL_218;
            }
            if (strncmp("Object:", &v12[v14 - 7], 7uLL))
            {
              if (v14 < 0x19)
              {
                if (v14 < 0x11) {
                  goto LABEL_218;
                }
              }
              else if (!strncmp("AtIndex:", &v12[v14 - 8], 8uLL))
              {
                if (!strncmp("removeObjectFrom", v12, 0x10uLL))
                {
                  if (*((void *)&v269 + 1))
                  {
                    if (v262) {
                      CFRelease(v262);
                    }
                  }
                  else
                  {
                    *((void *)&v268 + 1) = v268;
                  }
                  long long v242 = (const char *)v259;
                  strlcpy((char *)v259, v12 + 16, v15);
                  v242[v14 - 24] = 0;
                  CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v242, 0x600u, v17);
                  uint64_t v243 = objc_msgSend(v261, "indexForKey:");
                  if (v243 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_440;
                  }
                  if (*((void *)&v269 + 1))
                  {
                    if (v262) {
                      CFRelease(v262);
                    }
                  }
                  else
                  {
                    *((void *)&v268 + 1) = v268;
                  }
                  long long v247 = (char *)v259;
                  *long long v247 = __tolower(*(char *)v259);
                  CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v247, 0x600u, v17);
                  uint64_t v243 = objc_msgSend(v261, "indexForKey:");
                  if (v243 != 0x7FFFFFFFFFFFFFFFLL)
                  {
LABEL_440:
                    unint64_t v20 = v243;
                    unint64_t v67 = _sharedIMPL_removeObjectFromOrderedSetAtIndex_core;
                    int v257 = 0;
                    LODWORD(v261) = 0;
                    uint64_t v72 = 0;
                    int v71 = 0;
                    BOOL v70 = 1;
                    unint64_t v69 = "v@:Q";
                    goto LABEL_275;
                  }
                }
                goto LABEL_218;
              }
              if (!strncmp("AtIndexes:", &v12[v14 - 10], 0xAuLL))
              {
                if (*((void *)&v269 + 1))
                {
                  if (v262) {
                    CFRelease(v262);
                  }
                }
                else
                {
                  *((void *)&v268 + 1) = v268;
                }
                long long v232 = (const char *)v259;
                strlcpy((char *)v259, v12 + 6, v15);
                v232[v14 - 16] = 0;
                CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v232, 0x600u, v17);
                uint64_t v233 = objc_msgSend(v261, "indexForKey:");
                if (v233 != 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_411;
                }
                if (*((void *)&v269 + 1))
                {
                  if (v262) {
                    CFRelease(v262);
                  }
                }
                else
                {
                  *((void *)&v268 + 1) = v268;
                }
                long long v239 = (char *)v259;
                *long long v239 = __tolower(*(char *)v259);
                CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v239, 0x600u, v17);
                uint64_t v233 = objc_msgSend(v261, "indexForKey:");
                if (v233 != 0x7FFFFFFFFFFFFFFFLL)
                {
LABEL_411:
                  unint64_t v20 = v233;
                  unint64_t v67 = _sharedIMPL_removeOrderedSetAtIndexes_core;
                  unint64_t v69 = 0;
                  int v257 = 0;
                  LODWORD(v261) = 0;
                  uint64_t v72 = 0;
                  int v71 = 0;
LABEL_388:
                  BOOL v70 = 1;
                  goto LABEL_275;
                }
              }
LABEL_218:
              if (*((void *)&v269 + 1))
              {
                if (v262) {
                  CFRelease(v262);
                }
              }
              else
              {
                *((void *)&v268 + 1) = v268;
              }
              long long v166 = (const char *)v259;
              strlcpy((char *)v259, v12 + 6, v15);
              v166[v14 - 7] = 0;
              CFStringRef v167 = CFStringCreateWithCStringNoCopy(v13, v166, 0x600u, v17);
              id v168 = v261;
              CFStringRef v262 = v167;
              uint64_t v169 = objc_msgSend(v261, "indexForKey:");
              if (v169 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (*((void *)&v269 + 1))
                {
                  if (v262) {
                    CFRelease(v262);
                  }
                }
                else
                {
                  *((void *)&v268 + 1) = v268;
                }
                SEL v192 = (char *)v259;
                *SEL v192 = __tolower(*(char *)v259);
                CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v192, 0x600u, v17);
                uint64_t v169 = objc_msgSend(v168, "indexForKey:");
                if (v169 == 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_273;
                }
              }
              unint64_t v20 = v169;
              id v21 = v263;
              int v206 = [*(id *)(v8[12] + 24 + 8 * v169) _isOrdered];
              unint64_t v69 = 0;
              int v257 = 0;
              LODWORD(v261) = 0;
              uint64_t v72 = 0;
              int v71 = 0;
              BOOL v162 = v206 == 0;
              v163 = _sharedIMPL_removeSet_core;
              long long v164 = _sharedIMPL_removeOrderedSet_core;
LABEL_317:
              if (v162) {
                unint64_t v67 = v163;
              }
              else {
                unint64_t v67 = v164;
              }
LABEL_320:
              BOOL v70 = 1;
              goto LABEL_276;
            }
            if (*((void *)&v269 + 1))
            {
              if (v262) {
                CFRelease(v262);
              }
            }
            else
            {
              *((void *)&v268 + 1) = v268;
            }
            uint64_t v217 = (const char *)v259;
            strlcpy((char *)v259, v12 + 6, v15);
            v217[v14 - 13] = 0;
            CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v217, 0x600u, v17);
            uint64_t v218 = objc_msgSend(v261, "indexForKey:");
            if (v218 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (*((void *)&v269 + 1))
              {
                if (v262) {
                  CFRelease(v262);
                }
              }
              else
              {
                *((void *)&v268 + 1) = v268;
              }
              long long v230 = (char *)v259;
              *long long v230 = __tolower(*(char *)v259);
              CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v230, 0x600u, v17);
              unint64_t v20 = objc_msgSend(v261, "indexForKey:");
              if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_218;
              }
            }
            else
            {
              unint64_t v20 = v218;
            }
            int v231 = [*(id *)(v8[12] + 24 + 8 * v20) _isOrdered];
            unint64_t v69 = 0;
            int v257 = 0;
            LODWORD(v261) = 0;
            uint64_t v72 = 0;
            int v71 = 0;
            BOOL v214 = v231 == 0;
            SEL v215 = _sharedIMPL_removeObjectFromSet_core;
            v216 = _sharedIMPL_removeObjectFromOrderedSet_core;
LABEL_385:
            if (v214) {
              unint64_t v67 = v215;
            }
            else {
              unint64_t v67 = v216;
            }
            goto LABEL_388;
          }
          if (v14 >= 0xB && !strncmp("Object:", &v12[v14 - 7], 7uLL))
          {
            if (*((void *)&v269 + 1))
            {
              if (v262) {
                CFRelease(v262);
              }
            }
            else
            {
              *((void *)&v268 + 1) = v268;
            }
            long long v179 = (const char *)v259;
            strlcpy((char *)v259, v12 + 3, v15);
            v179[v14 - 10] = 0;
            CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v179, 0x600u, v17);
            uint64_t v180 = objc_msgSend(v261, "indexForKey:");
            if (v180 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v20 = v180;
LABEL_363:
              int v213 = [*(id *)(v8[12] + 24 + 8 * v20) _isOrdered];
              unint64_t v69 = 0;
              int v257 = 0;
              LODWORD(v261) = 0;
              uint64_t v72 = 0;
              int v71 = 0;
              BOOL v214 = v213 == 0;
              SEL v215 = _sharedIMPL_addObjectToSet_core;
              v216 = _sharedIMPL_addObjectToOrderedSet_core;
              goto LABEL_385;
            }
            if (*((void *)&v269 + 1))
            {
              if (v262) {
                CFRelease(v262);
              }
            }
            else
            {
              *((void *)&v268 + 1) = v268;
            }
            v212 = (char *)v259;
            char *v212 = __tolower(*(char *)v259);
            CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v212, 0x600u, v17);
            unint64_t v20 = objc_msgSend(v261, "indexForKey:");
            if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_363;
            }
          }
          if (*((void *)&v269 + 1))
          {
            if (v262) {
              CFRelease(v262);
            }
          }
          else
          {
            *((void *)&v268 + 1) = v268;
          }
          int v92 = (const char *)v259;
          strlcpy((char *)v259, v12 + 3, v15);
          v92[v14 - 4] = 0;
          CFStringRef v93 = CFStringCreateWithCStringNoCopy(v13, v92, 0x600u, v17);
          id v94 = v261;
          CFStringRef v262 = v93;
          uint64_t v95 = objc_msgSend(v261, "indexForKey:");
          if (v95 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (*((void *)&v269 + 1))
            {
              if (v262) {
                CFRelease(v262);
              }
            }
            else
            {
              *((void *)&v268 + 1) = v268;
            }
            long long v160 = (char *)v259;
            *long long v160 = __tolower(*(char *)v259);
            CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v160, 0x600u, v17);
            uint64_t v95 = objc_msgSend(v94, "indexForKey:");
            if (v95 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_273;
            }
          }
          unint64_t v20 = v95;
          id v21 = v263;
          int v161 = [*(id *)(v8[12] + 24 + 8 * v95) _isOrdered];
          unint64_t v69 = 0;
          int v257 = 0;
          LODWORD(v261) = 0;
          uint64_t v72 = 0;
          int v71 = 0;
          BOOL v162 = v161 == 0;
          v163 = _sharedIMPL_addSet_core;
          long long v164 = _sharedIMPL_addOrderedSet_core;
          goto LABEL_317;
        }
        if (*((void *)&v269 + 1))
        {
          BOOL v68 = v260;
          if (v262) {
            CFRelease(v262);
          }
        }
        else
        {
          *((void *)&v268 + 1) = v268;
          BOOL v68 = v260;
        }
        v73 = (const char *)v259;
        strlcpy((char *)v259, v12 + 3, v15);
        v73[v14 - 4] = 0;
        CFStringRef v74 = CFStringCreateWithCStringNoCopy(v13, v73, 0x600u, v17);
        id v75 = v261;
        CFStringRef v262 = v74;
        uint64_t v76 = objc_msgSend(v261, "indexForKey:");
        if (v76 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (*((void *)&v269 + 1))
          {
            if (v262) {
              CFRelease(v262);
            }
          }
          else
          {
            *((void *)&v268 + 1) = v268;
          }
          v96 = (char *)v259;
          char *v96 = __tolower(*(char *)v259);
          CFStringRef v262 = CFStringCreateWithCStringNoCopy(v13, v96, 0x600u, v17);
          uint64_t v76 = objc_msgSend(v75, "indexForKey:");
          if (v76 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_273;
          }
        }
        unint64_t v20 = v76;
        uint64_t v97 = (objc_class *)objc_opt_class();
        v98 = *(void **)(v8[12] + 24 + 8 * v20);
        int v99 = (void *)v8[14];
        id Property = class_getProperty(v97, (const char *)v259);
        v260 = v68;
        if (Property)
        {
          Attributes = property_getAttributes(Property);
          size_t v102 = strlen(Attributes);
          v256 = (__CFString *)&v256;
          MEMORY[0x1F4188790](v102);
          uint64_t v104 = (char *)&v256 - v103;
          strlcpy((char *)&v256 - v103, Attributes, v105);
          v267 = v104;
          unsigned int v106 = strsep(&v267, ",");
          if (v106)
          {
            uint64_t v107 = v106;
            LODWORD(v261) = 0;
            int v257 = 0;
            char v108 = 1;
            while (1)
            {
              int v109 = *v107;
              if (v109 == 67)
              {
                unint64_t v110 = v99[12];
                BOOL v112 = v20 >= v110;
                unint64_t v111 = v20 - v110;
                BOOL v112 = !v112 || v111 >= v99[13];
                if (!v112
                  || ((v113 = v99[20], BOOL v112 = v20 >= v113, v114 = v20 - v113, v112)
                    ? (BOOL v115 = v114 >= v99[21])
                    : (BOOL v115 = 1),
                      !v115))
                {
                  id v21 = v263;
                  v165 = (objc_class *)objc_opt_class();
                  v255 = class_getName(v165);
                  v254 = (const char *)v259;
                  long long v178 = @"Property '%s' is marked copy on class '%s'.  Cannot generate a copying setter method for NSManagedObject's to-one relationship.";
                  goto LABEL_236;
                }
                char v108 = 0;
                goto LABEL_180;
              }
              if (v109 != 84)
              {
                if (v109 == 87)
                {
                  id v21 = v263;
                  v171 = (objc_class *)objc_opt_class();
                  v255 = class_getName(v171);
                  v254 = (const char *)v259;
                  long long v178 = @"Property '%s' is marked __weak on class '%s'.  Cannot generate a setter method for it.";
                  goto LABEL_236;
                }
                goto LABEL_180;
              }
              int v117 = v107[1];
              BOOL v116 = v107 + 1;
              if (v117 == 64 || (isTypeEncodingObject(v116) & 1) != 0) {
                goto LABEL_180;
              }
              unint64_t v118 = v99[2];
              BOOL v112 = v20 >= v118;
              unint64_t v119 = v20 - v118;
              if (!v112 || v119 >= v99[3])
              {
                id v21 = v263;
                Class v219 = (objc_class *)objc_opt_class();
                v220 = class_getName(v219);
                v254 = v12;
                v255 = v220;
                long long v178 = @"Property '%s' is a scalar type on class '%s'.  Cannot generate a setter method for it.";
                goto LABEL_236;
              }
              uint64_t v120 = [v98 attributeType];
              if (v120 <= 499)
              {
                if (v120 == 100)
                {
                  int v126 = *v116;
                  LODWORD(v261) = 115;
                  if ((v126 | 0x20) != 0x73) {
                    goto LABEL_371;
                  }
                }
                else if (v120 == 200)
                {
                  int v127 = *v116;
                  LODWORD(v261) = 105;
                  unsigned int v128 = v127 - 73;
                  if (v128 > 0x28) {
                    goto LABEL_371;
                  }
                  if (((1 << v128) & 0x900000009) == 0)
                  {
                    if (((1 << v128) & 0x10000000100) == 0) {
                      goto LABEL_371;
                    }
                    CFAllocatorRef v129 = (objc_class *)objc_opt_class();
                    v255 = class_getName(v129);
                    _NSCoreDataLog(2, @"Property '%s' is a 64 bit scalar type on class '%s' that does not match its entity's property's 32 bit scalar type.  Implicit coercion to 32 bits in the database is not recommended.", v130, v131, v132, v133, v134, v135, (uint64_t)v12);
                    LODWORD(v261) = 113;
                    int v257 = 105;
                  }
                }
                else if (v120 != 300 || (int v122 = *v116, LODWORD(v261) = 113, (v122 | 0x20) != 0x71))
                {
LABEL_371:
                  id v21 = v263;
                  v221 = (objc_class *)objc_opt_class();
                  long long v222 = class_getName(v221);
                  v254 = v12;
                  v255 = v222;
                  long long v178 = @"Property '%s' is a scalar type on class '%s' that does not match its Entity's property's scalar type.  Dynamically generated accessors do not support implicit type coercion.  Cannot generate a setter method for it.";
LABEL_236:
                  _NSCoreDataLog(1, (uint64_t)v178, v172, v173, v174, v175, v176, v177, (uint64_t)v254);
                  unint64_t v69 = 0;
                  unint64_t v67 = 0;
                  uint64_t v72 = 0;
                  int v71 = 0;
                  BOOL v70 = 1;
LABEL_246:
                  unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_276;
                }
              }
              else if (v120 > 799)
              {
                if (v120 == 900)
                {
LABEL_172:
                  int v125 = *v116;
                  LODWORD(v261) = 100;
                  if (v125 != 100) {
                    goto LABEL_371;
                  }
                  goto LABEL_180;
                }
                if (v120 != 800) {
                  goto LABEL_371;
                }
                int v123 = *v116;
                LODWORD(v261) = 66;
                unsigned int v124 = v123 - 66;
                if (v124 > 0x21 || ((1 << v124) & 0x200000003) == 0) {
                  goto LABEL_371;
                }
              }
              else
              {
                if (v120 == 500) {
                  goto LABEL_172;
                }
                if (v120 != 600) {
                  goto LABEL_371;
                }
                int v121 = *v116;
                LODWORD(v261) = 102;
                if (v121 != 102) {
                  goto LABEL_371;
                }
              }
LABEL_180:
              uint64_t v107 = strsep(&v267, ",");
              if (!v107) {
                goto LABEL_191;
              }
            }
          }
          int v257 = 0;
          LODWORD(v261) = 0;
          char v108 = 1;
LABEL_191:
          int v137 = v108 & 1;
        }
        else if (v97 == (objc_class *)objc_opt_class())
        {
          LODWORD(v261) = 0;
          int v257 = 0;
          int v137 = 1;
        }
        else
        {
          unint64_t v136 = v99[2];
          int v137 = 1;
          BOOL v112 = v20 >= v136;
          unint64_t v138 = v20 - v136;
          LODWORD(v261) = 0;
          if (v112)
          {
            unint64_t v139 = v99[3];
            int v257 = 0;
            id v21 = v263;
            if (v138 < v139)
            {
              size_t v140 = v14 + 2;
              uint64_t v141 = (char *)malloc_type_calloc(1uLL, v14 + 2, 0x59242B44uLL);
              *uint64_t v141 = 95;
              uint64_t v142 = (const char *)v259;
              strlcat(v141, (const char *)v259, v140);
              if (!class_getInstanceVariable(v97, v142) && !class_getInstanceVariable(v97, v141))
              {
                uint64_t v143 = [v8 name];
                unint64_t v144 = sel_getName(v258);
                v145 = class_getName(v97);
                v254 = v144;
                v255 = v145;
                uint64_t v253 = v143;
                _NSCoreDataLog(2, @"dynamic accessors failed to find @property implementation for '%s' for entity '%@' while resolving selector '%s' on class '%s'.  Did you remember to declare it @dynamic or @synthesized in the @implementation ?", v146, v147, v148, v149, v150, v151, (uint64_t)v259);
              }
              free(v141);
              LODWORD(v261) = 0;
              int v257 = 0;
              int v137 = 1;
            }
            goto LABEL_244;
          }
          int v257 = 0;
        }
        id v21 = v263;
LABEL_244:
        if (objc_msgSend(v98, "isReadOnly", v256))
        {
          v255 = (const char *)[v8 name];
          BOOL v70 = 1;
          _NSCoreDataLog(1, @"Property '%s' is marked readonly on entity '%@'.  Cannot generate a setter method for it.", v181, v182, v183, v184, v185, v186, (uint64_t)v259);
          unint64_t v69 = 0;
          unint64_t v67 = 0;
          uint64_t v72 = 0;
          int v71 = 0;
          goto LABEL_246;
        }
        if (v137)
        {
          if ((byte_1EB270669 & 1) == 0) {
            [v21 _initializeAccessorStubs];
          }
          unint64_t v69 = 0;
          unint64_t v67 = 0;
          int v71 = 0;
          uint64_t v72 = qword_1EB2706A8;
        }
        else
        {
          unint64_t v67 = _sharedIMPL_copying_setvfk_core;
          unint64_t v69 = 0;
          uint64_t v72 = 0;
          int v71 = 0;
        }
        BOOL v70 = 1;
LABEL_276:
        if (*((void *)&v269 + 1))
        {
          if (v262) {
            CFRelease(v262);
          }
        }
        else
        {
          *((void *)&v268 + 1) = v268;
        }
        if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_281;
        }
        SEL v193 = "@@:";
        if (v70) {
          SEL v193 = "v@:@";
        }
        if (!v69) {
          unint64_t v69 = v193;
        }
        if (!strcmp(v69, "v@:Q") || !strcmp(v69, "v@:I") || strlen(v69) >= 5)
        {
          generateAccessorWithFunctionPtrSignature(v69, (uint64_t)v67, v20);
          if (!v6) {
            return v6;
          }
          Accessor = (void (*)(void))v6;
LABEL_291:
          SEL v195 = (objc_class *)v21;
          IMP v196 = v258;
          TypeEncoding = v69;
LABEL_292:
          class_addMethod(v195, v196, Accessor, TypeEncoding);
          LOBYTE(v6) = 1;
          return v6;
        }
        if (v261)
        {
          if (!v70)
          {
            LOBYTE(v267) = (_BYTE)v261;
            strcpy((char *)&v267 + 1, "@:");
            if (v261 <= 0x70u)
            {
              SEL v202 = _sharedIMPL_pvfk_core_c;
              switch((char)v261)
              {
                case 'c':
                  goto LABEL_340;
                case 'd':
                  v264[0] = MEMORY[0x1E4F143A8];
                  v264[1] = 3221225472;
                  v264[2] = __80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_3;
                  v264[3] = &__block_descriptor_40_e8_d16__0_8l;
                  v264[4] = v20;
                  IMP v199 = v264;
                  goto LABEL_327;
                case 'e':
                case 'g':
                case 'h':
                  goto LABEL_281;
                case 'f':
                  SEL v205 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_sharedIMPL_pvfk_core_f;
                  goto LABEL_339;
                case 'i':
                  SEL v205 = _sharedIMPL_pvfk_core_i;
                  goto LABEL_339;
                default:
                  if (v261 != 66) {
                    goto LABEL_281;
                  }
                  goto LABEL_340;
              }
            }
            if (v261 == 113)
            {
              SEL v205 = _sharedIMPL_pvfk_core_q;
              if (v257)
              {
                if (v257 != 105) {
                  goto LABEL_281;
                }
                SEL v205 = _sharedIMPL_pvfk_core_i2q;
              }
            }
            else
            {
              if (v261 != 115) {
                goto LABEL_281;
              }
              SEL v205 = _sharedIMPL_pvfk_core_s;
            }
LABEL_339:
            SEL v202 = v205;
LABEL_340:
            IMP AccessorWithFunctionPtr3 = generateAccessor((uint64_t)v202, v20);
LABEL_341:
            Accessor = AccessorWithFunctionPtr3;
            if (AccessorWithFunctionPtr3)
            {
              TypeEncoding = (const char *)&v267;
              SEL v195 = (objc_class *)v21;
LABEL_343:
              IMP v196 = v258;
              goto LABEL_292;
            }
            goto LABEL_281;
          }
          qmemcpy(&v267, "v@:", 3);
          *(_WORD *)((char *)&v267 + 3) = v261;
          if (v261 <= 0x70u)
          {
            IMP v198 = _sharedIMPL_setvfk_core_c;
            switch((char)v261)
            {
              case 'c':
                goto LABEL_335;
              case 'd':
                IMP v199 = v266;
                v266[0] = MEMORY[0x1E4F143A8];
                v266[1] = 3221225472;
                SEL v200 = &__block_descriptor_40_e11_v24__0_8d16l;
                SEL v201 = __80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke;
                break;
              case 'e':
              case 'g':
              case 'h':
                goto LABEL_281;
              case 'f':
                IMP v199 = v265;
                v265[0] = MEMORY[0x1E4F143A8];
                v265[1] = 3221225472;
                SEL v200 = &__block_descriptor_40_e11_v20__0_8f16l;
                SEL v201 = __80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_2;
                break;
              case 'i':
                SEL v204 = _sharedIMPL_setvfk_core_i;
                goto LABEL_334;
              default:
                if (v261 != 66) {
                  goto LABEL_281;
                }
                goto LABEL_335;
            }
            v199[2] = v201;
            v199[3] = v200;
            v199[4] = v20;
LABEL_327:
            IMP AccessorWithFunctionPtr3 = imp_implementationWithBlock(v199);
            goto LABEL_341;
          }
          if (v261 == 113)
          {
            SEL v204 = _sharedIMPL_setvfk_core_q;
            if (v257)
            {
              if (v257 != 105) {
                goto LABEL_281;
              }
              SEL v204 = _sharedIMPL_setvfk_core_i2q;
            }
LABEL_334:
            IMP v198 = (void *(*)(void *, uint64_t, char, unint64_t))v204;
LABEL_335:
            IMP AccessorWithFunctionPtr3 = generateAccessorWithFunctionPtr3((uint64_t)v198, v20);
            goto LABEL_341;
          }
          if (v261 == 115)
          {
            SEL v204 = _sharedIMPL_setvfk_core_s;
            goto LABEL_334;
          }
        }
        else
        {
          if (v20 <= 0x31 && v72)
          {
            Accessor = *(void (**)(void))(v72 + 8 * v20);
            goto LABEL_291;
          }
          if (v67) {
            IMP AccessorType = generateAccessorWithFunctionPtr3((uint64_t)v67, v20);
          }
          else {
            IMP AccessorType = generateAccessorType(v70, v20, v71);
          }
          Accessor = AccessorType;
          if (AccessorType) {
            goto LABEL_291;
          }
        }
LABEL_281:
        LOBYTE(v6) = 0;
        return v6;
      }
      unint64_t v20 = v19;
      v260 = &v256;
      id v21 = v263;
      if ((byte_1EB270669 & 1) == 0) {
        [v263 _initializeAccessorStubs];
      }
      unint64_t v22 = (objc_class *)objc_opt_class();
      unint64_t v23 = *(void **)(v8[12] + 24 + 8 * v20);
      uint64_t v24 = v8[14];
      unint64_t v25 = class_getProperty(v22, v12);
      if (v25)
      {
        id v26 = property_getAttributes(v25);
        size_t v27 = strlen(v26);
        v259 = &v256;
        MEMORY[0x1F4188790](v27);
        uint64_t v29 = (char *)&v256 - v28;
        strlcpy((char *)&v256 - v28, v26, v30);
        v267 = v29;
        unint64_t v31 = strsep(&v267, ",");
        if (v31)
        {
          uint64_t v32 = v31;
          LODWORD(v261) = 0;
          int v257 = 0;
          v256 = @"Property '%s' is a scalar type on class '%s' that does not match its Entity's property's scalar type.  Dynamically generated accessors do not support implicit type coercion.  Cannot generate a getter method for it.";
          while (1)
          {
            if (*v32 == 84)
            {
              int v34 = v32[1];
              unint64_t v33 = v32 + 1;
              if (v34 != 64 && (isTypeEncodingObject(v33) & 1) == 0)
              {
                unint64_t v35 = *(void *)(v24 + 16);
                BOOL v112 = v20 >= v35;
                unint64_t v36 = v20 - v35;
                if (!v112 || v36 >= *(void *)(v24 + 24))
                {
                  v256 = @"Property '%s' is a scalar type on class '%s'.  Cannot generate a getter method for it.";
LABEL_103:
                  id v21 = v263;
                  uint64_t v77 = (objc_class *)objc_opt_class();
                  v255 = class_getName(v77);
                  _NSCoreDataLog(1, (uint64_t)v256, v78, v79, v80, v81, v82, v83, (uint64_t)v12);
                  unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_104:
                  unint64_t v69 = 0;
                  unint64_t v67 = 0;
                  uint64_t v72 = 0;
                  int v71 = 0;
                  BOOL v70 = 0;
                  goto LABEL_276;
                }
                uint64_t v37 = objc_msgSend(v23, "attributeType", v256);
                if (v37 <= 499)
                {
                  switch(v37)
                  {
                    case 100:
                      int v43 = *v33;
                      LODWORD(v261) = 115;
                      if ((v43 | 0x20) != 0x73) {
                        goto LABEL_103;
                      }
                      break;
                    case 200:
                      int v44 = *v33;
                      LODWORD(v261) = 105;
                      unsigned int v45 = v44 - 73;
                      if (v45 > 0x28) {
                        goto LABEL_103;
                      }
                      if (((1 << v45) & 0x900000009) == 0)
                      {
                        if (((1 << v45) & 0x10000000100) == 0) {
                          goto LABEL_103;
                        }
                        uint64_t v46 = (objc_class *)objc_opt_class();
                        v255 = class_getName(v46);
                        _NSCoreDataLog(2, @"Property '%s' is a 64 bit scalar type on class '%s' that does not match its entity's property's 32 bit scalar type.  Implicit coercion to 32 bits in the database is not recommended.", v47, v48, v49, v50, v51, v52, (uint64_t)v12);
                        LODWORD(v261) = 113;
                        int v257 = 105;
                      }
                      break;
                    case 300:
                      int v39 = *v33;
                      LODWORD(v261) = 113;
                      if ((v39 | 0x20) != 0x71) {
                        goto LABEL_103;
                      }
                      break;
                    default:
                      goto LABEL_103;
                  }
                }
                else if (v37 > 799)
                {
                  if (v37 == 900)
                  {
LABEL_41:
                    int v42 = *v33;
                    LODWORD(v261) = 100;
                    if (v42 != 100) {
                      goto LABEL_103;
                    }
                    goto LABEL_49;
                  }
                  if (v37 != 800) {
                    goto LABEL_103;
                  }
                  int v40 = *v33;
                  LODWORD(v261) = 66;
                  unsigned int v41 = v40 - 66;
                  if (v41 > 0x21 || ((1 << v41) & 0x200000003) == 0) {
                    goto LABEL_103;
                  }
                }
                else
                {
                  if (v37 == 500) {
                    goto LABEL_41;
                  }
                  if (v37 != 600) {
                    goto LABEL_103;
                  }
                  int v38 = *v33;
                  LODWORD(v261) = 102;
                  if (v38 != 102) {
                    goto LABEL_103;
                  }
                }
              }
            }
LABEL_49:
            uint64_t v32 = strsep(&v267, ",");
            if (!v32) {
              goto LABEL_63;
            }
          }
        }
        int v257 = 0;
        LODWORD(v261) = 0;
LABEL_63:
        id v21 = v263;
      }
      else if (v22 == (objc_class *)objc_opt_class())
      {
        LODWORD(v261) = 0;
        int v257 = 0;
      }
      else
      {
        unint64_t v53 = *(void *)(v24 + 16);
        BOOL v112 = v20 >= v53;
        unint64_t v54 = v20 - v53;
        LODWORD(v261) = 0;
        if (v112)
        {
          unint64_t v55 = *(void *)(v24 + 24);
          int v257 = 0;
          if (v54 < v55)
          {
            size_t v56 = v14 + 2;
            long long v57 = (char *)malloc_type_calloc(1uLL, v56, 0x6C9A3C58uLL);
            char *v57 = 95;
            strlcat(v57, v12, v56);
            if (!class_getInstanceVariable(v22, v12) && !class_getInstanceVariable(v22, v57))
            {
              uint64_t v58 = [v8 name];
              v254 = sel_getName(v258);
              v255 = class_getName(v22);
              id v21 = v263;
              uint64_t v253 = v58;
              _NSCoreDataLog(2, @"dynamic accessors failed to find @property implementation for '%s' for entity '%@' while resolving selector '%s' on class '%s'.  Did you remember to declare it @dynamic or @synthesized in the @implementation ?", v59, v60, v61, v62, v63, v64, (uint64_t)v12);
            }
            free(v57);
            LODWORD(v261) = 0;
            int v257 = 0;
          }
        }
        else
        {
          int v257 = 0;
        }
      }
      if ((*(unsigned char *)(v7 + 96) & 1) == 0)
      {
        unint64_t v69 = 0;
        unint64_t v67 = 0;
        BOOL v70 = 0;
        BOOL v162 = *(void *)(_kvcPropertysPrimitiveGetters(v8) + 8 * v20) == 0;
        int v71 = v162;
        if (v162) {
          uint64_t v72 = qword_1EB2706A0;
        }
        else {
          uint64_t v72 = 0;
        }
        goto LABEL_276;
      }
      goto LABEL_104;
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (void)_initializeAccessorStubs
{
  uint64_t v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v2 = malloc_default_zone();
  }
  int v3 = malloc_type_zone_malloc(v2, 0x190uLL, 0x80040B8603338uLL);
  uint64_t v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v4 = malloc_default_zone();
  }
  uint64_t v5 = malloc_type_zone_malloc(v4, 0x190uLL, 0x80040B8603338uLL);
  os_unfair_lock_lock_with_options();
  if (qword_1EB2706A0)
  {
    uint64_t v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v6 = malloc_default_zone();
    }
    malloc_zone_free(v6, v3);
    uint64_t v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v7 = malloc_default_zone();
    }
    malloc_zone_free(v7, v5);
    int v3 = (void *)qword_1EB2706A0;
    uint64_t v5 = (void *)qword_1EB2706A8;
  }
  else
  {
    qword_1EB2706A0 = (uint64_t)v3;
    qword_1EB2706A8 = (uint64_t)v5;
  }
  *int v3 = _pvfk_0;
  v3[1] = _pvfk_1;
  v3[2] = _pvfk_2;
  v3[3] = _pvfk_3;
  v3[4] = _pvfk_4;
  v3[5] = _pvfk_5;
  v3[6] = _pvfk_6;
  v3[7] = _pvfk_7;
  v3[8] = _pvfk_8;
  v3[9] = _pvfk_9;
  v3[10] = _pvfk_10;
  v3[11] = _pvfk_11;
  v3[12] = _pvfk_12;
  v3[13] = _pvfk_13;
  v3[14] = _pvfk_14;
  v3[15] = _pvfk_15;
  v3[16] = _pvfk_16;
  v3[17] = _pvfk_17;
  v3[18] = _pvfk_18;
  v3[19] = _pvfk_19;
  v3[20] = _pvfk_20;
  v3[21] = _pvfk_21;
  v3[22] = _pvfk_22;
  v3[23] = _pvfk_23;
  v3[24] = _pvfk_24;
  v3[25] = _pvfk_25;
  v3[26] = _pvfk_26;
  v3[27] = _pvfk_27;
  v3[28] = _pvfk_28;
  v3[29] = _pvfk_29;
  v3[30] = _pvfk_30;
  v3[31] = _pvfk_31;
  v3[32] = _pvfk_32;
  v3[33] = _pvfk_33;
  v3[34] = _pvfk_34;
  v3[35] = _pvfk_35;
  v3[36] = _pvfk_36;
  v3[37] = _pvfk_37;
  v3[38] = _pvfk_38;
  v3[39] = _pvfk_39;
  v3[40] = _pvfk_40;
  v3[41] = _pvfk_41;
  v3[42] = _pvfk_42;
  v3[43] = _pvfk_43;
  v3[44] = _pvfk_44;
  v3[45] = _pvfk_45;
  v3[46] = _pvfk_46;
  v3[47] = _pvfk_47;
  v3[48] = _pvfk_48;
  v3[49] = _pvfk_49;
  *uint64_t v5 = _svfk_0;
  v5[1] = _svfk_1;
  v5[2] = _svfk_2;
  v5[3] = _svfk_3;
  v5[4] = _svfk_4;
  v5[5] = _svfk_5;
  v5[6] = _svfk_6;
  v5[7] = _svfk_7;
  v5[8] = _svfk_8;
  v5[9] = _svfk_9;
  v5[10] = _svfk_10;
  v5[11] = _svfk_11;
  v5[12] = _svfk_12;
  v5[13] = _svfk_13;
  v5[14] = _svfk_14;
  v5[15] = _svfk_15;
  v5[16] = _svfk_16;
  v5[17] = _svfk_17;
  v5[18] = _svfk_18;
  v5[19] = _svfk_19;
  v5[20] = _svfk_20;
  v5[21] = _svfk_21;
  v5[22] = _svfk_22;
  v5[23] = _svfk_23;
  v5[24] = _svfk_24;
  v5[25] = _svfk_25;
  v5[26] = _svfk_26;
  v5[27] = _svfk_27;
  v5[28] = _svfk_28;
  v5[29] = _svfk_29;
  v5[30] = _svfk_30;
  v5[31] = _svfk_31;
  v5[32] = _svfk_32;
  v5[33] = _svfk_33;
  v5[34] = _svfk_34;
  v5[35] = _svfk_35;
  v5[36] = _svfk_36;
  v5[37] = _svfk_37;
  v5[38] = _svfk_38;
  v5[39] = _svfk_39;
  v5[40] = _svfk_40;
  v5[41] = _svfk_41;
  v5[42] = _svfk_42;
  v5[43] = _svfk_43;
  v5[44] = _svfk_44;
  v5[45] = _svfk_45;
  v5[46] = _svfk_46;
  v5[47] = _svfk_47;
  v5[48] = _svfk_48;
  v5[49] = _svfk_49;
  byte_1EB270669 = 1;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB270670);
}

- (void)setObservationInfo:(void *)inObservationInfo
{
  cd_extras = self->_cd_extras;
  if (!cd_extras)
  {
    uint64_t v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v6 = malloc_default_zone();
    }
    cd_extras = ($1A22B458595D9B8B5E31AEBB12624A52 *)malloc_type_zone_calloc(v6, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
    self->_cd_extras = cd_extras;
  }
  cd_extras->var0 = inObservationInfo;
}

+ (id)_PFPlaceHolderSingleton
{
  uint64_t v2 = (_DWORD *)objc_msgSend(a1, "_PFPlaceHolderSingleton_core");
  int v3 = (objc_class *)objc_opt_class();
  if (v3 != object_getClass(v2))
  {
    uint64_t v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v4 = malloc_default_zone();
    }
    size_t InstanceSize = class_getInstanceSize(v3);
    uint64_t v2 = malloc_type_zone_calloc(v4, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8, 0x9F3A45E0uLL);
    object_setClass(v2, v3);
    v2[4] |= 0x100000u;
    v2[2] = 10000;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __generateReturnPointerMethod_block_invoke;
    block[3] = &__block_descriptor_40_e9__v16__0_8l;
    block[4] = v2;
    uint64_t v6 = imp_implementationWithBlock(block);
    Class Class = object_getClass(v3);
    class_addMethod(Class, sel__PFPlaceHolderSingleton_core, v6, "@@:");
  }
  return v2;
}

+ (id)_PFPlaceHolderSingleton_core
{
  return (id)qword_1EB270640;
}

- (void)awakeFromInsert
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (BOOL)hasChanges
{
  return (self->_cd_stateFlags & 0x3F) != 0;
}

- (void)awakeFromSnapshotEvents:(NSSnapshotEventType)flags
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (NSKnownKeysDictionary)_newChangedValuesForRefresh__
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(*(void *)(a1 + 32), sel__newChangedValuesForRefresh__);
  }
  if ((*(unsigned char *)(a1 + 17) & 0x80) == 0)
  {
    uint64_t v1 = *(void *)(a1 + 48);
    if (v1)
    {
      if (*(void *)(v1 + 8))
      {
        id v38 = (id)NSDictionary_EmptyDictionary;
        uint64_t v2 = _PFEntityForManagedObject((id)a1);
        int v3 = v2;
        if (v2) {
          uint64_t v4 = v2[13];
        }
        else {
          uint64_t v4 = 0;
        }
        int v39 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v4];
        uint64_t v45 = _kvcPropertysPrimitiveGetters(v3);
        if (v3) {
          uint64_t v7 = v3[14];
        }
        else {
          uint64_t v7 = 0;
        }
        uint64_t v8 = NSKeyValueCoding_NullValue;
        uint64_t v9 = *(void *)(a1 + 48);
        if (v9) {
          uint64_t v10 = *(void **)(v9 + 8);
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v44 = [v10 values];
        uint64_t v43 = [(NSKnownKeysDictionary *)v39 values];
        uint64_t v15 = 0;
        char v16 = 1;
        do
        {
          char v41 = v16;
          CFAllocatorRef v17 = (unint64_t *)(v7 + 16 * dword_18AE54200[v15]);
          unint64_t v19 = *v17;
          unint64_t v18 = v17[1];
          if (*v17 < v18 + *v17)
          {
            do
            {
              if (*(void *)(v44 + 8 * v19) == v8) {
                unint64_t v20 = 0;
              }
              else {
                unint64_t v20 = *(void **)(v44 + 8 * v19);
              }
              _PF_Handler_Primitive_GetProperty((id **)a1, v19, 0, *(void *)(v45 + 8 * v19), v11, v12, v13, v14);
              if (v20 != v21)
              {
                unint64_t v22 = v21;
                unint64_t v23 = *(void **)(v3[12] + 24 + 8 * v19);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  && ([v23 _epsilonEquals:v22 rhs:v20 withFlags:1] & 1) == 0)
                {
                  id v24 = (id)v8;
                  if (v22) {
                    id v24 = v22;
                  }
                  *(void *)(v43 + 8 * v19) = v24;
                }
              }
              ++v19;
              --v18;
            }
            while (v18);
          }
          char v16 = 0;
          uint64_t v15 = 1;
        }
        while ((v41 & 1) != 0);
        uint64_t v25 = 2;
        uint64_t v40 = v7;
        do
        {
          uint64_t v42 = v25;
          id v26 = (unint64_t *)(v7 + 16 * dword_18AE54200[v25]);
          unint64_t v28 = *v26;
          unint64_t v27 = v26[1];
          if (*v26 < v27 + *v26)
          {
            do
            {
              if (*(void *)(v44 + 8 * v28) == v8) {
                uint64_t v29 = 0;
              }
              else {
                uint64_t v29 = *(void **)(v44 + 8 * v28);
              }
              _PF_Handler_Primitive_GetProperty((id **)a1, v28, 0, *(void *)(v45 + 8 * v28), v11, v12, v13, v14);
              unint64_t v31 = v30;
              int v32 = [v29 isFault];
              if ((v32 & [v31 isFault] & 1) == 0
                && v29 != v31
                && ([v31 isEqual:v29] & 1) == 0)
              {
                unint64_t v33 = (NSKnownKeysDictionary *)v8;
                if (v31)
                {
                  if ([v31 count]) {
                    id v34 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v31, v29);
                  }
                  else {
                    id v34 = 0;
                  }
                  if ([v29 count]) {
                    id v35 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v29, v31);
                  }
                  else {
                    id v35 = 0;
                  }
                  unint64_t v36 = [NSKnownKeysDictionary alloc];
                  if (!_PFFastMappingForChanges__pffastmappingforchanges)
                  {
                    v47[0] = xmmword_1E544C060;
                    v47[1] = *(_OWORD *)off_1E544C070;
                    _PFFastMappingForChanges__pffastmappingforchanges = [[NSKnownKeysMappingStrategy alloc] initForKeys:v47 count:4];
                  }
                  unint64_t v33 = -[NSKnownKeysDictionary initWithSearchStrategy:](v36, "initWithSearchStrategy:");
                  uint64_t v37 = [(NSKnownKeysDictionary *)v33 values];
                  *uint64_t v37 = v34;
                  v37[1] = v35;
                  void v37[2] = v31;
                  if (v42 == 3) {
                    v37[3] = v29;
                  }
                }
                *(void *)(v43 + 8 * v28) = v33;
              }
              ++v28;
              --v27;
            }
            while (v27);
          }
          uint64_t v7 = v40;
          uint64_t v25 = v42 + 1;
        }
        while (v42 != 3);
        if ([(NSKnownKeysDictionary *)v39 count])
        {
        }
        else
        {

          return (NSKnownKeysDictionary *)v38;
        }
        return v39;
      }
    }
  }
  uint64_t v5 = NSDictionary_EmptyDictionary;

  return (NSKnownKeysDictionary *)v5;
}

- (NSKnownKeysDictionary)_changedTransientProperties__
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__changedTransientProperties__);
  }
  if ((*((unsigned char *)a1 + 17) & 0x80) != 0) {
    return (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
  }
  uint64_t v2 = _PFEntityForManagedObject(a1);
  if (v2) {
    uint64_t v3 = v2[13];
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v3];
  uint64_t v5 = _PFEntityForManagedObject(a1);
  if (v5) {
    uint64_t v6 = v5[14];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = NSKeyValueCoding_NullValue;
  v27[0] = 0xD00000001;
  uint64_t v8 = -[NSKnownKeysDictionary values](-[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a1, dword_18AE54210, (unsigned int *)v27, 0), "values");
  uint64_t v9 = [(NSKnownKeysDictionary *)v4 values];
  uint64_t v10 = 0;
  char v11 = 1;
  do
  {
    char v12 = v11;
    uint64_t v13 = (uint64_t *)(v6 + 16 * dword_18AE541E8[v10]);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    if (*v13 < (unint64_t)(v15 + *v13))
    {
      char v16 = (void *)(v9 + 8 * v14);
      CFAllocatorRef v17 = (void **)&v8[v14];
      do
      {
        unint64_t v18 = *v17;
        if (*v17) {
          BOOL v19 = v18 == (void *)v7;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19) {
          void *v16 = v18;
        }
        ++v16;
        ++v17;
        --v15;
      }
      while (v15);
    }
    char v11 = 0;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  unint64_t v20 = *(void *)(v6 + 208);
  uint64_t v21 = *(void *)(v6 + 216);
  if (v20 < v21 + v20)
  {
    unint64_t v22 = (void *)(v9 + 8 * v20);
    unint64_t v23 = (id *)&v8[v20];
    do
    {
      id v24 = *v23;
      if (([*v23 isFault] & 1) == 0)
      {
        if (v24) {
          BOOL v25 = v24 == (id)v7;
        }
        else {
          BOOL v25 = 1;
        }
        if (!v25) {
          *unint64_t v22 = v24;
        }
      }
      ++v22;
      ++v23;
      --v21;
    }
    while (v21);
  }
  return v4;
}

- (BOOL)isDeleted
{
  char v3 = _PF_Threading_Debugging_level;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
    char v3 = self == 0;
  }
  else
  {
    BOOL result = 0;
    if (!self) {
      return result;
    }
  }
  unsigned int cd_stateFlags = self->_cd_stateFlags;
  BOOL v6 = (cd_stateFlags >> 5) & 1;
  BOOL v7 = (cd_stateFlags >> 2) & 1;
  if ((self->_cd_stateFlags & 0x20) != 0) {
    LOBYTE(v7) = v6;
  }
  if (v3) {
    return v6;
  }
  else {
    return v7;
  }
}

- (void)_updateFromRefreshSnapshot:(int)a3 includingTransients:
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(*((void *)a1 + 4), sel__updateFromRefreshSnapshot_includingTransients_);
    }
    BOOL v6 = _PFEntityForManagedObject(a1);
    BOOL v7 = v6;
    if (v6) {
      uint64_t v8 = v6[13];
    }
    else {
      uint64_t v8 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 mapping] == v8)
    {
      int v9 = a1[4];
      if ((v9 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, *((void *)a1 + 4));
        int v9 = a1[4];
      }
      a1[4] = v9 | 0x800;
      if (v7) {
        uint64_t v10 = (_OWORD *)v7[14];
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v101 = *(void *)(v8 + 40);
      uint64_t v100 = _kvcPropertysPrimitiveGetters(v7);
      unint64_t v99 = _kvcPropertysPrimitiveSetters((uint64_t)v7);
      size_t v102 = (id **)a1;
      uint64_t v103 = [a2 values];
      uint64_t v15 = v10 + 6;
      LODWORD(v97) = a3;
      uint64_t v95 = v111;
      v96 = v10;
      uint64_t v104 = v7;
      if (a3)
      {
        long long v16 = v10[1];
        v111[0] = *v15;
        long long v17 = v10[10];
        long long v110 = v16;
        v111[1] = v17;
        uint64_t v18 = 3;
      }
      else
      {
        long long v110 = v10[3];
        v111[0] = *v15;
        uint64_t v18 = 2;
      }
      uint64_t v98 = v18;
      uint64_t v19 = 0;
      id v94 = (_OWORD *)*MEMORY[0x1E4F28A50];
      CFStringRef v93 = (void *)*MEMORY[0x1E4F281F8];
      do
      {
        unint64_t v20 = (unint64_t *)&v111[v19 - 1];
        unint64_t v22 = *v20;
        unint64_t v21 = v20[1];
        if (*v20 < v21 + *v20)
        {
          do
          {
            unint64_t v27 = (void *)MEMORY[0x18C127630]();
            uint64_t v28 = *(void *)(v103 + 8 * v22);
            if (v28)
            {
              uint64_t v29 = *(void *)(v101 + 8 * v22);
              _PF_Handler_Primitive_GetProperty(v102, v22, v29, *(void *)(v100 + 8 * v22), v23, v24, v25, v26);
              unint64_t v31 = v28 == NSKeyValueCoding_NullValue ? 0 : (void *)v28;
              if (v31 != v30)
              {
                int v32 = v30;
                unint64_t v33 = *(void **)(v104[12] + 24 + 8 * v22);
                id v34 = v31;
                if (([v33 _epsilonEquals:v30 rhs:v31 withFlags:1] & 1) == 0)
                {
                  if ([v33 _propertyType] == 2
                    && [v33 usesMergeableStorage])
                  {
                    [v32 merge:v31];
                    id v34 = (id)[v32 copy];
                  }
                  [v102 willChangeValueForKey:v29];
                  _PF_Handler_Primitive_SetProperty((char **)v102, v22, v34, v29, *(void *)(v99 + 8 * v22));
                  [v102 didChangeValueForKey:v29];
                }
              }
            }
            ++v22;
            --v21;
          }
          while (v21);
        }
        ++v19;
      }
      while (v19 != v98);
      long long v110 = v96[7];
      if (v97)
      {
        *uint64_t v95 = v96[11];
        uint64_t v35 = 2;
      }
      else
      {
        uint64_t v35 = 1;
      }
      for (uint64_t i = 0; i != v35; ++i)
      {
        uint64_t v37 = (unint64_t *)&v111[i - 1];
        unint64_t v38 = *v37;
        unint64_t v39 = v37[1];
        if (*v37 < v39 + *v37)
        {
          do
          {
            uint64_t v40 = *(void *)(v103 + 8 * v38);
            if (v40)
            {
              uint64_t v41 = *(void *)(v101 + 8 * v38);
              _PF_Handler_Primitive_GetProperty(v102, v38, v41, *(void *)(v100 + 8 * v38), v11, v12, v13, v14);
              uint64_t v43 = v40 == NSKeyValueCoding_NullValue ? 0 : (void *)v40;
              if (v43 != v42)
              {
                uint64_t v44 = v42;
                if ((![v43 isFault] || (objc_msgSend(v44, "isFault") & 1) == 0)
                  && ([v44 isEqual:v43] & 1) == 0)
                {
                  uint64_t v45 = [v43 values];
                  if (v45)
                  {
                    id v46 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v44, *(void **)(v45 + 8));
                    [v46 addObjectsFromArray:*(void *)v45];
                  }
                  else
                  {
                    id v46 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v44, 0);
                  }
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v102, v41, v44, v46, v44);
                }
              }
            }
            ++v38;
            --v39;
          }
          while (v39);
        }
      }
      long long v110 = v96[8];
      if (v97)
      {
        *uint64_t v95 = v96[12];
        uint64_t v47 = 2;
      }
      else
      {
        uint64_t v47 = 1;
      }
      id v94 = (_OWORD *)v47;
      uint64_t v48 = 0;
      do
      {
        uint64_t v95 = v48;
        uint64_t v49 = (unint64_t *)&v111[(void)v48 - 1];
        unint64_t v50 = *v49;
        unint64_t v99 = v49[1] + *v49;
        if (v50 < v99)
        {
          do
          {
            uint64_t v51 = *(void **)(v103 + 8 * v50);
            if (v51)
            {
              uint64_t v52 = *(void *)(v100 + 8 * v50);
              uint64_t v98 = *(void *)(v101 + 8 * v50);
              _PF_Handler_Primitive_GetProperty(v102, v50, v98, v52, v11, v12, v13, v14);
              unint64_t v54 = v53;
              uint64_t v55 = NSKeyValueCoding_NullValue;
              size_t v56 = v51 == NSKeyValueCoding_NullValue ? 0 : v51;
              if (v56 != v53
                && (![v56 isFault] || (objc_msgSend(v54, "isFault") & 1) == 0)
                && ([v54 isEqual:v56] & 1) == 0)
              {
                if (v51 == (void *)v55)
                {
                  uint64_t v59 = 0;
                  uint64_t v58 = 0;
                  uint64_t v104 = 0;
                  uint64_t v60 = 0;
                }
                else
                {
                  uint64_t v57 = [v51 values];
                  uint64_t v59 = *(void **)v57;
                  uint64_t v58 = *(void **)(v57 + 8);
                  uint64_t v60 = *(void **)(v57 + 24);
                  uint64_t v104 = *(void **)(v57 + 16);
                }
                if ([v54 isEqual:v60])
                {
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v102, v98, v54, v104, v54);
                }
                else
                {
                  id v97 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v54, v58);
                  v96 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v60, v58);
                  if ([v96 count])
                  {
                    if (+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v96, v104))
                    {
                      uint64_t v104 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v96, v104, v97);
                    }
                    else if (+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v60, v54))
                    {
                      if ([v97 count]) {
                        uint64_t v104 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v96, v97, v104);
                      }
                    }
                    else
                    {
                      CFStringRef v93 = (void *)[v104 count];
                      v92[1] = v92;
                      MEMORY[0x1F4188790](v93);
                      uint64_t v63 = (char *)v92 - v62;
                      if (v64 > 0x200) {
                        uint64_t v63 = (char *)NSAllocateScannedUncollectable();
                      }
                      else {
                        bzero((char *)v92 - v62, 8 * v61);
                      }
                      long long v107 = 0u;
                      long long v108 = 0u;
                      long long v105 = 0u;
                      long long v106 = 0u;
                      uint64_t v65 = 0;
                      uint64_t v66 = [v104 countByEnumeratingWithState:&v105 objects:v109 count:16];
                      if (v66)
                      {
                        uint64_t v67 = *(void *)v106;
                        do
                        {
                          for (uint64_t j = 0; j != v66; ++j)
                          {
                            if (*(void *)v106 != v67) {
                              objc_enumerationMutation(v104);
                            }
                            uint64_t v69 = *(void *)(*((void *)&v105 + 1) + 8 * j);
                            if (([v59 containsObject:v69] & 1) != 0
                              || [v54 containsObject:v69])
                            {
                              *(void *)&v63[8 * v65++] = v69;
                            }
                          }
                          uint64_t v66 = [v104 countByEnumeratingWithState:&v105 objects:v109 count:16];
                        }
                        while (v66);
                      }
                      BOOL v70 = (unint64_t)v93 < 0x201;
                      uint64_t v104 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v63 count:v65];
                      if (!v70) {
                        NSZoneFree(0, v63);
                      }
                      id v71 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v97, v104);
                      if ([v71 count])
                      {
                        unint64_t v72 = [v97 count];
                        CFStringRef v93 = v92;
                        unint64_t v73 = MEMORY[0x1F4188790](v72);
                        uint64_t v76 = (char *)v92 - v75;
                        if (v73 > 0x200) {
                          uint64_t v76 = (char *)NSAllocateScannedUncollectable();
                        }
                        else {
                          bzero((char *)v92 - v75, 8 * v74);
                        }
                        uint64_t v77 = v76;
                        +[_PFRoutines getIndexes:fromCollection:forObjectsInCollection:]((uint64_t)_PFRoutines, (uint64_t)v76, v104, v97);
                        uint64_t v78 = [v97 count];
                        if (v78)
                        {
                          uint64_t v79 = 0;
                          uint64_t v80 = 0;
                          uint64_t v81 = 0;
                          char v82 = 0;
                          uint64_t v83 = v77;
                          do
                          {
                            if (v83[v79] == -1)
                            {
                              BOOL v84 = (v82 & 1) == 0;
                              if ((v82 & 1) == 0) {
                                uint64_t v81 = v79;
                              }
                              char v82 = 1;
                              if (v84) {
                                uint64_t v80 = 1;
                              }
                              else {
                                ++v80;
                              }
                            }
                            else if (v81 | v80)
                            {
                              uint64_t v85 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v81, v80);
                              uint64_t v86 = [v97 objectsAtIndexes:v85];
                              uint64_t v87 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", *(unsigned int *)&v77[4 * v79], v80);
                              [v104 insertObjects:v86 atIndexes:v87];
                              char v82 = 0;
                              uint64_t v81 = 0;
                              uint64_t v80 = 0;
                              uint64_t v83 = v77;
                            }
                            else
                            {
                              uint64_t v81 = 0;
                              uint64_t v80 = 0;
                            }
                            ++v79;
                          }
                          while (v78 != v79);
                        }
                        else
                        {
                          uint64_t v81 = 0;
                          uint64_t v80 = 0;
                          uint64_t v83 = v77;
                        }
                        if (v72 >= 0x201) {
                          NSZoneFree(0, v83);
                        }
                        if (v81 | v80)
                        {
                          uint64_t v88 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v81, v80);
                          uint64_t v89 = [v97 objectsAtIndexes:v88];
                          uint64_t v90 = [v104 count];
                          uint64_t v91 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v90, v80);
                          [v104 insertObjects:v89 atIndexes:v91];
                        }
                      }
                    }
                  }
                  else
                  {
                    uint64_t v104 = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v97, v104);
                  }
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v102, v98, v54, v104, v54);
                }
              }
            }
            ++v50;
          }
          while (v50 != v99);
        }
        uint64_t v48 = (_OWORD *)((char *)v95 + 1);
      }
      while ((_OWORD *)((char *)v95 + 1) != v94);
      *((_DWORD *)v102 + 4) &= ~0x800u;
    }
    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:](a1, a2);
    }
  }
}

- (void)willChangeValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v5 = (id *)_PFEntityForManagedObject(self);
  if (v5)
  {
    unint64_t v7 = [v5[13] indexForKey:key];
  }
  else
  {
    if (!BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
    {
      v8.receiver = self;
      v8.super_class = (Class)NSManagedObject;
      [(NSManagedObject *)&v8 willChangeValueForKey:key];
      return;
    }
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  _PF_ManagedObject_WillChangeValueForKeyIndex((uint64_t)self, v6, (uint64_t)key, v7, 1);
}

- (void)didChangeValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if (!_PFEntityForManagedObject(self) && !BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    v7.receiver = self;
    v7.super_class = (Class)NSManagedObject;
    [(NSManagedObject *)&v7 willChangeValueForKey:key];
    return;
  }
  unsigned int cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x2000) != 0)
  {
    if ((cd_stateFlags & 0x1000) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    self->_cd_stateFlags &= ~0x800u;
    if ((cd_stateFlags & 0x40) != 0) {
      return;
    }
    goto LABEL_12;
  }
  _NSObjectDidChangeVFKImp(self, a2, key);
  if ((cd_stateFlags & 0x1000) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  if ((cd_stateFlags & 0x40) != 0) {
    return;
  }
LABEL_12:

  [(NSManagedObject *)self didAccessValueForKey:key];
}

- (void)_setObjectID__:(void *)result
{
  if (result)
  {
    char v3 = result;
    uint64_t v4 = (void *)result[5];
    if (v4 != a2)
    {

      BOOL result = a2;
      v3[5] = result;
    }
  }
  return result;
}

- (void)prepareForDeletion
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  Name = sel_getName(a3);
  uint64_t v6 = [a1 _PFMOClassFactoryData];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(v6 + 8);
  if (v7)
  {
    size_t v8 = strlen(Name);
    if (v8 < 0x21 || (size_t v9 = v8, strncmp("automaticallyNotifiesObserversOf", Name, 0x20uLL)))
    {
LABEL_5:
      LOBYTE(v7) = 0;
      return v7;
    }
    uint64_t v11 = *(void **)(v7 + 104);
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
    CFAllocatorRef v12 = _PFStackAllocatorCreate((unint64_t *)&v23, 1024);
    MEMORY[0x1F4188790](v12);
    uint64_t v13 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    memcpy(v13, Name + 32, v9 - 31);
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
    CFStringRef v15 = CFStringCreateWithCStringNoCopy(v12, v13, 0x600u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    uint64_t v16 = [v11 indexForKey:v15];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*((void *)&v24 + 1))
      {
        if (v15) {
          CFRelease(v15);
        }
      }
      else
      {
        *((void *)&v23 + 1) = v23;
      }
      unsigned char *v13 = __tolower((char)*v13);
      CFStringRef v15 = CFStringCreateWithCStringNoCopy(v12, v13, 0x600u, v14);
      uint64_t v16 = [v11 indexForKey:v15];
    }
    uint64_t v17 = v16;
    if (*((void *)&v24 + 1))
    {
      if (v15) {
        CFRelease(v15);
      }
    }
    else
    {
      *((void *)&v23 + 1) = v23;
    }
    LOBYTE(v7) = v17 != 0x7FFFFFFFFFFFFFFFLL;
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      ClassMethod = class_getClassMethod(v18, sel__isGeneratedClass);
      Class Class = object_getClass(a1);
      IMP Implementation = method_getImplementation(ClassMethod);
      TypeEncoding = method_getTypeEncoding(ClassMethod);
      class_addMethod(Class, a3, Implementation, TypeEncoding);
    }
  }
  return v7;
}

- (NSString)description
{
  uint64_t v2 = self;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x18C127630](self, a2);
  uint64_t v4 = [(NSManagedObjectID *)[(NSManagedObject *)v2 objectID] entity];
  uint64_t v5 = NSString;
  if (v4)
  {
    v51.receiver = v2;
    v51.super_class = (Class)NSManagedObject;
    uint64_t v6 = [(NSManagedObject *)&v51 description];
    uint64_t v7 = [(NSEntityDescription *)[(NSManagedObject *)v2 entity] name];
    uint64_t v8 = [(NSManagedObject *)v2 objectID];
    if ([(NSManagedObject *)v2 isFault])
    {
      size_t v9 = @"<fault>";
      goto LABEL_80;
    }
    if (v2)
    {
      if (_PF_Threading_Debugging_level) {
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v2->_cd_managedObjectContext, sel__descriptionValues);
      }
      uint64_t v11 = (void *)[_PFEntityForManagedObject(v2) properties];
      uint64_t v12 = [v11 count];
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v12];
      size_t v9 = (__CFString *)v13;
      uint64_t cd_extraFlags = v2->_cd_extraFlags;
      if (cd_extraFlags) {
        CFStringRef v15 = (char *)v2 + cd_extraFlags;
      }
      else {
        CFStringRef v15 = 0;
      }
      uint64_t v49 = v12;
      if (v12)
      {
        uint64_t v40 = v8;
        uint64_t v41 = v7;
        long long v42 = v6;
        long long v43 = v5;
        unint64_t v16 = 0;
        long long v44 = v3;
        long long v45 = &v15[-(((unint64_t)v2->_cd_stateFlags >> 22) & 0x3FC)];
        uint64_t v17 = v12;
        long long v47 = (__CFString *)v13;
        long long v48 = v2;
        long long v46 = v11;
        while (1)
        {
          uint64_t v18 = (void *)MEMORY[0x18C127630]();
          uint64_t v19 = (void *)[v11 objectAtIndex:v16];
          uint64_t v20 = [v19 name];
          uint64_t v21 = [(NSManagedObject *)v2 valueForKey:v20];
          if (v21)
          {
            unint64_t v22 = (__CFString *)v21;
            switch([v19 _propertyType])
            {
              case 2:
              case 6:
              case 7:
                uint64_t v23 = [v19 attributeType];
                if (v23 <= 799)
                {
                  if (v23 <= 399)
                  {
                    if (v23 != 100 && v23 != 200 && v23 != 300) {
                      goto LABEL_67;
                    }
                  }
                  else
                  {
                    if (v23 > 599)
                    {
                      if (v23 == 600) {
                        goto LABEL_76;
                      }
                      if (v23 != 700)
                      {
LABEL_67:
                        unint64_t v22 = @"(...not nil..)";
                        goto LABEL_76;
                      }
                      if ([(__CFString *)v22 isNSString])
                      {
                        if ((unint64_t)[(__CFString *)v22 length] < 0xC9) {
                          goto LABEL_76;
                        }
                        uint64_t v33 = [(__CFString *)v22 substringToIndex:200];
                        goto LABEL_75;
                      }
LABEL_73:
                      long long v34 = v22;
LABEL_74:
                      uint64_t v33 = [(__CFString *)v34 description];
LABEL_75:
                      unint64_t v22 = (__CFString *)v33;
                      goto LABEL_76;
                    }
                    if (v23 != 400 && v23 != 500) {
                      goto LABEL_67;
                    }
                  }
                }
                else
                {
                  if (v23 > 1199)
                  {
                    if (v23 > 1999)
                    {
                      if (v23 != 2000 && v23 != 2100) {
                        goto LABEL_67;
                      }
                    }
                    else if (v23 != 1200 && v23 != 1800)
                    {
                      goto LABEL_67;
                    }
                    goto LABEL_73;
                  }
                  if (v23 > 999)
                  {
                    if (v23 != 1000)
                    {
                      if (v23 != 1100) {
                        goto LABEL_67;
                      }
                      goto LABEL_73;
                    }
                    if ([v19 isFileBackedFuture]) {
                      goto LABEL_73;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      || ![(__CFString *)v22 isNSData]
                      || (unint64_t)[(__CFString *)v22 length] < 0x33)
                    {
                      goto LABEL_73;
                    }
                    long long v34 = (__CFString *)-[__CFString subdataWithRange:](v22, "subdataWithRange:", 0, 50);
                    goto LABEL_74;
                  }
                  if (v23 != 800 && v23 != 900) {
                    goto LABEL_67;
                  }
                }
LABEL_76:
                long long v24 = v9;
                long long v25 = v22;
                break;
              case 3:
                goto LABEL_29;
              case 4:
                if ([v19 isToMany])
                {
LABEL_29:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    if ([(__CFString *)v22 isFault])
                    {
                      long long v25 = (__CFString *)[NSString stringWithFormat:@"<relationship fault: %p '%@'>", v22, objc_msgSend((id)-[__CFString relationship](v22, "relationship"), "name")];
                      long long v24 = v9;
                      break;
                    }
                  }
                  long long v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[__CFString count](v22, "count"));
                  long long v52 = 0u;
                  long long v53 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  uint64_t v27 = [(__CFString *)v22 countByEnumeratingWithState:&v52 objects:v56 count:16];
                  if (!v27) {
                    goto LABEL_54;
                  }
                  uint64_t v28 = v27;
                  unint64_t v29 = 0;
                  uint64_t v30 = *(void *)v53;
                  while (1)
                  {
                    uint64_t v31 = 0;
                    if (v29 <= 0xA) {
                      unint64_t v32 = 10 - v29;
                    }
                    else {
                      unint64_t v32 = 0;
                    }
                    do
                    {
                      if (*(void *)v53 != v30) {
                        objc_enumerationMutation(v22);
                      }
                      if (v32 == v31)
                      {
                        [v26 addObject:objc_msgSend(NSString, "stringWithFormat:", @"(...and %ld more...)", -[__CFString count](v22, "count") - 10)];
LABEL_54:
                        size_t v9 = v47;
                        [(__CFString *)v47 setObject:v26 forKey:v20];

                        uint64_t v2 = v48;
                        uint64_t v17 = v49;
                        uint64_t v11 = v46;
                        goto LABEL_78;
                      }
                      objc_msgSend(v26, "addObject:", objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * v31++), "objectID"));
                    }
                    while (v28 != v31);
                    uint64_t v28 = [(__CFString *)v22 countByEnumeratingWithState:&v52 objects:v56 count:16];
                    v29 += v31;
                    if (!v28) {
                      goto LABEL_54;
                    }
                  }
                }
                if (((v45[v16 >> 3] >> (v16 & 7)) & 1) == 0) {
                  goto LABEL_76;
                }
                uint64_t v33 = [(__CFString *)v22 objectID];
                goto LABEL_75;
              default:
                long long v24 = v9;
                long long v25 = @"(...not nil..)";
                break;
            }
          }
          else
          {
            long long v24 = v9;
            long long v25 = @"nil";
          }
          [(__CFString *)v24 setObject:v25 forKey:v20];
LABEL_78:
          if (++v16 == v17)
          {
            uint64_t v5 = v43;
            char v3 = v44;
            uint64_t v7 = v41;
            uint64_t v6 = v42;
            uint64_t v8 = v40;
            break;
          }
        }
      }
    }
    else
    {
      size_t v9 = 0;
    }
LABEL_80:
    uint64_t v10 = (void *)[v5 stringWithFormat:@"%@ (entity: %@; id: %@; data: %@)", v6, v7, v8, v9];
  }
  else
  {
    v50.receiver = v2;
    v50.super_class = (Class)NSManagedObject;
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%@ (entity: <null>; id: %@; data: <fault>)",
                    [(NSManagedObject *)&v50 description],
                    [(NSManagedObject *)v2 objectID],
                    v38,
                    v39);
  }
  long long v35 = v10;
  id v36 = v10;
  return (NSString *)v35;
}

- (NSManagedObject)initWithContext:(NSManagedObjectContext *)moc
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(id)objc_opt_class() entity];
  uint64_t v6 = (void *)v5;
  if (moc && !v5)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = [v7 stringWithUTF8String:class_getName(v8)];
    uint64_t v10 = [(NSManagedObjectContext *)moc persistentStoreCoordinator];
    if (v10) {
      uint64_t v10 = (NSPersistentStoreCoordinator *)v10->_modelMap;
    }
    uint64_t v6 = -[_PFModelMap entityForClassName:inContext:]((uint64_t)v10, v9, moc);
    if (v6)
    {
      uint64_t v11 = objc_opt_class();
      v13[0] = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v6);
      objc_setAssociatedObject(v11, PFEntityDescriptionAssociationKey, (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1], (void *)0x303);
    }
  }
  return [(NSManagedObject *)self initWithEntity:v6 insertIntoManagedObjectContext:moc];
}

+ (id)_retain_1
{
  return a1;
}

- (void)methodForSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class Class = object_getClass(self);

  return class_getMethodImplementation(Class, a3);
}

- (id)_genericMutableOrderedSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v8 = _PFEntityForManagedObject(self);
  uint64_t v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [(NSManagedObject *)self primitiveValueForKey:a3];
  }
  else
  {
    uint64_t v11 = _kvcPropertysPrimitiveGetters(v8);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(void *)(v11 + 8 * a4), v12, v13, v14, v15);
  }
  uint64_t v16 = (uint64_t)v10;
  if (v10)
  {
    Class Class = object_getClass(self);
    if (Class == (Class)objc_opt_class()
      || (uint64_t v18 = *(void **)(_kvcPropertysPublicRelationshipMutators(v9) + 8 * a4)) == 0)
    {
      uint64_t v19 = [[_NSNotifyingWrapperMutableOrderedSet alloc] initWithContainer:self key:a3 mutableOrderedSet:v16];
    }
    else
    {
      uint64_t v19 = (_NSNotifyingWrapperMutableOrderedSet *)-[_NSProxyWrapperMutableOrderedSet initWithContainer:key:mutableOrderedSet:mutationMethods:]([_NSProxyWrapperMutableOrderedSet alloc], (uint64_t)self, (uint64_t)a3, v16, v18);
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (void)willChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v10 = (id *)_PFEntityForManagedObject(self);
  if (!v10)
  {
    p_unsigned int cd_stateFlags = &self->_cd_stateFlags;
    unsigned int cd_stateFlags = self->_cd_stateFlags;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if ((cd_stateFlags & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  unint64_t v11 = [v10[13] indexForKey:a5];
  uint64_t v12 = v11;
  p_unsigned int cd_stateFlags = &self->_cd_stateFlags;
  unsigned int cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x40) == 0)
  {
LABEL_8:
    [(NSManagedObject *)self willAccessValueForKey:a5];
    goto LABEL_10;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    _PF_Handler_WillAccess_Property((id *)&self->super.isa, (uint64_t)sel_willAccessValueForKey_, v11);
  }
LABEL_10:
  if ((*((unsigned char *)p_cd_stateFlags + 1) & 0x80) != 0)
  {
    [(id)_insertion_fault_handler fulfillFault:self withContext:self->_cd_managedObjectContext forIndex:v12];
    if ((cd_stateFlags & 0x1000) != 0)
    {
LABEL_12:
      if ((cd_stateFlags & 0x2000) != 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((cd_stateFlags & 0x1000) != 0)
  {
    goto LABEL_12;
  }
  if ((cd_stateFlags & 0x400000) == 0 || v12 != 0x7FFFFFFFFFFFFFFFLL) {
    _PFFastMOCObjectWillChange((uint64_t)self->_cd_managedObjectContext, self);
  }
  *p_cd_stateFlags |= 0x800u;
  if ((cd_stateFlags & 0x2000) == 0)
  {
LABEL_13:
    uint64_t v15 = (void (*)(NSManagedObject *, SEL, unint64_t, id, id))off_1EB270658;
    v15(self, a2, a3, a4, a5);
  }
}

- (id)mutableOrderedSetValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5 && (v6 = v5, unint64_t v7 = [*((id *)v5 + 13) indexForKey:a3], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v7;
    id v10 = (void *)v6[14];
    unint64_t v11 = v10[16];
    BOOL v13 = v7 >= v11;
    unint64_t v12 = v7 - v11;
    BOOL v13 = !v13 || v12 >= v10[17];
    if (v13)
    {
      unint64_t v15 = v10[24];
      unint64_t v14 = v10[25];
      BOOL v13 = v7 >= v15;
      unint64_t v16 = v7 - v15;
      if (!v13 || v16 >= v14) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"NSManagedObjects of entity '%@' do not support -mutableOrderedSetValueForKey: for the property '%@'", -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0 reason userInfo]);
      }
    }
    unsigned int cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0) {
      [(NSManagedObject *)self willAccessValueForKey:a3];
    }
    _kvcPropertysPublicGetters(v6);
    id v8 = [(NSManagedObject *)self _genericMutableOrderedSetValueForKey:a3 withIndex:v9 flags:0];
    if ((cd_stateFlags & 0x40) == 0) {
      [(NSManagedObject *)self didAccessValueForKey:a3];
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)NSManagedObject;
    return [(NSManagedObject *)&v20 mutableOrderedSetValueForKey:a3];
  }
  return v8;
}

- (BOOL)hasFaultForRelationshipNamed:(NSString *)key
{
  char v3 = key;
  if (!_PF_Threading_Debugging_level)
  {
    if (key) {
      goto LABEL_3;
    }
LABEL_26:
    uint64_t v15 = [NSString stringWithFormat:@"[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\".", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), 0];
    id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v17 = objc_msgSend(v16, "initWithObjectsAndKeys:", self, @"NSTargetObjectUserInfoKey", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"NSUnknownUserInfoKey", 0);
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28A48] reason:v15 userInfo:v17];

    objc_exception_throw(v18);
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (!v3) {
    goto LABEL_26;
  }
LABEL_3:
  result.location = 0;
  result.length = 0;
  v20.length = CFStringGetLength((CFStringRef)v3);
  v20.location = 0;
  if (CFStringFindWithOptions((CFStringRef)v3, @".", v20, 0, &result))
  {
    v21.length = result.location;
    v21.location = 0;
    CFStringRef v5 = CFStringCreateWithSubstring(0, (CFStringRef)v3, v21);
    char v3 = (NSString *)v5;
  }
  else
  {
    CFStringRef v5 = 0;
  }
  id v6 = _PFEntityForManagedObject(self);
  if (v6 && (unint64_t v7 = v6, v8 = [*((id *)v6 + 13) indexForKey:v3], v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v8;
    uint64_t cd_extraFlags = self->_cd_extraFlags;
    if (cd_extraFlags) {
      unint64_t v11 = (char *)self + cd_extraFlags;
    }
    else {
      unint64_t v11 = 0;
    }
    if ((v11[(v8 >> 3) - (((unint64_t)self->_cd_stateFlags >> 22) & 0x3FC)] >> (v8 & 7)))
    {
      if (!*(void *)(_kvcPropertysPrimitiveGetters(v7) + 8 * v8))
      {
        id v12 = [(NSManagedObject *)self _genericValueForKey:v3 withIndex:v9 flags:0];
        goto LABEL_16;
      }
LABEL_15:
      id v12 = (id)_NSGetUsingKeyValueGetter();
LABEL_16:
      BOOL v13 = v12;
      if (v5) {
        CFRelease(v5);
      }
      if (v13) {
        return [v13 isFault];
      }
      else {
        return 0;
      }
    }
  }
  else if ((self->_cd_stateFlags & 0x8000) == 0)
  {
    object_getClass(self);
    _NSKeyValuePrimitiveGetterForClassAndKey();
    goto LABEL_15;
  }
  if (v5) {
    CFRelease(v5);
  }
  return 1;
}

- (void)didChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  unsigned int cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x2000) != 0)
  {
    if ((cd_stateFlags & 0x1000) != 0) {
      goto LABEL_5;
    }
LABEL_8:
    self->_cd_stateFlags &= ~0x800u;
    if ((cd_stateFlags & 0x40) != 0) {
      return;
    }
    goto LABEL_9;
  }
  off_1EB270660(self, a2, a3, a4, a5);
  if ((cd_stateFlags & 0x1000) == 0) {
    goto LABEL_8;
  }
LABEL_5:
  if ((cd_stateFlags & 0x40) != 0) {
    return;
  }
LABEL_9:

  [(NSManagedObject *)self didAccessValueForKey:a5];
}

- (void)_willChange_Swift_Trampoline
{
  uint64_t v2 = self;
  if ([(NSManagedObject *)v2 bindableObjectPublisher])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with take of Any(&v3, &v4);
    type metadata accessor for ObservableObjectPublisher();
    swift_dynamicCast();
    ObservableObjectPublisher.send()();

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

+ (char)_transientPropertiesChangesMask__
{
  return 0;
}

+ (id)alloc_10_4
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone_10_4:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (unint64_t)retainCount
{
  return (uint64_t)(self->_cd_rc + 2) >> 1;
}

- (NSManagedObject)init
{
  if ((init__warn_once & 1) == 0)
  {
    long long v3 = NSString;
    long long v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = [v3 stringWithFormat:@"CoreData: error: Failed to call designated initializer on NSManagedObject class '%@' \n", NSStringFromClass(v4)];
    init__warn_once = 1;
    if (v5)
    {
      id v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      _NSCoreDataLog(1, @"CoreData: error: Failed to call designated initializer on NSManagedObject class '%@' \n", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    }
  }
  Class Class = object_getClass(self);

  return (NSManagedObject *)_PFAllocateObject(Class, 0);
}

- (BOOL)isUpdated
{
  char v3 = _PF_Threading_Debugging_level;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
    char v3 = self == 0;
  }
  else
  {
    BOOL result = 0;
    if (!self) {
      return result;
    }
  }
  unsigned int cd_stateFlags = self->_cd_stateFlags;
  BOOL v6 = (cd_stateFlags >> 3) & 1;
  BOOL v7 = cd_stateFlags & 1;
  if ((self->_cd_stateFlags & 8) != 0) {
    BOOL v7 = v6;
  }
  if (v3) {
    return v6;
  }
  else {
    return v7;
  }
}

- (BOOL)validateValue:(id *)value forKey:(NSString *)key error:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v9 = _PFEntityForManagedObject(self);
  uint64_t v10 = v9;
  if (v9) {
    uint64_t v9 = (void *)v9[13];
  }
  uint64_t v11 = [v9 indexForKey:key];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = *(void **)(v10[12] + 24 + 8 * v11);
  }

  return -[NSManagedObject _validateValue:forProperty:andKey:withIndex:error:](self, (uint64_t *)value, v12, (uint64_t)key, v11, error);
}

- (uint64_t)_generateErrorWithCode:(void *)a3 andMessage:(uint64_t)a4 forKey:(uint64_t)a5 andValue:(uint64_t)a6 additionalDetail:
{
  if (result)
  {
    uint64_t v11 = (void *)result;
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    uint64_t v13 = v12;
    if (a6) {
      [v12 addEntriesFromDictionary:a6];
    }
    unint64_t v14 = (void *)MEMORY[0x1E4F1CA60];
    if (!a5) {
      a5 = [MEMORY[0x1E4F1CA98] null];
    }
    objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v11, @"NSValidationErrorObject", a4, @"NSValidationErrorKey", a5, @"NSValidationErrorValue", 0));
    uint64_t v15 = (uint64_t *)MEMORY[0x1E4F281F8];
    if (!a3) {
      a3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], a2, 0), "localizedDescription");
    }
    id v16 = (void *)[v11 entity];
    if (v16) {
      uint64_t v17 = objc_msgSend((id)objc_msgSend(v16, "propertiesByName"), "objectForKey:", a4);
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = -[NSManagedObject _substituteEntityAndProperty:inString:](v11, v17, a3);
    if (v18) {
      [v13 setObject:v18 forKey:*MEMORY[0x1E4F28568]];
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *v15;
    return [v19 errorWithDomain:v20 code:a2 userInfo:v13];
  }
  return result;
}

- (void)_chainNewError:(uint64_t *)a3 toOriginalErrorDoublePointer:
{
  if (result && a2 && a3)
  {
    BOOL result = (void *)*a3;
    if (*a3)
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(result, "userInfo"), "valueForKey:", @"NSDetailedErrors");
      if (!v5)
      {
        uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:*a3];
        *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 1560, objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", v5, @"NSDetailedErrors"));
      }
      return (void *)[v5 addObject:a2];
    }
    else
    {
      *a3 = a2;
    }
  }
  return result;
}

- (id)mutableArrayValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5)
  {
    BOOL v6 = objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "objectForKey:", a3);
    if (v6)
    {
      BOOL v7 = v6;
      if (![v6 isTransient] || objc_msgSend(v7, "_propertyType") == 3) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"NSManagedObjects of entity '%@' do not support -mutableArrayValueForKey: for the property '%@'", -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0 reason userInfo]);
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)NSManagedObject;
  return [(NSManagedObject *)&v9 mutableArrayValueForKey:a3];
}

- (id)mutableSetValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5 && (v6 = v5, unint64_t v7 = [*((id *)v5 + 13) indexForKey:a3], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v7;
    uint64_t v10 = (void *)v6[14];
    unint64_t v11 = v10[14];
    BOOL v13 = v7 >= v11;
    unint64_t v12 = v7 - v11;
    BOOL v13 = !v13 || v12 >= v10[15];
    if (v13)
    {
      unint64_t v15 = v10[22];
      unint64_t v14 = v10[23];
      BOOL v13 = v7 >= v15;
      unint64_t v16 = v7 - v15;
      if (!v13 || v16 >= v14) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"NSManagedObjects of entity '%@' do not support -mutableSetValueForKey: for the property '%@'", -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0 reason userInfo]);
      }
    }
    unsigned int cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0) {
      [(NSManagedObject *)self willAccessValueForKey:a3];
    }
    _kvcPropertysPublicGetters(v6);
    id v19 = [(NSManagedObject *)self _genericMutableSetValueForKey:a3 withIndex:v9 flags:0];
    if ((cd_stateFlags & 0x40) == 0) {
      [(NSManagedObject *)self didAccessValueForKey:a3];
    }
    return v19;
  }
  else
  {
    object_getClass(self);
    _NSKeyValueMutableSetGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }
}

- (void)setPrimitiveValue:(id)value forKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  unint64_t v7 = _PFEntityForManagedObject(self);
  if (!v7
    || ((uint64_t v8 = (uint64_t)v7, v9 = (void *)v7[13], !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      ? (uint64_t v10 = [v9 indexForKey:key])
      : (uint64_t v10 = [v9 fastIndexForKnownKey:key]),
        uint64_t v11 = v10,
        v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    object_getClass(self);
    _NSKeyValuePrimitiveSetterForClassAndKey();
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    if ((self->_cd_stateFlags & 0x8000) != 0) {
      [(id)_insertion_fault_handler fulfillFault:self withContext:self->_cd_managedObjectContext forIndex:v11];
    }
    _NSSetUsingKeyValueSetter();
    return;
  }
  if (*(void *)(_kvcPropertysPrimitiveSetters(v8) + 8 * v10)) {
    goto LABEL_10;
  }

  [(NSManagedObject *)self _setGenericValue:value forKey:key withIndex:v11 flags:0];
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (!v5)
  {
    v29.receiver = self;
    v29.super_class = (Class)NSManagedObject;
    [(NSManagedObject *)&v29 setValuesForKeysWithDictionary:a3];
    return;
  }
  BOOL v6 = v5;
  unint64_t v7 = (void *)v5[12];
  id v28 = (id)v5[13];
  uint64_t v26 = _kvcPropertysPublicGetters(v5);
  uint64_t v24 = _kvcPropertysPublicSetters(v6);
  uint64_t v25 = [v7 values];
  uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  unint64_t v8 = [a3 count];
  unint64_t v9 = MEMORY[0x1F4188790](v8);
  unint64_t v12 = (char *)v23 - v11;
  size_t v13 = 8 * v10;
  if (v9 >= 0x201)
  {
    unint64_t v12 = (char *)NSAllocateScannedUncollectable();
    unint64_t v15 = (char *)NSAllocateScannedUncollectable();
    [a3 getObjects:v15 andKeys:v12];
  }
  else
  {
    bzero((char *)v23 - v11, 8 * v10);
    MEMORY[0x1F4188790](v14);
    unint64_t v15 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v15, v13);
    [a3 getObjects:v15 andKeys:v12];
    if (!v8) {
      return;
    }
  }
  v23[1] = v23;
  uint64_t v16 = 0;
  do
  {
    uint64_t v17 = *(void *)&v12[8 * v16];
    if (*(void *)&v15[8 * v16] == v27) {
      id v18 = 0;
    }
    else {
      id v18 = *(id *)&v15[8 * v16];
    }
    unint64_t v19 = [v28 indexForKey:*(void *)&v12[8 * v16]];
    unint64_t v20 = v19;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      id Property = [(NSManagedObject *)self valueForKey:v17];
    }
    else {
      id Property = _PF_Handler_Public_GetProperty((id **)self, v19, v17, *(void *)(v26 + 8 * v19));
    }
    unint64_t v22 = Property;
    if (v18 != Property && ([Property isEqual:v18] & 1) == 0)
    {
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSManagedObject *)self setValue:v18 forKey:v17];
      }
      else if ([*(id *)(v25 + 8 * v20) _isToManyRelationship])
      {
        -[NSManagedObject _updateToManyRelationship:from:to:with:](self, v17, v22, v18, v22);
      }
      else
      {
        _PF_Handler_Public_SetProperty((unsigned int *)self, v20, v18, v17, *(void **)(v24 + 8 * v20));
      }
    }
    ++v16;
  }
  while (v8 != v16);
  if (v8 >= 0x201)
  {
    NSZoneFree(0, v12);
    NSZoneFree(0, v15);
  }
}

- (void)_updateToManyRelationship:(void *)a3 from:(void *)a4 to:(void *)a5 with:
{
  if (a1)
  {
    if ([a3 isNSOrderedSet])
    {
      id v23 = 0;
      id v24 = 0;
      id v21 = 0;
      id v22 = 0;
      id v20 = 0;
      -[NSManagedObject diffOrderedSets:::::::](a1, a3, a4, (uint64_t *)&v24, &v23, &v22, &v21, &v20);
      id v10 = v24;
      if ([v24 count])
      {
        [a1 willChange:3 valuesAtIndexes:v10 forKey:a2];
        [a5 removeObjectsAtIndexes:v10];
        [a1 didChange:3 valuesAtIndexes:v10 forKey:a2];
      }
      id v11 = v23;
      if ([v23 count])
      {
        [a1 willChange:2 valuesAtIndexes:v11 forKey:a2];
        [a5 insertObjects:v22 atIndexes:v11];
        [a1 didChange:2 valuesAtIndexes:v11 forKey:a2];
      }
      id v12 = v21;
      if ([v21 count])
      {
        [a1 willChange:4 valuesAtIndexes:v12 forKey:a2];
        id v13 = v20;
        [a5 removeObjectsInArray:v20];
        if ([a5 count]) {
          [a5 insertObjects:v13 atIndexes:v12];
        }
        else {
          [a5 addObjectsFromArray:v13];
        }
        [a1 didChange:4 valuesAtIndexes:v12 forKey:a2];
      }
    }
    else
    {
      if ([a4 count] && (uint64_t v14 = objc_msgSend(a4, "mutableCopy")) != 0)
      {
        id v18 = v14;
        [v14 minusSet:a3];
      }
      else
      {
        id v18 = 0;
      }
      if (objc_msgSend(a3, "count", v18))
      {
        unint64_t v15 = (void *)[a3 mutableCopy];
        uint64_t v16 = v15;
        if (v15)
        {
          if (a4) {
            uint64_t v17 = (uint64_t)a4;
          }
          else {
            uint64_t v17 = NSSet_EmptySet;
          }
          [v15 minusSet:v17];
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      if ([v16 count])
      {
        [a1 willChangeValueForKey:a2 withSetMutation:2 usingObjects:v16];
        [a5 minusSet:v16];
        [a1 didChangeValueForKey:a2 withSetMutation:2 usingObjects:v16];
      }
      if ([v19 count])
      {
        [a1 willChangeValueForKey:a2 withSetMutation:1 usingObjects:v19];
        [a5 unionSet:v19];
        [a1 didChangeValueForKey:a2 withSetMutation:1 usingObjects:v19];
      }
    }
  }
}

- (id)dictionaryWithPropertyValues
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
    goto LABEL_3;
  }
  if (self)
  {
LABEL_3:
    char v3 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 0);
    goto LABEL_4;
  }
  char v3 = 0;
LABEL_4:

  return v3;
}

- (NSDictionary)committedValuesForKeys:(NSArray *)keys
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ([(NSManagedObject *)self isInserted]) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  if (self && (cd_extras = self->_cd_extras) != 0) {
    id var1 = (NSKnownKeysDictionary *)cd_extras->var1;
  }
  else {
    id var1 = 0;
  }
  unint64_t v8 = _PFEntityForManagedObject(self);
  unint64_t v9 = v8;
  if (v8) {
    uint64_t v10 = v8[12];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = NSKeyValueCoding_NullValue;
  NSUInteger v12 = [(NSArray *)keys count];
  if (v12)
  {
    unint64_t v13 = v12;
    long long v45 = (NSKnownKeysDictionary *)&v44;
    unint64_t v14 = MEMORY[0x1F4188790](v12);
    uint64_t v16 = (char *)&v44 - v15;
    size_t v17 = 8 * v14;
    if (v14 > 0x200)
    {
      uint64_t v16 = (char *)NSAllocateScannedUncollectable();
      id v19 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v44 - v15, v17);
      MEMORY[0x1F4188790](v18);
      id v19 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v19, v17);
    }
    uint64_t v47 = v10 + 24;
    -[NSArray getObjects:range:](keys, "getObjects:range:", v16, 0, v13);
    id v21 = var1;
    if (self)
    {
      id v21 = var1;
      if (!var1)
      {
        v48[0] = 0x900000001;
        id v21 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, dword_18AE541DC, (unsigned int *)v48, 1);
      }
    }
    uint64_t v46 = (uint64_t)var1;
    id v22 = [(NSKnownKeysDictionary *)v21 mapping];
    long long v44 = v21;
    uint64_t v23 = [(NSKnownKeysDictionary *)v21 values];
    for (uint64_t i = 0; i != v13; ++i)
    {
      uint64_t v25 = [(NSKnownKeysMappingStrategy *)v22 indexForKey:*(void *)&v16[8 * i]];
      uint64_t v26 = v11;
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = *(void **)(v23 + 8 * v25);
        id v28 = *(void **)(v47 + 8 * v25);
        char v29 = [v28 isTransient];
        uint64_t v26 = v11;
        if ((v29 & 1) == 0)
        {
          if ([v28 _isToManyRelationship] && objc_msgSend(v27, "isFault")) {
            [v27 count];
          }
          if (v27) {
            uint64_t v26 = (uint64_t)v27;
          }
          else {
            uint64_t v26 = v11;
          }
        }
      }
      *(void *)&v19[8 * i] = v26;
    }
    p_super = (NSDictionary *)(id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v19 forKeys:v16 count:v13];
    if (v13 >= 0x201)
    {
      NSZoneFree(0, v19);
      NSZoneFree(0, v16);
    }
    if (!v46) {

    }
    return p_super;
  }
  if (var1)
  {
    uint64_t v47 = [(NSKnownKeysDictionary *)var1 values];
    long long v45 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:[(NSKnownKeysDictionary *)var1 mapping]];
    uint64_t v46 = [(NSKnownKeysDictionary *)v45 values];
    if (v9) {
      uint64_t v20 = v9[14];
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v32 = 0;
    uint64_t v33 = v10 + 24;
    do
    {
      long long v34 = (uint64_t *)(v20 + 16 * dword_18AE54174[v32]);
      uint64_t v35 = *v34;
      uint64_t v36 = v34[1];
      if (*v34 < (unint64_t)(v36 + *v34))
      {
        long long v37 = (void *)(v46 + 8 * v35);
        uint64_t v38 = (void **)(v47 + 8 * v35);
        uint64_t v39 = (id *)(v33 + 8 * v35);
        do
        {
          id v40 = *v39;
          if (([*v39 isTransient] & 1) == 0)
          {
            uint64_t v41 = *v38;
            if ([v40 _isToManyRelationship])
            {
              [v41 count];
              id v42 = (id)v11;
              if (v41) {
                id v42 = (id)[v41 copy];
              }
            }
            else
            {
              id v42 = (id)v11;
              if (v41) {
                id v42 = v41;
              }
            }
            *long long v37 = v42;
          }
          ++v37;
          ++v38;
          ++v39;
          --v36;
        }
        while (v36);
      }
      ++v32;
    }
    while (v32 != 3);
    p_super = &v45->super.super;
    long long v43 = v45;
    return p_super;
  }
  if (!self) {
    return 0;
  }
  v48[0] = 0x900000001;
  uint64_t v30 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](self, dword_18AE541DC, (unsigned int *)v48, 0);

  return (NSDictionary *)v30;
}

- (id)mergeableStringValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5 && (v6 = v5, uint64_t v7 = [*((id *)v5 + 13) indexForKey:a3], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = v7;
    unsigned int cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0) {
      [(NSManagedObject *)self willAccessValueForKey:a3];
    }
    _kvcPropertysPublicGetters(v6);
    id v11 = [(NSManagedObject *)self _genericMergeableStringValueForKey:a3 withIndex:v9];
    if ((cd_stateFlags & 0x40) == 0) {
      [(NSManagedObject *)self didAccessValueForKey:a3];
    }
    return v11;
  }
  else
  {
    object_getClass(self);
    _NSKeyValueMutableSetGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v5 = [NSString stringWithFormat:@"[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\".", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (!a3) {
    a3 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v7 = objc_msgSend(v6, "initWithObjectsAndKeys:", self, @"NSTargetObjectUserInfoKey", a3, @"NSUnknownUserInfoKey", 0);
  unint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28A48] reason:v5 userInfo:v7];

  [v8 raise];
  return 0;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v6 = [NSString stringWithFormat:@"[<%@ %p> setValue:forUndefinedKey:]: the entity %@ is not key value coding-compliant for the key \"%@\".", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a4];
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (!a4) {
    a4 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  unint64_t v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", self, @"NSTargetObjectUserInfoKey", a4, @"NSUnknownUserInfoKey", 0);
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28A48] reason:v6 userInfo:v8];

  [v9 raise];
}

- (void)setNilValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v5 = (id *)_PFEntityForManagedObject(self);
  if (v5 && (uint64_t v6 = [v5[13] indexForKey:a3], v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    _PF_Handler_SetNilValueForKeyIndex((char **)self, (uint64_t)a3, v6);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"[<%@ %p> setNilValueForKey]: instance of entity %@ could not set nil as the value for the key %@.", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3 format];
  }
}

- (BOOL)hasPersistentChangedValues
{
  if ((self->_cd_stateFlags & 0x3F) == 0 || (self->_cd_stateFlags & 0x8000) != 0) {
    return 0;
  }
  cd_extras = self->_cd_extras;
  if (!cd_extras || !cd_extras->var1) {
    return 0;
  }
  uint64_t v5 = _PFEntityForManagedObject(self);
  uint64_t v6 = _kvcPropertysPrimitiveGetters(v5);
  if (v5) {
    uint64_t v30 = v5[14];
  }
  else {
    uint64_t v30 = 0;
  }
  id v7 = self->_cd_extras;
  if (v7) {
    id var1 = v7->var1;
  }
  else {
    id var1 = 0;
  }
  uint64_t v9 = NSKeyValueCoding_NullValue;
  uint64_t v14 = objc_msgSend(var1, "values", v30);
  uint64_t v15 = 0;
  char v16 = 1;
  BOOL v17 = 1;
  do
  {
    char v32 = v16;
    uint64_t v18 = (unint64_t *)(v31 + 16 * dword_18AE54174[v15]);
    unint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    if (*v18 < v20 + *v18)
    {
      do
      {
        uint64_t v21 = *(void *)(v14 + 8 * v19) == v9 ? 0 : *(void *)(v14 + 8 * v19);
        _PF_Handler_Primitive_GetProperty((id **)self, v19, 0, *(void *)(v6 + 8 * v19), v10, v11, v12, v13);
        if (v21 != v22
          && ![*(id *)(v5[12] + 24 + 8 * v19) _epsilonEquals:v22 rhs:v21 withFlags:1])
        {
          return v17;
        }
        ++v19;
      }
      while (--v20);
    }
    char v16 = 0;
    uint64_t v15 = 1;
  }
  while ((v32 & 1) != 0);
  unint64_t v23 = *(void *)(v31 + 144);
  uint64_t v24 = *(void *)(v31 + 152);
  if (v23 >= v24 + v23) {
    return 0;
  }
  while (1)
  {
    uint64_t v25 = *(void *)(v14 + 8 * v23) == v9 ? 0 : *(void **)(v14 + 8 * v23);
    _PF_Handler_Primitive_GetProperty((id **)self, v23, 0, *(void *)(v6 + 8 * v23), v10, v11, v12, v13);
    uint64_t v27 = v26;
    int v28 = [v25 isFault];
    if ((v28 & [v27 isFault] & 1) == 0
      && v25 != v27
      && ![v27 isEqual:v25])
    {
      break;
    }
    BOOL v17 = 0;
    ++v23;
    if (!--v24) {
      return v17;
    }
  }
  return 1;
}

+ (NSFetchRequest)fetchRequest
{
  uint64_t v3 = [a1 entity];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = objc_alloc_init(NSFetchRequest);
    [(NSFetchRequest *)v5 setEntity:v4];
    return v5;
  }
  uint64_t v7 = [a1 entityName];
  if (!v7) {
    return 0;
  }

  return +[NSFetchRequest fetchRequestWithEntityName:v7];
}

- (void)setBindableObjectPublisher:(id)a3
{
  cd_extras = self->_cd_extras;
  if (!cd_extras)
  {
    uint64_t v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v6 = malloc_default_zone();
    }
    cd_extras = ($1A22B458595D9B8B5E31AEBB12624A52 *)malloc_type_zone_calloc(v6, 1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
    self->_cd_extras = cd_extras;
  }
  if (cd_extras->var4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot set BindableObject publisher after it has already been set" userInfo:0]);
  }
  self->_cd_extras->var4 = a3;
}

- (NSKnownKeysDictionary)_newNestedSaveChangedValuesForParent:(unsigned char *)a1
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = a1;
  uint64_t v4 = _PFEntityForManagedObject(a1);
  uint64_t v5 = v4;
  uint64_t v6 = v4 ? v4[13] : 0;
  if ((v3[17] & 0x80) != 0) {
    return 0;
  }
  uint64_t v7 = *((void *)v3 + 6);
  if (!v7 || !*(void *)(v7 + 8)) {
    return 0;
  }
  uint64_t v8 = [a2 managedObjectContext];
  uint64_t v9 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v6];
  uint64_t v10 = _kvcPropertysPrimitiveGetters(v5);
  if (v5) {
    uint64_t v50 = v5[14];
  }
  else {
    uint64_t v50 = 0;
  }
  uint64_t v11 = NSKeyValueCoding_NullValue;
  uint64_t v12 = *((void *)v3 + 6);
  if (v12) {
    uint64_t v13 = *(void **)(v12 + 8);
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v56 = [v13 values];
  uint64_t v49 = v9;
  uint64_t v55 = [(NSKnownKeysDictionary *)v9 values];
  unint64_t v19 = *(void *)(v50 + 16);
  uint64_t v18 = *(void *)(v50 + 24);
  if (v19 < v18 + v19)
  {
    do
    {
      if (*(void *)(v56 + 8 * v19) == v11) {
        unint64_t v20 = 0;
      }
      else {
        unint64_t v20 = *(void **)(v56 + 8 * v19);
      }
      _PF_Handler_Primitive_GetProperty((id **)v3, v19, 0, *(void *)(v10 + 8 * v19), v14, v15, v16, v17);
      if (v20 != v21)
      {
        uint64_t v22 = v21;
        if (([*(id *)(v5[12] + 24 + 8 * v19) _epsilonEquals:v21 rhs:v20 withFlags:1] & 1) == 0)
        {
          id v23 = (id)v11;
          if (v22) {
            id v23 = v22;
          }
          *(void *)(v55 + 8 * v19) = v23;
        }
      }
      ++v19;
      --v18;
    }
    while (v18);
  }
  char v24 = 0;
  uint64_t v25 = 1;
  do
  {
    char v26 = v24;
    uint64_t v27 = (unint64_t *)(v50 + 16 * dword_18AE54180[v25]);
    unint64_t v29 = *v27;
    unint64_t v28 = v27[1];
    if (*v27 < v28 + *v27)
    {
      do
      {
        if (*(void *)(v56 + 8 * v29) == v11) {
          uint64_t v30 = 0;
        }
        else {
          uint64_t v30 = *(void **)(v56 + 8 * v29);
        }
        _PF_Handler_Primitive_GetProperty((id **)v3, v29, 0, *(void *)(v10 + 8 * v29), v14, v15, v16, v17);
        if (v30 != v31)
        {
          char v32 = v31;
          if (([v31 isEqual:v30] & 1) == 0)
          {
            uint64_t v33 = v11;
            if (v32) {
              uint64_t v33 = (uint64_t)_PFRetainedObjectForMappedChildObjectIDInParentContext((void *)[v32 objectID], v8);
            }
            *(void *)(v55 + 8 * v29) = v33;
          }
        }
        ++v29;
        --v28;
      }
      while (v28);
    }
    char v24 = 1;
    uint64_t v25 = 2;
  }
  while ((v26 & 1) == 0);
  uint64_t v51 = v10;
  uint64_t v52 = v8;
  uint64_t v34 = 3;
  long long v54 = v3;
  do
  {
    uint64_t v35 = (unint64_t *)(v50 + 16 * dword_18AE54180[v34]);
    unint64_t v37 = *v35;
    unint64_t v36 = v35[1];
    if (*v35 < v36 + *v35)
    {
      unint64_t v53 = v34;
      do
      {
        if (*(void *)(v56 + 8 * v37) == v11) {
          uint64_t v38 = 0;
        }
        else {
          uint64_t v38 = *(void **)(v56 + 8 * v37);
        }
        _PF_Handler_Primitive_GetProperty((id **)v3, v37, 0, *(void *)(v10 + 8 * v37), v14, v15, v16, v17);
        id v40 = v39;
        int v41 = [v38 isFault];
        if ((v41 & [v40 isFault] & 1) == 0
          && v38 != v40
          && ([v40 isEqual:v38] & 1) == 0)
        {
          id v42 = (NSKnownKeysDictionary *)v11;
          if (v40)
          {
            long long v43 = [NSKnownKeysDictionary alloc];
            if (!_PFFastMappingForChanges__pffastmappingforchanges)
            {
              v57[0] = xmmword_1E544C060;
              v57[1] = *(_OWORD *)off_1E544C070;
              _PFFastMappingForChanges__pffastmappingforchanges = [[NSKnownKeysMappingStrategy alloc] initForKeys:v57 count:4];
            }
            id v42 = -[NSKnownKeysDictionary initWithSearchStrategy:](v43, "initWithSearchStrategy:");
            if ([v40 count]) {
              id v44 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v40, v38);
            }
            else {
              id v44 = 0;
            }
            if ([v38 count]) {
              id v45 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v38, v40);
            }
            else {
              id v45 = 0;
            }
            uint64_t v46 = [(NSKnownKeysDictionary *)v42 values];
            *uint64_t v46 = +[_PFRoutines newMutableArrayFromCollection:forParentContext:]((uint64_t)_PFRoutines, v44, v52);

            v46[1] = +[_PFRoutines newMutableArrayFromCollection:forParentContext:]((uint64_t)_PFRoutines, v45, v52);
            uint64_t v34 = v53;
            if (v53 > 4)
            {
              v46[2] = +[_PFRoutines newMutableOrderedSetFromCollection:forParentContext:]((uint64_t)_PFRoutines, v40, v52);
              v46[3] = +[_PFRoutines newMutableOrderedSetFromCollection:forParentContext:]((uint64_t)_PFRoutines, v38, v52);
            }
            else
            {
              v46[2] = +[_PFRoutines newMutableSetFromCollection:forParentContext:]((uint64_t)_PFRoutines, v40, v52);
            }
            uint64_t v10 = v51;
          }
          *(void *)(v55 + 8 * v37) = v42;
          uint64_t v3 = v54;
        }
        ++v37;
        --v36;
      }
      while (v36);
    }
    ++v34;
  }
  while (v34 != 7);
  uint64_t v47 = v49;
  if (![(NSKnownKeysDictionary *)v49 count])
  {

    return 0;
  }
  return v47;
}

- (NSKnownKeysDictionary)_newSnapshotForUndo__
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newSnapshotForUndo__);
  }
  BOOL v70 = (NSKnownKeysDictionary *)(id)NSDictionary_EmptyDictionary;
  uint64_t v2 = _PFEntityForManagedObject(v1);
  uint64_t v3 = v2;
  if (v2) {
    uint64_t v4 = v2[13];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v4];
  uint64_t v78 = _kvcPropertysPrimitiveGetters(v3);
  if (v3) {
    uint64_t v73 = v3[14];
  }
  else {
    uint64_t v73 = 0;
  }
  uint64_t v77 = NSKeyValueCoding_NullValue;
  uint64_t v6 = v1[6];
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v79 = [v7 values];
  uint64_t v75 = [(NSKnownKeysDictionary *)v5 values];
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v13 = (uint64_t *)(v73 + 16 * dword_18AE5419C[i]);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    if (*v13 < (unint64_t)(v15 + *v13))
    {
      uint64_t v16 = (void *)(v75 + 8 * v14);
      uint64_t v17 = (void **)(v79 + 8 * v14);
      do
      {
        uint64_t v18 = *v17++;
        *v16++ = v18;
        --v15;
      }
      while (v15);
    }
  }
  uint64_t v69 = v5;
  char v19 = 0;
  uint64_t v20 = 4;
  uint64_t v74 = v1;
  uint64_t v21 = (void *)v77;
  do
  {
    char v22 = v19;
    id v23 = (unint64_t *)(v73 + 16 * dword_18AE5419C[v20]);
    unint64_t v24 = *v23;
    unint64_t v25 = v23[1];
    if (*v23 < v25 + *v23)
    {
      do
      {
        if (*(void **)(v79 + 8 * v24) == v21) {
          char v26 = 0;
        }
        else {
          char v26 = *(void **)(v79 + 8 * v24);
        }
        _PF_Handler_Primitive_GetProperty((id **)v1, v24, 0, *(void *)(v78 + 8 * v24), v8, v9, v10, v11);
        unint64_t v28 = v27;
        int v29 = [v26 isFault];
        int v30 = v29 & [v28 isFault];
        uint64_t v21 = (void *)v77;
        if ((v30 & 1) == 0 && v26 != v28 && ([v28 isEqual:v26] & 1) == 0)
        {
          uint64_t v31 = (NSKnownKeysDictionary *)v77;
          if (v28)
          {
            if ([v28 count])
            {
              char v32 = (void *)[v28 mutableCopy];
              uint64_t v33 = v32;
              if (v32) {
                [v32 minusSet:v26];
              }
            }
            else
            {
              uint64_t v33 = 0;
            }
            if (objc_msgSend(v26, "count", v69))
            {
              uint64_t v34 = (void *)[v26 mutableCopy];
              uint64_t v35 = v34;
              if (v34) {
                [v34 minusSet:v28];
              }
            }
            else
            {
              uint64_t v35 = 0;
            }
            unint64_t v36 = [NSKnownKeysDictionary alloc];
            if (!_PFFastMappingForChanges__pffastmappingforchanges)
            {
              objc_super v80 = (objc_super)xmmword_1E544C060;
              long long v81 = *(_OWORD *)off_1E544C070;
              _PFFastMappingForChanges__pffastmappingforchanges = [[NSKnownKeysMappingStrategy alloc] initForKeys:&v80 count:4];
            }
            uint64_t v31 = -[NSKnownKeysDictionary initWithSearchStrategy:](v36, "initWithSearchStrategy:");
            unint64_t v37 = [(NSKnownKeysDictionary *)v31 values];
            *unint64_t v37 = v33;
            v37[1] = v35;
            uint64_t v21 = (void *)v77;
          }
          *(void *)(v75 + 8 * v24) = v31;
          uint64_t v1 = v74;
        }
        ++v24;
        --v25;
      }
      while (v25);
    }
    char v19 = 1;
    uint64_t v20 = 5;
  }
  while ((v22 & 1) == 0);
  char v38 = 0;
  uint64_t v39 = 6;
  do
  {
    char v72 = v38;
    id v40 = (unint64_t *)(v73 + 16 * dword_18AE5419C[v39]);
    unint64_t v42 = *v40;
    unint64_t v41 = v40[1];
    unint64_t v43 = v41 + v42;
    if (v42 >= v41 + v42) {
      goto LABEL_92;
    }
    unint64_t v71 = v41 + v42;
    do
    {
      if (*(void **)(v79 + 8 * v42) == v21) {
        id v44 = 0;
      }
      else {
        id v44 = *(void **)(v79 + 8 * v42);
      }
      _PF_Handler_Primitive_GetProperty((id **)v1, v42, 0, *(void *)(v78 + 8 * v42), v8, v9, v10, v11);
      uint64_t v46 = v45;
      int v47 = [v44 isFault];
      if ((v47 & [v46 isFault] & 1) != 0
        || v44 == v46
        || ([v46 isEqual:v44] & 1) != 0)
      {
        goto LABEL_91;
      }
      id v48 = v21;
      if (!v46) {
        goto LABEL_90;
      }
      if ([v46 isEqual:v44])
      {
        id v48 = (id)NSArray_EmptyArray;
        goto LABEL_90;
      }
      id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v49 = [v46 count];
      unint64_t v50 = [v44 count];
      id v76 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      unint64_t v51 = 0;
      unint64_t v52 = 0;
      while (1)
      {
        uint64_t v53 = v52 >= v49 ? 0 : [v46 objectAtIndex:v52];
        uint64_t v54 = v51 >= v50 ? 0 : [v44 objectAtIndex:v51];
        if (!(v53 | v54)) {
          break;
        }
        if (!v53)
        {
          if ([v46 containsObject:v54]) {
            goto LABEL_85;
          }
LABEL_75:
          uint64_t v59 = [_NSOrderedSetDiffInsert alloc];
          if (v59)
          {
            v80.receiver = v59;
            v80.super_class = (Class)_NSOrderedSetDiffChange;
            id v60 = objc_msgSendSuper2(&v80, sel_initWithObject_, v54);
            uint64_t v61 = v60;
            if (v60) {
              *((void *)v60 + 2) = v51;
            }
          }
          else
          {
            uint64_t v61 = 0;
          }
          objc_msgSend(v48, "addObject:", v61, v69);

          goto LABEL_85;
        }
        if (!v54)
        {
          if ([v44 containsObject:v53]) {
            goto LABEL_73;
          }
LABEL_72:
          uint64_t v58 = [[_NSOrderedSetDiffDelete alloc] initWithObject:v53];
          [v48 addObject:v58];

          goto LABEL_73;
        }
        if ([(id)v53 isEqual:v54])
        {
          if (v51 != v52)
          {
            uint64_t v62 = [_NSOrderedSetDiffMove alloc];
            if (v62)
            {
              v80.receiver = v62;
              v80.super_class = (Class)_NSOrderedSetDiffChange;
              id v63 = objc_msgSendSuper2(&v80, sel_initWithObject_, v53);
              unint64_t v64 = v63;
              if (v63) {
                *((void *)v63 + 2) = v51;
              }
            }
            else
            {
              unint64_t v64 = 0;
            }
            objc_msgSend(v48, "addObject:", v64, v69);
          }
          ++v52;
LABEL_85:
          ++v51;
        }
        else
        {
          if (![v44 containsObject:v53]) {
            goto LABEL_72;
          }
          if (([v46 containsObject:v54] & 1) == 0) {
            goto LABEL_75;
          }
          if (([v76 containsObject:v53] & 1) == 0)
          {
            uint64_t v55 = [_NSOrderedSetDiffMove alloc];
            if (v55)
            {
              v80.receiver = v55;
              v80.super_class = (Class)_NSOrderedSetDiffChange;
              id v56 = objc_msgSendSuper2(&v80, sel_initWithObject_, v54);
              uint64_t v57 = v56;
              if (v56) {
                *((void *)v56 + 2) = v51;
              }
            }
            else
            {
              uint64_t v57 = 0;
            }
            objc_msgSend(v48, "addObject:", v57, v69);

            [v76 addObject:v54];
            goto LABEL_85;
          }
LABEL_73:
          ++v52;
        }
      }

      uint64_t v1 = v74;
      uint64_t v21 = (void *)v77;
      unint64_t v43 = v71;
LABEL_90:
      *(void *)(v75 + 8 * v42) = v48;
LABEL_91:
      ++v42;
    }
    while (v42 != v43);
LABEL_92:
    char v38 = 1;
    uint64_t v39 = 7;
  }
  while ((v72 & 1) == 0);
  uint64_t v65 = v69;
  uint64_t v66 = [(NSKnownKeysDictionary *)v69 count];
  if (v66) {
    uint64_t v67 = v70;
  }
  else {
    uint64_t v67 = v69;
  }
  if (!v66) {
    uint64_t v65 = v70;
  }

  return v65;
}

- (NSKnownKeysDictionary)_newCommittedSnapshotValues
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newCommittedSnapshotValues);
  }
  uint64_t v2 = [NSKnownKeysDictionary alloc];
  uint64_t v3 = _PFEntityForManagedObject(a1);
  if (v3) {
    uint64_t v4 = v3[13];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSKnownKeysDictionary *)v2 initWithSearchStrategy:v4];
  if (([a1 isInserted] & 1) == 0)
  {
    uint64_t v6 = [(NSKnownKeysDictionary *)v5 values];
    uint64_t v7 = a1[6];
    if (v7)
    {
      uint64_t v8 = *(void **)(v7 + 8);
      uint64_t v9 = NSKeyValueCoding_NullValue;
      if (v8)
      {
        uint64_t v10 = [v8 values];
        uint64_t v11 = 0;
LABEL_13:
        uint64_t v12 = *((void *)_PFEntityForManagedObject(a1) + 14);
        unint64_t v13 = *(void *)(v12 + 48);
        uint64_t v14 = *(void *)(v12 + 56);
        if (v13 < v14 + v13)
        {
          uint64_t v15 = (void *)(v6 + 8 * v13);
          uint64_t v16 = (id *)(v10 + 8 * v13);
          do
          {
            id v17 = (id)v9;
            if (*v16) {
              id v17 = *v16;
            }
            *v15++ = v17;
            ++v16;
            --v14;
          }
          while (v14);
        }
        uint64_t v18 = *((void *)_PFEntityForManagedObject(a1) + 14);
        unint64_t v19 = *(void *)(v18 + 96);
        uint64_t v20 = *(void *)(v18 + 104);
        if (v19 < v20 + v19)
        {
          uint64_t v21 = (void *)(v6 + 8 * v19);
          char v22 = (void **)(v10 + 8 * v19);
          do
          {
            id v23 = *v22;
            if (*v22) {
              BOOL v24 = v23 == (void *)v9;
            }
            else {
              BOOL v24 = 1;
            }
            id v25 = (id)v9;
            if (!v24) {
              id v25 = (id)[v23 objectID];
            }
            *v21++ = v25;
            ++v22;
            --v20;
          }
          while (v20);
        }

        return v5;
      }
    }
    else
    {
      uint64_t v9 = NSKeyValueCoding_NullValue;
    }
    v27[0] = 0;
    uint64_t v11 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a1, dword_18AE541DC, (unsigned int *)v27, 1);
    uint64_t v10 = [(NSKnownKeysDictionary *)v11 values];
    goto LABEL_13;
  }
  return v5;
}

- (id)_genericMergeableStringValueForKey:(id)a3 withIndex:(int64_t)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v7 = _PFEntityForManagedObject(self);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(NSManagedObject *)self primitiveValueForKey:a3];
  }
  else
  {
    uint64_t v9 = _kvcPropertysPrimitiveGetters(v7);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(void *)(v9 + 8 * a4), v10, v11, v12, v13);
  }
  if (v8) {
    uint64_t v14 = [[PFMergeableStringProxy alloc] initWithContainer:self key:a3 mergeableString:v8];
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_genericMutableSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v8 = _PFEntityForManagedObject(self);
  uint64_t v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [(NSManagedObject *)self primitiveValueForKey:a3];
  }
  else
  {
    uint64_t v11 = _kvcPropertysPrimitiveGetters(v8);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(void *)(v11 + 8 * a4), v12, v13, v14, v15);
  }
  uint64_t v16 = (uint64_t)v10;
  if (v10)
  {
    Class Class = object_getClass(self);
    if (Class == (Class)objc_opt_class()
      || (uint64_t v18 = *(void **)(_kvcPropertysPublicRelationshipMutators(v9) + 8 * a4)) == 0)
    {
      unint64_t v19 = [[_NSNotifyingWrapperMutableSet alloc] initWithContainer:self key:a3 mutableSet:v16];
    }
    else
    {
      unint64_t v19 = (_NSNotifyingWrapperMutableSet *)-[_NSProxyWrapperMutableSet initWithContainer:key:mutableSet:mutationMethods:]([_NSProxyWrapperMutableSet alloc], (uint64_t)self, (uint64_t)a3, v16, v18);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

- (void)_substituteEntityAndProperty:(void *)a3 inString:
{
  uint64_t v3 = a3;
  if (a2)
  {
    if (a3)
    {
      id v5 = _PFEntityForManagedObject(a1);
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "managedObjectModel"), "_localizationPolicy");
      uint64_t v7 = [v6 localizedEntityNameForEntity:v5];
      uint64_t v8 = [v6 localizedPropertyNameForProperty:a2];
      if (v7 | v8)
      {
        uint64_t v9 = v8;
        id v10 = (void *)[v3 mutableCopyWithZone:0];
        uint64_t v3 = v10;
        if (v7) {
          objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"%{ENTITY}@", v7, 2, 0, objc_msgSend(v10, "length"));
        }
        if (v9) {
          objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"%{PROPERTY}@", v9, 2, 0, objc_msgSend(v3, "length"));
        }
        id v11 = v3;
      }
    }
  }
  return v3;
}

- (id)diffOrderedSets:(void *)a3 :(uint64_t *)a4 :(id *)a5 :(id *)a6 :(id *)a7 :(id *)a8 :
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v9 = a6;
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
    *a7 = 0;
    uint64_t v91 = a8;
    *a8 = 0;
    size_t v14 = [a3 count];
    size_t v15 = [a2 count];
    uint64_t v86 = &v82;
    unint64_t v16 = MEMORY[0x1F4188790](v15);
    unint64_t v19 = (char *)&v82 - v18;
    if (v16 > 0x200)
    {
      uint64_t v20 = NSAllocateScannedUncollectable();
      unint64_t v19 = (char *)v20;
    }
    else
    {
      bzero((char *)&v82 - v18, 8 * v17);
    }
    MEMORY[0x1F4188790](v20);
    id v23 = (char *)&v82 - v22;
    uint64_t v87 = a7;
    if (v14 > 0x200) {
      id v23 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v82 - v22, 8 * v21);
    }
    BOOL v84 = a3;
    uint64_t v24 = objc_msgSend(a3, "getObjects:range:", v23, 0, v14);
    MEMORY[0x1F4188790](v24);
    uint64_t v27 = (char *)&v82 - v26;
    size_t v28 = 8 * v25;
    unint64_t v85 = v29;
    if (v29 > 0x200)
    {
      uint64_t v27 = (char *)NSAllocateScannedUncollectable();
      CFStringRef v93 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v82 - v26, 8 * v25);
      MEMORY[0x1F4188790](v30);
      CFStringRef v93 = (char *)&v82 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v93, v28);
    }
    objc_msgSend(a2, "getObjects:range:", v19, 0, v15);
    qsort_b(v19, v15, 8uLL, &__block_literal_global_8);
    qsort_b(v23, v14, 8uLL, &__block_literal_global_8);
    size_t v31 = 0;
    size_t v32 = 0;
    size_t v33 = 0;
    size_t v34 = 0;
    if (v15)
    {
      uint64_t v35 = v93;
      if (v14)
      {
        size_t v34 = 0;
        size_t v33 = 0;
        size_t v32 = 0;
        size_t v31 = 0;
        do
        {
          uint64_t v36 = *(void *)&v19[8 * v33];
          uint64_t v37 = *(void *)&v23[8 * v34];
          if (v36 >= v37)
          {
            if (v36 == v37) {
              ++v33;
            }
            else {
              *(void *)&v35[8 * v32++] = v37;
            }
            ++v34;
          }
          else
          {
            *(void *)&v27[8 * v31++] = v36;
            ++v33;
          }
        }
        while (v33 < v15 && v34 < v14);
      }
    }
    else
    {
      uint64_t v35 = v93;
    }
    id v92 = a2;
    size_t v38 = v15 - v33;
    if (v15 <= v33)
    {
      size_t v41 = v31;
    }
    else
    {
      uint64_t v39 = &v19[8 * v33];
      do
      {
        uint64_t v40 = *(void *)v39;
        v39 += 8;
        size_t v41 = v31 + 1;
        *(void *)&v27[8 * v31++] = v40;
        --v38;
      }
      while (v38);
    }
    uint64_t v88 = v19;
    uint64_t v89 = a4;
    size_t v42 = v14 - v34;
    uint64_t v90 = a5;
    if (v14 <= v34)
    {
      size_t v45 = v32;
    }
    else
    {
      unint64_t v43 = &v23[8 * v34];
      do
      {
        uint64_t v44 = *(void *)v43;
        v43 += 8;
        size_t v45 = v32 + 1;
        *(void *)&v35[8 * v32++] = v44;
        --v42;
      }
      while (v42);
    }
    unint64_t v94 = v14;
    if (v41)
    {
      objc_msgSend(v92, "getObjects:range:", v88, 0, v15);
      uint64_t v46 = (void *)[MEMORY[0x1E4F28E60] indexSet];
      if (v15)
      {
        uint64_t v47 = 0;
        id v48 = v88;
        do
        {
          if (bsearch_b(v48, v27, v41, 8uLL, &__block_literal_global_8)) {
            [v46 addIndex:v47];
          }
          ++v47;
          v48 += 8;
        }
        while (v15 != v47);
      }
      unint64_t v49 = v89;
      uint64_t *v89 = (uint64_t)v46;
      id v50 = v46;
      id v51 = v92;
      id v52 = (id)[v92 mutableCopy];
      uint64_t v53 = *v49;
      id v83 = v52;
      [v52 removeObjectsAtIndexes:v53];
      size_t v14 = v94;
    }
    else
    {
      id v83 = 0;
      id v51 = v92;
    }
    uint64_t v54 = objc_msgSend(v84, "getObjects:range:", v23, 0, v14);
    size_t v55 = v14;
    id v56 = v90;
    if (v45)
    {
      BOOL v84 = v9;
      uint64_t v82 = (uint64_t)&v82;
      MEMORY[0x1F4188790](v54);
      uint64_t v58 = (char *)&v82 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v59 = (void *)[MEMORY[0x1E4F28E60] indexSet];
      if (v55)
      {
        uint64_t v60 = 0;
        uint64_t v61 = 0;
        uint64_t v62 = 0;
        do
        {
          if (bsearch_b(&v23[v60], v93, v45, 8uLL, &__block_literal_global_8))
          {
            [v59 addIndex:v61];
            *(void *)&v58[8 * v62++] = *(void *)&v23[8 * v61];
          }
          ++v61;
          v60 += 8;
        }
        while (v94 != v61);
      }
      else
      {
        uint64_t v62 = 0;
      }
      id v56 = v90;
      *uint64_t v90 = v59;
      id v64 = v59;
      id v51 = v92;
      id v63 = v83;
      if (!v83) {
        id v63 = (id)[v92 mutableCopy];
      }
      uint64_t v65 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v58 count:v62];
      uint64_t v9 = (id *)v84;
      *BOOL v84 = v65;
      [v63 insertObjects:v65 atIndexes:*v56];
    }
    else
    {
      id v63 = v83;
    }
    if (!v63) {
      id v63 = v51;
    }
    unint64_t v66 = [v63 count];
    unint64_t v67 = MEMORY[0x1F4188790](v66);
    BOOL v70 = (char *)&v82 - v69;
    if (v67 > 0x200) {
      BOOL v70 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v82 - v69, 8 * v68);
    }
    objc_msgSend(v63, "getObjects:range:", v70, 0, v66);
    unint64_t v71 = (void *)[MEMORY[0x1E4F28E60] indexSet];
    char v72 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (v66)
    {
      for (uint64_t i = 0; i != v66; ++i)
      {
        if (*(void *)&v23[8 * i] != *(void *)&v70[8 * i])
        {
          [v71 addIndex:i];
          [v72 addObject:*(void *)&v23[8 * i]];
        }
      }
    }
    uint64_t v74 = [v71 count];
    uint64_t v75 = v87;
    if (v74)
    {
      *uint64_t v75 = v71;
      id v76 = v72;
      *uint64_t v91 = v76;
    }
    if (v15 >= 0x201) {
      NSZoneFree(0, v88);
    }
    uint64_t v77 = (id *)v89;
    if (v94 >= 0x201) {
      NSZoneFree(0, v23);
    }
    if (v85 >= 0x201)
    {
      NSZoneFree(0, v27);
      NSZoneFree(0, v93);
    }
    if (v66 >= 0x201) {
      NSZoneFree(0, v70);
    }
    id v78 = *v77;
    id v79 = *v56;
    id v80 = *v9;
    id v81 = *v75;
    return *v91;
  }
  return result;
}

uint64_t __61__NSManagedObject__NSInternalMethods__diffOrderedSets_____::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 > *a3) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = -1;
  }
  if (*a2 == *a3) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)_genericUpdateFromSnapshot:(_DWORD *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _PFEntityForManagedObject(a1);
  id v5 = (void *)[v4 propertiesByName];
  uint64_t v27 = _kvcPropertysPrimitiveGetters(v4);
  uint64_t v25 = _kvcPropertysPrimitiveSetters((uint64_t)v4);
  if (v4) {
    id v29 = (id)v4[13];
  }
  else {
    id v29 = 0;
  }
  uint64_t v26 = objc_msgSend(v5, "values", v25);
  uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  [a1 willAccessValueForKey:0];
  a1[4] |= 0x800u;
  unint64_t v6 = [a2 count];
  unint64_t v7 = MEMORY[0x1F4188790](v6);
  id v10 = (char *)&v25 - v9;
  size_t v11 = 8 * v8;
  if (v7 >= 0x201)
  {
    id v10 = (char *)NSAllocateScannedUncollectable();
    uint64_t v13 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v13 andKeys:v10];
  }
  else
  {
    bzero((char *)&v25 - v9, 8 * v8);
    MEMORY[0x1F4188790](v12);
    uint64_t v13 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, v11);
    [a2 getObjects:v13 andKeys:v10];
    if (!v6) {
      goto LABEL_26;
    }
  }
  uint64_t v14 = 0;
  do
  {
    uint64_t v15 = *(void *)&v10[8 * v14];
    if (*(void *)&v13[8 * v14] == v28) {
      unint64_t v16 = 0;
    }
    else {
      unint64_t v16 = *(void **)&v13[8 * v14];
    }
    unint64_t v17 = [v29 indexForKey:*(void *)&v10[8 * v14]];
    unint64_t v22 = v17;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      id v23 = (void *)[a1 primitiveValueForKey:v15];
    }
    else {
      _PF_Handler_Primitive_GetProperty((id **)a1, v17, v15, *(void *)(v27 + 8 * v17), v18, v19, v20, v21);
    }
    uint64_t v24 = v23;
    if (v16 != v23 && ([v23 isEqual:v16] & 1) == 0)
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [a1 willChangeValueForKey:v15];
        [a1 setPrimitiveValue:v16 forKey:v15];
      }
      else
      {
        if ([*(id *)(v26 + 8 * v22) _isToManyRelationship])
        {
          -[NSManagedObject _updateToManyRelationship:from:to:with:](a1, v15, v24, v16, v24);
          goto LABEL_23;
        }
        [a1 willChangeValueForKey:v15];
        _PF_Handler_Primitive_SetProperty((char **)a1, v22, v16, v15, *(void *)(v25 + 8 * v22));
      }
      [a1 didChangeValueForKey:v15];
    }
LABEL_23:
    ++v14;
  }
  while (v6 != v14);
  if (v6 >= 0x201)
  {
    NSZoneFree(0, v10);
    NSZoneFree(0, v13);
  }
LABEL_26:
  a1[4] &= ~0x800u;
}

- (void)_updateFromSnapshot:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = _PFEntityForManagedObject((id)a1);
    id v5 = v4;
    if (v4) {
      uint64_t v6 = v4[13];
    }
    else {
      uint64_t v6 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 mapping] == v6)
    {
      int v7 = *(_DWORD *)(a1 + 16);
      if ((v7 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, (_DWORD *)a1, *(void *)(a1 + 32));
        int v7 = *(_DWORD *)(a1 + 16);
      }
      *(_DWORD *)(a1 + 16) = v7 | 0x800;
      if (v5) {
        uint64_t v8 = (_OWORD *)v5[14];
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *(void *)(v6 + 40);
      uint64_t v10 = _kvcPropertysPrimitiveGetters(v5);
      uint64_t v37 = v5;
      uint64_t v36 = _kvcPropertysPrimitiveSetters((uint64_t)v5);
      uint64_t v15 = [a2 values];
      uint64_t v16 = 0;
      uint64_t v35 = v8;
      long long v17 = v8[5];
      long long v18 = v8[6];
      long long v39 = v8[3];
      long long v40 = v17;
      long long v19 = v8[10];
      long long v41 = v18;
      long long v42 = v19;
      long long v43 = v8[14];
      do
      {
        uint64_t v20 = (unint64_t *)(&v39 + v16);
        unint64_t v22 = *v20;
        unint64_t v21 = v20[1];
        if (*v20 < v21 + *v20)
        {
          do
          {
            id v23 = *(void **)(v15 + 8 * v22);
            if (v23)
            {
              uint64_t v24 = *(void *)(v9 + 8 * v22);
              _PF_Handler_Primitive_GetProperty((id **)a1, v22, v24, *(void *)(v10 + 8 * v22), v11, v12, v13, v14);
              if (v23 == NSKeyValueCoding_NullValue) {
                id v23 = 0;
              }
              if (v23 != v25
                && ([*(id *)(v37[12] + 24 + 8 * v22) _epsilonEquals:v25 rhs:v23 withFlags:1] & 1) == 0)
              {
                [(id)a1 willChangeValueForKey:v24];
                _PF_Handler_Primitive_SetProperty((char **)a1, v22, v23, v24, *(void *)(v36 + 8 * v22));
                [(id)a1 didChangeValueForKey:v24];
              }
            }
            ++v22;
            --v21;
          }
          while (v21);
        }
        ++v16;
      }
      while (v16 != 5);
      uint64_t v26 = 0;
      long long v39 = v35[9];
      long long v40 = v35[13];
      char v27 = 1;
      do
      {
        char v38 = v27;
        uint64_t v28 = (unint64_t *)(&v39 + v26);
        unint64_t v29 = *v28;
        unint64_t v30 = v28[1];
        if (*v28 < v30 + *v28)
        {
          do
          {
            size_t v31 = *(void **)(v15 + 8 * v29);
            if (v31)
            {
              uint64_t v32 = *(void *)(v9 + 8 * v29);
              _PF_Handler_Primitive_GetProperty((id **)a1, v29, v32, *(void *)(v10 + 8 * v29), v11, v12, v13, v14);
              if (v31 == NSKeyValueCoding_NullValue) {
                size_t v31 = 0;
              }
              if (v31 != v33)
              {
                size_t v34 = v33;
                if (([v33 isEqual:v31] & 1) == 0) {
                  -[NSManagedObject _updateToManyRelationship:from:to:with:]((void *)a1, v32, v34, v31, v34);
                }
              }
            }
            ++v29;
            --v30;
          }
          while (v30);
        }
        char v27 = 0;
        uint64_t v26 = 1;
      }
      while ((v38 & 1) != 0);
      *(_DWORD *)(a1 + 16) &= ~0x800u;
    }
    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:]((_DWORD *)a1, a2);
    }
  }
}

- (void)_updateFromUndoSnapshot:(_DWORD *)a1
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(*((void *)a1 + 4), sel__updateFromUndoSnapshot_);
    }
    uint64_t v58 = (id **)a1;
    uint64_t v4 = _PFEntityForManagedObject(a1);
    id v5 = v4;
    if (v4) {
      uint64_t v6 = v4[13];
    }
    else {
      uint64_t v6 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 mapping] == v6)
    {
      int v7 = a1[4];
      if ((v7 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, *((void *)a1 + 4));
        int v7 = a1[4];
      }
      a1[4] = v7 | 0x800;
      if (v5) {
        uint64_t v8 = (_OWORD *)v5[14];
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v59 = *(void *)(v6 + 40);
      uint64_t v60 = _kvcPropertysPrimitiveGetters(v5);
      uint64_t v9 = _kvcPropertysPrimitiveSetters((uint64_t)v5);
      uint64_t v14 = [a2 values];
      uint64_t v15 = 0;
      id v56 = v8;
      long long v16 = v8[6];
      long long v65 = v8[1];
      long long v66 = v16;
      long long v17 = v8[14];
      long long v67 = v8[10];
      long long v68 = v17;
      long long v18 = v58;
      do
      {
        long long v19 = (unint64_t *)(&v65 + v15);
        unint64_t v20 = *v19;
        unint64_t v21 = v19[1];
        if (*v19 < v21 + *v19)
        {
          do
          {
            uint64_t v22 = *(void *)(v14 + 8 * v20);
            if (v22)
            {
              uint64_t v23 = *(void *)(v59 + 8 * v20);
              _PF_Handler_Primitive_GetProperty(v58, v20, v23, *(void *)(v60 + 8 * v20), v10, v11, v12, v13);
              uint64_t v25 = v22 == NSKeyValueCoding_NullValue ? 0 : (void *)v22;
              if (v25 != v24 && ([v24 isEqual:v25] & 1) == 0)
              {
                [v58 willChangeValueForKey:v23];
                _PF_Handler_Primitive_SetProperty((char **)v58, v20, v25, v23, *(void *)(v9 + 8 * v20));
                [v58 didChangeValueForKey:v23];
              }
            }
            ++v20;
            --v21;
          }
          while (v21);
        }
        ++v15;
      }
      while (v15 != 4);
      uint64_t v26 = 0;
      long long v65 = v56[7];
      long long v66 = v56[11];
      char v27 = 1;
      uint64_t v28 = v59;
      do
      {
        char v29 = v27;
        unint64_t v30 = (unint64_t *)(&v65 + v26);
        unint64_t v31 = *v30;
        unint64_t v32 = v30[1];
        if (*v30 < v32 + *v30)
        {
          do
          {
            uint64_t v33 = *(void *)(v14 + 8 * v31);
            if (v33)
            {
              uint64_t v34 = *(void *)(v28 + 8 * v31);
              _PF_Handler_Primitive_GetProperty(v58, v31, v34, *(void *)(v60 + 8 * v31), v10, v11, v12, v13);
              uint64_t v36 = v33 == NSKeyValueCoding_NullValue ? 0 : (void *)v33;
              if (v36 != v35)
              {
                uint64_t v37 = v35;
                if ((![v36 isFault] || (objc_msgSend(v37, "isFault") & 1) == 0)
                  && ([v37 isEqual:v36] & 1) == 0)
                {
                  char v38 = (void *)[v36 values];
                  long long v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v37];
                  [v39 minusSet:*v38];
                  [v39 unionSet:v38[1]];
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v58, v34, v37, v39, v37);

                  uint64_t v28 = v59;
                }
              }
            }
            ++v31;
            --v32;
          }
          while (v32);
        }
        char v27 = 0;
        uint64_t v26 = 1;
      }
      while ((v29 & 1) != 0);
      uint64_t v40 = 0;
      long long v65 = v56[8];
      long long v66 = v56[12];
      char v41 = 1;
      do
      {
        char v57 = v41;
        long long v42 = (unint64_t *)(&v65 + v40);
        unint64_t v44 = *v42;
        unint64_t v43 = v42[1];
        unint64_t v45 = v43 + v44;
        if (v44 < v43 + v44)
        {
          do
          {
            uint64_t v46 = *(void *)(v14 + 8 * v44);
            if (v46)
            {
              uint64_t v47 = *(void *)(v28 + 8 * v44);
              _PF_Handler_Primitive_GetProperty(v18, v44, v47, *(void *)(v60 + 8 * v44), v10, v11, v12, v13);
              unint64_t v49 = v46 == NSKeyValueCoding_NullValue ? 0 : (void *)v46;
              if (v49 != v48)
              {
                id v50 = v48;
                if ((![v49 isFault] || (objc_msgSend(v50, "isFault") & 1) == 0)
                  && ([v50 isEqual:v49] & 1) == 0)
                {
                  id v51 = (void *)[v50 mutableCopy];
                  long long v61 = 0u;
                  long long v62 = 0u;
                  long long v63 = 0u;
                  long long v64 = 0u;
                  uint64_t v52 = [v49 countByEnumeratingWithState:&v61 objects:v69 count:16];
                  if (v52)
                  {
                    uint64_t v53 = v52;
                    uint64_t v54 = *(void *)v62;
                    do
                    {
                      for (uint64_t i = 0; i != v53; ++i)
                      {
                        if (*(void *)v62 != v54) {
                          objc_enumerationMutation(v49);
                        }
                        [*(id *)(*((void *)&v61 + 1) + 8 * i) applyToSet:v51];
                      }
                      uint64_t v53 = [v49 countByEnumeratingWithState:&v61 objects:v69 count:16];
                    }
                    while (v53);
                  }
                  long long v18 = v58;
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v58, v47, v50, v51, v50);

                  uint64_t v28 = v59;
                }
              }
            }
            ++v44;
          }
          while (v44 != v45);
        }
        char v41 = 0;
        uint64_t v40 = 1;
      }
      while ((v57 & 1) != 0);
      *((_DWORD *)v18 + 4) &= ~0x800u;
    }
    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:](a1, a2);
    }
  }
}

- (id)_orderKeysForRelationshipWithName__:(id)a3
{
  if ([(NSManagedObject *)self isUpdated]
    || [(NSManagedObject *)self isInserted]
    || [(NSManagedObject *)self isDeleted])
  {
    return 0;
  }
  id v6 = [(NSManagedObject *)self mutableOrderedSetValueForKey:a3];

  return (id)[v6 _orderedObjectsAndKeys];
}

- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 error:(id *)a5
{
  if ([(NSManagedObject *)self isUpdated]
    || [(NSManagedObject *)self isInserted]
    || [(NSManagedObject *)self isDeleted])
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E1CE0];
    }
    return 0;
  }
  else
  {
    id v10 = [(NSManagedObject *)self mutableOrderedSetValueForKey:a4];
    return [v10 _reorderObjectsToLocationsByOrderKey:a3 error:a5];
  }
}

- (BOOL)_defaultValidation:(id *)a3 error:(id *)a4
{
  return 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class Class = object_getClass(self);
  id v6 = Class;
  if (Class)
  {
    Class Superclass = Class;
    while (1)
    {
      unsigned int outCount = 0;
      uint64_t v8 = class_copyProtocolList(Superclass, &outCount);
      uint64_t v9 = v8;
      if (outCount) {
        break;
      }
      if (v8) {
LABEL_12:
      }
        free(v9);
      Class Superclass = class_getSuperclass(Superclass);
      if (!Superclass) {
        goto LABEL_14;
      }
    }
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = v9[v10];
      isMetaClass Class = class_isMetaClass(Superclass);
      objc_method_description MethodDescription = protocol_getMethodDescription(v11, a3, 1, !isMetaClass);
      types = MethodDescription.types;
      if (MethodDescription.name) {
        break;
      }
      uint64_t v15 = v9[v10];
      BOOL v16 = class_isMetaClass(Superclass);
      objc_method_description v17 = protocol_getMethodDescription(v15, a3, 0, !v16);
      types = v17.types;
      if (v17.name) {
        break;
      }
      if (++v10 >= (unint64_t)outCount) {
        goto LABEL_12;
      }
    }
    unint64_t v20 = types;
    free(v9);
  }
  else
  {
LABEL_14:
    id result = class_getInstanceMethod(v6, a3);
    if (!result) {
      return result;
    }
    Description = method_getDescription((Method)result);
    if (!Description->name) {
      return 0;
    }
    unint64_t v20 = Description->types;
  }
  return (id)[MEMORY[0x1E4F1CA38] signatureWithObjCTypes:v20];
}

+ (id)_entityName
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _PFMOClassFactoryData];
  if (v3)
  {
    uint64_t v4 = *(void **)(v3 + 16);
    if (v4) {
      return v4;
    }
  }
  Name = class_getName((Class)a1);
  if (!strncmp(Name, "NSManagedObject", 0xFuLL)) {
    return 0;
  }
  id AssociatedObject = objc_getAssociatedObject(a1, &PFEntityNameAssociationKey);
  uint64_t v7 = [AssociatedObject count];
  if (!v7)
  {
    uint64_t v9 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "persistentStoreCoordinator"), "managedObjectModel");
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          uint64_t v12 = (void *)[NSString stringWithUTF8String:Name];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v4 = 0;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v11);
                }
                objc_method_description v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
                uint64_t v18 = [v17 managedObjectClassName];
                if (v18 && [v12 isEqualToString:v18])
                {
                  if (v4) {
                    return 0;
                  }
                  uint64_t v4 = objc_msgSend(NSString, "stringWithString:", objc_msgSend(v17, "name"));
                }
              }
              uint64_t v14 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v14);
            if (v4) {
              objc_setAssociatedObject(a1, &PFEntityNameAssociationKey, (id)[MEMORY[0x1E4F1C978] arrayWithObject:v4], (void *)0x303);
            }
            return v4;
          }
        }
      }
    }
    return 0;
  }
  if (v7 != 1) {
    return 0;
  }

  return (id)[AssociatedObject lastObject];
}

+ (BOOL)_isGeneratedClass_1
{
  return 1;
}

+ (id)batchAllocateWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4 count:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a5;
  uint64_t v10 = (id *)PF_ALLOCATE_OBJECT_ARRAY(a5);
  uint64_t v11 = [a1 allocBatch:v10 withEntity:a3 count:v5];
  if (v11 == v5)
  {
    if ((*((unsigned char *)a3 + 120) & 4) == 0)
    {
      uint64_t v22 = [a3 managedObjectModel];
      id v23 = a3;
      if (v22) {
        id v23 = (id)[a3 managedObjectModel];
      }
      uint64_t v11 = [v23 _setIsEditable:0];
    }
    uint64_t v24 = (uint64_t)&v24;
    MEMORY[0x1F4188790](v11);
    uint64_t v14 = (char *)&v24 - v13;
    if (v5 > 0x200) {
      uint64_t v14 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v24 - v13, 8 * v12);
    }
    uint64_t v16 = _insertion_fault_handler;
    unsigned int v17 = +[NSTemporaryObjectID allocateBatch:forEntity:count:](NSTemporaryObjectID, "allocateBatch:forEntity:count:", v14, a3, v5, v24, v25);
    unsigned int v18 = v17;
    if (v5 && v17 == v5)
    {
      long long v19 = v10;
      long long v20 = v14;
      do
      {
        uint64_t v21 = [*v19 _initWithEntity:a3 withID:*(void *)v20 withHandler:v16 withContext:0];
        id *v19 = (id)v21;
        if (a4) {
          [a4 insertObject:v21];
        }
        else {
          _PFFaultHandlerFulfillFault(v16, v21, 0, 0, 1);
        }
        v20 += 8;
        ++v19;
        --v9;
      }
      while (v9);
    }
    if (v5 >= 0x201) {
      NSZoneFree(0, v14);
    }
    if (v18 == v5) {
      return [[_PFArray alloc] initWithObjects:v10 count:v5 andFlags:40 andContext:a4];
    }
    else {
      return 0;
    }
  }
  else
  {
    PF_FREE_OBJECT_ARRAY(v10);
    return 0;
  }
}

+ (BOOL)_hasOverriddenAwake
{
  uint64_t v2 = [a1 _PFMOClassFactoryData];
  if (v2) {
    LODWORD(v2) = (*(unsigned __int8 *)(v2 + 96) >> 5) & 1;
  }
  return v2;
}

+ (void)_initializePrimitiveAccessorStubs
{
  uint64_t v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v2 = malloc_default_zone();
  }
  uint64_t v3 = malloc_type_zone_malloc(v2, 0x190uLL, 0x80040B8603338uLL);
  os_unfair_lock_lock_with_options();
  if (qword_1EB270698)
  {
    uint64_t v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v4 = malloc_default_zone();
    }
    malloc_zone_free(v4, v3);
    uint64_t v3 = (void *)qword_1EB270698;
  }
  else
  {
    qword_1EB270698 = (uint64_t)v3;
  }
  *uint64_t v3 = _spvfk_0;
  v3[1] = _spvfk_1;
  v3[2] = _spvfk_2;
  v3[3] = _spvfk_3;
  v3[4] = _spvfk_4;
  v3[5] = _spvfk_5;
  v3[6] = _spvfk_6;
  v3[7] = _spvfk_7;
  v3[8] = _spvfk_8;
  v3[9] = _spvfk_9;
  v3[10] = _spvfk_10;
  v3[11] = _spvfk_11;
  v3[12] = _spvfk_12;
  v3[13] = _spvfk_13;
  v3[14] = _spvfk_14;
  v3[15] = _spvfk_15;
  v3[16] = _spvfk_16;
  v3[17] = _spvfk_17;
  v3[18] = _spvfk_18;
  v3[19] = _spvfk_19;
  v3[20] = _spvfk_20;
  v3[21] = _spvfk_21;
  v3[22] = _spvfk_22;
  v3[23] = _spvfk_23;
  v3[24] = _spvfk_24;
  v3[25] = _spvfk_25;
  v3[26] = _spvfk_26;
  v3[27] = _spvfk_27;
  v3[28] = _spvfk_28;
  v3[29] = _spvfk_29;
  v3[30] = _spvfk_30;
  v3[31] = _spvfk_31;
  v3[32] = _spvfk_32;
  v3[33] = _spvfk_33;
  v3[34] = _spvfk_34;
  v3[35] = _spvfk_35;
  v3[36] = _spvfk_36;
  v3[37] = _spvfk_37;
  v3[38] = _spvfk_38;
  v3[39] = _spvfk_39;
  v3[40] = _spvfk_40;
  v3[41] = _spvfk_41;
  v3[42] = _spvfk_42;
  v3[43] = _spvfk_43;
  v3[44] = _spvfk_44;
  v3[45] = _spvfk_45;
  v3[46] = _spvfk_46;
  v3[47] = _spvfk_47;
  v3[48] = _spvfk_48;
  v3[49] = _spvfk_49;
  _MergedGlobals_73 = 1;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB270670);
}

void *__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  unint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___sharedIMPL_setvfk_core_f_block_invoke;
  v6[3] = &unk_1E544C2A0;
  v6[4] = a2;
  v6[5] = v4;
  float v7 = a3;
  return _sharedIMPL_setvfk_core_scalar(a2, v4, (uint64_t)v6);
}

@end