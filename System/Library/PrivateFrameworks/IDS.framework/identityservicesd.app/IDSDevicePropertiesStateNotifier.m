@interface IDSDevicePropertiesStateNotifier
+ (id)sharedInstance;
- (IDSDevicePropertiesStateNotifier)init;
- (IDSDevicePropertiesStateNotifier)initWithUTunDeliveryController:(id)a3 pairingManager:(id)a4;
- (IDSPairingManager)pairingManager;
- (IDSUTunDeliveryController)deliveryController;
- (NSMutableDictionary)notifyDict;
- (unint64_t)_getCurrentState:(id)a3;
- (void)dealloc;
- (void)setDeliveryController:(id)a3;
- (void)setNotifyDict:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setState:(unint64_t)a3 forProperty:(unint64_t)a4 deviceUniqueID:(id)a5;
- (void)updateStateForDeviceWithUniqueID:(id)a3;
@end

@implementation IDSDevicePropertiesStateNotifier

+ (id)sharedInstance
{
  if (qword_100A4C9E0 != -1) {
    dispatch_once(&qword_100A4C9E0, &stru_10098CB30);
  }
  v2 = (void *)qword_100A4C9E8;

  return v2;
}

- (IDSDevicePropertiesStateNotifier)init
{
  v3 = +[IDSUTunDeliveryController sharedInstance];
  v4 = +[IDSPairingManager sharedInstance];
  v5 = [(IDSDevicePropertiesStateNotifier *)self initWithUTunDeliveryController:v3 pairingManager:v4];

  return v5;
}

- (IDSDevicePropertiesStateNotifier)initWithUTunDeliveryController:(id)a3 pairingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSDevicePropertiesStateNotifier;
  v9 = [(IDSDevicePropertiesStateNotifier *)&v13 init];
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notifyDict = v9->_notifyDict;
    v9->_notifyDict = v10;

    objc_storeStrong((id *)&v9->_deliveryController, a3);
    objc_storeStrong((id *)&v9->_pairingManager, a4);
  }

  return v9;
}

- (void)dealloc
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(IDSDevicePropertiesStateNotifier *)self notifyDict];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
        v9 = [(IDSDevicePropertiesStateNotifier *)self notifyDict];
        v10 = [v9 objectForKey:v8];
        id v11 = [v10 pointerValue];

        free(v11);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)IDSDevicePropertiesStateNotifier;
  [(IDSDevicePropertiesStateNotifier *)&v12 dealloc];
}

