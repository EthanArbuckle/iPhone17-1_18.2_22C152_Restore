@interface CKSyncEngineState
+ (BOOL)supportsSecureCoding;
+ (id)emptyState;
- (BOOL)containsInFlightRecordZoneChange:(id)a3;
- (BOOL)containsPendingRecordZoneChange:(id)a3;
- (BOOL)didPerformInitialUserRecordIDFetch;
- (BOOL)hasInFlightUntrackedChanges;
- (BOOL)hasPendingUntrackedChanges;
- (BOOL)needsToDeleteZoneID:(id)a3;
- (BOOL)needsToFetchChangesForZoneID:(id)a3;
- (BOOL)needsToFetchDatabaseChanges;
- (BOOL)needsToSaveDatabaseSubscription;
- (BOOL)needsToSaveZoneID:(id)a3;
- (BOOL)useMockNextKnownUserRecordID;
- (CKRecordID)lastKnownUserRecordID;
- (CKRecordID)mockNextKnownUserRecordID;
- (CKServerChangeToken)serverChangeTokenForDatabase;
- (CKSyncEngineState)init;
- (CKSyncEngineState)initWithCoder:(id)a3;
- (CKSyncEngineState)initWithData:(id)a3 error:(id *)a4;
- (CKSyncEngineState)initWithStateSerialization:(id)a3 error:(id *)a4;
- (NSArray)inFlightRecordChanges;
- (NSArray)pendingDatabaseChanges;
- (NSArray)pendingRecordZoneChanges;
- (NSArray)zoneIDsWithUnfetchedServerChanges;
- (NSDate)lastFetchDatabaseChangesDate;
- (NSDictionary)fakeZonesToSaveForSerializationTests;
- (NSMutableDictionary)mServerChangeTokensByZoneID;
- (NSOrderedSet)fakeRecordIDsToDeleteForSerializationTests;
- (NSOrderedSet)fakeRecordIDsToSaveForSerializationTests;
- (NSOrderedSet)fakeZoneIDsToDeleteForSerializationTests;
- (NSOrderedSet)fakeZoneIDsToSaveForSerializationTests;
- (NSString)existingDatabaseSubscriptionID;
- (NSString)loggingID;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)changeHandler;
- (id)description;
- (id)initInternal;
- (id)redactedDescription;
- (id)serverChangeTokenForZoneID:(id)a3;
- (id)serverChangeTokensByZoneID;
- (id)shortDescription;
- (unint64_t)changeCount;
- (unint64_t)weight;
- (void)addPendingDatabaseChanges:(NSArray *)changes;
- (void)addPendingRecordZoneChanges:(NSArray *)changes;
- (void)encodeWithCoder:(id)a3;
- (void)getDataRepresentation:(id)a3;
- (void)markRecordZoneChanges:(id)a3 inFlight:(BOOL)a4;
- (void)moveInFlightChangesToPending;
- (void)notifyChangeHandlerWithCoalescing:(BOOL)a3 scheduleSync:(BOOL)a4;
- (void)removeInFlightRecordChanges:(id)a3;
- (void)removePendingDatabaseChanges:(NSArray *)changes;
- (void)removePendingRecordZoneChanges:(NSArray *)changes;
- (void)reset;
- (void)setChangeHandler:(id)a3;
- (void)setDidPerformInitialUserRecordIDFetch:(BOOL)a3;
- (void)setExistingDatabaseSubscriptionID:(id)a3;
- (void)setFakeRecordIDsToDeleteForSerializationTests:(id)a3;
- (void)setFakeRecordIDsToSaveForSerializationTests:(id)a3;
- (void)setFakeZoneIDsToDeleteForSerializationTests:(id)a3;
- (void)setFakeZoneIDsToSaveForSerializationTests:(id)a3;
- (void)setFakeZonesToSaveForSerializationTests:(id)a3;
- (void)setHasInFlightUntrackedChanges:(BOOL)a3;
- (void)setHasPendingUntrackedChanges:(BOOL)hasPendingUntrackedChanges;
- (void)setInitialValues;
- (void)setLastFetchDatabaseChangesDate:(id)a3;
- (void)setLastKnownUserRecordID:(id)a3;
- (void)setLoggingID:(id)a3;
- (void)setMockNextKnownUserRecordID:(id)a3;
- (void)setNeedsToFetchChanges:(BOOL)a3 forRecordZoneID:(id)a4;
- (void)setNeedsToFetchDatabaseChanges:(BOOL)a3;
- (void)setNeedsToSaveDatabaseSubscription:(BOOL)a3;
- (void)setPendingDatabaseChanges:(id)a3;
- (void)setPendingRecordZoneChanges:(id)a3;
- (void)setServerChangeToken:(id)a3 forZoneID:(id)a4;
- (void)setServerChangeTokenForDatabase:(id)a3;
- (void)setUseMockNextKnownUserRecordID:(BOOL)a3;
@end

