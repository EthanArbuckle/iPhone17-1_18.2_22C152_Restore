@interface HMDNetworkRouterFirewallRuleManagerOverrideParser
+ (id)_parseOverrideNetworkDeclarationsWithProductGroup:(id)a3 productNumber:(id)a4 productNumberDictionary:(id)a5 accessoryIdentifier:(id)a6;
+ (id)_parseOverridePairedMetadataWithProductGroup:(id)a3 productNumber:(id)a4 productNumberDictionary:(id)a5 accessoryIdentifier:(id)a6;
+ (id)logCategory;
+ (id)parseFromData:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleManagerOverrideParser

+ (id)_parseOverridePairedMetadataWithProductGroup:(id)a3 productNumber:(id)a4 productNumberDictionary:(id)a5 accessoryIdentifier:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v10 = a4;
  v11 = (__CFString *)a5;
  id v12 = a6;
  id v13 = [(__CFString *)v11 objectForKeyedSubscript:@"pairedMetadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    id v35 = 0;
    v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:&v35];
    id v17 = v35;
    if (v16)
    {
      v18 = [[HMDCloudPairedMetadata alloc] initWithBaseAccessoryIdentifier:v12 data:v16 allowUnzippedData:1];
      if (v18)
      {
        id v19 = v16;
      }
      else
      {
        context = (void *)MEMORY[0x1D9452090]();
        id v28 = a1;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v37 = v31;
          __int16 v38 = 2112;
          id v39 = v34;
          __int16 v40 = 2112;
          id v41 = v10;
          __int16 v42 = 2112;
          v43 = v11;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' did not parse correctly: %@", buf, 0x2Au);
        }
        id v19 = 0;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = a1;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = contexta = v24;
        *(_DWORD *)buf = 138544386;
        v37 = v27;
        __int16 v38 = 2112;
        id v39 = v34;
        __int16 v40 = 2112;
        id v41 = v10;
        __int16 v42 = 2112;
        v43 = v11;
        __int16 v44 = 2112;
        id v45 = v17;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' failed to convert to JSON: %@: %@", buf, 0x34u);

        v24 = contexta;
      }

      id v19 = 0;
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = a1;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      v37 = v23;
      __int16 v38 = 2112;
      id v39 = v34;
      __int16 v40 = 2112;
      id v41 = v10;
      __int16 v42 = 2112;
      v43 = @"pairedMetadata";
      __int16 v44 = 2112;
      id v45 = v13;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON for '%@':'%@' contains an invalid '%@' value: %@", buf, 0x34u);
    }
    id v19 = 0;
  }

  return v19;
}

+ (id)_parseOverrideNetworkDeclarationsWithProductGroup:(id)a3 productNumber:(id)a4 productNumberDictionary:(id)a5 accessoryIdentifier:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v10 = a4;
  v11 = (__CFString *)a5;
  id v12 = a6;
  id v13 = [(__CFString *)v11 objectForKeyedSubscript:@"networkDeclarations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    id v35 = 0;
    v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:&v35];
    id v17 = v35;
    if (v16)
    {
      v18 = [[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc] initWithBaseAccessoryIdentifier:v12 data:v16 allowUnzippedData:1];
      if (v18)
      {
        id v19 = v16;
      }
      else
      {
        context = (void *)MEMORY[0x1D9452090]();
        id v28 = a1;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v37 = v31;
          __int16 v38 = 2112;
          id v39 = v34;
          __int16 v40 = 2112;
          id v41 = v10;
          __int16 v42 = 2112;
          v43 = v11;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' did not parse correctly: %@", buf, 0x2Au);
        }
        id v19 = 0;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = a1;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = contexta = v24;
        *(_DWORD *)buf = 138544386;
        v37 = v27;
        __int16 v38 = 2112;
        id v39 = v34;
        __int16 v40 = 2112;
        id v41 = v10;
        __int16 v42 = 2112;
        v43 = v11;
        __int16 v44 = 2112;
        id v45 = v17;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' failed to convert to JSON: %@: %@", buf, 0x34u);

        v24 = contexta;
      }

      id v19 = 0;
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = a1;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      v37 = v23;
      __int16 v38 = 2112;
      id v39 = v34;
      __int16 v40 = 2112;
      id v41 = v10;
      __int16 v42 = 2112;
      v43 = @"networkDeclarations";
      __int16 v44 = 2112;
      id v45 = v13;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON for '%@':'%@' contains an invalid '%@' value: %@", buf, 0x34u);
    }
    id v19 = 0;
  }

  return v19;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v36 = 0;
  v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v36];
  id v6 = v36;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v14 = v5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v16 = v14;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if (isKindOfClass)
    {
      v18 = [MEMORY[0x1E4F1CA60] dictionary];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v42 = 0;
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      v31 = __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke;
      v32 = &unk_1E6A076F8;
      id v34 = buf;
      id v35 = a1;
      id v19 = v18;
      id v33 = v19;
      [v14 enumerateKeysAndObjectsUsingBlock:&v29];
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        id v13 = 0;
      }
      else
      {
        if (!objc_msgSend(v19, "count", v29, v30, v31, v32))
        {
          v24 = (void *)MEMORY[0x1D9452090]();
          id v25 = a1;
          HMFGetOSLogHandle();
          v26 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = HMFGetLogIdentifier();
            *(_DWORD *)v37 = 138543618;
            __int16 v38 = v27;
            __int16 v39 = 2112;
            id v40 = v14;
            _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@JSON contains no overrides: %@", v37, 0x16u);
          }
        }
        id v13 = (void *)[v19 copy];
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = a1;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON is not a dictionary: %@", buf, 0x16u);
      }
      id v13 = 0;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse JSON: %@", buf, 0x16u);
    }
    id v13 = 0;
  }

  return v13;
}

