@interface MCMCommandDeleteContainerContent
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeleteContainerContent)initWithContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandDeleteContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandDeleteContainerContent

- (void).cxx_destruct
{
  p_containerIdentity = &self->_containerIdentity;

  objc_storeStrong((id *)p_containerIdentity, 0);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void)execute
{
  v2 = self;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1D9478DF0](self, a2);
  char v97 = 0;
  v4 = [(MCMCommandDeleteContainerContent *)v2 containerIdentity];
  unint64_t v5 = [v4 containerClass];
  uint64_t v6 = [v4 identifier];
  BOOL v7 = v5 > 0xB || ((1 << v5) & 0xED4) == 0;
  v82 = (void *)v6;
  v84 = v4;
  if (v7)
  {
    uint64_t v42 = v6;
    v43 = container_log_handle_for_category();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v99 = v5;
      __int16 v100 = 2112;
      v101 = (MCMError *)v42;
      _os_log_error_impl(&dword_1D7739000, v43, OS_LOG_TYPE_ERROR, "Can't wipe container non-data container of type: %llu, identifier: %@", buf, 0x16u);
    }
    v18 = (void *)v3;

    v11 = [[MCMError alloc] initWithErrorType:11 category:3];
    goto LABEL_26;
  }
  v8 = [(MCMCommand *)v2 context];
  v9 = [v8 containerCache];
  id v96 = 0;
  v10 = [v9 entryForContainerIdentity:v4 error:&v96];
  v11 = (MCMError *)v96;

  if (!v10)
  {
    v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v99 = (unint64_t)v4;
      __int16 v100 = 2112;
      v101 = v11;
      _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Failed to lookup existing container during wipe; identity: %@, error: %@",
        buf,
        0x16u);
    }
    v18 = (void *)v3;

