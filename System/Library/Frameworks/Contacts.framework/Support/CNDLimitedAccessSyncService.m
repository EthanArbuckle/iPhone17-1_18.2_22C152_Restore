@interface CNDLimitedAccessSyncService
+ (id)log;
+ (id)sharedInstance;
- (BOOL)startLimitedAccessTableUpdateEventNotifyWatchTimer;
- (CNDLimitedAccessSyncService)init;
- (OS_dispatch_queue)fDispatchQueue;
- (OS_dispatch_source)fLimitedAccessTableUpdateEventNotifyTimer;
- (RPCompanionLinkClient)companionClient;
- (RPCompanionLinkClient)discoveryClient;
- (RPCompanionLinkDevice)linkedDevice;
- (id)beginService;
- (id)convertStringtoIntArray:(id)a3;
- (id)interestedNotifications;
- (void)cancelLimitedAccessTableUpdateEventNotifyWatchTimer;
- (void)connectWithCompanionDevice;
- (void)handleBundleIdentifiers:(id)a3;
- (void)handleNotificationName:(id)a3;
- (void)invalidateCompanionClient;
- (void)notifyConnectedWatch;
- (void)onEventhandler:(id)a3;
- (void)onRapportDeviceFound:(id)a3;
- (void)onRapportDeviceLost:(id)a3;
- (void)sendSyncRequest;
- (void)setCompanionClient:(id)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setFDispatchQueue:(id)a3;
- (void)setFLimitedAccessTableUpdateEventNotifyTimer:(id)a3;
- (void)setLinkedDevice:(id)a3;
@end

@implementation CNDLimitedAccessSyncService

+ (id)log
{
  if (qword_10002CB38 != -1) {
    dispatch_once(&qword_10002CB38, &stru_100025118);
  }
  v2 = (void *)qword_10002CB40;

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012F20;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002CB48 != -1) {
    dispatch_once(&qword_10002CB48, block);
  }
  v2 = (void *)qword_10002CB50;

  return v2;
}

- (CNDLimitedAccessSyncService)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNDLimitedAccessSyncService;
  v2 = [(CNDLimitedAccessSyncService *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.contactsd.Sync", 0);
    fDispatchQueue = v2->_fDispatchQueue;
    v2->_fDispatchQueue = (OS_dispatch_queue *)v3;

    v5 = [(CNDLimitedAccessSyncService *)v2 beginService];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)beginService
{
  dispatch_queue_t v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "beginService", (uint8_t *)buf, 2u);
  }

  v4 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = v4;

  [(RPCompanionLinkClient *)self->_discoveryClient setControlFlags:32];
  objc_initWeak(buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001322C;
  v13[3] = &unk_100025140;
  objc_copyWeak(&v14, buf);
  [(RPCompanionLinkClient *)self->_discoveryClient setDeviceFoundHandler:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013288;
  v11[3] = &unk_100025140;
  objc_copyWeak(&v12, buf);
  [(RPCompanionLinkClient *)self->_discoveryClient setDeviceLostHandler:v11];
  v6 = self->_discoveryClient;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000132E4;
  v10[3] = &unk_100025168;
  v10[4] = self;
  [(RPCompanionLinkClient *)v6 registerRequestID:@"com.apple.contacts.LimitedAccessSync" options:0 handler:v10];
  objc_super v7 = self->_discoveryClient;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013584;
  v9[3] = &unk_100025190;
  v9[4] = self;
  [(RPCompanionLinkClient *)v7 activateWithCompletion:v9];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
  return self;
}

- (void)onRapportDeviceFound:(id)a3
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = [v5 model];
    v8 = [v5 name];
    v9 = [v5 effectiveIdentifier];
    int v12 = 138412803;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v8;
    __int16 v16 = 2113;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#Rapport discovered nearby device model:%@, name:%@,effectiveID:%{private}@ ", (uint8_t *)&v12, 0x20u);
  }
  v10 = [v5 effectiveIdentifier];
  unsigned int v11 = [v10 hasPrefix:@"BTPipe"];

  if (v11) {
    objc_storeStrong((id *)&self->_linkedDevice, a3);
  }
}

