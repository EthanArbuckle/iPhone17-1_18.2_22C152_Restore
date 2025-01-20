@interface HMDHAPMetadata
+ (BOOL)isAdminPrivilegeRequiredForWritingCharacteristicType:(id)a3 serviceType:(id)a4;
+ (BOOL)isHomedVersionSupported:(id)a3;
+ (BOOL)isOwnerPrivilegeRequiredForWritingCharacteristicType:(id)a3 serviceType:(id)a4;
+ (BOOL)isServiceType:(id)a3 compatibleWithAccessoryCategoryType:(id)a4;
+ (BOOL)shouldUploadToCloudAfterHomedReady;
+ (HMDHAPMetadata)metadataWithDictionary:(id)a3 error:(id *)a4;
+ (HMDHAPMetadata)metadataWithPath:(id)a3 error:(id *)a4;
+ (id)dataFromMetadataDictionaryWithKey:(id)a3;
+ (id)getBuiltinInstance;
+ (id)getSharedInstance;
+ (id)legacyV3DataForCloud;
+ (id)legacyV3DataForIDS;
+ (id)metadataCache;
+ (void)_logCurrentMetadata;
+ (void)prepareMetadata;
+ (void)resetShouldUploadToCloudAfterHomedReady;
+ (void)updateLocalMetadataWithBuiltinMetadata;
+ (void)updateLocalMetadataWithMetadata:(id)a3;
- (BOOL)allowsSecuringWriteFor:(id)a3 withValue:(id)a4;
- (BOOL)checkTupleExistsInSet:(id)a3 forChrType:(id)a4 svcType:(id)a5;
- (BOOL)disallowsAssistantServiceType:(id)a3 characteristicType:(id)a4;
- (BOOL)generateNotificationOnConfigurationForCharacteristicType:(id)a3 serviceType:(id)a4;
- (BOOL)incomplete;
- (BOOL)isSecondsDownCounterCharacteristicType:(id)a3;
- (BOOL)isStandardCharacteristicType:(id)a3;
- (BOOL)isStandardServiceType:(id)a3;
- (BOOL)isTargetCharacteristic:(id)a3;
- (BOOL)parseAndSetAssistantCharacteristics:(id)a3;
- (BOOL)parseAndSetAssistantMetadataWithAssistantPlist:(id)a3;
- (BOOL)parseAndSetAssistantServices:(id)a3;
- (BOOL)parseAndSetAssistantUnits:(id)a3;
- (BOOL)parseAndSetHMMetadataWithHMPlist:(id)a3;
- (BOOL)policyConfigurationAvailableForAllHAPServices;
- (BOOL)requiresDeviceUnlock:(id)a3 forService:(id)a4;
- (BOOL)requiresTimedWrite:(id)a3 forService:(id)a4;
- (BOOL)shouldAllowToWakeSuspendedAccessoryForOperation:(int64_t)a3 service:(id)a4 characteristicType:(id)a5 value:(id)a6;
- (BOOL)shouldAutoEnableNotificationForCharacteristic:(id)a3 ofService:(id)a4;
- (BOOL)shouldCoalesceCharacteristicNotifications:(id)a3 forService:(id)a4;
- (BOOL)shouldEnableHomeNotificationForCharacteristicType:(id)a3 serviceType:(id)a4;
- (BOOL)shouldFilterChangeNotificationsForCharacteristicType:(id)a3 serviceType:(id)a4;
- (BOOL)shouldFilterCharacteristicOfType:(id)a3;
- (BOOL)shouldFilterCharacteristicOfTypeFromApp:(id)a3;
- (BOOL)shouldFilterEnableNotificationsForCharacteristicType:(id)a3 serviceType:(id)a4;
- (BOOL)shouldFilterServiceOfType:(id)a3;
- (BOOL)shouldFilterServiceOfTypeFromApp:(id)a3;
- (BOOL)shouldHomeAppShowTileForServiceType:(id)a3;
- (BOOL)shouldNotCacheCharacteristicOfType:(id)a3;
- (BOOL)shouldRefreshValueForCharacteristicWithType:(id)a3 serviceType:(id)a4;
- (BOOL)supportsAuthorizationData:(id)a3 forService:(id)a4;
- (BOOL)supportsLocalization:(id)a3;
- (HAPMetadata)hapMetadata;
- (HMDHAPMetadata)initWithDictionary:(id)a3 hapMetadata:(id)a4 error:(id *)a5;
- (HMDHAPMetadata)initWithFullPlist:(id)a3 hapMetadata:(id)a4;
- (HMDHAPMetadata)initWithFullPlist:(id)a3 hapMetadata:(id)a4 error:(id *)a5;
- (NSDictionary)assistantCharacteristics;
- (NSDictionary)assistantChrHAPTypeNameMap;
- (NSDictionary)assistantServiceHAPTypeNameMap;
- (NSDictionary)assistantServiceNameHAPTypeMap;
- (NSDictionary)assistantUnits;
- (NSDictionary)firmwareUpdateAutoApplyPolicies;
- (NSDictionary)firmwareUpdateStagingPolicies;
- (NSDictionary)hmAccessoryCategories;
- (NSDictionary)hmAllowableSecuringWrites;
- (NSDictionary)hmWakeOnOperationsFilter;
- (NSDictionary)rawPlist;
- (NSNumber)schemaVersion;
- (NSNumber)version;
- (NSSet)hmBlacklistedCharacteristics;
- (NSSet)hmBlacklistedCharacteristicsFromApp;
- (NSSet)hmBlacklistedServices;
- (NSSet)hmBlacklistedServicesFromApp;
- (NSSet)hmBulletinBoardEnabledTuples;
- (NSSet)hmCoalesceNotificationsTuples;
- (NSSet)hmNotificationAutoEnabledTuples;
- (NSSet)hmRequiresDeviceUnlockTuples;
- (id)aliasedHAPCharacteristicTypes;
- (id)aliasedHAPServiceTypes;
- (id)audioAccessoryCategory;
- (id)autoApplyPolicyConfigurationForService:(id)a3 category:(id)a4;
- (id)categoryForIdentifier:(id)a3;
- (id)categoryForOther;
- (id)categoryForType:(id)a3;
- (id)categoryTypeFromName:(id)a3;
- (id)characteristicNameFromType:(id)a3;
- (id)characteristicTypeFromName:(id)a3;
- (id)characteristicValueUnit:(id)a3;
- (id)descriptionForCharacteristicType:(id)a3;
- (id)descriptionForServiceType:(id)a3;
- (id)disallowedAssistantCharacteristicTypesByServiceType;
- (id)getAliasedCharacteristicTypes:(id)a3;
- (id)getAliasedServiceType:(id)a3;
- (id)getCharacteristicTypeAlias:(id)a3;
- (id)getServiceTypeAlias:(id)a3;
- (id)getStatusCharacteristicTypes:(id)a3 forServiceType:(id)a4;
- (id)mapCharacteristicValueType:(id)a3;
- (id)mapFromAssistantCharacteristicValue:(id)a3 name:(id)a4;
- (id)mapFromAssistantServiceName:(id)a3;
- (id)mapFromAssistantUnitName:(id)a3;
- (id)mapReadCharacteristicFromAssistantName:(id)a3;
- (id)mapToAssistantCharacteristicName:(id)a3;
- (id)mapToAssistantCharacteristicValue:(id)a3 name:(id)a4 getActionType:(BOOL)a5;
- (id)mapToAssistantServiceName:(id)a3;
- (id)mapToAssistantServiceSubtypeName:(id)a3;
- (id)mapToAssistantServiceSubtypeName:(id)a3 accessoryCategory:(id)a4;
- (id)mapToAssistantUnitName:(id)a3;
- (id)mapWriteCharacteristicFromAssistantName:(id)a3;
- (id)parseAndSetRawPlist:(id)a3;
- (id)parseCharacteristicArray:(id)a3;
- (id)parseHMAccessoryFirmwareUpdatePolicyCharacteristics:(id)a3;
- (id)parseHMAccessoryFirmwareUpdatePolicyCriteria:(id)a3;
- (id)parseHMAccessoryFirmwareUpdatePolicyServices:(id)a3;
- (id)parseMetadataTupleSetFromPlist:(id)a3;
- (id)parseServiceArray:(id)a3;
- (id)serviceNameFromType:(id)a3;
- (id)serviceSubtypeForValue:(id)a3 forServiceType:(id)a4;
- (id)serviceTypeFromName:(id)a3;
- (id)stagingPolicyConfigurationForService:(id)a3 category:(id)a4;
- (id)statusHAPCharacteristicTypesForServiceType;
- (id)validateAssociatedServiceType:(id)a3 forService:(id)a4;
- (id)xpcData:(BOOL)a3;
- (void)parseAndSetAllowableSecuringWrites:(id)a3;
- (void)parseAndSetHMAccessoryFirmwareUpdatePolicies:(id)a3;
- (void)parseAndSetHMCategories:(id)a3;
- (void)parseAndSetWakeOnOperationsFilter:(id)a3;
- (void)setAssistantCharacteristics:(id)a3;
- (void)setAssistantChrHAPTypeNameMap:(id)a3;
- (void)setAssistantServiceHAPTypeNameMap:(id)a3;
- (void)setAssistantServiceNameHAPTypeMap:(id)a3;
- (void)setAssistantUnits:(id)a3;
- (void)setFirmwareUpdateAutoApplyPolicies:(id)a3;
- (void)setFirmwareUpdateStagingPolicies:(id)a3;
- (void)setHapMetadata:(id)a3;
- (void)setHmAccessoryCategories:(id)a3;
- (void)setHmAllowableSecuringWrites:(id)a3;
- (void)setHmBlacklistedCharacteristics:(id)a3;
- (void)setHmBlacklistedCharacteristicsFromApp:(id)a3;
- (void)setHmBlacklistedServices:(id)a3;
- (void)setHmBlacklistedServicesFromApp:(id)a3;
- (void)setHmBulletinBoardEnabledTuples:(id)a3;
- (void)setHmCoalesceNotificationsTuples:(id)a3;
- (void)setHmNotificationAutoEnabledTuples:(id)a3;
- (void)setHmRequiresDeviceUnlockTuples:(id)a3;
- (void)setHmWakeOnOperationsFilter:(id)a3;
- (void)setIncomplete:(BOOL)a3;
- (void)setSchemaVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation HMDHAPMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateAutoApplyPolicies, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateStagingPolicies, 0);
  objc_storeStrong((id *)&self->_assistantUnits, 0);
  objc_storeStrong((id *)&self->_assistantChrHAPTypeNameMap, 0);
  objc_storeStrong((id *)&self->_assistantCharacteristics, 0);
  objc_storeStrong((id *)&self->_assistantServiceHAPTypeNameMap, 0);
  objc_storeStrong((id *)&self->_assistantServiceNameHAPTypeMap, 0);
  objc_storeStrong((id *)&self->_hmCoalesceNotificationsTuples, 0);
  objc_storeStrong((id *)&self->_hmBulletinBoardEnabledTuples, 0);
  objc_storeStrong((id *)&self->_hmNotificationAutoEnabledTuples, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedCharacteristicsFromApp, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedServicesFromApp, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedCharacteristics, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedServices, 0);
  objc_storeStrong((id *)&self->_hmAccessoryCategories, 0);
  objc_storeStrong((id *)&self->_hmWakeOnOperationsFilter, 0);
  objc_storeStrong((id *)&self->_hmAllowableSecuringWrites, 0);
  objc_storeStrong((id *)&self->_hmRequiresDeviceUnlockTuples, 0);
  objc_storeStrong((id *)&self->_hapMetadata, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setFirmwareUpdateAutoApplyPolicies:(id)a3
{
}

- (NSDictionary)firmwareUpdateAutoApplyPolicies
{
  return self->_firmwareUpdateAutoApplyPolicies;
}

- (void)setFirmwareUpdateStagingPolicies:(id)a3
{
}

- (NSDictionary)firmwareUpdateStagingPolicies
{
  return self->_firmwareUpdateStagingPolicies;
}

- (void)setAssistantUnits:(id)a3
{
}

- (NSDictionary)assistantUnits
{
  return self->_assistantUnits;
}

- (void)setAssistantChrHAPTypeNameMap:(id)a3
{
}

- (NSDictionary)assistantChrHAPTypeNameMap
{
  return self->_assistantChrHAPTypeNameMap;
}

- (void)setAssistantCharacteristics:(id)a3
{
}

- (NSDictionary)assistantCharacteristics
{
  return self->_assistantCharacteristics;
}

- (void)setAssistantServiceHAPTypeNameMap:(id)a3
{
}

- (NSDictionary)assistantServiceHAPTypeNameMap
{
  return self->_assistantServiceHAPTypeNameMap;
}

- (void)setAssistantServiceNameHAPTypeMap:(id)a3
{
}

- (NSDictionary)assistantServiceNameHAPTypeMap
{
  return self->_assistantServiceNameHAPTypeMap;
}

- (void)setHmCoalesceNotificationsTuples:(id)a3
{
}

- (NSSet)hmCoalesceNotificationsTuples
{
  return self->_hmCoalesceNotificationsTuples;
}

- (void)setHmBulletinBoardEnabledTuples:(id)a3
{
}

- (NSSet)hmBulletinBoardEnabledTuples
{
  return self->_hmBulletinBoardEnabledTuples;
}

- (void)setHmNotificationAutoEnabledTuples:(id)a3
{
}

- (NSSet)hmNotificationAutoEnabledTuples
{
  return self->_hmNotificationAutoEnabledTuples;
}

- (void)setHmBlacklistedCharacteristicsFromApp:(id)a3
{
}

- (NSSet)hmBlacklistedCharacteristicsFromApp
{
  return self->_hmBlacklistedCharacteristicsFromApp;
}

- (void)setHmBlacklistedServicesFromApp:(id)a3
{
}

- (NSSet)hmBlacklistedServicesFromApp
{
  return self->_hmBlacklistedServicesFromApp;
}

- (void)setHmBlacklistedCharacteristics:(id)a3
{
}

- (NSSet)hmBlacklistedCharacteristics
{
  return self->_hmBlacklistedCharacteristics;
}

- (void)setHmBlacklistedServices:(id)a3
{
}

- (NSSet)hmBlacklistedServices
{
  return self->_hmBlacklistedServices;
}

- (void)setHmAccessoryCategories:(id)a3
{
}

- (NSDictionary)hmAccessoryCategories
{
  return self->_hmAccessoryCategories;
}

- (void)setHmWakeOnOperationsFilter:(id)a3
{
}

- (NSDictionary)hmWakeOnOperationsFilter
{
  return self->_hmWakeOnOperationsFilter;
}

- (void)setHmAllowableSecuringWrites:(id)a3
{
}

- (NSDictionary)hmAllowableSecuringWrites
{
  return self->_hmAllowableSecuringWrites;
}

- (void)setHmRequiresDeviceUnlockTuples:(id)a3
{
}

- (NSSet)hmRequiresDeviceUnlockTuples
{
  return self->_hmRequiresDeviceUnlockTuples;
}

- (void)setHapMetadata:(id)a3
{
}

- (HAPMetadata)hapMetadata
{
  return self->_hapMetadata;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (void)setIncomplete:(BOOL)a3
{
  self->_incomplete = a3;
}

- (BOOL)incomplete
{
  return self->_incomplete;
}

- (void)setSchemaVersion:(id)a3
{
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (id)statusHAPCharacteristicTypesForServiceType
{
  if (statusHAPCharacteristicTypesForServiceType_onceToken != -1) {
    dispatch_once(&statusHAPCharacteristicTypesForServiceType_onceToken, &__block_literal_global_281);
  }
  v2 = (void *)statusHAPCharacteristicTypeMappingForServiceType;
  return v2;
}

void __60__HMDHAPMetadata_statusHAPCharacteristicTypesForServiceType__block_invoke()
{
  v39[5] = *MEMORY[0x263EF8340];
  v38[0] = *MEMORY[0x263F35730];
  v36[0] = *MEMORY[0x263F35438];
  uint64_t v35 = *MEMORY[0x263F35440];
  uint64_t v0 = v35;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  v37[0] = v20;
  v36[1] = *MEMORY[0x263F35520];
  uint64_t v34 = v0;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  v37[1] = v19;
  v36[2] = *MEMORY[0x263F35528];
  uint64_t v33 = v0;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  v37[2] = v18;
  v17 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
  v39[0] = v17;
  v38[1] = *MEMORY[0x263F356F0];
  uint64_t v31 = *MEMORY[0x263F354A8];
  uint64_t v1 = v31;
  uint64_t v3 = *MEMORY[0x263F354C8];
  v30[0] = *MEMORY[0x263F35460];
  uint64_t v2 = v30[0];
  v30[1] = v3;
  uint64_t v4 = *MEMORY[0x263F35430];
  v30[2] = *MEMORY[0x263F35470];
  v30[3] = v4;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  v32 = v16;
  v5 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v39[1] = v5;
  v38[2] = *MEMORY[0x263F35790];
  uint64_t v28 = v1;
  v27[0] = v2;
  v27[1] = v3;
  v27[2] = *MEMORY[0x263F35478];
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  v29 = v6;
  v7 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v39[2] = v7;
  v38[3] = *MEMORY[0x263F357A0];
  uint64_t v25 = *MEMORY[0x263F354D8];
  uint64_t v8 = v25;
  uint64_t v9 = *MEMORY[0x263F35548];
  v24[0] = v4;
  v24[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v26 = v10;
  v11 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v39[3] = v11;
  v38[4] = *MEMORY[0x263F35700];
  uint64_t v22 = v8;
  v21[0] = v4;
  v21[1] = v9;
  v21[2] = *MEMORY[0x263F35540];
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  v23 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v39[4] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
  v15 = (void *)statusHAPCharacteristicTypeMappingForServiceType;
  statusHAPCharacteristicTypeMappingForServiceType = v14;
}

- (id)disallowedAssistantCharacteristicTypesByServiceType
{
  if (disallowedAssistantCharacteristicTypesByServiceType_onceToken != -1) {
    dispatch_once(&disallowedAssistantCharacteristicTypesByServiceType_onceToken, &__block_literal_global_279);
  }
  uint64_t v2 = (void *)disallowedAssistantCharacteristicTypesByServiceType_disallowedAssistantCharacteristicTypesByServiceType;
  return v2;
}

void __69__HMDHAPMetadata_disallowedAssistantCharacteristicTypesByServiceType__block_invoke()
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F0D668];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0BEF8];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  v7[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = (void *)disallowedAssistantCharacteristicTypesByServiceType_disallowedAssistantCharacteristicTypesByServiceType;
  disallowedAssistantCharacteristicTypesByServiceType_disallowedAssistantCharacteristicTypesByServiceType = v3;
}

- (id)aliasedHAPServiceTypes
{
  if (aliasedHAPServiceTypes_onceToken != -1) {
    dispatch_once(&aliasedHAPServiceTypes_onceToken, &__block_literal_global_277);
  }
  uint64_t v2 = (void *)aliasedHAPServiceTypes__aliasedHAPServiceTypeMapping;
  return v2;
}

void __40__HMDHAPMetadata_aliasedHAPServiceTypes__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F357A8];
  v3[0] = *MEMORY[0x263F356D8];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  uint64_t v1 = (void *)aliasedHAPServiceTypes__aliasedHAPServiceTypeMapping;
  aliasedHAPServiceTypes__aliasedHAPServiceTypeMapping = v0;
}

