@interface CPLCKSharePlan
- (BOOL)hasShareTodoForScopedIdentifier:(id)a3;
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CPLCKBatchUploadPlanner)planner;
- (CPLCKSharePlan)initWithPlanner:(id)a3;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)ckRecordIDsToShare;
- (NSArray)sharedCKRecordIDs;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (unint64_t)count;
- (void)addShareTodo:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (void)setPlanner:(id)a3;
- (void)updateTargetMappingAfterUploadWithRealSourceRecordIDs:(id)a3;
@end

@implementation CPLCKSharePlan

- (CPLFingerprintContext)fingerprintContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  v3 = [WeakRetained fingerprintContext];

  return (CPLFingerprintContext *)v3;
}

- (CPLCKSharePlan)initWithPlanner:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLCKSharePlan;
  v5 = [(CPLCKSharePlan *)&v12 init];
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

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_todos count];
}

- (NSArray)ckRecordIDsToShare
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_todos, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = self->_todos;
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
          uint64_t v10 = *(void *)(v9 + 24);
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

- (NSArray)sharedCKRecordIDs
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_todos, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = self->_todos;
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
          uint64_t v10 = *(void *)(v9 + 32);
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
  id v15 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  uint64_t v9 = [WeakRetained scopedIdentifierForCKRecordID:v15];

  if (!v9)
  {
    sub_1001C779C(v15, a2, self);
LABEL_7:
    if (!_CPLSilentLogging)
    {
      id v12 = sub_100038278();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v15;
        __int16 v18 = 2112;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to find share todo matching %@/%@", buf, 0x16u);
      }
    }
    long long v13 = +[NSAssertionHandler currentHandler];
    long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCKBatchUploadPlanner.m"];
    [v13 handleFailureInMethod:a2, self, v14, 1378, @"Unable to find share todo matching %@/%@", v15, v9 object file lineNumber description];

    abort();
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_todoPerScopedIdentifier objectForKeyedSubscript:v9];
  currentTodo = self->_currentTodo;
  self->_currentTodo = v10;

  if (!self->_currentTodo) {
    goto LABEL_7;
  }
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)CKRecordID);
  uint64_t v10 = [v7 recordID];
  id v11 = [v10 recordName];
  id v12 = [v8 zoneID];

  id v13 = [v9 initWithRecordName:v11 zoneID:v12];
  long long v14 = [v13 recordName];
  currentTodo = self->_currentTodo;
  if (currentTodo) {
    sharedRecordID = currentTodo->_sharedRecordID;
  }
  else {
    sharedRecordID = 0;
  }
  id v17 = [(CKRecordID *)sharedRecordID recordName];
  unsigned __int8 v18 = [v14 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
    v20 = WeakRetained;
    v21 = self->_currentTodo;
    if (v21) {
      scopedIdentifier = v21->_scopedIdentifier;
    }
    else {
      scopedIdentifier = 0;
    }
    [WeakRetained _willUpdateCKRecordWithID:v13 onBehalfOfRecordWithScopedIdentifier:scopedIdentifier];

    sub_10003DA00((uint64_t)self->_currentTodo, v13);
  }
  id v23 = objc_alloc((Class)CPLScopedIdentifier);
  id v24 = objc_loadWeakRetained((id *)&self->_planner);
  v25 = [v24 destinationZoneIdentification];
  v26 = [v25 scopeIdentifier];
  v27 = [v13 recordName];
  id v41 = [v23 initWithScopeIdentifier:v26 identifier:v27];

  id v28 = objc_alloc((Class)CPLScopedIdentifier);
  id v29 = objc_loadWeakRetained((id *)&self->_planner);
  v30 = [v29 sharedZoneIdentification];
  v31 = [v30 scopeIdentifier];
  [v7 recordID];
  v33 = v32 = v7;
  v34 = [v33 recordName];
  id v35 = [v28 initWithScopeIdentifier:v31 identifier:v34];

  id v36 = [objc_alloc((Class)CPLRecordTarget) initWithScopedIdentifier:v41 otherScopedIdentifier:v35 targetState:3];
  sub_10003DA10((uint64_t)self->_currentTodo, v36);

  id v37 = objc_alloc((Class)CKRecord);
  v38 = [v32 recordType];
  id v39 = [v37 initWithRecordType:v38 recordID:v13];

  return v39;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dateExpunged"])
  {
    unsigned __int8 v5 = 1;
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
      unsigned __int8 v5 = 0;
    }
    else
    {
      uint64_t v10 = self->_currentTodo;
      if (v10) {
        Class v11 = v10->_recordClass;
      }
      else {
        Class v11 = 0;
      }
      unsigned __int8 v5 = [v7 shouldUpdateKeyOnSharedRecord:v4 recordClass:v11];
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
  id v9 = [WeakRetained destinationZoneIdentification];
  uint64_t v10 = [v9 scopeIdentifier];
  id v11 = [v6 initWithScopeIdentifier:v10 identifier:v5];

  id v12 = objc_loadWeakRetained((id *)p_planner);
  id v13 = [v12 targetMapping];
  long long v14 = [v13 targetForRecordWithScopedIdentifier:v11];

  if (v14)
  {
    id v15 = [v14 otherScopedIdentifier];
    uint64_t v16 = [v15 identifier];
    id v17 = (void *)v16;
    if (v16) {
      unsigned __int8 v18 = (void *)v16;
    }
    else {
      unsigned __int8 v18 = v5;
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
  id v8 = self->_currentTodo;
  if (v8) {
    id v8 = (CPLCKShareRecordTodo *)v8->_proposedContributorUserIdentifiers;
  }
  id v9 = v8;
  if ([(CPLCKShareRecordTodo *)v9 count])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v10 = sub_100038278();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v5 recordID];
        int v26 = 138412546;
        v27 = v9;
        __int16 v28 = 2112;
        id v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating proposedContributorUserIdentifiers %@ for %@", (uint8_t *)&v26, 0x16u);
      }
    }
    objc_msgSend(v5, "cpl_updateContributorsOnSharedRecord:", v9);
  }
  id v12 = self->_currentTodo;
  if (v12) {
    Class recordClass = v12->_recordClass;
  }
  else {
    Class recordClass = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planner);
  id v15 = [WeakRetained sharedZoneIdentification];

  if (([v15 supportsDirectDeletionOfRecordClass:recordClass] & 1) == 0)
  {
    [v5 setObject:&__kCFBooleanFalse forKey:@"isExpunged"];
    uint64_t v16 = [v5 objectForKey:@"isDeleted"];

    if (!v16) {
      [v5 setObject:&__kCFBooleanFalse forKey:@"isDeleted"];
    }
    if ([(objc_class *)recordClass isSubclassOfClass:objc_opt_class()]) {
      [v5 setObject:v7 forKey:@"mostRecentAddedDate"];
    }
  }
  if ([(objc_class *)recordClass supportsSharingScopedIdentifier])
  {
    [v5 setObject:0 forKey:@"linkedShareZoneName"];
    [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
    [v5 setObject:0 forKey:@"linkedShareRecordName"];
  }
  id v17 = self->_currentTodo;
  if (v17) {
    Class v18 = v17->_recordClass;
  }
  else {
    Class v18 = 0;
  }
  if ([(objc_class *)v18 isSubclassOfClass:objc_opt_class()])
  {
    id v19 = objc_loadWeakRetained((id *)&self->_planner);
    v20 = [v19 targetMapping];
    v21 = v20;
    v22 = self->_currentTodo;
    if (v22) {
      scopedIdentifier = v22->_scopedIdentifier;
    }
    else {
      scopedIdentifier = 0;
    }
    id v24 = [v20 targetForRecordWithScopedIdentifier:scopedIdentifier];

    if (v24 && [v24 shouldUploadToOtherRecord])
    {
      [v5 setKnownToServer:1];
      [v5 setEtag:@"-gateon"];
    }
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
  objc_storeStrong((id *)&self->_currentTodo, 0);
  objc_storeStrong((id *)&self->_todoPerScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_todos, 0);
}

@end