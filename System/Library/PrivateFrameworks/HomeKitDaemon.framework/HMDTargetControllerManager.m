@interface HMDTargetControllerManager
+ (id)logCategory;
- (BOOL)configurationRefreshed;
- (HMDHAPAccessory)controller;
- (HMDTargetControllerManager)init;
- (HMDTargetControllerManager)initWithTargetControllerAccessory:(id)a3 targets:(id)a4;
- (NSArray)buttonConfiguration;
- (NSArray)targetUUIDs;
- (NSMutableSet)configuredTargets;
- (NSString)logID;
- (OS_dispatch_queue)workQueue;
- (id)__refreshedConfiguration:(id)a3;
- (id)_dataForAddTargets:(id)a3 outError:(id *)a4;
- (id)_dataForListTargetsWithOutError:(id *)a3;
- (id)_dataForRemoveTargets:(id)a3 outError:(id *)a4;
- (id)_dataForResetTargetsWithOutError:(id *)a3;
- (id)_dataForUpdateTarget:(id)a3 name:(id)a4 buttonConfiguration:(id)a5 outError:(id *)a6;
- (id)targetConfigurationMatchingAccessory:(id)a3;
- (id)targetConfigurationMatchingIdentifier:(id)a3;
- (int)_parseSupportedTargetConfiguration:(id)a3;
- (unint64_t)ticksPerSecond;
- (unsigned)maximumTargets;
- (void)__accessoryConnected:(id)a3;
- (void)__accessoryDisconnected:(id)a3;
- (void)__accessoryNameUpdated:(id)a3;
- (void)__accessoryRemoved:(id)a3;
- (void)__characteristicEventsReceived:(id)a3;
- (void)__handleActiveIdentifierChange:(id)a3 forCharacteristic:(id)a4;
- (void)_addTargets:(id)a3;
- (void)_auditTargets:(id)a3;
- (void)_configureTargetAccessories:(id)a3 reason:(id)a4 targetAccessories:(id)a5 responseHandler:(id)a6;
- (void)_handleActiveIdentifierReadResponses:(id)a3;
- (void)_handleConfigureTargets:(id)a3 responseHandler:(id)a4;
- (void)_listTargetsWithCompletionHandler:(id)a3;
- (void)_notifyConfigurationRefresh:(id)a3;
- (void)_postSelectionChangeNotification:(BOOL)a3 object:(id)a4 userInfo:(id)a5;
- (void)_readSupportedConfigurationWithCompletion:(id)a3;
- (void)_refreshConfigurationWithCompletion:(id)a3;
- (void)_registerForActiveIdentifierNotifications;
- (void)_removeTargets:(id)a3;
- (void)_resetTargets;
- (void)_saveTargetUUIDs;
- (void)_updateName:(id)a3 buttonConfiguration:(id)a4 target:(id)a5;
- (void)acknowledgeTargetControlService:(id)a3 active:(BOOL)a4;
- (void)addConfiguredTarget:(id)a3;
- (void)addTargetAccessory:(id)a3 buttonConfiguration:(id)a4;
- (void)autoConfigureTargets;
- (void)handleConfigureTargets:(id)a3 responseHandler:(id)a4;
- (void)invalidate;
- (void)refreshConfigurationWithCompletion:(id)a3;
- (void)registerForActiveIdentifierNotifications;
- (void)removeConfiguredTarget:(id)a3;
- (void)removeTargetAccessory:(id)a3;
- (void)resetConfiguredTargets;
- (void)setButtonConfiguration:(id)a3;
- (void)setConfigurationRefreshed:(BOOL)a3;
- (void)setConfiguredTargets:(id)a3;
- (void)setMaximumTargets:(unsigned __int8)a3;
- (void)setTicksPerSecond:(unint64_t)a3;
- (void)updateButtonConfigurationForTarget:(id)a3;
- (void)updateTargetAccessory:(id)a3 name:(id)a4 buttonConfiguration:(id)a5;
- (void)updateTargets:(id)a3;
@end

@implementation HMDTargetControllerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_configuredTargets, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)setConfigurationRefreshed:(BOOL)a3
{
  self->_configurationRefreshed = a3;
}

- (BOOL)configurationRefreshed
{
  return self->_configurationRefreshed;
}

- (void)setMaximumTargets:(unsigned __int8)a3
{
  self->_maximumTargets = a3;
}

- (unsigned)maximumTargets
{
  return self->_maximumTargets;
}

- (NSString)logID
{
  return self->_logID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setConfiguredTargets:(id)a3
{
}

- (HMDHAPAccessory)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)_configureTargetAccessories:(id)a3 reason:(id)a4 targetAccessories:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HMDTargetControllerManager *)self controller];
  v15 = [v14 findCharacteristicType:*MEMORY[0x263F0C500] forServiceType:*MEMORY[0x263F0D840]];
  if (v15)
  {
    objc_initWeak(&location, self);
    v16 = [(HMDTargetControllerManager *)self workQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __99__HMDTargetControllerManager__configureTargetAccessories_reason_targetAccessories_responseHandler___block_invoke;
    v18[3] = &unk_264A2C348;
    objc_copyWeak(&v20, &location);
    id v19 = v13;
    [v14 writeValue:v10 toCharacteristic:v15 queue:v16 completion:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else if (v13)
  {
    v17 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    (*((void (**)(id, void *, void))v13 + 2))(v13, v17, 0);
  }
}

void __99__HMDTargetControllerManager__configureTargetAccessories_reason_targetAccessories_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = v7;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F087E8] hmErrorWithCode:2];

    id v4 = (id)v5;
  }
  id v8 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v8, 0);
  }
}

- (void)_handleConfigureTargets:(id)a3 responseHandler:(id)a4
{
  v104[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = [(HMDTargetControllerManager *)self controller];
  v9 = [v8 home];
  id v10 = [v8 findCharacteristicType:*MEMORY[0x263F0C500] forServiceType:*MEMORY[0x263F0D840]];
  if (v10)
  {
    id v11 = (void *)*MEMORY[0x263F0B4F8];
    id v12 = [v6 objectForKey:*MEMORY[0x263F0B4F8]];

    v83 = v9;
    if (v12)
    {
      id v13 = v11;
      v91 = 0;
      v14 = [(HMDTargetControllerManager *)self _dataForResetTargetsWithOutError:&v91];
      v15 = v91;
      goto LABEL_8;
    }
    v17 = (void *)*MEMORY[0x263F0B390];
    v18 = [v6 objectForKey:*MEMORY[0x263F0B390]];

    if (v18)
    {
      id v13 = v17;
      v90 = 0;
      v14 = [(HMDTargetControllerManager *)self _dataForListTargetsWithOutError:&v90];
      v15 = v90;
LABEL_8:
      id v19 = v15;
      id v20 = 0;
      if (v19)
      {
LABEL_9:
        if (v7) {
          v7[2](v7, v19, 0);
        }
        v21 = v19;
        goto LABEL_47;
      }
LABEL_44:
      if (v14) {
        [(HMDTargetControllerManager *)self _configureTargetAccessories:v14 reason:v13 targetAccessories:v20 responseHandler:v7];
      }
      v21 = 0;
      goto LABEL_47;
    }
    v22 = (void *)*MEMORY[0x263F0AF50];
    v23 = [v6 objectForKey:*MEMORY[0x263F0AF50]];

    if (v23)
    {
      id v13 = v22;
      v24 = objc_msgSend(v6, "hmf_UUIDForKey:", v13);
      v14 = [v9 accessoryWithUUID:v24];
      if (!v14)
      {
        id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        v80 = v24;
        id v20 = 0;
        v33 = 0;
        goto LABEL_29;
      }
      if (v9)
      {
        [v9 uuid];
        v26 = v25 = v14;
        uint64_t v27 = identifierForTargetWithUUID(v24, v26);

        v77 = v25;
        v28 = [v25 category];
        uint64_t v72 = mapTargetCategory(v28);

        v68 = [HMDTargetConfiguration alloc];
        v29 = [NSNumber numberWithUnsignedInt:v27];
        [v25 name];
        v30 = v80 = v24;
        v31 = [(HMDTargetControllerManager *)self buttonConfiguration];
        v73 = [(HMDTargetConfiguration *)v68 initWithIdentifier:v29 name:v30 category:v72 buttonConfiguration:v31];

        v104[0] = v25;
        id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:1];
        v103 = v73;
        v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
        id v89 = 0;
        v14 = [(HMDTargetControllerManager *)self _dataForAddTargets:v32 outError:&v89];
        id v19 = v89;

        v33 = v77;
LABEL_29:

        v44 = v80;
        goto LABEL_43;
      }
      v45 = (void *)MEMORY[0x230FBD990]();
      v46 = self;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v82 = HMFGetLogIdentifier();
        id obja = [v8 name];
        [v8 uuid];
        v75 = v45;
        v49 = v48 = v24;
        v70 = [v49 UUIDString];
        *(_DWORD *)buf = 138543874;
        v96 = v82;
        __int16 v97 = 2112;
        id v98 = obja;
        __int16 v99 = 2112;
        v100 = v70;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Attempting to configure targets for a controller %@/%@ that is not configured with a home", buf, 0x20u);

        v24 = v48;
        v45 = v75;
      }
      if (v7)
      {
        v50 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        v7[2](v7, v50, 0);
      }
      goto LABEL_54;
    }
    v34 = (void *)*MEMORY[0x263F0B4C8];
    v35 = [v6 objectForKey:*MEMORY[0x263F0B4C8]];

    if (!v35)
    {
      id v13 = [v6 objectForKey:v34];

      if (!v13)
      {
        id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        v14 = 0;
        id v20 = 0;
        v21 = 0;
        if (v19) {
          goto LABEL_9;
        }
LABEL_47:

        v9 = v83;
        goto LABEL_48;
      }
      id v20 = 0;
      id v13 = 0;
LABEL_55:
      v21 = 0;
      v14 = 0;
      goto LABEL_47;
    }
    id v13 = v34;
    v36 = objc_msgSend(v6, "hmf_UUIDForKey:", v13);
    uint64_t v37 = [v9 accessoryWithUUID:v36];
    id v20 = (void *)v37;
    if (v37)
    {
      if (!v9)
      {
        v54 = (void *)MEMORY[0x230FBD990]();
        v55 = self;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v79 = HMFGetLogIdentifier();
          id objb = [v20 uuid];
          [objb UUIDString];
          v63 = v71 = v55;
          v61 = [v8 name];
          [v8 uuid];
          v76 = v54;
          v58 = v57 = v20;
          [v58 UUIDString];
          *(_DWORD *)buf = 138544130;
          v96 = v79;
          __int16 v97 = 2112;
          id v98 = v63;
          __int16 v99 = 2112;
          v100 = v61;
          v102 = __int16 v101 = 2112;
          v59 = (void *)v102;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Attempting to remove target %@ for a controller %@/%@ that is not configured with a home", buf, 0x2Au);

          id v20 = v57;
          v54 = v76;

          v55 = v71;
        }

        if (v7)
        {
          v60 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
          v7[2](v7, v60, 0);
        }
LABEL_54:
        id v20 = 0;
        goto LABEL_55;
      }
      v62 = (void *)v37;
      v38 = [v9 uuid];
      v64 = v36;
      unsigned int v78 = identifierForTargetWithUUID(v36, v38);

      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id obj = [(HMDTargetControllerManager *)self configuredTargets];
      uint64_t v74 = [obj countByEnumeratingWithState:&v85 objects:v94 count:16];
      if (v74)
      {
        uint64_t v69 = *(void *)v86;
        id v81 = v13;
LABEL_21:
        uint64_t v39 = 0;
        while (1)
        {
          if (*(void *)v86 != v69) {
            objc_enumerationMutation(obj);
          }
          v40 = *(void **)(*((void *)&v85 + 1) + 8 * v39);
          v41 = [v40 identifier];
          v42 = [NSNumber numberWithUnsignedInt:v78];
          char v43 = [v41 isEqual:v42];

          if (v43) {
            break;
          }
          ++v39;
          id v13 = v81;
          if (v74 == v39)
          {
            uint64_t v74 = [obj countByEnumeratingWithState:&v85 objects:v94 count:16];
            if (v74) {
              goto LABEL_21;
            }
            goto LABEL_27;
          }
        }
        id v51 = v40;

        id v13 = v81;
        if (!v51) {
          goto LABEL_40;
        }
        v93 = v62;
        id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];
        id v92 = v51;
        v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v92 count:1];
        id v84 = 0;
        [(HMDTargetControllerManager *)self _dataForRemoveTargets:v52 outError:&v84];
        v14 = v53 = v51;
        id v19 = v84;

        id v13 = v81;
        goto LABEL_42;
      }