- (id)aliasedHAPCharacteristicTypes
{
  if (aliasedHAPCharacteristicTypes_onceToken != -1) {
    dispatch_once(&aliasedHAPCharacteristicTypes_onceToken, &__block_literal_global_275);
  }
  uint64_t v2 = (void *)aliasedHAPCharacteristicTypes__aliasedHAPCharacteristicTypeMapping;
  return v2;
}

void __47__HMDHAPMetadata_aliasedHAPCharacteristicTypes__block_invoke()
{
  v10[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F35518];
  uint64_t v1 = *MEMORY[0x263F35480];
  v9[0] = *MEMORY[0x263F35430];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x263F354B0];
  v10[0] = v0;
  v10[1] = v2;
  uint64_t v3 = *MEMORY[0x263F355E0];
  v9[2] = *MEMORY[0x263F354B8];
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x263F355D8];
  v10[2] = v2;
  v10[3] = v4;
  uint64_t v5 = *MEMORY[0x263F35528];
  v9[4] = *MEMORY[0x263F355A8];
  v9[5] = v5;
  uint64_t v6 = *MEMORY[0x263F35438];
  v10[4] = v4;
  v10[5] = v6;
  v9[6] = *MEMORY[0x263F35520];
  v10[6] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];
  uint64_t v8 = (void *)aliasedHAPCharacteristicTypes__aliasedHAPCharacteristicTypeMapping;
  aliasedHAPCharacteristicTypes__aliasedHAPCharacteristicTypeMapping = v7;
}

- (BOOL)checkTupleExistsInSet:(id)a3 forChrType:(id)a4 svcType:(id)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x263F359F8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithCharacteristicType:v9 serviceType:v8];

  LOBYTE(v9) = [v10 containsObject:v11];
  return (char)v9;
}

- (BOOL)parseAndSetAssistantUnits:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v21);
        v13 = [(HMDHAPMetadata *)self hapMetadata];
        char v14 = [v13 isStandardHAPUnitName:v12];

        if ((v14 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v26 = v19;
            __int16 v27 = 2112;
            uint64_t v28 = v11;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Assistant unit %@ unknown", buf, 0x16u);
          }

          BOOL v16 = 0;
          v15 = v6;
          goto LABEL_13;
        }
        [v5 setObject:v12 forKeyedSubscript:v11];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v15 = (void *)[v5 copy];
  [(HMDHAPMetadata *)self setAssistantUnits:v15];
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (BOOL)parseAndSetAssistantCharacteristics:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v49 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v5 = v3;
  uint64_t v56 = [v5 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v56)
  {
    uint64_t v54 = *(void *)v60;
    uint64_t v53 = *MEMORY[0x263F35C00];
    uint64_t v51 = *MEMORY[0x263F35BF8];
    uint64_t v50 = *MEMORY[0x263F35C58];
    uint64_t v52 = *MEMORY[0x263F35BB8];
    uint64_t v48 = *MEMORY[0x263F35C20];
    uint64_t v47 = *MEMORY[0x263F35C38];
    uint64_t v46 = *MEMORY[0x263F35BE8];
    *(void *)&long long v6 = 138543618;
    long long v45 = v6;
    v57 = v4;
    v55 = v5;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v60 != v54) {
        objc_enumerationMutation(v5);
      }
      uint64_t v8 = *(void *)(*((void *)&v59 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v5, "hmf_dictionaryForKey:", v8, v45);
      id v10 = objc_msgSend(v9, "hmf_stringForKey:", v53);
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = v10;
        v13 = v12;
      }
      else
      {
        objc_msgSend(v9, "hmf_stringForKey:", v51);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = objc_msgSend(v9, "hmf_stringForKey:", v50);
        v13 = (void *)v14;
        if (!v12)
        {
          char v17 = 1;
          if (!v14) {
            goto LABEL_16;
          }
LABEL_15:
          long long v23 = [(HMDHAPMetadata *)self hapMetadata];
          char v24 = [v23 isStandardHAPCharacteristicName:v13];

          if (v24)
          {
LABEL_16:
            uint64_t v25 = objc_msgSend(v9, "hmf_stringForKey:", v52);
            if (v25)
            {
              v26 = [[HMDHAPMetadataAssistantCharacteristic alloc] initWithName:v8 readHAPCharacteristic:v12 writeHAPCharacteristic:v13 format:v25];
              buf[0] = 0;
              unsigned int v27 = objc_msgSend(v9, "hmf_BOOLForKey:isPresent:", v48, buf);
              if (buf[0]) {
                uint64_t v28 = v27;
              }
              else {
                uint64_t v28 = 0;
              }
              [(HMDHAPMetadataAssistantCharacteristic *)v26 setSupportsLocalization:v28];
              objc_msgSend(v9, "hmf_dictionaryForKey:", v47);
              uint64_t v30 = v29 = v17;
              [(HMDHAPMetadataAssistantCharacteristic *)v26 setValues:v30];

              uint64_t v31 = objc_msgSend(v9, "hmf_dictionaryForKey:", v46);
              [(HMDHAPMetadataAssistantCharacteristic *)v26 setOutValues:v31];

              [v49 setObject:v26 forKeyedSubscript:v8];
              if ((v29 & 1) == 0)
              {
                v32 = [(HMDHAPMetadata *)self hapMetadata];
                uint64_t v33 = [v32 characteristicTypeFromUTI:v12];
                [v57 setObject:v8 forKey:v33];
              }
              if (v13)
              {
                uint64_t v34 = [(HMDHAPMetadata *)self hapMetadata];
                uint64_t v35 = [v34 characteristicTypeFromUTI:v13];
                [v57 setObject:v8 forKey:v35];
              }
              int v36 = 0;
            }
            else
            {
              v37 = (void *)MEMORY[0x230FBD990]();
              v38 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                v39 = HMFGetLogIdentifier();
                *(_DWORD *)buf = v45;
                v64 = v39;
                __int16 v65 = 2112;
                uint64_t v66 = v8;
                _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Assistant characteristic %@ format not specified unknown", buf, 0x16u);
              }
              int v36 = 1;
            }

            goto LABEL_33;
          }
          v18 = (void *)MEMORY[0x230FBD990]();
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v64 = v20;
            __int16 v65 = 2112;
            uint64_t v66 = v8;
            __int16 v67 = 2112;
            id v68 = v13;
            long long v21 = v19;
            long long v22 = "%{public}@Assistant characteristic %@ writeHAP characteristic %@ unknown";
            goto LABEL_27;
          }
          goto LABEL_28;
        }
      }
      v15 = [(HMDHAPMetadata *)self hapMetadata];
      char v16 = [v15 isStandardHAPCharacteristicName:v12];

      if (v16)
      {
        char v17 = 0;
        if (!v13) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v64 = v20;
        __int16 v65 = 2112;
        uint64_t v66 = v8;
        __int16 v67 = 2112;
        id v68 = v12;
        long long v21 = v19;
        long long v22 = "%{public}@Assistant characteristic %@ readHAP characteristic %@ unknown";
LABEL_27:
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x20u);
      }
LABEL_28:

      int v36 = 1;
LABEL_33:
      id v4 = v57;
      id v5 = v55;

      if (v36)
      {
        BOOL v43 = 0;
        v42 = v55;
        v40 = v49;
        goto LABEL_38;
      }
      if (v56 == ++v7)
      {
        uint64_t v56 = [v55 countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v56) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v40 = v49;
  v41 = (void *)[v49 copy];
  [(HMDHAPMetadata *)self setAssistantCharacteristics:v41];

  v42 = (void *)[v4 copy];
  [(HMDHAPMetadata *)self setAssistantChrHAPTypeNameMap:v42];
  BOOL v43 = 1;
LABEL_38:

  return v43;
}

- (BOOL)parseAndSetAssistantServices:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v11 = v4;
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v13 = [v6 objectForKeyedSubscript:v12];
        uint64_t v14 = [(HMDHAPMetadata *)self hapMetadata];
        v15 = [v14 serviceTypeFromUTI:v13];

        if (!v15)
        {
          v19 = (void *)MEMORY[0x230FBD990]();
          v20 = HMFGetOSLogHandle();
          id v4 = v11;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            long long v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            char v29 = v21;
            __int16 v30 = 2112;
            uint64_t v31 = v12;
            __int16 v32 = 2112;
            uint64_t v33 = v13;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Assistant service %@ not mappable - no such HAP service %@", buf, 0x20u);
          }

          BOOL v18 = 0;
          char v17 = v6;
          goto LABEL_13;
        }
        id v4 = v11;
        [v11 setObject:v15 forKeyedSubscript:v12];
        [v5 setObject:v12 forKeyedSubscript:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  char v16 = (void *)[v4 copy];
  [(HMDHAPMetadata *)self setAssistantServiceNameHAPTypeMap:v16];

  char v17 = (void *)[v5 copy];
  [(HMDHAPMetadata *)self setAssistantServiceHAPTypeNameMap:v17];
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

- (id)parseCharacteristicArray:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [(HMDHAPMetadata *)self hapMetadata];
        v13 = [v12 characteristicTypeFromUTI:v11];

        if (!v13)
        {
          v15 = (void *)MEMORY[0x230FBD990]();
          char v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            char v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v24 = v17;
            __int16 v25 = 2112;
            uint64_t v26 = v11;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@characteristicName %@ is not a standard HAP characteristicName", buf, 0x16u);
          }

          uint64_t v14 = 0;
          goto LABEL_13;
        }
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = (void *)[v5 copy];
LABEL_13:

  return v14;
}

- (id)parseServiceArray:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [(HMDHAPMetadata *)self hapMetadata];
        v13 = [v12 serviceTypeFromUTI:v11];

        if (!v13)
        {
          v15 = (void *)MEMORY[0x230FBD990]();
          char v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            char v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v24 = v17;
            __int16 v25 = 2112;
            uint64_t v26 = v11;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@ServiceName %@ is not a standard HAP serviceName", buf, 0x16u);
          }

          uint64_t v14 = 0;
          goto LABEL_13;
        }
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = (void *)[v5 copy];
LABEL_13:

  return v14;
}

- (id)parseHMAccessoryFirmwareUpdatePolicyCharacteristics:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = v3;
  uint64_t v47 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v51;
    uint64_t v46 = *MEMORY[0x263F35618];
    uint64_t v44 = *MEMORY[0x263F35610];
    BOOL v43 = v4;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v51 != v48) {
        objc_enumerationMutation(v5);
      }
      uint64_t v7 = *(void **)(*((void *)&v50 + 1) + 8 * v6);
      uint64_t v8 = [(HMDHAPMetadata *)self characteristicTypeFromName:v7];
      if (!v8) {
        break;
      }
      uint64_t v9 = (void *)v8;
      id v10 = objc_msgSend(v5, "hmf_dictionaryForKey:", v7);
      if (!v10)
      {
        v37 = (void *)MEMORY[0x230FBD990]();
        v38 = self;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v55 = v40;
          __int16 v56 = 2112;
          v57 = v9;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed while parsing characteristic %@", buf, 0x16u);
        }

