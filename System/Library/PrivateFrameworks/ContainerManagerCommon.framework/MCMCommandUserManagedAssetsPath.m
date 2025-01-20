@interface MCMCommandUserManagedAssetsPath
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createIfNecessary;
- (BOOL)isRelative;
- (BOOL)preflightClientAllowed;
- (MCMCommandUserManagedAssetsPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandUserManagedAssetsPath

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (void)execute
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9478DF0](self, a2);
  v3 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
  uint64_t v4 = [v3 userIdentity];

  v5 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
  uint64_t v6 = [v5 identifier];

  v7 = [(MCMCommand *)self context];
  v8 = [v7 containerCache];
  v9 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
  id v79 = 0;
  v10 = [v8 entryForContainerIdentity:v9 error:&v79];
  v11 = (MCMError *)v79;

  v70 = (void *)v6;
  v71 = (void *)v4;
  v69 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  v78 = v11;
  v12 = [v10 metadataWithError:&v78];
  v13 = v78;

  if (!v12)
  {
    v11 = v13;
LABEL_14:
    v43 = container_log_handle_for_category();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = v6;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v11;
      _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, "Failed to create app data container for user managed assets path for %@: %@", buf, 0x16u);
    }

    v33 = 0;
    v30 = 0;
    v25 = 0;
    v73 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  v14 = [v12 containerPath];

  if (!v14)
  {
    v11 = [[MCMError alloc] initWithErrorType:11];

    v44 = container_log_handle_for_category();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      v33 = 0;
      v30 = 0;
      v25 = 0;
      v73 = 0;
LABEL_21:
      id v26 = 0;
LABEL_22:
      v48 = 0;
      uint64_t v41 = 0;
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v81 = (uint64_t)v12;
    v45 = "No URL in container metadata object: %@";
    v46 = v44;
    uint32_t v47 = 12;
LABEL_48:
    _os_log_error_impl(&dword_1D7739000, v46, OS_LOG_TYPE_ERROR, v45, buf, v47);
    goto LABEL_20;
  }
  v15 = [v12 containerPath];
  v16 = [v15 containerDataURL];
  v17 = [v16 URLByAppendingPathComponent:@"Library" isDirectory:1];

  if (!v17)
  {
    v11 = [[MCMError alloc] initWithErrorType:13];

    v44 = container_log_handle_for_category();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v45 = "Could not get library URL";
    v46 = v44;
    uint32_t v47 = 2;
    goto LABEL_48;
  }
  v68 = v13;
  uint64_t v18 = [v12 userManagedAssetsDirName];
  v73 = v17;
  if (v18)
  {
    v19 = (void *)v18;
    v20 = +[MCMFileManager defaultManager];
    v21 = [v12 userManagedAssetsDirName];
    v22 = [v17 URLByAppendingPathComponent:v21 isDirectory:1];
    int v23 = [v20 itemDoesNotExistAtURL:v22];

    if (!v23)
    {
      v55 = [v12 userManagedAssetsDirName];
      uint64_t v41 = 1;
      v25 = [v17 URLByAppendingPathComponent:v55 isDirectory:1];

      v33 = 0;
      v30 = 0;
      v42 = 0;
      v36 = v12;
      goto LABEL_33;
    }
  }
  if (![(MCMCommandUserManagedAssetsPath *)self createIfNecessary])
  {
    v11 = [[MCMError alloc] initWithErrorType:71];

    v54 = container_log_handle_for_category();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = v4;
      __int16 v82 = 2112;
      uint64_t v83 = v6;
      _os_log_error_impl(&dword_1D7739000, v54, OS_LOG_TYPE_ERROR, "User managed path for %@:%@ Not Found", buf, 0x16u);
    }

    v33 = 0;
    v30 = 0;
    v25 = 0;
    goto LABEL_21;
  }
  v24 = +[MCMFileManager defaultManager];
  id v77 = 0;
  v25 = [v24 createTemporaryDirectoryInDirectoryURL:v17 withNamePrefix:@"com.apple.UserManagedAssets." error:&v77];
  id v26 = v77;

  if (!v25)
  {
    v11 = [[MCMError alloc] initWithErrorType:6];

    v58 = container_log_handle_for_category();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = (uint64_t)v73;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v26;
      _os_log_error_impl(&dword_1D7739000, v58, OS_LOG_TYPE_ERROR, "Failed to create user managed assets dir at %@: %@", buf, 0x16u);
    }

    v33 = 0;
    v30 = 0;
    v25 = 0;
    goto LABEL_22;
  }
  uint64_t v27 = [v12 containerClass];
  v28 = [v12 userIdentity];
  v29 = [v28 posixUser];
  v30 = +[MCMContainerClassPath posixOwnerForContainerClass:v27 user:v29];

  v31 = [MCMFileHandle alloc];
  uint64_t v32 = [v25 path];
  LOBYTE(v66) = 1;
  v33 = [(MCMFileHandle *)v31 initWithPath:v32 relativeToFileHandle:0 direction:9 symlinks:0 createMode:0 createDPClass:0 openLazily:v66];

  id v76 = v26;
  LOBYTE(v32) = [(MCMFileHandle *)v33 setPermissions:493 andOwner:v30 error:&v76];
  id v34 = v76;

  if ((v32 & 1) == 0)
  {
    v11 = [[MCMError alloc] initWithNSError:v34 url:v25 defaultErrorType:6];

    v59 = container_log_handle_for_category();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v81 = (uint64_t)v34;
      _os_log_error_impl(&dword_1D7739000, v59, OS_LOG_TYPE_ERROR, "Failed to set permissions on user managed assets dir; error = %@",
        buf,
        0xCu);
    }

    v48 = 0;
    uint64_t v41 = 0;
    goto LABEL_43;
  }
  id v67 = v34;
  uint64_t v35 = [v25 lastPathComponent];
  v36 = [v12 metadataBySettingUserManagedAssetsDirName:v35];

  v75 = v68;
  LOBYTE(v35) = [v36 writeMetadataToDiskWithError:&v75];
  v11 = v75;

  if (v35)
  {
    v37 = [(MCMCommand *)self context];
    v38 = [v37 containerCache];
    v74 = v11;
    v39 = [v38 addContainerMetadata:v36 error:&v74];
    v40 = v74;

    if (v39)
    {
      v68 = v40;
      uint64_t v41 = 0;
      v42 = v67;
LABEL_33:
      if ([(MCMCommandUserManagedAssetsPath *)self isRelative])
      {
        [v36 userManagedAssetsDirName];
        v57 = v56 = v42;
        v48 = [@"Library" stringByAppendingPathComponent:v57];

        v12 = v36;
        id v26 = v56;
      }
      else
      {
        v48 = [v25 path];
        v12 = v36;
        id v26 = v42;
      }
      v11 = v68;
      goto LABEL_23;
    }
    v11 = [[MCMError alloc] initWithErrorType:45];

    v61 = container_log_handle_for_category();
    id v34 = v67;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v64 = [v36 containerPath];
      int v65 = [v36 transient];
      *(_DWORD *)buf = 138412802;
      uint64_t v81 = (uint64_t)v36;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v64;
      __int16 v84 = 1024;
      int v85 = v65;
      _os_log_error_impl(&dword_1D7739000, v61, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, container path: %@, transient: %d", buf, 0x1Cu);

      id v34 = v67;
    }

    v48 = 0;
    uint64_t v41 = 0;
    v12 = v36;
LABEL_43:
    id v26 = v34;
    goto LABEL_23;
  }
  v60 = container_log_handle_for_category();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    v62 = [v36 containerPath];
    int v63 = [v36 transient];
    *(_DWORD *)buf = 138413058;
    uint64_t v81 = (uint64_t)v36;
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v62;
    __int16 v84 = 1024;
    int v85 = v63;
    __int16 v86 = 2112;
    v87 = v11;
    _os_log_error_impl(&dword_1D7739000, v60, OS_LOG_TYPE_ERROR, "Failed to write metadata: %@, container path: %@, transient: %d; error = %@",
      buf,
      0x26u);
  }
  v48 = 0;
  uint64_t v41 = 0;
  v12 = v36;
  id v26 = v67;
