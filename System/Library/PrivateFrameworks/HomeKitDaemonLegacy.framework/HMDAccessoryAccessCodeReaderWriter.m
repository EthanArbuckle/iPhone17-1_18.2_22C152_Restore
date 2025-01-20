@interface HMDAccessoryAccessCodeReaderWriter
+ (id)_accessCodeControlFromWriteResponses:(id)a3 forWriteRequest:(id)a4;
+ (id)_createListWriteRequestsForCharacteristics:(id)a3;
+ (id)_createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic:(id)a3;
+ (id)accessCodeFetchResponsesForReadWriteResponses:(id)a3 ofWriteRequests:(id)a4;
+ (id)createConstraintsFromReadResponses:(id)a3 readRequests:(id)a4;
+ (id)createModificationResponsesForWriteResponses:(id)a3 ofRequestPairs:(id)a4;
+ (id)createWriteRequestForAddRequests:(id)a3 characteristic:(id)a4;
+ (id)createWriteRequestForRemoveRequests:(id)a3 characteristic:(id)a4;
+ (id)createWriteRequestForUpdateRequests:(id)a3 characteristic:(id)a4;
+ (id)createWriteRequestsForModificationRequests:(id)a3 hapAccessories:(id)a4;
+ (id)genericModificationResponseForFailedRequest:(id)a3;
+ (id)identifiersFromListWriteResponses:(id)a3 ofWriteRequests:(id)a4;
+ (id)logCategory;
+ (id)modificationResponseForControlResponse:(id)a3 operationType:(int64_t)a4 accessoryUUID:(id)a5;
+ (id)modificationResponseForFailedMatterRequest:(id)a3 error:(id)a4;
+ (int64_t)hmPrivateErrorCodeForHAPAccessCodeError:(int64_t)a3;
- (HMDAccessCodeManagerContext)context;
- (HMDAccessoryAccessCodeReaderWriter)initWithContext:(id)a3;
- (id)_characteristicsOfType:(id)a3 fromAccessoriesWithUUIDs:(id)a4;
- (id)_createConstraintsReadRequestsForAccessoriesWithUUIDs:(id)a3;
- (id)_createListWriteRequestsForAccessoriesWithUUIDS:(id)a3;
- (id)_createModificationResponsesForWriteResponses:(id)a3 ofRequestPairs:(id)a4;
- (id)_createReadWriteRequestsForAccessCodeIdentifiers:(id)a3;
- (id)_createWriteRequestsForModificationRequests:(id)a3;
- (id)_fetchResponseFromCredentialUserTuples:(id)a3 accessory:(id)a4 doorLock:(id)a5;
- (id)_performReadRequests:(id)a3 withRetries:(BOOL)a4;
- (id)_performWriteRequests:(id)a3 withRetries:(BOOL)a4;
- (id)_readAccessCodeWithIdentifier:(id)a3 accessoryUUID:(id)a4;
- (id)_readAccessCodesFromAccessoriesWithUUIDs:(id)a3 withRetries:(BOOL)a4;
- (id)_readAccessCodesFromAccessoriesWithUUIDs_HAP:(id)a3 withRetries:(BOOL)a4;
- (id)_readAccessCodesFromAccessoriesWithUUIDs_Matter:(id)a3 withRetries:(BOOL)a4;
- (id)_readAccessCodesFromAccessory_Matter:(id)a3 withRetries:(BOOL)a4;
- (id)_readConstraintsFromAccessoriesWithUUIDs:(id)a3 withRetries:(BOOL)a4;
- (id)_readConstraintsFromAccessoriesWithUUIDs_HAP:(id)a3 withRetries:(BOOL)a4;
- (id)_readConstraintsFromAccessoriesWithUUIDs_Matter:(id)a3 withRetries:(BOOL)a4;
- (id)_readConstraintsFromAccessory_Matter:(id)a3 withRetries:(BOOL)a4;
- (id)logIdentifier;
- (id)performAccessCodeModificationRequests:(id)a3 withRetries:(BOOL)a4;
- (id)performAccessCodeModificationRequests_HAP:(id)a3 withRetries:(BOOL)a4;
- (id)performAccessCodeModificationRequests_Matter:(id)a3 withRetries:(BOOL)a4;
- (id)performModificationRequest_Matter:(id)a3;
- (id)readAccessCodesFromAccessoriesWithUUIDs:(id)a3;
- (id)readConstraintsFromAccessoriesWithUUIDs:(id)a3;
- (id)removeAccessCodeWithValue_Matter:(id)a3 fromAccessory:(id)a4 withUserUUID:(id)a5 guestName:(id)a6;
- (id)removeAllAccessCodesWithValue:(id)a3 withUserUUID:(id)a4 guestName:(id)a5;
- (id)removeAllAccessCodesWithValue_Matter:(id)a3 withUserUUID:(id)a4 guestName:(id)a5;
- (id)removeAllHAPAccessCodesWithValue:(id)a3 forSpecificAccessory:(id)a4;
- (void)_readConstraintsAndAccessCodesFromAccessoriesWithUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HMDAccessoryAccessCodeReaderWriter

- (void).cxx_destruct
{
}

- (HMDAccessCodeManagerContext)context
{
  return (HMDAccessCodeManagerContext *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  v3 = [v2 UUID];
  v4 = [v3 UUIDString];

  return v4;
}

- (id)_createModificationResponsesForWriteResponses:(id)a3 ofRequestPairs:(id)a4
{
  return +[HMDAccessoryAccessCodeReaderWriter createModificationResponsesForWriteResponses:a3 ofRequestPairs:a4];
}

- (id)_createWriteRequestsForModificationRequests:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  v6 = [v5 accessoriesSupportingAccessCodes];
  v7 = +[HMDAccessoryAccessCodeReaderWriter createWriteRequestsForModificationRequests:v4 hapAccessories:v6];

  return v7;
}

- (id)_createReadWriteRequestsForAccessCodeIdentifiers:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28 = [MEMORY[0x1E4F28E10] mapTableWithStrongToStrongObjects];
  v29 = v4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v30 = *(void *)v33;
    *(void *)&long long v6 = 138543618;
    long long v26 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v10 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
        v11 = [v10 accessoriesSupportingAccessCodes];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __87__HMDAccessoryAccessCodeReaderWriter__createReadWriteRequestsForAccessCodeIdentifiers___block_invoke;
        v31[3] = &unk_1E6A14470;
        v31[4] = v9;
        v12 = objc_msgSend(v11, "na_firstObjectPassingTest:", v31);

        if (!v12)
        {
          v21 = (void *)MEMORY[0x1D9452090]();
          v22 = self;
          v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v26;
            v37 = v24;
            __int16 v38 = 2112;
            v39 = v9;
            _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not create read write requests because failed to find hap accessory with UUID: %@", buf, 0x16u);
          }
LABEL_19:

          v20 = 0;
          v19 = v28;
          goto LABEL_20;
        }
        v13 = [v12 findCharacteristicType:@"00000262-0000-1000-8000-0026BB765291" forServiceType:@"00000260-0000-1000-8000-0026BB765291"];
        if (v13)
        {
          v14 = [v29 objectForKeyedSubscript:v9];
          [v28 setObject:v14 forKey:v13];
        }
        else
        {
          v15 = (void *)MEMORY[0x1D9452090]();
          v16 = self;
          v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v26;
            v37 = v18;
            __int16 v38 = 2112;
            v39 = v12;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not create read write requests because failed to find access code control point characteristic on accessory: %@", buf, 0x16u);
          }
        }

        if (!v13) {
          goto LABEL_19;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v19 = v28;
  v20 = +[HMDAccessoryAccessCodeReaderWriter _createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic:v28];
LABEL_20:

  return v20;
}

uint64_t __87__HMDAccessoryAccessCodeReaderWriter__createReadWriteRequestsForAccessCodeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)_characteristicsOfType:(id)a3 fromAccessoriesWithUUIDs:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  v9 = [v8 accessoriesSupportingAccessCodes];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke;
  v31[3] = &unk_1E6A14470;
  id v10 = v7;
  id v32 = v10;
  v11 = objc_msgSend(v9, "na_filter:", v31);

  uint64_t v12 = [v11 count];
  if (v12 == [v10 count])
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke_122;
    v29 = &unk_1E6A05BB0;
    id v13 = v6;
    id v30 = v13;
    v14 = objc_msgSend(v11, "na_map:", &v26);
    uint64_t v15 = objc_msgSend(v14, "count", v26, v27, v28, v29);
    if (v15 == [v11 count])
    {
      id v16 = v14;
    }
    else
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        long long v34 = v24;
        __int16 v35 = 2112;
        id v36 = v13;
        __int16 v37 = 2112;
        __int16 v38 = v11;
        __int16 v39 = 2112;
        v40 = v14;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find access code control point characteristics of type: %@ for all accessories: %@. Found characteristics: %@", buf, 0x2Au);
      }
      id v16 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v34 = v20;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      __int16 v38 = v11;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find all accessories with UUIDs: %@. Only found the subset of accessories: %@", buf, 0x20u);
    }
    id v16 = 0;
  }

  return v16;
}

uint64_t __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uuid];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __86__HMDAccessoryAccessCodeReaderWriter__characteristicsOfType_fromAccessoriesWithUUIDs___block_invoke_122(uint64_t a1, void *a2)
{
  return [a2 findCharacteristicType:*(void *)(a1 + 32) forServiceType:@"00000260-0000-1000-8000-0026BB765291"];
}

