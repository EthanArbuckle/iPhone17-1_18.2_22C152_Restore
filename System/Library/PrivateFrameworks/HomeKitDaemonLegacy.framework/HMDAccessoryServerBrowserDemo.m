@interface HMDAccessoryServerBrowserDemo
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)accessoryPaired;
- (BOOL)browsing;
- (HAPAccessoryServerBrowserDelegate)delegate;
- (NSDictionary)demoData;
- (NSMutableArray)servers;
- (OS_dispatch_queue)delegateQueue;
- (id)_handleTestAccessoryGenerateNotification:(id)a3;
- (id)_handleTestAccessoryReadValue:(id)a3;
- (id)_handleTestAccessorySetReachability:(id)a3;
- (id)_handleTestAccessorySetValue:(id)a3 response:(id *)a4;
- (id)_handleTestModeConfigRequest:(id)a3 response:(id *)a4;
- (int64_t)linkType;
- (void)appendDemoData:(id)a3;
- (void)discoverAccessoryServerWithIdentifier:(id)a3;
- (void)discoverServer;
- (void)loadDemoData:(id)a3 finalized:(BOOL)a4;
- (void)resetDemoAccessories;
- (void)resetDemoAccessory:(id)a3;
- (void)setAccessoryPaired:(BOOL)a3;
- (void)setBrowsing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setDemoData:(id)a3;
- (void)setServers:(id)a3;
- (void)startDiscoveringAccessoryServers;
- (void)stopDiscoveringAccessoryServers;
@end

@implementation HMDAccessoryServerBrowserDemo

