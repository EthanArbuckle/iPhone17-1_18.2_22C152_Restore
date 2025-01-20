@interface DiskSpaceManager
+ (BOOL)ensureAvailableDiskSpace:(int64_t)a3 atPath:(id)a4;
+ (int64_t)availableDiskSpaceAtPath:(id)a3;
+ (int64_t)recoverableDiskSpaceAtPath:(id)a3;
@end

@implementation DiskSpaceManager

+ (int64_t)availableDiskSpaceAtPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  if (([v4 fileExistsAtPath:v3] & 1) == 0)
  {
    uint64_t v5 = [v3 stringByDeletingLastPathComponent];

    id v3 = (id)v5;
  }
  id v17 = 0;
  v6 = [v4 attributesOfFileSystemForPath:v3 error:&v17];
  id v7 = v17;
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v12 = [v6 objectForKey:NSFileSystemFreeSize];
    int64_t v11 = (int64_t)[v12 unsignedLongLongValue];
  }
  else
  {
    if (qword_10039F9F0 != -1) {
      dispatch_once(&qword_10039F9F0, &stru_100358700);
    }
    v10 = (void *)qword_10039F9A8;
    if (os_log_type_enabled((os_log_t)qword_10039F9A8, OS_LOG_TYPE_ERROR))
    {
      v14 = v10;
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v19 = v15;
      __int16 v20 = 2114;
      id v21 = v3;
      __int16 v22 = 2114;
      v23 = v8;
      id v16 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] availableSpaceOnDiskAtPath:%{public}@ failed: %{public}@", buf, 0x20u);
    }
    int64_t v11 = -1;
  }

  return v11;
}

+ (BOOL)ensureAvailableDiskSpace:(int64_t)a3 atPath:(id)a4
{
  id v6 = a4;
  id v7 = [a1 availableDiskSpaceAtPath:v6];
  if ((uint64_t)v7 < a3)
  {
    id v8 = v7;
    if (qword_10039F9F0 != -1) {
      dispatch_once(&qword_10039F9F0, &stru_100358700);
    }
    BOOL v9 = (void *)qword_10039F9A8;
    if (os_log_type_enabled((os_log_t)qword_10039F9A8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)buf = 138543874;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2048;
      v39 = v8;
      __int16 v40 = 2048;
      int64_t v41 = a3;
      id v11 = v37;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Free space (%lld) is less than required (%lld). Checking cache delete.", buf, 0x20u);
    }
    v35[0] = v6;
    v34[0] = @"CACHE_DELETE_VOLUME";
    v34[1] = @"CACHE_DELETE_AMOUNT";
    v12 = +[NSNumber numberWithLongLong:a3];
    v34[2] = @"CACHE_DELETE_URGENCY";
    v35[1] = v12;
    v35[2] = &off_100373AA0;
    v13 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];

    v14 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
    v15 = [v14 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    if ((uint64_t)v8 + (uint64_t)[v15 longLongValue] < a3)
    {
      if (qword_10039F9F0 != -1) {
        dispatch_once(&qword_10039F9F0, &stru_100358700);
      }
      id v16 = (void *)qword_10039F9A8;
      if (os_log_type_enabled((os_log_t)qword_10039F9A8, OS_LOG_TYPE_ERROR)) {
        sub_1002C2FAC(v16, (uint64_t)a1, (uint64_t)v15);
      }
      BOOL v17 = 0;
      goto LABEL_30;
    }
    if (qword_10039F9F0 != -1) {
      dispatch_once(&qword_10039F9F0, &stru_100358700);
    }
    v18 = (void *)qword_10039F9A8;
    if (os_log_type_enabled((os_log_t)qword_10039F9A8, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      __int16 v20 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v37 = v20;
      __int16 v38 = 2114;
      v39 = v15;
      id v21 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cache delete has %{public}@ recoverable bytes", buf, 0x16u);
    }
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    id v33 = v14;
    v23 = v22;
    CacheDeletePurgeSpaceWithInfo();
    dispatch_time_t v24 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v23, v24) >= 1)
    {
      if (qword_10039F9F0 != -1) {
        dispatch_once(&qword_10039F9F0, &stru_100358700);
      }
      v25 = (void *)qword_10039F9A8;
      if (os_log_type_enabled((os_log_t)qword_10039F9A8, OS_LOG_TYPE_ERROR)) {
        sub_1002C306C(v25);
      }
      id v26 = [a1 availableDiskSpaceAtPath:v6];
      if ((uint64_t)v26 <= a3)
      {
        BOOL v17 = 0;
        goto LABEL_29;
      }
      id v27 = v26;
      if (qword_10039F9F0 != -1) {
        dispatch_once(&qword_10039F9F0, &stru_100358700);
      }
      v28 = (void *)qword_10039F9A8;
      if (os_log_type_enabled((os_log_t)qword_10039F9A8, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v37 = v30;
        __int16 v38 = 2048;
        v39 = v27;
        id v31 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enough space was recovered to proceed (now available: %lld)", buf, 0x16u);
      }
    }
    BOOL v17 = 1;
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  BOOL v17 = 1;
LABEL_31:

  return v17;
}

+ (int64_t)recoverableDiskSpaceAtPath:(id)a3
{
  v9[0] = @"CACHE_DELETE_VOLUME";
  v9[1] = @"CACHE_DELETE_URGENCY";
  v10[0] = a3;
  v10[1] = &off_100373AA0;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  uint64_t v5 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  id v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  id v7 = [v6 unsignedLongLongValue];

  return (int64_t)v7;
}

@end