LABEL_27:

LABEL_40:
      id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      id v20 = 0;
    }
    else
    {
      v62 = 0;
      v64 = v36;
      id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
    v14 = 0;
LABEL_42:

    v44 = v64;
LABEL_43:

    if (v19) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
  if (v7)
  {
    v16 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v7[2](v7, v16, 0);
  }
LABEL_48:
}

- (void)handleConfigureTargets:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDTargetControllerManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDTargetControllerManager_handleConfigureTargets_responseHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __69__HMDTargetControllerManager_handleConfigureTargets_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConfigureTargets:*(void *)(a1 + 40) responseHandler:*(void *)(a1 + 48)];
}

- (id)targetConfigurationMatchingAccessory:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDTargetControllerManager *)self controller];
  id v6 = [v5 home];
  if (v6)
  {
    id v7 = [v4 uuid];
    id v8 = [v6 uuid];
    uint64_t v9 = identifierForTargetWithUUID(v7, v8);

    id v10 = [NSNumber numberWithUnsignedInt:v9];
    id v11 = [(HMDTargetControllerManager *)self targetConfigurationMatchingIdentifier:v10];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      v15 = [v4 name];
      v22 = [v4 uuid];
      v16 = [v22 UUIDString];
      [v5 name];
      v17 = v23 = v12;
      v18 = [v5 uuid];
      [v18 UUIDString];
      *(_DWORD *)buf = 138544386;
      v25 = v21;
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      v33 = __int16 v32 = 2112;
      id v19 = (void *)v33;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempting to lookup target %@/%@ for a controller %@/%@ that is not configured with a home", buf, 0x34u);

      id v12 = v23;
    }

    id v11 = 0;
  }

  return v11;
}

- (id)targetConfigurationMatchingIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HMDTargetControllerManager *)self configuredTargets];
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
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
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

- (void)updateTargets:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HMDTargetControllerManager_updateTargets___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__HMDTargetControllerManager_updateTargets___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v74 = [*(id *)(a1 + 32) controller];
  v2 = [v74 home];
  uint64_t v3 = [*(id *)(v1 + 32) targetUUIDs];
  id v4 = [MEMORY[0x263EFF9C0] setWithArray:*(void *)(v1 + 40)];
  uint64_t v69 = (void *)v3;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:v3];
  [v4 minusSet:v5];

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v6 = v4;
  v70 = v2;
  v73 = v6;
  uint64_t v76 = v1;
  uint64_t v79 = [v6 countByEnumeratingWithState:&v85 objects:v98 count:16];
  if (v79)
  {
    id obj = *(id *)v86;
    do
    {
      for (uint64_t i = 0; i != v79; ++i)
      {
        if (*(id *)v86 != obj) {
          objc_enumerationMutation(v6);
        }
        id v8 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
        if (v9)
        {
          id v10 = [v2 accessoryWithUUID:v9];
          char v11 = v10;
          if (v10)
          {
            if ([v10 isCurrentAccessory])
            {
              id v12 = (void *)MEMORY[0x230FBD990]();
              id v13 = *(id *)(v1 + 32);
              long long v14 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                long long v15 = HMFGetLogIdentifier();
                long long v16 = [v11 shortDescription];
                *(_DWORD *)buf = 138543618;
                v93 = v15;
                __int16 v94 = 2112;
                v95 = v16;
                _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@(Update) Adding current target accessory %@", buf, 0x16u);

                uint64_t v1 = v76;
              }

              [v11 configureTargetController:v74];
            }
            else
            {
              v25 = [HMDTargetConfiguration alloc];
              __int16 v26 = [*(id *)(v1 + 32) buttonConfiguration];
              uint64_t v27 = [(HMDTargetConfiguration *)v25 initWithAccessory:v11 buttonConfiguration:v26];

              uint64_t v1 = v76;
              __int16 v28 = (void *)MEMORY[0x230FBD990]();
              id v29 = *(id *)(v76 + 32);
              __int16 v30 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                v31 = HMFGetLogIdentifier();
                __int16 v32 = [v11 name];
                uint64_t v33 = [v11 uuid];
                [v33 UUIDString];
                uint64_t v34 = v71 = v28;
                *(_DWORD *)buf = 138543874;
                v93 = v31;
                __int16 v94 = 2112;
                v95 = v32;
                __int16 v96 = 2112;
                __int16 v97 = v34;
                _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@(Update) Adding target accessory %@/%@", buf, 0x20u);

                v2 = v70;
                __int16 v28 = v71;

                uint64_t v1 = v76;
              }

              v35 = *(void **)(v1 + 32);
              v91 = v27;
              v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
              [v35 _addTargets:v36];

              id v6 = v73;
            }
          }
          else
          {
            v21 = (void *)MEMORY[0x230FBD990]();
            id v22 = *(id *)(v1 + 32);
            v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v93 = v24;
              __int16 v94 = 2112;
              v95 = v8;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot look up target accessory from UUID %@ to add", buf, 0x16u);

              uint64_t v1 = v76;
            }
          }
        }
        else
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          id v18 = *(id *)(v1 + 32);
          id v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v93 = v20;
            __int16 v94 = 2112;
            v95 = v8;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Incorrectly formatted target UUID %@ to add", buf, 0x16u);
          }
        }
      }
      uint64_t v79 = [v6 countByEnumeratingWithState:&v85 objects:v98 count:16];
    }
    while (v79);
  }

  uint64_t v37 = [MEMORY[0x263EFF9C0] setWithArray:v69];
  v38 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(v1 + 40)];
  [v37 minusSet:v38];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obja = v37;
  uint64_t v80 = [obja countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v80)
  {
    uint64_t v39 = *(void *)v82;
    uint64_t v75 = *(void *)v82;
    while (2)
    {
      for (uint64_t j = 0; j != v80; ++j)
      {
        if (*(void *)v82 != v39) {
          objc_enumerationMutation(obja);
        }
        v41 = *(void **)(*((void *)&v81 + 1) + 8 * j);
        uint64_t v42 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v41];
        if (v42)
        {
          char v43 = (void *)v42;
          uint64_t v44 = [v2 accessoryWithUUID:v42];
          if (v44)
          {
            v45 = (void *)v44;
            v46 = [*(id *)(v1 + 32) targetConfigurationMatchingAccessory:v44];
            v47 = (void *)MEMORY[0x230FBD990]();
            id v48 = *(id *)(v1 + 32);
            v49 = HMFGetOSLogHandle();
            BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_INFO);
            if (!v46)
            {
              if (v50)
              {
                v65 = HMFGetLogIdentifier();
                v66 = [v45 name];
                v67 = [v45 uuid];
                v68 = [v67 UUIDString];
                *(_DWORD *)buf = 138543874;
                v93 = v65;
                __int16 v94 = 2112;
                v95 = v66;
                __int16 v96 = 2112;
                __int16 v97 = v68;
                _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Attempt to remove a target %@/%@ that cannot be looked up in target controller manager", buf, 0x20u);

                v2 = v70;
              }

              goto LABEL_47;
            }
            if (v50)
            {
              HMFGetLogIdentifier();
              id v51 = v72 = v47;
              v52 = [v45 name];
              v53 = [v45 uuid];
              v54 = [v53 UUIDString];
              *(_DWORD *)buf = 138543874;
              v93 = v51;
              __int16 v94 = 2112;
              v95 = v52;
              __int16 v96 = 2112;
              __int16 v97 = v54;
              _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@(Update) Removing target accessory %@/%@", buf, 0x20u);

              v2 = v70;
              uint64_t v1 = v76;

              v47 = v72;
            }

            v55 = *(void **)(v1 + 32);
            id v89 = v46;
            v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
            [v55 _removeTargets:v56];

            uint64_t v39 = v75;
          }
          else
          {
            v61 = (void *)MEMORY[0x230FBD990]();
            id v62 = *(id *)(v1 + 32);
            v63 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              v64 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v93 = v64;
              __int16 v94 = 2112;
              v95 = v41;
              _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@Cannot look up target accessory from UUID %@ to remove", buf, 0x16u);
            }
          }
        }
        else
        {
          v57 = (void *)MEMORY[0x230FBD990]();
          id v58 = *(id *)(v1 + 32);
          v59 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            v60 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v93 = v60;
            __int16 v94 = 2112;
            v95 = v41;
            _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Incorrectly formatted target UUID %@ to remove", buf, 0x16u);
          }
        }
      }
      uint64_t v80 = [obja countByEnumeratingWithState:&v81 objects:v90 count:16];
      if (v80) {
        continue;
      }
      break;
    }
  }
LABEL_47:
}

- (void)autoConfigureTargets
{
  uint64_t v3 = [(HMDTargetControllerManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HMDTargetControllerManager_autoConfigureTargets__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __50__HMDTargetControllerManager_autoConfigureTargets__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  uint64_t v3 = [v2 preferenceForKey:@"autoConfigureNewTargetControllers"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Preference set to auto-configure existing targets when new target controller is added - configuring them...", buf, 0xCu);
    }
    uint64_t v9 = [*(id *)(a1 + 32) controller];
    id v10 = [MEMORY[0x263EFF980] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    char v11 = objc_msgSend(v9, "home", 0);
    id v12 = [v11 accessories];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v17 supportsTargetControl])
          {
            id v18 = [[HMDTargetConfiguration alloc] initWithAccessory:v17 buttonConfiguration:0];
            [v10 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v14);
    }

    id v19 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) _addTargets:v10]);
    id v20 = *(id *)(a1 + 32);
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v28 = v22;
      __int16 v29 = 2112;
      __int16 v30 = v10;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Saving targetUUIDs after auto-configuration of targets - %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _saveTargetUUIDs];
  }
}

- (void)_saveTargetUUIDs
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  int v4 = [(HMDTargetControllerManager *)self configuredTargets];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(HMDTargetControllerManager *)self configuredTargets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 uuid];

        if (v12)
        {
          uint64_t v13 = [v11 uuid];
          uint64_t v14 = [v13 UUIDString];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [(HMDTargetControllerManager *)self controller];
  [v15 saveTargetUUIDs:v5];
}

