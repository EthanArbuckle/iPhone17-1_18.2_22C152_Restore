@interface IDSRapportClient
+ (IDSRapportClient)sharedInstance;
- (BOOL)_isDiscoveredOverWiFi:(id)a3;
- (BOOL)isDeviceDiscovered:(id)a3;
- (IDSRapportClient)init;
- (IDSTTLCache)ttlCache;
- (IMMultiQueue)multiQueue;
- (RPCompanionLinkClient)companionLinkClient;
- (id)_deviceWithIdentifier:(id)a3 error:(id *)a4;
- (id)_newCompanionLinkClient;
- (void)_companionLinkClientForDeviceIdentifier:(id)a3 completion:(id)a4;
- (void)_handleDiscoveredDevice:(id)a3;
- (void)_handleIncomingIDSMessageEvent:(id)a3 options:(id)a4;
- (void)_handleLostDevice:(id)a3;
- (void)_notifyDelegatesWithBlock:(id)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)sendMessage:(id)a3 toDeviceIdentifier:(id)a4 completionBlock:(id)a5;
- (void)setMultiQueue:(id)a3;
- (void)setTtlCache:(id)a3;
- (void)ttlCache:(id)a3 willReturnCachedObject:(id)a4 forKey:(id)a5 completion:(id)a6;
@end

@implementation IDSRapportClient

+ (IDSRapportClient)sharedInstance
{
  if (qword_100A4C430 != -1) {
    dispatch_once(&qword_100A4C430, &stru_100987190);
  }
  v2 = (void *)qword_100A4C438;

  return (IDSRapportClient *)v2;
}

- (IDSRapportClient)init
{
  v49.receiver = self;
  v49.super_class = (Class)IDSRapportClient;
  v2 = [(IDSRapportClient *)&v49 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v3;

    id v5 = objc_alloc((Class)IMMultiQueue);
    v6 = im_primary_queue();
    v7 = (IMMultiQueue *)[v5 initWithQueue:v6];
    multiQueue = v2->_multiQueue;
    v2->_multiQueue = v7;

    v9 = [IDSTTLCache alloc];
    v10 = im_primary_queue();
    v11 = [(IDSTTLCache *)v9 initWithQueue:v10 ttlInSeconds:300.0];
    ttlCache = v2->_ttlCache;
    v2->_ttlCache = v11;

    [(IDSTTLCache *)v2->_ttlCache setDelegate:v2];
    if (!v2->_discoveredDevices)
    {
      v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      discoveredDevices = v2->_discoveredDevices;
      v2->_discoveredDevices = v13;
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v15 = [(IDSRapportClient *)v2 _newCompanionLinkClient];
    companionLinkClient = v2->_companionLinkClient;
    v2->_companionLinkClient = v15;

    v17 = v2->_companionLinkClient;
    v18 = im_primary_queue();
    [(RPCompanionLinkClient *)v17 setDispatchQueue:v18];

    v19 = v2->_companionLinkClient;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1002663EC;
    v46[3] = &unk_1009871B8;
    objc_copyWeak(&v47, &location);
    [(RPCompanionLinkClient *)v19 setDeviceFoundHandler:v46];
    v20 = v2->_companionLinkClient;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100266448;
    v44[3] = &unk_1009871B8;
    objc_copyWeak(&v45, &location);
    [(RPCompanionLinkClient *)v20 setDeviceLostHandler:v44];
    v21 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = sub_1002664A4();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = @"ids-message";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Registering for events {eventID: %@, options: %@}", buf, 0x16u);
    }
    v23 = v2->_companionLinkClient;
    v24 = sub_1002664A4();
    v52 = v24;
    v53 = &__kCFBooleanTrue;
    v25 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100266514;
    v42[3] = &unk_1009871E0;
    objc_copyWeak(&v43, &location);
    [(RPCompanionLinkClient *)v23 registerEventID:@"ids-message" options:v25 handler:v42];

    [(RPCompanionLinkClient *)v2->_companionLinkClient setInvalidationHandler:&stru_100987200];
    [(RPCompanionLinkClient *)v2->_companionLinkClient setInterruptionHandler:&stru_100987220];
    v26 = dispatch_group_create();
    dispatch_group_enter(v26);
    v27 = v2->_companionLinkClient;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100266664;
    v39[3] = &unk_100980EC0;
    objc_copyWeak(&v41, &location);
    v28 = v26;
    v40 = v28;
    [(RPCompanionLinkClient *)v27 activateWithCompletion:v39];
    dispatch_group_enter(v28);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v51 = 0;
    v29 = v2->_companionLinkClient;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10026675C;
    v36[3] = &unk_100987248;
    v38 = buf;
    v30 = v28;
    v37 = v30;
    [(RPCompanionLinkClient *)v29 setLocalDeviceUpdatedHandler:v36];
    v31 = v2->_multiQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10026685C;
    v34[3] = &unk_100987270;
    v32 = v30;
    v35 = v32;
    [(IMMultiQueue *)v31 addBlock:v34 forKey:@"kDefaultMultiQueueKey" description:@"init"];

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v41);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc'ing IDSRapportClient", buf, 2u);
  }

  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  v4.receiver = self;
  v4.super_class = (Class)IDSRapportClient;
  [(IDSRapportClient *)&v4 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v7 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  delegateMap = self->_delegateMap;
  if (!delegateMap)
  {
    id v5 = +[NSHashTable weakObjectsHashTable];
    v6 = self->_delegateMap;
    self->_delegateMap = v5;

    delegateMap = self->_delegateMap;
  }
  if (![(NSHashTable *)delegateMap containsObject:v7]) {
    [(NSHashTable *)self->_delegateMap addObject:v7];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)removeDelegate:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  [(NSHashTable *)self->_delegateMap removeObject:v5];

  if (![(NSHashTable *)self->_delegateMap count])
  {
    delegateMap = self->_delegateMap;
    self->_delegateMap = 0;
  }
  id v7 = self->_lock;

  [(NSRecursiveLock *)v7 unlock];
}

