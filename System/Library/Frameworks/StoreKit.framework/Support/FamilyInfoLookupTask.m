@interface FamilyInfoLookupTask
+ (id)_cachedFamilyInfoLookupResultForAccount:(id)a3 ignoreCacheTimeout:(BOOL)a4 logKey:(id)a5;
+ (id)_currentCachedFamilyInfoWithLogKey:(id)a3;
+ (id)_pathForCachedFamilyInfoLookupResult;
+ (id)_processURLResult:(id)a3;
+ (id)cachedFamilyInfoWithLogKey:(id)a3;
- (AMSBagProtocol)bag;
- (BOOL)suppressDialogs;
- (FamilyInfoLookupTask)initWithBag:(id)a3;
- (NSString)logKey;
- (id)_performFamilyInfoRequestForAccount:(id)a3 error:(id *)a4;
- (id)performFamilyInfoLookup;
- (void)_cacheFamilyInfoLookupResult:(id)a3 forAccount:(id)a4;
- (void)setBag:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setSuppressDialogs:(BOOL)a3;
@end

@implementation FamilyInfoLookupTask

- (FamilyInfoLookupTask)initWithBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FamilyInfoLookupTask;
  v6 = [(FamilyInfoLookupTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

+ (id)cachedFamilyInfoWithLogKey:(id)a3
{
  id v4 = a3;
  id v5 = +[ACAccountStore ams_sharedAccountStore];
  v6 = objc_msgSend(v5, "ams_activeiTunesAccount");

  if (v6)
  {
    v7 = [a1 _cachedFamilyInfoLookupResultForAccount:v6 ignoreCacheTimeout:1 logKey:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)performFamilyInfoLookup
{
  v3 = [(FamilyInfoLookupTask *)self logKey];

  if (!v3)
  {
    id v4 = +[NSUUID lib_shortLogKey];
    logKey = self->_logKey;
    self->_logKey = v4;
  }
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006BC84;
  v8[3] = &unk_100359790;
  objc_copyWeak(&v9, &location);
  v6 = [(FamilyInfoLookupTask *)self performTaskWithBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_performFamilyInfoRequestForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(FamilyInfoLookupTask *)self bag];
  v8 = [v7 URLForKey:@"family-info"];
  id v26 = 0;
  id v9 = [v8 valueWithError:&v26];
  id v10 = v26;

  if (!v9)
  {
    if (qword_10039FF38 != -1) {
      dispatch_once(&qword_10039FF38, &stru_1003597B0);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_ERROR))
    {
      sub_1002C6DE0();
      if (a4) {
        goto LABEL_11;
      }
    }
    else if (a4)
    {
LABEL_11:
      ASDErrorWithUnderlyingError();
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v17 = 0;
    goto LABEL_14;
  }
  id v11 = objc_alloc_init((Class)AMSURLRequestEncoder);
  [v11 setAccount:v6];
  v12 = [(FamilyInfoLookupTask *)self bag];
  [v11 setBag:v12];

  if ([(FamilyInfoLookupTask *)self suppressDialogs]) {
    [v11 setDialogOptions:1];
  }
  v13 = [(FamilyInfoLookupTask *)self logKey];
  [v11 setLogUUID:v13];

  v14 = [v11 requestWithMethod:2 URL:v9 parameters:0];
  id v25 = 0;
  v15 = [v14 resultWithError:&v25];
  id v16 = v25;

  if (v16)
  {
    v17 = 0;
    if (a4) {
      *a4 = v16;
    }
  }
  else
  {
    id v18 = objc_alloc_init((Class)AMSPromise);
    v19 = +[AMSURLSession defaultSession];
    v20 = [v18 completionHandlerAdapter];
    [v19 dataTaskWithRequest:v15 completionHandler:v20];
    id v24 = v6;
    v22 = id v21 = v10;

    [v22 resume];
    v17 = [v18 resultWithError:a4];

    id v10 = v21;
    id v6 = v24;
  }
LABEL_14:

  return v17;
}

+ (id)_processURLResult:(id)a3
{
  if (a3)
  {
    v3 = [a3 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }

    if (v4) {
      id v5 = [[FamilyInfoLookupResult alloc] initWithDictionaryRepresentation:v4 cached:0];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_cacheFamilyInfoLookupResult:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[FamilyInfoLookupTask _pathForCachedFamilyInfoLookupResult];
  if (v8)
  {
    id v9 = objc_msgSend(v7, "ams_DSID");

    if (v9)
    {
      v31[0] = @"account";
      id v10 = objc_msgSend(v7, "ams_DSID");
      v32[0] = v10;
      v31[1] = @"circle";
      id v11 = [v6 dictionaryRepresentation];
      v32[1] = v11;
      v31[2] = @"timestamp";
      v12 = +[NSDate date];
      v32[2] = v12;
      v13 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
      id v30 = 0;
      v14 = +[NSPropertyListSerialization dataWithPropertyList:v13 format:200 options:0 error:&v30];
      id v15 = v30;

      if (v14)
      {
        id v29 = v15;
        unsigned __int8 v16 = [v14 writeToFile:v8 options:1 error:&v29];
        id v17 = v29;

        if (v16)
        {
          if (qword_10039FF38 != -1) {
            dispatch_once(&qword_10039FF38, &stru_1003597B0);
          }
          id v18 = (void *)qword_10039FEF0;
          if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v18;
            uint64_t v20 = objc_opt_class();
            id v21 = [(FamilyInfoLookupTask *)self logKey];
            *(_DWORD *)buf = 138543874;
            uint64_t v34 = v20;
            __int16 v35 = 2114;
            v36 = v21;
            __int16 v37 = 2114;
            v38 = v8;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Wrote the serialized family info to: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          if (qword_10039FF38 != -1) {
            dispatch_once(&qword_10039FF38, &stru_1003597B0);
          }
          if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_ERROR)) {
            sub_1002C6F34();
          }
        }
        id v15 = v17;
      }
      else
      {
        if (qword_10039FF38 != -1) {
          dispatch_once(&qword_10039FF38, &stru_1003597B0);
        }
        if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_ERROR)) {
          sub_1002C6E80();
        }
      }

      goto LABEL_28;
    }
    if (qword_10039FF38 != -1) {
      dispatch_once(&qword_10039FF38, &stru_1003597B0);
    }
    id v26 = (void *)qword_10039FEF0;
    if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v26;
      uint64_t v27 = objc_opt_class();
      id v25 = [(FamilyInfoLookupTask *)self logKey];
      v28 = [v7 hashedDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v27;
      __int16 v35 = 2114;
      v36 = v25;
      __int16 v37 = 2114;
      v38 = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Unable to cache a family info lookup because the given account has no DSID. account = %{public}@", buf, 0x20u);

      goto LABEL_17;
    }
  }
  else
  {
    if (qword_10039FF38 != -1) {
      dispatch_once(&qword_10039FF38, &stru_1003597B0);
    }
    v22 = (void *)qword_10039FEF0;
    if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      uint64_t v24 = objc_opt_class();
      id v25 = [(FamilyInfoLookupTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v24;
      __int16 v35 = 2114;
      v36 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Unable to generate the path in order to cache a family info lookup.", buf, 0x16u);
LABEL_17:
    }
  }
LABEL_28:
}

+ (id)_cachedFamilyInfoLookupResultForAccount:(id)a3 ignoreCacheTimeout:(BOOL)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_msgSend(v8, "ams_DSID");

  if (v10)
  {
    id v11 = [a1 _currentCachedFamilyInfoWithLogKey:v9];
    v12 = v11;
    if (!v11)
    {
      id v18 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v13 = [v11 objectForKeyedSubscript:@"account"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    v19 = objc_msgSend(v8, "ams_DSID");
    unsigned __int8 v20 = [v14 isEqualToNumber:v19];

    if (v20)
    {
      if (a4)
      {
LABEL_25:
        v28 = [FamilyInfoLookupResult alloc];
        id v29 = [v12 objectForKeyedSubscript:@"circle"];
        id v18 = [(FamilyInfoLookupResult *)v28 initWithDictionaryRepresentation:v29 cached:1];

LABEL_32:
        goto LABEL_33;
      }
      id v21 = [v12 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }

      if (v22)
      {
        id v25 = +[NSDate date];
        [v25 timeIntervalSinceDate:v22];
        double v27 = v26;

        if (v27 > 2.22044605e-16 && v27 < 604800.0)
        {

          goto LABEL_25;
        }
      }
      if (qword_10039FF38 != -1) {
        dispatch_once(&qword_10039FF38, &stru_1003597B0);
      }
      id v30 = (void *)qword_10039FEF0;
      if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        int v34 = 138543618;
        id v35 = (id)objc_opt_class();
        __int16 v36 = 2114;
        id v37 = v9;
        id v32 = v35;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] We have cached family info for the account, but it's too old to return.", (uint8_t *)&v34, 0x16u);
      }
    }
    else
    {
      if (qword_10039FF38 != -1) {
        dispatch_once(&qword_10039FF38, &stru_1003597B0);
      }
      v23 = (void *)qword_10039FEF0;
      if (!os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      v22 = v23;
      int v34 = 138543618;
      id v35 = (id)objc_opt_class();
      __int16 v36 = 2114;
      id v37 = v9;
      id v24 = v35;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Our cached family info isn't for the given account.", (uint8_t *)&v34, 0x16u);
    }
LABEL_31:
    id v18 = 0;
    goto LABEL_32;
  }
  if (qword_10039FF38 != -1) {
    dispatch_once(&qword_10039FF38, &stru_1003597B0);
  }
  id v15 = (void *)qword_10039FEF0;
  if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v16 = v15;
    int v34 = 138543618;
    id v35 = (id)objc_opt_class();
    __int16 v36 = 2114;
    id v37 = v9;
    id v17 = v35;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Unable to load cached family info because the account has no DSID. ", (uint8_t *)&v34, 0x16u);
  }
  id v18 = 0;
LABEL_34:

  return v18;
}

+ (id)_currentCachedFamilyInfoWithLogKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _pathForCachedFamilyInfoLookupResult];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSData) initWithContentsOfFile:v5];
    if (v6)
    {
      if (qword_10039FF38 != -1) {
        dispatch_once(&qword_10039FF38, &stru_1003597B0);
      }
      id v7 = (void *)qword_10039FEF0;
      if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = objc_opt_class();
        __int16 v19 = 2114;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Load cached FamilyInfo", buf, 0x16u);
      }
      id v16 = 0;
      id v9 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v16];
      id v10 = v16;
      objc_opt_class();
      id v11 = 0;
      if (objc_opt_isKindOfClass()) {
        id v11 = v9;
      }

      if (!v11)
      {
        if (qword_10039FF38 != -1) {
          dispatch_once(&qword_10039FF38, &stru_1003597B0);
        }
        v12 = (void *)qword_10039FEF0;
        if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_ERROR))
        {
          id v14 = v12;
          uint64_t v15 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v18 = v15;
          __int16 v19 = 2114;
          id v20 = v4;
          __int16 v21 = 2114;
          id v22 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] [%{public}@] Failed to deserialize the cached FamilyInfo. Error: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    if (qword_10039FF38 != -1) {
      dispatch_once(&qword_10039FF38, &stru_1003597B0);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FEF0, OS_LOG_TYPE_ERROR)) {
      sub_1002C6FE8();
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)_pathForCachedFamilyInfoLookupResult
{
  v2 = +[NSFileManager defaultManager];
  v3 = objc_msgSend(v2, "sk_persistedDataURL");
  id v4 = [v3 path];
  id v5 = [v4 stringByAppendingPathComponent:@"JFamilyCircle.plist"];

  return v5;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (BOOL)suppressDialogs
{
  return self->_suppressDialogs;
}

- (void)setSuppressDialogs:(BOOL)a3
{
  self->_suppressDialogs = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);

  objc_storeStrong((id *)&self->_logKey, 0);
}

@end