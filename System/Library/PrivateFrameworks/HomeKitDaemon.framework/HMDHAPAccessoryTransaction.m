@interface HMDHAPAccessoryTransaction
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)cd_getMKFHAPAccessoryFromAccessory:(id)a3;
+ (id)cd_getMKFHAPAccessoryFromAccessoryUUID:(id)a3;
+ (id)cd_getMKFServiceFromAccessoryUUID:(id)a3 serviceInstanceId:(id)a4;
+ (id)properties;
- (HAPAccessory)hapAccessoryLocal;
- (NSSet)chipPairings;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
- (void)setChipPairings:(id)a3;
- (void)setHapAccessoryLocal:(id)a3;
@end

@implementation HMDHAPAccessoryTransaction

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMDHAPAccessoryTransaction_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_155339 != -1) {
    dispatch_once(&properties_onceToken_155339, block);
  }
  v2 = (void *)properties__properties_155340;
  return v2;
}

void __40__HMDHAPAccessoryTransaction_properties__block_invoke(uint64_t a1)
{
  v92[80] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v89.receiver = *(id *)(a1 + 32);
  v89.super_class = (Class)&OBJC_METACLASS___HMDHAPAccessoryTransaction;
  v2 = objc_msgSendSuper2(&v89, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_155340;
  properties__properties_155340 = v3;

  v72 = (void *)properties__properties_155340;
  v91[0] = @"uniqueIdentifier";
  v88 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[0] = v88;
  v91[1] = @"bridgeUUID";
  v87 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[1] = v87;
  v91[2] = @"paired";
  v86 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
  v92[2] = v86;
  v91[3] = @"accessoryFlags";
  v85 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[3] = v85;
  v91[4] = @"certificationStatus";
  v84 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[4] = v84;
  v91[5] = @"pairingUsername";
  v83 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[5] = v83;
  v91[6] = @"publicKey";
  v82 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[6] = v82;
  v91[7] = @"transportInformation";
  v81 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[7] = v81;
  v91[8] = @"communicationProtocol";
  v80 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[8] = v80;
  v91[9] = @"accessorySetupHash";
  v79 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[9] = v79;
  v91[10] = @"broadcastKey";
  v78 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[10] = v78;
  v91[11] = @"keyUpdatedStateNumber";
  v77 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[11] = v77;
  v91[12] = @"keyUpdatedTime";
  v76 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[12] = v76;
  v91[13] = @"targetUUIDs";
  v75 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[13] = v75;
  v91[14] = @"hardwareSupport";
  v74 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[14] = v74;
  v91[15] = @"connectivityInfo";
  v73 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[15] = v73;
  v91[16] = @"wiFiTransportCapabilities";
  v71 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[16] = v71;
  v91[17] = @"sleepInterval";
  v70 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[17] = v70;
  v91[18] = @"hasOnboardedForNaturalLighting";
  v69 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[18] = v69;
  v91[19] = @"initialServiceTypeUUIDs";
  uint64_t v5 = objc_opt_class();
  uint64_t v90 = objc_opt_class();
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
  v67 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v5 additionalDecodeClasses:v68];
  v92[19] = v67;
  v91[20] = @"needsOnboarding";
  v66 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[20] = v66;
  v91[21] = @"suspendedState";
  v65 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[21] = v65;
  v91[22] = @"preferredMediaUserUUID";
  v64 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[22] = v64;
  v91[23] = @"preferredUserSelectionType";
  v63 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[23] = v63;
  v91[24] = @"soundAlertEnabled";
  v62 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[24] = v62;
  v91[25] = @"lightWhenUsingSiriEnabled";
  v61 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[25] = v61;
  v91[26] = @"siriEnabled";
  v60 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[26] = v60;
  v91[27] = @"siriLanguageCode";
  v59 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[27] = v59;
  v91[28] = @"siriLanguageVoiceCode";
  v58 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[28] = v58;
  v91[29] = @"siriLanguageVoiceGenderCode";
  v57 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[29] = v57;
  v91[30] = @"siriLanguageVoiceName";
  v56 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[30] = v56;
  v91[31] = @"hasDismissedHomePodHasNonMemberMediaAccountWarning";
  v55 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[31] = v55;
  v91[32] = @"doorbellChimeEnabled";
  v54 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[32] = v54;
  v91[33] = @"announceEnabled";
  v53 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[33] = v53;
  v91[34] = @"visionDoubleTapSettingsTimeoutInterval";
  v52 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[34] = v52;
  v91[35] = @"visionVoiceOverEnabled";
  v51 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[35] = v51;
  v91[36] = @"visionVoiceOverAudioDuckingEnabled";
  v50 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[36] = v50;
  v91[37] = @"visionSpeakingRate";
  v49 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[37] = v49;
  v91[38] = @"interactionHoldDurationEnabled";
  v48 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[38] = v48;
  v91[39] = @"interactionHoldDurationSeconds";
  v47 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[39] = v47;
  v91[40] = @"interactionTouchAccommodationsEnabled";
  v46 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[40] = v46;
  v91[41] = @"interactionIgnoreRepeatEnabled";
  v45 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[41] = v45;
  v91[42] = @"interactionIgnoreRepeatSeconds";
  v44 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[42] = v44;
  v91[43] = @"shareSiriAnalytics";
  v43 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[43] = v43;
  v91[44] = @"shareSpeakerAnalytics";
  v42 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[44] = v42;
  v91[45] = @"airPlayEnabled";
  v41 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[45] = v41;
  v91[46] = @"siriEndpointEnabled";
  v40 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[46] = v40;
  v91[47] = @"cameraAccessModeAtHome";
  v39 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[47] = v39;
  v91[48] = @"cameraAccessModeNotAtHome";
  v38 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[48] = v38;
  v91[49] = @"cameraRecordingEventTriggers";
  v37 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[49] = v37;
  v91[50] = @"cameraActivityZones";
  v36 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[50] = v36;
  v91[51] = @"cameraActivityZonesIncludedForSignificantEventDetection";
  v35 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[51] = v35;
  v91[52] = @"supportsMatterAccessCode";
  v34 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[52] = v34;
  v91[53] = @"supportsMatterWalletKey";
  v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[53] = v33;
  v91[54] = @"supportsMatterWeekDaySchedule";
  v32 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[54] = v32;
  v91[55] = @"supportsMatterYearDaySchedule";
  v31 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[55] = v31;
  v91[56] = @"matterWeekDayScheduleCapacity";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[56] = v30;
  v91[57] = @"matterYearDayScheduleCapacity";
  v29 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[57] = v29;
  v91[58] = @"cameraCurrentAccessMode";
  v28 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[58] = v28;
  v91[59] = @"cameraCurrentAccessModeChangeReason";
  v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[59] = v27;
  v91[60] = @"cameraCurrentAccessModeChangeDate";
  v26 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[60] = v26;
  v91[61] = @"enhancedAuthMethod";
  v25 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[61] = v25;
  v91[62] = @"enhancedAuthConfigNumber";
  v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[62] = v24;
  v91[63] = @"supportsNaturalLighting";
  v23 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[63] = v23;
  v91[64] = @"naturalLightingEnabled";
  v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[64] = v22;
  v91[65] = @"chipNodeID";
  v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[65] = v21;
  v91[66] = @"chipVendorID";
  v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[66] = v20;
  v91[67] = @"chipProductID";
  v19 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[67] = v19;
  v91[68] = @"chipAttributeDatabase";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[68] = v18;
  v91[69] = @"chipPairingsData";
  v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[69] = v17;
  v91[70] = @"chipWEDSupport";
  v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[70] = v16;
  v91[71] = @"chipExtendedMACAddress";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[71] = v6;
  v91[72] = @"matterSoftwareVersionNumber";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[72] = v7;
  v91[73] = @"supportedLinkLayerTypes";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[73] = v8;
  v91[74] = @"supportsMatCredACP";
  v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[74] = v9;
  v91[75] = @"supportsMatCredACB";
  v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[75] = v10;
  v91[76] = @"matCredRGSI";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[76] = v11;
  v91[77] = @"preexistingMatCredRGI";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[77] = v12;
  v91[78] = @"mfiCertifiedACWG";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[78] = v13;
  v91[79] = @"supportsNativeMatter";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v92[79] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:80];
  [v72 addEntriesFromDictionary:v15];
}

