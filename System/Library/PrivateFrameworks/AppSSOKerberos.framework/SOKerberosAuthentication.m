@interface SOKerberosAuthentication
+ (void)savePacValues:(id)a3 atLogin:(BOOL)a4;
+ (void)saveValuesForPlugins:(id)a3;
- (BOOL)changePasswordWithContext:(id)a3 withError:(id *)a4;
- (BOOL)refreshPacValuesWithContext:(id)a3 atLogin:(BOOL)a4 error:(id *)a5;
- (BOOL)refreshPacValuesWithContext:(id)a3 credential:(gss_cred_id_t_desc_struct *)a4 atLogin:(BOOL)a5;
- (BOOL)siteDiscoveryInProgress;
- (NSString)realm;
- (SOADSiteDiscovery)siteDiscovery;
- (SOKerberosAuthentication)initWithRealm:(id)a3;
- (SOKerberosHelper)kerberosHelper;
- (SOKeychainHelper)keychainHelper;
- (id)retrieveCachedSiteCodeFromCacheForBundleIdentifier:(id)a3 networkFingerprint:(id)a4;
- (unint64_t)attemptKerberosWithContext:(id)a3 returningToken:(id *)a4 orError:(id *)a5;
- (unint64_t)createNewCredentialUsingContext:(id)a3 returningCredential:(gss_cred_id_t_desc_struct *)a4 orError:(id *)a5;
- (unint64_t)findExistingCredentialUsingContext:(id)a3 returningCredential:(gss_cred_id_t_desc_struct *)a4 orError:(id *)a5;
- (unint64_t)mapErrorToKnownError:(id)a3;
- (void)_determineSiteCodeUsingDispatchGroup:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 networkFingerprint:(id)a6 requireTLSForLDAP:(BOOL)a7;
- (void)determineSiteCodeUsingContext:(id)a3;
- (void)setKerberosHelper:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setRealm:(id)a3;
- (void)setSiteCodeUsingContext:(id)a3;
- (void)setSiteDiscovery:(id)a3;
- (void)setSiteDiscoveryInProgress:(BOOL)a3;
- (void)triggerVPNIfNeededUsingRealm:(id)a3 bundleIdentifier:(id)a4 auditToken:(id)a5;
@end

@implementation SOKerberosAuthentication

- (SOKerberosAuthentication)initWithRealm:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SOKerberosAuthentication;
  v6 = [(SOKerberosAuthentication *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_realm, a3);
    if (initWithRealm__onceToken != -1) {
      dispatch_once(&initWithRealm__onceToken, &__block_literal_global_10);
    }
    v7->_siteDiscoveryInProgress = 0;
    v8 = objc_alloc_init(SOKerberosHelper);
    kerberosHelper = v7->_kerberosHelper;
    v7->_kerberosHelper = v8;

    v10 = objc_alloc_init(SOKeychainHelper);
    keychainHelper = v7->_keychainHelper;
    v7->_keychainHelper = v10;

    v12 = [[SOADSiteDiscovery alloc] initWithRealm:v7->_realm];
    siteDiscovery = v7->_siteDiscovery;
    v7->_siteDiscovery = v12;
  }
  return v7;
}

uint64_t __42__SOKerberosAuthentication_initWithRealm___block_invoke()
{
  _lock = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (unint64_t)attemptKerberosWithContext:(id)a3 returningToken:(id *)a4 orError:(id *)a5
{
  id v8 = a3;
  v9 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]6();
  }

  gss_cred_id_t cred_handle = 0;
  OM_uint32 minor_status = 0;
  v10 = [v8 realm];
  v11 = [v8 callerBundleIdentifier];
  v12 = [v8 auditToken];
  [(SOKerberosAuthentication *)self triggerVPNIfNeededUsingRealm:v10 bundleIdentifier:v11 auditToken:v12];

  uint64_t v13 = [v8 credentialUUID];
  if (v13)
  {
    v14 = (void *)v13;
    char v15 = [v8 refreshCredential];

    if ((v15 & 1) == 0)
    {
      id v16 = (id)_lock;
      objc_sync_enter(v16);
      v17 = [v8 impersonationBundleIdentifier];

      if (v17) {
        [v8 impersonationBundleIdentifier];
      }
      else {
      v18 = [v8 callerBundleIdentifier];
      }
      HeimCredSetImpersonateBundle();

      v19 = [(SOKerberosAuthentication *)self kerberosHelper];
      v20 = [v8 credentialUUID];
      gss_cred_id_t cred_handle = (gss_cred_id_t)[v19 acquireCredentialForUUID:v20];

      HeimCredSetImpersonateBundle();
      objc_sync_exit(v16);

      if (cred_handle)
      {
        v21 = SO_LOG_SOKerberosAuthentication();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]5(v8, v21);
        }
      }
    }
  }
  v22 = [v8 extensionData];
  int v23 = [v22 useSiteAutoDiscovery];

  if (v23)
  {
    v24 = [v8 networkIdentity];
    [v24 determineNetworkFingerprint];

    v25 = [v8 callerBundleIdentifier];
    v26 = [v8 networkIdentity];
    v27 = [v26 networkFingerprint];
    v28 = [(SOKerberosAuthentication *)self retrieveCachedSiteCodeFromCacheForBundleIdentifier:v25 networkFingerprint:v27];

    if (!v28) {
      goto LABEL_18;
    }
    v29 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]4();
    }

    [v8 setSiteCode:v28];
    if (!cred_handle || ([v28 age], v30 > 86400.0))
    {
LABEL_18:
      v31 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]3();
      }

      [(SOKerberosAuthentication *)self determineSiteCodeUsingContext:v8];
    }
  }
  uint64_t v32 = [v8 userPrincipalName];
  if (!v32
    || (v33 = (void *)v32,
        [v8 userPrincipalName],
        v34 = objc_claimAutoreleasedReturnValue(),
        char v35 = [v34 isEqualToString:&stru_26D3372C0],
        v34,
        v33,
        (v35 & 1) != 0))
  {
    unint64_t v36 = 2;
    goto LABEL_25;
  }
  if (!cred_handle)
  {
    if ([v8 refreshCredential])
    {
      int v38 = 0;
      unint64_t v36 = 0;
      goto LABEL_46;
    }
    unint64_t v39 = [(SOKerberosAuthentication *)self findExistingCredentialUsingContext:v8 returningCredential:&cred_handle orError:a5];
    unint64_t v36 = v39;
    if (v39 == 2)
    {
      v43 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]2(v43, v45, v46);
      }
      int v38 = 0;
    }
    else
    {
      if (v39 != 4)
      {
        int v38 = 0;
        goto LABEL_46;
      }
      v40 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]1();
      }

      CFUUIDRef v41 = GSSCredentialCopyUUID(cred_handle);
      if (v41)
      {
        CFUUIDRef v42 = v41;
        v43 = CFUUIDCreateString(0, v41);
        CFRelease(v42);
        v44 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v43];
        [v8 setCredentialUUID:v44];
      }
      else
      {
        v43 = SO_LOG_SOKerberosAuthentication();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]0(v8);
        }
      }
      int v38 = 1;
    }

