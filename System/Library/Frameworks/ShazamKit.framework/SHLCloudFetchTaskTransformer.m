@interface SHLCloudFetchTaskTransformer
- (CKFetchDatabaseChangesOperation)databaseChangesOperation;
- (CKFetchRecordZoneChangesOperation)recordZoneChangesOperation;
- (SHLCloudFetchTaskTransformer)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (id)cloudBackedDatabaseChangesOperationFromFetchTask:(id)a3 container:(id)a4 completion:(id)a5;
- (id)cloudBackedZoneChangesOperationFromFetchTask:(id)a3 forChangedZones:(id)a4 container:(id)a5;
- (id)configurationsByRecordZoneIDUsingCache:(id)a3;
- (id)recordIDsFromCloudBackedZones:(id)a3;
- (void)setDatabaseChangesOperation:(id)a3;
- (void)setRecordZoneChangesOperation:(id)a3;
@end

@implementation SHLCloudFetchTaskTransformer

- (SHLCloudFetchTaskTransformer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHLCloudFetchTaskTransformer;
  v6 = [(SHLCloudFetchTaskTransformer *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (CKFetchDatabaseChangesOperation *)objc_alloc_init((Class)CKFetchDatabaseChangesOperation);
    databaseChangesOperation = v7->_databaseChangesOperation;
    v7->_databaseChangesOperation = v8;

    [(CKFetchDatabaseChangesOperation *)v7->_databaseChangesOperation setFetchAllChanges:1];
    v10 = (CKFetchRecordZoneChangesOperation *)objc_alloc_init((Class)CKFetchRecordZoneChangesOperation);
    recordZoneChangesOperation = v7->_recordZoneChangesOperation;
    v7->_recordZoneChangesOperation = v10;

    [(CKFetchRecordZoneChangesOperation *)v7->_recordZoneChangesOperation setFetchAllChanges:1];
  }

  return v7;
}

- (id)cloudBackedDatabaseChangesOperationFromFetchTask:(id)a3 container:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v50 = a5;
  id v9 = a4;
  v10 = [v9 container];
  v11 = [v10 privateCloudDatabase];
  v12 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
  [v12 setDatabase:v11];

  objc_super v13 = [SHLCloudLibraryCache alloc];
  v14 = [(SHLCloudFetchTaskTransformer *)self configuration];
  v15 = [v14 callingProcessIdentifier];
  v16 = [v9 container];

  v17 = [v16 containerIdentifier];
  v18 = [(SHLCloudFetchTaskTransformer *)self configuration];
  v19 = [v18 sessionIdentifier];
  v20 = [(SHLCloudLibraryCache *)v13 initWithCallingProcessIdentifier:v15 containerIdentifier:v17 transactionIdentifier:v19];

  if ([v8 fetchType] == (id)1)
  {
    v21 = [(SHLCloudLibraryCache *)v20 databaseToken];
    v22 = [v21 serverChangeToken];
    v23 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
    [v23 setPreviousServerChangeToken:v22];

    v24 = sub_10003260C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
      v26 = [v25 previousServerChangeToken];
      *(_DWORD *)buf = 138412290;
      v66 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Using <token: %@> for database fetch", buf, 0xCu);
    }
  }
  v27 = +[NSMutableArray array];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10003E51C;
  v62[3] = &unk_100075DE0;
  v28 = v20;
  v63 = v28;
  id v29 = v27;
  id v64 = v29;
  v30 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
  [v30 setRecordZoneWithIDChangedBlock:v62];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10003E710;
  v59[3] = &unk_100075DE0;
  v31 = v28;
  v60 = v31;
  id v32 = v8;
  id v61 = v32;
  v33 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
  [v33 setRecordZoneWithIDWasDeletedBlock:v59];

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10003E914;
  v56[3] = &unk_100075DE0;
  v34 = v31;
  v57 = v34;
  id v35 = v32;
  id v58 = v35;
  v36 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
  [v36 setRecordZoneWithIDWasPurgedBlock:v56];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10003EB18;
  v51[3] = &unk_100075E08;
  v52 = v34;
  id v53 = v29;
  id v54 = v35;
  id v55 = v50;
  id v37 = v35;
  id v38 = v50;
  id v39 = v29;
  v40 = v34;
  v41 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
  [v41 setFetchDatabaseChangesCompletionBlock:v51];

  id v42 = objc_alloc_init((Class)CKOperationGroup);
  [v42 setExpectedReceiveSize:1];
  [v42 setQuantity:1];
  v43 = [v37 syncStartCondition];
  v44 = +[NSString stringWithFormat:@"%@_%@", v43, @"FetchDatabaseChanges"];
  [v42 setName:v44];

  v45 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
  [v45 setGroup:v42];

  v46 = [SHLCloudBackedOperation alloc];
  v47 = [(SHLCloudFetchTaskTransformer *)self databaseChangesOperation];
  v48 = [(SHLCloudBackedOperation *)v46 initWithOperation:v47];

  return v48;
}

