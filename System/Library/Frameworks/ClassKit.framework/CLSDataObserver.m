@interface CLSDataObserver
+ (id)predicateForCollaborationStateForObjectWithID:(id)a3 ownerPersonID:(id)a4 domain:(int64_t)a5;
+ (id)predicateForCollaborationStatesForObjectWithID:(id)a3 domain:(int64_t)a4;
+ (id)predicateForCollaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4;
+ (id)predicateForObjectWithObjectID:(id)a3;
+ (id)predicateForObjectsWithIdentifier:(id)a3;
+ (id)predicateForObjectsWithObjectIDs:(id)a3;
+ (id)predicateForObjectsWithParentObjectID:(id)a3;
+ (id)predicateForObjectsWithParentObjectID:(id)a3 andRole:(unint64_t)a4;
+ (id)predicateForObjectsWithPersonID:(id)a3 andRole:(unint64_t)a4;
+ (id)predicateForUnexpiredObjects;
- (BOOL)isInvalidated;
- (CLSDataObserver)init;
- (CLSDataObserver)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (CLSDataObserver)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6;
- (CLSDataObserver)initWithQuerySpecification:(id)a3 error:(id *)a4;
- (CLSDataStore)dataStore;
- (CLSQuerySpecification)querySpec;
- (Class)objectType;
- (NSArray)sortDescriptors;
- (NSMutableSet)entitiesChangedAddedIDs;
- (NSMutableSet)entitiesChangedDeletedIDs;
- (NSMutableSet)entitiesChangedUpdatedIDs;
- (NSMutableSet)entitiesChangedUpdatedMatchingPredicateIDs;
- (NSMutableSet)entitiesChangedUpdatedNotMatchingPredicateIDs;
- (NSMutableSet)entitiesMatchingPredicate;
- (NSPredicate)predicate;
- (NSString)className;
- (NSString)description;
- (NSString)observerID;
- (id)dataChanged;
- (id)entitiesChanged;
- (id)normalizeKeyPath:(id)a3 forValue:(id)a4;
- (id)normalizedValue:(id)a3 forKeyPath:(id)a4;
- (unint64_t)changeTag;
- (void)clientRemote_entitiesChangedAdded:(id)a3 updated:(id)a4 deleted:(id)a5;
- (void)clientRemote_entitiesChangedUpdatedMatchingPredicate:(id)a3 updatedNotMatchingPredicate:(id)a4;
- (void)clientRemote_finishWithEntitiesChangedSince:(id)a3;
- (void)clientRemote_invalidate;
- (void)clientRemote_itemChanged:(unint64_t)a3;
- (void)reset;
- (void)setChangeTag:(unint64_t)a3;
- (void)setDataChanged:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setEntitiesChanged:(id)a3;
- (void)setEntitiesChangedAddedIDs:(id)a3;
- (void)setEntitiesChangedDeletedIDs:(id)a3;
- (void)setEntitiesChangedUpdatedIDs:(id)a3;
- (void)setEntitiesChangedUpdatedMatchingPredicateIDs:(id)a3;
- (void)setEntitiesChangedUpdatedNotMatchingPredicateIDs:(id)a3;
- (void)setEntitiesMatchingPredicate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation CLSDataObserver

