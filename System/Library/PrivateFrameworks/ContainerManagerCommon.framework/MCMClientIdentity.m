@interface MCMClientIdentity
+ (id)anonymousPrivilegedClientIdentityWithUserIdentity:(id)a3;
+ (id)privilegedClientIdentityWithUserIdentity:(id)a3 kernel:(BOOL)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_checkIsAllowedToHaveSandboxExtensionForIdentity:(id)a3 containerPath:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7;
- (BOOL)_checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:(id)a3 identifier:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7;
- (BOOL)_checkShouldIssueExtensionForIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsPolicyUsesProxiedClient:(BOOL)a6 issueExtension:(BOOL *)a7 error:(id *)a8;
- (BOOL)_isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:(id)a3 clientIdentifier:(id)a4 containerConfig:(id)a5;
- (BOOL)_isClientAffordedSandboxForContainerIdentifier:(id)a3 containerConfig:(id)a4;
- (BOOL)_shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:(id)a3 identifier:(id)a4;
- (BOOL)cached;
- (BOOL)isAllowedToAccessCodesignMapping;
- (BOOL)isAllowedToAccessContainerIdentity:(id)a3 error:(unint64_t *)a4;
- (BOOL)isAllowedToAccessInfoMetadata;
- (BOOL)isAllowedToAccessUserAssets;
- (BOOL)isAllowedToChangeReferences;
- (BOOL)isAllowedToControlCaches;
- (BOOL)isAllowedToDelete;
- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3;
- (BOOL)isAllowedToLookupContainerIdentity:(id)a3;
- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4;
- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4;
- (BOOL)isAllowedToReadReferences;
- (BOOL)isAllowedToRecreateContainerStructure;
- (BOOL)isAllowedToRegenerateDirectoryUUIDs;
- (BOOL)isAllowedToReplaceContainers;
- (BOOL)isAllowedToRestoreContainer;
- (BOOL)isAllowedToSetDataProtection;
- (BOOL)isAllowedToStageSharedContent;
- (BOOL)isAllowedToStartDataMigration;
- (BOOL)isAllowedToStartUserDataMigration;
- (BOOL)isAllowedToTest;
- (BOOL)isAllowedToWipeAnyDataContainer;
- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3;
- (BOOL)isKernel;
- (BOOL)isSandboxed;
- (BOOL)isTestClient;
- (Class)amfiClass;
- (MCMAMFI)amfi;
- (MCMClientCodeSignInfo)codeSignInfo;
- (MCMClientIdentity)init;
- (MCMClientIdentity)initWithPOSIXUser:(id)a3 POSIXPID:(int)a4 platform:(unsigned int)a5 userIdentity:(id)a6 proximateClient:(id)a7 auditToken:(id *)a8 codeSignInfo:(id)a9 sandboxed:(BOOL)a10 sandboxContainerURL:(id)a11 testClient:(BOOL)a12 kernel:(BOOL)a13;
- (MCMClientIdentity)proximateClient;
- (MCMPOSIXUser)posixUser;
- (MCMUserIdentity)userIdentity;
- (NSString)description;
- (NSURL)sandboxContainerURL;
- (char)issueSandboxExtensionWithIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsUseProxiedClient:(BOOL)a6 extensionsPolicyUsesProxiedClient:(BOOL)a7 error:(id *)a8;
- (container_client)createLibsystemClient;
- (id)clientIdentityByChangingCached:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (id)shortDescription;
- (int)posixPID;
- (unsigned)platform;
- (void)setAMFIClass:(Class)a3;
@end

@implementation MCMClientIdentity

- (MCMClientIdentity)initWithPOSIXUser:(id)a3 POSIXPID:(int)a4 platform:(unsigned int)a5 userIdentity:(id)a6 proximateClient:(id)a7 auditToken:(id *)a8 codeSignInfo:(id)a9 sandboxed:(BOOL)a10 sandboxContainerURL:(id)a11 testClient:(BOOL)a12 kernel:(BOOL)a13
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a6;
  id v28 = a7;
  id v27 = a9;
  id v20 = a11;
  v29.receiver = self;
  v29.super_class = (Class)MCMClientIdentity;
  v21 = [(MCMClientIdentity *)&v29 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_posixUser, a3);
    v22->_posixPID = a4;
    v22->_platform = a5;
    objc_storeStrong((id *)&v22->_userIdentity, a6);
    objc_storeStrong((id *)&v22->_proximateClient, a7);
    long long v23 = *(_OWORD *)&a8->var0[4];
    *(_OWORD *)v22->_auditToken.val = *(_OWORD *)a8->var0;
    *(_OWORD *)&v22->_auditToken.val[4] = v23;
    objc_storeStrong((id *)&v22->_codeSignInfo, a9);
    v22->_sandboxed = a10;
    objc_storeStrong((id *)&v22->_sandboxContainerURL, a11);
    v22->_testClient = a12;
    v22->_kernel = a13;
    v22->_amfiClass = (Class)objc_opt_class();
  }

  return v22;
}

