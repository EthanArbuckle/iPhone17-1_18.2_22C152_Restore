@interface _HMNetworkConfigurationProfile
+ (id)logCategory;
- (BOOL)isNetworkAccessRestricted;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)supportsWiFiReconfiguration;
- (HMAccessoryNetworkAccessViolation)accessViolation;
- (NSArray)allowedHosts;
- (_HMNetworkConfigurationProfile)initWithAccessoryIdentifier:(id)a3 targetProtection:(int64_t)a4 currentProtection:(int64_t)a5 networkAccessRestricted:(BOOL)a6 allowedHosts:(id)a7 accessViolation:(id)a8 supportsWiFiReconfiguration:(BOOL)a9 credentialType:(int64_t)a10;
- (_HMNetworkConfigurationProfileDelegate)delegate;
- (id)logIdentifier;
- (id)messageDestination;
- (id)messageTargetUUID;
- (int64_t)credentialType;
- (int64_t)currentProtectionMode;
- (int64_t)targetProtectionMode;
- (void)_handleAccessViolationUpdated:(id)a3;
- (void)_handleHostsUpdated:(id)a3;
- (void)_handleWiFiReconfigurationUpdated:(id)a3;
- (void)_notifyDelegateOfNetworkAccessModeChanged;
- (void)_notifyDelegateOfUpdatedAccessViolation;
- (void)_notifyDelegateOfUpdatedAllowedHosts;
- (void)_notifyDelegateOfUpdatedProtectionMode;
- (void)_notifyDelegateOfUpdatedWiFiCredentialType;
- (void)_notifyDelegateOfUpdatedWiFiReconfigurationSupport;
- (void)_registerNotificationHandlers;
- (void)previewAllowedHostsForAutoProtectionModeWithCompletionHandler:(id)a3;
- (void)reconfigureWiFiWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setAccessViolation:(id)a3;
- (void)setAllowedHosts:(id)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setCurrentProtectionMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setNetworkAccessRestricted:(BOOL)a3;
- (void)setSupportsWiFiReconfiguration:(BOOL)a3;
- (void)setTargetProtectionMode:(int64_t)a3;
@end

@implementation _HMNetworkConfigurationProfile

- (void)_registerNotificationHandlers
{
  v3 = [(_HMAccessoryProfile *)self context];
  id v4 = [v3 messageDispatcher];

  [v4 registerForMessage:@"HMNCP.hostsUpdated" receiver:self selector:sel__handleHostsUpdated_];
  [v4 registerForMessage:@"HMNCP.avUpdate" receiver:self selector:sel__handleAccessViolationUpdated_];
  [v4 registerForMessage:@"HMNCP.wrUpdated" receiver:self selector:sel__handleWiFiReconfigurationUpdated_];
}

- (void)setDelegate:(id)a3
{
}

- (_HMNetworkConfigurationProfile)initWithAccessoryIdentifier:(id)a3 targetProtection:(int64_t)a4 currentProtection:(int64_t)a5 networkAccessRestricted:(BOOL)a6 allowedHosts:(id)a7 accessViolation:(id)a8 supportsWiFiReconfiguration:(BOOL)a9 credentialType:(int64_t)a10
{
  id v17 = a7;
  id v18 = a8;
  v19 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", a3);
  v23.receiver = self;
  v23.super_class = (Class)_HMNetworkConfigurationProfile;
  v20 = [(_HMAccessoryProfile *)&v23 initWithUUID:v19 services:MEMORY[0x1E4F1CBF0]];
  v21 = v20;
  if (v20)
  {
    v20->_targetProtectionMode = a4;
    v20->_currentProtectionMode = a5;
    *(&v20->_supportsWiFiReconfiguration + 3) = a6;
    objc_storeStrong((id *)&v20->_allowedHosts, a7);
    objc_storeStrong((id *)&v21->_accessViolation, a8);
    *(&v21->_supportsWiFiReconfiguration + 4) = a9;
    v21->_credentialType = a10;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessViolation, 0);

  objc_storeStrong((id *)&self->_allowedHosts, 0);
}

