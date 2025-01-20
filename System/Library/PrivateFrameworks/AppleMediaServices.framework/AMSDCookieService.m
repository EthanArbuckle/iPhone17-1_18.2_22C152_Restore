@interface AMSDCookieService
+ (AMSDCookieService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDCookieService)init;
- (AMSLRUCache)altDSIDHashCache;
- (AMSLRUCache)cookieDatabaseCache;
- (AMSLRUCache)cookiePropertyCache;
- (AMSLRUCache)dsidHashCache;
- (OS_dispatch_queue)queue;
- (id)_alliTunesAccountIdentifiers;
- (id)_cachedCookieDatabaseForPath:(id)a3;
- (id)_cachedCookiePropertiesForIdentifier:(id)a3;
- (id)_cookieDatabaseForAccount:(id)a3 error:(id *)a4;
- (id)_uniqueIdentifiersForAccount:(id)a3 error:(id *)a4;
- (id)clearDanglingCookieDatabases;
- (id)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5;
- (void)_cacheCookieDatabase:(id)a3 withPath:(id)a4;
- (void)_cacheCookieProperties:(id)a3 forIdentifier:(id)a4;
- (void)_clearAllCachedCookieProperties;
- (void)clearAllCachedCookieProperties;
- (void)clearDanglingCookieDatabasesWithCompletion:(id)a3;
- (void)getCookieDatabasePathForAccount:(id)a3 withCompletion:(id)a4;
- (void)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 withCompletion:(id)a5;
- (void)getCookiePropertiesForAccount:(id)a3 withCompletion:(id)a4;
- (void)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 forAccount:(id)a5 withCompletion:(id)a6;
@end

@implementation AMSDCookieService

- (void)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 forAccount:(id)a5 withCompletion:(id)a6
{
  id v26 = a3;
  id v27 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v12)
  {
    v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = objc_opt_class();
    v15 = AMSLogKey();
    v16 = (uint64_t (*)(uint64_t, uint64_t))[v26 count];
    id v17 = [v27 count];
    v18 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2048;
    v42 = v16;
    *(_WORD *)v43 = 2048;
    *(void *)&v43[2] = v17;
    *(_WORD *)&v43[10] = 2114;
    *(void *)&v43[12] = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Updating cookies with %lu to add and %lu to remove. account = %{public}@", buf, 0x34u);
  }
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v42 = sub_100015AAC;
  *(void *)v43 = sub_100015A54;
  *(void *)&v43[8] = 0;
  v19 = [(AMSDCookieService *)self queue];
  v20 = dispatch_get_global_queue(21, 0);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000C5D4;
  v32[3] = &unk_100112458;
  v32[4] = self;
  SEL v38 = a2;
  id v21 = v10;
  id v33 = v21;
  id v22 = v26;
  id v34 = v22;
  id v23 = v27;
  id v35 = v23;
  v36 = v39;
  v37 = buf;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100014C34;
  v28[3] = &unk_100112480;
  id v24 = v11;
  id v29 = v24;
  v30 = v39;
  v31 = buf;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDCookieService.updateCookies" withQueue:v19 postActionQueue:v20 whilePerformingBlockOnQueue:v32 postAction:v28];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v39, 8);
}

- (id)_cookieDatabaseForAccount:(id)a3 error:(id *)a4
{
  v5 = self;
  v6 = -[AMSDCookieService _uniqueIdentifiersForAccount:error:](self, "_uniqueIdentifiersForAccount:error:", a3);
  v7 = v6;
  if (v6 && [v6 count])
  {
    v8 = +[AMSCookieDatabase databasePathForIdentifiers:v7 error:a4];
    if (v8)
    {
      uint64_t v9 = [v5 _cachedCookieDatabaseForPath:v8];
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v11)
        {
          id v11 = +[AMSLogConfig sharedConfig];
        }
        v12 = [v11 OSLogObject];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = AMSLogKey();
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = v14;
          if (v13)
          {
            v5 = AMSLogKey();
            +[NSString stringWithFormat:@"%@: [%@] ", v15, v5];
          }
          else
          {
            +[NSString stringWithFormat:@"%@: ", v14];
          v16 = };
          id v17 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543618;
          v20 = v16;
          __int16 v21 = 2114;
          id v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Found cached cookie database. %{public}@", buf, 0x16u);
          if (v13)
          {

            v16 = v5;
          }
        }
      }
      else
      {
        id v10 = +[AMSCookieDatabase cookieDatabaseForIdentifiers:v7 error:a4];
        if (v10) {
          [v5 _cacheCookieDatabase:v10 withPath:v8];
        }
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_cachedCookieDatabaseForPath:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDCookieService *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    id v10 = AMSHashIfNeeded();
    int v14 = 138543874;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Retrieving cached cookie database. dbPath = %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v11 = [(AMSDCookieService *)self cookieDatabaseCache];
  v12 = [v11 objectForKey:v4];

  return v12;
}

