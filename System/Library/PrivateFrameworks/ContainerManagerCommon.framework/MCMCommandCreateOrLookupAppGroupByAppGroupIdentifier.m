@interface MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier
+ (BOOL)secureRestrictedContainerIfNeededWithMetadata:(id)a3 entitlements:(id)a4 error:(id *)a5;
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)alwaysReturnPath;
- (BOOL)clientIsAllowed;
- (BOOL)preflightClientAllowed;
- (MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerConfiguration)containerConfig;
- (MCMContainerIdentity)containerIdentity;
- (MCMError)error;
- (MCMUserIdentity)userIdentity;
- (NSString)appGroupIdentifier;
- (unsigned)expectedPersonaKernelID;
- (void)_commonInit:(id)a3;
- (void)execute;
@end

@implementation MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier

- (MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier;
  v10 = [(MCMCommand *)&v14 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v8 appGroupIdentifier];
    appGroupIdentifier = v10->_appGroupIdentifier;
    v10->_appGroupIdentifier = (NSString *)v11;

    [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)v10 _commonInit:v9];
  }

  return v10;
}

- (void)_commonInit:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_appGroupIdentifier;
  uint64_t v38 = 1;
  v6 = [(MCMCommand *)self context];
  v7 = [v6 globalConfiguration];
  id v8 = [v7 staticConfig];
  id v9 = [v8 configForContainerClass:7];
  containerConfig = self->_containerConfig;
  self->_containerConfig = v9;

  self->_clientIsAllowed = 0;
  uint64_t v11 = [v4 clientIdentity];
  v12 = +[MCMXPCMessageBase userIdentityForContainerIdentifier:v5 clientIdentity:v11 containerClass:7 error:&v38];
  userIdentity = self->_userIdentity;
  self->_userIdentity = v12;

  if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
    dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
  }
  if (MCMRequirePersonaTelemetryOnly_result
    && v38 != 1
    && [(MCMUserIdentity *)self->_userIdentity isNoSpecificPersona])
  {
    objc_super v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v37 = [v4 clientIdentity];
      v31 = [v37 codeSignInfo];
      v32 = [v31 identifier];
      v33 = [v4 clientIdentity];
      *(_DWORD *)buf = 138544130;
      v40 = v32;
      __int16 v41 = 2048;
      uint64_t v42 = 7;
      __int16 v43 = 2114;
      v44 = v5;
      __int16 v45 = 2114;
      v46 = v33;
      _os_log_fault_impl(&dword_1D7739000, v14, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);
    }
    uint64_t v38 = 1;
  }
  else
  {
    if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_18);
    }
    uint64_t v15 = v38;
    if (MCMRequirePersonaAndConvertSystemToPersonal_result && v38 != 1)
    {
      if ([(MCMUserIdentity *)self->_userIdentity isNoSpecificPersona])
      {
        v16 = container_log_handle_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v34 = [v4 clientIdentity];
          v35 = [v34 codeSignInfo];
          v36 = [v35 identifier];
          *(_DWORD *)buf = 138543874;
          v40 = v36;
          __int16 v41 = 2048;
          uint64_t v42 = 7;
          __int16 v43 = 2114;
          v44 = v5;
          _os_log_fault_impl(&dword_1D7739000, v16, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);
        }
        uint64_t v38 = 1;
        v17 = [v4 userIdentityCache];
        v18 = [(MCMUserIdentity *)self->_userIdentity posixUser];
        v19 = [v17 userIdentityForPersonalPersonaWithPOSIXUser:v18];
        v20 = self->_userIdentity;
        self->_userIdentity = v19;
      }
      uint64_t v15 = v38;
    }
    if (v15 != 1) {
      goto LABEL_22;
    }
  }
  self->_alwaysReturnPath = 0;
  v21 = self->_userIdentity;
  v22 = self->_containerConfig;
  v23 = [v4 clientIdentity];
  uint64_t v24 = [v23 platform];
  v25 = [v4 userIdentityCache];
  v26 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v21 identifier:v5 containerConfig:v22 platform:v24 userIdentityCache:v25 error:&v38];
  containerIdentity = self->_containerIdentity;
  self->_containerIdentity = v26;

  if (!self->_containerIdentity && !self->_alwaysReturnPath)
  {
LABEL_22:
    v29 = [MCMError alloc];
    v30 = [(MCMError *)v29 initWithErrorType:v38];
    error = self->_error;
    self->_error = v30;
    goto LABEL_23;
  }
  error = [v4 clientIdentity];
  self->_clientIsAllowed = [error isAllowedToLookupContainerIdentity:self->_containerIdentity];
