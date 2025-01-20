@interface HMDAddAccessoryPairingOperation
+ (id)logCategory;
- (BOOL)addPairingToAirPlayAccessory:(id)a3 newPairingIdentity:(id)a4 isOwner:(BOOL)a5 error:(id *)a6;
- (BOOL)addPairingToHAPAccessory:(id)a3 newPairingIdentity:(id)a4 permissions:(unint64_t)a5 error:(id *)a6;
- (BOOL)mainWithError:(id *)a3;
- (HMDAddAccessoryPairingOperation)initWithAccessory:(id)a3 newPairingIdentity:(id)a4 asOwner:(BOOL)a5 asAdmin:(BOOL)a6 shouldUpdateKeyChainEntry:(BOOL)a7;
- (HMDAddAccessoryPairingOperation)initWithAccessory:(id)a3 newPairingIdentity:(id)a4 asOwner:(BOOL)a5 asAdmin:(BOOL)a6 shouldUpdateKeyChainEntry:(BOOL)a7 userData:(id)a8;
- (HMDAddAccessoryPairingOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 newPairingIdentity:(id)a5 homeUUIDWhereAccessoryWasPaired:(id)a6 asOwner:(BOOL)a7 asAdmin:(BOOL)a8 shouldUpdateKeyChainEntry:(BOOL)a9 userData:(id)a10;
- (id)logIdentifier;
- (void)associateNewControllerKeyWithAccessory:(id)a3 controllerKeyIdentifierToAssociate:(id)a4 permissions:(unint64_t)a5 withCompletion:(id)a6;
@end

@implementation HMDAddAccessoryPairingOperation

- (id)logIdentifier
{
  v2 = [(HMDBackgroundOperation *)self operationUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)addPairingToAirPlayAccessory:(id)a3 newPairingIdentity:(id)a4 isOwner:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__138484;
  v37 = __Block_byref_object_dispose__138485;
  id v38 = 0;
  objc_initWeak(&location, v10);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __97__HMDAddAccessoryPairingOperation_addPairingToAirPlayAccessory_newPairingIdentity_isOwner_error___block_invoke;
  v27[3] = &unk_264A212D8;
  objc_copyWeak(&v31, &location);
  v27[4] = self;
  id v13 = v11;
  id v28 = v13;
  v30 = &v33;
  v14 = v12;
  v29 = v14;
  [v10 addUserPairingIdentity:v13 isOwner:v7 completionHandler:v27];
  dispatch_time_t v15 = dispatch_time(0, 120000000000);
  if (!dispatch_group_wait(v14, v15))
  {
    v23 = (void *)v34[5];
    if (!v23)
    {
      BOOL v24 = 1;
      goto LABEL_12;
    }
    if (a6)
    {
      id v22 = v23;
      goto LABEL_9;
    }
LABEL_10:
    BOOL v24 = 0;
    goto LABEL_12;
  }
  context = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = a6;
    HMFGetLogIdentifier();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = [v13 identifier];
    v21 = [v10 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v40 = v19;
    __int16 v41 = 2112;
    v42 = v20;
    __int16 v43 = 2112;
    v44 = v21;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not add new pairing %@ to accessory %@", buf, 0x20u);

    a6 = v18;
  }

  if (!a6) {
    goto LABEL_10;
  }
  id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:100];
LABEL_9:
  BOOL v24 = 0;
  *a6 = v22;
LABEL_12:

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  return v24;
}

