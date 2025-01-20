@interface HMDHomeObjectChangeHandler
- (HMDHome)home;
- (HMDHomeObjectChangeHandler)initWithHome:(id)a3;
- (OS_dispatch_queue)workQueue;
- (void)handleObjectAdd:(id)a3 message:(id)a4;
- (void)handleObjectRemove:(id)a3 message:(id)a4;
- (void)handleObjectUpdate:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDHomeObjectChangeHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)handleObjectUpdate:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDHomeObjectChangeHandler *)self home];
  id v12 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    v15 = [v14 uuid];
    v16 = [v11 roomWithUUID:v15];

    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v106 = v20;
      __int16 v107 = 2112;
      id v108 = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Received room transaction, applying it to room: %@", buf, 0x16u);
    }
    if (v16) {
      [v16 transactionObjectUpdated:v8 newValues:v12 message:v10];
    }
    else {
      [(HMDHomeObjectChangeHandler *)v18 handleObjectAdd:v14 message:v10];
    }

    id v21 = v12;
    goto LABEL_37;
  }
  id v21 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  if (v23)
  {
    v24 = [v23 uuid];
    v25 = [v11 zoneWithUUID:v24];

    v26 = (void *)MEMORY[0x230FBD990]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v98 = v12;
      id v29 = v21;
      v30 = v11;
      id v31 = v10;
      v33 = id v32 = v8;
      *(_DWORD *)buf = 138543618;
      v106 = v33;
      __int16 v107 = 2112;
      id v108 = v25;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Received zone transaction, applying it to zone: %@", buf, 0x16u);

      id v8 = v32;
      id v10 = v31;
      v11 = v30;
      id v21 = v29;
      id v12 = v98;
    }

    if (!v25)
    {
      [(HMDHomeObjectChangeHandler *)v27 handleObjectAdd:v23 message:v10];
      goto LABEL_36;
    }
    v34 = v25;
LABEL_27:
    [v34 transactionObjectUpdated:v8 newValues:v21 message:v10];
