@interface HMDSettingsMessageHandler
+ (id)logCategory;
- (HMDSettingsMessageController)privateMessageController;
- (HMDSettingsMessageController)sharedMessageController;
- (HMDSettingsMessageHandler)initWithQueue:(id)a3;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (void)_handleUpdateValue:(id)a3;
- (void)configureWithMessageDispatcher:(id)a3 home:(id)a4;
- (void)setMessageTargetUUID:(id)a3;
- (void)setPrivateMessageController:(id)a3;
- (void)setSharedMessageController:(id)a3;
@end

@implementation HMDSettingsMessageHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sharedMessageController);
  objc_destroyWeak((id *)&self->_privateMessageController);
  objc_storeStrong((id *)&self->_anyUserAllowedPolicy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (void)setSharedMessageController:(id)a3
{
}

- (HMDSettingsMessageController)sharedMessageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sharedMessageController);
  return (HMDSettingsMessageController *)WeakRetained;
}

- (void)setPrivateMessageController:(id)a3
{
}

- (HMDSettingsMessageController)privateMessageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateMessageController);
  return (HMDSettingsMessageController *)WeakRetained;
}

- (void)setMessageTargetUUID:(id)a3
{
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
  {
    self = (HMDSettingsMessageHandler *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (void)_handleUpdateValue:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 messagePayload];
  v6 = objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x1E4F2DF58]);
  if ([v6 isEqualToString:*MEMORY[0x1E4F2E3C0]])
  {
    uint64_t v7 = [(HMDSettingsMessageHandler *)self sharedMessageController];
  }
  else
  {
    if (![v6 isEqualToString:*MEMORY[0x1E4F2E348]])
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = self;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v30;
        __int16 v50 = 2112;
        v51 = v6;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Settings update message target type (%@) is unknown", buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = 3;
      goto LABEL_22;
    }
    uint64_t v7 = [(HMDSettingsMessageHandler *)self privateMessageController];
  }
  v8 = (void *)v7;
  if (!v7)
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v24;
      __int16 v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@No message controller to update value for message payload: %@", buf, 0x16u);
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = 2;
LABEL_22:
    v31 = [v25 hmErrorWithCode:v26];
    [v4 respondWithError:v31];
    id v11 = 0;
    goto LABEL_36;
  }
  id v9 = v4;
  id v10 = v8;
  id v11 = v10;
  if (self)
  {
    id v11 = v10;
    v12 = [v9 messagePayload];
    v13 = objc_msgSend(v12, "hmf_UUIDForKey:", @"kUserUUIDKey");

    if (v13
      && ([v11 userUUID],
          v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = objc_msgSend(v14, "hmf_isEqualToUUID:", v13),
          v14,
          (v15 & 1) != 0))
    {
      v16 = 0;
    }
    else
    {
      v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
    }

    if (v16)
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v49 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Only current user may make changes", buf, 0xCu);
      }
      [v9 respondWithError:v16];

      goto LABEL_15;
    }

    v31 = objc_msgSend(v5, "hmf_dataForKey:", *MEMORY[0x1E4F2C618]);
    if (v31)
    {
      v32 = [v9 messagePayload];
      v33 = objc_msgSend(v32, "hmf_stringForKey:", *MEMORY[0x1E4F2DF50]);

      v34 = (void *)MEMORY[0x1D9452090]();
      v35 = self;
      v36 = HMFGetOSLogHandle();
      v37 = v36;
      if (v33)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = v44 = v34;
          *(_DWORD *)buf = 138543362;
          v49 = v38;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Received request to update value.", buf, 0xCu);

          v34 = v44;
        }

        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __48__HMDSettingsMessageHandler__handleUpdateValue___block_invoke;
        v46[3] = &unk_1E6A197F0;
        id v47 = v9;
        [v11 updateWithEncodedValue:v31 onSettingKeyPath:v33 completion:v46];
        v39 = v47;
      }
      else
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v45;
          __int16 v50 = 2112;
          v51 = v5;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Missing key path from user settings update message payload: %@", buf, 0x16u);
        }
        v39 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
        [v9 respondWithError:v39];
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = self;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v43;
        __int16 v50 = 2112;
        v51 = v5;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Missing updated serialized value from payload: %@", buf, 0x16u);
      }
      v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v9 respondWithError:v33];
    }

LABEL_36:
    goto LABEL_37;
  }
LABEL_15:

LABEL_37:
}

uint64_t __48__HMDSettingsMessageHandler__handleUpdateValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a2];
}

- (void)configureWithMessageDispatcher:(id)a3 home:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id newValue = a3;
  id v7 = a4;
  if (self) {
    objc_setProperty_atomic(self, v6, newValue, 16);
  }
  v8 = [v7 uuid];
  [(HMDSettingsMessageHandler *)self setMessageTargetUUID:v8];

  id v10 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:0 remoteAccessRequired:0];
  if (self)
  {
    objc_setProperty_atomic(self, v9, v10, 32);

    id v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Registering for setting messages.", (uint8_t *)&buf, 0xCu);
    }
    id v10 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    char v15 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    *(void *)&long long buf = v15;
    *((void *)&buf + 1) = objc_getProperty(v12, v16, 32, 1);
    v23 = v10;
    v17 = (void *)MEMORY[0x1E4F1C978];
    id v18 = *((id *)&buf + 1);
    v19 = [v17 arrayWithObjects:&buf count:3];

    objc_msgSend(objc_getProperty(v12, v20, 16, 1), "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E4F2DF60], v12, v19, sel__handleUpdateValue_);
  }
}

- (HMDSettingsMessageHandler)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSettingsMessageHandler;
  v6 = [(HMDSettingsMessageHandler *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_19448 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_19448, &__block_literal_global_19449);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v8_19450;
  return v2;
}

uint64_t __40__HMDSettingsMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_19450;
  logCategory__hmf_once_v8_19450 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end