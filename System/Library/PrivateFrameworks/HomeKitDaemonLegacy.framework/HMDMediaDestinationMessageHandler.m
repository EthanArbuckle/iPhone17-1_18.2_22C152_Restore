@interface HMDMediaDestinationMessageHandler
+ (id)logCategory;
- (HMDMediaDestinationMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7;
- (HMDMediaDestinationMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 notifications:(id)a6 dataSource:(id)a7 delegate:(id)a8;
- (HMDMediaDestinationMessageHandlerDataSource)dataSource;
- (HMDMediaDestinationMessageHandlerDelegate)delegate;
- (id)audioGroupIdentifierInMessage:(id)a3 error:(id *)a4;
- (unint64_t)supportedOptionsInMessage:(id)a3 error:(id *)a4;
- (void)handleMediaDestinationUpdateAudioGroupIdentifierRequestMessage:(id)a3;
- (void)handleMediaDestinationUpdateSupportedOptionsRequestMessage:(id)a3;
- (void)handleUpdatedDestination:(id)a3;
- (void)sendRequestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4;
- (void)sendRequestToUpdateSupportOptions:(unint64_t)a3 completion:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDMediaDestinationMessageHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationMessageHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationMessageHandlerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaDestinationMessageHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaDestinationMessageHandlerDataSource *)WeakRetained;
}

- (void)handleMediaDestinationUpdateSupportedOptionsRequestMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v30 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update destination supported options request message", buf, 0xCu);
  }
  v9 = [v4 responseHandler];

  if (!v9)
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = v6;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response handler from update destination supported options request message: %@", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    goto LABEL_11;
  }
  id v28 = 0;
  uint64_t v10 = [(HMDMediaDestinationMessageHandler *)v6 supportedOptionsInMessage:v4 error:&v28];
  id v11 = v28;
  if (v11)
  {
    v12 = v11;
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get supported options from update destination supported options request message: %@", buf, 0x16u);
    }
LABEL_11:
    [v4 respondWithError:v12];
    goto LABEL_18;
  }
  v21 = [(HMDMediaDestinationMessageHandler *)v6 delegate];
  v22 = v21;
  if (v21)
  {
    [v21 mediaDestinationMessageHandler:v6 didReceiveUpdateSupportedOptionsRequestMessage:v4 supportOptions:v10];
  }
  else
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = v6;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to update supported options due to no delegate", buf, 0xCu);
    }
    v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v27];
  }
  v12 = 0;
LABEL_18:
}

- (void)handleMediaDestinationUpdateAudioGroupIdentifierRequestMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v29 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update destination audio group identifier request message", buf, 0xCu);
  }
  v9 = [v4 responseHandler];

  if (v9)
  {
    id v27 = 0;
    uint64_t v10 = [(HMDMediaDestinationMessageHandler *)v6 audioGroupIdentifierInMessage:v4 error:&v27];
    id v11 = v27;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = v6;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        __int16 v30 = 2112;
        id v31 = v4;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio group identifier from update audio group identifier request message: %@", buf, 0x16u);
      }
      [v4 respondWithError:v11];
    }
    else
    {
      v20 = [(HMDMediaDestinationMessageHandler *)v6 delegate];
      v21 = v20;
      if (v20)
      {
        [v20 mediaDestinationMessageHandler:v6 didReceiveUpdateAudioGroupIdentifierRequestMessage:v4 audioGroupIdentifier:v10];
      }
      else
      {
        v22 = (void *)MEMORY[0x1D9452090]();
        v23 = v6;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v29 = v25;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to update audio group identifier due to no delegate", buf, 0xCu);
        }
        v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        [v4 respondWithError:v26];
      }
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = v6;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response handler from update destination audio group identifier request message: %@", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v11];
  }
}

- (unint64_t)supportedOptionsInMessage:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 messagePayload];
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "hmf_numberForKey:", *MEMORY[0x1E4F2D8E8]);
    uint64_t v10 = v9;
    if (v9)
    {
      unint64_t v11 = [v9 unsignedIntegerValue];
    }
    else
    {
      v16 = (void *)MEMORY[0x1D9452090]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v19;
        __int16 v23 = 2112;
        id v24 = v8;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get supported options from message payload: %@", (uint8_t *)&v21, 0x16u);
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
    }
  }
  else if (a4)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v21, 0x16u);
    }
    [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    unint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)audioGroupIdentifierInMessage:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 messagePayload];
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E4F2D8B8]);
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 isEqualToString:*MEMORY[0x1E4F2D8E0]]) {
        goto LABEL_16;
      }
      unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      if (v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        if (a4)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
          unint64_t v11 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
LABEL_16:
        unint64_t v11 = 0;
        goto LABEL_17;
      }
      v15 = HMFGetLogIdentifier();
      int v22 = 138543618;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      v16 = "%{public}@Failed to parse audio group identifier from message payload: %@";
    }
    else
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      v15 = HMFGetLogIdentifier();
      int v22 = 138543618;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      v16 = "%{public}@Failed to get audio group identifier from message payload: %@";
    }
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v22, 0x16u);

    goto LABEL_14;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v22 = 138543618;
      __int16 v23 = v20;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v22, 0x16u);
    }
    [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    unint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_18:

  return v11;
}

