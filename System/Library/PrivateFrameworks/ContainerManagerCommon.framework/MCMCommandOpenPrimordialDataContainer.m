@interface MCMCommandOpenPrimordialDataContainer
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)extension;
- (BOOL)preflightClientAllowed;
- (BOOL)testMode;
- (MCMCommandOpenPrimordialDataContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (MCMError)error;
- (void)execute;
@end

@implementation MCMCommandOpenPrimordialDataContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

- (BOOL)extension
{
  return self->_extension;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (MCMError)error
{
  return self->_error;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void)execute
{
  v2 = self;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MCMCommand *)v2 context];
    v5 = [v4 clientIdentity];
    v6 = [v5 codeSignInfo];
    v7 = [v6 identifier];
    v8 = [(MCMCommandOpenPrimordialDataContainer *)v2 containerIdentity];
    uint64_t v9 = [v8 containerClass];
    v10 = [(MCMCommandOpenPrimordialDataContainer *)v2 containerIdentity];
    v11 = [v10 identifier];
    BOOL v12 = [(MCMCommandOpenPrimordialDataContainer *)v2 extension];
    v13 = "app";
    *(_DWORD *)buf = 138544130;
    *(void *)v55 = v7;
    *(_WORD *)&v55[8] = 2048;
    if (v12) {
      v13 = "extension";
    }
    uint64_t v56 = v9;
    __int16 v57 = 2114;
    v58 = v11;
    __int16 v59 = 2082;
    v60 = v13;
    _os_log_impl(&dword_1D7739000, v3, OS_LOG_TYPE_DEFAULT, "Fetching primordial container for '%{public}@' with identifier '%llu:%{public}@' (%{public}s)", buf, 0x2Au);
  }
  v14 = [(MCMCommandOpenPrimordialDataContainer *)v2 error];

  if (v14)
  {
    id v15 = [(MCMCommandOpenPrimordialDataContainer *)v2 error];
    uint64_t v16 = 0;
    v17 = 0;
LABEL_7:
    id v18 = 0;
    goto LABEL_8;
  }
  v31 = [(MCMCommandOpenPrimordialDataContainer *)v2 containerIdentity];

  if (v31)
  {
    v32 = [(MCMCommand *)v2 context];
    v33 = [v32 containerFactory];
    v34 = [(MCMCommandOpenPrimordialDataContainer *)v2 containerIdentity];
    id v51 = 0;
    v17 = [v33 containerForContainerIdentity:v34 createIfNecessary:1 error:&v51];
    id v15 = v51;

    if (!v17)
    {
      uint64_t v16 = 0;
      goto LABEL_7;
    }
    v35 = [v17 metadataMinimal];
    uint64_t v16 = [v35 existed];
    v36 = [v35 containerPath];
    id v18 = [v36 containerDataURL];

    if (v18)
    {
      v37 = [(MCMCommand *)v2 context];
      v38 = [v37 clientIdentity];
      v39 = [v38 proximateClient];
      v40 = v39;
      if (v39)
      {
        [v39 auditToken];
      }
      else
      {
        long long v52 = 0u;
        long long v53 = 0u;
      }
      id v18 = v18;
      [v18 fileSystemRepresentation];
      int v43 = sandbox_set_container_path_for_audit_token();

      if (v43)
      {
        if (![(MCMCommandOpenPrimordialDataContainer *)v2 testMode]
          && ((_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0 && *__error() != 45))
        {
          v44 = container_log_handle_for_category();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            int v46 = *__error();
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v55 = v43;
            *(_WORD *)&v55[4] = 1024;
            *(_DWORD *)&v55[6] = v46;
            _os_log_fault_impl(&dword_1D7739000, v44, OS_LOG_TYPE_FAULT, "sandbox_set_container_path_for_audit_token() failed with error %d / %d.", buf, 0xEu);
          }

          v45 = [[MCMError alloc] initWithErrorType:65];
          id v18 = 0;
          id v15 = v45;
        }
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
    v17 = 0;
    id v18 = 0;
    id v15 = 0;
  }
LABEL_8:
  v19 = container_log_handle_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v48 = v18;
    id v20 = v15;
    if (v16) {
      v21 = @"Fetched";
    }
    else {
      v21 = @"Created";
    }
    v47 = [(MCMCommand *)v2 context];
    v22 = [v47 clientIdentity];
    v23 = [v22 codeSignInfo];
    v24 = [v23 identifier];
    [(MCMCommandOpenPrimordialDataContainer *)v2 containerIdentity];
    v25 = unsigned int v49 = v16;
    [v25 identifier];
    v26 = v2;
    v28 = v27 = v17;
    *(_DWORD *)buf = 138544130;
    *(void *)v55 = v21;
    id v15 = v20;
    id v18 = v48;
    *(_WORD *)&v55[8] = 2114;
    uint64_t v56 = (uint64_t)v24;
    __int16 v57 = 2114;
    v58 = v28;
    __int16 v59 = 2112;
    v60 = (const char *)v15;
    _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ primordial container for '%{public}@' with identifier '%{public}@': error = %@", buf, 0x2Au);

    v17 = v27;
    v2 = v26;

    uint64_t v16 = v49;
  }

  v29 = [MCMResultWithURLBase alloc];
  if (v18) {
    uint64_t v30 = [(MCMResultWithURLBase *)v29 initWithURL:v18 existed:v16 sandboxToken:0];
  }
  else {
    uint64_t v30 = [(MCMResultBase *)v29 initWithError:v15];
  }
  v41 = (void *)v30;
  v42 = [(MCMCommand *)v2 resultPromise];
  [v42 completeWithResult:v41];
}