LABEL_26:
    v10 = 0;
    v83 = 0;
    v20 = 0;
    v80 = 0;
    v81 = 0;
    goto LABEL_27;
  }
  v95 = v11;
  v12 = [v10 metadataWithError:&v95];
  v13 = v95;

  if (v12)
  {
    v14 = [v12 info];
    v15 = [v14 objectForKeyedSubscript:@"com.apple.MobileInstallation.ContentProtectionClass"];

    v79 = v10;
    v81 = v15;
    if (v15) {
      uint64_t v16 = [v15 intValue];
    }
    else {
      uint64_t v16 = 0xFFFFFFFFLL;
    }
    v24 = [v12 containerPath];
    v25 = [(MCMCommand *)v2 context];
    uint64_t v26 = [v25 containerFactory];
    v27 = v12;
    v28 = (void *)v26;
    v83 = v27;
    v29 = [v27 containerIdentity];
    v93 = v13;
    id v94 = v24;
    v30 = [v28 createStagedContainerForContainerIdentity:v29 finalContainerPath:&v94 dataProtectionClass:v16 error:&v93];
    v20 = (MCMError *)v94;

    v11 = v93;
    if (v30)
    {
      v85 = v30;
      v31 = [v30 containerPath];
      v77 = v20;
      uint64_t v32 = [(MCMError *)v20 containerRootURL];
      v87 = v31;
      v86 = [v31 containerRootURL];
      uint64_t v33 = +[MCMContainerCacheEntry birthtimeForURL:v32];
      if (v33 | v34)
      {
        uint64_t v38 = v33;
        uint64_t v40 = v34;
      }
      else
      {
        v35 = +[MCMFileManager defaultManager];
        id v92 = 0;
        v36 = [v35 fsNodeOfURL:v32 followSymlinks:0 error:&v92];
        v37 = (MCMError *)v92;

        if (v36)
        {
          uint64_t v38 = [v36 birthtime];
          uint64_t v40 = v39;
        }
        else
        {
          v48 = container_log_handle_for_category();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v99 = v32;
            __int16 v100 = 2112;
            v101 = v37;
            _os_log_error_impl(&dword_1D7739000, v48, OS_LOG_TYPE_ERROR, "Could not read fs node for old container at [%@] (non-fatal); error = %@",
              buf,
              0x16u);
          }

          uint64_t v38 = 0;
          uint64_t v40 = 0;
        }
      }
      if (v38 | v40) {
        +[MCMContainerCacheEntry setBirthtime:forURL:](MCMContainerCacheEntry, "setBirthtime:forURL:", v38, v40, v86);
      }
      v78 = v2;
      v49 = +[MCMFileManager defaultManager];
      id v91 = 0;
      v80 = (void *)v32;
      char v50 = [v49 replaceItemAtDestinationURL:v32 withSourceURL:v86 swapped:&v97 error:&v91];
      id v51 = v91;

      if ((v50 & 1) == 0)
      {
        v57 = container_log_handle_for_category();
        v20 = v77;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v99 = (unint64_t)v51;
          _os_log_error_impl(&dword_1D7739000, v57, OS_LOG_TYPE_ERROR, "Failed to swap containers during wipe; error: %@",
            buf,
            0xCu);
        }

        v58 = [MCMError alloc];
        v59 = [(MCMError *)v77 containerRootURL];
        v53 = [(MCMError *)v58 initWithNSError:v51 url:v59 defaultErrorType:15];

        v22 = 0;
        goto LABEL_48;
      }
      v20 = v77;
      v22 = [v85 metadataByChangingContainerPath:v77];
      v90 = v11;
      char v52 = [v22 verifyWithError:&v90];
      v53 = v90;

      if (v52)
      {
        [(MCMCommand *)v2 context];
        v55 = v54 = v53;
        v56 = [v55 containerCache];
        v89 = v54;
        v23 = [v56 addContainerMetadata:v22 error:&v89];
        v11 = v89;

        if (v23)
        {
          v10 = v79;
          goto LABEL_49;
        }
        v53 = [[MCMError alloc] initWithErrorType:45];

        v59 = container_log_handle_for_category();
        v10 = v79;
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
LABEL_48:

          v23 = 0;
          v11 = v53;
LABEL_49:
          if (v87)
          {
            v21 = v51;
            if (v97)
            {
              v75 = (void *)v3;
              v61 = [(MCMCommand *)v2 context];
              v62 = [v61 containerFactory];
              v63 = [v87 containerRootURL];
              v64 = [v87 userIdentity];
              id v88 = 0;
              char v65 = [v62 deleteURL:v63 forUserIdentity:v64 error:&v88];
              v76 = (MCMError *)v88;

              v10 = v79;
              if ((v65 & 1) == 0)
              {
                v66 = container_log_handle_for_category();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  v70 = [v87 containerRootURL];
                  v71 = [v70 path];
                  *(_DWORD *)buf = 138412546;
                  unint64_t v99 = (unint64_t)v71;
                  __int16 v100 = 2112;
                  v101 = v76;
                  _os_log_error_impl(&dword_1D7739000, v66, OS_LOG_TYPE_ERROR, "Failed to remove staging container during wipe: %@; error = %@",
                    buf,
                    0x16u);
                }
              }
              v67 = [MCMCommandOperationReclaimDiskSpace alloc];
              v2 = v78;
              v68 = [(MCMCommand *)v78 context];
              v69 = [(MCMCommandOperationReclaimDiskSpace *)v67 initWithAsynchronously:1 context:v68 resultPromise:0];

              [(MCMCommandOperationReclaimDiskSpace *)v69 execute];
              v18 = v75;
              v20 = v77;
              goto LABEL_28;
            }
          }
          else
          {
            v21 = v51;
          }
          v18 = (void *)v3;
          goto LABEL_28;
        }
        v60 = [v22 containerPath];
        [v60 containerRootURL];
        v73 = v72 = v53;
        v74 = [v73 path];
        *(_DWORD *)buf = 138412802;
        unint64_t v99 = (unint64_t)v22;
        __int16 v100 = 2112;
        v101 = v74;
        __int16 v102 = 2112;
        v103 = v72;
        _os_log_error_impl(&dword_1D7739000, v59, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@; error = %@",
          buf,
          0x20u);

        v53 = v72;
        v10 = v79;
      }
      else
      {
        v59 = container_log_handle_for_category();
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        v60 = [v22 shortDescription];
        *(_DWORD *)buf = 138412546;
        unint64_t v99 = (unint64_t)v60;
        __int16 v100 = 2112;
        v101 = v53;
        _os_log_error_impl(&dword_1D7739000, v59, OS_LOG_TYPE_ERROR, "Failed to verify new metadata; metadata = %@, error = %@",
          buf,
          0x16u);
      }

      goto LABEL_48;
    }
    v18 = (void *)v3;
    v41 = container_log_handle_for_category();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v99 = (unint64_t)v83;
      __int16 v100 = 2112;
      v101 = v20;
      __int16 v102 = 2112;
      v103 = v11;
      _os_log_error_impl(&dword_1D7739000, v41, OS_LOG_TYPE_ERROR, "Failed to create staging container during wipe; metadata: %@, existingContainerPath: %@, error: %@",
        buf,
        0x20u);
    }

    v80 = 0;
LABEL_27:
    v21 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_28;
  }
  v18 = (void *)v3;
  v19 = container_log_handle_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v99 = (unint64_t)v84;
    __int16 v100 = 2112;
    v101 = v13;
    _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Failed to read existing container metadata during wipe; identity: %@, error: %@",
      buf,
      0x16u);
  }

  v83 = 0;
  v20 = 0;
  v80 = 0;
  v81 = 0;
  v21 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v22 = 0;
  v23 = 0;
  v11 = v13;
LABEL_28:
  v44 = v20;
  v45 = container_log_handle_for_category();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v99 = (unint64_t)v11;
    _os_log_impl(&dword_1D7739000, v45, OS_LOG_TYPE_DEFAULT, "Delete content result; error = %@", buf, 0xCu);
  }

  v46 = [[MCMResultBase alloc] initWithError:v11];
  v47 = [(MCMCommand *)v2 resultPromise];
  [v47 completeWithResult:v46];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  uint64_t v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToWipeAnyDataContainer];

  return v4;
}

- (MCMCommandDeleteContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandDeleteContainerContent;
  v9 = [(MCMCommand *)&v13 initWithMessage:v8 context:a4 reply:a5];
  if (v9)
  {
    uint64_t v10 = [v8 containerIdentity];
    containerIdentity = v9->_containerIdentity;
    v9->_containerIdentity = (MCMContainerIdentity *)v10;
  }
  return v9;
}

- (MCMCommandDeleteContainerContent)initWithContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandDeleteContainerContent;
  uint64_t v10 = [(MCMCommand *)&v13 initWithContext:a4 resultPromise:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_containerIdentity, a3);
  }

  return v11;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 12;
}

@end