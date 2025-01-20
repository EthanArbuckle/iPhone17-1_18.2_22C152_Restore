@interface ICRemoteCameraDeviceManager
- (BOOL)addRemoteCameraDevice:(id)a3 uuidString:(id)a4 deviceName:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)remoteManagerConnectionWithProcessIdentifierAuthorized:(int)a3;
- (BOOL)removeRemoteCameraDevice:(id)a3;
- (BOOL)startDeviceNotifications;
- (BOOL)systemDaemon;
- (NSMutableArray)remoteCameraDevices;
- (NSMutableDictionary)osTransactions;
- (NSMutableDictionary)remoteManagerConnections;
- (NSString)managedObjectName;
- (id)initManaging:(id)a3 systemDaemon:(BOOL)a4;
- (id)remoteDeviceForPrimaryIdentifier:(id)a3;
- (id)remoteDeviceForUUID:(id)a3;
- (os_unfair_lock_s)remoteCameraDevicesLock;
- (os_unfair_lock_s)remoteManagerConnectionsLock;
- (void)addRemoteManagerConnection:(id)a3;
- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5;
- (void)closeDevice:(id)a3;
- (void)dealloc;
- (void)ejectDevice:(id)a3 withReply:(id)a4;
- (void)notifyClientDeviceAdded:(id)a3 uuidString:(id)a4 deviceName:(id)a5;
- (void)notifyClientDeviceRemoved:(id)a3;
- (void)openDevice:(id)a3 withReply:(id)a4;
- (void)removeRemoteManagerConnectionWithProcessIdentifier:(int)a3;
- (void)requestDeviceListWithOptions:(id)a3 reply:(id)a4;
- (void)setManagedObjectName:(id)a3;
- (void)setOsTransactions:(id)a3;
- (void)setRemoteCameraDevices:(id)a3;
- (void)setRemoteCameraDevicesLock:(os_unfair_lock_s)a3;
- (void)setRemoteManagerConnections:(id)a3;
- (void)setRemoteManagerConnectionsLock:(os_unfair_lock_s)a3;
- (void)setSystemDaemon:(BOOL)a3;
- (void)updateRemoteManagerConnectionWithProcessIdentifier:(int)a3 authorized:(BOOL)a4;
@end

@implementation ICRemoteCameraDeviceManager

- (id)initManaging:(id)a3 systemDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICRemoteCameraDeviceManager;
  v7 = [(ICRemoteCameraDeviceManager *)&v15 init];
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    remoteManagerConnections = v7->_remoteManagerConnections;
    v7->_remoteManagerConnections = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    remoteCameraDevices = v7->_remoteCameraDevices;
    v7->_remoteCameraDevices = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    osTransactions = v7->_osTransactions;
    v7->_osTransactions = v12;

    v7->_remoteManagerConnectionsLock._os_unfair_lock_opaque = 0;
    v7->_remoteCameraDevicesLock._os_unfair_lock_opaque = 0;
    [(ICRemoteCameraDeviceManager *)v7 setSystemDaemon:v4];
    [(ICRemoteCameraDeviceManager *)v7 setManagedObjectName:v6];
  }

  return v7;
}

- (void)dealloc
{
  if (self->_remoteManagerConnections)
  {
    [(ICRemoteCameraDeviceManager *)self removeRemoteManagerConnectionWithProcessIdentifier:0xFFFFFFFFLL];
    remoteManagerConnections = self->_remoteManagerConnections;
    self->_remoteManagerConnections = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICRemoteCameraDeviceManager;
  [(ICRemoteCameraDeviceManager *)&v4 dealloc];
}

- (id)remoteDeviceForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_remoteCameraDevices copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "uuidString", (void)v14);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)remoteDeviceForPrimaryIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_remoteCameraDevices copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "primaryIdentifierString", (void)v14);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)removeRemoteCameraDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_remoteCameraDevicesLock);
  id v5 = [(ICRemoteCameraDeviceManager *)self remoteDeviceForPrimaryIdentifier:v4];
  if (v5)
  {
    __ICOSLogCreate();
    id v7 = [(ICRemoteCameraDeviceManager *)self managedObjectName];
    if ((unint64_t)[v7 length] >= 0x15)
    {
      uint64_t v8 = objc_msgSend(v7, "substringWithRange:", 0, 18);
      uint64_t v9 = [v8 stringByAppendingString:@".."];

      id v7 = (void *)v9;
    }
    v10 = +[NSString stringWithFormat:@"close device"];
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v7;
      v13 = v11;
      int v16 = 136446466;
      id v17 = [v12 UTF8String];
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v16, 0x16u);
    }
    long long v14 = [v5 uuidString];
    [(ICRemoteCameraDeviceManager *)self closeDevice:v14];
  }
  os_unfair_lock_unlock(&self->_remoteCameraDevicesLock);

  return v5 != 0;
}

