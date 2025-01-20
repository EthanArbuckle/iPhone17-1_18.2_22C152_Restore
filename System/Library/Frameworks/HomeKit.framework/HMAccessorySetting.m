@interface HMAccessorySetting
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)logCategory;
+ (id)settingForInternal:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReflected;
- (BOOL)isWritable;
- (Class)valueClass;
- (HMAccessorySetting)init;
- (HMAccessorySetting)initWithInternal:(id)a3;
- (HMAccessorySetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5;
- (HMAccessorySettingGroup)group;
- (NSString)description;
- (NSString)keyPath;
- (NSUUID)identifier;
- (_HMAccessorySetting)internal;
- (id)logIdentifier;
- (id)value;
- (unint64_t)hash;
- (void)_settingDidUpdateValue:(id)a3;
- (void)_settingWillUpdateValue:(id)a3;
- (void)logAndPostNotification:(id)a3 object:(id)a4 userInfo:(id)a5;
- (void)setGroup:(id)a3;
- (void)settingDidUpdateReflected;
- (void)updateReflected:(BOOL)a3;
- (void)updateValue:(id)a3 completionHandler:(id)a4;
@end

@implementation HMAccessorySetting

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      v9 = "%{public}@Error in updating the setting through the settings controller: %@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v15 = 138543362;
    v16 = v8;
    v9 = "%{public}@Update sent through the settings controller with no error";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v13, v14);
}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_123(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v17 = 138543874;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      id v22 = v3;
      v10 = "%{public}@Error in updating media system setting: %@, error: %@";
      os_log_type_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v11, v12, v10, (uint8_t *)&v17, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v17 = 138543618;
    id v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    v10 = "%{public}@Updated media system setting: %@";
    os_log_type_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v15, v16);
}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_124(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) properties] & 2) == 0)
  {
    id v36 = [*(id *)(a1 + 32) context];
    v2 = [v36 delegateCaller];
    uint64_t v3 = *(void *)(a1 + 72);
    v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v2 callCompletion:v3 error:v4];

LABEL_5:

    return;
  }
  id v5 = [*(id *)(a1 + 32) value];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    id v36 = [*(id *)(a1 + 32) context];
    v2 = [v36 delegateCaller];
    [v2 callCompletion:*(void *)(a1 + 72) error:0];
    goto LABEL_5;
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = encodeRootObject(v7);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
    v8 = encodeRootObject(v9);
  }
  if (*(void *)(a1 + 48))
  {
    v10 = [*(id *)(a1 + 32) messageDestination];
    if (v10)
    {
      v46[0] = @"value";
      v46[1] = @"keyPath";
      uint64_t v11 = *(void *)(a1 + 48);
      v47[0] = v8;
      v47[1] = v11;
      os_log_type_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
      uint32_t v13 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAS.uv" destination:v10 payload:v12];
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_125;
      aBlock[3] = &unk_1E5944AB8;
      id v42 = *(id *)(a1 + 56);
      objc_copyWeak(&v45, (id *)location);
      id v43 = *(id *)(a1 + 40);
      id v44 = *(id *)(a1 + 72);
      uint64_t v14 = _Block_copy(aBlock);
      uint64_t v15 = [*(id *)(a1 + 64) pendingRequests];
      uint64_t v16 = [v13 identifier];
      int v17 = _Block_copy(v14);
      [v15 addCompletionBlock:v17 forIdentifier:v16];

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_126;
      v37[3] = &unk_1E5945510;
      id v18 = v15;
      id v38 = v18;
      id v19 = v16;
      id v39 = v19;
      id v20 = v14;
      id v40 = v20;
      [v13 setResponseHandler:v37];
      __int16 v21 = [*(id *)(a1 + 64) messageDispatcher];
      [v21 sendMessage:v13 completionHandler:0];

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = *(id *)(a1 + 32);
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        uint64_t v32 = *(void *)(a1 + 32);
        uint64_t v33 = *(void *)(a1 + 48);
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = v31;
        __int16 v49 = 2112;
        uint64_t v50 = v32;
        __int16 v51 = 2112;
        uint64_t v52 = v33;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", location, 0x20u);
      }
      os_log_type_t v12 = [*(id *)(a1 + 32) context];
      uint32_t v13 = [v12 delegateCaller];
      uint64_t v34 = *(void *)(a1 + 72);
      v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      [v13 callCompletion:v34 error:v35];

      v10 = 0;
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    id v23 = *(id *)(a1 + 32);
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v25;
      __int16 v49 = 2112;
      uint64_t v50 = v26;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", location, 0x16u);
    }
    v10 = [*(id *)(a1 + 32) context];
    os_log_type_t v12 = [v10 delegateCaller];
    uint64_t v27 = *(void *)(a1 + 72);
    uint32_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v12 callCompletion:v27 error:v13];
  }
}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_125(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v3)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = WeakRetained;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updated value to: %@", (uint8_t *)&v15, 0x16u);
    }
    [v6 setValue:*(void *)(a1 + 40)];
  }
  v10 = [WeakRetained context];
  uint64_t v11 = [v10 delegateCaller];
  [v11 callCompletion:*(void *)(a1 + 48) error:v3];

  os_log_type_t v12 = [WeakRetained accessorySettings];
  uint32_t v13 = [WeakRetained delegate];
  uint64_t v14 = [v13 keyPathForSetting:WeakRetained];
  [v12 _notifyDelegateDidUpdateKeyPath:v14];
}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_126(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __43___HMAccessorySetting__handleUpdatedValue___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  id v6 = (void *)MEMORY[0x19F3A64A0]([WeakRetained setValue:v5]);
  id v7 = WeakRetained;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint32_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updated value to: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = [v7 delegate];
  [v11 _settingDidUpdateValue:v7];
}

