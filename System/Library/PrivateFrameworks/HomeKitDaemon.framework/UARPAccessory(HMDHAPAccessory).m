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
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch([v4 identityType])
  {
    case 0:
      v5 = [v4 matterVendorID];
      v6 = [v4 matterProductID];
      v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = a1;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v50 = v10;
        __int16 v51 = 2112;
        id v52 = v4;
        __int16 v53 = 2112;
        v54 = v5;
        __int16 v55 = 2112;
        id v56 = v6;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not a valid AFU accessory: %@ vendorID: %@ productID: %@", buf, 0x2Au);
      }

      goto LABEL_25;
    case 1:
      id v11 = objc_alloc_init(NSString);
      v12 = [v4 productData];
      id v48 = v11;
      +[HMDAccessory splitProductDataIntoProductGroupAndProductNumber:v12 productGroup:0 productNumber:&v48];
      id v13 = v48;

      v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = a1;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v50 = v17;
        __int16 v51 = 2112;
        id v52 = v4;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ProductData accessory %@", buf, 0x16u);
      }
      id v18 = objc_alloc(MEMORY[0x263F38308]);
      v19 = [v4 productGroup];
      v20 = [v4 uuid];
      uint64_t v21 = [v18 initWithProductGroup:v19 productNumber:v13 uuid:v20];

      goto LABEL_21;
    case 2:
      v22 = (void *)MEMORY[0x263F38338];
      v23 = [v4 model];
      v24 = [v22 findByAppleModelNumber:v23];

      v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = a1;
      v27 = HMFGetOSLogHandle();
      v28 = v27;
      if (v24)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v50 = v29;
          __int16 v51 = 2112;
          id v52 = v4;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ModelNumber accessory %@", buf, 0x16u);
        }
        id v30 = objc_alloc(MEMORY[0x263F38308]);
        v31 = [v24 hardwareID];
        v32 = [v4 uuid];
        uint64_t v21 = [v30 initWithHardwareID:v31 uuid:v32];
      }
      else
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v50 = v46;
          __int16 v51 = 2112;
          id v52 = v4;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not a CoreUARP suppoorted accessory: %@", buf, 0x16u);
        }
LABEL_25:
        uint64_t v21 = 0;
      }
LABEL_26:

      return v21;
    case 3:
      id v13 = [v4 matterVendorID];
      v33 = [v4 matterProductID];
      v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = a1;
      v36 = HMFGetOSLogHandle();
      v37 = v36;
      if (v13 && v33)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v38 = HMFGetLogIdentifier();
          v39 = [v13 stringValue];
          v40 = [v33 stringValue];
          *(_DWORD *)buf = 138544130;
          v50 = v38;
          __int16 v51 = 2112;
          id v52 = v39;
          __int16 v53 = 2112;
          v54 = v40;
          __int16 v55 = 2112;
          id v56 = v4;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP VendorProductID (%@/%@) accessory %@", buf, 0x2Au);
        }
        id v41 = objc_alloc(MEMORY[0x263F38308]);
        v42 = [v13 stringValue];
        v43 = [v33 stringValue];
        v44 = [v4 uuid];
        uint64_t v21 = [v41 initWithProductGroup:v42 productNumber:v43 uuid:v44];
      }
      else
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v50 = v45;
          __int16 v51 = 2112;
          id v52 = v13;
          __int16 v53 = 2112;
          v54 = v33;
          __int16 v55 = 2112;
          id v56 = v4;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Matter Accessory has a nil vendorID(%@) or productID(%@), not a valid AFU accessory: %@", buf, 0x2Au);
        }
        uint64_t v21 = 0;
      }

LABEL_21:
      goto LABEL_26;
    default:
      goto LABEL_25;
  }
}

@end