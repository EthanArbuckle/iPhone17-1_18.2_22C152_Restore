@interface CPLCKUnsharePlan
- (BOOL)hasShareTodoForScopedIdentifier:(id)a3;
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CPLCKBatchUploadPlanner)planner;
- (CPLCKUnsharePlan)initWithPlanner:(id)a3;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)ckRecordIDsToUnshare;
- (NSArray)privateRecordIDs;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)ckRecordIDsToDelete;
- (id)ckRecordsToUpdate;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (unint64_t)count;
- (void)_prepareRecordsToDelete;
- (void)addShareTodo:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (void)removeShareTodoForScopedIdentifier:(id)a3;
- (void)setPlanner:(id)a3;
- (void)updateTargetMappingAfterUploadWithRealSourceRecordIDs:(id)a3;
@end

@implementation CPLCKUnsharePlan

- (CPLFingerprintContext)fingerprintContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  v3 = [WeakRetained fingerprintContext];

  return (CPLFingerprintContext *)v3;
}

- (CPLCKUnsharePlan)initWithPlanner:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLCKUnsharePlan;
  v5 = [(CPLCKUnsharePlan *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_planner, v4);
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    todos = v6->_todos;
    v6->_todos = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    todoPerScopedIdentifier = v6->_todoPerScopedIdentifier;
    v6->_todoPerScopedIdentifier = v9;
  }
  return v6;
}

- (void)addShareTodo:(id)a3
{
  todos = self->_todos;
  v6 = a3;
  [(NSMutableArray *)todos addObject:v6];
  if (v6) {
    uint64_t v5 = v6[1];
  }
  else {
    uint64_t v5 = 0;
  }
  [(NSMutableDictionary *)self->_todoPerScopedIdentifier setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)hasShareTodoForScopedIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_todoPerScopedIdentifier objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)removeShareTodoForScopedIdentifier:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_todoPerScopedIdentifier removeObjectForKey:v4];
  todos = self->_todos;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003EE94;
  v8[3] = &unk_1002778E0;
  id v6 = v4;
  id v9 = v6;
  id v7 = [(NSMutableArray *)todos indexOfObjectPassingTest:v8];
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_todos removeObjectAtIndex:v7];
  }
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_todos count];
}

- (NSArray)ckRecordIDsToUnshare
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_todos, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_todos;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 32);
        }
        else {
          uint64_t v10 = 0;
        }
        objc_msgSend(v3, "addObject:", v10, (void)v13);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v11 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v6 = v11;
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (void)_prepareRecordsToDelete
{
  if (!self->_ckRecordsToUpdate)
  {
    v21 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    id v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
    id v5 = [WeakRetained sharedZoneIdentification];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v20 = self;
    id v6 = self->_todos;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v10);
          if (v11)
          {
            uint64_t v12 = v11[2];
            id v11 = (void *)v11[4];
          }
          else
          {
            uint64_t v12 = 0;
          }
          long long v13 = v11;
          if ([v5 supportsDirectDeletionOfRecordClass:v12])
          {
            [(NSArray *)v3 addObject:v13];
          }
          else if ([v5 supportsDeletionOfRecordClass:v12])
          {
            long long v14 = CPLCKRecord(v12, v13, 1);
            long long v15 = +[NSDate date];
            [v14 setObject:v15 forKey:@"recordModificationDate"];

            [v14 setObject:&__kCFBooleanTrue forKey:@"isDeleted"];
            [v14 setObject:&__kCFBooleanTrue forKey:@"isExpunged"];
            [(NSArray *)v21 addObject:v14];
          }
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v16 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        id v8 = v16;
      }
      while (v16);
    }

    ckRecordsToUpdate = v20->_ckRecordsToUpdate;
    v20->_ckRecordsToUpdate = v21;
    v18 = v21;

    ckRecordIDsToDelete = v20->_ckRecordIDsToDelete;
    v20->_ckRecordIDsToDelete = v3;
  }
}

