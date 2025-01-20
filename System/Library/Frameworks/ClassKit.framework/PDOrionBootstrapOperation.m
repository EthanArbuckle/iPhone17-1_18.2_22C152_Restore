@interface PDOrionBootstrapOperation
+ (id)defaultEndpointInfo;
+ (id)serviceID;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)saveClientConfig:(id)a3;
- (BOOL)updateAllowedHosts:(id)a3;
- (Class)expectedResponseClass;
- (id)endpointIdentifier;
- (id)overrideConfig:(id)a3;
@end

@implementation PDOrionBootstrapOperation

+ (id)serviceID
{
  return @"orion";
}

+ (id)defaultEndpointInfo
{
  v2 = objc_alloc_init(PDEndpointInfo);
  sub_10007C770((uint64_t)v2, @"orion");
  sub_1000435F8((uint64_t)v2, @"bootstrap");
  sub_100043608((uint64_t)v2, @"https://pg-bootstrap.itunes.apple.com/v1/config");
  if (v2)
  {
    v2->_payloadLimitItems = 0;
    v2->_payloadLimitBytes = 0;
    v2->_responseTTLSeconds = 28800;
    *(_WORD *)&v2->_requiresAuth = 257;
  }
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)endpointIdentifier
{
  return @"bootstrap";
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)processResponseObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(PDOperation *)self isAborted])
  {
    v8 = [(PDOperation *)self database];
    v9 = [(PDURLRequestOperation *)self stats];
    if (v9) {
      v9[15] = 1;
    }

    CLSInitLog();
    v10 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      id v12 = v11;
      v13 = [(PDURLRequestOperation *)self operationID];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ processing response;",
        buf,
        0x16u);
    }
    CLSInitLog();
    v14 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_opt_class();
      id v22 = v21;
      v23 = [(PDURLRequestOperation *)self operationID];
      v24 = [v6 dictionaryRepresentation];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      v34 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ response data: %@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v34 = sub_10000B714;
    v35 = sub_10000B5A4;
    id v36 = 0;
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_1000D03E0;
    v28 = &unk_1001F34E8;
    id v15 = v8;
    id v29 = v15;
    id v16 = v6;
    id v30 = v16;
    v31 = self;
    v32 = buf;
    if (v15)
    {
      v17 = v16;
      unsigned int v18 = [v15 performTransaction:&v25 forWriting:1];
      v19 = *(void **)(*(void *)&buf[8] + 40);
      if (v19)
      {
        if (a4)
        {
          BOOL v7 = 0;
          *a4 = v19;
LABEL_18:

          _Block_object_dispose(buf, 8);
          goto LABEL_19;
        }
      }
      else if (v18)
      {
        if (objc_msgSend(v17, "hasUserInfo", v25, v26, v27, v28, v29, v30, v31, v32)) {
          +[CLSUtil postNotificationAsync:"com.apple.progressd.accountChanged"];
        }
        BOOL v7 = 1;
        goto LABEL_18;
      }
    }
    BOOL v7 = 0;
    goto LABEL_18;
  }
  BOOL v7 = 0;
LABEL_19:

  return v7;
}

- (id)overrideConfig:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDOrionBootstrapOperation;
  v3 = [(PDBootstrapOperation *)&v5 overrideConfig:a3];

  return v3;
}

- (BOOL)updateAllowedHosts:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PDOperation *)self database];
  [v5 deleteAll:objc_opt_class() where:0 bindings:0];
  id v6 = objc_opt_new();
  BOOL v7 = sub_100064E0C([PDAllowedHost alloc], @"ws-ee-maidsvc.icloud.com");
  [v6 addObject:v7];

  v8 = sub_100064E0C([PDAllowedHost alloc], @"itunes.apple.com");
  [v6 addObject:v8];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v13);
        id v16 = sub_100064E0C([PDAllowedHost alloc], v14);
        objc_msgSend(v6, "addObject:", v16, (void)v20);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  v17 = [v6 allObjects];
  unsigned __int8 v18 = [v5 insertOrUpdateObjects:v17];

  return v18;
}

- (BOOL)saveClientConfig:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PDOperation *)self database];
  uint64_t v6 = [v5 select:objc_opt_class() where:0 bindings:0];
  BOOL v7 = (void *)v6;
  if (v6) {
    BOOL v8 = *(unsigned char *)(v6 + 9) != 0;
  }
  else {
    BOOL v8 = 0;
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000D0ACC;
  v30[3] = &unk_1001F3510;
  BOOL v34 = v8;
  id v9 = v4;
  id v31 = v9;
  id v10 = v5;
  id v11 = v10;
  id v32 = v10;
  v33 = self;
  if (v10 && [v10 performTransaction:v30 forWriting:1])
  {
    v25 = v7;
    [v11 deleteAll:objc_opt_class() where:0 bindings:0];
    uint64_t v12 = +[NSMutableArray array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v24 = v9;
    v13 = [v9 excludeAppIds];
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          unsigned __int8 v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (([v18 isEqualToString:@"com.apple.schoolwork.ClassKitApp"] & 1) == 0)
          {
            long long v20 = sub_1000C72E4([PDBlockedApp alloc], v18);
            [v12 addObject:v20];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v15);
    }

    if ([v11 insertOrUpdateObjects:v12])
    {
      id v9 = v24;
      long long v21 = [v24 hostAllowLists];
      BOOL v22 = [(PDOrionBootstrapOperation *)self updateAllowedHosts:v21];
    }
    else
    {
      BOOL v22 = 0;
      id v9 = v24;
    }
    BOOL v7 = v25;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

@end