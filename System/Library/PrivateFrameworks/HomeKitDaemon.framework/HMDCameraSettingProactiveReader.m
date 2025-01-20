@interface HMDCameraSettingProactiveReader
+ (id)_streamingStatusForResponse:(id)a3;
+ (id)logCategory;
- (BOOL)hasPendingNegotiateMessageForSessionWithIdentifier:(id)a3;
- (HMCameraStreamPreferences)streamPreferences;
- (HMDCameraSettingProactiveReader)initWithWorkQueue:(id)a3 sessionID:(id)a4 accessory:(id)a5 message:(id)a6 streamControlMessageHandlers:(id)a7 streamPreferences:(id)a8 logIdentifier:(id)a9;
- (HMDCameraSettingProactiveReaderDelegate)delegate;
- (HMDHAPAccessory)accessory;
- (HMFMessage)pendingNegotiateMessage;
- (NSSet)streamControlMessageHandlers;
- (NSString)logIdentifier;
- (NSString)sessionID;
- (OS_dispatch_queue)workQueue;
- (id)_availableStreamControlMessageHandlersForReadResponses:(id)a3;
- (id)_inUseStreamControlMessageHandlersForReadResponses:(id)a3;
- (void)_callDidCompleteReadDelegateCallback;
- (void)_handleStreamStatusMultireadResponse:(id)a3;
- (void)handleMessage:(id)a3;
- (void)readSetting;
- (void)setAccessory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingNegotiateMessage:(id)a3;
@end

@implementation HMDCameraSettingProactiveReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingNegotiateMessage, 0);
  objc_storeStrong((id *)&self->_streamPreferences, 0);
  objc_storeStrong((id *)&self->_streamControlMessageHandlers, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setPendingNegotiateMessage:(id)a3
{
}

- (HMFMessage)pendingNegotiateMessage
{
  return (HMFMessage *)objc_getProperty(self, a2, 64, 1);
}

- (HMCameraStreamPreferences)streamPreferences
{
  return (HMCameraStreamPreferences *)objc_getProperty(self, a2, 56, 1);
}

- (NSSet)streamControlMessageHandlers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraSettingProactiveReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSettingProactiveReaderDelegate *)WeakRetained;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)_callDidCompleteReadDelegateCallback
{
  v3 = [(HMDCameraSettingProactiveReader *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraSettingProactiveReader *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 cameraSettingProactiveReaderDidCompleteRead:self];
  }
}

- (id)_inUseStreamControlMessageHandlersForReadResponses:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraSettingProactiveReader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraSettingProactiveReader *)self streamControlMessageHandlers];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke;
  v18[3] = &unk_264A20750;
  id v7 = v4;
  id v19 = v7;
  v20 = self;
  v8 = objc_msgSend(v6, "na_filter:", v18);

  v13 = (void *)MEMORY[0x230FBD990](v9, v10, v11, v12);
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Found inUseStreamControlMessageHandlers: %@", buf, 0x16u);
  }

  return v8;
}

BOOL __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke_2;
  v10[3] = &unk_264A20728;
  id v5 = v3;
  id v11 = v5;
  v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  id v7 = [(id)objc_opt_class() _streamingStatusForResponse:v6];
  if ([v5 hasStreamSession])
  {
    BOOL v8 = 1;
  }
  else if (v7)
  {
    BOOL v8 = [v7 streamingStatus] == 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __86__HMDCameraSettingProactiveReader__inUseStreamControlMessageHandlersForReadResponses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  id v4 = [v3 characteristic];
  id v5 = [v4 service];
  v6 = [*(id *)(a1 + 32) streamManagementService];
  BOOL v7 = v5 == v6;

  return v7;
}

- (id)_availableStreamControlMessageHandlersForReadResponses:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraSettingProactiveReader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraSettingProactiveReader *)self streamControlMessageHandlers];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke;
  v18[3] = &unk_264A20750;
  id v7 = v4;
  id v19 = v7;
  v20 = self;
  BOOL v8 = objc_msgSend(v6, "na_filter:", v18);

  v13 = (void *)MEMORY[0x230FBD990](v9, v10, v11, v12);
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Found availableStreamControlMessageHandlers: %@", buf, 0x16u);
  }

  return v8;
}

BOOL __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke_2;
  v10[3] = &unk_264A20728;
  id v5 = v3;
  id v11 = v5;
  v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  id v7 = [(id)objc_opt_class() _streamingStatusForResponse:v6];
  if ([v5 hasStreamSession])
  {
    BOOL v8 = 0;
  }
  else if (v7)
  {
    BOOL v8 = [v7 streamingStatus] == 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

BOOL __90__HMDCameraSettingProactiveReader__availableStreamControlMessageHandlersForReadResponses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  id v4 = [v3 characteristic];
  id v5 = [v4 service];
  v6 = [*(id *)(a1 + 32) streamManagementService];
  BOOL v7 = v5 == v6;

  return v7;
}