void __97__HMDAddAccessoryPairingOperation_addPairingToAirPlayAccessory_newPairingIdentity_isOwner_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  BOOL v7 = HMFGetOSLogHandle();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 40) identifier];
      id v11 = [WeakRetained shortDescription];
      int v19 = 138544130;
      v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      BOOL v24 = v11;
      __int16 v25 = 2112;
      id v26 = v3;
      v12 = "%{public}@Unable to add new pairing %@ to accessory %@ with error: %@";
      id v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 42;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v19, v15);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    id v10 = [*(id *)(a1 + 40) identifier];
    id v11 = [WeakRetained shortDescription];
    int v19 = 138543874;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    BOOL v24 = v11;
    v12 = "%{public}@Successfully added new pairing %@ to accessory %@.";
    id v13 = v8;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 32;
    goto LABEL_6;
  }

  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v3;
  id v18 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (BOOL)addPairingToHAPAccessory:(id)a3 newPairingIdentity:(id)a4 permissions:(unint64_t)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = dispatch_get_global_queue(-32768, 0);
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__138484;
  v47 = __Block_byref_object_dispose__138485;
  id v48 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke;
  aBlock[3] = &unk_264A21288;
  aBlock[4] = self;
  id v13 = v10;
  id v38 = v13;
  id v14 = v9;
  id v39 = v14;
  uint32_t v15 = v12;
  __int16 v41 = &v43;
  unint64_t v42 = a5;
  id v40 = v15;
  uint64_t v16 = _Block_copy(aBlock);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_55;
  v33[3] = &unk_264A212B0;
  id v17 = v13;
  id v34 = v17;
  id v18 = v11;
  id v35 = v18;
  id v19 = v16;
  id v36 = v19;
  [v14 performOperation:5 linkType:0 operationBlock:v33 errorBlock:v19];
  dispatch_time_t v20 = dispatch_time(0, 120000000000);
  if (!dispatch_group_wait(v15, v20))
  {
    id v28 = (void *)v44[5];
    if (!v28)
    {
      BOOL v29 = 1;
      goto LABEL_12;
    }
    if (a6)
    {
      id v27 = v28;
      goto LABEL_9;
    }
LABEL_10:
    BOOL v29 = 0;
    goto LABEL_12;
  }
  __int16 v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = self;
  HMFGetOSLogHandle();
  __int16 v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    id v31 = v21;
    HMFGetLogIdentifier();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v25 = [v17 identifier];
    id v26 = [v14 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v50 = v24;
    __int16 v51 = 2112;
    v52 = v25;
    __int16 v53 = 2112;
    v54 = v26;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not add new pairing %@ to accessory %@", buf, 0x20u);

    __int16 v21 = v31;
  }

  if (!a6) {
    goto LABEL_10;
  }
  id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:100];
LABEL_9:
  BOOL v29 = 0;
  *a6 = v27;
LABEL_12:

  _Block_object_dispose(&v43, 8);
  return v29;
}

void __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      v8 = [*(id *)(a1 + 40) identifier];
      id v9 = [*(id *)(a1 + 48) shortDescription];
      *(_DWORD *)buf = 138544130;
      id v35 = v7;
      __int16 v36 = 2112;
      v37 = v8;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v9;
      __int16 v40 = 2112;
      __int16 v41 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to add new pairing %@ to accessory %@ with error: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) userData];
    int v11 = objc_msgSend(v10, "hmf_BOOLForKey:", @"shouldUpdateKeyChainEntry");

    v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = [*(id *)(a1 + 40) identifier];
      uint64_t v17 = [*(id *)(a1 + 48) shortDescription];
      id v18 = (void *)v17;
      id v19 = @"Will not";
      *(_DWORD *)buf = 138544130;
      id v35 = v15;
      if (v11) {
        id v19 = @"Will";
      }
      __int16 v36 = 2112;
      v37 = v16;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      __int16 v41 = v19;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Successfully added new pairing %@ to accessory %@. %@ update the keychain entry", buf, 0x2Au);
    }
    if (v11)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      uint64_t v20 = *(void *)(a1 + 48);
      __int16 v21 = *(void **)(a1 + 32);
      id v22 = [*(id *)(a1 + 40) identifier];
      uint64_t v23 = *(void *)(a1 + 72);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_53;
      v30[3] = &unk_264A2F7A8;
      id v24 = *(void **)(a1 + 40);
      v30[4] = *(void *)(a1 + 32);
      id v31 = v24;
      id v32 = *(id *)(a1 + 48);
      long long v29 = *(_OWORD *)(a1 + 56);
      id v25 = (id)v29;
      long long v33 = v29;
      [v21 associateNewControllerKeyWithAccessory:v20 controllerKeyIdentifierToAssociate:v22 permissions:v23 withCompletion:v30];
    }
  }
  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  id v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v3;
  id v28 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_55(void *a1, void *a2)
{
  id v3 = [a2 server];
  [v3 addPairing:a1[4] completionQueue:a1[5] completionHandler:a1[6]];
}

