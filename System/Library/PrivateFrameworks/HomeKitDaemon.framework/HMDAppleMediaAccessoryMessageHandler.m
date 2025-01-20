@interface HMDAppleMediaAccessoryMessageHandler
- (HMDAppleMediaAccessoryMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10;
- (void)handleAppleMediaAccessoryDeviceIsReachableNotification:(id)a3;
- (void)handleAppleMediaAccessoryDeviceUpdatedNotification:(id)a3;
@end

@implementation HMDAppleMediaAccessoryMessageHandler

- (void)handleAppleMediaAccessoryDeviceIsReachableNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 object];
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
    if ([(HMDMessageHandler *)self hasQueuedOutgoingMessagesForDevice:v7])
    {
      v8 = (void *)MEMORY[0x230FBD990]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v17 = 138543618;
        v18 = v11;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling remote device is reachable notification with device: %@", (uint8_t *)&v17, 0x16u);
      }
      [(HMDMessageHandler *)v9 sendQueuedOutgoingMessagesForDevice:v7];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [v4 object];
      int v17 = 138543618;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get device from remote device is reachable notification object: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)handleAppleMediaAccessoryDeviceUpdatedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDMessageHandler *)self hasQueuedOutgoingMessages])
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling apple media accessory device updated notification: %@", (uint8_t *)&v9, 0x16u);
    }
    [(HMDMessageHandler *)v6 sendQueuedOutgoingMessages];
  }
}

- (HMDAppleMediaAccessoryMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10
{
  v39[2] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v22)
  {
LABEL_16:
    _HMFPreconditionFailure();
LABEL_17:
    _HMFPreconditionFailure();
  }
  v24 = v23;
  if (!v23) {
    goto LABEL_17;
  }
  uint64_t v25 = [v22 mutableCopy];
  v37 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = self;
  v33 = (void *)v25;
  v39[0] = @"HMDAppleMediaAccessoryDeviceUpdatedNotification";
  v39[1] = @"HMDAppleMediaAccessoryDeviceIsReachableNotification";
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  [v33 addObjectsFromArray:v34];

  v38.receiver = v32;
  v38.super_class = (Class)HMDAppleMediaAccessoryMessageHandler;
  v35 = [(HMDMessageHandler *)&v38 initWithMessageTargetUUID:v31 messageDispatcher:v30 notificationCenter:v29 ownerPrivateRemoteMessages:v28 adminPrivateRemoteMessages:v27 internalMessages:v26 notifications:v33 notificationsToObject:v24];

  return v35;
}

@end