LABEL_23:
  v49 = container_log_handle_for_category();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v81 = (uint64_t)v48;
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v11;
    _os_log_impl(&dword_1D7739000, v49, OS_LOG_TYPE_DEFAULT, "User managed assets path result: [%@], error = %@", buf, 0x16u);
  }

  v50 = [MCMResultWithURLBase alloc];
  if (v48) {
    uint64_t v51 = [(MCMResultWithURLBase *)v50 initWithPath:v48 existed:v41 sandboxToken:0];
  }
  else {
    uint64_t v51 = [(MCMResultBase *)v50 initWithError:v11];
  }
  v52 = (void *)v51;
  v53 = [(MCMCommand *)self resultPromise];
  [v53 completeWithResult:v52];
}

- (BOOL)preflightClientAllowed
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = [(MCMCommand *)self context];
  uint64_t v6 = [(id)v5 clientIdentity];
  v7 = [v6 codeSignInfo];
  v8 = [v7 identifier];
  int v9 = [v4 isEqualToString:v8];

  v10 = [(MCMCommand *)self context];
  v11 = [v10 clientIdentity];
  LOBYTE(v5) = [v11 isAllowedToAccessUserAssets];

  if ((v5 & 1) == 0 && !v9) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (MCMRequirePersona_result)
  {
    v13 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
    unint64_t v14 = [v13 containerClass];
    if (v14 <= 0xE && ((1 << v14) & 0x4ED4) != 0)
    {
      v15 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
      v16 = [v15 userIdentity];
      int v17 = [v16 isNoSpecificPersona];

      if (v17)
      {
        uint64_t v18 = container_log_handle_for_category();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          v19 = [(MCMCommand *)self context];
          v20 = [v19 clientIdentity];
          v21 = [v20 codeSignInfo];
          v22 = [v21 identifier];
          int v23 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
          uint64_t v24 = [v23 containerClass];
          v25 = [(MCMCommandUserManagedAssetsPath *)self containerIdentity];
          id v26 = [v25 identifier];
          int v27 = 138543874;
          v28 = v22;
          __int16 v29 = 2048;
          uint64_t v30 = v24;
          __int16 v31 = 2114;
          uint64_t v32 = v26;
          _os_log_fault_impl(&dword_1D7739000, v18, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v27, 0x20u);
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

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (void).cxx_destruct
{
  p_containerIdentity = &self->_containerIdentity;

  objc_storeStrong((id *)p_containerIdentity, 0);
}

- (MCMCommandUserManagedAssetsPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MCMCommandUserManagedAssetsPath;
  v10 = [(MCMCommand *)&v34 initWithMessage:v8 context:v9 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v8 containerIdentity];
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;

    v13 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity userIdentity];
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
    }
    if (MCMRequirePersonaTelemetryOnly_result && [v13 isNoSpecificPersona])
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = [(MCMCommand *)v10 context];
        uint64_t v30 = [v32 clientIdentity];
        __int16 v29 = [v30 codeSignInfo];
        v15 = [v29 identifier];
        uint64_t v16 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        int v17 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        uint64_t v18 = [v9 clientIdentity];
        *(_DWORD *)buf = 138544130;
        v36 = v15;
        __int16 v37 = 2048;
        uint64_t v38 = v16;
        __int16 v39 = 2114;
        v40 = v17;
        __int16 v41 = 2114;
        v42 = v18;
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
        uint64_t v33 = [(MCMCommand *)v10 context];
        __int16 v31 = [v33 clientIdentity];
        v25 = [v31 codeSignInfo];
        id v26 = [v25 identifier];
        uint64_t v27 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity containerClass];
        v28 = [(MCMContainerIdentityMinimal *)v10->_containerIdentity identifier];
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2114;
        v40 = v28;
        _os_log_fault_impl(&dword_1D7739000, v19, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);
      }
      v20 = [v9 userIdentityCache];
      v21 = [v13 posixUser];
      uint64_t v22 = [v20 userIdentityForPersonalPersonaWithPOSIXUser:v21];

      uint64_t v23 = [(MCMContainerIdentity *)v10->_containerIdentity identityByChangingUserIdentity:v22];
      p_super = &v10->_containerIdentity->super.super;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      v13 = (void *)v22;
    }

LABEL_16:
    v10->_relative = [v8 isRelative];
    v10->_createIfNecessary = [v8 createIfNecessary];
  }
  return v10;
}

- (BOOL)isRelative
{
  return self->_relative;
}

+ (unint64_t)command
{
  return 28;
}

@end