- (_HMNetworkConfigurationProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMNetworkConfigurationProfileDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(_HMAccessoryProfile *)self uniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_handleWiFiReconfigurationUpdated:(id)a3
{
  id v14 = a3;
  id v4 = [(_HMAccessoryProfile *)self context];
  v5 = [v4 pendingRequests];

  v6 = [v14 identifier];
  v7 = [v5 removeCompletionBlockForIdentifier:v6];

  uint64_t v8 = [v14 BOOLForKey:@"reconfig-support"];
  if (v8 == [(_HMNetworkConfigurationProfile *)self supportsWiFiReconfiguration])
  {
    if (!v7) {
      goto LABEL_6;
    }
  }
  else
  {
    [(_HMNetworkConfigurationProfile *)self setSupportsWiFiReconfiguration:v8];
    if (!v7)
    {
      [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedWiFiReconfigurationSupport];
      goto LABEL_6;
    }
  }
  v9 = [(_HMAccessoryProfile *)self context];
  v10 = [v9 delegateCaller];
  [v10 callCompletion:v7 error:0];

LABEL_6:
  v11 = [v14 numberForKey:@"credential-type"];
  uint64_t v12 = [v11 unsignedIntegerValue];
  if ((unint64_t)(v12 - 1) >= 3) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  if ([(_HMNetworkConfigurationProfile *)self credentialType] != v13)
  {
    [(_HMNetworkConfigurationProfile *)self setCredentialType:v13];
    [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedWiFiCredentialType];
  }
}

- (void)_handleAccessViolationUpdated:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 dataForKey:@"access-violation"];
  if (v5)
  {
    id v14 = 0;
    v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v14];
    id v7 = v14;
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v16 = v11;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory network access violation from access violation data: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v12 = [(_HMNetworkConfigurationProfile *)self accessViolation];
      char v13 = HMFEqualObjects();

      if ((v13 & 1) == 0)
      {
        [(_HMNetworkConfigurationProfile *)self setAccessViolation:v6];
        [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedAccessViolation];
      }
    }
  }
}

- (void)_handleHostsUpdated:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 dataForKey:@"allowed"];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    uint64_t v8 = [v6 setWithArray:v7];

    id v19 = 0;
    v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v5 error:&v19];
    id v10 = v19;
    if (v10)
    {
      v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = self;
      char v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory allowed hosts from allowed hosts data: %@", buf, 0x16u);
      }
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
      v16 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v17 = [(_HMNetworkConfigurationProfile *)self allowedHosts];
      id v18 = [v16 setWithArray:v17];

      if ((HMFEqualObjects() & 1) == 0)
      {
        [(_HMNetworkConfigurationProfile *)self setAllowedHosts:v9];
        [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedAllowedHosts];
      }
    }
  }
}

- (void)_notifyDelegateOfUpdatedWiFiCredentialType
{
  v3 = [(_HMNetworkConfigurationProfile *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_HMAccessoryProfile *)self context];
    v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiCredentialType__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    uint64_t v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)_notifyDelegateOfUpdatedWiFiReconfigurationSupport
{
  v3 = [(_HMNetworkConfigurationProfile *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_HMAccessoryProfile *)self context];
    v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiReconfigurationSupport__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    uint64_t v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)_notifyDelegateOfUpdatedAccessViolation
{
  v3 = [(_HMNetworkConfigurationProfile *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_HMAccessoryProfile *)self context];
    v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAccessViolation__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    uint64_t v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)_notifyDelegateOfUpdatedAllowedHosts
{
  v3 = [(_HMNetworkConfigurationProfile *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_HMAccessoryProfile *)self context];
    v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAllowedHosts__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    uint64_t v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)_notifyDelegateOfNetworkAccessModeChanged
{
  v3 = [(_HMNetworkConfigurationProfile *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_HMAccessoryProfile *)self context];
    v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75___HMNetworkConfigurationProfile__notifyDelegateOfNetworkAccessModeChanged__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    uint64_t v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)_notifyDelegateOfUpdatedProtectionMode
{
  v3 = [(_HMNetworkConfigurationProfile *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_HMAccessoryProfile *)self context];
    v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedProtectionMode__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    uint64_t v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)previewAllowedHostsForAutoProtectionModeWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_HMAccessoryProfile *)self context];
  if (!v4)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMNetworkConfigurationProfile previewAllowedHostsForAutoProtectionModeWithCompletionHandler:]", @"completionHandler"];
    v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v19;
      __int16 v25 = 2112;
      v26 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  v6 = (void *)v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v8 = [(_HMNetworkConfigurationProfile *)self messageDestination];
    v9 = [v7 messageWithName:@"HMNCP.pvAllowed" destination:v8 payload:0];

    objc_initWeak((id *)location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __96___HMNetworkConfigurationProfile_previewAllowedHostsForAutoProtectionModeWithCompletionHandler___block_invoke;
    v21[3] = &unk_1E5944188;
    objc_copyWeak(&v23, (id *)location);
    id v22 = v4;
    [v9 setResponseHandler:v21];
    id v10 = [v6 messageDispatcher];
    [v10 sendMessage:v9];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v14;
      __int16 v25 = 2080;
      v26 = "-[_HMNetworkConfigurationProfile previewAllowedHostsForAutoProtectionModeWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
    }
    v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