id __37__MCMClientIdentity_shortDescription__block_invoke(uint64_t a1, int a2)
{
  v44 = NSString;
  v49 = [*(id *)(a1 + 32) codeSignInfo];
  v4 = [v49 identifier];
  v5 = v4;
  uint64_t v6 = (uint64_t)v4;
  if (a2)
  {
    uint64_t v6 = [v4 redactedDescription];
  }
  v7 = *(void **)(a1 + 32);
  v8 = (void *)v7[6];
  v46 = v8;
  if (v8)
  {
    v9 = NSString;
    v32 = [v8 codeSignInfo];
    v31 = [v32 identifier];
    v51 = [v9 stringWithFormat:@"(%@)", v31];
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v51 = &stru_1F2EF6598;
  }
  v45 = [v7 codeSignInfo];
  v10 = [v45 teamIdentifier];
  uint64_t v11 = (uint64_t)v10;
  v47 = (void *)v6;
  v43 = v10;
  if (a2)
  {
    uint64_t v12 = [v10 redactedDescription];
    v41 = [*(id *)(a1 + 32) userIdentity];
    uint64_t v30 = [v41 shortDescription];
    uint64_t v50 = [v30 redactedDescription];
    uint64_t v40 = v12;
    v42 = (void *)v12;
  }
  else
  {
    v42 = [*(id *)(a1 + 32) userIdentity];
    [v42 shortDescription];
    v50 = uint64_t v40 = v11;
    v41 = (void *)v50;
  }
  v48 = v5;
  v39 = [*(id *)(a1 + 32) posixUser];
  uint64_t v37 = [v39 UID];
  uint64_t v36 = [*(id *)(a1 + 32) posixPID];
  uint64_t v35 = [*(id *)(a1 + 32) isSandboxed];
  uint64_t v34 = [*(id *)(a1 + 32) platform];
  v38 = [*(id *)(a1 + 32) codeSignInfo];
  uint64_t v33 = [v38 isSigned];
  v13 = [*(id *)(a1 + 32) codeSignInfo];
  uint64_t v14 = [v13 isSignatureValid];
  v15 = [*(id *)(a1 + 32) codeSignInfo];
  uint64_t v16 = [v15 isPlatformBinary];
  v17 = [*(id *)(a1 + 32) sandboxContainerURL];
  id v18 = [v17 path];
  id v19 = v18;
  id v20 = v18;
  if (a2)
  {
    id v20 = [v18 redactedDescription];
  }
  if ([*(id *)(a1 + 32) cached]) {
    v21 = ", cached";
  }
  else {
    v21 = "";
  }
  v22 = [*(id *)(a1 + 32) codeSignInfo];
  int v23 = [v22 cached];
  v24 = ", cs cached";
  if (!v23) {
    v24 = "";
  }
  v25 = [v44 stringWithFormat:@"<%@%@/%@, u=%@, uid=%u, pid=%u, sandboxed=%d, platform=%d (%d/%d/%d) [%@]%s%s>", v47, v51, v40, v50, v37, v36, v35, v34, v33, v14, v16, v20, v21, v24];

  if (a2)
  {

    id v19 = v15;
    v17 = v13;
    v15 = v38;
    v13 = v39;
    v26 = v48;
    id v27 = v30;
    id v28 = (void *)v50;
  }
  else
  {
    id v28 = v38;
    id v27 = v39;
    v26 = v48;
  }

  if (v46)
  {
  }
  if (a2) {

  }
  return v25;
}

- (MCMClientCodeSignInfo)codeSignInfo
{
  return self->_codeSignInfo;
}

- (unsigned)platform
{
  return self->_platform;
}

- (BOOL)cached
{
  return self->_cached;
}

