@interface _HMCameraControl
+ (id)logCategory;
- (NSUUID)profileUniqueIdentifier;
- (_HMCameraControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4;
- (_HMCameraProfile)cameraProfile;
- (_HMContext)context;
- (id)logIdentifier;
- (void)setCameraProfile:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation _HMCameraControl

- (_HMCameraControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_HMCameraControl;
  v8 = [(_HMCameraControl *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_cameraProfile, v6);
    uint64_t v10 = [v7 copy];
    profileUniqueIdentifier = v9->_profileUniqueIdentifier;
    v9->_profileUniqueIdentifier = (NSUUID *)v10;
  }
  return v9;
}

- (id)logIdentifier
{
  if (isInternalBuild())
  {
    v3 = NSString;
    v4 = [(_HMCameraControl *)self cameraProfile];
    v5 = [v4 accessory];
    id v6 = [v5 name];
    id v7 = [(_HMCameraControl *)self profileUniqueIdentifier];
    v8 = [v3 stringWithFormat:@"%@/%@", v6, v7];
  }
  else
  {
    v4 = [(_HMCameraControl *)self profileUniqueIdentifier];
    v8 = [v4 UUIDString];
  }

  return v8;
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (_HMCameraProfile)cameraProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraProfile);

  return (_HMCameraProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCameraProfile:(id)a3
{
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_29970 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_29970, &__block_literal_global_29971);
  }
  v2 = (void *)logCategory__hmf_once_v1_29972;

  return v2;
}

@end