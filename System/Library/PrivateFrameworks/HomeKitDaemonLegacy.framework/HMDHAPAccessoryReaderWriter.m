@interface HMDHAPAccessoryReaderWriter
+ (id)logCategory;
- (BOOL)_cannotForwardMessage:(id)a3;
- (BOOL)_isNotResidentDevice;
- (BOOL)_isPrimaryResidentDevice;
- (BOOL)_isSecondaryResidentDevice;
- (HMDHAPAccessoryReaderWriter)initWithHome:(id)a3;
- (HMDHAPAccessoryReaderWriter)initWithHome:(id)a3 dataSource:(id)a4;
- (HMDHAPAccessoryReaderWriterDataSource)dataSource;
- (HMDHAPAccessoryTaskTracker)tracker;
- (HMDHome)home;
- (id)_completionHandlerWithContext:(id)a3;
- (id)_defaultTaskForCurrentDeviceWithContext:(id)a3 requests:(id)a4;
- (id)logIdentifier;
- (void)handleRemotelyUpdatedCharacteristicsMessage:(id)a3;
- (void)submitReadRequests:(id)a3 sourceType:(unint64_t)a4 requestMessage:(id)a5;
- (void)submitWriteRequests:(id)a3 sourceType:(unint64_t)a4 requestMessage:(id)a5;
@end

@implementation HMDHAPAccessoryReaderWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (HMDHAPAccessoryReaderWriterDataSource)dataSource
{
  return (HMDHAPAccessoryReaderWriterDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDHAPAccessoryTaskTracker)tracker
{
  return (HMDHAPAccessoryTaskTracker *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDHAPAccessoryReaderWriter *)self home];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (id)_completionHandlerWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHAPAccessoryReaderWriter *)self home];
  v6 = [v5 workQueue];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke;
  aBlock[3] = &unk_1E6A19248;
  aBlock[4] = self;
  id v12 = v4;
  id v13 = v6;
  id v7 = v6;
  id v8 = v4;
  v9 = _Block_copy(aBlock);

  return v9;
}

void __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 tracker];
  v6 = [v5 pendingTasks];
  id v7 = [*(id *)(a1 + 40) identifier];
  id v8 = [v6 objectForKey:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke_2;
  v13[3] = &unk_1E6A19220;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = v8;
  id v17 = v11;
  id v12 = v8;
  [v12 finishTaskWithCharacteristicResponses:v4 completion:v13];
}

void __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (a2)
  {
    id v9 = [*(id *)(a1 + 40) tracker];
    uint64_t v10 = [*(id *)(a1 + 56) identifier];
    [v9 removePendingTaskWithIdentifier:v10];

    v11 = [*(id *)(a1 + 56) activity];
    [v11 end];

    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 40);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = *(void **)(a1 + 48);
      [v16 executionTimeInterval];
      v18 = v17;
      v19 = NSNumber;
      v20 = [*(id *)(a1 + 40) tracker];
      v21 = [v20 pendingTasks];
      v22 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      int v28 = 138544386;
      v29 = v15;
      __int16 v30 = 2114;
      v31 = v16;
      __int16 v32 = 2114;
      id v33 = v8;
      __int16 v34 = 2048;
      id v35 = v18;
      __int16 v36 = 2114;
      v37 = v22;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Done sending all responses with error: %{public}@. Execution Time: %.3fs. Remaining Tasks: %{public}@", (uint8_t *)&v28, 0x34u);

LABEL_6:
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 40);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      v23 = *(void **)(a1 + 48);
      v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      [*(id *)(a1 + 48) executionTimeInterval];
      v26 = v25;
      v27 = [*(id *)(a1 + 48) debugDescription];
      int v28 = 138544642;
      v29 = v15;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      id v33 = v24;
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2048;
      v37 = v26;
      __int16 v38 = 2112;
      v39 = v27;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Done sending multi-part response(s)[%@] with error: %@. Execution Time: %.3fs. %@", (uint8_t *)&v28, 0x3Eu);

      goto LABEL_6;
    }
  }
}