- (void).cxx_destruct
{
}

- (void)setHapAccessoryLocal:(id)a3
{
}

- (HAPAccessory)hapAccessoryLocal
{
  return self->_hapAccessoryLocal;
}

- (void)setChipPairings:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v11 = 0;
    uint64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
    id v6 = v11;
    if (v5)
    {
      [(HMDHAPAccessoryTransaction *)self setChipPairingsData:v5];
    }
    else
    {
      v7 = (void *)MEMORY[0x230FBD990]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v13 = v10;
        __int16 v14 = 2112;
        id v15 = v4;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize pairings %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    [(HMDHAPAccessoryTransaction *)self setChipPairingsData:0];
  }
}

- (NSSet)chipPairings
{
  v21[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDHAPAccessoryTransaction *)self chipPairingsData];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08928];
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    v7 = [v5 setWithArray:v6];
    id v16 = 0;
    v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:&v16];
    id v9 = v16;

    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize pairings from data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return (NSSet *)v8;
}

- (id)dependentUUIDs
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)HMDHAPAccessoryTransaction;
  uint64_t v3 = [(HMDAccessoryTransaction *)&v33 dependentUUIDs];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(HMDHAPAccessoryTransaction *)v2 bridgeUUID];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F08C38]);
    v7 = [(HMDHAPAccessoryTransaction *)v2 bridgeUUID];
    v8 = (void *)[v6 initWithUUIDString:v7];
    [v4 addObject:v8];
  }
  id v9 = [(HMDHAPAccessoryTransaction *)v2 targetUUIDs];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v26 = v4;
    id v11 = (void *)MEMORY[0x263EFF980];
    v12 = [(HMDHAPAccessoryTransaction *)v2 targetUUIDs];
    v28 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(HMDHAPAccessoryTransaction *)v2 targetUUIDs];
    uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    unint64_t v14 = 0x263F08000uLL;
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          __int16 v19 = (void *)[objc_alloc(*(Class *)(v14 + 3128)) initWithUUIDString:v18];
          if (v19)
          {
            [v28 addObject:v19];
          }
          else
          {
            id v20 = (void *)MEMORY[0x230FBD990]();
            v21 = v2;
            v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = v23 = v2;
              *(_DWORD *)buf = 138543618;
              v35 = v24;
              __int16 v36 = 2112;
              uint64_t v37 = v18;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@UUID string not well-formed: %@", buf, 0x16u);

              v2 = v23;
              unint64_t v14 = 0x263F08000;
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v15);
    }

    id v4 = v26;
    [v26 addObjectsFromArray:v28];
  }
  return v4;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  v35[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"cameraActivityZones"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"cameraActivityZones"])
    {
      id v11 = [(HMDHAPAccessoryTransaction *)self cameraActivityZones];
      if (v11)
      {
        v12 = (void *)MEMORY[0x263F08928];
        uint64_t v13 = (void *)MEMORY[0x263EFFA08];
        v35[0] = objc_opt_class();
        v35[1] = objc_opt_class();
        unint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
        uint64_t v15 = [v13 setWithArray:v14];
        id v30 = 0;
        uint64_t v16 = [v12 unarchivedObjectOfClasses:v15 fromData:v11 error:&v30];
        id v17 = v30;

        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          v22 = (void *)MEMORY[0x230FBD990]();
          v23 = self;
          v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v32 = v25;
            __int16 v33 = 2112;
            id v34 = v17;
            _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode activity zones: %@", buf, 0x16u);
          }
          id v18 = [MEMORY[0x263EFFA08] set];
        }
        v26 = v18;

        goto LABEL_37;
      }
      goto LABEL_13;
    }
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"initialServiceTypes"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"initialServiceTypeUUIDs"])
    {
      __int16 v19 = [(HMDHAPAccessoryTransaction *)self initialServiceTypeUUIDs];
      id v11 = v19;
      if (v19)
      {
        HMDSortedServiceTypeUUIDsFromStrings(v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
        v26 = v20;
LABEL_37:

        goto LABEL_39;
      }
LABEL_13:
      id v20 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_36;
    }
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"matterNodeID"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"chipNodeID"])
    {
      uint64_t v21 = [(HMDHAPAccessoryTransaction *)self chipNodeID];
LABEL_33:
      id v11 = (void *)v21;
      v27 = (void *)*MEMORY[0x263EFFD08];
      if (v21) {
        v27 = (void *)v21;
      }
      id v20 = v27;
      goto LABEL_36;
    }
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"matterVendorID"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"chipVendorID"])
    {
      uint64_t v21 = [(HMDHAPAccessoryTransaction *)self chipVendorID];
      goto LABEL_33;
    }
