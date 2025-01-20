@interface DMFFetchDevicePropertiesRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (NSSet)currentDevicePropertyKeys;
+ (id)devicePropertyKeysForPlatform:(unint64_t)a3;
+ (id)permittedPlatforms;
- (DMFFetchDevicePropertiesRequest)initWithCoder:(id)a3;
- (NSArray)propertyKeys;
- (void)encodeWithCoder:(id)a3;
- (void)setPropertyKeys:(id)a3;
@end

@implementation DMFFetchDevicePropertiesRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB760;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchDevicePropertiesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchDevicePropertiesRequest;
  v5 = [(CATTaskRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"propertyKeys"];
    propertyKeys = v5->_propertyKeys;
    v5->_propertyKeys = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchDevicePropertiesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchDevicePropertiesRequest *)self propertyKeys];
  [v4 encodeObject:v5 forKey:@"propertyKeys"];
}

+ (NSSet)currentDevicePropertyKeys
{
  return (NSSet *)[a1 devicePropertyKeysForPlatform:1];
}

+ (id)devicePropertyKeysForPlatform:(unint64_t)a3
{
  if (devicePropertyKeysForPlatform__onceToken != -1) {
    dispatch_once(&devicePropertyKeysForPlatform__onceToken, &__block_literal_global_10);
  }
  id v4 = (void *)devicePropertyKeysForPlatform__keysByPlatform;
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  objc_super v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __65__DMFFetchDevicePropertiesRequest_devicePropertyKeysForPlatform___block_invoke()
{
  v29[21] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v29[0] = @"DMFDeviceAvailableCapacityKey";
  v29[1] = @"DMFDeviceAwaitingConfigurationKey";
  v29[2] = @"DMFDeviceBatteryLevelKey";
  v29[3] = @"DMFDeviceBluetoothMACKey";
  v29[4] = @"DMFDeviceBuildVersionKey";
  v29[5] = @"DMFDeviceCapacityKey";
  v29[6] = @"DMFDeviceiTunesStoreAccountHashKey";
  v29[7] = @"DMFDeviceiTunesStoreAccountIsActiveKey";
  v29[8] = @"DMFDeviceIsAppleInternalKey";
  v29[9] = @"DMFDeviceIsDeviceLocatorServiceEnabledKey";
  v29[10] = @"DMFDeviceIsDNDInEffectKey";
  v29[11] = @"DMFDeviceIsLostModeEnabledKey";
  v29[12] = @"DMFDeviceMarketingNameKey";
  v29[13] = @"DMFDeviceModelKey";
  v29[14] = @"DMFDeviceModelNameKey";
  v29[15] = @"DMFDeviceNameKey";
  v29[16] = @"DMFDeviceOSVersionKey";
  v29[17] = @"DMFDeviceProductNameKey";
  v29[18] = @"DMFDeviceSerialNumberKey";
  v29[19] = @"DMFDeviceTypeKey";
  v29[20] = @"DMFDeviceWiFiMACKey";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:21];
  v2 = [v0 setWithArray:v1];

  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v28[0] = @"DMFDeviceAppAnalyticsEnabledKey";
  v28[1] = @"DMFDeviceDiagnosticSubmissionEnabledKey";
  v28[2] = @"DMFDeviceIsCloudBackupEnabledKey";
  v28[3] = @"DMFDeviceIsSupervisedKey";
  v28[4] = @"DMFDeviceLastCloudBackupDateKey";
  v28[5] = @"DMFDeviceUniqueIdentifierKey";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];
  v5 = [v3 setWithArray:v4];
  objc_super v6 = [v2 setByAddingObjectsFromSet:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = @"DMFDeviceCarrierSettingsVersionKey";
  v27[1] = @"DMFDeviceCellularTechnologyKey";
  v27[2] = @"DMFDeviceCurrentCarrierNetworkKey";
  v27[3] = @"DMFDeviceCurrentMCCKey";
  v27[4] = @"DMFDeviceCurrentMNCKey";
  v27[5] = @"DMFDeviceDataRoamingEnabledKey";
  v27[6] = @"DMFDeviceEnforcedSoftwareUpdateDelayKey";
  v27[7] = @"DMFDeviceIsActivationLockEnabledKey";
  v27[8] = @"DMFDeviceEASIdentifierKey";
  v27[9] = @"DMFDeviceICCIDKey";
  v27[10] = @"DMFDeviceIMEIKey";
  v27[11] = @"DMFDeviceIsEphemeralMultiUserKey";
  v27[12] = @"DMFDeviceIsNetworkTetheredKey";
  v27[13] = @"DMFDeviceIsRoamingKey";
  v27[14] = @"DMFDeviceMaximumResidentUsersKey";
  v27[15] = @"DMFDeviceMEIDKey";
  v27[16] = @"DMFDeviceModemFirmwareVersionKey";
  v27[17] = @"DMFDevicePersonalHotspotEnabledKey";
  v27[18] = @"DMFDevicePhoneNumberKey";
  v27[19] = @"DMFDeviceSkippedSetupPanesKey";
  v27[20] = @"DMFDeviceSubscriberCarrierNetworkKey";
  v27[21] = @"DMFDeviceSubscriberMCCKey";
  v27[22] = @"DMFDeviceSubscriberMNCKey";
  v27[23] = @"DMFDeviceVoiceRoamingEnabledKey";
  v27[24] = @"DMFDeviceServiceSubscriptionsKey";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:25];
  uint64_t v9 = [v7 setWithArray:v8];
  v10 = [v6 setByAddingObjectsFromSet:v9];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = @"DMFDeviceActiveManagedUsersKey";
  v26[1] = @"DMFDeviceAutoSetupAdminAccountsKey";
  v26[2] = @"DMFDeviceHostNameKey";
  v26[3] = @"DMFDeviceInstalledExtensionsKey";
  v26[4] = @"DMFDeviceLocalHostNameKey";
  v26[5] = @"DMFDeviceOSUpdateSettingsKey";
  v26[6] = @"DMFDeviceSystemIntegrityProtectionEnabledKey";
  v26[7] = @"DMFDeviceXsanConfigurationKey";
  objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:8];
  v13 = [v11 setWithArray:v12];
  v14 = [v2 setByAddingObjectsFromSet:v13];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = @"DMFDeviceDestinationIdentifierKey";
  v25[1] = @"DMFDeviceDestinationIdentifierKey";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v17 = [v15 setWithArray:v16];
  v18 = [v6 setByAddingObjectsFromSet:v17];

  v19 = [MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
  v20 = [v6 setByAddingObjectsFromSet:v19];

  v23[0] = &unk_1F18AA710;
  v23[1] = &unk_1F18AA728;
  v24[0] = v10;
  v24[1] = v14;
  v23[2] = &unk_1F18AA758;
  v23[3] = &unk_1F18AA740;
  v24[2] = v18;
  v24[3] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
  v22 = (void *)devicePropertyKeysForPlatform__keysByPlatform;
  devicePropertyKeysForPlatform__keysByPlatform = v21;
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end