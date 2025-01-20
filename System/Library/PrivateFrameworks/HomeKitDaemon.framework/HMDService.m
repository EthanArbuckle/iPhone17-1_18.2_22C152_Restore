@interface HMDService
+ (BOOL)_parseOperatingStateResponseValue:(id)a3 intoState:(id *)a4 abnormalReasons:(id *)a5;
+ (BOOL)_processUpdateOnPowerManagementServiceForCharacteristicType:(id)a3 value:(id)a4 serviceType:(id)a5 accessory:(id)a6 accessoryTransaction:(id)a7;
+ (BOOL)processUpdateForCharacteristicType:(id)a3 value:(id)a4 serviceType:(id)a5 service:(id)a6 serviceTransactionGetter:(id)a7 accessory:(id)a8 accessoryTransaction:(id)a9 accessoryTransactionChanged:(BOOL *)a10;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateProvidedName:(id)a3;
+ (id)generateUUIDWithAccessoryUUID:(id)a3 serviceID:(id)a4;
+ (id)logCategory;
- (BOOL)_supportsBulletinNotification;
- (BOOL)isCustom;
- (BOOL)isEmptyConfiguredNameAllowed;
- (BOOL)isHidden;
- (BOOL)isPrimary;
- (BOOL)isReadingRequiredForBTLEServiceCharacteristic:(id)a3;
- (BOOL)shouldEnableDaemonRelaunch;
- (BOOL)shouldIncludePresenceForDeviceWithDestination:(id)a3;
- (BOOL)shouldUpdateLastSeenConfiguredName:(id)a3;
- (BOOL)updateAssociatedServiceType:(id)a3 error:(id *)a4;
- (BOOL)updateCharacteristics:(id)a3;
- (HMDApplicationData)appData;
- (HMDBulletinBoardNotification)bulletinBoardNotification;
- (HMDHAPAccessory)accessory;
- (HMDService)init;
- (HMDService)initWithAccessory:(id)a3 owner:(id)a4 instance:(id)a5 uuid:(id)a6;
- (HMDService)initWithCoder:(id)a3;
- (HMDService)initWithTransaction:(id)a3 accessory:(id)a4 owner:(id)a5;
- (HMDServiceOwner)owner;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)characteristics;
- (NSArray)linkedServices;
- (NSArray)mediaSourceDisplayOrder;
- (NSDictionary)assistantObject;
- (NSMutableDictionary)deviceLastRequestPresenceDateMap;
- (NSNumber)configurationState;
- (NSNumber)instanceID;
- (NSNumber)labelIndex;
- (NSNumber)labelNamespace;
- (NSNumber)lastKnownDiscoveryMode;
- (NSNumber)lastKnownOperatingState;
- (NSNumber)lastKnownOperatingStateAbnormalReasons;
- (NSNumber)matterEndpointID;
- (NSNumber)mediaSourceIdentifier;
- (NSString)associatedServiceType;
- (NSString)configuredName;
- (NSString)contextID;
- (NSString)defaultName;
- (NSString)description;
- (NSString)expectedConfiguredName;
- (NSString)lastSeenConfiguredName;
- (NSString)logID;
- (NSString)name;
- (NSString)providedName;
- (NSString)serviceIdentifier;
- (NSString)serviceSubtype;
- (NSString)serviceType;
- (NSString)type;
- (NSString)urlString;
- (NSUUID)cachedAccessoryUUID;
- (NSUUID)contextSPIUniqueIdentifier;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_checkIfDefaultNameChanged;
- (id)_deriveDefaultName;
- (id)_initWithCoder:(id)a3;
- (id)_messagesForConfiguredNameChange;
- (id)_sanitizeNameToWriteToAccessory:(id)a3;
- (id)_serviceSubtypeFromLinkedServicesForServiceType:(id)a3 accessoryCategory:(id)a4;
- (id)_updateProvidedName:(id)a3;
- (id)backingStoreObjects:(int64_t)a3;
- (id)configureWithService:(id)a3 accessory:(id)a4;
- (id)configureWithService:(id)a3 accessory:(id)a4 shouldRead:(BOOL)a5 added:(BOOL)a6;
- (id)dumpState;
- (id)findCharacteristic:(id)a3;
- (id)findCharacteristicWithType:(id)a3;
- (id)gatherRequiredReadRequestsForceReadFWVersion:(BOOL)a3;
- (id)getConfiguredName;
- (id)getConfiguredNameForXPCClients;
- (id)getLastSeenConfiguredName;
- (id)home;
- (id)logIdentifier;
- (id)messagesForUpdatedRoom:(id)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)nameChangedMessage;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (unint64_t)serviceProperties;
- (void)_createAndRunTransactionWithName:(id)a3 transaction:(id)a4 message:(id)a5;
- (void)_createNotification;
- (void)_encodeWithCoder:(id)a3;
- (void)_handleSetAppData:(id)a3;
- (void)_processTransactionForNameComponents:(id)a3 messagesToSendToAccessory:(id)a4 result:(id)a5;
- (void)_readRequiredCharacteristicValuesForceReadFWVersion:(BOOL)a3;
- (void)_recalculateUUID;
- (void)_registerForMessages;
- (void)_saveCurrentNameAsExpectedAndLastSeen:(id)a3;
- (void)_saveForExpectedConfiguredNameUpdate;
- (void)_saveForLastSeenConfiguredNameUpdate;
- (void)_saveLastSeenAndExpectedConfiguredName:(id)a3;
- (void)_shouldServiceBeHidden;
- (void)_transactionServiceUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)_updateDefaultName;
- (void)_writeConfiguredNameToAccessory:(id)a3;
- (void)appDataRemoved:(id)a3 message:(id)a4;
- (void)appDataUpdated:(id)a3 message:(id)a4;
- (void)configureBulletinNotification;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fillCharacteristicsInServiceBackingStoreObject:(id)a3;
- (void)persistMediaSourceDisplayOrder:(id)a3 requestMessage:(id)a4;
- (void)populateModelObjectWithChangeType:(id)a3 version:(int64_t)a4;
- (void)setAppData:(id)a3;
- (void)setBulletinBoardNotification:(id)a3;
- (void)setCachedAccessoryUUID:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setConfigurationState:(id)a3;
- (void)setConfiguredName:(id)a3;
- (void)setDefaultName:(id)a3;
- (void)setDeviceLastRequestPresenceDateMap:(id)a3;
- (void)setExpectedConfiguredName:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInstanceID:(id)a3;
- (void)setLabelIndex:(id)a3;
- (void)setLabelNamespace:(id)a3;
- (void)setLastKnownDiscoveryMode:(id)a3;
- (void)setLastKnownOperatingState:(id)a3;
- (void)setLastKnownOperatingStateAbnormalReasons:(id)a3;
- (void)setLastSeenConfiguredName:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setMatterEndpointID:(id)a3;
- (void)setMediaSourceDisplayOrder:(id)a3;
- (void)setMediaSourceIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setProvidedName:(id)a3;
- (void)setServiceProperties:(unint64_t)a3;
- (void)setServiceSubtype:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unconfigure;
- (void)updateLastKnownValues;
- (void)updatePresenceRequestTimeForDeviceWithDestination:(id)a3;
@end

@implementation HMDService

- (NSUUID)contextSPIUniqueIdentifier
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = +[HMDProcessInfo privateClientIdentifierSalt];
  v4 = (void *)MEMORY[0x263F08C38];
  v5 = [(HMDService *)self accessory];
  v6 = [v5 contextSPIUniqueIdentifier];
  v7 = NSString;
  v8 = [(HMDService *)self instanceID];
  v9 = [v7 stringWithFormat:@"%@", v8];
  v13[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v6, v3, v10);

  return (NSUUID *)v11;
}

- (NSString)contextID
{
  v3 = NSString;
  v4 = [(HMDService *)self accessory];
  v5 = [v4 contextID];
  v6 = [(HMDService *)self instanceID];
  v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_deviceLastRequestPresenceDateMap, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingStateAbnormalReasons, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingState, 0);
  objc_storeStrong((id *)&self->_lastKnownDiscoveryMode, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_cachedAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, 0);
  objc_storeStrong((id *)&self->_mediaSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotification, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_matterEndpointID, 0);
  objc_storeStrong((id *)&self->_defaultName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_providedName, 0);
  objc_storeStrong((id *)&self->_lastSeenConfiguredName, 0);
  objc_storeStrong((id *)&self->_expectedConfiguredName, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_configurationState, 0);
  objc_storeStrong((id *)&self->_serviceSubtype, 0);
  objc_storeStrong((id *)&self->_labelNamespace, 0);
  objc_storeStrong((id *)&self->_labelIndex, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_appData, 0);
}

- (NSString)logID
{
  return self->_logID;
}

- (void)setDeviceLastRequestPresenceDateMap:(id)a3
{
}

- (NSMutableDictionary)deviceLastRequestPresenceDateMap
{
  return self->_deviceLastRequestPresenceDateMap;
}

- (void)setLastKnownOperatingStateAbnormalReasons:(id)a3
{
}

- (NSNumber)lastKnownOperatingStateAbnormalReasons
{
  return self->_lastKnownOperatingStateAbnormalReasons;
}

- (void)setLastKnownOperatingState:(id)a3
{
}

- (NSNumber)lastKnownOperatingState
{
  return self->_lastKnownOperatingState;
}

- (void)setLastKnownDiscoveryMode:(id)a3
{
}

- (NSNumber)lastKnownDiscoveryMode
{
  return self->_lastKnownDiscoveryMode;
}

- (void)setOwner:(id)a3
{
}

- (HMDServiceOwner)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (HMDServiceOwner *)WeakRetained;
}

- (void)setCachedAccessoryUUID:(id)a3
{
}

- (NSUUID)cachedAccessoryUUID
{
  return self->_cachedAccessoryUUID;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setMediaSourceDisplayOrder:(id)a3
{
}

- (NSArray)mediaSourceDisplayOrder
{
  return self->_mediaSourceDisplayOrder;
}

- (void)setMediaSourceIdentifier:(id)a3
{
}

- (NSNumber)mediaSourceIdentifier
{
  return self->_mediaSourceIdentifier;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setBulletinBoardNotification:(id)a3
{
}

- (HMDBulletinBoardNotification)bulletinBoardNotification
{
  return self->_bulletinBoardNotification;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setLinkedServices:(id)a3
{
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (NSString)associatedServiceType
{
  return self->_associatedServiceType;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setMatterEndpointID:(id)a3
{
}

- (NSNumber)matterEndpointID
{
  return self->_matterEndpointID;
}

- (void)setDefaultName:(id)a3
{
}

- (NSString)defaultName
{
  return self->_defaultName;
}

- (void)setName:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setConfigurationState:(id)a3
{
}

- (NSNumber)configurationState
{
  return self->_configurationState;
}

- (void)setServiceSubtype:(id)a3
{
}

- (NSString)serviceSubtype
{
  return self->_serviceSubtype;
}

- (void)setLabelNamespace:(id)a3
{
}

- (NSNumber)labelNamespace
{
  return self->_labelNamespace;
}

- (void)setLabelIndex:(id)a3
{
}

- (NSNumber)labelIndex
{
  return self->_labelIndex;
}

- (void)setInstanceID:(id)a3
{
}

- (BOOL)shouldUpdateLastSeenConfiguredName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDService *)self lastSeenConfiguredName];
  char v6 = HMFEqualObjects();

  return v6 ^ 1;
}

- (void)_writeConfiguredNameToAccessory:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HMDService *)self owner];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMDService__writeConfiguredNameToAccessory___block_invoke;
  v7[3] = &unk_264A2CB70;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 makeServiceNameConsistent:self withName:v6 completionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__HMDService__writeConfiguredNameToAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138543874;
      v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to update configured name to %@ - error %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    if (v8)
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully updated configured name and last seen configured name to %@", (uint8_t *)&v13, 0x16u);
    }
    [v6 setConfiguredName:*(void *)(a1 + 32)];
    [v6 setLastSeenConfiguredName:*(void *)(a1 + 32)];
    [v6 _saveForLastSeenConfiguredNameUpdate];
  }
}

- (void)_saveCurrentNameAsExpectedAndLastSeen:(id)a3
{
  id v4 = a3;
  id v8 = [(HMDService *)self owner];
  v5 = [(HMDService *)self uuid];
  id v6 = [v8 createUpdateServiceTransactionWithServiceUUID:v5];

  [v6 setLastSeenConfiguredNameLocal:v4];
  v7 = [v8 backingStoreTransactionWithName:@"NewNameOnPairVerify"];
  [v7 add:v6 withMessage:0];
  [v7 run];
}

- (id)backingStoreObjects:(int64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = [(HMDService *)self modelObjectWithChangeType:1];
  [v5 addObject:v6];

  v7 = [(HMDService *)self appData];

  if (a3 >= 3 && v7)
  {
    id v8 = [(HMDService *)self appData];
    id v9 = [v8 modelObjectWithChangeType:1];
    [v5 addObject:v9];
  }
  return v5;
}

- (void)fillCharacteristicsInServiceBackingStoreObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDService *)self characteristics];
  if ([v5 count])
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "getCharacteristicDictionary", (void)v15);
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }
  int v13 = +[HMDCharacteristic sortComparatorForCharacteristicDictionary];
  [v6 sortUsingComparator:v13];

  v14 = (void *)[v6 copy];
  [v4 setCharacteristics:v14];
}

- (void)populateModelObjectWithChangeType:(id)a3 version:(int64_t)a4
{
  id v26 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v26;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [(HMDService *)self name];
  [v7 setName:v8];

  uint64_t v9 = [(HMDService *)self instanceID];
  [v7 setInstanceID:v9];

  uint64_t v10 = [(HMDService *)self providedName];
  [v7 setProvidedName:v10];

  uint64_t v11 = [(HMDService *)self serviceType];
  [v7 setServiceType:v11];

  uint64_t v12 = [(HMDService *)self associatedServiceType];
  [v7 setAssociatedServiceType:v12];

  int v13 = [(HMDService *)self serviceSubtype];
  [v7 setServiceSubtype:v13];

  v14 = [(HMDService *)self labelIndex];
  [v7 setLabelIndex:v14];

  long long v15 = [(HMDService *)self labelNamespace];
  [v7 setLabelNamespace:v15];

  long long v16 = [(HMDService *)self linkedServices];
  long long v17 = (void *)[v16 copy];
  [v7 setLinkedServices:v17];

  long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDService serviceProperties](self, "serviceProperties"));
  [v7 setServiceProperties:v18];

  uint64_t v19 = [(HMDService *)self matterEndpointID];
  [v7 setMatterEndpointID:v19];

  if (a4 >= 4)
  {
    uint64_t v20 = [(HMDService *)self configurationState];
    [v7 setConfigurationState:v20];

    v21 = [(HMDService *)self expectedConfiguredName];
    [v7 setExpectedConfiguredName:v21];

    v22 = [(HMDService *)self lastKnownOperatingState];
    [v7 setLastKnownOperatingState:v22];

    v23 = [(HMDService *)self lastKnownOperatingStateAbnormalReasons];
    [v7 setLastKnownOperatingStateAbnormalReasons:v23];

    v24 = [(HMDService *)self mediaSourceIdentifier];
    [v7 setMediaSourceIdentifier:v24];

    v25 = [(HMDService *)self mediaSourceDisplayOrder];
    [v7 setMediaSourceDisplayOrder:v25];
  }
  [(HMDService *)self fillCharacteristicsInServiceBackingStoreObject:v7];
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  id v4 = [(HMDService *)self transactionWithObjectChangeType:a3];
  [(HMDService *)self populateModelObjectWithChangeType:v4 version:4];
  return v4;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  v5 = [HMDServiceTransaction alloc];
  id v6 = [(HMDService *)self uuid];
  id v7 = [(HMDService *)self accessory];
  uint64_t v8 = [v7 uuid];
  uint64_t v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (void)_registerForMessages
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDService *)self home];
  id v4 = [v3 administratorHandler];
  v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v8[0] = v5;
  id v6 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:7];
  v8[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v4 registerForMessage:@"kSetAppDataRequestKey" receiver:self policies:v7 selector:sel__handleSetAppData_];
}

- (void)_createAndRunTransactionWithName:(id)a3 transaction:(id)a4 message:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(HMDService *)self owner];
  id v12 = [v11 backingStoreTransactionWithName:v10];

  [v12 add:v9 withMessage:v8];
  [v12 run];
}

- (void)persistMediaSourceDisplayOrder:(id)a3 requestMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDService *)self owner];
  id v9 = [(HMDService *)self uuid];
  id v10 = [v8 createUpdateServiceTransactionWithServiceUUID:v9];

  [v10 setMediaSourceDisplayOrder:v7];
  [(HMDService *)self _createAndRunTransactionWithName:@"PersistMediaSourceDisplayOrder" transaction:v10 message:v6];
}

- (BOOL)isEmptyConfiguredNameAllowed
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(HMDService *)self characteristics];
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    char v4 = 0;
    char v5 = 0;
    uint64_t v6 = *(void *)v19;
    uint64_t v7 = *MEMORY[0x263F0C000];
    uint64_t v8 = *MEMORY[0x263F35500];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      uint64_t v11 = [v10 type];
      char v12 = [v11 isEqualToString:v7];

      if (v12)
      {
        char v4 = 1;
        if (v5) {
          goto LABEL_10;
        }
      }
      else
      {
        int v13 = [v10 type];
        char v14 = [v13 isEqualToString:v8];

        v5 |= v14;
        if (v5)
        {
LABEL_10:
          if (v4)
          {
            BOOL v15 = 1;
            goto LABEL_15;
          }
        }
      }
      if (v3 == ++v9)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)updateCharacteristics:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37 = [MEMORY[0x263EFF980] array];
  v41 = [MEMORY[0x263EFF9A0] dictionary];
  char v5 = [(HMDService *)self characteristics];
  v44 = (void *)[v5 mutableCopy];

  v45 = [MEMORY[0x263EFF980] array];
  v39 = self;
  v40 = [(HMDService *)self accessory];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v4;
  uint64_t v46 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v46)
  {
    int v42 = 0;
    uint64_t v43 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v8 = [v7 objectForKeyedSubscript:@"characteristicType"];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v9 = v44;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v67 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v57;
LABEL_8:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v57 != v12) {
              objc_enumerationMutation(v9);
            }
            char v14 = *(void **)(*((void *)&v56 + 1) + 8 * v13);
            BOOL v15 = [v14 characteristicType];
            char v16 = [v15 isEqual:v8];

            if (v16) {
              break;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v67 count:16];
              if (v11) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          long long v17 = v14;

          if (!v17) {
            goto LABEL_17;
          }
          v42 |= [(HMDCharacteristic *)v17 updateWithDictionary:v7];
          [v9 removeObject:v17];
        }
        else
        {
LABEL_14:

LABEL_17:
          long long v17 = [[HMDCharacteristic alloc] initWithCharacteristic:v7 service:v39 accessory:v40];
          long long v18 = encodeRootObjectForIncomingXPCMessage(v17, 0);
          long long v19 = [(HMDCharacteristic *)v17 instanceID];
          [v41 setObject:v18 forKeyedSubscript:v19];
        }
        [v45 addObject:v17];
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v46);
  }
  else
  {
    LOBYTE(v42) = 0;
  }

  long long v20 = (void *)MEMORY[0x230FBD990]([(HMDService *)v39 setCharacteristics:v45]);
  long long v21 = v39;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v66 = v23;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification registrations because characteristics changed", buf, 0xCu);
  }
  v24 = [(HMDService *)v21 bulletinBoardNotification];
  [v24 updateRegistrations];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v25 = v44;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
  char v27 = v42;
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(v25);
        }
        v31 = [*(id *)(*((void *)&v52 + 1) + 8 * j) instanceID];
        [v37 addObject:v31];
      }
      uint64_t v28 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v28);
  }

  v32 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  if ([v37 count])
  {
    [v32 setObject:v37 forKey:@"kRemovedCharacteristicIDsForAccessoryKey"];
    char v27 = 1;
  }
  if ([v41 count])
  {
    [v32 setObject:v41 forKey:@"kAddedCharacteristicsForAccessoryKey"];
    char v27 = 1;
  }
  v33 = [(HMDService *)v21 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HMDService_updateCharacteristics___block_invoke;
  block[3] = &unk_264A2B1D8;
  id v48 = v40;
  v49 = v21;
  id v50 = v32;
  char v51 = v27 & 1;
  id v34 = v32;
  id v35 = v40;
  dispatch_async(v33, block);

  return v27 & 1;
}

