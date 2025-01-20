@interface EAWiFiUnconfiguredAccessoryBrowserManager
+ (EAWiFiUnconfiguredAccessoryBrowserManager)sharedInstance;
- (BOOL)isConfiguring;
- (EAWiFiUnconfiguredAccessory)accessoryBeingConfigured;
- (EAWiFiUnconfiguredAccessoryBrowserManager)init;
- (NSCopying)currentRequestIdentifier;
- (NSExtension)extension;
- (NSMutableDictionary)_accessoryToDeviceID;
- (NSMutableSet)_accessories;
- (NSSet)unconfiguredAccessories;
- (NSString)unconfiguredDeviceID;
- (NSXPCConnection)connectionToWACEAService;
- (UIViewController)targetViewController;
- (WACUIRemoteViewController)remoteViewController;
- (int64_t)currentBrowserState;
- (void)_signalPresentationComplete;
- (void)cancelActiveConfiguration;
- (void)configureAccessory:(id)a3 withConfigurationUIOnViewController:(id)a4;
- (void)didFindNewUnconfiguredAccessories:(id)a3 andRemovedUnconfiguredAccessories:(id)a4;
- (void)dismissWithStatus:(int)a3;
- (void)openHomeAppForConfiguration;
- (void)openURL:(id)a3;
- (void)purgeAccessoriesSet;
- (void)setAccessoryBeingConfigured:(id)a3;
- (void)setConnectionToWACEAService:(id)a3;
- (void)setCurrentBrowserState:(int64_t)a3;
- (void)setCurrentRequestIdentifier:(id)a3;
- (void)setExtension:(id)a3;
- (void)setIsConfiguring:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setTargetViewController:(id)a3;
- (void)setUnconfiguredDeviceID:(id)a3;
- (void)set_accessories:(id)a3;
- (void)set_accessoryToDeviceID:(id)a3;
- (void)setup;
- (void)startSearchingForUnconfiguredAccessories;
- (void)stopSearchingForUnconfiguredAccessories;
- (void)updateState:(int64_t)a3;
- (void)wifiDidShutdown;
@end

@implementation EAWiFiUnconfiguredAccessoryBrowserManager

+ (EAWiFiUnconfiguredAccessoryBrowserManager)sharedInstance
{
  if (qword_CF80 != -1) {
    dispatch_once(&qword_CF80, &stru_8280);
  }
  v2 = (void *)qword_CF88;

  return (EAWiFiUnconfiguredAccessoryBrowserManager *)v2;
}

- (EAWiFiUnconfiguredAccessoryBrowserManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)EAWiFiUnconfiguredAccessoryBrowserManager;
  v2 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)&v8 init];
  if (v2)
  {
    v2->__debugLog = +[WACLogging isEnabled];
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v4 = (void *)setupSemaphore;
    setupSemaphore = (uint64_t)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.WAC.workQueue", 0);
    v6 = (void *)workQueue;
    workQueue = (uint64_t)v5;

    dispatch_async((dispatch_queue_t)workQueue, &stru_82A0);
    v2->_isConfiguring = 0;
    [(EAWiFiUnconfiguredAccessoryBrowserManager *)v2 setup];
  }
  return v2;
}

