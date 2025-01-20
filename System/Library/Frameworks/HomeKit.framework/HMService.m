@interface HMService
+ (BOOL)supportsSecureCoding;
+ (HMService)serviceWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4;
+ (HMService)serviceWithServiceReference:(id)a3 home:(id)a4;
+ (NSDictionary)defaultCharacteristicByServiceDictionary;
+ (NSSet)characteristicBlacklistForShortcutConditions;
+ (id)__localizedDescriptionForServiceType:(id)a3;
+ (id)_mapToIsConfiguredValueFromServiceConfigurationState:(int64_t)a3;
+ (id)_serviceTypeAsString:(id)a3;
+ (id)localizedDescriptionForServiceType:(id)a3;
+ (id)logCategory;
+ (int64_t)_mapToServiceConfigurationStateFromIsConfiguredValue:(id)a3;
+ (void)initializeCharacteristicDictionaries;
- (BOOL)_hasCharacteristic:(id)a3;
- (BOOL)_hasCharacteristicOfType:(id)a3;
- (BOOL)hasOperatingState;
- (BOOL)hasOperatingStateAbnormalReasons;
- (BOOL)hasSleepDiscoveryMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNameModifiable;
- (BOOL)isPrimaryService;
- (BOOL)isUserInteractive;
- (BOOL)mediaSourceDisplayOrderModifiable;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)nameModifiable;
- (HMAccessory)accessory;
- (HMApplicationData)applicationData;
- (HMBulletinBoardNotification)bulletinBoardNotificationInternal;
- (HMMutableArray)currentCharacteristics;
- (HMService)init;
- (HMService)initWithCoder:(id)a3;
- (HMService)initWithUUID:(id)a3 accessory:(id)a4;
- (NSArray)characteristics;
- (NSArray)linkedServiceInstanceIDs;
- (NSArray)linkedServices;
- (NSArray)mediaSourceDisplayOrder;
- (NSDictionary)serializedDictionaryRepresentation;
- (NSNumber)instanceID;
- (NSNumber)lastKnownDiscoveryMode;
- (NSNumber)lastKnownOperatingStateAbnormalReasonsValue;
- (NSNumber)lastKnownOperatingStateValue;
- (NSNumber)matterEndpointID;
- (NSNumber)mediaSourceIdentifier;
- (NSString)assistantIdentifier;
- (NSString)associatedServiceType;
- (NSString)configuredName;
- (NSString)defaultName;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)name;
- (NSString)serviceSubtype;
- (NSString)serviceType;
- (NSURL)homeObjectURLInternal;
- (NSUUID)accessoryUUID;
- (NSUUID)accessoryUniqueIdentifier;
- (NSUUID)targetAccessoryUUID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_findCharacteristic:(id)a3;
- (id)_findCharacteristicWithUniqueIdentifier:(id)a3;
- (id)_serviceTypeDescription;
- (id)characteristicsSupportedForShortcutConditions;
- (id)defaultCharacteristic;
- (id)logIdentifier;
- (int64_t)configurationState;
- (int64_t)lastKnownOperatingState;
- (int64_t)lastKnownSleepDiscoveryMode;
- (unint64_t)hash;
- (unint64_t)lastKnownOperatingStateAbnormalReasons;
- (void)__configureWithContext:(id)a3 accessory:(id)a4;
- (void)_addCharacteristic:(id)a3;
- (void)_handleMarkServiceInteractive:(id)a3;
- (void)_handleUpdateAssociatedServiceType:(id)a3;
- (void)_handleUpdateServicePrimary:(id)a3;
- (void)_recomputeAssistantIdentifier;
- (void)_removeCharacteristic:(id)a3;
- (void)_unconfigure;
- (void)_updateAssociatedServiceType:(id)a3 completionHandler:(id)a4;
- (void)_updateConfigurationState:(int64_t)a3 completionHandler:(id)a4;
- (void)_updateName:(id)a3 completionHandler:(id)a4;
- (void)recomputeAssistantIdentifier;
- (void)setAccessory:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setAssociatedServiceType:(id)a3;
- (void)setConfigurationState:(int64_t)a3;
- (void)setConfiguredName:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentCharacteristics:(id)a3;
- (void)setDefaultName:(id)a3;
- (void)setLastKnownDiscoveryMode:(id)a3;
- (void)setLastKnownOperatingStateAbnormalReasonsValue:(id)a3;
- (void)setLastKnownOperatingStateValue:(id)a3;
- (void)setMatterEndpointID:(id)a3;
- (void)setMediaSourceDisplayOrder:(id)a3;
- (void)setMediaSourceDisplayOrderModifiable:(BOOL)a3;
- (void)setMediaSourceIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setNameModifiable:(BOOL)a3;
- (void)setServiceSubtype:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTargetAccessoryUUID:(id)a3;
- (void)setUserInteractive:(BOOL)a3;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateAssociatedServiceType:(NSString *)serviceType completionHandler:(void *)completion;
- (void)updateConfigurationState:(int64_t)a3 completionHandler:(id)a4;
- (void)updateName:(NSString *)name completionHandler:(void *)completion;
@end

@implementation HMService