LABEL_34:
        __int16 v32 = 0;
        id v4 = v43;
        goto LABEL_35;
      }
      uint64_t v11 = v10;
      uint64_t v12 = v5;
      v13 = objc_msgSend(v10, "hmf_arrayForKey:", v46);
      uint64_t v14 = v13;
      if (v13 && [v13 count])
      {
        uint64_t v15 = objc_msgSend(v11, "hmf_numberForKey:", v44);
        char v16 = [(HMDHAPMetadata *)self hapMetadata];
        char v17 = [v16 hapCharacteristicFromType:v9];
        BOOL v18 = [v17 format];

        long long v45 = (void *)v15;
        if (v18)
        {
          long long v19 = [[HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration alloc] initWithType:v9 format:v18 values:v14 settlingTime:v15];
          if (v19)
          {
            [v43 addObject:v19];
            int v20 = 0;
          }
          else
          {
            context = (void *)MEMORY[0x230FBD990]();
            char v29 = self;
            __int16 v30 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              uint64_t v31 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v55 = v31;
              __int16 v56 = 2112;
              v57 = v9;
              _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Characteristic configuration failed for characteristic %@", buf, 0x16u);
            }
            int v20 = 1;
          }
        }
        else
        {
          __int16 v25 = (void *)MEMORY[0x230FBD990]();
          uint64_t v26 = self;
          long long v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v28 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v55 = v28;
            __int16 v56 = 2112;
            v57 = v9;
            _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Format not found for characteristic %@", buf, 0x16u);
          }
          int v20 = 1;
        }
      }
      else
      {
        long long v21 = (void *)MEMORY[0x230FBD990]();
        long long v22 = self;
        long long v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          long long v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v55 = v24;
          __int16 v56 = 2112;
          v57 = v9;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Values not available for characteristic %@", buf, 0x16u);
        }
        int v20 = 1;
      }

      id v5 = v12;
      if (v20) {
        goto LABEL_34;
      }
      if (v47 == ++v6)
      {
        id v4 = v43;
        uint64_t v47 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v47) {
          goto LABEL_3;
        }
        goto LABEL_27;
      }
    }
    uint64_t v33 = (void *)MEMORY[0x230FBD990]();
    uint64_t v34 = self;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v55 = v36;
      __int16 v56 = 2112;
      v57 = v7;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Type not found for characteristic name %@", buf, 0x16u);
    }
    goto LABEL_34;
  }
LABEL_27:

  __int16 v32 = (void *)[v4 copy];
LABEL_35:

  return v32;
}

- (id)parseHMAccessoryFirmwareUpdatePolicyCriteria:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(HMDAccessoryFirmwareUpdatePolicyCriteria);
  -[HMDAccessoryFirmwareUpdatePolicyCriteria setAnyUserAtHome:](v5, "setAnyUserAtHome:", objc_msgSend(v4, "hmf_BOOLForKey:", *MEMORY[0x263F35608]));
  -[HMDAccessoryFirmwareUpdatePolicyCriteria setNoUserAtHome:](v5, "setNoUserAtHome:", objc_msgSend(v4, "hmf_BOOLForKey:", *MEMORY[0x263F35638]));
  -[HMDAccessoryFirmwareUpdatePolicyCriteria setCheckForScheduledAutomation:](v5, "setCheckForScheduledAutomation:", objc_msgSend(v4, "hmf_BOOLForKey:", *MEMORY[0x263F35628]));
  uint64_t v6 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35620]);
  uint64_t v7 = [(HMDHAPMetadata *)self parseHMAccessoryFirmwareUpdatePolicyCharacteristics:v6];
  [(HMDAccessoryFirmwareUpdatePolicyCriteria *)v5 setCharacteristicConfigurations:v7];

  if (v6)
  {
    uint64_t v8 = [(HMDAccessoryFirmwareUpdatePolicyCriteria *)v5 characteristicConfigurations];

    if (!v8)
    {
      long long v22 = (void *)MEMORY[0x230FBD990]();
      long long v23 = self;
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v27 = 138543362;
        uint64_t v28 = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristics", (uint8_t *)&v27, 0xCu);
      }
      goto LABEL_18;
    }
  }
  uint64_t v9 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35650]);
  id v10 = v9;
  if (!v9)
  {
LABEL_8:

    char v16 = v5;
    goto LABEL_19;
  }
  uint64_t v11 = objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x263F35658]);
  uint64_t v12 = objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x263F35648]);
  v13 = (void *)v12;
  if (v11 && v12)
  {
    uint64_t v14 = [[HMDAccessoryFirmwareUpdateTimeWindow alloc] initWithStartTime:v11 endTime:v12];
    if (v14)
    {
      uint64_t v15 = v14;
      [(HMDAccessoryFirmwareUpdatePolicyCriteria *)v5 setUpdateTimeWindow:v14];

      goto LABEL_8;
    }
    char v17 = (void *)MEMORY[0x230FBD990]();
    BOOL v18 = self;
    long long v19 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v20 = HMFGetLogIdentifier();
    int v27 = 138543362;
    uint64_t v28 = v20;
    long long v21 = "%{public}@Failed to initialize time window";
    goto LABEL_16;
  }
  char v17 = (void *)MEMORY[0x230FBD990]();
  BOOL v18 = self;
  long long v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v20 = HMFGetLogIdentifier();
    int v27 = 138543362;
    uint64_t v28 = v20;
    long long v21 = "%{public}@Failed to parse time window";
LABEL_16:
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 0xCu);
  }
LABEL_17:

LABEL_18:
  char v16 = 0;
LABEL_19:

  return v16;
}

- (id)parseHMAccessoryFirmwareUpdatePolicyServices:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35640]);
    unint64_t v7 = 0x263EFF000uLL;
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v61 = [NSDictionary dictionary];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v9 = v6;
    uint64_t v58 = [v9 countByEnumeratingWithState:&v74 objects:v85 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v75;
      context = (void *)*MEMORY[0x263F35630];
      v64 = self;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v75 != v59) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = *(void **)(*((void *)&v74 + 1) + 8 * v10);
        v69 = [(HMDHAPMetadata *)self serviceTypeFromName:v11];
        if (!v69) {
          break;
        }
        uint64_t v12 = objc_msgSend(v9, "hmf_dictionaryForKey:", v11);
        if (!v12)
        {
          uint64_t v47 = (void *)MEMORY[0x230FBD990]();
          uint64_t v48 = self;
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            long long v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v80 = v50;
            __int16 v81 = 2112;
            id v82 = v69;
            _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed while parsing policy configuration for service:%@.", buf, 0x16u);
          }
          id v37 = v61;
          goto LABEL_45;
        }
        v13 = v12;
        uint64_t v60 = v10;
        uint64_t v14 = objc_msgSend(*(id *)(v7 + 2464), "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        if ([v13 count])
        {
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v15 = v13;
          uint64_t v66 = [v15 countByEnumeratingWithState:&v70 objects:v78 count:16];
          if (v66)
          {
            uint64_t v54 = v13;
            id v55 = v9;
            __int16 v56 = v8;
            v57 = v5;
            uint64_t v65 = *(void *)v71;
            char v16 = v61;
            long long v62 = v14;
            char v17 = context;
            while (2)
            {
              for (uint64_t i = 0; i != v66; ++i)
              {
                if (*(void *)v71 != v65) {
                  objc_enumerationMutation(v15);
                }
                long long v19 = *(void **)(*((void *)&v70 + 1) + 8 * i);
                if ([v19 isEqualToString:v17]) {
                  [NSString stringWithString:v17];
                }
                else {
                int v20 = [(HMDHAPMetadata *)self categoryTypeFromName:v19];
                }
                if (!v20)
                {
                  v38 = (void *)MEMORY[0x230FBD990]();
                  v39 = self;
                  v40 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    v41 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v80 = v41;
                    __int16 v81 = 2112;
                    id v82 = v69;
                    _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Category type not found for service:%@.", buf, 0x16u);
                  }
                  id v37 = v16;
                  v13 = v15;
                  uint64_t v8 = v56;
                  id v5 = v57;
                  id v9 = v55;
                  goto LABEL_44;
                }
                long long v21 = v15;
                long long v22 = objc_msgSend(v15, "hmf_dictionaryForKey:", v19);
                long long v23 = [(HMDHAPMetadata *)self parseHMAccessoryFirmwareUpdatePolicyCriteria:v22];
                if (v23)
                {
                  long long v24 = [[HMDAccessoryFirmwareUpdatePolicyServiceConfiguration alloc] initWithType:v69 category:v20 criteria:v23];
                  if (v24)
                  {
                    [v14 setValue:v24 forKey:v20];
                    int v25 = 0;
                  }
                  else
                  {
                    __int16 v30 = (void *)MEMORY[0x230FBD990]();
                    uint64_t v31 = self;
                    __int16 v32 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v33 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543874;
                      v80 = v33;
                      __int16 v81 = 2112;
                      id v82 = v20;
                      __int16 v83 = 2112;
                      v84 = v69;
                      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Service configuration failed for category %@ in service:%@.", buf, 0x20u);

                      char v16 = v61;
                    }

                    id v63 = v16;
                    int v25 = 1;
                    self = v64;
                    uint64_t v14 = v62;
                  }
                }
                else
                {
                  uint64_t v26 = (void *)MEMORY[0x230FBD990]();
                  int v27 = self;
                  uint64_t v28 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v29 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543874;
                    v80 = v29;
                    __int16 v81 = 2112;
                    id v82 = v20;
                    __int16 v83 = 2112;
                    v84 = v69;
                    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Criteria configuration failed for category %@ in service:%@.", buf, 0x20u);

                    uint64_t v14 = v62;
                  }

                  id v63 = v16;
                  int v25 = 1;
                  self = v64;
                }

                id v15 = v21;
                if (v25)
                {
                  v13 = v21;
                  uint64_t v8 = v56;
                  id v5 = v57;
                  id v9 = v55;
                  id v37 = v63;
                  goto LABEL_44;
                }
                char v17 = context;
              }
              uint64_t v66 = [v21 countByEnumeratingWithState:&v70 objects:v78 count:16];
              if (v66) {
                continue;
              }
              break;
            }
            uint64_t v8 = v56;
            id v5 = v57;
            v13 = v54;
            id v9 = v55;
          }
          unint64_t v7 = 0x263EFF000;
        }
        else
        {
          id v15 = [NSString stringWithString:context];
          uint64_t v34 = objc_alloc_init(HMDAccessoryFirmwareUpdatePolicyCriteria);
          uint64_t v35 = [[HMDAccessoryFirmwareUpdatePolicyServiceConfiguration alloc] initWithType:v69 category:v15 criteria:v34];
          if (!v35)
          {
            contexta = (void *)MEMORY[0x230FBD990]();
            long long v51 = self;
            long long v52 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              long long v53 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v80 = v53;
              __int16 v81 = 2112;
              id v82 = v15;
              __int16 v83 = 2112;
              v84 = v69;
              _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Service configuration failed for category %@ in service:%@.", buf, 0x20u);
            }
            id v37 = v61;

LABEL_44:
LABEL_45:

LABEL_46:
            goto LABEL_47;
          }
          int v36 = v35;
          [v14 setValue:v35 forKey:v15];
        }
        [v8 setValue:v14 forKey:v69];

        uint64_t v10 = v60 + 1;
        if (v60 + 1 == v58)
        {
          uint64_t v58 = [v9 countByEnumeratingWithState:&v74 objects:v85 count:16];
          if (v58) {
            goto LABEL_4;
          }
          goto LABEL_38;
        }
      }
      BOOL v43 = (void *)MEMORY[0x230FBD990]();
      uint64_t v44 = self;
      long long v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v80 = v46;
        __int16 v81 = 2112;
        id v82 = v11;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Service type not found for service:%@.", buf, 0x16u);
      }
      id v37 = v61;
      goto LABEL_46;
    }
LABEL_38:

    id v37 = (id)[v8 copy];
LABEL_47:
  }
  else
  {
    id v37 = [NSDictionary dictionary];
  }

  return v37;
}

- (BOOL)policyConfigurationAvailableForAllHAPServices
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy__25987;
  char v17 = __Block_byref_object_dispose__25988;
  id v18 = 0;
  id v3 = [(HMDHAPMetadata *)self hapMetadata];
  id v4 = [v3 hapServiceNameTypeMap];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__HMDHAPMetadata_policyConfigurationAvailableForAllHAPServices__block_invoke;
  v12[3] = &unk_264A181F8;
  v12[4] = self;
  v12[5] = &v13;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v5 = v14[5];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    unint64_t v7 = self;
    HMFGetOSLogHandle();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = v14[5];
      *(_DWORD *)buf = 138543618;
      int v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Firmware update policy configuration missing for service:%@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v13, 8);

  return v5 == 0;
}

void __63__HMDHAPMetadata_policyConfigurationAvailableForAllHAPServices__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) firmwareUpdateStagingPolicies];
  uint64_t v10 = [v9 objectForKey:v8];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [*(id *)(a1 + 32) firmwareUpdateAutoApplyPolicies];
    uint64_t v13 = [v12 objectForKey:v8];

    if (v13) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *a4 = 1;
LABEL_6:
}

- (void)parseAndSetHMAccessoryFirmwareUpdatePolicies:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35660]);
    unint64_t v7 = [(HMDHAPMetadata *)self parseHMAccessoryFirmwareUpdatePolicyServices:v6];
    [(HMDHAPMetadata *)self setFirmwareUpdateStagingPolicies:v7];

    id v8 = objc_msgSend(v5, "hmf_dictionaryForKey:", *MEMORY[0x263F355F8]);
    id v9 = [(HMDHAPMetadata *)self parseHMAccessoryFirmwareUpdatePolicyServices:v8];
    [(HMDHAPMetadata *)self setFirmwareUpdateAutoApplyPolicies:v9];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory firmware update policies not defined!", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)parseAndSetHMCategories:(id)a3
{
  long long v24 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v26 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v28 = *(void *)v30;
    uint64_t v27 = *MEMORY[0x263F35BC0];
    uint64_t v7 = *MEMORY[0x263F35C28];
    uint64_t v8 = *MEMORY[0x263F35BA0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = v4;
        uint64_t v12 = objc_msgSend(v4, "hmf_dictionaryForKey:", v10, v24);
        uint64_t v13 = objc_msgSend(v12, "hmf_numberForKey:", v27);
        int v14 = objc_msgSend(v12, "hmf_stringForKey:", v7);
        uint64_t v15 = objc_msgSend(v12, "hmf_stringForKey:", v8);
        uint64_t v16 = (void *)v15;
        if (v13) {
          BOOL v17 = v14 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17 && v15 != 0)
        {
          long long v19 = [[HMDHAPMetadataCategory alloc] initWithIdentifier:v13 uuid:v14 name:v10 description:v15];
          if (v19) {
            [v26 setObject:v19 forKey:v13];
          }
        }
        id v4 = v11;
      }
      uint64_t v6 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }

  if (![v26 count])
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@There are no accessory categories in the metadata", buf, 0xCu);
    }
  }
  uint64_t v23 = objc_msgSend(v26, "copy", v24);
  [v25 setHmAccessoryCategories:v23];
}