LABEL_46:
    if (!cred_handle) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  unint64_t v36 = 0;
  int v38 = 0;
LABEL_47:
  if (![v8 refreshCredential]) {
    goto LABEL_79;
  }
LABEL_48:
  v47 = [v8 extensionData];
  uint64_t v48 = [v47 usePlatformSSOTGT];

  if (v48)
  {
    if (([v8 returnCredentialOnly] & 1) == 0)
    {
      if (!a5)
      {
LABEL_86:
        unint64_t v36 = 7;
        goto LABEL_25;
      }
      v54 = [MEMORY[0x263F087E8] invalidKerberosOperation];
LABEL_85:
      *a5 = v54;
      goto LABEL_86;
    }
    if ([v8 returnCredentialOnly])
    {
      v49 = [v8 extensionData];
      uint64_t v48 = [v49 allowPlatformSSOAuthFallback];

      if ((v48 & 1) == 0)
      {
        if (!a5) {
          goto LABEL_86;
        }
        goto LABEL_84;
      }
    }
  }
  v50 = [v8 password];
  if (v50)
  {
    uint64_t v48 = [v8 password];
    if (([(id)v48 isEqualToString:&stru_26D3372C0] & 1) == 0)
    {

      goto LABEL_66;
    }
  }
  v111 = a5;
  v113 = a4;
  v51 = [v8 extensionData];
  v52 = [v51 certificateUUID];
  if (!v52
    || ([v8 extensionData],
        a4 = (id *)objc_claimAutoreleasedReturnValue(),
        [a4 certificateUUID],
        a5 = (id *)objc_claimAutoreleasedReturnValue(),
        [a5 isEqualToString:&stru_26D3372C0]))
  {
    v55 = [v8 pkinitPersistientRef];
    BOOL v53 = [v55 length] == 0;

    if (!v52) {
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v53 = 0;
  }

LABEL_62:
  if (v50)
  {
  }
  a5 = v111;
  a4 = v113;
  if (v53)
  {
    unint64_t v36 = 1;
    goto LABEL_25;
  }
LABEL_66:
  v56 = [v8 extensionData];
  if ([v56 requireUserPresence])
  {
    v57 = [v8 extensionData];
    uint64_t v58 = [v57 certificateUUID];
    if (v58)
    {
      v59 = (void *)v58;
      v60 = [v8 keychainLAContext];

      if (!v60)
      {
        v61 = SO_LOG_SOKerberosAuthentication();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.9();
        }

        unint64_t v36 = 18;
        goto LABEL_25;
      }
      goto LABEL_74;
    }
  }
LABEL_74:
  [(SOKerberosAuthentication *)self setSiteCodeUsingContext:v8];
  unint64_t v36 = [(SOKerberosAuthentication *)self createNewCredentialUsingContext:v8 returningCredential:&cred_handle orError:a5];
  v62 = SO_LOG_SOKerberosAuthentication();
  BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG);
  if (v36 != 4)
  {
    if (v63) {
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.8();
    }

    if (*a5)
    {
      v72 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.7();
      }
    }
    goto LABEL_25;
  }
  if (v63) {
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.6();
  }

  CFUUIDRef v64 = GSSCredentialCopyUUID(cred_handle);
  if (!v64)
  {
    v105 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:](v8);
    }

    if (!a5) {
      goto LABEL_86;
    }
    v54 = [MEMORY[0x263F087E8] sourceAppNotAllowed];
    goto LABEL_85;
  }
  CFUUIDRef v65 = v64;
  v66 = (__CFString *)CFUUIDCreateString(0, v64);
  CFRelease(v65);
  v67 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v66];
  [v8 setCredentialUUID:v67];

  int v38 = 1;
  unint64_t v36 = 4;
LABEL_79:
  if (!cred_handle)
  {
    if (!a5)
    {
      unint64_t v36 = 7;
      goto LABEL_27;
    }
LABEL_84:
    v54 = [MEMORY[0x263F087E8] credentialMissing];
    goto LABEL_85;
  }
  v68 = [v8 extensionData];
  v114 = a4;
  if ([v68 usePlatformSSOTGT])
  {
    v69 = [v8 currentSettings];
    v70 = [v69 dateExpirationChecked];
    if (v70)
    {
      unsigned int v71 = 0;
    }
    else
    {
      v73 = [v8 extensionData];
      unsigned int v71 = [v73 performKerberosOnly] ^ 1;
    }
  }
  else
  {
    unsigned int v71 = 0;
  }

  v74 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.5(v8, v74);
  }

  if ((v38 | v71)) {
    goto LABEL_102;
  }
  if ([v8 refreshCredential]) {
    goto LABEL_102;
  }
  v75 = [v8 currentSettings];
  v76 = [v75 dateNextPacRefresh];
  [v76 timeIntervalSinceNow];
  double v78 = v77;

  if (v78 < 0.0)
  {
LABEL_102:
    id v79 = (id)_lock;
    objc_sync_enter(v79);
    v80 = [v8 impersonationBundleIdentifier];

    if (v80) {
      [v8 impersonationBundleIdentifier];
    }
    else {
    v81 = [v8 callerBundleIdentifier];
    }
    HeimCredSetImpersonateBundle();

    [(SOKerberosAuthentication *)self refreshPacValuesWithContext:v8 credential:cred_handle atLogin:v38 | v71];
    HeimCredSetImpersonateBundle();
    objc_sync_exit(v79);
  }
  +[SOKerberosAuthentication saveValuesForPlugins:v8];
  v82 = [v8 credentialUUID];
  v83 = [v8 currentSettings];
  [v83 setCredentialUUID:v82];

  v84 = [v8 userPrincipalName];
  v85 = [v8 currentSettings];
  [v85 setUserPrincipalName:v84];

  v86 = [v8 currentSettings];
  [v86 setUserCancelledLogin:0];

  v87 = [v8 currentSettings];
  [v87 setDateLoginCancelled:0];

  v88 = [v8 loginTimeStamp];

  if (v88)
  {
    v89 = [v8 loginTimeStamp];
    v90 = [v8 currentSettings];
    [v90 setDateLastLogin:v89];
  }
  v91 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.4(v8, v91);
  }

  v92 = [v8 extensionData];
  if ([v92 performKerberosOnly]) {
    goto LABEL_115;
  }
  v93 = [v8 currentSettings];
  uint64_t v94 = [v93 dateExpirationChecked];
  if (!v94)
  {

LABEL_115:
    goto LABEL_116;
  }
  v95 = (void *)v94;
  v96 = [v8 currentSettings];
  v97 = [v96 datePasswordLastChangedAtLogin];
  [v8 currentSettings];
  v98 = v112 = a5;
  v99 = [v98 datePasswordLastChanged];
  char v110 = [v97 isEqualToDate:v99];

  a5 = v112;
  if ((v110 & 1) == 0)
  {
    [v8 setRefreshCredential:1];
    unint64_t v36 = 16;
    goto LABEL_25;
  }
