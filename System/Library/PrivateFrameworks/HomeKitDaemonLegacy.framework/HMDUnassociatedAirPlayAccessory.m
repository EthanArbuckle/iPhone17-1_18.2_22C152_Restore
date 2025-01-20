@interface HMDUnassociatedAirPlayAccessory
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)supportsAssociation;
- (HMDUnassociatedAirPlayAccessory)initWithCoder:(id)a3;
- (HMFPairingIdentity)pairingIdentity;
- (NSString)manufacturer;
- (NSString)model;
- (id)addTransactionForHome:(id)a3;
- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
- (void)associateToHome:(id)a3 completionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setPairingIdentity:(id)a3;
@end

@implementation HMDUnassociatedAirPlayAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setModel:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)associateToHome:(id)a3 completionHandler:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v59 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting association", buf, 0xCu);
  }
  v12 = [(HMDUnassociatedMediaAccessory *)v9 advertisement];
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
    v15 = [v14 outputDevice];
    v16 = objc_msgSend(v15, "av_OutputDevice");

    if (v16)
    {
      v17 = [v6 owner];
      if (([v17 isCurrentUser] & 1) == 0)
      {
        v28 = (void *)MEMORY[0x1D9452090]();
        v29 = v9;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v59 = v31;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Only the owner of the home can perform association", buf, 0xCu);
        }
        if (v7)
        {
          v42 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17];
          v7[2](v7, v42);
        }
        goto LABEL_33;
      }
      v41 = objc_msgSend(v17, "av_authorizedPeer");
      if (v41)
      {
        char v40 = objc_msgSend(MEMORY[0x1E4F165D8], "shouldRestrictConnectionWithUserPrivilege:", objc_msgSend(v6, "minimumMediaUserPrivilege"));
        v18 = [v6 mediaPassword];

        if (v18)
        {
          v19 = [v6 mediaPassword];
        }
        else
        {
          v19 = 0;
        }
        objc_initWeak((id *)buf, v9);
        objc_initWeak(&location, v6);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke;
        aBlock[3] = &unk_1E6A099C8;
        objc_copyWeak(&v54, (id *)buf);
        objc_copyWeak(&v55, &location);
        char v56 = v40;
        id v37 = v41;
        id v52 = v37;
        id v38 = v19;
        id v53 = v38;
        v39 = _Block_copy(aBlock);
        objc_initWeak(&from, v14);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke_13;
        v43[3] = &unk_1E6A099F0;
        objc_copyWeak(&v47, (id *)buf);
        char v49 = v40;
        id v44 = v37;
        id v36 = v38;
        id v45 = v36;
        objc_copyWeak(&v48, &from);
        v46 = v7;
        [v16 configureUsingBlock:v39 options:0 completionHandler:v43];

        objc_destroyWeak(&v48);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&from);

        objc_destroyWeak(&v55);
        objc_destroyWeak(&v54);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_31;
      }
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = v9;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v59 = v35;
        __int16 v60 = 2112;
        v61 = v17;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Missing authorized peer for user: %@", buf, 0x16u);
      }
      if (v7)
      {
        id v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        v7[2](v7, v36);
LABEL_31:

        goto LABEL_33;
      }

LABEL_33:
      goto LABEL_34;
    }
    v24 = (void *)MEMORY[0x1D9452090]();
    v25 = v9;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v59 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Missing output device", buf, 0xCu);
    }
    if (v7)
    {
      v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v7[2](v7, v17);
      goto LABEL_33;
    }
    v16 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v20 = (void *)MEMORY[0x1D9452090]();
  v21 = v9;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v59 = v23;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Missing advertisement", buf, 0xCu);
  }
  if (v7)
  {
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
    v7[2](v7, v16);
    goto LABEL_34;
  }
LABEL_35:
}

void __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = v5;
  if (v5)
  {
    [v3 startAutomaticallyAllowingConnectionsFromPeersInHomeGroupAndRejectOtherConnections:*(unsigned __int8 *)(a1 + 64)];
    [v3 addPeerToHomeGroup:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40)) {
      v7 = *(__CFString **)(a1 + 40);
    }
    else {
      v7 = &stru_1F2C9F1A8;
    }
    id v5 = (id)[v3 setDevicePassword:v7];
  }
  v8 = (void *)MEMORY[0x1D9452090](v5);
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v11;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring with configuration: %@", (uint8_t *)&v12, 0x16u);
  }
}

