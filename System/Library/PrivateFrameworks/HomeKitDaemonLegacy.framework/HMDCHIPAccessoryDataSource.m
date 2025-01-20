@interface HMDCHIPAccessoryDataSource
+ (id)logCategory;
- (BOOL)wedSupport;
- (HMDCHIPAccessoryDataSource)initWithNodeID:(id)a3 accessory:(id)a4;
- (HMDMatterAccessoryProtocol)accessory;
- (NSData)attributeDatabase;
- (NSNumber)nodeID;
- (NSNumber)productID;
- (NSNumber)softwareVersionNumber;
- (NSNumber)supportedLinkLayerTypes;
- (NSNumber)vendorID;
- (NSSet)pairings;
- (NSString)extendedMACAddress;
- (id)logIdentifier;
- (void)_updateAccessoryModelWithLabel:(id)a3 completion:(id)a4 block:(id)a5;
- (void)setAccessory:(id)a3;
- (void)updateAttributeDatabase:(id)a3 completion:(id)a4;
- (void)updateExtendedMACAddress:(id)a3 completion:(id)a4;
- (void)updateNodeID:(id)a3 completion:(id)a4;
- (void)updatePairings:(id)a3 completion:(id)a4;
- (void)updateProductID:(id)a3 completion:(id)a4;
- (void)updateSoftwareVersionNumber:(id)a3 completion:(id)a4;
- (void)updateSupportedLinkLayerTypes:(id)a3 completion:(id)a4;
- (void)updateVendorID:(id)a3 completion:(id)a4;
- (void)updateVendorID:(id)a3 productID:(id)a4 completion:(id)a5;
- (void)updateWedSupport:(BOOL)a3 completion:(id)a4;
@end

@implementation HMDCHIPAccessoryDataSource

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_nodeID, 0);
}

- (void)setAccessory:(id)a3
{
}

- (HMDMatterAccessoryProtocol)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDMatterAccessoryProtocol *)WeakRetained;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMDCHIPAccessoryDataSource *)self accessory];
  v5 = [v4 logIdentifier];
  v6 = [(HMDCHIPAccessoryDataSource *)self nodeID];
  v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (void)updateSupportedLinkLayerTypes:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model link layer types to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__HMDCHIPAccessoryDataSource_updateSupportedLinkLayerTypes_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update supported link layer types" completion:v7 block:v13];
}

uint64_t __71__HMDCHIPAccessoryDataSource_updateSupportedLinkLayerTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSupportedLinkLayerTypes:*(void *)(a1 + 32)];
}

- (NSNumber)supportedLinkLayerTypes
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  v3 = [v2 chipStorage];
  v4 = [v3 supportedLinkLayerTypes];

  return (NSNumber *)v4;
}

- (void)updateSoftwareVersionNumber:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model software version to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__HMDCHIPAccessoryDataSource_updateSoftwareVersionNumber_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update CHIP software version number" completion:v7 block:v13];
}

uint64_t __69__HMDCHIPAccessoryDataSource_updateSoftwareVersionNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMatterSoftwareVersionNumber:*(void *)(a1 + 32)];
}

- (NSNumber)softwareVersionNumber
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  v3 = [v2 chipStorage];
  v4 = [v3 softwareVersionNumber];

  return (NSNumber *)v4;
}

- (void)updateWedSupport:(BOOL)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model wed support to %@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__HMDCHIPAccessoryDataSource_updateWedSupport_completion___block_invoke;
  v12[3] = &__block_descriptor_33_e36_v16__0__HMDHAPAccessoryTransaction_8l;
  BOOL v13 = a3;
  [(HMDCHIPAccessoryDataSource *)v8 _updateAccessoryModelWithLabel:@"Update CHIP wed support" completion:v6 block:v12];
}

void __58__HMDCHIPAccessoryDataSource_updateWedSupport_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setChipWEDSupport:v5];
}

- (BOOL)wedSupport
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  uint64_t v3 = [v2 chipStorage];
  char v4 = [v3 wedSupport];

  return v4;
}

- (void)updateExtendedMACAddress:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model extended MAC address to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__HMDCHIPAccessoryDataSource_updateExtendedMACAddress_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update CHIP extended MAC address" completion:v7 block:v13];
}

uint64_t __66__HMDCHIPAccessoryDataSource_updateExtendedMACAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChipExtendedMACAddress:*(void *)(a1 + 32)];
}

- (NSString)extendedMACAddress
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  uint64_t v3 = [v2 chipStorage];
  char v4 = [v3 extendedMACAddress];

  return (NSString *)v4;
}

- (void)updatePairings:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model pairings to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HMDCHIPAccessoryDataSource_updatePairings_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update CHIP pairings" completion:v7 block:v13];
}

void __56__HMDCHIPAccessoryDataSource_updatePairings_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "na_map:", &__block_literal_global_39_111690);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setChipPairings:v4];
}

id __56__HMDCHIPAccessoryDataSource_updatePairings_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2E698];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithHMMTRPairing:v3];

  return v4;
}

- (NSSet)pairings
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  id v3 = [v2 chipStorage];
  id v4 = [v3 pairings];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_111694);

  return (NSSet *)v5;
}

uint64_t __38__HMDCHIPAccessoryDataSource_pairings__block_invoke(uint64_t a1, void *a2)
{
  return [a2 chipPluginPairing];
}

- (void)updateAttributeDatabase:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model attribute database to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HMDCHIPAccessoryDataSource_updateAttributeDatabase_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update CHIP attribute database" completion:v7 block:v13];
}