- (BOOL)isDeviceDiscovered:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  LOBYTE(lock) = [(NSMutableSet *)self->_discoveredDevices containsObject:v5];

  [(NSRecursiveLock *)self->_lock unlock];
  return (char)lock;
}

- (void)sendMessage:(id)a3 toDeviceIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "outgoing IDS Message {deviceIentifier: %@, event: %@}", buf, 0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100266CF0;
  v15[3] = &unk_100987298;
  id v17 = v8;
  id v18 = v10;
  id v16 = v9;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  [(IDSRapportClient *)self _companionLinkClientForDeviceIdentifier:v14 completion:v15];
}

- (void)ttlCache:(id)a3 willReturnCachedObject:(id)a4 forKey:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = (void (**)(void, void))v9;
  if (a4)
  {
    (*((void (**)(id, id))v9 + 2))(v9, a4);
  }
  else
  {
    id v21 = 0;
    v11 = [(IDSRapportClient *)self _deviceWithIdentifier:a5 error:&v21];
    id v12 = v21;
    if (v11)
    {
      id v13 = [(IDSRapportClient *)self _newCompanionLinkClient];
      [v13 setDestinationDevice:v11];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100267160;
      v18[3] = &unk_100981C38;
      id v19 = v13;
      id v20 = v10;
      id v14 = v13;
      [v14 activateWithCompletion:v18];
    }
    else
    {
      id v15 = objc_alloc((Class)CUTResult);
      id v16 = [(IDSRapportClient *)self companionLinkClient];
      id v17 = [v15 initWithSuccess:v16];

      ((void (**)(void, id))v10)[2](v10, v17);
      id v14 = v12;
      id v12 = v17;
    }
  }
}

- (void)_notifyDelegatesWithBlock:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = [(NSHashTable *)self->_delegateMap allObjects];
  [(NSRecursiveLock *)self->_lock unlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)_isDiscoveredOverWiFi:(id)a3
{
  return ((unint64_t)[a3 statusFlags] >> 2) & 1;
}

