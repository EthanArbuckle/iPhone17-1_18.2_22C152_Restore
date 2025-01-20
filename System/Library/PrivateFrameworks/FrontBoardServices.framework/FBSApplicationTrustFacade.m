@interface FBSApplicationTrustFacade
- (unint64_t)trustStateForApplication:(id)a3;
@end

@implementation FBSApplicationTrustFacade

- (unint64_t)trustStateForApplication:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_legacyProvider)
  {
    v6 = [FBSLegacySignatureValidationService alloc];
    v7 = +[FBSProfileManager sharedInstance];
    v8 = [v5 signerIdentity];
    v9 = [v7 profilesForSignerIdentity:v8];
    v10 = +[FBSProfileManager sharedInstance];
    v11 = [v5 bundleIdentifier];
    v12 = -[FBSLegacySignatureValidationService initWithApplicationInfo:andProvisioningProfiles:isManaged:](v6, "initWithApplicationInfo:andProvisioningProfiles:isManaged:", v5, v9, [v10 isManaged:v11]);
    legacyProvider = self->_legacyProvider;
    self->_legacyProvider = v12;
  }
  if (!self->_modernProvider)
  {
    v14 = objc_alloc_init(FBSSignatureValidationService);
    modernProvider = self->_modernProvider;
    self->_modernProvider = (FBSApplicationTrustDataProvider *)v14;
  }
  if (!self->_authoritativeProvider)
  {
    v16 = objc_alloc_init(FBSSignatureValidationService);
    authoritativeProvider = self->_authoritativeProvider;
    self->_authoritativeProvider = v16;

    [(FBSSignatureValidationService *)self->_authoritativeProvider setAuthoritative:1];
  }
  unint64_t v18 = [(FBSApplicationTrustDataProvider *)self->_modernProvider trustStateForApplication:v5];
  unint64_t v19 = [(FBSApplicationTrustDataProvider *)self->_legacyProvider trustStateForApplication:v5];
  unint64_t v20 = [(FBSSignatureValidationService *)self->_authoritativeProvider trustStateForApplication:v5];
  v21 = FBLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v5 bundleIdentifier];
    v23 = NSStringFromFBSApplicationTrustState(v19);
    NSStringFromFBSApplicationTrustState(v18);
    v24 = v37 = a2;
    v25 = NSStringFromFBSApplicationTrustState(v20);
    *(_DWORD *)buf = 138413058;
    v39 = v22;
    __int16 v40 = 2112;
    v41 = v23;
    __int16 v42 = 2112;
    v43 = v24;
    __int16 v44 = 2112;
    v45 = v25;
    _os_log_impl(&dword_19C680000, v21, OS_LOG_TYPE_DEFAULT, "trust states for %@ - legacy: %@, modern: %@, authoritative: %@", buf, 0x2Au);

    a2 = v37;
  }

  if (v20 != v18)
  {
    v29 = NSString;
    v30 = NSStringFromFBSApplicationTrustState(v20);
    v31 = NSStringFromFBSApplicationTrustState(v18);
    v32 = [v29 stringWithFormat:@"Authoritative and modern states were divergent - authoritative: %@, modern: %@", v30, v31];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSApplicationTrustFacade *)a2 trustStateForApplication:(uint64_t)v32];
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v19 != v18 && (v19 != 3 || v18 != 4))
  {
    BOOL v26 = v18 != 4 && v18 >= 2;
    BOOL v27 = !v26;
    if (v19 != 8 || !v27)
    {
      v33 = NSString;
      v34 = NSStringFromFBSApplicationTrustState(v19);
      v35 = NSStringFromFBSApplicationTrustState(v18);
      v36 = [v33 stringWithFormat:@"Legacy and modern states were divergent - legacy: %@, modern: %@", v34, v35];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        [(FBSApplicationTrustFacade *)a2 trustStateForApplication:(uint64_t)v36];
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authoritativeProvider, 0);
  objc_storeStrong((id *)&self->_modernProvider, 0);

  objc_storeStrong((id *)&self->_legacyProvider, 0);
}

- (void)trustStateForApplication:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"FBSApplicationTrustFacade.m";
  __int16 v10 = 1024;
  int v11 = 57;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)trustStateForApplication:(uint64_t)a3 .cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"FBSApplicationTrustFacade.m";
  __int16 v10 = 1024;
  int v11 = 49;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end