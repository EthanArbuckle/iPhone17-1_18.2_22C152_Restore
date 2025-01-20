@interface FBSSignatureValidationService
- (BOOL)authoritative;
- (FBSSignatureValidationService)init;
- (id)_initWithMISInterfaceWrapper:(id)a3;
- (unint64_t)_validateApp:(id)a3;
- (unint64_t)_validateAppStoreApp:(id)a3;
- (unint64_t)_validateNonAppStoreApp:(id)a3;
- (unint64_t)trustStateForApplication:(id)a3;
- (unsigned)signatureVersionForApp:(id)a3;
- (void)_logTrustState:(unint64_t)a3 forApp:(id)a4 reason:(id)a5;
- (void)setAuthoritative:(BOOL)a3;
@end

@implementation FBSSignatureValidationService

- (unint64_t)trustStateForApplication:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"appInfo"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSSignatureValidationService *)a2 trustStateForApplication:(uint64_t)v9];
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  v6 = v5;
  kdebug_trace();
  if ((unint64_t)[v6 type] >= 2) {
    unint64_t v7 = [(FBSSignatureValidationService *)self _validateApp:v6];
  }
  else {
    unint64_t v7 = 8;
  }
  kdebug_trace();

  return v7;
}

- (FBSSignatureValidationService)init
{
  v3 = objc_opt_new();
  v4 = [(FBSSignatureValidationService *)self _initWithMISInterfaceWrapper:v3];

  return v4;
}

- (id)_initWithMISInterfaceWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSSignatureValidationService;
  v6 = [(FBSSignatureValidationService *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_misInterfaceWrapper, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (unsigned)signatureVersionForApp:(id)a3
{
  unsigned int v7 = 0;
  misInterfaceWrapper = self->_misInterfaceWrapper;
  v4 = [a3 bundleURL];
  id v5 = [v4 path];
  [(_FBSMISInterfaceWrapper *)misInterfaceWrapper signatureVersion:v5 version:&v7];

  return v7;
}

- (unint64_t)_validateAppStoreApp:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)getMISLaunchWarningDatabaseClass());
  v6 = [v4 executableURL];
  id v13 = 0;
  unsigned int v7 = [v5 queryForExecutableURL:v6 withError:&v13];
  id v8 = v13;
  if (!v7)
  {
    v11 = FBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(FBSSignatureValidationService *)(uint64_t)v6 _validateAppStoreApp:v11];
    }

    goto LABEL_10;
  }
  if (![v7 warningState] || [v7 isUserOverridden])
  {
LABEL_10:
    unint64_t v10 = 8;
    goto LABEL_11;
  }
  objc_super v9 = FBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "Blocking bundle with outstanding launch warning: %{public}@", buf, 0xCu);
  }

  unint64_t v10 = 2;
  [(FBSSignatureValidationService *)self _logTrustState:2 forApp:v4 reason:@"Deny-Listed"];
LABEL_11:

  return v10;
}

