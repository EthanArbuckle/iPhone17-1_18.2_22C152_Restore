@interface HMDIdentityRegistry
+ (id)logCategory;
+ (id)sharedRegistry;
- (HMDHomeManager)homeManager;
- (HMDIdentityRegistry)init;
- (NSArray)registeredIdentities;
- (NSRecursiveLock)lock;
- (id)_userForIdenity:(id)a3;
- (id)accountsForIdentity:(id)a3;
- (id)attributeDescriptions;
- (id)dumpState;
- (id)identitiesForAccount:(id)a3;
- (id)identitiesForAccountIdentifier:(id)a3;
- (id)identitiesForDevice:(id)a3;
- (id)identityForIdentifier:(id)a3;
- (id)userForDevice:(id)a3;
- (void)deregisterIdentity:(id)a3 object:(id)a4;
- (void)registerIdentity:(id)a3 account:(id)a4 object:(id)a5;
- (void)registerIdentity:(id)a3 device:(id)a4 object:(id)a5;
- (void)reset;
- (void)setHomeManager:(id)a3;
@end

@implementation HMDIdentityRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_registeredIdentities, 0);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (id)dumpState
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  v65 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [(HMDIdentityRegistry *)self registeredIdentities];
  v74 = [MEMORY[0x1E4F28E10] mapTableWithStrongToStrongObjects];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v114 objects:v129 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v115 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v114 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          v12 = [v11 device];
          v13 = [v74 objectForKey:v12];

          if (!v13)
          {
            v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
            v14 = [v11 device];
            [v74 setObject:v13 forKey:v14];
          }
          [v13 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v114 objects:v129 count:16];
    }
    while (v6);
  }
  v63 = v4;

  v70 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v74, "count"));
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = [v74 keyEnumerator];
  uint64_t v72 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
  if (v72)
  {
    uint64_t v68 = *(void *)v111;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v111 != v68) {
          objc_enumerationMutation(obj);
        }
        v76 = *(void **)(*((void *)&v110 + 1) + 8 * v15);
        uint64_t v78 = v15;
        v16 = [v74 objectForKey:v63];
        v84 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v80 = v16;
        uint64_t v17 = [v80 countByEnumeratingWithState:&v106 objects:v127 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v82 = *(void *)v107;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v107 != v82) {
                objc_enumerationMutation(v80);
              }
              v20 = *(void **)(*((void *)&v106 + 1) + 8 * j);
              v21 = [MEMORY[0x1E4F1CA48] array];
              long long v102 = 0u;
              long long v103 = 0u;
              long long v104 = 0u;
              long long v105 = 0u;
              v22 = [v20 registeredObjects];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v102 objects:v126 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v103;
                do
                {
                  for (uint64_t k = 0; k != v24; ++k)
                  {
                    if (*(void *)v103 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    v27 = [*(id *)(*((void *)&v102 + 1) + 8 * k) observedObject];
                    v28 = [v27 description];
                    [v21 addObject:v28];
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v102 objects:v126 count:16];
                }
                while (v24);
              }

              v124[0] = @"Identity";
              v29 = [v20 description];
              v124[1] = @"Objects";
              v125[0] = v29;
              v125[1] = v21;
              v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:2];
              [v84 addObject:v30];
            }
            uint64_t v18 = [v80 countByEnumeratingWithState:&v106 objects:v127 count:16];
          }
          while (v18);
        }

        v31 = [v76 shortDescription];
        [v70 setObject:v84 forKey:v31];

        uint64_t v15 = v78 + 1;
      }
      while (v78 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
    }
    while (v72);
  }

  v32 = (void *)[v70 copy];
  [v65 setObject:v32 forKeyedSubscript:@"deviceIdentities"];

  v75 = [MEMORY[0x1E4F28E10] mapTableWithStrongToStrongObjects];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v33 = v63;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v98 objects:v123 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v99;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v99 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = *(id *)(*((void *)&v98 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v39 = v38;
        }
        else {
          v39 = 0;
        }
        id v40 = v39;

        if (v40)
        {
          v41 = [v40 account];
          v42 = [v75 objectForKey:v41];

          if (!v42)
          {
            v42 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
            v43 = [v40 account];
            [v75 setObject:v42 forKey:v43];
          }
          objc_msgSend(v42, "addObject:", v40, v63);
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v98 objects:v123 count:16];
    }
    while (v35);
  }
  v64 = v33;

  v71 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v75, "count"));
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obja = [v75 keyEnumerator];
  uint64_t v73 = [obja countByEnumeratingWithState:&v94 objects:v122 count:16];
  if (v73)
  {
    uint64_t v69 = *(void *)v95;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v95 != v69) {
          objc_enumerationMutation(obja);
        }
        v77 = *(void **)(*((void *)&v94 + 1) + 8 * v44);
        uint64_t v79 = v44;
        v45 = [v75 objectForKey:v64];
        v85 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v45, "count"));
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v81 = v45;
        uint64_t v46 = [v81 countByEnumeratingWithState:&v90 objects:v121 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v83 = *(void *)v91;
          do
          {
            for (uint64_t n = 0; n != v47; ++n)
            {
              if (*(void *)v91 != v83) {
                objc_enumerationMutation(v81);
              }
              v49 = *(void **)(*((void *)&v90 + 1) + 8 * n);
              v50 = [MEMORY[0x1E4F1CA48] array];
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              v51 = [v49 registeredObjects];
              uint64_t v52 = [v51 countByEnumeratingWithState:&v86 objects:v120 count:16];
              if (v52)
              {
                uint64_t v53 = v52;
                uint64_t v54 = *(void *)v87;
                do
                {
                  for (iuint64_t i = 0; ii != v53; ++ii)
                  {
                    if (*(void *)v87 != v54) {
                      objc_enumerationMutation(v51);
                    }
                    v56 = [*(id *)(*((void *)&v86 + 1) + 8 * ii) observedObject];
                    v57 = [v56 description];
                    [v50 addObject:v57];
                  }
                  uint64_t v53 = [v51 countByEnumeratingWithState:&v86 objects:v120 count:16];
                }
                while (v53);
              }

              v118[0] = @"Identity";
              v58 = [v49 description];
              v118[1] = @"Objects";
              v119[0] = v58;
              v119[1] = v50;
              v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:2];
              [v85 addObject:v59];
            }
            uint64_t v47 = [v81 countByEnumeratingWithState:&v90 objects:v121 count:16];
          }
          while (v47);
        }

        v60 = [v77 shortDescription];
        [v71 setObject:v85 forKey:v60];

        uint64_t v44 = v79 + 1;
      }
      while (v79 + 1 != v73);
      uint64_t v73 = [obja countByEnumeratingWithState:&v94 objects:v122 count:16];
    }
    while (v73);
  }

  v61 = (void *)[v71 copy];
  [v65 setObject:v61 forKeyedSubscript:@"accountIdentities"];

  return v65;
}

