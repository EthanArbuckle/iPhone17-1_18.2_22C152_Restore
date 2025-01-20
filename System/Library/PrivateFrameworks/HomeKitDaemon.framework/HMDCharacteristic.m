@interface HMDCharacteristic
+ (BOOL)supportsSecureCoding;
+ (BOOL)value:(id)a3 differentThan:(id)a4;
+ (NSDictionary)currentTargetStateCharacteristicTypeMap;
+ (id)logCategory;
+ (id)sortComparatorForCharacteristicDictionary;
- (BOOL)broadcastNotificationEnabled;
- (BOOL)deregisterNotificationForClientIdentifier:(id)a3;
- (BOOL)deregisterNotificationIfNotLastForClientIdentifier:(id)a3;
- (BOOL)isClientNotificationEnabled;
- (BOOL)isNonBulletinNotificationEnabled;
- (BOOL)isNonClientNotificationEnabled;
- (BOOL)isNonHomeNotificationsEnabled;
- (BOOL)isNotificationEnabled;
- (BOOL)isNotificationEnabledForClientIdentifier:(id)a3;
- (BOOL)isNotificationEnabledForClientIdentifierPrefix:(id)a3;
- (BOOL)notificationRegisteredWithRemoteGateway;
- (BOOL)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4 changeThreshold:(id)a5 removeLast:(BOOL)a6;
- (BOOL)shouldIgnoreCacheValueForRead;
- (BOOL)shouldUpdateValueFromHAPCharacteristic:(id)a3;
- (BOOL)supportsNotification;
- (BOOL)supportsNotificationContext;
- (BOOL)supportsRead;
- (BOOL)supportsWrite;
- (BOOL)updateWithDictionary:(id)a3;
- (HMDCharacteristic)init;
- (HMDCharacteristic)initWithCharacteristic:(id)a3 service:(id)a4 accessory:(id)a5;
- (HMDCharacteristic)initWithCoder:(id)a3;
- (HMDCharacteristicMetadata)metadata;
- (HMDHAPAccessory)accessory;
- (HMDService)service;
- (NSData)authorizationData;
- (NSData)notificationContext;
- (NSDate)lastKnownValueUpdateTime;
- (NSDate)notificationEnabledTime;
- (NSDictionary)bulletinContext;
- (NSNumber)changeThresholdForEnabledNotifications;
- (NSNumber)changeThresholdForNonHomeClientEnabledNotifications;
- (NSNumber)characteristicInstanceID;
- (NSNumber)instanceID;
- (NSNumber)stateNumber;
- (NSSet)hapCharacteristicTuples;
- (NSSet)notificationRegistrations;
- (NSString)characteristicType;
- (NSString)contextID;
- (NSString)serializedIdentifier;
- (NSString)type;
- (NSUUID)contextSPIUniqueIdentifier;
- (NSUUID)spiClientIdentifier;
- (id)_characteristicDictionaryWithAuthData:(BOOL)a3;
- (id)_initWithCoder:(id)a3;
- (id)attributeDescriptions;
- (id)characteristicForHAPAccessory:(id)a3;
- (id)characteristicTypeDescription;
- (id)clientIdentifiersWithNotificationsEnabled;
- (id)contextDataForWriteRequestWithIdentifier:(id)a3;
- (id)dumpState;
- (id)getCharacteristicDictionary;
- (id)getCharacteristicDictionaryForMigrationFixup;
- (id)hapCharacteristicTupleWithIdentifier:(id)a3 linkType:(int64_t)a4;
- (id)lastKnownValue;
- (id)localClientIdentifiersWithNotificationsEnabled;
- (id)logIdentifier;
- (id)previousValue;
- (id)shortDescription;
- (id)validateValue:(id)a3 outValue:(id *)a4;
- (id)validateValueForNotify:(id)a3 outValue:(id *)a4;
- (id)validateValueForWrite:(id)a3 outValue:(id *)a4;
- (id)value;
- (int64_t)_characteristicPropertiesRelevantForCurrentUser:(int64_t)a3;
- (int64_t)characteristicProperties;
- (void)_encodeWithCoder:(id)a3;
- (void)configureWithCharacteristic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getLastKnownValueUpdateTime:(id *)a3 stateNumber:(id *)a4 notificationContext:(id *)a5;
- (void)setBroadcastNotificationEnabled:(BOOL)a3;
- (void)setCharacteristicInstanceID:(id)a3;
- (void)setCharacteristicProperties:(int64_t)a3;
- (void)setCharacteristicType:(id)a3;
- (void)setHapCharacteristicTuples:(id)a3;
- (void)setLastKnownValue:(id)a3;
- (void)setLastKnownValueUpdateTime:(id)a3;
- (void)setNotificationContext:(id)a3;
- (void)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4;
- (void)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4 changeThreshold:(id)a5;
- (void)setNotificationEnabledTime:(id)a3;
- (void)setNotificationRegisteredWithRemoteGateway:(BOOL)a3;
- (void)setPreviousValue:(id)a3;
- (void)setStateNumber:(id)a3;
- (void)unconfigure;
- (void)unconfigureForServerIdentifier:(id)a3 linkType:(int64_t)a4;
- (void)updateLastKnownValue;
- (void)updateService:(id)a3 accessory:(id)a4;
- (void)updateValue:(id)a3 updatedTime:(id)a4 stateNumber:(id)a5 notificationContext:(id)a6;
@end

@implementation HMDCharacteristic

- (NSDictionary)bulletinContext
{
  v37[12] = *MEMORY[0x263EF8340];
  v3 = [(HMDCharacteristic *)self service];
  v4 = [(HMDCharacteristic *)self accessory];
  v5 = [v4 home];
  v6 = [v3 name];
  v7 = [v4 room];
  v8 = [v7 name];
  v9 = HMDLocalizedStringForKey(@"BULLETIN_ACTION_ROOM_SERVICE");
  v27 = +[HMDServiceNameComponents componentsWithRawServiceName:v6 rawRoomName:v8 localizedFormat:v9];

  v36[0] = @"home";
  v33 = [v5 contextID];
  v37[0] = v33;
  v36[1] = @"accessory";
  v32 = [v4 contextID];
  v37[1] = v32;
  v36[2] = @"service";
  v31 = [v3 contextID];
  v37[2] = v31;
  v36[3] = @"characteristic";
  v30 = [(HMDCharacteristic *)self contextID];
  v37[3] = v30;
  v36[4] = @"serviceType";
  v29 = [v3 type];
  v37[4] = v29;
  v36[5] = @"characteristicType";
  v28 = [(HMDCharacteristic *)self type];
  v37[5] = v28;
  v36[6] = *MEMORY[0x263F0BAC8];
  v26 = [v5 contextSPIUniqueIdentifier];
  v25 = [v26 UUIDString];
  v37[6] = v25;
  v36[7] = *MEMORY[0x263F0BAB8];
  v34 = v4;
  v24 = [v4 contextSPIUniqueIdentifier];
  v23 = [v24 UUIDString];
  v37[7] = v23;
  v36[8] = *MEMORY[0x263F0BAE0];
  v35 = v3;
  v10 = [v3 contextSPIUniqueIdentifier];
  v11 = [v10 UUIDString];
  v37[8] = v11;
  v36[9] = *MEMORY[0x263F0BAC0];
  v12 = [(HMDCharacteristic *)self contextSPIUniqueIdentifier];
  v13 = [v12 UUIDString];
  v37[9] = v13;
  v36[10] = *MEMORY[0x263F0BAD0];
  v14 = [v5 name];
  v37[10] = v14;
  v36[11] = *MEMORY[0x263F0BAD8];
  v15 = [v27 composedName];
  v37[11] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:12];
  v17 = (void *)[v16 mutableCopy];

  v18 = [(HMDCharacteristic *)self stateNumber];

  if (v18)
  {
    v19 = [(HMDCharacteristic *)self stateNumber];
    [v17 setObject:v19 forKeyedSubscript:@"stateNumber"];
  }
  v20 = [(HMDCharacteristic *)self value];
  [v17 setObject:v20 forKeyedSubscript:@"characteristicValue"];

  v21 = [(HMDCharacteristic *)self lastKnownValueUpdateTime];
  [v17 setObject:v21 forKeyedSubscript:@"characteristicValueUpdatedTime"];

  return (NSDictionary *)v17;
}