void __36__HMDService_updateCharacteristics___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) configureService:*(void *)(a1 + 40)];
  if ([v2 count]) {
    [*(id *)(a1 + 48) setObject:v2 forKey:@"kModifiedCharacteristicsForAccessoryKey"];
  }
  if (*(unsigned char *)(a1 + 56) || [v2 count])
  {
    [*(id *)(a1 + 40) _shouldServiceBeHidden];
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      char v16 = @"kCharacteristicAndValueKey";
      uint64_t v3 = [*(id *)(a1 + 40) instanceID];
      char v14 = v3;
      id v4 = (void *)[*(id *)(a1 + 48) copy];
      BOOL v15 = v4;
      char v5 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      v17[0] = v5;
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

      id v7 = objc_alloc(MEMORY[0x263F42570]);
      uint64_t v8 = [*(id *)(a1 + 32) uuid];
      id v9 = (void *)[v7 initWithTarget:v8];

      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F42590]) initWithName:@"kCharacteristicsUpdatedNotificationKey" destination:v9 payload:v6];
      uint64_t v11 = [[HMDHomeManagerXPCMessageSendPolicy alloc] initWithEntitlements:1 options:1537];
      [v10 setSendPolicy:v11];
      uint64_t v12 = [*(id *)(a1 + 40) accessory];
      uint64_t v13 = [v12 msgDispatcher];
      [v13 sendMessage:v10];
    }
    logAndPostNotification(@"kHMDNotificationCharacteristicsUpdated", *(void **)(a1 + 32), 0);
  }
}

- (void)appDataRemoved:(id)a3 message:(id)a4
{
  id v5 = a4;
  [(HMDService *)self setAppData:0];
  id v6 = [v5 transactionResult];
  [v6 markChanged];
  [v5 respondWithPayload:0];
}

- (void)appDataUpdated:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDService *)self appData];

  if (v8)
  {
    id v9 = [(HMDService *)self appData];
    [v9 updateWithModel:v6];
  }
  else
  {
    uint64_t v10 = [HMDApplicationData alloc];
    uint64_t v11 = [v6 appDataDictionary];
    uint64_t v12 = [(HMDService *)self uuid];
    uint64_t v13 = [(HMDApplicationData *)v10 initWithDictionary:v11 parentUUID:v12];
    [(HMDService *)self setAppData:v13];

    char v14 = (void *)MEMORY[0x230FBD990]();
    BOOL v15 = self;
    char v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      long long v17 = HMFGetLogIdentifier();
      long long v18 = [v6 appDataDictionary];
      int v20 = 138543618;
      long long v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);
    }
  }
  long long v19 = [v7 transactionResult];
  [v19 markChanged];
  [v7 respondWithPayload:0];
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [(HMDService *)self appDataRemoved:v10 message:v7];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v14 = HMFGetLogIdentifier();
      int v19 = 138543874;
      int v20 = v14;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = (id)objc_opt_class();
      id v15 = v24;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v19, 0x20u);
    }
    char v16 = [v7 responseHandler];

    if (v16)
    {
      long long v17 = [v7 responseHandler];
      long long v18 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      ((void (**)(void, void *, void))v17)[2](v17, v18, 0);
    }
  }
}

- (void)_transactionServiceUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  v151[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v134 = a5;
  id v10 = [v134 transactionResult];
  uint64_t v11 = (void *)MEMORY[0x263EFF980];
  uint64_t v12 = +[HMDHAPAccessoryTransaction properties];
  uint64_t v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

  v131 = v8;
  char v14 = [v8 configurationTracker];
  id v15 = v14;
  if (v14) {
    dispatch_group_enter(v14);
  }
  [(HMDService *)self _processTransactionForNameComponents:v9 messagesToSendToAccessory:v13 result:v10];
  uint64_t v16 = [v9 serviceType];
  if (v16)
  {
    long long v17 = (void *)v16;
    long long v18 = [(HMDService *)self serviceType];
    int v19 = [v9 serviceType];
    char v20 = [v18 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      [v10 markChanged];
      [v10 markSaveToAssistant];
      __int16 v21 = [v9 serviceType];
      [(HMDService *)self setServiceType:v21];
    }
  }
  uint64_t v22 = [v9 matterEndpointID];
  if (v22)
  {
    __int16 v23 = (void *)v22;
    id v24 = [(HMDService *)self matterEndpointID];
    uint64_t v25 = [v9 matterEndpointID];
    char v26 = HMFEqualObjects();

    if ((v26 & 1) == 0)
    {
      char v27 = [v9 matterEndpointID];
      [(HMDService *)self setMatterEndpointID:v27];

      [v10 markChanged];
    }
  }
  if ([v9 propertyWasSet:@"associatedServiceType"])
  {
    uint64_t v28 = [v9 associatedServiceType];
    uint64_t v29 = [(HMDService *)self associatedServiceType];
    char v30 = HMFEqualObjects();

    if ((v30 & 1) == 0)
    {
      v31 = [v9 associatedServiceType];
      associatedServiceType = self->_associatedServiceType;
      self->_associatedServiceType = v31;

      [v10 markChanged];
      [v10 markSaveToAssistant];
    }
  }
  uint64_t v33 = [v9 serviceSubtype];
  if (v33)
  {
    id v34 = (void *)v33;
    id v35 = [(HMDService *)self serviceSubtype];
    v36 = [v9 serviceSubtype];
    char v37 = [v35 isEqual:v36];

    if ((v37 & 1) == 0)
    {
      [v10 markChanged];
      [v10 markSaveToAssistant];
      v38 = [v9 serviceSubtype];
      [(HMDService *)self setServiceSubtype:v38];

      v150[0] = @"kServiceInstanceID";
      v39 = [(HMDService *)self instanceID];
      v151[0] = v39;
      v150[1] = *MEMORY[0x263F0EB78];
      v40 = [v9 serviceSubtype];
      v151[1] = v40;
      v41 = [NSDictionary dictionaryWithObjects:v151 forKeys:v150 count:2];

      int v42 = (void *)MEMORY[0x263F42568];
      uint64_t v43 = *MEMORY[0x263F0EB80];
      v44 = [v134 identifier];
      v45 = [v42 entitledMessageWithName:v43 identifier:v44 messagePayload:v41];

      [v13 addObject:v45];
    }
  }
  uint64_t v46 = [v9 labelIndex];
  if (v46)
  {
    v47 = (void *)v46;
    id v48 = [(HMDService *)self labelIndex];
    v49 = [v9 labelIndex];
    char v50 = [v48 isEqual:v49];

    if ((v50 & 1) == 0)
    {
      [v10 markChanged];
      [v10 markSaveToAssistant];
      char v51 = [v9 labelIndex];
      [(HMDService *)self setLabelIndex:v51];

      long long v52 = [(HMDService *)self _checkIfDefaultNameChanged];
      if (v52) {
        [v13 addObject:v52];
      }
    }
  }
  uint64_t v53 = [v9 labelNamespace];
  if (v53)
  {
    long long v54 = (void *)v53;
    long long v55 = [(HMDService *)self labelNamespace];
    long long v56 = [v9 labelNamespace];
    char v57 = [v55 isEqual:v56];

    if ((v57 & 1) == 0)
    {
      [v10 markChanged];
      [v10 markSaveToAssistant];
      long long v58 = [v9 labelNamespace];
      [(HMDService *)self setLabelNamespace:v58];
    }
  }
  uint64_t v59 = [v9 configurationState];
  if (v59)
  {
    long long v60 = (void *)v59;
    long long v61 = [(HMDService *)self configurationState];
    long long v62 = [v9 configurationState];
    char v63 = [v61 isEqual:v62];

    if ((v63 & 1) == 0)
    {
      [v10 markChanged];
      [v10 markSaveToAssistant];
      v64 = [v9 configurationState];
      [(HMDService *)self setConfigurationState:v64];

      v148[0] = @"kServiceInstanceID";
      v65 = [(HMDService *)self instanceID];
      v149[0] = v65;
      v148[1] = *MEMORY[0x263F0EB00];
      v66 = [v9 configurationState];
      v149[1] = v66;
      v67 = [NSDictionary dictionaryWithObjects:v149 forKeys:v148 count:2];

      v68 = (void *)MEMORY[0x263F42568];
      uint64_t v69 = *MEMORY[0x263F0EB08];
      v70 = [v134 identifier];
      v71 = [v68 entitledMessageWithName:v69 identifier:v70 messagePayload:v67];

      [v13 addObject:v71];
    }
  }
  uint64_t v72 = [v9 linkedServices];
  if (v72)
  {
    v73 = (void *)v72;
    v74 = [(HMDService *)self linkedServices];
    v75 = [v9 linkedServices];
    char v76 = [v74 isEqualToArray:v75];

    if ((v76 & 1) == 0)
    {
      v77 = [v9 linkedServices];
      [(HMDService *)self setLinkedServices:v77];

      [v10 markChanged];
      [v10 markSaveToAssistant];
    }
  }
  v78 = [(HMDService *)self accessory];
  uint64_t v79 = [v9 serviceProperties];
  if (v79)
  {
    v80 = (void *)v79;
    unint64_t v81 = [(HMDService *)self serviceProperties];
    v82 = [v9 serviceProperties];
    uint64_t v83 = [v82 unsignedIntegerValue];

    if (v81 != v83)
    {
      [v10 markChanged];
      v84 = [v9 serviceProperties];
      -[HMDService setServiceProperties:](self, "setServiceProperties:", [v84 unsignedIntegerValue]);

      LODWORD(v84) = [(HMDService *)self isPrimary];
      [(HMDService *)self setPrimary:[(HMDService *)self serviceProperties] & 1];
      if (v84 != [(HMDService *)self isPrimary]) {
        [v78 updatePrimaryServiceIfNeeded];
      }
      [(HMDService *)self _shouldServiceBeHidden];
    }
  }
  int v129 = [v78 supportsTargetController];
  if ([v9 propertyWasSet:@"lastKnownOperatingState"])
  {
    v85 = [v9 lastKnownOperatingState];
    v86 = [(HMDService *)self lastKnownOperatingState];
    char v87 = HMFEqualObjects();

    if ((v87 & 1) == 0)
    {
      v88 = [v9 lastKnownOperatingState];
      [(HMDService *)self setLastKnownOperatingState:v88];

      [v10 markChanged];
    }
  }
  if ([v9 propertyWasSet:@"lastKnownOperatingStateAbnormalReasons"])
  {
    v89 = [v9 lastKnownOperatingStateAbnormalReasons];
    v90 = [(HMDService *)self lastKnownOperatingStateAbnormalReasons];
    char v91 = HMFEqualObjects();

    if ((v91 & 1) == 0)
    {
      v92 = [v9 lastKnownOperatingStateAbnormalReasons];
      [(HMDService *)self setLastKnownOperatingStateAbnormalReasons:v92];

      [v10 markChanged];
    }
  }
  v133 = v78;
  uint64_t v93 = [v9 mediaSourceIdentifier];
  if (v93)
  {
    v94 = (void *)v93;
    v95 = [v9 mediaSourceIdentifier];
    v96 = [(HMDService *)self mediaSourceIdentifier];
    char v97 = [v95 isEqual:v96];

    if ((v97 & 1) == 0)
    {
      v98 = [v9 mediaSourceIdentifier];
      [(HMDService *)self setMediaSourceIdentifier:v98];

      v146[0] = @"kServiceInstanceID";
      v99 = [(HMDService *)self instanceID];
      v147[0] = v99;
      v146[1] = *MEMORY[0x263F0D598];
      v100 = [v9 mediaSourceIdentifier];
      v147[1] = v100;
      v101 = [NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:2];

      v102 = [MEMORY[0x263F42568] messageWithName:*MEMORY[0x263F0D5A0] messagePayload:v101];
      [v13 addObject:v102];

      [v10 markChanged];
    }
  }
  v103 = v13;
  v104 = v134;
  v105 = [v134 name];
  int v106 = [v105 isEqualToString:*MEMORY[0x263F0DB50]];

  uint64_t v107 = [v9 mediaSourceDisplayOrder];
  if (!v107) {
    goto LABEL_45;
  }
  v108 = (void *)v107;
  v109 = [v9 mediaSourceDisplayOrder];
  v110 = [(HMDService *)self mediaSourceDisplayOrder];
  char v111 = [v109 isEqualToArray:v110];

  v104 = v134;
  if ((v111 & 1) == 0)
  {
    v112 = [v9 mediaSourceDisplayOrder];
    [(HMDService *)self setMediaSourceDisplayOrder:v112];

    [v10 markChanged];
  }
  else
  {
LABEL_45:
    if (!v106) {
      goto LABEL_49;
    }
  }
  v144[0] = @"kServiceInstanceID";
  v113 = [(HMDService *)self instanceID];
  v145[0] = v113;
  v144[1] = *MEMORY[0x263F0DB48];
  v114 = [v9 mediaSourceDisplayOrder];
  v145[1] = v114;
  v115 = [NSDictionary dictionaryWithObjects:v145 forKeys:v144 count:2];

  v116 = [MEMORY[0x263F42568] messageWithName:*MEMORY[0x263F0DB58] messagePayload:v115];
  [v103 addObject:v116];

LABEL_49:
  v117 = [v9 characteristics];

  if (v117)
  {
    v118 = [v9 characteristics];
    BOOL v119 = [(HMDService *)self updateCharacteristics:v118];

    if (v119)
    {
      [v10 markChanged];
      [v10 markSaveToAssistant];
    }
  }
  v130 = v10;
  v120 = dispatch_group_create();
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id obj = v103;
  uint64_t v121 = [obj countByEnumeratingWithState:&v139 objects:v143 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v140;
    do
    {
      for (uint64_t i = 0; i != v122; ++i)
      {
        if (*(void *)v140 != v123) {
          objc_enumerationMutation(obj);
        }
        v125 = *(void **)(*((void *)&v139 + 1) + 8 * i);
        dispatch_group_enter(v120);
        if (v104)
        {
          v126 = [v104 identifier];
          [v125 setIdentifier:v126];
        }
        v127 = [v133 msgDispatcher];
        v128 = [v133 uuid];
        v137[0] = MEMORY[0x263EF8330];
        v137[1] = 3221225472;
        v137[2] = __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke;
        v137[3] = &unk_264A2F7F8;
        v138 = v120;
        [v127 sendMessage:v125 target:v128 andInvokeCompletionHandler:v137];

        v104 = v134;
      }
      uint64_t v122 = [obj countByEnumeratingWithState:&v139 objects:v143 count:16];
    }
    while (v122);
  }

  dispatch_group_wait(v120, 0);
  [v104 respondWithPayload:0];
  if (v15) {
    dispatch_group_leave(v15);
  }
  if (v129 != [v133 supportsTargetController])
  {
    v135[0] = MEMORY[0x263EF8330];
    v135[1] = 3221225472;
    v135[2] = __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke_2;
    v135[3] = &unk_264A2F3E8;
    id v136 = v133;
    [v136 configureTargetControllerWithCompletion:v135];
  }
}

void __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke(uint64_t a1)
{
}

void __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke_2(uint64_t a1)
{
}