void __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) servers];
  v3 = objc_msgSend(v2, "hmf_firstObjectWithValue:forKeyPath:", *(void *)(a1 + 40), @"identifier");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    if ([v4 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
    {
      v5 = [*(id *)(a1 + 32) delegateQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_2;
      v11[3] = &unk_1E6A197C8;
      v11[4] = *(void *)(a1 + 32);
      v6 = &v12;
      id v12 = v3;
      v7 = v11;
LABEL_6:
      dispatch_async(v5, v7);
    }
  }
  else if ([v4 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])
  {
    v5 = [*(id *)(a1 + 32) delegateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_3;
    v9[3] = &unk_1E6A197C8;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    v6 = &v10;
    id v10 = v8;
    v7 = v9;
    goto LABEL_6;
  }
}

- (NSMutableArray)servers
{
  return self->_servers;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  v4 = [(HMDAccessoryServerBrowserDemo *)self delegate];
  if (v4)
  {
    v5 = [(HMDAccessoryServerBrowserDemo *)self delegateQueue];
    if (v5) {
      char v6 = objc_opt_respondsToSelector();
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (HAPAccessoryServerBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HAPAccessoryServerBrowserDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

void __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoData, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBrowsing:(BOOL)a3
{
  *(&self->_browsing + 4) = a3;
}

- (BOOL)browsing
{
  return *(&self->_browsing + 4);
}

- (void)setAccessoryPaired:(BOOL)a3
{
  *(&self->_browsing + 3) = a3;
}

- (BOOL)accessoryPaired
{
  return *(&self->_browsing + 3);
}

- (void)setDemoData:(id)a3
{
}

- (NSDictionary)demoData
{
  return self->_demoData;
}

- (void)setServers:(id)a3
{
}

- (void)setDelegateQueue:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (id)_handleTestModeConfigRequest:(id)a3 response:(id *)a4
{
  id v6 = a3;
  v7 = objc_msgSend(v6, "hmf_arrayForKey:", @"kConfigTestingSetReturnValueKey");
  if (v7)
  {
    id v8 = [(HMDAccessoryServerBrowserDemo *)self _handleTestAccessorySetValue:v7 response:a4];
  }
  else
  {
    v9 = objc_msgSend(v6, "hmf_arrayForKey:", @"kConfigTestingSetReachabilityKey");
    if (v9)
    {
      id v8 = [(HMDAccessoryServerBrowserDemo *)self _handleTestAccessorySetReachability:v9];
    }
    else
    {
      id v10 = objc_msgSend(v6, "hmf_arrayForKey:", @"kConfigTestingGenerateNotificationKey");
      if (v10)
      {
        id v8 = [(HMDAccessoryServerBrowserDemo *)self _handleTestAccessoryGenerateNotification:v10];
      }
      else
      {
        v11 = objc_msgSend(v6, "hmf_arrayForKey:", @"kConfigTestingReadValueKey");
        if (v11)
        {
          id v8 = [(HMDAccessoryServerBrowserDemo *)self _handleTestAccessoryReadValue:v11];
        }
        else
        {
          id v8 = 0;
        }
      }
    }
  }
  return v8;
}

- (id)_handleTestAccessoryReadValue:(id)a3
{
  return 0;
}

- (id)_handleTestAccessoryGenerateNotification:(id)a3
{
  return 0;
}

- (id)_handleTestAccessorySetReachability:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = a3;
  uint64_t v48 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
  id v4 = 0;
  if (v48)
  {
    uint64_t v47 = *(void *)v62;
    *(void *)&long long v3 = 138543874;
    long long v44 = v3;
    while (2)
    {
      uint64_t v5 = 0;
      id v6 = v4;
      do
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v61 + 1) + 8 * v5);
        id v8 = objc_msgSend(v7, "hmf_stringForKey:", @"kAccessoryName", v44);
        v9 = objc_msgSend(v7, "hmf_numberForKey:", @"kAccessoryInstanceIDKey");
        char v60 = 0;
        uint64_t v10 = objc_msgSend(v7, "hmf_BOOLForKey:isPresent:", @"kAccessoryIsReachableKey", &v60);
        if (!v60)
        {
          v40 = (void *)MEMORY[0x1D9452090](v10);
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v66 = v42;
            __int16 v67 = 2112;
            v68 = v7;
            _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@No reachability setting for the setReachability request: %@", buf, 0x16u);
          }
          id v4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];

          goto LABEL_48;
        }
        unsigned int v50 = v10;
        v51 = v6;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v11 = [(HMDAccessoryServerBrowserDemo *)self servers];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v56 objects:v74 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v57;
LABEL_9:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v57 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
            v17 = [v16 identifier];
            char v18 = [v17 isEqual:v8];

            if (v18) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v56 objects:v74 count:16];
              if (v13) {
                goto LABEL_9;
              }
              goto LABEL_15;
            }
          }
          id v19 = v16;

          if (!v19) {
            goto LABEL_27;
          }
          id v46 = v19;
          if (v9)
          {
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            v20 = [v19 accessories];
            v21 = (void *)[v20 countByEnumeratingWithState:&v52 objects:v73 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v53;
              while (2)
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v53 != v22) {
                    objc_enumerationMutation(v20);
                  }
                  v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                  v25 = [v24 instanceID];
                  int v26 = [v9 isEqual:v25];

                  if (v26)
                  {
                    id v32 = v24;
                    goto LABEL_32;
                  }
                }
                v21 = (void *)[v20 countByEnumeratingWithState:&v52 objects:v73 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
          }
          else
          {
            v20 = [v19 accessories];
            id v32 = [v20 firstObject];
LABEL_32:
            v21 = v32;
          }

          v33 = (void *)MEMORY[0x1D9452090]();
          v34 = HMFGetOSLogHandle();
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
          if (v21)
          {
            if (v35)
            {
              v36 = HMFGetLogIdentifier();
              v37 = HMFBooleanToString();
              *(_DWORD *)buf = 138544130;
              v66 = v36;
              __int16 v67 = 2112;
              v68 = v8;
              __int16 v69 = 2112;
              v70 = v9;
              __int16 v71 = 2112;
              v72 = v37;
              _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Setting the reachability of accessory %@+%@ to %@", buf, 0x2Au);
            }
            [v21 setReachable:v50];
            int v38 = 0;
            id v4 = v51;
          }
          else
          {
            if (v35)
            {
              v39 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v44;
              v66 = v39;
              __int16 v67 = 2112;
              v68 = v8;
              __int16 v69 = 2112;
              v70 = v9;
              _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@", buf, 0x20u);
            }
            int v38 = 2;
            id v4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
          }
          v29 = v46;
          int v31 = v38;
        }
        else
        {
LABEL_15:

LABEL_27:
          v27 = (void *)MEMORY[0x1D9452090]();
          v28 = HMFGetOSLogHandle();
          v29 = v51;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v66 = v30;
            __int16 v67 = 2112;
            v68 = v8;
            _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessoryServer with deviceIdentifier %@", buf, 0x16u);
          }
          int v31 = 2;
          id v4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
        }

        if (v31) {
          goto LABEL_48;
        }
        ++v5;
        id v6 = v4;
      }
      while (v5 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
      if (v48) {
        continue;
      }
      break;
    }
  }