void __69__HMDUnassociatedAirPlayAccessory_associateToHome_completionHandler___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v8)
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = WeakRetained;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v68 = v22;
      __int16 v69 = 2112;
      id v70 = v10;
      __int16 v71 = 2112;
      id v72 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to update configuration while associating to home with error: %@, %@", buf, 0x20u);
    }
    uint64_t v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication failure" reason:@"Failed to set administration password." suggestion:0 underlyingError:v10];
    goto LABEL_16;
  }
  if (([v8 automaticallyAllowsConnectionsFromPeersInHomeGroup] & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = WeakRetained;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v68 = v27;
      v28 = "%{public}@Failed to enable home connections";
LABEL_14:
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    }
LABEL_15:

    uint64_t v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
LABEL_16:
    id v29 = (id)v23;
    goto LABEL_17;
  }
  if (*(unsigned __int8 *)(a1 + 72) != [v8 onlyAllowsConnectionsFromPeersInHomeGroup])
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = WeakRetained;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v68 = v27;
      v28 = "%{public}@Failed to disable guest access";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v12 = v8;
  v13 = [v12 deviceID];
  __int16 v14 = [v12 devicePublicKey];

  if (v13 && v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F65508]);
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v14];
    v17 = (void *)[v15 initWithIdentifier:v13 publicKey:v16 privateKey:0];

    id v18 = 0;
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Not supported." reason:@"Accessory missing pairing identity" suggestion:0];
    v17 = 0;
  }

  id v29 = v18;
  if (v17)
  {
    [WeakRetained setPairingIdentity:v17];
    v31 = [v12 peersInHomeGroup];
    char v32 = [v31 containsObject:*(void *)(a1 + 32)];

    if (v32)
    {
      v65 = v17;
      v33 = [v12 peersInHomeGroup];
      unint64_t v34 = [v33 count];

      if (v34 < 2)
      {
        id v53 = [v12 devicePassword];
        char v54 = HMFEqualObjects();

        if (v54)
        {
          id v52 = objc_loadWeakRetained((id *)(a1 + 64));
          id v55 = (void *)MEMORY[0x1D9452090]([v52 setAssociated:1]);
          id v56 = WeakRetained;
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v58 = v64 = v55;
            *(_DWORD *)buf = 138543362;
            v68 = v58;
            _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Successfully associated", buf, 0xCu);

            id v55 = v64;
          }

          goto LABEL_42;
        }
        v59 = (void *)MEMORY[0x1D9452090]();
        id v60 = WeakRetained;
        v61 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v62 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v68 = v62;
          _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to set media password", buf, 0xCu);
        }
        char v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = 54;
      }
      else
      {
        v35 = (void *)MEMORY[0x1D9452090]();
        id v36 = WeakRetained;
        id v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          id v38 = v63 = v35;
          v39 = [v12 peersInHomeGroup];
          *(_DWORD *)buf = 138543618;
          v68 = v38;
          __int16 v69 = 2112;
          id v70 = v39;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Unexpected peers found: %@", buf, 0x16u);

          v35 = v63;
        }

        char v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = 41;
      }
      [v40 hmErrorWithCode:v41];
      id v52 = v29;
      id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
      v17 = v65;
      goto LABEL_43;
    }
    id v48 = (void *)MEMORY[0x1D9452090]();
    id v49 = WeakRetained;
    v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v51 = v66 = v17;
      *(_DWORD *)buf = 138543362;
      v68 = v51;
      _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add ourselves as a peer", buf, 0xCu);

      v17 = v66;
    }

    v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = 2;
  }
  else
  {
    v42 = (void *)MEMORY[0x1D9452090]();
    id v43 = WeakRetained;
    id v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      id v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v68 = v45;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid or missing pairing identity", buf, 0xCu);

      v17 = 0;
    }

    v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = 21;
  }
  [v46 hmErrorWithCode:v47];
  id v52 = v29;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:

LABEL_17:
  uint64_t v30 = *(void *)(a1 + 48);
  if (v30) {
    (*(void (**)(uint64_t, id))(v30 + 16))(v30, v29);
  }
}

- (BOOL)supportsAssociation
{
  return 1;
}

