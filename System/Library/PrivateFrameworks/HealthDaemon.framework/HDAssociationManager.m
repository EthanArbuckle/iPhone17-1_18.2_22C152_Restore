@interface HDAssociationManager
- (BOOL)associateObjectUUIDs:(id)a3 objectUUID:(id)a4 error:(id *)a5;
- (BOOL)associateObjects:(id)a3 withObject:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 error:(id *)a7;
- (BOOL)disassociateObjects:(id)a3 withObject:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 error:(id *)a7;
- (BOOL)insertCodableTypedObjectAssociations:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6;
- (HDAssociationManager)initWithProfile:(id)a3;
- (id)_lock_observersAllTypesCreateIfNil:(const os_unfair_lock *)a1;
- (id)_lock_observersForDataType:(int)a3 createIfNil:;
- (id)_lock_observersForKey:(int)a3 createIfNil:;
- (id)_observersForDataType:(uint64_t)a1;
- (id)_uuidsForObjects:(void *)a3 object:(void *)a4 subObject:(void *)a5 error:;
- (id)objectUUIDsAssociatedWithObjectUUID:(id)a3 subObject:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7;
- (void)_notifyAssociationObjectsUpdatedWithAssociatedObjects:(void *)a3 withObject:(void *)a4 destinationSubObject:(uint64_t)a5 type:(void *)a6 anchor:;
- (void)addObserver:(id)a3 forDataType:(id)a4;
- (void)addObserverForAllTypes:(id)a3;
- (void)removeObserver:(id)a3 forDataType:(id)a4;
- (void)removeObserverForAllTypes:(id)a3;
@end

@implementation HDAssociationManager

- (HDAssociationManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDAssociationManager;
  v5 = [(HDAssociationManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByDataType = v6->_observersByDataType;
    v6->_observersByDataType = v9;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)addObserver:(id)a3 forDataType:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersForDataType:createIfNil:]((uint64_t)self, v7, 1);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 addObject:v8];
  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_observersForDataType:(int)a3 createIfNil:
{
  if (a1)
  {
    v5 = (const os_unfair_lock *)(a1 + 16);
    id v6 = a2;
    os_unfair_lock_assert_owner(v5);
    id v7 = NSNumber;
    uint64_t v8 = [v6 code];

    id v9 = [v7 numberWithInteger:v8];
    v10 = -[HDAssociationManager _lock_observersForKey:createIfNil:](a1, v9, a3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)removeObserver:(id)a3 forDataType:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersForDataType:createIfNil:]((uint64_t)self, v7, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 removeObject:v8];
  os_unfair_lock_unlock(p_lock);
}

- (void)addObserverForAllTypes:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersAllTypesCreateIfNil:]((const os_unfair_lock *)self, 1);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_observersAllTypesCreateIfNil:(const os_unfair_lock *)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 4);
    id v4 = [NSNumber numberWithInteger:-1];
    id v5 = -[HDAssociationManager _lock_observersForKey:createIfNil:]((uint64_t)a1, v4, a2);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)removeObserverForAllTypes:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssociationManager _lock_observersAllTypesCreateIfNil:]((const os_unfair_lock *)self, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)associateObjectUUIDs:(id)a3 objectUUID:(id)a4 error:(id *)a5
{
  uint64_t v12 = 0;
  p_profile = &self->_profile;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = +[HDAssociationEntity associateSampleUUIDs:v9 withSampleUUID:v8 type:0 destinationSubObjectReference:0 lastInsertedEntityID:&v12 profile:WeakRetained error:a5];

  return (char)a5;
}