- (void)setup
{
  objc_initWeak(&location, self);
  BOOL debugLog = self->__debugLog;
  id v31 = 0;
  v4 = +[NSExtension extensionWithIdentifier:@"com.apple.ExternalAccessory.WACUI" error:&v31];
  id v5 = v31;
  [(EAWiFiUnconfiguredAccessoryBrowserManager *)self setExtension:v4];

  v6 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self extension];
  LODWORD(v4) = v6 == 0;

  if (v4)
  {
    v7 = [v5 localizedDescription];
    +[NSException raise:@"Unable to load WAC UI extension", @"Unable to load WAC UI extension: %@", v7 format];
  }
  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: setup method called, error value returned: %@", v5);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_2B98;
  v28[3] = &unk_82C8;
  BOOL v30 = debugLog;
  objc_copyWeak(&v29, &location);
  [(NSExtension *)self->_extension setRequestCompletionBlock:v28];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_2C1C;
  v25[3] = &unk_82F0;
  BOOL v27 = debugLog;
  objc_copyWeak(&v26, &location);
  [(NSExtension *)self->_extension setRequestCancellationBlock:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_2CB4;
  v22[3] = &unk_8360;
  BOOL v24 = debugLog;
  objc_copyWeak(&v23, &location);
  [(NSExtension *)self->_extension setRequestInterruptionBlock:v22];
  objc_super v8 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self currentRequestIdentifier];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    id v10 = objc_alloc_init((Class)NSExtensionItem);
    extension = self->_extension;
    id v33 = v10;
    v12 = +[NSArray arrayWithObjects:&v33 count:1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_2F28;
    v19[3] = &unk_8388;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    BOOL v21 = debugLog;
    [(NSExtension *)extension instantiateViewControllerWithInputItems:v12 connectionHandler:v19];

    objc_destroyWeak(&v20);
  }
  if (self->__debugLog) {
    NSLog(@"### WAC XPC: Starting call to XPC service");
  }
  v13 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.externalaccessory.WACEAService"];
  connectionToWACEAService = self->_connectionToWACEAService;
  self->_connectionToWACEAService = v13;

  if (self->__debugLog) {
    NSLog(@"### WAC XPC: NSXPCConnection ");
  }
  v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WACEAServiceProtocol];
  [(NSXPCConnection *)self->_connectionToWACEAService setRemoteObjectInterface:v15];

  if (self->__debugLog) {
    NSLog(@"### WAC XPC: _connectionToWACEAService.remoteObjectInterface");
  }
  [(NSXPCConnection *)self->_connectionToWACEAService setInterruptionHandler:&stru_83A8];
  [(NSXPCConnection *)self->_connectionToWACEAService setInvalidationHandler:&stru_83C8];
  [(NSXPCConnection *)self->_connectionToWACEAService resume];
  if (self->__debugLog) {
    NSLog(@"### WAC XPC: _connectionToWACEAService resume");
  }
  v16 = self->_connectionToWACEAService;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_3044;
  v18[3] = &unk_83F0;
  v18[4] = self;
  v17 = [(NSXPCConnection *)v16 remoteObjectProxyWithErrorHandler:v18];
  [v17 setup];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

- (void)startSearchingForUnconfiguredAccessories
{
  if (self->__debugLog) {
    NSLog(@"### WAC:%s:%d", a2, "-[EAWiFiUnconfiguredAccessoryBrowserManager startSearchingForUnconfiguredAccessories]", 288);
  }
  if (self->_currentBrowserState != 2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3184;
    block[3] = &unk_8418;
    block[4] = self;
    dispatch_async((dispatch_queue_t)workQueue, block);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_3274;
    v3[3] = &unk_8418;
    v3[4] = self;
    dispatch_async((dispatch_queue_t)workQueue, v3);
  }
}

