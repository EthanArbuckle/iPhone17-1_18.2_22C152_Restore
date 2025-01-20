@interface HMDRemoteMessageTransport
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

+ (id)remoteMessageTransportsForProductInfo:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = [HMDModernRemoteMessageTransport alloc];
  v4 = +[HMDAccountRegistry sharedRegistry];
  v5 = [(HMDModernRemoteMessageTransport *)v3 initWithAccountRegistry:v4];

  v6 = [HMDIDSMessageTransport alloc];
  v7 = +[HMDAccountRegistry sharedRegistry];
  id v8 = [(HMDIDSMessageTransport *)v6 initLegacyTransportWithAccountRegistry:v7];

  v11[0] = v5;
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
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
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMFObject *)self debugDescription];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F41F18]];

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
  uint64_t v23 = *MEMORY[0x263EF8340];
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
        v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12, (void)v18);
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
  v80[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v48 = a4;
  id v6 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Select based on capability %@, and responses %@", buf, 0x20u);
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  v46 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_297_266217];
  v80[0] = v46;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:1];
  v50 = [v5 sortedArrayUsingDescriptors:v11];

  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v70 = v14;
    __int16 v71 = 2112;
    id v72 = v50;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Sorted responses by homed version: %@", buf, 0x16u);
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
                  [v10 addObject:&unk_26E473B40];
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
                  v29 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerValue") + 1);
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
    v33 = 0;
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
        v38 = [v56 objectAtIndexedSubscript:v32 + j];
        v39 = [v38 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

        if (v39) {
          uint64_t v40 = v37;
        }
        else {
          uint64_t v40 = v37 + 1;
        }
        if (v40 > (uint64_t)v34)
        {
          v33 = (void *)(v32 + j);
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
    v33 = 0;
    v34 = 0;
  }

  v41 = (void *)MEMORY[0x230FBD990]();
  v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v70 = v43;
    __int16 v71 = 2048;
    id v72 = v34;
    __int16 v73 = 2048;
    id v74 = v33;
    __int16 v75 = 2112;
    v76 = v56;
    _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Returning Best matched capability (Matched: %ld, Index: %ld) from Filtered list :%@", buf, 0x2Au);
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
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __81__HMDRemoteMessageTransport_postDidReceiveRemoteMessageWithNoListenerFromDevice___block_invoke;
    v6[3] = &unk_264A2F820;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(v5, v6);
  }
}

void __81__HMDRemoteMessageTransport_postDidReceiveRemoteMessageWithNoListenerFromDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = HMFGetLogIdentifier();
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@Posting notification about incoming message with no listeners from: %@", buf, 0x16u);
  }
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = @"kIDSMessageSourceIDKey";
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "remoteDestinationString", @"kIDSMessageSourceIDKey");
  unint64_t v11 = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
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
    uint64_t v7 = [MEMORY[0x263F42538] futureWithPromise:&obj];
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
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMDRemoteMessageTransport)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_266240 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_266240, &__block_literal_global_302);
  }
  v2 = (void *)logCategory__hmf_once_v20_266241;
  return v2;
}

void __40__HMDRemoteMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v20_266241;
  logCategory__hmf_once_v20_266241 = v0;
}