LABEL_116:
  if (([v8 returnCredentialOnly] & 1) == 0)
  {
    v100 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]();
    }

    v101 = [v8 servicePrincipalName];

    if (v101)
    {
      id v102 = (id)_lock;
      objc_sync_enter(v102);
      v103 = [v8 impersonationBundleIdentifier];

      if (v103) {
        [v8 impersonationBundleIdentifier];
      }
      else {
      v104 = [v8 callerBundleIdentifier];
      }
      HeimCredSetImpersonateBundle();

      v106 = [(SOKerberosAuthentication *)self kerberosHelper];
      gss_cred_id_t v107 = cred_handle;
      v108 = [v8 servicePrincipalName];
      LODWORD(v107) = [v106 authenticate:v107 toServer:v108 returningToken:v114 andError:a5];

      HeimCredSetImpersonateBundle();
      HeimCredSetImpersonateAuditToken();
      objc_sync_exit(v102);

      if (v107 && *v114)
      {
        v109 = SO_LOG_SOKerberosAuthentication();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:](v114);
        }

        unint64_t v36 = 0;
      }
      else if (*a5)
      {
        unint64_t v36 = -[SOKerberosAuthentication mapErrorToKnownError:](self, "mapErrorToKnownError:");
      }
      goto LABEL_25;
    }
    if (!a5) {
      goto LABEL_86;
    }
    v54 = [MEMORY[0x263F087E8] servicePrincipalNameMissing];
    goto LABEL_85;
  }
  unint64_t v36 = 4;
LABEL_25:
  if (cred_handle) {
    gss_release_cred(&minor_status, &cred_handle);
  }
LABEL_27:

  return v36;
}

+ (void)saveValuesForPlugins:(id)a3
{
  id v3 = a3;
  v4 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[SOKerberosAuthentication saveValuesForPlugins:]();
  }

  id v5 = [SOKerberosHeimdalPluginSettings alloc];
  v6 = [v3 realm];
  v7 = [(SOKerberosHeimdalPluginSettings *)v5 initWithRealm:v6];

  id v8 = [v3 siteCode];
  v9 = [v8 code];
  [(SOKerberosHeimdalPluginSettings *)v7 setSiteCode:v9];

  v10 = [v3 credentialUUID];

  [(SOKerberosHeimdalPluginSettings *)v7 setCurrentCredential:v10];
}

+ (void)savePacValues:(id)a3 atLogin:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 currentSettings];
  v7 = v6;
  if (v4)
  {
    [v6 setDateExpirationChecked:0];
    [v7 setPasswordNeverExpires:0];
    [v7 setDatePasswordExpires:0];
    [v7 setDatePasswordLastChanged:0];
    [v7 setDateADPasswordCanChange:0];
    [v7 setDatePasswordLastChangedAtLogin:0];
  }
  id v8 = [v5 pacData];
  if (v8)
  {
    v9 = [MEMORY[0x263EFF910] date];
    [v7 setDateExpirationChecked:v9];

    objc_msgSend(v7, "setPasswordNeverExpires:", objc_msgSend(v8, "passwordNeverExpires"));
    v10 = [v8 passwordMustChange];
    [v7 setDatePasswordExpires:v10];

    v11 = [v8 passwordLastSet];
    [v7 setDatePasswordLastChanged:v11];

    v12 = [v8 passwordCanChange];
    [v7 setDateADPasswordCanChange:v12];

    uint64_t v13 = [v8 homeDirectory];
    [v7 setNetworkHomeDirectory:v13];

    if (v4)
    {
      v14 = [v7 datePasswordLastChanged];
      [v7 setDatePasswordLastChangedAtLogin:v14];
    }
    char v15 = [v7 datePasswordExpires];
    [v15 timeIntervalSinceNow];
    if (v16 >= 0.0 && v16 >= 86400.0)
    {
      if (v16 >= 259200.0)
      {
        v18 = (void *)MEMORY[0x263EFF910];
        if (v16 >= 604800.0) {
          double v19 = 10800.0;
        }
        else {
          double v19 = 3600.0;
        }
      }
      else
      {
        v18 = (void *)MEMORY[0x263EFF910];
        double v19 = 900.0;
      }
      uint64_t v17 = [v18 dateWithTimeIntervalSinceNow:v19];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263EFF910] date];
    }
    v20 = (void *)v17;
    [v7 setDateNextPacRefresh:v17];

    v21 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[SOKerberosAuthentication savePacValues:atLogin:](v7);
    }
  }
}

- (void)setSiteCodeUsingContext:(id)a3
{
  id v4 = a3;
  id v5 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication setSiteCodeUsingContext:]();
  }

  v6 = [v4 extensionData];
  int v7 = [v6 useSiteAutoDiscovery];

  if (v7)
  {
    id v8 = [v4 siteCodeGroup];
    dispatch_time_t v9 = dispatch_time(0, 15000000000);
    intptr_t v10 = dispatch_group_wait(v8, v9);

    if (v10 >= 1)
    {
      v11 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosExtensionProcess handleGetSiteCode:]();
      }
    }
    v12 = [v4 callerBundleIdentifier];
    uint64_t v13 = [v4 networkIdentity];
    v14 = [v13 networkFingerprint];
    char v15 = [(SOKerberosAuthentication *)self retrieveCachedSiteCodeFromCacheForBundleIdentifier:v12 networkFingerprint:v14];

    double v16 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:]4();
    }

    [v4 setSiteCode:v15];
  }
}

