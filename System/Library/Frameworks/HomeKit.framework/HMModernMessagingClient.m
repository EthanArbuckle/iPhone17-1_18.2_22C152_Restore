@interface HMModernMessagingClient
+ (id)logCategory;
- (HMHome)home;
- (HMModernMessagingClient)initWithHome:(id)a3 idsTopic:(id)a4;
- (NSString)idsTopic;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)registerModernMessagingRequestHandlerWithMessageName:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6;
- (void)sendModernMessagingRequestWithMessageName:(id)a3 destination:(id)a4 requestPayload:(id)a5 options:(id)a6 responseHandler:(id)a7 completionHandler:(id)a8;
- (void)unregisterModernMessagingRequestHandlerWithMessageName:(id)a3 completionHandler:(id)a4;
@end

@implementation HMModernMessagingClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTopic, 0);

  objc_destroyWeak((id *)&self->_home);
}

- (NSString)idsTopic
{
  return self->_idsTopic;
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMModernMessagingClient *)self home];
  v5 = [v4 uuid];
  v6 = [v5 UUIDString];
  v7 = [(HMModernMessagingClient *)self idsTopic];
  v8 = [v3 stringWithFormat:@"%@:%@", v6, v7];

  return v8;
}

- (void)sendModernMessagingRequestWithMessageName:(id)a3 destination:(id)a4 requestPayload:(id)a5 options:(id)a6 responseHandler:(id)a7 completionHandler:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (void (**)(id, void *))a8;
  v20 = (void *)MEMORY[0x19F3A64A0]();
  v21 = self;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = id v32 = v16;
    v24 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    v35 = v23;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2112;
    id v41 = v17;
    __int16 v42 = 2112;
    v43 = v24;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Sending hmmm message with message name: %@, destination: %@, options: %@, oneway: %@", buf, 0x34u);

    id v16 = v32;
  }

  v25 = [(HMModernMessagingClient *)v21 home];
  v26 = v25;
  if (v25)
  {
    [v25 sendModernMessagingRequestWithMessageName:v14 destination:v15 requestPayload:v16 options:v17 responseHandler:v18 completionHandler:v19];
  }
  else
  {
    id v33 = v16;
    v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = v21;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v30;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error while sending hmmm request handler: home is null", buf, 0xCu);
    }
    id v16 = v33;
    if (v19)
    {
      v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v19[2](v19, v31);
    }
  }
}

- (void)unregisterModernMessagingRequestHandlerWithMessageName:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Unregistering hmmm request handler with message name: %@", (uint8_t *)&v19, 0x16u);
  }
  v12 = [(HMModernMessagingClient *)v9 home];
  v13 = v12;
  if (v12)
  {
    [v12 unregisterModernMessagingRequestHandlerWithMessageName:v6 completionHandler:v7];
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = v9;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error while unregistering hmmm request handler: home is null", (uint8_t *)&v19, 0xCu);
    }
    if (v7)
    {
      id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v7[2](v7, v18);
    }
  }
}

- (void)registerModernMessagingRequestHandlerWithMessageName:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  id v14 = (void *)MEMORY[0x19F3A64A0]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    int v25 = 138543874;
    v26 = v17;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Registering hmmm request handler with message name: %@, options: %@", (uint8_t *)&v25, 0x20u);
  }
  id v18 = [(HMModernMessagingClient *)v15 home];
  int v19 = v18;
  if (v18)
  {
    [v18 registerModernMessagingRequestHandlerWithMessageName:v10 options:v11 requestHandler:v12 completionHandler:v13];
  }
  else
  {
    v20 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v21 = v15;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Error while registering hmmm request handler: home is null", (uint8_t *)&v25, 0xCu);
    }
    if (v13)
    {
      v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v13[2](v13, v24);
    }
  }
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMModernMessagingClient *)self home];
  v5 = [v4 uuid];
  id v6 = (void *)[v3 initWithName:@"HomeUUID" value:v5];
  v12[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMModernMessagingClient *)self idsTopic];
  v9 = (void *)[v7 initWithName:@"IDSTopic" value:v8];
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (HMModernMessagingClient)initWithHome:(id)a3 idsTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMModernMessagingClient;
  v8 = [(HMModernMessagingClient *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_home, v6);
    uint64_t v10 = [v7 copy];
    idsTopic = v9->_idsTopic;
    v9->_idsTopic = (NSString *)v10;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_41248 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_41248, &__block_literal_global_41249);
  }
  v2 = (void *)logCategory__hmf_once_v7_41250;

  return v2;
}

uint64_t __38__HMModernMessagingClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_41250;
  logCategory__hmf_once_v7_41250 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end