LABEL_38:
    v26 = 0;
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"matterProductID"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"chipProductID"])
    {
      uint64_t v21 = [(HMDHAPAccessoryTransaction *)self chipProductID];
      goto LABEL_33;
    }
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"matterPairings"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"chipPairingsData"])
    {
      uint64_t v21 = [(HMDHAPAccessoryTransaction *)self chipPairings];
      goto LABEL_33;
    }
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"matterWEDSupport"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"chipWEDSupport"])
    {
      uint64_t v21 = [(HMDHAPAccessoryTransaction *)self chipWEDSupport];
      goto LABEL_33;
    }
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"matterExtendedMACAddress"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"chipExtendedMACAddress"])
    {
      uint64_t v21 = [(HMDHAPAccessoryTransaction *)self chipExtendedMACAddress];
      goto LABEL_33;
    }
    goto LABEL_38;
  }
  v29.receiver = self;
  v29.super_class = (Class)HMDHAPAccessoryTransaction;
  v26 = [(HMDAccessoryTransaction *)&v29 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
LABEL_39:

  return v26;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"cameraActivityZones"])
  {
    id v11 = [v8 cameraActivityZones];
    if (v11)
    {
      id v44 = 0;
      v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v44];
      id v13 = v44;
      if (v12)
      {
LABEL_4:
        id v14 = v12;
LABEL_24:

LABEL_36:
        goto LABEL_46;
      }
      objc_super v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = self;
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        long long v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v32;
        __int16 v48 = 2112;
        id v49 = v13;
        __int16 v33 = "%{public}@Failed to encode activity zones: %@";
LABEL_22:
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);

        goto LABEL_23;
      }
      goto LABEL_23;
    }
    goto LABEL_35;
  }
  if ([v9 isEqualToString:@"initialServiceTypeUUIDs"])
  {
    uint64_t v15 = [v8 initialServiceTypes];
    if (v15)
    {
      id v37 = v8;
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v15, "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = (void *)MEMORY[0x263F425C8];
            v23 = [*(id *)(*((void *)&v40 + 1) + 8 * i) UUIDString];
            v24 = objc_msgSend(v22, "hmf_cachedInstanceForString:", v23);
            [v16 addObject:v24];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v19);
      }

      v12 = (void *)[v16 copy];
      id v8 = v37;
      goto LABEL_45;
    }
    id v34 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_44;
  }
  if ([v9 isEqualToString:@"uniqueIdentifier"])
  {
    v25 = [v8 uniqueIdentifier];

    if (v25)
    {
      uint64_t v15 = [v8 uniqueIdentifier];
      v26 = HAPInstanceIDFromUniqueIdentifier();
      v27 = HAPServerIDFromUniqueIdentifier();
      v12 = HAPUniqueIdentifier();

LABEL_45:
      goto LABEL_46;
    }
  }
  if ([v9 isEqualToString:@"chipNodeID"])
  {
    uint64_t v28 = [v8 matterNodeID];
LABEL_41:
    uint64_t v15 = (void *)v28;
    v35 = (void *)*MEMORY[0x263EFFD08];
    if (v28) {
      v35 = (void *)v28;
    }
    id v34 = v35;
LABEL_44:
    v12 = v34;
    goto LABEL_45;
  }
  if ([v9 isEqualToString:@"chipVendorID"])
  {
    uint64_t v28 = [v8 matterVendorID];
    goto LABEL_41;
  }
  if ([v9 isEqualToString:@"chipProductID"])
  {
    uint64_t v28 = [v8 matterProductID];
    goto LABEL_41;
  }
  if ([v9 isEqualToString:@"chipPairingsData"])
  {
    id v11 = [v8 matterPairings];
    if (v11)
    {
      id v39 = 0;
      v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v39];
      id v13 = v39;
      if (v12) {
        goto LABEL_4;
      }
      objc_super v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = self;
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        long long v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v32;
        __int16 v48 = 2112;
        id v49 = v13;
        __int16 v33 = "%{public}@Failed to encode matter pairings: %@";
        goto LABEL_22;
      }
