@interface NSFaultHandler
+ (BOOL)accessInstanceVariablesDirectly;
+ (void)initialize;
- (id)fulfillFault:(id)a3 withContext:(id)a4 forIndex:(unint64_t)a5;
- (id)fulfillFault:(uint64_t)a3 withContext:;
- (id)fulfillFault:(uint64_t)a3 withContext:(id *)a4 error:;
- (id)initWithPersistenceStore:(id)result;
- (id)retainedFulfillAggregateFaultForObject:(void *)a3 andRelationship:(uint64_t)a4 withContext:;
- (uint64_t)retainedOrderedFaultInformationForAggregateFaultForObject:(void *)a3 andRelationship:(uint64_t)a4 withContext:(id *)a5 error:;
- (void)_fireFirstAndSecondLevelFaultsForObject:(uint64_t)a1 withContext:(void *)a2;
- (void)turnObject:(uint64_t)a3 intoFaultWithContext:;
@end

@implementation NSFaultHandler

- (id)initWithPersistenceStore:(id)result
{
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)NSFaultHandler;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (id)fulfillFault:(id)a3 withContext:(id)a4 forIndex:(unint64_t)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a4, a2);
  }

  return _PFFaultHandlerLookupRow(a3, (uint64_t)a4, 0, 1, a5);
}

- (void)turnObject:(uint64_t)a3 intoFaultWithContext:
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a3, sel_turnObject_intoFaultWithContext_);
    }
    int v5 = (*(_DWORD *)(a2 + 16) >> 15) & 7;
    if (v5 == 5 || v5 == 0)
    {
      v7 = (void *)MEMORY[0x18C127630]();
      [(id)a2 willTurnIntoFault];
      v8 = _PFEntityForManagedObject((id)a2);
      uint64_t v9 = (uint64_t)v8;
      v10 = *(uint64_t **)(a2 + 48);
      if (v10)
      {
        uint64_t v11 = *v10;
        int v12 = *(_DWORD *)(a2 + 16);
        if (v11) {
          BOOL v13 = (*(_DWORD *)(a2 + 16) & 0x2000) == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13)
        {
          if (v8)
          {
            uint64_t v14 = *(void *)(v8[19] + 48);
            BOOL v24 = v14 == 0;
            if (v14)
            {
              if (a3) {
                ++*(_WORD *)(a3 + 46);
              }
              *(_DWORD *)(a2 + 16) = v12 | 0x1000;
              [(id)a2 _willChangeValuesForKeys:v14];
              int v12 = *(_DWORD *)(a2 + 16);
            }
            uint64_t v23 = v14;
            v15 = v7;
            *(_DWORD *)(a2 + 16) = v12 & 0xFFFC7FFF | 0x10000;
            goto LABEL_25;
          }
          *(_DWORD *)(a2 + 16) = v12 & 0xFFFC7FFF | 0x10000;
LABEL_37:
          objc_msgSend((id)a2, "didTurnIntoFault", v23);
          *(_DWORD *)(a2 + 16) = *(_DWORD *)(a2 + 16) & 0xFFFC7FFF | 0x8000;
          return;
        }
      }
      else
      {
        int v12 = *(_DWORD *)(a2 + 16);
      }
      *(_DWORD *)(a2 + 16) = v12 & 0xFFFC7FFF | 0x10000;
      if (v8)
      {
        v15 = v7;
        uint64_t v23 = 0;
        BOOL v24 = 1;
LABEL_25:
        v16 = *(unint64_t **)(v9 + 112);
        unint64_t v18 = *v16;
        uint64_t v17 = v16[1];
        uint64_t v19 = _kvcPropertysPrimitiveSetters(v9);
        if (v18 < v17 + v18)
        {
          v20 = (void **)(v19 + 8 * v18);
          uint64_t v21 = v17;
          do
          {
            if (*v20)
            {
              if (isScalarTypeForKVCSetter(*v20)) {
                v22 = (void *)_CD_ScalarNull;
              }
              else {
                v22 = 0;
              }
              _PF_CopyOnWrite_Snapshot((id)a2);
              _NSSetUsingKeyValueSetter();
            }
            ++v20;
            --v21;
          }
          while (v21);
        }
        [(NSManagedObject *)a2 _clearRawPropertiesWithHint:v17];
        v7 = v15;
        if (!v24)
        {
          [(id)a2 _didChangeValuesForKeys:v23];
          *(_DWORD *)(a2 + 16) &= ~0x1000u;
          if (a3) {
            --*(_WORD *)(a3 + 46);
          }
        }
        goto LABEL_37;
      }
      goto LABEL_37;
    }
  }
}