- (BOOL)_isPrimaryResidentDevice
{
  v2 = [(HMDHAPAccessoryReaderWriter *)self home];
  char v3 = [v2 isCurrentDevicePrimaryResident];

  return v3;
}

- (BOOL)_isSecondaryResidentDevice
{
  v2 = [(HMDHAPAccessoryReaderWriter *)self home];
  if ([v2 isCurrentDeviceAvailableResident]) {
    int v3 = [v2 isCurrentDevicePrimaryResident] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)_isNotResidentDevice
{
  v2 = [(HMDHAPAccessoryReaderWriter *)self home];
  char v3 = [v2 isCurrentDeviceAvailableResident] ^ 1;

  return v3;
}

- (BOOL)_cannotForwardMessage:(id)a3
{
  return [a3 BOOLForKey:@"kDoNotForwardMessageKey"];
}

- (void)submitWriteRequests:(id)a3 sourceType:(unint64_t)a4 requestMessage:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = NSNumber;
  id v12 = [(HMDHAPAccessoryReaderWriter *)self tracker];
  uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "nextTaskIdentifier"));

  id v14 = [HMDHAPAccessoryTaskContext alloc];
  uint64_t v15 = [(HMDHAPAccessoryReaderWriter *)self home];
  id v16 = NSString;
  id v17 = MEMORY[0x1D94505D0](self, a2);
  v18 = [v16 stringWithFormat:@"%@, %s:%ld", v17, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/HMDHAPAccessoryReaderWriter.m", 2464];
  v37 = (void *)v13;
  v19 = [(HMDHAPAccessoryTaskContext *)v14 initWithIdentifier:v13 operationType:1 home:v15 sourceType:a4 requestMessage:v10 name:v18];

  v20 = [(HMDHAPAccessoryReaderWriter *)self _defaultTaskForCurrentDeviceWithContext:v19 requests:v9];
  v21 = (void *)MEMORY[0x1D9452090]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    __int16 v34 = v19;
    v25 = v24 = v10;
    [v24 shortDescription];
    v26 = id v36 = v9;
    v27 = NSNumber;
    [(HMDHAPAccessoryReaderWriter *)v22 tracker];
    int v28 = v35 = v21;
    v29 = [v28 pendingTasks];
    __int16 v30 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
    v31 = NSNumber;
    [v24 timeout];
    __int16 v32 = objc_msgSend(v31, "numberWithDouble:");
    *(_DWORD *)buf = 138544386;
    v39 = v25;
    __int16 v40 = 2114;
    v41 = v20;
    __int16 v42 = 2114;
    v43 = v26;
    __int16 v44 = 2114;
    v45 = v30;
    __int16 v46 = 2114;
    v47 = v32;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Executing with request: %{public}@. Current Tasks: %{public}@. Request Timeout %{public}@", buf, 0x34u);

    v21 = v35;
    id v9 = v36;

    id v10 = v24;
    v19 = v34;
  }

  id v33 = [(HMDHAPAccessoryReaderWriter *)v22 tracker];
  [v33 executeTask:v20];
}

- (id)_defaultTaskForCurrentDeviceWithContext:(id)a3 requests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 operationType];
  id v8 = [v6 requestMessage];
  BOOL v9 = [(HMDHAPAccessoryReaderWriter *)self _cannotForwardMessage:v8];

  id v10 = [(HMDHAPAccessoryReaderWriter *)self _completionHandlerWithContext:v6];
  if (v9) {
    goto LABEL_9;
  }
  if (![(HMDHAPAccessoryReaderWriter *)self _isNotResidentDevice])
  {
    if (![(HMDHAPAccessoryReaderWriter *)self _isSecondaryResidentDevice]
      || ([v6 requestMessage],
          id v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 isRemote],
          v12,
          (v13 & 1) != 0))
    {
      if (![(HMDHAPAccessoryReaderWriter *)self _isPrimaryResidentDevice]) {
        goto LABEL_9;
      }
      id v14 = [(HMDHAPAccessoryReaderWriter *)self dataSource];
      char v15 = [v14 isWholeHomeBluetoothSupported];

      if (v15) {
        goto LABEL_9;
      }
    }
  }
  v11 = (objc_class *)objc_opt_class();
  if (!v11) {
LABEL_9:
  }
    v11 = (objc_class *)objc_opt_class();
  id v16 = (void *)[[v11 alloc] initWithContext:v6 requests:v7 completion:v10];

  return v16;
}