LABEL_48:

  return v4;
}

- (id)_handleTestAccessorySetValue:(id)a3 response:(id *)a4
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v100 = [MEMORY[0x1E4F1CA48] array];
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obj = v4;
  uint64_t v108 = [obj countByEnumeratingWithState:&v132 objects:v157 count:16];
  uint64_t v5 = 0;
  if (v108)
  {
    uint64_t v107 = *(void *)v133;
    do
    {
      uint64_t v6 = 0;
      do
      {
        v112 = v5;
        if (*(void *)v133 != v107) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v132 + 1) + 8 * v6);
        v111 = (void *)[v7 mutableCopy];
        id v8 = objc_msgSend(v7, "hmf_stringForKey:", @"kAccessoryName");
        v9 = objc_msgSend(v7, "hmf_numberForKey:", @"kAccessoryInstanceIDKey");
        v115 = objc_msgSend(v7, "hmf_numberForKey:", @"kServiceInstanceID");
        v114 = objc_msgSend(v7, "hmf_numberForKey:", @"kCharacteristicInstanceID");
        uint64_t v110 = [v7 objectForKey:@"kCharacteristicValue"];
        uint64_t v113 = objc_msgSend(v7, "hmf_numberForKey:", @"kConfigTestingResponseDelayKey");
        int v105 = objc_msgSend(v7, "hmf_BOOLForKey:", @"kCharacteristicEnableNotificationRequestKey");
        long long v128 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        uint64_t v10 = [(HMDAccessoryServerBrowserDemo *)self servers];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v128 objects:v156 count:16];
        if (!v11) {
          goto LABEL_14;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v129;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v129 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v128 + 1) + 8 * i);
            v16 = [v15 identifier];
            char v17 = [v16 isEqual:v8];

            if (v17)
            {
              id v18 = v15;

              if (!v18) {
                goto LABEL_26;
              }
              id v104 = v18;
              if (v9)
              {
                long long v126 = 0u;
                long long v127 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
                id v19 = [v18 accessories];
                uint64_t v20 = [v19 countByEnumeratingWithState:&v124 objects:v155 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v125;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v21; ++j)
                    {
                      if (*(void *)v125 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      v24 = *(void **)(*((void *)&v124 + 1) + 8 * j);
                      v25 = [v24 instanceID];
                      int v26 = [v9 isEqual:v25];

                      if (v26)
                      {
                        id v35 = v24;
                        goto LABEL_31;
                      }
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v124 objects:v155 count:16];
                    if (v21) {
                      continue;
                    }
                    break;
                  }
                }

LABEL_41:
                v45 = (void *)MEMORY[0x1D9452090]();
                id v46 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  uint64_t v47 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  v140 = v47;
                  __int16 v141 = 2112;
                  v142 = v8;
                  __int16 v143 = 2112;
                  v144 = v9;
                  _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@", buf, 0x20u);
                }
                int v30 = 2;
                uint64_t v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
                uint64_t v48 = 0;