- (void)parseAndSetWakeOnOperationsFilter:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v4;
    obuint64_t j = v4;
    uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          uint64_t v8 = objc_msgSend(obj, "hmf_dictionaryForKey:", v6);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v24 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * j);
                int v14 = objc_msgSend(v8, "hmf_dictionaryForKey:", v13);
                uint64_t v15 = [(HMDHAPMetadata *)self serviceTypeFromName:v13];
                [v7 setObject:v14 forKey:v15];
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v10);
          }
          uint64_t v16 = [(HMDHAPMetadata *)self characteristicTypeFromName:v6];
          [v20 setObject:v7 forKey:v16];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }

    BOOL v17 = (void *)[v20 copy];
    [(HMDHAPMetadata *)self setHmWakeOnOperationsFilter:v17];

    id v4 = v18;
  }
}

- (void)parseAndSetAllowableSecuringWrites:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v31;
    *(void *)&long long v8 = 138543618;
    long long v28 = v8;
    do
    {
      uint64_t v11 = 0;
      uint64_t v29 = v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * v11);
        uint64_t v13 = [(HMDHAPMetadata *)self hapMetadata];
        int v14 = [v13 characteristicTypeFromUTI:v12];

        if (v14)
        {
          uint64_t v15 = objc_msgSend(v6, "hmf_arrayForKey:", v12);
          if (v15)
          {
            uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:v15];
            [v5 setObject:v16 forKey:v14];
          }
        }
        else
        {
          uint64_t v17 = v10;
          id v18 = v6;
          uint64_t v19 = self;
          id v20 = v5;
          uint64_t v21 = (void *)MEMORY[0x230FBD990]();
          uint64_t v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            long long v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v28;
            uint64_t v35 = v23;
            __int16 v36 = 2112;
            uint64_t v37 = v12;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown characteristic '%@' while parsing tuple", buf, 0x16u);
          }
          uint64_t v5 = v20;
          self = v19;
          id v6 = v18;
          uint64_t v10 = v17;
          uint64_t v9 = v29;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v9);
  }

  if (![v5 count])
  {
    long long v24 = (void *)MEMORY[0x230FBD990]();
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@There are no allowable securing writes in the metadata", buf, 0xCu);
    }
  }
  long long v27 = (void *)[v5 copy];
  [(HMDHAPMetadata *)self setHmAllowableSecuringWrites:v27];
}

- (id)parseMetadataTupleSetFromPlist:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDHAPMetadata *)self hapMetadata];
  id v6 = [v5 parseCharacteristicServiceTuples:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    long long v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic/service tuples: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v6;
}

- (BOOL)parseAndSetAssistantMetadataWithAssistantPlist:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35C18]);
  BOOL v6 = [(HMDHAPMetadata *)self parseAndSetAssistantServices:v5];

  if (!v6)
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v14 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v14;
    id v15 = "%{public}@Failed to parse assistant services metadata";
LABEL_11:
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);

    goto LABEL_12;
  }
  id v7 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35B90]);
  BOOL v8 = [(HMDHAPMetadata *)self parseAndSetAssistantCharacteristics:v7];

  if (!v8)
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v14 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v14;
    id v15 = "%{public}@Failed to parse assistant characteristics metadata";
    goto LABEL_11;
  }
  uint64_t v9 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35C30]);
  BOOL v10 = [(HMDHAPMetadata *)self parseAndSetAssistantUnits:v9];

  if (!v10)
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v14;
      id v15 = "%{public}@Failed to parse assistant units metadata";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v11 = 0;
    goto LABEL_13;
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)parseAndSetHMMetadataWithHMPlist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35C08]);
  BOOL v6 = [(HMDHAPMetadata *)self parseMetadataTupleSetFromPlist:v5];
  [(HMDHAPMetadata *)self setHmRequiresDeviceUnlockTuples:v6];

  id v7 = [(HMDHAPMetadata *)self hmRequiresDeviceUnlockTuples];

  if (v7)
  {
    BOOL v8 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35B70]);
    [(HMDHAPMetadata *)self parseAndSetAllowableSecuringWrites:v8];

    uint64_t v9 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35C48]);
    [(HMDHAPMetadata *)self parseAndSetWakeOnOperationsFilter:v9];

    BOOL v10 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35B88]);
    [(HMDHAPMetadata *)self parseAndSetHMCategories:v10];

    BOOL v11 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35BB0]);
    uint64_t v12 = *MEMORY[0x263F35C18];
    uint64_t v13 = objc_msgSend(v11, "hmf_arrayForKey:", *MEMORY[0x263F35C18]);
    __int16 v14 = [(HMDHAPMetadata *)self parseServiceArray:v13];
    [(HMDHAPMetadata *)self setHmBlacklistedServices:v14];

    uint64_t v15 = *MEMORY[0x263F35B90];
    uint64_t v16 = objc_msgSend(v11, "hmf_arrayForKey:", *MEMORY[0x263F35B90]);
    int v17 = [(HMDHAPMetadata *)self parseCharacteristicArray:v16];
    [(HMDHAPMetadata *)self setHmBlacklistedCharacteristics:v17];

    id v18 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35BA8]);

    uint64_t v19 = objc_msgSend(v18, "hmf_arrayForKey:", v12);
    id v20 = [(HMDHAPMetadata *)self parseServiceArray:v19];
    [(HMDHAPMetadata *)self setHmBlacklistedServicesFromApp:v20];

    uint64_t v21 = objc_msgSend(v18, "hmf_arrayForKey:", v15);
    uint64_t v22 = [(HMDHAPMetadata *)self parseCharacteristicArray:v21];
    [(HMDHAPMetadata *)self setHmBlacklistedCharacteristicsFromApp:v22];

    uint64_t v23 = [(HMDHAPMetadata *)self hmBlacklistedServices];
    if (!v23) {
      goto LABEL_11;
    }
    long long v24 = (void *)v23;
    uint64_t v25 = [(HMDHAPMetadata *)self hmBlacklistedCharacteristics];
    if (!v25)
    {
      BOOL v40 = 0;
LABEL_20:

      goto LABEL_21;
    }
    long long v26 = (void *)v25;
    uint64_t v27 = [(HMDHAPMetadata *)self hmBlacklistedServicesFromApp];
    if (!v27)
    {
      BOOL v40 = 0;
LABEL_19:

      goto LABEL_20;
    }
    long long v28 = (void *)v27;
    uint64_t v29 = [(HMDHAPMetadata *)self hmBlacklistedCharacteristicsFromApp];

    if (!v29)
    {
LABEL_11:
      BOOL v40 = 0;
LABEL_21:

      goto LABEL_22;
    }
    long long v24 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35BE0]);
    long long v26 = objc_msgSend(v24, "hmf_dictionaryForKey:", *MEMORY[0x263F35BD8]);
    long long v30 = objc_msgSend(v24, "hmf_dictionaryForKey:", *MEMORY[0x263F35B80]);
    long long v31 = objc_msgSend(v24, "hmf_dictionaryForKey:", *MEMORY[0x263F35B98]);
    long long v32 = [(HMDHAPMetadata *)self parseMetadataTupleSetFromPlist:v26];
    [(HMDHAPMetadata *)self setHmNotificationAutoEnabledTuples:v32];

    long long v33 = [(HMDHAPMetadata *)self parseMetadataTupleSetFromPlist:v30];
    [(HMDHAPMetadata *)self setHmBulletinBoardEnabledTuples:v33];

    uint64_t v34 = [(HMDHAPMetadata *)self parseMetadataTupleSetFromPlist:v31];
    [(HMDHAPMetadata *)self setHmCoalesceNotificationsTuples:v34];

    uint64_t v35 = [(HMDHAPMetadata *)self hmNotificationAutoEnabledTuples];
    if (v35)
    {
      __int16 v36 = (void *)v35;
      uint64_t v37 = [(HMDHAPMetadata *)self hmBulletinBoardEnabledTuples];
      if (v37)
      {
        v38 = (void *)v37;
        v42 = v30;
        uint64_t v39 = [(HMDHAPMetadata *)self hmCoalesceNotificationsTuples];

        if (!v39)
        {
          BOOL v40 = 0;
          long long v30 = v42;
          goto LABEL_18;
        }
        __int16 v36 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35600]);
        [(HMDHAPMetadata *)self parseAndSetHMAccessoryFirmwareUpdatePolicies:v36];
        BOOL v40 = 1;
        long long v30 = v42;
      }
      else
      {
        BOOL v40 = 0;
      }
    }
    else
    {
      BOOL v40 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  BOOL v40 = 0;
LABEL_22:

  return v40;
}

- (id)parseAndSetRawPlist:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL v6 = objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x263F35B68]);
    if ([(HMDHAPMetadata *)self parseAndSetHMMetadataWithHMPlist:v6])
    {
      id v7 = objc_msgSend(v5, "hmf_dictionaryForKey:", *MEMORY[0x263F35B78]);
      if ([(HMDHAPMetadata *)self parseAndSetAssistantMetadataWithAssistantPlist:v7])
      {
        BOOL v8 = 0;
      }
      else
      {
        uint64_t v15 = (void *)MEMORY[0x230FBD990]();
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = HMFGetLogIdentifier();
          int v19 = 138543618;
          id v20 = v17;
          __int16 v21 = 2112;
          uint64_t v22 = v7;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse assistant metadata from plist %@", (uint8_t *)&v19, 0x16u);
        }
        BOOL v8 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1001];
      }
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v14;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HM metadata from plist %@", (uint8_t *)&v19, 0x16u);
      }
      BOOL v8 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1001];
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to set HMDMetadata because rawPlist is nil.", (uint8_t *)&v19, 0xCu);
    }
    BOOL v8 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1001];
  }

  return v8;
}

- (id)autoApplyPolicyConfigurationForService:(id)a3 category:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    BOOL v8 = [(HMDHAPMetadata *)self firmwareUpdateAutoApplyPolicies];
    uint64_t v9 = [v8 valueForKey:v7];

    if (v6) {
      id v10 = v6;
    }
    else {
      id v10 = (id)*MEMORY[0x263F35630];
    }
    BOOL v11 = [v9 valueForKey:v10];
  }
  else
  {
    BOOL v11 = 0;
  }
  return v11;
}

- (id)stagingPolicyConfigurationForService:(id)a3 category:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    BOOL v8 = [(HMDHAPMetadata *)self firmwareUpdateStagingPolicies];
    uint64_t v9 = [v8 valueForKey:v7];

    if (v6) {
      id v10 = v6;
    }
    else {
      id v10 = (id)*MEMORY[0x263F35630];
    }
    BOOL v11 = [v9 valueForKey:v10];
  }
  else
  {
    BOOL v11 = 0;
  }
  return v11;
}

- (BOOL)disallowsAssistantServiceType:(id)a3 characteristicType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(HMDHAPMetadata *)self disallowedAssistantCharacteristicTypesByServiceType];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  LOBYTE(v7) = [v9 containsObject:v6];
  return (char)v7;
}

- (id)mapToAssistantCharacteristicValue:(id)a3 name:(id)a4 getActionType:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDHAPMetadata *)self assistantCharacteristics];
  BOOL v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    uint64_t v12 = [v11 outValues];
    uint64_t v13 = [v12 count];

    if (v13 && v5)
    {
      __int16 v14 = [NSString stringWithFormat:@"%@", v8];
      uint64_t v15 = [v11 outValues];
      id v16 = [v15 objectForKeyedSubscript:v14];
      goto LABEL_16;
    }
    int v17 = [v11 values];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      int v19 = [v11 values];
      __int16 v14 = [v19 allKeysForObject:v8];

      if (![v14 count])
      {
        id v16 = 0;
        goto LABEL_17;
      }
      uint64_t v15 = [v14 firstObject];
      id v20 = [MEMORY[0x263F08B08] scannerWithString:v15];
      uint64_t v24 = 0;
      double v25 = 0.0;
      int v23 = 0;
      if ([v20 scanDouble:&v25])
      {
        id v21 = [NSNumber numberWithDouble:v25];
      }
      else if ([v20 scanLongLong:&v24])
      {
        id v21 = [NSNumber numberWithLongLong:v24];
      }
      else if ([v20 scanInt:&v23])
      {
        [NSNumber numberWithBool:v23 != 0];
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v21 = v15;
      }
      id v16 = v21;

LABEL_16:
LABEL_17:

      if (v16) {
        goto LABEL_19;
      }
    }
  }
  id v16 = v8;
LABEL_19:

  return v16;
}

- (id)mapFromAssistantCharacteristicValue:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHAPMetadata *)self assistantCharacteristics];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9) {
    goto LABEL_4;
  }
  id v10 = [v9 values];
  uint64_t v11 = [v10 count];

  if (!v11) {
    goto LABEL_4;
  }
  uint64_t v12 = [NSString stringWithFormat:@"%@", v6];
  uint64_t v13 = [v9 values];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (!v14) {
LABEL_4:
  }
    id v14 = v6;

  return v14;
}

- (id)mapFromAssistantUnitName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDHAPMetadata *)self assistantUnits];
  id v6 = objc_msgSend(v5, "hmf_stringForKey:", v4);

  return v6;
}

- (id)mapToAssistantUnitName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDHAPMetadata *)self assistantUnits];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)mapCharacteristicValueType:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [(HMDHAPMetadata *)self assistantCharacteristics];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 format];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)characteristicValueUnit:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDHAPMetadata *)self hapMetadata];
  id v6 = [v5 characteristicValueUnitOfType:v4];

  return v6;
}

- (id)getStatusCharacteristicTypes:(id)a3 forServiceType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDHAPMetadata *)self statusHAPCharacteristicTypesForServiceType];
  id v9 = [v8 objectForKey:v6];

  id v10 = [v9 objectForKey:v7];

  return v10;
}

- (id)getCharacteristicTypeAlias:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDHAPMetadata *)self aliasedHAPCharacteristicTypes];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)getAliasedCharacteristicTypes:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDHAPMetadata *)self aliasedHAPCharacteristicTypes];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v16);
        int v14 = [v13 isEqual:v4];

        if (v14) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)getServiceTypeAlias:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDHAPMetadata *)self aliasedHAPServiceTypes];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)getAliasedServiceType:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HMDHAPMetadata *)self aliasedHAPServiceTypes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)mapWriteCharacteristicFromAssistantName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHAPMetadata *)self assistantCharacteristics];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [(HMDHAPMetadata *)self hapMetadata];
  uint64_t v8 = [v6 writeHAPCharacteristicName];
  uint64_t v9 = [v7 characteristicTypeFromUTI:v8];

  return v9;
}