- (void)setPairingIdentity:(id)a3
{
  v4 = (HMFPairingIdentity *)[a3 copy];
  os_unfair_recursive_lock_lock_with_options();
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMFPairingIdentity)pairingIdentity
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_pairingIdentity;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  int v6 = objc_msgSend(v4, "hmd_isForLocalStore");
  v19.receiver = self;
  v19.super_class = (Class)HMDUnassociatedAirPlayAccessory;
  [(HMDUnassociatedAccessory *)&v19 encodeWithCoder:v4];
  v7 = [(HMDUnassociatedAirPlayAccessory *)self pairingIdentity];
  id v8 = v7;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F2C4B8]];
    }
    else if (v7)
    {
      id v9 = [v7 publicPairingIdentity];
      [v4 encodeObject:v9 forKey:*MEMORY[0x1E4F2C4B8]];
    }
  }
  id v10 = [(HMDUnassociatedMediaAccessory *)self advertisement];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [v12 outputDevice];

  __int16 v14 = objc_msgSend(v13, "av_OutputDevice");

  if (v14)
  {
    id v15 = [v14 modelID];

    if (v15)
    {
      uint64_t v16 = [v14 modelID];
      [v4 encodeObject:v16 forKey:@"HM.model"];
    }
    v17 = [v14 manufacturer];

    if (v17)
    {
      id v18 = [v14 manufacturer];
      [v4 encodeObject:v18 forKey:@"HM.manufacturer"];
    }
  }
}

- (HMDUnassociatedAirPlayAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDUnassociatedAirPlayAccessory;
  char v5 = [(HMDUnassociatedAccessory *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C4B8]];
    pairingIdentity = v5->_pairingIdentity;
    v5->_pairingIdentity = (HMFPairingIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.model"];
    model = v5->_model;
    v5->_model = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.manufacturer"];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;
  }
  return v5;
}

- (id)addTransactionForHome:(id)a3
{
  v33.receiver = self;
  v33.super_class = (Class)HMDUnassociatedAirPlayAccessory;
  id v4 = [(HMDUnassociatedMediaAccessory *)&v33 addTransactionForHome:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_25;
  }
  v7 = [(HMDUnassociatedMediaAccessory *)self advertisement];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 outputDevice];

  objc_msgSend(v10, "av_OutputDevice");
  v11 = (HMDUnassociatedAirPlayAccessory *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    id v12 = [(HMDUnassociatedAirPlayAccessory *)v11 modelID];

    if (v12)
    {
      objc_super v13 = [(HMDUnassociatedAirPlayAccessory *)v11 modelID];
      [v6 setModel:v13];

      __int16 v14 = [(HMDUnassociatedAirPlayAccessory *)v11 modelID];
      [v6 setInitialModel:v14];
    }
    id v15 = [(HMDUnassociatedAccessory *)v11 serialNumber];

    if (v15)
    {
      uint64_t v16 = [(HMDUnassociatedAccessory *)v11 serialNumber];
      [v6 setSerialNumber:v16];
    }
    v17 = [(HMDUnassociatedAirPlayAccessory *)v11 firmwareVersion];

    if (v17)
    {
      id v18 = [(HMDUnassociatedAirPlayAccessory *)v11 firmwareVersion];
      [v6 setFirmwareVersion:v18];
    }
    objc_super v19 = [(HMDUnassociatedAirPlayAccessory *)v11 manufacturer];

    if (!v19) {
      goto LABEL_22;
    }
    id v20 = [(HMDUnassociatedAirPlayAccessory *)v11 manufacturer];
    [v6 setManufacturer:v20];

    v21 = v11;
  }
  else
  {
    v22 = [(HMDUnassociatedAirPlayAccessory *)self model];

    if (v22)
    {
      uint64_t v23 = [(HMDUnassociatedAirPlayAccessory *)self model];
      [v6 setModel:v23];

      v24 = [(HMDUnassociatedAirPlayAccessory *)self model];
      [v6 setInitialModel:v24];
    }
    id v25 = [(HMDUnassociatedAirPlayAccessory *)self manufacturer];

    if (!v25) {
      goto LABEL_22;
    }
    v26 = [(HMDUnassociatedAirPlayAccessory *)self manufacturer];
    [v6 setManufacturer:v26];

    v21 = self;
  }
  v27 = [(HMDUnassociatedAirPlayAccessory *)v21 manufacturer];
  [v6 setInitialManufacturer:v27];

LABEL_22:
  v28 = (void *)MEMORY[0x1E4F2E520];
  id v29 = [(HMDUnassociatedAccessory *)self category];
  uint64_t v30 = [v28 categoryIdentifierForCategory:v29];
  [v6 setInitialCategoryIdentifier:v30];

  v31 = [(HMDUnassociatedAirPlayAccessory *)self pairingIdentity];
  if (v31) {
    [v6 setPairingIdentity:v31];
  }

LABEL_25:
  return v4;
}

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDBackingStoreModelObject *)[HMDAirPlayAccessoryModel alloc] initWithObjectChangeType:a3 uuid:v8 parentUUID:v7];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_36409 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_36409, &__block_literal_global_36410);
  }
  v2 = (void *)logCategory__hmf_once_v21_36411;
  return v2;
}

uint64_t __46__HMDUnassociatedAirPlayAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v21_36411;
  logCategory__hmf_once_v21_36411 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end