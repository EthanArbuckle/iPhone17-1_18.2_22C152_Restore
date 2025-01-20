@interface HMMTRStorage
+ (BOOL)checkAndUpdateExpiryOfCertificate:(id)a3 keyPair:(id)a4 newCertificate:(id *)a5;
+ (BOOL)didUpdateMatterItems:(id)a3 oldStorage:(id)a4;
+ (BOOL)isMatterKey:(id)a3;
+ (BOOL)isMemoryStorageKey:(id)a3;
+ (BOOL)isPluginAccessoryNodeKey:(id)a3;
+ (BOOL)isPluginKey:(id)a3;
+ (BOOL)shouldIgnoreWritesForKey:(id)a3;
+ (id)accessoryNodeIDFromPluginKey:(id)a3;
+ (id)chipPluginStorageAccessoryNodeSpecificKeys;
+ (id)chipPluginStorageKeys;
+ (id)formatKeyForNodeId:(id)a3 key:(id)a4;
+ (id)generateIPK;
+ (id)ignoredMatterStorageKeys;
+ (id)keyByStrippingNodeIdFromKey:(id)a3;
+ (id)logCategory;
+ (id)matterItemsFromDictionary:(id)a3;
+ (id)matterStorageKeys;
+ (id)memoryStorageKeys;
+ (id)nodeIdFromPluginKey:(id)a3;
+ (id)removeRecordsForUnpairedNodesInDict:(id)a3 pairedNodes:(id)a4;
+ (id)shortDescription;
- (BOOL)_handlePerFabricStorageMaybeAvailable:(id)a3;
- (BOOL)_removeAllDataSourceData;
- (BOOL)_syncSetDataSourceDictionary:(id)a3;
- (BOOL)_syncSetDataSourceValue:(id)a3 forKey:(id)a4;
- (BOOL)_syncSetDataSourceValuesWithError:(id *)a3 block:(id)a4;
- (BOOL)areCachedCertificatesValidForFabricID:(id)a3;
- (BOOL)caseAuthenticatedTagsUpdated;
- (BOOL)isFabricCreationInProgress;
- (BOOL)isLocalStorageMode;
- (BOOL)isResidentDevice;
- (BOOL)isSharedAdmin;
- (BOOL)isStagedForNode:(id)a3;
- (BOOL)isSystemCommissionerFabric;
- (BOOL)localStorageMode;
- (BOOL)removeValueForKey:(id)a3;
- (BOOL)removeValueForKey:(id)a3 systemCommissionerFabric:(BOOL)a4;
- (BOOL)replaceAllKeysAndSyncWithBlock:(id)a3 systemCommissionerFabric:(BOOL)a4;
- (BOOL)setStorageData:(id)a3 forKey:(id)a4;
- (BOOL)setValueForKey:(id)a3 removingKeys:(id)a4 systemCommissionerFabric:(BOOL)a5 block:(id)a6;
- (BOOL)setValueForKey:(id)a3 value:(id)a4;
- (BOOL)setValueForKey:(id)a3 value:(id)a4 systemCommissionerFabric:(BOOL)a5;
- (BOOL)storageSyncInProgress;
- (BOOL)storageSyncPending;
- (BOOL)syncDataSourceDictionary:(id)a3 forFabric:(id)a4;
- (BOOL)wedSupportedForSystemCommissionerFabricNode:(id)a3;
- (HMMTRFabricStorageDataSource)fabricDataSource;
- (HMMTRMatterKeypair)nocSigner;
- (HMMTRMatterKeypair)operationalKeyPair;
- (HMMTRMatterKeypair)systemCommissionerNocSigner;
- (HMMTRStorage)initWithQueue:(id)a3;
- (HMMTRStorageDataSource)dataSource;
- (HMMTRStorageDelegate)delegate;
- (MTSKeyValueStore)systemCommissionerKeyValueStore;
- (NSData)operationalCert;
- (NSData)ownerIPK;
- (NSData)rootCert;
- (NSDictionary)localStorageWithoutUpdates;
- (NSMutableDictionary)appleFabricLocalStorage;
- (NSMutableDictionary)inMemoryStorage;
- (NSMutableDictionary)localStorage;
- (NSNumber)caseAuthenticatedTag;
- (NSNumber)certificateIssuerID;
- (NSNumber)fabricID;
- (NSNumber)ownerNodeID;
- (NSOperationQueue)keyValueStoreUpdateQueue;
- (NSSet)pairedNodeIDs;
- (OS_dispatch_queue)workQueue;
- (id)_cachedOperationalCertificateIfValidForFabricID:(id)a3;
- (id)_cachedRootCertificateIfValidForFabricID:(id)a3;
- (id)_createOperationalCertificateForFabricID:(id)a3 rootCert:(id)a4 caseAuthenticatedTags:(id)a5 controllerNodeID:(id)a6;
- (id)_nodeIDFromOperationalX509Certificate:(id)a3;
- (id)_operationalCertificateFromSdkCertificatesForFabricID:(id)a3;
- (id)_preferencesValueForKey:(id)a3;
- (id)_rootCertificateFromSdkCertificatesForFabricID:(id)a3;
- (id)categoryForNode:(id)a3;
- (id)categoryForSystemCommissionerFabricNode:(id)a3;
- (id)configNumberForNode:(id)a3;
- (id)controllerNodeID;
- (id)deviceNameForSystemCommissionerFabricNode:(id)a3;
- (id)extendedMACAddressForSystemCommissionerFabricNode:(id)a3;
- (id)fabricIDForSystemCommissioner;
- (id)fabricIndexForNode:(id)a3;
- (id)ipkForCurrentFabric;
- (id)ipkForFabricID:(id)a3 forPairing:(BOOL)a4;
- (id)legacyNodeIDForCurrentFabric;
- (id)legacyNodeIDForFabricID:(id)a3;
- (id)logIdentifier;
- (id)nodeIDForFabricID:(id)a3 deviceIdentifier:(id)a4;
- (id)operationalCertForCurrentFabric;
- (id)operationalCertificate;
- (id)pairedNodeIDsFromStoredStringValue:(id)a3;
- (id)pairedNodeIDsOnSystemCommissionerFabric:(BOOL)a3;
- (id)productIDForNode:(id)a3;
- (id)productIDForSystemCommissionerFabricNode:(id)a3;
- (id)rootCertForCurrentFabric;
- (id)rootCertificate;
- (id)serialNumberForSystemCommissionerFabricNode:(id)a3;
- (id)setupPayloadForSystemCommissionerFabricNode:(id)a3;
- (id)storageDataForKey:(id)a3;
- (id)storedStringValueFromPairedNodeIDs:(id)a3;
- (id)systemCommissionerFabricNodeIDForUuid:(id)a3;
- (id)topologyForNode:(id)a3;
- (id)uuidForSystemCommissionerFabricNode:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 systemCommissionerFabric:(BOOL)a4;
- (id)vendorIDForNode:(id)a3;
- (id)vendorIDForSystemCommissionerFabricNode:(id)a3;
- (unsigned)knownFabricInStorage:(id)a3 fabricID:(id)a4 keyPair:(id)a5 controllerNodeID:(id *)a6 rootCertificate:(id *)a7;
- (unsigned)knownFabricWithID:(id)a3;
- (void)_fetchCertForFabricWithID:(id)a3 isOwner:(BOOL)a4 forPairing:(BOOL)a5 forceFetchFromResident:(BOOL)a6 completion:(id)a7;
- (void)_handleUpdatedDataWithIsLocalChange:(BOOL)a3;
- (void)_removeSystemCommissionerFabricNodeIDForUuid:(id)a3;
- (void)_setPreferencesValueForKey:(id)a3 value:(id)a4;
- (void)_syncToRemoteStorage;
- (void)addPairedNodeID:(id)a3;
- (void)addPairedNodeID:(id)a3 toSystemCommissionerFabric:(BOOL)a4;
- (void)endLocalStorageModeByPersistingAppleFabricData;
- (void)endLocalStorageModeBySyncingToRemote:(BOOL)a3;
- (void)fetchCertForFabricWithID:(id)a3 isOwner:(BOOL)a4 forPairing:(BOOL)a5 forceFetchFromResident:(BOOL)a6 completion:(id)a7;
- (void)fetchCertificatesFromStorageForFabricID:(id)a3 controllerNodeID:(id)a4 rootCert:(id *)a5 operationalCert:(id *)a6 residentNodeID:(id *)a7 ipk:(id *)a8;
- (void)handlePrimaryResidentDataReady;
- (void)handleUpdatedCurrentFabricIndex;
- (void)handleUpdatedDataForFabricIndex:(id)a3 isLocalChange:(BOOL)a4;
- (void)handleUpdatedDataForFabricIndex:(id)a3 nodeID:(id)a4 isLocalChange:(BOOL)a5;
- (void)handleUpdatedDataWithIsLocalChange:(BOOL)a3;
- (void)persistLegacyControllerNodeWithDictionary:(id)a3;
- (void)prepareStorageForFabricID:(id)a3;
- (void)prepareStorageForFabricID:(id)a3 forInitialSetup:(BOOL)a4;
- (void)removeAndSyncAllKeysNotIncludedInActiveNodeIDs:(id)a3;
- (void)removePairedNodeID:(id)a3;
- (void)removePairedNodeID:(id)a3 fromSystemCommissionerFabric:(BOOL)a4;
- (void)removeRecordsForNode:(id)a3 systemCommissionerFabric:(BOOL)a4;
- (void)removeRecordsForNodeIDs:(id)a3 systemCommissionerFabric:(BOOL)a4;
- (void)removeRecordsForSystemCommissionerFabricNode:(id)a3;
- (void)setAppleFabricLocalStorage:(id)a3;
- (void)setCaseAuthenticatedTag:(id)a3;
- (void)setCaseAuthenticatedTagsUpdated:(BOOL)a3;
- (void)setCategory:(id)a3 forNode:(id)a4;
- (void)setCategory:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setCertificateIssuerID:(id)a3;
- (void)setConfigNumber:(id)a3 forNode:(id)a4;
- (void)setControllerNodeID:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceName:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setExtendedMACAddress:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setFabricCreationInProgress:(BOOL)a3;
- (void)setFabricDataSource:(id)a3;
- (void)setFabricID:(id)a3;
- (void)setFabricID:(id)a3 forNode:(id)a4;
- (void)setInMemoryStorage:(id)a3;
- (void)setLocalStorage:(id)a3;
- (void)setLocalStorageMode:(BOOL)a3;
- (void)setLocalStorageWithoutUpdates:(id)a3;
- (void)setNocSigner:(id)a3;
- (void)setOperationalCert:(id)a3;
- (void)setOperationalCertificate:(id)a3;
- (void)setOperationalKeyPair:(id)a3;
- (void)setOwnerIPK:(id)a3;
- (void)setOwnerNodeID:(id)a3;
- (void)setPairedNodeIDs:(id)a3;
- (void)setPairedNodeIDs:(id)a3 forSystemCommissionerFabric:(BOOL)a4;
- (void)setProductID:(id)a3 forNode:(id)a4;
- (void)setProductID:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setRootCert:(id)a3;
- (void)setRootCertificate:(id)a3;
- (void)setSerialNumber:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setSetupPayload:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setSharedAdmin:(BOOL)a3;
- (void)setStaged:(BOOL)a3 forNode:(id)a4;
- (void)setStorageSyncInProgress:(BOOL)a3;
- (void)setStorageSyncPending:(BOOL)a3;
- (void)setSystemCommissionerFabric:(BOOL)a3;
- (void)setSystemCommissionerFabricID:(id)a3;
- (void)setSystemCommissionerFabricNodeID:(id)a3 forUuid:(id)a4;
- (void)setSystemCommissionerKeyValueStore:(id)a3;
- (void)setSystemCommissionerNocSigner:(id)a3;
- (void)setTopology:(id)a3 forNode:(id)a4;
- (void)setUuid:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setVendorID:(id)a3 forNode:(id)a4;
- (void)setVendorID:(id)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)setWEDSupported:(BOOL)a3 forSystemCommissionerFabricNode:(id)a4;
- (void)startLocalStorageMode;
@end

@implementation HMMTRStorage

- (void)removeRecordsForSystemCommissionerFabricNode:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2533B64D0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v24 = 138543618;
    v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Deleting records from storage for System Commissioner Fabric NodeID: %@", (uint8_t *)&v24, 0x16u);
  }
  [(HMMTRStorage *)v6 removePairedNodeID:v4 fromSystemCommissionerFabric:1];
  v9 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.VendorID."];
  [(HMMTRStorage *)v6 removeValueForKey:v9 systemCommissionerFabric:1];

  v10 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.Topology."];
  [(HMMTRStorage *)v6 removeValueForKey:v10 systemCommissionerFabric:1];

  v11 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.FabricIndex."];
  [(HMMTRStorage *)v6 removeValueForKey:v11 systemCommissionerFabric:1];

  v12 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.ProductID."];
  [(HMMTRStorage *)v6 removeValueForKey:v12 systemCommissionerFabric:1];

  v13 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.Category."];
  [(HMMTRStorage *)v6 removeValueForKey:v13 systemCommissionerFabric:1];

  v14 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.ConfigNumber."];
  [(HMMTRStorage *)v6 removeValueForKey:v14 systemCommissionerFabric:1];

  v15 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.Staged."];
  [(HMMTRStorage *)v6 removeValueForKey:v15 systemCommissionerFabric:1];

  v16 = [(HMMTRStorage *)v6 uuidForSystemCommissionerFabricNode:v4];
  if (v16) {
    [(HMMTRStorage *)v6 _removeSystemCommissionerFabricNodeIDForUuid:v16];
  }
  v17 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.UUID."];
  [(HMMTRStorage *)v6 removeValueForKey:v17 systemCommissionerFabric:1];

  v18 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.SerialNumber."];
  [(HMMTRStorage *)v6 removeValueForKey:v18 systemCommissionerFabric:1];

  v19 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.DeviceName."];
  [(HMMTRStorage *)v6 removeValueForKey:v19 systemCommissionerFabric:1];

  v20 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.SetupPayload."];
  [(HMMTRStorage *)v6 removeValueForKey:v20 systemCommissionerFabric:1];

  v21 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.SetupPayloadString."];
  [(HMMTRStorage *)v6 removeValueForKey:v21 systemCommissionerFabric:1];

  v22 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.WEDSupported."];
  [(HMMTRStorage *)v6 removeValueForKey:v22 systemCommissionerFabric:1];

  v23 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.ExtendedMACAddress."];
  [(HMMTRStorage *)v6 removeValueForKey:v23 systemCommissionerFabric:1];
}

- (id)extendedMACAddressForSystemCommissionerFabricNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.MTS.ExtendedMACAddress."];
  v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)setExtendedMACAddress:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.MTS.ExtendedMACAddress."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (BOOL)wedSupportedForSystemCommissionerFabricNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.MTS.WEDSupported."];
  v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    int v8 = [v7 isEqual:&unk_2702B5040] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)setWEDSupported:(BOOL)a3 forSystemCommissionerFabricNode:(id)a4
{
  BOOL v4 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.MTS.WEDSupported."];
  id v6 = [NSNumber numberWithBool:v4];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)categoryForSystemCommissionerFabricNode:(id)a3
{
  BOOL v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.Category."];
  v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];

  return v5;
}

- (void)setCategory:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.Category."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)productIDForSystemCommissionerFabricNode:(id)a3
{
  BOOL v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.ProductID."];
  v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];

  return v5;
}

- (void)setProductID:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.ProductID."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)vendorIDForSystemCommissionerFabricNode:(id)a3
{
  BOOL v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.VendorID."];
  v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];

  return v5;
}

- (void)setVendorID:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.VendorID."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)setupPayloadForSystemCommissionerFabricNode:(id)a3
{
  id v4 = a3;
  v5 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.SetupPayload."];
  id v6 = [(HMMTRStorage *)self valueForKey:v5 systemCommissionerFabric:1];
  if (v6) {
    [(HMMTRStorage *)self removeValueForKey:v5 systemCommissionerFabric:1];
  }
  id v7 = +[HMMTRStorage formatKeyForNodeId:v4 key:@"HMD.MTRPlugin.MTS.SetupPayloadString."];

  id v8 = [(HMMTRStorage *)self valueForKey:v7 systemCommissionerFabric:1];
  if (!v8)
  {
    id v8 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if (v10) {
      [(HMMTRStorage *)self setValueForKey:v7 value:v10 systemCommissionerFabric:1];
    }
    else {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)setSetupPayload:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.MTS.SetupPayloadString."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)deviceNameForSystemCommissionerFabricNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.MTS.DeviceName."];
  v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];

  return v5;
}

- (void)setDeviceName:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.MTS.DeviceName."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)serialNumberForSystemCommissionerFabricNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.MTS.SerialNumber."];
  v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];

  return v5;
}

- (void)setSerialNumber:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.MTS.SerialNumber."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (void)_removeSystemCommissionerFabricNodeIDForUuid:(id)a3
{
  id v5 = [a3 UUIDString];
  id v4 = [@"HMD.MTRPlugin.MTS.NodeIDForUUID." stringByAppendingString:v5];
  [(HMMTRStorage *)self removeValueForKey:v4 systemCommissionerFabric:1];
}

- (id)systemCommissionerFabricNodeIDForUuid:(id)a3
{
  id v4 = [a3 UUIDString];
  id v5 = [@"HMD.MTRPlugin.MTS.NodeIDForUUID." stringByAppendingString:v4];
  id v6 = [(HMMTRStorage *)self valueForKey:v5 systemCommissionerFabric:1];

  return v6;
}

- (void)setSystemCommissionerFabricNodeID:(id)a3 forUuid:(id)a4
{
  id v6 = a3;
  id v8 = [a4 UUIDString];
  id v7 = [@"HMD.MTRPlugin.MTS.NodeIDForUUID." stringByAppendingString:v8];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)uuidForSystemCommissionerFabricNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.MTS.UUID."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:1];

  return v5;
}

- (void)setUuid:(id)a3 forSystemCommissionerFabricNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.MTS.UUID."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:1];
}

