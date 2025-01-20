@interface HMDAccessorySettingsMessageHandler
+ (id)logCategory;
+ (id)messageBindingsForDispatcher:(id)a3;
- (BOOL)_decodeUpdateValueMessagePayload:(id)a3 outValue:(id *)a4;
- (BOOL)processReplaceConstraintMessage:(id)a3 outConstraintsToAdd:(id *)a4 outConstraintIdsToRemove:(id *)a5;
- (HMDAccessorySettingsMessageController)messageController;
- (HMDAccessorySettingsMessageHandler)initWithQueue:(id)a3 delegate:(id)a4;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (void)_handleAddConstraint:(id)a3;
- (void)_handleRemoveConstraint:(id)a3;
- (void)_handleReplaceConstraints:(id)a3;
- (void)_handleReplaceConstraintsForKeyPath:(id)a3;
- (void)_handleSettingUpdateValue:(id)a3;
- (void)_handleSettingUpdateValueByKeyPath:(id)a3;
- (void)_handleUpdatedConstraints:(id)a3;
- (void)relayReplaceConstraints:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 destination:(id)a6 completion:(id)a7;
- (void)relayUpdateValue:(id)a3 keyPath:(id)a4 destination:(id)a5 completion:(id)a6;
- (void)setMessageDispatcher:(id)a3;
@end

@implementation HMDAccessorySettingsMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_messageController);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAccessorySettingsMessageController)messageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageController);
  return (HMDAccessorySettingsMessageController *)WeakRetained;
}

- (void)relayReplaceConstraints:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 destination:(id)a6 completion:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v29 = a4;
  id v30 = a5;
  id v13 = a6;
  id v14 = a7;
  v28 = v12;
  if (v13)
  {
    v15 = [MEMORY[0x263F0E908] _encodedConstraintsToAdd:v12];
    v27 = objc_msgSend(v29, "na_map:", &__block_literal_global_46_265612);
    v16 = [MEMORY[0x263F0E908] _replaceConstraintsPayloadWithAdditions:v15 removals:v27 keyPath:v30];
    v17 = +[HMDRemoteMessage secureMessageWithName:*MEMORY[0x263F0B580] qualityOfService:25 destination:v13 messagePayload:v16];
    objc_initWeak(&location, self);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2;
    v31[3] = &unk_264A2EAE0;
    objc_copyWeak(&v33, &location);
    id v32 = v14;
    v18 = (void *)MEMORY[0x230FBD990]([v17 setResponseHandler:v31]);
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v21;
      __int16 v37 = 2112;
      v38 = v17;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Relaying replace constraints message. %@", buf, 0x16u);
    }
    v22 = [(HMDAccessorySettingsMessageHandler *)v19 messageDispatcher];
    [v22 sendMessage:v17 completionHandler:0];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);
    }
    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
    (*((void (**)(id, void *))v14 + 2))(v14, v15);
  }
}

void __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    v6 = [WeakRetained workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3;
    v7[3] = &unk_264A2F870;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __115__HMDAccessorySettingsMessageHandler_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (void)relayUpdateValue:(id)a3 keyPath:(id)a4 destination:(id)a5 completion:(id)a6
{
  v38[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v27 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void (**)(void, void, void, void))v12;
  if (v11)
  {
    uint64_t v37 = *MEMORY[0x263F0B5A8];
    id v14 = v10;
    if (!v10)
    {
      id v14 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v27);
    }
    v15 = encodeRootObject();
    v38[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];

    if (!v10) {
    v17 = +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", *MEMORY[0x263F0B598], 25, v11, v16, v27);
    }
    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke;
    v29[3] = &unk_264A2EAE0;
    objc_copyWeak(&v31, &location);
    id v30 = v13;
    v18 = (void *)MEMORY[0x230FBD990]([v17 setResponseHandler:v29]);
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v21;
      __int16 v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Relaying update value message. %@", buf, 0x16u);
    }
    v22 = [(HMDAccessorySettingsMessageHandler *)v19 messageDispatcher];
    [v22 sendMessage:v17 completionHandler:0];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990](v12);
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);
    }
    v16 = objc_msgSend(MEMORY[0x263F087E8], "hmErrorWithCode:", 54, v27);
    ((void (**)(void, void, void, void *))v13)[2](v13, 0, 0, v16);
  }
}