- (id)mapReadCharacteristicFromAssistantName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHAPMetadata *)self assistantCharacteristics];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [(HMDHAPMetadata *)self hapMetadata];
  uint64_t v8 = [v6 readHAPCharacteristicName];
  uint64_t v9 = [v7 characteristicTypeFromUTI:v8];

  return v9;
}

- (id)mapToAssistantCharacteristicName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [(HMDHAPMetadata *)self aliasedHAPCharacteristicTypes];
    if (([v5 isEqual:*MEMORY[0x263F35528]] & 1) == 0
      && ([v5 isEqual:*MEMORY[0x263F35520]] & 1) == 0)
    {
      uint64_t v7 = [v6 objectForKey:v5];

      if (v7)
      {
        uint64_t v8 = [v6 objectForKey:v5];

        id v5 = (void *)v8;
      }
    }
    uint64_t v9 = [(HMDHAPMetadata *)self assistantChrHAPTypeNameMap];
    uint64_t v10 = [v9 objectForKeyedSubscript:v5];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)mapToAssistantServiceSubtypeName:(id)a3 accessoryCategory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (mapToAssistantServiceSubtypeName_accessoryCategory__onceToken == -1)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  dispatch_once(&mapToAssistantServiceSubtypeName_accessoryCategory__onceToken, &__block_literal_global_259);
  if (!v7) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v8 = [(id)mapToAssistantServiceSubtypeName_accessoryCategory__accessoryCategoryMap objectForKeyedSubscript:v7];
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  if (v5 && v8)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:v5];
  }

LABEL_9:
  return v10;
}

void __69__HMDHAPMetadata_mapToAssistantServiceSubtypeName_accessoryCategory___block_invoke()
{
  v34[8] = *MEMORY[0x263EF8340];
  v33[0] = *MEMORY[0x263F0B018];
  uint64_t v31 = *MEMORY[0x263F0D6C8];
  uint64_t v0 = v31;
  uint64_t v32 = *MEMORY[0x263F65648];
  uint64_t v1 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v34[0] = v1;
  v33[1] = *MEMORY[0x263F0AFC8];
  uint64_t v2 = *MEMORY[0x263F65640];
  uint64_t v3 = *MEMORY[0x263F0D870];
  v28[0] = v0;
  v28[1] = v3;
  uint64_t v4 = *MEMORY[0x263F65658];
  v30[0] = v2;
  v30[1] = v4;
  uint64_t v29 = *MEMORY[0x263F0D708];
  uint64_t v5 = v29;
  v30[2] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v30 forKeys:v28 count:3];
  v34[1] = v6;
  v33[2] = *MEMORY[0x263F0B000];
  uint64_t v26 = v0;
  uint64_t v27 = *MEMORY[0x263F65688];
  uint64_t v7 = v27;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v34[2] = v8;
  v33[3] = *MEMORY[0x263F0AFD8];
  uint64_t v24 = v0;
  uint64_t v25 = v7;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v34[3] = v9;
  v33[4] = *MEMORY[0x263F0B070];
  uint64_t v22 = v0;
  uint64_t v23 = *MEMORY[0x263F65650];
  uint64_t v10 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v34[4] = v10;
  v33[5] = *MEMORY[0x263F0B1A8];
  v20[0] = v3;
  v20[1] = v5;
  v21[0] = v4;
  v21[1] = v4;
  char v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v34[5] = v11;
  v33[6] = *MEMORY[0x263F0AFE8];
  v18[0] = v3;
  v18[1] = v5;
  v19[0] = v4;
  v19[1] = v4;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v34[6] = v12;
  v33[7] = *MEMORY[0x263F0B078];
  uint64_t v16 = v5;
  uint64_t v17 = *MEMORY[0x263F656B8];
  long long v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v34[7] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:8];
  long long v15 = (void *)mapToAssistantServiceSubtypeName_accessoryCategory__accessoryCategoryMap;
  mapToAssistantServiceSubtypeName_accessoryCategory__accessoryCategoryMap = v14;
}

- (id)mapToAssistantServiceSubtypeName:(id)a3
{
  uint64_t v3 = mapToAssistantServiceSubtypeName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&mapToAssistantServiceSubtypeName__onceToken, &__block_literal_global_257);
  }
  uint64_t v5 = [(id)mapToAssistantServiceSubtypeName__assistantServiceSubtypeNameMap objectForKey:v4];

  return v5;
}

void __51__HMDHAPMetadata_mapToAssistantServiceSubtypeName___block_invoke()
{
  v17[10] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F65670];
  uint64_t v1 = *MEMORY[0x263F0D5C0];
  v16[0] = *MEMORY[0x263F0D5B8];
  v16[1] = v1;
  uint64_t v2 = *MEMORY[0x263F65690];
  v17[0] = v0;
  v17[1] = v2;
  uint64_t v3 = *MEMORY[0x263F656A0];
  uint64_t v4 = *MEMORY[0x263F0D5F0];
  v16[2] = *MEMORY[0x263F0D5D8];
  v16[3] = v4;
  uint64_t v5 = *MEMORY[0x263F656B0];
  v17[2] = v3;
  v17[3] = v5;
  uint64_t v6 = *MEMORY[0x263F656A8];
  uint64_t v7 = *MEMORY[0x263F35708];
  v16[4] = *MEMORY[0x263F356D8];
  v16[5] = v7;
  uint64_t v8 = *MEMORY[0x263F65698];
  v17[4] = v6;
  v17[5] = v8;
  uint64_t v9 = *MEMORY[0x263F65660];
  uint64_t v10 = *MEMORY[0x263F0D6F8];
  v16[6] = *MEMORY[0x263F0D6A8];
  v16[7] = v10;
  uint64_t v11 = *MEMORY[0x263F65668];
  v17[6] = v9;
  v17[7] = v11;
  uint64_t v12 = *MEMORY[0x263F0D8B8];
  v16[8] = *MEMORY[0x263F0D8A8];
  v16[9] = v12;
  uint64_t v13 = *MEMORY[0x263F656C8];
  v17[8] = *MEMORY[0x263F656C0];
  v17[9] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:10];
  long long v15 = (void *)mapToAssistantServiceSubtypeName__assistantServiceSubtypeNameMap;
  mapToAssistantServiceSubtypeName__assistantServiceSubtypeNameMap = v14;
}

- (id)mapFromAssistantServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDHAPMetadata *)self assistantServiceNameHAPTypeMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)mapToAssistantServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDHAPMetadata *)self aliasedHAPServiceTypes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  uint64_t v10 = [(HMDHAPMetadata *)self assistantServiceHAPTypeNameMap];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  return v11;
}

- (BOOL)supportsLocalization:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDHAPMetadata *)self assistantCharacteristics];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v5) = [v6 supportsLocalization];
  return (char)v5;
}

- (id)serviceSubtypeForValue:(id)a3 forServiceType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (serviceSubtypeForValue_forServiceType__onceToken != -1) {
      dispatch_once(&serviceSubtypeForValue_forServiceType__onceToken, &__block_literal_global_247);
    }
    uint64_t v7 = [(id)serviceSubtypeForValue_forServiceType__subServiceTypeMap objectForKey:v6];
    id v8 = [v7 objectForKey:v5];

    if (!v8)
    {
      int v9 = [v6 isEqualToString:*MEMORY[0x263F357A0]];
      uint64_t v10 = (id *)MEMORY[0x263F0D5B8];
      if (!v9) {
        uint64_t v10 = (id *)MEMORY[0x263F0D5E8];
      }
      id v8 = *v10;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __56__HMDHAPMetadata_serviceSubtypeForValue_forServiceType___block_invoke()
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F357A0];
  uint64_t v0 = *MEMORY[0x263F0D5B8];
  v6[0] = &unk_26E470B58;
  v6[1] = &unk_26E470B70;
  uint64_t v1 = *MEMORY[0x263F0D5C0];
  v7[0] = v0;
  v7[1] = v1;
  v6[2] = &unk_26E470B88;
  v6[3] = &unk_26E470BA0;
  uint64_t v2 = *MEMORY[0x263F0D5F0];
  void v7[2] = *MEMORY[0x263F0D5D8];
  v7[3] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v9[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v5 = (void *)serviceSubtypeForValue_forServiceType__subServiceTypeMap;
  serviceSubtypeForValue_forServiceType__subServiceTypeMap = v4;
}

- (id)categoryTypeFromName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMDHAPMetadata *)self hmAccessoryCategories];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = [v9 uuidStr];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)categoryForType:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHAPMetadata *)self hmAccessoryCategories];
  id v6 = [v5 allValues];
  uint64_t v7 = objc_msgSend(v6, "hmf_firstObjectWithValue:forKeyPath:", v4, @"uuidStr");

  if (!v7)
  {
    id v8 = [(HMDHAPMetadata *)self audioAccessoryCategory];
    int v9 = [v8 uuidStr];
    char v10 = [v4 isEqual:v9];

    if (v10) {
      goto LABEL_5;
    }
  }
  id v8 = v7;
LABEL_5:

  return v8;
}

- (id)categoryForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHAPMetadata *)self hmAccessoryCategories];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [(HMDHAPMetadata *)self audioAccessoryCategory];
    id v8 = [v7 identifier];
    char v9 = [v4 isEqual:v8];

    if (v9) {
      goto LABEL_5;
    }
  }
  id v7 = v6;
LABEL_5:

  return v7;
}

- (id)audioAccessoryCategory
{
  uint64_t v2 = [HMDHAPMetadataCategory alloc];
  uint64_t v3 = [(HMDHAPMetadataCategory *)v2 initWithIdentifier:&unk_26E470B40 uuid:*MEMORY[0x263F0B0A0] name:@"homepod" description:@"HomePod"];
  return v3;
}

- (id)categoryForOther
{
  uint64_t v2 = [(HMDHAPMetadata *)self hmAccessoryCategories];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26E470B28];

  return v3;
}

- (BOOL)shouldRefreshValueForCharacteristicWithType:(id)a3 serviceType:(id)a4
{
  uint64_t v5 = shouldRefreshValueForCharacteristicWithType_serviceType__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&shouldRefreshValueForCharacteristicWithType_serviceType__onceToken, &__block_literal_global_230);
  }
  id v8 = objc_msgSend((id)shouldRefreshValueForCharacteristicWithType_serviceType__refreshCharacteristicMapping, "hmf_arrayForKey:", v6);

  char v9 = [v8 containsObject:v7];
  return v9;
}

void __74__HMDHAPMetadata_shouldRefreshValueForCharacteristicWithType_serviceType___block_invoke()
{
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = @"00000228-0000-1000-8000-0026BB765291";
  uint64_t v0 = *MEMORY[0x263F0C5A0];
  v11[0] = *MEMORY[0x263F0C0C0];
  v11[1] = v0;
  uint64_t v1 = *MEMORY[0x263F0C000];
  v11[2] = *MEMORY[0x263F0C290];
  v11[3] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
  v13[0] = v2;
  v12[1] = @"00000253-0000-1000-8000-0026BB765291";
  uint64_t v3 = *MEMORY[0x263F0BF08];
  v10[0] = @"00000254-0000-1000-8000-0026BB765291";
  v10[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v13[1] = v4;
  v12[2] = @"0000026A-0000-1000-8000-0026BB765291";
  uint64_t v5 = *MEMORY[0x263F0C298];
  v9[0] = *MEMORY[0x263F0C1D8];
  v9[1] = v5;
  void v9[2] = *MEMORY[0x263F0BEF8];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  v13[2] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  id v8 = (void *)shouldRefreshValueForCharacteristicWithType_serviceType__refreshCharacteristicMapping;
  shouldRefreshValueForCharacteristicWithType_serviceType__refreshCharacteristicMapping = v7;
}

- (BOOL)shouldFilterEnableNotificationsForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (shouldFilterEnableNotificationsForCharacteristicType_serviceType__onceToken != -1) {
    dispatch_once(&shouldFilterEnableNotificationsForCharacteristicType_serviceType__onceToken, &__block_literal_global_228);
  }
  if ([(id)shouldFilterEnableNotificationsForCharacteristicType_serviceType__servicesToFilterEnableNotifications containsObject:v7])
  {
    char v8 = 1;
  }
  else
  {
    char v9 = [(HMDHAPMetadata *)self hmBlacklistedServices];
    if ([v9 containsObject:v7])
    {
      char v8 = 1;
    }
    else
    {
      char v10 = [(HMDHAPMetadata *)self hmBlacklistedCharacteristics];
      if ([v10 containsObject:v6]) {
        char v8 = 1;
      }
      else {
        char v8 = [(id)shouldFilterEnableNotificationsForCharacteristicType_serviceType__characteristicsToFilterEnableNotifications containsObject:v6];
      }
    }
  }

  return v8;
}

void __83__HMDHAPMetadata_shouldFilterEnableNotificationsForCharacteristicType_serviceType___block_invoke()
{
  void v10[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D840];
  v10[0] = *MEMORY[0x263F0D838];
  v10[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)shouldFilterEnableNotificationsForCharacteristicType_serviceType__servicesToFilterEnableNotifications;
  shouldFilterEnableNotificationsForCharacteristicType_serviceType__servicesToFilterEnableNotifications = v3;

  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = *MEMORY[0x263F0BF70];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  uint64_t v7 = [v5 setWithArray:v6];
  char v8 = (void *)shouldFilterEnableNotificationsForCharacteristicType_serviceType__characteristicsToFilterEnableNotifications;
  shouldFilterEnableNotificationsForCharacteristicType_serviceType__characteristicsToFilterEnableNotifications = v7;
}

- (BOOL)shouldFilterChangeNotificationsForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (shouldFilterChangeNotificationsForCharacteristicType_serviceType__onceToken != -1) {
    dispatch_once(&shouldFilterChangeNotificationsForCharacteristicType_serviceType__onceToken, &__block_literal_global_226);
  }
  if ([(id)shouldFilterChangeNotificationsForCharacteristicType_serviceType__servicesToFilterChangeNotifications containsObject:v7])
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [(HMDHAPMetadata *)self hmBlacklistedServices];
    if ([v9 containsObject:v7])
    {
      char v8 = 1;
    }
    else
    {
      char v10 = [(HMDHAPMetadata *)self hmBlacklistedCharacteristics];
      if ([v10 containsObject:v6]) {
        char v8 = 1;
      }
      else {
        char v8 = [(id)shouldFilterChangeNotificationsForCharacteristicType_serviceType__characteristicsToFilterChangeNotifications containsObject:v6];
      }
    }
  }

  return v8;
}