- (void)reset
{
  v3 = [(HMDIdentityRegistry *)self lock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__HMDIdentityRegistry_reset__block_invoke;
  v4[3] = &unk_1E6A19B30;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __28__HMDIdentityRegistry_reset__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        __notifyRegisteredIdentityRemoved(*(void **)(a1 + 32), *(void **)(*((void *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeAllObjects", (void)v12);
}

- (void)deregisterIdentity:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(HMDIdentityRegistry *)self lock];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__HMDIdentityRegistry_deregisterIdentity_object___block_invoke;
    v10[3] = &unk_1E6A19668;
    v10[4] = self;
    id v11 = v6;
    id v12 = v8;
    [v9 performBlock:v10];
  }
}

void __49__HMDIdentityRegistry_deregisterIdentity_object___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v37 = v5;
    __int16 v38 = 2112;
    uint64_t v39 = v6;
    __int16 v40 = 2112;
    uint64_t v41 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Deregistering identity, %@, for object: %@", buf, 0x20u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) registeredIdentities];
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      uint64_t v24 = v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        long long v13 = [v12 identity];
        int v14 = [v13 isEqual:*(void *)(a1 + 40)];

        if (v14)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v15 = [v12 registeredObjects];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v27;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v27 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                v21 = [v20 observedObject];
                v22 = *(void **)(a1 + 48);

                if (v21 == v22)
                {
                  __removeRegisteredObjectForRegisteredIdentity(*(void **)(a1 + 32), v12, v20);
                  goto LABEL_19;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_19:

          uint64_t v10 = v23;
          uint64_t v9 = v24;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }
}

- (void)registerIdentity:(id)a3 account:(id)a4 object:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    long long v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = HMFGetLogIdentifier();
      uint64_t v16 = [v9 shortDescription];
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      long long v29 = v16;
      __int16 v30 = 2112;
      long long v31 = v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering identity, %@, for account, %@, for object: %@", buf, 0x2Au);
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F654F8]) initWithObservedObject:v11];
    uint64_t v18 = [(HMDIdentityRegistry *)v13 lock];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__HMDIdentityRegistry_registerIdentity_account_object___block_invoke;
    v20[3] = &unk_1E6A18668;
    v20[4] = v13;
    id v21 = v8;
    id v22 = v9;
    id v23 = v17;
    id v19 = v17;
    [v18 performBlock:v20];
  }
}