- (BOOL)associateObjects:(id)a3 withObject:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 error:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = [v12 UUID];
    v17 = [v13 UUID];
    *(_DWORD *)buf = 138543618;
    v30 = v16;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "Associating sample with object UUID:%{public}@ and sub Object UUID:%{public}@ ", buf, 0x16u);
  }
  v18 = -[HDAssociationManager _uuidsForObjects:object:subObject:error:]((uint64_t)self, v11, v12, v13, a7);
  if (!v18)
  {
    id v23 = 0;
    goto LABEL_11;
  }
  v19 = [v12 UUID];
  v20 = HDReferenceForAssociatableObject(v13);
  id v28 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v22 = +[HDAssociationEntity associateSampleUUIDs:v18 withSampleUUID:v19 type:a5 destinationSubObjectReference:v20 lastInsertedEntityID:&v28 profile:WeakRetained error:a7];
  id v23 = v28;

  if (!v22)
  {
LABEL_11:
    BOOL v25 = 0;
    goto LABEL_12;
  }
  if (!v23)
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Last inserted ID unexpectedly nil during association", buf, 2u);
    }
    id v23 = &unk_1F17EECA0;
  }
  -[HDAssociationManager _notifyAssociationObjectsUpdatedWithAssociatedObjects:withObject:destinationSubObject:type:anchor:]((uint64_t)self, v11, v12, v13, a5, v23);
  BOOL v25 = 1;
LABEL_12:

  return v25;
}

- (id)_uuidsForObjects:(void *)a3 object:(void *)a4 subObject:(void *)a5 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v23 = sel__uuidsForObjects_object_subObject_error_;
      uint64_t v15 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (!objc_msgSend(v9, "acceptsAssociationWithObject:", v17, v23)
            || v10 && ([v10 acceptsAssociationWithObject:v17] & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), v23, @"Sample does not support relating"");
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              if (a5) {
                *a5 = v20;
              }
              else {
                _HKLogDroppedError();
              }
            }

            id v19 = 0;
            goto LABEL_18;
          }
          v18 = [v17 UUID];
          [v11 addObject:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v19 = v11;
LABEL_18:
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)_notifyAssociationObjectsUpdatedWithAssociatedObjects:(void *)a3 withObject:(void *)a4 destinationSubObject:(uint64_t)a5 type:(void *)a6 anchor:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!a1) {
    goto LABEL_19;
  }
  if ([v12 conformsToProtocol:&unk_1F187B240])
  {
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v13;
          v18 = "Attempted to retrieve destinationSubObject: %{public}@ from Object that does not support subObjects";
          goto LABEL_15;
        }
        goto LABEL_19;
      }
      uint64_t v15 = [v13 UUID];
      v16 = [v12 subObjectFromUUID:v15];

      if (!v16)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v13;
          v18 = "Failed to retrieve destinationSubObject: %{public}@";
LABEL_15:
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
    }
    else
    {
      v16 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      id v20 = [WeakRetained appSubscriptionManager];
      v21 = [v12 sampleType];
      objc_msgSend(v20, "setAnchor:forDataCode:type:", v14, objc_msgSend(v21, "code"), 1);

      BOOL v22 = *(NSObject **)(a1 + 32);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __122__HDAssociationManager__notifyAssociationObjectsUpdatedWithAssociatedObjects_withObject_destinationSubObject_type_anchor___block_invoke;
      v25[3] = &unk_1E6306B88;
      v25[4] = a1;
      id v26 = v12;
      id v27 = v16;
      uint64_t v30 = a5;
      id v28 = v11;
      id v29 = v14;
      id v23 = v16;
      dispatch_async(v22, v25);
    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v12;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Unable to determine sample type for object: %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_19;
  }
  _HKInitializeLogging();
  v17 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v12;
    v18 = "Parent Object %{public}@ is not an HKAssociatableObject";
    goto LABEL_15;
  }
LABEL_19:
}

