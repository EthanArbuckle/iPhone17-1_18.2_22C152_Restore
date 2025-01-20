@interface PDASMBootstrapOperation
+ (id)defaultEndpointInfo;
+ (id)serviceID;
- (BOOL)canSkipExecution;
- (BOOL)processResponseObject:(id)a3 error:(id *)a4;
- (BOOL)saveServiceConfig:(id)a3 forEDUMAID:(BOOL)a4;
- (Class)expectedResponseClass;
- (id)endpointIdentifier;
@end

@implementation PDASMBootstrapOperation

+ (id)serviceID
{
  return @"apple_school_manager";
}

+ (id)defaultEndpointInfo
{
  v2 = objc_alloc_init(PDEndpointInfo);
  sub_10007C770((uint64_t)v2, @"apple_school_manager");
  sub_1000435F8((uint64_t)v2, @"ee.setup");
  sub_100043608((uint64_t)v2, @"https://ws-ee-maidsvc.icloud.com/maid/v1/directory/setup");
  if (v2)
  {
    v2->_payloadLimitItems = 0;
    v2->_payloadLimitBytes = 0;
    v2->_responseTTLSeconds = 3600;
    *(_WORD *)&v2->_requiresAuth = 257;
  }
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)endpointIdentifier
{
  return @"ee.setup";
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canSkipExecution
{
  uint64_t v3 = [(PDEndpointRequestOperation *)self endpointInfo];
  v4 = (void *)v3;
  if (!v3 || *(double *)(v3 + 16) == 0.0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v5 = [(PDEndpointRequestOperation *)self endpointInfo];
    BOOL v6 = !sub_1000DA3C0((BOOL)v5);
  }
  return v6;
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
    v34 = sub_10000B694;
    v35 = sub_10000B564;
    id v36 = 0;
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_100070888;
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

- (BOOL)saveServiceConfig:(id)a3 forEDUMAID:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(PDOperation *)self database];
  uint64_t v8 = sub_100003A74(v7);
  v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = *(void *)(v8 + 56);
  }
  else {
    uint64_t v10 = 0;
  }
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100071C2C;
  id v22 = &unk_1001F3510;
  id v11 = v6;
  id v23 = v11;
  LOBYTE(v26) = a4;
  id v12 = v7;
  v13 = v12;
  id v24 = v12;
  v25 = self;
  if (v12 && [v12 performTransaction:&v19 forWriting:1])
  {
    v14 = sub_100003A74(v13);

    id v15 = [(PDOperation *)self manager];
    if ([v11 hasSyncFetchInterval])
    {
      if (v14) {
        uint64_t v16 = v14[7];
      }
      else {
        uint64_t v16 = 0;
      }
      if (v16 != v10) {
        sub_10011496C((uint64_t)v15);
      }
    }

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
    v14 = v9;
  }

  return v17;
}

@end