- (NSUUID)contextSPIUniqueIdentifier
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = +[HMDProcessInfo privateClientIdentifierSalt];
  v4 = (void *)MEMORY[0x263F08C38];
  v5 = [(HMDCharacteristic *)self service];
  v6 = [v5 contextSPIUniqueIdentifier];
  v7 = NSString;
  v8 = [(HMDCharacteristic *)self instanceID];
  v9 = [v7 stringWithFormat:@"%@", v8];
  v13[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v6, v3, v10);

  return (NSUUID *)v11;
}

- (NSString)contextID
{
  v3 = NSString;
  v4 = [(HMDCharacteristic *)self service];
  v5 = [v4 contextID];
  v6 = [(HMDCharacteristic *)self instanceID];
  v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_notificationEnabledTime, 0);
  objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, 0);
  objc_storeStrong(&self->_lastKnownValue, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicTuples, 0);
  objc_storeStrong((id *)&self->_notificationRegistrations, 0);
}

- (void)setCharacteristicProperties:(int64_t)a3
{
  self->_characteristicProperties = a3;
}

- (int64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (void)setCharacteristicInstanceID:(id)a3
{
}

- (NSNumber)characteristicInstanceID
{
  return self->_characteristicInstanceID;
}

- (void)setCharacteristicType:(id)a3
{
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void)setBroadcastNotificationEnabled:(BOOL)a3
{
  self->_broadcastNotificationEnabled = a3;
}

- (BOOL)broadcastNotificationEnabled
{
  return self->_broadcastNotificationEnabled;
}

- (HMDService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (HMDService *)WeakRetained;
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (id)attributeDescriptions
{
  v48[11] = *MEMORY[0x263EF8340];
  v3 = [(HMDCharacteristic *)self accessory];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = NSString;
  v47 = [(HMDCharacteristic *)self type];
  v46 = HAPShortUUIDType();
  v45 = [(HMDCharacteristic *)self characteristicTypeDescription];
  v44 = [v5 stringWithFormat:@"%@/%@", v46, v45];
  v42 = (void *)[v4 initWithName:@"Type Prefix" value:v44];
  v48[0] = v42;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = NSString;
  v43 = v3;
  v41 = [v3 uuid];
  v40 = [v3 uniqueIdentifier];
  v39 = [v7 stringWithFormat:@"%@/%@", v41, v40];
  v38 = (void *)[v6 initWithName:@"Accessory UUID" value:v39];
  v48[1] = v38;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v37 = [(HMDCharacteristic *)self service];
  v36 = [v37 instanceID];
  v35 = (void *)[v8 initWithName:@"Service ID" value:v36];
  v48[2] = v35;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v34 = [(HMDCharacteristic *)self instanceID];
  v33 = (void *)[v9 initWithName:@"Instance ID" value:v34];
  v48[3] = v33;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"0x%tx", -[HMDCharacteristic properties](self, "properties"));
  v31 = (void *)[v10 initWithName:@"Properties" value:v32];
  v48[4] = v31;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCharacteristic *)self broadcastNotificationEnabled];
  v30 = HMFEnabledStatusToString();
  v29 = (void *)[v11 initWithName:@"Broadcast Notifying" value:v30];
  v48[5] = v29;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDCharacteristic *)self lastKnownValue];
  v14 = (void *)[v12 initWithName:@"Last Known Value" value:v13];
  v48[6] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = [(HMDCharacteristic *)self lastKnownValueUpdateTime];
  v17 = (void *)[v15 initWithName:@"Last Known Value Update Time" value:v16];
  v48[7] = v17;
  id v18 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMDCharacteristic *)self previousValue];
  v20 = (void *)[v18 initWithName:@"Previous Value" value:v19];
  v48[8] = v20;
  id v21 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMDCharacteristic *)self stateNumber];
  v23 = (void *)[v21 initWithName:@"State" value:v22];
  v48[9] = v23;
  id v24 = objc_alloc(MEMORY[0x263F424F8]);
  v25 = [(HMDCharacteristic *)self notificationContext];
  v26 = (void *)[v24 initWithName:@"Notification Context" value:v25];
  v48[10] = v26;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:11];

  return v28;
}

- (id)logIdentifier
{
  v3 = NSString;
  id v4 = [(HMDCharacteristic *)self accessory];
  v5 = [v4 uuid];
  id v6 = [(HMDCharacteristic *)self service];
  v7 = [v6 instanceID];
  id v8 = [(HMDCharacteristic *)self type];
  id v9 = HAPShortUUIDType();
  id v10 = [(HMDCharacteristic *)self instanceID];
  id v11 = [v3 stringWithFormat:@"%@/%@/%@/%@", v5, v7, v9, v10];

  return v11;
}