- (BOOL)isAllowedToAccessContainerIdentity:(id)a3 error:(unint64_t *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (!MCMRequirePersona_result)
  {
LABEL_20:
    BOOL v8 = 1;
    goto LABEL_21;
  }
  unint64_t v7 = [v6 containerClass];
  BOOL v8 = 1;
  if (v7 <= 0xE && ((1 << v7) & 0x4ED4) != 0)
  {
    v9 = [v6 userIdentity];
    unsigned int v10 = [v9 personaType];

    if (v10 < 2)
    {
      v13 = [(MCMClientIdentity *)self userIdentity];
      uint64_t v14 = [v6 userIdentity];
      char v15 = [v13 isEqual:v14];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = container_log_handle_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v24 = [(MCMClientIdentity *)self codeSignInfo];
          v25 = [v24 identifier];
          v26 = [(MCMClientIdentity *)self userIdentity];
          id v27 = [v6 userIdentity];
          int v28 = 138543874;
          objc_super v29 = v25;
          __int16 v30 = 2114;
          uint64_t v31 = (uint64_t)v26;
          __int16 v32 = 2114;
          uint64_t v33 = v27;
          _os_log_fault_impl(&dword_1D7739000, v16, OS_LOG_TYPE_FAULT, "Client %{public}@ user identity does not match container user identity (client: %{public}@; container: %{public}@)",
            (uint8_t *)&v28,
            0x20u);
        }
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
        }
        if (!MCMRequirePersonaTelemetryOnly_result)
        {
          if (a4)
          {
            unint64_t v12 = 76;
            goto LABEL_24;
          }
LABEL_25:
          BOOL v8 = 0;
          goto LABEL_21;
        }
      }
    }
    else
    {
      uint64_t v11 = container_log_handle_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        id v18 = [(MCMClientIdentity *)self codeSignInfo];
        id v19 = [v18 identifier];
        uint64_t v20 = [v6 containerClass];
        v21 = [v6 identifier];
        v22 = [(MCMClientIdentity *)self userIdentity];
        int v23 = [v6 userIdentity];
        int v28 = 138544386;
        objc_super v29 = v19;
        __int16 v30 = 2048;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        uint64_t v33 = v21;
        __int16 v34 = 2114;
        uint64_t v35 = v22;
        __int16 v36 = 2114;
        uint64_t v37 = v23;
        _os_log_fault_impl(&dword_1D7739000, v11, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ with ambiguous user identity (client: %{public}@; container: %{public}@)",
          (uint8_t *)&v28,
          0x34u);
      }
      if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
        dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
      }
      if (!MCMRequirePersonaTelemetryOnly_result)
      {
        if (a4)
        {
          unint64_t v12 = 115;
LABEL_24:
          BOOL v8 = 0;
          *a4 = v12;
          goto LABEL_21;
        }
        goto LABEL_25;
      }
    }
    goto LABEL_20;
  }
LABEL_21:

  return v8;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (id)shortDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MCMClientIdentity_shortDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

- (NSURL)sandboxContainerURL
{
  return self->_sandboxContainerURL;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (int)posixPID
{
  return self->_posixPID;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (char)issueSandboxExtensionWithIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsUseProxiedClient:(BOOL)a6 extensionsPolicyUsesProxiedClient:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = [v14 containerClass];
  char v39 = 0;
  id v38 = 0;
  LODWORD(v11) = [(MCMClientIdentity *)self _checkShouldIssueExtensionForIdentity:v14 containerPath:v15 legacyExtensionPolicy:v11 extensionsPolicyUsesProxiedClient:v9 issueExtension:&v39 error:&v38];
  v17 = (MCMError *)v38;
  if (v11 && v39)
  {
    uint64_t v18 = v16 - 2;
    if (unint64_t)(v16 - 2) <= 0xB && ((0xD35u >> v18))
    {
      int v23 = off_1E6A7F220[v18];
      v24 = [v15 containerDataURL];
      id v25 = [v24 path];
      uint64_t v26 = [v25 fileSystemRepresentation];

      long long v43 = 0u;
      long long v44 = 0u;
      [(MCMClientIdentity *)self auditToken];
      if (!a6)
      {
        id v27 = [(MCMClientIdentity *)self proximateClient];
        int v28 = v27;
        if (v27) {
          [v27 auditToken];
        }
        else {
          memset(buf, 0, 32);
        }
        long long v43 = *(_OWORD *)buf;
        long long v44 = *(_OWORD *)&buf[16];
      }
      objc_super v29 = container_log_handle_for_category();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_OWORD *)buf = v43;
        *(_OWORD *)&buf[16] = v44;
        int pid = container_audit_token_get_pid();
        uint64_t v31 = [v14 identifier];
        uint64_t v32 = [v14 containerClass];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = pid;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v31;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v32;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v26;
        __int16 v41 = 2080;
        v42 = v23;
        _os_log_impl(&dword_1D7739000, v29, OS_LOG_TYPE_DEFAULT, "Issuing token to pid %d for identifier = [%@](%llu), path = [%s] (extension class: %s)", buf, 0x30u);
      }
      uint64_t v33 = container_sandbox_issue_custom_extension();
      if (v33)
      {
        v21 = (char *)v33;
        goto LABEL_10;
      }
      __int16 v34 = container_log_handle_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = [(MCMClientIdentity *)self codeSignInfo];
        __int16 v36 = [v35 identifier];
        int v37 = *__error();
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v37;
        _os_log_error_impl(&dword_1D7739000, v34, OS_LOG_TYPE_ERROR, "sandbox_extension_issue_file failed for %@ at path [%s]: %d", buf, 0x1Cu);
      }
      uint64_t v19 = 90;
    }
    else
    {
      uint64_t v19 = 72;
    }
    uint64_t v20 = [[MCMError alloc] initWithErrorType:v19];

    v17 = v20;
  }
  if (a8)
  {
    v17 = v17;
    v21 = 0;
    *a8 = v17;
  }
  else
  {
    v21 = 0;
  }
