@interface AKPrivateEmailStoreManager
+ (id)sharedInstance;
- (AKPrivateEmailStoreManager)init;
- (AKPrivateEmailStoreManager)initWithExecutor:(id)a3;
- (AKPrivateEmailStoreManager)initWithPath:(id)a3;
- (AKSQLiteExecutor)executor;
- (BOOL)commitChangesToCacheWithInformation:(id)a3 error:(id *)a4;
- (BOOL)removePrivateEmailForContext:(id)a3 error:(id *)a4;
- (BOOL)setCurrentEmailListVersion:(id)a3 error:(id *)a4;
- (BOOL)setPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id *)a5;
- (BOOL)setProtocolVersion:(int)a3 error:(id *)a4;
- (id)_hashKeyIfNecessary:(id)a3;
- (id)currentEmailListVersion;
- (id)emailForContext:(id)a3 error:(id *)a4;
- (id)fetchAllPrivateEmailsWithError:(id *)a3;
- (int)currentProtocolVersion;
- (void)clearDatabase:(id *)a3;
- (void)setExecutor:(id)a3;
@end

@implementation AKPrivateEmailStoreManager

+ (id)sharedInstance
{
  if (qword_100272218 != -1) {
    dispatch_once(&qword_100272218, &stru_100226D30);
  }
  v2 = (void *)qword_100272210;

  return v2;
}

- (AKPrivateEmailStoreManager)init
{
  return [(AKPrivateEmailStoreManager *)self initWithPath:@"/Library/Application Support/com.apple.akd/privateEmails.db"];
}

- (AKPrivateEmailStoreManager)initWithExecutor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKPrivateEmailStoreManager;
  v6 = [(AKPrivateEmailStoreManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_executor, a3);
  }

  return v7;
}

- (AKPrivateEmailStoreManager)initWithPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AKPrivateEmailStoreManager;
  id v5 = [(AKPrivateEmailStoreManager *)&v13 init];
  if (v5)
  {
    v6 = objc_alloc_init(AKPrivateEmailStoreMigrator);
    v7 = [AKSQLiteExecutor alloc];
    v8 = NSHomeDirectory();
    objc_super v9 = [v8 stringByAppendingString:v4];
    v10 = [(AKSQLiteExecutor *)v7 initWithDatabasePath:v9 migrationController:v6];
    executor = v5->_executor;
    v5->_executor = v10;
  }
  return v5;
}

- (void)clearDatabase:(id *)a3
{
  executor = self->_executor;
  id v7 = 0;
  [(AKSQLiteExecutor *)executor wipeDatabase:&v7];
  id v5 = v7;
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }
}

- (BOOL)setPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  objc_super v9 = v8;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10000F840;
  v34 = sub_10000F770;
  id v35 = 0;
  if (!v8)
  {
    uint64_t v20 = +[NSError errorWithDomain:AKPrivateEmailErrorDomain code:-6003 userInfo:0];
    goto LABEL_9;
  }
  v10 = [v8 key];
  if (!v10
    || ([v9 privateEmailAddress],
        v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = v11 == 0,
        v11,
        v10,
        v12))
  {
    uint64_t v20 = +[NSError errorWithDomain:AKPrivateEmailErrorDomain code:-6002 userInfo:0];
LABEL_9:
    objc_super v13 = (void *)v31[5];
    v31[5] = v20;
    goto LABEL_10;
  }
  objc_super v13 = [v9 key];
  if (!a4)
  {
    uint64_t v14 = [(AKPrivateEmailStoreManager *)self _hashKeyIfNecessary:v13];

    objc_super v13 = (void *)v14;
  }
  v40[0] = v13;
  v15 = [v9 privateEmailAddress];
  v40[1] = v15;
  v16 = +[NSArray arrayWithObjects:v40 count:2];

  v17 = +[AKSQLiteQuery queryWithString:@"INSERT OR REPLACE INTO emails (client_key, email) VALUES (?, ?)"];
  v18 = (id *)(v31 + 5);
  id obj = (id)v31[5];
  [v17 bindParameters:v16 error:&obj];
  objc_storeStrong(v18, obj);
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100013994;
  v23[3] = &unk_100226D58;
  objc_copyWeak(&v27, &location);
  id v19 = v17;
  id v24 = v19;
  v25 = &v30;
  v26 = &v36;
  +[AKSQLiteExecutor performBlockAndWait:v23];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