- (id)_createListWriteRequestsForAccessoriesWithUUIDS:(id)a3
{
  v3 = [(HMDAccessoryAccessCodeReaderWriter *)self _characteristicsOfType:@"00000262-0000-1000-8000-0026BB765291" fromAccessoriesWithUUIDs:a3];
  if (v3)
  {
    uint64_t v4 = +[HMDAccessoryAccessCodeReaderWriter _createListWriteRequestsForCharacteristics:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_createConstraintsReadRequestsForAccessoriesWithUUIDs:(id)a3
{
  v3 = [(HMDAccessoryAccessCodeReaderWriter *)self _characteristicsOfType:@"00000261-0000-1000-8000-0026BB765291" fromAccessoriesWithUUIDs:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_119);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

HMDCharacteristicRequest *__92__HMDAccessoryAccessCodeReaderWriter__createConstraintsReadRequestsForAccessoriesWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDCharacteristicRequest requestWithCharacteristic:a2];
}

- (id)_fetchResponseFromCredentialUserTuples:(id)a3 accessory:(id)a4 doorLock:(id)a5
{
  id v7 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __96__HMDAccessoryAccessCodeReaderWriter__fetchResponseFromCredentialUserTuples_accessory_doorLock___block_invoke;
  v17 = &unk_1E6A05B68;
  v18 = self;
  id v19 = v7;
  id v8 = v7;
  v9 = objc_msgSend(a3, "na_map:", &v14);
  id v10 = objc_alloc(MEMORY[0x1E4F2E508]);
  v11 = objc_msgSend(v8, "uuid", v14, v15, v16, v17, v18);
  uint64_t v12 = (void *)[v10 initWithAccessoryUUID:v11 accessoryAccessCodeValues:v9 error:0];

  return v12;
}

id __96__HMDAccessoryAccessCodeReaderWriter__fetchResponseFromCredentialUserTuples_accessory_doorLock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [v3 credential];
    v9 = [v3 user];
    *(_DWORD *)buf = 138543874;
    v49 = v7;
    __int16 v50 = 2112;
    v51 = v8;
    __int16 v52 = 2112;
    v53 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating fetch response from credential: %@, user: %@", buf, 0x20u);
  }
  id v10 = [v3 user];
  v11 = [v10 userUniqueId];

  uint64_t v12 = [v3 user];
  id v13 = [v12 creatorFabricIndex];
  uint64_t v14 = [v3 currentFabricIndex];
  char v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    uint64_t v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      [v3 credential];
      id v30 = v46 = v11;
      v31 = [v3 user];
      id v32 = [v31 creatorFabricIndex];
      [v3 currentFabricIndex];
      long long v33 = v47 = v26;
      long long v34 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138544386;
      v49 = v29;
      __int16 v50 = 2112;
      v51 = v30;
      __int16 v52 = 2112;
      v53 = v32;
      __int16 v54 = 2112;
      v55 = v33;
      __int16 v56 = 2112;
      v57 = v34;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Dropping userUniqueId because the user's creatorFabricIndex does not match the currentFabricIndex. credential: %@, creatorFabricIndex: %@, currentFabricIndex: %@, accessory: %@", buf, 0x34u);

      uint64_t v26 = v47;
      v11 = v46;
    }

    v11 = 0;
    goto LABEL_11;
  }
  id v16 = [v3 user];
  v17 = [v16 userUniqueID];
  int v18 = [v17 isEqualToNumber:*MEMORY[0x1E4F6A0B0]];

  if (!v18)
  {
LABEL_11:
    __int16 v35 = [*(id *)(a1 + 32) context];
    id v36 = [v35 home];
    __int16 v37 = [v36 accessCodeForMatterUserWithUserUniqueID:v11];

    __int16 v38 = (void *)[objc_alloc(MEMORY[0x1E4F2E4F0]) initWithStringValue:v37];
    id v39 = objc_alloc(MEMORY[0x1E4F2E510]);
    v40 = [*(id *)(a1 + 40) uuid];
    uint64_t v41 = NSNumber;
    v42 = [v3 credential];
    v43 = [v42 userIndex];
    v44 = objc_msgSend(v41, "numberWithInteger:", objc_msgSend(v43, "integerValue"));
    v25 = (void *)[v39 initWithAccessoryUUID:v40 accessCodeValue:v38 uniqueIdentifier:v44 hasRestrictions:0];

    goto LABEL_12;
  }
  id v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = *(id *)(a1 + 32);
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    v23 = [v3 credential];
    v24 = [*(id *)(a1 + 40) shortDescription];
    *(_DWORD *)buf = 138543874;
    v49 = v22;
    __int16 v50 = 2112;
    v51 = v23;
    __int16 v52 = 2112;
    v53 = v24;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Dropping credential because it is the COTA home user: %@, accessory: %@", buf, 0x20u);
  }
  v25 = 0;
LABEL_12:

  return v25;
}

- (id)_readAccessCodesFromAccessory_Matter:(id)a3 withRetries:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Reading access codes from Matter accessory: %@", buf, 0x16u);
  }
  id v10 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
  v11 = [v5 waitForDoorLockClusterObjectWithFlow:v10];
  uint64_t v12 = [v11 naFuture];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke;
  v20[3] = &unk_1E6A141C0;
  v20[4] = v7;
  id v13 = v5;
  id v21 = v13;
  uint64_t v14 = [v12 flatMap:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_3;
  v18[3] = &unk_1E6A05A78;
  v18[4] = v7;
  id v19 = v13;
  id v15 = v13;
  id v16 = [v14 recover:v18];

  return v16;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getAllPinCodes];
  id v5 = [v4 naFuture];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_2;
  v10[3] = &unk_1E6A05B40;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v3;
  id v7 = v3;
  id v8 = [v5 flatMap:v10];

  return v8;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) uuid];
    int v15 = 138543874;
    id v16 = v7;
    __int16 v17 = 2112;
    int v18 = v8;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to read access codes from Matter accessory: %@, with error: %@", (uint8_t *)&v15, 0x20u);
  }
  id v9 = objc_alloc(MEMORY[0x1E4F2E508]);
  id v10 = [*(id *)(a1 + 40) uuid];
  id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  id v12 = (void *)[v9 initWithAccessoryUUID:v10 accessoryAccessCodeValues:0 error:v11];

  id v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v12];

  return v13;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessory_Matter_withRetries___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _fetchResponseFromCredentialUserTuples:a2 accessory:*(void *)(a1 + 40) doorLock:*(void *)(a1 + 48)];
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v3;
}

- (id)_readAccessCodesFromAccessoriesWithUUIDs_Matter:(id)a3 withRetries:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", MEMORY[0x1E4F1CBF0], a4);
}

- (id)_readAccessCodesFromAccessoriesWithUUIDs_HAP:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading access codes from HAP accessories with UUIDs: %@", buf, 0x16u);
    }
    id v12 = [(HMDAccessoryAccessCodeReaderWriter *)v9 _createListWriteRequestsForAccessoriesWithUUIDS:v6];
    if (v12)
    {
      id v13 = [(HMDAccessoryAccessCodeReaderWriter *)v9 _performWriteRequests:v12 withRetries:v4];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke;
      v22[3] = &unk_1E6A05A00;
      v22[4] = v9;
      id v23 = v12;
      uint64_t v14 = [v13 flatMap:v22];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_102;
      v21[3] = &unk_1E6A05990;
      v21[4] = v9;
      int v15 = [v14 flatMap:v21];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2;
      v18[3] = &unk_1E6A05B18;
      v18[4] = v9;
      BOOL v20 = v4;
      id v19 = v6;
      id v7 = [v15 flatMap:v18];
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F7A0D8];
      id v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Failed to create list write requests"];
      id v7 = [v16 futureWithError:v13];
    }
  }
  return v7;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Got list responses", (uint8_t *)&v11, 0xCu);
  }
  id v8 = +[HMDAccessoryAccessCodeReaderWriter identifiersFromListWriteResponses:v3 ofWriteRequests:*(void *)(a1 + 40)];
  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];

  return v9;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_102(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _createReadWriteRequestsForAccessCodeIdentifiers:a2];
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  if (v2)
  {
    BOOL v4 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Failed to create read write requests"];
    BOOL v4 = [v3 futureWithError:v5];
  }
  return v4;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) _performWriteRequests:v3 withRetries:*(unsigned __int8 *)(a1 + 48)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_3;
  v10[3] = &unk_1E6A05AF0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v13 = v6;
  id v7 = v3;
  id v8 = [v4 flatMap:v10];

  return v8;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[HMDAccessoryAccessCodeReaderWriter accessCodeFetchResponsesForReadWriteResponses:v3 ofWriteRequests:*(void *)(a1 + 32)];
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    BOOL v20 = v8;
    __int16 v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Access code fetch responses from read: %@", buf, 0x16u);
  }
  id v9 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_103;
  v17[3] = &unk_1E6A196B8;
  id v18 = v4;
  id v10 = v4;
  id v11 = objc_msgSend(v9, "na_filter:", v17);
  uint64_t v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_109);
  id v13 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v14 = [v10 arrayByAddingObjectsFromArray:v12];
  int v15 = [v13 futureWithResult:v14];

  return v15;
}

BOOL __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_103(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2_104;
  v9[3] = &unk_1E6A05AC8;
  id v10 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v9);
  BOOL v7 = v6 == 0;

  return v7;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_3_106(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2E508];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  id v6 = (void *)[v4 initWithAccessoryUUID:v3 accessoryAccessCodeValues:0 error:v5];

  return v6;
}

uint64_t __95__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke_2_104(uint64_t a1, void *a2)
{
  v2 = [a2 accessoryUUID];
  uint64_t v3 = HMFEqualObjects();

  return v3;
}

- (id)_readAccessCodesFromAccessoriesWithUUIDs:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading access codes from accessories with UUIDs: %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v8;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);
    }
    int v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke;
    v24[3] = &unk_1E6A196B8;
    v24[4] = v8;
    id v16 = objc_msgSend(v6, "na_filter:", v24);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke_2;
    v23[3] = &unk_1E6A196B8;
    v23[4] = v8;
    __int16 v17 = objc_msgSend(v6, "na_filter:", v23);
    id v18 = [(HMDAccessoryAccessCodeReaderWriter *)v8 _readAccessCodesFromAccessoriesWithUUIDs_HAP:v16 withRetries:v4];
    id v19 = [(HMDAccessoryAccessCodeReaderWriter *)v8 _readAccessCodesFromAccessoriesWithUUIDs_Matter:v17 withRetries:v4];
    BOOL v20 = (void *)MEMORY[0x1E4F7A0D8];
    v25[0] = v18;
    v25[1] = v19;
    __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    int v15 = [v20 combineAllFuturesFlatteningArrayResults:v21];
  }
  return v15;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 context];
  id v5 = [v4 UUIDsOfHAPAccessoriesSupportingAccessCodes];
  uint64_t v6 = [v5 containsObject:v3];

  return v6;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readAccessCodesFromAccessoriesWithUUIDs_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 context];
  id v5 = [v4 UUIDsOfMatterAccessoriesSupportingAccessCodes];
  uint64_t v6 = [v5 containsObject:v3];

  return v6;
}

