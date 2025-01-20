@interface HMDBackingStoreDispatchModelChange
- (HMDBackingStoreDispatchModelChange)initWithModelChange:(id)a3;
- (HMDBackingStoreModelObject)modelChange;
- (void)main;
- (void)setModelChange:(id)a3;
@end

@implementation HMDBackingStoreDispatchModelChange

- (void).cxx_destruct
{
}

- (void)setModelChange:(id)a3
{
}

- (HMDBackingStoreModelObject)modelChange
{
  return self->_modelChange;
}

- (void)main
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [(HMDBackingStoreDispatchModelChange *)v4 modelChange];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@MODEL CHANGE: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (HMDBackingStoreDispatchModelChange)initWithModelChange:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDBackingStoreDispatchModelChange;
  v6 = [(HMDBackingStoreDispatchModelChange *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelChange, a3);
    int v8 = v7;
  }

  return v7;
}

@end