- (void)_handleDiscoveredDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Discovered device %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 idsDeviceIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    unsigned int v8 = [(IDSRapportClient *)self _isDiscoveredOverWiFi:v4];

    if (v8)
    {
      [(NSRecursiveLock *)self->_lock lock];
      discoveredDevices = self->_discoveredDevices;
      id v10 = [v4 idsDeviceIdentifier];
      [(NSMutableSet *)discoveredDevices addObject:v10];

      [(NSRecursiveLock *)self->_lock unlock];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1002674BC;
      v11[3] = &unk_1009872C0;
      v11[4] = self;
      id v12 = v4;
      [(IDSRapportClient *)self _notifyDelegatesWithBlock:v11];
    }
  }
}

- (void)_handleLostDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Lost device %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 idsDeviceIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    unsigned int v8 = [(IDSRapportClient *)self _isDiscoveredOverWiFi:v4];

    if (v8)
    {
      [(NSRecursiveLock *)self->_lock lock];
      discoveredDevices = self->_discoveredDevices;
      id v10 = [v4 idsDeviceIdentifier];
      [(NSMutableSet *)discoveredDevices removeObject:v10];

      [(NSRecursiveLock *)self->_lock unlock];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1002676B8;
      v11[3] = &unk_1009872C0;
      v11[4] = self;
      id v12 = v4;
      [(IDSRapportClient *)self _notifyDelegatesWithBlock:v11];
    }
  }
}

- (void)_handleIncomingIDSMessageEvent:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "incoming IDS Message {event: %@, options: %@}", buf, 0x16u);
  }

  if (qword_100A4C448)
  {
    uint64_t v9 = (id)qword_100A4C448;
    goto LABEL_9;
  }
  id v10 = (void **)IMWeakLinkSymbol();
  if (v10) {
    long long v11 = *v10;
  }
  else {
    long long v11 = 0;
  }
  objc_storeStrong((id *)&qword_100A4C448, v11);
  uint64_t v9 = (id)qword_100A4C448;
  if (v9)
  {
LABEL_9:
    id v12 = [v7 objectForKeyedSubscript:v9];
    if ([v12 length])
    {
      long long v13 = +[NSString stringWithFormat:@"guest-device:%@", v12];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100267990;
      v15[3] = &unk_1009872E8;
      void v15[4] = self;
      id v16 = v6;
      id v17 = v13;
      id v14 = v13;
      [(IDSRapportClient *)self _notifyDelegatesWithBlock:v15];
    }
    else
    {
      id v14 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10071BA9C();
      }
    }

    goto LABEL_14;
  }
  uint64_t v9 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10071BA34();
  }
LABEL_14:
}

- (void)_companionLinkClientForDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(IDSRapportClient *)self ttlCache];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100267AD0;
  v11[3] = &unk_100987310;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 fetchCachedObjectForKey:v9 completion:v11];
}

- (id)_deviceWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(IDSRapportClient *)self companionLinkClient];
  unsigned int v8 = [v7 activeDevices];

  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [v13 effectiveIdentifier];
        unsigned __int8 v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          id v17 = v13;
          goto LABEL_12;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    uint64_t v16 = IDSSendErrorDomain;
    NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
    CFStringRef v24 = @"We failed to find a rapport destination for the provided deviceIdentifier";
    unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    +[NSError errorWithDomain:v16 code:1 userInfo:v8];
    id v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_newCompanionLinkClient
{
  id v2 = objc_alloc_init((Class)IMWeakLinkClass());
  objc_msgSend(v2, "setFlags:", objc_msgSend(v2, "flags") | 1);
  return v2;
}

- (IMMultiQueue)multiQueue
{
  return self->_multiQueue;
}

- (void)setMultiQueue:(id)a3
{
}

- (IDSTTLCache)ttlCache
{
  return self->_ttlCache;
}

- (void)setTtlCache:(id)a3
{
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiQueue, 0);
  objc_storeStrong((id *)&self->_ttlCache, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_delegateMap, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);

  objc_storeStrong((id *)&self->_companionLinkClient, 0);
}

@end