void __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke(id *a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    v55 = v5;
    __int16 v56 = 2112;
    id v57 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Updating constraints: %@", buf, 0x16u);
  }
  id v7 = encodeRootObject(a1[5]);
  id v8 = a1[4];
  if (v7)
  {
    uint64_t v9 = [v8 delegate];
    uint64_t v10 = [v9 keyPathForSetting:a1[4]];

    if (v10)
    {
      uint64_t v11 = [a1[4] messageDestination];
      if (v11)
      {
        int v12 = (void *)MEMORY[0x1E4F654B0];
        v52[0] = @"constraint";
        v52[1] = @"keyPath";
        v53[0] = v7;
        v53[1] = v10;
        uint32_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
        __int16 v14 = [v12 messageWithName:@"HMAS.uc" destination:v11 payload:v13];

        objc_initWeak((id *)buf, a1[4]);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_117;
        aBlock[3] = &unk_1E5944AB8;
        id v48 = a1[6];
        objc_copyWeak(&v51, (id *)buf);
        id v49 = a1[5];
        id v50 = a1[8];
        uint64_t v15 = _Block_copy(aBlock);
        uint64_t v16 = [a1[7] pendingRequests];
        __int16 v17 = [v14 identifier];
        uint64_t v18 = _Block_copy(v15);
        [v16 addCompletionBlock:v18 forIdentifier:v17];

        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_118;
        id v42 = &unk_1E5944978;
        objc_copyWeak(&v46, (id *)buf);
        id v19 = v16;
        id v43 = v19;
        id v20 = v17;
        id v44 = v20;
        id v21 = v15;
        id v45 = v21;
        [v14 setResponseHandler:&v39];
        id v22 = objc_msgSend(a1[7], "messageDispatcher", v39, v40, v41, v42);
        [v22 sendMessage:v14 completionHandler:0];

        objc_destroyWeak(&v46);
        objc_destroyWeak(&v51);

        objc_destroyWeak((id *)buf);
      }
      else
      {
        v31 = (void *)MEMORY[0x19F3A64A0]();
        id v32 = a1[4];
        uint64_t v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          id v35 = a1[4];
          *(_DWORD *)buf = 138543874;
          v55 = v34;
          __int16 v56 = 2112;
          id v57 = v35;
          __int16 v58 = 2112;
          v59 = v10;
          _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", buf, 0x20u);
        }
        __int16 v14 = [a1[4] context];
        id v36 = [v14 delegateCaller];
        id v37 = a1[8];
        id v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
        [v36 callCompletion:v37 error:v38];

        uint64_t v11 = 0;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x19F3A64A0]();
      id v25 = a1[4];
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        id v28 = a1[4];
        *(_DWORD *)buf = 138543618;
        v55 = v27;
        __int16 v56 = 2112;
        id v57 = v28;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", buf, 0x16u);
      }
      uint64_t v11 = [a1[4] context];
      __int16 v14 = [v11 delegateCaller];
      id v29 = a1[8];
      v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v14 callCompletion:v29 error:v30];

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = [v8 context];
    uint64_t v11 = [v10 delegateCaller];
    id v23 = a1[8];
    __int16 v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v11 callCompletion:v23 error:v14];
  }
}

