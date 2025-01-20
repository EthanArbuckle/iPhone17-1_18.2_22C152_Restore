@interface HMHomeAccessControl
- (BOOL)isAccessAllowed;
- (BOOL)isAdministrator;
- (BOOL)isAnnounceAccessAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwner;
- (BOOL)isRemoteAccessAllowed;
- (BOOL)isRestrictedGuest;
- (BOOL)isRestrictedGuestInAllowedPeriod;
- (HMHomeAccessControl)initWithUser:(id)a3 allowAccess:(BOOL)a4 owner:(BOOL)a5 administratorPrivilege:(BOOL)a6 remoteAccess:(BOOL)a7 presenceAuthStatus:(id)a8 presenceComputeStatus:(id)a9 announceAccess:(BOOL)a10 camerasAccess:(id)a11 audioAnalysisUserDropInAccessLevel:(unint64_t)a12 restrictedGuest:(BOOL)a13 restrictedGuestAccessSettings:(id)a14;
- (HMRestrictedGuestHomeAccessSettings)restrictedGuestAccessSettings;
- (HMUserCameraAccess)camerasAccess;
- (HMUserPresenceAuthorization)presenceAuthStatus;
- (HMUserPresenceCompute)presenceComputeStatus;
- (unint64_t)accessNotAllowedReasonCode;
- (unint64_t)audioAnalysisUserDropInAccessLevel;
- (unint64_t)camerasAccessLevel;
- (unint64_t)presenceAuthorizationStatus;
- (unint64_t)presenceComputationStatus;
- (void)_updateAccessForUser:(id)a3 restrictedGuestAccessSettings:(id)a4 completionHandler:(id)a5;
- (void)setAccessAllowed:(BOOL)a3;
- (void)setAccessNotAllowedReasonCode:(unint64_t)a3;
- (void)setAdministrator:(BOOL)a3;
- (void)setAnnounceAccessAllowed:(BOOL)a3;
- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3;
- (void)setAudioAnalysisUserDropinAccessLevel:(unint64_t)a3;
- (void)setCamerasAccess:(id)a3;
- (void)setOwner:(BOOL)a3;
- (void)setPresenceAuthStatus:(id)a3;
- (void)setPresenceComputeStatus:(id)a3;
- (void)setRemoteAccessAllowed:(BOOL)a3;
- (void)setRestrictedGuest:(BOOL)a3;
- (void)setRestrictedGuestAccessSettings:(id)a3;
- (void)setRestrictedGuestInAllowedPeriod:(BOOL)a3;
- (void)setUserAccessSettings:(id)a3;
- (void)updateAdministratorAccess:(BOOL)a3 completionHandler:(id)a4;
- (void)updateAnnounceAccess:(BOOL)a3 completionHandler:(id)a4;
- (void)updateAudioAnalysisUserDropinAccessLevel:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateCamerasAccessLevel:(unint64_t)a3 completionHandler:(id)a4;
- (void)updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateRemoteAccess:(BOOL)a3 completionHandler:(id)a4;
- (void)updateRestrictedGuestSchedule:(id)a3 completionHandler:(id)a4;
- (void)updateRestrictedGuestSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation HMHomeAccessControl

- (BOOL)isAccessAllowed
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_restrictedGuestInAllowedPeriod;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAdministrator
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_restrictedGuest;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isOwner
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_announceAccessAllowed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isRestrictedGuest
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = BYTE1(v2->_presenceAuthStatus);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMRestrictedGuestHomeAccessSettings)restrictedGuestAccessSettings
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accessNotAllowedReasonCode;
  os_unfair_lock_unlock(p_lock);

  return (HMRestrictedGuestHomeAccessSettings *)v4;
}