void __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    v7 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke_2;
    block[3] = &unk_264A2EE80;
    block[4] = v6;
    id v9 = v4;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
}

void __86__HMDAccessorySettingsMessageHandler_relayUpdateValue_keyPath_destination_completion___block_invoke_2(uint64_t a1)
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
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode response %@ of relayed update value message.", buf, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v7);
  }
}

- (void)_handleReplaceConstraintsForKeyPath:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 messagePayload];
  uint64_t v6 = objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x263F0D8E0]);

  if (v6)
  {
    v7 = [(HMDAccessorySettingsMessageHandler *)self messageController];
    if (![v4 isRemote])
    {
LABEL_7:
      id v26 = 0;
      id v27 = 0;
      BOOL v11 = [(HMDAccessorySettingsMessageHandler *)self processReplaceConstraintMessage:v4 outConstraintsToAdd:&v27 outConstraintIdsToRemove:&v26];
      id v12 = v27;
      id v13 = v26;
      if (v11)
      {
        id v14 = [v4 remoteSourceDevice];
        v15 = [v14 productInfo];
        uint64_t v16 = [v15 productClass];
        uint64_t v17 = [v4 isRemote];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __74__HMDAccessorySettingsMessageHandler__handleReplaceConstraintsForKeyPath___block_invoke;
        v24[3] = &unk_264A2F3E8;
        id v25 = v4;
        [v7 onMessageReplaceConstraintsWithAdditions:v12 constraintIdsToRemove:v13 keyPath:v6 senderProductClass:v16 isRemote:v17 completion:v24];
      }
      goto LABEL_15;
    }
    uint64_t v8 = [v7 home];
    if (!v8)
    {
      id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
      [v4 respondWithError:v12];
LABEL_15:

      goto LABEL_16;
    }
    id v9 = (void *)v8;
    id v10 = [v4 userForHome:v8];
    if (v10 && [v7 canUser:v10 editConstraintsForSettingWithKeyPath:v6])
    {

      goto LABEL_7;
    }
    v23 = [MEMORY[0x263F087E8] hmErrorWithCode:10];
    [v4 respondWithError:v23];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing key path from accessory settings update message: %@", buf, 0x16u);
    }
    v7 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v4 respondWithError:v7];
  }
LABEL_16:
}

uint64_t __74__HMDAccessorySettingsMessageHandler__handleReplaceConstraintsForKeyPath___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)_handleReplaceConstraints:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsMessageHandler *)self messageController];
  uint64_t v6 = [v4 destination];
  v7 = [v6 target];
  uint64_t v8 = [(HMDAccessorySettingsMessageHandler *)self messageTargetUUID];
  int v9 = [v7 isEqual:v8];

  if (!v9)
  {
    if ([v4 isRemote])
    {
      uint64_t v10 = [v5 home];
      if (!v10)
      {
        id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
        [v4 respondWithError:v17];
LABEL_13:

        goto LABEL_14;
      }
      BOOL v11 = (void *)v10;
      id v12 = [v4 userForHome:v10];
      if (!v12
        || ([v4 destination],
            id v13 = objc_claimAutoreleasedReturnValue(),
            [v13 target],
            id v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v5 canUser:v12 editConstraintsForSetting:v14],
            v14,
            v13,
            !v15))
      {
        id v25 = [MEMORY[0x263F087E8] hmErrorWithCode:10];
        [v4 respondWithError:v25];

        goto LABEL_14;
      }
    }
    id v28 = 0;
    id v29 = 0;
    BOOL v16 = [(HMDAccessorySettingsMessageHandler *)self processReplaceConstraintMessage:v4 outConstraintsToAdd:&v29 outConstraintIdsToRemove:&v28];
    id v17 = v29;
    id v18 = v28;
    if (v16)
    {
      uint64_t v19 = [v4 destination];
      v20 = [v19 target];
      v21 = [v4 remoteSourceDevice];
      v22 = [v21 productInfo];
      uint64_t v23 = [v22 productClass];
      uint64_t v24 = [v4 isRemote];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __64__HMDAccessorySettingsMessageHandler__handleReplaceConstraints___block_invoke;
      v26[3] = &unk_264A2F3E8;
      id v27 = v4;
      [v5 onMessageReplaceConstraintsWithAdditions:v17 constraintIdsToRemove:v18 settingIdentifier:v20 senderProductClass:v23 isRemote:v24 completion:v26];
    }
    goto LABEL_13;
  }
  [(HMDAccessorySettingsMessageHandler *)self _handleReplaceConstraintsForKeyPath:v4];
