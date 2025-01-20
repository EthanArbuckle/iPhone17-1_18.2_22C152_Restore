@interface IKJSDevice
+ (id)getMobileGestaltString:(__CFString *)a3;
- (BOOL)isInAirplaneMode;
- (BOOL)isInRetailDemoMode;
- (BOOL)isNetworkReachable;
- (BOOL)isSeedBuild;
- (BOOL)runningAnInternalBuild;
- (IKAppDeviceConfig)deviceConfig;
- (IKJSDevice)initWithAppContext:(id)a3 deviceConfig:(id)a4;
- (NSNumber)pixelRatio;
- (NSString)appIdentifier;
- (NSString)appVersion;
- (NSString)model;
- (NSString)networkType;
- (NSString)osBuildNumber;
- (NSString)productType;
- (NSString)systemVersion;
- (NSString)vendorIdentifier;
- (double)lastNetworkChangedTime;
- (id)asPrivateIKJSDevice;
- (id)capacity:(id)a3;
- (void)dealloc;
- (void)setDeviceConfig:(id)a3;
@end

@implementation IKJSDevice

- (id)asPrivateIKJSDevice
{
  if ([(IKJSDevice *)self conformsToProtocol:&unk_1F3E539E8]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKJSDevice)initWithAppContext:(id)a3 deviceConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IKJSDevice;
  v8 = [(IKJSObject *)&v18 initWithAppContext:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_deviceConfig, v7);
    objc_initWeak(&location, v9);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = +[IKNetworkUtilities sharedInstance];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke;
    v15[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v16, &location);
    uint64_t v12 = [v10 addObserverForName:@"IKNetworkPropertiesChangedNotification" object:v11 queue:0 usingBlock:v15];
    id networkPropertiesChangedToken = v9->_networkPropertiesChangedToken;
    v9->_id networkPropertiesChangedToken = (id)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = [v3 userInfo];
    id v7 = [WeakRetained appContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke_2;
    v9[3] = &unk_1E6DE48E8;
    objc_copyWeak(&v11, v4);
    id v8 = v6;
    id v10 = v8;
    [v7 evaluate:v9 completionBlock:0];

    objc_destroyWeak(&v11);
  }
}

void __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = *(void *)(a1 + 32);
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    id v4 = (id)[WeakRetained invokeMethod:@"onNetworkChange" withArguments:v3];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_networkPropertiesChangedToken];

  v4.receiver = self;
  v4.super_class = (Class)IKJSDevice;
  [(IKJSDevice *)&v4 dealloc];
}

- (NSString)vendorIdentifier
{
  v2 = [(IKJSObject *)self appContext];
  id v3 = [v2 app];
  objc_super v4 = [v3 vendorIdentifier];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F42948] currentDevice];
    id v8 = [v7 identifierForVendor];
    id v6 = [v8 UUIDString];
  }
  return (NSString *)v6;
}

- (NSString)appVersion
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 infoDictionary];

  objc_super v4 = [v3 objectForKey:@"CFBundleVersion"];

  return (NSString *)v4;
}

- (NSString)appIdentifier
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v4 = [v3 infoDictionary];

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23;
  v15 = __Block_byref_object_dispose__23;
  id v16 = [v4 objectForKey:@"CFBundleIdentifier"];
  v5 = [(IKJSDevice *)self deviceConfig];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(IKJSObject *)self appContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__IKJSDevice_appIdentifier__block_invoke;
    v10[3] = &unk_1E6DE3860;
    v10[4] = self;
    v10[5] = &v11;
    [v7 evaluateDelegateBlockSync:v10];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v8;
}

void __27__IKJSDevice_appIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) deviceConfig];
  uint64_t v2 = [v5 bundleIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)systemVersion
{
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 systemVersion];

  return (NSString *)v3;
}

- (NSString)model
{
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 model];

  return (NSString *)v3;
}

- (NSString)productType
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 getMobileGestaltString:@"ProductType"];
}

- (NSNumber)pixelRatio
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  objc_super v4 = objc_msgSend(v2, "numberWithDouble:");

  return (NSNumber *)v4;
}

- (BOOL)isNetworkReachable
{
  uint64_t v2 = +[IKNetworkUtilities sharedInstance];
  char v3 = [v2 isNetworkReachable];

  return v3;
}

- (BOOL)isInAirplaneMode
{
  uint64_t v2 = +[IKNetworkUtilities sharedInstance];
  char v3 = [v2 isAirplaneModeEnabled];

  return v3;
}

- (BOOL)runningAnInternalBuild
{
  return +[IKUtilites runningAnInternalBuild];
}

- (NSString)networkType
{
  uint64_t v2 = +[IKNetworkUtilities sharedInstance];
  char v3 = [v2 networkType];

  return (NSString *)v3;
}

- (double)lastNetworkChangedTime
{
  uint64_t v2 = +[IKNetworkUtilities sharedInstance];
  [v2 lastNetworkChangedTime];
  double v4 = v3;

  return v4;
}

- (BOOL)isInRetailDemoMode
{
  return [MEMORY[0x1E4F42738] isRunningInStoreDemoMode];
}

- (BOOL)isSeedBuild
{
  return 0;
}

- (id)capacity:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MGCopyAnswer();
  if ([v3 isEqualToString:@"totalSystemCapacity"])
  {
    id v5 = (void *)MEMORY[0x1E4FBA108];
LABEL_11:
    char v6 = [v4 objectForKey:*v5];
    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"totalSystemAvailable"])
  {
    id v5 = (void *)MEMORY[0x1E4FBA100];
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"totalDataCapacity"])
  {
    id v5 = (void *)MEMORY[0x1E4FBA0F0];
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"totalDataAvailable"])
  {
    id v5 = (void *)MEMORY[0x1E4FBA0E8];
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"totalDiskCapacity"])
  {
    id v5 = (void *)MEMORY[0x1E4FBA0F8];
    goto LABEL_11;
  }
  char v6 = 0;
LABEL_12:

  return v6;
}

- (NSString)osBuildNumber
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 getMobileGestaltString:@"BuildVersion"];
}

+ (id)getMobileGestaltString:(__CFString *)a3
{
  id v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    double v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      char v6 = [NSString stringWithString:v4];
    }
    else
    {
      char v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

- (IKAppDeviceConfig)deviceConfig
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceConfig);
  return (IKAppDeviceConfig *)WeakRetained;
}

- (void)setDeviceConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceConfig);
  objc_storeStrong(&self->_networkPropertiesChangedToken, 0);
}

@end