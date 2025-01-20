@interface HMDRemoteMessageTransport
+ (id)_createModernTransportForProductInfo:(id)a3 preferences:(id)a4;
+ (id)logCategory;
+ (id)remoteMessageFromMessage:(id)a3 secure:(BOOL)a4 accountRegistry:(id)a5;
+ (id)remoteMessageTransportsForProductInfo:(id)a3;
+ (unint64_t)restriction;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)doesResponse:(id)a3 matchAllCapabilities:(id)a4;
- (BOOL)isSecure;
- (BOOL)isValidMessage:(id)a3;
- (HMDAccountRegistry)accountRegistry;
- (HMDHomeMembershipVerifier)homeMembershipVerifier;
- (HMDRemoteMessageTransport)init;
- (HMDRemoteMessageTransport)initWithAccountRegistry:(id)a3;
- (HMDRemoteMessageTransportReachabilityDelegate)reachabilityDelegate;
- (HMFFuture)startFuture;
- (HMFPromise)startPromise;
- (id)dumpState;
- (id)matchResponse:(id)a3 requestedCapabilities:(id)a4;
- (id)remoteMessageFromMessage:(id)a3;
- (id)start;
- (int)transportType;
- (int64_t)compareCapability:(id)a3 key:(id)a4 withCapability:(id)a5;
- (int64_t)qualityOfService;
- (void)configureWithHomeMembershipVerifier:(id)a3;
- (void)postDidReceiveRemoteMessageWithNoListenerFromDevice:(id)a3;
- (void)setReachabilityDelegate:(id)a3;
@end

@implementation HMDRemoteMessageTransport

+ (id)_createModernTransportForProductInfo:(id)a3 preferences:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 productPlatform] - 1;
  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = a1;
  v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8 > 4)
  {
    if (v12)
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Not creating modern message transport because it is not supported on this platform", (uint8_t *)&v19, 0xCu);
    }
    v16 = 0;
  }
  else
  {
    if (v12)
    {
      v13 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating modern message transport", (uint8_t *)&v19, 0xCu);
    }
    v14 = [HMDModernRemoteMessageTransport alloc];
    v15 = +[HMDAccountRegistry sharedRegistry];
    v16 = [(HMDModernRemoteMessageTransport *)v14 initWithAccountRegistry:v15];
  }
  return v16;
}

+ (id)remoteMessageTransportsForProductInfo:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v21 = 0;
    goto LABEL_51;
  }
  v5 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = a1;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)v61 = 138543362;
    *(void *)&v61[4] = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Using legacy transport", v61, 0xCu);
  }
  uint64_t v11 = [v4 productPlatform];
  if ((unint64_t)(v11 - 1) >= 5)
  {
    if (v11) {
      goto LABEL_20;
    }
    v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v8;
    v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)v61 = 138543362;
    *(void *)&v61[4] = v17;
    v18 = "%{public}@Not creating IDS message transport due to unknown platform";
    int v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  BOOL v12 = [v5 preferenceForKey:@"disableIDSTransport"];
  char v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v8;
    v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      goto LABEL_20;
    }
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)v61 = 138543362;
    *(void *)&v61[4] = v17;
    v18 = "%{public}@Not creating IDS message transport due to preference";
    int v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_INFO;
LABEL_14:
    _os_log_impl(&dword_1D49D5000, v19, v20, v18, v61, 0xCu);

    goto LABEL_15;
  }
  v22 = [HMDIDSMessageTransport alloc];
  v23 = +[HMDAccountRegistry sharedRegistry];
  v24 = [(HMDIDSMessageTransport *)v22 initWithAccountRegistry:v23];

  if (v24)
  {
    [v6 addObject:v24];
  }
  else
  {
    v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = v8;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)v61 = 138543362;
      *(void *)&v61[4] = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create IDS message transport", v61, 0xCu);
    }
  }

