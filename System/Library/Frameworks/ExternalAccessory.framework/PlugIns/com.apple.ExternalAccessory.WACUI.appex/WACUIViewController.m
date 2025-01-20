@interface WACUIViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (AirPortAssistantManager)airportAssistantManager;
- (AirPortAssistantUINavigationController)nav;
- (BOOL)hostIsEntitled;
- (WACUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)airPortAssistantCompleteWithResult:(int)a3 context:(id)a4 animated:(BOOL)a5;
- (void)backendConfigureAirPortAssistantWithTargetMACAddress:(id)a3;
- (void)backendStartSearch;
- (void)backendStopSearch;
- (void)cancelActiveConfiguration;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)setAirportAssistantManager:(id)a3;
- (void)setNav:(id)a3;
- (void)shouldCheckWiFiPowerStatus;
- (void)updateState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)wacDevicesAdded:(id)a3 andWACDevicesRemoved:(id)a4;
@end

@implementation WACUIViewController

- (WACUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WACUIViewController;
  v4 = [(WACUIViewController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(AirPortAssistantManager);
    airportAssistantManager = v4->_airportAssistantManager;
    v4->_airportAssistantManager = v5;

    [(AirPortAssistantManager *)v4->_airportAssistantManager setDelegate:v4];
    v4->_authorized = 0;
    v4->_wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate();
    CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop();
    WiFiManagerClientSetType();
    v7 = WiFiManagerClientCopyDevices();
    v8 = v7;
    if (v7)
    {
      if ([v7 count])
      {
        v9 = (__WiFiDeviceClient *)[v8 objectAtIndex:0];
        v4->_wifiDevice = v9;
        CFRetain(v9);
        WiFiDeviceClientRegisterPowerCallback();
      }
      CFRelease(v8);
    }
    v4->__debugLog = +[WACLogging isEnabled];
  }
  return v4;
}

- (void)dealloc
{
  wifiManager = self->_wifiManager;
  if (wifiManager) {
    CFRelease(wifiManager);
  }
  wifiDevice = self->_wifiDevice;
  if (wifiDevice) {
    CFRelease(wifiDevice);
  }
  v5.receiver = self;
  v5.super_class = (Class)WACUIViewController;
  [(WACUIViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WACUIViewController;
  [(WACUIViewController *)&v3 viewDidLoad];
  if (self->__debugLog) {
    NSLog(@"Plugin: ViewDidLoad");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WACUIViewController;
  [(WACUIViewController *)&v4 viewDidAppear:a3];
  if (self->__debugLog) {
    NSLog(@"Plugin: ViewDidAppear");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->__debugLog) {
    NSLog(@"Plugin: viewDidDisappear", a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)WACUIViewController;
  [(WACUIViewController *)&v7 viewDidDisappear:v3];
  objc_super v5 = [(WACUIViewController *)self nav];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000018EC;
  v6[3] = &unk_1000041C0;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:0 completion:v6];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)WACUIViewController;
  [(WACUIViewController *)&v2 didReceiveMemoryWarning];
}

- (void)shouldCheckWiFiPowerStatus
{
  if (self->__debugLog) {
    NSLog(@"Plugin: shouldCheckWiFiPowerStatus", a2);
  }
  if (self->_wifiDevice
    && !WiFiDeviceClientGetPower()
    && [(WACUIViewController *)self hostIsEntitled])
  {
    id v3 = [(WACUIViewController *)self _remoteViewControllerProxy];
    [v3 wifiDidShutdown];
  }
}

- (BOOL)hostIsEntitled
{
  if (!self->_didCheckedEntitlements)
  {
    self->_didCheckedEntitlements = 1;
    memset(&v11, 0, sizeof(v11));
    [(WACUIViewController *)self _hostAuditToken];
    if (self->__debugLog) {
      NSLog(@"Audit Token: %x %x %x %x %x %x %x %x", v11.val[0], v11.val[1], v11.val[2], v11.val[3], v11.val[4], v11.val[5], v11.val[6], v11.val[7]);
    }
    audit_token_t token = v11;
    SecTaskRef v3 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    objc_super v4 = v3;
    if (self->__debugLog) {
      NSLog(@"Task: %@", v3);
    }
    *(void *)token.val = 0;
    CFBooleanRef v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, @"com.apple.external-accessory.wireless-configuration", (CFErrorRef *)&token);
    CFBooleanRef v6 = v5;
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      BOOL v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
      self->_authorized = v8;
    }
    if (self->__debugLog) {
      NSLog(@"Entitlement returned: %@, Error returned: %@", v6, *(void *)token.val);
    }
    if (v6) {
      CFRelease(v6);
    }
    if (*(void *)token.val) {
      CFRelease(*(CFTypeRef *)token.val);
    }
    if (v4) {
      CFRelease(v4);
    }
  }
  return self->_authorized;
}

- (void)cancelActiveConfiguration
{
  if (self->__debugLog) {
    NSLog(@"Plugin: cancelActiveConfiguration", a2);
  }
  id v4 = [(AirPortAssistantManager *)self->_airportAssistantManager airportAssistantController];
  SecTaskRef v3 = [v4 viewController];
  [v3 performSelector:"handeImmediateCancel" withObject:0];
}

- (void)wacDevicesAdded:(id)a3 andWACDevicesRemoved:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(WACUIViewController *)self hostIsEntitled])
  {
    CFTypeID v7 = [(WACUIViewController *)self _remoteViewControllerProxy];
    [v7 backendFoundNewWACDevices:v8 andRemovedWACDevices:v6];
  }
}

