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
  uint64_t v115 = *MEMORY[0x1E4F143B8];
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

    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v110 = v20;
      __int16 v111 = 2112;
      id v112 = v16;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Received room transaction, applying it to room: %@", buf, 0x16u);
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

    v26 = (void *)MEMORY[0x1D9452090]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v102 = v12;
      id v29 = v21;
      v30 = v11;
      id v31 = v10;
      v33 = id v32 = v8;
      *(_DWORD *)buf = 138543618;
      v110 = v33;
      __int16 v111 = 2112;
      id v112 = v25;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Received zone transaction, applying it to zone: %@", buf, 0x16u);

      id v8 = v32;
      id v10 = v31;
      v11 = v30;
      id v21 = v29;
      id v12 = v102;
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
  id v103 = v8;
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

    v38 = (void *)MEMORY[0x1D9452090]();
    self = self;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v110 = v40;
      __int16 v111 = 2112;
      id v112 = v25;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Received serviceGroup transaction, applying it to serviceGroup: %@", buf, 0x16u);
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
        id v8 = v103;
        [v49 transactionObjectUpdated:v103 newValues:v21 message:v10];
LABEL_55:

        goto LABEL_37;
      }
      v53 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v10 respondWithError:v53];
    }
    else
    {
      [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v45 message:v10];
    }
    id v8 = v103;
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
      id v8 = v103;
      goto LABEL_27;
    }
LABEL_35:
    [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v36 message:v10];
    id v8 = v103;
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
      id v8 = v103;
      [v59 transactionObjectUpdated:v103 newValues:v21 message:v10];
    }
    else
    {
      v69 = (void *)MEMORY[0x1D9452090]();
      v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v71 = v101 = v69;
        v72 = [v57 parentUUID];
        v73 = [v57 instanceID];
        *(_DWORD *)buf = 138543874;
        v110 = v71;
        __int16 v111 = 2112;
        id v112 = v72;
        __int16 v113 = 2112;
        id v114 = v73;
        _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory %@ to add/update service %@", buf, 0x20u);

        v69 = v101;
      }

      id v8 = v103;
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
      id v95 = v60;
      v62 = [v11 users];
      v63 = [v21 pairingIdentity];
      v99 = [v63 objectForKeyedSubscript:@"HAP.identifier"];

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id obj = v62;
      uint64_t v98 = [obj countByEnumeratingWithState:&v104 objects:v108 count:16];
      if (v98)
      {
        uint64_t v97 = *(void *)v105;
LABEL_73:
        uint64_t v64 = 0;
        while (1)
        {
          if (*(void *)v105 != v97) {
            objc_enumerationMutation(obj);
          }
          v65 = *(void **)(*((void *)&v104 + 1) + 8 * v64);
          v66 = [v65 uuid];
          v67 = [v21 uuid];
          if ([v66 isEqual:v67]) {
            break;
          }
          v68 = [v65 pairingUsername];
          char v100 = [v68 isEqualToString:v99];

          if (v100) {
            goto LABEL_92;
          }
          if (v98 == ++v64)
          {
            uint64_t v98 = [obj countByEnumeratingWithState:&v104 objects:v108 count:16];
            if (v98) {
              goto LABEL_73;
            }
            goto LABEL_80;
          }
        }

LABEL_92:
        id v78 = v65;

        id v8 = v103;
        if (!v78) {
          goto LABEL_94;
        }
        [v78 transactionObjectUpdated:v103 newValues:v95 message:v10];
      }
      else
      {
LABEL_80:

        id v8 = v103;
LABEL_94:
        [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v21 message:v10];
      }
    }
    else
    {
      id v21 = v60;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v74 = v21;
      }
      else {
        v74 = 0;
      }
      id v75 = v74;

      if (v75)
      {
        v76 = [v75 uuid];
        v77 = [v11 outgoingInvitationWithUUID:v76];

        if (v77)
        {
          id v8 = v103;
          [v77 transactionObjectUpdated:v103 newValues:v21 message:v10];
        }
        else
        {
          [(HMDHomeObjectChangeHandler *)self handleObjectAdd:v75 message:v10];
          id v8 = v103;
        }
      }
      else
      {
        id v21 = v21;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v79 = v21;
        }
        else {
          v79 = 0;
        }
        id v80 = v79;

        if (!v80)
        {
          id v81 = v21;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v82 = v81;
          }
          else {
            v82 = 0;
          }
          id v83 = v82;
          id v21 = v81;

          if (v83)
          {
            v84 = [v83 uuid];
            v85 = [v11 mediaSystemWithUUID:v84];

            if (v85)
            {
              [v85 transactionObjectUpdated:v103 newValues:v81 message:v10];
            }
            else
            {
              v89 = [v11 mediaSystemController];
              [v89 _handleAddMediaSystemModel:v83 message:v10];
            }
          }
          else
          {
            id v21 = v81;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v86 = v21;
            }
            else {
              v86 = 0;
            }
            id v87 = v86;

            if (v87)
            {
              v88 = [v11 networkProtectionGroupRegistry];
              [v88 handleAddOrUpdateAccessoryNetworkProtectionGroupModel:v87 message:v10];

              id v8 = v103;
              goto LABEL_37;
            }
            v90 = (void *)MEMORY[0x1D9452090]();
            v91 = self;
            v92 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              v93 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v110 = v93;
              __int16 v111 = 2112;
              id v112 = v21;
              __int16 v113 = 2112;
              id v114 = (id)objc_opt_class();
              id v94 = v114;
              _os_log_impl(&dword_1D49D5000, v92, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);
            }
            id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
            [v10 respondWithError:v21];
          }
          id v8 = v103;
          goto LABEL_37;
        }
        [v11 _handleUpdateAppDataModel:v80 message:v10];
      }
    }
  }
LABEL_37:
}

- (void)handleObjectRemove:(id)a3 message:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
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
  v38 = (void *)MEMORY[0x1D9452090]();
  v39 = self;
  v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    v41 = HMFGetLogIdentifier();
    int v42 = 138543618;
    uint64_t v43 = v41;
    __int16 v44 = 2112;
    id v45 = v12;
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [HMDHome transactionObjectRemoved]", (uint8_t *)&v42, 0x16u);
  }
  id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  [v7 respondWithError:v12];
LABEL_62:
}

- (void)handleObjectAdd:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeObjectChangeHandler *)self home];
  id v43 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v43;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [v8 _handleAddRoomModel:v10 message:v7];
  }
  else
  {
    id v11 = v43;
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
    }
    else
    {
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
      }
      else
      {
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
        }
        else
        {
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
          }
          else
          {
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
            }
            else
            {
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
              }
              else
              {
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
                }
                else
                {
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
                  }
                  else
                  {
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
                    }
                    else
                    {
                      id v39 = v35;
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        v40 = v39;
                      }
                      else {
                        v40 = 0;
                      }
                      id v41 = v40;

                      if (!v41) {
                        goto LABEL_57;
                      }
                      int v42 = [v8 networkProtectionGroupRegistry];
                      [v42 handleAddOrUpdateAccessoryNetworkProtectionGroupModel:v41 message:v7];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

LABEL_57:
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