- (AMSLRUCache)cookieDatabaseCache
{
  return self->_cookieDatabaseCache;
}

+ (AMSDCookieService)sharedService
{
  if (qword_100130280 != -1) {
    dispatch_once(&qword_100130280, &stru_100112340);
  }
  v2 = (void *)qword_100130288;
  return (AMSDCookieService *)v2;
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if ([v5 BOOLValue])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v7 = [v3 valueForEntitlement:@"com.apple.itunesstored.private"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    unsigned __int8 v6 = [v8 BOOLValue];
  }

  return v6;
}

- (void)_cacheCookieProperties:(id)a3 forIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(AMSDCookieService *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = AMSLogKey();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v12)
    {
      uint64_t v4 = AMSLogKey();
      +[NSString stringWithFormat:@"%@: [%@] ", v14, v4];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v13];
    uint64_t v15 = };
    __int16 v16 = AMSHashIfNeeded();
    id v17 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    v20 = v15;
    __int16 v21 = 2114;
    id v22 = v16;
    __int16 v23 = 2114;
    id v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Caching cookies. cookies = %{public}@ | accountIdentifier = %{public}@", buf, 0x20u);
    if (v12)
    {

      uint64_t v15 = (void *)v4;
    }
  }
  __int16 v18 = [(AMSDCookieService *)self cookiePropertyCache];
  [v18 setObject:v7 forKey:v8];
}

- (id)_cachedCookiePropertiesForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDCookieService *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v6)
  {
    unsigned __int8 v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    id v10 = AMSHashIfNeeded();
    int v14 = 138543874;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Retrieving cached cookies. accountIdentifier = %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v11 = [(AMSDCookieService *)self cookiePropertyCache];
  v12 = [v11 objectForKey:v4];

  return v12;
}

- (AMSLRUCache)cookiePropertyCache
{
  return self->_cookiePropertyCache;
}