- (BOOL)isEqual:(id)a3
{
  v4 = (HMService *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMService *)self uniqueIdentifier];
      v7 = [(HMService *)v5 uniqueIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HMService *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  v14[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v5 = (void *)MEMORY[0x1E4F29128];
    v6 = [(HMService *)self accessoryUniqueIdentifier];
    v7 = [NSString stringWithFormat:@"%@", self->_instanceID];
    v14[0] = v7;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v9 = objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:withSalts:", v6, v8);
    v11 = self->_uniqueIdentifier;
    p_uniqueIdentifier = &self->_uniqueIdentifier;
    *p_uniqueIdentifier = (NSUUID *)v9;

    uniqueIdentifier = *p_uniqueIdentifier;
  }
  v12 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (NSUUID)accessoryUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSArray)characteristics
{
  v2 = [(HMService *)self currentCharacteristics];
  unint64_t v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentCharacteristics
{
  return self->_currentCharacteristics;
}

- (HMService)initWithCoder:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", @"serviceUUID");
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  v7 = (void *)v6;
  if (v5 && v6)
  {
    char v8 = [(HMService *)self initWithUUID:v5 accessory:v6];
    if (v8)
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMServiceTargetAccessoryUUID"];
      targetAccessoryUUID = v8->_targetAccessoryUUID;
      v8->_targetAccessoryUUID = (NSUUID *)v9;

      uint64_t v11 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"associatedServiceType");
      associatedServiceType = v8->_associatedServiceType;
      v8->_associatedServiceType = (NSString *)v11;

      if (![(NSString *)v8->_associatedServiceType length])
      {
        v13 = v8->_associatedServiceType;
        v8->_associatedServiceType = 0;
      }
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
      name = v8->_name;
      v8->_name = (NSString *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceConfiguredName"];
      configuredName = v8->_configuredName;
      v8->_configuredName = (NSString *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceMatterEndpointID"];
      matterEndpointID = v8->_matterEndpointID;
      v8->_matterEndpointID = (NSNumber *)v18;

      uint64_t v20 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"serviceDefaultName");
      defaultName = v8->_defaultName;
      v8->_defaultName = (NSString *)v20;

      uint64_t v22 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"serviceType");
      serviceType = v8->_serviceType;
      v8->_serviceType = (NSString *)v22;

      uint64_t v24 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"serviceSubtype");
      serviceSubtype = v8->_serviceSubtype;
      v8->_serviceSubtype = (NSString *)v24;

      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceInstanceID"];
      instanceID = v8->_instanceID;
      v8->_instanceID = (NSNumber *)v26;

      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastKnownOperatingStateCodingKey"];
      lastKnownOperatingStateValue = v8->_lastKnownOperatingStateValue;
      v8->_lastKnownOperatingStateValue = (NSNumber *)v28;

      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMServiceLastKnownOperatingStateAbnormalReasonsCodingKey"];
      lastKnownOperatingStateAbnormalReasonsValue = v8->_lastKnownOperatingStateAbnormalReasonsValue;
      v8->_lastKnownOperatingStateAbnormalReasonsValue = (NSNumber *)v30;

      uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaSourceIdentifierCodingKey"];
      mediaSourceIdentifier = v8->_mediaSourceIdentifier;
      v8->_mediaSourceIdentifier = (NSNumber *)v32;

      uint64_t v34 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"mediaSourceDisplayOrderCodingKey"];
      mediaSourceDisplayOrder = v8->_mediaSourceDisplayOrder;
      v8->_mediaSourceDisplayOrder = (NSArray *)v34;

      v8->_mediaSourceDisplayOrderModifiable = [v4 decodeBoolForKey:@"mediaSourceDisplayOrderModifiableCodingKey"];
      v8->_nameModifiable = [v4 decodeBoolForKey:@"nameModifiableCodingKey"];
      v36 = (void *)MEMORY[0x1E4F1CAD0];
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      v38 = [v36 setWithArray:v37];
      v39 = [v4 decodeObjectOfClasses:v38 forKey:@"characteristics"];

      [(HMMutableArray *)v8->_currentCharacteristics setArray:v39];
      v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceConfigurationState"];
      if (v40)
      {
        v8->_configurationState = +[HMService _mapToServiceConfigurationStateFromIsConfiguredValue:v40];
      }
      else
      {
        v62 = v39;
        v8->_configurationState = 0;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v45 = [(HMService *)v8 characteristics];
        uint64_t v46 = [v45 countByEnumeratingWithState:&v63 objects:v68 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v64;
          while (2)
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v64 != v48) {
                objc_enumerationMutation(v45);
              }
              v50 = [*(id *)(*((void *)&v63 + 1) + 8 * i) characteristicType];
              int v51 = [v50 isEqualToString:@"000000D6-0000-1000-8000-0026BB765291"];

              if (v51)
              {
                v8->_configurationState = 1;
                goto LABEL_21;
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v63 objects:v68 count:16];
            if (v47) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        v39 = v62;
        v40 = 0;
      }
      v8->_userInteractive = [v4 decodeBoolForKey:@"HM.hidden"] ^ 1;
      v52 = [[HMApplicationData alloc] initWithDictionaryFromCoder:v4 key:@"HM.appData"];
      applicationData = v8->_applicationData;
      v8->_applicationData = v52;

      v8->_primaryService = [v4 decodeBoolForKey:@"HM.primary"];
      v54 = (void *)MEMORY[0x1E4F1CAD0];
      v67[0] = objc_opt_class();
      v67[1] = objc_opt_class();
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      v56 = [v54 setWithArray:v55];
      uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"HM.linkedServices"];
      linkedServiceInstanceIDs = v8->_linkedServiceInstanceIDs;
      v8->_linkedServiceInstanceIDs = (NSArray *)v57;

      uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.BulletinBoardNotification"];
      bulletinBoardNotificationInternal = v8->_bulletinBoardNotificationInternal;
      v8->_bulletinBoardNotificationInternal = (HMBulletinBoardNotification *)v59;
    }
    self = v8;
    v44 = self;
  }
  else
  {
    v41 = (void *)MEMORY[0x19F3A64A0]();
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v71 = v43;
      __int16 v72 = 2112;
      v73 = v5;
      __int16 v74 = 2112;
      v75 = v7;
      _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from uuid: %@, accessory: %@", buf, 0x20u);
    }
    v44 = 0;
  }

  return v44;
}

- (HMService)initWithUUID:(id)a3 accessory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMService;
  uint64_t v9 = [(HMService *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_accessory, v8);
    uint64_t v11 = [v8 uniqueIdentifier];
    accessoryUniqueIdentifier = v10->_accessoryUniqueIdentifier;
    v10->_accessoryUniqueIdentifier = (NSUUID *)v11;

    uint64_t v13 = +[HMMutableArray array];
    currentCharacteristics = v10->_currentCharacteristics;
    v10->_currentCharacteristics = (HMMutableArray *)v13;

    v15 = objc_alloc_init(HMApplicationData);
    applicationData = v10->_applicationData;
    v10->_applicationData = v15;
  }
  return v10;
}

- (BOOL)isPrimaryService
{
  return self->_primaryService;
}

- (HMApplicationData)applicationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)associatedServiceType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_associatedServiceType;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)serviceSubtype
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_serviceSubtype;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)serviceType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_serviceType;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)matterEndpointID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_matterEndpointID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSUUID)accessoryUUID
{
  unint64_t v3 = [(HMService *)self targetAccessoryUUID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(HMService *)self accessory];
    id v5 = [v6 uuid];
  }

  return (NSUUID *)v5;
}

- (NSUUID)targetAccessoryUUID
{
  return self->_targetAccessoryUUID;
}

- (NSArray)linkedServices
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(HMService *)self accessory];
  id v5 = [v4 services];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        linkedServiceInstanceIDs = self->_linkedServiceInstanceIDs;
        v12 = [v10 instanceID];
        LODWORD(linkedServiceInstanceIDs) = [(NSArray *)linkedServiceInstanceIDs containsObject:v12];

        if (linkedServiceInstanceIDs) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v3 count]) {
    id v13 = v3;
  }
  else {
    id v13 = 0;
  }

  return (NSArray *)v13;
}

- (HMAccessory)accessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  os_unfair_lock_unlock(p_lock);

  return (HMAccessory *)WeakRetained;
}

- (NSNumber)mediaSourceIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mediaSourceIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(HMService *)self setContext:v6];
  [(HMService *)self setAccessory:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(HMService *)self characteristics];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "__configureWithContext:service:", v6, self);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  id v13 = [(HMService *)self bulletinBoardNotificationInternal];
  objc_msgSend(v13, "__configureWithContext:", v6);
}