- (BOOL)disassociateObjects:(id)a3 withObject:(id)a4 type:(unint64_t)a5 destinationSubObject:(id)a6 error:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  _HKInitializeLogging();
  id v14 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    v16 = [v12 UUID];
    *(_DWORD *)buf = 138543362;
    id v29 = v16;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "Disassociating sample with UUID %{public}@", buf, 0xCu);
  }
  v17 = -[HDAssociationManager _uuidsForObjects:object:subObject:error:]((uint64_t)self, v11, v12, v13, a7);
  if (!v17)
  {
    id v22 = 0;
    goto LABEL_11;
  }
  v18 = [v12 UUID];
  id v19 = HDReferenceForAssociatableObject(v13);
  id v27 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v21 = +[HDAssociationEntity disassociateSampleUUIDs:v17 withSampleUUID:v18 type:a5 destinationSubObjectReference:v19 lastInsertedEntityID:&v27 profile:WeakRetained error:a7];
  id v22 = v27;

  if (!v21)
  {
LABEL_11:
    BOOL v24 = 0;
    goto LABEL_12;
  }
  if (!v22)
  {
    _HKInitializeLogging();
    id v23 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Last inserted ID unexpectedly nil during disassociation", buf, 2u);
    }
    id v22 = &unk_1F17EECA0;
  }
  -[HDAssociationManager _notifyAssociationObjectsUpdatedWithAssociatedObjects:withObject:destinationSubObject:type:anchor:]((uint64_t)self, v11, v12, v13, a5, v22);
  BOOL v24 = 1;
LABEL_12:

  return v24;
}

- (BOOL)insertCodableTypedObjectAssociations:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v62 = a4;
  id v61 = a5;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__147;
  v73 = __Block_byref_object_dispose__147;
  id v74 = 0;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v9)
  {
    uint64_t v60 = *(void *)v66;
    location = (id *)&self->_profile;
    *(void *)&long long v10 = 138543362;
    long long v53 = v10;
LABEL_3:
    uint64_t v59 = v9;
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v66 != v60) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v65 + 1) + 8 * v11);
      id v63 = v61;
      id v64 = v62;
      if ((HKWithAutoreleasePool() & 1) == 0)
      {

        BOOL v51 = 0;
        goto LABEL_46;
      }
      if (!v70[5])
      {
        _HKInitializeLogging();
        id v13 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Last inserted ID unexpectedly nil during association", (uint8_t *)&buf, 2u);
        }
        id v14 = (void *)v70[5];
        v70[5] = (uint64_t)&unk_1F17EECA0;
      }
      if (objc_msgSend(v12, "type", v53) != 1) {
        goto LABEL_42;
      }
      uint64_t v15 = [v12 objectUUIDs];
      v16 = [v12 decodedAssociationUUID];
      v17 = [v12 decodedSubObjectUUID];
      v18 = (void *)v70[5];
      id v19 = v16;
      id v20 = v17;
      id v58 = v18;
      if (self) {
        break;
      }
LABEL_41:

LABEL_42:
      if (v59 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_44;
      }
    }
    BOOL v21 = (objc_class *)MEMORY[0x1E4F1CA80];
    id v22 = v15;
    id v23 = objc_alloc_init(v21);
    id v77 = 0;
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __118__HDAssociationManager__notifyAssociationSamplesUpdatedWithUUIDs_withSampleUUID_destinationSubObjectUUID_type_anchor___block_invoke;
    v75[3] = &unk_1E6306B60;
    id v24 = v23;
    id v76 = v24;
    LOBYTE(v21) = objc_msgSend(v22, "hk_enumerateUUIDsWithError:block:", &v77, v75);

    id v57 = v77;
    if ((v21 & 1) == 0)
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = v53;
        *(void *)((char *)&buf + 4) = v57;
        _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Failed to enumerate associated UUIDs objects for association enumeration: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_40;
    }
    id v25 = v24;
    id WeakRetained = objc_loadWeakRetained(location);
    id v27 = +[HDDataEntity entityEnumeratorWithProfile:WeakRetained];

    uint64_t v28 = HDDataEntityPredicateForDataUUIDs(v25);

    [v27 setPredicate:v28];
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v78 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v82 = __55__HDAssociationManager__quantitySamplesForUUIDs_error___block_invoke;
    v83 = &unk_1E6300148;
    id v30 = v29;
    id v84 = v30;
    LOBYTE(v28) = [v27 enumerateWithError:&v78 handler:&buf];
    id v31 = v78;
    if (v28)
    {
      id v32 = v30;
      uint64_t v33 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v35 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v80 = v53;
        *(void *)&v80[4] = v31;
        _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "Failed to fetch objects for association enumeration: %{public}@", v80, 0xCu);
      }
      id v36 = v31;
      uint64_t v33 = v36;
      if (v36) {
        id v37 = v36;
      }

      id v32 = 0;
    }

    id v38 = v33;
    if (!v32)
    {
      _HKInitializeLogging();
      v46 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = v53;
        *(void *)((char *)&buf + 4) = v38;
        _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "Failed to retrieve samples with error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_39;
    }
    id v39 = objc_loadWeakRetained(location);
    *(void *)v80 = v38;
    v40 = +[HDDataEntity objectWithUUID:v19 encodingOptions:0 profile:v39 error:v80];
    id v41 = *(id *)v80;

    if (!v40)
    {
      _HKInitializeLogging();
      v47 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = v53;
        *(void *)((char *)&buf + 4) = v41;
        _os_log_error_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_ERROR, "Failed to retrieve parent sample with error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (v20)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        _HKInitializeLogging();
        v48 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          v49 = v48;
          v50 = [v20 UUIDString];
          LODWORD(buf) = v53;
          *(void *)((char *)&buf + 4) = v50;
          _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "Attempted to retrieve destinationSubObject: %{public}@ from Object that does not support subObjects", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_38;
      }
      v42 = [v40 subObjectFromUUID:v20];
      if (!v42)
      {
        _HKInitializeLogging();
        v43 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          v44 = v43;
          v45 = [v20 UUIDString];
          LODWORD(buf) = v53;
          *(void *)((char *)&buf + 4) = v45;
          _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "Failed to retrieve destinationSubObject: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_38;
      }
    }
    else
    {
      v42 = 0;
    }
    -[HDAssociationManager _notifyAssociationObjectsUpdatedWithAssociatedObjects:withObject:destinationSubObject:type:anchor:]((uint64_t)self, v32, v40, v42, 1, v58);