- (void)stopSearchingForUnconfiguredAccessories
{
  if (self->__debugLog) {
    NSLog(@"### WAC:%s", a2, "-[EAWiFiUnconfiguredAccessoryBrowserManager stopSearchingForUnconfiguredAccessories]");
  }
  if (self->_currentBrowserState != 1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3380;
    block[3] = &unk_8418;
    block[4] = self;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)cancelActiveConfiguration
{
  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: cancelActiveConfiguration", a2);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3470;
  block[3] = &unk_8418;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)configureAccessory:(id)a3 withConfigurationUIOnViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->__debugLog) {
    NSLog(@"### WAC: BrowserManager: configureAccessory: self %@:  accessory: %@", self, v6);
  }
  objc_initWeak(&location, self);
  accessoryToDeviceID = self->__accessoryToDeviceID;
  BOOL v9 = [v6 macAddress];
  id v10 = [(NSMutableDictionary *)accessoryToDeviceID objectForKey:v9];

  if (v10)
  {
    if (self->__debugLog) {
      NSLog(@"### WAC:%s:%d Reconfiguring SecureWAC device", "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]", 333);
    }
    v11 = workQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_36FC;
    v24[3] = &unk_8468;
    v12 = &v27;
    objc_copyWeak(&v27, &location);
    v13 = &v25;
    v14 = (id *)v26;
    id v25 = v6;
    v26[0] = v7;
    v26[1] = self;
    id v15 = v7;
    id v16 = v6;
    v17 = v24;
  }
  else
  {
    if (self->__debugLog) {
      NSLog(@"### WAC XPC:%s:%d Reconfiguring WAC1 device", "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]", 391);
    }
    v11 = workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3C80;
    block[3] = &unk_8468;
    v12 = &v23;
    objc_copyWeak(&v23, &location);
    v13 = &v21;
    v14 = (id *)v22;
    id v21 = v6;
    v22[0] = v7;
    v22[1] = self;
    id v18 = v7;
    id v19 = v6;
    v17 = block;
  }
  dispatch_async(v11, v17);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)didFindNewUnconfiguredAccessories:(id)a3 andRemovedUnconfiguredAccessories:(id)a4
{
  id v42 = a3;
  id v6 = a4;
  if (!self->__accessories)
  {
    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    accessories = self->__accessories;
    self->__accessories = v7;
  }
  if (!self->__accessoryToDeviceID)
  {
    BOOL v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accessoryToDeviceID = self->__accessoryToDeviceID;
    self->__accessoryToDeviceID = v9;
  }
  id v46 = objc_alloc_init((Class)NSMutableSet);
  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v58;
    uint64_t v43 = *(void *)v58;
    do
    {
      id v15 = 0;
      id v44 = v13;
      do
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(NSMutableSet *)self->__accessories removeObject:v16];
          [v11 addObject:v16];
        }
        else
        {
          v17 = [v16 objectForKey:@"wacMACAddress"];
          uint64_t v18 = +[NSPredicate predicateWithFormat:@"macAddress == %@", v17];

          id v47 = (id)v18;
          id v19 = [(NSMutableSet *)self->__accessories filteredSetUsingPredicate:v18];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v20 = [v19 countByEnumeratingWithState:&v53 objects:v62 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v54;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v54 != v22) {
                  objc_enumerationMutation(v19);
                }
                BOOL v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                [(NSMutableSet *)self->__accessories removeObject:v24];
                id v25 = self->__accessoryToDeviceID;
                id v26 = [v24 macAddress];
                [(NSMutableDictionary *)v25 removeObjectForKey:v26];

                [v11 addObject:v24];
              }
              id v21 = [v19 countByEnumeratingWithState:&v53 objects:v62 count:16];
            }
            while (v21);
          }

          uint64_t v14 = v43;
          id v13 = v44;
        }
        id v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v13);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v48 = v42;
  id v27 = [v48 countByEnumeratingWithState:&v49 objects:v61 count:16];
  v28 = v46;
  if (v27)
  {
    id v29 = v27;
    uint64_t v30 = *(void *)v50;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v50 != v30) {
          objc_enumerationMutation(v48);
        }
        v32 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        id v33 = [objc_alloc((Class)EAWiFiUnconfiguredAccessory) initWithAirPortAssistantWACDevice:v32];
        [(NSMutableSet *)self->__accessories addObject:v33];
        if (self->__debugLog) {
          NSLog(@"### WAC: %s:%d: Checking SecureWAC and HomeKit flags", "-[EAWiFiUnconfiguredAccessoryBrowserManager didFindNewUnconfiguredAccessories:andRemovedUnconfiguredAccessories:]", 460);
        }
        v34 = [v32 objectForKey:@"wacSupportsSpruce"];
        if ([v34 BOOLValue])
        {
          v35 = [v32 objectForKey:@"wacSupportsSecureWAC"];
          unsigned int v36 = [v35 BOOLValue];

          v28 = v46;
          if (!v36) {
            goto LABEL_35;
          }
          if (self->__debugLog) {
            NSLog(@"### WAC: %s:%d: New SecureWAC Accessory Found: %@", "-[EAWiFiUnconfiguredAccessoryBrowserManager didFindNewUnconfiguredAccessories:andRemovedUnconfiguredAccessories:]", 466, v32);
          }
          v37 = self->__accessoryToDeviceID;
          v34 = [v32 objectForKey:@"wacDeviceID"];
          v38 = [v33 macAddress];
          [(NSMutableDictionary *)v37 setValue:v34 forKey:v38];

          v28 = v46;
        }