- (BOOL)addRemoteCameraDevice:(id)a3 uuidString:(id)a4 deviceName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_remoteCameraDevicesLock);
  v11 = [(ICRemoteCameraDeviceManager *)self remoteDeviceForPrimaryIdentifier:v8];

  if (!v11)
  {
    id v12 = [[ICRemoteCameraDeviceProxy alloc] initWithPrimaryIdentifierString:v8 uuidString:v9 localizedName:v10];
    [(NSMutableArray *)self->_remoteCameraDevices addObject:v12];
  }
  os_unfair_lock_unlock(&self->_remoteCameraDevicesLock);

  return v11 == 0;
}

- (void)notifyClientDeviceAdded:(id)a3 uuidString:(id)a4 deviceName:(id)a5
{
  id v8 = a3;
  if ([(ICRemoteCameraDeviceManager *)self addRemoteCameraDevice:v8 uuidString:a4 deviceName:a5])
  {
    id v20 = v8;
    v21 = [(ICRemoteCameraDeviceManager *)self remoteDeviceForPrimaryIdentifier:v8];
    os_unfair_lock_t lock = &self->_remoteManagerConnectionsLock;
    os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obj = self->_remoteManagerConnections;
    id v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteManagerConnections, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * (void)v12), lock);
          long long v14 = [v13 objectForKeyedSubscript:@"ICRemoteManagerConnection"];
          long long v15 = [v13 objectForKeyedSubscript:@"ICRemoteManagerAuthorized"];
          unsigned int v16 = [v15 BOOLValue];

          if (v16)
          {
            id v17 = [v14 remoteObjectProxyWithErrorHandler:&stru_1000348E0];
            __int16 v18 = [v21 deviceContext];
            [v17 notifyAddedDevice:v18];
          }
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    os_unfair_lock_unlock(lock);
    id v8 = v20;
  }
}

- (void)notifyClientDeviceRemoved:(id)a3
{
  id v4 = a3;
  id v17 = [(ICRemoteCameraDeviceManager *)self remoteDeviceForPrimaryIdentifier:v4];
  if (v17)
  {
    os_unfair_lock_t lock = &self->_remoteManagerConnectionsLock;
    id v16 = v4;
    os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obj = self->_remoteManagerConnections;
    id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteManagerConnections, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v8), lock);
          id v10 = [v9 objectForKeyedSubscript:@"ICRemoteManagerConnection"];
          uint64_t v11 = [v9 objectForKeyedSubscript:@"ICRemoteManagerAuthorized"];
          unsigned int v12 = [v11 BOOLValue];

          if (v12)
          {
            v13 = [v10 remoteObjectProxyWithErrorHandler:&stru_100034900];
            long long v14 = [v17 deviceContext];
            [v13 notifyRemovedDevice:v14];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    os_unfair_lock_unlock(lock);
    id v4 = v16;
    [(ICRemoteCameraDeviceManager *)self removeRemoteCameraDevice:v16];
  }
}