- (BOOL)preflightClientAllowed
{
  return 1;
}

- (MCMCommandOpenPrimordialDataContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)MCMCommandOpenPrimordialDataContainer;
  v10 = [(MCMCommand *)&v56 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    id v11 = v8;
    char v12 = [v11 useCodeSignDatabase];
    v13 = [v9 clientIdentity];
    v14 = [v13 codeSignInfo];
    uint64_t v55 = 1;
    id v15 = [v14 entitlements];
    uint64_t v16 = [v15 containerRequiredIdentifier];

    if (v16)
    {
LABEL_3:
      v10->_testMode = [v13 isAllowedToTest] & v12;
      uint64_t v17 = [(id)gCodeSigningMapping dataContainerTypeForIdentifier:v16];
      if (!v17)
      {
        id v18 = container_log_handle_for_category();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v58 = v16;
          _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "Unknown data container type for identifier (%{public}@), assuming app", buf, 0xCu);
        }

        uint64_t v17 = 2;
      }
      long long v53 = v14;
      v10->_extension = v17 == 4;
      v19 = [(MCMCommand *)v10 context];
      id v20 = [v19 globalConfiguration];
      v21 = [v20 staticConfig];
      v22 = [v21 configForContainerClass:v17];

      v23 = [v13 userIdentity];
      v54 = (MCMError *)v16;
      if ([v23 isNoSpecificPersona])
      {
        v24 = [v9 userIdentityCache];
        v25 = [v23 posixUser];
        [v24 userIdentityForPersonalPersonaWithPOSIXUser:v25];
        id v26 = v9;
        uint64_t v28 = v27 = v13;

        v23 = (void *)v28;
        v13 = v27;
        id v9 = v26;
      }
      if (v23)
      {
        id v29 = v9;
        uint64_t v30 = v13;
        uint64_t v31 = [v11 platform];
        v32 = [(MCMCommand *)v10 context];
        [v32 userIdentityCache];
        id v52 = v8;
        v34 = id v33 = v11;
        uint64_t v35 = v31;
        v13 = v30;
        id v9 = v29;
        uint64_t v36 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v23 identifier:v54 containerConfig:v22 platform:v35 transient:0 userIdentityCache:v34 error:&v55];
        containerIdentity = v10->_containerIdentity;
        v10->_containerIdentity = (MCMContainerIdentity *)v36;

        id v11 = v33;
        id v8 = v52;

        if (v55 != 1)
        {
          v38 = [MCMError alloc];
          uint64_t v39 = [(MCMError *)v38 initWithErrorType:v55];
          error = v10->_error;
          v10->_error = (MCMError *)v39;
        }
      }

      v14 = v53;
      v41 = v54;
      goto LABEL_22;
    }
    v42 = [v14 entitlements];
    int v43 = [v42 requestsNoContainer];

    if (v43)
    {
      v44 = container_log_handle_for_category();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = [v13 posixPID];
        *(_DWORD *)buf = 138543618;
        uint64_t v58 = (uint64_t)v14;
        __int16 v59 = 1024;
        int v60 = v45;
        _os_log_impl(&dword_1D7739000, v44, OS_LOG_TYPE_DEFAULT, "Client (%{public}@, %d) requests no container with no-container entitlement", buf, 0x12u);
      }

      int v46 = [MCMError alloc];
      uint64_t v47 = 96;
    }
    else
    {
      uint64_t v16 = [v14 identifier];
      if (v16) {
        goto LABEL_3;
      }
      id v48 = container_log_handle_for_category();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = [v13 posixPID];
        *(_DWORD *)buf = 67109120;
        LODWORD(v58) = v49;
        _os_log_impl(&dword_1D7739000, v48, OS_LOG_TYPE_DEFAULT, "No container-required or codesign identifier -- no container possible for client %d", buf, 8u);
      }

      int v46 = [MCMError alloc];
      uint64_t v47 = 18;
    }
    uint64_t v50 = [(MCMError *)v46 initWithErrorType:v47];
    v41 = v10->_error;
    v10->_error = (MCMError *)v50;
LABEL_22:
  }
  return v10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 45;
}

@end