@implementation CKSyncEngineState

- (void)addPendingDatabaseChanges:(NSArray *)changes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v9 = queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_18AF46FFC;
    v17[3] = &unk_1E54628B8;
    v18 = v4;
    v19 = self;
    p_long long buf = &buf;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v17);

    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 1);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v11 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      v12 = v11;
      v16 = objc_msgSend_shortDescription(self, v13, v14, v15);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_debug_impl(&dword_18AF10000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending database changes to add", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (unint64_t)changeCount
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  uint64_t v11 = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF1351C;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)needsToFetchDatabaseChanges
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF1534C;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSArray)zoneIDsWithUnfetchedServerChanges
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_18AF1430C;
  v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF1C76C;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (CKRecordID)lastKnownUserRecordID
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_18AF1430C;
  v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF149D8;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CKRecordID *)v5;
}

- (void)setDidPerformInitialUserRecordIDFetch:(BOOL)a3
{
  v3 = self;
  if (self) {
    self = (CKSyncEngineState *)self->_queue;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18AF14890;
  v5[3] = &unk_1E5461FA8;
  BOOL v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (void)notifyChangeHandlerWithCoalescing:(BOOL)a3 scheduleSync:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v7 = ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 67109376;
    v13[1] = v5;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_debug_impl(&dword_18AF10000, v7, OS_LOG_TYPE_DEBUG, "Calling notifyChangeHandlerWithCoalescing: %d scheduleSync: %d", (uint8_t *)v13, 0xEu);
  }
  uint64_t v11 = objc_msgSend_changeHandler(self, v8, v9, v10);
  v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, BOOL, BOOL))(v11 + 16))(v11, v5, v4);
  }
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)removePendingRecordZoneChanges:(NSArray *)changes
{
  BOOL v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    uint64_t v9 = queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B19A040;
    v11[3] = &unk_1E54628B8;
    v12 = v4;
    id v13 = self;
    __int16 v14 = &v15;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v11);

    if (*((unsigned char *)v16 + 24)) {
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 0);
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (NSArray)pendingRecordZoneChanges
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_18AF1430C;
  v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  BOOL v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF471FC;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSArray)pendingDatabaseChanges
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_18AF1430C;
  v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  BOOL v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF47274;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (BOOL)needsToSaveDatabaseSubscription
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  BOOL v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF46FC0;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSDate)lastFetchDatabaseChangesDate
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_18AF1430C;
  v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  BOOL v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF46FD4;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDate *)v5;
}

- (BOOL)hasPendingUntrackedChanges
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  BOOL v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18AF46FE8;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (CKSyncEngineState)initWithStateSerialization:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_data(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (v7)
  {
    id v16 = 0;
    self = (CKSyncEngineState *)objc_msgSend_initWithData_error_(self, v6, (uint64_t)v7, (uint64_t)&v16);
    id v8 = v16;
    if (v8)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v9 = ck_log_facility_engine;
      if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v18 = v8;
        _os_log_fault_impl(&dword_18AF10000, v9, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Error initializing sync engine state: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    char v11 = NSStringFromClass(v10);
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v14, @"CKErrorDomain", 12, @"Cannot initialize %@ from %@ with no data", v11, v13);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4) {
    *a4 = v8;
  }

  return self;
}