LABEL_38:
    id v38 = v41;
LABEL_39:

LABEL_40:
    goto LABEL_41;
  }
LABEL_44:
  BOOL v51 = 1;
LABEL_46:

  _Block_object_dispose(&v69, 8);
  return v51;
}

BOOL __85__HDAssociationManager_insertCodableTypedObjectAssociations_syncStore_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__147;
  id v31 = __Block_byref_object_dispose__147;
  id v4 = [*(id *)(a1 + 32) syncIdentityManager];
  id v32 = [v4 legacySyncIdentity];

  id v5 = [*(id *)(a1 + 32) database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __85__HDAssociationManager_insertCodableTypedObjectAssociations_syncStore_profile_error___block_invoke_2;
  v24[3] = &unk_1E62F9998;
  id v26 = &v27;
  int8x16_t v21 = *(int8x16_t *)(a1 + 32);
  id v6 = (id)v21.i64[0];
  int8x16_t v25 = vextq_s8(v21, v21, 8uLL);
  BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v5 error:a2 block:v24];

  if (v7)
  {
    id v22 = [*(id *)(a1 + 40) objectUUIDs];
    id v8 = [*(id *)(a1 + 40) decodedAssociationUUID];
    uint64_t v20 = [*(id *)(a1 + 40) type];
    uint64_t v9 = [*(id *)(a1 + 40) decodedSubObjectUUID];
    long long v10 = HDReferenceForUnknownAssociatableObjectWithUUID(v9);
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v12 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [v11 syncProvenance];
    uint64_t v15 = [(id)v28[5] entity];
    uint64_t v16 = [v15 persistentID];
    v17 = [*(id *)(a1 + 40) decodedCreationDate];
    BOOL v18 = +[HDAssociationEntity associateSampleUUIDs:v22 withSampleUUID:v8 type:v20 destinationSubObjectReference:v10 lastInsertedEntityID:&obj profile:v13 provenance:v14 syncIdentity:v16 creationDate:v17 error:a2];
    objc_storeStrong((id *)(v12 + 40), obj);
  }
  else
  {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v18;
}