LABEL_20:
  unint64_t v29 = objc_msgSend(v4, "productPlatform", *(_OWORD *)v61);
  if (v29 <= 5)
  {
    if (((1 << v29) & 0x36) != 0)
    {
      v30 = [v5 preferenceForKey:@"disableHTTPTransport"];
      char v31 = [v30 BOOLValue];

      if ((v31 & 1) == 0)
      {
        v39 = [HMDHTTPMessageTransport alloc];
        v40 = +[HMDAccountRegistry sharedRegistry];
        v41 = [(HMDHTTPMessageTransport *)v39 initWithAccountRegistry:v40];

        if (v41)
        {
          [v6 addObject:v41];
        }
        else
        {
          v42 = (void *)MEMORY[0x1D9452090]();
          id v43 = v8;
          v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = HMFGetLogIdentifier();
            *(_DWORD *)v61 = 138543362;
            *(void *)&v61[4] = v45;
            _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HTTP message transport", v61, 0xCu);
          }
        }

        goto LABEL_36;
      }
      v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = v8;
      v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)v61 = 138543362;
      *(void *)&v61[4] = v35;
      v36 = "%{public}@Not creating HTTP message transport due to preference";
      v37 = v34;
      os_log_type_t v38 = OS_LOG_TYPE_INFO;
      goto LABEL_30;
    }
    if (!v29)
    {
      v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = v8;
      v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        goto LABEL_36;
      }
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)v61 = 138543362;
      *(void *)&v61[4] = v35;
      v36 = "%{public}@Not creating HTTP message transport due to unknown platform";
      v37 = v34;
      os_log_type_t v38 = OS_LOG_TYPE_ERROR;
LABEL_30:
      _os_log_impl(&dword_1D49D5000, v37, v38, v36, v61, 0xCu);

      goto LABEL_31;
    }
  }
LABEL_36:
  v46 = objc_msgSend(v8, "_createModernTransportForProductInfo:preferences:", v4, v5, *(_OWORD *)v61);
  if (v46) {
    [v6 addObject:v46];
  }
  if ([v4 productPlatform] == 3 || objc_msgSend(v4, "productClass") == 1)
  {
    v47 = [v5 preferenceForKey:@"disableIDSProxyTransport"];
    char v48 = [v47 BOOLValue];

    if (v48)
    {
      v49 = (void *)MEMORY[0x1D9452090]();
      id v50 = v8;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)v61 = 138543362;
        *(void *)&v61[4] = v52;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Not creating IDS Proxy message transport due to preference", v61, 0xCu);
      }
    }
    else
    {
      v53 = [HMDIDSProxyMessageTransport alloc];
      v54 = +[HMDAccountRegistry sharedRegistry];
      v55 = [(HMDIDSProxyMessageTransport *)v53 initWithAccountRegistry:v54];

      if (v55)
      {
        [v6 addObject:v55];
      }
      else
      {
        v56 = (void *)MEMORY[0x1D9452090]();
        id v57 = v8;
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = HMFGetLogIdentifier();
          *(_DWORD *)v61 = 138543362;
          *(void *)&v61[4] = v59;
          _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to create IDS Proxy message transport", v61, 0xCu);
        }
      }
    }
  }

  uint64_t v21 = (void *)[v6 copy];
LABEL_51:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startPromise, 0);
  objc_storeStrong((id *)&self->_startFuture, 0);
  objc_destroyWeak((id *)&self->_homeMembershipVerifier);
  objc_destroyWeak((id *)&self->_reachabilityDelegate);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
}

- (int)transportType
{
  return self->_transportType;
}

- (HMFPromise)startPromise
{
  return self->_startPromise;
}

- (HMFFuture)startFuture
{
  return self->_startFuture;
}

- (HMDHomeMembershipVerifier)homeMembershipVerifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeMembershipVerifier);
  return (HMDHomeMembershipVerifier *)WeakRetained;
}

- (void)setReachabilityDelegate:(id)a3
{
}

- (HMDRemoteMessageTransportReachabilityDelegate)reachabilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reachabilityDelegate);
  return (HMDRemoteMessageTransportReachabilityDelegate *)WeakRetained;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (id)dumpState
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMFObject *)self debugDescription];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F64E00]];

  return v3;
}

- (void)configureWithHomeMembershipVerifier:(id)a3
{
}

