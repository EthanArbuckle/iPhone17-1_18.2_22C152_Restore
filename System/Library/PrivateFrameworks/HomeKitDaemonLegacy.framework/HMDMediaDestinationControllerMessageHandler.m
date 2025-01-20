@interface HMDMediaDestinationControllerMessageHandler
+ (id)logCategory;
- (HMDMediaDestinationControllerMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 metricsEventDispatcher:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9;
- (HMDMediaDestinationControllerMessageHandlerDataSource)dataSource;
- (HMDMediaDestinationControllerMessageHandlerDelegate)delegate;
- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher;
- (id)destinationIdentifierInMessage:(id)a3 error:(id *)a4;
- (id)logIdentifier;
- (unint64_t)upateOptionsInMessage:(id)a3 error:(id *)a4;
- (void)handleHomeAccessoryRemovedNotification:(id)a3;
- (void)handleMediaDestinationControllerUpdateDestinationRequestMessage:(id)a3;
- (void)handleMediaDestinationControllerUpdatedDestinationNotification:(id)a3;
- (void)handleMediaDestinationUpdatedNotification:(id)a3;
- (void)handleMediaGroupsAggregateConsumerUpdatedAggregateDataNotification:(id)a3;
- (void)handleMediaSystemAddedNotification:(id)a3;
- (void)handleMediaSystemRemovedNotification:(id)a3;
- (void)handleNotificationAccessoryChangedRoom:(id)a3;
- (void)notifyUpdatedDestinationWithIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetricsEventDispatcher:(id)a3;
@end

@implementation HMDMediaDestinationControllerMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setMetricsEventDispatcher:(id)a3
{
}

- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDMediaDestinationControllerMetricsEventDispatcher *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationControllerMessageHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationControllerMessageHandlerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaDestinationControllerMessageHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaDestinationControllerMessageHandlerDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMessageHandler *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleMediaGroupsAggregateConsumerUpdatedAggregateDataNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v15 = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media groups aggregate consumer updated aggregate data notification", (uint8_t *)&v15, 0xCu);
  }
  v9 = [(HMDMediaDestinationControllerMessageHandler *)v6 delegate];
  v10 = v9;
  if (v9)
  {
    [v9 mediaDestinationControllerMessageHandler:v6 didReceiveMediaGroupsAggregateConsumerUpdatedAggregateDataNotification:v4];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media groups aggregate consumer updated aggregate data notification due to no delegate", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleMediaDestinationControllerUpdatedDestinationNotification:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v38 = 138543618;
    v39 = v8;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination controller updated destination notification: %@", (uint8_t *)&v38, 0x16u);
  }
  v9 = [v4 userInfo];
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "hmf_UUIDForKey:", @"HMDMediaDestinationControllerIdentifierNotificationKey");
    if (!v11)
    {
      v28 = (void *)MEMORY[0x1D9452090]();
      v29 = v6;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        int v38 = 138543618;
        v39 = v31;
        __int16 v40 = 2112;
        id v41 = v10;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media destination controller identifier from media destination controller updated destination notification user info: %@", (uint8_t *)&v38, 0x16u);
      }
      goto LABEL_26;
    }
    v12 = objc_msgSend(v10, "hmf_UUIDForKey:", @"HMDMediaDestinationIdentifierNotificationKey");
    v13 = v12;
    if (v12)
    {
      v14 = [v12 UUIDString];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F2D8E0]];

      if (!v15)
      {
        v32 = [(HMDMediaDestinationControllerMessageHandler *)v6 delegate];
        v33 = v32;
        if (v32)
        {
          [v32 mediaDestinationControllerMessageHandler:v6 didReceiveMediaDestinationControllerUpdatedDestinationNotification:v4 destinationControllerIdentifier:v11 destinationIdentifier:v13];
        }
        else
        {
          v34 = (void *)MEMORY[0x1D9452090]();
          v35 = v6;
          v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v37 = HMFGetLogIdentifier();
            int v38 = 138543362;
            v39 = v37;
            _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media destination controller updated destination notification due to no delegate", (uint8_t *)&v38, 0xCu);
          }
        }

        goto LABEL_25;
      }
      v16 = (void *)MEMORY[0x1D9452090]();
      uint64_t v17 = v6;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        int v38 = 138543362;
        v39 = v19;
        v20 = "%{public}@Skipping media destination controller updated destination notification due to null destination";
        v21 = v18;
        os_log_type_t v22 = OS_LOG_TYPE_INFO;
        uint32_t v23 = 12;
