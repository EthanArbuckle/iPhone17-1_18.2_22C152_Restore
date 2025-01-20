@interface InAppReceiptDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation InAppReceiptDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc_init(SQLiteDatabaseStoreDescriptor);
  [(SQLiteDatabaseStoreDescriptor *)v2 setSchemaName:@"storekit_receipts"];
  [(SQLiteDatabaseStoreDescriptor *)v2 setSessionClass:objc_opt_class()];
  [(SQLiteDatabaseStoreDescriptor *)v2 setTransactionClass:objc_opt_class()];

  return v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v4 = a3;
  *(void *)&long long v5 = 138543874;
  long long v20 = v5;
  do
  {
    uint64_t v6 = (uint64_t)objc_msgSend(v4, "currentSchemaVersion", v20);
    if (v6 > 17999) {
      break;
    }
    uint64_t v7 = (uint64_t)[v4 currentSchemaVersion];
    uint64_t v8 = v7;
    if (v7 <= 15004)
    {
      if ((unint64_t)(v7 - 15000) >= 5 && v7)
      {
LABEL_28:
        if (qword_10039FE48 != -1) {
          dispatch_once(&qword_10039FE48, &stru_100359698);
        }
        v18 = qword_10039FE00;
        if (os_log_type_enabled((os_log_t)qword_10039FE00, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          id v22 = a1;
          __int16 v23 = 2048;
          uint64_t v24 = v8;
          __int16 v25 = 2048;
          uint64_t v26 = 18000;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: No StoreKit In App Receipt Database migration function for %li => %li", buf, 0x20u);
        }
        unsigned int v12 = 0;
        goto LABEL_7;
      }
      v9 = v4;
      uint64_t v10 = 16200;
      v11 = &stru_100359598;
      goto LABEL_6;
    }
    if (v7 <= 16000)
    {
      switch(v7)
      {
        case 15005:
          v9 = v4;
          uint64_t v10 = 15400;
          v11 = &stru_1003595B8;
          break;
        case 15400:
          v9 = v4;
          uint64_t v10 = 16000;
          v11 = &stru_100359618;
          break;
        case 16000:
          v9 = v4;
          uint64_t v10 = 16001;
          v11 = &stru_100359638;
          break;
        default:
          goto LABEL_28;
      }
      goto LABEL_6;
    }
    if (v7 == 16001)
    {
      v9 = v4;
      uint64_t v10 = 16200;
      v11 = &stru_100359658;
LABEL_6:
      unsigned int v12 = [v9 migrateToVersion:v10 usingBlock:v11];
      goto LABEL_7;
    }
    if (v7 == 16200)
    {
      v9 = v4;
      uint64_t v10 = 18000;
      v11 = &stru_100359678;
      goto LABEL_6;
    }
    if (v7 != 18000) {
      goto LABEL_28;
    }
    unsigned int v12 = 1;
LABEL_7:
    if (qword_10039FE48 != -1) {
      dispatch_once(&qword_10039FE48, &stru_100359698);
    }
    v13 = (void *)qword_10039FE00;
    if (v12) {
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    }
    if (os_log_type_enabled((os_log_t)qword_10039FE00, v14))
    {
      v15 = v13;
      id v16 = [v4 currentSchemaVersion];
      *(_DWORD *)buf = 138544130;
      CFStringRef v17 = @"FAIL";
      if (v12) {
        CFStringRef v17 = @"SUCCESS";
      }
      id v22 = a1;
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = (uint64_t)v16;
      __int16 v27 = 2114;
      CFStringRef v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, v14, "[%{public}@]: Transaction database migration from %li => %li %{public}@", buf, 0x2Au);
    }
  }
  while ((v12 & 1) != 0);

  return v6 > 17999;
}

@end