- (void)requestDeviceListWithOptions:(id)a3 reply:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A99C;
  v5[3] = &unk_100034928;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)openDevice:(id)a3 withReply:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ACC8;
  block[3] = &unk_100034950;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)closeDevice:(id)a3
{
  id v4 = a3;
  id v6 = [(ICRemoteCameraDeviceManager *)self remoteDeviceForUUID:v4];
  if (v6)
  {
    __ICOSLogCreate();
    uint64_t v7 = [(ICRemoteCameraDeviceManager *)self managedObjectName];
    if ((unint64_t)[v7 length] >= 0x15)
    {
      id v8 = objc_msgSend(v7, "substringWithRange:", 0, 18);
      uint64_t v9 = [v8 stringByAppendingString:@".."];

      uint64_t v7 = (void *)v9;
    }
    id v10 = +[NSString stringWithFormat:@"close: %@", v4];
    uint64_t v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v7;
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      id v16 = [v12 UTF8String];
      __int16 v17 = 2114;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    long long v14 = [v6 camera];
    [v14 removeAllSessions];

    [(NSMutableArray *)self->_remoteCameraDevices removeObject:v6];
  }
}

- (void)ejectDevice:(id)a3 withReply:(id)a4
{
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = qword_1000447E0;
  id v8 = (NSString *)a4;
  id v11 = a3;
  if (v7 != -1) {
    dispatch_once(&qword_1000447E0, &stru_100034970);
  }
  uint64_t v9 = qword_1000447D8;
  SEL v10 = NSSelectorFromString(v8);

  [v11 setClasses:v9 forSelector:v10 argumentIndex:0 ofReply:v5];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  __ICOSLogCreate();
  id v6 = @"remoteManager";
  if ((unint64_t)[@"remoteManager" length] >= 0x15)
  {
    uint64_t v7 = objc_msgSend(@"remoteManager", "substringWithRange:", 0, 18);
    id v6 = [v7 stringByAppendingString:@".."];
  }
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"New Connection: %d", [v5 processIdentifier]);
  uint64_t v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    SEL v10 = v6;
    id v11 = v9;
    *(_DWORD *)buf = 136446466;
    id v16 = [(__CFString *)v10 UTF8String];
    __int16 v17 = 2114;
    __int16 v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICXPCDeviceManagerProtocol];
  v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICXPCDeviceManagerProtocol];
  [(ICRemoteCameraDeviceManager *)self addSelectorToInterface:v12 selectorString:@"requestDeviceListWithOptions:reply:" origin:1];
  [(ICRemoteCameraDeviceManager *)self addSelectorToInterface:v12 selectorString:@"openDevice:withReply:" origin:1];
  [(ICRemoteCameraDeviceManager *)self addSelectorToInterface:v12 selectorString:@"closeDevice:withReply:" origin:1];
  [(ICRemoteCameraDeviceManager *)self addSelectorToInterface:v13 selectorString:@"notifyAddedDevice:" origin:0];
  [(ICRemoteCameraDeviceManager *)self addSelectorToInterface:v13 selectorString:@"notifyRemovedDevice:" origin:0];
  [v5 setExportedInterface:v12];
  [v5 setRemoteObjectInterface:v13];
  [v5 setExportedObject:self];
  [(ICRemoteCameraDeviceManager *)self addRemoteManagerConnection:v5];
  [v5 resume];

  return 1;
}