- (id)nodeIDForFabricID:(id)a3 deviceIdentifier:(id)a4
{
  v72[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRStorage *)self dataSource];
  v9 = [v8 storageDataSourceForFabricWithID:v6];

  if (v9)
  {
    id v10 = [v9 keyValueStore];
    v11 = [v10 objectForKeyedSubscript:@"HMD.MTRPlugin.PairedNodeIDs"];

    if (v11)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v11 options:0];
      if (v12)
      {
        v13 = (void *)MEMORY[0x263F08928];
        v14 = (void *)MEMORY[0x263EFFA08];
        v72[0] = objc_opt_class();
        v72[1] = objc_opt_class();
        v72[2] = objc_opt_class();
        v72[3] = objc_opt_class();
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:4];
        v16 = [v14 setWithArray:v15];
        id v62 = 0;
        v17 = [v13 unarchivedObjectOfClasses:v16 fromData:v12 error:&v62];
        id v57 = v62;

        if (v17)
        {
          v54 = v12;
          v55 = v11;
          v56 = v9;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          v53 = v17;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v71 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v59;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v59 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                int v24 = +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", v23, v53, v54, v55, v56);
                int v25 = [v7 hasPrefix:v24];

                if (v25)
                {
                  v43 = (void *)MEMORY[0x2533B64D0]();
                  v44 = self;
                  v45 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    v46 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138544130;
                    v64 = v46;
                    __int16 v65 = 2112;
                    id v66 = v23;
                    __int16 v67 = 2112;
                    id v68 = v6;
                    __int16 v69 = 2112;
                    id v70 = v7;
                    _os_log_impl(&dword_252495000, v45, OS_LOG_TYPE_INFO, "%{public}@NodeID %@ returned for fabric ID %@ and device identifier %@", buf, 0x2Au);
                  }
                  id v30 = v23;

                  goto LABEL_28;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v71 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          __int16 v26 = (void *)MEMORY[0x2533B64D0]();
          id v27 = self;
          uint64_t v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v64 = v29;
            __int16 v65 = 2112;
            id v66 = v7;
            __int16 v67 = 2112;
            id v68 = v6;
            _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to find nodeID matching device identifier %@ in fabric ID %@", buf, 0x20u);
          }
          id v30 = 0;
LABEL_28:
          v11 = v55;
          v9 = v56;
          v17 = v53;
          v12 = v54;
        }
        else
        {
          v47 = (void *)MEMORY[0x2533B64D0]();
          v48 = self;
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = v50 = v9;
            *(_DWORD *)buf = 138543874;
            v64 = v51;
            __int16 v65 = 2112;
            id v66 = v6;
            __int16 v67 = 2112;
            id v68 = v57;
            _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to load NodeID set for fabric ID %@ with error: %@", buf, 0x20u);

            v9 = v50;
            v17 = 0;
          }

          id v30 = 0;
        }
      }
      else
      {
        v39 = (void *)MEMORY[0x2533B64D0]();
        v40 = self;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v64 = v42;
          __int16 v65 = 2112;
          id v66 = v6;
          _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@No paired NodeIDs set for fabric ID %@", buf, 0x16u);
        }
        id v30 = 0;
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x2533B64D0]();
      v36 = self;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v64 = v38;
        __int16 v65 = 2112;
        id v66 = v6;
        _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_ERROR, "%{public}@Fabric storage for fabric ID %@ does not include paired node IDs", buf, 0x16u);
      }
      id v30 = 0;
    }
  }
  else
  {
    v31 = (void *)MEMORY[0x2533B64D0]();
    v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v64 = v34;
      __int16 v65 = 2112;
      id v66 = v6;
      _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@Request for nodeID failed to find storage for matching fabric ID: %@", buf, 0x16u);
    }
    id v30 = 0;
  }

  return v30;
}

- (void)removeAndSyncAllKeysNotIncludedInActiveNodeIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing all keys not included in active node IDs: %@", buf, 0x16u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HMMTRStorage_Records__removeAndSyncAllKeysNotIncludedInActiveNodeIDs___block_invoke;
  v10[3] = &unk_265375680;
  v10[4] = v6;
  id v11 = v4;
  id v9 = v4;
  [(HMMTRStorage *)v6 replaceAllKeysAndSyncWithBlock:v10 systemCommissionerFabric:[(HMMTRStorage *)v6 isSystemCommissionerFabric]];
}

id __72__HMMTRStorage_Records__removeAndSyncAllKeysNotIncludedInActiveNodeIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[HMMTRStorage accessoryNodeIDFromPluginKey:v5];
  if (v7)
  {
    if (![*(id *)(a1 + 40) containsObject:v7])
    {
      id v8 = 0;
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  if (![v5 isEqual:@"HMD.MTRPlugin.PairedNodeIDs"])
  {
LABEL_16:
    id v8 = v6;
    goto LABEL_20;
  }
  id v9 = [*(id *)(a1 + 32) pairedNodeIDsFromStoredStringValue:v6];
  id v10 = (void *)[v9 mutableCopy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = (void *)[v10 copy];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v12)
  {

LABEL_18:
    id v18 = v6;
    goto LABEL_19;
  }
  uint64_t v13 = v12;
  id v20 = v6;
  char v14 = 0;
  uint64_t v15 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      if (([*(id *)(a1 + 40) containsObject:v17] & 1) == 0)
      {
        [v10 removeObject:v17];
        char v14 = 1;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v13);

  id v6 = v20;
  if ((v14 & 1) == 0) {
    goto LABEL_18;
  }
  id v18 = [*(id *)(a1 + 32) storedStringValueFromPairedNodeIDs:v10];
LABEL_19:
  id v8 = v18;

LABEL_20:
  return v8;
}

- (void)removeRecordsForNodeIDs:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  BOOL v25 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v9;
    __int16 v36 = 2112;
    id v37 = v5;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Deleting records from storage for node IDs: %@", buf, 0x16u);
  }
  long long v24 = v7;

  id v10 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = +[HMMTRStorage formatKeyForNodeId:v15 key:@"HMD.MTRPlugin.VendorID."];
        [v10 addObject:v16];

        uint64_t v17 = +[HMMTRStorage formatKeyForNodeId:v15 key:@"HMD.MTRPlugin.Topology."];
        [v10 addObject:v17];

        id v18 = +[HMMTRStorage formatKeyForNodeId:v15 key:@"HMD.MTRPlugin.FabricIndex."];
        [v10 addObject:v18];

        uint64_t v19 = +[HMMTRStorage formatKeyForNodeId:v15 key:@"HMD.MTRPlugin.ProductID."];
        [v10 addObject:v19];

        id v20 = +[HMMTRStorage formatKeyForNodeId:v15 key:@"HMD.MTRPlugin.Category."];
        [v10 addObject:v20];

        long long v21 = +[HMMTRStorage formatKeyForNodeId:v15 key:@"HMD.MTRPlugin.ConfigNumber."];
        [v10 addObject:v21];

        long long v22 = +[HMMTRStorage formatKeyForNodeId:v15 key:@"HMD.MTRPlugin.Staged."];
        [v10 addObject:v22];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__HMMTRStorage_Records__removeRecordsForNodeIDs_systemCommissionerFabric___block_invoke;
  v27[3] = &unk_265375658;
  v27[4] = v24;
  id v28 = obj;
  id v23 = obj;
  [(HMMTRStorage *)v24 setValueForKey:@"HMD.MTRPlugin.PairedNodeIDs" removingKeys:v10 systemCommissionerFabric:v25 block:v27];
}

id __74__HMMTRStorage_Records__removeRecordsForNodeIDs_systemCommissionerFabric___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [*(id *)(a1 + 32) pairedNodeIDsFromStoredStringValue:a2];
  id v4 = (void *)[v3 mutableCopy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v10 = [*(id *)(a1 + 32) storedStringValueFromPairedNodeIDs:v4];

  return v10;
}

- (void)removeRecordsForNode:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v9 count:1];

  -[HMMTRStorage removeRecordsForNodeIDs:systemCommissionerFabric:](self, "removeRecordsForNodeIDs:systemCommissionerFabric:", v8, v4, v9, v10);
}

- (id)controllerNodeID
{
  return [(HMMTRStorage *)self valueForKey:@"HMD.MTRPlugin.ControllerNodeID" systemCommissionerFabric:0];
}

- (void)setControllerNodeID:(id)a3
{
}

- (id)operationalCertificate
{
  v2 = [(HMMTRStorage *)self valueForKey:@"HMD.MTRPlugin.OperationalCert" systemCommissionerFabric:0];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v2 options:0];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)setOperationalCertificate:(id)a3
{
  id v4 = [a3 base64EncodedStringWithOptions:0];
  [(HMMTRStorage *)self setValueForKey:@"HMD.MTRPlugin.OperationalCert" value:v4 systemCommissionerFabric:0];
}

- (id)rootCertificate
{
  v2 = [(HMMTRStorage *)self valueForKey:@"HMD.MTRPlugin.RootCert" systemCommissionerFabric:0];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v2 options:0];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)setRootCertificate:(id)a3
{
  id v4 = [a3 base64EncodedStringWithOptions:0];
  [(HMMTRStorage *)self setValueForKey:@"HMD.MTRPlugin.RootCert" value:v4 systemCommissionerFabric:0];
}

- (id)topologyForNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.Topology."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4];
  if (v5) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v5 options:0];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setTopology:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  id v8 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.Topology."];
  id v7 = [v6 base64EncodedStringWithOptions:0];

  [(HMMTRStorage *)self setValueForKey:v8 value:v7];
}

- (id)fabricIndexForNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.FabricIndex."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4];

  return v5;
}

- (void)setFabricID:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.FabricIndex."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6];
}

- (id)configNumberForNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.ConfigNumber."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4];

  return v5;
}

- (void)setConfigNumber:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.ConfigNumber."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6];
}

- (id)categoryForNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.Category."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4];

  return v5;
}

- (void)setCategory:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.Category."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6];
}

- (id)productIDForNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.ProductID."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4];

  return v5;
}

- (void)setProductID:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.ProductID."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6];
}

- (id)vendorIDForNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.VendorID."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4];

  return v5;
}

- (void)setVendorID:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.VendorID."];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6];
}

- (BOOL)isStagedForNode:(id)a3
{
  id v4 = +[HMMTRStorage formatKeyForNodeId:a3 key:@"HMD.MTRPlugin.Staged."];
  id v5 = [(HMMTRStorage *)self valueForKey:v4];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setStaged:(BOOL)a3 forNode:(id)a4
{
  BOOL v4 = a3;
  id v7 = +[HMMTRStorage formatKeyForNodeId:a4 key:@"HMD.MTRPlugin.Staged."];
  char v6 = [NSNumber numberWithBool:v4];
  [(HMMTRStorage *)self setValueForKey:v7 value:v6];
}

- (id)fabricIDForSystemCommissioner
{
  return [(HMMTRStorage *)self valueForKey:@"HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex" systemCommissionerFabric:1];
}

- (void)setSystemCommissionerFabricID:(id)a3
{
}

- (void)removePairedNodeID:(id)a3 fromSystemCommissionerFabric:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__HMMTRStorage_Records__removePairedNodeID_fromSystemCommissionerFabric___block_invoke;
  v8[3] = &unk_265375658;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(HMMTRStorage *)self setValueForKey:@"HMD.MTRPlugin.PairedNodeIDs" removingKeys:0 systemCommissionerFabric:v4 block:v8];
}

id __73__HMMTRStorage_Records__removePairedNodeID_fromSystemCommissionerFabric___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) pairedNodeIDsFromStoredStringValue:a2];
  BOOL v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) storedStringValueFromPairedNodeIDs:v4];

  return v5;
}

- (void)addPairedNodeID:(id)a3 toSystemCommissionerFabric:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HMMTRStorage_Records__addPairedNodeID_toSystemCommissionerFabric___block_invoke;
  v8[3] = &unk_265375658;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(HMMTRStorage *)self setValueForKey:@"HMD.MTRPlugin.PairedNodeIDs" removingKeys:0 systemCommissionerFabric:v4 block:v8];
}

id __68__HMMTRStorage_Records__addPairedNodeID_toSystemCommissionerFabric___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) pairedNodeIDsFromStoredStringValue:a2];
  BOOL v4 = (void *)[v3 mutableCopy];

  [v4 addObject:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) storedStringValueFromPairedNodeIDs:v4];

  return v5;
}

- (id)storedStringValueFromPairedNodeIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[HMMTRUtilities encodeObject:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      long long v14 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_FAULT, "%{public}@Failed to encode NodeID set", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)setPairedNodeIDs:(id)a3 forSystemCommissionerFabric:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    id v7 = [(HMMTRStorage *)self storedStringValueFromPairedNodeIDs:v6];
    if (v7) {
      [(HMMTRStorage *)self setValueForKey:@"HMD.MTRPlugin.PairedNodeIDs" value:v7 systemCommissionerFabric:v4];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_FAULT, "%{public}@Invalid value for pairedNodeID set", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)pairedNodeIDsFromStoredStringValue:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v4 options:0];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x263F08928];
      id v7 = (void *)MEMORY[0x263EFFA08];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v25[2] = objc_opt_class();
      v25[3] = objc_opt_class();
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
      id v9 = [v7 setWithArray:v8];
      id v24 = 0;
      uint64_t v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:&v24];
      id v11 = v24;

      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        uint64_t v19 = (void *)MEMORY[0x2533B64D0]();
        id v20 = self;
        long long v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          long long v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v27 = v22;
          __int16 v28 = 2112;
          id v29 = v11;
          _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_FAULT, "%{public}@Failed to load NodeID set with Error: %@", buf, 0x16u);
        }
        id v12 = [MEMORY[0x263EFFA08] set];
      }
      int v13 = v12;
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        id v18 = [(HMMTRStorage *)v15 fabricID];
        *(_DWORD *)buf = 138543618;
        id v27 = v17;
        __int16 v28 = 2112;
        id v29 = v18;
        _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@No paired NodeIDs set for fabricMapping index:%@", buf, 0x16u);
      }
      int v13 = [MEMORY[0x263EFFA08] set];
    }
  }
  else
  {
    int v13 = [MEMORY[0x263EFFA08] set];
  }

  return v13;
}

- (id)pairedNodeIDsOnSystemCommissionerFabric:(BOOL)a3
{
  id v4 = [(HMMTRStorage *)self valueForKey:@"HMD.MTRPlugin.PairedNodeIDs" systemCommissionerFabric:a3];
  id v5 = [(HMMTRStorage *)self pairedNodeIDsFromStoredStringValue:v4];

  return v5;
}

- (void)removePairedNodeID:(id)a3
{
  id v4 = a3;
  [(HMMTRStorage *)self removePairedNodeID:v4 fromSystemCommissionerFabric:[(HMMTRStorage *)self isSystemCommissionerFabric]];
}

- (void)addPairedNodeID:(id)a3
{
  id v4 = a3;
  [(HMMTRStorage *)self addPairedNodeID:v4 toSystemCommissionerFabric:[(HMMTRStorage *)self isSystemCommissionerFabric]];
}

- (void)setPairedNodeIDs:(id)a3
{
  id v4 = a3;
  [(HMMTRStorage *)self setPairedNodeIDs:v4 forSystemCommissionerFabric:[(HMMTRStorage *)self isSystemCommissionerFabric]];
}

- (NSSet)pairedNodeIDs
{
  BOOL v3 = [(HMMTRStorage *)self isSystemCommissionerFabric];
  return (NSSet *)[(HMMTRStorage *)self pairedNodeIDsOnSystemCommissionerFabric:v3];
}

+ (id)accessoryNodeIDFromPluginKey:(id)a3
{
  id v4 = a3;
  if ([a1 isPluginAccessoryNodeKey:v4])
  {
    id v5 = +[HMMTRStorage nodeIdFromPluginKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)nodeIdFromPluginKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 isPluginKey:v4])
  {
    id v5 = v4;
    id v22 = 0;
    id v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\D+(\\d+)$" options:0 error:&v22];
    id v7 = v22;
    id v8 = objc_msgSend(v6, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    if ((unint64_t)[v8 count] < 2)
    {
      uint64_t v14 = [v8 firstObject];
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = (void *)MEMORY[0x263F08B08];
        uint64_t v17 = [v14 rangeAtIndex:1];
        uint64_t v19 = objc_msgSend(v5, "substringWithRange:", v17, v18);
        id v20 = [v16 scannerWithString:v19];

        *(void *)buf = 0;
        int v13 = 0;
        if ([v20 scanUnsignedLongLong:buf])
        {
          int v13 = [NSNumber numberWithUnsignedLongLong:*(void *)buf];
        }
      }
      else
      {
        int v13 = 0;
      }
    }
    else
    {
      id v9 = (void *)MEMORY[0x2533B64D0]();
      id v10 = a1;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@More than 1 match found, ignoring input", buf, 0xCu);
      }
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

+ (id)keyByStrippingNodeIdFromKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v19 = 0;
  id v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(.*\\D)\\d+$" options:0 error:&v19];
  id v6 = v19;
  id v7 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  if ((unint64_t)[v7 count] < 2)
  {
    int v13 = [v7 firstObject];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 rangeAtIndex:1];
      objc_msgSend(v4, "substringWithRange:", v15, v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = v4;
    }
    id v12 = v17;
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v21 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@More than 1 match found, ignoring input", buf, 0xCu);
    }
    id v12 = v4;
  }

  return v12;
}

+ (id)formatKeyForNodeId:(id)a3 key:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@", a4, a3];
}