LABEL_14:
}

uint64_t __64__HMDAccessorySettingsMessageHandler__handleReplaceConstraints___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (BOOL)processReplaceConstraintMessage:(id)a3 outConstraintsToAdd:(id *)a4 outConstraintIdsToRemove:(id *)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = [v8 arrayForKey:*MEMORY[0x263F0B528]];
  if (v10)
  {
    if (objc_msgSend(v10, "hmf_objectsAreKindOfClass:", objc_opt_class()))
    {
      v50 = a4;
      v51 = a5;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v54 != v14) {
              objc_enumerationMutation(v11);
            }
            BOOL v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v53 + 1) + 8 * i)];
            [v9 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v13);
      }

      id v17 = [v8 dataForKey:*MEMORY[0x263F0B518]];
      if (v17)
      {
        id v18 = (void *)MEMORY[0x263F08928];
        uint64_t v19 = (void *)MEMORY[0x263EFFA08];
        v57[0] = objc_opt_class();
        v57[1] = objc_opt_class();
        v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
        v21 = [v19 setWithArray:v20];
        id v52 = 0;
        v22 = [v18 unarchivedObjectOfClasses:v21 fromData:v17 error:&v52];
        id v23 = v52;

        id v24 = v22;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v25 = v24;
        }
        else {
          id v25 = 0;
        }
        id v26 = v25;

        if (v26)
        {

          id *v50 = v26;
          id *v51 = (id)[v9 copy];
          BOOL v27 = 1;
          id v23 = v24;
LABEL_30:

          goto LABEL_31;
        }
        v44 = (void *)MEMORY[0x230FBD990]();
        v45 = self;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v47 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v60 = v47;
          __int16 v61 = 2112;
          id v62 = v23;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive accessory setting constraint from constraints to add data: %@", buf, 0x16u);
        }
        v48 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
        [v8 respondWithError:v48];
      }
      else
      {
        uint64_t v39 = (void *)MEMORY[0x230FBD990]();
        v40 = self;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = HMFGetLogIdentifier();
          v43 = [v8 messagePayload];
          *(_DWORD *)buf = 138543618;
          v60 = v42;
          __int16 v61 = 2112;
          id v62 = v43;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Missing serialized constraints to add in message payload: %@", buf, 0x16u);
        }
        id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        [v8 respondWithError:v23];
      }
      BOOL v27 = 0;
      goto LABEL_30;
    }
    __int16 v35 = (void *)MEMORY[0x230FBD990]();
    v36 = self;
    uint64_t v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v60 = v38;
      __int16 v61 = 2112;
      id v62 = v10;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Invalid constraints classes: %@", buf, 0x16u);
    }
    id v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = 43;
  }
  else
  {
    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = self;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = HMFGetLogIdentifier();
      uint64_t v32 = [v8 messagePayload];
      *(_DWORD *)buf = 138543618;
      v60 = v31;
      __int16 v61 = 2112;
      id v62 = v32;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Missing constraints to remove in message payload: %@", buf, 0x16u);
    }
    id v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = 3;
  }
  id v17 = [v33 hmErrorWithCode:v34];
  [v8 respondWithError:v17];
  BOOL v27 = 0;