- (void)onRapportDeviceLost:(id)a3
{
  v4 = (RPCompanionLinkDevice *)a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(RPCompanionLinkDevice *)v4 name];
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Device Lost:name:%@", (uint8_t *)&v8, 0xCu);
  }
  if (self->_linkedDevice == v4)
  {
    self->_linkedDevice = 0;

    companionClient = self->_companionClient;
    self->_companionClient = 0;

    [(CNDLimitedAccessSyncService *)self cancelLimitedAccessTableUpdateEventNotifyWatchTimer];
  }
}

- (void)invalidateCompanionClient
{
  [(RPCompanionLinkClient *)self->_companionClient invalidate];
  companionClient = self->_companionClient;
  self->_companionClient = 0;
}

- (void)onEventhandler:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 objectForKeyedSubscript:@"kABLimitedAccessEventKeyType"];
    int v10 = 138412290;
    unsigned int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "onEventhandler eventDict %@", (uint8_t *)&v10, 0xCu);
  }
  if (v4)
  {
    objc_super v7 = [v4 objectForKeyedSubscript:@"kABLimitedAccessEventKeyType"];
    unsigned int v8 = [v7 isEqualToString:@"SyncTableUpdate"];

    if (v8)
    {
      if (self->_companionClient)
      {
        v9 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "connectWithCompanionDevice activated, sendSyncRequest", (uint8_t *)&v10, 2u);
        }

        [(CNDLimitedAccessSyncService *)self sendSyncRequest];
      }
      else
      {
        [(CNDLimitedAccessSyncService *)self connectWithCompanionDevice];
      }
    }
  }
}

- (void)connectWithCompanionDevice
{
  dispatch_queue_t v3 = [(id)objc_opt_class() log];
  id v4 = v3;
  if (self->_linkedDevice)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v5 = [(RPCompanionLinkDevice *)self->_linkedDevice effectiveIdentifier];
      v6 = [(RPCompanionLinkDevice *)self->_linkedDevice model];
      *(_DWORD *)buf = 138478083;
      v17 = v5;
      __int16 v18 = 2112;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "connecting with companion device, activating %{private}@ %@", buf, 0x16u);
    }
    objc_super v7 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    companionClient = self->_companionClient;
    self->_companionClient = v7;

    [(RPCompanionLinkClient *)self->_companionClient setControlFlags:32];
    [(RPCompanionLinkClient *)self->_companionClient setDestinationDevice:self->_linkedDevice];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100013C58;
    v14[3] = &unk_100024B98;
    v9 = v4;
    v15 = v9;
    [(RPCompanionLinkClient *)self->_companionClient setInvalidationHandler:v14];
    int v10 = self->_companionClient;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100013CB8;
    v11[3] = &unk_1000251B8;
    int v12 = v9;
    v13 = self;
    [(RPCompanionLinkClient *)v10 activateWithCompletion:v11];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_100016CF0();
  }
}

- (void)notifyConnectedWatch
{
  dispatch_queue_t v3 = [(id)objc_opt_class() log];
  linkedDevice = self->_linkedDevice;
  id v5 = [(id)objc_opt_class() log];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (linkedDevice)
  {
    if (v6)
    {
      objc_super v7 = [(RPCompanionLinkDevice *)self->_linkedDevice effectiveIdentifier];
      unsigned int v8 = [(RPCompanionLinkDevice *)self->_linkedDevice model];
      *(_DWORD *)buf = 138478083;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Activating connection with device %{private}@ %@", buf, 0x16u);
    }
    v9 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    companionClient = self->_companionClient;
    self->_companionClient = v9;

    [(RPCompanionLinkClient *)self->_companionClient setControlFlags:32];
    [(RPCompanionLinkClient *)self->_companionClient setDestinationDevice:self->_linkedDevice];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100014020;
    v13[3] = &unk_100024B98;
    __int16 v14 = v3;
    [(RPCompanionLinkClient *)self->_companionClient setInvalidationHandler:v13];
    unsigned int v11 = self->_companionClient;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014080;
    v12[3] = &unk_100025190;
    v12[4] = self;
    [(RPCompanionLinkClient *)v11 activateWithCompletion:v12];
    id v5 = v14;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "No Active device", buf, 2u);
  }
}

- (id)interestedNotifications
{
  return &off_100025D28;
}

- (void)handleNotificationName:(id)a3
{
  if ([a3 isEqualToString:@"CNContactStoreLimitedAccessDidChangeNotification"])
  {
    [(CNDLimitedAccessSyncService *)self startLimitedAccessTableUpdateEventNotifyWatchTimer];
  }
}

