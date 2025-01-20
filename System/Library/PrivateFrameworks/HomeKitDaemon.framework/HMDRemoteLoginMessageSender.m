@interface HMDRemoteLoginMessageSender
+ (id)logCategory;
- (HMDAppleMediaAccessory)accessory;
- (HMDDevice)device;
- (HMDRemoteLoginMessageSender)initWithTarget:(id)a3 accessory:(id)a4 device:(id)a5 workQueue:(id)a6 messageDispatcher:(id)a7;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)target;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)sendRemoteMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5;
@end

@implementation HMDRemoteLoginMessageSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (HMDDevice)device
{
  return self->_device;
}

- (NSUUID)target
{
  return self->_target;
}

- (void)sendRemoteMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDRemoteLoginMessageSender *)self device];
  if (v11
    || ([(HMDRemoteLoginMessageSender *)self accessory],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 device],
        v11 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11))
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v33 = v16;
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to %@", buf, 0x20u);
    }
    v17 = [HMDRemoteDeviceMessageDestination alloc];
    v18 = [(HMDRemoteLoginMessageSender *)v14 target];
    v19 = [(HMDRemoteDeviceMessageDestination *)v17 initWithTarget:v18 device:v11];

    v20 = +[HMDRemoteMessage secureMessageWithName:v8 destination:v19 messagePayload:v9];
    objc_initWeak((id *)buf, v14);
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke;
    v29 = &unk_264A2EAE0;
    objc_copyWeak(&v31, (id *)buf);
    id v30 = v10;
    [v20 setResponseHandler:&v26];
    v21 = [(HMDRemoteLoginMessageSender *)v14 messageDispatcher];
    [v21 sendMessage:v20 completionHandler:0];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

    goto LABEL_6;
  }
  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v33 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Remote device to send the message is nil", buf, 0xCu);
  }
  if (v10)
  {
    v11 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v11, 0);
LABEL_6:
  }
}

void __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke_2;
    block[3] = &unk_264A2EE80;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)logIdentifier
{
  v2 = [(HMDRemoteLoginMessageSender *)self target];
  v3 = [v2 UUIDString];

  return v3;
}

- (HMDRemoteLoginMessageSender)initWithTarget:(id)a3 accessory:(id)a4 device:(id)a5 workQueue:(id)a6 messageDispatcher:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDRemoteLoginMessageSender;
  v18 = [(HMDRemoteLoginMessageSender *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_target, a3);
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeWeak((id *)&v19->_accessory, v14);
    objc_storeStrong((id *)&v19->_workQueue, a6);
    objc_storeStrong((id *)&v19->_messageDispatcher, a7);
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_147525 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_147525, &__block_literal_global_147526);
  }
  v2 = (void *)logCategory__hmf_once_v1_147527;
  return v2;
}

void __42__HMDRemoteLoginMessageSender_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_147527;
  logCategory__hmf_once_v1_147527 = v0;
}

@end