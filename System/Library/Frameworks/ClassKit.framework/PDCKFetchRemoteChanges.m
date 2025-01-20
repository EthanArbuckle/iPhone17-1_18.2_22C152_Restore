@interface PDCKFetchRemoteChanges
- (BOOL)isExpiredSyncTokenError:(id)a3;
- (BOOL)processObject:(id)a3 andUpdateSyncMetadataForRecord:(id)a4;
- (BOOL)processPendingRecord:(id)a3;
- (BOOL)processPendingSyncUpdatesWithParentRecordIDs:(id)a3;
- (id)objectForCKRecord:(id)a3;
- (id)zoneIDsToFetch;
- (void)execute;
- (void)fetchChangesInZonesWithZoneIDs:(id)a3;
- (void)serverChangedRecord:(id)a3;
- (void)serverDeletedRecordWithID:(id)a3 type:(id)a4;
@end

@implementation PDCKFetchRemoteChanges

- (BOOL)isExpiredSyncTokenError:(id)a3
{
  return [a3 code] == (id)21;
}

- (void)execute
{
  if (![(PDOperation *)self isAborted])
  {
    if ([(PDCKOperation *)self isBootstrapped])
    {
      id v3 = [(PDCKFetchRemoteChanges *)self zoneIDsToFetch];
      if ([v3 count]) {
        [(PDCKFetchRemoteChanges *)self fetchChangesInZonesWithZoneIDs:v3];
      }
      else {
        [(PDAsyncOperation *)self markAsFinished];
      }
    }
    else
    {
      [(PDAsyncOperation *)self markAsFinished];
    }
  }
}

- (id)zoneIDsToFetch
{
  id v3 = *(NSMutableArray **)((char *)&self->super._operations + 4);
  if (v3 && [v3 count])
  {
    id v4 = *(id *)((char *)&self->super._operations + 4);
  }
  else
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [(PDCKOperation *)self progressZone];
    v6 = [v5 zoneID];

    if (v6) {
      [v4 addObject:v6];
    }
    v7 = [(PDCKOperation *)self teacherZone];
    v8 = [v7 zoneID];

    if (v8) {
      [v4 addObject:v8];
    }
    v9 = [(PDCKOperation *)self surveyAnswerZone];
    v10 = [v9 zoneID];

    if (v10) {
      [v4 addObject:v10];
    }
  }

  return v4;
}

- (void)fetchChangesInZonesWithZoneIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = [(PDOperation *)self database];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000E1D98;
  v28[3] = &unk_1001F2F00;
  id v7 = v4;
  id v29 = v7;
  id v8 = v6;
  id v30 = v8;
  id v9 = v5;
  id v31 = v9;
  sub_10000749C(v8, v28);
  id v10 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v7 configurationsByRecordZoneID:v9];
  [v10 setFetchAllChanges:0];
  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000E1F48;
  v25[3] = &unk_1001F36A8;
  objc_copyWeak(&v26, &location);
  [v10 setRecordWasChangedBlock:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000E207C;
  v23[3] = &unk_1001F4620;
  objc_copyWeak(&v24, &location);
  [v10 setRecordWithIDWasDeletedBlock:v23];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E2118;
  v21[3] = &unk_1001F4648;
  objc_copyWeak(&v22, &location);
  [v10 setRecordZoneChangeTokensUpdatedBlock:v21];
  v11 = objc_opt_new();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E2224;
  v18[3] = &unk_1001F4670;
  objc_copyWeak(&v20, &location);
  id v12 = v11;
  id v19 = v12;
  [v10 setRecordZoneFetchCompletionBlock:v18];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E238C;
  v14[3] = &unk_1001F2620;
  objc_copyWeak(&v17, &location);
  id v13 = v12;
  id v15 = v13;
  v16 = self;
  [v10 setCompletionBlock:v14];
  [(PDCKOperation *)self performCKDatabaseOperation:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)serverChangedRecord:(id)a3
{
  id v4 = a3;
  id v5 = +[PDCKOperation recordTypeToEntityMap];
  v6 = [v4 recordType];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    [(PDOperation *)self database];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    char v19 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E262C;
    v12[3] = &unk_1001F4698;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v8;
    id v17 = v7;
    id v9 = v4;
    id v15 = self;
    v16 = v18;
    id v14 = v9;
    if (!v8 || ([v8 performTransaction:v12 forWriting:1] & 1) == 0)
    {
      CLSInitLog();
      id v10 = CLSLogSync;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [v9 recordID];
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2114;
        v23 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to save updated object in replay log; record: %@, recordID: %{public}@",
          buf,
          0x16u);
      }
      [(PDCKOperation *)self abort];
    }

    _Block_object_dispose(v18, 8);
  }
}