LABEL_10:

  return v21;
}

- (BOOL)_checkShouldIssueExtensionForIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsPolicyUsesProxiedClient:(BOOL)a6 issueExtension:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  BOOL v26 = 0;
  uint64_t v15 = [v13 containerClass];
  uint64_t v16 = [v13 identifier];
  id v17 = containermanager_copy_global_configuration();
  uint64_t v18 = [v17 staticConfig];
  uint64_t v19 = [v18 configForContainerClass:v15];

  if (v10
    && (BOOL v20 = [(MCMClientIdentity *)self _shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:v19 identifier:v16], v26 = v20, !v20))
  {
    id v23 = 0;
    BOOL v21 = 1;
  }
  else
  {
    id v25 = 0;
    BOOL v21 = [(MCMClientIdentity *)self _checkIsAllowedToHaveSandboxExtensionForIdentity:v13 containerPath:v14 containerConfig:v19 allowed:&v26 error:&v25];
    id v22 = v25;
    id v23 = v22;
    if (a8 && !v21)
    {
      id v23 = v22;
      LOBYTE(v21) = 0;
      *a8 = v23;
      goto LABEL_10;
    }
  }
  if (a7 && v21)
  {
    *a7 = v26;
    LOBYTE(v21) = 1;
  }
LABEL_10:

  return v21;
}

- (BOOL)_shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(MCMClientIdentity *)self codeSignInfo];
  BOOL v9 = [v8 entitlements];

  uint64_t v10 = [v7 containerClass];
  LOBYTE(v7) = [v9 isOwnerOfContainerWithClass:v10 identifier:v6];

  if (v7)
  {
    char v11 = 1;
  }
  else
  {
    unint64_t v12 = [(MCMClientIdentity *)self userIdentity];
    char v11 = [v12 isDataSeparated];
  }
  return v11;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (MCMClientIdentity)proximateClient
{
  if (self->_proximateClient) {
    self = self->_proximateClient;
  }

  return self;
}

- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = [(MCMClientIdentity *)self codeSignInfo];
  BOOL v8 = [v7 entitlements];
  LOBYTE(a3) = [v8 isAllowedToLookupGroupContainersOfClass:a3 ownedByIdentifiers:v6];

  return a3;
}

- (BOOL)isAllowedToLookupContainerIdentity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MCMClientIdentity *)self codeSignInfo];
  id v6 = [v5 entitlements];
  int v7 = [v6 isAllowedToLookupContainerIdentity:v4];

  if (v7)
  {
    uint64_t v11 = 1;
    BOOL v8 = [(MCMClientIdentity *)self isAllowedToAccessContainerIdentity:v4 error:&v11];
    if (!v8)
    {
      BOOL v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v13 = self;
        __int16 v14 = 2114;
        id v15 = v4;
        __int16 v16 = 2048;
        uint64_t v17 = v11;
        _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Client %{public}@ is not allowed to access container identity %{public}@: error %llu", buf, 0x20u);
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeSignInfo, 0);
  objc_storeStrong((id *)&self->_sandboxContainerURL, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_proximateClient, 0);
  objc_storeStrong((id *)&self->_posixUser, 0);

  objc_storeStrong((id *)&self->_amfi, 0);
}

- (id)clientIdentityByChangingCached:(BOOL)a3
{
  id v4 = (unsigned char *)[(MCMClientIdentity *)self copy];
  v4[27] = a3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initInternal");
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 28) = self->_posixPID;
    objc_storeStrong((id *)(v4 + 40), self->_posixUser);
    *(unsigned char *)(v5 + 25) = self->_sandboxed;
    long long v6 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)(v5 + 80) = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)(v5 + 96) = v6;
    objc_storeStrong((id *)(v5 + 48), self->_proximateClient);
    objc_storeStrong((id *)(v5 + 56), self->_userIdentity);
    *(unsigned char *)(v5 + 26) = self->_kernel;
    *(_DWORD *)(v5 + 32) = self->_platform;
    objc_storeStrong((id *)(v5 + 64), self->_sandboxContainerURL);
    objc_storeStrong((id *)(v5 + 72), self->_codeSignInfo);
    *(unsigned char *)(v5 + 27) = self->_cached;
    *(void *)(v5 + 8) = self->_amfiClass;
    objc_storeStrong((id *)(v5 + 16), self->_amfi);
    *(unsigned char *)(v5 + 24) = self->_testClient;
  }
  return (id)v5;
}

- (id)initInternal
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)MCMClientIdentity;
  return [(MCMClientIdentity *)&v3 init];
}