- (CLSDataObserver)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSDataObserver)initWithQuerySpecification:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLSDataObserver;
  v8 = [(CLSDataObserver *)&v45 init];
  id v11 = objc_msgSend_predicate(v7, v9, v10);

  if (v11)
  {
    v14 = objc_msgSend_predicate(v7, v12, v13);
    id v44 = 0;
    v16 = objc_msgSend_cls_normalizedPredicate_error_(v14, v15, (uint64_t)v8, &v44);
    id v17 = v44;

    if (v16) {
      BOOL v19 = v17 == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (!v19)
    {
      objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E4F28C58], v18, (uint64_t)a4, v17);
      if (v17)
      {
        if (qword_1EB5D4D10 != -1) {
          dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
        }
        v20 = (void *)CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          v40 = v20;
          v43 = objc_msgSend_debugDescription(v17, v41, v42);
          *(_DWORD *)buf = 138412546;
          v47 = v16;
          __int16 v48 = 2112;
          v49 = v43;
          _os_log_error_impl(&dword_1DC60F000, v40, OS_LOG_TYPE_ERROR, "initWithQuerySpecification: bad predicate:%@ error:%@", buf, 0x16u);
        }
      }

      v21 = 0;
      goto LABEL_16;
    }
    objc_msgSend_setPredicate_(v7, v18, (uint64_t)v16);
  }
  if (v8)
  {
    v22 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v12, v13);
    uint64_t v25 = objc_msgSend_UUIDString(v22, v23, v24);
    observerID = v8->_observerID;
    v8->_observerID = (NSString *)v25;

    objc_storeStrong((id *)&v8->_querySpec, a3);
    v8->_changeTag = -1;
    uint64_t v27 = objc_opt_new();
    entitiesMatchingPredicate = v8->_entitiesMatchingPredicate;
    v8->_entitiesMatchingPredicate = (NSMutableSet *)v27;

    uint64_t v29 = objc_opt_new();
    entitiesChangedAddedIDs = v8->_entitiesChangedAddedIDs;
    v8->_entitiesChangedAddedIDs = (NSMutableSet *)v29;

    uint64_t v31 = objc_opt_new();
    entitiesChangedUpdatedIDs = v8->_entitiesChangedUpdatedIDs;
    v8->_entitiesChangedUpdatedIDs = (NSMutableSet *)v31;

    uint64_t v33 = objc_opt_new();
    entitiesChangedDeletedIDs = v8->_entitiesChangedDeletedIDs;
    v8->_entitiesChangedDeletedIDs = (NSMutableSet *)v33;

    uint64_t v35 = objc_opt_new();
    entitiesChangedUpdatedMatchingPredicateIDs = v8->_entitiesChangedUpdatedMatchingPredicateIDs;
    v8->_entitiesChangedUpdatedMatchingPredicateIDs = (NSMutableSet *)v35;

    uint64_t v37 = objc_opt_new();
    entitiesChangedUpdatedNotMatchingPredicateIDs = v8->_entitiesChangedUpdatedNotMatchingPredicateIDs;
    v8->_entitiesChangedUpdatedNotMatchingPredicateIDs = (NSMutableSet *)v37;
  }
  v21 = v8;
LABEL_16:

  return v21;
}

- (CLSDataObserver)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a5;
  uint64_t v10 = objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v9, (uint64_t)a3, a4);
  objc_msgSend_setSortDescriptors_(v10, v11, (uint64_t)v8);

  uint64_t v15 = 0;
  uint64_t v13 = (CLSDataObserver *)objc_msgSend_initWithQuerySpecification_error_(self, v12, (uint64_t)v10, &v15);

  return v13;
}

- (CLSDataObserver)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v12 = objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v11, (uint64_t)a3, a4);
  objc_msgSend_setSortDescriptors_(v12, v13, (uint64_t)v10);

  Specification_error = (CLSDataObserver *)objc_msgSend_initWithQuerySpecification_error_(self, v14, (uint64_t)v12, a6);
  return Specification_error;
}

- (Class)objectType
{
  objc_msgSend_entityName(self->_querySpec, a2, v2);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = NSClassFromString(v3);

  return (Class)v4;
}

- (NSString)className
{
  return (NSString *)objc_msgSend_entityName(self->_querySpec, a2, v2);
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_msgSend_predicate(self->_querySpec, a2, v2);
}

- (NSArray)sortDescriptors
{
  return (NSArray *)objc_msgSend_sortDescriptors(self->_querySpec, a2, v2);
}

- (void)setSortDescriptors:(id)a3
{
  id v5 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  objc_msgSend_setSortDescriptors_(self->_querySpec, v4, (uint64_t)v5);
}

+ (id)predicateForObjectWithObjectID:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"%K == %@", @"objectID", a3);
}

+ (id)predicateForObjectsWithObjectIDs:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"%K IN %@", @"objectID", a3);
}

