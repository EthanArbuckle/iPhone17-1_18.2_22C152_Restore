@interface HMCAMDEmbeddedDeviceService
+ (id)logCategory;
+ (void)confirmSemaphoreAndSignal:(id)a3;
- (BOOL)directInvocations;
- (BOOL)isRoot;
- (BOOL)isValid;
- (BOOL)testCommunication;
- (HMCAMDBlockManager)blockInvoker;
- (HMCAMDEmbeddedDeviceService)init;
- (id)_initAsRoot:(BOOL)a3;
- (id)initAsMobile;
- (id)initAsRoot;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)logIdentifier;
- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)requestTimeout;
- (void)_fireActualBlockWithArguments:(id)a3 forKey:(id)a4;
- (void)_performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 reply:(id)a6;
- (void)_removeActualBlockForKey:(id)a3;
- (void)_testCommunication:(id)a3;
- (void)blockReleased:(id)a3;
- (void)dealloc;
- (void)resetConnection;
- (void)setDirectInvocations:(BOOL)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRequestTimeout:(unint64_t)a3;
- (void)start;
@end

@implementation HMCAMDEmbeddedDeviceService

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_invalidationHandler + 1), 0);
  objc_storeStrong((id *)((char *)&self->_interruptionHandler + 1), 0);
  objc_storeStrong((id *)((char *)&self->_requestTimeout + 1), 0);

  objc_storeStrong((id *)(&self->super._filterNSDataLogging + 1), 0);
}

- (HMCAMDBlockManager)blockInvoker
{
  return (HMCAMDBlockManager *)objc_getProperty(self, a2, 65, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 57, 1);
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 49, 1);
}

- (void)setRequestTimeout:(unint64_t)a3
{
  *(void *)&self->_isValid = a3;
}

- (unint64_t)requestTimeout
{
  return *(void *)&self->_isValid;
}

- (void)setDirectInvocations:(BOOL)a3
{
  BYTE3(self->_backoffTimer) = a3;
}

- (BOOL)directInvocations
{
  return BYTE3(self->_backoffTimer) & 1;
}

- (BOOL)isValid
{
  return BYTE2(self->_backoffTimer) & 1;
}

- (BOOL)isRoot
{
  return BYTE1(self->_backoffTimer) & 1;
}

- (id)logIdentifier
{
  return @"HMDCAMDEmbeddedDeviceService";
}

- (void)_testCommunication:(id)a3
{
}

- (void)_performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  v14 = +[NSMutableArray array];
  if (v12)
  {
    v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000177C0;
    v24[3] = &unk_10002CD28;
    v24[4] = self;
    id v25 = v14;
    id v16 = v15;
    id v26 = v16;
    [v12 enumerateObjectsUsingBlock:v24];
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMCAMDEmbeddedDeviceService;
  id v23 = 0;
  v18 = [(HMCAMDEmbeddedDevice *)&v22 performCommandFromClass:v10 method:v11 arguments:v17 error:&v23];
  id v19 = v23;
  if (v19 && [v14 count])
  {
    v20 = +[NSNotificationCenter defaultCenter];
    CFStringRef v27 = @"blocks";
    v28 = v14;
    v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    [v20 postNotificationName:@"kCAMDBlockReleasedNotification" object:0 userInfo:v21];
  }
  v13[2](v13, v18, v19);
}

- (void)_removeActualBlockForKey:(id)a3
{
  id v4 = a3;
  [*(id *)((char *)&self->_invalidationHandler + 1) removeBlockForKey:v4];
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)((char *)&self->_invalidationHandler + 1) count];
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2048;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Removed block (%lu) on client for key %@.", (uint8_t *)&v10, 0x20u);
  }
}

- (void)_fireActualBlockWithArguments:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Firing block on client for key %@.", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)((char *)&v9->_invalidationHandler + 1) invokeForwardedBlockWithArguments:v6 forKey:v7];
}