- (id)_readConstraintsFromAccessory_Matter:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading constraints from accessory: %@", buf, 0x16u);
  }
  if (v4) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F7A0D8];
  id v13 = [(HMDAccessoryAccessCodeReaderWriter *)v8 context];
  uint64_t v14 = [v13 workQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke;
  v22[3] = &unk_1E6A05AA0;
  id v15 = v6;
  id v23 = v15;
  __int16 v24 = v8;
  id v16 = [v12 futureWithRetries:v11 timeInterval:v14 workQueue:v22 block:5.0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_98;
  v20[3] = &unk_1E6A05A78;
  v20[4] = v8;
  id v21 = v15;
  id v17 = v15;
  id v18 = [v16 recover:v20];

  return v18;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  id v3 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
  BOOL v4 = [v2 waitForDoorLockClusterObjectWithFlow:v3];
  id v5 = [v4 naFuture];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_2;
  v10[3] = &unk_1E6A141C0;
  int8x16_t v9 = a1[2];
  id v6 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  BOOL v7 = [v5 flatMap:v10];

  return v7;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) uuid];
    int v15 = 138543618;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@All retries failed to read constraint from accessory: %@", (uint8_t *)&v15, 0x16u);
  }
  int8x16_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F2E4C0]) initWithAllowedCharacterSets:1 minimumLength:4 maximumLength:8 maximumAllowedAccessCodes:50];
  id v10 = objc_alloc(MEMORY[0x1E4F2E500]);
  int8x16_t v11 = [*(id *)(a1 + 40) uuid];
  uint64_t v12 = (void *)[v10 initWithAccessory:v11 constraints:v9 error:0];

  id v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v12];

  return v13;
}

id __87__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessory_Matter_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 readAttributeMaxPINCodeLengthWithParams:0];
  id v5 = [v4 objectForKey:@"value"];
  if (v5)
  {
    id v6 = [v3 readAttributeMinPINCodeLengthWithParams:0];

    BOOL v7 = [v6 objectForKey:@"value"];
    if (v7)
    {
      id v8 = v7;
      int8x16_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E4C0]), "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", 1, objc_msgSend(v7, "integerValue"), objc_msgSend(v5, "integerValue"), 50);
      id v10 = objc_alloc(MEMORY[0x1E4F2E500]);
      int8x16_t v11 = [*(id *)(a1 + 40) uuid];
      uint64_t v12 = (void *)[v10 initWithAccessory:v11 constraints:v9 error:0];

      id v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v12];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = *(id *)(a1 + 32);
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        int v26 = 138543362;
        __int16 v27 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Failed to read min pin code length constraint from accessory", (uint8_t *)&v26, 0xCu);
      }
      id v23 = (void *)MEMORY[0x1E4F7A0D8];
      __int16 v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      id v13 = [v23 futureWithError:v24];

      id v8 = 0;
    }
    BOOL v4 = v6;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v26 = 138543362;
      __int16 v27 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to read max pin code length constraint from accessory", (uint8_t *)&v26, 0xCu);
    }
    id v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    id v13 = [v18 futureWithError:v8];
  }

  return v13;
}

- (id)_readConstraintsFromAccessoriesWithUUIDs_Matter:(id)a3 withRetries:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", MEMORY[0x1E4F1CBF0], a4);
}

- (id)_readConstraintsFromAccessoriesWithUUIDs_HAP:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int8x16_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading constraints from HAP accessories with UUIDs: %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    int8x16_t v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v8;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v16 = [(HMDAccessoryAccessCodeReaderWriter *)v8 _createConstraintsReadRequestsForAccessoriesWithUUIDs:v6];
    if (v16)
    {
      __int16 v17 = [(HMDAccessoryAccessCodeReaderWriter *)v8 _performReadRequests:v16 withRetries:v4];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __95__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke;
      v20[3] = &unk_1E6A05990;
      id v21 = v16;
      id v15 = [v17 flatMap:v20];
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F7A0D8];
      __int16 v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Failed to create constraints read requests"];
      id v15 = [v18 futureWithError:v17];
    }
  }
  return v15;
}

id __95__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_HAP_withRetries___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[HMDAccessoryAccessCodeReaderWriter createConstraintsFromReadResponses:a2 readRequests:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v3;
}

- (id)_readConstraintsFromAccessoriesWithUUIDs:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int8x16_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v27 = v10;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Reading constraints from accessories with UUIDs: %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    int8x16_t v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v8;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke;
    v24[3] = &unk_1E6A196B8;
    v24[4] = v8;
    id v16 = objc_msgSend(v6, "na_filter:", v24);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke_2;
    v23[3] = &unk_1E6A196B8;
    v23[4] = v8;
    __int16 v17 = objc_msgSend(v6, "na_filter:", v23);
    id v18 = [(HMDAccessoryAccessCodeReaderWriter *)v8 _readConstraintsFromAccessoriesWithUUIDs_HAP:v16 withRetries:v4];
    uint64_t v19 = [(HMDAccessoryAccessCodeReaderWriter *)v8 _readConstraintsFromAccessoriesWithUUIDs_Matter:v17 withRetries:v4];
    id v20 = (void *)MEMORY[0x1E4F7A0D8];
    v25[0] = v18;
    v25[1] = v19;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    id v15 = [v20 combineAllFuturesFlatteningArrayResults:v21];
  }
  return v15;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 context];
  id v5 = [v4 UUIDsOfHAPAccessoriesSupportingAccessCodes];
  uint64_t v6 = [v5 containsObject:v3];

  return v6;
}

uint64_t __91__HMDAccessoryAccessCodeReaderWriter__readConstraintsFromAccessoriesWithUUIDs_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 context];
  id v5 = [v4 UUIDsOfMatterAccessoriesSupportingAccessCodes];
  uint64_t v6 = [v5 containsObject:v3];

  return v6;
}

- (id)performModificationRequest_Matter:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int8x16_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v80 = v10;
    __int16 v81 = 2112;
    id v82 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Performing access code modification request Matter: %@", buf, 0x16u);
  }
  int8x16_t v11 = [(HMDAccessoryAccessCodeReaderWriter *)v8 context];
  uint64_t v12 = [v4 accessoryUUID];
  id v13 = [v11 hapAccessoryWithUUID:v12];

  id v14 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  unint64_t v16 = v15;

  id v17 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  unint64_t v19 = v18;

  id v20 = v17;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  v62 = v22;
  unint64_t v63 = v19;
  if (v22)
  {
    id v23 = (void *)MEMORY[0x1E4F7A0D8];
    __int16 v24 = [v22 accessoryAccessCodeValue];
    id v25 = [v24 uniqueIdentifier];
    uint64_t v26 = [v23 futureWithResult:v25];

    BOOL v27 = v16 != 0;
    if (v16 | v19)
    {
      v60 = v13;
LABEL_16:
      uint64_t v34 = !v27;
      __int16 v35 = objc_msgSend((id)v16, "accessCodeValue", v60, v22);
      id v36 = [v35 stringValue];
      __int16 v37 = v36;
      __int16 v38 = byte_1D54D2FA0 + 96;
      if (v36)
      {
        id v39 = v36;
      }
      else
      {
        v51 = [(id)v19 updatedAccessCodeValue];
        id v39 = [v51 stringValue];

        __int16 v38 = &byte_1D54D2FA0[96];
      }

      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = *((void *)v38 + 160);
      v76[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke;
      v76[3] = &unk_1E6A05918;
      v44 = v61;
      id v77 = v61;
      id v42 = v39;
      id v78 = v42;
      v43 = [v26 flatMap:v76];

      v45 = v77;
      goto LABEL_24;
    }
    v40 = [v22 accessoryAccessCodeValue];
    uint64_t v41 = [v40 accessCodeValue];
    id v42 = [v41 stringValue];

    v74[0] = MEMORY[0x1E4F143A8];
    __int16 v38 = &byte_1D54D2FA0[96];
    v74[1] = 3221225472;
    v74[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3;
    v74[3] = &unk_1E6A058F0;
    id v75 = v13;
    v43 = [v26 flatMap:v74];
    uint64_t v34 = 2;
    v44 = v13;
    v45 = v75;
  }
  else
  {
    __int16 v28 = [(HMDAccessoryAccessCodeReaderWriter *)v8 context];
    id v29 = [v28 home];
    [v20 userUUID];
    v31 = uint64_t v30 = v13;
    id v32 = [v20 guestName];
    long long v33 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
    v60 = v30;
    uint64_t v26 = [v29 findOrAddUserIndexForUserUUID:v31 guestName:v32 accessory:v30 flow:v33];

    unint64_t v19 = v63;
    BOOL v27 = v16 != 0;
    if (v16 | v63) {
      goto LABEL_16;
    }
    v46 = (void *)MEMORY[0x1D9452090]();
    v47 = v8;
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v80 = v49;
      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Found HMAccessCodeModificationRequestValue of unknown type", buf, 0xCu);
    }
    __int16 v50 = (void *)MEMORY[0x1E4F7A0D8];
    v45 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    v43 = [v50 futureWithError:v45];
    id v42 = 0;
    uint64_t v34 = 0;
    v44 = v60;
    __int16 v38 = byte_1D54D2FA0 + 96;
  }
LABEL_24:

  uint64_t v66 = MEMORY[0x1E4F143A8];
  uint64_t v67 = *((void *)v38 + 160);
  uint64_t v52 = v67;
  v68 = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_83;
  v69 = &unk_1E6A05A50;
  id v70 = v26;
  id v71 = v42;
  id v53 = v20;
  id v72 = v53;
  uint64_t v73 = v34;
  id v54 = v42;
  id v55 = v26;
  __int16 v56 = [v43 flatMap:&v66];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = v52;
  v64[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3_87;
  v64[3] = &unk_1E6A05A78;
  v64[4] = v8;
  id v65 = v53;
  id v57 = v53;
  uint64_t v58 = [v56 recover:v64];

  return v58;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
  uint64_t v6 = [v4 waitForDoorLockClusterObjectWithFlow:v5];
  BOOL v7 = [v6 naFuture];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2;
  v11[3] = &unk_1E6A141C0;
  id v12 = *(id *)(a1 + 40);
  id v13 = v3;
  id v8 = v3;
  int8x16_t v9 = [v7 flatMap:v11];

  return v9;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
  uint64_t v6 = [v4 waitForDoorLockClusterObjectWithFlow:v5];
  BOOL v7 = [v6 naFuture];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_4;
  v11[3] = &unk_1E6A17EA8;
  id v12 = v3;
  id v8 = v3;
  int8x16_t v9 = [v7 flatMap:v11];

  return v9;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_83(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2_84;
  v7[3] = &unk_1E6A05A28;
  v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v9 = v3;
  uint64_t v10 = v4;
  id v5 = [v2 flatMap:v7];

  return v5;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_3_87(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = a2;
  id v5 = [(id)objc_opt_class() modificationResponseForFailedMatterRequest:*(void *)(a1 + 40) error:v4];

  uint64_t v6 = [v3 futureWithResult:v5];

  return v6;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F2E4F0];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithStringValue:*(void *)(a1 + 32)];
  id v6 = objc_alloc(MEMORY[0x1E4F2E510]);
  BOOL v7 = [*(id *)(a1 + 40) accessoryUUID];
  id v8 = (void *)[v6 initWithAccessoryUUID:v7 accessCodeValue:v5 uniqueIdentifier:v4 hasRestrictions:0];

  id v9 = objc_alloc(MEMORY[0x1E4F2E4D0]);
  uint64_t v10 = [*(id *)(a1 + 40) accessoryUUID];
  int8x16_t v11 = (void *)[v9 initWithAccessoryUUID:v10 accessoryAccessCodeValue:v8 accessCodeValue:0 operationType:*(void *)(a1 + 48) error:0];

  id v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v11];

  return v12;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = objc_msgSend(v3, "removePinCodeForUserIndex:", objc_msgSend(v2, "integerValue"));

  id v5 = [v4 naFuture];

  return v5;
}

