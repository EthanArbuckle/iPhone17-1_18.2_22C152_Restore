@interface CPLCloudKitQueryTask
- (CPLCKQueryCursor)cursor;
- (CPLCloudKitQueryTask)initWithController:(id)a3 cursor:(id)a4 class:(Class)a5 scope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (Class)queriedClass;
- (void)_runOperationsWithCurrentUserID:(id)a3;
- (void)_runQueryWithCurrentUserID:(id)a3 cursor:(id)a4 additionalInfo:(id)a5 completionHandler:(id)a6;
- (void)runOperations;
- (void)runWithinSyncSession:(id)a3;
- (void)sendProgressBatch:(id)a3 updatedCursor:(id)a4;
@end

@implementation CPLCloudKitQueryTask

- (CPLCloudKitQueryTask)initWithController:(id)a3 cursor:(id)a4 class:(Class)a5 scope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v33.receiver = self;
  v33.super_class = (Class)CPLCloudKitQueryTask;
  v21 = [(CPLCloudKitTransportTask *)&v33 initWithController:v15];
  if (v21)
  {
    objc_initWeak(&location, v21);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004BB14;
    v29[3] = &unk_100277DF0;
    objc_copyWeak(&v31, &location);
    id v30 = v20;
    id v22 = [v29 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v22;

    id v24 = [v19 copy];
    id progressHandler = v21->_progressHandler;
    v21->_id progressHandler = v24;

    if (v16)
    {
      v26 = [[CPLCKQueryCursor alloc] initWithCursorData:v16];
      cursor = v21->_cursor;
      v21->_cursor = v26;
    }
    objc_storeStrong((id *)&v21->_queriedClass, a5);
    [(CPLCloudKitTransportTask *)v21 setTransportScopeMapping:v18];
    objc_storeStrong((id *)&v21->_scope, a6);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v21;
}

- (void)runWithinSyncSession:(id)a3
{
  id v4 = a3;
  [(CPLCloudKitQueryTask *)self hash];
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)CPLCloudKitQueryTask;
  [(CPLCloudKitTransportTask *)&v5 runWithinSyncSession:v4];
}

- (void)sendProgressBatch:(id)a3 updatedCursor:(id)a4
{
  id progressHandler = (void (**)(id, id, id))self->_progressHandler;
  id v6 = a3;
  id v7 = [a4 cursorData];
  progressHandler[2](progressHandler, v6, v7);
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004BD08;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (void)_runOperationsWithCurrentUserID:(id)a3
{
  id v4 = a3;
  cursor = self->_cursor;
  id v6 = [(CPLCKQueryCursor *)cursor additionalInfo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004BE00;
  v8[3] = &unk_100276128;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(CPLCloudKitQueryTask *)self _runQueryWithCurrentUserID:v7 cursor:cursor additionalInfo:v6 completionHandler:v8];
}

- (void)_runQueryWithCurrentUserID:(id)a3 cursor:(id)a4 additionalInfo:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v66 = 0;
  unsigned __int8 v15 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v66];
  id v16 = v66;
  if (v15)
  {
    scope = self->_scope;
    if (scope)
    {
      id v18 = [(CPLEngineScope *)scope scopeIdentifier];
      v41 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v18];

      if (v41)
      {
        v40 = [(CPLEngineScope *)self->_scope scopeIdentifier];
        id v19 = [(CPLCloudKitTransportTask *)self controller];
        v39 = [v19 zoneIdentificationForCloudKitScope:v41 engineScope:self->_scope];

        p_queriedClass = &self->_queriedClass;
        if ([v39 supportsDownloadOfRecordClass:self->_queriedClass])
        {
          if (qword_1002CE5B0 != -1) {
            dispatch_once(&qword_1002CE5B0, &stru_100277E10);
          }
          v21 = (void *)qword_1002CE5A8;
          id v22 = sub_10004CC54(*p_queriedClass, v13);
          v38 = [v21 objectForKeyedSubscript:v22];

          if (!v38) {
            sub_1001C80B8(&self->_queriedClass, (uint64_t)a2, (uint64_t)self);
          }
          BOOL v23 = self->_cursor == 0;
          id v24 = objc_alloc((Class)CKQueryOperation);
          if (v23)
          {
            v25 = [v38 query];
            id v26 = [v24 initWithQuery:v25];
          }
          else
          {
            v25 = [(CPLCKQueryCursor *)self->_cursor queryCursor];
            id v26 = [v24 initWithCursor:v25];
          }
          id v31 = v26;

          v32 = [v41 zoneID];
          [v31 setZoneID:v32];

          [v31 setDesiredKeys:0];
          v37 = [(objc_class *)*p_queriedClass ckAssetProperties];
          objc_msgSend(v31, "setShouldFetchAssetContent:", objc_msgSend(v37, "count") != 0);
          uint64_t v33 = (uint64_t)[v38 resultsLimit];
          if (v33 >= 1) {
            [v31 setResultsLimit:v33];
          }
          if (!v33) {
            uint64_t v33 = 2000;
          }
          [v31 setFetchAllResults:1];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v68 = sub_10004CCF8;
          v69 = sub_10004CD08;
          id v70 = objc_alloc_init((Class)CPLChangeBatch);
          v65[0] = 0;
          v65[1] = v65;
          v65[2] = 0x2020000000;
          v65[3] = 0;
          v63[0] = 0;
          v63[1] = v63;
          v63[2] = 0x2020000000;
          char v64 = 0;
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_10004CD10;
          v55[3] = &unk_100277E60;
          v59 = v63;
          v60 = v65;
          v55[4] = self;
          uint64_t v62 = v33;
          id v56 = v40;
          id v57 = v11;
          id v58 = v39;
          v61 = buf;
          [v31 setRecordMatchedBlock:v55];
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_10004D15C;
          v51[3] = &unk_100277E88;
          v51[4] = self;
          v53 = buf;
          id v34 = v13;
          id v52 = v34;
          v54 = v65;
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10004D298;
          v48[3] = &unk_100277EB0;
          v50 = v63;
          v48[4] = self;
          v35 = objc_retainBlock(v51);
          id v49 = v35;
          [v31 setQueryCursorFetchedBlock:v48];
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_10004D3F4;
          v42[3] = &unk_100277F00;
          v42[4] = self;
          v46 = v63;
          v47 = buf;
          v36 = v35;
          id v44 = v36;
          id v43 = v34;
          id v45 = v14;
          [v31 setQueryCompletionBlock:v42];
          [(CPLCloudKitTransportTask *)self launchOperation:v31 type:CPLCloudKitOperationTypeForScope(v41) withContext:0];

          _Block_object_dispose(v63, 8);
          _Block_object_dispose(v65, 8);
          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            v28 = sub_10004BFD8();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = *p_queriedClass;
              id v30 = [v39 scopeIdentifier];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v29;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v30;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Ignoring unsupported %@ for %@", buf, 0x16u);
            }
          }
          (*((void (**)(id, void))v14 + 2))(v14, 0);
        }
      }
      else
      {
        v40 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
        (*((void (**)(id, void *))v14 + 2))(v14, v40);
      }
    }
    else
    {
      v27 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required scope"];
      (*((void (**)(id, void *))v14 + 2))(v14, v27);
    }
  }
  else
  {
    (*((void (**)(id, id))v14 + 2))(v14, v16);
  }
}

- (CPLCKQueryCursor)cursor
{
  return self->_cursor;
}

- (Class)queriedClass
{
  return self->_queriedClass;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_queriedClass, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end