LABEL_23:
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (void)execute
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v77 = MEMORY[0x1D9478DF0](self, a2);
  __s = 0;
  uint64_t v82 = 1;
  v3 = [(MCMCommand *)self context];
  id v4 = [v3 clientIdentity];

  v5 = [v4 codeSignInfo];
  v6 = [v5 entitlements];
  v7 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerIdentity];
  id v8 = [v7 identifier];
  int v9 = [v6 negatesReferenceToAppGroupIdentifier:v8];

  v10 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self error];

  if (v10)
  {
    uint64_t v11 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self error];
LABEL_3:
    v12 = 0;
    v13 = 0;
    objc_super v14 = 0;
    uint64_t v15 = 0;
LABEL_4:
    v16 = (void *)v77;
LABEL_5:
    v17 = [(MCMResultBase *)[MCMResultWithContainerBase alloc] initWithError:v11];
    goto LABEL_6;
  }
  if (![(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self clientIsAllowed])
  {
    if (![(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self alwaysReturnPath])
    {
      uint64_t v11 = 0;
      goto LABEL_3;
    }
    int v76 = v9;
    v34 = [v4 userIdentity];
    v35 = [v4 posixUser];
    v36 = [v34 userIdentityWithPOSIXUser:v35];

    if (!v36)
    {
      v12 = 0;
      v17 = 0;
      uint64_t v11 = 0;
      v16 = (void *)v77;
LABEL_34:

      uint64_t v15 = 0;
      if (v11 || v82 == 1)
      {
        objc_super v14 = 0;
        v13 = 0;
      }
      else
      {
        v54 = [MCMError alloc];
        uint64_t v11 = [(MCMError *)v54 initWithErrorType:v82];
        uint64_t v15 = 0;
        objc_super v14 = 0;
        v13 = 0;
      }
      goto LABEL_38;
    }
    uint64_t v37 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v38 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self appGroupIdentifier];
    v39 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerIdentity];
    v40 = [v39 containerConfig];
    uint64_t v41 = [v4 platform];
    uint64_t v42 = [(MCMCommand *)self context];
    __int16 v43 = [v42 userIdentityCache];
    v72 = (void *)v37;
    v75 = v36;
    v44 = +[MCMConcreteContainerIdentity containerIdentityWithUUID:v37 userIdentity:v36 identifier:v38 containerConfig:v40 platform:v41 userIdentityCache:v43 error:&v82];

    if (v44)
    {
      __int16 v45 = +[MCMFileManager defaultManager];
      v46 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self appGroupIdentifier];
      uint64_t v47 = [v45 fsSanitizedStringFromString:v46 allowSpaces:1];

      if (v47)
      {
        v12 = +[MCMContainerPath containerPathForContainerIdentity:v44 containerPathIdentifier:v47];
        v65 = [MCMResultWithContainerBase alloc];
        v63 = [v12 containerPathIdentifier];
        v59 = [v44 identifier];
        uint64_t v61 = [v44 containerClass];
        v69 = [v44 userIdentity];
        v48 = [v69 posixUser];
        v49 = [v44 userIdentity];
        v50 = [v49 personaUniqueString];
        [v12 containerDataURL];
        v51 = v67 = v44;
        LOBYTE(v57) = 0;
        LOBYTE(v56) = 1;
        v17 = [(MCMResultWithContainerBase *)v65 initWithUUID:v72 containerPathIdentifier:v63 identifier:v59 containerClass:v61 POSIXUser:v48 personaUniqueString:v50 sandboxToken:0 existed:v56 url:v51 info:0 transient:v57 userManagedAssetsRelPath:0 creator:0];

        v44 = v67;
        v52 = v72;

        uint64_t v11 = 0;
LABEL_33:

        v16 = (void *)v77;
        v36 = v75;
        goto LABEL_34;
      }
      v53 = container_log_handle_for_category();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v55 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self appGroupIdentifier];
        *(_DWORD *)buf = 138543362;
        v84 = v55;
        _os_log_error_impl(&dword_1D7739000, v53, OS_LOG_TYPE_ERROR, "Invalid app group identifier [%{public}@]", buf, 0xCu);
      }
      uint64_t v11 = [[MCMError alloc] initWithErrorType:138 category:3];
      v12 = 0;
      v17 = 0;
    }
    else
    {
      v12 = 0;
      v17 = 0;
      uint64_t v11 = 0;
    }
    v52 = v72;
    goto LABEL_33;
  }
  v19 = [(MCMCommand *)self context];
  v20 = [v19 containerFactory];
  v21 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerIdentity];
  id v80 = 0;
  uint64_t v15 = [v20 containerForContainerIdentity:v21 createIfNecessary:v9 ^ 1u error:&v80];
  uint64_t v11 = (MCMError *)v80;

  objc_super v14 = [v15 metadataMinimal];
  if (!v14) {
    goto LABEL_25;
  }
  v22 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerConfig];
  int v23 = [v22 supportsProtectedContainerWithRestrictedEntitlement];

  int v76 = v9;
  if (v23)
  {
    uint64_t v24 = [(MCMCommand *)self context];
    v25 = [v24 clientIdentity];
    v26 = [v25 codeSignInfo];
    v27 = [v26 entitlements];
    v79 = v11;
    BOOL v73 = +[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier secureRestrictedContainerIfNeededWithMetadata:v14 entitlements:v27 error:&v79];
    v28 = v79;

    if (!v73)
    {
      v12 = 0;
      v13 = 0;
      uint64_t v11 = v28;
      goto LABEL_4;
    }
    uint64_t v11 = v28;
  }
  v29 = v11;
  v30 = [v14 containerIdentity];
  v31 = [v14 containerPath];
  v78 = v11;
  v32 = (void *)[v4 issueSandboxExtensionWithIdentity:v30 containerPath:v31 legacyExtensionPolicy:1 extensionsUseProxiedClient:1 extensionsPolicyUsesProxiedClient:1 error:&v78];
  uint64_t v11 = v78;

  __s = v32;
  if (!v32 && v11 && [(MCMError *)v11 type] != 1 && [(MCMError *)v11 type] != 72)
  {
LABEL_25:
    v12 = 0;
    v13 = 0;
    goto LABEL_4;
  }
  v12 = [v14 containerPath];
  v13 = [v12 containerDataURL];
  v71 = [MCMResultWithContainerBase alloc];
  v74 = [v14 uuid];
  v70 = [v14 containerPath];
  v66 = [v70 containerPathIdentifier];
  v64 = [v14 identifier];
  uint64_t v62 = [v14 containerClass];
  v68 = [v14 userIdentity];
  v58 = [v68 posixUser];
  v60 = [v14 userIdentity];
  v33 = [v60 personaUniqueString];
  LOBYTE(v57) = 0;
  LOBYTE(v56) = [v14 existed];
  v17 = [(MCMResultWithContainerBase *)v71 initWithUUID:v74 containerPathIdentifier:v66 identifier:v64 containerClass:v62 POSIXUser:v58 personaUniqueString:v33 sandboxToken:v32 existed:v56 url:v13 info:0 transient:v57 userManagedAssetsRelPath:0 creator:0];

  v16 = (void *)v77;