+ (id)predicateForObjectsWithParentObjectID:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"%K == %@", @"parentObjectID", a3);
}

+ (id)predicateForObjectsWithIdentifier:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"%K == %@", @"identifier", a3);
}

+ (id)predicateForObjectsWithPersonID:(id)a3 andRole:(unint64_t)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = NSNumber;
  id v7 = a3;
  v9 = objc_msgSend_numberWithUnsignedInteger_(v6, v8, a4);
  id v11 = objc_msgSend_predicateWithFormat_(v5, v10, @"%K == %@ && %K = %@", @"personID", v7, @"roles", v9);

  return v11;
}

+ (id)predicateForObjectsWithParentObjectID:(id)a3 andRole:(unint64_t)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = NSNumber;
  id v7 = a3;
  v9 = objc_msgSend_numberWithUnsignedInteger_(v6, v8, a4);
  id v11 = objc_msgSend_predicateWithFormat_(v5, v10, @"%K == %@ && %K = %@", @"parentObjectID", v7, @"roles", v9);

  return v11;
}

+ (id)predicateForCollaborationStateForObjectWithID:(id)a3 ownerPersonID:(id)a4 domain:(int64_t)a5
{
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  v12 = objc_msgSend_numberWithInteger_(v8, v11, a5);
  v14 = objc_msgSend_predicateWithFormat_(v7, v13, @"%K == %@ && %K = %@ && %K == %@", @"parentObjectID", v10, @"ownerPersonID", v9, @"domain", v12);

  return v14;
}

+ (id)predicateForCollaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"%K == %@ && %K = %@", @"parentObjectID", a3, @"ownerPersonID", a4);
}

+ (id)predicateForCollaborationStatesForObjectWithID:(id)a3 domain:(int64_t)a4
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v9 = objc_msgSend_numberWithInteger_(v6, v8, a4);
  id v11 = objc_msgSend_predicateWithFormat_(v5, v10, @"%K == %@ && %K == %@", @"parentObjectID", v7, @"domain", v9);

  return v11;
}

+ (id)predicateForUnexpiredObjects
{
  v3 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2);
  uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = NSNumber;
  objc_msgSend_timeIntervalSinceReferenceDate(v3, v6, v7);
  id v10 = objc_msgSend_numberWithDouble_(v5, v8, v9);
  v12 = objc_msgSend_predicateWithFormat_(v4, v11, @"%K != %@ and %K > %@", @"dateExpires", &unk_1F37B83A8, @"dateExpires", v10);

  return v12;
}

- (void)reset
{
}

- (void)clientRemote_invalidate
{
  if ((objc_msgSend_isInvalidated(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_setInvalidated_(self, v4, 1);
    objc_msgSend_dataStore(self, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deregisterDataObserver_(v8, v7, (uint64_t)self);
  }
}

- (void)clientRemote_itemChanged:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_changeTag(self, a2, a3);
  objc_msgSend_setChangeTag_(self, v6, a3);
  if (self->_dataChanged)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    uint64_t v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412802;
      uint64_t v9 = self;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_debug_impl(&dword_1DC60F000, v7, OS_LOG_TYPE_DEBUG, "Calling dataChanged for CLSDataObserver: %@, old changeTag: %lu, new changeTag: %lu", (uint8_t *)&v8, 0x20u);
    }
    (*((void (**)(void))self->_dataChanged + 2))();
  }
}

- (void)clientRemote_entitiesChangedAdded:(id)a3 updated:(id)a4 deleted:(id)a5
{
  entitiesChangedAddedIDs = self->_entitiesChangedAddedIDs;
  id v13 = a5;
  id v9 = a4;
  objc_msgSend_unionSet_(entitiesChangedAddedIDs, v10, (uint64_t)a3);
  objc_msgSend_unionSet_(self->_entitiesChangedUpdatedIDs, v11, (uint64_t)v9);

  objc_msgSend_unionSet_(self->_entitiesChangedDeletedIDs, v12, (uint64_t)v13);
}