- (void)__characteristicEventsReceived:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v26 = [a3 userInfo];
  int v4 = objc_msgSend(v26, "hmf_arrayForKey:", *MEMORY[0x263F35428]);
  uint64_t v27 = self;
  id v5 = [(HMDTargetControllerManager *)self controller];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    uint64_t v30 = *MEMORY[0x263F0D838];
    uint64_t v28 = *MEMORY[0x263F0BF08];
    __int16 v29 = v5;
    do
    {
      uint64_t v10 = 0;
      uint64_t v31 = v8;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        id v12 = [v11 serverIdentifier];
        uint64_t v13 = [v11 accessoryInstanceID];
        int v14 = [v5 matchesHAPAccessoryWithServerIdentifier:v12 instanceID:v13];

        if (v14)
        {
          uint64_t v15 = [v11 characteristicInstanceID];
          long long v16 = [v5 hmdCharacteristicForInstanceId:v15];

          long long v17 = [v16 service];
          long long v18 = [v17 accessory];
          if (v18)
          {
            id v19 = [v17 type];
            if (![v19 isEqualToString:v30]) {
              goto LABEL_14;
            }
            [v16 type];
            uint64_t v20 = v9;
            id v22 = v21 = v6;
            int v23 = [v22 isEqualToString:v28];

            id v6 = v21;
            uint64_t v9 = v20;
            id v5 = v29;

            if (v23)
            {
              long long v24 = [v11 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                long long v25 = v24;
              }
              else {
                long long v25 = 0;
              }
              id v19 = v25;

              [(HMDTargetControllerManager *)v27 __handleActiveIdentifierChange:v19 forCharacteristic:v16];
LABEL_14:
            }
          }

          uint64_t v8 = v31;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }
}

- (void)registerForActiveIdentifierNotifications
{
  uint64_t v3 = [(HMDTargetControllerManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDTargetControllerManager_registerForActiveIdentifierNotifications__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __70__HMDTargetControllerManager_registerForActiveIdentifierNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForActiveIdentifierNotifications];
}

- (void)_registerForActiveIdentifierNotifications
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:self selector:sel___characteristicEventsReceived_ name:*MEMORY[0x263F35420] object:0];

  long long v33 = [(HMDTargetControllerManager *)self controller];
  uint64_t v3 = [v33 services];
  int v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  *(_OWORD *)id location = 0u;
  long long v41 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:location objects:buf count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v41;
    uint64_t v8 = *MEMORY[0x263F0D838];
    uint64_t v9 = *MEMORY[0x263F0BF08];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v5);
        }
        char v11 = (void *)*((void *)location[1] + i);
        id v12 = [v11 type];
        int v13 = [v12 isEqualToString:v8];

        if (v13)
        {
          int v14 = [v11 findCharacteristicWithType:v9];
          if (v14) {
            [v4 addObject:v14];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:location objects:buf count:16];
    }
    while (v6);
  }

  uint64_t v15 = (void *)[v4 copy];
  if ([v15 count])
  {
    long long v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v46 = v19;
      __int16 v47 = 2112;
      id v48 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Registering for notification on active selection characteristics: %@", buf, 0x16u);
    }
    [v33 enableNotification:1 forCharacteristics:v15 message:0 clientIdentifier:@"com.apple.HomeKitDaemon.targetControl"];
    uint64_t v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v21 = v15;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v25 = +[HMDCharacteristicRequest requestWithCharacteristic:*(void *)(*((void *)&v36 + 1) + 8 * j)];
          [v20 addObject:v25];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v22);
    }

    id inited = objc_initWeak(location, v17);
    uint64_t v27 = (void *)MEMORY[0x230FBD990](inited);
    uint64_t v28 = v17;
    HMFGetOSLogHandle();
    __int16 v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Refreshing the active selections on the controller", buf, 0xCu);
    }
    uint64_t v31 = [(HMDTargetControllerManager *)v28 workQueue];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __71__HMDTargetControllerManager__registerForActiveIdentifierNotifications__block_invoke;
    v34[3] = &unk_264A2E9A8;
    objc_copyWeak(&v35, location);
    [v33 readCharacteristicValues:v20 source:7 queue:v31 completionHandler:v34];

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);
  }
}

void __71__HMDTargetControllerManager__registerForActiveIdentifierNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleActiveIdentifierReadResponses:v5];
  }
}

- (void)_handleActiveIdentifierReadResponses:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    uint64_t v24 = *MEMORY[0x263F0D838];
    uint64_t v21 = *MEMORY[0x263F0BF08];
    uint64_t v22 = self;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      uint64_t v26 = v5;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        uint64_t v9 = [v8 request];
        uint64_t v10 = [v9 characteristic];

        char v11 = [v10 service];
        id v12 = [v11 accessory];
        id v13 = [v8 error];
        if (v13) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v12 == 0;
        }
        if (v14) {
          goto LABEL_19;
        }
        id v13 = [v12 uuid];
        uint64_t v15 = [(HMDTargetControllerManager *)self controller];
        long long v16 = [v15 uuid];
        if (![v13 isEqual:v16]) {
          goto LABEL_18;
        }
        long long v17 = [v11 type];
        if (![v17 isEqualToString:v24])
        {

LABEL_18:
          uint64_t v6 = v25;
          uint64_t v5 = v26;
          goto LABEL_19;
        }
        long long v18 = [v10 type];
        int v23 = [v18 isEqualToString:v21];

        self = v22;
        uint64_t v6 = v25;
        uint64_t v5 = v26;
        if (!v23) {
          goto LABEL_20;
        }
        id v19 = [v8 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
        id v13 = v20;

        self = v22;
        [(HMDTargetControllerManager *)v22 __handleActiveIdentifierChange:v13 forCharacteristic:v10];
LABEL_19:

LABEL_20:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }
}

- (void)__handleActiveIdentifierChange:(id)a3 forCharacteristic:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 service];
  uint64_t v9 = [v8 accessory];
  if (v6)
  {
    if ([v6 unsignedIntegerValue])
    {
      uint64_t v10 = [(HMDTargetControllerManager *)self targetConfigurationMatchingIdentifier:v6];
      if (!v10)
      {
        char v11 = (void *)MEMORY[0x230FBD990]();
        id v12 = self;
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = HMFGetLogIdentifier();
          [v9 name];
          BOOL v14 = v22 = v11;
          [v8 instanceID];
          *(_DWORD *)buf = 138544130;
          uint64_t v26 = v21;
          __int16 v27 = 2112;
          id v28 = v6;
          __int16 v29 = 2112;
          id v30 = v14;
          uint64_t v32 = v31 = 2112;
          uint64_t v15 = (void *)v32;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Unable to look up target for identifier %@ while reading activeIdentifier characteristic %@/%@", buf, 0x2Au);

          char v11 = v22;
        }
      }
      int v23 = @"activeIdentifier";
      id v24 = v6;
      long long v16 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [(HMDTargetControllerManager *)self _postSelectionChangeNotification:1 object:v8 userInfo:v16];
    }
    else
    {
      [(HMDTargetControllerManager *)self _postSelectionChangeNotification:0 object:v8 userInfo:0];
    }
  }
  else
  {
    long long v17 = (void *)MEMORY[0x230FBD990]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = 0;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Received a non-number (%@) for activeIdentifier characteristic %@", buf, 0x20u);
    }
  }
}

- (void)acknowledgeTargetControlService:(id)a3 active:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(HMDTargetControllerManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDTargetControllerManager_acknowledgeTargetControlService_active___block_invoke;
  block[3] = &unk_264A2DFC8;
  id v10 = v6;
  char v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __69__HMDTargetControllerManager_acknowledgeTargetControlService_active___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v1 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x263EFF980];
  uint64_t v3 = [v1 characteristics];
  uint64_t v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = [v1 characteristics];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:buf count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    uint64_t v9 = *MEMORY[0x263F0BF70];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        char v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        BOOL v12 = [v11 type];
        int v13 = [v12 isEqualToString:v9];

        if (v13) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:buf count:16];
    }
    while (v7);
  }

  BOOL v14 = (void *)[v4 copy];
  if ([v14 count])
  {
    uint64_t v15 = a1;
    long long v16 = [*(id *)(a1 + 40) controller];
    long long v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 40);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      if (*(unsigned char *)(a1 + 48)) {
        uint64_t v21 = @"Registering";
      }
      else {
        uint64_t v21 = @"Deregistering";
      }
      uint64_t v22 = [*(id *)(a1 + 32) accessory];
      int v23 = [v22 name];
      id v24 = [*(id *)(a1 + 32) instanceID];
      *(_DWORD *)buf = 138544130;
      long long v43 = v20;
      __int16 v44 = 2112;
      v45 = v21;
      __int16 v46 = 2112;
      __int16 v47 = v23;
      __int16 v48 = 2112;
      uint64_t v49 = v24;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@%@ for notifications from event characteristics on controller service %@/%@", buf, 0x2Au);

      uint64_t v15 = a1;
    }

    [v16 enableNotification:*(unsigned __int8 *)(v15 + 48) forCharacteristics:v14 message:0 clientIdentifier:@"com.apple.HomeKitDaemon.targetControl"];
    if (*(unsigned char *)(v15 + 48))
    {
      uint64_t v25 = [*(id *)(v15 + 32) findCharacteristicWithType:*MEMORY[0x263F0BEF8]];
      if (v25)
      {
        if (*(unsigned char *)(v15 + 48)) {
          uint64_t v26 = &unk_26E4714D0;
        }
        else {
          uint64_t v26 = 0;
        }
        __int16 v27 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v25 value:v26 authorizationData:0 type:0];
        long long v41 = v27;
        id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
        __int16 v29 = [*(id *)(v15 + 40) workQueue];
        [v16 writeCharacteristicValues:v28 source:7 queue:v29 completionHandler:0];
      }
      else
      {
        id v30 = (void *)MEMORY[0x230FBD990]();
        id v31 = *(id *)(v15 + 40);
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = HMFGetLogIdentifier();
          long long v34 = [v16 name];
          id v35 = [*(id *)(v15 + 32) instanceID];
          *(_DWORD *)buf = 138543874;
          long long v43 = v33;
          __int16 v44 = 2112;
          v45 = v34;
          __int16 v46 = 2112;
          __int16 v47 = v35;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Unable to look up active characteirstic in controller %@ service %@ for active selection acknowledgement", buf, 0x20u);
        }
      }
    }
  }
}

- (void)_resetTargets
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDTargetControllerManager *)self controller];
  uint64_t v4 = [v3 findCharacteristicType:*MEMORY[0x263F0C500] forServiceType:*MEMORY[0x263F0D840]];
  if (v4)
  {
    id v17 = 0;
    uint64_t v5 = [(HMDTargetControllerManager *)self _dataForResetTargetsWithOutError:&v17];
    id v6 = v17;
    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x230FBD990]();
      uint64_t v8 = self;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v19 = v10;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for resetting targets - error %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v15 = [(HMDTargetControllerManager *)self workQueue];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __43__HMDTargetControllerManager__resetTargets__block_invoke;
      v16[3] = &unk_264A2F3E8;
      v16[4] = self;
      [v3 writeValue:v5 toCharacteristic:v4 queue:v15 completion:v16];
    }
  }
  else
  {
    char v11 = (void *)MEMORY[0x230FBD990]();
    BOOL v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for resetting targets", buf, 0xCu);
    }
  }
}

void __43__HMDTargetControllerManager__resetTargets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      char v11 = v8;
      uint64_t v9 = "%{public}@Failed to write request for resetting targets";
LABEL_6:
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    char v11 = v8;
    uint64_t v9 = "%{public}@Successfully resetting targets";
    goto LABEL_6;
  }
}

- (id)_dataForResetTargetsWithOutError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  TLV8BufferInit();
  if (TLV8BufferAppend())
  {
    id v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    BOOL v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = 4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Encoding for reset target - operation %lu", buf, 0x16u);
    }
    id v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v15);
  }
  TLV8BufferFree();
  if (a3 && !v5)
  {
    *a3 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  }
  return v5;
}

