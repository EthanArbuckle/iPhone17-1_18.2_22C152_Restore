@interface CPLDirectPushChangeSession
+ selfCrashResetReason;
- (id)clientWorkDescription;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)finalizeWithCompletionHandler:(id)a3;
@end

@implementation CPLDirectPushChangeSession

- (id)clientWorkDescription
{
  return @"client pushing changes";
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(CPLDirectChangeSession *)self tearedDown])
  {
    if (!_CPLSilentLogging)
    {
      v12 = sub_100171058();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v40 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ was called while the session was already teared down", buf, 0xCu);
      }
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1001710AC;
    v37[3] = &unk_100275DF8;
    id v38 = v11;
    id v14 = v11;
    [(CPLDirectChangeSession *)self dispatchCallback:v37];
    v15 = v38;
  }
  else
  {
    v16 = [(CPLDirectPushChangeSession *)self abstractObject];
    v17 = [v16 libraryManager];
    v18 = [v17 platformObject];
    v19 = [v18 engineLibrary];
    objc_storeWeak((id *)((char *)&self->_lastSeenLibraryVersion + 2), v19);

    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    [WeakRetained clientIsPushingChanges];

    id v21 = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v22 = [v21 store];
    objc_storeWeak((id *)((char *)&self->_engineLibrary + 2), v22);

    id v23 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v24 = [v23 pushRepository];
    objc_storeWeak((id *)((char *)&self->_store + 2), v24);

    id v25 = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v26 = [v25 scheduler];
    objc_storeWeak((id *)((char *)&self->_pushRepository + 2), v26);

    v27 = (CPLEngineScheduler *)objc_alloc_init((Class)NSMutableSet);
    v28 = *(CPLEngineScheduler **)((char *)&self->_scheduler + 2);
    *(CPLEngineScheduler **)((char *)&self->_scheduler + 2) = v27;

    id v29 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100171110;
    v34[3] = &unk_10027D478;
    v34[4] = self;
    id v35 = v9;
    id v36 = v10;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001712D0;
    v32[3] = &unk_10027DE50;
    v32[4] = self;
    id v33 = v11;
    id v30 = v11;
    id v31 = [v29 performWriteTransactionWithBlock:v34 completionHandler:v32];

    v15 = v35;
  }
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
  [WeakRetained clientIsPushingChanges];

  [(CPLDirectChangeSession *)self discardTentativeResetReason];
  if ([(CPLDirectChangeSession *)self tearedDown])
  {
    if (!_CPLSilentLogging)
    {
      v7 = sub_100171058();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ was called while the session was already teared down", buf, 0xCu);
      }
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001715DC;
    v17[3] = &unk_100275DF8;
    id v18 = v5;
    id v9 = v5;
    [(CPLDirectChangeSession *)self dispatchCallback:v17];
    id v10 = v18;
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100171640;
    v16[3] = &unk_1002773D8;
    v16[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100171AA8;
    v14[3] = &unk_10027DE50;
    v14[4] = self;
    id v15 = v5;
    id v12 = v5;
    id v13 = [v11 performWriteTransactionWithBlock:v16 completionHandler:v14];

    id v10 = v15;
  }
}

- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
  [WeakRetained clientIsPushingChanges];

  [(CPLDirectChangeSession *)self discardTentativeResetReason];
  if ([(CPLDirectChangeSession *)self tearedDown])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100171058();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromSelector(a2);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ was called while the session was already teared down", (uint8_t *)&buf, 0xCu);
      }
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100171F3C;
    v28[3] = &unk_100275DF8;
    id v29 = v8;
    [(CPLDirectChangeSession *)self dispatchCallback:v28];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3032000000;
    v32 = sub_100171FAC;
    id v33 = sub_100171FBC;
    id v34 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = sub_100171FAC;
    v26[4] = sub_100171FBC;
    id v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    char v25 = 0;
    id v12 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100171FC4;
    v19[3] = &unk_10027EBA0;
    v19[4] = self;
    id v20 = v7;
    id v21 = v26;
    p_long long buf = &buf;
    SEL v23 = a2;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001726C0;
    v14[3] = &unk_10027EC18;
    v16 = &buf;
    v17 = v24;
    v14[4] = self;
    id v15 = v8;
    id v18 = v26;
    id v13 = [v12 performWriteTransactionWithBlock:v19 completionHandler:v14];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

    _Block_object_dispose(&buf, 8);
  }
}

+ selfCrashResetReason
{
  void *v2;
  uint64_t vars8;

  if (qword_1002DBD10 != -1) {
    dispatch_once(&qword_1002DBD10, &stru_10027EC38);
  }
  v2 = (void *)qword_1002DBD18;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_scheduler + 2), 0);
  objc_destroyWeak((id *)((char *)&self->_pushRepository + 2));
  objc_destroyWeak((id *)((char *)&self->_store + 2));
  objc_destroyWeak((id *)((char *)&self->_engineLibrary + 2));
  objc_destroyWeak((id *)((char *)&self->_lastSeenLibraryVersion + 2));
  objc_storeStrong((id *)(&self->_pushedBatchesCanLowerQuota + 1), 0);
}

@end