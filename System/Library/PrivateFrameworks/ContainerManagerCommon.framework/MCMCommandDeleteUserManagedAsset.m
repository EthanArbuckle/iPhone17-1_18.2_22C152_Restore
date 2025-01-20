@interface MCMCommandDeleteUserManagedAsset
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeleteUserManagedAsset)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (NSString)sourceRelativePath;
- (void)execute;
@end

@implementation MCMCommandDeleteUserManagedAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRelativePath, 0);

  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void)execute
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  v3 = [(MCMCommandDeleteUserManagedAsset *)self containerIdentity];
  uint64_t v4 = [v3 identifier];

  v5 = [(MCMCommandDeleteUserManagedAsset *)self containerIdentity];
  v57 = [v5 userIdentity];

  v6 = [(MCMCommand *)self context];
  v7 = [v6 containerCache];
  v8 = [(MCMCommandDeleteUserManagedAsset *)self containerIdentity];
  id v62 = 0;
  v9 = [v7 entryForContainerIdentity:v8 error:&v62];
  id v10 = v62;

  id v61 = v10;
  v53 = v9;
  v11 = [v9 metadataWithError:&v61];
  v12 = (MCMError *)v61;

  v54 = (void *)v4;
  if (!v11)
  {
    v35 = container_log_handle_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = v4;
      __int16 v65 = 2112;
      v66 = v12;
      _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Failed to create app data container for user managed assets path for %@: %@", buf, 0x16u);
    }
    v29 = 0;
    v25 = 0;
    v20 = 0;
    v52 = 0;
    v56 = 0;
    v26 = 0;
    goto LABEL_28;
  }
  uint64_t v13 = [v11 containerPath];
  if (!v13
    || (v14 = (void *)v13,
        [v11 userManagedAssetsDirName],
        v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    v34 = [[MCMError alloc] initWithErrorType:11];

    v35 = container_log_handle_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (uint64_t)v11;
      _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "No userManagedAssetsDirName or URL in container metadata object: %@", buf, 0xCu);
    }
    v29 = 0;
    v25 = 0;
    v20 = 0;
    v52 = 0;
    v56 = 0;
    v26 = 0;
    goto LABEL_27;
  }
  v16 = [v11 containerPath];
  v17 = [v16 containerDataURL];
  v18 = [v17 URLByAppendingPathComponent:@"Library" isDirectory:1];

  v19 = [v11 userManagedAssetsDirName];
  v52 = v18;
  v20 = [v18 URLByAppendingPathComponent:v19 isDirectory:1];

  v21 = [(MCMCommandDeleteUserManagedAsset *)self sourceRelativePath];
  v22 = [v20 URLByAppendingPathComponent:v21 isDirectory:0];
  v23 = [v22 absoluteURL];

  v24 = +[MCMFileManager defaultManager];
  id v60 = 0;
  v25 = [v24 realPathForURL:v23 isDirectory:0 error:&v60];
  v26 = (MCMError *)v60;

  v56 = v23;
  if (!v25)
  {
    v34 = [[MCMError alloc] initWithErrorType:10];

    v35 = container_log_handle_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v49 = [v23 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = (uint64_t)v49;
      __int16 v65 = 2112;
      v66 = v26;
      _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Unable to get realpath for resource %@; error = %@",
        buf,
        0x16u);
    }
    v29 = 0;
    v25 = 0;
    goto LABEL_27;
  }
  v27 = +[MCMFileManager defaultManager];
  v28 = [v20 absoluteURL];
  v59 = v26;
  v29 = [v27 realPathForURL:v28 isDirectory:1 error:&v59];
  v30 = v59;

  if (!v29)
  {
    v34 = [[MCMError alloc] initWithErrorType:10];

    v35 = container_log_handle_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v50 = [v56 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = (uint64_t)v50;
      __int16 v65 = 2112;
      v66 = v30;
      _os_log_error_impl(&dword_1D7739000, v35, OS_LOG_TYPE_ERROR, "Unable to get realpath for resource %@; error = %@",
        buf,
        0x16u);
    }
    v29 = 0;
    goto LABEL_26;
  }
  v31 = [v29 path];
  v32 = [v25 path];
  int v33 = [v31 isEqualToString:v32];

  if (v33)
  {
    v34 = [[MCMError alloc] initWithErrorType:10];

    v35 = container_log_handle_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = [v29 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (uint64_t)v36;
      v37 = "Illegal attempt to delete user managed assets directory at %@";
LABEL_33:
      v43 = v35;
      uint32_t v44 = 12;
LABEL_34:
      _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, v37, buf, v44);
    }
  }
  else
  {
    v38 = [v25 path];
    v39 = [v29 path];
    int v40 = [v38 hasPrefix:v39];

    if (v40)
    {
      v41 = [(MCMCommand *)self context];
      v42 = [v41 containerFactory];
      v58 = v12;
      char v51 = [v42 deleteURL:v25 forUserIdentity:v57 error:&v58];
      v34 = v58;

      if (v51) {
        goto LABEL_29;
      }
      v35 = container_log_handle_for_category();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      v36 = [v25 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = (uint64_t)v36;
      __int16 v65 = 2112;
      v66 = v34;
      v37 = "Failed to remove asset at %@; error = %@";
      v43 = v35;
      uint32_t v44 = 22;
      goto LABEL_34;
    }
    v34 = [[MCMError alloc] initWithErrorType:10];

    v35 = container_log_handle_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = [v25 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (uint64_t)v36;
      v37 = "Illegal attempt to delete asset not residing in user managed assets directory %@";
      goto LABEL_33;
    }
  }
LABEL_26:
  v26 = v30;
LABEL_27:
  v12 = v34;
LABEL_28:

  v30 = v26;
  v34 = v12;
LABEL_29:
  v45 = container_log_handle_for_category();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [(MCMCommandDeleteUserManagedAsset *)self sourceRelativePath];
    *(_DWORD *)buf = 138412546;
    uint64_t v64 = (uint64_t)v46;
    __int16 v65 = 2112;
    v66 = v34;
    _os_log_impl(&dword_1D7739000, v45, OS_LOG_TYPE_DEFAULT, "Delete user managed asset [%@], error = %@", buf, 0x16u);
  }
  v47 = [[MCMResultBase alloc] initWithError:v34];
  v48 = [(MCMCommand *)self resultPromise];
  [v48 completeWithResult:v47];
}