+ (id)matterItemsFromDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = +[HMMTRStorage chipPluginStorageKeys];
        id v11 = +[HMMTRStorage keyByStrippingNodeIdFromKey:v9];
        if ([v10 containsObject:v11])
        {
        }
        else
        {
          BOOL v12 = +[HMMTRStorage isMatterKey:v9];

          if (v12) {
            continue;
          }
          id v10 = [v3 objectForKeyedSubscript:v9];
          [v14 setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v14;
}

+ (BOOL)isMemoryStorageKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[HMMTRStorage memoryStorageKeys];
  if ([v4 containsObject:v3])
  {
    BOOL v5 = 1;
    goto LABEL_21;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v22 + 1) + 8 * i)])
        {
          BOOL v5 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v21 = 0;
  id v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^f/[0-9a-fA-F]+/s/" options:0 error:&v21];
  id v6 = v21;
  BOOL v12 = objc_msgSend(v11, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if ([v12 count] == 1) {
    goto LABEL_12;
  }
  id v20 = v6;
  int v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^f/[0-9a-fA-F]+/n$" options:0 error:&v20];
  id v14 = v20;

  long long v15 = objc_msgSend(v13, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

  if ([v15 count] == 1)
  {
    BOOL v5 = 1;
    BOOL v12 = v15;
  }
  else
  {
    id v19 = v14;
    id v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^f/[0-9a-fA-F]+/o$" options:0 error:&v19];
    id v6 = v19;

    BOOL v12 = objc_msgSend(v11, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

    if ([v12 count] == 1)
    {
LABEL_12:
      BOOL v5 = 1;
      goto LABEL_19;
    }
    id v18 = v6;
    int v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^f/[0-9a-fA-F]+/i$" options:0 error:&v18];
    id v14 = v18;

    long long v16 = objc_msgSend(v13, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

    BOOL v5 = [v16 count] == 1;
    BOOL v12 = v16;
  }
  id v11 = v13;
  id v6 = v14;
LABEL_19:

LABEL_20:
LABEL_21:

  return v5;
}

+ (BOOL)shouldIgnoreWritesForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[HMMTRStorage ignoredMatterStorageKeys];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)isPluginAccessoryNodeKey:(id)a3
{
  id v3 = a3;
  id v4 = +[HMMTRStorage chipPluginStorageAccessoryNodeSpecificKeys];
  char v5 = +[HMMTRStorage keyByStrippingNodeIdFromKey:v3];

  LOBYTE(v3) = [v4 containsObject:v5];
  return (char)v3;
}

+ (BOOL)isPluginKey:(id)a3
{
  id v3 = a3;
  id v4 = +[HMMTRStorage chipPluginStorageKeys];
  char v5 = +[HMMTRStorage keyByStrippingNodeIdFromKey:v3];

  LOBYTE(v3) = [v4 containsObject:v5];
  return (char)v3;
}

+ (BOOL)isMatterKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[HMMTRStorage matterStorageKeys];
  if ([v4 containsObject:v3])
  {
    BOOL v5 = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([v3 hasPrefix:*(void *)(*((void *)&v14 + 1) + 8 * i)])
          {
            BOOL v5 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = 0;
    id v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^f/[0-9a-fA-F]+/s/" options:0 error:&v13];
    id v11 = objc_msgSend(v6, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    BOOL v5 = [v11 count] == 1;

LABEL_13:
  }

  return v5;
}

+ (id)memoryStorageKeys
{
  if (memoryStorageKeys_onceToken != -1) {
    dispatch_once(&memoryStorageKeys_onceToken, &__block_literal_global_114);
  }
  v2 = (void *)memoryStorageKeys_storageKeys;
  return v2;
}

void __42__HMMTRStorage_Records__memoryStorageKeys__block_invoke()
{
  v0 = (void *)memoryStorageKeys_storageKeys;
  memoryStorageKeys_storageKeys = (uint64_t)&unk_2702B6150;
}

+ (id)ignoredMatterStorageKeys
{
  if (ignoredMatterStorageKeys_onceToken != -1) {
    dispatch_once(&ignoredMatterStorageKeys_onceToken, &__block_literal_global_103);
  }
  v2 = (void *)ignoredMatterStorageKeys_storageKeys;
  return v2;
}

void __49__HMMTRStorage_Records__ignoredMatterStorageKeys__block_invoke()
{
  v0 = (void *)ignoredMatterStorageKeys_storageKeys;
  ignoredMatterStorageKeys_storageKeys = (uint64_t)&unk_2702B6138;
}

+ (id)matterStorageKeys
{
  if (matterStorageKeys_onceToken != -1) {
    dispatch_once(&matterStorageKeys_onceToken, &__block_literal_global_80);
  }
  v2 = (void *)matterStorageKeys_storageKeys;
  return v2;
}

void __42__HMMTRStorage_Records__matterStorageKeys__block_invoke()
{
  v0 = (void *)matterStorageKeys_storageKeys;
  matterStorageKeys_storageKeys = (uint64_t)&unk_2702B6120;
}

+ (id)chipPluginStorageAccessoryNodeSpecificKeys
{
  if (chipPluginStorageAccessoryNodeSpecificKeys_onceToken != -1) {
    dispatch_once(&chipPluginStorageAccessoryNodeSpecificKeys_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)chipPluginStorageAccessoryNodeSpecificKeys_storageKeys;
  return v2;
}

void __67__HMMTRStorage_Records__chipPluginStorageAccessoryNodeSpecificKeys__block_invoke()
{
  v0 = (void *)chipPluginStorageAccessoryNodeSpecificKeys_storageKeys;
  chipPluginStorageAccessoryNodeSpecificKeys_storageKeys = (uint64_t)&unk_2702B6108;
}

+ (id)chipPluginStorageKeys
{
  if (chipPluginStorageKeys_onceToken != -1) {
    dispatch_once(&chipPluginStorageKeys_onceToken, &__block_literal_global_468);
  }
  v2 = (void *)chipPluginStorageKeys_storageKeys;
  return v2;
}

void __46__HMMTRStorage_Records__chipPluginStorageKeys__block_invoke()
{
  v0 = (void *)chipPluginStorageKeys_storageKeys;
  chipPluginStorageKeys_storageKeys = (uint64_t)&unk_2702B60F0;
}

+ (id)removeRecordsForUnpairedNodesInDict:(id)a3 pairedNodes:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
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
        long long v14 = +[HMMTRStorage nodeIdFromPluginKey:](HMMTRStorage, "nodeIdFromPluginKey:", v13, (void)v16);
        if (v14 && ([v6 containsObject:v14] & 1) == 0) {
          [v7 setObject:0 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemCommissionerKeyValueStore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fabricDataSource, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_certificateIssuerID, 0);
  objc_storeStrong((id *)&self->_operationalKeyPair, 0);
  objc_storeStrong((id *)&self->_systemCommissionerNocSigner, 0);
  objc_storeStrong((id *)&self->_nocSigner, 0);
  objc_storeStrong((id *)&self->_ownerNodeID, 0);
  objc_storeStrong((id *)&self->_ownerIPK, 0);
  objc_storeStrong((id *)&self->_caseAuthenticatedTag, 0);
  objc_storeStrong((id *)&self->_operationalCert, 0);
  objc_storeStrong((id *)&self->_rootCert, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStorageWithoutUpdates, 0);
  objc_storeStrong((id *)&self->_appleFabricLocalStorage, 0);
  objc_storeStrong((id *)&self->_inMemoryStorage, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_keyValueStoreUpdateQueue, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setSystemCommissionerKeyValueStore:(id)a3
{
}

- (MTSKeyValueStore)systemCommissionerKeyValueStore
{
  return (MTSKeyValueStore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFabricCreationInProgress:(BOOL)a3
{
  self->_fabricCreationInProgress = a3;
}

- (BOOL)isFabricCreationInProgress
{
  return self->_fabricCreationInProgress;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setFabricDataSource:(id)a3
{
}

- (HMMTRFabricStorageDataSource)fabricDataSource
{
  return (HMMTRFabricStorageDataSource *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSharedAdmin:(BOOL)a3
{
  self->_sharedAdmin = a3;
}

- (BOOL)isSharedAdmin
{
  return self->_sharedAdmin;
}

- (void)setSystemCommissionerFabric:(BOOL)a3
{
  self->_systemCommissionerFabric = a3;
}

- (BOOL)isSystemCommissionerFabric
{
  return self->_systemCommissionerFabric;
}

- (void)setFabricID:(id)a3
{
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCertificateIssuerID:(id)a3
{
}

- (NSNumber)certificateIssuerID
{
  return self->_certificateIssuerID;
}

- (void)setOperationalKeyPair:(id)a3
{
}

- (HMMTRMatterKeypair)operationalKeyPair
{
  return self->_operationalKeyPair;
}

- (void)setSystemCommissionerNocSigner:(id)a3
{
}

- (HMMTRMatterKeypair)systemCommissionerNocSigner
{
  return self->_systemCommissionerNocSigner;
}

- (void)setNocSigner:(id)a3
{
}

- (HMMTRMatterKeypair)nocSigner
{
  return self->_nocSigner;
}

- (void)setOwnerNodeID:(id)a3
{
}

- (NSNumber)ownerNodeID
{
  return self->_ownerNodeID;
}

- (void)setOwnerIPK:(id)a3
{
}

- (NSData)ownerIPK
{
  return self->_ownerIPK;
}

- (void)setCaseAuthenticatedTagsUpdated:(BOOL)a3
{
  self->_caseAuthenticatedTagsUpdated = a3;
}

- (BOOL)caseAuthenticatedTagsUpdated
{
  return self->_caseAuthenticatedTagsUpdated;
}

- (void)setCaseAuthenticatedTag:(id)a3
{
}

- (NSNumber)caseAuthenticatedTag
{
  return self->_caseAuthenticatedTag;
}

- (void)setOperationalCert:(id)a3
{
}

- (NSData)operationalCert
{
  return self->_operationalCert;
}

- (void)setRootCert:(id)a3
{
}

- (NSData)rootCert
{
  return self->_rootCert;
}

- (void)setDelegate:(id)a3
{
}

- (HMMTRStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMMTRStorageDelegate *)WeakRetained;
}

- (void)setStorageSyncInProgress:(BOOL)a3
{
  self->_storageSyncInProgress = a3;
}

- (BOOL)storageSyncInProgress
{
  return self->_storageSyncInProgress;
}

- (void)setStorageSyncPending:(BOOL)a3
{
  self->_storageSyncPending = a3;
}

- (BOOL)storageSyncPending
{
  return self->_storageSyncPending;
}

- (void)setLocalStorageWithoutUpdates:(id)a3
{
}

- (NSDictionary)localStorageWithoutUpdates
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppleFabricLocalStorage:(id)a3
{
}

- (NSMutableDictionary)appleFabricLocalStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInMemoryStorage:(id)a3
{
}

- (NSMutableDictionary)inMemoryStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalStorage:(id)a3
{
}

- (NSMutableDictionary)localStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSOperationQueue)keyValueStoreUpdateQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isLocalStorageMode
{
  return self->_localStorageMode;
}

- (void)_syncToRemoteStorage
{
  v2 = self;
  uint64_t v121 = *MEMORY[0x263EF8340];
  if (![(HMMTRStorage *)self storageSyncInProgress])
  {
    if (![(HMMTRStorage *)v2 storageSyncPending]) {
      return;
    }
    [(HMMTRStorage *)v2 setStorageSyncInProgress:1];
    if ([(HMMTRStorage *)v2 isSystemCommissionerFabric])
    {
      uint64_t v7 = [(HMMTRStorage *)v2 localStorage];
      id v8 = [(HMMTRStorage *)v2 pairedNodeIDsOnSystemCommissionerFabric:1];
      uint64_t v9 = +[HMMTRStorage removeRecordsForUnpairedNodesInDict:v7 pairedNodes:v8];

      v92 = (void *)v9;
      uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v9];
      [(HMMTRStorage *)v2 setLocalStorage:v10];

      uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
      v93 = v2;
      BOOL v12 = v2;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = HMFGetLogIdentifier();
        long long v15 = [(HMMTRStorage *)v12 pairedNodeIDsOnSystemCommissionerFabric:1];
        *(_DWORD *)buf = 138543618;
        v114 = v14;
        __int16 v115 = 2112;
        v116 = v15;
        _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Currently paired nodes on System commissioner fabric %@", buf, 0x16u);
      }
      v94 = [MEMORY[0x263EFF980] array];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id obj = [(HMMTRStorage *)v12 localStorageWithoutUpdates];
      uint64_t v16 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v109 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v108 + 1) + 8 * i);
            uint64_t v21 = [(HMMTRStorage *)v12 localStorage];
            long long v22 = [v21 objectForKey:v20];

            if (v22)
            {
              long long v23 = [(HMMTRStorage *)v12 localStorage];
              long long v24 = [v23 objectForKeyedSubscript:v20];
              long long v25 = [(HMMTRStorage *)v12 localStorageWithoutUpdates];
              uint64_t v26 = [v25 objectForKeyedSubscript:v20];
              int v27 = [v24 isEqual:v26];

              if (v27)
              {
                __int16 v28 = [(HMMTRStorage *)v12 localStorage];
                [v28 removeObjectForKey:v20];
              }
            }
            else
            {
              [v94 addObject:v20];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
        }
        while (v17);
      }

      long long v107 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v104 = 0u;
      id v29 = v94;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v104 objects:v119 count:16];
      v95 = v29;
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v105;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v105 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v104 + 1) + 8 * j);
            v35 = [(HMMTRStorage *)v12 systemCommissionerKeyValueStore];
            id v103 = 0;
            char v36 = [v35 removeStoredValueForKey:v34 error:&v103];
            id v37 = v103;

            if ((v36 & 1) == 0)
            {
              uint64_t v38 = (void *)MEMORY[0x2533B64D0]();
              v39 = v12;
              v40 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v114 = v41;
                __int16 v115 = 2112;
                v116 = v34;
                __int16 v117 = 2112;
                id v118 = v37;
                _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove %@ from System Commissioner storage with error %@", buf, 0x20u);

                id v29 = v95;
              }
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v104 objects:v119 count:16];
        }
        while (v31);
      }

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      obja = [(HMMTRStorage *)v12 localStorage];
      uint64_t v42 = [obja countByEnumeratingWithState:&v99 objects:v112 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v100;
        do
        {
          for (uint64_t k = 0; k != v43; ++k)
          {
            if (*(void *)v100 != v44) {
              objc_enumerationMutation(obja);
            }
            v46 = *(void **)(*((void *)&v99 + 1) + 8 * k);
            v47 = [(HMMTRStorage *)v12 systemCommissionerKeyValueStore];
            v48 = [(HMMTRStorage *)v12 localStorage];
            v49 = [v48 objectForKeyedSubscript:v46];
            id v98 = 0;
            char v50 = [v47 setStoredValue:v49 forKey:v46 error:&v98];
            id v51 = v98;

            if ((v50 & 1) == 0)
            {
              v52 = (void *)MEMORY[0x2533B64D0]();
              v53 = v12;
              v54 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                v55 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v114 = v55;
                __int16 v115 = 2112;
                v116 = v46;
                __int16 v117 = 2112;
                id v118 = v51;
                _os_log_impl(&dword_252495000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to System Commissioner storage for key %@ with error %@", buf, 0x20u);
              }
            }
          }
          uint64_t v43 = [obja countByEnumeratingWithState:&v99 objects:v112 count:16];
        }
        while (v43);
      }

      v56 = (void *)MEMORY[0x2533B64D0]();
      id v57 = v12;
      long long v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        long long v59 = HMFGetLogIdentifier();
        long long v60 = NSNumber;
        long long v61 = [(HMMTRStorage *)v57 localStorage];
        id v62 = objc_msgSend(v60, "numberWithUnsignedInteger:", objc_msgSend(v61, "count"));
        v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v95, "count"));
        *(_DWORD *)buf = 138543874;
        v114 = v59;
        __int16 v115 = 2112;
        v116 = v62;
        __int16 v117 = 2112;
        id v118 = v63;
        _os_log_impl(&dword_252495000, v58, OS_LOG_TYPE_INFO, "%{public}@Updated %@ and removed %@ key-value pairs while sync'ing from local storage with remote System Commissioner Fabric storage", buf, 0x20u);
      }
      v64 = [(HMMTRStorage *)v57 systemCommissionerKeyValueStore];
      char v65 = objc_opt_respondsToSelector();

      v2 = v93;
      if (v65)
      {
        id v66 = (void *)MEMORY[0x2533B64D0]();
        __int16 v67 = v57;
        id v68 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          __int16 v69 = HMFGetLogIdentifier();
          id v70 = [(HMMTRStorage *)v67 systemCommissionerKeyValueStore];
          v71 = [v70 storedValuesByKey];
          *(_DWORD *)buf = 138543618;
          v114 = v69;
          __int16 v115 = 2112;
          v116 = v71;
          _os_log_impl(&dword_252495000, v68, OS_LOG_TYPE_INFO, "%{public}@System Commissioner storage contains %@", buf, 0x16u);

          v2 = v93;
        }
      }
    }
    else
    {
      v72 = [(HMMTRStorage *)v2 dataSource];
      v73 = [(HMMTRStorage *)v2 fabricID];
      v74 = [v72 storageDataSourceForFabricWithID:v73];
      [(HMMTRStorage *)v2 setFabricDataSource:v74];

      v75 = [(HMMTRStorage *)v2 fabricDataSource];

      if (!v75)
      {
        v87 = (void *)MEMORY[0x2533B64D0]();
        v88 = v2;
        v89 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          v90 = HMFGetLogIdentifier();
          v91 = [(HMMTRStorage *)v88 fabricID];
          *(_DWORD *)buf = 138543618;
          v114 = v90;
          __int16 v115 = 2112;
          v116 = v91;
          _os_log_impl(&dword_252495000, v89, OS_LOG_TYPE_INFO, "%{public}@Remote storage is not yet available for fabric index = %@", buf, 0x16u);
        }
        v86 = v88;
        goto LABEL_54;
      }
      v76 = [(HMMTRStorage *)v2 localStorage];
      v77 = (void *)[v76 copy];
      [(HMMTRStorage *)v2 _syncSetDataSourceDictionary:v77];

      v78 = (void *)MEMORY[0x2533B64D0]();
      v79 = v2;
      v80 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        v81 = HMFGetLogIdentifier();
        v82 = NSNumber;
        v83 = [(HMMTRStorage *)v79 localStorage];
        v84 = objc_msgSend(v82, "numberWithUnsignedInteger:", objc_msgSend(v83, "count"));
        *(_DWORD *)buf = 138543618;
        v114 = v81;
        __int16 v115 = 2112;
        v116 = v84;
        _os_log_impl(&dword_252495000, v80, OS_LOG_TYPE_INFO, "%{public}@Synced %@ key-value pairs from local storage to remote Apple Home storage", buf, 0x16u);
      }
    }
    v85 = [(HMMTRStorage *)v2 localStorage];
    [v85 removeAllObjects];

    [(HMMTRStorage *)v2 setStorageSyncPending:0];
    v86 = v2;
LABEL_54:
    [(HMMTRStorage *)v86 setStorageSyncInProgress:0];
    return;
  }
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = v2;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v114 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Attempting to sync to remote storage when another sync is already in progress; ignoring",
      buf,
      0xCu);
  }
}

- (void)endLocalStorageModeByPersistingAppleFabricData
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(HMMTRStorage *)self isLocalStorageMode])
  {
    if ([(HMMTRStorage *)self isSystemCommissionerFabric])
    {
      id v3 = (void *)MEMORY[0x2533B64D0]();
      id v4 = self;
      id v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = HMFGetLogIdentifier();
        int v14 = 138543362;
        long long v15 = v6;
        _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_ERROR, "%{public}@Cannot persist Apple Fabric data while in System Commissioner Fabric", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      uint64_t v7 = [(HMMTRStorage *)self localStorage];
      id v8 = (void *)[v7 mutableCopy];
      [(HMMTRStorage *)self setAppleFabricLocalStorage:v8];

      uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v10 = self;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        BOOL v12 = HMFGetLogIdentifier();
        int v14 = 138543362;
        long long v15 = v12;
        _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Discarding Local Storage, but keeping Apple Home keys", (uint8_t *)&v14, 0xCu);
      }
      uint64_t v13 = [(HMMTRStorage *)v10 localStorage];
      [v13 removeAllObjects];

      [(HMMTRStorage *)v10 setStorageSyncPending:0];
      [(HMMTRStorage *)v10 setLocalStorageMode:0];
    }
  }
}

