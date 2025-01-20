@interface HMNetworkConfigurationProfile
+ (id)logCategory;
- (BOOL)isNetworkAccessRestricted;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)supportsWiFiReconfiguration;
- (HMAccessoryNetworkAccessViolation)accessViolation;
- (HMNetworkConfigurationProfile)initWithAccessoryIdentifier:(id)a3 targetProtection:(int64_t)a4 currentProtection:(int64_t)a5 networkAccessRestricted:(BOOL)a6 allowedHosts:(id)a7 accessViolation:(id)a8 supportsWiFiReconfiguration:(BOOL)a9 credentialType:(int64_t)a10;
- (NSArray)allowedHosts;
- (id)delegate;
- (id)logIdentifier;
- (int64_t)credentialType;
- (int64_t)currentProtectionMode;
- (int64_t)targetProtectionMode;
- (void)networkConfigurationProfileDidUpdateAccessViolation:(id)a3;
- (void)networkConfigurationProfileDidUpdateAllowedHosts:(id)a3;
- (void)networkConfigurationProfileDidUpdateNetworkAccessMode:(id)a3;
- (void)networkConfigurationProfileDidUpdateProtectionMode:(id)a3;
- (void)networkConfigurationProfileDidUpdateWiFiCredentialType:(id)a3;
- (void)networkConfigurationProfileDidUpdateWiFiReconfigurationSupport:(id)a3;
- (void)previewAllowedHostsForAutoProtectionModeWithCompletionHandler:(id)a3;
- (void)reconfigureWiFiWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)delegate;
@end

@implementation HMNetworkConfigurationProfile

- (HMNetworkConfigurationProfile)initWithAccessoryIdentifier:(id)a3 targetProtection:(int64_t)a4 currentProtection:(int64_t)a5 networkAccessRestricted:(BOOL)a6 allowedHosts:(id)a7 accessViolation:(id)a8 supportsWiFiReconfiguration:(BOOL)a9 credentialType:(int64_t)a10
{
  BOOL v11 = a6;
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  LOBYTE(v21) = a9;
  v18 = [[_HMNetworkConfigurationProfile alloc] initWithAccessoryIdentifier:v17 targetProtection:a4 currentProtection:a5 networkAccessRestricted:v11 allowedHosts:v16 accessViolation:v15 supportsWiFiReconfiguration:v21 credentialType:a10];

  v23.receiver = self;
  v23.super_class = (Class)HMNetworkConfigurationProfile;
  v19 = [(HMAccessoryProfile *)&v23 initWithAccessoryProfile:v18];
  if (v19) {
    [(_HMNetworkConfigurationProfile *)v18 setDelegate:v19];
  }

  return v19;
}

- (void)setDelegate:(id)delegate
{
}

uint64_t __76___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiCredentialType__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkConfigurationProfileDidUpdateWiFiCredentialType:*(void *)(a1 + 40)];
}

uint64_t __84___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiReconfigurationSupport__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkConfigurationProfileDidUpdateWiFiReconfigurationSupport:*(void *)(a1 + 40)];
}

uint64_t __73___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAccessViolation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkConfigurationProfileDidUpdateAccessViolation:*(void *)(a1 + 40)];
}

uint64_t __70___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAllowedHosts__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkConfigurationProfileDidUpdateAllowedHosts:*(void *)(a1 + 40)];
}

uint64_t __75___HMNetworkConfigurationProfile__notifyDelegateOfNetworkAccessModeChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkConfigurationProfileDidUpdateNetworkAccessMode:*(void *)(a1 + 40)];
}

uint64_t __72___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedProtectionMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkConfigurationProfileDidUpdateProtectionMode:*(void *)(a1 + 40)];
}

void __96___HMNetworkConfigurationProfile_previewAllowedHostsForAutoProtectionModeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_msgSend(v6, "hmf_dataForKey:", @"allowed");
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    BOOL v11 = [v9 setWithArray:v10];

    id v23 = 0;
    v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v8 error:&v23];
    id v13 = v23;
    if (v12)
    {
      uint64_t v14 = (uint64_t)v5;
    }
    else
    {
      context = (void *)MEMORY[0x19F3A64A0]();
      id v15 = WeakRetained;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        __int16 v28 = 2112;
        id v29 = v13;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive NSArray<HMAccessoryAllowedHost *>: %@", buf, 0x16u);
      }
      id v17 = (void *)MEMORY[0x1E4F28C58];
      if (v13)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        id v25 = v13;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      }
      else
      {
        v18 = 0;
      }
      uint64_t v14 = [v17 hmErrorWithCode:-1 userInfo:v18];

      if (v13) {
    }
      }

    id v5 = (id)v14;
  }
  else
  {
    v12 = 0;
  }
  v19 = [WeakRetained context];
  v20 = [v19 delegateCaller];
  [v20 callCompletion:*(void *)(a1 + 32) obj:v12 error:v5];
}

void __79___HMNetworkConfigurationProfile_reconfigureWiFiWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

uint64_t __45___HMNetworkConfigurationProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v26;
  logCategory__hmf_once_v26 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMAccessoryProfile *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)networkConfigurationProfileDidUpdateWiFiCredentialType:(id)a3
{
  id v4 = [(HMNetworkConfigurationProfile *)self delegate];
  if ([v4 conformsToProtocol:&unk_1EEF6FB78]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    v7 = [(HMAccessoryProfile *)self accessoryProfile];
    v8 = [v7 context];
    v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiCredentialType___block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v6;
    v12 = self;
    [v9 invokeBlock:v10];
  }
}