- (CKSyncEngineState)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = v6;
  if (v6)
  {
    if (!objc_msgSend_length(v6, v7, v8, v9))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      char v11 = (void *)ck_log_facility_engine;
      if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
      {
        v12 = v11;
        id v13 = (objc_class *)objc_opt_class();
        __int16 v14 = NSStringFromClass(v13);
        *(_DWORD *)long long buf = 138412290;
        id v36 = v14;
        uint64_t v15 = "BUG IN CLIENT OF CLOUDKIT: Initializing %@ with a zero-length state data.";
LABEL_23:
        _os_log_fault_impl(&dword_18AF10000, v12, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v16 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
    {
      v12 = v16;
      v33 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v33);
      *(_DWORD *)long long buf = 138412290;
      id v36 = v14;
      uint64_t v15 = "BUG IN CLOUDKIT: Initializing %@ with a nil state data.";
      goto LABEL_23;
    }
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v18 = objc_opt_class();
  objc_msgSend_setClass_forClassName_(v17, v19, v18, @"CKSyncEngineMetadata");
  v20 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v21 = objc_opt_class();
  objc_msgSend_setClass_forClassName_(v20, v22, v21, @"CKSyncEngineRecordModification");
  char v23 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v24 = objc_opt_class();
  objc_msgSend_setClass_forClassName_(v23, v25, v24, @"CKSyncEnginePendingRecordChange");
  v26 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v27 = objc_opt_class();
  id v34 = 0;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v26, v28, v27, (uint64_t)v10, &v34);
  v29 = (CKSyncEngineState *)objc_claimAutoreleasedReturnValue();
  id v30 = v34;

  if (!v30 && v29) {
    goto LABEL_15;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v31 = ck_log_facility_engine;
  if (!os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
  {
LABEL_15:
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  *(_DWORD *)long long buf = 138412290;
  id v36 = v30;
  _os_log_fault_impl(&dword_18AF10000, v31, OS_LOG_TYPE_FAULT, "Failed to unarchive sync engine state serialization: %@", buf, 0xCu);
  if (a4) {
LABEL_16:
  }
    *a4 = v30;
LABEL_17:
  if (v30)
  {

    v29 = 0;
  }

  return v29;
}

- (CKSyncEngineState)init
{
  v2 = [CKException alloc];
  id v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E4F1C3C8], @"%s is unavailable", "-[CKSyncEngineState init]");
  objc_exception_throw(v4);
}

+ (id)emptyState
{
  v2 = [CKSyncEngineState alloc];
  inited = objc_msgSend_initInternal(v2, v3, v4, v5);

  return inited;
}

- (id)initInternal
{
  v8.receiver = self;
  v8.super_class = (Class)CKSyncEngineState;
  v2 = [(CKSyncEngineState *)&v8 init];
  v3 = v2;
  if (v2)
  {
    sub_18B197AFC((uint64_t)v2);
    objc_msgSend_setInitialValues(v3, v4, v5, v6);
  }
  return v3;
}

- (unint64_t)weight
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B197C64;
  v5[3] = &unk_1E5460080;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)reset
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  unint64_t v3 = (void *)ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v3;
    char v11 = objc_msgSend_shortDescription(self, v8, v9, v10);
    int v15 = 138543618;
    id v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = objc_msgSend_weight(self, v12, v13, v14);
    _os_log_impl(&dword_18AF10000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting state with weight=%tu", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend_setInitialValues(self, v4, v5, v6);
}