LABEL_57:
                int v31 = v111;
                long long v61 = v112;
                v33 = (void *)v110;
                v34 = (void *)v113;
                id v32 = v104;
              }
              else
              {
                id v19 = [v18 accessories];
                id v35 = [v19 firstObject];
LABEL_31:
                v36 = v35;

                if (!v36) {
                  goto LABEL_41;
                }
                long long v122 = 0u;
                long long v123 = 0u;
                long long v120 = 0u;
                long long v121 = 0u;
                v102 = v36;
                v37 = [v36 services];
                uint64_t v38 = [v37 countByEnumeratingWithState:&v120 objects:v154 count:16];
                if (!v38)
                {
LABEL_40:

LABEL_54:
                  long long v58 = (void *)MEMORY[0x1D9452090]();
                  long long v59 = HMFGetOSLogHandle();
                  uint64_t v48 = v102;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    char v60 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138544130;
                    v140 = v60;
                    __int16 v141 = 2112;
                    v142 = v8;
                    __int16 v143 = 2112;
                    v144 = v9;
                    __int16 v145 = 2112;
                    v146 = v115;
                    _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@, serviceInstanceID %@", buf, 0x2Au);
                  }
                  int v30 = 2;
                  uint64_t v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
                  goto LABEL_57;
                }
                uint64_t v39 = v38;
                uint64_t v40 = *(void *)v121;