void __83__HMDHAPMetadata_shouldFilterChangeNotificationsForCharacteristicType_serviceType___block_invoke()
{
  void v10[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D840];
  v10[0] = *MEMORY[0x263F0D838];
  v10[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)shouldFilterChangeNotificationsForCharacteristicType_serviceType__servicesToFilterChangeNotifications;
  shouldFilterChangeNotificationsForCharacteristicType_serviceType__servicesToFilterChangeNotifications = v3;

  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = *MEMORY[0x263F0BF70];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  uint64_t v7 = [v5 setWithArray:v6];
  char v8 = (void *)shouldFilterChangeNotificationsForCharacteristicType_serviceType__characteristicsToFilterChangeNotifications;
  shouldFilterChangeNotificationsForCharacteristicType_serviceType__characteristicsToFilterChangeNotifications = v7;
}

- (BOOL)shouldHomeAppShowTileForServiceType:(id)a3
{
  uint64_t v3 = shouldHomeAppShowTileForServiceType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldHomeAppShowTileForServiceType__onceToken, &__block_literal_global_224);
  }
  char v5 = [(id)shouldHomeAppShowTileForServiceType__servicesShowTilesInHomeApp containsObject:v4];

  return v5;
}

void __54__HMDHAPMetadata_shouldHomeAppShowTileForServiceType___block_invoke()
{
  v18[29] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F35788];
  v18[0] = *MEMORY[0x263F35708];
  v18[1] = v1;
  uint64_t v2 = *MEMORY[0x263F356E8];
  void v18[2] = *MEMORY[0x263F35790];
  v18[3] = v2;
  uint64_t v3 = *MEMORY[0x263F357A8];
  v18[4] = *MEMORY[0x263F356D8];
  v18[5] = v3;
  uint64_t v4 = *MEMORY[0x263F35710];
  v18[6] = *MEMORY[0x263F35718];
  v18[7] = v4;
  uint64_t v5 = *MEMORY[0x263F357B0];
  v18[8] = *MEMORY[0x263F356C8];
  v18[9] = v5;
  uint64_t v6 = *MEMORY[0x263F35728];
  v18[10] = *MEMORY[0x263F357B8];
  v18[11] = v6;
  uint64_t v7 = *MEMORY[0x263F35778];
  v18[12] = *MEMORY[0x263F35730];
  v18[13] = v7;
  uint64_t v8 = *MEMORY[0x263F35740];
  v18[14] = *MEMORY[0x263F35738];
  v18[15] = v8;
  uint64_t v9 = *MEMORY[0x263F35758];
  v18[16] = *MEMORY[0x263F35748];
  v18[17] = v9;
  uint64_t v10 = *MEMORY[0x263F35770];
  v18[18] = *MEMORY[0x263F35768];
  v18[19] = v10;
  uint64_t v11 = *MEMORY[0x263F35760];
  v18[20] = *MEMORY[0x263F35750];
  v18[21] = v11;
  uint64_t v12 = *MEMORY[0x263F356B8];
  v18[22] = *MEMORY[0x263F35780];
  v18[23] = v12;
  uint64_t v13 = *MEMORY[0x263F356F8];
  v18[24] = *MEMORY[0x263F356F0];
  v18[25] = v13;
  uint64_t v14 = *MEMORY[0x263F357A0];
  v18[26] = *MEMORY[0x263F35700];
  v18[27] = v14;
  v18[28] = *MEMORY[0x263F356E0];
  long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:29];
  uint64_t v16 = [v0 setWithArray:v15];
  uint64_t v17 = (void *)shouldHomeAppShowTileForServiceType__servicesShowTilesInHomeApp;
  shouldHomeAppShowTileForServiceType__servicesShowTilesInHomeApp = v16;
}

- (BOOL)shouldEnableHomeNotificationForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (shouldEnableHomeNotificationForCharacteristicType_serviceType__onceToken != -1) {
    dispatch_once(&shouldEnableHomeNotificationForCharacteristicType_serviceType__onceToken, &__block_literal_global_222);
  }
  uint64_t v8 = objc_msgSend((id)shouldEnableHomeNotificationForCharacteristicType_serviceType__homedInternalHomeNotifications, "hmf_arrayForKey:", v7);
  char v9 = [v8 containsObject:v6];

  if (v9)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    uint64_t v11 = [(HMDHAPMetadata *)self hapMetadata];
    if ([v11 isStandardHAPService:v7])
    {
      uint64_t v12 = [(HMDHAPMetadata *)self hapMetadata];
      if (![v12 isStandardHAPCharacteristic:v6]
        || ([(id)shouldEnableHomeNotificationForCharacteristicType_serviceType__serviceTypesNotAllowingHomeNotifications containsObject:v7] & 1) != 0|| (objc_msgSend((id)shouldEnableHomeNotificationForCharacteristicType_serviceType__characteristicTypesNotAllowingHomeNotifications, "containsObject:", v6) & 1) != 0|| -[HMDHAPMetadata shouldFilterServiceOfTypeFromApp:](self, "shouldFilterServiceOfTypeFromApp:", v7))
      {
        LOBYTE(v10) = 0;
      }
      else
      {
        BOOL v10 = ![(HMDHAPMetadata *)self shouldFilterCharacteristicOfTypeFromApp:v6];
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

void __80__HMDHAPMetadata_shouldEnableHomeNotificationForCharacteristicType_serviceType___block_invoke()
{
  v18[3] = *MEMORY[0x263EF8340];
  v17[0] = @"00000228-0000-1000-8000-0026BB765291";
  uint64_t v0 = *MEMORY[0x263F0C5A0];
  v16[0] = *MEMORY[0x263F0C0C0];
  v16[1] = v0;
  v16[2] = *MEMORY[0x263F0C290];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v18[0] = v1;
  v17[1] = @"00000253-0000-1000-8000-0026BB765291";
  uint64_t v2 = *MEMORY[0x263F0BF08];
  v15[0] = @"00000254-0000-1000-8000-0026BB765291";
  v15[1] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v18[1] = v3;
  v17[2] = @"0000026A-0000-1000-8000-0026BB765291";
  uint64_t v4 = *MEMORY[0x263F0BEF8];
  v14[0] = *MEMORY[0x263F0C298];
  v14[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  void v18[2] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  id v7 = (void *)shouldEnableHomeNotificationForCharacteristicType_serviceType__homedInternalHomeNotifications;
  shouldEnableHomeNotificationForCharacteristicType_serviceType__homedInternalHomeNotifications = v6;

  uint64_t v13 = *MEMORY[0x263F356A0];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  char v9 = (void *)shouldEnableHomeNotificationForCharacteristicType_serviceType__serviceTypesNotAllowingHomeNotifications;
  shouldEnableHomeNotificationForCharacteristicType_serviceType__serviceTypesNotAllowingHomeNotifications = v8;

  uint64_t v12 = *MEMORY[0x263F35500];
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  uint64_t v11 = (void *)shouldEnableHomeNotificationForCharacteristicType_serviceType__characteristicTypesNotAllowingHomeNotifications;
  shouldEnableHomeNotificationForCharacteristicType_serviceType__characteristicTypesNotAllowingHomeNotifications = v10;
}

- (BOOL)shouldAutoEnableNotificationForCharacteristic:(id)a3 ofService:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (shouldAutoEnableNotificationForCharacteristic_ofService__onceToken != -1) {
    dispatch_once(&shouldAutoEnableNotificationForCharacteristic_ofService__onceToken, &__block_literal_global_220);
  }
  if (isCharacteristicHeartBeat(v7, v6) && (isiOSDevice() || isWatch() || isMac()))
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    char v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Forcing shouldAutoEnableNotification to NO for Heart Beat characteristic", (uint8_t *)&v16, 0xCu);
    }
    char v12 = 0;
  }
  else
  {
    uint64_t v13 = [(HMDHAPMetadata *)self hmNotificationAutoEnabledTuples];
    if ([(HMDHAPMetadata *)self checkTupleExistsInSet:v13 forChrType:v6 svcType:v7])
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v14 = objc_msgSend((id)shouldAutoEnableNotificationForCharacteristic_ofService__autoEnableNotifications, "hmf_arrayForKey:", v7);
      char v12 = [v14 containsObject:v6];
    }
  }

  return v12;
}

void __74__HMDHAPMetadata_shouldAutoEnableNotificationForCharacteristic_ofService___block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F0D640];
  uint64_t v3 = *MEMORY[0x263F0C430];
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v3 count:1];
  v5[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = (void *)shouldAutoEnableNotificationForCharacteristic_ofService__autoEnableNotifications;
  shouldAutoEnableNotificationForCharacteristic_ofService__autoEnableNotifications = v1;
}

- (BOOL)isSecondsDownCounterCharacteristicType:(id)a3
{
  uint64_t v3 = isSecondsDownCounterCharacteristicType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isSecondsDownCounterCharacteristicType__onceToken, &__block_literal_global_218);
  }
  char v5 = [(id)isSecondsDownCounterCharacteristicType__secondsDownCounterCharacteristicTypes containsObject:v4];

  return v5;
}

void __57__HMDHAPMetadata_isSecondsDownCounterCharacteristicType___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F35548];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)isSecondsDownCounterCharacteristicType__secondsDownCounterCharacteristicTypes;
  isSecondsDownCounterCharacteristicType__secondsDownCounterCharacteristicTypes = v2;
}

- (BOOL)generateNotificationOnConfigurationForCharacteristicType:(id)a3 serviceType:(id)a4
{
  uint64_t v5 = generateNotificationOnConfigurationForCharacteristicType_serviceType__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&generateNotificationOnConfigurationForCharacteristicType_serviceType__onceToken, &__block_literal_global_216);
  }
  uint64_t v8 = objc_msgSend((id)generateNotificationOnConfigurationForCharacteristicType_serviceType__generateNotificationMapping, "hmf_arrayForKey:", v7);

  char v9 = [v8 containsObject:v6];
  return v9;
}

void __87__HMDHAPMetadata_generateNotificationOnConfigurationForCharacteristicType_serviceType___block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F0BEF8];
  uint64_t v3 = *MEMORY[0x263F0D850];
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v3 count:1];
  v5[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = (void *)generateNotificationOnConfigurationForCharacteristicType_serviceType__generateNotificationMapping;
  generateNotificationOnConfigurationForCharacteristicType_serviceType__generateNotificationMapping = v1;
}

- (BOOL)shouldNotCacheCharacteristicOfType:(id)a3
{
  uint64_t v3 = shouldNotCacheCharacteristicOfType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldNotCacheCharacteristicOfType__onceToken, &__block_literal_global_214);
  }
  char v5 = [(id)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes containsObject:v4];

  return v5;
}

void __53__HMDHAPMetadata_shouldNotCacheCharacteristicOfType___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F354E0];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes;
  shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes = v2;
}

- (BOOL)shouldFilterCharacteristicOfTypeFromApp:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hmBlacklistedCharacteristicsFromApp];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)shouldFilterServiceOfTypeFromApp:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hmBlacklistedServicesFromApp];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)shouldFilterCharacteristicOfType:(id)a3
{
  id v4 = a3;
  if (shouldFilterCharacteristicOfType__pred != -1) {
    dispatch_once(&shouldFilterCharacteristicOfType__pred, &__block_literal_global_212);
  }
  if ([(id)shouldFilterCharacteristicOfType___allowedCharacteristics containsObject:v4])
  {
    char v5 = 0;
  }
  else
  {
    char v6 = [(HMDHAPMetadata *)self hmBlacklistedCharacteristics];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

void __51__HMDHAPMetadata_shouldFilterCharacteristicOfType___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F355E8];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)shouldFilterCharacteristicOfType___allowedCharacteristics;
  shouldFilterCharacteristicOfType___allowedCharacteristics = v2;
}

- (BOOL)shouldFilterServiceOfType:(id)a3
{
  id v4 = a3;
  if (shouldFilterServiceOfType__pred != -1) {
    dispatch_once(&shouldFilterServiceOfType__pred, &__block_literal_global_210);
  }
  if ([(id)shouldFilterServiceOfType___allowedServices containsObject:v4])
  {
    char v5 = 0;
  }
  else
  {
    char v6 = [(HMDHAPMetadata *)self hmBlacklistedServices];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

void __44__HMDHAPMetadata_shouldFilterServiceOfType___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F35798];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)shouldFilterServiceOfType___allowedServices;
  shouldFilterServiceOfType___allowedServices = v2;
}

- (BOOL)shouldCoalesceCharacteristicNotifications:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDHAPMetadata *)self hmCoalesceNotificationsTuples];
  LOBYTE(self) = [(HMDHAPMetadata *)self checkTupleExistsInSet:v8 forChrType:v7 svcType:v6];

  return (char)self;
}

- (BOOL)isTargetCharacteristic:(id)a3
{
  uint64_t v3 = isTargetCharacteristic__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isTargetCharacteristic__onceToken, &__block_literal_global_169);
  }
  char v5 = [(id)isTargetCharacteristic__targetCharacteristic containsObject:v4];

  return v5;
}

void __41__HMDHAPMetadata_isTargetCharacteristic___block_invoke()
{
  uint64_t v0 = (void *)isTargetCharacteristic__targetCharacteristic;
  isTargetCharacteristic__targetCharacteristic = (uint64_t)&unk_26E473E88;
}

- (BOOL)requiresTimedWrite:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (requiresTimedWrite_forService__onceToken != -1) {
    dispatch_once(&requiresTimedWrite_forService__onceToken, &__block_literal_global_166);
  }
  BOOL v8 = [(HMDHAPMetadata *)self requiresDeviceUnlock:v6 forService:v7]
    || v6
    && ([(id)requiresTimedWrite_forService__timedWriteRequiringCharacteristic containsObject:v6] & 1) != 0;

  return v8;
}

void __48__HMDHAPMetadata_requiresTimedWrite_forService___block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F355A0];
  v4[0] = *MEMORY[0x263F355D0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F35460];
  void v4[2] = *MEMORY[0x263F35598];
  v4[3] = v1;
  v4[4] = *MEMORY[0x263F354C8];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  uint64_t v3 = (void *)requiresTimedWrite_forService__timedWriteRequiringCharacteristic;
  requiresTimedWrite_forService__timedWriteRequiringCharacteristic = v2;
}

- (BOOL)requiresDeviceUnlock:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(HMDHAPMetadata *)self hmRequiresDeviceUnlockTuples];
  LOBYTE(self) = [(HMDHAPMetadata *)self checkTupleExistsInSet:v8 forChrType:v7 svcType:v6];

  return (char)self;
}