- (void)setInitialValues
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B197EBC;
  block[3] = &unk_1E5460350;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)description
{
  return (id)((uint64_t (*)(CKSyncEngineState *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineState *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B1980A8;
  v14[3] = &unk_1E5466030;
  id v11 = v9;
  id v15 = v11;
  id v16 = self;
  BOOL v17 = a3;
  BOOL v18 = a4;
  BOOL v19 = a5;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v14);
  id v12 = v11;

  return v12;
}

- (id)shortDescription
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_loggingID(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"<CKSyncEngine.State %@>", v7, v5);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v102 = a3;
  uint64_t DatabaseChanges = objc_msgSend_needsToFetchDatabaseChanges(self, v4, v5, v6);
  objc_msgSend_encodeBool_forKey_(v102, v8, DatabaseChanges, @"needsToFetchDatabaseChanges");
  uint64_t v12 = objc_msgSend_needsToSaveDatabaseSubscription(self, v9, v10, v11);
  objc_msgSend_encodeBool_forKey_(v102, v13, v12, @"needsToSaveDatabaseSubscription");
  uint64_t hasPendingUntrackedChanges = objc_msgSend_hasPendingUntrackedChanges(self, v14, v15, v16);
  objc_msgSend_encodeBool_forKey_(v102, v18, hasPendingUntrackedChanges, @"hasPendingUntrackedChanges");
  uint64_t v22 = objc_msgSend_hasInFlightUntrackedChanges(self, v19, v20, v21);
  objc_msgSend_encodeBool_forKey_(v102, v23, v22, @"hasInFlightUntrackedChanges");
  uint64_t v27 = objc_msgSend_serverChangeTokenForDatabase(self, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v102, v28, (uint64_t)v27, @"serverChangeTokenForDatabase");

  v32 = objc_msgSend_serverChangeTokensByZoneID(self, v29, v30, v31);
  objc_msgSend_encodeObject_forKey_(v102, v33, (uint64_t)v32, @"serverChangeTokensByZoneID");

  if (self)
  {
    objc_msgSend_encodeObject_forKey_(v102, v34, (uint64_t)self->_zoneIDsNeedingToFetchChangesSet, @"zoneIDsNeedingToFetchChanges");
    objc_msgSend_encodeObject_forKey_(v102, v35, (uint64_t)self->_pendingDatabaseChangesSet, @"pendingZoneChanges");
    objc_msgSend_encodeObject_forKey_(v102, v36, (uint64_t)self->_pendingRecordZoneChangesSet, @"pendingRecordModifications");
    objc_msgSend_encodeObject_forKey_(v102, v37, (uint64_t)self->_inFlightRecordChangesSet, @"inFlightRecordModifications");
  }
  else
  {
    objc_msgSend_encodeObject_forKey_(v102, v34, 0, @"zoneIDsNeedingToFetchChanges");
    objc_msgSend_encodeObject_forKey_(v102, v99, 0, @"pendingZoneChanges");
    objc_msgSend_encodeObject_forKey_(v102, v100, 0, @"pendingRecordModifications");
    objc_msgSend_encodeObject_forKey_(v102, v101, 0, @"inFlightRecordModifications");
  }
  v41 = objc_msgSend_lastKnownUserRecordID(self, v38, v39, v40);
  objc_msgSend_encodeObject_forKey_(v102, v42, (uint64_t)v41, @"lastKnownUserRecordID");

  uint64_t v46 = objc_msgSend_didPerformInitialUserRecordIDFetch(self, v43, v44, v45);
  objc_msgSend_encodeBool_forKey_(v102, v47, v46, @"didPerformInitialUserRecordIDFetch");
  v51 = objc_msgSend_lastFetchDatabaseChangesDate(self, v48, v49, v50);
  objc_msgSend_encodeObject_forKey_(v102, v52, (uint64_t)v51, @"lastFetchDatabaseChangesDate");

  v56 = objc_msgSend_existingDatabaseSubscriptionID(self, v53, v54, v55);
  objc_msgSend_encodeObject_forKey_(v102, v57, (uint64_t)v56, @"existingDatabaseSubscriptionID");

  v61 = objc_msgSend_fakeRecordIDsToSaveForSerializationTests(self, v58, v59, v60);
  v65 = objc_msgSend_mutableCopy(v61, v62, v63, v64);

  if (v65) {
    objc_msgSend_encodeObject_forKey_(v102, v66, (uint64_t)v65, @"recordIDsToSave");
  }
  v69 = objc_msgSend_fakeRecordIDsToDeleteForSerializationTests(self, v66, v67, v68);
  v73 = objc_msgSend_mutableCopy(v69, v70, v71, v72);

  if (v73) {
    objc_msgSend_encodeObject_forKey_(v102, v74, (uint64_t)v73, @"recordIDsToDelete");
  }
  v77 = objc_msgSend_fakeZonesToSaveForSerializationTests(self, v74, v75, v76);
  v81 = objc_msgSend_mutableCopy(v77, v78, v79, v80);

  if (v81) {
    objc_msgSend_encodeObject_forKey_(v102, v82, (uint64_t)v81, @"zonesToSave");
  }
  v85 = objc_msgSend_fakeZoneIDsToSaveForSerializationTests(self, v82, v83, v84);
  v89 = objc_msgSend_mutableCopy(v85, v86, v87, v88);

  if (v89) {
    objc_msgSend_encodeObject_forKey_(v102, v90, (uint64_t)v89, @"zoneIDsToSave");
  }
  v93 = objc_msgSend_fakeZoneIDsToDeleteForSerializationTests(self, v90, v91, v92);
  v97 = objc_msgSend_mutableCopy(v93, v94, v95, v96);

  if (v97) {
    objc_msgSend_encodeObject_forKey_(v102, v98, (uint64_t)v97, @"zoneIDsToDelete");
  }
}

- (CKSyncEngineState)initWithCoder:(id)a3
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v202.receiver = self;
  v202.super_class = (Class)CKSyncEngineState;
  uint64_t v5 = [(CKSyncEngineState *)&v202 init];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_45;
  }
  sub_18B197AFC((uint64_t)v5);
  v6->_needsToFetchuint64_t DatabaseChanges = objc_msgSend_decodeBoolForKey_(v4, v7, @"needsToFetchDatabaseChanges", v8);
  v6->_needsToSaveDatabaseSubscription = objc_msgSend_decodeBoolForKey_(v4, v9, @"needsToSaveDatabaseSubscription", v10);
  char v13 = objc_msgSend_decodeBoolForKey_(v4, v11, @"hasPendingUntrackedChanges", v12);
  v6->_uint64_t hasPendingUntrackedChanges = v13;
  if ((v13 & 1) == 0) {
    v6->_uint64_t hasPendingUntrackedChanges = objc_msgSend_decodeBoolForKey_(v4, v14, @"hasAdopterTrackedPendingModifications", v15);
  }
  char v16 = objc_msgSend_decodeBoolForKey_(v4, v14, @"hasInFlightUntrackedChanges", v15);
  v6->_hasInFlightUntrackedChanges = v16;
  if ((v16 & 1) == 0) {
    v6->_hasInFlightUntrackedChanges = objc_msgSend_decodeBoolForKey_(v4, v17, @"hasInFlightAdopterTrackedModifications", v18);
  }
  uint64_t v19 = objc_opt_class();
  uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"serverChangeTokenForDatabase");
  serverChangeTokenForDatabase = v6->_serverChangeTokenForDatabase;
  v6->_serverChangeTokenForDatabase = (CKServerChangeToken *)v21;

  char v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  v29 = objc_msgSend_setWithObjects_(v23, v27, v24, v28, v25, v26, 0);
  uint64_t v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, @"serverChangeTokensByZoneID");

  v193 = v31;
  if (v31) {
    v35 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v31, v32, v33, v34);
  }
  else {
    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  mServerChangeTokensByZoneID = v6->_mServerChangeTokensByZoneID;
  v6->_mServerChangeTokensByZoneID = v35;

  uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  v43 = objc_msgSend_setWithObjects_(v37, v41, v38, v42, v39, v40, 0);
  uint64_t v45 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v44, (uint64_t)v43, @"zoneIDsNeedingToFetchChanges");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = objc_alloc(MEMORY[0x1E4F1CA70]);
    uint64_t v49 = (NSMutableOrderedSet *)objc_msgSend_initWithSet_(v46, v47, (uint64_t)v45, v48);
