@interface MailXPCServices
+ (id)log;
+ (id)sharedServer;
- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4;
- (Class)_serviceClassForName:(id)a3;
- (MailXPCServices)init;
- (void)_dispatchMessage:(id)a3 onQueue:(id)a4 connectionState:(id)a5 completion:(id)a6;
- (void)_enumerateServiceClasses:(id)a3;
- (void)_registerConnection:(id)a3;
- (void)dealloc;
- (void)registerServiceClass:(Class)a3;
- (void)start;
- (void)stop;
@end

@implementation MailXPCServices

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038CFC;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B898 != -1) {
    dispatch_once(&qword_10016B898, block);
  }
  v2 = (void *)qword_10016B890;

  return v2;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038E20;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B8A8 != -1) {
    dispatch_once(&qword_10016B8A8, block);
  }
  v2 = (void *)qword_10016B8A0;

  return v2;
}

- (MailXPCServices)init
{
  v13.receiver = self;
  v13.super_class = (Class)MailXPCServices;
  v2 = [(MailXPCServices *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobilemail.services", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    connections = v2->_connections;
    v2->_connections = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    services = v2->_services;
    v2->_services = v7;

    v9 = (NSLock *)objc_alloc_init((Class)NSLock);
    connectionsLock = v2->_connectionsLock;
    v2->_connectionsLock = v9;

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_listener) {
    [(MailXPCServices *)self stop];
  }
  v3.receiver = self;
  v3.super_class = (Class)MailXPCServices;
  [(MailXPCServices *)&v3 dealloc];
}

- (void)start
{
  if (self->_listener)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MailXPCServices.m" lineNumber:115 description:@"attempt to start server mutliple times"];
  }
  objc_super v3 = +[MailXPCServices log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "starting Mail xpc services", buf, 2u);
  }

  mach_service = xpc_connection_create_mach_service((const char *)[@"com.apple.mobilemail.services.xpc" UTF8String], (dispatch_queue_t)self->_queue, 1uLL);
  listener = self->_listener;
  self->_listener = mach_service;

  v6 = self->_listener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100039118;
  handler[3] = &unk_10013AD80;
  handler[4] = self;
  xpc_connection_set_event_handler(v6, handler);
  xpc_connection_resume(self->_listener);
}

- (void)stop
{
  objc_super v3 = +[MailXPCServices log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stopping maild legacy xpc services", v6, 2u);
  }

  v4 = self->_listener;
  xpc_connection_set_event_handler(v4, &stru_10013AF48);
  xpc_connection_cancel(v4);

  listener = self->_listener;
  self->_listener = 0;

  [(NSLock *)self->_connectionsLock lock];
  [(NSMutableArray *)self->_connections makeObjectsPerformSelector:"stop"];
  [(NSMutableArray *)self->_connections removeAllObjects];
  [(NSLock *)self->_connectionsLock unlock];
  [(MailXPCServices *)self _enumerateServiceClasses:&stru_10013ADC0];
}

- (void)_registerConnection:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  v5 = +[MailXPCServices log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    pid_t pid = xpc_connection_get_pid(v4);
    v7 = v4;
    v8 = xpc_copy_description(v7);
    if (v8) {
      v8 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v8 length:strlen(v8) encoding:4 freeWhenDone:1];
    }

    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = pid;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PID %d : new connection %@", buf, 0x12u);
  }
  v9 = [[MFXPCConnection alloc] initWithConnection:v4];
  [(MFXPCConnection *)v9 setServiceManager:self];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v9);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10003967C;
  objc_super v13 = &unk_10013ADE8;
  objc_copyWeak(&v15, (id *)buf);
  v14 = self;
  [(MFXPCConnection *)v9 setErrorHandler:&v10];
  [(NSLock *)self->_connectionsLock lock];
  [(NSMutableArray *)self->_connections addObject:v9];
  [(NSLock *)self->_connectionsLock unlock];
  [(MFXPCConnection *)v9 start];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a3;
  v6 = (__CFString *)a4;
  if (v6)
  {
    if (v5)
    {
      *(_OWORD *)buf = 0u;
      long long v21 = 0u;
      xpc_connection_get_audit_token();
      memset(&token, 0, sizeof(token));
      v7 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
      v8 = v7;
      if (v7)
      {
        CFErrorRef error = 0;
        unint64_t v9 = (unint64_t)SecTaskCopyValueForEntitlement(v7, v6, &error);
        if (objc_opt_respondsToSelector())
        {
          unsigned __int8 v10 = [(id)v9 BOOLValue];
LABEL_25:
          CFRelease(v8);

          goto LABEL_26;
        }
        if (v9 | (unint64_t)error)
        {
          if (!v9 && error)
          {
            v12 = +[MailXPCServices log];
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              sub_1000395E8(v5);
              objc_claimAutoreleasedReturnValue();
              sub_1000C0EEC();
            }

            CFRelease(error);
            goto LABEL_24;
          }
          objc_super v13 = +[MailXPCServices log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v16 = sub_1000395E8(v5);
            token.val[0] = 138412802;
            *(void *)&token.val[1] = v6;
            LOWORD(token.val[3]) = 2112;
            *(void *)((char *)&token.val[3] + 2) = v16;
            HIWORD(token.val[5]) = 2112;
            *(void *)&token.val[6] = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "entitlement '%@' on connection %@ had invalid value '%@'", (uint8_t *)&token, 0x20u);
          }
        }
        else
        {
          objc_super v13 = +[MailXPCServices log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = v5;
            id v15 = xpc_copy_description(v14);
            if (v15) {
              id v15 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v15 length:strlen(v15) encoding:4 freeWhenDone:1];
            }

            token.val[0] = 138412546;
            *(void *)&token.val[1] = v6;
            LOWORD(token.val[3]) = 2112;
            *(void *)((char *)&token.val[3] + 2) = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "entitlement '%@' missing on connection %@", (uint8_t *)&token, 0x16u);
          }
        }