- (BOOL)_checkIsAllowedToHaveSandboxExtensionForIdentity:(id)a3 containerPath:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  BOOL v26 = 0;
  id v14 = a3;
  uint64_t v15 = [v14 containerClass];
  __int16 v16 = [v14 identifier];

  if (![(MCMClientIdentity *)self isAllowedToLookupViaPrivateEntitlementWithClass:v15 identifier:v16])
  {
    if ([v12 transient])
    {
      uint64_t v17 = [[MCMError alloc] initWithErrorType:72];
      if (a7) {
        goto LABEL_8;
      }
    }
    else
    {
      if (![v13 supportsProtectedContainerWithRestrictedEntitlement])
      {
        if (![v13 ownerIssuedSandboxExtension]
          || ([(MCMClientIdentity *)self codeSignInfo],
              id v22 = objc_claimAutoreleasedReturnValue(),
              [v22 entitlements],
              id v23 = objc_claimAutoreleasedReturnValue(),
              int v24 = [v23 isOwnerOfContainerWithClass:v15 identifier:v16],
              v23,
              v22,
              !v24))
        {
          uint64_t v17 = 0;
          goto LABEL_3;
        }
        goto LABEL_2;
      }
      id v25 = 0;
      BOOL v19 = [(MCMClientIdentity *)self _checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:v12 identifier:v16 containerConfig:v13 allowed:&v26 error:&v25];
      uint64_t v17 = (MCMError *)v25;
      if (v19) {
        goto LABEL_3;
      }
      BOOL v20 = container_log_handle_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        int v28 = v16;
        __int16 v29 = 2112;
        __int16 v30 = v17;
        _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Failed to check whether to issue sandbox extension for [%@]; error = %@",
          buf,
          0x16u);
      }

      if (a7)
      {
LABEL_8:
        uint64_t v17 = v17;
        BOOL v18 = 0;
        *a7 = v17;
        goto LABEL_15;
      }
    }
    BOOL v18 = 0;
    goto LABEL_15;
  }
LABEL_2:
  uint64_t v17 = 0;
  BOOL v26 = 1;
LABEL_3:
  if (a6) {
    *a6 = v26;
  }
  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  int v7 = [(MCMClientIdentity *)self codeSignInfo];
  BOOL v8 = [v7 entitlements];
  LOBYTE(a3) = [v8 isAllowedToLookupViaPrivateEntitlementWithClass:a3 identifier:v6];

  return a3;
}

+ (id)privilegedClientIdentityWithUserIdentity:(id)a3 kernel:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = a3;
  container_codesign_get_self_audit_token();
  int v7 = [MCMEntitlements alloc];
  id v8 = containermanager_copy_global_configuration();
  BOOL v9 = [v8 classIterator];
  uint64_t v10 = [(MCMEntitlements *)v7 initWithEntitlements:&unk_1F2F10E78 clientIdentifier:@"com.apple.containermanagerd" classIterator:v9];

  uint64_t v11 = [MCMClientCodeSignInfo alloc];
  id v12 = objc_opt_new();
  id v13 = [(MCMClientCodeSignInfo *)v11 initWithCDHash:v12 entitlements:v10 identifier:@"com.apple.containermanagerd" teamIdentifier:0 status:7];

  id v14 = objc_alloc((Class)a1);
  id v15 = containermanager_copy_global_configuration();
  __int16 v16 = [v15 currentUser];
  uint64_t v17 = getpid();
  *(_OWORD *)buf = 0u;
  long long v24 = 0u;
  BYTE1(v22) = a4;
  LOBYTE(v22) = 0;
  LOBYTE(v21) = 0;
  BOOL v18 = objc_msgSend(v14, "initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxContainerURL:testClient:kernel:", v16, v17, dyld_get_active_platform(), v6, 0, buf, v13, v21, 0, v22);

  if (!v18)
  {
    BOOL v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D7739000, v19, OS_LOG_TYPE_FAULT, "Could not generate privileged client", buf, 2u);
    }
  }

  return v18;
}

- (BOOL)isAllowedToAccessUserAssets
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToAccessUserAssets];

  return v4;
}

