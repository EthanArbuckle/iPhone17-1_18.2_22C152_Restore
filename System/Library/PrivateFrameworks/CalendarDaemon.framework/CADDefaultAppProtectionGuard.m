@interface CADDefaultAppProtectionGuard
+ (id)shared;
- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantedByEntitlement:(BOOL)a5 completion:(id)a6;
@end

@implementation CADDefaultAppProtectionGuard

void __159__CADDefaultAppProtectionGuard_initiateAuthenticationForApplicationWithBundleIdentifier_onBehalfOfProcessWithAuditToken_accessGrantedByEntitlement_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = CADLogHandle;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v5;
      v7 = "CADDefaultAppProtectionGuard: initiateAuth error: %@";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    v7 = "CADDefaultAppProtectionGuard: initiateAuth finished with success.";
    v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 2;
LABEL_7:
    _os_log_impl(&dword_1BBC88000, v8, v9, v7, (uint8_t *)&v11, v10);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantedByEntitlement:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    int v11 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v9];
    id v12 = [MEMORY[0x1E4F4B7E8] sharedGuard];
    if (v7) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __159__CADDefaultAppProtectionGuard_initiateAuthenticationForApplicationWithBundleIdentifier_onBehalfOfProcessWithAuditToken_accessGrantedByEntitlement_completion___block_invoke;
    v16[3] = &unk_1E624D980;
    id v17 = v10;
    long long v14 = *(_OWORD *)&a4->var0[4];
    v15[0] = *(_OWORD *)a4->var0;
    v15[1] = v14;
    [v12 initiateAuthenticationWithShieldingForSubject:v11 onBehalfOfProcessWithAuditToken:v15 accessGrantReason:v13 completion:v16];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)shared_guard;
  return v2;
}

uint64_t __38__CADDefaultAppProtectionGuard_shared__block_invoke()
{
  v0 = objc_alloc_init(CADDefaultAppProtectionGuard);
  shared_guard = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

@end