- (void)_processTransactionForNameComponents:(id)a3 messagesToSendToAccessory:(id)a4 result:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDService *)self name];
  uint64_t v12 = [(HMDService *)self getConfiguredNameForXPCClients];
  uint64_t v13 = [v8 lastSeenConfiguredNameLocal];

  if (v13)
  {
    char v14 = [(HMDService *)self lastSeenConfiguredName];
    id v15 = [v8 lastSeenConfiguredNameLocal];
    char v16 = HMFEqualObjects();

    if (v16)
    {
      long long v17 = [v8 setProperties];
      int v18 = [v17 containsObject:@"expectedConfiguredName"];

      if (v18)
      {
        int v19 = [v8 expectedConfiguredName];
        [(HMDService *)self setExpectedConfiguredName:v19];
      }
      int v20 = 0;
      goto LABEL_15;
    }
    id v35 = [v8 lastSeenConfiguredNameLocal];
    v36 = objc_msgSend(v35, "hm_truncatedNameString");
    [(HMDService *)self _saveLastSeenAndExpectedConfiguredName:v36];

    [(HMDService *)self _saveForExpectedConfiguredNameUpdate];
LABEL_14:
    int v20 = 1;
    goto LABEL_15;
  }
  __int16 v21 = [v8 setProperties];
  int v22 = [v21 containsObject:@"expectedConfiguredName"];

  v64 = v9;
  if (!v22)
  {
    v39 = [v8 setProperties];
    int v40 = [v39 containsObject:@"name"];

    if (v40
      && ([(HMDService *)self getConfiguredName],
          v41 = objc_claimAutoreleasedReturnValue(),
          [v8 name],
          int v42 = objc_claimAutoreleasedReturnValue(),
          char v43 = HMFEqualObjects(),
          v42,
          v41,
          (v43 & 1) == 0))
    {
      v49 = [v8 name];
      [(HMDService *)self setConfiguredName:v49];

      int v20 = 1;
    }
    else
    {
      int v20 = 0;
    }
    uint64_t v50 = [v8 providedName];
    if (!v50)
    {
      id v9 = v64;
      goto LABEL_15;
    }
    char v51 = (void *)v50;
    long long v52 = [(HMDService *)self providedName];
    uint64_t v53 = [v8 providedName];
    char v54 = [v52 isEqual:v53];

    id v9 = v64;
    if ((v54 & 1) == 0)
    {
      long long v55 = [(HMDService *)self providedName];
      long long v56 = [v8 providedName];
      char v57 = objc_msgSend(v56, "hm_truncatedNameString");
      long long v58 = [(HMDService *)self _updateProvidedName:v57];

      id v9 = v64;
      if (v58) {
        [v64 addObject:v58];
      }
      if (v55)
      {
        uint64_t v59 = [(HMDService *)self _checkIfDefaultNameChanged];

        if (v59)
        {
          [v64 addObject:v59];
          long long v58 = (void *)v59;
        }
        else
        {
          long long v58 = 0;
        }
      }

      goto LABEL_14;
    }
    goto LABEL_15;
  }
  __int16 v23 = [(HMDService *)self expectedConfiguredName];
  id v24 = [v8 expectedConfiguredName];
  int v25 = HMFEqualObjects();

  if ((v25 & 1) == 0)
  {
    char v26 = [v8 expectedConfiguredName];
    uint64_t v27 = objc_msgSend(v26, "hm_truncatedNameString");

    context = (void *)MEMORY[0x230FBD990]();
    uint64_t v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    char v63 = (void *)v27;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      char v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v66 = v30;
      __int16 v67 = 2112;
      v68 = v63;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Updating expected configured name to %@", buf, 0x16u);

      uint64_t v27 = (uint64_t)v63;
    }

    [(HMDService *)v28 setExpectedConfiguredName:v27];
    v31 = [(HMDService *)v28 accessory];
    v32 = [v31 home];
    if ([v32 isOwnerUser])
    {
      [(HMDService *)v28 getConfiguredName];
      uint64_t v33 = contexta = v25;
      id v34 = [(HMDService *)v28 lastSeenConfiguredName];
      int v60 = HMFEqualObjects();

      id v9 = v64;
      int v25 = contexta;

      if (!v60)
      {
LABEL_24:

        goto LABEL_25;
      }
      v31 = [(HMDService *)v28 _sanitizeNameToWriteToAccessory:v63];
      [(HMDService *)v28 _writeConfiguredNameToAccessory:v31];
    }
    else
    {
    }
    goto LABEL_24;
  }
LABEL_25:
  v44 = [v8 setProperties];
  int v20 = v25 ^ 1;
  if (![v44 containsObject:@"name"])
  {

    goto LABEL_15;
  }
  v45 = [(HMDService *)self getConfiguredName];
  uint64_t v46 = [v8 name];
  char v47 = HMFEqualObjects();

  id v9 = v64;
  if ((v47 & 1) == 0)
  {
    id v48 = [v8 name];
    [(HMDService *)self setConfiguredName:v48];

    id v9 = v64;
    goto LABEL_14;
  }
LABEL_15:
  char v37 = [(HMDService *)self name];
  v38 = [(HMDService *)self getConfiguredNameForXPCClients];
  if (!HMFEqualObjects() || (HMFEqualObjects() ^ 1 | v20) == 1)
  {
    [v10 markChanged];
    [v10 markSaveToAssistant];
  }
}

- (void)_saveLastSeenAndExpectedConfiguredName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]([(HMDService *)self setLastSeenConfiguredName:v4]);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDService *)v6 lastSeenConfiguredName];
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating last seen configured (and configured/expected configured name to %@", (uint8_t *)&v10, 0x16u);
  }
  [(HMDService *)v6 setExpectedConfiguredName:v4];
  [(HMDService *)v6 setConfiguredName:v4];
}

- (void)_saveForLastSeenConfiguredNameUpdate
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDService *)self accessory];
  id v4 = (id)*MEMORY[0x263F0EAE0];
  id v5 = [v3 home];
  id v6 = [v5 backingStore];
  id v7 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  id v8 = [v6 transaction:v4 options:v7];

  id v9 = [HMDServiceTransaction alloc];
  int v10 = [(HMDService *)self uuid];
  uint64_t v11 = [v3 uuid];
  __int16 v12 = [(HMDBackingStoreModelObject *)v9 initWithObjectChangeType:2 uuid:v10 parentUUID:v11];

  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    char v16 = HMFGetLogIdentifier();
    long long v17 = [(HMDService *)v14 getConfiguredName];
    int v18 = [(HMDService *)v14 lastSeenConfiguredName];
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v16;
    __int16 v29 = 2112;
    char v30 = v17;
    __int16 v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating save transaction for update of configured '%@; and lastSeen configured name '%@'",
      buf,
      0x20u);
  }
  int v19 = [(HMDService *)v14 getConfiguredName];
  [(HMDServiceTransaction *)v12 setName:v19];

  int v20 = [(HMDService *)v14 lastSeenConfiguredName];
  [(HMDServiceTransaction *)v12 setLastSeenConfiguredNameLocal:v20];

  [v8 add:v12 withMessage:0];
  objc_initWeak((id *)buf, v14);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __50__HMDService__saveForLastSeenConfiguredNameUpdate__block_invoke;
  v23[3] = &unk_264A2B420;
  objc_copyWeak(&v26, (id *)buf);
  id v21 = v4;
  id v24 = v21;
  int v22 = v12;
  int v25 = v22;
  [v8 save:v23];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __50__HMDService__saveForLastSeenConfiguredNameUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained accessory];
  uint64_t v3 = [v2 home];
  [v3 saveWithReason:*(void *)(a1 + 32) postSyncNotification:0 objectChange:*(void *)(a1 + 40) != 0];
}

- (void)_saveForExpectedConfiguredNameUpdate
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDService *)self accessory];
  id v4 = [v3 home];
  id v5 = [v4 backingStore];
  uint64_t v6 = *MEMORY[0x263F0EAE0];
  id v7 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  id v8 = [v5 transaction:v6 options:v7];

  id v9 = [HMDServiceTransaction alloc];
  int v10 = [(HMDService *)self uuid];
  uint64_t v11 = [v3 uuid];
  __int16 v12 = [(HMDBackingStoreModelObject *)v9 initWithObjectChangeType:2 uuid:v10 parentUUID:v11];

  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    char v16 = HMFGetLogIdentifier();
    long long v17 = [(HMDService *)v14 getConfiguredName];
    int v18 = [(HMDService *)v14 expectedConfiguredName];
    int v21 = 138543874;
    int v22 = v16;
    __int16 v23 = 2112;
    id v24 = v17;
    __int16 v25 = 2112;
    id v26 = v18;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating save transaction for update of configured '%@; and expected configured name '%@'",
      (uint8_t *)&v21,
      0x20u);
  }
  int v19 = [(HMDService *)v14 getConfiguredName];
  [(HMDServiceTransaction *)v12 setName:v19];

  int v20 = [(HMDService *)v14 expectedConfiguredName];
  [(HMDServiceTransaction *)v12 setExpectedConfiguredName:v20];

  [v8 add:v12 withMessage:0];
  [v8 run];
}

- (id)_messagesForConfiguredNameChange
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HMDService *)self nameChangedMessage];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  if (v12)
  {
    [(HMDService *)self _transactionServiceUpdated:0 newValues:v12 message:v10];
    id v13 = v9;
LABEL_15:

    goto LABEL_16;
  }
  id v13 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    [(HMDService *)self appDataUpdated:v15 message:v10];
    goto LABEL_15;
  }
  char v16 = (void *)MEMORY[0x230FBD990]();
  long long v17 = self;
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v19 = HMFGetLogIdentifier();
    int v23 = 138543874;
    id v24 = v19;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = (id)objc_opt_class();
    id v20 = v28;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v23, 0x20u);
  }
  int v21 = [v10 responseHandler];

  if (v21)
  {
    id v13 = [v10 responseHandler];
    int v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, void *, void))v13 + 2))(v13, v22, 0);

    goto LABEL_15;
  }
LABEL_16:
}

- (void)_encodeWithCoder:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDService *)self accessory];
  uint64_t v6 = v5;
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    id v7 = [v5 uuid];
    [v4 encodeObject:v7 forKey:*MEMORY[0x263F0D600]];

    uint64_t v6 = accessoryToEncodeForXPCTransportForAccessory(v5);
  }
  [v4 encodeConditionalObject:v6 forKey:@"accessory"];
  id v8 = [(HMDService *)self uuid];
  [v4 encodeObject:v8 forKey:@"serviceUUID"];

  id v9 = [(HMDService *)self serviceType];
  [v4 encodeObject:v9 forKey:@"serviceType"];

  id v10 = [(HMDService *)self instanceID];
  [v4 encodeObject:v10 forKey:@"serviceInstanceID"];

  uint64_t v11 = [(HMDService *)self associatedServiceType];
  [v4 encodeObject:v11 forKey:@"associatedServiceType"];

  id v12 = [(HMDService *)self matterEndpointID];
  [v4 encodeObject:v12 forKey:@"serviceMatterEndpointID"];

  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    long long v61 = v6;
    char v63 = v5;
    id v13 = (void *)MEMORY[0x263EFF980];
    uint64_t v14 = [(HMDService *)self characteristics];
    id v15 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

    char v16 = +[HMDHAPMetadata getSharedInstance];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v62 = self;
    long long v17 = [(HMDService *)self characteristics];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v65 != v20) {
            objc_enumerationMutation(v17);
          }
          int v22 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          int v23 = [v22 type];
          char v24 = [v16 shouldFilterCharacteristicOfTypeFromApp:v23];

          if ((v24 & 1) == 0) {
            [v15 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v19);
    }

    __int16 v25 = (void *)[v15 copy];
    [v4 encodeObject:v25 forKey:@"characteristics"];

    id v5 = v63;
    id v26 = [v63 primaryService];
    self = v62;
    BOOL v27 = v26 == v62;

    [v4 encodeBool:v27 forKey:@"HM.primary"];
    uint64_t v6 = v61;
  }
  else
  {
    id v28 = [(HMDService *)self characteristics];
    [v4 encodeObject:v28 forKey:@"characteristics"];

    objc_msgSend(v4, "encodeBool:forKey:", -[HMDService isPrimary](self, "isPrimary"), @"HM.primary");
    objc_msgSend(v4, "encodeInt:forKey:", -[HMDService serviceProperties](self, "serviceProperties"), @"HM.serviceProperties");
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[HMDService isHidden](self, "isHidden"), @"HM.hidden");
  uint64_t v29 = [(HMDService *)self linkedServices];
  [v4 encodeObject:v29 forKey:@"HM.linkedServices"];

  if ((objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      char v30 = [(HMDService *)self name];
      __int16 v31 = kServiceNameCodingKey;
    }
    else
    {
      [v4 encodeObject:self->_configuredName forKey:@"serviceName"];
      v32 = [(HMDService *)self providedName];
      [v4 encodeObject:v32 forKey:@"serviceProvidedName"];

      uint64_t v33 = [(HMDService *)self labelIndex];
      [v4 encodeObject:v33 forKey:*MEMORY[0x263F0EB60]];

      id v34 = [(HMDService *)self labelNamespace];
      [v4 encodeObject:v34 forKey:*MEMORY[0x263F0EB68]];

      id v35 = [(HMDService *)self serviceSubtype];
      [v4 encodeObject:v35 forKey:*MEMORY[0x263F0EB70]];

      char v30 = [(HMDService *)self configurationState];
      __int16 v31 = (__CFString **)MEMORY[0x263F0EAF8];
    }
    [v4 encodeObject:v30 forKey:*v31];
  }
  int v36 = objc_msgSend(v4, "hmd_isForXPCTransport");
  char v37 = [(HMDService *)self appData];
  v38 = v37;
  if (!v36)
  {
    [v4 encodeObject:v37 forKey:@"HM.appDataRepository"];
    goto LABEL_24;
  }
  [v37 encodeForXPCTransportWithCoder:v4 key:@"HM.appData"];

  if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    v38 = [(HMDService *)self getConfiguredNameForXPCClients];
    [v4 encodeObject:v38 forKey:*MEMORY[0x263F0EB10]];
    v39 = [(HMDService *)self defaultName];
    [v4 encodeObject:v39 forKey:*MEMORY[0x263F0EB18]];

    int v40 = [(HMDService *)self serviceSubtype];
    [v4 encodeObject:v40 forKey:*MEMORY[0x263F0EB70]];

    v41 = [(HMDService *)self configurationState];
    [v4 encodeObject:v41 forKey:*MEMORY[0x263F0EAF8]];

LABEL_24:
  }
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0 || objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    int v42 = [(HMDService *)self bulletinBoardNotification];
    [v4 encodeObject:v42 forKey:@"HM.BulletinBoardNotification"];
  }
  if (!objc_msgSend(v4, "hmd_isForXPCTransport")
    || objc_msgSend(v4, "hmd_isForXPCTransport")
    && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    char v43 = [(HMDService *)self lastKnownOperatingState];

    if (v43)
    {
      v44 = [(HMDService *)self lastKnownOperatingState];
      [v4 encodeObject:v44 forKey:*MEMORY[0x263F0D578]];
    }
    v45 = [(HMDService *)self lastKnownOperatingStateAbnormalReasons];

    if (v45)
    {
      uint64_t v46 = [(HMDService *)self lastKnownOperatingStateAbnormalReasons];
      [v4 encodeObject:v46 forKey:*MEMORY[0x263F0D570]];
    }
  }
  char v47 = [(HMDService *)self mediaSourceIdentifier];

  if (v47)
  {
    id v48 = [(HMDService *)self mediaSourceIdentifier];
    [v4 encodeObject:v48 forKey:*MEMORY[0x263F0D590]];
  }
  v49 = [(HMDService *)self mediaSourceDisplayOrder];
  uint64_t v50 = [v49 count];

  if (v50)
  {
    char v51 = [(HMDService *)self mediaSourceDisplayOrder];
    [v4 encodeObject:v51 forKey:*MEMORY[0x263F0D580]];
  }
  long long v52 = [(HMDService *)self findCharacteristicWithType:@"00000136-0000-1000-8000-0026BB765291"];
  uint64_t v53 = [v52 supportsWrite];
  [v4 encodeBool:v53 forKey:*MEMORY[0x263F0D588]];
  char v54 = [(HMDService *)self findCharacteristicWithType:*MEMORY[0x263F0C000]];
  long long v55 = v54;
  if (v54) {
    uint64_t v56 = [v54 supportsWrite];
  }
  else {
    uint64_t v56 = 1;
  }
  [v4 encodeBool:v56 forKey:*MEMORY[0x263F0D5A8]];
  if ((objc_msgSend(v4, "hmd_isForXPCTransport") & 1) == 0)
  {
    char v57 = [(HMDService *)self expectedConfiguredName];

    if (v57)
    {
      long long v58 = [(HMDService *)self expectedConfiguredName];
      [v4 encodeObject:v58 forKey:@"HMDServiceExpectedConfiguredNameKey"];
    }
  }
  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    uint64_t v59 = [(HMDService *)self lastSeenConfiguredName];

    if (v59)
    {
      int v60 = [(HMDService *)self lastSeenConfiguredName];
      [v4 encodeObject:v60 forKey:@"HMDLastSeenConfiguredNameKey"];
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x230FBD990]();
  [(HMDService *)self _encodeWithCoder:v5];
}

- (id)_initWithCoder:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceInstanceID"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceUUID"];
  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v12 = v11 = v6;
      id v13 = [v7 UUIDString];
      *(_DWORD *)buf = 138543618;
      uint64_t v72 = v12;
      __int16 v73 = 2112;
      v74 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@HMDService decoding with uuid %@", buf, 0x16u);

      uint64_t v6 = v11;
    }
  }
  uint64_t v14 = [(HMDService *)self initWithAccessory:v5 owner:v5 instance:v6 uuid:v7];
  if (v14)
  {
    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceType"];
    uint64_t v16 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v15);
    serviceType = v14->_serviceType;
    v14->_serviceType = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedServiceType"];

    uint64_t v19 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v18);
    associatedServiceType = v14->_associatedServiceType;
    v14->_associatedServiceType = (NSString *)v19;

    int v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0EB70]];

    uint64_t v22 = objc_msgSend(MEMORY[0x263F425C8], "hmf_cachedInstanceForString:", v21);
    serviceSubtype = v14->_serviceSubtype;
    v14->_serviceSubtype = (NSString *)v22;

    char v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProvidedName"];
    uint64_t v25 = objc_msgSend(v24, "hm_truncatedNameString");
    providedName = v14->_providedName;
    v14->_providedName = (NSString *)v25;

    BOOL v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
    uint64_t v28 = objc_msgSend(v27, "hm_truncatedNameString");
    configuredName = v14->_configuredName;
    v14->_configuredName = (NSString *)v28;

    char v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDServiceExpectedConfiguredNameKey"];
    uint64_t v31 = objc_msgSend(v30, "hm_truncatedNameString");
    expectedConfiguredName = v14->_expectedConfiguredName;
    v14->_expectedConfiguredName = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDLastSeenConfiguredNameKey"];
    uint64_t v34 = objc_msgSend(v33, "hm_truncatedNameString");
    lastSeenConfiguredName = v14->_lastSeenConfiguredName;
    v14->_lastSeenConfiguredName = (NSString *)v34;

    [(HMDService *)v14 _updateDefaultName];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D578]];
    lastKnownOperatingState = v14->_lastKnownOperatingState;
    v14->_lastKnownOperatingState = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D570]];
    lastKnownOperatingStateAbnormalReasons = v14->_lastKnownOperatingStateAbnormalReasons;
    v14->_lastKnownOperatingStateAbnormalReasons = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D590]];
    mediaSourceIdentifier = v14->_mediaSourceIdentifier;
    v14->_mediaSourceIdentifier = (NSNumber *)v40;

    uint64_t v42 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D580]];
    mediaSourceDisplayOrder = v14->_mediaSourceDisplayOrder;
    v14->_mediaSourceDisplayOrder = (NSArray *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0EB60]];
    labelIndex = v14->_labelIndex;
    v14->_labelIndex = (NSNumber *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0EB68]];
    labelNamespace = v14->_labelNamespace;
    v14->_labelNamespace = (NSNumber *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0EAF8]];
    configurationState = v14->_configurationState;
    v14->_configurationState = (NSNumber *)v48;

    uint64_t v50 = (void *)MEMORY[0x263EFFA08];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    char v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
    long long v52 = [v50 setWithArray:v51];
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"characteristics"];
    characteristics = v14->_characteristics;
    v14->_characteristics = (NSArray *)v53;

    v14->_serviceProperties = (int)[v4 decodeIntForKey:@"HM.serviceProperties"];
    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceMatterEndpointID"];
    matterEndpointID = v14->_matterEndpointID;
    v14->_matterEndpointID = (NSNumber *)v55;

    char v57 = (void *)MEMORY[0x263EFFA08];
    v69[0] = objc_opt_class();
    v69[1] = objc_opt_class();
    long long v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
    uint64_t v59 = [v57 setWithArray:v58];
    uint64_t v60 = [v4 decodeObjectOfClasses:v59 forKey:@"HM.linkedServices"];
    linkedServices = v14->_linkedServices;
    v14->_linkedServices = (NSArray *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.appDataRepository"];
    appData = v14->_appData;
    v14->_appData = (HMDApplicationData *)v62;

    long long v64 = v14->_appData;
    long long v65 = [(HMDService *)v14 uuid];
    [(HMDApplicationData *)v64 updateParentUUIDIfNil:v65];

    if ([(HMDService *)v14 _supportsBulletinNotification])
    {
      uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.BulletinBoardNotification"];
      bulletinBoardNotification = v14->_bulletinBoardNotification;
      v14->_bulletinBoardNotification = (HMDBulletinBoardNotification *)v66;
    }
  }

  return v14;
}

