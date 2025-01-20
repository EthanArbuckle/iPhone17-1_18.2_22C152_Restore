@interface HMDMediaBrowserDataSource
+ (id)shortDescription;
- (BOOL)isAppleMediaAccessory;
- (BOOL)requiresHomePod2ndGenPairing;
- (BOOL)requiresHomePodMiniPairing;
- (HMDDevice)currentDevice;
- (HMFProductInfo)productInfo;
- (HMFSystemInfo)systemInfo;
- (NSString)currentAccessoryMediaRouteIdentifier;
- (id)createUnassociatedAppleMediaAccessory:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 rawAccessoryCapabilities:(id)a8 rawResidentCapabilities:(id)a9 messageDispatcher:(id)a10;
- (id)createUnassociatedHomePodAccessory:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 requiredPairingCapabilities:(unint64_t)a8 minimumPairingSoftware:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12;
- (id)performOperation:(id)a3;
- (unint64_t)appleMediaAccessoryVariant;
- (unint64_t)supportedStereoPairVersions;
@end

@implementation HMDMediaBrowserDataSource

+ (id)shortDescription
{
  return @"HMDMediaBrowserDataSource";
}

- (id)createUnassociatedHomePodAccessory:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 requiredPairingCapabilities:(unint64_t)a8 minimumPairingSoftware:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12
{
  id v17 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = [[HMDUnassociatedAppleHomePodAccessory alloc] initWithIdentifier:v24 name:v23 category:v22 productColor:a6 idsIdentifierString:v21 requiredPairingCapabilities:a8 minimumPairingSoftware:v20 rawAccessoryCapabilities:v19 rawResidentCapabilities:v18 messageDispatcher:v17];

  return v25;
}

- (id)createUnassociatedAppleMediaAccessory:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 rawAccessoryCapabilities:(id)a8 rawResidentCapabilities:(id)a9 messageDispatcher:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [[HMDUnassociatedAppleMediaAccessory alloc] initWithIdentifier:v22 name:v21 category:v20 productColor:a6 idsIdentifierString:v19 rawAccessoryCapabilities:v18 rawResidentCapabilities:v17 messageDispatcher:v16];

  return v23;
}

- (id)performOperation:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F65550];
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
  return (HMFProductInfo *)[MEMORY[0x1E4F65548] productInfo];
}

- (HMFSystemInfo)systemInfo
{
  return (HMFSystemInfo *)[MEMORY[0x1E4F65570] systemInfo];
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

@end