@interface PDCKPushLocalChanges
- (id)recordForSyncItem:(id)a3;
- (void)deleteProcessedSyncAssociatedWithRecordID:(id)a3;
- (void)deleteSyncStateForRecordIDs:(id)a3;
- (void)execute;
- (void)populateRecordsToSave:(id)a3 idsToDelete:(id)a4 withSyncItem:(id)a5;
- (void)recordUpdated:(id)a3;
- (void)resolvePartialErrors:(id)a3;
- (void)scheduleRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5;
@end

@implementation PDCKPushLocalChanges

- (void)execute
{
  if (![(PDOperation *)self isAborted])
  {
    if ([(PDCKOperation *)self isBootstrapped])
    {
      v3 = +[NSMapTable strongToStrongObjectsMapTable];
      v4 = +[NSMapTable strongToStrongObjectsMapTable];
      [*(id *)((char *)&self->super._operations + 4) removeAllObjects];
      v5 = [(PDOperation *)self database];
      v6 = v5;
      if (v5 && (sub_100004B84(v5) & 2) != 0 && !sub_100006970(v6, @"syncTeacherContexts"))
      {
        v9 = +[CLSContext entityName];
        v31 = v9;
        v7 = +[NSArray arrayWithObjects:&v31 count:1];

        CLSInitLog();
        v10 = CLSLogSync;
        if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Syncing contexts not allowed.", buf, 2u);
        }
        CFStringRef v8 = @"entity != ?";
      }
      else
      {
        v7 = 0;
        CFStringRef v8 = 0;
      }
      v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_1000C8D20;
      v23 = &unk_1001F41F0;
      id v24 = v6;
      v25 = (__CFString *)v8;
      id v26 = v7;
      v27 = self;
      id v11 = v4;
      id v28 = v11;
      id v12 = v3;
      id v29 = v12;
      id v13 = v7;
      id v14 = v6;
      v15 = v14;
      if (v6) {
        [v14 performTransaction:&v20 forWriting:1];
      }
      if (objc_msgSend(v12, "count", v20, v21, v22, v23) || objc_msgSend(v11, "count"))
      {
        v16 = [v11 objectEnumerator];
        v17 = [v16 allObjects];
        v18 = [v12 objectEnumerator];
        v19 = [v18 allObjects];
        [(PDCKPushLocalChanges *)self scheduleRecordsToSave:v17 recordIDsToDelete:v19 savePolicy:0];
      }
      else
      {
        [(PDAsyncOperation *)self markAsFinished];
      }
    }
    else
    {
      [(PDAsyncOperation *)self markAsFinished];
    }
  }
}

- (id)recordForSyncItem:(id)a3
{
  id v4 = a3;
  v5 = [(PDCKOperation *)self recordIDForSyncItem:v4];
  uint64_t v6 = [(PDCKOperation *)self syncMetadataForRecordID:v5];
  v7 = (void *)v6;
  if (v6)
  {
    id v8 = *(id *)(v6 + 24);
    CKRecordFromMetadata(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(objc_msgSend(v4, "entity"), "recordType");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [objc_alloc((Class)CKRecord) initWithRecordType:v8 recordID:v5];
  }
  v10 = v9;

  id v11 = [(PDOperation *)self database];
  id v12 = [v4 entity];
  id v13 = [v4 entityIdentity];
  id v14 = [v11 select:v12 identity:v13];

  if (v14)
  {
    [v14 populate:v10];
    id v15 = v10;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)recordUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(PDOperation *)self database];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C9190;
  v8[3] = &unk_1001F1ED8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  v7 = v6;
  if (v5)
  {
    [v5 performTransaction:v8 forWriting:1];
    v7 = v9;
  }
}