- (void)_encodeWithCoder:(id)a3
{
  id v40 = a3;
  int v4 = objc_msgSend(v40, "hmd_isForXPCTransport");
  int v5 = objc_msgSend(v40, "hmd_isForXPCTransportEntitledForSPIAccess");
  id v6 = +[HMDHAPMetadata getSharedInstance];
  v7 = [(HMDCharacteristic *)self service];
  id v8 = [(HMDCharacteristic *)self accessory];
  id v9 = v8;
  if (objc_msgSend(v40, "hmd_isForXPCTransport"))
  {
    id v9 = accessoryToEncodeForXPCTransportForAccessory(v8);
  }
  [v40 encodeConditionalObject:v9 forKey:@"accessory"];
  [v40 encodeConditionalObject:v7 forKey:@"service"];
  id v10 = [(HMDCharacteristic *)self characteristicInstanceID];
  [v40 encodeObject:v10 forKey:@"characteristicInstanceID"];

  id v11 = [(HMDCharacteristic *)self characteristicType];
  [v40 encodeObject:v11 forKey:@"characteristicType"];

  int64_t v12 = [(HMDCharacteristic *)self characteristicProperties];
  unint64_t v13 = v12;
  if (v4)
  {
    if (v5) {
      unint64_t v14 = v12;
    }
    else {
      unint64_t v14 = v12 & 0x47;
    }
    id v15 = [(HMDCharacteristic *)self characteristicType];
    int v16 = [v6 shouldNotCacheCharacteristicOfType:v15];

    if (v16) {
      unint64_t v13 = v14 & 0xFFFFFFFFFFFFFFF9;
    }
    else {
      unint64_t v13 = v14;
    }
  }
  [v40 encodeInt32:v13 forKey:@"characteristicProperties"];
  if ((objc_msgSend(v40, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    v17 = [(HMDCharacteristic *)self metadata];
    id v18 = [v17 format];
    char v19 = [v18 isEqual:@"unknown"];

    if ((v19 & 1) == 0)
    {
      v20 = [(HMDCharacteristic *)self metadata];
      [v40 encodeObject:v20 forKey:@"characteristicMetadata"];
    }
    int v21 = objc_msgSend(v40, "hmd_isForLocalStore");
    NSUInteger v22 = [(NSData *)self->_authorizationData length];
    char v23 = v22 == 0;
    if (v22 && (v21 & 1) == 0) {
      char v23 = objc_msgSend(v40, "hmd_isForRemoteTransportOnSameAccount") ^ 1;
    }
    if (objc_msgSend(v40, "hmd_isHH2MigrationInProgress") && (v23 & 1) == 0) {
      [v40 encodeObject:self->_authorizationData forKey:@"kCharacteristicAuthorizationDataCodingKey"];
    }
    if (!v21) {
      goto LABEL_30;
    }
    id v24 = [(HMDCharacteristic *)self notificationRegistrations];
    v25 = objc_msgSend(v24, "na_map:", &__block_literal_global_142_111982);

    if ([v25 count]) {
      [v40 encodeObject:v25 forKey:@"characteristicNotificationRegistrations"];
    }
    v26 = [(HMDCharacteristic *)self value];
    if (v13)
    {
      v27 = [(HMDCharacteristic *)self type];
      if (![v6 isStandardCharacteristicType:v27]
        || !v26
        || !isAllowedCharType())
      {
        goto LABEL_28;
      }
      id v28 = [(HMDCharacteristic *)self stateNumber];

      if (v28)
      {
        v29 = [(HMDCharacteristic *)self value];
        [v40 encodeObject:v29 forKey:@"characteristicValue"];

        v27 = [(HMDCharacteristic *)self stateNumber];
        [v40 encodeObject:v27 forKey:@"HM.stateNumber"];
LABEL_28:
      }
    }
    objc_msgSend(v40, "encodeBool:forKey:", -[HMDCharacteristic broadcastNotificationEnabled](self, "broadcastNotificationEnabled"), @"characteristicBroadcastNotificationEnabled");

LABEL_30:
    if (objc_msgSend(v40, "hmd_isForXPCTransport"))
    {
      v30 = +[HMDHAPMetadata getSharedInstance];
      v31 = [(HMDCharacteristic *)self type];
      v32 = [v7 type];
      int v33 = [v30 requiresDeviceUnlock:v31 forService:v32];

      v34 = [(HMDCharacteristic *)self notificationRegistrations];
      BOOL v35 = [v34 count] != 0;

      [v40 encodeBool:v35 forKey:@"characteristicNotificationEnabled"];
      v36 = [(HMDCharacteristic *)self value];
      if (v36
        && isAllowedCharType()
        && ((isAppleTV() & v33) != 1 || objc_msgSend(v40, "hmd_isForXPCTransportEntitledForSPIAccess")))
      {
        [v40 encodeObject:v36 forKey:@"characteristicValue"];
      }
      if (objc_msgSend(v40, "hmd_isForXPCTransportEntitledForSPIAccess"))
      {
        if (v33) {
          [v40 encodeBool:1 forKey:@"HM.requiresDeviceUnlock"];
        }
        v37 = [(HMDCharacteristic *)self authorizationData];
        objc_msgSend(v40, "encodeBool:forKey:", objc_msgSend(v37, "length") != 0, @"HM.characteristicAuthDataPresent");

        v38 = [(HMDCharacteristic *)self lastKnownValueUpdateTime];
        [v40 encodeObject:v38 forKey:@"characteristicValueUpdateTime"];

        v39 = [(HMDCharacteristic *)self notificationEnabledTime];
        [v40 encodeObject:v39 forKey:@"characteristicNotificationEnableTime"];
      }
    }
  }
}

id __38__HMDCharacteristic__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 clientID];
  if ([v3 hasPrefix:@"com.apple.HomeKitDaemon"])
  {

LABEL_4:
    id v6 = 0;
    goto LABEL_6;
  }
  int v4 = [v2 clientID];
  char v5 = [v4 hasPrefix:@"com.apple.HomeKit.client."];

  if (v5) {
    goto LABEL_4;
  }
  id v6 = [v2 clientID];
LABEL_6:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  int v4 = (void *)MEMORY[0x230FBD990]();
  [(HMDCharacteristic *)self _encodeWithCoder:v5];
}

- (id)_initWithCoder:(id)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCharacteristic *)self initWithCharacteristic:0 service:0 accessory:0];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    objc_storeWeak((id *)&v5->_accessory, v6);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
    objc_storeWeak((id *)&v5->_service, v7);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicType"];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v8);
    characteristicType = v5->_characteristicType;
    v5->_characteristicType = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicInstanceID"];
    characteristicInstanceID = v5->_characteristicInstanceID;
    v5->_characteristicInstanceID = (NSNumber *)v11;

    v5->_characteristicProperties = -[HMDCharacteristic _characteristicPropertiesRelevantForCurrentUser:](v5, "_characteristicPropertiesRelevantForCurrentUser:", (int)[v4 decodeInt32ForKey:@"characteristicProperties"]);
    unint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicMetadata"];
    uint64_t v14 = +[HMFObjectCacheHMDCharacteristicMetadata cachedInstanceForCharacteristicMetadata:v13];
    metadata = v5->_metadata;
    v5->_metadata = (HMDCharacteristicMetadata *)v14;

    int v16 = (void *)MEMORY[0x263EFFA08];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    id v18 = [v16 setWithArray:v17];

    char v19 = [v4 decodeObjectOfClasses:v18 forKey:@"characteristicNotificationRegistrations"];
    v20 = v19;
    if (v19)
    {
      int v21 = objc_msgSend(v19, "na_map:", &__block_literal_global_139_111991);
      uint64_t v22 = [v21 mutableCopy];
      notificationRegistrations = v5->_notificationRegistrations;
      v5->_notificationRegistrations = (NSMutableSet *)v22;
    }
    if ([v4 containsValueForKey:@"kCharacteristicAuthorizationDataCodingKey"])
    {
      int v24 = objc_msgSend(v4, "hmd_isHH2MigrationInProgress");
      if (v24)
      {
        v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCharacteristicAuthorizationDataCodingKey"];
      }
      else
      {
        v25 = 0;
      }
      objc_storeStrong((id *)&v5->_authorizationData, v25);
      if (v24) {
    }
      }
    if ([v4 containsValueForKey:@"characteristicValue"])
    {
      v26 = allowedCharValueTypes();
      uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"characteristicValue"];
      id lastKnownValue = v5->_lastKnownValue;
      v5->_id lastKnownValue = (id)v27;

      objc_storeStrong(&v5->_previousValue, v5->_lastKnownValue);
    }
    if ([v4 containsValueForKey:@"HM.stateNumber"]
      && (v5->_characteristicProperties & 1) != 0)
    {
      uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.stateNumber"];
      stateNumber = v5->_stateNumber;
      v5->_stateNumber = (NSNumber *)v29;
    }
    if ([v4 containsValueForKey:@"characteristicBroadcastNotificationEnabled"]) {
      v5->_broadcastNotificationEnabled = [v4 decodeBoolForKey:@"characteristicBroadcastNotificationEnabled"];
    }
  }
  return v5;
}

HMDCharacteristicThresholdRegistration *__36__HMDCharacteristic__initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  if (v4) {
    id v5 = [[HMDCharacteristicThresholdRegistration alloc] initWithClientID:v4 updateThreshold:0];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (HMDCharacteristic)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = (HMDCharacteristic *)[(HMDCharacteristic *)self _initWithCoder:v4];

  return v6;
}

- (id)contextDataForWriteRequestWithIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDCharacteristic *)self supportsNotificationContext])
  {
    id v5 = objc_alloc(MEMORY[0x263F358D8]);
    id v6 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v4];
    v7 = (void *)[v5 initWithContextIdentifier:v6];

    id v18 = 0;
    id v8 = [v7 serializeWithError:&v18];
    id v9 = v18;
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    int64_t v12 = HMFGetOSLogHandle();
    unint64_t v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v20 = v14;
        __int16 v21 = 2112;
        uint64_t v22 = v7;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode context data:%@ with error:%@ identifier:%@", buf, 0x2Au);
      }
      id v15 = 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        __int16 v21 = 2112;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Context data:%@ for write request with identifier:%@", buf, 0x20u);
      }
      id v15 = v8;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)supportsNotificationContext
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((self->_characteristicProperties & 0x100) != 0)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      unint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Notification context is supported for characteristic:%@", (uint8_t *)&v12, 0x16u);
    }
    return 1;
  }
  else
  {
    v3 = [(HMDCharacteristic *)self type];
    int v4 = [v3 isEqualToString:*MEMORY[0x263F355B0]];

    if (v4)
    {
      id v5 = [(HMDCharacteristic *)self service];
      id v6 = [v5 findCharacteristicWithType:*MEMORY[0x263F35488]];

      LOBYTE(v5) = [v6 supportsNotificationContext];
      return (char)v5;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)shouldIgnoreCacheValueForRead
{
  v3 = [(HMDCharacteristic *)self type];
  if (([v3 isEqualToString:@"00000143-0000-1000-8000-0026BB765291"] & 1) != 0
    || ([v3 isEqualToString:@"00000144-0000-1000-8000-0026BB765291"] & 1) != 0
    || ([v3 isEqualToString:@"0000024B-0000-1000-8000-0026BB765291"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    id v6 = [(id)objc_opt_class() currentTargetStateCharacteristicTypeMap];
    v7 = [v6 objectForKey:v3];

    if (v7)
    {
      id v8 = [(HMDCharacteristic *)self service];
      id v9 = [v8 findCharacteristicWithType:v7];

      if (v9
        && ([v9 lastKnownValue],
            id v10 = objc_claimAutoreleasedReturnValue(),
            [(HMDCharacteristic *)self value],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = HMFEqualObjects(),
            v11,
            v10,
            (v12 & 1) == 0))
      {
        unint64_t v13 = [MEMORY[0x263EFF910] date];
        __int16 v14 = [(HMDCharacteristic *)self lastKnownValueUpdateTime];
        [v13 timeIntervalSinceDate:v14];
        unint64_t v16 = (unint64_t)v15;

        if (v16 <= 0xF) {
          char v4 = 0;
        }
        else {
          char v4 = -1;
        }
      }
      else
      {
        char v4 = 0;
      }
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4 & 1;
}

- (void)updateService:(id)a3 accessory:(id)a4
{
  p_accessory = &self->_accessory;
  id obj = a3;
  objc_storeWeak((id *)p_accessory, a4);
  objc_storeWeak((id *)&self->_service, obj);
}

- (BOOL)deregisterNotificationForClientIdentifier:(id)a3
{
  [(HMDCharacteristic *)self setNotificationEnabled:0 forClientIdentifier:a3];
  char v4 = [(HMDCharacteristic *)self notificationRegistrations];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (BOOL)deregisterNotificationIfNotLastForClientIdentifier:(id)a3
{
  return [(HMDCharacteristic *)self setNotificationEnabled:0 forClientIdentifier:a3 changeThreshold:0 removeLast:0];
}

- (void)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4 changeThreshold:(id)a5
{
}

- (void)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4
{
}

- (BOOL)setNotificationEnabled:(BOOL)a3 forClientIdentifier:(id)a4 changeThreshold:(id)a5 removeLast:(BOOL)a6
{
  BOOL v8 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    char v12 = [[HMDCharacteristicThresholdRegistration alloc] initWithClientID:v10 updateThreshold:v11];
    p_lock = &self->_lock;
    uint64_t v14 = os_unfair_lock_lock_with_options();
    if (v8)
    {
      double v15 = (void *)MEMORY[0x230FBD990](v14);
      unint64_t v16 = self;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        [v11 floatValue];
        *(_DWORD *)buf = 138543874;
        id v30 = v18;
        __int16 v31 = 2112;
        id v32 = v10;
        __int16 v33 = 2048;
        double v34 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Adding notification registration for client identifier: %@ threshold : %f", buf, 0x20u);
      }
      [(NSMutableSet *)v16->_notificationRegistrations addObject:v12];
      BOOL v20 = 0;
      goto LABEL_16;
    }
    if ([(NSMutableSet *)self->_notificationRegistrations count] == 1)
    {
      int v21 = [(NSMutableSet *)self->_notificationRegistrations containsObject:v12];
      BOOL v20 = v21;
      if (!a6 && v21 == 1)
      {
LABEL_16:
        os_unfair_lock_unlock(p_lock);

        goto LABEL_17;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
    context = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    HMFGetOSLogHandle();
    __int16 v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Removing notification registration for client identifier: %@", buf, 0x16u);
    }
    [(NSMutableSet *)self->_notificationRegistrations removeObject:v12];
    if (![(NSMutableSet *)self->_notificationRegistrations count])
    {
      uint64_t v25 = [MEMORY[0x263EFF910] distantFuture];
      notificationEnabledTime = v22->_notificationEnabledTime;
      v22->_notificationEnabledTime = (NSDate *)v25;
    }
    goto LABEL_16;
  }
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (NSNumber)changeThresholdForNonHomeClientEnabledNotifications
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [v8 clientID];
        char v10 = [v9 isEqual:@"com.apple.HomeKitDaemon.homeNotifications"];

        if ((v10 & 1) == 0)
        {
          id v11 = [v8 updateThreshold];

          if (!v11)
          {

            goto LABEL_16;
          }
          uint64_t v12 = [v8 updateThreshold];
          unint64_t v13 = (void *)v12;
          if (v5)
          {
            uint64_t v14 = [v5 compare:v12];

            if (v14 == 1)
            {
              uint64_t v15 = [v8 updateThreshold];

              BOOL v5 = (void *)v15;
            }
          }
          else
          {
            BOOL v5 = (void *)v12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_16:
    BOOL v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)changeThresholdForEnabledNotifications
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 updateThreshold];

        if (!v9)
        {

          goto LABEL_15;
        }
        uint64_t v10 = [v8 updateThreshold];
        id v11 = (void *)v10;
        if (v5)
        {
          uint64_t v12 = [v5 compare:v10];

          if (v12 == 1)
          {
            uint64_t v13 = [v8 updateThreshold];

            BOOL v5 = (void *)v13;
          }
        }
        else
        {
          BOOL v5 = (void *)v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_15:
    BOOL v5 = 0;
  }

  return (NSNumber *)v5;
}

- (void)setNotificationEnabledTime:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [MEMORY[0x263EFF910] distantFuture];
  p_notificationEnabledTime = &self->_notificationEnabledTime;
  if ([(NSDate *)*p_notificationEnabledTime isEqualToDate:v6]
    || [v8 isEqualToDate:v6])
  {
    objc_storeStrong((id *)p_notificationEnabledTime, a3);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSDate)notificationEnabledTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_notificationEnabledTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isNotificationEnabledForClientIdentifierPrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDCharacteristic *)self notificationRegistrations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__HMDCharacteristic_isNotificationEnabledForClientIdentifierPrefix___block_invoke;
  v9[3] = &unk_264A1ED78;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __68__HMDCharacteristic_isNotificationEnabledForClientIdentifierPrefix___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 clientID];
  uint64_t v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

- (id)clientIdentifiersWithNotificationsEnabled
{
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_131_112006);
  uint64_t v4 = [v3 allObjects];

  return v4;
}

uint64_t __62__HMDCharacteristic_clientIdentifiersWithNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  return [a2 clientID];
}

- (id)localClientIdentifiersWithNotificationsEnabled
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v4 = [(HMDCharacteristic *)self notificationRegistrations];
  BOOL v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(HMDCharacteristic *)self notificationRegistrations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__HMDCharacteristic_localClientIdentifiersWithNotificationsEnabled__block_invoke;
  v9[3] = &unk_264A1EDA0;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  return v7;
}

void __67__HMDCharacteristic_localClientIdentifiersWithNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 clientID];
  int v4 = [v3 hasPrefix:@"com.apple.HomeKitDaemon.Local"];

  if (v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = [v7 clientID];
    [v5 addObject:v6];
  }
}

- (BOOL)isNotificationEnabledForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(HMDCharacteristic *)self notificationRegistrations];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__HMDCharacteristic_isNotificationEnabledForClientIdentifier___block_invoke;
    v8[3] = &unk_264A1ED78;
    id v9 = v4;
    char v6 = objc_msgSend(v5, "na_any:", v8);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __62__HMDCharacteristic_isNotificationEnabledForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 clientID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isNonClientNotificationEnabled
{
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_126);

  return v3;
}