- (id)retrieveCachedSiteCodeFromCacheForBundleIdentifier:(id)a3 networkFingerprint:(id)a4
{
  id v5 = a4;
  v6 = [SOKerberosRealmSettings alloc];
  int v7 = [(SOKerberosAuthentication *)self realm];
  id v8 = [(SOKerberosRealmSettings *)v6 initWithRealm:v7];

  dispatch_time_t v9 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:]();
  }

  intptr_t v10 = [(SOKerberosRealmSettings *)v8 siteCodeForNetworkFingerprint:v5];

  v11 = SO_LOG_SOKerberosAuthentication();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:](v10);
    }

    id v13 = v10;
  }
  else
  {
    if (v12) {
      -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:]();
    }
  }
  return v10;
}

- (void)determineSiteCodeUsingContext:(id)a3
{
  id v4 = a3;
  id v10 = [v4 siteCodeGroup];
  id v5 = [v4 callerBundleIdentifier];
  v6 = [v4 auditToken];
  int v7 = [v4 networkIdentity];
  id v8 = [v7 networkFingerprint];
  dispatch_time_t v9 = [v4 extensionData];

  -[SOKerberosAuthentication _determineSiteCodeUsingDispatchGroup:bundleIdentifier:auditTokenData:networkFingerprint:requireTLSForLDAP:](self, "_determineSiteCodeUsingDispatchGroup:bundleIdentifier:auditTokenData:networkFingerprint:requireTLSForLDAP:", v10, v5, v6, v8, [v9 requireTLSForLDAP]);
}

- (void)_determineSiteCodeUsingDispatchGroup:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 networkFingerprint:(id)a6 requireTLSForLDAP:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  double v16 = [SOKerberosRealmSettings alloc];
  uint64_t v17 = [(SOKerberosAuthentication *)self realm];
  v18 = [(SOKerberosRealmSettings *)v16 initWithRealm:v17];

  if (![(SOKerberosAuthentication *)self siteDiscoveryInProgress])
  {
    [(SOKerberosAuthentication *)self setSiteDiscoveryInProgress:1];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    uint64_t v32 = __Block_byref_object_dispose__0;
    id v33 = v12;
    dispatch_group_enter((dispatch_group_t)v29[5]);
    double v19 = v29[5];
    v20 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke;
    block[3] = &unk_2645A25C8;
    block[4] = self;
    id v22 = v13;
    id v23 = v14;
    BOOL v27 = a7;
    id v24 = v15;
    v25 = v18;
    v26 = &v28;
    dispatch_group_async(v19, v20, block);

    _Block_object_dispose(&v28, 8);
  }
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke(uint64_t a1)
{
  v2 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 32) siteDiscovery];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11;
  v9[3] = &unk_2645A25A0;
  id v10 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = *(void *)(a1 + 72);
  [v3 performLDAPPingUsingSite:0 bundleIdentifier:v4 auditTokenData:v5 requireTLSForLDAP:v6 inBackground:0 completion:v9];
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_2();
  }

  if (*(void *)(a1 + 32))
  {
    if (v3)
    {
      int v5 = [(__CFString *)v3 isEqualToString:&stru_26D3372C0];
      uint64_t v6 = [SOSiteCode alloc];
      if (v5)
      {
        id v7 = @"no site code";
        uint64_t v8 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 32);
        id v7 = v3;
      }
      dispatch_time_t v9 = [(SOSiteCode *)v6 initWithSiteCode:v7 forNetworkFingerprint:v8];
      [*(id *)(a1 + 40) cacheSiteCode:v9];
    }
    id v10 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_1();
    }
  }
  [*(id *)(a1 + 48) setSiteDiscoveryInProgress:0];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

- (unint64_t)createNewCredentialUsingContext:(id)a3 returningCredential:(gss_cred_id_t_desc_struct *)a4 orError:(id *)a5
{
  v91[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_time_t v9 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]6();
  }

  id v10 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]5(v8);
  }

  id v11 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  uint64_t v12 = [v8 extensionData];
  uint64_t v13 = [v12 certificateUUID];
  if (v13)
  {
    id v14 = (void *)v13;
    char v15 = [v8 useKerberosPasswordInsteadOfMDMIdentity];

    if ((v15 & 1) == 0)
    {
      double v16 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]4();
      }

      uint64_t v17 = [(SOKerberosAuthentication *)self keychainHelper];
      v18 = [v8 extensionData];
      double v19 = [v18 certificateUUID];
      v20 = (__SecIdentity *)[v17 identityForUUIDString:v19];

      v21 = SO_LOG_SOKerberosAuthentication();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (!v20)
      {
        if (v22) {
          -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]2(v8);
        }
        unint64_t v35 = 15;
        goto LABEL_80;
      }
      if (v22) {
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]3((uint64_t)v20, v8, v21);
      }

      [v11 setObject:v20 forKeyedSubscript:@"kGSSICCertificate"];
      goto LABEL_38;
    }
  }
  else
  {
  }
  id v23 = [v8 pkinitPersistientRef];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    v25 = [v8 pkinitPersistientRef];
    v26 = [v8 certificateTokenID];
    v21 = +[SOSmartcard searchForCachedIdentityPersistentRef:v25 tokenID:v26];

    if ([v21 count])
    {
      BOOL v27 = [v21 objectForKeyedSubscript:*MEMORY[0x263F16E70]];

      if (v27)
      {
        uint64_t v28 = [v8 smartCardLAContext];

        if (!v28)
        {
          id v29 = objc_alloc_init(MEMORY[0x263F10468]);
          [v8 setSmartCardLAContext:v29];

          uint64_t v30 = [v8 smartCardLAContext];
          [v30 setOptionCallerName:@"Kerberos"];
        }
        v31 = [v8 smartCardLAContext];
        v20 = +[SOSmartcard getLocalAuthIdentityForCert:v21 withLAContext:v31];

        if (!v20) {
          goto LABEL_69;
        }
        goto LABEL_31;
      }
      uint64_t v36 = *MEMORY[0x263F175B0];
      v37 = [v21 objectForKeyedSubscript:*MEMORY[0x263F175B0]];

      if (!v37)
      {
LABEL_69:
        v34 = SO_LOG_SOKerberosAuthentication();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.8(v8);
        }
        unint64_t v35 = 6;
        goto LABEL_72;
      }
      int v38 = [(SOKerberosAuthentication *)self keychainHelper];
      unint64_t v39 = [v21 objectForKeyedSubscript:v36];
      v20 = (__SecIdentity *)[v38 identityForPersistientRef:v39];

      if (v20)
      {
LABEL_31:
        v40 = SO_LOG_SOKerberosAuthentication();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]1((uint64_t)v20, v8, v40);
        }

        [v11 setObject:v20 forKeyedSubscript:@"kGSSICCertificate"];
        CFUUIDRef v41 = [v8 smartCardLAContext];

        if (v41)
        {
          CFUUIDRef v42 = SO_LOG_SOKerberosAuthentication();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]0(v8);
          }

          v43 = [v8 smartCardLAContext];
          [v11 setObject:v43 forKeyedSubscript:@"kGSSICAuthenticationContext"];
        }
        goto LABEL_38;
      }
      v34 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.9();
      }
    }
    else
    {
      v34 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.7(v8);
      }
    }
    unint64_t v35 = 3;