- (void)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = objc_opt_class();
    int v14 = AMSLogKey();
    uint64_t v15 = AMSHashIfNeeded();
    __int16 v16 = (void *)v15;
    CFStringRef v17 = @"false";
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    if (v6) {
      CFStringRef v17 = @"true";
    }
    id v29 = v14;
    __int16 v30 = 2114;
    uint64_t v31 = v15;
    __int16 v32 = 2114;
    CFStringRef v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Getting cookies. account = %{public}@ | cookieDatabaseOnly = %{public}@", buf, 0x2Au);
  }
  __int16 v18 = [(AMSDCookieService *)self queue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014D04;
  v21[3] = &unk_100112430;
  v21[4] = self;
  id v22 = v9;
  BOOL v25 = v6;
  id v23 = v10;
  SEL v24 = a2;
  id v19 = v10;
  id v20 = v9;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDCookieService.getCookies" withQueue:v18 whilePerformingSyncBlock:v21];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_uniqueIdentifiersForAccount:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = &swift_willThrow_ptr;
  id v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = AMSLogKey();
    uint64_t v12 = objc_opt_class();
    if (v11)
    {
      uint64_t v13 = AMSLogKey();
      uint64_t v4 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: [%@] %@ ", v12, v13, v4];
    }
    else
    {
      uint64_t v13 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: %@ ", v12, v13];
    int v14 = };
    uint64_t v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v147 = v14;
    __int16 v148 = 2114;
    v149 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Determining identifier(s) for account: %{public}@", buf, 0x16u);
    if (v11)
    {

      int v14 = (void *)v4;
    }

    uint64_t v8 = &swift_willThrow_ptr;
  }
  v129 = a4;

  __int16 v16 = +[NSMutableArray arrayWithCapacity:3];
  CFStringRef v17 = +[NSMutableArray arrayWithCapacity:3];
  __int16 v18 = objc_msgSend(v7, "ams_DSID");
  id v19 = v18;
  v140 = v18;
  v141 = v17;
  v139 = self;
  id v142 = v7;
  if (v18)
  {
    id v20 = [v18 stringValue];
    if (objc_msgSend(v7, "ams_isSandboxAccount"))
    {
      uint64_t v21 = [v20 stringByAppendingString:@".sandbox"];

      id v20 = (void *)v21;
    }
    id v22 = [(AMSDCookieService *)self dsidHashCache];
    id v23 = [v22 objectForKey:v20];

    if (v23)
    {
      SEL v24 = 0;
    }
    else
    {
      id v145 = 0;
      id v23 = objc_msgSend(v20, "ams_sha512HashStringUsingEncoding:error:", 4, &v145);
      id v32 = v145;
      CFStringRef v33 = [(AMSDCookieService *)self dsidHashCache];
      [v33 setObject:v23 forKey:v19];

      if (!v23)
      {
        if (!v32) {
          goto LABEL_33;
        }
        SEL v24 = v32;
        v41 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v41)
        {
          v41 = +[AMSLogConfig sharedConfig];
        }
        v42 = [v41 OSLogObject];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v131 = v24;
          v43 = AMSLogKey();
          uint64_t v44 = objc_opt_class();
          if (v43)
          {
            uint64_t v45 = AMSLogKey();
            uint64_t v127 = NSStringFromSelector(a2);
            v128 = (void *)v45;
            +[NSString stringWithFormat:@"%@: [%@] %@ ", v44, v45, v127];
          }
          else
          {
            v128 = NSStringFromSelector(a2);
            +[NSString stringWithFormat:@"%@: %@ ", v44, v128];
          v46 = };
          v123 = AMSHashIfNeeded();
          SEL v24 = v131;
          v124 = AMSLogableError();
          *(_DWORD *)buf = 138543874;
          v147 = v46;
          __int16 v148 = 2114;
          v149 = v123;
          __int16 v150 = 2114;
          v151 = v124;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@Could not hash DSID: %{public}@ | error: %{public}@", buf, 0x20u);
          if (v43)
          {

            v46 = (void *)v127;
          }

          id v19 = v140;
          CFStringRef v17 = v141;
          uint64_t v8 = &swift_willThrow_ptr;
        }

        [v17 addObject:v24];
LABEL_32:

LABEL_33:
        id v7 = v142;
        goto LABEL_45;
      }
      SEL v24 = v32;
    }
    id v34 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v34)
    {
      id v34 = +[AMSLogConfig sharedConfig];
    }
    id v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v130 = v24;
      v36 = v16;
      v37 = AMSLogKey();
      uint64_t v38 = objc_opt_class();
      if (v37)
      {
        v39 = AMSLogKey();
        __int16 v16 = NSStringFromSelector(a2);
        +[NSString stringWithFormat:@"%@: [%@] %@ ", v38, v39, v16];
      }
      else
      {
        v39 = NSStringFromSelector(a2);
        +[NSString stringWithFormat:@"%@: %@ ", v38, v39];
      char v40 = };
      *(_DWORD *)buf = 138543618;
      v147 = v40;
      __int16 v148 = 2114;
      v149 = v23;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%{public}@Adding identifier for DSID: %{public}@", buf, 0x16u);
      SEL v24 = v130;
      if (v37)
      {

        char v40 = v16;
      }

      __int16 v16 = v36;
      id v19 = v140;
      CFStringRef v17 = v141;
      uint64_t v8 = &swift_willThrow_ptr;
      self = v139;
    }

    [v16 addObject:v23];
    goto LABEL_32;
  }
  BOOL v25 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v25)
  {
    BOOL v25 = +[AMSLogConfig sharedConfig];
  }
  id v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v16;
    __int16 v28 = AMSLogKey();
    uint64_t v29 = objc_opt_class();
    if (v28)
    {
      __int16 v30 = AMSLogKey();
      CFStringRef v17 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: [%@] %@ ", v29, v30, v17];
    }
    else
    {
      __int16 v30 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: %@ ", v29, v30];
    uint64_t v31 = };
    *(_DWORD *)buf = 138543362;
    v147 = v31;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%{public}@Skipping DSID as the account doesn’t have one.", buf, 0xCu);
    if (v28)
    {

      uint64_t v31 = v17;
    }

    __int16 v16 = v27;
    id v19 = 0;
    CFStringRef v17 = v141;
    uint64_t v8 = &swift_willThrow_ptr;
  }

  id v20 = AMSError();
  [v17 addObject:v20];