uint64_t __51__HMDCharacteristic_isNonClientNotificationEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 clientID];
  uint64_t v3 = [v2 hasPrefix:@"com.apple.HomeKit.client."] ^ 1;

  return v3;
}

- (BOOL)isNonBulletinNotificationEnabled
{
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_124_112010);

  return v3;
}

uint64_t __53__HMDCharacteristic_isNonBulletinNotificationEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 clientID];
  if ([v3 isEqual:@"com.apple.HomeKitDaemon.bulletinNotificationManager"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    BOOL v5 = [v2 clientID];
    uint64_t v4 = [v5 isEqual:@"com.apple.HomeKitDaemon.bulletinBoard"] ^ 1;
  }
  return v4;
}

- (BOOL)isNonHomeNotificationsEnabled
{
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_122);

  return v3;
}

uint64_t __50__HMDCharacteristic_isNonHomeNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 clientID];
  if ([v3 hasPrefix:@"com.apple.HomeKitDaemon"])
  {
    uint64_t v4 = [v2 clientID];
    uint64_t v5 = [v4 isEqual:@"com.apple.HomeKitDaemon.homeNotifications"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isClientNotificationEnabled
{
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_120_112012);

  return v3;
}

uint64_t __48__HMDCharacteristic_isClientNotificationEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 clientID];
  uint64_t v3 = [v2 hasPrefix:@"com.apple.HomeKit.client."];

  return v3;
}

- (BOOL)isNotificationEnabled
{
  id v2 = [(HMDCharacteristic *)self notificationRegistrations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)supportsWrite
{
  return (LOBYTE(self->_characteristicProperties) >> 2) & 1;
}

- (BOOL)supportsRead
{
  return (LOBYTE(self->_characteristicProperties) >> 1) & 1;
}

- (BOOL)supportsNotification
{
  return self->_characteristicProperties & 1;
}

- (id)validateValue:(id)a3 outValue:(id *)a4
{
  id v6 = a3;
  if (isAllowedCharType())
  {
    id v7 = [(HMDCharacteristic *)self hapCharacteristicTuples];
    id v8 = [v7 anyObject];

    if (v8)
    {
      id v9 = [v8 hapCharacteristic];
      id v10 = [v9 validateValue:v6 outValue:a4];

      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
  }

  return v11;
}

- (id)validateValueForNotify:(id)a3 outValue:(id *)a4
{
  id v6 = a3;
  if ([(HMDCharacteristic *)self characteristicProperties]) {
    [(HMDCharacteristic *)self validateValue:v6 outValue:a4];
  }
  else {
  id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:7];
  }

  return v7;
}

- (id)validateValueForWrite:(id)a3 outValue:(id *)a4
{
  id v6 = a3;
  if (([(HMDCharacteristic *)self characteristicProperties] & 4) != 0) {
    [(HMDCharacteristic *)self validateValue:v6 outValue:a4];
  }
  else {
  id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:5];
  }

  return v7;
}

- (id)getCharacteristicDictionaryForMigrationFixup
{
  return [(HMDCharacteristic *)self _characteristicDictionaryWithAuthData:1];
}

- (NSData)authorizationData
{
  BOOL v3 = [(HMDCharacteristic *)self accessory];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 home];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 currentUser];
      if ([v7 isOwner])
      {
        id v8 = [v7 ownerCharacteristicAuthorizationData];
        id v9 = [v4 uuid];
        id v10 = [v8 objectForKeyedSubscript:v9];
        id v11 = [(HMDCharacteristic *)self instanceID];
        [v10 objectForKeyedSubscript:v11];
      }
      else
      {
        uint64_t v13 = [v6 homeManager];
        id v8 = [v13 sharedUserPrivateSettingsManager];

        id v9 = [(HMDCharacteristic *)self instanceID];
        id v10 = [v4 uuid];
        id v11 = [v6 uuid];
        [v8 authorizationDataForCharacteristicWithInstanceID:v9 accessoryUUID:v10 homeModelID:v11];
      uint64_t v12 = };
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (NSData *)v12;
}

- (void)setStateNumber:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    char v6 = [(HMDCharacteristic *)self properties];
    id v5 = v7;
    if (v6)
    {
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&self->_stateNumber, a3);
      os_unfair_lock_unlock(&self->_lock);
      id v5 = v7;
    }
  }
}

- (NSNumber)stateNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)shouldUpdateValueFromHAPCharacteristic:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = self->_lastKnownValue;
  char v6 = self->_lastKnownValueUpdateTime;
  os_unfair_lock_unlock(&self->_lock);
  id v7 = +[HMDHAPMetadata getSharedInstance];
  id v8 = [v4 value];
  BOOL v9 = +[HMDCharacteristic value:v8 differentThan:v5];

  id v10 = [v4 valueUpdatedTime];
  uint64_t v11 = [(NSDate *)v6 compare:v10];

  if (v11 == -1)
  {
    if (v9)
    {
      long long v16 = (void *)MEMORY[0x230FBD990]();
      int v21 = self;
      long long v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = HMFGetLogIdentifier();
        int v27 = 138543362;
        id v28 = v19;
        uint64_t v20 = "%{public}@Declaring the value as different because update time is earlier than hap update time";
        goto LABEL_12;
      }
LABEL_13:

      BOOL v22 = 1;
      goto LABEL_14;
    }
    __int16 v23 = [(HMDCharacteristic *)self type];
    int v24 = [v7 shouldNotCacheCharacteristicOfType:v23];

    if (v24)
    {
      long long v16 = (void *)MEMORY[0x230FBD990]();
      uint64_t v25 = self;
      long long v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = HMFGetLogIdentifier();
        int v27 = 138543362;
        id v28 = v19;
        uint64_t v20 = "%{public}@Declaring the value as different because characteristic generates notification on configuration";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  uint64_t v12 = [(HMDCharacteristic *)self type];
  uint64_t v13 = [(HMDCharacteristic *)self service];
  uint64_t v14 = [v13 type];
  int v15 = [v7 generateNotificationOnConfigurationForCharacteristicType:v12 serviceType:v14];

  if (v15)
  {
    long long v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v19;
      uint64_t v20 = "%{public}@Declaring the value as different because Characteristic does not support caching";
LABEL_12:
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  BOOL v22 = 0;
LABEL_14:

  return v22;
}

- (void)updateLastKnownValue
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = self->_hapCharacteristicTuples;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        lastKnownValueUpdateTime = self->_lastKnownValueUpdateTime;
        BOOL v9 = [v7 hapCharacteristic];
        id v10 = [v9 valueUpdatedTime];
        LODWORD(lastKnownValueUpdateTime) = [(NSDate *)lastKnownValueUpdateTime compare:v10] == NSOrderedAscending;

        if (lastKnownValueUpdateTime)
        {
          objc_storeStrong(&self->_previousValue, self->_lastKnownValue);
          uint64_t v11 = [v7 hapCharacteristic];
          uint64_t v12 = [v11 value];
          id lastKnownValue = self->_lastKnownValue;
          self->_id lastKnownValue = v12;

          uint64_t v14 = [v7 hapCharacteristic];
          int v15 = [v14 valueUpdatedTime];
          long long v16 = self->_lastKnownValueUpdateTime;
          self->_lastKnownValueUpdateTime = v15;

          long long v17 = [v7 hapCharacteristic];
          long long v18 = [v17 notificationContext];
          notificationContext = self->_notificationContext;
          self->_notificationContext = v18;
        }
      }
      uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock(lock);
}