LABEL_35:
        [v28 addObject:v33];
      }
      id v29 = [v48 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v29);
  }

  objc_storeStrong((id *)&self->_unconfiguredAccessories, self->__accessories);
  v39 = +[NSNotificationCenter defaultCenter];
  if ([v11 count])
  {
    v40 = +[NSDictionary dictionaryWithObject:v11 forKey:@"EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"];
    [v39 postNotificationName:@"EAWiFiUnconfiguredAccessoriesRemovedNotification" object:self userInfo:v40];

    v28 = v46;
  }
  if ([v28 count])
  {
    v41 = +[NSDictionary dictionaryWithObject:v28 forKey:@"EAWiFiUnconfiguredAccessoriesAddedOrRemovedSet"];
    [v39 postNotificationName:@"EAWiFiUnconfiguredAccessoriesAddedNotification" object:self userInfo:v41];

    v28 = v46;
  }
}

- (void)updateState:(int64_t)a3
{
  -[EAWiFiUnconfiguredAccessoryBrowserManager setCurrentBrowserState:](self, "setCurrentBrowserState:");
  if (self->__debugLog) {
    NSLog(@"### WAC: %s:%d state: %d", "-[EAWiFiUnconfiguredAccessoryBrowserManager updateState:]", 502, a3);
  }
  id v5 = +[NSNumber numberWithInteger:a3];
  id v7 = +[NSDictionary dictionaryWithObject:v5 forKey:@"EAWiFiUnconfiguredAccessoryBrowserState"];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"EAWiFiUnconfiguredAccessoryBrowserDidUpdateState" object:self userInfo:v7];
}

- (void)purgeAccessoriesSet
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"EAWiFiUnconfiguredAccessoryBrowserPurgeAccessoriesSet" object:self userInfo:0];
}

- (void)dismissWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: dismissWithStatus method called, status: %d", a2, a3);
  }
  self->_isConfiguring = 0;
  id v5 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self targetViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  id v6 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self accessoryBeingConfigured];
  id v7 = +[NSMutableDictionary dictionaryWithObject:v6 forKey:@"EAWiFiUnconfiguredAccessoryConfigured"];

  if (self->__debugLog) {
    NSLog(@" WAC: BrowserManager: dismissWithStatus, status: %d (cancel=%d), notificationInfoDict %@", v3, -6723, v7);
  }
  if (v3)
  {
    if ((int)v3 == -6723) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
  }
  else
  {
    objc_super v8 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self accessoryBeingConfigured];
    id v13 = v8;
    BOOL v9 = +[NSArray arrayWithObjects:&v13 count:1];
    [(EAWiFiUnconfiguredAccessoryBrowserManager *)self didFindNewUnconfiguredAccessories:0 andRemovedUnconfiguredAccessories:v9];

    uint64_t v10 = 0;
  }
  id v11 = +[NSNumber numberWithInt:v10];
  [v7 setObject:v11 forKey:@"EAWiFiUnconfiguredAccessoryBrowserConfigurationStatus"];

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:@"EAWiFiUnconfiguredAccessoryBrowserFinishedConfiguringAccessoryNotification" object:self userInfo:v7];

  [(EAWiFiUnconfiguredAccessoryBrowserManager *)self setAccessoryBeingConfigured:0];
}

- (void)_signalPresentationComplete
{
  if (self->__debugLog) {
    NSLog(@"WAC: BrowserManager: _signalPresentationComplete method called", a2);
  }
  v2 = setupSemaphore;

  dispatch_semaphore_signal(v2);
}

- (void)wifiDidShutdown
{
  if ((char *)[(EAWiFiUnconfiguredAccessoryBrowserManager *)self currentBrowserState] == (char *)&dword_0 + 2)
  {
    [(EAWiFiUnconfiguredAccessoryBrowserManager *)self stopSearchingForUnconfiguredAccessories];
  }
  else if ((char *)[(EAWiFiUnconfiguredAccessoryBrowserManager *)self currentBrowserState] == (char *)&dword_0 + 3)
  {
    [(EAWiFiUnconfiguredAccessoryBrowserManager *)self cancelActiveConfiguration];
  }

  [(EAWiFiUnconfiguredAccessoryBrowserManager *)self updateState:0];
}