- (BOOL)shouldAllowToWakeSuspendedAccessoryForOperation:(int64_t)a3 service:(id)a4 characteristicType:(id)a5 value:(id)a6
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  long long v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = HMFGetLogIdentifier();
    if ((unint64_t)a3 > 0xA) {
      uint64_t v17 = @"Undefined";
    }
    else {
      uint64_t v17 = off_264A1CE20[a3];
    }
    uint64_t v18 = v17;
    *(_DWORD *)buf = 138544386;
    long long v61 = v16;
    __int16 v62 = 2112;
    id v63 = v18;
    __int16 v64 = 2112;
    id v65 = v10;
    __int16 v66 = 2112;
    id v67 = v11;
    __int16 v68 = 2112;
    id v69 = v12;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Checking if operation: '%@' is allowed to wake accessory for service: '%@' characteristic: '%@' with value '%@'", buf, 0x34u);
  }
  long long v19 = [(HMDHAPMetadata *)v14 hmWakeOnOperationsFilter];
  id v20 = objc_msgSend(v19, "hmf_dictionaryForKey:", v11);

  if (v20)
  {
    uint64_t v21 = objc_msgSend(v20, "hmf_dictionaryForKey:", v10);
    uint64_t v22 = v21;
    if (v21)
    {
      uint64_t v23 = objc_msgSend(v21, "hmf_arrayForKey:", *MEMORY[0x263F35C50]);
      if ((unint64_t)a3 > 0xA) {
        uint64_t v24 = @"Undefined";
      }
      else {
        uint64_t v24 = off_264A1CE20[a3];
      }
      uint64_t v26 = v24;
      int v27 = [v23 containsObject:v26];

      if (v27)
      {
        if (a3 == 3)
        {
          long long v28 = objc_msgSend(v22, "hmf_arrayForKey:", *MEMORY[0x263F35C38]);
          uint64_t v29 = v28;
          if (v28)
          {
            long long v52 = v23;
            uint64_t v54 = v28;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v30 = v28;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v56;
              while (2)
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v56 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  if (v12 && [*(id *)(*((void *)&v55 + 1) + 8 * i) isEqual:v12])
                  {
                    long long v45 = (void *)MEMORY[0x230FBD990]();
                    uint64_t v46 = v14;
                    uint64_t v47 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      uint64_t v48 = v51 = v45;
                      v49 = @"Write";
                      *(_DWORD *)buf = 138544386;
                      long long v61 = v48;
                      __int16 v62 = 2112;
                      id v63 = @"Write";
                      __int16 v64 = 2112;
                      id v65 = v10;
                      __int16 v66 = 2112;
                      id v67 = v11;
                      __int16 v68 = 2112;
                      id v69 = v12;
                      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Operation: %@ on service '%@' and characteristic '%@' with value '%@' is allowed to wake accessory", buf, 0x34u);

                      long long v45 = v51;
                    }

                    BOOL v25 = 1;
                    goto LABEL_36;
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
                if (v32) {
                  continue;
                }
                break;
              }
            }

            uint64_t v35 = (void *)MEMORY[0x230FBD990]();
            __int16 v36 = v14;
            uint64_t v37 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              v38 = HMFGetLogIdentifier();
              uint64_t v39 = @"Write";
              *(_DWORD *)buf = 138544130;
              long long v61 = v38;
              __int16 v62 = 2112;
              id v63 = @"Write";
              __int16 v64 = 2112;
              id v65 = v10;
              __int16 v66 = 2112;
              id v67 = v11;
              _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Operation: %@ on service '%@' and characteristic '%@' is not allowed to wake accessory", buf, 0x2Au);
            }
            BOOL v25 = 0;
LABEL_36:
            uint64_t v23 = v52;
            uint64_t v29 = v54;
          }
          else
          {
            BOOL v40 = (void *)MEMORY[0x230FBD990]();
            v41 = v14;
            v42 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              BOOL v43 = v53 = v40;
              uint64_t v44 = @"Write";
              *(_DWORD *)buf = 138544130;
              long long v61 = v43;
              __int16 v62 = 2112;
              id v63 = @"Write";
              __int16 v64 = 2112;
              id v65 = v10;
              __int16 v66 = 2112;
              id v67 = v11;
              _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Operation: %@ on service '%@' and characteristic '%@' is allowed to wake accessory", buf, 0x2Au);

              BOOL v40 = v53;
            }

            BOOL v25 = 1;
          }
        }
        else
        {
          BOOL v25 = 1;
        }
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)allowsSecuringWriteFor:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(HMDHAPMetadata *)self hmAllowableSecuringWrites];
  char v9 = [v8 objectForKey:v7];

  if (v9) {
    char v10 = [v9 containsObject:v6];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (id)descriptionForCharacteristicType:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  id v6 = [v5 descriptionFromCharacteristicType:v4];

  return v6;
}

- (id)descriptionForServiceType:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  id v6 = [v5 descriptionFromServiceType:v4];

  return v6;
}

- (id)validateAssociatedServiceType:(id)a3 forService:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    long long v19 = 0;
    goto LABEL_14;
  }
  BOOL v8 = [(HMDHAPMetadata *)self hapMetadata];
  if (([v8 isStandardHAPService:v7] & 1) == 0)
  {

LABEL_10:
    long long v15 = (void *)MEMORY[0x230FBD990]();
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v37 = 138543874;
      v38 = v17;
      __int16 v39 = 2112;
      id v40 = v7;
      __int16 v41 = 2112;
      id v42 = v6;
      uint64_t v18 = "%{public}@Unknown service types %@ %@";
      id v20 = v16;
      uint32_t v21 = 32;
LABEL_12:
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v37, v21);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  char v9 = [(HMDHAPMetadata *)self hapMetadata];
  char v10 = [v9 isStandardHAPService:v6];

  if ((v10 & 1) == 0) {
    goto LABEL_10;
  }
  id v11 = [(HMDHAPMetadata *)self hapMetadata];
  char v12 = [v11 allowAssociatedService:v7];

  if ((v12 & 1) == 0)
  {
    long long v15 = (void *)MEMORY[0x230FBD990]();
    int v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v17 = HMFGetLogIdentifier();
    int v37 = 138543618;
    v38 = v17;
    __int16 v39 = 2112;
    id v40 = v7;
    uint64_t v18 = "%{public}@Service %@ does not other services to be associated";
    goto LABEL_19;
  }
  uint64_t v13 = [(HMDHAPMetadata *)self hapMetadata];
  int v14 = [v13 allowAssociatedService:v6];

  if (v14)
  {
    long long v15 = (void *)MEMORY[0x230FBD990]();
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v37 = 138543618;
      v38 = v17;
      __int16 v39 = 2112;
      id v40 = v6;
      uint64_t v18 = "%{public}@Service being associated %@ itself allows other services to be associated";
LABEL_19:
      id v20 = v16;
      uint32_t v21 = 22;
      goto LABEL_12;
    }
LABEL_13:

    long long v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:3 userInfo:0];
    goto LABEL_14;
  }
  id v23 = (id)*MEMORY[0x263F35518];
  uint64_t v24 = [(HMDHAPMetadata *)self hapMetadata];
  if (([v24 isMandatoryCharacteristic:v23 forService:v7] & 1) == 0)
  {

LABEL_24:
    id v27 = (id)*MEMORY[0x263F35458];
    id v28 = (id)*MEMORY[0x263F35468];
    id v29 = (id)*MEMORY[0x263F35490];
    id v30 = [(HMDHAPMetadata *)self hapMetadata];
    if ([v30 isMandatoryCharacteristic:v27 forService:v7])
    {
      uint64_t v31 = [(HMDHAPMetadata *)self hapMetadata];
      if ([v31 isMandatoryCharacteristic:v28 forService:v6])
      {

LABEL_32:
        long long v19 = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v35 = [(HMDHAPMetadata *)self hapMetadata];
      char v36 = [v35 isMandatoryCharacteristic:v29 forService:v6];

      if (v36) {
        goto LABEL_32;
      }
    }
    else
    {
    }
    uint64_t v32 = (void *)MEMORY[0x230FBD990]();
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      int v37 = 138543874;
      v38 = v34;
      __int16 v39 = 2112;
      id v40 = v7;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Service %@ or service being associated %@ are not compatible", (uint8_t *)&v37, 0x20u);
    }
    long long v19 = [MEMORY[0x263F087E8] hmErrorWithCode:62];
    goto LABEL_33;
  }
  BOOL v25 = [(HMDHAPMetadata *)self hapMetadata];
  char v26 = [v25 isMandatoryCharacteristic:v23 forService:v6];

  if ((v26 & 1) == 0) {
    goto LABEL_24;
  }
  long long v19 = 0;
LABEL_34:

LABEL_14:
  return v19;
}

- (BOOL)supportsAuthorizationData:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(HMDHAPMetadata *)self hapMetadata];
  char v9 = [v8 supportsAdditionalAuthorizationData:v7 forService:v6];

  return v9;
}

- (BOOL)isStandardServiceType:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  char v6 = [v5 isStandardHAPService:v4];

  return v6;
}

- (BOOL)isStandardCharacteristicType:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  char v6 = [v5 isStandardHAPCharacteristic:v4];

  return v6;
}

- (id)serviceTypeFromName:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  char v6 = [v5 serviceTypeFromUTI:v4];

  return v6;
}

- (id)serviceNameFromType:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  char v6 = [v5 serviceUTIFromType:v4];

  return v6;
}

- (id)characteristicTypeFromName:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  char v6 = [v5 characteristicTypeFromUTI:v4];

  return v6;
}

- (id)characteristicNameFromType:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHAPMetadata *)self hapMetadata];
  char v6 = [v5 characteristicUTIFromType:v4];

  return v6;
}

- (id)xpcData:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(HMDHAPMetadata *)self hmAccessoryCategories];
    char v5 = [v4 allValues];
  }
  else
  {
    char v5 = 0;
  }
  char v6 = (void *)MEMORY[0x263F0E378];
  id v7 = [(HMDHAPMetadata *)self version];
  BOOL v8 = [(HMDHAPMetadata *)self hapMetadata];
  char v9 = [v8 hapCharacteristics];
  char v10 = [(HMDHAPMetadata *)self hapMetadata];
  id v11 = [v10 hapServices];
  char v12 = [v6 encodeProtobufWithVersion:v7 characteristics:v9 services:v11 categories:v5];

  return v12;
}

- (HMDHAPMetadata)initWithFullPlist:(id)a3 hapMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    BOOL v8 = v7;
    if (v7)
    {
      char v9 = [(HMDHAPMetadata *)self initWithFullPlist:v6 hapMetadata:v7 error:0];

      return v9;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  id v11 = (HMDHAPMetadata *)_HMFPreconditionFailure();
  return [(HMDHAPMetadata *)v11 initWithDictionary:v13 hapMetadata:v14 error:v15];
}

- (HMDHAPMetadata)initWithDictionary:(id)a3 hapMetadata:(id)a4 error:(id *)a5
{
  id v6 = 0;
  if (a3 && a4)
  {
    char v9 = (void *)MEMORY[0x263EFF9A0];
    id v10 = a4;
    id v11 = [v9 dictionaryWithDictionary:a3];
    SEL v12 = [v10 rawPlist];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F35B58]];

    id v13 = [(HMDHAPMetadata *)self initWithFullPlist:v11 hapMetadata:v10 error:a5];
    self = v13;

    id v6 = self;
  }

  return v6;
}

- (HMDHAPMetadata)initWithFullPlist:(id)a3 hapMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDHAPMetadata;
  id v10 = [(HMDHAPMetadata *)&v21 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_hapMetadata, a4);
    uint64_t v12 = [v9 version];
    version = v11->_version;
    v11->_version = (NSNumber *)v12;

    uint64_t v14 = [v9 schemaVersion];
    schemaVersion = v11->_schemaVersion;
    v11->_schemaVersion = (NSNumber *)v14;

    uint64_t v16 = [v8 copy];
    rawPlist = v11->_rawPlist;
    v11->_rawPlist = (NSDictionary *)v16;

    uint64_t v18 = v11->_rawPlist;
    if (a5)
    {
      *a5 = [(HMDHAPMetadata *)v11 parseAndSetRawPlist:v18];
    }
    else
    {
      id v19 = [(HMDHAPMetadata *)v11 parseAndSetRawPlist:v18];
    }
  }

  return v11;
}

+ (BOOL)isHomedVersionSupported:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F42670];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 stringValue];

  id v7 = (void *)[v5 initWithVersionString:v6];
  if (isHomedVersionSupported__onceToken != -1) {
    dispatch_once(&isHomedVersionSupported__onceToken, &__block_literal_global_163);
  }
  char v8 = [v7 isAtLeastVersion:isHomedVersionSupported__requiredVersion];

  return v8;
}

void __42__HMDHAPMetadata_isHomedVersionSupported___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"4.0"];
  uint64_t v1 = (void *)isHomedVersionSupported__requiredVersion;
  isHomedVersionSupported__requiredVersion = v0;
}

+ (void)resetShouldUploadToCloudAfterHomedReady
{
  _shouldUploadToCloudAfterHomedReady = 0;
}

+ (BOOL)shouldUploadToCloudAfterHomedReady
{
  return _shouldUploadToCloudAfterHomedReady;
}

+ (void)prepareMetadata
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F359E8] setCurrentMetadataHook:&__block_literal_global_159];
  uint64_t v3 = +[HMDHAPMetadata getBuiltinInstance];
  id v4 = [v3 version];
  unint64_t v5 = [v4 unsignedIntegerValue];

  if (v5 - 881 <= 2)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      char v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v50 = v8;
      __int16 v51 = 2048;
      unint64_t v52 = v5;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Invalid builtin metadata version %lu", buf, 0x16u);
    }
  }
  id v9 = +[HMDPersistentStore loadPlainMetadataDictionary];
  uint64_t v10 = *MEMORY[0x263F35C40];
  id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F35C40]];
  uint64_t v12 = [v11 unsignedIntegerValue];

  uint64_t v13 = [v9 objectForKeyedSubscript:v10];
  if (!v13) {
    goto LABEL_20;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = *MEMORY[0x263F35C10];
  uint64_t v16 = [v9 objectForKeyedSubscript:*MEMORY[0x263F35C10]];
  if (!v16) {
    goto LABEL_19;
  }
  uint64_t v17 = (void *)v16;
  uint64_t v47 = v12;
  id v48 = a1;
  uint64_t v18 = *MEMORY[0x263F35BF0];
  uint64_t v19 = [v9 objectForKeyedSubscript:*MEMORY[0x263F35BF0]];
  if (!v19)
  {
LABEL_18:

    a1 = v48;
LABEL_19:

    goto LABEL_20;
  }
  id v20 = (void *)v19;
  objc_super v21 = [v9 objectForKeyedSubscript:v10];
  if ([v21 unsignedIntegerValue] <= v5)
  {

    goto LABEL_18;
  }
  uint64_t v46 = v18;
  uint64_t v22 = [v9 objectForKeyedSubscript:v15];
  uint64_t v23 = [v22 unsignedIntegerValue];

  a1 = v48;
  if (v23 == 1)
  {
    uint64_t v24 = v46;
    if (isInternalBuild() && v5 == 880 && (unint64_t)(v47 - 881) <= 1)
    {
      BOOL v25 = +[HMDPersistentStore loadBuiltinPlainMetadataDictionary];
      char v26 = (void *)[v25 mutableCopy];

      _shouldUploadToCloudAfterHomedReady = 1;
      id v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        id v30 = [v26 objectForKeyedSubscript:v10];
        uint64_t v31 = [v30 unsignedIntegerValue];
        uint64_t v32 = [v26 objectForKeyedSubscript:v46];
        uint64_t v33 = [v32 objectForKeyedSubscript:v10];
        uint64_t v34 = [v33 unsignedIntegerValue];
        *(_DWORD *)buf = 138544130;
        long long v50 = v29;
        __int16 v51 = 2048;
        unint64_t v52 = v31;
        __int16 v53 = 2048;
        uint64_t v54 = v34;
        __int16 v55 = 2048;
        uint64_t v56 = v47;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Metadata fix - Constructing version 883 metadata from current builtin version %lu, current builtin plist version %lu, archived version %lu", buf, 0x2Au);

        uint64_t v24 = v46;
        a1 = v48;
      }

      [v26 setObject:&unk_26E470B10 forKeyedSubscript:v10];
      uint64_t v35 = [v26 objectForKeyedSubscript:v24];
      [v35 setObject:&unk_26E470B10 forKeyedSubscript:v10];

      [a1 updateLocalMetadataWithMetadata:v26];
    }
    [a1 _logCurrentMetadata];
    goto LABEL_27;
  }