- (id)fulfillFault:(uint64_t)a3 withContext:
{
  if (result)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a3, sel_fulfillFault_withContext_);
    }
    return _PFFaultHandlerLookupRow(a2, a3, 0, 1, 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (id)retainedFulfillAggregateFaultForObject:(void *)a3 andRelationship:(uint64_t)a4 withContext:
{
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a4, sel_retainedFulfillAggregateFaultForObject_andRelationship_withContext_);
  }
  uint64_t v7 = [a3 _propertyType];
  if (a4)
  {
    if (v7 == 3)
    {
      id v31 = 0;
      v8 = objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "copy");
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a2, @"FETCH_SOURCE", a3, @"FETCHED_PROPERTY", 0);
      v10 = objc_msgSend((id)objc_msgSend(v8, "predicate"), "predicateWithSubstitutionVariables:", v9);
      [v8 setPredicate:v10];
      [v10 allowEvaluation];
      uint64_t v11 = (void *)[(id)a4 executeFetchRequest:v8 error:&v31];

      if (v31)
      {
        uint64_t v21 = *MEMORY[0x1E4F28778];
        uint64_t v22 = [v31 code];
        uint64_t v23 = [NSString stringWithFormat:@"CoreData could not fulfill a fetched property because '%@'", objc_msgSend(v31, "localizedDescription")];
        id v24 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v21, v22, v23, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v31, *MEMORY[0x1E4F28A50], objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", a2), @"NSAffectedObjectsErrorKey", a3, @"Fetched Property", 0));
        [v31 code];
        [v24 userInfo];
        _NSCoreDataLog(2, @"CoreData Debug Logging: Exception = %@ with error code = %ld and userInfo = %@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
        objc_exception_throw(v24);
      }
      return v11;
    }
    id v31 = 0;
    v15 = (void *)[a2 objectID];
    v16 = v15;
    unsigned __int8 v17 = atomic_load((unsigned __int8 *)(a4 + 48));
    if (v17)
    {
      unint64_t v18 = (void *)MEMORY[0x18C127630]();
      uint64_t v12 = [*(id *)(a4 + 32) newValueForRelationship:a3 forObjectWithID:v16 withContext:a4 error:&v31];
      id v19 = v31;
      id v20 = v31;
      return (id)v12;
    }
    if ([v15 persistentStore]
      && ([a2 isInserted] & 1) == 0
      && ([a3 isTransient] & 1) == 0)
    {
      -[NSManagedObjectContext lockObjectStore](a4);
      uint64_t v12 = [*(id *)(a4 + 32) newValueForRelationship:a3 forObjectWithID:v16 withContext:a4 error:&v31];
      -[NSManagedObjectContext unlockObjectStore](a4);
      return (id)v12;
    }
    return 0;
  }
  BOOL v13 = NSArray_EmptyArray;

  return v13;
}