- (void)removeTargetAccessory:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDTargetControllerManager *)self targetConfigurationMatchingAccessory:v4];
    if (v5)
    {
      id v6 = [(HMDTargetControllerManager *)self workQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __52__HMDTargetControllerManager_removeTargetAccessory___block_invoke;
      v14[3] = &unk_264A2F820;
      v14[4] = self;
      id v15 = v5;
      dispatch_async(v6, v14);
    }
    else
    {
      BOOL v7 = (void *)MEMORY[0x230FBD990]();
      uint64_t v8 = self;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = HMFGetLogIdentifier();
        char v11 = [v4 name];
        uint64_t v12 = [v4 uuid];
        __int16 v13 = [v12 UUIDString];
        *(_DWORD *)buf = 138543874;
        long long v17 = v10;
        __int16 v18 = 2112;
        long long v19 = v11;
        __int16 v20 = 2112;
        long long v21 = v13;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Attempt to remove a target %@/%@ that cannot be looked up in target controller manager", buf, 0x20u);
      }
    }
  }
}

uint64_t __52__HMDTargetControllerManager_removeTargetAccessory___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [v2 _removeTargets:v3];

  return [*(id *)(a1 + 32) _saveTargetUUIDs];
}

- (void)_removeTargets:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(HMDTargetControllerManager *)self controller];
    id v6 = [v5 findCharacteristicType:*MEMORY[0x263F0C500] forServiceType:*MEMORY[0x263F0D840]];
    if (v6)
    {
      id v49 = 0;
      uint64_t v39 = [(HMDTargetControllerManager *)self _dataForRemoveTargets:v4 outError:&v49];
      id v40 = v49;
      if (v40)
      {
        BOOL v7 = (void *)MEMORY[0x230FBD990]();
        uint64_t v8 = self;
        uint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v54 = v10;
          __int16 v55 = 2112;
          id v56 = v4;
          __int16 v57 = 2112;
          id v58 = v40;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for removing targets %@ - error %@", buf, 0x20u);
        }
        char v11 = (void *)v39;
      }
      else
      {
        uint64_t v36 = v6;
        long long v37 = v5;
        long long v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v38 = v4;
        id v17 = v4;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v52 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v46;
          do
          {
            uint64_t v21 = 0;
            uint64_t v41 = v19;
            do
            {
              if (*(void *)v46 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * v21);
              [(HMDTargetControllerManager *)self removeConfiguredTarget:v22];
              long long v23 = [v22 uuid];

              if (v23)
              {
                long long v24 = [v22 uuid];
                [v16 addObject:v24];
              }
              else
              {
                long long v25 = (void *)MEMORY[0x230FBD990]();
                long long v26 = self;
                long long v27 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  uint64_t v28 = v20;
                  long long v29 = self;
                  id v30 = v17;
                  long long v32 = v31 = v16;
                  *(_DWORD *)buf = 138543618;
                  v54 = v32;
                  __int16 v55 = 2112;
                  id v56 = v22;
                  _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Target being removed %@ does not have a UUID", buf, 0x16u);

                  long long v16 = v31;
                  id v17 = v30;
                  self = v29;
                  uint64_t v20 = v28;
                  uint64_t v19 = v41;
                }
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v52 count:16];
          }
          while (v19);
        }

        uint64_t v50 = @"HMDTargetAccessoriesUUIDKey";
        id v51 = v16;
        long long v33 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        long long v34 = [MEMORY[0x263F08A00] defaultCenter];
        id v5 = v37;
        [v34 postNotificationName:@"HMDTargetAccessoryUnconfiguredNotificationKey" object:v37 userInfo:v33];

        long long v35 = [(HMDTargetControllerManager *)self workQueue];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __45__HMDTargetControllerManager__removeTargets___block_invoke;
        v42[3] = &unk_264A2E210;
        v42[4] = self;
        id v43 = v17;
        id v6 = v36;
        id v44 = v36;
        char v11 = (void *)v39;
        [v37 writeValue:v39 toCharacteristic:v44 queue:v35 completion:v42];

        id v4 = v38;
      }
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      __int16 v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v54 = v15;
        __int16 v55 = 2112;
        id v56 = v4;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for removing targets %@", buf, 0x16u);
      }
    }
  }
}

void __45__HMDTargetControllerManager__removeTargets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v18 = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to write request for removing targets %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 48) value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = _parseTargetList(v11);
    __int16 v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      long long v23 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully removed targets %@ - response %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (id)_dataForRemoveTargets:(id)a3 outError:(id *)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [v6 count];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  TLV8BufferInit();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  TLV8BufferInit();
  unsigned __int8 v31 = 3;
  int v7 = TLV8BufferAppend();
  if (v7)
  {
    int v8 = v7;
    id v9 = 0;
  }
  else
  {
    id v24 = v6;
    long long v25 = a4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      char v12 = 0;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ((v12 & 1) != 0 && TLV8BufferAppend()
            || (objc_msgSend(v15, "identifier", v24, v25),
                long long v16 = objc_claimAutoreleasedReturnValue(),
                unsigned int v17 = [v16 unsignedIntegerValue],
                v16,
                unsigned int v26 = v17,
                TLV8BufferAppend()))
          {
            uint64_t v22 = 0;
            int v8 = 1;
            goto LABEL_18;
          }
          int v18 = (void *)MEMORY[0x230FBD990]();
          uint64_t v19 = self;
          __int16 v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            long long v33 = v21;
            __int16 v34 = 2048;
            uint64_t v35 = v31;
            __int16 v36 = 2048;
            uint64_t v37 = v26;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Encoding for remove target - operation %lu  identifier %lu", buf, 0x20u);
          }
          char v12 = 1;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v60);
    id v9 = objc_claimAutoreleasedReturnValue();
    [v9 bytes];
    [v9 length];
    int v8 = TLV8BufferAppend();
    if (v8)
    {
      id v6 = v24;
      a4 = v25;
    }
    else
    {
      uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v39);
LABEL_18:
      id v6 = v24;
      a4 = v25;

      id v9 = (id)v22;
    }
  }
  TLV8BufferFree();
  TLV8BufferFree();
  if (v8)
  {

    id v9 = 0;
  }
  if (a4 && !v9)
  {
    *a4 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  }

  return v9;
}

- (void)addTargetAccessory:(id)a3 buttonConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [(HMDTargetControllerManager *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HMDTargetControllerManager_addTargetAccessory_buttonConfiguration___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v10 = v6;
    id v11 = v7;
    char v12 = self;
    dispatch_async(v8, block);
  }
}

void __69__HMDTargetControllerManager_addTargetAccessory_buttonConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [HMDTargetConfiguration alloc];
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v5 = -[HMDTargetConfiguration initWithAccessory:buttonConfiguration:](v2, "initWithAccessory:buttonConfiguration:", *(void *)(a1 + 32));
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) buttonConfiguration];
    id v5 = [(HMDTargetConfiguration *)v3 initWithAccessory:v4 buttonConfiguration:v6];
  }
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 48);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [*(id *)(a1 + 32) name];
    int v18 = [*(id *)(a1 + 32) uuid];
    char v12 = [v18 UUIDString];
    [(HMDTargetConfiguration *)v5 buttonConfiguration];
    uint64_t v13 = v19 = v7;
    id v14 = buttonConfigurationAsString(v13);
    id v15 = [(HMFObject *)v5 shortDescription];
    *(_DWORD *)buf = 138544386;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    unsigned int v26 = v12;
    __int16 v27 = 2112;
    long long v28 = v14;
    __int16 v29 = 2112;
    long long v30 = v15;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding target accessory %@/%@ with button configuration %@ - target configuration %@", buf, 0x34u);

    id v7 = v19;
  }

  long long v16 = *(void **)(a1 + 48);
  __int16 v20 = v5;
  unsigned int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  [v16 _addTargets:v17];

  [*(id *)(a1 + 48) _saveTargetUUIDs];
}

- (void)_addTargets:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(HMDTargetControllerManager *)self controller];
    id v6 = [v5 findCharacteristicType:*MEMORY[0x263F0C500] forServiceType:*MEMORY[0x263F0D840]];
    if (v6)
    {
      id v62 = 0;
      id v7 = [(HMDTargetControllerManager *)self _dataForAddTargets:v4 outError:&v62];
      id v8 = v62;
      if (v8)
      {
        id v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          char v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v68 = v12;
          __int16 v69 = 2112;
          id v70 = v4;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for adding targets %@", buf, 0x16u);
        }
      }
      else
      {
        long long v46 = v7;
        long long v47 = v6;
        long long v48 = v5;
        id v49 = v4;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v59 = 0u;
        long long v58 = 0u;
        id v17 = v4;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v66 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v59 != v20) {
                objc_enumerationMutation(v17);
              }
              [(HMDTargetControllerManager *)self addConfiguredTarget:*(void *)(*((void *)&v58 + 1) + 8 * i)];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v66 count:16];
          }
          while (v19);
        }
        long long v45 = v17;

        uint64_t v22 = [(HMDTargetControllerManager *)self configuredTargets];
        __int16 v23 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v22, "count"));
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v24 = v22;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v65 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v55;
          do
          {
            uint64_t v28 = 0;
            uint64_t v50 = v26;
            do
            {
              if (*(void *)v55 != v27) {
                objc_enumerationMutation(v24);
              }
              __int16 v29 = *(void **)(*((void *)&v54 + 1) + 8 * v28);
              long long v30 = objc_msgSend(v29, "uuid", v45);

              if (v30)
              {
                uint64_t v31 = [v29 uuid];
                [v23 addObject:v31];
              }
              else
              {
                long long v32 = (void *)MEMORY[0x230FBD990]();
                long long v33 = self;
                __int16 v34 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  uint64_t v35 = v27;
                  __int16 v36 = self;
                  uint64_t v37 = v23;
                  long long v39 = v38 = v24;
                  *(_DWORD *)buf = 138543618;
                  long long v68 = v39;
                  __int16 v69 = 2112;
                  id v70 = v29;
                  _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Target being added %@ does not have a UUID", buf, 0x16u);

                  id v24 = v38;
                  __int16 v23 = v37;
                  self = v36;
                  uint64_t v27 = v35;
                  uint64_t v26 = v50;
                }
              }
              ++v28;
            }
            while (v26 != v28);
            uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v65 count:16];
          }
          while (v26);
        }

        long long v63 = @"HMDTargetAccessoriesUUIDKey";
        long long v64 = v23;
        long long v40 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        long long v41 = (void *)[v40 mutableCopy];

        long long v42 = [(HMDTargetControllerManager *)self __refreshedConfiguration:0];
        [v41 addEntriesFromDictionary:v42];

        long long v43 = [MEMORY[0x263F08A00] defaultCenter];
        id v5 = v48;
        [v43 postNotificationName:@"HMDTargetAccessoryConfiguredNotificationKey" object:v48 userInfo:v41];

        long long v44 = [(HMDTargetControllerManager *)self workQueue];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __42__HMDTargetControllerManager__addTargets___block_invoke;
        v51[3] = &unk_264A2E210;
        v51[4] = self;
        id v52 = v45;
        id v6 = v47;
        id v53 = v47;
        id v7 = v46;
        [v48 writeValue:v46 toCharacteristic:v53 queue:v44 completion:v51];

        id v4 = v49;
        id v8 = 0;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v68 = v16;
        __int16 v69 = 2112;
        id v70 = v4;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for adding targets %@", buf, 0x16u);
      }
    }
  }
}

void __42__HMDTargetControllerManager__addTargets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v19 = 138543874;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to write request for adding targets %@ - error %@", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    char v12 = _parseTargetList(v11);
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = [*(id *)(a1 + 32) configuredTargets];
      int v19 = 138544130;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully added targets %@ configuredTargets %@ - response %@", (uint8_t *)&v19, 0x2Au);
    }
  }
}

- (void)_postSelectionChangeNotification:(BOOL)a3 object:(id)a4 userInfo:(id)a5
{
  if (a3) {
    id v6 = @"HMDTargetControlServiceSelectedNotificationKey";
  }
  else {
    id v6 = @"HMDTargetControlServiceDeselectedNotificationKey";
  }
  id v7 = (void *)MEMORY[0x263F08A00];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 defaultCenter];
  [v10 postNotificationName:v6 object:v9 userInfo:v8];
}

