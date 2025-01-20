@interface HMDMediaBrowserDataSource
+ (id)shortDescription;
- (BOOL)isAppleMediaAccessory;
- (BOOL)requiresHomePod2ndGenPairing;
- (BOOL)requiresHomePodMiniPairing;
- (HAP2AccessoryServerDiscoveryBonjour)airPlayBonjourBrowser;
- (HMDDevice)currentDevice;
- (HMDMediaBrowserDataSource)init;
- (HMFProductInfo)productInfo;
- (HMFSystemInfo)systemInfo;
- (NSString)currentAccessoryMediaRouteIdentifier;
- (id)performOperation:(id)a3;
- (unint64_t)appleMediaAccessoryVariant;
- (unint64_t)supportedStereoPairVersions;
@end

@implementation HMDMediaBrowserDataSource

- (void).cxx_destruct
{
}

- (HAP2AccessoryServerDiscoveryBonjour)airPlayBonjourBrowser
{
  return (HAP2AccessoryServerDiscoveryBonjour *)objc_getProperty(self, a2, 8, 1);
}

- (id)performOperation:(id)a3
{
  v3 = (void *)MEMORY[0x263F42628];
  id v4 = a3;
  v5 = [v3 defaultScheduler];
  v6 = [v5 performOperation:v4];

  return v6;
}

- (HMDDevice)currentDevice
{
  v2 = +[HMDAppleAccountManager sharedManager];
  v3 = [v2 device];

  return (HMDDevice *)v3;
}

- (unint64_t)appleMediaAccessoryVariant
{
  return +[HMDDeviceCapabilities appleMediaAccessoryVariant];
}

- (HMFProductInfo)productInfo
{
  return (HMFProductInfo *)[MEMORY[0x263F42620] productInfo];
}

- (HMFSystemInfo)systemInfo
{
  return (HMFSystemInfo *)[MEMORY[0x263F42648] systemInfo];
}

- (BOOL)requiresHomePod2ndGenPairing
{
  return +[HMDDeviceCapabilities requiresHomePod2ndGenPairing];
}

- (unint64_t)supportedStereoPairVersions
{
  unint64_t v2 = +[HMDDeviceCapabilities supportsStereoPairingV1];
  if (+[HMDDeviceCapabilities supportsStereoPairingV2]) {
    v2 |= 2uLL;
  }
  if (+[HMDDeviceCapabilities supportsStereoPairingV3]) {
    v2 |= 4uLL;
  }
  if (+[HMDDeviceCapabilities supportsStereoPairingV4]) {
    return v2 | 8;
  }
  else {
    return v2;
  }
}

- (BOOL)requiresHomePodMiniPairing
{
  return +[HMDDeviceCapabilities requiresHomePodMiniPairing];
}

- (BOOL)isAppleMediaAccessory
{
  return +[HMDDeviceCapabilities isAppleMediaAccessory];
}

- (NSString)currentAccessoryMediaRouteIdentifier
{
  return (NSString *)(id)_mediaRouteIdentifier;
}

- (HMDMediaBrowserDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDMediaBrowserDataSource;
  unint64_t v2 = [(HMDMediaBrowserDataSource *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F357F8]);
    uint64_t v4 = [v3 initWithLocalDomainAndServiceType:*MEMORY[0x263F353D0]];
    airPlayBonjourBrowser = v2->_airPlayBonjourBrowser;
    v2->_airPlayBonjourBrowser = (HAP2AccessoryServerDiscoveryBonjour *)v4;
  }
  return v2;
}

+ (id)shortDescription
{
  return @"HMDMediaBrowserDataSource";
}

@end