LABEL_31:

  return v27;
}

- (void)_handleUpdatedConstraints:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 dataForKey:*MEMORY[0x263F0B520]];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263F08928];
    v7 = (void *)MEMORY[0x263EFFA08];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    int v9 = [v7 setWithArray:v8];
    id v34 = 0;
    uint64_t v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:&v34];
    id v11 = v34;

    id v12 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      int v15 = [v4 messagePayload];
      BOOL v16 = objc_msgSend(v15, "hmf_stringForKey:", *MEMORY[0x263F0D8E0]);

      if (v16)
      {
        id v17 = [(HMDAccessorySettingsMessageHandler *)self messageController];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __64__HMDAccessorySettingsMessageHandler__handleUpdatedConstraints___block_invoke;
        v32[3] = &unk_264A2F3E8;
        id v33 = v4;
        [v17 onMessageUpdateConstraints:v14 keyPath:v16 completion:v32];

        id v18 = v33;
      }
      else
      {
        id v28 = (void *)MEMORY[0x230FBD990]();
        id v29 = self;
        __int16 v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v37 = v31;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Missing key path in message payload", buf, 0xCu);
        }
        id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [v4 respondWithError:v18];
      }
    }
    else
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = self;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        BOOL v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v27;
        __int16 v38 = 2112;
        id v39 = v11;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive accessory setting constraint from constraints data: %@", buf, 0x16u);
      }
      BOOL v16 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
      [v4 respondWithError:v16];
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      id v23 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v22;
      __int16 v38 = 2112;
      id v39 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Missing serialized constraints in message payload: %@", buf, 0x16u);
    }
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Constraint not found" reason:@"Missing serialized constraint in update message" suggestion:0];
    [v4 respondWithError:v11];
  }
}

uint64_t __64__HMDAccessorySettingsMessageHandler__handleUpdatedConstraints___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)_handleRemoveConstraint:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 dataForKey:*MEMORY[0x263F0B520]];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08928] deserializeObjectWithData:v5 allowedClass:objc_opt_class() frameworkClasses:MEMORY[0x263EFFA68]];
    if (v6)
    {
      v7 = [v4 messagePayload];
      id v8 = objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x263F0D8E0]);

      if (v8)
      {
        int v9 = [(HMDAccessorySettingsMessageHandler *)self messageController];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __62__HMDAccessorySettingsMessageHandler__handleRemoveConstraint___block_invoke;
        v24[3] = &unk_264A2F3E8;
        id v25 = v4;
        [v9 onMessageRemoveConstraint:v6 keyPath:v8 completion:v24];

        uint64_t v10 = v25;
      }
      else
      {
        v20 = (void *)MEMORY[0x230FBD990]();
        v21 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          BOOL v27 = v23;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing key path in message payload", buf, 0xCu);
        }
        uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [v4 respondWithError:v10];
      }
    }
    else
    {
      BOOL v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        BOOL v27 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid constraint in message payload", buf, 0xCu);
      }
      id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
      [v4 respondWithError:v8];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      BOOL v27 = v14;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized constraint in message payload: %@", buf, 0x16u);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Constraint not found" reason:@"Missing serialized constraint in remove message" suggestion:0];
    [v4 respondWithError:v6];
  }
}

uint64_t __62__HMDAccessorySettingsMessageHandler__handleRemoveConstraint___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)_handleAddConstraint:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 dataForKey:*MEMORY[0x263F0B520]];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08928] deserializeObjectWithData:v5 allowedClass:objc_opt_class() frameworkClasses:MEMORY[0x263EFFA68]];
    if (v6)
    {
      v7 = [v4 messagePayload];
      id v8 = objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x263F0D8E0]);

      if (v8)
      {
        int v9 = [(HMDAccessorySettingsMessageHandler *)self messageController];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __59__HMDAccessorySettingsMessageHandler__handleAddConstraint___block_invoke;
        v24[3] = &unk_264A2F3E8;
        id v25 = v4;
        [v9 onMessageAddConstraint:v6 keyPath:v8 completion:v24];

        uint64_t v10 = v25;
      }
      else
      {
        v20 = (void *)MEMORY[0x230FBD990]();
        v21 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          BOOL v27 = v23;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing key path in message payload", buf, 0xCu);
        }
        uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
        [v4 respondWithError:v10];
      }
    }
    else
    {
      BOOL v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        BOOL v27 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid constraint in message payload", buf, 0xCu);
      }
      id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
      [v4 respondWithError:v8];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      BOOL v27 = v14;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized constraint in message payload: %@", buf, 0x16u);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Constraint not found" reason:@"Missing serialized constraint in add message" suggestion:0];
    [v4 respondWithError:v6];
  }
}