LABEL_34:
                uint64_t v41 = 0;
                while (1)
                {
                  if (*(void *)v121 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  v42 = *(void **)(*((void *)&v120 + 1) + 8 * v41);
                  v43 = [v42 instanceID];
                  char v44 = [v115 isEqual:v43];

                  if (v44) {
                    break;
                  }
                  if (v39 == ++v41)
                  {
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v120 objects:v154 count:16];
                    if (v39) {
                      goto LABEL_34;
                    }
                    goto LABEL_40;
                  }
                }
                id v49 = v42;

                if (!v49) {
                  goto LABEL_54;
                }
                long long v118 = 0u;
                long long v119 = 0u;
                long long v116 = 0u;
                long long v117 = 0u;
                id v101 = v49;
                unsigned int v50 = [v49 characteristics];
                uint64_t v51 = [v50 countByEnumeratingWithState:&v116 objects:v153 count:16];
                if (v51)
                {
                  uint64_t v52 = v51;
                  uint64_t v53 = *(void *)v117;
LABEL_47:
                  uint64_t v54 = 0;
                  while (1)
                  {
                    if (*(void *)v117 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    long long v55 = *(void **)(*((void *)&v116 + 1) + 8 * v54);
                    long long v56 = [v55 instanceID];
                    char v57 = [v114 isEqual:v56];

                    if (v57) {
                      break;
                    }
                    if (v52 == ++v54)
                    {
                      uint64_t v52 = [v50 countByEnumeratingWithState:&v116 objects:v153 count:16];
                      if (v52) {
                        goto LABEL_47;
                      }
                      goto LABEL_53;
                    }
                  }
                  id v62 = v55;

                  if (!v62) {
                    goto LABEL_67;
                  }
                  int v31 = v111;
                  v34 = (void *)v113;
                  if (v113)
                  {
                    long long v63 = (void *)MEMORY[0x1D9452090]();
                    long long v64 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                    {
                      v65 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138544642;
                      v140 = v65;
                      __int16 v141 = 2112;
                      v142 = v8;
                      __int16 v143 = 2112;
                      v144 = v9;
                      __int16 v145 = 2112;
                      v146 = v115;
                      __int16 v147 = 2112;
                      v148 = v114;
                      __int16 v149 = 2112;
                      uint64_t v150 = v113;
                      _os_log_impl(&dword_1D49D5000, v64, OS_LOG_TYPE_INFO, "%{public}@Setting the responseDelay for characteristic (%@+%@/%@/%@) to %@", buf, 0x3Eu);
                    }
                    uint64_t v66 = [v62 setResponseDelay:v113];
                  }
                  else
                  {
                    v73 = [v62 responseDelay];

                    if (v73)
                    {
                      v74 = [v62 responseDelay];
                      [v111 setObject:v74 forKey:@"kConfigTestingResponseDelayKey"];

                      v75 = (void *)MEMORY[0x1D9452090]();
                      uint64_t v76 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
                      {
                        v77 = HMFGetLogIdentifier();
                        v78 = [v62 responseDelay];
                        *(_DWORD *)buf = 138544642;
                        v140 = v77;
                        __int16 v141 = 2112;
                        v142 = v8;
                        __int16 v143 = 2112;
                        v144 = v9;
                        __int16 v145 = 2112;
                        v146 = v115;
                        __int16 v147 = 2112;
                        v148 = v114;
                        __int16 v149 = 2112;
                        uint64_t v150 = (uint64_t)v78;
                        _os_log_impl(&dword_1D49D5000, v76, OS_LOG_TYPE_INFO, "%{public}@Getting the value for characteristic responseDelay (%@+%@/%@/%@): %@ ", buf, 0x3Eu);

                        v34 = 0;
                      }
                    }
                  }
                  v99 = v62;
                  v79 = (void *)MEMORY[0x1D9452090](v66);
                  v80 = HMFGetOSLogHandle();
                  BOOL v81 = os_log_type_enabled(v80, OS_LOG_TYPE_INFO);
                  v33 = (void *)v110;
                  if (v110)
                  {
                    v72 = v112;
                    id v32 = v104;
                    if (v81)
                    {
                      HMFGetLogIdentifier();
                      v82 = v96 = v79;
                      v83 = [v99 responseDelay];
                      *(_DWORD *)buf = 138544898;
                      v140 = v82;
                      __int16 v141 = 2112;
                      v142 = v8;
                      __int16 v143 = 2112;
                      v144 = v9;
                      __int16 v145 = 2112;
                      v146 = v115;
                      __int16 v147 = 2112;
                      v148 = v114;
                      __int16 v149 = 2112;
                      uint64_t v150 = v110;
                      __int16 v151 = 2112;
                      v152 = v83;
                      _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_INFO, "%{public}@Setting the value for characteristic (%@+%@/%@/%@) to %@ with responseDelay %@ milliseconds", buf, 0x48u);

                      v34 = (void *)v113;
                      v79 = v96;
                    }

                    uint64_t v84 = [v99 setValue:v110];
                  }
                  else
                  {
                    v72 = v112;
                    id v32 = v104;
                    if (v81)
                    {
                      HMFGetLogIdentifier();
                      v85 = v97 = v79;
                      *(_DWORD *)buf = 138544642;
                      v140 = v85;
                      __int16 v141 = 2112;
                      v142 = v8;
                      __int16 v143 = 2112;
                      v144 = v9;
                      __int16 v145 = 2112;
                      v146 = v115;
                      __int16 v147 = 2112;
                      v148 = v114;
                      __int16 v149 = 2112;
                      uint64_t v150 = 0;
                      _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_INFO, "%{public}@Getting the value for characteristic (%@+%@/%@/%@): %@ ", buf, 0x3Eu);

                      v79 = v97;
                    }

                    v86 = [v99 value];
                    if (v86)
                    {
                      [v111 setObject:v86 forKey:@"kCharacteristicValue"];
                    }
                    else
                    {
                      v87 = [MEMORY[0x1E4F1CA98] null];
                      [v111 setObject:v87 forKey:@"kCharacteristicValue"];
                    }
                  }
                  if (v105)
                  {
                    v88 = (void *)MEMORY[0x1D9452090](v84);
                    v89 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v90 = v106 = v88;
                      v91 = [v99 responseDelay];
                      *(_DWORD *)buf = 138544898;
                      v140 = v90;
                      __int16 v141 = 2112;
                      v142 = v8;
                      __int16 v143 = 2112;
                      v144 = v9;
                      __int16 v145 = 2112;
                      v146 = v115;
                      __int16 v147 = 2112;
                      v148 = v114;
                      __int16 v149 = 2112;
                      uint64_t v150 = v110;
                      __int16 v151 = 2112;
                      v152 = v91;
                      _os_log_impl(&dword_1D49D5000, v89, OS_LOG_TYPE_INFO, "%{public}@Triggering update notification for characteristic (%@+%@/%@/%@) with value %@, responseDelay %@ milliseconds", buf, 0x48u);

                      v34 = (void *)v113;
                      v88 = v106;
                    }

                    v138 = v99;
                    v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
                    [v32 handleUpdatesForCharacteristics:v92 stateNumber:0];
                  }
                  [v100 addObject:v111];
                  int v30 = 0;
                  __int16 v71 = v99;
                }
                else
                {
LABEL_53:

LABEL_67:
                  __int16 v67 = (void *)MEMORY[0x1D9452090]();
                  v68 = HMFGetOSLogHandle();
                  int v31 = v111;
                  v34 = (void *)v113;
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    __int16 v69 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138544386;
                    v140 = v69;
                    __int16 v141 = 2112;
                    v142 = v8;
                    __int16 v143 = 2112;
                    v144 = v9;
                    __int16 v145 = 2112;
                    v146 = v115;
                    __int16 v147 = 2112;
                    v148 = v114;
                    _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessory with deviceIdentifier %@, instanceID %@, serviceInstanceID %@, characteristicInstanceID %@", buf, 0x34u);
                  }
                  int v30 = 2;
                  uint64_t v70 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
                  __int16 v71 = v112;
                  v72 = (void *)v70;
                  v33 = (void *)v110;
                  id v32 = v104;
                }
                uint64_t v5 = v72;

                long long v61 = v101;
                uint64_t v48 = v102;
              }

              goto LABEL_59;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v128 objects:v156 count:16];
          if (v12) {
            continue;
          }
          break;
        }
