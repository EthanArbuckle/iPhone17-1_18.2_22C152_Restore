@interface CRDRecentContactsLibrary
+ (id)os_log;
- (CRDRecentContactsLibrary)initWithClient:(id)a3;
- (void)recordContactEvents:(id)a3 domain:(id)a4 sendingAddress:(id)a5 source:(id)a6 completion:(id)a7;
- (void)removeAllRecentContactsWithCompletion:(id)a3;
- (void)removeRecentContactsWithRecentIDs:(id)a3 syncKeys:(id)a4 domain:(id)a5;
- (void)restorePreviouslyDeletedRecentContacts:(id)a3 completion:(id)a4;
- (void)searchRecentsUsingQuery:(id)a3 completion:(id)a4;
@end

@implementation CRDRecentContactsLibrary

- (CRDRecentContactsLibrary)initWithClient:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRDRecentContactsLibrary;
  v6 = [(CRDRecentContactsLibrary *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = [v5 library];
    library = v7->_library;
    v7->_library = (_CRRecentsLibrary *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)searchRecentsUsingQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  uint64_t v8 = +[CRDRecentContactsLibrary os_log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 uuid];
    v10 = [(CRDClient *)self->_client bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    __int16 v28 = 2114;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will execute query %{public}@ for %{public}@", buf, 0x16u);
  }
  if (self->_library)
  {
    v11 = +[CNTimeProvider defaultProvider];
    [v11 timestamp];
    double v13 = v12;

    library = self->_library;
    id v25 = 0;
    id v15 = [(_CRRecentsLibrary *)library copyRecentsForQuery:v6 error:&v25];
    id v16 = v25;
    if (v15)
    {
      v7[2](v7, v15, 0);
      v17 = +[CNTimeProvider defaultProvider];
      [v17 timestamp];
      double v19 = v18;

      v20 = +[CNTimeIntervalFormatter stringForTimeInterval:v19 - v13];
      v21 = +[CRDRecentContactsLibrary os_log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v6 uuid];
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2114;
        v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Did execute query %{public}@ (%{public}@)", buf, 0x16u);
      }
    }
    else
    {
      v24 = +[CRDRecentContactsLibrary os_log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10001AE24(v6, (uint64_t)v16, v24);
      }

      ((void (**)(id, id, id))v7)[2](v7, 0, v16);
    }
  }
  else
  {
    v23 = +[CRDRecentContactsLibrary os_log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10001ADE0(v23);
    }

    id v16 = +[NSError errorWithDomain:CRRecentContactsErrorDomain code:4 userInfo:0];
    ((void (**)(id, id, id))v7)[2](v7, 0, v16);
  }
}

+ (id)os_log
{
  if (qword_1000344D8 != -1) {
    dispatch_once(&qword_1000344D8, &stru_10002D220);
  }
  v2 = (void *)qword_1000344E0;
  return v2;
}

- (void)recordContactEvents:(id)a3 domain:(id)a4 sendingAddress:(id)a5 source:(id)a6 completion:(id)a7
{
  library = self->_library;
  double v12 = (void (**)(id, void))a7;
  [(_CRRecentsLibrary *)library recordContactEvents:a3 recentsDomain:a4 sendingAddress:a5 source:a6];
  v12[2](v12, 0);
}

- (void)removeRecentContactsWithRecentIDs:(id)a3 syncKeys:(id)a4 domain:(id)a5
{
}

- (void)removeAllRecentContactsWithCompletion:(id)a3
{
}

- (void)restorePreviouslyDeletedRecentContacts:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end