@interface APUIConnectivityManager
+ (BOOL)isCaptivePortalMitigationSupported;
+ (BOOL)nwPathHasWiFiConnectivity:(id)a3;
+ (BOOL)shouldUpdateNetworkProfile;
+ (id)sharedInstance;
- (APUIConnectivityManager)init;
- (NSString)currentNetworkSSID;
- (int64_t)connectivityState;
- (void)_associateWithNetworkWithPassPhrase:(id)a3 captivePortalAuthToken:(id)a4 scanResults:(id)a5 completion:(id)a6;
- (void)_initWifiInterface;
- (void)_monitorWiFiIPAddressConfigurationWithCompletion:(id)a3;
- (void)_startMonitoringWiFiEvents;
- (void)_startWiFiNetworkScanWithScanParameters:(id)a3 passPhrase:(id)a4 captivePortalAuthToken:(id)a5 completion:(id)a6;
- (void)_stopMonitoringWiFiEvents;
- (void)dealloc;
- (void)enableCaptiveWebsheet:(unsigned __int8)a3;
- (void)handleUSBInterfaceChangedWithEventInfo:(id)a3;
- (void)handleWiFiInterfaceChangedWithEventInfo:(id)a3;
- (void)joinWiFiNetworkWithSSID:(id)a3 isNetworkHidden:(BOOL)a4 passPhrase:(id)a5 captivePortalAuthToken:(id)a6 completion:(id)a7;
- (void)startMonitoringUSBInterfaceChange;
- (void)startMonitoringWiFiInterfaceChange;
- (void)stopMonitoringUSBInterfaceChange;
- (void)stopMonitoringWiFiInterfaceChange;
- (void)tagAirPlayNetwork;
@end

@implementation APUIConnectivityManager

- (int64_t)connectivityState
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t connectivityState = v2->_connectivityState;
  objc_sync_exit(v2);

  return connectivityState;
}

- (void)_initWifiInterface
{
  v3 = (CWFInterface *)[objc_alloc((Class)CWFInterface) initWithServiceType:2];
  cwInterface = self->_cwInterface;
  self->_cwInterface = v3;

  [(CWFInterface *)self->_cwInterface activate];
  v5 = self->_cwInterface;

  [(CWFInterface *)v5 setInvalidationHandler:&stru_1000187B0];
}

- (void)_startMonitoringWiFiEvents
{
  if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
  {
    v7 = self;
    LogPrintF();
  }
  cwInterface = self->_cwInterface;
  id v11 = 0;
  -[CWFInterface startMonitoringEventType:error:](cwInterface, "startMonitoringEventType:error:", 19, &v11, v7);
  id v4 = v11;
  if (v4 && dword_10001ED08 <= 90 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
  {
    v8 = [v4 description];
    LogPrintF();
  }
  v5 = self->_cwInterface;
  id v10 = 0;
  -[CWFInterface startMonitoringEventType:error:](v5, "startMonitoringEventType:error:", 20, &v10, v8);
  id v6 = v10;
  if (v6 && dword_10001ED08 <= 90 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
  {
    v9 = [v6 description];
    LogPrintF();
  }
}

- (void)_stopMonitoringWiFiEvents
{
  if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
  {
    id v4 = self;
    LogPrintF();
  }
  -[CWFInterface stopMonitoringEventType:](self->_cwInterface, "stopMonitoringEventType:", 19, v4);
  cwInterface = self->_cwInterface;

  [(CWFInterface *)cwInterface stopMonitoringEventType:20];
}

- (void)_monitorWiFiIPAddressConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  monitorQueue = self->_monitorQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007490;
  v7[3] = &unk_100018800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)monitorQueue, v7);
}

- (void)joinWiFiNetworkWithSSID:(id)a3 isNetworkHidden:(BOOL)a4 passPhrase:(id)a5 captivePortalAuthToken:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v18 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_alloc_init((Class)CWFScanParameters);
  [v15 setSSID:v18];
  [v15 setIncludeHiddenNetworks:v10];
  [v15 setMaximumCacheAge:0];
  [v15 setNumberOfScans:1];
  [v15 setMergeScanResults:1];
  if (v13)
  {
    if (IsAppleInternalBuild()
      && dword_10001ED08 <= 50
      && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
    {
      v16 = self;
      id v17 = v13;
      LogPrintF();
    }
    if ([(id)objc_opt_class() isCaptivePortalMitigationSupported])
    {
      [v13 dataUsingEncoding:4];
      CNSetCaptivePortalAuthenticationCredentials();
    }
  }
  -[APUIConnectivityManager _startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:](self, "_startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:", v15, v12, v13, v14, v16, v17);
}