- (void)_handleStreamStatusMultireadResponse:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraSettingProactiveReader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraSettingProactiveReader *)self pendingNegotiateMessage];
  if (v6)
  {
    BOOL v7 = [(HMDCameraSettingProactiveReader *)self _availableStreamControlMessageHandlersForReadResponses:v4];
    BOOL v8 = [(HMDCameraSettingProactiveReader *)self _inUseStreamControlMessageHandlersForReadResponses:v4];
    if (![v6 isEntitledForSPIAccess]) {
      goto LABEL_10;
    }
    uint64_t v9 = [(HMDCameraSettingProactiveReader *)self streamPreferences];
    uint64_t v10 = [v9 minimumRequiredAvailableOrInUseStreams];

    if (v10 < 1) {
      goto LABEL_10;
    }
    uint64_t v11 = [v7 count];
    uint64_t v12 = [v8 count] + v11;
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = v13;
      v17 = v16 = (void *)v12;
      v18 = [(HMDCameraSettingProactiveReader *)v14 streamPreferences];
      *(_DWORD *)buf = 138543874;
      v40 = v17;
      __int16 v41 = 2048;
      v42 = v16;
      __int16 v43 = 2048;
      uint64_t v44 = [v18 minimumRequiredAvailableOrInUseStreams];
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Comparing availableOrInUseStreamsCount: %ld, against minimumRequiredAvailableOrInUseStreams: %ld", buf, 0x20u);

      uint64_t v12 = (uint64_t)v16;
      v13 = v38;
    }

    id v19 = [(HMDCameraSettingProactiveReader *)v14 streamPreferences];
    uint64_t v20 = [v19 minimumRequiredAvailableOrInUseStreams];

    if (v12 < v20)
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = v14;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v40 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@availableOrInUseStreamsCount is less than minimumRequiredAvailableOrInUseStreams, so not starting stream", buf, 0xCu);
      }
      uint64_t v25 = [MEMORY[0x263F087E8] hmErrorWithCode:14];
      [v6 respondWithError:v25];

      [(HMDCameraSettingProactiveReader *)v22 _callDidCompleteReadDelegateCallback];
    }
    else
    {
LABEL_10:
      v26 = [v7 anyObject];
      v27 = v26;
      if (v26)
      {
        [v26 handleMessage:v6];
      }
      else
      {
        v33 = (void *)MEMORY[0x230FBD990]();
        v34 = self;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v40 = v36;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@No camera streaming service is available", buf, 0xCu);
        }
        v37 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1019];
        [v6 respondWithError:v37];
      }
      [(HMDCameraSettingProactiveReader *)self _callDidCompleteReadDelegateCallback];
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      v32 = [(HMDCameraSettingProactiveReader *)v29 sessionID];
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      __int16 v41 = 2112;
      v42 = v32;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Pending negotiate message for session with identifier: %@ has already been handled", buf, 0x16u);
    }
  }
}

- (void)readSetting
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraSettingProactiveReader *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  v33 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v41 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting proactive read of stream status", buf, 0xCu);
  }
  BOOL v7 = (void *)MEMORY[0x263EFF980];
  BOOL v8 = [(HMDCameraSettingProactiveReader *)v33 streamControlMessageHandlers];
  v34 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = [(HMDCameraSettingProactiveReader *)v33 streamControlMessageHandlers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v37;
    uint64_t v14 = *MEMORY[0x263F35570];
    *(void *)&long long v11 = 138543618;
    long long v31 = v11;
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "streamManagementService", v31);
        v18 = [v17 findCharacteristicWithType:v14];

        if (v18)
        {
          id v19 = +[HMDCharacteristicRequest requestWithCharacteristic:v18];
          [v34 addObject:v19];
        }
        else
        {
          uint64_t v20 = v14;
          v21 = (void *)MEMORY[0x230FBD990]();
          v22 = v33;
          __int16 v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v25 = v24 = v9;
            v26 = [v16 streamManagementService];
            *(_DWORD *)buf = v31;
            __int16 v41 = v25;
            __int16 v42 = 2112;
            __int16 v43 = v26;
            _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the stream status characteristic in the given service %@", buf, 0x16u);

            uint64_t v9 = v24;
            uint64_t v13 = v32;
          }

          uint64_t v14 = v20;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v12);
  }

  v27 = [(HMDCameraSettingProactiveReader *)v33 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  id v29 = v28;

  v30 = [(HMDCameraSettingProactiveReader *)v33 workQueue];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __46__HMDCameraSettingProactiveReader_readSetting__block_invoke;
  v35[3] = &unk_264A28890;
  v35[4] = v33;
  [v29 readCharacteristicValues:v34 source:7 queue:v30 completionHandler:v35];
}

void __46__HMDCameraSettingProactiveReader_readSetting__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for proactive read of stream status", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) _handleStreamStatusMultireadResponse:v3];
}

