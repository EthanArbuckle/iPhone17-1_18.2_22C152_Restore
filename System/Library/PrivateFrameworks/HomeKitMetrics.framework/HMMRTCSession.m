@interface HMMRTCSession
- (HMMRTCBackendSession)backend;
- (HMMRTCSession)initWithUUID:(id)a3 serviceName:(id)a4 commonFields:(id)a5 backend:(id)a6;
- (NSDictionary)commonFields;
- (void)submitEventWithName:(id)a3 payload:(id)a4;
@end

@implementation HMMRTCSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_commonFields, 0);
}

- (HMMRTCBackendSession)backend
{
  return self->_backend;
}

- (NSDictionary)commonFields
{
  return self->_commonFields;
}

- (void)submitEventWithName:(id)a3 payload:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v7 mutableCopy];
  [v8 setObject:v6 forKeyedSubscript:@"HMFEventName"];
  v9 = NSNumber;
  v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSince1970];
  v11 = objc_msgSend(v9, "numberWithDouble:");
  [v8 setObject:v11 forKeyedSubscript:@"HMFTimestamp"];

  v12 = [(HMMNullRTCSession *)self uuid];
  v13 = [v12 UUIDString];
  [v8 setObject:v13 forKeyedSubscript:@"HMFSessionIdentifier"];

  v14 = [(HMMRTCSession *)self commonFields];
  [v8 addEntriesFromDictionary:v14];

  v15 = (void *)MEMORY[0x1D944E970]();
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = HMFGetLogIdentifier();
    v19 = [(HMMNullRTCSession *)v16 uuid];
    int v21 = 138543874;
    v22 = v18;
    __int16 v23 = 2112;
    v24 = v19;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1D4999000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Submitting event: %@", (uint8_t *)&v21, 0x20u);
  }
  v20 = [(HMMRTCSession *)v16 backend];
  [v20 sendMessage:v8];
}

- (HMMRTCSession)initWithUUID:(id)a3 serviceName:(id)a4 commonFields:(id)a5 backend:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1D944E970]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v23 = v17;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1D4999000, v16, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Creating session with service name: %@", buf, 0x20u);
  }
  v21.receiver = v15;
  v21.super_class = (Class)HMMRTCSession;
  v18 = [(HMMNullRTCSession *)&v21 initWithUUID:v10 serviceName:v11];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_commonFields, a5);
    objc_storeStrong((id *)&v19->_backend, a6);
  }

  return v19;
}

@end