- (void)getLastKnownValueUpdateTime:(id *)a3 stateNumber:(id *)a4 notificationContext:(id *)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (a3) {
    *a3 = self->_lastKnownValueUpdateTime;
  }
  if (a4) {
    *a4 = self->_stateNumber;
  }
  if (a5) {
    *a5 = self->_notificationContext;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateValue:(id)a3 updatedTime:(id)a4 stateNumber:(id)a5 notificationContext:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id obj = a3;
  id v10 = a3;
  id v11 = a4;
  id v35 = a5;
  id v12 = a5;
  id v36 = a6;
  id v13 = a6;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  location = (id *)&self->_stateNumber;
  v42 = v12;
  int v14 = [(NSNumber *)self->_stateNumber isEqual:v12] ^ 1;
  if (!v11) {
    LOBYTE(v14) = 1;
  }
  BOOL v15 = (v14 & 1) == 0
     && -[NSDate compare:](self->_lastKnownValueUpdateTime, "compare:", v11, v35, a6, obj, lock) == NSOrderedDescending;
  if (v42)
  {
    int v16 = HAPCompareStateNumberWithRollover() == 1 || v15;
    if (v16 == 1)
    {
      long long v17 = (void *)MEMORY[0x230FBD990]();
      long long v18 = self;
      HMFGetOSLogHandle();
      long long v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id obja = v17;
        HMFGetLogIdentifier();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id lastKnownValue = v18->_lastKnownValue;
        locationa = (id *)*location;
        lastKnownValueUpdateTime = v18->_lastKnownValueUpdateTime;
        id WeakRetained = objc_loadWeakRetained((id *)&v18->_accessory);
        long long v24 = [WeakRetained identifier];
        *(_DWORD *)buf = 138545154;
        id v49 = v20;
        __int16 v50 = 2112;
        id v51 = v10;
        __int16 v52 = 2112;
        v53 = v42;
        __int16 v54 = 2112;
        id v55 = v11;
        __int16 v56 = 2112;
        id v57 = lastKnownValue;
        __int16 v58 = 2112;
        v59 = locationa;
        __int16 v60 = 2112;
        v61 = lastKnownValueUpdateTime;
        __int16 v62 = 2112;
        v63 = v24;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring stale characteristic update value: %@, state number: %@, updated time: %@ Current value: %@ state number: %@, updated time: %@, accessory: %@", buf, 0x52u);

        long long v17 = obja;
      }

      goto LABEL_34;
    }
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v25 = self->_hapCharacteristicTuples;
  uint64_t v26 = [(NSSet *)v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v30 = objc_msgSend(v29, "hapCharacteristic", v35);
        [v30 setValue:v10];

        __int16 v31 = [v29 hapCharacteristic];
        [v31 setNotificationContext:v13];
      }
      uint64_t v26 = [(NSSet *)v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v26);
  }

  if (v11
    && [(NSDate *)self->_lastKnownValueUpdateTime compare:v11] == NSOrderedSame
    && [self->_lastKnownValue isEqual:v10])
  {
    objc_storeStrong(&self->_lastKnownValue, obj);
  }
  else
  {
    objc_storeStrong(&self->_previousValue, self->_lastKnownValue);
    objc_storeStrong(&self->_lastKnownValue, obj);
    if (!v11)
    {
      if (v10) {
        [MEMORY[0x263EFF910] date];
      }
      else {
      double v34 = [MEMORY[0x263EFF910] distantPast];
      }
      objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, v34);
      __int16 v33 = v34;
      goto LABEL_31;
    }
  }
  id v32 = (NSDate *)v11;
  __int16 v33 = self->_lastKnownValueUpdateTime;
  self->_lastKnownValueUpdateTime = v32;
LABEL_31:

  if (v42) {
    objc_storeStrong(location, v35);
  }
  objc_storeStrong((id *)&self->_notificationContext, v36);
LABEL_34:
  os_unfair_lock_unlock(lock);
}

- (id)value
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v3 = [MEMORY[0x263EFF910] distantPast];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = self->_hapCharacteristicTuples;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v5)
  {

LABEL_15:
    id v22 = self->_lastKnownValue;
    goto LABEL_16;
  }
  char v6 = 0;
  uint64_t v7 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = [*(id *)(*((void *)&v25 + 1) + 8 * i) hapCharacteristic];
      id v10 = [v9 valueUpdatedTime];
      BOOL v11 = [v3 compare:v10] == -1;

      if (v11)
      {
        id v12 = v9;

        uint64_t v13 = [v12 valueUpdatedTime];

        BOOL v3 = (void *)v13;
        char v6 = v12;
      }
    }
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_15;
  }
  id lastKnownValue = self->_lastKnownValue;
  BOOL v15 = [v6 value];
  BOOL v16 = +[HMDCharacteristic value:lastKnownValue differentThan:v15];

  if (v16) {
    objc_storeStrong(&self->_previousValue, self->_lastKnownValue);
  }
  long long v17 = [v6 value];
  id v18 = self->_lastKnownValue;
  self->_id lastKnownValue = v17;

  objc_storeStrong((id *)&self->_lastKnownValueUpdateTime, v3);
  long long v19 = [v6 notificationContext];
  notificationContext = self->_notificationContext;
  self->_notificationContext = v19;

  long long v21 = [v6 value];
  id v22 = (id)[v21 copy];

LABEL_16:
  os_unfair_lock_unlock(lock);
  return v22;
}

- (int64_t)_characteristicPropertiesRelevantForCurrentUser:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  uint64_t v5 = [WeakRetained home];
  char v6 = [v5 currentUser];
  int v7 = [v6 isRestrictedGuest];

  if (v7) {
    return a3 & 0xFFFFFFFFFFFFFFEFLL;
  }
  else {
    return a3;
  }
}

- (id)characteristicForHAPAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 server];
  char v6 = [v5 identifier];
  uint64_t v7 = [v4 linkType];

  id v8 = [(HMDCharacteristic *)self hapCharacteristicTupleWithIdentifier:v6 linkType:v7];

  BOOL v9 = [v8 hapCharacteristic];

  return v9;
}

- (NSNumber)instanceID
{
  id v2 = [(HMDCharacteristic *)self characteristicInstanceID];
  BOOL v3 = (void *)[v2 copy];

  return (NSNumber *)v3;
}

- (NSString)type
{
  id v2 = [(HMDCharacteristic *)self characteristicType];
  BOOL v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)unconfigureForServerIdentifier:(id)a3 linkType:(int64_t)a4
{
  id v9 = [(HMDCharacteristic *)self hapCharacteristicTupleWithIdentifier:a3 linkType:a4];
  if (v9)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF9C0];
    char v6 = [(HMDCharacteristic *)self hapCharacteristicTuples];
    uint64_t v7 = [v5 setWithSet:v6];

    [v7 removeObject:v9];
    id v8 = [MEMORY[0x263EFFA08] setWithSet:v7];
    [(HMDCharacteristic *)self setHapCharacteristicTuples:v8];
  }
}

- (void)unconfigure
{
  BOOL v3 = [(HMDCharacteristic *)self hapCharacteristicTuples];
  id v8 = [v3 anyObject];

  if (v8)
  {
    id v4 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v5 = [(HMDCharacteristic *)self hapCharacteristicTuples];
    char v6 = [v4 setWithSet:v5];

    [v6 removeObject:v8];
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithSet:v6];
    [(HMDCharacteristic *)self setHapCharacteristicTuples:v7];
  }
}

- (void)configureWithCharacteristic:(id)a3
{
  id v21 = a3;
  id v4 = [v21 service];
  uint64_t v5 = [v4 accessory];

  char v6 = [v21 value];

  if (v6)
  {
    uint64_t v7 = [(HMDCharacteristic *)self lastKnownValue];
    [(HMDCharacteristic *)self setPreviousValue:v7];

    id v8 = [v21 value];
    [(HMDCharacteristic *)self setLastKnownValue:v8];

    id v9 = [v21 valueUpdatedTime];
    [(HMDCharacteristic *)self setLastKnownValueUpdateTime:v9];

    id v10 = [v21 notificationContext];
    [(HMDCharacteristic *)self setNotificationContext:v10];
  }
  uint64_t v11 = [v5 linkType];
  if (v11 == 1)
  {
    stateNumber = self->_stateNumber;
    self->_stateNumber = 0;
  }
  uint64_t v13 = [v5 server];
  int v14 = [v13 identifier];

  BOOL v15 = [(HMDCharacteristic *)self hapCharacteristicTupleWithIdentifier:v14 linkType:v11];
  BOOL v16 = (void *)MEMORY[0x263EFF9C0];
  long long v17 = [(HMDCharacteristic *)self hapCharacteristicTuples];
  id v18 = [v16 setWithSet:v17];

  if (v15) {
    [v18 removeObject:v15];
  }
  long long v19 = [[HAPCharacteristicTuple alloc] initWithHAPCharacteristic:v21 serverIdentifier:v14 linkType:v11];
  [v18 addObject:v19];
  id v20 = [MEMORY[0x263EFFA08] setWithSet:v18];
  [(HMDCharacteristic *)self setHapCharacteristicTuples:v20];
}