- (void)addRemoteManagerConnection:(id)a3
{
  id v4 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10000BCD0;
  v25[4] = sub_10000BCE0;
  id v5 = self;
  long long v26 = v5;
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 processIdentifier]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000BCE8;
  v22[3] = &unk_100034998;
  long long v24 = v25;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = v20;
  [v4 setInvalidationHandler:v22];
  id v6 = [v4 invalidationHandler];
  [v4 setInterruptionHandler:v6];

  memset(&error[1], 0, 32);
  if (v4) {
    [v4 auditToken];
  }
  audit_token_t token = *(audit_token_t *)&error[1];
  uint64_t v7 = SecTaskCreateWithAuditToken(0, &token);
  error[0] = 0;
  id v8 = (__CFString *)SecTaskCopySigningIdentifier(v7, error);
  if (v7) {
    CFRelease(v7);
  }
  os_unfair_lock_lock(&v5->_remoteManagerConnectionsLock);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%05d-%@", [v4 processIdentifier], v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  [v9 UTF8String];
  SEL v10 = (void *)os_transaction_create();
  [(NSMutableDictionary *)v5->_osTransactions setObject:v10 forKeyedSubscript:v9];
  __ICOSLogCreate();
  id v11 = [(ICRemoteCameraDeviceManager *)v5 managedObjectName];
  if ((unint64_t)[v11 length] >= 0x15)
  {
    id v12 = objc_msgSend(v11, "substringWithRange:", 0, 18);
    uint64_t v13 = [v12 stringByAppendingString:@".."];

    id v11 = (void *)v13;
  }
  long long v14 = [(ICRemoteCameraDeviceManager *)v5 osTransactions];
  long long v15 = [v14 allKeys];
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"+ %@:[%05lu]", v9, [v15 count]);

  __int16 v17 = (id)_gICOSLog;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v11 UTF8String];
    token.val[0] = 136446466;
    *(void *)&token.val[1] = v18;
    LOWORD(token.val[3]) = 2114;
    *(void *)((char *)&token.val[3] + 2) = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
  }

  long long v19 = +[NSMutableDictionary dictionary];
  [v19 setObject:v4 forKeyedSubscript:@"ICRemoteManagerConnection"];
  [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ICRemoteManagerAuthorized"];
  [(NSMutableDictionary *)v5->_remoteManagerConnections setObject:v19 forKeyedSubscript:v9];
  os_unfair_lock_unlock(&v5->_remoteManagerConnectionsLock);

  _Block_object_dispose(v25, 8);
}

- (void)removeRemoteManagerConnectionWithProcessIdentifier:(int)a3
{
  id v4 = self;
  os_unfair_lock_t lock = &self->_remoteManagerConnectionsLock;
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  id v5 = [(NSMutableDictionary *)v4->_remoteManagerConnections copy];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v55;
    int v48 = a3;
    uint64_t v46 = *(void *)v55;
    id v47 = v6;
    do
    {
      SEL v10 = 0;
      id v49 = v8;
      do
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v54 + 1) + 8 * (void)v10);
        id v12 = [v6 objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 objectForKeyedSubscript:@"ICRemoteManagerConnection"];
        unsigned int v14 = [v13 processIdentifier];
        if (a3 == -1 || v14 == a3)
        {
          long long v15 = [(ICRemoteCameraDeviceManager *)v4 osTransactions];
          [v15 removeObjectForKey:v11];

          __ICOSLogCreate();
          id v16 = [(ICRemoteCameraDeviceManager *)v4 managedObjectName];
          if ((unint64_t)[v16 length] >= 0x15)
          {
            __int16 v17 = objc_msgSend(v16, "substringWithRange:", 0, 18);
            uint64_t v18 = [v17 stringByAppendingString:@".."];

            id v16 = (void *)v18;
          }
          long long v19 = v4;
          id v20 = [(ICRemoteCameraDeviceManager *)v4 osTransactions];
          long long v21 = [v20 allKeys];
          long long v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"- %@:[%05lu]", v11, [v21 count]);

          id v23 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = v16;
            long long v25 = v23;
            id v26 = [v24 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v60 = v26;
            __int16 v61 = 2114;
            v62 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          [v13 setInvalidationHandler:0];
          [v13 setInterruptionHandler:0];
          [v13 invalidate];
          id v4 = v19;
          [(NSMutableDictionary *)v19->_remoteManagerConnections removeObjectForKey:v11];
          a3 = v48;
          uint64_t v9 = v46;
          id v6 = v47;
          id v8 = v49;
        }

        SEL v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v8);
  }

  if (v4->_systemDaemon && ![(NSMutableDictionary *)v4->_remoteManagerConnections count])
  {
    v27 = v4;
    id v28 = [(NSMutableArray *)v4->_remoteCameraDevices copy];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v51;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v51 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v50 + 1) + 8 * i) camera];
          [v34 closeDevice];
        }
        id v31 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v31);
    }

    os_unfair_lock_unlock(lock);
    v35 = [(ICRemoteCameraDeviceManager *)v27 managedObjectName];
    v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-[D]", v35);

    __ICOSLogCreate();
    id v37 = v36;
    v38 = v37;
    if ((unint64_t)[v37 length] >= 0x15)
    {
      v39 = objc_msgSend(v37, "substringWithRange:", 0, 18);
      v38 = [v39 stringByAppendingString:@".."];
    }
    v40 = +[NSString stringWithFormat:@"Exiting %@", v37];
    v41 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = v38;
      v43 = v41;
      id v44 = [v42 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v60 = v44;
      __int16 v61 = 2114;
      v62 = v40;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    exit(0);
  }
  os_unfair_lock_unlock(lock);
}

