@interface HMDHomeModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)cd_getHomeFromUUID:(id)a3;
+ (id)properties;
- (HMDHomeNFCReaderKey)nfcReaderKey;
- (HMDNaturalLightingContext)naturalLightingContext;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (void)setNaturalLightingContext:(id)a3;
- (void)setNfcReaderKey:(id)a3;
@end

@implementation HMDHomeModel

+ (id)properties
{
  if (properties_onceToken_118459 != -1) {
    dispatch_once(&properties_onceToken_118459, &__block_literal_global_118460);
  }
  v2 = (void *)properties__properties_118461;
  return v2;
}

void __26__HMDHomeModel_properties__block_invoke()
{
  v52[49] = *MEMORY[0x263EF8340];
  v51[0] = @"name";
  v50 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[0] = v50;
  v51[1] = @"ownerName";
  v49 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[1] = v49;
  v51[2] = @"ownerUserID";
  v48 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[2] = v48;
  v51[3] = @"ownerUUID";
  v47 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[3] = v47;
  v51[4] = @"creationDate";
  v46 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[4] = v46;
  v51[5] = @"firstHAPAccessoryAddedDate";
  v45 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[5] = v45;
  v51[6] = @"defaultRoomUUID";
  v44 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[6] = v44;
  v51[7] = @"presenceAuthorizationStatus";
  v43 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[7] = v43;
  v51[8] = @"presenceComputeStatus";
  v42 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[8] = v42;
  v51[9] = @"ownerPublicKey";
  v41 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[9] = v41;
  v51[10] = @"homeLocationData";
  v40 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[10] = v40;
  v51[11] = @"primaryResidentUUID";
  v39 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[11] = v39;
  v51[12] = @"sharedHomeSourceVersion";
  v38 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[12] = v38;
  v51[13] = @"networkProtectionMode";
  v37 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[13] = v37;
  v51[14] = @"supportsNetworkProtection";
  v36 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v52[14] = v36;
  v51[15] = @"activeNetworkRouterAccessoryUUID";
  v35 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v52[15] = v35;
  v51[16] = @"primaryNetworkRouterManagingDeviceUUID";
  v34 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v52[16] = v34;
  v51[17] = @"multiUserEnabled";
  v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[17] = v33;
  v51[18] = @"matCredGRK";
  v32 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[18] = v32;
  v51[19] = @"hasAnyUserAcknowledgedCameraRecordingOnboarding";
  v31 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[19] = v31;
  v51[20] = @"hasOnboardedForAccessCode";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[20] = v30;
  v51[21] = @"hasOnboardedForWalletKey";
  v29 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[21] = v29;
  v51[22] = @"encodedNfcReaderKey";
  v28 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v52[22] = v28;
  v51[23] = @"encodedNaturalLightingContext";
  v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[23] = v27;
  v51[24] = @"chipFabricID";
  v26 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[24] = v26;
  v51[25] = @"chipFabricIndex";
  v25 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[25] = v25;
  v51[26] = @"chipLastNodeID";
  v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[26] = v24;
  v51[27] = @"chipRootCertificate";
  v23 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[27] = v23;
  v51[28] = @"chipOperationalCertificate";
  v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[28] = v22;
  v51[29] = @"chipIntermediateCertificate";
  v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[29] = v21;
  v51[30] = @"chipKeyValueStore";
  v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[30] = v20;
  v51[31] = @"matterControllerNodeID";
  v19 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[31] = v19;
  v51[32] = @"matterFabricID";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[32] = v18;
  v51[33] = @"threadOperationalDataset";
  v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[33] = v17;
  v51[34] = @"soundCheckEnabled";
  v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[34] = v16;
  v51[35] = @"analysisOptions";
  v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[35] = v15;
  v51[36] = @"didOnboardAnalysis";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[36] = v14;
  v51[37] = @"siriPhraseOptions";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[37] = v13;
  v51[38] = @"locationServicesEnabled";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[38] = v12;
  v51[39] = @"didOnboardLocationServices";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[39] = v11;
  v51[40] = @"residentSyncClientDidSync";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[40] = v0;
  v51[41] = @"owned";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[41] = v1;
  v51[42] = @"hh2EncodedNfcReaderKey";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[42] = v2;
  v51[43] = @"residentSelectionVersion";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[43] = v3;
  v51[44] = @"didOnboardEventLog";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[44] = v4;
  v51[45] = @"eventLogHomeSettingEnabled";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[45] = v5;
  v51[46] = @"eventLogDuration";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[46] = v6;
  v51[47] = @"timeZone";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[47] = v7;
  v51[48] = @"numberOfCameras";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v52[48] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:49];
  v10 = (void *)properties__properties_118461;
  properties__properties_118461 = v9;
}