void __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (!v3) {
    [WeakRetained setConstraints:*(void *)(a1 + 40)];
  }
  if (v5)
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint32_t v13 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Got update constraints request completion", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = [v5 context];
  uint64_t v11 = [v10 delegateCaller];
  [v11 callCompletion:*(void *)(a1 + 48) error:v3];
}

void __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Got update constraints message response error:%@", (uint8_t *)&v13, 0x16u);
    }
  }
  int v12 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v12) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    id v51 = v5;
    __int16 v52 = 2112;
    uint64_t v53 = v6;
    __int16 v54 = 2112;
    v55 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing constraints, %@, with constraints, %@", buf, 0x20u);
  }
  if (objc_msgSend(*(id *)(a1 + 56), "hmf_isEmpty")
    && objc_msgSend(*(id *)(a1 + 64), "hmf_isEmpty"))
  {
    id v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 delegateCaller];
    [v9 callCompletion:*(void *)(a1 + 88) error:0];
  }
  uint64_t v39 = +[_HMAccessorySetting _encodedConstraintsToRemove:*(void *)(a1 + 40)];
  uint64_t v10 = +[_HMAccessorySetting _encodedConstraintsToAdd:*(void *)(a1 + 48)];
  uint64_t v11 = *(void **)(a1 + 32);
  if (v10)
  {
    int v12 = [v11 delegate];
    int v13 = [v12 keyPathForSetting:*(void *)(a1 + 32)];

    if (v13)
    {
      uint64_t v14 = [*(id *)(a1 + 32) messageDestination];
      if (v14)
      {
        __int16 v15 = +[_HMAccessorySetting _replaceConstraintsPayloadWithAdditions:v10 removals:v39 keyPath:v13];
        id v16 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAS.pc" destination:v14 payload:v15];
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_116;
        aBlock[3] = &unk_1E5944928;
        id v45 = *(id *)(a1 + 72);
        objc_copyWeak(&v49, (id *)buf);
        id v46 = *(id *)(a1 + 56);
        id v47 = *(id *)(a1 + 64);
        id v48 = *(id *)(a1 + 88);
        uint64_t v17 = _Block_copy(aBlock);
        uint64_t v18 = [*(id *)(a1 + 80) pendingRequests];
        id v19 = [v16 identifier];
        id v20 = _Block_copy(v17);
        [v18 addCompletionBlock:v20 forIdentifier:v19];

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_2;
        v40[3] = &unk_1E5945510;
        id v21 = v18;
        id v41 = v21;
        id v22 = v19;
        id v42 = v22;
        id v23 = v17;
        id v43 = v23;
        [v16 setResponseHandler:v40];
        v24 = [*(id *)(a1 + 80) messageDispatcher];
        [v24 sendMessage:v16 completionHandler:0];

        objc_destroyWeak(&v49);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v32 = (void *)MEMORY[0x19F3A64A0]();
        id v33 = *(id *)(a1 + 32);
        uint64_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          uint64_t v36 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          id v51 = v35;
          __int16 v52 = 2112;
          uint64_t v53 = v36;
          __int16 v54 = 2112;
          v55 = v13;
          _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", buf, 0x20u);
        }
        __int16 v15 = [*(id *)(a1 + 32) context];
        id v16 = [v15 delegateCaller];
        uint64_t v37 = *(void *)(a1 + 88);
        id v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
        [v16 callCompletion:v37 error:v38];

        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
      id v27 = *(id *)(a1 + 32);
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v51 = v29;
        __int16 v52 = 2112;
        uint64_t v53 = v30;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", buf, 0x16u);
      }
      uint64_t v14 = [*(id *)(a1 + 32) context];
      __int16 v15 = [v14 delegateCaller];
      uint64_t v31 = *(void *)(a1 + 88);
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v15 callCompletion:v31 error:v16];
    }
  }
  else
  {
    int v13 = [v11 context];
    uint64_t v14 = [v13 delegateCaller];
    uint64_t v25 = *(void *)(a1 + 88);
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v14 callCompletion:v25 error:v15];
  }
}