LABEL_23:

      goto LABEL_24;
    }
LABEL_35:
    v12 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_36;
  }
  if ([v9 isEqualToString:@"chipWEDSupport"])
  {
    uint64_t v28 = [v8 matterWEDSupport];
    goto LABEL_41;
  }
  if ([v9 isEqualToString:@"chipExtendedMACAddress"])
  {
    uint64_t v28 = [v8 matterExtendedMACAddress];
    goto LABEL_41;
  }
  v38.receiver = self;
  v38.super_class = (Class)HMDHAPAccessoryTransaction;
  v12 = [(HMDAccessoryTransaction *)&v38 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
LABEL_46:

  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

+ (id)cd_getMKFHAPAccessoryFromAccessoryUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
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
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFHAPAccessory for HAP accessory with UUID %@: %@", buf, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)cd_getMKFHAPAccessoryFromAccessory:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
  if (v5)
  {
    id v6 = objc_msgSend(a1, "cd_getMKFHAPAccessoryFromAccessoryUUID:", v5);
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    BOOL v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid accessory UUID string '%@'", (uint8_t *)&v12, 0x16u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)cd_getMKFServiceFromAccessoryUUID:(id)a3 serviceInstanceId:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_20:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_20;
  }
  BOOL v9 = objc_msgSend(a1, "cd_getMKFHAPAccessoryFromAccessory:", v6);
  id v10 = v9;
  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = objc_msgSend(v9, "services", 0);
    id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v16 = [v15 instanceID];
          int v17 = HAPEqualInstanceIDs();

          if (v17)
          {
            id v12 = v15;
            goto LABEL_14;
          }
        }
        id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end