- (HMDHomeNFCReaderKey)nfcReaderKey
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(HMDHomeModel *)self hh2EncodedNfcReaderKey];
  if (v2)
  {
    id v11 = 0;
    v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v11];
    id v4 = v11;
    v5 = v4;
    if (v3) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (!v6)
    {
      v7 = (void *)MEMORY[0x230FBD990]();
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v13 = v9;
        __int16 v14 = 2112;
        v15 = v2;
        __int16 v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode nfc reader key set on model %@:%@", buf, 0x20u);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return (HMDHomeNFCReaderKey *)v3;
}

- (void)setNfcReaderKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v11 = 0;
  v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    [(HMDHomeModel *)self setHh2EncodedNfcReaderKey:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set encoded nfc reader key on model %@:%@", buf, 0x20u);
    }
  }
}

- (HMDNaturalLightingContext)naturalLightingContext
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(HMDHomeModel *)self encodedNaturalLightingContext];
  if (v2)
  {
    id v9 = 0;
    v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v9];
    id v4 = v9;
    if (!v3)
    {
      v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v11 = v7;
        __int16 v12 = 2112;
        v13 = v2;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode natural lighting context set on home model %@:%@", buf, 0x20u);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return (HMDNaturalLightingContext *)v3;
}

- (void)setNaturalLightingContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v10 = 0;
  v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
  id v6 = v10;
  if (v5)
  {
    [(HMDHomeModel *)self setEncodedNaturalLightingContext:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to set encoded natural lighting context on the home model %@:%@", buf, 0x20u);
    }
  }
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"owner"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"ownerUUID"])
    {
      id v11 = objc_alloc(MEMORY[0x263F08C38]);
      __int16 v12 = [(HMDHomeModel *)self ownerUUID];
      id v13 = (id)[v11 initWithUUIDString:v12];

      if (v13)
      {
        id v59 = 0;
        id v14 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v13 ofModelType:objc_opt_class() error:&v59];
        id v15 = v59;
        id v16 = v15;
        if (v14 && !v15) {
          goto LABEL_23;
        }
        uint64_t v17 = (void *)MEMORY[0x230FBD990]();
        uint64_t v18 = self;
        v19 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
LABEL_17:

LABEL_23:

LABEL_28:
          goto LABEL_73;
        }
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v61 = v20;
        __int16 v62 = 2112;
        id v63 = v13;
        __int16 v64 = 2112;
        v65 = v16;
        v21 = "%{public}@Unable to find NSManagedObject for home owner with UUID %@: %@";
