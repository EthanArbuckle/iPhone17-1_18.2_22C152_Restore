@interface MCMCommandRecreateContainerStructure
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandRecreateContainerStructure)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandRecreateContainerStructure)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandRecreateContainerStructure

- (void).cxx_destruct
{
  p_concreteContainerIdentity = &self->_concreteContainerIdentity;

  objc_storeStrong((id *)p_concreteContainerIdentity, 0);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void)execute
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [(MCMCommandRecreateContainerStructure *)self concreteContainerIdentity];
  v5 = [(MCMCommand *)self context];
  v6 = [v5 containerCache];
  id v80 = 0;
  v7 = [v6 entryForContainerIdentity:v4 error:&v80];
  v8 = (MCMError *)v80;

  v72 = v4;
  if (v7)
  {
    v9 = [v7 uuid];
    v10 = [v4 uuid];
    char v11 = [v9 isEqual:v10];

    if ((v11 & 1) == 0)
    {

      v12 = [[MCMError alloc] initWithErrorType:21];
      v7 = 0;
      v8 = v12;
    }
  }
  v79 = v8;
  v13 = [v7 metadataWithError:&v79];
  p_super = v79;

  v71 = self;
  if (!v13)
  {
    v21 = [[MCMError alloc] initWithErrorType:21];

    p_super = container_log_handle_for_category();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v4;
      _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }
    v22 = 0;
    v70 = 0;
    v23 = 0;
    v13 = 0;
    id v20 = 0;
    goto LABEL_32;
  }
  [v13 containerClass];
  v69 = v3;
  if (container_class_supports_data_subdirectory())
  {
    v15 = +[MCMDataProtectionManager defaultManager];
    uint64_t v16 = [(MCMCommand *)self context];
    v17 = [(id)v16 clientIdentity];
    uint64_t v18 = [v15 desiredDataProtectionClassForMetadata:v13 clientIdentity:v17];

    v19 = [v13 containerPath];
    id v78 = 0;
    LOBYTE(v16) = [v19 createDataURLIfNecessaryWithDataProtectionClass:v18 error:&v78];
    id v20 = v78;

    if ((v16 & 1) == 0)
    {
      v50 = [MCMError alloc];
      v51 = [v13 containerPath];
      v52 = [v51 containerDataURL];
      v21 = [(MCMError *)v50 initWithNSError:v20 url:v52 defaultErrorType:106];

      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v82 = v4;
        __int16 v83 = 2112;
        v84 = v21;
        _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "Could not create container data subdir for %@; error = %@",
          buf,
          0x16u);
      }
      v22 = 0;
      v70 = 0;
      v23 = 0;
      v3 = v69;
      goto LABEL_32;
    }
    v68 = v7;
  }
  else
  {
    v68 = v7;
    id v20 = 0;
  }
  v24 = v20;
  v25 = [(MCMCommand *)self context];
  v26 = [v25 userIdentityCache];
  v27 = [v13 userIdentity];
  uint64_t v28 = [v26 libraryRepairForUserIdentity:v27];

  v29 = [v13 identifier];
  uint64_t v30 = [v13 containerClass];
  [v13 schemaVersion];
  v32 = v31 = self;
  id v77 = 0;
  BOOL v67 = +[MCMContainerSchema schemaIsUpToDateForIdentifier:v29 containerClass:v30 currentSchemaVersion:v32 latestSchemaVersion:&v77];
  id v33 = v77;

  uint64_t v34 = +[MCMDataProtectionManager defaultManager];
  v35 = [(MCMCommand *)v31 context];
  v36 = [v35 clientIdentity];
  uint64_t v37 = [(id)v34 desiredDataProtectionClassForMetadata:v13 clientIdentity:v36];

  v38 = [v13 containerPath];
  uint64_t v39 = v37;
  v22 = (void *)v28;
  v23 = +[MCMContainerSchema containerSchemaWithMetadata:v13 finalContainerPath:v38 dataProtectionClass:v39 libraryRepair:v28];

  id v76 = v24;
  LOBYTE(v34) = [v23 writeSchemaFromVersion:&unk_1F2F12398 toTargetVersion:v33 error:&v76];
  id v20 = v76;

  v70 = v33;
  if (v34)
  {
    v40 = [v13 metadataByChangingSchemaVersion:v33];

    v3 = v69;
    v41 = v72;
    v7 = v68;
    v66 = v22;
    if (!v67)
    {
      id v75 = 0;
      int v42 = [v40 writeMetadataToDiskWithError:&v75];
      v43 = (MCMError *)v75;
      if (v42)
      {
        v44 = [(MCMCommand *)v71 context];
        v45 = [v44 containerCache];
        v74 = v43;
        v46 = [v45 addContainerMetadata:v40 error:&v74];
        v47 = v74;
        v48 = v43;
        v43 = v47;

        if (!v46)
        {
          v49 = container_log_handle_for_category();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v82 = v40;
            __int16 v83 = 2112;
            v84 = v43;
            _os_log_error_impl(&dword_1D7739000, v49, OS_LOG_TYPE_ERROR, "Could not update cache for container schema version in metadata for %@: %@", buf, 0x16u);
          }

          v46 = 0;
        }
        v41 = v72;
        v7 = v68;
      }
      else
      {
        v46 = container_log_handle_for_category();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v82 = v40;
          __int16 v83 = 2112;
          v84 = v43;
          _os_log_error_impl(&dword_1D7739000, v46, OS_LOG_TYPE_ERROR, "Could not update container schema version in metadata for %@: %@", buf, 0x16u);
        }
      }
    }
    id v53 = containermanager_copy_global_configuration();
    int v54 = objc_msgSend(v53, "isGlobalSystemContainerWithContainerClass:", -[NSObject containerClass](v41, "containerClass"));

    if (!v54) {
      goto LABEL_30;
    }
    v55 = +[MCMFileManager defaultManager];
    v56 = [v40 containerPath];
    v57 = [v56 containerRootURL];
    id v73 = v20;
    char v58 = [v55 standardizeACLsForSystemContainerAtURL:v57 error:&v73];
    id v59 = v73;

    if (v58)
    {
      id v20 = v59;
      v3 = v69;
      v41 = v72;
LABEL_30:
      v22 = v66;
      goto LABEL_33;
    }
    v60 = [MCMError alloc];
    v61 = [v40 containerPath];
    v62 = [v61 containerRootURL];
    v21 = [(MCMError *)v60 initWithNSError:v59 url:v62 defaultErrorType:63];

    p_super = v61;
    v13 = v40;
    id v20 = v59;
    v3 = v69;
    v22 = v66;
  }
  else
  {
    v21 = [[MCMError alloc] initWithNSError:v20 url:0 defaultErrorType:109];
    v3 = v69;
    v7 = v68;
  }
LABEL_32:

  v40 = v13;
  p_super = &v21->super;
  v41 = v72;
LABEL_33:
  v63 = container_log_handle_for_category();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v82 = p_super;
    _os_log_impl(&dword_1D7739000, v63, OS_LOG_TYPE_DEFAULT, "Recreate container structure; error = %@", buf, 0xCu);
  }

  v64 = [[MCMResultBase alloc] initWithError:p_super];
  v65 = [(MCMCommand *)v71 resultPromise];
  [v65 completeWithResult:v64];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToRecreateContainerStructure];

  return v4;
}

- (MCMCommandRecreateContainerStructure)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRecreateContainerStructure;
  v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }
  return v9;
}

- (MCMCommandRecreateContainerStructure)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRecreateContainerStructure;
  uint64_t v10 = [(MCMCommand *)&v13 initWithContext:a4 resultPromise:a5];
  char v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);
  }

  return v11;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 8;
}

@end