LABEL_38:
  if (!v17) {
    goto LABEL_5;
  }
  if (v76) {
    [(MCMResultBase *)v17 setCacheable:0];
  }
LABEL_6:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  v18 = [(MCMCommand *)self resultPromise];
  [v18 completeWithResult:v17];
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self error];

  if (v3) {
    goto LABEL_2;
  }
  if ([(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self alwaysReturnPath]
    || (BOOL v4 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self clientIsAllowed]))
  {
    if (MCMRequirePersona_onceToken != -1) {
      dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
    }
    if (!MCMRequirePersona_result) {
      goto LABEL_2;
    }
    v5 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerIdentity];
    unint64_t v6 = [v5 containerClass];
    if (v6 > 0xE || ((1 << v6) & 0x4ED4) == 0)
    {

LABEL_2:
      LOBYTE(v4) = 1;
      return v4;
    }
    v7 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerIdentity];
    id v8 = [v7 userIdentity];
    int v9 = [v8 isNoSpecificPersona];

    if (!v9) {
      goto LABEL_2;
    }
    v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v21 = [(MCMCommand *)self context];
      uint64_t v11 = [v21 clientIdentity];
      v12 = [v11 codeSignInfo];
      v13 = [v12 identifier];
      objc_super v14 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerIdentity];
      uint64_t v15 = [v14 containerClass];
      v16 = [(MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *)self containerIdentity];
      v17 = [v16 identifier];
      v18 = [(MCMCommand *)self context];
      v19 = [v18 clientIdentity];
      *(_DWORD *)buf = 138544130;
      int v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      v27 = v17;
      __int16 v28 = 2114;
      v29 = v19;
      _os_log_fault_impl(&dword_1D7739000, v10, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);
    }
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result) {
      goto LABEL_2;
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMError)error
{
  return self->_error;
}