- (BOOL)testCommunication
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v4 = *(void *)&self->_isValid;
  *(void *)&self->_isValid = 5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100017EF0;
  v15[3] = &unk_10002CCB0;
  id v17 = &v18;
  v5 = v3;
  id v16 = v5;
  id v6 = objc_retainBlock(v15);
  id v7 = [(HMCAMDEmbeddedDeviceService *)self remoteObjectProxyWithErrorHandler:v6];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017F10;
  v12[3] = &unk_10002CD00;
  __int16 v14 = &v18;
  v8 = v5;
  id v13 = v8;
  [v7 _testCommunication:v12];

  dispatch_time_t v9 = dispatch_time(0, 1000000000 * *(void *)&self->_isValid);
  if (dispatch_semaphore_wait(v8, v9))
  {
    BOOL v10 = 0;
    *((unsigned char *)v19 + 24) = 0;
  }
  else
  {
    BOOL v10 = *((unsigned char *)v19 + 24) != 0;
  }
  *(void *)&self->_isValid = v4;

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (BYTE2(self->_backoffTimer))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000;
    v41 = sub_10001701C;
    v42 = sub_10001702C;
    id v43 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_10001701C;
    v37 = sub_10001702C;
    id v38 = 0;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000182EC;
    v30[3] = &unk_10002CCB0;
    v32 = &v33;
    id v13 = dispatch_semaphore_create(0);
    v31 = v13;
    __int16 v14 = objc_retainBlock(v30);
    id v15 = [(HMCAMDEmbeddedDeviceService *)self remoteObjectProxyWithErrorHandler:v14];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100018344;
    v26[3] = &unk_10002CCD8;
    p_long long buf = &buf;
    v29 = &v33;
    id v16 = v13;
    CFStringRef v27 = v16;
    [v15 _performCommandFromClass:v10 method:v11 arguments:v12 reply:v26];

    dispatch_time_t v17 = dispatch_time(0, 1000000000 * *(void *)&self->_isValid);
    intptr_t v18 = dispatch_semaphore_wait(v16, v17);
    if (a6 && v18)
    {
      id v19 = +[NSError hmfErrorWithCode:13];
    }
    else
    {
      if (!a6)
      {
LABEL_12:
        id v24 = *(id *)(*((void *)&buf + 1) + 40);

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_13;
      }
      id v19 = (id) v34[5];
    }
    *a6 = v19;
    goto LABEL_12;
  }
  char v21 = self;
  objc_super v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@Attempted to invoke a service command when HMDCAMDEmbeddedDeviceService is not started or connection is invalid. Start the service and then retry.", (uint8_t *)&buf, 0xCu);
  }
  if (a6)
  {
    +[NSError hmfErrorWithCode:11];
    id v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v24 = 0;
  }
LABEL_13:

  return v24;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = *(void **)(&self->super._filterNSDataLogging + 1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018490;
  v9[3] = &unk_10002CC88;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)remoteObjectProxy
{
  return [(HMCAMDEmbeddedDeviceService *)self remoteObjectProxyWithErrorHandler:0];
}