- (void)endLocalStorageModeBySyncingToRemote:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(HMMTRStorage *)self isLocalStorageMode])
  {
    if (a3)
    {
      [(HMMTRStorage *)self setStorageSyncPending:1];
      [(HMMTRStorage *)self _syncToRemoteStorage];
    }
    else
    {
      id v5 = (void *)MEMORY[0x2533B64D0]();
      id v6 = self;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Discarding Local Storage", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v9 = [(HMMTRStorage *)v6 localStorage];
      [v9 removeAllObjects];

      [(HMMTRStorage *)v6 setStorageSyncPending:0];
    }
    if (![(HMMTRStorage *)self isSystemCommissionerFabric]) {
      [(HMMTRStorage *)self setAppleFabricLocalStorage:0];
    }
    [(HMMTRStorage *)self setLocalStorageMode:0];
  }
}

- (void)startLocalStorageMode
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v27 = 138543362;
    __int16 v28 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Attempting to start local storage mode", (uint8_t *)&v27, 0xCu);
  }
  if ([(HMMTRStorage *)v4 isSystemCommissionerFabric])
  {
    uint64_t v7 = [(HMMTRStorage *)v4 systemCommissionerKeyValueStore];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x263EFF9A0];
      int v10 = [(HMMTRStorage *)v4 systemCommissionerKeyValueStore];
      uint64_t v11 = [v10 storedValuesByKey];
      uint64_t v12 = [v9 dictionaryWithDictionary:v11];
      [(HMMTRStorage *)v4 setLocalStorage:v12];
    }
    uint64_t v13 = [(HMMTRStorage *)v4 localStorage];
    int v14 = (void *)[v13 copy];
    [(HMMTRStorage *)v4 setLocalStorageWithoutUpdates:v14];
  }
  else
  {
    if ([(HMMTRStorage *)v4 isSharedAdmin])
    {
      uint64_t v13 = [NSDictionary dictionary];
    }
    else
    {
      long long v15 = [(HMMTRStorage *)v4 dataSource];
      uint64_t v16 = [(HMMTRStorage *)v4 fabricID];
      uint64_t v17 = [v15 storageDataSourceForFabricWithID:v16];
      [(HMMTRStorage *)v4 setFabricDataSource:v17];

      uint64_t v18 = [(HMMTRStorage *)v4 fabricDataSource];
      uint64_t v13 = [v18 keyValueStore];
    }
    long long v19 = [(HMMTRStorage *)v4 appleFabricLocalStorage];

    if (v19) {
      [(HMMTRStorage *)v4 appleFabricLocalStorage];
    }
    else {
    int v14 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v13];
    }
    [(HMMTRStorage *)v4 setLocalStorage:v14];
  }

  [(HMMTRStorage *)v4 setLocalStorageMode:1];
  uint64_t v20 = (void *)MEMORY[0x2533B64D0]([(HMMTRStorage *)v4 setStorageSyncPending:0]);
  uint64_t v21 = v4;
  long long v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    long long v23 = HMFGetLogIdentifier();
    long long v24 = NSNumber;
    long long v25 = [(HMMTRStorage *)v21 localStorage];
    uint64_t v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    int v27 = 138543618;
    __int16 v28 = v23;
    __int16 v29 = 2112;
    uint64_t v30 = v26;
    _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Local storage initiated with %@ keys", (uint8_t *)&v27, 0x16u);
  }
}

- (void)setLocalStorageMode:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    [(HMMTRStorage *)v6 isLocalStorageMode];
    uint64_t v9 = HMFBooleanToString();
    int v10 = HMFBooleanToString();
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    int v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing local storage mode from %@ to %@", (uint8_t *)&v11, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  v6->_localStorageMode = a3;
  os_unfair_lock_unlock(&v6->_lock);
}

- (BOOL)localStorageMode
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_localStorageMode;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)logIdentifier
{
  v2 = [(HMMTRStorage *)self fabricID];
  id v3 = [v2 stringValue];

  return v3;
}

- (BOOL)replaceAllKeysAndSyncWithBlock:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void, void, void))v6;
  v45 = (void (**)(void, void, void))v6;
  if (v4)
  {
    char v8 = [(HMMTRStorage *)self systemCommissionerKeyValueStore];
    uint64_t v9 = [v8 storedValuesByKey];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v53;
      char v43 = 1;
      *(void *)&long long v12 = 138543874;
      long long v42 = v12;
      id v44 = v10;
      do
      {
        uint64_t v15 = 0;
        uint64_t v46 = v13;
        do
        {
          if (*(void *)v53 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * v15);
          uint64_t v17 = objc_msgSend(v10, "objectForKeyedSubscript:", v16, v42);
          uint64_t v18 = ((void (**)(void, void *, void *))v7)[2](v7, v16, v17);
          if (([v17 isEqual:v18] & 1) == 0)
          {
            if ([(HMMTRStorage *)self isLocalStorageMode])
            {
              long long v19 = [(HMMTRStorage *)self localStorage];
              [v19 setObject:v18 forKeyedSubscript:v16];
            }
            uint64_t v20 = [(HMMTRStorage *)self systemCommissionerKeyValueStore];
            uint64_t v21 = v20;
            if (v18)
            {
              id v51 = 0;
              char v22 = [v20 setStoredValue:v18 forKey:v16 error:&v51];
              long long v23 = v51;
            }
            else
            {
              char v50 = 0;
              char v22 = [v20 removeStoredValueForKey:v16 error:&v50];
              long long v23 = v50;
            }
            id v24 = v23;

            if (v22)
            {
              long long v25 = (void *)MEMORY[0x2533B64D0]();
              uint64_t v26 = self;
              int v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                __int16 v28 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v57 = v28;
                __int16 v58 = 2112;
                id v59 = v16;
                _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_INFO, "%{public}@%@ removed from keychain store", buf, 0x16u);
              }
            }
            else
            {
              long long v25 = (void *)MEMORY[0x2533B64D0]();
              __int16 v29 = self;
              int v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                uint64_t v30 = HMFGetLogIdentifier();
                *(_DWORD *)buf = v42;
                id v57 = v30;
                __int16 v58 = 2112;
                id v59 = v16;
                __int16 v60 = 2112;
                id v61 = v24;
                _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key %@ from System Commissioner storage with error %@", buf, 0x20u);
              }
              char v43 = 0;
            }

            id v10 = v44;
            uint64_t v7 = v45;
            uint64_t v13 = v46;
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v10 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v13);
    }
    else
    {
      char v43 = 1;
    }

    char v36 = v43;
  }
  else
  {
    id v49 = 0;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __72__HMMTRStorage_replaceAllKeysAndSyncWithBlock_systemCommissionerFabric___block_invoke;
    v47[3] = &unk_2653788B8;
    v47[4] = self;
    id v48 = v6;
    int v31 = [(HMMTRStorage *)self _syncSetDataSourceValuesWithError:&v49 block:v47];
    id v10 = v49;
    if (v31)
    {

      uint64_t v32 = (void *)MEMORY[0x2533B64D0]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v57 = v35;
        _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store", buf, 0xCu);
      }
      char v36 = 1;
    }
    else
    {
      id v37 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v38 = self;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v57 = v40;
        __int16 v58 = 2112;
        id v59 = v10;
        _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store with error %@", buf, 0x16u);
      }

      char v36 = 0;
    }
    uint64_t v7 = v45;
  }

  return v36 & 1;
}

uint64_t __72__HMMTRStorage_replaceAllKeysAndSyncWithBlock_systemCommissionerFabric___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v17 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];
        uint64_t v14 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        if (([v13 isEqual:v14] & 1) == 0)
        {
          if ([*(id *)(a1 + 32) isLocalStorageMode])
          {
            uint64_t v15 = [*(id *)(a1 + 32) localStorage];
            [v15 setObject:v14 forKeyedSubscript:v12];
          }
          [v5 setObject:v14 forKeyedSubscript:v12];
          if (!v14) {
            [v17 addObject:v12];
          }
          char v9 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (BOOL)removeValueForKey:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(HMMTRStorage *)self isLocalStorageMode])
  {
    uint64_t v7 = [(HMMTRStorage *)self localStorage];
    [v7 removeObjectForKey:v6];

    char v8 = 1;
    goto LABEL_15;
  }
  if (v4)
  {
    char v9 = [(HMMTRStorage *)self systemCommissionerKeyValueStore];
    id v21 = 0;
    char v8 = [v9 removeStoredValueForKey:v6 error:&v21];
    id v10 = v21;

    uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    uint64_t v14 = v13;
    if (v8)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v15;
        __int16 v24 = 2112;
        id v25 = v6;
        uint64_t v16 = "%{public}@Removal of %@ requested from keychain store";
        id v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_13:
        _os_log_impl(&dword_252495000, v17, v18, v16, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      id v25 = v10;
      uint64_t v16 = "%{public}@Failed to remove key from System Commissioner storage with error %@";
      id v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  if ([(HMMTRStorage *)self isResidentDevice]
    && +[HMMTRStorage isMemoryStorageKey:v6])
  {
    long long v19 = [(HMMTRStorage *)self inMemoryStorage];
    [v19 removeObjectForKey:v6];
  }
  char v8 = [(HMMTRStorage *)self _syncSetDataSourceValue:0 forKey:v6];
LABEL_15:

  return v8;
}

- (BOOL)setValueForKey:(id)a3 removingKeys:(id)a4 systemCommissionerFabric:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  if (+[HMMTRStorage shouldIgnoreWritesForKey:v10])
  {
LABEL_5:
    char v18 = 1;
    goto LABEL_6;
  }
  if ([(HMMTRStorage *)self isLocalStorageMode])
  {
    uint64_t v13 = [(HMMTRStorage *)self localStorage];
    uint64_t v14 = [v13 objectForKeyedSubscript:v10];
    uint64_t v15 = v12[2](v12, v14);
    uint64_t v16 = [(HMMTRStorage *)self localStorage];
    [v16 setObject:v15 forKeyedSubscript:v10];

    if (v11)
    {
      id v17 = [(HMMTRStorage *)self localStorage];
      [v17 removeObjectsForKeys:v11];
    }
    goto LABEL_5;
  }
  if (v7)
  {
    long long v20 = [(HMMTRStorage *)self systemCommissionerKeyValueStore];
    uint64_t v21 = [v20 storedValueForKey:v10];
    uint64_t v22 = v12[2](v12, (void *)v21);

    uint64_t v23 = [(HMMTRStorage *)self systemCommissionerKeyValueStore];
    id v80 = 0;
    id v62 = (void *)v22;
    LOBYTE(v21) = [v23 setStoredValue:v22 forKey:v10 error:&v80];
    id v24 = v80;

    char v68 = v21;
    if ((v21 & 1) == 0)
    {
      id v25 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v26 = self;
      int v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v82 = v28;
        __int16 v83 = 2112;
        id v84 = v24;
        _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to System Commissioner storage with error %@", buf, 0x16u);
      }
    }
    id v61 = v24;
    id v63 = v10;
    v64 = v12;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v66 = v11;
    id obj = v11;
    uint64_t v29 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v77 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          v34 = [(HMMTRStorage *)self systemCommissionerKeyValueStore];
          id v75 = 0;
          char v35 = [v34 removeStoredValueForKey:v33 error:&v75];
          id v36 = v75;

          id v37 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v38 = self;
          v39 = HMFGetOSLogHandle();
          v40 = v39;
          if (v35)
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              v41 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v82 = v41;
              __int16 v83 = 2112;
              id v84 = v33;
              _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_INFO, "%{public}@Removal of %@ requested from keychain store", buf, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              long long v42 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v82 = v42;
              __int16 v83 = 2112;
              id v84 = v33;
              __int16 v85 = 2112;
              id v86 = v36;
              _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove key %@ from System Commissioner storage with error %@", buf, 0x20u);
            }
            char v68 = 0;
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
      }
      while (v30);
    }

    id v10 = v63;
    uint64_t v12 = v64;
    id v11 = v66;
    char v18 = v68;
  }
  else
  {
    char v43 = [(HMMTRStorage *)self dataSource];
    if (v43)
    {
      if ([(HMMTRStorage *)self isResidentDevice]
        && +[HMMTRStorage isMemoryStorageKey:v10])
      {
        id v44 = [(HMMTRStorage *)self inMemoryStorage];
        v45 = [v44 objectForKeyedSubscript:v10];
        uint64_t v46 = v12[2](v12, v45);
        v47 = [(HMMTRStorage *)self inMemoryStorage];
        [v47 setObject:v46 forKeyedSubscript:v10];

        if (v11)
        {
          id v48 = [(HMMTRStorage *)self inMemoryStorage];
          [v48 removeObjectsForKeys:v11];
        }
        char v18 = 1;
      }
      else
      {
        id v74 = 0;
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __75__HMMTRStorage_setValueForKey_removingKeys_systemCommissionerFabric_block___block_invoke;
        v70[3] = &unk_265378890;
        char v65 = v12;
        v73 = v12;
        id v49 = v10;
        id v71 = v49;
        id v67 = v11;
        id v50 = v11;
        id v72 = v50;
        BOOL v51 = [(HMMTRStorage *)self _syncSetDataSourceValuesWithError:&v74 block:v70];
        id v52 = v74;
        char v18 = v51;
        if (v51)
        {

          long long v53 = (void *)MEMORY[0x2533B64D0]();
          long long v54 = self;
          long long v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v56 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v82 = v56;
            __int16 v83 = 2112;
            id v84 = v49;
            __int16 v85 = 2112;
            id v86 = v50;
            _os_log_impl(&dword_252495000, v55, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store for added key = %@, removed keys %@", buf, 0x20u);
          }
        }
        else
        {
          id v57 = (void *)MEMORY[0x2533B64D0]();
          __int16 v58 = self;
          id v59 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            __int16 v60 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v82 = v60;
            __int16 v83 = 2112;
            id v84 = v49;
            __int16 v85 = 2112;
            id v86 = v50;
            __int16 v87 = 2112;
            id v88 = v52;
            _os_log_impl(&dword_252495000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store for added key = %@, removed keys = %@ with error %@", buf, 0x2Au);
          }
        }
        uint64_t v12 = v65;
        id v11 = v67;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
LABEL_6:

  return v18 & 1;
}

uint64_t __75__HMMTRStorage_setValueForKey_removingKeys_systemCommissionerFabric_block___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)[v5 copy];
  uint64_t v8 = a1[6];
  char v9 = [v5 objectForKeyedSubscript:a1[4]];
  id v10 = (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if (!v10) {
    [v6 addObject:a1[4]];
  }
  [v5 setObject:v10 forKeyedSubscript:a1[4]];
  if (a1[5])
  {
    objc_msgSend(v5, "removeObjectsForKeys:");
    [v6 addObjectsFromArray:a1[5]];
  }
  uint64_t v11 = HMFEqualObjects() ^ 1;

  return v11;
}

- (BOOL)setValueForKey:(id)a3 value:(id)a4 systemCommissionerFabric:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__HMMTRStorage_setValueForKey_value_systemCommissionerFabric___block_invoke;
  v11[3] = &unk_265378868;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(v5) = [(HMMTRStorage *)self setValueForKey:a3 removingKeys:0 systemCommissionerFabric:v5 block:v11];

  return v5;
}

id __62__HMMTRStorage_setValueForKey_value_systemCommissionerFabric___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)valueForKey:(id)a3 systemCommissionerFabric:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (+[HMMTRStorage shouldIgnoreWritesForKey:v6]) {
    goto LABEL_2;
  }
  if ([(HMMTRStorage *)self isLocalStorageMode]
    && [(HMMTRStorage *)self isSystemCommissionerFabric] == v4)
  {
    id v8 = [(HMMTRStorage *)self localStorage];
    id v9 = [v8 valueForKey:v6];
  }
  else if (v4)
  {
    id v8 = [(HMMTRStorage *)self systemCommissionerKeyValueStore];
    id v9 = [v8 storedValueForKey:v6];
  }
  else
  {
    id v10 = [(HMMTRStorage *)self fabricID];

    if (!v10)
    {
LABEL_2:
      BOOL v7 = 0;
      goto LABEL_16;
    }
    uint64_t v11 = [(HMMTRStorage *)self inMemoryStorage];
    id v8 = [v11 objectForKeyedSubscript:v6];

    if (![(HMMTRStorage *)self isResidentDevice]
      || !v8
      || !+[HMMTRStorage isMemoryStorageKey:v6])
    {
      id v12 = [(HMMTRStorage *)self fabricDataSource];
      uint64_t v13 = [v12 keyValueStore];
      BOOL v7 = [v13 objectForKeyedSubscript:v6];

      goto LABEL_15;
    }
    id v9 = v8;
    id v8 = v9;
  }
  BOOL v7 = v9;
LABEL_15:

LABEL_16:
  return v7;
}

- (BOOL)removeValueForKey:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(HMMTRStorage *)self removeValueForKey:v4 systemCommissionerFabric:[(HMMTRStorage *)self isSystemCommissionerFabric]];

  return (char)self;
}

- (BOOL)setValueForKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LOBYTE(self) = [(HMMTRStorage *)self setValueForKey:v7 value:v6 systemCommissionerFabric:[(HMMTRStorage *)self isSystemCommissionerFabric]];

  return (char)self;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMMTRStorage *)self valueForKey:v4 systemCommissionerFabric:[(HMMTRStorage *)self isSystemCommissionerFabric]];

  return v5;
}

- (BOOL)setStorageData:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 base64EncodedStringWithOptions:0];
  LOBYTE(self) = [(HMMTRStorage *)self setValueForKey:v6 value:v7];

  return (char)self;
}

- (id)storageDataForKey:(id)a3
{
  id v3 = [(HMMTRStorage *)self valueForKey:a3];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:0];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_nodeIDFromOperationalX509Certificate:(id)a3
{
  id v3 = [MEMORY[0x263F10CC0] convertX509Certificate:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v3];
  BOOL v5 = [v4 subject];
  id v6 = [v5 nodeID];

  return v6;
}

- (id)legacyNodeIDForFabricID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4
    && ([(HMMTRStorage *)self dataSource],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 storageDataSourceForFabricWithID:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    id v7 = [v6 keyValueStore];
    id v8 = [v7 objectForKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];

    if (v8)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0];
      id v10 = [(HMMTRStorage *)self _nodeIDFromOperationalX509Certificate:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Fabric data source not available; failed to get legacy node ID for fabric ID %@",
        (uint8_t *)&v16,
        0x16u);
    }
    id v6 = 0;
    id v10 = 0;
  }

  return v10;
}

- (id)legacyNodeIDForCurrentFabric
{
  if (isFeatureMatterLocalFabricConfigEnabled()
    && ([(HMMTRStorage *)self fabricID],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(HMMTRStorage *)self dataSource];
    BOOL v5 = [(HMMTRStorage *)self fabricID];
    id v6 = [v4 appleHomeFabricWithID:v5];

    id v7 = [v6 fabricData];
    id v8 = [v7 residentNodeID];
  }
  else
  {
    id v6 = [(HMMTRStorage *)self fabricID];
    id v8 = [(HMMTRStorage *)self legacyNodeIDForFabricID:v6];
  }

  return v8;
}

