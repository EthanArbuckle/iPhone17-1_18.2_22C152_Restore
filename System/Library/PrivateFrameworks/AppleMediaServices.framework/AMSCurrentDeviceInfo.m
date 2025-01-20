@interface AMSCurrentDeviceInfo
- (AMSPhoneNumberContextInfo)voicePreferredPhoneNumberContextInfo;
- (AMSPromise)carrierNamesPromise;
- (AMSPromise)voicePreferredPACToken;
- (BOOL)deviceIsAppleTV;
- (BOOL)deviceIsAppleTVSimulator;
- (BOOL)deviceIsAppleWatch;
- (BOOL)deviceIsAppleWatchSimulator;
- (BOOL)deviceIsAudioAccessory;
- (BOOL)deviceIsBundle;
- (BOOL)deviceIsMac;
- (BOOL)deviceIsPasscodeProtected;
- (BOOL)deviceIsRealityDevice;
- (BOOL)deviceIsRealityDeviceSimulator;
- (BOOL)deviceIsiPad;
- (BOOL)deviceIsiPadSimulator;
- (BOOL)deviceIsiPhone;
- (BOOL)deviceIsiPhoneSimulator;
- (BOOL)deviceIsiPod;
- (BOOL)deviceIsiPodSimulator;
- (BOOL)isRunningInStoreDemoMode;
- (BOOL)isSecureElementAvailable;
- (NSArray)carrierNames;
- (NSNumber)screenHeight;
- (NSNumber)screenScale;
- (NSNumber)screenWidth;
- (NSString)buildVersion;
- (NSString)compatibleProductType;
- (NSString)deviceGUID;
- (NSString)deviceName;
- (NSString)hardwarePlatform;
- (NSString)localIPAddress;
- (NSString)modelPartNumber;
- (NSString)name;
- (NSString)operatingSystem;
- (NSString)phoneNumber;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)regionCode;
- (NSString)secureElementID;
- (NSString)serialNumber;
- (NSString)thinnedAppVariantId;
- (NSString)uniqueDeviceId;
- (int64_t)biometricState;
- (void)setBiometricState:(int64_t)a3;
@end

@implementation AMSCurrentDeviceInfo

- (NSString)productType
{
  return +[AMSDevice productType];
}

- (NSString)productVersion
{
  return +[AMSDevice productVersion];
}

- (NSString)hardwarePlatform
{
  return +[AMSDevice hardwarePlatform];
}

- (BOOL)deviceIsAppleWatch
{
  return +[AMSDevice deviceIsAppleWatch];
}

- (BOOL)deviceIsAppleTV
{
  return +[AMSDevice deviceIsAppleTV];
}

- (NSString)buildVersion
{
  return +[AMSDevice buildVersion];
}

- (int64_t)biometricState
{
  return +[AMSDevice biometricState];
}

- (void)setBiometricState:(int64_t)a3
{
}

- (NSString)compatibleProductType
{
  return +[AMSDevice compatibleProductType];
}

- (NSString)deviceGUID
{
  return +[AMSDevice deviceGUID];
}

- (NSString)deviceName
{
  return +[AMSDevice deviceName];
}

- (NSString)localIPAddress
{
  return +[AMSDevice localIPAddress];
}

- (NSString)modelPartNumber
{
  return +[AMSDevice modelPartNumber];
}

- (NSString)operatingSystem
{
  return +[AMSDevice operatingSystem];
}

- (NSString)regionCode
{
  return +[AMSDevice regionCode];
}

- (BOOL)isRunningInStoreDemoMode
{
  return +[AMSDevice isRunningInStoreDemoMode];
}

- (NSString)secureElementID
{
  return +[AMSDevice secureElementID];
}

- (NSNumber)screenScale
{
  return +[AMSDevice screenScale];
}

- (NSNumber)screenHeight
{
  return +[AMSDevice screenHeight];
}

- (NSNumber)screenWidth
{
  return +[AMSDevice screenWidth];
}

- (BOOL)isSecureElementAvailable
{
  return +[AMSDevice isSecureElementAvailable];
}

- (NSString)serialNumber
{
  return +[AMSDevice serialNumber];
}

- (NSString)thinnedAppVariantId
{
  return +[AMSDevice thinnedAppVariantId];
}

- (NSString)uniqueDeviceId
{
  return +[AMSDevice uniqueDeviceId];
}

- (BOOL)deviceIsAudioAccessory
{
  return +[AMSDevice deviceIsAudioAccessory];
}

- (BOOL)deviceIsiPad
{
  return +[AMSDevice deviceIsiPad];
}

- (BOOL)deviceIsiPhone
{
  return +[AMSDevice deviceIsiPhone];
}

- (BOOL)deviceIsiPod
{
  return +[AMSDevice deviceIsiPod];
}

- (BOOL)deviceIsMac
{
  return +[AMSDevice deviceIsMac];
}

- (BOOL)deviceIsRealityDevice
{
  return +[AMSDevice deviceIsRealityDevice];
}

- (BOOL)deviceIsBundle
{
  return +[AMSDevice deviceIsBundle];
}

- (BOOL)deviceIsPasscodeProtected
{
  return +[AMSDevice deviceIsPasscodeProtected];
}

- (NSArray)carrierNames
{
  return +[AMSDevice carrierNames];
}

- (NSString)name
{
  return +[AMSDevice name];
}

- (NSString)phoneNumber
{
  return +[AMSDevice phoneNumber];
}

- (AMSPromise)carrierNamesPromise
{
  return (AMSPromise *)+[AMSDevice carrierNamesPromise];
}

- (BOOL)deviceIsAppleTVSimulator
{
  return +[AMSDevice deviceIsAppleTVSimulator];
}

- (BOOL)deviceIsAppleWatchSimulator
{
  return +[AMSDevice deviceIsAppleWatchSimulator];
}

- (BOOL)deviceIsiPadSimulator
{
  return +[AMSDevice deviceIsiPadSimulator];
}

- (BOOL)deviceIsiPhoneSimulator
{
  return +[AMSDevice deviceIsiPhoneSimulator];
}

- (BOOL)deviceIsiPodSimulator
{
  return +[AMSDevice deviceIsiPodSimulator];
}

- (BOOL)deviceIsRealityDeviceSimulator
{
  return +[AMSDevice deviceIsRealityDeviceSimulator];
}

- (AMSPhoneNumberContextInfo)voicePreferredPhoneNumberContextInfo
{
  return (AMSPhoneNumberContextInfo *)+[AMSDevice voicePreferredPhoneNumberContextInfo];
}

- (AMSPromise)voicePreferredPACToken
{
  return (AMSPromise *)+[AMSDevice voicePreferredPACToken];
}

@end