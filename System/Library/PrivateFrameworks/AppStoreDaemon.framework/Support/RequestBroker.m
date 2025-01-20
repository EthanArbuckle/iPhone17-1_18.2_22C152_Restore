@interface RequestBroker
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RequestBroker)init;
@end

@implementation RequestBroker

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v35 = a3;
  id v5 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = [&off_10054DEF0 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v6)
  {
    uint64_t v36 = *(void *)v44;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v44 != v36) {
        objc_enumerationMutation(&off_10054DEF0);
      }
      v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
      id v9 = v5;
      v10 = v8;
      self;
      unsigned int v11 = [v9 processIdentifier];
      *(_OWORD *)location = 0u;
      long long v49 = 0u;
      if (v5) {
        [v9 auditToken];
      }
      *(_OWORD *)token = *(_OWORD *)location;
      *(_OWORD *)&token[16] = v49;
      v12 = SecTaskCreateWithAuditToken(0, (audit_token_t *)token);
      v13 = v12;
      if (v12)
      {
        CFErrorRef error = 0;
        CFTypeRef v14 = SecTaskCopyValueForEntitlement(v12, v10, &error);
        if (error && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v21 = objc_opt_class();
          *(_DWORD *)token = 138413058;
          *(void *)&token[4] = v21;
          *(_WORD *)&token[12] = 2112;
          *(void *)&token[14] = v10;
          *(_WORD *)&token[22] = 1024;
          *(_DWORD *)&token[24] = v11;
          *(_WORD *)&token[28] = 2112;
          *(void *)&token[30] = error;
          id v22 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%@]: Unable to get entitlements: %@ for pid: %i error: %@", token, 0x26u);
        }
        if (v14)
        {
          CFTypeID TypeID = CFBooleanGetTypeID();
          BOOL v16 = TypeID == CFGetTypeID(v14) && CFBooleanGetValue((CFBooleanRef)v14) != 0;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_opt_class();
            *(_DWORD *)token = 138413058;
            *(void *)&token[4] = v19;
            *(_WORD *)&token[12] = 2112;
            *(void *)&token[14] = v10;
            *(_WORD *)&token[22] = 1024;
            *(_DWORD *)&token[24] = v11;
            *(_WORD *)&token[28] = 1024;
            *(_DWORD *)&token[30] = v16;
            id v20 = v19;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: We have the entitlement: %@ for pid: %i result: %d", token, 0x22u);
          }
          CFRelease(v14);
          CFRelease(v13);

          if (v16)
          {
            v25 = sub_10000B1C0((id *)[RequestBrokerClient alloc], v9);
            v26 = self;
            objc_sync_enter(v26);
            [(NSMutableSet *)v26->_clients addObject:v25];
            objc_sync_exit(v26);

            [v9 setExportedObject:v25];
            v27 = +[ASDRequestBroker interface];
            [v9 setExportedInterface:v27];

            objc_initWeak(location, v26);
            objc_initWeak((id *)&error, v25);
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_1002F9618;
            v40[3] = &unk_100524648;
            objc_copyWeak(&v41, location);
            objc_copyWeak(&v42, (id *)&error);
            [v9 setInvalidationHandler:v40];
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472;
            v37[2] = sub_1002F9798;
            v37[3] = &unk_100524648;
            objc_copyWeak(&v38, location);
            objc_copyWeak(&v39, (id *)&error);
            [v9 setInterruptionHandler:v37];
            [v9 resume];
            id v28 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v29 = objc_opt_class();
              *(_DWORD *)token = 138412546;
              *(void *)&token[4] = v29;
              *(_WORD *)&token[12] = 2112;
              *(void *)&token[14] = v25;
              id v30 = v29;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[%@]: Broker client connected: %@", token, 0x16u);
            }
            objc_destroyWeak(&v39);
            objc_destroyWeak(&v38);
            objc_destroyWeak(&v42);
            objc_destroyWeak(&v41);
            objc_destroyWeak((id *)&error);
            objc_destroyWeak(location);

            BOOL v24 = 1;
            goto LABEL_31;
          }
          goto LABEL_23;
        }
        CFRelease(v13);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        *(_DWORD *)token = 138412802;
        *(void *)&token[4] = v17;
        *(_WORD *)&token[12] = 2112;
        *(void *)&token[14] = v10;
        *(_WORD *)&token[22] = 1024;
        *(_DWORD *)&token[24] = v11;
        id v18 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%@]: No task for entitlement: %@ pid: %i", token, 0x1Cu);
      }
LABEL_23:
      if (v6 == (id)++v7)
      {
        id v6 = [&off_10054DEF0 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  unsigned int v23 = [v5 processIdentifier];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v32 = objc_opt_class();
    *(_DWORD *)token = 138412546;
    *(void *)&token[4] = v32;
    *(_WORD *)&token[12] = 1024;
    *(_DWORD *)&token[14] = v23;
    id v33 = v32;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%@]: Connection denied for pid: %i for non entitled client", token, 0x12u);
  }
  BOOL v24 = 0;
LABEL_31:

  return v24;
}

- (RequestBroker)init
{
  v10.receiver = self;
  v10.super_class = (Class)RequestBroker;
  v2 = [(RequestBroker *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v3;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v5 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      id v6 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[%@]: Starting request broker", buf, 0xCu);
    }
    id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.appstored.xpc.request"];
    [v7 setDelegate:v2];
    [v7 resume];
    objc_setProperty_atomic(v2, v8, v7, 16);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end