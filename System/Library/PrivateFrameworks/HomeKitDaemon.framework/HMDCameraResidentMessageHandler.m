@interface HMDCameraResidentMessageHandler
+ (id)logCategory;
- (BOOL)isRemoteAccessDeviceReachable;
- (BOOL)isUsingCompanionForRemoteAccessDevice;
- (HMDAccessory)accessory;
- (HMDCameraResidentMessageHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4;
- (HMDCameraResidentMessageHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4 messageDispatcher:(id)a5;
- (HMDDevice)remoteAccessDevice;
- (HMDMessageDispatcher)messageDispatcher;
- (NSMutableDictionary)queuedMessagesByDeviceIdentifier;
- (NSString)logIdentifier;
- (id)nextMessageForDeviceIdentifier:(id)a3;
- (void)dequeueRespondedMessageForDeviceIdentifier:(id)a3;
- (void)enqueueMessage:(id)a3 forDeviceIdentifier:(id)a4;
- (void)sendMessageWithName:(id)a3 cameraSessionID:(id)a4 payload:(id)a5 target:(id)a6 device:(id)a7 responseQueue:(id)a8 responseHandler:(id)a9;
- (void)sendMessageWithName:(id)a3 cameraSessionID:(id)a4 payload:(id)a5 target:(id)a6 responseQueue:(id)a7 responseHandler:(id)a8;
- (void)sendNextMessageForDeviceIdentifier:(id)a3;
@end

@implementation HMDCameraResidentMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedMessagesByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (NSMutableDictionary)queuedMessagesByDeviceIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (void)sendNextMessageForDeviceIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraResidentMessageHandler *)self nextMessageForDeviceIdentifier:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [v5 shortDescription];
      int v12 = 138543874;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending next queued message %@ to device with identifier: %@", (uint8_t *)&v12, 0x20u);
    }
    v11 = [(HMDCameraResidentMessageHandler *)v7 messageDispatcher];
    [v11 sendMessage:v5];
  }
}

- (id)nextMessageForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(HMDCameraResidentMessageHandler *)self queuedMessagesByDeviceIdentifier];
  v7 = [v6 objectForKeyedSubscript:v4];
  v8 = [v7 firstObject];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)dequeueRespondedMessageForDeviceIdentifier:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDCameraResidentMessageHandler *)self queuedMessagesByDeviceIdentifier];
  v6 = [v5 objectForKeyedSubscript:v8];

  objc_msgSend(v6, "hmf_removeFirstObject");
  if (![v6 count])
  {
    v7 = [(HMDCameraResidentMessageHandler *)self queuedMessagesByDeviceIdentifier];
    [v7 setObject:0 forKeyedSubscript:v8];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)enqueueMessage:(id)a3 forDeviceIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  v7 = [(HMDCameraResidentMessageHandler *)self queuedMessagesByDeviceIdentifier];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF980] array];
    v9 = [(HMDCameraResidentMessageHandler *)self queuedMessagesByDeviceIdentifier];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  uint64_t v10 = [v8 count];
  [v8 addObject:v11];

  os_unfair_lock_unlock(&self->_lock);
  if (!v10) {
    [(HMDCameraResidentMessageHandler *)self sendNextMessageForDeviceIdentifier:v6];
  }
}

- (BOOL)isRemoteAccessDeviceReachable
{
  v2 = [(HMDCameraResidentMessageHandler *)self accessory];
  v3 = [v2 home];
  char v4 = [v3 isRemoteAccessDeviceReachable];

  return v4;
}

- (BOOL)isUsingCompanionForRemoteAccessDevice
{
  v3 = [(HMDCameraResidentMessageHandler *)self remoteAccessDevice];
  char v4 = [(HMDCameraResidentMessageHandler *)self accessory];
  v5 = [v4 home];
  id v6 = [v5 homeManager];
  v7 = [v6 companionDevice];
  char v8 = [v3 isEqual:v7];

  return v8;
}

- (HMDDevice)remoteAccessDevice
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(HMDCameraResidentMessageHandler *)self accessory];
  char v4 = [v3 home];

  if (v4)
  {
    v5 = [v4 homeManager];
    id v6 = [v5 companionDevice];

    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      int v12 = [(HMDCameraResidentMessageHandler *)self messageDispatcher];
      id v7 = [v12 remoteAccessDeviceForHome:v4];

      if (v7)
      {
        id v13 = v7;
      }
      else
      {
        __int16 v14 = (void *)MEMORY[0x230FBD990]();
        v15 = self;
        __int16 v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = HMFGetLogIdentifier();
          int v19 = 138543618;
          v20 = v17;
          __int16 v21 = 2112;
          v22 = v4;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find remote access device for home %@", (uint8_t *)&v19, 0x16u);
        }
      }
    }
  }
  else
  {
    char v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get home to determine remote access device", (uint8_t *)&v19, 0xCu);
    }
    id v7 = 0;
  }

  return (HMDDevice *)v7;
}

