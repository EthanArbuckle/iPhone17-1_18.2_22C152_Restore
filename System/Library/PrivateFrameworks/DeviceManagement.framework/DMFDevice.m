@interface DMFDevice
+ (id)_sanitizedDeviceKey:(id)a3;
+ (id)propertyNameForKey:(id)a3;
- (NSArray)activeManagedUsers;
- (NSArray)autoSetupAdminAccounts;
- (NSArray)skippedSetupPanes;
- (NSDate)lastCloudBackupDate;
- (NSDictionary)errorsForKeys;
- (NSDictionary)installedExtensions;
- (NSDictionary)osUpdateSettings;
- (NSDictionary)serviceSubscriptions;
- (NSDictionary)xsanConfiguration;
- (NSNumber)availableCapacity;
- (NSNumber)batteryLevel;
- (NSNumber)capacity;
- (NSNumber)cellularTechnology;
- (NSNumber)deviceType;
- (NSNumber)enforcedSoftwareUpdateDelay;
- (NSNumber)iTunesStoreAccountIsActive;
- (NSNumber)isActivationLockEnabled;
- (NSNumber)isAppAnalyticsEnabled;
- (NSNumber)isAppleInternal;
- (NSNumber)isAwaitingConfiguration;
- (NSNumber)isCloudBackupEnabled;
- (NSNumber)isDataRoamingEnabled;
- (NSNumber)isDeviceLocatorServiceEnabled;
- (NSNumber)isDiagnosticSubmissionEnabled;
- (NSNumber)isDoNotDisturbInEffect;
- (NSNumber)isEphemeralMultiUser;
- (NSNumber)isInSingleAppMode;
- (NSNumber)isLostModeEnabled;
- (NSNumber)isNetworkTethered;
- (NSNumber)isPersonalHotspotEnabled;
- (NSNumber)isRoaming;
- (NSNumber)isSupervised;
- (NSNumber)isSystemIntegrityProtectionEnabled;
- (NSNumber)isVoiceRoamingEnabled;
- (NSNumber)maximumResidentUsers;
- (NSString)EASIdentifier;
- (NSString)ICCID;
- (NSString)IMEI;
- (NSString)MEID;
- (NSString)bluetoothAddress;
- (NSString)buildVersion;
- (NSString)carrierSettingsVersion;
- (NSString)currentCarrierNetwork;
- (NSString)currentMCC;
- (NSString)currentMNC;
- (NSString)destinationIdentifier;
- (NSString)deviceName;
- (NSString)hostName;
- (NSString)iTunesStoreAccountHash;
- (NSString)localHostName;
- (NSString)marketingName;
- (NSString)model;
- (NSString)modelName;
- (NSString)modemFirmwareVersion;
- (NSString)osVersion;
- (NSString)phoneNumber;
- (NSString)productName;
- (NSString)serialNumber;
- (NSString)subscriberCarrierNetwork;
- (NSString)subscriberMCC;
- (NSString)subscriberMNC;
- (NSString)uniqueIdentifier;
- (NSString)wifiAddress;
- (id)initPrivate;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (id)valueForUndefinedKey:(id)a3;
- (void)setErrorsForKeys:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation DMFDevice

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)DMFDevice;
  return [(DMFDevice *)&v3 init];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  v7 = +[DMFDevice propertyNameForKey:a4];
  SEL v8 = NSSelectorFromString(v7);
  v10.receiver = self;
  v10.super_class = (Class)DMFDevice;
  if ([(DMFDevice *)&v10 respondsToSelector:v8])
  {
    v9.receiver = self;
    v9.super_class = (Class)DMFDevice;
    [(DMFDevice *)&v9 setValue:v6 forKey:v7];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  v4 = +[DMFDevice propertyNameForKey:a3];
  NSSelectorFromString(v4);
  if (objc_opt_respondsToSelector())
  {
    v7.receiver = self;
    v7.super_class = (Class)DMFDevice;
    v5 = [(DMFDevice *)&v7 valueForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)propertyNameForKey:(id)a3
{
  id v4 = a3;
  if (propertyNameForKey__onceToken != -1) {
    dispatch_once(&propertyNameForKey__onceToken, &__block_literal_global_5);
  }
  v5 = [(id)propertyNameForKey__mappedKeys objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [a1 _sanitizedDeviceKey:v4];
  }
  SEL v8 = v7;

  return v8;
}

void __32__DMFDevice_propertyNameForKey___block_invoke()
{
  v3[18] = *MEMORY[0x1E4F143B8];
  v2[0] = @"DMFDeviceBluetoothMACKey";
  v2[1] = @"DMFDeviceNameKey";
  v3[0] = @"bluetoothAddress";
  v3[1] = @"deviceName";
  v2[2] = @"DMFDeviceTypeKey";
  v2[3] = @"DMFDeviceAwaitingConfigurationKey";
  v3[2] = @"deviceType";
  v3[3] = @"isAwaitingConfiguration";
  v2[4] = @"DMFDeviceIsDNDInEffectKey";
  v2[5] = @"DMFDeviceOSVersionKey";
  v3[4] = @"isDoNotDisturbInEffect";
  v3[5] = @"osVersion";
  v2[6] = @"DMFDeviceWiFiMACKey";
  v2[7] = @"DMFDeviceAppAnalyticsEnabledKey";
  v3[6] = @"wifiAddress";
  v3[7] = @"isAppAnalyticsEnabled";
  v2[8] = @"DMFDeviceDiagnosticSubmissionEnabledKey";
  v2[9] = @"DMFDeviceEASIdentifierKey";
  v3[8] = @"isDiagnosticSubmissionEnabled";
  v3[9] = @"EASIdentifier";
  v2[10] = @"DMFDeviceICCIDKey";
  v2[11] = @"DMFDeviceIMEIKey";
  v3[10] = @"ICCID";
  v3[11] = @"IMEI";
  v2[12] = @"DMFDeviceMEIDKey";
  v2[13] = @"DMFDeviceDataRoamingEnabledKey";
  v3[12] = @"MEID";
  v3[13] = @"isDataRoamingEnabled";
  v2[14] = @"DMFDevicePersonalHotspotEnabledKey";
  v2[15] = @"DMFDeviceVoiceRoamingEnabledKey";
  v3[14] = @"isPersonalHotspotEnabled";
  v3[15] = @"isVoiceRoamingEnabled";
  v2[16] = @"DMFDeviceSystemIntegrityProtectionEnabledKey";
  v2[17] = @"DMFDeviceOSUpdateSettingsKey";
  v3[16] = @"isSystemIntegrityProtectionEnabled";
  v3[17] = @"osUpdateSettings";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:18];
  v1 = (void *)propertyNameForKey__mappedKeys;
  propertyNameForKey__mappedKeys = v0;
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6 = (NSString *)a3;
  v15 = a4;
  NSSelectorFromString(v6);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v7 = +[DMFDevice propertyNameForKey:v6];

    id v6 = (NSString *)v7;
  }
  SEL v8 = [NSString stringWithFormat:@"%@WithError:", v6];
  SEL v9 = NSSelectorFromString(v8);

  NSSelectorFromString(v6);
  if (objc_opt_respondsToSelector())
  {
    objc_super v10 = [(DMFDevice *)self methodSignatureForSelector:v9];
    v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    [v11 setTarget:self];
    [v11 setSelector:v9];
    [v11 setArgument:&v15 atIndex:2];
    [v11 invoke];
    id v14 = 0;
    [v11 getReturnValue:&v14];
    id v12 = v14;
  }
  else if (objc_opt_respondsToSelector())
  {
    id v12 = [(DMFDevice *)self valueForKey:v6];
  }
  else if (a4)
  {
    DMFErrorWithCodeAndUserInfo(111, 0);
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_sanitizedDeviceKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"^DMFDevice(.*)Key$", @"$1", 1024, 0, objc_msgSend(v3, "length"));

  v5 = [v4 substringToIndex:1];
  id v6 = [v5 lowercaseString];
  uint64_t v7 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v6);

  return v7;
}