- (id)_characteristicDictionaryWithAuthData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  [v5 setObject:self->_characteristicInstanceID forKeyedSubscript:@"characteristicInstanceID"];
  [v5 setObject:self->_characteristicType forKeyedSubscript:@"characteristicType"];
  char v6 = [NSNumber numberWithInteger:self->_characteristicProperties];
  [v5 setObject:v6 forKeyedSubscript:@"characteristicProperties"];

  uint64_t v7 = [(HMDCharacteristic *)self metadata];
  id v8 = [v7 dictionaryRepresentation];
  [v5 setObject:v8 forKeyedSubscript:@"characteristicMetadata"];

  if (v3) {
    authorizationData = self->_authorizationData;
  }
  else {
    authorizationData = 0;
  }
  [v5 setObject:authorizationData forKeyedSubscript:@"kCharacteristicAuthorizationDataCodingKey"];
  return v5;
}

- (id)getCharacteristicDictionary
{
  return [(HMDCharacteristic *)self _characteristicDictionaryWithAuthData:0];
}

- (BOOL)updateWithDictionary:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [v4 objectForKeyedSubscript:@"characteristicInstanceID"];
  char v6 = v5;
  if (v5 && ([v5 isEqual:self->_characteristicInstanceID] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_characteristicInstanceID, v6);
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = [v4 objectForKeyedSubscript:@"characteristicType"];
  id v9 = v8;
  if (v8 && ([v8 isEqual:self->_characteristicType] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v9);
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    characteristicType = self->_characteristicType;
    self->_characteristicType = v10;

    BOOL v7 = 1;
  }
  id v12 = [v4 objectForKeyedSubscript:@"characteristicProperties"];
  uint64_t v13 = [v12 integerValue];

  int64_t characteristicProperties = self->_characteristicProperties;
  BOOL v15 = [(HMDCharacteristic *)self accessory];
  BOOL v16 = [v15 findServiceWithServiceType:@"00000701-0000-1000-8000-0026BB765291"];
  int64_t v17 = characteristicProperties & 0x100 | v13;

  if (v16) {
    v17 |= self->_characteristicProperties & 0x80;
  }
  int64_t v18 = [(HMDCharacteristic *)self _characteristicPropertiesRelevantForCurrentUser:v17];
  if (v18 && v18 != self->_characteristicProperties)
  {
    self->_int64_t characteristicProperties = v18;
    BOOL v7 = 1;
  }
  long long v19 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"characteristicMetadata");
  if (v19)
  {
    id v20 = +[HMDCharacteristicMetadata characteristicMetadataWithDictionary:v19];
    if (v20 && ![(HMDCharacteristicMetadata *)self->_metadata isEqual:v20])
    {
      id v21 = +[HMFObjectCacheHMDCharacteristicMetadata cachedInstanceForCharacteristicMetadata:v20];
      metadata = self->_metadata;
      self->_metadata = v21;

      BOOL v7 = 1;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v7;
}

- (id)hapCharacteristicTupleWithIdentifier:(id)a3 linkType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v7 = [(HMDCharacteristic *)self hapCharacteristicTuples];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 linkType] == a4)
        {
          uint64_t v13 = [v12 serverIdentifier];
          char v14 = [v6 isEqualToString:v13];

          if (v14)
          {
            id v15 = v12;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

- (NSString)serializedIdentifier
{
  BOOL v3 = [(HMDCharacteristic *)self service];
  id v4 = [v3 accessory];
  uint64_t v5 = NSString;
  id v6 = [v4 serializedIdentifier];
  BOOL v7 = [v3 instanceID];
  uint64_t v8 = [(HMDCharacteristic *)self instanceID];
  uint64_t v9 = [v5 stringWithFormat:@"%@/%@/%@", v6, v7, v8];

  return (NSString *)v9;
}

- (id)dumpState
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  id v4 = [MEMORY[0x263F089D8] string];
  int64_t v5 = [(HMDCharacteristic *)self characteristicProperties];
  int64_t v6 = v5;
  if ((v5 & 6) == 6)
  {
    BOOL v7 = @"RW";
LABEL_7:
    [v4 appendString:v7];
    goto LABEL_8;
  }
  if ((v5 & 2) != 0) {
    BOOL v7 = @"RO";
  }
  else {
    BOOL v7 = @"WO";
  }
  if ((v5 & 6) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  if ((v6 & 0x40) != 0)
  {
    [v4 appendString:@"H"];
    if ((v6 & 1) == 0)
    {
LABEL_10:
      if ((v6 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_23;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_10;
  }
  [v4 appendString:@"+E"];
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_23:
  [v4 appendString:@"+B"];
  if ((v6 & 0x100) != 0) {
LABEL_12:
  }
    [v4 appendString:@"+NC"];
LABEL_13:
  uint64_t v8 = +[HMDHAPMetadata getSharedInstance];
  uint64_t v9 = [(HMDCharacteristic *)self type];
  uint64_t v10 = [(HMDCharacteristic *)self service];
  uint64_t v11 = [v10 type];
  int v12 = [v8 requiresDeviceUnlock:v9 forService:v11];

  if (v12) {
    [v4 appendString:@"+L"];
  }
  uint64_t v13 = [MEMORY[0x263F089D8] string];
  if ([(HMDCharacteristic *)self isNotificationEnabled])
  {
    char v14 = [(HMDCharacteristic *)self notificationEnabledTime];
    id v15 = objc_msgSend(v14, "hmf_localTimeDescription");
    [v13 appendFormat:@"YES(%@)", v15];

    if ([(HMDCharacteristic *)self notificationRegisteredWithRemoteGateway]) {
      [v13 appendFormat:@"+RGW"];
    }
    if ([(HMDCharacteristic *)self broadcastNotificationEnabled]) {
      [v13 appendFormat:@"+B"];
    }
    BOOL v16 = [(HMDCharacteristic *)self notificationRegistrations];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __30__HMDCharacteristic_dumpState__block_invoke;
    v36[3] = &unk_264A1ED30;
    id v37 = v13;
    objc_msgSend(v16, "na_each:", v36);
  }
  else
  {
    [v13 appendString:@"NO"];
  }
  long long v17 = [(HMDCharacteristic *)self value];

  unint64_t v18 = 0x263F08000uLL;
  if (v17)
  {
    long long v19 = NSString;
    long long v20 = [(HMDCharacteristic *)self value];
    id v21 = [(HMDCharacteristic *)self lastKnownValueUpdateTime];
    objc_msgSend(v21, "hmf_localTimeDescription");
    int64_t v35 = v6;
    uint64_t v22 = v13;
    long long v23 = v8;
    long long v24 = v4;
    v26 = long long v25 = v3;
    long long v27 = [(HMDCharacteristic *)self previousValue];
    long long v28 = [v19 stringWithFormat:@"%@(%@), previousValue: %@", v20, v26, v27];

    BOOL v3 = v25;
    id v4 = v24;
    uint64_t v8 = v23;
    uint64_t v13 = v22;
    int64_t v6 = v35;

    unint64_t v18 = 0x263F08000;
  }
  else
  {
    long long v28 = @"<nil>";
  }
  uint64_t v29 = *(void **)(v18 + 2880);
  uint64_t v30 = [(HMDCharacteristic *)self shortDescription];
  __int16 v31 = [v29 stringWithFormat:@"%@, properties: %@ (0x%tx), value: %@, notification: %@", v30, v4, v6, v28, v13];
  [v3 setObject:v31 forKeyedSubscript:*MEMORY[0x263F41FA8]];

  id v32 = [(HMDCharacteristic *)self metadata];
  __int16 v33 = [v32 dumpState];
  [v3 setObject:v33 forKeyedSubscript:*MEMORY[0x263F41F40]];

  return v3;
}

void __30__HMDCharacteristic_dumpState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 clientID];
  [v2 appendFormat:@"\n\t%@", v3];
}

- (NSUUID)spiClientIdentifier
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDCharacteristic *)self service];
  id v4 = [v3 spiClientIdentifier];
  int64_t v5 = NSString;
  int64_t v6 = [(HMDCharacteristic *)self instanceID];
  BOOL v7 = [v5 stringWithFormat:@"%@", v6];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  uint64_t v9 = spiClientIdentifierForUUIDAndSalts(v4, v8);

  return (NSUUID *)v9;
}

