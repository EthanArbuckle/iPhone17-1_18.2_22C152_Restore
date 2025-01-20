@interface HMAutoAddWalletKeySupressionAssertion
- (HMAutoAddWalletKeySupressionAssertion)initWithHomeManager:(id)a3 homeUUID:(id)a4;
- (HMHomeManager)homeManager;
- (NSUUID)homeUUID;
- (void)acquireWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation HMAutoAddWalletKeySupressionAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);

  objc_destroyWeak((id *)&self->_homeManager);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);

  return (HMHomeManager *)WeakRetained;
}

- (void)invalidate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
  [(HMFAssertion *)&v16 invalidate];
  v3 = [(HMAutoAddWalletKeySupressionAssertion *)self homeManager];
  if (v3)
  {
    v17 = @"HMHomeManagerMessageKeyHomeUUID";
    v4 = [(HMAutoAddWalletKeySupressionAssertion *)self homeUUID];
    v18 = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    id v6 = objc_alloc(MEMORY[0x1E4F65488]);
    v7 = [v3 uuid];
    v8 = (void *)[v6 initWithTarget:v7];

    v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeManagerAutoAddWalletKeySupressionAssertionReleaseMessage" destination:v8 payload:v5];
    [v9 setResponseHandler:&__block_literal_global_58590];
    v10 = [v3 context];
    v11 = [v10 messageDispatcher];
    [v11 sendMessage:v9];
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot release auto add wallet key suppression assertion, home manager is nil", buf, 0xCu);
    }
  }
}

void __51__HMAutoAddWalletKeySupressionAssertion_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  v7 = HMFGetOSLogHandle();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v9;
      __int16 v16 = 2112;
      id v17 = v4;
      v10 = "%{public}@Failed to release auto add wallet key suppression assertion: %@";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v9;
    v10 = "%{public}@Successfully released auto add wallet key suppression assertion";
    v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 12;
    goto LABEL_6;
  }
}

- (void)acquireWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAutoAddWalletKeySupressionAssertion *)self homeManager];
  if (v5)
  {
    v24.receiver = self;
    v24.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
    [(HMFAssertion *)&v24 acquire:0];
    v25 = @"HMHomeManagerMessageKeyHomeUUID";
    id v6 = [(HMAutoAddWalletKeySupressionAssertion *)self homeUUID];
    v26 = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

    id v8 = objc_alloc(MEMORY[0x1E4F65488]);
    v9 = [v5 uuid];
    v10 = (void *)[v8 initWithTarget:v9];

    v11 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeManagerAutoAddWalletKeySupressionAssertionAcquireMessage" destination:v10 payload:v7];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __63__HMAutoAddWalletKeySupressionAssertion_acquireWithCompletion___block_invoke;
    uint64_t v21 = &unk_1E5944EF0;
    v22 = self;
    id v23 = v4;
    [v11 setResponseHandler:&v18];
    os_log_type_t v12 = objc_msgSend(v5, "context", v18, v19, v20, v21);
    uint32_t v13 = [v12 messageDispatcher];
    [v13 sendMessage:v11];
  }
  else
  {
    int v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot acquire auto add wallet key suppression assertion, home manager is nil", buf, 0xCu);
    }
    v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

void __63__HMAutoAddWalletKeySupressionAssertion_acquireWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
    objc_msgSendSuper2(&v4, sel_invalidate);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HMAutoAddWalletKeySupressionAssertion)initWithHomeManager:(id)a3 homeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v14.receiver = self;
  v14.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
  v10 = [(HMFAssertion *)&v14 initWithName:v9];

  if (v10)
  {
    objc_storeWeak((id *)&v10->_homeManager, v6);
    uint64_t v11 = [v7 copy];
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = (NSUUID *)v11;
  }
  return v10;
}

@end