- (unint64_t)_getCurrentState:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDevicePropertiesStateNotifier *)self pairingManager];
  uint64_t v6 = [v5 pairedDeviceUniqueID];

  LODWORD(v5) = [v6 isEqualToIgnoringCase:v4];
  if (v5)
  {
    id v7 = [(IDSDevicePropertiesStateNotifier *)self deliveryController];
    unsigned int v8 = [v7 defaultPeerIsConnected];

    v9 = [(IDSDevicePropertiesStateNotifier *)self deliveryController];
    unsigned int v10 = [v9 defaultPeerIsNearby];

    id v11 = [(IDSDevicePropertiesStateNotifier *)self deliveryController];
    unsigned int v12 = [v11 defaultPeerIsCloudConnected];

    if (v8)
    {
      unint64_t v13 = kIDSDeviceStatePropertiesIsConnected;
      if (v10)
      {
        unint64_t v13 = kIDSDeviceStatePropertiesIsNearby | kIDSDeviceStatePropertiesIsConnected;
        if ((v12 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    else
    {
      if (v10)
      {
        unint64_t v13 = kIDSDeviceStatePropertiesIsNearby;
        if ((v12 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      unint64_t v13 = 0;
    }
    if (v12) {
LABEL_12:
    }
      v13 |= kIDSDeviceStatePropertiesIsCloudConnected;
  }
  else
  {
    unint64_t v13 = 0;
  }
LABEL_13:

  return v13;
}

- (void)updateStateForDeviceWithUniqueID:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(IDSDevicePropertiesStateNotifier *)self _getCurrentState:v5];
  [(IDSDevicePropertiesStateNotifier *)self setState:v4 forProperty:kIDSDeviceStatePropertiesIsNearby | kIDSDeviceStatePropertiesIsConnected | kIDSDeviceStatePropertiesIsCloudConnected deviceUniqueID:v5];
}

- (void)setState:(unint64_t)a3 forProperty:(unint64_t)a4 deviceUniqueID:(id)a5
{
  unsigned int v8 = a5;
  if ([v8 length])
  {
    if ([v8 isEqualToIgnoringCase:IDSDeviceDefaultPairedDeviceUniqueID])
    {
      v9 = [(IDSDevicePropertiesStateNotifier *)self pairingManager];
      unsigned int v10 = [v9 pairedDeviceUniqueID];

      if (![v10 length])
      {
        v28 = +[IMRGLog deviceState];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1007240AC(v28);
        }
        goto LABEL_32;
      }

      unsigned int v8 = v10;
    }
    unsigned int v10 = +[NSString stringWithFormat:@"%@-%@", IDSDeviceStateTokenPrefix, v8];
    id v11 = [(IDSDevicePropertiesStateNotifier *)self notifyDict];
    unsigned int v12 = [v11 objectForKey:v10];
    unint64_t v13 = (int *)[v12 pointerValue];

    uint64_t state64 = 0;
    long long v14 = +[IMRGLog deviceState];
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        int v16 = *v13;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v31 = v16;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found existing notify token %d for name %@", buf, 0x12u);
      }

      notify_get_state(*v13, &state64);
      unint64_t v17 = state64;
      v18 = v13;
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "We didn't find a notify token for %@, adding one...", buf, 0xCu);
      }

      v18 = (int *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
      int *v18 = 0;
      v19 = v10;
      notify_register_check((const char *)[v19 UTF8String], v18);
      v20 = [(IDSDevicePropertiesStateNotifier *)self notifyDict];
      v21 = +[NSValue valueWithPointer:v18];
      [v20 setValue:v21 forKey:v19];

      unint64_t v17 = [(IDSDevicePropertiesStateNotifier *)self _getCurrentState:v8];
      uint64_t state64 = v17;
    }
    uint64_t v22 = v17 & ~a4 | a4 & a3;
    v23 = +[IMRGLog deviceState];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v24 = @"YES";
      if ((kIDSDeviceStatePropertiesIsNearby & v22) != 0) {
        CFStringRef v25 = @"YES";
      }
      else {
        CFStringRef v25 = @"NO";
      }
      if ((kIDSDeviceStatePropertiesIsConnected & v22) != 0) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      if ((kIDSDeviceStatePropertiesIsCloudConnected & v22) == 0) {
        CFStringRef v24 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      *(void *)v31 = v10;
      *(_WORD *)&v31[8] = 2112;
      *(void *)&v31[10] = v25;
      __int16 v32 = 2112;
      CFStringRef v33 = v26;
      __int16 v34 = 2112;
      CFStringRef v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received device properties state change for device with uniqueID %@ - nearby %@  connected %@  cloud connected %@", buf, 0x2Au);
    }

    if (!v13 || v17 != v22)
    {
      v27 = +[IMRGLog deviceState];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v31 = v17;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = v22;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Connectivity state changed (old: 0x%x) (new: 0x%x)", buf, 0xEu);
      }

      notify_set_state(*v18, v22);
      notify_post((const char *)[v10 UTF8String]);
      if ((kIDSDeviceStatePropertiesIsNearby & (v22 ^ v17)) != 0)
      {
        v28 = +[IDSDaemon sharedInstance];
        [v28 launchOnDemandServicesForNeedsLaunchOnNearbyDevicesChanged];
LABEL_32:
      }
    }
  }
  else
  {
    unsigned int v10 = +[IMRGLog deviceState];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100724068(v10);
    }
  }
}

- (NSMutableDictionary)notifyDict
{
  return self->_notifyDict;
}

- (void)setNotifyDict:(id)a3
{
}

- (IDSUTunDeliveryController)deliveryController
{
  return self->_deliveryController;
}

- (void)setDeliveryController:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_deliveryController, 0);

  objc_storeStrong((id *)&self->_notifyDict, 0);
}

@end