- (HMHomeAccessControl)initWithUser:(id)a3 allowAccess:(BOOL)a4 owner:(BOOL)a5 administratorPrivilege:(BOOL)a6 remoteAccess:(BOOL)a7 presenceAuthStatus:(id)a8 presenceComputeStatus:(id)a9 announceAccess:(BOOL)a10 camerasAccess:(id)a11 audioAnalysisUserDropInAccessLevel:(unint64_t)a12 restrictedGuest:(BOOL)a13 restrictedGuestAccessSettings:(id)a14
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v31 = a8;
  id v30 = a9;
  id v29 = a11;
  id v28 = a14;
  v32.receiver = self;
  v32.super_class = (Class)HMHomeAccessControl;
  v21 = [(HMAccessControl *)&v32 initWithUser:v20];
  v22 = v21;
  if (v21)
  {
    v21->_restrictedGuestInAllowedPeriod = a4;
    v21->_announceAccessAllowed = a5;
    v21->_restrictedGuest = a6;
    *(&v21->_restrictedGuestInAllowedPeriod + 1) = a7;
    objc_storeStrong((id *)&v21->_presenceComputeStatus, a8);
    objc_storeStrong((id *)&v22->_camerasAccess, a9);
    objc_storeStrong((id *)&v22->_restrictedGuestAccessSettings, a11);
    LOBYTE(v22->_presenceAuthStatus) = a10;
    v22[1].super.super.isa = (Class)a12;
    BYTE1(v22->_presenceAuthStatus) = a13;
    objc_storeStrong((id *)&v22->_accessNotAllowedReasonCode, a14);
    if (BYTE1(v22->_presenceAuthStatus))
    {
      if (!v22->_accessNotAllowedReasonCode)
      {
        v23 = (void *)MEMORY[0x19F3A64A0]();
        v24 = v22;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v34 = v26;
          _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_FAULT, "%{public}@restricted guest cannot exist without its access settings object", buf, 0xCu);
        }
      }
    }
  }

  return v22;
}

- (BOOL)isAnnounceAccessAllowed
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_presenceAuthStatus;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessNotAllowedReasonCode, 0);
  objc_storeStrong((id *)&self->_restrictedGuestAccessSettings, 0);
  objc_storeStrong((id *)&self->_camerasAccess, 0);

  objc_storeStrong((id *)&self->_presenceComputeStatus, 0);
}

- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3
{
  self[1].super.super.isa = (Class)a3;
}

- (void)setRestrictedGuestInAllowedPeriod:(BOOL)a3
{
  BYTE2(self->_presenceAuthStatus) = a3;
}

- (void)setAccessNotAllowedReasonCode:(unint64_t)a3
{
  self->_audioAnalysisUserDropInAccessLevel = a3;
}

- (unint64_t)accessNotAllowedReasonCode
{
  return self->_audioAnalysisUserDropInAccessLevel;
}

- (void)setRestrictedGuestAccessSettings:(id)a3
{
}

- (void)_updateAccessForUser:(id)a3 restrictedGuestAccessSettings:(id)a4 completionHandler:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 home];
  uint64_t v12 = [v11 context];
  if (!v10)
  {
    uint64_t v32 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeAccessControl _updateAccessForUser:restrictedGuestAccessSettings:completionHandler:]", @"completion"];
    v33 = (void *)MEMORY[0x19F3A64A0]();
    v34 = self;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v36;
      __int16 v50 = 2112;
      v51 = (const char *)v32;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v37 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v32 userInfo:0];
    objc_exception_throw(v37);
  }
  v13 = (void *)v12;
  if (v12)
  {
    v39 = (void *)v12;
    v14 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
    v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = v11;
      v19 = id v18 = v9;
      id v20 = [v14 UUID];
      v21 = [v8 userID];
      *(_DWORD *)buf = 138544130;
      v49 = v19;
      __int16 v50 = 2112;
      v51 = v20;
      __int16 v52 = 2112;
      id v53 = v18;
      __int16 v54 = 2112;
      v55 = v21;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating restricted guest settings: %@ for userID: %@", buf, 0x2Au);

      id v9 = v18;
      v11 = v38;
    }

    v46[0] = @"kUserIDKey";
    v22 = [v8 userID];
    v47[0] = v22;
    v46[1] = @"HMRestrictedGuestHomeAccessControlSettingsKey";
    v23 = encodeRootObject(v9);
    v47[1] = v23;
    v46[2] = *MEMORY[0x1E4F64F08];
    v24 = HMFEncodedRootObject();
    v47[2] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];

    v26 = [v11 uuid];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __92__HMHomeAccessControl__updateAccessForUser_restrictedGuestAccessSettings_completionHandler___block_invoke;
    v40[3] = &unk_1E593EA88;
    v40[4] = v16;
    id v41 = v14;
    id v42 = v8;
    id v43 = v39;
    id v45 = v10;
    id v44 = v9;
    id v27 = v14;
    v13 = v39;
    -[_HMContext sendMessage:target:payload:responseHandler:](v43, @"HMUpdateRestrictedGuestSettingsMessage", v26, v25, v40);
  }
  else
  {
    id v28 = (void *)MEMORY[0x19F3A64A0]();
    id v29 = self;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v31;
      __int16 v50 = 2080;
      v51 = "-[HMHomeAccessControl _updateAccessForUser:restrictedGuestAccessSettings:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v10 + 2))(v10, v25);
  }
}