LABEL_13:
    zoneIDsNeedingToFetchChangesSet = v6->_zoneIDsNeedingToFetchChangesSet;
    v6->_zoneIDsNeedingToFetchChangesSet = v49;

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v49 = v45;
    goto LABEL_13;
  }
LABEL_14:
  v192 = v45;
  if (!v6->_zoneIDsNeedingToFetchChangesSet)
  {
    v51 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v52 = v6->_zoneIDsNeedingToFetchChangesSet;
    v6->_zoneIDsNeedingToFetchChangesSet = v51;
  }
  v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  v58 = objc_msgSend_setWithObjects_(v53, v56, v54, v57, v55, 0);
  uint64_t v60 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v59, (uint64_t)v58, @"pendingRecordModifications");
  pendingRecordZoneChangesSet = v6->_pendingRecordZoneChangesSet;
  v6->_pendingRecordZoneChangesSet = (NSMutableOrderedSet *)v60;

  if (!v6->_pendingRecordZoneChangesSet)
  {
    v62 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v63 = v6->_pendingRecordZoneChangesSet;
    v6->_pendingRecordZoneChangesSet = v62;
  }
  uint64_t v64 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v65 = objc_opt_class();
  uint64_t v66 = objc_opt_class();
  v69 = objc_msgSend_setWithObjects_(v64, v67, v65, v68, v66, 0);
  uint64_t v71 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v70, (uint64_t)v69, @"inFlightRecordModifications");
  inFlightRecordChangesSet = v6->_inFlightRecordChangesSet;
  v6->_inFlightRecordChangesSet = (NSMutableOrderedSet *)v71;

  if (!v6->_inFlightRecordChangesSet)
  {
    v73 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v74 = v6->_inFlightRecordChangesSet;
    v6->_inFlightRecordChangesSet = v73;
  }
  uint64_t v75 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v76 = objc_opt_class();
  uint64_t v77 = objc_opt_class();
  uint64_t v80 = objc_msgSend_setWithObjects_(v75, v78, v76, v79, v77, 0);
  v82 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v81, (uint64_t)v80, @"recordIDsToSave");

  long long v200 = 0u;
  long long v201 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  id v83 = v82;
  uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v198, (uint64_t)v204, 16);
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v199;
    do
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v199 != v87) {
          objc_enumerationMutation(v83);
        }
        uint64_t v89 = *(void *)(*((void *)&v198 + 1) + 8 * i);
        v90 = [CKSyncEnginePendingRecordZoneChange alloc];
        uint64_t v92 = objc_msgSend_initWithRecordID_type_(v90, v91, v89, 0);
        objc_msgSend_addObject_(v6->_pendingRecordZoneChangesSet, v93, (uint64_t)v92, v94);
      }
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v95, (uint64_t)&v198, (uint64_t)v204, 16);
    }
    while (v86);
  }

  uint64_t v96 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v97 = objc_opt_class();
  uint64_t v98 = objc_opt_class();
  v101 = objc_msgSend_setWithObjects_(v96, v99, v97, v100, v98, 0);
  v103 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v102, (uint64_t)v101, @"recordIDsToDelete");

  long long v196 = 0u;
  long long v197 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  id v104 = v103;
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v194, (uint64_t)v203, 16);
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v195;
    do
    {
      for (uint64_t j = 0; j != v107; ++j)
      {
        if (*(void *)v195 != v108) {
          objc_enumerationMutation(v104);
        }
        uint64_t v110 = *(void *)(*((void *)&v194 + 1) + 8 * j);
        v111 = [CKSyncEnginePendingRecordZoneChange alloc];
        v113 = objc_msgSend_initWithRecordID_type_(v111, v112, v110, 1);
        objc_msgSend_addObject_(v6->_pendingRecordZoneChangesSet, v114, (uint64_t)v113, v115);
      }
      uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v116, (uint64_t)&v194, (uint64_t)v203, 16);
    }
    while (v107);
  }

  v117 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v118 = objc_opt_class();
  uint64_t v119 = objc_opt_class();
  uint64_t v120 = objc_opt_class();
  v123 = objc_msgSend_setWithObjects_(v117, v121, v118, v122, v119, v120, 0);
  uint64_t v125 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v124, (uint64_t)v123, @"pendingZoneChanges");
  pendingDatabaseChangesSet = v6->_pendingDatabaseChangesSet;
  v6->_pendingDatabaseChangesSet = (NSMutableOrderedSet *)v125;

  if (!v6->_pendingDatabaseChangesSet)
  {
    v127 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v128 = v6->_pendingDatabaseChangesSet;
    v6->_pendingDatabaseChangesSet = v127;
  }
  v129 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v130 = objc_opt_class();
  uint64_t v131 = objc_opt_class();
  v134 = objc_msgSend_setWithObjects_(v129, v132, v130, v133, v131, 0);
  v136 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v135, (uint64_t)v134, @"zoneIDsToSave");

  v137 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v138 = objc_opt_class();
  uint64_t v139 = objc_opt_class();
  uint64_t v140 = objc_opt_class();
  v143 = objc_msgSend_setWithObjects_(v137, v141, v138, v142, v139, v140, 0);
  v145 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v144, (uint64_t)v143, @"zonesToSave");

  if (v145)
  {
    if (!v136) {
      v136 = objc_opt_new();
    }
    v149 = objc_msgSend_allKeys(v145, v146, v147, v148);
    objc_msgSend_addObjectsFromArray_(v136, v150, (uint64_t)v149, v151);
  }
  if (v136)
  {
    v152 = v6->_pendingDatabaseChangesSet;
    v153 = objc_msgSend_array(v136, v146, v147, v148);
    v156 = objc_msgSend_CKMap_(v153, v154, (uint64_t)&unk_1ED7EF6B8, v155);
    objc_msgSend_addObjectsFromArray_(v152, v157, (uint64_t)v156, v158);
  }
  v159 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v160 = objc_opt_class();
  uint64_t v161 = objc_opt_class();
  v164 = objc_msgSend_setWithObjects_(v159, v162, v160, v163, v161, 0);
  v166 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v165, (uint64_t)v164, @"zoneIDsToDelete");

  if (v166)
  {
    v170 = v6->_pendingDatabaseChangesSet;
    v171 = objc_msgSend_array(v166, v167, v168, v169);
    v174 = objc_msgSend_CKMap_(v171, v172, (uint64_t)&unk_1ED7EF8F8, v173);
    objc_msgSend_addObjectsFromArray_(v170, v175, (uint64_t)v174, v176);
  }
  uint64_t v177 = objc_opt_class();
  uint64_t v179 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v178, v177, @"lastKnownUserRecordID");
  lastKnownUserRecordID = v6->_lastKnownUserRecordID;
  v6->_lastKnownUserRecordID = (CKRecordID *)v179;

  v6->_didPerformInitialUserRecordIDFetch = objc_msgSend_decodeBoolForKey_(v4, v181, @"didPerformInitialUserRecordIDFetch", v182);
  uint64_t v183 = objc_opt_class();
  uint64_t v185 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v184, v183, @"lastFetchDatabaseChangesDate");
  lastFetchDatabaseChangesDate = v6->_lastFetchDatabaseChangesDate;
  v6->_lastFetchDatabaseChangesDate = (NSDate *)v185;

  uint64_t v187 = objc_opt_class();
  uint64_t v189 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v188, v187, @"existingDatabaseSubscriptionID");
  existingDatabaseSubscriptionID = v6->_existingDatabaseSubscriptionID;
  v6->_existingDatabaseSubscriptionID = (NSString *)v189;