- (void)airPortAssistantCompleteWithResult:(int)a3 context:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = *(void *)&a3;
  if ([(WACUIViewController *)self hostIsEntitled])
  {
    id v7 = [(WACUIViewController *)self _remoteViewControllerProxy];
    [v7 dismissWithStatus:v5];
  }
}

- (void)updateState:(int64_t)a3
{
  if ([(WACUIViewController *)self hostIsEntitled])
  {
    id v5 = [(WACUIViewController *)self _remoteViewControllerProxy];
    [v5 updateState:a3];
  }
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WACUIServiceProtocol];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WACUIHostProtocol];
}

- (void)backendStartSearch
{
  if ([(WACUIViewController *)self hostIsEntitled])
  {
    airportAssistantManager = self->_airportAssistantManager;
    [(AirPortAssistantManager *)airportAssistantManager startSearchingForUnconfiguredAccessories];
  }
}

- (void)backendStopSearch
{
  if ([(WACUIViewController *)self hostIsEntitled])
  {
    airportAssistantManager = self->_airportAssistantManager;
    [(AirPortAssistantManager *)airportAssistantManager stopSearchingForUnconfiguredAccessories];
  }
}

- (void)backendConfigureAirPortAssistantWithTargetMACAddress:(id)a3
{
  id v4 = a3;
  if ([(WACUIViewController *)self hostIsEntitled])
  {
    v13[0] = kAirPortAssistantDeviceMACAddressKey;
    v13[1] = kAirPortAssistantWACShouldHideFindAppUIKey;
    v14[0] = v4;
    v14[1] = &__kCFBooleanTrue;
    id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [(AirPortAssistantManager *)self->_airportAssistantManager stopSearchingForUnconfiguredAccessories];
    id v6 = [(AirPortAssistantManager *)self->_airportAssistantManager airportAssistantController];
    [v6 configureUIViewControllerWithParameters:v5];

    [(WACUIViewController *)self updateState:3];
    id v7 = objc_alloc((Class)AirPortAssistantUINavigationController);
    id v8 = [(AirPortAssistantManager *)self->_airportAssistantManager airportAssistantController];
    v9 = [v8 viewController];
    v10 = (AirPortAssistantUINavigationController *)[v7 initWithRootViewController:v9];
    nav = self->_nav;
    self->_nav = v10;

    [(AirPortAssistantUINavigationController *)self->_nav setModalInPresentation:1];
    v12 = [(WACUIViewController *)self nav];
    [(WACUIViewController *)self presentViewController:v12 animated:0 completion:0];
  }
}

- (AirPortAssistantUINavigationController)nav
{
  return (AirPortAssistantUINavigationController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNav:(id)a3
{
}

- (AirPortAssistantManager)airportAssistantManager
{
  return (AirPortAssistantManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAirportAssistantManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airportAssistantManager, 0);

  objc_storeStrong((id *)&self->_nav, 0);
}

@end