LABEL_72:

    goto LABEL_80;
  }
  uint64_t v32 = [v8 password];

  if (!v32)
  {
    v21 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:]();
    }
    unint64_t v35 = 1;
    goto LABEL_80;
  }
  id v33 = [v8 password];
  [v11 setObject:v33 forKeyedSubscript:@"kGSSICPassword"];

  v20 = 0;
LABEL_38:
  v44 = [v8 cacheName];

  if (v44)
  {
    uint64_t v45 = NSString;
    uint64_t v46 = [v8 cacheName];
    v47 = [v45 stringWithFormat:@"API:%@", v46];
    [v11 setObject:v47 forKeyedSubscript:@"kGSSICKerberosCacheName"];

    uint64_t v48 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.6(v11);
    }
  }
  cf = v20;
  v49 = a4;
  v50 = self;
  v51 = [v8 siteCode];
  uint64_t v52 = [v51 code];
  if (!v52) {
    goto LABEL_46;
  }
  BOOL v53 = (void *)v52;
  v54 = [v8 siteCode];
  [v54 code];
  v56 = v55 = a5;
  char v57 = [v56 isEqualToString:@"no site code"];

  a5 = v55;
  if ((v57 & 1) == 0)
  {
    uint64_t v58 = [v8 siteCode];
    v59 = [v58 code];
    [v11 setObject:v59 forKeyedSubscript:@"kGSSICSiteName"];

    v51 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.5(v11);
    }
LABEL_46:
  }
  v60 = [v8 extensionData];
  v61 = [v60 credentialBundleIdACL];
  if (v61
    || ([v8 extensionData],
        v61 = objc_claimAutoreleasedReturnValue(),
        ([v61 includeManagedAppsInBundleIdACL] & 1) != 0))
  {
  }
  else
  {
    v82 = [v8 extensionData];
    char v83 = [v82 includeKerberosAppsInBundleIdACL];

    if ((v83 & 1) == 0)
    {
      v21 = &unk_26D33C218;
      goto LABEL_54;
    }
  }
  v21 = [MEMORY[0x263EFF980] array];
  v62 = [v8 extensionData];
  BOOL v63 = [v62 credentialBundleIdACL];
  uint64_t v64 = [v63 count];

  if (v64)
  {
    CFUUIDRef v65 = [v8 extensionData];
    v66 = [v65 credentialBundleIdACL];
    [v21 addObjectsFromArray:v66];
  }
  v67 = [v8 extensionData];
  int v68 = [v67 includeManagedAppsInBundleIdACL];

  if (v68) {
    [v21 addObject:@"com.apple.private.gssapi.allowmanagedapps"];
  }
LABEL_54:
  [v11 setObject:v21 forKeyedSubscript:@"kGSSICAppIdentifierACL"];
  v69 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.4();
  }

  v70 = [v8 impersonationBundleIdentifier];

  if (v70)
  {
    v90 = @"kGSSICAppleSourceAppSigningIdentity";
    unsigned int v71 = [v8 impersonationBundleIdentifier];
    v91[0] = v71;
    v72 = [NSDictionary dictionaryWithObjects:v91 forKeys:&v90 count:1];
    [v11 setObject:v72 forKeyedSubscript:@"kGSSICAppleSourceApp"];

    v73 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:](v11);
    }
LABEL_62:

    goto LABEL_63;
  }
  v74 = [v8 callerBundleIdentifier];

  if (v74)
  {
    v88 = @"kGSSICAppleSourceAppSigningIdentity";
    v75 = [v8 callerBundleIdentifier];
    v89 = v75;
    v76 = [NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    [v11 setObject:v76 forKeyedSubscript:@"kGSSICAppleSourceApp"];

    v73 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:](v11);
    }
    goto LABEL_62;
  }
LABEL_63:
  double v77 = [(SOKerberosAuthentication *)v50 kerberosHelper];
  double v78 = [v8 userPrincipalName];
  void *v49 = (gss_cred_id_t_desc_struct *)[v77 createCredential:v78 withOptions:v11 andError:a5];

  if (*v49)
  {
    id v79 = [MEMORY[0x263EFF910] date];
    [v8 setLoginTimeStamp:v79];

    OM_uint32 minor_status = 0;
    gss_name_t input_name = GSSCredentialCopyName(*v49);
    DisplayString = (__CFString *)GSSNameCreateDisplayString(input_name);
    gss_release_name(&minor_status, &input_name);
    [v8 setUserPrincipalNameAfterAuth:DisplayString];

    unint64_t v35 = 4;
    v81 = cf;
    if (!cf) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  v81 = cf;
  if (*a5)
  {
    unint64_t v35 = -[SOKerberosAuthentication mapErrorToKnownError:](v50, "mapErrorToKnownError:");
    if (!cf) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  unint64_t v35 = 5;
  if (cf) {
LABEL_79:
  }
    CFRelease(v81);
LABEL_80:

  return v35;
}

- (unint64_t)findExistingCredentialUsingContext:(id)a3 returningCredential:(gss_cred_id_t_desc_struct *)a4 orError:(id *)a5
{
  id v7 = a3;
  id v8 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication findExistingCredentialUsingContext:returningCredential:orError:]();
  }

  dispatch_time_t v9 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication findExistingCredentialUsingContext:returningCredential:orError:](v7);
  }

  id v10 = (id)_lock;
  objc_sync_enter(v10);
  id v11 = [v7 impersonationBundleIdentifier];

  if (v11) {
    [v7 impersonationBundleIdentifier];
  }
  else {
  uint64_t v12 = [v7 callerBundleIdentifier];
  }
  HeimCredSetImpersonateBundle();

  uint64_t v13 = [(SOKerberosAuthentication *)self kerberosHelper];
  id v14 = [v7 userPrincipalName];
  *a4 = (gss_cred_id_t_desc_struct *)[v13 acquireCredentialForUPN:v14];

  HeimCredSetImpersonateBundle();
  objc_sync_exit(v10);

  if (*a4) {
    unint64_t v15 = 4;
  }
  else {
    unint64_t v15 = 5;
  }

  return v15;
}