void __92__HMHomeAccessControl__updateAccessForUser_restrictedGuestAccessSettings_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      v11 = [*(id *)(a1 + 40) UUID];
      uint64_t v12 = [*(id *)(a1 + 48) userID];
      int v24 = 138544130;
      v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update restricted guest settings for userID:%@, error: %@", (uint8_t *)&v24, 0x2Au);
    }
    v13 = [*(id *)(a1 + 56) delegateCaller];
    v14 = v13;
    uint64_t v15 = *(void *)(a1 + 72);
    id v16 = v5;
  }
  else
  {
    v17 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) setRestrictedGuestAccessSettings:*(void *)(a1 + 64)]);
    id v18 = *(id *)(a1 + 32);
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      v21 = [*(id *)(a1 + 40) UUID];
      v22 = [*(id *)(a1 + 48) userID];
      v23 = *(void **)(a1 + 64);
      int v24 = 138544130;
      v25 = v20;
      __int16 v26 = 2112;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully updated restricted guest settings for userID:%@, settings: %@", (uint8_t *)&v24, 0x2Au);
    }
    v13 = [*(id *)(a1 + 56) delegateCaller];
    v14 = v13;
    uint64_t v15 = *(void *)(a1 + 72);
    id v16 = 0;
  }
  [v13 callCompletion:v15 error:v16];
}

- (void)updateRestrictedGuestSettings:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(HMAccessControl *)self user];
  uint64_t v9 = [v8 home];
  if (!v7)
  {
    uint64_t v30 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeAccessControl updateRestrictedGuestSettings:completionHandler:]", @"completion"];
    id v31 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v37 = v34;
      __int16 v38 = 2112;
      uint64_t v39 = v30;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    objc_exception_throw(v35);
  }
  id v10 = (void *)v9;
  if (!v8 || ([v8 userID], v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      uint64_t v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
LABEL_13:
      id v18 = (void *)v17;
      v7[2](v7, v17);

      goto LABEL_14;
    }
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v37 = v15;
    id v16 = "%{public}@Cannot update user access settings, user not present";
LABEL_11:
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_12;
  }
  if (!v10)
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v37 = v15;
    id v16 = "%{public}@Missing home, can't update user access settings";
    goto LABEL_11;
  }
  if (![(HMHomeAccessControl *)self isRestrictedGuest])
  {
    v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v37 = v22;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot update user access settings, user is not a restricted guest", buf, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2901];
    goto LABEL_13;
  }
  if (!v6)
  {
    v23 = (void *)MEMORY[0x19F3A64A0]();
    int v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v37 = v26;
      id v27 = "%{public}@Cannot update user access settings, user access settings is nil";
      __int16 v28 = v25;
      uint32_t v29 = 12;
LABEL_24:
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    }
LABEL_25:

    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    goto LABEL_13;
  }
  if (([v6 doAllAccessoriesBelongToHome:v10] & 1) == 0)
  {
    v23 = (void *)MEMORY[0x19F3A64A0]();
    int v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v37 = v26;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v10;
      id v27 = "%{public}@Cannot update user access settings, not all accessories belong to the home : %@";
      __int16 v28 = v25;
      uint32_t v29 = 22;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  [(HMHomeAccessControl *)self _updateAccessForUser:v8 restrictedGuestAccessSettings:v6 completionHandler:v7];
LABEL_14:
}

