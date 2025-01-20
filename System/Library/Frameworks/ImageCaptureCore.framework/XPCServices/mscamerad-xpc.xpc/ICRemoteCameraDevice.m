@interface ICRemoteCameraDevice
- (BOOL)acceptConnection:(id)a3;
- (BOOL)evaulateCommonTCC:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICRemoteCameraDevice)initWithDeviceContext:(id)a3;
- (ICSessionManager)sessionManager;
- (NSArray)allConnections;
- (NSMutableArray)addedBundles;
- (NSMutableArray)deniedBundles;
- (NSMutableDictionary)cameraDictionary;
- (NSOperationQueue)deviceOperationQueue;
- (NSString)internalUUID;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)deviceOperationUnderlyingQueue;
- (id)additionalProperties;
- (id)delegate;
- (void)addInitiatedOperation:(id)a3;
- (void)addInteractiveOperation:(id)a3;
- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5;
- (void)cpPowerAssertion;
- (void)dealloc;
- (void)holdPowerAssertion;
- (void)registerInterestedEventNotifications:(id)a3;
- (void)releasePowerAssertion;
- (void)removeAllSessions;
- (void)removeSessionsWithProcessIdentifier:(id)a3;
- (void)sendAddedItemsNotification:(id)a3 toConnections:(id)a4;
- (void)sendNotification:(id)a3 toConnections:(id)a4 selector:(SEL)a5;
- (void)sendPTPEventNotification:(id)a3;
- (void)sendRemovedItemsNotification:(id)a3 toConnections:(id)a4;
- (void)sendStatusNotification:(id)a3 toConnections:(id)a4;
- (void)sendUpdatedItemsNotification:(id)a3 toConnections:(id)a4;
- (void)setAddedBundles:(id)a3;
- (void)setCameraDictionary:(id)a3;
- (void)setCpPowerAssertion:(void *)a3;
- (void)setDelegate:(id)a3;
- (void)setDeniedBundles:(id)a3;
- (void)setDeviceOperationQueue:(id)a3;
- (void)setDeviceOperationUnderlyingQueue:(id)a3;
- (void)setListener:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)startListening;
- (void)unregisterInterestedEventNotifications:(id)a3;
@end

@implementation ICRemoteCameraDevice

- (ICRemoteCameraDevice)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICRemoteCameraDevice;
  v5 = [(ICRemoteCameraDevice *)&v24 init];
  if (v5)
  {
    v6 = [[ICSessionManager alloc] initWithDelegate:v5];
    sessionManager = v5->_sessionManager;
    v5->_sessionManager = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cameraDictionary = v5->_cameraDictionary;
    v5->_cameraDictionary = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    deniedBundles = v5->_deniedBundles;
    v5->_deniedBundles = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    addedBundles = v5->_addedBundles;
    v5->_addedBundles = v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = [v4 objectForKeyedSubscript:@"ICDeviceName"];
    id v16 = +[NSString stringWithFormat:@"%@:%@", @"ICDeviceUnderlyingQueue", v15];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], v14);
    deviceOperationUnderlyingQueue = v5->_deviceOperationUnderlyingQueue;
    v5->_deviceOperationUnderlyingQueue = (OS_dispatch_queue *)v17;

    v19 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    deviceOperationQueue = v5->_deviceOperationQueue;
    v5->_deviceOperationQueue = v19;

    [(NSOperationQueue *)v5->_deviceOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_deviceOperationQueue setQualityOfService:25];
    v21 = [v4 objectForKeyedSubscript:@"ICDeviceName"];
    v22 = +[NSString stringWithFormat:@"%@:%@", @"ICDeviceOperationQueue", v21];
    [(NSOperationQueue *)v5->_deviceOperationQueue setName:v22];

    [(NSOperationQueue *)v5->_deviceOperationQueue setUnderlyingQueue:v5->_deviceOperationUnderlyingQueue];
  }

  return v5;
}

- (void)dealloc
{
  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)ICRemoteCameraDevice;
  [(ICRemoteCameraDevice *)&v3 dealloc];
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (NSString)internalUUID
{
  return (NSString *)[(NSMutableDictionary *)self->_cameraDictionary objectForKeyedSubscript:@"ICInternalDeviceUUID"];
}

- (void)startListening
{
  objc_super v3 = +[NSXPCListener anonymousListener];
  [(ICRemoteCameraDevice *)self setListener:v3];

  id v4 = [(ICRemoteCameraDevice *)self listener];
  [v4 setDelegate:self];

  id v5 = [(ICRemoteCameraDevice *)self listener];
  [v5 resume];
}

- (BOOL)acceptConnection:(id)a3
{
  return sub_100009A14(a3);
}