- (void)setContext:(id)a3
{
}

- (void)setAccessory:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_accessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMBulletinBoardNotification)bulletinBoardNotificationInternal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_bulletinBoardNotificationInternal;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = [(HMService *)self uniqueIdentifier];
  id v5 = [v4 UUIDString];
  id v6 = [(HMService *)self serviceType];
  id v7 = +[HMService _serviceTypeAsString:v6];
  uint64_t v8 = [(HMService *)self serviceType];
  uint64_t v9 = [v3 stringWithFormat:@"HMService %@: %@(%@)", v5, v7, v8];

  return (NSString *)v9;
}

+ (id)_serviceTypeAsString:(id)a3
{
  id v3 = a3;
  id v4 = +[HMHAPMetadata getSharedInstance];
  id v5 = [v4 serviceTypeDescription:v3];

  return v5;
}

- (BOOL)hasOperatingState
{
  v2 = [(HMService *)self lastKnownOperatingStateValue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSNumber)lastKnownOperatingStateValue
{
  return self->_lastKnownOperatingStateValue;
}

+ (id)localizedDescriptionForServiceType:(id)a3
{
  return +[HMService __localizedDescriptionForServiceType:a3];
}

+ (id)__localizedDescriptionForServiceType:(id)a3
{
  BOOL v3 = localizationKeyForServiceType(a3);
  id v4 = +[HMLocalization sharedManager];
  id v5 = [v4 getLocalizedOrCustomString:v3];

  return v5;
}

- (NSDictionary)serializedDictionaryRepresentation
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = +[HMPBServiceReference serviceReferenceWithService:self];
  v6[0] = @"HMShortcutsSerializedDictionaryVersion";
  v6[1] = @"HMShortcutsSerializedDictionaryProtocol";
  v7[0] = @"1.0";
  v7[1] = @"ProtoBuf";
  v6[2] = @"HMServiceSerializedDataKey";
  BOOL v3 = [v2 data];
  v7[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return (NSDictionary *)v4;
}

+ (HMService)serviceWithServiceReference:(id)a3 home:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasUniqueIdentifier] & 1) == 0)
  {
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = a1;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v19;
      uint64_t v20 = "%{public}@ServiceReference uniqueIdentifier not set";
LABEL_10:
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v26, 0xCu);
    }
LABEL_11:

    long long v14 = 0;
    goto LABEL_18;
  }
  if (([v6 hasAccessoryReference] & 1) == 0)
  {
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = a1;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v19;
      uint64_t v20 = "%{public}@AccessoryReference not set in serviceReference";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v8 = [v6 accessoryReference];
  uint64_t v9 = +[HMAccessory accessoryWithAccessoryReference:v8 home:v7];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F29128];
    uint64_t v11 = [v6 uniqueIdentifier];
    uint64_t v12 = objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);

    id v13 = [v9 _findServiceWithUniqueIdentifier:v12];
    long long v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      v21 = (void *)MEMORY[0x19F3A64A0]();
      id v22 = a1;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v26 = 138543618;
        v27 = v24;
        __int16 v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Can't find service %@", (uint8_t *)&v26, 0x16u);
      }
    }
  }
  else
  {
    long long v14 = 0;
  }

LABEL_18:

  return (HMService *)v14;
}

+ (HMService)serviceWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "hmf_dataForKey:", @"HMServiceSerializedDataKey");
  uint64_t v8 = +[HMPBServiceReference serviceReferenceWithData:v7];
  uint64_t v9 = [a1 serviceWithServiceReference:v8 home:v6];

  return (HMService *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, 0);
  objc_storeStrong((id *)&self->_linkedServiceInstanceIDs, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_targetAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingStateAbnormalReasonsValue, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingStateValue, 0);
  objc_storeStrong((id *)&self->_lastKnownDiscoveryMode, 0);
  objc_storeStrong((id *)&self->_currentCharacteristics, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_homeObjectURLInternal, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotificationInternal, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_serviceSubtype, 0);
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_defaultName, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_matterEndpointID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_destroyWeak((id *)&self->_accessory);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setMediaSourceDisplayOrderModifiable:(BOOL)a3
{
  self->_mediaSourceDisplayOrderModifiable = a3;
}

- (BOOL)mediaSourceDisplayOrderModifiable
{
  return self->_mediaSourceDisplayOrderModifiable;
}

- (void)setMediaSourceDisplayOrder:(id)a3
{
}

- (NSArray)mediaSourceDisplayOrder
{
  return self->_mediaSourceDisplayOrder;
}

- (NSArray)linkedServiceInstanceIDs
{
  return self->_linkedServiceInstanceIDs;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setTargetAccessoryUUID:(id)a3
{
}

- (void)setLastKnownOperatingStateAbnormalReasonsValue:(id)a3
{
}

- (NSNumber)lastKnownOperatingStateAbnormalReasonsValue
{
  return self->_lastKnownOperatingStateAbnormalReasonsValue;
}

- (void)setLastKnownOperatingStateValue:(id)a3
{
}

- (void)setLastKnownDiscoveryMode:(id)a3
{
}

- (NSNumber)lastKnownDiscoveryMode
{
  return self->_lastKnownDiscoveryMode;
}

- (void)setCurrentCharacteristics:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (BOOL)isUserInteractive
{
  return self->_userInteractive;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (void)setNameModifiable:(BOOL)a3
{
  self->_nameModifiable = a3;
}

- (BOOL)nameModifiable
{
  return self->_nameModifiable;
}

- (BOOL)_hasCharacteristicOfType:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(HMService *)self characteristics];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) characteristicType];
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)localizedDescription
{
  BOOL v3 = objc_opt_class();
  id v4 = [(HMService *)self serviceType];
  id v5 = objc_msgSend(v3, "__localizedDescriptionForServiceType:", v4);

  return (NSString *)v5;
}

- (id)_serviceTypeDescription
{
  v2 = [(HMService *)self serviceType];
  BOOL v3 = +[HMService _serviceTypeAsString:v2];

  return v3;
}

- (void)_addCharacteristic:(id)a3
{
  id v5 = a3;
  if (!-[HMService _hasCharacteristic:](self, "_hasCharacteristic:"))
  {
    id v4 = [(HMService *)self currentCharacteristics];
    [v4 addObject:v5];
  }
}

- (void)_removeCharacteristic:(id)a3
{
  id v5 = a3;
  if (-[HMService _hasCharacteristic:](self, "_hasCharacteristic:"))
  {
    id v4 = [(HMService *)self currentCharacteristics];
    [v4 removeObject:v5];
  }
}