void __55__HMDIdentityRegistry_registerIdentity_account_object___block_invoke(void **a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __registeredIdentitiesForIdentity(a1[4], a1[5]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v19 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = (__HMDRegisteredAccountIdentity *)*(id *)(*((void *)&v18 + 1) + 8 * v6);
      objc_opt_class();
      id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      id v9 = v8;

      id v10 = [(__HMDRegisteredAccountIdentity *)v9 account];
      char v11 = [v10 isEqual:a1[6]];

      if (v11) {
        break;
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    if (v9) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_12:
  }
  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = a1[4];
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = HMFGetLogIdentifier();
    uint64_t v16 = a1[5];
    uint64_t v17 = [a1[6] shortDescription];
    *(_DWORD *)buf = 138543874;
    id v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    __int16 v26 = 2112;
    id v27 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Adding identity, %@, for account: %@", buf, 0x20u);
  }
  uint64_t v7 = [[__HMDRegisteredAccountIdentity alloc] initWithIdentity:a1[5] account:a1[6]];
  [*((id *)a1[4] + 1) addObject:v7];
  __notifyRegisteredIdentityAdded(a1[4], v7);
LABEL_17:
  __registerObjectForRegisteredIdentity(a1[4], v7, a1[7]);
}

- (void)registerIdentity:(id)a3 device:(id)a4 object:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      long long v15 = HMFGetLogIdentifier();
      uint64_t v16 = [v9 shortDescription];
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      long long v31 = v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Registering identity, %@, for device, %@, for object: %@", buf, 0x2Au);
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F654F8]) initWithObservedObject:v11];
    long long v18 = [(HMDIdentityRegistry *)v13 lock];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__HMDIdentityRegistry_registerIdentity_device_object___block_invoke;
    v20[3] = &unk_1E6A18668;
    v20[4] = v13;
    id v21 = v8;
    id v22 = v9;
    id v23 = v17;
    id v19 = v17;
    [v18 performBlock:v20];
  }
}

void __54__HMDIdentityRegistry_registerIdentity_device_object___block_invoke(void **a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __registeredIdentitiesForIdentity(a1[4], a1[5]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v19 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = (__HMDRegisteredDeviceIdentity *)*(id *)(*((void *)&v18 + 1) + 8 * v6);
      objc_opt_class();
      id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      id v9 = v8;

      id v10 = [(__HMDRegisteredDeviceIdentity *)v9 device];
      char v11 = [v10 isEqual:a1[6]];

      if (v11) {
        break;
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    if (v9) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_12:
  }
  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = a1[4];
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = HMFGetLogIdentifier();
    uint64_t v16 = a1[5];
    uint64_t v17 = [a1[6] shortDescription];
    *(_DWORD *)buf = 138543874;
    id v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    __int16 v26 = 2112;
    id v27 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Adding identity, %@, for device: %@", buf, 0x20u);
  }
  uint64_t v7 = [[__HMDRegisteredDeviceIdentity alloc] initWithIdentity:a1[5] device:a1[6]];
  [*((id *)a1[4] + 1) addObject:v7];
  __notifyRegisteredIdentityAdded(a1[4], v7);
LABEL_17:
  __registerObjectForRegisteredIdentity(a1[4], v7, a1[7]);
}

