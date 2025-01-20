@interface HMDNetworkRouterFirewallRuleManagerUtils
+ (id)dumpTLVsFromJSONData:(id)a3 error:(id *)a4;
@end

@implementation HMDNetworkRouterFirewallRuleManagerUtils

+ (id)dumpTLVsFromJSONData:(id)a3 error:(id *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  v46 = +[HMDNetworkRouterFirewallRuleManagerOverrideParser parseFromData:](HMDNetworkRouterFirewallRuleManagerOverrideParser, "parseFromData:");
  if (v46)
  {
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__109402;
    v59 = __Block_byref_object_dispose__109403;
    id v60 = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __71__HMDNetworkRouterFirewallRuleManagerUtils_dumpTLVsFromJSONData_error___block_invoke;
    v52[3] = &unk_1E6A0F550;
    v54 = &v55;
    id v44 = v4;
    id v53 = v44;
    [v46 enumerateKeysAndObjectsUsingBlock:v52];
    v5 = (void *)v56[5];
    if (v5)
    {
      if (a4)
      {
        id v6 = v5;
LABEL_12:
        v7 = 0;
        *a4 = v6;
LABEL_43:

        _Block_object_dispose(&v55, 8);
        goto LABEL_44;
      }
    }
    else
    {
      if (!objc_msgSend(v44, "hmf_isEmpty"))
      {
        if ((unint64_t)[v44 count] >= 2)
        {
          v11 = (void *)MEMORY[0x1D9452090]();
          HMFGetOSLogHandle();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v13 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v14 = [v44 count];
            *(_DWORD *)buf = 138543618;
            id v69 = v13;
            __int16 v70 = 2048;
            uint64_t v71 = v14;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Multiple declarations (%lu) found, choosing the first", buf, 0x16u);
          }
        }
        v37 = [v44 firstObject];
        v38 = [v37 ruleConfigurations];
        if (objc_msgSend(v38, "hmf_isEmpty"))
        {
          v15 = (void *)MEMORY[0x1D9452090]();
          HMFGetOSLogHandle();
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v69 = v17;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@No rule configurations were found", buf, 0xCu);
          }
          if (a4)
          {
            [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
            v7 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = 0;
          }
        }
        else
        {
          v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id obj = v38;
          uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v67 count:16];
          if (v18)
          {
            uint64_t v42 = *(void *)v49;
            while (2)
            {
              uint64_t v19 = 0;
              uint64_t v41 = v18;
              do
              {
                if (*(void *)v49 != v42) {
                  objc_enumerationMutation(obj);
                }
                v20 = *(void **)(*((void *)&v48 + 1) + 8 * v19);
                v21 = +[HMDNetworkRouterWANFirewallConfiguration configurationFromFirewallRuleConfiguration:v20];
                v22 = +[HMDNetworkRouterLANFirewallConfiguration configurationFromFirewallRuleConfiguration:v20];
                v23 = [v21 serializeWithError:a4];
                if (v23)
                {
                  v24 = [v22 serializeWithError:a4];
                  if (v24)
                  {
                    v65[0] = @"wan";
                    v43 = objc_msgSend(v23, "hmf_hexadecimalStringWithOptions:", 2);
                    v65[1] = @"lan";
                    v66[0] = v43;
                    v25 = objc_msgSend(v24, "hmf_hexadecimalStringWithOptions:", 2);
                    v66[1] = v25;
                    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
                    v27 = [v20 accessoryIdentifier];
                    v28 = [v27 firmwareVersion];
                    v29 = [v28 versionString];
                    [v39 setObject:v26 forKeyedSubscript:v29];

                    int v30 = 0;
                  }
                  else
                  {
                    int v30 = 1;
                  }
                }
                else
                {
                  int v30 = 1;
                }

                if (v30)
                {
                  v7 = 0;
                  goto LABEL_40;
                }
                ++v19;
              }
              while (v41 != v19);
              uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v67 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id obj = [v37 baseAccessoryIdentifier];
          v31 = [obj productGroup];
          v63 = v31;
          v32 = [obj productNumber];
          v61 = v32;
          v33 = (void *)[v39 copy];
          v62 = v33;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          v64 = v34;
          v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];

          v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v35 options:3 error:a4];

LABEL_40:
        }

        goto LABEL_43;
      }
      v8 = (void *)MEMORY[0x1D9452090]();
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v69 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@No network declarations were found", buf, 0xCu);
      }
      if (a4)
      {
        id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        goto LABEL_12;
      }
    }
    v7 = 0;
    goto LABEL_43;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_44:

  return v7;
}

void __71__HMDNetworkRouterFirewallRuleManagerUtils_dumpTLVsFromJSONData_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = [v8 objectForKeyedSubscript:@"networkDeclarations"];

  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"networkDeclarations"];
    v11 = [[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc] initWithBaseAccessoryIdentifier:v7 data:v10 allowUnzippedData:1];
    if (v11)
    {
      [*(id *)(a1 + 32) addObject:v11];
    }
    else
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid declarations found", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      *a4 = 1;
    }
  }
}

@end