- (BOOL)_hasCharacteristic:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(HMService *)self characteristics];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        if (v10 == v4)
        {
LABEL_13:
          BOOL v15 = 1;
          goto LABEL_14;
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) service];
        if (v11 == self)
        {
          long long v12 = [v10 instanceID];
          long long v13 = [v4 instanceID];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (void)_handleUpdateAssociatedServiceType:(id)a3
{
  id v5 = a3;
  if ([v5 length]) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(HMService *)self setAssociatedServiceType:v4];
}

- (void)_handleMarkServiceInteractive:(id)a3
{
  self->_userInteractive = [a3 isUserInteractive];
}

- (void)_handleUpdateServicePrimary:(id)a3
{
  self->_primaryService = [a3 isPrimaryService];
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v13);
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(HMService *)self accessory];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 updateApplicationData:v14 forService:self completionHandler:v7];
  }
  else
  {
    id v10 = [(HMService *)self context];
    uint64_t v11 = [v10 delegateCaller];
    long long v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v11 callCompletion:v7 error:v12];
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v158 = [(HMService *)self accessory];
  id v5 = [v158 delegate];
  id v6 = [HMObjectMergeCollection alloc];
  uint64_t v7 = [(HMService *)self currentCharacteristics];
  uint64_t v8 = [v7 array];
  uint64_t v9 = [v4 currentCharacteristics];
  id v10 = [v9 array];
  uint64_t v11 = [(HMObjectMergeCollection *)v6 initWithCurrentObjects:v8 newObjects:v10];

  long long v12 = [(HMObjectMergeCollection *)v11 removedObjects];
  v184[0] = MEMORY[0x1E4F143A8];
  v184[1] = 3221225472;
  v184[2] = __32__HMService_mergeFromNewObject___block_invoke;
  v184[3] = &unk_1E5944C40;
  v184[4] = self;
  [v12 enumerateObjectsUsingBlock:v184];

  id v13 = [(HMObjectMergeCollection *)v11 addedObjects];
  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = __32__HMService_mergeFromNewObject___block_invoke_173;
  v183[3] = &unk_1E5944C40;
  v183[4] = self;
  [v13 enumerateObjectsUsingBlock:v183];

  [(HMObjectMergeCollection *)v11 mergeCommonObjects];
  if ([(HMObjectMergeCollection *)v11 isModified])
  {
    id v14 = [(HMObjectMergeCollection *)v11 finalObjects];
    BOOL v15 = [(HMService *)self currentCharacteristics];
    [v15 setArray:v14];

    char v16 = 1;
  }
  else
  {
    char v16 = 0;
  }
  long long v17 = [(HMService *)self name];
  long long v18 = [v4 name];
  char v19 = [v17 isEqualToString:v18];

  if ((v19 & 1) == 0)
  {
    long long v20 = (void *)MEMORY[0x19F3A64A0]();
    v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v4 name];
      *(_DWORD *)buf = 138543618;
      v186 = v23;
      __int16 v187 = 2112;
      v188 = v24;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating name via merge to %@", buf, 0x16u);
    }
    v25 = [v4 name];
    [(HMService *)v21 setName:v25];

    if (objc_opt_respondsToSelector())
    {
      int v26 = [(HMService *)v21 context];
      v27 = [v26 delegateCaller];
      v179[0] = MEMORY[0x1E4F143A8];
      v179[1] = 3221225472;
      v179[2] = __32__HMService_mergeFromNewObject___block_invoke_176;
      v179[3] = &unk_1E5945650;
      id v180 = v5;
      id v181 = v158;
      v182 = v21;
      [v27 invokeBlock:v179];
    }
    char v16 = 1;
  }
  __int16 v28 = [(HMService *)self configuredName];
  v29 = [v4 configuredName];
  char v30 = HMFEqualObjects();

  if ((v30 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      v35 = [v4 configuredName];
      *(_DWORD *)buf = 138543618;
      v186 = v34;
      __int16 v187 = 2112;
      v188 = v35;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating configured name via merge to %@", buf, 0x16u);
    }
    v36 = [v4 configuredName];
    [(HMService *)v32 setConfiguredName:v36];

    if ([v5 conformsToProtocol:&unk_1EEF70C88])
    {
      id v37 = v5;
      if (objc_opt_respondsToSelector())
      {
        v38 = [(HMService *)v32 context];
        v39 = [v38 delegateCaller];
        v175[0] = MEMORY[0x1E4F143A8];
        v175[1] = 3221225472;
        v175[2] = __32__HMService_mergeFromNewObject___block_invoke_302;
        v175[3] = &unk_1E5945650;
        id v176 = v37;
        id v177 = v158;
        v178 = v32;
        [v39 invokeBlock:v175];
      }
    }
    char v16 = 1;
  }
  v40 = [(HMService *)self matterEndpointID];
  v41 = [v4 matterEndpointID];
  char v42 = HMFEqualObjects();

  if ((v42 & 1) == 0)
  {
    v43 = (void *)MEMORY[0x19F3A64A0]();
    v44 = self;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      uint64_t v46 = HMFGetLogIdentifier();
      uint64_t v47 = [v4 matterEndpointID];
      *(_DWORD *)buf = 138543618;
      v186 = v46;
      __int16 v187 = 2112;
      v188 = v47;
      _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_INFO, "%{public}@Updating matter endpoint ID via merge to %@", buf, 0x16u);
    }
    uint64_t v48 = [v4 matterEndpointID];
    [(HMService *)v44 setMatterEndpointID:v48];

    char v16 = 1;
  }
  v49 = [(HMService *)self defaultName];
  v50 = [v4 defaultName];
  char v51 = HMFEqualObjects();

  if ((v51 & 1) == 0)
  {
    v52 = (void *)MEMORY[0x19F3A64A0]();
    v53 = self;
    v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = HMFGetLogIdentifier();
      v56 = [v4 defaultName];
      *(_DWORD *)buf = 138543618;
      v186 = v55;
      __int16 v187 = 2112;
      v188 = v56;
      _os_log_impl(&dword_19D1A8000, v54, OS_LOG_TYPE_INFO, "%{public}@Updating default name via merge to %@", buf, 0x16u);
    }
    uint64_t v57 = [v4 defaultName];
    [(HMService *)v53 setDefaultName:v57];

    char v16 = 1;
  }
  v58 = [(HMService *)self applicationData];
  uint64_t v59 = [v4 applicationData];
  char v60 = HMFEqualObjects();

  if ((v60 & 1) == 0)
  {
    v61 = (void *)MEMORY[0x19F3A64A0]();
    v62 = self;
    long long v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      long long v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v186 = v64;
      _os_log_impl(&dword_19D1A8000, v63, OS_LOG_TYPE_INFO, "%{public}@Updating application data via merge", buf, 0xCu);
    }
    long long v65 = [v4 applicationData];
    [(HMService *)v62 setApplicationData:v65];

    [v158 notifyDelegateOfAppDataUpdateForService:v62];
    char v16 = 1;
  }
  long long v66 = [(HMService *)self serviceType];
  v67 = [v4 serviceType];
  char v68 = [v66 isEqualToString:v67];

  if ((v68 & 1) == 0)
  {
    v69 = (void *)MEMORY[0x19F3A64A0]();
    v70 = self;
    v71 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      __int16 v72 = HMFGetLogIdentifier();
      v73 = [v4 serviceType];
      *(_DWORD *)buf = 138543618;
      v186 = v72;
      __int16 v187 = 2112;
      v188 = v73;
      _os_log_impl(&dword_19D1A8000, v71, OS_LOG_TYPE_INFO, "%{public}@Updating service type via merge to %@", buf, 0x16u);
    }
    __int16 v74 = [v4 serviceType];
    [(HMService *)v70 setServiceType:v74];

    char v16 = 1;
  }
  int v75 = [(HMService *)self isUserInteractive];
  if (v75 != [v4 isUserInteractive])
  {
    uint64_t v76 = (void *)MEMORY[0x19F3A64A0]();
    v77 = self;
    v78 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      v79 = HMFGetLogIdentifier();
      [v4 isUserInteractive];
      v80 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v186 = v79;
      __int16 v187 = 2112;
      v188 = v80;
      _os_log_impl(&dword_19D1A8000, v78, OS_LOG_TYPE_INFO, "%{public}@Updating is user interactive via merge to %@", buf, 0x16u);
    }
    -[HMService setUserInteractive:](v77, "setUserInteractive:", [v4 isUserInteractive]);
    char v16 = 1;
  }
  v81 = [(HMService *)self associatedServiceType];
  v82 = [v4 associatedServiceType];
  char v83 = HMFEqualObjects();

  if ((v83 & 1) == 0)
  {
    v84 = (void *)MEMORY[0x19F3A64A0]();
    v85 = self;
    v86 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      v87 = HMFGetLogIdentifier();
      v88 = [v4 associatedServiceType];
      *(_DWORD *)buf = 138543618;
      v186 = v87;
      __int16 v187 = 2112;
      v188 = v88;
      _os_log_impl(&dword_19D1A8000, v86, OS_LOG_TYPE_INFO, "%{public}@Updating associated service type via merge to %@", buf, 0x16u);
    }
    v89 = [v4 associatedServiceType];
    [(HMService *)v85 setAssociatedServiceType:v89];

    if (objc_opt_respondsToSelector())
    {
      v90 = [(HMService *)v85 context];
      v91 = [v90 delegateCaller];
      v171[0] = MEMORY[0x1E4F143A8];
      v171[1] = 3221225472;
      v171[2] = __32__HMService_mergeFromNewObject___block_invoke_304;
      v171[3] = &unk_1E5945650;
      id v172 = v5;
      id v173 = v158;
      v174 = v85;
      [v91 invokeBlock:v171];
    }
    char v16 = 1;
  }
  v92 = [(HMService *)self serviceSubtype];
  v93 = [v4 serviceSubtype];
  char v94 = HMFEqualObjects();

  if ((v94 & 1) == 0)
  {
    v95 = (void *)MEMORY[0x19F3A64A0]();
    v96 = self;
    v97 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      v98 = HMFGetLogIdentifier();
      v99 = [v4 serviceSubtype];
      *(_DWORD *)buf = 138543618;
      v186 = v98;
      __int16 v187 = 2112;
      v188 = v99;
      _os_log_impl(&dword_19D1A8000, v97, OS_LOG_TYPE_INFO, "%{public}@Updating service subtype via merge to %@", buf, 0x16u);
    }
    v100 = [v4 serviceSubtype];
    [(HMService *)v96 setServiceSubtype:v100];

    if ([v5 conformsToProtocol:&unk_1EEF70C88])
    {
      id v101 = v5;
      if (objc_opt_respondsToSelector())
      {
        v102 = [(HMService *)v96 context];
        v103 = [v102 delegateCaller];
        v167[0] = MEMORY[0x1E4F143A8];
        v167[1] = 3221225472;
        v167[2] = __32__HMService_mergeFromNewObject___block_invoke_306;
        v167[3] = &unk_1E5945650;
        id v168 = v101;
        id v169 = v158;
        v170 = v96;
        [v103 invokeBlock:v167];
      }
    }
    char v16 = 1;
  }
  int64_t v104 = [(HMService *)self configurationState];
  if (v104 != [v4 configurationState])
  {
    v105 = (void *)MEMORY[0x19F3A64A0]();
    v106 = self;
    v107 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      v108 = HMFGetLogIdentifier();
      v109 = HMServiceConfigurationStateAsString([v4 configurationState]);
      *(_DWORD *)buf = 138543618;
      v186 = v108;
      __int16 v187 = 2112;
      v188 = v109;
      _os_log_impl(&dword_19D1A8000, v107, OS_LOG_TYPE_INFO, "%{public}@Updating configuration state via merge to %@", buf, 0x16u);
    }
    -[HMService setConfigurationState:](v106, "setConfigurationState:", [v4 configurationState]);
    if ([v5 conformsToProtocol:&unk_1EEF70C88])
    {
      id v110 = v5;
      if (objc_opt_respondsToSelector())
      {
        v111 = [(HMService *)v106 context];
        v112 = [v111 delegateCaller];
        v163[0] = MEMORY[0x1E4F143A8];
        v163[1] = 3221225472;
        v163[2] = __32__HMService_mergeFromNewObject___block_invoke_308;
        v163[3] = &unk_1E5945650;
        id v164 = v110;
        id v165 = v158;
        v166 = v106;
        [v112 invokeBlock:v163];
      }
    }
    char v16 = 1;
  }
  v113 = [(HMService *)self lastKnownOperatingStateValue];
  v114 = [v4 lastKnownOperatingStateValue];
  int v115 = HMFEqualObjects();

  if (!v115
    || ([(HMService *)self lastKnownOperatingStateAbnormalReasonsValue],
        v116 = objc_claimAutoreleasedReturnValue(),
        [v4 lastKnownOperatingStateAbnormalReasonsValue],
        v117 = objc_claimAutoreleasedReturnValue(),
        char v118 = HMFEqualObjects(),
        v117,
        v116,
        (v118 & 1) == 0))
  {
    v119 = (void *)MEMORY[0x19F3A64A0]();
    v120 = self;
    v121 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      v122 = HMFGetLogIdentifier();
      v123 = [v4 lastKnownOperatingStateValue];
      v124 = [v4 lastKnownOperatingStateAbnormalReasonsValue];
      *(_DWORD *)buf = 138543874;
      v186 = v122;
      __int16 v187 = 2112;
      v188 = v123;
      __int16 v189 = 2112;
      v190 = v124;
      _os_log_impl(&dword_19D1A8000, v121, OS_LOG_TYPE_INFO, "%{public}@Updating last known operating state value and abnormal reasons value via merge to %@ and %@", buf, 0x20u);
    }
    v125 = [v4 lastKnownOperatingStateValue];
    [(HMService *)v120 setLastKnownOperatingStateValue:v125];

    v126 = [v4 lastKnownOperatingStateAbnormalReasonsValue];
    [(HMService *)v120 setLastKnownOperatingStateAbnormalReasonsValue:v126];

    if ([v5 conformsToProtocol:&unk_1EEF70C88])
    {
      id v127 = v5;
      if (objc_opt_respondsToSelector())
      {
        v128 = [(HMService *)v120 context];
        v129 = [v128 delegateCaller];
        v159[0] = MEMORY[0x1E4F143A8];
        v159[1] = 3221225472;
        v159[2] = __32__HMService_mergeFromNewObject___block_invoke_310;
        v159[3] = &unk_1E5945650;
        id v160 = v127;
        id v161 = v158;
        v162 = v120;
        [v129 invokeBlock:v159];
      }
    }
    char v16 = 1;
  }
  v130 = [(HMService *)self mediaSourceDisplayOrder];
  v131 = [v4 mediaSourceDisplayOrder];
  char v132 = HMFEqualObjects();

  if ((v132 & 1) == 0)
  {
    v133 = (void *)MEMORY[0x19F3A64A0]();
    v134 = self;
    v135 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
    {
      v136 = HMFGetLogIdentifier();
      v137 = [v4 mediaSourceDisplayOrder];
      *(_DWORD *)buf = 138543618;
      v186 = v136;
      __int16 v187 = 2112;
      v188 = v137;
      _os_log_impl(&dword_19D1A8000, v135, OS_LOG_TYPE_INFO, "%{public}@Updating media display order via merge to %@", buf, 0x16u);
    }
    v138 = [v4 mediaSourceDisplayOrder];
    [(HMService *)v134 setMediaSourceDisplayOrder:v138];

    char v16 = 1;
  }
  v139 = [(HMService *)self mediaSourceIdentifier];
  v140 = [v4 mediaSourceIdentifier];
  char v141 = HMFEqualObjects();

  if ((v141 & 1) == 0)
  {
    v142 = (void *)MEMORY[0x19F3A64A0]();
    v143 = self;
    v144 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
    {
      v145 = HMFGetLogIdentifier();
      v146 = [v4 mediaSourceIdentifier];
      *(_DWORD *)buf = 138543618;
      v186 = v145;
      __int16 v187 = 2112;
      v188 = v146;
      _os_log_impl(&dword_19D1A8000, v144, OS_LOG_TYPE_INFO, "%{public}@Updating media source identifier via merge to %@", buf, 0x16u);
    }
    v147 = [v4 mediaSourceIdentifier];
    [(HMService *)v143 setMediaSourceIdentifier:v147];

    char v16 = 1;
  }
  int v148 = [(HMService *)self mediaSourceDisplayOrderModifiable];
  if (v148 != [v4 mediaSourceDisplayOrderModifiable])
  {
    v149 = (void *)MEMORY[0x19F3A64A0]();
    v150 = self;
    v151 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
    {
      v152 = HMFGetLogIdentifier();
      [v4 mediaSourceDisplayOrderModifiable];
      v153 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v186 = v152;
      __int16 v187 = 2112;
      v188 = v153;
      _os_log_impl(&dword_19D1A8000, v151, OS_LOG_TYPE_INFO, "%{public}@Updating media source display order modifiable via merge to %@", buf, 0x16u);
    }
    -[HMService setMediaSourceDisplayOrderModifiable:](v150, "setMediaSourceDisplayOrderModifiable:", [v4 mediaSourceDisplayOrderModifiable]);
    char v16 = 1;
  }
  v154 = [(HMService *)self bulletinBoardNotification];
  v155 = [v4 bulletinBoardNotification];
  char v156 = [v154 mergeFromNewObject:v155];

  return v16 | v156;
}