- (void)submitReadRequests:(id)a3 sourceType:(unint64_t)a4 requestMessage:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = NSNumber;
  id v12 = [(HMDHAPAccessoryReaderWriter *)self tracker];
  uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "nextTaskIdentifier"));

  id v14 = [HMDHAPAccessoryTaskContext alloc];
  char v15 = [(HMDHAPAccessoryReaderWriter *)self home];
  id v16 = NSString;
  id v17 = MEMORY[0x1D94505D0](self, a2);
  v18 = [v16 stringWithFormat:@"%@, %s:%ld", v17, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/HMDHAPAccessoryReaderWriter.m", 2418];
  v37 = (void *)v13;
  v19 = [(HMDHAPAccessoryTaskContext *)v14 initWithIdentifier:v13 operationType:0 home:v15 sourceType:a4 requestMessage:v10 name:v18];

  v20 = [(HMDHAPAccessoryReaderWriter *)self _defaultTaskForCurrentDeviceWithContext:v19 requests:v9];
  v21 = (void *)MEMORY[0x1D9452090]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    __int16 v34 = v19;
    v25 = v24 = v10;
    [v24 shortDescription];
    v26 = id v36 = v9;
    v27 = NSNumber;
    [(HMDHAPAccessoryReaderWriter *)v22 tracker];
    int v28 = v35 = v21;
    v29 = [v28 pendingTasks];
    __int16 v30 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
    v31 = NSNumber;
    [v24 timeout];
    __int16 v32 = objc_msgSend(v31, "numberWithDouble:");
    *(_DWORD *)buf = 138544386;
    v39 = v25;
    __int16 v40 = 2114;
    v41 = v20;
    __int16 v42 = 2114;
    v43 = v26;
    __int16 v44 = 2114;
    v45 = v30;
    __int16 v46 = 2114;
    v47 = v32;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Executing with request: %{public}@. Current Tasks: %{public}@. Request Timeout %{public}@", buf, 0x34u);

    v21 = v35;
    id v9 = v36;

    id v10 = v24;
    v19 = v34;
  }

  id v33 = [(HMDHAPAccessoryReaderWriter *)v22 tracker];
  [v33 executeTask:v20];
}

- (void)handleRemotelyUpdatedCharacteristicsMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 stringForKey:@"kRequestIdentifierKey"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(HMDHAPAccessoryReaderWriter *)self tracker];
  id v7 = [v6 pendingRemoteTasks];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 supportsMultiPartResponse])
        {
          if (([v12 allResponsesReceived] & 1) == 0)
          {
            uint64_t v13 = [v12 requestIdentifier];
            id v14 = [v13 UUIDString];
            int v15 = [v14 isEqualToString:v5];

            if (v15)
            {
              id v16 = [v12 requests];
              id v17 = [v4 messagePayload];
              v18 = +[HMDCharacteristicResponse responsesWithRequests:v16 characteristicUpdateDictionary:v17];

              [v12 _receivedRemotelyChangedCharacteristicResponses:v18 message:v4];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (HMDHAPAccessoryReaderWriter)initWithHome:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHAPAccessoryReaderWriter;
  uint64_t v8 = [(HMDHAPAccessoryReaderWriter *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(HMDHAPAccessoryTaskTracker);
    tracker = v8->_tracker;
    v8->_tracker = v9;

    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v8;
}

- (HMDHAPAccessoryReaderWriter)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HMDHAPAccessoryReaderWriterDataSource);
  id v6 = [(HMDHAPAccessoryReaderWriter *)self initWithHome:v4 dataSource:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t47_186754 != -1) {
    dispatch_once(&logCategory__hmf_once_t47_186754, &__block_literal_global_498);
  }
  v2 = (void *)logCategory__hmf_once_v48_186755;
  return v2;
}

uint64_t __42__HMDHAPAccessoryReaderWriter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v48_186755;
  logCategory__hmf_once_v48_186755 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end