id __72__HMDAccessoryAccessCodeReaderWriter_performModificationRequest_Matter___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = objc_msgSend(v4, "addOrUpdatePinCodeWithValue:forUserIndex:", v2, objc_msgSend(v3, "integerValue"));

  id v6 = [v5 naFuture];

  return v6;
}

- (id)performAccessCodeModificationRequests_Matter:(id)a3 withRetries:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", MEMORY[0x1E4F1CBF0], a4);
}

- (id)performAccessCodeModificationRequests_HAP:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  id v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  int8x16_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Performing access code modification requests HAP: %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v14 = [(HMDAccessoryAccessCodeReaderWriter *)v10 _createWriteRequestsForModificationRequests:v6];
    id v15 = objc_msgSend(v14, "na_map:", &__block_literal_global_79);
    if (objc_msgSend(v15, "hmf_isEmpty"))
    {
      unint64_t v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = v10;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        unint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Did not find any valid write requests to perform", buf, 0xCu);
      }
      id v20 = (void *)MEMORY[0x1E4F7A0D8];
      id v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
      id v13 = [v20 futureWithError:v21];
    }
    else
    {
      id v21 = [(HMDAccessoryAccessCodeReaderWriter *)v10 _performWriteRequests:v15 withRetries:v4];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __92__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_HAP_withRetries___block_invoke_80;
      v23[3] = &unk_1E6A05A00;
      v23[4] = v10;
      id v24 = v14;
      id v13 = [v21 flatMap:v23];
    }
  }

  return v13;
}

id __92__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_HAP_withRetries___block_invoke_80(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) _createModificationResponsesForWriteResponses:v3 ofRequestPairs:*(void *)(a1 + 40)];
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received modification responses: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

uint64_t __92__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_HAP_withRetries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeRequest];
}

- (id)performAccessCodeModificationRequests:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  id v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Performing access code modification requests: %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    __int16 v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v10;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      unint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty modification requests", buf, 0xCu);
    }
    id v17 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke;
    v26[3] = &unk_1E6A059B8;
    v26[4] = v10;
    id v18 = objc_msgSend(v6, "na_filter:", v26);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke_2;
    v25[3] = &unk_1E6A059B8;
    v25[4] = v10;
    unint64_t v19 = objc_msgSend(v6, "na_filter:", v25);
    id v20 = [(HMDAccessoryAccessCodeReaderWriter *)v10 performAccessCodeModificationRequests_Matter:v18 withRetries:v4];
    id v21 = [(HMDAccessoryAccessCodeReaderWriter *)v10 performAccessCodeModificationRequests_HAP:v19 withRetries:v4];
    id v22 = (void *)MEMORY[0x1E4F7A0D8];
    v27[0] = v20;
    v27[1] = v21;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    id v17 = [v22 combineAllFuturesFlatteningArrayResults:v23];
  }
  return v17;
}

uint64_t __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 context];
  id v5 = [v3 accessoryUUID];

  id v6 = [v4 hapAccessoryWithUUID:v5];

  uint64_t v7 = [v6 supportsCHIP];
  return v7;
}

uint64_t __88__HMDAccessoryAccessCodeReaderWriter_performAccessCodeModificationRequests_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 context];
  id v5 = [v3 accessoryUUID];

  id v6 = [v4 hapAccessoryWithUUID:v5];

  uint64_t v7 = [v6 supportsCHIP] ^ 1;
  return v7;
}

- (id)_performReadRequests:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  id v8 = v7;
  if (v4)
  {
    id v9 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
    uint64_t v10 = [v9 accessoryReadWriteRetries];
    int v11 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
    [v11 accessoryReadWriteRetryTimeInterval];
    id v12 = objc_msgSend(v8, "performReadRequests:withRetries:timeInterval:loggingObject:", v6, v10, self);

    id v6 = v9;
  }
  else
  {
    id v12 = [v7 performReadRequests:v6 withRetries:0 timeInterval:self loggingObject:0.0];
  }

  return v12;
}

- (id)_performWriteRequests:(id)a3 withRetries:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  id v8 = v7;
  if (v4)
  {
    id v9 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
    uint64_t v10 = [v9 accessoryReadWriteRetries];
    int v11 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
    [v11 accessoryReadWriteRetryTimeInterval];
    id v12 = objc_msgSend(v8, "performWriteRequests:withRetries:timeInterval:loggingObject:", v6, v10, self);

    id v6 = v9;
  }
  else
  {
    id v12 = [v7 performWriteRequests:v6 withRetries:0 timeInterval:self loggingObject:0.0];
  }

  return v12;
}

- (void)_readConstraintsAndAccessCodesFromAccessoriesWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading constraints and access codes from accessories with UUIDs: %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    __int16 v13 = v9;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Caller submitted empty array of accessory UUIDs", buf, 0xCu);
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);
  }
  else
  {
    unint64_t v16 = [(HMDAccessoryAccessCodeReaderWriter *)v9 _readConstraintsFromAccessoriesWithUUIDs:v6 withRetries:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke;
    v18[3] = &unk_1E6A13370;
    v18[4] = v9;
    id v19 = v6;
    id v20 = v7;
    id v17 = (id)[v16 addCompletionBlock:v18];
  }
}

void __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      __int16 v27 = v10;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read constraints from accessories with uuids: %@, error: %@", buf, 0x20u);
    }
  }
  id v12 = [*(id *)(a1 + 32) _readAccessCodesFromAccessoriesWithUUIDs:*(void *)(a1 + 40) withRetries:1];
  __int16 v13 = (void *)MEMORY[0x1E4F7A0F0];
  id v14 = [*(id *)(a1 + 32) context];
  uint64_t v15 = [v14 workQueue];
  unint64_t v16 = [v13 schedulerWithDispatchQueue:v15];
  id v17 = [v12 reschedule:v16];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke_74;
  v22[3] = &unk_1E6A17FC0;
  id v18 = *(void **)(a1 + 40);
  void v22[4] = *(void *)(a1 + 32);
  id v23 = v18;
  id v19 = *(id *)(a1 + 48);
  id v24 = v5;
  id v25 = v19;
  id v20 = v5;
  id v21 = (id)[v17 addCompletionBlock:v22];
}

void __104__HMDAccessoryAccessCodeReaderWriter__readConstraintsAndAccessCodesFromAccessoriesWithUUIDs_completion___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543874;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read access codes from accessories with uuids: %@, error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)readConstraintsFromAccessoriesWithUUIDs:(id)a3
{
  return [(HMDAccessoryAccessCodeReaderWriter *)self _readConstraintsFromAccessoriesWithUUIDs:a3 withRetries:1];
}

- (id)_readAccessCodeWithIdentifier:(id)a3 accessoryUUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading access code for identifier: %@ from accessoryUUID: %@", buf, 0x20u);
  }
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:v6];
  id v25 = v12;
  id v26 = v7;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  __int16 v27 = v13;
  __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

  uint64_t v15 = [(HMDAccessoryAccessCodeReaderWriter *)v9 _createReadWriteRequestsForAccessCodeIdentifiers:v14];
  if (v15)
  {
    __int16 v16 = [(HMDAccessoryAccessCodeReaderWriter *)v9 _performWriteRequests:v15 withRetries:1];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke;
    v23[3] = &unk_1E6A05990;
    id v24 = v15;
    id v17 = [v16 flatMap:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_2;
    v21[3] = &unk_1E6A14358;
    id v22 = v6;
    uint64_t v18 = [v17 flatMap:v21];
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F7A0D8];
    __int16 v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Failed to create read write requests"];
    uint64_t v18 = [v19 futureWithError:v16];
  }

  return v18;
}