- (id)ipkForFabricID:(id)a3 forPairing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6
    || ([(HMMTRStorage *)self dataSource],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 storageDataSourceForFabricWithID:v6],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    id v12 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v26 = 138543618;
      int v27 = v15;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Fabric data source not available; failed to get ipk for fabric ID %@",
        (uint8_t *)&v26,
        0x16u);
    }
    id v8 = 0;
LABEL_9:
    int v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    id v19 = v18;
    if (v4)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v26 = 138543618;
        int v27 = v20;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Generating new IPK for fabric ID %@", (uint8_t *)&v26, 0x16u);
      }
      uint64_t v21 = +[HMMTRStorage generateIPK];
      if (v21)
      {
        uint64_t v11 = (void *)v21;
        goto LABEL_20;
      }
      int v16 = (void *)MEMORY[0x2533B64D0]();
      id v24 = v17;
      id v19 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      uint64_t v22 = HMFGetLogIdentifier();
      int v26 = 138543618;
      int v27 = v22;
      __int16 v28 = 2112;
      id v29 = v6;
      uint64_t v23 = "%{public}@FATAL Error: Failed to generate IPK for fabric ID %@";
    }
    else
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        uint64_t v11 = 0;
        goto LABEL_20;
      }
      uint64_t v22 = HMFGetLogIdentifier();
      int v26 = 138543618;
      int v27 = v22;
      __int16 v28 = 2112;
      id v29 = v6;
      uint64_t v23 = "%{public}@IPK missing for fabric ID %@";
    }
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v26, 0x16u);

    goto LABEL_19;
  }
  id v9 = [v8 keyValueStore];
  id v10 = [v9 objectForKeyedSubscript:@"IPK"];

  if (!v10) {
    goto LABEL_9;
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v10 options:0];

  if (!v11) {
    goto LABEL_9;
  }
LABEL_20:

  return v11;
}

- (id)ipkForCurrentFabric
{
  if (isFeatureMatterLocalFabricConfigEnabled()
    && ([(HMMTRStorage *)self fabricID],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    BOOL v4 = [(HMMTRStorage *)self dataSource];
    BOOL v5 = [(HMMTRStorage *)self fabricID];
    id v6 = [v4 appleHomeFabricWithID:v5];

    id v7 = [v6 fabricData];
    id v8 = [v7 ipk];
  }
  else
  {
    id v8 = [(HMMTRStorage *)self ownerIPK];
    if (v8) {
      goto LABEL_7;
    }
    id v6 = [(HMMTRStorage *)self fabricID];
    id v8 = [(HMMTRStorage *)self ipkForFabricID:v6 forPairing:0];
  }

LABEL_7:
  return v8;
}

- (id)operationalCertForCurrentFabric
{
  if (isFeatureMatterLocalFabricConfigEnabled()
    && ([(HMMTRStorage *)self fabricID],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    BOOL v4 = [(HMMTRStorage *)self dataSource];
    BOOL v5 = [(HMMTRStorage *)self fabricID];
    id v6 = [v4 appleHomeFabricWithID:v5];

    id v7 = [v6 currentDeviceNodeData];
    id v8 = [v7 operationalCertificate];
  }
  else
  {
    id v8 = [(HMMTRStorage *)self operationalCert];
    if (!v8)
    {
      id v8 = [(HMMTRStorage *)self operationalCertificate];
      [(HMMTRStorage *)self setOperationalCert:v8];
    }
  }
  return v8;
}

- (id)_operationalCertificateFromSdkCertificatesForFabricID:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_19;
  }
  BOOL v5 = [(HMMTRStorage *)self dataSource];
  id v6 = [v5 storageDataSourceForFabricWithID:v4];

  if (!v6) {
    goto LABEL_19;
  }
  id v7 = [v6 keyValueStore];
  id v8 = [(HMMTRStorage *)self nocSigner];
  uint64_t v9 = [(HMMTRStorage *)self knownFabricInStorage:v7 fabricID:v4 keyPair:v8 controllerNodeID:0 rootCertificate:0];

  if (!v9) {
    goto LABEL_19;
  }
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"f/%x/n", v9);
  uint64_t v11 = [v6 keyValueStore];
  id v12 = [v11 objectForKeyedSubscript:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  if (!v14
    || (uint64_t v15 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v14 options:0]) == 0)
  {
    uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v25;
      __int16 v33 = 1024;
      int v34 = v9;
      _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@Storage doesn't have f/%x/n", buf, 0x12u);
    }

    goto LABEL_19;
  }
  int v16 = (void *)v15;
  id v17 = [MEMORY[0x263F10CC0] convertMatterCertificate:v15];
  __int16 v18 = (void *)MEMORY[0x263F10CC0];
  id v19 = [(HMMTRStorage *)self operationalKeyPair];
  int v20 = [v18 keypair:v19 matchesCertificate:v17];

  if (v20)
  {
    id v21 = v17;
  }
  else
  {
    context = (void *)MEMORY[0x2533B64D0]();
    int v26 = self;
    int v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v29;
      __int16 v33 = 1024;
      int v34 = v9;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@f/%x/n doesn't match ", buf, 0x12u);
    }
  }

  if ((v20 & 1) == 0) {
LABEL_19:
  }
    id v17 = 0;

  return v17;
}

- (id)_cachedOperationalCertificateIfValidForFabricID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0;
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  BOOL v5 = [(HMMTRStorage *)self dataSource];
  id v6 = [v5 storageDataSourceForFabricWithID:v4];

  if (!v6
    || ![(HMMTRStorage *)self areCachedCertificatesValidForFabricID:v4])
  {
    goto LABEL_9;
  }
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v15 = 138543362;
    int v16 = v10;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Using Cached Operational certificate", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v11 = [v6 keyValueStore];
  id v12 = [v11 objectForKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];

  if (v12) {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
  }
  else {
    uint64_t v13 = 0;
  }

LABEL_10:
  return v13;
}

- (id)rootCertForCurrentFabric
{
  if (isFeatureMatterLocalFabricConfigEnabled()
    && ([(HMMTRStorage *)self fabricID],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(HMMTRStorage *)self dataSource];
    BOOL v5 = [(HMMTRStorage *)self fabricID];
    id v6 = [v4 appleHomeFabricWithID:v5];

    id v7 = [v6 fabricData];
    id v8 = [v7 rootCert];
  }
  else
  {
    id v8 = [(HMMTRStorage *)self rootCert];
    if (!v8)
    {
      id v8 = [(HMMTRStorage *)self rootCertificate];
      [(HMMTRStorage *)self setRootCert:v8];
    }
  }
  return v8;
}

- (id)_rootCertificateFromSdkCertificatesForFabricID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(HMMTRStorage *)self dataSource];
    id v6 = [v5 storageDataSourceForFabricWithID:v4];

    if (v6)
    {
      id v7 = [v6 keyValueStore];
      id v8 = [(HMMTRStorage *)self nocSigner];
      id v11 = 0;
      [(HMMTRStorage *)self knownFabricInStorage:v7 fabricID:v4 keyPair:v8 controllerNodeID:0 rootCertificate:&v11];
      id v9 = v11;

      goto LABEL_6;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (id)_cachedRootCertificateIfValidForFabricID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0;
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  BOOL v5 = [(HMMTRStorage *)self dataSource];
  id v6 = [v5 storageDataSourceForFabricWithID:v4];

  if (!v6
    || ![(HMMTRStorage *)self areCachedCertificatesValidForFabricID:v4])
  {
    goto LABEL_9;
  }
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v15 = 138543362;
    int v16 = v10;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Using Cached Root certificate", (uint8_t *)&v15, 0xCu);
  }
  id v11 = [v6 keyValueStore];
  id v12 = [v11 objectForKeyedSubscript:@"HMD.MTRPlugin.RootCert"];

  if (v12) {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
  }
  else {
    uint64_t v13 = 0;
  }

LABEL_10:
  return v13;
}

- (id)_createOperationalCertificateForFabricID:(id)a3 rootCert:(id)a4 caseAuthenticatedTags:(id)a5 controllerNodeID:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (!v13 || [v13 isEqual:&unk_2702B60D8])
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));

    id v14 = (void *)v15;
  }
  int v16 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v17 = self;
  __int16 v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    uint64_t v32 = v19;
    __int16 v33 = 2112;
    int v34 = v14;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating operational certificate for controller node ID %@ CAT %@ root cert %@, fabric ID %@", buf, 0x34u);
  }
  int v20 = (void *)MEMORY[0x263F10CC0];
  id v21 = [(HMMTRStorage *)v17 nocSigner];
  uint64_t v22 = [(HMMTRStorage *)v17 operationalKeyPair];
  id v30 = 0;
  uint64_t v23 = objc_msgSend(v20, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v21, v11, objc_msgSend(v22, "publicKey"), v10, v14, v12, &v30);
  id v24 = v30;

  if (!v23)
  {
    id v25 = (void *)MEMORY[0x2533B64D0]();
    int v26 = v17;
    int v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v28;
      __int16 v33 = 2112;
      int v34 = v14;
      __int16 v35 = 2112;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v24;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create operational certificate for controller node ID %@ CAT %@ with error %@", buf, 0x2Au);
    }
  }

  return v23;
}

- (void)fetchCertificatesFromStorageForFabricID:(id)a3 controllerNodeID:(id)a4 rootCert:(id *)a5 operationalCert:(id *)a6 residentNodeID:(id *)a7 ipk:(id *)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  int v16 = [(HMMTRStorage *)self _cachedRootCertificateIfValidForFabricID:v14];
  if (!v16)
  {
    int v16 = [(HMMTRStorage *)self _rootCertificateFromSdkCertificatesForFabricID:v14];
    if (!v16) {
      goto LABEL_22;
    }
  }
  id v33 = [(HMMTRStorage *)self ipkForFabricID:v14 forPairing:0];
  uint64_t v17 = [(HMMTRStorage *)self dataSource];
  __int16 v18 = [v17 appleHomeFabricWithID:v14];

  uint64_t v32 = v18;
  id v19 = [v18 delegate];
  int v20 = [v19 accessoryAdministerPrivilegeCATID:0];

  id v21 = [(HMMTRStorage *)self _cachedOperationalCertificateIfValidForFabricID:v14];
  int v34 = v20;
  if (v21
    || ([(HMMTRStorage *)self _operationalCertificateFromSdkCertificatesForFabricID:v14], (id v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v30 = a5;
    uint64_t v31 = a6;
    id v35 = [(HMMTRStorage *)self _nodeIDFromOperationalX509Certificate:v21];
    uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v29 = a7;
      id v25 = a8;
      v27 = id v26 = v15;
      *(_DWORD *)buf = 138543874;
      __int16 v37 = v27;
      __int16 v38 = 2112;
      __int16 v39 = v21;
      __int16 v40 = 2112;
      id v41 = v35;
      _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, "%{public}@Resident NOC %@ resident node ID %@", buf, 0x20u);

      id v15 = v26;
      a8 = v25;
      a7 = v29;
    }

    a5 = v30;
    a6 = v31;
    int v20 = v34;
  }
  else
  {
    id v35 = 0;
  }
  if ([(HMMTRStorage *)self isResidentDevice])
  {
    id v28 = v21;
    if (!a5) {
      goto LABEL_15;
    }
  }
  else
  {
    if (v20)
    {
      int v20 = [MEMORY[0x263EFFA08] setWithObject:v20];
    }
    id v28 = [(HMMTRStorage *)self _createOperationalCertificateForFabricID:v14 rootCert:v16 caseAuthenticatedTags:v20 controllerNodeID:v15];

    int v20 = v34;
    if (!a5) {
      goto LABEL_15;
    }
  }
  *a5 = v16;
LABEL_15:
  if (a6) {
    *a6 = v28;
  }
  if (a7) {
    *a7 = v35;
  }
  if (a8) {
    *a8 = v33;
  }

LABEL_22:
}

- (void)_fetchCertForFabricWithID:(id)a3 isOwner:(BOOL)a4 forPairing:(BOOL)a5 forceFetchFromResident:(BOOL)a6 completion:(id)a7
{
  BOOL v163 = a5;
  BOOL v9 = a4;
  uint64_t v191 = *MEMORY[0x263EF8340];
  id v11 = (__CFError *)a3;
  id v12 = a7;
  [(HMMTRStorage *)self setRootCert:0];
  [(HMMTRStorage *)self setOperationalCert:0];
  [(HMMTRStorage *)self setOwnerNodeID:0];
  uint64_t v13 = [(HMMTRStorage *)self setOwnerIPK:0];
  if (!v11)
  {
    int v16 = 0;
    if (v9 && !a6)
    {
      id v166 = v12;
      int v40 = 0;
      id v19 = 0;
      int v20 = 0;
      id v15 = 0;
      id v41 = 0;
      goto LABEL_56;
    }
    id v15 = 0;
    v167 = 0;
    v172 = 0;
    if (!v9) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  id v14 = [(HMMTRStorage *)self dataSource];
  id v15 = [v14 storageDataSourceForFabricWithID:v11];

  int v16 = 0;
  BOOL v17 = 0;
  BOOL v18 = !v9 || a6;
  if (v18)
  {
    id v19 = 0;
    int v20 = 0;
    goto LABEL_29;
  }
  id v19 = 0;
  int v20 = 0;
  if (v15)
  {
    uint64_t v13 = [(HMMTRStorage *)self areCachedCertificatesValidForFabricID:v11];
    if (v13)
    {
      id v165 = v12;
      id v21 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v188 = v24;
        _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Using Cached Root/Operational certificates", buf, 0xCu);
      }
      id v25 = [v15 keyValueStore];
      int v16 = [v25 objectForKeyedSubscript:@"HMD.MTRPlugin.RootCert"];

      v156 = v16;
      v159 = v15;
      if (v16)
      {
        int v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v16 options:0];
        id v26 = (void *)MEMORY[0x2533B64D0]();
        int v27 = v22;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v188 = v29;
          __int16 v189 = 2112;
          CFErrorRef v190 = v11;
          _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@Check validity period of the root cert of fabric ID %@", buf, 0x16u);
        }
        id v30 = [(HMMTRStorage *)v27 nocSigner];
        id v186 = 0;
        BOOL v31 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:v16 keyPair:v30 newCertificate:&v186];
        id v32 = v186;

        if (v31)
        {
          id v33 = v32;

          int v16 = v33;
        }

        id v15 = v159;
      }
      int v34 = [v15 keyValueStore];
      id v19 = [v34 objectForKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];

      v155 = v19;
      if (!v19)
      {
        int v20 = 0;
LABEL_98:

        BOOL v17 = v16 != 0;
        if (v16 && v19)
        {
          [(HMMTRStorage *)v22 setRootCert:v16];
          [(HMMTRStorage *)v22 setOperationalCert:v19];
          [(HMMTRStorage *)v22 setOwnerNodeID:v20];
          v150 = [(HMMTRStorage *)v22 ipkForFabricID:v11 forPairing:0];
          [(HMMTRStorage *)v22 setOwnerIPK:v150];

          id v12 = v165;
          (*((void (**)(id, void))v165 + 2))(v165, 0);
          goto LABEL_89;
        }
        id v12 = v165;
        if (!v18) {
          goto LABEL_22;
        }
LABEL_29:
        v167 = v20;
        v172 = v19;
        if (!v9)
        {
LABEL_30:
          v45 = v16;
          uint64_t v46 = v11;
          v47 = v15;
          id v48 = (void *)MEMORY[0x2533B64D0](v13);
          id v49 = self;
          id v50 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            BOOL v51 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v188 = v51;
            _os_log_impl(&dword_252495000, v50, OS_LOG_TYPE_INFO, "%{public}@Shared Admin is attempting to pair", buf, 0xCu);
          }
          id v15 = v47;
          id v11 = v46;
          int v16 = v45;
        }
LABEL_33:
        id v52 = (void *)MEMORY[0x2533B64D0](v13);
        long long v53 = self;
        long long v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          long long v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v188 = v55;
          _os_log_impl(&dword_252495000, v54, OS_LOG_TYPE_INFO, "%{public}@Requesting certificates required for commissioning from Resident device", buf, 0xCu);
        }
        CFErrorRef error = 0;
        v56 = [(HMMTRStorage *)v53 operationalKeyPair];
        CFDataRef v57 = SecKeyCopyExternalRepresentation((SecKeyRef)[v56 publicKey], &error);

        if (v57)
        {
          __int16 v58 = [(HMMTRStorage *)v53 delegate];
          v176[0] = MEMORY[0x263EF8330];
          v176[1] = 3221225472;
          v176[2] = __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke;
          v176[3] = &unk_265378840;
          v176[4] = v53;
          id v177 = v12;
          [v58 fetchCommissioningCertificatesFromOwnerForPublicKey:v57 fabricID:v11 completionHandler:v176];
        }
        else
        {
          v164 = v16;
          id v59 = v11;
          __int16 v60 = v15;
          CFErrorRef v61 = error;
          id v62 = (void *)MEMORY[0x2533B64D0]();
          id v63 = v53;
          v64 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            char v65 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v188 = v65;
            __int16 v189 = 2112;
            CFErrorRef v190 = v61;
            _os_log_impl(&dword_252495000, v64, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert public key to NSData for transmission with error %@", buf, 0x16u);
          }
          id v66 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
          (*((void (**)(id, void *))v12 + 2))(v12, v66);

          id v15 = v60;
          id v11 = v59;
          int v16 = v164;
        }
        int v20 = v167;

        goto LABEL_41;
      }
      BOOL v153 = v18;
      id v35 = v22;
      uint64_t v36 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v19 options:0];
      v152 = [MEMORY[0x263F10CC0] convertX509Certificate:v36];
      v154 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v152];
      __int16 v37 = [v154 subject];
      int v20 = [v37 nodeID];

      __int16 v38 = (void *)MEMORY[0x263F10CC0];
      __int16 v39 = [(HMMTRStorage *)v35 operationalKeyPair];
      v171 = (void *)v36;
      LOBYTE(v38) = [v38 keypair:v39 matchesCertificate:v36];

      if (v38)
      {
        id v19 = (void *)v36;
        uint64_t v22 = v35;
        BOOL v18 = v153;
LABEL_97:

        goto LABEL_98;
      }
      v170 = (__CFError *)v20;
      long long v109 = (void *)MEMORY[0x2533B64D0]();
      long long v110 = v35;
      long long v111 = HMFGetOSLogHandle();
      uint64_t v22 = v35;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
      {
        v112 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v188 = v112;
        _os_log_impl(&dword_252495000, v111, OS_LOG_TYPE_INFO, "%{public}@Operational Keypair of the cached NOC doesn't match current keypair", buf, 0xCu);
      }
      v113 = (void *)MEMORY[0x2533B64D0]();
      v114 = v110;
      __int16 v115 = HMFGetOSLogHandle();
      BOOL v18 = v153;
      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
      {
        v116 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v188 = v116;
        __int16 v189 = 2112;
        CFErrorRef v190 = v170;
        _os_log_impl(&dword_252495000, v115, OS_LOG_TYPE_INFO, "%{public}@Generating new NOC using node ID = %@", buf, 0x16u);
      }
      __int16 v117 = (void *)MEMORY[0x263F10CC0];
      id v118 = [(HMMTRStorage *)v114 nocSigner];
      v119 = [(HMMTRStorage *)v114 operationalKeyPair];
      id v185 = 0;
      uint64_t v120 = objc_msgSend(v117, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v118, v16, objc_msgSend(v119, "publicKey"), v11, v170, 0, &v185);
      v151 = (__CFError *)v185;

      uint64_t v121 = (void *)MEMORY[0x2533B64D0]();
      v122 = v114;
      v123 = HMFGetOSLogHandle();
      v124 = v123;
      if (v120)
      {
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v125 = uint64_t v175 = v120;
          *(_DWORD *)buf = 138543362;
          v188 = v125;
          v126 = "%{public}@Successfully generated Operational Certificate using Root Certificate from storage";
          v127 = v124;
          os_log_type_t v128 = OS_LOG_TYPE_INFO;
          uint32_t v129 = 12;
LABEL_95:
          _os_log_impl(&dword_252495000, v127, v128, v126, buf, v129);

          uint64_t v120 = v175;
        }
      }
      else if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v125 = uint64_t v175 = 0;
        *(_DWORD *)buf = 138543618;
        v188 = v125;
        __int16 v189 = 2112;
        CFErrorRef v190 = v151;
        v126 = "%{public}@Failed to generate Operational Certificate with error %@";
        v127 = v124;
        os_log_type_t v128 = OS_LOG_TYPE_ERROR;
        uint32_t v129 = 22;
        goto LABEL_95;
      }

      id v19 = (void *)v120;
      id v15 = v159;
      int v20 = v170;
      goto LABEL_97;
    }
    BOOL v17 = 0;
    int v16 = 0;
    id v19 = 0;
    int v20 = 0;
  }
  if (v18) {
    goto LABEL_29;
  }