uint64_t __85__HDAssociationManager_insertCodableTypedObjectAssociations_syncStore_profile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) hasSyncIdentity])
  {
    id v6 = [*(id *)(a1 + 32) syncIdentity];
    id v19 = 0;
    BOOL v7 = +[HDSyncIdentity syncIdentityWithCodable:v6 error:&v19];
    id v8 = v19;

    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 40) syncIdentityManager];
      id v18 = v8;
      uint64_t v10 = 1;
      uint64_t v11 = [v9 concreteIdentityForIdentity:v7 shouldCreate:1 transaction:v5 error:&v18];
      id v12 = v18;

      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v11;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      _HKInitializeLogging();
      uint64_t v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v21 = v12;
        _os_log_fault_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v12 = v12;
      if (!v12)
      {
LABEL_15:

        uint64_t v10 = 0;
        goto LABEL_16;
      }
      if (!a3)
      {
LABEL_8:
        _HKLogDroppedError();
        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v16 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v21 = v8;
        _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      id v12 = v8;
      if (!v12) {
        goto LABEL_15;
      }
      if (!a3) {
        goto LABEL_8;
      }
    }
    id v12 = v12;
    *a3 = v12;
    goto LABEL_15;
  }
  uint64_t v10 = 1;
LABEL_17:

  return v10;
}

- (id)objectUUIDsAssociatedWithObjectUUID:(id)a3 subObject:(id)a4 excludeDeleted:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = HDReferenceForAssociatableObject(a4);
  uint64_t v14 = +[HDAssociationEntity objectUUIDsAssociatedWithObjectUUID:v12 subObjectReference:v13 excludeDeleted:v8 profile:v11 error:a7];

  return v14;
}

uint64_t __118__HDAssociationManager__notifyAssociationSamplesUpdatedWithUUIDs_withSampleUUID_destinationSubObjectUUID_type_anchor___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __122__HDAssociationManager__notifyAssociationObjectsUpdatedWithAssociatedObjects_withObject_destinationSubObject_type_anchor___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v3;
  id v9 = v4;
  if (v1)
  {
    id v37 = v7;
    os_unfair_lock_lock(v1 + 4);
    uint64_t v10 = [NSNumber numberWithInteger:-1];
    id v11 = -[HDAssociationManager _lock_observersForKey:createIfNil:]((uint64_t)v1, v10, 0);
    id v12 = (void *)[v11 copy];

    os_unfair_lock_unlock(v1 + 4);
    v35 = v12;
    uint64_t v13 = [v12 setRepresentation];
    id v14 = (id)[v13 mutableCopy];

    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    id v38 = v6;
    uint64_t v15 = [v6 sampleType];
    uint64_t v16 = -[HDAssociationManager _observersForDataType:]((uint64_t)v1, v15);

    v34 = v16;
    v17 = [v16 allObjects];
    [v14 addObjectsFromArray:v17];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v36 = v8;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
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
          id v23 = [*(id *)(*((void *)&v43 + 1) + 8 * i) sampleType];
          id v24 = -[HDAssociationManager _observersForDataType:]((uint64_t)v1, v23);

          int8x16_t v25 = [v24 allObjects];
          [v14 addObjectsFromArray:v25];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v20);
    }

    _HKInitializeLogging();
    id v26 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = v26;
      uint64_t v28 = [v38 UUID];
      *(_DWORD *)long long buf = 138543362;
      v48 = v28;
      _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "Notifying observers of association updates for sample with UUID %{public}@", buf, 0xCu);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v29 = v14;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:buf count:16];
    id v7 = v37;
    id v6 = v38;
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * j) associationsUpdatedForObject:v38 subObject:v37 type:v5 objects:v18 anchor:v9];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:buf count:16];
      }
      while (v31);
    }

    id v8 = v36;
  }
}

- (id)_observersForDataType:(uint64_t)a1
{
  v3 = (os_unfair_lock_s *)(a1 + 16);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = -[HDAssociationManager _lock_observersForDataType:createIfNil:](a1, v4, 0);

  id v6 = (void *)[v5 copy];
  os_unfair_lock_unlock(v3);

  return v6;
}

uint64_t __55__HDAssociationManager__quantitySamplesForUUIDs_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_lock_observersForKey:(int)a3 createIfNil:
{
  id v5 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  id v6 = [*(id *)(a1 + 8) objectForKey:v5];
  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = a3 == 0;
  }
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [*(id *)(a1 + 8) setObject:v6 forKey:v5];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_observersByDataType, 0);
}

@end