LABEL_10:
  if (a5) {
    *a5 = (id) v31[5];
  }
  BOOL v21 = *((unsigned char *)v37 + 24) != 0;
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v21;
}

- (BOOL)removePrivateEmailForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000F840;
  v26 = sub_10000F770;
  id v27 = 0;
  id v7 = [v6 key];
  if (v7)
  {
    if (([v6 keyAndBundleIdAreHashed] & 1) == 0)
    {
      uint64_t v8 = [(AKPrivateEmailStoreManager *)self _hashKeyIfNecessary:v7];

      id v7 = (void *)v8;
    }
    objc_super v9 = +[AKSQLiteQuery queryWithString:@"DELETE FROM emails WHERE email = (SELECT email FROM emails WHERE client_key = ?)"];
    v10 = (id *)(v23 + 5);
    id obj = (id)v23[5];
    [v9 bindParameter:v7 error:&obj];
    objc_storeStrong(v10, obj);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100013C98;
    v15[3] = &unk_100226D58;
    objc_copyWeak(&v19, &location);
    id v11 = v9;
    id v16 = v11;
    v17 = &v22;
    v18 = &v28;
    +[AKSQLiteExecutor performBlockAndWait:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:AKPrivateEmailErrorDomain code:-6002 userInfo:0];
    id v7 = (void *)v23[5];
    v23[5] = v12;
  }

  if (a4) {
    *a4 = (id) v23[5];
  }
  char v13 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v13;
}

- (id)emailForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && ([v6 key], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    objc_super v9 = [v7 key];
    id v10 = [v9 copy];

    if (([v7 keyAndBundleIdAreHashed] & 1) == 0)
    {
      uint64_t v11 = [(AKPrivateEmailStoreManager *)self _hashKeyIfNecessary:v10];

      id v10 = (id)v11;
    }
    uint64_t v38 = 0;
    char v39 = (id *)&v38;
    uint64_t v40 = 0x3032000000;
    v41 = sub_10000F840;
    v42 = sub_10000F770;
    id v43 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = sub_10000F840;
    uint64_t v36 = sub_10000F770;
    id v37 = 0;
    uint64_t v12 = +[AKSQLiteQuery queryWithString:@"SELECT email FROM emails WHERE client_key=?"];
    char v13 = v39;
    id obj = v39[5];
    [v12 bindParameter:v10 error:&obj];
    objc_storeStrong(v13 + 5, obj);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000140C0;
    v30[3] = &unk_100226D80;
    v30[4] = &v32;
    [v12 setRowHandler:v30];
    objc_initWeak(&location, self);
    uint64_t v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_100014118;
    v25 = &unk_100226DA8;
    objc_copyWeak(&v28, &location);
    id v14 = v12;
    id v26 = v14;
    id v27 = &v38;
    +[AKSQLiteExecutor performBlockAndWait:&v22];
    if (v33[5])
    {
      id v15 = objc_alloc((Class)AKPrivateEmail);
      id v16 = objc_msgSend(v15, "initWithAddress:forKey:", v33[5], v10, v22, v23, v24, v25);
    }
    else
    {
      id v18 = v39[5];
      if (v18)
      {
        id v19 = v18;
        id v16 = 0;
        *a4 = v19;
      }
      else
      {
        +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AKPrivateEmailErrorDomain, -6003, 0, v22, v23, v24, v25);
        id v20 = objc_claimAutoreleasedReturnValue();
        *a4 = v20;

        id v16 = 0;
      }
    }
    id v17 = v16;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    +[NSError errorWithDomain:AKPrivateEmailErrorDomain code:-6002 userInfo:0];
    id v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_hashKeyIfNecessary:(id)a3
{
  id v4 = a3;
  signed int v5 = [(AKPrivateEmailStoreManager *)self currentProtocolVersion];
  if (v5 >= AKPrivateEmailProtocolVersion2)
  {
    id v7 = _AKLogHme();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10017ABD4(v7);
    }

    id v6 = +[AKStoreUtils hash:v4];
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v8 = v6;

  return v8;
}

- (id)currentEmailListVersion
{
  v3 = +[AKSQLiteQuery queryWithString:@"SELECT privateEmailListVersion FROM version"];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10000F840;
  v19[4] = sub_10000F770;
  id v20 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000F840;
  id v17 = sub_10000F770;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100014468;
  v12[3] = &unk_100226D80;
  v12[4] = &v13;
  [v3 setRowHandler:v12];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000144C0;
  v7[3] = &unk_100226DA8;
  objc_copyWeak(&v10, &location);
  id v4 = v3;
  id v8 = v4;
  objc_super v9 = v19;
  +[AKSQLiteExecutor performBlockAndWait:v7];
  id v5 = (id)v14[5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);

  return v5;
}