LABEL_14:

LABEL_26:
        v27 = (void *)MEMORY[0x1D9452090]();
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v140 = v29;
          __int16 v141 = 2112;
          v142 = v8;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Unable to look up accessoryServer with deviceIdentifier %@", buf, 0x16u);
        }
        int v30 = 2;
        uint64_t v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
        int v31 = v111;
        id v32 = v112;
        v33 = (void *)v110;
        v34 = (void *)v113;
LABEL_59:

        if (v30) {
          goto LABEL_91;
        }
        ++v6;
      }
      while (v6 != v108);
      uint64_t v93 = [obj countByEnumeratingWithState:&v132 objects:v157 count:16];
      uint64_t v108 = v93;
    }
    while (v93);
  }
LABEL_91:

  v136 = @"CharacteristicConfiguration";
  v94 = (void *)[v100 copy];
  v137 = v94;
  *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];

  return v5;
}

void __71__HMDAccessoryServerBrowserDemo_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

- (void)resetDemoAccessories
{
  long long v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) servers];
  long long v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) servers];
  [v4 removeAllObjects];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didRemoveAccessoryServer_error_])
        {
          uint64_t v11 = [*(id *)(a1 + 32) delegateQueue];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke_2;
          v12[3] = &unk_1E6A197C8;
          v12[4] = *(void *)(a1 + 32);
          v12[5] = v10;
          dispatch_async(v11, v12);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __53__HMDAccessoryServerBrowserDemo_resetDemoAccessories__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didRemoveAccessoryServer:*(void *)(a1 + 40) error:0];
}