- (void)reconfigureWiFiWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HMAccessoryProfile *)self context];
  if (!v7)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMNetworkConfigurationProfile reconfigureWiFiWithOptions:completionHandler:]", @"completionHandler"];
    uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v30;
      __int16 v38 = 2112;
      v39 = (const char *)v26;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0];
    objc_exception_throw(v31);
  }
  v9 = (void *)v8;
  if (v8)
  {
    if ([(_HMNetworkConfigurationProfile *)self supportsWiFiReconfiguration])
    {
      v35[0] = @"credential-type";
      id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "credentialType"));
      v35[1] = @"rotate";
      v36[0] = v10;
      v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "rotate"));
      v36[1] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

      char v13 = (void *)MEMORY[0x1E4F654B0];
      id v14 = [(_HMNetworkConfigurationProfile *)self messageDestination];
      uint64_t v15 = [v13 messageWithName:@"HMNCP.wr" destination:v14 payload:v12];

      objc_initWeak((id *)location, self);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __79___HMNetworkConfigurationProfile_reconfigureWiFiWithOptions_completionHandler___block_invoke;
      v32[3] = &unk_1E5944188;
      objc_copyWeak(&v34, (id *)location);
      id v33 = v7;
      [v15 setResponseHandler:v32];
      v16 = [v9 messageDispatcher];
      [v16 sendMessage:v15];

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v21 = (void *)MEMORY[0x19F3A64A0]();
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)location = 138543362;
        *(void *)&location[4] = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Does not support Wi-Fi reconfiguration", location, 0xCu);
      }
      uint64_t v12 = [(_HMAccessoryProfile *)self context];
      v24 = [v12 delegateCaller];
      __int16 v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v24 callCompletion:v7 error:v25];
    }
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v20;
      __int16 v38 = 2080;
      v39 = "-[_HMNetworkConfigurationProfile reconfigureWiFiWithOptions:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (!v6)
  {
    BOOL v11 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = [v6 currentProtectionMode];
  uint64_t v9 = [v7 isNetworkAccessRestricted];
  uint64_t v10 = [v7 targetProtectionMode];
  if (v8 != [(_HMNetworkConfigurationProfile *)self currentProtectionMode])
  {
    [(_HMNetworkConfigurationProfile *)self setCurrentProtectionMode:v8];
    if (v10 == [(_HMNetworkConfigurationProfile *)self targetProtectionMode])
    {
LABEL_11:
      [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedProtectionMode];
      BOOL v11 = 1;
      goto LABEL_12;
    }
LABEL_10:
    [(_HMNetworkConfigurationProfile *)self setTargetProtectionMode:v10];
    goto LABEL_11;
  }
  if (v10 != [(_HMNetworkConfigurationProfile *)self targetProtectionMode]) {
    goto LABEL_10;
  }
  BOOL v11 = 0;
LABEL_12:
  if (v9 != [(_HMNetworkConfigurationProfile *)self isNetworkAccessRestricted])
  {
    [(_HMNetworkConfigurationProfile *)self setNetworkAccessRestricted:v9];
    [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfNetworkAccessModeChanged];
    BOOL v11 = 1;
  }
  uint64_t v12 = [v7 allowedHosts];
  char v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = [(_HMNetworkConfigurationProfile *)self allowedHosts];
  v16 = [v14 setWithArray:v15];

  if ((HMFEqualObjects() & 1) == 0)
  {
    [(_HMNetworkConfigurationProfile *)self setAllowedHosts:v12];
    [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedAllowedHosts];
    BOOL v11 = 1;
  }
  __int16 v17 = [v7 accessViolation];
  id v18 = [(_HMNetworkConfigurationProfile *)self accessViolation];
  char v19 = HMFEqualObjects();

  if ((v19 & 1) == 0)
  {
    [(_HMNetworkConfigurationProfile *)self setAccessViolation:v17];
    [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedAccessViolation];
    BOOL v11 = 1;
  }
  int v20 = [(_HMNetworkConfigurationProfile *)self supportsWiFiReconfiguration];
  if (v20 != [v7 supportsWiFiReconfiguration])
  {
    -[_HMNetworkConfigurationProfile setSupportsWiFiReconfiguration:](self, "setSupportsWiFiReconfiguration:", [v7 supportsWiFiReconfiguration]);
    [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedWiFiReconfigurationSupport];
    BOOL v11 = 1;
  }
  int64_t v21 = [(_HMNetworkConfigurationProfile *)self credentialType];
  if (v21 != [v7 credentialType])
  {
    -[_HMNetworkConfigurationProfile setCredentialType:](self, "setCredentialType:", [v7 credentialType]);
    [(_HMNetworkConfigurationProfile *)self _notifyDelegateOfUpdatedWiFiCredentialType];
    BOOL v11 = 1;
  }

LABEL_23:
  return v11;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(_HMNetworkConfigurationProfile *)self messageTargetUUID];
  uint64_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (id)messageTargetUUID
{
  v2 = [(_HMAccessoryProfile *)self accessory];
  id v3 = [v2 uuid];

  return v3;
}