void __97__HMDAddAccessoryPairingOperation_addPairingToHAPAccessory_newPairingIdentity_permissions_error___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      v8 = [*(id *)(a1 + 40) identifier];
      id v9 = [*(id *)(a1 + 48) identifier];
      int v13 = 138544130;
      id v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not store new pairing identity [%@] for accessory [%@] to keychain. [%@]", (uint8_t *)&v13, 0x2Au);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v3;
  id v12 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)associateNewControllerKeyWithAccessory:(id)a3 controllerKeyIdentifierToAssociate:(id)a4 permissions:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a6;
  id v13 = objc_alloc(MEMORY[0x263F35A78]);
  id v14 = [v10 identifier];
  id v15 = objc_alloc(MEMORY[0x263F425F0]);
  uint64_t v16 = [v10 publicKey];
  __int16 v17 = (void *)[v15 initWithPairingKeyData:v16];
  id v18 = (void *)[v13 initWithIdentifier:v14 controllerKeyIdentifier:v11 publicKey:v17 privateKey:0 permissions:a5];

  id v25 = 0;
  [v10 associateControllerKeyWithAccessory:v18 error:&v25];
  id v19 = v25;
  id v20 = (void *)MEMORY[0x230FBD990]();
  uint64_t v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    id v24 = [v10 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v27 = v23;
    __int16 v28 = 2112;
    long long v29 = v24;
    __int16 v30 = 2112;
    id v31 = v19;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating new pairing identity to key chain finished for accessory: %@ with error : %@", buf, 0x20u);
  }
  v12[2](v12, v19);
}

- (BOOL)mainWithError:(id *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v44 = [(HMDAccessoryBackgroundOperation *)self accessoryIdentifier];
  v4 = [(HMDBackgroundOperation *)self userData];
  id v5 = [v4 objectForKeyedSubscript:@"newPairingIdentifier"];

  id v6 = [(HMDBackgroundOperation *)self userData];
  BOOL v7 = [v6 objectForKeyedSubscript:@"newPairingPublicKey"];

  v8 = [(HMDBackgroundOperation *)self userData];
  id v9 = objc_msgSend(v8, "hmf_numberForKey:", @"IsOwnerUser");
  unsigned int v10 = [v9 BOOLValue];

  unint64_t v11 = [(HMDAccessoryBackgroundOperation *)self accessoryOperationStatus];
  id v12 = objc_opt_class();
  id v13 = [(HMDAccessoryBackgroundOperation *)self accessoryUUID];
  id v14 = [(HMDBackgroundOperation *)self homeManager];
  id v15 = [v12 findAccessoryUsing:v13 homeManager:v14];

  id v16 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v17 = v16;
  }
  else {
    __int16 v17 = 0;
  }
  unint64_t v18 = v17;

  id v19 = v16;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }
  unint64_t v21 = v20;

  if (v18 | v21 && v5 && v7 && v11)
  {
    if (v11 == 1)
    {
      contexta = (void *)MEMORY[0x230FBD990]();
      id v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v40 = HMFGetLogIdentifier();
        id v24 = [v19 shortDescription];
        id v25 = [v19 home];
        uint64_t v26 = [v25 uuid];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v40;
        __int16 v46 = 2112;
        v47 = v24;
        __int16 v48 = 2112;
        v49 = v26;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Since the accessory [%@] is already added back to this home [%@], there is no way this operation can successfully run in the future as the required parameters will never be true. Hence marking this operation as finished.", buf, 0x20u);
      }
      BOOL v27 = 1;
    }
    else
    {
      long long v33 = [(HMDBackgroundOperation *)self userData];
      id v34 = [v33 objectForKeyedSubscript:@"newPairingPermission"];
      unsigned int v41 = v10;
      uint64_t v35 = [v34 unsignedIntValue];

      __int16 v36 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v7];
      v37 = (void *)[objc_alloc(MEMORY[0x263F35A78]) initWithIdentifier:v5 publicKey:v36 privateKey:0 permissions:v35];
      *(void *)buf = [objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Add accessory pairing operation"];
      if (v18) {
        BOOL v38 = [(HMDAddAccessoryPairingOperation *)self addPairingToHAPAccessory:v18 newPairingIdentity:v37 permissions:v35 error:a3];
      }
      else {
        BOOL v38 = [(HMDAddAccessoryPairingOperation *)self addPairingToAirPlayAccessory:v21 newPairingIdentity:v37 isOwner:v41 error:a3];
      }
      BOOL v27 = v38;
      __HMFActivityScopeLeave();
    }
  }
  else
  {
    __int16 v28 = (void *)MEMORY[0x230FBD990]();
    long long v29 = self;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      uint64_t v32 = [(HMDAccessoryBackgroundOperation *)v29 accessoryUUID];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v31;
      __int16 v46 = 2112;
      v47 = v32;
      __int16 v48 = 2112;
      v49 = v44;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Required parameters does not exist to properly execute this operation : [%@/%@]", buf, 0x20u);
    }
    if (a3)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:20];
      BOOL v27 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v27 = 0;
    }
  }

  return v27;
}

- (HMDAddAccessoryPairingOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 newPairingIdentity:(id)a5 homeUUIDWhereAccessoryWasPaired:(id)a6 asOwner:(BOOL)a7 asAdmin:(BOOL)a8 shouldUpdateKeyChainEntry:(BOOL)a9 userData:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  unint64_t v21 = v20;
  if (!v20)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  if (!v18) {
    goto LABEL_14;
  }
  if (v19)
  {
    id v22 = (void *)[v20 mutableCopy];
    [v18 identifier];
    v23 = uint64_t v35 = self;
    [v22 setObject:v23 forKeyedSubscript:@"newPairingIdentifier"];

    id v24 = [v18 publicKey];
    id v25 = [v24 data];
    [v22 setObject:v25 forKeyedSubscript:@"newPairingPublicKey"];

    uint64_t v26 = [NSNumber numberWithBool:v11];
    [v22 setObject:v26 forKeyedSubscript:@"IsOwnerUser"];

    BOOL v27 = [NSNumber numberWithUnsignedInteger:v10];
    [v22 setObject:v27 forKeyedSubscript:@"newPairingPermission"];

    __int16 v28 = [NSNumber numberWithBool:a9];
    [v22 setObject:v28 forKeyedSubscript:@"shouldUpdateKeyChainEntry"];

    v36.receiver = v35;
    v36.super_class = (Class)HMDAddAccessoryPairingOperation;
    long long v29 = [(HMDAccessoryBackgroundOperation *)&v36 initWithAccessoryUUID:v16 accessoryIdentifier:v17 homeUUIDWhereAccessoryWasPaired:v19 userData:v22];

    __int16 v30 = v29;
  }
  else
  {
    id v31 = (void *)MEMORY[0x230FBD990]();
    long long v29 = self;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      long long v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      BOOL v38 = v33;
      __int16 v39 = 2112;
      id v40 = v16;
      __int16 v41 = 2112;
      id v42 = v17;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create add accessory pairing operation for accessory: %@/%@", buf, 0x20u);
    }
    __int16 v30 = 0;
  }

  return v30;
}

- (HMDAddAccessoryPairingOperation)initWithAccessory:(id)a3 newPairingIdentity:(id)a4 asOwner:(BOOL)a5 asAdmin:(BOOL)a6 shouldUpdateKeyChainEntry:(BOOL)a7 userData:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (v14)
  {
    if (v15)
    {
      id v17 = v16;
      id v18 = [v14 uuid];
      id v19 = [v14 identifier];
      id v20 = [v14 home];
      uint64_t v21 = [v20 uuid];
      BOOL v22 = v10;
      uint64_t v23 = (void *)v21;
      LOBYTE(v33) = a7;
      id v24 = [(HMDAddAccessoryPairingOperation *)self initWithAccessoryUUID:v18 accessoryIdentifier:v19 newPairingIdentity:v15 homeUUIDWhereAccessoryWasPaired:v21 asOwner:v11 asAdmin:v22 shouldUpdateKeyChainEntry:v33 userData:v17];

      return v24;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  uint64_t v26 = (HMDAddAccessoryPairingOperation *)_HMFPreconditionFailure();
  return [(HMDAddAccessoryPairingOperation *)v26 initWithAccessory:v28 newPairingIdentity:v29 asOwner:v30 asAdmin:v31 shouldUpdateKeyChainEntry:v32];
}

- (HMDAddAccessoryPairingOperation)initWithAccessory:(id)a3 newPairingIdentity:(id)a4 asOwner:(BOOL)a5 asAdmin:(BOOL)a6 shouldUpdateKeyChainEntry:(BOOL)a7
{
  return [(HMDAddAccessoryPairingOperation *)self initWithAccessory:a3 newPairingIdentity:a4 asOwner:a5 asAdmin:a6 shouldUpdateKeyChainEntry:a7 userData:MEMORY[0x263EFFA78]];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_138551 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_138551, &__block_literal_global_138552);
  }
  v2 = (void *)logCategory__hmf_once_v17_138553;
  return v2;
}

void __46__HMDAddAccessoryPairingOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v17_138553;
  logCategory__hmf_once_v17_138553 = v0;
}

@end