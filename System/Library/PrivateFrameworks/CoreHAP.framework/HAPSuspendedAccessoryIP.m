@interface HAPSuspendedAccessoryIP
+ (id)logCategory;
- (HAPSuspendedAccessoryIP)initWithName:(id)a3 identifier:(id)a4 wakeTuples:(id)a5 queue:(id)a6;
- (NSArray)wakeTuples;
- (NSString)dnsName;
- (id)_wakeWithTuple:(id)a3 dnsName:(id)a4;
- (unint64_t)timeout;
- (void)_closeConnection;
- (void)dealloc;
- (void)setDnsName:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)wakeWithCompletion:(id)a3;
@end

@implementation HAPSuspendedAccessoryIP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsName, 0);

  objc_storeStrong((id *)&self->_wakeTuples, 0);
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setDnsName:(id)a3
{
}

- (NSString)dnsName
{
  return self->_dnsName;
}

- (NSArray)wakeTuples
{
  return self->_wakeTuples;
}

- (void)_closeConnection
{
  if (self->_connection)
  {
    AsyncConnection_Release();
    self->_connection = 0;
  }
}

- (id)_wakeWithTuple:(id)a3 dnsName:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = (unint64_t)a4;
  v9 = [(HAPSuspendedAccessory *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v7 wakeAddress];
  unint64_t v11 = v8 | v10;

  if (v11)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F0]);
    v14 = NSString;
    v15 = MEMORY[0x1D944D460](self, a2);
    v16 = [v14 stringWithFormat:@"%@, %s:%ld", v15, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Accessories/HAPSuspendedAccessory.m", 135];
    v17 = (void *)[v13 initWithName:v16];

    id v18 = (id)v8;
    v19 = [v7 wakeAddress];

    if (v19)
    {
      v20 = NSString;
      v21 = [v7 wakeAddress];
      uint64_t v22 = [v20 stringWithFormat:@"wake://%@%s%@", v21, "\x1E", v18];

      id v18 = (id)v22;
    }
    id v23 = v18;
    [v23 UTF8String];
    [v7 wakePort];
    [(HAPSuspendedAccessoryIP *)self timeout];
    [(HAPSuspendedAccessory *)self queue];
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    v37 = v36 = self;
    uint64_t v24 = AsyncConnection_Connect();

    if (v24)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      v26 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithOSStatus:", v24, 0, 0, self, v37);
      v27 = [v25 hapErrorWithCode:1 description:@"Connection failed" reason:0 suggestion:0 underlyingError:v26];
    }
    else
    {
      v27 = 0;
    }
    objc_msgSend(v27, "domain", v34, v35, v36);

    v28 = (void *)MEMORY[0x1D944E080]([v27 code]);
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      v32 = [(HAPSuspendedAccessory *)v29 identifier];
      *(_DWORD *)buf = 138543874;
      v39 = v31;
      __int16 v40 = 2112;
      v41 = v32;
      __int16 v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_INFO, "%{public}@The suspended accessory: '%@' sent wake command with error: %@", buf, 0x20u);
    }

    v12 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
  }

  return v12;
}

- (void)wakeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HAPSuspendedAccessory *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HAPSuspendedAccessoryIP_wakeWithCompletion___block_invoke;
  v7[3] = &unk_1E69F3C68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HAPSuspendedAccessoryIP_wakeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) wakeTuples];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = [*(id *)(a1 + 32) wakeTuples];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      char v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        unint64_t v11 = v7;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
          id v13 = *(void **)(a1 + 32);
          v14 = [v13 dnsName];
          id v7 = [v13 _wakeWithTuple:v12 dnsName:v14];

          v8 |= v7 == 0;
          ++v10;
          unint64_t v11 = v7;
        }
        while (v6 != v10);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);

      if ((v8 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      id v7 = v4;
    }

    id v7 = 0;
LABEL_15:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    return;
  }
  v15 = [*(id *)(a1 + 32) dnsName];

  uint64_t v16 = *(void *)(a1 + 40);
  if (v15)
  {
    v17 = *(void **)(a1 + 32);
    id v19 = [v17 dnsName];
    id v18 = objc_msgSend(v17, "_wakeWithTuple:dnsName:", 0);
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v18);
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }
}

- (void)dealloc
{
  [(HAPSuspendedAccessoryIP *)self _closeConnection];
  v3.receiver = self;
  v3.super_class = (Class)HAPSuspendedAccessoryIP;
  [(HAPSuspendedAccessoryIP *)&v3 dealloc];
}

- (HAPSuspendedAccessoryIP)initWithName:(id)a3 identifier:(id)a4 wakeTuples:(id)a5 queue:(id)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HAPSuspendedAccessoryIP;
  unint64_t v11 = [(HAPSuspendedAccessory *)&v16 initWithName:a3 identifier:a4 type:1 queue:a6];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    uint64_t v13 = [v12 allObjects];
    wakeTuples = v11->_wakeTuples;
    v11->_wakeTuples = (NSArray *)v13;

    v11->_timeout = 10000000000;
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1) {
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_9613);
  }
  v2 = (void *)logCategory__hmf_once_v2;

  return v2;
}

uint64_t __38__HAPSuspendedAccessoryIP_logCategory__block_invoke()
{
  logCategory__hmf_once_v2 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end