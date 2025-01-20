@interface CPLCloudKitUpdateContributorsTask
- (CPLCloudKitUpdateContributorsTask)initWithController:(id)a3 sharedScope:(id)a4 contributorsUpdates:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (CPLEngineScope)sharedScope;
- (NSArray)contributorsUpdates;
- (id)_computeUpdatedSharedCKRecordsFromFoundRecord:(id)a3 usingUpdates:(id)a4 error:(id *)a5;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (void)_updateCKRecordsInSharedScope:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitUpdateContributorsTask

- (CPLCloudKitUpdateContributorsTask)initWithController:(id)a3 sharedScope:(id)a4 contributorsUpdates:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CPLCloudKitUpdateContributorsTask;
  v17 = [(CPLCloudKitTransportTask *)&v23 initWithController:a3];
  if (v17)
  {
    v18 = (NSArray *)[v14 copy];
    contributorsUpdates = v17->_contributorsUpdates;
    v17->_contributorsUpdates = v18;

    id v20 = [v16 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v20;

    objc_storeStrong((id *)&v17->_sharedScope, a4);
    [(CPLCloudKitTransportTask *)v17 setTransportScopeMapping:v15];
  }

  return v17;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_scopedIdentifiersFromCKRecordID objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLCloudKitUpdateContributorsTask;
    id v7 = [(CPLCloudKitTransportTask *)&v10 rejectedScopedIdentifierForRejectedCKRecordID:v4];
  }
  v8 = v7;

  return v8;
}

- (void)_updateCKRecordsInSharedScope:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v15 = 0;
    unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v15];
    id v6 = v15;
    if ((v5 & 1) == 0) {
      (*((void (**)(void))self->_completionHandler + 2))();
    }
    id v7 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
    v8 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v7];

    if (v8)
    {
      id v9 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v4 recordIDsToDelete:0];
      [v9 setSavePolicy:0];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000A6A9C;
      v13[3] = &unk_100278DE8;
      v13[4] = self;
      id v14 = v4;
      [v9 setModifyRecordsCompletionBlock:v13];
      [(CPLCloudKitTransportTask *)self launchOperation:v9 type:CPLCloudKitOperationTypeForScope(v8) withContext:0];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        objc_super v10 = sub_1000A2DB8();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          sharedScope = self->_sharedScope;
          *(_DWORD *)buf = 138412290;
          v17 = sharedScope;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Trying to update contributors on %@ but transport scope is missing", buf, 0xCu);
        }
      }
      id completionHandler = (void (**)(id, id))self->_completionHandler;
      id v9 = +[CPLErrors cplErrorWithCode:32 description:@"Missing transport scope"];
      completionHandler[2](completionHandler, v9);
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (id)_computeUpdatedSharedCKRecordsFromFoundRecord:(id)a3 usingUpdates:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000A4074;
  v30 = sub_1000A4084;
  id v31 = 0;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_1000A707C;
  v21 = &unk_10027A310;
  id v12 = v8;
  id v22 = v12;
  v25 = &v26;
  id v13 = v11;
  id v23 = v13;
  id v14 = v10;
  id v24 = v14;
  [v9 enumerateKeysAndObjectsUsingBlock:&v18];
  id v15 = (void *)v27[5];
  if (v15)
  {
    id v16 = 0;
    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_scopedIdentifiersFromCKRecordID, v10);
    id v16 = objc_msgSend(v13, "allValues", v18, v19, v20, v21, v22, v23);
  }

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (void)runOperations
{
  id v31 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v31];
  id v4 = v31;
  unsigned __int8 v5 = v4;
  if (v3)
  {
    id v24 = v4;
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_contributorsUpdates, "count"));
    id v7 = objc_alloc_init((Class)CPLRecordTargetMapping);
    id v8 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v23 = self;
    id v9 = self->_contributorsUpdates;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "updateSharingContributorUserIdentifiers", v23);
          id v16 = [v15 count];

          if (v16)
          {
            v17 = [v14 scopedIdentifier];
            [v6 setObject:v14 forKeyedSubscript:v17];
            id v18 = objc_alloc((Class)CPLScopedIdentifier);
            uint64_t v19 = [v17 identifier];
            id v20 = [v18 initWithScopeIdentifier:v8 identifier:v19];

            id v21 = [objc_alloc((Class)CPLRecordTarget) initWithScopedIdentifier:v17 otherScopedIdentifier:v20 targetState:0];
            [v7 addKnownTarget:v21 forRecordWithScopedIdentifier:v17];
          }
        }
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    if ([v6 count])
    {
      id v22 = [v6 allKeys];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000A77A0;
      v25[3] = &unk_100278E38;
      v25[4] = v23;
      id v26 = v6;
      [(CPLCloudKitTransportTask *)v23 fetchFullRecordsForScopedIdentifiers:v22 targetMapping:v7 completionHandler:v25];
    }
    else
    {
      (*((void (**)(void))v23->_completionHandler + 2))();
    }
    unsigned __int8 v5 = v24;
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (NSArray)contributorsUpdates
{
  return self->_contributorsUpdates;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_contributorsUpdates, 0);
  objc_storeStrong((id *)&self->_scopedIdentifiersFromCKRecordID, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end