- (void)handleUpdatedDestination:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    unint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling updated destination: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = [(HMDMessageHandler *)v6 notificationCenter];
  [v9 postNotificationName:*MEMORY[0x1E4F2D900] object:v4];
}

- (void)sendRequestToUpdateSupportOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    unint64_t v11 = HMMediaDestinationSupportOptionsAsString();
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v10;
    __int16 v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending request to update destination support options: %@", buf, 0x16u);
  }
  if (v6)
  {
    uint64_t v30 = *MEMORY[0x1E4F2D8E8];
    __int16 v12 = [NSNumber numberWithUnsignedInteger:a3];
    id v31 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];

    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    v15 = [(HMDMessageHandler *)v8 messageTargetUUID];
    v16 = (void *)[v14 initWithTarget:v15];

    id v17 = objc_alloc(MEMORY[0x1E4F654B0]);
    v18 = (void *)[v17 initWithName:*MEMORY[0x1E4F2D8F8] destination:v16 payload:v13];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __82__HMDMediaDestinationMessageHandler_sendRequestToUpdateSupportOptions_completion___block_invoke;
    id v27 = &unk_1E6A16B58;
    id v28 = v8;
    id v29 = v6;
    [v18 setResponseHandler:&v24];
    v19 = objc_msgSend(v18, "copy", v24, v25, v26, v27, v28);
    [(HMDMessageHandler *)v8 routeMessage:v19];
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    int v21 = v8;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to set completion to update support options", buf, 0xCu);
    }
  }
}

void __82__HMDMediaDestinationMessageHandler_sendRequestToUpdateSupportOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Update destination supported options request message responded with error: %@", (uint8_t *)&v12, 0x16u);
    }
    unint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    unint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

- (void)sendRequestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v11;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending request to update audio group identifier: %@", buf, 0x16u);
  }
  if (v7)
  {
    uint64_t v32 = *MEMORY[0x1E4F2D8B8];
    uint64_t v12 = [v6 UUIDString];
    id v13 = (void *)v12;
    uint64_t v14 = *MEMORY[0x1E4F2D8E0];
    if (v12) {
      uint64_t v14 = v12;
    }
    uint64_t v33 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

    id v16 = objc_alloc(MEMORY[0x1E4F65488]);
    id v17 = [(HMDMessageHandler *)v9 messageTargetUUID];
    v18 = (void *)[v16 initWithTarget:v17];

    id v19 = objc_alloc(MEMORY[0x1E4F654B0]);
    v20 = (void *)[v19 initWithName:*MEMORY[0x1E4F2D8F0] destination:v18 payload:v15];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __88__HMDMediaDestinationMessageHandler_sendRequestToUpdateAudioGroupIdentifier_completion___block_invoke;
    id v29 = &unk_1E6A16B58;
    uint64_t v30 = v9;
    id v31 = v7;
    [v20 setResponseHandler:&v26];
    int v21 = objc_msgSend(v20, "copy", v26, v27, v28, v29, v30);
    [(HMDMessageHandler *)v9 routeMessage:v21];
  }
  else
  {
    int v22 = (void *)MEMORY[0x1D9452090]();
    __int16 v23 = v9;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to set completion to update support options", buf, 0xCu);
    }
  }
}

void __88__HMDMediaDestinationMessageHandler_sendRequestToUpdateAudioGroupIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Update audio group identifier request message responded with error: %@", (uint8_t *)&v12, 0x16u);
    }
    unint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    unint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

- (HMDMediaDestinationMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 notifications:(id)a6 dataSource:(id)a7 delegate:(id)a8
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
LABEL_11:
    _HMFPreconditionFailure();
  }
  if (!v17) {
    goto LABEL_11;
  }
  v20 = v19;
  v28[0] = *MEMORY[0x1E4F2D8F0];
  int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  uint64_t v27 = *MEMORY[0x1E4F2D8F8];
  int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  __int16 v23 = [v14 uniqueIdentifier];
  v26.receiver = self;
  v26.super_class = (Class)HMDMediaDestinationMessageHandler;
  uint64_t v24 = [(HMDAppleMediaAccessoryMessageHandler *)&v26 initWithMessageTargetUUID:v23 messageDispatcher:v15 notificationCenter:v16 ownerPrivateRemoteMessages:MEMORY[0x1E4F1CBF0] adminPrivateRemoteMessages:v21 internalMessages:v22 notifications:v17 notificationsToObject:MEMORY[0x1E4F1CC08]];

  if (v24)
  {
    [(HMDMediaDestinationMessageHandler *)v24 setDataSource:v18];
    [(HMDMediaDestinationMessageHandler *)v24 setDelegate:v20];
  }

  return v24;
}

- (HMDMediaDestinationMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  return [(HMDMediaDestinationMessageHandler *)self initWithDestination:a3 messageDispatcher:a4 notificationCenter:a5 notifications:MEMORY[0x1E4F1CBF0] dataSource:a6 delegate:a7];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_124982 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_124982, &__block_literal_global_124983);
  }
  v2 = (void *)logCategory__hmf_once_v21_124984;
  return v2;
}

uint64_t __48__HMDMediaDestinationMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v21_124984;
  logCategory__hmf_once_v21_124984 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end