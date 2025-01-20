@interface MCMCommandCreateOrLookupWithBundle
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createIfNecessary;
- (BOOL)issueSandboxExtension;
- (BOOL)preflightClientAllowed;
- (BOOL)transient;
- (MCMCodeSignInfo)info;
- (MCMCommandCreateOrLookupWithBundle)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (MCMError)error;
- (MCMUserIdentity)userIdentity;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (const)sandboxToken;
- (unint64_t)containerClass;
- (void)_commonInit:(id)a3;
- (void)dealloc;
- (void)execute;
@end

@implementation MCMCommandCreateOrLookupWithBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_executableURL, 0);

  objc_storeStrong((id *)&self->_bundleURL, 0);
}

- (MCMError)error
{
  return self->_error;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MCMCodeSignInfo)info
{
  return self->_info;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (BOOL)issueSandboxExtension
{
  return self->_issueSandboxExtension;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (void)execute
{
  __s[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  __s[0] = 0;
  v4 = [(MCMCommandCreateOrLookupWithBundle *)self error];

  if (v4)
  {
    v5 = [(MCMCommandCreateOrLookupWithBundle *)self error];
LABEL_3:
    v6 = v5;
    v7 = 0;
    v8 = 0;
LABEL_4:
    v9 = [(MCMResultBase *)[MCMResultWithContainerBase alloc] initWithError:v6];
    goto LABEL_5;
  }
  v11 = self;
  if ([(MCMCommandCreateOrLookupWithBundle *)v11 sandboxToken])
  {
    [(MCMCommandCreateOrLookupWithBundle *)v11 sandboxToken];
    uint64_t v12 = sandbox_extension_consume();
    if (v12 < 0)
    {
      v5 = [[MCMError alloc] initWithErrorType:57];
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = -1;
  }
  v13 = [(MCMCommand *)v11 context];
  v14 = [v13 containerFactory];
  v15 = [(MCMCommandCreateOrLookupWithBundle *)v11 containerIdentity];
  id v29 = 0;
  v8 = objc_msgSend(v14, "containerForContainerIdentity:createIfNecessary:error:", v15, -[MCMCommandCreateOrLookupWithBundle createIfNecessary](v11, "createIfNecessary"), &v29);
  v6 = (MCMError *)v29;

  v7 = [v8 metadataMinimal];
  if (!v7) {
    goto LABEL_21;
  }
  v27 = v3;
  if ([(MCMCommandCreateOrLookupWithBundle *)v11 issueSandboxExtension]) {
    goto LABEL_13;
  }
  v16 = [(MCMCommand *)v11 context];
  v17 = [v16 clientIdentity];
  v18 = [v17 userIdentity];
  int v19 = [v18 isDataSeparated];

  if (v19)
  {
LABEL_13:
    v26 = [(MCMCommand *)v11 context];
    v20 = [v26 clientIdentity];
    v21 = [v7 containerIdentity];
    v22 = [v7 containerPath];
    v28 = v6;
    v23 = (void *)[v20 issueSandboxExtensionWithIdentity:v21 containerPath:v22 legacyExtensionPolicy:1 extensionsUseProxiedClient:1 extensionsPolicyUsesProxiedClient:1 error:&v28];
    uint64_t v24 = v12;
    v25 = v28;

    __s[0] = v23;
    v6 = v25;
    uint64_t v12 = v24;
  }
  else
  {
    v23 = 0;
  }
  v3 = v27;
  if (v23 || !v6 || [(MCMError *)v6 type] == 1 || [(MCMError *)v6 type] == 72)
  {
    v9 = [[MCMResultWithContainerBase alloc] initWithMetadata:v7 sandboxToken:v23 includePath:1 includeInfo:0 includeUserManagedAssetsRelPath:0 includeCreator:0];
    if (v23)
    {
      free(v23);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }
  else
  {
LABEL_21:
    v9 = 0;
  }
  if ((v12 & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  if (!v9) {
    goto LABEL_4;
  }
LABEL_5:
  v10 = [(MCMCommand *)self resultPromise];
  [v10 completeWithResult:v9];
}

- (BOOL)preflightClientAllowed
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMCommandCreateOrLookupWithBundle *)self error];

  if (v3) {
    return 1;
  }
  v5 = [(MCMCommand *)self context];
  v6 = [v5 clientIdentity];
  v7 = [(MCMCommandCreateOrLookupWithBundle *)self containerIdentity];
  int v8 = [v6 isAllowedToLookupContainerIdentity:v7];

  if (v8)
  {
    if (MCMRequirePersona_onceToken != -1) {
      dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
    }
    if (!MCMRequirePersona_result) {
      return 1;
    }
    v9 = [(MCMCommandCreateOrLookupWithBundle *)self containerIdentity];
    unint64_t v10 = [v9 containerClass];
    if (v10 > 0xE || ((1 << v10) & 0x4ED4) == 0)
    {

      return 1;
    }
    v11 = [(MCMCommandCreateOrLookupWithBundle *)self containerIdentity];
    uint64_t v12 = [v11 userIdentity];
    int v13 = [v12 isNoSpecificPersona];

    if (!v13) {
      return 1;
    }
    v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      uint64_t v24 = [(MCMCommand *)self context];
      v15 = [v24 clientIdentity];
      v16 = [v15 codeSignInfo];
      v17 = [v16 identifier];
      v18 = [(MCMCommandCreateOrLookupWithBundle *)self containerIdentity];
      uint64_t v19 = [v18 containerClass];
      v20 = [(MCMCommandCreateOrLookupWithBundle *)self containerIdentity];
      v21 = [v20 identifier];
      v22 = [(MCMCommand *)self context];
      v23 = [v22 clientIdentity];
      *(_DWORD *)buf = 138544130;
      v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      __int16 v29 = 2114;
      v30 = v21;
      __int16 v31 = 2114;
      v32 = v23;
      _os_log_fault_impl(&dword_1D7739000, v14, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);
    }
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result) {
      return 1;
    }
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = (char *)self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMCommandCreateOrLookupWithBundle;
  [(MCMCommandCreateOrLookupWithBundle *)&v5 dealloc];
}

- (void)_commonInit:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v59 = 1;
  if (self->_sandboxToken)
  {
    uint64_t v5 = sandbox_extension_consume();
    if (v5 < 0)
    {
      uint64_t v6 = [[MCMError alloc] initWithErrorType:57];
      error = self->_error;
      self->_error = v6;

      int v8 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v5 = -1;
  }
  self->_unint64_t containerClass = 2;
  v9 = [(NSURL *)self->_bundleURL path];
  int v10 = [v9 hasSuffix:@".appex"];

  if (v10)
  {
    v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(NSURL *)self->_bundleURL path];
      *(_DWORD *)buf = 138543362;
      v61 = v12;
      _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] is a plugin", buf, 0xCu);
    }
    self->_unint64_t containerClass = 4;
  }
  int v13 = [(MCMCommand *)self context];
  v14 = [v13 globalConfiguration];
  v15 = [v14 staticConfig];
  int v8 = [v15 configForContainerClass:self->_containerClass];

  v16 = [[MCMCodeSignInfo alloc] initWithURL:self->_executableURL error:&v59];
  info = self->_info;
  self->_info = v16;

  v18 = self->_info;
  if (!v18) {
    goto LABEL_33;
  }
  unsigned int v19 = [(MCMCodeSignInfo *)v18 platform];
  v20 = [(MCMCodeSignInfo *)self->_info entitlements];
  v21 = v20;
  if (v19 != 2)
  {
    v26 = [v20 objectForKeyedSubscript:@"com.apple.security.app-sandbox"];
    char v27 = [v26 BOOLValue];

    if ((v27 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v22 = [v20 objectForKeyedSubscript:@"com.apple.private.security.no-container"];
  int v23 = [v22 BOOLValue];

  if (!v23)
  {
LABEL_14:
    uint64_t v28 = [(MCMCodeSignInfo *)self->_info identifier];
    __int16 v29 = [v4 clientIdentity];
    v30 = +[MCMXPCMessageBase userIdentityForContainerIdentifier:v28 clientIdentity:v29 containerClass:self->_containerClass error:&v59];
    userIdentity = self->_userIdentity;
    self->_userIdentity = v30;

    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result
      && v59 != 1
      && [(MCMUserIdentity *)self->_userIdentity isNoSpecificPersona])
    {
      v32 = container_log_handle_for_category();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        v57 = [v4 clientIdentity];
        v55 = [v57 codeSignInfo];
        v48 = [v55 identifier];
        unint64_t containerClass = self->_containerClass;
        v49 = [(MCMCodeSignInfo *)self->_info identifier];
        v50 = [v4 clientIdentity];
        *(_DWORD *)buf = 138544130;
        v61 = v48;
        __int16 v62 = 2048;
        unint64_t v63 = containerClass;
        __int16 v64 = 2114;
        v65 = v49;
        __int16 v66 = 2114;
        v67 = v50;
        _os_log_fault_impl(&dword_1D7739000, v32, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);
      }
      uint64_t v59 = 1;
      goto LABEL_32;
    }
    if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_18);
    }
    uint64_t v33 = v59;
    if (MCMRequirePersonaAndConvertSystemToPersonal_result && v59 != 1)
    {
      if ([(MCMUserIdentity *)self->_userIdentity isNoSpecificPersona])
      {
        v34 = container_log_handle_for_category();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          v58 = [v4 clientIdentity];
          v56 = [v58 codeSignInfo];
          v51 = [v56 identifier];
          unint64_t v52 = self->_containerClass;
          v53 = [(MCMCodeSignInfo *)self->_info identifier];
          *(_DWORD *)buf = 138543874;
          v61 = v51;
          __int16 v62 = 2048;
          unint64_t v63 = v52;
          __int16 v64 = 2114;
          v65 = v53;
          _os_log_fault_impl(&dword_1D7739000, v34, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);
        }
        uint64_t v59 = 1;
        v35 = [v4 userIdentityCache];
        v36 = [(MCMUserIdentity *)self->_userIdentity posixUser];
        v37 = [v35 userIdentityForPersonalPersonaWithPOSIXUser:v36];
        v38 = self->_userIdentity;
        self->_userIdentity = v37;
      }
      uint64_t v33 = v59;
    }
    if (v33 == 1)
    {
LABEL_32:
      v39 = self->_userIdentity;
      v40 = [(MCMCodeSignInfo *)self->_info identifier];
      uint64_t v41 = [(MCMCodeSignInfo *)self->_info platform];
      v42 = [(MCMCommand *)self context];
      v43 = [v42 userIdentityCache];
      v44 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v39 identifier:v40 containerConfig:v8 platform:v41 userIdentityCache:v43 error:&v59];
      containerIdentity = self->_containerIdentity;
      self->_containerIdentity = v44;

      if (self->_containerIdentity) {
        goto LABEL_35;
      }
    }