void __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!v3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          [WeakRetained removeConstraint:*(void *)(*((void *)&v21 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(WeakRetained, "addConstraint:", *(void *)(*((void *)&v17 + 1) + 8 * v14++), (void)v17);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
  __int16 v15 = objc_msgSend(WeakRetained, "context", (void)v17);
  id v16 = [v15 delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 56) error:v3];
}

void __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke(void **a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v2 = encodeRootObject(a1[4]);
  id v3 = a1[5];
  if (v2)
  {
    id v4 = [v3 delegate];
    id v5 = [v4 keyPathForSetting:a1[5]];

    if (v5)
    {
      uint64_t v6 = [a1[5] messageDestination];
      if (v6)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F654B0];
        v46[0] = @"constraint";
        v46[1] = @"keyPath";
        v47[0] = v2;
        v47[1] = v5;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
        uint64_t v9 = [v7 messageWithName:@"HMAS.rc" destination:v6 payload:v8];

        objc_initWeak((id *)location, a1[5]);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_114;
        aBlock[3] = &unk_1E5944AB8;
        id v42 = a1[6];
        objc_copyWeak(&v45, (id *)location);
        id v43 = a1[4];
        id v44 = a1[8];
        id v10 = _Block_copy(aBlock);
        uint64_t v11 = [a1[7] pendingRequests];
        uint64_t v12 = [v9 identifier];
        uint64_t v13 = _Block_copy(v10);
        [v11 addCompletionBlock:v13 forIdentifier:v12];

        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_2;
        v37[3] = &unk_1E5945510;
        id v14 = v11;
        id v38 = v14;
        id v15 = v12;
        id v39 = v15;
        id v16 = v10;
        id v40 = v16;
        [v9 setResponseHandler:v37];
        long long v17 = [a1[7] messageDispatcher];
        [v17 sendMessage:v9 completionHandler:0];

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)location);
      }
      else
      {
        id v29 = (void *)MEMORY[0x19F3A64A0]();
        id v30 = a1[5];
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = HMFGetLogIdentifier();
          id v33 = a1[5];
          *(_DWORD *)location = 138543874;
          *(void *)&location[4] = v32;
          __int16 v49 = 2112;
          id v50 = v33;
          __int16 v51 = 2112;
          __int16 v52 = v5;
          _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", location, 0x20u);
        }
        uint64_t v9 = [a1[5] context];
        uint64_t v34 = [v9 delegateCaller];
        id v35 = a1[8];
        uint64_t v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
        [v34 callCompletion:v35 error:v36];

        uint64_t v6 = 0;
      }
    }
    else
    {
      long long v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = a1[5];
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        uint64_t v26 = a1[5];
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v25;
        __int16 v49 = 2112;
        id v50 = v26;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", location, 0x16u);
      }
      uint64_t v6 = [a1[5] context];
      uint64_t v9 = [v6 delegateCaller];
      uint64_t v27 = a1[8];
      id v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v9 callCompletion:v27 error:v28];
    }
  }
  else
  {
    long long v18 = [v3 context];
    long long v19 = [v18 delegateCaller];
    long long v20 = a1[8];
    long long v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v19 callCompletion:v20 error:v21];
  }
}