- (void)updateRestrictedGuestSchedule:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = [(HMHomeAccessControl *)self restrictedGuestAccessSettings];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = (void *)[v8 mutableCopy];
    [v10 setGuestAccessSchedule:v6];
    v11 = (void *)[v10 copy];
    [(HMHomeAccessControl *)self updateRestrictedGuestSettings:v11 completionHandler:v7];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot update restricted guest schedule, existing accessSettings are nil.", (uint8_t *)&v16, 0xCu);
    }
    id v10 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2901];
    v7[2](v7, v10);
  }
}

- (BOOL)isRestrictedGuestInAllowedPeriod
{
  v3 = [(HMHomeAccessControl *)self restrictedGuestAccessSettings];
  id v4 = [v3 guestAccessSchedule];

  if (!v4) {
    return 1;
  }
  id v5 = [(HMAccessControl *)self user];
  id v6 = [v5 home];

  v7 = [v6 timeZone];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  }
  v11 = v9;

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  v13 = [(HMHomeAccessControl *)self restrictedGuestAccessSettings];
  v14 = [v13 guestAccessSchedule];
  BOOL v15 = +[HMRestrictedGuestHomeAccessSchedule isDate:v12 withinAllowedTimeForSchedule:v14 forHomeInTimeZone:v11];

  return v15;
}

- (void)setUserAccessSettings:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  accessNotAllowedReasonCode = (void *)self->_accessNotAllowedReasonCode;
  self->_accessNotAllowedReasonCode = (unint64_t)v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setRestrictedGuest:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  BYTE1(self->_presenceAuthStatus) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)updateAnnounceAccess:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t))a4;
  v7 = [(HMAccessControl *)self user];
  uint64_t v8 = [v7 home];
  if (!v6)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeAccessControl updateAnnounceAccess:completionHandler:]", @"completion"];
    v22 = (void *)MEMORY[0x19F3A64A0]();
    v23 = self;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v28 = v25;
      __int16 v29 = 2112;
      uint64_t v30 = v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v9 = (void *)v8;
  if (!v7)
  {
    BOOL v15 = (void *)MEMORY[0x19F3A64A0]();
    int v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v18;
      v19 = "%{public}@Cannot update announce, user not present";
LABEL_12:
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
    }
LABEL_13:

    uint64_t v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    goto LABEL_14;
  }
  if (!v8)
  {
    BOOL v15 = (void *)MEMORY[0x19F3A64A0]();
    int v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v18;
      v19 = "%{public}@Missing home, can't update announce access";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (![(HMHomeAccessControl *)self isRestrictedGuest])
  {
    id v20 = [v7 userID];
    [v9 updateAccessForUser:v20 announceAccess:v4 completionHandler:v6];
    goto LABEL_15;
  }
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v28 = v13;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot update announce access for the user as they are the restricted guest", buf, 0xCu);
  }
  uint64_t v14 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2902];
LABEL_14:
  id v20 = (void *)v14;
  v6[2](v6, v14);
LABEL_15:
}

- (void)updateCamerasAccessLevel:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v28);
  }
  v7 = (void (**)(void, void))v6;
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    uint64_t v12 = HMUserCameraAccessLevelAsString(a3);
    int v29 = 138543618;
    uint64_t v30 = v11;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating cameras access level to %@", (uint8_t *)&v29, 0x16u);
  }
  v13 = [(HMAccessControl *)v9 user];
  uint64_t v14 = v13;
  if (v13)
  {
    BOOL v15 = [v13 home];
    if (v15)
    {
      if (![(HMHomeAccessControl *)v9 isRestrictedGuest])
      {
        id v27 = [v14 userID];
        [v15 updateAccessForUser:v27 camerasAccessLevel:a3 completionHandler:v7];
        goto LABEL_18;
      }
      int v16 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v17 = v9;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v29 = 138543362;
        uint64_t v30 = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update cameras access level for the user as they are the restricted guest", (uint8_t *)&v29, 0xCu);
      }
      uint64_t v20 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2902];
    }
    else
    {
      int v24 = (void *)MEMORY[0x19F3A64A0]();
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        int v29 = 138543362;
        uint64_t v30 = v26;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home not present", (uint8_t *)&v29, 0xCu);
      }
      uint64_t v20 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    }
    id v27 = (void *)v20;
    v7[2](v7, v20);
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    int v29 = 138543362;
    uint64_t v30 = v23;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@User not present", (uint8_t *)&v29, 0xCu);
  }
  BOOL v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  ((void (**)(void, void *))v7)[2](v7, v15);