LABEL_36:

    goto LABEL_37;
  }
  id v99 = v8;
  id v21 = v21;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v35 = v21;
  }
  else {
    v35 = 0;
  }
  id v36 = v35;

  if (v36)
  {
    v37 = [v36 uuid];
    v25 = [v11 serviceGroupWithUUID:v37];

    v38 = (void *)MEMORY[0x230FBD990]();
    self = self;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v106 = v40;
      __int16 v107 = 2112;
      id v108 = v25;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Received serviceGroup transaction, applying it to serviceGroup: %@", buf, 0x16u);
    }
    if (v25) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
  id v21 = v21;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v41 = v21;
  }
  else {
    v41 = 0;
  }
  id v36 = v41;

  if (v36)
  {
    v42 = [v36 uuid];
    uint64_t v43 = [v11 actionSetWithUUID:v42];
    goto LABEL_34;
  }
  id v21 = v21;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v44 = v21;
  }
  else {
    v44 = 0;
  }
  id v45 = v44;

  if (v45
    || ((id v21 = v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (v46 = 0) : (v46 = v21),
        id v45 = v46,
        v21,
        v45))
  {
    v47 = [v45 uuid];
    v48 = [v11 triggerWithUUID:v47];

    id v49 = v48;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v51 = v49;
    }
    else {
      v51 = 0;
    }
    id v52 = v51;

    if (v49)
    {
      if (isKindOfClass)
      {
        id v8 = v99;
        [v49 transactionObjectUpdated:v99 newValues:v21 message:v10];
LABEL_55:

        goto LABEL_37;
      }
      v53 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v10 respondWithError:v53];
    }
    else
    {
      [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v45 message:v10];
    }
    id v8 = v99;
    goto LABEL_55;
  }
  id v21 = v21;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v54 = v21;
  }
  else {
    v54 = 0;
  }
  id v36 = v54;

  if (v36)
  {
    v42 = [v36 uuid];
    uint64_t v43 = [v11 accessoryWithUUID:v42];
LABEL_34:
    v25 = (void *)v43;

    if (v25)
    {
LABEL_26:
      v34 = v25;
      id v8 = v99;
      goto LABEL_27;
    }
LABEL_35:
    [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v36 message:v10];
    id v8 = v99;
    goto LABEL_36;
  }
  id v21 = v21;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v55 = v21;
  }
  else {
    v55 = 0;
  }
  id v56 = v55;

  if (v56)
  {
    id v57 = v56;
    v58 = [v57 parentUUID];
    v59 = [v11 accessoryWithUUID:v58];

    if (v59)
    {
      id v8 = v99;
      [v59 transactionObjectUpdated:v99 newValues:v21 message:v10];
    }
    else
    {
      v67 = (void *)MEMORY[0x230FBD990]();
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v69 = v97 = v67;
        v70 = [v57 parentUUID];
        v71 = [v57 instanceID];
        *(_DWORD *)buf = 138543874;
        v106 = v69;
        __int16 v107 = 2112;
        id v108 = v70;
        __int16 v109 = 2112;
        id v110 = v71;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory %@ to add/update service %@", buf, 0x20u);

        v67 = v97;
      }

      id v8 = v99;
    }
  }
  else
  {
    id v60 = v21;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v61 = v60;
    }
    else {
      v61 = 0;
    }
    id v21 = v61;

    if (v21)
    {
      id v93 = v60;
      [v11 usersIncludingPendingUsers:1];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v96 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
      if (v96)
      {
        uint64_t v95 = *(void *)v101;
LABEL_73:
        uint64_t v62 = 0;
        while (1)
        {
          if (*(void *)v101 != v95) {
            objc_enumerationMutation(obj);
          }
          v63 = *(void **)(*((void *)&v100 + 1) + 8 * v62);
          v64 = [v63 uuid];
          v65 = [v21 uuid];
          char v66 = [v64 isEqual:v65];

          if (v66) {
            break;
          }
          if (v96 == ++v62)
          {
            uint64_t v96 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
            if (v96) {
              goto LABEL_73;
            }
            goto LABEL_79;
          }
        }
        id v72 = v63;

        id v8 = v99;
        if (!v72) {
          goto LABEL_86;
        }
        [v72 transactionObjectUpdated:v99 newValues:v93 message:v10];
      }
      else
      {
LABEL_79:

        id v8 = v99;
LABEL_86:
        [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v21 message:v10];
      }
    }
    else
    {
      id v21 = v60;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v73 = v21;
      }
      else {
        v73 = 0;
      }
      id v74 = v73;

      if (v74)
      {
        v75 = [v74 uuid];
        v76 = [v11 outgoingInvitationWithUUID:v75];

        if (v76)
        {
          id v8 = v99;
          [v76 transactionObjectUpdated:v99 newValues:v21 message:v10];
        }
        else
        {
          [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v74 message:v10];
          id v8 = v99;
        }
      }
      else
      {
        id v21 = v21;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v77 = v21;
        }
        else {
          v77 = 0;
        }
        id v78 = v77;

        if (!v78)
        {
          id v79 = v21;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v80 = v79;
          }
          else {
            v80 = 0;
          }
          id v81 = v80;
          id v21 = v79;

          if (v81)
          {
            v82 = [v81 uuid];
            v83 = [v11 mediaSystemWithUUID:v82];

            if (v83)
            {
              [v83 transactionObjectUpdated:v99 newValues:v79 message:v10];
            }
            else
            {
              v87 = [v11 mediaSystemController];
              [v87 _handleAddMediaSystemModel:v81 message:v10];
            }
          }
          else
          {
            id v21 = v79;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v84 = v21;
            }
            else {
              v84 = 0;
            }
            id v85 = v84;

            if (v85)
            {
              v86 = [v11 networkProtectionGroupRegistry];
              [v86 handleAddOrUpdateAccessoryNetworkProtectionGroupModel:v85 message:v10];

              id v8 = v99;
              goto LABEL_37;
            }
            v88 = (void *)MEMORY[0x230FBD990]();
            v89 = self;
            v90 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            {
              v91 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v106 = v91;
              __int16 v107 = 2112;
              id v108 = v21;
              __int16 v109 = 2112;
              id v110 = (id)objc_opt_class();
              id v92 = v110;
              _os_log_impl(&dword_22F52A000, v90, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);
            }
            id v21 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
            [v10 respondWithError:v21];
          }
          id v8 = v99;
          goto LABEL_37;
        }
        [v11 _handleUpdateAppDataModel:v78 message:v10];
      }
    }
  }
LABEL_37:
}