- (id)characteristicTypeDescription
{
  id v2 = [(HMDCharacteristic *)self characteristicType];
  id v3 = localizationKeyForCharacteristicType();
  id v4 = HMDLocalizedStringForKey(v3);

  return v4;
}

- (NSSet)notificationRegistrations
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableSet *)self->_notificationRegistrations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (id)shortDescription
{
  id v3 = [(HMDCharacteristic *)self service];
  id v4 = NSString;
  int64_t v5 = [(HMDCharacteristic *)self characteristicType];
  int64_t v6 = HAPShortUUIDType();
  BOOL v7 = [(HMDCharacteristic *)self characteristicTypeDescription];
  uint64_t v8 = [v3 instanceID];
  uint64_t v9 = [(HMDCharacteristic *)self instanceID];
  uint64_t v10 = [v4 stringWithFormat:@"Type Prefix: %@/%@, SRV_IID: %@, CHAR_IID: %@", v6, v7, v8, v9];

  return v10;
}

- (void)setNotificationContext:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)notificationContext
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_notificationContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastKnownValueUpdateTime:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  lastKnownValueUpdateTime = self->_lastKnownValueUpdateTime;
  self->_lastKnownValueUpdateTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)lastKnownValueUpdateTime
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lastKnownValueUpdateTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastKnownValue:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id lastKnownValue = self->_lastKnownValue;
  self->_id lastKnownValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)lastKnownValue
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lastKnownValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDCharacteristicMetadata)metadata
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_metadata;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPreviousValue:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id previousValue = self->_previousValue;
  self->_id previousValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)previousValue
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_previousValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHapCharacteristicTuples:(id)a3
{
  id v4 = (NSSet *)a3;
  os_unfair_lock_lock_with_options();
  hapCharacteristicTuples = self->_hapCharacteristicTuples;
  self->_hapCharacteristicTuples = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSSet)hapCharacteristicTuples
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_hapCharacteristicTuples;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)notificationRegisteredWithRemoteGateway
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_notificationRegisteredWithRemoteGateway;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNotificationRegisteredWithRemoteGateway:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_notificationRegisteredWithRemoteGateway != v3) {
    self->_notificationRegisteredWithRemoteGateway = v3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (HMDCharacteristic)initWithCharacteristic:(id)a3 service:(id)a4 accessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDCharacteristic *)self init];
  if (v11)
  {
    int v12 = [v8 objectForKeyedSubscript:@"characteristic"];
    if ([v12 properties])
    {
      uint64_t v13 = [v12 stateNumber];
      stateNumber = v11->_stateNumber;
      v11->_stateNumber = (NSNumber *)v13;
    }
    objc_storeWeak((id *)&v11->_accessory, v10);
    objc_storeWeak((id *)&v11->_service, v9);
    [(HMDCharacteristic *)v11 updateWithDictionary:v8];
  }
  return v11;
}

- (HMDCharacteristic)init
{
  v12.receiver = self;
  v12.super_class = (Class)HMDCharacteristic;
  id v2 = [(HMDCharacteristic *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA08] set];
    hapCharacteristicTuples = v2->_hapCharacteristicTuples;
    v2->_hapCharacteristicTuples = (NSSet *)v3;

    uint64_t v5 = [MEMORY[0x263EFF910] distantFuture];
    notificationEnabledTime = v2->_notificationEnabledTime;
    v2->_notificationEnabledTime = (NSDate *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    notificationRegistrations = v2->_notificationRegistrations;
    v2->_notificationRegistrations = (NSMutableSet *)v7;

    v2->_notificationRegisteredWithRemoteGateway = 0;
    v2->_broadcastNotificationEnabled = 0;
    uint64_t v9 = [MEMORY[0x263EFF910] distantPast];
    lastKnownValueUpdateTime = v2->_lastKnownValueUpdateTime;
    v2->_lastKnownValueUpdateTime = (NSDate *)v9;
  }
  return v2;
}

+ (NSDictionary)currentTargetStateCharacteristicTypeMap
{
  if (currentTargetStateCharacteristicTypeMap_onceToken != -1) {
    dispatch_once(&currentTargetStateCharacteristicTypeMap_onceToken, &__block_literal_global_193_112091);
  }
  id v2 = (void *)currentTargetStateCharacteristicTypeMap_characteristicsMap;
  return (NSDictionary *)v2;
}

void __60__HMDCharacteristic_currentTargetStateCharacteristicTypeMap__block_invoke()
{
  v15[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0C550];
  uint64_t v1 = *MEMORY[0x263F0C068];
  v14[0] = *MEMORY[0x263F0C110];
  v14[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C4D8];
  v15[0] = v0;
  v15[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0C530];
  uint64_t v4 = *MEMORY[0x263F0C040];
  v14[2] = *MEMORY[0x263F0C0E0];
  v14[3] = v4;
  uint64_t v5 = *MEMORY[0x263F0C4A8];
  v15[2] = v3;
  v15[3] = v5;
  uint64_t v6 = *MEMORY[0x263F0C510];
  uint64_t v7 = *MEMORY[0x263F0C080];
  v14[4] = *MEMORY[0x263F0C0B0];
  v14[5] = v7;
  uint64_t v8 = *MEMORY[0x263F0C4E8];
  v15[4] = v6;
  v15[5] = v8;
  uint64_t v9 = *MEMORY[0x263F0C520];
  uint64_t v10 = *MEMORY[0x263F0C0E8];
  v14[6] = *MEMORY[0x263F0C0D0];
  v14[7] = v10;
  uint64_t v11 = *MEMORY[0x263F0C548];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x263F0C128];
  v15[8] = *MEMORY[0x263F0C568];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];
  uint64_t v13 = (void *)currentTargetStateCharacteristicTypeMap_characteristicsMap;
  currentTargetStateCharacteristicTypeMap_characteristicsMap = v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t43_112093 != -1) {
    dispatch_once(&logCategory__hmf_once_t43_112093, &__block_literal_global_145_112094);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v44_112095;
  return v2;
}

void __32__HMDCharacteristic_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v44_112095;
  logCategory__hmf_once_v44_112095 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)value:(id)a3 differentThan:(id)a4
{
  return HMFEqualObjects() ^ 1;
}

+ (id)sortComparatorForCharacteristicDictionary
{
  return &__block_literal_global_112100;
}

uint64_t __62__HMDCharacteristic_sortComparatorForCharacteristicDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a2, "hmf_numberForKey:", @"characteristicInstanceID");
  uint64_t v6 = objc_msgSend(v4, "hmf_numberForKey:", @"characteristicInstanceID");

  if (v5) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = v6 != 0;
  }
  if (v5 && v6) {
    uint64_t v7 = [v5 compare:v6];
  }

  return v7;
}

@end