uint64_t __59__HMDAccessorySettingsMessageHandler__handleAddConstraint___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)_handleSettingUpdateValueByKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 messagePayload];
  id v21 = 0;
  BOOL v6 = [(HMDAccessorySettingsMessageHandler *)self _decodeUpdateValueMessagePayload:v5 outValue:&v21];
  id v7 = v21;

  if (v6)
  {
    id v8 = [v4 messagePayload];
    int v9 = objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x263F0D8E0]);

    if (v9)
    {
      uint64_t v10 = [(HMDAccessorySettingsMessageHandler *)self messageController];
      id v11 = [v4 remoteSourceDevice];
      id v12 = [v11 version];
      uint64_t v13 = [v4 remoteSourceDevice];
      id v14 = [v13 productInfo];
      uint64_t v15 = [v14 productClass];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __73__HMDAccessorySettingsMessageHandler__handleSettingUpdateValueByKeyPath___block_invoke;
      v18[3] = &unk_264A2EAB8;
      v18[4] = self;
      id v16 = v9;
      id v19 = v16;
      id v20 = v4;
      [v10 onMessageUpdateValue:v7 settingKeyPath:v16 senderVersion:v12 senderProductClass:v15 completion:v18];
    }
    else
    {
      id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      [v4 respondWithError:v17];

      id v16 = 0;
    }
  }
  else
  {
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v16];
  }
}

void __73__HMDAccessorySettingsMessageHandler__handleSettingUpdateValueByKeyPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v30[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    [*(id *)(a1 + 48) respondWithError:v8];
  }
  else
  {
    v29[0] = *MEMORY[0x263F0B5A8];
    int v9 = v7;
    if (!v7)
    {
      int v9 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v10 = encodeRootObject();
    v29[1] = @"cv";
    v30[0] = v10;
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    v30[1] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

    if (!v7) {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    }
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      id v18 = [NSNumber numberWithUnsignedInteger:a3];
      int v19 = 138544386;
      id v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v18;
      __int16 v27 = 2112;
      uint64_t v28 = 0;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding to the original update value request for target %@ with value: %@, configNum: %@, error: %@", (uint8_t *)&v19, 0x34u);
    }
    [*(id *)(a1 + 48) respondWithPayload:v12];
  }
}

- (void)_handleSettingUpdateValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySettingsMessageHandler *)self messageController];
  BOOL v6 = [v4 destination];
  id v7 = [v6 target];
  id v8 = [(HMDAccessorySettingsMessageHandler *)self messageTargetUUID];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    [(HMDAccessorySettingsMessageHandler *)self _handleSettingUpdateValueByKeyPath:v4];
  }
  else
  {
    uint64_t v10 = [v4 messagePayload];
    id v23 = 0;
    BOOL v11 = [(HMDAccessorySettingsMessageHandler *)self _decodeUpdateValueMessagePayload:v10 outValue:&v23];
    id v12 = v23;

    if (v11)
    {
      id v20 = [v4 destination];
      uint64_t v13 = [v20 target];
      id v14 = [v4 remoteSourceDevice];
      uint64_t v15 = [v14 version];
      id v16 = [v4 remoteSourceDevice];
      uint64_t v17 = [v16 productInfo];
      uint64_t v18 = [v17 productClass];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__HMDAccessorySettingsMessageHandler__handleSettingUpdateValue___block_invoke;
      v21[3] = &unk_264A2EA90;
      v21[4] = self;
      id v22 = v4;
      [v5 onMessageUpdateValue:v12 settingIdentifier:v13 senderVersion:v15 senderProductClass:v18 completion:v21];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v19];

      id v12 = (id)v19;
    }
  }
}