- (id)cloudBackedZoneChangesOperationFromFetchTask:(id)a3 forChangedZones:(id)a4 container:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v9 container];
  v12 = [v11 privateCloudDatabase];
  objc_super v13 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v13 setDatabase:v12];

  v14 = [(SHLCloudFetchTaskTransformer *)self recordIDsFromCloudBackedZones:v10];

  v15 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v15 setRecordZoneIDs:v14];

  v16 = [SHLCloudLibraryCache alloc];
  v17 = [(SHLCloudFetchTaskTransformer *)self configuration];
  v18 = [v17 callingProcessIdentifier];
  v19 = [v9 container];
  v20 = [v19 containerIdentifier];
  v21 = [(SHLCloudFetchTaskTransformer *)self configuration];
  v22 = [v21 sessionIdentifier];
  v23 = [(SHLCloudLibraryCache *)v16 initWithCallingProcessIdentifier:v18 containerIdentifier:v20 transactionIdentifier:v22];

  if ([v8 fetchType] == (id)1)
  {
    v24 = [(SHLCloudFetchTaskTransformer *)self configurationsByRecordZoneIDUsingCache:v23];
    v25 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
    [v25 setConfigurationsByRecordZoneID:v24];
  }
  v26 = +[NSMutableArray array];
  v27 = +[NSMutableArray array];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10003F330;
  v67[3] = &unk_100075E30;
  id v28 = v26;
  id v68 = v28;
  id v69 = v9;
  id v29 = v27;
  id v70 = v29;
  id v30 = v9;
  v31 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v31 setRecordWasChangedBlock:v67];

  +[NSMutableArray array];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10003F4E8;
  v65[3] = &unk_100075E58;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v66 = v32;
  v33 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v33 setRecordWithIDWasDeletedBlock:v65];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10003F540;
  v63[3] = &unk_100075E80;
  v34 = v23;
  id v64 = v34;
  id v35 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v35 setRecordZoneChangeTokensUpdatedBlock:v63];

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10003F5F0;
  v61[3] = &unk_100075EA8;
  v36 = v34;
  v62 = v36;
  id v37 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v37 setRecordZoneFetchCompletionBlock:v61];

  v52 = _NSConcreteStackBlock;
  uint64_t v53 = 3221225472;
  id v54 = sub_10003F7CC;
  id v55 = &unk_100075ED0;
  v56 = v36;
  id v57 = v8;
  id v58 = v28;
  id v59 = v29;
  id v60 = v32;
  id v38 = v32;
  id v39 = v29;
  id v40 = v28;
  id v41 = v8;
  id v42 = v36;
  v43 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v43 setFetchRecordZoneChangesCompletionBlock:&v52];

  id v44 = objc_alloc_init((Class)CKOperationGroup);
  [v44 setExpectedReceiveSize:1];
  [v44 setQuantity:1];
  v45 = [v41 syncStartCondition];
  v46 = +[NSString stringWithFormat:@"%@_%@", v45, @"FetchZoneChanges", v52, v53, v54, v55];
  [v44 setName:v46];

  v47 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  [v47 setGroup:v44];

  v48 = [SHLCloudBackedOperation alloc];
  v49 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  id v50 = [(SHLCloudBackedOperation *)v48 initWithOperation:v49];

  return v50;
}

- (id)recordIDsFromCloudBackedZones:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "zone", (void)v14);
        v11 = [v10 zoneID];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

- (id)configurationsByRecordZoneIDUsingCache:(id)a3
{
  id v4 = a3;
  id v5 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  id v6 = [v5 recordZoneIDs];
  id v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [(SHLCloudFetchTaskTransformer *)self recordZoneChangesOperation];
  id v9 = [v8 recordZoneIDs];

  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v25;
    *(void *)&long long v11 = 138412290;
    long long v23 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "zoneName", v23);
        long long v17 = [v4 zoneTokenForZoneIdentifier:v16];

        if (v17)
        {
          id v18 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
          v19 = [v17 serverChangeToken];
          [v18 setPreviousServerChangeToken:v19];

          [v7 setObject:v18 forKeyedSubscript:v15];
          v20 = sub_10003260C();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            id v29 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Using <zone changes configuration: %@> for fetch", buf, 0xCu);
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v12);
  }

  id v21 = [v7 copy];

  return v21;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (CKFetchDatabaseChangesOperation)databaseChangesOperation
{
  return self->_databaseChangesOperation;
}

- (void)setDatabaseChangesOperation:(id)a3
{
}

- (CKFetchRecordZoneChangesOperation)recordZoneChangesOperation
{
  return self->_recordZoneChangesOperation;
}

- (void)setRecordZoneChangesOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneChangesOperation, 0);
  objc_storeStrong((id *)&self->_databaseChangesOperation, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end