LABEL_17:
        _os_log_impl(&dword_1D49D5000, v21, v22, v20, (uint8_t *)&v38, v23);
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1D9452090]();
      uint64_t v17 = v6;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v38 = 138543618;
        v39 = v19;
        __int16 v40 = 2112;
        id v41 = v10;
        v20 = "%{public}@Failed to get media destination identifier from media destination controller updated destination"
              " notification user info: %@";
        v21 = v18;
        os_log_type_t v22 = OS_LOG_TYPE_ERROR;
        uint32_t v23 = 22;
        goto LABEL_17;
      }
    }

LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v24 = (void *)MEMORY[0x1D9452090]();
  v25 = v6;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    int v38 = 138543618;
    v39 = v27;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to get user info in media destination controller updated destination notification: %@", (uint8_t *)&v38, 0x16u);
  }
LABEL_27:
}

- (void)handleNotificationAccessoryChangedRoom:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v11;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling accessory changed room notification: %@", (uint8_t *)&v28, 0x16u);
    }
    v12 = [v7 audioDestination];
    v13 = [v7 audioDestinationController];
    v14 = v13;
    if (v12
      || ([v13 identifier],
          int v15 = objc_claimAutoreleasedReturnValue(),
          [(HMDMessageHandler *)v9 messageTargetUUID],
          v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = objc_msgSend(v15, "hmf_isEqualToUUID:", v16),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      v18 = [(HMDMediaDestinationControllerMessageHandler *)v9 delegate];
      v19 = v18;
      if (v18)
      {
        [v18 mediaDestinationControllerMessageHandler:v9 didReceiveAccessoryChangedRoomNotification:v4];
      }
      else
      {
        v20 = (void *)MEMORY[0x1D9452090]();
        v21 = v9;
        os_log_type_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint32_t v23 = HMFGetLogIdentifier();
          int v28 = 138543362;
          v29 = v23;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of accessory changed rooms notification due to no delegate", (uint8_t *)&v28, 0xCu);
        }
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D9452090]();
      v25 = v9;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        int v28 = 138543362;
        v29 = v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping accessory changed room notification due to no destination and no related destination controller", (uint8_t *)&v28, 0xCu);
      }
    }
  }
}

- (void)handleMediaSystemRemovedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media system removed notification: %@", (uint8_t *)&v15, 0x16u);
  }
  v9 = [(HMDMediaDestinationControllerMessageHandler *)v6 delegate];
  v10 = v9;
  if (v9)
  {
    [v9 mediaDestinationControllerMessageHandler:v6 didReceiveMediaSystemRemovedNotification:v4];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media system removed notification due to no delegate", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleMediaSystemAddedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media system added notification: %@", (uint8_t *)&v15, 0x16u);
  }
  v9 = [(HMDMediaDestinationControllerMessageHandler *)v6 delegate];
  v10 = v9;
  if (v9)
  {
    [v9 mediaDestinationControllerMessageHandler:v6 didReceiveMediaSystemAddedNotification:v4];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media system added notification due to no delegate", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
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
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v11;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling home accessory removed notification: %@", (uint8_t *)&v23, 0x16u);
    }
    v12 = [v7 audioDestination];
    if (v12)
    {
      v13 = [(HMDMediaDestinationControllerMessageHandler *)v9 delegate];
      v14 = v13;
      if (v13)
      {
        [v13 mediaDestinationControllerMessageHandler:v9 didReceiveHomeAccessoryRemovedNotification:v4 destination:v12];
      }
      else
      {
        uint64_t v19 = (void *)MEMORY[0x1D9452090]();
        v20 = v9;
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          os_log_type_t v22 = HMFGetLogIdentifier();
          int v23 = 138543362;
          v24 = v22;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of accessory removed notification due to no delegate", (uint8_t *)&v23, 0xCu);
        }
      }
    }
    else
    {
      int v15 = (void *)MEMORY[0x1D9452090]();
      v16 = v9;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        int v23 = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping home accessory removed notification due to no destination", (uint8_t *)&v23, 0xCu);
      }
    }
  }
}

- (void)handleMediaDestinationUpdatedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination updated notification: %@", (uint8_t *)&v15, 0x16u);
  }
  v9 = [(HMDMediaDestinationControllerMessageHandler *)v6 delegate];
  v10 = v9;
  if (v9)
  {
    [v9 mediaDestinationControllerMessageHandler:v6 didReceiveMediaDestinationUpdatedNotification:v4];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media destination updated notification due to no delegate", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleMediaDestinationControllerUpdateDestinationRequestMessage:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v8;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update destination request message: %@", buf, 0x16u);
  }
  v9 = [v4 responseHandler];

  if (v9)
  {
    id v34 = 0;
    v10 = [(HMDMediaDestinationControllerMessageHandler *)v6 destinationIdentifierInMessage:v4 error:&v34];
    id v11 = v34;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = v6;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v36 = v15;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        id v40 = v11;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination identifier from update destination message: %@ error: %@", buf, 0x20u);
      }
      [v4 respondWithError:v11];
    }
    id v33 = v11;
    uint64_t v16 = [(HMDMediaDestinationControllerMessageHandler *)v6 upateOptionsInMessage:v4 error:&v33];
    id v17 = v33;

    if (v17)
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      uint64_t v19 = v6;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v36 = v21;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        id v40 = v17;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get update options from update destination message: %@ error: %@", buf, 0x20u);
      }
      [v4 respondWithError:v17];
    }
    os_log_type_t v22 = [(HMDMediaDestinationControllerMessageHandler *)v6 delegate];
    int v23 = v22;
    if (v22)
    {
      [v22 mediaDestinationControllerMessageHandler:v6 didReceiveMediaDestinationControllerUpdateDestinationRequestMessage:v4 destinationIdentifier:v10 updateOptions:v16];
    }
    else
    {
      int v28 = (void *)MEMORY[0x1D9452090]();
      v29 = v6;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v31;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of update destination request message due to no delegate", buf, 0xCu);
      }
      uint64_t v32 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      [v4 respondWithError:v32];
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    __int16 v25 = v6;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response handler from update destination request message: %@", buf, 0x16u);
    }
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v17];
  }
}

- (unint64_t)upateOptionsInMessage:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 messagePayload];
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "hmf_numberForKey:", *MEMORY[0x1E4F2D8C8]);
    v10 = v9;
    if (v9)
    {
      unint64_t v11 = [v9 unsignedIntegerValue];
      if (v11 < 4)
      {
LABEL_18:

        goto LABEL_19;
      }
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = HMFGetLogIdentifier();
        uint64_t v16 = HMMediaDestinationControllerUpateOptionsAsString();
        int v27 = 138543618;
        int v28 = v15;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform update due to unknown update options: %@", (uint8_t *)&v27, 0x16u);
      }
      if (a4)
      {
        uint64_t v17 = 3;
LABEL_16:
        [MEMORY[0x1E4F28C58] hmErrorWithCode:v17];
        unint64_t v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      os_log_type_t v22 = (void *)MEMORY[0x1D9452090]();
      int v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v27 = 138543618;
        int v28 = v25;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to get update options from message: %@", (uint8_t *)&v27, 0x16u);
      }
      if (a4)
      {
        uint64_t v17 = 20;
        goto LABEL_16;
      }
    }
    unint64_t v11 = 0;
    goto LABEL_18;
  }
  id v18 = (void *)MEMORY[0x1D9452090]();
  uint64_t v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    int v27 = 138543618;
    int v28 = v21;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v27, 0x16u);
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    unint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_19:

  return v11;
}