- (id)ckRecordsToUpdate
{
  [(CPLCKUnsharePlan *)self _prepareRecordsToDelete];
  ckRecordsToUpdate = self->_ckRecordsToUpdate;
  return ckRecordsToUpdate;
}

- (id)ckRecordIDsToDelete
{
  [(CPLCKUnsharePlan *)self _prepareRecordsToDelete];
  ckRecordIDsToDelete = self->_ckRecordIDsToDelete;
  return ckRecordIDsToDelete;
}

- (void)updateTargetMappingAfterUploadWithRealSourceRecordIDs:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  id v5 = [WeakRetained targetMapping];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_todos;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        if (v11)
        {
          id v12 = *(id *)(v11 + 56);
          if (v12)
          {
            long long v13 = v12;
            objc_msgSend(v5, "setTarget:forRecordWithScopedIdentifier:", v12, *(void *)(v11 + 8), (void)v14);
          }
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (NSArray)privateRecordIDs
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_todos, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_todos;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 24);
        }
        else {
          uint64_t v10 = 0;
        }
        objc_msgSend(v3, "addObject:", v10, (void)v13);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v11 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v6 = v11;
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  return 1;
}

- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  uint64_t v9 = [WeakRetained scopedIdentifierForCKRecordID:v18];

  if (!v9)
  {
    sub_1001C7874(v18, a2, self);
LABEL_8:
    if (!_CPLSilentLogging)
    {
      long long v15 = sub_100038278();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v18;
        __int16 v21 = 2112;
        long long v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to find unshare todo matching %@/%@", buf, 0x16u);
      }
    }
    long long v16 = +[NSAssertionHandler currentHandler];
    long long v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCKBatchUploadPlanner.m"];
    [v16 handleFailureInMethod:a2, self, v17, 1609, @"Unable to find unshare todo matching %@/%@", v18, v9 object file lineNumber description];

    abort();
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_todoPerScopedIdentifier objectForKeyedSubscript:v9];
  currentTodo = self->_currentTodo;
  self->_currentTodo = v10;

  if (!self->_currentTodo) {
    goto LABEL_8;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_planner);
  long long v13 = [v12 targetMapping];
  long long v14 = [v13 targetForRecordWithScopedIdentifier:v9];

  if (!v14) {
    sub_1001C794C(v9, a2, self);
  }
  self->_wasSplit = [v14 targetState] == (id)3;
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  p_planner = &self->_planner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  id v11 = [WeakRetained currentUserRecordID];
  id v12 = objc_msgSend(v7, "cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:proposedDestinationRecordID:", v11, v8);

  if (([v12 isEqual:v8] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      long long v13 = sub_100038278();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = [v7 recordID];
        long long v15 = [v14 cplFullDescription];
        long long v16 = [v12 cplFullDescription];
        long long v17 = [v8 cplFullDescription];
        *(_DWORD *)buf = 138412802;
        v42 = v15;
        __int16 v43 = 2112;
        v44 = v16;
        __int16 v45 = 2112;
        v46 = v17;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Moving %@ to %@ instead of %@", buf, 0x20u);
      }
    }
    id v18 = objc_loadWeakRetained((id *)&self->_planner);
    v19 = v18;
    currentTodo = self->_currentTodo;
    if (currentTodo) {
      scopedIdentifier = currentTodo->_scopedIdentifier;
    }
    else {
      scopedIdentifier = 0;
    }
    [v18 _willUpdateCKRecordWithID:v12 onBehalfOfRecordWithScopedIdentifier:scopedIdentifier];

    sub_10003D9F0((uint64_t)self->_currentTodo, v12);
  }
  id v22 = objc_alloc((Class)CPLScopedIdentifier);
  id v23 = objc_loadWeakRetained((id *)p_planner);
  long long v24 = [v23 destinationZoneIdentification];
  long long v25 = [v24 scopeIdentifier];
  v26 = [v7 recordID];
  [v26 recordName];
  v27 = v40 = v8;
  id v28 = [v22 initWithScopeIdentifier:v25 identifier:v27];

  id v29 = objc_alloc((Class)CPLScopedIdentifier);
  id v30 = objc_loadWeakRetained((id *)p_planner);
  v31 = [v30 sharedZoneIdentification];
  v32 = [v31 scopeIdentifier];
  v33 = [v12 recordName];
  id v34 = [v29 initWithScopeIdentifier:v32 identifier:v33];

  id v35 = [objc_alloc((Class)CPLRecordTarget) initWithScopedIdentifier:v28 otherScopedIdentifier:v34 targetState:1];
  sub_10003DA10((uint64_t)self->_currentTodo, v35);

  id v36 = objc_alloc((Class)CKRecord);
  v37 = [v7 recordType];
  id v38 = [v36 initWithRecordType:v37 recordID:v12];

  return v38;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dateExpunged"])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
    id v7 = [WeakRetained propertyMapping];

    currentTodo = self->_currentTodo;
    if (currentTodo) {
      Class recordClass = currentTodo->_recordClass;
    }
    else {
      Class recordClass = 0;
    }
    if ([v7 isKeyReadOnly:v4 recordClass:recordClass])
    {
      LOBYTE(v5) = 0;
    }
    else if (self->_wasSplit {
           && ((uint64_t v10 = self->_currentTodo) == 0 ? (v11 = 0) : (v11 = v10->_recordClass),
    }
               ([v7 shouldUpdateKeyOnBothRecords:v4 recordClass:v11] & 1) == 0))
    {
      id v12 = self->_currentTodo;
      if (v12) {
        Class v13 = v12->_recordClass;
      }
      else {
        Class v13 = 0;
      }
      unsigned int v5 = [v7 shouldUpdateKeyOnPrivateRecord:v4 recordClass:v13] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)CPLScopedIdentifier);
  p_planner = &self->_planner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  uint64_t v9 = [WeakRetained sharedZoneIdentification];
  uint64_t v10 = [v9 scopeIdentifier];
  id v11 = [v6 initWithScopeIdentifier:v10 identifier:v5];

  id v12 = objc_loadWeakRetained((id *)p_planner);
  Class v13 = [v12 targetMapping];
  long long v14 = [v13 targetForRecordWithOtherScopedIdentifier:v11];

  if (v14)
  {
    long long v15 = [v14 otherScopedIdentifier];
    uint64_t v16 = [v15 identifier];
    long long v17 = (void *)v16;
    if (v16) {
      id v18 = (void *)v16;
    }
    else {
      id v18 = v5;
    }
    id v19 = v18;
  }
  else
  {
    id v19 = v5;
  }

  return v19;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  currentTodo = self->_currentTodo;
  if (!currentTodo || (id v7 = currentTodo->_recordModificationDate) == 0)
  {
    id v7 = +[NSDate date];
  }
  [v5 setObject:v7 forKey:@"recordModificationDate"];
  [v5 setObject:0 forKey:@"linkedShareZoneName"];
  [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
  [v5 setObject:0 forKey:@"linkedShareRecordName"];
  if (self->_wasSplit && ([v5 isKnownToServer] & 1) == 0)
  {
    [v5 setKnownToServer:1];
    [v5 setEtag:@"-gateon"];
  }

  return v5;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = [WeakRetained cloudKitScopeForScopeIdentifier:v4];

  return v6;
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = [WeakRetained zoneIDFromScopeIdentifier:v4];

  return v6;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = [WeakRetained scopeIdentifierFromZoneID:v4];

  return v6;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = [WeakRetained scopedIdentifierForCKRecordID:v4];

  return v6;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  p_planner = &self->_planner;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_planner);
  id v6 = [WeakRetained rejectedScopedIdentifierForRejectedCKRecordID:v4];

  return v6;
}

- (CPLCKBatchUploadPlanner)planner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  return (CPLCKBatchUploadPlanner *)WeakRetained;
}

- (void)setPlanner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_planner);
  objc_storeStrong((id *)&self->_ckRecordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_ckRecordsToUpdate, 0);
  objc_storeStrong((id *)&self->_currentTodo, 0);
  objc_storeStrong((id *)&self->_todoPerScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_todos, 0);
}

@end