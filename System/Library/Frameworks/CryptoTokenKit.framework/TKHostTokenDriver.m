@interface TKHostTokenDriver
- (BOOL)configureWithError:(id *)a3;
- (BOOL)valid;
- (NSExtension)extension;
- (NSString)classID;
- (NSUUID)requestIdentifier;
- (TKHostTokenDriver)initWithExtension:(id)a3 cache:(id)a4;
- (TKHostTokenDriverCache)cache;
- (TKTokenDriverHostContext)context;
- (id)acquireTokenWithSlot:(id)a3 AID:(id)a4 tokenID:(id *)a5 error:(id *)a6;
- (id)acquireTokenWithTokenID:(id)a3 error:(id *)a4;
- (id)contextWithError:(id *)a3;
- (id)description;
- (void)dealloc;
- (void)invalidate;
- (void)keepAlive:(BOOL)a3;
- (void)releaseTokenWithTokenID:(id)a3;
- (void)setExtension:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation TKHostTokenDriver

- (TKHostTokenDriver)initWithExtension:(id)a3 cache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKHostTokenDriver;
  v9 = [(TKHostTokenDriver *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeWeak((id *)&v10->_cache, v8);
  }

  return v10;
}

- (id)description
{
  v3 = [(TKHostTokenDriver *)self extension];
  v4 = [v3 identifier];
  v5 = [(TKHostTokenDriver *)self requestIdentifier];
  v6 = +[NSString stringWithFormat:@"<TKHostTokenDriver:%p %@(%@)>", self, v4, v5];

  return v6;
}

- (NSString)classID
{
  v3 = [(TKHostTokenDriver *)self extension];
  v4 = [v3 attributes];
  uint64_t v5 = TKTokenClassDriverClassIDKey;
  v6 = [v4 objectForKeyedSubscript:TKTokenClassDriverClassIDKey];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = sub_100011330();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000150AC(v5, self);
    }
  }

  return (NSString *)v6;
}

- (void)keepAlive:(BOOL)a3
{
  alive = self->_alive;
  if (a3)
  {
    if (alive)
    {
      v10 = +[NSAssertionHandler currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"TKHostTokenDriver.m" lineNumber:132 description:@"Attempted to create keepalive xaction when it already exists"];
    }
    v11 = [(TKHostTokenDriver *)self extension];
    uint64_t v5 = [v11 identifier];
    id v6 = +[NSString stringWithFormat:@"extension holder for '%@'", v5];
    [v6 UTF8String];
    id v7 = (OS_os_transaction *)os_transaction_create();
    id v8 = self->_alive;
    self->_alive = v7;

    alive = (OS_os_transaction *)v11;
  }
  else
  {
    self->_alive = 0;
  }
}

- (void)invalidate
{
  v3 = sub_100011330();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100015160();
  }

  v4 = self;
  objc_sync_enter(v4);
  v4->_invalidated = 1;
  [(TKHostTokenDriver *)v4 keepAlive:0];
  objc_sync_exit(v4);
}

- (BOOL)valid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2->_invalidated;
  objc_sync_exit(v2);

  return v3;
}

- (id)contextWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_invalidated)
  {
    uint64_t v5 = sub_100011330();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100015298();
    }

    if (a3)
    {
      id v6 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4097 userInfo:0];
      id v7 = 0;
LABEL_6:
      *a3 = v6;
      goto LABEL_27;
    }
