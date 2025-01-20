@interface IDSNRDeviceBridge
- (BOOL)isClassCConnected;
- (BOOL)isConnected;
- (BOOL)isDevicesIdentifierEqualTo:(id)a3;
- (BOOL)isNearby;
- (BOOL)isRegistered;
- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4;
- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4 startMonitor:(BOOL)a5;
- (IDSNRDeviceBridgeDelegate)delegate;
- (NRDeviceMonitor)nrDeviceMonitor;
- (NSUUID)deviceIdentifier;
- (OS_dispatch_queue)nrMonitorQueue;
- (unsigned)latestLinkType;
- (void)_notifyWirelessRadioManagerAboutLinkChange:(unsigned __int8)a3;
- (void)_startNRDeviceMonitor:(id)a3;
- (void)dealloc;
- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4;
- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4;
- (void)deviceIsCloudConnectedDidChange:(id)a3 isCloudConnected:(BOOL)a4;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setLatestLinkType:(unsigned __int8)a3;
- (void)setNrDeviceMonitor:(id)a3;
- (void)setNrMonitorQueue:(id)a3;
@end

@implementation IDSNRDeviceBridge

- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4
{
  return [(IDSNRDeviceBridge *)self initWithDeviceIdentifier:a3 delegate:a4 startMonitor:1];
}

- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4 startMonitor:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IDSNRDeviceBridge;
  v10 = [(IDSNRDeviceBridge *)&v18 init];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("NRDeviceMonitor", v12);
    nrMonitorQueue = v10->_nrMonitorQueue;
    v10->_nrMonitorQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v10->_delegate, v9);
    v15 = (NSUUID *)[v8 copy];
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = v15;

    if (v5) {
      [(IDSNRDeviceBridge *)v10 _startNRDeviceMonitor:v8];
    }
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSNRDeviceBridge {pointer: %p}", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)IDSNRDeviceBridge;
  [(IDSNRDeviceBridge *)&v4 dealloc];
}

- (void)_startNRDeviceMonitor:(id)a3
{
  id v4 = a3;
  nrMonitorQueue = self->_nrMonitorQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000257D8;
  v7[3] = &unk_10097E440;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(nrMonitorQueue, v7);
}

- (BOOL)isNearby
{
  v2 = [(IDSNRDeviceBridge *)self nrDeviceMonitor];
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (BOOL)isConnected
{
  v2 = [(IDSNRDeviceBridge *)self nrDeviceMonitor];
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (BOOL)isRegistered
{
  v2 = [(IDSNRDeviceBridge *)self nrDeviceMonitor];
  unsigned __int8 v3 = [v2 isRegistered];

  return v3;
}

- (BOOL)isDevicesIdentifierEqualTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IDSNRDeviceBridge *)self deviceIdentifier];
  unsigned __int8 v6 = [v5 isEqual:v4];

  return v6;
}

- (BOOL)isClassCConnected
{
  v2 = [(IDSNRDeviceBridge *)self nrDeviceMonitor];
  unsigned __int8 v3 = [v2 isClassCConnected];

  return v3;
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    v11 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138543875;
    CFStringRef v16 = v9;
    __int16 v17 = 2114;
    CFStringRef v18 = v10;
    __int16 v19 = 2113;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isConnected didChange {isConnected: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}", buf, 0x20u);
  }
  if (v7)
  {
    v12 = im_primary_queue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100025C30;
    v13[3] = &unk_10097E8D8;
    v13[4] = self;
    BOOL v14 = v4;
    dispatch_async(v12, v13);
  }
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    v11 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138543875;
    CFStringRef v16 = v9;
    __int16 v17 = 2114;
    CFStringRef v18 = v10;
    __int16 v19 = 2113;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isNearby didChange {isNearby: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}", buf, 0x20u);
  }
  if (v7)
  {
    v12 = im_primary_queue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100025E18;
    v13[3] = &unk_10097E8D8;
    v13[4] = self;
    BOOL v14 = v4;
    dispatch_async(v12, v13);
  }
}