LABEL_16:
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, v21, buf, 0x20u);

        goto LABEL_17;
      }
      goto LABEL_27;
    }
    goto LABEL_72;
  }
  if ([v9 isEqualToString:@"primaryResident"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"primaryResidentUUID"])
    {
      v22 = [(HMDHomeModel *)self primaryResidentUUID];

      if (v22)
      {
        id v23 = objc_alloc(MEMORY[0x263F08C38]);
        v24 = [(HMDHomeModel *)self primaryResidentUUID];
        id v13 = (id)[v23 initWithUUIDString:v24];

        if (v13)
        {
          id v58 = 0;
          id v14 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v13 ofModelType:objc_opt_class() error:&v58];
          id v25 = v58;
          id v16 = v25;
          if (v14 && !v25) {
            goto LABEL_23;
          }
          uint64_t v17 = (void *)MEMORY[0x230FBD990]();
          uint64_t v18 = self;
          v19 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v61 = v20;
          __int16 v62 = 2112;
          id v63 = v13;
          __int16 v64 = 2112;
          v65 = v16;
          v21 = "%{public}@Unable to find NSManagedObject for resident device with UUID %@: %@";
          goto LABEL_16;
        }
LABEL_27:
        id v14 = 0;
        goto LABEL_28;
      }
      uint64_t v32 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_36;
    }
    goto LABEL_72;
  }
  if ([v9 isEqualToString:@"defaultRoom"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"defaultRoomUUID"])
    {
      id v13 = v10;
      if (self)
      {
        id v16 = [(HMDBackingStoreModelObject *)self managedObject];
        id v14 = [v16 defaultRoom];
        if (!v14)
        {
          id v26 = objc_alloc(MEMORY[0x263F08C38]);
          v27 = [(HMDHomeModel *)self defaultRoomUUID];
          v28 = (void *)[v26 initWithUUIDString:v27];

          id v14 = [[_MKFRoom alloc] initWithContext:v13];
          [(_MKFRoom *)v14 setModelID:v28];
          [(_MKFRoom *)v14 setHome:v16];
          objc_msgSend(v16, "addRooms_Object:", v14);
          [v16 setDefaultRoom:v14];
        }
        goto LABEL_23;
      }
      goto LABEL_27;
    }
    goto LABEL_72;
  }
  if ([v9 isEqualToString:@"naturalLightingContext"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"encodedNaturalLightingContext"]) {
      goto LABEL_72;
    }
    uint64_t v29 = [(HMDHomeModel *)self naturalLightingContext];
    goto LABEL_32;
  }
  if ([v9 isEqualToString:@"nfcReaderKey"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"hh2EncodedNfcReaderKey"]) {
      goto LABEL_72;
    }
    uint64_t v29 = [(HMDHomeModel *)self nfcReaderKey];
    goto LABEL_32;
  }
  if (([v9 isEqualToString:@"location"] & 1) != 0
    || ([v9 isEqualToString:@"locationUpdateTimeStamp"] & 1) != 0
    || [v9 isEqualToString:@"locationSource"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"homeLocationData"]) {
      goto LABEL_72;
    }
    v33 = (void *)MEMORY[0x230FBD990]();
    id v14 = (_MKFRoom *)objc_alloc(MEMORY[0x263F08928]);
    v34 = [(HMDHomeModel *)self homeLocationData];
    id v57 = 0;
    v35 = (void *)[(_MKFRoom *)v14 initForReadingFromData:v34 error:&v57];
    id v36 = v57;

    if (v36)
    {
      v54 = v35;
      v37 = v33;
      v38 = (void *)MEMORY[0x230FBD990]();
      v39 = self;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v61 = v41;
        __int16 v62 = 2112;
        id v63 = v36;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize unarchiver for HomeLocationData: %@", buf, 0x16u);
      }
      id v14 = 0;
      int v42 = 1;
      v33 = v37;
      v35 = v54;
LABEL_57:

      if (v42) {
        goto LABEL_73;
      }
      goto LABEL_58;
    }
    v43 = [v35 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
    if (!v43)
    {
      v55 = v35;
      v45 = v33;
      v46 = (void *)MEMORY[0x230FBD990]();
      v47 = self;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v61 = v49;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive HomeLocationData", buf, 0xCu);
      }
      id v14 = 0;
      int v42 = 1;
      v33 = v45;
      id v36 = 0;
      v35 = v55;
      goto LABEL_56;
    }
    if ([v9 isEqualToString:@"location"])
    {
      uint64_t v44 = [v43 location];
    }
    else if ([v9 isEqualToString:@"locationUpdateTimeStamp"])
    {
      uint64_t v44 = [v43 locationUpdateTimestamp];
    }
    else
    {
      if (![v9 isEqualToString:@"locationSource"])
      {
        int v42 = 0;
        goto LABEL_56;
      }
      uint64_t v44 = [v43 locationSource];
    }
    id v14 = (_MKFRoom *)v44;
    int v42 = 1;
LABEL_56:

    goto LABEL_57;
  }