- (int64_t)compareCapability:(id)a3 key:(id)a4 withCapability:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((([v8 isEqualToString:@"kHomedVersionKey"] & 1) != 0
     || ([v8 isEqualToString:@"kHomeConfigurationVersionKey"] & 1) != 0
     || ([v8 isEqualToString:@"kMetadataInfoSchemaVersionKey"] & 1) != 0
     || [v8 isEqualToString:@"kMetadataInfoVersionKey"])
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v10 = [v7 compare:v9];
  }
  else if ([v8 isEqualToString:@"kHomeUUID"] {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v10 = [v7 isEqualToString:v9] - 1;
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

- (BOOL)doesResponse:(id)a3 matchAllCapabilities:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        char v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12, (void)v18);
        v14 = [v7 objectForKeyedSubscript:v12];
        unint64_t v15 = [(HMDRemoteMessageTransport *)self compareCapability:v13 key:v12 withCapability:v14];

        if (v15 > 1)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (id)matchResponse:(id)a3 requestedCapabilities:(id)a4
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v48 = a4;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v70 = v8;
    __int16 v71 = 2112;
    id v72 = v48;
    __int16 v73 = 2112;
    id v74 = v5;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Select based on capability %@, and responses %@", buf, 0x20u);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:0 ascending:0 comparator:&__block_literal_global_293_187627];
  v80[0] = v46;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
  id v50 = [v5 sortedArrayUsingDescriptors:v11];

  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  char v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v70 = v14;
    __int16 v71 = 2112;
    id v72 = v50;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Sorted responses by homed version: %@", buf, 0x16u);
  }
  v47 = v5;
  v56 = v9;
  if ((unint64_t)[v5 count] >= 2)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v15 = v48;
    uint64_t v51 = [v15 countByEnumeratingWithState:&v65 objects:v79 count:16];
    if (v51)
    {
      uint64_t v49 = *(void *)v66;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v66 != v49) {
            objc_enumerationMutation(v15);
          }
          uint64_t v52 = v16;
          uint64_t v17 = *(void *)(*((void *)&v65 + 1) + 8 * v16);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          obuint64_t j = v50;
          uint64_t v18 = [obj countByEnumeratingWithState:&v61 objects:v78 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v62;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v62 != v20) {
                  objc_enumerationMutation(obj);
                }
                v22 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                if (([v9 containsObject:v22] & 1) == 0)
                {
                  [v9 addObject:v22];
                  [v10 addObject:&unk_1F2DC9F28];
                }
                uint64_t v23 = [v22 objectForKeyedSubscript:v17];
                v24 = [v15 objectForKeyedSubscript:v17];
                int64_t v25 = [(HMDRemoteMessageTransport *)self compareCapability:v23 key:v17 withCapability:v24];

                id v9 = v56;
                if ((v25 & 0x8000000000000000) == 0)
                {
                  uint64_t v26 = [v56 indexOfObject:v22];
                  v27 = NSNumber;
                  v28 = [v10 objectAtIndexedSubscript:v26];
                  unint64_t v29 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerValue") + 1);
                  [v10 replaceObjectAtIndex:v26 withObject:v29];
                }
              }
              uint64_t v19 = [obj countByEnumeratingWithState:&v61 objects:v78 count:16];
            }
            while (v19);
          }

          uint64_t v16 = v52 + 1;
        }
        while (v52 + 1 != v51);
        uint64_t v51 = [v15 countByEnumeratingWithState:&v65 objects:v79 count:16];
      }
      while (v51);
    }
  }
  if (![v9 count]) {
    [v9 addObjectsFromArray:v50];
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v55 = v10;
  uint64_t v30 = [v55 countByEnumeratingWithState:&v57 objects:v77 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = 0;
    id v33 = 0;
    v34 = 0;
    uint64_t v35 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v58 != v35) {
          objc_enumerationMutation(v55);
        }
        uint64_t v37 = [*(id *)(*((void *)&v57 + 1) + 8 * j) integerValue];
        os_log_type_t v38 = [v56 objectAtIndexedSubscript:v32 + j];
        v39 = [v38 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

        if (v39) {
          uint64_t v40 = v37;
        }
        else {
          uint64_t v40 = v37 + 1;
        }
        if (v40 > (uint64_t)v34)
        {
          id v33 = (void *)(v32 + j);
          v34 = (void *)v40;
        }
      }
      v32 += j;
      uint64_t v31 = [v55 countByEnumeratingWithState:&v57 objects:v77 count:16];
    }
    while (v31);
  }
  else
  {
    id v33 = 0;
    v34 = 0;
  }

  v41 = (void *)MEMORY[0x1D9452090]();
  v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    id v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v70 = v43;
    __int16 v71 = 2048;
    id v72 = v34;
    __int16 v73 = 2048;
    id v74 = v33;
    __int16 v75 = 2112;
    v76 = v56;
    _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Returning Best matched capability (Matched: %ld, Index: %ld) from Filtered list :%@", buf, 0x2Au);
  }
  v44 = [v56 objectAtIndexedSubscript:v33];

  return v44;
}