- (unint64_t)_validateNonAppStoreApp:(id)a3
{
  id v4 = a3;
  if (self->_authoritative) {
    id v5 = (void *)getkMISValidationOptionAuthoritativeLaunch();
  }
  else {
    id v5 = (void *)getkMISValidationOptionUnauthoritativeLaunch();
  }
  id v6 = v5;
  unsigned int v7 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:MEMORY[0x1E4F1CC38] forKey:v6];
  id v8 = [v4 executableURL];
  objc_super v9 = [v8 path];

  if (v9) {
    [v7 setObject:v9 forKey:getkMISValidationOptionHintMainExecutablePath()];
  }
  misInterfaceWrapper = self->_misInterfaceWrapper;
  v11 = [v4 bundleURL];
  v12 = [v11 path];
  uint64_t v13 = [(_FBSMISInterfaceWrapper *)misInterfaceWrapper validateSignatureForPath:v12 options:v7 userInfo:0];

  if (v13)
  {
    v24 = 0;
    v14 = @"Provisioning Profile Not Found";
    switch(v13)
    {
      case 0xE8008009:
      case 0xE800800E:
      case 0xE800800F:
      case 0xE8008012:
      case 0xE8008013:
      case 0xE8008014:
      case 0xE8008017:
      case 0xE8008018:
      case 0xE8008019:
      case 0xE800801A:
      case 0xE800801C:
      case 0xE8008021:
      case 0xE8008027:
        v24 = (const void *)soft_MISCopyErrorStringForErrorCode(v13);
        v15 = [NSString stringWithFormat:@"Error - %d: reason: %@", v13, v24];
        unint64_t v16 = 1;
        [(FBSSignatureValidationService *)self _logTrustState:1 forApp:v4 reason:v15];
        int v17 = 0;
        goto LABEL_9;
      case 0xE8008011:
        unint64_t v16 = 3;
        [(FBSSignatureValidationService *)self _logTrustState:3 forApp:v4 reason:@"Provisioning Profile Expired"];
        goto LABEL_21;
      case 0xE8008015:
      case 0xE800801E:
        goto LABEL_14;
      case 0xE8008016:
        v14 = @"Profile contains entitlements it's not allowed to have (possibly because we're missing a provisioning profile?)";
LABEL_14:
        unint64_t v16 = 4;
        [(FBSSignatureValidationService *)self _logTrustState:4 forApp:v4 reason:v14];
        goto LABEL_21;
      case 0xE800801D:
        unint64_t v16 = 2;
        [(FBSSignatureValidationService *)self _logTrustState:2 forApp:v4 reason:@"Deny-Listed"];
        goto LABEL_21;
      case 0xE8008024:
        unint64_t v16 = 5;
        [(FBSSignatureValidationService *)self _logTrustState:5 forApp:v4 reason:@"Profile revoked by originator (banned)"];
        goto LABEL_21;
      case 0xE8008025:
        unint64_t v16 = 7;
        [(FBSSignatureValidationService *)self _logTrustState:7 forApp:v4 reason:@"User hasn't trusted the profile."];
        goto LABEL_21;
      case 0xE8008026:
        unint64_t v16 = 6;
        [(FBSSignatureValidationService *)self _logTrustState:6 forApp:v4 reason:@"Requires Network Validation"];
        goto LABEL_21;
      case 0xE8008029:
        unint64_t v16 = 9;
        [(FBSSignatureValidationService *)self _logTrustState:9 forApp:v4 reason:@"Signature version no longer supported"];
        goto LABEL_21;
      case 0xE800802B:
        unint64_t v16 = 10;
        [(FBSSignatureValidationService *)self _logTrustState:10 forApp:v4 reason:@"Developer mode is required to run this application"];
LABEL_21:
        int v17 = 0;
        break;
      default:
        v24 = (const void *)soft_MISCopyErrorStringForErrorCode(v13);
        v15 = [NSString stringWithFormat:@"Error - %d: reason: %@", v13, v24];
        [(FBSSignatureValidationService *)self _logTrustState:0 forApp:v4 reason:v15];
        unint64_t v16 = 0;
        int v17 = 1;
LABEL_9:

        break;
    }
    int v18 = [v4 isProvisioningProfileValidated];
    if (v13 == -402620378) {
      int v19 = 1;
    }
    else {
      int v19 = v17;
    }
    if ((v18 & v19) == 1)
    {
      if (_validateNonAppStoreApp__onceToken != -1) {
        dispatch_once(&_validateNonAppStoreApp__onceToken, &__block_literal_global_0);
      }
      v20 = _validateNonAppStoreApp__queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__FBSSignatureValidationService__validateNonAppStoreApp___block_invoke_2;
      block[3] = &unk_1E58F4AB0;
      block[4] = self;
      id v23 = v4;
      dispatch_async(v20, block);
    }
    fbs_release(&v24);
  }
  else
  {
    unint64_t v16 = 8;
  }

  return v16;
}

void __57__FBSSignatureValidationService__validateNonAppStoreApp___block_invoke()
{
}

void __57__FBSSignatureValidationService__validateNonAppStoreApp___block_invoke_2(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = getkMISValidationOptionOnlineAuthorization();
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  v9[0] = MEMORY[0x1E4F1CC38];
  v8[1] = getkMISValidationOptionOnlineCheckType();
  v9[1] = &unk_1EED3FAE8;
  v8[2] = getkMISValidationOptionUnauthoritativeLaunch();
  v9[2] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = [v4 bundleURL];
  unsigned int v7 = [v6 path];
  [v5 validateSignatureForPath:v7 options:v3 userInfo:0];
}

- (unint64_t)_validateApp:(id)a3
{
  id v4 = a3;
  if ([v4 isProvisioningProfileValidated]) {
    unint64_t v5 = [(FBSSignatureValidationService *)self _validateNonAppStoreApp:v4];
  }
  else {
    unint64_t v5 = [(FBSSignatureValidationService *)self _validateAppStoreApp:v4];
  }
  unint64_t v6 = v5;

  return v6;
}

- (void)_logTrustState:(unint64_t)a3 forApp:(id)a4 reason:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = FBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = [v7 bundleIdentifier];
    v11 = NSStringFromFBSApplicationTrustState(a3);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ - signature state: %{public}@, reason: %{public}@", (uint8_t *)&v12, 0x20u);
  }
}

- (BOOL)authoritative
{
  return self->_authoritative;
}

- (void)setAuthoritative:(BOOL)a3
{
  self->_authoritative = a3;
}

- (void)trustStateForApplication:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = NSStringFromSelector(a1);
  unint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  objc_super v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSSignatureValidationService.m";
  __int16 v16 = 1024;
  int v17 = 97;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_validateAppStoreApp:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C680000, log, OS_LOG_TYPE_ERROR, "Error checking for launch warning mark: %{public}@, %{public}@", (uint8_t *)&v3, 0x16u);
}

@end