LABEL_58:
  if ([v9 isEqualToString:@"matterKeyValueStore"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"chipFabricID"]
      || [(HMDBackingStoreModelObject *)self propertyWasSet:@"chipFabricIndex"]
      || [(HMDBackingStoreModelObject *)self propertyWasSet:@"chipKeyValueStore"])
    {
      id v13 = [MEMORY[0x263EFF9A0] dictionary];
      v50 = [(HMDHomeModel *)self chipFabricID];
      [v13 setObject:v50 forKeyedSubscript:@"HMDHMMKVS.fabricID"];

      v51 = [(HMDHomeModel *)self chipFabricIndex];
      [v13 setObject:v51 forKeyedSubscript:@"HMDHMMKVS.fabricIndex"];

      v52 = [(HMDHomeModel *)self chipKeyValueStore];
      [v13 addEntriesFromDictionary:v52];

      id v14 = (_MKFRoom *)[v13 copy];
      goto LABEL_28;
    }
    goto LABEL_72;
  }
  if ([v9 isEqualToString:@"didOnboardMemory"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"didOnboardEventLog"]) {
      goto LABEL_72;
    }
    uint64_t v29 = [(HMDHomeModel *)self didOnboardEventLog];
  }
  else if ([v9 isEqualToString:@"memoryEnabled"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"eventLogHomeSettingEnabled"]) {
      goto LABEL_72;
    }
    uint64_t v29 = [(HMDHomeModel *)self eventLogHomeSettingEnabled];
  }
  else
  {
    if (![v9 isEqualToString:@"memoryDuration"])
    {
      v56.receiver = self;
      v56.super_class = (Class)HMDHomeModel;
      uint64_t v32 = [(HMDBackingStoreModelObject *)&v56 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
LABEL_36:
      id v14 = (_MKFRoom *)v32;
      goto LABEL_73;
    }
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"eventLogDuration"])
    {
LABEL_72:
      id v14 = 0;
      goto LABEL_73;
    }
    uint64_t v29 = [(HMDHomeModel *)self eventLogDuration];
  }
LABEL_32:
  v30 = (void *)v29;
  v31 = (void *)*MEMORY[0x263EFFD08];
  if (v29) {
    v31 = (void *)v29;
  }
  id v14 = v31;

LABEL_73:
  return v14;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"residentSyncClientDidSync"])
  {
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "residentSyncClientDidSync"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
    id v12 = v11;
    goto LABEL_22;
  }
  if ([v9 isEqualToString:@"ownerName"])
  {
    id v13 = [v8 owner];
    id v14 = [v13 pairingIdentity];
    uint64_t v15 = [v14 identifier];
LABEL_16:
    v19 = (void *)v15;
    v20 = (void *)*MEMORY[0x263EFFD08];
    if (v15) {
      v20 = (void *)v15;
    }
    id v12 = v20;
LABEL_19:

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  if ([v9 isEqualToString:@"ownerUserID"])
  {
    id v13 = [v8 owner];
    uint64_t v16 = [v13 userID];
LABEL_8:
    id v14 = (void *)v16;
    uint64_t v17 = (void *)*MEMORY[0x263EFFD08];
    if (v16) {
      uint64_t v17 = (void *)v16;
    }
    id v12 = v17;
    goto LABEL_20;
  }
  if ([v9 isEqualToString:@"ownerUUID"])
  {
    uint64_t v18 = [v8 owner];
LABEL_15:
    id v13 = v18;
    id v14 = [v18 modelID];
    uint64_t v15 = [v14 UUIDString];
    goto LABEL_16;
  }
  if ([v9 isEqualToString:@"primaryResidentUUID"])
  {
    uint64_t v18 = [v8 primaryResident];
    goto LABEL_15;
  }
  if ([v9 isEqualToString:@"encodedNaturalLightingContext"])
  {
    id v13 = [v8 naturalLightingContext];
    if (v13)
    {
      id v50 = 0;
      v22 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v50];
      id v23 = v50;
      if (!v22)
      {
        v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = self;
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v52 = v27;
          __int16 v53 = 2112;
          id v54 = v23;
          v28 = "%{public}@Failed to encode natural lighting context while MFK -> HMD conversion: %@";
LABEL_35:
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

          goto LABEL_36;
        }
        goto LABEL_36;
      }
      goto LABEL_37;
    }
LABEL_40:
    id v30 = [MEMORY[0x263EFF9D0] null];