- (void)resetDemoAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(HMDAccessoryServerBrowserDemo *)self _delegateRespondsToSelector:sel_accessoryServerBrowser_didRemoveAccessoryServer_error_])
    {
      id v5 = [(HMDAccessoryServerBrowserDemo *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke;
      block[3] = &unk_1E6A197C8;
      block[4] = self;
      id v10 = v4;
      dispatch_async(v5, block);
    }
    uint64_t v6 = [(HAPAccessoryServerBrowser *)self workQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_2;
    v7[3] = &unk_1E6A197C8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didRemoveAccessoryServer:*(void *)(a1 + 40) error:0];
}

void __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) servers];
  [v2 removeObject:*(void *)(a1 + 40)];

  long long v3 = [HMDAccessoryServerDemo alloc];
  id v4 = [*(id *)(a1 + 40) name];
  id v5 = [*(id *)(a1 + 40) identifier];
  uint64_t v6 = [*(id *)(a1 + 40) accessoryInfo];
  uint64_t v7 = [*(id *)(a1 + 32) keyStore];
  id v8 = [(HMDAccessoryServerDemo *)v3 initWithName:v4 identifier:v5 deviceInfo:v6 paired:0 keyStore:v7 testMode:0 browser:*(void *)(a1 + 32)];

  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [(HAPAccessoryServer *)v8 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[CoreHAP] Discovered new accessory server %@ with Demo info", buf, 0x16u);
  }
  long long v13 = [*(id *)(a1 + 32) servers];
  [v13 addObject:v8];

  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
  {
    long long v14 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_27;
    block[3] = &unk_1E6A197C8;
    block[4] = *(void *)(a1 + 32);
    long long v16 = v8;
    dispatch_async(v14, block);
  }
}

void __52__HMDAccessoryServerBrowserDemo_resetDemoAccessory___block_invoke_27(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

- (void)appendDemoData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_msgSend(WeakRetained[11], "hmf_arrayForKey:", @"accessories");
  uint64_t v3 = [v2 mutableCopy];

  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  }
  id v4 = (void *)v3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "hmf_arrayForKey:", @"accessories");
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_2;
        v25[3] = &unk_1E6A07948;
        id v26 = v4;
        id v27 = v5;
        objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v7);
  }

  uint64_t v11 = v5;
  if ([v5 count])
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]([v4 addObjectsFromArray:v5]);
    long long v13 = WeakRetained;
    long long v14 = WeakRetained;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v16;
      __int16 v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Updated demo accessory list: %@", buf, 0x16u);
    }
    id v32 = @"accessories";
    v33 = v4;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v18 = WeakRetained[11];
    WeakRetained[11] = (id)v17;
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    long long v13 = WeakRetained;
    uint64_t v20 = WeakRetained;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@No new accessories (but kicking re-discovery anyway).", buf, 0xCu);
    }
  }
  if (*((unsigned char *)v13 + 61)) {
    [v13 discoverServer];
  }
}

