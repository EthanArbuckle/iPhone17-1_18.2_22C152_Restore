@interface HMDMediaDestinationsMessageHandler
- (HMDMediaDestinationsMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7;
- (HMDMediaDestinationsMessageHandlerDataSource)dataSource;
- (HMDMediaDestinationsMessageHandlerDelegate)delegate;
- (void)handleMediaDestinationUpdatedNotification:(id)a3;
- (void)handleUpdatedDestination:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDMediaDestinationsMessageHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationsMessageHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationsMessageHandlerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaDestinationsMessageHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaDestinationsMessageHandlerDataSource *)WeakRetained;
}

- (void)handleUpdatedDestination:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDMediaDestinationsMessageHandler;
  id v4 = a3;
  [(HMDMediaDestinationMessageHandler *)&v6 handleUpdatedDestination:v4];
  uint64_t v5 = objc_msgSend(v4, "supportedOptions", v6.receiver, v6.super_class);

  if (v5)
  {
    if ([(HMDMessageHandler *)self hasQueuedIncomingMessages]) {
      [(HMDMessageHandler *)self routeQueuedIncomingMessages];
    }
  }
}

- (void)handleMediaDestinationUpdatedNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  objc_super v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v31 = 138543362;
    v32 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination updated notification", (uint8_t *)&v31, 0xCu);
  }
  v9 = [(HMDMediaDestinationsMessageHandler *)v6 delegate];
  if (v9)
  {
    v10 = [v4 object];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
      objc_opt_class();
      int v13 = objc_opt_isKindOfClass() & 1;
      if (v13) {
        v14 = v12;
      }
      else {
        v14 = 0;
      }
      id v15 = v14;

      if (v13)
      {
        v16 = [v12 uniqueIdentifier];
        v17 = [(HMDMessageHandler *)v6 messageTargetUUID];
        char v18 = objc_msgSend(v16, "hmf_isEqualToUUID:", v17);

        if ((v18 & 1) == 0) {
          [v9 mediaDestinationsMessageHandler:v6 didReceiveDestinationUpdatedNotification:v4 destination:v12];
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x1D9452090]();
        v28 = v6;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          int v31 = 138543618;
          v32 = v30;
          __int16 v33 = 2112;
          id v34 = v4;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination from media destination updated notification: %@", (uint8_t *)&v31, 0x16u);
        }
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1D9452090]();
      v24 = v6;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        int v31 = 138543618;
        v32 = v26;
        __int16 v33 = 2112;
        id v34 = v4;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to get notification object from media destination updated notification: %@", (uint8_t *)&v31, 0x16u);
      }
      [v9 mediaDestinationsMessageHandler:v24 didReceiveDestinationUpdatedNotification:v4 destination:0];
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = v6;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle destination updated notification due to no delegate", (uint8_t *)&v31, 0xCu);
    }
  }
}

- (HMDMediaDestinationsMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v13)
  {
LABEL_6:
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v14) {
    goto LABEL_7;
  }
  v17 = v16;
  v22[0] = *MEMORY[0x1E4F2D900];
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaDestinationsMessageHandler;
  v19 = [(HMDMediaDestinationMessageHandler *)&v21 initWithDestination:v12 messageDispatcher:v13 notificationCenter:v14 notifications:v18 dataSource:v15 delegate:v17];

  return v19;
}

@end