void __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_114(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [WeakRetained removeConstraint:*(void *)(a1 + 40)];
    id WeakRetained = v8;
  }
  uint64_t v6 = [WeakRetained context];
  uint64_t v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 48) error:v4];
}

void __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __57___HMAccessorySetting_notifyDelegateOfRemovedConstraint___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138543618;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removed constraint: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed constraint: %@", (uint8_t *)&v13, 0x16u);
    }
    [v7 _setting:*(void *)(a1 + 32) didRemoveConstraint:*(void *)(a1 + 40)];
  }
}

void __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke(void **a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v2 = encodeRootObject(a1[4]);
  id v3 = a1[5];
  if (v2)
  {
    id v4 = [v3 delegate];
    id v5 = [v4 keyPathForSetting:a1[5]];

    if (v5)
    {
      uint64_t v6 = [a1[5] messageDestination];
      if (v6)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F654B0];
        v46[0] = @"constraint";
        v46[1] = @"keyPath";
        v47[0] = v2;
        v47[1] = v5;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
        id v9 = [v7 messageWithName:@"HMAS.ac" destination:v6 payload:v8];

        objc_initWeak((id *)location, a1[5]);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_109;
        aBlock[3] = &unk_1E5944AB8;
        id v42 = a1[6];
        objc_copyWeak(&v45, (id *)location);
        id v43 = a1[4];
        id v44 = a1[8];
        id v10 = _Block_copy(aBlock);
        uint64_t v11 = [a1[7] pendingRequests];
        uint64_t v12 = [v9 identifier];
        int v13 = _Block_copy(v10);
        [v11 addCompletionBlock:v13 forIdentifier:v12];

        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_2;
        v37[3] = &unk_1E5945510;
        id v14 = v11;
        id v38 = v14;
        id v15 = v12;
        id v39 = v15;
        id v16 = v10;
        id v40 = v16;
        [v9 setResponseHandler:v37];
        uint64_t v17 = [a1[7] messageDispatcher];
        [v17 sendMessage:v9 completionHandler:0];

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)location);
      }
      else
      {
        id v29 = (void *)MEMORY[0x19F3A64A0]();
        id v30 = a1[5];
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = HMFGetLogIdentifier();
          id v33 = a1[5];
          *(_DWORD *)location = 138543874;
          *(void *)&location[4] = v32;
          __int16 v49 = 2112;
          id v50 = v33;
          __int16 v51 = 2112;
          __int16 v52 = v5;
          _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", location, 0x20u);
        }
        id v9 = [a1[5] context];
        uint64_t v34 = [v9 delegateCaller];
        id v35 = a1[8];
        uint64_t v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
        [v34 callCompletion:v35 error:v36];

        uint64_t v6 = 0;
      }
    }
    else
    {
      long long v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = a1[5];
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        uint64_t v26 = a1[5];
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v25;
        __int16 v49 = 2112;
        id v50 = v26;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", location, 0x16u);
      }
      uint64_t v6 = [a1[5] context];
      id v9 = [v6 delegateCaller];
      uint64_t v27 = a1[8];
      id v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v9 callCompletion:v27 error:v28];
    }
  }
  else
  {
    long long v18 = [v3 context];
    long long v19 = [v18 delegateCaller];
    long long v20 = a1[8];
    long long v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v19 callCompletion:v20 error:v21];
  }
}

void __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_109(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [WeakRetained addConstraint:*(void *)(a1 + 40)];
    id WeakRetained = v8;
  }
  uint64_t v6 = [WeakRetained context];
  uint64_t v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 48) error:v4];
}

void __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __55___HMAccessorySetting_notifyDelegateOfAddedConstraint___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138543618;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Added constraint: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added constraint: %@", (uint8_t *)&v13, 0x16u);
    }
    [v7 _setting:*(void *)(a1 + 32) didAddConstraint:*(void *)(a1 + 40)];
  }
}

void __49___HMAccessorySetting_supportedConstraintClasses__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)supportedConstraintClasses_supportedConstraintClasses;
  supportedConstraintClasses_supportedConstraintClasses = v2;
}