id __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[HMDAccessoryAccessCodeReaderWriter accessCodeFetchResponsesForReadWriteResponses:a2 ofWriteRequests:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v3;
}

id __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 accessoryAccessCodeValues];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_3;
    v13[3] = &unk_1E6A12720;
    id v14 = *(id *)(a1 + 32);
    id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v13);

    id v7 = (void *)MEMORY[0x1E4F7A0D8];
    id v8 = [v6 accessCodeValue];
    id v9 = [v7 futureWithResult:v8];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15 reason:@"Response without access code value"];
    id v9 = [v10 futureWithError:v11];
  }
  return v9;
}

uint64_t __82__HMDAccessoryAccessCodeReaderWriter__readAccessCodeWithIdentifier_accessoryUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

- (id)removeAccessCodeWithValue_Matter:(id)a3 fromAccessory:(id)a4 withUserUUID:(id)a5 guestName:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  uint64_t v15 = [v14 workQueue];
  dispatch_assert_queue_V2(v15);

  __int16 v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    id v20 = [v11 uuid];
    *(_DWORD *)buf = 138543618;
    v46 = v19;
    __int16 v47 = 2112;
    v48 = v20;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@removeAllAccessCodesWithValue_Matter fromAccessory: %@", buf, 0x16u);
  }
  id v21 = [(HMDAccessoryAccessCodeReaderWriter *)v17 context];
  id v22 = [v21 home];
  id v23 = [v22 findUserIndexForUserUUID:v12 guestName:v13 accessory:v11];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke;
  v43[3] = &unk_1E6A058F0;
  id v24 = v11;
  id v44 = v24;
  id v25 = [v23 flatMap:v43];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_3;
  v39[3] = &unk_1E6A05940;
  id v26 = v23;
  id v40 = v26;
  id v27 = v24;
  id v41 = v27;
  id v28 = v10;
  id v42 = v28;
  uint64_t v29 = [v25 flatMap:v39];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_5;
  v35[3] = &unk_1E6A143A8;
  id v36 = v26;
  id v37 = v27;
  id v38 = v28;
  id v30 = v28;
  id v31 = v27;
  id v32 = v26;
  id v33 = [v29 recover:v35];

  return v33;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
  id v6 = [v4 waitForDoorLockClusterObjectWithFlow:v5];
  id v7 = [v6 naFuture];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_2;
  v11[3] = &unk_1E6A17EA8;
  id v12 = v3;
  id v8 = v3;
  id v9 = [v7 flatMap:v11];

  return v9;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_3(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_4;
  v5[3] = &unk_1E6A05918;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = [v2 flatMap:v5];

  return v3;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  id v5 = v4;
  if (v4 == (void *)*MEMORY[0x1E4F2D140])
  {
    uint64_t v6 = [v3 code];

    if (v6 == 2)
    {
      id v7 = (void *)MEMORY[0x1E4F7A0D8];
      id v8 = [MEMORY[0x1E4F1CA98] null];
      id v9 = [v7 futureWithResult:v8];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_6;
  v12[3] = &unk_1E6A05968;
  id v10 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v3;
  id v9 = [v10 flatMap:v12];

LABEL_6:
  return v9;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F2E510];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) uuid];
  id v7 = (void *)[v5 initWithAccessoryUUID:v6 accessCodeValue:*(void *)(a1 + 40) uniqueIdentifier:v4 hasRestrictions:0];

  id v8 = objc_alloc(MEMORY[0x1E4F2E4D0]);
  id v9 = [*(id *)(a1 + 32) uuid];
  id v10 = (void *)[v8 initWithAccessoryUUID:v9 accessoryAccessCodeValue:v7 accessCodeValue:0 operationType:2 error:*(void *)(a1 + 48)];

  id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];

  return v11;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F2E510];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) uuid];
  id v7 = (void *)[v5 initWithAccessoryUUID:v6 accessCodeValue:*(void *)(a1 + 40) uniqueIdentifier:v4 hasRestrictions:0];

  id v8 = objc_alloc(MEMORY[0x1E4F2E4D0]);
  id v9 = [*(id *)(a1 + 32) uuid];
  id v10 = (void *)[v8 initWithAccessoryUUID:v9 accessoryAccessCodeValue:v7 accessCodeValue:0 operationType:2 error:0];

  id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];

  return v11;
}

id __108__HMDAccessoryAccessCodeReaderWriter_removeAccessCodeWithValue_Matter_fromAccessory_withUserUUID_guestName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = objc_msgSend(v3, "removePinCodeForUserIndex:", objc_msgSend(v2, "integerValue"));

  id v5 = [v4 naFuture];

  return v5;
}

- (id)removeAllAccessCodesWithValue_Matter:(id)a3 withUserUUID:(id)a4 guestName:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", MEMORY[0x1E4F1CBF0], a4, a5);
}

- (id)removeAllHAPAccessCodesWithValue:(id)a3 forSpecificAccessory:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  id v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v30 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@removeAllHAPAccessCodesWithValue", buf, 0xCu);
  }
  if (!v7)
  {
    id v14 = [(HMDAccessoryAccessCodeReaderWriter *)v11 context];
    uint64_t v15 = [v14 UUIDsOfHAPAccessoriesSupportingAccessCodes];
    goto LABEL_11;
  }
  if ([v7 supportsCHIP] & 1) == 0 && (objc_msgSend(v7, "supportsAccessCode"))
  {
    id v14 = [v7 uuid];
    id v28 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
LABEL_11:
    id v21 = (void *)v15;

    id v23 = [(HMDAccessoryAccessCodeReaderWriter *)v11 _readAccessCodesFromAccessoriesWithUUIDs:v21 withRetries:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke;
    v25[3] = &unk_1E6A14810;
    id v26 = v6;
    id v27 = v11;
    id v22 = [v23 flatMap:v25];

    goto LABEL_12;
  }
  __int16 v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = v11;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v30 = v19;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@removeAccessCodeWithValue for HAP was passed a non HAP accessory or does not support access codes: %@", buf, 0x16u);
  }
  id v20 = (void *)MEMORY[0x1E4F7A0D8];
  id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:48 userInfo:0];
  id v22 = [v20 futureWithError:v21];
LABEL_12:

  return v22;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke(uint64_t a1, void *a2)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_2;
  v16[3] = &unk_1E6A05880;
  id v17 = *(id *)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v4, "na_map:", v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_3;
  v14[3] = &unk_1E6A12748;
  id v15 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v4, "na_flatMap:", v14);

  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_3797);
  id v8 = [*(id *)(a1 + 40) performAccessCodeModificationRequests:v7 withRetries:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_6;
  v12[3] = &unk_1E6A14358;
  id v13 = v5;
  id v9 = v5;
  id v10 = [v8 flatMap:v12];

  return v10;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F2E4D0]);
    id v6 = [v3 accessoryUUID];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v3 error];
    id v9 = (void *)[v5 initWithAccessoryUUID:v6 accessoryAccessCodeValue:0 accessCodeValue:v7 operationType:2 error:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryAccessCodeValues];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_4;
  v6[3] = &unk_1E6A058A8;
  id v7 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [a2 arrayByAddingObjectsFromArray:*(void *)(a1 + 32)];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F2E4D8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithAccessoryAccessCodeValue:v3];

  return v4;
}

id __92__HMDAccessoryAccessCodeReaderWriter_removeAllHAPAccessCodesWithValue_forSpecificAccessory___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 accessCodeValue];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)removeAllAccessCodesWithValue:(id)a3 withUserUUID:(id)a4 guestName:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  id v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v25 = v16;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@removeAllAccessCodesWithValue", buf, 0xCu);
  }
  id v17 = [(HMDAccessoryAccessCodeReaderWriter *)v14 removeAllHAPAccessCodesWithValue:v8 forSpecificAccessory:0];
  uint64_t v18 = [(HMDAccessoryAccessCodeReaderWriter *)v14 removeAllAccessCodesWithValue_Matter:v8 withUserUUID:v9 guestName:v10];
  id v19 = (void *)MEMORY[0x1E4F7A0D8];
  v23[0] = v17;
  v23[1] = v18;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v21 = [v19 combineAllFuturesFlatteningArrayResults:v20];

  return v21;
}

- (id)readAccessCodesFromAccessoriesWithUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryAccessCodeReaderWriter *)self context];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDAccessoryAccessCodeReaderWriter *)self _readAccessCodesFromAccessoriesWithUUIDs:v4 withRetries:1];

  return v7;
}

- (HMDAccessoryAccessCodeReaderWriter)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryAccessCodeReaderWriter;
  id v6 = [(HMDAccessoryAccessCodeReaderWriter *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t77 != -1) {
    dispatch_once(&logCategory__hmf_once_t77, &__block_literal_global_177);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v78;
  return v2;
}

uint64_t __49__HMDAccessoryAccessCodeReaderWriter_logCategory__block_invoke()
{
  logCategory__hmf_once_id v78 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)createWriteRequestForRemoveRequests:(id)a3 characteristic:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v8 = 0;
  }
  else
  {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F5BBF0]) initWithValue:5];
    id v10 = objc_msgSend(v6, "na_map:", &__block_literal_global_174);
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F5BBD0]) initWithOperationType:v9 accessCodeControlRequest:v10 accessCodeControlResponse:0];
    id v20 = 0;
    id v12 = [v11 serializeWithError:&v20];
    id v13 = v20;
    if (v12)
    {
      id v8 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v7 value:v12 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = a1;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = id v19 = v14;
        *(_DWORD *)buf = 138544130;
        id v22 = v17;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        __int16 v25 = 2112;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v13;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, for update requests: %@, with error: %@", buf, 0x2Au);

        id v14 = v19;
      }

      id v8 = 0;
    }
  }
  return v8;
}