void __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    id v10 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke_7;
      v19[3] = &unk_1E6A14EB8;
      uint64_t v22 = *(void *)(a1 + 40);
      id v13 = v7;
      uint64_t v14 = *(void *)(a1 + 48);
      id v20 = v13;
      uint64_t v23 = v14;
      id v21 = *(id *)(a1 + 32);
      [v12 enumerateKeysAndObjectsUsingBlock:v19];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = *(id *)(a1 + 48);
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v25 = v18;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        id v29 = v10;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@JSON value for '%@' is not a dictionary: %@", buf, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

void __67__HMDNetworkRouterFirewallRuleManagerOverrideParser_parseFromData___block_invoke_7(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v9 = [*(id *)(a1 + 32) stringByAppendingString:v7];
    if (!+[HMDAccessory validateProductData:v9])
    {
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 56);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v52 = (uint64_t)v20;
        __int16 v53 = 2112;
        v54 = v9;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Computed product data is invalid: %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_39;
    }
    id v10 = [[HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc] initWithProductGroup:*(void *)(a1 + 32) productNumber:v7 firmwareVersion:0];
    v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 56);
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        id v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v52 = (uint64_t)v15;
        __int16 v53 = 2112;
        v54 = v16;
        __int16 v55 = 2112;
        id v56 = v7;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Overrides contain multiple entries for '%@':'%@'", buf, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_38;
    }
    id v21 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    id v23 = v22;

    if (!v23)
    {
      v31 = (void *)MEMORY[0x1D9452090]();
      id v32 = *(id *)(a1 + 56);
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v34 = contextb = v31;
        id v35 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        uint64_t v52 = (uint64_t)v34;
        __int16 v53 = 2112;
        v54 = v35;
        __int16 v55 = 2112;
        id v56 = v7;
        __int16 v57 = 2112;
        id v58 = v21;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@JSON value for '%@':'%@' is not a dictionary: %@", buf, 0x2Au);

        v31 = contextb;
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_37;
    }
    v24 = [MEMORY[0x1E4F1CA60] dictionary];
    id v25 = [v23 objectForKeyedSubscript:@"networkDeclarations"];

    if (v25)
    {
      uint64_t v26 = +[HMDNetworkRouterFirewallRuleManagerOverrideParser _parseOverrideNetworkDeclarationsWithProductGroup:*(void *)(a1 + 32) productNumber:v7 productNumberDictionary:v23 accessoryIdentifier:v10];
      if (!v26)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        id v36 = (void *)MEMORY[0x1D9452090]();
        id v37 = *(id *)(a1 + 56);
        __int16 v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v39 = context = v36;
          id v40 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          uint64_t v52 = (uint64_t)v39;
          __int16 v53 = 2112;
          v54 = v40;
          __int16 v55 = 2112;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v23;
          id v41 = "%{public}@JSON dictionary for '%@':'%@' did not parse network declarations correctly: %@";
LABEL_34:
          _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, v41, buf, 0x2Au);

          id v36 = context;
        }
LABEL_35:

LABEL_36:

LABEL_37:
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      id v27 = (void *)v26;
      [v24 setObject:v26 forKeyedSubscript:@"networkDeclarations"];
    }
    __int16 v28 = [v23 objectForKeyedSubscript:@"pairedMetadata"];

    if (!v28)
    {
LABEL_21:
      if ([v23 count])
      {
        uint64_t v30 = (void *)[v24 copy];
        [*(id *)(a1 + 40) setObject:v30 forKeyedSubscript:v10];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        contexta = (void *)MEMORY[0x1D9452090]();
        id v42 = *(id *)(a1 + 56);
        uint64_t v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = HMFGetLogIdentifier();
          id v45 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          uint64_t v52 = v44;
          uint64_t v46 = (void *)v44;
          __int16 v53 = 2112;
          v54 = v45;
          __int16 v55 = 2112;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v23;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@JSON dictionary for '%@':'%@' did not have network declaration or pairedMetadata: %@", buf, 0x2Au);
        }
      }

      goto LABEL_36;
    }
    uint64_t v29 = +[HMDNetworkRouterFirewallRuleManagerOverrideParser _parseOverridePairedMetadataWithProductGroup:*(void *)(a1 + 32) productNumber:v7 productNumberDictionary:v23 accessoryIdentifier:v10];
    if (v29)
    {
      __int16 v28 = (void *)v29;
      [v24 setObject:v29 forKeyedSubscript:@"pairedMetadata"];
      goto LABEL_21;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v36 = (void *)MEMORY[0x1D9452090]();
    id v37 = *(id *)(a1 + 56);
    __int16 v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      __int16 v39 = context = v36;
      v47 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      uint64_t v52 = (uint64_t)v39;
      __int16 v53 = 2112;
      v54 = v47;
      __int16 v55 = 2112;
      id v56 = v7;
      __int16 v57 = 2112;
      id v58 = v23;
      id v41 = "%{public}@JSON dictionary for '%@':'%@' did not parse pairedMetadata correctly: %@";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  *a4 = 1;
LABEL_40:
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_12387 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_12387, &__block_literal_global_12388);
  }
  v2 = (void *)logCategory__hmf_once_v1_12389;
  return v2;
}

uint64_t __64__HMDNetworkRouterFirewallRuleManagerOverrideParser_logCategory__block_invoke()
{
  logCategory__hmf_once_v1_12389 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end