+ (id)remoteMessageFromMessage:(id)a3 secure:(BOOL)a4 accountRegistry:(id)a5
{
  BOOL v6 = a4;
  v72[1] = *MEMORY[0x263EF8340];
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
    __int16 v14 = [(HMDRemoteMessage *)v10 untrustedClientIdentifier];

    id v57 = a1;
    if (v14)
    {
      uint64_t v71 = *MEMORY[0x263F42008];
      uint64_t v15 = [(HMDRemoteMessage *)v10 untrustedClientIdentifier];
      v72[0] = v15;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [HMDRemoteMessage alloc];
    uint64_t v18 = [(HMDRemoteMessage *)v10 name];
    uint64_t v19 = [(HMDRemoteMessage *)v10 qualityOfService];
    uint64_t v20 = [(HMDRemoteMessage *)v10 destination];
    long long v21 = [(HMDRemoteMessage *)v10 messagePayload];
    [(HMDRemoteMessage *)v10 timeout];
    double v23 = v22;
    LOBYTE(v56) = [(HMFMessage *)v10 isSecureRemote] || v6;
    uint64_t v13 = [(HMDRemoteMessage *)v17 initWithName:v18 qualityOfService:v19 destination:v20 payload:v21 headers:v16 type:3 timeout:v23 secure:v56 restriction:[(HMFMessage *)v10 remoteRestriction] sendOptions:0];

    v24 = [(HMDRemoteMessage *)v10 identifier];
    [(HMDRemoteMessage *)v13 setIdentifier:v24];

    int64_t v25 = [(HMDRemoteMessage *)v10 responseHandler];
    [(HMDRemoteMessage *)v13 setResponseHandler:v25];

    a1 = v57;
  }
  uint64_t v26 = [(HMDRemoteMessage *)v13 attributedMessageName];

  if (!v26)
  {
    v27 = [(HMDRemoteMessage *)v10 name];
    [(HMDRemoteMessage *)v13 setAttributedMessageName:v27];
  }
  if (v9)
  {
    v28 = [(HMDRemoteMessage *)v13 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v29 = v28;
    }
    else {
      v29 = 0;
    }
    id v30 = v29;

    if (v30)
    {
      char v58 = 0;
      uint64_t v31 = [v30 device];
      uint64_t v32 = [v31 handles];
      v33 = [v32 firstObject];
      v34 = [v9 deviceForHandle:v33 exists:&v58];

      if (v58)
      {
        uint64_t v35 = (void *)MEMORY[0x230FBD990]();
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          [v30 device];
          v39 = id v38 = a1;
          *(_DWORD *)buf = 138543874;
          long long v60 = v37;
          __int16 v61 = 2112;
          id v62 = v39;
          __int16 v63 = 2112;
          long long v64 = v34;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Replacing device destination, %@, with device: %@", buf, 0x20u);

          a1 = v38;
        }

        uint64_t v40 = [HMDRemoteDeviceMessageDestination alloc];
        v41 = [v30 target];
        v42 = [(HMDRemoteDeviceMessageDestination *)v40 initWithTarget:v41 device:v34];

        [(HMDRemoteMessage *)v13 setDestination:v42];
        v43 = [v30 preferredHandle];

        if (v43)
        {
          v44 = [v30 preferredHandle];
          [(HMDRemoteDeviceMessageDestination *)v42 setPreferredHandle:v44];
        }
      }
    }
  }
  v45 = (void *)MEMORY[0x230FBD990]();
  id v46 = a1;
  v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    id v48 = HMFGetLogIdentifier();
    uint64_t v49 = [(HMDRemoteMessage *)v13 identifier];
    v50 = [(HMDRemoteMessage *)v13 name];
    [(HMDRemoteMessage *)v13 timeout];
    uint64_t v52 = v51;
    unint64_t v53 = [(HMDRemoteMessage *)v13 type];
    if (v53 > 3) {
      v54 = 0;
    }
    else {
      v54 = off_264A2EBD0[v53];
    }
    *(_DWORD *)buf = 138544642;
    long long v60 = v48;
    __int16 v61 = 2112;
    id v62 = v46;
    __int16 v63 = 2112;
    long long v64 = v49;
    __int16 v65 = 2112;
    long long v66 = v50;
    __int16 v67 = 2048;
    uint64_t v68 = v52;
    __int16 v69 = 2112;
    v70 = v54;
    _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Created remote message from message with identifier: %@ name: %@ timeout: %.0f and type: %@", buf, 0x3Eu);
  }

  return v13;
}

+ (unint64_t)restriction
{
  return -1;
}

@end