- (NSNumber)availableCapacity
{
  return self->_availableCapacity;
}

- (NSNumber)batteryLevel
{
  return self->_batteryLevel;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSNumber)capacity
{
  return self->_capacity;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (NSNumber)isAppleInternal
{
  return self->_isAppleInternal;
}

- (NSNumber)isAwaitingConfiguration
{
  return self->_isAwaitingConfiguration;
}

- (NSNumber)isDeviceLocatorServiceEnabled
{
  return self->_isDeviceLocatorServiceEnabled;
}

- (NSNumber)isDoNotDisturbInEffect
{
  return self->_isDoNotDisturbInEffect;
}

- (NSNumber)isInSingleAppMode
{
  return self->_isInSingleAppMode;
}

- (NSNumber)isLostModeEnabled
{
  return self->_isLostModeEnabled;
}

- (NSString)iTunesStoreAccountHash
{
  return self->_iTunesStoreAccountHash;
}

- (NSNumber)iTunesStoreAccountIsActive
{
  return self->_iTunesStoreAccountIsActive;
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)wifiAddress
{
  return self->_wifiAddress;
}

- (NSNumber)isAppAnalyticsEnabled
{
  return self->_isAppAnalyticsEnabled;
}

- (NSNumber)isCloudBackupEnabled
{
  return self->_isCloudBackupEnabled;
}

- (NSNumber)isDiagnosticSubmissionEnabled
{
  return self->_isDiagnosticSubmissionEnabled;
}

- (NSNumber)isSupervised
{
  return self->_isSupervised;
}

- (NSDate)lastCloudBackupDate
{
  return self->_lastCloudBackupDate;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)carrierSettingsVersion
{
  return self->_carrierSettingsVersion;
}

- (NSNumber)cellularTechnology
{
  return self->_cellularTechnology;
}

- (NSString)currentCarrierNetwork
{
  return self->_currentCarrierNetwork;
}

- (NSString)currentMCC
{
  return self->_currentMCC;
}

- (NSString)currentMNC
{
  return self->_currentMNC;
}

- (NSString)EASIdentifier
{
  return self->_EASIdentifier;
}

- (NSNumber)enforcedSoftwareUpdateDelay
{
  return self->_enforcedSoftwareUpdateDelay;
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (NSNumber)isActivationLockEnabled
{
  return self->_isActivationLockEnabled;
}

- (NSNumber)isDataRoamingEnabled
{
  return self->_isDataRoamingEnabled;
}

- (NSNumber)isEphemeralMultiUser
{
  return self->_isEphemeralMultiUser;
}

- (NSNumber)isNetworkTethered
{
  return self->_isNetworkTethered;
}

- (NSNumber)isPersonalHotspotEnabled
{
  return self->_isPersonalHotspotEnabled;
}

- (NSNumber)isRoaming
{
  return self->_isRoaming;
}

- (NSNumber)isVoiceRoamingEnabled
{
  return self->_isVoiceRoamingEnabled;
}

- (NSNumber)maximumResidentUsers
{
  return self->_maximumResidentUsers;
}

- (NSString)MEID
{
  return self->_MEID;
}

- (NSString)modemFirmwareVersion
{
  return self->_modemFirmwareVersion;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSDictionary)serviceSubscriptions
{
  return self->_serviceSubscriptions;
}

- (NSArray)skippedSetupPanes
{
  return self->_skippedSetupPanes;
}

- (NSString)subscriberCarrierNetwork
{
  return self->_subscriberCarrierNetwork;
}

- (NSString)subscriberMCC
{
  return self->_subscriberMCC;
}

- (NSString)subscriberMNC
{
  return self->_subscriberMNC;
}

- (NSArray)activeManagedUsers
{
  return self->_activeManagedUsers;
}

- (NSArray)autoSetupAdminAccounts
{
  return self->_autoSetupAdminAccounts;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (NSDictionary)installedExtensions
{
  return self->_installedExtensions;
}

- (NSNumber)isSystemIntegrityProtectionEnabled
{
  return self->_isSystemIntegrityProtectionEnabled;
}

- (NSString)localHostName
{
  return self->_localHostName;
}

- (NSDictionary)osUpdateSettings
{
  return self->_osUpdateSettings;
}

- (NSDictionary)xsanConfiguration
{
  return self->_xsanConfiguration;
}

- (NSString)destinationIdentifier
{
  return self->_destinationIdentifier;
}

- (NSDictionary)errorsForKeys
{
  return self->_errorsForKeys;
}

- (void)setErrorsForKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsForKeys, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_xsanConfiguration, 0);
  objc_storeStrong((id *)&self->_osUpdateSettings, 0);
  objc_storeStrong((id *)&self->_localHostName, 0);
  objc_storeStrong((id *)&self->_isSystemIntegrityProtectionEnabled, 0);
  objc_storeStrong((id *)&self->_installedExtensions, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_autoSetupAdminAccounts, 0);
  objc_storeStrong((id *)&self->_activeManagedUsers, 0);
  objc_storeStrong((id *)&self->_subscriberMNC, 0);
  objc_storeStrong((id *)&self->_subscriberMCC, 0);
  objc_storeStrong((id *)&self->_subscriberCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_skippedSetupPanes, 0);
  objc_storeStrong((id *)&self->_serviceSubscriptions, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_modemFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_MEID, 0);
  objc_storeStrong((id *)&self->_maximumResidentUsers, 0);
  objc_storeStrong((id *)&self->_isVoiceRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_isRoaming, 0);
  objc_storeStrong((id *)&self->_isPersonalHotspotEnabled, 0);
  objc_storeStrong((id *)&self->_isNetworkTethered, 0);
  objc_storeStrong((id *)&self->_isEphemeralMultiUser, 0);
  objc_storeStrong((id *)&self->_isDataRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_isActivationLockEnabled, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_enforcedSoftwareUpdateDelay, 0);
  objc_storeStrong((id *)&self->_EASIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMNC, 0);
  objc_storeStrong((id *)&self->_currentMCC, 0);
  objc_storeStrong((id *)&self->_currentCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_cellularTechnology, 0);
  objc_storeStrong((id *)&self->_carrierSettingsVersion, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_lastCloudBackupDate, 0);
  objc_storeStrong((id *)&self->_isSupervised, 0);
  objc_storeStrong((id *)&self->_isDiagnosticSubmissionEnabled, 0);
  objc_storeStrong((id *)&self->_isCloudBackupEnabled, 0);
  objc_storeStrong((id *)&self->_isAppAnalyticsEnabled, 0);
  objc_storeStrong((id *)&self->_wifiAddress, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_iTunesStoreAccountIsActive, 0);
  objc_storeStrong((id *)&self->_iTunesStoreAccountHash, 0);
  objc_storeStrong((id *)&self->_isLostModeEnabled, 0);
  objc_storeStrong((id *)&self->_isInSingleAppMode, 0);
  objc_storeStrong((id *)&self->_isDoNotDisturbInEffect, 0);
  objc_storeStrong((id *)&self->_isDeviceLocatorServiceEnabled, 0);
  objc_storeStrong((id *)&self->_isAwaitingConfiguration, 0);
  objc_storeStrong((id *)&self->_isAppleInternal, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_availableCapacity, 0);
}

@end