- (BOOL)setCurrentEmailListVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10000F840;
  uint64_t v24 = sub_10000F770;
  id v25 = 0;
  if (v6)
  {
    id v7 = +[AKSQLiteQuery queryWithString:@"UPDATE version SET privateEmailListVersion = ?"];
    id v8 = (id *)(v21 + 5);
    id obj = (id)v21[5];
    [v7 bindParameter:v6 error:&obj];
    objc_storeStrong(v8, obj);
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100014770;
    v13[3] = &unk_100226D58;
    objc_copyWeak(&v17, &location);
    id v9 = v7;
    id v14 = v9;
    uint64_t v15 = &v20;
    id v16 = &v26;
    +[AKSQLiteExecutor performBlockAndWait:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = +[NSError errorWithDomain:AKPrivateEmailErrorDomain code:-6002 userInfo:0];
    id v9 = (id)v21[5];
    v21[5] = v10;
  }

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v11 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v11;
}

- (BOOL)commitChangesToCacheWithInformation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 privateEmailListVersion];

  if (!v7)
  {
    uint64_t v23 = _AKLogHme();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10017AC18((uint64_t)v6, v23);
    }

    BOOL v24 = 0;
    id v15 = 0;
    if (a4) {
      goto LABEL_47;
    }
    goto LABEL_48;
  }
  v52 = a4;
  signed int v8 = [v6 protocolVersion];
  signed int v60 = AKPrivateEmailProtocolVersion2;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v9 = [v6 addedPrivateEmails];
  id v10 = [v9 countByEnumeratingWithState:&v69 objects:v78 count:16];
  char v11 = &off_1001B7000;
  uint64_t v12 = &off_1001B7000;
  uint64_t v13 = self;
  v53 = v6;
  if (!v10)
  {

    id v15 = 0;
    char v17 = 1;
    goto LABEL_22;
  }
  id v14 = v10;
  id obj = v9;
  id v15 = 0;
  uint64_t v16 = *(void *)v70;
  char v17 = 1;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v70 != v16) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      uint64_t v20 = _AKLogHme();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Added:%@", buf, 0xCu);
      }

      id v68 = 0;
      [(AKPrivateEmailStoreManager *)v13 setPrivateEmail:v19 keyAlreadyHashed:v8 >= v60 error:&v68];
      id v15 = v68;
      if (v15)
      {
        BOOL v21 = _AKLogHme();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = [v19 key];
          *(_DWORD *)buf = 138412546;
          v75 = v22;
          __int16 v76 = 2112;
          id v77 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to persist private email with key:%@ error: %@", buf, 0x16u);
        }
        char v17 = 0;
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
  }
  while (v14);

  id v6 = v53;
  self = v13;
  uint64_t v12 = &off_1001B7000;
  char v11 = &off_1001B7000;
  if (v17)
  {
LABEL_22:
    char v57 = v17;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v56 = [v6 removedPrivateEmails];
    id v25 = [v56 countByEnumeratingWithState:&v64 objects:v73 count:16];
    if (v25)
    {
      id v26 = v25;
      id obja = *(id *)v65;
      int v55 = *((void *)v11 + 505);
      int v54 = *((void *)v12 + 507);
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(id *)v65 != obja) {
            objc_enumerationMutation(v56);
          }
          uint64_t v28 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
          char v29 = _AKLogHme();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v55;
            v75 = v28;
            _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Remove:%@", buf, 0xCu);
          }

          uint64_t v30 = [v28 key];

          id v31 = objc_alloc((Class)AKPrivateEmailContext);
          uint64_t v32 = [v28 key];
          v33 = [v28 clientAppBundleId];
          id v34 = [v31 initWithKey:v32 altDSID:&stru_100233250 clientAppBundleId:v33];

          [v34 setKeyAndBundleIdAreHashed:v8 >= v60];
          id v63 = 0;
          self = v13;
          [(AKPrivateEmailStoreManager *)v13 removePrivateEmailForContext:v34 error:&v63];
          id v15 = v63;
          if (v15)
          {
            id v35 = _AKLogHme();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v54;
              v75 = v30;
              __int16 v76 = 2112;
              id v77 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to remove private email with key:%@ error: %@", buf, 0x16u);
            }

            char v57 = 0;
          }
        }
        id v26 = [v56 countByEnumeratingWithState:&v64 objects:v73 count:16];
      }
      while (v26);
    }

    char v17 = v57;
    if ((v57 & 1) == 0)
    {
      id v6 = v53;
      goto LABEL_46;
    }

    id v6 = v53;
    uint64_t v36 = [v53 privateEmailListVersion];
    id v62 = 0;
    [(AKPrivateEmailStoreManager *)self setCurrentEmailListVersion:v36 error:&v62];
    id v15 = v62;

    if (v15)
    {
      id v37 = _AKLogHme();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10017ACFC((uint64_t)v15, v37, v38, v39, v40, v41, v42, v43);
      }
    }
    else
    {
      signed int v44 = [v53 protocolVersion];
      if (v44 <= AKPrivateEmailInitialProtocolVersion)
      {
        id v15 = 0;
        goto LABEL_46;
      }
      id v61 = 0;
      -[AKPrivateEmailStoreManager setProtocolVersion:error:](self, "setProtocolVersion:error:", [v53 protocolVersion], &v61);
      id v15 = v61;
      if (!v15) {
        goto LABEL_46;
      }
      id v37 = _AKLogHme();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10017AC90((uint64_t)v15, v37, v45, v46, v47, v48, v49, v50);
      }
    }

    char v17 = 0;
  }