id __89__HMDAccessoryAccessCodeReaderWriter_createWriteRequestForRemoveRequests_characteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5BE68];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 accessoryAccessCodeValue];

  id v6 = [v5 uniqueIdentifier];
  id v7 = (void *)[v4 initWithValue:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5BBD8]) initWithIdentifier:v7 accessCode:0];
  return v8;
}

+ (id)createWriteRequestForUpdateRequests:(id)a3 characteristic:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v8 = 0;
  }
  else
  {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F5BBF0]) initWithValue:4];
    id v10 = objc_msgSend(v6, "na_map:", &__block_literal_global_171);
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F5BBD0]) initWithOperationType:v9 accessCodeControlRequest:v10 accessCodeControlResponse:0];
    id v20 = 0;
    id v12 = [v11 serializeWithError:&v20];
    id v13 = v20;
    if (v12)
    {
      id v8 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v7 value:v12 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = a1;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = id v19 = v14;
        *(_DWORD *)buf = 138544130;
        id v22 = v17;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        __int16 v25 = 2112;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v13;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, for update requests: %@, with error: %@", buf, 0x2Au);

        id v14 = v19;
      }

      id v8 = 0;
    }
  }
  return v8;
}

id __89__HMDAccessoryAccessCodeReaderWriter_createWriteRequestForUpdateRequests_characteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5BE68];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 accessoryAccessCodeValue];
  id v6 = [v5 uniqueIdentifier];
  id v7 = (void *)[v4 initWithValue:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F5BBD8]);
  objc_super v9 = [v3 updatedAccessCodeValue];

  id v10 = [v9 stringValue];
  id v11 = (void *)[v8 initWithIdentifier:v7 accessCode:v10];

  return v11;
}

+ (id)createWriteRequestForAddRequests:(id)a3 characteristic:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    id v8 = 0;
  }
  else
  {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F5BBF0]) initWithValue:3];
    id v10 = objc_msgSend(v6, "na_map:", &__block_literal_global_168);
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F5BBD0]) initWithOperationType:v9 accessCodeControlRequest:v10 accessCodeControlResponse:0];
    id v20 = 0;
    id v12 = [v11 serializeWithError:&v20];
    id v13 = v20;
    if (v12)
    {
      id v8 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v7 value:v12 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = a1;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = id v19 = v14;
        *(_DWORD *)buf = 138544130;
        id v22 = v17;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        __int16 v25 = 2112;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v13;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, for add requests: %@, with error: %@", buf, 0x2Au);

        id v14 = v19;
      }

      id v8 = 0;
    }
  }
  return v8;
}

id __86__HMDAccessoryAccessCodeReaderWriter_createWriteRequestForAddRequests_characteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5BBD8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 accessCodeValue];

  id v6 = [v5 stringValue];
  id v7 = (void *)[v4 initWithIdentifier:0 accessCode:v6];

  return v7;
}

+ (id)createWriteRequestsForModificationRequests:(id)a3 hapAccessories:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v50 = a4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v63 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v13 = [v12 accessoryUUID];
        id v14 = [v6 objectForKeyedSubscript:v13];

        if (v14)
        {
          id v15 = [v12 accessoryUUID];
          __int16 v16 = [v6 objectForKeyedSubscript:v15];
          [v16 addObject:v12];
        }
        else
        {
          id v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
          __int16 v16 = [v12 accessoryUUID];
          [v6 setObject:v15 forKeyedSubscript:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v9);
  }

  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = [v6 allKeys];
  uint64_t v18 = v50;
  uint64_t v53 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v59;
    *(void *)&long long v19 = 138543618;
    long long v48 = v19;
    __int16 v56 = v17;
    while (2)
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v59 != v52) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke;
        v57[3] = &unk_1E6A14470;
        v57[4] = v21;
        id v22 = objc_msgSend(v18, "na_firstObjectPassingTest:", v57, v48);
        if (!v22)
        {
          v43 = (void *)MEMORY[0x1D9452090]();
          id v44 = a1;
          v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v48;
            uint64_t v67 = v46;
            __int16 v68 = 2112;
            v69 = v21;
            _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@Not submitting modification requests because did not find an accessory with UUID: %@", buf, 0x16u);
          }
LABEL_35:

          id v42 = (void *)MEMORY[0x1E4F1CBF0];
          id v17 = v56;
          goto LABEL_36;
        }
        __int16 v23 = v22;
        uint64_t v24 = [v22 findCharacteristicType:@"00000262-0000-1000-8000-0026BB765291" forServiceType:@"00000260-0000-1000-8000-0026BB765291"];
        if (v24)
        {
          __int16 v25 = [v6 objectForKeyedSubscript:v21];
          uint64_t v26 = objc_msgSend(v25, "na_map:", &__block_literal_global_158);

          uint64_t v27 = +[HMDAccessoryAccessCodeReaderWriter createWriteRequestForAddRequests:v26 characteristic:v24];
          if (v27)
          {
            id v28 = [[HMDAccessCodeWriteRequestModificationRequestPair alloc] initWithWriteRequest:v27 modificationRequests:v26];
            [v56 addObject:v28];
          }
          id v54 = (void *)v27;
          id v55 = (void *)v26;
          uint64_t v29 = [v6 objectForKeyedSubscript:v21];
          id v30 = objc_msgSend(v29, "na_map:", &__block_literal_global_162);

          __int16 v31 = v24;
          id v32 = +[HMDAccessoryAccessCodeReaderWriter createWriteRequestForUpdateRequests:v30 characteristic:v24];
          if (v32)
          {
            uint64_t v33 = [[HMDAccessCodeWriteRequestModificationRequestPair alloc] initWithWriteRequest:v32 modificationRequests:v30];
            [v56 addObject:v33];
          }
          uint64_t v34 = [v6 objectForKeyedSubscript:v21];
          __int16 v35 = objc_msgSend(v34, "na_map:", &__block_literal_global_165);

          id v36 = +[HMDAccessoryAccessCodeReaderWriter createWriteRequestForRemoveRequests:v35 characteristic:v31];
          if (v36)
          {
            id v37 = [[HMDAccessCodeWriteRequestModificationRequestPair alloc] initWithWriteRequest:v36 modificationRequests:v35];
            [v56 addObject:v37];

            uint64_t v18 = v50;
          }

          uint64_t v24 = v31;
        }
        else
        {
          id v38 = (void *)MEMORY[0x1D9452090]();
          id v39 = a1;
          id v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            id v41 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v48;
            uint64_t v67 = v41;
            __int16 v68 = 2112;
            v69 = v23;
            _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Not submitting modification requests because did not find an access code control point on accessory: %@", buf, 0x16u);

            uint64_t v24 = 0;
          }
        }

        if (!v24) {
          goto LABEL_35;
        }
      }
      id v17 = v56;
      uint64_t v53 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v53) {
        continue;
      }
      break;
    }
  }

  id v42 = (void *)[v17 copy];
LABEL_36:

  return v42;
}

uint64_t __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

id __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __96__HMDAccessoryAccessCodeReaderWriter_createWriteRequestsForModificationRequests_hapAccessories___block_invoke_155(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (int64_t)hmPrivateErrorCodeForHAPAccessCodeError:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v4 = a3 - 2;
  if (unint64_t)(a3 - 2) < 8 && ((0xBDu >> v4)) {
    return qword_1D54D3770[v4];
  }
  id v5 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = HAPAccessCodeResponseStatusAsString();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Encountered an error type that likely indicates a bug: %@", (uint8_t *)&v11, 0x16u);
  }
  return 2607;
}

+ (id)modificationResponseForControlResponse:(id)a3 operationType:(int64_t)a4 accessoryUUID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ((unint64_t)(a4 - 6) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    id v30 = (void *)_HMFPreconditionFailure();
    return +[HMDAccessoryAccessCodeReaderWriter modificationResponseForFailedMatterRequest:v32 error:v33];
  }
  uint64_t v9 = v8;
  uint64_t v10 = [v7 accessCode];

  if (!v10) {
    goto LABEL_7;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F2E4F0]);
  id v12 = [v7 accessCode];
  uint64_t v10 = (void *)[v11 initWithStringValue:v12];

  __int16 v13 = [v7 flags];

  if (v13)
  {
    id v14 = [v7 flags];
    __int16 v13 = (void *)([v14 value] & 1);
  }
  uint64_t v15 = [v7 identifier];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F2E510]);
    id v17 = [v7 identifier];
    uint64_t v18 = [v17 value];
    long long v19 = (void *)[v16 initWithAccessoryUUID:v9 accessCodeValue:v10 uniqueIdentifier:v18 hasRestrictions:v13];
  }
  else
  {
LABEL_7:
    long long v19 = 0;
  }
  id v20 = [v7 statusCode];
  if (!v20) {
    goto LABEL_14;
  }
  id v21 = [v7 statusCode];
  uint64_t v22 = [v21 value];

  if (!v22)
  {
    id v20 = 0;
LABEL_14:
    __int16 v25 = v10;
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  __int16 v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v24 = [v7 statusCode];
  id v20 = objc_msgSend(v23, "hmPrivateErrorWithCode:", +[HMDAccessoryAccessCodeReaderWriter hmPrivateErrorCodeForHAPAccessCodeError:](HMDAccessoryAccessCodeReaderWriter, "hmPrivateErrorCodeForHAPAccessCodeError:", objc_msgSend(v24, "value")));

  if (a4 != 3 || !v20) {
    goto LABEL_14;
  }
  __int16 v25 = v19;
  long long v19 = 0;
LABEL_15:

  uint64_t v26 = 1;
  if (a4 != 4) {
    uint64_t v26 = 2;
  }
  if (a4 == 3) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = v26;
  }
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F2E4D0]) initWithAccessoryUUID:v9 accessoryAccessCodeValue:v19 accessCodeValue:v10 operationType:v27 error:v20];

  return v28;
}