- (id)destinationIdentifierInMessage:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 messagePayload];
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E4F2D8D8]);
    v10 = v9;
    if (v9)
    {
      if (([v9 isEqualToString:*MEMORY[0x1E4F2D8E0]] & 1) == 0)
      {
        unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
        v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          os_log_type_t v22 = (void *)MEMORY[0x1D9452090]();
          int v23 = self;
          v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            __int16 v25 = HMFGetLogIdentifier();
            int v27 = 138543874;
            int v28 = v25;
            __int16 v29 = 2112;
            id v30 = v10;
            __int16 v31 = 2112;
            id v32 = v6;
            _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse destination identifier: %@ message: %@", (uint8_t *)&v27, 0x20u);
          }
          if (a4)
          {
            *a4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          }
        }

        goto LABEL_21;
      }
    }
    else
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      uint64_t v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        int v27 = 138543618;
        int v28 = v21;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination identifier from message: %@", (uint8_t *)&v27, 0x16u);
      }
      if (a4)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

        goto LABEL_22;
      }
    }
    v12 = 0;
    goto LABEL_21;
  }
  v14 = (void *)MEMORY[0x1D9452090]();
  int v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    int v27 = 138543618;
    int v28 = v17;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v27, 0x16u);
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (void)notifyUpdatedDestinationWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying updated destination with identifier: %@", buf, 0x16u);
  }
  v9 = [(HMDMessageHandler *)v6 messageTargetUUID];
  v14[1] = @"HMDMediaDestinationIdentifierNotificationKey";
  v15[0] = v9;
  v10 = v4;
  if (!v4)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F29128]);
    v10 = (void *)[v11 initWithUUIDString:*MEMORY[0x1E4F2D8E0]];
  }
  v15[1] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  if (!v4) {

  }
  id v13 = [(HMDMessageHandler *)v6 notificationCenter];
  [v13 postNotificationName:@"HMDMediaDestinationControllerUpdatedDestinationNotification" object:v6 userInfo:v12];
}

- (HMDMediaDestinationControllerMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 metricsEventDispatcher:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  BOOL v10 = a7;
  v29[7] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  if (!v17) {
    goto LABEL_12;
  }
  v21 = v20;
  if (v10)
  {
    v29[0] = *MEMORY[0x1E4F2D900];
    v29[1] = @"HMDHomeAccessoryRemovedNotification";
    v29[2] = @"HMDMediaSystemAddedNotification";
    v29[3] = @"HMDMediaSystemRemovedNotification";
    v29[4] = @"HMDNotificationAccessoryChangedRoom";
    v29[5] = @"HMDMediaDestinationControllerUpdatedDestinationNotification";
    v29[6] = @"HMDMediaGroupsAggregateConsumerUpdatedAggregateDataNotification";
    os_log_type_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:7];
  }
  else
  {
    os_log_type_t v22 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v28 = *MEMORY[0x1E4F2D8C0];
  int v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v27.receiver = self;
  v27.super_class = (Class)HMDMediaDestinationControllerMessageHandler;
  v24 = [(HMDAppleMediaAccessoryMessageHandler *)&v27 initWithMessageTargetUUID:v15 messageDispatcher:v16 notificationCenter:v17 ownerPrivateRemoteMessages:MEMORY[0x1E4F1CBF0] adminPrivateRemoteMessages:v23 internalMessages:MEMORY[0x1E4F1CBF0] notifications:v22 notificationsToObject:MEMORY[0x1E4F1CC08]];
  __int16 v25 = v24;
  if (v24)
  {
    objc_storeWeak((id *)&v24->_dataSource, v19);
    objc_storeWeak((id *)&v25->_delegate, v21);
    objc_storeStrong((id *)&v25->_metricsEventDispatcher, a6);
  }

  return v25;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_158780 != -1) {
    dispatch_once(&logCategory__hmf_once_t34_158780, &__block_literal_global_158781);
  }
  v2 = (void *)logCategory__hmf_once_v35_158782;
  return v2;
}

uint64_t __58__HMDMediaDestinationControllerMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v35_158782;
  logCategory__hmf_once_v35_158782 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end