- (HMDService)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = (HMDService *)[(HMDService *)self _initWithCoder:v4];

  return v6;
}

- (void)updatePresenceRequestTimeForDeviceWithDestination:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDService *)self deviceLastRequestPresenceDateMap];

    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
      [(HMDService *)self setDeviceLastRequestPresenceDateMap:v6];
    }
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = [(HMDService *)v8 uuid];
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2112;
      long long v17 = v11;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[%@] Update presence request time for %@.", (uint8_t *)&v14, 0x20u);
    }
    id v12 = [MEMORY[0x263EFF910] date];
    id v13 = [(HMDService *)v8 deviceLastRequestPresenceDateMap];
    [v13 setObject:v12 forKeyedSubscript:v4];
  }
}

- (BOOL)shouldIncludePresenceForDeviceWithDestination:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDService *)self deviceLastRequestPresenceDateMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      id v7 = [MEMORY[0x263EFF910] date];
      [v7 timeIntervalSinceDate:v6];
      double v9 = v8;

      id v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        int v14 = [(HMDService *)v11 uuid];
        int v17 = 138544130;
        __int16 v18 = v13;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        id v22 = v4;
        __int16 v23 = 2048;
        double v24 = v9;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] Check if we need to include presence in notification for %@. Interval since last update %lf.", (uint8_t *)&v17, 0x2Au);
      }
      BOOL v15 = v9 <= 86400.0;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)shouldEnableDaemonRelaunch
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [(HMDService *)self characteristics];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v9 = [v8 type];
        id v10 = [v8 service];
        uint64_t v11 = [v10 type];
        BOOL v12 = +[HMDBulletinBoard isBulletinSupportedForCharacteristicType:v9 serviceType:v11];

        if (v12)
        {
          id v13 = [(HMDService *)self bulletinBoardNotification];
          char v14 = [v13 isEnabled];

          if (v14)
          {
            BOOL v15 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)configureBulletinNotification
{
  id v2 = [(HMDService *)self bulletinBoardNotification];
  [v2 configureBulletinNotification];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  double v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  [(HMDService *)self setWorkQueue:v6];
  objc_storeStrong((id *)&self->_messageDispatcher, a4);
  [(HMDService *)self _registerForMessages];
  [(HMDService *)self _shouldServiceBeHidden];
  [(HMDService *)self _createNotification];
  double v9 = [(HMDService *)self bulletinBoardNotification];
  [v9 configureWithWorkQueue:v6 messageDispatcher:v8];

  if (self->_instanceID == (NSNumber *)&unk_26E471818)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      char v14 = [(HMDService *)v11 dumpState];
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      long long v18 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@*** DEBUG THIS : File a Radar : HomeKit | New Bugs ***: Service dump : [%@]", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)updateLastKnownValues
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(HMDService *)self characteristics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateLastKnownValue];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)getLastSeenConfiguredName
{
  id v2 = (void *)[(NSString *)self->_lastSeenConfiguredName copy];
  return v2;
}

- (id)getConfiguredNameForXPCClients
{
  uint64_t v3 = [(HMDService *)self expectedConfiguredName];
  if (!v3)
  {
    uint64_t v3 = self->_configuredName;
    if (!v3) {
      uint64_t v3 = self->_defaultName;
    }
  }
  uint64_t v4 = (void *)[(NSString *)v3 copy];

  return v4;
}

- (id)getConfiguredName
{
  id v2 = (void *)[(NSString *)self->_configuredName copy];
  return v2;
}

- (BOOL)updateAssociatedServiceType:(id)a3 error:(id *)a4
{
  id v7 = a3;
  long long v8 = +[HMDHAPMetadata getSharedInstance];
  long long v9 = [(HMDService *)self serviceType];
  long long v10 = [v8 validateAssociatedServiceType:v7 forService:v9];

  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_associatedServiceType, a3);
  }

  return v10 == 0;
}

- (id)messagesForUpdatedRoom:(id)a3
{
  uint64_t v4 = [(HMDService *)self serviceType];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F0D850]];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    id v7 = [(HMDService *)self getConfiguredNameForXPCClients];
    long long v8 = [(HMDService *)self name];
    long long v9 = [(HMDService *)self _checkIfDefaultNameChanged];
    if (v9) {
      [v6 addObject:v9];
    }
    long long v10 = [(HMDService *)self getConfiguredNameForXPCClients];
    if (HMFEqualObjects())
    {
      uint64_t v11 = [(HMDService *)self name];
      if ((HMFEqualObjects() & 1) == 0)
      {
        uint64_t v12 = [(HMDService *)self nameChangedMessage];
        if (v12) {
          [v6 addObject:v12];
        }
      }
    }
    else
    {
      uint64_t v11 = [(HMDService *)self _messagesForConfiguredNameChange];
      [v6 addObjectsFromArray:v11];
    }

    id v13 = (void *)[v6 copy];
  }
  else
  {
    id v13 = (void *)MEMORY[0x263EFFA68];
  }
  return v13;
}

- (id)nameChangedMessage
{
  v18[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDService *)self accessory];
  uint64_t v4 = [v3 home];
  uint64_t v5 = [(HMDService *)self name];
  uint64_t v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5)
  {
    v17[0] = @"kServiceInstanceID";
    long long v8 = [(HMDService *)self instanceID];
    v18[0] = v8;
    v18[1] = v6;
    v17[1] = @"kServiceName";
    void v17[2] = @"kHomeUUID";
    long long v9 = [v4 uuid];
    long long v10 = [v9 UUIDString];
    v18[2] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    uint64_t v12 = [(HMDService *)self getConfiguredNameForXPCClients];
    if (v12)
    {
      id v7 = [MEMORY[0x263F42568] nonSPIEntitledMessageWithName:@"kServiceRenamedNotificationKey" messagePayload:v11];
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x263F42570]);
      char v14 = [v3 uuid];
      int v15 = (void *)[v13 initWithTarget:v14];

      id v7 = [MEMORY[0x263F42568] messageWithName:@"kServiceRenamedNotificationKey" destination:v15 payload:v11];
    }
  }

  return v7;
}

- (id)_checkIfDefaultNameChanged
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDService *)self expectedConfiguredName];
  uint64_t v4 = [(HMDService *)self defaultName];
  [(HMDService *)self _updateDefaultName];
  uint64_t v5 = [(HMDService *)self defaultName];
  uint64_t v6 = [(HMDService *)self accessory];
  id v7 = [v6 home];
  if (v7 && (HMFEqualObjects() & 1) == 0)
  {
    long long v9 = [(HMDService *)self findCharacteristicWithType:*MEMORY[0x263F0C000]];
    if ([v9 supportsWrite] && (!v3 || HMFEqualObjects()))
    {
      uint64_t v29 = v9;
      long long v10 = [v7 backingStore];
      uint64_t v11 = *MEMORY[0x263F0EAE0];
      uint64_t v12 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      uint64_t v28 = [v10 transaction:v11 options:v12];

      id v13 = [HMDServiceTransaction alloc];
      char v14 = [(HMDService *)self uuid];
      int v15 = [v6 uuid];
      __int16 v16 = [(HMDBackingStoreModelObject *)v13 initWithObjectChangeType:2 uuid:v14 parentUUID:v15];

      __int16 v17 = (void *)MEMORY[0x230FBD990]();
      long long v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        long long v20 = v27 = v17;
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v20;
        __int16 v34 = 2112;
        id v35 = v5;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Creating run transaction for update of expected configured name '%@' due to defaultName change", buf, 0x16u);

        __int16 v17 = v27;
      }

      [(HMDServiceTransaction *)v16 setExpectedConfiguredName:v5];
      [v28 add:v16 withMessage:0];
      [v28 run];

      long long v9 = v29;
    }
    v30[0] = @"kServiceInstanceID";
    __int16 v21 = [(HMDService *)self instanceID];
    v30[1] = @"kServiceName";
    v31[0] = v21;
    v31[1] = v5;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

    id v23 = objc_alloc(MEMORY[0x263F42570]);
    double v24 = [v6 uuid];
    uint64_t v25 = (void *)[v23 initWithTarget:v24];

    long long v8 = [MEMORY[0x263F42568] messageWithName:*MEMORY[0x263F0EB20] destination:v25 payload:v22];
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (void)_updateDefaultName
{
  id v3 = [(HMDService *)self _deriveDefaultName];
  [(HMDService *)self setDefaultName:v3];
}

- (id)_deriveDefaultName
{
  id v3 = [(HMDService *)self serviceType];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F0D880]];

  if (!v4)
  {
    id v13 = [(HMDService *)self serviceType];
    if ([v13 isEqualToString:*MEMORY[0x263F0D850]])
    {
    }
    else
    {
      char v14 = [(HMDService *)self serviceType];
      int v15 = [v14 isEqualToString:@"00000228-0000-1000-8000-0026BB765291"];

      if (!v15)
      {
        uint64_t v12 = [(HMDService *)self providedName];
        goto LABEL_14;
      }
    }
    long long v9 = [(HMDService *)self accessory];
    __int16 v16 = [v9 room];
    uint64_t v12 = [v16 name];

LABEL_11:
    goto LABEL_14;
  }
  uint64_t v5 = [(HMDService *)self labelIndex];

  if (v5)
  {
    uint64_t v6 = [(HMDService *)self serviceSubtype];
    int v7 = [v6 isEqualToString:*MEMORY[0x263F0D5C0]];

    if (v7) {
      long long v8 = @"DEFAULT_SPRINKLER_VALVE";
    }
    else {
      long long v8 = @"DEFAULT_FAUCET_VALVE";
    }
    long long v9 = HMDLocalizedStringForKey(v8);
    long long v10 = NSString;
    uint64_t v11 = [(HMDService *)self labelIndex];
    uint64_t v12 = [v10 stringWithFormat:@"%@ %@", v9, v11];

    goto LABEL_11;
  }
  uint64_t v12 = 0;
LABEL_14:
  return v12;
}

- (NSString)name
{
  uint64_t v3 = 96;
  if ([(NSString *)self->_expectedConfiguredName length]
    || (uint64_t v3 = 88, [(NSString *)self->_configuredName length]))
  {
    id v4 = *(id *)((char *)&self->super.super.isa + v3);
LABEL_4:
    uint64_t v5 = v4;
    goto LABEL_5;
  }
  long long v8 = [(HMDService *)self defaultName];
  if ([v8 length])
  {
    long long v9 = [(HMDService *)self defaultName];
    long long v10 = [(HMDService *)self providedName];
    char v11 = [v9 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      id v4 = [(HMDService *)self defaultName];
      goto LABEL_4;
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  uint64_t v5 = [WeakRetained name];

LABEL_5:
  uint64_t v6 = (void *)[v5 copy];

  return (NSString *)v6;
}

- (id)findCharacteristicWithType:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDService *)self characteristics];
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
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 type];
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

- (id)findCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDService *)self characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__HMDService_findCharacteristic___block_invoke;
  v9[3] = &unk_264A2D3B8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __33__HMDService_findCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 instanceID];
  uint64_t v3 = HAPEqualInstanceIDs();

  return v3;
}

- (void)_readRequiredCharacteristicValuesForceReadFWVersion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HMDService *)self accessory];
  id v6 = [(HMDService *)self gatherRequiredReadRequestsForceReadFWVersion:v3];
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    id inited = objc_initWeak(&from, v5);
    long long v8 = (void *)MEMORY[0x230FBD990](inited);
    long long v9 = self;
    HMFGetOSLogHandle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v6 count];
      long long v13 = [(HMDService *)v9 serviceType];
      *(_DWORD *)buf = 138543874;
      id v25 = v11;
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading %lu required characteristics for service %@", buf, 0x20u);
    }
    long long v14 = [(HMDService *)v9 workQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke;
    v19[3] = &unk_264A1EB08;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    [v5 readCharacteristicValues:v6 source:7 queue:v14 completionHandler:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v15 = (void *)MEMORY[0x230FBD990]();
    long long v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@No required characteristics to read", buf, 0xCu);
    }
  }
}

void __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  char v54 = WeakRetained;
  if (WeakRetained && v5)
  {
    uint64_t v7 = [HMDServiceTransaction alloc];
    long long v8 = [WeakRetained uuid];
    long long v9 = [v6 uuid];
    uint64_t v53 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:2 uuid:v8 parentUUID:v9];

    char v62 = 0;
    uint64_t v48 = v6;
    long long v52 = [v6 transactionWithObjectChangeType:2];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v49 = v3;
    id obj = v3;
    uint64_t v55 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
    char v10 = 0;
    if (v55)
    {
      uint64_t v51 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v59 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          long long v13 = (void *)MEMORY[0x230FBD990]();
          id v14 = v54;
          long long v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            long long v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v64 = v16;
            __int16 v65 = 2112;
            uint64_t v66 = v12;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Got response %@", buf, 0x16u);
          }
          __int16 v17 = [v12 request];
          uint64_t v18 = [v17 characteristic];

          uint64_t v19 = [v12 value];
          id v20 = [v12 valueUpdatedTime];
          uint64_t v21 = [v12 stateNumber];
          uint64_t v22 = [v12 notificationContext];
          [v18 updateValue:v19 updatedTime:v20 stateNumber:v21 notificationContext:v22];

          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke_159;
          aBlock[3] = &unk_264A1EAE0;
          char v57 = v53;
          id v23 = _Block_copy(aBlock);
          double v24 = [v18 type];
          id v25 = [v12 value];
          __int16 v26 = [v14 serviceType];
          uint64_t v27 = [v14 accessory];
          LOBYTE(v21) = +[HMDService processUpdateForCharacteristicType:v24 value:v25 serviceType:v26 service:v14 serviceTransactionGetter:v23 accessory:v27 accessoryTransaction:v52 accessoryTransactionChanged:&v62];

          v10 |= v21;
        }
        uint64_t v55 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v55);
    }

    id v6 = v48;
    __int16 v28 = [v48 home];
    uint64_t v29 = [(HMDServiceTransaction *)v53 providedName];

    if (v29)
    {
      uint64_t v30 = [v28 backingStore];
      uint64_t v31 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
      v32 = [v30 transaction:@"ServiceUpdated" options:v31];

      uint64_t v33 = [HMDServiceTransaction alloc];
      __int16 v34 = [v54 uuid];
      id v35 = [v48 uuid];
      uint64_t v36 = [(HMDBackingStoreModelObject *)v33 initWithObjectChangeType:2 uuid:v34 parentUUID:v35];

      char v37 = [(HMDServiceTransaction *)v53 providedName];
      [(HMDServiceTransaction *)v36 setProvidedName:v37];

      [(HMDServiceTransaction *)v53 setProvidedName:0];
      [v32 add:v36 withMessage:0];
      [v32 run];
    }
    if (v10)
    {
      uint64_t v38 = [v28 backingStore];
      v39 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      uint64_t v40 = [v38 transaction:@"ServiceUpdated" options:v39];

      [v40 add:v53 withMessage:0];
      [v40 run];
    }
    if (v62)
    {
      v41 = [v28 backingStore];
      uint64_t v42 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      char v43 = [v41 transaction:@"AccessoryUpdated" options:v42];

      [v43 add:v52 withMessage:0];
      [v43 run];
    }
    id v3 = v49;
  }
  else
  {
    uint64_t v44 = (void *)MEMORY[0x230FBD990]();
    id v45 = WeakRetained;
    uint64_t v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      char v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v64 = v47;
      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Service or accessory is no more valid", buf, 0xCu);
    }
  }
}

id __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke_159(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)gatherRequiredReadRequestsForceReadFWVersion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [(HMDService *)self characteristics];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = [(HMDService *)self accessory];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isReadingRequiredForBTLEAccessoryCharacteristic:forceReadFWVersion:", v13, v3, (void)v16) & 1) != 0|| -[HMDService isReadingRequiredForBTLEServiceCharacteristic:](self, "isReadingRequiredForBTLEServiceCharacteristic:", v13))
        {
          id v14 = +[HMDCharacteristicRequest requestWithCharacteristic:v13];
          if (v14) {
            [v6 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isReadingRequiredForBTLEServiceCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F0C298]];

  if (v6)
  {
    uint64_t v7 = [(HMDService *)self providedName];
LABEL_21:
    long long v16 = (void *)v7;
    goto LABEL_22;
  }
  id v8 = [v4 type];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F0C000]];

  if (v9)
  {
    uint64_t v7 = [(HMDService *)self getLastSeenConfiguredName];
    goto LABEL_21;
  }
  uint64_t v10 = [(HMDService *)self serviceType];
  if ([v10 isEqualToString:*MEMORY[0x263F0D738]])
  {
    uint64_t v11 = [v4 type];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F0C1D8]];

    if (v12)
    {
      uint64_t v7 = [(HMDService *)self mediaSourceIdentifier];
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v13 = [(HMDService *)self serviceType];
  if (([v13 isEqualToString:*MEMORY[0x263F0D850]] & 1) == 0)
  {

LABEL_13:
    long long v17 = [v4 type];
    int v18 = [v17 isEqualToString:@"000000CB-0000-1000-8000-0026BB765291"];

    if (v18)
    {
      uint64_t v7 = [(HMDService *)self labelIndex];
    }
    else
    {
      long long v19 = [v4 type];
      int v20 = [v19 isEqualToString:@"000000CD-0000-1000-8000-0026BB765291"];

      if (v20)
      {
        uint64_t v7 = [(HMDService *)self labelNamespace];
      }
      else
      {
        uint64_t v21 = [v4 type];
        int v22 = [v21 isEqualToString:@"000000D5-0000-1000-8000-0026BB765291"];

        if (v22)
        {
          uint64_t v7 = [(HMDService *)self serviceSubtype];
        }
        else
        {
          id v23 = [v4 type];
          int v24 = [v23 isEqualToString:@"000000D6-0000-1000-8000-0026BB765291"];

          if (!v24)
          {
            BOOL v25 = 0;
            goto LABEL_23;
          }
          uint64_t v7 = [(HMDService *)self configurationState];
        }
      }
    }
    goto LABEL_21;
  }
  id v14 = [v4 type];
  int v15 = [v14 isEqualToString:@"00000136-0000-1000-8000-0026BB765291"];

  if (!v15) {
    goto LABEL_13;
  }
  long long v16 = [(HMDService *)self mediaSourceDisplayOrder];
  uint64_t v7 = [v16 count];
LABEL_22:
  BOOL v25 = v7 == 0;

LABEL_23:
  return v25;
}