- (BOOL)evaulateCommonTCC:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  memset(&error[1], 0, 32);
  if (v4) {
    [v4 auditToken];
  }
  error[0] = 0;
  id v6 = [v5 processIdentifier];
  audit_token_t token = *(audit_token_t *)&error[1];
  v7 = SecTaskCreateWithAuditToken(0, &token);
  v8 = (__CFString *)SecTaskCopySigningIdentifier(v7, error);
  v9 = +[NSString stringWithFormat:@"%@-%d", v8, v6];
  if (v7) {
    CFRelease(v7);
  }
  v10 = +[ICDeviceAccessManager sharedAccessManager];
  if (!v10) {
    goto LABEL_8;
  }
  v11 = [(ICRemoteCameraDevice *)self addedBundles];
  unsigned __int8 v12 = [v11 containsObject:v9];

  if ((v12 & 1) != 0
    || ([(ICRemoteCameraDevice *)self deniedBundles],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 containsObject:v9],
        v13,
        (v14 & 1) != 0))
  {
LABEL_8:
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = [v10 bundleIdentifier:v8 stateForAccessType:@"read_access"] == (id)2;
    if (v15) {
      [(ICRemoteCameraDevice *)self addedBundles];
    }
    else {
    dispatch_queue_t v17 = [(ICRemoteCameraDevice *)self deniedBundles];
    }
    [v17 addObject:v9];
  }
  return v15;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if ([(ICRemoteCameraDevice *)self acceptConnection:v5])
  {
    id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICCameraDeviceProtocol];
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICCameraDeviceProtocol];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"imageCaptureEventNotification:completion:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"postNotification:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"notifyAddedItems:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"notifyRemovedItems:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"notifyUpdatedItems:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"notifyStatus:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"notifyPtpEvent:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"registerInterestedEventNotifications:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"unregisterInterestedEventNotifications:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestThumbnailDataForObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestMetadataForObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestDownloadObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestDeleteObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestReadDataFromObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestSecurityScopedURLForObjectHandle:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestFingerprintForObjectHandle:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v6 selectorString:@"requestRefreshObjectHandleInfo:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"imageCaptureEventNotification:completion:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"postNotification:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"notifyAddedItems:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"notifyRemovedItems:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"notifyUpdatedItems:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"notifyStatus:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"notifyPtpEvent:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"registerInterestedEventNotifications:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"unregisterInterestedEventNotifications:" origin:0];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestThumbnailDataForObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestMetadataForObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestDownloadObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestDeleteObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestReadDataFromObjectHandle:options:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestSecurityScopedURLForObjectHandle:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestFingerprintForObjectHandle:withReply:" origin:1];
    [(ICRemoteCameraDevice *)self addSelectorToInterface:v7 selectorString:@"requestRefreshObjectHandleInfo:withReply:" origin:1];
    [v5 setExportedInterface:v6];
    [v5 setRemoteObjectInterface:v7];
    [v5 setExportedObject:self];
    __ICOSLogCreate();
    v8 = @"sessionManager";
    if ((unint64_t)[@"sessionManager" length] >= 0x15)
    {
      v9 = objc_msgSend(@"sessionManager", "substringWithRange:", 0, 18);
      v8 = [v9 stringByAppendingString:@".."];
    }
    v10 = [(ICRemoteCameraDevice *)self sessionManager];
    v11 = +[NSString stringWithFormat:@"%@", v10];

    unsigned __int8 v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v8;
      unsigned __int8 v14 = v12;
      *(_DWORD *)buf = 136446466;
      id v19 = [(__CFString *)v13 UTF8String];
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    BOOL v15 = [(ICRemoteCameraDevice *)self sessionManager];
    unsigned int v16 = [v15 createSessionWithConnection:v5];

    if (v16) {
      [v5 resume];
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)additionalProperties
{
  return 0;
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = qword_100044820;
  v8 = (NSString *)a4;
  id v11 = a3;
  if (v7 != -1) {
    dispatch_once(&qword_100044820, &stru_100034CD8);
  }
  uint64_t v9 = qword_100044818;
  SEL v10 = NSSelectorFromString(v8);

  [v11 setClasses:v9 forSelector:v10 argumentIndex:0 ofReply:v5];
}

- (void)removeAllSessions
{
  id v2 = [(ICRemoteCameraDevice *)self sessionManager];
  [v2 removeAllSessions];
}

- (void)removeSessionsWithProcessIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICRemoteCameraDevice *)self sessionManager];
  [v5 removeSessionsWithProcessIdentifier:v4];
}

- (NSArray)allConnections
{
  id v2 = [(ICRemoteCameraDevice *)self sessionManager];
  objc_super v3 = [v2 connections];

  return (NSArray *)v3;
}

- (void)addInitiatedOperation:(id)a3
{
  id v6 = a3;
  id v4 = [(ICRemoteCameraDevice *)self deviceOperationQueue];

  if (v4)
  {
    [v6 setQueuePriority:0];
    [v6 setQualityOfService:25];
    id v5 = [(ICRemoteCameraDevice *)self deviceOperationQueue];
    [v5 addOperation:v6];
  }
}