void __64__HMDAccessorySettingsMessageHandler__handleSettingUpdateValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v33[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    [*(id *)(a1 + 40) respondWithError:v8];
  }
  else
  {
    v32[0] = *MEMORY[0x263F0B5A8];
    int v9 = v7;
    if (!v7)
    {
      int v9 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v10 = encodeRootObject();
    v32[1] = @"cv";
    v33[0] = v10;
    BOOL v11 = [NSNumber numberWithUnsignedInteger:a3];
    v33[1] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

    if (!v7) {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    }
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v20 = [*(id *)(a1 + 40) destination];
      [v20 target];
      uint64_t v17 = v21 = v13;
      uint64_t v18 = [v17 UUIDString];
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138544386;
      id v23 = v16;
      __int16 v24 = 2112;
      __int16 v25 = v18;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding to the original update value request for target %@ with value: %@, configNum: %@, error: %@", buf, 0x34u);

      uint64_t v13 = v21;
    }

    [*(id *)(a1 + 40) respondWithPayload:v12];
  }
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDAccessorySettingsMessageHandler *)self messageController];
  uint64_t v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (BOOL)_decodeUpdateValueMessagePayload:(id)a3 outValue:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x263F0B5A8]);
  if (v7)
  {
    id v22 = 0;
    id v8 = +[HMDAccessorySetting decodedValue:v7 error:&v22];
    id v9 = v22;
    BOOL v10 = v8 != 0;
    if (v8)
    {
      BOOL v11 = [MEMORY[0x263EFF9D0] null];

      if (v8 == v11)
      {

        id v8 = 0;
      }
      id v12 = v8;
      *a4 = v12;
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v24 = v20;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting supported value from value data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v16;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized value from payload: %@", buf, 0x16u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (HMDAccessorySettingsMessageHandler)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessorySettingsMessageHandler;
  id v9 = [(HMDAccessorySettingsMessageHandler *)&v12 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeWeak((id *)&v10->_messageController, v8);
  }

  return v10;
}

+ (id)messageBindingsForDispatcher:(id)a3
{
  v29[3] = *MEMORY[0x263EF8340];
  id v26 = +[HMDUserMessagePolicy userMessagePolicyWithUserPrivilege:4 remoteAccessRequired:0];
  uint64_t v3 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v29[0] = v3;
  id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v29[1] = v4;
  void v29[2] = v26;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];

  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  __int16 v28 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];

  __int16 v25 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  id v23 = v5;
  __int16 v24 = [v5 arrayByAddingObject:v25];
  id v22 = HMF_MESSAGE_BINDING();
  v27[0] = v22;
  __int16 v21 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:5];
  id v20 = [v5 arrayByAddingObject:v21];
  uint64_t v19 = HMF_MESSAGE_BINDING();
  v27[1] = v19;
  id v8 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:1];
  id v9 = [v7 arrayByAddingObject:v8];
  BOOL v10 = HMF_MESSAGE_BINDING();
  v27[2] = v10;
  BOOL v11 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
  objc_super v12 = [v7 arrayByAddingObject:v11];
  uint64_t v13 = HMF_MESSAGE_BINDING();
  v27[3] = v13;
  id v14 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  uint64_t v15 = [v7 arrayByAddingObject:v14];
  id v16 = HMF_MESSAGE_BINDING();
  v27[4] = v16;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:5];

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_265680 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_265680, &__block_literal_global_265681);
  }
  v2 = (void *)logCategory__hmf_once_v1_265682;
  return v2;
}

void __49__HMDAccessorySettingsMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_265682;
  logCategory__hmf_once_v1_265682 = v0;
}

@end