- (void)enableCaptiveWebsheet:(unsigned __int8)a3
{
  if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)tagAirPlayNetwork
{
  if ([(id)objc_opt_class() shouldUpdateNetworkProfile])
  {
    v3 = [(CWFInterface *)self->_cwInterface currentKnownNetworkProfile];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_14:

      return;
    }
    [v3 performSelector:"setPublicAirPlayNetwork:" withObject:&__kCFBooleanTrue];
    cwInterface = self->_cwInterface;
    v5 = +[NSSet setWithObject:&off_100019588];
    id v7 = 0;
    [(CWFInterface *)cwInterface updateKnownNetworkProfile:v3 properties:v5 error:&v7];
    id v6 = v7;

    if (v6)
    {
      if (dword_10001ED08 > 90 || dword_10001ED08 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
    }
    else if (dword_10001ED08 > 50 || dword_10001ED08 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_13;
    }
    LogPrintF();
LABEL_13:

    goto LABEL_14;
  }
}

- (void)_startWiFiNetworkScanWithScanParameters:(id)a3 passPhrase:(id)a4 captivePortalAuthToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  cwInterface = self->_cwInterface;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008100;
  v18[3] = &unk_100018828;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [(CWFInterface *)cwInterface performScanWithParameters:v10 reply:v18];
}

- (void)_associateWithNetworkWithPassPhrase:(id)a3 captivePortalAuthToken:(id)a4 scanResults:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)CWFAssocParameters);
  [v12 setScanResult:v10];

  [v12 setPassword:v11];
  [v12 setRememberUponSuccessfulAssociation:1];
  if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  cwInterface = self->_cwInterface;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008494;
  v15[3] = &unk_100018850;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  [(CWFInterface *)cwInterface associateWithParameters:v12 reply:v15];
}

- (void)handleUSBInterfaceChangedWithEventInfo:(id)a3
{
  id v17 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = v17;
  int64_t connectivityState = v4->_connectivityState;
  if (!v4->_activeUSBInterfaces)
  {
    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeUSBInterfaces = v4->_activeUSBInterfaces;
    v4->_activeUSBInterfaces = v7;

    v5 = v17;
  }
  id v9 = [v5 objectForKey:kAPConnectivityHelperEventInfoKey_IsAddEvent];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = v4->_activeUSBInterfaces;
  if (v10)
  {
    id v12 = [v17 objectForKey:kAPConnectivityHelperEventInfoKey_NetworkInterfaceName];
    [(NSMutableSet *)v11 addObject:v12];

    uint64_t v13 = v4->_connectivityState | 2;
  }
  else
  {
    id v14 = [v17 objectForKey:kAPConnectivityHelperEventInfoKey_NetworkInterfaceName];
    [(NSMutableSet *)v11 removeObject:v14];

    id v15 = [(NSMutableSet *)v4->_activeUSBInterfaces count];
    uint64_t v13 = v4->_connectivityState;
    if (v15) {
      goto LABEL_8;
    }
    v13 &= ~2uLL;
  }
  v4->_int64_t connectivityState = v13;
LABEL_8:
  objc_sync_exit(v4);

  if (v13 != connectivityState)
  {
    id v16 = +[NSNotificationCenter defaultCenter];
    [v16 postNotificationName:@"kAPUIConnectivityManagerNotification_ConnectivityStateChanged" object:v4];
  }
}