- (void)clientRemote_entitiesChangedUpdatedMatchingPredicate:(id)a3 updatedNotMatchingPredicate:(id)a4
{
  entitiesChangedUpdatedMatchingPredicateIDs = self->_entitiesChangedUpdatedMatchingPredicateIDs;
  id v9 = a4;
  objc_msgSend_unionSet_(entitiesChangedUpdatedMatchingPredicateIDs, v7, (uint64_t)a3);
  objc_msgSend_unionSet_(self->_entitiesChangedUpdatedNotMatchingPredicateIDs, v8, (uint64_t)v9);
}

- (void)clientRemote_finishWithEntitiesChangedSince:(id)a3
{
  id v60 = a3;
  uint64_t v6 = objc_msgSend_mutableCopy(self->_entitiesChangedAddedIDs, v4, v5);
  id v9 = objc_msgSend_mutableCopy(self->_entitiesChangedUpdatedIDs, v7, v8);
  __int16 v12 = objc_msgSend_mutableCopy(self->_entitiesChangedDeletedIDs, v10, v11);
  uint64_t v15 = objc_msgSend_predicate(self->_querySpec, v13, v14);

  if (v15)
  {
    v18 = (void *)MEMORY[0x1E01A0360]();
    v21 = objc_msgSend_mutableCopy(self->_entitiesChangedUpdatedMatchingPredicateIDs, v19, v20);
    objc_msgSend_minusSet_(v21, v22, (uint64_t)self->_entitiesMatchingPredicate);
    objc_msgSend_unionSet_(v6, v23, (uint64_t)v21);

    uint64_t v24 = (void *)MEMORY[0x1E01A0360]();
    uint64_t v27 = objc_msgSend_mutableCopy(self->_entitiesMatchingPredicate, v25, v26);
    objc_msgSend_intersectSet_(v27, v28, (uint64_t)self->_entitiesChangedUpdatedMatchingPredicateIDs);
    objc_msgSend_unionSet_(v9, v29, (uint64_t)v27);

    v30 = (void *)MEMORY[0x1E01A0360]();
    uint64_t v33 = objc_msgSend_mutableCopy(self->_entitiesMatchingPredicate, v31, v32);
    objc_msgSend_intersectSet_(v33, v34, (uint64_t)self->_entitiesChangedUpdatedNotMatchingPredicateIDs);
    objc_msgSend_unionSet_(v12, v35, (uint64_t)v33);

    objc_msgSend_intersectSet_(v12, v36, (uint64_t)self->_entitiesMatchingPredicate);
  }
  BOOL v39 = !objc_msgSend_count(v6, v16, v17) && !objc_msgSend_count(v9, v37, v38) && objc_msgSend_count(v12, v37, v38) == 0;
  entitiesChanged = (void (**)(id, id, void *, void *, void *))self->_entitiesChanged;
  if (entitiesChanged && !v39)
  {
    v41 = objc_msgSend_copy(v6, v37, v38);
    id v44 = objc_msgSend_copy(v9, v42, v43);
    v47 = objc_msgSend_copy(v12, v45, v46);
    entitiesChanged[2](entitiesChanged, v60, v41, v44, v47);
  }
  __int16 v48 = objc_msgSend_predicate(self->_querySpec, v37, v38);

  if (v48)
  {
    objc_msgSend_minusSet_(self->_entitiesMatchingPredicate, v49, (uint64_t)v12);
    objc_msgSend_unionSet_(self->_entitiesMatchingPredicate, v51, (uint64_t)v6);
  }
  objc_msgSend_removeAllObjects(self->_entitiesChangedAddedIDs, v49, v50);
  objc_msgSend_removeAllObjects(self->_entitiesChangedUpdatedIDs, v52, v53);
  objc_msgSend_removeAllObjects(self->_entitiesChangedDeletedIDs, v54, v55);
  objc_msgSend_removeAllObjects(self->_entitiesChangedUpdatedMatchingPredicateIDs, v56, v57);
  objc_msgSend_removeAllObjects(self->_entitiesChangedUpdatedNotMatchingPredicateIDs, v58, v59);
}