- (void)handleMessage:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraSettingProactiveReader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraSettingProactiveReader *)self pendingNegotiateMessage];

  if (!v6) {
    _HMFPreconditionFailure();
  }
  BOOL v7 = (void *)MEMORY[0x230FBD990]();
  int v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    long long v11 = [v4 shortDescription];
    int v27 = 138543618;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling message: %@", (uint8_t *)&v27, 0x16u);
  }
  uint64_t v12 = [v4 name];
  if ([v12 isEqualToString:*MEMORY[0x263F0BD98]])
  {

LABEL_7:
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v8;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      id v19 = [(HMDCameraSettingProactiveReader *)v16 sessionID];
      int v27 = 138543618;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding to pending negotiate message for session with identifier: %@", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v20 = [(HMDCameraSettingProactiveReader *)v16 pendingNegotiateMessage];
    v21 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    [v20 respondWithPayload:0 error:v21];

    [(HMDCameraSettingProactiveReader *)v16 setPendingNegotiateMessage:0];
    [(HMDCameraSettingProactiveReader *)v16 _callDidCompleteReadDelegateCallback];
    [v4 respondWithSuccess];
    goto LABEL_13;
  }
  uint64_t v13 = [v4 name];
  int v14 = [v13 isEqualToString:@"kStopRemoteStreamRequestKey"];

  if (v14) {
    goto LABEL_7;
  }
  v22 = (void *)MEMORY[0x230FBD990]();
  __int16 v23 = v8;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    int v27 = 138543362;
    v28 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Responding to message with error because it cannot be handled", (uint8_t *)&v27, 0xCu);
  }
  v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v4 respondWithError:v26];

LABEL_13:
}

- (BOOL)hasPendingNegotiateMessageForSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraSettingProactiveReader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = [(HMDCameraSettingProactiveReader *)self pendingNegotiateMessage];
    BOOL v7 = [v6 stringForKey:@"kCameraSessionID"];

    LOBYTE(v6) = [v7 isEqualToString:v4];
    return (char)v6;
  }
  else
  {
    uint64_t v9 = (HMDCameraSettingProactiveReader *)_HMFPreconditionFailure();
    return [(HMDCameraSettingProactiveReader *)v9 initWithWorkQueue:v11 sessionID:v12 accessory:v13 message:v14 streamControlMessageHandlers:v15 streamPreferences:v16 logIdentifier:v17];
  }
}

- (HMDCameraSettingProactiveReader)initWithWorkQueue:(id)a3 sessionID:(id)a4 accessory:(id)a5 message:(id)a6 streamControlMessageHandlers:(id)a7 streamPreferences:(id)a8 logIdentifier:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id obj = a6;
  id v19 = a6;
  id v32 = a7;
  id v20 = a7;
  id v33 = a8;
  id v21 = a8;
  id v22 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v20)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  __int16 v23 = v22;
  if (!v22)
  {
LABEL_17:
    __int16 v29 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSettingProactiveReader *)+[HMDCameraSettingProactiveReader logCategory];
  }
  v34.receiver = self;
  v34.super_class = (Class)HMDCameraSettingProactiveReader;
  v24 = [(HMDCameraSettingProactiveReader *)&v34 init];
  uint64_t v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_workQueue, a3);
    objc_storeStrong((id *)&v25->_sessionID, a4);
    objc_storeWeak((id *)&v25->_accessory, v18);
    objc_storeStrong((id *)&v25->_pendingNegotiateMessage, obj);
    objc_storeStrong((id *)&v25->_streamControlMessageHandlers, v32);
    objc_storeStrong((id *)&v25->_streamPreferences, v33);
    uint64_t v26 = [NSString stringWithFormat:@"%@/%@", v23, v17];
    logIdentifier = v25->_logIdentifier;
    v25->_logIdentifier = (NSString *)v26;
  }
  return v25;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_130196 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_130196, &__block_literal_global_130197);
  }
  v2 = (void *)logCategory__hmf_once_v17_130198;
  return v2;
}

void __46__HMDCameraSettingProactiveReader_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v17_130198;
  logCategory__hmf_once_v17_130198 = v0;
}

+ (id)_streamingStatusForResponse:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [(HAPTLVBase *)[HMDStreamingStatus alloc] initWithTLVData:v7];
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = HMDStreamingStatusTypeAsString([(HMDStreamingStatus *)v8 streamingStatus]);
      id v14 = [v4 request];
      id v15 = [v14 characteristic];
      [v15 service];
      id v25 = a1;
      v17 = id v16 = v9;
      *(_DWORD *)buf = 138543874;
      int v27 = v12;
      __int16 v28 = 2114;
      __int16 v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Found streaming status: %{public}@ for streaming service: %@", buf, 0x20u);

      uint64_t v9 = v16;
      a1 = v25;
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = [v4 value];
      id v21 = [v4 request];
      id v22 = [v21 characteristic];
      __int16 v23 = [v22 service];
      *(_DWORD *)buf = 138543874;
      int v27 = v19;
      __int16 v28 = 2112;
      __int16 v29 = v20;
      __int16 v30 = 2112;
      uint64_t v31 = v23;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received invalid value type: %@ for streaming service: %@ HAPCharacteristicUUID_StreamingStatus characteristic", buf, 0x20u);
    }
    int v8 = 0;
  }

  return v8;
}

@end