- (id)fulfillFault:(uint64_t)a3 withContext:(id *)a4 error:
{
  if (result)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a3, sel_fulfillFault_withContext_error_);
    }
    return _PFFaultHandlerLookupRow(a2, a3, a4, 0, 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

+ (void)initialize
{
  if (!_CD_ScalarNull)
  {
    self;
    _NSKeyValueIvarSetterClass = (uint64_t)NSClassFromString((NSString *)@"NSKeyValueIvarSetter");
    _NSKeyValueMethodSetterClass = (uint64_t)NSClassFromString((NSString *)@"NSKeyValueMethodSetter");
    _NSKeyValueIvarGetterClass = (uint64_t)NSClassFromString((NSString *)@"NSKeyValueIvarGetter");
    _NSKeyValueMethodGetterClass = (uint64_t)NSClassFromString((NSString *)@"NSKeyValueMethodGetter");
    uint64_t valuePtr = 0;
    _CD_ScalarNull = (uint64_t)CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (!_insertion_fault_handler)
    {
      v2 = [NSFaultHandler alloc];
      if (v2)
      {
        v4.receiver = v2;
        v4.super_class = (Class)NSFaultHandler;
        v2 = objc_msgSendSuper2(&v4, sel_init);
      }
      _insertion_fault_handler = (uint64_t)v2;
    }
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (uint64_t)retainedOrderedFaultInformationForAggregateFaultForObject:(void *)a3 andRelationship:(uint64_t)a4 withContext:(id *)a5 error:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a4, sel_retainedOrderedFaultInformationForAggregateFaultForObject_andRelationship_withContext_error_);
  }
  uint64_t v9 = [a3 _propertyType];
  if (a4)
  {
    if (v9 == 4 && [a3 isOrdered])
    {
      v10 = (void *)[a2 objectID];
      uint64_t v11 = v10;
      unsigned __int8 v12 = atomic_load((unsigned __int8 *)(a4 + 48));
      if (v12)
      {
        id v21 = 0;
        unint64_t v18 = (void *)MEMORY[0x18C127630]();
        uint64_t v17 = [*(id *)(a4 + 32) _newOrderedRelationshipInformationForRelationship:a3 forObjectWithID:v11 withContext:a4 error:&v21];
        id v19 = v21;
        id v20 = v21;
        if (a5 && v21) {
          *a5 = v21;
        }
        return v17;
      }
      if ([v10 persistentStore]
        && ([a2 isInserted] & 1) == 0
        && ([a3 isTransient] & 1) == 0)
      {
        -[NSManagedObjectContext lockObjectStore](a4);
        uint64_t v13 = [*(id *)(a4 + 32) _newOrderedRelationshipInformationForRelationship:a3 forObjectWithID:v11 withContext:a4 error:a5];
        -[NSManagedObjectContext unlockObjectStore](a4);
        return v13;
      }
    }
    return 0;
  }
  if (!a5) {
    return 0;
  }
  v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F281F8];
  uint64_t v22 = @"message";
  v23[0] = [NSString stringWithFormat:@"failed to retrieve ordering information from fault for object %@ and relationship %@ due to nil NSManagedObjectContext", objc_msgSend(a2, "objectID"), objc_msgSend(a3, "name")];
  uint64_t v17 = 0;
  *a5 = (id)objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
  return v17;
}

- (void)_fireFirstAndSecondLevelFaultsForObject:(uint64_t)a1 withContext:(void *)a2
{
  if (a1)
  {
    [a2 willAccessValueForKey:0];
    v3 = (void *)[a2 entity];
    uint64_t v4 = v3[14];
    uint64_t v5 = *(void *)(v3[13] + 40);
    uint64_t v10 = _kvcPropertysPrimitiveGetters(v3);
    for (unint64_t i = 0; i != 4; ++i)
    {
      unsigned __int8 v12 = (unint64_t *)(v4 + 16
                                    * __const__fireFirstAndSecondLevelFaultsForObject_withContext__rangeIndices[i]);
      unint64_t v13 = *v12;
      unint64_t v14 = v12[1];
      if (*v12 < v14 + *v12)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a2, v13, *(void *)(v5 + 8 * v13), *(void *)(v10 + 8 * v13), v6, v7, v8, v9);
          if (i >= 2) {
            [v15 willRead];
          }
          ++v13;
          --v14;
        }
        while (v14);
      }
    }
  }
}

@end