id __32__MCMClientIdentity_description__block_invoke(uint64_t a1, int a2)
{
  v49 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  v54 = NSStringFromClass(v4);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  v53 = v5;
  uint64_t v47 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = NSString;
    __int16 v34 = [v5 codeSignInfo];
    uint64_t v33 = [v34 identifier];
    int v7 = [v6 stringWithFormat:@"(via [%@]) ", v33];
  }
  else
  {
    int v7 = &stru_1F2EF6598;
  }
  v51 = [*(id *)(a1 + 32) codeSignInfo];
  id v8 = [v51 identifier];
  uint64_t v9 = (uint64_t)v8;
  v52 = v7;
  uint64_t v50 = v8;
  if (a2)
  {
    uint64_t v10 = [v8 redactedDescription];
    v48 = [*(id *)(a1 + 32) codeSignInfo];
    v46 = [v48 teamIdentifier];
    uint64_t v11 = [v46 redactedDescription];
    uint64_t v32 = [*(id *)(a1 + 32) userIdentity];
    uint64_t v43 = [v32 redactedDescription];
    uint64_t v31 = [*(id *)(a1 + 32) posixUser];
    uint64_t v55 = [v31 redactedDescription];
    uint64_t v42 = v10;
    long long v44 = (void *)v11;
    uint64_t v45 = (void *)v10;
    uint64_t v41 = v11;
  }
  else
  {
    uint64_t v45 = [*(id *)(a1 + 32) codeSignInfo];
    uint64_t v12 = [v45 teamIdentifier];
    uint64_t v13 = [*(id *)(a1 + 32) userIdentity];
    [*(id *)(a1 + 32) posixUser];
    uint64_t v42 = v9;
    uint64_t v43 = v13;
    v46 = (void *)v13;
    v48 = (void *)v12;
    v55 = uint64_t v41 = v12;
    long long v44 = (void *)v55;
  }
  uint64_t v38 = [*(id *)(a1 + 32) posixPID];
  uint64_t v37 = [*(id *)(a1 + 32) isSandboxed];
  uint64_t v36 = [*(id *)(a1 + 32) platform];
  uint64_t v40 = [*(id *)(a1 + 32) codeSignInfo];
  if ([v40 isSigned]) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  uint64_t v35 = v14;
  char v39 = [*(id *)(a1 + 32) codeSignInfo];
  if ([v39 isSignatureValid]) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  __int16 v16 = [*(id *)(a1 + 32) codeSignInfo];
  if ([v16 isPlatformBinary]) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  BOOL v18 = [*(id *)(a1 + 32) sandboxContainerURL];
  BOOL v19 = [v18 path];
  BOOL v20 = v19;
  uint64_t v21 = v19;
  int v22 = a2;
  if (a2)
  {
    uint64_t v21 = [v19 redactedDescription];
  }
  if ([*(id *)(a1 + 32) cached]) {
    id v23 = ", cached";
  }
  else {
    id v23 = "";
  }
  long long v24 = [*(id *)(a1 + 32) codeSignInfo];
  int v25 = [v24 cached];
  long long v26 = ", cs cached";
  if (!v25) {
    long long v26 = "";
  }
  uint64_t v27 = (void *)v43;
  objc_msgSend(v49, "stringWithFormat:", @"<%@: %p; %@identifier = %@, teamIdentifier = %@, userIdentity = %@, posixUser = %@, posixPID = %u, isSandboxed = %d, platform = %d, isSigned = %@, isSignatureValid = %@, isPlatformBinary = %@, sandboxContainerURL = [%@]%s%s>",
    v54,
    v47,
    v52,
    v42,
    v41,
    v43,
    v55,
    v38,
    v37,
    v36,
    v35,
    v15,
    v17,
    v21,
    v23,
  int v28 = v26);

  if (v22)
  {

    BOOL v20 = v40;
    __int16 v16 = v31;
    __int16 v29 = v32;
    BOOL v18 = (void *)v55;
  }
  else
  {
    uint64_t v27 = v39;
    __int16 v29 = v40;
  }

  if (v53)
  {
  }

  return v28;
}

- (NSString)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MCMClientIdentity_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  char v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

- (BOOL)isKernel
{
  return self->_kernel;
}

- (BOOL)isTestClient
{
  return self->_testClient;
}

- (void)setAMFIClass:(Class)a3
{
  self->_amfiClass = a3;
}

- (Class)amfiClass
{
  Class amfiClass = self->_amfiClass;

  return amfiClass;
}

- (BOOL)_isClientAffordedSandboxForContainerIdentifier:(id)a3 containerConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCMClientIdentity *)self codeSignInfo];
  uint64_t v9 = [v8 teamIdentifier];

  if (v9)
  {
    uint64_t v10 = [v7 sandboxAffordances];
    uint64_t v11 = [v10 objectForKeyedSubscript:v9];
    if (v11)
    {
      uint64_t v12 = [v6 lowercaseString];
      char v13 = [v11 containsObject:v12];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:(id)a3 clientIdentifier:(id)a4 containerConfig:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MCMClientIdentity *)self _isClientAffordedSandboxForContainerIdentifier:v8 containerConfig:v10])
  {
    uint64_t v11 = container_log_handle_for_category();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      BOOL v17 = 1;
      goto LABEL_15;
    }
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    uint64_t v12 = "[%@] requesting [%@]: DEVELOPER ACTION REQUIRED. Requestor's signature is given temporary compatibility afford"
          "ance to access a TCC-protected group container. Group containers identifiers should be prefixed by requestor's"
          " team ID on this platform.";