LABEL_45:
  return v6;
}

- (void)getDataRepresentation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, uint64_t))a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = (void *)ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v5;
    uint64_t v12 = objc_msgSend_shortDescription(self, v9, v10, v11);
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_debug_impl(&dword_18AF10000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ serializing sync engine state %@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v19 = sub_18AF1430C;
  uint64_t v20 = sub_18AF13A14;
  id v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  uint64_t v7 = queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_18B19961C;
  v13[3] = &unk_1E5466058;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = buf;
  ck_call_or_dispatch_sync_if_not_key(v7, &self->_queue, v13);

  v4[2](v4, *(void *)(*(void *)&buf[8] + 40), v15[3]);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(buf, 8);
}

- (void)addPendingRecordZoneChanges:(NSArray *)changes
{
  id v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    uint64_t v9 = queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B19988C;
    v11[3] = &unk_1E54628B8;
    uint64_t v12 = v4;
    char v13 = self;
    uint64_t v14 = &v15;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v11);

    if (*((unsigned char *)v16 + 24)) {
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 1);
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (void)markRecordZoneChanges:(id)a3 inFlight:(BOOL)a4
{
  id v6 = a3;
  if (objc_msgSend_count(v6, v7, v8, v9))
  {
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_18B199C08;
    v12[3] = &unk_1E5463378;
    v12[4] = self;
    BOOL v14 = a4;
    id v13 = v6;
    ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v12);
    objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v11, 1, 0);
  }
}

