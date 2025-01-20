@interface HMDRemoteLoginAnisetteDataProvider
+ (id)logCategory;
- (HMDRemoteLoginAnisetteDataProvider)initWithSessionID:(id)a3 remoteMessageSender:(id)a4;
- (HMDRemoteLoginMessageSender)remoteMessageSender;
- (NSString)sessionID;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)setRemoteMessageSender:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation HMDRemoteLoginAnisetteDataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setRemoteMessageSender:(id)a3
{
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F2E888]) initNewMessage];
  [v8 setDsid:v6];
  v9 = [v8 messageName];
  v19 = v9;
  v10 = encodeRootObject();
  v20[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

  objc_initWeak(&location, self);
  v12 = [(HMDRemoteLoginAnisetteDataProvider *)self remoteMessageSender];
  v13 = [v8 messageName];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__HMDRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v15[3] = &unk_1E6A193F8;
  objc_copyWeak(&v17, &location);
  id v14 = v7;
  id v16 = v14;
  [v12 sendRemoteMessageWithName:v13 payload:v11 responseHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __79__HMDRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [MEMORY[0x1E4F2E890] objWithDict:v6];
  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = WeakRetained;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v15 = 138543618;
    id v16 = v12;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = [v8 anisetteData];
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v5);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F2E7D8]) initNewMessage];
  [v7 setShouldProvision:v4];
  v8 = [v7 messageName];
  v18 = v8;
  v9 = encodeRootObject();
  v19[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  objc_initWeak(&location, self);
  v11 = [(HMDRemoteLoginAnisetteDataProvider *)self remoteMessageSender];
  v12 = [v7 messageName];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__HMDRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v14[3] = &unk_1E6A193F8;
  objc_copyWeak(&v16, &location);
  id v13 = v6;
  id v15 = v13;
  [v11 sendRemoteMessageWithName:v12 payload:v10 responseHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __94__HMDRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [MEMORY[0x1E4F2E7E0] objWithDict:v6];
  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = WeakRetained;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v15 = 138543618;
    id v16 = v12;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = [v8 anisetteData];
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v5);
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F2E790]) initNewMessage];
  id v6 = [v5 messageName];
  id v16 = v6;
  id v7 = encodeRootObject();
  v17[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  objc_initWeak(&location, self);
  v9 = [(HMDRemoteLoginAnisetteDataProvider *)self remoteMessageSender];
  id v10 = [v5 messageName];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HMDRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke;
  v12[3] = &unk_1E6A193F8;
  objc_copyWeak(&v14, &location);
  id v11 = v4;
  id v13 = v11;
  [v9 sendRemoteMessageWithName:v10 payload:v8 responseHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__HMDRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [MEMORY[0x1E4F2E798] objWithDict:v6];
  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = WeakRetained;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v12;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 didSucceed], v5);
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F2EB78]) initNewMessage];
  [v8 setSimData:v6];
  v9 = [v8 messageName];
  uint64_t v19 = v9;
  id v10 = encodeRootObject();
  v20[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

  objc_initWeak(&location, self);
  v12 = [(HMDRemoteLoginAnisetteDataProvider *)self remoteMessageSender];
  int v13 = [v8 messageName];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HMDRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke;
  v15[3] = &unk_1E6A193F8;
  objc_copyWeak(&v17, &location);
  id v14 = v7;
  id v16 = v14;
  [v12 sendRemoteMessageWithName:v13 payload:v11 responseHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __73__HMDRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [MEMORY[0x1E4F2EB80] objWithDict:v6];
  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = WeakRetained;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v12;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 didSucceed], v5);
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F2EA38]) initNewMessage];
  id v6 = [v5 messageName];
  id v16 = v6;
  id v7 = encodeRootObject();
  v17[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  objc_initWeak(&location, self);
  v9 = [(HMDRemoteLoginAnisetteDataProvider *)self remoteMessageSender];
  id v10 = [v5 messageName];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HMDRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke;
  v12[3] = &unk_1E6A193F8;
  objc_copyWeak(&v14, &location);
  id v11 = v4;
  id v13 = v11;
  [v9 sendRemoteMessageWithName:v10 payload:v8 responseHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __70__HMDRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [MEMORY[0x1E4F2EA40] objWithDict:v6];
  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = WeakRetained;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v12;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 didSucceed], v5);
}

- (HMDRemoteLoginAnisetteDataProvider)initWithSessionID:(id)a3 remoteMessageSender:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDRemoteLoginAnisetteDataProvider;
  v9 = [(HMDRemoteLoginAnisetteDataProvider *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionID, a3);
    objc_storeStrong((id *)&v10->_remoteMessageSender, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_59597 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_59597, &__block_literal_global_59598);
  }
  v2 = (void *)logCategory__hmf_once_v1_59599;
  return v2;
}

uint64_t __49__HMDRemoteLoginAnisetteDataProvider_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_59599;
  logCategory__hmf_once_v1_59599 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end