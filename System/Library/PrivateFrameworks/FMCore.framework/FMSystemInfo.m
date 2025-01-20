@interface FMSystemInfo
+ (id)sharedInstance;
- (BOOL)hasSEP;
- (BOOL)isDeviceSecured;
- (BOOL)isInternalBuild;
- (id)btMacAddress;
- (id)chipId;
- (id)deviceClass;
- (id)deviceModelName;
- (id)deviceName;
- (id)deviceUDID;
- (id)ecid;
- (id)imei;
- (id)meid;
- (id)osBuildVersion;
- (id)osVersion;
- (id)ownerAccount;
- (id)productName;
- (id)productType;
- (id)serialNumber;
- (id)wifiMacAddress;
@end

@implementation FMSystemInfo

- (BOOL)isInternalBuild
{
  return MEMORY[0x1F40CD648]("com.apple.icloud.FMCore", a2);
}

uint64_t __30__FMSystemInfo_ios_deviceUDID__block_invoke(uint64_t a1)
{
  deviceUDID_deviceIdentifier = [*(id *)(a1 + 32) _deviceInfoForKey:@"UniqueDeviceID"];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance___instance_0;
  return v2;
}

- (id)ownerAccount
{
  return +[FMOwnerAccount sharedInstance];
}

uint64_t __30__FMSystemInfo_sharedInstance__block_invoke()
{
  sharedInstance___instance_0 = objc_alloc_init(FMSystemInfo_ios);
  return MEMORY[0x1F41817F8]();
}

uint64_t __31__FMSystemInfo_ios_productName__block_invoke(uint64_t a1)
{
  productName__value = [*(id *)(a1 + 32) _deviceInfoForKey:@"ProductName"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__FMSystemInfo_ios_serialNumber__block_invoke(uint64_t a1)
{
  serialNumber__value = [*(id *)(a1 + 32) _deviceInfoForKey:@"SerialNumber"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __24__FMSystemInfo_ios_ecid__block_invoke(uint64_t a1)
{
  ecid__value = [*(id *)(a1 + 32) _deviceInfoNumberForKey:@"UniqueChipID"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __26__FMSystemInfo_ios_chipId__block_invoke(uint64_t a1)
{
  chipId__value = [*(id *)(a1 + 32) _deviceInfoNumberForKey:@"ChipID"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __34__FMSystemInfo_ios_wifiMacAddress__block_invoke(uint64_t a1)
{
  wifiMacAddress__value = [*(id *)(a1 + 32) _deviceInfoForKey:@"WifiAddress"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __32__FMSystemInfo_ios_btMacAddress__block_invoke(uint64_t a1)
{
  btMacAddress__value = [*(id *)(a1 + 32) _deviceInfoForKey:@"BluetoothAddress"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __26__FMSystemInfo_ios_hasSEP__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _BOOLDeviceInfoForKey:@"HasSEP"];
  hasSEP__value = result;
  return result;
}

void __31__FMSystemInfo_osx_productName__block_invoke()
{
  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    id v3 = v0;
    uint64_t v1 = [v0 objectForKeyedSubscript:*MEMORY[0x1E4F1CD18]];
    v2 = (void *)productName__value_0;
    productName__value_0 = v1;

    v0 = v3;
  }
}

- (id)productType
{
  return 0;
}

- (id)productName
{
  return 0;
}

- (id)deviceClass
{
  return 0;
}

- (id)deviceUDID
{
  return 0;
}

- (id)osVersion
{
  return 0;
}

- (id)osBuildVersion
{
  return 0;
}

- (id)deviceName
{
  return 0;
}

- (id)deviceModelName
{
  return 0;
}

- (id)serialNumber
{
  return 0;
}

- (id)imei
{
  return 0;
}

- (id)meid
{
  return 0;
}

- (id)ecid
{
  return 0;
}

- (id)chipId
{
  return 0;
}

- (id)wifiMacAddress
{
  return 0;
}

- (id)btMacAddress
{
  return 0;
}

- (BOOL)isDeviceSecured
{
  return 0;
}

- (BOOL)hasSEP
{
  return 0;
}

@end