void __44___HMAccessorySetting_supportedValueClasses__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  void v4[3] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)supportedValueClasses_supportedValueClasses_57300;
  supportedValueClasses_supportedValueClasses_57300 = v2;
}

uint64_t __34___HMAccessorySetting_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v64;
  logCategory__hmf_once_v64 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);

  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)setGroup:(id)a3
{
}

- (HMAccessorySettingGroup)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (HMAccessorySettingGroup *)WeakRetained;
}

- (_HMAccessorySetting)internal
{
  return (_HMAccessorySetting *)objc_getProperty(self, a2, 72, 1);
}

- (id)logIdentifier
{
  id v3 = NSString;
  id v4 = [(HMAccessorySetting *)self keyPath];
  id v5 = [(HMAccessorySetting *)self internal];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"%@: %@", v4, v7];

  return v8;
}

- (void)logAndPostNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    _HMFPreconditionFailure();
  }
  uint64_t v11 = v10;
  uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
  int v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    int v17 = 138544130;
    long long v18 = v15;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    long long v24 = v11;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@posting:%@ for object:%@ userinfo:%@", (uint8_t *)&v17, 0x2Au);
  }
  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:v8 object:v9 userInfo:v11];
}

- (void)_settingDidUpdateValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 value];
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v8;
    __int16 v16 = 2112;
    int v17 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Did update to: %@", buf, 0x16u);
  }
  id v10 = [(HMAccessorySetting *)v6 internal];
  uint64_t v11 = [v10 context];
  uint64_t v12 = [v11 delegateCaller];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__HMAccessorySetting__settingDidUpdateValue___block_invoke;
  v13[3] = &unk_1E59452E8;
  v13[4] = v6;
  [v12 invokeBlock:v13];
}

uint64_t __45__HMAccessorySetting__settingDidUpdateValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logAndPostNotification:@"HMAccessorySettingValueUpdatedNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)_settingWillUpdateValue:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Will update", (uint8_t *)&v9, 0xCu);
  }
}

- (void)settingDidUpdateReflected
{
  id v3 = [(HMAccessorySetting *)self internal];
  id v4 = [v3 context];
  id v5 = [v4 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HMAccessorySetting_settingDidUpdateReflected__block_invoke;
  v6[3] = &unk_1E59452E8;
  v6[4] = self;
  [v5 invokeBlock:v6];
}

void __47__HMAccessorySetting_settingDidUpdateReflected__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"HMAccessorySettingReflectedUpdatedNotification" object:*(void *)(a1 + 32)];
}

- (void)updateReflected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = NSNumber;
    id v10 = [(HMAccessorySetting *)v6 internal];
    uint64_t v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isReflected"));
    uint64_t v12 = [NSNumber numberWithBool:v3];
    int v14 = 138543874;
    __int16 v15 = v8;
    __int16 v16 = 2112;
    int v17 = v11;
    __int16 v18 = 2112;
    __int16 v19 = v12;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating reflected from %@ to %@", (uint8_t *)&v14, 0x20u);
  }
  [(HMAccessorySetting *)v6 settingWillUpdateReflected];
  int v13 = [(HMAccessorySetting *)v6 internal];
  [v13 setReflected:v3];

  [(HMAccessorySetting *)v6 settingDidUpdateReflected];
}

- (BOOL)isReflected
{
  id v2 = [(HMAccessorySetting *)self internal];
  char v3 = [v2 isReflected];

  return v3;
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMAccessorySetting *)self internal];
  [v8 updateValue:v7 completionHandler:v6];
}