- (id)accountsForIdentity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__11390;
    long long v15 = __Block_byref_object_dispose__11391;
    id v16 = 0;
    uint64_t v5 = [(HMDIdentityRegistry *)self lock];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__HMDIdentityRegistry_accountsForIdentity___block_invoke;
    v8[3] = &unk_1E6A19A00;
    v8[4] = self;
    id v9 = v4;
    id v10 = &v11;
    [v5 performBlock:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __43__HMDIdentityRegistry_accountsForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = a1;
  uint64_t v3 = __registeredIdentitiesForIdentity(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v20 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
        id v10 = v9;

        if (v10)
        {
          uint64_t v11 = [v10 account];
          if (v11) {
            goto LABEL_11;
          }
          goto LABEL_12;
        }
        id v12 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        id v10 = v13;

        if (v10)
        {
          int v14 = [v10 device];
          uint64_t v11 = [v14 account];

          if (!v11) {
            goto LABEL_12;
          }
LABEL_11:
          [v2 addObject:v11];
LABEL_12:
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v5 = v15;
    }
    while (v15);
  }

  uint64_t v16 = [v2 array];
  uint64_t v17 = *(void *)(*(void *)(v19 + 48) + 8);
  long long v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

- (id)identitiesForAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__11390;
    uint64_t v15 = __Block_byref_object_dispose__11391;
    id v16 = 0;
    uint64_t v5 = [(HMDIdentityRegistry *)self lock];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__HMDIdentityRegistry_identitiesForAccountIdentifier___block_invoke;
    v8[3] = &unk_1E6A19A00;
    v8[4] = self;
    id v9 = v4;
    id v10 = &v11;
    [v5 performBlock:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

void __54__HMDIdentityRegistry_identitiesForAccountIdentifier___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = *(id *)(a1[4] + 8);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v18 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v7 = v6;
        }
        else {
          uint64_t v7 = 0;
        }
        id v8 = v7;

        id v9 = [v8 account];
        id v10 = [v9 identifier];
        int v11 = [v10 isEqual:a1[5]];

        if (v11)
        {
          id v12 = [v6 identity];
          [v16 addObject:v12];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }

  uint64_t v13 = [v16 array];
  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)identitiesForAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__11390;
    uint64_t v15 = __Block_byref_object_dispose__11391;
    id v16 = 0;
    uint64_t v5 = [(HMDIdentityRegistry *)self lock];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__HMDIdentityRegistry_identitiesForAccount___block_invoke;
    v8[3] = &unk_1E6A19A00;
    v8[4] = self;
    id v9 = v4;
    id v10 = &v11;
    [v5 performBlock:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

void __44__HMDIdentityRegistry_identitiesForAccount___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v17 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v8 = v7;
        }
        else {
          id v8 = 0;
        }
        id v9 = v8;

        id v10 = [v9 account];
        int v11 = [v10 isEqual:a1[5]];

        if (v11)
        {
          id v12 = [v7 identity];
          [v16 addObject:v12];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  uint64_t v13 = [v16 array];
  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)identitiesForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 account];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__11390;
    long long v19 = __Block_byref_object_dispose__11391;
    id v20 = 0;
    id v7 = [(HMDIdentityRegistry *)self lock];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__HMDIdentityRegistry_identitiesForDevice___block_invoke;
    v11[3] = &unk_1E6A0A750;
    v11[4] = self;
    id v12 = v5;
    id v8 = v6;
    id v13 = v8;
    uint64_t v14 = &v15;
    [v7 performBlock:v11];

    id v9 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