LABEL_22:
  id v166 = v12;
  if (v15)
  {
    if (!v20) {
      BOOL v17 = 0;
    }
    v168 = v20;
    v173 = v19;
    if (v17)
    {
      uint64_t v42 = v20;
      id v43 = v16;
      id v44 = v42;
    }
    else
    {
      id v67 = v15;
      char v68 = [v15 keyValueStore];
      __int16 v69 = [(HMMTRStorage *)self nocSigner];
      id v183 = 0;
      id v184 = 0;
      [(HMMTRStorage *)self knownFabricInStorage:v68 fabricID:v11 keyPair:v69 controllerNodeID:&v184 rootCertificate:&v183];
      id v44 = v184;
      id v43 = v183;

      id v70 = (void *)MEMORY[0x2533B64D0]();
      id v71 = self;
      id v72 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        v73 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v188 = v73;
        __int16 v189 = 2112;
        CFErrorRef v190 = v11;
        _os_log_impl(&dword_252495000, v72, OS_LOG_TYPE_INFO, "%{public}@Check validity period of the Matter SDK stored root cert of fabric ID %@", buf, 0x16u);
      }
      id v74 = [(HMMTRStorage *)v71 nocSigner];
      id v182 = 0;
      BOOL v75 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:v43 keyPair:v74 newCertificate:&v182];
      id v76 = v182;

      if (v75)
      {
        id v77 = v76;

        id v43 = v77;
      }
      id v19 = v173;

      id v15 = v67;
    }
    id v41 = 0;
    if (v43 && v44)
    {
      v160 = v15;
      long long v78 = (void *)MEMORY[0x263F10CC0];
      long long v79 = [(HMMTRStorage *)self nocSigner];
      id v80 = [(HMMTRStorage *)self operationalKeyPair];
      id v181 = 0;
      v81 = objc_msgSend(v78, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v79, v43, objc_msgSend(v80, "publicKey"), v11, v44, 0, &v181);
      id v41 = v181;

      if (v81)
      {
        [(HMMTRStorage *)self setRootCert:v43];
        [(HMMTRStorage *)self setOperationalCert:v81];
        v82 = (void *)MEMORY[0x2533B64D0]([(HMMTRStorage *)self setOwnerNodeID:v44]);
        __int16 v83 = self;
        id v84 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          __int16 v85 = v157 = v82;
          *(_DWORD *)buf = 138543362;
          v188 = v85;
          _os_log_impl(&dword_252495000, v84, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate using SDK Root Certificate and Node ID from storage", buf, 0xCu);

          v82 = v157;
        }
      }
      id v15 = v160;
      id v19 = v173;
    }

    int v40 = 1;
    int v20 = v168;
  }
  else
  {
    int v40 = 0;
    id v41 = 0;
  }
LABEL_56:
  uint64_t v86 = [(HMMTRStorage *)self rootCert];
  __int16 v87 = (void *)v86;
  v162 = v11;
  if (!v40 || v86) {
    goto LABEL_78;
  }
  if (v163)
  {
    v169 = v20;
    v174 = v19;
    v161 = v15;
    id v88 = (void *)MEMORY[0x2533B64D0]();
    v89 = self;
    uint64_t v90 = HMFGetOSLogHandle();
    id v12 = v166;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      v91 = HMFGetLogIdentifier();
      v92 = [(HMMTRStorage *)v89 certificateIssuerID];
      *(_DWORD *)buf = 138543618;
      v188 = v91;
      __int16 v189 = 2112;
      CFErrorRef v190 = v92;
      _os_log_impl(&dword_252495000, v90, OS_LOG_TYPE_INFO, "%{public}@Generating root certificate using issuer ID %@", buf, 0x16u);
    }
    v93 = (void *)MEMORY[0x263F10CC0];
    v94 = [(HMMTRStorage *)v89 nocSigner];
    v95 = [(HMMTRStorage *)v89 certificateIssuerID];
    id v180 = v41;
    v96 = [v93 createRootCertificate:v94 issuerID:v95 fabricID:v11 error:&v180];
    id v97 = v180;

    [(HMMTRStorage *)v89 setRootCert:v96];
    id v98 = [(HMMTRStorage *)v89 rootCert];

    if (!v98)
    {
      id v41 = v97;
      id v15 = v161;
      int v20 = v169;
      id v19 = v174;
      goto LABEL_80;
    }
    __int16 v87 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    long long v99 = (void *)MEMORY[0x263F10CC0];
    long long v100 = [(HMMTRStorage *)v89 nocSigner];
    long long v101 = [(HMMTRStorage *)v89 rootCert];
    long long v102 = [(HMMTRStorage *)v89 operationalKeyPair];
    id v179 = v97;
    id v103 = objc_msgSend(v99, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v100, v101, objc_msgSend(v102, "publicKey"), v11, v87, 0, &v179);
    id v158 = v179;

    [(HMMTRStorage *)v89 setOperationalCert:v103];
    long long v104 = [(HMMTRStorage *)v89 operationalCert];

    if (v104)
    {
      long long v105 = (void *)MEMORY[0x2533B64D0]([(HMMTRStorage *)v89 setOwnerNodeID:v87]);
      long long v106 = v89;
      long long v107 = HMFGetOSLogHandle();
      id v15 = v161;
      if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
      {
        long long v108 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v188 = v108;
        _os_log_impl(&dword_252495000, v107, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate using newly generated Root Certificate", buf, 0xCu);
      }
    }
    else
    {
      long long v105 = (void *)MEMORY[0x2533B64D0]();
      v130 = v89;
      long long v107 = HMFGetOSLogHandle();
      id v15 = v161;
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        v131 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v188 = v131;
        __int16 v189 = 2112;
        id v41 = v158;
        CFErrorRef v190 = (CFErrorRef)v158;
        _os_log_impl(&dword_252495000, v107, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate with error %@", buf, 0x16u);

LABEL_77:
        int v20 = v169;
        id v19 = v174;
LABEL_78:

        goto LABEL_79;
      }
    }
    id v41 = v158;
    goto LABEL_77;
  }
LABEL_79:
  id v12 = v166;
LABEL_80:
  uint64_t v132 = [(HMMTRStorage *)self rootCert];
  if (!v132
    || (v133 = (void *)v132,
        [(HMMTRStorage *)self operationalCert],
        v134 = objc_claimAutoreleasedReturnValue(),
        v134,
        v133,
        !v134))
  {
    id v138 = v41;
    v139 = v19;
    v140 = (void *)MEMORY[0x2533B64D0]();
    v141 = self;
    v142 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      v143 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v188 = v143;
      _os_log_impl(&dword_252495000, v142, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch certificates for owner", buf, 0xCu);
    }
    v144 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*((void (**)(id, void *))v12 + 2))(v12, v144);

    id v19 = v139;
    id v41 = v138;
    id v11 = v162;
    goto LABEL_88;
  }
  v135 = [(HMMTRStorage *)self ownerIPK];

  id v11 = v162;
  if (v135
    || ([(HMMTRStorage *)self ipkForFabricID:v162 forPairing:v163],
        v136 = objc_claimAutoreleasedReturnValue(),
        [(HMMTRStorage *)self setOwnerIPK:v136],
        v136,
        [(HMMTRStorage *)self ownerIPK],
        v137 = objc_claimAutoreleasedReturnValue(),
        v137,
        v137))
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
LABEL_88:

    goto LABEL_89;
  }
  v172 = v19;
  v145 = (void *)MEMORY[0x2533B64D0]();
  v146 = self;
  v147 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
  {
    v148 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v188 = v148;
    __int16 v189 = 2112;
    CFErrorRef v190 = v162;
    _os_log_impl(&dword_252495000, v147, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch IPK for fabric ID: %@", buf, 0x16u);
  }
  v149 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
  (*((void (**)(id, void *))v12 + 2))(v12, v149);

LABEL_41:
  id v19 = v172;
LABEL_89:
}

void __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
  id v14 = *(id *)(a1 + 32);
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    BOOL v31 = v16;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    id v39 = v12;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Received Root Certificate %@, Operational Certificate %@, Owner Node ID %@, and IPK %@ from Resident", buf, 0x34u);
  }
  BOOL v17 = [*(id *)(a1 + 32) workQueue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_53;
  v23[3] = &unk_265378818;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  BOOL v18 = *(void **)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 32);
  id v29 = v18;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  id v22 = v9;
  dispatch_async(v17, v23);
}

void __95__HMMTRStorage__fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_53(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40) && *(void *)(a1 + 48) && *(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 64), "setRootCert:");
    [*(id *)(a1 + 64) setOperationalCert:*(void *)(a1 + 40)];
    [*(id *)(a1 + 64) setOwnerNodeID:*(void *)(a1 + 48)];
    [*(id *)(a1 + 64) setOwnerIPK:*(void *)(a1 + 56)];
    v2 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v2();
  }
  else
  {
    id v3 = (void *)MEMORY[0x2533B64D0]();
    id v4 = *(id *)(a1 + 64);
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Certificates OR Owner Node ID required for pairing", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 72);
    id v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void)fetchCertForFabricWithID:(id)a3 isOwner:(BOOL)a4 forPairing:(BOOL)a5 forceFetchFromResident:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = [(HMMTRStorage *)self workQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke;
  v17[3] = &unk_2653787F0;
  id v18 = v12;
  id v19 = self;
  BOOL v21 = a4;
  BOOL v22 = a5;
  BOOL v23 = a6;
  id v20 = v13;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(v14, v17);
}

void __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke(uint64_t a1)
{
  int v2 = isFeatureMatterLocalFabricConfigEnabled();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2 || !v3)
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 58);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_2;
    v8[3] = &unk_2653787C8;
    uint64_t v7 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v7 _fetchCertForFabricWithID:v3 isOwner:v4 forPairing:v5 forceFetchFromResident:v6 completion:v8];
  }
}

uint64_t __94__HMMTRStorage_fetchCertForFabricWithID_isOwner_forPairing_forceFetchFromResident_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)areCachedCertificatesValidForFabricID:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMMTRStorage *)self dataSource];
  uint64_t v6 = [v5 storageDataSourceForFabricWithID:v4];

  if (v6)
  {
    int v7 = isFeatureMatterLocalFabricConfigEnabled();
    id v8 = [v6 keyValueStore];
    id v9 = [v8 objectForKeyedSubscript:@"HMD.MTRPlugin.RootCert"];

    if (v7)
    {
      if (!v9
        || (uint64_t v10 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v9 options:0]) == 0)
      {
        BOOL v21 = (void *)MEMORY[0x2533B64D0]();
        BOOL v22 = self;
        BOOL v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v63 = v24;
          _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Cached Root certificate not found", buf, 0xCu);
        }
        BOOL v19 = 0;
        goto LABEL_39;
      }
      uint64_t v11 = (void *)v10;
      id v12 = [MEMORY[0x263F10CC0] convertX509Certificate:v10];
      id v13 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v12];
      id v14 = (void *)MEMORY[0x263F10CC0];
      id v15 = [(HMMTRStorage *)self nocSigner];
      LOBYTE(v14) = [v14 keypair:v15 matchesCertificate:v11];

      if (v14)
      {
        id v16 = [v13 subject];
        BOOL v17 = [v16 fabricID];
        char v18 = HMFEqualObjects();

        if (v18)
        {
          BOOL v19 = 1;
LABEL_38:

LABEL_39:
          id v20 = v9;
          goto LABEL_40;
        }
        v45 = (void *)MEMORY[0x2533B64D0]();
        long long v53 = self;
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          id v59 = HMFGetLogIdentifier();
          CFErrorRef v61 = [v13 subject];
          [v61 fabricID];
          *(_DWORD *)buf = 138543874;
          id v63 = v59;
          uint64_t v65 = v64 = 2112;
          long long v54 = (void *)v65;
          __int16 v66 = 2112;
          id v67 = v4;
          _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_ERROR, "%{public}@FabricID from cached Root (%@) doesn't match expected value (%@)", buf, 0x20u);
        }
      }
      else
      {
        v45 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v46 = self;
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          id v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v63 = v48;
          _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_ERROR, "%{public}@Cached Root certificate uses unexpected operational key pair", buf, 0xCu);
        }
      }

      BOOL v19 = 0;
      goto LABEL_38;
    }
    if (v9) {
      id v20 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v9 options:0];
    }
    else {
      id v20 = 0;
    }
    id v25 = [v6 keyValueStore];
    id v26 = [v25 objectForKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];

    if (v20 && v26)
    {
      id v27 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v26 options:0];
      __int16 v60 = [MEMORY[0x263F10CC0] convertX509Certificate:v20];
      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v60];
      id v29 = (void *)MEMORY[0x263F10CC0];
      id v30 = [(HMMTRStorage *)self nocSigner];
      LOBYTE(v29) = [v29 keypair:v30 matchesCertificate:v20];

      if (v29)
      {
        v56 = v27;
        BOOL v31 = [v28 subject];
        __int16 v32 = [v31 fabricID];
        char v33 = HMFEqualObjects();

        if (v33)
        {

          __int16 v34 = (void *)MEMORY[0x2533B64D0]();
          id v35 = self;
          __int16 v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            id v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v63 = v37;
            _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@Cached Root/Operational certificates are valid", buf, 0xCu);
          }

          BOOL v19 = 1;
          goto LABEL_34;
        }
        __int16 v58 = v28;
        context = (void *)MEMORY[0x2533B64D0]();
        id v49 = self;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v50 = HMFGetLogIdentifier();
          BOOL v51 = [v58 subject];
          id v52 = [v51 fabricID];
          *(_DWORD *)buf = 138543874;
          id v63 = v50;
          __int16 v64 = 2112;
          uint64_t v65 = (uint64_t)v52;
          __int16 v66 = 2112;
          id v67 = v4;
          _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@FabricID from cached Root (%@) doesn't match expected value (%@)", buf, 0x20u);
        }
        id v27 = v56;
      }
      else
      {
        __int16 v58 = v28;
        context = (void *)MEMORY[0x2533B64D0]();
        uint64_t v42 = self;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v63 = v44;
          _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@Cached Root certificate uses unexpected operational key pair", buf, 0xCu);
        }
      }
    }
    else
    {
      __int16 v38 = (void *)MEMORY[0x2533B64D0]();
      id v39 = self;
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v63 = v41;
        _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cached Root/Operational certificates are not found in storage", buf, 0xCu);
      }
    }
    BOOL v19 = 0;
LABEL_34:

LABEL_40:
    goto LABEL_41;
  }
  BOOL v19 = 0;
LABEL_41:

  return v19;
}

- (unsigned)knownFabricWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMTRStorage *)self localStorage];
  uint64_t v6 = [(HMMTRStorage *)self nocSigner];
  LODWORD(self) = [(HMMTRStorage *)self knownFabricInStorage:v5 fabricID:v4 keyPair:v6 controllerNodeID:0 rootCertificate:0];

  return self;
}