void __32__HMService_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed characteristic via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __32__HMService_mergeFromNewObject___block_invoke_173(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added characteristic via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:service:", v8, *(void *)(a1 + 32));
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_176(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateNameForService:*(void *)(a1 + 48)];
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_302(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateConfiguredNameForService:*(void *)(a1 + 48)];
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_304(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateAssociatedServiceTypeForService:*(void *)(a1 + 48)];
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_306(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateServiceSubtypeForService:*(void *)(a1 + 48)];
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_308(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateConfigurationStateForService:*(void *)(a1 + 48)];
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_310(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateLastKnownOperatingStateResponseForService:*(void *)(a1 + 48)];
}

- (id)_findCharacteristicWithUniqueIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMService *)self characteristics];
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
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        __int16 v10 = [v9 uniqueIdentifier];
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

- (id)_findCharacteristic:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMService *)self characteristics];
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
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        __int16 v10 = [v9 instanceID];
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

- (id)logIdentifier
{
  v2 = [(HMService *)self uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)_updateConfigurationState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(HMService *)self configurationState])
  {
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    long long v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v61 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: configuration states not applicable to service", buf, 0xCu);
    }
    id v12 = [(HMService *)v17 context];
    long long v13 = [v12 delegateCaller];
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 48;
    goto LABEL_29;
  }
  if ((unint64_t)a3 <= 1)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    int v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      char v11 = HMServiceConfigurationStateAsString(a3);
      *(_DWORD *)buf = 138543618;
      v61 = v10;
      __int16 v62 = 2112;
      long long v63 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: new configuration state is invalid: %@", buf, 0x16u);
    }
    id v12 = [(HMService *)v8 context];
    long long v13 = [v12 delegateCaller];
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 3;
    goto LABEL_29;
  }
  if ([(HMService *)self configurationState] != a3)
  {
    id v54 = v6;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v25 = [(HMService *)self characteristics];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v56;
LABEL_15:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v25);
        }
        char v30 = *(void **)(*((void *)&v55 + 1) + 8 * v29);
        v31 = [v30 characteristicType];
        char v32 = [v31 isEqualToString:@"000000D6-0000-1000-8000-0026BB765291"];

        if (v32) {
          break;
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (v27) {
            goto LABEL_15;
          }
          goto LABEL_21;
        }
      }
      id v12 = v30;

      if (!v12) {
        goto LABEL_26;
      }
      uint64_t v33 = +[HMService _mapToIsConfiguredValueFromServiceConfigurationState:a3];
      id v6 = v54;
      if (v33)
      {
        long long v13 = (void *)v33;
        uint64_t v34 = [(HMService *)self accessory];
        if (v34)
        {
          v35 = v34;
          [v34 _writeValue:v13 forCharacteristic:v12 service:self completionHandler:v54];
        }
        else
        {
          uint64_t v47 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v48 = self;
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v61 = v50;
            _os_log_impl(&dword_19D1A8000, v49, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: accessory is nil", buf, 0xCu);
          }
          char v51 = [(HMService *)v48 context];
          v52 = [v51 delegateCaller];
          v53 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
          [v52 callCompletion:v54 error:v53];

          v35 = 0;
        }
      }
      else
      {
        v40 = (void *)MEMORY[0x19F3A64A0]();
        v41 = self;
        char v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = HMFGetLogIdentifier();
          v44 = HMServiceConfigurationStateAsString(a3);
          *(_DWORD *)buf = 138543618;
          v61 = v43;
          __int16 v62 = 2112;
          long long v63 = v44;
          _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: mapped value is nil for %@", buf, 0x16u);
        }
        v35 = [(HMService *)v41 context];
        v45 = [v35 delegateCaller];
        uint64_t v46 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v45 callCompletion:v54 error:v46];

        long long v13 = 0;
      }
      goto LABEL_30;
    }