uint64_t __88__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiCredentialType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) profileDidUpdateWiFiCredentialType:*(void *)(a1 + 40)];
}

- (void)networkConfigurationProfileDidUpdateWiFiReconfigurationSupport:(id)a3
{
  id v4 = [(HMNetworkConfigurationProfile *)self delegate];
  if ([v4 conformsToProtocol:&unk_1EEF6FB78]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    v7 = [(HMAccessoryProfile *)self accessoryProfile];
    v8 = [v7 context];
    v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __96__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiReconfigurationSupport___block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v6;
    v12 = self;
    [v9 invokeBlock:v10];
  }
}

uint64_t __96__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateWiFiReconfigurationSupport___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) profileDidUpdateWiFiReconfigurationSupport:*(void *)(a1 + 40)];
}

- (void)networkConfigurationProfileDidUpdateAccessViolation:(id)a3
{
  id v4 = [(HMNetworkConfigurationProfile *)self delegate];
  if ([v4 conformsToProtocol:&unk_1EEF6FB78]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    v7 = [(HMAccessoryProfile *)self accessoryProfile];
    v8 = [v7 context];
    v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAccessViolation___block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v6;
    v12 = self;
    [v9 invokeBlock:v10];
  }
}

uint64_t __85__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAccessViolation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) profileDidUpdateAccessViolation:*(void *)(a1 + 40)];
}

- (void)networkConfigurationProfileDidUpdateAllowedHosts:(id)a3
{
  id v4 = [(HMNetworkConfigurationProfile *)self delegate];
  if ([v4 conformsToProtocol:&unk_1EEF6FB78]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    v7 = [(HMAccessoryProfile *)self accessoryProfile];
    v8 = [v7 context];
    v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAllowedHosts___block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v6;
    v12 = self;
    [v9 invokeBlock:v10];
  }
}

uint64_t __82__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateAllowedHosts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) profileDidUpdateAllowedHosts:*(void *)(a1 + 40)];
}

- (void)networkConfigurationProfileDidUpdateNetworkAccessMode:(id)a3
{
  id v4 = [(HMNetworkConfigurationProfile *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(HMAccessoryProfile *)self accessoryProfile];
    id v6 = [v5 context];
    v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateNetworkAccessMode___block_invoke;
    v8[3] = &unk_1E5945628;
    id v9 = v4;
    v10 = self;
    [v7 invokeBlock:v8];
  }
}

uint64_t __87__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateNetworkAccessMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) profileDidUpdateNetworkAccessMode:*(void *)(a1 + 40)];
}

- (void)networkConfigurationProfileDidUpdateProtectionMode:(id)a3
{
  id v4 = [(HMNetworkConfigurationProfile *)self delegate];
  if ([v4 conformsToProtocol:&unk_1EEF6FB78]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    v7 = [(HMAccessoryProfile *)self accessoryProfile];
    v8 = [v7 context];
    id v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateProtectionMode___block_invoke;
    v10[3] = &unk_1E5945628;
    void v10[4] = self;
    id v11 = v6;
    [v9 invokeBlock:v10];
  }
}

uint64_t __84__HMNetworkConfigurationProfile_networkConfigurationProfileDidUpdateProtectionMode___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Telling delegate that network configuration profile did update protection mode. Delegate: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) profileDidUpdateNetworkProtectionMode:*(void *)(a1 + 32)];
}

- (BOOL)isNetworkAccessRestricted
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 isNetworkAccessRestricted];
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t44 != -1) {
    dispatch_once(&logCategory__hmf_once_t44, &__block_literal_global_240);
  }
  v2 = (void *)logCategory__hmf_once_v45;

  return v2;
}

uint64_t __44__HMNetworkConfigurationProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v45;
  logCategory__hmf_once_v45 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)previewAllowedHostsForAutoProtectionModeWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  [v6 previewAllowedHostsForAutoProtectionModeWithCompletionHandler:v7];
}

- (void)reconfigureWiFiWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  id v7 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  [v9 reconfigureWiFiWithOptions:v10 completionHandler:v6];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMNetworkConfigurationProfile;
  unsigned __int8 v5 = [(HMAccessoryProfile *)&v15 mergeFromNewObject:v4];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [(HMAccessoryProfile *)self accessoryProfile];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v8 accessoryProfile];
    char v13 = [v11 mergeFromNewObject:v12];

    v5 |= v13;
  }

  return v5;
}

- (int64_t)credentialType
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  int64_t v5 = [v4 credentialType];
  return v5;
}

- (BOOL)supportsWiFiReconfiguration
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 supportsWiFiReconfiguration];
  return v5;
}

- (HMAccessoryNetworkAccessViolation)accessViolation
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 accessViolation];

  return (HMAccessoryNetworkAccessViolation *)v5;
}

- (NSArray)allowedHosts
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 allowedHosts];

  return (NSArray *)v5;
}

- (int64_t)targetProtectionMode
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  int64_t v5 = [v4 targetProtectionMode];
  return v5;
}

- (int64_t)currentProtectionMode
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  int64_t v5 = [v4 currentProtectionMode];
  return v5;
}

@end