LABEL_19:
}

- (void)updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  if ([(HMHomeAccessControl *)self isRestrictedGuest])
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot update presence authorization status for the user as they are the restricted guest", (uint8_t *)&v13, 0xCu);
    }
    v11 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2902];
    v6[2](v6, v11);
  }
  else
  {
    uint64_t v12 = [(HMAccessControl *)self user];
    [v12 updatePresenceAuthorizationStatus:a3 completionHandler:v6];
  }
}

- (void)updateRemoteAccess:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = [(HMAccessControl *)self user];
  v7 = [v6 home];
  if (v7)
  {
    uint64_t v8 = [v6 userID];
    [v7 updateAccessForUser:v8 remoteAccess:v4 completionHandler:v9];
  }
}

- (void)updateAdministratorAccess:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  v7 = [(HMAccessControl *)self user];
  uint64_t v8 = [v7 home];
  if (v8)
  {
    if ([(HMHomeAccessControl *)self isRestrictedGuest])
    {
      id v9 = (void *)MEMORY[0x19F3A64A0]();
      id v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v15 = 138543362;
        int v16 = v12;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot update restricted guest user to administrator", (uint8_t *)&v15, 0xCu);
      }
      int v13 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2902];
      v6[2](v6, v13);
    }
    else
    {
      uint64_t v14 = [v7 userID];
      [v8 updateAccessForUser:v14 administrator:v4 completionHandler:v6];
    }
  }
}

- (void)updateAudioAnalysisUserDropinAccessLevel:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  v7 = [(HMAccessControl *)self user];
  uint64_t v8 = [v7 home];
  if (!v6)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeAccessControl updateAudioAnalysisUserDropinAccessLevel:completionHandler:]", @"completion"];
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v29;
      __int16 v33 = 2112;
      uint64_t v34 = v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  id v9 = (void *)v8;
  if (v7)
  {
    if (v8)
    {
      if (![(HMHomeAccessControl *)self isRestrictedGuest])
      {
        int v24 = [v7 userID];
        [v9 updateAccessForUser:v24 audioAnalysisUserDropinAccessLevel:a3 completionHandler:v6];
        goto LABEL_15;
      }
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v13;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot update audio analysis dropin, user is a restricted guest", buf, 0xCu);
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 2902;
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot update audio analysis dropin, home not present", buf, 0xCu);
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 2018;
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update audio analysis dropin, user not present", buf, 0xCu);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 2019;
  }
  int v24 = [v14 hmPrivateErrorWithCode:v15];
  v6[2](v6, v24);
LABEL_15:
}

- (unint64_t)audioAnalysisUserDropInAccessLevel
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  Class isa = self[1].super.super.isa;
  os_unfair_lock_unlock(p_lock);
  return (unint64_t)isa;
}

- (void)setAudioAnalysisUserDropinAccessLevel:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self[1].super.super.Class isa = (Class)a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setAnnounceAccessAllowed:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(self->_presenceAuthStatus) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)camerasAccessLevel
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(HMRestrictedGuestHomeAccessSettings *)self->_restrictedGuestAccessSettings value];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCamerasAccess:(id)a3
{
  unint64_t v4 = (HMRestrictedGuestHomeAccessSettings *)a3;
  os_unfair_lock_lock_with_options();
  restrictedGuestAccessSettings = self->_restrictedGuestAccessSettings;
  self->_restrictedGuestAccessSettings = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMUserCameraAccess)camerasAccess
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = self->_restrictedGuestAccessSettings;
  os_unfair_lock_unlock(p_lock);

  return (HMUserCameraAccess *)v4;
}