LABEL_20:
  char v36 = (void *)MEMORY[0x230FBD990]();
  int v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v50 = v38;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Cached metadata is not newer than the built-in one, prefer built-in metadata.", buf, 0xCu);
  }
  __int16 v39 = [v9 objectForKeyedSubscript:v10];
  unint64_t v40 = [v39 unsignedIntegerValue];
  __int16 v41 = [0 version];
  unint64_t v42 = [v41 unsignedIntegerValue];

  if (v40 < v42)
  {
    uint64_t v43 = (void *)MEMORY[0x230FBD990]();
    uint64_t v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      long long v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v50 = v45;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Built-in metadata is newer than the cached one, uploading to the cloud when homed is ready with at least one home or the first home being added.", buf, 0xCu);
    }
    _shouldUploadToCloudAfterHomedReady = 1;
  }
  [a1 updateLocalMetadataWithBuiltinMetadata];
LABEL_27:
}

id __33__HMDHAPMetadata_prepareMetadata__block_invoke()
{
  uint64_t v0 = +[HMDHAPMetadata getSharedInstance];
  uint64_t v1 = [v0 hapMetadata];

  return v1;
}

+ (BOOL)isAdminPrivilegeRequiredForWritingCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v4 = a4;
  if ([v4 isEqualToString:*MEMORY[0x263F0D658]]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:*MEMORY[0x263F0D668]];
  }

  return v5;
}

+ (BOOL)isOwnerPrivilegeRequiredForWritingCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = ([v5 isEqualToString:@"00000264-0000-1000-8000-0026BB765291"] & 1) != 0
    || ([v5 isEqualToString:@"00000262-0000-1000-8000-0026BB765291"] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x263F0D668]]
    && ![v5 isEqualToString:*MEMORY[0x263F0C348]];

  return v7;
}

+ (id)dataFromMetadataDictionaryWithKey:(id)a3
{
  id v3 = a3;
  id v4 = +[HMDPersistentStore loadPlainMetadataDictionary];
  uint64_t v5 = objc_msgSend(v4, "hmf_dataForKey:", v3);
  if (v5)
  {
    id v6 = (void *)v5;
  }
  else
  {
    BOOL v7 = +[HMDPersistentStore loadBuiltinPlainMetadataDictionary];

    id v6 = objc_msgSend(v7, "hmf_dataForKey:", v3);
    id v4 = v7;
  }

  return v6;
}

+ (id)legacyV3DataForCloud
{
  return +[HMDHAPMetadata dataFromMetadataDictionaryWithKey:*MEMORY[0x263F35BC8]];
}

+ (id)legacyV3DataForIDS
{
  return +[HMDHAPMetadata dataFromMetadataDictionaryWithKey:*MEMORY[0x263F35BD0]];
}

+ (BOOL)isServiceType:(id)a3 compatibleWithAccessoryCategoryType:(id)a4
{
  uint64_t v5 = isServiceType_compatibleWithAccessoryCategoryType__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&isServiceType_compatibleWithAccessoryCategoryType__onceToken, &__block_literal_global_147);
  }
  char v8 = [(id)isServiceType_compatibleWithAccessoryCategoryType__accessoryCategoryToServiceTypesMap objectForKeyedSubscript:v6];

  char v9 = [v8 containsObject:v7];
  return v9;
}

void __68__HMDHAPMetadata_isServiceType_compatibleWithAccessoryCategoryType___block_invoke()
{
  v34[25] = *MEMORY[0x263EF8340];
  v33[0] = *MEMORY[0x263F0B100];
  uint64_t v32 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D7D8], 0);
  v34[0] = v32;
  v33[1] = *MEMORY[0x263F0B048];
  uint64_t v31 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6A8], 0);
  v34[1] = v31;
  v33[2] = *MEMORY[0x263F0B058];
  id v30 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D798], 0);
  v34[2] = v30;
  v33[3] = *MEMORY[0x263F0B070];
  id v29 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6C8], *MEMORY[0x263F0D890], 0);
  v34[3] = v29;
  v33[4] = *MEMORY[0x263F0B088];
  id v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6F8], 0);
  v34[4] = v28;
  v33[5] = *MEMORY[0x263F0B0A8];
  uint64_t v0 = *MEMORY[0x263F0D660];
  id v27 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D660], 0);
  v34[5] = v27;
  v33[6] = *MEMORY[0x263F0B1B8];
  char v26 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v0, 0);
  v34[6] = v26;
  v33[7] = *MEMORY[0x263F0B0B8];
  BOOL v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D780], 0);
  v34[7] = v25;
  void v33[8] = *MEMORY[0x263F0B0E0];
  uint64_t v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D7D0], 0);
  v34[8] = v24;
  v33[9] = *MEMORY[0x263F0B0F0];
  uint64_t v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D820], 0);
  v34[9] = v23;
  v33[10] = *MEMORY[0x263F0B118];
  uint64_t v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D7F8], *MEMORY[0x263F0D858], *MEMORY[0x263F0D630], *MEMORY[0x263F0D670], *MEMORY[0x263F0D688], *MEMORY[0x263F0D698], *MEMORY[0x263F0D730], *MEMORY[0x263F0D758], *MEMORY[0x263F0D768], *MEMORY[0x263F0D7A8], *MEMORY[0x263F0D7B8], 0);
  void v34[10] = v22;
  v33[11] = *MEMORY[0x263F0B158];
  objc_super v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D828], 0);
  v34[11] = v21;
  v33[12] = *MEMORY[0x263F0B1A8];
  uint64_t v1 = *MEMORY[0x263F0D870];
  uint64_t v2 = *MEMORY[0x263F0D708];
  id v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D870], *MEMORY[0x263F0D708], 0);
  v34[12] = v20;
  v33[13] = *MEMORY[0x263F0B1C8];
  uint64_t v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D8A8], 0);
  v34[13] = v19;
  v33[14] = *MEMORY[0x263F0B1E0];
  uint64_t v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D8B8], 0);
  v34[14] = v18;
  v33[15] = *MEMORY[0x263F0B018];
  uint64_t v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D618], 0);
  v34[15] = v17;
  v33[16] = *MEMORY[0x263F0AFE8];
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v1, v2, 0);
  v34[16] = v3;
  v33[17] = *MEMORY[0x263F0B000];
  uint64_t v4 = *MEMORY[0x263F0D720];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D720], 0);
  v34[17] = v5;
  v33[18] = *MEMORY[0x263F0AFD8];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v4, 0);
  v34[18] = v6;
  v33[19] = *MEMORY[0x263F0B140];
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D740], 0);
  v34[19] = v7;
  v33[20] = *MEMORY[0x263F0B078];
  uint64_t v8 = *MEMORY[0x263F0D6D8];
  char v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6D8], 0);
  v34[20] = v9;
  v33[21] = *MEMORY[0x263F0B120];
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v8, 0);
  v34[21] = v10;
  v33[22] = *MEMORY[0x263F0B170];
  uint64_t v11 = *MEMORY[0x263F0D850];
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D850], 0);
  v34[22] = v12;
  v33[23] = *MEMORY[0x263F0B188];
  uint64_t v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v11, 0);
  v34[23] = v13;
  v33[24] = *MEMORY[0x263F0B198];
  uint64_t v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v11, 0);
  v34[24] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:25];
  uint64_t v16 = (void *)isServiceType_compatibleWithAccessoryCategoryType__accessoryCategoryToServiceTypesMap;
  isServiceType_compatibleWithAccessoryCategoryType__accessoryCategoryToServiceTypesMap = v15;
}

+ (void)updateLocalMetadataWithMetadata:(id)a3
{
  id v5 = a3;
  if (+[HMDPersistentStore archiveMetadata:](HMDPersistentStore, "archiveMetadata:"))
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = [a1 metadataCache];
    [v4 setObject:0 forKeyedSubscript:@"current"];

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
  [a1 _logCurrentMetadata];
}

+ (void)updateLocalMetadataWithBuiltinMetadata
{
  id v3 = +[HMDPersistentStore loadBuiltinPlainMetadataDictionary];
  BOOL v4 = +[HMDPersistentStore archiveMetadata:v3];

  if (v4)
  {
    os_unfair_lock_lock_with_options();
    id v5 = [a1 metadataCache];
    [v5 setObject:0 forKeyedSubscript:@"builtin"];

    id v6 = [a1 metadataCache];
    [v6 setObject:0 forKeyedSubscript:@"current"];

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
  [a1 _logCurrentMetadata];
}

+ (void)_logCurrentMetadata
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 getSharedInstance];
  id v3 = (void *)MEMORY[0x230FBD990]();
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [v2 version];
    id v7 = [v2 schemaVersion];
    int v8 = 138543874;
    char v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Switching to HMDHAPMetadata version %@ schemaVersion %@", (uint8_t *)&v8, 0x20u);
  }
}

+ (id)getSharedInstance
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock_with_options();
  id v3 = [a1 metadataCache];
  BOOL v4 = [v3 objectForKeyedSubscript:@"current"];
  if (v4)
  {
    id v5 = v4;
    id v6 = v5;
  }
  else
  {
    id v7 = (id)configPlainMetadataPath;
    if (v7)
    {
      id v22 = 0;
      id v5 = +[HMDHAPMetadata metadataWithPath:v7 error:&v22];
      id v8 = v22;
      if (v8) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v5 == 0;
      }
      char v10 = !v9;
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      if (v10)
      {
        HMFGetOSLogHandle();
        __int16 v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = [v5 version];
          uint64_t v15 = [v5 schemaVersion];
          *(_DWORD *)buf = 138543874;
          id v24 = v13;
          __int16 v25 = 2112;
          id v26 = v14;
          __int16 v27 = 2112;
          id v28 = v15;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Current HMDHAPMetadata version %@ schemaVersion %@", buf, 0x20u);
        }
        [v3 setObject:v5 forKeyedSubscript:@"current"];
        id v6 = v5;
      }
      else
      {
        HMFGetOSLogHandle();
        uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v24 = v20;
          __int16 v25 = 2112;
          id v26 = v8;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate the current metadata %@", buf, 0x16u);
        }
        id v6 = 0;
      }
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v24 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get plain metadata path", buf, 0xCu);
      }
      id v5 = 0;
      id v6 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  return v6;
}

+ (id)getBuiltinInstance
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock_with_options();
  id v3 = [a1 metadataCache];
  BOOL v4 = [v3 objectForKeyedSubscript:@"builtin"];
  if (v4)
  {
    id v5 = v4;
    id v6 = v5;
    goto LABEL_20;
  }
  id v7 = +[HMDPersistentStore loadBuiltinPlainMetadataDictionary];
  id v8 = objc_msgSend(v7, "hmf_dictionaryForKey:", *MEMORY[0x263F35BF0]);

  id v29 = 0;
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F359E8]) initWithDictionary:v8 error:&v29];
  id v10 = v29;
  if (v10 || !v9)
  {
    objc_super v21 = (void *)MEMORY[0x230FBD990]();
    HMFGetOSLogHandle();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v23;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate builtin HAP metadata %@", buf, 0x16u);
    }
    id v5 = 0;
  }
  else
  {
    id v28 = 0;
    id v5 = [[HMDHAPMetadata alloc] initWithDictionary:v8 hapMetadata:v9 error:&v28];
    id v10 = v28;
    if (!v10 && v5)
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]([v3 setObject:v5 forKeyedSubscript:@"builtin"]);
      HMFGetOSLogHandle();
      __int16 v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v9 version];
        uint64_t v15 = [v9 schemaVersion];
        *(_DWORD *)buf = 138543874;
        id v31 = v13;
        __int16 v32 = 2112;
        id v33 = v14;
        __int16 v34 = 2112;
        uint64_t v35 = v15;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Builtin HAPMetadata version %@ schemaVersion %@", buf, 0x20u);
      }
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [(HMDHAPMetadata *)v5 version];
        id v20 = [(HMDHAPMetadata *)v5 schemaVersion];
        *(_DWORD *)buf = 138543874;
        id v31 = v18;
        __int16 v32 = 2112;
        id v33 = v19;
        __int16 v34 = 2112;
        uint64_t v35 = v20;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Builtin HMDHAPMetadata version %@ schemaVersion %@", buf, 0x20u);
      }
      id v5 = v5;
      id v10 = 0;
      id v6 = v5;
      goto LABEL_19;
    }
    id v24 = (void *)MEMORY[0x230FBD990]();
    HMFGetOSLogHandle();
    __int16 v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v26;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate builtin metadata %@", buf, 0x16u);
    }
  }
  id v6 = 0;
LABEL_19:

LABEL_20:
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  return v6;
}

+ (id)metadataCache
{
  if (metadataCache_onceToken != -1) {
    dispatch_once(&metadataCache_onceToken, &__block_literal_global_26098);
  }
  uint64_t v2 = (void *)metadataCache_cache;
  return v2;
}

void __31__HMDHAPMetadata_metadataCache__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = (void *)metadataCache_cache;
  metadataCache_cache = v0;
}

+ (HMDHAPMetadata)metadataWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v14 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F359E8]) initWithDictionary:v5 error:&v14];
  id v7 = v14;
  id v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  if (v6)
  {
    BOOL v9 = [[HMDHAPMetadata alloc] initWithDictionary:v5 hapMetadata:v6 error:a4];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse HAP metadata from %@ - error %@", buf, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (HMDHAPMetadata)metadataWithPath:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [NSURL fileURLWithPath:v6];
  id v8 = [NSDictionary dictionaryWithContentsOfURL:v7 error:a4];
  BOOL v9 = v8;
  if (v8)
  {
    uint64_t v10 = *MEMORY[0x263F35BF0];
    uint64_t v11 = objc_msgSend(v8, "hmf_dictionaryForKey:", *MEMORY[0x263F35BF0]);
    if (v11)
    {
      __int16 v12 = +[HMDHAPMetadata metadataWithDictionary:v11 error:a4];
    }
    else
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = a1;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v18 = 138543618;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find metadata for key: %@", (uint8_t *)&v18, 0x16u);
      }
      __int16 v12 = 0;
    }
  }
  else
  {
    __int16 v12 = 0;
  }

  return (HMDHAPMetadata *)v12;
}

@end