- (void)handleObjectRemove:(id)a3 message:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeObjectChangeHandler *)self home];
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    [v8 _handleRemoveRoomModel:v11 message:v7];
    id v12 = v9;
    goto LABEL_62;
  }
  id v12 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    [v8 _handleRemoveZoneModel:v14 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v12;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    [v8 _handleRemoveServiceGroupModel:v16 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v12;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v18)
  {
    [v8 _handleRemoveActionSetModel:v18 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v12;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (v20)
  {
    [v8 _handleRemoveAccessoryModel:v20 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v12;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
LABEL_30:
    id v23 = [v22 parentUUID];
    v24 = [v8 accessoryWithUUID:v23];

    [v24 transactionObjectRemoved:v22 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v25 = v12;
  }
  else {
    v25 = 0;
  }
  id v26 = v25;

  if (v26)
  {
    [v8 _handleRemoveUserModel:v26 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v27 = v12;
  }
  else {
    v27 = 0;
  }
  id v28 = v27;

  if (v28)
  {
    [v8 _handleRemoveTriggerModel:v28 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v29 = v12;
  }
  else {
    id v29 = 0;
  }
  id v30 = v29;

  if (v30)
  {
    [v8 _handleRemoveOutgoingHomeInvitationModel:v30 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v31 = v12;
  }
  else {
    id v31 = 0;
  }
  id v32 = v31;

  if (v32)
  {
    [v8 _handleRemoveAppDataModel:v32 message:v7];
    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v33 = v12;
  }
  else {
    v33 = 0;
  }
  id v34 = v33;

  if (v34)
  {
    v35 = [v8 mediaSystemController];
    [v35 _handleRemoveMediaSystemModel:v34 message:v7];
LABEL_61:

    goto LABEL_62;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v36 = v12;
  }
  else {
    id v36 = 0;
  }
  id v37 = v36;

  if (v37)
  {
    v35 = [v8 networkProtectionGroupRegistry];
    [v35 handleRemoveAccessoryNetworkProtectionGroupModel:v37 message:v7];
    goto LABEL_61;
  }
  id v12 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v38 = v12;
  }
  else {
    v38 = 0;
  }
  id v22 = v38;

  if (v22) {
    goto LABEL_30;
  }
  v39 = (void *)MEMORY[0x230FBD990]();
  v40 = self;
  v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v42 = HMFGetLogIdentifier();
    int v43 = 138543618;
    v44 = v42;
    __int16 v45 = 2112;
    id v46 = v12;
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [HMDHome transactionObjectRemoved]", (uint8_t *)&v43, 0x16u);
  }
  id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v7 respondWithError:v12];
LABEL_62:
}

- (void)handleObjectAdd:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeObjectChangeHandler *)self home];
  id v47 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v47;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [v8 _handleAddRoomModel:v10 message:v7];
    goto LABEL_57;
  }
  id v11 = v47;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    [v8 _handleAddZoneModel:v13 message:v7];
    goto LABEL_57;
  }
  id v14 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    [v8 _handleAddServiceGroupModel:v16 message:v7];
    goto LABEL_57;
  }
  id v17 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    [v8 _handleAddActionSetModel:v19 message:v7];
    goto LABEL_57;
  }
  id v20 = v17;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    [v8 _handleAddTimerTriggerModel:v22 message:v7];
    goto LABEL_57;
  }
  id v23 = v20;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  if (v25)
  {
    [v8 _handleAddEventTriggerModel:v25 message:v7];
    goto LABEL_57;
  }
  id v26 = v23;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v27 = v26;
  }
  else {
    v27 = 0;
  }
  id v28 = v27;

  if (v28)
  {
    [v8 _handleAddAccessoryModel:v28 message:v7];
    goto LABEL_57;
  }
  id v29 = v26;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v30 = v29;
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;

  if (v31)
  {
    [v8 _handleAddUserModel:v31 message:v7];
    goto LABEL_57;
  }
  id v32 = v29;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v33 = v32;
  }
  else {
    v33 = 0;
  }
  id v34 = v33;

  if (v34)
  {
    [v8 _handleAddOutgoingHomeInvitationModel:v34 message:v7];
    goto LABEL_57;
  }
  id v35 = v32;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }
  id v37 = v36;

  if (v37)
  {
    v38 = [v8 mediaSystemController];
    [v38 _handleAddMediaSystemModel:v37 message:v7];
LABEL_56:

    goto LABEL_57;
  }
  id v39 = v35;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v40 = v39;
  }
  else {
    v40 = 0;
  }
  id v41 = v40;

  if (v41)
  {
    v38 = [v8 networkProtectionGroupRegistry];
    [v38 handleAddOrUpdateAccessoryNetworkProtectionGroupModel:v41 message:v7];
    goto LABEL_56;
  }
  id v42 = v39;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v43 = v42;
  }
  else {
    int v43 = 0;
  }
  id v44 = v43;

  if (!v44) {
    goto LABEL_58;
  }
  __int16 v45 = [v44 parentUUID];
  id v46 = [v8 accessoryWithUUID:v45];

  [v46 transactionObjectUpdated:0 newValues:v44 message:v7];
LABEL_57:

LABEL_58:
}

- (HMDHomeObjectChangeHandler)initWithHome:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDHomeObjectChangeHandler;
  v5 = [(HMDHomeObjectChangeHandler *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_home, v4);
    uint64_t v7 = [v4 workQueue];
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

@end