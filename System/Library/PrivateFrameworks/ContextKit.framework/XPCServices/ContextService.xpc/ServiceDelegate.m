@interface ServiceDelegate
+ (id)debugProcessIdentifierForConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ServiceDelegate)initWithAssets:(id)a3;
@end

@implementation ServiceDelegate

- (ServiceDelegate)initWithAssets:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ServiceDelegate;
  v5 = [(ServiceDelegate *)&v21 init];
  if (v5)
  {
    v6 = objc_opt_class();
    objc_sync_enter(v6);
    v7 = [[CKContextXPCProtocolImpl alloc] initWithAssets:v4];
    sharedXPCService = v5->_sharedXPCService;
    v5->_sharedXPCService = v7;

    objc_sync_exit(v6);
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKContextXPCProtocol];
    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    [(NSXPCInterface *)v9 setClasses:v11 forSelector:"findResultsForRequest:withReply:" argumentIndex:0 ofReply:0];

    v12 = +[NSSet setWithObject:objc_opt_class()];
    [(NSXPCInterface *)v9 setClasses:v12 forSelector:"donate:" argumentIndex:0 ofReply:0];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    [(NSXPCInterface *)v9 setClasses:v16 forSelector:"groupResponses:withReply:" argumentIndex:0 ofReply:0];

    interface = v5->_interface;
    v5->_interface = v9;
    v18 = v9;

    connections = v5->_connections;
    v5->_connections = 0;
  }
  return v5;
}

+ (id)debugProcessIdentifierForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 processIdentifier];
  v5 = [v3 _xpcConnection];

  v6 = (const char *)xpc_connection_copy_bundle_id();
  if (v6) {
    v7 = (__CFString *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v6 length:strlen(v6) encoding:4 freeWhenDone:1];
  }
  else {
    v7 = &stru_10048C1F8;
  }
  v8 = malloc_type_malloc(0x200uLL, 0x5ED12499uLL);
  if (v8)
  {
    v9 = v8;
    unsigned int v10 = proc_pidpath((int)v4, v8, 0x200u);
    if (v10 - 15 > 0xFFFFFFF1)
    {
LABEL_10:
      v12 = (__CFString *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v9 length:v10 encoding:4 freeWhenDone:1];
      goto LABEL_13;
    }
    int v11 = proc_name((int)v4, v9, 0x200u);
    if (v11 > 0)
    {
      if (v11 >= 512) {
        unsigned int v10 = 512;
      }
      else {
        unsigned int v10 = v11;
      }
      goto LABEL_10;
    }
    free(v9);
  }
  v12 = &stru_10048C1F8;
LABEL_13:
  uint64_t v13 = +[NSString stringWithFormat:@"%i:%@:%@", v4, v12, v7];

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setExportedInterface:self->_interface];
  [v7 setExportedObject:self->_sharedXPCService];
  if (self->_connections)
  {
    v8 = +[ServiceDelegate debugProcessIdentifierForConnection:v7];
    id v9 = v7;
    unsigned int v10 = self->_connections;
    objc_sync_enter(v10);
    [(NSMapTable *)self->_connections setObject:v8 forKey:v9];
    NSUInteger v11 = [(NSMapTable *)self->_connections count];
    objc_sync_exit(v10);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v45 = v8;
      __int16 v46 = 2048;
      NSUInteger v47 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "New XPC connection for %@, total active: %lu", buf, 0x16u);
    }

    id v7 = v9;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = [v7 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "New XPC connection for PID %i", buf, 8u);
  }
  objc_initWeak(&location, v7);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100005AB4;
  v39[3] = &unk_1003F13C0;
  v30 = &v40;
  objc_copyWeak(&v40, &location);
  v39[4] = self;
  [v7 setInvalidationHandler:v39];
  connections = self->_connections;
  if (connections)
  {
    uint64_t v13 = connections;
    objc_sync_enter(v13);
    uint64_t v14 = +[NSCountedSet set];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v15 = [(NSMapTable *)self->_connections keyEnumerator];
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v36;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = [(NSMapTable *)self->_connections objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          if (v19) {
            [v14 addObject:v19];
          }
        }
        id v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v16);
    }

    id v28 = v6;
    v29 = v13;
    id v27 = v7;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = v14;
    id v21 = [v20 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v32;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v20);
          }
          NSUInteger v24 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
          id v25 = objc_msgSend(v20, "countForObject:", v24, v27, v28, v29, v30);
          if ((unint64_t)v25 >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            id v45 = v25;
            __int16 v46 = 2112;
            NSUInteger v47 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Too many XPC connections (%lu) from %@", buf, 0x16u);
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v21);
    }

    id v7 = v27;
    id v6 = v28;

    objc_sync_exit(v29);
  }
  objc_msgSend(v7, "resume", v27, v28, v29);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_sharedXPCService, 0);
}

@end