- (id)_dataForAddTargets:(id)a3 outError:(id *)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDTargetControllerManager *)self buttonConfiguration];
  targetConfigurationTLVSize(v6, v7);

  memset(v69, 0, sizeof(v69));
  TLV8BufferInit();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  TLV8BufferInit();
  char v44 = 2;
  int v8 = TLV8BufferAppend();
  if (v8)
  {
    int v9 = v8;
    id v10 = 0;
  }
  else
  {
    id v38 = v6;
    long long v39 = a4;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
          long long v16 = [(HMDTargetControllerManager *)self buttonConfiguration];
          id v17 = v15;
          id v18 = v16;
          int v19 = [v17 identifier];
          LODWORD(v15) = [v19 unsignedIntegerValue];

          unsigned int v46 = v15;
          int v20 = TLV8BufferAppend();
          if (v20) {
            goto LABEL_9;
          }
          id v23 = [v17 name];
          id v24 = (const char *)[v23 UTF8String];

          if (v24)
          {
            strlen(v24);
            int v20 = TLV8BufferAppend();
            if (v20) {
              goto LABEL_9;
            }
          }
          unsigned __int16 v45 = [v17 category];
          int v20 = TLV8BufferAppend();
          if (v20)
          {
LABEL_9:
            int v21 = v20;
            uint64_t v22 = 0;
          }
          else
          {
            uint64_t v22 = [v17 buttonConfiguration];
            if (![v22 count])
            {
              id v25 = v18;

              uint64_t v22 = v25;
            }
            int v26 = __addButtonConfigurationTLV((uint64_t)v69, v22);
            if (v26)
            {
              int v21 = v26;
            }
            else
            {
              context = (void *)MEMORY[0x230FBD990]();
              uint64_t v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                __int16 v36 = HMFGetLogIdentifier();
                uint64_t v33 = v46;
                uint64_t v34 = v45;
                uint64_t v35 = [v17 buttonConfiguration];
                uint64_t v28 = buttonConfigurationAsString(v35);
                *(_DWORD *)buf = 138544386;
                uint64_t v71 = v36;
                __int16 v72 = 2048;
                uint64_t v73 = v33;
                __int16 v74 = 2080;
                long long v75 = v24;
                __int16 v76 = 2048;
                uint64_t v77 = v34;
                __int16 v78 = 2112;
                uint64_t v79 = v28;
                __int16 v29 = (void *)v28;
                _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding TLVs for add target operation - identifier %lu  name %s  category %lu  buttonConfiguration: %@", buf, 0x34u);
              }
              int v21 = 0;
            }
          }

          if (v21)
          {
            uint64_t v31 = 0;
            int v9 = 1;
            goto LABEL_27;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v30 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16];
        uint64_t v12 = v30;
      }
      while (v30);
    }

    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v69[0]);
    id v10 = objc_claimAutoreleasedReturnValue();
    [v10 bytes];
    [v10 length];
    int v9 = TLV8BufferAppend();
    if (v9)
    {
      id v6 = v38;
      a4 = v39;
    }
    else
    {
      uint64_t v31 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v48);
LABEL_27:
      id v6 = v38;
      a4 = v39;

      id v10 = (id)v31;
    }
  }
  TLV8BufferFree();
  TLV8BufferFree();
  if (v9)
  {

    id v10 = 0;
  }
  if (a4 && !v10)
  {
    *a4 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  }

  return v10;
}

- (void)updateTargetAccessory:(id)a3 name:(id)a4 buttonConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDTargetControllerManager *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__HMDTargetControllerManager_updateTargetAccessory_name_buttonConfiguration___block_invoke;
  v15[3] = &unk_264A2E610;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __77__HMDTargetControllerManager_updateTargetAccessory_name_buttonConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) targetConfigurationMatchingAccessory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateName:*(void *)(a1 + 48) buttonConfiguration:*(void *)(a1 + 56) target:v2];
}

- (void)_updateName:(id)a3 buttonConfiguration:(id)a4 target:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8 || [v9 count])
    {
      uint64_t v11 = [(HMDTargetControllerManager *)self controller];
      id v12 = [v11 findCharacteristicType:*MEMORY[0x263F0C500] forServiceType:*MEMORY[0x263F0D840]];
      if (v12)
      {
        id v51 = 0;
        id v13 = [(HMDTargetControllerManager *)self _dataForUpdateTarget:v10 name:v8 buttonConfiguration:v9 outError:&v51];
        id v14 = v51;
        if (v14)
        {
          context = (void *)MEMORY[0x230FBD990]();
          id v15 = self;
          id v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v17 = v40 = v12;
            [v10 name];
            id v18 = v38 = v14;
            [v10 identifier];
            int v19 = v39 = v13;
            buttonConfigurationAsString(v9);
            int v20 = v41 = v11;
            LODWORD(buf[0]) = 138544386;
            *(void *)((char *)buf + 4) = v17;
            WORD6(buf[0]) = 2112;
            *(void *)((char *)buf + 14) = v18;
            WORD3(buf[1]) = 2112;
            *((void *)&buf[1] + 1) = v19;
            LOWORD(buf[2]) = 2112;
            *(void *)((char *)&buf[2] + 2) = v8;
            WORD5(buf[2]) = 2112;
            *(void *)((char *)&buf[2] + 12) = v20;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize request for updating %@/%@ with name %@  buttonConfiguration %@", (uint8_t *)buf, 0x34u);

            id v13 = v39;
            id v14 = v38;

            uint64_t v11 = v41;
            id v12 = v40;
          }
        }
        else if ([v13 length])
        {
          memset(buf, 0, sizeof(buf));
          buttonConfigurationTLVSize(v9);
          TLV8BufferInit();
          char v50 = 5;
          if (TLV8BufferAppend()
            || (id v33 = v13,
                [v33 bytes],
                uint64_t v34 = v33,
                id v14 = 0,
                [v34 length],
                TLV8BufferAppend()))
          {
            TLV8BufferFree();
          }
          else
          {
            objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf[0]);
            v36 = uint64_t v35 = v11;
            TLV8BufferFree();
            uint64_t v37 = [(HMDTargetControllerManager *)self workQueue];
            v45[0] = MEMORY[0x263EF8330];
            v45[1] = 3221225472;
            v45[2] = __69__HMDTargetControllerManager__updateName_buttonConfiguration_target___block_invoke;
            v45[3] = &unk_264A1D1E8;
            v45[4] = self;
            id v46 = v10;
            id v47 = v8;
            id v48 = v9;
            id v49 = v12;
            [v35 writeValue:v36 toCharacteristic:v49 queue:v37 completion:v45];

            id v14 = 0;
            uint64_t v11 = v35;
          }
        }
      }
      else
      {
        int v26 = (void *)MEMORY[0x230FBD990]();
        uint64_t v27 = self;
        uint64_t v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          __int16 v29 = v42 = v11;
          uint64_t v30 = [v10 name];
          uint64_t v31 = [v10 identifier];
          buttonConfigurationAsString(v9);
          long long v32 = contexta = v26;
          LODWORD(buf[0]) = 138544386;
          *(void *)((char *)buf + 4) = v29;
          WORD6(buf[0]) = 2112;
          *(void *)((char *)buf + 14) = v30;
          WORD3(buf[1]) = 2112;
          *((void *)&buf[1] + 1) = v31;
          LOWORD(buf[2]) = 2112;
          *(void *)((char *)&buf[2] + 2) = v8;
          WORD5(buf[2]) = 2112;
          *(void *)((char *)&buf[2] + 12) = v32;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Failed to look up target list characteristic for updating %@/%@ with name %@  buttonConfiguration %@", (uint8_t *)buf, 0x34u);

          id v12 = 0;
          int v26 = contexta;

          uint64_t v11 = v42;
        }
      }
    }
  }
  else
  {
    int v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      id v25 = buttonConfigurationAsString(v9);
      LODWORD(buf[0]) = 138543874;
      *(void *)((char *)buf + 4) = v24;
      WORD6(buf[0]) = 2112;
      *(void *)((char *)buf + 14) = v8;
      WORD3(buf[1]) = 2112;
      *((void *)&buf[1] + 1) = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Request to update name %@  buttonConfiguration %@ for a nil target", (uint8_t *)buf, 0x20u);
    }
  }
}

void __69__HMDTargetControllerManager__updateName_buttonConfiguration_target___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) name];
      id v9 = [*(id *)(a1 + 40) identifier];
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = buttonConfigurationAsString(*(void **)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      uint64_t v28 = v7;
      __int16 v29 = 2112;
      uint64_t v30 = v8;
      __int16 v31 = 2112;
      long long v32 = v9;
      __int16 v33 = 2112;
      uint64_t v34 = v10;
      __int16 v35 = 2112;
      __int16 v36 = v11;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to write request for updating %@/%@ with name %@  buttonConfiguration %@", buf, 0x34u);
    }
  }
  else
  {
    id v12 = [*(id *)(a1 + 64) value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    id v15 = _parseTargetList(v14);
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = HMFGetLogIdentifier();
      int v20 = [*(id *)(a1 + 40) name];
      int v21 = [*(id *)(a1 + 40) identifier];
      id v26 = v14;
      uint64_t v22 = v15;
      id v23 = v16;
      uint64_t v24 = *(void *)(a1 + 48);
      id v25 = buttonConfigurationAsString(*(void **)(a1 + 56));
      *(_DWORD *)buf = 138544642;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      long long v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v24;
      id v16 = v23;
      id v15 = v22;
      id v14 = v26;
      __int16 v35 = 2112;
      __int16 v36 = v25;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully updated %@/%@ with name %@  buttonConfiguration %@ - response %@", buf, 0x3Eu);
    }
  }
}

- (id)_dataForUpdateTarget:(id)a3 name:(id)a4 buttonConfiguration:(id)a5 outError:(id *)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v11 || [v12 count])
  {
    __int16 v36 = v13;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v14 = [(HMDTargetControllerManager *)self configuredTargets];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          int v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          int v20 = [v10 identifier];
          int v21 = [v19 identifier];
          char v22 = [v20 isEqual:v21];

          if (v22)
          {

            memset(v51, 0, sizeof(v51));
            id v50 = v10;
            uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
            id v13 = v36;
            targetConfigurationTLVSize(v24, v36);

            TLV8BufferInit();
            id v25 = [v10 identifier];
            unsigned int v26 = [v25 unsignedIntegerValue];

            unsigned int v37 = v26;
            if (TLV8BufferAppend()
              || (id v27 = v11, v28 = (const char *)[v27 UTF8String], v11)
              && (strlen(v28), uint64_t v28 = (const char *)TLV8BufferAppend(), v28)
              || v36 && (uint64_t v28 = (const char *)__addButtonConfigurationTLV((uint64_t)v51, v36), v28))
            {
              id v23 = 0;
            }
            else
            {
              __int16 v29 = (void *)MEMORY[0x230FBD990](v28);
              id v30 = v35;
              __int16 v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                long long v32 = HMFGetLogIdentifier();
                __int16 v33 = buttonConfigurationAsString(v36);
                *(_DWORD *)buf = 138544130;
                long long v43 = v32;
                __int16 v44 = 2048;
                uint64_t v45 = v37;
                __int16 v46 = 2112;
                id v47 = v27;
                __int16 v48 = 2112;
                id v49 = v33;
                _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Encoding for update target - identifier %lu  updatedName %@  buttonConfiguration: %@", buf, 0x2Au);

                id v13 = v36;
              }

              id v23 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v51[0]);
            }
            TLV8BufferFree();
            if (a6 && !v23)
            {
              *a6 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
            }
            goto LABEL_29;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    if (a6)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:2];
      id v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = 0;
    }
    id v13 = v36;
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:3];
    id v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }
LABEL_29:

  return v23;
}

- (void)updateButtonConfigurationForTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMDTargetControllerManager_updateButtonConfigurationForTarget___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HMDTargetControllerManager_updateButtonConfigurationForTarget___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "configuredTargets", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 40) identifier];
        id v9 = [v7 identifier];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          id v11 = [*(id *)(a1 + 40) buttonConfiguration];
          [v7 setButtonConfiguration:v11];

          id v12 = (void *)MEMORY[0x230FBD990]();
          id v13 = *(id *)(a1 + 32);
          id v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            int v21 = v15;
            __int16 v22 = 2112;
            id v23 = v7;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Updated the button configuration for target %@", buf, 0x16u);
          }
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_auditTargets:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDTargetControllerManager *)self configuredTargets];
  id v6 = (void *)[v5 copy];

  id v47 = [MEMORY[0x263EFFA08] setWithArray:v4];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    long long v66 = v10;
    __int16 v67 = 2112;
    id v68 = v4;
    __int16 v69 = 2112;
    id v70 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Read targets %@, Configured targets %@", buf, 0x20u);
  }
  __int16 v46 = v6;
  id v11 = (void *)[v6 mutableCopy];
  [v11 intersectSet:v47];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        long long v17 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v4, "indexOfObject:", v16));
        long long v18 = [v16 name];
        long long v19 = [v17 name];
        char v20 = HMFEqualObjects();

        if ((v20 & 1) == 0)
        {
          int v21 = [v16 name];
          [(HMDTargetControllerManager *)v8 _updateName:v21 buttonConfiguration:0 target:v16];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v13);
  }

  __int16 v22 = (void *)[v46 mutableCopy];
  [v22 minusSet:v47];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v48 = v22;
  uint64_t v23 = [v48 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v48);
        }
        id v27 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        uint64_t v28 = (void *)MEMORY[0x230FBD990]();
        __int16 v29 = v8;
        id v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v66 = v31;
          __int16 v67 = 2112;
          id v68 = v27;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Target %@ not present in controller's target list - adding...", buf, 0x16u);
        }
      }
      uint64_t v24 = [v48 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v24);
  }
  uint64_t v45 = v4;

  long long v32 = [v48 allObjects];
  [(HMDTargetControllerManager *)v8 _addTargets:v32];

  __int16 v33 = (void *)[v47 mutableCopy];
  [v33 minusSet:v46];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = *(void **)(*((void *)&v50 + 1) + 8 * k);
        long long v40 = (void *)MEMORY[0x230FBD990]();
        long long v41 = v8;
        long long v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          long long v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v66 = v43;
          __int16 v67 = 2112;
          id v68 = v39;
          _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Target %@ present in controller's target list - removing...", buf, 0x16u);
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v36);
  }

  __int16 v44 = [v34 allObjects];
  [(HMDTargetControllerManager *)v8 _removeTargets:v44];
}

- (void)_listTargetsWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, id, void))a3;
  uint64_t v5 = [(HMDTargetControllerManager *)self controller];
  id v6 = [v5 findCharacteristicType:*MEMORY[0x263F0C500] forServiceType:*MEMORY[0x263F0D840]];
  if (v6)
  {
    id v22 = 0;
    id v7 = [(HMDTargetControllerManager *)self _dataForListTargetsWithOutError:&v22];
    id v8 = v22;
    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      int v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Unable to generate serialized data for listing targets - error %@", buf, 0x16u);
      }
      if (v4) {
        v4[2](v4, v8, 0);
      }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      long long v17 = [(HMDTargetControllerManager *)self workQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __64__HMDTargetControllerManager__listTargetsWithCompletionHandler___block_invoke;
      v18[3] = &unk_264A2DE38;
      objc_copyWeak(&v21, (id *)buf);
      char v20 = v4;
      id v19 = v6;
      [v5 writeValue:v7 toCharacteristic:v19 queue:v17 completion:v18];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_13;
  }
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    long long v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v16;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@No Target List characteristic to audit configured target accessories - skipping", buf, 0xCu);
  }
  if (v4)
  {
    id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v4[2](v4, v8, 0);
LABEL_13:
  }
}

void __64__HMDTargetControllerManager__listTargetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    BOOL v5 = WeakRetained == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (v12)
    {
      (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v12, 0);
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;

      id v9 = _parseTargetList(v8);

      id v10 = 0;
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v10, v9);
      }
    }
  }
}

- (id)_dataForListTargetsWithOutError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  TLV8BufferInit();
  if (TLV8BufferAppend())
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = 1;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Encoding for list target - operation %lu", buf, 0x16u);
    }
    BOOL v5 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v15);
  }
  TLV8BufferFree();
  if (a3 && !v5)
  {
    *a3 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  }
  return v5;
}

- (void)_refreshConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__81361;
  v26[4] = __Block_byref_object_dispose__81362;
  id v27 = 0;
  dispatch_group_enter(v5);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke;
  v23[3] = &unk_264A24018;
  long long v25 = v26;
  id v6 = v5;
  long long v24 = v6;
  [(HMDTargetControllerManager *)self _readSupportedConfigurationWithCompletion:v23];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__81361;
  v21[4] = __Block_byref_object_dispose__81362;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__81361;
  v19[4] = __Block_byref_object_dispose__81362;
  id v20 = 0;
  dispatch_group_enter(v6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_2;
  v15[3] = &unk_264A1D198;
  long long v17 = v21;
  long long v18 = v19;
  id v7 = v6;
  long long v16 = v7;
  [(HMDTargetControllerManager *)self _listTargetsWithCompletionHandler:v15];
  id v8 = [(HMDTargetControllerManager *)self workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_3;
  v10[3] = &unk_264A1D1C0;
  v10[4] = self;
  id v11 = v4;
  id v12 = v19;
  __int16 v13 = v26;
  uint64_t v14 = v21;
  id v9 = v4;
  dispatch_group_notify(v7, v8, v10);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v26, 8);
}

void __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__HMDTargetControllerManager__refreshConfigurationWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 32) maximumTargets];
    uint64_t v7 = [*(id *)(a1 + 32) ticksPerSecond];
    id v8 = [*(id *)(a1 + 32) buttonConfiguration];
    uint64_t v9 = buttonConfigurationAsString(v8);
    int v12 = 138544130;
    __int16 v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    long long v19 = v9;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying supported configuration: Maximum Targets: %lu  Ticks Per Second: %lu  Buttons: %@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 32) _notifyConfigurationRefresh:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v11) {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v11);
  }
  return result;
}

- (void)_readSupportedConfigurationWithCompletion:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self controller];
  uint64_t v6 = [v5 findCharacteristicType:*MEMORY[0x263F0C478] forServiceType:*MEMORY[0x263F0D840]];
  if (v6)
  {
    uint64_t v7 = +[HMDCharacteristicRequest requestWithCharacteristic:v6];
    __int16 v18 = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];

    objc_initWeak(location, self);
    uint64_t v9 = [(HMDTargetControllerManager *)self workQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__HMDTargetControllerManager__readSupportedConfigurationWithCompletion___block_invoke;
    v14[3] = &unk_264A1D170;
    objc_copyWeak(&v17, location);
    id v16 = v4;
    id v15 = v6;
    [v5 readCharacteristicValues:v8 source:7 queue:v9 completionHandler:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
LABEL_7:

    goto LABEL_8;
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = HMFGetLogIdentifier();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@No Supported target Configuration characteristic to refresh the configuration for the controller", (uint8_t *)location, 0xCu);
  }
  if (v4)
  {
    id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
    goto LABEL_7;
  }
LABEL_8:
}

void __72__HMDTargetControllerManager__readSupportedConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([v3 count])
    {
      id v5 = [v3 firstObject];
      uint64_t v6 = [v5 request];
      uint64_t v7 = [v6 characteristic];

      id v8 = [v5 error];

      if (v8)
      {
        uint64_t v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = WeakRetained;
        uint64_t v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = HMFGetLogIdentifier();
          __int16 v13 = [v5 error];
          *(_DWORD *)buf = 138543874;
          long long v60 = v12;
          __int16 v61 = 2112;
          unint64_t v62 = (unint64_t)v13;
          __int16 v63 = 2112;
          uint64_t v64 = (uint64_t)v7;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Error %@ response for reading characteristic %@", buf, 0x20u);
        }
        uint64_t v14 = *(void *)(a1 + 40);
        if (!v14) {
          goto LABEL_40;
        }
        id v15 = [v5 error];
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
      }
      else
      {
        long long v26 = [v7 type];
        int v27 = [v26 isEqualToString:*MEMORY[0x263F0C478]];

        if (v27)
        {
          long long v28 = [v7 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v29 = v28;
          }
          else {
            long long v29 = 0;
          }
          id v30 = v29;

          int v31 = [WeakRetained _parseSupportedTargetConfiguration:v30];
          if (v31)
          {
            int v32 = v31;
            if (v31 == -6727)
            {
              long long v33 = (void *)MEMORY[0x230FBD990]();
              id v34 = WeakRetained;
              long long v35 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                uint64_t v36 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                long long v60 = v36;
                _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@No data to parse for supported configuration", buf, 0xCu);
              }
              uint64_t v37 = (void *)MEMORY[0x263F087E8];
              uint64_t v38 = 74;
            }
            else
            {
              id v49 = (void *)MEMORY[0x230FBD990]();
              id v50 = WeakRetained;
              long long v51 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v52 = long long v58 = v49;
                *(_DWORD *)buf = 138543618;
                long long v60 = v52;
                __int16 v61 = 2048;
                unint64_t v62 = v32;
                _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Parsing supported configuration data failed with error %lu", buf, 0x16u);

                id v49 = v58;
              }

              uint64_t v37 = (void *)MEMORY[0x263F087E8];
              uint64_t v38 = 50;
            }
            id v15 = [v37 hmErrorWithCode:v38];
          }
          else
          {
            __int16 v44 = (void *)MEMORY[0x230FBD990]();
            id v45 = WeakRetained;
            __int16 v46 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              id v47 = HMFGetLogIdentifier();
              unint64_t v55 = [v45 maximumTargets];
              uint64_t v54 = [v45 ticksPerSecond];
              long long v56 = [v45 buttonConfiguration];
              buttonConfigurationAsString(v56);
              id v48 = v57 = v44;
              *(_DWORD *)buf = 138544130;
              long long v60 = v47;
              __int16 v61 = 2048;
              unint64_t v62 = v55;
              __int16 v63 = 2048;
              uint64_t v64 = v54;
              __int16 v65 = 2112;
              long long v66 = v48;
              _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Refreshed supported configuration: Maximum Targets: %lu  Ticks Per Second: %lu  Buttons: %@", buf, 0x2Au);

              __int16 v44 = v57;
            }

            id v15 = 0;
          }
        }
        else
        {
          long long v39 = (void *)MEMORY[0x230FBD990]();
          id v40 = WeakRetained;
          long long v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            long long v42 = HMFGetLogIdentifier();
            unint64_t v43 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            long long v60 = v42;
            __int16 v61 = 2112;
            unint64_t v62 = v43;
            __int16 v63 = 2112;
            uint64_t v64 = (uint64_t)v7;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Got unexpected response - attempting to read %@, got %@", buf, 0x20u);
          }
          id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:74];
        }
        uint64_t v53 = *(void *)(a1 + 40);
        if (v53) {
          (*(void (**)(uint64_t, void *))(v53 + 16))(v53, v15);
        }
      }

LABEL_40:
      goto LABEL_41;
    }
    id v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = WeakRetained;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v60 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@No responses refreshing controller configuration", buf, 0xCu);
    }
    uint64_t v19 = *(void *)(a1 + 40);
    if (v19)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = 59;
      goto LABEL_16;
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v60 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Accessory not found for reading supported target configuration characteristic", buf, 0xCu);
    }
    uint64_t v19 = *(void *)(a1 + 40);
    if (v19)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = 2;