- (BOOL)changePasswordWithContext:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication changePasswordWithContext:withError:](v6, (uint64_t)self, v7);
  }

  id v8 = [v6 realm];
  dispatch_time_t v9 = [v6 callerBundleIdentifier];
  id v10 = [v6 auditToken];
  [(SOKerberosAuthentication *)self triggerVPNIfNeededUsingRealm:v8 bundleIdentifier:v9 auditToken:v10];

  id v11 = (id)_lock;
  objc_sync_enter(v11);
  uint64_t v12 = [v6 impersonationBundleIdentifier];

  if (v12) {
    [v6 impersonationBundleIdentifier];
  }
  else {
  uint64_t v13 = [v6 callerBundleIdentifier];
  }
  HeimCredSetImpersonateBundle();

  id v14 = [(SOKerberosAuthentication *)self kerberosHelper];
  unint64_t v15 = [v6 userPrincipalName];
  double v16 = [v6 realm];
  uint64_t v17 = [v6 password];
  v18 = [v6 changedPassword];
  char v19 = [v14 changePasswordForUPN:v15 realm:v16 withOldPassword:v17 withNewPassword:v18 withError:a4];

  HeimCredSetImpersonateBundle();
  HeimCredSetImpersonateAuditToken();
  objc_sync_exit(v11);

  v20 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication changePasswordWithContext:withError:]();
  }

  if (*a4)
  {
    v21 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosAuthentication changePasswordWithContext:withError:](a4);
    }
  }
  return v19;
}

- (BOOL)refreshPacValuesWithContext:(id)a3 atLogin:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  dispatch_time_t v9 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication refreshPacValuesWithContext:atLogin:error:]((uint64_t)self, v9, v10);
  }

  gss_cred_id_t cred_handle = 0;
  OM_uint32 minor_status = 0;
  id v11 = [v8 credentialUUID];

  if (!v11
    || ([(SOKerberosAuthentication *)self kerberosHelper],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v8 credentialUUID],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        gss_cred_id_t cred_handle = (gss_cred_id_t)[v12 acquireCredentialForUUID:v13],
        v13,
        v12,
        !cred_handle))
  {
    if ([(SOKerberosAuthentication *)self createNewCredentialUsingContext:v8 returningCredential:&cred_handle orError:a5] != 4&& *a5)
    {
      id v14 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosAuthentication refreshPacValuesWithContext:atLogin:error:]();
      }
    }
  }
  BOOL v15 = [(SOKerberosAuthentication *)self refreshPacValuesWithContext:v8 credential:cred_handle atLogin:v6];
  if (cred_handle) {
    gss_release_cred(&minor_status, &cred_handle);
  }

  return v15;
}