LABEL_4:
    _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 0x16u);
    goto LABEL_11;
  }
  uint64_t v11 = [v8 stringByExtractingTeamIDPrefix];
  if (!v11 && ![v10 alwaysRequireSignatureScrutiny])
  {
    uint64_t v11 = container_log_handle_for_category();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    uint64_t v12 = "[%@] requesting [%@]: The container IS NOT PROTECTED since it isn't prefixed by team ID. Group containers iden"
          "tifiers must be prefixed by requestor's team ID on this platform for container security to be enforced.";
    goto LABEL_4;
  }
  char v13 = [(MCMClientIdentity *)self amfi];
  int v14 = [v13 signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:v10 teamID:v11];

  id v15 = container_log_handle_for_category();
  __int16 v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "[%@] requesting [%@]: APPROVED. Requestor's signature allows it to access a TCC-protected group container", (uint8_t *)&v19, 0x16u);
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "[%@] requesting [%@]: REJECTED. Requestor's signature does not allow it to access a TCC-protected group container. Group containers identifiers should be prefixed by requestor's team ID to allow access on this platform.", (uint8_t *)&v19, 0x16u);
  }

  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)_checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:(id)a3 identifier:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  char v45 = 0;
  id v13 = a3;
  int v14 = [(MCMClientIdentity *)self codeSignInfo];
  id v15 = [v14 entitlements];
  __int16 v16 = [v13 containerRootURL];

  BOOL v17 = [MCMFileHandle alloc];
  BOOL v18 = [v16 path];
  LOBYTE(v38) = 0;
  int v19 = [(MCMFileHandle *)v17 initWithPath:v18 relativeToFileHandle:0 direction:10 symlinks:2 createMode:0 createDPClass:0 openLazily:v38];

  id v44 = 0;
  LOBYTE(v17) = [(MCMFileHandle *)v19 openWithError:&v44];
  id v20 = (__CFString *)v44;
  __int16 v21 = v20;
  if ((v17 & 1) == 0)
  {
    long long v24 = container_log_handle_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      [v14 identifier];
      uint64_t v42 = v15;
      v29 = id v28 = v12;
      __int16 v30 = [v16 path];
      *(_DWORD *)buf = 138413058;
      uint64_t v47 = v29;
      __int16 v48 = 2112;
      id v49 = v11;
      __int16 v50 = 2112;
      v51 = v30;
      __int16 v52 = 2112;
      v53 = v21;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "[%@] requesting [%@]: Failed to open [%@] during app group non-TCC policy protection check: %@", buf, 0x2Au);

      id v12 = v28;
      id v15 = v42;
    }
    goto LABEL_15;
  }
  uint64_t v40 = v12;
  uint64_t v43 = v20;
  BOOL v22 = [(MCMFileHandle *)v19 checkAppContainerProtection:&v45 error:&v43];
  char v39 = v43;

  uint64_t v23 = container_log_handle_for_category();
  long long v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = [v14 identifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v47 = v37;
      __int16 v48 = 2112;
      id v49 = v11;
      __int16 v50 = 2112;
      __int16 v21 = v39;
      v51 = v39;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "[%@] requesting [%@]: Failed to check app group container non-TCC policy protection; error = %@",
        buf,
        0x20u);
    }
    else
    {
      __int16 v21 = v39;
    }
    id v12 = v40;
LABEL_15:

    uint64_t v31 = [[MCMError alloc] initWithNSError:v21 url:v16 defaultErrorType:144];
    [(MCMFileHandle *)v19 close];
    if (a7)
    {
      uint64_t v31 = v31;
      BOOL v32 = 0;
      *a7 = v31;
    }
    else
    {
      BOOL v32 = 0;
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = [v14 identifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v47 = v25;
    if (v45) {
      long long v26 = &stru_1F2EF6598;
    }
    else {
      long long v26 = @"not ";
    }
    __int16 v48 = 2112;
    id v49 = v11;
    __int16 v50 = 2112;
    v51 = v26;
    _os_log_impl(&dword_1D7739000, v24, OS_LOG_TYPE_DEFAULT, "[%@] requesting [%@]: App group container is %@protected with a non-TCC policy", buf, 0x20u);
  }
  if (([v15 isOwnerOfProtectedAppGroupContainerWithIdentifier:v11] & 1) == 0)
  {
    id v12 = v40;
    if (v45)
    {
      BOOL v33 = 0;
    }
    else
    {
      if (objc_msgSend(v15, "isOwnerOfContainerWithClass:identifier:", objc_msgSend(v40, "containerClass"), v11))
      {
        __int16 v34 = [v14 identifier];
        BOOL v33 = [(MCMClientIdentity *)self _isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:v11 clientIdentifier:v34 containerConfig:v40];

        id v12 = v40;
      }
      else
      {
        BOOL v33 = 0;
      }
      if (!v45) {
        goto LABEL_25;
      }
    }
    if (([v15 isOwnerOfProtectedAppGroupContainerWithIdentifier:v11] & 1) == 0)
    {
      BOOL v27 = v33;
      goto LABEL_29;
    }
LABEL_25:
    char v35 = [v12 ownerIssuedSandboxExtension];
    if (v33) {
      BOOL v27 = 1;
    }
    else {
      BOOL v27 = v35;
    }
    goto LABEL_29;
  }
  BOOL v27 = 1;
  id v12 = v40;
LABEL_29:
  [(MCMFileHandle *)v19 close];
  uint64_t v31 = 0;
  if (a6) {
    *a6 = v27;
  }
  BOOL v32 = 1;
  __int16 v21 = v39;
LABEL_32:

  return v32;
}