LABEL_21:

LABEL_26:
    v36 = (void *)MEMORY[0x19F3A64A0]();
    id v37 = self;
    v38 = HMFGetOSLogHandle();
    id v6 = v54;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v61 = v39;
      _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: cannot find IsConfigured characteristic", buf, 0xCu);
    }
    id v12 = [(HMService *)v37 context];
    long long v13 = [v12 delegateCaller];
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 2;
LABEL_29:
    v35 = [v14 hmErrorWithCode:v15];
    [v13 callCompletion:v6 error:v35];
LABEL_30:

    goto LABEL_31;
  }
  long long v20 = (void *)MEMORY[0x19F3A64A0]();
  v21 = self;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = HMFGetLogIdentifier();
    uint64_t v24 = HMServiceConfigurationStateAsString(a3);
    *(_DWORD *)buf = 138543618;
    v61 = v23;
    __int16 v62 = 2112;
    long long v63 = v24;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Not updating configuration state because it is already %@", buf, 0x16u);
  }
  id v12 = [(HMService *)v21 context];
  long long v13 = [v12 delegateCaller];
  [v13 callCompletion:v6 error:0];
LABEL_31:
}

- (void)updateConfigurationState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMService *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMService updateConfigurationState:completionHandler:]", @"completion"];
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    long long v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  int v8 = v7;
  if (v7)
  {
    int v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMService_updateConfigurationState_completionHandler___block_invoke;
    block[3] = &unk_1E5944C10;
    block[4] = self;
    int64_t v23 = a3;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
    char v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      __int16 v26 = 2080;
      uint64_t v27 = "-[HMService updateConfigurationState:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    long long v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __56__HMService_updateConfigurationState_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateConfigurationState:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_updateAssociatedServiceType:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (__CFString *)v6;
  uint64_t v18 = v8;
  if (v8) {
    int v9 = v8;
  }
  else {
    int v9 = &stru_1EEE9DD88;
  }
  __int16 v10 = [(HMService *)self associatedServiceType];
  int v11 = [(__CFString *)v9 isEqual:v10];

  if (v11)
  {
    id v12 = [(HMService *)self context];
    long long v13 = [v12 delegateCaller];
    [v13 callCompletion:v7 error:0];
  }
  else
  {
    long long v14 = [(HMService *)self accessory];
    if (v14)
    {
      id v12 = v14;
      [v14 _updateAssociatedServiceType:v9 forService:self completionHandler:v7];
    }
    else
    {
      uint64_t v15 = [(HMService *)self context];
      long long v16 = [v15 delegateCaller];
      long long v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:21 userInfo:0];
      [v16 callCompletion:v7 error:v17];

      id v12 = 0;
    }
  }
}