- (BOOL)refreshPacValuesWithContext:(id)a3 credential:(gss_cred_id_t_desc_struct *)a4 atLogin:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  dispatch_time_t v9 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:](v5, (uint64_t)self, v9);
  }

  uint64_t v10 = [v8 extensionData];
  int v11 = [v10 performKerberosOnly];

  if (v11)
  {
    id v12 = [v8 currentSettings];
    [v12 setDateExpirationChecked:0];
    [v12 setPasswordNeverExpires:0];
    [v12 setDatePasswordExpires:0];
    [v12 setDatePasswordLastChanged:0];
    [v12 setDateADPasswordCanChange:0];
    [v12 setDatePasswordLastChangedAtLogin:0];
    [v12 setNetworkHomeDirectory:0];
LABEL_9:
    BOOL v17 = 1;
    goto LABEL_13;
  }
  uint64_t v13 = [(SOKerberosAuthentication *)self kerberosHelper];
  id v22 = 0;
  int v14 = [v13 getPACForCred:a4 pac:&v22];
  id v12 = v22;

  BOOL v15 = SO_LOG_SOKerberosAuthentication();
  double v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:]();
    }

    [v8 setPacData:v12];
    +[SOKerberosAuthentication savePacValues:v8 atLogin:v5];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:]();
  }

  v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
  char v19 = [v8 currentSettings];
  [v19 setDatePasswordLastChanged:v18];

  v20 = [v8 currentSettings];
  [v20 setDateExpirationChecked:0];

  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)mapErrorToKnownError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:@"kGSSMinorErrorCode"];

  BOOL v6 = [NSNumber numberWithLong:-1765328361];
  char v7 = [v5 isEqualToNumber:v6];

  if (v7)
  {
    unint64_t v8 = 8;
  }
  else
  {
    dispatch_time_t v9 = [NSNumber numberWithLong:-1765328360];
    char v10 = [v5 isEqualToNumber:v9];

    if (v10)
    {
      unint64_t v8 = 10;
    }
    else
    {
      int v11 = [NSNumber numberWithLong:-1765328378];
      char v12 = [v5 isEqualToNumber:v11];

      if (v12)
      {
        unint64_t v8 = 11;
      }
      else
      {
        uint64_t v13 = [NSNumber numberWithLong:-1765328366];
        char v14 = [v5 isEqualToNumber:v13];

        if (v14)
        {
          unint64_t v8 = 9;
        }
        else
        {
          BOOL v15 = [NSNumber numberWithLong:-1765328228];
          char v16 = [v5 isEqualToNumber:v15];

          if (v16)
          {
            unint64_t v8 = 12;
          }
          else
          {
            BOOL v17 = [NSNumber numberWithLong:-1765328165];
            char v18 = [v5 isEqualToNumber:v17];

            if (v18)
            {
              unint64_t v8 = 13;
            }
            else
            {
              char v19 = [NSNumber numberWithLong:-1765328370];
              char v20 = [v5 isEqualToNumber:v19];

              if (v20)
              {
                unint64_t v8 = 14;
              }
              else
              {
                v21 = [NSNumber numberWithLong:-1765328377];
                char v22 = [v5 isEqualToNumber:v21];

                if (v22)
                {
                  unint64_t v8 = 17;
                }
                else
                {
                  id v23 = [v3 userInfo];
                  uint64_t v24 = [v23 objectForKeyedSubscript:@"kGSSMechanism"];

                  if ([v5 isEqualToNumber:&unk_26D33C260]
                    && [v3 code] == 0x10000
                    && ([v24 isEqualToString:@"SPNEGO"] & 1) != 0)
                  {
                    unint64_t v8 = 17;
                  }
                  else
                  {
                    unint64_t v8 = 7;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v8;
}

- (void)triggerVPNIfNeededUsingRealm:(id)a3 bundleIdentifier:(id)a4 auditToken:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.8();
  }

  id v29 = v7;
  [v29 UTF8String];
  srv = (void *)nw_endpoint_create_srv();
  nw_parameters_t v12 = nw_parameters_create();
  xpc_object_t xarray = xpc_array_create(0, 0);
  xpc_array_set_string(xarray, 0xFFFFFFFFFFFFFFFFLL, "NetworkExtension");
  xpc_object_t v13 = xpc_array_create(0, 0);
  xpc_array_set_string(v13, 0xFFFFFFFFFFFFFFFFLL, "VPN");
  nw_parameters_set_required_netagent_classes();
  if (v8)
  {
    char v14 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.7();
    }

    [v8 UTF8String];
    nw_parameters_set_source_application_by_bundle_id();
    long long v35 = 0u;
    long long v36 = 0u;
    if (v9 && [MEMORY[0x263F25290] auditTokenFromData:v9 auditToken:&v35])
    {
      BOOL v15 = SO_LOG_SOKerberosAuthentication();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.6();
      }

      long long v31 = v35;
      long long v32 = v36;
      nw_parameters_set_source_application();
    }
  }
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  BOOL v17 = (void *)nw_path_evaluator_copy_path();
  char v18 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.5();
  }

  uint64_t v39 = 0;
  uint64_t v40 = 0;
  if (nw_path_get_vpn_config_id())
  {
    int is_per_app_vpn = nw_path_is_per_app_vpn();
    char v20 = SO_LOG_SOKerberosAuthentication();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (is_per_app_vpn)
    {
      if (v21) {
        -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:]();
      }
    }
    else if (v21)
    {
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:]();
    }

    ne_session_create();
    *(void *)&long long v35 = 0;
    *((void *)&v35 + 1) = &v35;
    *(void *)&long long v36 = 0x3032000000;
    *((void *)&v36 + 1) = __Block_byref_object_copy__0;
    v37 = __Block_byref_object_dispose__0;
    dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
    *(void *)&long long v31 = 0;
    *((void *)&v31 + 1) = &v31;
    *(void *)&long long v32 = 0x3032000000;
    *((void *)&v32 + 1) = __Block_byref_object_copy__0;
    id v33 = __Block_byref_object_dispose__0;
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    id v23 = dispatch_get_global_queue(0, 0);
    ne_session_set_event_handler();

    uint64_t v24 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:]();
    }

    ne_session_start();
    v25 = *(NSObject **)(*((void *)&v35 + 1) + 40);
    dispatch_time_t v26 = dispatch_time(0, 120000000000);
    dispatch_semaphore_wait(v25, v26);
    ne_session_cancel();
    BOOL v27 = *(NSObject **)(*((void *)&v31 + 1) + 40);
    dispatch_time_t v28 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v27, v28);
    ne_session_release();
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    char v22 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.4();
    }
  }
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    v2 = dispatch_get_global_queue(0, 0);
    ne_session_get_status();
  }
  else
  {
    id v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    dispatch_semaphore_signal(v3);
  }
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = ne_session_status_to_string();
  BOOL v5 = SO_LOG_SOKerberosAuthentication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_2(v4);
  }

  if ((a2 & 0xFFFFFFFD) == 1)
  {
    BOOL v6 = SO_LOG_SOKerberosAuthentication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (BOOL)siteDiscoveryInProgress
{
  return self->_siteDiscoveryInProgress;
}

- (void)setSiteDiscoveryInProgress:(BOOL)a3
{
  self->_siteDiscoveryInProgress = a3;
}

- (SOKerberosHelper)kerberosHelper
{
  return (SOKerberosHelper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKerberosHelper:(id)a3
{
}

- (SOKeychainHelper)keychainHelper
{
  return (SOKeychainHelper *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeychainHelper:(id)a3
{
}

- (SOADSiteDiscovery)siteDiscovery
{
  return (SOADSiteDiscovery *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSiteDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteDiscovery, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_kerberosHelper, 0);
  objc_storeStrong((id *)&self->_realm, 0);
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:orError:.cold.1(void *a1)
{
  v1 = [a1 callerBundleIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v2, v3, "UUID nil after authentication for calling app: %{public}@", v4, v5, v6, v7, v8);
}

- (void)attemptKerberosWithContext:(id *)a1 returningToken:orError:.cold.2(id *a1)
{
  [*a1 length];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v1, v2, "token received: %lu bytes", v3, v4, v5, v6, v7);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.3()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "using credential: %{public}@", v2);
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:(NSObject *)a2 orError:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 currentSettings];
  uint64_t v5 = [v4 datePasswordLastChanged];
  uint64_t v6 = [a1 currentSettings];
  uint8_t v7 = [v6 datePasswordLastChangedAtLogin];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_221304000, a2, v8, "password last changed: %@, at login: %@", v9);
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:(NSObject *)a2 orError:.cold.5(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 currentSettings];
  uint64_t v4 = [v3 dateNextPacRefresh];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, a2, v5, "Next pac refresh: %@", v6);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.6()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "new credential received: %@", v2);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.7()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "error for new credential: %{public}@", v1, 0xCu);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.8()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "response for new credential: %lu", v2);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "requireUserPresence is required for MDM certificate", v2, v3, v4, v5, v6);
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:orError:.cold.10(void *a1)
{
  uint64_t v1 = [a1 callerBundleIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v2, v3, "UUID nil after find credential for calling app: %{public}@", v4, v5, v6, v7, v8);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.11()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "found existing credential received: %@", v2);
}