- (void)sendMessageWithName:(id)a3 cameraSessionID:(id)a4 payload:(id)a5 target:(id)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(HMDCameraResidentMessageHandler *)self remoteAccessDevice];
  [(HMDCameraResidentMessageHandler *)self sendMessageWithName:v19 cameraSessionID:v18 payload:v17 target:v16 device:v20 responseQueue:v15 responseHandler:v14];
}

- (void)sendMessageWithName:(id)a3 cameraSessionID:(id)a4 payload:(id)a5 target:(id)a6 device:(id)a7 responseQueue:(id)a8 responseHandler:(id)a9
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v19)
  {
    v37 = [[HMDRemoteDeviceMessageDestination alloc] initWithTarget:v18 device:v19];
    id v40 = v17;
    v22 = +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v15, 33);
    uint64_t v23 = [v22 identifier];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_12;
    v41[3] = &unk_264A2DED8;
    v39 = v20;
    v42 = v20;
    id v38 = v21;
    id v46 = v21;
    v43 = self;
    id v24 = v23;
    id v44 = v24;
    id v25 = v19;
    id v45 = v25;
    v26 = (void *)MEMORY[0x230FBD990]([v22 setResponseHandler:v41]);
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = v34 = v26;
      [v25 shortDescription];
      id v35 = v18;
      v31 = id v30 = v16;
      [v22 shortDescription];
      v32 = id v36 = v15;
      *(_DWORD *)buf = 138544130;
      v52 = v29;
      __int16 v53 = 2112;
      id v54 = v30;
      __int16 v55 = 2112;
      v56 = v31;
      __int16 v57 = 2112;
      v58 = v32;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Enqueueing camera message for session ID %@ to %@ using %@", buf, 0x2Au);

      id v15 = v36;
      id v16 = v30;
      id v18 = v35;

      v26 = v34;
    }

    v33 = [v25 identifier];
    [(HMDCameraResidentMessageHandler *)v27 enqueueMessage:v22 forDeviceIdentifier:v33];

    id v20 = v39;
    id v17 = v40;
    id v21 = v38;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke;
    block[3] = &unk_264A2EE30;
    block[4] = self;
    id v48 = v15;
    id v49 = v16;
    id v50 = v21;
    dispatch_async(v20, block);
  }
}

void __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138543874;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Did not find the resident device to send the message %@ for session %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  v9 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1034];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
}

void __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_2;
  block[3] = &unk_264A2EE80;
  id v22 = *(id *)(a1 + 64);
  id v8 = v5;
  id v20 = v8;
  id v9 = v6;
  id v21 = v9;
  dispatch_async(v7, block);
  int v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    id v24 = v13;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received response for message with identifier %@. Sending next message", buf, 0x16u);
  }
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = [*(id *)(a1 + 56) identifier];
  [v15 dequeueRespondedMessageForDeviceIdentifier:v16];

  id v17 = *(void **)(a1 + 40);
  id v18 = [*(id *)(a1 + 56) identifier];
  [v17 sendNextMessageForDeviceIdentifier:v18];
}

uint64_t __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (HMDCameraResidentMessageHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4 messageDispatcher:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  id v11 = v10;
  if (!v10)
  {
LABEL_9:
    id v19 = (HMDCameraResidentMessageHandler *)_HMFPreconditionFailure();
    return [(HMDCameraResidentMessageHandler *)v19 initWithAccessory:v21 logIdentifier:v22];
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraResidentMessageHandler;
  __int16 v12 = [(HMDCameraResidentMessageHandler *)&v23 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_accessory, v8);
    objc_storeStrong((id *)&v13->_messageDispatcher, a5);
    uint64_t v14 = [v9 copy];
    logIdentifier = v13->_logIdentifier;
    v13->_logIdentifier = (NSString *)v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    queuedMessagesByDeviceIdentifier = v13->_queuedMessagesByDeviceIdentifier;
    v13->_queuedMessagesByDeviceIdentifier = (NSMutableDictionary *)v16;
  }
  return v13;
}

- (HMDCameraResidentMessageHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDMessageDispatcher defaultDispatcher];
  id v9 = [(HMDCameraResidentMessageHandler *)self initWithAccessory:v7 logIdentifier:v6 messageDispatcher:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_113745 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_113745, &__block_literal_global_113746);
  }
  v2 = (void *)logCategory__hmf_once_v10_113747;
  return v2;
}

void __46__HMDCameraResidentMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_113747;
  logCategory__hmf_once_v10_113747 = v0;
}

@end