- (void)deleteSyncStateForRecordIDs:(id)a3
{
  id v4 = a3;
  v5 = [(PDOperation *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C929C;
  v7[3] = &unk_1001F1ED8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  if (v5) {
    [v5 performTransaction:v7 forWriting:1];
  }
}

- (void)deleteProcessedSyncAssociatedWithRecordID:(id)a3
{
  id v4 = (PDPendingIngestItem *)a3;
  v5 = [*(id *)((char *)&self->super._operations + 4) objectForKeyedSubscript:v4];
  if ([v5 length])
  {
    id v6 = [(PDOperation *)self database];
    v7 = [v6 select:objc_opt_class() identity:v5];
    id v8 = v7;
    if (v7)
    {
      if (objc_msgSend(objc_msgSend(v7, "entity"), "conformsToProtocol:", &OBJC_PROTOCOL___PDIngestableItem))
      {
        id v9 = objc_alloc_init(PDPendingIngestItem);
        sub_100075F40((uint64_t)v9, [v8 entity]);
        v10 = [v8 entityIdentity];
        sub_100075F50((uint64_t)v9, v10);

        id v11 = [v8 state];
        if (v9) {
          v9->_wasDeleted = v11 == (id)3;
        }
        if (([v6 insertOrUpdateObject:v9] & 1) == 0)
        {
          CLSInitLog();
          id v12 = CLSLogSync;
          if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
          {
            int v14 = 138412290;
            id v15 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Failed to insert ingest item %@", (uint8_t *)&v14, 0xCu);
          }
        }
      }
      if (([v6 deleteObject:v8] & 1) == 0)
      {
        CLSInitLog();
        id v13 = CLSLogSync;
        if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
        {
          int v14 = 138543362;
          id v15 = v4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to delete sync item for record with recordID: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
}

- (void)scheduleRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(PDOperation *)self isAborted])
  {
    CLSInitLog();
    v10 = (void *)CLSLogSync;
    if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      *(_DWORD *)buf = 134218496;
      id v21 = [v8 count];
      __int16 v22 = 2048;
      id v23 = [v9 count];
      __int16 v24 = 2048;
      int64_t v25 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "scheduling records to save count: %ld, records to delete count: %ld; save policy: %ld",
        buf,
        0x20u);
    }
    id v12 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v8 recordIDsToDelete:v9];
    [v12 setSavePolicy:a5];
    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000C983C;
    v18[3] = &unk_1001F36A8;
    objc_copyWeak(&v19, (id *)buf);
    [v12 setPerRecordSaveBlock:v18];
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1000C9974;
    v16 = &unk_1001F36D0;
    objc_copyWeak(&v17, (id *)buf);
    [v12 setModifyRecordsCompletionBlock:&v13];
    -[PDCKOperation performCKDatabaseOperation:](self, "performCKDatabaseOperation:", v12, v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)resolvePartialErrors:(id)a3
{
  id v3 = a3;
  id v50 = objc_alloc_init((Class)NSMutableArray);
  id v48 = objc_alloc_init((Class)NSMutableDictionary);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v64 objects:v70 count:16];
  id v49 = v4;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v65;
    uint64_t v51 = *(void *)v65;
    do
    {
      id v8 = 0;
      v47 = "resolveConflictForLocalRecord:serverRecord:commonAncestorRecord:";
      id v53 = v6;
      do
      {
        if (*(void *)v65 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v64 + 1) + 8 * (void)v8);
        id v11 = [v4 objectForKeyedSubscript:v9];
        id v12 = [v11 code];
        if (v12 == (id)14)
        {
          id v13 = [v11 userInfo];
          uint64_t v14 = [v13 objectForKeyedSubscript:CKRecordChangedErrorAncestorRecordKey];

          id v15 = [v11 userInfo];
          v16 = [v15 objectForKeyedSubscript:CKRecordChangedErrorClientRecordKey];

          id v17 = [v11 userInfo];
          v18 = [v17 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

          id v19 = [v16 recordType];
          v20 = +[PDCKOperation recordTypeToEntityMap];
          id v21 = [v20 objectForKeyedSubscript:v19];
          if (v21)
          {
            if (objc_opt_respondsToSelector()) {
              [v21 resolveConflictForLocalRecord:v16 serverRecord:v18 commonAncestorRecord:v14];
            }
            objc_msgSend(v48, "setObject:forKeyedSubscript:", v18, v9, v47);
          }

          id v4 = v49;
          uint64_t v7 = v51;
          id v6 = v53;
        }
        else if (v12 == (id)22)
        {
          [v50 addObject:v9];
        }
        else if (v12 == (id)31)
        {
          [(PDCKOperation *)self abort];

          v46 = v48;
          goto LABEL_39;
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v6);
  }

  v46 = v48;
  if ([v48 count] || objc_msgSend(v50, "count"))
  {
    v52 = +[NSMapTable strongToStrongObjectsMapTable];
    __int16 v22 = +[NSMapTable strongToStrongObjectsMapTable];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v23 = v48;
    id v24 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v61;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v30 = [v28 recordName];
          v31 = [v23 objectForKeyedSubscript:v28];
          [v22 setObject:v31 forKey:v30];
        }
        id v25 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v25);
    }

    v54 = [(PDOperation *)self database];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v32 = v50;
    id v33 = [v32 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v57;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v57 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v56 + 1) + 8 * (void)j);
          v39 = [v23 objectForKeyedSubscript:v37];

          if (!v39)
          {
            v40 = [*(id *)((char *)&self->super._operations + 4) objectForKeyedSubscript:v37];
            v41 = [v54 select:objc_opt_class() identity:v40];
            if (v41) {
              [(PDCKPushLocalChanges *)self populateRecordsToSave:v22 idsToDelete:v52 withSyncItem:v41];
            }
          }
        }
        id v34 = [v32 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v34);
    }

    v42 = [v22 objectEnumerator];
    v43 = [v42 allObjects];
    v44 = [v52 objectEnumerator];
    v45 = [v44 allObjects];
    [(PDCKPushLocalChanges *)self scheduleRecordsToSave:v43 recordIDsToDelete:v45 savePolicy:1];

    v46 = v48;
    id v4 = v49;
  }
  else
  {
    [(PDAsyncOperation *)self markAsFinished];
  }
