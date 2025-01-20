@interface HMCameraSource
+ (id)logCategory;
- (HMCameraSource)init;
- (HMCameraSource)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(double)a5;
- (HMCameraView)cameraView;
- (NSNumber)slotIdentifier;
- (NSUUID)profileUniqueIdentifier;
- (_HMContext)context;
- (double)aspectRatio;
- (id)logIdentifier;
- (void)fillSlotWithCompletionHandler:(id)a3;
- (void)setCameraView:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation HMCameraSource

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraView);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setCameraView:(id)a3
{
}

- (HMCameraView)cameraView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraView);

  return (HMCameraView *)WeakRetained;
}

- (NSNumber)slotIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMCameraSource *)self profileUniqueIdentifier];
  v5 = [(HMCameraSource *)self slotIdentifier];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (void)fillSlotWithCompletionHandler:(id)a3
{
}

- (HMCameraSource)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (a5 == 0.0)
  {
LABEL_9:
    v17 = (HMCameraSource *)_HMFPreconditionFailure();
    return [(HMCameraSource *)v17 init];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMCameraSource;
  v11 = [(HMCameraSource *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    profileUniqueIdentifier = v11->_profileUniqueIdentifier;
    v11->_profileUniqueIdentifier = (NSUUID *)v12;

    uint64_t v14 = [v10 copy];
    slotIdentifier = v11->_slotIdentifier;
    v11->_slotIdentifier = (NSNumber *)v14;

    v11->_aspectRatio = a5;
  }

  return v11;
}

- (HMCameraSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraSource;
  return [(HMCameraSource *)&v3 init];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_43150 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_43150, &__block_literal_global_43151);
  }
  v2 = (void *)logCategory__hmf_once_v1_43152;

  return v2;
}

uint64_t __29__HMCameraSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_43152;
  logCategory__hmf_once_v1_43152 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end