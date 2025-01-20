@interface CDAppExtensionService
- (CDAppExtensionService)initWithInfo:(id)a3 extension:(id)a4;
- (NSCopying)requestId;
- (NSExtension)extension;
- (void)invalidateConnection;
- (void)obtainXPCConnection:(id)a3;
- (void)setRequestId:(id)a3;
@end

@implementation CDAppExtensionService

- (CDAppExtensionService)initWithInfo:(id)a3 extension:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDAppExtensionService;
  v7 = [(CDXPCService *)&v12 initWithInfo:a3];
  if (v7)
  {
    if (v6)
    {
      v8 = (NSExtension *)v6;
      extension = v7->_extension;
      v7->_extension = v8;
    }
    else
    {
      v10 = (objc_class *)objc_opt_class();
      extension = NSStringFromClass(v10);
      +[NSException raise:@"ExtensionRequiredError", @"%@ Requires Extension!", extension format];
    }
  }
  return v7;
}

- (void)obtainXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = [(CDXPCService *)self xpcConnection];
  if (v5)
  {
  }
  else
  {
    id v6 = [(CDAppExtensionService *)self requestId];

    if (!v6)
    {
      v8 = [(CDAppExtensionService *)self extension];
      v9 = [(CDService *)self ID];
      objc_initWeak(&location, self);
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      int v19 = 0;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __45__CDAppExtensionService_obtainXPCConnection___block_invoke;
      v12[3] = &unk_10005DF70;
      v16 = v18;
      objc_copyWeak(&v17, &location);
      id v10 = v9;
      id v13 = v10;
      id v11 = v8;
      id v14 = v11;
      id v15 = v4;
      [v11 beginExtensionRequestWithOptions:0 inputItems:0 completion:v12];

      objc_destroyWeak(&v17);
      _Block_object_dispose(v18, 8);
      objc_destroyWeak(&location);

      goto LABEL_5;
    }
  }
  v7 = [(CDService *)self ID];
  +[NSException raise:@"com.apple.cache_delete.CDAnonymousXPCService.duplicate_connection", @"Asked to build a connection to %@ but we already have a perfectly good one!", v7 format];

LABEL_5:
}

void __45__CDAppExtensionService_obtainXPCConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 2)
  {
    v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "beginExtensionRequestWithInputItems callback called multiple (%d) times!", buf, 8u);
    }

    +[NSException raise:@"com.apple.cache_delete.unexpected_multiple_callback" format:@"beginExtensionRequestWithInputItems callback fired more than once"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained serviceQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __45__CDAppExtensionService_obtainXPCConnection___block_invoke_17;
    v14[3] = &unk_10005DF48;
    id v15 = v5;
    id v16 = v6;
    id v17 = *(id *)(a1 + 40);
    v18 = v9;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    dispatch_async(v10, v14);

    id v11 = v15;
  }
  else
  {
    id v11 = CDGetLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "BeginExtensionRequestWithInputItems returned after self went away (ID=%@)!", buf, 0xCu);
    }
  }
}

void __45__CDAppExtensionService_obtainXPCConnection___block_invoke_17(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "_extensionContextForUUID:");
    v3 = v2;
    if (v2)
    {
      id v4 = [v2 _auxiliaryConnection];
      [*(id *)(a1 + 56) setXpcConnection:v4];

      id v5 = [*(id *)(a1 + 56) xpcConnection];

      if (v5)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v6 = CDGetLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = [*(id *)(a1 + 56) ID];
        *(_DWORD *)buf = 138412290;
        id v19 = v7;
        v8 = "Unable to get xpc connection from app extension context for app extension service %@";
LABEL_21:
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
      }
    }
    else
    {
      id v6 = CDGetLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = [*(id *)(a1 + 56) ID];
        *(_DWORD *)buf = 138412290;
        id v19 = v7;
        v8 = "Unable to get extension context for app extension service %@";
        goto LABEL_21;
      }
    }

    goto LABEL_9;
  }
LABEL_10:
  if (*(void *)(a1 + 40)
    || ([*(id *)(a1 + 56) xpcConnection],
        int v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    v9 = CDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      id v19 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "hostExtensionContext for service %@ has no connection", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
      uint64_t v17 = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    }
    else
    {
      id v11 = 0;
    }
    id v14 = [objc_alloc((Class)NSError) initWithDomain:@"CacheDeleteErrorDomain" code:6 userInfo:v11];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    [*(id *)(a1 + 56) setRequestId:*(void *)(a1 + 32)];
    uint64_t v13 = *(void *)(a1 + 72);
    id v14 = [*(id *)(a1 + 56) xpcConnection];
    (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v14, 0);
  }
}

- (void)invalidateConnection
{
  uint64_t v3 = [(CDXPCService *)self xpcConnection];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned int v5 = [(CDXPCService *)self isConnected];

    if (v5)
    {
      id v6 = [(CDAppExtensionService *)self extension];
      v7 = [(CDAppExtensionService *)self requestId];
      [v6 cancelExtensionRequestWithIdentifier:v7];
    }
  }
  [(CDAppExtensionService *)self setRequestId:0];
  [(CDXPCService *)self connectionWasInvalidated];
  v8 = [(CDXPCService *)self watchdog_timer];

  if (v8)
  {
    v9 = [(CDXPCService *)self watchdog_timer];
    dispatch_source_cancel(v9);

    [(CDXPCService *)self setWatchdog_timer:0];
  }
  else
  {
    uint64_t v10 = CDGetLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(CDXPCService *)self watchdog_timer];
      int v12 = 134218240;
      uint64_t v13 = self;
      __int16 v14 = 2048;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "watchdog timer is nil, self: %p, timer: %p", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (NSExtension)extension
{
  return self->_extension;
}

- (NSCopying)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end