- (NSString)description
{
  v46.receiver = self;
  v46.super_class = (Class)CLSDataObserver;
  v3 = [(CLSDataObserver *)&v46 description];
  uint64_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendString_(v6, v7, @" (invalidated: ");
  if (objc_msgSend_isInvalidated(self, v8, v9)) {
    objc_msgSend_appendString_(v6, v10, @"YES");
  }
  else {
    objc_msgSend_appendString_(v6, v10, @"NO");
  }
  objc_msgSend_appendString_(v6, v11, @" (observerID: "));
  objc_msgSend_appendString_(v6, v12, (uint64_t)self->_observerID);
  objc_msgSend_appendString_(v6, v13, @" (querySpec.entityName: "));
  v16 = objc_msgSend_entityName(self->_querySpec, v14, v15);
  objc_msgSend_appendString_(v6, v17, (uint64_t)v16);

  objc_msgSend_appendString_(v6, v18, @""));
  v21 = objc_msgSend_predicate(self->_querySpec, v19, v20);

  if (v21)
  {
    objc_msgSend_appendString_(v6, v22, @" (querySpec.predicate: "));
    uint64_t v26 = objc_msgSend_predicate(self->_querySpec, v24, v25);
    uint64_t v29 = objc_msgSend_debugDescription(v26, v27, v28);
    objc_msgSend_appendString_(v6, v30, (uint64_t)v29);

    objc_msgSend_appendString_(v6, v31, @""));
  }
  uint64_t v32 = objc_msgSend_sortDescriptors(self->_querySpec, v22, v23);

  if (v32)
  {
    objc_msgSend_appendString_(v6, v33, @" (querySpec.sortDescriptors: "));
    uint64_t v37 = objc_msgSend_sortDescriptors(self->_querySpec, v35, v36);
    v40 = objc_msgSend_debugDescription(v37, v38, v39);
    objc_msgSend_appendString_(v6, v41, (uint64_t)v40);

    objc_msgSend_appendString_(v6, v42, @""));
  }
  if (objc_msgSend_observerOptions(self->_querySpec, v33, v34)) {
    objc_msgSend_appendString_(v6, v43, @" (behavior: entitiesChanged"));
  }
  else {
    objc_msgSend_appendString_(v6, v43, @" (behavior: dataChanged"));
  }
  objc_msgSend_appendString_(v6, v44, @""));

  return (NSString *)v6;
}

- (id)normalizeKeyPath:(id)a3 forValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB5D4C60 != -1) {
    dispatch_once(&qword_1EB5D4C60, &unk_1F37A1790);
  }
  id v8 = (id)qword_1EB5D4C58;
  if (objc_msgSend_containsObject_(v8, v9, (uint64_t)v6)) {
    goto LABEL_9;
  }
  int isSearchEnabledProcess = objc_msgSend_isSearchEnabledProcess(CLSEntitlements, v10, v11);
  if (isSearchEnabledProcess)
  {
    if (qword_1EB5D4C70 != -1) {
      dispatch_once(&qword_1EB5D4C70, &unk_1F37A0EB0);
    }
    id v4 = (id)qword_1EB5D4C68;
    if (objc_msgSend_containsObject_(v4, v15, (uint64_t)v6))
    {

LABEL_9:
LABEL_10:
      if (qword_1EB5D4C90 != -1) {
        dispatch_once(&qword_1EB5D4C90, &unk_1F37A0EF0);
      }
      BOOL v19 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EB5D4C88, v18, (uint64_t)v6);
      if (v19)
      {
        id v8 = v19;
        id v20 = v8;
      }
      else
      {
        id v20 = v6;
        id v8 = 0;
      }
      goto LABEL_26;
    }
    if (objc_msgSend_isDashboardAppProcess(CLSEntitlements, v16, v17))
    {
LABEL_18:
      if (qword_1EB5D4C80 != -1) {
        dispatch_once(&qword_1EB5D4C80, &unk_1F37A0ED0);
      }
      char v22 = objc_msgSend_containsObject_((void *)qword_1EB5D4C78, v21, (uint64_t)v6);
      if (isSearchEnabledProcess) {

      }
      if ((v22 & 1) == 0)
      {
        id v20 = 0;
        goto LABEL_27;
      }
      goto LABEL_10;
    }
  }
  else if (objc_msgSend_isDashboardAppProcess(CLSEntitlements, v12, v13))
  {
    goto LABEL_18;
  }
  id v20 = 0;