- (unint64_t)presenceComputationStatus
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(HMUserCameraAccess *)self->_camerasAccess value];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)presenceAuthorizationStatus
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(HMUserPresenceCompute *)self->_presenceComputeStatus value];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPresenceComputeStatus:(id)a3
{
  unint64_t v4 = (HMUserCameraAccess *)a3;
  os_unfair_lock_lock_with_options();
  camerasAccess = self->_camerasAccess;
  self->_camerasAccess = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMUserPresenceCompute)presenceComputeStatus
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = self->_camerasAccess;
  os_unfair_lock_unlock(p_lock);

  return (HMUserPresenceCompute *)v4;
}

- (void)setPresenceAuthStatus:(id)a3
{
  unint64_t v4 = (HMUserPresenceCompute *)a3;
  os_unfair_lock_lock_with_options();
  presenceComputeStatus = self->_presenceComputeStatus;
  self->_presenceComputeStatus = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = self->_presenceComputeStatus;
  os_unfair_lock_unlock(p_lock);

  return (HMUserPresenceAuthorization *)v4;
}

- (void)setRemoteAccessAllowed:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_restrictedGuestInAllowedPeriod + 1) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isRemoteAccessAllowed
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_restrictedGuestInAllowedPeriod + 1);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAccessAllowed:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_restrictedGuestInAllowedPeriod = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setAdministrator:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_restrictedGuest = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setOwner:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_announceAccessAllowed = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HMHomeAccessControl *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HMHomeAccessControl;
    if ([(HMAccessControl *)&v24 isEqual:v4])
    {
      id v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      v7 = v6;

      if (!v7) {
        goto LABEL_17;
      }
      BOOL v8 = [(HMHomeAccessControl *)self isAccessAllowed];
      if (v8 != [(HMHomeAccessControl *)v7 isAccessAllowed]) {
        goto LABEL_17;
      }
      BOOL v9 = [(HMHomeAccessControl *)self isAdministrator];
      if (v9 != [(HMHomeAccessControl *)v7 isAdministrator]) {
        goto LABEL_17;
      }
      BOOL v10 = [(HMHomeAccessControl *)self isOwner];
      if (v10 != [(HMHomeAccessControl *)v7 isOwner]) {
        goto LABEL_17;
      }
      BOOL v11 = [(HMHomeAccessControl *)self isRemoteAccessAllowed];
      if (v11 != [(HMHomeAccessControl *)v7 isRemoteAccessAllowed]) {
        goto LABEL_17;
      }
      unint64_t v12 = [(HMHomeAccessControl *)self presenceAuthorizationStatus];
      if (v12 != [(HMHomeAccessControl *)v7 presenceAuthorizationStatus]) {
        goto LABEL_17;
      }
      unint64_t v13 = [(HMHomeAccessControl *)self presenceComputationStatus];
      if (v13 != [(HMHomeAccessControl *)v7 presenceComputationStatus]) {
        goto LABEL_17;
      }
      uint64_t v14 = [(HMHomeAccessControl *)self camerasAccess];
      uint64_t v15 = [(HMHomeAccessControl *)v7 camerasAccess];
      int v16 = [v14 isEqual:v15];

      if (!v16) {
        goto LABEL_17;
      }
      BOOL v17 = [(HMHomeAccessControl *)self isAnnounceAccessAllowed];
      if (v17 == [(HMHomeAccessControl *)v7 isAnnounceAccessAllowed]
        && (unint64_t v18 = [(HMHomeAccessControl *)self audioAnalysisUserDropInAccessLevel],
            v18 == [(HMHomeAccessControl *)v7 audioAnalysisUserDropInAccessLevel])
        && (BOOL v19 = [(HMHomeAccessControl *)self isRestrictedGuest],
            v19 == [(HMHomeAccessControl *)v7 isRestrictedGuest]))
      {
        v22 = [(HMHomeAccessControl *)self restrictedGuestAccessSettings];
        v23 = [(HMHomeAccessControl *)v7 restrictedGuestAccessSettings];
        char v20 = HMFEqualObjects();
      }
      else
      {
LABEL_17:
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }

  return v20;
}

@end