uint64_t __65__HMDCHIPAccessoryDataSource_updateAttributeDatabase_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChipAttributeDatabase:*(void *)(a1 + 32)];
}

- (NSData)attributeDatabase
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  id v3 = [v2 chipStorage];
  id v4 = [v3 attributeDatabase];

  return (NSData *)v4;
}

- (void)updateVendorID:(id)a3 productID:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  BOOL v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v21 = v14;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@updateVendorID:productID: Updating accessory model vendor ID to %@, product ID to %@", buf, 0x20u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__HMDCHIPAccessoryDataSource_updateVendorID_productID_completion___block_invoke;
  v17[3] = &unk_1E6A0F7F0;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [(HMDCHIPAccessoryDataSource *)v12 _updateAccessoryModelWithLabel:@"Update CHIP product ID and vendor ID" completion:v10 block:v17];
}

void __66__HMDCHIPAccessoryDataSource_updateVendorID_productID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setChipVendorID:v3];
  [v4 setChipProductID:*(void *)(a1 + 40)];
}

- (void)updateProductID:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model product ID to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HMDCHIPAccessoryDataSource_updateProductID_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update CHIP product ID" completion:v7 block:v13];
}

uint64_t __57__HMDCHIPAccessoryDataSource_updateProductID_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChipProductID:*(void *)(a1 + 32)];
}

- (NSNumber)productID
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  uint64_t v3 = [v2 chipStorage];
  id v4 = [v3 productID];

  return (NSNumber *)v4;
}

- (void)updateVendorID:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model vendor ID to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HMDCHIPAccessoryDataSource_updateVendorID_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update CHIP vendor ID" completion:v7 block:v13];
}

uint64_t __56__HMDCHIPAccessoryDataSource_updateVendorID_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChipVendorID:*(void *)(a1 + 32)];
}

- (NSNumber)vendorID
{
  v2 = [(HMDCHIPAccessoryDataSource *)self accessory];
  uint64_t v3 = [v2 chipStorage];
  id v4 = [v3 vendorID];

  return (NSNumber *)v4;
}

- (void)updateNodeID:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model node ID to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HMDCHIPAccessoryDataSource_updateNodeID_completion___block_invoke;
  v13[3] = &unk_1E6A0F7C8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPAccessoryDataSource *)v9 _updateAccessoryModelWithLabel:@"Update CHIP node ID" completion:v7 block:v13];
}

uint64_t __54__HMDCHIPAccessoryDataSource_updateNodeID_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChipNodeID:*(void *)(a1 + 32)];
}

- (void)_updateAccessoryModelWithLabel:(id)a3 completion:(id)a4 block:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  v11 = [(HMDCHIPAccessoryDataSource *)self accessory];
  id v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 home];
    if (!v13)
    {
      id v25 = (void *)MEMORY[0x1D9452090]();
      uint64_t v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);
      }
      id v16 = (void (**)(id, void))_Block_copy(v9);
      if (!v16)
      {
        BOOL v13 = 0;
        goto LABEL_22;
      }
      uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v16[2](v16, v19);
      goto LABEL_21;
    }
    id v14 = [v12 transactionWithObjectChangeType:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      v10[2](v10, v16);
      __int16 v17 = [v13 backingStore];
      id v18 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      uint64_t v19 = [v17 transaction:v8 options:v18];

      [v19 add:v16];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __78__HMDCHIPAccessoryDataSource__updateAccessoryModelWithLabel_completion_block___block_invoke;
      v33[3] = &unk_1E6A19358;
      id v34 = v9;
      [v19 run:v33];
      v20 = v34;
    }
    else
    {
      v29 = (void *)MEMORY[0x1D9452090]();
      v30 = self;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v32;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Accessory model is nil", buf, 0xCu);
      }
      uint64_t v19 = (void (**)(void, void))_Block_copy(v9);
      if (!v19)
      {
        id v16 = 0;
        goto LABEL_21;
      }
      v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      ((void (**)(void, void *))v19)[2](v19, v20);
    }

LABEL_21:
    goto LABEL_22;
  }
  v21 = (void *)MEMORY[0x1D9452090]();
  __int16 v22 = self;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v24;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory reference is nil", buf, 0xCu);
  }
  BOOL v13 = (void (**)(void, void))_Block_copy(v9);
  if (v13)
  {
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v13[2](v13, v16);
LABEL_22:
  }
}

void __78__HMDCHIPAccessoryDataSource__updateAccessoryModelWithLabel_completion_block___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 32));
  id v4 = v3;
  if (v3) {
    (*((void (**)(void *, id))v3 + 2))(v3, v5);
  }
}

- (HMDCHIPAccessoryDataSource)initWithNodeID:(id)a3 accessory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v9 = v8;
  if (!v8)
  {
LABEL_7:
    BOOL v13 = (void *)_HMFPreconditionFailure();
    return (HMDCHIPAccessoryDataSource *)+[HMDCHIPAccessoryDataSource logCategory];
  }
  objc_opt_class();
  objc_opt_isKindOfClass();
  v15.receiver = self;
  v15.super_class = (Class)HMDCHIPAccessoryDataSource;
  id v10 = [(HMDCHIPAccessoryDataSource *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nodeID, a3);
    objc_storeWeak((id *)&v11->_accessory, v9);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_111736 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_111736, &__block_literal_global_60_111737);
  }
  v2 = (void *)logCategory__hmf_once_v20_111738;
  return v2;
}

uint64_t __41__HMDCHIPAccessoryDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20_111738;
  logCategory__hmf_once_v20_111738 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end