- (void)deviceIsCloudConnectedDidChange:(id)a3 isCloudConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    v11 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138543875;
    CFStringRef v16 = v9;
    __int16 v17 = 2114;
    CFStringRef v18 = v10;
    __int16 v19 = 2113;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isCloudConnected didChange {isCloudConnected: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}", buf, 0x20u);
  }
  if (v7)
  {
    v12 = im_primary_queue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100026000;
    v13[3] = &unk_10097E8D8;
    v13[4] = self;
    BOOL v14 = v4;
    dispatch_async(v12, v13);
  }
}

- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v9 = @"NO";
    }
    else {
      CFStringRef v9 = @"YES";
    }
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    v11 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138543875;
    CFStringRef v17 = v9;
    __int16 v18 = 2114;
    CFStringRef v19 = v10;
    __int16 v20 = 2113;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isAwake didChange {isAwake: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}", buf, 0x20u);
  }
  if (v7)
  {
    BOOL v12 = !v4;
    dispatch_queue_t v13 = im_primary_queue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000261EC;
    v14[3] = &unk_10097E8D8;
    v14[4] = self;
    BOOL v15 = v12;
    dispatch_async(v13, v14);
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  StringFromNRLinkType = (void *)j__createStringFromNRLinkType();
  unsigned int v8 = [v6 isRegistered];
  CFStringRef v9 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    v11 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138543875;
    __int16 v20 = StringFromNRLinkType;
    __int16 v21 = 2114;
    CFStringRef v22 = v10;
    __int16 v23 = 2113;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "linkType didChange {linkType: %{public}@, isRegistered: %{public}@ deviceIdentifier: %{private}@}", buf, 0x20u);
  }
  id v12 = objc_alloc((Class)NSDictionary);
  dispatch_queue_t v13 = +[NSNumber numberWithUnsignedChar:v4];
  id v14 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"IPsecLinkType", 0);

  uint64_t v15 = v4;
  if (!v4) {
    uint64_t v15 = [(IDSNRDeviceBridge *)self latestLinkType];
  }
  [(IDSNRDeviceBridge *)self setLatestLinkType:v15];
  CFStringRef v16 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026460;
  block[3] = &unk_10097E8D8;
  block[4] = self;
  char v18 = v4;
  dispatch_async(v16, block);

  IDSPowerLogDictionary();
  [(IDSNRDeviceBridge *)self _notifyWirelessRadioManagerAboutLinkChange:v4];
}

- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  unsigned int v8 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    v11 = [v6 deviceIdentifier];
    *(_DWORD *)buf = 138543875;
    CFStringRef v16 = v9;
    __int16 v17 = 2114;
    CFStringRef v18 = v10;
    __int16 v19 = 2113;
    __int16 v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isClassCConnected didChange {isClassCConnected: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}", buf, 0x20u);
  }
  if (v7)
  {
    id v12 = im_primary_queue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100026648;
    v13[3] = &unk_10097E8D8;
    v13[4] = self;
    BOOL v14 = v4;
    dispatch_async(v12, v13);
  }
}

- (void)_notifyWirelessRadioManagerAboutLinkChange:(unsigned __int8)a3
{
  if (a3 == 2)
  {
    unsigned __int8 v3 = +[IDSWRMExchange sharedInstance];
    id v5 = v3;
    uint64_t v4 = 1;
  }
  else if (a3 == 1)
  {
    unsigned __int8 v3 = +[IDSWRMExchange sharedInstance];
    id v5 = v3;
    uint64_t v4 = 3;
  }
  else
  {
    if (a3) {
      return;
    }
    unsigned __int8 v3 = +[IDSWRMExchange sharedInstance];
    id v5 = v3;
    uint64_t v4 = 2;
  }
  [v3 handleActiveLinkChange:v4];
}

- (IDSNRDeviceBridgeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSNRDeviceBridgeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)nrMonitorQueue
{
  return self->_nrMonitorQueue;
}

- (void)setNrMonitorQueue:(id)a3
{
}

- (NRDeviceMonitor)nrDeviceMonitor
{
  return self->_nrDeviceMonitor;
}

- (void)setNrDeviceMonitor:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (unsigned)latestLinkType
{
  return self->_latestLinkType;
}

- (void)setLatestLinkType:(unsigned __int8)a3
{
  self->_latestLinkType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_nrDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_nrMonitorQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end