void __43__HMDIdentityRegistry_identitiesForDevice___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = *(id *)(a1[4] + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
        id v10 = v9;

        int v11 = objc_msgSend(v10, "device", (void)v21);
        char v12 = [v11 isEqual:a1[5]];

        if (v12) {
          goto LABEL_15;
        }

        if (!a1[6]) {
          goto LABEL_17;
        }
        id v13 = v8;
        objc_opt_class();
        id v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;
        id v10 = v14;

        uint64_t v15 = [v10 account];
        int v16 = [v15 isEqual:a1[6]];

        if (v16)
        {
LABEL_15:
          uint64_t v17 = [v8 identity];
          [v2 addObject:v17];
        }
LABEL_17:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  uint64_t v18 = [v2 array];
  uint64_t v19 = *(void *)(a1[7] + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
}

- (id)userForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[HMDIdentityRegistry sharedRegistry];
  uint64_t v6 = [v5 identitiesForDevice:v4];

  if ([v6 count])
  {
    uint64_t v7 = [v6 firstObject];
    if (v7)
    {
      id v8 = [(HMDIdentityRegistry *)self _userForIdenity:v7];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (id)_userForIdenity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(HMDIdentityRegistry *)self homeManager];
  uint64_t v6 = [v5 homes];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) userWithPairingIdentity:v4];
        if (v11)
        {
          char v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v12 = 0;
LABEL_11:

  return v12;
}

- (id)identityForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__11390;
    long long v15 = __Block_byref_object_dispose__11391;
    id v16 = 0;
    uint64_t v5 = [(HMDIdentityRegistry *)self lock];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__HMDIdentityRegistry_identityForIdentifier___block_invoke;
    v8[3] = &unk_1E6A19A00;
    v8[4] = self;
    id v9 = v4;
    id v10 = &v11;
    [v5 performBlock:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __45__HMDIdentityRegistry_identityForIdentifier___block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = *(id *)(a1[4] + 8);
  uint64_t v2 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v8 = v7;
        }
        else {
          uint64_t v8 = 0;
        }
        id v9 = v8;

        id v10 = [v9 identity];
        uint64_t v11 = [v10 identifier];
        char v12 = [v11 isEqualToString:a1[5]];

        if (v12)
        {
          uint64_t v20 = [v9 identity];
          uint64_t v21 = *(void *)(a1[6] + 8);
          long long v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          long long v23 = obj;
          goto LABEL_21;
        }

        id v13 = v7;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v14 = v13;
        }
        else {
          long long v14 = 0;
        }
        id v15 = v14;

        id v16 = [v15 identity];
        long long v17 = [v16 identifier];
        int v18 = [v17 isEqualToString:a1[5]];

        if (v18)
        {
          uint64_t v19 = [v15 identity];

          id v4 = (id)v19;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v4 = 0;
  }

  uint64_t v24 = *(void *)(a1[6] + 8);
  id v4 = v4;
  long long v23 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v4;
LABEL_21:
}

- (NSArray)registeredIdentities
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__11390;
  uint64_t v11 = __Block_byref_object_dispose__11391;
  id v12 = 0;
  uint64_t v3 = [(HMDIdentityRegistry *)self lock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__HMDIdentityRegistry_registeredIdentities__block_invoke;
  v6[3] = &unk_1E6A18690;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __43__HMDIdentityRegistry_registeredIdentities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return MEMORY[0x1F41817F8]();
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDIdentityRegistry *)self registeredIdentities];
  uint64_t v5 = (void *)[v3 initWithName:@"Identities" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDIdentityRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDIdentityRegistry;
  uint64_t v2 = [(HMDIdentityRegistry *)&v8 init];
  if (v2)
  {
    id v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    locuint64_t k = v2->_lock;
    v2->_locuint64_t k = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    registeredIdentities = v2->_registeredIdentities;
    v2->_registeredIdentities = (NSMutableArray *)v5;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_11402 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_11402, &__block_literal_global_11403);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v28_11404;
  return v2;
}

uint64_t __34__HMDIdentityRegistry_logCategory__block_invoke()
{
  logCategory__hmf_once_v28_11404 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HMDIdentityRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1) {
    dispatch_once(&sharedRegistry_onceToken, block);
  }
  uint64_t v2 = (void *)sharedRegistry_identityRegistry;
  return v2;
}

void __37__HMDIdentityRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_alloc_init(HMDIdentityRegistry);
  id v3 = (void *)sharedRegistry_identityRegistry;
  sharedRegistry_identityRegistry = (uint64_t)v2;

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating HMDIdentity Registry", (uint8_t *)&v8, 0xCu);
  }
}

@end