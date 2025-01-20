@interface CPLDirectPullChangeSession
+ selfCrashResetReason;
- (id)clientWorkDescription;
- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)getChangeBatchWithCompletionHandler:(id)a3;
@end

@implementation CPLDirectPullChangeSession

- (id)clientWorkDescription
{
  return @"client pulling changes";
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
      v12 = sub_10016CEC4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v41 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ was called while the session was already teared down", buf, 0xCu);
      }
    }
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10016CF18;
    v38[3] = &unk_100275DF8;
    id v39 = v11;
    id v14 = v11;
    [(CPLDirectChangeSession *)self dispatchCallback:v38];
    v15 = v39;
  }
  else
  {
    v16 = [(CPLDirectPullChangeSession *)self abstractObject];
    v17 = [v16 libraryManager];
    v18 = [v17 platformObject];
    v19 = [v18 engineLibrary];
    objc_storeWeak((id *)((char *)&self->_lastSeenLibraryVersion + 2), v19);

    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v21 = [WeakRetained store];
    objc_storeWeak((id *)((char *)&self->_engineLibrary + 2), v21);

    id v22 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v23 = [v22 scopes];
    objc_storeWeak((id *)((char *)&self->_store + 2), v23);

    id v24 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v25 = [v24 pullQueue];
    objc_storeWeak((id *)((char *)&self->_scopes + 2), v25);

    id v26 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v27 = [v26 idMapping];
    objc_storeWeak((id *)((char *)&self->_pullQueue + 2), v27);

    id v28 = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v29 = [v28 scheduler];
    objc_storeWeak((id *)((char *)&self->_idMapping + 2), v29);

    id v30 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10016CF7C;
    v35[3] = &unk_10027D478;
    v35[4] = self;
    id v36 = v9;
    id v37 = v10;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10016D184;
    v33[3] = &unk_10027DE50;
    v33[4] = self;
    id v34 = v11;
    id v31 = v11;
    id v32 = [v30 performWriteTransactionWithBlock:v35 completionHandler:v33];

    v15 = v36;
  }
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(CPLDirectChangeSession *)self discardTentativeResetReason];
  if ([(CPLDirectChangeSession *)self tearedDown])
  {
    if (!_CPLSilentLogging)
    {
      v6 = sub_10016CEC4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = NSStringFromSelector(a2);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ was called while the session was already teared down", (uint8_t *)&buf, 0xCu);
      }
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10016D588;
    v18[3] = &unk_100275DF8;
    id v19 = v5;
    [(CPLDirectChangeSession *)self dispatchCallback:v18];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000;
    id v22 = sub_10016D5F0;
    v23 = sub_10016D600;
    id v24 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10016D608;
    v15[3] = &unk_10027E9B8;
    v15[4] = self;
    v15[5] = &buf;
    v15[6] = v16;
    v15[7] = a2;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10016DF44;
    v10[3] = &unk_10027EA08;
    v10[4] = self;
    id v11 = v5;
    v12 = v16;
    p_long long buf = &buf;
    SEL v14 = a2;
    id v9 = [WeakRetained performWriteTransactionWithBlock:v15 completionHandler:v10];

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CPLDirectChangeSession *)self tearedDown])
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10016CEC4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = NSStringFromSelector(a2);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ was called while the session was already teared down", (uint8_t *)&buf, 0xCu);
      }
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10016E4F0;
    v20[3] = &unk_100275DF8;
    id v21 = v8;
    [(CPLDirectChangeSession *)self dispatchCallback:v20];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000;
    id v24 = sub_10016D5F0;
    v25 = sub_10016D600;
    id v26 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10016E558;
    void v16[3] = &unk_10027EAA0;
    v16[4] = self;
    p_long long buf = &buf;
    SEL v19 = a2;
    id v17 = v7;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10016EEE0;
    v13[3] = &unk_10027EAC8;
    v15 = &buf;
    v13[4] = self;
    id v14 = v8;
    id v12 = [WeakRetained performWriteTransactionWithBlock:v16 completionHandler:v13];

    _Block_object_dispose(&buf, 8);
  }
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  [(CPLDirectChangeSession *)self discardTentativeResetReason];
  if ([(CPLDirectChangeSession *)self tearedDown])
  {
    if (!_CPLSilentLogging)
    {
      v6 = sub_10016CEC4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412290;
        SEL v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ was called while the session was already teared down", buf, 0xCu);
      }
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10016F3EC;
    void v16[3] = &unk_100275DF8;
    id v17 = v5;
    id v8 = v5;
    [(CPLDirectChangeSession *)self dispatchCallback:v16];
    id v9 = v17;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10016F450;
    v15[3] = &unk_1002773D8;
    v15[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10016FBD8;
    v13[3] = &unk_10027DE50;
    v13[4] = self;
    id v14 = v5;
    id v11 = v5;
    id v12 = [WeakRetained performWriteTransactionWithBlock:v15 completionHandler:v13];

    id v9 = v14;
  }
}

+ selfCrashResetReason
{
  void *v2;
  uint64_t vars8;

  if (qword_1002DBCE0 != -1) {
    dispatch_once(&qword_1002DBCE0, &stru_10027EAE8);
  }
  v2 = (void *)qword_1002DBCE8;
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)((char *)&self->_idMapping + 2));
  objc_destroyWeak((id *)((char *)&self->_pullQueue + 2));
  objc_destroyWeak((id *)((char *)&self->_scopes + 2));
  objc_destroyWeak((id *)((char *)&self->_store + 2));
  objc_destroyWeak((id *)((char *)&self->_engineLibrary + 2));
  objc_destroyWeak((id *)((char *)&self->_lastSeenLibraryVersion + 2));
  objc_storeStrong((id *)((char *)&self->_revertedChangesBatch + 2), 0);
  objc_storeStrong((id *)((char *)&self->_scopeChangesBatch + 2), 0);
  objc_storeStrong((id *)((char *)&self->_expandedClientBatch + 2), 0);
  objc_storeStrong((id *)((char *)&self->_expandedCloudBatch + 2), 0);
  objc_storeStrong((id *)((char *)&self->_pendingAckForBatch + 2), 0);
  objc_storeStrong((id *)(&self->_shouldPullAtLeastOneBatch + 2), 0);
}

@end