LABEL_26:
    id v7 = 0;
  }
  else
  {
    SEL v55 = a2;
    id v8 = [(TKHostTokenDriver *)v4 requestIdentifier];

    v56 = v8;
    if (!v8)
    {
      v17 = [(TKHostTokenDriver *)v4 classID];
      objc_initWeak(&location, v4);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100012124;
      v62[3] = &unk_1000209E0;
      id v18 = v17;
      id v63 = v18;
      objc_copyWeak(&v64, &location);
      v19 = [(TKHostTokenDriver *)v4 extension];
      [v19 setRequestInterruptionBlock:v62];

      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1000121B8;
      v59[3] = &unk_100020A08;
      id v54 = v18;
      id v60 = v54;
      objc_copyWeak(&v61, &location);
      v20 = [(TKHostTokenDriver *)v4 extension];
      [v20 setRequestCancellationBlock:v59];

      v21 = sub_100011330();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100015230();
      }

      id v22 = objc_alloc_init((Class)NSExtensionItem);
      v71[0] = @"idleTimeout";
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_cache);
      [WeakRetained idleTimeout];
      v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v71[1] = @"avoidInitialKeepAlive";
      v72[0] = v24;
      id v25 = objc_loadWeakRetained((id *)&v4->_cache);
      v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 avoidInitialKeepAlive]);
      v72[1] = v26;
      v27 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
      [v22 setUserInfo:v27];

      for (int i = 0; ; ++i)
      {
        v29 = [(TKHostTokenDriver *)v4 extension];
        id v70 = v22;
        v30 = +[NSArray arrayWithObjects:&v70 count:1];
        id v58 = 0;
        v31 = [v29 beginExtensionRequestWithOptions:0 inputItems:v30 error:&v58];
        id v32 = v58;
        [(TKHostTokenDriver *)v4 setRequestIdentifier:v31];

        v33 = [(TKHostTokenDriver *)v4 requestIdentifier];
        LODWORD(v29) = v33 == 0;

        if (!v29) {
          break;
        }
        if (i == 8
          || [v32 code] != (id)4099
          || ([v32 domain],
              v34 = objc_claimAutoreleasedReturnValue(),
              unsigned int v35 = [v34 isEqualToString:NSCocoaErrorDomain],
              v34,
              !v35))
        {
          v39 = sub_100011330();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v47 = [(TKHostTokenDriver *)v4 extension];
            v48 = [v47 identifier];
            *(_DWORD *)buf = 138543618;
            v67 = v48;
            __int16 v68 = 2114;
            id v69 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Token driver extension %{public}@ failed to start: %{public}@", buf, 0x16u);
          }
          if (a3) {
            *a3 = v32;
          }
          id v40 = objc_loadWeakRetained((id *)&v4->_cache);
          v41 = [(TKHostTokenDriver *)v4 classID];
          [v40 removeDriverWithClassID:v41];

          objc_destroyWeak(&v61);
          objc_destroyWeak(&v64);

          objc_destroyWeak(&location);
          goto LABEL_26;
        }
        v36 = sub_100011330();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v37 = [(TKHostTokenDriver *)v4 extension];
          v38 = [v37 identifier];
          *(_DWORD *)buf = 138543618;
          v67 = v38;
          __int16 v68 = 1024;
          LODWORD(v69) = i;
          _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "beginExtensionRequest for %{public}@ failed %d time, retrying", buf, 0x12u);
        }
      }

      v44 = sub_100011330();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        sub_1000151C8();
      }

      v45 = [(TKHostTokenDriver *)v4 requestIdentifier];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v52 = +[NSAssertionHandler currentHandler];
        v53 = [(TKHostTokenDriver *)v4 requestIdentifier];
        [v52 handleFailureInMethod:v55, v4, @"TKHostTokenDriver.m", 211, @"requestIdentifier of unexpected type: %@", v53 object file lineNumber description];
      }
      [(TKHostTokenDriver *)v4 keepAlive:1];

      objc_destroyWeak(&v61);
      objc_destroyWeak(&v64);

      objc_destroyWeak(&location);
    }
    v9 = [(TKHostTokenDriver *)v4 extension];
    v10 = [(TKHostTokenDriver *)v4 requestIdentifier];
    id v7 = [v9 _extensionContextForUUID:v10];

    if (v7)
    {
      v11 = [(TKHostTokenDriver *)v4 cache];
      objc_super v12 = [v11 registry];
      [v7 setRegistry:v12];

      if (!v56)
      {
        v13 = [v7 tokenDriverProtocol];
        v14 = [v7 registry];
        v15 = [v14 listener];
        v16 = [v15 endpoint];
        [v13 setConfigurationEndpoint:v16 reply:&stru_100020A28];
      }
    }
    else
    {
      v43 = sub_100011330();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v49 = [(TKHostTokenDriver *)v4 extension];
        v50 = [v49 identifier];
        v51 = [(TKHostTokenDriver *)v4 requestIdentifier];
        *(_DWORD *)buf = 138543618;
        v67 = v50;
        __int16 v68 = 2114;
        id v69 = v51;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}@ failed to resolve requestIdentifier %{public}@ to context", buf, 0x16u);
      }
      if (a3)
      {
        id v6 = +[NSError errorWithDomain:TKErrorDomain code:-7 userInfo:0];
        goto LABEL_6;
      }
    }
  }
LABEL_27:
  objc_sync_exit(v4);

  return v7;
}

- (TKTokenDriverHostContext)context
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(TKHostTokenDriver *)v2 requestIdentifier];

  if (v3)
  {
    v4 = [(TKHostTokenDriver *)v2 extension];
    uint64_t v5 = [(TKHostTokenDriver *)v2 requestIdentifier];
    id v6 = [v4 _extensionContextForUUID:v5];
  }
  else
  {
    id v6 = 0;
  }
  objc_sync_exit(v2);

  return (TKTokenDriverHostContext *)v6;
}