LABEL_16:
      id v5 = [v20 hmErrorWithCode:v21];
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v5);
LABEL_41:
    }
  }
}

- (void)refreshConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMDTargetControllerManager_refreshConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__HMDTargetControllerManager_refreshConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshConfigurationWithCompletion:*(void *)(a1 + 40)];
}

- (void)_notifyConfigurationRefresh:(id)a3
{
  id v4 = a3;
  [(HMDTargetControllerManager *)self _auditTargets:v4];
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  id v5 = [(HMDTargetControllerManager *)self controller];
  id v6 = [(HMDTargetControllerManager *)self __refreshedConfiguration:v4];

  [v7 postNotificationName:@"HMDTargetControllerAccessoryConfigurationUpdatedNotificationKey" object:v5 userInfo:v6];
}

- (id)__refreshedConfiguration:(id)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDTargetControllerManager *)self configurationRefreshed])
  {
    if (v4)
    {
      v19[0] = @"ticksPerSecond";
      id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDTargetControllerManager ticksPerSecond](self, "ticksPerSecond"));
      v20[0] = v5;
      v19[1] = @"buttonConfiguration";
      uint64_t v6 = [(HMDTargetControllerManager *)self buttonConfiguration];
      id v7 = (void *)v6;
      uint64_t v8 = MEMORY[0x263EFFA68];
      if (v6) {
        uint64_t v8 = v6;
      }
      v19[2] = @"targetConfiguration";
      v20[1] = v8;
      v20[2] = v4;
      uint64_t v9 = NSDictionary;
      id v10 = v20;
      uint64_t v11 = v19;
      uint64_t v12 = 3;
    }
    else
    {
      v17[0] = @"ticksPerSecond";
      id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDTargetControllerManager ticksPerSecond](self, "ticksPerSecond"));
      v17[1] = @"buttonConfiguration";
      v18[0] = v5;
      uint64_t v14 = [(HMDTargetControllerManager *)self buttonConfiguration];
      id v7 = (void *)v14;
      uint64_t v15 = MEMORY[0x263EFFA68];
      if (v14) {
        uint64_t v15 = v14;
      }
      v18[1] = v15;
      uint64_t v9 = NSDictionary;
      id v10 = v18;
      uint64_t v11 = v17;
      uint64_t v12 = 2;
    }
    __int16 v13 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x263EFFA78];
  }

  return v13;
}

- (int)_parseSupportedTargetConfiguration:(id)a3
{
  id v4 = a3;
  int v25 = 0;
  if (![v4 length])
  {
    int v11 = -6727;
    goto LABEL_24;
  }
  id v5 = v4;
  [v5 bytes];
  [v5 length];
  uint64_t v6 = 0;
  BOOL v7 = 0;
  char v24 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = 0;
  unsigned __int8 v8 = 16;
  uint64_t v9 = 1000;
  while (2)
  {
    if (TLV8GetNext())
    {
      uint64_t v15 = (uint64_t)v6;
      goto LABEL_20;
    }
    switch(v24)
    {
      case 1:
        unsigned __int8 UInt64 = TLV8GetUInt64();
        int v11 = v25;
        if (v25) {
          goto LABEL_23;
        }
        unsigned __int8 v8 = UInt64;
        continue;
      case 2:
        unint64_t v12 = TLV8GetUInt64();
        if (v12 <= 0x3E8) {
          uint64_t v9 = 1000;
        }
        else {
          uint64_t v9 = v12;
        }
        goto LABEL_16;
      case 3:
        uint64_t v20 = 0;
        int v13 = TLV8GetOrCopyCoalesced();
        int v25 = v13;
        if (v13)
        {
          int v11 = v13;
          goto LABEL_23;
        }
        uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
        id v19 = 0;
        uint64_t v15 = _parseTargetButtonConfiguration(v14, (uint64_t)&v19);
        id v16 = v19;

        if (v20)
        {
          free(v20);
          uint64_t v20 = 0;
        }
        if (!v16)
        {

          uint64_t v6 = (void *)v15;
          continue;
        }
        int v25 = -6742;

LABEL_20:
        int v11 = v25;
        if (!v25)
        {
          [(HMDTargetControllerManager *)self setMaximumTargets:v8];
          [(HMDTargetControllerManager *)self setTicksPerSecond:v9];
          [(HMDTargetControllerManager *)self setButtonConfiguration:v15];
          id v17 = [(HMDTargetControllerManager *)self controller];
          [v17 saveHardwareSupport:v7];

          [(HMDTargetControllerManager *)self setConfigurationRefreshed:1];
          int v11 = v25;
        }
        uint64_t v6 = (void *)v15;
LABEL_23:

LABEL_24:
        return v11;
      case 4:
        BOOL v7 = TLV8GetUInt64() == 1;
LABEL_16:
        int v11 = v25;
        if (!v25) {
          continue;
        }
        goto LABEL_23;
      default:
        continue;
    }
  }
}

- (void)__accessoryRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HMDTargetControllerManager___accessoryRemoved___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HMDTargetControllerManager___accessoryRemoved___block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v5 name];
    int v11 = [v5 uuid];
    unint64_t v12 = [v11 UUIDString];
    *(_DWORD *)buf = 138543874;
    uint64_t v71 = v9;
    __int16 v72 = 2112;
    uint64_t v73 = v10;
    __int16 v74 = 2112;
    uint64_t v75 = (uint64_t)v12;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that an accessory %@/%@ has been removed from the home", buf, 0x20u);
  }
  int v13 = [*(id *)(a1 + 40) controller];
  uint64_t v14 = [v13 uuid];
  uint64_t v15 = [v5 uuid];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 40);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v71 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Received notification that controller has been removed from the home - invalidating...", buf, 0xCu);
    }
    [*(id *)(a1 + 40) invalidate];
  }
  else if ([v5 supportsTargetControl])
  {
    uint64_t v21 = [v13 home];
    if (v21)
    {
      long long v58 = v13;
      uint64_t v22 = [v5 uuid];
      __int16 v61 = v21;
      uint64_t v23 = [v21 uuid];
      uint64_t v24 = identifierForTargetWithUUID(v22, v23);

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = [*(id *)(a1 + 40) configuredTargets];
      uint64_t v25 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v65;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v65 != v27) {
              objc_enumerationMutation(obj);
            }
            long long v29 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            id v30 = [v29 identifier];
            int v31 = [NSNumber numberWithUnsignedInt:v24];
            int v32 = [v30 isEqual:v31];

            if (v32)
            {
              id v40 = (void *)MEMORY[0x230FBD990]();
              id v41 = *(id *)(a1 + 40);
              long long v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                unint64_t v43 = HMFGetLogIdentifier();
                __int16 v44 = [v5 name];
                id v45 = [v5 uuid];
                __int16 v46 = [v45 UUIDString];
                *(_DWORD *)buf = 138543874;
                uint64_t v71 = v43;
                __int16 v72 = 2112;
                uint64_t v73 = v44;
                __int16 v74 = 2112;
                uint64_t v75 = (uint64_t)v46;
                _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Received notification that target accessory %@/%@ has been removed", buf, 0x20u);
              }
              id v47 = *(void **)(a1 + 40);
              id v68 = v29;
              id v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
              [v47 _removeTargets:v48];

              [*(id *)(a1 + 40) _saveTargetUUIDs];
              goto LABEL_27;
            }
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      int v13 = v58;
      uint64_t v21 = v61;
    }
    else
    {
      id v49 = (void *)MEMORY[0x230FBD990]();
      id v50 = *(id *)(a1 + 40);
      long long v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        long long v59 = HMFGetLogIdentifier();
        long long v52 = [v5 name];
        long long v60 = [v5 uuid];
        uint64_t v53 = [v60 UUIDString];
        [v13 name];
        v54 = id obja = v49;
        unint64_t v55 = [v13 uuid];
        long long v56 = [v55 UUIDString];
        *(_DWORD *)buf = 138544386;
        uint64_t v71 = v59;
        __int16 v72 = 2112;
        uint64_t v73 = v52;
        __int16 v74 = 2112;
        uint64_t v75 = v53;
        long long v57 = (void *)v53;
        __int16 v76 = 2112;
        uint64_t v77 = v54;
        __int16 v78 = 2112;
        uint64_t v79 = v56;
        uint64_t v21 = 0;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process accessory %@/%@ removal for a controller %@/%@ that is not configured with a home", buf, 0x34u);

        id v49 = obja;
      }
    }
  }
  else
  {
    long long v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = *(id *)(a1 + 40);
    long long v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      uint64_t v37 = [v5 name];
      uint64_t v38 = [v5 uuid];
      long long v39 = [v38 UUIDString];
      *(_DWORD *)buf = 138543874;
      uint64_t v71 = v36;
      __int16 v72 = 2112;
      uint64_t v73 = v37;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v39;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Removed accessory %@/%@ does not support target control - ignoring", buf, 0x20u);
    }
  }
}

- (void)__accessoryNameUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HMDTargetControllerManager___accessoryNameUpdated___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__HMDTargetControllerManager___accessoryNameUpdated___block_invoke(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    id v10 = [v4 uuid];
    int v11 = [v10 UUIDString];
    *(_DWORD *)buf = 138543874;
    __int16 v69 = v8;
    __int16 v70 = 2112;
    uint64_t v71 = (uint64_t)v9;
    __int16 v72 = 2112;
    uint64_t v73 = (uint64_t)v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that the name of an accessory %@/%@ has been updated", buf, 0x20u);
  }
  unint64_t v12 = [*(id *)(a1 + 40) controller];
  int v13 = [v12 home];

  if (v13)
  {
    uint64_t v14 = [v4 uuid];
    unint64_t v62 = v13;
    uint64_t v15 = [v13 uuid];
    uint64_t v16 = identifierForTargetWithUUID(v14, v15);

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v17 = [*(id *)(a1 + 40) configuredTargets];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v65;
      uint64_t v61 = a1;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v65 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v23 = [v22 identifier];
          uint64_t v24 = [NSNumber numberWithUnsignedInt:v16];
          int v25 = [v23 isEqual:v24];

          if (v25)
          {
            uint64_t v26 = (void *)MEMORY[0x230FBD990]();
            uint64_t v27 = v61;
            id v28 = *(id *)(v61 + 40);
            long long v29 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              id v30 = HMFGetLogIdentifier();
              int v31 = [v4 uuid];
              int v32 = [v31 UUIDString];
              [v4 name];
              v34 = long long v33 = v26;
              *(_DWORD *)buf = 138543874;
              __int16 v69 = v30;
              __int16 v70 = 2112;
              uint64_t v71 = (uint64_t)v32;
              __int16 v72 = 2112;
              uint64_t v73 = (uint64_t)v34;
              _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Received notification that the name of target accessory %@ has been updated to %@", buf, 0x20u);

              uint64_t v26 = v33;
              uint64_t v27 = v61;
            }
            long long v35 = [v22 name];
            uint64_t v36 = [v4 name];
            char v37 = HMFEqualObjects();

            if ((v37 & 1) == 0)
            {
              uint64_t v38 = (void *)MEMORY[0x230FBD990]();
              id v39 = *(id *)(v27 + 40);
              id v40 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                long long v58 = HMFGetLogIdentifier();
                uint64_t v41 = [v22 name];
                long long v59 = [v4 uuid];
                long long v60 = v38;
                uint64_t v42 = [v59 UUIDString];
                unint64_t v43 = [v4 name];
                *(_DWORD *)buf = 138544130;
                __int16 v69 = v58;
                __int16 v70 = 2112;
                __int16 v44 = (void *)v41;
                uint64_t v71 = v41;
                __int16 v72 = 2112;
                uint64_t v73 = v42;
                id v45 = (void *)v42;
                __int16 v74 = 2112;
                uint64_t v75 = v43;
                _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Updating the name of target accessory %@/%@ to %@", buf, 0x2Au);

                uint64_t v38 = v60;
              }

              __int16 v46 = [v4 name];
              [v22 setName:v46];

              id v47 = *(void **)(v27 + 40);
              id v48 = [v4 name];
              [v47 _updateName:v48 buttonConfiguration:0 target:v22];
            }
            goto LABEL_22;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    int v13 = v62;
  }
  else
  {
    id v49 = (void *)MEMORY[0x230FBD990]();
    id v50 = *(id *)(a1 + 40);
    long long v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      long long v52 = HMFGetLogIdentifier();
      uint64_t v53 = [*(id *)(a1 + 40) controller];
      uint64_t v54 = [v53 name];
      unint64_t v55 = [*(id *)(a1 + 40) controller];
      long long v56 = [v55 uuid];
      [v56 UUIDString];
      long long v57 = v63 = v49;
      *(_DWORD *)buf = 138543874;
      __int16 v69 = v52;
      __int16 v70 = 2112;
      uint64_t v71 = (uint64_t)v54;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v57;
      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Attempting to process accessory name update with a controller %@/%@ that is not configured with a home", buf, 0x20u);

      id v49 = v63;
    }
  }
}