- (void)setCredentialType:(int64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_credentialType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)credentialType
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  int64_t credentialType = self->_credentialType;
  os_unfair_lock_unlock(p_lock);
  return credentialType;
}

- (void)setSupportsWiFiReconfiguration:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_supportsWiFiReconfiguration + 4) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsWiFiReconfiguration
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_supportsWiFiReconfiguration + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setTargetProtectionMode:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int64_t targetProtectionMode = v6->_targetProtectionMode;
    int v10 = 138543874;
    BOOL v11 = v8;
    __int16 v12 = 2048;
    int64_t v13 = targetProtectionMode;
    __int16 v14 = 2048;
    int64_t v15 = a3;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing target protection mode from: %ld, to: %ld", (uint8_t *)&v10, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  v6->_int64_t targetProtectionMode = a3;
  os_unfair_lock_unlock(&v6->super._lock);
}

- (int64_t)targetProtectionMode
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  int64_t targetProtectionMode = self->_targetProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return targetProtectionMode;
}

- (void)setNetworkAccessRestricted:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_supportsWiFiReconfiguration + 3) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isNetworkAccessRestricted
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_supportsWiFiReconfiguration + 3);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCurrentProtectionMode:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int64_t currentProtectionMode = v6->_currentProtectionMode;
    int v10 = 138543874;
    BOOL v11 = v8;
    __int16 v12 = 2048;
    int64_t v13 = currentProtectionMode;
    __int16 v14 = 2048;
    int64_t v15 = a3;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing current protection mode from: %ld, to: %ld", (uint8_t *)&v10, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  v6->_int64_t currentProtectionMode = a3;
  os_unfair_lock_unlock(&v6->super._lock);
}

- (int64_t)currentProtectionMode
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  int64_t currentProtectionMode = self->_currentProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return currentProtectionMode;
}

- (void)setAccessViolation:(id)a3
{
  id v4 = (HMAccessoryNetworkAccessViolation *)a3;
  os_unfair_lock_lock_with_options();
  accessViolation = self->_accessViolation;
  self->_accessViolation = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMAccessoryNetworkAccessViolation)accessViolation
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accessViolation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAllowedHosts:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  allowedHosts = self->_allowedHosts;
  self->_allowedHosts = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)allowedHosts
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_allowedHosts copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25 != -1) {
    dispatch_once(&logCategory__hmf_once_t25, &__block_literal_global_25335);
  }
  v2 = (void *)logCategory__hmf_once_v26;

  return v2;
}

@end