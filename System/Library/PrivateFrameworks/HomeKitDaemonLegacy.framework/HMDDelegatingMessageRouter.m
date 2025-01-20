@interface HMDDelegatingMessageRouter
+ (id)logCategory;
- (HMDDelegatingMessageRouter)initWithMessageDispatcher:(id)a3 routers:(id)a4;
- (HMDDelegatingMessageRouterDataSource)dataSource;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)routers;
- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5;
- (void)routeMessage:(id)a3 localHandler:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation HMDDelegatingMessageRouter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routers, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (NSArray)routers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDDelegatingMessageRouterDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDDelegatingMessageRouterDataSource *)WeakRetained;
}

- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5
{
  BOOL v17 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, id))a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(HMDDelegatingMessageRouter *)self routers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        v15 = [(HMDDelegatingMessageRouter *)self dataSource];
        int v16 = [v15 router:self shouldHandleMessage:v7 usingRouter:v14];

        if (v16)
        {
          [v14 routeMessage:v7 allowRemoteRelayFromPrimary:v17 localHandler:v8];

          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v8[2](v8, v7);
LABEL_11:
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
}

- (HMDDelegatingMessageRouter)initWithMessageDispatcher:(id)a3 routers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDDelegatingMessageRouter;
  v9 = [(HMDDelegatingMessageRouter *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDispatcher, a3);
    uint64_t v11 = [v8 copy];
    routers = v10->_routers;
    v10->_routers = (NSArray *)v11;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_164722 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_164722, &__block_literal_global_164723);
  }
  v2 = (void *)logCategory__hmf_once_v1_164724;
  return v2;
}

uint64_t __41__HMDDelegatingMessageRouter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_164724;
  logCategory__hmf_once_v1_164724 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end