LABEL_24:
        unsigned __int8 v10 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v11 = +[MailXPCServices log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "missing required connection to verify entitlement '%@'", buf, 0xCu);
      }
    }
    unsigned __int8 v10 = 0;
  }
  else
  {
    unsigned __int8 v10 = 1;
  }
LABEL_26:

  return v10;
}

- (void)_dispatchMessage:(id)a3 onQueue:(id)a4 connectionState:(id)a5 completion:(id)a6
{
  id v10 = a3;
  queue = a4;
  id v31 = a5;
  id v11 = a6;
  xpc_dictionary_get_remote_connection(v10);
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  objc_super v13 = +[MailXPCServices log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (v12) {
      pid_t pid = xpc_connection_get_pid(v12);
    }
    else {
      pid_t pid = -1;
    }
    int64_t int64 = xpc_dictionary_get_int64(v10, (const char *)[_MSMailServiceMessageIndex UTF8String]);
    id v16 = v10;
    __int16 v17 = xpc_copy_description(v16);
    if (v17) {
      __int16 v17 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v17 length:strlen(v17) encoding:4 freeWhenDone:1];
    }

    *(_DWORD *)buf = 67109890;
    pid_t v42 = pid;
    __int16 v43 = 2048;
    int64_t v44 = int64;
    __int16 v45 = 2048;
    v46 = v12;
    __int16 v47 = 2112;
    v48 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PID %d (%lld) : <connection: %p> handling message %@", buf, 0x26u);
  }
  string = xpc_dictionary_get_string(v10, (const char *)[_MSMailServiceName UTF8String]);
  if (string)
  {
    v19 = +[NSString stringWithUTF8String:string];
    v20 = [(MailXPCServices *)self _serviceClassForName:v19];

    if (v20)
    {
      long long v21 = [(objc_class *)v20 requiredEntitlement];
      unsigned __int8 v22 = [(MailXPCServices *)self _connection:v12 hasEntitlement:v21];

      if (v22)
      {
        v23 = 0;
      }
      else
      {
        v23 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:1504 userInfo:0];
      }
      goto LABEL_16;
    }
    uint64_t v24 = 1503;
  }
  else
  {
    uint64_t v24 = 1502;
  }
  v23 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:v24 userInfo:0];
  v20 = 0;
LABEL_16:
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10003A02C;
  v37[3] = &unk_10013AE10;
  id v25 = v10;
  id v38 = v25;
  v26 = v12;
  v39 = v26;
  id v27 = v11;
  id v40 = v27;
  v28 = objc_retainBlock(v37);
  v29 = v28;
  if (v23)
  {
    ((void (*)(void *, void, void, void *))v28[2])(v28, 0, 0, v23);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003A33C;
    block[3] = &unk_10013AE38;
    v36 = v20;
    id v33 = v25;
    id v34 = v31;
    id v35 = v29;
    dispatch_async(queue, block);
  }
}

- (void)registerServiceClass:(Class)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A498;
  block[3] = &unk_10013AE60;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a2;
  dispatch_barrier_async(queue, block);
}

- (Class)_serviceClassForName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2050000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A6EC;
  block[3] = &unk_10013AE88;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[3];

  _Block_object_dispose(&v12, 8);

  return (Class)v7;
}

- (void)_enumerateServiceClasses:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A7C4;
  v7[3] = &unk_10013AED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionsLock, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end