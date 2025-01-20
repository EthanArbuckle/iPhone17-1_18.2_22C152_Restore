@interface UARPAccessory(HMDHAPAccessory)
- (id)redactedDescription;
- (uint64_t)initWithHMDHAPAccessory:()HMDHAPAccessory;
@end

@implementation UARPAccessory(HMDHAPAccessory)

- (id)redactedDescription
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [a1 uuid];
  v5 = [v4 UUIDString];
  v6 = [v2 stringWithFormat:@"<%@ %@>", v3, v5];

  return v6;
}

- (uint64_t)initWithHMDHAPAccessory:()HMDHAPAccessory
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch([v4 identityType])
  {
    case 0:
      v5 = [v4 chipStorage];
      v6 = [v5 vendorID];

      v7 = [v4 chipStorage];
      v8 = [v7 productID];

      v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = a1;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v54 = v12;
        __int16 v55 = 2112;
        id v56 = v4;
        __int16 v57 = 2112;
        v58 = v6;
        __int16 v59 = 2112;
        id v60 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not a valid AFU accessory: %@ vendorID: %@ productID: %@", buf, 0x2Au);
      }

      goto LABEL_25;
    case 1:
      id v13 = objc_alloc_init(NSString);
      v14 = [v4 productData];
      id v52 = v13;
      +[HMDAccessory splitProductDataIntoProductGroupAndProductNumber:v14 productGroup:0 productNumber:&v52];
      id v15 = v52;

      v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = a1;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v54 = v19;
        __int16 v55 = 2112;
        id v56 = v4;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ProductData accessory %@", buf, 0x16u);
      }
      id v20 = objc_alloc(MEMORY[0x1E4F5E018]);
      v21 = [v4 productGroup];
      v22 = [v4 uuid];
      uint64_t v23 = [v20 initWithProductGroup:v21 productNumber:v15 uuid:v22];

      goto LABEL_21;
    case 2:
      v24 = (void *)MEMORY[0x1E4F5E030];
      v25 = [v4 model];
      v26 = [v24 findByAppleModelNumber:v25];

      v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = a1;
      v29 = HMFGetOSLogHandle();
      v30 = v29;
      if (v26)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v31;
          __int16 v55 = 2112;
          id v56 = v4;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ModelNumber accessory %@", buf, 0x16u);
        }
        id v32 = objc_alloc(MEMORY[0x1E4F5E018]);
        v33 = [v26 hardwareID];
        v34 = [v4 uuid];
        uint64_t v23 = [v32 initWithHardwareID:v33 uuid:v34];
      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v50 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v50;
          __int16 v55 = 2112;
          id v56 = v4;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Not a CoreUARP suppoorted accessory: %@", buf, 0x16u);
        }
LABEL_25:
        uint64_t v23 = 0;
      }
LABEL_26:

      return v23;
    case 3:
      v35 = [v4 chipStorage];
      id v15 = [v35 vendorID];

      v36 = [v4 chipStorage];
      v37 = [v36 productID];

      v38 = (void *)MEMORY[0x1D9452090]();
      id v39 = a1;
      v40 = HMFGetOSLogHandle();
      v41 = v40;
      if (v15 && v37)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          v42 = HMFGetLogIdentifier();
          v43 = [v15 stringValue];
          v44 = [v37 stringValue];
          *(_DWORD *)buf = 138544130;
          v54 = v42;
          __int16 v55 = 2112;
          id v56 = v43;
          __int16 v57 = 2112;
          v58 = v44;
          __int16 v59 = 2112;
          id v60 = v4;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP VendorProductID (%@/%@) accessory %@", buf, 0x2Au);
        }
        id v45 = objc_alloc(MEMORY[0x1E4F5E018]);
        v46 = [v15 stringValue];
        v47 = [v37 stringValue];
        v48 = [v4 uuid];
        uint64_t v23 = [v45 initWithProductGroup:v46 productNumber:v47 uuid:v48];
      }
      else
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v54 = v49;
          __int16 v55 = 2112;
          id v56 = v15;
          __int16 v57 = 2112;
          v58 = v37;
          __int16 v59 = 2112;
          id v60 = v4;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Matter Accessory has a nil vendorID(%@) or productID(%@), not a valid AFU accessory: %@", buf, 0x2Au);
        }
        uint64_t v23 = 0;
      }

LABEL_21:
      goto LABEL_26;
    default:
      goto LABEL_25;
  }
}

@end