- (id)_updateProvidedName:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDService *)self name];
  if (+[HMDService validateProvidedName:v4])
  {
    int v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v15 = 138543618;
      long long v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Filling provided name with %@ from name characteristic", (uint8_t *)&v15, 0x16u);
    }
    [(HMDService *)v7 setProvidedName:v4];
    uint64_t v10 = [(HMDService *)v7 name];
    char v11 = [v5 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      int v12 = [(HMDService *)v7 nameChangedMessage];
      goto LABEL_8;
    }
  }
  else
  {
    providedName = self->_providedName;
    self->_providedName = 0;
  }
  int v12 = 0;
LABEL_8:

  return v12;
}

- (void)_shouldServiceBeHidden
{
  id v2 = self;
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (([(HMDService *)self serviceProperties] & 2) != 0
    || ([(HMDService *)v2 type],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEqualToString:*MEMORY[0x263F0D610]],
        v3,
        v4))
  {
    [(HMDService *)v2 setHidden:1];
  }
  else
  {
    id v5 = [(HMDService *)v2 characteristics];
    if ([v5 count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        int v20 = v5;
        uint64_t v21 = v2;
        uint64_t v9 = *(void *)v23;
        uint64_t v10 = *MEMORY[0x263F0C298];
        uint64_t v11 = *MEMORY[0x263F0C000];
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v14 = objc_msgSend(v13, "type", v20, v21, (void)v22);
            if ([v14 isEqualToString:v10])
            {
            }
            else
            {
              int v15 = [v13 type];
              char v16 = [v15 isEqualToString:v11];

              if ((v16 & 1) == 0 && ([v13 properties] & 0x40) == 0)
              {
                uint64_t v17 = 0;
                goto LABEL_21;
              }
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v8) {
            continue;
          }
          break;
        }
        uint64_t v17 = 1;
LABEL_21:
        id v5 = v20;
        id v2 = v21;
      }
      else
      {
        uint64_t v17 = 1;
      }

      id v18 = v2;
      uint64_t v19 = v17;
    }
    else
    {
      id v18 = v2;
      uint64_t v19 = 0;
    }
    [(HMDService *)v18 setHidden:v19];
  }
}

- (BOOL)_supportsBulletinNotification
{
  if (!+[HMDDeviceCapabilities supportsBulletinBoard]) {
    return 0;
  }
  BOOL v3 = [(HMDService *)self serviceType];
  if (+[HMDBulletinBoard isBulletinSupportedForCharacteristicType:0 serviceType:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(HMDService *)self serviceType];
    BOOL v4 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:v5];
  }
  return v4;
}

- (void)_createNotification
{
  if ([(HMDService *)self _supportsBulletinNotification])
  {
    BOOL v3 = [(HMDService *)self bulletinBoardNotification];

    if (!v3)
    {
      BOOL v4 = [(HMDService *)self home];
      id v7 = [v4 accessoryBulletinNotificationManager];

      id v5 = [v7 bulletinBoardNotificationForService:self];
      bulletinBoardNotification = self->_bulletinBoardNotification;
      self->_bulletinBoardNotification = v5;
    }
  }
}

- (id)configureWithService:(id)a3 accessory:(id)a4 shouldRead:(BOOL)a5 added:(BOOL)a6
{
  BOOL v118 = a5;
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v119 = a4;
  uint64_t v123 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [(HMDService *)self characteristics];
  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  v132 = v8;
  uint64_t v11 = [v8 characteristics];
  v138 = [v10 arrayWithArray:v11];

  int v12 = +[HMDHAPMetadata getSharedInstance];
  v135 = self;
  uint64_t v121 = [(HMDService *)self accessory];
  v120 = [v121 home];
  uint64_t v13 = [v120 notificationRegistrations];
  uint64_t v131 = [v13 count];

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id obj = v9;
  id v136 = v12;
  uint64_t v139 = [obj countByEnumeratingWithState:&v144 objects:v163 count:16];
  if (v139)
  {
    id v14 = @"H";
    uint64_t v137 = *(void *)v145;
    if (!v131) {
      id v14 = &stru_26E2EB898;
    }
    uint64_t v122 = v14;
    uint64_t v130 = *MEMORY[0x263F356A0];
    do
    {
      for (uint64_t i = 0; i != v139; ++i)
      {
        if (*(void *)v145 != v137) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v144 + 1) + 8 * i);
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v17 = v138;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v140 objects:v162 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v141;
LABEL_10:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v141 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = *(void **)(*((void *)&v140 + 1) + 8 * v21);
            long long v23 = [v16 characteristicType];
            long long v24 = [v22 type];
            char v25 = [v23 isEqual:v24];

            if (v25) {
              break;
            }
            if (v19 == ++v21)
            {
              uint64_t v19 = [v17 countByEnumeratingWithState:&v140 objects:v162 count:16];
              if (v19) {
                goto LABEL_10;
              }
              id v26 = v17;
              int v12 = v136;
              goto LABEL_61;
            }
          }
          id v26 = v22;

          int v12 = v136;
          if (!v26) {
            continue;
          }
          uint64_t v27 = [v16 lastKnownValueUpdateTime];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v28 = v27;
          }
          else {
            __int16 v28 = 0;
          }
          id v29 = v28;

          [v16 configureWithCharacteristic:v26];
          uint64_t v30 = [v26 type];
          uint64_t v31 = [v132 type];
          objc_msgSend(v26, "setProhibitCaching:", objc_msgSend(v136, "requiresDeviceUnlock:forService:", v30, v31));

          v32 = [v16 type];
          LOBYTE(v31) = [v32 isEqualToString:@"00000023-0000-1000-8000-0026BB765291"];

          if ((v31 & 1) == 0)
          {
            uint64_t v33 = [(HMDService *)v135 type];
            id v133 = v29;
            if ([v33 isEqualToString:v130])
            {
              __int16 v34 = [v16 type];
              int v35 = [v34 isEqualToString:@"000000A6-0000-1000-8000-0026BB765291"];
            }
            else
            {
              int v35 = 0;
            }

            uint64_t v36 = [v16 service];
            char v37 = [v16 type];
            uint64_t v38 = [(HMDService *)v135 type];
            int v39 = [v136 shouldAutoEnableNotificationForCharacteristic:v37 ofService:v38];

            if (v131)
            {
              uint64_t v40 = [v16 type];
              v41 = [v36 type];
              int v42 = [v136 shouldEnableHomeNotificationForCharacteristicType:v40 serviceType:v41];
            }
            else
            {
              int v42 = 0;
            }
            char v43 = [v16 type];
            uint64_t v44 = [(HMDService *)v135 type];
            int v45 = [v136 shouldFilterEnableNotificationsForCharacteristicType:v43 serviceType:v44];

            if ([v16 properties])
            {
              int v46 = v42 & ~v45;
              if (v39 | v35 | v46)
              {
                BOOL v47 = v46 == 0;
                uint64_t v48 = @"com.apple.HomeKitDaemon";
                if (!v47) {
                  uint64_t v48 = @"com.apple.HomeKitDaemon.homeNotifications";
                }
                if (v39) {
                  uint64_t v48 = @"com.apple.HomeKitDaemon.autoEnableNotification";
                }
                id v49 = v48;
                BOOL v50 = isWatch();
                uint64_t v51 = (void *)MEMORY[0x230FBD990](v50);
                long long v52 = v135;
                uint64_t v53 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  char v54 = v127 = v49;
                  uint64_t v55 = &stru_26E2EB898;
                  if (v39) {
                    uint64_t v56 = @"A";
                  }
                  else {
                    uint64_t v56 = &stru_26E2EB898;
                  }
                  if (v35) {
                    uint64_t v55 = @"F";
                  }
                  v124 = v55;
                  v125 = v56;
                  v126 = [(HMDService *)v52 accessory];
                  char v57 = [v126 name];
                  [v16 instanceID];
                  long long v58 = v129 = v36;
                  [v16 type];
                  long long v59 = v128 = v51;
                  long long v60 = HAPShortUUIDType();
                  *(_DWORD *)buf = 138544898;
                  v149 = v54;
                  __int16 v150 = 2112;
                  v151 = v125;
                  __int16 v152 = 2112;
                  v153 = v124;
                  __int16 v154 = 2112;
                  v155 = v122;
                  __int16 v156 = 2112;
                  v157 = v57;
                  __int16 v158 = 2112;
                  v159 = v58;
                  __int16 v160 = 2112;
                  v161 = v60;
                  _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Enabling notifications on behalf of homed(%@%@%@) for characteristic %@(%@/%@)", buf, 0x48u);

                  uint64_t v51 = v128;
                  uint64_t v36 = v129;

                  id v49 = v127;
                }

                [v16 setNotificationEnabled:1 forClientIdentifier:v49];
              }
            }
            int v12 = v136;
            id v29 = v133;
            if ([v16 isNotificationEnabled])
            {
              long long v61 = (void *)MEMORY[0x230FBD990]();
              char v62 = v135;
              char v63 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                long long v64 = HMFGetLogIdentifier();
                [v16 shortDescription];
                __int16 v65 = v36;
                uint64_t v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
                long long v67 = [v16 notificationRegistrations];
                *(_DWORD *)buf = 138543874;
                v149 = v64;
                __int16 v150 = 2112;
                v151 = v66;
                __int16 v152 = 2112;
                v153 = v67;
                _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@Notifications are enabled for characteristic %@ on behalf of %@", buf, 0x20u);

                uint64_t v36 = v65;
                id v29 = v133;
                int v12 = v136;
              }
            }
          }
          uint64_t v68 = [v26 valueUpdatedTime];
          if ([v29 compare:v68] == -1)
          {
            uint64_t v69 = [v26 valueUpdatedTime];
            v70 = [MEMORY[0x263EFF910] distantPast];
            char v71 = [v69 isEqualToDate:v70];

            if ((v71 & 1) == 0)
            {
              uint64_t v68 = [MEMORY[0x263EFF9A0] dictionary];
              uint64_t v72 = [v26 value];
              if (v72) {
                [v26 value];
              }
              else {
              __int16 v73 = [MEMORY[0x263EFF9D0] null];
              }
              [v68 setObject:v73 forKeyedSubscript:@"kCharacteristicValue"];

              v74 = [v26 valueUpdatedTime];
              [v68 setObject:v74 forKeyedSubscript:@"kCharacteristicValueUpdateTime"];

              uint64_t v75 = [v26 stateNumber];
              if (v75) {
                [v26 stateNumber];
              }
              else {
              char v76 = [MEMORY[0x263EFF9D0] null];
              }
              [v68 setObject:v76 forKeyedSubscript:@"kCharacteristicValueUpdateStateNumberKey"];

              v77 = [v16 notificationEnabledTime];
              [v68 setObject:v77 forKeyedSubscript:@"kCharacteristicNotificationEnableTime"];

              v78 = [v26 notificationContext];

              if (v78)
              {
                uint64_t v79 = [v26 notificationContext];
                [v68 setObject:v79 forKeyedSubscript:@"kCharacteristicNotificationContextKey"];
              }
              v80 = [v26 instanceID];
              [v123 setObject:v68 forKey:v80];

              goto LABEL_59;
            }
          }
          else
          {
LABEL_59:
          }
          goto LABEL_61;
        }
        id v26 = v17;
LABEL_61:
      }
      uint64_t v139 = [obj countByEnumeratingWithState:&v144 objects:v163 count:16];
    }
    while (v139);
  }

  unint64_t v81 = v132;
  if (v118)
  {
    v82 = [v132 type];
    if ([v82 isEqualToString:*MEMORY[0x263F0D610]])
    {
    }
    else
    {
      uint64_t v83 = [v132 type];
      uint64_t v84 = [v83 isEqualToString:*MEMORY[0x263F356A8]];

      if (!v84)
      {
LABEL_71:
        [(HMDService *)v135 _readRequiredCharacteristicValuesForceReadFWVersion:v84];
        goto LABEL_72;
      }
    }
    v85 = [v132 accessory];
    v86 = [v85 server];
    uint64_t v87 = [v86 configNumber];
    uint64_t v88 = [v121 configNumber];
    BOOL v47 = v87 == v88;
    uint64_t v84 = v87 != v88;
    if (!v47) {
      objc_msgSend(v121, "setConfigNumber:", objc_msgSend(v86, "configNumber"));
    }

    goto LABEL_71;
  }
LABEL_72:
  v89 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  if ([v123 count]) {
    [v89 setObject:v123 forKey:@"kModifiedCharacteristicsForAccessoryKey"];
  }
  [(HMDService *)v135 _updateDefaultName];
  v90 = [(HMDService *)v135 findCharacteristicWithType:*MEMORY[0x263F0C000]];
  char v91 = v90;
  if (v90)
  {
    v92 = [v90 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v93 = v92;
    }
    else {
      uint64_t v93 = 0;
    }
    v94 = v93;

    if (![(__CFString *)v94 length])
    {

      v94 = 0;
    }
    if ([(HMDService *)v135 shouldUpdateLastSeenConfiguredName:v94])
    {
      v95 = (void *)MEMORY[0x230FBD990]();
      v96 = v135;
      char v97 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        v98 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v149 = v98;
        __int16 v150 = 2112;
        v151 = v94;
        _os_log_impl(&dword_22F52A000, v97, OS_LOG_TYPE_DEFAULT, "%{public}@Creating a transaction to save accessory reported name (%@) as expected and configured name", buf, 0x16u);
      }
      [(HMDService *)v96 _saveCurrentNameAsExpectedAndLastSeen:v94];
    }
    else if ([v120 isOwnerUser])
    {
      if ([v91 supportsWrite])
      {
        v99 = [(HMDService *)v135 expectedConfiguredName];
        char v100 = HMFEqualObjects();

        if ((v100 & 1) == 0)
        {
          v101 = [(HMDService *)v135 lastSeenConfiguredName];
          int v102 = HMFEqualObjects();

          if (v102)
          {
            v103 = [(HMDService *)v135 expectedConfiguredName];
            v104 = [(HMDService *)v135 _sanitizeNameToWriteToAccessory:v103];

            v105 = (void *)MEMORY[0x230FBD990]();
            int v106 = v135;
            uint64_t v107 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              v108 = HMFGetLogIdentifier();
              v109 = [(HMDService *)v106 name];
              v110 = [(HMDService *)v106 lastSeenConfiguredName];
              *(_DWORD *)buf = 138544130;
              v149 = v108;
              __int16 v150 = 2112;
              v151 = v104;
              __int16 v152 = 2112;
              v153 = v109;
              __int16 v154 = 2112;
              v155 = v110;
              _os_log_impl(&dword_22F52A000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@Overwriting configured name since expected name does not match expected: %@, name: %@, lastSeen: %@", buf, 0x2Au);

              int v12 = v136;
              unint64_t v81 = v132;
            }
            [(HMDService *)v106 _writeConfiguredNameToAccessory:v104];
          }
        }
      }
    }
  }
  char v111 = [v81 type];
  int v112 = [v111 isEqualToString:*MEMORY[0x263F0D668]];

  if (v112)
  {
    v113 = (void *)MEMORY[0x230FBD990]();
    v114 = v135;
    v115 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
    {
      v116 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v149 = v116;
      _os_log_impl(&dword_22F52A000, v115, OS_LOG_TYPE_DEBUG, "%{public}@Service is camera recording management, sending kick notification", buf, 0xCu);
    }
    logAndPostNotification(@"HMDRecordingManagementServiceDidUpdateNotification", v121, 0);
  }

  return v89;
}

- (id)_sanitizeNameToWriteToAccessory:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hm_truncatedNameString");
  if (![v5 length])
  {
    id v6 = [(HMDService *)self defaultName];

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v22 = 138543618;
      long long v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Name to write to accessory is nil, writing defaultName %@ to the accessory", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v11 = [(HMDService *)v8 findCharacteristicWithType:*MEMORY[0x263F0C000]];
    int v12 = [v11 metadata];
    uint64_t v13 = [v12 maxLength];
    unint64_t v14 = [v13 unsignedIntegerValue];

    if ([v6 length] > v14)
    {
      int v15 = (void *)MEMORY[0x230FBD990]();
      char v16 = v8;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        uint64_t v19 = [v6 length];
        int v22 = 138543874;
        long long v23 = v18;
        __int16 v24 = 2048;
        uint64_t v25 = v19;
        __int16 v26 = 2048;
        unint64_t v27 = v14;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@DefaultName length %lu larger than accessory supported length %lu - truncating", (uint8_t *)&v22, 0x20u);
      }
      uint64_t v20 = [v6 substringToIndex:v14];

      id v6 = (void *)v20;
    }

    id v5 = v6;
  }

  return v5;
}

- (id)configureWithService:(id)a3 accessory:(id)a4
{
  return [(HMDService *)self configureWithService:a3 accessory:a4 shouldRead:1 added:0];
}