- (void)handleBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handleBundleIdentifiers unregistered app", buf, 2u);
  }

  BOOL v6 = [(CNDLimitedAccessSyncService *)self fDispatchQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000144A0;
  v8[3] = &unk_100024C40;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)convertStringtoIntArray:(id)a3
{
  dispatch_queue_t v3 = [a3 componentsSeparatedByString:@", "];
  id v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "intValue", (void)v12));
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)sendSyncRequest
{
  uint64_t v22 = RPOptionStatusFlags;
  v23 = &off_100025D40;
  dispatch_queue_t v3 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v4 = objc_alloc_init((Class)CNContactStore);
  id v15 = 0;
  id v5 = [v4 getLimitedAccessLastSyncSequenceNumber:&v15];
  id v6 = v15;
  if (!v5 || [v5 integerValue] == (id)-1)
  {
    uint64_t v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100016D58();
    }
  }
  else
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "sendSyncRequest lastSyncedSequenceNumber = %@ ", buf, 0xCu);
    }

    CFStringRef v20 = @"LastSyncedSequenceNumber";
    v21 = v5;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [(RPCompanionLinkClient *)self->_companionClient destinationDevice];
      unsigned int v11 = [v10 effectiveIdentifier];
      *(_DWORD *)buf = 138478083;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "sendRequest device %{private}@ last sequence num %@", buf, 0x16u);
    }
    companionClient = self->_companionClient;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100014A3C;
    v13[3] = &unk_100025208;
    void v13[4] = self;
    id v14 = v4;
    [(RPCompanionLinkClient *)companionClient sendRequestID:@"com.apple.contacts.LimitedAccessSync" request:v8 options:v3 responseHandler:v13];
  }
}

- (BOOL)startLimitedAccessTableUpdateEventNotifyWatchTimer
{
  [(CNDLimitedAccessSyncService *)self cancelLimitedAccessTableUpdateEventNotifyWatchTimer];
  dispatch_queue_t v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_fDispatchQueue);
  fLimitedAccessTableUpdateEventNotifyTimer = self->_fLimitedAccessTableUpdateEventNotifyTimer;
  self->_fLimitedAccessTableUpdateEventNotifyTimer = v3;

  id v5 = self->_fLimitedAccessTableUpdateEventNotifyTimer;
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    id v7 = self->_fLimitedAccessTableUpdateEventNotifyTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100014EC0;
    handler[3] = &unk_100024B98;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_fLimitedAccessTableUpdateEventNotifyTimer);
  }
  return v5 != 0;
}

- (void)cancelLimitedAccessTableUpdateEventNotifyWatchTimer
{
  if (self->_fLimitedAccessTableUpdateEventNotifyTimer)
  {
    dispatch_queue_t v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelling fLimitedAccessTableUpdateEventNotifyTimer", v5, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_fLimitedAccessTableUpdateEventNotifyTimer);
    fLimitedAccessTableUpdateEventNotifyTimer = self->_fLimitedAccessTableUpdateEventNotifyTimer;
    self->_fLimitedAccessTableUpdateEventNotifyTimer = 0;
  }
}

- (RPCompanionLinkClient)discoveryClient
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiscoveryClient:(id)a3
{
}

- (RPCompanionLinkClient)companionClient
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCompanionClient:(id)a3
{
}

- (OS_dispatch_queue)fDispatchQueue
{
  return self->_fDispatchQueue;
}

- (void)setFDispatchQueue:(id)a3
{
}

- (RPCompanionLinkDevice)linkedDevice
{
  return self->_linkedDevice;
}

- (void)setLinkedDevice:(id)a3
{
}

- (OS_dispatch_source)fLimitedAccessTableUpdateEventNotifyTimer
{
  return self->_fLimitedAccessTableUpdateEventNotifyTimer;
}

- (void)setFLimitedAccessTableUpdateEventNotifyTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fLimitedAccessTableUpdateEventNotifyTimer, 0);
  objc_storeStrong((id *)&self->_linkedDevice, 0);
  objc_storeStrong((id *)&self->_fDispatchQueue, 0);
  objc_storeStrong((id *)&self->_companionClient, 0);

  objc_storeStrong((id *)&self->_discoveryClient, 0);
}

@end