LABEL_26:

LABEL_27:

  return v20;
}

- (id)normalizedValue:(id)a3 forKeyPath:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)a4;
  unint64_t v8 = v6;
  if ((!(v6 | (unint64_t)@"personID")
     || v6
     && @"personID"
     && objc_msgSend_isEqualToString_((void *)v6, v7, @"personID"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v11 = objc_msgSend_person(v5, v9, v10);
    uint64_t v14 = v11;
    if (v11) {
      objc_msgSend_objectID(v11, v12, v13);
    }
    else {
    v18 = objc_msgSend_magicValue(CLSCurrentUser, v12, v13);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = @"parentObjectID";
      if (!(v8 | (unint64_t)@"parentObjectID")
        || v8
        && @"parentObjectID"
        && objc_msgSend_isEqualToString_((void *)v8, v15, @"parentObjectID"))
      {
        uint64_t v17 = objc_msgSend_objectID(v5, v15, (uint64_t)v16);

        id v5 = (id)v17;
      }
    }
    id v5 = v5;
    v18 = v5;
  }

  return v18;
}

- (CLSQuerySpecification)querySpec
{
  return self->_querySpec;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSString)observerID
{
  return self->_observerID;
}

- (id)dataChanged
{
  return self->_dataChanged;
}

- (void)setDataChanged:(id)a3
{
}

- (id)entitiesChanged
{
  return self->_entitiesChanged;
}

- (void)setEntitiesChanged:(id)a3
{
}

- (NSMutableSet)entitiesMatchingPredicate
{
  return self->_entitiesMatchingPredicate;
}

- (void)setEntitiesMatchingPredicate:(id)a3
{
}

- (NSMutableSet)entitiesChangedAddedIDs
{
  return self->_entitiesChangedAddedIDs;
}

- (void)setEntitiesChangedAddedIDs:(id)a3
{
}

- (NSMutableSet)entitiesChangedUpdatedIDs
{
  return self->_entitiesChangedUpdatedIDs;
}

- (void)setEntitiesChangedUpdatedIDs:(id)a3
{
}

- (NSMutableSet)entitiesChangedDeletedIDs
{
  return self->_entitiesChangedDeletedIDs;
}

- (void)setEntitiesChangedDeletedIDs:(id)a3
{
}

- (NSMutableSet)entitiesChangedUpdatedMatchingPredicateIDs
{
  return self->_entitiesChangedUpdatedMatchingPredicateIDs;
}

- (void)setEntitiesChangedUpdatedMatchingPredicateIDs:(id)a3
{
}

- (NSMutableSet)entitiesChangedUpdatedNotMatchingPredicateIDs
{
  return self->_entitiesChangedUpdatedNotMatchingPredicateIDs;
}

- (void)setEntitiesChangedUpdatedNotMatchingPredicateIDs:(id)a3
{
}

- (CLSDataStore)dataStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);

  return (CLSDataStore *)WeakRetained;
}

- (void)setDataStore:(id)a3
{
}

- (unint64_t)changeTag
{
  return self->_changeTag;
}

- (void)setChangeTag:(unint64_t)a3
{
  self->_changeTag = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStore);
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedNotMatchingPredicateIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedMatchingPredicateIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedDeletedIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedAddedIDs, 0);
  objc_storeStrong((id *)&self->_entitiesMatchingPredicate, 0);
  objc_storeStrong(&self->_entitiesChanged, 0);
  objc_storeStrong(&self->_dataChanged, 0);
  objc_storeStrong((id *)&self->_observerID, 0);

  objc_storeStrong((id *)&self->_querySpec, 0);
}

@end