+ (id)modificationResponseForFailedMatterRequest:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  id v12 = [v6 domain];
  __int16 v13 = v12;
  if (v12 == (void *)*MEMORY[0x1E4F6A0A8])
  {
    uint64_t v14 = [v6 code];

    if (v14 == 8)
    {
      if (v8)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F2E4D0]);
        id v16 = [v8 accessoryUUID];
        id v17 = [v8 accessCodeValue];
        uint64_t v18 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2602];
        long long v19 = v15;
        id v20 = v16;
        id v21 = 0;
        uint64_t v22 = v17;
        uint64_t v23 = 0;
      }
      else
      {
        if (!v11) {
          goto LABEL_15;
        }
        id v24 = objc_alloc(MEMORY[0x1E4F2E4D0]);
        id v16 = [v11 accessoryUUID];
        id v17 = [v11 accessoryAccessCodeValue];
        uint64_t v18 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2602];
        long long v19 = v24;
        id v20 = v16;
        id v21 = v17;
        uint64_t v22 = 0;
        uint64_t v23 = 1;
      }
      __int16 v25 = (void *)[v19 initWithAccessoryUUID:v20 accessoryAccessCodeValue:v21 accessCodeValue:v22 operationType:v23 error:v18];

      goto LABEL_16;
    }
  }
  else
  {
  }
LABEL_15:
  __int16 v25 = [(id)objc_opt_class() genericModificationResponseForFailedRequest:v9];
LABEL_16:

  return v25;
}

+ (id)genericModificationResponseForFailedRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;
  id v6 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v5)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F2E4D0]);
    __int16 v13 = [v5 accessoryUUID];
    uint64_t v14 = [v5 accessCodeValue];
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    id v16 = v12;
    id v17 = v13;
    uint64_t v18 = 0;
    long long v19 = v14;
    uint64_t v20 = 0;
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x1E4F2E4D0]);
    if (v8)
    {
      __int16 v13 = [v8 accessoryUUID];
      uint64_t v14 = [v8 accessoryAccessCodeValue];
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      id v16 = v21;
      id v17 = v13;
      uint64_t v18 = v14;
      long long v19 = 0;
      uint64_t v20 = 1;
    }
    else
    {
      __int16 v13 = [v11 accessoryUUID];
      uint64_t v14 = [v11 accessoryAccessCodeValue];
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      id v16 = v21;
      id v17 = v13;
      uint64_t v18 = v14;
      long long v19 = 0;
      uint64_t v20 = 2;
    }
  }
  uint64_t v22 = (void *)[v16 initWithAccessoryUUID:v17 accessoryAccessCodeValue:v18 accessCodeValue:v19 operationType:v20 error:v15];

  return v22;
}

+ (id)createModificationResponsesForWriteResponses:(id)a3 ofRequestPairs:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v40 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v39 = *(void *)v45;
    *(void *)&long long v8 = 138543874;
    long long v36 = v8;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
        id v12 = objc_msgSend(v11, "writeRequest", v36);
        __int16 v13 = +[HMDAccessoryAccessCodeReaderWriter _accessCodeControlFromWriteResponses:v5 forWriteRequest:v12];
        uint64_t v14 = v13;
        if (!v13)
        {
          uint64_t v26 = (void *)MEMORY[0x1D9452090]();
          id v27 = a1;
          id v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v29 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v36;
            uint64_t v49 = v29;
            __int16 v50 = 2112;
            id v51 = v5;
            __int16 v52 = 2112;
            uint64_t v53 = v12;
            _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Failed to extract HAPAccessCodeControl from write responses: %@, for write request: %@", buf, 0x20u);
          }
          uint64_t v23 = [v11 modificationRequests];
          id v24 = v23;
          __int16 v25 = &__block_literal_global_147;
          goto LABEL_15;
        }
        uint64_t v15 = [v13 accessCodeControlResponse];
        if (!v15
          || (id v16 = (void *)v15,
              [v14 accessCodeControlResponse],
              id v17 = objc_claimAutoreleasedReturnValue(),
              int v18 = objc_msgSend(v17, "hmf_isEmpty"),
              v17,
              v16,
              v18))
        {
          long long v19 = (void *)MEMORY[0x1D9452090]();
          id v20 = a1;
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v49 = v22;
            _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Received HAPAccessCodeControl object that does not contain any HAPAccessCodeControlResponses", buf, 0xCu);
          }
          uint64_t v23 = [v11 modificationRequests];
          id v24 = v23;
          __int16 v25 = &__block_literal_global_150;
LABEL_15:
          id v30 = objc_msgSend(v23, "na_map:", v25);

          [v40 addObjectsFromArray:v30];
          goto LABEL_16;
        }
        SEL v31 = [v14 accessCodeControlResponse];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke_2;
        v41[3] = &unk_1E6A05CA8;
        id v42 = v14;
        id v43 = v12;
        id v32 = objc_msgSend(v31, "na_map:", v41);

        [v40 addObjectsFromArray:v32];
        id v30 = v42;
LABEL_16:

        ++v10;
      }
      while (v9 != v10);
      uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
      uint64_t v9 = v33;
    }
    while (v33);
  }

  uint64_t v34 = (void *)[v40 copy];
  return v34;
}

id __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 operationType];
  uint64_t v6 = [v5 value];
  uint64_t v7 = [*(id *)(a1 + 40) characteristic];
  long long v8 = [v7 service];
  uint64_t v9 = [v8 accessory];
  uint64_t v10 = [v9 uuid];
  id v11 = +[HMDAccessoryAccessCodeReaderWriter modificationResponseForControlResponse:v4 operationType:v6 accessoryUUID:v10];

  return v11;
}

id __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke_148(uint64_t a1, uint64_t a2)
{
  return +[HMDAccessoryAccessCodeReaderWriter genericModificationResponseForFailedRequest:a2];
}

id __98__HMDAccessoryAccessCodeReaderWriter_createModificationResponsesForWriteResponses_ofRequestPairs___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDAccessoryAccessCodeReaderWriter genericModificationResponseForFailedRequest:a2];
}

+ (id)_accessCodeControlFromWriteResponses:(id)a3 forWriteRequest:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v7 characteristic];
  id v33 = 0;
  uint64_t v9 = objc_msgSend(v6, "hmd_valueOfCharacteristic:error:", v8, &v33);
  id v10 = v33;
  if (v9)
  {
    id v11 = v9;
    objc_opt_class();
    int v12 = objc_opt_isKindOfClass() & 1;
    if (v12) {
      __int16 v13 = v11;
    }
    else {
      __int16 v13 = 0;
    }
    id v31 = v13;

    if (v12)
    {
      id v32 = v10;
      uint64_t v14 = [MEMORY[0x1E4F5BBD0] parsedFromData:v11 error:&v32];
      id v15 = v32;

      if (v14)
      {
        id v16 = v14;
      }
      else
      {
        __int16 v25 = (void *)MEMORY[0x1D9452090]();
        id v26 = a1;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = id v30 = v25;
          *(_DWORD *)buf = 138543618;
          __int16 v35 = v28;
          __int16 v36 = 2112;
          id v37 = v11;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAPAccessCodeControl from NSData: %@", buf, 0x16u);

          __int16 v25 = v30;
        }
      }

      id v10 = v15;
    }
    else
    {
      id v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = a1;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v35 = v24;
        __int16 v36 = 2112;
        id v37 = v11;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Characteristic response value: %@ is not of expected type NSData", buf, 0x16u);
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = a1;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v35 = v20;
      __int16 v36 = 2112;
      id v37 = v8;
      __int16 v38 = 2112;
      id v39 = v6;
      __int16 v40 = 2112;
      id v41 = v10;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to parse characteristic response for characteristic: %@, in payload: %@, with error: %@", buf, 0x2Au);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)createConstraintsFromReadResponses:(id)a3 readRequests:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "na_map:", &__block_literal_global_141);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAccessoryAccessCodeReaderWriter_createConstraintsFromReadResponses_readRequests___block_invoke_2;
  v11[3] = &unk_1E6A05C60;
  id v12 = v6;
  id v13 = a1;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "na_map:", v11);

  return v9;
}

id __86__HMDAccessoryAccessCodeReaderWriter_createConstraintsFromReadResponses_readRequests___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 accessory];
  uint64_t v47 = [v4 uuid];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F2E4C0]) initWithAllowedCharacterSets:1 minimumLength:4 maximumLength:8 maximumAllowedAccessCodes:200];
  id v6 = *(void **)(a1 + 32);
  id v49 = 0;
  id v7 = objc_msgSend(v6, "hmd_valueOfCharacteristic:error:", v3, &v49);
  id v8 = v49;
  if (v7)
  {
    long long v46 = v5;
    id v9 = v7;
    objc_opt_class();
    int v10 = objc_opt_isKindOfClass() & 1;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = 0;
    }
    id v45 = v11;

    if (v10)
    {
      id v48 = v8;
      id v12 = [MEMORY[0x1E4F5BBC8] parsedFromData:v9 error:&v48];
      id v44 = v48;

      if (v12)
      {
        id v13 = [v12 characterSet];
        uint64_t v14 = [v13 value];

        BOOL v42 = v14 == 1;
        id v41 = objc_alloc(MEMORY[0x1E4F2E4C0]);
        id v43 = [v12 minimumValueLength];
        id v15 = [v43 value];
        uint64_t v16 = [v15 integerValue];
        id v17 = [v12 maximumValueLength];
        id v18 = [v17 value];
        uint64_t v19 = [v18 integerValue];
        id v20 = [v12 maximumAccessCodes];
        id v21 = [v20 value];
        id v22 = objc_msgSend(v41, "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", v42, v16, v19, objc_msgSend(v21, "integerValue"));

        uint64_t v23 = (void *)v47;
        id v24 = (void *)[objc_alloc(MEMORY[0x1E4F2E500]) initWithAccessory:v47 constraints:v22 error:0];
        id v5 = v46;
      }
      else
      {
        __int16 v35 = (void *)MEMORY[0x1D9452090]();
        id v36 = *(id *)(a1 + 40);
        id v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          __int16 v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v51 = v38;
          __int16 v52 = 2112;
          id v53 = v9;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAPAccessCodeControl from NSData: %@", buf, 0x16u);
        }
        id v39 = objc_alloc(MEMORY[0x1E4F2E500]);
        id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
        id v5 = v46;
        uint64_t v23 = (void *)v47;
        id v24 = (void *)[v39 initWithAccessory:v47 constraints:v46 error:v22];
      }

      id v8 = v44;
    }
    else
    {
      id v30 = (void *)MEMORY[0x1D9452090]();
      id v31 = *(id *)(a1 + 40);
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v51 = v33;
        __int16 v52 = 2112;
        id v53 = v9;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Characteristic response value: %@ is not of expected type NSData", buf, 0x16u);
      }
      id v34 = objc_alloc(MEMORY[0x1E4F2E500]);
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      id v5 = v46;
      uint64_t v23 = (void *)v47;
      id v24 = (void *)[v34 initWithAccessory:v47 constraints:v46 error:v12];
    }
  }
  else
  {
    __int16 v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = *(id *)(a1 + 40);
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      id v51 = v28;
      __int16 v52 = 2112;
      id v53 = v3;
      __int16 v54 = 2112;
      uint64_t v55 = v29;
      __int16 v56 = 2112;
      id v57 = v8;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic response for characteristic: %@, in payload: %@, with error: %@", buf, 0x2Au);
    }
    uint64_t v23 = (void *)v47;
    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F2E500]) initWithAccessory:v47 constraints:v5 error:v8];
  }

  return v24;
}