LABEL_45:

  v47 = objc_msgSend(v7, "ams_altDSID");
  if (objc_msgSend(v7, "ams_isSandboxAccount"))
  {
    uint64_t v48 = [v47 stringByAppendingString:@".sandbox"];

    v47 = (void *)v48;
  }
  if (!v47)
  {
    v52 = [v8[175] sharedAccountsCookiesConfig];
    if (!v52)
    {
      v52 = [v8[175] sharedConfig];
    }
    v53 = [v52 OSLogObject];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v54 = v16;
      v55 = AMSLogKey();
      uint64_t v56 = objc_opt_class();
      if (v55)
      {
        v57 = AMSLogKey();
        CFStringRef v17 = NSStringFromSelector(a2);
        +[NSString stringWithFormat:@"%@: [%@] %@ ", v56, v57, v17];
      }
      else
      {
        v57 = NSStringFromSelector(a2);
        +[NSString stringWithFormat:@"%@: %@ ", v56, v57];
      v58 = };
      *(_DWORD *)buf = 138543362;
      v147 = v58;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "%{public}@Skipping AltDSID as the account doesn’t have one.", buf, 0xCu);
      if (v55)
      {

        v58 = v17;
      }

      __int16 v16 = v54;
      id v19 = v140;
      CFStringRef v17 = v141;
      uint64_t v8 = &swift_willThrow_ptr;
      v47 = 0;
    }

    AMSError();
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    [v17 addObject:v51];
    goto LABEL_78;
  }
  v49 = [(AMSDCookieService *)self altDSIDHashCache];
  v50 = [v49 objectForKey:v47];

  if (v50)
  {
    id v51 = 0;
  }
  else
  {
    v59 = self;
    id v144 = 0;
    v50 = objc_msgSend(v47, "ams_sha512HashStringUsingEncoding:error:", 4, &v144);
    id v51 = v144;
    v60 = [(AMSDCookieService *)v59 altDSIDHashCache];
    [v60 setObject:v50 forKey:v47];

    if (!v50)
    {
      id v7 = v142;
      if (!v51) {
        goto LABEL_79;
      }
      v68 = [v8[175] sharedAccountsCookiesConfig];
      if (!v68)
      {
        v68 = [v8[175] sharedConfig];
      }
      v69 = [v68 OSLogObject];
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        v70 = AMSLogKey();
        uint64_t v71 = objc_opt_class();
        if (v70)
        {
          uint64_t v72 = AMSLogKey();
          v128 = NSStringFromSelector(a2);
          v133 = (void *)v72;
          +[NSString stringWithFormat:@"%@: [%@] %@ ", v71, v72, v128];
        }
        else
        {
          v133 = NSStringFromSelector(a2);
          +[NSString stringWithFormat:@"%@: %@ ", v71, v133];
        v73 = };
        v125 = AMSHashIfNeeded();
        v126 = AMSLogableError();
        *(_DWORD *)buf = 138543874;
        v147 = v73;
        __int16 v148 = 2114;
        v149 = v125;
        __int16 v150 = 2114;
        v151 = v126;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%{public}@Could not hash AltDSID: %{public}@ | error: %{public}@", buf, 0x20u);
        if (v70)
        {

          v73 = v128;
        }

        id v19 = v140;
        CFStringRef v17 = v141;
        uint64_t v8 = &swift_willThrow_ptr;
      }

      [v17 addObject:v51];
      goto LABEL_66;
    }
  }
  v61 = [v8[175] sharedAccountsCookiesConfig];
  if (!v61)
  {
    v61 = [v8[175] sharedConfig];
  }
  v62 = [v61 OSLogObject];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    v132 = v47;
    v63 = v16;
    v64 = AMSLogKey();
    uint64_t v65 = objc_opt_class();
    if (v64)
    {
      v66 = AMSLogKey();
      CFStringRef v17 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: [%@] %@ ", v65, v66, v17];
    }
    else
    {
      v66 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: %@ ", v65, v66];
    v67 = };
    *(_DWORD *)buf = 138543618;
    v147 = v67;
    __int16 v148 = 2114;
    v149 = v50;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%{public}@Adding identifier for AltDSID: %{public}@", buf, 0x16u);
    if (v64)
    {

      v67 = v17;
    }

    __int16 v16 = v63;
    id v19 = v140;
    CFStringRef v17 = v141;
    uint64_t v8 = &swift_willThrow_ptr;
    v47 = v132;
  }

  [v16 addObject:v50];