LABEL_33:
    uint64_t v24 = [MCMError alloc];
    uint64_t v25 = v59;
    goto LABEL_34;
  }
LABEL_12:
  uint64_t v24 = [MCMError alloc];
  uint64_t v25 = 96;
LABEL_34:
  v46 = [(MCMError *)v24 initWithErrorType:v25];
  v47 = self->_error;
  self->_error = v46;

LABEL_35:
  if ((v5 & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
LABEL_37:
}

- (MCMCommandCreateOrLookupWithBundle)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCMCommandCreateOrLookupWithBundle;
  int v10 = [(MCMCommand *)&v18 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    v10->_createIfNecessary = [v8 createIfNecessary];
    v10->_transient = [v8 transient];
    v10->_issueSandboxExtension = [v8 issueSandboxExtension];
    id v11 = v8;
    uint64_t v12 = (char *)[v11 sandboxToken];
    if (v12) {
      uint64_t v12 = strndup(v12, 0x800uLL);
    }
    v10->_sandboxToken = v12;
    uint64_t v13 = [v11 bundleURL];
    bundleURL = v10->_bundleURL;
    v10->_bundleURL = (NSURL *)v13;

    uint64_t v15 = [v11 executableURL];
    executableURL = v10->_executableURL;
    v10->_executableURL = (NSURL *)v15;

    [(MCMCommandCreateOrLookupWithBundle *)v10 _commonInit:v9];
  }

  return v10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 36;
}

@end