- (BOOL)preflightClientAllowed
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMCommand *)self context];
  uint64_t v4 = [v3 clientIdentity];
  int v5 = [v4 isAllowedToAccessUserAssets];

  if (!v5) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (MCMRequirePersona_result)
  {
    v6 = [(MCMCommandDeleteUserManagedAsset *)self containerIdentity];
    unint64_t v7 = [v6 containerClass];
    if (v7 <= 0xE && ((1 << v7) & 0x4ED4) != 0)
    {
      v8 = [(MCMCommandDeleteUserManagedAsset *)self containerIdentity];
      v9 = [v8 userIdentity];
      int v10 = [v9 isNoSpecificPersona];

      if (v10)
      {
        v11 = container_log_handle_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          uint64_t v13 = [(MCMCommand *)self context];
          v14 = [v13 clientIdentity];
          v15 = [v14 codeSignInfo];
          v16 = [v15 identifier];
          v17 = [(MCMCommandDeleteUserManagedAsset *)self containerIdentity];
          uint64_t v18 = [v17 containerClass];
          v19 = [(MCMCommandDeleteUserManagedAsset *)self containerIdentity];
          v20 = [v19 identifier];
          int v21 = 138543874;
          v22 = v16;
          __int16 v23 = 2048;
          uint64_t v24 = v18;
          __int16 v25 = 2114;
          v26 = v20;
          _os_log_fault_impl(&dword_1D7739000, v11, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v21, 0x20u);
        }
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
        }
        if (!MCMRequirePersonaTelemetryOnly_result) {
          return 0;
        }
      }
    }
    else
    {
    }
  }
  return 1;
}

- (MCMCommandDeleteUserManagedAsset)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)MCMCommandDeleteUserManagedAsset;
  int v10 = [(MCMCommand *)&v36 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v8 containerIdentity];
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;

    uint64_t v13 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity userIdentity];
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result && [v13 isNoSpecificPersona])
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        v34 = [(MCMCommand *)v10 context];
        v32 = [v34 clientIdentity];
        v31 = [v32 codeSignInfo];
        v15 = [v31 identifier];
        uint64_t v16 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v17 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        uint64_t v18 = [v9 clientIdentity];
        *(_DWORD *)buf = 138544130;
        v38 = v15;
        __int16 v39 = 2048;
        uint64_t v40 = v16;
        __int16 v41 = 2114;
        v42 = v17;
        __int16 v43 = 2114;
        uint32_t v44 = v18;
        _os_log_fault_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);
      }
    }
    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_18);
      }
      if (!MCMRequirePersonaAndConvertSystemToPersonal_result
        || ![v13 isNoSpecificPersona])
      {
        goto LABEL_16;
      }
      v19 = container_log_handle_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v35 = [(MCMCommand *)v10 context];
        int v33 = [v35 clientIdentity];
        uint64_t v27 = [v33 codeSignInfo];
        v28 = [v27 identifier];
        uint64_t v29 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v30 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        *(_DWORD *)buf = 138543874;
        v38 = v28;
        __int16 v39 = 2048;
        uint64_t v40 = v29;
        __int16 v41 = 2114;
        v42 = v30;
        _os_log_fault_impl(&dword_1D7739000, v19, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);
      }
      v20 = [v9 userIdentityCache];
      int v21 = [v13 posixUser];
      uint64_t v22 = [v20 userIdentityForPersonalPersonaWithPOSIXUser:v21];

      uint64_t v23 = [(MCMContainerIdentity *)v10->_containerIdentity identityByChangingUserIdentity:v22];
      p_super = &v10->_containerIdentity->super.super;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      uint64_t v13 = (void *)v22;
    }

LABEL_16:
    uint64_t v24 = [v8 sourceRelativePath];
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v24;
  }
  return v10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 29;
}

@end