- (void)_handleSetAppData:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDService *)self accessory];
  id v6 = [v5 home];
  if (v6)
  {
    id v7 = (void *)MEMORY[0x263EFF9A0];
    id v8 = [v4 messagePayload];
    objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

    uint64_t v10 = @"com.apple.homekit-entitledclient.identifer";
    uint64_t v11 = [v4 dictionaryForKey:@"kAppDataInformationKey"];
    int v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    unint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v41 = v15;
      __int16 v42 = 2112;
      char v43 = @"com.apple.homekit-entitledclient.identifer";
      __int16 v44 = 2112;
      int v45 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating application data for: %@ to %@", buf, 0x20u);
    }
    char v16 = [(HMDService *)v13 appData];
    id v17 = (HMDApplicationData *)[v16 copy];
    uint64_t v18 = v17;
    if (v11)
    {
      if (!v17)
      {
        uint64_t v19 = [HMDApplicationData alloc];
        uint64_t v20 = [(HMDService *)v13 uuid];
        uint64_t v18 = [(HMDApplicationData *)v19 initWithParentUUID:v20];
      }
      [(HMDApplicationData *)v18 setApplicationData:v11 forIdentifier:@"com.apple.homekit-entitledclient.identifer"];
      uint64_t v21 = [(HMDApplicationData *)v18 modelObjectWithChangeType:1];
      int v22 = v21;
      if (!v16) {
        [v21 setObjectChangeType:1];
      }
      int v39 = v16;
      [v9 setObject:v11 forKey:@"kAppDataInformationKey"];
      if (v22) {
        goto LABEL_10;
      }
    }
    else
    {
      [(HMDApplicationData *)v17 removeApplicationDataForIdentifier:@"com.apple.homekit-entitledclient.identifer"];
      if (!v18)
      {
LABEL_17:
        [v4 respondWithPayload:0];
        goto LABEL_18;
      }
      int v39 = v16;
      int v22 = [(HMDApplicationData *)v18 modelObjectWithChangeType:1];
      if (v22)
      {
LABEL_10:
        long long v23 = [v6 backingStore];
        [v4 name];
        __int16 v24 = v11;
        id v25 = v4;
        v27 = __int16 v26 = v6;
        uint64_t v28 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        [v23 transaction:v27 options:v28];
        uint64_t v38 = v9;
        v30 = id v29 = v5;

        id v6 = v26;
        id v4 = v25;
        uint64_t v11 = v24;

        [v30 add:v22 withMessage:v4];
        [v30 run];

        id v5 = v29;
        uint64_t v9 = v38;

        char v16 = v39;
LABEL_18:

        char v37 = @"com.apple.homekit-entitledclient.identifer";
        goto LABEL_19;
      }
    }
    char v16 = v39;
    goto LABEL_17;
  }
  uint64_t v31 = (void *)MEMORY[0x230FBD990]();
  v32 = self;
  uint64_t v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v34 = HMFGetLogIdentifier();
    int v35 = [v5 name];
    uint64_t v36 = [(HMDService *)v32 name];
    *(_DWORD *)buf = 138543874;
    v41 = v34;
    __int16 v42 = 2112;
    char v43 = v35;
    __int16 v44 = 2112;
    int v45 = v36;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to set appData on an accessory %@ service '%@' that is no longer part of a home", buf, 0x20u);
  }
  uint64_t v9 = [v4 responseHandler];
  char v37 = [MEMORY[0x263F087E8] hmErrorWithCode:12];
  ((void (**)(void, __CFString *, void))v9)[2](v9, v37, 0);
LABEL_19:
}

- (void)setAppData:(id)a3
{
  id v4 = (HMDApplicationData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  appData = self->_appData;
  self->_appData = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMDApplicationData)appData
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_appData;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)logIdentifier
{
  BOOL v3 = NSString;
  id v4 = [(HMDService *)self accessory];
  id v5 = [v4 uuid];
  id v6 = [(HMDService *)self type];
  id v7 = HAPShortUUIDType();
  id v8 = [(HMDService *)self instanceID];
  uint64_t v9 = [v3 stringWithFormat:@"%@/%@/%@", v5, v7, v8];

  return v9;
}

- (void)setLastSeenConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastSeenConfiguredName = self->_lastSeenConfiguredName;
  self->_lastSeenConfiguredName = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)lastSeenConfiguredName
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_lastSeenConfiguredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setExpectedConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  expectedConfiguredName = self->_expectedConfiguredName;
  self->_expectedConfiguredName = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)expectedConfiguredName
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_expectedConfiguredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)configuredName
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_configuredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setProvidedName:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  providedName = self->_providedName;
  self->_providedName = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)providedName
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_providedName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)isCustom
{
  id v2 = [(HMDService *)self serviceType];
  BOOL v3 = [v2 substringFromIndex:8];

  LOBYTE(v2) = [v3 isEqualToString:@"-0000-1000-8000-0026BB765291"] ^ 1;
  return (char)v2;
}

- (id)home
{
  id v2 = [(HMDService *)self accessory];
  BOOL v3 = [v2 home];

  return v3;
}

- (NSString)serviceIdentifier
{
  BOOL v3 = NSString;
  id v4 = [(HMDService *)self accessory];
  id v5 = [v4 uuid];
  id v6 = [v5 UUIDString];
  id v7 = [(HMDService *)self instanceID];
  id v8 = [v3 stringWithFormat:@"%@:%@", v6, v7];

  return (NSString *)v8;
}

- (NSNumber)instanceID
{
  id v2 = (void *)[(NSNumber *)self->_instanceID copy];
  return (NSNumber *)v2;
}

- (NSString)type
{
  id v2 = [(HMDService *)self serviceType];
  BOOL v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (id)dumpState
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  id v4 = [(HMDService *)self associatedServiceType];

  if (v4)
  {
    id v5 = NSString;
    id v6 = +[HMDHAPMetadata getSharedInstance];
    id v7 = [(HMDService *)self associatedServiceType];
    id v8 = [v6 descriptionForServiceType:v7];
    v103 = [v5 stringWithFormat:@", associatedServiceType: %@", v8];
  }
  else
  {
    v103 = &stru_26E2EB898;
  }
  uint64_t v9 = [(HMDService *)self serviceType];
  uint64_t v10 = (void *)*MEMORY[0x263F357F0];
  if ([v9 hasSuffix:*MEMORY[0x263F357F0]])
  {
    uint64_t v11 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - objc_msgSend(v10, "length"));

    int v102 = (void *)v11;
  }
  else
  {
    int v102 = v9;
  }
  uint64_t v83 = (void *)v3;
  int v12 = [NSString string];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  uint64_t v13 = [(HMDService *)self linkedServices];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v109 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v108 + 1) + 8 * i);
        if ([v12 length])
        {
          uint64_t v19 = [v12 stringByAppendingFormat:@", "];

          int v12 = (void *)v19;
        }
        uint64_t v20 = v12;
        int v12 = [v12 stringByAppendingFormat:@"%@", v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v108 objects:v113 count:16];
    }
    while (v15);
  }

  v95 = NSString;
  v101 = [(HMDService *)self instanceID];
  char v100 = [(HMDService *)self name];
  unint64_t v78 = [(HMDService *)self serviceProperties];
  [(HMDService *)self isPrimary];
  v99 = HMFBooleanToString();
  [(HMDService *)self isCustom];
  v98 = HMFBooleanToString();
  [(HMDService *)self isHidden];
  char v97 = HMFBooleanToString();
  BOOL v21 = [(HMDService *)self isHidden];
  if (v21)
  {
    uint64_t v84 = &stru_26E2EB898;
  }
  else
  {
    int v22 = NSString;
    long long v61 = [(HMDService *)self urlString];
    uint64_t v84 = [v22 stringWithFormat:@", assistantIdentifier: %@", v61];
  }
  uint64_t v82 = [v12 length];
  if (v82)
  {
    uint64_t v93 = [NSString stringWithFormat:@", Links: %@", v12];
  }
  else
  {
    uint64_t v93 = &stru_26E2EB898;
  }
  unint64_t v81 = [(HMDService *)self serviceSubtype];
  if (v81)
  {
    long long v23 = NSString;
    __int16 v73 = [(HMDService *)self serviceSubtype];
    v92 = [v23 stringWithFormat:@", subType: %@", v73];
  }
  else
  {
    v92 = &stru_26E2EB898;
  }
  uint64_t v24 = [(HMDService *)self labelIndex];
  if (v24)
  {
    id v25 = NSString;
    uint64_t v72 = [(HMDService *)self labelIndex];
    char v91 = [v25 stringWithFormat:@", labelIndex: %@", v72];
  }
  else
  {
    char v91 = &stru_26E2EB898;
  }
  uint64_t v26 = [(HMDService *)self labelNamespace];
  if (v26)
  {
    unint64_t v27 = NSString;
    char v71 = [(HMDService *)self labelNamespace];
    v90 = [v27 stringWithFormat:@", labelNamespace: %@", v71];
  }
  else
  {
    v90 = &stru_26E2EB898;
  }
  uint64_t v28 = [(HMDService *)self configurationState];
  if (v28)
  {
    id v29 = NSString;
    v70 = [(HMDService *)self configurationState];
    v89 = [v29 stringWithFormat:@", configurationState: %@", v70];
  }
  else
  {
    v89 = &stru_26E2EB898;
  }
  uint64_t v30 = [(HMDService *)self expectedConfiguredName];
  if (v30)
  {
    uint64_t v31 = NSString;
    uint64_t v69 = [(HMDService *)self expectedConfiguredName];
    uint64_t v88 = [v31 stringWithFormat:@", expectedConfiguredName: %@", v69];
  }
  else
  {
    uint64_t v88 = &stru_26E2EB898;
  }
  uint64_t v75 = [(HMDService *)self lastSeenConfiguredName];
  if (v75)
  {
    v32 = NSString;
    uint64_t v68 = [(HMDService *)self lastSeenConfiguredName];
    uint64_t v87 = [v32 stringWithFormat:@", lastSeenConfiguredName: %@", v68];
  }
  else
  {
    uint64_t v87 = &stru_26E2EB898;
  }
  v94 = [(HMDService *)self lastKnownDiscoveryMode];
  if (v94)
  {
    uint64_t v33 = NSString;
    long long v67 = [(HMDService *)self lastKnownDiscoveryMode];
    v86 = [v33 stringWithFormat:@", lastKnownDiscoveryMode: %@", v67];
  }
  else
  {
    v86 = &stru_26E2EB898;
  }
  v74 = [(HMDService *)self lastKnownOperatingState];
  v80 = (void *)v24;
  if (v74)
  {
    __int16 v34 = NSString;
    uint64_t v66 = [(HMDService *)self lastKnownOperatingState];
    [v66 integerValue];
    __int16 v65 = HAPOperatingStateAsString();
    v85 = [v34 stringWithFormat:@", lastKnownOperatingState: %@", v65];
  }
  else
  {
    v85 = &stru_26E2EB898;
  }
  int v35 = [(HMDService *)self lastKnownOperatingStateAbnormalReasons];
  uint64_t v79 = (void *)v26;
  if (v35)
  {
    uint64_t v36 = NSString;
    long long v64 = [(HMDService *)self lastKnownOperatingStateAbnormalReasons];
    [v64 unsignedIntegerValue];
    char v63 = HAPOperatingStateAbnormalReasonsAsString();
    char v37 = [v36 stringWithFormat:@", lastKnownOperatingStateAbnormalReasons: %@", v63];
  }
  else
  {
    char v37 = &stru_26E2EB898;
  }
  v77 = (void *)v28;
  uint64_t v38 = [(HMDService *)self mediaSourceIdentifier];
  char v76 = (void *)v30;
  if (v38)
  {
    int v39 = NSString;
    char v62 = [(HMDService *)self mediaSourceIdentifier];
    uint64_t v40 = [v39 stringWithFormat:@", mediaSourceIdentifier: %@", v62];
  }
  else
  {
    uint64_t v40 = &stru_26E2EB898;
  }
  v41 = [(HMDService *)self mediaSourceDisplayOrder];
  if (v41)
  {
    __int16 v42 = NSString;
    [(HMDService *)self mediaSourceDisplayOrder];
    v44 = BOOL v43 = v21;
    int v45 = [v42 stringWithFormat:@", mediaSourceDisplayOrder: %@", v44];
    objc_msgSend(v95, "stringWithFormat:", @"instanceID: %@, type: %@, name: %@, properties: 0x%lx, primary: %@, custom: %@, hidden: %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", v101, v102, v100, v78, v99, v98, v97, v84, v103, v93, v92, v91, v90, v89, v88, v87,
      v86,
      v85,
      v37,
      v40,
    v96 = v45);

    BOOL v21 = v43;
  }
  else
  {
    objc_msgSend(v95, "stringWithFormat:", @"instanceID: %@, type: %@, name: %@, properties: 0x%lx, primary: %@, custom: %@, hidden: %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", v101, v102, v100, v78, v99, v98, v97, v84, v103, v93, v92, v91, v90, v89, v88, v87,
      v86,
      v85,
      v37,
      v40,
    v96 = &stru_26E2EB898);
  }

  if (v38)
  {
  }
  if (v35)
  {
  }
  if (v74)
  {
  }
  if (v94)
  {
  }
  if (v75)
  {
  }
  if (v76)
  {
  }
  if (v77)
  {
  }
  if (v79)
  {
  }
  if (v80)
  {
  }
  if (v81)
  {
  }
  if (v82) {

  }
  if (!v21)
  {
  }
  [v83 setObject:v96 forKeyedSubscript:*MEMORY[0x263F41FA8]];
  uint64_t v46 = [(HMDService *)self appData];
  BOOL v47 = [v46 dumpState];
  [v83 setObject:v47 forKeyedSubscript:*MEMORY[0x263F41E98]];

  uint64_t v48 = [(HMDService *)self characteristics];
  if ([v48 count])
  {
    id v49 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v48, "count"));
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v50 = v48;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v104 objects:v112 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v105;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v105 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = [*(id *)(*((void *)&v104 + 1) + 8 * j) dumpState];
          [v49 addObject:v55];
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v104 objects:v112 count:16];
      }
      while (v52);
    }

    [v83 setObject:v49 forKeyedSubscript:*MEMORY[0x263F41ED0]];
  }
  uint64_t v56 = [(HMDService *)self bulletinBoardNotification];

  if (v56)
  {
    char v57 = [(HMDService *)self bulletinBoardNotification];
    long long v58 = [v57 dumpState];
    [v83 setObject:v58 forKeyedSubscript:*MEMORY[0x263F41EC8]];
  }
  id v59 = v83;

  return v59;
}

- (NSString)description
{
  uint64_t v3 = [(HMDService *)self accessory];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  id v6 = [v3 name];
  id v7 = [v3 uuid];
  id v8 = [(HMDService *)self type];
  uint64_t v9 = HAPShortUUIDType();
  uint64_t v10 = [(HMDService *)self instanceID];
  uint64_t v11 = [v4 stringWithFormat:@"%@ %@/%@/%@/%@", v5, v6, v7, v9, v10];

  return (NSString *)v11;
}

- (void)setCharacteristics:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  characteristics = self->_characteristics;
  self->_characteristics = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSArray)characteristics
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_characteristics;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSUUID)spiClientIdentifier
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDService *)self accessory];
  id v4 = [v3 spiClientIdentifier];
  uint64_t v5 = [NSString stringWithFormat:@"%@", self->_instanceID];
  v9[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = spiClientIdentifierForUUIDAndSalts(v4, v6);

  return (NSUUID *)v7;
}

- (NSUUID)uuid
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_unfair_recursive_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained uuid];
    char v6 = [v5 isEqual:self->_cachedAccessoryUUID];

    if ((v6 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = self;
      HMFGetOSLogHandle();
      uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v7;
        HMFGetLogIdentifier();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [(NSUUID *)v8->_uuid UUIDString];
        uint64_t v11 = [v4 uuid];
        int v12 = [v11 UUIDString];
        uint64_t v13 = [(NSUUID *)self->_cachedAccessoryUUID UUIDString];
        *(_DWORD *)buf = 138544130;
        id v19 = v16;
        __int16 v20 = 2112;
        BOOL v21 = v10;
        __int16 v22 = 2112;
        long long v23 = v12;
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@HMDService %@ Accessory UUID is stale (%@!=%@).", buf, 0x2Au);

        id v7 = v17;
      }

      [(HMDService *)v8 _recalculateUUID];
    }
  }
  uint64_t v14 = self->_uuid;

  os_unfair_recursive_lock_unlock();
  return v14;
}

- (void)_recalculateUUID
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_uuid;
  id v4 = [(HMDService *)self accessory];
  uint64_t v5 = [v4 uuid];
  cachedAccessoryUUID = self->_cachedAccessoryUUID;
  self->_cachedAccessoryUUID = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  id v8 = [WeakRetained uuid];
  uint64_t v9 = +[HMDService generateUUIDWithAccessoryUUID:v8 serviceID:self->_instanceID];
  uuid = self->_uuid;
  self->_uuid = v9;

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    uint64_t v14 = v21 = v11;
    [(NSUUID *)v3 UUIDString];
    uint64_t v15 = v22 = v3;
    id v16 = [(NSUUID *)self->_uuid UUIDString];
    id v17 = objc_loadWeakRetained((id *)&self->_accessory);
    uint64_t v18 = [v17 uuid];
    id v19 = [v18 UUIDString];
    instanceID = self->_instanceID;
    *(_DWORD *)buf = 138544386;
    __int16 v24 = v14;
    __int16 v25 = 2112;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    uint64_t v28 = v16;
    __int16 v29 = 2112;
    uint64_t v30 = v19;
    __int16 v31 = 2112;
    v32 = instanceID;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@recalculated UUID of service %@ -> %@ (%@/%@)", buf, 0x34u);

    uint64_t v3 = v22;
    uint64_t v11 = v21;
  }
}

