@interface StoreKitMessagesDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation StoreKitMessagesDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc_init(SQLiteDatabaseStoreDescriptor);
  [(SQLiteDatabaseStoreDescriptor *)v2 setSchemaName:@"storekit_messages"];
  [(SQLiteDatabaseStoreDescriptor *)v2 setSessionClass:objc_opt_class()];
  [(SQLiteDatabaseStoreDescriptor *)v2 setTransactionClass:objc_opt_class()];

  return v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 currentSchemaVersion] > 15999)
  {
LABEL_2:
    BOOL v6 = 1;
    goto LABEL_46;
  }
  *(void *)&long long v5 = 138544130;
  long long v27 = v5;
  while (1)
  {
    uint64_t v7 = (uint64_t)objc_msgSend(v4, "currentSchemaVersion", v27, *(_OWORD *)buf, *(void *)&buf[16], v29, v30);
    if (v7 <= 15199)
    {
      if (v7)
      {
        if (v7 != 13400)
        {
          if (v7 != 14000) {
            goto LABEL_41;
          }
          unsigned int v8 = [v4 migrateToVersion:15200 usingBlock:&stru_100358AF8];
          if (qword_10039FB90 != -1) {
            dispatch_once(&qword_10039FB90, &stru_100358B80);
          }
          v9 = (void *)qword_10039FB50;
          if (!os_log_type_enabled((os_log_t)qword_10039FB50, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          v10 = v9;
          id v11 = [v4 currentSchemaVersion];
          *(_DWORD *)buf = v27;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v29 = 15200;
          LOWORD(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 2) = v8;
          v12 = v10;
          v13 = "[%{public}@]: Messages database migration function for %li => %li success=%d";
          goto LABEL_31;
        }
        unsigned int v8 = [v4 migrateToVersion:14000 usingBlock:&stru_100358AD8];
        if (qword_10039FB90 != -1) {
          dispatch_once(&qword_10039FB90, &stru_100358B80);
        }
        v16 = (void *)qword_10039FB50;
        if (os_log_type_enabled((os_log_t)qword_10039FB50, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v16;
          id v17 = [v4 currentSchemaVersion];
          *(_DWORD *)buf = v27;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v29 = 14000;
          LOWORD(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 2) = v8;
          v12 = v10;
          v13 = "[%{public}@]: Messages database migration function for %li => %li success=%d";
          goto LABEL_31;
        }
      }
      else
      {
        unsigned int v8 = [v4 migrateToVersion:16000 usingBlock:&stru_100358AB8];
        if (qword_10039FB90 != -1) {
          dispatch_once(&qword_10039FB90, &stru_100358B80);
        }
        v14 = (void *)qword_10039FB50;
        if (os_log_type_enabled((os_log_t)qword_10039FB50, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v14;
          id v15 = [v4 currentSchemaVersion];
          *(_DWORD *)buf = v27;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v29 = 16000;
          LOWORD(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 2) = v8;
          v12 = v10;
          v13 = "[%{public}@]: Messages database migration function for %li => %li success=%d";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x26u);
        }
      }
LABEL_32:
      if ((v8 & 1) == 0) {
        goto LABEL_45;
      }
      goto LABEL_33;
    }
    if (v7 == 15200)
    {
      if ([v4 column:@"allow_developer_control" existsInTable:@"storekit_messages"])v18 = &stru_100358B18; {
      else
      }
        v18 = &stru_100358AF8;
      unsigned int v8 = [v4 migrateToVersion:15400 usingBlock:v18];
      if (qword_10039FB90 != -1) {
        dispatch_once(&qword_10039FB90, &stru_100358B80);
      }
      v19 = (void *)qword_10039FB50;
      if (os_log_type_enabled((os_log_t)qword_10039FB50, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v19;
        id v20 = [v4 currentSchemaVersion];
        *(_DWORD *)buf = v27;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v29 = 15400;
        LOWORD(v30) = 1024;
        *(_DWORD *)((char *)&v30 + 2) = v8;
        v12 = v10;
        v13 = "[%{public}@]: Database migration function for %li => %li success=%d";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (v7 != 15400) {
      break;
    }
    unsigned int v21 = [v4 migrateToVersion:16000 usingBlock:&stru_100358B38];
    if (qword_10039FB90 != -1) {
      dispatch_once(&qword_10039FB90, &stru_100358B80);
    }
    v22 = (void *)qword_10039FB50;
    if (os_log_type_enabled((os_log_t)qword_10039FB50, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      id v24 = [v4 currentSchemaVersion];
      *(_DWORD *)buf = v27;
      *(void *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v29 = 16000;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Database migration function for %li => %li success=%d", buf, 0x26u);
    }
    if (!v21) {
      goto LABEL_45;
    }
LABEL_33:
    if ((uint64_t)[v4 currentSchemaVersion] > 15999) {
      goto LABEL_2;
    }
  }
  if (v7 == 16000) {
    goto LABEL_33;
  }
LABEL_41:
  if (qword_10039FB90 != -1) {
    dispatch_once(&qword_10039FB90, &stru_100358B80);
  }
  v25 = (void *)qword_10039FB50;
  if (os_log_type_enabled((os_log_t)qword_10039FB50, OS_LOG_TYPE_ERROR)) {
    sub_1002C3FF0(v25, v4);
  }
LABEL_45:
  BOOL v6 = 0;
LABEL_46:

  return v6;
}

@end