LABEL_66:
  id v7 = v142;
LABEL_78:

LABEL_79:
  v74 = [v7 identifier];
  v75 = v74;
  if (!v74)
  {
    if (os_variant_has_internal_content())
    {
      unsigned int v85 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v86 = [v8[175] sharedAccountsCookiesConfig];
      v87 = (void *)v86;
      if (v85)
      {
        if (!v86)
        {
          v87 = [v8[175] sharedConfig];
        }
        v88 = [v87 OSLogObject];
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          v135 = v47;
          v89 = AMSLogKey();
          uint64_t v90 = objc_opt_class();
          uint64_t v91 = v90;
          v92 = v16;
          if (v89)
          {
            CFStringRef v17 = AMSLogKey();
            +[NSString stringWithFormat:@"%@: [%@] ", v91, v17];
          }
          else
          {
            +[NSString stringWithFormat:@"%@: ", v90];
          v93 = };
          v115 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543618;
          v147 = v93;
          __int16 v148 = 2114;
          v149 = v115;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%{public}@Empty identifier for account: %{public}@", buf, 0x16u);
          if (v89)
          {

            v93 = v17;
          }

          __int16 v16 = v92;
          id v19 = v140;
          CFStringRef v17 = v141;
          uint64_t v8 = &swift_willThrow_ptr;
          v47 = v135;
        }

        v87 = +[NSNotificationCenter defaultCenter];
        v100 = [v8[175] sharedAccountsCookiesConfig];
        [v87 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v100 userInfo:0];
      }
      else
      {
        if (!v86)
        {
          v87 = [v8[175] sharedConfig];
        }
        v100 = [v87 OSLogObject];
        if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        {
          v137 = v47;
          v101 = AMSLogKey();
          uint64_t v102 = objc_opt_class();
          uint64_t v103 = v102;
          v104 = v16;
          if (v101)
          {
            CFStringRef v17 = AMSLogKey();
            +[NSString stringWithFormat:@"%@: [%@] ", v103, v17];
          }
          else
          {
            +[NSString stringWithFormat:@"%@: ", v102];
          v105 = };
          v116 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543618;
          v147 = v105;
          __int16 v148 = 2114;
          v149 = v116;
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_FAULT, "%{public}@Empty identifier for account: %{public}@", buf, 0x16u);
          if (v101)
          {

            v105 = v17;
          }

          __int16 v16 = v104;
          id v19 = v140;
          CFStringRef v17 = v141;
          v47 = v137;
        }
      }
    }
    goto LABEL_133;
  }
  if (([v74 containsString:@"/"] & 1) != 0
    || ([v75 containsString:@"."] & 1) != 0
    || [v75 containsString:@"~"])
  {
    if (os_variant_has_internal_content())
    {
      unsigned int v76 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v77 = [v8[175] sharedAccountsCookiesConfig];
      v78 = (void *)v77;
      if (v76)
      {
        if (!v77)
        {
          v78 = [v8[175] sharedConfig];
        }
        v79 = [v78 OSLogObject];
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          v134 = v47;
          v80 = AMSLogKey();
          uint64_t v81 = objc_opt_class();
          uint64_t v82 = v81;
          v83 = v16;
          if (v80)
          {
            CFStringRef v17 = AMSLogKey();
            +[NSString stringWithFormat:@"%@: [%@] ", v82, v17];
          }
          else
          {
            +[NSString stringWithFormat:@"%@: ", v81];
          v84 = };
          v113 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543618;
          v147 = v84;
          __int16 v148 = 2114;
          v149 = v113;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%{public}@Invalid identifier for account: %{public}@", buf, 0x16u);
          if (v80)
          {

            v84 = v17;
          }

          __int16 v16 = v83;
          id v19 = v140;
          CFStringRef v17 = v141;
          uint64_t v8 = &swift_willThrow_ptr;
          v47 = v134;
        }

        v78 = +[NSNotificationCenter defaultCenter];
        v94 = [v8[175] sharedAccountsCookiesConfig];
        [v78 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v94 userInfo:0];
      }
      else
      {
        if (!v77)
        {
          v78 = [v8[175] sharedConfig];
        }
        v94 = [v78 OSLogObject];
        if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
        {
          v136 = v47;
          v95 = AMSLogKey();
          uint64_t v96 = objc_opt_class();
          uint64_t v97 = v96;
          v98 = v16;
          if (v95)
          {
            CFStringRef v17 = AMSLogKey();
            +[NSString stringWithFormat:@"%@: [%@] ", v97, v17];
          }
          else
          {
            +[NSString stringWithFormat:@"%@: ", v96];
          v99 = };
          v114 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543618;
          v147 = v99;
          __int16 v148 = 2114;
          v149 = v114;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_FAULT, "%{public}@Invalid identifier for account: %{public}@", buf, 0x16u);
          if (v95)
          {

            v99 = v17;
          }

          __int16 v16 = v98;
          id v19 = v140;
          CFStringRef v17 = v141;
          v47 = v136;
        }
      }
    }