- (void)attemptKerberosWithContext:(NSObject *)a1 returningToken:(uint64_t)a2 orError:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = 2;
  OUTLINED_FUNCTION_3_0(&dword_221304000, a1, a3, "response for find existing credential: %lu", (uint8_t *)&v3);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.13()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "starting site code discovery", v2, v3, v4, v5, v6);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.14()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "using sitecode: %@", v2);
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:(NSObject *)a2 orError:.cold.15(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 credentialUUID];
  id v4 = [v3 UUIDString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, a2, v5, "using credential from cache: %@", v6);
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.16()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "Start of attemptKerberos", v2, v3, v4, v5, v6);
}

+ (void)saveValuesForPlugins:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "saveValuesForPlugins", v2, v3, v4, v5, v6);
}

+ (void)savePacValues:(void *)a1 atLogin:.cold.1(void *a1)
{
  uint64_t v1 = [a1 dateNextPacRefresh];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Next pac refresh: %@", v4, v5, v6, v7, v8);
}

- (void)setSiteCodeUsingContext:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "siteCodeForCurrentNetworkAndRealmUsingContext", v2, v3, v4, v5, v6);
}

- (void)retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "sitecode not found in cache", v2, v3, v4, v5, v6);
}

- (void)retrieveCachedSiteCodeFromCacheForBundleIdentifier:(void *)a1 networkFingerprint:.cold.2(void *a1)
{
  uint64_t v1 = [a1 code];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using cached sitecode: %@", v4, v5, v6, v7, v8);
}

- (void)retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "checking sitecode cache", v2, v3, v4, v5, v6);
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "calling discoverADInfo", v2, v3, v4, v5, v6);
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "sitecode saved", v2, v3, v4, v5, v6);
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "received sitecode: %@", v2);
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "password is missing", v2, v3, v4, v5, v6);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.2(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"kGSSICAppleSourceApp"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using source app signing identifier: %{public}@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.3(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"kGSSICAppleSourceApp"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using impersonation source app signing identifier: %{public}@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "complete bundleIdACL: %{public}@", v2);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.5(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"kGSSICSiteName"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using sitecode: %@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.6(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"kGSSICKerberosCacheName"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using cache: %@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.7(void *a1)
{
  uint64_t v1 = [a1 certificateTokenID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "certificate not found for token id: %@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.8(void *a1)
{
  uint64_t v1 = [a1 certificateTokenID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Could not get a SecIdentityRef for token id: %@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.9()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "error retrieving identity for persistient ref", v1, 2u);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.10(void *a1)
{
  uint64_t v1 = [a1 smartCardLAContext];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using LAContext: %@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:(uint64_t)a1 returningCredential:(void *)a2 orError:(NSObject *)a3 .cold.11(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a2 certificateTokenID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_221304000, a3, v5, "using certificate: %@ for token id: %@", v6);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.12(void *a1)
{
  uint64_t v1 = [a1 extensionData];
  uint64_t v2 = [v1 certificateUUID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v3, v4, "certificate not found for uuid: %@", v5, v6, v7, v8, v9);
}

- (void)createNewCredentialUsingContext:(uint64_t)a1 returningCredential:(void *)a2 orError:(NSObject *)a3 .cold.13(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a2 extensionData];
  uint64_t v5 = [v4 certificateUUID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_221304000, a3, v6, "using certificate: %@ for uuid: %@", v7);
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.14()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "using pkinit", v2, v3, v4, v5, v6);
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.15(void *a1)
{
  uint64_t v1 = [a1 userPrincipalName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using upn: %@", v4, v5, v6, v7, v8);
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.16()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "createNewCredentialUsingContext", v2, v3, v4, v5, v6);
}

- (void)findExistingCredentialUsingContext:(void *)a1 returningCredential:orError:.cold.1(void *a1)
{
  uint64_t v1 = [a1 userPrincipalName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "using upn: %@", v4, v5, v6, v7, v8);
}

- (void)findExistingCredentialUsingContext:returningCredential:orError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "findExistingCredentialUsingContext", v2, v3, v4, v5, v6);
}

- (void)changePasswordWithContext:(id *)a1 withError:.cold.1(id *a1)
{
  uint64_t v1 = [*a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v2, v3, "error during changePasswordForUPN: %{public}@", v4, v5, v6, v7, v8);
}

- (void)changePasswordWithContext:withError:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "changePasswordForUPN result: %{public}@", v2);
}

- (void)changePasswordWithContext:(NSObject *)a3 withError:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 userPrincipalName];
  int v6 = 136315650;
  uint64_t v7 = "-[SOKerberosAuthentication changePasswordWithContext:withError:]";
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_221304000, a3, OS_LOG_TYPE_DEBUG, "%s using upn: %{public}@ on %@", (uint8_t *)&v6, 0x20u);
}

- (void)refreshPacValuesWithContext:atLogin:error:.cold.1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  int v3 = 134218242;
  uint64_t v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  _os_log_error_impl(&dword_221304000, v2, OS_LOG_TYPE_ERROR, "Error retrieving new TGT after password change: %lu, %@", (uint8_t *)&v3, 0x16u);
}

- (void)refreshPacValuesWithContext:(uint64_t)a1 atLogin:(NSObject *)a2 error:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = "-[SOKerberosAuthentication refreshPacValuesWithContext:atLogin:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_9(&dword_221304000, a2, a3, "%s  on %@", (uint8_t *)&v3);
}

- (void)refreshPacValuesWithContext:credential:atLogin:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "Received Pac Data: %@", v2);
}

- (void)refreshPacValuesWithContext:credential:atLogin:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "Error refreshing pac", v1, 2u);
}

- (void)refreshPacValuesWithContext:(char)a1 credential:(uint64_t)a2 atLogin:(os_log_t)log .cold.3(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:]";
  __int16 v5 = 1024;
  int v6 = a1 & 1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_221304000, log, OS_LOG_TYPE_DEBUG, "%s login: %d on %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "trigger VPN: starting connection", v2, v3, v4, v5, v6);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "trigger VPN: creating per app vpn connection", v2, v3, v4, v5, v6);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "trigger VPN: creating vpn connection", v2, v3, v4, v5, v6);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "trigger VPN: no vpn to start", v2, v3, v4, v5, v6);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "trigger VPN: connection needed", v2, v3, v4, v5, v6);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "trigger VPN: using audit token", v2, v3, v4, v5, v6);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.7()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "trigger VPN: using bundleIdentifier: %{public}@", v2);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "start of trigger VPN if needed", v2, v3, v4, v5, v6);
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "trigger VPN: finished", v2, v3, v4, v5, v6);
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1 = [NSString stringWithCString:a1 encoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "trigger VPN: connection status: %{public}@", v4, v5, v6, v7, v8);
}

@end