- (unsigned)knownFabricInStorage:(id)a3 fabricID:(id)a4 keyPair:(id)a5 controllerNodeID:(id *)a6 rootCertificate:(id *)a7
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v62 = a4;
  id v66 = a5;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v72 = v9;
  uint64_t v10 = [v9 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (!v11) {
    goto LABEL_53;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v75;
  __int16 v69 = v10;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v75 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      if ([v15 hasPrefix:@"f/"]
        && [v15 hasSuffix:@"/r"]
        && (unint64_t)[v15 length] >= 5)
      {
        id v16 = objc_msgSend(v15, "substringWithRange:", 2, objc_msgSend(v15, "length") - 4);
        if ([v16 length])
        {
          uint64_t v17 = 0;
          do
          {
            int v18 = [v16 characterAtIndex:v17];
            if ((unsigned __int16)(v18 - 58) <= 0xFFF5u
              && ((v18 - 65) > 0x25 || ((1 << (v18 - 65)) & 0x3F0000003FLL) == 0))
            {
              goto LABEL_38;
            }
          }
          while (++v17 < (unint64_t)[v16 length]);
        }
        unsigned int v73 = 0;
        BOOL v19 = [MEMORY[0x263F08B08] scannerWithString:v16];
        char v20 = [v19 scanHexInt:&v73];

        if ((v20 & 1) == 0) {
          _HMFPreconditionFailure();
        }
        BOOL v21 = [v72 objectForKeyedSubscript:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v22 = v21;
        }
        else {
          BOOL v22 = 0;
        }
        id v23 = v22;

        if (!v23
          || (uint64_t v24 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v23 options:0]) == 0)
        {
          __int16 v38 = (void *)MEMORY[0x2533B64D0]();
          id v39 = self;
          uint64_t v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            id v41 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v79 = v41;
            __int16 v80 = 1024;
            *(_DWORD *)v81 = v73;
            _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r isn't base64 encoded", buf, 0x12u);

            uint64_t v10 = v69;
          }

LABEL_38:

          continue;
        }
        id v25 = (void *)v24;
        id v70 = [MEMORY[0x263F10CC0] convertMatterCertificate:v24];
        if (objc_msgSend(MEMORY[0x263F10CC0], "keypair:matchesCertificate:", v66))
        {
          id v67 = v25;
          uint64_t v65 = objc_msgSend(NSString, "stringWithFormat:", @"f/%x/n", v73);
          id v26 = objc_msgSend(v72, "objectForKeyedSubscript:");
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v27 = v26;
          }
          else {
            id v27 = 0;
          }
          id v28 = v27;

          __int16 v64 = v28;
          if (v28
            && (uint64_t v29 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v28 options:0]) != 0)
          {
            __int16 v60 = (void *)v29;
            id v63 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v29];
            id v30 = [v63 subject];
            BOOL v31 = [v30 fabricID];

            CFErrorRef v61 = v31;
            if ([v31 isEqual:v62])
            {
              id v25 = v67;
              if (a6)
              {
                __int16 v32 = [v63 subject];
                id v58 = [v32 nodeID];

                context = (void *)MEMORY[0x2533B64D0]();
                char v33 = self;
                __int16 v34 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  id v35 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138544130;
                  long long v79 = v35;
                  __int16 v80 = 2112;
                  *(void *)v81 = v62;
                  *(_WORD *)&v81[8] = 1024;
                  *(_DWORD *)&v81[10] = v73;
                  __int16 v82 = 2112;
                  id v83 = v58;
                  _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Retrieved root cert for fabric ID %@ with fabric index 0x%x. Controller node ID is %@.", buf, 0x26u);

                  uint64_t v10 = v69;
                }

                id v36 = v58;
                *a6 = v36;
              }
              if (a7) {
                *a7 = v70;
              }
              int v37 = 1;
              unsigned int v57 = v73;
            }
            else
            {
              contexta = (void *)MEMORY[0x2533B64D0]();
              id v50 = self;
              BOOL v51 = HMFGetOSLogHandle();
              id v25 = v67;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                id v52 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138544130;
                long long v79 = v52;
                __int16 v80 = 1024;
                *(_DWORD *)v81 = v73;
                *(_WORD *)&v81[4] = 2112;
                *(void *)&v81[6] = v61;
                __int16 v82 = 2112;
                id v83 = v62;
                _os_log_impl(&dword_252495000, v51, OS_LOG_TYPE_DEBUG, "%{public}@f/%x/n fabric ID %@ doesn't match fabric ID %@", buf, 0x26u);

                uint64_t v10 = v69;
              }

              int v37 = 3;
            }
          }
          else
          {
            uint64_t v46 = (void *)MEMORY[0x2533B64D0]();
            v47 = self;
            id v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              id v49 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              long long v79 = v49;
              __int16 v80 = 1024;
              *(_DWORD *)v81 = v73;
              *(_WORD *)&v81[4] = 1024;
              *(_DWORD *)&v81[6] = v73;
              _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r doesn't have matching f/%x/n", buf, 0x18u);
            }
            int v37 = 3;
            id v25 = v67;
            uint64_t v10 = v69;
          }
        }
        else
        {
          uint64_t v42 = (void *)MEMORY[0x2533B64D0]();
          id v43 = self;
          id v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v45 = uint64_t v68 = v25;
            *(_DWORD *)buf = 138543874;
            long long v79 = v45;
            __int16 v80 = 1024;
            *(_DWORD *)v81 = v73;
            *(_WORD *)&v81[4] = 2112;
            *(void *)&v81[6] = v66;
            _os_log_impl(&dword_252495000, v44, OS_LOG_TYPE_DEBUG, "%{public}@f/%x/r doesn't match system commissioner keypair %@", buf, 0x1Cu);

            id v25 = v68;
          }

          int v37 = 3;
          uint64_t v10 = v69;
        }

        if (v37 != 3) {
          goto LABEL_54;
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v74 objects:v84 count:16];
  }
  while (v12);
LABEL_53:
  unsigned int v57 = 0;
LABEL_54:

  return v57;
}

- (BOOL)syncDataSourceDictionary:(id)a3 forFabric:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v6 allKeys];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source value for keys: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v29 = 1;
  id v13 = objc_alloc_init(MEMORY[0x263F42500]);
  objc_initWeak(&location, v13);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  char v20 = __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke;
  BOOL v21 = &unk_2653787A0;
  objc_copyWeak(&v26, &location);
  BOOL v22 = v9;
  id v14 = v6;
  id v23 = v14;
  id v15 = v7;
  id v24 = v15;
  id v25 = buf;
  [v13 addExecutionBlock:&v18];
  id v16 = [(HMMTRStorage *)v9 keyValueStoreUpdateQueue];
  [v16 addOperation:v13];

  [v13 waitUntilFinished];
  LOBYTE(v16) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return (char)v16;
}

void __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [*(id *)(a1 + 40) allKeys];
    *(_DWORD *)buf = 138543618;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source value for keys: %@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 48) fabricID];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) dataSource];
    uint64_t v10 = [*(id *)(a1 + 48) fabricID];
    uint64_t v11 = [v9 storageDataSourceForFabricWithID:v10];

    if (v11)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_33;
      v21[3] = &unk_265378750;
      id v22 = *(id *)(a1 + 40);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_2;
      v18[3] = &unk_265378700;
      uint64_t v12 = *(void *)(a1 + 56);
      v18[4] = *(void *)(a1 + 32);
      uint64_t v20 = v12;
      id v19 = WeakRetained;
      [v11 updateKeyValueStoreWithBlock:v21 completion:v18];
    }
    else
    {
      id v13 = (void *)MEMORY[0x2533B64D0]();
      id v14 = *(id *)(a1 + 32);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = [*(id *)(a1 + 48) fabricID];
        *(_DWORD *)buf = 138543618;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v17;
        _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@Fabric data source for fabric ID %@ is not available yet; cannot update storage",
          buf,
          0x16u);
      }
      [WeakRetained finish];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    [WeakRetained finish];
  }
}

uint64_t __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_33(uint64_t a1, void *a2)
{
  return 1;
}

void __51__HMMTRStorage_syncDataSourceDictionary_forFabric___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store with error %@", (uint8_t *)&v10, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store", (uint8_t *)&v10, 0xCu);
    }
  }
  [*(id *)(a1 + 40) finish];
}

- (BOOL)_syncSetDataSourceDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 allKeys];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source value for keys: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v20 = 1;
  id v10 = objc_alloc_init(MEMORY[0x263F42500]);
  objc_initWeak(&location, v10);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke;
  v14[3] = &unk_265378778;
  objc_copyWeak(&v17, &location);
  v14[4] = v6;
  id v11 = v4;
  id v15 = v11;
  id v16 = buf;
  [v10 addExecutionBlock:v14];
  __int16 v12 = [(HMMTRStorage *)v6 keyValueStoreUpdateQueue];
  [v12 addOperation:v10];

  [v10 waitUntilFinished];
  LOBYTE(v12) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return (char)v12;
}

void __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [*(id *)(a1 + 40) allKeys];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v6;
    __int16 v28 = 2112;
    char v29 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source value for keys: %@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) fabricID];

  if (!v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_12:
    [WeakRetained finish];
    goto LABEL_13;
  }
  id v9 = [*(id *)(a1 + 32) fabricDataSource];

  if (!v9)
  {
    id v10 = [*(id *)(a1 + 32) dataSource];
    id v11 = [*(id *)(a1 + 32) fabricID];
    __int16 v12 = [v10 storageDataSourceForFabricWithID:v11];
    [*(id *)(a1 + 32) setFabricDataSource:v12];
  }
  id v13 = [*(id *)(a1 + 32) fabricDataSource];

  if (!v13)
  {
    id v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      char v20 = [*(id *)(a1 + 32) fabricID];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      char v29 = v20;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Fabric data source for fabric ID %@ is not available yet; cannot update storage",
        buf,
        0x16u);
    }
    goto LABEL_12;
  }
  uint64_t v14 = [*(id *)(a1 + 32) fabricDataSource];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_32;
  v24[3] = &unk_265378750;
  id v25 = *(id *)(a1 + 40);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_2;
  v21[3] = &unk_265378700;
  uint64_t v15 = *(void *)(a1 + 48);
  void v21[4] = *(void *)(a1 + 32);
  uint64_t v23 = v15;
  id v22 = WeakRetained;
  [v14 updateKeyValueStoreWithBlock:v24 completion:v21];

LABEL_13:
}

uint64_t __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_32(uint64_t a1, void *a2)
{
  return 1;
}

void __45__HMMTRStorage__syncSetDataSourceDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store with error %@", (uint8_t *)&v10, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store", (uint8_t *)&v10, 0xCu);
    }
  }
  [*(id *)(a1 + 40) finish];
}

- (BOOL)_removeAllDataSourceData
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Queueing remove all data source data", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  id v7 = objc_alloc_init(MEMORY[0x263F42500]);
  objc_initWeak(&location, v7);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  __int16 v12 = __40__HMMTRStorage__removeAllDataSourceData__block_invoke;
  id v13 = &unk_265378728;
  objc_copyWeak(&v16, &location);
  uint64_t v14 = v4;
  p_long long buf = &buf;
  [v7 addExecutionBlock:&v10];
  id v8 = [(HMMTRStorage *)v4 keyValueStoreUpdateQueue];
  [v8 addOperation:v7];

  [v7 waitUntilFinished];
  LOBYTE(v8) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (char)v8;
}

void __40__HMMTRStorage__removeAllDataSourceData__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    __int16 v28 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing all data source data", buf, 0xCu);
  }
  id v7 = [*(id *)(a1 + 32) fabricID];

  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v28 = v19;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Expecting fabric ID to be present when data source is removed", buf, 0xCu);
    }
    goto LABEL_14;
  }
  id v8 = [*(id *)(a1 + 32) fabricDataSource];

  if (!v8)
  {
    id v9 = [*(id *)(a1 + 32) dataSource];
    uint64_t v10 = [*(id *)(a1 + 32) fabricID];
    uint64_t v11 = [v9 storageDataSourceForFabricWithID:v10];
    [*(id *)(a1 + 32) setFabricDataSource:v11];
  }
  __int16 v12 = [*(id *)(a1 + 32) fabricDataSource];

  if (!v12)
  {
    id v16 = (void *)MEMORY[0x2533B64D0]();
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      uint64_t v23 = [*(id *)(a1 + 32) fabricID];
      *(_DWORD *)long long buf = 138543618;
      __int16 v28 = v22;
      __int16 v29 = 2112;
      uint64_t v30 = v23;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@Fabric data source for fabric ID %@ is not available yet; cannot remove data from storage",
        buf,
        0x16u);
    }
LABEL_14:
    [WeakRetained finish];
    goto LABEL_15;
  }
  id v13 = [*(id *)(a1 + 32) fabricDataSource];
  uint64_t v14 = [NSDictionary dictionary];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __40__HMMTRStorage__removeAllDataSourceData__block_invoke_31;
  v24[3] = &unk_265378700;
  uint64_t v15 = *(void *)(a1 + 40);
  void v24[4] = *(void *)(a1 + 32);
  uint64_t v26 = v15;
  id v25 = WeakRetained;
  [v13 updateKeyValueStore:v14 completion:v24];

LABEL_15:
}

void __40__HMMTRStorage__removeAllDataSourceData__block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove key-value store: %@", (uint8_t *)&v10, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully removed all keys from key-value store", (uint8_t *)&v10, 0xCu);
    }
  }
  [*(id *)(a1 + 40) finish];
}

- (BOOL)_syncSetDataSourceValuesWithError:(id *)a3 block:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source values", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__10566;
  id v24 = __Block_byref_object_dispose__10567;
  id v25 = 0;
  id v11 = objc_alloc_init(MEMORY[0x263F42500]);
  objc_initWeak(&location, v11);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke;
  v16[3] = &unk_2653786D8;
  objc_copyWeak(&v19, &location);
  v16[4] = v8;
  id v12 = v6;
  id v17 = v12;
  p_long long buf = &buf;
  [v11 addExecutionBlock:v16];
  id v13 = [(HMMTRStorage *)v8 keyValueStoreUpdateQueue];
  [v13 addOperation:v11];

  [v11 waitUntilFinished];
  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  BOOL v14 = *(void *)(*((void *)&buf + 1) + 40) == 0;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v14;
}

void __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v24 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source values", buf, 0xCu);
  }
  id v7 = [*(id *)(a1 + 32) fabricID];

  if (!v7) {
    goto LABEL_11;
  }
  id v8 = [*(id *)(a1 + 32) fabricDataSource];

  if (!v8)
  {
    id v9 = [*(id *)(a1 + 32) dataSource];
    int v10 = [*(id *)(a1 + 32) fabricID];
    id v11 = [v9 storageDataSourceForFabricWithID:v10];
    [*(id *)(a1 + 32) setFabricDataSource:v11];
  }
  id v12 = [*(id *)(a1 + 32) fabricDataSource];

  if (!v12)
  {
    uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      id v19 = [*(id *)(a1 + 32) fabricID];
      *(_DWORD *)long long buf = 138543618;
      id v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Fabric data source for fabric ID %@ is not available yet", buf, 0x16u);
    }
LABEL_11:
    [WeakRetained finish];
    goto LABEL_12;
  }
  id v13 = [*(id *)(a1 + 32) fabricDataSource];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke_29;
  v20[3] = &unk_2653786B0;
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 48);
  id v21 = WeakRetained;
  [v13 updateKeyValueStoreWithBlock:v14 completion:v20];

LABEL_12:
}

void __56__HMMTRStorage__syncSetDataSourceValuesWithError_block___block_invoke_29(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) finish];
}

- (BOOL)_syncSetDataSourceValue:(id)a3 forKey:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v40 = v11;
    __int16 v41 = 2112;
    id v42 = v7;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Queueing sync set data source values for key: %@", buf, 0x16u);
  }
  id v38 = 0;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __47__HMMTRStorage__syncSetDataSourceValue_forKey___block_invoke;
  v35[3] = &unk_265378688;
  v35[4] = v9;
  id v12 = v7;
  id v36 = v12;
  id v13 = v6;
  id v37 = v13;
  BOOL v14 = [(HMMTRStorage *)v9 _syncSetDataSourceValuesWithError:&v38 block:v35];
  id v15 = v38;
  id v20 = v15;
  if (v14)
  {
    id v21 = (void *)MEMORY[0x2533B64D0](v15, v16, v17, v18, v19);
    uint64_t v22 = v9;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v40 = v24;
      __int16 v41 = 2112;
      id v42 = v12;
      _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully updated key-value store for key = %@", buf, 0x16u);
    }
  }
  else
  {

    uint64_t v30 = (void *)MEMORY[0x2533B64D0](v25, v26, v27, v28, v29);
    uint64_t v31 = v9;
    __int16 v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      char v33 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v40 = v33;
      __int16 v41 = 2112;
      id v42 = v12;
      __int16 v43 = 2112;
      id v44 = v20;
      _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to update key-value store for key = %@ with error %@", buf, 0x20u);
    }
  }

  return v14;
}

uint64_t __47__HMMTRStorage__syncSetDataSourceValue_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v20 = 138543618;
    id v21 = v10;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Setting data source value for key: %@", (uint8_t *)&v20, 0x16u);
  }
  id v12 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v13 = HMFEqualObjects();
  if (v13)
  {
    BOOL v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 40);
      int v20 = 138543618;
      id v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping write for key %@ as new value is same as existing", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    [v5 setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
    if (!*(void *)(a1 + 48)) {
      [v6 addObject:*(void *)(a1 + 40)];
    }
  }

  return v13 ^ 1u;
}

- (void)prepareStorageForFabricID:(id)a3 forInitialSetup:(BOOL)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(HMMTRStorage *)self setFabricID:v6];
  id v7 = [(HMMTRStorage *)self dataSource];
  id v8 = [(HMMTRStorage *)self fabricID];
  id v9 = [v7 storageDataSourceForFabricWithID:v8];
  [(HMMTRStorage *)self setFabricDataSource:v9];

  if (![(HMMTRStorage *)self isSharedAdmin])
  {
    uint64_t v10 = [(HMMTRStorage *)self fabricDataSource];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = [(HMMTRStorage *)self fabricDataSource];
      int v13 = [v12 keyValueStore];

      if (v13)
      {
        BOOL v14 = [(HMMTRStorage *)self fabricDataSource];
        id v15 = [v14 keyValueStore];
        uint64_t v16 = [v15 valueForKey:@"HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"];

        if (v16)
        {
          uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v18 = self;
          uint64_t v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v20 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            id v39 = v20;
            _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Storage for Apple Home fabric contains System Commissioner Fabric ID. Cleaning it up", buf, 0xCu);
          }
          [(HMMTRStorage *)v18 _syncSetDataSourceValue:0 forKey:@"HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"];
          id v21 = [(HMMTRStorage *)v18 systemCommissionerKeyValueStore];
          __int16 v22 = [v21 storedValueForKey:@"HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex"];

          if (!v22)
          {
            uint64_t v23 = [(HMMTRStorage *)v18 systemCommissionerKeyValueStore];
            id v37 = 0;
            char v24 = [v23 setStoredValue:v16 forKey:@"HMD.MTRPlugin.MTS.SystemCommissionerFabricIndex" error:&v37];
            id v25 = v37;

            if ((v24 & 1) == 0)
            {
              uint64_t v26 = (void *)MEMORY[0x2533B64D0]();
              uint64_t v27 = v18;
              uint64_t v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                uint64_t v29 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543618;
                id v39 = v29;
                __int16 v40 = 2112;
                id v41 = v25;
                _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to System Commissioner fabric ID with error %@", buf, 0x16u);
              }
            }
          }
        }
      }
    }
    if (!a4)
    {
      BOOL v30 = [(HMMTRStorage *)self isResidentDevice];
      if (v6)
      {
        if (v30)
        {
          if (isFeatureMatterLocalFabricConfigEnabled())
          {
            uint64_t v31 = [(HMMTRStorage *)self dataSource];
            __int16 v32 = [v31 appleHomeFabricWithID:v6];

            v35[0] = MEMORY[0x263EF8330];
            v35[1] = 3221225472;
            v35[2] = __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke;
            v35[3] = &unk_265378660;
            v35[4] = self;
            id v36 = v6;
            [v32 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v35];
          }
          else
          {
            v33[0] = MEMORY[0x263EF8330];
            v33[1] = 3221225472;
            v33[2] = __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke_26;
            v33[3] = &unk_265378660;
            v33[4] = self;
            id v34 = v6;
            [(HMMTRStorage *)self _fetchCertForFabricWithID:v34 isOwner:1 forPairing:0 forceFetchFromResident:0 completion:v33];
          }
        }
      }
    }
  }
}