- (void)openHomeAppForConfiguration
{
  if (self->__debugLog)
  {
    uint64_t v3 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self unconfiguredDeviceID];
    NSLog(@"%s: (id: %@)", "-[EAWiFiUnconfiguredAccessoryBrowserManager openHomeAppForConfiguration]", v3);
  }
  v4 = +[NSURL URLWithString:@"com.apple.Home://reprovisionDevice/"];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self unconfiguredDeviceID];
  id v7 = [v6 length];

  if ((uint64_t)v7 >= 1)
  {
    for (uint64_t i = 0; i < (uint64_t)v7; i += 2)
    {
      BOOL v9 = [(EAWiFiUnconfiguredAccessoryBrowserManager *)self unconfiguredDeviceID];
      uint64_t v10 = objc_msgSend(v9, "substringWithRange:", i, 2);
      [v5 addObject:v10];
    }
  }
  id v11 = [v5 componentsJoinedByString:@":"];
  id v12 = [v11 uppercaseString];

  id v13 = [v4 URLByAppendingPathComponent:v12];

  if (self->__debugLog) {
    NSLog(@"%s: launchURL: %@", "-[EAWiFiUnconfiguredAccessoryBrowserManager openHomeAppForConfiguration]", v13);
  }
  [(EAWiFiUnconfiguredAccessoryBrowserManager *)self openURL:v13];
}

- (void)openURL:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->__debugLog) {
    NSLog(@"%s: launchURL: %@", "-[EAWiFiUnconfiguredAccessoryBrowserManager openURL:]", v4);
  }
  id v6 = objc_alloc_init((Class)_LSOpenConfiguration);
  [v6 setSensitive:1];
  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4AA0;
  v9[3] = &unk_84D8;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  [v7 openURL:v8 configuration:v6 completionHandler:v9];
}

- (NSSet)unconfiguredAccessories
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (EAWiFiUnconfiguredAccessory)accessoryBeingConfigured
{
  return (EAWiFiUnconfiguredAccessory *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessoryBeingConfigured:(id)a3
{
}

- (NSExtension)extension
{
  return (NSExtension *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtension:(id)a3
{
}

- (WACUIRemoteViewController)remoteViewController
{
  return (WACUIRemoteViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemoteViewController:(id)a3
{
}

- (UIViewController)targetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setTargetViewController:(id)a3
{
}

- (NSCopying)currentRequestIdentifier
{
  return self->_currentRequestIdentifier;
}

- (void)setCurrentRequestIdentifier:(id)a3
{
}

- (NSMutableSet)_accessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_accessories:(id)a3
{
}

- (int64_t)currentBrowserState
{
  return self->_currentBrowserState;
}

- (void)setCurrentBrowserState:(int64_t)a3
{
  self->_currentBrowserState = a3;
}

- (BOOL)isConfiguring
{
  return self->_isConfiguring;
}

- (void)setIsConfiguring:(BOOL)a3
{
  self->_isConfiguring = a3;
}

- (NSXPCConnection)connectionToWACEAService
{
  return self->_connectionToWACEAService;
}

- (void)setConnectionToWACEAService:(id)a3
{
}

- (NSMutableDictionary)_accessoryToDeviceID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_accessoryToDeviceID:(id)a3
{
}

- (NSString)unconfiguredDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUnconfiguredDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconfiguredDeviceID, 0);
  objc_storeStrong((id *)&self->__accessoryToDeviceID, 0);
  objc_storeStrong((id *)&self->_connectionToWACEAService, 0);
  objc_storeStrong((id *)&self->__accessories, 0);
  objc_storeStrong((id *)&self->_currentRequestIdentifier, 0);
  objc_destroyWeak((id *)&self->_targetViewController);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_accessoryBeingConfigured, 0);

  objc_storeStrong((id *)&self->_unconfiguredAccessories, 0);
}

@end