void __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_3;
  v7[3] = &unk_1E6A16E90;
  id v5 = v3;
  id v8 = v5;
  if ((objc_msgSend(v4, "na_any:", v7) & 1) == 0)
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"testMode"];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __48__HMDAccessoryServerBrowserDemo_appendDemoData___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"identifier"];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"identifier"];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)loadDemoData:(id)a3 finalized:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  uint64_t v7 = [(HAPAccessoryServerBrowser *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HMDAccessoryServerBrowserDemo_loadDemoData_finalized___block_invoke;
  v9[3] = &unk_1E6A13588;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__HMDAccessoryServerBrowserDemo_loadDemoData_finalized___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeStrong(WeakRetained + 11, *(id *)(a1 + 32));
  *((unsigned char *)WeakRetained + 60) = *(unsigned char *)(a1 + 48);
}

- (void)discoverServer
{
  objc_initWeak(&location, self);
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained[10])
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    id v3 = WeakRetained[10];
    WeakRetained[10] = (id)v2;
  }
  id v4 = WeakRetained[11];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 objectForKey:@"accessories"];
    if (v6)
    {
      id v33 = v6;
      v34 = v5;
      long long v50 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      id obj = v6;
      uint64_t v42 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      if (v42)
      {
        uint64_t v41 = *(void *)v48;
        id v35 = WeakRetained;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v48 != v41) {
              objc_enumerationMutation(obj);
            }
            id v8 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            id v9 = [v8 objectForKeyedSubscript:@"name"];
            id v10 = [v8 objectForKeyedSubscript:@"identifier"];
            id v11 = [v8 objectForKeyedSubscript:@"attrDB"];
            BOOL v12 = [v8 objectForKeyedSubscript:@"testMode"];
            long long v13 = (void *)MEMORY[0x1D9452090]();
            long long v14 = WeakRetained;
            long long v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              uint64_t v52 = (uint64_t)v16;
              __int16 v53 = 2112;
              uint64_t v54 = v9;
              __int16 v55 = 2112;
              id v56 = v10;
              _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Processing Demo Accessory information: %@ / %@", buf, 0x20u);
            }
            if (v9 && v10 && v11)
            {
              uint64_t v17 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:0];
              id v18 = (void *)v17;
              if (v17)
              {
                uint64_t v39 = (void *)v17;
                uint64_t v40 = v12;
                id v19 = WeakRetained[10];
                v45[0] = MEMORY[0x1E4F143A8];
                v45[1] = 3221225472;
                v45[2] = __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_16;
                v45[3] = &unk_1E6A07920;
                id v20 = v10;
                id v46 = v20;
                uint64_t v21 = objc_msgSend(v19, "na_firstObjectPassingTest:", v45);
                if (v21)
                {
                  uint64_t v22 = (HMDAccessoryServerDemo *)v21;
                  v23 = (void *)MEMORY[0x1D9452090]();
                  v24 = v14;
                  v25 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v26 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543874;
                    uint64_t v52 = v26;
                    __int16 v36 = v23;
                    id v27 = (void *)v26;
                    __int16 v53 = 2112;
                    uint64_t v54 = v9;
                    __int16 v55 = 2112;
                    id v56 = v20;
                    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Server already exists for Demo Accessory: %@ / %@ - leaving it in place", buf, 0x20u);

                    v23 = v36;
                  }

                  id WeakRetained = v35;
                  id v18 = v39;
                }
                else
                {
                  v37 = [HMDAccessoryServerDemo alloc];
                  uint64_t v28 = [v14 accessoryPaired];
                  long long v29 = [v14 keyStore];
                  uint64_t v30 = [v40 BOOLValue];
                  id v31 = v20;
                  id v18 = v39;
                  uint64_t v22 = [(HMDAccessoryServerDemo *)v37 initWithName:v9 identifier:v31 deviceInfo:v39 paired:v28 keyStore:v29 testMode:v30 browser:v14];

                  [WeakRetained[10] addObject:v22];
                }
                if ([v14 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
                {
                  id v32 = [v14 delegateQueue];
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_21;
                  block[3] = &unk_1E6A197C8;
                  void block[4] = v14;
                  char v44 = v22;
                  dispatch_async(v32, block);
                }
                BOOL v12 = v40;
              }
            }
          }
          uint64_t v42 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
        }
        while (v42);
      }

      id v5 = 0;
      id v6 = v33;
    }
  }
}

uint64_t __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __47__HMDAccessoryServerBrowserDemo_discoverServer__block_invoke_21(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:1 stateNumber:0];
}

- (void)stopDiscoveringAccessoryServers
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HMDAccessoryServerBrowserDemo_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __64__HMDAccessoryServerBrowserDemo_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 61) = 0;
  v1 = (void *)MEMORY[0x1D9452090]();
  id v2 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = HMFGetLogIdentifier();
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_1D49D5000, v2, OS_LOG_TYPE_INFO, "%{public}@[Demo Accessory Browser] Stopping browse for Demo accessories", (uint8_t *)&v4, 0xCu);
  }
}

- (void)startDiscoveringAccessoryServers
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@[Demo Accessory Browser] Starting browse for Demo accessories...", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 61) = 1;
  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didStartDiscoveringWithError_])
  {
    id v5 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke_1;
    block[3] = &unk_1E6A19B30;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
  return [*(id *)(a1 + 32) discoverServer];
}

void __65__HMDAccessoryServerBrowserDemo_startDiscoveringAccessoryServers__block_invoke_1(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStartDiscoveringWithError:0];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDAccessoryServerBrowserDemo_setDelegate_queue___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__HMDAccessoryServerBrowserDemo_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  return [v3 setDelegateQueue:v2];
}

- (int64_t)linkType
{
  return 1;
}

@end