- (id)objectForCKRecord:(id)a3
{
  id v3 = a3;
  id v4 = +[PDCKOperation recordTypeToEntityMap];
  id v5 = [v3 recordType];
  v6 = (objc_class *)[v4 objectForKeyedSubscript:v5];

  id v7 = [[v6 alloc] initWithCKRecord:v3];

  return v7;
}

- (BOOL)processObject:(id)a3 andUpdateSyncMetadataForRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(PDOperation *)self database];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ![v6 shouldInsertInDatabase:v8]) {
      goto LABEL_13;
    }
    if ([v8 insertOrUpdateObject:v6])
    {
      if (![(PDCKOperation *)self updateSyncMetadataForRecord:v7])
      {
        CLSInitLog();
        id v9 = (void *)CLSLogSync;
        if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR))
        {
          id v14 = v9;
          id v15 = [v7 recordID];
          int v16 = 138412546;
          id v17 = v7;
          __int16 v18 = 2114;
          char v19 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to update metadata for record; %@, recordID: %{public}@;",
            (uint8_t *)&v16,
            0x16u);
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      id v10 = v6;
      if ([v10 type] == (id)3) {
        sub_100125850((uint64_t)PDFileSyncManager, v10, v8);
      }
    }
    else
    {
      CLSInitLog();
      v11 = (void *)CLSLogSync;
      if (!os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      id v10 = v11;
      id v13 = [v7 recordID];
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2114;
      char v19 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to insert/update object for record; %@, recordID: %{public}@;",
        (uint8_t *)&v16,
        0x16u);
    }
LABEL_13:
  }
  return 1;
}

- (BOOL)processPendingRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCKFetchRemoteChanges *)self objectForCKRecord:v4];
  if (v5) {
    BOOL v6 = [(PDCKFetchRemoteChanges *)self processObject:v5 andUpdateSyncMetadataForRecord:v4];
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)processPendingSyncUpdatesWithParentRecordIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[PDDatabase whereSQLForArray:v4 prefix:@"parentRecordID in "];
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:200];
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  id v7 = [(PDOperation *)self database];
  uint64_t v8 = objc_opt_class();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E3068;
  v15[3] = &unk_1001F46C0;
  id v17 = &v18;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  [v7 selectAll:v8 where:v5 orderBy:0 bindings:v4 block:v15];
  if (*((unsigned char *)v19 + 24)
    && (unsigned __int8 v10 = [v7 deleteAll:objc_opt_class() where:v5 bindings:v4],
        *((unsigned char *)v19 + 24) = v10,
        (v10 & 1) != 0))
  {
    if ([v9 count])
    {
      BOOL v11 = [(PDCKFetchRemoteChanges *)self processPendingSyncUpdatesWithParentRecordIDs:v9];
      *((unsigned char *)v19 + 24) = v11;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    CLSInitLog();
    id v12 = CLSLogSync;
    if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to replay sync log", v14, 2u);
    }
    BOOL v11 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)serverDeletedRecordWithID:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PDOperation *)self database];
  id v9 = [v6 recordName];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E32EC;
  v15[3] = &unk_1001F46E8;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  if (!v12 || ([v12 performTransaction:v15 forWriting:1] & 1) == 0)
  {
    CLSInitLog();
    id v14 = CLSLogSync;
    if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to delete an object from the local DB that has been deleted in iCloud; recordID: %{public}@;",
        buf,
        0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

@end