- (void)updateAssociatedServiceType:(NSString *)serviceType completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = serviceType;
  id v7 = completion;
  int v8 = [(HMService *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMService updateAssociatedServiceType:completionHandler:]", @"completion"];
    long long v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    char v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  int v9 = v8;
  if (v8)
  {
    __int16 v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__HMService_updateAssociatedServiceType_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    int64_t v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    int v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMService updateAssociatedServiceType:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __59__HMService_updateAssociatedServiceType_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAssociatedServiceType:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(HMService *)self accessory];
  if (v7)
  {
    if ([(HMService *)self isNameModifiable])
    {
      [v7 _updateName:v12 forService:self completionHandler:v6];
      goto LABEL_7;
    }
    int v8 = [(HMService *)self context];
    int v9 = [v8 delegateCaller];
    uint64_t v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  }
  else
  {
    int v8 = [(HMService *)self context];
    int v9 = [v8 delegateCaller];
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:21 userInfo:0];
  }
  int v11 = (void *)v10;
  [v9 callCompletion:v6 error:v10];

LABEL_7:
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = name;
  id v7 = completion;
  uint64_t v8 = [(HMService *)self context];
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMService updateName:completionHandler:]", @"completion"];
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    v25 = self;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v27;
      __int16 v34 = 2112;
      v35 = (const char *)v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  int v9 = (void *)v8;
  if (v8)
  {
    if (v6)
    {
      unint64_t v10 = [(NSString *)v6 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      if (v10 <= HMMaxLengthForNaming__hmf_once_v8)
      {
        id v22 = [v9 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __42__HMService_updateName_completionHandler___block_invoke;
        block[3] = &unk_1E5945138;
        block[4] = self;
        char v30 = v6;
        id v31 = v7;
        dispatch_async(v22, block);

        goto LABEL_16;
      }
      int v11 = (void *)MEMORY[0x19F3A64A0]();
      id v12 = self;
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
      }
      uint64_t v15 = [v9 delegateCaller];
      uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
      [v15 callCompletion:v7 error:v16];
    }
    else
    {
      uint64_t v15 = [(HMService *)self context];
      uint64_t v16 = [v15 delegateCaller];
      id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      [v16 callCompletion:v7 error:v21];
    }
  }
  else
  {
    long long v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    char v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v20;
      __int16 v34 = 2080;
      v35 = "-[HMService updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }

LABEL_16:
}

uint64_t __42__HMService_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)recomputeAssistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMService *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)assistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMService *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  id v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  id v4 = [WeakRetained uuid];
  id v5 = [NSString stringWithFormat:@"%@", self->_instanceID];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  hm_assistantIdentifierWithSalts(@"SV", (uint64_t)v4, (uint64_t)v6);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v7;
}