LABEL_41:
    id v12 = v30;
    goto LABEL_21;
  }
  if ([v9 isEqualToString:@"hh2EncodedNfcReaderKey"])
  {
    id v13 = [v8 nfcReaderKey];
    if (v13)
    {
      id v49 = 0;
      v22 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v49];
      id v23 = v49;
      if (!v22)
      {
        v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = self;
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v52 = v27;
          __int16 v53 = 2112;
          id v54 = v23;
          v28 = "%{public}@Failed to encode nfc reader key while MFK -> HMD conversion: %@";
          goto LABEL_35;
        }
LABEL_36:
      }
LABEL_37:
      uint64_t v29 = (void *)*MEMORY[0x263EFFD08];
      if (v22) {
        uint64_t v29 = v22;
      }
      id v12 = v29;

      goto LABEL_21;
    }
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"defaultRoomUUID"])
  {
    uint64_t v18 = [v8 defaultRoom];
    goto LABEL_15;
  }
  if ([v9 isEqualToString:@"ownerPublicKey"])
  {
    id v13 = [v8 owner];
    id v14 = [v13 pairingIdentity];
    v19 = [v14 publicKey];
    uint64_t v31 = [v19 data];
    uint64_t v32 = (void *)v31;
    v33 = (void *)*MEMORY[0x263EFFD08];
    if (v31) {
      v33 = (void *)v31;
    }
    id v12 = v33;

    goto LABEL_19;
  }
  if (![v9 isEqualToString:@"homeLocationData"])
  {
    if ([v9 isEqualToString:@"chipFabricID"])
    {
      uint64_t v44 = [v8 matterKeyValueStore];
      id v13 = v44;
      v45 = @"HMDHMMKVS.fabricID";
    }
    else
    {
      if (![v9 isEqualToString:@"chipFabricIndex"])
      {
        if ([v9 isEqualToString:@"chipKeyValueStore"])
        {
          uint64_t v46 = [v8 matterKeyValueStore];
        }
        else if ([v9 isEqualToString:@"didOnboardEventLog"])
        {
          uint64_t v46 = [v8 didOnboardEventLog];
        }
        else if ([v9 isEqualToString:@"eventLogHomeSettingEnabled"])
        {
          uint64_t v46 = [v8 eventLogEnabled];
        }
        else
        {
          if (![v9 isEqualToString:@"eventLogDuration"])
          {
            v48.receiver = self;
            v48.super_class = (Class)HMDHomeModel;
            id v11 = [(HMDBackingStoreModelObject *)&v48 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
            goto LABEL_3;
          }
          uint64_t v46 = [v8 eventLogDuration];
        }
        id v13 = (void *)v46;
        v47 = (void *)*MEMORY[0x263EFFD08];
        if (v46) {
          v47 = (void *)v46;
        }
        id v30 = v47;
        goto LABEL_41;
      }
      uint64_t v44 = [v8 matterKeyValueStore];
      id v13 = v44;
      v45 = @"HMDHMMKVS.fabricIndex";
    }
    uint64_t v16 = [v44 objectForKeyedSubscript:v45];
    goto LABEL_8;
  }
  uint64_t v34 = [v8 location];
  if (!v34) {
    goto LABEL_61;
  }
  v35 = (void *)v34;
  uint64_t v36 = [v8 locationUpdateTimeStamp];
  if (!v36)
  {

    goto LABEL_61;
  }
  v37 = (void *)v36;
  v38 = [v8 locationSource];

  if (!v38)
  {
LABEL_61:
    id v11 = (id)*MEMORY[0x263EFFD08];
    goto LABEL_3;
  }
  v39 = [HMDHomeLocationData alloc];
  v40 = [v8 location];
  v41 = [v8 locationUpdateTimeStamp];
  int v42 = [v8 locationSource];
  v43 = [(HMDHomeLocationData *)v39 initWithLocation:v40 locationUpdateTimestamp:v41 locationSource:v42];

  encodeRootObject();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return 0;
}

+ (id)cd_getHomeFromUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v16 = 0;
  id v6 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v4 ofManagedObjectType:objc_opt_class() error:&v16];
  id v7 = v16;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v14 = v6;
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find mkfHome with UUID %@: %@", buf, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

@end