- (void)unconfigure
{
  uint64_t v3 = [(HMDService *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  id v5 = [(HMDService *)self home];
  id v4 = [v5 administratorHandler];
  [v4 deregisterReceiver:self];
}

- (void)dealloc
{
  [(HMDService *)self unconfigure];
  v3.receiver = self;
  v3.super_class = (Class)HMDService;
  [(HMDService *)&v3 dealloc];
}

- (HMDService)initWithAccessory:(id)a3 owner:(id)a4 instance:(id)a5 uuid:(id)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v43.receiver = self;
  v43.super_class = (Class)HMDService;
  uint64_t v14 = [(HMDService *)&v43 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_owner, v11);
    uint64_t v16 = HAPInstanceIDFromValue();
    instanceID = v15->_instanceID;
    v15->_instanceID = (NSNumber *)v16;

    if (!v15->_instanceID)
    {
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = v15;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        BOOL v21 = v41 = v11;
        *(_DWORD *)buf = 138543874;
        int v45 = v21;
        __int16 v46 = 2112;
        id v47 = v10;
        __int16 v48 = 2112;
        id v49 = &unk_26E471818;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@*** DEBUG THIS : FATAL ERROR : File a Radar : HomeKit | New Bugs *** :Service ID cannot be null for accessory : %@Assigning a default instance ID : %@", buf, 0x20u);

        id v11 = v41;
      }

      __int16 v22 = v15->_instanceID;
      v15->_instanceID = (NSNumber *)&unk_26E471818;
    }
    long long v23 = [v10 uuid];
    __int16 v24 = +[HMDService generateUUIDWithAccessoryUUID:v23 serviceID:v15->_instanceID];

    p_uuid = (id *)&v15->_uuid;
    if (v13)
    {
      objc_storeStrong(p_uuid, a6);
      if ([v13 isEqual:v24])
      {
LABEL_13:
        uint64_t v37 = [v10 uuid];
        cachedAccessoryUUID = v15->_cachedAccessoryUUID;
        v15->_cachedAccessoryUUID = (NSUUID *)v37;

        goto LABEL_14;
      }
      uint64_t v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = v15;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        [v13 UUIDString];
        uint64_t v30 = v40 = v26;
        __int16 v31 = [v24 UUIDString];
        [v10 uuid];
        v32 = id v42 = v11;
        *(_DWORD *)buf = 138544386;
        int v45 = v29;
        __int16 v46 = 2112;
        id v47 = v30;
        __int16 v48 = 2112;
        id v49 = v31;
        __int16 v50 = 2112;
        uint64_t v51 = v32;
        __int16 v52 = 2112;
        id v53 = v12;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@HMDService initWithAccessory Service UUID %@ but has a calculated UUID of %@ (%@/%@)", buf, 0x34u);

        id v11 = v42;
        uint64_t v26 = v40;
      }
    }
    else
    {
      objc_storeStrong(p_uuid, v24);
      uint64_t v26 = (void *)MEMORY[0x230FBD990]();
      uint64_t v33 = v15;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = HMFGetLogIdentifier();
        [v24 UUIDString];
        v36 = id v35 = v11;
        *(_DWORD *)buf = 138543618;
        int v45 = v34;
        __int16 v46 = 2112;
        id v47 = v36;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@HMDService initWithAccessory, calculated UUID of %@ (using calc'd value)", buf, 0x16u);

        id v11 = v35;
      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return v15;
}

- (HMDService)initWithTransaction:(id)a3 accessory:(id)a4 owner:(id)a5
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 instanceID];
  if (v11
    && (id v12 = (void *)v11,
        [v8 uuid],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    uint64_t v14 = [v8 instanceID];
    uint64_t v15 = [v8 uuid];
    uint64_t v16 = [(HMDService *)self initWithAccessory:v9 owner:v10 instance:v14 uuid:v15];

    if (v16)
    {
      id v74 = v9;
      id v17 = [v8 name];
      uint64_t v18 = objc_msgSend(v17, "hm_truncatedNameString");
      configuredName = v16->_configuredName;
      v16->_configuredName = (NSString *)v18;

      __int16 v20 = [v8 providedName];
      uint64_t v21 = objc_msgSend(v20, "hm_truncatedNameString");
      providedName = v16->_providedName;
      v16->_providedName = (NSString *)v21;

      uint64_t v23 = [v8 serviceType];
      serviceType = v16->_serviceType;
      v16->_serviceType = (NSString *)v23;

      uint64_t v25 = [v8 associatedServiceType];
      associatedServiceType = v16->_associatedServiceType;
      v16->_associatedServiceType = (NSString *)v25;

      uint64_t v27 = [v8 serviceSubtype];
      serviceSubtype = v16->_serviceSubtype;
      v16->_serviceSubtype = (NSString *)v27;

      uint64_t v29 = [v8 labelIndex];
      labelIndex = v16->_labelIndex;
      v16->_labelIndex = (NSNumber *)v29;

      uint64_t v31 = [v8 labelNamespace];
      labelNamespace = v16->_labelNamespace;
      v16->_labelNamespace = (NSNumber *)v31;

      uint64_t v33 = [v8 configurationState];
      configurationState = v16->_configurationState;
      v16->_configurationState = (NSNumber *)v33;

      uint64_t v35 = [v8 linkedServices];
      linkedServices = v16->_linkedServices;
      v16->_linkedServices = (NSArray *)v35;

      uint64_t v37 = [v8 serviceProperties];
      v16->_serviceProperties = [v37 unsignedIntegerValue];

      uint64_t v38 = [v8 expectedConfiguredName];
      uint64_t v39 = objc_msgSend(v38, "hm_truncatedNameString");
      expectedConfiguredName = v16->_expectedConfiguredName;
      v16->_expectedConfiguredName = (NSString *)v39;

      id v41 = [v8 lastSeenConfiguredNameLocal];
      uint64_t v42 = objc_msgSend(v41, "hm_truncatedNameString");
      lastSeenConfiguredName = v16->_lastSeenConfiguredName;
      v16->_lastSeenConfiguredName = (NSString *)v42;

      uint64_t v44 = [v8 lastKnownOperatingState];
      lastKnownOperatingState = v16->_lastKnownOperatingState;
      v16->_lastKnownOperatingState = (NSNumber *)v44;

      uint64_t v46 = [v8 lastKnownOperatingStateAbnormalReasons];
      lastKnownOperatingStateAbnormalReasons = v16->_lastKnownOperatingStateAbnormalReasons;
      v16->_lastKnownOperatingStateAbnormalReasons = (NSNumber *)v46;

      uint64_t v48 = [v8 mediaSourceIdentifier];
      mediaSourceIdentifier = v16->_mediaSourceIdentifier;
      v16->_mediaSourceIdentifier = (NSNumber *)v48;

      uint64_t v50 = [v8 mediaSourceDisplayOrder];
      mediaSourceDisplayOrder = v16->_mediaSourceDisplayOrder;
      v16->_mediaSourceDisplayOrder = (NSArray *)v50;

      uint64_t v52 = [v8 matterEndpointID];
      matterEndpointID = v16->_matterEndpointID;
      v16->_matterEndpointID = (NSNumber *)v52;

      uint64_t v54 = (void *)MEMORY[0x263EFF980];
      uint64_t v55 = [v8 characteristics];
      uint64_t v56 = objc_msgSend(v54, "arrayWithCapacity:", objc_msgSend(v55, "count"));

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v75 = v8;
      char v57 = [v8 characteristics];
      uint64_t v58 = [v57 countByEnumeratingWithState:&v76 objects:v80 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v59; ++i)
          {
            if (*(void *)v77 != v60) {
              objc_enumerationMutation(v57);
            }
            uint64_t v62 = *(void *)(*((void *)&v76 + 1) + 8 * i);
            char v63 = [HMDCharacteristic alloc];
            long long v64 = [(HMDService *)v16 accessory];
            __int16 v65 = [(HMDCharacteristic *)v63 initWithCharacteristic:v62 service:v16 accessory:v64];

            [v56 addObject:v65];
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v76 objects:v80 count:16];
        }
        while (v59);
      }

      uint64_t v66 = [v56 copy];
      characteristics = v16->_characteristics;
      v16->_characteristics = (NSArray *)v66;

      [(HMDService *)v16 _updateDefaultName];
      [(HMDService *)v16 _createNotification];

      id v9 = v74;
      id v8 = v75;
    }
    uint64_t v68 = v16;
    uint64_t v69 = v68;
  }
  else
  {
    v70 = (void *)MEMORY[0x230FBD990]();
    uint64_t v68 = self;
    char v71 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      uint64_t v72 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v82 = v72;
      __int16 v83 = 2112;
      id v84 = v8;
      _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_ERROR, "%{public}@unable to init service with a transaction (null instance ID?): %@", buf, 0x16u);
    }
    uint64_t v69 = 0;
  }

  return v69;
}

- (HMDService)init
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  char v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)_parseOperatingStateResponseValue:(id)a3 intoState:(id *)a4 abnormalReasons:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v25 = 0;
    uint64_t v11 = [MEMORY[0x263F35A68] parsedFromData:v8 error:&v25];
    id v12 = v25;
    if (v11)
    {
      id v13 = [v11 state];
      uint64_t v14 = v13;
      if (v13)
      {
        id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "value"));
      }
      id v15 = *a4;
      *a4 = v13;

      uint64_t v16 = [v11 abnormalReasons];
      id v17 = v16;
      if (v16)
      {
        uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "value"));
      }
      id v18 = *a5;
      *a5 = v16;

      BOOL v19 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    id v12 = 0;
  }
  __int16 v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = a1;
  __int16 v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse operating state response value %@: %@", buf, 0x20u);
  }
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_processUpdateOnPowerManagementServiceForCharacteristicType:(id)a3 value:(id)a4 serviceType:(id)a5 accessory:(id)a6 accessoryTransaction:(id)a7
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (([v14 isEqualToString:@"00000221-0000-1000-8000-0026BB765291"] & 1) == 0)
  {
    id v50 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Invalid service type was passed." userInfo:0];
    objc_exception_throw(v50);
  }
  id v17 = [v15 identifier];
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    __int16 v20 = [v16 hapAccessoryLocal];
    id v19 = [v20 identifier];
  }
  if (![v12 isEqualToString:@"00000222-0000-1000-8000-0026BB765291"])
  {
    if (![v12 isEqualToString:@"00000251-0000-1000-8000-0026BB765291"])
    {
      uint64_t v40 = 0;
      id v22 = 0;
      BOOL v41 = 0;
      goto LABEL_20;
    }
    id v53 = v19;
    id v54 = 0;
    id v31 = +[HMDSupportedSleepConfigurationTLV parsedFromData:v13 error:&v54];
    id v22 = v54;
    uint64_t v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = a1;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v52 = v12;
      id v35 = v15;
      id v36 = v14;
      id v37 = v13;
      v39 = id v38 = v16;
      *(_DWORD *)buf = 138543874;
      char v57 = v39;
      __int16 v58 = 2112;
      uint64_t v59 = v31;
      __int16 v60 = 2112;
      id v61 = v22;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Parsed supportedSleepConfiguration: %@ with error: %@", buf, 0x20u);

      id v16 = v38;
      id v13 = v37;
      id v14 = v36;
      id v15 = v35;
      id v12 = v52;
    }

    if (v22 || ([v15 isSuspendCapable] & 1) != 0)
    {

      goto LABEL_16;
    }
    [v16 setSuspendCapable:MEMORY[0x263EFFA88]];

    uint64_t v40 = 0;
LABEL_29:
    id v22 = 0;
    BOOL v41 = 1;
    goto LABEL_18;
  }
  id v53 = v19;
  id v55 = 0;
  id v21 = +[HMDWakeConfiguration parsedFromData:v13 error:&v55];
  id v22 = v55;
  uint64_t v23 = (void *)MEMORY[0x230FBD990]();
  id v24 = a1;
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v51 = v12;
    id v26 = v15;
    id v27 = v14;
    id v28 = v13;
    v30 = id v29 = v16;
    *(_DWORD *)buf = 138543874;
    char v57 = v30;
    __int16 v58 = 2112;
    uint64_t v59 = v21;
    __int16 v60 = 2112;
    id v61 = v22;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Parsed HMDWakeConfiguration: %@ with error: %@", buf, 0x20u);

    id v16 = v29;
    id v13 = v28;
    id v14 = v27;
    id v15 = v26;
    id v12 = v51;
  }

  if (!v22)
  {
    uint64_t v40 = +[HMFConnectivityInfo connectivityInfoWithAccessoryIdentifier:v53 wakeConfiguration:v21];

    if (!v40)
    {
      id v22 = 0;
      goto LABEL_17;
    }
    objc_super v43 = v16;
    uint64_t v44 = [v15 connectivityInfo];
    char v45 = HMFEqualObjects();

    if (v45)
    {
      id v22 = 0;
      BOOL v41 = 0;
      id v16 = v43;
      goto LABEL_18;
    }
    id v16 = v43;
    [v43 setConnectivityInfo:v40];
    uint64_t v46 = (void *)MEMORY[0x230FBD990]([v43 setSuspendCapable:MEMORY[0x263EFFA88]]);
    id v47 = v24;
    uint64_t v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      id v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      char v57 = v49;
      __int16 v58 = 2112;
      uint64_t v59 = v40;
      __int16 v60 = 2112;
      id v61 = v43;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Setting connectivityInfo %@ to accessory transaction: %@", buf, 0x20u);

      id v16 = v43;
    }

    goto LABEL_29;
  }

LABEL_16:
  uint64_t v40 = 0;
LABEL_17:
  BOOL v41 = 0;
LABEL_18:
  id v19 = v53;
LABEL_20:

  return v41;
}

+ (BOOL)processUpdateForCharacteristicType:(id)a3 value:(id)a4 serviceType:(id)a5 service:(id)a6 serviceTransactionGetter:(id)a7 accessory:(id)a8 accessoryTransaction:(id)a9 accessoryTransactionChanged:(BOOL *)a10
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  long long v106 = (void (**)(void))a7;
  id v20 = a8;
  id v21 = a9;
  long long v105 = +[HMDHAPMetadata getSharedInstance];
  if (([v18 isEqualToString:*MEMORY[0x263F0D610]] & 1) != 0
    || ([v18 isEqualToString:*MEMORY[0x263F356A8]] & 1) != 0
    || [v18 isEqualToString:@"00000239-0000-1000-8000-0026BB765291"])
  {
    int v22 = [v20 updateAccessoryInformationWithCharacteristicType:v16 serviceType:v18 value:v17 accessoryTransaction:v21];
    if (a10)
    {
      if (v22) {
        *a10 = 1;
      }
    }
  }
  if ([v16 isEqualToString:*MEMORY[0x263F0C298]])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (+[HMDService validateProvidedName:v17])
      {
        if (!v19) {
          goto LABEL_64;
        }
        [v19 providedName];
        id v23 = a1;
        id v24 = v21;
        id v26 = v25 = v20;
        char v27 = HMFEqualObjects();

        id v20 = v25;
        id v21 = v24;
        a1 = v23;
        if ((v27 & 1) == 0)
        {
LABEL_64:
          id v76 = v21;
          id v77 = v20;
          if ([v20 supportsCHIP]
            && ([v20 home],
                long long v78 = objc_claimAutoreleasedReturnValue(),
                int v79 = [v78 isCurrentDevicePrimaryResident],
                v78,
                v79))
          {
            v80 = (void *)MEMORY[0x230FBD990]();
            id v81 = a1;
            uint64_t v82 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              __int16 v83 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v83;
              _os_log_impl(&dword_22F52A000, v82, OS_LOG_TYPE_INFO, "%{public}@Ignoring service transaction name update for matter", buf, 0xCu);
            }
            BOOL v37 = 0;
            id v29 = v106;
          }
          else
          {
            id v29 = v106;
            v86 = v106[2](v106);
            [v86 setProvidedName:v17];

            BOOL v37 = 0;
          }
          id v20 = v77;
          id v21 = v76;
          goto LABEL_101;
        }
      }
    }
  }
  if ([v16 isEqualToString:*MEMORY[0x263F0C000]])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = v17;
      if (![v28 length])
      {

        id v28 = 0;
      }
      id v29 = v106;
      if ([v19 shouldUpdateLastSeenConfiguredName:v28])
      {
        id v102 = v21;
        id v103 = v20;
        __int16 v30 = v19;
        id v31 = (void *)MEMORY[0x230FBD990]();
        id v32 = a1;
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = HMFGetLogIdentifier();
          id v35 = [v30 lastSeenConfiguredName];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v34;
          __int16 v109 = 2112;
          id v110 = v28;
          __int16 v111 = 2112;
          int v112 = v35;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@nameFromAccessory %@  lastSeenConfiguredName %@", buf, 0x20u);

          id v29 = v106;
        }

        id v36 = v29[2](v29);
        [v36 setLastSeenConfiguredNameLocal:v28];

        id v19 = v30;
        id v21 = v102;
        id v20 = v103;
      }

      BOOL v37 = 1;
      goto LABEL_101;
    }
  }
  if ([v16 isEqualToString:*MEMORY[0x263F0C3E8]])
  {
    BOOL v37 = 0;
    id v29 = v106;
    goto LABEL_101;
  }
  id v29 = v106;
  if ([v16 isEqualToString:@"00000232-0000-1000-8000-0026BB765291"])
  {
    id v107 = 0;
    *(void *)buf = 0;
    if ([a1 _parseOperatingStateResponseValue:v17 intoState:buf abnormalReasons:&v107])
    {
      id v38 = v21;
      id v39 = v20;
      if (!v19) {
        goto LABEL_70;
      }
      [v19 lastKnownOperatingState];
      v41 = uint64_t v40 = v19;
      int v42 = HMFEqualObjects();

      id v19 = v40;
      if (!v42) {
        goto LABEL_70;
      }
      objc_super v43 = [v40 lastKnownOperatingStateAbnormalReasons];
      char v44 = HMFEqualObjects();

      id v19 = v40;
      if (v44)
      {
        BOOL v37 = 0;
      }
      else
      {
LABEL_70:
        v106[2](v106);
        v85 = id v84 = v19;
        [v85 setLastKnownOperatingState:*(void *)buf];
        [v85 setLastKnownOperatingStateAbnormalReasons:v107];

        id v19 = v84;
        BOOL v37 = 1;
      }
      id v20 = v39;
      id v21 = v38;
    }
    else
    {
      BOOL v37 = 0;
    }

    goto LABEL_101;
  }
  long long v104 = v20;
  if ([v18 isEqualToString:*MEMORY[0x263F0D738]])
  {
    if ([v16 isEqualToString:*MEMORY[0x263F0C1D8]])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v19) {
          goto LABEL_92;
        }
        [v19 mediaSourceIdentifier];
        id v45 = a1;
        id v46 = v21;
        uint64_t v48 = v47 = v19;
        char v49 = HMFEqualObjects();

        id v19 = v47;
        id v21 = v46;
        a1 = v45;
        if ((v49 & 1) == 0)
        {
LABEL_92:
          v106[2](v106);
          char v100 = v99 = v19;
          [v100 setMediaSourceIdentifier:v17];
          goto LABEL_94;
        }
      }
    }
  }
  if ([v18 isEqualToString:*MEMORY[0x263F0D850]])
  {
    if ([v16 isEqualToString:@"00000136-0000-1000-8000-0026BB765291"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v50 = parseMediaSourceDisplayOrder(v17);
        if (v50)
        {
          id v51 = v21;
          if (!v19
            || ([v19 mediaSourceDisplayOrder],
                id v52 = v19,
                id v53 = objc_claimAutoreleasedReturnValue(),
                char v54 = [v50 isEqualToArray:v53],
                v53,
                id v19 = v52,
                (v54 & 1) == 0))
          {
            id v29 = v106;
            v106[2](v106);
            v56 = id v55 = v19;
            [v56 setMediaSourceDisplayOrder:v50];
LABEL_97:

            id v19 = v55;
            BOOL v37 = 1;
            goto LABEL_98;
          }
          goto LABEL_47;
        }
        goto LABEL_95;
      }
    }
  }
  if ([v18 isEqualToString:@"000000D0-0000-1000-8000-0026BB765291"])
  {
    if ([v16 isEqualToString:@"000000D5-0000-1000-8000-0026BB765291"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v50 = [v105 serviceSubtypeForValue:v17 forServiceType:@"000000D0-0000-1000-8000-0026BB765291"];
        if (v50)
        {
          id v51 = v21;
          if (!v19
            || ([v19 serviceSubtype],
                id v57 = v19,
                __int16 v58 = objc_claimAutoreleasedReturnValue(),
                char v59 = [v50 isEqual:v58],
                v58,
                id v19 = v57,
                (v59 & 1) == 0))
          {
            id v29 = v106;
            v106[2](v106);
            v56 = id v55 = v19;
            [v56 setServiceSubtype:v50];
            goto LABEL_97;
          }
LABEL_47:
          BOOL v37 = 0;
          id v29 = v106;
LABEL_98:
          id v21 = v51;
          goto LABEL_99;
        }
LABEL_95:
        BOOL v37 = 0;
LABEL_99:

        goto LABEL_100;
      }
    }
  }
  if ([v16 isEqualToString:@"000000CB-0000-1000-8000-0026BB765291"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v19) {
        goto LABEL_90;
      }
      [v19 labelIndex];
      id v60 = a1;
      id v61 = v21;
      v63 = id v62 = v19;
      char v64 = [v17 isEqual:v63];

      id v19 = v62;
      id v21 = v61;
      a1 = v60;
      if ((v64 & 1) == 0)
      {
LABEL_90:
        v106[2](v106);
        char v100 = v99 = v19;
        [v100 setLabelIndex:v17];
LABEL_94:

        id v19 = v99;
        BOOL v37 = 1;
LABEL_100:
        id v20 = v104;
        goto LABEL_101;
      }
    }
  }
  if ([v16 isEqualToString:@"000000CD-0000-1000-8000-0026BB765291"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v19) {
        goto LABEL_91;
      }
      [v19 labelNamespace];
      id v65 = a1;
      id v66 = v21;
      v68 = id v67 = v19;
      char v69 = [v17 isEqual:v68];

      id v19 = v67;
      id v21 = v66;
      a1 = v65;
      if ((v69 & 1) == 0)
      {
LABEL_91:
        v106[2](v106);
        char v100 = v99 = v19;
        [v100 setLabelNamespace:v17];
        goto LABEL_94;
      }
    }
  }
  if ([v16 isEqualToString:@"000000D6-0000-1000-8000-0026BB765291"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v19) {
        goto LABEL_93;
      }
      [v19 configurationState];
      id v70 = a1;
      id v71 = v21;
      v73 = id v72 = v19;
      char v74 = [v17 isEqual:v73];

      id v19 = v72;
      id v21 = v71;
      a1 = v70;
      if ((v74 & 1) == 0)
      {
LABEL_93:
        v106[2](v106);
        char v100 = v99 = v19;
        [v100 setConfigurationState:v17];
        goto LABEL_94;
      }
    }
  }
  if ([v18 isEqualToString:@"00000221-0000-1000-8000-0026BB765291"])
  {
    id v20 = v104;
    int v75 = [a1 _processUpdateOnPowerManagementServiceForCharacteristicType:v16 value:v17 serviceType:v18 accessory:v104 accessoryTransaction:v21];
    BOOL v37 = 0;
    if (a10 && v75)
    {
      BOOL v37 = 0;
      *a10 = 1;
    }
  }
  else
  {
    id v20 = v104;
    if ([v16 isEqualToString:*MEMORY[0x263F0C588]])
    {
      if ([v18 isEqualToString:*MEMORY[0x263F0D898]])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v87 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:v17];
          if (v87)
          {
            if (!v19) {
              goto LABEL_81;
            }
            [v104 primaryProfileVersion];
            id v88 = v21;
            v90 = id v89 = v19;
            char v91 = [v87 isEqualToVersion:v90];

            id v19 = v89;
            id v21 = v88;
            if ((v91 & 1) == 0)
            {
LABEL_81:
              [v87 versionString];
              v92 = v21;
              v94 = id v93 = v19;
              [v92 setPrimaryProfileVersion:v94];

              id v19 = v93;
              id v21 = v92;
              if (a10) {
                *a10 = 1;
              }
            }
          }

          BOOL v37 = 0;
          id v29 = v106;
          goto LABEL_100;
        }
      }
    }
    if ([v18 isEqualToString:@"0000022A-0000-1000-8000-0026BB765291"]
      && [v16 isEqualToString:@"0000022C-0000-1000-8000-0026BB765291"]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v95 = v21;
      id v96 = v19;
      char v97 = [v104 wiFiTransportCapabilities];
      char v98 = [v97 isEqualToNumber:v17];

      if (v98)
      {
        BOOL v37 = 0;
        id v19 = v96;
      }
      else
      {
        [v95 setWiFiTransportCapabilities:v17];
        id v19 = v96;
        BOOL v37 = 0;
        if (a10) {
          *a10 = 1;
        }
      }
      id v20 = v104;
      id v21 = v95;
    }
    else
    {
      BOOL v37 = 0;
    }
  }