- (void)removeInFlightRecordChanges:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_18B19A2B4;
    id v13 = &unk_1E5461F80;
    BOOL v14 = self;
    id v15 = v4;
    ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, &v10);
    objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v9, 1, 0, v10, v11, v12, v13, v14);
  }
}

- (BOOL)containsInFlightRecordZoneChange:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  uint64_t v6 = queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B19A514;
  v11[3] = &unk_1E5462070;
  p_queue = &self->_queue;
  id v13 = &v14;
  void v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  char v9 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)containsPendingRecordZoneChange:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  uint64_t v6 = queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B19A698;
  v11[3] = &unk_1E5462070;
  p_queue = &self->_queue;
  id v13 = &v14;
  void v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  char v9 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)setPendingRecordZoneChanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  if (!objc_msgSend_count(v5, v6, v7, v8))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    char v9 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      id v13 = v9;
      char v17 = objc_msgSend_shortDescription(self, v14, v15, v16);
      *(_DWORD *)long long buf = 138543362;
      id v21 = v17;
      _os_log_debug_impl(&dword_18AF10000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending record zone changes to add", buf, 0xCu);

      if (self) {
        goto LABEL_8;
      }
LABEL_11:
      queue = 0;
      goto LABEL_9;
    }
  }
  if (!self) {
    goto LABEL_11;
  }
LABEL_8:
  queue = self->_queue;
LABEL_9:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_18B19A8A0;
  v18[3] = &unk_1E5461F80;
  p_queue = &self->_queue;
  v18[4] = self;
  id v19 = v5;
  id v12 = v5;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v18);
}

- (NSArray)inFlightRecordChanges
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_18AF1430C;
  id v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B19ABD8;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)moveInFlightChangesToPending
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_18B19ACD4;
  v3[3] = &unk_1E5460350;
  v3[4] = self;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v3);
}

- (void)setServerChangeToken:(id)a3 forZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_18B19AF30;
  v13[3] = &unk_1E54614E0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v13);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v12, 0, 0);
}

- (id)serverChangeTokensByZoneID
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_18AF1430C;
  id v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B19B1E0;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)serverChangeTokenForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = sub_18AF1430C;
  char v18 = sub_18AF13A14;
  id v19 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B19B38C;
  v11[3] = &unk_1E5462070;
  p_queue = &self->_queue;
  id v13 = &v14;
  void v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)setNeedsToFetchChanges:(BOOL)a3 forRecordZoneID:(id)a4
{
  id v6 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B19B4A8;
  v10[3] = &unk_1E5463378;
  BOOL v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v10);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v9, 1, 0);
}

- (BOOL)needsToFetchChangesForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B19B790;
  v11[3] = &unk_1E5462070;
  p_queue = &self->_queue;
  id v13 = &v14;
  void v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  char v9 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)setPendingDatabaseChanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  if (!objc_msgSend_count(v5, v6, v7, v8))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    char v9 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      id v13 = v9;
      char v17 = objc_msgSend_shortDescription(self, v14, v15, v16);
      *(_DWORD *)long long buf = 138543362;
      id v21 = v17;
      _os_log_debug_impl(&dword_18AF10000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending zone changes to add", buf, 0xCu);

      if (self) {
        goto LABEL_8;
      }
LABEL_11:
      queue = 0;
      goto LABEL_9;
    }
  }
  if (!self) {
    goto LABEL_11;
  }
LABEL_8:
  queue = self->_queue;
LABEL_9:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_18B19B998;
  v18[3] = &unk_1E5461F80;
  p_queue = &self->_queue;
  v18[4] = self;
  id v19 = v5;
  id v12 = v5;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v18);
}

- (void)removePendingDatabaseChanges:(NSArray *)changes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    char v9 = queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_18B19BDAC;
    v17[3] = &unk_1E54628B8;
    char v18 = v4;
    id v19 = self;
    p_long long buf = &buf;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v17);

    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 0);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v11 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v11;
      uint64_t v16 = objc_msgSend_shortDescription(self, v13, v14, v15);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_debug_impl(&dword_18AF10000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending database changes to remove", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (BOOL)needsToSaveZoneID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend_pendingDatabaseChanges(self, v5, v6, v7, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (!objc_msgSend_type(v16, v10, v11, v12))
        {
          char v17 = objc_msgSend_zoneID(v16, v10, v11, v12);
          char isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)v4, v19);

          if (isEqual)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v13;
}

- (BOOL)needsToDeleteZoneID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend_pendingDatabaseChanges(self, v5, v6, v7, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend_type(v16, v10, v11, v12) == 1)
        {
          char v17 = objc_msgSend_zoneID(v16, v10, v11, v12);
          char isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)v4, v19);

          if (isEqual)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v13;
}