LABEL_133:
    v117 = AMSError();
    v118 = v17;
    goto LABEL_134;
  }
  v106 = [v8[175] sharedAccountsCookiesConfig];
  if (!v106)
  {
    v106 = [v8[175] sharedConfig];
  }
  v107 = [v106 OSLogObject];
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
  {
    v138 = v47;
    v108 = v16;
    v109 = AMSLogKey();
    uint64_t v110 = objc_opt_class();
    if (v109)
    {
      v111 = AMSLogKey();
      CFStringRef v17 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: [%@] %@ ", v110, v111, v17];
    }
    else
    {
      v111 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@: %@ ", v110, v111];
    v112 = };
    *(_DWORD *)buf = 138543618;
    v147 = v112;
    __int16 v148 = 2114;
    v149 = v75;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEBUG, "%{public}@Adding account identifier: %{public}@", buf, 0x16u);
    if (v109)
    {

      v112 = v17;
    }

    __int16 v16 = v108;
    id v19 = v140;
    CFStringRef v17 = v141;
    v47 = v138;
  }

  v117 = [v7 identifier];
  v118 = v16;
LABEL_134:
  [v118 addObject:v117];

  if ([v16 count])
  {
    id v119 = v16;
    goto LABEL_146;
  }
  if ((unint64_t)[v17 count] < 2)
  {
    v120 = v129;
    if ([v17 count] == (id)1)
    {
      if (v129)
      {
        v121 = [v17 objectAtIndexedSubscript:0];
        goto LABEL_144;
      }
    }
    else if (v129)
    {
      v121 = AMSError();
      goto LABEL_144;
    }
  }
  else
  {
    v120 = v129;
    if (v129)
    {
      v121 = AMSErrorWithMultipleUnderlyingErrors();
LABEL_144:
      id v119 = 0;
      id *v120 = v121;
      goto LABEL_146;
    }
  }
  id v119 = 0;
LABEL_146:

  return v119;
}

- (AMSLRUCache)dsidHashCache
{
  return self->_dsidHashCache;
}