uint64_t __65__HMDRemoteMessageTransport_matchResponse_requestedCapabilities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", @"kHomeKitVersionStringKey");
  uint64_t v7 = objc_msgSend(v5, "hmf_stringForKey:", @"kHomeKitVersionStringKey");
  uint64_t v8 = (void *)v7;
  if (v6 | v7)
  {
    if (v6)
    {
      uint64_t v9 = [[HMDHomeKitVersion alloc] initWithVersionString:v6];
      if (v8)
      {
LABEL_4:
        id v10 = [[HMDHomeKitVersion alloc] initWithVersionString:v8];
        unint64_t v11 = (unint64_t)v10;
        BOOL v12 = v9 != 0;
        if (!v9 || !v10) {
          goto LABEL_17;
        }
LABEL_9:
        uint64_t v14 = [(id)v9 compare:v11];
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v9 = 0;
      if (v7) {
        goto LABEL_4;
      }
    }
    unint64_t v11 = 0;
    BOOL v12 = v9 != 0;
LABEL_17:
    BOOL v16 = !v12;
    uint64_t v17 = 1;
    if (v16) {
      uint64_t v17 = -1;
    }
    if (v9 | v11) {
      uint64_t v14 = v17;
    }
    else {
      uint64_t v14 = 0;
    }
    goto LABEL_22;
  }
  uint64_t v9 = objc_msgSend(v4, "hmf_numberForKey:", @"kHomedVersionKey");
  uint64_t v13 = objc_msgSend(v5, "hmf_numberForKey:", @"kHomedVersionKey");
  unint64_t v11 = v13;
  if (v9 && v13) {
    goto LABEL_9;
  }
  uint64_t v15 = 1;
  if (!v9) {
    uint64_t v15 = -1;
  }
  if (v9 | v13) {
    uint64_t v14 = v15;
  }
  else {
    uint64_t v14 = 0;
  }
LABEL_22:

  return v14;
}

- (id)remoteMessageFromMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(HMDRemoteMessageTransport *)self accountRegistry];
  uint64_t v7 = [v5 remoteMessageFromMessage:v4 secure:0 accountRegistry:v6];

  return v7;
}

- (void)postDidReceiveRemoteMessageWithNoListenerFromDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__HMDRemoteMessageTransport_postDidReceiveRemoteMessageWithNoListenerFromDevice___block_invoke;
    v6[3] = &unk_1E6A197C8;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(v5, v6);
  }
}

void __81__HMDRemoteMessageTransport_postDidReceiveRemoteMessageWithNoListenerFromDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = HMFGetLogIdentifier();
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@Posting notification about incoming message with no listeners from: %@", buf, 0x16u);
  }
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = @"kIDSMessageSourceIDKey";
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "remoteDestinationString", @"kIDSMessageSourceIDKey");
  unint64_t v11 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v6 postNotificationName:@"HMDDidReceiveRemoteMessageWithNoListenerNotification" object:v7 userInfo:v9];
}

- (BOOL)isValidMessage:(id)a3
{
  return 1;
}

- (id)start
{
  v3 = [(HMDRemoteMessageTransport *)self startPromise];
  [v3 fulfillWithValue:0];

  return [(HMDRemoteMessageTransport *)self startFuture];
}

- (BOOL)isSecure
{
  return 0;
}

- (HMDRemoteMessageTransport)initWithAccountRegistry:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDRemoteMessageTransport;
  uint64_t v6 = [(HMDRemoteMessageTransport *)&v11 init];
  if (v6)
  {
    obuint64_t j = 0;
    uint64_t v7 = [MEMORY[0x1E4F65438] futureWithPromise:&obj];
    startFuture = v6->_startFuture;
    v6->_startFuture = (HMFFuture *)v7;

    objc_storeStrong((id *)&v6->_startPromise, obj);
    objc_storeStrong((id *)&v6->_accountRegistry, a3);
  }
  return v6;
}

- (BOOL)canSendMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMDRemoteMessageTransport)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_187650 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_187650, &__block_literal_global_298_187651);
  }
  v2 = (void *)logCategory__hmf_once_v20_187652;
  return v2;
}

