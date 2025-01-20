@interface AADeviceInfo
+ (AADeviceInfo)currentInfo;
+ (BOOL)hasiCloudSignOutRestriction;
+ (BOOL)isInternalBuild;
+ (BOOL)isMultiUserMode;
+ (BOOL)locationServicesRestricted;
+ (id)apnsToken;
+ (id)appleIDClientIdentifier;
+ (id)clientInfoHeader;
+ (id)infoDictionary;
+ (id)osVersion;
+ (id)productVersion;
+ (id)serialNumber;
+ (id)udid;
+ (id)userAgentHeader;
- (BOOL)hasCellularCapability;
- (id)apnsToken;
- (id)appleIDClientIdentifier;
- (id)bluetoothMacAddress;
- (id)buildVersion;
- (id)chipIdentifier;
- (id)clientInfoHeader;
- (id)deviceBackingColor;
- (id)deviceClass;
- (id)deviceColor;
- (id)deviceCoverGlassColor;
- (id)deviceEnclosureColor;
- (id)deviceHousingColor;
- (id)deviceInfoDictionary;
- (id)deviceName;
- (id)internationalMobileEquipmentIdentity;
- (id)localSecretType;
- (id)mobileEquipmentIdentifier;
- (id)modelNumber;
- (id)osName;
- (id)osVersion;
- (id)productType;
- (id)productVersion;
- (id)regionCode;
- (id)serialNumber;
- (id)storageCapacity;
- (id)udid;
- (id)uniqueChipIdentifier;
- (id)userAgentHeader;
- (id)wifiMacAddress;
@end

@implementation AADeviceInfo

+ (AADeviceInfo)currentInfo
{
  if (currentInfo_onceToken != -1) {
    dispatch_once(&currentInfo_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)currentInfo_currentInfo;

  return (AADeviceInfo *)v2;
}

uint64_t __27__AADeviceInfo_currentInfo__block_invoke()
{
  currentInfo_currentInfo = objc_alloc_init(AADeviceInfo);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)locationServicesRestricted
{
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  v2 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  char v3 = [v2 containsObject:@"location"];

  return v3;
}

- (id)deviceInfoDictionary
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(AADeviceInfo *)self udid];
  if (v4) {
    [v3 setObject:v4 forKey:@"udid"];
  }
  v5 = [(AADeviceInfo *)self serialNumber];
  if (v5) {
    [v3 setObject:v5 forKey:@"serialNumber"];
  }
  v6 = [(AADeviceInfo *)self regionCode];
  if (v6) {
    [v3 setObject:v6 forKey:@"regionCode"];
  }

  return v3;
}

- (id)osVersion
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)udid
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)serialNumber
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)wifiMacAddress
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)bluetoothMacAddress
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)productVersion
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)productType
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)deviceName
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)deviceColor
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)deviceEnclosureColor
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)deviceCoverGlassColor
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)deviceHousingColor
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)deviceBackingColor
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (BOOL)hasCellularCapability
{
  if (MGGetBoolAnswer()) {
    return 1;
  }

  return MGGetBoolAnswer();
}

- (id)mobileEquipmentIdentifier
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)internationalMobileEquipmentIdentity
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)storageCapacity
{
  v2 = (void *)MGCopyAnswer();
  char v3 = [v2 objectForKey:*MEMORY[0x1E4FBA0F8]];

  return v3;
}

- (id)osName
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F1CD18]];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)buildVersion
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F1CD10]];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)regionCode
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)apnsToken
{
  id v2 = objc_alloc(MEMORY[0x1E4F4E1E8]);
  char v3 = (void *)[v2 initWithEnvironmentName:*MEMORY[0x1E4F4E1D0]];
  v4 = [v3 publicToken];

  return v4;
}