- (BOOL)clientIsAllowed
{
  return self->_clientIsAllowed;
}

- (BOOL)alwaysReturnPath
{
  return self->_alwaysReturnPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerConfig, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_appGroupIdentifier, 0);
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

+ (BOOL)secureRestrictedContainerIfNeededWithMetadata:(id)a3 entitlements:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 identifier];
  v10 = [v8 containerPath];

  uint64_t v11 = [v10 containerRootURL];

  v12 = [MCMFileHandle alloc];
  v13 = [v11 path];
  LOBYTE(v30) = 0;
  objc_super v14 = [(MCMFileHandle *)v12 initWithPath:v13 relativeToFileHandle:0 direction:10 symlinks:1 createMode:0 createDPClass:0 openLazily:v30];

  int v15 = [v7 isOwnerOfProtectedAppGroupContainerWithIdentifier:v9];
  id v16 = 0;
  if (!v15)
  {
LABEL_7:
    [(MCMFileHandle *)v14 close];
    __int16 v24 = 0;
    BOOL v25 = 1;
    v19 = v16;
    goto LABEL_17;
  }
  id v32 = 0;
  BOOL v17 = [(MCMFileHandle *)v14 openWithError:&v32];
  id v18 = v32;
  v19 = v18;
  if (v17)
  {
    id v31 = v18;
    BOOL v20 = [(MCMFileHandle *)v14 registerAppContainerForProtectionWithError:&v31];
    id v16 = v31;

    v21 = container_log_handle_for_category();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = [v11 path];
        *(_DWORD *)buf = 138412546;
        v34 = v9;
        __int16 v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_1D7739000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Registered app group container at [%@] for protection", buf, 0x16u);
      }
      goto LABEL_7;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v29 = [v11 path];
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      __int16 v35 = 2112;
      v36 = v29;
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "[%@] Failed to register app group container at [%@] for protection; error = %@",
        buf,
        0x20u);
    }
    __int16 v24 = [[MCMError alloc] initWithNSError:v16 url:v11 defaultErrorType:145];
    v19 = v16;
  }
  else
  {
    __int16 v26 = container_log_handle_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = [v11 path];
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      __int16 v35 = 2112;
      v36 = v28;
      __int16 v37 = 2112;
      id v38 = v19;
      _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "[%@] Failed to open %@ during app group protection check; error = %@",
        buf,
        0x20u);
    }
    __int16 v24 = [[MCMError alloc] initWithNSError:v19 url:v11 defaultErrorType:144];
  }
  [(MCMFileHandle *)v14 close];
  if (a5)
  {
    __int16 v24 = v24;
    BOOL v25 = 0;
    *a5 = v24;
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_17:

  return v25;
}

+ (unint64_t)command
{
  return 38;
}

@end