- (id)acquireTokenWithTokenID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [v7 classID];
  v9 = [(TKHostTokenDriver *)self classID];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TKHostTokenDriver.m", 247, @"%@ asked to acquire token with bad class: %@", self, v7 object file lineNumber description];
  }
  v11 = sub_100011330();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100015440();
  }

  objc_super v12 = [(TKHostTokenDriver *)self contextWithError:a4];
  v13 = v12;
  if (v12)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = sub_100012664;
    v33 = sub_100012674;
    id v34 = 0;
    v14 = [v12 tokenDriverProtocol];
    v15 = [v7 instanceID];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001267C;
    v26[3] = &unk_100020A50;
    v28 = &v29;
    id v16 = v13;
    id v27 = v16;
    [v14 acquireTokenWithInstanceID:v15 reply:v26];

    uint64_t v17 = v30[5];
    id v18 = sub_100011330();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      if (v19) {
        sub_1000153D8();
      }

      id v20 = (id)v30[5];
    }
    else
    {
      if (v19)
      {
        id v22 = [(TKHostTokenDriver *)self extension];
        v23 = [v22 identifier];
        v24 = [v16 error];
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        __int16 v37 = 2114;
        v38 = v24;
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "failed to acquire token from extension %{public}@, error:%{public}@", buf, 0x16u);
      }
      if (a4)
      {
        [v16 error];
        id v20 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v20 = 0;
      }
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)acquireTokenWithSlot:(id)a3 AID:(id)a4 tokenID:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = sub_100011330();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100015518(self);
  }

  v13 = [(TKHostTokenDriver *)self contextWithError:a6];
  v14 = v13;
  if (v13)
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = sub_100012664;
    v46 = sub_100012674;
    id v47 = 0;
    uint64_t v36 = 0;
    __int16 v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_100012664;
    id v40 = sub_100012674;
    id v41 = 0;
    v15 = [v13 tokenDriverProtocol];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100012A84;
    v32[3] = &unk_100020A78;
    id v34 = &v42;
    unsigned int v35 = &v36;
    id v16 = v14;
    id v33 = v16;
    [v15 acquireTokenWithSlot:v10 AID:v11 reply:v32];

    if (v43[5])
    {
      id v17 = objc_alloc((Class)TKTokenID);
      id v18 = [(TKHostTokenDriver *)self classID];
      *a5 = [v17 initWithClassID:v18 instanceID:v37[5]];

      BOOL v19 = sub_100011330();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1000154A8((uint64_t)a5, v19, v20, v21, v22, v23, v24, v25);
      }

      id v26 = (id)v43[5];
    }
    else
    {
      id v27 = sub_100011330();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = [(TKHostTokenDriver *)self extension];
        v30 = [v29 identifier];
        uint64_t v31 = [v16 error];
        *(_DWORD *)buf = 138543618;
        v49 = v30;
        __int16 v50 = 2114;
        v51 = v31;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "failed to acquire token from extension %{public}@, error:%{public}@", buf, 0x16u);
      }
      if (a6)
      {
        [v16 error];
        id v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v26 = 0;
      }
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (BOOL)configureWithError:(id *)a3
{
  uint64_t v5 = sub_100011330();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000155B8(self);
  }

  id v6 = [(TKHostTokenDriver *)self contextWithError:a3];
  id v7 = v6;
  if (v6)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v8 = [v6 tokenDriverProtocol];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100012CB0;
    id v16 = &unk_100020AA0;
    id v18 = &v19;
    id v9 = v7;
    id v17 = v9;
    [v8 configureWithReply:&v13];

    int v10 = *((unsigned __int8 *)v20 + 24);
    if (a3 && !*((unsigned char *)v20 + 24))
    {
      objc_msgSend(v9, "error", v13, v14, v15, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      int v10 = *((unsigned __int8 *)v20 + 24);
    }
    BOOL v11 = v10 != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)releaseTokenWithTokenID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100011330();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000156C0();
  }

  id v6 = [(TKHostTokenDriver *)self context];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 tokenDriverProtocol];
    id v9 = [v4 instanceID];
    [v8 releaseTokenWithInstanceID:v9 reply:&stru_100020AC0];
  }
  int v10 = sub_100011330();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100015658();
  }
}

- (void)dealloc
{
  BOOL v3 = sub_100011330();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100015728();
  }

  id v4 = [(TKHostTokenDriver *)self requestIdentifier];

  if (v4)
  {
    uint64_t v5 = [(TKHostTokenDriver *)self extension];
    id v6 = [(TKHostTokenDriver *)self requestIdentifier];
    [v5 cancelExtensionRequestWithIdentifier:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)TKHostTokenDriver;
  [(TKHostTokenDriver *)&v7 dealloc];
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (TKHostTokenDriverCache)cache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);

  return (TKHostTokenDriverCache *)WeakRetained;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_alive, 0);

  objc_destroyWeak((id *)&self->_cache);
}

@end