- (void)addInteractiveOperation:(id)a3
{
  id v6 = a3;
  id v4 = [(ICRemoteCameraDevice *)self deviceOperationQueue];

  if (v4)
  {
    [v6 setQueuePriority:4];
    [v6 setQualityOfService:33];
    id v5 = [(ICRemoteCameraDevice *)self deviceOperationQueue];
    [v5 addOperation:v6];
  }
}

- (void)holdPowerAssertion
{
  if (!self->_cpPowerAssertion)
  {
    id v4 = [(ICRemoteCameraDevice *)self cameraDictionary];
    objc_super v3 = [v4 objectForKeyedSubscript:@"ICDeviceName"];
    +[NSString stringWithFormat:@"com.apple.mscamerad-xpc+%@", v3];
    self->_cpPowerAssertion = (void *)CPPowerAssertionCreate();
  }
}

- (void)releasePowerAssertion
{
  cpPowerAssertion = self->_cpPowerAssertion;
  if (cpPowerAssertion)
  {
    CFRelease(cpPowerAssertion);
    self->_cpPowerAssertion = 0;
  }
}

- (void)registerInterestedEventNotifications:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10001E524;
  uint64_t v9 = &unk_100034A50;
  SEL v10 = self;
  id v11 = a3;
  id v4 = v11;
  id v5 = +[NSBlockOperation blockOperationWithBlock:&v6];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v5, v6, v7, v8, v9, v10);
}

- (void)unregisterInterestedEventNotifications:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10001E658;
  uint64_t v9 = &unk_100034A50;
  SEL v10 = self;
  id v11 = a3;
  id v4 = v11;
  id v5 = +[NSBlockOperation blockOperationWithBlock:&v6];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v5, v6, v7, v8, v9, v10);
}

- (void)sendAddedItemsNotification:(id)a3 toConnections:(id)a4
{
}

- (void)sendUpdatedItemsNotification:(id)a3 toConnections:(id)a4
{
}

- (void)sendStatusNotification:(id)a3 toConnections:(id)a4
{
}

- (void)sendRemovedItemsNotification:(id)a3 toConnections:(id)a4
{
}

- (void)sendPTPEventNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(ICRemoteCameraDevice *)self sessionManager];
  id v6 = [v5 connectionsMonitoringNotification:@"ICNotificationTypeDeviceForwardPTPEvents"];

  [(ICRemoteCameraDevice *)self sendNotification:v4 toConnections:v6 selector:"notifyPtpEvent:"];
}

- (void)sendNotification:(id)a3 toConnections:(id)a4 selector:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v9;
  v31 = v10;
  if (!a5)
  {
    id v12 = [v10 mutableCopy];
    a5 = NSSelectorFromString(@"postNotification:");
    v13 = [(ICRemoteCameraDevice *)self internalUUID];
    v31 = v12;
    [v12 setObject:v13 forKeyedSubscript:@"ICInternalDeviceUUID"];
  }
  v29 = v10;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v11;
  id v14 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v19 = [v18 remoteObjectProxyWithErrorHandler:&stru_100034CF8];
        __ICOSLogCreate();
        if (__ICLogTypeEnabled(4))
        {
          __int16 v20 = @"sendNote";
          if ((unint64_t)[@"sendNote" length] >= 0x15)
          {
            v21 = objc_msgSend(@"sendNote", "substringWithRange:", 0, 18);
            __int16 v20 = [v21 stringByAppendingString:@".."];
          }
          id v22 = [v18 processIdentifier];
          v23 = NSStringFromSelector(a5);
          objc_super v24 = +[NSString stringWithFormat:@"[%05d] --> %@", v22, v23];

          v25 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v26 = v20;
            v27 = v25;
            id v28 = [(__CFString *)v26 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v37 = v28;
            __int16 v38 = 2114;
            v39 = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
        }
        [v19 performSelector:a5 withObject:v31];
      }
      id v15 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v15);
  }
}

- (NSOperationQueue)deviceOperationQueue
{
  return self->_deviceOperationQueue;
}

- (void)setDeviceOperationQueue:(id)a3
{
}

- (NSMutableDictionary)cameraDictionary
{
  return self->_cameraDictionary;
}

- (void)setCameraDictionary:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)deniedBundles
{
  return self->_deniedBundles;
}

- (void)setDeniedBundles:(id)a3
{
}

- (NSMutableArray)addedBundles
{
  return self->_addedBundles;
}

- (void)setAddedBundles:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (ICSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
}

- (OS_dispatch_queue)deviceOperationUnderlyingQueue
{
  return self->_deviceOperationUnderlyingQueue;
}

- (void)setDeviceOperationUnderlyingQueue:(id)a3
{
}

- (void)cpPowerAssertion
{
  return self->_cpPowerAssertion;
}

- (void)setCpPowerAssertion:(void *)a3
{
  self->_cpPowerAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOperationUnderlyingQueue, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_addedBundles, 0);
  objc_storeStrong((id *)&self->_deniedBundles, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_cameraDictionary, 0);

  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);
}

@end