- (void)handleWiFiInterfaceChangedWithEventInfo:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  int64_t connectivityState = v4->_connectivityState;
  uint64_t v6 = kAPConnectivityHelperEventInfoKey_WiFiNetworkSSID;
  id v7 = [v13 objectForKeyedSubscript:kAPConnectivityHelperEventInfoKey_WiFiNetworkSSID];

  int64_t v8 = v4->_connectivityState;
  if (v7)
  {
    v4->_int64_t connectivityState = v8 | 1;
    uint64_t v9 = [v13 objectForKeyedSubscript:v6];
    currentNetworkSSID = v4->_currentNetworkSSID;
    v4->_currentNetworkSSID = (NSString *)v9;
  }
  else
  {
    unint64_t v11 = v8 & 0xFFFFFFFFFFFFFFFELL;
    currentNetworkSSID = v4->_currentNetworkSSID;
    v4->_int64_t connectivityState = v11;
    v4->_currentNetworkSSID = 0;
  }

  if (v4->_connectivityState == connectivityState)
  {
    objc_sync_exit(v4);
  }
  else
  {
    if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_sync_exit(v4);

    id v12 = +[NSNotificationCenter defaultCenter];
    [(APUIConnectivityManager *)v12 postNotificationName:@"kAPUIConnectivityManagerNotification_ConnectivityStateChanged" object:v4];
    id v4 = v12;
  }
}

- (void)startMonitoringWiFiInterfaceChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isListeningForWiFiInterfaceChange)
  {
    if (APConnectivityHelperRegisterForEvent())
    {
      APSLogErrorAt();
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForWiFiInterfaceChange = 1;
    }
  }
  objc_sync_exit(v2);
}

- (void)stopMonitoringWiFiInterfaceChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isListeningForWiFiInterfaceChange)
  {
    if (APConnectivityHelperDeregisterForEvent())
    {
      APSLogErrorAt();
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForWiFiInterfaceChange = 0;
    }
  }
  objc_sync_exit(v2);
}

- (void)startMonitoringUSBInterfaceChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isListeningForUSBInterfaceChange)
  {
    if (APConnectivityHelperRegisterForEvent())
    {
      APSLogErrorAt();
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForUSBInterfaceChange = 1;
    }
  }
  objc_sync_exit(v2);
}

- (void)stopMonitoringUSBInterfaceChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isListeningForUSBInterfaceChange)
  {
    if (APConnectivityHelperDeregisterForEvent())
    {
      APSLogErrorAt();
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForUSBInterfaceChange = 0;
    }
  }
  objc_sync_exit(v2);
}

- (APUIConnectivityManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)APUIConnectivityManager;
  v2 = [(APUIConnectivityManager *)&v8 init];
  if (v2)
  {
    if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    SharedHelper = (OpaqueAPConnectivityHelper *)APConnectivityHelperGetSharedHelper();
    v2->_connectivityHelper = SharedHelper;
    if (SharedHelper
      && (CFRetain(SharedHelper), v2->_connectivityHelper)
      && !APConnectivityHelperRegisterEventHandler())
    {
      [(APUIConnectivityManager *)v2 _initWifiInterface];
      p_super = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v5 = dispatch_queue_create("AirPlaySenderUIApp.networkObserverQueue", p_super);
      monitorQueue = v2->_monitorQueue;
      v2->_monitorQueue = (OS_dispatch_queue *)v5;
    }
    else
    {
      APSLogErrorAt();
      p_super = &v2->super;
      v2 = 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  connectivityHelper = self->_connectivityHelper;
  if (connectivityHelper)
  {
    CFRelease(connectivityHelper);
    self->_connectivityHelper = 0;
  }
  [(APUIConnectivityManager *)self _stopMonitoringWiFiEvents];
  [(CWFInterface *)self->_cwInterface invalidate];
  v4.receiver = self;
  v4.super_class = (Class)APUIConnectivityManager;
  [(APUIConnectivityManager *)&v4 dealloc];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009058;
  block[3] = &unk_100018720;
  block[4] = a1;
  if (qword_10001F058 != -1) {
    dispatch_once(&qword_10001F058, block);
  }
  v2 = (void *)qword_10001F060;

  return v2;
}

+ (BOOL)nwPathHasWiFiConnectivity:(id)a3
{
  v3 = a3;
  objc_super v4 = v3;
  BOOL v5 = v3 && nw_path_uses_interface_type(v3, nw_interface_type_wifi) && ((nw_path_get_status(v4) - 1) & 0xFFFFFFFD) == 0;

  return v5;
}

+ (BOOL)isCaptivePortalMitigationSupported
{
  return APSSettingsIsFeatureEnabled() != 0;
}

+ (BOOL)shouldUpdateNetworkProfile
{
  if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 1;
}

- (NSString)currentNetworkSSID
{
  return self->_currentNetworkSSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNetworkSSID, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_cwInterface, 0);

  objc_storeStrong((id *)&self->_activeUSBInterfaces, 0);
}

@end