LABEL_39:
}

- (void)populateRecordsToSave:(id)a3 idsToDelete:(id)a4 withSyncItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!*(NSMutableArray **)((char *)&self->super._operations + 4))
  {
    id v11 = +[NSMapTable strongToStrongObjectsMapTable];
    id v12 = *(NSMutableArray **)((char *)&self->super._operations + 4);
    *(NSMutableArray **)((char *)&self->super._operations + 4) = v11;
  }
  if ([v10 state] == (id)3)
  {
    id v13 = [(PDCKOperation *)self recordIDForSyncItem:v10];
    uint64_t v14 = [v13 recordName];
    [v9 setObject:v13 forKey:v14];
    id v15 = [v10 identityValue];
    [*(id *)((char *)&self->super._operations + 4) setObject:v15 forKeyedSubscript:v13];

    v16 = [v13 recordName];
    [v8 removeObjectForKey:v16];
  }
  else
  {
    id v17 = [(PDCKPushLocalChanges *)self recordForSyncItem:v10];
    id v13 = v17;
    if (v17)
    {
      v18 = [v17 recordID];
      id v19 = [v18 recordName];

      [v8 setObject:v13 forKey:v19];
      v20 = [v10 identityValue];
      id v21 = *(NSMutableArray **)((char *)&self->super._operations + 4);
      __int16 v22 = [v13 recordID];
      [v21 setObject:v20 forKeyedSubscript:v22];
    }
    else
    {
      [(PDOperation *)self database];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000CA420;
      v26[3] = &unk_1001F1ED8;
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = v10;
      id v28 = v23;
      id v24 = v27;
      id v25 = v24;
      if (v24)
      {
        [v24 performTransaction:v26 forWriting:1];
        id v23 = v28;
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end