- (id)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4) {
    goto LABEL_9;
  }
  id v10 = [v8 identifier];

  if (!v10
    || ([v9 identifier],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [(AMSDCookieService *)self _cachedCookiePropertiesForIdentifier:v11],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
LABEL_9:
    id v19 = [(AMSDCookieService *)self _cookieDatabaseForAccount:v9 error:a5];
    uint64_t v13 = v19;
    if (v19)
    {
      uint64_t v20 = [v19 cookiePropertiesWithError:a5];
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        if (a4)
        {
          id v22 = 0;
          goto LABEL_37;
        }
        __int16 v28 = [v9 accountPropertyForKey:@"cookies"];
        if (v28)
        {
          uint64_t v29 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v29)
          {
            uint64_t v29 = +[AMSLogConfig sharedConfig];
          }
          __int16 v30 = [v29 OSLogObject];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v31 = objc_opt_class();
            id v32 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v55 = v31;
            __int16 v56 = 2114;
            v57 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Account has unexpected cookies in Accounts database. Cookies should be in coookie database instead. These cookies will migrated on next account save.", buf, 0x16u);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v28;
LABEL_36:

LABEL_37:
            if ([v22 count])
            {
              v37 = +[NSHTTPCookie ams_cookiesByMergingProperties:v22 intoProperties:v21];
              uint64_t v38 = +[NSHTTPCookie ams_propertiesForCookies:v37];

              v39 = +[AMSLogConfig sharedAccountsCookiesConfig];
              if (!v39)
              {
                v39 = +[AMSLogConfig sharedConfig];
              }
              char v40 = [v39 OSLogObject];
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v51 = objc_opt_class();
                AMSLogKey();
                v41 = v53 = self;
                id v50 = [v38 count];
                id v42 = [v22 count];
                id v43 = [v37 count];
                *(_DWORD *)buf = 138544386;
                uint64_t v55 = v51;
                __int16 v56 = 2114;
                v57 = v41;
                __int16 v58 = 2048;
                id v59 = v50;
                __int16 v60 = 2048;
                id v61 = v42;
                __int16 v62 = 2048;
                id v63 = v43;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loaded %lu cookie property dictionaries from database, %lu from Accounts. Parsed and merged into %lu total cookies.", buf, 0x34u);

                self = v53;
              }

              if (a4) {
                goto LABEL_47;
              }
            }
            else
            {
              uint64_t v38 = v21;
              if (a4)
              {
LABEL_47:
                int v14 = v38;
                uint64_t v12 = v14;
                goto LABEL_48;
              }
            }
            uint64_t v44 = [v9 identifier];

            if (v44)
            {
              uint64_t v45 = [v9 identifier];
              [(AMSDCookieService *)self _cacheCookieProperties:v38 forIdentifier:v45];
            }
            goto LABEL_47;
          }
          CFStringRef v33 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v33)
          {
            CFStringRef v33 = +[AMSLogConfig sharedConfig];
          }
          id v34 = [v33 OSLogObject];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            uint64_t v52 = objc_opt_class();
            id v35 = AMSLogKey();
            v36 = AMSHashIfNeeded();
            *(_DWORD *)buf = 138543874;
            uint64_t v55 = v52;
            __int16 v56 = 2114;
            v57 = v35;
            __int16 v58 = 2114;
            id v59 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected value in Accounts database for cookies: %{public}@", buf, 0x20u);
          }
        }
        id v22 = 0;
        goto LABEL_36;
      }
      int v14 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v14)
      {
        int v14 = +[AMSLogConfig sharedConfig];
      }
      id v22 = [v14 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        uint64_t v12 = 0;
LABEL_48:

        goto LABEL_49;
      }
      uint64_t v27 = objc_opt_class();
      SEL v24 = AMSLogKey();
      BOOL v25 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v55 = v27;
      __int16 v56 = 2114;
      v57 = v24;
      __int16 v58 = 2114;
      id v59 = v25;
      id v26 = "%{public}@: [%{public}@] Error getting cookie properties: %{public}@";
    }
    else
    {
      int v14 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v14)
      {
        int v14 = +[AMSLogConfig sharedConfig];
      }
      id v22 = [v14 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      uint64_t v23 = objc_opt_class();
      SEL v24 = AMSLogKey();
      BOOL v25 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v55 = v23;
      __int16 v56 = 2114;
      v57 = v24;
      __int16 v58 = 2114;
      id v59 = v25;
      id v26 = "%{public}@: [%{public}@] Error getting cookie database: %{public}@";
    }
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v26, buf, 0x20u);

    goto LABEL_22;
  }
  uint64_t v13 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v13)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
  }
  int v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = AMSLogKey();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = v16;
    if (v15)
    {
      AMSLogKey();
      self = (AMSDCookieService *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:@"%@: [%@] ", v17, self];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v16];
    __int16 v18 = };
    v47 = AMSHashIfNeeded();
    uint64_t v48 = [v9 identifier];
    v49 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v55 = (uint64_t)v18;
    __int16 v56 = 2114;
    v57 = v47;
    __int16 v58 = 2114;
    id v59 = v49;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@Found cached cookie properties. cookieProperties = %{public}@ | identifier = %{public}@", buf, 0x20u);

    if (v15)
    {

      __int16 v18 = self;
    }
  }
LABEL_49:

  return v12;
}

- (AMSLRUCache)altDSIDHashCache
{
  return self->_altDSIDHashCache;
}