void __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      uint64_t v10 = "%{public}@Failed to fetch commissioning certificates for fabric ID %@ with error %@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_252495000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    uint64_t v10 = "%{public}@Successfully fetched commissioning certificates for fabric ID %@";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

void __58__HMMTRStorage_prepareStorageForFabricID_forInitialSetup___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      uint64_t v10 = "%{public}@Failed to fetch commissioning certificates for fabric ID %@ with error %@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_252495000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    uint64_t v10 = "%{public}@Successfully fetched commissioning certificates for fabric ID %@";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)prepareStorageForFabricID:(id)a3
{
}

- (void)_setPreferencesValueForKey:(id)a3 value:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint32_t v13 = v11;
    __int16 v14 = 2112;
    int v15 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Setting preferences value for key: %@", (uint8_t *)&v12, 0x16u);
  }
  CFPreferencesSetAppValue(v6, v7, (CFStringRef)*MEMORY[0x263EFFE60]);
}

- (id)_preferencesValueForKey:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)*MEMORY[0x263EFFE60]);
  return v3;
}

- (void)persistLegacyControllerNodeWithDictionary:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    CFErrorRef v61 = v8;
    __int16 v62 = 2112;
    uint64_t v63 = (uint64_t)v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Storing the initial Matter storage to remote %@", buf, 0x16u);
  }
  if (![(HMMTRStorage *)v6 isSystemCommissionerFabric])
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    [v9 addEntriesFromDictionary:v4];
    if (isFeatureMatterLocalFabricConfigEnabled()
      && ![(HMMTRStorage *)v6 isResidentDevice])
    {
      uint64_t v28 = (void *)MEMORY[0x263F10CC0];
      uint64_t v29 = [v9 objectForKeyedSubscript:@"f/1/r"];
      uint64_t v53 = [v28 convertMatterCertificate:v29];

      id v30 = objc_alloc(MEMORY[0x263F10CB8]);
      uint64_t v31 = [v9 objectForKeyedSubscript:@"f/1/n"];
      __int16 v32 = (void *)[v30 initWithTLVBytes:v31];

      uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
      id v50 = (void *)MEMORY[0x263F10CC0];
      id v34 = [(HMMTRStorage *)v6 nocSigner];
      id v49 = [(HMMTRStorage *)v6 operationalKeyPair];
      uint64_t v35 = [v49 publicKey];
      id v36 = [v32 subject];
      id v37 = [v36 fabricID];
      id v52 = v32;
      id v38 = [v32 subject];
      id v39 = [v38 caseAuthenticatedTags];
      id v58 = 0;
      __int16 v40 = v50;
      BOOL v51 = (void *)v33;
      id v41 = [v40 createOperationalCertificate:v34 signingCertificate:v53 operationalPublicKey:v35 fabricID:v37 nodeID:v33 caseAuthenticatedTags:v39 error:&v58];
      id v42 = v58;

      if (v41)
      {
        [v9 setObject:v41 forKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];
        __int16 v43 = (void *)v53;
        [v9 setObject:v53 forKeyedSubscript:@"HMD.MTRPlugin.RootCert"];
        id v44 = [MEMORY[0x263F10CC0] convertX509Certificate:v41];
        [v9 setObject:v44 forKeyedSubscript:@"f/1/n"];
      }
      else
      {
        __int16 v43 = (void *)v53;
        uint64_t v45 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v46 = v6;
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          id v48 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          CFErrorRef v61 = v48;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v42;
          _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist legacy node with error %@", buf, 0x16u);
        }
      }

      if (!v41) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F10CC0];
      uint64_t v11 = [v9 objectForKeyedSubscript:@"f/1/n"];
      int v12 = [v10 convertMatterCertificate:v11];
      [v9 setObject:v12 forKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];

      uint32_t v13 = (void *)MEMORY[0x263F10CC0];
      __int16 v14 = [v9 objectForKeyedSubscript:@"f/1/r"];
      int v15 = [v13 convertMatterCertificate:v14];
      [v9 setObject:v15 forKeyedSubscript:@"HMD.MTRPlugin.RootCert"];
    }
    [(HMMTRStorage *)v6 startLocalStorageMode];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v55 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          __int16 v22 = [v16 objectForKeyedSubscript:v21];
          [(HMMTRStorage *)v6 setStorageData:v22 forKey:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v18);
    }

    uint64_t v23 = (void *)MEMORY[0x2533B64D0]([(HMMTRStorage *)v6 endLocalStorageModeBySyncingToRemote:1]);
    char v24 = v6;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      uint64_t v27 = [v16 count];
      *(_DWORD *)long long buf = 138543618;
      CFErrorRef v61 = v26;
      __int16 v62 = 2048;
      uint64_t v63 = v27;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Successfully persisted legacy node to Apple Home storage with %lu keys", buf, 0x16u);
    }
LABEL_17:
  }
}

- (BOOL)isResidentDevice
{
  int v2 = [(HMMTRStorage *)self dataSource];
  id v3 = [v2 currentFabricID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_handlePerFabricStorageMaybeAvailable:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMMTRStorage *)self fabricID];

  if (!v5)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v11;
      int v12 = "%{public}@Expecting fabric ID to be present";
      uint32_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_252495000, v13, v14, v12, (uint8_t *)&v16, 0xCu);
    }
LABEL_9:

    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v6 = [(HMMTRStorage *)self fabricDataSource];

  if (!v6)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v11;
      int v12 = "%{public}@Fabric storage is not available";
      uint32_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(HMMTRStorage *)self _syncToRemoteStorage];
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (void)handleUpdatedDataWithIsLocalChange:(BOOL)a3
{
  id v5 = [(HMMTRStorage *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HMMTRStorage_handleUpdatedDataWithIsLocalChange___block_invoke;
  v6[3] = &unk_2653785E8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __51__HMMTRStorage_handleUpdatedDataWithIsLocalChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUpdatedDataWithIsLocalChange:*(unsigned __int8 *)(a1 + 40)];
}

- (void)handlePrimaryResidentDataReady
{
  id v2 = [(HMMTRStorage *)self delegate];
  [v2 handlePrimaryResidentDataReady];
}

- (void)handleUpdatedCurrentFabricIndex
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F42620] productInfo];
  uint64_t v4 = [v3 productPlatform];

  if (v4 != 4)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v29 = v11;
      int v12 = "%{public}@Ignoring resident updates on non-tvOS device";
      uint32_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_12:

    return;
  }
  id v5 = [(HMMTRStorage *)self fabricID];
  id v6 = [(HMMTRStorage *)self dataSource];
  BOOL v7 = [v6 currentFabricID];

  if (v5 == v7)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = [(HMMTRStorage *)v9 fabricID];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v29 = v11;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring spurious fabric index update notification for fabric ID %@", buf, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if ([(HMMTRStorage *)self isFabricCreationInProgress])
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v29 = v11;
      int v12 = "%{public}@Ignoring updated fabric index notification until fabric creation is successful";
      uint32_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_252495000, v13, v14, v12, buf, 0xCu);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  [(HMMTRStorage *)self setRootCert:0];
  [(HMMTRStorage *)self setOperationalCert:0];
  [(HMMTRStorage *)self setOwnerNodeID:0];
  [(HMMTRStorage *)self setOwnerIPK:0];
  int v16 = [(HMMTRStorage *)self fabricID];
  uint64_t v17 = [(HMMTRStorage *)self dataSource];
  uint64_t v18 = [v17 currentFabricID];
  if (v16 == (void *)v18)
  {
  }
  else
  {
    uint64_t v19 = (void *)v18;
    id v20 = [(HMMTRStorage *)self dataSource];
    uint64_t v21 = [v20 currentFabricID];

    if (!v21)
    {
      __int16 v22 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v23 = self;
      char v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v29 = v25;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Current device is no longer the primary resident", buf, 0xCu);
      }
      uint64_t v26 = [(HMMTRStorage *)v23 delegate];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __47__HMMTRStorage_handleUpdatedCurrentFabricIndex__block_invoke;
      v27[3] = &unk_265378638;
      v27[4] = v23;
      [v26 handleDeviceNoLongerPrimaryResidentWithCompletion:v27];

      return;
    }
  }
  [(HMMTRStorage *)self handleUpdatedDataWithIsLocalChange:0];
}

uint64_t __47__HMMTRStorage_handleUpdatedCurrentFabricIndex__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting fabric ID to nil", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) setFabricID:0];
}

- (void)handleUpdatedDataForFabricIndex:(id)a3 nodeID:(id)a4 isLocalChange:(BOOL)a5
{
}

- (void)handleUpdatedDataForFabricIndex:(id)a3 isLocalChange:(BOOL)a4
{
}

- (void)_handleUpdatedDataWithIsLocalChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = (void *)v8;
    uint64_t v10 = "remote";
    if (v3) {
      uint64_t v10 = "local";
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v40 = v8;
    __int16 v41 = 2080;
    id v42 = v10;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling updated data storage due to %s change", buf, 0x16u);
  }
  uint64_t v11 = [(HMMTRStorage *)v6 fabricID];
  int v12 = [(HMMTRStorage *)v6 dataSource];
  uint32_t v13 = [v12 currentFabricID];
  char v14 = [v11 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    int v15 = [(HMMTRStorage *)v6 dataSource];
    int v16 = [v15 currentFabricID];

    if (v16)
    {
      uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v18 = v6;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        uint64_t v21 = [(HMMTRStorage *)v18 fabricID];
        __int16 v22 = [(HMMTRStorage *)v18 dataSource];
        uint64_t v23 = [v22 currentFabricID];
        *(_DWORD *)long long buf = 138543874;
        uint64_t v40 = (uint64_t)v20;
        __int16 v41 = 2112;
        id v42 = v21;
        __int16 v43 = 2112;
        id v44 = v23;
        _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Current fabric ID changed from %@ to %@", buf, 0x20u);
      }
      char v24 = [(HMMTRStorage *)v18 dataSource];
      id v25 = [v24 currentFabricID];
      [(HMMTRStorage *)v18 setFabricID:v25];
    }
  }
  uint64_t v26 = [(HMMTRStorage *)v6 fabricID];

  if (v26)
  {
    uint64_t v27 = [(HMMTRStorage *)v6 dataSource];
    uint64_t v28 = [(HMMTRStorage *)v6 fabricID];
    uint64_t v29 = [v27 storageDataSourceForFabricWithID:v28];
    [(HMMTRStorage *)v6 setFabricDataSource:v29];
  }
  if (v3) {
    [(HMMTRStorage *)v6 _handlePerFabricStorageMaybeAvailable:0];
  }
  if (isFeatureMatterLocalFabricConfigEnabled()
    && ([(HMMTRStorage *)v6 fabricID],
        __int16 v30 = objc_claimAutoreleasedReturnValue(),
        v30,
        v30))
  {
    uint64_t v31 = [(HMMTRStorage *)v6 dataSource];
    uint64_t v32 = [(HMMTRStorage *)v6 fabricID];
    uint64_t v33 = [v31 appleHomeFabricWithID:v32];

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke;
    v37[3] = &unk_265378610;
    v37[4] = v6;
    BOOL v38 = v3;
    [v33 loadFabricAndControllerDataForPairing:0 fetchFromResident:0 completion:v37];
  }
  else
  {
    id v34 = [(HMMTRStorage *)v6 workQueue];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_3;
    v35[3] = &unk_2653785E8;
    v35[4] = v6;
    BOOL v36 = v3;
    dispatch_async(v34, v35);
  }
}

void __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_2;
  v3[3] = &unk_2653785E8;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 storageDidUpdateData:*(void *)(a1 + 32) isLocalChange:*(unsigned __int8 *)(a1 + 40)];
}

void __52__HMMTRStorage__handleUpdatedDataWithIsLocalChange___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 storageDidUpdateData:*(void *)(a1 + 32) isLocalChange:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_dataSource, obj);
  char v4 = [obj currentFabricID];
  fabricID = self->_fabricID;
  self->_fabricID = v4;

  if (self->_fabricID)
  {
    objc_msgSend(obj, "storageDataSourceForFabricWithID:");
    id v6 = (HMMTRFabricStorageDataSource *)objc_claimAutoreleasedReturnValue();
    fabricDataSource = self->_fabricDataSource;
    self->_fabricDataSource = v6;
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v8 = [(HMMTRStorage *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 storageDidBecomeAvailable:self];
  }
}

- (HMMTRStorageDataSource)dataSource
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  os_unfair_lock_unlock(p_lock);
  return (HMMTRStorageDataSource *)WeakRetained;
}

- (HMMTRStorage)initWithQueue:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRStorage;
  id v6 = [(HMMTRStorage *)&v16 init];
  if (v6)
  {
    int v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    keyValueStoreUpdateQueue = v6->_keyValueStoreUpdateQueue;
    v6->_keyValueStoreUpdateQueue = v7;

    [(NSOperationQueue *)v6->_keyValueStoreUpdateQueue setMaxConcurrentOperationCount:1];
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    localStorage = v6->_localStorage;
    v6->_localStorage = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    inMemoryStorage = v6->_inMemoryStorage;
    v6->_inMemoryStorage = (NSMutableDictionary *)v11;

    uint32_t v13 = (MTSKeyValueStore *)objc_alloc_init(MEMORY[0x263F11058]);
    systemCommissionerKeyValueStore = v6->_systemCommissionerKeyValueStore;
    v6->_systemCommissionerKeyValueStore = v13;

    objc_storeStrong((id *)&v6->_workQueue, a3);
    v6->_sharedAdmin = 0;
  }

  return v6;
}

+ (BOOL)didUpdateMatterItems:(id)a3 oldStorage:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (isFeatureMatterLocalFabricConfigEnabled())
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = [v5 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if (!+[HMMTRStorage isPluginKey:v13]
            && !+[HMMTRStorage isMatterKey:v13])
          {
            char v14 = [v5 objectForKeyedSubscript:v13];
            id v15 = [v6 objectForKeyedSubscript:v13];
            if (![v14 isEqual:v15])
            {
LABEL_24:
              NSLog(&cfstr_StorageKeyHasC.isa, v13);
              LOBYTE(v7) = 1;
              goto LABEL_25;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    objc_super v16 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v17 = [v5 allKeys];
    uint64_t v8 = [v16 setWithArray:v17];

    uint64_t v18 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v19 = [v6 allKeys];
    id v20 = [v18 setWithArray:v19];

    [v20 minusSet:v8];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v20;
    uint64_t v7 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v7)
    {
      uint64_t v21 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v15);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          if (!+[HMMTRStorage isPluginKey:v13])
          {
            char v14 = v15;
            goto LABEL_24;
          }
        }
        uint64_t v7 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    char v14 = v15;
LABEL_25:
  }
  return v7;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t107 != -1) {
    dispatch_once(&logCategory__hmf_once_t107, &__block_literal_global_10624);
  }
  id v2 = (void *)logCategory__hmf_once_v108;
  return v2;
}

uint64_t __27__HMMTRStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v108;
  logCategory__hmf_once_long long v108 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)generateIPK
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 0x10uLL, bytes))
  {
    id v2 = 0;
  }
  else
  {
    id v2 = [MEMORY[0x263EFF8F8] dataWithBytes:bytes length:16];
  }
  return v2;
}

+ (BOOL)checkAndUpdateExpiryOfCertificate:(id)a3 keyPair:(id)a4 newCertificate:(id *)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x263F10CC0] keypair:v9 matchesCertificate:v8])
  {
    uint64_t v10 = [MEMORY[0x263F10CC0] convertX509Certificate:v8];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v10];
    int v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 notAfter];
      char v14 = [MEMORY[0x263EFF910] distantFuture];
      int v15 = [v13 isEqualToDate:v14];

      if (v15)
      {
        objc_super v16 = v12;
        uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
        id v18 = a1;
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          uint64_t v21 = [v12 notAfter];
          [MEMORY[0x263EFF910] distantFuture];
          v23 = __int16 v22 = v10;
          *(_DWORD *)long long buf = 138543874;
          id v58 = v20;
          __int16 v59 = 2112;
          id v60 = v21;
          __int16 v61 = 2112;
          id v62 = v23;
          _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Certificate expires in distant future. No update needed %@ vs %@", buf, 0x20u);

          uint64_t v10 = v22;
        }

        BOOL v24 = 0;
        int v12 = v16;
      }
      else
      {
        long long v54 = v10;
        id v33 = objc_alloc(MEMORY[0x263F08798]);
        uint64_t v34 = [v12 notBefore];
        uint64_t v35 = [MEMORY[0x263EFF910] distantFuture];
        long long v55 = a5;
        BOOL v36 = (void *)[v33 initWithStartDate:v34 endDate:v35];

        id v37 = (void *)MEMORY[0x263F10CC0];
        BOOL v38 = [v12 issuer];
        id v39 = [v38 rootCACertificateID];
        uint64_t v53 = v12;
        uint64_t v40 = [v12 issuer];
        __int16 v41 = [v40 fabricID];
        id v56 = 0;
        id v42 = [v37 createRootCertificate:v9 issuerID:v39 fabricID:v41 validityPeriod:v36 error:&v56];
        id v52 = v56;
        id *v55 = v42;

        id v43 = *v55;
        BOOL v24 = *v55 != 0;
        id v44 = (void *)MEMORY[0x2533B64D0]();
        id v45 = a1;
        uint64_t v46 = HMFGetOSLogHandle();
        v47 = v46;
        if (v43)
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            id v48 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            id v58 = v48;
            __int16 v59 = 2112;
            id v60 = v36;
            _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_INFO, "%{public}@Successfully re-created certificate with new validity %@", buf, 0x16u);
          }
          [MEMORY[0x263F10CC0] printX509Certificate:*v55];
          id v49 = v52;
        }
        else
        {
          id v49 = v52;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            id v50 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543874;
            id v58 = v50;
            __int16 v59 = 2112;
            id v60 = v36;
            __int16 v61 = 2112;
            id v62 = v52;
            _os_log_impl(&dword_252495000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-create certificate with new validity %@ due to error %@", buf, 0x20u);
          }
        }

        int v12 = v53;
        uint64_t v10 = v54;
      }
    }
    else
    {
      long long v29 = (void *)MEMORY[0x2533B64D0]([MEMORY[0x263F10CC0] printX509Certificate:v8]);
      id v30 = a1;
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v58 = v32;
        _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", buf, 0xCu);
      }
      BOOL v24 = 0;
    }
  }
  else
  {
    long long v25 = (void *)MEMORY[0x2533B64D0]([MEMORY[0x263F10CC0] printX509Certificate:v8]);
    id v26 = a1;
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v58 = v28;
      __int16 v59 = 2112;
      id v60 = v9;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@Certificate doesn't match key pair %@", buf, 0x16u);
    }
    BOOL v24 = 0;
  }

  return v24;
}

@end