LABEL_46:
  BOOL v24 = v17 & 1;
  a4 = v52;
  if (v52) {
LABEL_47:
  }
    *a4 = v15;
LABEL_48:

  return v24;
}

- (int)currentProtocolVersion
{
  v3 = +[AKSQLiteQuery queryWithString:@"SELECT protocol_version FROM version"];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10000F840;
  v21[4] = sub_10000F770;
  id v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10000F840;
  id v19 = sub_10000F770;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100015050;
  v14[3] = &unk_100226D80;
  v14[4] = &v15;
  [v3 setRowHandler:v14];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000150A8;
  v9[3] = &unk_100226DA8;
  objc_copyWeak(&v12, &location);
  id v4 = v3;
  id v10 = v4;
  char v11 = v21;
  +[AKSQLiteExecutor performBlockAndWait:v9];
  int v5 = AKPrivateEmailInitialProtocolVersion;
  id v6 = (void *)v16[5];
  if (v6)
  {
    signed int v7 = [v6 intValue];
    if (v7 > v5) {
      int v5 = v7;
    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(v21, 8);
  return v5;
}

- (BOOL)setProtocolVersion:(int)a3 error:(id *)a4
{
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10000F840;
  BOOL v24 = sub_10000F770;
  id v25 = 0;
  signed int v7 = +[AKSQLiteQuery queryWithString:@"UPDATE version SET protocol_version = ?"];
  signed int v8 = +[NSNumber numberWithInteger:a3];
  id v9 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  [v7 bindParameter:v8 error:&obj];
  objc_storeStrong(v9, obj);

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100015334;
  v13[3] = &unk_100226D58;
  objc_copyWeak(&v17, &location);
  id v10 = v7;
  id v14 = v10;
  uint64_t v15 = &v20;
  uint64_t v16 = &v26;
  +[AKSQLiteExecutor performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v11 = *((unsigned char *)v27 + 24);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v11;
}

- (id)fetchAllPrivateEmailsWithError:(id *)a3
{
  id v4 = +[AKSQLiteQuery queryWithString:@"SELECT email, client_key FROM emails"];
  uint64_t v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = sub_10000F840;
  v24[3] = sub_10000F770;
  id v25 = 0;
  +[NSMutableArray array];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100015610;
  v21[3] = &unk_100226DD0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v5;
  [v4 setRowHandler:v21];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000156C4;
  v16[3] = &unk_100226DA8;
  objc_copyWeak(&v19, &location);
  id v6 = v4;
  id v17 = v6;
  id v18 = &v23;
  +[AKSQLiteExecutor performBlockAndWait:v16];
  if (*(void *)(v24[0] + 40))
  {
    signed int v7 = _AKLogHme();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10017AD68((uint64_t)v24, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  id v14 = [v5 copy];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);

  return v14;
}

- (AKSQLiteExecutor)executor
{
  return self->_executor;
}

- (void)setExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end