- (void)setServerChangeTokenForDatabase:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_18B19C298;
  uint64_t v11 = &unk_1E5461F80;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, &v8);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v7, 0, 0, v8, v9, v10, v11, v12);
}

- (CKServerChangeToken)serverChangeTokenForDatabase
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_18AF1430C;
  uint64_t v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B19C524;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CKServerChangeToken *)v5;
}

- (void)setNeedsToFetchDatabaseChanges:(BOOL)a3
{
  uint64_t v3 = self;
  if (self) {
    self = (CKSyncEngineState *)self->_queue;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B19C5D0;
  v5[3] = &unk_1E5461FA8;
  BOOL v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (void)setNeedsToSaveDatabaseSubscription:(BOOL)a3
{
  uint64_t v3 = self;
  if (self) {
    self = (CKSyncEngineState *)self->_queue;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B19C7B0;
  v5[3] = &unk_1E5461FA8;
  BOOL v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (void)setLastKnownUserRecordID:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_18B19C9BC;
  uint64_t v11 = &unk_1E5461F80;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, &v8);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v7, 1, 0, v8, v9, v10, v11, v12);
}

- (void)setHasPendingUntrackedChanges:(BOOL)hasPendingUntrackedChanges
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v6 = queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B19CC2C;
  v8[3] = &unk_1E5466080;
  BOOL v9 = hasPendingUntrackedChanges;
  v8[4] = self;
  v8[5] = &v10;
  ck_call_or_dispatch_sync_if_not_key(v6, &self->_queue, v8);

  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v7, 1, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
}

- (void)setHasInFlightUntrackedChanges:(BOOL)a3
{
  uint64_t v3 = self;
  if (self) {
    self = (CKSyncEngineState *)self->_queue;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B19CE18;
  v5[3] = &unk_1E5461FA8;
  BOOL v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (BOOL)hasInFlightUntrackedChanges
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B19D048;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)didPerformInitialUserRecordIDFetch
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B19D144;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setLastFetchDatabaseChangesDate:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B19D20C;
  v8[3] = &unk_1E5461F80;
  p_queue = &self->_queue;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v8);
}

- (NSString)existingDatabaseSubscriptionID
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_18AF1430C;
  uint64_t v12 = sub_18AF13A14;
  id v13 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  id v4 = queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B19D378;
  v7[3] = &unk_1E5460080;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (void)setExistingDatabaseSubscriptionID:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B19D440;
  v8[3] = &unk_1E5461F80;
  p_queue = &self->_queue;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v8);
}

- (NSMutableDictionary)mServerChangeTokensByZoneID
{
  return self->_mServerChangeTokensByZoneID;
}

- (NSOrderedSet)fakeRecordIDsToSaveForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFakeRecordIDsToSaveForSerializationTests:(id)a3
{
}

- (NSOrderedSet)fakeRecordIDsToDeleteForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFakeRecordIDsToDeleteForSerializationTests:(id)a3
{
}

- (NSDictionary)fakeZonesToSaveForSerializationTests
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFakeZonesToSaveForSerializationTests:(id)a3
{
}

- (NSOrderedSet)fakeZoneIDsToSaveForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFakeZoneIDsToSaveForSerializationTests:(id)a3
{
}

- (NSOrderedSet)fakeZoneIDsToDeleteForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFakeZoneIDsToDeleteForSerializationTests:(id)a3
{
}

- (CKRecordID)mockNextKnownUserRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMockNextKnownUserRecordID:(id)a3
{
}

- (BOOL)useMockNextKnownUserRecordID
{
  return self->_useMockNextKnownUserRecordID;
}

- (void)setUseMockNextKnownUserRecordID:(BOOL)a3
{
  self->_useMockNextKnownUserRecordID = a3;
}

- (void)setChangeHandler:(id)a3
{
}

- (NSString)loggingID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLoggingID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingID, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_mockNextKnownUserRecordID, 0);
  objc_storeStrong((id *)&self->_fakeZoneIDsToDeleteForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeZoneIDsToSaveForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeZonesToSaveForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeRecordIDsToDeleteForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeRecordIDsToSaveForSerializationTests, 0);
  objc_storeStrong((id *)&self->_inFlightRecordChangesSet, 0);
  objc_storeStrong((id *)&self->_pendingRecordZoneChangesSet, 0);
  objc_storeStrong((id *)&self->_pendingDatabaseChangesSet, 0);
  objc_storeStrong((id *)&self->_zoneIDsNeedingToFetchChangesSet, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_existingDatabaseSubscriptionID, 0);
  objc_storeStrong((id *)&self->_lastFetchDatabaseChangesDate, 0);
  objc_storeStrong((id *)&self->_mServerChangeTokensByZoneID, 0);
  objc_storeStrong((id *)&self->_lastKnownUserRecordID, 0);

  objc_storeStrong((id *)&self->_serverChangeTokenForDatabase, 0);
}

@end