- (id)deviceClass
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)modelNumber
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)chipIdentifier
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)uniqueChipIdentifier
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)appleIDClientIdentifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], @"AppleIDClientIdentifier");
  char v3 = (const void *)*MEMORY[0x1E4F3BC70];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching(Mutable, &result);
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = result == 0;
  }
  if (v5)
  {
    OSStatus v6 = v4;
    v7 = _AALogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v18 = v6;
        _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching result: %d", buf, 8u);
      }

      v9 = [MEMORY[0x1E4F29128] UUID];
      v10 = [v9 UUIDString];
      v11 = [v10 dataUsingEncoding:4];

      v14 = [v9 UUIDString];
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B578]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v11);
      CFDictionaryRemoveValue(Mutable, v3);
      if (SecItemAdd(Mutable, 0))
      {
        v12 = _AALogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "There was an error saving the AppleIDClientIdentifier to the keychain", buf, 2u);
        }
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching succeeded with empty results", buf, 2u);
      }

      v14 = 0;
    }
  }
  else
  {
    id v13 = [NSString alloc];
    v14 = (void *)[v13 initWithData:result encoding:4];
    CFRelease(result);
  }
  CFRelease(Mutable);

  return v14;
}

- (id)clientInfoHeader
{
  char v3 = NSString;
  OSStatus v4 = [(AADeviceInfo *)self productType];
  BOOL v5 = [v3 stringWithFormat:@"%@", v4];

  OSStatus v6 = NSString;
  v7 = [(AADeviceInfo *)self osName];
  BOOL v8 = [(AADeviceInfo *)self osVersion];
  v9 = [(AADeviceInfo *)self buildVersion];
  v10 = [v6 stringWithFormat:@"%@;%@;%@", v7, v8, v9];

  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 infoDictionary];
  uint64_t v13 = *MEMORY[0x1E4F1D020];
  v14 = [v12 objectForKey:*MEMORY[0x1E4F1D020]];

  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 infoDictionary];
  v17 = [v16 objectForKey:v13];

  OSStatus v18 = NSString;
  uint64_t v19 = [v11 bundleIdentifier];
  v20 = [v15 bundleIdentifier];
  v21 = [v18 stringWithFormat:@"%@/%@ (%@/%@)", v19, v14, v20, v17];

  v22 = [NSString stringWithFormat:@"<%@> <%@> <%@>", v5, v10, v21];

  return v22;
}

- (id)userAgentHeader
{
  char v3 = [(AADeviceInfo *)self productVersion];
  OSStatus v4 = [(AADeviceInfo *)self buildVersion];
  BOOL v5 = [(AADeviceInfo *)self deviceClass];
  OSStatus v6 = [NSString stringWithFormat:@"iOS %@ %@ %@ Setup Assistant", v3, v4, v5];

  return v6;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_125);
  }
  return isInternalBuild_isInternalBuild;
}

uint64_t __31__AADeviceInfo_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)isMultiUserMode
{
  if (isMultiUserMode_onceToken != -1) {
    dispatch_once(&isMultiUserMode_onceToken, &__block_literal_global_128);
  }
  return isMultiUserMode_isMultiUserMode;
}

void __31__AADeviceInfo_isMultiUserMode__block_invoke()
{
  id v1 = (id)MKBUserTypeDeviceMode();
  v0 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
  if ([v0 isEqualToString:*MEMORY[0x1E4F78108]]) {
    isMultiUserMode_isMultiUserMode = 1;
  }
}

- (id)localSecretType
{
  return (id)[MEMORY[0x1E4F46FF0] localSecretType];
}

+ (BOOL)hasiCloudSignOutRestriction
{
  return 0;
}

+ (id)infoDictionary
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 deviceInfoDictionary];

  return v3;
}

+ (id)udid
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 udid];

  return v3;
}

+ (id)osVersion
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 osVersion];

  return v3;
}

+ (id)serialNumber
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 serialNumber];

  return v3;
}

+ (id)apnsToken
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 apnsToken];

  return v3;
}

+ (id)appleIDClientIdentifier
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 appleIDClientIdentifier];

  return v3;
}

+ (id)clientInfoHeader
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 clientInfoHeader];

  return v3;
}

+ (id)userAgentHeader
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 userAgentHeader];

  return v3;
}

+ (id)productVersion
{
  id v2 = objc_alloc_init((Class)a1);
  char v3 = [v2 productVersion];

  return v3;
}

@end