LABEL_101:

  return v37;
}

+ (BOOL)validateProvidedName:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [MEMORY[0x263F089C0] alphanumericCharacterSet];
    uint64_t v8 = [v6 rangeOfCharacterFromSet:v7 options:129];
    BOOL v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v13;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ does not contain allowed characters", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ is not an NSString", (uint8_t *)&v19, 0x16u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_108835 != -1) {
    dispatch_once(&logCategory__hmf_once_t17_108835, &__block_literal_global_108836);
  }
  id v2 = (void *)logCategory__hmf_once_v18_108837;
  return v2;
}

void __25__HMDService_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v18_108837;
  logCategory__hmf_once_v18_108837 = v0;
}

+ (id)generateUUIDWithAccessoryUUID:(id)a3 serviceID:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HAPInstanceIDFromValue();
  id v6 = [v5 stringValue];
  v10[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  uint64_t v8 = objc_msgSend(MEMORY[0x263F08C38], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v4, 0, v7);

  return v8;
}

- (NSDictionary)assistantObject
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDService *)self accessory];
  id v4 = [v3 hostAccessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  BOOL v118 = v3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = v3;
  }
  id v8 = v7;
  BOOL v9 = [(HMDService *)self name];
  id v10 = [v8 home];
  id v11 = v10;
  if (v10)
  {
    id v12 = [(HMDService *)v10 name];

    if (v12 && v9 != 0)
    {
      v115 = [MEMORY[0x263EFF980] array];
      id v18 = +[HMDHAPMetadata getSharedInstance];
      int v19 = [(HMDService *)self type];
      v117 = v18;
      int v20 = [v18 shouldFilterServiceOfTypeFromApp:v19];

      if (v20)
      {
        __int16 v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = self;
        uint64_t v23 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
LABEL_20:

LABEL_21:
          id v29 = 0;
LABEL_106:

          goto LABEL_107;
        }
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v151 = v24;
        __int16 v152 = 2112;
        v153 = v22;
        id v25 = "%{public}@Service (%@) is hidden from apps not sending to siri";
        p_super = v23;
        os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
        uint32_t v28 = 22;
LABEL_19:
        _os_log_impl(&dword_22F52A000, p_super, v27, v25, buf, v28);

        goto LABEL_20;
      }
      uint64_t v113 = v8;
      uint64_t v114 = v11;
      __int16 v111 = v9;
      id v112 = v6;
      __int16 v30 = [(HMDService *)self type];
      int v121 = [v30 isEqualToString:@"000000D0-0000-1000-8000-0026BB765291"];

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v31 = [(HMDService *)self characteristics];
      id v32 = (void *)[v31 copy];

      id obj = v32;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v140 objects:v149 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        int v119 = 0;
        uint64_t v35 = *(void *)v141;
        id v36 = v117;
        do
        {
          uint64_t v37 = 0;
          uint64_t v123 = v34;
          do
          {
            if (*(void *)v141 != v35) {
              objc_enumerationMutation(obj);
            }
            id v38 = *(HMDService **)(*((void *)&v140 + 1) + 8 * v37);
            id v39 = [(HMDService *)v38 type];
            uint64_t v40 = [v36 mapToAssistantCharacteristicName:v39];
            BOOL v41 = [(HMDService *)v38 type];
            int v42 = [v36 shouldFilterCharacteristicOfTypeFromApp:v41];

            if (v42)
            {
              uint64_t v43 = v35;
              char v44 = (void *)MEMORY[0x230FBD990]();
              id v45 = self;
              id v46 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                id v47 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v151 = v47;
                __int16 v152 = 2112;
                v153 = v38;
                _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic (%@) is hidden from apps not sending to siri", buf, 0x16u);

                id v36 = v117;
              }

              uint64_t v35 = v43;
              uint64_t v34 = v123;
            }
            else
            {
              if (v40 && ([v40 isEqualToString:@"IDENTIFY"] & 1) == 0) {
                [v115 addObject:v39];
              }
              if (v121) {
                v119 |= [v39 isEqualToString:@"000000D6-0000-1000-8000-0026BB765291"];
              }
            }

            ++v37;
          }
          while (v34 != v37);
          uint64_t v34 = [obj countByEnumeratingWithState:&v140 objects:v149 count:16];
        }
        while (v34);
      }
      else
      {
        int v119 = 0;
      }

      if ([v115 count])
      {
        id v6 = v112;
        id v8 = v113;
        BOOL v9 = v111;
        id v11 = v114;
        if ((v121 & v119) == 1)
        {
          uint64_t v48 = [(HMDService *)self configurationState];
          if (!v48
            || (char v49 = (void *)v48,
                [(HMDService *)self configurationState],
                id v50 = objc_claimAutoreleasedReturnValue(),
                uint64_t v51 = [v50 integerValue],
                v50,
                v49,
                !v51))
          {
            __int16 v21 = (void *)MEMORY[0x230FBD990]();
            HMFGetOSLogHandle();
            id v22 = (HMDService *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(&v22->super.super, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            uint64_t v23 = HMFGetLogIdentifier();
            id v24 = [(HMDService *)v114 name];
            *(_DWORD *)buf = 138544130;
            v151 = v23;
            __int16 v152 = 2112;
            v153 = v114;
            __int16 v154 = 2112;
            v155 = v24;
            __int16 v156 = 2112;
            v157 = v111;
            id v25 = "%{public}@Skipping because service is not user configured: service.accessory.home %@  service.accessor"
                  "y.home.name %@  service.name %@";
            p_super = &v22->super.super;
            os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
            uint32_t v28 = 42;
            goto LABEL_19;
          }
        }
        id v52 = objc_alloc(MEMORY[0x263EFF9A0]);
        v148[0] = *MEMORY[0x263F655E8];
        v147[0] = @"objectType";
        v147[1] = @"objectIdentifier";
        id v53 = [(HMDService *)self urlString];
        v148[1] = v53;
        void v147[2] = @"objectServiceType";
        char v54 = [(HMDService *)self type];
        void v148[2] = v54;
        v147[3] = @"objectHome";
        id v55 = [(HMDService *)v114 name];
        v148[3] = v55;
        v147[4] = @"objectHomeIdentifier";
        uint64_t v56 = [(HMDService *)v114 urlString];
        v148[4] = v56;
        v148[5] = self;
        v147[5] = @"objectReference";
        v147[6] = @"objectName";
        v147[7] = @"objectCharacteristics";
        v148[6] = v111;
        v148[7] = v115;
        id v57 = [NSDictionary dictionaryWithObjects:v148 forKeys:v147 count:8];
        __int16 v58 = (void *)[v52 initWithDictionary:v57];

        if (v121)
        {
          uint64_t v59 = 0;
        }
        else
        {
          id v60 = [v113 category];
          id v61 = [v60 categoryType];
          if (v61)
          {
            id v62 = [(HMDService *)self serviceType];
            uint64_t v59 = [v117 mapToAssistantServiceSubtypeName:v62 accessoryCategory:v61];

            if (!v59)
            {
              char v63 = [(HMDService *)self serviceType];
              char v64 = [v117 getServiceTypeAlias:v63];
              uint64_t v59 = [v117 mapToAssistantServiceSubtypeName:v64 accessoryCategory:v61];

              if (!v59)
              {
                id v65 = [(HMDService *)self serviceType];
                uint64_t v59 = [(HMDService *)self _serviceSubtypeFromLinkedServicesForServiceType:v65 accessoryCategory:v61];
              }
            }
          }
          else
          {
            uint64_t v59 = 0;
          }
        }
        id v66 = [(HMDService *)self associatedServiceType];

        if (v66)
        {
          id v67 = [(HMDService *)self associatedServiceType];
          [v58 setObject:v67 forKey:@"objectAssociatedServiceType"];

          if (!v59)
          {
            uint64_t v68 = [(HMDService *)self associatedServiceType];
            uint64_t v59 = [v117 mapToAssistantServiceSubtypeName:v68];
          }
        }
        char v69 = [(HMDService *)self serviceSubtype];

        if (v69 && !v59)
        {
          id v70 = [(HMDService *)self serviceSubtype];
          uint64_t v59 = [v117 mapToAssistantServiceSubtypeName:v70];
        }
        if (v59) {
          [v58 setObject:v59 forKey:@"objectServiceSubType"];
        }
        id v71 = objc_msgSend(v113, "name", v59);

        if (v71)
        {
          id v72 = [v113 name];
          [v58 setObject:v72 forKey:@"objectAccessory"];

          __int16 v73 = [v113 urlString];
          [v58 setObject:v73 forKey:@"objectAccessoryIdentifier"];
        }
        v116 = v58;
        char v74 = [MEMORY[0x263EFF980] array];
        int v75 = [MEMORY[0x263EFF980] array];
        long long v136 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v76 = [(HMDService *)v114 serviceGroups];
        id v77 = (void *)[v76 copy];

        id v120 = v77;
        uint64_t v124 = [v77 countByEnumeratingWithState:&v136 objects:v146 count:16];
        if (v124)
        {
          uint64_t v122 = *(void *)v137;
          do
          {
            long long v78 = 0;
            do
            {
              if (*(void *)v137 != v122) {
                objc_enumerationMutation(v120);
              }
              obja = v78;
              int v79 = *(void **)(*((void *)&v136 + 1) + 8 * (void)v78);
              long long v132 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              v80 = [v79 serviceUUIDs];
              uint64_t v81 = [v80 countByEnumeratingWithState:&v132 objects:v145 count:16];
              if (v81)
              {
                uint64_t v82 = v81;
                uint64_t v83 = *(void *)v133;
                do
                {
                  for (uint64_t i = 0; i != v82; ++i)
                  {
                    if (*(void *)v133 != v83) {
                      objc_enumerationMutation(v80);
                    }
                    uint64_t v85 = *(void *)(*((void *)&v132 + 1) + 8 * i);
                    v86 = [(HMDService *)self uuid];
                    LODWORD(v85) = objc_msgSend(v86, "hmf_isEqualToUUIDString:", v85);

                    if (v85)
                    {
                      uint64_t v87 = [v79 name];
                      [v74 addObject:v87];

                      id v88 = [v79 urlString];
                      [v75 addObject:v88];
                    }
                  }
                  uint64_t v82 = [v80 countByEnumeratingWithState:&v132 objects:v145 count:16];
                }
                while (v82);
              }

              long long v78 = obja + 1;
            }
            while (obja + 1 != (char *)v124);
            uint64_t v124 = [v120 countByEnumeratingWithState:&v136 objects:v146 count:16];
          }
          while (v124);
        }

        if ([v74 count])
        {
          [v116 setObject:v74 forKey:@"objectGroups"];
          [v116 setObject:v75 forKey:@"objectGroupIdentifiers"];
        }
        id v89 = (void *)MEMORY[0x263EFF980];
        v90 = [(HMDService *)self linkedServices];
        objc_msgSend(v89, "arrayWithCapacity:", objc_msgSend(v90, "count"));
        id objb = (id)objc_claimAutoreleasedReturnValue();

        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        char v91 = [(HMDService *)self linkedServices];
        uint64_t v92 = [v91 countByEnumeratingWithState:&v128 objects:v144 count:16];
        if (v92)
        {
          uint64_t v93 = v92;
          uint64_t v94 = *(void *)v129;
          do
          {
            for (uint64_t j = 0; j != v93; ++j)
            {
              if (*(void *)v129 != v94) {
                objc_enumerationMutation(v91);
              }
              id v96 = [v118 findService:*(void *)(*((void *)&v128 + 1) + 8 * j)];
              char v97 = v96;
              if (v96)
              {
                uint64_t v98 = [v96 configurationState];
                if (!v98
                  || (id v99 = (void *)v98,
                      [v97 configurationState],
                      char v100 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v101 = [v100 integerValue],
                      v100,
                      v99,
                      v101))
                {
                  id v102 = [v97 urlString];
                  [objb addObject:v102];
                }
              }
            }
            uint64_t v93 = [v91 countByEnumeratingWithState:&v128 objects:v144 count:16];
          }
          while (v93);
        }

        if ((objc_msgSend(objb, "hmf_isEmpty") & 1) == 0)
        {
          id v103 = (void *)[objb copy];
          [v116 setObject:v103 forKey:@"objectRelatedIdentifiers"];
        }
        long long v104 = [v113 room];
        long long v105 = [v104 name];
        if (v105)
        {
          long long v106 = [(HMDService *)v114 name];
          char v107 = [v105 isEqualToString:v106];

          if ((v107 & 1) == 0)
          {
            [v116 setObject:v105 forKey:@"objectRoom"];
            long long v108 = [v104 urlString];
            [v116 setObject:v108 forKey:@"objectRoomIdentifier"];
          }
        }
        id v29 = (void *)[v116 copy];
      }
      else
      {
        id v29 = 0;
      }
      id v6 = v112;
      id v8 = v113;
      BOOL v9 = v111;
      id v11 = v114;
      goto LABEL_106;
    }
  }
  id v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v17 = [(HMDService *)v11 name];
    }
    else
    {
      id v17 = 0;
    }
    *(_DWORD *)buf = 138544130;
    v151 = v16;
    __int16 v152 = 2112;
    v153 = v11;
    __int16 v154 = 2112;
    v155 = v17;
    __int16 v156 = 2112;
    v157 = v9;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of service is nil: service.accessory.home %@  service.accessory.home.name %@  service.name %@", buf, 0x2Au);
    if (v11) {
  }
    }
  id v29 = 0;
LABEL_107:

  return (NSDictionary *)v29;
}

- (NSString)urlString
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDService *)self accessory];
  id v4 = [v3 hostAccessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 uuid];

  id v8 = v7;
  if (!v7)
  {
    id v8 = [v3 uuid];
  }
  BOOL v9 = NSString;
  id v10 = [(HMDService *)self instanceID];
  id v11 = [v9 stringWithFormat:@"%@", v10];
  v15[0] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = hm_assistantIdentifierWithSalts();

  if (!v7) {
  return (NSString *)v13;
  }
}

- (id)_serviceSubtypeFromLinkedServicesForServiceType:(id)a3 accessoryCategory:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x263F0D708], a4))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(HMDService *)self linkedServices];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      uint64_t v9 = *MEMORY[0x263F0D880];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [(HMDService *)self accessory];
          id v13 = [v12 findService:v11];

          if (v13)
          {
            id v14 = [v13 type];
            int v15 = [v14 isEqualToString:v9];

            if (v15)
            {
              id v16 = (id)*MEMORY[0x263F656B8];

              goto LABEL_14;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_14:
  }
  else
  {
    id v16 = 0;
  }
  return v16;
}

@end