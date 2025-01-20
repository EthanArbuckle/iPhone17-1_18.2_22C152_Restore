@interface HMDAccessorySettingsMessageHandlerRoar
- (void)relayReplaceConstraints:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 destination:(id)a6 completion:(id)a7;
- (void)relayUpdateValue:(id)a3 keyPath:(id)a4 destination:(id)a5 completion:(id)a6;
@end

@implementation HMDAccessorySettingsMessageHandlerRoar

- (void)relayReplaceConstraints:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 destination:(id)a6 completion:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v33 = a4;
  id v34 = a5;
  id v13 = a6;
  id v14 = a7;
  v32 = v12;
  if (v13)
  {
    v15 = [MEMORY[0x263F0E908] _encodedConstraintsToAdd:v12];
    v31 = objc_msgSend(v33, "na_map:", &__block_literal_global_122305);
    v30 = [MEMORY[0x263F0E908] _replaceConstraintsPayloadWithAdditions:v15 removals:v31 keyPath:v34];
    v16 = [HMDRemoteDeviceMessageDestination alloc];
    v17 = [(HMDAccessorySettingsMessageHandler *)self messageTargetUUID];
    v18 = [v13 device];
    v19 = [(HMDRemoteDeviceMessageDestination *)v16 initWithTarget:v17 device:v18];

    v20 = +[HMDRemoteMessage secureMessageWithName:*MEMORY[0x263F0B580] qualityOfService:25 destination:v19 messagePayload:v30];
    objc_initWeak(&location, self);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2;
    v35[3] = &unk_264A2EAE0;
    objc_copyWeak(&v37, &location);
    id v36 = v14;
    v21 = (void *)MEMORY[0x230FBD990]([v20 setResponseHandler:v35]);
    v22 = self;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v24;
      __int16 v41 = 2112;
      v42 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Relaying key path targeted replace constraints message. %@", buf, 0x16u);
    }
    v25 = [(HMDAccessorySettingsMessageHandler *)v22 messageDispatcher];
    [v25 sendMessage:v20 completionHandler:0];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v40 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);
    }
    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
    (*((void (**)(id, void *))v14 + 2))(v14, v15);
  }
}

void __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    v6 = [WeakRetained workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3;
    v7[3] = &unk_264A2F870;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (void)relayUpdateValue:(id)a3 keyPath:(id)a4 destination:(id)a5 completion:(id)a6
{
  v43[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v32 = v11;
  id v33 = a6;
  if (v12)
  {
    uint64_t v13 = *MEMORY[0x263F0D8E0];
    v43[0] = v11;
    uint64_t v14 = *MEMORY[0x263F0B5A8];
    v42[0] = v13;
    v42[1] = v14;
    v15 = v10;
    if (!v10)
    {
      v15 = [MEMORY[0x263EFF9D0] null];
    }
    v16 = encodeRootObject();
    v43[1] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];

    if (!v10) {
    v18 = [HMDRemoteDeviceMessageDestination alloc];
    }
    v19 = [(HMDAccessorySettingsMessageHandler *)self messageTargetUUID];
    v20 = [v12 device];
    v21 = [(HMDRemoteDeviceMessageDestination *)v18 initWithTarget:v19 device:v20];

    v22 = +[HMDRemoteMessage secureMessageWithName:*MEMORY[0x263F0B598] qualityOfService:25 destination:v21 messagePayload:v17];
    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke;
    v34[3] = &unk_264A2EAE0;
    objc_copyWeak(&v36, &location);
    id v35 = v33;
    v23 = (void *)MEMORY[0x230FBD990]([v22 setResponseHandler:v34]);
    v24 = self;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v26;
      __int16 v40 = 2112;
      __int16 v41 = v22;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Relaying key path targeted update value message. %@", buf, 0x16u);
    }
    v27 = [(HMDAccessorySettingsMessageHandler *)v24 messageDispatcher];
    [v27 sendMessage:v22 completionHandler:0];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  else
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);
    }
    v17 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
    (*((void (**)(id, void, void, void *))v33 + 2))(v33, 0, 0, v17);
  }
}

void __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    v7 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke_2;
    block[3] = &unk_264A2EE80;
    block[4] = v6;
    id v9 = v4;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
}

void __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v14 = 0;
  int v4 = [v2 _decodeUpdateValueMessagePayload:v3 outValue:&v14];
  id v5 = v14;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    v7 = objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", @"cv");
    (*(void (**)(uint64_t, id, uint64_t, void))(v6 + 16))(v6, v5, [v7 unsignedIntegerValue], 0);
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode response %@ of relayed key path targeted update value message.", buf, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v7);
  }
}

@end