- (id)value
{
  id v2 = [(HMAccessorySetting *)self internal];
  char v3 = [v2 value];

  return v3;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (NSUUID)identifier
{
  id v2 = [(HMAccessorySetting *)self internal];
  char v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (NSString)keyPath
{
  char v3 = [(HMAccessorySetting *)self group];
  id v4 = [v3 keyPath];

  id v5 = [(HMAccessorySetting *)self internal];
  uint64_t v6 = [v5 name];
  id v7 = (void *)v6;
  if (v4)
  {
    uint64_t v8 = [v4 stringByAppendingFormat:@".%@", v6];

    id v7 = (void *)v8;
  }

  return (NSString *)v7;
}

- (NSString)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMSetting *)self localizedTitle];
  [(HMAccessorySetting *)self isWritable];
  uint64_t v6 = HMFBooleanToString();
  id v7 = [(HMAccessorySetting *)self value];
  uint64_t v8 = [v3 stringWithFormat:@"<%@, Title = %@, Writeable = %@, Value = %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isWritable
{
  id v2 = [(HMAccessorySetting *)self internal];
  unint64_t v3 = [v2 properties];

  return (v3 >> 1) & 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMAccessorySetting *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (!v6) {
      goto LABEL_12;
    }
    id v7 = [(HMAccessorySetting *)self internal];
    uint64_t v8 = [(HMAccessorySetting *)v6 internal];

    if (v7 == v8)
    {
      char v27 = 1;
      goto LABEL_15;
    }
    int v9 = [(HMAccessorySetting *)self internal];
    uint64_t v10 = [v9 properties];
    uint64_t v11 = [(HMAccessorySetting *)v6 internal];
    uint64_t v12 = [v11 properties];

    if (v10 != v12) {
      goto LABEL_12;
    }
    int v13 = [(HMAccessorySetting *)self internal];
    uint64_t v14 = [v13 type];
    __int16 v15 = [(HMAccessorySetting *)v6 internal];
    uint64_t v16 = [v15 type];

    if (v14 != v16) {
      goto LABEL_12;
    }
    int v17 = [(HMAccessorySetting *)self internal];
    __int16 v18 = [v17 constraints];
    __int16 v19 = [(HMAccessorySetting *)v6 internal];
    uint64_t v20 = [v19 constraints];
    int v21 = [v18 isEqualToArray:v20];

    if (!v21) {
      goto LABEL_12;
    }
    id v22 = [(HMAccessorySetting *)self keyPath];
    __int16 v23 = [(HMAccessorySetting *)v6 keyPath];
    int v24 = [v22 isEqualToString:v23];

    if (v24)
    {
      uint64_t v25 = [(HMAccessorySetting *)self value];
      uint64_t v26 = [(HMAccessorySetting *)v6 value];
      char v27 = HMFEqualObjects();
    }
    else
    {
LABEL_12:
      char v27 = 0;
    }
LABEL_15:

    goto LABEL_16;
  }
  char v27 = 1;
LABEL_16:

  return v27;
}

- (unint64_t)hash
{
  id v2 = [(HMAccessorySetting *)self internal];
  unint64_t v3 = [v2 name];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (HMAccessorySetting)initWithInternal:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    if (v6 == objc_opt_class()) {
      objc_exception_throw( (id) *MEMORY[0x1E4F1C3B8]);
    }
    v14.receiver = self;
    v14.super_class = (Class)HMAccessorySetting;
    id v7 = [(HMSetting *)&v14 initWithInternal];
    uint64_t v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_internal, a3);
      [v5 setDelegate:v8];
    }
    self = v8;
    int v9 = self;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to create setting controller without internal object", buf, 0xCu);
    }
    int v9 = 0;
  }

  return v9;
}

- (HMAccessorySetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  uint64_t v11 = NSString;
  uint64_t v12 = NSStringFromSelector(a2);
  int v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (HMAccessorySetting)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t75 != -1) {
    dispatch_once(&logCategory__hmf_once_t75, &__block_literal_global_335);
  }
  id v2 = (void *)logCategory__hmf_once_v76;

  return v2;
}

uint64_t __33__HMAccessorySetting_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v76;
  logCategory__hmf_once_v76 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)settingForInternal:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 0;
  switch([v3 type])
  {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      unint64_t v4 = (objc_class *)objc_opt_class();
      goto LABEL_3;
    default:
LABEL_3:
      unint64_t v4 = (objc_class *)[[v4 alloc] initWithInternal:v3];
      break;
  }

  return v4;
}

@end