- (NSURL)homeObjectURLInternal
{
  id v3 = [(HMService *)self uniqueIdentifier];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  homeObjectURLInternal = self->_homeObjectURLInternal;
  if (!homeObjectURLInternal)
  {
    id v6 = [v3 UUIDString];
    id v7 = +[HMBulletinObjectTuple tupleWithQueryType:2 uuidString:v6];

    generateURLForHomeKitObject(v7, 0);
    uint64_t v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    int v9 = self->_homeObjectURLInternal;
    self->_homeObjectURLInternal = v8;

    homeObjectURLInternal = self->_homeObjectURLInternal;
  }
  unint64_t v10 = homeObjectURLInternal;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)setApplicationData:(id)a3
{
  id v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isNameModifiable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_nameModifiable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setMediaSourceIdentifier:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  mediaSourceIdentifier = self->_mediaSourceIdentifier;
  self->_mediaSourceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)lastKnownOperatingStateAbnormalReasons
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(NSNumber *)self->_lastKnownOperatingStateAbnormalReasonsValue unsignedIntegerValue];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)lastKnownOperatingState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t v4 = [(NSNumber *)self->_lastKnownOperatingStateValue integerValue];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasOperatingStateAbnormalReasons
{
  v2 = [(HMService *)self lastKnownOperatingStateAbnormalReasonsValue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)lastKnownSleepDiscoveryMode
{
  return 1;
}

- (BOOL)hasSleepDiscoveryMode
{
  return 0;
}

- (id)characteristicsSupportedForShortcutConditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v4 = [(HMService *)self currentCharacteristics];
  id v5 = [v4 array];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v11 = +[HMService characteristicBlacklistForShortcutConditions];
        id v12 = [v10 characteristicType];
        char v13 = [v11 containsObject:v12];

        if ((v13 & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)defaultCharacteristic
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMService *)self currentCharacteristics];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(HMService *)self _serviceTypeDescription];
    uint64_t v6 = +[HMService defaultCharacteristicByServiceDictionary];
    uint64_t v7 = objc_msgSend(v6, "hmf_stringForKey:", v5);

    if (v7)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = [(HMService *)self characteristicsSupportedForShortcutConditions];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          char v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
          long long v14 = [v13 _characteristicTypeDescription];
          char v15 = [v7 isEqualToString:v14];

          if (v15) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v16 = v13;

        if (v16) {
          goto LABEL_15;
        }
      }
      else
      {
LABEL_11:
      }
    }
    long long v17 = [(HMService *)self currentCharacteristics];
    long long v18 = [v17 array];
    id v16 = [v18 firstObject];

LABEL_15:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)setConfigurationState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_configurationState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)configurationState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t configurationState = self->_configurationState;
  os_unfair_lock_unlock(p_lock);
  return configurationState;
}

- (void)setServiceSubtype:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceSubtype = self->_serviceSubtype;
  self->_serviceSubtype = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setAssociatedServiceType:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  associatedServiceType = self->_associatedServiceType;
  self->_associatedServiceType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDefaultName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  defaultName = self->_defaultName;
  self->_defaultName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)defaultName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_defaultName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSString *)[v6 copy];
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)configuredName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setMatterEndpointID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSNumber *)[v6 copy];
  matterEndpointID = self->_matterEndpointID;
  self->_matterEndpointID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setServiceType:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceType = self->_serviceType;
  self->_serviceType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_unconfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring service", (uint8_t *)&v11, 0xCu);
    }
    [(HMService *)v5 setAccessory:0];
    [(HMService *)v5 setContext:0];
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (HMService)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2080;
    char v15 = "-[HMService init]";
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@%s is unsupported and will be removed in a future release", (uint8_t *)&v12, 0x16u);
  }
  id v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [HMAccessory alloc];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [(HMAccessory *)v7 initWithUUID:v8];
  uint64_t v10 = [(HMService *)self initWithUUID:v6 accessory:v9];

  return v10;
}

+ (id)_mapToIsConfiguredValueFromServiceConfigurationState:(int64_t)a3
{
  id v3 = &unk_1EEF08190;
  if (a3 != 3) {
    id v3 = 0;
  }
  if (a3 == 2) {
    return &unk_1EEF08178;
  }
  else {
    return v3;
  }
}

+ (int64_t)_mapToServiceConfigurationStateFromIsConfiguredValue:(id)a3
{
  if (!a3) {
    return 1;
  }
  uint64_t v3 = [a3 integerValue];
  int64_t v4 = 3;
  if (v3 != 1) {
    int64_t v4 = 1;
  }
  if (v3) {
    return v4;
  }
  else {
    return 2;
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t49 != -1) {
    dispatch_once(&logCategory__hmf_once_t49, &__block_literal_global_58049);
  }
  v2 = (void *)logCategory__hmf_once_v50;

  return v2;
}

uint64_t __24__HMService_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v50;
  logCategory__hmf_once_v50 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSSet)characteristicBlacklistForShortcutConditions
{
  [a1 initializeCharacteristicDictionaries];
  v2 = (void *)_characteristicBlacklistForShortcutConditions;

  return (NSSet *)v2;
}

+ (NSDictionary)defaultCharacteristicByServiceDictionary
{
  [a1 initializeCharacteristicDictionaries];
  v2 = (void *)_defaultCharacteristicByServiceDictionary;

  return (NSDictionary *)v2;
}

+ (void)initializeCharacteristicDictionaries
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMService_initializeCharacteristicDictionaries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeCharacteristicDictionaries_onceToken != -1) {
    dispatch_once(&initializeCharacteristicDictionaries_onceToken, block);
  }
}

void __49__HMService_initializeCharacteristicDictionaries__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 resourceURL];
  int64_t v4 = [v3 URLByAppendingPathComponent:@"DefaultCharacteristics.plist"];

  id v25 = 0;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4 error:&v25];
  id v6 = (__CFString *)v25;
  if (!v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v27 = v10;
      __int16 v28 = 2112;
      uint64_t v29 = v4;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot load default characteristic map from %@: %@", buf, 0x20u);
    }
  }
  uint64_t v11 = objc_msgSend(v5, "hmf_dictionaryForKey:", @"defaultCharacteristicByService");
  int v12 = (void *)_defaultCharacteristicByServiceDictionary;
  _defaultCharacteristicByServiceDictionary = v11;

  if (!_defaultCharacteristicByServiceDictionary)
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    char v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = @"defaultCharacteristicByService";
      __int16 v30 = 2112;
      id v31 = v4;
      __int16 v32 = 2112;
      uint64_t v33 = v5;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot load %@ map from %@: plist %@", buf, 0x2Au);
    }
  }
  long long v17 = (void *)MEMORY[0x1E4F1CAD0];
  long long v18 = objc_msgSend(v5, "hmf_arrayForKey:", @"characteristicBlacklistForShortcutConditions");
  uint64_t v19 = [v17 setWithArray:v18];
  long long v20 = (void *)_characteristicBlacklistForShortcutConditions;
  _characteristicBlacklistForShortcutConditions = v19;

  if (!_characteristicBlacklistForShortcutConditions)
  {
    long long v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = *(id *)(a1 + 32);
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v27 = v24;
      __int16 v28 = 2112;
      uint64_t v29 = @"characteristicBlacklistForShortcutConditions";
      __int16 v30 = 2112;
      id v31 = v4;
      __int16 v32 = 2112;
      uint64_t v33 = v5;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot load %@ map from %@: plist %@", buf, 0x2Au);
    }
  }
}

@end