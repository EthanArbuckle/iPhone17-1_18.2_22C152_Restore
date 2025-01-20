@interface HMDSiriSecureAccessoryAccessController
- (HMDSiriSecureAccessoryAccessController)initWithDataSource:(id)a3;
- (HMDSiriSecureAccessoryAccessController)initWithDataSource:(id)a3 watchAuthDataSource:(id)a4;
- (void)isUnsecuringSiriActionAllowedWithCompletion:(id)a3;
@end

@implementation HMDSiriSecureAccessoryAccessController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAuthDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)isUnsecuringSiriActionAllowedWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18 = (void (**)(id, void))a3;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if ([WeakRetained currentDeviceSupportsSiriUnsecuringActionsWithNoPasscodeForSiriSecureAccessoryAccessController:self])
    {
      v5 = (void *)MEMORY[0x230FBD990]();
      v6 = self;
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v20 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Denying Siri access due to running tvOS-only code path on other platform", buf, 0xCu);
      }
    }

    id v9 = objc_loadWeakRetained((id *)&self->_dataSource);
    if ([v9 currentDeviceSupportsSiriUnsecuringActionsWithWatchAuthForSiriSecureAccessoryAccessController:self])
    {
      if ([v9 isCurrentDevicePairedWithWatchForSiriSecureAccessoryAccessController:self])
      {
        if (([v9 homeLocationForSiriSecureAccessoryAccessController:self] & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {

          objc_msgSend(objc_getProperty(self, v10, 16, 1), "getCurrentRequestIsWatchAuthenticatedWithCompletion:", v18);
          goto LABEL_17;
        }
        v11 = (void *)MEMORY[0x230FBD990]();
        v15 = self;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v16 = HMFGetLogIdentifier();
          v17 = HMStringFromHomeLocation();
          *(_DWORD *)buf = 138543618;
          v20 = v16;
          __int16 v21 = 2112;
          v22 = v17;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Siri access is not allowed for request because current device is not at or near home (%@)", buf, 0x16u);
        }
      }
      else
      {
        v11 = (void *)MEMORY[0x230FBD990]();
        v12 = self;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v20 = v14;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Siri access is not allowed for request because current device has no paired watch", buf, 0xCu);
        }
      }
    }
  }
  v18[2](v18, 0);
LABEL_17:
}

- (HMDSiriSecureAccessoryAccessController)initWithDataSource:(id)a3 watchAuthDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDSiriSecureAccessoryAccessController;
  v8 = [(HMDSiriSecureAccessoryAccessController *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_watchAuthDataSource, a4);
  }

  return v9;
}

- (HMDSiriSecureAccessoryAccessController)initWithDataSource:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HMDAssistantWatchAuthenticationDataSource);
  id v6 = [(HMDSiriSecureAccessoryAccessController *)self initWithDataSource:v4 watchAuthDataSource:v5];

  return v6;
}

@end