uint64_t __40__HMDRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20_187652;
  logCategory__hmf_once_v20_187652 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)remoteMessageFromMessage:(id)a3 secure:(BOOL)a4 accountRegistry:(id)a5
{
  BOOL v6 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (HMDRemoteMessage *)v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v11 = v10;
  }
  else {
    objc_super v11 = 0;
  }
  BOOL v12 = v11;

  if (v12)
  {
    uint64_t v13 = v10;
    if (v6)
    {
      [(HMDRemoteMessage *)v12 setSecure:1];
      uint64_t v13 = v10;
    }
  }
  else
  {
    __int16 v14 = [HMDRemoteMessage alloc];
    uint64_t v15 = [(HMDRemoteMessage *)v10 name];
    uint64_t v16 = [(HMDRemoteMessage *)v10 qualityOfService];
    uint64_t v17 = [(HMDRemoteMessage *)v10 destination];
    uint64_t v18 = [(HMDRemoteMessage *)v10 messagePayload];
    [(HMDRemoteMessage *)v10 timeout];
    double v20 = v19;
    LOBYTE(v52) = [(HMFMessage *)v10 isSecureRemote] || v6;
    uint64_t v13 = [(HMDRemoteMessage *)v14 initWithName:v15 qualityOfService:v16 destination:v17 payload:v18 headers:0 type:3 timeout:v20 secure:v52 restriction:[(HMFMessage *)v10 remoteRestriction] sendOptions:0];

    long long v21 = [(HMDRemoteMessage *)v10 identifier];
    [(HMDRemoteMessage *)v13 setIdentifier:v21];

    v22 = [(HMDRemoteMessage *)v10 responseHandler];
    [(HMDRemoteMessage *)v13 setResponseHandler:v22];
  }
  uint64_t v23 = [(HMDRemoteMessage *)v13 attributedMessageName];

  if (!v23)
  {
    v24 = [(HMDRemoteMessage *)v10 name];
    [(HMDRemoteMessage *)v13 setAttributedMessageName:v24];
  }
  if (v9)
  {
    int64_t v25 = [(HMDRemoteMessage *)v13 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    id v27 = v26;

    if (v27)
    {
      char v53 = 0;
      v28 = [v27 device];
      unint64_t v29 = [v28 handles];
      uint64_t v30 = [v29 firstObject];
      uint64_t v31 = [v9 deviceForHandle:v30 exists:&v53];

      if (v53)
      {
        uint64_t v32 = (void *)MEMORY[0x1D9452090]();
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v34 = HMFGetLogIdentifier();
          uint64_t v35 = [v27 device];
          *(_DWORD *)buf = 138543874;
          id v55 = v34;
          __int16 v56 = 2112;
          id v57 = v35;
          __int16 v58 = 2112;
          long long v59 = v31;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Replacing device destination, %@, with device: %@", buf, 0x20u);
        }
        v36 = [HMDRemoteDeviceMessageDestination alloc];
        uint64_t v37 = [v27 target];
        os_log_type_t v38 = [(HMDRemoteDeviceMessageDestination *)v36 initWithTarget:v37 device:v31];

        [(HMDRemoteMessage *)v13 setDestination:v38];
        v39 = [v27 preferredHandle];

        if (v39)
        {
          uint64_t v40 = [v27 preferredHandle];
          [(HMDRemoteDeviceMessageDestination *)v38 setPreferredHandle:v40];
        }
      }
    }
  }
  v41 = (void *)MEMORY[0x1D9452090]();
  id v42 = a1;
  id v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v44 = HMFGetLogIdentifier();
    v45 = [(HMDRemoteMessage *)v13 identifier];
    v46 = [(HMDRemoteMessage *)v13 name];
    [(HMDRemoteMessage *)v13 timeout];
    uint64_t v48 = v47;
    unint64_t v49 = [(HMDRemoteMessage *)v13 type];
    if (v49 > 3) {
      id v50 = 0;
    }
    else {
      id v50 = off_1E6A194E8[v49];
    }
    *(_DWORD *)buf = 138544642;
    id v55 = v44;
    __int16 v56 = 2112;
    id v57 = v42;
    __int16 v58 = 2112;
    long long v59 = v45;
    __int16 v60 = 2112;
    long long v61 = v46;
    __int16 v62 = 2048;
    uint64_t v63 = v48;
    __int16 v64 = 2112;
    long long v65 = v50;
    _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Created remote message from message with identifier: %@ name: %@ timeout: %.0f and type: %@", buf, 0x3Eu);
  }

  return v13;
}

+ (unint64_t)restriction
{
  return -1;
}

@end