- (void)updateRemoteManagerConnectionWithProcessIdentifier:(int)a3 authorized:(BOOL)a4
{
  BOOL v15 = a4;
  p_remoteManagerConnectionsLock = &self->_remoteManagerConnectionsLock;
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->_remoteManagerConnections;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(NSMutableDictionary *)self->_remoteManagerConnections objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        uint64_t v13 = [v12 objectForKeyedSubscript:@"ICRemoteManagerConnection"];
        if ([v13 processIdentifier] == a3)
        {
          unsigned int v14 = +[NSNumber numberWithBool:v15];
          [v12 setObject:v14 forKeyedSubscript:@"ICRemoteManagerAuthorized"];

          goto LABEL_11;
        }
      }
      id v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_remoteManagerConnectionsLock);
}

- (BOOL)remoteManagerConnectionWithProcessIdentifierAuthorized:(int)a3
{
  p_remoteManagerConnectionsLock = &self->_remoteManagerConnectionsLock;
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_remoteManagerConnections;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteManagerConnections, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        id v12 = [v11 objectForKeyedSubscript:@"ICRemoteManagerConnection"];
        if ([v12 processIdentifier] == a3)
        {
          unsigned int v14 = [v11 objectForKeyedSubscript:@"ICRemoteManagerAuthorized"];
          unsigned __int8 v13 = [v14 BOOLValue];

          goto LABEL_11;
        }
      }
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v13 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_remoteManagerConnectionsLock);
  return v13;
}

- (NSMutableDictionary)remoteManagerConnections
{
  return self->_remoteManagerConnections;
}

- (void)setRemoteManagerConnections:(id)a3
{
}

- (NSMutableArray)remoteCameraDevices
{
  return self->_remoteCameraDevices;
}

- (void)setRemoteCameraDevices:(id)a3
{
}

- (NSMutableDictionary)osTransactions
{
  return self->_osTransactions;
}

- (void)setOsTransactions:(id)a3
{
}

- (BOOL)systemDaemon
{
  return self->_systemDaemon;
}

- (void)setSystemDaemon:(BOOL)a3
{
  self->_systemDaemon = a3;
}

- (NSString)managedObjectName
{
  return self->_managedObjectName;
}

- (void)setManagedObjectName:(id)a3
{
}

- (os_unfair_lock_s)remoteManagerConnectionsLock
{
  return self->_remoteManagerConnectionsLock;
}

- (void)setRemoteManagerConnectionsLock:(os_unfair_lock_s)a3
{
  self->_remoteManagerConnectionsLock = a3;
}

- (os_unfair_lock_s)remoteCameraDevicesLock
{
  return self->_remoteCameraDevicesLock;
}

- (void)setRemoteCameraDevicesLock:(os_unfair_lock_s)a3
{
  self->_remoteCameraDevicesLock = a3;
}

- (BOOL)startDeviceNotifications
{
  return self->_startDeviceNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectName, 0);
  objc_storeStrong((id *)&self->_osTransactions, 0);
  objc_storeStrong((id *)&self->_remoteCameraDevices, 0);

  objc_storeStrong((id *)&self->_remoteManagerConnections, 0);
}

@end