- (BOOL)isAllowedToChangeReferences
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToChangeReferences];

  return v4;
}

- (BOOL)isAllowedToReadReferences
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToReadReferences];

  return v4;
}

- (BOOL)isAllowedToStageSharedContent
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToStageSharedContent];

  return v4;
}

- (BOOL)isAllowedToStartUserDataMigration
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToStartUserDataMigration];

  return v4;
}

- (BOOL)isAllowedToStartDataMigration
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToStartDataMigration];

  return v4;
}

- (BOOL)isAllowedToRestoreContainer
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToRestoreContainer];

  return v4;
}

- (BOOL)isAllowedToSetDataProtection
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToSetDataProtection];

  return v4;
}

- (BOOL)isAllowedToAccessCodesignMapping
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToAccessCodesignMapping];

  return v4;
}

- (BOOL)isAllowedToTest
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToTest];

  return v4;
}

- (BOOL)isAllowedToWipeAnyDataContainer
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToWipeAnyDataContainer];

  return v4;
}

- (BOOL)isAllowedToDelete
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToDelete];

  return v4;
}

- (BOOL)isAllowedToRegenerateDirectoryUUIDs
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToRegenerateDirectoryUUIDs];

  return v4;
}

- (BOOL)isAllowedToRecreateContainerStructure
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToRecreateContainerStructure];

  return v4;
}

- (BOOL)isAllowedToAccessInfoMetadata
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToAccessInfoMetadata];

  return v4;
}

- (BOOL)isAllowedToReplaceContainers
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToReplaceContainers];

  return v4;
}

- (BOOL)isAllowedToControlCaches
{
  v2 = [(MCMClientIdentity *)self codeSignInfo];
  objc_super v3 = [v2 entitlements];
  char v4 = [v3 isAllowedToControlCaches];

  return v4;
}

- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCMClientIdentity *)self codeSignInfo];
  id v6 = [v5 entitlements];
  LOBYTE(self) = [v6 isAllowedToWipePlugInDataContainerWithIdentifier:v4];

  return (char)self;
}

- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3
{
  id v4 = [(MCMClientIdentity *)self codeSignInfo];
  uint64_t v5 = [v4 entitlements];
  LOBYTE(a3) = [v5 isAllowedToLookupAllContainersOfClass:a3];

  return a3;
}

- (MCMAMFI)amfi
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  amfi = v2->_amfi;
  if (!amfi)
  {
    id v4 = [(objc_class *)[(MCMClientIdentity *)v2 amfiClass] alloc];
    [(MCMClientIdentity *)v2 auditToken];
    uint64_t v5 = [(objc_class *)v4 initWithAuditToken:v9];
    id v6 = v2->_amfi;
    v2->_amfi = (MCMAMFI *)v5;

    amfi = v2->_amfi;
  }
  id v7 = amfi;
  objc_sync_exit(v2);

  return v7;
}

- (container_client)createLibsystemClient
{
  [(MCMClientIdentity *)self isTestClient];
  id v15 = [(MCMClientIdentity *)self codeSignInfo];
  id v14 = [v15 identifier];
  [v14 UTF8String];
  id v13 = [(MCMClientIdentity *)self codeSignInfo];
  id v12 = [v13 teamIdentifier];
  [v12 UTF8String];
  [(MCMClientIdentity *)self platform];
  id v11 = [(MCMClientIdentity *)self userIdentity];
  id v3 = [v11 personaUniqueString];
  [v3 UTF8String];
  id v4 = [(MCMClientIdentity *)self posixUser];
  [v4 UID];
  uint64_t v5 = [(MCMClientIdentity *)self posixUser];
  [v5 primaryGID];
  [(MCMClientIdentity *)self auditToken];
  [(MCMClientIdentity *)self posixPID];
  id v6 = [(MCMClientIdentity *)self codeSignInfo];
  [v6 isSigned];
  id v7 = [(MCMClientIdentity *)self codeSignInfo];
  [v7 isSignatureValid];
  id v8 = [(MCMClientIdentity *)self codeSignInfo];
  [v8 isPlatformBinary];
  id v9 = (container_client *)container_client_initializer();

  return v9;
}

- (MCMClientIdentity)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_fault_impl(&dword_1D7739000, v3, OS_LOG_TYPE_FAULT, "You cannot init this class directly.", v5, 2u);
  }

  return 0;
}

+ (id)anonymousPrivilegedClientIdentityWithUserIdentity:(id)a3
{
  return (id)[a1 privilegedClientIdentityWithUserIdentity:a3 kernel:0];
}

@end