- (void)resetConnection
{
  v2 = self;
  objc_sync_enter(v2);
  if (!BYTE2(v2->_backoffTimer))
  {
    id v4 = v2;
    HMFGetOSLogHandle();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(uint64_t *)((char *)&v4->_connection + 1);
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting connection to server (waited %lu seconds).", (uint8_t *)&v9, 0x16u);
    }
    *(NSXPCConnection **)((char *)&v4->_connection + 1) = (NSXPCConnection *)(*(uint64_t *)((char *)&v4->_connection + 1)
                                                                            * 2);
    v8 = *(void **)(&v4->super._filterNSDataLogging + 1);
    if (v8)
    {
      *(void *)(&v4->super._filterNSDataLogging + 1) = 0;

      BYTE2(v2->_backoffTimer) = 0;
    }
    [(HMCAMDEmbeddedDeviceService *)v4 start];
  }
  objc_sync_exit(v2);
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (*(void *)(&v2->super._filterNSDataLogging + 1) && BYTE2(v2->_backoffTimer))
  {
    id v4 = v2;
    HMFGetOSLogHandle();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      CFStringRef v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Server connection already started and valid. Reset connection if needed.", buf, 0xCu);
    }
  }
  else
  {
    *(NSXPCConnection **)((char *)&v2->_connection + 1) = (NSXPCConnection *)2;
    if (BYTE1(v2->_backoffTimer)) {
      uint64_t v7 = @"com.apple.coreautomationd.xpc.root";
    }
    else {
      uint64_t v7 = @"com.apple.coreautomationd.xpc.mobile";
    }
    v8 = v7;
    id v10 = v2;
    HMFGetOSLogHandle();
    __int16 v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      CFStringRef v27 = v12;
      __int16 v28 = 2112;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Starting connection to service %@.", buf, 0x16u);
    }
    id v13 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v8 options:4096];
    __int16 v14 = *(void **)(&v2->super._filterNSDataLogging + 1);
    *(void *)(&v2->super._filterNSDataLogging + 1) = v13;

    id v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___HMCAMDEmbeddedDeviceServerProxy];
    [*(id *)(&v2->super._filterNSDataLogging + 1) setRemoteObjectInterface:v15];

    id v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___HMCAMDEmbeddedDeviceClientProxy];
    [*(id *)(&v2->super._filterNSDataLogging + 1) setExportedInterface:v16];

    [*(id *)(&v2->super._filterNSDataLogging + 1) setExportedObject:v10];
    objc_initWeak((id *)buf, v10);
    dispatch_time_t v17 = *(void **)(&v2->super._filterNSDataLogging + 1);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100018B18;
    v24[3] = &unk_10002CC60;
    objc_copyWeak(&v25, (id *)buf);
    [v17 setInvalidationHandler:v24];
    intptr_t v18 = *(void **)(&v2->super._filterNSDataLogging + 1);
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    char v21 = sub_100018CA0;
    objc_super v22 = &unk_10002CC60;
    objc_copyWeak(&v23, (id *)buf);
    [v18 setInterruptionHandler:&v19];
    objc_msgSend(*(id *)(&v2->super._filterNSDataLogging + 1), "resume", v19, v20, v21, v22);
    BYTE2(v10->_backoffTimer) = 1;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v2);
}

- (void)blockReleased:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"blocks"];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100019210;
    v7[3] = &unk_10002CC38;
    v7[4] = self;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)dealloc
{
  dispatch_semaphore_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"kCAMDBlockReleasedNotification" object:0];

  id v4 = *(void **)(&self->super._filterNSDataLogging + 1);
  if (v4 && BYTE2(self->_backoffTimer)) {
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)HMCAMDEmbeddedDeviceService;
  [(HMCAMDEmbeddedDeviceService *)&v5 dealloc];
}

- (id)initAsMobile
{
  return [(HMCAMDEmbeddedDeviceService *)self init];
}

- (id)initAsRoot
{
  return [(HMCAMDEmbeddedDeviceService *)self _initAsRoot:1];
}

- (HMCAMDEmbeddedDeviceService)init
{
  return (HMCAMDEmbeddedDeviceService *)[(HMCAMDEmbeddedDeviceService *)self _initAsRoot:0];
}

- (id)_initAsRoot:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HMCAMDEmbeddedDeviceService;
  id v4 = [(HMCAMDEmbeddedDevice *)&v10 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4[33] = a3;
    v4[34] = 0;
    v4[35] = 1;
    *(void *)(v4 + 41) = 900;
    *(void *)(v4 + 25) = 2;
    id v6 = [[HMCAMDBlockManager alloc] initWithService:v4];
    uint64_t v7 = *(void **)(v5 + 65);
    *(void *)(v5 + 65) = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"blockReleased:" name:@"kCAMDBlockReleasedNotification" object:0];
  }
  return v5;
}

+ (id)logCategory
{
  if (qword_100036CD0 != -1) {
    dispatch_once(&qword_100036CD0, &stru_10002CD48);
  }
  v2 = (void *)qword_100036CD8;

  return v2;
}

+ (void)confirmSemaphoreAndSignal:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    dispatch_semaphore_signal(v4);
  }
  else
  {
    id v7 = a1;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      objc_super v10 = +[NSThread callStackSymbols];
      int v11 = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Semaphore [%p] is nil.\n%@", (uint8_t *)&v11, 0x20u);
    }
  }
}

@end