- (void)__accessoryConnected:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDTargetControllerManager___accessoryConnected___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__HMDTargetControllerManager___accessoryConnected___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    id v10 = [v4 uuid];
    int v11 = [v10 UUIDString];
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v8;
    __int16 v28 = 2112;
    long long v29 = v9;
    __int16 v30 = 2112;
    int v31 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Connected to accessory %@/%@", buf, 0x20u);
  }
  id v12 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 40) controller];
    uint64_t v16 = [v15 uuid];
    id v17 = [v14 uuid];
    int v18 = [v16 isEqual:v17];

    if (v18)
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Connected to controller - refreshing the supported target configuration and auditing the list of targets", buf, 0xCu);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      uint64_t v23 = *(void **)(a1 + 40);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __51__HMDTargetControllerManager___accessoryConnected___block_invoke_59;
      v24[3] = &unk_264A2DE60;
      objc_copyWeak(&v25, (id *)buf);
      [v23 _refreshConfigurationWithCompletion:v24];
      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __51__HMDTargetControllerManager___accessoryConnected___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to refresh the supported target configuration - error %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)__accessoryDisconnected:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTargetControllerManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HMDTargetControllerManager___accessoryDisconnected___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDTargetControllerManager___accessoryDisconnected___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    int v10 = [v4 uuid];
    int v11 = [v10 UUIDString];
    int v23 = 138543874;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v9;
    __int16 v27 = 2112;
    __int16 v28 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Disconnected from accessory %@/%@", (uint8_t *)&v23, 0x20u);
  }
  id v12 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 40) controller];
    uint64_t v16 = [v15 uuid];
    id v17 = [v14 uuid];
    int v18 = [v16 isEqual:v17];

    if (v18)
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v23 = 138543362;
        uint64_t v24 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Disconnected from controller - marking configuation as stale", (uint8_t *)&v23, 0xCu);
      }
      [*(id *)(a1 + 40) setConfigurationRefreshed:0];
    }
  }
}

- (void)setButtonConfiguration:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  buttonConfiguration = self->_buttonConfiguration;
  self->_buttonConfiguration = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)buttonConfiguration
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_buttonConfiguration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTicksPerSecond:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_ticksPerSecond = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)ticksPerSecond
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t ticksPerSecond = self->_ticksPerSecond;
  os_unfair_lock_unlock(p_lock);
  return ticksPerSecond;
}

- (NSArray)targetUUIDs
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = [(HMDTargetControllerManager *)self configuredTargets];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v5 = 138543874;
    long long v21 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "uuid", v21);

        if (v10)
        {
          int v11 = [v9 uuid];
          id v12 = [v11 UUIDString];
          [v3 addObject:v12];
        }
        else
        {
          id v13 = (void *)MEMORY[0x230FBD990]();
          id v14 = self;
          uint64_t v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = HMFGetLogIdentifier();
            id v17 = [v9 name];
            int v18 = [v9 identifier];
            *(_DWORD *)buf = v21;
            uint64_t v29 = v16;
            __int16 v30 = 2112;
            int v31 = v17;
            __int16 v32 = 2112;
            long long v33 = v18;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Target %@/%@ does not have a UUID", buf, 0x20u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v6);
  }

  uint64_t v19 = (void *)[v3 copy];
  return (NSArray *)v19;
}

- (void)resetConfiguredTargets
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->_configuredTargets removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)removeConfiguredTarget:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->_configuredTargets removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addConfiguredTarget:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->_configuredTargets addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableSet)configuredTargets
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableSet *)self->_configuredTargets copy];
  os_unfair_lock_unlock(p_lock);
  return (NSMutableSet *)v4;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  long long v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating target controller manager", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:v4];
}

- (HMDTargetControllerManager)initWithTargetControllerAccessory:(id)a3 targets:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v77.receiver = self;
  v77.super_class = (Class)HMDTargetControllerManager;
  int v8 = [(HMDTargetControllerManager *)&v77 init];
  if (!v8) {
    goto LABEL_25;
  }
  HMDispatchQueueNameString();
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (const char *)[v9 UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v11 = v68 = v8;
  dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
  workQueue = v68->_workQueue;
  v68->_workQueue = (OS_dispatch_queue *)v12;

  p_isa = (id *)&v68->super.super.isa;
  objc_storeWeak((id *)&v68->_controller, v6);
  v68->_configurationRefreshed = 0;
  v68->_maximumTargets = 16;
  v68->_unint64_t ticksPerSecond = 1000;
  buttonConfiguration = v68->_buttonConfiguration;
  v68->_buttonConfiguration = (NSArray *)MEMORY[0x263EFFA68];

  uint64_t v16 = [MEMORY[0x263EFF9C0] set];
  configuredTargets = v68->_configuredTargets;
  v68->_configuredTargets = (NSMutableSet *)v16;

  unint64_t v18 = 0x263F08000;
  long long v67 = v6;
  if (![v7 count]) {
    goto LABEL_22;
  }
  uint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v63 = v7;
  id v20 = v7;
  long long v21 = (void *)v19;
  id obj = v20;
  uint64_t v72 = [v20 countByEnumeratingWithState:&v73 objects:v88 count:16];
  if (!v72) {
    goto LABEL_21;
  }
  uint64_t v71 = *(void *)v74;
  __int16 v69 = (void *)v19;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v74 != v71) {
        objc_enumerationMutation(obj);
      }
      int v23 = *(NSMutableSet **)(*((void *)&v73 + 1) + 8 * v22);
      long long v24 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v23];
      long long v25 = [v6 home];
      [v21 addObject:v24];
      long long v26 = [v25 accessoryWithUUID:v24];
      if (v26)
      {
        long long v27 = [[HMDTargetConfiguration alloc] initWithAccessory:v26 buttonConfiguration:0];
LABEL_14:
        [p_isa[3] addObject:v27];

        goto LABEL_15;
      }
      if (v25)
      {
        __int16 v28 = [v25 uuid];
        uint64_t v29 = identifierForTargetWithUUID(v24, v28);

        __int16 v30 = (void *)MEMORY[0x230FBD990]();
        int v31 = p_isa;
        __int16 v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          long long v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          uint64_t v81 = v33;
          __int16 v82 = 2112;
          long long v83 = v23;
          __int16 v84 = 2048;
          unint64_t v85 = v29;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Unable to look up the target with UUID %@ - adding with identifier %lu", buf, 0x20u);

          id v6 = v67;
        }

        id v34 = [HMDTargetConfiguration alloc];
        uint64_t v35 = [NSNumber numberWithUnsignedInt:v29];
        long long v27 = [(HMDTargetConfiguration *)v34 initWithIdentifier:v35 name:0 category:0 buttonConfiguration:0];

        p_isa = (id *)&v68->super.super.isa;
        long long v21 = v69;
        goto LABEL_14;
      }
      uint64_t v36 = (void *)MEMORY[0x230FBD990]();
      char v37 = p_isa;
      uint64_t v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        long long v65 = HMFGetLogIdentifier();
        uint64_t v39 = [v24 UUIDString];
        id v40 = v6;
        uint64_t v41 = (NSMutableSet *)v39;
        uint64_t v42 = [v40 name];
        long long v64 = [v67 uuid];
        [v64 UUIDString];
        unint64_t v43 = v66 = v36;
        *(_DWORD *)buf = 138544130;
        uint64_t v81 = v65;
        __int16 v82 = 2112;
        long long v83 = v41;
        __int16 v84 = 2112;
        unint64_t v85 = (unint64_t)v42;
        __int16 v86 = 2112;
        long long v87 = v43;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Attempting to initialize target with UUID %@ for a controller %@/%@ that is not configured with a home", buf, 0x2Au);

        uint64_t v36 = v66;
        id v6 = v67;
        p_isa = (id *)&v68->super.super.isa;
      }
      long long v21 = v69;
LABEL_15:

      ++v22;
    }
    while (v72 != v22);
    uint64_t v44 = [obj countByEnumeratingWithState:&v73 objects:v88 count:16];
    uint64_t v72 = v44;
  }
  while (v44);
LABEL_21:

  __int16 v78 = @"HMDTargetAccessoriesUUIDKey";
  uint64_t v79 = v21;
  id v45 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  unint64_t v18 = 0x263F08000uLL;
  __int16 v46 = [MEMORY[0x263F08A00] defaultCenter];
  [v46 postNotificationName:@"HMDTargetAccessoryConfiguredNotificationKey" object:v6 userInfo:v45];

  id v7 = v63;
LABEL_22:
  id v47 = NSString;
  id v48 = [v6 name];
  id v49 = [v6 uuid];
  id v50 = [v49 UUIDString];
  uint64_t v51 = [v47 stringWithFormat:@"%@/%@", v48, v50];
  logID = v68->_logID;
  v68->_logID = (NSString *)v51;

  int v8 = v68;
  uint64_t v53 = (void *)MEMORY[0x230FBD990]();
  uint64_t v54 = v68;
  unint64_t v55 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    long long v56 = HMFGetLogIdentifier();
    long long v57 = v68->_configuredTargets;
    *(_DWORD *)buf = 138543618;
    uint64_t v81 = v56;
    __int16 v82 = 2112;
    long long v83 = v57;
    _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, "%{public}@Initializing target controller manager with targets %@", buf, 0x16u);

    int v8 = v68;
  }

  long long v58 = [*(id *)(v18 + 2560) defaultCenter];
  [v58 addObserver:v54 selector:sel___accessoryNameUpdated_ name:@"HMDAccessoryNameUpdatedNotification" object:0];

  long long v59 = [*(id *)(v18 + 2560) defaultCenter];
  [v59 addObserver:v54 selector:sel___accessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:0];

  long long v60 = [*(id *)(v18 + 2560) defaultCenter];
  [v60 addObserver:v54 selector:sel___accessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:0];

  uint64_t v61 = [*(id *)(v18 + 2560) defaultCenter];
  [v61 addObserver:v54 selector:sel___accessoryRemoved_ name:@"HMDHomeAccessoryRemovedNotification" object:0];

  id v6 = v67;
LABEL_25:

  return v8;
}

- (HMDTargetControllerManager)init
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  long long v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_81411 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_81411, &__block_literal_global_81412);
  }
  id v2 = (void *)logCategory__hmf_once_v7_81413;
  return v2;
}

void __41__HMDTargetControllerManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v7_81413;
  logCategory__hmf_once_v7_81413 = v0;
}

@end