- (id)_alliTunesAccountIdentifiers
{
  id v3 = +[ACAccountStore ams_sharedAccountStore];
  uint64_t v4 = objc_msgSend(v3, "ams_fetchiTunesAccounts");
  id v5 = objc_msgSend(v3, "ams_fetchiTunesSandboxAccounts");
  v11[0] = v4;
  v11[1] = v5;
  BOOL v6 = +[NSArray arrayWithObjects:v11 count:2];
  id v7 = +[AMSPromise promiseWithAll:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100023948;
  v10[3] = &unk_100112320;
  v10[4] = self;
  id v8 = [v7 thenWithBlock:v10];

  return v8;
}

- (void)_clearAllCachedCookieProperties
{
  id v3 = [(AMSDCookieService *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Clearing all cached cookies.", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(AMSDCookieService *)self cookiePropertyCache];
  [v8 removeAllObjects];
}

- (void)_cacheCookieDatabase:(id)a3 withPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSDCookieService *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v9)
  {
    int v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    uint64_t v13 = AMSHashIfNeeded();
    int v14 = AMSHashIfNeeded();
    int v16 = 138544130;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    id v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Caching cookie database. database = %{public}@ | dbPath = %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v15 = [(AMSDCookieService *)self cookieDatabaseCache];
  [v15 setObject:v6 forKey:v7];
}

- (AMSDCookieService)init
{
  v15.receiver = self;
  v15.super_class = (Class)AMSDCookieService;
  v2 = [(AMSDCookieService *)&v15 init];
  if (v2)
  {
    id v3 = (AMSLRUCache *)[objc_alloc((Class)AMSLRUCache) initWithMaxSize:10];
    altDSIDHashCache = v2->_altDSIDHashCache;
    v2->_altDSIDHashCache = v3;

    id v5 = (AMSLRUCache *)[objc_alloc((Class)AMSLRUCache) initWithMaxSize:10];
    dsidHashCache = v2->_dsidHashCache;
    v2->_dsidHashCache = v5;

    id v7 = (AMSLRUCache *)objc_alloc_init((Class)AMSLRUCache);
    cookiePropertyCache = v2->_cookiePropertyCache;
    v2->_cookiePropertyCache = v7;

    int v9 = (AMSLRUCache *)[objc_alloc((Class)AMSLRUCache) initWithMaxSize:10];
    cookieDatabaseCache = v2->_cookieDatabaseCache;
    v2->_cookieDatabaseCache = v9;

    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AppleMediaServices.CookieStorage", v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;
  }
  return v2;
}

- (void)clearAllCachedCookieProperties
{
  id v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = AMSLogKey();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v7)
    {
      uint64_t v2 = AMSLogKey();
      +[NSString stringWithFormat:@"%@: [%@] ", v9, v2];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    objc_super v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@%{public}@ - taking keepalive transaction", buf, 0x16u);
    if (v7)
    {

      uint64_t v10 = (void *)v2;
    }
  }
  dispatch_queue_t v12 = [(AMSDCookieService *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000241E4;
  v13[3] = &unk_100112368;
  v13[4] = self;
  v13[5] = a2;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDCookieService.clearAllCachedCookies" withQueue:v12 whilePerformingBlock:v13];
}

- (id)clearDanglingCookieDatabases
{
  id v3 = AMSLogKey();
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDCookieService.clearDanglingCookieDatabases"];
  id v4 = objc_alloc_init((Class)AMSMutableBinaryPromise);
  id v5 = [(AMSDCookieService *)self _alliTunesAccountIdentifiers];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000245C4;
  v10[3] = &unk_1001123B8;
  v10[4] = self;
  id v11 = v3;
  dispatch_queue_t v12 = @"com.apple.amsaccountsd.AMSDCookieService.clearDanglingCookieDatabases";
  id v6 = v3;
  id v7 = [v5 thenWithBlock:v10];
  uint64_t v8 = [v7 binaryPromiseAdapter];
  [v4 finishWithPromise:v8];

  return v4;
}

- (void)clearDanglingCookieDatabasesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDCookieService *)self clearDanglingCookieDatabases];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024908;
  v7[3] = &unk_1001123E0;
  id v8 = v4;
  id v6 = v4;
  [v5 addFinishBlock:v7];
}

- (void)getCookieDatabasePathForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSDCookieService *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100024A64;
  v11[3] = &unk_100112408;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.AMSDCookieService.getCookieDatabasePath" withQueue:v8 whilePerformingSyncBlock:v11];
}

- (void)getCookiePropertiesForAccount:(id)a3 withCompletion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cookieDatabaseCache, 0);
  objc_storeStrong((id *)&self->_cookiePropertyCache, 0);
  objc_storeStrong((id *)&self->_dsidHashCache, 0);
  objc_storeStrong((id *)&self->_altDSIDHashCache, 0);
}

@end