uint64_t __86__HMDAccessoryAccessCodeReaderWriter_createConstraintsFromReadResponses_readRequests___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

+ (id)identifiersFromListWriteResponses:(id)a3 ofWriteRequests:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v31;
    *(void *)&long long v8 = 138543874;
    long long v26 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = +[HMDAccessoryAccessCodeReaderWriter _accessCodeControlFromWriteResponses:forWriteRequest:](HMDAccessoryAccessCodeReaderWriter, "_accessCodeControlFromWriteResponses:forWriteRequest:", v5, v12, v26);
        uint64_t v14 = v13;
        if (v13)
        {
          id v15 = [v13 accessCodeControlResponse];
          uint64_t v16 = objc_msgSend(v15, "na_map:", &__block_literal_global_138);

          id v17 = [v12 characteristic];
          id v18 = [v17 accessory];
          uint64_t v19 = [v18 uuid];
          [v29 setObject:v16 forKeyedSubscript:v19];
        }
        else
        {
          id v20 = (void *)MEMORY[0x1D9452090]();
          id v21 = a1;
          id v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v26;
            __int16 v35 = v23;
            __int16 v36 = 2112;
            id v37 = v5;
            __int16 v38 = 2112;
            id v39 = v12;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract HAPAccessCodeControl from write responses: %@, for write request: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v9);
  }

  id v24 = (void *)[v29 copy];
  return v24;
}

uint64_t __88__HMDAccessoryAccessCodeReaderWriter_identifiersFromListWriteResponses_ofWriteRequests___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (id)accessCodeFetchResponsesForReadWriteResponses:(id)a3 ofWriteRequests:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v6 = a4;
  BOOL v42 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v50;
    *(void *)&long long v8 = 138543874;
    long long v40 = v8;
    uint64_t v41 = *(void *)v50;
    do
    {
      uint64_t v11 = 0;
      uint64_t v44 = v9;
      do
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
        id v13 = objc_msgSend(v12, "characteristic", v40);
        uint64_t v14 = [v13 service];
        id v15 = [v14 accessory];
        uint64_t v16 = [v15 uuid];

        if (v16)
        {
          id v17 = +[HMDAccessoryAccessCodeReaderWriter _accessCodeControlFromWriteResponses:v45 forWriteRequest:v12];
          id v18 = v17;
          if (v17)
          {
            uint64_t v19 = [v17 accessCodeControlResponse];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __100__HMDAccessoryAccessCodeReaderWriter_accessCodeFetchResponsesForReadWriteResponses_ofWriteRequests___block_invoke;
            v46[3] = &unk_1E6A05BF8;
            id v20 = a1;
            id v48 = a1;
            v46[4] = v12;
            id v21 = v16;
            id v47 = v21;
            id v22 = objc_msgSend(v19, "na_map:", v46);

            uint64_t v23 = [v18 accessCodeControlResponse];
            id v24 = objc_msgSend(v23, "na_firstObjectPassingTest:", &__block_literal_global_134);
            __int16 v25 = [v24 statusCode];
            long long v26 = (void *)[v25 value];

            if (v26)
            {
              id v27 = (void *)MEMORY[0x1E4F28C58];
              id v28 = HAPAccessCodeResponseStatusAsString();
              long long v26 = [v27 hmErrorWithCode:-1 description:v28 reason:0 suggestion:0];
            }
            uint64_t v9 = v44;
            uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F2E508]) initWithAccessoryUUID:v21 accessoryAccessCodeValues:v22 error:v26];
            [v42 addObject:v29];

            a1 = v20;
            uint64_t v10 = v41;
          }
          else
          {
            id v34 = (void *)MEMORY[0x1D9452090]();
            id v35 = a1;
            __int16 v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              id v37 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v40;
              __int16 v54 = v37;
              __int16 v55 = 2112;
              id v56 = v45;
              __int16 v57 = 2112;
              uint64_t v58 = v12;
              _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract HAPAccessCodeControl from write responses: %@, for write request: %@", buf, 0x20u);

              uint64_t v9 = v44;
            }
          }
        }
        else
        {
          long long v30 = (void *)MEMORY[0x1D9452090]();
          id v31 = a1;
          long long v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            long long v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v54 = v33;
            __int16 v55 = 2112;
            id v56 = v12;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory UUID for write request: %@", buf, 0x16u);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v9);
  }

  __int16 v38 = (void *)[v42 copy];
  return v38;
}

id __100__HMDAccessoryAccessCodeReaderWriter_accessCodeFetchResponsesForReadWriteResponses_ofWriteRequests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];

  if (!v4)
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 48);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 32);
      int v24 = 138543874;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      id v27 = v3;
      __int16 v28 = 2112;
      uint64_t v29 = v20;
      id v21 = "%{public}@Accessory read response: %@ does not contain an access code identifier for write request: %@";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v24, 0x20u);
    }
LABEL_11:

    id v15 = 0;
    goto LABEL_12;
  }
  id v5 = [v3 accessCode];

  if (!v5)
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 48);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      uint64_t v22 = *(void *)(a1 + 32);
      int v24 = 138543874;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      id v27 = v3;
      __int16 v28 = 2112;
      uint64_t v29 = v22;
      id v21 = "%{public}@Accessory read response: %@ does not contain an access code for write request: %@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v6 = [v3 flags];

  if (v6)
  {
    uint64_t v7 = [v3 flags];
    id v6 = (void *)([v7 value] & 1);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F2E510]);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = objc_alloc(MEMORY[0x1E4F2E4F0]);
  uint64_t v11 = [v3 accessCode];
  id v12 = (void *)[v10 initWithStringValue:v11];
  id v13 = [v3 identifier];
  uint64_t v14 = [v13 value];
  id v15 = (void *)[v8 initWithAccessoryUUID:v9 accessCodeValue:v12 uniqueIdentifier:v14 hasRestrictions:v6];

LABEL_12:
  return v15;
}

BOOL __100__HMDAccessoryAccessCodeReaderWriter_accessCodeFetchResponsesForReadWriteResponses_ofWriteRequests___block_invoke_131(uint64_t a1, void *a2)
{
  id v2 = [a2 statusCode];
  BOOL v3 = [v2 value] != 0;

  return v3;
}

+ (id)_createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [v3 keyEnumerator];
  uint64_t v25 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v28;
    id v19 = v3;
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5BBF0]) initWithValue:2];
        uint64_t v7 = [v3 objectForKey:v5];
        id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_128);
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F5BBD0]) initWithOperationType:v6 accessCodeControlRequest:v8 accessCodeControlResponse:0];
        id v26 = 0;
        id v10 = [v9 serializeWithError:&v26];
        id v11 = v26;
        if (v10)
        {
          id v12 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v5 value:v10 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
          [v22 addObject:v12];
        }
        else
        {
          context = (void *)MEMORY[0x1D9452090]();
          id v13 = a1;
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544386;
            long long v32 = v18;
            __int16 v33 = 2112;
            uint64_t v34 = 0;
            __int16 v35 = 2112;
            __int16 v36 = v7;
            __int16 v37 = 2112;
            uint64_t v38 = v5;
            __int16 v39 = 2112;
            id v40 = v11;
            _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control write request: %@, to read access codes with identifiers: %@, from characteristic: %@, with error: %@", buf, 0x34u);
          }
          id v3 = v19;
        }

        if (!v10)
        {

          uint64_t v16 = 0;
          id v15 = v22;
          goto LABEL_16;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v15 = v22;
  uint64_t v16 = (void *)[v22 copy];
LABEL_16:

  return v16;
}

id __103__HMDAccessoryAccessCodeReaderWriter__createReadWriteRequestsForAccessCodeIdentifiersByCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F5BBD8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithIdentifier:v3 accessCode:0];

  return v4;
}

+ (id)_createListWriteRequestsForCharacteristics:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__HMDAccessoryAccessCodeReaderWriter__createListWriteRequestsForCharacteristics___block_invoke;
  v5[3] = &__block_descriptor_40_e58___HMDCharacteristicWriteRequest_16__0__HMDCharacteristic_8l;
  void v5[4] = a1;
  id v3 = objc_msgSend(a3, "na_map:", v5);
  return v3;
}

id __81__HMDAccessoryAccessCodeReaderWriter__createListWriteRequestsForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5BBF0]) initWithValue:1];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5BBD0]) initWithOperationType:v4 accessCodeControlRequest:0 accessCodeControlResponse:0];
  id v14 = 0;
  id v6 = [v5 serializeWithError:&v14];
  id v7 = v14;
  if (v6)
  {
    id v8 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v3 value:v6 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control list request: %@, with error: %@", buf, 0x20u);
    }
    id v8 = 0;
  }

  return v8;
}

@end